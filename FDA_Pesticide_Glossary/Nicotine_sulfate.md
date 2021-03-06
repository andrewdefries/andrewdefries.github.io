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
-2.896967, 1.174535, 0.74753, 1, 0, 0, 1,
-2.836898, 0.3720194, 0.5009051, 1, 0.007843138, 0, 1,
-2.693691, -0.05387888, -1.332504, 1, 0.01176471, 0, 1,
-2.474122, -2.332443, -3.576639, 1, 0.01960784, 0, 1,
-2.432993, 0.01623425, -1.536834, 1, 0.02352941, 0, 1,
-2.417582, 0.2668704, 0.1987075, 1, 0.03137255, 0, 1,
-2.379678, 0.4461261, -0.3532492, 1, 0.03529412, 0, 1,
-2.319043, 0.5570803, -1.773311, 1, 0.04313726, 0, 1,
-2.315071, -1.012385, -3.264122, 1, 0.04705882, 0, 1,
-2.294469, 0.0827817, -1.707716, 1, 0.05490196, 0, 1,
-2.236913, 0.639969, -0.2894215, 1, 0.05882353, 0, 1,
-2.204858, -0.3669907, -2.312216, 1, 0.06666667, 0, 1,
-2.169042, -0.575422, -0.888808, 1, 0.07058824, 0, 1,
-2.126753, -0.2007951, -0.7538007, 1, 0.07843138, 0, 1,
-2.103889, 0.7935482, -1.387914, 1, 0.08235294, 0, 1,
-2.081376, -0.7767605, 0.03068306, 1, 0.09019608, 0, 1,
-2.037488, 0.9358696, -1.759978, 1, 0.09411765, 0, 1,
-2.020521, 0.8393532, -0.9105405, 1, 0.1019608, 0, 1,
-1.97351, 1.025595, -1.687857, 1, 0.1098039, 0, 1,
-1.902507, 0.637279, -2.690358, 1, 0.1137255, 0, 1,
-1.902328, 0.8347332, -1.731798, 1, 0.1215686, 0, 1,
-1.882238, 1.798219, -1.843414, 1, 0.1254902, 0, 1,
-1.881276, -1.559505, -1.976426, 1, 0.1333333, 0, 1,
-1.878949, 0.2139975, -1.712086, 1, 0.1372549, 0, 1,
-1.872127, 0.142328, -1.448127, 1, 0.145098, 0, 1,
-1.841079, 0.5618436, -0.8817226, 1, 0.1490196, 0, 1,
-1.840888, -0.9031895, -3.308685, 1, 0.1568628, 0, 1,
-1.83775, -1.033255, -3.345999, 1, 0.1607843, 0, 1,
-1.831437, -0.8981765, -1.806279, 1, 0.1686275, 0, 1,
-1.821151, 0.7327086, -1.885641, 1, 0.172549, 0, 1,
-1.81732, -0.6010453, -2.118513, 1, 0.1803922, 0, 1,
-1.803975, 2.063734, 1.279535, 1, 0.1843137, 0, 1,
-1.803272, -0.4810922, -1.256223, 1, 0.1921569, 0, 1,
-1.79925, 0.3474776, 0.6777868, 1, 0.1960784, 0, 1,
-1.799018, 0.5472114, -0.2799819, 1, 0.2039216, 0, 1,
-1.793289, -0.982783, -2.010106, 1, 0.2117647, 0, 1,
-1.742624, 0.4514919, -0.6209912, 1, 0.2156863, 0, 1,
-1.714694, 0.541545, 1.380432, 1, 0.2235294, 0, 1,
-1.705588, -1.19102, -2.060698, 1, 0.227451, 0, 1,
-1.705582, -0.7613199, -1.888026, 1, 0.2352941, 0, 1,
-1.705083, 1.796733, -1.115462, 1, 0.2392157, 0, 1,
-1.694503, 1.062503, -0.3144019, 1, 0.2470588, 0, 1,
-1.694268, 1.735805, 0.1597881, 1, 0.2509804, 0, 1,
-1.683243, -1.479862, -2.576116, 1, 0.2588235, 0, 1,
-1.656394, -0.007490225, 0.3535107, 1, 0.2627451, 0, 1,
-1.629404, 0.008912169, -2.431089, 1, 0.2705882, 0, 1,
-1.617641, 0.03999604, -3.756607, 1, 0.2745098, 0, 1,
-1.5896, 0.7564802, -1.234117, 1, 0.282353, 0, 1,
-1.575757, 0.3013477, -1.498931, 1, 0.2862745, 0, 1,
-1.571383, -0.3316563, -0.1683446, 1, 0.2941177, 0, 1,
-1.566845, -0.01041308, -0.1678345, 1, 0.3019608, 0, 1,
-1.558168, 1.574267, 0.005460777, 1, 0.3058824, 0, 1,
-1.542395, 0.8289272, 0.2752711, 1, 0.3137255, 0, 1,
-1.53677, -0.5313854, -3.54566, 1, 0.3176471, 0, 1,
-1.512077, -0.7676669, -1.905435, 1, 0.3254902, 0, 1,
-1.510343, -0.01383808, -1.020169, 1, 0.3294118, 0, 1,
-1.501716, -0.495196, -3.123154, 1, 0.3372549, 0, 1,
-1.494752, -2.332906, -4.00614, 1, 0.3411765, 0, 1,
-1.490215, 0.2206708, -0.6381884, 1, 0.3490196, 0, 1,
-1.469104, 0.3011626, -2.718287, 1, 0.3529412, 0, 1,
-1.460271, 2.472991, 0.436704, 1, 0.3607843, 0, 1,
-1.446805, -2.084923, -2.095628, 1, 0.3647059, 0, 1,
-1.444025, -1.225453, -1.819667, 1, 0.372549, 0, 1,
-1.442809, 1.397534, -1.637692, 1, 0.3764706, 0, 1,
-1.440035, -0.8828086, -1.975452, 1, 0.3843137, 0, 1,
-1.433451, 0.1844396, 0.1415719, 1, 0.3882353, 0, 1,
-1.431266, 0.6048512, 0.7522652, 1, 0.3960784, 0, 1,
-1.424547, 0.5181586, -2.895037, 1, 0.4039216, 0, 1,
-1.424039, 0.3260087, -0.3126828, 1, 0.4078431, 0, 1,
-1.40604, -0.7568759, -2.476111, 1, 0.4156863, 0, 1,
-1.40432, -0.1859203, -3.269686, 1, 0.4196078, 0, 1,
-1.400209, 0.3751882, -0.6050077, 1, 0.427451, 0, 1,
-1.391219, -0.5834665, -2.056751, 1, 0.4313726, 0, 1,
-1.383967, 0.6706804, -1.824065, 1, 0.4392157, 0, 1,
-1.381336, -0.3065009, -1.945319, 1, 0.4431373, 0, 1,
-1.370421, 0.7002875, -1.6295, 1, 0.4509804, 0, 1,
-1.369503, 0.3509854, -2.074462, 1, 0.454902, 0, 1,
-1.353576, -1.034831, -1.432981, 1, 0.4627451, 0, 1,
-1.351402, 1.229394, 0.8696206, 1, 0.4666667, 0, 1,
-1.349131, -0.08332247, 0.2935658, 1, 0.4745098, 0, 1,
-1.344931, 1.089303, -1.99714, 1, 0.4784314, 0, 1,
-1.334833, -1.731115, -2.398812, 1, 0.4862745, 0, 1,
-1.332469, -0.7048023, -2.640085, 1, 0.4901961, 0, 1,
-1.327458, 0.5560473, -1.901059, 1, 0.4980392, 0, 1,
-1.325171, -0.4001525, -2.045017, 1, 0.5058824, 0, 1,
-1.322191, 1.237624, -0.897154, 1, 0.509804, 0, 1,
-1.317751, 0.9448487, -0.448487, 1, 0.5176471, 0, 1,
-1.301962, -1.862841, -1.246741, 1, 0.5215687, 0, 1,
-1.289739, 1.144924, -1.471504, 1, 0.5294118, 0, 1,
-1.283234, 0.3801135, -1.650566, 1, 0.5333334, 0, 1,
-1.275746, 0.4110405, -1.62718, 1, 0.5411765, 0, 1,
-1.273769, -0.5584293, -0.2101192, 1, 0.5450981, 0, 1,
-1.266641, 0.2120543, 0.230189, 1, 0.5529412, 0, 1,
-1.258844, 0.2723977, -0.4074281, 1, 0.5568628, 0, 1,
-1.256343, -0.2487087, -1.471567, 1, 0.5647059, 0, 1,
-1.252736, -0.8829922, -1.179997, 1, 0.5686275, 0, 1,
-1.251627, 1.324253, -0.4093198, 1, 0.5764706, 0, 1,
-1.250349, 1.412176, -1.388163, 1, 0.5803922, 0, 1,
-1.244055, 0.3573749, -1.228118, 1, 0.5882353, 0, 1,
-1.224686, -1.637307, -1.482634, 1, 0.5921569, 0, 1,
-1.223383, 2.532612, -0.1332123, 1, 0.6, 0, 1,
-1.221983, 2.061444, -1.858255, 1, 0.6078432, 0, 1,
-1.185907, 0.2806615, -1.331169, 1, 0.6117647, 0, 1,
-1.185683, -0.1062307, -1.596648, 1, 0.6196079, 0, 1,
-1.180112, -1.070446, -1.506567, 1, 0.6235294, 0, 1,
-1.179248, -1.471022, -2.368309, 1, 0.6313726, 0, 1,
-1.171074, 0.2277817, -1.974354, 1, 0.6352941, 0, 1,
-1.16557, -0.3526664, -3.826334, 1, 0.6431373, 0, 1,
-1.164687, -0.1917861, -0.8573832, 1, 0.6470588, 0, 1,
-1.156535, 2.143242, -0.775786, 1, 0.654902, 0, 1,
-1.150852, 0.178481, -2.159688, 1, 0.6588235, 0, 1,
-1.14104, -0.7779692, -0.2788163, 1, 0.6666667, 0, 1,
-1.12829, -0.05193114, -3.673743, 1, 0.6705883, 0, 1,
-1.125644, 0.04710665, -2.784409, 1, 0.6784314, 0, 1,
-1.124427, 1.672925, -0.9711123, 1, 0.682353, 0, 1,
-1.115403, -0.5108426, -2.507287, 1, 0.6901961, 0, 1,
-1.109324, -2.013496, -2.596686, 1, 0.6941177, 0, 1,
-1.102233, -1.178593, -1.92883, 1, 0.7019608, 0, 1,
-1.099497, 0.07484034, -0.603277, 1, 0.7098039, 0, 1,
-1.097388, -0.05015435, -0.6674486, 1, 0.7137255, 0, 1,
-1.08796, 0.05852292, -2.143793, 1, 0.7215686, 0, 1,
-1.078516, -0.1666338, -2.09587, 1, 0.7254902, 0, 1,
-1.075582, 0.2032322, -0.3950295, 1, 0.7333333, 0, 1,
-1.075001, -1.463715, -1.093249, 1, 0.7372549, 0, 1,
-1.067736, 0.01985934, -1.650981, 1, 0.7450981, 0, 1,
-1.066302, -1.393404, -2.301758, 1, 0.7490196, 0, 1,
-1.066, 0.2963756, 1.055853, 1, 0.7568628, 0, 1,
-1.057759, -1.177018, -3.030442, 1, 0.7607843, 0, 1,
-1.056084, -0.452887, -1.664782, 1, 0.7686275, 0, 1,
-1.05256, 0.02963343, -1.147906, 1, 0.772549, 0, 1,
-1.049694, -2.052449, -3.464436, 1, 0.7803922, 0, 1,
-1.049222, -1.950958, -4.64422, 1, 0.7843137, 0, 1,
-1.045381, -0.607213, -2.516479, 1, 0.7921569, 0, 1,
-1.037213, 0.7455193, 0.2269088, 1, 0.7960784, 0, 1,
-1.027025, -0.1566419, -1.246, 1, 0.8039216, 0, 1,
-1.011534, 1.193349, -3.07014, 1, 0.8117647, 0, 1,
-1.00571, -0.1301816, -3.104267, 1, 0.8156863, 0, 1,
-1.005159, 0.8454489, -1.17118, 1, 0.8235294, 0, 1,
-1.004927, 0.3802291, -1.286332, 1, 0.827451, 0, 1,
-1.003399, -0.3169222, 0.7257481, 1, 0.8352941, 0, 1,
-1.00209, -0.2667221, -2.379304, 1, 0.8392157, 0, 1,
-0.9940984, 1.305713, -0.1873173, 1, 0.8470588, 0, 1,
-0.9887445, 0.5716556, -0.04619996, 1, 0.8509804, 0, 1,
-0.9879317, 0.117282, -2.471839, 1, 0.8588235, 0, 1,
-0.9839699, -0.5822017, -3.132542, 1, 0.8627451, 0, 1,
-0.9816818, 0.7302517, 0.5905311, 1, 0.8705882, 0, 1,
-0.9742419, 0.6727498, -0.5784027, 1, 0.8745098, 0, 1,
-0.9723097, 1.144754, -1.037641, 1, 0.8823529, 0, 1,
-0.9678155, 0.9679368, 0.1213066, 1, 0.8862745, 0, 1,
-0.9559339, 1.251897, 0.0604472, 1, 0.8941177, 0, 1,
-0.9537265, 0.6759631, -1.306978, 1, 0.8980392, 0, 1,
-0.9527788, -0.1474469, -2.109491, 1, 0.9058824, 0, 1,
-0.9499658, 0.8529756, -1.388441, 1, 0.9137255, 0, 1,
-0.938931, 1.480589, -0.4084207, 1, 0.9176471, 0, 1,
-0.9386519, 2.638872, -1.398648, 1, 0.9254902, 0, 1,
-0.9372184, -0.9801312, -3.823159, 1, 0.9294118, 0, 1,
-0.933563, 0.4603494, -2.477753, 1, 0.9372549, 0, 1,
-0.9313199, -0.2720565, -2.067752, 1, 0.9411765, 0, 1,
-0.9299524, -1.536848, -3.621844, 1, 0.9490196, 0, 1,
-0.9156659, 0.8903044, -0.4286023, 1, 0.9529412, 0, 1,
-0.9140304, -0.3511157, 0.2635869, 1, 0.9607843, 0, 1,
-0.9080195, -0.4162917, -1.503993, 1, 0.9647059, 0, 1,
-0.9060091, -0.05985117, -2.578523, 1, 0.972549, 0, 1,
-0.9033297, -0.2145737, -2.235719, 1, 0.9764706, 0, 1,
-0.8956099, 0.6342774, 0.08817863, 1, 0.9843137, 0, 1,
-0.892658, 0.06813137, 0.9062127, 1, 0.9882353, 0, 1,
-0.8901399, 0.726283, 0.206347, 1, 0.9960784, 0, 1,
-0.8891844, -0.8449525, -2.547155, 0.9960784, 1, 0, 1,
-0.8849626, 2.179346, -0.8202953, 0.9921569, 1, 0, 1,
-0.8849265, -0.1244369, -3.006095, 0.9843137, 1, 0, 1,
-0.8718094, 0.1441394, -3.681106, 0.9803922, 1, 0, 1,
-0.8671218, 0.3205825, -1.881866, 0.972549, 1, 0, 1,
-0.8660724, -0.3772008, -3.048963, 0.9686275, 1, 0, 1,
-0.8593881, -1.134612, -4.302832, 0.9607843, 1, 0, 1,
-0.8587199, 2.074588, 0.4995978, 0.9568627, 1, 0, 1,
-0.8519645, -0.6228785, -0.5494244, 0.9490196, 1, 0, 1,
-0.847642, -1.182439, -2.040543, 0.945098, 1, 0, 1,
-0.8439716, 0.2658665, -3.544138, 0.9372549, 1, 0, 1,
-0.8351089, -0.1329385, -1.768057, 0.9333333, 1, 0, 1,
-0.8349177, 0.2962973, -1.33081, 0.9254902, 1, 0, 1,
-0.8283792, 0.5068549, 0.2709836, 0.9215686, 1, 0, 1,
-0.8203776, 0.6410961, -1.736654, 0.9137255, 1, 0, 1,
-0.8187122, -0.6084283, -2.848476, 0.9098039, 1, 0, 1,
-0.8154661, -0.9297767, -3.134352, 0.9019608, 1, 0, 1,
-0.8046237, -0.9956998, -3.846038, 0.8941177, 1, 0, 1,
-0.8038045, 3.032274, -0.4558441, 0.8901961, 1, 0, 1,
-0.8028445, -0.1060013, -2.072914, 0.8823529, 1, 0, 1,
-0.7993671, -0.2524205, -2.016099, 0.8784314, 1, 0, 1,
-0.7882941, -0.2367128, -2.154519, 0.8705882, 1, 0, 1,
-0.7866013, 0.6988612, 1.2652, 0.8666667, 1, 0, 1,
-0.7660474, 0.3326447, 0.3226456, 0.8588235, 1, 0, 1,
-0.7618099, 0.4861154, -1.464855, 0.854902, 1, 0, 1,
-0.7583914, 1.161115, -1.83549, 0.8470588, 1, 0, 1,
-0.7574386, -1.459112, -3.678549, 0.8431373, 1, 0, 1,
-0.7549441, -2.01745, -2.263163, 0.8352941, 1, 0, 1,
-0.7545403, -0.9209056, -0.931194, 0.8313726, 1, 0, 1,
-0.7543946, -0.2629398, -3.652049, 0.8235294, 1, 0, 1,
-0.7535427, 2.734402, -1.027804, 0.8196079, 1, 0, 1,
-0.7522684, -0.09484643, -1.312934, 0.8117647, 1, 0, 1,
-0.7475948, 0.1192753, -0.7944112, 0.8078431, 1, 0, 1,
-0.7475444, -0.801208, -3.751961, 0.8, 1, 0, 1,
-0.7444599, 0.05199482, -2.130924, 0.7921569, 1, 0, 1,
-0.7432944, 0.2343358, -2.6188, 0.7882353, 1, 0, 1,
-0.7421157, 0.3249082, -1.18373, 0.7803922, 1, 0, 1,
-0.7400516, -0.09570682, -3.139264, 0.7764706, 1, 0, 1,
-0.7322352, 0.6225695, -1.749915, 0.7686275, 1, 0, 1,
-0.7310561, 0.6652249, -0.8987893, 0.7647059, 1, 0, 1,
-0.730186, 0.5440656, -0.7341126, 0.7568628, 1, 0, 1,
-0.7288019, -1.718104, -1.581405, 0.7529412, 1, 0, 1,
-0.7265466, -1.037884, -2.543284, 0.7450981, 1, 0, 1,
-0.7260811, -1.19745, -3.940755, 0.7411765, 1, 0, 1,
-0.7219245, -1.992159, -1.544977, 0.7333333, 1, 0, 1,
-0.7143894, -0.7798791, -3.049429, 0.7294118, 1, 0, 1,
-0.7092209, -1.328232, -3.216124, 0.7215686, 1, 0, 1,
-0.7085972, -0.2841337, -3.667632, 0.7176471, 1, 0, 1,
-0.7061703, 0.03420202, -2.420891, 0.7098039, 1, 0, 1,
-0.7043157, 0.3278881, -2.272515, 0.7058824, 1, 0, 1,
-0.702648, -2.719821, -2.670824, 0.6980392, 1, 0, 1,
-0.7012466, -0.6537488, -3.246966, 0.6901961, 1, 0, 1,
-0.6993378, 0.7568051, 0.1814638, 0.6862745, 1, 0, 1,
-0.6986498, -0.7126456, -1.453566, 0.6784314, 1, 0, 1,
-0.6914494, -0.781843, -1.825081, 0.6745098, 1, 0, 1,
-0.6790671, -0.008622465, -2.496071, 0.6666667, 1, 0, 1,
-0.6775631, 1.492919, 0.5076876, 0.6627451, 1, 0, 1,
-0.6746854, 0.61531, -0.7906207, 0.654902, 1, 0, 1,
-0.6701557, -0.3925866, -3.567838, 0.6509804, 1, 0, 1,
-0.6677841, -1.128947, -1.62658, 0.6431373, 1, 0, 1,
-0.6639971, -1.009036, -3.427497, 0.6392157, 1, 0, 1,
-0.6602451, -1.38796, -3.342417, 0.6313726, 1, 0, 1,
-0.6586662, -2.38587, -2.773836, 0.627451, 1, 0, 1,
-0.6505276, 0.2607665, -1.833568, 0.6196079, 1, 0, 1,
-0.6499239, 0.633507, -1.114937, 0.6156863, 1, 0, 1,
-0.6468908, -0.4148093, -0.8733793, 0.6078432, 1, 0, 1,
-0.6454059, -1.014409, -3.09511, 0.6039216, 1, 0, 1,
-0.6418593, -0.8129832, -2.639697, 0.5960785, 1, 0, 1,
-0.6403143, 0.5239857, -1.646253, 0.5882353, 1, 0, 1,
-0.6277095, 0.8795823, -2.000863, 0.5843138, 1, 0, 1,
-0.6253389, 0.8994271, -0.5567132, 0.5764706, 1, 0, 1,
-0.6226076, -0.9052436, -3.108323, 0.572549, 1, 0, 1,
-0.6223559, -0.6575243, -1.352609, 0.5647059, 1, 0, 1,
-0.6184924, -0.02703644, -0.1804448, 0.5607843, 1, 0, 1,
-0.6112076, 1.322966, -0.2829083, 0.5529412, 1, 0, 1,
-0.6072302, -2.888376, -3.586778, 0.5490196, 1, 0, 1,
-0.6064978, -0.6065415, -2.034743, 0.5411765, 1, 0, 1,
-0.6047769, 0.04172134, -1.566309, 0.5372549, 1, 0, 1,
-0.6045797, 0.810677, -0.2909905, 0.5294118, 1, 0, 1,
-0.6045029, 1.075197, 0.3157896, 0.5254902, 1, 0, 1,
-0.600504, -0.4662407, -0.9076443, 0.5176471, 1, 0, 1,
-0.5936697, 1.776242, 0.2974237, 0.5137255, 1, 0, 1,
-0.5931653, 0.1015028, -0.6744364, 0.5058824, 1, 0, 1,
-0.5913126, 0.3168609, -0.2631823, 0.5019608, 1, 0, 1,
-0.5903669, -1.495004, -2.155835, 0.4941176, 1, 0, 1,
-0.5902781, -0.6768222, -2.823904, 0.4862745, 1, 0, 1,
-0.5882483, -1.028556, -2.03543, 0.4823529, 1, 0, 1,
-0.5809656, -0.5690889, -3.348683, 0.4745098, 1, 0, 1,
-0.5807087, -0.3380943, -3.374665, 0.4705882, 1, 0, 1,
-0.5727084, 0.2769208, -1.47667, 0.4627451, 1, 0, 1,
-0.5662677, -0.9967586, -2.496184, 0.4588235, 1, 0, 1,
-0.5622088, 1.112847, 0.0951647, 0.4509804, 1, 0, 1,
-0.5599675, -0.6580489, -2.238137, 0.4470588, 1, 0, 1,
-0.5595233, -0.3693063, -1.888899, 0.4392157, 1, 0, 1,
-0.5574251, 0.02396993, -0.8583354, 0.4352941, 1, 0, 1,
-0.5486836, -1.389781, -1.975576, 0.427451, 1, 0, 1,
-0.5389768, 0.4040256, -0.9492782, 0.4235294, 1, 0, 1,
-0.5385377, 0.1487593, -1.62618, 0.4156863, 1, 0, 1,
-0.5354816, 0.746767, -0.5968499, 0.4117647, 1, 0, 1,
-0.5317955, -0.2694696, -2.457138, 0.4039216, 1, 0, 1,
-0.5303484, -0.7405056, -2.635452, 0.3960784, 1, 0, 1,
-0.5282067, -1.039647, -3.762171, 0.3921569, 1, 0, 1,
-0.5276813, 0.1521125, -1.251459, 0.3843137, 1, 0, 1,
-0.523936, 0.6730729, -2.100214, 0.3803922, 1, 0, 1,
-0.5234143, 0.08003418, -0.6162596, 0.372549, 1, 0, 1,
-0.5211916, 0.1783375, -0.8357031, 0.3686275, 1, 0, 1,
-0.51863, 0.801347, -3.363399, 0.3607843, 1, 0, 1,
-0.5112203, -0.324541, -1.165614, 0.3568628, 1, 0, 1,
-0.5107458, 1.07829, -0.8214085, 0.3490196, 1, 0, 1,
-0.5099671, 0.9385315, 0.6391647, 0.345098, 1, 0, 1,
-0.5047004, 0.143119, -1.380532, 0.3372549, 1, 0, 1,
-0.502685, -0.7555936, -3.065486, 0.3333333, 1, 0, 1,
-0.4974253, 1.144506, -0.7865354, 0.3254902, 1, 0, 1,
-0.4941565, -0.1413151, -0.724525, 0.3215686, 1, 0, 1,
-0.4910516, -0.1274289, -0.7320405, 0.3137255, 1, 0, 1,
-0.4836181, 0.1173478, 0.05783381, 0.3098039, 1, 0, 1,
-0.4766809, -2.00834, -0.8766482, 0.3019608, 1, 0, 1,
-0.4711659, -1.005185, -1.925343, 0.2941177, 1, 0, 1,
-0.4706985, 0.9517, 0.6045412, 0.2901961, 1, 0, 1,
-0.4617521, -0.3989493, -2.113753, 0.282353, 1, 0, 1,
-0.4604345, -0.3012567, -1.419453, 0.2784314, 1, 0, 1,
-0.4587873, -0.2885571, -1.850201, 0.2705882, 1, 0, 1,
-0.4565571, -0.1057731, -3.578978, 0.2666667, 1, 0, 1,
-0.4540921, 0.2939179, -0.9690616, 0.2588235, 1, 0, 1,
-0.4535767, -2.292805, -1.625625, 0.254902, 1, 0, 1,
-0.446866, 1.60023, 0.1515429, 0.2470588, 1, 0, 1,
-0.4456982, -2.119217, -4.223489, 0.2431373, 1, 0, 1,
-0.445081, -0.2056102, -1.22067, 0.2352941, 1, 0, 1,
-0.4420708, 1.116869, 0.2909352, 0.2313726, 1, 0, 1,
-0.4412427, 0.306436, 0.6855276, 0.2235294, 1, 0, 1,
-0.4393674, -0.5607166, -2.300591, 0.2196078, 1, 0, 1,
-0.439229, -0.1622573, -1.515603, 0.2117647, 1, 0, 1,
-0.436691, -0.4139571, -1.699217, 0.2078431, 1, 0, 1,
-0.4358717, -1.994163, -1.944903, 0.2, 1, 0, 1,
-0.4310657, 0.150021, -2.354517, 0.1921569, 1, 0, 1,
-0.4308774, -0.8739795, -3.351483, 0.1882353, 1, 0, 1,
-0.4287365, -1.311556, -1.638121, 0.1803922, 1, 0, 1,
-0.4286732, -0.3435265, -3.120046, 0.1764706, 1, 0, 1,
-0.4261104, -0.2413223, -1.656293, 0.1686275, 1, 0, 1,
-0.4234527, -0.2036947, -2.925326, 0.1647059, 1, 0, 1,
-0.4192705, 1.180195, -0.2318359, 0.1568628, 1, 0, 1,
-0.4171271, 1.062192, -0.08518204, 0.1529412, 1, 0, 1,
-0.4152237, -1.004801, -2.041828, 0.145098, 1, 0, 1,
-0.4142046, 0.9478427, 1.471469, 0.1411765, 1, 0, 1,
-0.41277, 0.8000038, -1.07921, 0.1333333, 1, 0, 1,
-0.4118554, -0.04330439, -1.681418, 0.1294118, 1, 0, 1,
-0.411588, -0.1685153, -2.374609, 0.1215686, 1, 0, 1,
-0.4097749, 0.09502667, -1.030753, 0.1176471, 1, 0, 1,
-0.408542, 0.419654, 0.6510353, 0.1098039, 1, 0, 1,
-0.407543, 1.645828, -0.3452792, 0.1058824, 1, 0, 1,
-0.406276, -0.07742026, -2.978685, 0.09803922, 1, 0, 1,
-0.4015003, 0.2177337, -0.2783061, 0.09019608, 1, 0, 1,
-0.3972934, 0.2010351, -1.33976, 0.08627451, 1, 0, 1,
-0.3971078, -0.2083249, -2.585792, 0.07843138, 1, 0, 1,
-0.3916326, -0.8724539, -2.399119, 0.07450981, 1, 0, 1,
-0.3903872, -1.020659, -2.838143, 0.06666667, 1, 0, 1,
-0.3894986, -0.7496362, -0.1560156, 0.0627451, 1, 0, 1,
-0.3889923, -0.5128153, -2.915248, 0.05490196, 1, 0, 1,
-0.3857035, -0.5907296, -3.968287, 0.05098039, 1, 0, 1,
-0.3836059, 0.1604115, -1.326727, 0.04313726, 1, 0, 1,
-0.3800795, -1.920767, -1.960315, 0.03921569, 1, 0, 1,
-0.3796424, 0.3480462, 0.2573883, 0.03137255, 1, 0, 1,
-0.3741895, 0.5607838, -0.2196499, 0.02745098, 1, 0, 1,
-0.3714887, 0.4423317, -2.485271, 0.01960784, 1, 0, 1,
-0.3712673, -0.3162346, -3.146083, 0.01568628, 1, 0, 1,
-0.3699519, -0.2045333, -1.969288, 0.007843138, 1, 0, 1,
-0.3633887, -0.2485137, -2.791327, 0.003921569, 1, 0, 1,
-0.3587841, -1.156121, -3.144187, 0, 1, 0.003921569, 1,
-0.3537583, 0.3683726, 0.5970435, 0, 1, 0.01176471, 1,
-0.3533568, 0.1801944, -0.6216999, 0, 1, 0.01568628, 1,
-0.3452087, -1.311179, -4.049497, 0, 1, 0.02352941, 1,
-0.3442789, -0.1144781, -2.613786, 0, 1, 0.02745098, 1,
-0.3420899, 0.556763, -1.501568, 0, 1, 0.03529412, 1,
-0.3410689, -2.364292, -3.0863, 0, 1, 0.03921569, 1,
-0.3369942, -1.191773, -1.677462, 0, 1, 0.04705882, 1,
-0.33243, 0.3143131, -1.591969, 0, 1, 0.05098039, 1,
-0.327485, 0.4303068, -1.859945, 0, 1, 0.05882353, 1,
-0.3261204, 0.2325946, 0.4022388, 0, 1, 0.0627451, 1,
-0.3220006, 0.4072534, -2.530083, 0, 1, 0.07058824, 1,
-0.3204043, 1.239612, -0.1475655, 0, 1, 0.07450981, 1,
-0.3202525, 0.8233995, 0.2978879, 0, 1, 0.08235294, 1,
-0.3197432, -0.3999903, -2.859205, 0, 1, 0.08627451, 1,
-0.3175711, 1.323615, 1.242455, 0, 1, 0.09411765, 1,
-0.3145372, -0.6093798, -2.177018, 0, 1, 0.1019608, 1,
-0.3139505, 0.6852135, -0.1857317, 0, 1, 0.1058824, 1,
-0.3136572, 0.6133026, 0.2330553, 0, 1, 0.1137255, 1,
-0.3112905, -1.449642, -4.030001, 0, 1, 0.1176471, 1,
-0.3075639, -0.5102962, -4.173621, 0, 1, 0.1254902, 1,
-0.3066114, -0.1972748, -2.082448, 0, 1, 0.1294118, 1,
-0.3054326, -0.4436405, -4.006887, 0, 1, 0.1372549, 1,
-0.3047953, -2.205835, -4.430183, 0, 1, 0.1411765, 1,
-0.2988474, 1.065256, -0.03323744, 0, 1, 0.1490196, 1,
-0.291878, -0.7793221, -1.922915, 0, 1, 0.1529412, 1,
-0.2861564, -0.246393, -2.014673, 0, 1, 0.1607843, 1,
-0.2855391, -0.7293219, -3.94733, 0, 1, 0.1647059, 1,
-0.2850625, 0.6473393, -0.4993419, 0, 1, 0.172549, 1,
-0.2841697, -1.635427, -2.320212, 0, 1, 0.1764706, 1,
-0.2804883, -0.03834372, -1.383903, 0, 1, 0.1843137, 1,
-0.2759207, 0.3138857, -1.637277, 0, 1, 0.1882353, 1,
-0.2755267, 1.861441, 2.044997, 0, 1, 0.1960784, 1,
-0.2705645, 0.257785, -1.374247, 0, 1, 0.2039216, 1,
-0.2675098, -0.3966354, -3.819929, 0, 1, 0.2078431, 1,
-0.2673116, 0.1503441, -0.05727233, 0, 1, 0.2156863, 1,
-0.2649215, -0.7464516, -4.058961, 0, 1, 0.2196078, 1,
-0.2599218, 0.267713, -1.617133, 0, 1, 0.227451, 1,
-0.2592574, -2.71572, -3.304958, 0, 1, 0.2313726, 1,
-0.2512845, 0.9514555, -1.031487, 0, 1, 0.2392157, 1,
-0.2461049, -0.8243181, -3.405805, 0, 1, 0.2431373, 1,
-0.2451992, -0.1274518, -0.5696512, 0, 1, 0.2509804, 1,
-0.2451559, 1.60609, 0.1406976, 0, 1, 0.254902, 1,
-0.235884, 0.6934543, -0.9953316, 0, 1, 0.2627451, 1,
-0.233955, -1.212564, -3.339858, 0, 1, 0.2666667, 1,
-0.2268361, -0.1028155, -2.151495, 0, 1, 0.2745098, 1,
-0.2263395, 0.9396607, 0.6997623, 0, 1, 0.2784314, 1,
-0.2161759, -0.3570796, -2.452044, 0, 1, 0.2862745, 1,
-0.2156328, -0.9465952, -2.776138, 0, 1, 0.2901961, 1,
-0.2149987, -1.45323, -3.65241, 0, 1, 0.2980392, 1,
-0.2088663, -0.044856, -2.188598, 0, 1, 0.3058824, 1,
-0.2082463, -1.702149, -3.586232, 0, 1, 0.3098039, 1,
-0.2068323, 0.7438002, 0.5279707, 0, 1, 0.3176471, 1,
-0.2021874, -0.7404225, -2.228652, 0, 1, 0.3215686, 1,
-0.2013925, -1.629065, -3.159675, 0, 1, 0.3294118, 1,
-0.1940176, -0.4136195, -2.116382, 0, 1, 0.3333333, 1,
-0.193372, 0.6133625, 0.5787802, 0, 1, 0.3411765, 1,
-0.1906598, 1.4388, 0.1677637, 0, 1, 0.345098, 1,
-0.1897778, 0.9636813, -0.2013235, 0, 1, 0.3529412, 1,
-0.1880203, -1.755656, -2.076863, 0, 1, 0.3568628, 1,
-0.1851568, 0.2063812, -1.119524, 0, 1, 0.3647059, 1,
-0.1843626, 0.7318406, 0.6598865, 0, 1, 0.3686275, 1,
-0.1829554, -1.747082, -3.21722, 0, 1, 0.3764706, 1,
-0.17981, 0.8808255, 1.022355, 0, 1, 0.3803922, 1,
-0.1707329, 1.162893, -0.8068966, 0, 1, 0.3882353, 1,
-0.1698708, 1.374828, -0.08076371, 0, 1, 0.3921569, 1,
-0.1660393, 0.05770386, -3.181166, 0, 1, 0.4, 1,
-0.1635382, -0.3338534, -1.834408, 0, 1, 0.4078431, 1,
-0.1634925, -0.9559275, -2.994498, 0, 1, 0.4117647, 1,
-0.157444, -0.6725857, -2.078967, 0, 1, 0.4196078, 1,
-0.1562504, 0.8011449, -2.148252, 0, 1, 0.4235294, 1,
-0.1497962, -1.717068, -2.593915, 0, 1, 0.4313726, 1,
-0.1490244, 2.078662, 0.1140772, 0, 1, 0.4352941, 1,
-0.148947, -1.550367, -0.9870202, 0, 1, 0.4431373, 1,
-0.1442308, -1.115533, -2.655212, 0, 1, 0.4470588, 1,
-0.1425205, -1.049837, -4.033656, 0, 1, 0.454902, 1,
-0.1404376, -0.04440553, -1.803739, 0, 1, 0.4588235, 1,
-0.1377837, -0.6432893, -0.6071961, 0, 1, 0.4666667, 1,
-0.1374719, 1.941298, 0.4776295, 0, 1, 0.4705882, 1,
-0.1325629, 1.068384, -0.1536973, 0, 1, 0.4784314, 1,
-0.1291048, 1.203408, 0.2358593, 0, 1, 0.4823529, 1,
-0.1230991, 1.04468, -1.110877, 0, 1, 0.4901961, 1,
-0.1221387, -1.258558, -3.670747, 0, 1, 0.4941176, 1,
-0.1214046, 0.200349, -0.3696451, 0, 1, 0.5019608, 1,
-0.1205603, -0.2782941, -1.52221, 0, 1, 0.509804, 1,
-0.1195595, -1.295434, -1.81709, 0, 1, 0.5137255, 1,
-0.1193429, -0.8182804, -1.350914, 0, 1, 0.5215687, 1,
-0.1117897, 1.284051, -1.005542, 0, 1, 0.5254902, 1,
-0.1112805, 0.3693704, 0.6988142, 0, 1, 0.5333334, 1,
-0.1073871, 0.10794, -0.5887518, 0, 1, 0.5372549, 1,
-0.1071473, 1.595832, 1.224462, 0, 1, 0.5450981, 1,
-0.1067292, -0.2478389, -2.081914, 0, 1, 0.5490196, 1,
-0.1052082, -0.2942866, -2.033554, 0, 1, 0.5568628, 1,
-0.1042308, -0.2192277, -2.342322, 0, 1, 0.5607843, 1,
-0.1022482, -1.054551, -1.326811, 0, 1, 0.5686275, 1,
-0.09647219, -0.7519711, -3.434305, 0, 1, 0.572549, 1,
-0.09575878, 1.139146, 0.7184705, 0, 1, 0.5803922, 1,
-0.08952197, -0.1308462, -3.272008, 0, 1, 0.5843138, 1,
-0.08823933, 0.4821926, -0.7832419, 0, 1, 0.5921569, 1,
-0.07891463, 1.251819, 1.741796, 0, 1, 0.5960785, 1,
-0.07669232, -0.07522035, -0.8338558, 0, 1, 0.6039216, 1,
-0.07587903, 1.348847, 0.3066022, 0, 1, 0.6117647, 1,
-0.07561149, -0.3490905, -3.173998, 0, 1, 0.6156863, 1,
-0.07465307, -1.437816, -2.926077, 0, 1, 0.6235294, 1,
-0.0742621, -1.444843, -4.23432, 0, 1, 0.627451, 1,
-0.06626219, -0.1890999, -3.465104, 0, 1, 0.6352941, 1,
-0.06576502, 1.659437, 0.1482228, 0, 1, 0.6392157, 1,
-0.06522729, -0.01086453, -1.191096, 0, 1, 0.6470588, 1,
-0.06484629, 0.1876366, 0.002182055, 0, 1, 0.6509804, 1,
-0.05433168, -1.28903, -2.256284, 0, 1, 0.6588235, 1,
-0.04745745, -0.9590083, -2.416664, 0, 1, 0.6627451, 1,
-0.04698438, -0.004401654, -0.6435109, 0, 1, 0.6705883, 1,
-0.0465265, 0.2840516, -0.1242429, 0, 1, 0.6745098, 1,
-0.04449553, 0.5700307, -0.9289476, 0, 1, 0.682353, 1,
-0.04406543, -0.4462685, -2.572118, 0, 1, 0.6862745, 1,
-0.04241389, 0.08862641, 2.888041, 0, 1, 0.6941177, 1,
-0.04086669, 0.4953985, -0.5325887, 0, 1, 0.7019608, 1,
-0.03613798, 1.589942, 0.8384401, 0, 1, 0.7058824, 1,
-0.03319677, -0.2425583, -3.345523, 0, 1, 0.7137255, 1,
-0.03265757, -1.03227, -2.256615, 0, 1, 0.7176471, 1,
-0.03129693, -0.243678, -3.056855, 0, 1, 0.7254902, 1,
-0.03093072, -1.071118, -2.703171, 0, 1, 0.7294118, 1,
-0.02493352, -0.8684713, -5.328261, 0, 1, 0.7372549, 1,
-0.01989487, -0.7932687, -3.632885, 0, 1, 0.7411765, 1,
-0.01613407, 0.2568175, -2.240283, 0, 1, 0.7490196, 1,
-0.0150278, 1.138101, -0.8233123, 0, 1, 0.7529412, 1,
-0.01345273, -0.3420126, -3.066987, 0, 1, 0.7607843, 1,
-0.01150683, 0.3033826, 0.9231724, 0, 1, 0.7647059, 1,
-0.009340152, 0.5039562, 0.4027455, 0, 1, 0.772549, 1,
-0.008548778, -0.01523288, -1.955107, 0, 1, 0.7764706, 1,
-0.006223286, 1.000202, -0.1322849, 0, 1, 0.7843137, 1,
-0.00401158, -0.6122854, -1.728866, 0, 1, 0.7882353, 1,
-0.003852832, 0.08934392, -0.2821446, 0, 1, 0.7960784, 1,
-0.001871852, 0.5977507, 0.864355, 0, 1, 0.8039216, 1,
0.01434628, -0.7590646, 0.1885856, 0, 1, 0.8078431, 1,
0.01519533, -1.12521, 1.91386, 0, 1, 0.8156863, 1,
0.01776909, 1.591042, 1.334821, 0, 1, 0.8196079, 1,
0.01795869, 0.5600353, 0.5779448, 0, 1, 0.827451, 1,
0.01962267, 1.835276, 1.707289, 0, 1, 0.8313726, 1,
0.02051737, -0.6375049, 2.943985, 0, 1, 0.8392157, 1,
0.02464722, -1.149598, 3.321732, 0, 1, 0.8431373, 1,
0.02931426, 1.180954, 0.5095644, 0, 1, 0.8509804, 1,
0.03114008, -1.508895, 3.224349, 0, 1, 0.854902, 1,
0.03559463, -0.4540503, 3.374079, 0, 1, 0.8627451, 1,
0.03578969, -1.879199, 3.432671, 0, 1, 0.8666667, 1,
0.03830529, -1.006829, 2.752572, 0, 1, 0.8745098, 1,
0.04030851, -0.7591246, 2.845104, 0, 1, 0.8784314, 1,
0.04135482, -1.596103, 3.127324, 0, 1, 0.8862745, 1,
0.04453387, 0.9893989, 1.090913, 0, 1, 0.8901961, 1,
0.05447534, 1.041887, 0.07778794, 0, 1, 0.8980392, 1,
0.05843722, -0.919789, 6.080795, 0, 1, 0.9058824, 1,
0.05931242, -0.2455939, 1.326784, 0, 1, 0.9098039, 1,
0.06383691, 0.4235125, 0.414108, 0, 1, 0.9176471, 1,
0.06441422, 1.491797, 0.8991653, 0, 1, 0.9215686, 1,
0.06739249, -0.4693521, 4.492002, 0, 1, 0.9294118, 1,
0.07667191, -1.850657, 3.222053, 0, 1, 0.9333333, 1,
0.08059724, 0.2489017, 0.6764395, 0, 1, 0.9411765, 1,
0.0815962, -0.4327885, 4.425227, 0, 1, 0.945098, 1,
0.08192013, -0.3934294, 3.238073, 0, 1, 0.9529412, 1,
0.08278903, -0.4137506, 2.856781, 0, 1, 0.9568627, 1,
0.08295096, 1.458319, 0.9262644, 0, 1, 0.9647059, 1,
0.08406343, 0.2773476, 0.5871682, 0, 1, 0.9686275, 1,
0.0852872, 1.212139, -0.3703646, 0, 1, 0.9764706, 1,
0.08549349, 0.3745283, -0.4049326, 0, 1, 0.9803922, 1,
0.08606018, 1.255578, -0.01588815, 0, 1, 0.9882353, 1,
0.08673815, 1.122362, -0.4221315, 0, 1, 0.9921569, 1,
0.08678315, -0.3028306, 2.100208, 0, 1, 1, 1,
0.08800618, 0.6451033, 0.7339946, 0, 0.9921569, 1, 1,
0.08874845, 0.5650616, 0.06140687, 0, 0.9882353, 1, 1,
0.08947498, -1.707824, 4.187767, 0, 0.9803922, 1, 1,
0.09410021, -0.2860387, 1.655003, 0, 0.9764706, 1, 1,
0.09496205, 0.075813, 1.009993, 0, 0.9686275, 1, 1,
0.09841956, 1.126669, 0.1525506, 0, 0.9647059, 1, 1,
0.09943849, -1.255592, 2.654676, 0, 0.9568627, 1, 1,
0.09999373, -1.014124, 4.06419, 0, 0.9529412, 1, 1,
0.1010007, -1.043884, 3.813295, 0, 0.945098, 1, 1,
0.1038741, -0.1163383, 3.316507, 0, 0.9411765, 1, 1,
0.1063133, 1.158684, 0.3406657, 0, 0.9333333, 1, 1,
0.107108, -0.02989879, 1.065471, 0, 0.9294118, 1, 1,
0.1092426, 0.2440214, -0.3993384, 0, 0.9215686, 1, 1,
0.1094944, -0.06305133, 2.997113, 0, 0.9176471, 1, 1,
0.1125399, -0.387553, 2.167102, 0, 0.9098039, 1, 1,
0.1151063, -1.107974, 1.740141, 0, 0.9058824, 1, 1,
0.1164942, -1.579475, 2.270384, 0, 0.8980392, 1, 1,
0.1221316, 0.1255953, 0.4630783, 0, 0.8901961, 1, 1,
0.1253518, 0.9787667, -1.452135, 0, 0.8862745, 1, 1,
0.1259232, 0.5617824, 0.7044644, 0, 0.8784314, 1, 1,
0.1279918, -0.1639405, 1.138009, 0, 0.8745098, 1, 1,
0.1354691, -0.2258941, 1.797106, 0, 0.8666667, 1, 1,
0.1378686, 0.5777675, -0.1261862, 0, 0.8627451, 1, 1,
0.1431081, -1.845048, 3.500452, 0, 0.854902, 1, 1,
0.1443015, -0.2263605, 3.51392, 0, 0.8509804, 1, 1,
0.1460203, -1.528705, 1.959279, 0, 0.8431373, 1, 1,
0.1505725, -0.6506027, 2.675391, 0, 0.8392157, 1, 1,
0.1509282, -1.356897, 3.343243, 0, 0.8313726, 1, 1,
0.1582671, -0.3554099, 3.767948, 0, 0.827451, 1, 1,
0.161039, -1.157866, 2.245342, 0, 0.8196079, 1, 1,
0.1646659, -2.38087, 2.172916, 0, 0.8156863, 1, 1,
0.1675035, 0.01501171, 0.8819906, 0, 0.8078431, 1, 1,
0.1704874, 0.6155557, -0.4460726, 0, 0.8039216, 1, 1,
0.1710108, -0.4125474, 1.99227, 0, 0.7960784, 1, 1,
0.1725361, -0.2386562, 4.533191, 0, 0.7882353, 1, 1,
0.173175, -0.03215716, 0.9815607, 0, 0.7843137, 1, 1,
0.1782978, -0.8385811, 1.734094, 0, 0.7764706, 1, 1,
0.1827185, -0.7742095, 3.173303, 0, 0.772549, 1, 1,
0.1840585, 1.298495, 0.2152059, 0, 0.7647059, 1, 1,
0.1937588, 0.485253, 0.7250828, 0, 0.7607843, 1, 1,
0.1952747, -0.03141554, -0.472615, 0, 0.7529412, 1, 1,
0.1981588, 1.275326, 0.811585, 0, 0.7490196, 1, 1,
0.2002113, 1.013255, 0.6336292, 0, 0.7411765, 1, 1,
0.2025413, -1.193455, 3.799144, 0, 0.7372549, 1, 1,
0.2029654, -0.03905137, 1.070545, 0, 0.7294118, 1, 1,
0.2060738, -1.346611, 2.57405, 0, 0.7254902, 1, 1,
0.2061565, 0.176912, 1.335424, 0, 0.7176471, 1, 1,
0.2066725, 0.5048122, 0.208362, 0, 0.7137255, 1, 1,
0.2092049, -0.1224997, 3.790457, 0, 0.7058824, 1, 1,
0.2133067, 0.5161598, 1.566227, 0, 0.6980392, 1, 1,
0.2144524, 0.9464748, 0.9075176, 0, 0.6941177, 1, 1,
0.2163197, 0.4131435, 1.095958, 0, 0.6862745, 1, 1,
0.2166, -0.4717042, 3.240021, 0, 0.682353, 1, 1,
0.2167648, -1.10754, 4.784243, 0, 0.6745098, 1, 1,
0.2201874, -0.2548853, 3.885777, 0, 0.6705883, 1, 1,
0.2218734, -0.1671274, 1.758112, 0, 0.6627451, 1, 1,
0.222037, 1.692648, -0.9988558, 0, 0.6588235, 1, 1,
0.2265103, 0.4561674, 1.383764, 0, 0.6509804, 1, 1,
0.226668, -1.205313, 4.921273, 0, 0.6470588, 1, 1,
0.2267775, 0.2628509, 0.7363835, 0, 0.6392157, 1, 1,
0.2354313, 0.02861973, 0.3713969, 0, 0.6352941, 1, 1,
0.2358607, 1.46465, 0.9619327, 0, 0.627451, 1, 1,
0.2386119, -1.41309, 2.628306, 0, 0.6235294, 1, 1,
0.2432216, -0.3560033, 0.6368532, 0, 0.6156863, 1, 1,
0.2435526, -0.6420904, 2.77415, 0, 0.6117647, 1, 1,
0.2435617, 0.6804339, -0.5600854, 0, 0.6039216, 1, 1,
0.2495422, -1.010826, 3.545102, 0, 0.5960785, 1, 1,
0.2505579, 0.02759516, 1.533097, 0, 0.5921569, 1, 1,
0.2517413, -0.5201746, 1.995715, 0, 0.5843138, 1, 1,
0.2523245, 1.822246, 0.7941141, 0, 0.5803922, 1, 1,
0.2525405, 0.8565422, 0.4779861, 0, 0.572549, 1, 1,
0.2530784, 0.6859027, 7.094908e-05, 0, 0.5686275, 1, 1,
0.2556584, 0.3672768, 1.55678, 0, 0.5607843, 1, 1,
0.2591528, 0.9663603, 0.8953884, 0, 0.5568628, 1, 1,
0.2595956, -0.4664612, 2.096716, 0, 0.5490196, 1, 1,
0.2616378, 0.7605257, 2.358309, 0, 0.5450981, 1, 1,
0.2619162, 0.4195819, -0.3132266, 0, 0.5372549, 1, 1,
0.2642045, -0.8292041, 1.402437, 0, 0.5333334, 1, 1,
0.2698606, 0.6159652, 0.3087675, 0, 0.5254902, 1, 1,
0.2718303, -0.140767, 3.317734, 0, 0.5215687, 1, 1,
0.2728031, 1.294138, -0.7959732, 0, 0.5137255, 1, 1,
0.2788061, 0.1092402, 0.4626507, 0, 0.509804, 1, 1,
0.2801945, -0.3579045, 1.920051, 0, 0.5019608, 1, 1,
0.2822968, -1.761391, 1.629644, 0, 0.4941176, 1, 1,
0.2831808, 0.2990101, -0.5622504, 0, 0.4901961, 1, 1,
0.2839198, -0.7999331, 2.054192, 0, 0.4823529, 1, 1,
0.285275, 1.74502, 1.809598, 0, 0.4784314, 1, 1,
0.2861761, 1.140252, -0.7746704, 0, 0.4705882, 1, 1,
0.291592, 0.4109202, -0.5904402, 0, 0.4666667, 1, 1,
0.2939884, -0.9737834, 0.8130175, 0, 0.4588235, 1, 1,
0.296407, 0.7177, 1.30187, 0, 0.454902, 1, 1,
0.2987546, -0.1873102, 0.2335664, 0, 0.4470588, 1, 1,
0.3054562, -0.7330834, 2.524197, 0, 0.4431373, 1, 1,
0.307983, 1.127715, 1.114371, 0, 0.4352941, 1, 1,
0.3107858, -1.171795, 4.440537, 0, 0.4313726, 1, 1,
0.3133836, -0.04443453, 1.457399, 0, 0.4235294, 1, 1,
0.3144664, 0.714507, -0.3912404, 0, 0.4196078, 1, 1,
0.315881, 0.9294483, 1.494794, 0, 0.4117647, 1, 1,
0.3159378, -1.359215, 0.5782026, 0, 0.4078431, 1, 1,
0.3187717, -1.269226, 2.154564, 0, 0.4, 1, 1,
0.3189822, -0.05722132, 1.134362, 0, 0.3921569, 1, 1,
0.3193769, -0.1228405, 2.891255, 0, 0.3882353, 1, 1,
0.3249075, -1.053011, 2.111859, 0, 0.3803922, 1, 1,
0.3251896, -0.9752891, 1.683032, 0, 0.3764706, 1, 1,
0.3251902, -1.649498, 5.000385, 0, 0.3686275, 1, 1,
0.3252578, 1.214384, 0.8431548, 0, 0.3647059, 1, 1,
0.3306116, 0.4638495, 0.3532159, 0, 0.3568628, 1, 1,
0.3313675, -0.4956329, 1.352153, 0, 0.3529412, 1, 1,
0.3349434, 1.652113, 0.8779523, 0, 0.345098, 1, 1,
0.3385519, 0.5530551, 2.26205, 0, 0.3411765, 1, 1,
0.3424888, -0.3550049, 3.188928, 0, 0.3333333, 1, 1,
0.3433618, 0.4812698, 0.4581285, 0, 0.3294118, 1, 1,
0.344651, 1.585903, 1.284812, 0, 0.3215686, 1, 1,
0.3462387, -0.2645219, 2.419814, 0, 0.3176471, 1, 1,
0.3468102, -1.592321, 1.824879, 0, 0.3098039, 1, 1,
0.3475158, -1.135142, 1.746531, 0, 0.3058824, 1, 1,
0.3492009, -0.5148146, 4.545994, 0, 0.2980392, 1, 1,
0.3540167, -0.2686264, 2.427246, 0, 0.2901961, 1, 1,
0.3543614, 1.119451, 0.1548232, 0, 0.2862745, 1, 1,
0.3575545, 0.8462868, 0.9071292, 0, 0.2784314, 1, 1,
0.357593, 0.7102449, -0.5380155, 0, 0.2745098, 1, 1,
0.3580354, -0.5759785, 1.818275, 0, 0.2666667, 1, 1,
0.3674687, 0.3532956, 0.6080964, 0, 0.2627451, 1, 1,
0.3674704, 1.753745, 0.7486889, 0, 0.254902, 1, 1,
0.3724073, -0.7850509, 2.236926, 0, 0.2509804, 1, 1,
0.3767843, 0.7652819, 0.6546664, 0, 0.2431373, 1, 1,
0.3789721, 2.11519, 1.103728, 0, 0.2392157, 1, 1,
0.3835311, -1.285255, 2.49366, 0, 0.2313726, 1, 1,
0.3876954, 0.2161694, -0.4884798, 0, 0.227451, 1, 1,
0.389154, -0.06967798, 2.308314, 0, 0.2196078, 1, 1,
0.3892616, 1.114248, 0.0529458, 0, 0.2156863, 1, 1,
0.3944247, -0.2423476, 2.682279, 0, 0.2078431, 1, 1,
0.3951613, -0.8352157, 2.781082, 0, 0.2039216, 1, 1,
0.3968334, 0.5227953, 1.864282, 0, 0.1960784, 1, 1,
0.4071592, 0.8480952, -0.03689871, 0, 0.1882353, 1, 1,
0.4102668, 0.2112741, 2.241642, 0, 0.1843137, 1, 1,
0.4104056, 1.145438, -0.508936, 0, 0.1764706, 1, 1,
0.4146335, 1.187826, 0.1519882, 0, 0.172549, 1, 1,
0.4161293, 0.8252393, 2.108467, 0, 0.1647059, 1, 1,
0.4167882, -0.8194056, 1.66388, 0, 0.1607843, 1, 1,
0.4169791, 1.302738, -0.1577054, 0, 0.1529412, 1, 1,
0.4178797, -1.101915, 2.981067, 0, 0.1490196, 1, 1,
0.4271117, -0.1413107, 2.191999, 0, 0.1411765, 1, 1,
0.4280146, -1.070878, 3.636012, 0, 0.1372549, 1, 1,
0.4287798, -1.796561, 3.091939, 0, 0.1294118, 1, 1,
0.4291549, 0.9487516, 0.5830871, 0, 0.1254902, 1, 1,
0.4327293, -0.3869202, 1.242203, 0, 0.1176471, 1, 1,
0.4340926, 0.1145224, -0.03871407, 0, 0.1137255, 1, 1,
0.4352836, 0.9016168, -0.8591242, 0, 0.1058824, 1, 1,
0.4358135, -0.284821, 3.216997, 0, 0.09803922, 1, 1,
0.4377407, -0.3983977, 2.234915, 0, 0.09411765, 1, 1,
0.4381481, -1.029045, 2.040543, 0, 0.08627451, 1, 1,
0.4473922, 0.3600769, 1.991952, 0, 0.08235294, 1, 1,
0.4484577, -0.139611, 0.3599807, 0, 0.07450981, 1, 1,
0.459024, -0.9873298, 2.397743, 0, 0.07058824, 1, 1,
0.4604669, -1.130363, 3.212335, 0, 0.0627451, 1, 1,
0.4608124, -1.513761, 3.753727, 0, 0.05882353, 1, 1,
0.4609579, -1.129637, 2.617868, 0, 0.05098039, 1, 1,
0.4616801, -0.8247501, 2.189332, 0, 0.04705882, 1, 1,
0.4620984, -0.2752126, 2.676674, 0, 0.03921569, 1, 1,
0.4686377, -1.212813, 3.662573, 0, 0.03529412, 1, 1,
0.4694385, 0.1360096, 1.025273, 0, 0.02745098, 1, 1,
0.4709677, 2.022527, -0.5124177, 0, 0.02352941, 1, 1,
0.4713341, 0.5596191, 1.964871, 0, 0.01568628, 1, 1,
0.4759685, 2.565776, -0.3664303, 0, 0.01176471, 1, 1,
0.4782606, 0.4940636, 0.2030351, 0, 0.003921569, 1, 1,
0.4793687, -0.02230172, 1.205849, 0.003921569, 0, 1, 1,
0.4825451, 1.15662, 1.646067, 0.007843138, 0, 1, 1,
0.482797, 0.3564967, 1.932411, 0.01568628, 0, 1, 1,
0.486926, 0.07710246, 2.145065, 0.01960784, 0, 1, 1,
0.489844, 0.1423806, 1.1804, 0.02745098, 0, 1, 1,
0.494868, 2.225443, -0.8073795, 0.03137255, 0, 1, 1,
0.4958859, -0.07558417, 2.680149, 0.03921569, 0, 1, 1,
0.4966755, -0.5184752, 2.186694, 0.04313726, 0, 1, 1,
0.4996758, -0.957224, 3.478242, 0.05098039, 0, 1, 1,
0.4999652, -0.8021008, 3.281725, 0.05490196, 0, 1, 1,
0.5001926, 1.206785, 1.282721, 0.0627451, 0, 1, 1,
0.5006459, -1.348013, 3.247969, 0.06666667, 0, 1, 1,
0.5025969, 0.08342424, 1.09831, 0.07450981, 0, 1, 1,
0.5039988, 1.844081, -0.0236621, 0.07843138, 0, 1, 1,
0.5041593, 1.520218, 0.3915003, 0.08627451, 0, 1, 1,
0.510686, -2.055634, 1.808871, 0.09019608, 0, 1, 1,
0.5142809, -0.6623659, 2.927455, 0.09803922, 0, 1, 1,
0.5151984, 0.006898764, 0.2105501, 0.1058824, 0, 1, 1,
0.5189449, -0.000159024, 1.164234, 0.1098039, 0, 1, 1,
0.521753, -1.032809, 2.709627, 0.1176471, 0, 1, 1,
0.5229738, 2.667466, -0.6068138, 0.1215686, 0, 1, 1,
0.5231927, 1.974108, 2.198109, 0.1294118, 0, 1, 1,
0.5233165, -1.416214, 3.591834, 0.1333333, 0, 1, 1,
0.5279965, -1.66373, 1.958747, 0.1411765, 0, 1, 1,
0.5296962, -0.5775834, 2.322124, 0.145098, 0, 1, 1,
0.5324312, -1.030648, 1.370675, 0.1529412, 0, 1, 1,
0.533902, -0.6757709, 4.065067, 0.1568628, 0, 1, 1,
0.5346754, -1.23117, 2.012254, 0.1647059, 0, 1, 1,
0.5356707, -0.8114709, 2.144984, 0.1686275, 0, 1, 1,
0.5361508, -1.961055, 2.814107, 0.1764706, 0, 1, 1,
0.5370953, 0.3001451, 2.301058, 0.1803922, 0, 1, 1,
0.5391256, -0.2729085, 3.150857, 0.1882353, 0, 1, 1,
0.5410649, 1.313213, 2.438659, 0.1921569, 0, 1, 1,
0.5418423, -0.7544532, 2.051914, 0.2, 0, 1, 1,
0.5424246, 1.226775, 0.717862, 0.2078431, 0, 1, 1,
0.5454203, -1.002007, 2.752017, 0.2117647, 0, 1, 1,
0.5485093, 1.712394, -0.9410601, 0.2196078, 0, 1, 1,
0.549078, 0.9154946, 0.6798526, 0.2235294, 0, 1, 1,
0.5497565, -0.6186267, 3.613561, 0.2313726, 0, 1, 1,
0.5511296, -1.180607, 1.006191, 0.2352941, 0, 1, 1,
0.5594334, -0.1197548, 0.6661223, 0.2431373, 0, 1, 1,
0.5621852, -0.0391835, 1.954819, 0.2470588, 0, 1, 1,
0.5651312, -0.6385916, 3.276663, 0.254902, 0, 1, 1,
0.5665187, -1.715807, 3.373381, 0.2588235, 0, 1, 1,
0.5671399, -1.308483, 4.890726, 0.2666667, 0, 1, 1,
0.575955, -1.047813, 3.02127, 0.2705882, 0, 1, 1,
0.5786445, -0.6689098, 0.7698597, 0.2784314, 0, 1, 1,
0.5798259, -1.774579, 2.03536, 0.282353, 0, 1, 1,
0.5914899, 1.032202, 1.007641, 0.2901961, 0, 1, 1,
0.5949203, -0.5860243, 3.808704, 0.2941177, 0, 1, 1,
0.6079184, 0.5948317, 0.4910704, 0.3019608, 0, 1, 1,
0.6094611, -1.282803, 2.649339, 0.3098039, 0, 1, 1,
0.6111428, 0.4808795, 1.068333, 0.3137255, 0, 1, 1,
0.6130899, -0.869978, 0.6054072, 0.3215686, 0, 1, 1,
0.6208923, -0.3836245, 2.208892, 0.3254902, 0, 1, 1,
0.6255277, 0.1137971, 1.985786, 0.3333333, 0, 1, 1,
0.6280277, -1.242235, 3.448898, 0.3372549, 0, 1, 1,
0.6307554, 0.10509, 2.207322, 0.345098, 0, 1, 1,
0.6309422, -0.08849036, 2.786924, 0.3490196, 0, 1, 1,
0.6311182, 0.06135808, 2.529996, 0.3568628, 0, 1, 1,
0.631145, 1.020464, -0.4720349, 0.3607843, 0, 1, 1,
0.6355808, 1.48263, 1.162857, 0.3686275, 0, 1, 1,
0.6391608, -0.2494715, 2.834113, 0.372549, 0, 1, 1,
0.6402382, -0.5817931, 2.167995, 0.3803922, 0, 1, 1,
0.644072, 0.5526955, -0.623989, 0.3843137, 0, 1, 1,
0.6450447, -0.01245657, 0.5155371, 0.3921569, 0, 1, 1,
0.6455602, 1.094084, 1.310108, 0.3960784, 0, 1, 1,
0.6489225, 1.249602, 1.937949, 0.4039216, 0, 1, 1,
0.6495221, 0.4406431, -0.1895133, 0.4117647, 0, 1, 1,
0.6495288, 1.167081, 1.729342, 0.4156863, 0, 1, 1,
0.6524003, -0.6551778, 2.671562, 0.4235294, 0, 1, 1,
0.6537542, 0.6437071, 0.7224928, 0.427451, 0, 1, 1,
0.6542651, 1.135629, 0.7563534, 0.4352941, 0, 1, 1,
0.6557923, -0.6174436, 1.061443, 0.4392157, 0, 1, 1,
0.6616484, -1.1036, 3.089753, 0.4470588, 0, 1, 1,
0.6745473, 2.001352, -0.3355982, 0.4509804, 0, 1, 1,
0.6797798, -1.993976, 0.5646071, 0.4588235, 0, 1, 1,
0.6803583, 1.071035, 1.184363, 0.4627451, 0, 1, 1,
0.6823442, 0.8417863, 0.819577, 0.4705882, 0, 1, 1,
0.6899767, -0.8436596, 0.9814572, 0.4745098, 0, 1, 1,
0.69152, -1.801902, 3.133942, 0.4823529, 0, 1, 1,
0.6980286, -1.378372, 2.256242, 0.4862745, 0, 1, 1,
0.707024, -0.4070265, 2.019772, 0.4941176, 0, 1, 1,
0.7086479, 0.7698275, -0.3370366, 0.5019608, 0, 1, 1,
0.7087946, 0.01282897, 2.628718, 0.5058824, 0, 1, 1,
0.7116193, 1.328656, 0.6762763, 0.5137255, 0, 1, 1,
0.7190366, -0.6797861, 1.558184, 0.5176471, 0, 1, 1,
0.7215458, 0.6441085, 1.08228, 0.5254902, 0, 1, 1,
0.734937, 0.4635523, 1.937015, 0.5294118, 0, 1, 1,
0.7373609, 0.6662974, 2.630296, 0.5372549, 0, 1, 1,
0.7400621, 0.210366, -0.2282495, 0.5411765, 0, 1, 1,
0.7430559, 0.05069917, 1.757549, 0.5490196, 0, 1, 1,
0.7432584, -1.12724, 5.638481, 0.5529412, 0, 1, 1,
0.7454407, -0.9622853, 0.5647628, 0.5607843, 0, 1, 1,
0.7454667, -2.357263, 3.66746, 0.5647059, 0, 1, 1,
0.7485482, 0.3801086, 0.4957685, 0.572549, 0, 1, 1,
0.7498323, -1.767175, 3.954477, 0.5764706, 0, 1, 1,
0.7558973, 0.3140815, 1.707714, 0.5843138, 0, 1, 1,
0.7612234, -0.1510858, 1.874292, 0.5882353, 0, 1, 1,
0.7628129, 0.3199452, 1.164567, 0.5960785, 0, 1, 1,
0.7666212, 0.1108354, 1.04731, 0.6039216, 0, 1, 1,
0.7704805, 0.6576903, 3.693322, 0.6078432, 0, 1, 1,
0.7720241, -0.6652032, 2.089948, 0.6156863, 0, 1, 1,
0.7741578, -0.2185064, 2.267108, 0.6196079, 0, 1, 1,
0.775265, 0.06096034, 2.335079, 0.627451, 0, 1, 1,
0.7838722, 0.2531951, 1.794974, 0.6313726, 0, 1, 1,
0.7875584, 0.01479076, 0.7570512, 0.6392157, 0, 1, 1,
0.789632, 0.3108379, 2.247483, 0.6431373, 0, 1, 1,
0.7927609, 1.84568, -0.009604784, 0.6509804, 0, 1, 1,
0.7934569, -0.2616845, 3.0848, 0.654902, 0, 1, 1,
0.7937801, 1.718876, -0.1972099, 0.6627451, 0, 1, 1,
0.7943876, 0.1394788, -0.4256354, 0.6666667, 0, 1, 1,
0.7971578, -1.243159, 3.141901, 0.6745098, 0, 1, 1,
0.8097187, -0.9502681, 4.164579, 0.6784314, 0, 1, 1,
0.8110586, 1.466229, 0.7539281, 0.6862745, 0, 1, 1,
0.8150448, 1.250483, -0.8627362, 0.6901961, 0, 1, 1,
0.8236024, -0.40657, 1.626576, 0.6980392, 0, 1, 1,
0.828272, -1.164722, 2.734507, 0.7058824, 0, 1, 1,
0.8331594, -0.2447259, 1.205809, 0.7098039, 0, 1, 1,
0.8342929, -1.261178, 2.873622, 0.7176471, 0, 1, 1,
0.8342983, 1.106254, 1.897407, 0.7215686, 0, 1, 1,
0.8373568, -0.9625427, 2.335162, 0.7294118, 0, 1, 1,
0.851278, 0.877974, 0.5083835, 0.7333333, 0, 1, 1,
0.85161, -0.09828634, 1.737875, 0.7411765, 0, 1, 1,
0.8518253, 1.413102, 0.9133009, 0.7450981, 0, 1, 1,
0.8537898, -0.6639426, 1.717597, 0.7529412, 0, 1, 1,
0.854544, -0.2219023, 2.962577, 0.7568628, 0, 1, 1,
0.8593636, -0.4612063, 0.1592417, 0.7647059, 0, 1, 1,
0.8648622, -0.4228736, 3.36085, 0.7686275, 0, 1, 1,
0.8721541, 0.2417724, 3.382058, 0.7764706, 0, 1, 1,
0.8774776, -1.079183, 3.970901, 0.7803922, 0, 1, 1,
0.8802944, -1.004545, 2.076687, 0.7882353, 0, 1, 1,
0.8820798, -0.3406905, 2.210273, 0.7921569, 0, 1, 1,
0.883318, -0.2810275, 2.614319, 0.8, 0, 1, 1,
0.8839845, 2.212646, 1.18031, 0.8078431, 0, 1, 1,
0.9022516, 0.4599385, 1.464738, 0.8117647, 0, 1, 1,
0.9086626, -0.2894194, 3.344545, 0.8196079, 0, 1, 1,
0.910134, -0.1723875, 1.863396, 0.8235294, 0, 1, 1,
0.9136663, -0.4781226, 3.408563, 0.8313726, 0, 1, 1,
0.9155419, -0.4651864, 3.305098, 0.8352941, 0, 1, 1,
0.9199606, 0.4766607, 1.345697, 0.8431373, 0, 1, 1,
0.9274842, -0.6421105, 2.665286, 0.8470588, 0, 1, 1,
0.9349372, -0.2618683, 2.107607, 0.854902, 0, 1, 1,
0.9352346, -1.357485, 2.396141, 0.8588235, 0, 1, 1,
0.9361489, -0.5496159, 2.504414, 0.8666667, 0, 1, 1,
0.9362779, -1.133191, 3.068484, 0.8705882, 0, 1, 1,
0.9379491, -1.698692, 3.58039, 0.8784314, 0, 1, 1,
0.9382842, 0.2330296, 0.5394848, 0.8823529, 0, 1, 1,
0.9401876, 1.655943, -0.4352996, 0.8901961, 0, 1, 1,
0.9438296, -1.83067, 3.585056, 0.8941177, 0, 1, 1,
0.9458536, -0.01468736, 0.7335761, 0.9019608, 0, 1, 1,
0.9515035, -1.128367, 2.479276, 0.9098039, 0, 1, 1,
0.9539585, -0.8839999, 2.065101, 0.9137255, 0, 1, 1,
0.9548897, 2.772142, -0.6314903, 0.9215686, 0, 1, 1,
0.955768, -1.883354, 2.049938, 0.9254902, 0, 1, 1,
0.9561015, 1.035642, 2.077305, 0.9333333, 0, 1, 1,
0.9687734, -0.9254291, 3.091917, 0.9372549, 0, 1, 1,
0.9722068, 1.605247, -0.2701146, 0.945098, 0, 1, 1,
0.9751943, 0.9992359, 0.9367836, 0.9490196, 0, 1, 1,
0.9790254, -0.4629243, 3.398972, 0.9568627, 0, 1, 1,
0.9793667, -1.284258, 2.278892, 0.9607843, 0, 1, 1,
0.9816248, 0.1784985, 0.09363364, 0.9686275, 0, 1, 1,
0.9939331, -1.063512, 1.337804, 0.972549, 0, 1, 1,
1.005027, -0.07678549, 1.598197, 0.9803922, 0, 1, 1,
1.007494, 1.398606, -0.6883233, 0.9843137, 0, 1, 1,
1.008511, 1.2018, 0.8208616, 0.9921569, 0, 1, 1,
1.025482, 1.406617, 0.3588673, 0.9960784, 0, 1, 1,
1.027767, -0.08068732, 0.9105957, 1, 0, 0.9960784, 1,
1.028681, -1.619757, 2.105084, 1, 0, 0.9882353, 1,
1.038243, 1.966849, 1.879582, 1, 0, 0.9843137, 1,
1.0392, 0.2975402, 2.311697, 1, 0, 0.9764706, 1,
1.047227, -0.6663774, -0.335346, 1, 0, 0.972549, 1,
1.047782, 1.031108, 1.388879, 1, 0, 0.9647059, 1,
1.050447, 0.8714685, 1.486011, 1, 0, 0.9607843, 1,
1.051536, -0.8810546, 2.253197, 1, 0, 0.9529412, 1,
1.058623, -0.9210045, 0.668451, 1, 0, 0.9490196, 1,
1.061323, -1.311022, 3.532678, 1, 0, 0.9411765, 1,
1.061877, 1.338101, 0.8346014, 1, 0, 0.9372549, 1,
1.06235, -0.6550615, 2.721941, 1, 0, 0.9294118, 1,
1.062767, 0.386137, 0.6214477, 1, 0, 0.9254902, 1,
1.065985, 1.138037, 1.450501, 1, 0, 0.9176471, 1,
1.067152, 0.2525441, 1.803438, 1, 0, 0.9137255, 1,
1.067674, 1.000415, 1.235677, 1, 0, 0.9058824, 1,
1.068672, 1.283818, 0.3613066, 1, 0, 0.9019608, 1,
1.069139, 1.317341, 0.06376, 1, 0, 0.8941177, 1,
1.093045, -0.7190843, 3.074699, 1, 0, 0.8862745, 1,
1.095308, 1.697533, 0.02094554, 1, 0, 0.8823529, 1,
1.095782, -0.8733791, 1.683938, 1, 0, 0.8745098, 1,
1.102066, -1.031585, 2.248736, 1, 0, 0.8705882, 1,
1.104033, -2.22313, 2.057785, 1, 0, 0.8627451, 1,
1.109392, -0.09420682, 1.084709, 1, 0, 0.8588235, 1,
1.11018, 1.296384, -0.6290873, 1, 0, 0.8509804, 1,
1.113076, 1.827839, 2.089638, 1, 0, 0.8470588, 1,
1.114479, 0.5577203, 0.1511033, 1, 0, 0.8392157, 1,
1.120454, -0.2278049, 0.9058598, 1, 0, 0.8352941, 1,
1.128709, 0.287185, 1.257531, 1, 0, 0.827451, 1,
1.129706, 0.9917955, 0.1947073, 1, 0, 0.8235294, 1,
1.13329, 0.3796561, 0.8873394, 1, 0, 0.8156863, 1,
1.13353, -0.06162188, 1.760024, 1, 0, 0.8117647, 1,
1.141489, -0.3255617, 1.683876, 1, 0, 0.8039216, 1,
1.142037, -0.9506491, 2.357907, 1, 0, 0.7960784, 1,
1.147712, 0.9123853, 0.6181219, 1, 0, 0.7921569, 1,
1.164517, -0.1351794, -0.6002313, 1, 0, 0.7843137, 1,
1.166142, 0.1442804, 1.426934, 1, 0, 0.7803922, 1,
1.168728, -0.6292962, 1.500853, 1, 0, 0.772549, 1,
1.168959, -1.504105, 3.674663, 1, 0, 0.7686275, 1,
1.173258, 0.5739795, 1.471667, 1, 0, 0.7607843, 1,
1.173335, 0.686015, 1.68975, 1, 0, 0.7568628, 1,
1.177942, -1.465891, 0.4375742, 1, 0, 0.7490196, 1,
1.182567, 0.1275609, 1.223925, 1, 0, 0.7450981, 1,
1.183912, -0.6379423, 1.258576, 1, 0, 0.7372549, 1,
1.184261, 0.5562087, 1.143538, 1, 0, 0.7333333, 1,
1.188083, -0.4511617, 3.279435, 1, 0, 0.7254902, 1,
1.198601, 0.03358437, 0.8245396, 1, 0, 0.7215686, 1,
1.199059, 1.110785, 0.08740145, 1, 0, 0.7137255, 1,
1.200175, 0.7255314, 2.934809, 1, 0, 0.7098039, 1,
1.211227, 1.226544, -0.09208439, 1, 0, 0.7019608, 1,
1.225153, -1.535203, 3.014125, 1, 0, 0.6941177, 1,
1.231372, -0.06719071, 2.17134, 1, 0, 0.6901961, 1,
1.234121, -0.242526, 1.616069, 1, 0, 0.682353, 1,
1.238271, -1.732323, 3.839614, 1, 0, 0.6784314, 1,
1.239125, 0.3291091, 1.452243, 1, 0, 0.6705883, 1,
1.258717, 1.067426, -0.09953998, 1, 0, 0.6666667, 1,
1.258772, 1.120289, 1.457857, 1, 0, 0.6588235, 1,
1.260213, 2.304359, 0.1796812, 1, 0, 0.654902, 1,
1.266715, -0.02660554, 1.271156, 1, 0, 0.6470588, 1,
1.269086, 0.9324837, 0.4563271, 1, 0, 0.6431373, 1,
1.276972, -0.5240548, 0.5924099, 1, 0, 0.6352941, 1,
1.28117, -1.892747, 3.570145, 1, 0, 0.6313726, 1,
1.287463, -0.8528169, 2.513247, 1, 0, 0.6235294, 1,
1.289952, 1.258332, 0.8394489, 1, 0, 0.6196079, 1,
1.306246, -1.959817, 1.275328, 1, 0, 0.6117647, 1,
1.307578, 0.1266187, 1.259408, 1, 0, 0.6078432, 1,
1.315073, -0.1365139, 0.6584421, 1, 0, 0.6, 1,
1.316405, -0.2637823, 1.066084, 1, 0, 0.5921569, 1,
1.325347, -0.2648585, 2.386035, 1, 0, 0.5882353, 1,
1.331261, -0.193426, 2.371348, 1, 0, 0.5803922, 1,
1.333743, 0.7259585, 0.8250927, 1, 0, 0.5764706, 1,
1.342693, -0.6476607, 3.457551, 1, 0, 0.5686275, 1,
1.355148, -0.04627471, 1.673208, 1, 0, 0.5647059, 1,
1.375715, -0.8645694, 3.517313, 1, 0, 0.5568628, 1,
1.380094, 2.319981, -0.2011412, 1, 0, 0.5529412, 1,
1.380416, 0.0375844, 2.296705, 1, 0, 0.5450981, 1,
1.39268, -0.7071267, 1.625406, 1, 0, 0.5411765, 1,
1.396367, -1.223226, 1.611995, 1, 0, 0.5333334, 1,
1.415921, -1.111597, 0.9916142, 1, 0, 0.5294118, 1,
1.433317, -0.8241338, 2.194022, 1, 0, 0.5215687, 1,
1.437586, 0.3858123, 2.398272, 1, 0, 0.5176471, 1,
1.442235, 1.320278, 0.9070818, 1, 0, 0.509804, 1,
1.450514, -0.4233605, 0.5195971, 1, 0, 0.5058824, 1,
1.459095, 2.579143, 1.664019, 1, 0, 0.4980392, 1,
1.459887, 0.2828327, 2.917027, 1, 0, 0.4901961, 1,
1.46129, -0.479734, 2.890451, 1, 0, 0.4862745, 1,
1.465875, -1.088809, 1.713142, 1, 0, 0.4784314, 1,
1.478927, 0.4706566, -0.451058, 1, 0, 0.4745098, 1,
1.483178, 1.337246, 1.450908, 1, 0, 0.4666667, 1,
1.483348, 0.7442331, 1.256549, 1, 0, 0.4627451, 1,
1.488281, 1.05708, 0.05287806, 1, 0, 0.454902, 1,
1.489602, 0.06644423, 1.548011, 1, 0, 0.4509804, 1,
1.496823, -1.322604, 2.490512, 1, 0, 0.4431373, 1,
1.499311, -0.0448319, 1.083535, 1, 0, 0.4392157, 1,
1.504478, -2.051335, 2.003695, 1, 0, 0.4313726, 1,
1.510415, 1.8534, 0.8091326, 1, 0, 0.427451, 1,
1.523444, -0.2358287, 3.549643, 1, 0, 0.4196078, 1,
1.542746, -0.5194868, 2.22607, 1, 0, 0.4156863, 1,
1.543013, -0.2154879, 2.038276, 1, 0, 0.4078431, 1,
1.562136, -0.2537465, 3.229035, 1, 0, 0.4039216, 1,
1.568179, -0.01491548, 1.140564, 1, 0, 0.3960784, 1,
1.569579, -1.073689, 2.861489, 1, 0, 0.3882353, 1,
1.575658, 1.268418, 1.576792, 1, 0, 0.3843137, 1,
1.588688, 0.5955556, 0.8295622, 1, 0, 0.3764706, 1,
1.590935, -0.322812, -0.07360089, 1, 0, 0.372549, 1,
1.595361, -0.7184861, 2.829639, 1, 0, 0.3647059, 1,
1.603138, 0.9907918, 1.070429, 1, 0, 0.3607843, 1,
1.605804, -1.256692, 1.780232, 1, 0, 0.3529412, 1,
1.631949, 0.3108379, 1.884729, 1, 0, 0.3490196, 1,
1.64699, 1.418254, 2.481964, 1, 0, 0.3411765, 1,
1.654751, 0.01415736, 0.9605452, 1, 0, 0.3372549, 1,
1.667161, -0.3542424, 2.046322, 1, 0, 0.3294118, 1,
1.672072, -0.941105, 2.853923, 1, 0, 0.3254902, 1,
1.683668, -0.8022069, 1.650289, 1, 0, 0.3176471, 1,
1.702122, 0.1503023, 1.528851, 1, 0, 0.3137255, 1,
1.704158, -2.509893, 1.684618, 1, 0, 0.3058824, 1,
1.71329, -1.073985, 1.746912, 1, 0, 0.2980392, 1,
1.726554, -1.022655, 0.9457212, 1, 0, 0.2941177, 1,
1.731558, 0.5547797, 0.5058361, 1, 0, 0.2862745, 1,
1.735433, 0.2029891, 1.569993, 1, 0, 0.282353, 1,
1.745114, -3.094501, 3.642307, 1, 0, 0.2745098, 1,
1.753667, -0.1388321, 1.758159, 1, 0, 0.2705882, 1,
1.797806, -0.480963, 1.328916, 1, 0, 0.2627451, 1,
1.798472, -0.3423657, 1.971216, 1, 0, 0.2588235, 1,
1.80223, 0.7407542, 1.227616, 1, 0, 0.2509804, 1,
1.811538, -2.083139, 2.491905, 1, 0, 0.2470588, 1,
1.812699, -0.1348796, 1.680451, 1, 0, 0.2392157, 1,
1.844228, -0.7100132, 0.9025142, 1, 0, 0.2352941, 1,
1.846515, 2.016578, 0.4795533, 1, 0, 0.227451, 1,
1.851704, 0.7692258, 0.3878209, 1, 0, 0.2235294, 1,
1.877261, -0.4226662, 0.4059297, 1, 0, 0.2156863, 1,
1.898869, -1.829486, 3.292541, 1, 0, 0.2117647, 1,
1.905191, 0.09449118, 0.7708821, 1, 0, 0.2039216, 1,
1.919868, -0.4864396, 3.053185, 1, 0, 0.1960784, 1,
1.939737, -0.8398701, 2.235138, 1, 0, 0.1921569, 1,
1.945509, 0.49285, 2.509479, 1, 0, 0.1843137, 1,
1.949616, -1.462559, 2.842681, 1, 0, 0.1803922, 1,
1.960331, -0.293466, 4.661504, 1, 0, 0.172549, 1,
1.972523, 1.063666, 1.929788, 1, 0, 0.1686275, 1,
1.987008, -0.1446597, 1.752337, 1, 0, 0.1607843, 1,
1.987612, -0.2486245, 1.37334, 1, 0, 0.1568628, 1,
2.011127, -0.8787115, 1.652415, 1, 0, 0.1490196, 1,
2.034705, 0.9743432, 1.261185, 1, 0, 0.145098, 1,
2.131455, -0.5467249, 1.414512, 1, 0, 0.1372549, 1,
2.137495, -0.9293191, 2.471004, 1, 0, 0.1333333, 1,
2.145208, -0.5829545, 2.464262, 1, 0, 0.1254902, 1,
2.199102, 0.7341017, 2.70982, 1, 0, 0.1215686, 1,
2.208604, -1.670525, 3.074079, 1, 0, 0.1137255, 1,
2.245084, -2.588749, 1.826158, 1, 0, 0.1098039, 1,
2.251576, 0.620527, 1.985928, 1, 0, 0.1019608, 1,
2.300518, 0.7556943, 0.3434, 1, 0, 0.09411765, 1,
2.302918, 1.591024, 0.7812139, 1, 0, 0.09019608, 1,
2.344076, 1.899021, 1.88139, 1, 0, 0.08235294, 1,
2.344139, -0.699183, 2.997047, 1, 0, 0.07843138, 1,
2.348484, 1.364613, 0.9688905, 1, 0, 0.07058824, 1,
2.364703, -0.5911067, 1.282788, 1, 0, 0.06666667, 1,
2.385385, -3.172031, 2.43863, 1, 0, 0.05882353, 1,
2.412801, 1.361199, -0.4012017, 1, 0, 0.05490196, 1,
2.458119, 0.5532707, 1.708674, 1, 0, 0.04705882, 1,
2.504107, -2.055284, 2.560861, 1, 0, 0.04313726, 1,
2.511717, 0.2603515, 0.9347224, 1, 0, 0.03529412, 1,
2.581213, 2.046499, 2.190427, 1, 0, 0.03137255, 1,
2.589928, 0.3332528, 1.847152, 1, 0, 0.02352941, 1,
2.696566, 1.562374, 0.389366, 1, 0, 0.01960784, 1,
2.891427, 0.8493083, 1.796139, 1, 0, 0.01176471, 1,
3.104312, -0.06841797, 0.1759394, 1, 0, 0.007843138, 1
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
0.1036723, -4.22366, -7.262096, 0, -0.5, 0.5, 0.5,
0.1036723, -4.22366, -7.262096, 1, -0.5, 0.5, 0.5,
0.1036723, -4.22366, -7.262096, 1, 1.5, 0.5, 0.5,
0.1036723, -4.22366, -7.262096, 0, 1.5, 0.5, 0.5
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
-3.914184, -0.06987846, -7.262096, 0, -0.5, 0.5, 0.5,
-3.914184, -0.06987846, -7.262096, 1, -0.5, 0.5, 0.5,
-3.914184, -0.06987846, -7.262096, 1, 1.5, 0.5, 0.5,
-3.914184, -0.06987846, -7.262096, 0, 1.5, 0.5, 0.5
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
-3.914184, -4.22366, 0.376267, 0, -0.5, 0.5, 0.5,
-3.914184, -4.22366, 0.376267, 1, -0.5, 0.5, 0.5,
-3.914184, -4.22366, 0.376267, 1, 1.5, 0.5, 0.5,
-3.914184, -4.22366, 0.376267, 0, 1.5, 0.5, 0.5
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
-2, -3.265095, -5.499397,
3, -3.265095, -5.499397,
-2, -3.265095, -5.499397,
-2, -3.424856, -5.79318,
-1, -3.265095, -5.499397,
-1, -3.424856, -5.79318,
0, -3.265095, -5.499397,
0, -3.424856, -5.79318,
1, -3.265095, -5.499397,
1, -3.424856, -5.79318,
2, -3.265095, -5.499397,
2, -3.424856, -5.79318,
3, -3.265095, -5.499397,
3, -3.424856, -5.79318
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
-2, -3.744378, -6.380746, 0, -0.5, 0.5, 0.5,
-2, -3.744378, -6.380746, 1, -0.5, 0.5, 0.5,
-2, -3.744378, -6.380746, 1, 1.5, 0.5, 0.5,
-2, -3.744378, -6.380746, 0, 1.5, 0.5, 0.5,
-1, -3.744378, -6.380746, 0, -0.5, 0.5, 0.5,
-1, -3.744378, -6.380746, 1, -0.5, 0.5, 0.5,
-1, -3.744378, -6.380746, 1, 1.5, 0.5, 0.5,
-1, -3.744378, -6.380746, 0, 1.5, 0.5, 0.5,
0, -3.744378, -6.380746, 0, -0.5, 0.5, 0.5,
0, -3.744378, -6.380746, 1, -0.5, 0.5, 0.5,
0, -3.744378, -6.380746, 1, 1.5, 0.5, 0.5,
0, -3.744378, -6.380746, 0, 1.5, 0.5, 0.5,
1, -3.744378, -6.380746, 0, -0.5, 0.5, 0.5,
1, -3.744378, -6.380746, 1, -0.5, 0.5, 0.5,
1, -3.744378, -6.380746, 1, 1.5, 0.5, 0.5,
1, -3.744378, -6.380746, 0, 1.5, 0.5, 0.5,
2, -3.744378, -6.380746, 0, -0.5, 0.5, 0.5,
2, -3.744378, -6.380746, 1, -0.5, 0.5, 0.5,
2, -3.744378, -6.380746, 1, 1.5, 0.5, 0.5,
2, -3.744378, -6.380746, 0, 1.5, 0.5, 0.5,
3, -3.744378, -6.380746, 0, -0.5, 0.5, 0.5,
3, -3.744378, -6.380746, 1, -0.5, 0.5, 0.5,
3, -3.744378, -6.380746, 1, 1.5, 0.5, 0.5,
3, -3.744378, -6.380746, 0, 1.5, 0.5, 0.5
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
-2.986986, -3, -5.499397,
-2.986986, 3, -5.499397,
-2.986986, -3, -5.499397,
-3.141519, -3, -5.79318,
-2.986986, -2, -5.499397,
-3.141519, -2, -5.79318,
-2.986986, -1, -5.499397,
-3.141519, -1, -5.79318,
-2.986986, 0, -5.499397,
-3.141519, 0, -5.79318,
-2.986986, 1, -5.499397,
-3.141519, 1, -5.79318,
-2.986986, 2, -5.499397,
-3.141519, 2, -5.79318,
-2.986986, 3, -5.499397,
-3.141519, 3, -5.79318
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
-3.450585, -3, -6.380746, 0, -0.5, 0.5, 0.5,
-3.450585, -3, -6.380746, 1, -0.5, 0.5, 0.5,
-3.450585, -3, -6.380746, 1, 1.5, 0.5, 0.5,
-3.450585, -3, -6.380746, 0, 1.5, 0.5, 0.5,
-3.450585, -2, -6.380746, 0, -0.5, 0.5, 0.5,
-3.450585, -2, -6.380746, 1, -0.5, 0.5, 0.5,
-3.450585, -2, -6.380746, 1, 1.5, 0.5, 0.5,
-3.450585, -2, -6.380746, 0, 1.5, 0.5, 0.5,
-3.450585, -1, -6.380746, 0, -0.5, 0.5, 0.5,
-3.450585, -1, -6.380746, 1, -0.5, 0.5, 0.5,
-3.450585, -1, -6.380746, 1, 1.5, 0.5, 0.5,
-3.450585, -1, -6.380746, 0, 1.5, 0.5, 0.5,
-3.450585, 0, -6.380746, 0, -0.5, 0.5, 0.5,
-3.450585, 0, -6.380746, 1, -0.5, 0.5, 0.5,
-3.450585, 0, -6.380746, 1, 1.5, 0.5, 0.5,
-3.450585, 0, -6.380746, 0, 1.5, 0.5, 0.5,
-3.450585, 1, -6.380746, 0, -0.5, 0.5, 0.5,
-3.450585, 1, -6.380746, 1, -0.5, 0.5, 0.5,
-3.450585, 1, -6.380746, 1, 1.5, 0.5, 0.5,
-3.450585, 1, -6.380746, 0, 1.5, 0.5, 0.5,
-3.450585, 2, -6.380746, 0, -0.5, 0.5, 0.5,
-3.450585, 2, -6.380746, 1, -0.5, 0.5, 0.5,
-3.450585, 2, -6.380746, 1, 1.5, 0.5, 0.5,
-3.450585, 2, -6.380746, 0, 1.5, 0.5, 0.5,
-3.450585, 3, -6.380746, 0, -0.5, 0.5, 0.5,
-3.450585, 3, -6.380746, 1, -0.5, 0.5, 0.5,
-3.450585, 3, -6.380746, 1, 1.5, 0.5, 0.5,
-3.450585, 3, -6.380746, 0, 1.5, 0.5, 0.5
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
-2.986986, -3.265095, -4,
-2.986986, -3.265095, 6,
-2.986986, -3.265095, -4,
-3.141519, -3.424856, -4,
-2.986986, -3.265095, -2,
-3.141519, -3.424856, -2,
-2.986986, -3.265095, 0,
-3.141519, -3.424856, 0,
-2.986986, -3.265095, 2,
-3.141519, -3.424856, 2,
-2.986986, -3.265095, 4,
-3.141519, -3.424856, 4,
-2.986986, -3.265095, 6,
-3.141519, -3.424856, 6
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
"4",
"6"
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
-3.450585, -3.744378, -4, 0, -0.5, 0.5, 0.5,
-3.450585, -3.744378, -4, 1, -0.5, 0.5, 0.5,
-3.450585, -3.744378, -4, 1, 1.5, 0.5, 0.5,
-3.450585, -3.744378, -4, 0, 1.5, 0.5, 0.5,
-3.450585, -3.744378, -2, 0, -0.5, 0.5, 0.5,
-3.450585, -3.744378, -2, 1, -0.5, 0.5, 0.5,
-3.450585, -3.744378, -2, 1, 1.5, 0.5, 0.5,
-3.450585, -3.744378, -2, 0, 1.5, 0.5, 0.5,
-3.450585, -3.744378, 0, 0, -0.5, 0.5, 0.5,
-3.450585, -3.744378, 0, 1, -0.5, 0.5, 0.5,
-3.450585, -3.744378, 0, 1, 1.5, 0.5, 0.5,
-3.450585, -3.744378, 0, 0, 1.5, 0.5, 0.5,
-3.450585, -3.744378, 2, 0, -0.5, 0.5, 0.5,
-3.450585, -3.744378, 2, 1, -0.5, 0.5, 0.5,
-3.450585, -3.744378, 2, 1, 1.5, 0.5, 0.5,
-3.450585, -3.744378, 2, 0, 1.5, 0.5, 0.5,
-3.450585, -3.744378, 4, 0, -0.5, 0.5, 0.5,
-3.450585, -3.744378, 4, 1, -0.5, 0.5, 0.5,
-3.450585, -3.744378, 4, 1, 1.5, 0.5, 0.5,
-3.450585, -3.744378, 4, 0, 1.5, 0.5, 0.5,
-3.450585, -3.744378, 6, 0, -0.5, 0.5, 0.5,
-3.450585, -3.744378, 6, 1, -0.5, 0.5, 0.5,
-3.450585, -3.744378, 6, 1, 1.5, 0.5, 0.5,
-3.450585, -3.744378, 6, 0, 1.5, 0.5, 0.5
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
-2.986986, -3.265095, -5.499397,
-2.986986, 3.125339, -5.499397,
-2.986986, -3.265095, 6.251931,
-2.986986, 3.125339, 6.251931,
-2.986986, -3.265095, -5.499397,
-2.986986, -3.265095, 6.251931,
-2.986986, 3.125339, -5.499397,
-2.986986, 3.125339, 6.251931,
-2.986986, -3.265095, -5.499397,
3.194331, -3.265095, -5.499397,
-2.986986, -3.265095, 6.251931,
3.194331, -3.265095, 6.251931,
-2.986986, 3.125339, -5.499397,
3.194331, 3.125339, -5.499397,
-2.986986, 3.125339, 6.251931,
3.194331, 3.125339, 6.251931,
3.194331, -3.265095, -5.499397,
3.194331, 3.125339, -5.499397,
3.194331, -3.265095, 6.251931,
3.194331, 3.125339, 6.251931,
3.194331, -3.265095, -5.499397,
3.194331, -3.265095, 6.251931,
3.194331, 3.125339, -5.499397,
3.194331, 3.125339, 6.251931
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
var radius = 7.868563;
var distance = 35.00813;
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
mvMatrix.translate( -0.1036723, 0.06987846, -0.376267 );
mvMatrix.scale( 1.376348, 1.331309, 0.723973 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.00813);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
Nicotine_sulfate<-read.table("Nicotine_sulfate.xyz", skip=1)
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
-2.896967, 1.174535, 0.74753, 0, 0, 1, 1, 1,
-2.836898, 0.3720194, 0.5009051, 1, 0, 0, 1, 1,
-2.693691, -0.05387888, -1.332504, 1, 0, 0, 1, 1,
-2.474122, -2.332443, -3.576639, 1, 0, 0, 1, 1,
-2.432993, 0.01623425, -1.536834, 1, 0, 0, 1, 1,
-2.417582, 0.2668704, 0.1987075, 1, 0, 0, 1, 1,
-2.379678, 0.4461261, -0.3532492, 0, 0, 0, 1, 1,
-2.319043, 0.5570803, -1.773311, 0, 0, 0, 1, 1,
-2.315071, -1.012385, -3.264122, 0, 0, 0, 1, 1,
-2.294469, 0.0827817, -1.707716, 0, 0, 0, 1, 1,
-2.236913, 0.639969, -0.2894215, 0, 0, 0, 1, 1,
-2.204858, -0.3669907, -2.312216, 0, 0, 0, 1, 1,
-2.169042, -0.575422, -0.888808, 0, 0, 0, 1, 1,
-2.126753, -0.2007951, -0.7538007, 1, 1, 1, 1, 1,
-2.103889, 0.7935482, -1.387914, 1, 1, 1, 1, 1,
-2.081376, -0.7767605, 0.03068306, 1, 1, 1, 1, 1,
-2.037488, 0.9358696, -1.759978, 1, 1, 1, 1, 1,
-2.020521, 0.8393532, -0.9105405, 1, 1, 1, 1, 1,
-1.97351, 1.025595, -1.687857, 1, 1, 1, 1, 1,
-1.902507, 0.637279, -2.690358, 1, 1, 1, 1, 1,
-1.902328, 0.8347332, -1.731798, 1, 1, 1, 1, 1,
-1.882238, 1.798219, -1.843414, 1, 1, 1, 1, 1,
-1.881276, -1.559505, -1.976426, 1, 1, 1, 1, 1,
-1.878949, 0.2139975, -1.712086, 1, 1, 1, 1, 1,
-1.872127, 0.142328, -1.448127, 1, 1, 1, 1, 1,
-1.841079, 0.5618436, -0.8817226, 1, 1, 1, 1, 1,
-1.840888, -0.9031895, -3.308685, 1, 1, 1, 1, 1,
-1.83775, -1.033255, -3.345999, 1, 1, 1, 1, 1,
-1.831437, -0.8981765, -1.806279, 0, 0, 1, 1, 1,
-1.821151, 0.7327086, -1.885641, 1, 0, 0, 1, 1,
-1.81732, -0.6010453, -2.118513, 1, 0, 0, 1, 1,
-1.803975, 2.063734, 1.279535, 1, 0, 0, 1, 1,
-1.803272, -0.4810922, -1.256223, 1, 0, 0, 1, 1,
-1.79925, 0.3474776, 0.6777868, 1, 0, 0, 1, 1,
-1.799018, 0.5472114, -0.2799819, 0, 0, 0, 1, 1,
-1.793289, -0.982783, -2.010106, 0, 0, 0, 1, 1,
-1.742624, 0.4514919, -0.6209912, 0, 0, 0, 1, 1,
-1.714694, 0.541545, 1.380432, 0, 0, 0, 1, 1,
-1.705588, -1.19102, -2.060698, 0, 0, 0, 1, 1,
-1.705582, -0.7613199, -1.888026, 0, 0, 0, 1, 1,
-1.705083, 1.796733, -1.115462, 0, 0, 0, 1, 1,
-1.694503, 1.062503, -0.3144019, 1, 1, 1, 1, 1,
-1.694268, 1.735805, 0.1597881, 1, 1, 1, 1, 1,
-1.683243, -1.479862, -2.576116, 1, 1, 1, 1, 1,
-1.656394, -0.007490225, 0.3535107, 1, 1, 1, 1, 1,
-1.629404, 0.008912169, -2.431089, 1, 1, 1, 1, 1,
-1.617641, 0.03999604, -3.756607, 1, 1, 1, 1, 1,
-1.5896, 0.7564802, -1.234117, 1, 1, 1, 1, 1,
-1.575757, 0.3013477, -1.498931, 1, 1, 1, 1, 1,
-1.571383, -0.3316563, -0.1683446, 1, 1, 1, 1, 1,
-1.566845, -0.01041308, -0.1678345, 1, 1, 1, 1, 1,
-1.558168, 1.574267, 0.005460777, 1, 1, 1, 1, 1,
-1.542395, 0.8289272, 0.2752711, 1, 1, 1, 1, 1,
-1.53677, -0.5313854, -3.54566, 1, 1, 1, 1, 1,
-1.512077, -0.7676669, -1.905435, 1, 1, 1, 1, 1,
-1.510343, -0.01383808, -1.020169, 1, 1, 1, 1, 1,
-1.501716, -0.495196, -3.123154, 0, 0, 1, 1, 1,
-1.494752, -2.332906, -4.00614, 1, 0, 0, 1, 1,
-1.490215, 0.2206708, -0.6381884, 1, 0, 0, 1, 1,
-1.469104, 0.3011626, -2.718287, 1, 0, 0, 1, 1,
-1.460271, 2.472991, 0.436704, 1, 0, 0, 1, 1,
-1.446805, -2.084923, -2.095628, 1, 0, 0, 1, 1,
-1.444025, -1.225453, -1.819667, 0, 0, 0, 1, 1,
-1.442809, 1.397534, -1.637692, 0, 0, 0, 1, 1,
-1.440035, -0.8828086, -1.975452, 0, 0, 0, 1, 1,
-1.433451, 0.1844396, 0.1415719, 0, 0, 0, 1, 1,
-1.431266, 0.6048512, 0.7522652, 0, 0, 0, 1, 1,
-1.424547, 0.5181586, -2.895037, 0, 0, 0, 1, 1,
-1.424039, 0.3260087, -0.3126828, 0, 0, 0, 1, 1,
-1.40604, -0.7568759, -2.476111, 1, 1, 1, 1, 1,
-1.40432, -0.1859203, -3.269686, 1, 1, 1, 1, 1,
-1.400209, 0.3751882, -0.6050077, 1, 1, 1, 1, 1,
-1.391219, -0.5834665, -2.056751, 1, 1, 1, 1, 1,
-1.383967, 0.6706804, -1.824065, 1, 1, 1, 1, 1,
-1.381336, -0.3065009, -1.945319, 1, 1, 1, 1, 1,
-1.370421, 0.7002875, -1.6295, 1, 1, 1, 1, 1,
-1.369503, 0.3509854, -2.074462, 1, 1, 1, 1, 1,
-1.353576, -1.034831, -1.432981, 1, 1, 1, 1, 1,
-1.351402, 1.229394, 0.8696206, 1, 1, 1, 1, 1,
-1.349131, -0.08332247, 0.2935658, 1, 1, 1, 1, 1,
-1.344931, 1.089303, -1.99714, 1, 1, 1, 1, 1,
-1.334833, -1.731115, -2.398812, 1, 1, 1, 1, 1,
-1.332469, -0.7048023, -2.640085, 1, 1, 1, 1, 1,
-1.327458, 0.5560473, -1.901059, 1, 1, 1, 1, 1,
-1.325171, -0.4001525, -2.045017, 0, 0, 1, 1, 1,
-1.322191, 1.237624, -0.897154, 1, 0, 0, 1, 1,
-1.317751, 0.9448487, -0.448487, 1, 0, 0, 1, 1,
-1.301962, -1.862841, -1.246741, 1, 0, 0, 1, 1,
-1.289739, 1.144924, -1.471504, 1, 0, 0, 1, 1,
-1.283234, 0.3801135, -1.650566, 1, 0, 0, 1, 1,
-1.275746, 0.4110405, -1.62718, 0, 0, 0, 1, 1,
-1.273769, -0.5584293, -0.2101192, 0, 0, 0, 1, 1,
-1.266641, 0.2120543, 0.230189, 0, 0, 0, 1, 1,
-1.258844, 0.2723977, -0.4074281, 0, 0, 0, 1, 1,
-1.256343, -0.2487087, -1.471567, 0, 0, 0, 1, 1,
-1.252736, -0.8829922, -1.179997, 0, 0, 0, 1, 1,
-1.251627, 1.324253, -0.4093198, 0, 0, 0, 1, 1,
-1.250349, 1.412176, -1.388163, 1, 1, 1, 1, 1,
-1.244055, 0.3573749, -1.228118, 1, 1, 1, 1, 1,
-1.224686, -1.637307, -1.482634, 1, 1, 1, 1, 1,
-1.223383, 2.532612, -0.1332123, 1, 1, 1, 1, 1,
-1.221983, 2.061444, -1.858255, 1, 1, 1, 1, 1,
-1.185907, 0.2806615, -1.331169, 1, 1, 1, 1, 1,
-1.185683, -0.1062307, -1.596648, 1, 1, 1, 1, 1,
-1.180112, -1.070446, -1.506567, 1, 1, 1, 1, 1,
-1.179248, -1.471022, -2.368309, 1, 1, 1, 1, 1,
-1.171074, 0.2277817, -1.974354, 1, 1, 1, 1, 1,
-1.16557, -0.3526664, -3.826334, 1, 1, 1, 1, 1,
-1.164687, -0.1917861, -0.8573832, 1, 1, 1, 1, 1,
-1.156535, 2.143242, -0.775786, 1, 1, 1, 1, 1,
-1.150852, 0.178481, -2.159688, 1, 1, 1, 1, 1,
-1.14104, -0.7779692, -0.2788163, 1, 1, 1, 1, 1,
-1.12829, -0.05193114, -3.673743, 0, 0, 1, 1, 1,
-1.125644, 0.04710665, -2.784409, 1, 0, 0, 1, 1,
-1.124427, 1.672925, -0.9711123, 1, 0, 0, 1, 1,
-1.115403, -0.5108426, -2.507287, 1, 0, 0, 1, 1,
-1.109324, -2.013496, -2.596686, 1, 0, 0, 1, 1,
-1.102233, -1.178593, -1.92883, 1, 0, 0, 1, 1,
-1.099497, 0.07484034, -0.603277, 0, 0, 0, 1, 1,
-1.097388, -0.05015435, -0.6674486, 0, 0, 0, 1, 1,
-1.08796, 0.05852292, -2.143793, 0, 0, 0, 1, 1,
-1.078516, -0.1666338, -2.09587, 0, 0, 0, 1, 1,
-1.075582, 0.2032322, -0.3950295, 0, 0, 0, 1, 1,
-1.075001, -1.463715, -1.093249, 0, 0, 0, 1, 1,
-1.067736, 0.01985934, -1.650981, 0, 0, 0, 1, 1,
-1.066302, -1.393404, -2.301758, 1, 1, 1, 1, 1,
-1.066, 0.2963756, 1.055853, 1, 1, 1, 1, 1,
-1.057759, -1.177018, -3.030442, 1, 1, 1, 1, 1,
-1.056084, -0.452887, -1.664782, 1, 1, 1, 1, 1,
-1.05256, 0.02963343, -1.147906, 1, 1, 1, 1, 1,
-1.049694, -2.052449, -3.464436, 1, 1, 1, 1, 1,
-1.049222, -1.950958, -4.64422, 1, 1, 1, 1, 1,
-1.045381, -0.607213, -2.516479, 1, 1, 1, 1, 1,
-1.037213, 0.7455193, 0.2269088, 1, 1, 1, 1, 1,
-1.027025, -0.1566419, -1.246, 1, 1, 1, 1, 1,
-1.011534, 1.193349, -3.07014, 1, 1, 1, 1, 1,
-1.00571, -0.1301816, -3.104267, 1, 1, 1, 1, 1,
-1.005159, 0.8454489, -1.17118, 1, 1, 1, 1, 1,
-1.004927, 0.3802291, -1.286332, 1, 1, 1, 1, 1,
-1.003399, -0.3169222, 0.7257481, 1, 1, 1, 1, 1,
-1.00209, -0.2667221, -2.379304, 0, 0, 1, 1, 1,
-0.9940984, 1.305713, -0.1873173, 1, 0, 0, 1, 1,
-0.9887445, 0.5716556, -0.04619996, 1, 0, 0, 1, 1,
-0.9879317, 0.117282, -2.471839, 1, 0, 0, 1, 1,
-0.9839699, -0.5822017, -3.132542, 1, 0, 0, 1, 1,
-0.9816818, 0.7302517, 0.5905311, 1, 0, 0, 1, 1,
-0.9742419, 0.6727498, -0.5784027, 0, 0, 0, 1, 1,
-0.9723097, 1.144754, -1.037641, 0, 0, 0, 1, 1,
-0.9678155, 0.9679368, 0.1213066, 0, 0, 0, 1, 1,
-0.9559339, 1.251897, 0.0604472, 0, 0, 0, 1, 1,
-0.9537265, 0.6759631, -1.306978, 0, 0, 0, 1, 1,
-0.9527788, -0.1474469, -2.109491, 0, 0, 0, 1, 1,
-0.9499658, 0.8529756, -1.388441, 0, 0, 0, 1, 1,
-0.938931, 1.480589, -0.4084207, 1, 1, 1, 1, 1,
-0.9386519, 2.638872, -1.398648, 1, 1, 1, 1, 1,
-0.9372184, -0.9801312, -3.823159, 1, 1, 1, 1, 1,
-0.933563, 0.4603494, -2.477753, 1, 1, 1, 1, 1,
-0.9313199, -0.2720565, -2.067752, 1, 1, 1, 1, 1,
-0.9299524, -1.536848, -3.621844, 1, 1, 1, 1, 1,
-0.9156659, 0.8903044, -0.4286023, 1, 1, 1, 1, 1,
-0.9140304, -0.3511157, 0.2635869, 1, 1, 1, 1, 1,
-0.9080195, -0.4162917, -1.503993, 1, 1, 1, 1, 1,
-0.9060091, -0.05985117, -2.578523, 1, 1, 1, 1, 1,
-0.9033297, -0.2145737, -2.235719, 1, 1, 1, 1, 1,
-0.8956099, 0.6342774, 0.08817863, 1, 1, 1, 1, 1,
-0.892658, 0.06813137, 0.9062127, 1, 1, 1, 1, 1,
-0.8901399, 0.726283, 0.206347, 1, 1, 1, 1, 1,
-0.8891844, -0.8449525, -2.547155, 1, 1, 1, 1, 1,
-0.8849626, 2.179346, -0.8202953, 0, 0, 1, 1, 1,
-0.8849265, -0.1244369, -3.006095, 1, 0, 0, 1, 1,
-0.8718094, 0.1441394, -3.681106, 1, 0, 0, 1, 1,
-0.8671218, 0.3205825, -1.881866, 1, 0, 0, 1, 1,
-0.8660724, -0.3772008, -3.048963, 1, 0, 0, 1, 1,
-0.8593881, -1.134612, -4.302832, 1, 0, 0, 1, 1,
-0.8587199, 2.074588, 0.4995978, 0, 0, 0, 1, 1,
-0.8519645, -0.6228785, -0.5494244, 0, 0, 0, 1, 1,
-0.847642, -1.182439, -2.040543, 0, 0, 0, 1, 1,
-0.8439716, 0.2658665, -3.544138, 0, 0, 0, 1, 1,
-0.8351089, -0.1329385, -1.768057, 0, 0, 0, 1, 1,
-0.8349177, 0.2962973, -1.33081, 0, 0, 0, 1, 1,
-0.8283792, 0.5068549, 0.2709836, 0, 0, 0, 1, 1,
-0.8203776, 0.6410961, -1.736654, 1, 1, 1, 1, 1,
-0.8187122, -0.6084283, -2.848476, 1, 1, 1, 1, 1,
-0.8154661, -0.9297767, -3.134352, 1, 1, 1, 1, 1,
-0.8046237, -0.9956998, -3.846038, 1, 1, 1, 1, 1,
-0.8038045, 3.032274, -0.4558441, 1, 1, 1, 1, 1,
-0.8028445, -0.1060013, -2.072914, 1, 1, 1, 1, 1,
-0.7993671, -0.2524205, -2.016099, 1, 1, 1, 1, 1,
-0.7882941, -0.2367128, -2.154519, 1, 1, 1, 1, 1,
-0.7866013, 0.6988612, 1.2652, 1, 1, 1, 1, 1,
-0.7660474, 0.3326447, 0.3226456, 1, 1, 1, 1, 1,
-0.7618099, 0.4861154, -1.464855, 1, 1, 1, 1, 1,
-0.7583914, 1.161115, -1.83549, 1, 1, 1, 1, 1,
-0.7574386, -1.459112, -3.678549, 1, 1, 1, 1, 1,
-0.7549441, -2.01745, -2.263163, 1, 1, 1, 1, 1,
-0.7545403, -0.9209056, -0.931194, 1, 1, 1, 1, 1,
-0.7543946, -0.2629398, -3.652049, 0, 0, 1, 1, 1,
-0.7535427, 2.734402, -1.027804, 1, 0, 0, 1, 1,
-0.7522684, -0.09484643, -1.312934, 1, 0, 0, 1, 1,
-0.7475948, 0.1192753, -0.7944112, 1, 0, 0, 1, 1,
-0.7475444, -0.801208, -3.751961, 1, 0, 0, 1, 1,
-0.7444599, 0.05199482, -2.130924, 1, 0, 0, 1, 1,
-0.7432944, 0.2343358, -2.6188, 0, 0, 0, 1, 1,
-0.7421157, 0.3249082, -1.18373, 0, 0, 0, 1, 1,
-0.7400516, -0.09570682, -3.139264, 0, 0, 0, 1, 1,
-0.7322352, 0.6225695, -1.749915, 0, 0, 0, 1, 1,
-0.7310561, 0.6652249, -0.8987893, 0, 0, 0, 1, 1,
-0.730186, 0.5440656, -0.7341126, 0, 0, 0, 1, 1,
-0.7288019, -1.718104, -1.581405, 0, 0, 0, 1, 1,
-0.7265466, -1.037884, -2.543284, 1, 1, 1, 1, 1,
-0.7260811, -1.19745, -3.940755, 1, 1, 1, 1, 1,
-0.7219245, -1.992159, -1.544977, 1, 1, 1, 1, 1,
-0.7143894, -0.7798791, -3.049429, 1, 1, 1, 1, 1,
-0.7092209, -1.328232, -3.216124, 1, 1, 1, 1, 1,
-0.7085972, -0.2841337, -3.667632, 1, 1, 1, 1, 1,
-0.7061703, 0.03420202, -2.420891, 1, 1, 1, 1, 1,
-0.7043157, 0.3278881, -2.272515, 1, 1, 1, 1, 1,
-0.702648, -2.719821, -2.670824, 1, 1, 1, 1, 1,
-0.7012466, -0.6537488, -3.246966, 1, 1, 1, 1, 1,
-0.6993378, 0.7568051, 0.1814638, 1, 1, 1, 1, 1,
-0.6986498, -0.7126456, -1.453566, 1, 1, 1, 1, 1,
-0.6914494, -0.781843, -1.825081, 1, 1, 1, 1, 1,
-0.6790671, -0.008622465, -2.496071, 1, 1, 1, 1, 1,
-0.6775631, 1.492919, 0.5076876, 1, 1, 1, 1, 1,
-0.6746854, 0.61531, -0.7906207, 0, 0, 1, 1, 1,
-0.6701557, -0.3925866, -3.567838, 1, 0, 0, 1, 1,
-0.6677841, -1.128947, -1.62658, 1, 0, 0, 1, 1,
-0.6639971, -1.009036, -3.427497, 1, 0, 0, 1, 1,
-0.6602451, -1.38796, -3.342417, 1, 0, 0, 1, 1,
-0.6586662, -2.38587, -2.773836, 1, 0, 0, 1, 1,
-0.6505276, 0.2607665, -1.833568, 0, 0, 0, 1, 1,
-0.6499239, 0.633507, -1.114937, 0, 0, 0, 1, 1,
-0.6468908, -0.4148093, -0.8733793, 0, 0, 0, 1, 1,
-0.6454059, -1.014409, -3.09511, 0, 0, 0, 1, 1,
-0.6418593, -0.8129832, -2.639697, 0, 0, 0, 1, 1,
-0.6403143, 0.5239857, -1.646253, 0, 0, 0, 1, 1,
-0.6277095, 0.8795823, -2.000863, 0, 0, 0, 1, 1,
-0.6253389, 0.8994271, -0.5567132, 1, 1, 1, 1, 1,
-0.6226076, -0.9052436, -3.108323, 1, 1, 1, 1, 1,
-0.6223559, -0.6575243, -1.352609, 1, 1, 1, 1, 1,
-0.6184924, -0.02703644, -0.1804448, 1, 1, 1, 1, 1,
-0.6112076, 1.322966, -0.2829083, 1, 1, 1, 1, 1,
-0.6072302, -2.888376, -3.586778, 1, 1, 1, 1, 1,
-0.6064978, -0.6065415, -2.034743, 1, 1, 1, 1, 1,
-0.6047769, 0.04172134, -1.566309, 1, 1, 1, 1, 1,
-0.6045797, 0.810677, -0.2909905, 1, 1, 1, 1, 1,
-0.6045029, 1.075197, 0.3157896, 1, 1, 1, 1, 1,
-0.600504, -0.4662407, -0.9076443, 1, 1, 1, 1, 1,
-0.5936697, 1.776242, 0.2974237, 1, 1, 1, 1, 1,
-0.5931653, 0.1015028, -0.6744364, 1, 1, 1, 1, 1,
-0.5913126, 0.3168609, -0.2631823, 1, 1, 1, 1, 1,
-0.5903669, -1.495004, -2.155835, 1, 1, 1, 1, 1,
-0.5902781, -0.6768222, -2.823904, 0, 0, 1, 1, 1,
-0.5882483, -1.028556, -2.03543, 1, 0, 0, 1, 1,
-0.5809656, -0.5690889, -3.348683, 1, 0, 0, 1, 1,
-0.5807087, -0.3380943, -3.374665, 1, 0, 0, 1, 1,
-0.5727084, 0.2769208, -1.47667, 1, 0, 0, 1, 1,
-0.5662677, -0.9967586, -2.496184, 1, 0, 0, 1, 1,
-0.5622088, 1.112847, 0.0951647, 0, 0, 0, 1, 1,
-0.5599675, -0.6580489, -2.238137, 0, 0, 0, 1, 1,
-0.5595233, -0.3693063, -1.888899, 0, 0, 0, 1, 1,
-0.5574251, 0.02396993, -0.8583354, 0, 0, 0, 1, 1,
-0.5486836, -1.389781, -1.975576, 0, 0, 0, 1, 1,
-0.5389768, 0.4040256, -0.9492782, 0, 0, 0, 1, 1,
-0.5385377, 0.1487593, -1.62618, 0, 0, 0, 1, 1,
-0.5354816, 0.746767, -0.5968499, 1, 1, 1, 1, 1,
-0.5317955, -0.2694696, -2.457138, 1, 1, 1, 1, 1,
-0.5303484, -0.7405056, -2.635452, 1, 1, 1, 1, 1,
-0.5282067, -1.039647, -3.762171, 1, 1, 1, 1, 1,
-0.5276813, 0.1521125, -1.251459, 1, 1, 1, 1, 1,
-0.523936, 0.6730729, -2.100214, 1, 1, 1, 1, 1,
-0.5234143, 0.08003418, -0.6162596, 1, 1, 1, 1, 1,
-0.5211916, 0.1783375, -0.8357031, 1, 1, 1, 1, 1,
-0.51863, 0.801347, -3.363399, 1, 1, 1, 1, 1,
-0.5112203, -0.324541, -1.165614, 1, 1, 1, 1, 1,
-0.5107458, 1.07829, -0.8214085, 1, 1, 1, 1, 1,
-0.5099671, 0.9385315, 0.6391647, 1, 1, 1, 1, 1,
-0.5047004, 0.143119, -1.380532, 1, 1, 1, 1, 1,
-0.502685, -0.7555936, -3.065486, 1, 1, 1, 1, 1,
-0.4974253, 1.144506, -0.7865354, 1, 1, 1, 1, 1,
-0.4941565, -0.1413151, -0.724525, 0, 0, 1, 1, 1,
-0.4910516, -0.1274289, -0.7320405, 1, 0, 0, 1, 1,
-0.4836181, 0.1173478, 0.05783381, 1, 0, 0, 1, 1,
-0.4766809, -2.00834, -0.8766482, 1, 0, 0, 1, 1,
-0.4711659, -1.005185, -1.925343, 1, 0, 0, 1, 1,
-0.4706985, 0.9517, 0.6045412, 1, 0, 0, 1, 1,
-0.4617521, -0.3989493, -2.113753, 0, 0, 0, 1, 1,
-0.4604345, -0.3012567, -1.419453, 0, 0, 0, 1, 1,
-0.4587873, -0.2885571, -1.850201, 0, 0, 0, 1, 1,
-0.4565571, -0.1057731, -3.578978, 0, 0, 0, 1, 1,
-0.4540921, 0.2939179, -0.9690616, 0, 0, 0, 1, 1,
-0.4535767, -2.292805, -1.625625, 0, 0, 0, 1, 1,
-0.446866, 1.60023, 0.1515429, 0, 0, 0, 1, 1,
-0.4456982, -2.119217, -4.223489, 1, 1, 1, 1, 1,
-0.445081, -0.2056102, -1.22067, 1, 1, 1, 1, 1,
-0.4420708, 1.116869, 0.2909352, 1, 1, 1, 1, 1,
-0.4412427, 0.306436, 0.6855276, 1, 1, 1, 1, 1,
-0.4393674, -0.5607166, -2.300591, 1, 1, 1, 1, 1,
-0.439229, -0.1622573, -1.515603, 1, 1, 1, 1, 1,
-0.436691, -0.4139571, -1.699217, 1, 1, 1, 1, 1,
-0.4358717, -1.994163, -1.944903, 1, 1, 1, 1, 1,
-0.4310657, 0.150021, -2.354517, 1, 1, 1, 1, 1,
-0.4308774, -0.8739795, -3.351483, 1, 1, 1, 1, 1,
-0.4287365, -1.311556, -1.638121, 1, 1, 1, 1, 1,
-0.4286732, -0.3435265, -3.120046, 1, 1, 1, 1, 1,
-0.4261104, -0.2413223, -1.656293, 1, 1, 1, 1, 1,
-0.4234527, -0.2036947, -2.925326, 1, 1, 1, 1, 1,
-0.4192705, 1.180195, -0.2318359, 1, 1, 1, 1, 1,
-0.4171271, 1.062192, -0.08518204, 0, 0, 1, 1, 1,
-0.4152237, -1.004801, -2.041828, 1, 0, 0, 1, 1,
-0.4142046, 0.9478427, 1.471469, 1, 0, 0, 1, 1,
-0.41277, 0.8000038, -1.07921, 1, 0, 0, 1, 1,
-0.4118554, -0.04330439, -1.681418, 1, 0, 0, 1, 1,
-0.411588, -0.1685153, -2.374609, 1, 0, 0, 1, 1,
-0.4097749, 0.09502667, -1.030753, 0, 0, 0, 1, 1,
-0.408542, 0.419654, 0.6510353, 0, 0, 0, 1, 1,
-0.407543, 1.645828, -0.3452792, 0, 0, 0, 1, 1,
-0.406276, -0.07742026, -2.978685, 0, 0, 0, 1, 1,
-0.4015003, 0.2177337, -0.2783061, 0, 0, 0, 1, 1,
-0.3972934, 0.2010351, -1.33976, 0, 0, 0, 1, 1,
-0.3971078, -0.2083249, -2.585792, 0, 0, 0, 1, 1,
-0.3916326, -0.8724539, -2.399119, 1, 1, 1, 1, 1,
-0.3903872, -1.020659, -2.838143, 1, 1, 1, 1, 1,
-0.3894986, -0.7496362, -0.1560156, 1, 1, 1, 1, 1,
-0.3889923, -0.5128153, -2.915248, 1, 1, 1, 1, 1,
-0.3857035, -0.5907296, -3.968287, 1, 1, 1, 1, 1,
-0.3836059, 0.1604115, -1.326727, 1, 1, 1, 1, 1,
-0.3800795, -1.920767, -1.960315, 1, 1, 1, 1, 1,
-0.3796424, 0.3480462, 0.2573883, 1, 1, 1, 1, 1,
-0.3741895, 0.5607838, -0.2196499, 1, 1, 1, 1, 1,
-0.3714887, 0.4423317, -2.485271, 1, 1, 1, 1, 1,
-0.3712673, -0.3162346, -3.146083, 1, 1, 1, 1, 1,
-0.3699519, -0.2045333, -1.969288, 1, 1, 1, 1, 1,
-0.3633887, -0.2485137, -2.791327, 1, 1, 1, 1, 1,
-0.3587841, -1.156121, -3.144187, 1, 1, 1, 1, 1,
-0.3537583, 0.3683726, 0.5970435, 1, 1, 1, 1, 1,
-0.3533568, 0.1801944, -0.6216999, 0, 0, 1, 1, 1,
-0.3452087, -1.311179, -4.049497, 1, 0, 0, 1, 1,
-0.3442789, -0.1144781, -2.613786, 1, 0, 0, 1, 1,
-0.3420899, 0.556763, -1.501568, 1, 0, 0, 1, 1,
-0.3410689, -2.364292, -3.0863, 1, 0, 0, 1, 1,
-0.3369942, -1.191773, -1.677462, 1, 0, 0, 1, 1,
-0.33243, 0.3143131, -1.591969, 0, 0, 0, 1, 1,
-0.327485, 0.4303068, -1.859945, 0, 0, 0, 1, 1,
-0.3261204, 0.2325946, 0.4022388, 0, 0, 0, 1, 1,
-0.3220006, 0.4072534, -2.530083, 0, 0, 0, 1, 1,
-0.3204043, 1.239612, -0.1475655, 0, 0, 0, 1, 1,
-0.3202525, 0.8233995, 0.2978879, 0, 0, 0, 1, 1,
-0.3197432, -0.3999903, -2.859205, 0, 0, 0, 1, 1,
-0.3175711, 1.323615, 1.242455, 1, 1, 1, 1, 1,
-0.3145372, -0.6093798, -2.177018, 1, 1, 1, 1, 1,
-0.3139505, 0.6852135, -0.1857317, 1, 1, 1, 1, 1,
-0.3136572, 0.6133026, 0.2330553, 1, 1, 1, 1, 1,
-0.3112905, -1.449642, -4.030001, 1, 1, 1, 1, 1,
-0.3075639, -0.5102962, -4.173621, 1, 1, 1, 1, 1,
-0.3066114, -0.1972748, -2.082448, 1, 1, 1, 1, 1,
-0.3054326, -0.4436405, -4.006887, 1, 1, 1, 1, 1,
-0.3047953, -2.205835, -4.430183, 1, 1, 1, 1, 1,
-0.2988474, 1.065256, -0.03323744, 1, 1, 1, 1, 1,
-0.291878, -0.7793221, -1.922915, 1, 1, 1, 1, 1,
-0.2861564, -0.246393, -2.014673, 1, 1, 1, 1, 1,
-0.2855391, -0.7293219, -3.94733, 1, 1, 1, 1, 1,
-0.2850625, 0.6473393, -0.4993419, 1, 1, 1, 1, 1,
-0.2841697, -1.635427, -2.320212, 1, 1, 1, 1, 1,
-0.2804883, -0.03834372, -1.383903, 0, 0, 1, 1, 1,
-0.2759207, 0.3138857, -1.637277, 1, 0, 0, 1, 1,
-0.2755267, 1.861441, 2.044997, 1, 0, 0, 1, 1,
-0.2705645, 0.257785, -1.374247, 1, 0, 0, 1, 1,
-0.2675098, -0.3966354, -3.819929, 1, 0, 0, 1, 1,
-0.2673116, 0.1503441, -0.05727233, 1, 0, 0, 1, 1,
-0.2649215, -0.7464516, -4.058961, 0, 0, 0, 1, 1,
-0.2599218, 0.267713, -1.617133, 0, 0, 0, 1, 1,
-0.2592574, -2.71572, -3.304958, 0, 0, 0, 1, 1,
-0.2512845, 0.9514555, -1.031487, 0, 0, 0, 1, 1,
-0.2461049, -0.8243181, -3.405805, 0, 0, 0, 1, 1,
-0.2451992, -0.1274518, -0.5696512, 0, 0, 0, 1, 1,
-0.2451559, 1.60609, 0.1406976, 0, 0, 0, 1, 1,
-0.235884, 0.6934543, -0.9953316, 1, 1, 1, 1, 1,
-0.233955, -1.212564, -3.339858, 1, 1, 1, 1, 1,
-0.2268361, -0.1028155, -2.151495, 1, 1, 1, 1, 1,
-0.2263395, 0.9396607, 0.6997623, 1, 1, 1, 1, 1,
-0.2161759, -0.3570796, -2.452044, 1, 1, 1, 1, 1,
-0.2156328, -0.9465952, -2.776138, 1, 1, 1, 1, 1,
-0.2149987, -1.45323, -3.65241, 1, 1, 1, 1, 1,
-0.2088663, -0.044856, -2.188598, 1, 1, 1, 1, 1,
-0.2082463, -1.702149, -3.586232, 1, 1, 1, 1, 1,
-0.2068323, 0.7438002, 0.5279707, 1, 1, 1, 1, 1,
-0.2021874, -0.7404225, -2.228652, 1, 1, 1, 1, 1,
-0.2013925, -1.629065, -3.159675, 1, 1, 1, 1, 1,
-0.1940176, -0.4136195, -2.116382, 1, 1, 1, 1, 1,
-0.193372, 0.6133625, 0.5787802, 1, 1, 1, 1, 1,
-0.1906598, 1.4388, 0.1677637, 1, 1, 1, 1, 1,
-0.1897778, 0.9636813, -0.2013235, 0, 0, 1, 1, 1,
-0.1880203, -1.755656, -2.076863, 1, 0, 0, 1, 1,
-0.1851568, 0.2063812, -1.119524, 1, 0, 0, 1, 1,
-0.1843626, 0.7318406, 0.6598865, 1, 0, 0, 1, 1,
-0.1829554, -1.747082, -3.21722, 1, 0, 0, 1, 1,
-0.17981, 0.8808255, 1.022355, 1, 0, 0, 1, 1,
-0.1707329, 1.162893, -0.8068966, 0, 0, 0, 1, 1,
-0.1698708, 1.374828, -0.08076371, 0, 0, 0, 1, 1,
-0.1660393, 0.05770386, -3.181166, 0, 0, 0, 1, 1,
-0.1635382, -0.3338534, -1.834408, 0, 0, 0, 1, 1,
-0.1634925, -0.9559275, -2.994498, 0, 0, 0, 1, 1,
-0.157444, -0.6725857, -2.078967, 0, 0, 0, 1, 1,
-0.1562504, 0.8011449, -2.148252, 0, 0, 0, 1, 1,
-0.1497962, -1.717068, -2.593915, 1, 1, 1, 1, 1,
-0.1490244, 2.078662, 0.1140772, 1, 1, 1, 1, 1,
-0.148947, -1.550367, -0.9870202, 1, 1, 1, 1, 1,
-0.1442308, -1.115533, -2.655212, 1, 1, 1, 1, 1,
-0.1425205, -1.049837, -4.033656, 1, 1, 1, 1, 1,
-0.1404376, -0.04440553, -1.803739, 1, 1, 1, 1, 1,
-0.1377837, -0.6432893, -0.6071961, 1, 1, 1, 1, 1,
-0.1374719, 1.941298, 0.4776295, 1, 1, 1, 1, 1,
-0.1325629, 1.068384, -0.1536973, 1, 1, 1, 1, 1,
-0.1291048, 1.203408, 0.2358593, 1, 1, 1, 1, 1,
-0.1230991, 1.04468, -1.110877, 1, 1, 1, 1, 1,
-0.1221387, -1.258558, -3.670747, 1, 1, 1, 1, 1,
-0.1214046, 0.200349, -0.3696451, 1, 1, 1, 1, 1,
-0.1205603, -0.2782941, -1.52221, 1, 1, 1, 1, 1,
-0.1195595, -1.295434, -1.81709, 1, 1, 1, 1, 1,
-0.1193429, -0.8182804, -1.350914, 0, 0, 1, 1, 1,
-0.1117897, 1.284051, -1.005542, 1, 0, 0, 1, 1,
-0.1112805, 0.3693704, 0.6988142, 1, 0, 0, 1, 1,
-0.1073871, 0.10794, -0.5887518, 1, 0, 0, 1, 1,
-0.1071473, 1.595832, 1.224462, 1, 0, 0, 1, 1,
-0.1067292, -0.2478389, -2.081914, 1, 0, 0, 1, 1,
-0.1052082, -0.2942866, -2.033554, 0, 0, 0, 1, 1,
-0.1042308, -0.2192277, -2.342322, 0, 0, 0, 1, 1,
-0.1022482, -1.054551, -1.326811, 0, 0, 0, 1, 1,
-0.09647219, -0.7519711, -3.434305, 0, 0, 0, 1, 1,
-0.09575878, 1.139146, 0.7184705, 0, 0, 0, 1, 1,
-0.08952197, -0.1308462, -3.272008, 0, 0, 0, 1, 1,
-0.08823933, 0.4821926, -0.7832419, 0, 0, 0, 1, 1,
-0.07891463, 1.251819, 1.741796, 1, 1, 1, 1, 1,
-0.07669232, -0.07522035, -0.8338558, 1, 1, 1, 1, 1,
-0.07587903, 1.348847, 0.3066022, 1, 1, 1, 1, 1,
-0.07561149, -0.3490905, -3.173998, 1, 1, 1, 1, 1,
-0.07465307, -1.437816, -2.926077, 1, 1, 1, 1, 1,
-0.0742621, -1.444843, -4.23432, 1, 1, 1, 1, 1,
-0.06626219, -0.1890999, -3.465104, 1, 1, 1, 1, 1,
-0.06576502, 1.659437, 0.1482228, 1, 1, 1, 1, 1,
-0.06522729, -0.01086453, -1.191096, 1, 1, 1, 1, 1,
-0.06484629, 0.1876366, 0.002182055, 1, 1, 1, 1, 1,
-0.05433168, -1.28903, -2.256284, 1, 1, 1, 1, 1,
-0.04745745, -0.9590083, -2.416664, 1, 1, 1, 1, 1,
-0.04698438, -0.004401654, -0.6435109, 1, 1, 1, 1, 1,
-0.0465265, 0.2840516, -0.1242429, 1, 1, 1, 1, 1,
-0.04449553, 0.5700307, -0.9289476, 1, 1, 1, 1, 1,
-0.04406543, -0.4462685, -2.572118, 0, 0, 1, 1, 1,
-0.04241389, 0.08862641, 2.888041, 1, 0, 0, 1, 1,
-0.04086669, 0.4953985, -0.5325887, 1, 0, 0, 1, 1,
-0.03613798, 1.589942, 0.8384401, 1, 0, 0, 1, 1,
-0.03319677, -0.2425583, -3.345523, 1, 0, 0, 1, 1,
-0.03265757, -1.03227, -2.256615, 1, 0, 0, 1, 1,
-0.03129693, -0.243678, -3.056855, 0, 0, 0, 1, 1,
-0.03093072, -1.071118, -2.703171, 0, 0, 0, 1, 1,
-0.02493352, -0.8684713, -5.328261, 0, 0, 0, 1, 1,
-0.01989487, -0.7932687, -3.632885, 0, 0, 0, 1, 1,
-0.01613407, 0.2568175, -2.240283, 0, 0, 0, 1, 1,
-0.0150278, 1.138101, -0.8233123, 0, 0, 0, 1, 1,
-0.01345273, -0.3420126, -3.066987, 0, 0, 0, 1, 1,
-0.01150683, 0.3033826, 0.9231724, 1, 1, 1, 1, 1,
-0.009340152, 0.5039562, 0.4027455, 1, 1, 1, 1, 1,
-0.008548778, -0.01523288, -1.955107, 1, 1, 1, 1, 1,
-0.006223286, 1.000202, -0.1322849, 1, 1, 1, 1, 1,
-0.00401158, -0.6122854, -1.728866, 1, 1, 1, 1, 1,
-0.003852832, 0.08934392, -0.2821446, 1, 1, 1, 1, 1,
-0.001871852, 0.5977507, 0.864355, 1, 1, 1, 1, 1,
0.01434628, -0.7590646, 0.1885856, 1, 1, 1, 1, 1,
0.01519533, -1.12521, 1.91386, 1, 1, 1, 1, 1,
0.01776909, 1.591042, 1.334821, 1, 1, 1, 1, 1,
0.01795869, 0.5600353, 0.5779448, 1, 1, 1, 1, 1,
0.01962267, 1.835276, 1.707289, 1, 1, 1, 1, 1,
0.02051737, -0.6375049, 2.943985, 1, 1, 1, 1, 1,
0.02464722, -1.149598, 3.321732, 1, 1, 1, 1, 1,
0.02931426, 1.180954, 0.5095644, 1, 1, 1, 1, 1,
0.03114008, -1.508895, 3.224349, 0, 0, 1, 1, 1,
0.03559463, -0.4540503, 3.374079, 1, 0, 0, 1, 1,
0.03578969, -1.879199, 3.432671, 1, 0, 0, 1, 1,
0.03830529, -1.006829, 2.752572, 1, 0, 0, 1, 1,
0.04030851, -0.7591246, 2.845104, 1, 0, 0, 1, 1,
0.04135482, -1.596103, 3.127324, 1, 0, 0, 1, 1,
0.04453387, 0.9893989, 1.090913, 0, 0, 0, 1, 1,
0.05447534, 1.041887, 0.07778794, 0, 0, 0, 1, 1,
0.05843722, -0.919789, 6.080795, 0, 0, 0, 1, 1,
0.05931242, -0.2455939, 1.326784, 0, 0, 0, 1, 1,
0.06383691, 0.4235125, 0.414108, 0, 0, 0, 1, 1,
0.06441422, 1.491797, 0.8991653, 0, 0, 0, 1, 1,
0.06739249, -0.4693521, 4.492002, 0, 0, 0, 1, 1,
0.07667191, -1.850657, 3.222053, 1, 1, 1, 1, 1,
0.08059724, 0.2489017, 0.6764395, 1, 1, 1, 1, 1,
0.0815962, -0.4327885, 4.425227, 1, 1, 1, 1, 1,
0.08192013, -0.3934294, 3.238073, 1, 1, 1, 1, 1,
0.08278903, -0.4137506, 2.856781, 1, 1, 1, 1, 1,
0.08295096, 1.458319, 0.9262644, 1, 1, 1, 1, 1,
0.08406343, 0.2773476, 0.5871682, 1, 1, 1, 1, 1,
0.0852872, 1.212139, -0.3703646, 1, 1, 1, 1, 1,
0.08549349, 0.3745283, -0.4049326, 1, 1, 1, 1, 1,
0.08606018, 1.255578, -0.01588815, 1, 1, 1, 1, 1,
0.08673815, 1.122362, -0.4221315, 1, 1, 1, 1, 1,
0.08678315, -0.3028306, 2.100208, 1, 1, 1, 1, 1,
0.08800618, 0.6451033, 0.7339946, 1, 1, 1, 1, 1,
0.08874845, 0.5650616, 0.06140687, 1, 1, 1, 1, 1,
0.08947498, -1.707824, 4.187767, 1, 1, 1, 1, 1,
0.09410021, -0.2860387, 1.655003, 0, 0, 1, 1, 1,
0.09496205, 0.075813, 1.009993, 1, 0, 0, 1, 1,
0.09841956, 1.126669, 0.1525506, 1, 0, 0, 1, 1,
0.09943849, -1.255592, 2.654676, 1, 0, 0, 1, 1,
0.09999373, -1.014124, 4.06419, 1, 0, 0, 1, 1,
0.1010007, -1.043884, 3.813295, 1, 0, 0, 1, 1,
0.1038741, -0.1163383, 3.316507, 0, 0, 0, 1, 1,
0.1063133, 1.158684, 0.3406657, 0, 0, 0, 1, 1,
0.107108, -0.02989879, 1.065471, 0, 0, 0, 1, 1,
0.1092426, 0.2440214, -0.3993384, 0, 0, 0, 1, 1,
0.1094944, -0.06305133, 2.997113, 0, 0, 0, 1, 1,
0.1125399, -0.387553, 2.167102, 0, 0, 0, 1, 1,
0.1151063, -1.107974, 1.740141, 0, 0, 0, 1, 1,
0.1164942, -1.579475, 2.270384, 1, 1, 1, 1, 1,
0.1221316, 0.1255953, 0.4630783, 1, 1, 1, 1, 1,
0.1253518, 0.9787667, -1.452135, 1, 1, 1, 1, 1,
0.1259232, 0.5617824, 0.7044644, 1, 1, 1, 1, 1,
0.1279918, -0.1639405, 1.138009, 1, 1, 1, 1, 1,
0.1354691, -0.2258941, 1.797106, 1, 1, 1, 1, 1,
0.1378686, 0.5777675, -0.1261862, 1, 1, 1, 1, 1,
0.1431081, -1.845048, 3.500452, 1, 1, 1, 1, 1,
0.1443015, -0.2263605, 3.51392, 1, 1, 1, 1, 1,
0.1460203, -1.528705, 1.959279, 1, 1, 1, 1, 1,
0.1505725, -0.6506027, 2.675391, 1, 1, 1, 1, 1,
0.1509282, -1.356897, 3.343243, 1, 1, 1, 1, 1,
0.1582671, -0.3554099, 3.767948, 1, 1, 1, 1, 1,
0.161039, -1.157866, 2.245342, 1, 1, 1, 1, 1,
0.1646659, -2.38087, 2.172916, 1, 1, 1, 1, 1,
0.1675035, 0.01501171, 0.8819906, 0, 0, 1, 1, 1,
0.1704874, 0.6155557, -0.4460726, 1, 0, 0, 1, 1,
0.1710108, -0.4125474, 1.99227, 1, 0, 0, 1, 1,
0.1725361, -0.2386562, 4.533191, 1, 0, 0, 1, 1,
0.173175, -0.03215716, 0.9815607, 1, 0, 0, 1, 1,
0.1782978, -0.8385811, 1.734094, 1, 0, 0, 1, 1,
0.1827185, -0.7742095, 3.173303, 0, 0, 0, 1, 1,
0.1840585, 1.298495, 0.2152059, 0, 0, 0, 1, 1,
0.1937588, 0.485253, 0.7250828, 0, 0, 0, 1, 1,
0.1952747, -0.03141554, -0.472615, 0, 0, 0, 1, 1,
0.1981588, 1.275326, 0.811585, 0, 0, 0, 1, 1,
0.2002113, 1.013255, 0.6336292, 0, 0, 0, 1, 1,
0.2025413, -1.193455, 3.799144, 0, 0, 0, 1, 1,
0.2029654, -0.03905137, 1.070545, 1, 1, 1, 1, 1,
0.2060738, -1.346611, 2.57405, 1, 1, 1, 1, 1,
0.2061565, 0.176912, 1.335424, 1, 1, 1, 1, 1,
0.2066725, 0.5048122, 0.208362, 1, 1, 1, 1, 1,
0.2092049, -0.1224997, 3.790457, 1, 1, 1, 1, 1,
0.2133067, 0.5161598, 1.566227, 1, 1, 1, 1, 1,
0.2144524, 0.9464748, 0.9075176, 1, 1, 1, 1, 1,
0.2163197, 0.4131435, 1.095958, 1, 1, 1, 1, 1,
0.2166, -0.4717042, 3.240021, 1, 1, 1, 1, 1,
0.2167648, -1.10754, 4.784243, 1, 1, 1, 1, 1,
0.2201874, -0.2548853, 3.885777, 1, 1, 1, 1, 1,
0.2218734, -0.1671274, 1.758112, 1, 1, 1, 1, 1,
0.222037, 1.692648, -0.9988558, 1, 1, 1, 1, 1,
0.2265103, 0.4561674, 1.383764, 1, 1, 1, 1, 1,
0.226668, -1.205313, 4.921273, 1, 1, 1, 1, 1,
0.2267775, 0.2628509, 0.7363835, 0, 0, 1, 1, 1,
0.2354313, 0.02861973, 0.3713969, 1, 0, 0, 1, 1,
0.2358607, 1.46465, 0.9619327, 1, 0, 0, 1, 1,
0.2386119, -1.41309, 2.628306, 1, 0, 0, 1, 1,
0.2432216, -0.3560033, 0.6368532, 1, 0, 0, 1, 1,
0.2435526, -0.6420904, 2.77415, 1, 0, 0, 1, 1,
0.2435617, 0.6804339, -0.5600854, 0, 0, 0, 1, 1,
0.2495422, -1.010826, 3.545102, 0, 0, 0, 1, 1,
0.2505579, 0.02759516, 1.533097, 0, 0, 0, 1, 1,
0.2517413, -0.5201746, 1.995715, 0, 0, 0, 1, 1,
0.2523245, 1.822246, 0.7941141, 0, 0, 0, 1, 1,
0.2525405, 0.8565422, 0.4779861, 0, 0, 0, 1, 1,
0.2530784, 0.6859027, 7.094908e-05, 0, 0, 0, 1, 1,
0.2556584, 0.3672768, 1.55678, 1, 1, 1, 1, 1,
0.2591528, 0.9663603, 0.8953884, 1, 1, 1, 1, 1,
0.2595956, -0.4664612, 2.096716, 1, 1, 1, 1, 1,
0.2616378, 0.7605257, 2.358309, 1, 1, 1, 1, 1,
0.2619162, 0.4195819, -0.3132266, 1, 1, 1, 1, 1,
0.2642045, -0.8292041, 1.402437, 1, 1, 1, 1, 1,
0.2698606, 0.6159652, 0.3087675, 1, 1, 1, 1, 1,
0.2718303, -0.140767, 3.317734, 1, 1, 1, 1, 1,
0.2728031, 1.294138, -0.7959732, 1, 1, 1, 1, 1,
0.2788061, 0.1092402, 0.4626507, 1, 1, 1, 1, 1,
0.2801945, -0.3579045, 1.920051, 1, 1, 1, 1, 1,
0.2822968, -1.761391, 1.629644, 1, 1, 1, 1, 1,
0.2831808, 0.2990101, -0.5622504, 1, 1, 1, 1, 1,
0.2839198, -0.7999331, 2.054192, 1, 1, 1, 1, 1,
0.285275, 1.74502, 1.809598, 1, 1, 1, 1, 1,
0.2861761, 1.140252, -0.7746704, 0, 0, 1, 1, 1,
0.291592, 0.4109202, -0.5904402, 1, 0, 0, 1, 1,
0.2939884, -0.9737834, 0.8130175, 1, 0, 0, 1, 1,
0.296407, 0.7177, 1.30187, 1, 0, 0, 1, 1,
0.2987546, -0.1873102, 0.2335664, 1, 0, 0, 1, 1,
0.3054562, -0.7330834, 2.524197, 1, 0, 0, 1, 1,
0.307983, 1.127715, 1.114371, 0, 0, 0, 1, 1,
0.3107858, -1.171795, 4.440537, 0, 0, 0, 1, 1,
0.3133836, -0.04443453, 1.457399, 0, 0, 0, 1, 1,
0.3144664, 0.714507, -0.3912404, 0, 0, 0, 1, 1,
0.315881, 0.9294483, 1.494794, 0, 0, 0, 1, 1,
0.3159378, -1.359215, 0.5782026, 0, 0, 0, 1, 1,
0.3187717, -1.269226, 2.154564, 0, 0, 0, 1, 1,
0.3189822, -0.05722132, 1.134362, 1, 1, 1, 1, 1,
0.3193769, -0.1228405, 2.891255, 1, 1, 1, 1, 1,
0.3249075, -1.053011, 2.111859, 1, 1, 1, 1, 1,
0.3251896, -0.9752891, 1.683032, 1, 1, 1, 1, 1,
0.3251902, -1.649498, 5.000385, 1, 1, 1, 1, 1,
0.3252578, 1.214384, 0.8431548, 1, 1, 1, 1, 1,
0.3306116, 0.4638495, 0.3532159, 1, 1, 1, 1, 1,
0.3313675, -0.4956329, 1.352153, 1, 1, 1, 1, 1,
0.3349434, 1.652113, 0.8779523, 1, 1, 1, 1, 1,
0.3385519, 0.5530551, 2.26205, 1, 1, 1, 1, 1,
0.3424888, -0.3550049, 3.188928, 1, 1, 1, 1, 1,
0.3433618, 0.4812698, 0.4581285, 1, 1, 1, 1, 1,
0.344651, 1.585903, 1.284812, 1, 1, 1, 1, 1,
0.3462387, -0.2645219, 2.419814, 1, 1, 1, 1, 1,
0.3468102, -1.592321, 1.824879, 1, 1, 1, 1, 1,
0.3475158, -1.135142, 1.746531, 0, 0, 1, 1, 1,
0.3492009, -0.5148146, 4.545994, 1, 0, 0, 1, 1,
0.3540167, -0.2686264, 2.427246, 1, 0, 0, 1, 1,
0.3543614, 1.119451, 0.1548232, 1, 0, 0, 1, 1,
0.3575545, 0.8462868, 0.9071292, 1, 0, 0, 1, 1,
0.357593, 0.7102449, -0.5380155, 1, 0, 0, 1, 1,
0.3580354, -0.5759785, 1.818275, 0, 0, 0, 1, 1,
0.3674687, 0.3532956, 0.6080964, 0, 0, 0, 1, 1,
0.3674704, 1.753745, 0.7486889, 0, 0, 0, 1, 1,
0.3724073, -0.7850509, 2.236926, 0, 0, 0, 1, 1,
0.3767843, 0.7652819, 0.6546664, 0, 0, 0, 1, 1,
0.3789721, 2.11519, 1.103728, 0, 0, 0, 1, 1,
0.3835311, -1.285255, 2.49366, 0, 0, 0, 1, 1,
0.3876954, 0.2161694, -0.4884798, 1, 1, 1, 1, 1,
0.389154, -0.06967798, 2.308314, 1, 1, 1, 1, 1,
0.3892616, 1.114248, 0.0529458, 1, 1, 1, 1, 1,
0.3944247, -0.2423476, 2.682279, 1, 1, 1, 1, 1,
0.3951613, -0.8352157, 2.781082, 1, 1, 1, 1, 1,
0.3968334, 0.5227953, 1.864282, 1, 1, 1, 1, 1,
0.4071592, 0.8480952, -0.03689871, 1, 1, 1, 1, 1,
0.4102668, 0.2112741, 2.241642, 1, 1, 1, 1, 1,
0.4104056, 1.145438, -0.508936, 1, 1, 1, 1, 1,
0.4146335, 1.187826, 0.1519882, 1, 1, 1, 1, 1,
0.4161293, 0.8252393, 2.108467, 1, 1, 1, 1, 1,
0.4167882, -0.8194056, 1.66388, 1, 1, 1, 1, 1,
0.4169791, 1.302738, -0.1577054, 1, 1, 1, 1, 1,
0.4178797, -1.101915, 2.981067, 1, 1, 1, 1, 1,
0.4271117, -0.1413107, 2.191999, 1, 1, 1, 1, 1,
0.4280146, -1.070878, 3.636012, 0, 0, 1, 1, 1,
0.4287798, -1.796561, 3.091939, 1, 0, 0, 1, 1,
0.4291549, 0.9487516, 0.5830871, 1, 0, 0, 1, 1,
0.4327293, -0.3869202, 1.242203, 1, 0, 0, 1, 1,
0.4340926, 0.1145224, -0.03871407, 1, 0, 0, 1, 1,
0.4352836, 0.9016168, -0.8591242, 1, 0, 0, 1, 1,
0.4358135, -0.284821, 3.216997, 0, 0, 0, 1, 1,
0.4377407, -0.3983977, 2.234915, 0, 0, 0, 1, 1,
0.4381481, -1.029045, 2.040543, 0, 0, 0, 1, 1,
0.4473922, 0.3600769, 1.991952, 0, 0, 0, 1, 1,
0.4484577, -0.139611, 0.3599807, 0, 0, 0, 1, 1,
0.459024, -0.9873298, 2.397743, 0, 0, 0, 1, 1,
0.4604669, -1.130363, 3.212335, 0, 0, 0, 1, 1,
0.4608124, -1.513761, 3.753727, 1, 1, 1, 1, 1,
0.4609579, -1.129637, 2.617868, 1, 1, 1, 1, 1,
0.4616801, -0.8247501, 2.189332, 1, 1, 1, 1, 1,
0.4620984, -0.2752126, 2.676674, 1, 1, 1, 1, 1,
0.4686377, -1.212813, 3.662573, 1, 1, 1, 1, 1,
0.4694385, 0.1360096, 1.025273, 1, 1, 1, 1, 1,
0.4709677, 2.022527, -0.5124177, 1, 1, 1, 1, 1,
0.4713341, 0.5596191, 1.964871, 1, 1, 1, 1, 1,
0.4759685, 2.565776, -0.3664303, 1, 1, 1, 1, 1,
0.4782606, 0.4940636, 0.2030351, 1, 1, 1, 1, 1,
0.4793687, -0.02230172, 1.205849, 1, 1, 1, 1, 1,
0.4825451, 1.15662, 1.646067, 1, 1, 1, 1, 1,
0.482797, 0.3564967, 1.932411, 1, 1, 1, 1, 1,
0.486926, 0.07710246, 2.145065, 1, 1, 1, 1, 1,
0.489844, 0.1423806, 1.1804, 1, 1, 1, 1, 1,
0.494868, 2.225443, -0.8073795, 0, 0, 1, 1, 1,
0.4958859, -0.07558417, 2.680149, 1, 0, 0, 1, 1,
0.4966755, -0.5184752, 2.186694, 1, 0, 0, 1, 1,
0.4996758, -0.957224, 3.478242, 1, 0, 0, 1, 1,
0.4999652, -0.8021008, 3.281725, 1, 0, 0, 1, 1,
0.5001926, 1.206785, 1.282721, 1, 0, 0, 1, 1,
0.5006459, -1.348013, 3.247969, 0, 0, 0, 1, 1,
0.5025969, 0.08342424, 1.09831, 0, 0, 0, 1, 1,
0.5039988, 1.844081, -0.0236621, 0, 0, 0, 1, 1,
0.5041593, 1.520218, 0.3915003, 0, 0, 0, 1, 1,
0.510686, -2.055634, 1.808871, 0, 0, 0, 1, 1,
0.5142809, -0.6623659, 2.927455, 0, 0, 0, 1, 1,
0.5151984, 0.006898764, 0.2105501, 0, 0, 0, 1, 1,
0.5189449, -0.000159024, 1.164234, 1, 1, 1, 1, 1,
0.521753, -1.032809, 2.709627, 1, 1, 1, 1, 1,
0.5229738, 2.667466, -0.6068138, 1, 1, 1, 1, 1,
0.5231927, 1.974108, 2.198109, 1, 1, 1, 1, 1,
0.5233165, -1.416214, 3.591834, 1, 1, 1, 1, 1,
0.5279965, -1.66373, 1.958747, 1, 1, 1, 1, 1,
0.5296962, -0.5775834, 2.322124, 1, 1, 1, 1, 1,
0.5324312, -1.030648, 1.370675, 1, 1, 1, 1, 1,
0.533902, -0.6757709, 4.065067, 1, 1, 1, 1, 1,
0.5346754, -1.23117, 2.012254, 1, 1, 1, 1, 1,
0.5356707, -0.8114709, 2.144984, 1, 1, 1, 1, 1,
0.5361508, -1.961055, 2.814107, 1, 1, 1, 1, 1,
0.5370953, 0.3001451, 2.301058, 1, 1, 1, 1, 1,
0.5391256, -0.2729085, 3.150857, 1, 1, 1, 1, 1,
0.5410649, 1.313213, 2.438659, 1, 1, 1, 1, 1,
0.5418423, -0.7544532, 2.051914, 0, 0, 1, 1, 1,
0.5424246, 1.226775, 0.717862, 1, 0, 0, 1, 1,
0.5454203, -1.002007, 2.752017, 1, 0, 0, 1, 1,
0.5485093, 1.712394, -0.9410601, 1, 0, 0, 1, 1,
0.549078, 0.9154946, 0.6798526, 1, 0, 0, 1, 1,
0.5497565, -0.6186267, 3.613561, 1, 0, 0, 1, 1,
0.5511296, -1.180607, 1.006191, 0, 0, 0, 1, 1,
0.5594334, -0.1197548, 0.6661223, 0, 0, 0, 1, 1,
0.5621852, -0.0391835, 1.954819, 0, 0, 0, 1, 1,
0.5651312, -0.6385916, 3.276663, 0, 0, 0, 1, 1,
0.5665187, -1.715807, 3.373381, 0, 0, 0, 1, 1,
0.5671399, -1.308483, 4.890726, 0, 0, 0, 1, 1,
0.575955, -1.047813, 3.02127, 0, 0, 0, 1, 1,
0.5786445, -0.6689098, 0.7698597, 1, 1, 1, 1, 1,
0.5798259, -1.774579, 2.03536, 1, 1, 1, 1, 1,
0.5914899, 1.032202, 1.007641, 1, 1, 1, 1, 1,
0.5949203, -0.5860243, 3.808704, 1, 1, 1, 1, 1,
0.6079184, 0.5948317, 0.4910704, 1, 1, 1, 1, 1,
0.6094611, -1.282803, 2.649339, 1, 1, 1, 1, 1,
0.6111428, 0.4808795, 1.068333, 1, 1, 1, 1, 1,
0.6130899, -0.869978, 0.6054072, 1, 1, 1, 1, 1,
0.6208923, -0.3836245, 2.208892, 1, 1, 1, 1, 1,
0.6255277, 0.1137971, 1.985786, 1, 1, 1, 1, 1,
0.6280277, -1.242235, 3.448898, 1, 1, 1, 1, 1,
0.6307554, 0.10509, 2.207322, 1, 1, 1, 1, 1,
0.6309422, -0.08849036, 2.786924, 1, 1, 1, 1, 1,
0.6311182, 0.06135808, 2.529996, 1, 1, 1, 1, 1,
0.631145, 1.020464, -0.4720349, 1, 1, 1, 1, 1,
0.6355808, 1.48263, 1.162857, 0, 0, 1, 1, 1,
0.6391608, -0.2494715, 2.834113, 1, 0, 0, 1, 1,
0.6402382, -0.5817931, 2.167995, 1, 0, 0, 1, 1,
0.644072, 0.5526955, -0.623989, 1, 0, 0, 1, 1,
0.6450447, -0.01245657, 0.5155371, 1, 0, 0, 1, 1,
0.6455602, 1.094084, 1.310108, 1, 0, 0, 1, 1,
0.6489225, 1.249602, 1.937949, 0, 0, 0, 1, 1,
0.6495221, 0.4406431, -0.1895133, 0, 0, 0, 1, 1,
0.6495288, 1.167081, 1.729342, 0, 0, 0, 1, 1,
0.6524003, -0.6551778, 2.671562, 0, 0, 0, 1, 1,
0.6537542, 0.6437071, 0.7224928, 0, 0, 0, 1, 1,
0.6542651, 1.135629, 0.7563534, 0, 0, 0, 1, 1,
0.6557923, -0.6174436, 1.061443, 0, 0, 0, 1, 1,
0.6616484, -1.1036, 3.089753, 1, 1, 1, 1, 1,
0.6745473, 2.001352, -0.3355982, 1, 1, 1, 1, 1,
0.6797798, -1.993976, 0.5646071, 1, 1, 1, 1, 1,
0.6803583, 1.071035, 1.184363, 1, 1, 1, 1, 1,
0.6823442, 0.8417863, 0.819577, 1, 1, 1, 1, 1,
0.6899767, -0.8436596, 0.9814572, 1, 1, 1, 1, 1,
0.69152, -1.801902, 3.133942, 1, 1, 1, 1, 1,
0.6980286, -1.378372, 2.256242, 1, 1, 1, 1, 1,
0.707024, -0.4070265, 2.019772, 1, 1, 1, 1, 1,
0.7086479, 0.7698275, -0.3370366, 1, 1, 1, 1, 1,
0.7087946, 0.01282897, 2.628718, 1, 1, 1, 1, 1,
0.7116193, 1.328656, 0.6762763, 1, 1, 1, 1, 1,
0.7190366, -0.6797861, 1.558184, 1, 1, 1, 1, 1,
0.7215458, 0.6441085, 1.08228, 1, 1, 1, 1, 1,
0.734937, 0.4635523, 1.937015, 1, 1, 1, 1, 1,
0.7373609, 0.6662974, 2.630296, 0, 0, 1, 1, 1,
0.7400621, 0.210366, -0.2282495, 1, 0, 0, 1, 1,
0.7430559, 0.05069917, 1.757549, 1, 0, 0, 1, 1,
0.7432584, -1.12724, 5.638481, 1, 0, 0, 1, 1,
0.7454407, -0.9622853, 0.5647628, 1, 0, 0, 1, 1,
0.7454667, -2.357263, 3.66746, 1, 0, 0, 1, 1,
0.7485482, 0.3801086, 0.4957685, 0, 0, 0, 1, 1,
0.7498323, -1.767175, 3.954477, 0, 0, 0, 1, 1,
0.7558973, 0.3140815, 1.707714, 0, 0, 0, 1, 1,
0.7612234, -0.1510858, 1.874292, 0, 0, 0, 1, 1,
0.7628129, 0.3199452, 1.164567, 0, 0, 0, 1, 1,
0.7666212, 0.1108354, 1.04731, 0, 0, 0, 1, 1,
0.7704805, 0.6576903, 3.693322, 0, 0, 0, 1, 1,
0.7720241, -0.6652032, 2.089948, 1, 1, 1, 1, 1,
0.7741578, -0.2185064, 2.267108, 1, 1, 1, 1, 1,
0.775265, 0.06096034, 2.335079, 1, 1, 1, 1, 1,
0.7838722, 0.2531951, 1.794974, 1, 1, 1, 1, 1,
0.7875584, 0.01479076, 0.7570512, 1, 1, 1, 1, 1,
0.789632, 0.3108379, 2.247483, 1, 1, 1, 1, 1,
0.7927609, 1.84568, -0.009604784, 1, 1, 1, 1, 1,
0.7934569, -0.2616845, 3.0848, 1, 1, 1, 1, 1,
0.7937801, 1.718876, -0.1972099, 1, 1, 1, 1, 1,
0.7943876, 0.1394788, -0.4256354, 1, 1, 1, 1, 1,
0.7971578, -1.243159, 3.141901, 1, 1, 1, 1, 1,
0.8097187, -0.9502681, 4.164579, 1, 1, 1, 1, 1,
0.8110586, 1.466229, 0.7539281, 1, 1, 1, 1, 1,
0.8150448, 1.250483, -0.8627362, 1, 1, 1, 1, 1,
0.8236024, -0.40657, 1.626576, 1, 1, 1, 1, 1,
0.828272, -1.164722, 2.734507, 0, 0, 1, 1, 1,
0.8331594, -0.2447259, 1.205809, 1, 0, 0, 1, 1,
0.8342929, -1.261178, 2.873622, 1, 0, 0, 1, 1,
0.8342983, 1.106254, 1.897407, 1, 0, 0, 1, 1,
0.8373568, -0.9625427, 2.335162, 1, 0, 0, 1, 1,
0.851278, 0.877974, 0.5083835, 1, 0, 0, 1, 1,
0.85161, -0.09828634, 1.737875, 0, 0, 0, 1, 1,
0.8518253, 1.413102, 0.9133009, 0, 0, 0, 1, 1,
0.8537898, -0.6639426, 1.717597, 0, 0, 0, 1, 1,
0.854544, -0.2219023, 2.962577, 0, 0, 0, 1, 1,
0.8593636, -0.4612063, 0.1592417, 0, 0, 0, 1, 1,
0.8648622, -0.4228736, 3.36085, 0, 0, 0, 1, 1,
0.8721541, 0.2417724, 3.382058, 0, 0, 0, 1, 1,
0.8774776, -1.079183, 3.970901, 1, 1, 1, 1, 1,
0.8802944, -1.004545, 2.076687, 1, 1, 1, 1, 1,
0.8820798, -0.3406905, 2.210273, 1, 1, 1, 1, 1,
0.883318, -0.2810275, 2.614319, 1, 1, 1, 1, 1,
0.8839845, 2.212646, 1.18031, 1, 1, 1, 1, 1,
0.9022516, 0.4599385, 1.464738, 1, 1, 1, 1, 1,
0.9086626, -0.2894194, 3.344545, 1, 1, 1, 1, 1,
0.910134, -0.1723875, 1.863396, 1, 1, 1, 1, 1,
0.9136663, -0.4781226, 3.408563, 1, 1, 1, 1, 1,
0.9155419, -0.4651864, 3.305098, 1, 1, 1, 1, 1,
0.9199606, 0.4766607, 1.345697, 1, 1, 1, 1, 1,
0.9274842, -0.6421105, 2.665286, 1, 1, 1, 1, 1,
0.9349372, -0.2618683, 2.107607, 1, 1, 1, 1, 1,
0.9352346, -1.357485, 2.396141, 1, 1, 1, 1, 1,
0.9361489, -0.5496159, 2.504414, 1, 1, 1, 1, 1,
0.9362779, -1.133191, 3.068484, 0, 0, 1, 1, 1,
0.9379491, -1.698692, 3.58039, 1, 0, 0, 1, 1,
0.9382842, 0.2330296, 0.5394848, 1, 0, 0, 1, 1,
0.9401876, 1.655943, -0.4352996, 1, 0, 0, 1, 1,
0.9438296, -1.83067, 3.585056, 1, 0, 0, 1, 1,
0.9458536, -0.01468736, 0.7335761, 1, 0, 0, 1, 1,
0.9515035, -1.128367, 2.479276, 0, 0, 0, 1, 1,
0.9539585, -0.8839999, 2.065101, 0, 0, 0, 1, 1,
0.9548897, 2.772142, -0.6314903, 0, 0, 0, 1, 1,
0.955768, -1.883354, 2.049938, 0, 0, 0, 1, 1,
0.9561015, 1.035642, 2.077305, 0, 0, 0, 1, 1,
0.9687734, -0.9254291, 3.091917, 0, 0, 0, 1, 1,
0.9722068, 1.605247, -0.2701146, 0, 0, 0, 1, 1,
0.9751943, 0.9992359, 0.9367836, 1, 1, 1, 1, 1,
0.9790254, -0.4629243, 3.398972, 1, 1, 1, 1, 1,
0.9793667, -1.284258, 2.278892, 1, 1, 1, 1, 1,
0.9816248, 0.1784985, 0.09363364, 1, 1, 1, 1, 1,
0.9939331, -1.063512, 1.337804, 1, 1, 1, 1, 1,
1.005027, -0.07678549, 1.598197, 1, 1, 1, 1, 1,
1.007494, 1.398606, -0.6883233, 1, 1, 1, 1, 1,
1.008511, 1.2018, 0.8208616, 1, 1, 1, 1, 1,
1.025482, 1.406617, 0.3588673, 1, 1, 1, 1, 1,
1.027767, -0.08068732, 0.9105957, 1, 1, 1, 1, 1,
1.028681, -1.619757, 2.105084, 1, 1, 1, 1, 1,
1.038243, 1.966849, 1.879582, 1, 1, 1, 1, 1,
1.0392, 0.2975402, 2.311697, 1, 1, 1, 1, 1,
1.047227, -0.6663774, -0.335346, 1, 1, 1, 1, 1,
1.047782, 1.031108, 1.388879, 1, 1, 1, 1, 1,
1.050447, 0.8714685, 1.486011, 0, 0, 1, 1, 1,
1.051536, -0.8810546, 2.253197, 1, 0, 0, 1, 1,
1.058623, -0.9210045, 0.668451, 1, 0, 0, 1, 1,
1.061323, -1.311022, 3.532678, 1, 0, 0, 1, 1,
1.061877, 1.338101, 0.8346014, 1, 0, 0, 1, 1,
1.06235, -0.6550615, 2.721941, 1, 0, 0, 1, 1,
1.062767, 0.386137, 0.6214477, 0, 0, 0, 1, 1,
1.065985, 1.138037, 1.450501, 0, 0, 0, 1, 1,
1.067152, 0.2525441, 1.803438, 0, 0, 0, 1, 1,
1.067674, 1.000415, 1.235677, 0, 0, 0, 1, 1,
1.068672, 1.283818, 0.3613066, 0, 0, 0, 1, 1,
1.069139, 1.317341, 0.06376, 0, 0, 0, 1, 1,
1.093045, -0.7190843, 3.074699, 0, 0, 0, 1, 1,
1.095308, 1.697533, 0.02094554, 1, 1, 1, 1, 1,
1.095782, -0.8733791, 1.683938, 1, 1, 1, 1, 1,
1.102066, -1.031585, 2.248736, 1, 1, 1, 1, 1,
1.104033, -2.22313, 2.057785, 1, 1, 1, 1, 1,
1.109392, -0.09420682, 1.084709, 1, 1, 1, 1, 1,
1.11018, 1.296384, -0.6290873, 1, 1, 1, 1, 1,
1.113076, 1.827839, 2.089638, 1, 1, 1, 1, 1,
1.114479, 0.5577203, 0.1511033, 1, 1, 1, 1, 1,
1.120454, -0.2278049, 0.9058598, 1, 1, 1, 1, 1,
1.128709, 0.287185, 1.257531, 1, 1, 1, 1, 1,
1.129706, 0.9917955, 0.1947073, 1, 1, 1, 1, 1,
1.13329, 0.3796561, 0.8873394, 1, 1, 1, 1, 1,
1.13353, -0.06162188, 1.760024, 1, 1, 1, 1, 1,
1.141489, -0.3255617, 1.683876, 1, 1, 1, 1, 1,
1.142037, -0.9506491, 2.357907, 1, 1, 1, 1, 1,
1.147712, 0.9123853, 0.6181219, 0, 0, 1, 1, 1,
1.164517, -0.1351794, -0.6002313, 1, 0, 0, 1, 1,
1.166142, 0.1442804, 1.426934, 1, 0, 0, 1, 1,
1.168728, -0.6292962, 1.500853, 1, 0, 0, 1, 1,
1.168959, -1.504105, 3.674663, 1, 0, 0, 1, 1,
1.173258, 0.5739795, 1.471667, 1, 0, 0, 1, 1,
1.173335, 0.686015, 1.68975, 0, 0, 0, 1, 1,
1.177942, -1.465891, 0.4375742, 0, 0, 0, 1, 1,
1.182567, 0.1275609, 1.223925, 0, 0, 0, 1, 1,
1.183912, -0.6379423, 1.258576, 0, 0, 0, 1, 1,
1.184261, 0.5562087, 1.143538, 0, 0, 0, 1, 1,
1.188083, -0.4511617, 3.279435, 0, 0, 0, 1, 1,
1.198601, 0.03358437, 0.8245396, 0, 0, 0, 1, 1,
1.199059, 1.110785, 0.08740145, 1, 1, 1, 1, 1,
1.200175, 0.7255314, 2.934809, 1, 1, 1, 1, 1,
1.211227, 1.226544, -0.09208439, 1, 1, 1, 1, 1,
1.225153, -1.535203, 3.014125, 1, 1, 1, 1, 1,
1.231372, -0.06719071, 2.17134, 1, 1, 1, 1, 1,
1.234121, -0.242526, 1.616069, 1, 1, 1, 1, 1,
1.238271, -1.732323, 3.839614, 1, 1, 1, 1, 1,
1.239125, 0.3291091, 1.452243, 1, 1, 1, 1, 1,
1.258717, 1.067426, -0.09953998, 1, 1, 1, 1, 1,
1.258772, 1.120289, 1.457857, 1, 1, 1, 1, 1,
1.260213, 2.304359, 0.1796812, 1, 1, 1, 1, 1,
1.266715, -0.02660554, 1.271156, 1, 1, 1, 1, 1,
1.269086, 0.9324837, 0.4563271, 1, 1, 1, 1, 1,
1.276972, -0.5240548, 0.5924099, 1, 1, 1, 1, 1,
1.28117, -1.892747, 3.570145, 1, 1, 1, 1, 1,
1.287463, -0.8528169, 2.513247, 0, 0, 1, 1, 1,
1.289952, 1.258332, 0.8394489, 1, 0, 0, 1, 1,
1.306246, -1.959817, 1.275328, 1, 0, 0, 1, 1,
1.307578, 0.1266187, 1.259408, 1, 0, 0, 1, 1,
1.315073, -0.1365139, 0.6584421, 1, 0, 0, 1, 1,
1.316405, -0.2637823, 1.066084, 1, 0, 0, 1, 1,
1.325347, -0.2648585, 2.386035, 0, 0, 0, 1, 1,
1.331261, -0.193426, 2.371348, 0, 0, 0, 1, 1,
1.333743, 0.7259585, 0.8250927, 0, 0, 0, 1, 1,
1.342693, -0.6476607, 3.457551, 0, 0, 0, 1, 1,
1.355148, -0.04627471, 1.673208, 0, 0, 0, 1, 1,
1.375715, -0.8645694, 3.517313, 0, 0, 0, 1, 1,
1.380094, 2.319981, -0.2011412, 0, 0, 0, 1, 1,
1.380416, 0.0375844, 2.296705, 1, 1, 1, 1, 1,
1.39268, -0.7071267, 1.625406, 1, 1, 1, 1, 1,
1.396367, -1.223226, 1.611995, 1, 1, 1, 1, 1,
1.415921, -1.111597, 0.9916142, 1, 1, 1, 1, 1,
1.433317, -0.8241338, 2.194022, 1, 1, 1, 1, 1,
1.437586, 0.3858123, 2.398272, 1, 1, 1, 1, 1,
1.442235, 1.320278, 0.9070818, 1, 1, 1, 1, 1,
1.450514, -0.4233605, 0.5195971, 1, 1, 1, 1, 1,
1.459095, 2.579143, 1.664019, 1, 1, 1, 1, 1,
1.459887, 0.2828327, 2.917027, 1, 1, 1, 1, 1,
1.46129, -0.479734, 2.890451, 1, 1, 1, 1, 1,
1.465875, -1.088809, 1.713142, 1, 1, 1, 1, 1,
1.478927, 0.4706566, -0.451058, 1, 1, 1, 1, 1,
1.483178, 1.337246, 1.450908, 1, 1, 1, 1, 1,
1.483348, 0.7442331, 1.256549, 1, 1, 1, 1, 1,
1.488281, 1.05708, 0.05287806, 0, 0, 1, 1, 1,
1.489602, 0.06644423, 1.548011, 1, 0, 0, 1, 1,
1.496823, -1.322604, 2.490512, 1, 0, 0, 1, 1,
1.499311, -0.0448319, 1.083535, 1, 0, 0, 1, 1,
1.504478, -2.051335, 2.003695, 1, 0, 0, 1, 1,
1.510415, 1.8534, 0.8091326, 1, 0, 0, 1, 1,
1.523444, -0.2358287, 3.549643, 0, 0, 0, 1, 1,
1.542746, -0.5194868, 2.22607, 0, 0, 0, 1, 1,
1.543013, -0.2154879, 2.038276, 0, 0, 0, 1, 1,
1.562136, -0.2537465, 3.229035, 0, 0, 0, 1, 1,
1.568179, -0.01491548, 1.140564, 0, 0, 0, 1, 1,
1.569579, -1.073689, 2.861489, 0, 0, 0, 1, 1,
1.575658, 1.268418, 1.576792, 0, 0, 0, 1, 1,
1.588688, 0.5955556, 0.8295622, 1, 1, 1, 1, 1,
1.590935, -0.322812, -0.07360089, 1, 1, 1, 1, 1,
1.595361, -0.7184861, 2.829639, 1, 1, 1, 1, 1,
1.603138, 0.9907918, 1.070429, 1, 1, 1, 1, 1,
1.605804, -1.256692, 1.780232, 1, 1, 1, 1, 1,
1.631949, 0.3108379, 1.884729, 1, 1, 1, 1, 1,
1.64699, 1.418254, 2.481964, 1, 1, 1, 1, 1,
1.654751, 0.01415736, 0.9605452, 1, 1, 1, 1, 1,
1.667161, -0.3542424, 2.046322, 1, 1, 1, 1, 1,
1.672072, -0.941105, 2.853923, 1, 1, 1, 1, 1,
1.683668, -0.8022069, 1.650289, 1, 1, 1, 1, 1,
1.702122, 0.1503023, 1.528851, 1, 1, 1, 1, 1,
1.704158, -2.509893, 1.684618, 1, 1, 1, 1, 1,
1.71329, -1.073985, 1.746912, 1, 1, 1, 1, 1,
1.726554, -1.022655, 0.9457212, 1, 1, 1, 1, 1,
1.731558, 0.5547797, 0.5058361, 0, 0, 1, 1, 1,
1.735433, 0.2029891, 1.569993, 1, 0, 0, 1, 1,
1.745114, -3.094501, 3.642307, 1, 0, 0, 1, 1,
1.753667, -0.1388321, 1.758159, 1, 0, 0, 1, 1,
1.797806, -0.480963, 1.328916, 1, 0, 0, 1, 1,
1.798472, -0.3423657, 1.971216, 1, 0, 0, 1, 1,
1.80223, 0.7407542, 1.227616, 0, 0, 0, 1, 1,
1.811538, -2.083139, 2.491905, 0, 0, 0, 1, 1,
1.812699, -0.1348796, 1.680451, 0, 0, 0, 1, 1,
1.844228, -0.7100132, 0.9025142, 0, 0, 0, 1, 1,
1.846515, 2.016578, 0.4795533, 0, 0, 0, 1, 1,
1.851704, 0.7692258, 0.3878209, 0, 0, 0, 1, 1,
1.877261, -0.4226662, 0.4059297, 0, 0, 0, 1, 1,
1.898869, -1.829486, 3.292541, 1, 1, 1, 1, 1,
1.905191, 0.09449118, 0.7708821, 1, 1, 1, 1, 1,
1.919868, -0.4864396, 3.053185, 1, 1, 1, 1, 1,
1.939737, -0.8398701, 2.235138, 1, 1, 1, 1, 1,
1.945509, 0.49285, 2.509479, 1, 1, 1, 1, 1,
1.949616, -1.462559, 2.842681, 1, 1, 1, 1, 1,
1.960331, -0.293466, 4.661504, 1, 1, 1, 1, 1,
1.972523, 1.063666, 1.929788, 1, 1, 1, 1, 1,
1.987008, -0.1446597, 1.752337, 1, 1, 1, 1, 1,
1.987612, -0.2486245, 1.37334, 1, 1, 1, 1, 1,
2.011127, -0.8787115, 1.652415, 1, 1, 1, 1, 1,
2.034705, 0.9743432, 1.261185, 1, 1, 1, 1, 1,
2.131455, -0.5467249, 1.414512, 1, 1, 1, 1, 1,
2.137495, -0.9293191, 2.471004, 1, 1, 1, 1, 1,
2.145208, -0.5829545, 2.464262, 1, 1, 1, 1, 1,
2.199102, 0.7341017, 2.70982, 0, 0, 1, 1, 1,
2.208604, -1.670525, 3.074079, 1, 0, 0, 1, 1,
2.245084, -2.588749, 1.826158, 1, 0, 0, 1, 1,
2.251576, 0.620527, 1.985928, 1, 0, 0, 1, 1,
2.300518, 0.7556943, 0.3434, 1, 0, 0, 1, 1,
2.302918, 1.591024, 0.7812139, 1, 0, 0, 1, 1,
2.344076, 1.899021, 1.88139, 0, 0, 0, 1, 1,
2.344139, -0.699183, 2.997047, 0, 0, 0, 1, 1,
2.348484, 1.364613, 0.9688905, 0, 0, 0, 1, 1,
2.364703, -0.5911067, 1.282788, 0, 0, 0, 1, 1,
2.385385, -3.172031, 2.43863, 0, 0, 0, 1, 1,
2.412801, 1.361199, -0.4012017, 0, 0, 0, 1, 1,
2.458119, 0.5532707, 1.708674, 0, 0, 0, 1, 1,
2.504107, -2.055284, 2.560861, 1, 1, 1, 1, 1,
2.511717, 0.2603515, 0.9347224, 1, 1, 1, 1, 1,
2.581213, 2.046499, 2.190427, 1, 1, 1, 1, 1,
2.589928, 0.3332528, 1.847152, 1, 1, 1, 1, 1,
2.696566, 1.562374, 0.389366, 1, 1, 1, 1, 1,
2.891427, 0.8493083, 1.796139, 1, 1, 1, 1, 1,
3.104312, -0.06841797, 0.1759394, 1, 1, 1, 1, 1
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
var radius = 9.701443;
var distance = 34.0759;
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
mvMatrix.translate( -0.1036724, 0.06987834, -0.376267 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.0759);
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
