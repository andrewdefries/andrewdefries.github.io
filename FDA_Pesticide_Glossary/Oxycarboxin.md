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
-3.49391, 0.3916731, -2.947833, 1, 0, 0, 1,
-2.944284, -0.5365397, -2.774565, 1, 0.007843138, 0, 1,
-2.934037, -0.2874491, -1.916297, 1, 0.01176471, 0, 1,
-2.839117, 0.8342428, 0.3746664, 1, 0.01960784, 0, 1,
-2.682489, -0.106688, -1.906858, 1, 0.02352941, 0, 1,
-2.635165, 0.6325713, -3.573401, 1, 0.03137255, 0, 1,
-2.553973, -1.968551, -2.908093, 1, 0.03529412, 0, 1,
-2.51535, 1.626817, -1.904889, 1, 0.04313726, 0, 1,
-2.462277, -0.2906037, -0.7623383, 1, 0.04705882, 0, 1,
-2.461599, 0.04274662, -2.189554, 1, 0.05490196, 0, 1,
-2.382263, -0.9751525, -2.696199, 1, 0.05882353, 0, 1,
-2.36873, 0.8875671, -1.641248, 1, 0.06666667, 0, 1,
-2.326198, 0.7897931, -2.489556, 1, 0.07058824, 0, 1,
-2.25823, 0.750192, -0.7344216, 1, 0.07843138, 0, 1,
-2.256041, -1.200702, -2.014786, 1, 0.08235294, 0, 1,
-2.244567, 0.7074515, -2.310042, 1, 0.09019608, 0, 1,
-2.242578, 0.220472, -2.919192, 1, 0.09411765, 0, 1,
-2.144405, -0.1934871, -0.7101126, 1, 0.1019608, 0, 1,
-2.062159, -1.237565, -0.4413835, 1, 0.1098039, 0, 1,
-2.053143, -0.1986354, -1.265009, 1, 0.1137255, 0, 1,
-2.004462, 0.1138376, -1.077182, 1, 0.1215686, 0, 1,
-1.976124, 1.014059, -1.327764, 1, 0.1254902, 0, 1,
-1.965752, -0.8144936, -2.457183, 1, 0.1333333, 0, 1,
-1.961755, -0.5091938, -1.354422, 1, 0.1372549, 0, 1,
-1.95845, -1.077758, -3.145118, 1, 0.145098, 0, 1,
-1.92212, -2.099208, -1.612378, 1, 0.1490196, 0, 1,
-1.907872, 1.114309, -1.03169, 1, 0.1568628, 0, 1,
-1.904709, -0.1311395, -0.728781, 1, 0.1607843, 0, 1,
-1.867288, -0.5627556, -2.310667, 1, 0.1686275, 0, 1,
-1.855893, -0.3559347, -1.728399, 1, 0.172549, 0, 1,
-1.853661, -0.8891348, -2.791654, 1, 0.1803922, 0, 1,
-1.824903, 1.49412, -1.602492, 1, 0.1843137, 0, 1,
-1.817821, -0.4861024, -1.76289, 1, 0.1921569, 0, 1,
-1.797847, 0.3302179, -1.083176, 1, 0.1960784, 0, 1,
-1.777221, 0.969969, -3.230934, 1, 0.2039216, 0, 1,
-1.767917, -0.1226799, -0.2658163, 1, 0.2117647, 0, 1,
-1.733683, -1.463374, -2.560507, 1, 0.2156863, 0, 1,
-1.729333, -0.9531088, -1.650374, 1, 0.2235294, 0, 1,
-1.724733, 0.03112355, -0.3244712, 1, 0.227451, 0, 1,
-1.724434, 1.01849, -0.7535588, 1, 0.2352941, 0, 1,
-1.723595, 0.2826023, -2.110159, 1, 0.2392157, 0, 1,
-1.713286, -1.550507, -2.949651, 1, 0.2470588, 0, 1,
-1.701488, 0.1660327, -1.091569, 1, 0.2509804, 0, 1,
-1.667847, 0.7001323, -0.4579522, 1, 0.2588235, 0, 1,
-1.66748, -1.694686, -1.888107, 1, 0.2627451, 0, 1,
-1.66628, 0.2666415, -1.536668, 1, 0.2705882, 0, 1,
-1.654981, -0.5893278, -2.053037, 1, 0.2745098, 0, 1,
-1.645254, -1.169713, -2.140531, 1, 0.282353, 0, 1,
-1.637822, -0.5515848, -1.491396, 1, 0.2862745, 0, 1,
-1.6313, -1.550825, -1.721468, 1, 0.2941177, 0, 1,
-1.628075, 1.051371, -1.327013, 1, 0.3019608, 0, 1,
-1.626777, 0.1288302, -2.714351, 1, 0.3058824, 0, 1,
-1.61757, 0.813666, -1.63181, 1, 0.3137255, 0, 1,
-1.613486, -0.9774411, -3.092818, 1, 0.3176471, 0, 1,
-1.60909, 1.39467, -0.3623702, 1, 0.3254902, 0, 1,
-1.607107, -0.4391643, -1.903967, 1, 0.3294118, 0, 1,
-1.590472, 0.5164148, -1.575864, 1, 0.3372549, 0, 1,
-1.565577, -1.771424, -2.363182, 1, 0.3411765, 0, 1,
-1.550264, -1.025306, -3.826632, 1, 0.3490196, 0, 1,
-1.543898, -0.02294674, 0.5276572, 1, 0.3529412, 0, 1,
-1.542175, 1.111814, -1.661528, 1, 0.3607843, 0, 1,
-1.5371, 0.3022994, -0.266826, 1, 0.3647059, 0, 1,
-1.530381, -0.299485, -3.092474, 1, 0.372549, 0, 1,
-1.51993, -0.05693194, -2.136837, 1, 0.3764706, 0, 1,
-1.501895, 1.009255, -1.595027, 1, 0.3843137, 0, 1,
-1.481517, 2.005277, -0.4362821, 1, 0.3882353, 0, 1,
-1.477815, 0.7167275, 0.9735363, 1, 0.3960784, 0, 1,
-1.475574, -1.040777, -2.526643, 1, 0.4039216, 0, 1,
-1.458861, -1.699009, -2.736736, 1, 0.4078431, 0, 1,
-1.455474, -0.04107798, -0.8045554, 1, 0.4156863, 0, 1,
-1.441225, 0.7553053, -1.925586, 1, 0.4196078, 0, 1,
-1.431656, 0.2361856, -1.230008, 1, 0.427451, 0, 1,
-1.419663, -0.4975819, -3.4956, 1, 0.4313726, 0, 1,
-1.418727, 1.349051, -0.8158967, 1, 0.4392157, 0, 1,
-1.417703, 1.161693, -0.4604138, 1, 0.4431373, 0, 1,
-1.416285, -1.22494, -3.98326, 1, 0.4509804, 0, 1,
-1.414763, 0.3466783, -1.939653, 1, 0.454902, 0, 1,
-1.411634, 0.2042664, -1.242363, 1, 0.4627451, 0, 1,
-1.389434, -0.08855262, -2.830764, 1, 0.4666667, 0, 1,
-1.38367, -1.08913, 0.27365, 1, 0.4745098, 0, 1,
-1.358911, -0.4511313, -1.874482, 1, 0.4784314, 0, 1,
-1.353579, -1.251773, -1.96365, 1, 0.4862745, 0, 1,
-1.342371, 0.3141127, -0.632683, 1, 0.4901961, 0, 1,
-1.339654, 1.732378, -0.6232489, 1, 0.4980392, 0, 1,
-1.33765, 0.1854171, -0.9642273, 1, 0.5058824, 0, 1,
-1.323691, 0.1569529, -1.559811, 1, 0.509804, 0, 1,
-1.314276, 0.2110962, -0.1008294, 1, 0.5176471, 0, 1,
-1.305557, 1.56391, 0.8153782, 1, 0.5215687, 0, 1,
-1.300727, 0.2983394, -0.6299472, 1, 0.5294118, 0, 1,
-1.292387, -0.9707286, -4.084637, 1, 0.5333334, 0, 1,
-1.291225, -0.4514457, -2.427542, 1, 0.5411765, 0, 1,
-1.285679, 0.1108144, 0.05977922, 1, 0.5450981, 0, 1,
-1.283195, -1.116914, -2.335226, 1, 0.5529412, 0, 1,
-1.279097, -0.3790448, -1.577614, 1, 0.5568628, 0, 1,
-1.274012, -0.6846222, -2.322916, 1, 0.5647059, 0, 1,
-1.269391, 0.5747486, -0.03499901, 1, 0.5686275, 0, 1,
-1.252163, -0.9443475, -1.7529, 1, 0.5764706, 0, 1,
-1.250635, 0.7369339, -1.850953, 1, 0.5803922, 0, 1,
-1.249532, 0.6039014, 0.4989873, 1, 0.5882353, 0, 1,
-1.246962, -3.039911, -1.777795, 1, 0.5921569, 0, 1,
-1.237306, 0.2627064, -1.854878, 1, 0.6, 0, 1,
-1.218205, 0.5265465, 0.6208052, 1, 0.6078432, 0, 1,
-1.216192, -1.107824, -3.38751, 1, 0.6117647, 0, 1,
-1.205732, 0.6540358, -0.2193563, 1, 0.6196079, 0, 1,
-1.202101, -0.002700444, -0.9364921, 1, 0.6235294, 0, 1,
-1.192995, -1.626209, -2.515575, 1, 0.6313726, 0, 1,
-1.191748, 1.428176, -1.226155, 1, 0.6352941, 0, 1,
-1.184083, 0.189346, 0.9029491, 1, 0.6431373, 0, 1,
-1.183614, 1.059039, -1.232436, 1, 0.6470588, 0, 1,
-1.174534, -0.5746983, -2.198418, 1, 0.654902, 0, 1,
-1.173, -0.4125643, -4.40237, 1, 0.6588235, 0, 1,
-1.16842, 1.283164, -1.516915, 1, 0.6666667, 0, 1,
-1.156877, 1.686198, -0.2606876, 1, 0.6705883, 0, 1,
-1.156152, 1.011905, 0.01582071, 1, 0.6784314, 0, 1,
-1.155791, 1.033821, -1.18659, 1, 0.682353, 0, 1,
-1.148066, -0.3110319, -2.728702, 1, 0.6901961, 0, 1,
-1.141222, -0.8327027, -0.3276363, 1, 0.6941177, 0, 1,
-1.136222, -1.057065, -2.101908, 1, 0.7019608, 0, 1,
-1.127487, -0.9351873, -1.424245, 1, 0.7098039, 0, 1,
-1.124507, 0.3527783, -1.054427, 1, 0.7137255, 0, 1,
-1.117401, -0.259757, -2.18119, 1, 0.7215686, 0, 1,
-1.115019, -0.4499135, -1.832844, 1, 0.7254902, 0, 1,
-1.108329, -0.148808, -3.178677, 1, 0.7333333, 0, 1,
-1.105224, 0.3113099, -4.017392, 1, 0.7372549, 0, 1,
-1.104221, -0.8676676, -2.870934, 1, 0.7450981, 0, 1,
-1.094428, -0.4618508, -2.59205, 1, 0.7490196, 0, 1,
-1.094108, 0.08287469, -2.512034, 1, 0.7568628, 0, 1,
-1.071406, -1.278144, -2.690917, 1, 0.7607843, 0, 1,
-1.070655, -3.006981, -2.483618, 1, 0.7686275, 0, 1,
-1.064543, -0.309158, -2.066605, 1, 0.772549, 0, 1,
-1.033564, -0.2219214, 0.4748569, 1, 0.7803922, 0, 1,
-1.031885, -0.5122169, -4.203045, 1, 0.7843137, 0, 1,
-1.024312, 0.9857285, 0.3489304, 1, 0.7921569, 0, 1,
-1.02049, 0.6088901, 0.1036604, 1, 0.7960784, 0, 1,
-1.019348, -0.5901062, -3.143647, 1, 0.8039216, 0, 1,
-1.013081, -2.009106, -2.82926, 1, 0.8117647, 0, 1,
-1.007342, 0.4424136, -2.034971, 1, 0.8156863, 0, 1,
-1.006012, 0.5337948, -0.4461326, 1, 0.8235294, 0, 1,
-1.00363, -0.1620819, -2.225096, 1, 0.827451, 0, 1,
-0.995374, -0.3032578, -2.255755, 1, 0.8352941, 0, 1,
-0.9929745, 1.077169, -0.2668829, 1, 0.8392157, 0, 1,
-0.9917, 0.7867292, -0.6804623, 1, 0.8470588, 0, 1,
-0.9857292, -0.3012995, -2.166488, 1, 0.8509804, 0, 1,
-0.9831342, 0.009087772, -2.422299, 1, 0.8588235, 0, 1,
-0.9828517, 0.122944, -2.603149, 1, 0.8627451, 0, 1,
-0.97868, 0.62172, -1.346997, 1, 0.8705882, 0, 1,
-0.9730932, -1.353551, -2.996835, 1, 0.8745098, 0, 1,
-0.9692473, 1.850666, 0.2015296, 1, 0.8823529, 0, 1,
-0.9689301, -0.3989058, -1.540147, 1, 0.8862745, 0, 1,
-0.9667735, -1.331344, -2.669701, 1, 0.8941177, 0, 1,
-0.9607803, -0.2268669, -2.048704, 1, 0.8980392, 0, 1,
-0.9535098, -0.2185218, -0.3156411, 1, 0.9058824, 0, 1,
-0.9480941, -0.5724369, -1.900512, 1, 0.9137255, 0, 1,
-0.9404187, 0.5126101, -0.3665782, 1, 0.9176471, 0, 1,
-0.9397041, -0.5862901, -0.02157178, 1, 0.9254902, 0, 1,
-0.9303818, -0.9638109, -2.758841, 1, 0.9294118, 0, 1,
-0.9233169, -0.9084204, -2.527674, 1, 0.9372549, 0, 1,
-0.9223496, 2.422497, -1.087578, 1, 0.9411765, 0, 1,
-0.9211118, 0.6466076, -0.9071272, 1, 0.9490196, 0, 1,
-0.9181432, 0.285526, -1.32415, 1, 0.9529412, 0, 1,
-0.8997644, 0.4275776, -1.020856, 1, 0.9607843, 0, 1,
-0.8995374, -0.04830419, -3.272409, 1, 0.9647059, 0, 1,
-0.8991715, -0.1763018, -2.695482, 1, 0.972549, 0, 1,
-0.8965294, -0.4085138, -1.774574, 1, 0.9764706, 0, 1,
-0.8935696, -1.577363, -2.103305, 1, 0.9843137, 0, 1,
-0.892019, -0.6236937, -2.937725, 1, 0.9882353, 0, 1,
-0.8914841, -1.442684, -2.687647, 1, 0.9960784, 0, 1,
-0.8885972, -1.090046, -2.681373, 0.9960784, 1, 0, 1,
-0.8871287, 0.1604711, -1.606604, 0.9921569, 1, 0, 1,
-0.8784516, 1.827255, -0.6709249, 0.9843137, 1, 0, 1,
-0.8762379, -0.3361939, -3.426788, 0.9803922, 1, 0, 1,
-0.8719893, -0.1400365, -3.142345, 0.972549, 1, 0, 1,
-0.8718429, 0.4523312, -1.632785, 0.9686275, 1, 0, 1,
-0.8705271, 0.7370865, -1.890539, 0.9607843, 1, 0, 1,
-0.8655473, -2.608118, -2.775769, 0.9568627, 1, 0, 1,
-0.8643834, 1.063426, 1.122875, 0.9490196, 1, 0, 1,
-0.8570981, 0.43544, -2.659732, 0.945098, 1, 0, 1,
-0.8554989, 0.4259675, -1.425159, 0.9372549, 1, 0, 1,
-0.850177, 0.1658674, -1.151885, 0.9333333, 1, 0, 1,
-0.84221, -0.1343028, -2.894545, 0.9254902, 1, 0, 1,
-0.8351503, -1.599962, -1.10385, 0.9215686, 1, 0, 1,
-0.8299249, -0.6321579, -2.792825, 0.9137255, 1, 0, 1,
-0.8291088, -1.585321, -1.620756, 0.9098039, 1, 0, 1,
-0.8226463, -1.362333, -2.816111, 0.9019608, 1, 0, 1,
-0.8206178, -2.154785, -2.70056, 0.8941177, 1, 0, 1,
-0.8169514, 1.296632, -0.5287488, 0.8901961, 1, 0, 1,
-0.8158548, -0.3182222, -2.064552, 0.8823529, 1, 0, 1,
-0.8146995, -0.6436918, -1.314693, 0.8784314, 1, 0, 1,
-0.8124253, -0.4193135, -2.629965, 0.8705882, 1, 0, 1,
-0.8102944, 0.16738, 0.514371, 0.8666667, 1, 0, 1,
-0.808874, -0.3548559, -3.066341, 0.8588235, 1, 0, 1,
-0.8069699, 0.03942686, -1.146203, 0.854902, 1, 0, 1,
-0.8058926, -1.196583, -2.910991, 0.8470588, 1, 0, 1,
-0.8057594, -0.7306599, -0.6986396, 0.8431373, 1, 0, 1,
-0.8044484, -1.43486, -2.531725, 0.8352941, 1, 0, 1,
-0.8043087, 0.2582253, -2.284764, 0.8313726, 1, 0, 1,
-0.8032349, -0.8137788, -2.601493, 0.8235294, 1, 0, 1,
-0.8012043, -0.861855, -3.108307, 0.8196079, 1, 0, 1,
-0.8010361, -1.192405, -2.207904, 0.8117647, 1, 0, 1,
-0.7990865, -1.833355, -4.046412, 0.8078431, 1, 0, 1,
-0.7981679, 0.4796836, -0.4106202, 0.8, 1, 0, 1,
-0.7980787, 0.140632, -2.602735, 0.7921569, 1, 0, 1,
-0.7959024, 1.959197, -1.648388, 0.7882353, 1, 0, 1,
-0.7934371, 1.060649, -0.1882492, 0.7803922, 1, 0, 1,
-0.7917385, 0.08529624, 0.2560255, 0.7764706, 1, 0, 1,
-0.7886636, 0.366156, -3.250432, 0.7686275, 1, 0, 1,
-0.7844393, 0.4938513, -1.793339, 0.7647059, 1, 0, 1,
-0.7837843, -1.412598, -3.409724, 0.7568628, 1, 0, 1,
-0.781897, 0.8222726, -0.4974241, 0.7529412, 1, 0, 1,
-0.7758245, 0.3369307, -1.632297, 0.7450981, 1, 0, 1,
-0.7735439, -0.7151329, -1.915448, 0.7411765, 1, 0, 1,
-0.7733281, -0.4871027, -3.216537, 0.7333333, 1, 0, 1,
-0.7728968, 0.6250305, -1.904092, 0.7294118, 1, 0, 1,
-0.7684802, 0.1531937, 0.2250867, 0.7215686, 1, 0, 1,
-0.7665809, 0.395511, -0.7479197, 0.7176471, 1, 0, 1,
-0.7662724, -0.03801112, -3.324486, 0.7098039, 1, 0, 1,
-0.7620203, -0.4350189, -2.079011, 0.7058824, 1, 0, 1,
-0.7593031, -0.6313071, -2.858947, 0.6980392, 1, 0, 1,
-0.7475232, -0.6756662, -3.71326, 0.6901961, 1, 0, 1,
-0.7468009, 0.6117939, 0.9827559, 0.6862745, 1, 0, 1,
-0.7453099, -0.3525865, -3.435045, 0.6784314, 1, 0, 1,
-0.7361589, 0.1935499, -2.552899, 0.6745098, 1, 0, 1,
-0.7292172, 2.015982, 1.24514, 0.6666667, 1, 0, 1,
-0.728564, 1.49637, -1.312692, 0.6627451, 1, 0, 1,
-0.7282296, 1.294065, -0.05352834, 0.654902, 1, 0, 1,
-0.7278, 0.03866887, -1.704733, 0.6509804, 1, 0, 1,
-0.7223118, 0.5485501, 0.7551356, 0.6431373, 1, 0, 1,
-0.7204686, -0.07421321, -1.653356, 0.6392157, 1, 0, 1,
-0.7199541, 0.9102238, -0.9285991, 0.6313726, 1, 0, 1,
-0.7135755, -1.013935, -1.136554, 0.627451, 1, 0, 1,
-0.7105854, -1.227388, -1.945483, 0.6196079, 1, 0, 1,
-0.7069325, -1.82705, -2.826025, 0.6156863, 1, 0, 1,
-0.6989349, -0.1556395, -1.904762, 0.6078432, 1, 0, 1,
-0.6975709, -1.04974, -3.493345, 0.6039216, 1, 0, 1,
-0.6968908, 0.3243935, -1.276643, 0.5960785, 1, 0, 1,
-0.6960227, 0.6515045, -1.477356, 0.5882353, 1, 0, 1,
-0.6856257, -0.2185948, -1.021476, 0.5843138, 1, 0, 1,
-0.6826037, -0.70183, -2.17513, 0.5764706, 1, 0, 1,
-0.681863, 0.2859008, -1.210354, 0.572549, 1, 0, 1,
-0.6811869, 0.1187385, -1.862846, 0.5647059, 1, 0, 1,
-0.6789441, -0.05859121, -0.4329219, 0.5607843, 1, 0, 1,
-0.6743753, 0.8188061, -0.09310862, 0.5529412, 1, 0, 1,
-0.6728154, 0.258019, -1.383995, 0.5490196, 1, 0, 1,
-0.6713724, 1.291706, -2.373572, 0.5411765, 1, 0, 1,
-0.665473, 0.5177522, -0.8230253, 0.5372549, 1, 0, 1,
-0.6635817, -0.7785406, -1.575959, 0.5294118, 1, 0, 1,
-0.6626655, -0.3226322, -0.4977595, 0.5254902, 1, 0, 1,
-0.6530616, 1.980634, 1.358114, 0.5176471, 1, 0, 1,
-0.6516943, -0.06084504, -2.178861, 0.5137255, 1, 0, 1,
-0.6515087, 0.8095123, 0.6762772, 0.5058824, 1, 0, 1,
-0.651171, 0.1939409, 0.3399383, 0.5019608, 1, 0, 1,
-0.6441776, 0.3482448, -1.865241, 0.4941176, 1, 0, 1,
-0.6434491, 0.783544, 0.3842322, 0.4862745, 1, 0, 1,
-0.6415071, -0.03263989, -2.377837, 0.4823529, 1, 0, 1,
-0.6401603, -0.8545414, -3.28226, 0.4745098, 1, 0, 1,
-0.6338562, 0.7659113, 0.6824498, 0.4705882, 1, 0, 1,
-0.6327485, 0.8595634, 1.112713, 0.4627451, 1, 0, 1,
-0.6266309, -1.292509, -3.632002, 0.4588235, 1, 0, 1,
-0.6215446, -0.2574983, -1.796381, 0.4509804, 1, 0, 1,
-0.6214349, 2.041634, 0.2523915, 0.4470588, 1, 0, 1,
-0.6201608, 0.0880301, -1.931484, 0.4392157, 1, 0, 1,
-0.6146813, 0.4815785, -2.344224, 0.4352941, 1, 0, 1,
-0.6100633, 0.8946745, 0.2781605, 0.427451, 1, 0, 1,
-0.6086938, 0.5906508, -0.7466091, 0.4235294, 1, 0, 1,
-0.6038237, 0.2385216, 0.606794, 0.4156863, 1, 0, 1,
-0.6029722, 1.537886, 1.624796, 0.4117647, 1, 0, 1,
-0.6013399, -2.299139, -3.221311, 0.4039216, 1, 0, 1,
-0.6001154, -0.4418622, -1.784638, 0.3960784, 1, 0, 1,
-0.592972, -0.4654241, -1.7285, 0.3921569, 1, 0, 1,
-0.5924811, -1.275216, -1.779885, 0.3843137, 1, 0, 1,
-0.5920053, 0.9006722, -1.452349, 0.3803922, 1, 0, 1,
-0.5912511, -0.4129494, -1.27598, 0.372549, 1, 0, 1,
-0.5910811, 0.2360164, -0.3910771, 0.3686275, 1, 0, 1,
-0.5905554, 0.01307707, -0.19466, 0.3607843, 1, 0, 1,
-0.5893395, -0.6720893, -2.755178, 0.3568628, 1, 0, 1,
-0.5793401, -0.9477431, -2.265851, 0.3490196, 1, 0, 1,
-0.5766221, -0.1313761, -0.9521813, 0.345098, 1, 0, 1,
-0.5730391, -1.050334, -2.331935, 0.3372549, 1, 0, 1,
-0.5723398, -0.5201824, -1.687128, 0.3333333, 1, 0, 1,
-0.5685532, -0.632302, -2.345942, 0.3254902, 1, 0, 1,
-0.5644495, -0.6150314, -2.520594, 0.3215686, 1, 0, 1,
-0.5640637, -0.5720142, -1.124958, 0.3137255, 1, 0, 1,
-0.5625637, -0.1694733, -1.969305, 0.3098039, 1, 0, 1,
-0.5624207, 0.4850784, -0.6242625, 0.3019608, 1, 0, 1,
-0.5608965, -0.1615389, -3.05699, 0.2941177, 1, 0, 1,
-0.5578958, 0.1974087, -1.538859, 0.2901961, 1, 0, 1,
-0.5553086, 1.399602, 0.4512659, 0.282353, 1, 0, 1,
-0.555136, 1.432978, 0.8078134, 0.2784314, 1, 0, 1,
-0.5533883, -1.034695, -2.612252, 0.2705882, 1, 0, 1,
-0.5530683, 1.891125, -0.5728896, 0.2666667, 1, 0, 1,
-0.5501065, -0.1014824, -2.295913, 0.2588235, 1, 0, 1,
-0.5439035, -0.8505621, -3.878451, 0.254902, 1, 0, 1,
-0.5387885, 1.686711, -0.6804706, 0.2470588, 1, 0, 1,
-0.5315538, 0.4978099, -0.07970764, 0.2431373, 1, 0, 1,
-0.5303417, 0.5967934, -0.371209, 0.2352941, 1, 0, 1,
-0.5272411, 0.2895011, -1.530415, 0.2313726, 1, 0, 1,
-0.5258857, -0.4465443, -2.86866, 0.2235294, 1, 0, 1,
-0.5227435, 0.219604, 0.6807845, 0.2196078, 1, 0, 1,
-0.5190376, -1.318189, -2.437865, 0.2117647, 1, 0, 1,
-0.5147201, 2.093586, -0.8679233, 0.2078431, 1, 0, 1,
-0.5131755, 0.0913809, -1.511493, 0.2, 1, 0, 1,
-0.5123538, -0.2470374, -1.315311, 0.1921569, 1, 0, 1,
-0.5101358, -1.487563, -4.760511, 0.1882353, 1, 0, 1,
-0.5082805, -0.8006005, -2.20877, 0.1803922, 1, 0, 1,
-0.5054088, -0.4111135, -2.275298, 0.1764706, 1, 0, 1,
-0.5032285, 0.2745472, -0.5870517, 0.1686275, 1, 0, 1,
-0.4983107, 0.1833254, -2.760734, 0.1647059, 1, 0, 1,
-0.4951351, -0.7947356, -3.378803, 0.1568628, 1, 0, 1,
-0.489542, 0.607236, -1.273069, 0.1529412, 1, 0, 1,
-0.4839677, 0.5549507, -0.5909227, 0.145098, 1, 0, 1,
-0.4827076, 1.579985, -1.391013, 0.1411765, 1, 0, 1,
-0.4725155, -0.4697191, -2.599213, 0.1333333, 1, 0, 1,
-0.4660871, 1.026085, -1.331975, 0.1294118, 1, 0, 1,
-0.4660724, -1.996642, -0.6170688, 0.1215686, 1, 0, 1,
-0.4633483, -0.319337, -2.236019, 0.1176471, 1, 0, 1,
-0.4608515, -0.06774992, -2.805905, 0.1098039, 1, 0, 1,
-0.4467982, -2.426686, -4.812005, 0.1058824, 1, 0, 1,
-0.4461325, 0.290563, -2.677585, 0.09803922, 1, 0, 1,
-0.4399436, -0.7587388, -2.892103, 0.09019608, 1, 0, 1,
-0.439137, -0.9089736, -1.406083, 0.08627451, 1, 0, 1,
-0.4384815, -0.6072907, -1.768094, 0.07843138, 1, 0, 1,
-0.4359101, -0.5955691, -3.684356, 0.07450981, 1, 0, 1,
-0.4353328, -1.292184, -2.280245, 0.06666667, 1, 0, 1,
-0.4314045, 0.2222843, -1.982075, 0.0627451, 1, 0, 1,
-0.4164769, -1.128544, -3.311739, 0.05490196, 1, 0, 1,
-0.410735, 0.7445009, 0.5895321, 0.05098039, 1, 0, 1,
-0.409747, 0.2149866, -0.8477718, 0.04313726, 1, 0, 1,
-0.4030187, -0.485196, -1.721652, 0.03921569, 1, 0, 1,
-0.4003127, -0.5383483, -2.38284, 0.03137255, 1, 0, 1,
-0.3971997, -1.039424, -2.709327, 0.02745098, 1, 0, 1,
-0.3971586, 1.591812, -0.6391258, 0.01960784, 1, 0, 1,
-0.3943115, 0.5066476, -0.5999541, 0.01568628, 1, 0, 1,
-0.3886329, 0.7253607, 1.009014, 0.007843138, 1, 0, 1,
-0.3807814, -0.6012424, -2.712939, 0.003921569, 1, 0, 1,
-0.3795622, -0.3465292, -3.457898, 0, 1, 0.003921569, 1,
-0.3738674, -0.3052712, -2.002962, 0, 1, 0.01176471, 1,
-0.3679138, 0.3341985, -1.219422, 0, 1, 0.01568628, 1,
-0.3651232, 0.2798581, 0.09916362, 0, 1, 0.02352941, 1,
-0.3645593, -0.5577808, -1.685595, 0, 1, 0.02745098, 1,
-0.3632739, -0.03960155, -2.999037, 0, 1, 0.03529412, 1,
-0.3594329, -0.0441546, -3.069875, 0, 1, 0.03921569, 1,
-0.3589611, -0.4191288, -3.034377, 0, 1, 0.04705882, 1,
-0.3538611, -1.552252, -2.726794, 0, 1, 0.05098039, 1,
-0.3515139, 1.966915, -1.627514, 0, 1, 0.05882353, 1,
-0.350078, -1.015317, -1.898722, 0, 1, 0.0627451, 1,
-0.3461945, 0.3788151, -1.328259, 0, 1, 0.07058824, 1,
-0.3449293, -0.2211541, -1.774827, 0, 1, 0.07450981, 1,
-0.3423883, -0.7874345, -3.251245, 0, 1, 0.08235294, 1,
-0.3412245, 0.9937586, -0.9411956, 0, 1, 0.08627451, 1,
-0.3410878, -0.005941572, -1.166636, 0, 1, 0.09411765, 1,
-0.3399282, 0.3251809, 0.8041474, 0, 1, 0.1019608, 1,
-0.3332117, 0.7562279, -1.093226, 0, 1, 0.1058824, 1,
-0.330458, -1.253719, -1.911271, 0, 1, 0.1137255, 1,
-0.3253526, -0.4883951, -3.470192, 0, 1, 0.1176471, 1,
-0.3246725, -1.410036, -3.632243, 0, 1, 0.1254902, 1,
-0.3206812, -0.3306451, -3.371325, 0, 1, 0.1294118, 1,
-0.3206116, 2.608065, -1.074918, 0, 1, 0.1372549, 1,
-0.3190876, -0.1456752, -3.100317, 0, 1, 0.1411765, 1,
-0.3117602, -0.291122, -1.346491, 0, 1, 0.1490196, 1,
-0.3108572, -2.635414, -3.21648, 0, 1, 0.1529412, 1,
-0.3106391, 2.356232, -0.6950478, 0, 1, 0.1607843, 1,
-0.3023877, 1.082099, 0.8937911, 0, 1, 0.1647059, 1,
-0.300153, -0.08453038, -2.76184, 0, 1, 0.172549, 1,
-0.2967905, -0.05881058, -0.8847456, 0, 1, 0.1764706, 1,
-0.2939353, 0.8221005, -0.260299, 0, 1, 0.1843137, 1,
-0.2907497, -1.807699, -3.148792, 0, 1, 0.1882353, 1,
-0.2891098, -0.3292797, -1.786451, 0, 1, 0.1960784, 1,
-0.2874145, 0.05631536, -1.891756, 0, 1, 0.2039216, 1,
-0.2865153, 0.8907368, -0.8666018, 0, 1, 0.2078431, 1,
-0.2826464, -0.0085736, -1.507595, 0, 1, 0.2156863, 1,
-0.2813529, 0.5846846, -1.091309, 0, 1, 0.2196078, 1,
-0.266118, -1.076006, -4.201457, 0, 1, 0.227451, 1,
-0.2649521, 0.08378083, -1.274122, 0, 1, 0.2313726, 1,
-0.2649036, 0.2347371, -0.9081839, 0, 1, 0.2392157, 1,
-0.2645054, 0.1432934, -1.410269, 0, 1, 0.2431373, 1,
-0.2635125, 1.008518, 0.06861567, 0, 1, 0.2509804, 1,
-0.2575212, -0.09275839, -2.523716, 0, 1, 0.254902, 1,
-0.2570932, 1.776833, -0.8897222, 0, 1, 0.2627451, 1,
-0.2540342, 0.3019612, -1.723264, 0, 1, 0.2666667, 1,
-0.2522012, -1.537044, -3.234619, 0, 1, 0.2745098, 1,
-0.2496333, 0.8093314, -0.6106669, 0, 1, 0.2784314, 1,
-0.248109, 0.1819381, -1.397745, 0, 1, 0.2862745, 1,
-0.239166, -0.4489064, -1.648592, 0, 1, 0.2901961, 1,
-0.2387895, -1.07656, -3.057425, 0, 1, 0.2980392, 1,
-0.2358548, 0.6466693, -1.053691, 0, 1, 0.3058824, 1,
-0.2324943, 1.002824, -0.2436054, 0, 1, 0.3098039, 1,
-0.2324368, 0.7622735, -0.2541884, 0, 1, 0.3176471, 1,
-0.2317377, -0.729336, -2.007929, 0, 1, 0.3215686, 1,
-0.2307375, 2.053698, -1.552749, 0, 1, 0.3294118, 1,
-0.2302552, 1.342942, 0.296109, 0, 1, 0.3333333, 1,
-0.229176, 0.794386, -0.4935616, 0, 1, 0.3411765, 1,
-0.2270265, 0.8086298, -1.187052, 0, 1, 0.345098, 1,
-0.215852, 0.3534583, -2.331636, 0, 1, 0.3529412, 1,
-0.2098115, 0.3375393, -0.5663252, 0, 1, 0.3568628, 1,
-0.2043241, 1.540286, -1.168762, 0, 1, 0.3647059, 1,
-0.2012465, 1.737469, -0.1881855, 0, 1, 0.3686275, 1,
-0.1997594, -1.865858, -3.47256, 0, 1, 0.3764706, 1,
-0.1989845, -0.5520933, -3.193813, 0, 1, 0.3803922, 1,
-0.1956733, -0.8145273, -3.211814, 0, 1, 0.3882353, 1,
-0.1910082, 0.9464548, -0.8328333, 0, 1, 0.3921569, 1,
-0.1872413, 1.456247, 0.04968335, 0, 1, 0.4, 1,
-0.1820308, -1.537024, -3.12636, 0, 1, 0.4078431, 1,
-0.1806054, -0.03657096, -1.700693, 0, 1, 0.4117647, 1,
-0.1796174, 0.007642378, -0.06573791, 0, 1, 0.4196078, 1,
-0.1703135, 0.6967332, -0.4509032, 0, 1, 0.4235294, 1,
-0.1690677, 0.1777524, -0.5790852, 0, 1, 0.4313726, 1,
-0.165422, 0.3052915, -3.346692, 0, 1, 0.4352941, 1,
-0.1648503, -1.908621, -2.363635, 0, 1, 0.4431373, 1,
-0.1635731, 0.2367148, 1.046583, 0, 1, 0.4470588, 1,
-0.1603484, -1.455999, -3.872199, 0, 1, 0.454902, 1,
-0.1603141, 1.518448, -2.051733, 0, 1, 0.4588235, 1,
-0.1602484, -0.1947619, -2.392187, 0, 1, 0.4666667, 1,
-0.1573342, -0.4594755, -4.794051, 0, 1, 0.4705882, 1,
-0.1545347, -0.1427016, -1.72987, 0, 1, 0.4784314, 1,
-0.151876, -0.7295141, -4.083524, 0, 1, 0.4823529, 1,
-0.1510797, -0.01658511, -1.387999, 0, 1, 0.4901961, 1,
-0.1505164, -1.084152, -3.792942, 0, 1, 0.4941176, 1,
-0.1504432, 1.395339, -0.4266256, 0, 1, 0.5019608, 1,
-0.1473873, -1.751339, -3.982599, 0, 1, 0.509804, 1,
-0.1464314, 0.2832649, -1.611524, 0, 1, 0.5137255, 1,
-0.144838, 0.3704737, -1.042036, 0, 1, 0.5215687, 1,
-0.1441001, -0.9876684, -4.158674, 0, 1, 0.5254902, 1,
-0.1437849, 0.1666195, -0.5843909, 0, 1, 0.5333334, 1,
-0.1393767, 0.9442818, -1.411693, 0, 1, 0.5372549, 1,
-0.137242, 0.7728878, -1.279859, 0, 1, 0.5450981, 1,
-0.1367414, 0.9347393, 0.524599, 0, 1, 0.5490196, 1,
-0.1359361, 0.7544354, 1.055794, 0, 1, 0.5568628, 1,
-0.1347794, -1.262658, -3.480943, 0, 1, 0.5607843, 1,
-0.1307218, 0.112161, -1.573149, 0, 1, 0.5686275, 1,
-0.1284382, 0.7556551, -0.9081993, 0, 1, 0.572549, 1,
-0.1281772, 0.317349, -0.6283675, 0, 1, 0.5803922, 1,
-0.1229796, -0.0588746, -1.55427, 0, 1, 0.5843138, 1,
-0.1185407, 1.137622, -0.3637037, 0, 1, 0.5921569, 1,
-0.115083, -0.4201606, -4.234118, 0, 1, 0.5960785, 1,
-0.1137621, 0.5247869, -1.38949, 0, 1, 0.6039216, 1,
-0.1120574, -0.1703536, -2.826671, 0, 1, 0.6117647, 1,
-0.09965435, -0.2580913, -2.034042, 0, 1, 0.6156863, 1,
-0.0996348, -2.514853, -3.226388, 0, 1, 0.6235294, 1,
-0.09851651, 0.4539429, 0.1577738, 0, 1, 0.627451, 1,
-0.09739679, -0.8114413, -2.765524, 0, 1, 0.6352941, 1,
-0.09266338, 1.338828, 1.069339, 0, 1, 0.6392157, 1,
-0.09124727, -0.7392576, -2.890352, 0, 1, 0.6470588, 1,
-0.08937471, 0.5431619, 1.64211, 0, 1, 0.6509804, 1,
-0.0857355, 0.5475924, 1.658894, 0, 1, 0.6588235, 1,
-0.08400445, -1.20465, -3.989371, 0, 1, 0.6627451, 1,
-0.07729129, -0.5443811, -3.587705, 0, 1, 0.6705883, 1,
-0.07428222, 0.07490776, -0.2227243, 0, 1, 0.6745098, 1,
-0.07359477, -0.5418026, -1.774156, 0, 1, 0.682353, 1,
-0.07038258, -2.463628, -1.864455, 0, 1, 0.6862745, 1,
-0.07013035, 0.1851004, -1.078806, 0, 1, 0.6941177, 1,
-0.06542367, -0.4148935, -2.085878, 0, 1, 0.7019608, 1,
-0.06406408, 0.2840286, 0.9339119, 0, 1, 0.7058824, 1,
-0.06213494, 1.213168, -0.7563487, 0, 1, 0.7137255, 1,
-0.06129679, -1.164535, -4.133337, 0, 1, 0.7176471, 1,
-0.06072105, -0.9463562, -3.253079, 0, 1, 0.7254902, 1,
-0.05608959, 2.36676, -1.071787, 0, 1, 0.7294118, 1,
-0.05454584, 0.05215558, -2.595966, 0, 1, 0.7372549, 1,
-0.05446455, -0.630716, -2.383637, 0, 1, 0.7411765, 1,
-0.05413742, -0.8698309, -3.30295, 0, 1, 0.7490196, 1,
-0.05358088, 0.9835728, -1.192825, 0, 1, 0.7529412, 1,
-0.05025692, -0.930292, -3.634554, 0, 1, 0.7607843, 1,
-0.04327606, -0.08133534, -2.262068, 0, 1, 0.7647059, 1,
-0.04260129, -0.8644428, -4.290092, 0, 1, 0.772549, 1,
-0.03244367, 0.4073973, -0.2045531, 0, 1, 0.7764706, 1,
-0.03052815, -0.9636235, -2.280643, 0, 1, 0.7843137, 1,
-0.03049232, 1.568439, -0.1976784, 0, 1, 0.7882353, 1,
-0.02959995, -0.6844451, -2.603347, 0, 1, 0.7960784, 1,
-0.02797232, -0.8222891, -3.917225, 0, 1, 0.8039216, 1,
-0.02601613, 1.089187, 0.08219849, 0, 1, 0.8078431, 1,
-0.02596715, -2.014394, -3.694323, 0, 1, 0.8156863, 1,
-0.02235007, -0.06780496, -4.083175, 0, 1, 0.8196079, 1,
-0.01784364, 0.7718892, -0.5013911, 0, 1, 0.827451, 1,
-0.01645027, -0.1392485, -3.333619, 0, 1, 0.8313726, 1,
-0.0160754, 0.7402678, 1.082812, 0, 1, 0.8392157, 1,
-0.01173944, -0.4804401, -4.173324, 0, 1, 0.8431373, 1,
-0.01165749, 0.151441, 0.4424703, 0, 1, 0.8509804, 1,
-0.01001347, 2.133551, -0.3211691, 0, 1, 0.854902, 1,
-0.008373001, 0.6562512, 2.060219, 0, 1, 0.8627451, 1,
-0.006083726, -1.335631, -4.566755, 0, 1, 0.8666667, 1,
0.001789782, -0.3925124, 4.178387, 0, 1, 0.8745098, 1,
0.002102765, -0.4575207, 3.120323, 0, 1, 0.8784314, 1,
0.009996086, -0.9810206, 2.059299, 0, 1, 0.8862745, 1,
0.0124814, -1.438348, 2.821655, 0, 1, 0.8901961, 1,
0.01421175, 2.056177, -0.4326938, 0, 1, 0.8980392, 1,
0.01423557, -0.572542, 1.580708, 0, 1, 0.9058824, 1,
0.01705674, -0.1534981, 2.572135, 0, 1, 0.9098039, 1,
0.01861297, 0.9938192, -1.555549, 0, 1, 0.9176471, 1,
0.01875199, 1.058771, -2.189303, 0, 1, 0.9215686, 1,
0.02135422, 0.2721523, 0.6611699, 0, 1, 0.9294118, 1,
0.02220073, -0.6795363, 2.815588, 0, 1, 0.9333333, 1,
0.02410492, 0.2294974, -0.6124354, 0, 1, 0.9411765, 1,
0.02579972, 1.512023, -1.06642, 0, 1, 0.945098, 1,
0.0261411, -0.4826076, 3.356771, 0, 1, 0.9529412, 1,
0.02669, 0.3431109, 0.5354981, 0, 1, 0.9568627, 1,
0.03304157, -0.984905, 3.599673, 0, 1, 0.9647059, 1,
0.03370169, -1.508132, 2.442522, 0, 1, 0.9686275, 1,
0.04294024, 0.2375443, 0.5509111, 0, 1, 0.9764706, 1,
0.04628655, 0.3594536, 2.082888, 0, 1, 0.9803922, 1,
0.05682065, -2.581708, 3.118588, 0, 1, 0.9882353, 1,
0.05975655, 1.35509, 0.5106186, 0, 1, 0.9921569, 1,
0.06315161, -1.932878, 2.515919, 0, 1, 1, 1,
0.06412515, 0.5309377, -0.2594532, 0, 0.9921569, 1, 1,
0.06592759, 0.09849375, 0.8749063, 0, 0.9882353, 1, 1,
0.06596788, -0.1992483, 4.768749, 0, 0.9803922, 1, 1,
0.07628403, -0.2089837, 3.050801, 0, 0.9764706, 1, 1,
0.07762261, -0.2575217, 4.187457, 0, 0.9686275, 1, 1,
0.07835406, 1.175697, -0.910294, 0, 0.9647059, 1, 1,
0.08371235, 0.7844334, 1.73542, 0, 0.9568627, 1, 1,
0.08380804, -1.645942, 1.10216, 0, 0.9529412, 1, 1,
0.09526851, 0.5830471, -1.001674, 0, 0.945098, 1, 1,
0.1054698, 0.2387178, -1.432692, 0, 0.9411765, 1, 1,
0.106281, 0.5975786, -0.9037299, 0, 0.9333333, 1, 1,
0.1100721, -1.911529, 1.276874, 0, 0.9294118, 1, 1,
0.1148924, 0.2609968, 1.043664, 0, 0.9215686, 1, 1,
0.1157117, 1.80973, 1.06002, 0, 0.9176471, 1, 1,
0.1159245, -0.1721811, 2.287555, 0, 0.9098039, 1, 1,
0.1164566, 1.163239, 0.009821671, 0, 0.9058824, 1, 1,
0.1186172, 0.02678693, 2.055482, 0, 0.8980392, 1, 1,
0.1205042, 0.4201526, 1.423684, 0, 0.8901961, 1, 1,
0.124609, 1.9524, -0.3138736, 0, 0.8862745, 1, 1,
0.1308988, -0.2771205, 3.921283, 0, 0.8784314, 1, 1,
0.1390203, 1.976267, -0.2641036, 0, 0.8745098, 1, 1,
0.1392457, -0.04553423, 1.532446, 0, 0.8666667, 1, 1,
0.1411613, -0.6871742, 1.503438, 0, 0.8627451, 1, 1,
0.1420613, -0.4549254, 2.381325, 0, 0.854902, 1, 1,
0.1441445, 0.7287052, -0.02456795, 0, 0.8509804, 1, 1,
0.144383, -0.1489447, 1.785641, 0, 0.8431373, 1, 1,
0.1452992, 0.2728854, 2.657908, 0, 0.8392157, 1, 1,
0.1530818, 0.7420631, -2.045878, 0, 0.8313726, 1, 1,
0.1601768, -0.490016, 3.345456, 0, 0.827451, 1, 1,
0.165757, -1.201562, 1.256091, 0, 0.8196079, 1, 1,
0.1666992, 0.7877099, -2.375855, 0, 0.8156863, 1, 1,
0.1697876, 0.07336994, 1.541732, 0, 0.8078431, 1, 1,
0.1721659, 0.4426156, -0.3822937, 0, 0.8039216, 1, 1,
0.1723093, 1.322897, -1.936984, 0, 0.7960784, 1, 1,
0.1761393, 0.8565398, 0.2016563, 0, 0.7882353, 1, 1,
0.1777431, 0.1453623, 1.800801, 0, 0.7843137, 1, 1,
0.1806646, 2.156749, 0.186228, 0, 0.7764706, 1, 1,
0.1818904, -0.06674122, 1.948062, 0, 0.772549, 1, 1,
0.1831396, 0.9863587, 0.7802194, 0, 0.7647059, 1, 1,
0.1865121, -0.2429376, 2.796263, 0, 0.7607843, 1, 1,
0.195655, -0.06488122, 1.062263, 0, 0.7529412, 1, 1,
0.1963679, 2.266072, -0.4307286, 0, 0.7490196, 1, 1,
0.1996162, 0.1271218, 0.6188965, 0, 0.7411765, 1, 1,
0.2011493, 0.1518262, 1.33047, 0, 0.7372549, 1, 1,
0.2019469, -0.4741004, 3.368226, 0, 0.7294118, 1, 1,
0.2020218, -0.8019682, 3.487562, 0, 0.7254902, 1, 1,
0.202589, 2.533852, -1.217857, 0, 0.7176471, 1, 1,
0.2036044, 0.5745714, -2.300684, 0, 0.7137255, 1, 1,
0.2037503, -0.5974772, 3.006653, 0, 0.7058824, 1, 1,
0.2041931, 0.07490355, 0.398592, 0, 0.6980392, 1, 1,
0.2116462, 0.7121475, -0.07341461, 0, 0.6941177, 1, 1,
0.2125824, 0.1679471, 0.6227525, 0, 0.6862745, 1, 1,
0.2128543, 0.6601049, 0.2115504, 0, 0.682353, 1, 1,
0.2131222, -0.6640046, 3.641061, 0, 0.6745098, 1, 1,
0.2139243, -0.1272653, 2.895642, 0, 0.6705883, 1, 1,
0.2154972, 0.01092417, 1.359423, 0, 0.6627451, 1, 1,
0.2164362, 0.790284, 0.9847947, 0, 0.6588235, 1, 1,
0.2195635, 0.3484332, 0.8794627, 0, 0.6509804, 1, 1,
0.2260289, 0.3501446, 0.2296898, 0, 0.6470588, 1, 1,
0.228111, 1.442806, -0.4635028, 0, 0.6392157, 1, 1,
0.2297375, 0.06584608, 0.5440629, 0, 0.6352941, 1, 1,
0.2299496, 1.042509, 2.047425, 0, 0.627451, 1, 1,
0.2386595, 0.4708542, 0.7182578, 0, 0.6235294, 1, 1,
0.2474596, -0.04330214, 0.3691611, 0, 0.6156863, 1, 1,
0.2544353, 1.031633, 2.31679, 0, 0.6117647, 1, 1,
0.2556972, 1.501835, -0.7935194, 0, 0.6039216, 1, 1,
0.2558211, -0.5919642, 1.44576, 0, 0.5960785, 1, 1,
0.2558551, 0.7096093, -0.1500482, 0, 0.5921569, 1, 1,
0.2599766, -0.4051533, 2.795091, 0, 0.5843138, 1, 1,
0.2625208, 1.332776, 0.0409856, 0, 0.5803922, 1, 1,
0.2634243, -1.659057, 2.078442, 0, 0.572549, 1, 1,
0.2641143, -1.598094, 2.711482, 0, 0.5686275, 1, 1,
0.2672037, -0.4844697, 0.9349989, 0, 0.5607843, 1, 1,
0.2702365, 0.262327, 0.8163124, 0, 0.5568628, 1, 1,
0.2703374, 1.366603, 1.653883, 0, 0.5490196, 1, 1,
0.283363, 1.918979, -1.111501, 0, 0.5450981, 1, 1,
0.2929977, -2.16849, 4.087827, 0, 0.5372549, 1, 1,
0.2937055, 0.2021617, 0.9268536, 0, 0.5333334, 1, 1,
0.2944683, -0.5781137, 2.883887, 0, 0.5254902, 1, 1,
0.2955486, 0.25436, 1.139674, 0, 0.5215687, 1, 1,
0.2967471, -0.3608858, -0.2221634, 0, 0.5137255, 1, 1,
0.2979206, -1.040669, 3.406637, 0, 0.509804, 1, 1,
0.2998723, 1.232841, -1.41159, 0, 0.5019608, 1, 1,
0.3005067, 0.1367652, 3.669602, 0, 0.4941176, 1, 1,
0.3009924, -0.7726002, 2.083879, 0, 0.4901961, 1, 1,
0.3043032, -1.443876, 3.440902, 0, 0.4823529, 1, 1,
0.3057491, 1.297739, -0.4914199, 0, 0.4784314, 1, 1,
0.3063265, 0.3233136, 0.1005758, 0, 0.4705882, 1, 1,
0.3078193, 0.3706355, -0.437346, 0, 0.4666667, 1, 1,
0.308157, -1.450249, 2.562635, 0, 0.4588235, 1, 1,
0.3112998, -0.2439909, 1.304481, 0, 0.454902, 1, 1,
0.3116823, 0.2838551, 1.069719, 0, 0.4470588, 1, 1,
0.3178222, 0.1178049, 1.20947, 0, 0.4431373, 1, 1,
0.3185024, -0.2669777, 2.626832, 0, 0.4352941, 1, 1,
0.3189532, 1.719397, -0.1910668, 0, 0.4313726, 1, 1,
0.3203436, 0.1262885, 0.2304712, 0, 0.4235294, 1, 1,
0.3207068, -0.6210563, 0.2366948, 0, 0.4196078, 1, 1,
0.3247561, 0.7341444, 1.701812, 0, 0.4117647, 1, 1,
0.3257017, 0.6143304, 2.447283, 0, 0.4078431, 1, 1,
0.3328488, -0.4664797, 2.963625, 0, 0.4, 1, 1,
0.3344727, -1.541372, 3.87874, 0, 0.3921569, 1, 1,
0.335525, 0.5704628, -0.1816749, 0, 0.3882353, 1, 1,
0.3359681, -2.203525, 3.809025, 0, 0.3803922, 1, 1,
0.342384, 0.4131167, 0.4518617, 0, 0.3764706, 1, 1,
0.343107, 0.8964032, 0.61746, 0, 0.3686275, 1, 1,
0.3446496, 0.1514876, 2.207714, 0, 0.3647059, 1, 1,
0.3499998, 1.734686, 0.8245739, 0, 0.3568628, 1, 1,
0.3556174, -0.794532, 2.598612, 0, 0.3529412, 1, 1,
0.3570817, 1.174645, 1.816415, 0, 0.345098, 1, 1,
0.3572007, -0.6519529, 0.4104974, 0, 0.3411765, 1, 1,
0.3595776, 0.3409089, 1.456998, 0, 0.3333333, 1, 1,
0.3622339, -1.314688, 3.015414, 0, 0.3294118, 1, 1,
0.3631957, -0.4535562, 1.76865, 0, 0.3215686, 1, 1,
0.3655163, 2.094083, 0.8959841, 0, 0.3176471, 1, 1,
0.3681213, -0.5704206, 2.400914, 0, 0.3098039, 1, 1,
0.3715881, -0.1354651, 1.534715, 0, 0.3058824, 1, 1,
0.3725052, 1.414339, 2.065986, 0, 0.2980392, 1, 1,
0.3726651, -0.07508524, 2.121171, 0, 0.2901961, 1, 1,
0.3768441, -0.7563389, 3.400777, 0, 0.2862745, 1, 1,
0.3825615, 8.686605e-05, 2.975985, 0, 0.2784314, 1, 1,
0.3845699, 0.685908, -1.068324, 0, 0.2745098, 1, 1,
0.3847824, 2.16703, -0.7349246, 0, 0.2666667, 1, 1,
0.3857133, -0.2924866, 0.987305, 0, 0.2627451, 1, 1,
0.3875732, 0.03204237, 1.840661, 0, 0.254902, 1, 1,
0.3880322, -0.8184821, 1.894451, 0, 0.2509804, 1, 1,
0.3905325, -0.2167588, 2.818399, 0, 0.2431373, 1, 1,
0.3944622, 0.6542652, -0.4944566, 0, 0.2392157, 1, 1,
0.3965749, -0.5251788, 3.598423, 0, 0.2313726, 1, 1,
0.3989273, -0.83995, 1.943875, 0, 0.227451, 1, 1,
0.4004534, 0.07816379, 1.64433, 0, 0.2196078, 1, 1,
0.4061289, 0.1957249, 0.407832, 0, 0.2156863, 1, 1,
0.4090626, -0.8383388, 1.726602, 0, 0.2078431, 1, 1,
0.4104652, 0.03794786, 2.189767, 0, 0.2039216, 1, 1,
0.4117059, -0.6117402, 3.611087, 0, 0.1960784, 1, 1,
0.4137535, 0.7949779, -1.354649, 0, 0.1882353, 1, 1,
0.4152701, 0.2376709, 0.9813927, 0, 0.1843137, 1, 1,
0.4178843, 0.585372, 1.482076, 0, 0.1764706, 1, 1,
0.419087, -0.1739907, 4.137545, 0, 0.172549, 1, 1,
0.4422427, 1.746093, 0.987984, 0, 0.1647059, 1, 1,
0.4440711, -0.1739442, 0.3226515, 0, 0.1607843, 1, 1,
0.4451959, -0.4404621, 2.163909, 0, 0.1529412, 1, 1,
0.4454419, 1.4031, -0.3274432, 0, 0.1490196, 1, 1,
0.447263, 0.03416223, 0.3420193, 0, 0.1411765, 1, 1,
0.4522646, 1.228891, 0.2590648, 0, 0.1372549, 1, 1,
0.4527493, 0.188073, 1.479829, 0, 0.1294118, 1, 1,
0.4537843, 0.5717177, -0.2705663, 0, 0.1254902, 1, 1,
0.4675203, -0.6200934, 2.441944, 0, 0.1176471, 1, 1,
0.4698186, -1.386482, 2.497369, 0, 0.1137255, 1, 1,
0.4723995, 0.237207, 1.773226, 0, 0.1058824, 1, 1,
0.4739566, 0.1673147, -0.04960978, 0, 0.09803922, 1, 1,
0.47506, -0.5773121, 3.707747, 0, 0.09411765, 1, 1,
0.4757092, 1.474294, -0.3227278, 0, 0.08627451, 1, 1,
0.476177, -0.5055369, 2.028332, 0, 0.08235294, 1, 1,
0.4779079, -0.5165246, 3.783264, 0, 0.07450981, 1, 1,
0.4828716, 0.2064709, 0.2204884, 0, 0.07058824, 1, 1,
0.484524, -0.6337852, 1.742181, 0, 0.0627451, 1, 1,
0.4863431, -0.4127901, 1.567065, 0, 0.05882353, 1, 1,
0.4867057, 1.915177, 1.468533, 0, 0.05098039, 1, 1,
0.4868215, -0.1811807, 1.661764, 0, 0.04705882, 1, 1,
0.4880346, 0.7913185, -0.4726766, 0, 0.03921569, 1, 1,
0.4921086, 0.0667687, 1.675054, 0, 0.03529412, 1, 1,
0.4922322, 0.7450437, 0.8369268, 0, 0.02745098, 1, 1,
0.4925269, 0.5438221, -0.1463652, 0, 0.02352941, 1, 1,
0.4953023, 0.04912851, 1.13786, 0, 0.01568628, 1, 1,
0.4980795, -0.9923927, 2.470543, 0, 0.01176471, 1, 1,
0.4991868, 0.548121, 0.03192057, 0, 0.003921569, 1, 1,
0.5085531, -1.684732, 2.560361, 0.003921569, 0, 1, 1,
0.511465, -1.823645, 2.965576, 0.007843138, 0, 1, 1,
0.5132612, -1.024363, 2.714756, 0.01568628, 0, 1, 1,
0.5218203, -0.133194, 0.2246201, 0.01960784, 0, 1, 1,
0.5230021, -0.8524833, 2.689873, 0.02745098, 0, 1, 1,
0.5249188, -0.4160075, 1.990703, 0.03137255, 0, 1, 1,
0.5256885, -0.9457608, 2.545723, 0.03921569, 0, 1, 1,
0.5267592, 0.6882185, 0.62932, 0.04313726, 0, 1, 1,
0.5275971, 0.4635387, 0.4442245, 0.05098039, 0, 1, 1,
0.5286219, -0.1019833, -0.3374161, 0.05490196, 0, 1, 1,
0.530164, 0.3833622, -0.1561961, 0.0627451, 0, 1, 1,
0.53064, 1.189837, 1.610693, 0.06666667, 0, 1, 1,
0.5308003, 1.50244, 0.8093073, 0.07450981, 0, 1, 1,
0.5334355, -1.18149, 0.7159275, 0.07843138, 0, 1, 1,
0.5450237, -0.9710103, 2.625657, 0.08627451, 0, 1, 1,
0.5476128, -1.146318, 0.8007129, 0.09019608, 0, 1, 1,
0.5507625, 0.7763244, 0.1986996, 0.09803922, 0, 1, 1,
0.5518101, 0.6368952, -0.4944415, 0.1058824, 0, 1, 1,
0.5519613, -0.2175343, 1.161824, 0.1098039, 0, 1, 1,
0.5525898, -0.07499494, 0.9470973, 0.1176471, 0, 1, 1,
0.5562014, 0.3671873, 1.099372, 0.1215686, 0, 1, 1,
0.5616406, -0.02244677, 1.085651, 0.1294118, 0, 1, 1,
0.5659286, -0.1256799, 2.097904, 0.1333333, 0, 1, 1,
0.5675069, 1.041755, 0.3185764, 0.1411765, 0, 1, 1,
0.5750197, -0.9327253, 2.004552, 0.145098, 0, 1, 1,
0.5752781, -0.2204262, 2.103543, 0.1529412, 0, 1, 1,
0.5757447, 0.568231, 0.2564734, 0.1568628, 0, 1, 1,
0.5786463, -0.4866213, 2.147519, 0.1647059, 0, 1, 1,
0.5866556, -0.7081585, 0.6748599, 0.1686275, 0, 1, 1,
0.5880094, -1.05018, 3.388295, 0.1764706, 0, 1, 1,
0.5903582, 1.17598, 0.9091794, 0.1803922, 0, 1, 1,
0.5974914, -1.079659, 3.284889, 0.1882353, 0, 1, 1,
0.6063774, 0.8042704, 0.2892014, 0.1921569, 0, 1, 1,
0.6096234, -0.5077814, 1.697815, 0.2, 0, 1, 1,
0.6115004, 0.1229232, 0.5672688, 0.2078431, 0, 1, 1,
0.6182852, 1.261944, 0.7861474, 0.2117647, 0, 1, 1,
0.6206104, 2.016831, -0.5659645, 0.2196078, 0, 1, 1,
0.6207615, -1.422378, 5.133043, 0.2235294, 0, 1, 1,
0.6237976, 0.9285275, 1.291002, 0.2313726, 0, 1, 1,
0.6248848, -1.39747, 2.009468, 0.2352941, 0, 1, 1,
0.6263577, 0.05329143, 2.474187, 0.2431373, 0, 1, 1,
0.6266941, 0.9671531, 0.8799488, 0.2470588, 0, 1, 1,
0.6280997, -0.58999, 2.247317, 0.254902, 0, 1, 1,
0.6281943, -0.500419, 1.771917, 0.2588235, 0, 1, 1,
0.6297209, -1.347738, 2.342622, 0.2666667, 0, 1, 1,
0.6320929, 0.01203423, 0.7806127, 0.2705882, 0, 1, 1,
0.6354454, -0.9318083, 1.657412, 0.2784314, 0, 1, 1,
0.6355632, 0.5234786, 1.661494, 0.282353, 0, 1, 1,
0.6364641, 1.047612, 1.252619, 0.2901961, 0, 1, 1,
0.6377, 0.1938043, 1.055055, 0.2941177, 0, 1, 1,
0.6405763, 0.254591, 1.31929, 0.3019608, 0, 1, 1,
0.6434274, 0.1984124, 0.2181922, 0.3098039, 0, 1, 1,
0.6480599, 1.398987, -0.02733283, 0.3137255, 0, 1, 1,
0.6495338, -1.176313, 3.766062, 0.3215686, 0, 1, 1,
0.6495941, -1.227358, 2.476858, 0.3254902, 0, 1, 1,
0.6525521, 0.7756569, -0.2161425, 0.3333333, 0, 1, 1,
0.6532143, -0.009578356, 2.30846, 0.3372549, 0, 1, 1,
0.6533878, -0.9029746, 0.3416274, 0.345098, 0, 1, 1,
0.653477, -0.4953464, 3.468338, 0.3490196, 0, 1, 1,
0.6550399, -0.22483, 4.135803, 0.3568628, 0, 1, 1,
0.6571246, 0.5505996, 0.4225865, 0.3607843, 0, 1, 1,
0.6571631, -0.10616, 1.490229, 0.3686275, 0, 1, 1,
0.6573192, 0.5737258, 0.7551836, 0.372549, 0, 1, 1,
0.6590988, -1.398352, 2.603614, 0.3803922, 0, 1, 1,
0.659458, 0.8427157, 0.9929181, 0.3843137, 0, 1, 1,
0.6616741, 1.796752, 0.350927, 0.3921569, 0, 1, 1,
0.6720424, -0.2984058, -0.0954251, 0.3960784, 0, 1, 1,
0.6729041, -0.1692627, 2.494318, 0.4039216, 0, 1, 1,
0.6735027, -0.5410672, 2.475, 0.4117647, 0, 1, 1,
0.6738848, 0.7616647, 0.2801069, 0.4156863, 0, 1, 1,
0.6751832, 2.527864, 0.3157968, 0.4235294, 0, 1, 1,
0.6763953, -1.30309, 2.148869, 0.427451, 0, 1, 1,
0.6789474, 1.947064, 0.1479357, 0.4352941, 0, 1, 1,
0.6798118, -0.366604, 2.385551, 0.4392157, 0, 1, 1,
0.6807777, -0.9020425, 3.234444, 0.4470588, 0, 1, 1,
0.6813874, -1.292543, 4.5796, 0.4509804, 0, 1, 1,
0.6834649, -1.226409, 1.484027, 0.4588235, 0, 1, 1,
0.6849108, -1.06087, 1.048152, 0.4627451, 0, 1, 1,
0.6866883, 0.9858999, 0.3696367, 0.4705882, 0, 1, 1,
0.6867532, 0.5420862, 0.8812554, 0.4745098, 0, 1, 1,
0.6929376, -1.17193, 1.122108, 0.4823529, 0, 1, 1,
0.7003787, -1.521029, 1.779927, 0.4862745, 0, 1, 1,
0.7035353, 1.410555, 0.3822329, 0.4941176, 0, 1, 1,
0.7054701, -0.4001047, 1.582116, 0.5019608, 0, 1, 1,
0.7062104, -0.3784402, 2.92866, 0.5058824, 0, 1, 1,
0.7131684, 0.3242623, -0.3331695, 0.5137255, 0, 1, 1,
0.7150456, 0.2137209, 0.2385864, 0.5176471, 0, 1, 1,
0.7213174, 0.3427788, 1.822625, 0.5254902, 0, 1, 1,
0.7351776, 0.8940923, 1.007665, 0.5294118, 0, 1, 1,
0.7407947, -0.6637132, 1.87248, 0.5372549, 0, 1, 1,
0.7458079, 0.2217846, -0.2985883, 0.5411765, 0, 1, 1,
0.7464542, 1.517563, 0.5210565, 0.5490196, 0, 1, 1,
0.753444, -0.470797, 2.531356, 0.5529412, 0, 1, 1,
0.7647653, 0.1937379, 1.313999, 0.5607843, 0, 1, 1,
0.7648945, 0.2375976, 0.9477426, 0.5647059, 0, 1, 1,
0.765171, 1.956775, 2.495982, 0.572549, 0, 1, 1,
0.7653295, -0.993269, 4.015373, 0.5764706, 0, 1, 1,
0.7699547, -1.143478, 4.048221, 0.5843138, 0, 1, 1,
0.770491, 0.1580516, 1.000089, 0.5882353, 0, 1, 1,
0.7850499, -0.4138781, 3.991588, 0.5960785, 0, 1, 1,
0.7861853, 0.900786, 1.701686, 0.6039216, 0, 1, 1,
0.7907583, 0.3214119, 1.665244, 0.6078432, 0, 1, 1,
0.7982006, 0.6347403, 2.919813, 0.6156863, 0, 1, 1,
0.8109946, 1.264198, -0.02221657, 0.6196079, 0, 1, 1,
0.8207826, 0.3852394, 1.763284, 0.627451, 0, 1, 1,
0.8214375, -0.5588312, 1.775947, 0.6313726, 0, 1, 1,
0.8219265, 0.7088145, -1.067882, 0.6392157, 0, 1, 1,
0.8242806, 0.8809212, 1.429874, 0.6431373, 0, 1, 1,
0.8264285, -1.185896, 2.115266, 0.6509804, 0, 1, 1,
0.8271708, -0.855767, 4.315979, 0.654902, 0, 1, 1,
0.8277062, 0.599221, 2.016585, 0.6627451, 0, 1, 1,
0.8300393, 0.7814764, 0.5464292, 0.6666667, 0, 1, 1,
0.8306853, -0.6003392, 2.227331, 0.6745098, 0, 1, 1,
0.8376949, -1.376055, 2.313231, 0.6784314, 0, 1, 1,
0.8394388, 1.165829, 0.985441, 0.6862745, 0, 1, 1,
0.8429772, 0.8148205, 0.3077501, 0.6901961, 0, 1, 1,
0.8433506, 0.2609391, -0.1319474, 0.6980392, 0, 1, 1,
0.8440874, -0.2683259, 2.417362, 0.7058824, 0, 1, 1,
0.8461673, -0.7260196, 0.554046, 0.7098039, 0, 1, 1,
0.84787, 1.62406, 0.3449873, 0.7176471, 0, 1, 1,
0.8504912, 0.8220332, -0.8900137, 0.7215686, 0, 1, 1,
0.8532136, 0.8450827, 0.331492, 0.7294118, 0, 1, 1,
0.8547266, 2.297153, 0.790791, 0.7333333, 0, 1, 1,
0.8626256, 1.131821, 3.310145, 0.7411765, 0, 1, 1,
0.8631025, -1.912338, 3.555094, 0.7450981, 0, 1, 1,
0.8631164, -1.938309, 2.340091, 0.7529412, 0, 1, 1,
0.8676262, 0.03320219, 2.28763, 0.7568628, 0, 1, 1,
0.8685825, 0.4293828, -0.0311225, 0.7647059, 0, 1, 1,
0.8736125, 1.192869, 1.050279, 0.7686275, 0, 1, 1,
0.8749838, -0.428123, 3.822837, 0.7764706, 0, 1, 1,
0.8764074, -0.07049897, 1.171083, 0.7803922, 0, 1, 1,
0.8785176, -0.09462381, 1.085399, 0.7882353, 0, 1, 1,
0.8816127, -0.03030662, 0.8185211, 0.7921569, 0, 1, 1,
0.8823091, -0.2330325, -0.01276159, 0.8, 0, 1, 1,
0.8843188, -0.5480654, 1.350786, 0.8078431, 0, 1, 1,
0.885764, -1.628734, 2.115455, 0.8117647, 0, 1, 1,
0.8861074, 0.4595258, 1.817464, 0.8196079, 0, 1, 1,
0.9030322, 0.07308757, 0.8288019, 0.8235294, 0, 1, 1,
0.9116132, 0.8267942, 0.239773, 0.8313726, 0, 1, 1,
0.9181256, 0.4567308, 1.155681, 0.8352941, 0, 1, 1,
0.9212909, -0.3477033, 1.109701, 0.8431373, 0, 1, 1,
0.9230887, 0.3268128, 1.720606, 0.8470588, 0, 1, 1,
0.9327248, -2.05547, 2.556186, 0.854902, 0, 1, 1,
0.9329774, 0.9340152, 1.023806, 0.8588235, 0, 1, 1,
0.938548, -0.6518137, 3.314366, 0.8666667, 0, 1, 1,
0.9461274, 2.054959, -2.226809, 0.8705882, 0, 1, 1,
0.9466743, 1.625131, -0.262392, 0.8784314, 0, 1, 1,
0.9470308, 0.5220346, 1.168549, 0.8823529, 0, 1, 1,
0.9483599, 1.537963, 1.462781, 0.8901961, 0, 1, 1,
0.9485596, 1.748908, 0.4275245, 0.8941177, 0, 1, 1,
0.9548305, 1.198724, 0.9401197, 0.9019608, 0, 1, 1,
0.955215, -0.05344421, 1.937193, 0.9098039, 0, 1, 1,
0.9554027, 0.6187938, 0.8846708, 0.9137255, 0, 1, 1,
0.9595479, 0.2158832, 0.2074132, 0.9215686, 0, 1, 1,
0.9606903, -1.270661, 0.7600652, 0.9254902, 0, 1, 1,
0.9653009, -1.780186, 2.879178, 0.9333333, 0, 1, 1,
0.9689078, -1.145924, 2.425442, 0.9372549, 0, 1, 1,
0.9689516, -0.3265475, 2.855235, 0.945098, 0, 1, 1,
0.9724799, -0.9070973, 2.337182, 0.9490196, 0, 1, 1,
0.973269, -0.9600835, 1.945661, 0.9568627, 0, 1, 1,
0.9771023, 2.244557, 0.833216, 0.9607843, 0, 1, 1,
0.9854041, 1.307292, -0.06791673, 0.9686275, 0, 1, 1,
0.99506, -0.4353495, 2.832627, 0.972549, 0, 1, 1,
1.002041, 0.8525301, 1.005673, 0.9803922, 0, 1, 1,
1.009581, 0.4388704, 1.750333, 0.9843137, 0, 1, 1,
1.010601, 0.5431697, 1.611452, 0.9921569, 0, 1, 1,
1.014082, -0.2878654, 0.9326944, 0.9960784, 0, 1, 1,
1.01859, -0.314422, 1.291576, 1, 0, 0.9960784, 1,
1.018647, 0.3844615, 1.471392, 1, 0, 0.9882353, 1,
1.023316, -1.740149, 2.39077, 1, 0, 0.9843137, 1,
1.029772, 0.2682233, 3.849196, 1, 0, 0.9764706, 1,
1.033827, -0.01782407, 1.102109, 1, 0, 0.972549, 1,
1.036384, -1.269585, 2.510279, 1, 0, 0.9647059, 1,
1.036468, -1.530929, 2.073477, 1, 0, 0.9607843, 1,
1.040934, -0.7918019, 1.647043, 1, 0, 0.9529412, 1,
1.053823, 0.1962897, 0.1340928, 1, 0, 0.9490196, 1,
1.054829, -1.526246, 2.559454, 1, 0, 0.9411765, 1,
1.056974, -1.140618, 3.424832, 1, 0, 0.9372549, 1,
1.0579, 0.7066377, -0.2583069, 1, 0, 0.9294118, 1,
1.067866, -0.4034621, 2.937889, 1, 0, 0.9254902, 1,
1.068835, -0.3038583, -0.4452942, 1, 0, 0.9176471, 1,
1.069782, 0.6695288, 1.08937, 1, 0, 0.9137255, 1,
1.0739, 0.9720162, 0.2829854, 1, 0, 0.9058824, 1,
1.075848, -0.9072058, 1.047812, 1, 0, 0.9019608, 1,
1.086129, 0.5391055, 1.056653, 1, 0, 0.8941177, 1,
1.092176, -0.5509319, 1.785602, 1, 0, 0.8862745, 1,
1.099716, -1.783543, 4.521899, 1, 0, 0.8823529, 1,
1.129699, 1.728306, 0.750271, 1, 0, 0.8745098, 1,
1.132334, 0.3198668, 3.015684, 1, 0, 0.8705882, 1,
1.133765, 0.7557411, 0.7209731, 1, 0, 0.8627451, 1,
1.134465, -0.3733004, 2.002615, 1, 0, 0.8588235, 1,
1.137638, 1.671228, 0.5059845, 1, 0, 0.8509804, 1,
1.143155, 0.05869269, 1.509307, 1, 0, 0.8470588, 1,
1.146727, 0.9806957, 1.169147, 1, 0, 0.8392157, 1,
1.150421, -0.417438, -0.5274684, 1, 0, 0.8352941, 1,
1.1528, 0.05859239, 3.111182, 1, 0, 0.827451, 1,
1.153695, -0.04810269, 0.517704, 1, 0, 0.8235294, 1,
1.156971, -0.2524603, 1.731397, 1, 0, 0.8156863, 1,
1.164235, -0.5184902, -0.2948016, 1, 0, 0.8117647, 1,
1.164711, -0.6685979, 0.6145827, 1, 0, 0.8039216, 1,
1.169098, -0.7678256, 1.606171, 1, 0, 0.7960784, 1,
1.170476, -0.2053801, 0.4303661, 1, 0, 0.7921569, 1,
1.171906, 1.042157, 0.8002843, 1, 0, 0.7843137, 1,
1.173585, 1.344572, 1.112108, 1, 0, 0.7803922, 1,
1.174501, -1.671065, 3.099118, 1, 0, 0.772549, 1,
1.179842, -0.8641086, 1.322715, 1, 0, 0.7686275, 1,
1.180888, 0.7465345, 0.1692065, 1, 0, 0.7607843, 1,
1.184045, 2.007956, 1.696284, 1, 0, 0.7568628, 1,
1.185666, -0.2449397, 1.487787, 1, 0, 0.7490196, 1,
1.187042, -0.7093028, 2.787952, 1, 0, 0.7450981, 1,
1.196981, -0.0449161, 2.686784, 1, 0, 0.7372549, 1,
1.197336, 2.129716, 1.521631, 1, 0, 0.7333333, 1,
1.201981, -0.06803628, 4.125136, 1, 0, 0.7254902, 1,
1.202608, -0.778984, 3.453712, 1, 0, 0.7215686, 1,
1.205675, -0.4759413, 1.076048, 1, 0, 0.7137255, 1,
1.210294, -1.256407, 3.548015, 1, 0, 0.7098039, 1,
1.212023, -0.8374771, 2.27729, 1, 0, 0.7019608, 1,
1.213745, -0.8004894, 1.850614, 1, 0, 0.6941177, 1,
1.219767, 0.4254647, 0.67463, 1, 0, 0.6901961, 1,
1.227268, -2.037111, 3.3587, 1, 0, 0.682353, 1,
1.228858, -0.2102134, -0.1883819, 1, 0, 0.6784314, 1,
1.233035, -0.3264005, 2.279235, 1, 0, 0.6705883, 1,
1.23945, -0.8674624, 2.396448, 1, 0, 0.6666667, 1,
1.243236, 0.4030617, 2.864274, 1, 0, 0.6588235, 1,
1.244884, 0.9787005, -0.2447963, 1, 0, 0.654902, 1,
1.24886, -0.1542883, 0.811026, 1, 0, 0.6470588, 1,
1.249314, 1.008369, 0.1075055, 1, 0, 0.6431373, 1,
1.254515, -1.334015, 2.648311, 1, 0, 0.6352941, 1,
1.257784, 0.1748754, 1.790088, 1, 0, 0.6313726, 1,
1.260896, 2.362679, 0.3089443, 1, 0, 0.6235294, 1,
1.277512, 1.142658, 0.7627307, 1, 0, 0.6196079, 1,
1.288602, -0.6206449, 1.100414, 1, 0, 0.6117647, 1,
1.294949, 0.1988552, 1.722193, 1, 0, 0.6078432, 1,
1.296838, -2.781696, 1.328725, 1, 0, 0.6, 1,
1.29738, 0.7255024, 1.707829, 1, 0, 0.5921569, 1,
1.306627, -0.2875448, -0.3611555, 1, 0, 0.5882353, 1,
1.32985, 0.1010423, 2.29938, 1, 0, 0.5803922, 1,
1.332474, -1.240148, 1.67308, 1, 0, 0.5764706, 1,
1.350194, 0.6848591, 1.080206, 1, 0, 0.5686275, 1,
1.351111, 0.9695867, 0.6577575, 1, 0, 0.5647059, 1,
1.352402, -0.7506672, 0.8527439, 1, 0, 0.5568628, 1,
1.372085, -1.368061, 2.547297, 1, 0, 0.5529412, 1,
1.37837, 1.108647, 0.527903, 1, 0, 0.5450981, 1,
1.382185, 1.334968, 0.1152385, 1, 0, 0.5411765, 1,
1.386003, 0.602007, 1.423584, 1, 0, 0.5333334, 1,
1.39344, 0.5912787, 0.2347022, 1, 0, 0.5294118, 1,
1.398345, 0.2740324, 1.348734, 1, 0, 0.5215687, 1,
1.420353, -0.362428, 1.364545, 1, 0, 0.5176471, 1,
1.422875, -0.009224425, 1.506216, 1, 0, 0.509804, 1,
1.422942, 1.934289, 1.815153, 1, 0, 0.5058824, 1,
1.433313, 0.243191, 1.464838, 1, 0, 0.4980392, 1,
1.435736, -1.679074, 0.02230317, 1, 0, 0.4901961, 1,
1.44764, 0.5611935, -0.2842641, 1, 0, 0.4862745, 1,
1.457499, -1.235693, 2.384959, 1, 0, 0.4784314, 1,
1.457702, 0.04608231, 0.5165499, 1, 0, 0.4745098, 1,
1.460803, -0.2213777, 1.297827, 1, 0, 0.4666667, 1,
1.475642, 0.8573675, 0.6531132, 1, 0, 0.4627451, 1,
1.496667, 0.08279638, -0.6386699, 1, 0, 0.454902, 1,
1.522103, 0.2674971, 1.365399, 1, 0, 0.4509804, 1,
1.529285, -0.5760589, 2.397932, 1, 0, 0.4431373, 1,
1.533171, 0.4131386, 1.823177, 1, 0, 0.4392157, 1,
1.55633, 0.4385691, 3.171058, 1, 0, 0.4313726, 1,
1.576035, -2.881035, 2.481175, 1, 0, 0.427451, 1,
1.580131, -1.117168, 2.813519, 1, 0, 0.4196078, 1,
1.584892, -1.119773, 2.445038, 1, 0, 0.4156863, 1,
1.603455, -0.485135, 2.376089, 1, 0, 0.4078431, 1,
1.607554, 0.7149423, -0.9389983, 1, 0, 0.4039216, 1,
1.620273, -0.3009721, 1.577314, 1, 0, 0.3960784, 1,
1.623386, 0.180785, 0.7679309, 1, 0, 0.3882353, 1,
1.62421, 2.159802, 1.137334, 1, 0, 0.3843137, 1,
1.628202, -1.140361, 1.422733, 1, 0, 0.3764706, 1,
1.637851, 0.2955529, 0.4399564, 1, 0, 0.372549, 1,
1.647547, -0.1831034, -1.138622, 1, 0, 0.3647059, 1,
1.656379, -0.6589282, 3.698091, 1, 0, 0.3607843, 1,
1.67063, -0.5211882, 1.955561, 1, 0, 0.3529412, 1,
1.675001, 0.05512585, 0.7646548, 1, 0, 0.3490196, 1,
1.677212, -0.1518535, 1.761944, 1, 0, 0.3411765, 1,
1.67855, -0.7738535, 2.941011, 1, 0, 0.3372549, 1,
1.684534, -0.2988999, 1.717061, 1, 0, 0.3294118, 1,
1.686182, 2.23822, 0.8049334, 1, 0, 0.3254902, 1,
1.697188, -0.3317718, 2.443274, 1, 0, 0.3176471, 1,
1.706362, 0.463516, 0.7935489, 1, 0, 0.3137255, 1,
1.70939, 0.5078204, 3.223558, 1, 0, 0.3058824, 1,
1.712405, 1.324707, 2.130306, 1, 0, 0.2980392, 1,
1.742991, -0.3428238, 1.576496, 1, 0, 0.2941177, 1,
1.744746, 0.4931717, 0.6884822, 1, 0, 0.2862745, 1,
1.764239, 1.300209, 1.457126, 1, 0, 0.282353, 1,
1.766674, -0.1392285, 2.072134, 1, 0, 0.2745098, 1,
1.776166, -0.1422837, 2.728803, 1, 0, 0.2705882, 1,
1.78686, -1.491492, 2.565898, 1, 0, 0.2627451, 1,
1.804574, 0.6941047, 0.904863, 1, 0, 0.2588235, 1,
1.808663, 0.6647339, 1.01797, 1, 0, 0.2509804, 1,
1.831121, 1.304375, 0.5566574, 1, 0, 0.2470588, 1,
1.842923, -0.2451528, 1.388799, 1, 0, 0.2392157, 1,
1.843358, 0.3284621, -1.286534, 1, 0, 0.2352941, 1,
1.847392, -1.418178, 3.615692, 1, 0, 0.227451, 1,
1.850181, -2.077239, 1.046794, 1, 0, 0.2235294, 1,
1.873417, -1.054456, 0.7777821, 1, 0, 0.2156863, 1,
1.898567, -0.5150912, 0.9882253, 1, 0, 0.2117647, 1,
1.905712, 0.3217821, 0.9950683, 1, 0, 0.2039216, 1,
1.917257, -1.476541, 2.683724, 1, 0, 0.1960784, 1,
1.934318, -0.218096, 1.101241, 1, 0, 0.1921569, 1,
1.957395, -1.608438, 3.90117, 1, 0, 0.1843137, 1,
1.966644, -1.331824, 1.343605, 1, 0, 0.1803922, 1,
1.972546, -0.9122047, 2.200829, 1, 0, 0.172549, 1,
2.015253, -0.1793008, 1.338231, 1, 0, 0.1686275, 1,
2.02588, -0.008406277, 2.012031, 1, 0, 0.1607843, 1,
2.04131, -0.4590167, 0.8707728, 1, 0, 0.1568628, 1,
2.078942, -0.3251619, 3.123249, 1, 0, 0.1490196, 1,
2.090595, 0.6032955, 1.010304, 1, 0, 0.145098, 1,
2.090734, -0.3854, 1.580985, 1, 0, 0.1372549, 1,
2.115115, -2.077797, 1.796713, 1, 0, 0.1333333, 1,
2.130303, -1.073451, 2.699494, 1, 0, 0.1254902, 1,
2.18137, 0.9013367, 0.7300656, 1, 0, 0.1215686, 1,
2.197861, 2.479386, 1.127377, 1, 0, 0.1137255, 1,
2.207803, -1.973021, 1.583379, 1, 0, 0.1098039, 1,
2.223388, -1.61749, 1.669849, 1, 0, 0.1019608, 1,
2.319797, 1.623219, 0.4341843, 1, 0, 0.09411765, 1,
2.329275, -1.274625, 2.676056, 1, 0, 0.09019608, 1,
2.329732, -0.0120775, 1.095199, 1, 0, 0.08235294, 1,
2.336043, -0.2873431, 2.339629, 1, 0, 0.07843138, 1,
2.381256, -0.03288226, 0.129873, 1, 0, 0.07058824, 1,
2.389952, -0.4992339, 0.5772538, 1, 0, 0.06666667, 1,
2.426346, -0.4439202, 1.842484, 1, 0, 0.05882353, 1,
2.44119, -1.120895, 1.909466, 1, 0, 0.05490196, 1,
2.493014, 0.04653955, 1.440934, 1, 0, 0.04705882, 1,
2.590579, -0.1204375, 0.06687322, 1, 0, 0.04313726, 1,
2.67172, 0.3362417, 2.355188, 1, 0, 0.03529412, 1,
2.751927, -0.655507, 1.966619, 1, 0, 0.03137255, 1,
2.759885, -0.289844, 1.020539, 1, 0, 0.02352941, 1,
2.837092, 0.5489736, 1.029098, 1, 0, 0.01960784, 1,
2.932437, 0.1062816, 0.3158589, 1, 0, 0.01176471, 1,
3.691679, 2.308627, 0.4820888, 1, 0, 0.007843138, 1
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
0.0988847, -3.997243, -6.497691, 0, -0.5, 0.5, 0.5,
0.0988847, -3.997243, -6.497691, 1, -0.5, 0.5, 0.5,
0.0988847, -3.997243, -6.497691, 1, 1.5, 0.5, 0.5,
0.0988847, -3.997243, -6.497691, 0, 1.5, 0.5, 0.5
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
-4.711867, -0.2159231, -6.497691, 0, -0.5, 0.5, 0.5,
-4.711867, -0.2159231, -6.497691, 1, -0.5, 0.5, 0.5,
-4.711867, -0.2159231, -6.497691, 1, 1.5, 0.5, 0.5,
-4.711867, -0.2159231, -6.497691, 0, 1.5, 0.5, 0.5
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
-4.711867, -3.997243, 0.1605191, 0, -0.5, 0.5, 0.5,
-4.711867, -3.997243, 0.1605191, 1, -0.5, 0.5, 0.5,
-4.711867, -3.997243, 0.1605191, 1, 1.5, 0.5, 0.5,
-4.711867, -3.997243, 0.1605191, 0, 1.5, 0.5, 0.5
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
-2, -3.12463, -4.961181,
2, -3.12463, -4.961181,
-2, -3.12463, -4.961181,
-2, -3.270066, -5.217266,
0, -3.12463, -4.961181,
0, -3.270066, -5.217266,
2, -3.12463, -4.961181,
2, -3.270066, -5.217266
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
"0",
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
-2, -3.560936, -5.729436, 0, -0.5, 0.5, 0.5,
-2, -3.560936, -5.729436, 1, -0.5, 0.5, 0.5,
-2, -3.560936, -5.729436, 1, 1.5, 0.5, 0.5,
-2, -3.560936, -5.729436, 0, 1.5, 0.5, 0.5,
0, -3.560936, -5.729436, 0, -0.5, 0.5, 0.5,
0, -3.560936, -5.729436, 1, -0.5, 0.5, 0.5,
0, -3.560936, -5.729436, 1, 1.5, 0.5, 0.5,
0, -3.560936, -5.729436, 0, 1.5, 0.5, 0.5,
2, -3.560936, -5.729436, 0, -0.5, 0.5, 0.5,
2, -3.560936, -5.729436, 1, -0.5, 0.5, 0.5,
2, -3.560936, -5.729436, 1, 1.5, 0.5, 0.5,
2, -3.560936, -5.729436, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.601694, -3, -4.961181,
-3.601694, 2, -4.961181,
-3.601694, -3, -4.961181,
-3.786723, -3, -5.217266,
-3.601694, -2, -4.961181,
-3.786723, -2, -5.217266,
-3.601694, -1, -4.961181,
-3.786723, -1, -5.217266,
-3.601694, 0, -4.961181,
-3.786723, 0, -5.217266,
-3.601694, 1, -4.961181,
-3.786723, 1, -5.217266,
-3.601694, 2, -4.961181,
-3.786723, 2, -5.217266
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
"2"
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
-4.15678, -3, -5.729436, 0, -0.5, 0.5, 0.5,
-4.15678, -3, -5.729436, 1, -0.5, 0.5, 0.5,
-4.15678, -3, -5.729436, 1, 1.5, 0.5, 0.5,
-4.15678, -3, -5.729436, 0, 1.5, 0.5, 0.5,
-4.15678, -2, -5.729436, 0, -0.5, 0.5, 0.5,
-4.15678, -2, -5.729436, 1, -0.5, 0.5, 0.5,
-4.15678, -2, -5.729436, 1, 1.5, 0.5, 0.5,
-4.15678, -2, -5.729436, 0, 1.5, 0.5, 0.5,
-4.15678, -1, -5.729436, 0, -0.5, 0.5, 0.5,
-4.15678, -1, -5.729436, 1, -0.5, 0.5, 0.5,
-4.15678, -1, -5.729436, 1, 1.5, 0.5, 0.5,
-4.15678, -1, -5.729436, 0, 1.5, 0.5, 0.5,
-4.15678, 0, -5.729436, 0, -0.5, 0.5, 0.5,
-4.15678, 0, -5.729436, 1, -0.5, 0.5, 0.5,
-4.15678, 0, -5.729436, 1, 1.5, 0.5, 0.5,
-4.15678, 0, -5.729436, 0, 1.5, 0.5, 0.5,
-4.15678, 1, -5.729436, 0, -0.5, 0.5, 0.5,
-4.15678, 1, -5.729436, 1, -0.5, 0.5, 0.5,
-4.15678, 1, -5.729436, 1, 1.5, 0.5, 0.5,
-4.15678, 1, -5.729436, 0, 1.5, 0.5, 0.5,
-4.15678, 2, -5.729436, 0, -0.5, 0.5, 0.5,
-4.15678, 2, -5.729436, 1, -0.5, 0.5, 0.5,
-4.15678, 2, -5.729436, 1, 1.5, 0.5, 0.5,
-4.15678, 2, -5.729436, 0, 1.5, 0.5, 0.5
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
-3.601694, -3.12463, -4,
-3.601694, -3.12463, 4,
-3.601694, -3.12463, -4,
-3.786723, -3.270066, -4,
-3.601694, -3.12463, -2,
-3.786723, -3.270066, -2,
-3.601694, -3.12463, 0,
-3.786723, -3.270066, 0,
-3.601694, -3.12463, 2,
-3.786723, -3.270066, 2,
-3.601694, -3.12463, 4,
-3.786723, -3.270066, 4
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
-4.15678, -3.560936, -4, 0, -0.5, 0.5, 0.5,
-4.15678, -3.560936, -4, 1, -0.5, 0.5, 0.5,
-4.15678, -3.560936, -4, 1, 1.5, 0.5, 0.5,
-4.15678, -3.560936, -4, 0, 1.5, 0.5, 0.5,
-4.15678, -3.560936, -2, 0, -0.5, 0.5, 0.5,
-4.15678, -3.560936, -2, 1, -0.5, 0.5, 0.5,
-4.15678, -3.560936, -2, 1, 1.5, 0.5, 0.5,
-4.15678, -3.560936, -2, 0, 1.5, 0.5, 0.5,
-4.15678, -3.560936, 0, 0, -0.5, 0.5, 0.5,
-4.15678, -3.560936, 0, 1, -0.5, 0.5, 0.5,
-4.15678, -3.560936, 0, 1, 1.5, 0.5, 0.5,
-4.15678, -3.560936, 0, 0, 1.5, 0.5, 0.5,
-4.15678, -3.560936, 2, 0, -0.5, 0.5, 0.5,
-4.15678, -3.560936, 2, 1, -0.5, 0.5, 0.5,
-4.15678, -3.560936, 2, 1, 1.5, 0.5, 0.5,
-4.15678, -3.560936, 2, 0, 1.5, 0.5, 0.5,
-4.15678, -3.560936, 4, 0, -0.5, 0.5, 0.5,
-4.15678, -3.560936, 4, 1, -0.5, 0.5, 0.5,
-4.15678, -3.560936, 4, 1, 1.5, 0.5, 0.5,
-4.15678, -3.560936, 4, 0, 1.5, 0.5, 0.5
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
-3.601694, -3.12463, -4.961181,
-3.601694, 2.692784, -4.961181,
-3.601694, -3.12463, 5.282219,
-3.601694, 2.692784, 5.282219,
-3.601694, -3.12463, -4.961181,
-3.601694, -3.12463, 5.282219,
-3.601694, 2.692784, -4.961181,
-3.601694, 2.692784, 5.282219,
-3.601694, -3.12463, -4.961181,
3.799463, -3.12463, -4.961181,
-3.601694, -3.12463, 5.282219,
3.799463, -3.12463, 5.282219,
-3.601694, 2.692784, -4.961181,
3.799463, 2.692784, -4.961181,
-3.601694, 2.692784, 5.282219,
3.799463, 2.692784, 5.282219,
3.799463, -3.12463, -4.961181,
3.799463, 2.692784, -4.961181,
3.799463, -3.12463, 5.282219,
3.799463, 2.692784, 5.282219,
3.799463, -3.12463, -4.961181,
3.799463, -3.12463, 5.282219,
3.799463, 2.692784, -4.961181,
3.799463, 2.692784, 5.282219
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
var radius = 7.428794;
var distance = 33.05154;
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
mvMatrix.translate( -0.0988847, 0.2159231, -0.1605191 );
mvMatrix.scale( 1.085257, 1.380709, 0.78413 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.05154);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
Oxycarboxin<-read.table("Oxycarboxin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Oxycarboxin$V2
```

```
## Error in eval(expr, envir, enclos): object 'Oxycarboxin' not found
```

```r
y<-Oxycarboxin$V3
```

```
## Error in eval(expr, envir, enclos): object 'Oxycarboxin' not found
```

```r
z<-Oxycarboxin$V4
```

```
## Error in eval(expr, envir, enclos): object 'Oxycarboxin' not found
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
-3.49391, 0.3916731, -2.947833, 0, 0, 1, 1, 1,
-2.944284, -0.5365397, -2.774565, 1, 0, 0, 1, 1,
-2.934037, -0.2874491, -1.916297, 1, 0, 0, 1, 1,
-2.839117, 0.8342428, 0.3746664, 1, 0, 0, 1, 1,
-2.682489, -0.106688, -1.906858, 1, 0, 0, 1, 1,
-2.635165, 0.6325713, -3.573401, 1, 0, 0, 1, 1,
-2.553973, -1.968551, -2.908093, 0, 0, 0, 1, 1,
-2.51535, 1.626817, -1.904889, 0, 0, 0, 1, 1,
-2.462277, -0.2906037, -0.7623383, 0, 0, 0, 1, 1,
-2.461599, 0.04274662, -2.189554, 0, 0, 0, 1, 1,
-2.382263, -0.9751525, -2.696199, 0, 0, 0, 1, 1,
-2.36873, 0.8875671, -1.641248, 0, 0, 0, 1, 1,
-2.326198, 0.7897931, -2.489556, 0, 0, 0, 1, 1,
-2.25823, 0.750192, -0.7344216, 1, 1, 1, 1, 1,
-2.256041, -1.200702, -2.014786, 1, 1, 1, 1, 1,
-2.244567, 0.7074515, -2.310042, 1, 1, 1, 1, 1,
-2.242578, 0.220472, -2.919192, 1, 1, 1, 1, 1,
-2.144405, -0.1934871, -0.7101126, 1, 1, 1, 1, 1,
-2.062159, -1.237565, -0.4413835, 1, 1, 1, 1, 1,
-2.053143, -0.1986354, -1.265009, 1, 1, 1, 1, 1,
-2.004462, 0.1138376, -1.077182, 1, 1, 1, 1, 1,
-1.976124, 1.014059, -1.327764, 1, 1, 1, 1, 1,
-1.965752, -0.8144936, -2.457183, 1, 1, 1, 1, 1,
-1.961755, -0.5091938, -1.354422, 1, 1, 1, 1, 1,
-1.95845, -1.077758, -3.145118, 1, 1, 1, 1, 1,
-1.92212, -2.099208, -1.612378, 1, 1, 1, 1, 1,
-1.907872, 1.114309, -1.03169, 1, 1, 1, 1, 1,
-1.904709, -0.1311395, -0.728781, 1, 1, 1, 1, 1,
-1.867288, -0.5627556, -2.310667, 0, 0, 1, 1, 1,
-1.855893, -0.3559347, -1.728399, 1, 0, 0, 1, 1,
-1.853661, -0.8891348, -2.791654, 1, 0, 0, 1, 1,
-1.824903, 1.49412, -1.602492, 1, 0, 0, 1, 1,
-1.817821, -0.4861024, -1.76289, 1, 0, 0, 1, 1,
-1.797847, 0.3302179, -1.083176, 1, 0, 0, 1, 1,
-1.777221, 0.969969, -3.230934, 0, 0, 0, 1, 1,
-1.767917, -0.1226799, -0.2658163, 0, 0, 0, 1, 1,
-1.733683, -1.463374, -2.560507, 0, 0, 0, 1, 1,
-1.729333, -0.9531088, -1.650374, 0, 0, 0, 1, 1,
-1.724733, 0.03112355, -0.3244712, 0, 0, 0, 1, 1,
-1.724434, 1.01849, -0.7535588, 0, 0, 0, 1, 1,
-1.723595, 0.2826023, -2.110159, 0, 0, 0, 1, 1,
-1.713286, -1.550507, -2.949651, 1, 1, 1, 1, 1,
-1.701488, 0.1660327, -1.091569, 1, 1, 1, 1, 1,
-1.667847, 0.7001323, -0.4579522, 1, 1, 1, 1, 1,
-1.66748, -1.694686, -1.888107, 1, 1, 1, 1, 1,
-1.66628, 0.2666415, -1.536668, 1, 1, 1, 1, 1,
-1.654981, -0.5893278, -2.053037, 1, 1, 1, 1, 1,
-1.645254, -1.169713, -2.140531, 1, 1, 1, 1, 1,
-1.637822, -0.5515848, -1.491396, 1, 1, 1, 1, 1,
-1.6313, -1.550825, -1.721468, 1, 1, 1, 1, 1,
-1.628075, 1.051371, -1.327013, 1, 1, 1, 1, 1,
-1.626777, 0.1288302, -2.714351, 1, 1, 1, 1, 1,
-1.61757, 0.813666, -1.63181, 1, 1, 1, 1, 1,
-1.613486, -0.9774411, -3.092818, 1, 1, 1, 1, 1,
-1.60909, 1.39467, -0.3623702, 1, 1, 1, 1, 1,
-1.607107, -0.4391643, -1.903967, 1, 1, 1, 1, 1,
-1.590472, 0.5164148, -1.575864, 0, 0, 1, 1, 1,
-1.565577, -1.771424, -2.363182, 1, 0, 0, 1, 1,
-1.550264, -1.025306, -3.826632, 1, 0, 0, 1, 1,
-1.543898, -0.02294674, 0.5276572, 1, 0, 0, 1, 1,
-1.542175, 1.111814, -1.661528, 1, 0, 0, 1, 1,
-1.5371, 0.3022994, -0.266826, 1, 0, 0, 1, 1,
-1.530381, -0.299485, -3.092474, 0, 0, 0, 1, 1,
-1.51993, -0.05693194, -2.136837, 0, 0, 0, 1, 1,
-1.501895, 1.009255, -1.595027, 0, 0, 0, 1, 1,
-1.481517, 2.005277, -0.4362821, 0, 0, 0, 1, 1,
-1.477815, 0.7167275, 0.9735363, 0, 0, 0, 1, 1,
-1.475574, -1.040777, -2.526643, 0, 0, 0, 1, 1,
-1.458861, -1.699009, -2.736736, 0, 0, 0, 1, 1,
-1.455474, -0.04107798, -0.8045554, 1, 1, 1, 1, 1,
-1.441225, 0.7553053, -1.925586, 1, 1, 1, 1, 1,
-1.431656, 0.2361856, -1.230008, 1, 1, 1, 1, 1,
-1.419663, -0.4975819, -3.4956, 1, 1, 1, 1, 1,
-1.418727, 1.349051, -0.8158967, 1, 1, 1, 1, 1,
-1.417703, 1.161693, -0.4604138, 1, 1, 1, 1, 1,
-1.416285, -1.22494, -3.98326, 1, 1, 1, 1, 1,
-1.414763, 0.3466783, -1.939653, 1, 1, 1, 1, 1,
-1.411634, 0.2042664, -1.242363, 1, 1, 1, 1, 1,
-1.389434, -0.08855262, -2.830764, 1, 1, 1, 1, 1,
-1.38367, -1.08913, 0.27365, 1, 1, 1, 1, 1,
-1.358911, -0.4511313, -1.874482, 1, 1, 1, 1, 1,
-1.353579, -1.251773, -1.96365, 1, 1, 1, 1, 1,
-1.342371, 0.3141127, -0.632683, 1, 1, 1, 1, 1,
-1.339654, 1.732378, -0.6232489, 1, 1, 1, 1, 1,
-1.33765, 0.1854171, -0.9642273, 0, 0, 1, 1, 1,
-1.323691, 0.1569529, -1.559811, 1, 0, 0, 1, 1,
-1.314276, 0.2110962, -0.1008294, 1, 0, 0, 1, 1,
-1.305557, 1.56391, 0.8153782, 1, 0, 0, 1, 1,
-1.300727, 0.2983394, -0.6299472, 1, 0, 0, 1, 1,
-1.292387, -0.9707286, -4.084637, 1, 0, 0, 1, 1,
-1.291225, -0.4514457, -2.427542, 0, 0, 0, 1, 1,
-1.285679, 0.1108144, 0.05977922, 0, 0, 0, 1, 1,
-1.283195, -1.116914, -2.335226, 0, 0, 0, 1, 1,
-1.279097, -0.3790448, -1.577614, 0, 0, 0, 1, 1,
-1.274012, -0.6846222, -2.322916, 0, 0, 0, 1, 1,
-1.269391, 0.5747486, -0.03499901, 0, 0, 0, 1, 1,
-1.252163, -0.9443475, -1.7529, 0, 0, 0, 1, 1,
-1.250635, 0.7369339, -1.850953, 1, 1, 1, 1, 1,
-1.249532, 0.6039014, 0.4989873, 1, 1, 1, 1, 1,
-1.246962, -3.039911, -1.777795, 1, 1, 1, 1, 1,
-1.237306, 0.2627064, -1.854878, 1, 1, 1, 1, 1,
-1.218205, 0.5265465, 0.6208052, 1, 1, 1, 1, 1,
-1.216192, -1.107824, -3.38751, 1, 1, 1, 1, 1,
-1.205732, 0.6540358, -0.2193563, 1, 1, 1, 1, 1,
-1.202101, -0.002700444, -0.9364921, 1, 1, 1, 1, 1,
-1.192995, -1.626209, -2.515575, 1, 1, 1, 1, 1,
-1.191748, 1.428176, -1.226155, 1, 1, 1, 1, 1,
-1.184083, 0.189346, 0.9029491, 1, 1, 1, 1, 1,
-1.183614, 1.059039, -1.232436, 1, 1, 1, 1, 1,
-1.174534, -0.5746983, -2.198418, 1, 1, 1, 1, 1,
-1.173, -0.4125643, -4.40237, 1, 1, 1, 1, 1,
-1.16842, 1.283164, -1.516915, 1, 1, 1, 1, 1,
-1.156877, 1.686198, -0.2606876, 0, 0, 1, 1, 1,
-1.156152, 1.011905, 0.01582071, 1, 0, 0, 1, 1,
-1.155791, 1.033821, -1.18659, 1, 0, 0, 1, 1,
-1.148066, -0.3110319, -2.728702, 1, 0, 0, 1, 1,
-1.141222, -0.8327027, -0.3276363, 1, 0, 0, 1, 1,
-1.136222, -1.057065, -2.101908, 1, 0, 0, 1, 1,
-1.127487, -0.9351873, -1.424245, 0, 0, 0, 1, 1,
-1.124507, 0.3527783, -1.054427, 0, 0, 0, 1, 1,
-1.117401, -0.259757, -2.18119, 0, 0, 0, 1, 1,
-1.115019, -0.4499135, -1.832844, 0, 0, 0, 1, 1,
-1.108329, -0.148808, -3.178677, 0, 0, 0, 1, 1,
-1.105224, 0.3113099, -4.017392, 0, 0, 0, 1, 1,
-1.104221, -0.8676676, -2.870934, 0, 0, 0, 1, 1,
-1.094428, -0.4618508, -2.59205, 1, 1, 1, 1, 1,
-1.094108, 0.08287469, -2.512034, 1, 1, 1, 1, 1,
-1.071406, -1.278144, -2.690917, 1, 1, 1, 1, 1,
-1.070655, -3.006981, -2.483618, 1, 1, 1, 1, 1,
-1.064543, -0.309158, -2.066605, 1, 1, 1, 1, 1,
-1.033564, -0.2219214, 0.4748569, 1, 1, 1, 1, 1,
-1.031885, -0.5122169, -4.203045, 1, 1, 1, 1, 1,
-1.024312, 0.9857285, 0.3489304, 1, 1, 1, 1, 1,
-1.02049, 0.6088901, 0.1036604, 1, 1, 1, 1, 1,
-1.019348, -0.5901062, -3.143647, 1, 1, 1, 1, 1,
-1.013081, -2.009106, -2.82926, 1, 1, 1, 1, 1,
-1.007342, 0.4424136, -2.034971, 1, 1, 1, 1, 1,
-1.006012, 0.5337948, -0.4461326, 1, 1, 1, 1, 1,
-1.00363, -0.1620819, -2.225096, 1, 1, 1, 1, 1,
-0.995374, -0.3032578, -2.255755, 1, 1, 1, 1, 1,
-0.9929745, 1.077169, -0.2668829, 0, 0, 1, 1, 1,
-0.9917, 0.7867292, -0.6804623, 1, 0, 0, 1, 1,
-0.9857292, -0.3012995, -2.166488, 1, 0, 0, 1, 1,
-0.9831342, 0.009087772, -2.422299, 1, 0, 0, 1, 1,
-0.9828517, 0.122944, -2.603149, 1, 0, 0, 1, 1,
-0.97868, 0.62172, -1.346997, 1, 0, 0, 1, 1,
-0.9730932, -1.353551, -2.996835, 0, 0, 0, 1, 1,
-0.9692473, 1.850666, 0.2015296, 0, 0, 0, 1, 1,
-0.9689301, -0.3989058, -1.540147, 0, 0, 0, 1, 1,
-0.9667735, -1.331344, -2.669701, 0, 0, 0, 1, 1,
-0.9607803, -0.2268669, -2.048704, 0, 0, 0, 1, 1,
-0.9535098, -0.2185218, -0.3156411, 0, 0, 0, 1, 1,
-0.9480941, -0.5724369, -1.900512, 0, 0, 0, 1, 1,
-0.9404187, 0.5126101, -0.3665782, 1, 1, 1, 1, 1,
-0.9397041, -0.5862901, -0.02157178, 1, 1, 1, 1, 1,
-0.9303818, -0.9638109, -2.758841, 1, 1, 1, 1, 1,
-0.9233169, -0.9084204, -2.527674, 1, 1, 1, 1, 1,
-0.9223496, 2.422497, -1.087578, 1, 1, 1, 1, 1,
-0.9211118, 0.6466076, -0.9071272, 1, 1, 1, 1, 1,
-0.9181432, 0.285526, -1.32415, 1, 1, 1, 1, 1,
-0.8997644, 0.4275776, -1.020856, 1, 1, 1, 1, 1,
-0.8995374, -0.04830419, -3.272409, 1, 1, 1, 1, 1,
-0.8991715, -0.1763018, -2.695482, 1, 1, 1, 1, 1,
-0.8965294, -0.4085138, -1.774574, 1, 1, 1, 1, 1,
-0.8935696, -1.577363, -2.103305, 1, 1, 1, 1, 1,
-0.892019, -0.6236937, -2.937725, 1, 1, 1, 1, 1,
-0.8914841, -1.442684, -2.687647, 1, 1, 1, 1, 1,
-0.8885972, -1.090046, -2.681373, 1, 1, 1, 1, 1,
-0.8871287, 0.1604711, -1.606604, 0, 0, 1, 1, 1,
-0.8784516, 1.827255, -0.6709249, 1, 0, 0, 1, 1,
-0.8762379, -0.3361939, -3.426788, 1, 0, 0, 1, 1,
-0.8719893, -0.1400365, -3.142345, 1, 0, 0, 1, 1,
-0.8718429, 0.4523312, -1.632785, 1, 0, 0, 1, 1,
-0.8705271, 0.7370865, -1.890539, 1, 0, 0, 1, 1,
-0.8655473, -2.608118, -2.775769, 0, 0, 0, 1, 1,
-0.8643834, 1.063426, 1.122875, 0, 0, 0, 1, 1,
-0.8570981, 0.43544, -2.659732, 0, 0, 0, 1, 1,
-0.8554989, 0.4259675, -1.425159, 0, 0, 0, 1, 1,
-0.850177, 0.1658674, -1.151885, 0, 0, 0, 1, 1,
-0.84221, -0.1343028, -2.894545, 0, 0, 0, 1, 1,
-0.8351503, -1.599962, -1.10385, 0, 0, 0, 1, 1,
-0.8299249, -0.6321579, -2.792825, 1, 1, 1, 1, 1,
-0.8291088, -1.585321, -1.620756, 1, 1, 1, 1, 1,
-0.8226463, -1.362333, -2.816111, 1, 1, 1, 1, 1,
-0.8206178, -2.154785, -2.70056, 1, 1, 1, 1, 1,
-0.8169514, 1.296632, -0.5287488, 1, 1, 1, 1, 1,
-0.8158548, -0.3182222, -2.064552, 1, 1, 1, 1, 1,
-0.8146995, -0.6436918, -1.314693, 1, 1, 1, 1, 1,
-0.8124253, -0.4193135, -2.629965, 1, 1, 1, 1, 1,
-0.8102944, 0.16738, 0.514371, 1, 1, 1, 1, 1,
-0.808874, -0.3548559, -3.066341, 1, 1, 1, 1, 1,
-0.8069699, 0.03942686, -1.146203, 1, 1, 1, 1, 1,
-0.8058926, -1.196583, -2.910991, 1, 1, 1, 1, 1,
-0.8057594, -0.7306599, -0.6986396, 1, 1, 1, 1, 1,
-0.8044484, -1.43486, -2.531725, 1, 1, 1, 1, 1,
-0.8043087, 0.2582253, -2.284764, 1, 1, 1, 1, 1,
-0.8032349, -0.8137788, -2.601493, 0, 0, 1, 1, 1,
-0.8012043, -0.861855, -3.108307, 1, 0, 0, 1, 1,
-0.8010361, -1.192405, -2.207904, 1, 0, 0, 1, 1,
-0.7990865, -1.833355, -4.046412, 1, 0, 0, 1, 1,
-0.7981679, 0.4796836, -0.4106202, 1, 0, 0, 1, 1,
-0.7980787, 0.140632, -2.602735, 1, 0, 0, 1, 1,
-0.7959024, 1.959197, -1.648388, 0, 0, 0, 1, 1,
-0.7934371, 1.060649, -0.1882492, 0, 0, 0, 1, 1,
-0.7917385, 0.08529624, 0.2560255, 0, 0, 0, 1, 1,
-0.7886636, 0.366156, -3.250432, 0, 0, 0, 1, 1,
-0.7844393, 0.4938513, -1.793339, 0, 0, 0, 1, 1,
-0.7837843, -1.412598, -3.409724, 0, 0, 0, 1, 1,
-0.781897, 0.8222726, -0.4974241, 0, 0, 0, 1, 1,
-0.7758245, 0.3369307, -1.632297, 1, 1, 1, 1, 1,
-0.7735439, -0.7151329, -1.915448, 1, 1, 1, 1, 1,
-0.7733281, -0.4871027, -3.216537, 1, 1, 1, 1, 1,
-0.7728968, 0.6250305, -1.904092, 1, 1, 1, 1, 1,
-0.7684802, 0.1531937, 0.2250867, 1, 1, 1, 1, 1,
-0.7665809, 0.395511, -0.7479197, 1, 1, 1, 1, 1,
-0.7662724, -0.03801112, -3.324486, 1, 1, 1, 1, 1,
-0.7620203, -0.4350189, -2.079011, 1, 1, 1, 1, 1,
-0.7593031, -0.6313071, -2.858947, 1, 1, 1, 1, 1,
-0.7475232, -0.6756662, -3.71326, 1, 1, 1, 1, 1,
-0.7468009, 0.6117939, 0.9827559, 1, 1, 1, 1, 1,
-0.7453099, -0.3525865, -3.435045, 1, 1, 1, 1, 1,
-0.7361589, 0.1935499, -2.552899, 1, 1, 1, 1, 1,
-0.7292172, 2.015982, 1.24514, 1, 1, 1, 1, 1,
-0.728564, 1.49637, -1.312692, 1, 1, 1, 1, 1,
-0.7282296, 1.294065, -0.05352834, 0, 0, 1, 1, 1,
-0.7278, 0.03866887, -1.704733, 1, 0, 0, 1, 1,
-0.7223118, 0.5485501, 0.7551356, 1, 0, 0, 1, 1,
-0.7204686, -0.07421321, -1.653356, 1, 0, 0, 1, 1,
-0.7199541, 0.9102238, -0.9285991, 1, 0, 0, 1, 1,
-0.7135755, -1.013935, -1.136554, 1, 0, 0, 1, 1,
-0.7105854, -1.227388, -1.945483, 0, 0, 0, 1, 1,
-0.7069325, -1.82705, -2.826025, 0, 0, 0, 1, 1,
-0.6989349, -0.1556395, -1.904762, 0, 0, 0, 1, 1,
-0.6975709, -1.04974, -3.493345, 0, 0, 0, 1, 1,
-0.6968908, 0.3243935, -1.276643, 0, 0, 0, 1, 1,
-0.6960227, 0.6515045, -1.477356, 0, 0, 0, 1, 1,
-0.6856257, -0.2185948, -1.021476, 0, 0, 0, 1, 1,
-0.6826037, -0.70183, -2.17513, 1, 1, 1, 1, 1,
-0.681863, 0.2859008, -1.210354, 1, 1, 1, 1, 1,
-0.6811869, 0.1187385, -1.862846, 1, 1, 1, 1, 1,
-0.6789441, -0.05859121, -0.4329219, 1, 1, 1, 1, 1,
-0.6743753, 0.8188061, -0.09310862, 1, 1, 1, 1, 1,
-0.6728154, 0.258019, -1.383995, 1, 1, 1, 1, 1,
-0.6713724, 1.291706, -2.373572, 1, 1, 1, 1, 1,
-0.665473, 0.5177522, -0.8230253, 1, 1, 1, 1, 1,
-0.6635817, -0.7785406, -1.575959, 1, 1, 1, 1, 1,
-0.6626655, -0.3226322, -0.4977595, 1, 1, 1, 1, 1,
-0.6530616, 1.980634, 1.358114, 1, 1, 1, 1, 1,
-0.6516943, -0.06084504, -2.178861, 1, 1, 1, 1, 1,
-0.6515087, 0.8095123, 0.6762772, 1, 1, 1, 1, 1,
-0.651171, 0.1939409, 0.3399383, 1, 1, 1, 1, 1,
-0.6441776, 0.3482448, -1.865241, 1, 1, 1, 1, 1,
-0.6434491, 0.783544, 0.3842322, 0, 0, 1, 1, 1,
-0.6415071, -0.03263989, -2.377837, 1, 0, 0, 1, 1,
-0.6401603, -0.8545414, -3.28226, 1, 0, 0, 1, 1,
-0.6338562, 0.7659113, 0.6824498, 1, 0, 0, 1, 1,
-0.6327485, 0.8595634, 1.112713, 1, 0, 0, 1, 1,
-0.6266309, -1.292509, -3.632002, 1, 0, 0, 1, 1,
-0.6215446, -0.2574983, -1.796381, 0, 0, 0, 1, 1,
-0.6214349, 2.041634, 0.2523915, 0, 0, 0, 1, 1,
-0.6201608, 0.0880301, -1.931484, 0, 0, 0, 1, 1,
-0.6146813, 0.4815785, -2.344224, 0, 0, 0, 1, 1,
-0.6100633, 0.8946745, 0.2781605, 0, 0, 0, 1, 1,
-0.6086938, 0.5906508, -0.7466091, 0, 0, 0, 1, 1,
-0.6038237, 0.2385216, 0.606794, 0, 0, 0, 1, 1,
-0.6029722, 1.537886, 1.624796, 1, 1, 1, 1, 1,
-0.6013399, -2.299139, -3.221311, 1, 1, 1, 1, 1,
-0.6001154, -0.4418622, -1.784638, 1, 1, 1, 1, 1,
-0.592972, -0.4654241, -1.7285, 1, 1, 1, 1, 1,
-0.5924811, -1.275216, -1.779885, 1, 1, 1, 1, 1,
-0.5920053, 0.9006722, -1.452349, 1, 1, 1, 1, 1,
-0.5912511, -0.4129494, -1.27598, 1, 1, 1, 1, 1,
-0.5910811, 0.2360164, -0.3910771, 1, 1, 1, 1, 1,
-0.5905554, 0.01307707, -0.19466, 1, 1, 1, 1, 1,
-0.5893395, -0.6720893, -2.755178, 1, 1, 1, 1, 1,
-0.5793401, -0.9477431, -2.265851, 1, 1, 1, 1, 1,
-0.5766221, -0.1313761, -0.9521813, 1, 1, 1, 1, 1,
-0.5730391, -1.050334, -2.331935, 1, 1, 1, 1, 1,
-0.5723398, -0.5201824, -1.687128, 1, 1, 1, 1, 1,
-0.5685532, -0.632302, -2.345942, 1, 1, 1, 1, 1,
-0.5644495, -0.6150314, -2.520594, 0, 0, 1, 1, 1,
-0.5640637, -0.5720142, -1.124958, 1, 0, 0, 1, 1,
-0.5625637, -0.1694733, -1.969305, 1, 0, 0, 1, 1,
-0.5624207, 0.4850784, -0.6242625, 1, 0, 0, 1, 1,
-0.5608965, -0.1615389, -3.05699, 1, 0, 0, 1, 1,
-0.5578958, 0.1974087, -1.538859, 1, 0, 0, 1, 1,
-0.5553086, 1.399602, 0.4512659, 0, 0, 0, 1, 1,
-0.555136, 1.432978, 0.8078134, 0, 0, 0, 1, 1,
-0.5533883, -1.034695, -2.612252, 0, 0, 0, 1, 1,
-0.5530683, 1.891125, -0.5728896, 0, 0, 0, 1, 1,
-0.5501065, -0.1014824, -2.295913, 0, 0, 0, 1, 1,
-0.5439035, -0.8505621, -3.878451, 0, 0, 0, 1, 1,
-0.5387885, 1.686711, -0.6804706, 0, 0, 0, 1, 1,
-0.5315538, 0.4978099, -0.07970764, 1, 1, 1, 1, 1,
-0.5303417, 0.5967934, -0.371209, 1, 1, 1, 1, 1,
-0.5272411, 0.2895011, -1.530415, 1, 1, 1, 1, 1,
-0.5258857, -0.4465443, -2.86866, 1, 1, 1, 1, 1,
-0.5227435, 0.219604, 0.6807845, 1, 1, 1, 1, 1,
-0.5190376, -1.318189, -2.437865, 1, 1, 1, 1, 1,
-0.5147201, 2.093586, -0.8679233, 1, 1, 1, 1, 1,
-0.5131755, 0.0913809, -1.511493, 1, 1, 1, 1, 1,
-0.5123538, -0.2470374, -1.315311, 1, 1, 1, 1, 1,
-0.5101358, -1.487563, -4.760511, 1, 1, 1, 1, 1,
-0.5082805, -0.8006005, -2.20877, 1, 1, 1, 1, 1,
-0.5054088, -0.4111135, -2.275298, 1, 1, 1, 1, 1,
-0.5032285, 0.2745472, -0.5870517, 1, 1, 1, 1, 1,
-0.4983107, 0.1833254, -2.760734, 1, 1, 1, 1, 1,
-0.4951351, -0.7947356, -3.378803, 1, 1, 1, 1, 1,
-0.489542, 0.607236, -1.273069, 0, 0, 1, 1, 1,
-0.4839677, 0.5549507, -0.5909227, 1, 0, 0, 1, 1,
-0.4827076, 1.579985, -1.391013, 1, 0, 0, 1, 1,
-0.4725155, -0.4697191, -2.599213, 1, 0, 0, 1, 1,
-0.4660871, 1.026085, -1.331975, 1, 0, 0, 1, 1,
-0.4660724, -1.996642, -0.6170688, 1, 0, 0, 1, 1,
-0.4633483, -0.319337, -2.236019, 0, 0, 0, 1, 1,
-0.4608515, -0.06774992, -2.805905, 0, 0, 0, 1, 1,
-0.4467982, -2.426686, -4.812005, 0, 0, 0, 1, 1,
-0.4461325, 0.290563, -2.677585, 0, 0, 0, 1, 1,
-0.4399436, -0.7587388, -2.892103, 0, 0, 0, 1, 1,
-0.439137, -0.9089736, -1.406083, 0, 0, 0, 1, 1,
-0.4384815, -0.6072907, -1.768094, 0, 0, 0, 1, 1,
-0.4359101, -0.5955691, -3.684356, 1, 1, 1, 1, 1,
-0.4353328, -1.292184, -2.280245, 1, 1, 1, 1, 1,
-0.4314045, 0.2222843, -1.982075, 1, 1, 1, 1, 1,
-0.4164769, -1.128544, -3.311739, 1, 1, 1, 1, 1,
-0.410735, 0.7445009, 0.5895321, 1, 1, 1, 1, 1,
-0.409747, 0.2149866, -0.8477718, 1, 1, 1, 1, 1,
-0.4030187, -0.485196, -1.721652, 1, 1, 1, 1, 1,
-0.4003127, -0.5383483, -2.38284, 1, 1, 1, 1, 1,
-0.3971997, -1.039424, -2.709327, 1, 1, 1, 1, 1,
-0.3971586, 1.591812, -0.6391258, 1, 1, 1, 1, 1,
-0.3943115, 0.5066476, -0.5999541, 1, 1, 1, 1, 1,
-0.3886329, 0.7253607, 1.009014, 1, 1, 1, 1, 1,
-0.3807814, -0.6012424, -2.712939, 1, 1, 1, 1, 1,
-0.3795622, -0.3465292, -3.457898, 1, 1, 1, 1, 1,
-0.3738674, -0.3052712, -2.002962, 1, 1, 1, 1, 1,
-0.3679138, 0.3341985, -1.219422, 0, 0, 1, 1, 1,
-0.3651232, 0.2798581, 0.09916362, 1, 0, 0, 1, 1,
-0.3645593, -0.5577808, -1.685595, 1, 0, 0, 1, 1,
-0.3632739, -0.03960155, -2.999037, 1, 0, 0, 1, 1,
-0.3594329, -0.0441546, -3.069875, 1, 0, 0, 1, 1,
-0.3589611, -0.4191288, -3.034377, 1, 0, 0, 1, 1,
-0.3538611, -1.552252, -2.726794, 0, 0, 0, 1, 1,
-0.3515139, 1.966915, -1.627514, 0, 0, 0, 1, 1,
-0.350078, -1.015317, -1.898722, 0, 0, 0, 1, 1,
-0.3461945, 0.3788151, -1.328259, 0, 0, 0, 1, 1,
-0.3449293, -0.2211541, -1.774827, 0, 0, 0, 1, 1,
-0.3423883, -0.7874345, -3.251245, 0, 0, 0, 1, 1,
-0.3412245, 0.9937586, -0.9411956, 0, 0, 0, 1, 1,
-0.3410878, -0.005941572, -1.166636, 1, 1, 1, 1, 1,
-0.3399282, 0.3251809, 0.8041474, 1, 1, 1, 1, 1,
-0.3332117, 0.7562279, -1.093226, 1, 1, 1, 1, 1,
-0.330458, -1.253719, -1.911271, 1, 1, 1, 1, 1,
-0.3253526, -0.4883951, -3.470192, 1, 1, 1, 1, 1,
-0.3246725, -1.410036, -3.632243, 1, 1, 1, 1, 1,
-0.3206812, -0.3306451, -3.371325, 1, 1, 1, 1, 1,
-0.3206116, 2.608065, -1.074918, 1, 1, 1, 1, 1,
-0.3190876, -0.1456752, -3.100317, 1, 1, 1, 1, 1,
-0.3117602, -0.291122, -1.346491, 1, 1, 1, 1, 1,
-0.3108572, -2.635414, -3.21648, 1, 1, 1, 1, 1,
-0.3106391, 2.356232, -0.6950478, 1, 1, 1, 1, 1,
-0.3023877, 1.082099, 0.8937911, 1, 1, 1, 1, 1,
-0.300153, -0.08453038, -2.76184, 1, 1, 1, 1, 1,
-0.2967905, -0.05881058, -0.8847456, 1, 1, 1, 1, 1,
-0.2939353, 0.8221005, -0.260299, 0, 0, 1, 1, 1,
-0.2907497, -1.807699, -3.148792, 1, 0, 0, 1, 1,
-0.2891098, -0.3292797, -1.786451, 1, 0, 0, 1, 1,
-0.2874145, 0.05631536, -1.891756, 1, 0, 0, 1, 1,
-0.2865153, 0.8907368, -0.8666018, 1, 0, 0, 1, 1,
-0.2826464, -0.0085736, -1.507595, 1, 0, 0, 1, 1,
-0.2813529, 0.5846846, -1.091309, 0, 0, 0, 1, 1,
-0.266118, -1.076006, -4.201457, 0, 0, 0, 1, 1,
-0.2649521, 0.08378083, -1.274122, 0, 0, 0, 1, 1,
-0.2649036, 0.2347371, -0.9081839, 0, 0, 0, 1, 1,
-0.2645054, 0.1432934, -1.410269, 0, 0, 0, 1, 1,
-0.2635125, 1.008518, 0.06861567, 0, 0, 0, 1, 1,
-0.2575212, -0.09275839, -2.523716, 0, 0, 0, 1, 1,
-0.2570932, 1.776833, -0.8897222, 1, 1, 1, 1, 1,
-0.2540342, 0.3019612, -1.723264, 1, 1, 1, 1, 1,
-0.2522012, -1.537044, -3.234619, 1, 1, 1, 1, 1,
-0.2496333, 0.8093314, -0.6106669, 1, 1, 1, 1, 1,
-0.248109, 0.1819381, -1.397745, 1, 1, 1, 1, 1,
-0.239166, -0.4489064, -1.648592, 1, 1, 1, 1, 1,
-0.2387895, -1.07656, -3.057425, 1, 1, 1, 1, 1,
-0.2358548, 0.6466693, -1.053691, 1, 1, 1, 1, 1,
-0.2324943, 1.002824, -0.2436054, 1, 1, 1, 1, 1,
-0.2324368, 0.7622735, -0.2541884, 1, 1, 1, 1, 1,
-0.2317377, -0.729336, -2.007929, 1, 1, 1, 1, 1,
-0.2307375, 2.053698, -1.552749, 1, 1, 1, 1, 1,
-0.2302552, 1.342942, 0.296109, 1, 1, 1, 1, 1,
-0.229176, 0.794386, -0.4935616, 1, 1, 1, 1, 1,
-0.2270265, 0.8086298, -1.187052, 1, 1, 1, 1, 1,
-0.215852, 0.3534583, -2.331636, 0, 0, 1, 1, 1,
-0.2098115, 0.3375393, -0.5663252, 1, 0, 0, 1, 1,
-0.2043241, 1.540286, -1.168762, 1, 0, 0, 1, 1,
-0.2012465, 1.737469, -0.1881855, 1, 0, 0, 1, 1,
-0.1997594, -1.865858, -3.47256, 1, 0, 0, 1, 1,
-0.1989845, -0.5520933, -3.193813, 1, 0, 0, 1, 1,
-0.1956733, -0.8145273, -3.211814, 0, 0, 0, 1, 1,
-0.1910082, 0.9464548, -0.8328333, 0, 0, 0, 1, 1,
-0.1872413, 1.456247, 0.04968335, 0, 0, 0, 1, 1,
-0.1820308, -1.537024, -3.12636, 0, 0, 0, 1, 1,
-0.1806054, -0.03657096, -1.700693, 0, 0, 0, 1, 1,
-0.1796174, 0.007642378, -0.06573791, 0, 0, 0, 1, 1,
-0.1703135, 0.6967332, -0.4509032, 0, 0, 0, 1, 1,
-0.1690677, 0.1777524, -0.5790852, 1, 1, 1, 1, 1,
-0.165422, 0.3052915, -3.346692, 1, 1, 1, 1, 1,
-0.1648503, -1.908621, -2.363635, 1, 1, 1, 1, 1,
-0.1635731, 0.2367148, 1.046583, 1, 1, 1, 1, 1,
-0.1603484, -1.455999, -3.872199, 1, 1, 1, 1, 1,
-0.1603141, 1.518448, -2.051733, 1, 1, 1, 1, 1,
-0.1602484, -0.1947619, -2.392187, 1, 1, 1, 1, 1,
-0.1573342, -0.4594755, -4.794051, 1, 1, 1, 1, 1,
-0.1545347, -0.1427016, -1.72987, 1, 1, 1, 1, 1,
-0.151876, -0.7295141, -4.083524, 1, 1, 1, 1, 1,
-0.1510797, -0.01658511, -1.387999, 1, 1, 1, 1, 1,
-0.1505164, -1.084152, -3.792942, 1, 1, 1, 1, 1,
-0.1504432, 1.395339, -0.4266256, 1, 1, 1, 1, 1,
-0.1473873, -1.751339, -3.982599, 1, 1, 1, 1, 1,
-0.1464314, 0.2832649, -1.611524, 1, 1, 1, 1, 1,
-0.144838, 0.3704737, -1.042036, 0, 0, 1, 1, 1,
-0.1441001, -0.9876684, -4.158674, 1, 0, 0, 1, 1,
-0.1437849, 0.1666195, -0.5843909, 1, 0, 0, 1, 1,
-0.1393767, 0.9442818, -1.411693, 1, 0, 0, 1, 1,
-0.137242, 0.7728878, -1.279859, 1, 0, 0, 1, 1,
-0.1367414, 0.9347393, 0.524599, 1, 0, 0, 1, 1,
-0.1359361, 0.7544354, 1.055794, 0, 0, 0, 1, 1,
-0.1347794, -1.262658, -3.480943, 0, 0, 0, 1, 1,
-0.1307218, 0.112161, -1.573149, 0, 0, 0, 1, 1,
-0.1284382, 0.7556551, -0.9081993, 0, 0, 0, 1, 1,
-0.1281772, 0.317349, -0.6283675, 0, 0, 0, 1, 1,
-0.1229796, -0.0588746, -1.55427, 0, 0, 0, 1, 1,
-0.1185407, 1.137622, -0.3637037, 0, 0, 0, 1, 1,
-0.115083, -0.4201606, -4.234118, 1, 1, 1, 1, 1,
-0.1137621, 0.5247869, -1.38949, 1, 1, 1, 1, 1,
-0.1120574, -0.1703536, -2.826671, 1, 1, 1, 1, 1,
-0.09965435, -0.2580913, -2.034042, 1, 1, 1, 1, 1,
-0.0996348, -2.514853, -3.226388, 1, 1, 1, 1, 1,
-0.09851651, 0.4539429, 0.1577738, 1, 1, 1, 1, 1,
-0.09739679, -0.8114413, -2.765524, 1, 1, 1, 1, 1,
-0.09266338, 1.338828, 1.069339, 1, 1, 1, 1, 1,
-0.09124727, -0.7392576, -2.890352, 1, 1, 1, 1, 1,
-0.08937471, 0.5431619, 1.64211, 1, 1, 1, 1, 1,
-0.0857355, 0.5475924, 1.658894, 1, 1, 1, 1, 1,
-0.08400445, -1.20465, -3.989371, 1, 1, 1, 1, 1,
-0.07729129, -0.5443811, -3.587705, 1, 1, 1, 1, 1,
-0.07428222, 0.07490776, -0.2227243, 1, 1, 1, 1, 1,
-0.07359477, -0.5418026, -1.774156, 1, 1, 1, 1, 1,
-0.07038258, -2.463628, -1.864455, 0, 0, 1, 1, 1,
-0.07013035, 0.1851004, -1.078806, 1, 0, 0, 1, 1,
-0.06542367, -0.4148935, -2.085878, 1, 0, 0, 1, 1,
-0.06406408, 0.2840286, 0.9339119, 1, 0, 0, 1, 1,
-0.06213494, 1.213168, -0.7563487, 1, 0, 0, 1, 1,
-0.06129679, -1.164535, -4.133337, 1, 0, 0, 1, 1,
-0.06072105, -0.9463562, -3.253079, 0, 0, 0, 1, 1,
-0.05608959, 2.36676, -1.071787, 0, 0, 0, 1, 1,
-0.05454584, 0.05215558, -2.595966, 0, 0, 0, 1, 1,
-0.05446455, -0.630716, -2.383637, 0, 0, 0, 1, 1,
-0.05413742, -0.8698309, -3.30295, 0, 0, 0, 1, 1,
-0.05358088, 0.9835728, -1.192825, 0, 0, 0, 1, 1,
-0.05025692, -0.930292, -3.634554, 0, 0, 0, 1, 1,
-0.04327606, -0.08133534, -2.262068, 1, 1, 1, 1, 1,
-0.04260129, -0.8644428, -4.290092, 1, 1, 1, 1, 1,
-0.03244367, 0.4073973, -0.2045531, 1, 1, 1, 1, 1,
-0.03052815, -0.9636235, -2.280643, 1, 1, 1, 1, 1,
-0.03049232, 1.568439, -0.1976784, 1, 1, 1, 1, 1,
-0.02959995, -0.6844451, -2.603347, 1, 1, 1, 1, 1,
-0.02797232, -0.8222891, -3.917225, 1, 1, 1, 1, 1,
-0.02601613, 1.089187, 0.08219849, 1, 1, 1, 1, 1,
-0.02596715, -2.014394, -3.694323, 1, 1, 1, 1, 1,
-0.02235007, -0.06780496, -4.083175, 1, 1, 1, 1, 1,
-0.01784364, 0.7718892, -0.5013911, 1, 1, 1, 1, 1,
-0.01645027, -0.1392485, -3.333619, 1, 1, 1, 1, 1,
-0.0160754, 0.7402678, 1.082812, 1, 1, 1, 1, 1,
-0.01173944, -0.4804401, -4.173324, 1, 1, 1, 1, 1,
-0.01165749, 0.151441, 0.4424703, 1, 1, 1, 1, 1,
-0.01001347, 2.133551, -0.3211691, 0, 0, 1, 1, 1,
-0.008373001, 0.6562512, 2.060219, 1, 0, 0, 1, 1,
-0.006083726, -1.335631, -4.566755, 1, 0, 0, 1, 1,
0.001789782, -0.3925124, 4.178387, 1, 0, 0, 1, 1,
0.002102765, -0.4575207, 3.120323, 1, 0, 0, 1, 1,
0.009996086, -0.9810206, 2.059299, 1, 0, 0, 1, 1,
0.0124814, -1.438348, 2.821655, 0, 0, 0, 1, 1,
0.01421175, 2.056177, -0.4326938, 0, 0, 0, 1, 1,
0.01423557, -0.572542, 1.580708, 0, 0, 0, 1, 1,
0.01705674, -0.1534981, 2.572135, 0, 0, 0, 1, 1,
0.01861297, 0.9938192, -1.555549, 0, 0, 0, 1, 1,
0.01875199, 1.058771, -2.189303, 0, 0, 0, 1, 1,
0.02135422, 0.2721523, 0.6611699, 0, 0, 0, 1, 1,
0.02220073, -0.6795363, 2.815588, 1, 1, 1, 1, 1,
0.02410492, 0.2294974, -0.6124354, 1, 1, 1, 1, 1,
0.02579972, 1.512023, -1.06642, 1, 1, 1, 1, 1,
0.0261411, -0.4826076, 3.356771, 1, 1, 1, 1, 1,
0.02669, 0.3431109, 0.5354981, 1, 1, 1, 1, 1,
0.03304157, -0.984905, 3.599673, 1, 1, 1, 1, 1,
0.03370169, -1.508132, 2.442522, 1, 1, 1, 1, 1,
0.04294024, 0.2375443, 0.5509111, 1, 1, 1, 1, 1,
0.04628655, 0.3594536, 2.082888, 1, 1, 1, 1, 1,
0.05682065, -2.581708, 3.118588, 1, 1, 1, 1, 1,
0.05975655, 1.35509, 0.5106186, 1, 1, 1, 1, 1,
0.06315161, -1.932878, 2.515919, 1, 1, 1, 1, 1,
0.06412515, 0.5309377, -0.2594532, 1, 1, 1, 1, 1,
0.06592759, 0.09849375, 0.8749063, 1, 1, 1, 1, 1,
0.06596788, -0.1992483, 4.768749, 1, 1, 1, 1, 1,
0.07628403, -0.2089837, 3.050801, 0, 0, 1, 1, 1,
0.07762261, -0.2575217, 4.187457, 1, 0, 0, 1, 1,
0.07835406, 1.175697, -0.910294, 1, 0, 0, 1, 1,
0.08371235, 0.7844334, 1.73542, 1, 0, 0, 1, 1,
0.08380804, -1.645942, 1.10216, 1, 0, 0, 1, 1,
0.09526851, 0.5830471, -1.001674, 1, 0, 0, 1, 1,
0.1054698, 0.2387178, -1.432692, 0, 0, 0, 1, 1,
0.106281, 0.5975786, -0.9037299, 0, 0, 0, 1, 1,
0.1100721, -1.911529, 1.276874, 0, 0, 0, 1, 1,
0.1148924, 0.2609968, 1.043664, 0, 0, 0, 1, 1,
0.1157117, 1.80973, 1.06002, 0, 0, 0, 1, 1,
0.1159245, -0.1721811, 2.287555, 0, 0, 0, 1, 1,
0.1164566, 1.163239, 0.009821671, 0, 0, 0, 1, 1,
0.1186172, 0.02678693, 2.055482, 1, 1, 1, 1, 1,
0.1205042, 0.4201526, 1.423684, 1, 1, 1, 1, 1,
0.124609, 1.9524, -0.3138736, 1, 1, 1, 1, 1,
0.1308988, -0.2771205, 3.921283, 1, 1, 1, 1, 1,
0.1390203, 1.976267, -0.2641036, 1, 1, 1, 1, 1,
0.1392457, -0.04553423, 1.532446, 1, 1, 1, 1, 1,
0.1411613, -0.6871742, 1.503438, 1, 1, 1, 1, 1,
0.1420613, -0.4549254, 2.381325, 1, 1, 1, 1, 1,
0.1441445, 0.7287052, -0.02456795, 1, 1, 1, 1, 1,
0.144383, -0.1489447, 1.785641, 1, 1, 1, 1, 1,
0.1452992, 0.2728854, 2.657908, 1, 1, 1, 1, 1,
0.1530818, 0.7420631, -2.045878, 1, 1, 1, 1, 1,
0.1601768, -0.490016, 3.345456, 1, 1, 1, 1, 1,
0.165757, -1.201562, 1.256091, 1, 1, 1, 1, 1,
0.1666992, 0.7877099, -2.375855, 1, 1, 1, 1, 1,
0.1697876, 0.07336994, 1.541732, 0, 0, 1, 1, 1,
0.1721659, 0.4426156, -0.3822937, 1, 0, 0, 1, 1,
0.1723093, 1.322897, -1.936984, 1, 0, 0, 1, 1,
0.1761393, 0.8565398, 0.2016563, 1, 0, 0, 1, 1,
0.1777431, 0.1453623, 1.800801, 1, 0, 0, 1, 1,
0.1806646, 2.156749, 0.186228, 1, 0, 0, 1, 1,
0.1818904, -0.06674122, 1.948062, 0, 0, 0, 1, 1,
0.1831396, 0.9863587, 0.7802194, 0, 0, 0, 1, 1,
0.1865121, -0.2429376, 2.796263, 0, 0, 0, 1, 1,
0.195655, -0.06488122, 1.062263, 0, 0, 0, 1, 1,
0.1963679, 2.266072, -0.4307286, 0, 0, 0, 1, 1,
0.1996162, 0.1271218, 0.6188965, 0, 0, 0, 1, 1,
0.2011493, 0.1518262, 1.33047, 0, 0, 0, 1, 1,
0.2019469, -0.4741004, 3.368226, 1, 1, 1, 1, 1,
0.2020218, -0.8019682, 3.487562, 1, 1, 1, 1, 1,
0.202589, 2.533852, -1.217857, 1, 1, 1, 1, 1,
0.2036044, 0.5745714, -2.300684, 1, 1, 1, 1, 1,
0.2037503, -0.5974772, 3.006653, 1, 1, 1, 1, 1,
0.2041931, 0.07490355, 0.398592, 1, 1, 1, 1, 1,
0.2116462, 0.7121475, -0.07341461, 1, 1, 1, 1, 1,
0.2125824, 0.1679471, 0.6227525, 1, 1, 1, 1, 1,
0.2128543, 0.6601049, 0.2115504, 1, 1, 1, 1, 1,
0.2131222, -0.6640046, 3.641061, 1, 1, 1, 1, 1,
0.2139243, -0.1272653, 2.895642, 1, 1, 1, 1, 1,
0.2154972, 0.01092417, 1.359423, 1, 1, 1, 1, 1,
0.2164362, 0.790284, 0.9847947, 1, 1, 1, 1, 1,
0.2195635, 0.3484332, 0.8794627, 1, 1, 1, 1, 1,
0.2260289, 0.3501446, 0.2296898, 1, 1, 1, 1, 1,
0.228111, 1.442806, -0.4635028, 0, 0, 1, 1, 1,
0.2297375, 0.06584608, 0.5440629, 1, 0, 0, 1, 1,
0.2299496, 1.042509, 2.047425, 1, 0, 0, 1, 1,
0.2386595, 0.4708542, 0.7182578, 1, 0, 0, 1, 1,
0.2474596, -0.04330214, 0.3691611, 1, 0, 0, 1, 1,
0.2544353, 1.031633, 2.31679, 1, 0, 0, 1, 1,
0.2556972, 1.501835, -0.7935194, 0, 0, 0, 1, 1,
0.2558211, -0.5919642, 1.44576, 0, 0, 0, 1, 1,
0.2558551, 0.7096093, -0.1500482, 0, 0, 0, 1, 1,
0.2599766, -0.4051533, 2.795091, 0, 0, 0, 1, 1,
0.2625208, 1.332776, 0.0409856, 0, 0, 0, 1, 1,
0.2634243, -1.659057, 2.078442, 0, 0, 0, 1, 1,
0.2641143, -1.598094, 2.711482, 0, 0, 0, 1, 1,
0.2672037, -0.4844697, 0.9349989, 1, 1, 1, 1, 1,
0.2702365, 0.262327, 0.8163124, 1, 1, 1, 1, 1,
0.2703374, 1.366603, 1.653883, 1, 1, 1, 1, 1,
0.283363, 1.918979, -1.111501, 1, 1, 1, 1, 1,
0.2929977, -2.16849, 4.087827, 1, 1, 1, 1, 1,
0.2937055, 0.2021617, 0.9268536, 1, 1, 1, 1, 1,
0.2944683, -0.5781137, 2.883887, 1, 1, 1, 1, 1,
0.2955486, 0.25436, 1.139674, 1, 1, 1, 1, 1,
0.2967471, -0.3608858, -0.2221634, 1, 1, 1, 1, 1,
0.2979206, -1.040669, 3.406637, 1, 1, 1, 1, 1,
0.2998723, 1.232841, -1.41159, 1, 1, 1, 1, 1,
0.3005067, 0.1367652, 3.669602, 1, 1, 1, 1, 1,
0.3009924, -0.7726002, 2.083879, 1, 1, 1, 1, 1,
0.3043032, -1.443876, 3.440902, 1, 1, 1, 1, 1,
0.3057491, 1.297739, -0.4914199, 1, 1, 1, 1, 1,
0.3063265, 0.3233136, 0.1005758, 0, 0, 1, 1, 1,
0.3078193, 0.3706355, -0.437346, 1, 0, 0, 1, 1,
0.308157, -1.450249, 2.562635, 1, 0, 0, 1, 1,
0.3112998, -0.2439909, 1.304481, 1, 0, 0, 1, 1,
0.3116823, 0.2838551, 1.069719, 1, 0, 0, 1, 1,
0.3178222, 0.1178049, 1.20947, 1, 0, 0, 1, 1,
0.3185024, -0.2669777, 2.626832, 0, 0, 0, 1, 1,
0.3189532, 1.719397, -0.1910668, 0, 0, 0, 1, 1,
0.3203436, 0.1262885, 0.2304712, 0, 0, 0, 1, 1,
0.3207068, -0.6210563, 0.2366948, 0, 0, 0, 1, 1,
0.3247561, 0.7341444, 1.701812, 0, 0, 0, 1, 1,
0.3257017, 0.6143304, 2.447283, 0, 0, 0, 1, 1,
0.3328488, -0.4664797, 2.963625, 0, 0, 0, 1, 1,
0.3344727, -1.541372, 3.87874, 1, 1, 1, 1, 1,
0.335525, 0.5704628, -0.1816749, 1, 1, 1, 1, 1,
0.3359681, -2.203525, 3.809025, 1, 1, 1, 1, 1,
0.342384, 0.4131167, 0.4518617, 1, 1, 1, 1, 1,
0.343107, 0.8964032, 0.61746, 1, 1, 1, 1, 1,
0.3446496, 0.1514876, 2.207714, 1, 1, 1, 1, 1,
0.3499998, 1.734686, 0.8245739, 1, 1, 1, 1, 1,
0.3556174, -0.794532, 2.598612, 1, 1, 1, 1, 1,
0.3570817, 1.174645, 1.816415, 1, 1, 1, 1, 1,
0.3572007, -0.6519529, 0.4104974, 1, 1, 1, 1, 1,
0.3595776, 0.3409089, 1.456998, 1, 1, 1, 1, 1,
0.3622339, -1.314688, 3.015414, 1, 1, 1, 1, 1,
0.3631957, -0.4535562, 1.76865, 1, 1, 1, 1, 1,
0.3655163, 2.094083, 0.8959841, 1, 1, 1, 1, 1,
0.3681213, -0.5704206, 2.400914, 1, 1, 1, 1, 1,
0.3715881, -0.1354651, 1.534715, 0, 0, 1, 1, 1,
0.3725052, 1.414339, 2.065986, 1, 0, 0, 1, 1,
0.3726651, -0.07508524, 2.121171, 1, 0, 0, 1, 1,
0.3768441, -0.7563389, 3.400777, 1, 0, 0, 1, 1,
0.3825615, 8.686605e-05, 2.975985, 1, 0, 0, 1, 1,
0.3845699, 0.685908, -1.068324, 1, 0, 0, 1, 1,
0.3847824, 2.16703, -0.7349246, 0, 0, 0, 1, 1,
0.3857133, -0.2924866, 0.987305, 0, 0, 0, 1, 1,
0.3875732, 0.03204237, 1.840661, 0, 0, 0, 1, 1,
0.3880322, -0.8184821, 1.894451, 0, 0, 0, 1, 1,
0.3905325, -0.2167588, 2.818399, 0, 0, 0, 1, 1,
0.3944622, 0.6542652, -0.4944566, 0, 0, 0, 1, 1,
0.3965749, -0.5251788, 3.598423, 0, 0, 0, 1, 1,
0.3989273, -0.83995, 1.943875, 1, 1, 1, 1, 1,
0.4004534, 0.07816379, 1.64433, 1, 1, 1, 1, 1,
0.4061289, 0.1957249, 0.407832, 1, 1, 1, 1, 1,
0.4090626, -0.8383388, 1.726602, 1, 1, 1, 1, 1,
0.4104652, 0.03794786, 2.189767, 1, 1, 1, 1, 1,
0.4117059, -0.6117402, 3.611087, 1, 1, 1, 1, 1,
0.4137535, 0.7949779, -1.354649, 1, 1, 1, 1, 1,
0.4152701, 0.2376709, 0.9813927, 1, 1, 1, 1, 1,
0.4178843, 0.585372, 1.482076, 1, 1, 1, 1, 1,
0.419087, -0.1739907, 4.137545, 1, 1, 1, 1, 1,
0.4422427, 1.746093, 0.987984, 1, 1, 1, 1, 1,
0.4440711, -0.1739442, 0.3226515, 1, 1, 1, 1, 1,
0.4451959, -0.4404621, 2.163909, 1, 1, 1, 1, 1,
0.4454419, 1.4031, -0.3274432, 1, 1, 1, 1, 1,
0.447263, 0.03416223, 0.3420193, 1, 1, 1, 1, 1,
0.4522646, 1.228891, 0.2590648, 0, 0, 1, 1, 1,
0.4527493, 0.188073, 1.479829, 1, 0, 0, 1, 1,
0.4537843, 0.5717177, -0.2705663, 1, 0, 0, 1, 1,
0.4675203, -0.6200934, 2.441944, 1, 0, 0, 1, 1,
0.4698186, -1.386482, 2.497369, 1, 0, 0, 1, 1,
0.4723995, 0.237207, 1.773226, 1, 0, 0, 1, 1,
0.4739566, 0.1673147, -0.04960978, 0, 0, 0, 1, 1,
0.47506, -0.5773121, 3.707747, 0, 0, 0, 1, 1,
0.4757092, 1.474294, -0.3227278, 0, 0, 0, 1, 1,
0.476177, -0.5055369, 2.028332, 0, 0, 0, 1, 1,
0.4779079, -0.5165246, 3.783264, 0, 0, 0, 1, 1,
0.4828716, 0.2064709, 0.2204884, 0, 0, 0, 1, 1,
0.484524, -0.6337852, 1.742181, 0, 0, 0, 1, 1,
0.4863431, -0.4127901, 1.567065, 1, 1, 1, 1, 1,
0.4867057, 1.915177, 1.468533, 1, 1, 1, 1, 1,
0.4868215, -0.1811807, 1.661764, 1, 1, 1, 1, 1,
0.4880346, 0.7913185, -0.4726766, 1, 1, 1, 1, 1,
0.4921086, 0.0667687, 1.675054, 1, 1, 1, 1, 1,
0.4922322, 0.7450437, 0.8369268, 1, 1, 1, 1, 1,
0.4925269, 0.5438221, -0.1463652, 1, 1, 1, 1, 1,
0.4953023, 0.04912851, 1.13786, 1, 1, 1, 1, 1,
0.4980795, -0.9923927, 2.470543, 1, 1, 1, 1, 1,
0.4991868, 0.548121, 0.03192057, 1, 1, 1, 1, 1,
0.5085531, -1.684732, 2.560361, 1, 1, 1, 1, 1,
0.511465, -1.823645, 2.965576, 1, 1, 1, 1, 1,
0.5132612, -1.024363, 2.714756, 1, 1, 1, 1, 1,
0.5218203, -0.133194, 0.2246201, 1, 1, 1, 1, 1,
0.5230021, -0.8524833, 2.689873, 1, 1, 1, 1, 1,
0.5249188, -0.4160075, 1.990703, 0, 0, 1, 1, 1,
0.5256885, -0.9457608, 2.545723, 1, 0, 0, 1, 1,
0.5267592, 0.6882185, 0.62932, 1, 0, 0, 1, 1,
0.5275971, 0.4635387, 0.4442245, 1, 0, 0, 1, 1,
0.5286219, -0.1019833, -0.3374161, 1, 0, 0, 1, 1,
0.530164, 0.3833622, -0.1561961, 1, 0, 0, 1, 1,
0.53064, 1.189837, 1.610693, 0, 0, 0, 1, 1,
0.5308003, 1.50244, 0.8093073, 0, 0, 0, 1, 1,
0.5334355, -1.18149, 0.7159275, 0, 0, 0, 1, 1,
0.5450237, -0.9710103, 2.625657, 0, 0, 0, 1, 1,
0.5476128, -1.146318, 0.8007129, 0, 0, 0, 1, 1,
0.5507625, 0.7763244, 0.1986996, 0, 0, 0, 1, 1,
0.5518101, 0.6368952, -0.4944415, 0, 0, 0, 1, 1,
0.5519613, -0.2175343, 1.161824, 1, 1, 1, 1, 1,
0.5525898, -0.07499494, 0.9470973, 1, 1, 1, 1, 1,
0.5562014, 0.3671873, 1.099372, 1, 1, 1, 1, 1,
0.5616406, -0.02244677, 1.085651, 1, 1, 1, 1, 1,
0.5659286, -0.1256799, 2.097904, 1, 1, 1, 1, 1,
0.5675069, 1.041755, 0.3185764, 1, 1, 1, 1, 1,
0.5750197, -0.9327253, 2.004552, 1, 1, 1, 1, 1,
0.5752781, -0.2204262, 2.103543, 1, 1, 1, 1, 1,
0.5757447, 0.568231, 0.2564734, 1, 1, 1, 1, 1,
0.5786463, -0.4866213, 2.147519, 1, 1, 1, 1, 1,
0.5866556, -0.7081585, 0.6748599, 1, 1, 1, 1, 1,
0.5880094, -1.05018, 3.388295, 1, 1, 1, 1, 1,
0.5903582, 1.17598, 0.9091794, 1, 1, 1, 1, 1,
0.5974914, -1.079659, 3.284889, 1, 1, 1, 1, 1,
0.6063774, 0.8042704, 0.2892014, 1, 1, 1, 1, 1,
0.6096234, -0.5077814, 1.697815, 0, 0, 1, 1, 1,
0.6115004, 0.1229232, 0.5672688, 1, 0, 0, 1, 1,
0.6182852, 1.261944, 0.7861474, 1, 0, 0, 1, 1,
0.6206104, 2.016831, -0.5659645, 1, 0, 0, 1, 1,
0.6207615, -1.422378, 5.133043, 1, 0, 0, 1, 1,
0.6237976, 0.9285275, 1.291002, 1, 0, 0, 1, 1,
0.6248848, -1.39747, 2.009468, 0, 0, 0, 1, 1,
0.6263577, 0.05329143, 2.474187, 0, 0, 0, 1, 1,
0.6266941, 0.9671531, 0.8799488, 0, 0, 0, 1, 1,
0.6280997, -0.58999, 2.247317, 0, 0, 0, 1, 1,
0.6281943, -0.500419, 1.771917, 0, 0, 0, 1, 1,
0.6297209, -1.347738, 2.342622, 0, 0, 0, 1, 1,
0.6320929, 0.01203423, 0.7806127, 0, 0, 0, 1, 1,
0.6354454, -0.9318083, 1.657412, 1, 1, 1, 1, 1,
0.6355632, 0.5234786, 1.661494, 1, 1, 1, 1, 1,
0.6364641, 1.047612, 1.252619, 1, 1, 1, 1, 1,
0.6377, 0.1938043, 1.055055, 1, 1, 1, 1, 1,
0.6405763, 0.254591, 1.31929, 1, 1, 1, 1, 1,
0.6434274, 0.1984124, 0.2181922, 1, 1, 1, 1, 1,
0.6480599, 1.398987, -0.02733283, 1, 1, 1, 1, 1,
0.6495338, -1.176313, 3.766062, 1, 1, 1, 1, 1,
0.6495941, -1.227358, 2.476858, 1, 1, 1, 1, 1,
0.6525521, 0.7756569, -0.2161425, 1, 1, 1, 1, 1,
0.6532143, -0.009578356, 2.30846, 1, 1, 1, 1, 1,
0.6533878, -0.9029746, 0.3416274, 1, 1, 1, 1, 1,
0.653477, -0.4953464, 3.468338, 1, 1, 1, 1, 1,
0.6550399, -0.22483, 4.135803, 1, 1, 1, 1, 1,
0.6571246, 0.5505996, 0.4225865, 1, 1, 1, 1, 1,
0.6571631, -0.10616, 1.490229, 0, 0, 1, 1, 1,
0.6573192, 0.5737258, 0.7551836, 1, 0, 0, 1, 1,
0.6590988, -1.398352, 2.603614, 1, 0, 0, 1, 1,
0.659458, 0.8427157, 0.9929181, 1, 0, 0, 1, 1,
0.6616741, 1.796752, 0.350927, 1, 0, 0, 1, 1,
0.6720424, -0.2984058, -0.0954251, 1, 0, 0, 1, 1,
0.6729041, -0.1692627, 2.494318, 0, 0, 0, 1, 1,
0.6735027, -0.5410672, 2.475, 0, 0, 0, 1, 1,
0.6738848, 0.7616647, 0.2801069, 0, 0, 0, 1, 1,
0.6751832, 2.527864, 0.3157968, 0, 0, 0, 1, 1,
0.6763953, -1.30309, 2.148869, 0, 0, 0, 1, 1,
0.6789474, 1.947064, 0.1479357, 0, 0, 0, 1, 1,
0.6798118, -0.366604, 2.385551, 0, 0, 0, 1, 1,
0.6807777, -0.9020425, 3.234444, 1, 1, 1, 1, 1,
0.6813874, -1.292543, 4.5796, 1, 1, 1, 1, 1,
0.6834649, -1.226409, 1.484027, 1, 1, 1, 1, 1,
0.6849108, -1.06087, 1.048152, 1, 1, 1, 1, 1,
0.6866883, 0.9858999, 0.3696367, 1, 1, 1, 1, 1,
0.6867532, 0.5420862, 0.8812554, 1, 1, 1, 1, 1,
0.6929376, -1.17193, 1.122108, 1, 1, 1, 1, 1,
0.7003787, -1.521029, 1.779927, 1, 1, 1, 1, 1,
0.7035353, 1.410555, 0.3822329, 1, 1, 1, 1, 1,
0.7054701, -0.4001047, 1.582116, 1, 1, 1, 1, 1,
0.7062104, -0.3784402, 2.92866, 1, 1, 1, 1, 1,
0.7131684, 0.3242623, -0.3331695, 1, 1, 1, 1, 1,
0.7150456, 0.2137209, 0.2385864, 1, 1, 1, 1, 1,
0.7213174, 0.3427788, 1.822625, 1, 1, 1, 1, 1,
0.7351776, 0.8940923, 1.007665, 1, 1, 1, 1, 1,
0.7407947, -0.6637132, 1.87248, 0, 0, 1, 1, 1,
0.7458079, 0.2217846, -0.2985883, 1, 0, 0, 1, 1,
0.7464542, 1.517563, 0.5210565, 1, 0, 0, 1, 1,
0.753444, -0.470797, 2.531356, 1, 0, 0, 1, 1,
0.7647653, 0.1937379, 1.313999, 1, 0, 0, 1, 1,
0.7648945, 0.2375976, 0.9477426, 1, 0, 0, 1, 1,
0.765171, 1.956775, 2.495982, 0, 0, 0, 1, 1,
0.7653295, -0.993269, 4.015373, 0, 0, 0, 1, 1,
0.7699547, -1.143478, 4.048221, 0, 0, 0, 1, 1,
0.770491, 0.1580516, 1.000089, 0, 0, 0, 1, 1,
0.7850499, -0.4138781, 3.991588, 0, 0, 0, 1, 1,
0.7861853, 0.900786, 1.701686, 0, 0, 0, 1, 1,
0.7907583, 0.3214119, 1.665244, 0, 0, 0, 1, 1,
0.7982006, 0.6347403, 2.919813, 1, 1, 1, 1, 1,
0.8109946, 1.264198, -0.02221657, 1, 1, 1, 1, 1,
0.8207826, 0.3852394, 1.763284, 1, 1, 1, 1, 1,
0.8214375, -0.5588312, 1.775947, 1, 1, 1, 1, 1,
0.8219265, 0.7088145, -1.067882, 1, 1, 1, 1, 1,
0.8242806, 0.8809212, 1.429874, 1, 1, 1, 1, 1,
0.8264285, -1.185896, 2.115266, 1, 1, 1, 1, 1,
0.8271708, -0.855767, 4.315979, 1, 1, 1, 1, 1,
0.8277062, 0.599221, 2.016585, 1, 1, 1, 1, 1,
0.8300393, 0.7814764, 0.5464292, 1, 1, 1, 1, 1,
0.8306853, -0.6003392, 2.227331, 1, 1, 1, 1, 1,
0.8376949, -1.376055, 2.313231, 1, 1, 1, 1, 1,
0.8394388, 1.165829, 0.985441, 1, 1, 1, 1, 1,
0.8429772, 0.8148205, 0.3077501, 1, 1, 1, 1, 1,
0.8433506, 0.2609391, -0.1319474, 1, 1, 1, 1, 1,
0.8440874, -0.2683259, 2.417362, 0, 0, 1, 1, 1,
0.8461673, -0.7260196, 0.554046, 1, 0, 0, 1, 1,
0.84787, 1.62406, 0.3449873, 1, 0, 0, 1, 1,
0.8504912, 0.8220332, -0.8900137, 1, 0, 0, 1, 1,
0.8532136, 0.8450827, 0.331492, 1, 0, 0, 1, 1,
0.8547266, 2.297153, 0.790791, 1, 0, 0, 1, 1,
0.8626256, 1.131821, 3.310145, 0, 0, 0, 1, 1,
0.8631025, -1.912338, 3.555094, 0, 0, 0, 1, 1,
0.8631164, -1.938309, 2.340091, 0, 0, 0, 1, 1,
0.8676262, 0.03320219, 2.28763, 0, 0, 0, 1, 1,
0.8685825, 0.4293828, -0.0311225, 0, 0, 0, 1, 1,
0.8736125, 1.192869, 1.050279, 0, 0, 0, 1, 1,
0.8749838, -0.428123, 3.822837, 0, 0, 0, 1, 1,
0.8764074, -0.07049897, 1.171083, 1, 1, 1, 1, 1,
0.8785176, -0.09462381, 1.085399, 1, 1, 1, 1, 1,
0.8816127, -0.03030662, 0.8185211, 1, 1, 1, 1, 1,
0.8823091, -0.2330325, -0.01276159, 1, 1, 1, 1, 1,
0.8843188, -0.5480654, 1.350786, 1, 1, 1, 1, 1,
0.885764, -1.628734, 2.115455, 1, 1, 1, 1, 1,
0.8861074, 0.4595258, 1.817464, 1, 1, 1, 1, 1,
0.9030322, 0.07308757, 0.8288019, 1, 1, 1, 1, 1,
0.9116132, 0.8267942, 0.239773, 1, 1, 1, 1, 1,
0.9181256, 0.4567308, 1.155681, 1, 1, 1, 1, 1,
0.9212909, -0.3477033, 1.109701, 1, 1, 1, 1, 1,
0.9230887, 0.3268128, 1.720606, 1, 1, 1, 1, 1,
0.9327248, -2.05547, 2.556186, 1, 1, 1, 1, 1,
0.9329774, 0.9340152, 1.023806, 1, 1, 1, 1, 1,
0.938548, -0.6518137, 3.314366, 1, 1, 1, 1, 1,
0.9461274, 2.054959, -2.226809, 0, 0, 1, 1, 1,
0.9466743, 1.625131, -0.262392, 1, 0, 0, 1, 1,
0.9470308, 0.5220346, 1.168549, 1, 0, 0, 1, 1,
0.9483599, 1.537963, 1.462781, 1, 0, 0, 1, 1,
0.9485596, 1.748908, 0.4275245, 1, 0, 0, 1, 1,
0.9548305, 1.198724, 0.9401197, 1, 0, 0, 1, 1,
0.955215, -0.05344421, 1.937193, 0, 0, 0, 1, 1,
0.9554027, 0.6187938, 0.8846708, 0, 0, 0, 1, 1,
0.9595479, 0.2158832, 0.2074132, 0, 0, 0, 1, 1,
0.9606903, -1.270661, 0.7600652, 0, 0, 0, 1, 1,
0.9653009, -1.780186, 2.879178, 0, 0, 0, 1, 1,
0.9689078, -1.145924, 2.425442, 0, 0, 0, 1, 1,
0.9689516, -0.3265475, 2.855235, 0, 0, 0, 1, 1,
0.9724799, -0.9070973, 2.337182, 1, 1, 1, 1, 1,
0.973269, -0.9600835, 1.945661, 1, 1, 1, 1, 1,
0.9771023, 2.244557, 0.833216, 1, 1, 1, 1, 1,
0.9854041, 1.307292, -0.06791673, 1, 1, 1, 1, 1,
0.99506, -0.4353495, 2.832627, 1, 1, 1, 1, 1,
1.002041, 0.8525301, 1.005673, 1, 1, 1, 1, 1,
1.009581, 0.4388704, 1.750333, 1, 1, 1, 1, 1,
1.010601, 0.5431697, 1.611452, 1, 1, 1, 1, 1,
1.014082, -0.2878654, 0.9326944, 1, 1, 1, 1, 1,
1.01859, -0.314422, 1.291576, 1, 1, 1, 1, 1,
1.018647, 0.3844615, 1.471392, 1, 1, 1, 1, 1,
1.023316, -1.740149, 2.39077, 1, 1, 1, 1, 1,
1.029772, 0.2682233, 3.849196, 1, 1, 1, 1, 1,
1.033827, -0.01782407, 1.102109, 1, 1, 1, 1, 1,
1.036384, -1.269585, 2.510279, 1, 1, 1, 1, 1,
1.036468, -1.530929, 2.073477, 0, 0, 1, 1, 1,
1.040934, -0.7918019, 1.647043, 1, 0, 0, 1, 1,
1.053823, 0.1962897, 0.1340928, 1, 0, 0, 1, 1,
1.054829, -1.526246, 2.559454, 1, 0, 0, 1, 1,
1.056974, -1.140618, 3.424832, 1, 0, 0, 1, 1,
1.0579, 0.7066377, -0.2583069, 1, 0, 0, 1, 1,
1.067866, -0.4034621, 2.937889, 0, 0, 0, 1, 1,
1.068835, -0.3038583, -0.4452942, 0, 0, 0, 1, 1,
1.069782, 0.6695288, 1.08937, 0, 0, 0, 1, 1,
1.0739, 0.9720162, 0.2829854, 0, 0, 0, 1, 1,
1.075848, -0.9072058, 1.047812, 0, 0, 0, 1, 1,
1.086129, 0.5391055, 1.056653, 0, 0, 0, 1, 1,
1.092176, -0.5509319, 1.785602, 0, 0, 0, 1, 1,
1.099716, -1.783543, 4.521899, 1, 1, 1, 1, 1,
1.129699, 1.728306, 0.750271, 1, 1, 1, 1, 1,
1.132334, 0.3198668, 3.015684, 1, 1, 1, 1, 1,
1.133765, 0.7557411, 0.7209731, 1, 1, 1, 1, 1,
1.134465, -0.3733004, 2.002615, 1, 1, 1, 1, 1,
1.137638, 1.671228, 0.5059845, 1, 1, 1, 1, 1,
1.143155, 0.05869269, 1.509307, 1, 1, 1, 1, 1,
1.146727, 0.9806957, 1.169147, 1, 1, 1, 1, 1,
1.150421, -0.417438, -0.5274684, 1, 1, 1, 1, 1,
1.1528, 0.05859239, 3.111182, 1, 1, 1, 1, 1,
1.153695, -0.04810269, 0.517704, 1, 1, 1, 1, 1,
1.156971, -0.2524603, 1.731397, 1, 1, 1, 1, 1,
1.164235, -0.5184902, -0.2948016, 1, 1, 1, 1, 1,
1.164711, -0.6685979, 0.6145827, 1, 1, 1, 1, 1,
1.169098, -0.7678256, 1.606171, 1, 1, 1, 1, 1,
1.170476, -0.2053801, 0.4303661, 0, 0, 1, 1, 1,
1.171906, 1.042157, 0.8002843, 1, 0, 0, 1, 1,
1.173585, 1.344572, 1.112108, 1, 0, 0, 1, 1,
1.174501, -1.671065, 3.099118, 1, 0, 0, 1, 1,
1.179842, -0.8641086, 1.322715, 1, 0, 0, 1, 1,
1.180888, 0.7465345, 0.1692065, 1, 0, 0, 1, 1,
1.184045, 2.007956, 1.696284, 0, 0, 0, 1, 1,
1.185666, -0.2449397, 1.487787, 0, 0, 0, 1, 1,
1.187042, -0.7093028, 2.787952, 0, 0, 0, 1, 1,
1.196981, -0.0449161, 2.686784, 0, 0, 0, 1, 1,
1.197336, 2.129716, 1.521631, 0, 0, 0, 1, 1,
1.201981, -0.06803628, 4.125136, 0, 0, 0, 1, 1,
1.202608, -0.778984, 3.453712, 0, 0, 0, 1, 1,
1.205675, -0.4759413, 1.076048, 1, 1, 1, 1, 1,
1.210294, -1.256407, 3.548015, 1, 1, 1, 1, 1,
1.212023, -0.8374771, 2.27729, 1, 1, 1, 1, 1,
1.213745, -0.8004894, 1.850614, 1, 1, 1, 1, 1,
1.219767, 0.4254647, 0.67463, 1, 1, 1, 1, 1,
1.227268, -2.037111, 3.3587, 1, 1, 1, 1, 1,
1.228858, -0.2102134, -0.1883819, 1, 1, 1, 1, 1,
1.233035, -0.3264005, 2.279235, 1, 1, 1, 1, 1,
1.23945, -0.8674624, 2.396448, 1, 1, 1, 1, 1,
1.243236, 0.4030617, 2.864274, 1, 1, 1, 1, 1,
1.244884, 0.9787005, -0.2447963, 1, 1, 1, 1, 1,
1.24886, -0.1542883, 0.811026, 1, 1, 1, 1, 1,
1.249314, 1.008369, 0.1075055, 1, 1, 1, 1, 1,
1.254515, -1.334015, 2.648311, 1, 1, 1, 1, 1,
1.257784, 0.1748754, 1.790088, 1, 1, 1, 1, 1,
1.260896, 2.362679, 0.3089443, 0, 0, 1, 1, 1,
1.277512, 1.142658, 0.7627307, 1, 0, 0, 1, 1,
1.288602, -0.6206449, 1.100414, 1, 0, 0, 1, 1,
1.294949, 0.1988552, 1.722193, 1, 0, 0, 1, 1,
1.296838, -2.781696, 1.328725, 1, 0, 0, 1, 1,
1.29738, 0.7255024, 1.707829, 1, 0, 0, 1, 1,
1.306627, -0.2875448, -0.3611555, 0, 0, 0, 1, 1,
1.32985, 0.1010423, 2.29938, 0, 0, 0, 1, 1,
1.332474, -1.240148, 1.67308, 0, 0, 0, 1, 1,
1.350194, 0.6848591, 1.080206, 0, 0, 0, 1, 1,
1.351111, 0.9695867, 0.6577575, 0, 0, 0, 1, 1,
1.352402, -0.7506672, 0.8527439, 0, 0, 0, 1, 1,
1.372085, -1.368061, 2.547297, 0, 0, 0, 1, 1,
1.37837, 1.108647, 0.527903, 1, 1, 1, 1, 1,
1.382185, 1.334968, 0.1152385, 1, 1, 1, 1, 1,
1.386003, 0.602007, 1.423584, 1, 1, 1, 1, 1,
1.39344, 0.5912787, 0.2347022, 1, 1, 1, 1, 1,
1.398345, 0.2740324, 1.348734, 1, 1, 1, 1, 1,
1.420353, -0.362428, 1.364545, 1, 1, 1, 1, 1,
1.422875, -0.009224425, 1.506216, 1, 1, 1, 1, 1,
1.422942, 1.934289, 1.815153, 1, 1, 1, 1, 1,
1.433313, 0.243191, 1.464838, 1, 1, 1, 1, 1,
1.435736, -1.679074, 0.02230317, 1, 1, 1, 1, 1,
1.44764, 0.5611935, -0.2842641, 1, 1, 1, 1, 1,
1.457499, -1.235693, 2.384959, 1, 1, 1, 1, 1,
1.457702, 0.04608231, 0.5165499, 1, 1, 1, 1, 1,
1.460803, -0.2213777, 1.297827, 1, 1, 1, 1, 1,
1.475642, 0.8573675, 0.6531132, 1, 1, 1, 1, 1,
1.496667, 0.08279638, -0.6386699, 0, 0, 1, 1, 1,
1.522103, 0.2674971, 1.365399, 1, 0, 0, 1, 1,
1.529285, -0.5760589, 2.397932, 1, 0, 0, 1, 1,
1.533171, 0.4131386, 1.823177, 1, 0, 0, 1, 1,
1.55633, 0.4385691, 3.171058, 1, 0, 0, 1, 1,
1.576035, -2.881035, 2.481175, 1, 0, 0, 1, 1,
1.580131, -1.117168, 2.813519, 0, 0, 0, 1, 1,
1.584892, -1.119773, 2.445038, 0, 0, 0, 1, 1,
1.603455, -0.485135, 2.376089, 0, 0, 0, 1, 1,
1.607554, 0.7149423, -0.9389983, 0, 0, 0, 1, 1,
1.620273, -0.3009721, 1.577314, 0, 0, 0, 1, 1,
1.623386, 0.180785, 0.7679309, 0, 0, 0, 1, 1,
1.62421, 2.159802, 1.137334, 0, 0, 0, 1, 1,
1.628202, -1.140361, 1.422733, 1, 1, 1, 1, 1,
1.637851, 0.2955529, 0.4399564, 1, 1, 1, 1, 1,
1.647547, -0.1831034, -1.138622, 1, 1, 1, 1, 1,
1.656379, -0.6589282, 3.698091, 1, 1, 1, 1, 1,
1.67063, -0.5211882, 1.955561, 1, 1, 1, 1, 1,
1.675001, 0.05512585, 0.7646548, 1, 1, 1, 1, 1,
1.677212, -0.1518535, 1.761944, 1, 1, 1, 1, 1,
1.67855, -0.7738535, 2.941011, 1, 1, 1, 1, 1,
1.684534, -0.2988999, 1.717061, 1, 1, 1, 1, 1,
1.686182, 2.23822, 0.8049334, 1, 1, 1, 1, 1,
1.697188, -0.3317718, 2.443274, 1, 1, 1, 1, 1,
1.706362, 0.463516, 0.7935489, 1, 1, 1, 1, 1,
1.70939, 0.5078204, 3.223558, 1, 1, 1, 1, 1,
1.712405, 1.324707, 2.130306, 1, 1, 1, 1, 1,
1.742991, -0.3428238, 1.576496, 1, 1, 1, 1, 1,
1.744746, 0.4931717, 0.6884822, 0, 0, 1, 1, 1,
1.764239, 1.300209, 1.457126, 1, 0, 0, 1, 1,
1.766674, -0.1392285, 2.072134, 1, 0, 0, 1, 1,
1.776166, -0.1422837, 2.728803, 1, 0, 0, 1, 1,
1.78686, -1.491492, 2.565898, 1, 0, 0, 1, 1,
1.804574, 0.6941047, 0.904863, 1, 0, 0, 1, 1,
1.808663, 0.6647339, 1.01797, 0, 0, 0, 1, 1,
1.831121, 1.304375, 0.5566574, 0, 0, 0, 1, 1,
1.842923, -0.2451528, 1.388799, 0, 0, 0, 1, 1,
1.843358, 0.3284621, -1.286534, 0, 0, 0, 1, 1,
1.847392, -1.418178, 3.615692, 0, 0, 0, 1, 1,
1.850181, -2.077239, 1.046794, 0, 0, 0, 1, 1,
1.873417, -1.054456, 0.7777821, 0, 0, 0, 1, 1,
1.898567, -0.5150912, 0.9882253, 1, 1, 1, 1, 1,
1.905712, 0.3217821, 0.9950683, 1, 1, 1, 1, 1,
1.917257, -1.476541, 2.683724, 1, 1, 1, 1, 1,
1.934318, -0.218096, 1.101241, 1, 1, 1, 1, 1,
1.957395, -1.608438, 3.90117, 1, 1, 1, 1, 1,
1.966644, -1.331824, 1.343605, 1, 1, 1, 1, 1,
1.972546, -0.9122047, 2.200829, 1, 1, 1, 1, 1,
2.015253, -0.1793008, 1.338231, 1, 1, 1, 1, 1,
2.02588, -0.008406277, 2.012031, 1, 1, 1, 1, 1,
2.04131, -0.4590167, 0.8707728, 1, 1, 1, 1, 1,
2.078942, -0.3251619, 3.123249, 1, 1, 1, 1, 1,
2.090595, 0.6032955, 1.010304, 1, 1, 1, 1, 1,
2.090734, -0.3854, 1.580985, 1, 1, 1, 1, 1,
2.115115, -2.077797, 1.796713, 1, 1, 1, 1, 1,
2.130303, -1.073451, 2.699494, 1, 1, 1, 1, 1,
2.18137, 0.9013367, 0.7300656, 0, 0, 1, 1, 1,
2.197861, 2.479386, 1.127377, 1, 0, 0, 1, 1,
2.207803, -1.973021, 1.583379, 1, 0, 0, 1, 1,
2.223388, -1.61749, 1.669849, 1, 0, 0, 1, 1,
2.319797, 1.623219, 0.4341843, 1, 0, 0, 1, 1,
2.329275, -1.274625, 2.676056, 1, 0, 0, 1, 1,
2.329732, -0.0120775, 1.095199, 0, 0, 0, 1, 1,
2.336043, -0.2873431, 2.339629, 0, 0, 0, 1, 1,
2.381256, -0.03288226, 0.129873, 0, 0, 0, 1, 1,
2.389952, -0.4992339, 0.5772538, 0, 0, 0, 1, 1,
2.426346, -0.4439202, 1.842484, 0, 0, 0, 1, 1,
2.44119, -1.120895, 1.909466, 0, 0, 0, 1, 1,
2.493014, 0.04653955, 1.440934, 0, 0, 0, 1, 1,
2.590579, -0.1204375, 0.06687322, 1, 1, 1, 1, 1,
2.67172, 0.3362417, 2.355188, 1, 1, 1, 1, 1,
2.751927, -0.655507, 1.966619, 1, 1, 1, 1, 1,
2.759885, -0.289844, 1.020539, 1, 1, 1, 1, 1,
2.837092, 0.5489736, 1.029098, 1, 1, 1, 1, 1,
2.932437, 0.1062816, 0.3158589, 1, 1, 1, 1, 1,
3.691679, 2.308627, 0.4820888, 1, 1, 1, 1, 1
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
var radius = 9.294036;
var distance = 32.64491;
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
mvMatrix.translate( -0.09888458, 0.2159231, -0.1605191 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.64491);
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
