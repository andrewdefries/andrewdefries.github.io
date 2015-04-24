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
-3.97765, -0.6320934, -2.094576, 1, 0, 0, 1,
-3.598055, -0.1510792, -2.089469, 1, 0.007843138, 0, 1,
-3.427704, -1.230734, -3.50717, 1, 0.01176471, 0, 1,
-3.379046, 0.3892135, -1.693198, 1, 0.01960784, 0, 1,
-3.179575, -1.594195, -1.560388, 1, 0.02352941, 0, 1,
-2.901694, -1.096269, -0.8834687, 1, 0.03137255, 0, 1,
-2.882304, -0.1683646, -2.641834, 1, 0.03529412, 0, 1,
-2.846868, -0.8370869, -2.519061, 1, 0.04313726, 0, 1,
-2.839295, -0.5034493, -1.827536, 1, 0.04705882, 0, 1,
-2.72632, -1.16643, -2.087961, 1, 0.05490196, 0, 1,
-2.707313, 0.4620906, -1.338965, 1, 0.05882353, 0, 1,
-2.706995, 0.63309, -1.768734, 1, 0.06666667, 0, 1,
-2.678726, 0.162723, -1.152658, 1, 0.07058824, 0, 1,
-2.676004, -1.787662, -2.328963, 1, 0.07843138, 0, 1,
-2.550765, -0.7097092, -1.097036, 1, 0.08235294, 0, 1,
-2.546082, 0.186119, -2.381818, 1, 0.09019608, 0, 1,
-2.483677, 0.8101204, -3.526505, 1, 0.09411765, 0, 1,
-2.388715, -0.4527335, -2.253536, 1, 0.1019608, 0, 1,
-2.380753, 1.223716, -1.585088, 1, 0.1098039, 0, 1,
-2.242688, -0.2675093, -0.6639139, 1, 0.1137255, 0, 1,
-2.236704, 1.102285, -0.4433753, 1, 0.1215686, 0, 1,
-2.125448, 0.249097, -0.7541921, 1, 0.1254902, 0, 1,
-2.112892, 0.5408775, 0.6393652, 1, 0.1333333, 0, 1,
-2.082559, 1.792301, -0.7545279, 1, 0.1372549, 0, 1,
-2.070873, 0.5156908, -1.269079, 1, 0.145098, 0, 1,
-2.016591, 0.6254952, -3.480569, 1, 0.1490196, 0, 1,
-1.994589, -0.5102853, -1.600874, 1, 0.1568628, 0, 1,
-1.985542, -2.430033, -1.651051, 1, 0.1607843, 0, 1,
-1.96069, 0.944573, -2.300808, 1, 0.1686275, 0, 1,
-1.951539, 0.6253037, -0.8625878, 1, 0.172549, 0, 1,
-1.927289, -0.1698993, -1.645551, 1, 0.1803922, 0, 1,
-1.907632, -0.550348, -2.270852, 1, 0.1843137, 0, 1,
-1.899403, 0.3362465, -0.4700196, 1, 0.1921569, 0, 1,
-1.895161, -1.290914, -1.289768, 1, 0.1960784, 0, 1,
-1.893099, -0.3918114, -2.904379, 1, 0.2039216, 0, 1,
-1.888982, -0.7818777, -1.818027, 1, 0.2117647, 0, 1,
-1.883889, 0.01956091, -1.989808, 1, 0.2156863, 0, 1,
-1.845154, -1.769261, -1.94578, 1, 0.2235294, 0, 1,
-1.841038, 0.07888255, -0.6109608, 1, 0.227451, 0, 1,
-1.834622, -0.7843017, -1.660244, 1, 0.2352941, 0, 1,
-1.814499, 1.110766, -1.105091, 1, 0.2392157, 0, 1,
-1.795076, 0.007807242, -1.133803, 1, 0.2470588, 0, 1,
-1.795033, 0.2169776, -3.952656, 1, 0.2509804, 0, 1,
-1.790728, 0.7021455, -0.6755557, 1, 0.2588235, 0, 1,
-1.769588, -0.01066013, -2.289305, 1, 0.2627451, 0, 1,
-1.74044, 0.02877648, -2.768476, 1, 0.2705882, 0, 1,
-1.736333, 0.5484728, -1.506128, 1, 0.2745098, 0, 1,
-1.728054, 0.1418876, -0.8939967, 1, 0.282353, 0, 1,
-1.722584, -2.211041, -0.7656547, 1, 0.2862745, 0, 1,
-1.721648, 0.7193363, -1.07847, 1, 0.2941177, 0, 1,
-1.720502, 0.1884893, -4.178749, 1, 0.3019608, 0, 1,
-1.718446, -1.056646, -2.875023, 1, 0.3058824, 0, 1,
-1.707747, -1.154803, -0.9258187, 1, 0.3137255, 0, 1,
-1.697167, 1.679262, -3.933536, 1, 0.3176471, 0, 1,
-1.696477, -0.2718024, -1.096311, 1, 0.3254902, 0, 1,
-1.692323, 1.176092, -2.171351, 1, 0.3294118, 0, 1,
-1.682774, -1.973185, -3.006223, 1, 0.3372549, 0, 1,
-1.675473, 0.03229572, -2.987386, 1, 0.3411765, 0, 1,
-1.665615, -0.2690783, -1.208434, 1, 0.3490196, 0, 1,
-1.664835, 1.354123, -0.969303, 1, 0.3529412, 0, 1,
-1.660632, 0.9481534, 0.5594103, 1, 0.3607843, 0, 1,
-1.659424, -0.9978282, -3.39539, 1, 0.3647059, 0, 1,
-1.65281, 0.1916152, -1.96303, 1, 0.372549, 0, 1,
-1.647901, -0.1274742, -0.9282049, 1, 0.3764706, 0, 1,
-1.635577, -0.03817123, -1.32775, 1, 0.3843137, 0, 1,
-1.63155, -0.5627728, -1.745797, 1, 0.3882353, 0, 1,
-1.626387, -1.103527, -2.711278, 1, 0.3960784, 0, 1,
-1.622296, 2.93066, -0.9943168, 1, 0.4039216, 0, 1,
-1.618816, -0.949479, -1.526129, 1, 0.4078431, 0, 1,
-1.605168, -0.4469891, -0.05158702, 1, 0.4156863, 0, 1,
-1.60443, -0.8252584, -4.37407, 1, 0.4196078, 0, 1,
-1.60269, 1.516665, -0.5748851, 1, 0.427451, 0, 1,
-1.59804, 0.3123718, -3.309635, 1, 0.4313726, 0, 1,
-1.583598, 1.423123, -2.99626, 1, 0.4392157, 0, 1,
-1.579739, -0.901288, -3.516278, 1, 0.4431373, 0, 1,
-1.573359, -0.1743935, -2.323558, 1, 0.4509804, 0, 1,
-1.573049, 0.9075707, -0.1624859, 1, 0.454902, 0, 1,
-1.567051, -0.1313763, -3.413813, 1, 0.4627451, 0, 1,
-1.565562, -0.8804174, -0.476726, 1, 0.4666667, 0, 1,
-1.549523, 1.388284, -0.4633225, 1, 0.4745098, 0, 1,
-1.523437, 1.865097, -2.577186, 1, 0.4784314, 0, 1,
-1.520434, 0.9737392, -2.053609, 1, 0.4862745, 0, 1,
-1.500852, 1.298672, -1.539393, 1, 0.4901961, 0, 1,
-1.491652, 0.2412077, -0.1554018, 1, 0.4980392, 0, 1,
-1.48311, 0.6635042, -2.285846, 1, 0.5058824, 0, 1,
-1.475193, -1.051032, -3.020828, 1, 0.509804, 0, 1,
-1.472914, 1.564715, -2.119802, 1, 0.5176471, 0, 1,
-1.469337, 0.8597125, -0.864713, 1, 0.5215687, 0, 1,
-1.463405, -1.171381, -2.111173, 1, 0.5294118, 0, 1,
-1.459213, -0.4881321, -0.8385555, 1, 0.5333334, 0, 1,
-1.45179, 2.591131, -1.112236, 1, 0.5411765, 0, 1,
-1.447361, 0.8626226, -1.766847, 1, 0.5450981, 0, 1,
-1.440599, -1.379822, -1.884017, 1, 0.5529412, 0, 1,
-1.43639, -0.6241126, -1.296971, 1, 0.5568628, 0, 1,
-1.433797, -1.05756, -3.926982, 1, 0.5647059, 0, 1,
-1.427078, 0.993252, 0.3161434, 1, 0.5686275, 0, 1,
-1.416887, 1.345219, -1.849589, 1, 0.5764706, 0, 1,
-1.414736, -0.1721229, -1.264441, 1, 0.5803922, 0, 1,
-1.411364, -0.1787982, -0.8675252, 1, 0.5882353, 0, 1,
-1.409201, -0.985007, -2.77338, 1, 0.5921569, 0, 1,
-1.399375, 0.4998183, -0.5933231, 1, 0.6, 0, 1,
-1.395421, -0.2562806, -2.534091, 1, 0.6078432, 0, 1,
-1.382153, 0.8092065, 0.3959365, 1, 0.6117647, 0, 1,
-1.379139, -0.5882778, -2.496585, 1, 0.6196079, 0, 1,
-1.377997, -0.2355786, -1.948049, 1, 0.6235294, 0, 1,
-1.371645, -0.4641624, -0.3994618, 1, 0.6313726, 0, 1,
-1.370751, 0.7220395, -0.05200475, 1, 0.6352941, 0, 1,
-1.355013, 0.4704411, -1.559034, 1, 0.6431373, 0, 1,
-1.345817, 1.225936, -1.354656, 1, 0.6470588, 0, 1,
-1.335837, 1.295076, -0.7530558, 1, 0.654902, 0, 1,
-1.328515, 0.06639065, -0.785841, 1, 0.6588235, 0, 1,
-1.325416, -0.3025175, -1.383862, 1, 0.6666667, 0, 1,
-1.31287, -0.1298744, -1.367738, 1, 0.6705883, 0, 1,
-1.311116, -0.1422206, -1.893343, 1, 0.6784314, 0, 1,
-1.307588, -1.336032, -3.251876, 1, 0.682353, 0, 1,
-1.303589, 0.4129741, -2.899226, 1, 0.6901961, 0, 1,
-1.297363, 0.2684204, -2.143664, 1, 0.6941177, 0, 1,
-1.296356, -0.629616, -1.751623, 1, 0.7019608, 0, 1,
-1.293439, -1.332824, -3.961874, 1, 0.7098039, 0, 1,
-1.287417, -0.0817532, -2.263703, 1, 0.7137255, 0, 1,
-1.285064, -0.110975, -0.6779053, 1, 0.7215686, 0, 1,
-1.283735, 0.1116872, -2.37147, 1, 0.7254902, 0, 1,
-1.278138, 0.4974136, -0.4039458, 1, 0.7333333, 0, 1,
-1.271384, -1.019022, -1.566128, 1, 0.7372549, 0, 1,
-1.251938, -0.9976848, -1.210099, 1, 0.7450981, 0, 1,
-1.247922, -1.220251, -3.040319, 1, 0.7490196, 0, 1,
-1.245276, -1.989265, -2.456006, 1, 0.7568628, 0, 1,
-1.242291, 0.8929096, -0.6290215, 1, 0.7607843, 0, 1,
-1.242185, -0.2093352, -1.054637, 1, 0.7686275, 0, 1,
-1.234428, -0.4181193, -0.7428592, 1, 0.772549, 0, 1,
-1.232618, 0.3272067, -0.4861703, 1, 0.7803922, 0, 1,
-1.229918, -0.6479102, -2.63783, 1, 0.7843137, 0, 1,
-1.216555, 0.3426829, -0.5176959, 1, 0.7921569, 0, 1,
-1.191977, -0.1502515, -1.436462, 1, 0.7960784, 0, 1,
-1.189373, -0.160527, -0.8294051, 1, 0.8039216, 0, 1,
-1.186556, -0.3502422, -1.505133, 1, 0.8117647, 0, 1,
-1.185397, -1.225417, -1.447558, 1, 0.8156863, 0, 1,
-1.184525, 0.07699703, -0.5520983, 1, 0.8235294, 0, 1,
-1.180971, -1.190476, -4.658651, 1, 0.827451, 0, 1,
-1.151248, -0.6616549, -1.222813, 1, 0.8352941, 0, 1,
-1.150695, 0.01030688, -1.022263, 1, 0.8392157, 0, 1,
-1.145981, 2.642788, -0.2804275, 1, 0.8470588, 0, 1,
-1.142073, 1.931899, 0.2962756, 1, 0.8509804, 0, 1,
-1.139943, 0.9913979, -1.639163, 1, 0.8588235, 0, 1,
-1.125833, 0.3026435, -1.750331, 1, 0.8627451, 0, 1,
-1.117898, 0.2052047, -0.5130262, 1, 0.8705882, 0, 1,
-1.098762, -0.3431658, -0.3640538, 1, 0.8745098, 0, 1,
-1.096456, 0.1086812, 1.621802, 1, 0.8823529, 0, 1,
-1.091557, 0.3562887, -2.523785, 1, 0.8862745, 0, 1,
-1.087649, 0.2904185, -2.980102, 1, 0.8941177, 0, 1,
-1.0843, 1.319979, -0.5791858, 1, 0.8980392, 0, 1,
-1.083441, 0.7375843, -1.214203, 1, 0.9058824, 0, 1,
-1.08262, -0.06624403, -1.482866, 1, 0.9137255, 0, 1,
-1.082272, 0.836417, -1.289798, 1, 0.9176471, 0, 1,
-1.078742, 1.259765, -0.07298055, 1, 0.9254902, 0, 1,
-1.077794, -0.7067797, -2.866933, 1, 0.9294118, 0, 1,
-1.076726, -0.4994002, -2.315965, 1, 0.9372549, 0, 1,
-1.070187, -0.9035138, -2.911189, 1, 0.9411765, 0, 1,
-1.053134, -1.502573, -4.388087, 1, 0.9490196, 0, 1,
-1.034804, 0.8145668, -0.7053298, 1, 0.9529412, 0, 1,
-1.03039, -0.4167432, -0.1244109, 1, 0.9607843, 0, 1,
-1.019113, 0.01723069, 0.6063523, 1, 0.9647059, 0, 1,
-1.013451, 1.10743, -0.2106763, 1, 0.972549, 0, 1,
-1.013331, -0.1072166, -2.812833, 1, 0.9764706, 0, 1,
-1.013031, -1.685198, -4.078527, 1, 0.9843137, 0, 1,
-1.011148, 1.744767, 0.899951, 1, 0.9882353, 0, 1,
-1.005284, -1.053039, -1.031657, 1, 0.9960784, 0, 1,
-0.9985075, 2.197379, 0.6090781, 0.9960784, 1, 0, 1,
-0.9979997, 0.1225113, -2.13273, 0.9921569, 1, 0, 1,
-0.9917307, -0.2321294, -1.989398, 0.9843137, 1, 0, 1,
-0.9842924, -0.1857851, -2.74567, 0.9803922, 1, 0, 1,
-0.9773891, -0.8384812, -1.549634, 0.972549, 1, 0, 1,
-0.9764458, -0.9139524, -2.384453, 0.9686275, 1, 0, 1,
-0.9704448, -0.817924, -3.297342, 0.9607843, 1, 0, 1,
-0.9701437, 0.225309, -1.308673, 0.9568627, 1, 0, 1,
-0.9593335, -1.517621, -2.795935, 0.9490196, 1, 0, 1,
-0.9592824, 0.4598522, -1.053881, 0.945098, 1, 0, 1,
-0.9580037, -0.4818361, -2.533062, 0.9372549, 1, 0, 1,
-0.9563164, 0.5000477, -2.278882, 0.9333333, 1, 0, 1,
-0.947688, 0.1413709, -2.831558, 0.9254902, 1, 0, 1,
-0.9467587, 0.6251644, -0.7251567, 0.9215686, 1, 0, 1,
-0.9440374, -0.7745387, -2.645254, 0.9137255, 1, 0, 1,
-0.935953, 0.5555459, -0.5587613, 0.9098039, 1, 0, 1,
-0.9344086, -1.300099, -3.653102, 0.9019608, 1, 0, 1,
-0.9321471, 1.546056, 0.09386885, 0.8941177, 1, 0, 1,
-0.9311167, -0.9869583, -2.056073, 0.8901961, 1, 0, 1,
-0.9305254, 0.2124418, 0.1297884, 0.8823529, 1, 0, 1,
-0.9256057, -0.0858914, -1.778951, 0.8784314, 1, 0, 1,
-0.9200197, -0.2284673, -1.281913, 0.8705882, 1, 0, 1,
-0.9124874, -0.04824948, 0.02768863, 0.8666667, 1, 0, 1,
-0.9109852, -0.3302131, -3.422246, 0.8588235, 1, 0, 1,
-0.9078111, 0.3735928, -2.76436, 0.854902, 1, 0, 1,
-0.9032057, 2.662325, -0.7667504, 0.8470588, 1, 0, 1,
-0.90255, 0.231611, -1.655329, 0.8431373, 1, 0, 1,
-0.8943813, 0.09906334, -2.19248, 0.8352941, 1, 0, 1,
-0.8877335, 0.1564438, -2.024332, 0.8313726, 1, 0, 1,
-0.8874491, -0.02239331, -2.277013, 0.8235294, 1, 0, 1,
-0.8848636, -0.5138874, 0.4164298, 0.8196079, 1, 0, 1,
-0.8824886, 0.5338622, -2.305231, 0.8117647, 1, 0, 1,
-0.881411, -0.3380624, -1.344278, 0.8078431, 1, 0, 1,
-0.8802793, 0.1744324, -1.854937, 0.8, 1, 0, 1,
-0.8802455, 0.4142762, -1.671821, 0.7921569, 1, 0, 1,
-0.8710074, 0.2033334, -1.009017, 0.7882353, 1, 0, 1,
-0.8618313, 2.929187, 0.06847685, 0.7803922, 1, 0, 1,
-0.8609794, 0.2824537, -1.512387, 0.7764706, 1, 0, 1,
-0.8606343, 0.413247, -1.252538, 0.7686275, 1, 0, 1,
-0.8539512, -0.1178238, -1.57258, 0.7647059, 1, 0, 1,
-0.8511871, -0.2721818, -0.6353295, 0.7568628, 1, 0, 1,
-0.848903, 0.5451696, -0.4332264, 0.7529412, 1, 0, 1,
-0.8469641, 0.6250575, -1.919984, 0.7450981, 1, 0, 1,
-0.8463441, -0.8678944, -1.782977, 0.7411765, 1, 0, 1,
-0.8448821, 0.6898258, -1.961289, 0.7333333, 1, 0, 1,
-0.8408126, 0.9368653, -1.026751, 0.7294118, 1, 0, 1,
-0.8372729, -0.9428025, 0.396105, 0.7215686, 1, 0, 1,
-0.8358408, 0.04185335, -1.814826, 0.7176471, 1, 0, 1,
-0.8254034, 0.294461, -0.5781955, 0.7098039, 1, 0, 1,
-0.8247277, 0.3748437, -2.738423, 0.7058824, 1, 0, 1,
-0.8189976, -0.864081, -2.936669, 0.6980392, 1, 0, 1,
-0.8140441, -0.01053636, -0.3609641, 0.6901961, 1, 0, 1,
-0.8137571, 0.6384525, 0.0582264, 0.6862745, 1, 0, 1,
-0.8104417, -1.297356, -1.207171, 0.6784314, 1, 0, 1,
-0.8102244, 0.4597563, -0.2313101, 0.6745098, 1, 0, 1,
-0.8032324, 0.6113638, -0.5431281, 0.6666667, 1, 0, 1,
-0.8024031, 0.7928708, -1.118445, 0.6627451, 1, 0, 1,
-0.8003803, -1.804919, -2.448798, 0.654902, 1, 0, 1,
-0.797444, 0.2649455, -2.578251, 0.6509804, 1, 0, 1,
-0.7916285, -0.5597199, -2.766942, 0.6431373, 1, 0, 1,
-0.7905245, 1.471085, -0.8682033, 0.6392157, 1, 0, 1,
-0.7873272, -1.01255, -1.117469, 0.6313726, 1, 0, 1,
-0.7868416, -0.01915781, -0.9596888, 0.627451, 1, 0, 1,
-0.7758532, 0.3943475, -1.029178, 0.6196079, 1, 0, 1,
-0.7722546, 0.8976669, 0.1993765, 0.6156863, 1, 0, 1,
-0.7712329, -0.7936415, -3.005265, 0.6078432, 1, 0, 1,
-0.7699049, -0.007577518, -2.085106, 0.6039216, 1, 0, 1,
-0.7573609, 1.415588, -1.346419, 0.5960785, 1, 0, 1,
-0.7526113, 0.2542142, 0.1294791, 0.5882353, 1, 0, 1,
-0.7512646, -1.37261, -3.081732, 0.5843138, 1, 0, 1,
-0.7438735, -0.4951128, -2.021714, 0.5764706, 1, 0, 1,
-0.739015, 0.1492103, -1.120757, 0.572549, 1, 0, 1,
-0.738171, -0.3607138, -2.102957, 0.5647059, 1, 0, 1,
-0.7356021, 0.7461489, -1.177701, 0.5607843, 1, 0, 1,
-0.7320367, 0.3862021, 0.467463, 0.5529412, 1, 0, 1,
-0.7293688, -0.4540813, -1.057143, 0.5490196, 1, 0, 1,
-0.7206589, -1.999707, -2.864056, 0.5411765, 1, 0, 1,
-0.7191067, -2.294054, -5.095662, 0.5372549, 1, 0, 1,
-0.7169538, -0.07844317, 1.743214, 0.5294118, 1, 0, 1,
-0.7131148, -0.006126145, -1.677046, 0.5254902, 1, 0, 1,
-0.7082309, -0.3124993, -1.968663, 0.5176471, 1, 0, 1,
-0.706724, -0.2282012, -3.062072, 0.5137255, 1, 0, 1,
-0.7048477, -0.8602634, -3.705764, 0.5058824, 1, 0, 1,
-0.7048034, -0.2089793, -1.632673, 0.5019608, 1, 0, 1,
-0.7040572, -0.1362854, -0.4715352, 0.4941176, 1, 0, 1,
-0.6996027, 0.4507766, -4.086215, 0.4862745, 1, 0, 1,
-0.6994652, 1.842671, -2.32605, 0.4823529, 1, 0, 1,
-0.6968377, -0.01130825, -3.326819, 0.4745098, 1, 0, 1,
-0.6957698, 0.1263154, -2.501697, 0.4705882, 1, 0, 1,
-0.6917075, -0.5129293, -1.379104, 0.4627451, 1, 0, 1,
-0.6885666, -1.468782, -1.15578, 0.4588235, 1, 0, 1,
-0.682942, -0.4007639, -2.042693, 0.4509804, 1, 0, 1,
-0.6829327, -0.6191375, -2.704188, 0.4470588, 1, 0, 1,
-0.6715034, -0.8298675, -3.006171, 0.4392157, 1, 0, 1,
-0.6714529, 2.032231, 0.6556638, 0.4352941, 1, 0, 1,
-0.6710593, -0.9902243, -0.4365075, 0.427451, 1, 0, 1,
-0.666667, 1.24245, -1.284127, 0.4235294, 1, 0, 1,
-0.6637984, 0.4991234, -0.7236017, 0.4156863, 1, 0, 1,
-0.6578798, -0.1522004, -2.547505, 0.4117647, 1, 0, 1,
-0.6571617, 1.413, 0.02775903, 0.4039216, 1, 0, 1,
-0.6556616, -1.320398, -0.7446797, 0.3960784, 1, 0, 1,
-0.6544409, 0.2337962, -0.9532054, 0.3921569, 1, 0, 1,
-0.6523994, 0.1714981, 0.1818868, 0.3843137, 1, 0, 1,
-0.6513179, -7.450764e-07, -2.714691, 0.3803922, 1, 0, 1,
-0.6512706, -0.673681, -2.672982, 0.372549, 1, 0, 1,
-0.6486558, -1.71775, -3.46769, 0.3686275, 1, 0, 1,
-0.6467245, 0.005063345, -2.071564, 0.3607843, 1, 0, 1,
-0.6456192, -1.617627, -1.860734, 0.3568628, 1, 0, 1,
-0.6435536, 2.481507, -0.6077963, 0.3490196, 1, 0, 1,
-0.6349074, 0.999902, -1.675535, 0.345098, 1, 0, 1,
-0.6251667, 0.1877711, -0.2471099, 0.3372549, 1, 0, 1,
-0.6239334, 0.8079526, -1.940036, 0.3333333, 1, 0, 1,
-0.6232616, -1.350109, -2.955457, 0.3254902, 1, 0, 1,
-0.6206623, -0.2959022, -0.7988361, 0.3215686, 1, 0, 1,
-0.6205587, 1.046075, -0.01208894, 0.3137255, 1, 0, 1,
-0.6177741, -1.246719, -3.041171, 0.3098039, 1, 0, 1,
-0.6166872, -1.516923, -2.000652, 0.3019608, 1, 0, 1,
-0.61658, 0.004754552, -3.45145, 0.2941177, 1, 0, 1,
-0.6120894, 0.3369369, -1.281228, 0.2901961, 1, 0, 1,
-0.6105486, -1.131466, -1.486259, 0.282353, 1, 0, 1,
-0.6085244, -0.2145199, -0.4851241, 0.2784314, 1, 0, 1,
-0.6040767, -2.068522, -4.362364, 0.2705882, 1, 0, 1,
-0.6030332, 0.5274495, -0.3912304, 0.2666667, 1, 0, 1,
-0.5945767, 0.3274724, -0.6781133, 0.2588235, 1, 0, 1,
-0.5911605, -0.7986637, -3.607093, 0.254902, 1, 0, 1,
-0.5893179, -1.290084, -3.81839, 0.2470588, 1, 0, 1,
-0.5857878, 0.2729511, -0.7218206, 0.2431373, 1, 0, 1,
-0.5848194, -0.647251, -1.470193, 0.2352941, 1, 0, 1,
-0.5782981, 1.932323, -0.3473461, 0.2313726, 1, 0, 1,
-0.5770018, 0.8847666, -1.456969, 0.2235294, 1, 0, 1,
-0.5764006, 1.605102, -0.131642, 0.2196078, 1, 0, 1,
-0.5714395, -0.7403416, -2.672274, 0.2117647, 1, 0, 1,
-0.5686171, 0.1423201, -2.444191, 0.2078431, 1, 0, 1,
-0.5675419, 0.2831572, -0.6316847, 0.2, 1, 0, 1,
-0.5668581, -0.2821454, -3.482098, 0.1921569, 1, 0, 1,
-0.5628066, -0.6044773, -1.016692, 0.1882353, 1, 0, 1,
-0.5627164, 1.621506, -0.3391497, 0.1803922, 1, 0, 1,
-0.5613155, -0.6107812, -3.836719, 0.1764706, 1, 0, 1,
-0.5523992, 0.1695176, -0.1673892, 0.1686275, 1, 0, 1,
-0.5454305, -1.22684, -3.067579, 0.1647059, 1, 0, 1,
-0.5437965, -0.321632, -1.077355, 0.1568628, 1, 0, 1,
-0.5371804, -0.1625736, -1.280796, 0.1529412, 1, 0, 1,
-0.5339556, 1.07653, -0.4550787, 0.145098, 1, 0, 1,
-0.5326208, -0.2003638, -2.323222, 0.1411765, 1, 0, 1,
-0.5197278, -0.3135884, -2.100189, 0.1333333, 1, 0, 1,
-0.5195807, 1.341176, 0.212808, 0.1294118, 1, 0, 1,
-0.5168629, -1.643142, -2.316809, 0.1215686, 1, 0, 1,
-0.5162992, -1.809065, -4.1475, 0.1176471, 1, 0, 1,
-0.511807, -1.017094, -2.41017, 0.1098039, 1, 0, 1,
-0.510488, 1.967859, -0.5550482, 0.1058824, 1, 0, 1,
-0.5004291, -1.549196, -3.28748, 0.09803922, 1, 0, 1,
-0.496844, 0.1042448, -1.530392, 0.09019608, 1, 0, 1,
-0.4918129, -0.05804398, -1.56655, 0.08627451, 1, 0, 1,
-0.4898402, 0.151533, -0.1015989, 0.07843138, 1, 0, 1,
-0.4865959, -0.2097914, -1.967988, 0.07450981, 1, 0, 1,
-0.482114, 1.739354, -2.729506, 0.06666667, 1, 0, 1,
-0.4792741, 0.5318944, -1.505839, 0.0627451, 1, 0, 1,
-0.4735802, -2.225922, -1.959546, 0.05490196, 1, 0, 1,
-0.4699746, 0.0266615, -2.203813, 0.05098039, 1, 0, 1,
-0.4687041, 1.193087, -1.03266, 0.04313726, 1, 0, 1,
-0.4538733, 0.1438828, -1.214437, 0.03921569, 1, 0, 1,
-0.4531547, 0.6144603, 0.492892, 0.03137255, 1, 0, 1,
-0.4479862, -0.6537482, -3.198949, 0.02745098, 1, 0, 1,
-0.4464026, -0.4867006, -1.209769, 0.01960784, 1, 0, 1,
-0.4434813, 0.09744649, -1.643702, 0.01568628, 1, 0, 1,
-0.4416255, -0.004137955, -1.659032, 0.007843138, 1, 0, 1,
-0.4416187, -1.687066, -3.093695, 0.003921569, 1, 0, 1,
-0.4409414, -0.1475015, -1.074634, 0, 1, 0.003921569, 1,
-0.4408055, -0.5459133, -2.285792, 0, 1, 0.01176471, 1,
-0.4404148, -0.3616423, -3.976851, 0, 1, 0.01568628, 1,
-0.4368443, 1.487896, -1.493791, 0, 1, 0.02352941, 1,
-0.4316263, 0.05091723, -2.518966, 0, 1, 0.02745098, 1,
-0.4286702, -0.269583, -2.533062, 0, 1, 0.03529412, 1,
-0.426563, -0.357693, -3.609864, 0, 1, 0.03921569, 1,
-0.4250423, 0.7797923, -2.171934, 0, 1, 0.04705882, 1,
-0.4240994, -1.391689, -1.982056, 0, 1, 0.05098039, 1,
-0.4227602, -0.05809148, -3.203676, 0, 1, 0.05882353, 1,
-0.421725, 1.038103, -1.53894, 0, 1, 0.0627451, 1,
-0.420867, -0.5388702, -1.833136, 0, 1, 0.07058824, 1,
-0.4180514, -0.2446967, -1.782918, 0, 1, 0.07450981, 1,
-0.415993, 0.7725141, 0.4357113, 0, 1, 0.08235294, 1,
-0.4148758, 0.3226414, -0.5376272, 0, 1, 0.08627451, 1,
-0.4127889, -0.09978034, -2.191002, 0, 1, 0.09411765, 1,
-0.4092754, -0.6812061, -2.537956, 0, 1, 0.1019608, 1,
-0.4048859, -0.1386732, -1.772822, 0, 1, 0.1058824, 1,
-0.4039372, 0.8224729, -0.3154131, 0, 1, 0.1137255, 1,
-0.403438, 0.4907546, -0.7850598, 0, 1, 0.1176471, 1,
-0.3913137, -0.00719894, 1.663747, 0, 1, 0.1254902, 1,
-0.3845553, -1.057767, -2.950032, 0, 1, 0.1294118, 1,
-0.3842296, -0.6251563, -2.42822, 0, 1, 0.1372549, 1,
-0.3839957, 0.04828276, 0.613839, 0, 1, 0.1411765, 1,
-0.3821665, -0.2837844, -2.130086, 0, 1, 0.1490196, 1,
-0.3790798, 0.1663159, -1.593737, 0, 1, 0.1529412, 1,
-0.3770073, -1.964361, -2.898285, 0, 1, 0.1607843, 1,
-0.371874, -2.374769, -4.238973, 0, 1, 0.1647059, 1,
-0.3661503, -0.8722187, -2.399987, 0, 1, 0.172549, 1,
-0.3646659, 0.6211876, -0.5353578, 0, 1, 0.1764706, 1,
-0.362091, -0.5418293, -3.506277, 0, 1, 0.1843137, 1,
-0.356998, 1.723406, 0.08912777, 0, 1, 0.1882353, 1,
-0.3569802, -1.050261, -3.382285, 0, 1, 0.1960784, 1,
-0.3469766, 0.5603353, -0.7030783, 0, 1, 0.2039216, 1,
-0.3460456, -0.9724619, -2.599295, 0, 1, 0.2078431, 1,
-0.3421367, 0.5742403, -0.8211217, 0, 1, 0.2156863, 1,
-0.3414188, 0.3022763, 0.1766852, 0, 1, 0.2196078, 1,
-0.3408349, 0.296963, -0.04768262, 0, 1, 0.227451, 1,
-0.34041, 0.3846527, -1.729707, 0, 1, 0.2313726, 1,
-0.3387886, 0.1155846, -2.278545, 0, 1, 0.2392157, 1,
-0.3363506, -0.5876746, -3.465897, 0, 1, 0.2431373, 1,
-0.3340731, -0.004348429, -0.1901606, 0, 1, 0.2509804, 1,
-0.3331083, -0.07011142, -1.425758, 0, 1, 0.254902, 1,
-0.3286958, -0.9085546, -2.111844, 0, 1, 0.2627451, 1,
-0.322736, 0.5657994, -0.7536275, 0, 1, 0.2666667, 1,
-0.3198704, 0.7192289, 0.8810603, 0, 1, 0.2745098, 1,
-0.3114012, 0.7852669, -0.318828, 0, 1, 0.2784314, 1,
-0.3108258, 0.05205135, -2.03325, 0, 1, 0.2862745, 1,
-0.3106018, 2.469693, -1.50229, 0, 1, 0.2901961, 1,
-0.3081165, 0.2216987, -2.111363, 0, 1, 0.2980392, 1,
-0.3060533, -2.108258, -2.876525, 0, 1, 0.3058824, 1,
-0.29438, -0.9581869, -1.95578, 0, 1, 0.3098039, 1,
-0.2888259, -0.949938, -3.532342, 0, 1, 0.3176471, 1,
-0.2874782, -2.348731, -3.147469, 0, 1, 0.3215686, 1,
-0.2788752, -0.6180227, -2.479371, 0, 1, 0.3294118, 1,
-0.2767581, 0.6830017, 1.463071, 0, 1, 0.3333333, 1,
-0.2742375, -0.7173273, -1.848639, 0, 1, 0.3411765, 1,
-0.2719762, 0.3134426, -1.689367, 0, 1, 0.345098, 1,
-0.2693792, -1.106101, -3.68145, 0, 1, 0.3529412, 1,
-0.2672413, -0.1317288, -2.989746, 0, 1, 0.3568628, 1,
-0.2659105, 1.001549, -1.208447, 0, 1, 0.3647059, 1,
-0.2657054, 1.637069, 0.6838607, 0, 1, 0.3686275, 1,
-0.2630093, 0.4498923, 0.7208354, 0, 1, 0.3764706, 1,
-0.262817, -0.8586844, -1.829013, 0, 1, 0.3803922, 1,
-0.2599307, 0.2495425, 0.1013056, 0, 1, 0.3882353, 1,
-0.2548023, 0.2441237, -1.393438, 0, 1, 0.3921569, 1,
-0.2521364, -0.183139, -2.014177, 0, 1, 0.4, 1,
-0.2498132, 0.2034098, -2.070759, 0, 1, 0.4078431, 1,
-0.2489061, -0.5221733, -3.972561, 0, 1, 0.4117647, 1,
-0.2441486, 1.364581, -0.9208468, 0, 1, 0.4196078, 1,
-0.2381772, 1.53034, 0.957558, 0, 1, 0.4235294, 1,
-0.2376401, -0.324871, -1.29742, 0, 1, 0.4313726, 1,
-0.2373682, 0.7182588, 0.01927551, 0, 1, 0.4352941, 1,
-0.2353481, 0.23411, 0.4503992, 0, 1, 0.4431373, 1,
-0.2347486, -1.418102, -1.283592, 0, 1, 0.4470588, 1,
-0.2284124, 0.00512792, -2.565443, 0, 1, 0.454902, 1,
-0.2250874, -1.977265, -1.561381, 0, 1, 0.4588235, 1,
-0.215972, -0.1395379, -1.089437, 0, 1, 0.4666667, 1,
-0.2159394, 0.417294, -1.375797, 0, 1, 0.4705882, 1,
-0.2158066, 0.6092052, 1.145504, 0, 1, 0.4784314, 1,
-0.2146894, 0.5984812, -1.340811, 0, 1, 0.4823529, 1,
-0.2129105, -2.15098, -1.758803, 0, 1, 0.4901961, 1,
-0.2097677, -0.8466639, -3.868722, 0, 1, 0.4941176, 1,
-0.2093228, -1.224063, -4.390688, 0, 1, 0.5019608, 1,
-0.2077817, -0.9729835, -4.491344, 0, 1, 0.509804, 1,
-0.2059721, 0.5008506, -1.407871, 0, 1, 0.5137255, 1,
-0.2054891, 0.5820448, 0.592318, 0, 1, 0.5215687, 1,
-0.2048996, 0.3190618, 0.7442295, 0, 1, 0.5254902, 1,
-0.2024317, -0.9418609, -3.968968, 0, 1, 0.5333334, 1,
-0.1981319, 1.70349, 0.08946428, 0, 1, 0.5372549, 1,
-0.1848549, -1.098742, -2.848048, 0, 1, 0.5450981, 1,
-0.1840866, -0.4751483, -3.158828, 0, 1, 0.5490196, 1,
-0.1834518, -0.760599, -2.116456, 0, 1, 0.5568628, 1,
-0.1785388, 0.2153556, 0.6769533, 0, 1, 0.5607843, 1,
-0.1780753, 0.3104309, -2.062165, 0, 1, 0.5686275, 1,
-0.1767518, -0.4437808, -4.782387, 0, 1, 0.572549, 1,
-0.174454, -0.3941868, -4.207183, 0, 1, 0.5803922, 1,
-0.1676934, -0.3945169, -2.972095, 0, 1, 0.5843138, 1,
-0.1673898, -0.3706242, -0.3753401, 0, 1, 0.5921569, 1,
-0.1653495, 0.650411, -1.225111, 0, 1, 0.5960785, 1,
-0.1621258, -0.6829575, -2.240919, 0, 1, 0.6039216, 1,
-0.1591009, 0.1076159, 1.1945, 0, 1, 0.6117647, 1,
-0.1542707, 0.5915048, -2.593584, 0, 1, 0.6156863, 1,
-0.1534808, -0.6266723, -3.997232, 0, 1, 0.6235294, 1,
-0.1525948, -0.3812685, -2.283187, 0, 1, 0.627451, 1,
-0.1518047, 1.678259, -1.162238, 0, 1, 0.6352941, 1,
-0.141247, 0.5461279, -2.276507, 0, 1, 0.6392157, 1,
-0.1406, -0.6429837, -2.631118, 0, 1, 0.6470588, 1,
-0.1387131, 0.5190338, -1.557407, 0, 1, 0.6509804, 1,
-0.1368735, -1.869561, -1.769901, 0, 1, 0.6588235, 1,
-0.1319011, -1.096027, -4.239791, 0, 1, 0.6627451, 1,
-0.1304744, 0.9805811, 0.7657488, 0, 1, 0.6705883, 1,
-0.1286313, 0.890834, -0.3111287, 0, 1, 0.6745098, 1,
-0.1253698, -0.005329479, -0.6418223, 0, 1, 0.682353, 1,
-0.1190919, -0.2033547, -2.052251, 0, 1, 0.6862745, 1,
-0.1140411, 1.01677, -0.3364993, 0, 1, 0.6941177, 1,
-0.1114393, -0.4893201, -3.599575, 0, 1, 0.7019608, 1,
-0.1085774, -0.8534111, -4.376027, 0, 1, 0.7058824, 1,
-0.1028896, -0.8257036, -2.466699, 0, 1, 0.7137255, 1,
-0.1002701, 0.4780791, 0.1206622, 0, 1, 0.7176471, 1,
-0.09781209, -1.292691, -2.404747, 0, 1, 0.7254902, 1,
-0.09687557, -0.2922826, -1.938331, 0, 1, 0.7294118, 1,
-0.08716066, 0.2576573, -0.1758471, 0, 1, 0.7372549, 1,
-0.08637675, 0.2826872, -0.6942664, 0, 1, 0.7411765, 1,
-0.08581995, -2.56303, -2.953896, 0, 1, 0.7490196, 1,
-0.08441173, -0.2158049, -4.28973, 0, 1, 0.7529412, 1,
-0.08062074, 0.5101161, -0.03543031, 0, 1, 0.7607843, 1,
-0.07858465, 0.6368327, 0.1350807, 0, 1, 0.7647059, 1,
-0.07687987, -0.6686918, -1.091403, 0, 1, 0.772549, 1,
-0.07259483, -0.5743348, -5.460928, 0, 1, 0.7764706, 1,
-0.07216448, -1.479856, -3.064915, 0, 1, 0.7843137, 1,
-0.06324331, -0.4857989, -4.549734, 0, 1, 0.7882353, 1,
-0.06280878, 0.6317083, -1.494696, 0, 1, 0.7960784, 1,
-0.06184391, 1.745941, -1.426863, 0, 1, 0.8039216, 1,
-0.0578919, 1.462867, 0.255432, 0, 1, 0.8078431, 1,
-0.05782885, 0.3894931, 1.215348, 0, 1, 0.8156863, 1,
-0.05680523, 0.9842787, 0.664117, 0, 1, 0.8196079, 1,
-0.05606453, -0.8178034, -4.652178, 0, 1, 0.827451, 1,
-0.05468037, -0.9402683, -4.484004, 0, 1, 0.8313726, 1,
-0.04203704, -0.4388752, -2.321449, 0, 1, 0.8392157, 1,
-0.03971842, 0.8102021, 2.174922, 0, 1, 0.8431373, 1,
-0.03961037, 0.5455201, 0.8704681, 0, 1, 0.8509804, 1,
-0.03875583, -0.5445807, -2.147207, 0, 1, 0.854902, 1,
-0.0357818, -1.12363, -0.6336943, 0, 1, 0.8627451, 1,
-0.02738307, -0.3272372, -3.280236, 0, 1, 0.8666667, 1,
-0.02370625, 0.8012787, -1.306904, 0, 1, 0.8745098, 1,
-0.02094318, -1.083748, -2.803729, 0, 1, 0.8784314, 1,
-0.01091627, 0.01117779, 0.5615038, 0, 1, 0.8862745, 1,
-0.008925938, -0.6307875, -1.10183, 0, 1, 0.8901961, 1,
-0.005140931, 0.1715728, 0.4666984, 0, 1, 0.8980392, 1,
-0.004257957, -1.504469, -4.107079, 0, 1, 0.9058824, 1,
-0.003206959, -0.6915519, -4.495924, 0, 1, 0.9098039, 1,
-0.002821133, 1.840572, -0.7884082, 0, 1, 0.9176471, 1,
-0.0009287786, -0.1232331, -3.245229, 0, 1, 0.9215686, 1,
0.002043267, -1.362764, 2.731443, 0, 1, 0.9294118, 1,
0.006834839, -2.061048, 4.823686, 0, 1, 0.9333333, 1,
0.008161925, -1.908983, 2.917092, 0, 1, 0.9411765, 1,
0.008327206, 0.3005067, -1.240977, 0, 1, 0.945098, 1,
0.01000438, -0.6032744, 2.614934, 0, 1, 0.9529412, 1,
0.01143606, 0.5689249, 1.475284, 0, 1, 0.9568627, 1,
0.01301079, 0.164518, -0.4470568, 0, 1, 0.9647059, 1,
0.01353523, -0.4057091, 2.139606, 0, 1, 0.9686275, 1,
0.01484775, 1.208612, 1.092721, 0, 1, 0.9764706, 1,
0.01637194, -0.5136312, 4.460555, 0, 1, 0.9803922, 1,
0.02091206, -2.464263, 3.164086, 0, 1, 0.9882353, 1,
0.02550512, -0.2095368, 3.913915, 0, 1, 0.9921569, 1,
0.03025275, 1.70069, 0.6624588, 0, 1, 1, 1,
0.03043861, 0.4367802, 0.8772002, 0, 0.9921569, 1, 1,
0.0322463, -0.4082281, 2.114024, 0, 0.9882353, 1, 1,
0.03649487, 0.009102257, 1.865546, 0, 0.9803922, 1, 1,
0.04120015, -0.4256448, 3.015533, 0, 0.9764706, 1, 1,
0.04374656, 0.01016675, 2.518846, 0, 0.9686275, 1, 1,
0.04474873, 0.5917978, 0.886175, 0, 0.9647059, 1, 1,
0.04592891, -0.2165024, 4.555349, 0, 0.9568627, 1, 1,
0.04619736, -0.6024705, 3.565411, 0, 0.9529412, 1, 1,
0.04792099, -0.08059872, 2.534339, 0, 0.945098, 1, 1,
0.05015787, 2.436277, -1.213131, 0, 0.9411765, 1, 1,
0.05500823, -1.058252, 3.393219, 0, 0.9333333, 1, 1,
0.0552738, -1.478542, 2.612297, 0, 0.9294118, 1, 1,
0.05595425, -0.4483531, 2.901224, 0, 0.9215686, 1, 1,
0.05668775, -1.147906, 3.136695, 0, 0.9176471, 1, 1,
0.05949115, -0.2393439, 3.048355, 0, 0.9098039, 1, 1,
0.06560624, 1.544883, 0.6052355, 0, 0.9058824, 1, 1,
0.06988304, 0.477462, 0.7800332, 0, 0.8980392, 1, 1,
0.07515169, 0.04664641, -0.07008405, 0, 0.8901961, 1, 1,
0.07866307, -0.213603, 4.85165, 0, 0.8862745, 1, 1,
0.08154582, 0.9469988, 0.1719214, 0, 0.8784314, 1, 1,
0.08422979, -1.405224, 5.253119, 0, 0.8745098, 1, 1,
0.09140215, 0.8985937, 0.2585206, 0, 0.8666667, 1, 1,
0.09412183, 0.8588272, 0.8489364, 0, 0.8627451, 1, 1,
0.09723775, -0.4125443, 2.783162, 0, 0.854902, 1, 1,
0.1087573, 0.8891204, 0.1205283, 0, 0.8509804, 1, 1,
0.1108075, -0.6505568, 4.348158, 0, 0.8431373, 1, 1,
0.1217931, 0.9599847, 2.348481, 0, 0.8392157, 1, 1,
0.1241616, 1.528809, -0.324581, 0, 0.8313726, 1, 1,
0.1255062, -0.6351366, 2.70594, 0, 0.827451, 1, 1,
0.126895, 1.518909, 1.151392, 0, 0.8196079, 1, 1,
0.1367233, -1.05398, 3.321427, 0, 0.8156863, 1, 1,
0.1373413, -0.3462804, 3.128358, 0, 0.8078431, 1, 1,
0.1378431, 0.6808438, -0.1881808, 0, 0.8039216, 1, 1,
0.1396751, 0.2171631, 0.6664782, 0, 0.7960784, 1, 1,
0.1401467, 0.5375359, 0.4971692, 0, 0.7882353, 1, 1,
0.1401597, 0.8892548, -2.728984, 0, 0.7843137, 1, 1,
0.1414947, 0.4651204, 2.953636, 0, 0.7764706, 1, 1,
0.1486205, -1.605523, 1.851685, 0, 0.772549, 1, 1,
0.1503352, 0.5836929, 1.813797, 0, 0.7647059, 1, 1,
0.154609, 0.6020709, 1.299919, 0, 0.7607843, 1, 1,
0.1548347, 1.585016, -0.1838657, 0, 0.7529412, 1, 1,
0.1580911, -0.1249298, 1.955881, 0, 0.7490196, 1, 1,
0.1600979, 1.263804, -0.2473285, 0, 0.7411765, 1, 1,
0.1605758, -0.244984, 1.746998, 0, 0.7372549, 1, 1,
0.1629181, 1.467388, 0.03135001, 0, 0.7294118, 1, 1,
0.1656653, 0.4823385, -1.225749, 0, 0.7254902, 1, 1,
0.1668247, -0.5380257, 2.466717, 0, 0.7176471, 1, 1,
0.1718489, -1.936392, 3.480827, 0, 0.7137255, 1, 1,
0.1732351, -0.05625353, 1.56806, 0, 0.7058824, 1, 1,
0.1750668, -1.209493, 3.737738, 0, 0.6980392, 1, 1,
0.1762436, 1.480752, -1.764503, 0, 0.6941177, 1, 1,
0.1789055, -0.7338833, 2.571162, 0, 0.6862745, 1, 1,
0.1799163, -0.6469928, 3.276537, 0, 0.682353, 1, 1,
0.1817779, 0.9206429, 0.2929208, 0, 0.6745098, 1, 1,
0.1818868, -0.8076637, 2.636405, 0, 0.6705883, 1, 1,
0.1871416, -1.048689, 3.928901, 0, 0.6627451, 1, 1,
0.188384, 0.4562025, -1.336551, 0, 0.6588235, 1, 1,
0.1888733, 1.173559, -1.501805, 0, 0.6509804, 1, 1,
0.1898944, 1.185863, -0.1428206, 0, 0.6470588, 1, 1,
0.1952389, -0.5077896, 3.404616, 0, 0.6392157, 1, 1,
0.1983973, -0.3465415, 2.158943, 0, 0.6352941, 1, 1,
0.2029791, -0.308529, -0.2461523, 0, 0.627451, 1, 1,
0.2041158, -0.148427, 2.1459, 0, 0.6235294, 1, 1,
0.209528, -1.617174, 3.567274, 0, 0.6156863, 1, 1,
0.214562, -0.4445861, 3.255264, 0, 0.6117647, 1, 1,
0.221512, -1.371419, 3.908161, 0, 0.6039216, 1, 1,
0.2254927, -0.595302, 1.895378, 0, 0.5960785, 1, 1,
0.2273168, -1.519191, 3.013192, 0, 0.5921569, 1, 1,
0.2292197, 1.095987, 0.837107, 0, 0.5843138, 1, 1,
0.2305372, 0.2222131, 0.8716452, 0, 0.5803922, 1, 1,
0.2345269, -1.339536, 2.198509, 0, 0.572549, 1, 1,
0.2347755, 1.538032, -0.08397895, 0, 0.5686275, 1, 1,
0.2350774, 0.7600661, -0.7157915, 0, 0.5607843, 1, 1,
0.2352482, 0.282302, 0.5980597, 0, 0.5568628, 1, 1,
0.238427, 0.4008859, 0.5246192, 0, 0.5490196, 1, 1,
0.2457707, 2.298039, 1.158539, 0, 0.5450981, 1, 1,
0.2470182, -0.7320046, 3.390866, 0, 0.5372549, 1, 1,
0.2472281, -1.768908, 4.304695, 0, 0.5333334, 1, 1,
0.2489731, 0.8186209, -0.7227995, 0, 0.5254902, 1, 1,
0.2492792, -0.617891, 2.362826, 0, 0.5215687, 1, 1,
0.2514678, 1.022788, -0.09189588, 0, 0.5137255, 1, 1,
0.2527399, -0.008836293, 1.63375, 0, 0.509804, 1, 1,
0.2549268, 1.512701, 0.3004845, 0, 0.5019608, 1, 1,
0.259093, -0.1339525, 1.25589, 0, 0.4941176, 1, 1,
0.2626964, 0.9847472, 0.4556966, 0, 0.4901961, 1, 1,
0.2652889, -1.796057, 2.180456, 0, 0.4823529, 1, 1,
0.2666147, 0.777635, -0.04780312, 0, 0.4784314, 1, 1,
0.2666647, 0.2944013, 0.7482324, 0, 0.4705882, 1, 1,
0.2708939, 0.7634587, 0.4035316, 0, 0.4666667, 1, 1,
0.2765415, -1.088858, 3.740472, 0, 0.4588235, 1, 1,
0.2815156, -1.757179, 2.768963, 0, 0.454902, 1, 1,
0.2816919, 1.389271, 0.112837, 0, 0.4470588, 1, 1,
0.2833252, -0.341878, 2.037942, 0, 0.4431373, 1, 1,
0.2868277, -0.05571952, 1.496666, 0, 0.4352941, 1, 1,
0.2876864, 0.7019871, 1.280893, 0, 0.4313726, 1, 1,
0.2886581, 0.4317535, 1.531381, 0, 0.4235294, 1, 1,
0.2893276, -0.5435117, 1.599959, 0, 0.4196078, 1, 1,
0.2897361, 1.118462, 1.190423, 0, 0.4117647, 1, 1,
0.2929956, -1.706735, 2.147653, 0, 0.4078431, 1, 1,
0.2933425, 0.3670698, 0.2789948, 0, 0.4, 1, 1,
0.2935689, 0.9977578, 0.04031365, 0, 0.3921569, 1, 1,
0.2956684, 0.0663465, 2.378544, 0, 0.3882353, 1, 1,
0.2967891, -0.7514737, 2.83887, 0, 0.3803922, 1, 1,
0.2987708, -0.7340251, 3.166903, 0, 0.3764706, 1, 1,
0.3035246, -0.6521791, 1.194377, 0, 0.3686275, 1, 1,
0.3040195, -1.445216, 3.036824, 0, 0.3647059, 1, 1,
0.3047652, 0.6177126, -1.788096, 0, 0.3568628, 1, 1,
0.3069218, 1.298541, 0.2017001, 0, 0.3529412, 1, 1,
0.3116472, 1.044878, 2.008447, 0, 0.345098, 1, 1,
0.316648, 1.95435, 0.0041599, 0, 0.3411765, 1, 1,
0.3187507, 1.102101, 0.6743219, 0, 0.3333333, 1, 1,
0.3189637, -0.6858477, 4.426308, 0, 0.3294118, 1, 1,
0.3189952, -0.2684056, 2.472544, 0, 0.3215686, 1, 1,
0.3216807, 0.4560203, 0.5520097, 0, 0.3176471, 1, 1,
0.322906, 0.5339262, 0.5557908, 0, 0.3098039, 1, 1,
0.3258199, -0.0784521, 1.26978, 0, 0.3058824, 1, 1,
0.329256, 1.011743, 0.2510824, 0, 0.2980392, 1, 1,
0.3303794, -1.220614, 3.427562, 0, 0.2901961, 1, 1,
0.3334338, -0.8467327, 2.55025, 0, 0.2862745, 1, 1,
0.3342688, 1.032878, 0.8055435, 0, 0.2784314, 1, 1,
0.3403576, 0.7368914, 1.067119, 0, 0.2745098, 1, 1,
0.3405668, 0.5684303, 0.9119567, 0, 0.2666667, 1, 1,
0.3507809, -0.3432903, 1.759868, 0, 0.2627451, 1, 1,
0.353427, 0.9765497, 2.499137, 0, 0.254902, 1, 1,
0.3589119, 1.985891, 0.2601356, 0, 0.2509804, 1, 1,
0.3609721, 2.64082, -1.203743e-06, 0, 0.2431373, 1, 1,
0.3619101, -0.09714645, 1.930061, 0, 0.2392157, 1, 1,
0.3620272, 0.05360902, 2.213846, 0, 0.2313726, 1, 1,
0.3720372, -0.9287359, 1.25704, 0, 0.227451, 1, 1,
0.3765074, -0.6389424, 2.124828, 0, 0.2196078, 1, 1,
0.3799812, -0.1792493, 4.005273, 0, 0.2156863, 1, 1,
0.3805108, -0.1843682, 0.1122925, 0, 0.2078431, 1, 1,
0.3831507, -0.09833457, 1.964413, 0, 0.2039216, 1, 1,
0.3860373, 0.6313846, 0.2395221, 0, 0.1960784, 1, 1,
0.3866247, 1.842221, 0.3377635, 0, 0.1882353, 1, 1,
0.3866554, -0.1040154, 2.056276, 0, 0.1843137, 1, 1,
0.3922603, 0.617309, 0.127711, 0, 0.1764706, 1, 1,
0.3932259, -0.01606019, 2.147414, 0, 0.172549, 1, 1,
0.3934693, 1.091666, 0.01771523, 0, 0.1647059, 1, 1,
0.4017213, 0.1750569, 0.2057114, 0, 0.1607843, 1, 1,
0.4070526, -3.763314, 2.795552, 0, 0.1529412, 1, 1,
0.4104404, 0.9699703, 0.3237799, 0, 0.1490196, 1, 1,
0.4108351, 1.372744, 1.060773, 0, 0.1411765, 1, 1,
0.4153424, 1.970194, 1.587723, 0, 0.1372549, 1, 1,
0.4181207, 0.3974918, 1.662559, 0, 0.1294118, 1, 1,
0.4215841, 0.1443332, 1.753993, 0, 0.1254902, 1, 1,
0.4234026, -0.6616327, 2.239073, 0, 0.1176471, 1, 1,
0.430122, -0.786907, 2.75955, 0, 0.1137255, 1, 1,
0.4308864, -0.1546142, 1.010716, 0, 0.1058824, 1, 1,
0.431247, 1.275685, -0.6440376, 0, 0.09803922, 1, 1,
0.4341123, -0.8355298, 0.634308, 0, 0.09411765, 1, 1,
0.4355385, -0.4893244, 1.770153, 0, 0.08627451, 1, 1,
0.4364321, -1.198234, 2.9901, 0, 0.08235294, 1, 1,
0.4373787, -0.05593715, 3.240526, 0, 0.07450981, 1, 1,
0.4441274, 0.2651184, -0.7502247, 0, 0.07058824, 1, 1,
0.4485647, 0.1841959, 1.480245, 0, 0.0627451, 1, 1,
0.453266, -1.78331, 2.227397, 0, 0.05882353, 1, 1,
0.4633045, 1.196534, -0.3161319, 0, 0.05098039, 1, 1,
0.4656889, 0.6334792, 1.494685, 0, 0.04705882, 1, 1,
0.4686651, 0.6688322, 0.2254063, 0, 0.03921569, 1, 1,
0.4702944, 0.4918526, -0.5071505, 0, 0.03529412, 1, 1,
0.470991, -1.198065, 3.637997, 0, 0.02745098, 1, 1,
0.4734335, -0.09544612, 0.9482052, 0, 0.02352941, 1, 1,
0.4748716, 0.3286082, 1.127802, 0, 0.01568628, 1, 1,
0.4761708, 0.2913945, 2.148475, 0, 0.01176471, 1, 1,
0.4773559, 0.6527877, -0.3731521, 0, 0.003921569, 1, 1,
0.4785228, -0.5198513, 4.158849, 0.003921569, 0, 1, 1,
0.481496, -1.553858, 3.296452, 0.007843138, 0, 1, 1,
0.4847269, -0.3720999, 2.064868, 0.01568628, 0, 1, 1,
0.4900702, -1.232473, 0.9011132, 0.01960784, 0, 1, 1,
0.491428, 2.086854, -0.09496739, 0.02745098, 0, 1, 1,
0.4930143, -0.3359518, 1.163406, 0.03137255, 0, 1, 1,
0.4957007, 0.4678558, 0.3369338, 0.03921569, 0, 1, 1,
0.499404, -0.05108989, 0.1922928, 0.04313726, 0, 1, 1,
0.5000099, 1.328942, 1.412488, 0.05098039, 0, 1, 1,
0.502627, -0.3334047, 2.874921, 0.05490196, 0, 1, 1,
0.5057278, -1.001447, 3.807146, 0.0627451, 0, 1, 1,
0.5105132, -0.3157376, 2.114118, 0.06666667, 0, 1, 1,
0.5107918, 0.2282728, 1.412553, 0.07450981, 0, 1, 1,
0.5139968, -0.4330393, 4.463835, 0.07843138, 0, 1, 1,
0.517255, 0.805032, 1.575368, 0.08627451, 0, 1, 1,
0.5194452, -0.419017, 3.015518, 0.09019608, 0, 1, 1,
0.5198602, -2.13408, 2.939884, 0.09803922, 0, 1, 1,
0.5271738, 1.816046, -0.0798957, 0.1058824, 0, 1, 1,
0.5294287, -0.5882804, 0.7051358, 0.1098039, 0, 1, 1,
0.5327635, -0.2761363, 0.2978667, 0.1176471, 0, 1, 1,
0.5331789, -0.5512725, 1.739804, 0.1215686, 0, 1, 1,
0.5343096, -0.6382729, 1.370697, 0.1294118, 0, 1, 1,
0.5347252, 0.2926285, 2.579, 0.1333333, 0, 1, 1,
0.5359215, 0.3957488, 0.5826687, 0.1411765, 0, 1, 1,
0.5372633, -0.2765467, 2.704739, 0.145098, 0, 1, 1,
0.5441666, -0.875683, 1.018573, 0.1529412, 0, 1, 1,
0.5494195, 1.311752, 1.046783, 0.1568628, 0, 1, 1,
0.555299, -0.8661532, 3.078613, 0.1647059, 0, 1, 1,
0.5561399, 0.4926695, 1.673962, 0.1686275, 0, 1, 1,
0.5567028, 0.1978693, 0.8593546, 0.1764706, 0, 1, 1,
0.5574237, -1.291102, 2.205658, 0.1803922, 0, 1, 1,
0.5583434, -0.2804635, 0.122414, 0.1882353, 0, 1, 1,
0.559182, 0.2892433, 1.122105, 0.1921569, 0, 1, 1,
0.5621893, 2.003016, -1.130496, 0.2, 0, 1, 1,
0.5652947, -0.4802881, 0.6261985, 0.2078431, 0, 1, 1,
0.5662931, 0.2000255, -0.009414917, 0.2117647, 0, 1, 1,
0.5664247, 1.115251, 0.6068318, 0.2196078, 0, 1, 1,
0.5703735, -2.137986, 2.834299, 0.2235294, 0, 1, 1,
0.574237, 0.5352985, 0.7508304, 0.2313726, 0, 1, 1,
0.5759412, -0.8649695, 2.569445, 0.2352941, 0, 1, 1,
0.5760616, 0.8645529, 1.310077, 0.2431373, 0, 1, 1,
0.5805452, -0.4041329, 1.0272, 0.2470588, 0, 1, 1,
0.5822443, 0.595991, -0.2786641, 0.254902, 0, 1, 1,
0.5857341, 1.356552, 0.3018094, 0.2588235, 0, 1, 1,
0.5867919, 0.1654048, 2.345173, 0.2666667, 0, 1, 1,
0.5868728, 0.7538772, 0.7898303, 0.2705882, 0, 1, 1,
0.5885099, -0.3213981, 1.776349, 0.2784314, 0, 1, 1,
0.5906229, -1.190559, 2.970412, 0.282353, 0, 1, 1,
0.5939887, -2.235077, 3.169975, 0.2901961, 0, 1, 1,
0.5988907, 1.36564, 2.284973, 0.2941177, 0, 1, 1,
0.605177, -0.8703397, 2.9074, 0.3019608, 0, 1, 1,
0.6076553, -2.030705, 1.808385, 0.3098039, 0, 1, 1,
0.6086855, -1.041311, 3.096408, 0.3137255, 0, 1, 1,
0.6109258, 0.1135368, 3.25017, 0.3215686, 0, 1, 1,
0.6120701, -1.817121, 2.074927, 0.3254902, 0, 1, 1,
0.6123174, 0.3915471, 1.02058, 0.3333333, 0, 1, 1,
0.6149753, 0.23345, 0.4489339, 0.3372549, 0, 1, 1,
0.6156292, -0.2623906, 3.427958, 0.345098, 0, 1, 1,
0.6160168, -1.36225, 2.350283, 0.3490196, 0, 1, 1,
0.6182066, -0.4909559, 3.187505, 0.3568628, 0, 1, 1,
0.6219975, -1.04653, 3.667533, 0.3607843, 0, 1, 1,
0.6221467, 0.9551172, 2.319368, 0.3686275, 0, 1, 1,
0.6224084, -2.395883, 3.804524, 0.372549, 0, 1, 1,
0.6255718, -1.022707, 1.606057, 0.3803922, 0, 1, 1,
0.6270037, 0.1449613, 1.654235, 0.3843137, 0, 1, 1,
0.6347736, 1.670886, 0.680724, 0.3921569, 0, 1, 1,
0.6378716, -0.2164638, 2.195282, 0.3960784, 0, 1, 1,
0.6411812, 0.1494705, 2.38276, 0.4039216, 0, 1, 1,
0.6440402, 1.315308, 1.069555, 0.4117647, 0, 1, 1,
0.6482723, 1.231889, 1.053704, 0.4156863, 0, 1, 1,
0.6495199, 0.3935082, -0.1125826, 0.4235294, 0, 1, 1,
0.6497517, 0.3369678, 2.220032, 0.427451, 0, 1, 1,
0.6508338, 0.3362746, 0.9645401, 0.4352941, 0, 1, 1,
0.6565974, 0.8346673, 1.522938, 0.4392157, 0, 1, 1,
0.6623713, 0.7460243, -0.7789648, 0.4470588, 0, 1, 1,
0.6643294, 0.4604279, 2.142937, 0.4509804, 0, 1, 1,
0.6648626, -1.281739, 0.6972716, 0.4588235, 0, 1, 1,
0.6676168, -0.6388068, 3.493817, 0.4627451, 0, 1, 1,
0.6710431, 1.23997, 0.9960176, 0.4705882, 0, 1, 1,
0.6803469, 0.7212893, 2.490259, 0.4745098, 0, 1, 1,
0.6814566, -0.793093, 2.498739, 0.4823529, 0, 1, 1,
0.6820554, -1.418572, 3.211843, 0.4862745, 0, 1, 1,
0.6834257, -0.9226862, 3.43629, 0.4941176, 0, 1, 1,
0.6837419, 0.1755538, 1.052843, 0.5019608, 0, 1, 1,
0.6851332, -1.557598, 4.200899, 0.5058824, 0, 1, 1,
0.6909169, -2.043029, 2.356022, 0.5137255, 0, 1, 1,
0.6937505, -0.1409495, 3.281316, 0.5176471, 0, 1, 1,
0.7155483, -0.02388008, 1.091839, 0.5254902, 0, 1, 1,
0.7157102, -0.2958865, 2.582671, 0.5294118, 0, 1, 1,
0.7228948, -2.050745, 2.537928, 0.5372549, 0, 1, 1,
0.7236937, -2.005109, 1.175013, 0.5411765, 0, 1, 1,
0.7249647, -0.9121377, 2.14359, 0.5490196, 0, 1, 1,
0.7266197, 0.9746408, 1.394622, 0.5529412, 0, 1, 1,
0.7377178, 1.473327, 0.9404067, 0.5607843, 0, 1, 1,
0.7418497, 0.870877, 0.9039061, 0.5647059, 0, 1, 1,
0.7421942, -1.354025, 1.584348, 0.572549, 0, 1, 1,
0.7441875, -1.568677, 2.09717, 0.5764706, 0, 1, 1,
0.7457085, -0.112081, 1.816387, 0.5843138, 0, 1, 1,
0.7482798, -1.720951, 3.426538, 0.5882353, 0, 1, 1,
0.7497081, 0.03982347, -0.2343847, 0.5960785, 0, 1, 1,
0.7499837, 2.298359, 0.9247205, 0.6039216, 0, 1, 1,
0.7501451, 1.20516, 1.829832, 0.6078432, 0, 1, 1,
0.7525489, -0.5366501, 1.511862, 0.6156863, 0, 1, 1,
0.753877, 0.9692678, 0.3870358, 0.6196079, 0, 1, 1,
0.7565839, -0.2851527, 0.7512554, 0.627451, 0, 1, 1,
0.7594189, -0.8953767, 3.94107, 0.6313726, 0, 1, 1,
0.7610213, -0.7943886, 1.261358, 0.6392157, 0, 1, 1,
0.7693896, 0.1164774, 1.562597, 0.6431373, 0, 1, 1,
0.7770911, -1.394812, 1.036864, 0.6509804, 0, 1, 1,
0.7816457, 1.955307, -1.562665, 0.654902, 0, 1, 1,
0.7823086, -0.4507494, 0.4968074, 0.6627451, 0, 1, 1,
0.7873217, -2.364127, 3.476673, 0.6666667, 0, 1, 1,
0.7915096, -0.9064803, 3.903761, 0.6745098, 0, 1, 1,
0.7956837, -2.054221, 3.837771, 0.6784314, 0, 1, 1,
0.795792, 1.304513, -0.1903224, 0.6862745, 0, 1, 1,
0.804146, 0.231276, 2.777843, 0.6901961, 0, 1, 1,
0.8062903, -0.8652402, 2.596503, 0.6980392, 0, 1, 1,
0.8067172, 0.9290154, 0.6603207, 0.7058824, 0, 1, 1,
0.8139719, -0.4765737, 3.200799, 0.7098039, 0, 1, 1,
0.8165858, -0.2114156, 3.372329, 0.7176471, 0, 1, 1,
0.8181909, 0.7179472, 2.291687, 0.7215686, 0, 1, 1,
0.8192707, -0.5294268, 0.05472963, 0.7294118, 0, 1, 1,
0.8208858, 0.8198754, 0.5702518, 0.7333333, 0, 1, 1,
0.8226019, 1.193309, -0.5532876, 0.7411765, 0, 1, 1,
0.8299882, 0.6475937, 0.9785987, 0.7450981, 0, 1, 1,
0.8323694, 0.302583, 2.896567, 0.7529412, 0, 1, 1,
0.8400692, -0.5274952, 3.601726, 0.7568628, 0, 1, 1,
0.8411839, -0.4775146, 1.484075, 0.7647059, 0, 1, 1,
0.8413504, -1.630091, 3.858475, 0.7686275, 0, 1, 1,
0.8418717, -1.240715, 2.415889, 0.7764706, 0, 1, 1,
0.8447477, 0.1496712, 1.400518, 0.7803922, 0, 1, 1,
0.8487847, -1.205783, 1.644925, 0.7882353, 0, 1, 1,
0.8489237, 0.7215187, 0.544024, 0.7921569, 0, 1, 1,
0.8636152, -0.03930727, 0.1620242, 0.8, 0, 1, 1,
0.8641322, 0.509272, 0.4260148, 0.8078431, 0, 1, 1,
0.8658236, 0.232088, -1.029531, 0.8117647, 0, 1, 1,
0.8706046, -1.237143, 1.339316, 0.8196079, 0, 1, 1,
0.8758416, 1.220516, 1.488784, 0.8235294, 0, 1, 1,
0.8820381, 1.188629, 0.0682852, 0.8313726, 0, 1, 1,
0.8828837, 2.054541, 0.8608617, 0.8352941, 0, 1, 1,
0.8878871, 1.126151, 1.050361, 0.8431373, 0, 1, 1,
0.8900532, 0.2850986, 1.441375, 0.8470588, 0, 1, 1,
0.8909498, -1.244182, 2.983954, 0.854902, 0, 1, 1,
0.8915121, 1.260424, 1.556589, 0.8588235, 0, 1, 1,
0.8921823, 0.3502964, 2.325686, 0.8666667, 0, 1, 1,
0.8975922, -0.103203, 1.655125, 0.8705882, 0, 1, 1,
0.9048539, -0.6308122, 2.566221, 0.8784314, 0, 1, 1,
0.9086152, 0.3927383, 1.804001, 0.8823529, 0, 1, 1,
0.9114043, -0.4042647, 1.78504, 0.8901961, 0, 1, 1,
0.9115891, 0.6198265, 1.769536, 0.8941177, 0, 1, 1,
0.9234916, 0.01568457, 0.7091521, 0.9019608, 0, 1, 1,
0.9294181, 0.206153, 2.90325, 0.9098039, 0, 1, 1,
0.9499953, -1.58537, 1.003252, 0.9137255, 0, 1, 1,
0.9738955, -2.301822, 4.592394, 0.9215686, 0, 1, 1,
0.9799146, -1.897453, 0.388282, 0.9254902, 0, 1, 1,
0.98057, -0.1007328, 1.631259, 0.9333333, 0, 1, 1,
0.9832847, -1.091374, 2.798327, 0.9372549, 0, 1, 1,
0.9866515, 0.6835688, 0.8199602, 0.945098, 0, 1, 1,
0.987025, 0.775652, -1.376824, 0.9490196, 0, 1, 1,
0.9874514, 2.530272, 1.190143, 0.9568627, 0, 1, 1,
0.9889489, -0.3230985, 2.416402, 0.9607843, 0, 1, 1,
0.9931366, -1.16236, 1.754253, 0.9686275, 0, 1, 1,
0.9945424, 0.5718271, 2.152179, 0.972549, 0, 1, 1,
0.9988016, 0.9081033, -0.5443188, 0.9803922, 0, 1, 1,
1.000583, -0.1164657, 0.8785626, 0.9843137, 0, 1, 1,
1.007109, 0.4930161, 0.9954864, 0.9921569, 0, 1, 1,
1.008548, 0.05167064, 2.338281, 0.9960784, 0, 1, 1,
1.010901, -1.1467, 4.602994, 1, 0, 0.9960784, 1,
1.011665, 0.2797322, 1.632995, 1, 0, 0.9882353, 1,
1.014218, -1.507065, 2.351199, 1, 0, 0.9843137, 1,
1.014831, 0.03789477, 1.439698, 1, 0, 0.9764706, 1,
1.025231, 0.1668738, 1.138593, 1, 0, 0.972549, 1,
1.031316, -0.5245245, 0.4372725, 1, 0, 0.9647059, 1,
1.032956, -0.8151049, 4.226238, 1, 0, 0.9607843, 1,
1.035574, -0.6120269, 1.255123, 1, 0, 0.9529412, 1,
1.035904, -0.05207784, 0.8757731, 1, 0, 0.9490196, 1,
1.038842, -0.2070305, 2.713306, 1, 0, 0.9411765, 1,
1.041738, 0.6145599, 0.9456422, 1, 0, 0.9372549, 1,
1.042816, -0.2403253, 3.175355, 1, 0, 0.9294118, 1,
1.051136, -0.3509416, 3.457025, 1, 0, 0.9254902, 1,
1.059381, -0.07055475, 3.048696, 1, 0, 0.9176471, 1,
1.06693, -0.4345792, 1.237612, 1, 0, 0.9137255, 1,
1.071075, -0.2614878, 2.306157, 1, 0, 0.9058824, 1,
1.077833, -0.3504648, 2.349353, 1, 0, 0.9019608, 1,
1.086536, 2.724719, 1.462408, 1, 0, 0.8941177, 1,
1.090785, -1.283778, 3.168406, 1, 0, 0.8862745, 1,
1.095089, -0.3490876, 0.0207847, 1, 0, 0.8823529, 1,
1.105755, 1.20165, 0.3712467, 1, 0, 0.8745098, 1,
1.111748, -1.180473, 2.946205, 1, 0, 0.8705882, 1,
1.116063, 1.436663, 2.197813, 1, 0, 0.8627451, 1,
1.116064, 0.4399292, 2.34387, 1, 0, 0.8588235, 1,
1.121754, 0.2742802, 1.975248, 1, 0, 0.8509804, 1,
1.125732, -0.8880946, 1.298434, 1, 0, 0.8470588, 1,
1.12591, 0.3780441, 1.251771, 1, 0, 0.8392157, 1,
1.12908, 0.9187158, 1.646132, 1, 0, 0.8352941, 1,
1.1296, 0.3665399, 2.668388, 1, 0, 0.827451, 1,
1.142089, 2.217676, 1.036535, 1, 0, 0.8235294, 1,
1.142624, -0.4272589, 2.016326, 1, 0, 0.8156863, 1,
1.142679, 0.9860281, 1.995442, 1, 0, 0.8117647, 1,
1.143187, 0.08091726, 3.279345, 1, 0, 0.8039216, 1,
1.143849, -0.8795025, 3.008337, 1, 0, 0.7960784, 1,
1.146055, -0.997477, 1.365188, 1, 0, 0.7921569, 1,
1.148845, -1.197642, 2.400178, 1, 0, 0.7843137, 1,
1.14902, 0.4444683, 0.8825446, 1, 0, 0.7803922, 1,
1.152236, 0.5424153, 0.295092, 1, 0, 0.772549, 1,
1.153779, 0.6322789, 3.739742, 1, 0, 0.7686275, 1,
1.156928, -0.394215, 2.836698, 1, 0, 0.7607843, 1,
1.15795, 0.8824928, 0.2987215, 1, 0, 0.7568628, 1,
1.162563, 1.205249, 0.8694747, 1, 0, 0.7490196, 1,
1.173005, -0.328873, 1.273931, 1, 0, 0.7450981, 1,
1.176011, -1.087042, 2.711895, 1, 0, 0.7372549, 1,
1.213087, 0.4069596, 0.733214, 1, 0, 0.7333333, 1,
1.214163, 0.7605323, -0.2492205, 1, 0, 0.7254902, 1,
1.214563, -1.354646, 3.333138, 1, 0, 0.7215686, 1,
1.216066, -1.373346, 1.854789, 1, 0, 0.7137255, 1,
1.220136, -1.302252, 4.678805, 1, 0, 0.7098039, 1,
1.220602, 0.9354235, 2.221012, 1, 0, 0.7019608, 1,
1.231199, 0.8649204, -1.317901, 1, 0, 0.6941177, 1,
1.23371, 0.3997235, -0.1509498, 1, 0, 0.6901961, 1,
1.237651, 0.07974194, 0.3069879, 1, 0, 0.682353, 1,
1.243605, 1.491598, 0.8330066, 1, 0, 0.6784314, 1,
1.248367, 1.549853, -0.02392178, 1, 0, 0.6705883, 1,
1.250458, -0.6061507, 1.872518, 1, 0, 0.6666667, 1,
1.251084, 0.6745669, 2.368442, 1, 0, 0.6588235, 1,
1.256284, -0.07836763, 0.8170628, 1, 0, 0.654902, 1,
1.259957, -1.409923, 2.310311, 1, 0, 0.6470588, 1,
1.261557, 1.288619, 0.8794357, 1, 0, 0.6431373, 1,
1.268351, 1.142124, -0.09956785, 1, 0, 0.6352941, 1,
1.27436, 0.6325366, 1.055408, 1, 0, 0.6313726, 1,
1.275028, -0.5582436, 2.434031, 1, 0, 0.6235294, 1,
1.28796, -0.5180665, 2.390258, 1, 0, 0.6196079, 1,
1.292877, 0.7639237, 2.146549, 1, 0, 0.6117647, 1,
1.295533, -0.3982902, 1.937963, 1, 0, 0.6078432, 1,
1.296782, -0.1651971, 1.42418, 1, 0, 0.6, 1,
1.300594, 0.2092708, 2.605977, 1, 0, 0.5921569, 1,
1.316612, -0.489169, 1.039166, 1, 0, 0.5882353, 1,
1.318948, 0.356189, 1.32253, 1, 0, 0.5803922, 1,
1.32886, 0.337723, -0.2818305, 1, 0, 0.5764706, 1,
1.33325, -0.02084969, 0.8378872, 1, 0, 0.5686275, 1,
1.34358, 1.018693, 0.5681272, 1, 0, 0.5647059, 1,
1.353659, -1.464154, 1.576306, 1, 0, 0.5568628, 1,
1.356908, -0.511074, -0.5110697, 1, 0, 0.5529412, 1,
1.364219, 0.2867378, 4.09936, 1, 0, 0.5450981, 1,
1.377553, -0.2201544, 1.570006, 1, 0, 0.5411765, 1,
1.38538, -0.7897644, 4.010862, 1, 0, 0.5333334, 1,
1.386768, -0.1773849, 2.229532, 1, 0, 0.5294118, 1,
1.386929, -0.3661532, 2.949586, 1, 0, 0.5215687, 1,
1.38802, 0.5946044, 0.9071, 1, 0, 0.5176471, 1,
1.3976, 0.09862805, 1.018611, 1, 0, 0.509804, 1,
1.413118, -0.3227906, 2.243806, 1, 0, 0.5058824, 1,
1.413191, 0.233992, 2.701655, 1, 0, 0.4980392, 1,
1.415316, 0.8269145, 0.3082868, 1, 0, 0.4901961, 1,
1.419635, 2.436405, 1.94935, 1, 0, 0.4862745, 1,
1.434245, 0.4543075, 2.189519, 1, 0, 0.4784314, 1,
1.437951, -0.4325904, 1.976318, 1, 0, 0.4745098, 1,
1.44262, -0.5672968, 0.5853779, 1, 0, 0.4666667, 1,
1.447955, 1.132495, -0.6307353, 1, 0, 0.4627451, 1,
1.460617, 0.8812215, -0.8099663, 1, 0, 0.454902, 1,
1.465723, 0.4041003, 1.97577, 1, 0, 0.4509804, 1,
1.468524, 0.8355024, 1.404144, 1, 0, 0.4431373, 1,
1.484458, 0.2913628, 0.8443287, 1, 0, 0.4392157, 1,
1.490423, -0.6410267, 2.901706, 1, 0, 0.4313726, 1,
1.493505, -1.4942, 1.951828, 1, 0, 0.427451, 1,
1.493849, -0.8314435, 2.529593, 1, 0, 0.4196078, 1,
1.504564, -0.4481028, 1.337351, 1, 0, 0.4156863, 1,
1.519568, -1.394714, 2.614258, 1, 0, 0.4078431, 1,
1.52315, 0.1442992, 0.6391625, 1, 0, 0.4039216, 1,
1.524243, 0.02206257, 1.492877, 1, 0, 0.3960784, 1,
1.525348, -0.8318874, 2.671061, 1, 0, 0.3882353, 1,
1.538825, -0.2761675, 1.556101, 1, 0, 0.3843137, 1,
1.547014, -1.015484, 2.540034, 1, 0, 0.3764706, 1,
1.563126, -0.002450584, 1.615491, 1, 0, 0.372549, 1,
1.59077, 0.0681678, 0.4649792, 1, 0, 0.3647059, 1,
1.617611, 0.4500172, 2.056019, 1, 0, 0.3607843, 1,
1.625036, 0.8033606, 2.825597, 1, 0, 0.3529412, 1,
1.636133, 0.1642285, 1.845055, 1, 0, 0.3490196, 1,
1.649871, -0.8478628, 1.220676, 1, 0, 0.3411765, 1,
1.655146, -0.1832305, 1.084551, 1, 0, 0.3372549, 1,
1.665568, 1.07334, 1.461073, 1, 0, 0.3294118, 1,
1.670749, 0.6485631, 1.425547, 1, 0, 0.3254902, 1,
1.677788, 0.467696, 1.195939, 1, 0, 0.3176471, 1,
1.686446, -0.2481797, 1.62017, 1, 0, 0.3137255, 1,
1.719488, 0.5878176, -0.3481938, 1, 0, 0.3058824, 1,
1.74429, 0.6287984, 0.5929068, 1, 0, 0.2980392, 1,
1.747213, 0.7516077, 1.457473, 1, 0, 0.2941177, 1,
1.763413, -0.182194, 3.434437, 1, 0, 0.2862745, 1,
1.766092, 2.783172, 3.271547, 1, 0, 0.282353, 1,
1.784137, 0.4918703, 0.8789854, 1, 0, 0.2745098, 1,
1.786311, -0.2032986, 2.540148, 1, 0, 0.2705882, 1,
1.791272, 0.9810907, -0.1260422, 1, 0, 0.2627451, 1,
1.795704, 0.1151601, 1.551131, 1, 0, 0.2588235, 1,
1.801412, -0.3898754, 1.736979, 1, 0, 0.2509804, 1,
1.808237, -0.2220869, 0.8685977, 1, 0, 0.2470588, 1,
1.823209, 0.06241365, 0.5413809, 1, 0, 0.2392157, 1,
1.829856, -1.121916, 2.390086, 1, 0, 0.2352941, 1,
1.83653, 0.08490014, 2.122302, 1, 0, 0.227451, 1,
1.83737, -1.171157, 2.631535, 1, 0, 0.2235294, 1,
1.845729, -0.5564649, 0.6968423, 1, 0, 0.2156863, 1,
1.857451, -0.5420008, 4.024719, 1, 0, 0.2117647, 1,
1.861837, 0.5461975, 2.335567, 1, 0, 0.2039216, 1,
1.877656, -0.2032399, 0.6568012, 1, 0, 0.1960784, 1,
1.878105, 2.805118, 2.057144, 1, 0, 0.1921569, 1,
1.889145, 0.01143468, 1.915413, 1, 0, 0.1843137, 1,
1.889421, 1.079092, 2.138209, 1, 0, 0.1803922, 1,
1.89379, -2.028353, 2.101496, 1, 0, 0.172549, 1,
1.918877, 0.9668005, 1.024511, 1, 0, 0.1686275, 1,
1.928605, -0.06499349, 0.06100916, 1, 0, 0.1607843, 1,
1.931344, 0.9648815, 1.535103, 1, 0, 0.1568628, 1,
1.944781, 1.488268, 0.7768857, 1, 0, 0.1490196, 1,
1.9609, 0.1195922, -0.392437, 1, 0, 0.145098, 1,
1.972334, 0.3477455, 1.021408, 1, 0, 0.1372549, 1,
1.97747, 0.03208765, 0.7366549, 1, 0, 0.1333333, 1,
1.998479, -1.290779, 1.646929, 1, 0, 0.1254902, 1,
2.000584, 1.592763, -0.3022554, 1, 0, 0.1215686, 1,
2.000712, -0.2532327, 0.8514795, 1, 0, 0.1137255, 1,
2.052575, -0.2130464, -1.177309, 1, 0, 0.1098039, 1,
2.087257, 1.337309, 1.918064, 1, 0, 0.1019608, 1,
2.157105, -0.8030999, 2.684449, 1, 0, 0.09411765, 1,
2.165813, -1.092166, 1.381434, 1, 0, 0.09019608, 1,
2.225013, 0.9296443, 1.321398, 1, 0, 0.08235294, 1,
2.231483, -0.5977238, 1.703042, 1, 0, 0.07843138, 1,
2.246173, -0.06484025, 1.415379, 1, 0, 0.07058824, 1,
2.269373, 1.666834, 2.147279, 1, 0, 0.06666667, 1,
2.271125, 1.138947, 0.2777173, 1, 0, 0.05882353, 1,
2.330041, 1.026135, 2.294305, 1, 0, 0.05490196, 1,
2.33032, 0.3315578, 0.3962931, 1, 0, 0.04705882, 1,
2.35844, 0.1977778, 1.843859, 1, 0, 0.04313726, 1,
2.398762, -0.01981779, 3.013634, 1, 0, 0.03529412, 1,
2.427256, 1.300533, 2.557696, 1, 0, 0.03137255, 1,
2.465084, 0.4446805, 1.022914, 1, 0, 0.02352941, 1,
2.533728, -0.06927107, 0.7453766, 1, 0, 0.01960784, 1,
2.668692, -0.3336577, 2.655063, 1, 0, 0.01176471, 1,
2.669595, 1.889856, 0.8267522, 1, 0, 0.007843138, 1
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
-0.6540272, -4.897943, -7.276959, 0, -0.5, 0.5, 0.5,
-0.6540272, -4.897943, -7.276959, 1, -0.5, 0.5, 0.5,
-0.6540272, -4.897943, -7.276959, 1, 1.5, 0.5, 0.5,
-0.6540272, -4.897943, -7.276959, 0, 1.5, 0.5, 0.5
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
-5.104358, -0.4163271, -7.276959, 0, -0.5, 0.5, 0.5,
-5.104358, -0.4163271, -7.276959, 1, -0.5, 0.5, 0.5,
-5.104358, -0.4163271, -7.276959, 1, 1.5, 0.5, 0.5,
-5.104358, -0.4163271, -7.276959, 0, 1.5, 0.5, 0.5
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
-5.104358, -4.897943, -0.1039047, 0, -0.5, 0.5, 0.5,
-5.104358, -4.897943, -0.1039047, 1, -0.5, 0.5, 0.5,
-5.104358, -4.897943, -0.1039047, 1, 1.5, 0.5, 0.5,
-5.104358, -4.897943, -0.1039047, 0, 1.5, 0.5, 0.5
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
-3, -3.863724, -5.621639,
2, -3.863724, -5.621639,
-3, -3.863724, -5.621639,
-3, -4.036094, -5.897525,
-2, -3.863724, -5.621639,
-2, -4.036094, -5.897525,
-1, -3.863724, -5.621639,
-1, -4.036094, -5.897525,
0, -3.863724, -5.621639,
0, -4.036094, -5.897525,
1, -3.863724, -5.621639,
1, -4.036094, -5.897525,
2, -3.863724, -5.621639,
2, -4.036094, -5.897525
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
-3, -4.380834, -6.449299, 0, -0.5, 0.5, 0.5,
-3, -4.380834, -6.449299, 1, -0.5, 0.5, 0.5,
-3, -4.380834, -6.449299, 1, 1.5, 0.5, 0.5,
-3, -4.380834, -6.449299, 0, 1.5, 0.5, 0.5,
-2, -4.380834, -6.449299, 0, -0.5, 0.5, 0.5,
-2, -4.380834, -6.449299, 1, -0.5, 0.5, 0.5,
-2, -4.380834, -6.449299, 1, 1.5, 0.5, 0.5,
-2, -4.380834, -6.449299, 0, 1.5, 0.5, 0.5,
-1, -4.380834, -6.449299, 0, -0.5, 0.5, 0.5,
-1, -4.380834, -6.449299, 1, -0.5, 0.5, 0.5,
-1, -4.380834, -6.449299, 1, 1.5, 0.5, 0.5,
-1, -4.380834, -6.449299, 0, 1.5, 0.5, 0.5,
0, -4.380834, -6.449299, 0, -0.5, 0.5, 0.5,
0, -4.380834, -6.449299, 1, -0.5, 0.5, 0.5,
0, -4.380834, -6.449299, 1, 1.5, 0.5, 0.5,
0, -4.380834, -6.449299, 0, 1.5, 0.5, 0.5,
1, -4.380834, -6.449299, 0, -0.5, 0.5, 0.5,
1, -4.380834, -6.449299, 1, -0.5, 0.5, 0.5,
1, -4.380834, -6.449299, 1, 1.5, 0.5, 0.5,
1, -4.380834, -6.449299, 0, 1.5, 0.5, 0.5,
2, -4.380834, -6.449299, 0, -0.5, 0.5, 0.5,
2, -4.380834, -6.449299, 1, -0.5, 0.5, 0.5,
2, -4.380834, -6.449299, 1, 1.5, 0.5, 0.5,
2, -4.380834, -6.449299, 0, 1.5, 0.5, 0.5
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
-4.077359, -3, -5.621639,
-4.077359, 2, -5.621639,
-4.077359, -3, -5.621639,
-4.248525, -3, -5.897525,
-4.077359, -2, -5.621639,
-4.248525, -2, -5.897525,
-4.077359, -1, -5.621639,
-4.248525, -1, -5.897525,
-4.077359, 0, -5.621639,
-4.248525, 0, -5.897525,
-4.077359, 1, -5.621639,
-4.248525, 1, -5.897525,
-4.077359, 2, -5.621639,
-4.248525, 2, -5.897525
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
-4.590858, -3, -6.449299, 0, -0.5, 0.5, 0.5,
-4.590858, -3, -6.449299, 1, -0.5, 0.5, 0.5,
-4.590858, -3, -6.449299, 1, 1.5, 0.5, 0.5,
-4.590858, -3, -6.449299, 0, 1.5, 0.5, 0.5,
-4.590858, -2, -6.449299, 0, -0.5, 0.5, 0.5,
-4.590858, -2, -6.449299, 1, -0.5, 0.5, 0.5,
-4.590858, -2, -6.449299, 1, 1.5, 0.5, 0.5,
-4.590858, -2, -6.449299, 0, 1.5, 0.5, 0.5,
-4.590858, -1, -6.449299, 0, -0.5, 0.5, 0.5,
-4.590858, -1, -6.449299, 1, -0.5, 0.5, 0.5,
-4.590858, -1, -6.449299, 1, 1.5, 0.5, 0.5,
-4.590858, -1, -6.449299, 0, 1.5, 0.5, 0.5,
-4.590858, 0, -6.449299, 0, -0.5, 0.5, 0.5,
-4.590858, 0, -6.449299, 1, -0.5, 0.5, 0.5,
-4.590858, 0, -6.449299, 1, 1.5, 0.5, 0.5,
-4.590858, 0, -6.449299, 0, 1.5, 0.5, 0.5,
-4.590858, 1, -6.449299, 0, -0.5, 0.5, 0.5,
-4.590858, 1, -6.449299, 1, -0.5, 0.5, 0.5,
-4.590858, 1, -6.449299, 1, 1.5, 0.5, 0.5,
-4.590858, 1, -6.449299, 0, 1.5, 0.5, 0.5,
-4.590858, 2, -6.449299, 0, -0.5, 0.5, 0.5,
-4.590858, 2, -6.449299, 1, -0.5, 0.5, 0.5,
-4.590858, 2, -6.449299, 1, 1.5, 0.5, 0.5,
-4.590858, 2, -6.449299, 0, 1.5, 0.5, 0.5
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
-4.077359, -3.863724, -4,
-4.077359, -3.863724, 4,
-4.077359, -3.863724, -4,
-4.248525, -4.036094, -4,
-4.077359, -3.863724, -2,
-4.248525, -4.036094, -2,
-4.077359, -3.863724, 0,
-4.248525, -4.036094, 0,
-4.077359, -3.863724, 2,
-4.248525, -4.036094, 2,
-4.077359, -3.863724, 4,
-4.248525, -4.036094, 4
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
-4.590858, -4.380834, -4, 0, -0.5, 0.5, 0.5,
-4.590858, -4.380834, -4, 1, -0.5, 0.5, 0.5,
-4.590858, -4.380834, -4, 1, 1.5, 0.5, 0.5,
-4.590858, -4.380834, -4, 0, 1.5, 0.5, 0.5,
-4.590858, -4.380834, -2, 0, -0.5, 0.5, 0.5,
-4.590858, -4.380834, -2, 1, -0.5, 0.5, 0.5,
-4.590858, -4.380834, -2, 1, 1.5, 0.5, 0.5,
-4.590858, -4.380834, -2, 0, 1.5, 0.5, 0.5,
-4.590858, -4.380834, 0, 0, -0.5, 0.5, 0.5,
-4.590858, -4.380834, 0, 1, -0.5, 0.5, 0.5,
-4.590858, -4.380834, 0, 1, 1.5, 0.5, 0.5,
-4.590858, -4.380834, 0, 0, 1.5, 0.5, 0.5,
-4.590858, -4.380834, 2, 0, -0.5, 0.5, 0.5,
-4.590858, -4.380834, 2, 1, -0.5, 0.5, 0.5,
-4.590858, -4.380834, 2, 1, 1.5, 0.5, 0.5,
-4.590858, -4.380834, 2, 0, 1.5, 0.5, 0.5,
-4.590858, -4.380834, 4, 0, -0.5, 0.5, 0.5,
-4.590858, -4.380834, 4, 1, -0.5, 0.5, 0.5,
-4.590858, -4.380834, 4, 1, 1.5, 0.5, 0.5,
-4.590858, -4.380834, 4, 0, 1.5, 0.5, 0.5
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
-4.077359, -3.863724, -5.621639,
-4.077359, 3.03107, -5.621639,
-4.077359, -3.863724, 5.413829,
-4.077359, 3.03107, 5.413829,
-4.077359, -3.863724, -5.621639,
-4.077359, -3.863724, 5.413829,
-4.077359, 3.03107, -5.621639,
-4.077359, 3.03107, 5.413829,
-4.077359, -3.863724, -5.621639,
2.769304, -3.863724, -5.621639,
-4.077359, -3.863724, 5.413829,
2.769304, -3.863724, 5.413829,
-4.077359, 3.03107, -5.621639,
2.769304, 3.03107, -5.621639,
-4.077359, 3.03107, 5.413829,
2.769304, 3.03107, 5.413829,
2.769304, -3.863724, -5.621639,
2.769304, 3.03107, -5.621639,
2.769304, -3.863724, 5.413829,
2.769304, 3.03107, 5.413829,
2.769304, -3.863724, -5.621639,
2.769304, -3.863724, 5.413829,
2.769304, 3.03107, -5.621639,
2.769304, 3.03107, 5.413829
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
var radius = 7.851449;
var distance = 34.93198;
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
mvMatrix.translate( 0.6540272, 0.4163271, 0.1039047 );
mvMatrix.scale( 1.239895, 1.231239, 0.7692597 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.93198);
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
Propamocarb<-read.table("Propamocarb.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Propamocarb$V2
```

```
## Error in eval(expr, envir, enclos): object 'Propamocarb' not found
```

```r
y<-Propamocarb$V3
```

```
## Error in eval(expr, envir, enclos): object 'Propamocarb' not found
```

```r
z<-Propamocarb$V4
```

```
## Error in eval(expr, envir, enclos): object 'Propamocarb' not found
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
-3.97765, -0.6320934, -2.094576, 0, 0, 1, 1, 1,
-3.598055, -0.1510792, -2.089469, 1, 0, 0, 1, 1,
-3.427704, -1.230734, -3.50717, 1, 0, 0, 1, 1,
-3.379046, 0.3892135, -1.693198, 1, 0, 0, 1, 1,
-3.179575, -1.594195, -1.560388, 1, 0, 0, 1, 1,
-2.901694, -1.096269, -0.8834687, 1, 0, 0, 1, 1,
-2.882304, -0.1683646, -2.641834, 0, 0, 0, 1, 1,
-2.846868, -0.8370869, -2.519061, 0, 0, 0, 1, 1,
-2.839295, -0.5034493, -1.827536, 0, 0, 0, 1, 1,
-2.72632, -1.16643, -2.087961, 0, 0, 0, 1, 1,
-2.707313, 0.4620906, -1.338965, 0, 0, 0, 1, 1,
-2.706995, 0.63309, -1.768734, 0, 0, 0, 1, 1,
-2.678726, 0.162723, -1.152658, 0, 0, 0, 1, 1,
-2.676004, -1.787662, -2.328963, 1, 1, 1, 1, 1,
-2.550765, -0.7097092, -1.097036, 1, 1, 1, 1, 1,
-2.546082, 0.186119, -2.381818, 1, 1, 1, 1, 1,
-2.483677, 0.8101204, -3.526505, 1, 1, 1, 1, 1,
-2.388715, -0.4527335, -2.253536, 1, 1, 1, 1, 1,
-2.380753, 1.223716, -1.585088, 1, 1, 1, 1, 1,
-2.242688, -0.2675093, -0.6639139, 1, 1, 1, 1, 1,
-2.236704, 1.102285, -0.4433753, 1, 1, 1, 1, 1,
-2.125448, 0.249097, -0.7541921, 1, 1, 1, 1, 1,
-2.112892, 0.5408775, 0.6393652, 1, 1, 1, 1, 1,
-2.082559, 1.792301, -0.7545279, 1, 1, 1, 1, 1,
-2.070873, 0.5156908, -1.269079, 1, 1, 1, 1, 1,
-2.016591, 0.6254952, -3.480569, 1, 1, 1, 1, 1,
-1.994589, -0.5102853, -1.600874, 1, 1, 1, 1, 1,
-1.985542, -2.430033, -1.651051, 1, 1, 1, 1, 1,
-1.96069, 0.944573, -2.300808, 0, 0, 1, 1, 1,
-1.951539, 0.6253037, -0.8625878, 1, 0, 0, 1, 1,
-1.927289, -0.1698993, -1.645551, 1, 0, 0, 1, 1,
-1.907632, -0.550348, -2.270852, 1, 0, 0, 1, 1,
-1.899403, 0.3362465, -0.4700196, 1, 0, 0, 1, 1,
-1.895161, -1.290914, -1.289768, 1, 0, 0, 1, 1,
-1.893099, -0.3918114, -2.904379, 0, 0, 0, 1, 1,
-1.888982, -0.7818777, -1.818027, 0, 0, 0, 1, 1,
-1.883889, 0.01956091, -1.989808, 0, 0, 0, 1, 1,
-1.845154, -1.769261, -1.94578, 0, 0, 0, 1, 1,
-1.841038, 0.07888255, -0.6109608, 0, 0, 0, 1, 1,
-1.834622, -0.7843017, -1.660244, 0, 0, 0, 1, 1,
-1.814499, 1.110766, -1.105091, 0, 0, 0, 1, 1,
-1.795076, 0.007807242, -1.133803, 1, 1, 1, 1, 1,
-1.795033, 0.2169776, -3.952656, 1, 1, 1, 1, 1,
-1.790728, 0.7021455, -0.6755557, 1, 1, 1, 1, 1,
-1.769588, -0.01066013, -2.289305, 1, 1, 1, 1, 1,
-1.74044, 0.02877648, -2.768476, 1, 1, 1, 1, 1,
-1.736333, 0.5484728, -1.506128, 1, 1, 1, 1, 1,
-1.728054, 0.1418876, -0.8939967, 1, 1, 1, 1, 1,
-1.722584, -2.211041, -0.7656547, 1, 1, 1, 1, 1,
-1.721648, 0.7193363, -1.07847, 1, 1, 1, 1, 1,
-1.720502, 0.1884893, -4.178749, 1, 1, 1, 1, 1,
-1.718446, -1.056646, -2.875023, 1, 1, 1, 1, 1,
-1.707747, -1.154803, -0.9258187, 1, 1, 1, 1, 1,
-1.697167, 1.679262, -3.933536, 1, 1, 1, 1, 1,
-1.696477, -0.2718024, -1.096311, 1, 1, 1, 1, 1,
-1.692323, 1.176092, -2.171351, 1, 1, 1, 1, 1,
-1.682774, -1.973185, -3.006223, 0, 0, 1, 1, 1,
-1.675473, 0.03229572, -2.987386, 1, 0, 0, 1, 1,
-1.665615, -0.2690783, -1.208434, 1, 0, 0, 1, 1,
-1.664835, 1.354123, -0.969303, 1, 0, 0, 1, 1,
-1.660632, 0.9481534, 0.5594103, 1, 0, 0, 1, 1,
-1.659424, -0.9978282, -3.39539, 1, 0, 0, 1, 1,
-1.65281, 0.1916152, -1.96303, 0, 0, 0, 1, 1,
-1.647901, -0.1274742, -0.9282049, 0, 0, 0, 1, 1,
-1.635577, -0.03817123, -1.32775, 0, 0, 0, 1, 1,
-1.63155, -0.5627728, -1.745797, 0, 0, 0, 1, 1,
-1.626387, -1.103527, -2.711278, 0, 0, 0, 1, 1,
-1.622296, 2.93066, -0.9943168, 0, 0, 0, 1, 1,
-1.618816, -0.949479, -1.526129, 0, 0, 0, 1, 1,
-1.605168, -0.4469891, -0.05158702, 1, 1, 1, 1, 1,
-1.60443, -0.8252584, -4.37407, 1, 1, 1, 1, 1,
-1.60269, 1.516665, -0.5748851, 1, 1, 1, 1, 1,
-1.59804, 0.3123718, -3.309635, 1, 1, 1, 1, 1,
-1.583598, 1.423123, -2.99626, 1, 1, 1, 1, 1,
-1.579739, -0.901288, -3.516278, 1, 1, 1, 1, 1,
-1.573359, -0.1743935, -2.323558, 1, 1, 1, 1, 1,
-1.573049, 0.9075707, -0.1624859, 1, 1, 1, 1, 1,
-1.567051, -0.1313763, -3.413813, 1, 1, 1, 1, 1,
-1.565562, -0.8804174, -0.476726, 1, 1, 1, 1, 1,
-1.549523, 1.388284, -0.4633225, 1, 1, 1, 1, 1,
-1.523437, 1.865097, -2.577186, 1, 1, 1, 1, 1,
-1.520434, 0.9737392, -2.053609, 1, 1, 1, 1, 1,
-1.500852, 1.298672, -1.539393, 1, 1, 1, 1, 1,
-1.491652, 0.2412077, -0.1554018, 1, 1, 1, 1, 1,
-1.48311, 0.6635042, -2.285846, 0, 0, 1, 1, 1,
-1.475193, -1.051032, -3.020828, 1, 0, 0, 1, 1,
-1.472914, 1.564715, -2.119802, 1, 0, 0, 1, 1,
-1.469337, 0.8597125, -0.864713, 1, 0, 0, 1, 1,
-1.463405, -1.171381, -2.111173, 1, 0, 0, 1, 1,
-1.459213, -0.4881321, -0.8385555, 1, 0, 0, 1, 1,
-1.45179, 2.591131, -1.112236, 0, 0, 0, 1, 1,
-1.447361, 0.8626226, -1.766847, 0, 0, 0, 1, 1,
-1.440599, -1.379822, -1.884017, 0, 0, 0, 1, 1,
-1.43639, -0.6241126, -1.296971, 0, 0, 0, 1, 1,
-1.433797, -1.05756, -3.926982, 0, 0, 0, 1, 1,
-1.427078, 0.993252, 0.3161434, 0, 0, 0, 1, 1,
-1.416887, 1.345219, -1.849589, 0, 0, 0, 1, 1,
-1.414736, -0.1721229, -1.264441, 1, 1, 1, 1, 1,
-1.411364, -0.1787982, -0.8675252, 1, 1, 1, 1, 1,
-1.409201, -0.985007, -2.77338, 1, 1, 1, 1, 1,
-1.399375, 0.4998183, -0.5933231, 1, 1, 1, 1, 1,
-1.395421, -0.2562806, -2.534091, 1, 1, 1, 1, 1,
-1.382153, 0.8092065, 0.3959365, 1, 1, 1, 1, 1,
-1.379139, -0.5882778, -2.496585, 1, 1, 1, 1, 1,
-1.377997, -0.2355786, -1.948049, 1, 1, 1, 1, 1,
-1.371645, -0.4641624, -0.3994618, 1, 1, 1, 1, 1,
-1.370751, 0.7220395, -0.05200475, 1, 1, 1, 1, 1,
-1.355013, 0.4704411, -1.559034, 1, 1, 1, 1, 1,
-1.345817, 1.225936, -1.354656, 1, 1, 1, 1, 1,
-1.335837, 1.295076, -0.7530558, 1, 1, 1, 1, 1,
-1.328515, 0.06639065, -0.785841, 1, 1, 1, 1, 1,
-1.325416, -0.3025175, -1.383862, 1, 1, 1, 1, 1,
-1.31287, -0.1298744, -1.367738, 0, 0, 1, 1, 1,
-1.311116, -0.1422206, -1.893343, 1, 0, 0, 1, 1,
-1.307588, -1.336032, -3.251876, 1, 0, 0, 1, 1,
-1.303589, 0.4129741, -2.899226, 1, 0, 0, 1, 1,
-1.297363, 0.2684204, -2.143664, 1, 0, 0, 1, 1,
-1.296356, -0.629616, -1.751623, 1, 0, 0, 1, 1,
-1.293439, -1.332824, -3.961874, 0, 0, 0, 1, 1,
-1.287417, -0.0817532, -2.263703, 0, 0, 0, 1, 1,
-1.285064, -0.110975, -0.6779053, 0, 0, 0, 1, 1,
-1.283735, 0.1116872, -2.37147, 0, 0, 0, 1, 1,
-1.278138, 0.4974136, -0.4039458, 0, 0, 0, 1, 1,
-1.271384, -1.019022, -1.566128, 0, 0, 0, 1, 1,
-1.251938, -0.9976848, -1.210099, 0, 0, 0, 1, 1,
-1.247922, -1.220251, -3.040319, 1, 1, 1, 1, 1,
-1.245276, -1.989265, -2.456006, 1, 1, 1, 1, 1,
-1.242291, 0.8929096, -0.6290215, 1, 1, 1, 1, 1,
-1.242185, -0.2093352, -1.054637, 1, 1, 1, 1, 1,
-1.234428, -0.4181193, -0.7428592, 1, 1, 1, 1, 1,
-1.232618, 0.3272067, -0.4861703, 1, 1, 1, 1, 1,
-1.229918, -0.6479102, -2.63783, 1, 1, 1, 1, 1,
-1.216555, 0.3426829, -0.5176959, 1, 1, 1, 1, 1,
-1.191977, -0.1502515, -1.436462, 1, 1, 1, 1, 1,
-1.189373, -0.160527, -0.8294051, 1, 1, 1, 1, 1,
-1.186556, -0.3502422, -1.505133, 1, 1, 1, 1, 1,
-1.185397, -1.225417, -1.447558, 1, 1, 1, 1, 1,
-1.184525, 0.07699703, -0.5520983, 1, 1, 1, 1, 1,
-1.180971, -1.190476, -4.658651, 1, 1, 1, 1, 1,
-1.151248, -0.6616549, -1.222813, 1, 1, 1, 1, 1,
-1.150695, 0.01030688, -1.022263, 0, 0, 1, 1, 1,
-1.145981, 2.642788, -0.2804275, 1, 0, 0, 1, 1,
-1.142073, 1.931899, 0.2962756, 1, 0, 0, 1, 1,
-1.139943, 0.9913979, -1.639163, 1, 0, 0, 1, 1,
-1.125833, 0.3026435, -1.750331, 1, 0, 0, 1, 1,
-1.117898, 0.2052047, -0.5130262, 1, 0, 0, 1, 1,
-1.098762, -0.3431658, -0.3640538, 0, 0, 0, 1, 1,
-1.096456, 0.1086812, 1.621802, 0, 0, 0, 1, 1,
-1.091557, 0.3562887, -2.523785, 0, 0, 0, 1, 1,
-1.087649, 0.2904185, -2.980102, 0, 0, 0, 1, 1,
-1.0843, 1.319979, -0.5791858, 0, 0, 0, 1, 1,
-1.083441, 0.7375843, -1.214203, 0, 0, 0, 1, 1,
-1.08262, -0.06624403, -1.482866, 0, 0, 0, 1, 1,
-1.082272, 0.836417, -1.289798, 1, 1, 1, 1, 1,
-1.078742, 1.259765, -0.07298055, 1, 1, 1, 1, 1,
-1.077794, -0.7067797, -2.866933, 1, 1, 1, 1, 1,
-1.076726, -0.4994002, -2.315965, 1, 1, 1, 1, 1,
-1.070187, -0.9035138, -2.911189, 1, 1, 1, 1, 1,
-1.053134, -1.502573, -4.388087, 1, 1, 1, 1, 1,
-1.034804, 0.8145668, -0.7053298, 1, 1, 1, 1, 1,
-1.03039, -0.4167432, -0.1244109, 1, 1, 1, 1, 1,
-1.019113, 0.01723069, 0.6063523, 1, 1, 1, 1, 1,
-1.013451, 1.10743, -0.2106763, 1, 1, 1, 1, 1,
-1.013331, -0.1072166, -2.812833, 1, 1, 1, 1, 1,
-1.013031, -1.685198, -4.078527, 1, 1, 1, 1, 1,
-1.011148, 1.744767, 0.899951, 1, 1, 1, 1, 1,
-1.005284, -1.053039, -1.031657, 1, 1, 1, 1, 1,
-0.9985075, 2.197379, 0.6090781, 1, 1, 1, 1, 1,
-0.9979997, 0.1225113, -2.13273, 0, 0, 1, 1, 1,
-0.9917307, -0.2321294, -1.989398, 1, 0, 0, 1, 1,
-0.9842924, -0.1857851, -2.74567, 1, 0, 0, 1, 1,
-0.9773891, -0.8384812, -1.549634, 1, 0, 0, 1, 1,
-0.9764458, -0.9139524, -2.384453, 1, 0, 0, 1, 1,
-0.9704448, -0.817924, -3.297342, 1, 0, 0, 1, 1,
-0.9701437, 0.225309, -1.308673, 0, 0, 0, 1, 1,
-0.9593335, -1.517621, -2.795935, 0, 0, 0, 1, 1,
-0.9592824, 0.4598522, -1.053881, 0, 0, 0, 1, 1,
-0.9580037, -0.4818361, -2.533062, 0, 0, 0, 1, 1,
-0.9563164, 0.5000477, -2.278882, 0, 0, 0, 1, 1,
-0.947688, 0.1413709, -2.831558, 0, 0, 0, 1, 1,
-0.9467587, 0.6251644, -0.7251567, 0, 0, 0, 1, 1,
-0.9440374, -0.7745387, -2.645254, 1, 1, 1, 1, 1,
-0.935953, 0.5555459, -0.5587613, 1, 1, 1, 1, 1,
-0.9344086, -1.300099, -3.653102, 1, 1, 1, 1, 1,
-0.9321471, 1.546056, 0.09386885, 1, 1, 1, 1, 1,
-0.9311167, -0.9869583, -2.056073, 1, 1, 1, 1, 1,
-0.9305254, 0.2124418, 0.1297884, 1, 1, 1, 1, 1,
-0.9256057, -0.0858914, -1.778951, 1, 1, 1, 1, 1,
-0.9200197, -0.2284673, -1.281913, 1, 1, 1, 1, 1,
-0.9124874, -0.04824948, 0.02768863, 1, 1, 1, 1, 1,
-0.9109852, -0.3302131, -3.422246, 1, 1, 1, 1, 1,
-0.9078111, 0.3735928, -2.76436, 1, 1, 1, 1, 1,
-0.9032057, 2.662325, -0.7667504, 1, 1, 1, 1, 1,
-0.90255, 0.231611, -1.655329, 1, 1, 1, 1, 1,
-0.8943813, 0.09906334, -2.19248, 1, 1, 1, 1, 1,
-0.8877335, 0.1564438, -2.024332, 1, 1, 1, 1, 1,
-0.8874491, -0.02239331, -2.277013, 0, 0, 1, 1, 1,
-0.8848636, -0.5138874, 0.4164298, 1, 0, 0, 1, 1,
-0.8824886, 0.5338622, -2.305231, 1, 0, 0, 1, 1,
-0.881411, -0.3380624, -1.344278, 1, 0, 0, 1, 1,
-0.8802793, 0.1744324, -1.854937, 1, 0, 0, 1, 1,
-0.8802455, 0.4142762, -1.671821, 1, 0, 0, 1, 1,
-0.8710074, 0.2033334, -1.009017, 0, 0, 0, 1, 1,
-0.8618313, 2.929187, 0.06847685, 0, 0, 0, 1, 1,
-0.8609794, 0.2824537, -1.512387, 0, 0, 0, 1, 1,
-0.8606343, 0.413247, -1.252538, 0, 0, 0, 1, 1,
-0.8539512, -0.1178238, -1.57258, 0, 0, 0, 1, 1,
-0.8511871, -0.2721818, -0.6353295, 0, 0, 0, 1, 1,
-0.848903, 0.5451696, -0.4332264, 0, 0, 0, 1, 1,
-0.8469641, 0.6250575, -1.919984, 1, 1, 1, 1, 1,
-0.8463441, -0.8678944, -1.782977, 1, 1, 1, 1, 1,
-0.8448821, 0.6898258, -1.961289, 1, 1, 1, 1, 1,
-0.8408126, 0.9368653, -1.026751, 1, 1, 1, 1, 1,
-0.8372729, -0.9428025, 0.396105, 1, 1, 1, 1, 1,
-0.8358408, 0.04185335, -1.814826, 1, 1, 1, 1, 1,
-0.8254034, 0.294461, -0.5781955, 1, 1, 1, 1, 1,
-0.8247277, 0.3748437, -2.738423, 1, 1, 1, 1, 1,
-0.8189976, -0.864081, -2.936669, 1, 1, 1, 1, 1,
-0.8140441, -0.01053636, -0.3609641, 1, 1, 1, 1, 1,
-0.8137571, 0.6384525, 0.0582264, 1, 1, 1, 1, 1,
-0.8104417, -1.297356, -1.207171, 1, 1, 1, 1, 1,
-0.8102244, 0.4597563, -0.2313101, 1, 1, 1, 1, 1,
-0.8032324, 0.6113638, -0.5431281, 1, 1, 1, 1, 1,
-0.8024031, 0.7928708, -1.118445, 1, 1, 1, 1, 1,
-0.8003803, -1.804919, -2.448798, 0, 0, 1, 1, 1,
-0.797444, 0.2649455, -2.578251, 1, 0, 0, 1, 1,
-0.7916285, -0.5597199, -2.766942, 1, 0, 0, 1, 1,
-0.7905245, 1.471085, -0.8682033, 1, 0, 0, 1, 1,
-0.7873272, -1.01255, -1.117469, 1, 0, 0, 1, 1,
-0.7868416, -0.01915781, -0.9596888, 1, 0, 0, 1, 1,
-0.7758532, 0.3943475, -1.029178, 0, 0, 0, 1, 1,
-0.7722546, 0.8976669, 0.1993765, 0, 0, 0, 1, 1,
-0.7712329, -0.7936415, -3.005265, 0, 0, 0, 1, 1,
-0.7699049, -0.007577518, -2.085106, 0, 0, 0, 1, 1,
-0.7573609, 1.415588, -1.346419, 0, 0, 0, 1, 1,
-0.7526113, 0.2542142, 0.1294791, 0, 0, 0, 1, 1,
-0.7512646, -1.37261, -3.081732, 0, 0, 0, 1, 1,
-0.7438735, -0.4951128, -2.021714, 1, 1, 1, 1, 1,
-0.739015, 0.1492103, -1.120757, 1, 1, 1, 1, 1,
-0.738171, -0.3607138, -2.102957, 1, 1, 1, 1, 1,
-0.7356021, 0.7461489, -1.177701, 1, 1, 1, 1, 1,
-0.7320367, 0.3862021, 0.467463, 1, 1, 1, 1, 1,
-0.7293688, -0.4540813, -1.057143, 1, 1, 1, 1, 1,
-0.7206589, -1.999707, -2.864056, 1, 1, 1, 1, 1,
-0.7191067, -2.294054, -5.095662, 1, 1, 1, 1, 1,
-0.7169538, -0.07844317, 1.743214, 1, 1, 1, 1, 1,
-0.7131148, -0.006126145, -1.677046, 1, 1, 1, 1, 1,
-0.7082309, -0.3124993, -1.968663, 1, 1, 1, 1, 1,
-0.706724, -0.2282012, -3.062072, 1, 1, 1, 1, 1,
-0.7048477, -0.8602634, -3.705764, 1, 1, 1, 1, 1,
-0.7048034, -0.2089793, -1.632673, 1, 1, 1, 1, 1,
-0.7040572, -0.1362854, -0.4715352, 1, 1, 1, 1, 1,
-0.6996027, 0.4507766, -4.086215, 0, 0, 1, 1, 1,
-0.6994652, 1.842671, -2.32605, 1, 0, 0, 1, 1,
-0.6968377, -0.01130825, -3.326819, 1, 0, 0, 1, 1,
-0.6957698, 0.1263154, -2.501697, 1, 0, 0, 1, 1,
-0.6917075, -0.5129293, -1.379104, 1, 0, 0, 1, 1,
-0.6885666, -1.468782, -1.15578, 1, 0, 0, 1, 1,
-0.682942, -0.4007639, -2.042693, 0, 0, 0, 1, 1,
-0.6829327, -0.6191375, -2.704188, 0, 0, 0, 1, 1,
-0.6715034, -0.8298675, -3.006171, 0, 0, 0, 1, 1,
-0.6714529, 2.032231, 0.6556638, 0, 0, 0, 1, 1,
-0.6710593, -0.9902243, -0.4365075, 0, 0, 0, 1, 1,
-0.666667, 1.24245, -1.284127, 0, 0, 0, 1, 1,
-0.6637984, 0.4991234, -0.7236017, 0, 0, 0, 1, 1,
-0.6578798, -0.1522004, -2.547505, 1, 1, 1, 1, 1,
-0.6571617, 1.413, 0.02775903, 1, 1, 1, 1, 1,
-0.6556616, -1.320398, -0.7446797, 1, 1, 1, 1, 1,
-0.6544409, 0.2337962, -0.9532054, 1, 1, 1, 1, 1,
-0.6523994, 0.1714981, 0.1818868, 1, 1, 1, 1, 1,
-0.6513179, -7.450764e-07, -2.714691, 1, 1, 1, 1, 1,
-0.6512706, -0.673681, -2.672982, 1, 1, 1, 1, 1,
-0.6486558, -1.71775, -3.46769, 1, 1, 1, 1, 1,
-0.6467245, 0.005063345, -2.071564, 1, 1, 1, 1, 1,
-0.6456192, -1.617627, -1.860734, 1, 1, 1, 1, 1,
-0.6435536, 2.481507, -0.6077963, 1, 1, 1, 1, 1,
-0.6349074, 0.999902, -1.675535, 1, 1, 1, 1, 1,
-0.6251667, 0.1877711, -0.2471099, 1, 1, 1, 1, 1,
-0.6239334, 0.8079526, -1.940036, 1, 1, 1, 1, 1,
-0.6232616, -1.350109, -2.955457, 1, 1, 1, 1, 1,
-0.6206623, -0.2959022, -0.7988361, 0, 0, 1, 1, 1,
-0.6205587, 1.046075, -0.01208894, 1, 0, 0, 1, 1,
-0.6177741, -1.246719, -3.041171, 1, 0, 0, 1, 1,
-0.6166872, -1.516923, -2.000652, 1, 0, 0, 1, 1,
-0.61658, 0.004754552, -3.45145, 1, 0, 0, 1, 1,
-0.6120894, 0.3369369, -1.281228, 1, 0, 0, 1, 1,
-0.6105486, -1.131466, -1.486259, 0, 0, 0, 1, 1,
-0.6085244, -0.2145199, -0.4851241, 0, 0, 0, 1, 1,
-0.6040767, -2.068522, -4.362364, 0, 0, 0, 1, 1,
-0.6030332, 0.5274495, -0.3912304, 0, 0, 0, 1, 1,
-0.5945767, 0.3274724, -0.6781133, 0, 0, 0, 1, 1,
-0.5911605, -0.7986637, -3.607093, 0, 0, 0, 1, 1,
-0.5893179, -1.290084, -3.81839, 0, 0, 0, 1, 1,
-0.5857878, 0.2729511, -0.7218206, 1, 1, 1, 1, 1,
-0.5848194, -0.647251, -1.470193, 1, 1, 1, 1, 1,
-0.5782981, 1.932323, -0.3473461, 1, 1, 1, 1, 1,
-0.5770018, 0.8847666, -1.456969, 1, 1, 1, 1, 1,
-0.5764006, 1.605102, -0.131642, 1, 1, 1, 1, 1,
-0.5714395, -0.7403416, -2.672274, 1, 1, 1, 1, 1,
-0.5686171, 0.1423201, -2.444191, 1, 1, 1, 1, 1,
-0.5675419, 0.2831572, -0.6316847, 1, 1, 1, 1, 1,
-0.5668581, -0.2821454, -3.482098, 1, 1, 1, 1, 1,
-0.5628066, -0.6044773, -1.016692, 1, 1, 1, 1, 1,
-0.5627164, 1.621506, -0.3391497, 1, 1, 1, 1, 1,
-0.5613155, -0.6107812, -3.836719, 1, 1, 1, 1, 1,
-0.5523992, 0.1695176, -0.1673892, 1, 1, 1, 1, 1,
-0.5454305, -1.22684, -3.067579, 1, 1, 1, 1, 1,
-0.5437965, -0.321632, -1.077355, 1, 1, 1, 1, 1,
-0.5371804, -0.1625736, -1.280796, 0, 0, 1, 1, 1,
-0.5339556, 1.07653, -0.4550787, 1, 0, 0, 1, 1,
-0.5326208, -0.2003638, -2.323222, 1, 0, 0, 1, 1,
-0.5197278, -0.3135884, -2.100189, 1, 0, 0, 1, 1,
-0.5195807, 1.341176, 0.212808, 1, 0, 0, 1, 1,
-0.5168629, -1.643142, -2.316809, 1, 0, 0, 1, 1,
-0.5162992, -1.809065, -4.1475, 0, 0, 0, 1, 1,
-0.511807, -1.017094, -2.41017, 0, 0, 0, 1, 1,
-0.510488, 1.967859, -0.5550482, 0, 0, 0, 1, 1,
-0.5004291, -1.549196, -3.28748, 0, 0, 0, 1, 1,
-0.496844, 0.1042448, -1.530392, 0, 0, 0, 1, 1,
-0.4918129, -0.05804398, -1.56655, 0, 0, 0, 1, 1,
-0.4898402, 0.151533, -0.1015989, 0, 0, 0, 1, 1,
-0.4865959, -0.2097914, -1.967988, 1, 1, 1, 1, 1,
-0.482114, 1.739354, -2.729506, 1, 1, 1, 1, 1,
-0.4792741, 0.5318944, -1.505839, 1, 1, 1, 1, 1,
-0.4735802, -2.225922, -1.959546, 1, 1, 1, 1, 1,
-0.4699746, 0.0266615, -2.203813, 1, 1, 1, 1, 1,
-0.4687041, 1.193087, -1.03266, 1, 1, 1, 1, 1,
-0.4538733, 0.1438828, -1.214437, 1, 1, 1, 1, 1,
-0.4531547, 0.6144603, 0.492892, 1, 1, 1, 1, 1,
-0.4479862, -0.6537482, -3.198949, 1, 1, 1, 1, 1,
-0.4464026, -0.4867006, -1.209769, 1, 1, 1, 1, 1,
-0.4434813, 0.09744649, -1.643702, 1, 1, 1, 1, 1,
-0.4416255, -0.004137955, -1.659032, 1, 1, 1, 1, 1,
-0.4416187, -1.687066, -3.093695, 1, 1, 1, 1, 1,
-0.4409414, -0.1475015, -1.074634, 1, 1, 1, 1, 1,
-0.4408055, -0.5459133, -2.285792, 1, 1, 1, 1, 1,
-0.4404148, -0.3616423, -3.976851, 0, 0, 1, 1, 1,
-0.4368443, 1.487896, -1.493791, 1, 0, 0, 1, 1,
-0.4316263, 0.05091723, -2.518966, 1, 0, 0, 1, 1,
-0.4286702, -0.269583, -2.533062, 1, 0, 0, 1, 1,
-0.426563, -0.357693, -3.609864, 1, 0, 0, 1, 1,
-0.4250423, 0.7797923, -2.171934, 1, 0, 0, 1, 1,
-0.4240994, -1.391689, -1.982056, 0, 0, 0, 1, 1,
-0.4227602, -0.05809148, -3.203676, 0, 0, 0, 1, 1,
-0.421725, 1.038103, -1.53894, 0, 0, 0, 1, 1,
-0.420867, -0.5388702, -1.833136, 0, 0, 0, 1, 1,
-0.4180514, -0.2446967, -1.782918, 0, 0, 0, 1, 1,
-0.415993, 0.7725141, 0.4357113, 0, 0, 0, 1, 1,
-0.4148758, 0.3226414, -0.5376272, 0, 0, 0, 1, 1,
-0.4127889, -0.09978034, -2.191002, 1, 1, 1, 1, 1,
-0.4092754, -0.6812061, -2.537956, 1, 1, 1, 1, 1,
-0.4048859, -0.1386732, -1.772822, 1, 1, 1, 1, 1,
-0.4039372, 0.8224729, -0.3154131, 1, 1, 1, 1, 1,
-0.403438, 0.4907546, -0.7850598, 1, 1, 1, 1, 1,
-0.3913137, -0.00719894, 1.663747, 1, 1, 1, 1, 1,
-0.3845553, -1.057767, -2.950032, 1, 1, 1, 1, 1,
-0.3842296, -0.6251563, -2.42822, 1, 1, 1, 1, 1,
-0.3839957, 0.04828276, 0.613839, 1, 1, 1, 1, 1,
-0.3821665, -0.2837844, -2.130086, 1, 1, 1, 1, 1,
-0.3790798, 0.1663159, -1.593737, 1, 1, 1, 1, 1,
-0.3770073, -1.964361, -2.898285, 1, 1, 1, 1, 1,
-0.371874, -2.374769, -4.238973, 1, 1, 1, 1, 1,
-0.3661503, -0.8722187, -2.399987, 1, 1, 1, 1, 1,
-0.3646659, 0.6211876, -0.5353578, 1, 1, 1, 1, 1,
-0.362091, -0.5418293, -3.506277, 0, 0, 1, 1, 1,
-0.356998, 1.723406, 0.08912777, 1, 0, 0, 1, 1,
-0.3569802, -1.050261, -3.382285, 1, 0, 0, 1, 1,
-0.3469766, 0.5603353, -0.7030783, 1, 0, 0, 1, 1,
-0.3460456, -0.9724619, -2.599295, 1, 0, 0, 1, 1,
-0.3421367, 0.5742403, -0.8211217, 1, 0, 0, 1, 1,
-0.3414188, 0.3022763, 0.1766852, 0, 0, 0, 1, 1,
-0.3408349, 0.296963, -0.04768262, 0, 0, 0, 1, 1,
-0.34041, 0.3846527, -1.729707, 0, 0, 0, 1, 1,
-0.3387886, 0.1155846, -2.278545, 0, 0, 0, 1, 1,
-0.3363506, -0.5876746, -3.465897, 0, 0, 0, 1, 1,
-0.3340731, -0.004348429, -0.1901606, 0, 0, 0, 1, 1,
-0.3331083, -0.07011142, -1.425758, 0, 0, 0, 1, 1,
-0.3286958, -0.9085546, -2.111844, 1, 1, 1, 1, 1,
-0.322736, 0.5657994, -0.7536275, 1, 1, 1, 1, 1,
-0.3198704, 0.7192289, 0.8810603, 1, 1, 1, 1, 1,
-0.3114012, 0.7852669, -0.318828, 1, 1, 1, 1, 1,
-0.3108258, 0.05205135, -2.03325, 1, 1, 1, 1, 1,
-0.3106018, 2.469693, -1.50229, 1, 1, 1, 1, 1,
-0.3081165, 0.2216987, -2.111363, 1, 1, 1, 1, 1,
-0.3060533, -2.108258, -2.876525, 1, 1, 1, 1, 1,
-0.29438, -0.9581869, -1.95578, 1, 1, 1, 1, 1,
-0.2888259, -0.949938, -3.532342, 1, 1, 1, 1, 1,
-0.2874782, -2.348731, -3.147469, 1, 1, 1, 1, 1,
-0.2788752, -0.6180227, -2.479371, 1, 1, 1, 1, 1,
-0.2767581, 0.6830017, 1.463071, 1, 1, 1, 1, 1,
-0.2742375, -0.7173273, -1.848639, 1, 1, 1, 1, 1,
-0.2719762, 0.3134426, -1.689367, 1, 1, 1, 1, 1,
-0.2693792, -1.106101, -3.68145, 0, 0, 1, 1, 1,
-0.2672413, -0.1317288, -2.989746, 1, 0, 0, 1, 1,
-0.2659105, 1.001549, -1.208447, 1, 0, 0, 1, 1,
-0.2657054, 1.637069, 0.6838607, 1, 0, 0, 1, 1,
-0.2630093, 0.4498923, 0.7208354, 1, 0, 0, 1, 1,
-0.262817, -0.8586844, -1.829013, 1, 0, 0, 1, 1,
-0.2599307, 0.2495425, 0.1013056, 0, 0, 0, 1, 1,
-0.2548023, 0.2441237, -1.393438, 0, 0, 0, 1, 1,
-0.2521364, -0.183139, -2.014177, 0, 0, 0, 1, 1,
-0.2498132, 0.2034098, -2.070759, 0, 0, 0, 1, 1,
-0.2489061, -0.5221733, -3.972561, 0, 0, 0, 1, 1,
-0.2441486, 1.364581, -0.9208468, 0, 0, 0, 1, 1,
-0.2381772, 1.53034, 0.957558, 0, 0, 0, 1, 1,
-0.2376401, -0.324871, -1.29742, 1, 1, 1, 1, 1,
-0.2373682, 0.7182588, 0.01927551, 1, 1, 1, 1, 1,
-0.2353481, 0.23411, 0.4503992, 1, 1, 1, 1, 1,
-0.2347486, -1.418102, -1.283592, 1, 1, 1, 1, 1,
-0.2284124, 0.00512792, -2.565443, 1, 1, 1, 1, 1,
-0.2250874, -1.977265, -1.561381, 1, 1, 1, 1, 1,
-0.215972, -0.1395379, -1.089437, 1, 1, 1, 1, 1,
-0.2159394, 0.417294, -1.375797, 1, 1, 1, 1, 1,
-0.2158066, 0.6092052, 1.145504, 1, 1, 1, 1, 1,
-0.2146894, 0.5984812, -1.340811, 1, 1, 1, 1, 1,
-0.2129105, -2.15098, -1.758803, 1, 1, 1, 1, 1,
-0.2097677, -0.8466639, -3.868722, 1, 1, 1, 1, 1,
-0.2093228, -1.224063, -4.390688, 1, 1, 1, 1, 1,
-0.2077817, -0.9729835, -4.491344, 1, 1, 1, 1, 1,
-0.2059721, 0.5008506, -1.407871, 1, 1, 1, 1, 1,
-0.2054891, 0.5820448, 0.592318, 0, 0, 1, 1, 1,
-0.2048996, 0.3190618, 0.7442295, 1, 0, 0, 1, 1,
-0.2024317, -0.9418609, -3.968968, 1, 0, 0, 1, 1,
-0.1981319, 1.70349, 0.08946428, 1, 0, 0, 1, 1,
-0.1848549, -1.098742, -2.848048, 1, 0, 0, 1, 1,
-0.1840866, -0.4751483, -3.158828, 1, 0, 0, 1, 1,
-0.1834518, -0.760599, -2.116456, 0, 0, 0, 1, 1,
-0.1785388, 0.2153556, 0.6769533, 0, 0, 0, 1, 1,
-0.1780753, 0.3104309, -2.062165, 0, 0, 0, 1, 1,
-0.1767518, -0.4437808, -4.782387, 0, 0, 0, 1, 1,
-0.174454, -0.3941868, -4.207183, 0, 0, 0, 1, 1,
-0.1676934, -0.3945169, -2.972095, 0, 0, 0, 1, 1,
-0.1673898, -0.3706242, -0.3753401, 0, 0, 0, 1, 1,
-0.1653495, 0.650411, -1.225111, 1, 1, 1, 1, 1,
-0.1621258, -0.6829575, -2.240919, 1, 1, 1, 1, 1,
-0.1591009, 0.1076159, 1.1945, 1, 1, 1, 1, 1,
-0.1542707, 0.5915048, -2.593584, 1, 1, 1, 1, 1,
-0.1534808, -0.6266723, -3.997232, 1, 1, 1, 1, 1,
-0.1525948, -0.3812685, -2.283187, 1, 1, 1, 1, 1,
-0.1518047, 1.678259, -1.162238, 1, 1, 1, 1, 1,
-0.141247, 0.5461279, -2.276507, 1, 1, 1, 1, 1,
-0.1406, -0.6429837, -2.631118, 1, 1, 1, 1, 1,
-0.1387131, 0.5190338, -1.557407, 1, 1, 1, 1, 1,
-0.1368735, -1.869561, -1.769901, 1, 1, 1, 1, 1,
-0.1319011, -1.096027, -4.239791, 1, 1, 1, 1, 1,
-0.1304744, 0.9805811, 0.7657488, 1, 1, 1, 1, 1,
-0.1286313, 0.890834, -0.3111287, 1, 1, 1, 1, 1,
-0.1253698, -0.005329479, -0.6418223, 1, 1, 1, 1, 1,
-0.1190919, -0.2033547, -2.052251, 0, 0, 1, 1, 1,
-0.1140411, 1.01677, -0.3364993, 1, 0, 0, 1, 1,
-0.1114393, -0.4893201, -3.599575, 1, 0, 0, 1, 1,
-0.1085774, -0.8534111, -4.376027, 1, 0, 0, 1, 1,
-0.1028896, -0.8257036, -2.466699, 1, 0, 0, 1, 1,
-0.1002701, 0.4780791, 0.1206622, 1, 0, 0, 1, 1,
-0.09781209, -1.292691, -2.404747, 0, 0, 0, 1, 1,
-0.09687557, -0.2922826, -1.938331, 0, 0, 0, 1, 1,
-0.08716066, 0.2576573, -0.1758471, 0, 0, 0, 1, 1,
-0.08637675, 0.2826872, -0.6942664, 0, 0, 0, 1, 1,
-0.08581995, -2.56303, -2.953896, 0, 0, 0, 1, 1,
-0.08441173, -0.2158049, -4.28973, 0, 0, 0, 1, 1,
-0.08062074, 0.5101161, -0.03543031, 0, 0, 0, 1, 1,
-0.07858465, 0.6368327, 0.1350807, 1, 1, 1, 1, 1,
-0.07687987, -0.6686918, -1.091403, 1, 1, 1, 1, 1,
-0.07259483, -0.5743348, -5.460928, 1, 1, 1, 1, 1,
-0.07216448, -1.479856, -3.064915, 1, 1, 1, 1, 1,
-0.06324331, -0.4857989, -4.549734, 1, 1, 1, 1, 1,
-0.06280878, 0.6317083, -1.494696, 1, 1, 1, 1, 1,
-0.06184391, 1.745941, -1.426863, 1, 1, 1, 1, 1,
-0.0578919, 1.462867, 0.255432, 1, 1, 1, 1, 1,
-0.05782885, 0.3894931, 1.215348, 1, 1, 1, 1, 1,
-0.05680523, 0.9842787, 0.664117, 1, 1, 1, 1, 1,
-0.05606453, -0.8178034, -4.652178, 1, 1, 1, 1, 1,
-0.05468037, -0.9402683, -4.484004, 1, 1, 1, 1, 1,
-0.04203704, -0.4388752, -2.321449, 1, 1, 1, 1, 1,
-0.03971842, 0.8102021, 2.174922, 1, 1, 1, 1, 1,
-0.03961037, 0.5455201, 0.8704681, 1, 1, 1, 1, 1,
-0.03875583, -0.5445807, -2.147207, 0, 0, 1, 1, 1,
-0.0357818, -1.12363, -0.6336943, 1, 0, 0, 1, 1,
-0.02738307, -0.3272372, -3.280236, 1, 0, 0, 1, 1,
-0.02370625, 0.8012787, -1.306904, 1, 0, 0, 1, 1,
-0.02094318, -1.083748, -2.803729, 1, 0, 0, 1, 1,
-0.01091627, 0.01117779, 0.5615038, 1, 0, 0, 1, 1,
-0.008925938, -0.6307875, -1.10183, 0, 0, 0, 1, 1,
-0.005140931, 0.1715728, 0.4666984, 0, 0, 0, 1, 1,
-0.004257957, -1.504469, -4.107079, 0, 0, 0, 1, 1,
-0.003206959, -0.6915519, -4.495924, 0, 0, 0, 1, 1,
-0.002821133, 1.840572, -0.7884082, 0, 0, 0, 1, 1,
-0.0009287786, -0.1232331, -3.245229, 0, 0, 0, 1, 1,
0.002043267, -1.362764, 2.731443, 0, 0, 0, 1, 1,
0.006834839, -2.061048, 4.823686, 1, 1, 1, 1, 1,
0.008161925, -1.908983, 2.917092, 1, 1, 1, 1, 1,
0.008327206, 0.3005067, -1.240977, 1, 1, 1, 1, 1,
0.01000438, -0.6032744, 2.614934, 1, 1, 1, 1, 1,
0.01143606, 0.5689249, 1.475284, 1, 1, 1, 1, 1,
0.01301079, 0.164518, -0.4470568, 1, 1, 1, 1, 1,
0.01353523, -0.4057091, 2.139606, 1, 1, 1, 1, 1,
0.01484775, 1.208612, 1.092721, 1, 1, 1, 1, 1,
0.01637194, -0.5136312, 4.460555, 1, 1, 1, 1, 1,
0.02091206, -2.464263, 3.164086, 1, 1, 1, 1, 1,
0.02550512, -0.2095368, 3.913915, 1, 1, 1, 1, 1,
0.03025275, 1.70069, 0.6624588, 1, 1, 1, 1, 1,
0.03043861, 0.4367802, 0.8772002, 1, 1, 1, 1, 1,
0.0322463, -0.4082281, 2.114024, 1, 1, 1, 1, 1,
0.03649487, 0.009102257, 1.865546, 1, 1, 1, 1, 1,
0.04120015, -0.4256448, 3.015533, 0, 0, 1, 1, 1,
0.04374656, 0.01016675, 2.518846, 1, 0, 0, 1, 1,
0.04474873, 0.5917978, 0.886175, 1, 0, 0, 1, 1,
0.04592891, -0.2165024, 4.555349, 1, 0, 0, 1, 1,
0.04619736, -0.6024705, 3.565411, 1, 0, 0, 1, 1,
0.04792099, -0.08059872, 2.534339, 1, 0, 0, 1, 1,
0.05015787, 2.436277, -1.213131, 0, 0, 0, 1, 1,
0.05500823, -1.058252, 3.393219, 0, 0, 0, 1, 1,
0.0552738, -1.478542, 2.612297, 0, 0, 0, 1, 1,
0.05595425, -0.4483531, 2.901224, 0, 0, 0, 1, 1,
0.05668775, -1.147906, 3.136695, 0, 0, 0, 1, 1,
0.05949115, -0.2393439, 3.048355, 0, 0, 0, 1, 1,
0.06560624, 1.544883, 0.6052355, 0, 0, 0, 1, 1,
0.06988304, 0.477462, 0.7800332, 1, 1, 1, 1, 1,
0.07515169, 0.04664641, -0.07008405, 1, 1, 1, 1, 1,
0.07866307, -0.213603, 4.85165, 1, 1, 1, 1, 1,
0.08154582, 0.9469988, 0.1719214, 1, 1, 1, 1, 1,
0.08422979, -1.405224, 5.253119, 1, 1, 1, 1, 1,
0.09140215, 0.8985937, 0.2585206, 1, 1, 1, 1, 1,
0.09412183, 0.8588272, 0.8489364, 1, 1, 1, 1, 1,
0.09723775, -0.4125443, 2.783162, 1, 1, 1, 1, 1,
0.1087573, 0.8891204, 0.1205283, 1, 1, 1, 1, 1,
0.1108075, -0.6505568, 4.348158, 1, 1, 1, 1, 1,
0.1217931, 0.9599847, 2.348481, 1, 1, 1, 1, 1,
0.1241616, 1.528809, -0.324581, 1, 1, 1, 1, 1,
0.1255062, -0.6351366, 2.70594, 1, 1, 1, 1, 1,
0.126895, 1.518909, 1.151392, 1, 1, 1, 1, 1,
0.1367233, -1.05398, 3.321427, 1, 1, 1, 1, 1,
0.1373413, -0.3462804, 3.128358, 0, 0, 1, 1, 1,
0.1378431, 0.6808438, -0.1881808, 1, 0, 0, 1, 1,
0.1396751, 0.2171631, 0.6664782, 1, 0, 0, 1, 1,
0.1401467, 0.5375359, 0.4971692, 1, 0, 0, 1, 1,
0.1401597, 0.8892548, -2.728984, 1, 0, 0, 1, 1,
0.1414947, 0.4651204, 2.953636, 1, 0, 0, 1, 1,
0.1486205, -1.605523, 1.851685, 0, 0, 0, 1, 1,
0.1503352, 0.5836929, 1.813797, 0, 0, 0, 1, 1,
0.154609, 0.6020709, 1.299919, 0, 0, 0, 1, 1,
0.1548347, 1.585016, -0.1838657, 0, 0, 0, 1, 1,
0.1580911, -0.1249298, 1.955881, 0, 0, 0, 1, 1,
0.1600979, 1.263804, -0.2473285, 0, 0, 0, 1, 1,
0.1605758, -0.244984, 1.746998, 0, 0, 0, 1, 1,
0.1629181, 1.467388, 0.03135001, 1, 1, 1, 1, 1,
0.1656653, 0.4823385, -1.225749, 1, 1, 1, 1, 1,
0.1668247, -0.5380257, 2.466717, 1, 1, 1, 1, 1,
0.1718489, -1.936392, 3.480827, 1, 1, 1, 1, 1,
0.1732351, -0.05625353, 1.56806, 1, 1, 1, 1, 1,
0.1750668, -1.209493, 3.737738, 1, 1, 1, 1, 1,
0.1762436, 1.480752, -1.764503, 1, 1, 1, 1, 1,
0.1789055, -0.7338833, 2.571162, 1, 1, 1, 1, 1,
0.1799163, -0.6469928, 3.276537, 1, 1, 1, 1, 1,
0.1817779, 0.9206429, 0.2929208, 1, 1, 1, 1, 1,
0.1818868, -0.8076637, 2.636405, 1, 1, 1, 1, 1,
0.1871416, -1.048689, 3.928901, 1, 1, 1, 1, 1,
0.188384, 0.4562025, -1.336551, 1, 1, 1, 1, 1,
0.1888733, 1.173559, -1.501805, 1, 1, 1, 1, 1,
0.1898944, 1.185863, -0.1428206, 1, 1, 1, 1, 1,
0.1952389, -0.5077896, 3.404616, 0, 0, 1, 1, 1,
0.1983973, -0.3465415, 2.158943, 1, 0, 0, 1, 1,
0.2029791, -0.308529, -0.2461523, 1, 0, 0, 1, 1,
0.2041158, -0.148427, 2.1459, 1, 0, 0, 1, 1,
0.209528, -1.617174, 3.567274, 1, 0, 0, 1, 1,
0.214562, -0.4445861, 3.255264, 1, 0, 0, 1, 1,
0.221512, -1.371419, 3.908161, 0, 0, 0, 1, 1,
0.2254927, -0.595302, 1.895378, 0, 0, 0, 1, 1,
0.2273168, -1.519191, 3.013192, 0, 0, 0, 1, 1,
0.2292197, 1.095987, 0.837107, 0, 0, 0, 1, 1,
0.2305372, 0.2222131, 0.8716452, 0, 0, 0, 1, 1,
0.2345269, -1.339536, 2.198509, 0, 0, 0, 1, 1,
0.2347755, 1.538032, -0.08397895, 0, 0, 0, 1, 1,
0.2350774, 0.7600661, -0.7157915, 1, 1, 1, 1, 1,
0.2352482, 0.282302, 0.5980597, 1, 1, 1, 1, 1,
0.238427, 0.4008859, 0.5246192, 1, 1, 1, 1, 1,
0.2457707, 2.298039, 1.158539, 1, 1, 1, 1, 1,
0.2470182, -0.7320046, 3.390866, 1, 1, 1, 1, 1,
0.2472281, -1.768908, 4.304695, 1, 1, 1, 1, 1,
0.2489731, 0.8186209, -0.7227995, 1, 1, 1, 1, 1,
0.2492792, -0.617891, 2.362826, 1, 1, 1, 1, 1,
0.2514678, 1.022788, -0.09189588, 1, 1, 1, 1, 1,
0.2527399, -0.008836293, 1.63375, 1, 1, 1, 1, 1,
0.2549268, 1.512701, 0.3004845, 1, 1, 1, 1, 1,
0.259093, -0.1339525, 1.25589, 1, 1, 1, 1, 1,
0.2626964, 0.9847472, 0.4556966, 1, 1, 1, 1, 1,
0.2652889, -1.796057, 2.180456, 1, 1, 1, 1, 1,
0.2666147, 0.777635, -0.04780312, 1, 1, 1, 1, 1,
0.2666647, 0.2944013, 0.7482324, 0, 0, 1, 1, 1,
0.2708939, 0.7634587, 0.4035316, 1, 0, 0, 1, 1,
0.2765415, -1.088858, 3.740472, 1, 0, 0, 1, 1,
0.2815156, -1.757179, 2.768963, 1, 0, 0, 1, 1,
0.2816919, 1.389271, 0.112837, 1, 0, 0, 1, 1,
0.2833252, -0.341878, 2.037942, 1, 0, 0, 1, 1,
0.2868277, -0.05571952, 1.496666, 0, 0, 0, 1, 1,
0.2876864, 0.7019871, 1.280893, 0, 0, 0, 1, 1,
0.2886581, 0.4317535, 1.531381, 0, 0, 0, 1, 1,
0.2893276, -0.5435117, 1.599959, 0, 0, 0, 1, 1,
0.2897361, 1.118462, 1.190423, 0, 0, 0, 1, 1,
0.2929956, -1.706735, 2.147653, 0, 0, 0, 1, 1,
0.2933425, 0.3670698, 0.2789948, 0, 0, 0, 1, 1,
0.2935689, 0.9977578, 0.04031365, 1, 1, 1, 1, 1,
0.2956684, 0.0663465, 2.378544, 1, 1, 1, 1, 1,
0.2967891, -0.7514737, 2.83887, 1, 1, 1, 1, 1,
0.2987708, -0.7340251, 3.166903, 1, 1, 1, 1, 1,
0.3035246, -0.6521791, 1.194377, 1, 1, 1, 1, 1,
0.3040195, -1.445216, 3.036824, 1, 1, 1, 1, 1,
0.3047652, 0.6177126, -1.788096, 1, 1, 1, 1, 1,
0.3069218, 1.298541, 0.2017001, 1, 1, 1, 1, 1,
0.3116472, 1.044878, 2.008447, 1, 1, 1, 1, 1,
0.316648, 1.95435, 0.0041599, 1, 1, 1, 1, 1,
0.3187507, 1.102101, 0.6743219, 1, 1, 1, 1, 1,
0.3189637, -0.6858477, 4.426308, 1, 1, 1, 1, 1,
0.3189952, -0.2684056, 2.472544, 1, 1, 1, 1, 1,
0.3216807, 0.4560203, 0.5520097, 1, 1, 1, 1, 1,
0.322906, 0.5339262, 0.5557908, 1, 1, 1, 1, 1,
0.3258199, -0.0784521, 1.26978, 0, 0, 1, 1, 1,
0.329256, 1.011743, 0.2510824, 1, 0, 0, 1, 1,
0.3303794, -1.220614, 3.427562, 1, 0, 0, 1, 1,
0.3334338, -0.8467327, 2.55025, 1, 0, 0, 1, 1,
0.3342688, 1.032878, 0.8055435, 1, 0, 0, 1, 1,
0.3403576, 0.7368914, 1.067119, 1, 0, 0, 1, 1,
0.3405668, 0.5684303, 0.9119567, 0, 0, 0, 1, 1,
0.3507809, -0.3432903, 1.759868, 0, 0, 0, 1, 1,
0.353427, 0.9765497, 2.499137, 0, 0, 0, 1, 1,
0.3589119, 1.985891, 0.2601356, 0, 0, 0, 1, 1,
0.3609721, 2.64082, -1.203743e-06, 0, 0, 0, 1, 1,
0.3619101, -0.09714645, 1.930061, 0, 0, 0, 1, 1,
0.3620272, 0.05360902, 2.213846, 0, 0, 0, 1, 1,
0.3720372, -0.9287359, 1.25704, 1, 1, 1, 1, 1,
0.3765074, -0.6389424, 2.124828, 1, 1, 1, 1, 1,
0.3799812, -0.1792493, 4.005273, 1, 1, 1, 1, 1,
0.3805108, -0.1843682, 0.1122925, 1, 1, 1, 1, 1,
0.3831507, -0.09833457, 1.964413, 1, 1, 1, 1, 1,
0.3860373, 0.6313846, 0.2395221, 1, 1, 1, 1, 1,
0.3866247, 1.842221, 0.3377635, 1, 1, 1, 1, 1,
0.3866554, -0.1040154, 2.056276, 1, 1, 1, 1, 1,
0.3922603, 0.617309, 0.127711, 1, 1, 1, 1, 1,
0.3932259, -0.01606019, 2.147414, 1, 1, 1, 1, 1,
0.3934693, 1.091666, 0.01771523, 1, 1, 1, 1, 1,
0.4017213, 0.1750569, 0.2057114, 1, 1, 1, 1, 1,
0.4070526, -3.763314, 2.795552, 1, 1, 1, 1, 1,
0.4104404, 0.9699703, 0.3237799, 1, 1, 1, 1, 1,
0.4108351, 1.372744, 1.060773, 1, 1, 1, 1, 1,
0.4153424, 1.970194, 1.587723, 0, 0, 1, 1, 1,
0.4181207, 0.3974918, 1.662559, 1, 0, 0, 1, 1,
0.4215841, 0.1443332, 1.753993, 1, 0, 0, 1, 1,
0.4234026, -0.6616327, 2.239073, 1, 0, 0, 1, 1,
0.430122, -0.786907, 2.75955, 1, 0, 0, 1, 1,
0.4308864, -0.1546142, 1.010716, 1, 0, 0, 1, 1,
0.431247, 1.275685, -0.6440376, 0, 0, 0, 1, 1,
0.4341123, -0.8355298, 0.634308, 0, 0, 0, 1, 1,
0.4355385, -0.4893244, 1.770153, 0, 0, 0, 1, 1,
0.4364321, -1.198234, 2.9901, 0, 0, 0, 1, 1,
0.4373787, -0.05593715, 3.240526, 0, 0, 0, 1, 1,
0.4441274, 0.2651184, -0.7502247, 0, 0, 0, 1, 1,
0.4485647, 0.1841959, 1.480245, 0, 0, 0, 1, 1,
0.453266, -1.78331, 2.227397, 1, 1, 1, 1, 1,
0.4633045, 1.196534, -0.3161319, 1, 1, 1, 1, 1,
0.4656889, 0.6334792, 1.494685, 1, 1, 1, 1, 1,
0.4686651, 0.6688322, 0.2254063, 1, 1, 1, 1, 1,
0.4702944, 0.4918526, -0.5071505, 1, 1, 1, 1, 1,
0.470991, -1.198065, 3.637997, 1, 1, 1, 1, 1,
0.4734335, -0.09544612, 0.9482052, 1, 1, 1, 1, 1,
0.4748716, 0.3286082, 1.127802, 1, 1, 1, 1, 1,
0.4761708, 0.2913945, 2.148475, 1, 1, 1, 1, 1,
0.4773559, 0.6527877, -0.3731521, 1, 1, 1, 1, 1,
0.4785228, -0.5198513, 4.158849, 1, 1, 1, 1, 1,
0.481496, -1.553858, 3.296452, 1, 1, 1, 1, 1,
0.4847269, -0.3720999, 2.064868, 1, 1, 1, 1, 1,
0.4900702, -1.232473, 0.9011132, 1, 1, 1, 1, 1,
0.491428, 2.086854, -0.09496739, 1, 1, 1, 1, 1,
0.4930143, -0.3359518, 1.163406, 0, 0, 1, 1, 1,
0.4957007, 0.4678558, 0.3369338, 1, 0, 0, 1, 1,
0.499404, -0.05108989, 0.1922928, 1, 0, 0, 1, 1,
0.5000099, 1.328942, 1.412488, 1, 0, 0, 1, 1,
0.502627, -0.3334047, 2.874921, 1, 0, 0, 1, 1,
0.5057278, -1.001447, 3.807146, 1, 0, 0, 1, 1,
0.5105132, -0.3157376, 2.114118, 0, 0, 0, 1, 1,
0.5107918, 0.2282728, 1.412553, 0, 0, 0, 1, 1,
0.5139968, -0.4330393, 4.463835, 0, 0, 0, 1, 1,
0.517255, 0.805032, 1.575368, 0, 0, 0, 1, 1,
0.5194452, -0.419017, 3.015518, 0, 0, 0, 1, 1,
0.5198602, -2.13408, 2.939884, 0, 0, 0, 1, 1,
0.5271738, 1.816046, -0.0798957, 0, 0, 0, 1, 1,
0.5294287, -0.5882804, 0.7051358, 1, 1, 1, 1, 1,
0.5327635, -0.2761363, 0.2978667, 1, 1, 1, 1, 1,
0.5331789, -0.5512725, 1.739804, 1, 1, 1, 1, 1,
0.5343096, -0.6382729, 1.370697, 1, 1, 1, 1, 1,
0.5347252, 0.2926285, 2.579, 1, 1, 1, 1, 1,
0.5359215, 0.3957488, 0.5826687, 1, 1, 1, 1, 1,
0.5372633, -0.2765467, 2.704739, 1, 1, 1, 1, 1,
0.5441666, -0.875683, 1.018573, 1, 1, 1, 1, 1,
0.5494195, 1.311752, 1.046783, 1, 1, 1, 1, 1,
0.555299, -0.8661532, 3.078613, 1, 1, 1, 1, 1,
0.5561399, 0.4926695, 1.673962, 1, 1, 1, 1, 1,
0.5567028, 0.1978693, 0.8593546, 1, 1, 1, 1, 1,
0.5574237, -1.291102, 2.205658, 1, 1, 1, 1, 1,
0.5583434, -0.2804635, 0.122414, 1, 1, 1, 1, 1,
0.559182, 0.2892433, 1.122105, 1, 1, 1, 1, 1,
0.5621893, 2.003016, -1.130496, 0, 0, 1, 1, 1,
0.5652947, -0.4802881, 0.6261985, 1, 0, 0, 1, 1,
0.5662931, 0.2000255, -0.009414917, 1, 0, 0, 1, 1,
0.5664247, 1.115251, 0.6068318, 1, 0, 0, 1, 1,
0.5703735, -2.137986, 2.834299, 1, 0, 0, 1, 1,
0.574237, 0.5352985, 0.7508304, 1, 0, 0, 1, 1,
0.5759412, -0.8649695, 2.569445, 0, 0, 0, 1, 1,
0.5760616, 0.8645529, 1.310077, 0, 0, 0, 1, 1,
0.5805452, -0.4041329, 1.0272, 0, 0, 0, 1, 1,
0.5822443, 0.595991, -0.2786641, 0, 0, 0, 1, 1,
0.5857341, 1.356552, 0.3018094, 0, 0, 0, 1, 1,
0.5867919, 0.1654048, 2.345173, 0, 0, 0, 1, 1,
0.5868728, 0.7538772, 0.7898303, 0, 0, 0, 1, 1,
0.5885099, -0.3213981, 1.776349, 1, 1, 1, 1, 1,
0.5906229, -1.190559, 2.970412, 1, 1, 1, 1, 1,
0.5939887, -2.235077, 3.169975, 1, 1, 1, 1, 1,
0.5988907, 1.36564, 2.284973, 1, 1, 1, 1, 1,
0.605177, -0.8703397, 2.9074, 1, 1, 1, 1, 1,
0.6076553, -2.030705, 1.808385, 1, 1, 1, 1, 1,
0.6086855, -1.041311, 3.096408, 1, 1, 1, 1, 1,
0.6109258, 0.1135368, 3.25017, 1, 1, 1, 1, 1,
0.6120701, -1.817121, 2.074927, 1, 1, 1, 1, 1,
0.6123174, 0.3915471, 1.02058, 1, 1, 1, 1, 1,
0.6149753, 0.23345, 0.4489339, 1, 1, 1, 1, 1,
0.6156292, -0.2623906, 3.427958, 1, 1, 1, 1, 1,
0.6160168, -1.36225, 2.350283, 1, 1, 1, 1, 1,
0.6182066, -0.4909559, 3.187505, 1, 1, 1, 1, 1,
0.6219975, -1.04653, 3.667533, 1, 1, 1, 1, 1,
0.6221467, 0.9551172, 2.319368, 0, 0, 1, 1, 1,
0.6224084, -2.395883, 3.804524, 1, 0, 0, 1, 1,
0.6255718, -1.022707, 1.606057, 1, 0, 0, 1, 1,
0.6270037, 0.1449613, 1.654235, 1, 0, 0, 1, 1,
0.6347736, 1.670886, 0.680724, 1, 0, 0, 1, 1,
0.6378716, -0.2164638, 2.195282, 1, 0, 0, 1, 1,
0.6411812, 0.1494705, 2.38276, 0, 0, 0, 1, 1,
0.6440402, 1.315308, 1.069555, 0, 0, 0, 1, 1,
0.6482723, 1.231889, 1.053704, 0, 0, 0, 1, 1,
0.6495199, 0.3935082, -0.1125826, 0, 0, 0, 1, 1,
0.6497517, 0.3369678, 2.220032, 0, 0, 0, 1, 1,
0.6508338, 0.3362746, 0.9645401, 0, 0, 0, 1, 1,
0.6565974, 0.8346673, 1.522938, 0, 0, 0, 1, 1,
0.6623713, 0.7460243, -0.7789648, 1, 1, 1, 1, 1,
0.6643294, 0.4604279, 2.142937, 1, 1, 1, 1, 1,
0.6648626, -1.281739, 0.6972716, 1, 1, 1, 1, 1,
0.6676168, -0.6388068, 3.493817, 1, 1, 1, 1, 1,
0.6710431, 1.23997, 0.9960176, 1, 1, 1, 1, 1,
0.6803469, 0.7212893, 2.490259, 1, 1, 1, 1, 1,
0.6814566, -0.793093, 2.498739, 1, 1, 1, 1, 1,
0.6820554, -1.418572, 3.211843, 1, 1, 1, 1, 1,
0.6834257, -0.9226862, 3.43629, 1, 1, 1, 1, 1,
0.6837419, 0.1755538, 1.052843, 1, 1, 1, 1, 1,
0.6851332, -1.557598, 4.200899, 1, 1, 1, 1, 1,
0.6909169, -2.043029, 2.356022, 1, 1, 1, 1, 1,
0.6937505, -0.1409495, 3.281316, 1, 1, 1, 1, 1,
0.7155483, -0.02388008, 1.091839, 1, 1, 1, 1, 1,
0.7157102, -0.2958865, 2.582671, 1, 1, 1, 1, 1,
0.7228948, -2.050745, 2.537928, 0, 0, 1, 1, 1,
0.7236937, -2.005109, 1.175013, 1, 0, 0, 1, 1,
0.7249647, -0.9121377, 2.14359, 1, 0, 0, 1, 1,
0.7266197, 0.9746408, 1.394622, 1, 0, 0, 1, 1,
0.7377178, 1.473327, 0.9404067, 1, 0, 0, 1, 1,
0.7418497, 0.870877, 0.9039061, 1, 0, 0, 1, 1,
0.7421942, -1.354025, 1.584348, 0, 0, 0, 1, 1,
0.7441875, -1.568677, 2.09717, 0, 0, 0, 1, 1,
0.7457085, -0.112081, 1.816387, 0, 0, 0, 1, 1,
0.7482798, -1.720951, 3.426538, 0, 0, 0, 1, 1,
0.7497081, 0.03982347, -0.2343847, 0, 0, 0, 1, 1,
0.7499837, 2.298359, 0.9247205, 0, 0, 0, 1, 1,
0.7501451, 1.20516, 1.829832, 0, 0, 0, 1, 1,
0.7525489, -0.5366501, 1.511862, 1, 1, 1, 1, 1,
0.753877, 0.9692678, 0.3870358, 1, 1, 1, 1, 1,
0.7565839, -0.2851527, 0.7512554, 1, 1, 1, 1, 1,
0.7594189, -0.8953767, 3.94107, 1, 1, 1, 1, 1,
0.7610213, -0.7943886, 1.261358, 1, 1, 1, 1, 1,
0.7693896, 0.1164774, 1.562597, 1, 1, 1, 1, 1,
0.7770911, -1.394812, 1.036864, 1, 1, 1, 1, 1,
0.7816457, 1.955307, -1.562665, 1, 1, 1, 1, 1,
0.7823086, -0.4507494, 0.4968074, 1, 1, 1, 1, 1,
0.7873217, -2.364127, 3.476673, 1, 1, 1, 1, 1,
0.7915096, -0.9064803, 3.903761, 1, 1, 1, 1, 1,
0.7956837, -2.054221, 3.837771, 1, 1, 1, 1, 1,
0.795792, 1.304513, -0.1903224, 1, 1, 1, 1, 1,
0.804146, 0.231276, 2.777843, 1, 1, 1, 1, 1,
0.8062903, -0.8652402, 2.596503, 1, 1, 1, 1, 1,
0.8067172, 0.9290154, 0.6603207, 0, 0, 1, 1, 1,
0.8139719, -0.4765737, 3.200799, 1, 0, 0, 1, 1,
0.8165858, -0.2114156, 3.372329, 1, 0, 0, 1, 1,
0.8181909, 0.7179472, 2.291687, 1, 0, 0, 1, 1,
0.8192707, -0.5294268, 0.05472963, 1, 0, 0, 1, 1,
0.8208858, 0.8198754, 0.5702518, 1, 0, 0, 1, 1,
0.8226019, 1.193309, -0.5532876, 0, 0, 0, 1, 1,
0.8299882, 0.6475937, 0.9785987, 0, 0, 0, 1, 1,
0.8323694, 0.302583, 2.896567, 0, 0, 0, 1, 1,
0.8400692, -0.5274952, 3.601726, 0, 0, 0, 1, 1,
0.8411839, -0.4775146, 1.484075, 0, 0, 0, 1, 1,
0.8413504, -1.630091, 3.858475, 0, 0, 0, 1, 1,
0.8418717, -1.240715, 2.415889, 0, 0, 0, 1, 1,
0.8447477, 0.1496712, 1.400518, 1, 1, 1, 1, 1,
0.8487847, -1.205783, 1.644925, 1, 1, 1, 1, 1,
0.8489237, 0.7215187, 0.544024, 1, 1, 1, 1, 1,
0.8636152, -0.03930727, 0.1620242, 1, 1, 1, 1, 1,
0.8641322, 0.509272, 0.4260148, 1, 1, 1, 1, 1,
0.8658236, 0.232088, -1.029531, 1, 1, 1, 1, 1,
0.8706046, -1.237143, 1.339316, 1, 1, 1, 1, 1,
0.8758416, 1.220516, 1.488784, 1, 1, 1, 1, 1,
0.8820381, 1.188629, 0.0682852, 1, 1, 1, 1, 1,
0.8828837, 2.054541, 0.8608617, 1, 1, 1, 1, 1,
0.8878871, 1.126151, 1.050361, 1, 1, 1, 1, 1,
0.8900532, 0.2850986, 1.441375, 1, 1, 1, 1, 1,
0.8909498, -1.244182, 2.983954, 1, 1, 1, 1, 1,
0.8915121, 1.260424, 1.556589, 1, 1, 1, 1, 1,
0.8921823, 0.3502964, 2.325686, 1, 1, 1, 1, 1,
0.8975922, -0.103203, 1.655125, 0, 0, 1, 1, 1,
0.9048539, -0.6308122, 2.566221, 1, 0, 0, 1, 1,
0.9086152, 0.3927383, 1.804001, 1, 0, 0, 1, 1,
0.9114043, -0.4042647, 1.78504, 1, 0, 0, 1, 1,
0.9115891, 0.6198265, 1.769536, 1, 0, 0, 1, 1,
0.9234916, 0.01568457, 0.7091521, 1, 0, 0, 1, 1,
0.9294181, 0.206153, 2.90325, 0, 0, 0, 1, 1,
0.9499953, -1.58537, 1.003252, 0, 0, 0, 1, 1,
0.9738955, -2.301822, 4.592394, 0, 0, 0, 1, 1,
0.9799146, -1.897453, 0.388282, 0, 0, 0, 1, 1,
0.98057, -0.1007328, 1.631259, 0, 0, 0, 1, 1,
0.9832847, -1.091374, 2.798327, 0, 0, 0, 1, 1,
0.9866515, 0.6835688, 0.8199602, 0, 0, 0, 1, 1,
0.987025, 0.775652, -1.376824, 1, 1, 1, 1, 1,
0.9874514, 2.530272, 1.190143, 1, 1, 1, 1, 1,
0.9889489, -0.3230985, 2.416402, 1, 1, 1, 1, 1,
0.9931366, -1.16236, 1.754253, 1, 1, 1, 1, 1,
0.9945424, 0.5718271, 2.152179, 1, 1, 1, 1, 1,
0.9988016, 0.9081033, -0.5443188, 1, 1, 1, 1, 1,
1.000583, -0.1164657, 0.8785626, 1, 1, 1, 1, 1,
1.007109, 0.4930161, 0.9954864, 1, 1, 1, 1, 1,
1.008548, 0.05167064, 2.338281, 1, 1, 1, 1, 1,
1.010901, -1.1467, 4.602994, 1, 1, 1, 1, 1,
1.011665, 0.2797322, 1.632995, 1, 1, 1, 1, 1,
1.014218, -1.507065, 2.351199, 1, 1, 1, 1, 1,
1.014831, 0.03789477, 1.439698, 1, 1, 1, 1, 1,
1.025231, 0.1668738, 1.138593, 1, 1, 1, 1, 1,
1.031316, -0.5245245, 0.4372725, 1, 1, 1, 1, 1,
1.032956, -0.8151049, 4.226238, 0, 0, 1, 1, 1,
1.035574, -0.6120269, 1.255123, 1, 0, 0, 1, 1,
1.035904, -0.05207784, 0.8757731, 1, 0, 0, 1, 1,
1.038842, -0.2070305, 2.713306, 1, 0, 0, 1, 1,
1.041738, 0.6145599, 0.9456422, 1, 0, 0, 1, 1,
1.042816, -0.2403253, 3.175355, 1, 0, 0, 1, 1,
1.051136, -0.3509416, 3.457025, 0, 0, 0, 1, 1,
1.059381, -0.07055475, 3.048696, 0, 0, 0, 1, 1,
1.06693, -0.4345792, 1.237612, 0, 0, 0, 1, 1,
1.071075, -0.2614878, 2.306157, 0, 0, 0, 1, 1,
1.077833, -0.3504648, 2.349353, 0, 0, 0, 1, 1,
1.086536, 2.724719, 1.462408, 0, 0, 0, 1, 1,
1.090785, -1.283778, 3.168406, 0, 0, 0, 1, 1,
1.095089, -0.3490876, 0.0207847, 1, 1, 1, 1, 1,
1.105755, 1.20165, 0.3712467, 1, 1, 1, 1, 1,
1.111748, -1.180473, 2.946205, 1, 1, 1, 1, 1,
1.116063, 1.436663, 2.197813, 1, 1, 1, 1, 1,
1.116064, 0.4399292, 2.34387, 1, 1, 1, 1, 1,
1.121754, 0.2742802, 1.975248, 1, 1, 1, 1, 1,
1.125732, -0.8880946, 1.298434, 1, 1, 1, 1, 1,
1.12591, 0.3780441, 1.251771, 1, 1, 1, 1, 1,
1.12908, 0.9187158, 1.646132, 1, 1, 1, 1, 1,
1.1296, 0.3665399, 2.668388, 1, 1, 1, 1, 1,
1.142089, 2.217676, 1.036535, 1, 1, 1, 1, 1,
1.142624, -0.4272589, 2.016326, 1, 1, 1, 1, 1,
1.142679, 0.9860281, 1.995442, 1, 1, 1, 1, 1,
1.143187, 0.08091726, 3.279345, 1, 1, 1, 1, 1,
1.143849, -0.8795025, 3.008337, 1, 1, 1, 1, 1,
1.146055, -0.997477, 1.365188, 0, 0, 1, 1, 1,
1.148845, -1.197642, 2.400178, 1, 0, 0, 1, 1,
1.14902, 0.4444683, 0.8825446, 1, 0, 0, 1, 1,
1.152236, 0.5424153, 0.295092, 1, 0, 0, 1, 1,
1.153779, 0.6322789, 3.739742, 1, 0, 0, 1, 1,
1.156928, -0.394215, 2.836698, 1, 0, 0, 1, 1,
1.15795, 0.8824928, 0.2987215, 0, 0, 0, 1, 1,
1.162563, 1.205249, 0.8694747, 0, 0, 0, 1, 1,
1.173005, -0.328873, 1.273931, 0, 0, 0, 1, 1,
1.176011, -1.087042, 2.711895, 0, 0, 0, 1, 1,
1.213087, 0.4069596, 0.733214, 0, 0, 0, 1, 1,
1.214163, 0.7605323, -0.2492205, 0, 0, 0, 1, 1,
1.214563, -1.354646, 3.333138, 0, 0, 0, 1, 1,
1.216066, -1.373346, 1.854789, 1, 1, 1, 1, 1,
1.220136, -1.302252, 4.678805, 1, 1, 1, 1, 1,
1.220602, 0.9354235, 2.221012, 1, 1, 1, 1, 1,
1.231199, 0.8649204, -1.317901, 1, 1, 1, 1, 1,
1.23371, 0.3997235, -0.1509498, 1, 1, 1, 1, 1,
1.237651, 0.07974194, 0.3069879, 1, 1, 1, 1, 1,
1.243605, 1.491598, 0.8330066, 1, 1, 1, 1, 1,
1.248367, 1.549853, -0.02392178, 1, 1, 1, 1, 1,
1.250458, -0.6061507, 1.872518, 1, 1, 1, 1, 1,
1.251084, 0.6745669, 2.368442, 1, 1, 1, 1, 1,
1.256284, -0.07836763, 0.8170628, 1, 1, 1, 1, 1,
1.259957, -1.409923, 2.310311, 1, 1, 1, 1, 1,
1.261557, 1.288619, 0.8794357, 1, 1, 1, 1, 1,
1.268351, 1.142124, -0.09956785, 1, 1, 1, 1, 1,
1.27436, 0.6325366, 1.055408, 1, 1, 1, 1, 1,
1.275028, -0.5582436, 2.434031, 0, 0, 1, 1, 1,
1.28796, -0.5180665, 2.390258, 1, 0, 0, 1, 1,
1.292877, 0.7639237, 2.146549, 1, 0, 0, 1, 1,
1.295533, -0.3982902, 1.937963, 1, 0, 0, 1, 1,
1.296782, -0.1651971, 1.42418, 1, 0, 0, 1, 1,
1.300594, 0.2092708, 2.605977, 1, 0, 0, 1, 1,
1.316612, -0.489169, 1.039166, 0, 0, 0, 1, 1,
1.318948, 0.356189, 1.32253, 0, 0, 0, 1, 1,
1.32886, 0.337723, -0.2818305, 0, 0, 0, 1, 1,
1.33325, -0.02084969, 0.8378872, 0, 0, 0, 1, 1,
1.34358, 1.018693, 0.5681272, 0, 0, 0, 1, 1,
1.353659, -1.464154, 1.576306, 0, 0, 0, 1, 1,
1.356908, -0.511074, -0.5110697, 0, 0, 0, 1, 1,
1.364219, 0.2867378, 4.09936, 1, 1, 1, 1, 1,
1.377553, -0.2201544, 1.570006, 1, 1, 1, 1, 1,
1.38538, -0.7897644, 4.010862, 1, 1, 1, 1, 1,
1.386768, -0.1773849, 2.229532, 1, 1, 1, 1, 1,
1.386929, -0.3661532, 2.949586, 1, 1, 1, 1, 1,
1.38802, 0.5946044, 0.9071, 1, 1, 1, 1, 1,
1.3976, 0.09862805, 1.018611, 1, 1, 1, 1, 1,
1.413118, -0.3227906, 2.243806, 1, 1, 1, 1, 1,
1.413191, 0.233992, 2.701655, 1, 1, 1, 1, 1,
1.415316, 0.8269145, 0.3082868, 1, 1, 1, 1, 1,
1.419635, 2.436405, 1.94935, 1, 1, 1, 1, 1,
1.434245, 0.4543075, 2.189519, 1, 1, 1, 1, 1,
1.437951, -0.4325904, 1.976318, 1, 1, 1, 1, 1,
1.44262, -0.5672968, 0.5853779, 1, 1, 1, 1, 1,
1.447955, 1.132495, -0.6307353, 1, 1, 1, 1, 1,
1.460617, 0.8812215, -0.8099663, 0, 0, 1, 1, 1,
1.465723, 0.4041003, 1.97577, 1, 0, 0, 1, 1,
1.468524, 0.8355024, 1.404144, 1, 0, 0, 1, 1,
1.484458, 0.2913628, 0.8443287, 1, 0, 0, 1, 1,
1.490423, -0.6410267, 2.901706, 1, 0, 0, 1, 1,
1.493505, -1.4942, 1.951828, 1, 0, 0, 1, 1,
1.493849, -0.8314435, 2.529593, 0, 0, 0, 1, 1,
1.504564, -0.4481028, 1.337351, 0, 0, 0, 1, 1,
1.519568, -1.394714, 2.614258, 0, 0, 0, 1, 1,
1.52315, 0.1442992, 0.6391625, 0, 0, 0, 1, 1,
1.524243, 0.02206257, 1.492877, 0, 0, 0, 1, 1,
1.525348, -0.8318874, 2.671061, 0, 0, 0, 1, 1,
1.538825, -0.2761675, 1.556101, 0, 0, 0, 1, 1,
1.547014, -1.015484, 2.540034, 1, 1, 1, 1, 1,
1.563126, -0.002450584, 1.615491, 1, 1, 1, 1, 1,
1.59077, 0.0681678, 0.4649792, 1, 1, 1, 1, 1,
1.617611, 0.4500172, 2.056019, 1, 1, 1, 1, 1,
1.625036, 0.8033606, 2.825597, 1, 1, 1, 1, 1,
1.636133, 0.1642285, 1.845055, 1, 1, 1, 1, 1,
1.649871, -0.8478628, 1.220676, 1, 1, 1, 1, 1,
1.655146, -0.1832305, 1.084551, 1, 1, 1, 1, 1,
1.665568, 1.07334, 1.461073, 1, 1, 1, 1, 1,
1.670749, 0.6485631, 1.425547, 1, 1, 1, 1, 1,
1.677788, 0.467696, 1.195939, 1, 1, 1, 1, 1,
1.686446, -0.2481797, 1.62017, 1, 1, 1, 1, 1,
1.719488, 0.5878176, -0.3481938, 1, 1, 1, 1, 1,
1.74429, 0.6287984, 0.5929068, 1, 1, 1, 1, 1,
1.747213, 0.7516077, 1.457473, 1, 1, 1, 1, 1,
1.763413, -0.182194, 3.434437, 0, 0, 1, 1, 1,
1.766092, 2.783172, 3.271547, 1, 0, 0, 1, 1,
1.784137, 0.4918703, 0.8789854, 1, 0, 0, 1, 1,
1.786311, -0.2032986, 2.540148, 1, 0, 0, 1, 1,
1.791272, 0.9810907, -0.1260422, 1, 0, 0, 1, 1,
1.795704, 0.1151601, 1.551131, 1, 0, 0, 1, 1,
1.801412, -0.3898754, 1.736979, 0, 0, 0, 1, 1,
1.808237, -0.2220869, 0.8685977, 0, 0, 0, 1, 1,
1.823209, 0.06241365, 0.5413809, 0, 0, 0, 1, 1,
1.829856, -1.121916, 2.390086, 0, 0, 0, 1, 1,
1.83653, 0.08490014, 2.122302, 0, 0, 0, 1, 1,
1.83737, -1.171157, 2.631535, 0, 0, 0, 1, 1,
1.845729, -0.5564649, 0.6968423, 0, 0, 0, 1, 1,
1.857451, -0.5420008, 4.024719, 1, 1, 1, 1, 1,
1.861837, 0.5461975, 2.335567, 1, 1, 1, 1, 1,
1.877656, -0.2032399, 0.6568012, 1, 1, 1, 1, 1,
1.878105, 2.805118, 2.057144, 1, 1, 1, 1, 1,
1.889145, 0.01143468, 1.915413, 1, 1, 1, 1, 1,
1.889421, 1.079092, 2.138209, 1, 1, 1, 1, 1,
1.89379, -2.028353, 2.101496, 1, 1, 1, 1, 1,
1.918877, 0.9668005, 1.024511, 1, 1, 1, 1, 1,
1.928605, -0.06499349, 0.06100916, 1, 1, 1, 1, 1,
1.931344, 0.9648815, 1.535103, 1, 1, 1, 1, 1,
1.944781, 1.488268, 0.7768857, 1, 1, 1, 1, 1,
1.9609, 0.1195922, -0.392437, 1, 1, 1, 1, 1,
1.972334, 0.3477455, 1.021408, 1, 1, 1, 1, 1,
1.97747, 0.03208765, 0.7366549, 1, 1, 1, 1, 1,
1.998479, -1.290779, 1.646929, 1, 1, 1, 1, 1,
2.000584, 1.592763, -0.3022554, 0, 0, 1, 1, 1,
2.000712, -0.2532327, 0.8514795, 1, 0, 0, 1, 1,
2.052575, -0.2130464, -1.177309, 1, 0, 0, 1, 1,
2.087257, 1.337309, 1.918064, 1, 0, 0, 1, 1,
2.157105, -0.8030999, 2.684449, 1, 0, 0, 1, 1,
2.165813, -1.092166, 1.381434, 1, 0, 0, 1, 1,
2.225013, 0.9296443, 1.321398, 0, 0, 0, 1, 1,
2.231483, -0.5977238, 1.703042, 0, 0, 0, 1, 1,
2.246173, -0.06484025, 1.415379, 0, 0, 0, 1, 1,
2.269373, 1.666834, 2.147279, 0, 0, 0, 1, 1,
2.271125, 1.138947, 0.2777173, 0, 0, 0, 1, 1,
2.330041, 1.026135, 2.294305, 0, 0, 0, 1, 1,
2.33032, 0.3315578, 0.3962931, 0, 0, 0, 1, 1,
2.35844, 0.1977778, 1.843859, 1, 1, 1, 1, 1,
2.398762, -0.01981779, 3.013634, 1, 1, 1, 1, 1,
2.427256, 1.300533, 2.557696, 1, 1, 1, 1, 1,
2.465084, 0.4446805, 1.022914, 1, 1, 1, 1, 1,
2.533728, -0.06927107, 0.7453766, 1, 1, 1, 1, 1,
2.668692, -0.3336577, 2.655063, 1, 1, 1, 1, 1,
2.669595, 1.889856, 0.8267522, 1, 1, 1, 1, 1
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
var radius = 9.715046;
var distance = 34.12369;
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
mvMatrix.translate( 0.6540271, 0.416327, 0.1039047 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.12369);
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