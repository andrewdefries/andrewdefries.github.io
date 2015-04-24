---
output:
  html_document:
    self_contained: no
---

```r
library(knitr)
knit_hooks$set(webgl = hook_webgl)
cat('<script type="text/javascript">', readLines(system.file('WebGL', 'CanvasMatrix.js', package = 'rgl')), '</script>', sep = '\n')
```

<script type="text/javascript">
CanvasMatrix4=function(m){if(typeof m=='object'){if("length"in m&&m.length>=16){this.load(m[0],m[1],m[2],m[3],m[4],m[5],m[6],m[7],m[8],m[9],m[10],m[11],m[12],m[13],m[14],m[15]);return}else if(m instanceof CanvasMatrix4){this.load(m);return}}this.makeIdentity()};CanvasMatrix4.prototype.load=function(){if(arguments.length==1&&typeof arguments[0]=='object'){var matrix=arguments[0];if("length"in matrix&&matrix.length==16){this.m11=matrix[0];this.m12=matrix[1];this.m13=matrix[2];this.m14=matrix[3];this.m21=matrix[4];this.m22=matrix[5];this.m23=matrix[6];this.m24=matrix[7];this.m31=matrix[8];this.m32=matrix[9];this.m33=matrix[10];this.m34=matrix[11];this.m41=matrix[12];this.m42=matrix[13];this.m43=matrix[14];this.m44=matrix[15];return}if(arguments[0]instanceof CanvasMatrix4){this.m11=matrix.m11;this.m12=matrix.m12;this.m13=matrix.m13;this.m14=matrix.m14;this.m21=matrix.m21;this.m22=matrix.m22;this.m23=matrix.m23;this.m24=matrix.m24;this.m31=matrix.m31;this.m32=matrix.m32;this.m33=matrix.m33;this.m34=matrix.m34;this.m41=matrix.m41;this.m42=matrix.m42;this.m43=matrix.m43;this.m44=matrix.m44;return}}this.makeIdentity()};CanvasMatrix4.prototype.getAsArray=function(){return[this.m11,this.m12,this.m13,this.m14,this.m21,this.m22,this.m23,this.m24,this.m31,this.m32,this.m33,this.m34,this.m41,this.m42,this.m43,this.m44]};CanvasMatrix4.prototype.getAsWebGLFloatArray=function(){return new WebGLFloatArray(this.getAsArray())};CanvasMatrix4.prototype.makeIdentity=function(){this.m11=1;this.m12=0;this.m13=0;this.m14=0;this.m21=0;this.m22=1;this.m23=0;this.m24=0;this.m31=0;this.m32=0;this.m33=1;this.m34=0;this.m41=0;this.m42=0;this.m43=0;this.m44=1};CanvasMatrix4.prototype.transpose=function(){var tmp=this.m12;this.m12=this.m21;this.m21=tmp;tmp=this.m13;this.m13=this.m31;this.m31=tmp;tmp=this.m14;this.m14=this.m41;this.m41=tmp;tmp=this.m23;this.m23=this.m32;this.m32=tmp;tmp=this.m24;this.m24=this.m42;this.m42=tmp;tmp=this.m34;this.m34=this.m43;this.m43=tmp};CanvasMatrix4.prototype.invert=function(){var det=this._determinant4x4();if(Math.abs(det)<1e-8)return null;this._makeAdjoint();this.m11/=det;this.m12/=det;this.m13/=det;this.m14/=det;this.m21/=det;this.m22/=det;this.m23/=det;this.m24/=det;this.m31/=det;this.m32/=det;this.m33/=det;this.m34/=det;this.m41/=det;this.m42/=det;this.m43/=det;this.m44/=det};CanvasMatrix4.prototype.translate=function(x,y,z){if(x==undefined)x=0;if(y==undefined)y=0;if(z==undefined)z=0;var matrix=new CanvasMatrix4();matrix.m41=x;matrix.m42=y;matrix.m43=z;this.multRight(matrix)};CanvasMatrix4.prototype.scale=function(x,y,z){if(x==undefined)x=1;if(z==undefined){if(y==undefined){y=x;z=x}else z=1}else if(y==undefined)y=x;var matrix=new CanvasMatrix4();matrix.m11=x;matrix.m22=y;matrix.m33=z;this.multRight(matrix)};CanvasMatrix4.prototype.rotate=function(angle,x,y,z){angle=angle/180*Math.PI;angle/=2;var sinA=Math.sin(angle);var cosA=Math.cos(angle);var sinA2=sinA*sinA;var length=Math.sqrt(x*x+y*y+z*z);if(length==0){x=0;y=0;z=1}else if(length!=1){x/=length;y/=length;z/=length}var mat=new CanvasMatrix4();if(x==1&&y==0&&z==0){mat.m11=1;mat.m12=0;mat.m13=0;mat.m21=0;mat.m22=1-2*sinA2;mat.m23=2*sinA*cosA;mat.m31=0;mat.m32=-2*sinA*cosA;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==1&&z==0){mat.m11=1-2*sinA2;mat.m12=0;mat.m13=-2*sinA*cosA;mat.m21=0;mat.m22=1;mat.m23=0;mat.m31=2*sinA*cosA;mat.m32=0;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==0&&z==1){mat.m11=1-2*sinA2;mat.m12=2*sinA*cosA;mat.m13=0;mat.m21=-2*sinA*cosA;mat.m22=1-2*sinA2;mat.m23=0;mat.m31=0;mat.m32=0;mat.m33=1;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else{var x2=x*x;var y2=y*y;var z2=z*z;mat.m11=1-2*(y2+z2)*sinA2;mat.m12=2*(x*y*sinA2+z*sinA*cosA);mat.m13=2*(x*z*sinA2-y*sinA*cosA);mat.m21=2*(y*x*sinA2-z*sinA*cosA);mat.m22=1-2*(z2+x2)*sinA2;mat.m23=2*(y*z*sinA2+x*sinA*cosA);mat.m31=2*(z*x*sinA2+y*sinA*cosA);mat.m32=2*(z*y*sinA2-x*sinA*cosA);mat.m33=1-2*(x2+y2)*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}this.multRight(mat)};CanvasMatrix4.prototype.multRight=function(mat){var m11=(this.m11*mat.m11+this.m12*mat.m21+this.m13*mat.m31+this.m14*mat.m41);var m12=(this.m11*mat.m12+this.m12*mat.m22+this.m13*mat.m32+this.m14*mat.m42);var m13=(this.m11*mat.m13+this.m12*mat.m23+this.m13*mat.m33+this.m14*mat.m43);var m14=(this.m11*mat.m14+this.m12*mat.m24+this.m13*mat.m34+this.m14*mat.m44);var m21=(this.m21*mat.m11+this.m22*mat.m21+this.m23*mat.m31+this.m24*mat.m41);var m22=(this.m21*mat.m12+this.m22*mat.m22+this.m23*mat.m32+this.m24*mat.m42);var m23=(this.m21*mat.m13+this.m22*mat.m23+this.m23*mat.m33+this.m24*mat.m43);var m24=(this.m21*mat.m14+this.m22*mat.m24+this.m23*mat.m34+this.m24*mat.m44);var m31=(this.m31*mat.m11+this.m32*mat.m21+this.m33*mat.m31+this.m34*mat.m41);var m32=(this.m31*mat.m12+this.m32*mat.m22+this.m33*mat.m32+this.m34*mat.m42);var m33=(this.m31*mat.m13+this.m32*mat.m23+this.m33*mat.m33+this.m34*mat.m43);var m34=(this.m31*mat.m14+this.m32*mat.m24+this.m33*mat.m34+this.m34*mat.m44);var m41=(this.m41*mat.m11+this.m42*mat.m21+this.m43*mat.m31+this.m44*mat.m41);var m42=(this.m41*mat.m12+this.m42*mat.m22+this.m43*mat.m32+this.m44*mat.m42);var m43=(this.m41*mat.m13+this.m42*mat.m23+this.m43*mat.m33+this.m44*mat.m43);var m44=(this.m41*mat.m14+this.m42*mat.m24+this.m43*mat.m34+this.m44*mat.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.multLeft=function(mat){var m11=(mat.m11*this.m11+mat.m12*this.m21+mat.m13*this.m31+mat.m14*this.m41);var m12=(mat.m11*this.m12+mat.m12*this.m22+mat.m13*this.m32+mat.m14*this.m42);var m13=(mat.m11*this.m13+mat.m12*this.m23+mat.m13*this.m33+mat.m14*this.m43);var m14=(mat.m11*this.m14+mat.m12*this.m24+mat.m13*this.m34+mat.m14*this.m44);var m21=(mat.m21*this.m11+mat.m22*this.m21+mat.m23*this.m31+mat.m24*this.m41);var m22=(mat.m21*this.m12+mat.m22*this.m22+mat.m23*this.m32+mat.m24*this.m42);var m23=(mat.m21*this.m13+mat.m22*this.m23+mat.m23*this.m33+mat.m24*this.m43);var m24=(mat.m21*this.m14+mat.m22*this.m24+mat.m23*this.m34+mat.m24*this.m44);var m31=(mat.m31*this.m11+mat.m32*this.m21+mat.m33*this.m31+mat.m34*this.m41);var m32=(mat.m31*this.m12+mat.m32*this.m22+mat.m33*this.m32+mat.m34*this.m42);var m33=(mat.m31*this.m13+mat.m32*this.m23+mat.m33*this.m33+mat.m34*this.m43);var m34=(mat.m31*this.m14+mat.m32*this.m24+mat.m33*this.m34+mat.m34*this.m44);var m41=(mat.m41*this.m11+mat.m42*this.m21+mat.m43*this.m31+mat.m44*this.m41);var m42=(mat.m41*this.m12+mat.m42*this.m22+mat.m43*this.m32+mat.m44*this.m42);var m43=(mat.m41*this.m13+mat.m42*this.m23+mat.m43*this.m33+mat.m44*this.m43);var m44=(mat.m41*this.m14+mat.m42*this.m24+mat.m43*this.m34+mat.m44*this.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.ortho=function(left,right,bottom,top,near,far){var tx=(left+right)/(left-right);var ty=(top+bottom)/(top-bottom);var tz=(far+near)/(far-near);var matrix=new CanvasMatrix4();matrix.m11=2/(left-right);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=0;matrix.m32=0;matrix.m33=-2/(far-near);matrix.m34=0;matrix.m41=tx;matrix.m42=ty;matrix.m43=tz;matrix.m44=1;this.multRight(matrix)};CanvasMatrix4.prototype.frustum=function(left,right,bottom,top,near,far){var matrix=new CanvasMatrix4();var A=(right+left)/(right-left);var B=(top+bottom)/(top-bottom);var C=-(far+near)/(far-near);var D=-(2*far*near)/(far-near);matrix.m11=(2*near)/(right-left);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2*near/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=A;matrix.m32=B;matrix.m33=C;matrix.m34=-1;matrix.m41=0;matrix.m42=0;matrix.m43=D;matrix.m44=0;this.multRight(matrix)};CanvasMatrix4.prototype.perspective=function(fovy,aspect,zNear,zFar){var top=Math.tan(fovy*Math.PI/360)*zNear;var bottom=-top;var left=aspect*bottom;var right=aspect*top;this.frustum(left,right,bottom,top,zNear,zFar)};CanvasMatrix4.prototype.lookat=function(eyex,eyey,eyez,centerx,centery,centerz,upx,upy,upz){var matrix=new CanvasMatrix4();var zx=eyex-centerx;var zy=eyey-centery;var zz=eyez-centerz;var mag=Math.sqrt(zx*zx+zy*zy+zz*zz);if(mag){zx/=mag;zy/=mag;zz/=mag}var yx=upx;var yy=upy;var yz=upz;xx=yy*zz-yz*zy;xy=-yx*zz+yz*zx;xz=yx*zy-yy*zx;yx=zy*xz-zz*xy;yy=-zx*xz+zz*xx;yx=zx*xy-zy*xx;mag=Math.sqrt(xx*xx+xy*xy+xz*xz);if(mag){xx/=mag;xy/=mag;xz/=mag}mag=Math.sqrt(yx*yx+yy*yy+yz*yz);if(mag){yx/=mag;yy/=mag;yz/=mag}matrix.m11=xx;matrix.m12=xy;matrix.m13=xz;matrix.m14=0;matrix.m21=yx;matrix.m22=yy;matrix.m23=yz;matrix.m24=0;matrix.m31=zx;matrix.m32=zy;matrix.m33=zz;matrix.m34=0;matrix.m41=0;matrix.m42=0;matrix.m43=0;matrix.m44=1;matrix.translate(-eyex,-eyey,-eyez);this.multRight(matrix)};CanvasMatrix4.prototype._determinant2x2=function(a,b,c,d){return a*d-b*c};CanvasMatrix4.prototype._determinant3x3=function(a1,a2,a3,b1,b2,b3,c1,c2,c3){return a1*this._determinant2x2(b2,b3,c2,c3)-b1*this._determinant2x2(a2,a3,c2,c3)+c1*this._determinant2x2(a2,a3,b2,b3)};CanvasMatrix4.prototype._determinant4x4=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;return a1*this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4)-b1*this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4)+c1*this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4)-d1*this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4)};CanvasMatrix4.prototype._makeAdjoint=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;this.m11=this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4);this.m21=-this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4);this.m31=this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4);this.m41=-this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4);this.m12=-this._determinant3x3(b1,b3,b4,c1,c3,c4,d1,d3,d4);this.m22=this._determinant3x3(a1,a3,a4,c1,c3,c4,d1,d3,d4);this.m32=-this._determinant3x3(a1,a3,a4,b1,b3,b4,d1,d3,d4);this.m42=this._determinant3x3(a1,a3,a4,b1,b3,b4,c1,c3,c4);this.m13=this._determinant3x3(b1,b2,b4,c1,c2,c4,d1,d2,d4);this.m23=-this._determinant3x3(a1,a2,a4,c1,c2,c4,d1,d2,d4);this.m33=this._determinant3x3(a1,a2,a4,b1,b2,b4,d1,d2,d4);this.m43=-this._determinant3x3(a1,a2,a4,b1,b2,b4,c1,c2,c4);this.m14=-this._determinant3x3(b1,b2,b3,c1,c2,c3,d1,d2,d3);this.m24=this._determinant3x3(a1,a2,a3,c1,c2,c3,d1,d2,d3);this.m34=-this._determinant3x3(a1,a2,a3,b1,b2,b3,d1,d2,d3);this.m44=this._determinant3x3(a1,a2,a3,b1,b2,b3,c1,c2,c3)}
</script>

This works fine.


```r
x <- sort(rnorm(1000))
y <- rnorm(1000)
z <- rnorm(1000) + atan2(x,y)
plot3d(x, y, z, col=rainbow(1000))
```

