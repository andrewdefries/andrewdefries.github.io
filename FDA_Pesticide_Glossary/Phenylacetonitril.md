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
-3.31589, 1.26452, -2.920928, 1, 0, 0, 1,
-3.209098, 1.083959, -0.299657, 1, 0.007843138, 0, 1,
-3.180091, 1.771992, -1.692324, 1, 0.01176471, 0, 1,
-3.137404, -0.3806344, -1.296751, 1, 0.01960784, 0, 1,
-2.772221, 0.7732436, -3.014842, 1, 0.02352941, 0, 1,
-2.72698, 1.225298, -2.317733, 1, 0.03137255, 0, 1,
-2.62908, -0.4242107, -2.134881, 1, 0.03529412, 0, 1,
-2.571102, 0.2698072, -0.1257139, 1, 0.04313726, 0, 1,
-2.542538, 0.8230008, -2.140398, 1, 0.04705882, 0, 1,
-2.535106, 0.3998283, -0.9828157, 1, 0.05490196, 0, 1,
-2.479737, -0.8260921, -1.409948, 1, 0.05882353, 0, 1,
-2.321401, 0.6186374, -1.118171, 1, 0.06666667, 0, 1,
-2.213143, 0.3482056, -1.273079, 1, 0.07058824, 0, 1,
-2.192709, -0.7581369, -0.9463019, 1, 0.07843138, 0, 1,
-2.15444, 2.654369, -0.612745, 1, 0.08235294, 0, 1,
-2.120412, 0.4999793, -1.748382, 1, 0.09019608, 0, 1,
-2.107458, -0.2370293, -2.657155, 1, 0.09411765, 0, 1,
-2.093004, -0.7866513, -1.971686, 1, 0.1019608, 0, 1,
-2.090966, -0.7353969, -3.653423, 1, 0.1098039, 0, 1,
-2.085134, 1.110441, -0.6398619, 1, 0.1137255, 0, 1,
-2.009662, 0.5800871, -1.13993, 1, 0.1215686, 0, 1,
-2.005771, 1.746602, 1.651372, 1, 0.1254902, 0, 1,
-1.982048, -0.3032944, -1.279915, 1, 0.1333333, 0, 1,
-1.978428, -0.5707629, -2.324008, 1, 0.1372549, 0, 1,
-1.953958, -1.070026, -2.652434, 1, 0.145098, 0, 1,
-1.92815, 0.592843, 0.1680574, 1, 0.1490196, 0, 1,
-1.921781, -0.8209386, -0.7939448, 1, 0.1568628, 0, 1,
-1.913837, 1.419566, -2.213249, 1, 0.1607843, 0, 1,
-1.858655, 0.1243158, -0.7718379, 1, 0.1686275, 0, 1,
-1.855614, 0.643644, -4.042451, 1, 0.172549, 0, 1,
-1.849475, -0.7938465, -1.69867, 1, 0.1803922, 0, 1,
-1.842541, -0.6172188, -2.296194, 1, 0.1843137, 0, 1,
-1.820771, -0.1919758, -0.8929991, 1, 0.1921569, 0, 1,
-1.811869, -0.5984131, -1.77755, 1, 0.1960784, 0, 1,
-1.803672, -0.3570437, -1.632802, 1, 0.2039216, 0, 1,
-1.803297, 0.8004205, 0.4610817, 1, 0.2117647, 0, 1,
-1.800161, 0.613984, -2.981275, 1, 0.2156863, 0, 1,
-1.795949, 0.5472727, -2.35385, 1, 0.2235294, 0, 1,
-1.771624, 0.7720303, -0.6629744, 1, 0.227451, 0, 1,
-1.766964, 0.1432247, -2.867232, 1, 0.2352941, 0, 1,
-1.753533, 0.8772756, -2.216534, 1, 0.2392157, 0, 1,
-1.750474, -1.758318, -1.584838, 1, 0.2470588, 0, 1,
-1.747227, -0.4134242, -2.914072, 1, 0.2509804, 0, 1,
-1.745618, 1.71065, 0.2118698, 1, 0.2588235, 0, 1,
-1.73133, 0.5467631, -1.23669, 1, 0.2627451, 0, 1,
-1.718684, 0.7814665, -2.656897, 1, 0.2705882, 0, 1,
-1.695171, 0.2475276, -1.463278, 1, 0.2745098, 0, 1,
-1.679947, -0.2480837, -1.061646, 1, 0.282353, 0, 1,
-1.654293, -1.043535, -2.232314, 1, 0.2862745, 0, 1,
-1.651016, 0.09908084, -2.122535, 1, 0.2941177, 0, 1,
-1.644981, 2.678201, -1.575014, 1, 0.3019608, 0, 1,
-1.640713, -1.552257, -3.327127, 1, 0.3058824, 0, 1,
-1.628788, 0.224462, -1.813195, 1, 0.3137255, 0, 1,
-1.600712, 3.068296, -0.3010688, 1, 0.3176471, 0, 1,
-1.598178, 2.634023, -0.1347341, 1, 0.3254902, 0, 1,
-1.595646, -0.4884427, -1.350754, 1, 0.3294118, 0, 1,
-1.588961, 0.2961386, -1.983321, 1, 0.3372549, 0, 1,
-1.57272, -0.545738, -3.890946, 1, 0.3411765, 0, 1,
-1.572363, 0.6632316, -0.2304691, 1, 0.3490196, 0, 1,
-1.569409, 1.111359, -0.03819158, 1, 0.3529412, 0, 1,
-1.562762, -0.3546288, -1.094251, 1, 0.3607843, 0, 1,
-1.552754, -0.7552987, -1.535053, 1, 0.3647059, 0, 1,
-1.551423, -0.1198869, -2.621708, 1, 0.372549, 0, 1,
-1.541043, 1.498707, -0.7854193, 1, 0.3764706, 0, 1,
-1.540367, -0.3066226, -1.339067, 1, 0.3843137, 0, 1,
-1.534417, -1.245663, -3.084717, 1, 0.3882353, 0, 1,
-1.529602, 1.894507, -0.4702832, 1, 0.3960784, 0, 1,
-1.514213, -0.8128484, -1.111382, 1, 0.4039216, 0, 1,
-1.505796, -0.8948273, -2.409075, 1, 0.4078431, 0, 1,
-1.503204, 0.9725302, -2.096471, 1, 0.4156863, 0, 1,
-1.496343, -0.9385854, -2.197297, 1, 0.4196078, 0, 1,
-1.492524, 0.3246899, -1.907526, 1, 0.427451, 0, 1,
-1.492133, -0.9695576, -3.162217, 1, 0.4313726, 0, 1,
-1.480612, 1.208644, 0.08795553, 1, 0.4392157, 0, 1,
-1.449621, 0.03337151, -2.658728, 1, 0.4431373, 0, 1,
-1.435182, 0.9957763, -0.777703, 1, 0.4509804, 0, 1,
-1.422884, 0.7443214, -0.7928446, 1, 0.454902, 0, 1,
-1.416366, 0.2822994, -3.312994, 1, 0.4627451, 0, 1,
-1.409226, -0.4650595, -2.242402, 1, 0.4666667, 0, 1,
-1.405892, 0.8557917, 0.107567, 1, 0.4745098, 0, 1,
-1.381426, 1.070713, -1.170399, 1, 0.4784314, 0, 1,
-1.381398, -0.04258167, -3.445433, 1, 0.4862745, 0, 1,
-1.368214, 0.4063007, -1.577637, 1, 0.4901961, 0, 1,
-1.367393, -0.1889761, -1.817477, 1, 0.4980392, 0, 1,
-1.365722, -0.8632641, -2.271443, 1, 0.5058824, 0, 1,
-1.355848, -0.1481981, -0.627214, 1, 0.509804, 0, 1,
-1.333098, 1.428459, 0.4298313, 1, 0.5176471, 0, 1,
-1.330259, 0.8787585, -0.5256448, 1, 0.5215687, 0, 1,
-1.32423, 1.287719, -0.1580054, 1, 0.5294118, 0, 1,
-1.32407, 0.09098904, -2.180619, 1, 0.5333334, 0, 1,
-1.31075, -0.7094796, -2.065005, 1, 0.5411765, 0, 1,
-1.309996, 0.9200532, -0.9075006, 1, 0.5450981, 0, 1,
-1.296197, -1.162846, -1.647564, 1, 0.5529412, 0, 1,
-1.284822, -0.3566663, -1.683461, 1, 0.5568628, 0, 1,
-1.282489, 0.9499975, -0.3617219, 1, 0.5647059, 0, 1,
-1.281761, 1.592872, -0.3368299, 1, 0.5686275, 0, 1,
-1.275691, 0.8663166, -1.867613, 1, 0.5764706, 0, 1,
-1.238606, -0.99985, -2.501219, 1, 0.5803922, 0, 1,
-1.214197, -0.4746832, 0.1143104, 1, 0.5882353, 0, 1,
-1.213651, 0.2953698, -0.9215519, 1, 0.5921569, 0, 1,
-1.212497, 1.526638, -1.950417, 1, 0.6, 0, 1,
-1.21203, -0.1368134, -0.1534399, 1, 0.6078432, 0, 1,
-1.211702, 0.644985, -0.7031648, 1, 0.6117647, 0, 1,
-1.210191, 0.5557643, -1.415284, 1, 0.6196079, 0, 1,
-1.207677, -1.469865, -2.988599, 1, 0.6235294, 0, 1,
-1.201989, -1.403394, -2.580862, 1, 0.6313726, 0, 1,
-1.201963, 0.3209709, -2.381844, 1, 0.6352941, 0, 1,
-1.200505, 0.2276623, -0.8063943, 1, 0.6431373, 0, 1,
-1.193798, 0.08965134, -3.002588, 1, 0.6470588, 0, 1,
-1.189108, -0.1713781, -1.717522, 1, 0.654902, 0, 1,
-1.188309, -0.5262489, -1.425493, 1, 0.6588235, 0, 1,
-1.187136, -0.326468, 0.3421938, 1, 0.6666667, 0, 1,
-1.175019, 0.670065, -1.863186, 1, 0.6705883, 0, 1,
-1.171308, -1.656141, -1.430139, 1, 0.6784314, 0, 1,
-1.167123, 2.163701, -0.9982007, 1, 0.682353, 0, 1,
-1.164324, -1.248726, -2.339722, 1, 0.6901961, 0, 1,
-1.161584, 1.461615, -0.8463329, 1, 0.6941177, 0, 1,
-1.147261, -0.6410847, -1.05046, 1, 0.7019608, 0, 1,
-1.146859, 0.3429718, -3.134579, 1, 0.7098039, 0, 1,
-1.141377, -0.8104767, -1.527632, 1, 0.7137255, 0, 1,
-1.133998, 0.2665128, -1.651266, 1, 0.7215686, 0, 1,
-1.129376, 2.186743, -3.130091, 1, 0.7254902, 0, 1,
-1.125916, 1.523455, -0.4263135, 1, 0.7333333, 0, 1,
-1.117967, 1.336474, -1.470745, 1, 0.7372549, 0, 1,
-1.110396, -0.02421239, -2.232347, 1, 0.7450981, 0, 1,
-1.109991, 1.646865, -1.666409, 1, 0.7490196, 0, 1,
-1.090338, 1.551493, -0.2565044, 1, 0.7568628, 0, 1,
-1.081871, -0.1867984, -0.04692351, 1, 0.7607843, 0, 1,
-1.064354, 1.0805, -1.48403, 1, 0.7686275, 0, 1,
-1.063719, 1.346502, -1.293704, 1, 0.772549, 0, 1,
-1.063022, -0.6227954, -2.983183, 1, 0.7803922, 0, 1,
-1.062444, -0.7189553, -1.044934, 1, 0.7843137, 0, 1,
-1.055992, -0.2609238, -3.874346, 1, 0.7921569, 0, 1,
-1.055434, -0.8128359, -0.4927599, 1, 0.7960784, 0, 1,
-1.054095, -0.4740874, -2.044673, 1, 0.8039216, 0, 1,
-1.052662, 0.9510065, -2.215728, 1, 0.8117647, 0, 1,
-1.051762, -0.1014232, -2.078051, 1, 0.8156863, 0, 1,
-1.050708, -0.2595077, -1.807087, 1, 0.8235294, 0, 1,
-1.046457, -1.359287, -3.746565, 1, 0.827451, 0, 1,
-1.033608, 0.06453395, -3.515898, 1, 0.8352941, 0, 1,
-1.028384, -1.412918, -2.047072, 1, 0.8392157, 0, 1,
-1.023185, 1.32664, 2.272902, 1, 0.8470588, 0, 1,
-1.020596, 0.8805663, -0.361459, 1, 0.8509804, 0, 1,
-1.018676, 0.2479423, -1.570551, 1, 0.8588235, 0, 1,
-1.01863, 1.275898, -0.9771062, 1, 0.8627451, 0, 1,
-1.015855, -1.564131, -1.396414, 1, 0.8705882, 0, 1,
-1.00298, 2.476341, 0.6964388, 1, 0.8745098, 0, 1,
-1.00221, -1.341861, -3.52402, 1, 0.8823529, 0, 1,
-0.9943028, -1.394788, -0.8977293, 1, 0.8862745, 0, 1,
-0.9885114, -1.310333, -3.33634, 1, 0.8941177, 0, 1,
-0.9842087, 0.6613002, -0.05141513, 1, 0.8980392, 0, 1,
-0.9834498, -0.7254382, -2.292695, 1, 0.9058824, 0, 1,
-0.9802325, -0.6822315, -0.9062437, 1, 0.9137255, 0, 1,
-0.9701559, -0.4646586, -1.402056, 1, 0.9176471, 0, 1,
-0.9700881, 0.3803945, -2.75415, 1, 0.9254902, 0, 1,
-0.967292, 0.6445622, -0.7700005, 1, 0.9294118, 0, 1,
-0.9624707, 1.252758, -1.291835, 1, 0.9372549, 0, 1,
-0.9620993, -0.0613618, -4.144087, 1, 0.9411765, 0, 1,
-0.9584886, -0.4846907, -2.673875, 1, 0.9490196, 0, 1,
-0.9561626, -0.389681, -2.132436, 1, 0.9529412, 0, 1,
-0.951926, -0.6567501, -2.568634, 1, 0.9607843, 0, 1,
-0.9502097, -0.892305, 1.209726, 1, 0.9647059, 0, 1,
-0.9491768, -1.008038, -1.864052, 1, 0.972549, 0, 1,
-0.9438121, 0.4603214, -2.13422, 1, 0.9764706, 0, 1,
-0.9375544, 0.09708112, -1.322366, 1, 0.9843137, 0, 1,
-0.9353386, -0.05006498, -3.245485, 1, 0.9882353, 0, 1,
-0.9340426, 0.2143397, -2.0378, 1, 0.9960784, 0, 1,
-0.9339448, 1.492723, -1.122701, 0.9960784, 1, 0, 1,
-0.9300309, 0.1679189, -2.067107, 0.9921569, 1, 0, 1,
-0.928152, -1.089757, -2.566007, 0.9843137, 1, 0, 1,
-0.9256846, 0.5210558, 1.490494, 0.9803922, 1, 0, 1,
-0.9192303, 1.916422, -1.93216, 0.972549, 1, 0, 1,
-0.9117004, 0.2773234, 0.5373976, 0.9686275, 1, 0, 1,
-0.905681, -0.6163094, -1.515009, 0.9607843, 1, 0, 1,
-0.9054791, -0.9448473, -1.560469, 0.9568627, 1, 0, 1,
-0.9051128, 0.6570308, -1.025981, 0.9490196, 1, 0, 1,
-0.9046262, 1.024612, -0.9876336, 0.945098, 1, 0, 1,
-0.9018722, 1.697723, 0.8134309, 0.9372549, 1, 0, 1,
-0.8995622, -0.1929629, -1.91985, 0.9333333, 1, 0, 1,
-0.89409, -0.1218688, -2.632003, 0.9254902, 1, 0, 1,
-0.8923203, 0.02787332, -2.040076, 0.9215686, 1, 0, 1,
-0.8893811, -0.3388604, -1.953041, 0.9137255, 1, 0, 1,
-0.8880004, 1.462188, -0.2813488, 0.9098039, 1, 0, 1,
-0.8875948, -1.042978, -1.4435, 0.9019608, 1, 0, 1,
-0.8833571, 0.2243627, -1.465773, 0.8941177, 1, 0, 1,
-0.8807322, -0.2546434, -2.683492, 0.8901961, 1, 0, 1,
-0.8739833, -0.2827531, -2.330498, 0.8823529, 1, 0, 1,
-0.8724312, -0.3377723, -3.871799, 0.8784314, 1, 0, 1,
-0.8706123, -0.7143159, -1.334361, 0.8705882, 1, 0, 1,
-0.8701735, 0.1789044, -0.759454, 0.8666667, 1, 0, 1,
-0.8658155, 1.425395, -0.4162138, 0.8588235, 1, 0, 1,
-0.8648506, -0.5464877, -2.944984, 0.854902, 1, 0, 1,
-0.8621058, 0.2648966, -2.004907, 0.8470588, 1, 0, 1,
-0.8597291, 1.218158, 0.8717112, 0.8431373, 1, 0, 1,
-0.8539709, 0.4963564, -0.5106532, 0.8352941, 1, 0, 1,
-0.8533286, -1.292171, -1.226585, 0.8313726, 1, 0, 1,
-0.8530055, -0.3895823, -1.262565, 0.8235294, 1, 0, 1,
-0.8525813, -0.7557963, -2.829696, 0.8196079, 1, 0, 1,
-0.8513684, -0.463173, -3.173515, 0.8117647, 1, 0, 1,
-0.8490804, 0.712213, -1.057166, 0.8078431, 1, 0, 1,
-0.847858, 1.171373, 0.8565267, 0.8, 1, 0, 1,
-0.8445976, 2.341767, -0.6873949, 0.7921569, 1, 0, 1,
-0.8444262, 0.7455317, 0.5306424, 0.7882353, 1, 0, 1,
-0.8410259, 0.1354823, -0.2882934, 0.7803922, 1, 0, 1,
-0.8392131, -0.711243, -1.775023, 0.7764706, 1, 0, 1,
-0.8330379, -0.6957219, -2.892833, 0.7686275, 1, 0, 1,
-0.8290324, 1.384559, -1.286685, 0.7647059, 1, 0, 1,
-0.8289479, -0.2365359, -0.3901893, 0.7568628, 1, 0, 1,
-0.8280324, -1.992669, -1.68765, 0.7529412, 1, 0, 1,
-0.8275034, 2.130834, 1.361252, 0.7450981, 1, 0, 1,
-0.8189527, -0.05896316, -1.831142, 0.7411765, 1, 0, 1,
-0.814568, -0.8861015, -2.024039, 0.7333333, 1, 0, 1,
-0.8077409, -0.8716348, -1.782801, 0.7294118, 1, 0, 1,
-0.7956585, -0.00395928, -1.33281, 0.7215686, 1, 0, 1,
-0.7949418, -0.3555591, -2.135999, 0.7176471, 1, 0, 1,
-0.7922393, -1.377625, -3.108904, 0.7098039, 1, 0, 1,
-0.7918633, 1.136417, -2.911156, 0.7058824, 1, 0, 1,
-0.7906663, -2.073568, -2.177654, 0.6980392, 1, 0, 1,
-0.7884014, -1.354398, -0.7261161, 0.6901961, 1, 0, 1,
-0.78833, -0.1786662, -1.312827, 0.6862745, 1, 0, 1,
-0.7868654, -0.5063671, -0.9751605, 0.6784314, 1, 0, 1,
-0.7824851, 0.369345, 0.6189008, 0.6745098, 1, 0, 1,
-0.772351, 0.1429755, -1.425829, 0.6666667, 1, 0, 1,
-0.7683291, 0.8138906, -1.369777, 0.6627451, 1, 0, 1,
-0.7681149, 1.297221, -1.516232, 0.654902, 1, 0, 1,
-0.7670302, -1.174478, -4.004706, 0.6509804, 1, 0, 1,
-0.766763, 1.185452, 0.5719147, 0.6431373, 1, 0, 1,
-0.7661213, -0.08554977, -0.8267292, 0.6392157, 1, 0, 1,
-0.7516092, -0.4646288, -3.769229, 0.6313726, 1, 0, 1,
-0.750481, 1.402192, -1.716526, 0.627451, 1, 0, 1,
-0.7467269, 0.2290612, -0.0167469, 0.6196079, 1, 0, 1,
-0.7418109, 0.2710591, -0.4582946, 0.6156863, 1, 0, 1,
-0.741077, -0.4158203, -2.853299, 0.6078432, 1, 0, 1,
-0.7380747, -0.7429348, -2.46121, 0.6039216, 1, 0, 1,
-0.7240776, -0.8082584, -2.620813, 0.5960785, 1, 0, 1,
-0.7237654, 0.04250274, -0.9513971, 0.5882353, 1, 0, 1,
-0.7171411, -0.974177, -0.6360287, 0.5843138, 1, 0, 1,
-0.712366, 0.8350353, -0.7057546, 0.5764706, 1, 0, 1,
-0.7085835, 1.560325, -1.541993, 0.572549, 1, 0, 1,
-0.7060996, 1.585656, -1.164344, 0.5647059, 1, 0, 1,
-0.6995113, 0.312149, -2.296599, 0.5607843, 1, 0, 1,
-0.6977342, 0.6537948, -1.046945, 0.5529412, 1, 0, 1,
-0.6906846, -0.07081943, -1.887332, 0.5490196, 1, 0, 1,
-0.6866272, 0.8331086, -0.4627158, 0.5411765, 1, 0, 1,
-0.6789898, -1.738649, -2.633092, 0.5372549, 1, 0, 1,
-0.6751353, 0.6677372, -1.847601, 0.5294118, 1, 0, 1,
-0.6718442, -0.9402745, -2.710415, 0.5254902, 1, 0, 1,
-0.6685993, 0.2254476, -1.295973, 0.5176471, 1, 0, 1,
-0.6654671, -0.4425329, -1.027445, 0.5137255, 1, 0, 1,
-0.6628119, -0.9890922, -1.966526, 0.5058824, 1, 0, 1,
-0.6626965, 0.416438, 1.42518, 0.5019608, 1, 0, 1,
-0.6625645, -0.5582613, -0.885178, 0.4941176, 1, 0, 1,
-0.6615845, 0.03318533, -1.351153, 0.4862745, 1, 0, 1,
-0.6553451, -0.6190386, -2.187228, 0.4823529, 1, 0, 1,
-0.6475062, -1.284966, -3.895669, 0.4745098, 1, 0, 1,
-0.6426352, 1.371294, -0.5421735, 0.4705882, 1, 0, 1,
-0.6402917, -0.2128108, -0.3959546, 0.4627451, 1, 0, 1,
-0.6342871, -2.062337, -1.624109, 0.4588235, 1, 0, 1,
-0.6340224, -1.108407, -3.614694, 0.4509804, 1, 0, 1,
-0.6321527, 0.5706306, -0.02182297, 0.4470588, 1, 0, 1,
-0.6316037, -0.9791601, -3.428353, 0.4392157, 1, 0, 1,
-0.6294521, 0.8314715, -1.21973, 0.4352941, 1, 0, 1,
-0.628778, -2.480973, -4.324353, 0.427451, 1, 0, 1,
-0.6233754, -1.897905, -3.813434, 0.4235294, 1, 0, 1,
-0.6196845, 0.9754214, -0.8584108, 0.4156863, 1, 0, 1,
-0.6185202, 0.3286935, -2.51403, 0.4117647, 1, 0, 1,
-0.614052, 0.713293, -1.205887, 0.4039216, 1, 0, 1,
-0.6117061, 1.098805, -1.580767, 0.3960784, 1, 0, 1,
-0.6100453, -0.2456141, -3.1406, 0.3921569, 1, 0, 1,
-0.6080421, -0.4783764, -1.605347, 0.3843137, 1, 0, 1,
-0.6078156, 0.02561317, -1.566579, 0.3803922, 1, 0, 1,
-0.6002223, -0.7853742, -2.820727, 0.372549, 1, 0, 1,
-0.5976316, -0.734875, -2.264776, 0.3686275, 1, 0, 1,
-0.5961437, 1.437643, -0.3408625, 0.3607843, 1, 0, 1,
-0.5919194, 1.34957, -3.308534, 0.3568628, 1, 0, 1,
-0.5904285, 0.6545506, -2.075101, 0.3490196, 1, 0, 1,
-0.5892781, 0.998278, -0.1919193, 0.345098, 1, 0, 1,
-0.583632, 1.366452, -0.5903595, 0.3372549, 1, 0, 1,
-0.5745503, 0.3664913, 0.1114212, 0.3333333, 1, 0, 1,
-0.5716401, 1.003498, -2.301459, 0.3254902, 1, 0, 1,
-0.5696963, -1.664162, -3.014768, 0.3215686, 1, 0, 1,
-0.5670264, 0.7348546, -1.897187, 0.3137255, 1, 0, 1,
-0.5632304, -0.9323719, -2.095867, 0.3098039, 1, 0, 1,
-0.5606487, 0.5010477, -0.5333235, 0.3019608, 1, 0, 1,
-0.5585039, 1.283728, -0.2400883, 0.2941177, 1, 0, 1,
-0.5547941, 0.2869287, -2.844269, 0.2901961, 1, 0, 1,
-0.550338, -1.840351, -3.389347, 0.282353, 1, 0, 1,
-0.5429175, -0.542186, -3.384931, 0.2784314, 1, 0, 1,
-0.5407333, 3.553903, 1.114219, 0.2705882, 1, 0, 1,
-0.5407234, 1.004038, 0.8221696, 0.2666667, 1, 0, 1,
-0.5400901, -2.333594, -4.280629, 0.2588235, 1, 0, 1,
-0.5378495, 1.234726, -1.136168, 0.254902, 1, 0, 1,
-0.5334308, -0.170441, -1.27764, 0.2470588, 1, 0, 1,
-0.5281035, 0.4184169, -0.8645183, 0.2431373, 1, 0, 1,
-0.5132499, 1.046135, -0.8718936, 0.2352941, 1, 0, 1,
-0.5121732, 0.1361066, -1.41224, 0.2313726, 1, 0, 1,
-0.5071308, 0.04791718, -2.046972, 0.2235294, 1, 0, 1,
-0.5054266, -0.4461043, -2.093202, 0.2196078, 1, 0, 1,
-0.5010113, 1.026573, -0.7804437, 0.2117647, 1, 0, 1,
-0.4981273, -0.2577369, -2.7463, 0.2078431, 1, 0, 1,
-0.493302, -0.7072273, -3.163882, 0.2, 1, 0, 1,
-0.4923904, 1.128722, 0.7846244, 0.1921569, 1, 0, 1,
-0.4858495, 0.9592898, -1.050163, 0.1882353, 1, 0, 1,
-0.4797582, -1.552271, -2.127736, 0.1803922, 1, 0, 1,
-0.4796925, 0.6107724, -0.508518, 0.1764706, 1, 0, 1,
-0.4752371, -1.69901, -2.547987, 0.1686275, 1, 0, 1,
-0.4747858, 0.1141879, -0.8947813, 0.1647059, 1, 0, 1,
-0.4709263, -0.4760677, -1.769718, 0.1568628, 1, 0, 1,
-0.4686254, -2.032612, -3.695486, 0.1529412, 1, 0, 1,
-0.4677715, 0.6547543, -1.407648, 0.145098, 1, 0, 1,
-0.4655124, -0.1158881, -0.8196652, 0.1411765, 1, 0, 1,
-0.4611106, 1.490725, 0.2448629, 0.1333333, 1, 0, 1,
-0.4589873, 0.1622423, -1.337171, 0.1294118, 1, 0, 1,
-0.4572574, -0.2674896, -2.696206, 0.1215686, 1, 0, 1,
-0.4534742, 0.1726053, -2.025963, 0.1176471, 1, 0, 1,
-0.4533789, -0.9252572, -1.840369, 0.1098039, 1, 0, 1,
-0.4508206, 1.425254, -0.5585561, 0.1058824, 1, 0, 1,
-0.4505507, -1.258928, -1.672941, 0.09803922, 1, 0, 1,
-0.4502826, 0.8804588, -0.08632088, 0.09019608, 1, 0, 1,
-0.4495377, -1.105021, -2.173815, 0.08627451, 1, 0, 1,
-0.449237, 1.35221, -1.45481, 0.07843138, 1, 0, 1,
-0.4482546, -1.097301, -2.85878, 0.07450981, 1, 0, 1,
-0.4412617, -0.01523855, -0.7758173, 0.06666667, 1, 0, 1,
-0.4401361, -0.1144732, -0.9744158, 0.0627451, 1, 0, 1,
-0.4378388, -0.5619071, -2.642335, 0.05490196, 1, 0, 1,
-0.436967, -0.1306348, -0.7423049, 0.05098039, 1, 0, 1,
-0.4363537, -0.8746714, -4.761924, 0.04313726, 1, 0, 1,
-0.4340754, -0.2898687, -0.9779106, 0.03921569, 1, 0, 1,
-0.4286737, -0.6072292, -2.338215, 0.03137255, 1, 0, 1,
-0.4261678, 0.1119588, -1.506153, 0.02745098, 1, 0, 1,
-0.425154, -0.6840289, -3.212147, 0.01960784, 1, 0, 1,
-0.4234282, 0.4366643, -1.093936, 0.01568628, 1, 0, 1,
-0.4177926, 0.6286965, -1.009558, 0.007843138, 1, 0, 1,
-0.4156276, 0.6543868, 0.503795, 0.003921569, 1, 0, 1,
-0.4134107, 0.6474541, -1.857474, 0, 1, 0.003921569, 1,
-0.4114037, -1.029463, -1.416864, 0, 1, 0.01176471, 1,
-0.4107676, -0.1826659, -1.918576, 0, 1, 0.01568628, 1,
-0.404062, 0.1090095, -2.208563, 0, 1, 0.02352941, 1,
-0.4015837, -0.4471632, -3.143496, 0, 1, 0.02745098, 1,
-0.401075, -0.9742151, -5.217165, 0, 1, 0.03529412, 1,
-0.3957, -1.108904, -2.348303, 0, 1, 0.03921569, 1,
-0.3944382, 1.078226, -0.3780923, 0, 1, 0.04705882, 1,
-0.3914544, -0.9368042, -2.645992, 0, 1, 0.05098039, 1,
-0.3909141, -1.555043, -2.195613, 0, 1, 0.05882353, 1,
-0.3767226, -0.2772338, -1.501738, 0, 1, 0.0627451, 1,
-0.3766597, -0.6330569, -2.719149, 0, 1, 0.07058824, 1,
-0.3732484, 0.369796, -0.9343165, 0, 1, 0.07450981, 1,
-0.3732031, -0.2175354, -2.376967, 0, 1, 0.08235294, 1,
-0.367559, -0.3102778, -2.784474, 0, 1, 0.08627451, 1,
-0.3672613, -0.5639307, -2.441355, 0, 1, 0.09411765, 1,
-0.3659411, -0.1751975, -1.688863, 0, 1, 0.1019608, 1,
-0.3659223, 0.1089149, -0.8920658, 0, 1, 0.1058824, 1,
-0.3639374, 0.4587841, -2.40724, 0, 1, 0.1137255, 1,
-0.3589674, -0.3659867, -1.361383, 0, 1, 0.1176471, 1,
-0.3575824, 1.607199, -0.9718179, 0, 1, 0.1254902, 1,
-0.3529239, -1.517122, -4.128599, 0, 1, 0.1294118, 1,
-0.3514107, 0.2085407, -0.8939701, 0, 1, 0.1372549, 1,
-0.347934, -0.436466, -1.782999, 0, 1, 0.1411765, 1,
-0.3479101, 1.1241, 0.6710609, 0, 1, 0.1490196, 1,
-0.3476565, 0.3122244, -0.2561216, 0, 1, 0.1529412, 1,
-0.3343478, 0.2288107, -0.5061822, 0, 1, 0.1607843, 1,
-0.332199, 0.1216546, -2.104463, 0, 1, 0.1647059, 1,
-0.3314596, 0.5938739, -1.332254, 0, 1, 0.172549, 1,
-0.3287983, -0.1522931, -1.798948, 0, 1, 0.1764706, 1,
-0.3271779, 2.866374, 0.6899176, 0, 1, 0.1843137, 1,
-0.3233554, 0.2218771, -0.3634309, 0, 1, 0.1882353, 1,
-0.3219788, -0.89549, -3.779415, 0, 1, 0.1960784, 1,
-0.3209501, -1.22297, -3.034898, 0, 1, 0.2039216, 1,
-0.31745, 0.4711764, -0.4916198, 0, 1, 0.2078431, 1,
-0.3174402, 1.159036, -1.263316, 0, 1, 0.2156863, 1,
-0.3159291, -1.46906, -4.112454, 0, 1, 0.2196078, 1,
-0.3128336, 0.779078, -1.315958, 0, 1, 0.227451, 1,
-0.3127937, 1.503875, -1.128678, 0, 1, 0.2313726, 1,
-0.3107619, -0.09952045, -3.12254, 0, 1, 0.2392157, 1,
-0.3085476, 0.06830274, -0.1266998, 0, 1, 0.2431373, 1,
-0.3083187, 0.4129291, 0.04960407, 0, 1, 0.2509804, 1,
-0.3052201, 0.281099, -2.000342, 0, 1, 0.254902, 1,
-0.3037005, -2.011508, -1.764268, 0, 1, 0.2627451, 1,
-0.3032203, 0.9201057, -1.576371, 0, 1, 0.2666667, 1,
-0.2988078, 0.5276238, -0.735611, 0, 1, 0.2745098, 1,
-0.296805, -0.07355921, -1.854948, 0, 1, 0.2784314, 1,
-0.2939845, 0.6446102, 0.3903314, 0, 1, 0.2862745, 1,
-0.293629, 0.162384, 0.2021002, 0, 1, 0.2901961, 1,
-0.2896532, -0.7710735, -2.930363, 0, 1, 0.2980392, 1,
-0.2852506, 1.065016, -0.0347987, 0, 1, 0.3058824, 1,
-0.2838658, 1.165353, -0.02221523, 0, 1, 0.3098039, 1,
-0.2833357, -1.023043, -2.053318, 0, 1, 0.3176471, 1,
-0.2804091, 0.9320155, -0.7120225, 0, 1, 0.3215686, 1,
-0.2800236, 1.423617, -1.714092, 0, 1, 0.3294118, 1,
-0.278368, -0.9863445, -0.9330777, 0, 1, 0.3333333, 1,
-0.27084, 1.644655, -0.02202859, 0, 1, 0.3411765, 1,
-0.2695902, -1.432676, -2.303479, 0, 1, 0.345098, 1,
-0.26941, -0.8153163, -2.413794, 0, 1, 0.3529412, 1,
-0.268234, -0.3598251, -2.769428, 0, 1, 0.3568628, 1,
-0.2670513, -0.4097845, -2.080334, 0, 1, 0.3647059, 1,
-0.261574, 0.09154323, -0.318906, 0, 1, 0.3686275, 1,
-0.2574404, 0.111084, -2.250515, 0, 1, 0.3764706, 1,
-0.2547527, 1.356752, -1.030409, 0, 1, 0.3803922, 1,
-0.2545787, 0.4191318, -1.860391, 0, 1, 0.3882353, 1,
-0.253969, 0.1592224, -1.439051, 0, 1, 0.3921569, 1,
-0.251447, 0.9886514, -0.4260133, 0, 1, 0.4, 1,
-0.2512594, 0.01968317, -1.897229, 0, 1, 0.4078431, 1,
-0.2501948, 0.1415483, -1.877307, 0, 1, 0.4117647, 1,
-0.2469709, 0.101568, -1.948751, 0, 1, 0.4196078, 1,
-0.2459044, 1.392297, 1.799439, 0, 1, 0.4235294, 1,
-0.2448436, 0.4805466, -2.371263, 0, 1, 0.4313726, 1,
-0.2443261, -0.7921351, -4.317185, 0, 1, 0.4352941, 1,
-0.2418272, 2.007846, 0.2678192, 0, 1, 0.4431373, 1,
-0.2406148, 0.7702106, -0.9874285, 0, 1, 0.4470588, 1,
-0.2393434, -0.1361438, -1.09244, 0, 1, 0.454902, 1,
-0.2374645, 0.7009274, -0.925087, 0, 1, 0.4588235, 1,
-0.2314172, 1.771113, 1.028986, 0, 1, 0.4666667, 1,
-0.2265016, -1.468494, -2.099018, 0, 1, 0.4705882, 1,
-0.2262552, -0.2767183, -0.8199544, 0, 1, 0.4784314, 1,
-0.2216253, 0.9091014, -0.1796471, 0, 1, 0.4823529, 1,
-0.2174357, -0.7543119, -2.079456, 0, 1, 0.4901961, 1,
-0.2142983, 0.8855633, 1.282912, 0, 1, 0.4941176, 1,
-0.2136811, -0.5095873, -1.342356, 0, 1, 0.5019608, 1,
-0.2117078, -0.6259729, -2.9785, 0, 1, 0.509804, 1,
-0.2103944, 1.01482, -0.4534579, 0, 1, 0.5137255, 1,
-0.2079253, -0.4224454, -1.127369, 0, 1, 0.5215687, 1,
-0.2066132, -0.5385227, -3.506733, 0, 1, 0.5254902, 1,
-0.2020866, -0.8252125, -2.828394, 0, 1, 0.5333334, 1,
-0.2019297, 0.04360164, -1.773133, 0, 1, 0.5372549, 1,
-0.2003644, 0.8997325, 1.255562, 0, 1, 0.5450981, 1,
-0.1891737, 0.313897, -2.817447, 0, 1, 0.5490196, 1,
-0.1889492, -1.352376, -2.811375, 0, 1, 0.5568628, 1,
-0.1872717, 0.3181453, -0.7180974, 0, 1, 0.5607843, 1,
-0.1867494, 0.8325223, 1.042253, 0, 1, 0.5686275, 1,
-0.1861801, 0.3523837, -0.4009534, 0, 1, 0.572549, 1,
-0.1854677, -0.0600821, -0.4266162, 0, 1, 0.5803922, 1,
-0.1832483, 1.237395, -0.3754995, 0, 1, 0.5843138, 1,
-0.1741225, 0.3243457, 0.9282746, 0, 1, 0.5921569, 1,
-0.173958, 0.9595391, 0.36405, 0, 1, 0.5960785, 1,
-0.1723874, -0.6190038, -2.535545, 0, 1, 0.6039216, 1,
-0.1667867, -0.6822903, -2.639424, 0, 1, 0.6117647, 1,
-0.1661744, -1.588834, -2.786384, 0, 1, 0.6156863, 1,
-0.1617388, 3.012383, 0.6646903, 0, 1, 0.6235294, 1,
-0.1535888, -0.06302939, -2.863142, 0, 1, 0.627451, 1,
-0.1444122, 1.442647, 0.1832955, 0, 1, 0.6352941, 1,
-0.1440503, -0.4919259, -3.130115, 0, 1, 0.6392157, 1,
-0.1435093, -0.694125, -2.213799, 0, 1, 0.6470588, 1,
-0.135736, -0.8514118, -2.523111, 0, 1, 0.6509804, 1,
-0.135603, -0.7190989, -3.047196, 0, 1, 0.6588235, 1,
-0.1344362, 0.4483543, -0.5927147, 0, 1, 0.6627451, 1,
-0.1204103, 0.03213682, -1.513454, 0, 1, 0.6705883, 1,
-0.1202399, 0.4641646, 0.1054113, 0, 1, 0.6745098, 1,
-0.1192149, -1.938573, -3.625179, 0, 1, 0.682353, 1,
-0.1146617, -0.2120783, -2.451931, 0, 1, 0.6862745, 1,
-0.1144494, 0.5352031, -1.144091, 0, 1, 0.6941177, 1,
-0.1138429, -1.617871, -1.849198, 0, 1, 0.7019608, 1,
-0.1128942, -0.09820428, -2.603192, 0, 1, 0.7058824, 1,
-0.1126347, 0.9469669, -1.120867, 0, 1, 0.7137255, 1,
-0.1091149, 0.4611618, -0.7059989, 0, 1, 0.7176471, 1,
-0.1070969, -0.6934745, -3.230049, 0, 1, 0.7254902, 1,
-0.1043165, 0.1049875, -1.122602, 0, 1, 0.7294118, 1,
-0.1034089, 0.3034991, -0.4364473, 0, 1, 0.7372549, 1,
-0.1022197, 0.02846848, -0.904265, 0, 1, 0.7411765, 1,
-0.09660218, -0.3201514, -2.660142, 0, 1, 0.7490196, 1,
-0.09546591, 1.174309, -0.9094246, 0, 1, 0.7529412, 1,
-0.09336878, -0.1400781, -2.944463, 0, 1, 0.7607843, 1,
-0.09279943, -0.907114, -4.066527, 0, 1, 0.7647059, 1,
-0.09085467, -0.376893, -4.681203, 0, 1, 0.772549, 1,
-0.08835766, 0.1076359, -1.947351, 0, 1, 0.7764706, 1,
-0.08605059, 0.01213507, -1.127511, 0, 1, 0.7843137, 1,
-0.08590627, 0.0327889, -0.905951, 0, 1, 0.7882353, 1,
-0.07779367, -1.049818, -3.525678, 0, 1, 0.7960784, 1,
-0.0774339, 1.023889, -1.882465, 0, 1, 0.8039216, 1,
-0.07395429, 0.3187923, -2.07872, 0, 1, 0.8078431, 1,
-0.07326017, -0.01945124, 0.08072358, 0, 1, 0.8156863, 1,
-0.07176656, 0.2791544, -1.038859, 0, 1, 0.8196079, 1,
-0.07135384, -0.7509753, -3.662186, 0, 1, 0.827451, 1,
-0.06767575, 0.3200402, 0.7773787, 0, 1, 0.8313726, 1,
-0.06472521, -0.3726141, -3.070418, 0, 1, 0.8392157, 1,
-0.06396239, -0.7763416, -3.692921, 0, 1, 0.8431373, 1,
-0.06364811, -0.4410063, -2.844032, 0, 1, 0.8509804, 1,
-0.06194647, 1.262209, -0.2249562, 0, 1, 0.854902, 1,
-0.0593075, -1.200798, -1.750053, 0, 1, 0.8627451, 1,
-0.05751495, 0.9555271, 2.226444, 0, 1, 0.8666667, 1,
-0.0544817, -0.6188861, -4.478034, 0, 1, 0.8745098, 1,
-0.05346381, 1.968632, 0.08868255, 0, 1, 0.8784314, 1,
-0.04950552, 0.421285, -0.420013, 0, 1, 0.8862745, 1,
-0.04853798, 1.197771, 0.6717932, 0, 1, 0.8901961, 1,
-0.04826389, 0.7122961, 0.3426683, 0, 1, 0.8980392, 1,
-0.04657871, -0.6139451, -3.87817, 0, 1, 0.9058824, 1,
-0.04573658, 1.400713, 0.1218036, 0, 1, 0.9098039, 1,
-0.04468951, 0.1358283, -0.6538624, 0, 1, 0.9176471, 1,
-0.04315701, -0.09422681, -0.2962599, 0, 1, 0.9215686, 1,
-0.0397757, -0.2191559, -1.579803, 0, 1, 0.9294118, 1,
-0.0379291, -1.500821, -3.717881, 0, 1, 0.9333333, 1,
-0.03660716, 0.7390354, -0.4185397, 0, 1, 0.9411765, 1,
-0.03570598, 1.298772, -0.5247301, 0, 1, 0.945098, 1,
-0.03414225, 0.7555404, -0.6533265, 0, 1, 0.9529412, 1,
-0.03375183, -1.26957, -3.524461, 0, 1, 0.9568627, 1,
-0.03362402, 0.7834641, 0.2091309, 0, 1, 0.9647059, 1,
-0.03130947, 0.5573319, 0.9272358, 0, 1, 0.9686275, 1,
-0.03087871, -0.6172283, -3.625763, 0, 1, 0.9764706, 1,
-0.02789235, -0.2809643, -2.960839, 0, 1, 0.9803922, 1,
-0.02765582, -2.439571, -2.478198, 0, 1, 0.9882353, 1,
-0.02604279, -0.3342187, -3.112712, 0, 1, 0.9921569, 1,
-0.0239687, 0.9481576, 0.009106024, 0, 1, 1, 1,
-0.02165272, 0.8122477, 0.1973563, 0, 0.9921569, 1, 1,
-0.01883368, -0.5258113, -2.368905, 0, 0.9882353, 1, 1,
-0.007354991, 1.580471, -0.06860802, 0, 0.9803922, 1, 1,
-0.004918405, -0.6547791, -3.225163, 0, 0.9764706, 1, 1,
-0.00269259, 0.8256748, -0.04012334, 0, 0.9686275, 1, 1,
-0.002611246, -0.5903915, -4.176471, 0, 0.9647059, 1, 1,
-0.0009063942, -1.173398, -4.23692, 0, 0.9568627, 1, 1,
0.003469686, -0.8352687, 2.868277, 0, 0.9529412, 1, 1,
0.007009734, -0.3352034, 2.151605, 0, 0.945098, 1, 1,
0.007542079, 1.58171, 0.3166978, 0, 0.9411765, 1, 1,
0.00963236, -0.3341019, 2.033358, 0, 0.9333333, 1, 1,
0.01235117, 0.1218783, 1.959684, 0, 0.9294118, 1, 1,
0.01281876, 0.144507, 0.8751236, 0, 0.9215686, 1, 1,
0.01415898, -1.344943, 3.402285, 0, 0.9176471, 1, 1,
0.02203418, -1.031096, 1.62834, 0, 0.9098039, 1, 1,
0.02823537, -0.6205728, 3.213108, 0, 0.9058824, 1, 1,
0.02843703, 0.8552765, 1.153705, 0, 0.8980392, 1, 1,
0.03104685, -1.146606, 0.9706979, 0, 0.8901961, 1, 1,
0.03608804, -0.4224524, 1.247073, 0, 0.8862745, 1, 1,
0.03642708, -0.3556639, 3.854221, 0, 0.8784314, 1, 1,
0.03674637, -1.449491, 2.656759, 0, 0.8745098, 1, 1,
0.03921891, -0.1293354, 2.964661, 0, 0.8666667, 1, 1,
0.04204465, 2.286036, -0.04051912, 0, 0.8627451, 1, 1,
0.04775541, 0.2490465, 0.3786147, 0, 0.854902, 1, 1,
0.04917238, -0.7381402, 2.738142, 0, 0.8509804, 1, 1,
0.05127775, 1.348083, -1.050539, 0, 0.8431373, 1, 1,
0.05903966, -1.952438, 2.811056, 0, 0.8392157, 1, 1,
0.06235936, -1.278404, 3.576025, 0, 0.8313726, 1, 1,
0.069122, 0.4366096, 0.8779764, 0, 0.827451, 1, 1,
0.06990574, -0.4247837, 3.817233, 0, 0.8196079, 1, 1,
0.07437827, 1.59231, -0.9138372, 0, 0.8156863, 1, 1,
0.0770926, 0.08747459, 2.25091, 0, 0.8078431, 1, 1,
0.08051628, -0.08878648, 3.664572, 0, 0.8039216, 1, 1,
0.08374544, -1.361879, 4.957368, 0, 0.7960784, 1, 1,
0.08395146, 0.164787, 1.289248, 0, 0.7882353, 1, 1,
0.08556364, -1.340043, 3.219746, 0, 0.7843137, 1, 1,
0.0910133, 0.7657762, 1.589823, 0, 0.7764706, 1, 1,
0.09262189, 1.082564, 0.1295534, 0, 0.772549, 1, 1,
0.09526835, -1.24653, 3.958492, 0, 0.7647059, 1, 1,
0.09708853, -0.4821301, 3.018882, 0, 0.7607843, 1, 1,
0.09716381, -0.3071219, 1.9795, 0, 0.7529412, 1, 1,
0.09834893, 0.4146577, 0.4442336, 0, 0.7490196, 1, 1,
0.1046058, -1.301227, 2.932121, 0, 0.7411765, 1, 1,
0.1049344, -1.021317, 3.226748, 0, 0.7372549, 1, 1,
0.1068972, -1.237065, 1.023388, 0, 0.7294118, 1, 1,
0.1099541, 0.8022113, 0.6852406, 0, 0.7254902, 1, 1,
0.1130459, -0.6307799, 3.326023, 0, 0.7176471, 1, 1,
0.11645, 0.3001452, 1.183488, 0, 0.7137255, 1, 1,
0.1172574, 0.159337, -0.1943658, 0, 0.7058824, 1, 1,
0.1191348, -1.443036, 1.780497, 0, 0.6980392, 1, 1,
0.1208973, 0.4776774, 1.004756, 0, 0.6941177, 1, 1,
0.1225598, 0.05490118, 1.681362, 0, 0.6862745, 1, 1,
0.1239813, -0.04278674, 1.372818, 0, 0.682353, 1, 1,
0.1297268, -0.6976864, 1.929062, 0, 0.6745098, 1, 1,
0.1314883, 0.9561611, -0.2290241, 0, 0.6705883, 1, 1,
0.1342136, -0.6176116, 3.37598, 0, 0.6627451, 1, 1,
0.1398748, 0.7961106, -1.249544, 0, 0.6588235, 1, 1,
0.1414664, 0.6341184, -0.7307988, 0, 0.6509804, 1, 1,
0.1430533, 0.6816144, 0.1723262, 0, 0.6470588, 1, 1,
0.1432465, 0.7583649, 0.5344439, 0, 0.6392157, 1, 1,
0.1504, -1.196159, 3.255194, 0, 0.6352941, 1, 1,
0.1564047, 0.4179262, 0.6622976, 0, 0.627451, 1, 1,
0.1581492, 0.8245011, -0.1397624, 0, 0.6235294, 1, 1,
0.1620716, 0.5529225, 1.439794, 0, 0.6156863, 1, 1,
0.1649569, -1.158044, 1.596642, 0, 0.6117647, 1, 1,
0.1665621, -0.801029, 3.455462, 0, 0.6039216, 1, 1,
0.1688976, -1.500162, 3.42526, 0, 0.5960785, 1, 1,
0.1690917, 0.4549244, -0.1604908, 0, 0.5921569, 1, 1,
0.1731603, -0.7582862, 2.558654, 0, 0.5843138, 1, 1,
0.174369, 0.02628175, 1.54433, 0, 0.5803922, 1, 1,
0.1752963, -0.2005858, 2.296983, 0, 0.572549, 1, 1,
0.1758889, -1.582715, 3.311118, 0, 0.5686275, 1, 1,
0.1775454, -0.6069397, 2.948257, 0, 0.5607843, 1, 1,
0.1820816, 0.9271445, 0.9375494, 0, 0.5568628, 1, 1,
0.1842853, 0.2495488, 1.2206, 0, 0.5490196, 1, 1,
0.1855408, 1.269484, 1.009231, 0, 0.5450981, 1, 1,
0.1890437, 0.521817, -1.189656, 0, 0.5372549, 1, 1,
0.1892388, -1.66251, 1.810961, 0, 0.5333334, 1, 1,
0.1919154, 0.5078939, 0.4962923, 0, 0.5254902, 1, 1,
0.1924826, 1.561361, 0.6139158, 0, 0.5215687, 1, 1,
0.1960509, -1.068244, 3.0904, 0, 0.5137255, 1, 1,
0.1967641, -1.729948, 1.929225, 0, 0.509804, 1, 1,
0.2063206, -0.515313, 2.600316, 0, 0.5019608, 1, 1,
0.2080749, -0.1092534, 1.770785, 0, 0.4941176, 1, 1,
0.2081949, 0.6358576, 1.962685, 0, 0.4901961, 1, 1,
0.217476, -1.869633, 3.130232, 0, 0.4823529, 1, 1,
0.2176665, -1.081598, 2.909451, 0, 0.4784314, 1, 1,
0.2186987, 0.5053586, 0.6912162, 0, 0.4705882, 1, 1,
0.2357757, -0.4325709, 3.961175, 0, 0.4666667, 1, 1,
0.236791, -0.6864787, 3.488158, 0, 0.4588235, 1, 1,
0.2369324, -0.1405126, 2.843904, 0, 0.454902, 1, 1,
0.23721, 1.022549, -0.2801949, 0, 0.4470588, 1, 1,
0.2385381, 0.114658, 1.625486, 0, 0.4431373, 1, 1,
0.2409222, -1.313547, 3.919457, 0, 0.4352941, 1, 1,
0.2418767, 1.608375, -1.429282, 0, 0.4313726, 1, 1,
0.2438362, -0.1653717, 1.378997, 0, 0.4235294, 1, 1,
0.2456287, -0.5784122, 2.819309, 0, 0.4196078, 1, 1,
0.2490586, -0.6963102, 3.313165, 0, 0.4117647, 1, 1,
0.2544613, -0.48467, 3.726154, 0, 0.4078431, 1, 1,
0.2547862, -3.025711, 3.266985, 0, 0.4, 1, 1,
0.2567102, -1.068054, 2.868736, 0, 0.3921569, 1, 1,
0.2582602, -0.5565888, 3.70626, 0, 0.3882353, 1, 1,
0.2586771, -1.404938, 3.239564, 0, 0.3803922, 1, 1,
0.2597556, -0.04235436, 2.106819, 0, 0.3764706, 1, 1,
0.2662587, -0.9999576, 3.214095, 0, 0.3686275, 1, 1,
0.2690887, 0.09527678, 1.197211, 0, 0.3647059, 1, 1,
0.2695902, 0.1532549, 1.40603, 0, 0.3568628, 1, 1,
0.2725195, -0.7513345, 3.83433, 0, 0.3529412, 1, 1,
0.2763227, -2.066484, 2.938884, 0, 0.345098, 1, 1,
0.2773932, 0.3720501, 0.6108897, 0, 0.3411765, 1, 1,
0.2891346, -0.4026366, 3.369875, 0, 0.3333333, 1, 1,
0.2903167, 0.1388287, -0.3863745, 0, 0.3294118, 1, 1,
0.2916318, 2.175124, 1.361276, 0, 0.3215686, 1, 1,
0.2929236, 1.886858, 0.2217306, 0, 0.3176471, 1, 1,
0.2960347, 1.255535, -0.02663835, 0, 0.3098039, 1, 1,
0.2990376, -1.112563, 3.021399, 0, 0.3058824, 1, 1,
0.2994945, 0.5095844, -0.3549466, 0, 0.2980392, 1, 1,
0.3050721, -0.2652677, 3.667799, 0, 0.2901961, 1, 1,
0.3086376, -0.425847, 2.717032, 0, 0.2862745, 1, 1,
0.3098952, -0.246302, 2.006445, 0, 0.2784314, 1, 1,
0.3117455, 0.6118926, 1.118359, 0, 0.2745098, 1, 1,
0.3190849, 0.7817051, 0.1535224, 0, 0.2666667, 1, 1,
0.3206702, 0.04491258, 0.3380607, 0, 0.2627451, 1, 1,
0.3228873, 0.7876154, 0.5720568, 0, 0.254902, 1, 1,
0.3254999, -2.441764, 4.375477, 0, 0.2509804, 1, 1,
0.3376325, -0.954163, 3.344075, 0, 0.2431373, 1, 1,
0.3407415, 0.3828304, 1.591865, 0, 0.2392157, 1, 1,
0.3463411, 0.8994138, -1.402174, 0, 0.2313726, 1, 1,
0.3478423, -0.2091485, 4.389906, 0, 0.227451, 1, 1,
0.3481476, 0.2171418, 0.7205879, 0, 0.2196078, 1, 1,
0.3493899, -0.4426955, 3.128017, 0, 0.2156863, 1, 1,
0.3505271, 0.616705, -1.160363, 0, 0.2078431, 1, 1,
0.3513627, 0.3733309, -0.2156139, 0, 0.2039216, 1, 1,
0.3516229, 0.4746341, 1.838968, 0, 0.1960784, 1, 1,
0.3576279, 0.5244516, 1.377132, 0, 0.1882353, 1, 1,
0.367429, 0.8995308, 0.08011215, 0, 0.1843137, 1, 1,
0.3693753, 0.238977, 1.613885, 0, 0.1764706, 1, 1,
0.3708368, -0.7907879, 2.92863, 0, 0.172549, 1, 1,
0.3718339, 0.4049466, 0.2745557, 0, 0.1647059, 1, 1,
0.375161, 0.4124292, 1.525397, 0, 0.1607843, 1, 1,
0.3780009, 0.2493715, 1.255191, 0, 0.1529412, 1, 1,
0.3806235, -2.036014, 3.786491, 0, 0.1490196, 1, 1,
0.3855356, -0.9885054, 1.503257, 0, 0.1411765, 1, 1,
0.3857669, 0.4006147, 1.607241, 0, 0.1372549, 1, 1,
0.3899637, 0.241453, 0.5280672, 0, 0.1294118, 1, 1,
0.3905746, -0.8674342, 1.955513, 0, 0.1254902, 1, 1,
0.3909026, 0.1824744, 0.9684267, 0, 0.1176471, 1, 1,
0.391039, -1.215196, 2.004872, 0, 0.1137255, 1, 1,
0.3918467, 0.4397735, 1.825222, 0, 0.1058824, 1, 1,
0.3927838, 0.06791891, 1.537919, 0, 0.09803922, 1, 1,
0.3929273, 1.520174, -0.2661428, 0, 0.09411765, 1, 1,
0.3933669, -1.420823, 2.996056, 0, 0.08627451, 1, 1,
0.4050191, 1.03931, -1.380605, 0, 0.08235294, 1, 1,
0.4059011, -0.05687433, 1.66814, 0, 0.07450981, 1, 1,
0.4060658, -1.387943, 3.071744, 0, 0.07058824, 1, 1,
0.4075227, -1.676556, 4.161913, 0, 0.0627451, 1, 1,
0.4145758, -0.002917055, 1.903556, 0, 0.05882353, 1, 1,
0.4147791, 0.2030975, 2.531011, 0, 0.05098039, 1, 1,
0.4172412, -0.8918541, 0.7771158, 0, 0.04705882, 1, 1,
0.4183966, 0.4475912, 0.8527169, 0, 0.03921569, 1, 1,
0.4201022, 0.2403321, -0.07371951, 0, 0.03529412, 1, 1,
0.4216789, 1.119184, -0.5012583, 0, 0.02745098, 1, 1,
0.4216996, 0.3463701, 0.1042596, 0, 0.02352941, 1, 1,
0.4226168, 0.6537297, -0.2103422, 0, 0.01568628, 1, 1,
0.4228356, 0.8893383, 1.284361, 0, 0.01176471, 1, 1,
0.4229331, 0.3838993, 0.6197431, 0, 0.003921569, 1, 1,
0.4253818, -0.06978192, 2.108502, 0.003921569, 0, 1, 1,
0.4389382, 0.1467138, 1.073991, 0.007843138, 0, 1, 1,
0.4423304, -0.4518423, 1.053719, 0.01568628, 0, 1, 1,
0.4497241, -0.2775452, 3.524672, 0.01960784, 0, 1, 1,
0.4529051, 1.06444, -0.7790784, 0.02745098, 0, 1, 1,
0.4552291, 1.20006, -0.1851327, 0.03137255, 0, 1, 1,
0.4569764, -1.53484, 2.30672, 0.03921569, 0, 1, 1,
0.4640842, 0.4094584, 0.02566967, 0.04313726, 0, 1, 1,
0.4657361, 0.06806555, 1.713924, 0.05098039, 0, 1, 1,
0.4676052, -1.842153, 1.261985, 0.05490196, 0, 1, 1,
0.47058, -1.361893, 2.285933, 0.0627451, 0, 1, 1,
0.4838406, 0.1488585, 3.215539, 0.06666667, 0, 1, 1,
0.4857763, 0.6706867, -1.136461, 0.07450981, 0, 1, 1,
0.4907289, 0.5225325, -0.3504515, 0.07843138, 0, 1, 1,
0.4938236, 1.415084, 2.011764, 0.08627451, 0, 1, 1,
0.4952613, -0.2470615, 2.580942, 0.09019608, 0, 1, 1,
0.498154, -1.048392, 3.302117, 0.09803922, 0, 1, 1,
0.5083635, -1.035746, 1.56218, 0.1058824, 0, 1, 1,
0.5100552, -0.8290675, 3.960069, 0.1098039, 0, 1, 1,
0.512536, 0.01260008, 0.8797001, 0.1176471, 0, 1, 1,
0.5140017, 1.094394, 0.8079548, 0.1215686, 0, 1, 1,
0.5156115, 0.2489775, 1.577963, 0.1294118, 0, 1, 1,
0.517639, -1.046535, 3.226058, 0.1333333, 0, 1, 1,
0.5184362, -0.9537174, 3.170115, 0.1411765, 0, 1, 1,
0.5239419, -0.2086743, 2.808883, 0.145098, 0, 1, 1,
0.5261459, 1.376378, 0.7170253, 0.1529412, 0, 1, 1,
0.527528, -1.12907, 3.363898, 0.1568628, 0, 1, 1,
0.5280728, -0.4120028, 2.155418, 0.1647059, 0, 1, 1,
0.528674, -0.02533832, 0.4812956, 0.1686275, 0, 1, 1,
0.5303158, 0.1362689, 0.3546946, 0.1764706, 0, 1, 1,
0.5310194, 0.1441044, 0.02599012, 0.1803922, 0, 1, 1,
0.5335741, -0.1510842, 2.433033, 0.1882353, 0, 1, 1,
0.5345581, -0.01521431, 1.204048, 0.1921569, 0, 1, 1,
0.5391919, -0.6501283, 1.73297, 0.2, 0, 1, 1,
0.5435973, -0.7741725, 3.476849, 0.2078431, 0, 1, 1,
0.5497015, 1.423915, 1.42858, 0.2117647, 0, 1, 1,
0.5499187, 0.4392655, 0.3246909, 0.2196078, 0, 1, 1,
0.5522205, -0.1298421, -0.1472656, 0.2235294, 0, 1, 1,
0.5551767, -0.3408031, 2.805681, 0.2313726, 0, 1, 1,
0.5606982, -0.3957061, 1.649371, 0.2352941, 0, 1, 1,
0.5618867, -0.03882876, -0.1830907, 0.2431373, 0, 1, 1,
0.562583, -0.828, 0.6261, 0.2470588, 0, 1, 1,
0.5671102, -0.8675846, 4.283508, 0.254902, 0, 1, 1,
0.5730634, 0.8476974, -0.004958425, 0.2588235, 0, 1, 1,
0.5791702, 0.02280783, 0.4862315, 0.2666667, 0, 1, 1,
0.5867452, 0.7296566, -0.5360097, 0.2705882, 0, 1, 1,
0.5877659, 0.2829398, -0.3645323, 0.2784314, 0, 1, 1,
0.5920261, -0.2674495, 4.536199, 0.282353, 0, 1, 1,
0.5924994, 0.7864473, 0.8144032, 0.2901961, 0, 1, 1,
0.5939463, -0.4614914, 2.818182, 0.2941177, 0, 1, 1,
0.594449, 0.09892756, 1.49777, 0.3019608, 0, 1, 1,
0.5948693, 2.37479, -1.302774, 0.3098039, 0, 1, 1,
0.5952733, -1.059545, 1.630271, 0.3137255, 0, 1, 1,
0.5975699, 0.3132964, 1.178114, 0.3215686, 0, 1, 1,
0.6126345, -0.733925, 1.926747, 0.3254902, 0, 1, 1,
0.614194, 0.2650086, 0.5484491, 0.3333333, 0, 1, 1,
0.6176701, -0.05391283, 1.741329, 0.3372549, 0, 1, 1,
0.6246535, -1.067593, 1.70925, 0.345098, 0, 1, 1,
0.6267091, -1.680381, 3.962499, 0.3490196, 0, 1, 1,
0.6274793, 1.42921, 0.4542916, 0.3568628, 0, 1, 1,
0.6315165, -0.5315413, 2.244347, 0.3607843, 0, 1, 1,
0.6317983, -0.9462123, 2.185808, 0.3686275, 0, 1, 1,
0.63384, 0.2826124, 1.180836, 0.372549, 0, 1, 1,
0.6338504, -0.004023078, 1.153493, 0.3803922, 0, 1, 1,
0.6417697, -1.327565, 2.725398, 0.3843137, 0, 1, 1,
0.6443683, 0.229679, 1.88639, 0.3921569, 0, 1, 1,
0.6456774, -2.280128, 4.599475, 0.3960784, 0, 1, 1,
0.6457648, -0.05838903, 1.201593, 0.4039216, 0, 1, 1,
0.6605673, 0.997662, 0.8353973, 0.4117647, 0, 1, 1,
0.6618788, -0.3543016, 2.563036, 0.4156863, 0, 1, 1,
0.6655165, 1.551749, 0.4106538, 0.4235294, 0, 1, 1,
0.6673387, 1.392756, 0.04114677, 0.427451, 0, 1, 1,
0.6705908, 1.182131, 2.594857, 0.4352941, 0, 1, 1,
0.6764529, 0.5875211, -0.2248004, 0.4392157, 0, 1, 1,
0.6796017, -1.616062, 3.630756, 0.4470588, 0, 1, 1,
0.6810681, 0.8064178, 0.5263312, 0.4509804, 0, 1, 1,
0.6877971, -0.4740717, 2.603152, 0.4588235, 0, 1, 1,
0.6915833, 0.5520813, 0.7570882, 0.4627451, 0, 1, 1,
0.6946992, 1.048626, 1.493548, 0.4705882, 0, 1, 1,
0.6995514, -0.5931718, 1.974706, 0.4745098, 0, 1, 1,
0.7043069, -0.1522641, 2.352799, 0.4823529, 0, 1, 1,
0.7070434, -1.008426, 2.831134, 0.4862745, 0, 1, 1,
0.7083974, 0.2940069, 2.186547, 0.4941176, 0, 1, 1,
0.7086875, -0.6747354, 2.469338, 0.5019608, 0, 1, 1,
0.7101299, 1.388329, -0.05425159, 0.5058824, 0, 1, 1,
0.7106284, -0.05895971, 3.421252, 0.5137255, 0, 1, 1,
0.7110664, -1.466433, 1.773099, 0.5176471, 0, 1, 1,
0.7115352, -0.08253865, 3.147574, 0.5254902, 0, 1, 1,
0.7192304, 0.9363649, 1.771957, 0.5294118, 0, 1, 1,
0.7211014, 0.09722681, -0.9116282, 0.5372549, 0, 1, 1,
0.7214655, 1.707621, 1.508882, 0.5411765, 0, 1, 1,
0.7231708, -0.157522, 0.1182799, 0.5490196, 0, 1, 1,
0.7240714, -0.7314768, 2.978088, 0.5529412, 0, 1, 1,
0.7300103, -0.1797637, 2.650743, 0.5607843, 0, 1, 1,
0.7329187, -0.7028363, 2.409606, 0.5647059, 0, 1, 1,
0.7345024, 1.59719, 0.1216773, 0.572549, 0, 1, 1,
0.7354351, -1.093238, 3.007293, 0.5764706, 0, 1, 1,
0.7367605, -0.6214412, 3.151287, 0.5843138, 0, 1, 1,
0.7378645, 1.258619, -1.477933, 0.5882353, 0, 1, 1,
0.7389657, -2.246312, 1.589465, 0.5960785, 0, 1, 1,
0.7405113, -1.377461, 2.797073, 0.6039216, 0, 1, 1,
0.7408096, 0.689507, 0.1701746, 0.6078432, 0, 1, 1,
0.741714, 0.3462632, 3.184228, 0.6156863, 0, 1, 1,
0.7461702, 0.3550468, 1.743129, 0.6196079, 0, 1, 1,
0.7533654, -0.7700768, 1.250668, 0.627451, 0, 1, 1,
0.7540768, -1.191451, 3.303411, 0.6313726, 0, 1, 1,
0.7584041, -0.8441703, 2.288665, 0.6392157, 0, 1, 1,
0.7593863, -1.128947, 0.7147081, 0.6431373, 0, 1, 1,
0.7598688, -1.184177, 2.699639, 0.6509804, 0, 1, 1,
0.7642087, -0.006894003, 2.037804, 0.654902, 0, 1, 1,
0.7677693, 0.9512238, 1.395665, 0.6627451, 0, 1, 1,
0.7783954, 0.4899236, 0.4553596, 0.6666667, 0, 1, 1,
0.7805638, 1.130612, -0.9785361, 0.6745098, 0, 1, 1,
0.7818801, 0.2812861, 3.581631, 0.6784314, 0, 1, 1,
0.7968873, -0.7468941, 2.800289, 0.6862745, 0, 1, 1,
0.7988867, 0.3074247, 1.490272, 0.6901961, 0, 1, 1,
0.8145056, 0.2070317, 2.44737, 0.6980392, 0, 1, 1,
0.8148096, -1.062474, 3.320004, 0.7058824, 0, 1, 1,
0.8256401, 0.2975553, 2.051796, 0.7098039, 0, 1, 1,
0.8263202, -0.1775592, 1.380204, 0.7176471, 0, 1, 1,
0.8307901, 0.03854616, 0.9712383, 0.7215686, 0, 1, 1,
0.8365814, -0.6240748, 2.683283, 0.7294118, 0, 1, 1,
0.8395049, -0.8269173, 0.9029617, 0.7333333, 0, 1, 1,
0.8465902, -0.5825319, 2.42539, 0.7411765, 0, 1, 1,
0.8514715, -0.5299782, 1.05718, 0.7450981, 0, 1, 1,
0.8521563, -0.4847188, 1.239399, 0.7529412, 0, 1, 1,
0.8609048, 0.09940763, 2.356639, 0.7568628, 0, 1, 1,
0.8639979, -0.2988418, 0.7234007, 0.7647059, 0, 1, 1,
0.867743, 0.2343922, 0.3784142, 0.7686275, 0, 1, 1,
0.8810081, 0.9917731, 1.477193, 0.7764706, 0, 1, 1,
0.8982701, 2.22545, -0.5959395, 0.7803922, 0, 1, 1,
0.9008998, -1.352842, 3.058838, 0.7882353, 0, 1, 1,
0.9017951, 1.536979, 0.864237, 0.7921569, 0, 1, 1,
0.912619, 1.228095, 0.6165968, 0.8, 0, 1, 1,
0.9139559, -0.02603734, 2.480462, 0.8078431, 0, 1, 1,
0.9223447, 1.459128, 2.252556, 0.8117647, 0, 1, 1,
0.9230992, -1.076367, 2.654283, 0.8196079, 0, 1, 1,
0.9274125, -0.5303044, 3.814279, 0.8235294, 0, 1, 1,
0.9289004, 0.09321116, 2.738062, 0.8313726, 0, 1, 1,
0.9496223, 1.71399, 1.890502, 0.8352941, 0, 1, 1,
0.9507582, 1.500311, 0.05754784, 0.8431373, 0, 1, 1,
0.9531956, -0.3198774, 2.518518, 0.8470588, 0, 1, 1,
0.9545119, 0.5966685, 0.7153844, 0.854902, 0, 1, 1,
0.9568754, 0.9316506, -0.5930987, 0.8588235, 0, 1, 1,
0.9661206, 0.02974879, 1.517905, 0.8666667, 0, 1, 1,
0.9668303, 0.1334886, 2.989026, 0.8705882, 0, 1, 1,
0.9684353, -0.7598633, 2.226778, 0.8784314, 0, 1, 1,
0.9716021, 0.949305, 0.5141599, 0.8823529, 0, 1, 1,
0.9737736, -1.186598, 3.200022, 0.8901961, 0, 1, 1,
0.9826406, -1.99797, 4.559891, 0.8941177, 0, 1, 1,
0.9833134, 0.9985133, 0.9754061, 0.9019608, 0, 1, 1,
0.9837517, -0.02181941, 2.437957, 0.9098039, 0, 1, 1,
0.9844454, 1.305867, 0.6280631, 0.9137255, 0, 1, 1,
0.9853937, -0.550942, 2.021746, 0.9215686, 0, 1, 1,
0.9920058, -0.1660119, 0.848161, 0.9254902, 0, 1, 1,
0.9956219, -2.4496, 1.956556, 0.9333333, 0, 1, 1,
0.9957874, -0.6842873, 3.677247, 0.9372549, 0, 1, 1,
0.9963084, -0.4634158, 0.762663, 0.945098, 0, 1, 1,
0.9963132, 0.01114994, 1.651444, 0.9490196, 0, 1, 1,
0.998815, 1.496347, 1.808172, 0.9568627, 0, 1, 1,
1.00527, -0.7189409, 3.366328, 0.9607843, 0, 1, 1,
1.010929, 0.2385731, -0.789103, 0.9686275, 0, 1, 1,
1.011191, 1.481141, 0.257886, 0.972549, 0, 1, 1,
1.011285, -0.5171482, 3.138727, 0.9803922, 0, 1, 1,
1.018401, -1.111618, 1.986375, 0.9843137, 0, 1, 1,
1.029279, -1.459332, 1.733192, 0.9921569, 0, 1, 1,
1.037138, -0.1991383, 1.424242, 0.9960784, 0, 1, 1,
1.046354, 0.8960342, 2.074447, 1, 0, 0.9960784, 1,
1.049972, 0.711938, 0.7991109, 1, 0, 0.9882353, 1,
1.052491, -0.1407742, 0.5199215, 1, 0, 0.9843137, 1,
1.058058, 0.1578191, 1.242122, 1, 0, 0.9764706, 1,
1.062129, -0.9035253, 1.959962, 1, 0, 0.972549, 1,
1.066571, 0.007186206, 0.9941707, 1, 0, 0.9647059, 1,
1.069306, 0.3305006, 0.4349332, 1, 0, 0.9607843, 1,
1.076865, -1.411277, 2.065706, 1, 0, 0.9529412, 1,
1.079419, -0.8436347, 2.352552, 1, 0, 0.9490196, 1,
1.086183, 0.1985713, 1.300364, 1, 0, 0.9411765, 1,
1.099427, -0.02179686, 2.421803, 1, 0, 0.9372549, 1,
1.10417, -0.02319699, 2.197583, 1, 0, 0.9294118, 1,
1.105858, -0.1664089, 0.6094739, 1, 0, 0.9254902, 1,
1.108781, -1.092618, 2.703019, 1, 0, 0.9176471, 1,
1.109557, -0.4820624, 1.346595, 1, 0, 0.9137255, 1,
1.110163, 0.6777093, 1.264878, 1, 0, 0.9058824, 1,
1.110723, -0.6478435, 3.056564, 1, 0, 0.9019608, 1,
1.112702, 0.08816936, -0.2349622, 1, 0, 0.8941177, 1,
1.114438, -0.8812871, 3.54879, 1, 0, 0.8862745, 1,
1.119584, -0.9811543, 2.828933, 1, 0, 0.8823529, 1,
1.127861, -0.7907977, 3.979043, 1, 0, 0.8745098, 1,
1.128621, 0.05244365, 2.50943, 1, 0, 0.8705882, 1,
1.128998, 0.5088219, 2.553554, 1, 0, 0.8627451, 1,
1.12907, -1.282606, 2.553652, 1, 0, 0.8588235, 1,
1.140019, -0.8881646, 2.275264, 1, 0, 0.8509804, 1,
1.142755, -1.229603, 3.78781, 1, 0, 0.8470588, 1,
1.144273, -0.5143168, 0.850851, 1, 0, 0.8392157, 1,
1.151111, -0.4266178, 1.978461, 1, 0, 0.8352941, 1,
1.151672, -1.852392, 0.9688857, 1, 0, 0.827451, 1,
1.155039, -1.87795, 2.004081, 1, 0, 0.8235294, 1,
1.158882, 0.8286641, 1.673045, 1, 0, 0.8156863, 1,
1.161473, -0.3821114, 1.346655, 1, 0, 0.8117647, 1,
1.164171, -1.0016, 4.02018, 1, 0, 0.8039216, 1,
1.182829, -0.6405959, 1.153727, 1, 0, 0.7960784, 1,
1.184536, 0.7746865, 0.5495365, 1, 0, 0.7921569, 1,
1.197826, 1.254865, 0.8340366, 1, 0, 0.7843137, 1,
1.211742, 0.2324993, 1.723524, 1, 0, 0.7803922, 1,
1.216118, 0.7954813, 0.7717088, 1, 0, 0.772549, 1,
1.219585, 0.5551947, -0.1457116, 1, 0, 0.7686275, 1,
1.229286, -0.2725332, 4.405031, 1, 0, 0.7607843, 1,
1.234642, -0.9189684, 2.361354, 1, 0, 0.7568628, 1,
1.238164, -0.8489252, 2.682195, 1, 0, 0.7490196, 1,
1.238375, 0.0986228, 2.230492, 1, 0, 0.7450981, 1,
1.246569, 1.289709, 0.7630633, 1, 0, 0.7372549, 1,
1.250383, -2.112456, 1.692014, 1, 0, 0.7333333, 1,
1.25172, -1.05684, 2.308293, 1, 0, 0.7254902, 1,
1.258295, -0.1330195, 2.228859, 1, 0, 0.7215686, 1,
1.260634, 0.9853505, 1.617464, 1, 0, 0.7137255, 1,
1.263082, -0.4832684, 1.484432, 1, 0, 0.7098039, 1,
1.275527, 0.7866351, 1.905753, 1, 0, 0.7019608, 1,
1.286683, -0.4421523, 2.939848, 1, 0, 0.6941177, 1,
1.288701, 0.2053327, 1.480156, 1, 0, 0.6901961, 1,
1.30132, 0.8699944, -0.3354941, 1, 0, 0.682353, 1,
1.303741, 0.99651, 1.267975, 1, 0, 0.6784314, 1,
1.305599, -2.542715, 2.385708, 1, 0, 0.6705883, 1,
1.332191, 0.1998484, 1.295926, 1, 0, 0.6666667, 1,
1.332744, 0.436779, 1.826161, 1, 0, 0.6588235, 1,
1.339789, 1.793926, 1.038544, 1, 0, 0.654902, 1,
1.340689, 0.417849, 1.347558, 1, 0, 0.6470588, 1,
1.357699, -0.8816227, 0.1167804, 1, 0, 0.6431373, 1,
1.359384, 0.1861122, 1.419468, 1, 0, 0.6352941, 1,
1.362451, 0.04468614, 0.007556994, 1, 0, 0.6313726, 1,
1.368197, 0.5841787, 1.234922, 1, 0, 0.6235294, 1,
1.37267, -0.9175103, 2.092351, 1, 0, 0.6196079, 1,
1.374548, 0.6365666, 0.6658145, 1, 0, 0.6117647, 1,
1.386199, 0.2685997, 1.136544, 1, 0, 0.6078432, 1,
1.398245, -0.1256275, 0.6861072, 1, 0, 0.6, 1,
1.403776, 0.006212471, 0.5054713, 1, 0, 0.5921569, 1,
1.404668, 0.1795738, 0.5653762, 1, 0, 0.5882353, 1,
1.404773, -0.0007813154, 2.6935, 1, 0, 0.5803922, 1,
1.410969, 0.2520245, 0.6649175, 1, 0, 0.5764706, 1,
1.416608, 0.4804124, 1.947751, 1, 0, 0.5686275, 1,
1.424709, 2.209209, 0.5877113, 1, 0, 0.5647059, 1,
1.426601, 0.002123893, 1.332523, 1, 0, 0.5568628, 1,
1.430835, 0.02527473, 3.459048, 1, 0, 0.5529412, 1,
1.447139, 2.387453, 0.3544006, 1, 0, 0.5450981, 1,
1.453711, -0.03662003, 2.279747, 1, 0, 0.5411765, 1,
1.460429, 0.4282753, -0.09173665, 1, 0, 0.5333334, 1,
1.471193, -0.186835, 2.340886, 1, 0, 0.5294118, 1,
1.481059, -1.195166, 1.997622, 1, 0, 0.5215687, 1,
1.483523, -0.4729146, 2.354332, 1, 0, 0.5176471, 1,
1.486926, 0.9376085, 2.154073, 1, 0, 0.509804, 1,
1.493235, -0.4174887, -1.652738, 1, 0, 0.5058824, 1,
1.494013, -1.379326, 2.806691, 1, 0, 0.4980392, 1,
1.49476, -0.4789349, 0.106217, 1, 0, 0.4901961, 1,
1.496545, 1.071073, 0.3724986, 1, 0, 0.4862745, 1,
1.506815, -0.7329305, 3.396385, 1, 0, 0.4784314, 1,
1.50715, -0.04110638, 0.470399, 1, 0, 0.4745098, 1,
1.524059, 1.1149, 1.055192, 1, 0, 0.4666667, 1,
1.530877, 0.945999, 1.792716, 1, 0, 0.4627451, 1,
1.547929, -0.1207816, 2.364135, 1, 0, 0.454902, 1,
1.566309, 0.5074199, 0.9417397, 1, 0, 0.4509804, 1,
1.576113, -1.683463, 1.865869, 1, 0, 0.4431373, 1,
1.576816, -0.3881824, 2.152631, 1, 0, 0.4392157, 1,
1.581084, -0.5701463, 0.9234674, 1, 0, 0.4313726, 1,
1.581139, 1.966761, -0.4531539, 1, 0, 0.427451, 1,
1.602527, -0.04316087, 1.967727, 1, 0, 0.4196078, 1,
1.605448, -0.6621954, 0.3891979, 1, 0, 0.4156863, 1,
1.606791, -0.6535391, 2.06996, 1, 0, 0.4078431, 1,
1.608632, 1.846978, 1.429887, 1, 0, 0.4039216, 1,
1.613023, -0.7488718, 0.3297343, 1, 0, 0.3960784, 1,
1.61448, -0.1459999, 0.6796489, 1, 0, 0.3882353, 1,
1.616121, -0.3446354, 1.376697, 1, 0, 0.3843137, 1,
1.62872, 0.9062827, 0.1725085, 1, 0, 0.3764706, 1,
1.641473, -0.4099264, 2.352296, 1, 0, 0.372549, 1,
1.657254, -0.5674817, 1.272149, 1, 0, 0.3647059, 1,
1.66223, -0.1656833, 2.099813, 1, 0, 0.3607843, 1,
1.663675, -0.4708167, 2.52387, 1, 0, 0.3529412, 1,
1.663895, -0.8506657, 3.53261, 1, 0, 0.3490196, 1,
1.667499, 0.007482371, 2.64138, 1, 0, 0.3411765, 1,
1.668845, 0.3350556, 2.30337, 1, 0, 0.3372549, 1,
1.675764, -0.261132, 1.26114, 1, 0, 0.3294118, 1,
1.683973, -0.6444088, 2.567415, 1, 0, 0.3254902, 1,
1.686411, 1.952911, -0.2115629, 1, 0, 0.3176471, 1,
1.68653, -0.9437357, 3.859536, 1, 0, 0.3137255, 1,
1.690632, -0.1761875, 2.59696, 1, 0, 0.3058824, 1,
1.69652, -0.4091795, 1.321705, 1, 0, 0.2980392, 1,
1.705894, -0.3060766, 1.227821, 1, 0, 0.2941177, 1,
1.70887, -0.4715707, 1.433229, 1, 0, 0.2862745, 1,
1.714863, 0.679872, 0.5927495, 1, 0, 0.282353, 1,
1.73334, -1.634177, 1.627428, 1, 0, 0.2745098, 1,
1.74768, 0.1062566, -1.039251, 1, 0, 0.2705882, 1,
1.7499, -0.7613541, 1.138898, 1, 0, 0.2627451, 1,
1.766942, -0.8208753, 1.882599, 1, 0, 0.2588235, 1,
1.773784, -1.252267, 1.35928, 1, 0, 0.2509804, 1,
1.778496, -1.208937, 0.3016557, 1, 0, 0.2470588, 1,
1.781814, -2.117742, 3.046446, 1, 0, 0.2392157, 1,
1.78188, 0.2553358, 0.4081941, 1, 0, 0.2352941, 1,
1.792706, 0.928493, -0.3166257, 1, 0, 0.227451, 1,
1.811696, -0.8262737, 3.435527, 1, 0, 0.2235294, 1,
1.817325, -1.062036, 2.438366, 1, 0, 0.2156863, 1,
1.826648, -1.036234, 0.7552994, 1, 0, 0.2117647, 1,
1.840846, -0.7604353, 3.489643, 1, 0, 0.2039216, 1,
1.848297, 0.03404839, 0.6624439, 1, 0, 0.1960784, 1,
1.853284, 0.4083466, 0.4213425, 1, 0, 0.1921569, 1,
1.878245, -1.564717, 3.036376, 1, 0, 0.1843137, 1,
1.890899, 0.3471027, 0.07760025, 1, 0, 0.1803922, 1,
1.918411, 2.239176, 0.4755674, 1, 0, 0.172549, 1,
1.928343, -0.07598697, 2.628709, 1, 0, 0.1686275, 1,
1.930478, 0.8953886, 1.406746, 1, 0, 0.1607843, 1,
1.93803, -1.800197, 4.211615, 1, 0, 0.1568628, 1,
1.940591, 0.3301959, 2.476469, 1, 0, 0.1490196, 1,
1.983118, -0.7188762, 2.761967, 1, 0, 0.145098, 1,
1.995732, 1.146328, 1.061003, 1, 0, 0.1372549, 1,
2.012011, -0.2488925, 2.180897, 1, 0, 0.1333333, 1,
2.03383, -0.3907417, 2.182621, 1, 0, 0.1254902, 1,
2.066602, 0.5883116, 2.497778, 1, 0, 0.1215686, 1,
2.066972, -1.037469, 2.475381, 1, 0, 0.1137255, 1,
2.104981, -2.195852, 2.489049, 1, 0, 0.1098039, 1,
2.107221, -0.3110764, 2.578133, 1, 0, 0.1019608, 1,
2.143055, -0.6405383, 3.006611, 1, 0, 0.09411765, 1,
2.168763, 0.1462761, 1.844719, 1, 0, 0.09019608, 1,
2.202627, -0.7366658, 3.955038, 1, 0, 0.08235294, 1,
2.257926, -0.4263915, 1.46579, 1, 0, 0.07843138, 1,
2.274314, -0.1765321, 2.652467, 1, 0, 0.07058824, 1,
2.288219, -0.3466534, 1.385831, 1, 0, 0.06666667, 1,
2.533953, -1.779069, 2.562872, 1, 0, 0.05882353, 1,
2.566995, 0.6322175, 1.163949, 1, 0, 0.05490196, 1,
2.643759, -0.06379298, 3.162662, 1, 0, 0.04705882, 1,
2.655887, 1.118985, 2.398068, 1, 0, 0.04313726, 1,
2.675393, 0.1776585, 1.704262, 1, 0, 0.03529412, 1,
2.699566, 0.4841927, 3.601142, 1, 0, 0.03137255, 1,
2.716686, -1.452247, 2.053808, 1, 0, 0.02352941, 1,
2.78003, 0.5594919, 0.8035718, 1, 0, 0.01960784, 1,
3.03301, -0.5108583, 1.32197, 1, 0, 0.01176471, 1,
3.481914, -1.415274, 2.02626, 1, 0, 0.007843138, 1
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
0.0830121, -4.140955, -6.941749, 0, -0.5, 0.5, 0.5,
0.0830121, -4.140955, -6.941749, 1, -0.5, 0.5, 0.5,
0.0830121, -4.140955, -6.941749, 1, 1.5, 0.5, 0.5,
0.0830121, -4.140955, -6.941749, 0, 1.5, 0.5, 0.5
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
-4.468118, 0.2640961, -6.941749, 0, -0.5, 0.5, 0.5,
-4.468118, 0.2640961, -6.941749, 1, -0.5, 0.5, 0.5,
-4.468118, 0.2640961, -6.941749, 1, 1.5, 0.5, 0.5,
-4.468118, 0.2640961, -6.941749, 0, 1.5, 0.5, 0.5
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
-4.468118, -4.140955, -0.1298988, 0, -0.5, 0.5, 0.5,
-4.468118, -4.140955, -0.1298988, 1, -0.5, 0.5, 0.5,
-4.468118, -4.140955, -0.1298988, 1, 1.5, 0.5, 0.5,
-4.468118, -4.140955, -0.1298988, 0, 1.5, 0.5, 0.5
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
-3, -3.124405, -5.369783,
3, -3.124405, -5.369783,
-3, -3.124405, -5.369783,
-3, -3.29383, -5.631778,
-2, -3.124405, -5.369783,
-2, -3.29383, -5.631778,
-1, -3.124405, -5.369783,
-1, -3.29383, -5.631778,
0, -3.124405, -5.369783,
0, -3.29383, -5.631778,
1, -3.124405, -5.369783,
1, -3.29383, -5.631778,
2, -3.124405, -5.369783,
2, -3.29383, -5.631778,
3, -3.124405, -5.369783,
3, -3.29383, -5.631778
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
-3, -3.63268, -6.155766, 0, -0.5, 0.5, 0.5,
-3, -3.63268, -6.155766, 1, -0.5, 0.5, 0.5,
-3, -3.63268, -6.155766, 1, 1.5, 0.5, 0.5,
-3, -3.63268, -6.155766, 0, 1.5, 0.5, 0.5,
-2, -3.63268, -6.155766, 0, -0.5, 0.5, 0.5,
-2, -3.63268, -6.155766, 1, -0.5, 0.5, 0.5,
-2, -3.63268, -6.155766, 1, 1.5, 0.5, 0.5,
-2, -3.63268, -6.155766, 0, 1.5, 0.5, 0.5,
-1, -3.63268, -6.155766, 0, -0.5, 0.5, 0.5,
-1, -3.63268, -6.155766, 1, -0.5, 0.5, 0.5,
-1, -3.63268, -6.155766, 1, 1.5, 0.5, 0.5,
-1, -3.63268, -6.155766, 0, 1.5, 0.5, 0.5,
0, -3.63268, -6.155766, 0, -0.5, 0.5, 0.5,
0, -3.63268, -6.155766, 1, -0.5, 0.5, 0.5,
0, -3.63268, -6.155766, 1, 1.5, 0.5, 0.5,
0, -3.63268, -6.155766, 0, 1.5, 0.5, 0.5,
1, -3.63268, -6.155766, 0, -0.5, 0.5, 0.5,
1, -3.63268, -6.155766, 1, -0.5, 0.5, 0.5,
1, -3.63268, -6.155766, 1, 1.5, 0.5, 0.5,
1, -3.63268, -6.155766, 0, 1.5, 0.5, 0.5,
2, -3.63268, -6.155766, 0, -0.5, 0.5, 0.5,
2, -3.63268, -6.155766, 1, -0.5, 0.5, 0.5,
2, -3.63268, -6.155766, 1, 1.5, 0.5, 0.5,
2, -3.63268, -6.155766, 0, 1.5, 0.5, 0.5,
3, -3.63268, -6.155766, 0, -0.5, 0.5, 0.5,
3, -3.63268, -6.155766, 1, -0.5, 0.5, 0.5,
3, -3.63268, -6.155766, 1, 1.5, 0.5, 0.5,
3, -3.63268, -6.155766, 0, 1.5, 0.5, 0.5
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
-3.417857, -3, -5.369783,
-3.417857, 3, -5.369783,
-3.417857, -3, -5.369783,
-3.592901, -3, -5.631778,
-3.417857, -2, -5.369783,
-3.592901, -2, -5.631778,
-3.417857, -1, -5.369783,
-3.592901, -1, -5.631778,
-3.417857, 0, -5.369783,
-3.592901, 0, -5.631778,
-3.417857, 1, -5.369783,
-3.592901, 1, -5.631778,
-3.417857, 2, -5.369783,
-3.592901, 2, -5.631778,
-3.417857, 3, -5.369783,
-3.592901, 3, -5.631778
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
-3.942987, -3, -6.155766, 0, -0.5, 0.5, 0.5,
-3.942987, -3, -6.155766, 1, -0.5, 0.5, 0.5,
-3.942987, -3, -6.155766, 1, 1.5, 0.5, 0.5,
-3.942987, -3, -6.155766, 0, 1.5, 0.5, 0.5,
-3.942987, -2, -6.155766, 0, -0.5, 0.5, 0.5,
-3.942987, -2, -6.155766, 1, -0.5, 0.5, 0.5,
-3.942987, -2, -6.155766, 1, 1.5, 0.5, 0.5,
-3.942987, -2, -6.155766, 0, 1.5, 0.5, 0.5,
-3.942987, -1, -6.155766, 0, -0.5, 0.5, 0.5,
-3.942987, -1, -6.155766, 1, -0.5, 0.5, 0.5,
-3.942987, -1, -6.155766, 1, 1.5, 0.5, 0.5,
-3.942987, -1, -6.155766, 0, 1.5, 0.5, 0.5,
-3.942987, 0, -6.155766, 0, -0.5, 0.5, 0.5,
-3.942987, 0, -6.155766, 1, -0.5, 0.5, 0.5,
-3.942987, 0, -6.155766, 1, 1.5, 0.5, 0.5,
-3.942987, 0, -6.155766, 0, 1.5, 0.5, 0.5,
-3.942987, 1, -6.155766, 0, -0.5, 0.5, 0.5,
-3.942987, 1, -6.155766, 1, -0.5, 0.5, 0.5,
-3.942987, 1, -6.155766, 1, 1.5, 0.5, 0.5,
-3.942987, 1, -6.155766, 0, 1.5, 0.5, 0.5,
-3.942987, 2, -6.155766, 0, -0.5, 0.5, 0.5,
-3.942987, 2, -6.155766, 1, -0.5, 0.5, 0.5,
-3.942987, 2, -6.155766, 1, 1.5, 0.5, 0.5,
-3.942987, 2, -6.155766, 0, 1.5, 0.5, 0.5,
-3.942987, 3, -6.155766, 0, -0.5, 0.5, 0.5,
-3.942987, 3, -6.155766, 1, -0.5, 0.5, 0.5,
-3.942987, 3, -6.155766, 1, 1.5, 0.5, 0.5,
-3.942987, 3, -6.155766, 0, 1.5, 0.5, 0.5
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
-3.417857, -3.124405, -4,
-3.417857, -3.124405, 4,
-3.417857, -3.124405, -4,
-3.592901, -3.29383, -4,
-3.417857, -3.124405, -2,
-3.592901, -3.29383, -2,
-3.417857, -3.124405, 0,
-3.592901, -3.29383, 0,
-3.417857, -3.124405, 2,
-3.592901, -3.29383, 2,
-3.417857, -3.124405, 4,
-3.592901, -3.29383, 4
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
-3.942987, -3.63268, -4, 0, -0.5, 0.5, 0.5,
-3.942987, -3.63268, -4, 1, -0.5, 0.5, 0.5,
-3.942987, -3.63268, -4, 1, 1.5, 0.5, 0.5,
-3.942987, -3.63268, -4, 0, 1.5, 0.5, 0.5,
-3.942987, -3.63268, -2, 0, -0.5, 0.5, 0.5,
-3.942987, -3.63268, -2, 1, -0.5, 0.5, 0.5,
-3.942987, -3.63268, -2, 1, 1.5, 0.5, 0.5,
-3.942987, -3.63268, -2, 0, 1.5, 0.5, 0.5,
-3.942987, -3.63268, 0, 0, -0.5, 0.5, 0.5,
-3.942987, -3.63268, 0, 1, -0.5, 0.5, 0.5,
-3.942987, -3.63268, 0, 1, 1.5, 0.5, 0.5,
-3.942987, -3.63268, 0, 0, 1.5, 0.5, 0.5,
-3.942987, -3.63268, 2, 0, -0.5, 0.5, 0.5,
-3.942987, -3.63268, 2, 1, -0.5, 0.5, 0.5,
-3.942987, -3.63268, 2, 1, 1.5, 0.5, 0.5,
-3.942987, -3.63268, 2, 0, 1.5, 0.5, 0.5,
-3.942987, -3.63268, 4, 0, -0.5, 0.5, 0.5,
-3.942987, -3.63268, 4, 1, -0.5, 0.5, 0.5,
-3.942987, -3.63268, 4, 1, 1.5, 0.5, 0.5,
-3.942987, -3.63268, 4, 0, 1.5, 0.5, 0.5
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
-3.417857, -3.124405, -5.369783,
-3.417857, 3.652597, -5.369783,
-3.417857, -3.124405, 5.109986,
-3.417857, 3.652597, 5.109986,
-3.417857, -3.124405, -5.369783,
-3.417857, -3.124405, 5.109986,
-3.417857, 3.652597, -5.369783,
-3.417857, 3.652597, 5.109986,
-3.417857, -3.124405, -5.369783,
3.583881, -3.124405, -5.369783,
-3.417857, -3.124405, 5.109986,
3.583881, -3.124405, 5.109986,
-3.417857, 3.652597, -5.369783,
3.583881, 3.652597, -5.369783,
-3.417857, 3.652597, 5.109986,
3.583881, 3.652597, 5.109986,
3.583881, -3.124405, -5.369783,
3.583881, 3.652597, -5.369783,
3.583881, -3.124405, 5.109986,
3.583881, 3.652597, 5.109986,
3.583881, -3.124405, -5.369783,
3.583881, -3.124405, 5.109986,
3.583881, 3.652597, -5.369783,
3.583881, 3.652597, 5.109986
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
var radius = 7.641291;
var distance = 33.99697;
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
mvMatrix.translate( -0.0830121, -0.2640961, 0.1298988 );
mvMatrix.scale( 1.17998, 1.21911, 0.7883679 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.99697);
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
Phenylacetonitril<-read.table("Phenylacetonitril.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Phenylacetonitril$V2
```

```
## Error in eval(expr, envir, enclos): object 'Phenylacetonitril' not found
```

```r
y<-Phenylacetonitril$V3
```

```
## Error in eval(expr, envir, enclos): object 'Phenylacetonitril' not found
```

```r
z<-Phenylacetonitril$V4
```

```
## Error in eval(expr, envir, enclos): object 'Phenylacetonitril' not found
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
-3.31589, 1.26452, -2.920928, 0, 0, 1, 1, 1,
-3.209098, 1.083959, -0.299657, 1, 0, 0, 1, 1,
-3.180091, 1.771992, -1.692324, 1, 0, 0, 1, 1,
-3.137404, -0.3806344, -1.296751, 1, 0, 0, 1, 1,
-2.772221, 0.7732436, -3.014842, 1, 0, 0, 1, 1,
-2.72698, 1.225298, -2.317733, 1, 0, 0, 1, 1,
-2.62908, -0.4242107, -2.134881, 0, 0, 0, 1, 1,
-2.571102, 0.2698072, -0.1257139, 0, 0, 0, 1, 1,
-2.542538, 0.8230008, -2.140398, 0, 0, 0, 1, 1,
-2.535106, 0.3998283, -0.9828157, 0, 0, 0, 1, 1,
-2.479737, -0.8260921, -1.409948, 0, 0, 0, 1, 1,
-2.321401, 0.6186374, -1.118171, 0, 0, 0, 1, 1,
-2.213143, 0.3482056, -1.273079, 0, 0, 0, 1, 1,
-2.192709, -0.7581369, -0.9463019, 1, 1, 1, 1, 1,
-2.15444, 2.654369, -0.612745, 1, 1, 1, 1, 1,
-2.120412, 0.4999793, -1.748382, 1, 1, 1, 1, 1,
-2.107458, -0.2370293, -2.657155, 1, 1, 1, 1, 1,
-2.093004, -0.7866513, -1.971686, 1, 1, 1, 1, 1,
-2.090966, -0.7353969, -3.653423, 1, 1, 1, 1, 1,
-2.085134, 1.110441, -0.6398619, 1, 1, 1, 1, 1,
-2.009662, 0.5800871, -1.13993, 1, 1, 1, 1, 1,
-2.005771, 1.746602, 1.651372, 1, 1, 1, 1, 1,
-1.982048, -0.3032944, -1.279915, 1, 1, 1, 1, 1,
-1.978428, -0.5707629, -2.324008, 1, 1, 1, 1, 1,
-1.953958, -1.070026, -2.652434, 1, 1, 1, 1, 1,
-1.92815, 0.592843, 0.1680574, 1, 1, 1, 1, 1,
-1.921781, -0.8209386, -0.7939448, 1, 1, 1, 1, 1,
-1.913837, 1.419566, -2.213249, 1, 1, 1, 1, 1,
-1.858655, 0.1243158, -0.7718379, 0, 0, 1, 1, 1,
-1.855614, 0.643644, -4.042451, 1, 0, 0, 1, 1,
-1.849475, -0.7938465, -1.69867, 1, 0, 0, 1, 1,
-1.842541, -0.6172188, -2.296194, 1, 0, 0, 1, 1,
-1.820771, -0.1919758, -0.8929991, 1, 0, 0, 1, 1,
-1.811869, -0.5984131, -1.77755, 1, 0, 0, 1, 1,
-1.803672, -0.3570437, -1.632802, 0, 0, 0, 1, 1,
-1.803297, 0.8004205, 0.4610817, 0, 0, 0, 1, 1,
-1.800161, 0.613984, -2.981275, 0, 0, 0, 1, 1,
-1.795949, 0.5472727, -2.35385, 0, 0, 0, 1, 1,
-1.771624, 0.7720303, -0.6629744, 0, 0, 0, 1, 1,
-1.766964, 0.1432247, -2.867232, 0, 0, 0, 1, 1,
-1.753533, 0.8772756, -2.216534, 0, 0, 0, 1, 1,
-1.750474, -1.758318, -1.584838, 1, 1, 1, 1, 1,
-1.747227, -0.4134242, -2.914072, 1, 1, 1, 1, 1,
-1.745618, 1.71065, 0.2118698, 1, 1, 1, 1, 1,
-1.73133, 0.5467631, -1.23669, 1, 1, 1, 1, 1,
-1.718684, 0.7814665, -2.656897, 1, 1, 1, 1, 1,
-1.695171, 0.2475276, -1.463278, 1, 1, 1, 1, 1,
-1.679947, -0.2480837, -1.061646, 1, 1, 1, 1, 1,
-1.654293, -1.043535, -2.232314, 1, 1, 1, 1, 1,
-1.651016, 0.09908084, -2.122535, 1, 1, 1, 1, 1,
-1.644981, 2.678201, -1.575014, 1, 1, 1, 1, 1,
-1.640713, -1.552257, -3.327127, 1, 1, 1, 1, 1,
-1.628788, 0.224462, -1.813195, 1, 1, 1, 1, 1,
-1.600712, 3.068296, -0.3010688, 1, 1, 1, 1, 1,
-1.598178, 2.634023, -0.1347341, 1, 1, 1, 1, 1,
-1.595646, -0.4884427, -1.350754, 1, 1, 1, 1, 1,
-1.588961, 0.2961386, -1.983321, 0, 0, 1, 1, 1,
-1.57272, -0.545738, -3.890946, 1, 0, 0, 1, 1,
-1.572363, 0.6632316, -0.2304691, 1, 0, 0, 1, 1,
-1.569409, 1.111359, -0.03819158, 1, 0, 0, 1, 1,
-1.562762, -0.3546288, -1.094251, 1, 0, 0, 1, 1,
-1.552754, -0.7552987, -1.535053, 1, 0, 0, 1, 1,
-1.551423, -0.1198869, -2.621708, 0, 0, 0, 1, 1,
-1.541043, 1.498707, -0.7854193, 0, 0, 0, 1, 1,
-1.540367, -0.3066226, -1.339067, 0, 0, 0, 1, 1,
-1.534417, -1.245663, -3.084717, 0, 0, 0, 1, 1,
-1.529602, 1.894507, -0.4702832, 0, 0, 0, 1, 1,
-1.514213, -0.8128484, -1.111382, 0, 0, 0, 1, 1,
-1.505796, -0.8948273, -2.409075, 0, 0, 0, 1, 1,
-1.503204, 0.9725302, -2.096471, 1, 1, 1, 1, 1,
-1.496343, -0.9385854, -2.197297, 1, 1, 1, 1, 1,
-1.492524, 0.3246899, -1.907526, 1, 1, 1, 1, 1,
-1.492133, -0.9695576, -3.162217, 1, 1, 1, 1, 1,
-1.480612, 1.208644, 0.08795553, 1, 1, 1, 1, 1,
-1.449621, 0.03337151, -2.658728, 1, 1, 1, 1, 1,
-1.435182, 0.9957763, -0.777703, 1, 1, 1, 1, 1,
-1.422884, 0.7443214, -0.7928446, 1, 1, 1, 1, 1,
-1.416366, 0.2822994, -3.312994, 1, 1, 1, 1, 1,
-1.409226, -0.4650595, -2.242402, 1, 1, 1, 1, 1,
-1.405892, 0.8557917, 0.107567, 1, 1, 1, 1, 1,
-1.381426, 1.070713, -1.170399, 1, 1, 1, 1, 1,
-1.381398, -0.04258167, -3.445433, 1, 1, 1, 1, 1,
-1.368214, 0.4063007, -1.577637, 1, 1, 1, 1, 1,
-1.367393, -0.1889761, -1.817477, 1, 1, 1, 1, 1,
-1.365722, -0.8632641, -2.271443, 0, 0, 1, 1, 1,
-1.355848, -0.1481981, -0.627214, 1, 0, 0, 1, 1,
-1.333098, 1.428459, 0.4298313, 1, 0, 0, 1, 1,
-1.330259, 0.8787585, -0.5256448, 1, 0, 0, 1, 1,
-1.32423, 1.287719, -0.1580054, 1, 0, 0, 1, 1,
-1.32407, 0.09098904, -2.180619, 1, 0, 0, 1, 1,
-1.31075, -0.7094796, -2.065005, 0, 0, 0, 1, 1,
-1.309996, 0.9200532, -0.9075006, 0, 0, 0, 1, 1,
-1.296197, -1.162846, -1.647564, 0, 0, 0, 1, 1,
-1.284822, -0.3566663, -1.683461, 0, 0, 0, 1, 1,
-1.282489, 0.9499975, -0.3617219, 0, 0, 0, 1, 1,
-1.281761, 1.592872, -0.3368299, 0, 0, 0, 1, 1,
-1.275691, 0.8663166, -1.867613, 0, 0, 0, 1, 1,
-1.238606, -0.99985, -2.501219, 1, 1, 1, 1, 1,
-1.214197, -0.4746832, 0.1143104, 1, 1, 1, 1, 1,
-1.213651, 0.2953698, -0.9215519, 1, 1, 1, 1, 1,
-1.212497, 1.526638, -1.950417, 1, 1, 1, 1, 1,
-1.21203, -0.1368134, -0.1534399, 1, 1, 1, 1, 1,
-1.211702, 0.644985, -0.7031648, 1, 1, 1, 1, 1,
-1.210191, 0.5557643, -1.415284, 1, 1, 1, 1, 1,
-1.207677, -1.469865, -2.988599, 1, 1, 1, 1, 1,
-1.201989, -1.403394, -2.580862, 1, 1, 1, 1, 1,
-1.201963, 0.3209709, -2.381844, 1, 1, 1, 1, 1,
-1.200505, 0.2276623, -0.8063943, 1, 1, 1, 1, 1,
-1.193798, 0.08965134, -3.002588, 1, 1, 1, 1, 1,
-1.189108, -0.1713781, -1.717522, 1, 1, 1, 1, 1,
-1.188309, -0.5262489, -1.425493, 1, 1, 1, 1, 1,
-1.187136, -0.326468, 0.3421938, 1, 1, 1, 1, 1,
-1.175019, 0.670065, -1.863186, 0, 0, 1, 1, 1,
-1.171308, -1.656141, -1.430139, 1, 0, 0, 1, 1,
-1.167123, 2.163701, -0.9982007, 1, 0, 0, 1, 1,
-1.164324, -1.248726, -2.339722, 1, 0, 0, 1, 1,
-1.161584, 1.461615, -0.8463329, 1, 0, 0, 1, 1,
-1.147261, -0.6410847, -1.05046, 1, 0, 0, 1, 1,
-1.146859, 0.3429718, -3.134579, 0, 0, 0, 1, 1,
-1.141377, -0.8104767, -1.527632, 0, 0, 0, 1, 1,
-1.133998, 0.2665128, -1.651266, 0, 0, 0, 1, 1,
-1.129376, 2.186743, -3.130091, 0, 0, 0, 1, 1,
-1.125916, 1.523455, -0.4263135, 0, 0, 0, 1, 1,
-1.117967, 1.336474, -1.470745, 0, 0, 0, 1, 1,
-1.110396, -0.02421239, -2.232347, 0, 0, 0, 1, 1,
-1.109991, 1.646865, -1.666409, 1, 1, 1, 1, 1,
-1.090338, 1.551493, -0.2565044, 1, 1, 1, 1, 1,
-1.081871, -0.1867984, -0.04692351, 1, 1, 1, 1, 1,
-1.064354, 1.0805, -1.48403, 1, 1, 1, 1, 1,
-1.063719, 1.346502, -1.293704, 1, 1, 1, 1, 1,
-1.063022, -0.6227954, -2.983183, 1, 1, 1, 1, 1,
-1.062444, -0.7189553, -1.044934, 1, 1, 1, 1, 1,
-1.055992, -0.2609238, -3.874346, 1, 1, 1, 1, 1,
-1.055434, -0.8128359, -0.4927599, 1, 1, 1, 1, 1,
-1.054095, -0.4740874, -2.044673, 1, 1, 1, 1, 1,
-1.052662, 0.9510065, -2.215728, 1, 1, 1, 1, 1,
-1.051762, -0.1014232, -2.078051, 1, 1, 1, 1, 1,
-1.050708, -0.2595077, -1.807087, 1, 1, 1, 1, 1,
-1.046457, -1.359287, -3.746565, 1, 1, 1, 1, 1,
-1.033608, 0.06453395, -3.515898, 1, 1, 1, 1, 1,
-1.028384, -1.412918, -2.047072, 0, 0, 1, 1, 1,
-1.023185, 1.32664, 2.272902, 1, 0, 0, 1, 1,
-1.020596, 0.8805663, -0.361459, 1, 0, 0, 1, 1,
-1.018676, 0.2479423, -1.570551, 1, 0, 0, 1, 1,
-1.01863, 1.275898, -0.9771062, 1, 0, 0, 1, 1,
-1.015855, -1.564131, -1.396414, 1, 0, 0, 1, 1,
-1.00298, 2.476341, 0.6964388, 0, 0, 0, 1, 1,
-1.00221, -1.341861, -3.52402, 0, 0, 0, 1, 1,
-0.9943028, -1.394788, -0.8977293, 0, 0, 0, 1, 1,
-0.9885114, -1.310333, -3.33634, 0, 0, 0, 1, 1,
-0.9842087, 0.6613002, -0.05141513, 0, 0, 0, 1, 1,
-0.9834498, -0.7254382, -2.292695, 0, 0, 0, 1, 1,
-0.9802325, -0.6822315, -0.9062437, 0, 0, 0, 1, 1,
-0.9701559, -0.4646586, -1.402056, 1, 1, 1, 1, 1,
-0.9700881, 0.3803945, -2.75415, 1, 1, 1, 1, 1,
-0.967292, 0.6445622, -0.7700005, 1, 1, 1, 1, 1,
-0.9624707, 1.252758, -1.291835, 1, 1, 1, 1, 1,
-0.9620993, -0.0613618, -4.144087, 1, 1, 1, 1, 1,
-0.9584886, -0.4846907, -2.673875, 1, 1, 1, 1, 1,
-0.9561626, -0.389681, -2.132436, 1, 1, 1, 1, 1,
-0.951926, -0.6567501, -2.568634, 1, 1, 1, 1, 1,
-0.9502097, -0.892305, 1.209726, 1, 1, 1, 1, 1,
-0.9491768, -1.008038, -1.864052, 1, 1, 1, 1, 1,
-0.9438121, 0.4603214, -2.13422, 1, 1, 1, 1, 1,
-0.9375544, 0.09708112, -1.322366, 1, 1, 1, 1, 1,
-0.9353386, -0.05006498, -3.245485, 1, 1, 1, 1, 1,
-0.9340426, 0.2143397, -2.0378, 1, 1, 1, 1, 1,
-0.9339448, 1.492723, -1.122701, 1, 1, 1, 1, 1,
-0.9300309, 0.1679189, -2.067107, 0, 0, 1, 1, 1,
-0.928152, -1.089757, -2.566007, 1, 0, 0, 1, 1,
-0.9256846, 0.5210558, 1.490494, 1, 0, 0, 1, 1,
-0.9192303, 1.916422, -1.93216, 1, 0, 0, 1, 1,
-0.9117004, 0.2773234, 0.5373976, 1, 0, 0, 1, 1,
-0.905681, -0.6163094, -1.515009, 1, 0, 0, 1, 1,
-0.9054791, -0.9448473, -1.560469, 0, 0, 0, 1, 1,
-0.9051128, 0.6570308, -1.025981, 0, 0, 0, 1, 1,
-0.9046262, 1.024612, -0.9876336, 0, 0, 0, 1, 1,
-0.9018722, 1.697723, 0.8134309, 0, 0, 0, 1, 1,
-0.8995622, -0.1929629, -1.91985, 0, 0, 0, 1, 1,
-0.89409, -0.1218688, -2.632003, 0, 0, 0, 1, 1,
-0.8923203, 0.02787332, -2.040076, 0, 0, 0, 1, 1,
-0.8893811, -0.3388604, -1.953041, 1, 1, 1, 1, 1,
-0.8880004, 1.462188, -0.2813488, 1, 1, 1, 1, 1,
-0.8875948, -1.042978, -1.4435, 1, 1, 1, 1, 1,
-0.8833571, 0.2243627, -1.465773, 1, 1, 1, 1, 1,
-0.8807322, -0.2546434, -2.683492, 1, 1, 1, 1, 1,
-0.8739833, -0.2827531, -2.330498, 1, 1, 1, 1, 1,
-0.8724312, -0.3377723, -3.871799, 1, 1, 1, 1, 1,
-0.8706123, -0.7143159, -1.334361, 1, 1, 1, 1, 1,
-0.8701735, 0.1789044, -0.759454, 1, 1, 1, 1, 1,
-0.8658155, 1.425395, -0.4162138, 1, 1, 1, 1, 1,
-0.8648506, -0.5464877, -2.944984, 1, 1, 1, 1, 1,
-0.8621058, 0.2648966, -2.004907, 1, 1, 1, 1, 1,
-0.8597291, 1.218158, 0.8717112, 1, 1, 1, 1, 1,
-0.8539709, 0.4963564, -0.5106532, 1, 1, 1, 1, 1,
-0.8533286, -1.292171, -1.226585, 1, 1, 1, 1, 1,
-0.8530055, -0.3895823, -1.262565, 0, 0, 1, 1, 1,
-0.8525813, -0.7557963, -2.829696, 1, 0, 0, 1, 1,
-0.8513684, -0.463173, -3.173515, 1, 0, 0, 1, 1,
-0.8490804, 0.712213, -1.057166, 1, 0, 0, 1, 1,
-0.847858, 1.171373, 0.8565267, 1, 0, 0, 1, 1,
-0.8445976, 2.341767, -0.6873949, 1, 0, 0, 1, 1,
-0.8444262, 0.7455317, 0.5306424, 0, 0, 0, 1, 1,
-0.8410259, 0.1354823, -0.2882934, 0, 0, 0, 1, 1,
-0.8392131, -0.711243, -1.775023, 0, 0, 0, 1, 1,
-0.8330379, -0.6957219, -2.892833, 0, 0, 0, 1, 1,
-0.8290324, 1.384559, -1.286685, 0, 0, 0, 1, 1,
-0.8289479, -0.2365359, -0.3901893, 0, 0, 0, 1, 1,
-0.8280324, -1.992669, -1.68765, 0, 0, 0, 1, 1,
-0.8275034, 2.130834, 1.361252, 1, 1, 1, 1, 1,
-0.8189527, -0.05896316, -1.831142, 1, 1, 1, 1, 1,
-0.814568, -0.8861015, -2.024039, 1, 1, 1, 1, 1,
-0.8077409, -0.8716348, -1.782801, 1, 1, 1, 1, 1,
-0.7956585, -0.00395928, -1.33281, 1, 1, 1, 1, 1,
-0.7949418, -0.3555591, -2.135999, 1, 1, 1, 1, 1,
-0.7922393, -1.377625, -3.108904, 1, 1, 1, 1, 1,
-0.7918633, 1.136417, -2.911156, 1, 1, 1, 1, 1,
-0.7906663, -2.073568, -2.177654, 1, 1, 1, 1, 1,
-0.7884014, -1.354398, -0.7261161, 1, 1, 1, 1, 1,
-0.78833, -0.1786662, -1.312827, 1, 1, 1, 1, 1,
-0.7868654, -0.5063671, -0.9751605, 1, 1, 1, 1, 1,
-0.7824851, 0.369345, 0.6189008, 1, 1, 1, 1, 1,
-0.772351, 0.1429755, -1.425829, 1, 1, 1, 1, 1,
-0.7683291, 0.8138906, -1.369777, 1, 1, 1, 1, 1,
-0.7681149, 1.297221, -1.516232, 0, 0, 1, 1, 1,
-0.7670302, -1.174478, -4.004706, 1, 0, 0, 1, 1,
-0.766763, 1.185452, 0.5719147, 1, 0, 0, 1, 1,
-0.7661213, -0.08554977, -0.8267292, 1, 0, 0, 1, 1,
-0.7516092, -0.4646288, -3.769229, 1, 0, 0, 1, 1,
-0.750481, 1.402192, -1.716526, 1, 0, 0, 1, 1,
-0.7467269, 0.2290612, -0.0167469, 0, 0, 0, 1, 1,
-0.7418109, 0.2710591, -0.4582946, 0, 0, 0, 1, 1,
-0.741077, -0.4158203, -2.853299, 0, 0, 0, 1, 1,
-0.7380747, -0.7429348, -2.46121, 0, 0, 0, 1, 1,
-0.7240776, -0.8082584, -2.620813, 0, 0, 0, 1, 1,
-0.7237654, 0.04250274, -0.9513971, 0, 0, 0, 1, 1,
-0.7171411, -0.974177, -0.6360287, 0, 0, 0, 1, 1,
-0.712366, 0.8350353, -0.7057546, 1, 1, 1, 1, 1,
-0.7085835, 1.560325, -1.541993, 1, 1, 1, 1, 1,
-0.7060996, 1.585656, -1.164344, 1, 1, 1, 1, 1,
-0.6995113, 0.312149, -2.296599, 1, 1, 1, 1, 1,
-0.6977342, 0.6537948, -1.046945, 1, 1, 1, 1, 1,
-0.6906846, -0.07081943, -1.887332, 1, 1, 1, 1, 1,
-0.6866272, 0.8331086, -0.4627158, 1, 1, 1, 1, 1,
-0.6789898, -1.738649, -2.633092, 1, 1, 1, 1, 1,
-0.6751353, 0.6677372, -1.847601, 1, 1, 1, 1, 1,
-0.6718442, -0.9402745, -2.710415, 1, 1, 1, 1, 1,
-0.6685993, 0.2254476, -1.295973, 1, 1, 1, 1, 1,
-0.6654671, -0.4425329, -1.027445, 1, 1, 1, 1, 1,
-0.6628119, -0.9890922, -1.966526, 1, 1, 1, 1, 1,
-0.6626965, 0.416438, 1.42518, 1, 1, 1, 1, 1,
-0.6625645, -0.5582613, -0.885178, 1, 1, 1, 1, 1,
-0.6615845, 0.03318533, -1.351153, 0, 0, 1, 1, 1,
-0.6553451, -0.6190386, -2.187228, 1, 0, 0, 1, 1,
-0.6475062, -1.284966, -3.895669, 1, 0, 0, 1, 1,
-0.6426352, 1.371294, -0.5421735, 1, 0, 0, 1, 1,
-0.6402917, -0.2128108, -0.3959546, 1, 0, 0, 1, 1,
-0.6342871, -2.062337, -1.624109, 1, 0, 0, 1, 1,
-0.6340224, -1.108407, -3.614694, 0, 0, 0, 1, 1,
-0.6321527, 0.5706306, -0.02182297, 0, 0, 0, 1, 1,
-0.6316037, -0.9791601, -3.428353, 0, 0, 0, 1, 1,
-0.6294521, 0.8314715, -1.21973, 0, 0, 0, 1, 1,
-0.628778, -2.480973, -4.324353, 0, 0, 0, 1, 1,
-0.6233754, -1.897905, -3.813434, 0, 0, 0, 1, 1,
-0.6196845, 0.9754214, -0.8584108, 0, 0, 0, 1, 1,
-0.6185202, 0.3286935, -2.51403, 1, 1, 1, 1, 1,
-0.614052, 0.713293, -1.205887, 1, 1, 1, 1, 1,
-0.6117061, 1.098805, -1.580767, 1, 1, 1, 1, 1,
-0.6100453, -0.2456141, -3.1406, 1, 1, 1, 1, 1,
-0.6080421, -0.4783764, -1.605347, 1, 1, 1, 1, 1,
-0.6078156, 0.02561317, -1.566579, 1, 1, 1, 1, 1,
-0.6002223, -0.7853742, -2.820727, 1, 1, 1, 1, 1,
-0.5976316, -0.734875, -2.264776, 1, 1, 1, 1, 1,
-0.5961437, 1.437643, -0.3408625, 1, 1, 1, 1, 1,
-0.5919194, 1.34957, -3.308534, 1, 1, 1, 1, 1,
-0.5904285, 0.6545506, -2.075101, 1, 1, 1, 1, 1,
-0.5892781, 0.998278, -0.1919193, 1, 1, 1, 1, 1,
-0.583632, 1.366452, -0.5903595, 1, 1, 1, 1, 1,
-0.5745503, 0.3664913, 0.1114212, 1, 1, 1, 1, 1,
-0.5716401, 1.003498, -2.301459, 1, 1, 1, 1, 1,
-0.5696963, -1.664162, -3.014768, 0, 0, 1, 1, 1,
-0.5670264, 0.7348546, -1.897187, 1, 0, 0, 1, 1,
-0.5632304, -0.9323719, -2.095867, 1, 0, 0, 1, 1,
-0.5606487, 0.5010477, -0.5333235, 1, 0, 0, 1, 1,
-0.5585039, 1.283728, -0.2400883, 1, 0, 0, 1, 1,
-0.5547941, 0.2869287, -2.844269, 1, 0, 0, 1, 1,
-0.550338, -1.840351, -3.389347, 0, 0, 0, 1, 1,
-0.5429175, -0.542186, -3.384931, 0, 0, 0, 1, 1,
-0.5407333, 3.553903, 1.114219, 0, 0, 0, 1, 1,
-0.5407234, 1.004038, 0.8221696, 0, 0, 0, 1, 1,
-0.5400901, -2.333594, -4.280629, 0, 0, 0, 1, 1,
-0.5378495, 1.234726, -1.136168, 0, 0, 0, 1, 1,
-0.5334308, -0.170441, -1.27764, 0, 0, 0, 1, 1,
-0.5281035, 0.4184169, -0.8645183, 1, 1, 1, 1, 1,
-0.5132499, 1.046135, -0.8718936, 1, 1, 1, 1, 1,
-0.5121732, 0.1361066, -1.41224, 1, 1, 1, 1, 1,
-0.5071308, 0.04791718, -2.046972, 1, 1, 1, 1, 1,
-0.5054266, -0.4461043, -2.093202, 1, 1, 1, 1, 1,
-0.5010113, 1.026573, -0.7804437, 1, 1, 1, 1, 1,
-0.4981273, -0.2577369, -2.7463, 1, 1, 1, 1, 1,
-0.493302, -0.7072273, -3.163882, 1, 1, 1, 1, 1,
-0.4923904, 1.128722, 0.7846244, 1, 1, 1, 1, 1,
-0.4858495, 0.9592898, -1.050163, 1, 1, 1, 1, 1,
-0.4797582, -1.552271, -2.127736, 1, 1, 1, 1, 1,
-0.4796925, 0.6107724, -0.508518, 1, 1, 1, 1, 1,
-0.4752371, -1.69901, -2.547987, 1, 1, 1, 1, 1,
-0.4747858, 0.1141879, -0.8947813, 1, 1, 1, 1, 1,
-0.4709263, -0.4760677, -1.769718, 1, 1, 1, 1, 1,
-0.4686254, -2.032612, -3.695486, 0, 0, 1, 1, 1,
-0.4677715, 0.6547543, -1.407648, 1, 0, 0, 1, 1,
-0.4655124, -0.1158881, -0.8196652, 1, 0, 0, 1, 1,
-0.4611106, 1.490725, 0.2448629, 1, 0, 0, 1, 1,
-0.4589873, 0.1622423, -1.337171, 1, 0, 0, 1, 1,
-0.4572574, -0.2674896, -2.696206, 1, 0, 0, 1, 1,
-0.4534742, 0.1726053, -2.025963, 0, 0, 0, 1, 1,
-0.4533789, -0.9252572, -1.840369, 0, 0, 0, 1, 1,
-0.4508206, 1.425254, -0.5585561, 0, 0, 0, 1, 1,
-0.4505507, -1.258928, -1.672941, 0, 0, 0, 1, 1,
-0.4502826, 0.8804588, -0.08632088, 0, 0, 0, 1, 1,
-0.4495377, -1.105021, -2.173815, 0, 0, 0, 1, 1,
-0.449237, 1.35221, -1.45481, 0, 0, 0, 1, 1,
-0.4482546, -1.097301, -2.85878, 1, 1, 1, 1, 1,
-0.4412617, -0.01523855, -0.7758173, 1, 1, 1, 1, 1,
-0.4401361, -0.1144732, -0.9744158, 1, 1, 1, 1, 1,
-0.4378388, -0.5619071, -2.642335, 1, 1, 1, 1, 1,
-0.436967, -0.1306348, -0.7423049, 1, 1, 1, 1, 1,
-0.4363537, -0.8746714, -4.761924, 1, 1, 1, 1, 1,
-0.4340754, -0.2898687, -0.9779106, 1, 1, 1, 1, 1,
-0.4286737, -0.6072292, -2.338215, 1, 1, 1, 1, 1,
-0.4261678, 0.1119588, -1.506153, 1, 1, 1, 1, 1,
-0.425154, -0.6840289, -3.212147, 1, 1, 1, 1, 1,
-0.4234282, 0.4366643, -1.093936, 1, 1, 1, 1, 1,
-0.4177926, 0.6286965, -1.009558, 1, 1, 1, 1, 1,
-0.4156276, 0.6543868, 0.503795, 1, 1, 1, 1, 1,
-0.4134107, 0.6474541, -1.857474, 1, 1, 1, 1, 1,
-0.4114037, -1.029463, -1.416864, 1, 1, 1, 1, 1,
-0.4107676, -0.1826659, -1.918576, 0, 0, 1, 1, 1,
-0.404062, 0.1090095, -2.208563, 1, 0, 0, 1, 1,
-0.4015837, -0.4471632, -3.143496, 1, 0, 0, 1, 1,
-0.401075, -0.9742151, -5.217165, 1, 0, 0, 1, 1,
-0.3957, -1.108904, -2.348303, 1, 0, 0, 1, 1,
-0.3944382, 1.078226, -0.3780923, 1, 0, 0, 1, 1,
-0.3914544, -0.9368042, -2.645992, 0, 0, 0, 1, 1,
-0.3909141, -1.555043, -2.195613, 0, 0, 0, 1, 1,
-0.3767226, -0.2772338, -1.501738, 0, 0, 0, 1, 1,
-0.3766597, -0.6330569, -2.719149, 0, 0, 0, 1, 1,
-0.3732484, 0.369796, -0.9343165, 0, 0, 0, 1, 1,
-0.3732031, -0.2175354, -2.376967, 0, 0, 0, 1, 1,
-0.367559, -0.3102778, -2.784474, 0, 0, 0, 1, 1,
-0.3672613, -0.5639307, -2.441355, 1, 1, 1, 1, 1,
-0.3659411, -0.1751975, -1.688863, 1, 1, 1, 1, 1,
-0.3659223, 0.1089149, -0.8920658, 1, 1, 1, 1, 1,
-0.3639374, 0.4587841, -2.40724, 1, 1, 1, 1, 1,
-0.3589674, -0.3659867, -1.361383, 1, 1, 1, 1, 1,
-0.3575824, 1.607199, -0.9718179, 1, 1, 1, 1, 1,
-0.3529239, -1.517122, -4.128599, 1, 1, 1, 1, 1,
-0.3514107, 0.2085407, -0.8939701, 1, 1, 1, 1, 1,
-0.347934, -0.436466, -1.782999, 1, 1, 1, 1, 1,
-0.3479101, 1.1241, 0.6710609, 1, 1, 1, 1, 1,
-0.3476565, 0.3122244, -0.2561216, 1, 1, 1, 1, 1,
-0.3343478, 0.2288107, -0.5061822, 1, 1, 1, 1, 1,
-0.332199, 0.1216546, -2.104463, 1, 1, 1, 1, 1,
-0.3314596, 0.5938739, -1.332254, 1, 1, 1, 1, 1,
-0.3287983, -0.1522931, -1.798948, 1, 1, 1, 1, 1,
-0.3271779, 2.866374, 0.6899176, 0, 0, 1, 1, 1,
-0.3233554, 0.2218771, -0.3634309, 1, 0, 0, 1, 1,
-0.3219788, -0.89549, -3.779415, 1, 0, 0, 1, 1,
-0.3209501, -1.22297, -3.034898, 1, 0, 0, 1, 1,
-0.31745, 0.4711764, -0.4916198, 1, 0, 0, 1, 1,
-0.3174402, 1.159036, -1.263316, 1, 0, 0, 1, 1,
-0.3159291, -1.46906, -4.112454, 0, 0, 0, 1, 1,
-0.3128336, 0.779078, -1.315958, 0, 0, 0, 1, 1,
-0.3127937, 1.503875, -1.128678, 0, 0, 0, 1, 1,
-0.3107619, -0.09952045, -3.12254, 0, 0, 0, 1, 1,
-0.3085476, 0.06830274, -0.1266998, 0, 0, 0, 1, 1,
-0.3083187, 0.4129291, 0.04960407, 0, 0, 0, 1, 1,
-0.3052201, 0.281099, -2.000342, 0, 0, 0, 1, 1,
-0.3037005, -2.011508, -1.764268, 1, 1, 1, 1, 1,
-0.3032203, 0.9201057, -1.576371, 1, 1, 1, 1, 1,
-0.2988078, 0.5276238, -0.735611, 1, 1, 1, 1, 1,
-0.296805, -0.07355921, -1.854948, 1, 1, 1, 1, 1,
-0.2939845, 0.6446102, 0.3903314, 1, 1, 1, 1, 1,
-0.293629, 0.162384, 0.2021002, 1, 1, 1, 1, 1,
-0.2896532, -0.7710735, -2.930363, 1, 1, 1, 1, 1,
-0.2852506, 1.065016, -0.0347987, 1, 1, 1, 1, 1,
-0.2838658, 1.165353, -0.02221523, 1, 1, 1, 1, 1,
-0.2833357, -1.023043, -2.053318, 1, 1, 1, 1, 1,
-0.2804091, 0.9320155, -0.7120225, 1, 1, 1, 1, 1,
-0.2800236, 1.423617, -1.714092, 1, 1, 1, 1, 1,
-0.278368, -0.9863445, -0.9330777, 1, 1, 1, 1, 1,
-0.27084, 1.644655, -0.02202859, 1, 1, 1, 1, 1,
-0.2695902, -1.432676, -2.303479, 1, 1, 1, 1, 1,
-0.26941, -0.8153163, -2.413794, 0, 0, 1, 1, 1,
-0.268234, -0.3598251, -2.769428, 1, 0, 0, 1, 1,
-0.2670513, -0.4097845, -2.080334, 1, 0, 0, 1, 1,
-0.261574, 0.09154323, -0.318906, 1, 0, 0, 1, 1,
-0.2574404, 0.111084, -2.250515, 1, 0, 0, 1, 1,
-0.2547527, 1.356752, -1.030409, 1, 0, 0, 1, 1,
-0.2545787, 0.4191318, -1.860391, 0, 0, 0, 1, 1,
-0.253969, 0.1592224, -1.439051, 0, 0, 0, 1, 1,
-0.251447, 0.9886514, -0.4260133, 0, 0, 0, 1, 1,
-0.2512594, 0.01968317, -1.897229, 0, 0, 0, 1, 1,
-0.2501948, 0.1415483, -1.877307, 0, 0, 0, 1, 1,
-0.2469709, 0.101568, -1.948751, 0, 0, 0, 1, 1,
-0.2459044, 1.392297, 1.799439, 0, 0, 0, 1, 1,
-0.2448436, 0.4805466, -2.371263, 1, 1, 1, 1, 1,
-0.2443261, -0.7921351, -4.317185, 1, 1, 1, 1, 1,
-0.2418272, 2.007846, 0.2678192, 1, 1, 1, 1, 1,
-0.2406148, 0.7702106, -0.9874285, 1, 1, 1, 1, 1,
-0.2393434, -0.1361438, -1.09244, 1, 1, 1, 1, 1,
-0.2374645, 0.7009274, -0.925087, 1, 1, 1, 1, 1,
-0.2314172, 1.771113, 1.028986, 1, 1, 1, 1, 1,
-0.2265016, -1.468494, -2.099018, 1, 1, 1, 1, 1,
-0.2262552, -0.2767183, -0.8199544, 1, 1, 1, 1, 1,
-0.2216253, 0.9091014, -0.1796471, 1, 1, 1, 1, 1,
-0.2174357, -0.7543119, -2.079456, 1, 1, 1, 1, 1,
-0.2142983, 0.8855633, 1.282912, 1, 1, 1, 1, 1,
-0.2136811, -0.5095873, -1.342356, 1, 1, 1, 1, 1,
-0.2117078, -0.6259729, -2.9785, 1, 1, 1, 1, 1,
-0.2103944, 1.01482, -0.4534579, 1, 1, 1, 1, 1,
-0.2079253, -0.4224454, -1.127369, 0, 0, 1, 1, 1,
-0.2066132, -0.5385227, -3.506733, 1, 0, 0, 1, 1,
-0.2020866, -0.8252125, -2.828394, 1, 0, 0, 1, 1,
-0.2019297, 0.04360164, -1.773133, 1, 0, 0, 1, 1,
-0.2003644, 0.8997325, 1.255562, 1, 0, 0, 1, 1,
-0.1891737, 0.313897, -2.817447, 1, 0, 0, 1, 1,
-0.1889492, -1.352376, -2.811375, 0, 0, 0, 1, 1,
-0.1872717, 0.3181453, -0.7180974, 0, 0, 0, 1, 1,
-0.1867494, 0.8325223, 1.042253, 0, 0, 0, 1, 1,
-0.1861801, 0.3523837, -0.4009534, 0, 0, 0, 1, 1,
-0.1854677, -0.0600821, -0.4266162, 0, 0, 0, 1, 1,
-0.1832483, 1.237395, -0.3754995, 0, 0, 0, 1, 1,
-0.1741225, 0.3243457, 0.9282746, 0, 0, 0, 1, 1,
-0.173958, 0.9595391, 0.36405, 1, 1, 1, 1, 1,
-0.1723874, -0.6190038, -2.535545, 1, 1, 1, 1, 1,
-0.1667867, -0.6822903, -2.639424, 1, 1, 1, 1, 1,
-0.1661744, -1.588834, -2.786384, 1, 1, 1, 1, 1,
-0.1617388, 3.012383, 0.6646903, 1, 1, 1, 1, 1,
-0.1535888, -0.06302939, -2.863142, 1, 1, 1, 1, 1,
-0.1444122, 1.442647, 0.1832955, 1, 1, 1, 1, 1,
-0.1440503, -0.4919259, -3.130115, 1, 1, 1, 1, 1,
-0.1435093, -0.694125, -2.213799, 1, 1, 1, 1, 1,
-0.135736, -0.8514118, -2.523111, 1, 1, 1, 1, 1,
-0.135603, -0.7190989, -3.047196, 1, 1, 1, 1, 1,
-0.1344362, 0.4483543, -0.5927147, 1, 1, 1, 1, 1,
-0.1204103, 0.03213682, -1.513454, 1, 1, 1, 1, 1,
-0.1202399, 0.4641646, 0.1054113, 1, 1, 1, 1, 1,
-0.1192149, -1.938573, -3.625179, 1, 1, 1, 1, 1,
-0.1146617, -0.2120783, -2.451931, 0, 0, 1, 1, 1,
-0.1144494, 0.5352031, -1.144091, 1, 0, 0, 1, 1,
-0.1138429, -1.617871, -1.849198, 1, 0, 0, 1, 1,
-0.1128942, -0.09820428, -2.603192, 1, 0, 0, 1, 1,
-0.1126347, 0.9469669, -1.120867, 1, 0, 0, 1, 1,
-0.1091149, 0.4611618, -0.7059989, 1, 0, 0, 1, 1,
-0.1070969, -0.6934745, -3.230049, 0, 0, 0, 1, 1,
-0.1043165, 0.1049875, -1.122602, 0, 0, 0, 1, 1,
-0.1034089, 0.3034991, -0.4364473, 0, 0, 0, 1, 1,
-0.1022197, 0.02846848, -0.904265, 0, 0, 0, 1, 1,
-0.09660218, -0.3201514, -2.660142, 0, 0, 0, 1, 1,
-0.09546591, 1.174309, -0.9094246, 0, 0, 0, 1, 1,
-0.09336878, -0.1400781, -2.944463, 0, 0, 0, 1, 1,
-0.09279943, -0.907114, -4.066527, 1, 1, 1, 1, 1,
-0.09085467, -0.376893, -4.681203, 1, 1, 1, 1, 1,
-0.08835766, 0.1076359, -1.947351, 1, 1, 1, 1, 1,
-0.08605059, 0.01213507, -1.127511, 1, 1, 1, 1, 1,
-0.08590627, 0.0327889, -0.905951, 1, 1, 1, 1, 1,
-0.07779367, -1.049818, -3.525678, 1, 1, 1, 1, 1,
-0.0774339, 1.023889, -1.882465, 1, 1, 1, 1, 1,
-0.07395429, 0.3187923, -2.07872, 1, 1, 1, 1, 1,
-0.07326017, -0.01945124, 0.08072358, 1, 1, 1, 1, 1,
-0.07176656, 0.2791544, -1.038859, 1, 1, 1, 1, 1,
-0.07135384, -0.7509753, -3.662186, 1, 1, 1, 1, 1,
-0.06767575, 0.3200402, 0.7773787, 1, 1, 1, 1, 1,
-0.06472521, -0.3726141, -3.070418, 1, 1, 1, 1, 1,
-0.06396239, -0.7763416, -3.692921, 1, 1, 1, 1, 1,
-0.06364811, -0.4410063, -2.844032, 1, 1, 1, 1, 1,
-0.06194647, 1.262209, -0.2249562, 0, 0, 1, 1, 1,
-0.0593075, -1.200798, -1.750053, 1, 0, 0, 1, 1,
-0.05751495, 0.9555271, 2.226444, 1, 0, 0, 1, 1,
-0.0544817, -0.6188861, -4.478034, 1, 0, 0, 1, 1,
-0.05346381, 1.968632, 0.08868255, 1, 0, 0, 1, 1,
-0.04950552, 0.421285, -0.420013, 1, 0, 0, 1, 1,
-0.04853798, 1.197771, 0.6717932, 0, 0, 0, 1, 1,
-0.04826389, 0.7122961, 0.3426683, 0, 0, 0, 1, 1,
-0.04657871, -0.6139451, -3.87817, 0, 0, 0, 1, 1,
-0.04573658, 1.400713, 0.1218036, 0, 0, 0, 1, 1,
-0.04468951, 0.1358283, -0.6538624, 0, 0, 0, 1, 1,
-0.04315701, -0.09422681, -0.2962599, 0, 0, 0, 1, 1,
-0.0397757, -0.2191559, -1.579803, 0, 0, 0, 1, 1,
-0.0379291, -1.500821, -3.717881, 1, 1, 1, 1, 1,
-0.03660716, 0.7390354, -0.4185397, 1, 1, 1, 1, 1,
-0.03570598, 1.298772, -0.5247301, 1, 1, 1, 1, 1,
-0.03414225, 0.7555404, -0.6533265, 1, 1, 1, 1, 1,
-0.03375183, -1.26957, -3.524461, 1, 1, 1, 1, 1,
-0.03362402, 0.7834641, 0.2091309, 1, 1, 1, 1, 1,
-0.03130947, 0.5573319, 0.9272358, 1, 1, 1, 1, 1,
-0.03087871, -0.6172283, -3.625763, 1, 1, 1, 1, 1,
-0.02789235, -0.2809643, -2.960839, 1, 1, 1, 1, 1,
-0.02765582, -2.439571, -2.478198, 1, 1, 1, 1, 1,
-0.02604279, -0.3342187, -3.112712, 1, 1, 1, 1, 1,
-0.0239687, 0.9481576, 0.009106024, 1, 1, 1, 1, 1,
-0.02165272, 0.8122477, 0.1973563, 1, 1, 1, 1, 1,
-0.01883368, -0.5258113, -2.368905, 1, 1, 1, 1, 1,
-0.007354991, 1.580471, -0.06860802, 1, 1, 1, 1, 1,
-0.004918405, -0.6547791, -3.225163, 0, 0, 1, 1, 1,
-0.00269259, 0.8256748, -0.04012334, 1, 0, 0, 1, 1,
-0.002611246, -0.5903915, -4.176471, 1, 0, 0, 1, 1,
-0.0009063942, -1.173398, -4.23692, 1, 0, 0, 1, 1,
0.003469686, -0.8352687, 2.868277, 1, 0, 0, 1, 1,
0.007009734, -0.3352034, 2.151605, 1, 0, 0, 1, 1,
0.007542079, 1.58171, 0.3166978, 0, 0, 0, 1, 1,
0.00963236, -0.3341019, 2.033358, 0, 0, 0, 1, 1,
0.01235117, 0.1218783, 1.959684, 0, 0, 0, 1, 1,
0.01281876, 0.144507, 0.8751236, 0, 0, 0, 1, 1,
0.01415898, -1.344943, 3.402285, 0, 0, 0, 1, 1,
0.02203418, -1.031096, 1.62834, 0, 0, 0, 1, 1,
0.02823537, -0.6205728, 3.213108, 0, 0, 0, 1, 1,
0.02843703, 0.8552765, 1.153705, 1, 1, 1, 1, 1,
0.03104685, -1.146606, 0.9706979, 1, 1, 1, 1, 1,
0.03608804, -0.4224524, 1.247073, 1, 1, 1, 1, 1,
0.03642708, -0.3556639, 3.854221, 1, 1, 1, 1, 1,
0.03674637, -1.449491, 2.656759, 1, 1, 1, 1, 1,
0.03921891, -0.1293354, 2.964661, 1, 1, 1, 1, 1,
0.04204465, 2.286036, -0.04051912, 1, 1, 1, 1, 1,
0.04775541, 0.2490465, 0.3786147, 1, 1, 1, 1, 1,
0.04917238, -0.7381402, 2.738142, 1, 1, 1, 1, 1,
0.05127775, 1.348083, -1.050539, 1, 1, 1, 1, 1,
0.05903966, -1.952438, 2.811056, 1, 1, 1, 1, 1,
0.06235936, -1.278404, 3.576025, 1, 1, 1, 1, 1,
0.069122, 0.4366096, 0.8779764, 1, 1, 1, 1, 1,
0.06990574, -0.4247837, 3.817233, 1, 1, 1, 1, 1,
0.07437827, 1.59231, -0.9138372, 1, 1, 1, 1, 1,
0.0770926, 0.08747459, 2.25091, 0, 0, 1, 1, 1,
0.08051628, -0.08878648, 3.664572, 1, 0, 0, 1, 1,
0.08374544, -1.361879, 4.957368, 1, 0, 0, 1, 1,
0.08395146, 0.164787, 1.289248, 1, 0, 0, 1, 1,
0.08556364, -1.340043, 3.219746, 1, 0, 0, 1, 1,
0.0910133, 0.7657762, 1.589823, 1, 0, 0, 1, 1,
0.09262189, 1.082564, 0.1295534, 0, 0, 0, 1, 1,
0.09526835, -1.24653, 3.958492, 0, 0, 0, 1, 1,
0.09708853, -0.4821301, 3.018882, 0, 0, 0, 1, 1,
0.09716381, -0.3071219, 1.9795, 0, 0, 0, 1, 1,
0.09834893, 0.4146577, 0.4442336, 0, 0, 0, 1, 1,
0.1046058, -1.301227, 2.932121, 0, 0, 0, 1, 1,
0.1049344, -1.021317, 3.226748, 0, 0, 0, 1, 1,
0.1068972, -1.237065, 1.023388, 1, 1, 1, 1, 1,
0.1099541, 0.8022113, 0.6852406, 1, 1, 1, 1, 1,
0.1130459, -0.6307799, 3.326023, 1, 1, 1, 1, 1,
0.11645, 0.3001452, 1.183488, 1, 1, 1, 1, 1,
0.1172574, 0.159337, -0.1943658, 1, 1, 1, 1, 1,
0.1191348, -1.443036, 1.780497, 1, 1, 1, 1, 1,
0.1208973, 0.4776774, 1.004756, 1, 1, 1, 1, 1,
0.1225598, 0.05490118, 1.681362, 1, 1, 1, 1, 1,
0.1239813, -0.04278674, 1.372818, 1, 1, 1, 1, 1,
0.1297268, -0.6976864, 1.929062, 1, 1, 1, 1, 1,
0.1314883, 0.9561611, -0.2290241, 1, 1, 1, 1, 1,
0.1342136, -0.6176116, 3.37598, 1, 1, 1, 1, 1,
0.1398748, 0.7961106, -1.249544, 1, 1, 1, 1, 1,
0.1414664, 0.6341184, -0.7307988, 1, 1, 1, 1, 1,
0.1430533, 0.6816144, 0.1723262, 1, 1, 1, 1, 1,
0.1432465, 0.7583649, 0.5344439, 0, 0, 1, 1, 1,
0.1504, -1.196159, 3.255194, 1, 0, 0, 1, 1,
0.1564047, 0.4179262, 0.6622976, 1, 0, 0, 1, 1,
0.1581492, 0.8245011, -0.1397624, 1, 0, 0, 1, 1,
0.1620716, 0.5529225, 1.439794, 1, 0, 0, 1, 1,
0.1649569, -1.158044, 1.596642, 1, 0, 0, 1, 1,
0.1665621, -0.801029, 3.455462, 0, 0, 0, 1, 1,
0.1688976, -1.500162, 3.42526, 0, 0, 0, 1, 1,
0.1690917, 0.4549244, -0.1604908, 0, 0, 0, 1, 1,
0.1731603, -0.7582862, 2.558654, 0, 0, 0, 1, 1,
0.174369, 0.02628175, 1.54433, 0, 0, 0, 1, 1,
0.1752963, -0.2005858, 2.296983, 0, 0, 0, 1, 1,
0.1758889, -1.582715, 3.311118, 0, 0, 0, 1, 1,
0.1775454, -0.6069397, 2.948257, 1, 1, 1, 1, 1,
0.1820816, 0.9271445, 0.9375494, 1, 1, 1, 1, 1,
0.1842853, 0.2495488, 1.2206, 1, 1, 1, 1, 1,
0.1855408, 1.269484, 1.009231, 1, 1, 1, 1, 1,
0.1890437, 0.521817, -1.189656, 1, 1, 1, 1, 1,
0.1892388, -1.66251, 1.810961, 1, 1, 1, 1, 1,
0.1919154, 0.5078939, 0.4962923, 1, 1, 1, 1, 1,
0.1924826, 1.561361, 0.6139158, 1, 1, 1, 1, 1,
0.1960509, -1.068244, 3.0904, 1, 1, 1, 1, 1,
0.1967641, -1.729948, 1.929225, 1, 1, 1, 1, 1,
0.2063206, -0.515313, 2.600316, 1, 1, 1, 1, 1,
0.2080749, -0.1092534, 1.770785, 1, 1, 1, 1, 1,
0.2081949, 0.6358576, 1.962685, 1, 1, 1, 1, 1,
0.217476, -1.869633, 3.130232, 1, 1, 1, 1, 1,
0.2176665, -1.081598, 2.909451, 1, 1, 1, 1, 1,
0.2186987, 0.5053586, 0.6912162, 0, 0, 1, 1, 1,
0.2357757, -0.4325709, 3.961175, 1, 0, 0, 1, 1,
0.236791, -0.6864787, 3.488158, 1, 0, 0, 1, 1,
0.2369324, -0.1405126, 2.843904, 1, 0, 0, 1, 1,
0.23721, 1.022549, -0.2801949, 1, 0, 0, 1, 1,
0.2385381, 0.114658, 1.625486, 1, 0, 0, 1, 1,
0.2409222, -1.313547, 3.919457, 0, 0, 0, 1, 1,
0.2418767, 1.608375, -1.429282, 0, 0, 0, 1, 1,
0.2438362, -0.1653717, 1.378997, 0, 0, 0, 1, 1,
0.2456287, -0.5784122, 2.819309, 0, 0, 0, 1, 1,
0.2490586, -0.6963102, 3.313165, 0, 0, 0, 1, 1,
0.2544613, -0.48467, 3.726154, 0, 0, 0, 1, 1,
0.2547862, -3.025711, 3.266985, 0, 0, 0, 1, 1,
0.2567102, -1.068054, 2.868736, 1, 1, 1, 1, 1,
0.2582602, -0.5565888, 3.70626, 1, 1, 1, 1, 1,
0.2586771, -1.404938, 3.239564, 1, 1, 1, 1, 1,
0.2597556, -0.04235436, 2.106819, 1, 1, 1, 1, 1,
0.2662587, -0.9999576, 3.214095, 1, 1, 1, 1, 1,
0.2690887, 0.09527678, 1.197211, 1, 1, 1, 1, 1,
0.2695902, 0.1532549, 1.40603, 1, 1, 1, 1, 1,
0.2725195, -0.7513345, 3.83433, 1, 1, 1, 1, 1,
0.2763227, -2.066484, 2.938884, 1, 1, 1, 1, 1,
0.2773932, 0.3720501, 0.6108897, 1, 1, 1, 1, 1,
0.2891346, -0.4026366, 3.369875, 1, 1, 1, 1, 1,
0.2903167, 0.1388287, -0.3863745, 1, 1, 1, 1, 1,
0.2916318, 2.175124, 1.361276, 1, 1, 1, 1, 1,
0.2929236, 1.886858, 0.2217306, 1, 1, 1, 1, 1,
0.2960347, 1.255535, -0.02663835, 1, 1, 1, 1, 1,
0.2990376, -1.112563, 3.021399, 0, 0, 1, 1, 1,
0.2994945, 0.5095844, -0.3549466, 1, 0, 0, 1, 1,
0.3050721, -0.2652677, 3.667799, 1, 0, 0, 1, 1,
0.3086376, -0.425847, 2.717032, 1, 0, 0, 1, 1,
0.3098952, -0.246302, 2.006445, 1, 0, 0, 1, 1,
0.3117455, 0.6118926, 1.118359, 1, 0, 0, 1, 1,
0.3190849, 0.7817051, 0.1535224, 0, 0, 0, 1, 1,
0.3206702, 0.04491258, 0.3380607, 0, 0, 0, 1, 1,
0.3228873, 0.7876154, 0.5720568, 0, 0, 0, 1, 1,
0.3254999, -2.441764, 4.375477, 0, 0, 0, 1, 1,
0.3376325, -0.954163, 3.344075, 0, 0, 0, 1, 1,
0.3407415, 0.3828304, 1.591865, 0, 0, 0, 1, 1,
0.3463411, 0.8994138, -1.402174, 0, 0, 0, 1, 1,
0.3478423, -0.2091485, 4.389906, 1, 1, 1, 1, 1,
0.3481476, 0.2171418, 0.7205879, 1, 1, 1, 1, 1,
0.3493899, -0.4426955, 3.128017, 1, 1, 1, 1, 1,
0.3505271, 0.616705, -1.160363, 1, 1, 1, 1, 1,
0.3513627, 0.3733309, -0.2156139, 1, 1, 1, 1, 1,
0.3516229, 0.4746341, 1.838968, 1, 1, 1, 1, 1,
0.3576279, 0.5244516, 1.377132, 1, 1, 1, 1, 1,
0.367429, 0.8995308, 0.08011215, 1, 1, 1, 1, 1,
0.3693753, 0.238977, 1.613885, 1, 1, 1, 1, 1,
0.3708368, -0.7907879, 2.92863, 1, 1, 1, 1, 1,
0.3718339, 0.4049466, 0.2745557, 1, 1, 1, 1, 1,
0.375161, 0.4124292, 1.525397, 1, 1, 1, 1, 1,
0.3780009, 0.2493715, 1.255191, 1, 1, 1, 1, 1,
0.3806235, -2.036014, 3.786491, 1, 1, 1, 1, 1,
0.3855356, -0.9885054, 1.503257, 1, 1, 1, 1, 1,
0.3857669, 0.4006147, 1.607241, 0, 0, 1, 1, 1,
0.3899637, 0.241453, 0.5280672, 1, 0, 0, 1, 1,
0.3905746, -0.8674342, 1.955513, 1, 0, 0, 1, 1,
0.3909026, 0.1824744, 0.9684267, 1, 0, 0, 1, 1,
0.391039, -1.215196, 2.004872, 1, 0, 0, 1, 1,
0.3918467, 0.4397735, 1.825222, 1, 0, 0, 1, 1,
0.3927838, 0.06791891, 1.537919, 0, 0, 0, 1, 1,
0.3929273, 1.520174, -0.2661428, 0, 0, 0, 1, 1,
0.3933669, -1.420823, 2.996056, 0, 0, 0, 1, 1,
0.4050191, 1.03931, -1.380605, 0, 0, 0, 1, 1,
0.4059011, -0.05687433, 1.66814, 0, 0, 0, 1, 1,
0.4060658, -1.387943, 3.071744, 0, 0, 0, 1, 1,
0.4075227, -1.676556, 4.161913, 0, 0, 0, 1, 1,
0.4145758, -0.002917055, 1.903556, 1, 1, 1, 1, 1,
0.4147791, 0.2030975, 2.531011, 1, 1, 1, 1, 1,
0.4172412, -0.8918541, 0.7771158, 1, 1, 1, 1, 1,
0.4183966, 0.4475912, 0.8527169, 1, 1, 1, 1, 1,
0.4201022, 0.2403321, -0.07371951, 1, 1, 1, 1, 1,
0.4216789, 1.119184, -0.5012583, 1, 1, 1, 1, 1,
0.4216996, 0.3463701, 0.1042596, 1, 1, 1, 1, 1,
0.4226168, 0.6537297, -0.2103422, 1, 1, 1, 1, 1,
0.4228356, 0.8893383, 1.284361, 1, 1, 1, 1, 1,
0.4229331, 0.3838993, 0.6197431, 1, 1, 1, 1, 1,
0.4253818, -0.06978192, 2.108502, 1, 1, 1, 1, 1,
0.4389382, 0.1467138, 1.073991, 1, 1, 1, 1, 1,
0.4423304, -0.4518423, 1.053719, 1, 1, 1, 1, 1,
0.4497241, -0.2775452, 3.524672, 1, 1, 1, 1, 1,
0.4529051, 1.06444, -0.7790784, 1, 1, 1, 1, 1,
0.4552291, 1.20006, -0.1851327, 0, 0, 1, 1, 1,
0.4569764, -1.53484, 2.30672, 1, 0, 0, 1, 1,
0.4640842, 0.4094584, 0.02566967, 1, 0, 0, 1, 1,
0.4657361, 0.06806555, 1.713924, 1, 0, 0, 1, 1,
0.4676052, -1.842153, 1.261985, 1, 0, 0, 1, 1,
0.47058, -1.361893, 2.285933, 1, 0, 0, 1, 1,
0.4838406, 0.1488585, 3.215539, 0, 0, 0, 1, 1,
0.4857763, 0.6706867, -1.136461, 0, 0, 0, 1, 1,
0.4907289, 0.5225325, -0.3504515, 0, 0, 0, 1, 1,
0.4938236, 1.415084, 2.011764, 0, 0, 0, 1, 1,
0.4952613, -0.2470615, 2.580942, 0, 0, 0, 1, 1,
0.498154, -1.048392, 3.302117, 0, 0, 0, 1, 1,
0.5083635, -1.035746, 1.56218, 0, 0, 0, 1, 1,
0.5100552, -0.8290675, 3.960069, 1, 1, 1, 1, 1,
0.512536, 0.01260008, 0.8797001, 1, 1, 1, 1, 1,
0.5140017, 1.094394, 0.8079548, 1, 1, 1, 1, 1,
0.5156115, 0.2489775, 1.577963, 1, 1, 1, 1, 1,
0.517639, -1.046535, 3.226058, 1, 1, 1, 1, 1,
0.5184362, -0.9537174, 3.170115, 1, 1, 1, 1, 1,
0.5239419, -0.2086743, 2.808883, 1, 1, 1, 1, 1,
0.5261459, 1.376378, 0.7170253, 1, 1, 1, 1, 1,
0.527528, -1.12907, 3.363898, 1, 1, 1, 1, 1,
0.5280728, -0.4120028, 2.155418, 1, 1, 1, 1, 1,
0.528674, -0.02533832, 0.4812956, 1, 1, 1, 1, 1,
0.5303158, 0.1362689, 0.3546946, 1, 1, 1, 1, 1,
0.5310194, 0.1441044, 0.02599012, 1, 1, 1, 1, 1,
0.5335741, -0.1510842, 2.433033, 1, 1, 1, 1, 1,
0.5345581, -0.01521431, 1.204048, 1, 1, 1, 1, 1,
0.5391919, -0.6501283, 1.73297, 0, 0, 1, 1, 1,
0.5435973, -0.7741725, 3.476849, 1, 0, 0, 1, 1,
0.5497015, 1.423915, 1.42858, 1, 0, 0, 1, 1,
0.5499187, 0.4392655, 0.3246909, 1, 0, 0, 1, 1,
0.5522205, -0.1298421, -0.1472656, 1, 0, 0, 1, 1,
0.5551767, -0.3408031, 2.805681, 1, 0, 0, 1, 1,
0.5606982, -0.3957061, 1.649371, 0, 0, 0, 1, 1,
0.5618867, -0.03882876, -0.1830907, 0, 0, 0, 1, 1,
0.562583, -0.828, 0.6261, 0, 0, 0, 1, 1,
0.5671102, -0.8675846, 4.283508, 0, 0, 0, 1, 1,
0.5730634, 0.8476974, -0.004958425, 0, 0, 0, 1, 1,
0.5791702, 0.02280783, 0.4862315, 0, 0, 0, 1, 1,
0.5867452, 0.7296566, -0.5360097, 0, 0, 0, 1, 1,
0.5877659, 0.2829398, -0.3645323, 1, 1, 1, 1, 1,
0.5920261, -0.2674495, 4.536199, 1, 1, 1, 1, 1,
0.5924994, 0.7864473, 0.8144032, 1, 1, 1, 1, 1,
0.5939463, -0.4614914, 2.818182, 1, 1, 1, 1, 1,
0.594449, 0.09892756, 1.49777, 1, 1, 1, 1, 1,
0.5948693, 2.37479, -1.302774, 1, 1, 1, 1, 1,
0.5952733, -1.059545, 1.630271, 1, 1, 1, 1, 1,
0.5975699, 0.3132964, 1.178114, 1, 1, 1, 1, 1,
0.6126345, -0.733925, 1.926747, 1, 1, 1, 1, 1,
0.614194, 0.2650086, 0.5484491, 1, 1, 1, 1, 1,
0.6176701, -0.05391283, 1.741329, 1, 1, 1, 1, 1,
0.6246535, -1.067593, 1.70925, 1, 1, 1, 1, 1,
0.6267091, -1.680381, 3.962499, 1, 1, 1, 1, 1,
0.6274793, 1.42921, 0.4542916, 1, 1, 1, 1, 1,
0.6315165, -0.5315413, 2.244347, 1, 1, 1, 1, 1,
0.6317983, -0.9462123, 2.185808, 0, 0, 1, 1, 1,
0.63384, 0.2826124, 1.180836, 1, 0, 0, 1, 1,
0.6338504, -0.004023078, 1.153493, 1, 0, 0, 1, 1,
0.6417697, -1.327565, 2.725398, 1, 0, 0, 1, 1,
0.6443683, 0.229679, 1.88639, 1, 0, 0, 1, 1,
0.6456774, -2.280128, 4.599475, 1, 0, 0, 1, 1,
0.6457648, -0.05838903, 1.201593, 0, 0, 0, 1, 1,
0.6605673, 0.997662, 0.8353973, 0, 0, 0, 1, 1,
0.6618788, -0.3543016, 2.563036, 0, 0, 0, 1, 1,
0.6655165, 1.551749, 0.4106538, 0, 0, 0, 1, 1,
0.6673387, 1.392756, 0.04114677, 0, 0, 0, 1, 1,
0.6705908, 1.182131, 2.594857, 0, 0, 0, 1, 1,
0.6764529, 0.5875211, -0.2248004, 0, 0, 0, 1, 1,
0.6796017, -1.616062, 3.630756, 1, 1, 1, 1, 1,
0.6810681, 0.8064178, 0.5263312, 1, 1, 1, 1, 1,
0.6877971, -0.4740717, 2.603152, 1, 1, 1, 1, 1,
0.6915833, 0.5520813, 0.7570882, 1, 1, 1, 1, 1,
0.6946992, 1.048626, 1.493548, 1, 1, 1, 1, 1,
0.6995514, -0.5931718, 1.974706, 1, 1, 1, 1, 1,
0.7043069, -0.1522641, 2.352799, 1, 1, 1, 1, 1,
0.7070434, -1.008426, 2.831134, 1, 1, 1, 1, 1,
0.7083974, 0.2940069, 2.186547, 1, 1, 1, 1, 1,
0.7086875, -0.6747354, 2.469338, 1, 1, 1, 1, 1,
0.7101299, 1.388329, -0.05425159, 1, 1, 1, 1, 1,
0.7106284, -0.05895971, 3.421252, 1, 1, 1, 1, 1,
0.7110664, -1.466433, 1.773099, 1, 1, 1, 1, 1,
0.7115352, -0.08253865, 3.147574, 1, 1, 1, 1, 1,
0.7192304, 0.9363649, 1.771957, 1, 1, 1, 1, 1,
0.7211014, 0.09722681, -0.9116282, 0, 0, 1, 1, 1,
0.7214655, 1.707621, 1.508882, 1, 0, 0, 1, 1,
0.7231708, -0.157522, 0.1182799, 1, 0, 0, 1, 1,
0.7240714, -0.7314768, 2.978088, 1, 0, 0, 1, 1,
0.7300103, -0.1797637, 2.650743, 1, 0, 0, 1, 1,
0.7329187, -0.7028363, 2.409606, 1, 0, 0, 1, 1,
0.7345024, 1.59719, 0.1216773, 0, 0, 0, 1, 1,
0.7354351, -1.093238, 3.007293, 0, 0, 0, 1, 1,
0.7367605, -0.6214412, 3.151287, 0, 0, 0, 1, 1,
0.7378645, 1.258619, -1.477933, 0, 0, 0, 1, 1,
0.7389657, -2.246312, 1.589465, 0, 0, 0, 1, 1,
0.7405113, -1.377461, 2.797073, 0, 0, 0, 1, 1,
0.7408096, 0.689507, 0.1701746, 0, 0, 0, 1, 1,
0.741714, 0.3462632, 3.184228, 1, 1, 1, 1, 1,
0.7461702, 0.3550468, 1.743129, 1, 1, 1, 1, 1,
0.7533654, -0.7700768, 1.250668, 1, 1, 1, 1, 1,
0.7540768, -1.191451, 3.303411, 1, 1, 1, 1, 1,
0.7584041, -0.8441703, 2.288665, 1, 1, 1, 1, 1,
0.7593863, -1.128947, 0.7147081, 1, 1, 1, 1, 1,
0.7598688, -1.184177, 2.699639, 1, 1, 1, 1, 1,
0.7642087, -0.006894003, 2.037804, 1, 1, 1, 1, 1,
0.7677693, 0.9512238, 1.395665, 1, 1, 1, 1, 1,
0.7783954, 0.4899236, 0.4553596, 1, 1, 1, 1, 1,
0.7805638, 1.130612, -0.9785361, 1, 1, 1, 1, 1,
0.7818801, 0.2812861, 3.581631, 1, 1, 1, 1, 1,
0.7968873, -0.7468941, 2.800289, 1, 1, 1, 1, 1,
0.7988867, 0.3074247, 1.490272, 1, 1, 1, 1, 1,
0.8145056, 0.2070317, 2.44737, 1, 1, 1, 1, 1,
0.8148096, -1.062474, 3.320004, 0, 0, 1, 1, 1,
0.8256401, 0.2975553, 2.051796, 1, 0, 0, 1, 1,
0.8263202, -0.1775592, 1.380204, 1, 0, 0, 1, 1,
0.8307901, 0.03854616, 0.9712383, 1, 0, 0, 1, 1,
0.8365814, -0.6240748, 2.683283, 1, 0, 0, 1, 1,
0.8395049, -0.8269173, 0.9029617, 1, 0, 0, 1, 1,
0.8465902, -0.5825319, 2.42539, 0, 0, 0, 1, 1,
0.8514715, -0.5299782, 1.05718, 0, 0, 0, 1, 1,
0.8521563, -0.4847188, 1.239399, 0, 0, 0, 1, 1,
0.8609048, 0.09940763, 2.356639, 0, 0, 0, 1, 1,
0.8639979, -0.2988418, 0.7234007, 0, 0, 0, 1, 1,
0.867743, 0.2343922, 0.3784142, 0, 0, 0, 1, 1,
0.8810081, 0.9917731, 1.477193, 0, 0, 0, 1, 1,
0.8982701, 2.22545, -0.5959395, 1, 1, 1, 1, 1,
0.9008998, -1.352842, 3.058838, 1, 1, 1, 1, 1,
0.9017951, 1.536979, 0.864237, 1, 1, 1, 1, 1,
0.912619, 1.228095, 0.6165968, 1, 1, 1, 1, 1,
0.9139559, -0.02603734, 2.480462, 1, 1, 1, 1, 1,
0.9223447, 1.459128, 2.252556, 1, 1, 1, 1, 1,
0.9230992, -1.076367, 2.654283, 1, 1, 1, 1, 1,
0.9274125, -0.5303044, 3.814279, 1, 1, 1, 1, 1,
0.9289004, 0.09321116, 2.738062, 1, 1, 1, 1, 1,
0.9496223, 1.71399, 1.890502, 1, 1, 1, 1, 1,
0.9507582, 1.500311, 0.05754784, 1, 1, 1, 1, 1,
0.9531956, -0.3198774, 2.518518, 1, 1, 1, 1, 1,
0.9545119, 0.5966685, 0.7153844, 1, 1, 1, 1, 1,
0.9568754, 0.9316506, -0.5930987, 1, 1, 1, 1, 1,
0.9661206, 0.02974879, 1.517905, 1, 1, 1, 1, 1,
0.9668303, 0.1334886, 2.989026, 0, 0, 1, 1, 1,
0.9684353, -0.7598633, 2.226778, 1, 0, 0, 1, 1,
0.9716021, 0.949305, 0.5141599, 1, 0, 0, 1, 1,
0.9737736, -1.186598, 3.200022, 1, 0, 0, 1, 1,
0.9826406, -1.99797, 4.559891, 1, 0, 0, 1, 1,
0.9833134, 0.9985133, 0.9754061, 1, 0, 0, 1, 1,
0.9837517, -0.02181941, 2.437957, 0, 0, 0, 1, 1,
0.9844454, 1.305867, 0.6280631, 0, 0, 0, 1, 1,
0.9853937, -0.550942, 2.021746, 0, 0, 0, 1, 1,
0.9920058, -0.1660119, 0.848161, 0, 0, 0, 1, 1,
0.9956219, -2.4496, 1.956556, 0, 0, 0, 1, 1,
0.9957874, -0.6842873, 3.677247, 0, 0, 0, 1, 1,
0.9963084, -0.4634158, 0.762663, 0, 0, 0, 1, 1,
0.9963132, 0.01114994, 1.651444, 1, 1, 1, 1, 1,
0.998815, 1.496347, 1.808172, 1, 1, 1, 1, 1,
1.00527, -0.7189409, 3.366328, 1, 1, 1, 1, 1,
1.010929, 0.2385731, -0.789103, 1, 1, 1, 1, 1,
1.011191, 1.481141, 0.257886, 1, 1, 1, 1, 1,
1.011285, -0.5171482, 3.138727, 1, 1, 1, 1, 1,
1.018401, -1.111618, 1.986375, 1, 1, 1, 1, 1,
1.029279, -1.459332, 1.733192, 1, 1, 1, 1, 1,
1.037138, -0.1991383, 1.424242, 1, 1, 1, 1, 1,
1.046354, 0.8960342, 2.074447, 1, 1, 1, 1, 1,
1.049972, 0.711938, 0.7991109, 1, 1, 1, 1, 1,
1.052491, -0.1407742, 0.5199215, 1, 1, 1, 1, 1,
1.058058, 0.1578191, 1.242122, 1, 1, 1, 1, 1,
1.062129, -0.9035253, 1.959962, 1, 1, 1, 1, 1,
1.066571, 0.007186206, 0.9941707, 1, 1, 1, 1, 1,
1.069306, 0.3305006, 0.4349332, 0, 0, 1, 1, 1,
1.076865, -1.411277, 2.065706, 1, 0, 0, 1, 1,
1.079419, -0.8436347, 2.352552, 1, 0, 0, 1, 1,
1.086183, 0.1985713, 1.300364, 1, 0, 0, 1, 1,
1.099427, -0.02179686, 2.421803, 1, 0, 0, 1, 1,
1.10417, -0.02319699, 2.197583, 1, 0, 0, 1, 1,
1.105858, -0.1664089, 0.6094739, 0, 0, 0, 1, 1,
1.108781, -1.092618, 2.703019, 0, 0, 0, 1, 1,
1.109557, -0.4820624, 1.346595, 0, 0, 0, 1, 1,
1.110163, 0.6777093, 1.264878, 0, 0, 0, 1, 1,
1.110723, -0.6478435, 3.056564, 0, 0, 0, 1, 1,
1.112702, 0.08816936, -0.2349622, 0, 0, 0, 1, 1,
1.114438, -0.8812871, 3.54879, 0, 0, 0, 1, 1,
1.119584, -0.9811543, 2.828933, 1, 1, 1, 1, 1,
1.127861, -0.7907977, 3.979043, 1, 1, 1, 1, 1,
1.128621, 0.05244365, 2.50943, 1, 1, 1, 1, 1,
1.128998, 0.5088219, 2.553554, 1, 1, 1, 1, 1,
1.12907, -1.282606, 2.553652, 1, 1, 1, 1, 1,
1.140019, -0.8881646, 2.275264, 1, 1, 1, 1, 1,
1.142755, -1.229603, 3.78781, 1, 1, 1, 1, 1,
1.144273, -0.5143168, 0.850851, 1, 1, 1, 1, 1,
1.151111, -0.4266178, 1.978461, 1, 1, 1, 1, 1,
1.151672, -1.852392, 0.9688857, 1, 1, 1, 1, 1,
1.155039, -1.87795, 2.004081, 1, 1, 1, 1, 1,
1.158882, 0.8286641, 1.673045, 1, 1, 1, 1, 1,
1.161473, -0.3821114, 1.346655, 1, 1, 1, 1, 1,
1.164171, -1.0016, 4.02018, 1, 1, 1, 1, 1,
1.182829, -0.6405959, 1.153727, 1, 1, 1, 1, 1,
1.184536, 0.7746865, 0.5495365, 0, 0, 1, 1, 1,
1.197826, 1.254865, 0.8340366, 1, 0, 0, 1, 1,
1.211742, 0.2324993, 1.723524, 1, 0, 0, 1, 1,
1.216118, 0.7954813, 0.7717088, 1, 0, 0, 1, 1,
1.219585, 0.5551947, -0.1457116, 1, 0, 0, 1, 1,
1.229286, -0.2725332, 4.405031, 1, 0, 0, 1, 1,
1.234642, -0.9189684, 2.361354, 0, 0, 0, 1, 1,
1.238164, -0.8489252, 2.682195, 0, 0, 0, 1, 1,
1.238375, 0.0986228, 2.230492, 0, 0, 0, 1, 1,
1.246569, 1.289709, 0.7630633, 0, 0, 0, 1, 1,
1.250383, -2.112456, 1.692014, 0, 0, 0, 1, 1,
1.25172, -1.05684, 2.308293, 0, 0, 0, 1, 1,
1.258295, -0.1330195, 2.228859, 0, 0, 0, 1, 1,
1.260634, 0.9853505, 1.617464, 1, 1, 1, 1, 1,
1.263082, -0.4832684, 1.484432, 1, 1, 1, 1, 1,
1.275527, 0.7866351, 1.905753, 1, 1, 1, 1, 1,
1.286683, -0.4421523, 2.939848, 1, 1, 1, 1, 1,
1.288701, 0.2053327, 1.480156, 1, 1, 1, 1, 1,
1.30132, 0.8699944, -0.3354941, 1, 1, 1, 1, 1,
1.303741, 0.99651, 1.267975, 1, 1, 1, 1, 1,
1.305599, -2.542715, 2.385708, 1, 1, 1, 1, 1,
1.332191, 0.1998484, 1.295926, 1, 1, 1, 1, 1,
1.332744, 0.436779, 1.826161, 1, 1, 1, 1, 1,
1.339789, 1.793926, 1.038544, 1, 1, 1, 1, 1,
1.340689, 0.417849, 1.347558, 1, 1, 1, 1, 1,
1.357699, -0.8816227, 0.1167804, 1, 1, 1, 1, 1,
1.359384, 0.1861122, 1.419468, 1, 1, 1, 1, 1,
1.362451, 0.04468614, 0.007556994, 1, 1, 1, 1, 1,
1.368197, 0.5841787, 1.234922, 0, 0, 1, 1, 1,
1.37267, -0.9175103, 2.092351, 1, 0, 0, 1, 1,
1.374548, 0.6365666, 0.6658145, 1, 0, 0, 1, 1,
1.386199, 0.2685997, 1.136544, 1, 0, 0, 1, 1,
1.398245, -0.1256275, 0.6861072, 1, 0, 0, 1, 1,
1.403776, 0.006212471, 0.5054713, 1, 0, 0, 1, 1,
1.404668, 0.1795738, 0.5653762, 0, 0, 0, 1, 1,
1.404773, -0.0007813154, 2.6935, 0, 0, 0, 1, 1,
1.410969, 0.2520245, 0.6649175, 0, 0, 0, 1, 1,
1.416608, 0.4804124, 1.947751, 0, 0, 0, 1, 1,
1.424709, 2.209209, 0.5877113, 0, 0, 0, 1, 1,
1.426601, 0.002123893, 1.332523, 0, 0, 0, 1, 1,
1.430835, 0.02527473, 3.459048, 0, 0, 0, 1, 1,
1.447139, 2.387453, 0.3544006, 1, 1, 1, 1, 1,
1.453711, -0.03662003, 2.279747, 1, 1, 1, 1, 1,
1.460429, 0.4282753, -0.09173665, 1, 1, 1, 1, 1,
1.471193, -0.186835, 2.340886, 1, 1, 1, 1, 1,
1.481059, -1.195166, 1.997622, 1, 1, 1, 1, 1,
1.483523, -0.4729146, 2.354332, 1, 1, 1, 1, 1,
1.486926, 0.9376085, 2.154073, 1, 1, 1, 1, 1,
1.493235, -0.4174887, -1.652738, 1, 1, 1, 1, 1,
1.494013, -1.379326, 2.806691, 1, 1, 1, 1, 1,
1.49476, -0.4789349, 0.106217, 1, 1, 1, 1, 1,
1.496545, 1.071073, 0.3724986, 1, 1, 1, 1, 1,
1.506815, -0.7329305, 3.396385, 1, 1, 1, 1, 1,
1.50715, -0.04110638, 0.470399, 1, 1, 1, 1, 1,
1.524059, 1.1149, 1.055192, 1, 1, 1, 1, 1,
1.530877, 0.945999, 1.792716, 1, 1, 1, 1, 1,
1.547929, -0.1207816, 2.364135, 0, 0, 1, 1, 1,
1.566309, 0.5074199, 0.9417397, 1, 0, 0, 1, 1,
1.576113, -1.683463, 1.865869, 1, 0, 0, 1, 1,
1.576816, -0.3881824, 2.152631, 1, 0, 0, 1, 1,
1.581084, -0.5701463, 0.9234674, 1, 0, 0, 1, 1,
1.581139, 1.966761, -0.4531539, 1, 0, 0, 1, 1,
1.602527, -0.04316087, 1.967727, 0, 0, 0, 1, 1,
1.605448, -0.6621954, 0.3891979, 0, 0, 0, 1, 1,
1.606791, -0.6535391, 2.06996, 0, 0, 0, 1, 1,
1.608632, 1.846978, 1.429887, 0, 0, 0, 1, 1,
1.613023, -0.7488718, 0.3297343, 0, 0, 0, 1, 1,
1.61448, -0.1459999, 0.6796489, 0, 0, 0, 1, 1,
1.616121, -0.3446354, 1.376697, 0, 0, 0, 1, 1,
1.62872, 0.9062827, 0.1725085, 1, 1, 1, 1, 1,
1.641473, -0.4099264, 2.352296, 1, 1, 1, 1, 1,
1.657254, -0.5674817, 1.272149, 1, 1, 1, 1, 1,
1.66223, -0.1656833, 2.099813, 1, 1, 1, 1, 1,
1.663675, -0.4708167, 2.52387, 1, 1, 1, 1, 1,
1.663895, -0.8506657, 3.53261, 1, 1, 1, 1, 1,
1.667499, 0.007482371, 2.64138, 1, 1, 1, 1, 1,
1.668845, 0.3350556, 2.30337, 1, 1, 1, 1, 1,
1.675764, -0.261132, 1.26114, 1, 1, 1, 1, 1,
1.683973, -0.6444088, 2.567415, 1, 1, 1, 1, 1,
1.686411, 1.952911, -0.2115629, 1, 1, 1, 1, 1,
1.68653, -0.9437357, 3.859536, 1, 1, 1, 1, 1,
1.690632, -0.1761875, 2.59696, 1, 1, 1, 1, 1,
1.69652, -0.4091795, 1.321705, 1, 1, 1, 1, 1,
1.705894, -0.3060766, 1.227821, 1, 1, 1, 1, 1,
1.70887, -0.4715707, 1.433229, 0, 0, 1, 1, 1,
1.714863, 0.679872, 0.5927495, 1, 0, 0, 1, 1,
1.73334, -1.634177, 1.627428, 1, 0, 0, 1, 1,
1.74768, 0.1062566, -1.039251, 1, 0, 0, 1, 1,
1.7499, -0.7613541, 1.138898, 1, 0, 0, 1, 1,
1.766942, -0.8208753, 1.882599, 1, 0, 0, 1, 1,
1.773784, -1.252267, 1.35928, 0, 0, 0, 1, 1,
1.778496, -1.208937, 0.3016557, 0, 0, 0, 1, 1,
1.781814, -2.117742, 3.046446, 0, 0, 0, 1, 1,
1.78188, 0.2553358, 0.4081941, 0, 0, 0, 1, 1,
1.792706, 0.928493, -0.3166257, 0, 0, 0, 1, 1,
1.811696, -0.8262737, 3.435527, 0, 0, 0, 1, 1,
1.817325, -1.062036, 2.438366, 0, 0, 0, 1, 1,
1.826648, -1.036234, 0.7552994, 1, 1, 1, 1, 1,
1.840846, -0.7604353, 3.489643, 1, 1, 1, 1, 1,
1.848297, 0.03404839, 0.6624439, 1, 1, 1, 1, 1,
1.853284, 0.4083466, 0.4213425, 1, 1, 1, 1, 1,
1.878245, -1.564717, 3.036376, 1, 1, 1, 1, 1,
1.890899, 0.3471027, 0.07760025, 1, 1, 1, 1, 1,
1.918411, 2.239176, 0.4755674, 1, 1, 1, 1, 1,
1.928343, -0.07598697, 2.628709, 1, 1, 1, 1, 1,
1.930478, 0.8953886, 1.406746, 1, 1, 1, 1, 1,
1.93803, -1.800197, 4.211615, 1, 1, 1, 1, 1,
1.940591, 0.3301959, 2.476469, 1, 1, 1, 1, 1,
1.983118, -0.7188762, 2.761967, 1, 1, 1, 1, 1,
1.995732, 1.146328, 1.061003, 1, 1, 1, 1, 1,
2.012011, -0.2488925, 2.180897, 1, 1, 1, 1, 1,
2.03383, -0.3907417, 2.182621, 1, 1, 1, 1, 1,
2.066602, 0.5883116, 2.497778, 0, 0, 1, 1, 1,
2.066972, -1.037469, 2.475381, 1, 0, 0, 1, 1,
2.104981, -2.195852, 2.489049, 1, 0, 0, 1, 1,
2.107221, -0.3110764, 2.578133, 1, 0, 0, 1, 1,
2.143055, -0.6405383, 3.006611, 1, 0, 0, 1, 1,
2.168763, 0.1462761, 1.844719, 1, 0, 0, 1, 1,
2.202627, -0.7366658, 3.955038, 0, 0, 0, 1, 1,
2.257926, -0.4263915, 1.46579, 0, 0, 0, 1, 1,
2.274314, -0.1765321, 2.652467, 0, 0, 0, 1, 1,
2.288219, -0.3466534, 1.385831, 0, 0, 0, 1, 1,
2.533953, -1.779069, 2.562872, 0, 0, 0, 1, 1,
2.566995, 0.6322175, 1.163949, 0, 0, 0, 1, 1,
2.643759, -0.06379298, 3.162662, 0, 0, 0, 1, 1,
2.655887, 1.118985, 2.398068, 1, 1, 1, 1, 1,
2.675393, 0.1776585, 1.704262, 1, 1, 1, 1, 1,
2.699566, 0.4841927, 3.601142, 1, 1, 1, 1, 1,
2.716686, -1.452247, 2.053808, 1, 1, 1, 1, 1,
2.78003, 0.5594919, 0.8035718, 1, 1, 1, 1, 1,
3.03301, -0.5108583, 1.32197, 1, 1, 1, 1, 1,
3.481914, -1.415274, 2.02626, 1, 1, 1, 1, 1
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
var radius = 9.514052;
var distance = 33.41771;
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
mvMatrix.translate( -0.0830121, -0.264096, 0.1298988 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.41771);
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
