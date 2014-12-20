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
-3.278335, -1.515543, -1.196043, 1, 0, 0, 1,
-3.187148, 1.747094, -0.409202, 1, 0.007843138, 0, 1,
-3.058752, 0.8784522, -0.4413146, 1, 0.01176471, 0, 1,
-2.893902, -0.04315181, -2.728481, 1, 0.01960784, 0, 1,
-2.78409, 2.370956, -1.168299, 1, 0.02352941, 0, 1,
-2.696118, 2.447417, -2.818789, 1, 0.03137255, 0, 1,
-2.694613, 0.3269266, -2.718341, 1, 0.03529412, 0, 1,
-2.620294, -1.254559, -2.257549, 1, 0.04313726, 0, 1,
-2.594673, 1.107873, -2.125403, 1, 0.04705882, 0, 1,
-2.569185, 1.50978, -0.2579653, 1, 0.05490196, 0, 1,
-2.46009, 0.7041984, -0.4897565, 1, 0.05882353, 0, 1,
-2.417502, 0.2408823, -1.302807, 1, 0.06666667, 0, 1,
-2.407454, -1.313952, -0.6400331, 1, 0.07058824, 0, 1,
-2.382247, 0.9308219, -2.435837, 1, 0.07843138, 0, 1,
-2.353554, 0.4206677, 0.4449242, 1, 0.08235294, 0, 1,
-2.297597, 0.7246524, -1.037943, 1, 0.09019608, 0, 1,
-2.284516, 0.5770566, -0.1231545, 1, 0.09411765, 0, 1,
-2.256285, 0.8594679, -2.767645, 1, 0.1019608, 0, 1,
-2.230421, 0.7276051, -0.8584961, 1, 0.1098039, 0, 1,
-2.220062, -0.5904993, -1.649243, 1, 0.1137255, 0, 1,
-2.216379, -0.6474885, -4.588298, 1, 0.1215686, 0, 1,
-2.183204, -1.601938, -0.8647063, 1, 0.1254902, 0, 1,
-2.127404, -1.10589, -1.360842, 1, 0.1333333, 0, 1,
-2.075086, 0.1546248, -0.8187166, 1, 0.1372549, 0, 1,
-2.058728, -1.417486, -2.171918, 1, 0.145098, 0, 1,
-2.054886, 2.484244, -2.74884, 1, 0.1490196, 0, 1,
-2.049996, 0.5557273, -1.203103, 1, 0.1568628, 0, 1,
-2.00808, 1.271267, 0.2059903, 1, 0.1607843, 0, 1,
-1.990755, 0.4387556, -1.341417, 1, 0.1686275, 0, 1,
-1.977655, 0.8503117, -0.8440794, 1, 0.172549, 0, 1,
-1.95007, 1.269826, -1.301592, 1, 0.1803922, 0, 1,
-1.94466, 0.2336035, -1.536728, 1, 0.1843137, 0, 1,
-1.933088, -2.372076, -2.247086, 1, 0.1921569, 0, 1,
-1.8963, -1.080121, -3.117371, 1, 0.1960784, 0, 1,
-1.85804, 1.053961, -1.0597, 1, 0.2039216, 0, 1,
-1.841124, -1.091886, -0.827149, 1, 0.2117647, 0, 1,
-1.839728, -0.9955484, -0.6744784, 1, 0.2156863, 0, 1,
-1.814642, 0.4379817, -1.410518, 1, 0.2235294, 0, 1,
-1.79818, 0.0223159, -1.053761, 1, 0.227451, 0, 1,
-1.791581, -2.180842, -1.854077, 1, 0.2352941, 0, 1,
-1.765162, 1.44854, -1.836087, 1, 0.2392157, 0, 1,
-1.731155, -0.09540246, -2.644162, 1, 0.2470588, 0, 1,
-1.717588, -1.167892, -2.388332, 1, 0.2509804, 0, 1,
-1.716962, 0.9784395, 0.1374921, 1, 0.2588235, 0, 1,
-1.714969, 1.418388, -0.6677673, 1, 0.2627451, 0, 1,
-1.712684, 0.7216452, -1.737621, 1, 0.2705882, 0, 1,
-1.703033, 0.7674395, -1.142247, 1, 0.2745098, 0, 1,
-1.694771, -0.3594639, -1.963525, 1, 0.282353, 0, 1,
-1.693356, 1.082306, -1.330899, 1, 0.2862745, 0, 1,
-1.677074, -0.8131, -3.021584, 1, 0.2941177, 0, 1,
-1.67231, -1.063148, -1.882959, 1, 0.3019608, 0, 1,
-1.669972, -1.197921, -3.256062, 1, 0.3058824, 0, 1,
-1.661104, 2.479475, -1.565969, 1, 0.3137255, 0, 1,
-1.657877, -0.2928579, -1.15, 1, 0.3176471, 0, 1,
-1.648575, 0.01398801, -1.453898, 1, 0.3254902, 0, 1,
-1.645227, -1.12746, -3.076612, 1, 0.3294118, 0, 1,
-1.623275, -0.4577696, -1.296741, 1, 0.3372549, 0, 1,
-1.621641, -0.9802446, -1.491411, 1, 0.3411765, 0, 1,
-1.61924, 1.152982, -0.3233585, 1, 0.3490196, 0, 1,
-1.608941, -0.03541255, 0.178284, 1, 0.3529412, 0, 1,
-1.604552, -0.1622201, -2.983634, 1, 0.3607843, 0, 1,
-1.599383, -0.2295669, -3.125295, 1, 0.3647059, 0, 1,
-1.597457, -0.8218465, -2.839052, 1, 0.372549, 0, 1,
-1.595554, 1.077283, -0.5444923, 1, 0.3764706, 0, 1,
-1.584141, -1.019571, -1.414468, 1, 0.3843137, 0, 1,
-1.580386, -1.007374, -3.114639, 1, 0.3882353, 0, 1,
-1.558308, 0.6216862, -1.66778, 1, 0.3960784, 0, 1,
-1.54236, -0.5829476, -1.99361, 1, 0.4039216, 0, 1,
-1.524166, -2.223806, -3.371835, 1, 0.4078431, 0, 1,
-1.507826, -0.6985651, -2.116135, 1, 0.4156863, 0, 1,
-1.504585, 0.5331385, -3.177243, 1, 0.4196078, 0, 1,
-1.497976, 0.1083734, -1.150156, 1, 0.427451, 0, 1,
-1.497344, -0.3968327, -1.914871, 1, 0.4313726, 0, 1,
-1.492287, -1.012103, -3.266382, 1, 0.4392157, 0, 1,
-1.490108, 0.1266229, -1.99625, 1, 0.4431373, 0, 1,
-1.475442, -1.833808, -2.296126, 1, 0.4509804, 0, 1,
-1.463932, -0.1922879, -1.746852, 1, 0.454902, 0, 1,
-1.463226, -2.244163, -1.568622, 1, 0.4627451, 0, 1,
-1.462819, -0.2325651, -0.8655459, 1, 0.4666667, 0, 1,
-1.459986, -0.08349802, -0.9699379, 1, 0.4745098, 0, 1,
-1.433604, -0.492246, -0.898836, 1, 0.4784314, 0, 1,
-1.432388, 0.1858996, -2.834528, 1, 0.4862745, 0, 1,
-1.42475, 1.149088, -2.873651, 1, 0.4901961, 0, 1,
-1.423791, 1.015673, -1.267894, 1, 0.4980392, 0, 1,
-1.423439, 0.8750738, -1.903273, 1, 0.5058824, 0, 1,
-1.420734, 0.8453071, -0.280946, 1, 0.509804, 0, 1,
-1.415828, 1.737785, -2.376997, 1, 0.5176471, 0, 1,
-1.415195, 0.4089097, -1.475974, 1, 0.5215687, 0, 1,
-1.413809, -0.5565234, -2.340154, 1, 0.5294118, 0, 1,
-1.412362, 1.233207, 1.106766, 1, 0.5333334, 0, 1,
-1.405751, -0.167293, -2.181142, 1, 0.5411765, 0, 1,
-1.401389, 0.437437, -2.141549, 1, 0.5450981, 0, 1,
-1.392022, -0.8048838, -2.163963, 1, 0.5529412, 0, 1,
-1.391741, 0.2813845, -2.365974, 1, 0.5568628, 0, 1,
-1.389981, 0.7566733, -0.9549148, 1, 0.5647059, 0, 1,
-1.38879, 0.3793929, -0.4224773, 1, 0.5686275, 0, 1,
-1.378343, 1.17404, 0.2505886, 1, 0.5764706, 0, 1,
-1.372045, 0.3090947, 0.4547582, 1, 0.5803922, 0, 1,
-1.368876, -1.548812, -1.046888, 1, 0.5882353, 0, 1,
-1.365976, 0.7396404, -1.945459, 1, 0.5921569, 0, 1,
-1.365684, -0.9039997, -0.5630999, 1, 0.6, 0, 1,
-1.35802, -0.06099992, -1.800285, 1, 0.6078432, 0, 1,
-1.352355, 0.9235688, 0.1050942, 1, 0.6117647, 0, 1,
-1.347971, 0.08146991, -1.732284, 1, 0.6196079, 0, 1,
-1.336792, 0.5129865, 0.4482296, 1, 0.6235294, 0, 1,
-1.328056, 0.4601194, -2.017926, 1, 0.6313726, 0, 1,
-1.324321, 0.5372224, 0.01211513, 1, 0.6352941, 0, 1,
-1.322247, 0.6072858, 1.118384, 1, 0.6431373, 0, 1,
-1.320062, 0.1292056, -2.676758, 1, 0.6470588, 0, 1,
-1.319513, 1.343276, -1.617713, 1, 0.654902, 0, 1,
-1.314281, 0.005834508, -0.5781443, 1, 0.6588235, 0, 1,
-1.307256, -1.553143, -2.589246, 1, 0.6666667, 0, 1,
-1.298634, 0.530028, -1.622074, 1, 0.6705883, 0, 1,
-1.289517, 0.2029829, -3.003289, 1, 0.6784314, 0, 1,
-1.272257, 1.34199, -0.4849508, 1, 0.682353, 0, 1,
-1.270345, 0.3418402, -1.357032, 1, 0.6901961, 0, 1,
-1.261818, -0.3074182, -2.520993, 1, 0.6941177, 0, 1,
-1.260652, -0.06038895, -0.05866503, 1, 0.7019608, 0, 1,
-1.254375, 1.796786, -0.2065134, 1, 0.7098039, 0, 1,
-1.24896, 1.05461, 0.03728417, 1, 0.7137255, 0, 1,
-1.245091, -0.378537, -2.147867, 1, 0.7215686, 0, 1,
-1.244848, 0.4336241, -1.685804, 1, 0.7254902, 0, 1,
-1.242369, -0.1187291, -0.7355373, 1, 0.7333333, 0, 1,
-1.230436, -0.8163247, -2.911518, 1, 0.7372549, 0, 1,
-1.221121, -0.3834642, -1.094358, 1, 0.7450981, 0, 1,
-1.213869, -0.6504797, -0.7737987, 1, 0.7490196, 0, 1,
-1.207363, -0.1552236, -4.754172, 1, 0.7568628, 0, 1,
-1.206618, -0.7722381, -1.894368, 1, 0.7607843, 0, 1,
-1.198457, 1.116704, -0.161321, 1, 0.7686275, 0, 1,
-1.198065, 1.36948, -0.5541398, 1, 0.772549, 0, 1,
-1.18817, 1.199205, 1.56938, 1, 0.7803922, 0, 1,
-1.185236, -1.385643, -2.891837, 1, 0.7843137, 0, 1,
-1.179221, 0.6961662, -0.07393143, 1, 0.7921569, 0, 1,
-1.172498, -1.477945, -2.25099, 1, 0.7960784, 0, 1,
-1.171804, 0.8863313, -1.329816, 1, 0.8039216, 0, 1,
-1.155993, 0.1900636, -1.192119, 1, 0.8117647, 0, 1,
-1.154599, -2.238416, -1.159142, 1, 0.8156863, 0, 1,
-1.14436, 0.429989, -1.395064, 1, 0.8235294, 0, 1,
-1.137077, -0.8472432, 0.3181735, 1, 0.827451, 0, 1,
-1.131442, -0.6249489, -3.240013, 1, 0.8352941, 0, 1,
-1.127021, -0.1456781, -3.443511, 1, 0.8392157, 0, 1,
-1.126947, 0.5267698, -0.5650277, 1, 0.8470588, 0, 1,
-1.12682, 0.8887686, -1.977516, 1, 0.8509804, 0, 1,
-1.122557, -0.09717991, -2.471221, 1, 0.8588235, 0, 1,
-1.121743, 1.391943, 0.5322617, 1, 0.8627451, 0, 1,
-1.116512, 1.292796, -0.4514562, 1, 0.8705882, 0, 1,
-1.110736, -0.01747558, -1.847951, 1, 0.8745098, 0, 1,
-1.109748, -0.4078276, -1.650609, 1, 0.8823529, 0, 1,
-1.104554, 0.4372582, -0.857792, 1, 0.8862745, 0, 1,
-1.101085, -0.8210505, -1.909243, 1, 0.8941177, 0, 1,
-1.098612, -0.3908552, -2.469326, 1, 0.8980392, 0, 1,
-1.097636, 0.006125837, -1.615422, 1, 0.9058824, 0, 1,
-1.090228, -0.571812, -1.709823, 1, 0.9137255, 0, 1,
-1.089939, -1.421733, -2.035394, 1, 0.9176471, 0, 1,
-1.087905, 0.2101728, -1.854345, 1, 0.9254902, 0, 1,
-1.083151, -0.5842347, -3.489923, 1, 0.9294118, 0, 1,
-1.08111, -0.4015474, -4.265344, 1, 0.9372549, 0, 1,
-1.075789, 0.1521174, -0.1414609, 1, 0.9411765, 0, 1,
-1.074549, -1.434068, -0.6152003, 1, 0.9490196, 0, 1,
-1.073094, 0.09084173, -1.057775, 1, 0.9529412, 0, 1,
-1.068882, 1.685172, -0.4364995, 1, 0.9607843, 0, 1,
-1.06802, -0.3718355, -2.509943, 1, 0.9647059, 0, 1,
-1.065101, -1.238788, -2.045815, 1, 0.972549, 0, 1,
-1.063993, -0.8619018, -2.029647, 1, 0.9764706, 0, 1,
-1.063339, -1.294733, -2.132362, 1, 0.9843137, 0, 1,
-1.062261, 0.1485536, -0.9270675, 1, 0.9882353, 0, 1,
-1.061272, -0.3921366, -1.937916, 1, 0.9960784, 0, 1,
-1.057619, -1.65854, -1.57181, 0.9960784, 1, 0, 1,
-1.050329, -0.546458, -2.236922, 0.9921569, 1, 0, 1,
-1.047709, 1.308789, -1.433751, 0.9843137, 1, 0, 1,
-1.042467, -1.379918, -2.218698, 0.9803922, 1, 0, 1,
-1.033538, -0.6744582, -3.060783, 0.972549, 1, 0, 1,
-1.031963, 1.199802, -1.421874, 0.9686275, 1, 0, 1,
-1.031613, 0.4291959, 0.4645241, 0.9607843, 1, 0, 1,
-1.030746, -0.5732937, -2.823771, 0.9568627, 1, 0, 1,
-1.013575, 0.5984428, 0.2686653, 0.9490196, 1, 0, 1,
-1.01339, -0.5592826, -1.349284, 0.945098, 1, 0, 1,
-1.008888, 0.546169, -0.5718733, 0.9372549, 1, 0, 1,
-1.007669, 0.3437021, -1.227275, 0.9333333, 1, 0, 1,
-1.001546, 1.013156, -0.3657499, 0.9254902, 1, 0, 1,
-0.9907774, 0.08520544, -0.3083611, 0.9215686, 1, 0, 1,
-0.990254, 0.4249499, -0.300522, 0.9137255, 1, 0, 1,
-0.9900622, 0.3580804, -0.2009255, 0.9098039, 1, 0, 1,
-0.9849756, 0.02905772, -1.202878, 0.9019608, 1, 0, 1,
-0.9848653, -0.3923521, -4.66079, 0.8941177, 1, 0, 1,
-0.9820232, 0.750892, -0.496733, 0.8901961, 1, 0, 1,
-0.9802377, -1.647735, -2.121082, 0.8823529, 1, 0, 1,
-0.9708708, -3.521929, -3.884041, 0.8784314, 1, 0, 1,
-0.9584581, -0.1838245, -2.077238, 0.8705882, 1, 0, 1,
-0.9578096, 1.185212, -1.523678, 0.8666667, 1, 0, 1,
-0.9531727, 2.706689, -1.939235, 0.8588235, 1, 0, 1,
-0.9442881, 0.3743975, -1.082394, 0.854902, 1, 0, 1,
-0.9392815, -0.5174249, -4.249434, 0.8470588, 1, 0, 1,
-0.933995, -0.2202828, -2.414782, 0.8431373, 1, 0, 1,
-0.9261864, -0.6500291, -2.630923, 0.8352941, 1, 0, 1,
-0.9244661, 0.7027217, -1.759922, 0.8313726, 1, 0, 1,
-0.9237207, 0.9255139, -0.1922248, 0.8235294, 1, 0, 1,
-0.9221917, 0.4043438, -0.07387712, 0.8196079, 1, 0, 1,
-0.9111255, 0.09312417, -1.982307, 0.8117647, 1, 0, 1,
-0.9054978, -0.7886763, -2.671654, 0.8078431, 1, 0, 1,
-0.9037144, 0.9639756, -1.269629, 0.8, 1, 0, 1,
-0.8976693, 1.306287, 0.2214697, 0.7921569, 1, 0, 1,
-0.8972937, 1.526454, -1.571557, 0.7882353, 1, 0, 1,
-0.8815496, 0.9266983, -0.5810773, 0.7803922, 1, 0, 1,
-0.8746651, 1.362114, 0.292264, 0.7764706, 1, 0, 1,
-0.8733113, 0.5182939, -2.481607, 0.7686275, 1, 0, 1,
-0.8712106, -0.3427522, -1.54332, 0.7647059, 1, 0, 1,
-0.8701689, -1.959779, -2.230525, 0.7568628, 1, 0, 1,
-0.8646821, 1.123795, -0.3950595, 0.7529412, 1, 0, 1,
-0.8637483, -0.4390949, 0.1758077, 0.7450981, 1, 0, 1,
-0.8616412, -0.01318446, 0.1775322, 0.7411765, 1, 0, 1,
-0.8586873, 0.163048, -1.434328, 0.7333333, 1, 0, 1,
-0.8437284, 0.9786507, 0.4434666, 0.7294118, 1, 0, 1,
-0.8426114, 0.2875853, -1.882608, 0.7215686, 1, 0, 1,
-0.8342891, 0.5079339, -2.730097, 0.7176471, 1, 0, 1,
-0.8320911, 0.2998516, -3.901008, 0.7098039, 1, 0, 1,
-0.8308972, -0.6001287, -3.117189, 0.7058824, 1, 0, 1,
-0.8301491, 1.102039, 0.2274558, 0.6980392, 1, 0, 1,
-0.8277493, 0.2643932, -1.67123, 0.6901961, 1, 0, 1,
-0.8275152, 0.02781621, -2.092325, 0.6862745, 1, 0, 1,
-0.826077, 0.2732332, -3.711444, 0.6784314, 1, 0, 1,
-0.8180408, 1.474905, 0.04971028, 0.6745098, 1, 0, 1,
-0.816661, -1.416172, -2.652629, 0.6666667, 1, 0, 1,
-0.8130305, 0.5328493, -1.363281, 0.6627451, 1, 0, 1,
-0.8124828, -1.509485, -2.507052, 0.654902, 1, 0, 1,
-0.8105289, 1.374297, -0.7011756, 0.6509804, 1, 0, 1,
-0.7990291, -1.137366, -3.220456, 0.6431373, 1, 0, 1,
-0.7984599, -1.526947, -0.5679574, 0.6392157, 1, 0, 1,
-0.7930585, 0.01441379, -2.221176, 0.6313726, 1, 0, 1,
-0.7908913, -0.8565139, -3.40976, 0.627451, 1, 0, 1,
-0.7896661, -0.2513419, -3.659259, 0.6196079, 1, 0, 1,
-0.788127, 1.462286, -0.02977556, 0.6156863, 1, 0, 1,
-0.7828994, -1.982514, -4.43745, 0.6078432, 1, 0, 1,
-0.7822578, -1.831225, -1.847272, 0.6039216, 1, 0, 1,
-0.7813841, 1.361272, -1.523348, 0.5960785, 1, 0, 1,
-0.7794101, -0.8456817, -2.268931, 0.5882353, 1, 0, 1,
-0.778579, -1.536752, -0.5288457, 0.5843138, 1, 0, 1,
-0.7641914, -0.3965573, -1.331568, 0.5764706, 1, 0, 1,
-0.764094, -0.4406072, -1.240898, 0.572549, 1, 0, 1,
-0.7587537, -1.501785, -2.809903, 0.5647059, 1, 0, 1,
-0.7574229, 1.841979, 0.121682, 0.5607843, 1, 0, 1,
-0.7552228, 1.575041, 0.2782684, 0.5529412, 1, 0, 1,
-0.750962, -0.216802, -1.961442, 0.5490196, 1, 0, 1,
-0.7475558, -0.9055492, -4.469233, 0.5411765, 1, 0, 1,
-0.7435992, 1.067401, -0.3939209, 0.5372549, 1, 0, 1,
-0.7428099, 1.918385, -1.375657, 0.5294118, 1, 0, 1,
-0.7398275, -0.05354761, -0.7524284, 0.5254902, 1, 0, 1,
-0.7385016, 0.6573917, -0.8411177, 0.5176471, 1, 0, 1,
-0.736782, 1.746864, -0.0878941, 0.5137255, 1, 0, 1,
-0.7329376, -0.1496307, -1.278938, 0.5058824, 1, 0, 1,
-0.7297844, 0.06975952, -1.770637, 0.5019608, 1, 0, 1,
-0.7264263, -0.7472807, -2.713905, 0.4941176, 1, 0, 1,
-0.7263664, -0.6660861, -2.713436, 0.4862745, 1, 0, 1,
-0.7257614, 1.203725, -1.444805, 0.4823529, 1, 0, 1,
-0.7241694, 2.452403, 1.011349, 0.4745098, 1, 0, 1,
-0.7225988, -0.00903235, 0.4546059, 0.4705882, 1, 0, 1,
-0.7170845, 0.8629719, -1.611644, 0.4627451, 1, 0, 1,
-0.7086536, 0.3201996, -0.8864108, 0.4588235, 1, 0, 1,
-0.7061207, 0.07392559, -0.2051407, 0.4509804, 1, 0, 1,
-0.7026744, -0.6042882, -1.978176, 0.4470588, 1, 0, 1,
-0.6989012, -0.5719924, -1.696688, 0.4392157, 1, 0, 1,
-0.6956843, -2.83032, -3.692272, 0.4352941, 1, 0, 1,
-0.6955898, 0.7280714, -2.490484, 0.427451, 1, 0, 1,
-0.6938199, -0.0345431, -1.622601, 0.4235294, 1, 0, 1,
-0.6910914, -0.2389437, -2.70045, 0.4156863, 1, 0, 1,
-0.6883379, -0.7558433, -1.847319, 0.4117647, 1, 0, 1,
-0.6881874, -0.581116, -4.307017, 0.4039216, 1, 0, 1,
-0.678869, 0.3159775, -0.2913888, 0.3960784, 1, 0, 1,
-0.6749973, 0.7390549, -0.5016024, 0.3921569, 1, 0, 1,
-0.6738113, -1.061726, -2.733835, 0.3843137, 1, 0, 1,
-0.6703632, -1.137235, -1.545046, 0.3803922, 1, 0, 1,
-0.6576374, -0.3106391, -1.019395, 0.372549, 1, 0, 1,
-0.6565697, -1.048928, -2.080911, 0.3686275, 1, 0, 1,
-0.6557645, 1.588335, -1.129429, 0.3607843, 1, 0, 1,
-0.6549708, -1.620268, -2.943587, 0.3568628, 1, 0, 1,
-0.6525821, 0.5247021, -1.175596, 0.3490196, 1, 0, 1,
-0.6510988, -0.1809434, -0.3509539, 0.345098, 1, 0, 1,
-0.6432999, 0.5155146, -2.302589, 0.3372549, 1, 0, 1,
-0.6334947, 0.0267318, -0.003410129, 0.3333333, 1, 0, 1,
-0.6324174, -0.981975, -1.510248, 0.3254902, 1, 0, 1,
-0.6301427, -1.067422, -1.934074, 0.3215686, 1, 0, 1,
-0.6295931, -0.5945521, -1.929849, 0.3137255, 1, 0, 1,
-0.6264873, 0.6246404, -1.202757, 0.3098039, 1, 0, 1,
-0.6194633, -0.437242, -2.626289, 0.3019608, 1, 0, 1,
-0.612438, -0.0582473, -2.009643, 0.2941177, 1, 0, 1,
-0.6068579, -1.037345, -3.344478, 0.2901961, 1, 0, 1,
-0.603546, 0.4028971, -0.3707666, 0.282353, 1, 0, 1,
-0.6006106, 1.369426, -0.8947612, 0.2784314, 1, 0, 1,
-0.597942, -1.373013, -4.774768, 0.2705882, 1, 0, 1,
-0.5965498, 1.789681, -0.8790459, 0.2666667, 1, 0, 1,
-0.5934832, -0.874671, -3.406981, 0.2588235, 1, 0, 1,
-0.5684768, 1.000602, -2.715053, 0.254902, 1, 0, 1,
-0.5682741, 0.247392, -2.764847, 0.2470588, 1, 0, 1,
-0.5649265, 0.3859547, 0.9878083, 0.2431373, 1, 0, 1,
-0.5646207, 1.053238, -0.05095677, 0.2352941, 1, 0, 1,
-0.5635595, -0.4305374, -2.16731, 0.2313726, 1, 0, 1,
-0.5623349, 1.236766, -0.7856075, 0.2235294, 1, 0, 1,
-0.5533919, 0.3428498, -0.3716992, 0.2196078, 1, 0, 1,
-0.5526112, 0.8090355, -1.404286, 0.2117647, 1, 0, 1,
-0.550234, 1.947451, -0.7048082, 0.2078431, 1, 0, 1,
-0.5500057, -1.80379, -4.437498, 0.2, 1, 0, 1,
-0.5490567, 0.2040627, -0.1300653, 0.1921569, 1, 0, 1,
-0.5451354, 0.1115219, -2.233145, 0.1882353, 1, 0, 1,
-0.5432986, 0.4117309, 0.1057923, 0.1803922, 1, 0, 1,
-0.5427564, -0.4376999, -3.589305, 0.1764706, 1, 0, 1,
-0.5416594, -0.5511389, -0.2060696, 0.1686275, 1, 0, 1,
-0.5394263, -0.1143568, -0.8297281, 0.1647059, 1, 0, 1,
-0.5318929, -2.12458, -3.996656, 0.1568628, 1, 0, 1,
-0.5300738, 1.097175, -0.3939553, 0.1529412, 1, 0, 1,
-0.5272954, 0.5901877, -0.5583859, 0.145098, 1, 0, 1,
-0.5262584, 0.2101795, -1.299758, 0.1411765, 1, 0, 1,
-0.5204682, -0.2584514, -2.886701, 0.1333333, 1, 0, 1,
-0.5198317, -0.6344629, -0.973385, 0.1294118, 1, 0, 1,
-0.5172793, -0.9375858, -2.46425, 0.1215686, 1, 0, 1,
-0.5146703, 1.106591, -1.314589, 0.1176471, 1, 0, 1,
-0.5083207, 0.6790422, -0.2626975, 0.1098039, 1, 0, 1,
-0.5070649, -1.095155, -2.632211, 0.1058824, 1, 0, 1,
-0.5069246, 0.2784656, -0.8573509, 0.09803922, 1, 0, 1,
-0.5067569, -1.065827, -2.204296, 0.09019608, 1, 0, 1,
-0.5052946, 0.8367498, 0.5707517, 0.08627451, 1, 0, 1,
-0.5044115, 1.276114, -1.633327, 0.07843138, 1, 0, 1,
-0.5041858, -0.4983912, -1.632934, 0.07450981, 1, 0, 1,
-0.5021064, -0.2464114, -3.75042, 0.06666667, 1, 0, 1,
-0.501076, -0.06554975, -1.878127, 0.0627451, 1, 0, 1,
-0.4953342, 1.993222, -0.9339566, 0.05490196, 1, 0, 1,
-0.4937199, -0.05664358, -2.627482, 0.05098039, 1, 0, 1,
-0.4832623, -0.2620205, -1.531348, 0.04313726, 1, 0, 1,
-0.4800187, -0.6847119, -3.003943, 0.03921569, 1, 0, 1,
-0.4663939, 0.5038322, -0.6647964, 0.03137255, 1, 0, 1,
-0.4644232, -0.3574601, -1.485744, 0.02745098, 1, 0, 1,
-0.4637208, 0.3524725, -0.9879761, 0.01960784, 1, 0, 1,
-0.4554807, -1.242464, -2.422216, 0.01568628, 1, 0, 1,
-0.4554554, -1.124433, -2.973215, 0.007843138, 1, 0, 1,
-0.4543944, -1.194987, -4.006092, 0.003921569, 1, 0, 1,
-0.4537056, -1.698065, -2.957849, 0, 1, 0.003921569, 1,
-0.4511147, -1.954378, -2.89001, 0, 1, 0.01176471, 1,
-0.4506527, 1.582806, 1.755545, 0, 1, 0.01568628, 1,
-0.4501188, 0.931003, -2.219655, 0, 1, 0.02352941, 1,
-0.4454565, -0.5745636, -2.433594, 0, 1, 0.02745098, 1,
-0.4442447, 0.9140515, -1.485276, 0, 1, 0.03529412, 1,
-0.4421272, 0.3579621, -1.102735, 0, 1, 0.03921569, 1,
-0.4414618, -1.752586, -3.906012, 0, 1, 0.04705882, 1,
-0.4397741, 0.4329185, 1.600847, 0, 1, 0.05098039, 1,
-0.4386925, -0.6791017, -3.016036, 0, 1, 0.05882353, 1,
-0.4375913, 0.1074005, -1.297364, 0, 1, 0.0627451, 1,
-0.4322526, 2.11614, -1.393958, 0, 1, 0.07058824, 1,
-0.4318619, -2.569182, -3.283052, 0, 1, 0.07450981, 1,
-0.4315272, 0.5136772, -0.7471944, 0, 1, 0.08235294, 1,
-0.4274691, -0.883728, -4.197158, 0, 1, 0.08627451, 1,
-0.4264339, -0.1637804, -0.1035463, 0, 1, 0.09411765, 1,
-0.4257935, -0.9332321, -1.167021, 0, 1, 0.1019608, 1,
-0.4237568, -0.2339922, -3.733113, 0, 1, 0.1058824, 1,
-0.4233097, 0.8373277, -1.03948, 0, 1, 0.1137255, 1,
-0.420848, -0.2228198, -3.212302, 0, 1, 0.1176471, 1,
-0.4073521, -1.594983, -1.980744, 0, 1, 0.1254902, 1,
-0.4033875, -0.3485134, -1.486026, 0, 1, 0.1294118, 1,
-0.4005258, 0.3424199, 0.01018924, 0, 1, 0.1372549, 1,
-0.3973217, 1.05584, 0.7231726, 0, 1, 0.1411765, 1,
-0.3962768, -0.3897653, -2.01198, 0, 1, 0.1490196, 1,
-0.3954024, -0.6401674, -2.096332, 0, 1, 0.1529412, 1,
-0.3948935, 1.546756, 0.6789764, 0, 1, 0.1607843, 1,
-0.3946932, -0.4150554, -1.798603, 0, 1, 0.1647059, 1,
-0.3887089, 0.02743074, -1.865876, 0, 1, 0.172549, 1,
-0.3865377, -1.582779, -4.89104, 0, 1, 0.1764706, 1,
-0.3855267, 0.382411, -1.268915, 0, 1, 0.1843137, 1,
-0.3854436, -0.5011321, -1.887373, 0, 1, 0.1882353, 1,
-0.3849022, 0.960505, -1.377852, 0, 1, 0.1960784, 1,
-0.3835862, 1.471191, -1.013594, 0, 1, 0.2039216, 1,
-0.3832753, 1.789767, 0.2566774, 0, 1, 0.2078431, 1,
-0.3785994, 1.24488, 0.3928902, 0, 1, 0.2156863, 1,
-0.3775201, -1.119399, -2.436363, 0, 1, 0.2196078, 1,
-0.3739577, 1.194526, -0.6612336, 0, 1, 0.227451, 1,
-0.3738995, 0.2232646, -2.349906, 0, 1, 0.2313726, 1,
-0.3707457, -0.6577291, -2.898697, 0, 1, 0.2392157, 1,
-0.3701409, 0.9814404, -0.2816722, 0, 1, 0.2431373, 1,
-0.3674277, 2.166934, -0.02965955, 0, 1, 0.2509804, 1,
-0.3669144, -0.602578, -4.071648, 0, 1, 0.254902, 1,
-0.3655308, 0.9162913, -1.297012, 0, 1, 0.2627451, 1,
-0.3623718, 0.9316561, -0.7908462, 0, 1, 0.2666667, 1,
-0.3596529, 0.5118897, -1.545514, 0, 1, 0.2745098, 1,
-0.3580803, -0.8527061, -1.768654, 0, 1, 0.2784314, 1,
-0.3554757, 0.3463917, -0.2075083, 0, 1, 0.2862745, 1,
-0.3527661, 0.2424147, -1.459718, 0, 1, 0.2901961, 1,
-0.3519302, -0.6748246, -2.022086, 0, 1, 0.2980392, 1,
-0.3460332, 1.218342, -1.493023, 0, 1, 0.3058824, 1,
-0.3423583, -0.7345616, -2.376704, 0, 1, 0.3098039, 1,
-0.3396491, 0.2422049, -1.596044, 0, 1, 0.3176471, 1,
-0.339472, -0.3745882, -2.54925, 0, 1, 0.3215686, 1,
-0.3361773, -0.4624556, -0.7368649, 0, 1, 0.3294118, 1,
-0.3330589, -0.0674745, -3.339791, 0, 1, 0.3333333, 1,
-0.3321502, 0.9677563, -0.1974805, 0, 1, 0.3411765, 1,
-0.3317759, -0.1259741, -1.346784, 0, 1, 0.345098, 1,
-0.3251358, 0.4295002, 0.2361286, 0, 1, 0.3529412, 1,
-0.3248561, 0.3589901, 0.5007851, 0, 1, 0.3568628, 1,
-0.3244494, 1.688527, -0.1271849, 0, 1, 0.3647059, 1,
-0.3213174, -0.4064396, -4.043309, 0, 1, 0.3686275, 1,
-0.3193892, -1.461129, -4.781311, 0, 1, 0.3764706, 1,
-0.3192798, -0.09167392, -1.992048, 0, 1, 0.3803922, 1,
-0.3156127, -0.07973139, -4.331335, 0, 1, 0.3882353, 1,
-0.3144338, 1.235477, 0.1366627, 0, 1, 0.3921569, 1,
-0.3085976, 1.363959, -1.127877, 0, 1, 0.4, 1,
-0.3064052, 0.5164424, 0.02132376, 0, 1, 0.4078431, 1,
-0.3051121, 1.141363, -0.9588456, 0, 1, 0.4117647, 1,
-0.304331, -0.5361224, -0.803188, 0, 1, 0.4196078, 1,
-0.302892, 0.03681357, -0.9923076, 0, 1, 0.4235294, 1,
-0.3022552, -0.6426675, -2.852684, 0, 1, 0.4313726, 1,
-0.3021809, 1.244194, -0.5222597, 0, 1, 0.4352941, 1,
-0.3010597, 0.8828706, -1.813664, 0, 1, 0.4431373, 1,
-0.3010101, 0.2141868, -2.745372, 0, 1, 0.4470588, 1,
-0.3005762, -0.390911, -1.851523, 0, 1, 0.454902, 1,
-0.2995951, 0.2437023, -0.9405655, 0, 1, 0.4588235, 1,
-0.2991852, -1.004052, -4.270657, 0, 1, 0.4666667, 1,
-0.2951059, 0.2054398, -0.8354604, 0, 1, 0.4705882, 1,
-0.294621, -0.9156801, -2.2315, 0, 1, 0.4784314, 1,
-0.2919736, 1.713047, 0.08383481, 0, 1, 0.4823529, 1,
-0.2891623, 0.6742649, -0.6624733, 0, 1, 0.4901961, 1,
-0.2856342, -1.040052, -2.983005, 0, 1, 0.4941176, 1,
-0.2838269, 0.3970428, -0.4820779, 0, 1, 0.5019608, 1,
-0.2830827, 0.05510012, -0.6907156, 0, 1, 0.509804, 1,
-0.2830547, -0.4279772, -3.265423, 0, 1, 0.5137255, 1,
-0.2830024, 0.1126035, -1.664973, 0, 1, 0.5215687, 1,
-0.2808726, -1.47065, -2.68929, 0, 1, 0.5254902, 1,
-0.2795512, 0.8035768, -1.793967, 0, 1, 0.5333334, 1,
-0.2787202, 0.6395599, -0.7235014, 0, 1, 0.5372549, 1,
-0.2743267, 0.7039869, 0.5194313, 0, 1, 0.5450981, 1,
-0.2734578, -0.7847658, -2.129528, 0, 1, 0.5490196, 1,
-0.2684644, 0.4953279, -0.1250015, 0, 1, 0.5568628, 1,
-0.2672765, 0.0550069, -0.6988947, 0, 1, 0.5607843, 1,
-0.2663177, 1.174051, -0.9973235, 0, 1, 0.5686275, 1,
-0.263952, -2.926453, -4.29705, 0, 1, 0.572549, 1,
-0.2612526, 0.3496513, -0.9041589, 0, 1, 0.5803922, 1,
-0.2611937, 1.57361, 0.8756036, 0, 1, 0.5843138, 1,
-0.2572549, -0.04256217, -2.936868, 0, 1, 0.5921569, 1,
-0.2571808, -0.2652003, -1.954991, 0, 1, 0.5960785, 1,
-0.2550576, -1.164725, -3.375227, 0, 1, 0.6039216, 1,
-0.2547885, 0.1004153, 0.328643, 0, 1, 0.6117647, 1,
-0.2529631, -1.968194, -4.967309, 0, 1, 0.6156863, 1,
-0.2516737, 0.78137, -0.404997, 0, 1, 0.6235294, 1,
-0.2515173, 0.7397261, -0.5700589, 0, 1, 0.627451, 1,
-0.248446, -0.9124197, -3.52873, 0, 1, 0.6352941, 1,
-0.2465893, -0.4603256, -2.002023, 0, 1, 0.6392157, 1,
-0.244265, -0.72059, -3.514603, 0, 1, 0.6470588, 1,
-0.2396903, 0.01243888, 0.2018512, 0, 1, 0.6509804, 1,
-0.2368378, -1.303551, -2.395854, 0, 1, 0.6588235, 1,
-0.2363706, 0.5595889, -0.1212106, 0, 1, 0.6627451, 1,
-0.2352559, 1.495494, -0.4324919, 0, 1, 0.6705883, 1,
-0.2321051, -0.2255581, -1.4217, 0, 1, 0.6745098, 1,
-0.2298706, -0.3677714, -0.9992115, 0, 1, 0.682353, 1,
-0.2220757, 0.2464898, -0.5433961, 0, 1, 0.6862745, 1,
-0.220898, -1.889022, -3.554133, 0, 1, 0.6941177, 1,
-0.2140529, 0.9354657, -0.3494662, 0, 1, 0.7019608, 1,
-0.2104818, -1.290219, -2.300108, 0, 1, 0.7058824, 1,
-0.2086225, 1.40861, 0.5498983, 0, 1, 0.7137255, 1,
-0.2076126, -0.6091965, -1.891092, 0, 1, 0.7176471, 1,
-0.2073033, -0.9143494, -3.013065, 0, 1, 0.7254902, 1,
-0.2051792, -1.174589, -2.94809, 0, 1, 0.7294118, 1,
-0.2041229, -0.06902834, -2.270494, 0, 1, 0.7372549, 1,
-0.1999773, 0.9250684, 0.8706586, 0, 1, 0.7411765, 1,
-0.1973788, -0.5505186, -1.530466, 0, 1, 0.7490196, 1,
-0.1881381, -0.8333383, -2.500983, 0, 1, 0.7529412, 1,
-0.1866015, 0.9452202, -0.1715422, 0, 1, 0.7607843, 1,
-0.184184, 1.716779, 0.2280289, 0, 1, 0.7647059, 1,
-0.1836667, 0.3014143, -0.3589812, 0, 1, 0.772549, 1,
-0.1827768, 0.8311602, -0.2295847, 0, 1, 0.7764706, 1,
-0.1818186, -1.47085, -2.596486, 0, 1, 0.7843137, 1,
-0.1813364, -0.608905, -1.834614, 0, 1, 0.7882353, 1,
-0.1785755, -0.6761758, -2.75882, 0, 1, 0.7960784, 1,
-0.175799, 0.3219665, -0.693645, 0, 1, 0.8039216, 1,
-0.1752062, -1.244522, -2.506292, 0, 1, 0.8078431, 1,
-0.172943, 0.6423823, -1.509839, 0, 1, 0.8156863, 1,
-0.1719602, 0.6694148, 2.013879, 0, 1, 0.8196079, 1,
-0.1674122, -0.8305398, -1.736159, 0, 1, 0.827451, 1,
-0.16653, 2.865359, -0.6047708, 0, 1, 0.8313726, 1,
-0.163449, -0.5212513, -1.211501, 0, 1, 0.8392157, 1,
-0.1632557, -0.2187917, -3.948357, 0, 1, 0.8431373, 1,
-0.1595687, -0.9438891, -3.72936, 0, 1, 0.8509804, 1,
-0.1515506, -1.521409, -3.191852, 0, 1, 0.854902, 1,
-0.145958, -0.9608161, -4.154059, 0, 1, 0.8627451, 1,
-0.1368394, 0.06606385, -1.118082, 0, 1, 0.8666667, 1,
-0.1361711, 0.7310283, -0.6158447, 0, 1, 0.8745098, 1,
-0.135744, 0.9445931, 0.2953996, 0, 1, 0.8784314, 1,
-0.1343531, -0.293727, -3.628598, 0, 1, 0.8862745, 1,
-0.1280223, -2.179615, -4.024377, 0, 1, 0.8901961, 1,
-0.1249901, -0.03606948, -2.818714, 0, 1, 0.8980392, 1,
-0.1201195, 0.466982, -1.593989, 0, 1, 0.9058824, 1,
-0.1192648, -0.5888046, -3.115323, 0, 1, 0.9098039, 1,
-0.1171337, -0.3769316, -2.59585, 0, 1, 0.9176471, 1,
-0.1095659, 0.1588327, 0.3451689, 0, 1, 0.9215686, 1,
-0.1011605, 0.6316394, 0.1853254, 0, 1, 0.9294118, 1,
-0.1001418, 0.4042194, 1.046847, 0, 1, 0.9333333, 1,
-0.09919253, -1.058834, -2.845975, 0, 1, 0.9411765, 1,
-0.09711494, 0.5556737, 0.5254275, 0, 1, 0.945098, 1,
-0.09462559, -0.001049584, -1.899398, 0, 1, 0.9529412, 1,
-0.09308878, -0.713343, -4.880224, 0, 1, 0.9568627, 1,
-0.08982795, 0.4235608, 1.742801, 0, 1, 0.9647059, 1,
-0.08619931, -0.725893, -3.659131, 0, 1, 0.9686275, 1,
-0.08277706, 0.430392, 1.715196, 0, 1, 0.9764706, 1,
-0.08143046, -0.0610928, -2.993556, 0, 1, 0.9803922, 1,
-0.08131029, -0.7424337, -2.564305, 0, 1, 0.9882353, 1,
-0.07959447, -0.6537305, -5.229355, 0, 1, 0.9921569, 1,
-0.07565235, 0.2939193, 0.1219781, 0, 1, 1, 1,
-0.07537216, -0.260789, -4.031498, 0, 0.9921569, 1, 1,
-0.07356429, 1.030891, -0.1392872, 0, 0.9882353, 1, 1,
-0.07263635, 0.2653846, 0.4205123, 0, 0.9803922, 1, 1,
-0.07152111, 1.746741, 2.288706, 0, 0.9764706, 1, 1,
-0.07109524, 1.148619, 2.876788, 0, 0.9686275, 1, 1,
-0.06773982, -0.4142237, -2.122716, 0, 0.9647059, 1, 1,
-0.06602955, -0.5820203, -2.960406, 0, 0.9568627, 1, 1,
-0.06489024, 3.197445, 1.525696, 0, 0.9529412, 1, 1,
-0.0624873, -0.09165121, -3.60532, 0, 0.945098, 1, 1,
-0.06040071, -0.9617758, -3.432633, 0, 0.9411765, 1, 1,
-0.05760233, 2.358165, -0.6282785, 0, 0.9333333, 1, 1,
-0.04065179, -0.5925136, -3.37054, 0, 0.9294118, 1, 1,
-0.03546338, 0.8548262, -0.3787686, 0, 0.9215686, 1, 1,
-0.03501696, 1.122277, -0.2511179, 0, 0.9176471, 1, 1,
-0.01628679, 0.5822402, -0.7421184, 0, 0.9098039, 1, 1,
-0.01294169, -0.2328956, -3.71299, 0, 0.9058824, 1, 1,
-0.01208817, 0.07031348, -1.74578, 0, 0.8980392, 1, 1,
-0.007697261, -0.5341063, -2.127781, 0, 0.8901961, 1, 1,
-0.007633696, 0.07922332, 0.7011153, 0, 0.8862745, 1, 1,
-0.006044024, 0.3901011, -1.841491, 0, 0.8784314, 1, 1,
-0.0008262799, 0.9929127, -1.419531, 0, 0.8745098, 1, 1,
0.009064483, 1.360175, 0.5781041, 0, 0.8666667, 1, 1,
0.009340426, 0.7090372, -0.5532137, 0, 0.8627451, 1, 1,
0.009862885, -0.5062124, 2.816917, 0, 0.854902, 1, 1,
0.01211145, 2.220638, 1.382628, 0, 0.8509804, 1, 1,
0.01323424, -0.3182201, 4.20547, 0, 0.8431373, 1, 1,
0.01443048, 1.357741, 1.074378, 0, 0.8392157, 1, 1,
0.01827051, -1.412855, 2.702098, 0, 0.8313726, 1, 1,
0.01976022, -1.536164, 2.742146, 0, 0.827451, 1, 1,
0.02273183, 1.339469, 1.118397, 0, 0.8196079, 1, 1,
0.02429885, -0.4534757, 2.129357, 0, 0.8156863, 1, 1,
0.02450218, 1.536496, -0.5656852, 0, 0.8078431, 1, 1,
0.03095234, -1.075083, 1.90107, 0, 0.8039216, 1, 1,
0.03318732, 0.4128424, -0.4989703, 0, 0.7960784, 1, 1,
0.03407848, -0.3684393, 2.592083, 0, 0.7882353, 1, 1,
0.03802212, 0.06369792, 0.515489, 0, 0.7843137, 1, 1,
0.0434716, 0.03693143, 1.027954, 0, 0.7764706, 1, 1,
0.04623897, 0.4207779, -1.627718, 0, 0.772549, 1, 1,
0.05174559, 1.052485, -0.3057299, 0, 0.7647059, 1, 1,
0.0544414, -0.5715267, 2.832677, 0, 0.7607843, 1, 1,
0.05689543, -0.7548715, 3.674271, 0, 0.7529412, 1, 1,
0.05815948, -0.384534, 2.083757, 0, 0.7490196, 1, 1,
0.06382749, -0.1113731, 3.512411, 0, 0.7411765, 1, 1,
0.0641648, -0.5914209, 3.253816, 0, 0.7372549, 1, 1,
0.06977967, -1.452207, 3.486412, 0, 0.7294118, 1, 1,
0.07188711, -0.06645719, 0.420607, 0, 0.7254902, 1, 1,
0.07263958, 0.1436357, 2.094954, 0, 0.7176471, 1, 1,
0.07391065, 1.501352, 1.517707, 0, 0.7137255, 1, 1,
0.07602965, 0.01456181, 0.1131177, 0, 0.7058824, 1, 1,
0.07906564, -0.6291224, 2.62543, 0, 0.6980392, 1, 1,
0.08259802, -0.4044053, 4.173723, 0, 0.6941177, 1, 1,
0.088728, -0.3270414, 2.886681, 0, 0.6862745, 1, 1,
0.09217366, -0.02081641, -0.0257017, 0, 0.682353, 1, 1,
0.09585071, -0.09161828, 2.540019, 0, 0.6745098, 1, 1,
0.0974846, -0.8056677, 0.5653862, 0, 0.6705883, 1, 1,
0.1017978, 0.1923807, 1.405009, 0, 0.6627451, 1, 1,
0.1019738, 1.465358, -0.8474178, 0, 0.6588235, 1, 1,
0.1037795, 0.5120325, 0.5732957, 0, 0.6509804, 1, 1,
0.1052556, -0.1735484, 3.625792, 0, 0.6470588, 1, 1,
0.1056677, 0.005931337, 0.6547878, 0, 0.6392157, 1, 1,
0.1069822, -0.1121096, 1.83608, 0, 0.6352941, 1, 1,
0.1112614, -0.6957809, 2.84702, 0, 0.627451, 1, 1,
0.1160084, 1.087881, 0.5761394, 0, 0.6235294, 1, 1,
0.1176244, -0.6746057, 4.48679, 0, 0.6156863, 1, 1,
0.1178639, -0.6070966, 4.432528, 0, 0.6117647, 1, 1,
0.119936, -0.1340473, 0.2905462, 0, 0.6039216, 1, 1,
0.1212061, -0.4043249, 3.219135, 0, 0.5960785, 1, 1,
0.1248418, -1.148277, 4.597537, 0, 0.5921569, 1, 1,
0.1300609, 0.3604453, 0.3588504, 0, 0.5843138, 1, 1,
0.1305235, -0.9062238, 3.619382, 0, 0.5803922, 1, 1,
0.1306544, 0.7167462, -1.585376, 0, 0.572549, 1, 1,
0.136062, 0.01730076, 2.072571, 0, 0.5686275, 1, 1,
0.1362172, 0.6596608, 1.214712, 0, 0.5607843, 1, 1,
0.1365133, -1.42575, 2.341321, 0, 0.5568628, 1, 1,
0.1370366, -1.070173, 4.726774, 0, 0.5490196, 1, 1,
0.1371729, 0.008843928, 0.7594728, 0, 0.5450981, 1, 1,
0.1394821, 2.5516, 0.09290257, 0, 0.5372549, 1, 1,
0.1440098, 0.05677434, 0.9034077, 0, 0.5333334, 1, 1,
0.1448905, 0.3871391, 0.7456719, 0, 0.5254902, 1, 1,
0.1459924, -1.36197, 3.822561, 0, 0.5215687, 1, 1,
0.1494315, -1.024362, 3.412881, 0, 0.5137255, 1, 1,
0.1506883, -1.404486, 4.566143, 0, 0.509804, 1, 1,
0.1522203, 1.412113, 0.01455192, 0, 0.5019608, 1, 1,
0.1524852, -0.1522848, 3.386463, 0, 0.4941176, 1, 1,
0.1567668, -0.7272986, 2.592129, 0, 0.4901961, 1, 1,
0.1587082, -1.234247, 3.393748, 0, 0.4823529, 1, 1,
0.1797899, 0.04949784, 1.052372, 0, 0.4784314, 1, 1,
0.179985, -1.669048, 1.964212, 0, 0.4705882, 1, 1,
0.1811887, -0.4403597, 4.343315, 0, 0.4666667, 1, 1,
0.1817202, -0.9331304, 2.941251, 0, 0.4588235, 1, 1,
0.1842079, 1.385474, -0.03534518, 0, 0.454902, 1, 1,
0.1860145, -0.4263981, 1.622161, 0, 0.4470588, 1, 1,
0.1865215, 0.1529018, 1.076327, 0, 0.4431373, 1, 1,
0.1923951, -0.1960549, 1.980919, 0, 0.4352941, 1, 1,
0.192987, -0.5951483, 1.890966, 0, 0.4313726, 1, 1,
0.1949917, -0.2549535, 1.986633, 0, 0.4235294, 1, 1,
0.1981288, 0.4025827, -0.5459113, 0, 0.4196078, 1, 1,
0.2011172, -1.200315, 2.399817, 0, 0.4117647, 1, 1,
0.2016234, -0.2059724, 2.104748, 0, 0.4078431, 1, 1,
0.2128386, 0.4981574, 1.663283, 0, 0.4, 1, 1,
0.2131875, 0.2641576, 1.021051, 0, 0.3921569, 1, 1,
0.2135476, 0.2340343, 1.741055, 0, 0.3882353, 1, 1,
0.2155114, 1.301075, -0.4865357, 0, 0.3803922, 1, 1,
0.2208049, -1.177712, 2.037865, 0, 0.3764706, 1, 1,
0.2233006, -0.7771411, 2.782112, 0, 0.3686275, 1, 1,
0.2275045, -0.2546103, 3.48976, 0, 0.3647059, 1, 1,
0.2315013, -1.69617, 3.038775, 0, 0.3568628, 1, 1,
0.2333626, -0.0894335, 1.139906, 0, 0.3529412, 1, 1,
0.2336954, -1.713155, 4.43995, 0, 0.345098, 1, 1,
0.2394652, 2.347303, -0.3780907, 0, 0.3411765, 1, 1,
0.2431035, 1.264691, 1.3633, 0, 0.3333333, 1, 1,
0.251821, 0.2538351, 0.8007141, 0, 0.3294118, 1, 1,
0.2556433, 1.047393, -0.4007384, 0, 0.3215686, 1, 1,
0.2573488, 0.7557725, -0.0001665429, 0, 0.3176471, 1, 1,
0.2656465, 0.2586615, 1.272444, 0, 0.3098039, 1, 1,
0.2662485, 0.0267663, 2.133482, 0, 0.3058824, 1, 1,
0.2665588, -0.4492891, 3.11946, 0, 0.2980392, 1, 1,
0.2667976, 0.5134535, 2.41267, 0, 0.2901961, 1, 1,
0.2718634, -1.11835, 1.534137, 0, 0.2862745, 1, 1,
0.2750881, 0.4904796, -0.1990948, 0, 0.2784314, 1, 1,
0.275445, -2.208574, 2.338743, 0, 0.2745098, 1, 1,
0.2791842, 0.2246205, -0.9273056, 0, 0.2666667, 1, 1,
0.2804687, 0.5681716, -0.4408291, 0, 0.2627451, 1, 1,
0.2817369, -0.2029712, 2.607503, 0, 0.254902, 1, 1,
0.2831689, 0.2705416, -1.733138, 0, 0.2509804, 1, 1,
0.2853273, -0.2757491, 3.783334, 0, 0.2431373, 1, 1,
0.2859796, -1.227604, 2.887981, 0, 0.2392157, 1, 1,
0.2872994, 0.4383326, -0.2676877, 0, 0.2313726, 1, 1,
0.2904029, 0.2814434, 1.732288, 0, 0.227451, 1, 1,
0.2982428, 0.1585359, 0.2290549, 0, 0.2196078, 1, 1,
0.3029177, -0.6302757, 1.880777, 0, 0.2156863, 1, 1,
0.303331, -0.8704586, 4.749336, 0, 0.2078431, 1, 1,
0.3043847, -0.6633551, 3.574987, 0, 0.2039216, 1, 1,
0.3047199, 0.4667109, -1.729162, 0, 0.1960784, 1, 1,
0.3069507, 0.6338821, -0.3717598, 0, 0.1882353, 1, 1,
0.3109227, 0.4243079, -0.7710811, 0, 0.1843137, 1, 1,
0.3121067, 0.2239363, -1.133842, 0, 0.1764706, 1, 1,
0.3215546, 0.2479938, 0.9309559, 0, 0.172549, 1, 1,
0.3226644, -0.06667472, 3.757594, 0, 0.1647059, 1, 1,
0.3234621, -0.6337981, 4.665431, 0, 0.1607843, 1, 1,
0.3242214, 0.4010786, -0.4850869, 0, 0.1529412, 1, 1,
0.3248741, -0.9303372, 4.545625, 0, 0.1490196, 1, 1,
0.3288163, -0.6240788, 2.858424, 0, 0.1411765, 1, 1,
0.3349855, 1.389933, 1.295446, 0, 0.1372549, 1, 1,
0.3436154, 0.1637338, 1.26149, 0, 0.1294118, 1, 1,
0.3599494, 0.450899, 0.4212894, 0, 0.1254902, 1, 1,
0.3608177, 0.2271508, 3.017725, 0, 0.1176471, 1, 1,
0.3663351, -0.6888664, 2.171564, 0, 0.1137255, 1, 1,
0.3733987, -0.8266381, 1.390038, 0, 0.1058824, 1, 1,
0.373462, -0.6737715, 2.149705, 0, 0.09803922, 1, 1,
0.3742506, -0.6148017, 4.571593, 0, 0.09411765, 1, 1,
0.3749624, 0.8551702, -0.5406977, 0, 0.08627451, 1, 1,
0.3759054, -0.2561243, 2.806685, 0, 0.08235294, 1, 1,
0.3770633, -0.1044782, 3.071136, 0, 0.07450981, 1, 1,
0.3787515, -0.1782331, 2.357176, 0, 0.07058824, 1, 1,
0.3790197, 0.5198244, -0.1402785, 0, 0.0627451, 1, 1,
0.3799761, 0.414783, 1.493922, 0, 0.05882353, 1, 1,
0.3852557, 0.7827889, 2.23622, 0, 0.05098039, 1, 1,
0.386022, 1.106371, 0.3038878, 0, 0.04705882, 1, 1,
0.3904133, -0.2774761, 2.739837, 0, 0.03921569, 1, 1,
0.3929245, 1.70705, 0.8743299, 0, 0.03529412, 1, 1,
0.3949924, 0.374689, -0.562614, 0, 0.02745098, 1, 1,
0.3971174, -0.4210218, 3.431772, 0, 0.02352941, 1, 1,
0.4012648, -0.8883834, 3.195905, 0, 0.01568628, 1, 1,
0.4013529, 0.8236213, 0.2874018, 0, 0.01176471, 1, 1,
0.4125391, 0.1084025, 0.5105789, 0, 0.003921569, 1, 1,
0.4152625, -0.4202341, 2.054687, 0.003921569, 0, 1, 1,
0.4159122, -0.01590822, 1.854964, 0.007843138, 0, 1, 1,
0.4259971, 0.5124168, 0.7618544, 0.01568628, 0, 1, 1,
0.428433, -1.087172, 2.133269, 0.01960784, 0, 1, 1,
0.4318016, -0.2391672, 2.838956, 0.02745098, 0, 1, 1,
0.4514647, -2.78155, 3.192802, 0.03137255, 0, 1, 1,
0.4539887, -0.3642912, 1.964875, 0.03921569, 0, 1, 1,
0.455062, 0.1619015, 0.1661375, 0.04313726, 0, 1, 1,
0.4578865, -0.697925, 3.622039, 0.05098039, 0, 1, 1,
0.4581722, 0.8858627, 0.2077265, 0.05490196, 0, 1, 1,
0.4597594, -0.7027331, 4.098549, 0.0627451, 0, 1, 1,
0.4623349, 0.4979194, 3.643998, 0.06666667, 0, 1, 1,
0.464165, 0.786877, -0.1156505, 0.07450981, 0, 1, 1,
0.4713291, -0.5038472, 1.522914, 0.07843138, 0, 1, 1,
0.4728201, -1.836727, 2.116453, 0.08627451, 0, 1, 1,
0.4806767, -0.6337674, 2.486464, 0.09019608, 0, 1, 1,
0.4834811, -0.6656626, 2.669255, 0.09803922, 0, 1, 1,
0.4840336, 0.5040555, 1.03967, 0.1058824, 0, 1, 1,
0.4873308, -0.6550484, 2.031522, 0.1098039, 0, 1, 1,
0.4884381, 0.2734668, 1.135157, 0.1176471, 0, 1, 1,
0.4912156, 0.7783439, 0.5891969, 0.1215686, 0, 1, 1,
0.4919744, 0.1335381, 0.6959753, 0.1294118, 0, 1, 1,
0.4921192, 0.8621867, 0.1441906, 0.1333333, 0, 1, 1,
0.4922675, -0.8714496, 3.042658, 0.1411765, 0, 1, 1,
0.4972247, -0.3954614, 2.191324, 0.145098, 0, 1, 1,
0.5063866, 0.1952181, 0.7694155, 0.1529412, 0, 1, 1,
0.5080094, -0.2729926, 1.909598, 0.1568628, 0, 1, 1,
0.5154386, -1.515267, 2.639273, 0.1647059, 0, 1, 1,
0.5192522, -0.9127634, 3.66031, 0.1686275, 0, 1, 1,
0.5195335, 1.60406, 0.7902024, 0.1764706, 0, 1, 1,
0.5306039, 0.9091375, 0.7980185, 0.1803922, 0, 1, 1,
0.5311372, -0.2487557, 2.534766, 0.1882353, 0, 1, 1,
0.5330189, -0.4740397, 3.636727, 0.1921569, 0, 1, 1,
0.5339336, 0.4842514, 1.524979, 0.2, 0, 1, 1,
0.5363162, -0.5484729, 3.318915, 0.2078431, 0, 1, 1,
0.5374768, -0.8709809, 2.027187, 0.2117647, 0, 1, 1,
0.5388212, 2.298279, -0.9849014, 0.2196078, 0, 1, 1,
0.5423034, -0.2071867, 1.037246, 0.2235294, 0, 1, 1,
0.5435648, -0.7647518, 2.909292, 0.2313726, 0, 1, 1,
0.5501491, 1.064019, 0.9398408, 0.2352941, 0, 1, 1,
0.5504767, -2.565172, 2.525119, 0.2431373, 0, 1, 1,
0.5520326, 0.07775176, -0.2904581, 0.2470588, 0, 1, 1,
0.5530321, -1.818313, 5.540703, 0.254902, 0, 1, 1,
0.5572459, 0.2971767, 0.816582, 0.2588235, 0, 1, 1,
0.5589625, -1.661121, 4.711437, 0.2666667, 0, 1, 1,
0.5630379, 1.330739, -1.606606, 0.2705882, 0, 1, 1,
0.5644236, -0.2649412, 1.196633, 0.2784314, 0, 1, 1,
0.5655022, -1.932994, 3.354021, 0.282353, 0, 1, 1,
0.5673187, -0.09562093, 1.159586, 0.2901961, 0, 1, 1,
0.5740263, 0.05964707, 1.450685, 0.2941177, 0, 1, 1,
0.5757399, 0.8605453, -0.3102925, 0.3019608, 0, 1, 1,
0.5812495, 0.06768053, 1.720766, 0.3098039, 0, 1, 1,
0.5821939, -0.3290551, 1.250887, 0.3137255, 0, 1, 1,
0.5857924, -1.333692, 3.337564, 0.3215686, 0, 1, 1,
0.5861102, 0.6195109, 1.166827, 0.3254902, 0, 1, 1,
0.5865523, -1.363248, 2.782331, 0.3333333, 0, 1, 1,
0.5874843, 1.92697, 0.1165932, 0.3372549, 0, 1, 1,
0.5938822, 0.05407264, 1.829462, 0.345098, 0, 1, 1,
0.5989348, 0.05177673, 1.681555, 0.3490196, 0, 1, 1,
0.603912, -0.0835209, 3.172765, 0.3568628, 0, 1, 1,
0.6120036, 0.4563203, 0.02406173, 0.3607843, 0, 1, 1,
0.6182637, 0.06729926, 2.103144, 0.3686275, 0, 1, 1,
0.6190867, 0.2416984, 0.4025565, 0.372549, 0, 1, 1,
0.6268594, 2.190263, 0.2788369, 0.3803922, 0, 1, 1,
0.638679, 0.3983043, 2.537583, 0.3843137, 0, 1, 1,
0.6397041, 0.3488089, 0.4919356, 0.3921569, 0, 1, 1,
0.6397911, -1.036918, 0.6492701, 0.3960784, 0, 1, 1,
0.6400332, -1.630156, 2.557599, 0.4039216, 0, 1, 1,
0.6415277, 0.5357271, -0.2771339, 0.4117647, 0, 1, 1,
0.6443631, 0.4100306, 1.68855, 0.4156863, 0, 1, 1,
0.6478035, 1.315603, 0.3959957, 0.4235294, 0, 1, 1,
0.648309, 0.7454591, 2.482055, 0.427451, 0, 1, 1,
0.6550449, 2.742158, 0.7038414, 0.4352941, 0, 1, 1,
0.6561426, 0.5555745, 0.4426557, 0.4392157, 0, 1, 1,
0.6591628, 0.323715, 0.8889725, 0.4470588, 0, 1, 1,
0.6593843, 0.1553196, 2.233929, 0.4509804, 0, 1, 1,
0.6620432, -0.070914, 0.3315019, 0.4588235, 0, 1, 1,
0.6651216, 0.3286448, 1.400928, 0.4627451, 0, 1, 1,
0.6703098, 1.886915, 0.980125, 0.4705882, 0, 1, 1,
0.6783435, 0.4479797, -0.4435513, 0.4745098, 0, 1, 1,
0.6793799, -0.1780707, 1.732427, 0.4823529, 0, 1, 1,
0.6893402, 1.577394, 1.177058, 0.4862745, 0, 1, 1,
0.6915681, -0.6937958, 1.674187, 0.4941176, 0, 1, 1,
0.6972495, -1.415243, 3.477744, 0.5019608, 0, 1, 1,
0.6989275, -0.7269308, 2.691921, 0.5058824, 0, 1, 1,
0.7093748, 0.2553722, -0.4901773, 0.5137255, 0, 1, 1,
0.7107427, -0.2640491, 1.383206, 0.5176471, 0, 1, 1,
0.7107547, -1.631017, 3.157985, 0.5254902, 0, 1, 1,
0.7117592, -1.031938, 2.493952, 0.5294118, 0, 1, 1,
0.7187488, -1.248059, 4.44192, 0.5372549, 0, 1, 1,
0.7246162, 0.02650768, 1.220977, 0.5411765, 0, 1, 1,
0.7273947, -0.795055, 2.68545, 0.5490196, 0, 1, 1,
0.7306412, -0.2331984, 1.712884, 0.5529412, 0, 1, 1,
0.7337717, -1.694544, 2.786146, 0.5607843, 0, 1, 1,
0.7355053, -0.3224787, 0.5333076, 0.5647059, 0, 1, 1,
0.7410116, -0.198782, 1.644464, 0.572549, 0, 1, 1,
0.75441, -0.2655364, 3.744303, 0.5764706, 0, 1, 1,
0.7559216, -0.7339592, 3.15708, 0.5843138, 0, 1, 1,
0.7663268, -0.2759515, 2.844468, 0.5882353, 0, 1, 1,
0.7670666, -0.1826719, 1.883699, 0.5960785, 0, 1, 1,
0.7712521, -0.3957945, 1.090539, 0.6039216, 0, 1, 1,
0.7738659, -1.096844, 3.984643, 0.6078432, 0, 1, 1,
0.7745822, -1.455563, 3.193917, 0.6156863, 0, 1, 1,
0.7746971, -0.8928996, 0.4247467, 0.6196079, 0, 1, 1,
0.77705, 0.904009, 0.868606, 0.627451, 0, 1, 1,
0.7829241, -0.1951741, 1.970232, 0.6313726, 0, 1, 1,
0.7862997, 0.5295603, 1.02108, 0.6392157, 0, 1, 1,
0.7900022, 1.823229, 1.041753, 0.6431373, 0, 1, 1,
0.7916479, -1.334831, 2.975487, 0.6509804, 0, 1, 1,
0.7971508, -0.4839311, 1.276937, 0.654902, 0, 1, 1,
0.8048179, 0.1451379, 1.326783, 0.6627451, 0, 1, 1,
0.8108185, -0.4531089, 3.252663, 0.6666667, 0, 1, 1,
0.811505, 1.134584, 1.297462, 0.6745098, 0, 1, 1,
0.8148127, -0.3499396, 2.879307, 0.6784314, 0, 1, 1,
0.8296285, -0.952942, 3.636305, 0.6862745, 0, 1, 1,
0.8347428, 0.7271032, -1.278225, 0.6901961, 0, 1, 1,
0.8364398, -0.4577718, 3.345762, 0.6980392, 0, 1, 1,
0.8375947, 0.2660729, 2.137031, 0.7058824, 0, 1, 1,
0.8384629, 0.9142722, 1.216215, 0.7098039, 0, 1, 1,
0.8387823, 2.817773, -1.160556, 0.7176471, 0, 1, 1,
0.8391575, 0.3953883, 3.121393, 0.7215686, 0, 1, 1,
0.8458067, 0.2244373, 1.435544, 0.7294118, 0, 1, 1,
0.8467365, -0.1780109, 2.153691, 0.7333333, 0, 1, 1,
0.8543978, -0.9043468, 2.002422, 0.7411765, 0, 1, 1,
0.8547227, -0.3133818, 1.563408, 0.7450981, 0, 1, 1,
0.8564305, 1.128799, 2.06117, 0.7529412, 0, 1, 1,
0.8657045, 1.886987, 0.8799407, 0.7568628, 0, 1, 1,
0.8659135, -0.939189, 2.915006, 0.7647059, 0, 1, 1,
0.8669856, -1.882518, 4.319401, 0.7686275, 0, 1, 1,
0.8670583, -0.1515683, -0.3438464, 0.7764706, 0, 1, 1,
0.874953, -0.9149957, 3.813194, 0.7803922, 0, 1, 1,
0.8813174, 0.516121, 0.7422543, 0.7882353, 0, 1, 1,
0.8818108, 1.522291, 0.2230403, 0.7921569, 0, 1, 1,
0.890176, 1.169725, 0.3112553, 0.8, 0, 1, 1,
0.8911793, -1.917655, 2.656787, 0.8078431, 0, 1, 1,
0.8960804, -0.05433284, 1.98185, 0.8117647, 0, 1, 1,
0.896757, 1.284229, 0.9023647, 0.8196079, 0, 1, 1,
0.8977181, 0.1074852, 0.5735589, 0.8235294, 0, 1, 1,
0.8983287, -0.003285432, 3.106374, 0.8313726, 0, 1, 1,
0.9001814, 1.169474, 1.690137, 0.8352941, 0, 1, 1,
0.904914, -0.3853172, 0.6113759, 0.8431373, 0, 1, 1,
0.9112579, -0.634784, 1.985418, 0.8470588, 0, 1, 1,
0.9127055, -0.7167012, 2.964562, 0.854902, 0, 1, 1,
0.9131317, 1.464155, -0.8608449, 0.8588235, 0, 1, 1,
0.9145426, 1.36074, 0.9987751, 0.8666667, 0, 1, 1,
0.9150659, 0.4260882, -0.1769966, 0.8705882, 0, 1, 1,
0.9203713, -0.9685296, 1.956958, 0.8784314, 0, 1, 1,
0.926714, -0.1487075, 3.137199, 0.8823529, 0, 1, 1,
0.9324261, -2.832255, 3.269969, 0.8901961, 0, 1, 1,
0.9327542, -0.8142247, 2.753048, 0.8941177, 0, 1, 1,
0.938757, 0.5926616, 1.444805, 0.9019608, 0, 1, 1,
0.9509618, 0.3219444, 0.01774302, 0.9098039, 0, 1, 1,
0.9554477, -1.176479, 3.519828, 0.9137255, 0, 1, 1,
0.9567188, -0.2149073, 1.413136, 0.9215686, 0, 1, 1,
0.963037, -0.1151309, 3.562276, 0.9254902, 0, 1, 1,
0.9680821, 1.676288, 1.222325, 0.9333333, 0, 1, 1,
0.9727052, 0.5103517, 0.9953266, 0.9372549, 0, 1, 1,
0.9745886, -0.5593249, 1.872459, 0.945098, 0, 1, 1,
0.9790649, -0.2656018, 2.488632, 0.9490196, 0, 1, 1,
0.9860461, -0.4473281, 2.132926, 0.9568627, 0, 1, 1,
0.9875308, -0.6046575, 2.765065, 0.9607843, 0, 1, 1,
0.9904731, -1.355947, 2.999141, 0.9686275, 0, 1, 1,
0.9945962, -0.1298791, 0.6240082, 0.972549, 0, 1, 1,
0.9947358, -1.918512, 3.744484, 0.9803922, 0, 1, 1,
0.995242, -0.04799217, 1.977665, 0.9843137, 0, 1, 1,
0.9974743, -0.3689693, 0.2867694, 0.9921569, 0, 1, 1,
1.004885, 0.3112772, 0.670503, 0.9960784, 0, 1, 1,
1.005395, -1.355358, 1.734623, 1, 0, 0.9960784, 1,
1.01108, 1.076742, 0.2354733, 1, 0, 0.9882353, 1,
1.012346, -0.9513978, 2.293286, 1, 0, 0.9843137, 1,
1.017224, 1.412107, -0.3613792, 1, 0, 0.9764706, 1,
1.01953, -1.00482, 2.912953, 1, 0, 0.972549, 1,
1.027075, 0.9126065, 0.9726697, 1, 0, 0.9647059, 1,
1.027226, -0.4347329, 1.183944, 1, 0, 0.9607843, 1,
1.028722, -0.9768709, 3.060664, 1, 0, 0.9529412, 1,
1.030529, 0.1642186, 1.707383, 1, 0, 0.9490196, 1,
1.045009, 0.8979875, 1.298557, 1, 0, 0.9411765, 1,
1.046685, 0.5739049, 1.016069, 1, 0, 0.9372549, 1,
1.05124, 1.060192, 0.4918757, 1, 0, 0.9294118, 1,
1.052505, 0.3227071, 2.209529, 1, 0, 0.9254902, 1,
1.05698, -0.1587562, 1.585992, 1, 0, 0.9176471, 1,
1.057797, -0.4785087, 1.757346, 1, 0, 0.9137255, 1,
1.062966, -0.5322362, 2.134259, 1, 0, 0.9058824, 1,
1.073147, -0.4300173, 2.597437, 1, 0, 0.9019608, 1,
1.078784, -0.137582, 1.770283, 1, 0, 0.8941177, 1,
1.080567, 1.406942, -0.7153605, 1, 0, 0.8862745, 1,
1.082223, 0.2606035, 1.67641, 1, 0, 0.8823529, 1,
1.085568, 0.3021549, 0.7021754, 1, 0, 0.8745098, 1,
1.088414, 0.264948, 1.685744, 1, 0, 0.8705882, 1,
1.102605, -0.6305582, 2.399217, 1, 0, 0.8627451, 1,
1.110173, -0.4841241, 3.064746, 1, 0, 0.8588235, 1,
1.115327, -0.1439469, 0.4396999, 1, 0, 0.8509804, 1,
1.115903, -1.096926, 2.125538, 1, 0, 0.8470588, 1,
1.131834, 0.5240176, 1.572464, 1, 0, 0.8392157, 1,
1.134298, -0.5309561, 2.00296, 1, 0, 0.8352941, 1,
1.139986, -0.3033095, 1.47981, 1, 0, 0.827451, 1,
1.141427, -1.329787, 0.8667026, 1, 0, 0.8235294, 1,
1.144047, 1.242085, 1.001458, 1, 0, 0.8156863, 1,
1.145632, 0.06228063, 0.05458199, 1, 0, 0.8117647, 1,
1.146711, -0.7324787, 1.666707, 1, 0, 0.8039216, 1,
1.14749, 0.6553869, 2.387242, 1, 0, 0.7960784, 1,
1.156296, -0.8004181, 3.924188, 1, 0, 0.7921569, 1,
1.158099, -1.372635, 2.569415, 1, 0, 0.7843137, 1,
1.158638, 0.4741295, -0.1006216, 1, 0, 0.7803922, 1,
1.161554, 0.08984839, 2.240508, 1, 0, 0.772549, 1,
1.163156, -0.5746875, 3.823744, 1, 0, 0.7686275, 1,
1.173845, 0.8663597, 2.64208, 1, 0, 0.7607843, 1,
1.179141, -2.288372, 3.471346, 1, 0, 0.7568628, 1,
1.183932, -0.1864071, 2.479121, 1, 0, 0.7490196, 1,
1.185844, 2.183277, 0.01346277, 1, 0, 0.7450981, 1,
1.186035, -0.8071839, 2.648046, 1, 0, 0.7372549, 1,
1.190318, 1.372006, 0.601498, 1, 0, 0.7333333, 1,
1.197074, -0.343922, 3.140203, 1, 0, 0.7254902, 1,
1.199677, 1.193859, 4.31337, 1, 0, 0.7215686, 1,
1.204482, -1.311309, 2.803947, 1, 0, 0.7137255, 1,
1.204701, 0.1952363, 1.034458, 1, 0, 0.7098039, 1,
1.225581, -0.7298713, 0.392886, 1, 0, 0.7019608, 1,
1.226385, 1.152255, 0.7899035, 1, 0, 0.6941177, 1,
1.226579, -0.6257529, 2.775855, 1, 0, 0.6901961, 1,
1.228697, -0.295783, 1.626124, 1, 0, 0.682353, 1,
1.228769, 0.2588531, 1.923924, 1, 0, 0.6784314, 1,
1.232374, -0.7022941, 0.7695627, 1, 0, 0.6705883, 1,
1.245615, 0.258059, 1.665401, 1, 0, 0.6666667, 1,
1.257494, -1.104341, 1.649614, 1, 0, 0.6588235, 1,
1.267657, -0.6685419, 0.8635042, 1, 0, 0.654902, 1,
1.270182, 1.265059, 1.728414, 1, 0, 0.6470588, 1,
1.273642, 1.672933, 1.532629, 1, 0, 0.6431373, 1,
1.276108, 0.05467646, 1.254967, 1, 0, 0.6352941, 1,
1.285207, -1.480025, 3.567691, 1, 0, 0.6313726, 1,
1.288037, 1.071645, 1.3658, 1, 0, 0.6235294, 1,
1.288073, 0.4039009, 0.162505, 1, 0, 0.6196079, 1,
1.300003, -1.272029, 2.394912, 1, 0, 0.6117647, 1,
1.306018, 0.1259393, 0.4369623, 1, 0, 0.6078432, 1,
1.310611, 0.04973897, 0.8197423, 1, 0, 0.6, 1,
1.315885, 2.530146, 1.486412, 1, 0, 0.5921569, 1,
1.316287, -1.855235, 1.368086, 1, 0, 0.5882353, 1,
1.318704, -0.2889709, 1.304206, 1, 0, 0.5803922, 1,
1.322196, -0.1150893, 0.6710661, 1, 0, 0.5764706, 1,
1.33108, -1.575102, 2.285972, 1, 0, 0.5686275, 1,
1.337352, 1.164055, 1.86221, 1, 0, 0.5647059, 1,
1.338496, 0.6796068, 0.7561094, 1, 0, 0.5568628, 1,
1.346066, -0.1718013, 1.328497, 1, 0, 0.5529412, 1,
1.368903, 0.3212461, 0.8480158, 1, 0, 0.5450981, 1,
1.375791, 0.1999207, 1.518116, 1, 0, 0.5411765, 1,
1.377262, 0.6873499, 1.524528, 1, 0, 0.5333334, 1,
1.379526, -0.1547731, 1.89022, 1, 0, 0.5294118, 1,
1.382088, -0.480536, 0.825155, 1, 0, 0.5215687, 1,
1.386267, 0.01798716, 3.910833, 1, 0, 0.5176471, 1,
1.400676, 0.2334948, 2.125941, 1, 0, 0.509804, 1,
1.401964, -0.4840934, 1.863666, 1, 0, 0.5058824, 1,
1.414041, -0.1730692, 1.302739, 1, 0, 0.4980392, 1,
1.417949, -2.42744, 4.660626, 1, 0, 0.4901961, 1,
1.423275, -1.599668, 3.18582, 1, 0, 0.4862745, 1,
1.423744, 2.01038, -1.64178, 1, 0, 0.4784314, 1,
1.441036, 1.425492, 1.076826, 1, 0, 0.4745098, 1,
1.447859, 1.331392, 0.6298794, 1, 0, 0.4666667, 1,
1.449275, 1.807998, 0.5689443, 1, 0, 0.4627451, 1,
1.454968, -0.9419201, 2.970427, 1, 0, 0.454902, 1,
1.457721, -0.03906118, 1.547185, 1, 0, 0.4509804, 1,
1.458111, -2.407085, 3.128908, 1, 0, 0.4431373, 1,
1.460157, -0.1675395, 1.357668, 1, 0, 0.4392157, 1,
1.471952, 0.8621309, 1.045636, 1, 0, 0.4313726, 1,
1.481776, -0.2083501, 0.6734452, 1, 0, 0.427451, 1,
1.503401, -1.284463, 2.058281, 1, 0, 0.4196078, 1,
1.511331, 2.20377, 2.087662, 1, 0, 0.4156863, 1,
1.513397, 0.2361494, 2.331458, 1, 0, 0.4078431, 1,
1.53072, -0.9380589, 2.861927, 1, 0, 0.4039216, 1,
1.531795, -0.2913442, 2.294127, 1, 0, 0.3960784, 1,
1.53274, 1.144651, 0.1799797, 1, 0, 0.3882353, 1,
1.533614, 0.391541, 1.536826, 1, 0, 0.3843137, 1,
1.548523, -1.340062, 2.26421, 1, 0, 0.3764706, 1,
1.555144, -1.988054, 1.751029, 1, 0, 0.372549, 1,
1.555908, -0.6287184, 1.380301, 1, 0, 0.3647059, 1,
1.557328, 0.5591151, 0.7554959, 1, 0, 0.3607843, 1,
1.564787, 0.1137201, 0.909211, 1, 0, 0.3529412, 1,
1.566935, -0.1326389, 1.879202, 1, 0, 0.3490196, 1,
1.569002, -1.767729, 1.714949, 1, 0, 0.3411765, 1,
1.573956, -0.06559326, -0.3139107, 1, 0, 0.3372549, 1,
1.575882, -1.73271, 2.928734, 1, 0, 0.3294118, 1,
1.597506, -1.43887, 1.701865, 1, 0, 0.3254902, 1,
1.597884, -0.3253714, 1.402015, 1, 0, 0.3176471, 1,
1.598745, 0.9731051, 0.6619985, 1, 0, 0.3137255, 1,
1.602358, 0.4033404, 0.1458687, 1, 0, 0.3058824, 1,
1.606041, 0.7547939, 0.585515, 1, 0, 0.2980392, 1,
1.610666, 0.159181, 1.338065, 1, 0, 0.2941177, 1,
1.622069, -0.4164445, 0.8113457, 1, 0, 0.2862745, 1,
1.624229, -1.17532, 0.8730895, 1, 0, 0.282353, 1,
1.648759, -1.4387, 1.645519, 1, 0, 0.2745098, 1,
1.64882, 1.16025, 1.64558, 1, 0, 0.2705882, 1,
1.657551, 0.7025821, 0.3687145, 1, 0, 0.2627451, 1,
1.659823, -1.021544, 0.9370497, 1, 0, 0.2588235, 1,
1.677931, -2.08387, 1.993185, 1, 0, 0.2509804, 1,
1.688237, 1.496642, 1.211294, 1, 0, 0.2470588, 1,
1.697888, 0.05339575, 1.724895, 1, 0, 0.2392157, 1,
1.698578, -0.7687106, 2.474315, 1, 0, 0.2352941, 1,
1.69911, -1.19605, 1.178131, 1, 0, 0.227451, 1,
1.703537, -1.260747, 2.892813, 1, 0, 0.2235294, 1,
1.706635, -1.011661, 2.362199, 1, 0, 0.2156863, 1,
1.714496, -0.2527814, 1.361898, 1, 0, 0.2117647, 1,
1.72848, -0.2668001, 2.080244, 1, 0, 0.2039216, 1,
1.757713, 1.019146, 1.540396, 1, 0, 0.1960784, 1,
1.767673, 1.874396, 0.1253481, 1, 0, 0.1921569, 1,
1.775498, -0.1047625, 2.463845, 1, 0, 0.1843137, 1,
1.776507, -2.164257, 2.787448, 1, 0, 0.1803922, 1,
1.779421, -0.2979605, 2.253833, 1, 0, 0.172549, 1,
1.796816, -0.221008, 0.4306197, 1, 0, 0.1686275, 1,
1.834683, 0.01865806, 1.591107, 1, 0, 0.1607843, 1,
1.87407, -1.070929, 4.510071, 1, 0, 0.1568628, 1,
1.881095, 1.725759, 0.1127018, 1, 0, 0.1490196, 1,
1.895398, -0.7369989, 3.976223, 1, 0, 0.145098, 1,
1.918654, 1.508242, 0.6514497, 1, 0, 0.1372549, 1,
1.94232, -1.02905, 2.460135, 1, 0, 0.1333333, 1,
1.943814, 0.6239775, 0.3762359, 1, 0, 0.1254902, 1,
1.958936, -1.127288, 0.7293317, 1, 0, 0.1215686, 1,
1.99818, 1.485487, 0.6647786, 1, 0, 0.1137255, 1,
2.050722, 0.7042834, 3.442399, 1, 0, 0.1098039, 1,
2.067486, -1.061321, 2.328634, 1, 0, 0.1019608, 1,
2.157977, -0.4080928, 3.494416, 1, 0, 0.09411765, 1,
2.18337, -1.557879, 0.5933121, 1, 0, 0.09019608, 1,
2.1905, 0.3322898, -1.363517, 1, 0, 0.08235294, 1,
2.250419, -0.5157503, 2.883565, 1, 0, 0.07843138, 1,
2.260249, -0.5430294, -0.03914813, 1, 0, 0.07058824, 1,
2.270582, -1.176966, 3.307463, 1, 0, 0.06666667, 1,
2.28049, -0.5833929, 1.990059, 1, 0, 0.05882353, 1,
2.295507, 0.1961694, 2.130409, 1, 0, 0.05490196, 1,
2.31299, 2.158586, 1.500584, 1, 0, 0.04705882, 1,
2.370539, -0.6189378, 0.446778, 1, 0, 0.04313726, 1,
2.383486, 0.17065, 0.3467324, 1, 0, 0.03529412, 1,
2.389092, 0.3397687, 1.15086, 1, 0, 0.03137255, 1,
2.407274, 0.6186179, 1.993096, 1, 0, 0.02352941, 1,
2.558762, -0.1052106, 2.690603, 1, 0, 0.01960784, 1,
2.636208, -0.7174278, 1.135566, 1, 0, 0.01176471, 1,
2.905566, -1.471823, 1.323343, 1, 0, 0.007843138, 1
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
-0.1863843, -4.660862, -7.05488, 0, -0.5, 0.5, 0.5,
-0.1863843, -4.660862, -7.05488, 1, -0.5, 0.5, 0.5,
-0.1863843, -4.660862, -7.05488, 1, 1.5, 0.5, 0.5,
-0.1863843, -4.660862, -7.05488, 0, 1.5, 0.5, 0.5
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
-4.326506, -0.1622419, -7.05488, 0, -0.5, 0.5, 0.5,
-4.326506, -0.1622419, -7.05488, 1, -0.5, 0.5, 0.5,
-4.326506, -0.1622419, -7.05488, 1, 1.5, 0.5, 0.5,
-4.326506, -0.1622419, -7.05488, 0, 1.5, 0.5, 0.5
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
-4.326506, -4.660862, 0.155674, 0, -0.5, 0.5, 0.5,
-4.326506, -4.660862, 0.155674, 1, -0.5, 0.5, 0.5,
-4.326506, -4.660862, 0.155674, 1, 1.5, 0.5, 0.5,
-4.326506, -4.660862, 0.155674, 0, 1.5, 0.5, 0.5
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
-3, -3.622719, -5.390906,
2, -3.622719, -5.390906,
-3, -3.622719, -5.390906,
-3, -3.795743, -5.668235,
-2, -3.622719, -5.390906,
-2, -3.795743, -5.668235,
-1, -3.622719, -5.390906,
-1, -3.795743, -5.668235,
0, -3.622719, -5.390906,
0, -3.795743, -5.668235,
1, -3.622719, -5.390906,
1, -3.795743, -5.668235,
2, -3.622719, -5.390906,
2, -3.795743, -5.668235
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
"2"
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
-3, -4.141791, -6.222893, 0, -0.5, 0.5, 0.5,
-3, -4.141791, -6.222893, 1, -0.5, 0.5, 0.5,
-3, -4.141791, -6.222893, 1, 1.5, 0.5, 0.5,
-3, -4.141791, -6.222893, 0, 1.5, 0.5, 0.5,
-2, -4.141791, -6.222893, 0, -0.5, 0.5, 0.5,
-2, -4.141791, -6.222893, 1, -0.5, 0.5, 0.5,
-2, -4.141791, -6.222893, 1, 1.5, 0.5, 0.5,
-2, -4.141791, -6.222893, 0, 1.5, 0.5, 0.5,
-1, -4.141791, -6.222893, 0, -0.5, 0.5, 0.5,
-1, -4.141791, -6.222893, 1, -0.5, 0.5, 0.5,
-1, -4.141791, -6.222893, 1, 1.5, 0.5, 0.5,
-1, -4.141791, -6.222893, 0, 1.5, 0.5, 0.5,
0, -4.141791, -6.222893, 0, -0.5, 0.5, 0.5,
0, -4.141791, -6.222893, 1, -0.5, 0.5, 0.5,
0, -4.141791, -6.222893, 1, 1.5, 0.5, 0.5,
0, -4.141791, -6.222893, 0, 1.5, 0.5, 0.5,
1, -4.141791, -6.222893, 0, -0.5, 0.5, 0.5,
1, -4.141791, -6.222893, 1, -0.5, 0.5, 0.5,
1, -4.141791, -6.222893, 1, 1.5, 0.5, 0.5,
1, -4.141791, -6.222893, 0, 1.5, 0.5, 0.5,
2, -4.141791, -6.222893, 0, -0.5, 0.5, 0.5,
2, -4.141791, -6.222893, 1, -0.5, 0.5, 0.5,
2, -4.141791, -6.222893, 1, 1.5, 0.5, 0.5,
2, -4.141791, -6.222893, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<6; i++) 
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
20, 21, 22, 20, 22, 23
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
-3.371093, -3, -5.390906,
-3.371093, 3, -5.390906,
-3.371093, -3, -5.390906,
-3.530329, -3, -5.668235,
-3.371093, -2, -5.390906,
-3.530329, -2, -5.668235,
-3.371093, -1, -5.390906,
-3.530329, -1, -5.668235,
-3.371093, 0, -5.390906,
-3.530329, 0, -5.668235,
-3.371093, 1, -5.390906,
-3.530329, 1, -5.668235,
-3.371093, 2, -5.390906,
-3.530329, 2, -5.668235,
-3.371093, 3, -5.390906,
-3.530329, 3, -5.668235
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
-3.8488, -3, -6.222893, 0, -0.5, 0.5, 0.5,
-3.8488, -3, -6.222893, 1, -0.5, 0.5, 0.5,
-3.8488, -3, -6.222893, 1, 1.5, 0.5, 0.5,
-3.8488, -3, -6.222893, 0, 1.5, 0.5, 0.5,
-3.8488, -2, -6.222893, 0, -0.5, 0.5, 0.5,
-3.8488, -2, -6.222893, 1, -0.5, 0.5, 0.5,
-3.8488, -2, -6.222893, 1, 1.5, 0.5, 0.5,
-3.8488, -2, -6.222893, 0, 1.5, 0.5, 0.5,
-3.8488, -1, -6.222893, 0, -0.5, 0.5, 0.5,
-3.8488, -1, -6.222893, 1, -0.5, 0.5, 0.5,
-3.8488, -1, -6.222893, 1, 1.5, 0.5, 0.5,
-3.8488, -1, -6.222893, 0, 1.5, 0.5, 0.5,
-3.8488, 0, -6.222893, 0, -0.5, 0.5, 0.5,
-3.8488, 0, -6.222893, 1, -0.5, 0.5, 0.5,
-3.8488, 0, -6.222893, 1, 1.5, 0.5, 0.5,
-3.8488, 0, -6.222893, 0, 1.5, 0.5, 0.5,
-3.8488, 1, -6.222893, 0, -0.5, 0.5, 0.5,
-3.8488, 1, -6.222893, 1, -0.5, 0.5, 0.5,
-3.8488, 1, -6.222893, 1, 1.5, 0.5, 0.5,
-3.8488, 1, -6.222893, 0, 1.5, 0.5, 0.5,
-3.8488, 2, -6.222893, 0, -0.5, 0.5, 0.5,
-3.8488, 2, -6.222893, 1, -0.5, 0.5, 0.5,
-3.8488, 2, -6.222893, 1, 1.5, 0.5, 0.5,
-3.8488, 2, -6.222893, 0, 1.5, 0.5, 0.5,
-3.8488, 3, -6.222893, 0, -0.5, 0.5, 0.5,
-3.8488, 3, -6.222893, 1, -0.5, 0.5, 0.5,
-3.8488, 3, -6.222893, 1, 1.5, 0.5, 0.5,
-3.8488, 3, -6.222893, 0, 1.5, 0.5, 0.5
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
-3.371093, -3.622719, -4,
-3.371093, -3.622719, 4,
-3.371093, -3.622719, -4,
-3.530329, -3.795743, -4,
-3.371093, -3.622719, -2,
-3.530329, -3.795743, -2,
-3.371093, -3.622719, 0,
-3.530329, -3.795743, 0,
-3.371093, -3.622719, 2,
-3.530329, -3.795743, 2,
-3.371093, -3.622719, 4,
-3.530329, -3.795743, 4
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
-3.8488, -4.141791, -4, 0, -0.5, 0.5, 0.5,
-3.8488, -4.141791, -4, 1, -0.5, 0.5, 0.5,
-3.8488, -4.141791, -4, 1, 1.5, 0.5, 0.5,
-3.8488, -4.141791, -4, 0, 1.5, 0.5, 0.5,
-3.8488, -4.141791, -2, 0, -0.5, 0.5, 0.5,
-3.8488, -4.141791, -2, 1, -0.5, 0.5, 0.5,
-3.8488, -4.141791, -2, 1, 1.5, 0.5, 0.5,
-3.8488, -4.141791, -2, 0, 1.5, 0.5, 0.5,
-3.8488, -4.141791, 0, 0, -0.5, 0.5, 0.5,
-3.8488, -4.141791, 0, 1, -0.5, 0.5, 0.5,
-3.8488, -4.141791, 0, 1, 1.5, 0.5, 0.5,
-3.8488, -4.141791, 0, 0, 1.5, 0.5, 0.5,
-3.8488, -4.141791, 2, 0, -0.5, 0.5, 0.5,
-3.8488, -4.141791, 2, 1, -0.5, 0.5, 0.5,
-3.8488, -4.141791, 2, 1, 1.5, 0.5, 0.5,
-3.8488, -4.141791, 2, 0, 1.5, 0.5, 0.5,
-3.8488, -4.141791, 4, 0, -0.5, 0.5, 0.5,
-3.8488, -4.141791, 4, 1, -0.5, 0.5, 0.5,
-3.8488, -4.141791, 4, 1, 1.5, 0.5, 0.5,
-3.8488, -4.141791, 4, 0, 1.5, 0.5, 0.5
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
-3.371093, -3.622719, -5.390906,
-3.371093, 3.298235, -5.390906,
-3.371093, -3.622719, 5.702254,
-3.371093, 3.298235, 5.702254,
-3.371093, -3.622719, -5.390906,
-3.371093, -3.622719, 5.702254,
-3.371093, 3.298235, -5.390906,
-3.371093, 3.298235, 5.702254,
-3.371093, -3.622719, -5.390906,
2.998325, -3.622719, -5.390906,
-3.371093, -3.622719, 5.702254,
2.998325, -3.622719, 5.702254,
-3.371093, 3.298235, -5.390906,
2.998325, 3.298235, -5.390906,
-3.371093, 3.298235, 5.702254,
2.998325, 3.298235, 5.702254,
2.998325, -3.622719, -5.390906,
2.998325, 3.298235, -5.390906,
2.998325, -3.622719, 5.702254,
2.998325, 3.298235, 5.702254,
2.998325, -3.622719, -5.390906,
2.998325, -3.622719, 5.702254,
2.998325, 3.298235, -5.390906,
2.998325, 3.298235, 5.702254
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
var radius = 7.766202;
var distance = 34.55271;
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
mvMatrix.translate( 0.1863843, 0.1622419, -0.155674 );
mvMatrix.scale( 1.318326, 1.213268, 0.7569502 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.55271);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
Nicotine_sulfate<-read.table("Nicotine_sulfate.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Nicotine_sulfate$V2
```

```
## Error in eval(expr, envir, enclos): object 'Nicotine_sulfate' not found
```

```r
y<-Nicotine_sulfate$V3
```

```
## Error in eval(expr, envir, enclos): object 'Nicotine_sulfate' not found
```

```r
z<-Nicotine_sulfate$V4
```

```
## Error in eval(expr, envir, enclos): object 'Nicotine_sulfate' not found
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
-3.278335, -1.515543, -1.196043, 0, 0, 1, 1, 1,
-3.187148, 1.747094, -0.409202, 1, 0, 0, 1, 1,
-3.058752, 0.8784522, -0.4413146, 1, 0, 0, 1, 1,
-2.893902, -0.04315181, -2.728481, 1, 0, 0, 1, 1,
-2.78409, 2.370956, -1.168299, 1, 0, 0, 1, 1,
-2.696118, 2.447417, -2.818789, 1, 0, 0, 1, 1,
-2.694613, 0.3269266, -2.718341, 0, 0, 0, 1, 1,
-2.620294, -1.254559, -2.257549, 0, 0, 0, 1, 1,
-2.594673, 1.107873, -2.125403, 0, 0, 0, 1, 1,
-2.569185, 1.50978, -0.2579653, 0, 0, 0, 1, 1,
-2.46009, 0.7041984, -0.4897565, 0, 0, 0, 1, 1,
-2.417502, 0.2408823, -1.302807, 0, 0, 0, 1, 1,
-2.407454, -1.313952, -0.6400331, 0, 0, 0, 1, 1,
-2.382247, 0.9308219, -2.435837, 1, 1, 1, 1, 1,
-2.353554, 0.4206677, 0.4449242, 1, 1, 1, 1, 1,
-2.297597, 0.7246524, -1.037943, 1, 1, 1, 1, 1,
-2.284516, 0.5770566, -0.1231545, 1, 1, 1, 1, 1,
-2.256285, 0.8594679, -2.767645, 1, 1, 1, 1, 1,
-2.230421, 0.7276051, -0.8584961, 1, 1, 1, 1, 1,
-2.220062, -0.5904993, -1.649243, 1, 1, 1, 1, 1,
-2.216379, -0.6474885, -4.588298, 1, 1, 1, 1, 1,
-2.183204, -1.601938, -0.8647063, 1, 1, 1, 1, 1,
-2.127404, -1.10589, -1.360842, 1, 1, 1, 1, 1,
-2.075086, 0.1546248, -0.8187166, 1, 1, 1, 1, 1,
-2.058728, -1.417486, -2.171918, 1, 1, 1, 1, 1,
-2.054886, 2.484244, -2.74884, 1, 1, 1, 1, 1,
-2.049996, 0.5557273, -1.203103, 1, 1, 1, 1, 1,
-2.00808, 1.271267, 0.2059903, 1, 1, 1, 1, 1,
-1.990755, 0.4387556, -1.341417, 0, 0, 1, 1, 1,
-1.977655, 0.8503117, -0.8440794, 1, 0, 0, 1, 1,
-1.95007, 1.269826, -1.301592, 1, 0, 0, 1, 1,
-1.94466, 0.2336035, -1.536728, 1, 0, 0, 1, 1,
-1.933088, -2.372076, -2.247086, 1, 0, 0, 1, 1,
-1.8963, -1.080121, -3.117371, 1, 0, 0, 1, 1,
-1.85804, 1.053961, -1.0597, 0, 0, 0, 1, 1,
-1.841124, -1.091886, -0.827149, 0, 0, 0, 1, 1,
-1.839728, -0.9955484, -0.6744784, 0, 0, 0, 1, 1,
-1.814642, 0.4379817, -1.410518, 0, 0, 0, 1, 1,
-1.79818, 0.0223159, -1.053761, 0, 0, 0, 1, 1,
-1.791581, -2.180842, -1.854077, 0, 0, 0, 1, 1,
-1.765162, 1.44854, -1.836087, 0, 0, 0, 1, 1,
-1.731155, -0.09540246, -2.644162, 1, 1, 1, 1, 1,
-1.717588, -1.167892, -2.388332, 1, 1, 1, 1, 1,
-1.716962, 0.9784395, 0.1374921, 1, 1, 1, 1, 1,
-1.714969, 1.418388, -0.6677673, 1, 1, 1, 1, 1,
-1.712684, 0.7216452, -1.737621, 1, 1, 1, 1, 1,
-1.703033, 0.7674395, -1.142247, 1, 1, 1, 1, 1,
-1.694771, -0.3594639, -1.963525, 1, 1, 1, 1, 1,
-1.693356, 1.082306, -1.330899, 1, 1, 1, 1, 1,
-1.677074, -0.8131, -3.021584, 1, 1, 1, 1, 1,
-1.67231, -1.063148, -1.882959, 1, 1, 1, 1, 1,
-1.669972, -1.197921, -3.256062, 1, 1, 1, 1, 1,
-1.661104, 2.479475, -1.565969, 1, 1, 1, 1, 1,
-1.657877, -0.2928579, -1.15, 1, 1, 1, 1, 1,
-1.648575, 0.01398801, -1.453898, 1, 1, 1, 1, 1,
-1.645227, -1.12746, -3.076612, 1, 1, 1, 1, 1,
-1.623275, -0.4577696, -1.296741, 0, 0, 1, 1, 1,
-1.621641, -0.9802446, -1.491411, 1, 0, 0, 1, 1,
-1.61924, 1.152982, -0.3233585, 1, 0, 0, 1, 1,
-1.608941, -0.03541255, 0.178284, 1, 0, 0, 1, 1,
-1.604552, -0.1622201, -2.983634, 1, 0, 0, 1, 1,
-1.599383, -0.2295669, -3.125295, 1, 0, 0, 1, 1,
-1.597457, -0.8218465, -2.839052, 0, 0, 0, 1, 1,
-1.595554, 1.077283, -0.5444923, 0, 0, 0, 1, 1,
-1.584141, -1.019571, -1.414468, 0, 0, 0, 1, 1,
-1.580386, -1.007374, -3.114639, 0, 0, 0, 1, 1,
-1.558308, 0.6216862, -1.66778, 0, 0, 0, 1, 1,
-1.54236, -0.5829476, -1.99361, 0, 0, 0, 1, 1,
-1.524166, -2.223806, -3.371835, 0, 0, 0, 1, 1,
-1.507826, -0.6985651, -2.116135, 1, 1, 1, 1, 1,
-1.504585, 0.5331385, -3.177243, 1, 1, 1, 1, 1,
-1.497976, 0.1083734, -1.150156, 1, 1, 1, 1, 1,
-1.497344, -0.3968327, -1.914871, 1, 1, 1, 1, 1,
-1.492287, -1.012103, -3.266382, 1, 1, 1, 1, 1,
-1.490108, 0.1266229, -1.99625, 1, 1, 1, 1, 1,
-1.475442, -1.833808, -2.296126, 1, 1, 1, 1, 1,
-1.463932, -0.1922879, -1.746852, 1, 1, 1, 1, 1,
-1.463226, -2.244163, -1.568622, 1, 1, 1, 1, 1,
-1.462819, -0.2325651, -0.8655459, 1, 1, 1, 1, 1,
-1.459986, -0.08349802, -0.9699379, 1, 1, 1, 1, 1,
-1.433604, -0.492246, -0.898836, 1, 1, 1, 1, 1,
-1.432388, 0.1858996, -2.834528, 1, 1, 1, 1, 1,
-1.42475, 1.149088, -2.873651, 1, 1, 1, 1, 1,
-1.423791, 1.015673, -1.267894, 1, 1, 1, 1, 1,
-1.423439, 0.8750738, -1.903273, 0, 0, 1, 1, 1,
-1.420734, 0.8453071, -0.280946, 1, 0, 0, 1, 1,
-1.415828, 1.737785, -2.376997, 1, 0, 0, 1, 1,
-1.415195, 0.4089097, -1.475974, 1, 0, 0, 1, 1,
-1.413809, -0.5565234, -2.340154, 1, 0, 0, 1, 1,
-1.412362, 1.233207, 1.106766, 1, 0, 0, 1, 1,
-1.405751, -0.167293, -2.181142, 0, 0, 0, 1, 1,
-1.401389, 0.437437, -2.141549, 0, 0, 0, 1, 1,
-1.392022, -0.8048838, -2.163963, 0, 0, 0, 1, 1,
-1.391741, 0.2813845, -2.365974, 0, 0, 0, 1, 1,
-1.389981, 0.7566733, -0.9549148, 0, 0, 0, 1, 1,
-1.38879, 0.3793929, -0.4224773, 0, 0, 0, 1, 1,
-1.378343, 1.17404, 0.2505886, 0, 0, 0, 1, 1,
-1.372045, 0.3090947, 0.4547582, 1, 1, 1, 1, 1,
-1.368876, -1.548812, -1.046888, 1, 1, 1, 1, 1,
-1.365976, 0.7396404, -1.945459, 1, 1, 1, 1, 1,
-1.365684, -0.9039997, -0.5630999, 1, 1, 1, 1, 1,
-1.35802, -0.06099992, -1.800285, 1, 1, 1, 1, 1,
-1.352355, 0.9235688, 0.1050942, 1, 1, 1, 1, 1,
-1.347971, 0.08146991, -1.732284, 1, 1, 1, 1, 1,
-1.336792, 0.5129865, 0.4482296, 1, 1, 1, 1, 1,
-1.328056, 0.4601194, -2.017926, 1, 1, 1, 1, 1,
-1.324321, 0.5372224, 0.01211513, 1, 1, 1, 1, 1,
-1.322247, 0.6072858, 1.118384, 1, 1, 1, 1, 1,
-1.320062, 0.1292056, -2.676758, 1, 1, 1, 1, 1,
-1.319513, 1.343276, -1.617713, 1, 1, 1, 1, 1,
-1.314281, 0.005834508, -0.5781443, 1, 1, 1, 1, 1,
-1.307256, -1.553143, -2.589246, 1, 1, 1, 1, 1,
-1.298634, 0.530028, -1.622074, 0, 0, 1, 1, 1,
-1.289517, 0.2029829, -3.003289, 1, 0, 0, 1, 1,
-1.272257, 1.34199, -0.4849508, 1, 0, 0, 1, 1,
-1.270345, 0.3418402, -1.357032, 1, 0, 0, 1, 1,
-1.261818, -0.3074182, -2.520993, 1, 0, 0, 1, 1,
-1.260652, -0.06038895, -0.05866503, 1, 0, 0, 1, 1,
-1.254375, 1.796786, -0.2065134, 0, 0, 0, 1, 1,
-1.24896, 1.05461, 0.03728417, 0, 0, 0, 1, 1,
-1.245091, -0.378537, -2.147867, 0, 0, 0, 1, 1,
-1.244848, 0.4336241, -1.685804, 0, 0, 0, 1, 1,
-1.242369, -0.1187291, -0.7355373, 0, 0, 0, 1, 1,
-1.230436, -0.8163247, -2.911518, 0, 0, 0, 1, 1,
-1.221121, -0.3834642, -1.094358, 0, 0, 0, 1, 1,
-1.213869, -0.6504797, -0.7737987, 1, 1, 1, 1, 1,
-1.207363, -0.1552236, -4.754172, 1, 1, 1, 1, 1,
-1.206618, -0.7722381, -1.894368, 1, 1, 1, 1, 1,
-1.198457, 1.116704, -0.161321, 1, 1, 1, 1, 1,
-1.198065, 1.36948, -0.5541398, 1, 1, 1, 1, 1,
-1.18817, 1.199205, 1.56938, 1, 1, 1, 1, 1,
-1.185236, -1.385643, -2.891837, 1, 1, 1, 1, 1,
-1.179221, 0.6961662, -0.07393143, 1, 1, 1, 1, 1,
-1.172498, -1.477945, -2.25099, 1, 1, 1, 1, 1,
-1.171804, 0.8863313, -1.329816, 1, 1, 1, 1, 1,
-1.155993, 0.1900636, -1.192119, 1, 1, 1, 1, 1,
-1.154599, -2.238416, -1.159142, 1, 1, 1, 1, 1,
-1.14436, 0.429989, -1.395064, 1, 1, 1, 1, 1,
-1.137077, -0.8472432, 0.3181735, 1, 1, 1, 1, 1,
-1.131442, -0.6249489, -3.240013, 1, 1, 1, 1, 1,
-1.127021, -0.1456781, -3.443511, 0, 0, 1, 1, 1,
-1.126947, 0.5267698, -0.5650277, 1, 0, 0, 1, 1,
-1.12682, 0.8887686, -1.977516, 1, 0, 0, 1, 1,
-1.122557, -0.09717991, -2.471221, 1, 0, 0, 1, 1,
-1.121743, 1.391943, 0.5322617, 1, 0, 0, 1, 1,
-1.116512, 1.292796, -0.4514562, 1, 0, 0, 1, 1,
-1.110736, -0.01747558, -1.847951, 0, 0, 0, 1, 1,
-1.109748, -0.4078276, -1.650609, 0, 0, 0, 1, 1,
-1.104554, 0.4372582, -0.857792, 0, 0, 0, 1, 1,
-1.101085, -0.8210505, -1.909243, 0, 0, 0, 1, 1,
-1.098612, -0.3908552, -2.469326, 0, 0, 0, 1, 1,
-1.097636, 0.006125837, -1.615422, 0, 0, 0, 1, 1,
-1.090228, -0.571812, -1.709823, 0, 0, 0, 1, 1,
-1.089939, -1.421733, -2.035394, 1, 1, 1, 1, 1,
-1.087905, 0.2101728, -1.854345, 1, 1, 1, 1, 1,
-1.083151, -0.5842347, -3.489923, 1, 1, 1, 1, 1,
-1.08111, -0.4015474, -4.265344, 1, 1, 1, 1, 1,
-1.075789, 0.1521174, -0.1414609, 1, 1, 1, 1, 1,
-1.074549, -1.434068, -0.6152003, 1, 1, 1, 1, 1,
-1.073094, 0.09084173, -1.057775, 1, 1, 1, 1, 1,
-1.068882, 1.685172, -0.4364995, 1, 1, 1, 1, 1,
-1.06802, -0.3718355, -2.509943, 1, 1, 1, 1, 1,
-1.065101, -1.238788, -2.045815, 1, 1, 1, 1, 1,
-1.063993, -0.8619018, -2.029647, 1, 1, 1, 1, 1,
-1.063339, -1.294733, -2.132362, 1, 1, 1, 1, 1,
-1.062261, 0.1485536, -0.9270675, 1, 1, 1, 1, 1,
-1.061272, -0.3921366, -1.937916, 1, 1, 1, 1, 1,
-1.057619, -1.65854, -1.57181, 1, 1, 1, 1, 1,
-1.050329, -0.546458, -2.236922, 0, 0, 1, 1, 1,
-1.047709, 1.308789, -1.433751, 1, 0, 0, 1, 1,
-1.042467, -1.379918, -2.218698, 1, 0, 0, 1, 1,
-1.033538, -0.6744582, -3.060783, 1, 0, 0, 1, 1,
-1.031963, 1.199802, -1.421874, 1, 0, 0, 1, 1,
-1.031613, 0.4291959, 0.4645241, 1, 0, 0, 1, 1,
-1.030746, -0.5732937, -2.823771, 0, 0, 0, 1, 1,
-1.013575, 0.5984428, 0.2686653, 0, 0, 0, 1, 1,
-1.01339, -0.5592826, -1.349284, 0, 0, 0, 1, 1,
-1.008888, 0.546169, -0.5718733, 0, 0, 0, 1, 1,
-1.007669, 0.3437021, -1.227275, 0, 0, 0, 1, 1,
-1.001546, 1.013156, -0.3657499, 0, 0, 0, 1, 1,
-0.9907774, 0.08520544, -0.3083611, 0, 0, 0, 1, 1,
-0.990254, 0.4249499, -0.300522, 1, 1, 1, 1, 1,
-0.9900622, 0.3580804, -0.2009255, 1, 1, 1, 1, 1,
-0.9849756, 0.02905772, -1.202878, 1, 1, 1, 1, 1,
-0.9848653, -0.3923521, -4.66079, 1, 1, 1, 1, 1,
-0.9820232, 0.750892, -0.496733, 1, 1, 1, 1, 1,
-0.9802377, -1.647735, -2.121082, 1, 1, 1, 1, 1,
-0.9708708, -3.521929, -3.884041, 1, 1, 1, 1, 1,
-0.9584581, -0.1838245, -2.077238, 1, 1, 1, 1, 1,
-0.9578096, 1.185212, -1.523678, 1, 1, 1, 1, 1,
-0.9531727, 2.706689, -1.939235, 1, 1, 1, 1, 1,
-0.9442881, 0.3743975, -1.082394, 1, 1, 1, 1, 1,
-0.9392815, -0.5174249, -4.249434, 1, 1, 1, 1, 1,
-0.933995, -0.2202828, -2.414782, 1, 1, 1, 1, 1,
-0.9261864, -0.6500291, -2.630923, 1, 1, 1, 1, 1,
-0.9244661, 0.7027217, -1.759922, 1, 1, 1, 1, 1,
-0.9237207, 0.9255139, -0.1922248, 0, 0, 1, 1, 1,
-0.9221917, 0.4043438, -0.07387712, 1, 0, 0, 1, 1,
-0.9111255, 0.09312417, -1.982307, 1, 0, 0, 1, 1,
-0.9054978, -0.7886763, -2.671654, 1, 0, 0, 1, 1,
-0.9037144, 0.9639756, -1.269629, 1, 0, 0, 1, 1,
-0.8976693, 1.306287, 0.2214697, 1, 0, 0, 1, 1,
-0.8972937, 1.526454, -1.571557, 0, 0, 0, 1, 1,
-0.8815496, 0.9266983, -0.5810773, 0, 0, 0, 1, 1,
-0.8746651, 1.362114, 0.292264, 0, 0, 0, 1, 1,
-0.8733113, 0.5182939, -2.481607, 0, 0, 0, 1, 1,
-0.8712106, -0.3427522, -1.54332, 0, 0, 0, 1, 1,
-0.8701689, -1.959779, -2.230525, 0, 0, 0, 1, 1,
-0.8646821, 1.123795, -0.3950595, 0, 0, 0, 1, 1,
-0.8637483, -0.4390949, 0.1758077, 1, 1, 1, 1, 1,
-0.8616412, -0.01318446, 0.1775322, 1, 1, 1, 1, 1,
-0.8586873, 0.163048, -1.434328, 1, 1, 1, 1, 1,
-0.8437284, 0.9786507, 0.4434666, 1, 1, 1, 1, 1,
-0.8426114, 0.2875853, -1.882608, 1, 1, 1, 1, 1,
-0.8342891, 0.5079339, -2.730097, 1, 1, 1, 1, 1,
-0.8320911, 0.2998516, -3.901008, 1, 1, 1, 1, 1,
-0.8308972, -0.6001287, -3.117189, 1, 1, 1, 1, 1,
-0.8301491, 1.102039, 0.2274558, 1, 1, 1, 1, 1,
-0.8277493, 0.2643932, -1.67123, 1, 1, 1, 1, 1,
-0.8275152, 0.02781621, -2.092325, 1, 1, 1, 1, 1,
-0.826077, 0.2732332, -3.711444, 1, 1, 1, 1, 1,
-0.8180408, 1.474905, 0.04971028, 1, 1, 1, 1, 1,
-0.816661, -1.416172, -2.652629, 1, 1, 1, 1, 1,
-0.8130305, 0.5328493, -1.363281, 1, 1, 1, 1, 1,
-0.8124828, -1.509485, -2.507052, 0, 0, 1, 1, 1,
-0.8105289, 1.374297, -0.7011756, 1, 0, 0, 1, 1,
-0.7990291, -1.137366, -3.220456, 1, 0, 0, 1, 1,
-0.7984599, -1.526947, -0.5679574, 1, 0, 0, 1, 1,
-0.7930585, 0.01441379, -2.221176, 1, 0, 0, 1, 1,
-0.7908913, -0.8565139, -3.40976, 1, 0, 0, 1, 1,
-0.7896661, -0.2513419, -3.659259, 0, 0, 0, 1, 1,
-0.788127, 1.462286, -0.02977556, 0, 0, 0, 1, 1,
-0.7828994, -1.982514, -4.43745, 0, 0, 0, 1, 1,
-0.7822578, -1.831225, -1.847272, 0, 0, 0, 1, 1,
-0.7813841, 1.361272, -1.523348, 0, 0, 0, 1, 1,
-0.7794101, -0.8456817, -2.268931, 0, 0, 0, 1, 1,
-0.778579, -1.536752, -0.5288457, 0, 0, 0, 1, 1,
-0.7641914, -0.3965573, -1.331568, 1, 1, 1, 1, 1,
-0.764094, -0.4406072, -1.240898, 1, 1, 1, 1, 1,
-0.7587537, -1.501785, -2.809903, 1, 1, 1, 1, 1,
-0.7574229, 1.841979, 0.121682, 1, 1, 1, 1, 1,
-0.7552228, 1.575041, 0.2782684, 1, 1, 1, 1, 1,
-0.750962, -0.216802, -1.961442, 1, 1, 1, 1, 1,
-0.7475558, -0.9055492, -4.469233, 1, 1, 1, 1, 1,
-0.7435992, 1.067401, -0.3939209, 1, 1, 1, 1, 1,
-0.7428099, 1.918385, -1.375657, 1, 1, 1, 1, 1,
-0.7398275, -0.05354761, -0.7524284, 1, 1, 1, 1, 1,
-0.7385016, 0.6573917, -0.8411177, 1, 1, 1, 1, 1,
-0.736782, 1.746864, -0.0878941, 1, 1, 1, 1, 1,
-0.7329376, -0.1496307, -1.278938, 1, 1, 1, 1, 1,
-0.7297844, 0.06975952, -1.770637, 1, 1, 1, 1, 1,
-0.7264263, -0.7472807, -2.713905, 1, 1, 1, 1, 1,
-0.7263664, -0.6660861, -2.713436, 0, 0, 1, 1, 1,
-0.7257614, 1.203725, -1.444805, 1, 0, 0, 1, 1,
-0.7241694, 2.452403, 1.011349, 1, 0, 0, 1, 1,
-0.7225988, -0.00903235, 0.4546059, 1, 0, 0, 1, 1,
-0.7170845, 0.8629719, -1.611644, 1, 0, 0, 1, 1,
-0.7086536, 0.3201996, -0.8864108, 1, 0, 0, 1, 1,
-0.7061207, 0.07392559, -0.2051407, 0, 0, 0, 1, 1,
-0.7026744, -0.6042882, -1.978176, 0, 0, 0, 1, 1,
-0.6989012, -0.5719924, -1.696688, 0, 0, 0, 1, 1,
-0.6956843, -2.83032, -3.692272, 0, 0, 0, 1, 1,
-0.6955898, 0.7280714, -2.490484, 0, 0, 0, 1, 1,
-0.6938199, -0.0345431, -1.622601, 0, 0, 0, 1, 1,
-0.6910914, -0.2389437, -2.70045, 0, 0, 0, 1, 1,
-0.6883379, -0.7558433, -1.847319, 1, 1, 1, 1, 1,
-0.6881874, -0.581116, -4.307017, 1, 1, 1, 1, 1,
-0.678869, 0.3159775, -0.2913888, 1, 1, 1, 1, 1,
-0.6749973, 0.7390549, -0.5016024, 1, 1, 1, 1, 1,
-0.6738113, -1.061726, -2.733835, 1, 1, 1, 1, 1,
-0.6703632, -1.137235, -1.545046, 1, 1, 1, 1, 1,
-0.6576374, -0.3106391, -1.019395, 1, 1, 1, 1, 1,
-0.6565697, -1.048928, -2.080911, 1, 1, 1, 1, 1,
-0.6557645, 1.588335, -1.129429, 1, 1, 1, 1, 1,
-0.6549708, -1.620268, -2.943587, 1, 1, 1, 1, 1,
-0.6525821, 0.5247021, -1.175596, 1, 1, 1, 1, 1,
-0.6510988, -0.1809434, -0.3509539, 1, 1, 1, 1, 1,
-0.6432999, 0.5155146, -2.302589, 1, 1, 1, 1, 1,
-0.6334947, 0.0267318, -0.003410129, 1, 1, 1, 1, 1,
-0.6324174, -0.981975, -1.510248, 1, 1, 1, 1, 1,
-0.6301427, -1.067422, -1.934074, 0, 0, 1, 1, 1,
-0.6295931, -0.5945521, -1.929849, 1, 0, 0, 1, 1,
-0.6264873, 0.6246404, -1.202757, 1, 0, 0, 1, 1,
-0.6194633, -0.437242, -2.626289, 1, 0, 0, 1, 1,
-0.612438, -0.0582473, -2.009643, 1, 0, 0, 1, 1,
-0.6068579, -1.037345, -3.344478, 1, 0, 0, 1, 1,
-0.603546, 0.4028971, -0.3707666, 0, 0, 0, 1, 1,
-0.6006106, 1.369426, -0.8947612, 0, 0, 0, 1, 1,
-0.597942, -1.373013, -4.774768, 0, 0, 0, 1, 1,
-0.5965498, 1.789681, -0.8790459, 0, 0, 0, 1, 1,
-0.5934832, -0.874671, -3.406981, 0, 0, 0, 1, 1,
-0.5684768, 1.000602, -2.715053, 0, 0, 0, 1, 1,
-0.5682741, 0.247392, -2.764847, 0, 0, 0, 1, 1,
-0.5649265, 0.3859547, 0.9878083, 1, 1, 1, 1, 1,
-0.5646207, 1.053238, -0.05095677, 1, 1, 1, 1, 1,
-0.5635595, -0.4305374, -2.16731, 1, 1, 1, 1, 1,
-0.5623349, 1.236766, -0.7856075, 1, 1, 1, 1, 1,
-0.5533919, 0.3428498, -0.3716992, 1, 1, 1, 1, 1,
-0.5526112, 0.8090355, -1.404286, 1, 1, 1, 1, 1,
-0.550234, 1.947451, -0.7048082, 1, 1, 1, 1, 1,
-0.5500057, -1.80379, -4.437498, 1, 1, 1, 1, 1,
-0.5490567, 0.2040627, -0.1300653, 1, 1, 1, 1, 1,
-0.5451354, 0.1115219, -2.233145, 1, 1, 1, 1, 1,
-0.5432986, 0.4117309, 0.1057923, 1, 1, 1, 1, 1,
-0.5427564, -0.4376999, -3.589305, 1, 1, 1, 1, 1,
-0.5416594, -0.5511389, -0.2060696, 1, 1, 1, 1, 1,
-0.5394263, -0.1143568, -0.8297281, 1, 1, 1, 1, 1,
-0.5318929, -2.12458, -3.996656, 1, 1, 1, 1, 1,
-0.5300738, 1.097175, -0.3939553, 0, 0, 1, 1, 1,
-0.5272954, 0.5901877, -0.5583859, 1, 0, 0, 1, 1,
-0.5262584, 0.2101795, -1.299758, 1, 0, 0, 1, 1,
-0.5204682, -0.2584514, -2.886701, 1, 0, 0, 1, 1,
-0.5198317, -0.6344629, -0.973385, 1, 0, 0, 1, 1,
-0.5172793, -0.9375858, -2.46425, 1, 0, 0, 1, 1,
-0.5146703, 1.106591, -1.314589, 0, 0, 0, 1, 1,
-0.5083207, 0.6790422, -0.2626975, 0, 0, 0, 1, 1,
-0.5070649, -1.095155, -2.632211, 0, 0, 0, 1, 1,
-0.5069246, 0.2784656, -0.8573509, 0, 0, 0, 1, 1,
-0.5067569, -1.065827, -2.204296, 0, 0, 0, 1, 1,
-0.5052946, 0.8367498, 0.5707517, 0, 0, 0, 1, 1,
-0.5044115, 1.276114, -1.633327, 0, 0, 0, 1, 1,
-0.5041858, -0.4983912, -1.632934, 1, 1, 1, 1, 1,
-0.5021064, -0.2464114, -3.75042, 1, 1, 1, 1, 1,
-0.501076, -0.06554975, -1.878127, 1, 1, 1, 1, 1,
-0.4953342, 1.993222, -0.9339566, 1, 1, 1, 1, 1,
-0.4937199, -0.05664358, -2.627482, 1, 1, 1, 1, 1,
-0.4832623, -0.2620205, -1.531348, 1, 1, 1, 1, 1,
-0.4800187, -0.6847119, -3.003943, 1, 1, 1, 1, 1,
-0.4663939, 0.5038322, -0.6647964, 1, 1, 1, 1, 1,
-0.4644232, -0.3574601, -1.485744, 1, 1, 1, 1, 1,
-0.4637208, 0.3524725, -0.9879761, 1, 1, 1, 1, 1,
-0.4554807, -1.242464, -2.422216, 1, 1, 1, 1, 1,
-0.4554554, -1.124433, -2.973215, 1, 1, 1, 1, 1,
-0.4543944, -1.194987, -4.006092, 1, 1, 1, 1, 1,
-0.4537056, -1.698065, -2.957849, 1, 1, 1, 1, 1,
-0.4511147, -1.954378, -2.89001, 1, 1, 1, 1, 1,
-0.4506527, 1.582806, 1.755545, 0, 0, 1, 1, 1,
-0.4501188, 0.931003, -2.219655, 1, 0, 0, 1, 1,
-0.4454565, -0.5745636, -2.433594, 1, 0, 0, 1, 1,
-0.4442447, 0.9140515, -1.485276, 1, 0, 0, 1, 1,
-0.4421272, 0.3579621, -1.102735, 1, 0, 0, 1, 1,
-0.4414618, -1.752586, -3.906012, 1, 0, 0, 1, 1,
-0.4397741, 0.4329185, 1.600847, 0, 0, 0, 1, 1,
-0.4386925, -0.6791017, -3.016036, 0, 0, 0, 1, 1,
-0.4375913, 0.1074005, -1.297364, 0, 0, 0, 1, 1,
-0.4322526, 2.11614, -1.393958, 0, 0, 0, 1, 1,
-0.4318619, -2.569182, -3.283052, 0, 0, 0, 1, 1,
-0.4315272, 0.5136772, -0.7471944, 0, 0, 0, 1, 1,
-0.4274691, -0.883728, -4.197158, 0, 0, 0, 1, 1,
-0.4264339, -0.1637804, -0.1035463, 1, 1, 1, 1, 1,
-0.4257935, -0.9332321, -1.167021, 1, 1, 1, 1, 1,
-0.4237568, -0.2339922, -3.733113, 1, 1, 1, 1, 1,
-0.4233097, 0.8373277, -1.03948, 1, 1, 1, 1, 1,
-0.420848, -0.2228198, -3.212302, 1, 1, 1, 1, 1,
-0.4073521, -1.594983, -1.980744, 1, 1, 1, 1, 1,
-0.4033875, -0.3485134, -1.486026, 1, 1, 1, 1, 1,
-0.4005258, 0.3424199, 0.01018924, 1, 1, 1, 1, 1,
-0.3973217, 1.05584, 0.7231726, 1, 1, 1, 1, 1,
-0.3962768, -0.3897653, -2.01198, 1, 1, 1, 1, 1,
-0.3954024, -0.6401674, -2.096332, 1, 1, 1, 1, 1,
-0.3948935, 1.546756, 0.6789764, 1, 1, 1, 1, 1,
-0.3946932, -0.4150554, -1.798603, 1, 1, 1, 1, 1,
-0.3887089, 0.02743074, -1.865876, 1, 1, 1, 1, 1,
-0.3865377, -1.582779, -4.89104, 1, 1, 1, 1, 1,
-0.3855267, 0.382411, -1.268915, 0, 0, 1, 1, 1,
-0.3854436, -0.5011321, -1.887373, 1, 0, 0, 1, 1,
-0.3849022, 0.960505, -1.377852, 1, 0, 0, 1, 1,
-0.3835862, 1.471191, -1.013594, 1, 0, 0, 1, 1,
-0.3832753, 1.789767, 0.2566774, 1, 0, 0, 1, 1,
-0.3785994, 1.24488, 0.3928902, 1, 0, 0, 1, 1,
-0.3775201, -1.119399, -2.436363, 0, 0, 0, 1, 1,
-0.3739577, 1.194526, -0.6612336, 0, 0, 0, 1, 1,
-0.3738995, 0.2232646, -2.349906, 0, 0, 0, 1, 1,
-0.3707457, -0.6577291, -2.898697, 0, 0, 0, 1, 1,
-0.3701409, 0.9814404, -0.2816722, 0, 0, 0, 1, 1,
-0.3674277, 2.166934, -0.02965955, 0, 0, 0, 1, 1,
-0.3669144, -0.602578, -4.071648, 0, 0, 0, 1, 1,
-0.3655308, 0.9162913, -1.297012, 1, 1, 1, 1, 1,
-0.3623718, 0.9316561, -0.7908462, 1, 1, 1, 1, 1,
-0.3596529, 0.5118897, -1.545514, 1, 1, 1, 1, 1,
-0.3580803, -0.8527061, -1.768654, 1, 1, 1, 1, 1,
-0.3554757, 0.3463917, -0.2075083, 1, 1, 1, 1, 1,
-0.3527661, 0.2424147, -1.459718, 1, 1, 1, 1, 1,
-0.3519302, -0.6748246, -2.022086, 1, 1, 1, 1, 1,
-0.3460332, 1.218342, -1.493023, 1, 1, 1, 1, 1,
-0.3423583, -0.7345616, -2.376704, 1, 1, 1, 1, 1,
-0.3396491, 0.2422049, -1.596044, 1, 1, 1, 1, 1,
-0.339472, -0.3745882, -2.54925, 1, 1, 1, 1, 1,
-0.3361773, -0.4624556, -0.7368649, 1, 1, 1, 1, 1,
-0.3330589, -0.0674745, -3.339791, 1, 1, 1, 1, 1,
-0.3321502, 0.9677563, -0.1974805, 1, 1, 1, 1, 1,
-0.3317759, -0.1259741, -1.346784, 1, 1, 1, 1, 1,
-0.3251358, 0.4295002, 0.2361286, 0, 0, 1, 1, 1,
-0.3248561, 0.3589901, 0.5007851, 1, 0, 0, 1, 1,
-0.3244494, 1.688527, -0.1271849, 1, 0, 0, 1, 1,
-0.3213174, -0.4064396, -4.043309, 1, 0, 0, 1, 1,
-0.3193892, -1.461129, -4.781311, 1, 0, 0, 1, 1,
-0.3192798, -0.09167392, -1.992048, 1, 0, 0, 1, 1,
-0.3156127, -0.07973139, -4.331335, 0, 0, 0, 1, 1,
-0.3144338, 1.235477, 0.1366627, 0, 0, 0, 1, 1,
-0.3085976, 1.363959, -1.127877, 0, 0, 0, 1, 1,
-0.3064052, 0.5164424, 0.02132376, 0, 0, 0, 1, 1,
-0.3051121, 1.141363, -0.9588456, 0, 0, 0, 1, 1,
-0.304331, -0.5361224, -0.803188, 0, 0, 0, 1, 1,
-0.302892, 0.03681357, -0.9923076, 0, 0, 0, 1, 1,
-0.3022552, -0.6426675, -2.852684, 1, 1, 1, 1, 1,
-0.3021809, 1.244194, -0.5222597, 1, 1, 1, 1, 1,
-0.3010597, 0.8828706, -1.813664, 1, 1, 1, 1, 1,
-0.3010101, 0.2141868, -2.745372, 1, 1, 1, 1, 1,
-0.3005762, -0.390911, -1.851523, 1, 1, 1, 1, 1,
-0.2995951, 0.2437023, -0.9405655, 1, 1, 1, 1, 1,
-0.2991852, -1.004052, -4.270657, 1, 1, 1, 1, 1,
-0.2951059, 0.2054398, -0.8354604, 1, 1, 1, 1, 1,
-0.294621, -0.9156801, -2.2315, 1, 1, 1, 1, 1,
-0.2919736, 1.713047, 0.08383481, 1, 1, 1, 1, 1,
-0.2891623, 0.6742649, -0.6624733, 1, 1, 1, 1, 1,
-0.2856342, -1.040052, -2.983005, 1, 1, 1, 1, 1,
-0.2838269, 0.3970428, -0.4820779, 1, 1, 1, 1, 1,
-0.2830827, 0.05510012, -0.6907156, 1, 1, 1, 1, 1,
-0.2830547, -0.4279772, -3.265423, 1, 1, 1, 1, 1,
-0.2830024, 0.1126035, -1.664973, 0, 0, 1, 1, 1,
-0.2808726, -1.47065, -2.68929, 1, 0, 0, 1, 1,
-0.2795512, 0.8035768, -1.793967, 1, 0, 0, 1, 1,
-0.2787202, 0.6395599, -0.7235014, 1, 0, 0, 1, 1,
-0.2743267, 0.7039869, 0.5194313, 1, 0, 0, 1, 1,
-0.2734578, -0.7847658, -2.129528, 1, 0, 0, 1, 1,
-0.2684644, 0.4953279, -0.1250015, 0, 0, 0, 1, 1,
-0.2672765, 0.0550069, -0.6988947, 0, 0, 0, 1, 1,
-0.2663177, 1.174051, -0.9973235, 0, 0, 0, 1, 1,
-0.263952, -2.926453, -4.29705, 0, 0, 0, 1, 1,
-0.2612526, 0.3496513, -0.9041589, 0, 0, 0, 1, 1,
-0.2611937, 1.57361, 0.8756036, 0, 0, 0, 1, 1,
-0.2572549, -0.04256217, -2.936868, 0, 0, 0, 1, 1,
-0.2571808, -0.2652003, -1.954991, 1, 1, 1, 1, 1,
-0.2550576, -1.164725, -3.375227, 1, 1, 1, 1, 1,
-0.2547885, 0.1004153, 0.328643, 1, 1, 1, 1, 1,
-0.2529631, -1.968194, -4.967309, 1, 1, 1, 1, 1,
-0.2516737, 0.78137, -0.404997, 1, 1, 1, 1, 1,
-0.2515173, 0.7397261, -0.5700589, 1, 1, 1, 1, 1,
-0.248446, -0.9124197, -3.52873, 1, 1, 1, 1, 1,
-0.2465893, -0.4603256, -2.002023, 1, 1, 1, 1, 1,
-0.244265, -0.72059, -3.514603, 1, 1, 1, 1, 1,
-0.2396903, 0.01243888, 0.2018512, 1, 1, 1, 1, 1,
-0.2368378, -1.303551, -2.395854, 1, 1, 1, 1, 1,
-0.2363706, 0.5595889, -0.1212106, 1, 1, 1, 1, 1,
-0.2352559, 1.495494, -0.4324919, 1, 1, 1, 1, 1,
-0.2321051, -0.2255581, -1.4217, 1, 1, 1, 1, 1,
-0.2298706, -0.3677714, -0.9992115, 1, 1, 1, 1, 1,
-0.2220757, 0.2464898, -0.5433961, 0, 0, 1, 1, 1,
-0.220898, -1.889022, -3.554133, 1, 0, 0, 1, 1,
-0.2140529, 0.9354657, -0.3494662, 1, 0, 0, 1, 1,
-0.2104818, -1.290219, -2.300108, 1, 0, 0, 1, 1,
-0.2086225, 1.40861, 0.5498983, 1, 0, 0, 1, 1,
-0.2076126, -0.6091965, -1.891092, 1, 0, 0, 1, 1,
-0.2073033, -0.9143494, -3.013065, 0, 0, 0, 1, 1,
-0.2051792, -1.174589, -2.94809, 0, 0, 0, 1, 1,
-0.2041229, -0.06902834, -2.270494, 0, 0, 0, 1, 1,
-0.1999773, 0.9250684, 0.8706586, 0, 0, 0, 1, 1,
-0.1973788, -0.5505186, -1.530466, 0, 0, 0, 1, 1,
-0.1881381, -0.8333383, -2.500983, 0, 0, 0, 1, 1,
-0.1866015, 0.9452202, -0.1715422, 0, 0, 0, 1, 1,
-0.184184, 1.716779, 0.2280289, 1, 1, 1, 1, 1,
-0.1836667, 0.3014143, -0.3589812, 1, 1, 1, 1, 1,
-0.1827768, 0.8311602, -0.2295847, 1, 1, 1, 1, 1,
-0.1818186, -1.47085, -2.596486, 1, 1, 1, 1, 1,
-0.1813364, -0.608905, -1.834614, 1, 1, 1, 1, 1,
-0.1785755, -0.6761758, -2.75882, 1, 1, 1, 1, 1,
-0.175799, 0.3219665, -0.693645, 1, 1, 1, 1, 1,
-0.1752062, -1.244522, -2.506292, 1, 1, 1, 1, 1,
-0.172943, 0.6423823, -1.509839, 1, 1, 1, 1, 1,
-0.1719602, 0.6694148, 2.013879, 1, 1, 1, 1, 1,
-0.1674122, -0.8305398, -1.736159, 1, 1, 1, 1, 1,
-0.16653, 2.865359, -0.6047708, 1, 1, 1, 1, 1,
-0.163449, -0.5212513, -1.211501, 1, 1, 1, 1, 1,
-0.1632557, -0.2187917, -3.948357, 1, 1, 1, 1, 1,
-0.1595687, -0.9438891, -3.72936, 1, 1, 1, 1, 1,
-0.1515506, -1.521409, -3.191852, 0, 0, 1, 1, 1,
-0.145958, -0.9608161, -4.154059, 1, 0, 0, 1, 1,
-0.1368394, 0.06606385, -1.118082, 1, 0, 0, 1, 1,
-0.1361711, 0.7310283, -0.6158447, 1, 0, 0, 1, 1,
-0.135744, 0.9445931, 0.2953996, 1, 0, 0, 1, 1,
-0.1343531, -0.293727, -3.628598, 1, 0, 0, 1, 1,
-0.1280223, -2.179615, -4.024377, 0, 0, 0, 1, 1,
-0.1249901, -0.03606948, -2.818714, 0, 0, 0, 1, 1,
-0.1201195, 0.466982, -1.593989, 0, 0, 0, 1, 1,
-0.1192648, -0.5888046, -3.115323, 0, 0, 0, 1, 1,
-0.1171337, -0.3769316, -2.59585, 0, 0, 0, 1, 1,
-0.1095659, 0.1588327, 0.3451689, 0, 0, 0, 1, 1,
-0.1011605, 0.6316394, 0.1853254, 0, 0, 0, 1, 1,
-0.1001418, 0.4042194, 1.046847, 1, 1, 1, 1, 1,
-0.09919253, -1.058834, -2.845975, 1, 1, 1, 1, 1,
-0.09711494, 0.5556737, 0.5254275, 1, 1, 1, 1, 1,
-0.09462559, -0.001049584, -1.899398, 1, 1, 1, 1, 1,
-0.09308878, -0.713343, -4.880224, 1, 1, 1, 1, 1,
-0.08982795, 0.4235608, 1.742801, 1, 1, 1, 1, 1,
-0.08619931, -0.725893, -3.659131, 1, 1, 1, 1, 1,
-0.08277706, 0.430392, 1.715196, 1, 1, 1, 1, 1,
-0.08143046, -0.0610928, -2.993556, 1, 1, 1, 1, 1,
-0.08131029, -0.7424337, -2.564305, 1, 1, 1, 1, 1,
-0.07959447, -0.6537305, -5.229355, 1, 1, 1, 1, 1,
-0.07565235, 0.2939193, 0.1219781, 1, 1, 1, 1, 1,
-0.07537216, -0.260789, -4.031498, 1, 1, 1, 1, 1,
-0.07356429, 1.030891, -0.1392872, 1, 1, 1, 1, 1,
-0.07263635, 0.2653846, 0.4205123, 1, 1, 1, 1, 1,
-0.07152111, 1.746741, 2.288706, 0, 0, 1, 1, 1,
-0.07109524, 1.148619, 2.876788, 1, 0, 0, 1, 1,
-0.06773982, -0.4142237, -2.122716, 1, 0, 0, 1, 1,
-0.06602955, -0.5820203, -2.960406, 1, 0, 0, 1, 1,
-0.06489024, 3.197445, 1.525696, 1, 0, 0, 1, 1,
-0.0624873, -0.09165121, -3.60532, 1, 0, 0, 1, 1,
-0.06040071, -0.9617758, -3.432633, 0, 0, 0, 1, 1,
-0.05760233, 2.358165, -0.6282785, 0, 0, 0, 1, 1,
-0.04065179, -0.5925136, -3.37054, 0, 0, 0, 1, 1,
-0.03546338, 0.8548262, -0.3787686, 0, 0, 0, 1, 1,
-0.03501696, 1.122277, -0.2511179, 0, 0, 0, 1, 1,
-0.01628679, 0.5822402, -0.7421184, 0, 0, 0, 1, 1,
-0.01294169, -0.2328956, -3.71299, 0, 0, 0, 1, 1,
-0.01208817, 0.07031348, -1.74578, 1, 1, 1, 1, 1,
-0.007697261, -0.5341063, -2.127781, 1, 1, 1, 1, 1,
-0.007633696, 0.07922332, 0.7011153, 1, 1, 1, 1, 1,
-0.006044024, 0.3901011, -1.841491, 1, 1, 1, 1, 1,
-0.0008262799, 0.9929127, -1.419531, 1, 1, 1, 1, 1,
0.009064483, 1.360175, 0.5781041, 1, 1, 1, 1, 1,
0.009340426, 0.7090372, -0.5532137, 1, 1, 1, 1, 1,
0.009862885, -0.5062124, 2.816917, 1, 1, 1, 1, 1,
0.01211145, 2.220638, 1.382628, 1, 1, 1, 1, 1,
0.01323424, -0.3182201, 4.20547, 1, 1, 1, 1, 1,
0.01443048, 1.357741, 1.074378, 1, 1, 1, 1, 1,
0.01827051, -1.412855, 2.702098, 1, 1, 1, 1, 1,
0.01976022, -1.536164, 2.742146, 1, 1, 1, 1, 1,
0.02273183, 1.339469, 1.118397, 1, 1, 1, 1, 1,
0.02429885, -0.4534757, 2.129357, 1, 1, 1, 1, 1,
0.02450218, 1.536496, -0.5656852, 0, 0, 1, 1, 1,
0.03095234, -1.075083, 1.90107, 1, 0, 0, 1, 1,
0.03318732, 0.4128424, -0.4989703, 1, 0, 0, 1, 1,
0.03407848, -0.3684393, 2.592083, 1, 0, 0, 1, 1,
0.03802212, 0.06369792, 0.515489, 1, 0, 0, 1, 1,
0.0434716, 0.03693143, 1.027954, 1, 0, 0, 1, 1,
0.04623897, 0.4207779, -1.627718, 0, 0, 0, 1, 1,
0.05174559, 1.052485, -0.3057299, 0, 0, 0, 1, 1,
0.0544414, -0.5715267, 2.832677, 0, 0, 0, 1, 1,
0.05689543, -0.7548715, 3.674271, 0, 0, 0, 1, 1,
0.05815948, -0.384534, 2.083757, 0, 0, 0, 1, 1,
0.06382749, -0.1113731, 3.512411, 0, 0, 0, 1, 1,
0.0641648, -0.5914209, 3.253816, 0, 0, 0, 1, 1,
0.06977967, -1.452207, 3.486412, 1, 1, 1, 1, 1,
0.07188711, -0.06645719, 0.420607, 1, 1, 1, 1, 1,
0.07263958, 0.1436357, 2.094954, 1, 1, 1, 1, 1,
0.07391065, 1.501352, 1.517707, 1, 1, 1, 1, 1,
0.07602965, 0.01456181, 0.1131177, 1, 1, 1, 1, 1,
0.07906564, -0.6291224, 2.62543, 1, 1, 1, 1, 1,
0.08259802, -0.4044053, 4.173723, 1, 1, 1, 1, 1,
0.088728, -0.3270414, 2.886681, 1, 1, 1, 1, 1,
0.09217366, -0.02081641, -0.0257017, 1, 1, 1, 1, 1,
0.09585071, -0.09161828, 2.540019, 1, 1, 1, 1, 1,
0.0974846, -0.8056677, 0.5653862, 1, 1, 1, 1, 1,
0.1017978, 0.1923807, 1.405009, 1, 1, 1, 1, 1,
0.1019738, 1.465358, -0.8474178, 1, 1, 1, 1, 1,
0.1037795, 0.5120325, 0.5732957, 1, 1, 1, 1, 1,
0.1052556, -0.1735484, 3.625792, 1, 1, 1, 1, 1,
0.1056677, 0.005931337, 0.6547878, 0, 0, 1, 1, 1,
0.1069822, -0.1121096, 1.83608, 1, 0, 0, 1, 1,
0.1112614, -0.6957809, 2.84702, 1, 0, 0, 1, 1,
0.1160084, 1.087881, 0.5761394, 1, 0, 0, 1, 1,
0.1176244, -0.6746057, 4.48679, 1, 0, 0, 1, 1,
0.1178639, -0.6070966, 4.432528, 1, 0, 0, 1, 1,
0.119936, -0.1340473, 0.2905462, 0, 0, 0, 1, 1,
0.1212061, -0.4043249, 3.219135, 0, 0, 0, 1, 1,
0.1248418, -1.148277, 4.597537, 0, 0, 0, 1, 1,
0.1300609, 0.3604453, 0.3588504, 0, 0, 0, 1, 1,
0.1305235, -0.9062238, 3.619382, 0, 0, 0, 1, 1,
0.1306544, 0.7167462, -1.585376, 0, 0, 0, 1, 1,
0.136062, 0.01730076, 2.072571, 0, 0, 0, 1, 1,
0.1362172, 0.6596608, 1.214712, 1, 1, 1, 1, 1,
0.1365133, -1.42575, 2.341321, 1, 1, 1, 1, 1,
0.1370366, -1.070173, 4.726774, 1, 1, 1, 1, 1,
0.1371729, 0.008843928, 0.7594728, 1, 1, 1, 1, 1,
0.1394821, 2.5516, 0.09290257, 1, 1, 1, 1, 1,
0.1440098, 0.05677434, 0.9034077, 1, 1, 1, 1, 1,
0.1448905, 0.3871391, 0.7456719, 1, 1, 1, 1, 1,
0.1459924, -1.36197, 3.822561, 1, 1, 1, 1, 1,
0.1494315, -1.024362, 3.412881, 1, 1, 1, 1, 1,
0.1506883, -1.404486, 4.566143, 1, 1, 1, 1, 1,
0.1522203, 1.412113, 0.01455192, 1, 1, 1, 1, 1,
0.1524852, -0.1522848, 3.386463, 1, 1, 1, 1, 1,
0.1567668, -0.7272986, 2.592129, 1, 1, 1, 1, 1,
0.1587082, -1.234247, 3.393748, 1, 1, 1, 1, 1,
0.1797899, 0.04949784, 1.052372, 1, 1, 1, 1, 1,
0.179985, -1.669048, 1.964212, 0, 0, 1, 1, 1,
0.1811887, -0.4403597, 4.343315, 1, 0, 0, 1, 1,
0.1817202, -0.9331304, 2.941251, 1, 0, 0, 1, 1,
0.1842079, 1.385474, -0.03534518, 1, 0, 0, 1, 1,
0.1860145, -0.4263981, 1.622161, 1, 0, 0, 1, 1,
0.1865215, 0.1529018, 1.076327, 1, 0, 0, 1, 1,
0.1923951, -0.1960549, 1.980919, 0, 0, 0, 1, 1,
0.192987, -0.5951483, 1.890966, 0, 0, 0, 1, 1,
0.1949917, -0.2549535, 1.986633, 0, 0, 0, 1, 1,
0.1981288, 0.4025827, -0.5459113, 0, 0, 0, 1, 1,
0.2011172, -1.200315, 2.399817, 0, 0, 0, 1, 1,
0.2016234, -0.2059724, 2.104748, 0, 0, 0, 1, 1,
0.2128386, 0.4981574, 1.663283, 0, 0, 0, 1, 1,
0.2131875, 0.2641576, 1.021051, 1, 1, 1, 1, 1,
0.2135476, 0.2340343, 1.741055, 1, 1, 1, 1, 1,
0.2155114, 1.301075, -0.4865357, 1, 1, 1, 1, 1,
0.2208049, -1.177712, 2.037865, 1, 1, 1, 1, 1,
0.2233006, -0.7771411, 2.782112, 1, 1, 1, 1, 1,
0.2275045, -0.2546103, 3.48976, 1, 1, 1, 1, 1,
0.2315013, -1.69617, 3.038775, 1, 1, 1, 1, 1,
0.2333626, -0.0894335, 1.139906, 1, 1, 1, 1, 1,
0.2336954, -1.713155, 4.43995, 1, 1, 1, 1, 1,
0.2394652, 2.347303, -0.3780907, 1, 1, 1, 1, 1,
0.2431035, 1.264691, 1.3633, 1, 1, 1, 1, 1,
0.251821, 0.2538351, 0.8007141, 1, 1, 1, 1, 1,
0.2556433, 1.047393, -0.4007384, 1, 1, 1, 1, 1,
0.2573488, 0.7557725, -0.0001665429, 1, 1, 1, 1, 1,
0.2656465, 0.2586615, 1.272444, 1, 1, 1, 1, 1,
0.2662485, 0.0267663, 2.133482, 0, 0, 1, 1, 1,
0.2665588, -0.4492891, 3.11946, 1, 0, 0, 1, 1,
0.2667976, 0.5134535, 2.41267, 1, 0, 0, 1, 1,
0.2718634, -1.11835, 1.534137, 1, 0, 0, 1, 1,
0.2750881, 0.4904796, -0.1990948, 1, 0, 0, 1, 1,
0.275445, -2.208574, 2.338743, 1, 0, 0, 1, 1,
0.2791842, 0.2246205, -0.9273056, 0, 0, 0, 1, 1,
0.2804687, 0.5681716, -0.4408291, 0, 0, 0, 1, 1,
0.2817369, -0.2029712, 2.607503, 0, 0, 0, 1, 1,
0.2831689, 0.2705416, -1.733138, 0, 0, 0, 1, 1,
0.2853273, -0.2757491, 3.783334, 0, 0, 0, 1, 1,
0.2859796, -1.227604, 2.887981, 0, 0, 0, 1, 1,
0.2872994, 0.4383326, -0.2676877, 0, 0, 0, 1, 1,
0.2904029, 0.2814434, 1.732288, 1, 1, 1, 1, 1,
0.2982428, 0.1585359, 0.2290549, 1, 1, 1, 1, 1,
0.3029177, -0.6302757, 1.880777, 1, 1, 1, 1, 1,
0.303331, -0.8704586, 4.749336, 1, 1, 1, 1, 1,
0.3043847, -0.6633551, 3.574987, 1, 1, 1, 1, 1,
0.3047199, 0.4667109, -1.729162, 1, 1, 1, 1, 1,
0.3069507, 0.6338821, -0.3717598, 1, 1, 1, 1, 1,
0.3109227, 0.4243079, -0.7710811, 1, 1, 1, 1, 1,
0.3121067, 0.2239363, -1.133842, 1, 1, 1, 1, 1,
0.3215546, 0.2479938, 0.9309559, 1, 1, 1, 1, 1,
0.3226644, -0.06667472, 3.757594, 1, 1, 1, 1, 1,
0.3234621, -0.6337981, 4.665431, 1, 1, 1, 1, 1,
0.3242214, 0.4010786, -0.4850869, 1, 1, 1, 1, 1,
0.3248741, -0.9303372, 4.545625, 1, 1, 1, 1, 1,
0.3288163, -0.6240788, 2.858424, 1, 1, 1, 1, 1,
0.3349855, 1.389933, 1.295446, 0, 0, 1, 1, 1,
0.3436154, 0.1637338, 1.26149, 1, 0, 0, 1, 1,
0.3599494, 0.450899, 0.4212894, 1, 0, 0, 1, 1,
0.3608177, 0.2271508, 3.017725, 1, 0, 0, 1, 1,
0.3663351, -0.6888664, 2.171564, 1, 0, 0, 1, 1,
0.3733987, -0.8266381, 1.390038, 1, 0, 0, 1, 1,
0.373462, -0.6737715, 2.149705, 0, 0, 0, 1, 1,
0.3742506, -0.6148017, 4.571593, 0, 0, 0, 1, 1,
0.3749624, 0.8551702, -0.5406977, 0, 0, 0, 1, 1,
0.3759054, -0.2561243, 2.806685, 0, 0, 0, 1, 1,
0.3770633, -0.1044782, 3.071136, 0, 0, 0, 1, 1,
0.3787515, -0.1782331, 2.357176, 0, 0, 0, 1, 1,
0.3790197, 0.5198244, -0.1402785, 0, 0, 0, 1, 1,
0.3799761, 0.414783, 1.493922, 1, 1, 1, 1, 1,
0.3852557, 0.7827889, 2.23622, 1, 1, 1, 1, 1,
0.386022, 1.106371, 0.3038878, 1, 1, 1, 1, 1,
0.3904133, -0.2774761, 2.739837, 1, 1, 1, 1, 1,
0.3929245, 1.70705, 0.8743299, 1, 1, 1, 1, 1,
0.3949924, 0.374689, -0.562614, 1, 1, 1, 1, 1,
0.3971174, -0.4210218, 3.431772, 1, 1, 1, 1, 1,
0.4012648, -0.8883834, 3.195905, 1, 1, 1, 1, 1,
0.4013529, 0.8236213, 0.2874018, 1, 1, 1, 1, 1,
0.4125391, 0.1084025, 0.5105789, 1, 1, 1, 1, 1,
0.4152625, -0.4202341, 2.054687, 1, 1, 1, 1, 1,
0.4159122, -0.01590822, 1.854964, 1, 1, 1, 1, 1,
0.4259971, 0.5124168, 0.7618544, 1, 1, 1, 1, 1,
0.428433, -1.087172, 2.133269, 1, 1, 1, 1, 1,
0.4318016, -0.2391672, 2.838956, 1, 1, 1, 1, 1,
0.4514647, -2.78155, 3.192802, 0, 0, 1, 1, 1,
0.4539887, -0.3642912, 1.964875, 1, 0, 0, 1, 1,
0.455062, 0.1619015, 0.1661375, 1, 0, 0, 1, 1,
0.4578865, -0.697925, 3.622039, 1, 0, 0, 1, 1,
0.4581722, 0.8858627, 0.2077265, 1, 0, 0, 1, 1,
0.4597594, -0.7027331, 4.098549, 1, 0, 0, 1, 1,
0.4623349, 0.4979194, 3.643998, 0, 0, 0, 1, 1,
0.464165, 0.786877, -0.1156505, 0, 0, 0, 1, 1,
0.4713291, -0.5038472, 1.522914, 0, 0, 0, 1, 1,
0.4728201, -1.836727, 2.116453, 0, 0, 0, 1, 1,
0.4806767, -0.6337674, 2.486464, 0, 0, 0, 1, 1,
0.4834811, -0.6656626, 2.669255, 0, 0, 0, 1, 1,
0.4840336, 0.5040555, 1.03967, 0, 0, 0, 1, 1,
0.4873308, -0.6550484, 2.031522, 1, 1, 1, 1, 1,
0.4884381, 0.2734668, 1.135157, 1, 1, 1, 1, 1,
0.4912156, 0.7783439, 0.5891969, 1, 1, 1, 1, 1,
0.4919744, 0.1335381, 0.6959753, 1, 1, 1, 1, 1,
0.4921192, 0.8621867, 0.1441906, 1, 1, 1, 1, 1,
0.4922675, -0.8714496, 3.042658, 1, 1, 1, 1, 1,
0.4972247, -0.3954614, 2.191324, 1, 1, 1, 1, 1,
0.5063866, 0.1952181, 0.7694155, 1, 1, 1, 1, 1,
0.5080094, -0.2729926, 1.909598, 1, 1, 1, 1, 1,
0.5154386, -1.515267, 2.639273, 1, 1, 1, 1, 1,
0.5192522, -0.9127634, 3.66031, 1, 1, 1, 1, 1,
0.5195335, 1.60406, 0.7902024, 1, 1, 1, 1, 1,
0.5306039, 0.9091375, 0.7980185, 1, 1, 1, 1, 1,
0.5311372, -0.2487557, 2.534766, 1, 1, 1, 1, 1,
0.5330189, -0.4740397, 3.636727, 1, 1, 1, 1, 1,
0.5339336, 0.4842514, 1.524979, 0, 0, 1, 1, 1,
0.5363162, -0.5484729, 3.318915, 1, 0, 0, 1, 1,
0.5374768, -0.8709809, 2.027187, 1, 0, 0, 1, 1,
0.5388212, 2.298279, -0.9849014, 1, 0, 0, 1, 1,
0.5423034, -0.2071867, 1.037246, 1, 0, 0, 1, 1,
0.5435648, -0.7647518, 2.909292, 1, 0, 0, 1, 1,
0.5501491, 1.064019, 0.9398408, 0, 0, 0, 1, 1,
0.5504767, -2.565172, 2.525119, 0, 0, 0, 1, 1,
0.5520326, 0.07775176, -0.2904581, 0, 0, 0, 1, 1,
0.5530321, -1.818313, 5.540703, 0, 0, 0, 1, 1,
0.5572459, 0.2971767, 0.816582, 0, 0, 0, 1, 1,
0.5589625, -1.661121, 4.711437, 0, 0, 0, 1, 1,
0.5630379, 1.330739, -1.606606, 0, 0, 0, 1, 1,
0.5644236, -0.2649412, 1.196633, 1, 1, 1, 1, 1,
0.5655022, -1.932994, 3.354021, 1, 1, 1, 1, 1,
0.5673187, -0.09562093, 1.159586, 1, 1, 1, 1, 1,
0.5740263, 0.05964707, 1.450685, 1, 1, 1, 1, 1,
0.5757399, 0.8605453, -0.3102925, 1, 1, 1, 1, 1,
0.5812495, 0.06768053, 1.720766, 1, 1, 1, 1, 1,
0.5821939, -0.3290551, 1.250887, 1, 1, 1, 1, 1,
0.5857924, -1.333692, 3.337564, 1, 1, 1, 1, 1,
0.5861102, 0.6195109, 1.166827, 1, 1, 1, 1, 1,
0.5865523, -1.363248, 2.782331, 1, 1, 1, 1, 1,
0.5874843, 1.92697, 0.1165932, 1, 1, 1, 1, 1,
0.5938822, 0.05407264, 1.829462, 1, 1, 1, 1, 1,
0.5989348, 0.05177673, 1.681555, 1, 1, 1, 1, 1,
0.603912, -0.0835209, 3.172765, 1, 1, 1, 1, 1,
0.6120036, 0.4563203, 0.02406173, 1, 1, 1, 1, 1,
0.6182637, 0.06729926, 2.103144, 0, 0, 1, 1, 1,
0.6190867, 0.2416984, 0.4025565, 1, 0, 0, 1, 1,
0.6268594, 2.190263, 0.2788369, 1, 0, 0, 1, 1,
0.638679, 0.3983043, 2.537583, 1, 0, 0, 1, 1,
0.6397041, 0.3488089, 0.4919356, 1, 0, 0, 1, 1,
0.6397911, -1.036918, 0.6492701, 1, 0, 0, 1, 1,
0.6400332, -1.630156, 2.557599, 0, 0, 0, 1, 1,
0.6415277, 0.5357271, -0.2771339, 0, 0, 0, 1, 1,
0.6443631, 0.4100306, 1.68855, 0, 0, 0, 1, 1,
0.6478035, 1.315603, 0.3959957, 0, 0, 0, 1, 1,
0.648309, 0.7454591, 2.482055, 0, 0, 0, 1, 1,
0.6550449, 2.742158, 0.7038414, 0, 0, 0, 1, 1,
0.6561426, 0.5555745, 0.4426557, 0, 0, 0, 1, 1,
0.6591628, 0.323715, 0.8889725, 1, 1, 1, 1, 1,
0.6593843, 0.1553196, 2.233929, 1, 1, 1, 1, 1,
0.6620432, -0.070914, 0.3315019, 1, 1, 1, 1, 1,
0.6651216, 0.3286448, 1.400928, 1, 1, 1, 1, 1,
0.6703098, 1.886915, 0.980125, 1, 1, 1, 1, 1,
0.6783435, 0.4479797, -0.4435513, 1, 1, 1, 1, 1,
0.6793799, -0.1780707, 1.732427, 1, 1, 1, 1, 1,
0.6893402, 1.577394, 1.177058, 1, 1, 1, 1, 1,
0.6915681, -0.6937958, 1.674187, 1, 1, 1, 1, 1,
0.6972495, -1.415243, 3.477744, 1, 1, 1, 1, 1,
0.6989275, -0.7269308, 2.691921, 1, 1, 1, 1, 1,
0.7093748, 0.2553722, -0.4901773, 1, 1, 1, 1, 1,
0.7107427, -0.2640491, 1.383206, 1, 1, 1, 1, 1,
0.7107547, -1.631017, 3.157985, 1, 1, 1, 1, 1,
0.7117592, -1.031938, 2.493952, 1, 1, 1, 1, 1,
0.7187488, -1.248059, 4.44192, 0, 0, 1, 1, 1,
0.7246162, 0.02650768, 1.220977, 1, 0, 0, 1, 1,
0.7273947, -0.795055, 2.68545, 1, 0, 0, 1, 1,
0.7306412, -0.2331984, 1.712884, 1, 0, 0, 1, 1,
0.7337717, -1.694544, 2.786146, 1, 0, 0, 1, 1,
0.7355053, -0.3224787, 0.5333076, 1, 0, 0, 1, 1,
0.7410116, -0.198782, 1.644464, 0, 0, 0, 1, 1,
0.75441, -0.2655364, 3.744303, 0, 0, 0, 1, 1,
0.7559216, -0.7339592, 3.15708, 0, 0, 0, 1, 1,
0.7663268, -0.2759515, 2.844468, 0, 0, 0, 1, 1,
0.7670666, -0.1826719, 1.883699, 0, 0, 0, 1, 1,
0.7712521, -0.3957945, 1.090539, 0, 0, 0, 1, 1,
0.7738659, -1.096844, 3.984643, 0, 0, 0, 1, 1,
0.7745822, -1.455563, 3.193917, 1, 1, 1, 1, 1,
0.7746971, -0.8928996, 0.4247467, 1, 1, 1, 1, 1,
0.77705, 0.904009, 0.868606, 1, 1, 1, 1, 1,
0.7829241, -0.1951741, 1.970232, 1, 1, 1, 1, 1,
0.7862997, 0.5295603, 1.02108, 1, 1, 1, 1, 1,
0.7900022, 1.823229, 1.041753, 1, 1, 1, 1, 1,
0.7916479, -1.334831, 2.975487, 1, 1, 1, 1, 1,
0.7971508, -0.4839311, 1.276937, 1, 1, 1, 1, 1,
0.8048179, 0.1451379, 1.326783, 1, 1, 1, 1, 1,
0.8108185, -0.4531089, 3.252663, 1, 1, 1, 1, 1,
0.811505, 1.134584, 1.297462, 1, 1, 1, 1, 1,
0.8148127, -0.3499396, 2.879307, 1, 1, 1, 1, 1,
0.8296285, -0.952942, 3.636305, 1, 1, 1, 1, 1,
0.8347428, 0.7271032, -1.278225, 1, 1, 1, 1, 1,
0.8364398, -0.4577718, 3.345762, 1, 1, 1, 1, 1,
0.8375947, 0.2660729, 2.137031, 0, 0, 1, 1, 1,
0.8384629, 0.9142722, 1.216215, 1, 0, 0, 1, 1,
0.8387823, 2.817773, -1.160556, 1, 0, 0, 1, 1,
0.8391575, 0.3953883, 3.121393, 1, 0, 0, 1, 1,
0.8458067, 0.2244373, 1.435544, 1, 0, 0, 1, 1,
0.8467365, -0.1780109, 2.153691, 1, 0, 0, 1, 1,
0.8543978, -0.9043468, 2.002422, 0, 0, 0, 1, 1,
0.8547227, -0.3133818, 1.563408, 0, 0, 0, 1, 1,
0.8564305, 1.128799, 2.06117, 0, 0, 0, 1, 1,
0.8657045, 1.886987, 0.8799407, 0, 0, 0, 1, 1,
0.8659135, -0.939189, 2.915006, 0, 0, 0, 1, 1,
0.8669856, -1.882518, 4.319401, 0, 0, 0, 1, 1,
0.8670583, -0.1515683, -0.3438464, 0, 0, 0, 1, 1,
0.874953, -0.9149957, 3.813194, 1, 1, 1, 1, 1,
0.8813174, 0.516121, 0.7422543, 1, 1, 1, 1, 1,
0.8818108, 1.522291, 0.2230403, 1, 1, 1, 1, 1,
0.890176, 1.169725, 0.3112553, 1, 1, 1, 1, 1,
0.8911793, -1.917655, 2.656787, 1, 1, 1, 1, 1,
0.8960804, -0.05433284, 1.98185, 1, 1, 1, 1, 1,
0.896757, 1.284229, 0.9023647, 1, 1, 1, 1, 1,
0.8977181, 0.1074852, 0.5735589, 1, 1, 1, 1, 1,
0.8983287, -0.003285432, 3.106374, 1, 1, 1, 1, 1,
0.9001814, 1.169474, 1.690137, 1, 1, 1, 1, 1,
0.904914, -0.3853172, 0.6113759, 1, 1, 1, 1, 1,
0.9112579, -0.634784, 1.985418, 1, 1, 1, 1, 1,
0.9127055, -0.7167012, 2.964562, 1, 1, 1, 1, 1,
0.9131317, 1.464155, -0.8608449, 1, 1, 1, 1, 1,
0.9145426, 1.36074, 0.9987751, 1, 1, 1, 1, 1,
0.9150659, 0.4260882, -0.1769966, 0, 0, 1, 1, 1,
0.9203713, -0.9685296, 1.956958, 1, 0, 0, 1, 1,
0.926714, -0.1487075, 3.137199, 1, 0, 0, 1, 1,
0.9324261, -2.832255, 3.269969, 1, 0, 0, 1, 1,
0.9327542, -0.8142247, 2.753048, 1, 0, 0, 1, 1,
0.938757, 0.5926616, 1.444805, 1, 0, 0, 1, 1,
0.9509618, 0.3219444, 0.01774302, 0, 0, 0, 1, 1,
0.9554477, -1.176479, 3.519828, 0, 0, 0, 1, 1,
0.9567188, -0.2149073, 1.413136, 0, 0, 0, 1, 1,
0.963037, -0.1151309, 3.562276, 0, 0, 0, 1, 1,
0.9680821, 1.676288, 1.222325, 0, 0, 0, 1, 1,
0.9727052, 0.5103517, 0.9953266, 0, 0, 0, 1, 1,
0.9745886, -0.5593249, 1.872459, 0, 0, 0, 1, 1,
0.9790649, -0.2656018, 2.488632, 1, 1, 1, 1, 1,
0.9860461, -0.4473281, 2.132926, 1, 1, 1, 1, 1,
0.9875308, -0.6046575, 2.765065, 1, 1, 1, 1, 1,
0.9904731, -1.355947, 2.999141, 1, 1, 1, 1, 1,
0.9945962, -0.1298791, 0.6240082, 1, 1, 1, 1, 1,
0.9947358, -1.918512, 3.744484, 1, 1, 1, 1, 1,
0.995242, -0.04799217, 1.977665, 1, 1, 1, 1, 1,
0.9974743, -0.3689693, 0.2867694, 1, 1, 1, 1, 1,
1.004885, 0.3112772, 0.670503, 1, 1, 1, 1, 1,
1.005395, -1.355358, 1.734623, 1, 1, 1, 1, 1,
1.01108, 1.076742, 0.2354733, 1, 1, 1, 1, 1,
1.012346, -0.9513978, 2.293286, 1, 1, 1, 1, 1,
1.017224, 1.412107, -0.3613792, 1, 1, 1, 1, 1,
1.01953, -1.00482, 2.912953, 1, 1, 1, 1, 1,
1.027075, 0.9126065, 0.9726697, 1, 1, 1, 1, 1,
1.027226, -0.4347329, 1.183944, 0, 0, 1, 1, 1,
1.028722, -0.9768709, 3.060664, 1, 0, 0, 1, 1,
1.030529, 0.1642186, 1.707383, 1, 0, 0, 1, 1,
1.045009, 0.8979875, 1.298557, 1, 0, 0, 1, 1,
1.046685, 0.5739049, 1.016069, 1, 0, 0, 1, 1,
1.05124, 1.060192, 0.4918757, 1, 0, 0, 1, 1,
1.052505, 0.3227071, 2.209529, 0, 0, 0, 1, 1,
1.05698, -0.1587562, 1.585992, 0, 0, 0, 1, 1,
1.057797, -0.4785087, 1.757346, 0, 0, 0, 1, 1,
1.062966, -0.5322362, 2.134259, 0, 0, 0, 1, 1,
1.073147, -0.4300173, 2.597437, 0, 0, 0, 1, 1,
1.078784, -0.137582, 1.770283, 0, 0, 0, 1, 1,
1.080567, 1.406942, -0.7153605, 0, 0, 0, 1, 1,
1.082223, 0.2606035, 1.67641, 1, 1, 1, 1, 1,
1.085568, 0.3021549, 0.7021754, 1, 1, 1, 1, 1,
1.088414, 0.264948, 1.685744, 1, 1, 1, 1, 1,
1.102605, -0.6305582, 2.399217, 1, 1, 1, 1, 1,
1.110173, -0.4841241, 3.064746, 1, 1, 1, 1, 1,
1.115327, -0.1439469, 0.4396999, 1, 1, 1, 1, 1,
1.115903, -1.096926, 2.125538, 1, 1, 1, 1, 1,
1.131834, 0.5240176, 1.572464, 1, 1, 1, 1, 1,
1.134298, -0.5309561, 2.00296, 1, 1, 1, 1, 1,
1.139986, -0.3033095, 1.47981, 1, 1, 1, 1, 1,
1.141427, -1.329787, 0.8667026, 1, 1, 1, 1, 1,
1.144047, 1.242085, 1.001458, 1, 1, 1, 1, 1,
1.145632, 0.06228063, 0.05458199, 1, 1, 1, 1, 1,
1.146711, -0.7324787, 1.666707, 1, 1, 1, 1, 1,
1.14749, 0.6553869, 2.387242, 1, 1, 1, 1, 1,
1.156296, -0.8004181, 3.924188, 0, 0, 1, 1, 1,
1.158099, -1.372635, 2.569415, 1, 0, 0, 1, 1,
1.158638, 0.4741295, -0.1006216, 1, 0, 0, 1, 1,
1.161554, 0.08984839, 2.240508, 1, 0, 0, 1, 1,
1.163156, -0.5746875, 3.823744, 1, 0, 0, 1, 1,
1.173845, 0.8663597, 2.64208, 1, 0, 0, 1, 1,
1.179141, -2.288372, 3.471346, 0, 0, 0, 1, 1,
1.183932, -0.1864071, 2.479121, 0, 0, 0, 1, 1,
1.185844, 2.183277, 0.01346277, 0, 0, 0, 1, 1,
1.186035, -0.8071839, 2.648046, 0, 0, 0, 1, 1,
1.190318, 1.372006, 0.601498, 0, 0, 0, 1, 1,
1.197074, -0.343922, 3.140203, 0, 0, 0, 1, 1,
1.199677, 1.193859, 4.31337, 0, 0, 0, 1, 1,
1.204482, -1.311309, 2.803947, 1, 1, 1, 1, 1,
1.204701, 0.1952363, 1.034458, 1, 1, 1, 1, 1,
1.225581, -0.7298713, 0.392886, 1, 1, 1, 1, 1,
1.226385, 1.152255, 0.7899035, 1, 1, 1, 1, 1,
1.226579, -0.6257529, 2.775855, 1, 1, 1, 1, 1,
1.228697, -0.295783, 1.626124, 1, 1, 1, 1, 1,
1.228769, 0.2588531, 1.923924, 1, 1, 1, 1, 1,
1.232374, -0.7022941, 0.7695627, 1, 1, 1, 1, 1,
1.245615, 0.258059, 1.665401, 1, 1, 1, 1, 1,
1.257494, -1.104341, 1.649614, 1, 1, 1, 1, 1,
1.267657, -0.6685419, 0.8635042, 1, 1, 1, 1, 1,
1.270182, 1.265059, 1.728414, 1, 1, 1, 1, 1,
1.273642, 1.672933, 1.532629, 1, 1, 1, 1, 1,
1.276108, 0.05467646, 1.254967, 1, 1, 1, 1, 1,
1.285207, -1.480025, 3.567691, 1, 1, 1, 1, 1,
1.288037, 1.071645, 1.3658, 0, 0, 1, 1, 1,
1.288073, 0.4039009, 0.162505, 1, 0, 0, 1, 1,
1.300003, -1.272029, 2.394912, 1, 0, 0, 1, 1,
1.306018, 0.1259393, 0.4369623, 1, 0, 0, 1, 1,
1.310611, 0.04973897, 0.8197423, 1, 0, 0, 1, 1,
1.315885, 2.530146, 1.486412, 1, 0, 0, 1, 1,
1.316287, -1.855235, 1.368086, 0, 0, 0, 1, 1,
1.318704, -0.2889709, 1.304206, 0, 0, 0, 1, 1,
1.322196, -0.1150893, 0.6710661, 0, 0, 0, 1, 1,
1.33108, -1.575102, 2.285972, 0, 0, 0, 1, 1,
1.337352, 1.164055, 1.86221, 0, 0, 0, 1, 1,
1.338496, 0.6796068, 0.7561094, 0, 0, 0, 1, 1,
1.346066, -0.1718013, 1.328497, 0, 0, 0, 1, 1,
1.368903, 0.3212461, 0.8480158, 1, 1, 1, 1, 1,
1.375791, 0.1999207, 1.518116, 1, 1, 1, 1, 1,
1.377262, 0.6873499, 1.524528, 1, 1, 1, 1, 1,
1.379526, -0.1547731, 1.89022, 1, 1, 1, 1, 1,
1.382088, -0.480536, 0.825155, 1, 1, 1, 1, 1,
1.386267, 0.01798716, 3.910833, 1, 1, 1, 1, 1,
1.400676, 0.2334948, 2.125941, 1, 1, 1, 1, 1,
1.401964, -0.4840934, 1.863666, 1, 1, 1, 1, 1,
1.414041, -0.1730692, 1.302739, 1, 1, 1, 1, 1,
1.417949, -2.42744, 4.660626, 1, 1, 1, 1, 1,
1.423275, -1.599668, 3.18582, 1, 1, 1, 1, 1,
1.423744, 2.01038, -1.64178, 1, 1, 1, 1, 1,
1.441036, 1.425492, 1.076826, 1, 1, 1, 1, 1,
1.447859, 1.331392, 0.6298794, 1, 1, 1, 1, 1,
1.449275, 1.807998, 0.5689443, 1, 1, 1, 1, 1,
1.454968, -0.9419201, 2.970427, 0, 0, 1, 1, 1,
1.457721, -0.03906118, 1.547185, 1, 0, 0, 1, 1,
1.458111, -2.407085, 3.128908, 1, 0, 0, 1, 1,
1.460157, -0.1675395, 1.357668, 1, 0, 0, 1, 1,
1.471952, 0.8621309, 1.045636, 1, 0, 0, 1, 1,
1.481776, -0.2083501, 0.6734452, 1, 0, 0, 1, 1,
1.503401, -1.284463, 2.058281, 0, 0, 0, 1, 1,
1.511331, 2.20377, 2.087662, 0, 0, 0, 1, 1,
1.513397, 0.2361494, 2.331458, 0, 0, 0, 1, 1,
1.53072, -0.9380589, 2.861927, 0, 0, 0, 1, 1,
1.531795, -0.2913442, 2.294127, 0, 0, 0, 1, 1,
1.53274, 1.144651, 0.1799797, 0, 0, 0, 1, 1,
1.533614, 0.391541, 1.536826, 0, 0, 0, 1, 1,
1.548523, -1.340062, 2.26421, 1, 1, 1, 1, 1,
1.555144, -1.988054, 1.751029, 1, 1, 1, 1, 1,
1.555908, -0.6287184, 1.380301, 1, 1, 1, 1, 1,
1.557328, 0.5591151, 0.7554959, 1, 1, 1, 1, 1,
1.564787, 0.1137201, 0.909211, 1, 1, 1, 1, 1,
1.566935, -0.1326389, 1.879202, 1, 1, 1, 1, 1,
1.569002, -1.767729, 1.714949, 1, 1, 1, 1, 1,
1.573956, -0.06559326, -0.3139107, 1, 1, 1, 1, 1,
1.575882, -1.73271, 2.928734, 1, 1, 1, 1, 1,
1.597506, -1.43887, 1.701865, 1, 1, 1, 1, 1,
1.597884, -0.3253714, 1.402015, 1, 1, 1, 1, 1,
1.598745, 0.9731051, 0.6619985, 1, 1, 1, 1, 1,
1.602358, 0.4033404, 0.1458687, 1, 1, 1, 1, 1,
1.606041, 0.7547939, 0.585515, 1, 1, 1, 1, 1,
1.610666, 0.159181, 1.338065, 1, 1, 1, 1, 1,
1.622069, -0.4164445, 0.8113457, 0, 0, 1, 1, 1,
1.624229, -1.17532, 0.8730895, 1, 0, 0, 1, 1,
1.648759, -1.4387, 1.645519, 1, 0, 0, 1, 1,
1.64882, 1.16025, 1.64558, 1, 0, 0, 1, 1,
1.657551, 0.7025821, 0.3687145, 1, 0, 0, 1, 1,
1.659823, -1.021544, 0.9370497, 1, 0, 0, 1, 1,
1.677931, -2.08387, 1.993185, 0, 0, 0, 1, 1,
1.688237, 1.496642, 1.211294, 0, 0, 0, 1, 1,
1.697888, 0.05339575, 1.724895, 0, 0, 0, 1, 1,
1.698578, -0.7687106, 2.474315, 0, 0, 0, 1, 1,
1.69911, -1.19605, 1.178131, 0, 0, 0, 1, 1,
1.703537, -1.260747, 2.892813, 0, 0, 0, 1, 1,
1.706635, -1.011661, 2.362199, 0, 0, 0, 1, 1,
1.714496, -0.2527814, 1.361898, 1, 1, 1, 1, 1,
1.72848, -0.2668001, 2.080244, 1, 1, 1, 1, 1,
1.757713, 1.019146, 1.540396, 1, 1, 1, 1, 1,
1.767673, 1.874396, 0.1253481, 1, 1, 1, 1, 1,
1.775498, -0.1047625, 2.463845, 1, 1, 1, 1, 1,
1.776507, -2.164257, 2.787448, 1, 1, 1, 1, 1,
1.779421, -0.2979605, 2.253833, 1, 1, 1, 1, 1,
1.796816, -0.221008, 0.4306197, 1, 1, 1, 1, 1,
1.834683, 0.01865806, 1.591107, 1, 1, 1, 1, 1,
1.87407, -1.070929, 4.510071, 1, 1, 1, 1, 1,
1.881095, 1.725759, 0.1127018, 1, 1, 1, 1, 1,
1.895398, -0.7369989, 3.976223, 1, 1, 1, 1, 1,
1.918654, 1.508242, 0.6514497, 1, 1, 1, 1, 1,
1.94232, -1.02905, 2.460135, 1, 1, 1, 1, 1,
1.943814, 0.6239775, 0.3762359, 1, 1, 1, 1, 1,
1.958936, -1.127288, 0.7293317, 0, 0, 1, 1, 1,
1.99818, 1.485487, 0.6647786, 1, 0, 0, 1, 1,
2.050722, 0.7042834, 3.442399, 1, 0, 0, 1, 1,
2.067486, -1.061321, 2.328634, 1, 0, 0, 1, 1,
2.157977, -0.4080928, 3.494416, 1, 0, 0, 1, 1,
2.18337, -1.557879, 0.5933121, 1, 0, 0, 1, 1,
2.1905, 0.3322898, -1.363517, 0, 0, 0, 1, 1,
2.250419, -0.5157503, 2.883565, 0, 0, 0, 1, 1,
2.260249, -0.5430294, -0.03914813, 0, 0, 0, 1, 1,
2.270582, -1.176966, 3.307463, 0, 0, 0, 1, 1,
2.28049, -0.5833929, 1.990059, 0, 0, 0, 1, 1,
2.295507, 0.1961694, 2.130409, 0, 0, 0, 1, 1,
2.31299, 2.158586, 1.500584, 0, 0, 0, 1, 1,
2.370539, -0.6189378, 0.446778, 1, 1, 1, 1, 1,
2.383486, 0.17065, 0.3467324, 1, 1, 1, 1, 1,
2.389092, 0.3397687, 1.15086, 1, 1, 1, 1, 1,
2.407274, 0.6186179, 1.993096, 1, 1, 1, 1, 1,
2.558762, -0.1052106, 2.690603, 1, 1, 1, 1, 1,
2.636208, -0.7174278, 1.135566, 1, 1, 1, 1, 1,
2.905566, -1.471823, 1.323343, 1, 1, 1, 1, 1
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
var radius = 9.622298;
var distance = 33.79792;
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
mvMatrix.translate( 0.1863842, 0.1622419, -0.155674 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.79792);
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