<canvas id="testgltextureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** points object 7 ****** -->
<script id="testglvshader7" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
gl_PointSize = 3.;
vCol = aCol;
}
</script>
<script id="testglfshader7" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 9 ****** -->
<script id="testglvshader9" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader9" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 10 ****** -->
<script id="testglvshader10" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader10" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 11 ****** -->
<script id="testglvshader11" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader11" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 12 ****** -->
<script id="testglvshader12" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader12" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 13 ****** -->
<script id="testglvshader13" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader13" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 14 ****** -->
<script id="testglvshader14" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader14" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 15 ****** -->
<script id="testglvshader15" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader15" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 16 ****** -->
<script id="testglvshader16" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader16" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 17 ****** -->
<script id="testglvshader17" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader17" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 18 ****** -->
<script id="testglvshader18" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader18" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testglwebGLStart() {
var debug = function(msg) {
document.getElementById("testgldebug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testglcanvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 1;
zoom[1] = 1;
fov[1] = 30;
userMatrix[1] = new CanvasMatrix4();
userMatrix[1].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
function drawTextToCanvas(text, cex) {
var canvasX, canvasY;
var textX, textY;
var textHeight = 20 * cex;
var textColour = "white";
var fontFamily = "Arial";
var backgroundColour = "rgba(0,0,0,0)";
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
ctx.font = textHeight+"px "+fontFamily;
canvasX = 1;
var widths = [];
for (var i = 0; i < text.length; i++)  {
widths[i] = ctx.measureText(text[i]).width;
canvasX = (widths[i] > canvasX) ? widths[i] : canvasX;
}	  
canvasX = getPowerOfTwo(canvasX);
var offset = 2*textHeight; // offset to first baseline
var skip = 2*textHeight;   // skip between baselines	  
canvasY = getPowerOfTwo(offset + text.length*skip);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.fillStyle = backgroundColour;
ctx.fillRect(0, 0, ctx.canvas.width, ctx.canvas.height);
ctx.fillStyle = textColour;
ctx.textAlign = "left";
ctx.textBaseline = "alphabetic";
ctx.font = textHeight+"px "+fontFamily;
for(var i = 0; i < text.length; i++) {
textY = i*skip + offset;
ctx.fillText(text[i], 0,  textY);
}
return {canvasX:canvasX, canvasY:canvasY,
widths:widths, textHeight:textHeight,
offset:offset, skip:skip};
}
// ****** points object 7 ******
var prog7  = gl.createProgram();
gl.attachShader(prog7, getShader( gl, "testglvshader7" ));
gl.attachShader(prog7, getShader( gl, "testglfshader7" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog7, 0, "aPos");
gl.bindAttribLocation(prog7, 1, "aCol");
gl.linkProgram(prog7);
var v=new Float32Array([
-3.051984, -0.1896476, -1.551021, 1, 0, 0, 1,
-2.96276, 0.9615445, -1.774192, 1, 0.007843138, 0, 1,
-2.67787, -1.401374, -2.206115, 1, 0.01176471, 0, 1,
-2.655936, -0.0879759, -0.8482027, 1, 0.01960784, 0, 1,
-2.462913, 0.8472752, -2.18934, 1, 0.02352941, 0, 1,
-2.454848, 0.7252198, -1.656322, 1, 0.03137255, 0, 1,
-2.45411, -1.629273, -2.456113, 1, 0.03529412, 0, 1,
-2.448552, 1.21372, -1.456014, 1, 0.04313726, 0, 1,
-2.399059, -2.485108, -1.842359, 1, 0.04705882, 0, 1,
-2.347161, 0.8253284, -1.541721, 1, 0.05490196, 0, 1,
-2.34563, 1.591095, -0.9310421, 1, 0.05882353, 0, 1,
-2.343305, 1.121565, -1.73724, 1, 0.06666667, 0, 1,
-2.315326, 0.004206115, -1.398833, 1, 0.07058824, 0, 1,
-2.302959, 1.660132, -1.879139, 1, 0.07843138, 0, 1,
-2.22989, -1.717626, -3.732102, 1, 0.08235294, 0, 1,
-2.207114, 0.8366043, -2.857015, 1, 0.09019608, 0, 1,
-2.172845, -0.3900618, -1.149345, 1, 0.09411765, 0, 1,
-2.163638, -0.3182983, -1.699551, 1, 0.1019608, 0, 1,
-2.135455, 0.03220454, -2.618534, 1, 0.1098039, 0, 1,
-2.13417, 1.820156, -0.3453818, 1, 0.1137255, 0, 1,
-2.119383, -0.2003432, -0.8216298, 1, 0.1215686, 0, 1,
-2.11761, 1.154548, 1.083981, 1, 0.1254902, 0, 1,
-2.077478, 1.398824, 0.06503683, 1, 0.1333333, 0, 1,
-2.073456, -0.4228, -1.89443, 1, 0.1372549, 0, 1,
-2.064466, 0.008153973, -2.994691, 1, 0.145098, 0, 1,
-1.980355, -0.4537397, -1.707575, 1, 0.1490196, 0, 1,
-1.952926, 1.448478, -1.343181, 1, 0.1568628, 0, 1,
-1.919774, -0.8349341, -2.586073, 1, 0.1607843, 0, 1,
-1.919495, -1.788725, -3.029552, 1, 0.1686275, 0, 1,
-1.908724, -0.4958682, -1.707811, 1, 0.172549, 0, 1,
-1.88265, -1.478951, -2.316872, 1, 0.1803922, 0, 1,
-1.839952, -2.104531, -2.573255, 1, 0.1843137, 0, 1,
-1.784831, 0.6851937, -1.009903, 1, 0.1921569, 0, 1,
-1.738663, 0.594353, -2.318201, 1, 0.1960784, 0, 1,
-1.725147, -0.8555558, -3.580256, 1, 0.2039216, 0, 1,
-1.724231, 0.9659086, -0.8073278, 1, 0.2117647, 0, 1,
-1.688893, 0.6548489, -1.944793, 1, 0.2156863, 0, 1,
-1.687707, 1.494144, 0.4708363, 1, 0.2235294, 0, 1,
-1.676445, -0.7854117, -2.02829, 1, 0.227451, 0, 1,
-1.671279, 0.03568204, 0.003695399, 1, 0.2352941, 0, 1,
-1.647085, -0.08944462, -0.778249, 1, 0.2392157, 0, 1,
-1.638938, -0.2438753, -0.714314, 1, 0.2470588, 0, 1,
-1.632386, 0.0924501, -3.04077, 1, 0.2509804, 0, 1,
-1.615554, 0.9892573, -1.385915, 1, 0.2588235, 0, 1,
-1.589842, 0.8403983, -0.3572804, 1, 0.2627451, 0, 1,
-1.583761, -1.151992, -1.305633, 1, 0.2705882, 0, 1,
-1.577085, 1.006781, -0.3805301, 1, 0.2745098, 0, 1,
-1.575597, -0.03329805, -1.584461, 1, 0.282353, 0, 1,
-1.574948, 1.74225, 0.8288131, 1, 0.2862745, 0, 1,
-1.571384, 0.005156558, -2.270965, 1, 0.2941177, 0, 1,
-1.5683, -1.571749, -1.793588, 1, 0.3019608, 0, 1,
-1.517704, -0.5657475, -3.259093, 1, 0.3058824, 0, 1,
-1.514202, -0.3311643, -2.750415, 1, 0.3137255, 0, 1,
-1.51166, -1.633193, -4.076902, 1, 0.3176471, 0, 1,
-1.495001, -0.4468458, -3.007472, 1, 0.3254902, 0, 1,
-1.489102, -0.8400695, -2.345845, 1, 0.3294118, 0, 1,
-1.482502, 0.624405, -2.297019, 1, 0.3372549, 0, 1,
-1.479092, 0.3779341, 0.7527485, 1, 0.3411765, 0, 1,
-1.470681, -1.751986, -1.273943, 1, 0.3490196, 0, 1,
-1.468904, 0.02364002, -2.867686, 1, 0.3529412, 0, 1,
-1.465767, 0.1787718, -2.149863, 1, 0.3607843, 0, 1,
-1.454272, -0.9216994, -2.976923, 1, 0.3647059, 0, 1,
-1.453828, 0.3018212, -1.426845, 1, 0.372549, 0, 1,
-1.452877, 0.4960483, 0.01581785, 1, 0.3764706, 0, 1,
-1.447468, 1.739506, 0.1032049, 1, 0.3843137, 0, 1,
-1.44287, -2.860964, -4.836728, 1, 0.3882353, 0, 1,
-1.442778, -0.8358858, -1.483606, 1, 0.3960784, 0, 1,
-1.423907, -1.77902, -2.793291, 1, 0.4039216, 0, 1,
-1.419793, 0.0920649, -2.42311, 1, 0.4078431, 0, 1,
-1.419376, 0.3499244, -2.712965, 1, 0.4156863, 0, 1,
-1.403905, -0.07606783, -1.414146, 1, 0.4196078, 0, 1,
-1.399447, -0.7917128, -3.447421, 1, 0.427451, 0, 1,
-1.397852, -0.4396919, 0.1508143, 1, 0.4313726, 0, 1,
-1.397655, 0.6016985, -0.9385597, 1, 0.4392157, 0, 1,
-1.394068, -1.940369, -2.413017, 1, 0.4431373, 0, 1,
-1.391942, 0.3688267, -0.481542, 1, 0.4509804, 0, 1,
-1.378723, 2.369514, -0.2194044, 1, 0.454902, 0, 1,
-1.361786, -0.2690409, -1.502698, 1, 0.4627451, 0, 1,
-1.344221, -1.257843, -2.933904, 1, 0.4666667, 0, 1,
-1.34222, 0.2645741, -0.8894814, 1, 0.4745098, 0, 1,
-1.33615, 0.2370535, -1.55566, 1, 0.4784314, 0, 1,
-1.330158, 1.825215, 0.9957594, 1, 0.4862745, 0, 1,
-1.32971, -1.540238, -2.136073, 1, 0.4901961, 0, 1,
-1.321666, 1.417875, -0.4670439, 1, 0.4980392, 0, 1,
-1.314543, -0.2605849, -1.155838, 1, 0.5058824, 0, 1,
-1.311235, -1.128089, -3.360837, 1, 0.509804, 0, 1,
-1.303627, -0.1560814, -1.890368, 1, 0.5176471, 0, 1,
-1.295136, -0.8310897, -2.350951, 1, 0.5215687, 0, 1,
-1.29506, -0.2405009, -2.943536, 1, 0.5294118, 0, 1,
-1.27532, 0.2880608, -1.159645, 1, 0.5333334, 0, 1,
-1.267867, 0.9414526, -1.318599, 1, 0.5411765, 0, 1,
-1.266131, -0.9445425, -2.092582, 1, 0.5450981, 0, 1,
-1.260108, -0.8229993, -2.860263, 1, 0.5529412, 0, 1,
-1.256178, -1.338858, -1.837596, 1, 0.5568628, 0, 1,
-1.25296, 1.243952, -1.828245, 1, 0.5647059, 0, 1,
-1.248316, -1.914643, -1.89527, 1, 0.5686275, 0, 1,
-1.246096, 0.2396035, -2.256003, 1, 0.5764706, 0, 1,
-1.237469, 0.3495064, 0.380982, 1, 0.5803922, 0, 1,
-1.236344, -0.9223124, -2.922437, 1, 0.5882353, 0, 1,
-1.227587, 0.5671224, -1.88918, 1, 0.5921569, 0, 1,
-1.222512, -0.1088841, -2.900918, 1, 0.6, 0, 1,
-1.220525, -0.1241992, -2.800614, 1, 0.6078432, 0, 1,
-1.22017, -1.680985, -2.694863, 1, 0.6117647, 0, 1,
-1.212182, -0.2095672, -2.032779, 1, 0.6196079, 0, 1,
-1.211611, 1.495192, 0.8574489, 1, 0.6235294, 0, 1,
-1.199442, 0.1872039, -1.214538, 1, 0.6313726, 0, 1,
-1.198593, 1.379149, -0.6027305, 1, 0.6352941, 0, 1,
-1.188099, 0.05450952, -1.843534, 1, 0.6431373, 0, 1,
-1.188011, 0.7442914, -1.451019, 1, 0.6470588, 0, 1,
-1.183933, 1.883732, -1.925601, 1, 0.654902, 0, 1,
-1.176677, -0.1148715, -0.4532773, 1, 0.6588235, 0, 1,
-1.165026, -1.55139, -2.38592, 1, 0.6666667, 0, 1,
-1.164406, -0.162369, -2.734348, 1, 0.6705883, 0, 1,
-1.164084, 0.5492339, -1.685055, 1, 0.6784314, 0, 1,
-1.16126, 1.099989, -1.035335, 1, 0.682353, 0, 1,
-1.158509, 0.6717843, -0.8487067, 1, 0.6901961, 0, 1,
-1.158071, 0.6912435, 0.2272139, 1, 0.6941177, 0, 1,
-1.157701, -0.3261041, -0.8910037, 1, 0.7019608, 0, 1,
-1.148026, -0.4077426, -2.343653, 1, 0.7098039, 0, 1,
-1.146375, 0.7489246, -0.6294321, 1, 0.7137255, 0, 1,
-1.14567, 0.5412376, -2.164197, 1, 0.7215686, 0, 1,
-1.142076, -1.032833, -2.196325, 1, 0.7254902, 0, 1,
-1.141123, -0.657782, -2.033362, 1, 0.7333333, 0, 1,
-1.138799, 0.9423512, -2.775403, 1, 0.7372549, 0, 1,
-1.134932, 1.425708, -0.8897892, 1, 0.7450981, 0, 1,
-1.129363, -0.113905, -1.171742, 1, 0.7490196, 0, 1,
-1.128223, -0.3509735, -2.512258, 1, 0.7568628, 0, 1,
-1.121577, -0.6597969, -1.768223, 1, 0.7607843, 0, 1,
-1.120555, 0.6273004, 0.3372522, 1, 0.7686275, 0, 1,
-1.119851, 1.119108, 0.380104, 1, 0.772549, 0, 1,
-1.118199, -1.022241, -1.712385, 1, 0.7803922, 0, 1,
-1.115331, -1.760141, -1.922393, 1, 0.7843137, 0, 1,
-1.111417, 0.06853858, -0.7873389, 1, 0.7921569, 0, 1,
-1.110647, 0.007620096, -0.6998004, 1, 0.7960784, 0, 1,
-1.101688, 1.305231, -1.005957, 1, 0.8039216, 0, 1,
-1.099049, -2.063077, -3.974412, 1, 0.8117647, 0, 1,
-1.097195, 2.62723, -1.033546, 1, 0.8156863, 0, 1,
-1.097157, -1.094617, -3.048845, 1, 0.8235294, 0, 1,
-1.090758, 0.9795191, -2.103559, 1, 0.827451, 0, 1,
-1.087258, 1.399318, -0.9350622, 1, 0.8352941, 0, 1,
-1.080254, -1.500042, -3.180623, 1, 0.8392157, 0, 1,
-1.076222, 0.1848618, -0.9566673, 1, 0.8470588, 0, 1,
-1.07517, -0.02991356, -1.095748, 1, 0.8509804, 0, 1,
-1.073329, -0.8652874, -3.014478, 1, 0.8588235, 0, 1,
-1.069383, 0.6097975, -1.873043, 1, 0.8627451, 0, 1,
-1.059654, -0.01678338, -2.031229, 1, 0.8705882, 0, 1,
-1.058857, 0.1619315, -0.6224121, 1, 0.8745098, 0, 1,
-1.046033, -0.1208365, -1.755275, 1, 0.8823529, 0, 1,
-1.043789, 0.190479, -0.0446561, 1, 0.8862745, 0, 1,
-1.043673, -2.06349, -2.704747, 1, 0.8941177, 0, 1,
-1.040493, 0.2008203, -0.2484109, 1, 0.8980392, 0, 1,
-1.037837, -0.4950787, -2.215341, 1, 0.9058824, 0, 1,
-1.036237, 0.3086776, -1.599075, 1, 0.9137255, 0, 1,
-1.031663, 0.4423992, 0.1869657, 1, 0.9176471, 0, 1,
-1.022324, -1.449864, -3.503281, 1, 0.9254902, 0, 1,
-1.019962, 0.3826484, -2.08746, 1, 0.9294118, 0, 1,
-1.018498, -0.2920462, -2.333005, 1, 0.9372549, 0, 1,
-1.016304, -0.3451375, -1.327152, 1, 0.9411765, 0, 1,
-1.009887, -0.6265802, -1.424532, 1, 0.9490196, 0, 1,
-1.007328, 1.05669, -0.565567, 1, 0.9529412, 0, 1,
-1.006297, 0.01569135, -1.901706, 1, 0.9607843, 0, 1,
-1.005091, 1.708526, -0.412208, 1, 0.9647059, 0, 1,
-0.9998958, -1.235387, -3.250654, 1, 0.972549, 0, 1,
-0.9969464, -0.2916709, -2.532974, 1, 0.9764706, 0, 1,
-0.9942542, 0.5402365, -0.7094914, 1, 0.9843137, 0, 1,
-0.9937584, -0.6663602, -3.359361, 1, 0.9882353, 0, 1,
-0.9887079, -0.34973, -4.687042, 1, 0.9960784, 0, 1,
-0.9856598, 0.121076, -3.257103, 0.9960784, 1, 0, 1,
-0.9828929, -0.07173494, -1.02246, 0.9921569, 1, 0, 1,
-0.9827877, -0.8936543, -4.020738, 0.9843137, 1, 0, 1,
-0.9762431, -0.6478253, -2.246882, 0.9803922, 1, 0, 1,
-0.9696143, -0.3054413, -0.6948172, 0.972549, 1, 0, 1,
-0.9621017, -0.1549829, -1.194645, 0.9686275, 1, 0, 1,
-0.9611267, 0.9182389, 0.0464815, 0.9607843, 1, 0, 1,
-0.9523824, 1.243852, 0.004392476, 0.9568627, 1, 0, 1,
-0.9491475, -0.2957037, -3.102047, 0.9490196, 1, 0, 1,
-0.9439334, 0.9377708, -0.9872499, 0.945098, 1, 0, 1,
-0.9433677, 0.6108088, -0.7771084, 0.9372549, 1, 0, 1,
-0.9425697, 0.1073451, -2.500251, 0.9333333, 1, 0, 1,
-0.9391241, 0.7034967, 0.09189299, 0.9254902, 1, 0, 1,
-0.9390944, -0.6403717, -1.668437, 0.9215686, 1, 0, 1,
-0.9383444, -1.811797, -2.590586, 0.9137255, 1, 0, 1,
-0.9365231, -1.308503, -3.400856, 0.9098039, 1, 0, 1,
-0.9357302, 1.604634, -0.6244993, 0.9019608, 1, 0, 1,
-0.9343635, -0.2262248, -1.55196, 0.8941177, 1, 0, 1,
-0.9333998, 0.203047, -1.874658, 0.8901961, 1, 0, 1,
-0.9327947, -0.2375495, -0.8510323, 0.8823529, 1, 0, 1,
-0.9327631, 0.1377529, -2.535277, 0.8784314, 1, 0, 1,
-0.9310209, 1.489245, 0.0125542, 0.8705882, 1, 0, 1,
-0.9303534, -0.6996657, -2.028741, 0.8666667, 1, 0, 1,
-0.9295967, -1.909765, -3.380177, 0.8588235, 1, 0, 1,
-0.9222662, 0.1700169, -1.3771, 0.854902, 1, 0, 1,
-0.9211139, 1.017651, -1.270373, 0.8470588, 1, 0, 1,
-0.9187338, -1.928555, -2.7813, 0.8431373, 1, 0, 1,
-0.9183874, 0.9328033, -0.06650894, 0.8352941, 1, 0, 1,
-0.9138169, 1.016755, -0.5518374, 0.8313726, 1, 0, 1,
-0.9131014, 0.007433076, -0.5517086, 0.8235294, 1, 0, 1,
-0.9076505, -1.082537, -0.7073736, 0.8196079, 1, 0, 1,
-0.8983105, 0.7061475, -0.5373407, 0.8117647, 1, 0, 1,
-0.8977969, 1.421932, 0.1677501, 0.8078431, 1, 0, 1,
-0.8970187, -0.8404434, -2.823649, 0.8, 1, 0, 1,
-0.8964798, -0.755274, -4.180849, 0.7921569, 1, 0, 1,
-0.8959846, 0.807537, -1.899842, 0.7882353, 1, 0, 1,
-0.8837419, 0.9284192, -0.01553263, 0.7803922, 1, 0, 1,
-0.8769912, -0.819914, -2.153398, 0.7764706, 1, 0, 1,
-0.8741242, 0.3095657, -1.82141, 0.7686275, 1, 0, 1,
-0.8683198, -1.21411, -3.936243, 0.7647059, 1, 0, 1,
-0.8661713, 0.7256395, -0.7878792, 0.7568628, 1, 0, 1,
-0.8653186, -0.59752, -2.581855, 0.7529412, 1, 0, 1,
-0.8625708, 0.4395622, -3.126897, 0.7450981, 1, 0, 1,
-0.8603283, -1.053798, -0.7201875, 0.7411765, 1, 0, 1,
-0.8580817, -0.8668179, -3.284111, 0.7333333, 1, 0, 1,
-0.8446764, 1.83988, -0.5846217, 0.7294118, 1, 0, 1,
-0.841392, -0.1792198, -2.587018, 0.7215686, 1, 0, 1,
-0.8392276, -0.09699132, -1.822728, 0.7176471, 1, 0, 1,
-0.8335801, 0.2214308, -1.401402, 0.7098039, 1, 0, 1,
-0.8315614, 1.198476, -1.112243, 0.7058824, 1, 0, 1,
-0.8308702, -0.7200148, -1.754983, 0.6980392, 1, 0, 1,
-0.8252054, -0.3518681, -0.5177935, 0.6901961, 1, 0, 1,
-0.8251966, 1.324007, 0.8432608, 0.6862745, 1, 0, 1,
-0.8184362, -0.6822723, -1.627441, 0.6784314, 1, 0, 1,
-0.7931377, 0.3144442, -2.537735, 0.6745098, 1, 0, 1,
-0.7929854, 0.831234, -0.6021064, 0.6666667, 1, 0, 1,
-0.7881329, -0.01864041, -1.01038, 0.6627451, 1, 0, 1,
-0.7859855, 1.708803, 1.633576, 0.654902, 1, 0, 1,
-0.781574, 0.5440454, -1.860351, 0.6509804, 1, 0, 1,
-0.7786404, -0.5421065, -2.795463, 0.6431373, 1, 0, 1,
-0.7755948, 1.231349, -0.8638519, 0.6392157, 1, 0, 1,
-0.7727866, 2.211257, -1.260577, 0.6313726, 1, 0, 1,
-0.7673306, 0.8305802, -1.101258, 0.627451, 1, 0, 1,
-0.7606302, 0.294549, -0.9925902, 0.6196079, 1, 0, 1,
-0.7524036, -0.3967544, -3.776848, 0.6156863, 1, 0, 1,
-0.7499771, -0.1711348, -2.678338, 0.6078432, 1, 0, 1,
-0.7472993, 0.6424532, -1.586108, 0.6039216, 1, 0, 1,
-0.746426, 0.9916908, -1.115972, 0.5960785, 1, 0, 1,
-0.7455609, -0.08828244, -1.880976, 0.5882353, 1, 0, 1,
-0.7349379, -1.01536, -3.341243, 0.5843138, 1, 0, 1,
-0.730682, 0.9758793, -0.625545, 0.5764706, 1, 0, 1,
-0.7279415, 2.238817, -0.6239337, 0.572549, 1, 0, 1,
-0.7261731, 0.4722725, -0.8758795, 0.5647059, 1, 0, 1,
-0.7204316, -0.2395793, -0.9712791, 0.5607843, 1, 0, 1,
-0.7199092, 1.08564, -0.7574983, 0.5529412, 1, 0, 1,
-0.7185635, -1.149298, -3.255468, 0.5490196, 1, 0, 1,
-0.7171467, 0.6909606, -1.505917, 0.5411765, 1, 0, 1,
-0.7145478, 1.690536, -0.6076002, 0.5372549, 1, 0, 1,
-0.7133738, -0.425916, -1.067868, 0.5294118, 1, 0, 1,
-0.7118115, 1.064922, -0.7076656, 0.5254902, 1, 0, 1,
-0.7106301, 2.597958, -1.05812, 0.5176471, 1, 0, 1,
-0.7082498, -1.169865, -3.563112, 0.5137255, 1, 0, 1,
-0.7042764, 2.374696, -0.3615033, 0.5058824, 1, 0, 1,
-0.7016867, -1.230017, -2.87582, 0.5019608, 1, 0, 1,
-0.7011191, 0.3136316, -0.9692803, 0.4941176, 1, 0, 1,
-0.7004102, 0.8567927, -1.464495, 0.4862745, 1, 0, 1,
-0.695766, 1.113046, -1.341413, 0.4823529, 1, 0, 1,
-0.6928485, -1.807557, -2.849726, 0.4745098, 1, 0, 1,
-0.6923423, 1.348173, -0.2790411, 0.4705882, 1, 0, 1,
-0.6878362, 0.9864964, 0.5898057, 0.4627451, 1, 0, 1,
-0.678788, -1.530894, -2.974785, 0.4588235, 1, 0, 1,
-0.6733605, 0.5424246, -2.561036, 0.4509804, 1, 0, 1,
-0.6724066, 0.1220882, -1.498423, 0.4470588, 1, 0, 1,
-0.6666646, 0.5843919, 0.2765438, 0.4392157, 1, 0, 1,
-0.6665392, 0.1020962, -2.436294, 0.4352941, 1, 0, 1,
-0.6646062, -0.0547505, -2.063118, 0.427451, 1, 0, 1,
-0.6613376, -1.128851, -3.280725, 0.4235294, 1, 0, 1,
-0.6580843, 0.6493746, -0.9539306, 0.4156863, 1, 0, 1,
-0.6576351, 1.257789, 1.047853, 0.4117647, 1, 0, 1,
-0.6571635, -0.7758605, -2.12895, 0.4039216, 1, 0, 1,
-0.6536331, -0.4378128, -1.721044, 0.3960784, 1, 0, 1,
-0.6526121, -0.296566, -1.940984, 0.3921569, 1, 0, 1,
-0.6485922, 0.008852253, -1.688918, 0.3843137, 1, 0, 1,
-0.6466963, -1.441856, -1.68566, 0.3803922, 1, 0, 1,
-0.6449948, -0.3482473, -0.9440301, 0.372549, 1, 0, 1,
-0.6445909, -0.1618935, -3.209885, 0.3686275, 1, 0, 1,
-0.6434646, 0.03443102, -0.4034944, 0.3607843, 1, 0, 1,
-0.6428023, 0.004417018, -1.491806, 0.3568628, 1, 0, 1,
-0.6413711, -0.3252695, -1.91459, 0.3490196, 1, 0, 1,
-0.6293088, -0.8844602, -2.85429, 0.345098, 1, 0, 1,
-0.6290697, -0.1416912, -2.633691, 0.3372549, 1, 0, 1,
-0.6276758, -1.003943, -4.731281, 0.3333333, 1, 0, 1,
-0.6130572, -0.4792936, -1.057186, 0.3254902, 1, 0, 1,
-0.6106527, 0.04120303, 0.9516537, 0.3215686, 1, 0, 1,
-0.6103386, 0.06377257, 0.786914, 0.3137255, 1, 0, 1,
-0.5905989, -0.7017405, -0.1545731, 0.3098039, 1, 0, 1,
-0.5869378, -0.8062033, -3.598231, 0.3019608, 1, 0, 1,
-0.5868463, 1.431168, -1.945912, 0.2941177, 1, 0, 1,
-0.584341, 0.9210101, -0.3648482, 0.2901961, 1, 0, 1,
-0.5835847, 0.5865844, 0.003461027, 0.282353, 1, 0, 1,
-0.5791592, -0.7733243, -2.573966, 0.2784314, 1, 0, 1,
-0.5722309, -1.393587, -2.861775, 0.2705882, 1, 0, 1,
-0.5714509, -0.5251577, -3.441554, 0.2666667, 1, 0, 1,
-0.5666994, 0.3122448, -1.550597, 0.2588235, 1, 0, 1,
-0.5656195, -0.498593, -4.144475, 0.254902, 1, 0, 1,
-0.5650071, -1.22052, -4.099779, 0.2470588, 1, 0, 1,
-0.5643024, 0.8945075, -0.8911017, 0.2431373, 1, 0, 1,
-0.5641848, -1.208502, -2.429544, 0.2352941, 1, 0, 1,
-0.5641741, -1.887152, -3.339909, 0.2313726, 1, 0, 1,
-0.5637391, 0.1277546, -1.491126, 0.2235294, 1, 0, 1,
-0.5591063, 2.528589, 0.6680801, 0.2196078, 1, 0, 1,
-0.5578372, 0.8110019, -2.08561, 0.2117647, 1, 0, 1,
-0.5558432, -2.829761, -4.39402, 0.2078431, 1, 0, 1,
-0.5545803, 1.185329, -1.210745, 0.2, 1, 0, 1,
-0.5516931, 1.667414, -0.3611284, 0.1921569, 1, 0, 1,
-0.5492339, 0.2694771, -2.533082, 0.1882353, 1, 0, 1,
-0.5440522, -0.5807827, -1.12799, 0.1803922, 1, 0, 1,
-0.5365846, -0.2915305, -2.553458, 0.1764706, 1, 0, 1,
-0.5364046, 1.485805, 1.411526, 0.1686275, 1, 0, 1,
-0.5353977, 0.7492439, -0.2335759, 0.1647059, 1, 0, 1,
-0.5316389, -0.07012209, -1.554381, 0.1568628, 1, 0, 1,
-0.5264348, -0.8447509, -2.665056, 0.1529412, 1, 0, 1,
-0.525869, 0.5262788, -2.71752, 0.145098, 1, 0, 1,
-0.525415, 1.441183, -0.02175416, 0.1411765, 1, 0, 1,
-0.5229092, -0.2713493, -1.109955, 0.1333333, 1, 0, 1,
-0.5214229, 0.03008425, -1.848781, 0.1294118, 1, 0, 1,
-0.5213075, 0.1858192, -0.8542975, 0.1215686, 1, 0, 1,
-0.5202878, -0.1987308, -2.638004, 0.1176471, 1, 0, 1,
-0.5170919, -0.3151383, -1.578419, 0.1098039, 1, 0, 1,
-0.5150386, 0.3746687, -1.358824, 0.1058824, 1, 0, 1,
-0.5148256, 0.2979646, -0.8178773, 0.09803922, 1, 0, 1,
-0.514414, 0.58619, 1.350595, 0.09019608, 1, 0, 1,
-0.5134532, -0.3153931, -2.660181, 0.08627451, 1, 0, 1,
-0.5100603, -0.6673981, -2.784679, 0.07843138, 1, 0, 1,
-0.5087257, -0.7427807, -1.983971, 0.07450981, 1, 0, 1,
-0.5086038, 1.060589, 0.007372964, 0.06666667, 1, 0, 1,
-0.5084186, 0.4229317, -2.571107, 0.0627451, 1, 0, 1,
-0.5062981, 1.603487, -0.1705805, 0.05490196, 1, 0, 1,
-0.5046, -0.555216, -2.765791, 0.05098039, 1, 0, 1,
-0.5045249, 0.980179, -1.973699, 0.04313726, 1, 0, 1,
-0.5011869, -0.07300057, -2.171109, 0.03921569, 1, 0, 1,
-0.4926674, -1.735021, -2.985996, 0.03137255, 1, 0, 1,
-0.4893772, 0.5493274, -1.540749, 0.02745098, 1, 0, 1,
-0.4865037, -0.6296834, -3.916063, 0.01960784, 1, 0, 1,
-0.4853314, 0.2146112, -2.469331, 0.01568628, 1, 0, 1,
-0.4817603, -2.281476, -2.187316, 0.007843138, 1, 0, 1,
-0.4791102, -0.3277517, -2.093812, 0.003921569, 1, 0, 1,
-0.4787078, 0.5034305, -0.7691303, 0, 1, 0.003921569, 1,
-0.4774838, 0.6591199, -0.9647709, 0, 1, 0.01176471, 1,
-0.4765197, -0.06269535, -0.4222139, 0, 1, 0.01568628, 1,
-0.4706207, -1.389231, -3.031508, 0, 1, 0.02352941, 1,
-0.468843, 1.145332, -0.4628829, 0, 1, 0.02745098, 1,
-0.4637034, -1.121048, -2.733425, 0, 1, 0.03529412, 1,
-0.4619555, 0.7571498, 0.1111208, 0, 1, 0.03921569, 1,
-0.4602955, -0.1710645, -0.7592083, 0, 1, 0.04705882, 1,
-0.4595676, 0.5129867, -0.9156529, 0, 1, 0.05098039, 1,
-0.4541447, -2.049401, -2.885906, 0, 1, 0.05882353, 1,
-0.4527856, -0.7835052, -2.952162, 0, 1, 0.0627451, 1,
-0.4522696, -1.334551, -3.781388, 0, 1, 0.07058824, 1,
-0.4451437, -1.109383, -1.2048, 0, 1, 0.07450981, 1,
-0.4448117, 0.8562807, -0.3360116, 0, 1, 0.08235294, 1,
-0.4436328, -0.5894284, -1.312207, 0, 1, 0.08627451, 1,
-0.4432742, 0.6385011, -0.9264621, 0, 1, 0.09411765, 1,
-0.4390854, 0.6842421, -2.831728, 0, 1, 0.1019608, 1,
-0.4382237, 2.068211, 0.1599875, 0, 1, 0.1058824, 1,
-0.436033, 1.288231, 1.586463, 0, 1, 0.1137255, 1,
-0.4293621, 0.887848, -0.1924499, 0, 1, 0.1176471, 1,
-0.4253793, -0.8988398, -2.569351, 0, 1, 0.1254902, 1,
-0.422299, 0.1347428, -2.843817, 0, 1, 0.1294118, 1,
-0.4220191, -0.4428578, -2.960894, 0, 1, 0.1372549, 1,
-0.4155577, -0.5668731, -3.397595, 0, 1, 0.1411765, 1,
-0.4147102, 0.2773614, -1.786235, 0, 1, 0.1490196, 1,
-0.4133586, 0.9567469, 0.2537441, 0, 1, 0.1529412, 1,
-0.4130217, -0.2206335, -5.183414, 0, 1, 0.1607843, 1,
-0.4122137, 0.4120054, -2.596666, 0, 1, 0.1647059, 1,
-0.4098842, -0.2100284, -2.030915, 0, 1, 0.172549, 1,
-0.4091793, -1.78713, -4.132069, 0, 1, 0.1764706, 1,
-0.4070942, 0.7836747, -1.218409, 0, 1, 0.1843137, 1,
-0.4062873, -0.7787746, -3.287437, 0, 1, 0.1882353, 1,
-0.4047153, -0.7145731, -2.107435, 0, 1, 0.1960784, 1,
-0.4026732, 0.5695618, -1.418907, 0, 1, 0.2039216, 1,
-0.3998262, -1.03039, -2.532239, 0, 1, 0.2078431, 1,
-0.3977985, -1.381231, -3.533576, 0, 1, 0.2156863, 1,
-0.3974545, -0.9897616, -2.518847, 0, 1, 0.2196078, 1,
-0.395051, 0.5011275, -1.084578, 0, 1, 0.227451, 1,
-0.3949442, 0.1947374, -0.1097677, 0, 1, 0.2313726, 1,
-0.3949327, -0.4328305, -2.824136, 0, 1, 0.2392157, 1,
-0.3946595, -1.200513, -2.361056, 0, 1, 0.2431373, 1,
-0.3921869, 0.6896447, 0.7008606, 0, 1, 0.2509804, 1,
-0.3905678, 0.5787535, 0.7962752, 0, 1, 0.254902, 1,
-0.3893469, -0.2901028, -2.42937, 0, 1, 0.2627451, 1,
-0.3892524, 1.1599, -1.250894, 0, 1, 0.2666667, 1,
-0.3827273, 0.3548226, -1.189075, 0, 1, 0.2745098, 1,
-0.3813793, -1.571945, -4.042991, 0, 1, 0.2784314, 1,
-0.3805037, 0.2639898, -0.3133844, 0, 1, 0.2862745, 1,
-0.3718702, 0.2172921, -1.144521, 0, 1, 0.2901961, 1,
-0.3654736, -0.7555602, -0.6824755, 0, 1, 0.2980392, 1,
-0.3635222, 0.6665459, -1.147886, 0, 1, 0.3058824, 1,
-0.3631852, -0.8704137, -4.04116, 0, 1, 0.3098039, 1,
-0.3593432, 2.011844, 0.3036597, 0, 1, 0.3176471, 1,
-0.3555213, -1.047523, -3.525499, 0, 1, 0.3215686, 1,
-0.3554891, 1.065657, -0.5054036, 0, 1, 0.3294118, 1,
-0.3521291, -1.518012, -1.836087, 0, 1, 0.3333333, 1,
-0.3516066, 0.2692739, 0.01107359, 0, 1, 0.3411765, 1,
-0.3511625, -0.5140596, -2.480403, 0, 1, 0.345098, 1,
-0.3478586, 0.7787458, -1.400837, 0, 1, 0.3529412, 1,
-0.3445163, -0.637465, -1.664084, 0, 1, 0.3568628, 1,
-0.3417146, -1.030118, -3.664504, 0, 1, 0.3647059, 1,
-0.3392147, 0.0429175, -1.642805, 0, 1, 0.3686275, 1,
-0.3390353, -1.432967, -1.098519, 0, 1, 0.3764706, 1,
-0.3383676, -0.597512, -2.439691, 0, 1, 0.3803922, 1,
-0.3382579, -0.1678599, -1.420731, 0, 1, 0.3882353, 1,
-0.3371624, -0.8173394, -0.3046978, 0, 1, 0.3921569, 1,
-0.3323791, 0.1046618, 0.09780814, 0, 1, 0.4, 1,
-0.327446, 0.1152898, -0.8235929, 0, 1, 0.4078431, 1,
-0.326609, 0.3940679, -0.6448098, 0, 1, 0.4117647, 1,
-0.3265538, 1.073563, -1.681525, 0, 1, 0.4196078, 1,
-0.3258704, -0.898035, -2.504125, 0, 1, 0.4235294, 1,
-0.3238634, -1.919518, -2.029669, 0, 1, 0.4313726, 1,
-0.3195184, 1.610811, 1.439753, 0, 1, 0.4352941, 1,
-0.3178352, -0.3256731, -1.25066, 0, 1, 0.4431373, 1,
-0.3176834, 0.2753752, -0.5883713, 0, 1, 0.4470588, 1,
-0.3157259, -0.1200583, -0.7916827, 0, 1, 0.454902, 1,
-0.3102272, -0.4704701, -3.55789, 0, 1, 0.4588235, 1,
-0.3095194, 1.723167, 1.938896, 0, 1, 0.4666667, 1,
-0.3041589, 0.7972381, -0.885425, 0, 1, 0.4705882, 1,
-0.3010233, -0.6031193, -2.668413, 0, 1, 0.4784314, 1,
-0.3000947, 0.4509691, 0.1058587, 0, 1, 0.4823529, 1,
-0.2988734, -1.437873, -3.702135, 0, 1, 0.4901961, 1,
-0.2987354, -0.3600114, -2.090702, 0, 1, 0.4941176, 1,
-0.298703, 0.4877332, -0.7678948, 0, 1, 0.5019608, 1,
-0.2981039, 1.644822, 0.2401394, 0, 1, 0.509804, 1,
-0.2752202, -1.073785, -1.931248, 0, 1, 0.5137255, 1,
-0.2747507, -2.119465, -5.808802, 0, 1, 0.5215687, 1,
-0.2743577, -0.01689544, -2.132955, 0, 1, 0.5254902, 1,
-0.2726559, -0.9161491, -2.988742, 0, 1, 0.5333334, 1,
-0.2700647, 0.3428332, -1.55853, 0, 1, 0.5372549, 1,
-0.2693239, -0.1346505, -1.742899, 0, 1, 0.5450981, 1,
-0.269026, -0.4371156, -2.443843, 0, 1, 0.5490196, 1,
-0.266506, -0.5436949, -2.222424, 0, 1, 0.5568628, 1,
-0.2649671, 0.09743038, -1.666105, 0, 1, 0.5607843, 1,
-0.2640062, -0.5942945, -2.993272, 0, 1, 0.5686275, 1,
-0.2617227, 1.167554, 1.67903, 0, 1, 0.572549, 1,
-0.2587235, -0.1404394, -1.756018, 0, 1, 0.5803922, 1,
-0.2578779, 1.511384, -1.023694, 0, 1, 0.5843138, 1,
-0.2507755, 0.1126487, -2.142978, 0, 1, 0.5921569, 1,
-0.2493694, 0.1848886, -1.805005, 0, 1, 0.5960785, 1,
-0.2487024, -0.2606249, -1.549433, 0, 1, 0.6039216, 1,
-0.2480888, -0.5723334, -2.327525, 0, 1, 0.6117647, 1,
-0.2466091, 0.08084057, -0.3219958, 0, 1, 0.6156863, 1,
-0.2462355, -1.567931, -4.766172, 0, 1, 0.6235294, 1,
-0.240205, 0.7227921, -0.8539279, 0, 1, 0.627451, 1,
-0.2381712, 0.8017077, 0.1763294, 0, 1, 0.6352941, 1,
-0.235622, -0.06768793, -2.461467, 0, 1, 0.6392157, 1,
-0.2353722, 2.626754, 0.09163602, 0, 1, 0.6470588, 1,
-0.2316322, 0.006576571, 0.141511, 0, 1, 0.6509804, 1,
-0.2267358, 0.6692019, 1.360216, 0, 1, 0.6588235, 1,
-0.2250265, -1.53343, -2.084017, 0, 1, 0.6627451, 1,
-0.2222522, -1.241831, -2.285391, 0, 1, 0.6705883, 1,
-0.2211312, -0.6400121, -3.358324, 0, 1, 0.6745098, 1,
-0.2191088, 0.1853272, 0.2615909, 0, 1, 0.682353, 1,
-0.2111787, 0.9691377, -1.348844, 0, 1, 0.6862745, 1,
-0.2111082, -0.1203805, -2.62317, 0, 1, 0.6941177, 1,
-0.2085, -0.9289812, -2.751061, 0, 1, 0.7019608, 1,
-0.2057583, 1.119099, -0.6417688, 0, 1, 0.7058824, 1,
-0.2000121, -0.02607746, -2.047948, 0, 1, 0.7137255, 1,
-0.1994962, -0.6034178, -3.322361, 0, 1, 0.7176471, 1,
-0.1977931, -0.06033784, -2.097383, 0, 1, 0.7254902, 1,
-0.1972493, 1.412095, 0.1029271, 0, 1, 0.7294118, 1,
-0.19627, 0.003877236, -0.7108489, 0, 1, 0.7372549, 1,
-0.1929014, -1.093092, -3.45403, 0, 1, 0.7411765, 1,
-0.1927276, -0.005413074, -1.504532, 0, 1, 0.7490196, 1,
-0.1900034, -0.4311263, -1.889864, 0, 1, 0.7529412, 1,
-0.1848437, 0.4490784, -0.6178118, 0, 1, 0.7607843, 1,
-0.1795923, 0.1932014, -0.4582722, 0, 1, 0.7647059, 1,
-0.1758391, -0.5754361, -3.662422, 0, 1, 0.772549, 1,
-0.1742641, 0.6816242, -0.5706607, 0, 1, 0.7764706, 1,
-0.1741725, -0.2117047, -2.371979, 0, 1, 0.7843137, 1,
-0.1725603, -1.49851, -2.853664, 0, 1, 0.7882353, 1,
-0.1705928, -0.2654316, -2.870245, 0, 1, 0.7960784, 1,
-0.1674352, -1.336664, -2.186605, 0, 1, 0.8039216, 1,
-0.167105, -0.1914657, -1.329198, 0, 1, 0.8078431, 1,
-0.1633542, 0.6269462, -1.48419, 0, 1, 0.8156863, 1,
-0.1618562, -0.912082, -2.552085, 0, 1, 0.8196079, 1,
-0.1603823, 1.000879, 0.3268868, 0, 1, 0.827451, 1,
-0.1523864, -0.5783727, -2.925961, 0, 1, 0.8313726, 1,
-0.1519497, 0.3088648, 0.5230047, 0, 1, 0.8392157, 1,
-0.1510703, 0.4546882, 0.9316112, 0, 1, 0.8431373, 1,
-0.1476186, 1.063383, -1.702083, 0, 1, 0.8509804, 1,
-0.1427848, -0.3976465, -2.305267, 0, 1, 0.854902, 1,
-0.1424919, -1.036675, -2.211707, 0, 1, 0.8627451, 1,
-0.1396917, -1.120516, -2.784132, 0, 1, 0.8666667, 1,
-0.1393621, -0.0627988, -1.476768, 0, 1, 0.8745098, 1,
-0.1350256, 1.29766, -1.486019, 0, 1, 0.8784314, 1,
-0.1338498, 0.7215681, -0.7946677, 0, 1, 0.8862745, 1,
-0.1289215, -0.181449, -1.693506, 0, 1, 0.8901961, 1,
-0.1283322, -0.8703414, -3.823842, 0, 1, 0.8980392, 1,
-0.1274558, -0.5019879, -2.369774, 0, 1, 0.9058824, 1,
-0.125871, 1.437404, 0.07530187, 0, 1, 0.9098039, 1,
-0.1200103, -1.319384, -3.918652, 0, 1, 0.9176471, 1,
-0.1154479, -1.411393, -1.419263, 0, 1, 0.9215686, 1,
-0.1121245, -0.5198757, -1.75154, 0, 1, 0.9294118, 1,
-0.1114725, -0.1199531, -2.470036, 0, 1, 0.9333333, 1,
-0.1090876, 0.8815832, 0.2351638, 0, 1, 0.9411765, 1,
-0.1055825, 2.186395, 0.1866448, 0, 1, 0.945098, 1,
-0.1041734, 1.342541, -1.584861, 0, 1, 0.9529412, 1,
-0.1021956, -0.3055721, -3.367954, 0, 1, 0.9568627, 1,
-0.0998542, -0.4244484, -1.647642, 0, 1, 0.9647059, 1,
-0.09966658, 0.1769661, -0.3782847, 0, 1, 0.9686275, 1,
-0.0986846, -1.1958, -3.80602, 0, 1, 0.9764706, 1,
-0.09521262, -0.2971579, -2.114507, 0, 1, 0.9803922, 1,
-0.09024891, 1.750977, 3.053201, 0, 1, 0.9882353, 1,
-0.08695503, 0.0682664, -0.3626164, 0, 1, 0.9921569, 1,
-0.08327374, -1.56525, -2.809307, 0, 1, 1, 1,
-0.08307111, 0.5374755, 0.4264399, 0, 0.9921569, 1, 1,
-0.08083306, -0.4814936, -3.533303, 0, 0.9882353, 1, 1,
-0.07853483, 0.4326589, -0.3749059, 0, 0.9803922, 1, 1,
-0.07794313, -1.334427, -5.257532, 0, 0.9764706, 1, 1,
-0.07609212, -1.25294, -2.394224, 0, 0.9686275, 1, 1,
-0.07391559, 1.174052, 0.3089435, 0, 0.9647059, 1, 1,
-0.07220479, -0.02654424, -1.264883, 0, 0.9568627, 1, 1,
-0.07011219, -0.7274024, -2.441231, 0, 0.9529412, 1, 1,
-0.06883753, 0.7137492, -0.2349511, 0, 0.945098, 1, 1,
-0.06779972, -0.1673737, -2.530796, 0, 0.9411765, 1, 1,
-0.06419914, -1.1332, -1.063792, 0, 0.9333333, 1, 1,
-0.0571279, -0.1029215, -3.729167, 0, 0.9294118, 1, 1,
-0.05710518, -1.529942, -2.868528, 0, 0.9215686, 1, 1,
-0.05402227, -0.07831805, -1.477624, 0, 0.9176471, 1, 1,
-0.0537975, -0.2281233, -1.396131, 0, 0.9098039, 1, 1,
-0.05308462, -0.7841659, -3.2224, 0, 0.9058824, 1, 1,
-0.04913911, -0.8874301, -5.22604, 0, 0.8980392, 1, 1,
-0.04622779, -0.6177701, -3.446951, 0, 0.8901961, 1, 1,
-0.04449444, 1.327421, -0.3403367, 0, 0.8862745, 1, 1,
-0.04404891, 1.177416, -2.146095, 0, 0.8784314, 1, 1,
-0.03343325, -0.5003223, -3.621002, 0, 0.8745098, 1, 1,
-0.03045995, -0.1792892, -3.020844, 0, 0.8666667, 1, 1,
-0.0289242, -1.319987, -4.17867, 0, 0.8627451, 1, 1,
-0.02283571, -0.3475256, -2.850834, 0, 0.854902, 1, 1,
-0.02131762, -0.2614316, -3.654473, 0, 0.8509804, 1, 1,
-0.01812636, 0.5606789, -1.980353, 0, 0.8431373, 1, 1,
-0.01474836, 2.337031, -0.3348602, 0, 0.8392157, 1, 1,
-0.01440265, -0.1661233, -3.330083, 0, 0.8313726, 1, 1,
-0.01018167, -0.1701742, -3.398573, 0, 0.827451, 1, 1,
-0.009988152, -1.111012, -3.519167, 0, 0.8196079, 1, 1,
-0.009403992, -0.4238715, -3.766859, 0, 0.8156863, 1, 1,
-0.008092026, -0.6223699, -2.522226, 0, 0.8078431, 1, 1,
0.002103771, 0.3763441, 0.8632081, 0, 0.8039216, 1, 1,
0.004746971, -1.58177, 2.782661, 0, 0.7960784, 1, 1,
0.006067125, 0.7567708, 0.5592505, 0, 0.7882353, 1, 1,
0.006485044, 1.147837, 1.889599, 0, 0.7843137, 1, 1,
0.008906774, -0.1784282, -0.2754945, 0, 0.7764706, 1, 1,
0.01267757, 0.2969943, 0.4613323, 0, 0.772549, 1, 1,
0.01514033, -1.043973, 3.378713, 0, 0.7647059, 1, 1,
0.01925704, -0.4902926, 4.52818, 0, 0.7607843, 1, 1,
0.02314288, 0.5751333, -0.03583047, 0, 0.7529412, 1, 1,
0.03852862, -0.1309433, 4.134297, 0, 0.7490196, 1, 1,
0.04259324, -0.630516, 3.478114, 0, 0.7411765, 1, 1,
0.04522187, 0.7739466, 0.06170829, 0, 0.7372549, 1, 1,
0.04831355, 0.622441, 1.773677, 0, 0.7294118, 1, 1,
0.05028795, 0.2153413, 0.6311337, 0, 0.7254902, 1, 1,
0.05041868, -2.379844, 3.460313, 0, 0.7176471, 1, 1,
0.05247343, -0.7053103, 5.172688, 0, 0.7137255, 1, 1,
0.05260877, -0.1758272, 1.862684, 0, 0.7058824, 1, 1,
0.05469962, 0.7919346, 0.2954749, 0, 0.6980392, 1, 1,
0.05605335, 1.156107, -1.003713, 0, 0.6941177, 1, 1,
0.06093067, -1.241397, 3.085613, 0, 0.6862745, 1, 1,
0.0639298, 1.031995, -1.057022, 0, 0.682353, 1, 1,
0.06720136, -1.745416, 0.56035, 0, 0.6745098, 1, 1,
0.07066691, 0.3175403, 1.584759, 0, 0.6705883, 1, 1,
0.0738858, -0.8739656, 3.919501, 0, 0.6627451, 1, 1,
0.07470059, -0.03830674, 2.51601, 0, 0.6588235, 1, 1,
0.07904511, 0.5425473, 1.816004, 0, 0.6509804, 1, 1,
0.09324431, -0.6284609, 2.562816, 0, 0.6470588, 1, 1,
0.1001801, 0.3304756, -2.19472, 0, 0.6392157, 1, 1,
0.1048022, 0.217127, 0.7702462, 0, 0.6352941, 1, 1,
0.1055394, -0.03799868, 1.861303, 0, 0.627451, 1, 1,
0.1080305, -0.6471533, 2.907192, 0, 0.6235294, 1, 1,
0.11233, 0.332926, 1.509845, 0, 0.6156863, 1, 1,
0.113267, 0.2212344, 2.758052, 0, 0.6117647, 1, 1,
0.1136316, 0.8788199, 1.079967, 0, 0.6039216, 1, 1,
0.1178018, 1.399451, 1.747949, 0, 0.5960785, 1, 1,
0.1212518, -0.8539161, 3.521637, 0, 0.5921569, 1, 1,
0.1229266, -0.2336694, 2.838429, 0, 0.5843138, 1, 1,
0.1252352, 0.7852809, 0.2534892, 0, 0.5803922, 1, 1,
0.1326803, 0.1475839, 0.5330927, 0, 0.572549, 1, 1,
0.136684, -0.3600889, 2.930773, 0, 0.5686275, 1, 1,
0.1403921, 1.951972, -0.3461293, 0, 0.5607843, 1, 1,
0.1408549, -1.340119, 1.191274, 0, 0.5568628, 1, 1,
0.1411622, -0.120339, 1.095992, 0, 0.5490196, 1, 1,
0.1425831, 0.8645329, 1.302641, 0, 0.5450981, 1, 1,
0.1471355, 2.830904, 3.128182, 0, 0.5372549, 1, 1,
0.1476712, 0.2214901, 1.653236, 0, 0.5333334, 1, 1,
0.1534399, -0.1328465, 3.327498, 0, 0.5254902, 1, 1,
0.1564482, -1.801485, 3.228183, 0, 0.5215687, 1, 1,
0.1571954, -1.50361, 2.564861, 0, 0.5137255, 1, 1,
0.1605687, 0.750056, 0.07198995, 0, 0.509804, 1, 1,
0.1618403, 1.045018, 0.06707135, 0, 0.5019608, 1, 1,
0.1625922, 1.309729, -0.5615378, 0, 0.4941176, 1, 1,
0.1683225, 0.8027334, 0.2368178, 0, 0.4901961, 1, 1,
0.1728592, -0.8097098, 2.250127, 0, 0.4823529, 1, 1,
0.1737278, 0.6821738, 0.123446, 0, 0.4784314, 1, 1,
0.1801021, 0.669612, -0.2416534, 0, 0.4705882, 1, 1,
0.1834097, -0.6513591, 2.557024, 0, 0.4666667, 1, 1,
0.1865285, -2.515663, 3.818195, 0, 0.4588235, 1, 1,
0.1868462, -1.406671, 2.772708, 0, 0.454902, 1, 1,
0.187425, 0.2823166, 0.2590496, 0, 0.4470588, 1, 1,
0.189913, -0.3645209, 2.675493, 0, 0.4431373, 1, 1,
0.1917668, 2.246913, -0.063696, 0, 0.4352941, 1, 1,
0.1928919, -0.4261589, 2.578932, 0, 0.4313726, 1, 1,
0.1935115, 0.3140389, 1.400527, 0, 0.4235294, 1, 1,
0.1952077, -1.714615, 2.438669, 0, 0.4196078, 1, 1,
0.1985696, 0.213026, 1.507833, 0, 0.4117647, 1, 1,
0.2011953, 0.9673475, -0.7058654, 0, 0.4078431, 1, 1,
0.2024381, 0.588493, -0.9848561, 0, 0.4, 1, 1,
0.203179, -1.815454, 2.718945, 0, 0.3921569, 1, 1,
0.2116651, -0.6412423, 3.886314, 0, 0.3882353, 1, 1,
0.2141571, 0.3837151, 1.803123, 0, 0.3803922, 1, 1,
0.2149985, 1.02915, 0.0315581, 0, 0.3764706, 1, 1,
0.2175965, -1.842018, 4.306769, 0, 0.3686275, 1, 1,
0.2181464, 0.08280014, 1.617677, 0, 0.3647059, 1, 1,
0.2213855, 0.9572129, -1.049659, 0, 0.3568628, 1, 1,
0.221616, 1.077456, 0.4310076, 0, 0.3529412, 1, 1,
0.2235038, -0.7072937, 5.115442, 0, 0.345098, 1, 1,
0.2260079, -0.1294854, 4.41654, 0, 0.3411765, 1, 1,
0.2277105, -0.7574307, 1.510045, 0, 0.3333333, 1, 1,
0.2278552, 2.797363, -0.2426025, 0, 0.3294118, 1, 1,
0.2282478, 0.4737458, -0.39664, 0, 0.3215686, 1, 1,
0.2342584, -1.114983, 2.788096, 0, 0.3176471, 1, 1,
0.2376348, -0.7118, 1.292907, 0, 0.3098039, 1, 1,
0.2389243, 0.4042714, 1.098321, 0, 0.3058824, 1, 1,
0.2404408, 0.4568489, 0.1389161, 0, 0.2980392, 1, 1,
0.2407389, 0.9880942, 0.3071209, 0, 0.2901961, 1, 1,
0.2481654, -0.5373763, 1.669972, 0, 0.2862745, 1, 1,
0.2519562, 0.3238425, 1.527883, 0, 0.2784314, 1, 1,
0.2568061, 0.9864112, 1.583026, 0, 0.2745098, 1, 1,
0.2591342, 0.01584845, 1.23551, 0, 0.2666667, 1, 1,
0.2603353, 0.5594481, -0.09813853, 0, 0.2627451, 1, 1,
0.2610218, 1.371358, -0.2006184, 0, 0.254902, 1, 1,
0.2647182, -0.6501697, 3.134502, 0, 0.2509804, 1, 1,
0.265063, -0.6330248, 1.165978, 0, 0.2431373, 1, 1,
0.270353, -0.1390744, 1.565505, 0, 0.2392157, 1, 1,
0.277899, -0.7057948, 1.300697, 0, 0.2313726, 1, 1,
0.2882299, 1.932897, 0.3527614, 0, 0.227451, 1, 1,
0.2901857, -0.7957183, 3.505269, 0, 0.2196078, 1, 1,
0.2932372, -0.9250563, 3.153541, 0, 0.2156863, 1, 1,
0.2946174, 0.2760429, 0.5445641, 0, 0.2078431, 1, 1,
0.2951968, -0.7019126, 4.545181, 0, 0.2039216, 1, 1,
0.2997133, -0.6814132, 3.719391, 0, 0.1960784, 1, 1,
0.3029769, 1.870763, 0.5853432, 0, 0.1882353, 1, 1,
0.3073059, -1.161175, 4.076357, 0, 0.1843137, 1, 1,
0.3082323, 1.220731, 2.55193, 0, 0.1764706, 1, 1,
0.3115558, 1.235477, -0.5018558, 0, 0.172549, 1, 1,
0.3158776, -0.7712212, 1.925089, 0, 0.1647059, 1, 1,
0.3177383, -0.2707036, 3.077426, 0, 0.1607843, 1, 1,
0.3187938, 0.2554483, -0.4030537, 0, 0.1529412, 1, 1,
0.3191491, 1.321446, -0.2208105, 0, 0.1490196, 1, 1,
0.331006, -0.3240541, 2.240893, 0, 0.1411765, 1, 1,
0.3314797, -1.424277, 4.113707, 0, 0.1372549, 1, 1,
0.3321537, -2.654311, 3.316275, 0, 0.1294118, 1, 1,
0.3321944, -2.185317, 2.860711, 0, 0.1254902, 1, 1,
0.336934, -1.408737, 2.529282, 0, 0.1176471, 1, 1,
0.3384707, 1.285486, 0.3304685, 0, 0.1137255, 1, 1,
0.353614, 0.8349287, 2.346694, 0, 0.1058824, 1, 1,
0.3573672, -0.6284548, 2.654427, 0, 0.09803922, 1, 1,
0.3622987, 2.049402, -1.010576, 0, 0.09411765, 1, 1,
0.365475, 0.5853632, 1.330324, 0, 0.08627451, 1, 1,
0.3674901, -0.5223407, 3.67809, 0, 0.08235294, 1, 1,
0.3707285, -0.2267556, 3.286401, 0, 0.07450981, 1, 1,
0.37251, 0.09084827, 0.8884414, 0, 0.07058824, 1, 1,
0.3768971, 0.1965281, 0.02237732, 0, 0.0627451, 1, 1,
0.3783741, -0.669349, 1.743767, 0, 0.05882353, 1, 1,
0.3791451, -1.694874, 3.520338, 0, 0.05098039, 1, 1,
0.3799536, 1.109272, -0.2312801, 0, 0.04705882, 1, 1,
0.3817003, -0.7210364, 2.860317, 0, 0.03921569, 1, 1,
0.3837488, -0.7593368, 3.03376, 0, 0.03529412, 1, 1,
0.3952569, 0.05272312, 2.172561, 0, 0.02745098, 1, 1,
0.3961727, 0.03742461, 0.5201713, 0, 0.02352941, 1, 1,
0.3968803, 3.144129, -0.2139854, 0, 0.01568628, 1, 1,
0.4008691, 0.5149987, 2.71536, 0, 0.01176471, 1, 1,
0.4040771, 0.8657877, -0.7858568, 0, 0.003921569, 1, 1,
0.4076544, 0.4247071, 2.662012, 0.003921569, 0, 1, 1,
0.4114413, 2.632177, 0.2749245, 0.007843138, 0, 1, 1,
0.412143, 0.3228897, 0.8420575, 0.01568628, 0, 1, 1,
0.4153357, -2.758188, 3.204237, 0.01960784, 0, 1, 1,
0.4213786, 0.5703025, -0.04540402, 0.02745098, 0, 1, 1,
0.432214, -0.4443777, 1.602736, 0.03137255, 0, 1, 1,
0.4333837, 0.3126673, 2.321525, 0.03921569, 0, 1, 1,
0.4359149, 0.7870138, 1.300815, 0.04313726, 0, 1, 1,
0.4373401, -1.357375, 4.472446, 0.05098039, 0, 1, 1,
0.4401512, -0.4212385, 1.04782, 0.05490196, 0, 1, 1,
0.4422712, -0.2438306, 0.07414976, 0.0627451, 0, 1, 1,
0.4426782, -0.3596688, 2.051203, 0.06666667, 0, 1, 1,
0.4428477, 1.286365, 0.3666268, 0.07450981, 0, 1, 1,
0.4459774, -0.4604893, 0.3041047, 0.07843138, 0, 1, 1,
0.4504832, 1.403089, -0.4002208, 0.08627451, 0, 1, 1,
0.4531894, -2.916952, 3.077627, 0.09019608, 0, 1, 1,
0.4546926, -0.2120986, 2.934469, 0.09803922, 0, 1, 1,
0.4608141, 0.7602117, 1.314649, 0.1058824, 0, 1, 1,
0.4623464, -1.498356, 4.273658, 0.1098039, 0, 1, 1,
0.4628828, 0.2628929, 3.393485, 0.1176471, 0, 1, 1,
0.4678808, -0.2014704, 3.135709, 0.1215686, 0, 1, 1,
0.4704064, 0.3102414, 1.051386, 0.1294118, 0, 1, 1,
0.4765425, -1.175705, 3.852998, 0.1333333, 0, 1, 1,
0.477007, 0.716208, -0.6860639, 0.1411765, 0, 1, 1,
0.4819694, -0.1954637, 3.397193, 0.145098, 0, 1, 1,
0.4859387, 1.782313, 0.5712374, 0.1529412, 0, 1, 1,
0.4871538, 0.0138126, 1.071273, 0.1568628, 0, 1, 1,
0.4875534, 0.5283058, -0.9573647, 0.1647059, 0, 1, 1,
0.4881619, -0.00258808, 0.8146163, 0.1686275, 0, 1, 1,
0.4906762, -0.960161, 2.1778, 0.1764706, 0, 1, 1,
0.491739, -0.2427178, 1.587572, 0.1803922, 0, 1, 1,
0.4920979, 0.04818759, -0.6908924, 0.1882353, 0, 1, 1,
0.4977233, -0.7148119, 1.534628, 0.1921569, 0, 1, 1,
0.5033693, -0.4722218, 0.6378579, 0.2, 0, 1, 1,
0.5044402, 0.4545847, 0.4955057, 0.2078431, 0, 1, 1,
0.50514, 0.08952087, 0.9671898, 0.2117647, 0, 1, 1,
0.5052418, -0.8498167, 1.489251, 0.2196078, 0, 1, 1,
0.5105155, -1.169174, 4.206663, 0.2235294, 0, 1, 1,
0.5105451, 0.1079805, 1.151502, 0.2313726, 0, 1, 1,
0.5119881, -0.6731203, 3.880996, 0.2352941, 0, 1, 1,
0.5128712, -0.3307085, 0.8055242, 0.2431373, 0, 1, 1,
0.5146339, 1.877051, 1.291963, 0.2470588, 0, 1, 1,
0.515268, -0.1967347, 1.767272, 0.254902, 0, 1, 1,
0.5161958, -0.1706802, 1.58151, 0.2588235, 0, 1, 1,
0.5190952, 0.9742101, 0.9746376, 0.2666667, 0, 1, 1,
0.5212436, 0.7520841, 1.195038, 0.2705882, 0, 1, 1,
0.5228001, -0.2318516, 1.291192, 0.2784314, 0, 1, 1,
0.5250658, 1.609915, 0.4330879, 0.282353, 0, 1, 1,
0.527598, -0.8609347, 3.040187, 0.2901961, 0, 1, 1,
0.5280808, 1.220762, -0.08710594, 0.2941177, 0, 1, 1,
0.5282217, -0.6127827, 3.361774, 0.3019608, 0, 1, 1,
0.5282598, -0.7738315, -0.2968255, 0.3098039, 0, 1, 1,
0.5299954, 1.183056, 0.2815094, 0.3137255, 0, 1, 1,
0.545326, 0.3574606, -1.25233, 0.3215686, 0, 1, 1,
0.550854, 0.3766304, -0.1678783, 0.3254902, 0, 1, 1,
0.5539191, -1.61117, 2.565518, 0.3333333, 0, 1, 1,
0.5579872, -0.1297679, 1.490354, 0.3372549, 0, 1, 1,
0.5592374, 0.1214648, 1.598437, 0.345098, 0, 1, 1,
0.5602323, 0.9646008, 1.782704, 0.3490196, 0, 1, 1,
0.5682995, 1.355736, 0.6663958, 0.3568628, 0, 1, 1,
0.5688049, -1.407604, 2.393249, 0.3607843, 0, 1, 1,
0.5701238, 1.214006, 0.1444697, 0.3686275, 0, 1, 1,
0.5724196, -0.02025669, 3.903943, 0.372549, 0, 1, 1,
0.5734876, -0.3812691, 3.506892, 0.3803922, 0, 1, 1,
0.5758138, -1.013615, -0.3477447, 0.3843137, 0, 1, 1,
0.581215, 0.4720764, -1.005243, 0.3921569, 0, 1, 1,
0.5892673, 0.3790483, 1.307017, 0.3960784, 0, 1, 1,
0.58999, -0.2588973, 2.233237, 0.4039216, 0, 1, 1,
0.5943384, -0.9882719, 2.337045, 0.4117647, 0, 1, 1,
0.6045569, -1.369414, 3.417092, 0.4156863, 0, 1, 1,
0.605865, -1.830922, 3.379009, 0.4235294, 0, 1, 1,
0.6064685, -0.1105591, 4.136777, 0.427451, 0, 1, 1,
0.6094961, 0.04448884, 1.738065, 0.4352941, 0, 1, 1,
0.6102266, 0.05512717, 2.281204, 0.4392157, 0, 1, 1,
0.613579, -1.537591, 3.007511, 0.4470588, 0, 1, 1,
0.6141286, -1.152399, 3.960294, 0.4509804, 0, 1, 1,
0.6186528, 1.111688, -0.6759644, 0.4588235, 0, 1, 1,
0.621502, -0.9690799, 2.426915, 0.4627451, 0, 1, 1,
0.6238524, -0.05003895, -0.09964699, 0.4705882, 0, 1, 1,
0.6245428, 0.869381, -0.03750379, 0.4745098, 0, 1, 1,
0.6250908, -0.5230426, 2.150345, 0.4823529, 0, 1, 1,
0.6295358, -2.773529, 1.695595, 0.4862745, 0, 1, 1,
0.6328586, 0.4063061, 1.402965, 0.4941176, 0, 1, 1,
0.6355267, -0.1724634, 1.712062, 0.5019608, 0, 1, 1,
0.635973, 0.0789411, 3.557524, 0.5058824, 0, 1, 1,
0.6363955, -1.024491, 0.9565076, 0.5137255, 0, 1, 1,
0.6393766, 0.2603254, 1.053198, 0.5176471, 0, 1, 1,
0.6462789, 0.9536346, 0.3031024, 0.5254902, 0, 1, 1,
0.6496701, 0.7973146, 1.427719, 0.5294118, 0, 1, 1,
0.6499699, 1.725224, -0.9266869, 0.5372549, 0, 1, 1,
0.6502997, -0.1038078, 2.424808, 0.5411765, 0, 1, 1,
0.6568639, -0.0999117, 2.842043, 0.5490196, 0, 1, 1,
0.6637301, -1.39704, 1.580774, 0.5529412, 0, 1, 1,
0.6680619, -1.018847, 2.89777, 0.5607843, 0, 1, 1,
0.6683642, 0.4156149, 2.650753, 0.5647059, 0, 1, 1,
0.6697202, -0.9913389, 1.70041, 0.572549, 0, 1, 1,
0.6702369, -0.5965089, 2.398538, 0.5764706, 0, 1, 1,
0.6758867, 1.045177, 1.765844, 0.5843138, 0, 1, 1,
0.6791657, -0.9863152, 0.6099461, 0.5882353, 0, 1, 1,
0.6812091, 1.155554, -0.9881234, 0.5960785, 0, 1, 1,
0.6820394, 1.565519, -0.03280775, 0.6039216, 0, 1, 1,
0.6821602, -1.156481, 2.502393, 0.6078432, 0, 1, 1,
0.6851357, 0.7123281, 3.079388, 0.6156863, 0, 1, 1,
0.6880162, -0.2512634, 2.595098, 0.6196079, 0, 1, 1,
0.6881927, 0.1488675, 3.18317, 0.627451, 0, 1, 1,
0.6908882, -0.9570605, 0.5802293, 0.6313726, 0, 1, 1,
0.6924646, 0.2502986, 1.595299, 0.6392157, 0, 1, 1,
0.6925777, -0.8674843, 0.4711937, 0.6431373, 0, 1, 1,
0.6963046, -0.8885894, 2.613238, 0.6509804, 0, 1, 1,
0.6993833, 0.3065579, -0.06584163, 0.654902, 0, 1, 1,
0.703249, -0.1243356, 0.3106698, 0.6627451, 0, 1, 1,
0.7067205, -0.8396783, 4.872077, 0.6666667, 0, 1, 1,
0.7078211, -2.425986, 0.6858537, 0.6745098, 0, 1, 1,
0.7083195, -0.9588202, 1.772683, 0.6784314, 0, 1, 1,
0.7086353, -0.435416, 1.694325, 0.6862745, 0, 1, 1,
0.7139931, 0.6013397, 2.202325, 0.6901961, 0, 1, 1,
0.71667, -0.03205672, 2.860036, 0.6980392, 0, 1, 1,
0.7194259, 1.600489, -0.935138, 0.7058824, 0, 1, 1,
0.7205813, 1.928116, 0.6612087, 0.7098039, 0, 1, 1,
0.7224793, -0.8069576, 3.771589, 0.7176471, 0, 1, 1,
0.7241246, -0.8107154, 1.858467, 0.7215686, 0, 1, 1,
0.7283325, -1.033855, 3.141638, 0.7294118, 0, 1, 1,
0.7293917, -1.262207, 1.072123, 0.7333333, 0, 1, 1,
0.7324257, 2.725378, 1.742215, 0.7411765, 0, 1, 1,
0.7334971, 1.066672, 0.4470088, 0.7450981, 0, 1, 1,
0.7336845, 1.305124, 0.08576676, 0.7529412, 0, 1, 1,
0.7348309, 0.1854131, 0.1978988, 0.7568628, 0, 1, 1,
0.7367136, 0.1051095, 1.397236, 0.7647059, 0, 1, 1,
0.7377165, 0.8666394, 1.35987, 0.7686275, 0, 1, 1,
0.7377186, -1.286824, 1.977056, 0.7764706, 0, 1, 1,
0.7381482, 0.1885276, 0.5741822, 0.7803922, 0, 1, 1,
0.7410303, -1.68176, 3.46494, 0.7882353, 0, 1, 1,
0.7415368, -2.206625, 3.263104, 0.7921569, 0, 1, 1,
0.7475319, 0.4360666, 1.554373, 0.8, 0, 1, 1,
0.7477547, -0.827718, 1.838572, 0.8078431, 0, 1, 1,
0.7482527, 1.021087, 1.060467, 0.8117647, 0, 1, 1,
0.7499574, 0.379748, -0.473551, 0.8196079, 0, 1, 1,
0.7511905, 0.03370133, 2.635898, 0.8235294, 0, 1, 1,
0.7521539, 0.6796831, 0.6197524, 0.8313726, 0, 1, 1,
0.7534721, -0.3256015, 3.074487, 0.8352941, 0, 1, 1,
0.7561779, -0.2121939, 2.27393, 0.8431373, 0, 1, 1,
0.7603535, 0.3913597, 1.15536, 0.8470588, 0, 1, 1,
0.7758498, 0.4843348, 0.5439925, 0.854902, 0, 1, 1,
0.7863577, 0.5846124, 1.521251, 0.8588235, 0, 1, 1,
0.7884621, -0.6265303, 1.90536, 0.8666667, 0, 1, 1,
0.7900793, -1.789403, 2.941162, 0.8705882, 0, 1, 1,
0.7901968, -0.1288367, 0.968039, 0.8784314, 0, 1, 1,
0.7904695, 0.3967162, 0.9142922, 0.8823529, 0, 1, 1,
0.7932038, 1.69351, 1.400395, 0.8901961, 0, 1, 1,
0.7959982, 0.9171986, 1.539572, 0.8941177, 0, 1, 1,
0.7972925, 0.9844714, 0.9886316, 0.9019608, 0, 1, 1,
0.8012449, -0.9506377, 2.838877, 0.9098039, 0, 1, 1,
0.8062462, 0.3673127, 0.5111812, 0.9137255, 0, 1, 1,
0.8166768, 0.1244257, -0.61943, 0.9215686, 0, 1, 1,
0.817714, -0.6090952, 2.998628, 0.9254902, 0, 1, 1,
0.8234145, 0.1659479, 1.72016, 0.9333333, 0, 1, 1,
0.8253489, -1.217419, 2.738691, 0.9372549, 0, 1, 1,
0.8261042, 1.087522, 0.08104511, 0.945098, 0, 1, 1,
0.8301757, -1.02702, 3.252468, 0.9490196, 0, 1, 1,
0.8328885, -0.3610357, 0.6065825, 0.9568627, 0, 1, 1,
0.8383611, -0.2938465, 4.111695, 0.9607843, 0, 1, 1,
0.839277, 1.658769, -0.3697026, 0.9686275, 0, 1, 1,
0.8422529, -0.965691, 1.353451, 0.972549, 0, 1, 1,
0.8481374, 0.8463345, -0.3005193, 0.9803922, 0, 1, 1,
0.851254, -0.2602551, 0.8898728, 0.9843137, 0, 1, 1,
0.852192, -1.701881, 4.059983, 0.9921569, 0, 1, 1,
0.8617052, 0.9778582, 1.242894, 0.9960784, 0, 1, 1,
0.869943, 0.8674893, 1.233196, 1, 0, 0.9960784, 1,
0.8728194, -1.115998, 1.974585, 1, 0, 0.9882353, 1,
0.8728836, 0.6922699, 0.5456137, 1, 0, 0.9843137, 1,
0.8865744, -0.9780185, 1.713689, 1, 0, 0.9764706, 1,
0.8978603, -0.7459886, 2.715647, 1, 0, 0.972549, 1,
0.9004631, -0.8006209, 2.988257, 1, 0, 0.9647059, 1,
0.9008439, -0.7813457, 2.238895, 1, 0, 0.9607843, 1,
0.9011826, 1.409618, -1.108111, 1, 0, 0.9529412, 1,
0.9200299, 1.214623, 1.886262, 1, 0, 0.9490196, 1,
0.9202836, -1.213922, 1.244449, 1, 0, 0.9411765, 1,
0.9232066, 0.9982219, 2.783746, 1, 0, 0.9372549, 1,
0.9265801, 1.251172, 0.006310805, 1, 0, 0.9294118, 1,
0.9299397, -1.066519, 2.33051, 1, 0, 0.9254902, 1,
0.9307588, 1.193438, -1.222539, 1, 0, 0.9176471, 1,
0.9309759, -1.860739, 2.701765, 1, 0, 0.9137255, 1,
0.9404565, -0.7782509, 2.814972, 1, 0, 0.9058824, 1,
0.9415036, -0.4805718, 1.682961, 1, 0, 0.9019608, 1,
0.9428486, 1.242315, 1.199893, 1, 0, 0.8941177, 1,
0.9468787, 1.592214, -0.1388396, 1, 0, 0.8862745, 1,
0.9490343, -1.059615, 1.401902, 1, 0, 0.8823529, 1,
0.9492134, -0.5936928, 2.439338, 1, 0, 0.8745098, 1,
0.9520823, -0.2869257, 1.941307, 1, 0, 0.8705882, 1,
0.9538904, 0.5143033, 1.568995, 1, 0, 0.8627451, 1,
0.9561121, -1.050925, 2.509286, 1, 0, 0.8588235, 1,
0.9566537, -0.3118467, 0.9788961, 1, 0, 0.8509804, 1,
0.964433, -1.016154, 2.149167, 1, 0, 0.8470588, 1,
0.9694768, -0.2303744, 0.303344, 1, 0, 0.8392157, 1,
0.9696298, 1.887422, 0.7768313, 1, 0, 0.8352941, 1,
0.9708298, -0.6343768, 1.354851, 1, 0, 0.827451, 1,
0.9795872, -1.167361, 1.65799, 1, 0, 0.8235294, 1,
0.9897192, -2.431689, 0.5227906, 1, 0, 0.8156863, 1,
0.9925297, 1.086957, 0.08418826, 1, 0, 0.8117647, 1,
0.9947316, -1.385292, 3.307798, 1, 0, 0.8039216, 1,
0.9958052, 0.9013507, 0.0888434, 1, 0, 0.7960784, 1,
1.012528, 0.4979928, 0.07563441, 1, 0, 0.7921569, 1,
1.016117, -0.6974165, 0.5698142, 1, 0, 0.7843137, 1,
1.025393, -0.919839, 3.742929, 1, 0, 0.7803922, 1,
1.027921, -0.07150298, 0.4275072, 1, 0, 0.772549, 1,
1.030909, -2.398882, 3.852043, 1, 0, 0.7686275, 1,
1.033339, -0.4468791, 1.515749, 1, 0, 0.7607843, 1,
1.036436, -1.191409, 2.392496, 1, 0, 0.7568628, 1,
1.044774, 0.5204622, 1.44953, 1, 0, 0.7490196, 1,
1.045712, 0.9904895, 1.498352, 1, 0, 0.7450981, 1,
1.046802, 0.0519214, 1.397266, 1, 0, 0.7372549, 1,
1.050349, -3.11478, 1.986925, 1, 0, 0.7333333, 1,
1.053832, 2.92569, 0.9026276, 1, 0, 0.7254902, 1,
1.054469, -2.614441, 3.289766, 1, 0, 0.7215686, 1,
1.062187, 1.275659, 0.2202145, 1, 0, 0.7137255, 1,
1.062906, -0.1106368, 1.465277, 1, 0, 0.7098039, 1,
1.072457, 1.192881, 1.312491, 1, 0, 0.7019608, 1,
1.083392, 1.227453, 0.5013652, 1, 0, 0.6941177, 1,
1.085199, 0.817925, -0.1788694, 1, 0, 0.6901961, 1,
1.08857, 0.2184042, 2.142432, 1, 0, 0.682353, 1,
1.089159, -1.262075, 2.34917, 1, 0, 0.6784314, 1,
1.094396, 1.32598, 1.240544, 1, 0, 0.6705883, 1,
1.097766, -0.02551291, 1.012009, 1, 0, 0.6666667, 1,
1.102836, 0.555748, 1.201111, 1, 0, 0.6588235, 1,
1.103839, 0.2546718, 0.3120658, 1, 0, 0.654902, 1,
1.107182, -1.206326, 1.963651, 1, 0, 0.6470588, 1,
1.109312, -1.016576, 2.089917, 1, 0, 0.6431373, 1,
1.111757, -0.3003284, 2.262015, 1, 0, 0.6352941, 1,
1.11187, 1.028418, 0.4116175, 1, 0, 0.6313726, 1,
1.11427, 0.6002498, 0.1934189, 1, 0, 0.6235294, 1,
1.121454, -0.8486192, 2.940614, 1, 0, 0.6196079, 1,
1.124842, -1.247904, 1.621539, 1, 0, 0.6117647, 1,
1.132922, 0.3684225, 1.022933, 1, 0, 0.6078432, 1,
1.136634, -0.2273887, 1.130466, 1, 0, 0.6, 1,
1.137905, -0.2108764, 1.072136, 1, 0, 0.5921569, 1,
1.140894, 1.515863, 2.078037, 1, 0, 0.5882353, 1,
1.141521, -1.664808, 2.672874, 1, 0, 0.5803922, 1,
1.146779, -0.1791354, 2.760302, 1, 0, 0.5764706, 1,
1.149622, 1.487463, 0.2026406, 1, 0, 0.5686275, 1,
1.157868, 1.293162, 1.501725, 1, 0, 0.5647059, 1,
1.168912, -0.2534254, 2.775255, 1, 0, 0.5568628, 1,
1.169823, -0.6257858, 0.7545351, 1, 0, 0.5529412, 1,
1.178761, 0.7894391, 0.889134, 1, 0, 0.5450981, 1,
1.185139, 0.2958028, 1.939765, 1, 0, 0.5411765, 1,
1.192798, 0.1024883, 1.767837, 1, 0, 0.5333334, 1,
1.199093, 0.3945116, 0.0410044, 1, 0, 0.5294118, 1,
1.208586, 0.3752657, 0.006441711, 1, 0, 0.5215687, 1,
1.210832, 0.3350504, 2.529021, 1, 0, 0.5176471, 1,
1.213291, -0.7069522, 2.71158, 1, 0, 0.509804, 1,
1.215965, 1.503192, 2.015231, 1, 0, 0.5058824, 1,
1.219158, 0.04869453, 1.292672, 1, 0, 0.4980392, 1,
1.227308, -0.2778677, 0.7143649, 1, 0, 0.4901961, 1,
1.232728, 0.9928979, 1.429464, 1, 0, 0.4862745, 1,
1.241697, -1.240038, 3.174855, 1, 0, 0.4784314, 1,
1.249758, 0.1446291, 1.087332, 1, 0, 0.4745098, 1,
1.250296, -0.8217833, 3.82219, 1, 0, 0.4666667, 1,
1.260439, 0.028187, 2.582538, 1, 0, 0.4627451, 1,
1.290896, -0.3028941, 2.367255, 1, 0, 0.454902, 1,
1.297076, -0.2236966, -0.4071348, 1, 0, 0.4509804, 1,
1.303816, 0.1072279, 1.290424, 1, 0, 0.4431373, 1,
1.309473, -1.067539, 1.346592, 1, 0, 0.4392157, 1,
1.31246, 0.09416326, 2.293367, 1, 0, 0.4313726, 1,
1.322948, 1.419111, -0.8778134, 1, 0, 0.427451, 1,
1.3323, 0.3904548, 0.3661972, 1, 0, 0.4196078, 1,
1.332617, 0.9470072, 1.944615, 1, 0, 0.4156863, 1,
1.333163, -0.4731608, 0.7643195, 1, 0, 0.4078431, 1,
1.338104, 0.3751679, 0.764751, 1, 0, 0.4039216, 1,
1.339175, -0.6263156, 2.750511, 1, 0, 0.3960784, 1,
1.35787, 0.5053617, 1.578283, 1, 0, 0.3882353, 1,
1.363968, -0.7177283, 0.430472, 1, 0, 0.3843137, 1,
1.378267, -0.1163006, 2.136806, 1, 0, 0.3764706, 1,
1.390284, 0.7434704, -0.525898, 1, 0, 0.372549, 1,
1.39356, -0.4575473, 1.091807, 1, 0, 0.3647059, 1,
1.397619, -0.5258965, 4.005976, 1, 0, 0.3607843, 1,
1.408223, 0.3613662, 1.459257, 1, 0, 0.3529412, 1,
1.421296, -0.6650075, 2.924327, 1, 0, 0.3490196, 1,
1.428135, 0.992681, 3.928226, 1, 0, 0.3411765, 1,
1.431735, -0.162487, -0.3079328, 1, 0, 0.3372549, 1,
1.44108, 1.063595, 2.863241, 1, 0, 0.3294118, 1,
1.446581, -0.3203951, 2.24823, 1, 0, 0.3254902, 1,
1.452634, -1.059526, 2.44223, 1, 0, 0.3176471, 1,
1.468562, -0.1228397, 0.9241487, 1, 0, 0.3137255, 1,
1.483606, 0.9785197, 2.014678, 1, 0, 0.3058824, 1,
1.484627, 0.1425681, 2.202236, 1, 0, 0.2980392, 1,
1.486541, -1.951118, 3.550407, 1, 0, 0.2941177, 1,
1.489004, 0.08365253, 1.488107, 1, 0, 0.2862745, 1,
1.492305, 0.1311853, 2.190364, 1, 0, 0.282353, 1,
1.535185, 0.2848143, 1.634175, 1, 0, 0.2745098, 1,
1.549655, 0.7578341, 1.976975, 1, 0, 0.2705882, 1,
1.55036, -1.570615, 1.767636, 1, 0, 0.2627451, 1,
1.56497, 0.2780384, 1.325544, 1, 0, 0.2588235, 1,
1.600019, -1.87095, 3.741428, 1, 0, 0.2509804, 1,
1.610759, -0.5502869, 3.122227, 1, 0, 0.2470588, 1,
1.62472, 2.799139, 1.377447, 1, 0, 0.2392157, 1,
1.648354, 0.679059, 2.627523, 1, 0, 0.2352941, 1,
1.652758, 1.148976, 0.5544344, 1, 0, 0.227451, 1,
1.670696, 0.913964, 0.6335323, 1, 0, 0.2235294, 1,
1.672061, 1.730845, -0.6072052, 1, 0, 0.2156863, 1,
1.683067, 0.03071722, 1.019777, 1, 0, 0.2117647, 1,
1.703984, 0.2633945, 2.117655, 1, 0, 0.2039216, 1,
1.707546, -1.207993, 3.13484, 1, 0, 0.1960784, 1,
1.712677, 1.255571, -0.7365629, 1, 0, 0.1921569, 1,
1.713957, -0.5015492, 2.83221, 1, 0, 0.1843137, 1,
1.722758, -0.4552367, 0.5181198, 1, 0, 0.1803922, 1,
1.743847, 1.029381, 1.026933, 1, 0, 0.172549, 1,
1.762018, 0.5842335, 1.255923, 1, 0, 0.1686275, 1,
1.763651, 0.3884332, 1.875084, 1, 0, 0.1607843, 1,
1.768736, 1.179386, 0.9647535, 1, 0, 0.1568628, 1,
1.798549, 0.8683653, 1.639788, 1, 0, 0.1490196, 1,
1.803012, 0.8640923, 1.280082, 1, 0, 0.145098, 1,
1.807975, -2.300913, 1.724959, 1, 0, 0.1372549, 1,
1.816382, 0.7420719, 1.619228, 1, 0, 0.1333333, 1,
1.826605, 0.07182045, 3.16617, 1, 0, 0.1254902, 1,
1.840459, -1.725441, 0.6680403, 1, 0, 0.1215686, 1,
1.844882, -1.311306, 2.509776, 1, 0, 0.1137255, 1,
1.917969, 0.9229044, 1.356754, 1, 0, 0.1098039, 1,
1.936333, -2.406098, 2.534257, 1, 0, 0.1019608, 1,
1.947972, 0.9953915, 1.618783, 1, 0, 0.09411765, 1,
1.987222, -0.8648298, 2.073433, 1, 0, 0.09019608, 1,
1.992612, -0.3892262, 0.5438387, 1, 0, 0.08235294, 1,
2.005089, 0.0424509, 1.720703, 1, 0, 0.07843138, 1,
2.013498, -1.254184, 1.997559, 1, 0, 0.07058824, 1,
2.077888, 0.3629408, 0.8913635, 1, 0, 0.06666667, 1,
2.078681, -1.310912, 1.986744, 1, 0, 0.05882353, 1,
2.101903, 1.127378, 0.9291208, 1, 0, 0.05490196, 1,
2.202969, -0.0002106094, 1.648668, 1, 0, 0.04705882, 1,
2.208707, -1.631868, 1.208346, 1, 0, 0.04313726, 1,
2.217885, 2.430725, 0.9939262, 1, 0, 0.03529412, 1,
2.223586, -0.5776466, 3.172392, 1, 0, 0.03137255, 1,
2.43897, 0.4906954, 0.5832983, 1, 0, 0.02352941, 1,
2.695644, 1.043564, 0.5420232, 1, 0, 0.01960784, 1,
2.755133, 1.655487, -0.4029205, 1, 0, 0.01176471, 1,
3.099967, 0.7130616, 3.283221, 1, 0, 0.007843138, 1
]);
var buf7 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc7 = gl.getUniformLocation(prog7,"mvMatrix");
var prMatLoc7 = gl.getUniformLocation(prog7,"prMatrix");
// ****** text object 9 ******
var prog9  = gl.createProgram();
gl.attachShader(prog9, getShader( gl, "testglvshader9" ));
gl.attachShader(prog9, getShader( gl, "testglfshader9" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog9, 0, "aPos");
gl.bindAttribLocation(prog9, 1, "aCol");
gl.linkProgram(prog9);
var texts = [
"x"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX9 = texinfo.canvasX;
var canvasY9 = texinfo.canvasY;
var ofsLoc9 = gl.getAttribLocation(prog9, "aOfs");
var texture9 = gl.createTexture();
var texLoc9 = gl.getAttribLocation(prog9, "aTexcoord");
var sampler9 = gl.getUniformLocation(prog9,"uSampler");
handleLoadedTexture(texture9, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
0.02399135, -4.175665, -7.670165, 0, -0.5, 0.5, 0.5,
0.02399135, -4.175665, -7.670165, 1, -0.5, 0.5, 0.5,
0.02399135, -4.175665, -7.670165, 1, 1.5, 0.5, 0.5,
0.02399135, -4.175665, -7.670165, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf9 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf9 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc9 = gl.getUniformLocation(prog9,"mvMatrix");
var prMatLoc9 = gl.getUniformLocation(prog9,"prMatrix");
var textScaleLoc9 = gl.getUniformLocation(prog9,"textScale");
// ****** text object 10 ******
var prog10  = gl.createProgram();
gl.attachShader(prog10, getShader( gl, "testglvshader10" ));
gl.attachShader(prog10, getShader( gl, "testglfshader10" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog10, 0, "aPos");
gl.bindAttribLocation(prog10, 1, "aCol");
gl.linkProgram(prog10);
var texts = [
"y"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX10 = texinfo.canvasX;
var canvasY10 = texinfo.canvasY;
var ofsLoc10 = gl.getAttribLocation(prog10, "aOfs");
var texture10 = gl.createTexture();
var texLoc10 = gl.getAttribLocation(prog10, "aTexcoord");
var sampler10 = gl.getUniformLocation(prog10,"uSampler");
handleLoadedTexture(texture10, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.09474, 0.01467407, -7.670165, 0, -0.5, 0.5, 0.5,
-4.09474, 0.01467407, -7.670165, 1, -0.5, 0.5, 0.5,
-4.09474, 0.01467407, -7.670165, 1, 1.5, 0.5, 0.5,
-4.09474, 0.01467407, -7.670165, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf10 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf10 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc10 = gl.getUniformLocation(prog10,"mvMatrix");
var prMatLoc10 = gl.getUniformLocation(prog10,"prMatrix");
var textScaleLoc10 = gl.getUniformLocation(prog10,"textScale");
// ****** text object 11 ******
var prog11  = gl.createProgram();
gl.attachShader(prog11, getShader( gl, "testglvshader11" ));
gl.attachShader(prog11, getShader( gl, "testglfshader11" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog11, 0, "aPos");
gl.bindAttribLocation(prog11, 1, "aCol");
gl.linkProgram(prog11);
var texts = [
"z"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX11 = texinfo.canvasX;
var canvasY11 = texinfo.canvasY;
var ofsLoc11 = gl.getAttribLocation(prog11, "aOfs");
var texture11 = gl.createTexture();
var texLoc11 = gl.getAttribLocation(prog11, "aTexcoord");
var sampler11 = gl.getUniformLocation(prog11,"uSampler");
handleLoadedTexture(texture11, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.09474, -4.175665, -0.3180571, 0, -0.5, 0.5, 0.5,
-4.09474, -4.175665, -0.3180571, 1, -0.5, 0.5, 0.5,
-4.09474, -4.175665, -0.3180571, 1, 1.5, 0.5, 0.5,
-4.09474, -4.175665, -0.3180571, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf11 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf11 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc11 = gl.getUniformLocation(prog11,"mvMatrix");
var prMatLoc11 = gl.getUniformLocation(prog11,"prMatrix");
var textScaleLoc11 = gl.getUniformLocation(prog11,"textScale");
// ****** lines object 12 ******
var prog12  = gl.createProgram();
gl.attachShader(prog12, getShader( gl, "testglvshader12" ));
gl.attachShader(prog12, getShader( gl, "testglfshader12" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog12, 0, "aPos");
gl.bindAttribLocation(prog12, 1, "aCol");
gl.linkProgram(prog12);
var v=new Float32Array([
-3, -3.208664, -5.973525,
3, -3.208664, -5.973525,
-3, -3.208664, -5.973525,
-3, -3.369831, -6.256298,
-2, -3.208664, -5.973525,
-2, -3.369831, -6.256298,
-1, -3.208664, -5.973525,
-1, -3.369831, -6.256298,
0, -3.208664, -5.973525,
0, -3.369831, -6.256298,
1, -3.208664, -5.973525,
1, -3.369831, -6.256298,
2, -3.208664, -5.973525,
2, -3.369831, -6.256298,
3, -3.208664, -5.973525,
3, -3.369831, -6.256298
]);
var buf12 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc12 = gl.getUniformLocation(prog12,"mvMatrix");
var prMatLoc12 = gl.getUniformLocation(prog12,"prMatrix");
// ****** text object 13 ******
var prog13  = gl.createProgram();
gl.attachShader(prog13, getShader( gl, "testglvshader13" ));
gl.attachShader(prog13, getShader( gl, "testglfshader13" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog13, 0, "aPos");
gl.bindAttribLocation(prog13, 1, "aCol");
gl.linkProgram(prog13);
var texts = [
"-3",
"-2",
"-1",
"0",
"1",
"2",
"3"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX13 = texinfo.canvasX;
var canvasY13 = texinfo.canvasY;
var ofsLoc13 = gl.getAttribLocation(prog13, "aOfs");
var texture13 = gl.createTexture();
var texLoc13 = gl.getAttribLocation(prog13, "aTexcoord");
var sampler13 = gl.getUniformLocation(prog13,"uSampler");
handleLoadedTexture(texture13, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3, -3.692165, -6.821845, 0, -0.5, 0.5, 0.5,
-3, -3.692165, -6.821845, 1, -0.5, 0.5, 0.5,
-3, -3.692165, -6.821845, 1, 1.5, 0.5, 0.5,
-3, -3.692165, -6.821845, 0, 1.5, 0.5, 0.5,
-2, -3.692165, -6.821845, 0, -0.5, 0.5, 0.5,
-2, -3.692165, -6.821845, 1, -0.5, 0.5, 0.5,
-2, -3.692165, -6.821845, 1, 1.5, 0.5, 0.5,
-2, -3.692165, -6.821845, 0, 1.5, 0.5, 0.5,
-1, -3.692165, -6.821845, 0, -0.5, 0.5, 0.5,
-1, -3.692165, -6.821845, 1, -0.5, 0.5, 0.5,
-1, -3.692165, -6.821845, 1, 1.5, 0.5, 0.5,
-1, -3.692165, -6.821845, 0, 1.5, 0.5, 0.5,
0, -3.692165, -6.821845, 0, -0.5, 0.5, 0.5,
0, -3.692165, -6.821845, 1, -0.5, 0.5, 0.5,
0, -3.692165, -6.821845, 1, 1.5, 0.5, 0.5,
0, -3.692165, -6.821845, 0, 1.5, 0.5, 0.5,
1, -3.692165, -6.821845, 0, -0.5, 0.5, 0.5,
1, -3.692165, -6.821845, 1, -0.5, 0.5, 0.5,
1, -3.692165, -6.821845, 1, 1.5, 0.5, 0.5,
1, -3.692165, -6.821845, 0, 1.5, 0.5, 0.5,
2, -3.692165, -6.821845, 0, -0.5, 0.5, 0.5,
2, -3.692165, -6.821845, 1, -0.5, 0.5, 0.5,
2, -3.692165, -6.821845, 1, 1.5, 0.5, 0.5,
2, -3.692165, -6.821845, 0, 1.5, 0.5, 0.5,
3, -3.692165, -6.821845, 0, -0.5, 0.5, 0.5,
3, -3.692165, -6.821845, 1, -0.5, 0.5, 0.5,
3, -3.692165, -6.821845, 1, 1.5, 0.5, 0.5,
3, -3.692165, -6.821845, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<7; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23,
24, 25, 26, 24, 26, 27
]);
var buf13 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf13 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc13 = gl.getUniformLocation(prog13,"mvMatrix");
var prMatLoc13 = gl.getUniformLocation(prog13,"prMatrix");
var textScaleLoc13 = gl.getUniformLocation(prog13,"textScale");
// ****** lines object 14 ******
var prog14  = gl.createProgram();
gl.attachShader(prog14, getShader( gl, "testglvshader14" ));
gl.attachShader(prog14, getShader( gl, "testglfshader14" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog14, 0, "aPos");
gl.bindAttribLocation(prog14, 1, "aCol");
gl.linkProgram(prog14);
var v=new Float32Array([
-3.144263, -3, -5.973525,
-3.144263, 3, -5.973525,
-3.144263, -3, -5.973525,
-3.302676, -3, -6.256298,
-3.144263, -2, -5.973525,
-3.302676, -2, -6.256298,
-3.144263, -1, -5.973525,
-3.302676, -1, -6.256298,
-3.144263, 0, -5.973525,
-3.302676, 0, -6.256298,
-3.144263, 1, -5.973525,
-3.302676, 1, -6.256298,
-3.144263, 2, -5.973525,
-3.302676, 2, -6.256298,
-3.144263, 3, -5.973525,
-3.302676, 3, -6.256298
]);
var buf14 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc14 = gl.getUniformLocation(prog14,"mvMatrix");
var prMatLoc14 = gl.getUniformLocation(prog14,"prMatrix");
// ****** text object 15 ******
var prog15  = gl.createProgram();
gl.attachShader(prog15, getShader( gl, "testglvshader15" ));
gl.attachShader(prog15, getShader( gl, "testglfshader15" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog15, 0, "aPos");
gl.bindAttribLocation(prog15, 1, "aCol");
gl.linkProgram(prog15);
var texts = [
"-3",
"-2",
"-1",
"0",
"1",
"2",
"3"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX15 = texinfo.canvasX;
var canvasY15 = texinfo.canvasY;
var ofsLoc15 = gl.getAttribLocation(prog15, "aOfs");
var texture15 = gl.createTexture();
var texLoc15 = gl.getAttribLocation(prog15, "aTexcoord");
var sampler15 = gl.getUniformLocation(prog15,"uSampler");
handleLoadedTexture(texture15, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.619502, -3, -6.821845, 0, -0.5, 0.5, 0.5,
-3.619502, -3, -6.821845, 1, -0.5, 0.5, 0.5,
-3.619502, -3, -6.821845, 1, 1.5, 0.5, 0.5,
-3.619502, -3, -6.821845, 0, 1.5, 0.5, 0.5,
-3.619502, -2, -6.821845, 0, -0.5, 0.5, 0.5,
-3.619502, -2, -6.821845, 1, -0.5, 0.5, 0.5,
-3.619502, -2, -6.821845, 1, 1.5, 0.5, 0.5,
-3.619502, -2, -6.821845, 0, 1.5, 0.5, 0.5,
-3.619502, -1, -6.821845, 0, -0.5, 0.5, 0.5,
-3.619502, -1, -6.821845, 1, -0.5, 0.5, 0.5,
-3.619502, -1, -6.821845, 1, 1.5, 0.5, 0.5,
-3.619502, -1, -6.821845, 0, 1.5, 0.5, 0.5,
-3.619502, 0, -6.821845, 0, -0.5, 0.5, 0.5,
-3.619502, 0, -6.821845, 1, -0.5, 0.5, 0.5,
-3.619502, 0, -6.821845, 1, 1.5, 0.5, 0.5,
-3.619502, 0, -6.821845, 0, 1.5, 0.5, 0.5,
-3.619502, 1, -6.821845, 0, -0.5, 0.5, 0.5,
-3.619502, 1, -6.821845, 1, -0.5, 0.5, 0.5,
-3.619502, 1, -6.821845, 1, 1.5, 0.5, 0.5,
-3.619502, 1, -6.821845, 0, 1.5, 0.5, 0.5,
-3.619502, 2, -6.821845, 0, -0.5, 0.5, 0.5,
-3.619502, 2, -6.821845, 1, -0.5, 0.5, 0.5,
-3.619502, 2, -6.821845, 1, 1.5, 0.5, 0.5,
-3.619502, 2, -6.821845, 0, 1.5, 0.5, 0.5,
-3.619502, 3, -6.821845, 0, -0.5, 0.5, 0.5,
-3.619502, 3, -6.821845, 1, -0.5, 0.5, 0.5,
-3.619502, 3, -6.821845, 1, 1.5, 0.5, 0.5,
-3.619502, 3, -6.821845, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<7; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23,
24, 25, 26, 24, 26, 27
]);
var buf15 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf15 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc15 = gl.getUniformLocation(prog15,"mvMatrix");
var prMatLoc15 = gl.getUniformLocation(prog15,"prMatrix");
var textScaleLoc15 = gl.getUniformLocation(prog15,"textScale");
// ****** lines object 16 ******
var prog16  = gl.createProgram();
gl.attachShader(prog16, getShader( gl, "testglvshader16" ));
gl.attachShader(prog16, getShader( gl, "testglfshader16" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog16, 0, "aPos");
gl.bindAttribLocation(prog16, 1, "aCol");
gl.linkProgram(prog16);
var v=new Float32Array([
-3.144263, -3.208664, -4,
-3.144263, -3.208664, 4,
-3.144263, -3.208664, -4,
-3.302676, -3.369831, -4,
-3.144263, -3.208664, -2,
-3.302676, -3.369831, -2,
-3.144263, -3.208664, 0,
-3.302676, -3.369831, 0,
-3.144263, -3.208664, 2,
-3.302676, -3.369831, 2,
-3.144263, -3.208664, 4,
-3.302676, -3.369831, 4
]);
var buf16 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc16 = gl.getUniformLocation(prog16,"mvMatrix");
var prMatLoc16 = gl.getUniformLocation(prog16,"prMatrix");
// ****** text object 17 ******
var prog17  = gl.createProgram();
gl.attachShader(prog17, getShader( gl, "testglvshader17" ));
gl.attachShader(prog17, getShader( gl, "testglfshader17" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog17, 0, "aPos");
gl.bindAttribLocation(prog17, 1, "aCol");
gl.linkProgram(prog17);
var texts = [
"-4",
"-2",
"0",
"2",
"4"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX17 = texinfo.canvasX;
var canvasY17 = texinfo.canvasY;
var ofsLoc17 = gl.getAttribLocation(prog17, "aOfs");
var texture17 = gl.createTexture();
var texLoc17 = gl.getAttribLocation(prog17, "aTexcoord");
var sampler17 = gl.getUniformLocation(prog17,"uSampler");
handleLoadedTexture(texture17, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.619502, -3.692165, -4, 0, -0.5, 0.5, 0.5,
-3.619502, -3.692165, -4, 1, -0.5, 0.5, 0.5,
-3.619502, -3.692165, -4, 1, 1.5, 0.5, 0.5,
-3.619502, -3.692165, -4, 0, 1.5, 0.5, 0.5,
-3.619502, -3.692165, -2, 0, -0.5, 0.5, 0.5,
-3.619502, -3.692165, -2, 1, -0.5, 0.5, 0.5,
-3.619502, -3.692165, -2, 1, 1.5, 0.5, 0.5,
-3.619502, -3.692165, -2, 0, 1.5, 0.5, 0.5,
-3.619502, -3.692165, 0, 0, -0.5, 0.5, 0.5,
-3.619502, -3.692165, 0, 1, -0.5, 0.5, 0.5,
-3.619502, -3.692165, 0, 1, 1.5, 0.5, 0.5,
-3.619502, -3.692165, 0, 0, 1.5, 0.5, 0.5,
-3.619502, -3.692165, 2, 0, -0.5, 0.5, 0.5,
-3.619502, -3.692165, 2, 1, -0.5, 0.5, 0.5,
-3.619502, -3.692165, 2, 1, 1.5, 0.5, 0.5,
-3.619502, -3.692165, 2, 0, 1.5, 0.5, 0.5,
-3.619502, -3.692165, 4, 0, -0.5, 0.5, 0.5,
-3.619502, -3.692165, 4, 1, -0.5, 0.5, 0.5,
-3.619502, -3.692165, 4, 1, 1.5, 0.5, 0.5,
-3.619502, -3.692165, 4, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<5; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19
]);
var buf17 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf17 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc17 = gl.getUniformLocation(prog17,"mvMatrix");
var prMatLoc17 = gl.getUniformLocation(prog17,"prMatrix");
var textScaleLoc17 = gl.getUniformLocation(prog17,"textScale");
// ****** lines object 18 ******
var prog18  = gl.createProgram();
gl.attachShader(prog18, getShader( gl, "testglvshader18" ));
gl.attachShader(prog18, getShader( gl, "testglfshader18" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog18, 0, "aPos");
gl.bindAttribLocation(prog18, 1, "aCol");
gl.linkProgram(prog18);
var v=new Float32Array([
-3.144263, -3.208664, -5.973525,
-3.144263, 3.238012, -5.973525,
-3.144263, -3.208664, 5.33741,
-3.144263, 3.238012, 5.33741,
-3.144263, -3.208664, -5.973525,
-3.144263, -3.208664, 5.33741,
-3.144263, 3.238012, -5.973525,
-3.144263, 3.238012, 5.33741,
-3.144263, -3.208664, -5.973525,
3.192246, -3.208664, -5.973525,
-3.144263, -3.208664, 5.33741,
3.192246, -3.208664, 5.33741,
-3.144263, 3.238012, -5.973525,
3.192246, 3.238012, -5.973525,
-3.144263, 3.238012, 5.33741,
3.192246, 3.238012, 5.33741,
3.192246, -3.208664, -5.973525,
3.192246, 3.238012, -5.973525,
3.192246, -3.208664, 5.33741,
3.192246, 3.238012, 5.33741,
3.192246, -3.208664, -5.973525,
3.192246, -3.208664, 5.33741,
3.192246, 3.238012, -5.973525,
3.192246, 3.238012, 5.33741
]);
var buf18 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc18 = gl.getUniformLocation(prog18,"mvMatrix");
var prMatLoc18 = gl.getUniformLocation(prog18,"prMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 1 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 7.73163;
var distance = 34.3989;
var t = tan(fov[1]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[1], hlen*aspect*zoom[1], 
-hlen*zoom[1], hlen*zoom[1], near, far);
else  
prMatrix.frustum(-hlen*zoom[1], hlen*zoom[1], 
-hlen*zoom[1]/aspect, hlen*zoom[1]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( -0.02399135, -0.01467407, 0.3180571 );
mvMatrix.scale( 1.319274, 1.296729, 0.7390715 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.3989);
// ****** points object 7 *******
gl.useProgram(prog7);
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.uniformMatrix4fv( prMatLoc7, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc7, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.enableVertexAttribArray( colLoc );
gl.vertexAttribPointer(colLoc, 4, gl.FLOAT, false, 28, 12);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawArrays(gl.POINTS, 0, 1000);
// ****** text object 9 *******
gl.useProgram(prog9);
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.uniformMatrix4fv( prMatLoc9, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc9, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc9, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc9 );
gl.vertexAttribPointer(texLoc9, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture9);
gl.uniform1i( sampler9, 0);
gl.enableVertexAttribArray( ofsLoc9 );
gl.vertexAttribPointer(ofsLoc9, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 10 *******
gl.useProgram(prog10);
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.uniformMatrix4fv( prMatLoc10, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc10, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc10, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc10 );
gl.vertexAttribPointer(texLoc10, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture10);
gl.uniform1i( sampler10, 0);
gl.enableVertexAttribArray( ofsLoc10 );
gl.vertexAttribPointer(ofsLoc10, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 11 *******
gl.useProgram(prog11);
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.uniformMatrix4fv( prMatLoc11, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc11, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc11, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc11 );
gl.vertexAttribPointer(texLoc11, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture11);
gl.uniform1i( sampler11, 0);
gl.enableVertexAttribArray( ofsLoc11 );
gl.vertexAttribPointer(ofsLoc11, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** lines object 12 *******
gl.useProgram(prog12);
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.uniformMatrix4fv( prMatLoc12, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc12, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 16);
// ****** text object 13 *******
gl.useProgram(prog13);
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.uniformMatrix4fv( prMatLoc13, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc13, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc13, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc13 );
gl.vertexAttribPointer(texLoc13, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture13);
gl.uniform1i( sampler13, 0);
gl.enableVertexAttribArray( ofsLoc13 );
gl.vertexAttribPointer(ofsLoc13, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
// ****** lines object 14 *******
gl.useProgram(prog14);
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.uniformMatrix4fv( prMatLoc14, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc14, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 16);
// ****** text object 15 *******
gl.useProgram(prog15);
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.uniformMatrix4fv( prMatLoc15, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc15, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc15, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc15 );
gl.vertexAttribPointer(texLoc15, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture15);
gl.uniform1i( sampler15, 0);
gl.enableVertexAttribArray( ofsLoc15 );
gl.vertexAttribPointer(ofsLoc15, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
// ****** lines object 16 *******
gl.useProgram(prog16);
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.uniformMatrix4fv( prMatLoc16, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc16, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 12);
// ****** text object 17 *******
gl.useProgram(prog17);
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.uniformMatrix4fv( prMatLoc17, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc17, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc17, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc17 );
gl.vertexAttribPointer(texLoc17, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture17);
gl.uniform1i( sampler17, 0);
gl.enableVertexAttribArray( ofsLoc17 );
gl.vertexAttribPointer(ofsLoc17, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
// ****** lines object 18 *******
gl.useProgram(prog18);
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.uniformMatrix4fv( prMatLoc18, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc18, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 24);
gl.flush ();
}
var vpx0 = {
1: 0
};
var vpy0 = {
1: 0
};
var vpWidths = {
1: 504
};
var vpHeights = {
1: 504
};
var activeModel = {
1: 1
};
var activeProjection = {
1: 1
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(1);
return(1);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testglcanvas" width="1" height="1"></canvas> 
<p id="testgldebug">
You must enable Javascript to view this page properly.</p>
<script>testglwebGLStart();</script>

The following a 3D image is of Atrazine rendered from the 3D conformer file derived from here (http://pubchem.ncbi.nlm.nih.gov/compound/2256). The atoms are represented as spheres Nitrogen as blue, carbon as black, hydrogen as white, and chlorine as blue.


```r
open3d()
```

```
## glX 
##   2
```

```r
sodium_dehydroacetat<-read.table("sodium_dehydroacetat.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-sodium_dehydroacetat$V2
```

```
## Error in eval(expr, envir, enclos): object 'sodium_dehydroacetat' not found
```

```r
y<-sodium_dehydroacetat$V3
```

```
## Error in eval(expr, envir, enclos): object 'sodium_dehydroacetat' not found
```

```r
z<-sodium_dehydroacetat$V4
```

```
## Error in eval(expr, envir, enclos): object 'sodium_dehydroacetat' not found
```

```r
atomcolor=c(rep("blue", 1), rep("red", 5), rep("black", 7), rep("white", 15))
#spheres3d(x, y, z, col=rainbow(1000))
spheres3d(x, y, z, col=atomcolor)
```

<canvas id="testgl2textureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** spheres object 25 ****** -->
<script id="testgl2vshader25" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec3 aNorm;
uniform mat4 normMatrix;
varying vec3 vNormal;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
vNormal = normalize((normMatrix * vec4(aNorm, 1.)).xyz);
}
</script>
<script id="testgl2fshader25" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec3 vNormal;
void main(void) {
vec3 eye = normalize(-vPosition.xyz);
const vec3 emission = vec3(0., 0., 0.);
const vec3 ambient1 = vec3(0., 0., 0.);
const vec3 specular1 = vec3(1., 1., 1.);// light*material
const float shininess1 = 50.;
vec4 colDiff1 = vec4(vCol.rgb * vec3(1., 1., 1.), vCol.a);
const vec3 lightDir1 = vec3(0., 0., 1.);
vec3 halfVec1 = normalize(lightDir1 + eye);
vec4 lighteffect = vec4(emission, 0.);
vec3 n = normalize(vNormal);
n = -faceforward(n, n, eye);
vec3 col1 = ambient1;
float nDotL1 = dot(n, lightDir1);
col1 = col1 + max(nDotL1, 0.) * colDiff1.rgb;
col1 = col1 + pow(max(dot(halfVec1, n), 0.), shininess1) * specular1;
lighteffect = lighteffect + vec4(col1, colDiff1.a);
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testgl2webGLStart() {
var debug = function(msg) {
document.getElementById("testgl2debug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testgl2canvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 19;
zoom[19] = 1;
fov[19] = 30;
userMatrix[19] = new CanvasMatrix4();
userMatrix[19].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgl2textureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
// ****** sphere object ******
var v=new Float32Array([
-1, 0, 0,
1, 0, 0,
0, -1, 0,
0, 1, 0,
0, 0, -1,
0, 0, 1,
-0.7071068, 0, -0.7071068,
-0.7071068, -0.7071068, 0,
0, -0.7071068, -0.7071068,
-0.7071068, 0, 0.7071068,
0, -0.7071068, 0.7071068,
-0.7071068, 0.7071068, 0,
0, 0.7071068, -0.7071068,
0, 0.7071068, 0.7071068,
0.7071068, -0.7071068, 0,
0.7071068, 0, -0.7071068,
0.7071068, 0, 0.7071068,
0.7071068, 0.7071068, 0,
-0.9349975, 0, -0.3546542,
-0.9349975, -0.3546542, 0,
-0.77044, -0.4507894, -0.4507894,
0, -0.3546542, -0.9349975,
-0.3546542, 0, -0.9349975,
-0.4507894, -0.4507894, -0.77044,
-0.3546542, -0.9349975, 0,
0, -0.9349975, -0.3546542,
-0.4507894, -0.77044, -0.4507894,
-0.9349975, 0, 0.3546542,
-0.77044, -0.4507894, 0.4507894,
0, -0.9349975, 0.3546542,
-0.4507894, -0.77044, 0.4507894,
-0.3546542, 0, 0.9349975,
0, -0.3546542, 0.9349975,
-0.4507894, -0.4507894, 0.77044,
-0.9349975, 0.3546542, 0,
-0.77044, 0.4507894, -0.4507894,
0, 0.9349975, -0.3546542,
-0.3546542, 0.9349975, 0,
-0.4507894, 0.77044, -0.4507894,
0, 0.3546542, -0.9349975,
-0.4507894, 0.4507894, -0.77044,
-0.77044, 0.4507894, 0.4507894,
0, 0.3546542, 0.9349975,
-0.4507894, 0.4507894, 0.77044,
0, 0.9349975, 0.3546542,
-0.4507894, 0.77044, 0.4507894,
0.9349975, -0.3546542, 0,
0.9349975, 0, -0.3546542,
0.77044, -0.4507894, -0.4507894,
0.3546542, -0.9349975, 0,
0.4507894, -0.77044, -0.4507894,
0.3546542, 0, -0.9349975,
0.4507894, -0.4507894, -0.77044,
0.9349975, 0, 0.3546542,
0.77044, -0.4507894, 0.4507894,
0.3546542, 0, 0.9349975,
0.4507894, -0.4507894, 0.77044,
0.4507894, -0.77044, 0.4507894,
0.9349975, 0.3546542, 0,
0.77044, 0.4507894, -0.4507894,
0.4507894, 0.4507894, -0.77044,
0.3546542, 0.9349975, 0,
0.4507894, 0.77044, -0.4507894,
0.77044, 0.4507894, 0.4507894,
0.4507894, 0.77044, 0.4507894,
0.4507894, 0.4507894, 0.77044
]);
var f=new Uint16Array([
0, 18, 19,
6, 20, 18,
7, 19, 20,
19, 18, 20,
4, 21, 22,
8, 23, 21,
6, 22, 23,
22, 21, 23,
2, 24, 25,
7, 26, 24,
8, 25, 26,
25, 24, 26,
7, 20, 26,
6, 23, 20,
8, 26, 23,
26, 20, 23,
0, 19, 27,
7, 28, 19,
9, 27, 28,
27, 19, 28,
2, 29, 24,
10, 30, 29,
7, 24, 30,
24, 29, 30,
5, 31, 32,
9, 33, 31,
10, 32, 33,
32, 31, 33,
9, 28, 33,
7, 30, 28,
10, 33, 30,
33, 28, 30,
0, 34, 18,
11, 35, 34,
6, 18, 35,
18, 34, 35,
3, 36, 37,
12, 38, 36,
11, 37, 38,
37, 36, 38,
4, 22, 39,
6, 40, 22,
12, 39, 40,
39, 22, 40,
6, 35, 40,
11, 38, 35,
12, 40, 38,
40, 35, 38,
0, 27, 34,
9, 41, 27,
11, 34, 41,
34, 27, 41,
5, 42, 31,
13, 43, 42,
9, 31, 43,
31, 42, 43,
3, 37, 44,
11, 45, 37,
13, 44, 45,
44, 37, 45,
11, 41, 45,
9, 43, 41,
13, 45, 43,
45, 41, 43,
1, 46, 47,
14, 48, 46,
15, 47, 48,
47, 46, 48,
2, 25, 49,
8, 50, 25,
14, 49, 50,
49, 25, 50,
4, 51, 21,
15, 52, 51,
8, 21, 52,
21, 51, 52,
15, 48, 52,
14, 50, 48,
8, 52, 50,
52, 48, 50,
1, 53, 46,
16, 54, 53,
14, 46, 54,
46, 53, 54,
5, 32, 55,
10, 56, 32,
16, 55, 56,
55, 32, 56,
2, 49, 29,
14, 57, 49,
10, 29, 57,
29, 49, 57,
14, 54, 57,
16, 56, 54,
10, 57, 56,
57, 54, 56,
1, 47, 58,
15, 59, 47,
17, 58, 59,
58, 47, 59,
4, 39, 51,
12, 60, 39,
15, 51, 60,
51, 39, 60,
3, 61, 36,
17, 62, 61,
12, 36, 62,
36, 61, 62,
17, 59, 62,
15, 60, 59,
12, 62, 60,
62, 59, 60,
1, 58, 53,
17, 63, 58,
16, 53, 63,
53, 58, 63,
3, 44, 61,
13, 64, 44,
17, 61, 64,
61, 44, 64,
5, 55, 42,
16, 65, 55,
13, 42, 65,
42, 55, 65,
16, 63, 65,
17, 64, 63,
13, 65, 64,
65, 63, 64
]);
var sphereBuf = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var sphereIbuf = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
// ****** spheres object 25 ******
var prog25  = gl.createProgram();
gl.attachShader(prog25, getShader( gl, "testgl2vshader25" ));
gl.attachShader(prog25, getShader( gl, "testgl2fshader25" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog25, 0, "aPos");
gl.bindAttribLocation(prog25, 1, "aCol");
gl.linkProgram(prog25);
var v=new Float32Array([
-3.051984, -0.1896476, -1.551021, 0, 0, 1, 1, 1,
-2.96276, 0.9615445, -1.774192, 1, 0, 0, 1, 1,
-2.67787, -1.401374, -2.206115, 1, 0, 0, 1, 1,
-2.655936, -0.0879759, -0.8482027, 1, 0, 0, 1, 1,
-2.462913, 0.8472752, -2.18934, 1, 0, 0, 1, 1,
-2.454848, 0.7252198, -1.656322, 1, 0, 0, 1, 1,
-2.45411, -1.629273, -2.456113, 0, 0, 0, 1, 1,
-2.448552, 1.21372, -1.456014, 0, 0, 0, 1, 1,
-2.399059, -2.485108, -1.842359, 0, 0, 0, 1, 1,
-2.347161, 0.8253284, -1.541721, 0, 0, 0, 1, 1,
-2.34563, 1.591095, -0.9310421, 0, 0, 0, 1, 1,
-2.343305, 1.121565, -1.73724, 0, 0, 0, 1, 1,
-2.315326, 0.004206115, -1.398833, 0, 0, 0, 1, 1,
-2.302959, 1.660132, -1.879139, 1, 1, 1, 1, 1,
-2.22989, -1.717626, -3.732102, 1, 1, 1, 1, 1,
-2.207114, 0.8366043, -2.857015, 1, 1, 1, 1, 1,
-2.172845, -0.3900618, -1.149345, 1, 1, 1, 1, 1,
-2.163638, -0.3182983, -1.699551, 1, 1, 1, 1, 1,
-2.135455, 0.03220454, -2.618534, 1, 1, 1, 1, 1,
-2.13417, 1.820156, -0.3453818, 1, 1, 1, 1, 1,
-2.119383, -0.2003432, -0.8216298, 1, 1, 1, 1, 1,
-2.11761, 1.154548, 1.083981, 1, 1, 1, 1, 1,
-2.077478, 1.398824, 0.06503683, 1, 1, 1, 1, 1,
-2.073456, -0.4228, -1.89443, 1, 1, 1, 1, 1,
-2.064466, 0.008153973, -2.994691, 1, 1, 1, 1, 1,
-1.980355, -0.4537397, -1.707575, 1, 1, 1, 1, 1,
-1.952926, 1.448478, -1.343181, 1, 1, 1, 1, 1,
-1.919774, -0.8349341, -2.586073, 1, 1, 1, 1, 1,
-1.919495, -1.788725, -3.029552, 0, 0, 1, 1, 1,
-1.908724, -0.4958682, -1.707811, 1, 0, 0, 1, 1,
-1.88265, -1.478951, -2.316872, 1, 0, 0, 1, 1,
-1.839952, -2.104531, -2.573255, 1, 0, 0, 1, 1,
-1.784831, 0.6851937, -1.009903, 1, 0, 0, 1, 1,
-1.738663, 0.594353, -2.318201, 1, 0, 0, 1, 1,
-1.725147, -0.8555558, -3.580256, 0, 0, 0, 1, 1,
-1.724231, 0.9659086, -0.8073278, 0, 0, 0, 1, 1,
-1.688893, 0.6548489, -1.944793, 0, 0, 0, 1, 1,
-1.687707, 1.494144, 0.4708363, 0, 0, 0, 1, 1,
-1.676445, -0.7854117, -2.02829, 0, 0, 0, 1, 1,
-1.671279, 0.03568204, 0.003695399, 0, 0, 0, 1, 1,
-1.647085, -0.08944462, -0.778249, 0, 0, 0, 1, 1,
-1.638938, -0.2438753, -0.714314, 1, 1, 1, 1, 1,
-1.632386, 0.0924501, -3.04077, 1, 1, 1, 1, 1,
-1.615554, 0.9892573, -1.385915, 1, 1, 1, 1, 1,
-1.589842, 0.8403983, -0.3572804, 1, 1, 1, 1, 1,
-1.583761, -1.151992, -1.305633, 1, 1, 1, 1, 1,
-1.577085, 1.006781, -0.3805301, 1, 1, 1, 1, 1,
-1.575597, -0.03329805, -1.584461, 1, 1, 1, 1, 1,
-1.574948, 1.74225, 0.8288131, 1, 1, 1, 1, 1,
-1.571384, 0.005156558, -2.270965, 1, 1, 1, 1, 1,
-1.5683, -1.571749, -1.793588, 1, 1, 1, 1, 1,
-1.517704, -0.5657475, -3.259093, 1, 1, 1, 1, 1,
-1.514202, -0.3311643, -2.750415, 1, 1, 1, 1, 1,
-1.51166, -1.633193, -4.076902, 1, 1, 1, 1, 1,
-1.495001, -0.4468458, -3.007472, 1, 1, 1, 1, 1,
-1.489102, -0.8400695, -2.345845, 1, 1, 1, 1, 1,
-1.482502, 0.624405, -2.297019, 0, 0, 1, 1, 1,
-1.479092, 0.3779341, 0.7527485, 1, 0, 0, 1, 1,
-1.470681, -1.751986, -1.273943, 1, 0, 0, 1, 1,
-1.468904, 0.02364002, -2.867686, 1, 0, 0, 1, 1,
-1.465767, 0.1787718, -2.149863, 1, 0, 0, 1, 1,
-1.454272, -0.9216994, -2.976923, 1, 0, 0, 1, 1,
-1.453828, 0.3018212, -1.426845, 0, 0, 0, 1, 1,
-1.452877, 0.4960483, 0.01581785, 0, 0, 0, 1, 1,
-1.447468, 1.739506, 0.1032049, 0, 0, 0, 1, 1,
-1.44287, -2.860964, -4.836728, 0, 0, 0, 1, 1,
-1.442778, -0.8358858, -1.483606, 0, 0, 0, 1, 1,
-1.423907, -1.77902, -2.793291, 0, 0, 0, 1, 1,
-1.419793, 0.0920649, -2.42311, 0, 0, 0, 1, 1,
-1.419376, 0.3499244, -2.712965, 1, 1, 1, 1, 1,
-1.403905, -0.07606783, -1.414146, 1, 1, 1, 1, 1,
-1.399447, -0.7917128, -3.447421, 1, 1, 1, 1, 1,
-1.397852, -0.4396919, 0.1508143, 1, 1, 1, 1, 1,
-1.397655, 0.6016985, -0.9385597, 1, 1, 1, 1, 1,
-1.394068, -1.940369, -2.413017, 1, 1, 1, 1, 1,
-1.391942, 0.3688267, -0.481542, 1, 1, 1, 1, 1,
-1.378723, 2.369514, -0.2194044, 1, 1, 1, 1, 1,
-1.361786, -0.2690409, -1.502698, 1, 1, 1, 1, 1,
-1.344221, -1.257843, -2.933904, 1, 1, 1, 1, 1,
-1.34222, 0.2645741, -0.8894814, 1, 1, 1, 1, 1,
-1.33615, 0.2370535, -1.55566, 1, 1, 1, 1, 1,
-1.330158, 1.825215, 0.9957594, 1, 1, 1, 1, 1,
-1.32971, -1.540238, -2.136073, 1, 1, 1, 1, 1,
-1.321666, 1.417875, -0.4670439, 1, 1, 1, 1, 1,
-1.314543, -0.2605849, -1.155838, 0, 0, 1, 1, 1,
-1.311235, -1.128089, -3.360837, 1, 0, 0, 1, 1,
-1.303627, -0.1560814, -1.890368, 1, 0, 0, 1, 1,
-1.295136, -0.8310897, -2.350951, 1, 0, 0, 1, 1,
-1.29506, -0.2405009, -2.943536, 1, 0, 0, 1, 1,
-1.27532, 0.2880608, -1.159645, 1, 0, 0, 1, 1,
-1.267867, 0.9414526, -1.318599, 0, 0, 0, 1, 1,
-1.266131, -0.9445425, -2.092582, 0, 0, 0, 1, 1,
-1.260108, -0.8229993, -2.860263, 0, 0, 0, 1, 1,
-1.256178, -1.338858, -1.837596, 0, 0, 0, 1, 1,
-1.25296, 1.243952, -1.828245, 0, 0, 0, 1, 1,
-1.248316, -1.914643, -1.89527, 0, 0, 0, 1, 1,
-1.246096, 0.2396035, -2.256003, 0, 0, 0, 1, 1,
-1.237469, 0.3495064, 0.380982, 1, 1, 1, 1, 1,
-1.236344, -0.9223124, -2.922437, 1, 1, 1, 1, 1,
-1.227587, 0.5671224, -1.88918, 1, 1, 1, 1, 1,
-1.222512, -0.1088841, -2.900918, 1, 1, 1, 1, 1,
-1.220525, -0.1241992, -2.800614, 1, 1, 1, 1, 1,
-1.22017, -1.680985, -2.694863, 1, 1, 1, 1, 1,
-1.212182, -0.2095672, -2.032779, 1, 1, 1, 1, 1,
-1.211611, 1.495192, 0.8574489, 1, 1, 1, 1, 1,
-1.199442, 0.1872039, -1.214538, 1, 1, 1, 1, 1,
-1.198593, 1.379149, -0.6027305, 1, 1, 1, 1, 1,
-1.188099, 0.05450952, -1.843534, 1, 1, 1, 1, 1,
-1.188011, 0.7442914, -1.451019, 1, 1, 1, 1, 1,
-1.183933, 1.883732, -1.925601, 1, 1, 1, 1, 1,
-1.176677, -0.1148715, -0.4532773, 1, 1, 1, 1, 1,
-1.165026, -1.55139, -2.38592, 1, 1, 1, 1, 1,
-1.164406, -0.162369, -2.734348, 0, 0, 1, 1, 1,
-1.164084, 0.5492339, -1.685055, 1, 0, 0, 1, 1,
-1.16126, 1.099989, -1.035335, 1, 0, 0, 1, 1,
-1.158509, 0.6717843, -0.8487067, 1, 0, 0, 1, 1,
-1.158071, 0.6912435, 0.2272139, 1, 0, 0, 1, 1,
-1.157701, -0.3261041, -0.8910037, 1, 0, 0, 1, 1,
-1.148026, -0.4077426, -2.343653, 0, 0, 0, 1, 1,
-1.146375, 0.7489246, -0.6294321, 0, 0, 0, 1, 1,
-1.14567, 0.5412376, -2.164197, 0, 0, 0, 1, 1,
-1.142076, -1.032833, -2.196325, 0, 0, 0, 1, 1,
-1.141123, -0.657782, -2.033362, 0, 0, 0, 1, 1,
-1.138799, 0.9423512, -2.775403, 0, 0, 0, 1, 1,
-1.134932, 1.425708, -0.8897892, 0, 0, 0, 1, 1,
-1.129363, -0.113905, -1.171742, 1, 1, 1, 1, 1,
-1.128223, -0.3509735, -2.512258, 1, 1, 1, 1, 1,
-1.121577, -0.6597969, -1.768223, 1, 1, 1, 1, 1,
-1.120555, 0.6273004, 0.3372522, 1, 1, 1, 1, 1,
-1.119851, 1.119108, 0.380104, 1, 1, 1, 1, 1,
-1.118199, -1.022241, -1.712385, 1, 1, 1, 1, 1,
-1.115331, -1.760141, -1.922393, 1, 1, 1, 1, 1,
-1.111417, 0.06853858, -0.7873389, 1, 1, 1, 1, 1,
-1.110647, 0.007620096, -0.6998004, 1, 1, 1, 1, 1,
-1.101688, 1.305231, -1.005957, 1, 1, 1, 1, 1,
-1.099049, -2.063077, -3.974412, 1, 1, 1, 1, 1,
-1.097195, 2.62723, -1.033546, 1, 1, 1, 1, 1,
-1.097157, -1.094617, -3.048845, 1, 1, 1, 1, 1,
-1.090758, 0.9795191, -2.103559, 1, 1, 1, 1, 1,
-1.087258, 1.399318, -0.9350622, 1, 1, 1, 1, 1,
-1.080254, -1.500042, -3.180623, 0, 0, 1, 1, 1,
-1.076222, 0.1848618, -0.9566673, 1, 0, 0, 1, 1,
-1.07517, -0.02991356, -1.095748, 1, 0, 0, 1, 1,
-1.073329, -0.8652874, -3.014478, 1, 0, 0, 1, 1,
-1.069383, 0.6097975, -1.873043, 1, 0, 0, 1, 1,
-1.059654, -0.01678338, -2.031229, 1, 0, 0, 1, 1,
-1.058857, 0.1619315, -0.6224121, 0, 0, 0, 1, 1,
-1.046033, -0.1208365, -1.755275, 0, 0, 0, 1, 1,
-1.043789, 0.190479, -0.0446561, 0, 0, 0, 1, 1,
-1.043673, -2.06349, -2.704747, 0, 0, 0, 1, 1,
-1.040493, 0.2008203, -0.2484109, 0, 0, 0, 1, 1,
-1.037837, -0.4950787, -2.215341, 0, 0, 0, 1, 1,
-1.036237, 0.3086776, -1.599075, 0, 0, 0, 1, 1,
-1.031663, 0.4423992, 0.1869657, 1, 1, 1, 1, 1,
-1.022324, -1.449864, -3.503281, 1, 1, 1, 1, 1,
-1.019962, 0.3826484, -2.08746, 1, 1, 1, 1, 1,
-1.018498, -0.2920462, -2.333005, 1, 1, 1, 1, 1,
-1.016304, -0.3451375, -1.327152, 1, 1, 1, 1, 1,
-1.009887, -0.6265802, -1.424532, 1, 1, 1, 1, 1,
-1.007328, 1.05669, -0.565567, 1, 1, 1, 1, 1,
-1.006297, 0.01569135, -1.901706, 1, 1, 1, 1, 1,
-1.005091, 1.708526, -0.412208, 1, 1, 1, 1, 1,
-0.9998958, -1.235387, -3.250654, 1, 1, 1, 1, 1,
-0.9969464, -0.2916709, -2.532974, 1, 1, 1, 1, 1,
-0.9942542, 0.5402365, -0.7094914, 1, 1, 1, 1, 1,
-0.9937584, -0.6663602, -3.359361, 1, 1, 1, 1, 1,
-0.9887079, -0.34973, -4.687042, 1, 1, 1, 1, 1,
-0.9856598, 0.121076, -3.257103, 1, 1, 1, 1, 1,
-0.9828929, -0.07173494, -1.02246, 0, 0, 1, 1, 1,
-0.9827877, -0.8936543, -4.020738, 1, 0, 0, 1, 1,
-0.9762431, -0.6478253, -2.246882, 1, 0, 0, 1, 1,
-0.9696143, -0.3054413, -0.6948172, 1, 0, 0, 1, 1,
-0.9621017, -0.1549829, -1.194645, 1, 0, 0, 1, 1,
-0.9611267, 0.9182389, 0.0464815, 1, 0, 0, 1, 1,
-0.9523824, 1.243852, 0.004392476, 0, 0, 0, 1, 1,
-0.9491475, -0.2957037, -3.102047, 0, 0, 0, 1, 1,
-0.9439334, 0.9377708, -0.9872499, 0, 0, 0, 1, 1,
-0.9433677, 0.6108088, -0.7771084, 0, 0, 0, 1, 1,
-0.9425697, 0.1073451, -2.500251, 0, 0, 0, 1, 1,
-0.9391241, 0.7034967, 0.09189299, 0, 0, 0, 1, 1,
-0.9390944, -0.6403717, -1.668437, 0, 0, 0, 1, 1,
-0.9383444, -1.811797, -2.590586, 1, 1, 1, 1, 1,
-0.9365231, -1.308503, -3.400856, 1, 1, 1, 1, 1,
-0.9357302, 1.604634, -0.6244993, 1, 1, 1, 1, 1,
-0.9343635, -0.2262248, -1.55196, 1, 1, 1, 1, 1,
-0.9333998, 0.203047, -1.874658, 1, 1, 1, 1, 1,
-0.9327947, -0.2375495, -0.8510323, 1, 1, 1, 1, 1,
-0.9327631, 0.1377529, -2.535277, 1, 1, 1, 1, 1,
-0.9310209, 1.489245, 0.0125542, 1, 1, 1, 1, 1,
-0.9303534, -0.6996657, -2.028741, 1, 1, 1, 1, 1,
-0.9295967, -1.909765, -3.380177, 1, 1, 1, 1, 1,
-0.9222662, 0.1700169, -1.3771, 1, 1, 1, 1, 1,
-0.9211139, 1.017651, -1.270373, 1, 1, 1, 1, 1,
-0.9187338, -1.928555, -2.7813, 1, 1, 1, 1, 1,
-0.9183874, 0.9328033, -0.06650894, 1, 1, 1, 1, 1,
-0.9138169, 1.016755, -0.5518374, 1, 1, 1, 1, 1,
-0.9131014, 0.007433076, -0.5517086, 0, 0, 1, 1, 1,
-0.9076505, -1.082537, -0.7073736, 1, 0, 0, 1, 1,
-0.8983105, 0.7061475, -0.5373407, 1, 0, 0, 1, 1,
-0.8977969, 1.421932, 0.1677501, 1, 0, 0, 1, 1,
-0.8970187, -0.8404434, -2.823649, 1, 0, 0, 1, 1,
-0.8964798, -0.755274, -4.180849, 1, 0, 0, 1, 1,
-0.8959846, 0.807537, -1.899842, 0, 0, 0, 1, 1,
-0.8837419, 0.9284192, -0.01553263, 0, 0, 0, 1, 1,
-0.8769912, -0.819914, -2.153398, 0, 0, 0, 1, 1,
-0.8741242, 0.3095657, -1.82141, 0, 0, 0, 1, 1,
-0.8683198, -1.21411, -3.936243, 0, 0, 0, 1, 1,
-0.8661713, 0.7256395, -0.7878792, 0, 0, 0, 1, 1,
-0.8653186, -0.59752, -2.581855, 0, 0, 0, 1, 1,
-0.8625708, 0.4395622, -3.126897, 1, 1, 1, 1, 1,
-0.8603283, -1.053798, -0.7201875, 1, 1, 1, 1, 1,
-0.8580817, -0.8668179, -3.284111, 1, 1, 1, 1, 1,
-0.8446764, 1.83988, -0.5846217, 1, 1, 1, 1, 1,
-0.841392, -0.1792198, -2.587018, 1, 1, 1, 1, 1,
-0.8392276, -0.09699132, -1.822728, 1, 1, 1, 1, 1,
-0.8335801, 0.2214308, -1.401402, 1, 1, 1, 1, 1,
-0.8315614, 1.198476, -1.112243, 1, 1, 1, 1, 1,
-0.8308702, -0.7200148, -1.754983, 1, 1, 1, 1, 1,
-0.8252054, -0.3518681, -0.5177935, 1, 1, 1, 1, 1,
-0.8251966, 1.324007, 0.8432608, 1, 1, 1, 1, 1,
-0.8184362, -0.6822723, -1.627441, 1, 1, 1, 1, 1,
-0.7931377, 0.3144442, -2.537735, 1, 1, 1, 1, 1,
-0.7929854, 0.831234, -0.6021064, 1, 1, 1, 1, 1,
-0.7881329, -0.01864041, -1.01038, 1, 1, 1, 1, 1,
-0.7859855, 1.708803, 1.633576, 0, 0, 1, 1, 1,
-0.781574, 0.5440454, -1.860351, 1, 0, 0, 1, 1,
-0.7786404, -0.5421065, -2.795463, 1, 0, 0, 1, 1,
-0.7755948, 1.231349, -0.8638519, 1, 0, 0, 1, 1,
-0.7727866, 2.211257, -1.260577, 1, 0, 0, 1, 1,
-0.7673306, 0.8305802, -1.101258, 1, 0, 0, 1, 1,
-0.7606302, 0.294549, -0.9925902, 0, 0, 0, 1, 1,
-0.7524036, -0.3967544, -3.776848, 0, 0, 0, 1, 1,
-0.7499771, -0.1711348, -2.678338, 0, 0, 0, 1, 1,
-0.7472993, 0.6424532, -1.586108, 0, 0, 0, 1, 1,
-0.746426, 0.9916908, -1.115972, 0, 0, 0, 1, 1,
-0.7455609, -0.08828244, -1.880976, 0, 0, 0, 1, 1,
-0.7349379, -1.01536, -3.341243, 0, 0, 0, 1, 1,
-0.730682, 0.9758793, -0.625545, 1, 1, 1, 1, 1,
-0.7279415, 2.238817, -0.6239337, 1, 1, 1, 1, 1,
-0.7261731, 0.4722725, -0.8758795, 1, 1, 1, 1, 1,
-0.7204316, -0.2395793, -0.9712791, 1, 1, 1, 1, 1,
-0.7199092, 1.08564, -0.7574983, 1, 1, 1, 1, 1,
-0.7185635, -1.149298, -3.255468, 1, 1, 1, 1, 1,
-0.7171467, 0.6909606, -1.505917, 1, 1, 1, 1, 1,
-0.7145478, 1.690536, -0.6076002, 1, 1, 1, 1, 1,
-0.7133738, -0.425916, -1.067868, 1, 1, 1, 1, 1,
-0.7118115, 1.064922, -0.7076656, 1, 1, 1, 1, 1,
-0.7106301, 2.597958, -1.05812, 1, 1, 1, 1, 1,
-0.7082498, -1.169865, -3.563112, 1, 1, 1, 1, 1,
-0.7042764, 2.374696, -0.3615033, 1, 1, 1, 1, 1,
-0.7016867, -1.230017, -2.87582, 1, 1, 1, 1, 1,
-0.7011191, 0.3136316, -0.9692803, 1, 1, 1, 1, 1,
-0.7004102, 0.8567927, -1.464495, 0, 0, 1, 1, 1,
-0.695766, 1.113046, -1.341413, 1, 0, 0, 1, 1,
-0.6928485, -1.807557, -2.849726, 1, 0, 0, 1, 1,
-0.6923423, 1.348173, -0.2790411, 1, 0, 0, 1, 1,
-0.6878362, 0.9864964, 0.5898057, 1, 0, 0, 1, 1,
-0.678788, -1.530894, -2.974785, 1, 0, 0, 1, 1,
-0.6733605, 0.5424246, -2.561036, 0, 0, 0, 1, 1,
-0.6724066, 0.1220882, -1.498423, 0, 0, 0, 1, 1,
-0.6666646, 0.5843919, 0.2765438, 0, 0, 0, 1, 1,
-0.6665392, 0.1020962, -2.436294, 0, 0, 0, 1, 1,
-0.6646062, -0.0547505, -2.063118, 0, 0, 0, 1, 1,
-0.6613376, -1.128851, -3.280725, 0, 0, 0, 1, 1,
-0.6580843, 0.6493746, -0.9539306, 0, 0, 0, 1, 1,
-0.6576351, 1.257789, 1.047853, 1, 1, 1, 1, 1,
-0.6571635, -0.7758605, -2.12895, 1, 1, 1, 1, 1,
-0.6536331, -0.4378128, -1.721044, 1, 1, 1, 1, 1,
-0.6526121, -0.296566, -1.940984, 1, 1, 1, 1, 1,
-0.6485922, 0.008852253, -1.688918, 1, 1, 1, 1, 1,
-0.6466963, -1.441856, -1.68566, 1, 1, 1, 1, 1,
-0.6449948, -0.3482473, -0.9440301, 1, 1, 1, 1, 1,
-0.6445909, -0.1618935, -3.209885, 1, 1, 1, 1, 1,
-0.6434646, 0.03443102, -0.4034944, 1, 1, 1, 1, 1,
-0.6428023, 0.004417018, -1.491806, 1, 1, 1, 1, 1,
-0.6413711, -0.3252695, -1.91459, 1, 1, 1, 1, 1,
-0.6293088, -0.8844602, -2.85429, 1, 1, 1, 1, 1,
-0.6290697, -0.1416912, -2.633691, 1, 1, 1, 1, 1,
-0.6276758, -1.003943, -4.731281, 1, 1, 1, 1, 1,
-0.6130572, -0.4792936, -1.057186, 1, 1, 1, 1, 1,
-0.6106527, 0.04120303, 0.9516537, 0, 0, 1, 1, 1,
-0.6103386, 0.06377257, 0.786914, 1, 0, 0, 1, 1,
-0.5905989, -0.7017405, -0.1545731, 1, 0, 0, 1, 1,
-0.5869378, -0.8062033, -3.598231, 1, 0, 0, 1, 1,
-0.5868463, 1.431168, -1.945912, 1, 0, 0, 1, 1,
-0.584341, 0.9210101, -0.3648482, 1, 0, 0, 1, 1,
-0.5835847, 0.5865844, 0.003461027, 0, 0, 0, 1, 1,
-0.5791592, -0.7733243, -2.573966, 0, 0, 0, 1, 1,
-0.5722309, -1.393587, -2.861775, 0, 0, 0, 1, 1,
-0.5714509, -0.5251577, -3.441554, 0, 0, 0, 1, 1,
-0.5666994, 0.3122448, -1.550597, 0, 0, 0, 1, 1,
-0.5656195, -0.498593, -4.144475, 0, 0, 0, 1, 1,
-0.5650071, -1.22052, -4.099779, 0, 0, 0, 1, 1,
-0.5643024, 0.8945075, -0.8911017, 1, 1, 1, 1, 1,
-0.5641848, -1.208502, -2.429544, 1, 1, 1, 1, 1,
-0.5641741, -1.887152, -3.339909, 1, 1, 1, 1, 1,
-0.5637391, 0.1277546, -1.491126, 1, 1, 1, 1, 1,
-0.5591063, 2.528589, 0.6680801, 1, 1, 1, 1, 1,
-0.5578372, 0.8110019, -2.08561, 1, 1, 1, 1, 1,
-0.5558432, -2.829761, -4.39402, 1, 1, 1, 1, 1,
-0.5545803, 1.185329, -1.210745, 1, 1, 1, 1, 1,
-0.5516931, 1.667414, -0.3611284, 1, 1, 1, 1, 1,
-0.5492339, 0.2694771, -2.533082, 1, 1, 1, 1, 1,
-0.5440522, -0.5807827, -1.12799, 1, 1, 1, 1, 1,
-0.5365846, -0.2915305, -2.553458, 1, 1, 1, 1, 1,
-0.5364046, 1.485805, 1.411526, 1, 1, 1, 1, 1,
-0.5353977, 0.7492439, -0.2335759, 1, 1, 1, 1, 1,
-0.5316389, -0.07012209, -1.554381, 1, 1, 1, 1, 1,
-0.5264348, -0.8447509, -2.665056, 0, 0, 1, 1, 1,
-0.525869, 0.5262788, -2.71752, 1, 0, 0, 1, 1,
-0.525415, 1.441183, -0.02175416, 1, 0, 0, 1, 1,
-0.5229092, -0.2713493, -1.109955, 1, 0, 0, 1, 1,
-0.5214229, 0.03008425, -1.848781, 1, 0, 0, 1, 1,
-0.5213075, 0.1858192, -0.8542975, 1, 0, 0, 1, 1,
-0.5202878, -0.1987308, -2.638004, 0, 0, 0, 1, 1,
-0.5170919, -0.3151383, -1.578419, 0, 0, 0, 1, 1,
-0.5150386, 0.3746687, -1.358824, 0, 0, 0, 1, 1,
-0.5148256, 0.2979646, -0.8178773, 0, 0, 0, 1, 1,
-0.514414, 0.58619, 1.350595, 0, 0, 0, 1, 1,
-0.5134532, -0.3153931, -2.660181, 0, 0, 0, 1, 1,
-0.5100603, -0.6673981, -2.784679, 0, 0, 0, 1, 1,
-0.5087257, -0.7427807, -1.983971, 1, 1, 1, 1, 1,
-0.5086038, 1.060589, 0.007372964, 1, 1, 1, 1, 1,
-0.5084186, 0.4229317, -2.571107, 1, 1, 1, 1, 1,
-0.5062981, 1.603487, -0.1705805, 1, 1, 1, 1, 1,
-0.5046, -0.555216, -2.765791, 1, 1, 1, 1, 1,
-0.5045249, 0.980179, -1.973699, 1, 1, 1, 1, 1,
-0.5011869, -0.07300057, -2.171109, 1, 1, 1, 1, 1,
-0.4926674, -1.735021, -2.985996, 1, 1, 1, 1, 1,
-0.4893772, 0.5493274, -1.540749, 1, 1, 1, 1, 1,
-0.4865037, -0.6296834, -3.916063, 1, 1, 1, 1, 1,
-0.4853314, 0.2146112, -2.469331, 1, 1, 1, 1, 1,
-0.4817603, -2.281476, -2.187316, 1, 1, 1, 1, 1,
-0.4791102, -0.3277517, -2.093812, 1, 1, 1, 1, 1,
-0.4787078, 0.5034305, -0.7691303, 1, 1, 1, 1, 1,
-0.4774838, 0.6591199, -0.9647709, 1, 1, 1, 1, 1,
-0.4765197, -0.06269535, -0.4222139, 0, 0, 1, 1, 1,
-0.4706207, -1.389231, -3.031508, 1, 0, 0, 1, 1,
-0.468843, 1.145332, -0.4628829, 1, 0, 0, 1, 1,
-0.4637034, -1.121048, -2.733425, 1, 0, 0, 1, 1,
-0.4619555, 0.7571498, 0.1111208, 1, 0, 0, 1, 1,
-0.4602955, -0.1710645, -0.7592083, 1, 0, 0, 1, 1,
-0.4595676, 0.5129867, -0.9156529, 0, 0, 0, 1, 1,
-0.4541447, -2.049401, -2.885906, 0, 0, 0, 1, 1,
-0.4527856, -0.7835052, -2.952162, 0, 0, 0, 1, 1,
-0.4522696, -1.334551, -3.781388, 0, 0, 0, 1, 1,
-0.4451437, -1.109383, -1.2048, 0, 0, 0, 1, 1,
-0.4448117, 0.8562807, -0.3360116, 0, 0, 0, 1, 1,
-0.4436328, -0.5894284, -1.312207, 0, 0, 0, 1, 1,
-0.4432742, 0.6385011, -0.9264621, 1, 1, 1, 1, 1,
-0.4390854, 0.6842421, -2.831728, 1, 1, 1, 1, 1,
-0.4382237, 2.068211, 0.1599875, 1, 1, 1, 1, 1,
-0.436033, 1.288231, 1.586463, 1, 1, 1, 1, 1,
-0.4293621, 0.887848, -0.1924499, 1, 1, 1, 1, 1,
-0.4253793, -0.8988398, -2.569351, 1, 1, 1, 1, 1,
-0.422299, 0.1347428, -2.843817, 1, 1, 1, 1, 1,
-0.4220191, -0.4428578, -2.960894, 1, 1, 1, 1, 1,
-0.4155577, -0.5668731, -3.397595, 1, 1, 1, 1, 1,
-0.4147102, 0.2773614, -1.786235, 1, 1, 1, 1, 1,
-0.4133586, 0.9567469, 0.2537441, 1, 1, 1, 1, 1,
-0.4130217, -0.2206335, -5.183414, 1, 1, 1, 1, 1,
-0.4122137, 0.4120054, -2.596666, 1, 1, 1, 1, 1,
-0.4098842, -0.2100284, -2.030915, 1, 1, 1, 1, 1,
-0.4091793, -1.78713, -4.132069, 1, 1, 1, 1, 1,
-0.4070942, 0.7836747, -1.218409, 0, 0, 1, 1, 1,
-0.4062873, -0.7787746, -3.287437, 1, 0, 0, 1, 1,
-0.4047153, -0.7145731, -2.107435, 1, 0, 0, 1, 1,
-0.4026732, 0.5695618, -1.418907, 1, 0, 0, 1, 1,
-0.3998262, -1.03039, -2.532239, 1, 0, 0, 1, 1,
-0.3977985, -1.381231, -3.533576, 1, 0, 0, 1, 1,
-0.3974545, -0.9897616, -2.518847, 0, 0, 0, 1, 1,
-0.395051, 0.5011275, -1.084578, 0, 0, 0, 1, 1,
-0.3949442, 0.1947374, -0.1097677, 0, 0, 0, 1, 1,
-0.3949327, -0.4328305, -2.824136, 0, 0, 0, 1, 1,
-0.3946595, -1.200513, -2.361056, 0, 0, 0, 1, 1,
-0.3921869, 0.6896447, 0.7008606, 0, 0, 0, 1, 1,
-0.3905678, 0.5787535, 0.7962752, 0, 0, 0, 1, 1,
-0.3893469, -0.2901028, -2.42937, 1, 1, 1, 1, 1,
-0.3892524, 1.1599, -1.250894, 1, 1, 1, 1, 1,
-0.3827273, 0.3548226, -1.189075, 1, 1, 1, 1, 1,
-0.3813793, -1.571945, -4.042991, 1, 1, 1, 1, 1,
-0.3805037, 0.2639898, -0.3133844, 1, 1, 1, 1, 1,
-0.3718702, 0.2172921, -1.144521, 1, 1, 1, 1, 1,
-0.3654736, -0.7555602, -0.6824755, 1, 1, 1, 1, 1,
-0.3635222, 0.6665459, -1.147886, 1, 1, 1, 1, 1,
-0.3631852, -0.8704137, -4.04116, 1, 1, 1, 1, 1,
-0.3593432, 2.011844, 0.3036597, 1, 1, 1, 1, 1,
-0.3555213, -1.047523, -3.525499, 1, 1, 1, 1, 1,
-0.3554891, 1.065657, -0.5054036, 1, 1, 1, 1, 1,
-0.3521291, -1.518012, -1.836087, 1, 1, 1, 1, 1,
-0.3516066, 0.2692739, 0.01107359, 1, 1, 1, 1, 1,
-0.3511625, -0.5140596, -2.480403, 1, 1, 1, 1, 1,
-0.3478586, 0.7787458, -1.400837, 0, 0, 1, 1, 1,
-0.3445163, -0.637465, -1.664084, 1, 0, 0, 1, 1,
-0.3417146, -1.030118, -3.664504, 1, 0, 0, 1, 1,
-0.3392147, 0.0429175, -1.642805, 1, 0, 0, 1, 1,
-0.3390353, -1.432967, -1.098519, 1, 0, 0, 1, 1,
-0.3383676, -0.597512, -2.439691, 1, 0, 0, 1, 1,
-0.3382579, -0.1678599, -1.420731, 0, 0, 0, 1, 1,
-0.3371624, -0.8173394, -0.3046978, 0, 0, 0, 1, 1,
-0.3323791, 0.1046618, 0.09780814, 0, 0, 0, 1, 1,
-0.327446, 0.1152898, -0.8235929, 0, 0, 0, 1, 1,
-0.326609, 0.3940679, -0.6448098, 0, 0, 0, 1, 1,
-0.3265538, 1.073563, -1.681525, 0, 0, 0, 1, 1,
-0.3258704, -0.898035, -2.504125, 0, 0, 0, 1, 1,
-0.3238634, -1.919518, -2.029669, 1, 1, 1, 1, 1,
-0.3195184, 1.610811, 1.439753, 1, 1, 1, 1, 1,
-0.3178352, -0.3256731, -1.25066, 1, 1, 1, 1, 1,
-0.3176834, 0.2753752, -0.5883713, 1, 1, 1, 1, 1,
-0.3157259, -0.1200583, -0.7916827, 1, 1, 1, 1, 1,
-0.3102272, -0.4704701, -3.55789, 1, 1, 1, 1, 1,
-0.3095194, 1.723167, 1.938896, 1, 1, 1, 1, 1,
-0.3041589, 0.7972381, -0.885425, 1, 1, 1, 1, 1,
-0.3010233, -0.6031193, -2.668413, 1, 1, 1, 1, 1,
-0.3000947, 0.4509691, 0.1058587, 1, 1, 1, 1, 1,
-0.2988734, -1.437873, -3.702135, 1, 1, 1, 1, 1,
-0.2987354, -0.3600114, -2.090702, 1, 1, 1, 1, 1,
-0.298703, 0.4877332, -0.7678948, 1, 1, 1, 1, 1,
-0.2981039, 1.644822, 0.2401394, 1, 1, 1, 1, 1,
-0.2752202, -1.073785, -1.931248, 1, 1, 1, 1, 1,
-0.2747507, -2.119465, -5.808802, 0, 0, 1, 1, 1,
-0.2743577, -0.01689544, -2.132955, 1, 0, 0, 1, 1,
-0.2726559, -0.9161491, -2.988742, 1, 0, 0, 1, 1,
-0.2700647, 0.3428332, -1.55853, 1, 0, 0, 1, 1,
-0.2693239, -0.1346505, -1.742899, 1, 0, 0, 1, 1,
-0.269026, -0.4371156, -2.443843, 1, 0, 0, 1, 1,
-0.266506, -0.5436949, -2.222424, 0, 0, 0, 1, 1,
-0.2649671, 0.09743038, -1.666105, 0, 0, 0, 1, 1,
-0.2640062, -0.5942945, -2.993272, 0, 0, 0, 1, 1,
-0.2617227, 1.167554, 1.67903, 0, 0, 0, 1, 1,
-0.2587235, -0.1404394, -1.756018, 0, 0, 0, 1, 1,
-0.2578779, 1.511384, -1.023694, 0, 0, 0, 1, 1,
-0.2507755, 0.1126487, -2.142978, 0, 0, 0, 1, 1,
-0.2493694, 0.1848886, -1.805005, 1, 1, 1, 1, 1,
-0.2487024, -0.2606249, -1.549433, 1, 1, 1, 1, 1,
-0.2480888, -0.5723334, -2.327525, 1, 1, 1, 1, 1,
-0.2466091, 0.08084057, -0.3219958, 1, 1, 1, 1, 1,
-0.2462355, -1.567931, -4.766172, 1, 1, 1, 1, 1,
-0.240205, 0.7227921, -0.8539279, 1, 1, 1, 1, 1,
-0.2381712, 0.8017077, 0.1763294, 1, 1, 1, 1, 1,
-0.235622, -0.06768793, -2.461467, 1, 1, 1, 1, 1,
-0.2353722, 2.626754, 0.09163602, 1, 1, 1, 1, 1,
-0.2316322, 0.006576571, 0.141511, 1, 1, 1, 1, 1,
-0.2267358, 0.6692019, 1.360216, 1, 1, 1, 1, 1,
-0.2250265, -1.53343, -2.084017, 1, 1, 1, 1, 1,
-0.2222522, -1.241831, -2.285391, 1, 1, 1, 1, 1,
-0.2211312, -0.6400121, -3.358324, 1, 1, 1, 1, 1,
-0.2191088, 0.1853272, 0.2615909, 1, 1, 1, 1, 1,
-0.2111787, 0.9691377, -1.348844, 0, 0, 1, 1, 1,
-0.2111082, -0.1203805, -2.62317, 1, 0, 0, 1, 1,
-0.2085, -0.9289812, -2.751061, 1, 0, 0, 1, 1,
-0.2057583, 1.119099, -0.6417688, 1, 0, 0, 1, 1,
-0.2000121, -0.02607746, -2.047948, 1, 0, 0, 1, 1,
-0.1994962, -0.6034178, -3.322361, 1, 0, 0, 1, 1,
-0.1977931, -0.06033784, -2.097383, 0, 0, 0, 1, 1,
-0.1972493, 1.412095, 0.1029271, 0, 0, 0, 1, 1,
-0.19627, 0.003877236, -0.7108489, 0, 0, 0, 1, 1,
-0.1929014, -1.093092, -3.45403, 0, 0, 0, 1, 1,
-0.1927276, -0.005413074, -1.504532, 0, 0, 0, 1, 1,
-0.1900034, -0.4311263, -1.889864, 0, 0, 0, 1, 1,
-0.1848437, 0.4490784, -0.6178118, 0, 0, 0, 1, 1,
-0.1795923, 0.1932014, -0.4582722, 1, 1, 1, 1, 1,
-0.1758391, -0.5754361, -3.662422, 1, 1, 1, 1, 1,
-0.1742641, 0.6816242, -0.5706607, 1, 1, 1, 1, 1,
-0.1741725, -0.2117047, -2.371979, 1, 1, 1, 1, 1,
-0.1725603, -1.49851, -2.853664, 1, 1, 1, 1, 1,
-0.1705928, -0.2654316, -2.870245, 1, 1, 1, 1, 1,
-0.1674352, -1.336664, -2.186605, 1, 1, 1, 1, 1,
-0.167105, -0.1914657, -1.329198, 1, 1, 1, 1, 1,
-0.1633542, 0.6269462, -1.48419, 1, 1, 1, 1, 1,
-0.1618562, -0.912082, -2.552085, 1, 1, 1, 1, 1,
-0.1603823, 1.000879, 0.3268868, 1, 1, 1, 1, 1,
-0.1523864, -0.5783727, -2.925961, 1, 1, 1, 1, 1,
-0.1519497, 0.3088648, 0.5230047, 1, 1, 1, 1, 1,
-0.1510703, 0.4546882, 0.9316112, 1, 1, 1, 1, 1,
-0.1476186, 1.063383, -1.702083, 1, 1, 1, 1, 1,
-0.1427848, -0.3976465, -2.305267, 0, 0, 1, 1, 1,
-0.1424919, -1.036675, -2.211707, 1, 0, 0, 1, 1,
-0.1396917, -1.120516, -2.784132, 1, 0, 0, 1, 1,
-0.1393621, -0.0627988, -1.476768, 1, 0, 0, 1, 1,
-0.1350256, 1.29766, -1.486019, 1, 0, 0, 1, 1,
-0.1338498, 0.7215681, -0.7946677, 1, 0, 0, 1, 1,
-0.1289215, -0.181449, -1.693506, 0, 0, 0, 1, 1,
-0.1283322, -0.8703414, -3.823842, 0, 0, 0, 1, 1,
-0.1274558, -0.5019879, -2.369774, 0, 0, 0, 1, 1,
-0.125871, 1.437404, 0.07530187, 0, 0, 0, 1, 1,
-0.1200103, -1.319384, -3.918652, 0, 0, 0, 1, 1,
-0.1154479, -1.411393, -1.419263, 0, 0, 0, 1, 1,
-0.1121245, -0.5198757, -1.75154, 0, 0, 0, 1, 1,
-0.1114725, -0.1199531, -2.470036, 1, 1, 1, 1, 1,
-0.1090876, 0.8815832, 0.2351638, 1, 1, 1, 1, 1,
-0.1055825, 2.186395, 0.1866448, 1, 1, 1, 1, 1,
-0.1041734, 1.342541, -1.584861, 1, 1, 1, 1, 1,
-0.1021956, -0.3055721, -3.367954, 1, 1, 1, 1, 1,
-0.0998542, -0.4244484, -1.647642, 1, 1, 1, 1, 1,
-0.09966658, 0.1769661, -0.3782847, 1, 1, 1, 1, 1,
-0.0986846, -1.1958, -3.80602, 1, 1, 1, 1, 1,
-0.09521262, -0.2971579, -2.114507, 1, 1, 1, 1, 1,
-0.09024891, 1.750977, 3.053201, 1, 1, 1, 1, 1,
-0.08695503, 0.0682664, -0.3626164, 1, 1, 1, 1, 1,
-0.08327374, -1.56525, -2.809307, 1, 1, 1, 1, 1,
-0.08307111, 0.5374755, 0.4264399, 1, 1, 1, 1, 1,
-0.08083306, -0.4814936, -3.533303, 1, 1, 1, 1, 1,
-0.07853483, 0.4326589, -0.3749059, 1, 1, 1, 1, 1,
-0.07794313, -1.334427, -5.257532, 0, 0, 1, 1, 1,
-0.07609212, -1.25294, -2.394224, 1, 0, 0, 1, 1,
-0.07391559, 1.174052, 0.3089435, 1, 0, 0, 1, 1,
-0.07220479, -0.02654424, -1.264883, 1, 0, 0, 1, 1,
-0.07011219, -0.7274024, -2.441231, 1, 0, 0, 1, 1,
-0.06883753, 0.7137492, -0.2349511, 1, 0, 0, 1, 1,
-0.06779972, -0.1673737, -2.530796, 0, 0, 0, 1, 1,
-0.06419914, -1.1332, -1.063792, 0, 0, 0, 1, 1,
-0.0571279, -0.1029215, -3.729167, 0, 0, 0, 1, 1,
-0.05710518, -1.529942, -2.868528, 0, 0, 0, 1, 1,
-0.05402227, -0.07831805, -1.477624, 0, 0, 0, 1, 1,
-0.0537975, -0.2281233, -1.396131, 0, 0, 0, 1, 1,
-0.05308462, -0.7841659, -3.2224, 0, 0, 0, 1, 1,
-0.04913911, -0.8874301, -5.22604, 1, 1, 1, 1, 1,
-0.04622779, -0.6177701, -3.446951, 1, 1, 1, 1, 1,
-0.04449444, 1.327421, -0.3403367, 1, 1, 1, 1, 1,
-0.04404891, 1.177416, -2.146095, 1, 1, 1, 1, 1,
-0.03343325, -0.5003223, -3.621002, 1, 1, 1, 1, 1,
-0.03045995, -0.1792892, -3.020844, 1, 1, 1, 1, 1,
-0.0289242, -1.319987, -4.17867, 1, 1, 1, 1, 1,
-0.02283571, -0.3475256, -2.850834, 1, 1, 1, 1, 1,
-0.02131762, -0.2614316, -3.654473, 1, 1, 1, 1, 1,
-0.01812636, 0.5606789, -1.980353, 1, 1, 1, 1, 1,
-0.01474836, 2.337031, -0.3348602, 1, 1, 1, 1, 1,
-0.01440265, -0.1661233, -3.330083, 1, 1, 1, 1, 1,
-0.01018167, -0.1701742, -3.398573, 1, 1, 1, 1, 1,
-0.009988152, -1.111012, -3.519167, 1, 1, 1, 1, 1,
-0.009403992, -0.4238715, -3.766859, 1, 1, 1, 1, 1,
-0.008092026, -0.6223699, -2.522226, 0, 0, 1, 1, 1,
0.002103771, 0.3763441, 0.8632081, 1, 0, 0, 1, 1,
0.004746971, -1.58177, 2.782661, 1, 0, 0, 1, 1,
0.006067125, 0.7567708, 0.5592505, 1, 0, 0, 1, 1,
0.006485044, 1.147837, 1.889599, 1, 0, 0, 1, 1,
0.008906774, -0.1784282, -0.2754945, 1, 0, 0, 1, 1,
0.01267757, 0.2969943, 0.4613323, 0, 0, 0, 1, 1,
0.01514033, -1.043973, 3.378713, 0, 0, 0, 1, 1,
0.01925704, -0.4902926, 4.52818, 0, 0, 0, 1, 1,
0.02314288, 0.5751333, -0.03583047, 0, 0, 0, 1, 1,
0.03852862, -0.1309433, 4.134297, 0, 0, 0, 1, 1,
0.04259324, -0.630516, 3.478114, 0, 0, 0, 1, 1,
0.04522187, 0.7739466, 0.06170829, 0, 0, 0, 1, 1,
0.04831355, 0.622441, 1.773677, 1, 1, 1, 1, 1,
0.05028795, 0.2153413, 0.6311337, 1, 1, 1, 1, 1,
0.05041868, -2.379844, 3.460313, 1, 1, 1, 1, 1,
0.05247343, -0.7053103, 5.172688, 1, 1, 1, 1, 1,
0.05260877, -0.1758272, 1.862684, 1, 1, 1, 1, 1,
0.05469962, 0.7919346, 0.2954749, 1, 1, 1, 1, 1,
0.05605335, 1.156107, -1.003713, 1, 1, 1, 1, 1,
0.06093067, -1.241397, 3.085613, 1, 1, 1, 1, 1,
0.0639298, 1.031995, -1.057022, 1, 1, 1, 1, 1,
0.06720136, -1.745416, 0.56035, 1, 1, 1, 1, 1,
0.07066691, 0.3175403, 1.584759, 1, 1, 1, 1, 1,
0.0738858, -0.8739656, 3.919501, 1, 1, 1, 1, 1,
0.07470059, -0.03830674, 2.51601, 1, 1, 1, 1, 1,
0.07904511, 0.5425473, 1.816004, 1, 1, 1, 1, 1,
0.09324431, -0.6284609, 2.562816, 1, 1, 1, 1, 1,
0.1001801, 0.3304756, -2.19472, 0, 0, 1, 1, 1,
0.1048022, 0.217127, 0.7702462, 1, 0, 0, 1, 1,
0.1055394, -0.03799868, 1.861303, 1, 0, 0, 1, 1,
0.1080305, -0.6471533, 2.907192, 1, 0, 0, 1, 1,
0.11233, 0.332926, 1.509845, 1, 0, 0, 1, 1,
0.113267, 0.2212344, 2.758052, 1, 0, 0, 1, 1,
0.1136316, 0.8788199, 1.079967, 0, 0, 0, 1, 1,
0.1178018, 1.399451, 1.747949, 0, 0, 0, 1, 1,
0.1212518, -0.8539161, 3.521637, 0, 0, 0, 1, 1,
0.1229266, -0.2336694, 2.838429, 0, 0, 0, 1, 1,
0.1252352, 0.7852809, 0.2534892, 0, 0, 0, 1, 1,
0.1326803, 0.1475839, 0.5330927, 0, 0, 0, 1, 1,
0.136684, -0.3600889, 2.930773, 0, 0, 0, 1, 1,
0.1403921, 1.951972, -0.3461293, 1, 1, 1, 1, 1,
0.1408549, -1.340119, 1.191274, 1, 1, 1, 1, 1,
0.1411622, -0.120339, 1.095992, 1, 1, 1, 1, 1,
0.1425831, 0.8645329, 1.302641, 1, 1, 1, 1, 1,
0.1471355, 2.830904, 3.128182, 1, 1, 1, 1, 1,
0.1476712, 0.2214901, 1.653236, 1, 1, 1, 1, 1,
0.1534399, -0.1328465, 3.327498, 1, 1, 1, 1, 1,
0.1564482, -1.801485, 3.228183, 1, 1, 1, 1, 1,
0.1571954, -1.50361, 2.564861, 1, 1, 1, 1, 1,
0.1605687, 0.750056, 0.07198995, 1, 1, 1, 1, 1,
0.1618403, 1.045018, 0.06707135, 1, 1, 1, 1, 1,
0.1625922, 1.309729, -0.5615378, 1, 1, 1, 1, 1,
0.1683225, 0.8027334, 0.2368178, 1, 1, 1, 1, 1,
0.1728592, -0.8097098, 2.250127, 1, 1, 1, 1, 1,
0.1737278, 0.6821738, 0.123446, 1, 1, 1, 1, 1,
0.1801021, 0.669612, -0.2416534, 0, 0, 1, 1, 1,
0.1834097, -0.6513591, 2.557024, 1, 0, 0, 1, 1,
0.1865285, -2.515663, 3.818195, 1, 0, 0, 1, 1,
0.1868462, -1.406671, 2.772708, 1, 0, 0, 1, 1,
0.187425, 0.2823166, 0.2590496, 1, 0, 0, 1, 1,
0.189913, -0.3645209, 2.675493, 1, 0, 0, 1, 1,
0.1917668, 2.246913, -0.063696, 0, 0, 0, 1, 1,
0.1928919, -0.4261589, 2.578932, 0, 0, 0, 1, 1,
0.1935115, 0.3140389, 1.400527, 0, 0, 0, 1, 1,
0.1952077, -1.714615, 2.438669, 0, 0, 0, 1, 1,
0.1985696, 0.213026, 1.507833, 0, 0, 0, 1, 1,
0.2011953, 0.9673475, -0.7058654, 0, 0, 0, 1, 1,
0.2024381, 0.588493, -0.9848561, 0, 0, 0, 1, 1,
0.203179, -1.815454, 2.718945, 1, 1, 1, 1, 1,
0.2116651, -0.6412423, 3.886314, 1, 1, 1, 1, 1,
0.2141571, 0.3837151, 1.803123, 1, 1, 1, 1, 1,
0.2149985, 1.02915, 0.0315581, 1, 1, 1, 1, 1,
0.2175965, -1.842018, 4.306769, 1, 1, 1, 1, 1,
0.2181464, 0.08280014, 1.617677, 1, 1, 1, 1, 1,
0.2213855, 0.9572129, -1.049659, 1, 1, 1, 1, 1,
0.221616, 1.077456, 0.4310076, 1, 1, 1, 1, 1,
0.2235038, -0.7072937, 5.115442, 1, 1, 1, 1, 1,
0.2260079, -0.1294854, 4.41654, 1, 1, 1, 1, 1,
0.2277105, -0.7574307, 1.510045, 1, 1, 1, 1, 1,
0.2278552, 2.797363, -0.2426025, 1, 1, 1, 1, 1,
0.2282478, 0.4737458, -0.39664, 1, 1, 1, 1, 1,
0.2342584, -1.114983, 2.788096, 1, 1, 1, 1, 1,
0.2376348, -0.7118, 1.292907, 1, 1, 1, 1, 1,
0.2389243, 0.4042714, 1.098321, 0, 0, 1, 1, 1,
0.2404408, 0.4568489, 0.1389161, 1, 0, 0, 1, 1,
0.2407389, 0.9880942, 0.3071209, 1, 0, 0, 1, 1,
0.2481654, -0.5373763, 1.669972, 1, 0, 0, 1, 1,
0.2519562, 0.3238425, 1.527883, 1, 0, 0, 1, 1,
0.2568061, 0.9864112, 1.583026, 1, 0, 0, 1, 1,
0.2591342, 0.01584845, 1.23551, 0, 0, 0, 1, 1,
0.2603353, 0.5594481, -0.09813853, 0, 0, 0, 1, 1,
0.2610218, 1.371358, -0.2006184, 0, 0, 0, 1, 1,
0.2647182, -0.6501697, 3.134502, 0, 0, 0, 1, 1,
0.265063, -0.6330248, 1.165978, 0, 0, 0, 1, 1,
0.270353, -0.1390744, 1.565505, 0, 0, 0, 1, 1,
0.277899, -0.7057948, 1.300697, 0, 0, 0, 1, 1,
0.2882299, 1.932897, 0.3527614, 1, 1, 1, 1, 1,
0.2901857, -0.7957183, 3.505269, 1, 1, 1, 1, 1,
0.2932372, -0.9250563, 3.153541, 1, 1, 1, 1, 1,
0.2946174, 0.2760429, 0.5445641, 1, 1, 1, 1, 1,
0.2951968, -0.7019126, 4.545181, 1, 1, 1, 1, 1,
0.2997133, -0.6814132, 3.719391, 1, 1, 1, 1, 1,
0.3029769, 1.870763, 0.5853432, 1, 1, 1, 1, 1,
0.3073059, -1.161175, 4.076357, 1, 1, 1, 1, 1,
0.3082323, 1.220731, 2.55193, 1, 1, 1, 1, 1,
0.3115558, 1.235477, -0.5018558, 1, 1, 1, 1, 1,
0.3158776, -0.7712212, 1.925089, 1, 1, 1, 1, 1,
0.3177383, -0.2707036, 3.077426, 1, 1, 1, 1, 1,
0.3187938, 0.2554483, -0.4030537, 1, 1, 1, 1, 1,
0.3191491, 1.321446, -0.2208105, 1, 1, 1, 1, 1,
0.331006, -0.3240541, 2.240893, 1, 1, 1, 1, 1,
0.3314797, -1.424277, 4.113707, 0, 0, 1, 1, 1,
0.3321537, -2.654311, 3.316275, 1, 0, 0, 1, 1,
0.3321944, -2.185317, 2.860711, 1, 0, 0, 1, 1,
0.336934, -1.408737, 2.529282, 1, 0, 0, 1, 1,
0.3384707, 1.285486, 0.3304685, 1, 0, 0, 1, 1,
0.353614, 0.8349287, 2.346694, 1, 0, 0, 1, 1,
0.3573672, -0.6284548, 2.654427, 0, 0, 0, 1, 1,
0.3622987, 2.049402, -1.010576, 0, 0, 0, 1, 1,
0.365475, 0.5853632, 1.330324, 0, 0, 0, 1, 1,
0.3674901, -0.5223407, 3.67809, 0, 0, 0, 1, 1,
0.3707285, -0.2267556, 3.286401, 0, 0, 0, 1, 1,
0.37251, 0.09084827, 0.8884414, 0, 0, 0, 1, 1,
0.3768971, 0.1965281, 0.02237732, 0, 0, 0, 1, 1,
0.3783741, -0.669349, 1.743767, 1, 1, 1, 1, 1,
0.3791451, -1.694874, 3.520338, 1, 1, 1, 1, 1,
0.3799536, 1.109272, -0.2312801, 1, 1, 1, 1, 1,
0.3817003, -0.7210364, 2.860317, 1, 1, 1, 1, 1,
0.3837488, -0.7593368, 3.03376, 1, 1, 1, 1, 1,
0.3952569, 0.05272312, 2.172561, 1, 1, 1, 1, 1,
0.3961727, 0.03742461, 0.5201713, 1, 1, 1, 1, 1,
0.3968803, 3.144129, -0.2139854, 1, 1, 1, 1, 1,
0.4008691, 0.5149987, 2.71536, 1, 1, 1, 1, 1,
0.4040771, 0.8657877, -0.7858568, 1, 1, 1, 1, 1,
0.4076544, 0.4247071, 2.662012, 1, 1, 1, 1, 1,
0.4114413, 2.632177, 0.2749245, 1, 1, 1, 1, 1,
0.412143, 0.3228897, 0.8420575, 1, 1, 1, 1, 1,
0.4153357, -2.758188, 3.204237, 1, 1, 1, 1, 1,
0.4213786, 0.5703025, -0.04540402, 1, 1, 1, 1, 1,
0.432214, -0.4443777, 1.602736, 0, 0, 1, 1, 1,
0.4333837, 0.3126673, 2.321525, 1, 0, 0, 1, 1,
0.4359149, 0.7870138, 1.300815, 1, 0, 0, 1, 1,
0.4373401, -1.357375, 4.472446, 1, 0, 0, 1, 1,
0.4401512, -0.4212385, 1.04782, 1, 0, 0, 1, 1,
0.4422712, -0.2438306, 0.07414976, 1, 0, 0, 1, 1,
0.4426782, -0.3596688, 2.051203, 0, 0, 0, 1, 1,
0.4428477, 1.286365, 0.3666268, 0, 0, 0, 1, 1,
0.4459774, -0.4604893, 0.3041047, 0, 0, 0, 1, 1,
0.4504832, 1.403089, -0.4002208, 0, 0, 0, 1, 1,
0.4531894, -2.916952, 3.077627, 0, 0, 0, 1, 1,
0.4546926, -0.2120986, 2.934469, 0, 0, 0, 1, 1,
0.4608141, 0.7602117, 1.314649, 0, 0, 0, 1, 1,
0.4623464, -1.498356, 4.273658, 1, 1, 1, 1, 1,
0.4628828, 0.2628929, 3.393485, 1, 1, 1, 1, 1,
0.4678808, -0.2014704, 3.135709, 1, 1, 1, 1, 1,
0.4704064, 0.3102414, 1.051386, 1, 1, 1, 1, 1,
0.4765425, -1.175705, 3.852998, 1, 1, 1, 1, 1,
0.477007, 0.716208, -0.6860639, 1, 1, 1, 1, 1,
0.4819694, -0.1954637, 3.397193, 1, 1, 1, 1, 1,
0.4859387, 1.782313, 0.5712374, 1, 1, 1, 1, 1,
0.4871538, 0.0138126, 1.071273, 1, 1, 1, 1, 1,
0.4875534, 0.5283058, -0.9573647, 1, 1, 1, 1, 1,
0.4881619, -0.00258808, 0.8146163, 1, 1, 1, 1, 1,
0.4906762, -0.960161, 2.1778, 1, 1, 1, 1, 1,
0.491739, -0.2427178, 1.587572, 1, 1, 1, 1, 1,
0.4920979, 0.04818759, -0.6908924, 1, 1, 1, 1, 1,
0.4977233, -0.7148119, 1.534628, 1, 1, 1, 1, 1,
0.5033693, -0.4722218, 0.6378579, 0, 0, 1, 1, 1,
0.5044402, 0.4545847, 0.4955057, 1, 0, 0, 1, 1,
0.50514, 0.08952087, 0.9671898, 1, 0, 0, 1, 1,
0.5052418, -0.8498167, 1.489251, 1, 0, 0, 1, 1,
0.5105155, -1.169174, 4.206663, 1, 0, 0, 1, 1,
0.5105451, 0.1079805, 1.151502, 1, 0, 0, 1, 1,
0.5119881, -0.6731203, 3.880996, 0, 0, 0, 1, 1,
0.5128712, -0.3307085, 0.8055242, 0, 0, 0, 1, 1,
0.5146339, 1.877051, 1.291963, 0, 0, 0, 1, 1,
0.515268, -0.1967347, 1.767272, 0, 0, 0, 1, 1,
0.5161958, -0.1706802, 1.58151, 0, 0, 0, 1, 1,
0.5190952, 0.9742101, 0.9746376, 0, 0, 0, 1, 1,
0.5212436, 0.7520841, 1.195038, 0, 0, 0, 1, 1,
0.5228001, -0.2318516, 1.291192, 1, 1, 1, 1, 1,
0.5250658, 1.609915, 0.4330879, 1, 1, 1, 1, 1,
0.527598, -0.8609347, 3.040187, 1, 1, 1, 1, 1,
0.5280808, 1.220762, -0.08710594, 1, 1, 1, 1, 1,
0.5282217, -0.6127827, 3.361774, 1, 1, 1, 1, 1,
0.5282598, -0.7738315, -0.2968255, 1, 1, 1, 1, 1,
0.5299954, 1.183056, 0.2815094, 1, 1, 1, 1, 1,
0.545326, 0.3574606, -1.25233, 1, 1, 1, 1, 1,
0.550854, 0.3766304, -0.1678783, 1, 1, 1, 1, 1,
0.5539191, -1.61117, 2.565518, 1, 1, 1, 1, 1,
0.5579872, -0.1297679, 1.490354, 1, 1, 1, 1, 1,
0.5592374, 0.1214648, 1.598437, 1, 1, 1, 1, 1,
0.5602323, 0.9646008, 1.782704, 1, 1, 1, 1, 1,
0.5682995, 1.355736, 0.6663958, 1, 1, 1, 1, 1,
0.5688049, -1.407604, 2.393249, 1, 1, 1, 1, 1,
0.5701238, 1.214006, 0.1444697, 0, 0, 1, 1, 1,
0.5724196, -0.02025669, 3.903943, 1, 0, 0, 1, 1,
0.5734876, -0.3812691, 3.506892, 1, 0, 0, 1, 1,
0.5758138, -1.013615, -0.3477447, 1, 0, 0, 1, 1,
0.581215, 0.4720764, -1.005243, 1, 0, 0, 1, 1,
0.5892673, 0.3790483, 1.307017, 1, 0, 0, 1, 1,
0.58999, -0.2588973, 2.233237, 0, 0, 0, 1, 1,
0.5943384, -0.9882719, 2.337045, 0, 0, 0, 1, 1,
0.6045569, -1.369414, 3.417092, 0, 0, 0, 1, 1,
0.605865, -1.830922, 3.379009, 0, 0, 0, 1, 1,
0.6064685, -0.1105591, 4.136777, 0, 0, 0, 1, 1,
0.6094961, 0.04448884, 1.738065, 0, 0, 0, 1, 1,
0.6102266, 0.05512717, 2.281204, 0, 0, 0, 1, 1,
0.613579, -1.537591, 3.007511, 1, 1, 1, 1, 1,
0.6141286, -1.152399, 3.960294, 1, 1, 1, 1, 1,
0.6186528, 1.111688, -0.6759644, 1, 1, 1, 1, 1,
0.621502, -0.9690799, 2.426915, 1, 1, 1, 1, 1,
0.6238524, -0.05003895, -0.09964699, 1, 1, 1, 1, 1,
0.6245428, 0.869381, -0.03750379, 1, 1, 1, 1, 1,
0.6250908, -0.5230426, 2.150345, 1, 1, 1, 1, 1,
0.6295358, -2.773529, 1.695595, 1, 1, 1, 1, 1,
0.6328586, 0.4063061, 1.402965, 1, 1, 1, 1, 1,
0.6355267, -0.1724634, 1.712062, 1, 1, 1, 1, 1,
0.635973, 0.0789411, 3.557524, 1, 1, 1, 1, 1,
0.6363955, -1.024491, 0.9565076, 1, 1, 1, 1, 1,
0.6393766, 0.2603254, 1.053198, 1, 1, 1, 1, 1,
0.6462789, 0.9536346, 0.3031024, 1, 1, 1, 1, 1,
0.6496701, 0.7973146, 1.427719, 1, 1, 1, 1, 1,
0.6499699, 1.725224, -0.9266869, 0, 0, 1, 1, 1,
0.6502997, -0.1038078, 2.424808, 1, 0, 0, 1, 1,
0.6568639, -0.0999117, 2.842043, 1, 0, 0, 1, 1,
0.6637301, -1.39704, 1.580774, 1, 0, 0, 1, 1,
0.6680619, -1.018847, 2.89777, 1, 0, 0, 1, 1,
0.6683642, 0.4156149, 2.650753, 1, 0, 0, 1, 1,
0.6697202, -0.9913389, 1.70041, 0, 0, 0, 1, 1,
0.6702369, -0.5965089, 2.398538, 0, 0, 0, 1, 1,
0.6758867, 1.045177, 1.765844, 0, 0, 0, 1, 1,
0.6791657, -0.9863152, 0.6099461, 0, 0, 0, 1, 1,
0.6812091, 1.155554, -0.9881234, 0, 0, 0, 1, 1,
0.6820394, 1.565519, -0.03280775, 0, 0, 0, 1, 1,
0.6821602, -1.156481, 2.502393, 0, 0, 0, 1, 1,
0.6851357, 0.7123281, 3.079388, 1, 1, 1, 1, 1,
0.6880162, -0.2512634, 2.595098, 1, 1, 1, 1, 1,
0.6881927, 0.1488675, 3.18317, 1, 1, 1, 1, 1,
0.6908882, -0.9570605, 0.5802293, 1, 1, 1, 1, 1,
0.6924646, 0.2502986, 1.595299, 1, 1, 1, 1, 1,
0.6925777, -0.8674843, 0.4711937, 1, 1, 1, 1, 1,
0.6963046, -0.8885894, 2.613238, 1, 1, 1, 1, 1,
0.6993833, 0.3065579, -0.06584163, 1, 1, 1, 1, 1,
0.703249, -0.1243356, 0.3106698, 1, 1, 1, 1, 1,
0.7067205, -0.8396783, 4.872077, 1, 1, 1, 1, 1,
0.7078211, -2.425986, 0.6858537, 1, 1, 1, 1, 1,
0.7083195, -0.9588202, 1.772683, 1, 1, 1, 1, 1,
0.7086353, -0.435416, 1.694325, 1, 1, 1, 1, 1,
0.7139931, 0.6013397, 2.202325, 1, 1, 1, 1, 1,
0.71667, -0.03205672, 2.860036, 1, 1, 1, 1, 1,
0.7194259, 1.600489, -0.935138, 0, 0, 1, 1, 1,
0.7205813, 1.928116, 0.6612087, 1, 0, 0, 1, 1,
0.7224793, -0.8069576, 3.771589, 1, 0, 0, 1, 1,
0.7241246, -0.8107154, 1.858467, 1, 0, 0, 1, 1,
0.7283325, -1.033855, 3.141638, 1, 0, 0, 1, 1,
0.7293917, -1.262207, 1.072123, 1, 0, 0, 1, 1,
0.7324257, 2.725378, 1.742215, 0, 0, 0, 1, 1,
0.7334971, 1.066672, 0.4470088, 0, 0, 0, 1, 1,
0.7336845, 1.305124, 0.08576676, 0, 0, 0, 1, 1,
0.7348309, 0.1854131, 0.1978988, 0, 0, 0, 1, 1,
0.7367136, 0.1051095, 1.397236, 0, 0, 0, 1, 1,
0.7377165, 0.8666394, 1.35987, 0, 0, 0, 1, 1,
0.7377186, -1.286824, 1.977056, 0, 0, 0, 1, 1,
0.7381482, 0.1885276, 0.5741822, 1, 1, 1, 1, 1,
0.7410303, -1.68176, 3.46494, 1, 1, 1, 1, 1,
0.7415368, -2.206625, 3.263104, 1, 1, 1, 1, 1,
0.7475319, 0.4360666, 1.554373, 1, 1, 1, 1, 1,
0.7477547, -0.827718, 1.838572, 1, 1, 1, 1, 1,
0.7482527, 1.021087, 1.060467, 1, 1, 1, 1, 1,
0.7499574, 0.379748, -0.473551, 1, 1, 1, 1, 1,
0.7511905, 0.03370133, 2.635898, 1, 1, 1, 1, 1,
0.7521539, 0.6796831, 0.6197524, 1, 1, 1, 1, 1,
0.7534721, -0.3256015, 3.074487, 1, 1, 1, 1, 1,
0.7561779, -0.2121939, 2.27393, 1, 1, 1, 1, 1,
0.7603535, 0.3913597, 1.15536, 1, 1, 1, 1, 1,
0.7758498, 0.4843348, 0.5439925, 1, 1, 1, 1, 1,
0.7863577, 0.5846124, 1.521251, 1, 1, 1, 1, 1,
0.7884621, -0.6265303, 1.90536, 1, 1, 1, 1, 1,
0.7900793, -1.789403, 2.941162, 0, 0, 1, 1, 1,
0.7901968, -0.1288367, 0.968039, 1, 0, 0, 1, 1,
0.7904695, 0.3967162, 0.9142922, 1, 0, 0, 1, 1,
0.7932038, 1.69351, 1.400395, 1, 0, 0, 1, 1,
0.7959982, 0.9171986, 1.539572, 1, 0, 0, 1, 1,
0.7972925, 0.9844714, 0.9886316, 1, 0, 0, 1, 1,
0.8012449, -0.9506377, 2.838877, 0, 0, 0, 1, 1,
0.8062462, 0.3673127, 0.5111812, 0, 0, 0, 1, 1,
0.8166768, 0.1244257, -0.61943, 0, 0, 0, 1, 1,
0.817714, -0.6090952, 2.998628, 0, 0, 0, 1, 1,
0.8234145, 0.1659479, 1.72016, 0, 0, 0, 1, 1,
0.8253489, -1.217419, 2.738691, 0, 0, 0, 1, 1,
0.8261042, 1.087522, 0.08104511, 0, 0, 0, 1, 1,
0.8301757, -1.02702, 3.252468, 1, 1, 1, 1, 1,
0.8328885, -0.3610357, 0.6065825, 1, 1, 1, 1, 1,
0.8383611, -0.2938465, 4.111695, 1, 1, 1, 1, 1,
0.839277, 1.658769, -0.3697026, 1, 1, 1, 1, 1,
0.8422529, -0.965691, 1.353451, 1, 1, 1, 1, 1,
0.8481374, 0.8463345, -0.3005193, 1, 1, 1, 1, 1,
0.851254, -0.2602551, 0.8898728, 1, 1, 1, 1, 1,
0.852192, -1.701881, 4.059983, 1, 1, 1, 1, 1,
0.8617052, 0.9778582, 1.242894, 1, 1, 1, 1, 1,
0.869943, 0.8674893, 1.233196, 1, 1, 1, 1, 1,
0.8728194, -1.115998, 1.974585, 1, 1, 1, 1, 1,
0.8728836, 0.6922699, 0.5456137, 1, 1, 1, 1, 1,
0.8865744, -0.9780185, 1.713689, 1, 1, 1, 1, 1,
0.8978603, -0.7459886, 2.715647, 1, 1, 1, 1, 1,
0.9004631, -0.8006209, 2.988257, 1, 1, 1, 1, 1,
0.9008439, -0.7813457, 2.238895, 0, 0, 1, 1, 1,
0.9011826, 1.409618, -1.108111, 1, 0, 0, 1, 1,
0.9200299, 1.214623, 1.886262, 1, 0, 0, 1, 1,
0.9202836, -1.213922, 1.244449, 1, 0, 0, 1, 1,
0.9232066, 0.9982219, 2.783746, 1, 0, 0, 1, 1,
0.9265801, 1.251172, 0.006310805, 1, 0, 0, 1, 1,
0.9299397, -1.066519, 2.33051, 0, 0, 0, 1, 1,
0.9307588, 1.193438, -1.222539, 0, 0, 0, 1, 1,
0.9309759, -1.860739, 2.701765, 0, 0, 0, 1, 1,
0.9404565, -0.7782509, 2.814972, 0, 0, 0, 1, 1,
0.9415036, -0.4805718, 1.682961, 0, 0, 0, 1, 1,
0.9428486, 1.242315, 1.199893, 0, 0, 0, 1, 1,
0.9468787, 1.592214, -0.1388396, 0, 0, 0, 1, 1,
0.9490343, -1.059615, 1.401902, 1, 1, 1, 1, 1,
0.9492134, -0.5936928, 2.439338, 1, 1, 1, 1, 1,
0.9520823, -0.2869257, 1.941307, 1, 1, 1, 1, 1,
0.9538904, 0.5143033, 1.568995, 1, 1, 1, 1, 1,
0.9561121, -1.050925, 2.509286, 1, 1, 1, 1, 1,
0.9566537, -0.3118467, 0.9788961, 1, 1, 1, 1, 1,
0.964433, -1.016154, 2.149167, 1, 1, 1, 1, 1,
0.9694768, -0.2303744, 0.303344, 1, 1, 1, 1, 1,
0.9696298, 1.887422, 0.7768313, 1, 1, 1, 1, 1,
0.9708298, -0.6343768, 1.354851, 1, 1, 1, 1, 1,
0.9795872, -1.167361, 1.65799, 1, 1, 1, 1, 1,
0.9897192, -2.431689, 0.5227906, 1, 1, 1, 1, 1,
0.9925297, 1.086957, 0.08418826, 1, 1, 1, 1, 1,
0.9947316, -1.385292, 3.307798, 1, 1, 1, 1, 1,
0.9958052, 0.9013507, 0.0888434, 1, 1, 1, 1, 1,
1.012528, 0.4979928, 0.07563441, 0, 0, 1, 1, 1,
1.016117, -0.6974165, 0.5698142, 1, 0, 0, 1, 1,
1.025393, -0.919839, 3.742929, 1, 0, 0, 1, 1,
1.027921, -0.07150298, 0.4275072, 1, 0, 0, 1, 1,
1.030909, -2.398882, 3.852043, 1, 0, 0, 1, 1,
1.033339, -0.4468791, 1.515749, 1, 0, 0, 1, 1,
1.036436, -1.191409, 2.392496, 0, 0, 0, 1, 1,
1.044774, 0.5204622, 1.44953, 0, 0, 0, 1, 1,
1.045712, 0.9904895, 1.498352, 0, 0, 0, 1, 1,
1.046802, 0.0519214, 1.397266, 0, 0, 0, 1, 1,
1.050349, -3.11478, 1.986925, 0, 0, 0, 1, 1,
1.053832, 2.92569, 0.9026276, 0, 0, 0, 1, 1,
1.054469, -2.614441, 3.289766, 0, 0, 0, 1, 1,
1.062187, 1.275659, 0.2202145, 1, 1, 1, 1, 1,
1.062906, -0.1106368, 1.465277, 1, 1, 1, 1, 1,
1.072457, 1.192881, 1.312491, 1, 1, 1, 1, 1,
1.083392, 1.227453, 0.5013652, 1, 1, 1, 1, 1,
1.085199, 0.817925, -0.1788694, 1, 1, 1, 1, 1,
1.08857, 0.2184042, 2.142432, 1, 1, 1, 1, 1,
1.089159, -1.262075, 2.34917, 1, 1, 1, 1, 1,
1.094396, 1.32598, 1.240544, 1, 1, 1, 1, 1,
1.097766, -0.02551291, 1.012009, 1, 1, 1, 1, 1,
1.102836, 0.555748, 1.201111, 1, 1, 1, 1, 1,
1.103839, 0.2546718, 0.3120658, 1, 1, 1, 1, 1,
1.107182, -1.206326, 1.963651, 1, 1, 1, 1, 1,
1.109312, -1.016576, 2.089917, 1, 1, 1, 1, 1,
1.111757, -0.3003284, 2.262015, 1, 1, 1, 1, 1,
1.11187, 1.028418, 0.4116175, 1, 1, 1, 1, 1,
1.11427, 0.6002498, 0.1934189, 0, 0, 1, 1, 1,
1.121454, -0.8486192, 2.940614, 1, 0, 0, 1, 1,
1.124842, -1.247904, 1.621539, 1, 0, 0, 1, 1,
1.132922, 0.3684225, 1.022933, 1, 0, 0, 1, 1,
1.136634, -0.2273887, 1.130466, 1, 0, 0, 1, 1,
1.137905, -0.2108764, 1.072136, 1, 0, 0, 1, 1,
1.140894, 1.515863, 2.078037, 0, 0, 0, 1, 1,
1.141521, -1.664808, 2.672874, 0, 0, 0, 1, 1,
1.146779, -0.1791354, 2.760302, 0, 0, 0, 1, 1,
1.149622, 1.487463, 0.2026406, 0, 0, 0, 1, 1,
1.157868, 1.293162, 1.501725, 0, 0, 0, 1, 1,
1.168912, -0.2534254, 2.775255, 0, 0, 0, 1, 1,
1.169823, -0.6257858, 0.7545351, 0, 0, 0, 1, 1,
1.178761, 0.7894391, 0.889134, 1, 1, 1, 1, 1,
1.185139, 0.2958028, 1.939765, 1, 1, 1, 1, 1,
1.192798, 0.1024883, 1.767837, 1, 1, 1, 1, 1,
1.199093, 0.3945116, 0.0410044, 1, 1, 1, 1, 1,
1.208586, 0.3752657, 0.006441711, 1, 1, 1, 1, 1,
1.210832, 0.3350504, 2.529021, 1, 1, 1, 1, 1,
1.213291, -0.7069522, 2.71158, 1, 1, 1, 1, 1,
1.215965, 1.503192, 2.015231, 1, 1, 1, 1, 1,
1.219158, 0.04869453, 1.292672, 1, 1, 1, 1, 1,
1.227308, -0.2778677, 0.7143649, 1, 1, 1, 1, 1,
1.232728, 0.9928979, 1.429464, 1, 1, 1, 1, 1,
1.241697, -1.240038, 3.174855, 1, 1, 1, 1, 1,
1.249758, 0.1446291, 1.087332, 1, 1, 1, 1, 1,
1.250296, -0.8217833, 3.82219, 1, 1, 1, 1, 1,
1.260439, 0.028187, 2.582538, 1, 1, 1, 1, 1,
1.290896, -0.3028941, 2.367255, 0, 0, 1, 1, 1,
1.297076, -0.2236966, -0.4071348, 1, 0, 0, 1, 1,
1.303816, 0.1072279, 1.290424, 1, 0, 0, 1, 1,
1.309473, -1.067539, 1.346592, 1, 0, 0, 1, 1,
1.31246, 0.09416326, 2.293367, 1, 0, 0, 1, 1,
1.322948, 1.419111, -0.8778134, 1, 0, 0, 1, 1,
1.3323, 0.3904548, 0.3661972, 0, 0, 0, 1, 1,
1.332617, 0.9470072, 1.944615, 0, 0, 0, 1, 1,
1.333163, -0.4731608, 0.7643195, 0, 0, 0, 1, 1,
1.338104, 0.3751679, 0.764751, 0, 0, 0, 1, 1,
1.339175, -0.6263156, 2.750511, 0, 0, 0, 1, 1,
1.35787, 0.5053617, 1.578283, 0, 0, 0, 1, 1,
1.363968, -0.7177283, 0.430472, 0, 0, 0, 1, 1,
1.378267, -0.1163006, 2.136806, 1, 1, 1, 1, 1,
1.390284, 0.7434704, -0.525898, 1, 1, 1, 1, 1,
1.39356, -0.4575473, 1.091807, 1, 1, 1, 1, 1,
1.397619, -0.5258965, 4.005976, 1, 1, 1, 1, 1,
1.408223, 0.3613662, 1.459257, 1, 1, 1, 1, 1,
1.421296, -0.6650075, 2.924327, 1, 1, 1, 1, 1,
1.428135, 0.992681, 3.928226, 1, 1, 1, 1, 1,
1.431735, -0.162487, -0.3079328, 1, 1, 1, 1, 1,
1.44108, 1.063595, 2.863241, 1, 1, 1, 1, 1,
1.446581, -0.3203951, 2.24823, 1, 1, 1, 1, 1,
1.452634, -1.059526, 2.44223, 1, 1, 1, 1, 1,
1.468562, -0.1228397, 0.9241487, 1, 1, 1, 1, 1,
1.483606, 0.9785197, 2.014678, 1, 1, 1, 1, 1,
1.484627, 0.1425681, 2.202236, 1, 1, 1, 1, 1,
1.486541, -1.951118, 3.550407, 1, 1, 1, 1, 1,
1.489004, 0.08365253, 1.488107, 0, 0, 1, 1, 1,
1.492305, 0.1311853, 2.190364, 1, 0, 0, 1, 1,
1.535185, 0.2848143, 1.634175, 1, 0, 0, 1, 1,
1.549655, 0.7578341, 1.976975, 1, 0, 0, 1, 1,
1.55036, -1.570615, 1.767636, 1, 0, 0, 1, 1,
1.56497, 0.2780384, 1.325544, 1, 0, 0, 1, 1,
1.600019, -1.87095, 3.741428, 0, 0, 0, 1, 1,
1.610759, -0.5502869, 3.122227, 0, 0, 0, 1, 1,
1.62472, 2.799139, 1.377447, 0, 0, 0, 1, 1,
1.648354, 0.679059, 2.627523, 0, 0, 0, 1, 1,
1.652758, 1.148976, 0.5544344, 0, 0, 0, 1, 1,
1.670696, 0.913964, 0.6335323, 0, 0, 0, 1, 1,
1.672061, 1.730845, -0.6072052, 0, 0, 0, 1, 1,
1.683067, 0.03071722, 1.019777, 1, 1, 1, 1, 1,
1.703984, 0.2633945, 2.117655, 1, 1, 1, 1, 1,
1.707546, -1.207993, 3.13484, 1, 1, 1, 1, 1,
1.712677, 1.255571, -0.7365629, 1, 1, 1, 1, 1,
1.713957, -0.5015492, 2.83221, 1, 1, 1, 1, 1,
1.722758, -0.4552367, 0.5181198, 1, 1, 1, 1, 1,
1.743847, 1.029381, 1.026933, 1, 1, 1, 1, 1,
1.762018, 0.5842335, 1.255923, 1, 1, 1, 1, 1,
1.763651, 0.3884332, 1.875084, 1, 1, 1, 1, 1,
1.768736, 1.179386, 0.9647535, 1, 1, 1, 1, 1,
1.798549, 0.8683653, 1.639788, 1, 1, 1, 1, 1,
1.803012, 0.8640923, 1.280082, 1, 1, 1, 1, 1,
1.807975, -2.300913, 1.724959, 1, 1, 1, 1, 1,
1.816382, 0.7420719, 1.619228, 1, 1, 1, 1, 1,
1.826605, 0.07182045, 3.16617, 1, 1, 1, 1, 1,
1.840459, -1.725441, 0.6680403, 0, 0, 1, 1, 1,
1.844882, -1.311306, 2.509776, 1, 0, 0, 1, 1,
1.917969, 0.9229044, 1.356754, 1, 0, 0, 1, 1,
1.936333, -2.406098, 2.534257, 1, 0, 0, 1, 1,
1.947972, 0.9953915, 1.618783, 1, 0, 0, 1, 1,
1.987222, -0.8648298, 2.073433, 1, 0, 0, 1, 1,
1.992612, -0.3892262, 0.5438387, 0, 0, 0, 1, 1,
2.005089, 0.0424509, 1.720703, 0, 0, 0, 1, 1,
2.013498, -1.254184, 1.997559, 0, 0, 0, 1, 1,
2.077888, 0.3629408, 0.8913635, 0, 0, 0, 1, 1,
2.078681, -1.310912, 1.986744, 0, 0, 0, 1, 1,
2.101903, 1.127378, 0.9291208, 0, 0, 0, 1, 1,
2.202969, -0.0002106094, 1.648668, 0, 0, 0, 1, 1,
2.208707, -1.631868, 1.208346, 1, 1, 1, 1, 1,
2.217885, 2.430725, 0.9939262, 1, 1, 1, 1, 1,
2.223586, -0.5776466, 3.172392, 1, 1, 1, 1, 1,
2.43897, 0.4906954, 0.5832983, 1, 1, 1, 1, 1,
2.695644, 1.043564, 0.5420232, 1, 1, 1, 1, 1,
2.755133, 1.655487, -0.4029205, 1, 1, 1, 1, 1,
3.099967, 0.7130616, 3.283221, 1, 1, 1, 1, 1
]);
var values25 = v;
var normLoc25 = gl.getAttribLocation(prog25, "aNorm");
var mvMatLoc25 = gl.getUniformLocation(prog25,"mvMatrix");
var prMatLoc25 = gl.getUniformLocation(prog25,"prMatrix");
var normMatLoc25 = gl.getUniformLocation(prog25,"normMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 19 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 9.576683;
var distance = 33.6377;
var t = tan(fov[19]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[19], hlen*aspect*zoom[19], 
-hlen*zoom[19], hlen*zoom[19], near, far);
else  
prMatrix.frustum(-hlen*zoom[19], hlen*zoom[19], 
-hlen*zoom[19]/aspect, hlen*zoom[19]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( -0.02399158, -0.01467419, 0.3180571 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.6377);
normMatrix.makeIdentity();
normMatrix.scale( 1, 1, 1 );   
normMatrix.multRight( userMatrix[19] );
// ****** spheres object 25 *******
gl.useProgram(prog25);
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.uniformMatrix4fv( prMatLoc25, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(normMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.enableVertexAttribArray(normLoc25 );
gl.vertexAttribPointer(normLoc25,  3, gl.FLOAT, false, 12,  0);
gl.disableVertexAttribArray( colLoc );
var sphereNorm = new CanvasMatrix4();
sphereNorm.scale(1, 1, 1);
sphereNorm.multRight(normMatrix);
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(sphereNorm.getAsArray()) );
for (var i = 0; i < 1000; i++) {
var sphereMV = new CanvasMatrix4();
var baseofs = i*8
var ofs = baseofs + 7;	       
var scale = values25[ofs];
sphereMV.scale(1*scale, 1*scale, 1*scale);
sphereMV.translate(values25[baseofs], 
values25[baseofs+1], 
values25[baseofs+2]);
sphereMV.multRight(mvMatrix);
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(sphereMV.getAsArray()) );
ofs = baseofs + 3;       
gl.vertexAttrib4f( colLoc, values25[ofs], 
values25[ofs+1], 
values25[ofs+2],
values25[ofs+3] );
gl.drawElements(gl.TRIANGLES, 384, gl.UNSIGNED_SHORT, 0);
}
gl.flush ();
}
var vpx0 = {
19: 0
};
var vpy0 = {
19: 0
};
var vpWidths = {
19: 504
};
var vpHeights = {
19: 504
};
var activeModel = {
19: 19
};
var activeProjection = {
19: 19
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(19);
return(19);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testgl2canvas" width="1" height="1"></canvas> 
<p id="testgl2debug">
You must enable Javascript to view this page properly.</p>
<script>testgl2webGLStart();</script>