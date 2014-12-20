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
-2.819072, -1.503943, -2.150437, 1, 0, 0, 1,
-2.501825, 2.024769, -1.532331, 1, 0.007843138, 0, 1,
-2.48003, -0.5674583, -0.7447475, 1, 0.01176471, 0, 1,
-2.31426, -0.8138161, -1.69208, 1, 0.01960784, 0, 1,
-2.312422, 2.15333, -0.7275758, 1, 0.02352941, 0, 1,
-2.284038, 1.317823, -1.38719, 1, 0.03137255, 0, 1,
-2.261451, 0.5643724, -1.377524, 1, 0.03529412, 0, 1,
-2.250706, 2.438953, 1.265218, 1, 0.04313726, 0, 1,
-2.234354, -1.290574, -2.705958, 1, 0.04705882, 0, 1,
-2.233141, 1.158689, -1.102287, 1, 0.05490196, 0, 1,
-2.214908, 0.2988901, -1.944728, 1, 0.05882353, 0, 1,
-2.173274, -0.7027441, -1.928233, 1, 0.06666667, 0, 1,
-2.042084, -1.006785, -2.007465, 1, 0.07058824, 0, 1,
-2.014067, 0.09077115, -1.347182, 1, 0.07843138, 0, 1,
-2.00615, -1.22497, -1.936246, 1, 0.08235294, 0, 1,
-1.973886, 0.4662387, -1.974525, 1, 0.09019608, 0, 1,
-1.972899, 0.5224202, -0.3313864, 1, 0.09411765, 0, 1,
-1.960784, -1.471793, -2.22969, 1, 0.1019608, 0, 1,
-1.92559, 0.3718733, -0.8074067, 1, 0.1098039, 0, 1,
-1.877403, 1.164427, -1.313666, 1, 0.1137255, 0, 1,
-1.855765, 1.436832, -1.148466, 1, 0.1215686, 0, 1,
-1.852624, 0.8019527, -0.7514377, 1, 0.1254902, 0, 1,
-1.852548, 1.917216, 1.715846, 1, 0.1333333, 0, 1,
-1.837702, 0.5064938, -0.6379498, 1, 0.1372549, 0, 1,
-1.836638, 0.3775114, -0.04552219, 1, 0.145098, 0, 1,
-1.807944, 0.1646039, -1.413655, 1, 0.1490196, 0, 1,
-1.795381, -0.288197, 0.4284529, 1, 0.1568628, 0, 1,
-1.784851, -1.339672, -2.002143, 1, 0.1607843, 0, 1,
-1.783691, 0.4648194, -2.246213, 1, 0.1686275, 0, 1,
-1.781967, -0.3767305, -1.690853, 1, 0.172549, 0, 1,
-1.774488, 1.590103, -1.061972, 1, 0.1803922, 0, 1,
-1.76443, -1.169715, -2.764411, 1, 0.1843137, 0, 1,
-1.732665, 0.4062917, -2.259491, 1, 0.1921569, 0, 1,
-1.729669, -0.4128796, -2.427586, 1, 0.1960784, 0, 1,
-1.702981, -1.125791, -3.327606, 1, 0.2039216, 0, 1,
-1.702461, -1.875351, -3.16417, 1, 0.2117647, 0, 1,
-1.67029, -0.3417198, -1.176603, 1, 0.2156863, 0, 1,
-1.648616, -1.141873, -1.319538, 1, 0.2235294, 0, 1,
-1.640262, -0.242425, -2.659856, 1, 0.227451, 0, 1,
-1.614654, -1.060684, -1.894492, 1, 0.2352941, 0, 1,
-1.613529, 0.1224458, -0.5717865, 1, 0.2392157, 0, 1,
-1.605273, 0.7803132, -0.8732322, 1, 0.2470588, 0, 1,
-1.597628, 0.2757768, -0.697907, 1, 0.2509804, 0, 1,
-1.587, -0.5924808, 0.754129, 1, 0.2588235, 0, 1,
-1.571555, -1.432968, -2.617578, 1, 0.2627451, 0, 1,
-1.56942, 0.5950042, -1.9272, 1, 0.2705882, 0, 1,
-1.547325, -0.05988465, -2.331536, 1, 0.2745098, 0, 1,
-1.546059, -1.360237, -0.0371889, 1, 0.282353, 0, 1,
-1.541726, -0.3741415, -2.530155, 1, 0.2862745, 0, 1,
-1.536886, -0.8081763, -3.215874, 1, 0.2941177, 0, 1,
-1.529259, -0.1837969, -2.053687, 1, 0.3019608, 0, 1,
-1.516281, -0.3449164, -1.373357, 1, 0.3058824, 0, 1,
-1.509342, -1.777886, -3.067095, 1, 0.3137255, 0, 1,
-1.503808, 2.535616, 0.3155107, 1, 0.3176471, 0, 1,
-1.501714, -0.4851138, -1.671711, 1, 0.3254902, 0, 1,
-1.500762, -2.626303, -2.502882, 1, 0.3294118, 0, 1,
-1.49611, -0.3399587, -2.044442, 1, 0.3372549, 0, 1,
-1.489231, 0.2218756, -2.561883, 1, 0.3411765, 0, 1,
-1.485183, 0.8991253, -0.03128487, 1, 0.3490196, 0, 1,
-1.467958, -0.7505411, -0.7676806, 1, 0.3529412, 0, 1,
-1.466298, -1.554539, -2.949689, 1, 0.3607843, 0, 1,
-1.462991, 0.5425128, -1.858253, 1, 0.3647059, 0, 1,
-1.453818, 0.9617805, -1.423497, 1, 0.372549, 0, 1,
-1.452989, 0.9305159, 0.6215385, 1, 0.3764706, 0, 1,
-1.447673, 1.607039, -2.371624, 1, 0.3843137, 0, 1,
-1.434414, 1.221915, -1.115021, 1, 0.3882353, 0, 1,
-1.425536, -0.259461, -1.276767, 1, 0.3960784, 0, 1,
-1.393869, -2.545164, -1.766751, 1, 0.4039216, 0, 1,
-1.393536, 0.5500011, -0.7942669, 1, 0.4078431, 0, 1,
-1.3902, -0.3823365, -2.261717, 1, 0.4156863, 0, 1,
-1.377914, -1.110847, -1.935948, 1, 0.4196078, 0, 1,
-1.366744, 0.1469361, -1.929883, 1, 0.427451, 0, 1,
-1.359977, 0.0623596, -0.9208789, 1, 0.4313726, 0, 1,
-1.344399, -0.2089282, -2.262305, 1, 0.4392157, 0, 1,
-1.343947, -2.040807, -2.163574, 1, 0.4431373, 0, 1,
-1.330618, -0.03932561, -2.468109, 1, 0.4509804, 0, 1,
-1.327436, -0.6267609, -1.873021, 1, 0.454902, 0, 1,
-1.325092, -1.858757, -2.025661, 1, 0.4627451, 0, 1,
-1.314174, 0.4660059, -1.238824, 1, 0.4666667, 0, 1,
-1.290281, 0.9165111, -1.3669, 1, 0.4745098, 0, 1,
-1.287065, 0.7338158, -2.468791, 1, 0.4784314, 0, 1,
-1.27318, 1.868171, -0.3804078, 1, 0.4862745, 0, 1,
-1.272208, 0.4050356, -1.00384, 1, 0.4901961, 0, 1,
-1.269947, 0.1439819, -2.636778, 1, 0.4980392, 0, 1,
-1.267582, 0.001451646, -2.66513, 1, 0.5058824, 0, 1,
-1.263806, -0.6568241, -1.304552, 1, 0.509804, 0, 1,
-1.263304, -1.044208, -1.416931, 1, 0.5176471, 0, 1,
-1.262148, 3.439142, 0.4995329, 1, 0.5215687, 0, 1,
-1.26178, 1.053308, -0.7882088, 1, 0.5294118, 0, 1,
-1.254979, 2.34967, -0.8563356, 1, 0.5333334, 0, 1,
-1.253018, 0.2382268, -0.2434109, 1, 0.5411765, 0, 1,
-1.250124, -1.149518, -3.319448, 1, 0.5450981, 0, 1,
-1.249581, -0.3349069, -3.303717, 1, 0.5529412, 0, 1,
-1.245148, -1.037336, -1.860139, 1, 0.5568628, 0, 1,
-1.238989, 0.04026309, -2.913399, 1, 0.5647059, 0, 1,
-1.233208, 1.46646, -0.4883604, 1, 0.5686275, 0, 1,
-1.22645, 0.3064179, -3.370209, 1, 0.5764706, 0, 1,
-1.226019, -0.4811743, -2.553651, 1, 0.5803922, 0, 1,
-1.216904, -0.4479555, -2.578941, 1, 0.5882353, 0, 1,
-1.216096, -0.4890021, -0.2409473, 1, 0.5921569, 0, 1,
-1.208034, -0.7455765, -1.805091, 1, 0.6, 0, 1,
-1.207412, -0.3511259, -2.104119, 1, 0.6078432, 0, 1,
-1.202182, 0.4052044, -0.7422795, 1, 0.6117647, 0, 1,
-1.201005, -1.114965, -2.067514, 1, 0.6196079, 0, 1,
-1.18213, 0.4342118, -0.7858605, 1, 0.6235294, 0, 1,
-1.177854, -0.01600764, -2.365687, 1, 0.6313726, 0, 1,
-1.170942, -0.2665953, -3.035562, 1, 0.6352941, 0, 1,
-1.168223, 0.2966638, -1.718734, 1, 0.6431373, 0, 1,
-1.167437, -0.9389895, -2.902811, 1, 0.6470588, 0, 1,
-1.166178, -1.639399, -1.941734, 1, 0.654902, 0, 1,
-1.165562, 0.3191233, -2.15917, 1, 0.6588235, 0, 1,
-1.163197, 1.834364, 0.374394, 1, 0.6666667, 0, 1,
-1.163026, -0.3489421, -3.184139, 1, 0.6705883, 0, 1,
-1.160745, -0.4881262, -0.6146922, 1, 0.6784314, 0, 1,
-1.159181, 0.8804753, -3.112071, 1, 0.682353, 0, 1,
-1.158525, 0.0005426104, -1.148333, 1, 0.6901961, 0, 1,
-1.155006, -0.2833735, -1.017227, 1, 0.6941177, 0, 1,
-1.15455, -0.4806066, -0.7249628, 1, 0.7019608, 0, 1,
-1.150677, 1.037057, -1.315448, 1, 0.7098039, 0, 1,
-1.149943, 0.4182864, -1.384451, 1, 0.7137255, 0, 1,
-1.149246, 0.1135832, -1.154732, 1, 0.7215686, 0, 1,
-1.146425, -0.07234515, -2.864567, 1, 0.7254902, 0, 1,
-1.145008, 0.2779717, -3.059438, 1, 0.7333333, 0, 1,
-1.137323, -1.508504, -2.575137, 1, 0.7372549, 0, 1,
-1.135185, -0.3009236, -2.005068, 1, 0.7450981, 0, 1,
-1.133883, 0.9385381, 1.734753, 1, 0.7490196, 0, 1,
-1.112563, 2.034112, -0.09507284, 1, 0.7568628, 0, 1,
-1.110332, -0.04874839, -1.1538, 1, 0.7607843, 0, 1,
-1.108312, 1.097775, -0.01519318, 1, 0.7686275, 0, 1,
-1.096712, 0.8967717, 0.1058561, 1, 0.772549, 0, 1,
-1.08521, -2.101503, -2.211119, 1, 0.7803922, 0, 1,
-1.082226, 0.8901614, -1.122625, 1, 0.7843137, 0, 1,
-1.074411, -1.659557, -2.100936, 1, 0.7921569, 0, 1,
-1.072876, 0.4051219, -2.114155, 1, 0.7960784, 0, 1,
-1.065857, 0.7143648, -1.057544, 1, 0.8039216, 0, 1,
-1.063964, 0.358531, -1.335788, 1, 0.8117647, 0, 1,
-1.045398, -1.128709, -2.909143, 1, 0.8156863, 0, 1,
-1.044877, 0.5022863, -0.6790578, 1, 0.8235294, 0, 1,
-1.043653, -1.109881, -3.425534, 1, 0.827451, 0, 1,
-1.038148, 0.2533967, -2.565116, 1, 0.8352941, 0, 1,
-1.034895, -1.259989, -2.137757, 1, 0.8392157, 0, 1,
-1.033997, 0.4969365, -1.429711, 1, 0.8470588, 0, 1,
-1.027643, -1.487186, -3.377789, 1, 0.8509804, 0, 1,
-1.026286, 0.6589625, -0.9861514, 1, 0.8588235, 0, 1,
-1.022424, -2.592283, -2.638488, 1, 0.8627451, 0, 1,
-1.020508, 2.295824, 0.01913631, 1, 0.8705882, 0, 1,
-1.019074, 0.7229957, -2.269672, 1, 0.8745098, 0, 1,
-1.018231, -0.376743, -4.573457, 1, 0.8823529, 0, 1,
-1.00703, -0.8735301, -2.78328, 1, 0.8862745, 0, 1,
-1.005947, -0.6796661, -2.254623, 1, 0.8941177, 0, 1,
-1.005716, -0.6842296, -2.609582, 1, 0.8980392, 0, 1,
-1.003149, 0.9733367, -0.4817031, 1, 0.9058824, 0, 1,
-1.000267, -0.8632882, -0.3343068, 1, 0.9137255, 0, 1,
-0.9976613, 0.2053586, -0.8586582, 1, 0.9176471, 0, 1,
-0.9967666, 1.132067, -1.818155, 1, 0.9254902, 0, 1,
-0.993576, 0.02424152, -1.996953, 1, 0.9294118, 0, 1,
-0.992425, 0.1300897, -0.8992596, 1, 0.9372549, 0, 1,
-0.9916391, -1.371135, -2.939497, 1, 0.9411765, 0, 1,
-0.9908658, 0.4444922, -0.5397757, 1, 0.9490196, 0, 1,
-0.9849237, 0.710943, 0.427332, 1, 0.9529412, 0, 1,
-0.9818863, 1.209518, -1.69632, 1, 0.9607843, 0, 1,
-0.9726706, -1.519796, -2.443008, 1, 0.9647059, 0, 1,
-0.9704672, 0.7362903, -1.941376, 1, 0.972549, 0, 1,
-0.9686392, -0.1282071, -1.313753, 1, 0.9764706, 0, 1,
-0.9662762, 1.827368, -2.350958, 1, 0.9843137, 0, 1,
-0.9608306, 0.06602813, -1.497638, 1, 0.9882353, 0, 1,
-0.9596131, -2.193041, -3.369837, 1, 0.9960784, 0, 1,
-0.9579269, 0.7495766, 0.6407847, 0.9960784, 1, 0, 1,
-0.9570609, 1.343793, 0.1726452, 0.9921569, 1, 0, 1,
-0.9532303, 0.281408, -1.949143, 0.9843137, 1, 0, 1,
-0.9520487, 0.9372588, 0.5124934, 0.9803922, 1, 0, 1,
-0.9438481, -0.4925573, -3.419571, 0.972549, 1, 0, 1,
-0.9423214, 0.4435914, -0.9424384, 0.9686275, 1, 0, 1,
-0.9401489, 1.423198, 0.7762706, 0.9607843, 1, 0, 1,
-0.9345353, 0.4073439, -1.240965, 0.9568627, 1, 0, 1,
-0.9313337, 0.5569283, -0.6695864, 0.9490196, 1, 0, 1,
-0.9270814, 0.1891297, 0.1130279, 0.945098, 1, 0, 1,
-0.9265248, 0.6556129, -1.182968, 0.9372549, 1, 0, 1,
-0.9250959, 0.0007907925, -0.1253704, 0.9333333, 1, 0, 1,
-0.9169284, 1.216996, -1.242031, 0.9254902, 1, 0, 1,
-0.9152192, 1.235515, -1.003802, 0.9215686, 1, 0, 1,
-0.9056773, -0.999315, -3.862796, 0.9137255, 1, 0, 1,
-0.9045248, -1.906274, -1.245296, 0.9098039, 1, 0, 1,
-0.8984472, -0.6603987, -1.955138, 0.9019608, 1, 0, 1,
-0.8885259, 0.8497981, -0.3593516, 0.8941177, 1, 0, 1,
-0.8879347, 0.4817597, -2.004828, 0.8901961, 1, 0, 1,
-0.8871019, 0.5517831, -3.078416, 0.8823529, 1, 0, 1,
-0.8868308, 1.159317, -1.580205, 0.8784314, 1, 0, 1,
-0.8775051, -0.08734124, -2.186612, 0.8705882, 1, 0, 1,
-0.8764826, -0.951495, -1.842247, 0.8666667, 1, 0, 1,
-0.8721492, -0.6529152, -1.168104, 0.8588235, 1, 0, 1,
-0.8582178, -0.07879764, -2.695717, 0.854902, 1, 0, 1,
-0.8544915, -0.2871505, -3.433162, 0.8470588, 1, 0, 1,
-0.8542086, -2.063804, -3.416858, 0.8431373, 1, 0, 1,
-0.8518062, -0.8191396, -1.936198, 0.8352941, 1, 0, 1,
-0.8433836, -0.6025483, -0.4988107, 0.8313726, 1, 0, 1,
-0.841194, 0.6855415, -0.8456791, 0.8235294, 1, 0, 1,
-0.8397278, -1.289329, -3.552682, 0.8196079, 1, 0, 1,
-0.8360124, 0.5323949, -1.582533, 0.8117647, 1, 0, 1,
-0.8309833, 0.6034051, -1.837646, 0.8078431, 1, 0, 1,
-0.8298229, 0.01136304, -1.733002, 0.8, 1, 0, 1,
-0.8259343, -0.1213686, -1.963968, 0.7921569, 1, 0, 1,
-0.8255008, 0.7063377, -0.4495669, 0.7882353, 1, 0, 1,
-0.8254631, -1.560772, -2.444004, 0.7803922, 1, 0, 1,
-0.8246651, -1.175979, -1.965253, 0.7764706, 1, 0, 1,
-0.8212272, 0.1984904, 0.3724335, 0.7686275, 1, 0, 1,
-0.8182925, -0.3647584, -0.8987388, 0.7647059, 1, 0, 1,
-0.8152733, 1.090214, -1.28092, 0.7568628, 1, 0, 1,
-0.8088398, 0.4941351, 0.5868264, 0.7529412, 1, 0, 1,
-0.8039963, -0.6689849, -1.73815, 0.7450981, 1, 0, 1,
-0.8013699, 0.4285278, -1.20967, 0.7411765, 1, 0, 1,
-0.7969757, -1.401487, -3.041217, 0.7333333, 1, 0, 1,
-0.7966259, 0.1135045, -1.213631, 0.7294118, 1, 0, 1,
-0.7950826, -0.7871439, -2.762175, 0.7215686, 1, 0, 1,
-0.7936579, -0.5174327, -1.985873, 0.7176471, 1, 0, 1,
-0.7907699, 0.2778569, 0.08023591, 0.7098039, 1, 0, 1,
-0.7899816, -1.025544, -3.033791, 0.7058824, 1, 0, 1,
-0.7899727, -0.07935803, -0.2593386, 0.6980392, 1, 0, 1,
-0.7890721, 1.393371, -0.9688671, 0.6901961, 1, 0, 1,
-0.7886328, -1.831506, -3.820162, 0.6862745, 1, 0, 1,
-0.7867771, 0.9330319, -0.4428406, 0.6784314, 1, 0, 1,
-0.7863786, -0.904682, -2.015819, 0.6745098, 1, 0, 1,
-0.7757332, -1.539443, -1.652696, 0.6666667, 1, 0, 1,
-0.7753415, 2.479318, -2.078523, 0.6627451, 1, 0, 1,
-0.7739538, 1.1729, 0.250348, 0.654902, 1, 0, 1,
-0.768137, -0.3553749, -1.431883, 0.6509804, 1, 0, 1,
-0.7570868, 1.323362, -0.6699854, 0.6431373, 1, 0, 1,
-0.7511823, 0.9417517, -0.01911417, 0.6392157, 1, 0, 1,
-0.7511479, 3.091882, 1.219607, 0.6313726, 1, 0, 1,
-0.743423, 0.4316947, -2.795413, 0.627451, 1, 0, 1,
-0.7422699, 0.9132736, 1.153036, 0.6196079, 1, 0, 1,
-0.7412091, -0.8292266, -3.702034, 0.6156863, 1, 0, 1,
-0.7388801, -0.2212535, -0.427366, 0.6078432, 1, 0, 1,
-0.7378998, -0.2278774, -1.298644, 0.6039216, 1, 0, 1,
-0.7377627, -0.5067274, -2.880264, 0.5960785, 1, 0, 1,
-0.735367, -0.1222868, -3.147489, 0.5882353, 1, 0, 1,
-0.7331599, -0.2507332, -1.252416, 0.5843138, 1, 0, 1,
-0.7276857, -0.3342106, -1.753822, 0.5764706, 1, 0, 1,
-0.7183937, 0.9547608, 0.7311421, 0.572549, 1, 0, 1,
-0.716146, -1.129766, -2.400201, 0.5647059, 1, 0, 1,
-0.7132583, 0.2100107, -0.07883962, 0.5607843, 1, 0, 1,
-0.7075742, 0.9772382, -0.9555764, 0.5529412, 1, 0, 1,
-0.7033341, -0.296412, -2.446987, 0.5490196, 1, 0, 1,
-0.703045, -0.06063597, -0.9901724, 0.5411765, 1, 0, 1,
-0.6996397, 1.26267, -1.574653, 0.5372549, 1, 0, 1,
-0.6947685, 0.6063117, -0.851478, 0.5294118, 1, 0, 1,
-0.6933132, 0.08323378, -1.962692, 0.5254902, 1, 0, 1,
-0.6922783, 0.9463598, -0.6426664, 0.5176471, 1, 0, 1,
-0.6839605, 0.7258741, -0.6343428, 0.5137255, 1, 0, 1,
-0.6834538, -1.625668, -3.957392, 0.5058824, 1, 0, 1,
-0.6674392, 0.9993202, -1.426908, 0.5019608, 1, 0, 1,
-0.6634583, -0.7904087, -2.456569, 0.4941176, 1, 0, 1,
-0.6608861, 0.08298288, -0.6476282, 0.4862745, 1, 0, 1,
-0.659743, -0.8152274, -3.931151, 0.4823529, 1, 0, 1,
-0.6589422, -0.1704387, -3.356212, 0.4745098, 1, 0, 1,
-0.6568878, 0.4149054, -1.126224, 0.4705882, 1, 0, 1,
-0.6526614, -0.8408393, -2.787601, 0.4627451, 1, 0, 1,
-0.6512629, 1.81901, -1.336799, 0.4588235, 1, 0, 1,
-0.6475942, 0.005125129, -1.310349, 0.4509804, 1, 0, 1,
-0.6447755, 1.412328, 0.1471265, 0.4470588, 1, 0, 1,
-0.6434006, -1.437132, -2.056005, 0.4392157, 1, 0, 1,
-0.6412372, 0.3357282, -0.243007, 0.4352941, 1, 0, 1,
-0.6341851, -0.3729838, -5.207168, 0.427451, 1, 0, 1,
-0.6332244, -0.3085136, -1.866297, 0.4235294, 1, 0, 1,
-0.6283097, -0.4821233, -1.93588, 0.4156863, 1, 0, 1,
-0.6257591, -0.053047, -3.215463, 0.4117647, 1, 0, 1,
-0.6245349, -0.7171074, -1.587004, 0.4039216, 1, 0, 1,
-0.6197127, 0.2353463, -0.8721505, 0.3960784, 1, 0, 1,
-0.6195257, -1.131789, -0.9202954, 0.3921569, 1, 0, 1,
-0.6071498, -0.5159588, -2.404516, 0.3843137, 1, 0, 1,
-0.6039195, 0.1245509, -1.626923, 0.3803922, 1, 0, 1,
-0.6031623, -0.7117435, -2.775386, 0.372549, 1, 0, 1,
-0.5999004, 0.2105443, -0.5506305, 0.3686275, 1, 0, 1,
-0.5908495, 0.5810983, -0.9492274, 0.3607843, 1, 0, 1,
-0.5889721, -1.031851, -4.016119, 0.3568628, 1, 0, 1,
-0.5882043, 1.245997, -2.071448, 0.3490196, 1, 0, 1,
-0.5874245, -0.2080331, -2.609146, 0.345098, 1, 0, 1,
-0.5819027, -0.8007068, -2.752461, 0.3372549, 1, 0, 1,
-0.5805216, -0.4836678, -3.474607, 0.3333333, 1, 0, 1,
-0.5788214, -0.4823139, -1.579868, 0.3254902, 1, 0, 1,
-0.5778343, 0.5754508, -0.2342882, 0.3215686, 1, 0, 1,
-0.5761002, 1.936286, -0.1222935, 0.3137255, 1, 0, 1,
-0.5754134, -0.865025, -1.603415, 0.3098039, 1, 0, 1,
-0.5679873, 1.115143, -0.9677436, 0.3019608, 1, 0, 1,
-0.5662041, 1.299188, 0.002144222, 0.2941177, 1, 0, 1,
-0.5656655, -2.483783, -3.101007, 0.2901961, 1, 0, 1,
-0.5632551, -0.9844553, -2.959544, 0.282353, 1, 0, 1,
-0.5613254, -0.8173755, -1.5058, 0.2784314, 1, 0, 1,
-0.5583163, -1.385791, -2.87273, 0.2705882, 1, 0, 1,
-0.5525683, -0.8517994, -3.602879, 0.2666667, 1, 0, 1,
-0.5517651, -2.066806, -4.382091, 0.2588235, 1, 0, 1,
-0.5467605, 0.7949386, 0.6876424, 0.254902, 1, 0, 1,
-0.5447314, 0.4061907, -1.644264, 0.2470588, 1, 0, 1,
-0.5432853, 2.019366, 1.024228, 0.2431373, 1, 0, 1,
-0.5336665, -0.4881891, -3.677778, 0.2352941, 1, 0, 1,
-0.5261207, -0.04306275, -1.707818, 0.2313726, 1, 0, 1,
-0.5260336, 1.026904, 1.122219, 0.2235294, 1, 0, 1,
-0.5247881, -1.195911, -0.9942358, 0.2196078, 1, 0, 1,
-0.5242871, -0.5957453, -4.245807, 0.2117647, 1, 0, 1,
-0.5236984, 0.5633669, -1.188231, 0.2078431, 1, 0, 1,
-0.5233493, 0.7035995, -0.8049387, 0.2, 1, 0, 1,
-0.5204736, 0.6200232, -0.9957265, 0.1921569, 1, 0, 1,
-0.5199658, -2.249317, -4.347188, 0.1882353, 1, 0, 1,
-0.5185348, -0.4778309, -0.5761619, 0.1803922, 1, 0, 1,
-0.5159939, -1.111539, -2.296129, 0.1764706, 1, 0, 1,
-0.515359, -0.01570135, -1.297474, 0.1686275, 1, 0, 1,
-0.5142592, -1.81641, -3.691458, 0.1647059, 1, 0, 1,
-0.5096773, -0.8261103, -2.604177, 0.1568628, 1, 0, 1,
-0.5059172, 1.303603, -1.167224, 0.1529412, 1, 0, 1,
-0.4983558, 0.3057448, -0.8733648, 0.145098, 1, 0, 1,
-0.4983003, -1.6291, -3.989372, 0.1411765, 1, 0, 1,
-0.4879536, 1.54188, 1.594145, 0.1333333, 1, 0, 1,
-0.4865578, -1.163907, -2.673768, 0.1294118, 1, 0, 1,
-0.4812648, -0.012811, -0.4668471, 0.1215686, 1, 0, 1,
-0.4758475, -0.4391662, -3.967411, 0.1176471, 1, 0, 1,
-0.463737, -1.395178, -2.665122, 0.1098039, 1, 0, 1,
-0.462605, -0.6540258, -1.425781, 0.1058824, 1, 0, 1,
-0.4621442, 0.1839282, -0.9504745, 0.09803922, 1, 0, 1,
-0.4601806, -0.537062, -4.071142, 0.09019608, 1, 0, 1,
-0.4601539, 0.2315295, -0.9472151, 0.08627451, 1, 0, 1,
-0.4574035, 0.570425, 2.440725, 0.07843138, 1, 0, 1,
-0.4568213, 1.690378, -0.8302957, 0.07450981, 1, 0, 1,
-0.4548559, 0.1155929, -0.9690936, 0.06666667, 1, 0, 1,
-0.4457331, 1.054176, 1.806976, 0.0627451, 1, 0, 1,
-0.4426994, -0.3099529, -1.038314, 0.05490196, 1, 0, 1,
-0.4402822, -0.353117, -2.201562, 0.05098039, 1, 0, 1,
-0.4399372, 0.4734927, -0.9498376, 0.04313726, 1, 0, 1,
-0.4378614, -0.1257649, -1.517826, 0.03921569, 1, 0, 1,
-0.4374315, 0.3228416, -0.5280795, 0.03137255, 1, 0, 1,
-0.4372102, -1.301536, -3.08475, 0.02745098, 1, 0, 1,
-0.4359089, -0.7475452, -3.832254, 0.01960784, 1, 0, 1,
-0.4357046, 1.068066, -1.369329, 0.01568628, 1, 0, 1,
-0.434523, -0.01511659, -2.20844, 0.007843138, 1, 0, 1,
-0.4324964, -0.7094544, -4.05417, 0.003921569, 1, 0, 1,
-0.4280432, 0.02616918, -2.221752, 0, 1, 0.003921569, 1,
-0.4279627, 0.216854, -2.164851, 0, 1, 0.01176471, 1,
-0.4269404, 0.3444829, -0.6951216, 0, 1, 0.01568628, 1,
-0.419293, 0.9922266, -0.08125856, 0, 1, 0.02352941, 1,
-0.4191853, -1.228426, -2.897929, 0, 1, 0.02745098, 1,
-0.4183785, -0.7471528, -3.617581, 0, 1, 0.03529412, 1,
-0.4097245, 0.5252748, -1.809987, 0, 1, 0.03921569, 1,
-0.4095766, 0.7779189, -0.2705809, 0, 1, 0.04705882, 1,
-0.4093514, 0.1865705, -1.185222, 0, 1, 0.05098039, 1,
-0.4085074, -0.4500356, -2.794461, 0, 1, 0.05882353, 1,
-0.4050084, 1.705004, -0.494964, 0, 1, 0.0627451, 1,
-0.404107, -0.1181321, -0.660326, 0, 1, 0.07058824, 1,
-0.3988089, -0.04508455, -3.426871, 0, 1, 0.07450981, 1,
-0.398466, -0.07932393, -1.576181, 0, 1, 0.08235294, 1,
-0.3974264, -0.643748, -3.199949, 0, 1, 0.08627451, 1,
-0.3951655, -1.427658, -0.2877532, 0, 1, 0.09411765, 1,
-0.3938702, -0.5224444, -2.131685, 0, 1, 0.1019608, 1,
-0.3935435, 0.1040564, 0.2200906, 0, 1, 0.1058824, 1,
-0.3863105, -1.302283, -2.182907, 0, 1, 0.1137255, 1,
-0.3855551, -1.164418, -3.444264, 0, 1, 0.1176471, 1,
-0.3812031, -0.500187, -1.952759, 0, 1, 0.1254902, 1,
-0.3765312, -0.2982389, -1.807544, 0, 1, 0.1294118, 1,
-0.3747919, -0.05669242, -3.975316, 0, 1, 0.1372549, 1,
-0.3679631, -1.631655, -2.661605, 0, 1, 0.1411765, 1,
-0.3645582, -0.992879, -1.668112, 0, 1, 0.1490196, 1,
-0.364517, -0.358275, -3.756151, 0, 1, 0.1529412, 1,
-0.3642271, -0.6481925, -2.222212, 0, 1, 0.1607843, 1,
-0.3478639, -1.749002, -3.312945, 0, 1, 0.1647059, 1,
-0.3441969, -0.1988226, -3.772226, 0, 1, 0.172549, 1,
-0.3423546, 1.471683, -0.9653518, 0, 1, 0.1764706, 1,
-0.3367586, -0.5879133, -1.671761, 0, 1, 0.1843137, 1,
-0.3358551, 0.957408, -1.050612, 0, 1, 0.1882353, 1,
-0.3336272, -0.08550843, -1.640133, 0, 1, 0.1960784, 1,
-0.3319022, 0.5313389, -0.7010056, 0, 1, 0.2039216, 1,
-0.3309395, -0.09510808, -1.540312, 0, 1, 0.2078431, 1,
-0.3307287, 0.07396978, -2.438657, 0, 1, 0.2156863, 1,
-0.3294454, -0.1297304, -2.006832, 0, 1, 0.2196078, 1,
-0.3281373, 0.7122045, 0.127546, 0, 1, 0.227451, 1,
-0.3277036, 1.765613, -0.7299382, 0, 1, 0.2313726, 1,
-0.3248775, 1.035889, -1.048316, 0, 1, 0.2392157, 1,
-0.3232209, 1.397961, -0.4800052, 0, 1, 0.2431373, 1,
-0.318212, -1.439081, -2.1398, 0, 1, 0.2509804, 1,
-0.3049538, -0.8005014, -2.771337, 0, 1, 0.254902, 1,
-0.3034934, 0.09524241, -1.533756, 0, 1, 0.2627451, 1,
-0.2891788, 1.299293, -0.5042033, 0, 1, 0.2666667, 1,
-0.2846686, 0.1105739, -2.253035, 0, 1, 0.2745098, 1,
-0.2844145, 0.06989697, -1.347772, 0, 1, 0.2784314, 1,
-0.2796599, 0.8743121, -0.8044116, 0, 1, 0.2862745, 1,
-0.2745602, 0.355562, 2.153867, 0, 1, 0.2901961, 1,
-0.2744369, -0.724866, -2.659445, 0, 1, 0.2980392, 1,
-0.2691237, 0.4869734, -0.4478671, 0, 1, 0.3058824, 1,
-0.2687785, -0.350963, -3.082731, 0, 1, 0.3098039, 1,
-0.2678326, 1.572108, -1.907964, 0, 1, 0.3176471, 1,
-0.2557431, -1.247798, -2.025466, 0, 1, 0.3215686, 1,
-0.2552786, -1.178554, -3.565707, 0, 1, 0.3294118, 1,
-0.2546292, 0.98457, 0.1240427, 0, 1, 0.3333333, 1,
-0.2542327, -0.5730472, -2.706791, 0, 1, 0.3411765, 1,
-0.2526767, -1.665396, -2.479279, 0, 1, 0.345098, 1,
-0.2524435, 1.517282, 2.02153, 0, 1, 0.3529412, 1,
-0.2513472, -0.5895327, -0.6998786, 0, 1, 0.3568628, 1,
-0.2504755, -0.8604985, -3.215706, 0, 1, 0.3647059, 1,
-0.2501645, -2.357642, -3.653063, 0, 1, 0.3686275, 1,
-0.250159, 0.1757757, -2.108175, 0, 1, 0.3764706, 1,
-0.2498748, -1.105472, -1.229422, 0, 1, 0.3803922, 1,
-0.2458373, 2.09906, 0.00771384, 0, 1, 0.3882353, 1,
-0.243636, -0.4710077, -2.303283, 0, 1, 0.3921569, 1,
-0.2421316, -1.749813, -2.798684, 0, 1, 0.4, 1,
-0.2413351, 0.2609198, -1.463087, 0, 1, 0.4078431, 1,
-0.2394419, -0.7532595, -4.246813, 0, 1, 0.4117647, 1,
-0.2386119, -0.7376796, -1.30625, 0, 1, 0.4196078, 1,
-0.2381553, -0.3532175, -3.507531, 0, 1, 0.4235294, 1,
-0.2375644, 1.50494, -0.1802667, 0, 1, 0.4313726, 1,
-0.2351499, 0.8143475, 1.592122, 0, 1, 0.4352941, 1,
-0.2316176, 0.6241063, -2.793719, 0, 1, 0.4431373, 1,
-0.2266365, 0.265783, -0.5147143, 0, 1, 0.4470588, 1,
-0.2239685, -0.2017225, -3.025113, 0, 1, 0.454902, 1,
-0.221654, 0.7271142, 0.08352634, 0, 1, 0.4588235, 1,
-0.2170427, 1.649341, -0.8310311, 0, 1, 0.4666667, 1,
-0.2161793, 0.003472722, -0.3495523, 0, 1, 0.4705882, 1,
-0.2132956, 0.3793192, 1.989483, 0, 1, 0.4784314, 1,
-0.2055123, -0.9010747, -2.805142, 0, 1, 0.4823529, 1,
-0.2010385, -0.7039625, -2.438573, 0, 1, 0.4901961, 1,
-0.1985575, -1.77834, -4.200746, 0, 1, 0.4941176, 1,
-0.1966429, -1.18658, -3.198119, 0, 1, 0.5019608, 1,
-0.1941557, 0.9791569, -1.115088, 0, 1, 0.509804, 1,
-0.1929567, -0.2045836, -1.353983, 0, 1, 0.5137255, 1,
-0.1925047, -0.8990055, -2.08602, 0, 1, 0.5215687, 1,
-0.1880598, -0.2309082, -4.492547, 0, 1, 0.5254902, 1,
-0.1866823, 1.168424, -1.714226, 0, 1, 0.5333334, 1,
-0.1856358, 1.579965, 1.964844, 0, 1, 0.5372549, 1,
-0.182384, -0.8329686, -2.028363, 0, 1, 0.5450981, 1,
-0.1816569, 0.4740845, -1.402754, 0, 1, 0.5490196, 1,
-0.1799982, 0.8115854, 0.918982, 0, 1, 0.5568628, 1,
-0.1782691, -0.6030674, -4.009934, 0, 1, 0.5607843, 1,
-0.176897, -0.08934966, -1.255092, 0, 1, 0.5686275, 1,
-0.1751963, -0.2023584, -1.626513, 0, 1, 0.572549, 1,
-0.1751396, 0.5169468, 0.5809541, 0, 1, 0.5803922, 1,
-0.168904, 0.7703283, -0.4731566, 0, 1, 0.5843138, 1,
-0.1685687, -1.937796, -2.0809, 0, 1, 0.5921569, 1,
-0.168038, 1.819269, 1.049983, 0, 1, 0.5960785, 1,
-0.1652853, -2.197728, -2.888918, 0, 1, 0.6039216, 1,
-0.1641715, -1.088357, -3.992326, 0, 1, 0.6117647, 1,
-0.1629032, 1.458739, -1.742471, 0, 1, 0.6156863, 1,
-0.1601054, 0.4318037, -0.1618273, 0, 1, 0.6235294, 1,
-0.1562616, 0.2453846, -1.401474, 0, 1, 0.627451, 1,
-0.1513582, -0.05442511, -0.6309868, 0, 1, 0.6352941, 1,
-0.1472735, -0.09566175, -3.179073, 0, 1, 0.6392157, 1,
-0.1449048, -1.106816, -1.317136, 0, 1, 0.6470588, 1,
-0.143167, -0.1823845, -3.550485, 0, 1, 0.6509804, 1,
-0.140689, 0.8894172, -1.084025, 0, 1, 0.6588235, 1,
-0.135804, -0.5729748, -1.813539, 0, 1, 0.6627451, 1,
-0.1315319, 0.6582, -1.411823, 0, 1, 0.6705883, 1,
-0.131043, 0.1154533, -0.3111842, 0, 1, 0.6745098, 1,
-0.1296133, -0.558315, -1.035392, 0, 1, 0.682353, 1,
-0.1292148, -0.07840215, -0.1381379, 0, 1, 0.6862745, 1,
-0.129089, 0.4121094, -0.3830907, 0, 1, 0.6941177, 1,
-0.1202794, 0.04421886, -0.6779319, 0, 1, 0.7019608, 1,
-0.1198832, -1.848215, -0.4962216, 0, 1, 0.7058824, 1,
-0.1176754, 1.133877, -0.8891011, 0, 1, 0.7137255, 1,
-0.1147958, -0.2906711, -2.451186, 0, 1, 0.7176471, 1,
-0.1121142, -0.3864424, -2.99047, 0, 1, 0.7254902, 1,
-0.110702, -1.192854, -1.742905, 0, 1, 0.7294118, 1,
-0.1081417, -1.536289, -3.07532, 0, 1, 0.7372549, 1,
-0.10686, -0.4354104, -3.147338, 0, 1, 0.7411765, 1,
-0.106705, 0.8982604, 0.8046774, 0, 1, 0.7490196, 1,
-0.1044079, 0.6102219, -2.463512, 0, 1, 0.7529412, 1,
-0.1040913, -1.471892, -2.190172, 0, 1, 0.7607843, 1,
-0.1024408, -1.688376, -2.224822, 0, 1, 0.7647059, 1,
-0.09784739, -2.631231, -3.572276, 0, 1, 0.772549, 1,
-0.09490508, -1.211873, -4.434175, 0, 1, 0.7764706, 1,
-0.09477559, -1.438423, -2.718702, 0, 1, 0.7843137, 1,
-0.09376388, 1.558003, -0.05698781, 0, 1, 0.7882353, 1,
-0.08718628, 1.124119, -0.1352369, 0, 1, 0.7960784, 1,
-0.08437121, -1.427645, -3.198257, 0, 1, 0.8039216, 1,
-0.08373965, -0.4438202, -2.940268, 0, 1, 0.8078431, 1,
-0.08301181, -0.3873037, -2.773239, 0, 1, 0.8156863, 1,
-0.08298064, -1.803875, -2.142178, 0, 1, 0.8196079, 1,
-0.08029409, 0.09950188, -1.215233, 0, 1, 0.827451, 1,
-0.07991683, -0.1986116, -2.313041, 0, 1, 0.8313726, 1,
-0.07885467, -0.18524, -4.069339, 0, 1, 0.8392157, 1,
-0.07860114, 2.110834, 0.7774271, 0, 1, 0.8431373, 1,
-0.07672989, -1.005443, -4.0614, 0, 1, 0.8509804, 1,
-0.07586813, -0.5352345, -2.636056, 0, 1, 0.854902, 1,
-0.07571358, 0.8341836, 0.2673566, 0, 1, 0.8627451, 1,
-0.07515824, 0.1345286, -1.98132, 0, 1, 0.8666667, 1,
-0.07112588, 0.2741212, -0.09800722, 0, 1, 0.8745098, 1,
-0.07072664, 0.7422141, -0.4056601, 0, 1, 0.8784314, 1,
-0.06611132, 2.511118, 1.182936, 0, 1, 0.8862745, 1,
-0.06201831, -0.1953922, -1.460788, 0, 1, 0.8901961, 1,
-0.05995846, 0.2864006, 0.06611522, 0, 1, 0.8980392, 1,
-0.05967231, -0.1699352, -2.509998, 0, 1, 0.9058824, 1,
-0.05317873, 0.9594075, -0.6217067, 0, 1, 0.9098039, 1,
-0.04790688, -1.268569, -3.013824, 0, 1, 0.9176471, 1,
-0.04190062, -0.08139314, -2.6916, 0, 1, 0.9215686, 1,
-0.04084263, 0.7990822, 0.01811699, 0, 1, 0.9294118, 1,
-0.04000853, -0.7890133, -2.666451, 0, 1, 0.9333333, 1,
-0.03578346, 1.873636, -2.102095, 0, 1, 0.9411765, 1,
-0.03254512, 1.31882, 0.2974179, 0, 1, 0.945098, 1,
-0.03206015, 0.4212395, 0.1202592, 0, 1, 0.9529412, 1,
-0.0270546, -2.482014, -3.534428, 0, 1, 0.9568627, 1,
-0.02177849, 0.3402938, 0.9801632, 0, 1, 0.9647059, 1,
-0.01909078, -0.2228664, -3.078351, 0, 1, 0.9686275, 1,
-0.01898856, -0.7922688, -1.86446, 0, 1, 0.9764706, 1,
-0.01150511, -0.1959081, -3.644145, 0, 1, 0.9803922, 1,
-0.008703916, -2.106283, -2.858897, 0, 1, 0.9882353, 1,
-0.006681173, -0.08668281, -3.410712, 0, 1, 0.9921569, 1,
-0.00594129, 0.06890195, 0.8243166, 0, 1, 1, 1,
-0.004507494, -0.2761395, -4.57693, 0, 0.9921569, 1, 1,
-0.003374526, -0.4015066, -4.264641, 0, 0.9882353, 1, 1,
0.000283776, 0.118405, 1.324821, 0, 0.9803922, 1, 1,
0.003908135, -0.1918132, 3.704033, 0, 0.9764706, 1, 1,
0.004761121, -0.2699284, 3.39686, 0, 0.9686275, 1, 1,
0.01113212, 0.8758128, 0.1200126, 0, 0.9647059, 1, 1,
0.0173685, -1.458722, 2.43272, 0, 0.9568627, 1, 1,
0.01747699, -0.3432764, 2.894705, 0, 0.9529412, 1, 1,
0.02856462, 1.40576, 0.2336037, 0, 0.945098, 1, 1,
0.0371681, -0.4292122, 2.362034, 0, 0.9411765, 1, 1,
0.03962101, 0.05975646, 2.833434, 0, 0.9333333, 1, 1,
0.04138499, 1.323609, -1.511525, 0, 0.9294118, 1, 1,
0.04220789, -1.060332, 3.452837, 0, 0.9215686, 1, 1,
0.04649538, -1.316782, 3.825723, 0, 0.9176471, 1, 1,
0.05327093, 1.820116, 0.5710263, 0, 0.9098039, 1, 1,
0.0601114, 0.3766545, -0.711127, 0, 0.9058824, 1, 1,
0.06388247, 0.1779306, 1.149999, 0, 0.8980392, 1, 1,
0.06453378, 0.5879624, 2.153431, 0, 0.8901961, 1, 1,
0.06790001, 0.8403166, -1.395969, 0, 0.8862745, 1, 1,
0.07173052, 0.3468779, 2.245244, 0, 0.8784314, 1, 1,
0.07271502, -0.6258028, 3.285776, 0, 0.8745098, 1, 1,
0.07278068, 0.1057739, 2.426787, 0, 0.8666667, 1, 1,
0.07460732, 1.317534, 1.00666, 0, 0.8627451, 1, 1,
0.07540484, 1.897378, 0.8525757, 0, 0.854902, 1, 1,
0.0783756, 0.6551649, 0.4188834, 0, 0.8509804, 1, 1,
0.08421955, 1.41213, -1.147375, 0, 0.8431373, 1, 1,
0.08505628, 1.406953, 0.06278839, 0, 0.8392157, 1, 1,
0.08806139, 1.771086, 0.1535379, 0, 0.8313726, 1, 1,
0.0884219, -0.208522, 2.71776, 0, 0.827451, 1, 1,
0.08876301, -1.109536, 5.542268, 0, 0.8196079, 1, 1,
0.08911365, 0.177328, -0.2695102, 0, 0.8156863, 1, 1,
0.08953445, 0.1709081, -0.07409345, 0, 0.8078431, 1, 1,
0.09590217, 1.011664, -0.09821322, 0, 0.8039216, 1, 1,
0.09690069, 1.149521, 0.7635134, 0, 0.7960784, 1, 1,
0.09998474, 0.3371618, -0.9088829, 0, 0.7882353, 1, 1,
0.1071555, -0.6701246, 3.903688, 0, 0.7843137, 1, 1,
0.1095339, -1.663763, 3.781354, 0, 0.7764706, 1, 1,
0.1097631, 0.3160571, 0.2239575, 0, 0.772549, 1, 1,
0.1221185, -1.371254, 3.227478, 0, 0.7647059, 1, 1,
0.1223772, 1.014117, -0.218896, 0, 0.7607843, 1, 1,
0.1280508, 0.17494, 0.127353, 0, 0.7529412, 1, 1,
0.1324338, -0.1749024, 1.960982, 0, 0.7490196, 1, 1,
0.1420968, 0.8320141, 0.3833315, 0, 0.7411765, 1, 1,
0.1439852, 1.022462, -0.130168, 0, 0.7372549, 1, 1,
0.1472803, 2.327004, 0.2711052, 0, 0.7294118, 1, 1,
0.1474274, -0.2875709, 2.107054, 0, 0.7254902, 1, 1,
0.1474288, 1.61673, 1.345729, 0, 0.7176471, 1, 1,
0.1531333, -1.138884, 3.94897, 0, 0.7137255, 1, 1,
0.1541821, 0.7146944, 0.9150807, 0, 0.7058824, 1, 1,
0.1547417, 1.062891, 2.073367, 0, 0.6980392, 1, 1,
0.1664459, -1.193662, 2.714396, 0, 0.6941177, 1, 1,
0.1664656, 0.6858357, 0.3088179, 0, 0.6862745, 1, 1,
0.1700654, 0.4080434, 0.01756546, 0, 0.682353, 1, 1,
0.1705722, 1.539173, 0.2024747, 0, 0.6745098, 1, 1,
0.1707274, 0.4348908, -1.141554, 0, 0.6705883, 1, 1,
0.171864, 1.543612, 0.8279846, 0, 0.6627451, 1, 1,
0.1719639, 0.370241, -1.203704, 0, 0.6588235, 1, 1,
0.1723785, -0.3169772, 2.191772, 0, 0.6509804, 1, 1,
0.1728848, 0.4016638, 2.152427, 0, 0.6470588, 1, 1,
0.181677, -1.569372, 2.746489, 0, 0.6392157, 1, 1,
0.1828923, 1.761795, -1.474276, 0, 0.6352941, 1, 1,
0.1836581, 1.53836, 0.4918043, 0, 0.627451, 1, 1,
0.1922275, -1.306193, 0.8182181, 0, 0.6235294, 1, 1,
0.1959826, 0.1716558, -0.05800689, 0, 0.6156863, 1, 1,
0.1967636, 0.4990082, -0.9461689, 0, 0.6117647, 1, 1,
0.1972197, -1.071054, 3.340513, 0, 0.6039216, 1, 1,
0.1975277, -1.015298, 3.817631, 0, 0.5960785, 1, 1,
0.2007682, -1.549144, 3.003037, 0, 0.5921569, 1, 1,
0.2017696, 1.431134, -0.7537734, 0, 0.5843138, 1, 1,
0.2028331, -0.08247418, 2.303822, 0, 0.5803922, 1, 1,
0.2045037, 1.967163, -0.2726922, 0, 0.572549, 1, 1,
0.2045789, 1.013688, 1.110168, 0, 0.5686275, 1, 1,
0.208947, 0.256674, 1.224423, 0, 0.5607843, 1, 1,
0.2097634, -1.244898, 3.848589, 0, 0.5568628, 1, 1,
0.2186633, 0.45139, 0.8661265, 0, 0.5490196, 1, 1,
0.2189208, -0.7998762, 2.883946, 0, 0.5450981, 1, 1,
0.2190043, -0.7004761, 4.407785, 0, 0.5372549, 1, 1,
0.2226353, -1.407841, 1.775885, 0, 0.5333334, 1, 1,
0.2251966, 0.5182688, -0.08128487, 0, 0.5254902, 1, 1,
0.2278481, -1.569779, 0.9850731, 0, 0.5215687, 1, 1,
0.2280049, 0.7974346, -0.2377407, 0, 0.5137255, 1, 1,
0.2283231, 1.048697, -0.07237947, 0, 0.509804, 1, 1,
0.2286093, -0.2384916, 1.892845, 0, 0.5019608, 1, 1,
0.2330001, 0.3516908, 0.2060083, 0, 0.4941176, 1, 1,
0.2370525, 0.7121677, -0.03524192, 0, 0.4901961, 1, 1,
0.2395404, 0.6715053, 1.572319, 0, 0.4823529, 1, 1,
0.242968, -1.066397, 2.326948, 0, 0.4784314, 1, 1,
0.2429834, 0.4076535, 2.009496, 0, 0.4705882, 1, 1,
0.2473055, 0.499177, 0.663435, 0, 0.4666667, 1, 1,
0.2489074, -0.9693267, 3.232549, 0, 0.4588235, 1, 1,
0.2492294, -0.7350091, 2.599748, 0, 0.454902, 1, 1,
0.2505844, 0.458839, 0.4969025, 0, 0.4470588, 1, 1,
0.2537296, 0.04075607, 2.583496, 0, 0.4431373, 1, 1,
0.25508, 1.493249, -0.2059958, 0, 0.4352941, 1, 1,
0.2583402, -0.4966796, 0.5880058, 0, 0.4313726, 1, 1,
0.2683215, -1.006201, 3.024061, 0, 0.4235294, 1, 1,
0.2688196, 0.5785818, 1.103645, 0, 0.4196078, 1, 1,
0.2689211, 1.615754, 0.5601262, 0, 0.4117647, 1, 1,
0.2692387, 0.1552997, 0.7595438, 0, 0.4078431, 1, 1,
0.2712345, -1.158878, 3.630632, 0, 0.4, 1, 1,
0.2714687, -0.6800149, 3.030159, 0, 0.3921569, 1, 1,
0.2745149, -0.4075064, 4.086071, 0, 0.3882353, 1, 1,
0.2749889, 0.5487665, 1.636587, 0, 0.3803922, 1, 1,
0.2760412, -0.8119081, 1.878408, 0, 0.3764706, 1, 1,
0.2788834, -1.366391, 2.935016, 0, 0.3686275, 1, 1,
0.2800887, -0.3516974, 2.185463, 0, 0.3647059, 1, 1,
0.281781, 0.9823888, 0.7292396, 0, 0.3568628, 1, 1,
0.2827304, -1.021781, 2.849324, 0, 0.3529412, 1, 1,
0.2866669, 0.9950703, 0.1630846, 0, 0.345098, 1, 1,
0.2905154, 0.1326628, 2.015996, 0, 0.3411765, 1, 1,
0.2907643, -1.446252, 3.922935, 0, 0.3333333, 1, 1,
0.2982141, -1.215201, 2.259083, 0, 0.3294118, 1, 1,
0.3011207, -1.807369, 2.967408, 0, 0.3215686, 1, 1,
0.3021062, 0.1145048, -0.4023391, 0, 0.3176471, 1, 1,
0.3034987, 0.1453318, 0.7021755, 0, 0.3098039, 1, 1,
0.3037142, -1.819071, 3.529538, 0, 0.3058824, 1, 1,
0.3056295, 0.3630376, -0.2485933, 0, 0.2980392, 1, 1,
0.3150266, -0.6750532, 2.244272, 0, 0.2901961, 1, 1,
0.3150606, 0.3188361, 0.6378931, 0, 0.2862745, 1, 1,
0.3172511, -0.4280029, 2.679224, 0, 0.2784314, 1, 1,
0.3173186, -0.5053796, 2.140031, 0, 0.2745098, 1, 1,
0.3222691, 0.8359352, 0.9658183, 0, 0.2666667, 1, 1,
0.3229981, 0.9401969, 1.372697, 0, 0.2627451, 1, 1,
0.3241949, -0.4484234, 2.052793, 0, 0.254902, 1, 1,
0.3298137, -0.2612068, 2.990234, 0, 0.2509804, 1, 1,
0.3317988, 0.4448937, 0.720976, 0, 0.2431373, 1, 1,
0.3329834, 0.0713009, 0.9736518, 0, 0.2392157, 1, 1,
0.338945, -0.310214, 2.839834, 0, 0.2313726, 1, 1,
0.3521848, 1.169857, 0.9978971, 0, 0.227451, 1, 1,
0.3610964, -1.42159, 3.453414, 0, 0.2196078, 1, 1,
0.3648937, -2.44504, 1.464258, 0, 0.2156863, 1, 1,
0.3714199, 0.9304065, -0.3667926, 0, 0.2078431, 1, 1,
0.3794165, 0.9689302, 0.1566997, 0, 0.2039216, 1, 1,
0.3815021, -0.376726, 1.950507, 0, 0.1960784, 1, 1,
0.3958567, -0.02307482, 0.3000947, 0, 0.1882353, 1, 1,
0.3996855, 0.2427794, 1.486642, 0, 0.1843137, 1, 1,
0.4035634, -0.3441332, 3.565898, 0, 0.1764706, 1, 1,
0.4045319, 0.1396448, 2.154912, 0, 0.172549, 1, 1,
0.4101708, 0.02475118, 1.958314, 0, 0.1647059, 1, 1,
0.4183872, -0.4866181, 1.677897, 0, 0.1607843, 1, 1,
0.4218335, 0.7873758, 2.205159, 0, 0.1529412, 1, 1,
0.4288261, 1.711974, -0.008341227, 0, 0.1490196, 1, 1,
0.4291943, -0.4163504, 3.254933, 0, 0.1411765, 1, 1,
0.4352238, 0.4875947, 0.4207221, 0, 0.1372549, 1, 1,
0.4352966, 0.1275018, -0.3493499, 0, 0.1294118, 1, 1,
0.4367128, 1.137766, -0.1016822, 0, 0.1254902, 1, 1,
0.4426032, -1.361811, 2.440367, 0, 0.1176471, 1, 1,
0.4432776, 0.6611498, 1.14184, 0, 0.1137255, 1, 1,
0.4572757, -0.4283834, 1.48039, 0, 0.1058824, 1, 1,
0.4594938, -1.991939, 2.093762, 0, 0.09803922, 1, 1,
0.4624465, 0.3693506, 1.746521, 0, 0.09411765, 1, 1,
0.4649056, 0.6944518, 1.680134, 0, 0.08627451, 1, 1,
0.4674987, 0.009746401, 2.822939, 0, 0.08235294, 1, 1,
0.4706353, -0.6309, 2.665915, 0, 0.07450981, 1, 1,
0.4732848, -0.3451797, 3.183533, 0, 0.07058824, 1, 1,
0.4796025, -1.002678, 2.071987, 0, 0.0627451, 1, 1,
0.4810349, -0.7949404, 1.225824, 0, 0.05882353, 1, 1,
0.4820964, -1.426793, 3.384702, 0, 0.05098039, 1, 1,
0.4849939, -0.7116688, 2.982579, 0, 0.04705882, 1, 1,
0.4854958, -0.3793879, 1.99774, 0, 0.03921569, 1, 1,
0.4879333, 0.7120927, -0.6930256, 0, 0.03529412, 1, 1,
0.4937117, 0.7226133, 2.147423, 0, 0.02745098, 1, 1,
0.4939538, -0.7911674, 2.269812, 0, 0.02352941, 1, 1,
0.4956438, 1.863551, 0.1748604, 0, 0.01568628, 1, 1,
0.5008634, -0.9052052, 2.242481, 0, 0.01176471, 1, 1,
0.5091549, 2.370234, 2.11314, 0, 0.003921569, 1, 1,
0.5096673, -0.316176, 2.56607, 0.003921569, 0, 1, 1,
0.5111259, -1.518364, 2.124844, 0.007843138, 0, 1, 1,
0.5114722, -0.3714052, 3.158237, 0.01568628, 0, 1, 1,
0.5151316, -0.222627, 2.788577, 0.01960784, 0, 1, 1,
0.5157511, 0.3124319, 2.850986, 0.02745098, 0, 1, 1,
0.5187424, 1.976086, 1.307678, 0.03137255, 0, 1, 1,
0.521634, -0.5692616, 1.673861, 0.03921569, 0, 1, 1,
0.5277692, 1.023098, 1.8356, 0.04313726, 0, 1, 1,
0.5286569, -0.1593879, 2.889189, 0.05098039, 0, 1, 1,
0.5292456, -0.03689138, 0.3939619, 0.05490196, 0, 1, 1,
0.5331539, 1.090137, -0.8376181, 0.0627451, 0, 1, 1,
0.5333009, 1.668714, 0.1965119, 0.06666667, 0, 1, 1,
0.5384439, 0.005238808, 3.693539, 0.07450981, 0, 1, 1,
0.5388623, -0.1438223, 3.659806, 0.07843138, 0, 1, 1,
0.5413491, -2.166471, 3.085699, 0.08627451, 0, 1, 1,
0.5498703, -0.2144877, 2.844786, 0.09019608, 0, 1, 1,
0.5504807, -0.2881442, 2.199836, 0.09803922, 0, 1, 1,
0.5741753, 0.39641, 1.144543, 0.1058824, 0, 1, 1,
0.5748474, -0.5128188, 1.303126, 0.1098039, 0, 1, 1,
0.578783, 1.411946, 0.4414122, 0.1176471, 0, 1, 1,
0.5789171, -0.1767475, 2.15452, 0.1215686, 0, 1, 1,
0.5809626, 0.8533046, -0.6690426, 0.1294118, 0, 1, 1,
0.5812789, -1.055446, 2.735538, 0.1333333, 0, 1, 1,
0.58301, 0.5800544, 1.225182, 0.1411765, 0, 1, 1,
0.5837106, -1.065639, 3.232378, 0.145098, 0, 1, 1,
0.5875237, -1.70469, 4.32593, 0.1529412, 0, 1, 1,
0.5892807, 1.232086, 1.068844, 0.1568628, 0, 1, 1,
0.5899361, -1.589964, 2.504768, 0.1647059, 0, 1, 1,
0.6011826, -0.78887, 3.307319, 0.1686275, 0, 1, 1,
0.6016597, -0.05437809, 0.2987279, 0.1764706, 0, 1, 1,
0.6058811, -0.4138397, 1.814403, 0.1803922, 0, 1, 1,
0.6062602, -0.3814024, 1.144537, 0.1882353, 0, 1, 1,
0.6096277, 0.7926109, -0.06769279, 0.1921569, 0, 1, 1,
0.6124256, 1.104045, 0.8919485, 0.2, 0, 1, 1,
0.6152101, -0.482586, 1.0221, 0.2078431, 0, 1, 1,
0.6195115, -0.78645, 1.690401, 0.2117647, 0, 1, 1,
0.62001, 0.1627059, 1.088511, 0.2196078, 0, 1, 1,
0.6268724, 0.5929502, 1.540056, 0.2235294, 0, 1, 1,
0.6292876, -0.2625856, 2.530924, 0.2313726, 0, 1, 1,
0.6305546, 1.772964, 0.5192398, 0.2352941, 0, 1, 1,
0.6315181, -1.681383, 1.776893, 0.2431373, 0, 1, 1,
0.6316216, 0.9551325, 1.298619, 0.2470588, 0, 1, 1,
0.6321381, -1.032341, 2.264709, 0.254902, 0, 1, 1,
0.6347483, -1.062896, 1.495602, 0.2588235, 0, 1, 1,
0.6382298, -0.01516451, 1.63518, 0.2666667, 0, 1, 1,
0.6396801, -1.751979, 1.995547, 0.2705882, 0, 1, 1,
0.6436062, 1.744747, 1.203388, 0.2784314, 0, 1, 1,
0.6569275, -0.8389323, 1.442899, 0.282353, 0, 1, 1,
0.6570076, 0.157641, 2.386025, 0.2901961, 0, 1, 1,
0.6574858, -0.8750173, 3.66876, 0.2941177, 0, 1, 1,
0.6619657, -0.7823449, 2.643232, 0.3019608, 0, 1, 1,
0.664192, 0.6007546, 0.8587517, 0.3098039, 0, 1, 1,
0.6657695, -1.38315, 2.513993, 0.3137255, 0, 1, 1,
0.6679827, 0.5723403, 2.151119, 0.3215686, 0, 1, 1,
0.6713601, -1.54091, 3.403828, 0.3254902, 0, 1, 1,
0.674438, 1.526384, 0.2772979, 0.3333333, 0, 1, 1,
0.6801689, 1.84106, 0.7613714, 0.3372549, 0, 1, 1,
0.6828332, -1.150284, 3.989928, 0.345098, 0, 1, 1,
0.6868614, 0.397721, 0.06679922, 0.3490196, 0, 1, 1,
0.6897935, -0.1830278, 2.810122, 0.3568628, 0, 1, 1,
0.6967503, -0.2853698, 1.11417, 0.3607843, 0, 1, 1,
0.7000639, 0.2377286, 0.2773173, 0.3686275, 0, 1, 1,
0.7017397, -0.9408103, 3.829279, 0.372549, 0, 1, 1,
0.7052888, -0.1029612, 0.3094651, 0.3803922, 0, 1, 1,
0.7054473, 1.634595, 0.5821142, 0.3843137, 0, 1, 1,
0.7076634, -0.9943787, 1.874611, 0.3921569, 0, 1, 1,
0.7145591, 0.7063341, 0.2732363, 0.3960784, 0, 1, 1,
0.7170942, -1.090828, 4.703252, 0.4039216, 0, 1, 1,
0.7226532, -0.2011075, 1.630906, 0.4117647, 0, 1, 1,
0.7232569, -1.467641, 2.13035, 0.4156863, 0, 1, 1,
0.7296208, 0.8940533, 2.419734, 0.4235294, 0, 1, 1,
0.733248, 1.174374, 0.4768633, 0.427451, 0, 1, 1,
0.7357584, 1.380045, 0.5413694, 0.4352941, 0, 1, 1,
0.7361653, 0.2107763, 0.4224457, 0.4392157, 0, 1, 1,
0.7387877, -1.737176, 2.984465, 0.4470588, 0, 1, 1,
0.7434549, -1.142134, 1.947937, 0.4509804, 0, 1, 1,
0.7466965, 1.332947, 1.326369, 0.4588235, 0, 1, 1,
0.7492092, -2.204942, 3.004841, 0.4627451, 0, 1, 1,
0.7495425, -0.3703483, 1.229498, 0.4705882, 0, 1, 1,
0.7591248, -1.378428, 2.35784, 0.4745098, 0, 1, 1,
0.7617344, 1.718408, 0.8937277, 0.4823529, 0, 1, 1,
0.7618164, 0.7994977, 1.33721, 0.4862745, 0, 1, 1,
0.7623546, 1.614938, -0.4139554, 0.4941176, 0, 1, 1,
0.7630449, -1.533425, 1.699183, 0.5019608, 0, 1, 1,
0.7633122, 1.45862, -0.5970657, 0.5058824, 0, 1, 1,
0.7646254, 1.63688, 0.7059272, 0.5137255, 0, 1, 1,
0.7649699, -0.188317, 1.958523, 0.5176471, 0, 1, 1,
0.7724389, -1.059891, 1.648149, 0.5254902, 0, 1, 1,
0.7749112, 0.05860103, 0.2287478, 0.5294118, 0, 1, 1,
0.7794525, 0.356993, 3.423704, 0.5372549, 0, 1, 1,
0.7824268, -2.018991, 3.578707, 0.5411765, 0, 1, 1,
0.7830042, 0.6218324, -0.2495806, 0.5490196, 0, 1, 1,
0.7848186, -0.3158942, 1.738718, 0.5529412, 0, 1, 1,
0.7877045, -0.1515644, 2.250788, 0.5607843, 0, 1, 1,
0.7901282, -0.4982764, 1.353386, 0.5647059, 0, 1, 1,
0.7922208, 0.09056593, -0.05739607, 0.572549, 0, 1, 1,
0.7994826, 0.358647, 1.251879, 0.5764706, 0, 1, 1,
0.8071507, 0.2835751, 1.361294, 0.5843138, 0, 1, 1,
0.8138785, -0.05283872, 0.1086777, 0.5882353, 0, 1, 1,
0.819129, -1.064711, 1.345841, 0.5960785, 0, 1, 1,
0.8267612, 0.6413357, 0.658347, 0.6039216, 0, 1, 1,
0.830107, -1.449226, 2.071055, 0.6078432, 0, 1, 1,
0.8321146, -0.1921288, 3.430568, 0.6156863, 0, 1, 1,
0.8354979, 0.7520724, 1.218529, 0.6196079, 0, 1, 1,
0.8366032, -0.1534289, 2.115832, 0.627451, 0, 1, 1,
0.8428113, 1.562174, 0.9478543, 0.6313726, 0, 1, 1,
0.8487685, 0.3439574, 2.45599, 0.6392157, 0, 1, 1,
0.8497981, -1.184009, 2.322328, 0.6431373, 0, 1, 1,
0.8503679, 1.168141, 0.7283546, 0.6509804, 0, 1, 1,
0.8564936, 1.2716, 1.709302, 0.654902, 0, 1, 1,
0.8565639, -0.5529805, 3.242273, 0.6627451, 0, 1, 1,
0.856608, 0.4411578, 1.343753, 0.6666667, 0, 1, 1,
0.8653551, -0.08929475, 2.288661, 0.6745098, 0, 1, 1,
0.8682687, -1.813843, 2.40395, 0.6784314, 0, 1, 1,
0.8691832, -0.28799, 3.244392, 0.6862745, 0, 1, 1,
0.8757486, -1.354206, 3.26062, 0.6901961, 0, 1, 1,
0.8786932, -0.8800203, 3.998704, 0.6980392, 0, 1, 1,
0.8839092, 2.209805, -0.6599234, 0.7058824, 0, 1, 1,
0.8849922, 0.2096155, 1.612162, 0.7098039, 0, 1, 1,
0.8990041, -0.3217501, 2.50828, 0.7176471, 0, 1, 1,
0.9005155, -0.9901622, 2.245912, 0.7215686, 0, 1, 1,
0.9020551, 0.8041884, 1.163404, 0.7294118, 0, 1, 1,
0.9022492, 0.601926, 1.566032, 0.7333333, 0, 1, 1,
0.9031181, 0.1071689, 2.08678, 0.7411765, 0, 1, 1,
0.9039881, 0.04535086, 0.8315454, 0.7450981, 0, 1, 1,
0.9062014, -0.4527361, 3.723285, 0.7529412, 0, 1, 1,
0.9065177, 0.1944929, 2.260258, 0.7568628, 0, 1, 1,
0.9083821, 0.7150492, 1.666459, 0.7647059, 0, 1, 1,
0.9187506, -0.05270787, 2.466259, 0.7686275, 0, 1, 1,
0.9198289, 0.4068237, -0.2523125, 0.7764706, 0, 1, 1,
0.9214643, -0.0172025, 1.621732, 0.7803922, 0, 1, 1,
0.9214666, 0.7228872, -0.6247131, 0.7882353, 0, 1, 1,
0.923189, -1.299249, 3.027731, 0.7921569, 0, 1, 1,
0.9392424, 1.177731, -0.5156737, 0.8, 0, 1, 1,
0.9397468, -0.005753098, 2.249105, 0.8078431, 0, 1, 1,
0.9430357, 1.464068, -0.378585, 0.8117647, 0, 1, 1,
0.9457679, 0.5624313, 1.613278, 0.8196079, 0, 1, 1,
0.9523759, 1.469763, 1.992871, 0.8235294, 0, 1, 1,
0.9634844, 0.5246036, -0.8646755, 0.8313726, 0, 1, 1,
0.9701089, 0.04588188, -0.0370323, 0.8352941, 0, 1, 1,
0.9706742, -0.4981519, 0.8908239, 0.8431373, 0, 1, 1,
0.9766347, -0.5688825, 2.852086, 0.8470588, 0, 1, 1,
0.9767806, 0.1437479, 0.6160221, 0.854902, 0, 1, 1,
0.9775167, 0.3697505, 0.7676786, 0.8588235, 0, 1, 1,
0.9817333, -0.5466257, 3.061278, 0.8666667, 0, 1, 1,
0.9843486, 1.759034, 0.4469683, 0.8705882, 0, 1, 1,
0.9908643, 0.4725455, 1.488147, 0.8784314, 0, 1, 1,
0.9937433, -0.118356, 2.224109, 0.8823529, 0, 1, 1,
1.002726, -0.001376355, 0.7691073, 0.8901961, 0, 1, 1,
1.00617, 1.27515, 1.740396, 0.8941177, 0, 1, 1,
1.006271, 0.7925231, 1.700358, 0.9019608, 0, 1, 1,
1.015834, -0.813611, 2.786325, 0.9098039, 0, 1, 1,
1.022545, -0.5076344, 2.568316, 0.9137255, 0, 1, 1,
1.02377, -1.770254, 2.418177, 0.9215686, 0, 1, 1,
1.029161, -0.4586034, 2.308366, 0.9254902, 0, 1, 1,
1.032943, -0.1005321, 3.210732, 0.9333333, 0, 1, 1,
1.034801, -2.116677, 2.130226, 0.9372549, 0, 1, 1,
1.034992, -0.3420272, 3.052867, 0.945098, 0, 1, 1,
1.035755, -2.050065, 3.082122, 0.9490196, 0, 1, 1,
1.040406, -1.750188, 4.856555, 0.9568627, 0, 1, 1,
1.04042, 0.01548877, 2.570999, 0.9607843, 0, 1, 1,
1.042849, 0.6789709, 0.9201974, 0.9686275, 0, 1, 1,
1.043706, 0.1026066, 2.984247, 0.972549, 0, 1, 1,
1.047837, 1.340182, 1.323896, 0.9803922, 0, 1, 1,
1.050587, -0.4083888, 0.6202358, 0.9843137, 0, 1, 1,
1.052567, -0.1817777, 0.4893624, 0.9921569, 0, 1, 1,
1.05284, 0.2786154, 1.833753, 0.9960784, 0, 1, 1,
1.052853, -1.273671, 0.7172878, 1, 0, 0.9960784, 1,
1.056949, -0.435196, 0.679665, 1, 0, 0.9882353, 1,
1.05721, 0.06028159, -0.1900525, 1, 0, 0.9843137, 1,
1.057597, 0.5556679, -0.3308809, 1, 0, 0.9764706, 1,
1.059429, -0.6702003, 3.583404, 1, 0, 0.972549, 1,
1.061414, 0.467115, 0.6776301, 1, 0, 0.9647059, 1,
1.070853, -0.7061121, 0.5928105, 1, 0, 0.9607843, 1,
1.071025, -1.23263, 1.738983, 1, 0, 0.9529412, 1,
1.076061, -0.541795, 2.075925, 1, 0, 0.9490196, 1,
1.086309, -0.5083283, 3.474218, 1, 0, 0.9411765, 1,
1.091757, -0.3235701, 0.3759655, 1, 0, 0.9372549, 1,
1.092861, -0.1411122, 2.09457, 1, 0, 0.9294118, 1,
1.104254, 0.7772298, -0.7116056, 1, 0, 0.9254902, 1,
1.104455, 0.199839, 0.1552034, 1, 0, 0.9176471, 1,
1.107832, -0.3807197, 1.825241, 1, 0, 0.9137255, 1,
1.108938, -1.214553, 3.812902, 1, 0, 0.9058824, 1,
1.111172, -0.700094, 2.724952, 1, 0, 0.9019608, 1,
1.113931, 0.9077193, 1.668026, 1, 0, 0.8941177, 1,
1.128155, -1.734888, 4.192924, 1, 0, 0.8862745, 1,
1.13034, 0.0724116, 1.582838, 1, 0, 0.8823529, 1,
1.131077, 1.761485, 1.001185, 1, 0, 0.8745098, 1,
1.131328, -0.2990461, 2.246124, 1, 0, 0.8705882, 1,
1.14987, 0.48346, -0.8293774, 1, 0, 0.8627451, 1,
1.159293, 0.4065123, 0.1173127, 1, 0, 0.8588235, 1,
1.173004, -0.07634285, 2.596426, 1, 0, 0.8509804, 1,
1.174561, 0.6024737, 1.862528, 1, 0, 0.8470588, 1,
1.176331, -0.7909977, 1.218449, 1, 0, 0.8392157, 1,
1.17844, -0.2345599, 3.591609, 1, 0, 0.8352941, 1,
1.178862, 0.3842157, 1.538297, 1, 0, 0.827451, 1,
1.180192, -1.037496, 5.480943, 1, 0, 0.8235294, 1,
1.185228, -0.6789359, 0.8277209, 1, 0, 0.8156863, 1,
1.189165, -1.416066, 1.798955, 1, 0, 0.8117647, 1,
1.189367, 2.068195, -0.1818883, 1, 0, 0.8039216, 1,
1.192489, 0.9241084, 2.000552, 1, 0, 0.7960784, 1,
1.194597, 0.1033254, 1.305781, 1, 0, 0.7921569, 1,
1.1961, 0.05563409, 2.084121, 1, 0, 0.7843137, 1,
1.204839, 0.8829436, 2.539641, 1, 0, 0.7803922, 1,
1.213407, 0.3272957, 1.017391, 1, 0, 0.772549, 1,
1.214393, -0.970102, 1.144747, 1, 0, 0.7686275, 1,
1.220224, 0.9134582, 1.300054, 1, 0, 0.7607843, 1,
1.221775, -0.854003, 3.087255, 1, 0, 0.7568628, 1,
1.224201, -1.229402, 3.343453, 1, 0, 0.7490196, 1,
1.231584, 0.7800936, 2.44839, 1, 0, 0.7450981, 1,
1.236799, 0.3963912, 1.244142, 1, 0, 0.7372549, 1,
1.238675, 0.1242752, 0.9672943, 1, 0, 0.7333333, 1,
1.247476, 1.501605, 0.1528894, 1, 0, 0.7254902, 1,
1.248624, -0.5762943, 3.481004, 1, 0, 0.7215686, 1,
1.253577, 0.08580772, 1.576435, 1, 0, 0.7137255, 1,
1.254036, 0.9224956, 1.178095, 1, 0, 0.7098039, 1,
1.257845, -0.4324948, 0.0261016, 1, 0, 0.7019608, 1,
1.258879, -0.4222003, 3.341302, 1, 0, 0.6941177, 1,
1.26969, 1.538244, -0.02436406, 1, 0, 0.6901961, 1,
1.269865, -1.042465, 1.365399, 1, 0, 0.682353, 1,
1.273299, -1.009943, 1.196689, 1, 0, 0.6784314, 1,
1.274706, 1.864901, 2.905046, 1, 0, 0.6705883, 1,
1.27496, 0.552062, 1.956251, 1, 0, 0.6666667, 1,
1.277852, 0.5322371, 1.729546, 1, 0, 0.6588235, 1,
1.281097, 1.849953, 0.5466541, 1, 0, 0.654902, 1,
1.286039, -0.5136859, 2.042521, 1, 0, 0.6470588, 1,
1.287319, 1.546651, 1.080837, 1, 0, 0.6431373, 1,
1.290632, 1.440285, 1.937086, 1, 0, 0.6352941, 1,
1.292296, 1.529418, 0.9065009, 1, 0, 0.6313726, 1,
1.296776, 0.9904213, 0.3775258, 1, 0, 0.6235294, 1,
1.296782, -1.248285, 2.164442, 1, 0, 0.6196079, 1,
1.297514, -0.6423086, 1.221247, 1, 0, 0.6117647, 1,
1.305412, 1.149041, -0.4143893, 1, 0, 0.6078432, 1,
1.308874, 0.7165443, 1.289972, 1, 0, 0.6, 1,
1.319257, -1.258669, 1.917682, 1, 0, 0.5921569, 1,
1.332074, 0.3034804, 2.033887, 1, 0, 0.5882353, 1,
1.336615, 0.7988218, 0.2823423, 1, 0, 0.5803922, 1,
1.341245, 0.8555783, 0.03610462, 1, 0, 0.5764706, 1,
1.341942, -0.6766087, 2.698174, 1, 0, 0.5686275, 1,
1.343088, -1.676901, 2.990597, 1, 0, 0.5647059, 1,
1.358661, 0.1598343, 1.942, 1, 0, 0.5568628, 1,
1.359976, 0.6749619, 1.699736, 1, 0, 0.5529412, 1,
1.360556, -0.7502793, 1.559136, 1, 0, 0.5450981, 1,
1.36368, -0.7458234, 1.2718, 1, 0, 0.5411765, 1,
1.365825, 0.672151, 0.5949445, 1, 0, 0.5333334, 1,
1.369954, -0.05089715, 1.968031, 1, 0, 0.5294118, 1,
1.371525, -1.250669, 3.305774, 1, 0, 0.5215687, 1,
1.387737, 0.5291167, 1.748379, 1, 0, 0.5176471, 1,
1.391098, -1.112779, 3.027932, 1, 0, 0.509804, 1,
1.412273, -0.04491352, 1.66907, 1, 0, 0.5058824, 1,
1.415453, 1.378469, 1.687355, 1, 0, 0.4980392, 1,
1.418126, 0.3795387, 1.233899, 1, 0, 0.4901961, 1,
1.426643, 0.2539801, -0.3458453, 1, 0, 0.4862745, 1,
1.429719, -2.222924, 3.258, 1, 0, 0.4784314, 1,
1.451586, 0.159814, -0.100625, 1, 0, 0.4745098, 1,
1.457339, -0.8546425, 2.600889, 1, 0, 0.4666667, 1,
1.465289, -0.4473151, 1.796477, 1, 0, 0.4627451, 1,
1.465676, 0.6703334, 0.6330413, 1, 0, 0.454902, 1,
1.467842, 0.3712034, 0.9111456, 1, 0, 0.4509804, 1,
1.473295, -0.3628572, -0.05913408, 1, 0, 0.4431373, 1,
1.47426, 0.5526697, 2.004129, 1, 0, 0.4392157, 1,
1.48918, -0.7189739, 0.7259427, 1, 0, 0.4313726, 1,
1.505107, 0.1903723, 1.118949, 1, 0, 0.427451, 1,
1.514505, 0.9809489, 1.141967, 1, 0, 0.4196078, 1,
1.515897, -0.5657541, 1.812638, 1, 0, 0.4156863, 1,
1.516124, -1.101987, 0.8983498, 1, 0, 0.4078431, 1,
1.518069, -1.272515, 2.270459, 1, 0, 0.4039216, 1,
1.518162, 2.085066, 0.2440487, 1, 0, 0.3960784, 1,
1.522264, -1.535903, 1.668372, 1, 0, 0.3882353, 1,
1.545755, -0.0558416, 1.843928, 1, 0, 0.3843137, 1,
1.564893, 2.112071, 0.7491494, 1, 0, 0.3764706, 1,
1.565685, 1.320689, 2.557916, 1, 0, 0.372549, 1,
1.571288, -0.4299061, 0.7493743, 1, 0, 0.3647059, 1,
1.593914, 1.164864, 0.6796266, 1, 0, 0.3607843, 1,
1.602995, 0.8075606, 0.679409, 1, 0, 0.3529412, 1,
1.604845, -0.7493653, 2.467301, 1, 0, 0.3490196, 1,
1.611903, 2.571697, 0.4201035, 1, 0, 0.3411765, 1,
1.621223, 0.4320824, 0.7152771, 1, 0, 0.3372549, 1,
1.629218, 0.1040834, 2.018606, 1, 0, 0.3294118, 1,
1.630049, 1.569163, 1.223213, 1, 0, 0.3254902, 1,
1.651282, 0.9401455, 0.1732517, 1, 0, 0.3176471, 1,
1.657121, 0.3444287, 0.7044416, 1, 0, 0.3137255, 1,
1.661347, 1.065791, 2.337846, 1, 0, 0.3058824, 1,
1.661787, -0.2187557, 0.9900098, 1, 0, 0.2980392, 1,
1.670113, -0.386294, 1.06271, 1, 0, 0.2941177, 1,
1.675679, -0.3020834, 2.010327, 1, 0, 0.2862745, 1,
1.678872, 1.852173, 0.2445429, 1, 0, 0.282353, 1,
1.680271, 0.7661546, -0.1971576, 1, 0, 0.2745098, 1,
1.6911, 0.3758465, 2.69162, 1, 0, 0.2705882, 1,
1.697743, -0.5782115, 1.041301, 1, 0, 0.2627451, 1,
1.718587, -1.718977, 3.665002, 1, 0, 0.2588235, 1,
1.755579, -1.437157, 1.453395, 1, 0, 0.2509804, 1,
1.762454, 1.022998, 0.4041073, 1, 0, 0.2470588, 1,
1.765643, 1.732499, -0.05891459, 1, 0, 0.2392157, 1,
1.776043, -1.310796, 1.906111, 1, 0, 0.2352941, 1,
1.782143, 0.01654608, 0.275802, 1, 0, 0.227451, 1,
1.783627, -0.5857622, 3.081365, 1, 0, 0.2235294, 1,
1.786846, -0.3494277, 1.674928, 1, 0, 0.2156863, 1,
1.792504, -0.8341378, 1.301681, 1, 0, 0.2117647, 1,
1.799145, -1.587434, 2.517532, 1, 0, 0.2039216, 1,
1.801782, 1.615845, 0.7808297, 1, 0, 0.1960784, 1,
1.811215, -1.53436, 0.02678736, 1, 0, 0.1921569, 1,
1.871294, -1.018567, 2.583599, 1, 0, 0.1843137, 1,
1.886353, -0.1747507, 3.191141, 1, 0, 0.1803922, 1,
1.899779, -0.279994, 1.44924, 1, 0, 0.172549, 1,
1.902515, -0.03169358, 1.424825, 1, 0, 0.1686275, 1,
1.935001, 1.576517, -0.3466011, 1, 0, 0.1607843, 1,
1.958666, 0.09059758, 0.1529718, 1, 0, 0.1568628, 1,
1.972786, -0.01872516, 4.798889, 1, 0, 0.1490196, 1,
1.985451, -0.8473312, 3.048041, 1, 0, 0.145098, 1,
1.989184, -0.3672053, 1.157829, 1, 0, 0.1372549, 1,
2.011202, -0.2751578, 1.165315, 1, 0, 0.1333333, 1,
2.01568, -0.3081649, 2.632949, 1, 0, 0.1254902, 1,
2.047334, 0.03902296, 0.7291757, 1, 0, 0.1215686, 1,
2.09587, 0.1916461, 3.400525, 1, 0, 0.1137255, 1,
2.102445, -1.164606, 2.519525, 1, 0, 0.1098039, 1,
2.103976, 0.7129432, 1.560539, 1, 0, 0.1019608, 1,
2.107218, -1.120355, 1.252663, 1, 0, 0.09411765, 1,
2.109237, 0.7360768, 1.67307, 1, 0, 0.09019608, 1,
2.128388, -1.277041, 1.872203, 1, 0, 0.08235294, 1,
2.142009, -0.06588456, -0.5926446, 1, 0, 0.07843138, 1,
2.188195, 0.6908485, 1.541056, 1, 0, 0.07058824, 1,
2.21059, -0.5258654, 2.408235, 1, 0, 0.06666667, 1,
2.26333, 0.2010094, 1.547127, 1, 0, 0.05882353, 1,
2.264751, -1.01457, 2.410068, 1, 0, 0.05490196, 1,
2.314346, -2.388924, 2.101022, 1, 0, 0.04705882, 1,
2.383737, 1.602689, 3.998862, 1, 0, 0.04313726, 1,
2.39408, -1.149108, 2.406142, 1, 0, 0.03529412, 1,
2.415817, 0.7121204, 1.478552, 1, 0, 0.03137255, 1,
2.590631, 1.974428, -0.4665165, 1, 0, 0.02352941, 1,
2.629743, -0.9563627, 2.066965, 1, 0, 0.01960784, 1,
2.687406, 1.235782, 0.3481131, 1, 0, 0.01176471, 1,
3.459404, -0.3970807, 2.628645, 1, 0, 0.007843138, 1
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
0.320166, -3.660159, -7.029197, 0, -0.5, 0.5, 0.5,
0.320166, -3.660159, -7.029197, 1, -0.5, 0.5, 0.5,
0.320166, -3.660159, -7.029197, 1, 1.5, 0.5, 0.5,
0.320166, -3.660159, -7.029197, 0, 1.5, 0.5, 0.5
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
-3.883274, 0.4039558, -7.029197, 0, -0.5, 0.5, 0.5,
-3.883274, 0.4039558, -7.029197, 1, -0.5, 0.5, 0.5,
-3.883274, 0.4039558, -7.029197, 1, 1.5, 0.5, 0.5,
-3.883274, 0.4039558, -7.029197, 0, 1.5, 0.5, 0.5
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
-3.883274, -3.660159, 0.1675501, 0, -0.5, 0.5, 0.5,
-3.883274, -3.660159, 0.1675501, 1, -0.5, 0.5, 0.5,
-3.883274, -3.660159, 0.1675501, 1, 1.5, 0.5, 0.5,
-3.883274, -3.660159, 0.1675501, 0, 1.5, 0.5, 0.5
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
-2, -2.722286, -5.368409,
3, -2.722286, -5.368409,
-2, -2.722286, -5.368409,
-2, -2.878598, -5.645207,
-1, -2.722286, -5.368409,
-1, -2.878598, -5.645207,
0, -2.722286, -5.368409,
0, -2.878598, -5.645207,
1, -2.722286, -5.368409,
1, -2.878598, -5.645207,
2, -2.722286, -5.368409,
2, -2.878598, -5.645207,
3, -2.722286, -5.368409,
3, -2.878598, -5.645207
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
-2, -3.191222, -6.198803, 0, -0.5, 0.5, 0.5,
-2, -3.191222, -6.198803, 1, -0.5, 0.5, 0.5,
-2, -3.191222, -6.198803, 1, 1.5, 0.5, 0.5,
-2, -3.191222, -6.198803, 0, 1.5, 0.5, 0.5,
-1, -3.191222, -6.198803, 0, -0.5, 0.5, 0.5,
-1, -3.191222, -6.198803, 1, -0.5, 0.5, 0.5,
-1, -3.191222, -6.198803, 1, 1.5, 0.5, 0.5,
-1, -3.191222, -6.198803, 0, 1.5, 0.5, 0.5,
0, -3.191222, -6.198803, 0, -0.5, 0.5, 0.5,
0, -3.191222, -6.198803, 1, -0.5, 0.5, 0.5,
0, -3.191222, -6.198803, 1, 1.5, 0.5, 0.5,
0, -3.191222, -6.198803, 0, 1.5, 0.5, 0.5,
1, -3.191222, -6.198803, 0, -0.5, 0.5, 0.5,
1, -3.191222, -6.198803, 1, -0.5, 0.5, 0.5,
1, -3.191222, -6.198803, 1, 1.5, 0.5, 0.5,
1, -3.191222, -6.198803, 0, 1.5, 0.5, 0.5,
2, -3.191222, -6.198803, 0, -0.5, 0.5, 0.5,
2, -3.191222, -6.198803, 1, -0.5, 0.5, 0.5,
2, -3.191222, -6.198803, 1, 1.5, 0.5, 0.5,
2, -3.191222, -6.198803, 0, 1.5, 0.5, 0.5,
3, -3.191222, -6.198803, 0, -0.5, 0.5, 0.5,
3, -3.191222, -6.198803, 1, -0.5, 0.5, 0.5,
3, -3.191222, -6.198803, 1, 1.5, 0.5, 0.5,
3, -3.191222, -6.198803, 0, 1.5, 0.5, 0.5
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
-2.91325, -2, -5.368409,
-2.91325, 3, -5.368409,
-2.91325, -2, -5.368409,
-3.07492, -2, -5.645207,
-2.91325, -1, -5.368409,
-3.07492, -1, -5.645207,
-2.91325, 0, -5.368409,
-3.07492, 0, -5.645207,
-2.91325, 1, -5.368409,
-3.07492, 1, -5.645207,
-2.91325, 2, -5.368409,
-3.07492, 2, -5.645207,
-2.91325, 3, -5.368409,
-3.07492, 3, -5.645207
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
-3.398262, -2, -6.198803, 0, -0.5, 0.5, 0.5,
-3.398262, -2, -6.198803, 1, -0.5, 0.5, 0.5,
-3.398262, -2, -6.198803, 1, 1.5, 0.5, 0.5,
-3.398262, -2, -6.198803, 0, 1.5, 0.5, 0.5,
-3.398262, -1, -6.198803, 0, -0.5, 0.5, 0.5,
-3.398262, -1, -6.198803, 1, -0.5, 0.5, 0.5,
-3.398262, -1, -6.198803, 1, 1.5, 0.5, 0.5,
-3.398262, -1, -6.198803, 0, 1.5, 0.5, 0.5,
-3.398262, 0, -6.198803, 0, -0.5, 0.5, 0.5,
-3.398262, 0, -6.198803, 1, -0.5, 0.5, 0.5,
-3.398262, 0, -6.198803, 1, 1.5, 0.5, 0.5,
-3.398262, 0, -6.198803, 0, 1.5, 0.5, 0.5,
-3.398262, 1, -6.198803, 0, -0.5, 0.5, 0.5,
-3.398262, 1, -6.198803, 1, -0.5, 0.5, 0.5,
-3.398262, 1, -6.198803, 1, 1.5, 0.5, 0.5,
-3.398262, 1, -6.198803, 0, 1.5, 0.5, 0.5,
-3.398262, 2, -6.198803, 0, -0.5, 0.5, 0.5,
-3.398262, 2, -6.198803, 1, -0.5, 0.5, 0.5,
-3.398262, 2, -6.198803, 1, 1.5, 0.5, 0.5,
-3.398262, 2, -6.198803, 0, 1.5, 0.5, 0.5,
-3.398262, 3, -6.198803, 0, -0.5, 0.5, 0.5,
-3.398262, 3, -6.198803, 1, -0.5, 0.5, 0.5,
-3.398262, 3, -6.198803, 1, 1.5, 0.5, 0.5,
-3.398262, 3, -6.198803, 0, 1.5, 0.5, 0.5
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
-2.91325, -2.722286, -4,
-2.91325, -2.722286, 4,
-2.91325, -2.722286, -4,
-3.07492, -2.878598, -4,
-2.91325, -2.722286, -2,
-3.07492, -2.878598, -2,
-2.91325, -2.722286, 0,
-3.07492, -2.878598, 0,
-2.91325, -2.722286, 2,
-3.07492, -2.878598, 2,
-2.91325, -2.722286, 4,
-3.07492, -2.878598, 4
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
-3.398262, -3.191222, -4, 0, -0.5, 0.5, 0.5,
-3.398262, -3.191222, -4, 1, -0.5, 0.5, 0.5,
-3.398262, -3.191222, -4, 1, 1.5, 0.5, 0.5,
-3.398262, -3.191222, -4, 0, 1.5, 0.5, 0.5,
-3.398262, -3.191222, -2, 0, -0.5, 0.5, 0.5,
-3.398262, -3.191222, -2, 1, -0.5, 0.5, 0.5,
-3.398262, -3.191222, -2, 1, 1.5, 0.5, 0.5,
-3.398262, -3.191222, -2, 0, 1.5, 0.5, 0.5,
-3.398262, -3.191222, 0, 0, -0.5, 0.5, 0.5,
-3.398262, -3.191222, 0, 1, -0.5, 0.5, 0.5,
-3.398262, -3.191222, 0, 1, 1.5, 0.5, 0.5,
-3.398262, -3.191222, 0, 0, 1.5, 0.5, 0.5,
-3.398262, -3.191222, 2, 0, -0.5, 0.5, 0.5,
-3.398262, -3.191222, 2, 1, -0.5, 0.5, 0.5,
-3.398262, -3.191222, 2, 1, 1.5, 0.5, 0.5,
-3.398262, -3.191222, 2, 0, 1.5, 0.5, 0.5,
-3.398262, -3.191222, 4, 0, -0.5, 0.5, 0.5,
-3.398262, -3.191222, 4, 1, -0.5, 0.5, 0.5,
-3.398262, -3.191222, 4, 1, 1.5, 0.5, 0.5,
-3.398262, -3.191222, 4, 0, 1.5, 0.5, 0.5
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
-2.91325, -2.722286, -5.368409,
-2.91325, 3.530198, -5.368409,
-2.91325, -2.722286, 5.703509,
-2.91325, 3.530198, 5.703509,
-2.91325, -2.722286, -5.368409,
-2.91325, -2.722286, 5.703509,
-2.91325, 3.530198, -5.368409,
-2.91325, 3.530198, 5.703509,
-2.91325, -2.722286, -5.368409,
3.553582, -2.722286, -5.368409,
-2.91325, -2.722286, 5.703509,
3.553582, -2.722286, 5.703509,
-2.91325, 3.530198, -5.368409,
3.553582, 3.530198, -5.368409,
-2.91325, 3.530198, 5.703509,
3.553582, 3.530198, 5.703509,
3.553582, -2.722286, -5.368409,
3.553582, 3.530198, -5.368409,
3.553582, -2.722286, 5.703509,
3.553582, 3.530198, 5.703509,
3.553582, -2.722286, -5.368409,
3.553582, -2.722286, 5.703509,
3.553582, 3.530198, -5.368409,
3.553582, 3.530198, 5.703509
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
var radius = 7.617432;
var distance = 33.89082;
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
mvMatrix.translate( -0.320166, -0.4039558, -0.1675501 );
mvMatrix.scale( 1.273594, 1.317255, 0.7438744 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.89082);
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
S-Ethyl_diisobutylth<-read.table("S-Ethyl_diisobutylth.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-S-Ethyl_diisobutylth$V2
```

```
## Error in eval(expr, envir, enclos): object 'S' not found
```

```r
y<-S-Ethyl_diisobutylth$V3
```

```
## Error in eval(expr, envir, enclos): object 'S' not found
```

```r
z<-S-Ethyl_diisobutylth$V4
```

```
## Error in eval(expr, envir, enclos): object 'S' not found
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
-2.819072, -1.503943, -2.150437, 0, 0, 1, 1, 1,
-2.501825, 2.024769, -1.532331, 1, 0, 0, 1, 1,
-2.48003, -0.5674583, -0.7447475, 1, 0, 0, 1, 1,
-2.31426, -0.8138161, -1.69208, 1, 0, 0, 1, 1,
-2.312422, 2.15333, -0.7275758, 1, 0, 0, 1, 1,
-2.284038, 1.317823, -1.38719, 1, 0, 0, 1, 1,
-2.261451, 0.5643724, -1.377524, 0, 0, 0, 1, 1,
-2.250706, 2.438953, 1.265218, 0, 0, 0, 1, 1,
-2.234354, -1.290574, -2.705958, 0, 0, 0, 1, 1,
-2.233141, 1.158689, -1.102287, 0, 0, 0, 1, 1,
-2.214908, 0.2988901, -1.944728, 0, 0, 0, 1, 1,
-2.173274, -0.7027441, -1.928233, 0, 0, 0, 1, 1,
-2.042084, -1.006785, -2.007465, 0, 0, 0, 1, 1,
-2.014067, 0.09077115, -1.347182, 1, 1, 1, 1, 1,
-2.00615, -1.22497, -1.936246, 1, 1, 1, 1, 1,
-1.973886, 0.4662387, -1.974525, 1, 1, 1, 1, 1,
-1.972899, 0.5224202, -0.3313864, 1, 1, 1, 1, 1,
-1.960784, -1.471793, -2.22969, 1, 1, 1, 1, 1,
-1.92559, 0.3718733, -0.8074067, 1, 1, 1, 1, 1,
-1.877403, 1.164427, -1.313666, 1, 1, 1, 1, 1,
-1.855765, 1.436832, -1.148466, 1, 1, 1, 1, 1,
-1.852624, 0.8019527, -0.7514377, 1, 1, 1, 1, 1,
-1.852548, 1.917216, 1.715846, 1, 1, 1, 1, 1,
-1.837702, 0.5064938, -0.6379498, 1, 1, 1, 1, 1,
-1.836638, 0.3775114, -0.04552219, 1, 1, 1, 1, 1,
-1.807944, 0.1646039, -1.413655, 1, 1, 1, 1, 1,
-1.795381, -0.288197, 0.4284529, 1, 1, 1, 1, 1,
-1.784851, -1.339672, -2.002143, 1, 1, 1, 1, 1,
-1.783691, 0.4648194, -2.246213, 0, 0, 1, 1, 1,
-1.781967, -0.3767305, -1.690853, 1, 0, 0, 1, 1,
-1.774488, 1.590103, -1.061972, 1, 0, 0, 1, 1,
-1.76443, -1.169715, -2.764411, 1, 0, 0, 1, 1,
-1.732665, 0.4062917, -2.259491, 1, 0, 0, 1, 1,
-1.729669, -0.4128796, -2.427586, 1, 0, 0, 1, 1,
-1.702981, -1.125791, -3.327606, 0, 0, 0, 1, 1,
-1.702461, -1.875351, -3.16417, 0, 0, 0, 1, 1,
-1.67029, -0.3417198, -1.176603, 0, 0, 0, 1, 1,
-1.648616, -1.141873, -1.319538, 0, 0, 0, 1, 1,
-1.640262, -0.242425, -2.659856, 0, 0, 0, 1, 1,
-1.614654, -1.060684, -1.894492, 0, 0, 0, 1, 1,
-1.613529, 0.1224458, -0.5717865, 0, 0, 0, 1, 1,
-1.605273, 0.7803132, -0.8732322, 1, 1, 1, 1, 1,
-1.597628, 0.2757768, -0.697907, 1, 1, 1, 1, 1,
-1.587, -0.5924808, 0.754129, 1, 1, 1, 1, 1,
-1.571555, -1.432968, -2.617578, 1, 1, 1, 1, 1,
-1.56942, 0.5950042, -1.9272, 1, 1, 1, 1, 1,
-1.547325, -0.05988465, -2.331536, 1, 1, 1, 1, 1,
-1.546059, -1.360237, -0.0371889, 1, 1, 1, 1, 1,
-1.541726, -0.3741415, -2.530155, 1, 1, 1, 1, 1,
-1.536886, -0.8081763, -3.215874, 1, 1, 1, 1, 1,
-1.529259, -0.1837969, -2.053687, 1, 1, 1, 1, 1,
-1.516281, -0.3449164, -1.373357, 1, 1, 1, 1, 1,
-1.509342, -1.777886, -3.067095, 1, 1, 1, 1, 1,
-1.503808, 2.535616, 0.3155107, 1, 1, 1, 1, 1,
-1.501714, -0.4851138, -1.671711, 1, 1, 1, 1, 1,
-1.500762, -2.626303, -2.502882, 1, 1, 1, 1, 1,
-1.49611, -0.3399587, -2.044442, 0, 0, 1, 1, 1,
-1.489231, 0.2218756, -2.561883, 1, 0, 0, 1, 1,
-1.485183, 0.8991253, -0.03128487, 1, 0, 0, 1, 1,
-1.467958, -0.7505411, -0.7676806, 1, 0, 0, 1, 1,
-1.466298, -1.554539, -2.949689, 1, 0, 0, 1, 1,
-1.462991, 0.5425128, -1.858253, 1, 0, 0, 1, 1,
-1.453818, 0.9617805, -1.423497, 0, 0, 0, 1, 1,
-1.452989, 0.9305159, 0.6215385, 0, 0, 0, 1, 1,
-1.447673, 1.607039, -2.371624, 0, 0, 0, 1, 1,
-1.434414, 1.221915, -1.115021, 0, 0, 0, 1, 1,
-1.425536, -0.259461, -1.276767, 0, 0, 0, 1, 1,
-1.393869, -2.545164, -1.766751, 0, 0, 0, 1, 1,
-1.393536, 0.5500011, -0.7942669, 0, 0, 0, 1, 1,
-1.3902, -0.3823365, -2.261717, 1, 1, 1, 1, 1,
-1.377914, -1.110847, -1.935948, 1, 1, 1, 1, 1,
-1.366744, 0.1469361, -1.929883, 1, 1, 1, 1, 1,
-1.359977, 0.0623596, -0.9208789, 1, 1, 1, 1, 1,
-1.344399, -0.2089282, -2.262305, 1, 1, 1, 1, 1,
-1.343947, -2.040807, -2.163574, 1, 1, 1, 1, 1,
-1.330618, -0.03932561, -2.468109, 1, 1, 1, 1, 1,
-1.327436, -0.6267609, -1.873021, 1, 1, 1, 1, 1,
-1.325092, -1.858757, -2.025661, 1, 1, 1, 1, 1,
-1.314174, 0.4660059, -1.238824, 1, 1, 1, 1, 1,
-1.290281, 0.9165111, -1.3669, 1, 1, 1, 1, 1,
-1.287065, 0.7338158, -2.468791, 1, 1, 1, 1, 1,
-1.27318, 1.868171, -0.3804078, 1, 1, 1, 1, 1,
-1.272208, 0.4050356, -1.00384, 1, 1, 1, 1, 1,
-1.269947, 0.1439819, -2.636778, 1, 1, 1, 1, 1,
-1.267582, 0.001451646, -2.66513, 0, 0, 1, 1, 1,
-1.263806, -0.6568241, -1.304552, 1, 0, 0, 1, 1,
-1.263304, -1.044208, -1.416931, 1, 0, 0, 1, 1,
-1.262148, 3.439142, 0.4995329, 1, 0, 0, 1, 1,
-1.26178, 1.053308, -0.7882088, 1, 0, 0, 1, 1,
-1.254979, 2.34967, -0.8563356, 1, 0, 0, 1, 1,
-1.253018, 0.2382268, -0.2434109, 0, 0, 0, 1, 1,
-1.250124, -1.149518, -3.319448, 0, 0, 0, 1, 1,
-1.249581, -0.3349069, -3.303717, 0, 0, 0, 1, 1,
-1.245148, -1.037336, -1.860139, 0, 0, 0, 1, 1,
-1.238989, 0.04026309, -2.913399, 0, 0, 0, 1, 1,
-1.233208, 1.46646, -0.4883604, 0, 0, 0, 1, 1,
-1.22645, 0.3064179, -3.370209, 0, 0, 0, 1, 1,
-1.226019, -0.4811743, -2.553651, 1, 1, 1, 1, 1,
-1.216904, -0.4479555, -2.578941, 1, 1, 1, 1, 1,
-1.216096, -0.4890021, -0.2409473, 1, 1, 1, 1, 1,
-1.208034, -0.7455765, -1.805091, 1, 1, 1, 1, 1,
-1.207412, -0.3511259, -2.104119, 1, 1, 1, 1, 1,
-1.202182, 0.4052044, -0.7422795, 1, 1, 1, 1, 1,
-1.201005, -1.114965, -2.067514, 1, 1, 1, 1, 1,
-1.18213, 0.4342118, -0.7858605, 1, 1, 1, 1, 1,
-1.177854, -0.01600764, -2.365687, 1, 1, 1, 1, 1,
-1.170942, -0.2665953, -3.035562, 1, 1, 1, 1, 1,
-1.168223, 0.2966638, -1.718734, 1, 1, 1, 1, 1,
-1.167437, -0.9389895, -2.902811, 1, 1, 1, 1, 1,
-1.166178, -1.639399, -1.941734, 1, 1, 1, 1, 1,
-1.165562, 0.3191233, -2.15917, 1, 1, 1, 1, 1,
-1.163197, 1.834364, 0.374394, 1, 1, 1, 1, 1,
-1.163026, -0.3489421, -3.184139, 0, 0, 1, 1, 1,
-1.160745, -0.4881262, -0.6146922, 1, 0, 0, 1, 1,
-1.159181, 0.8804753, -3.112071, 1, 0, 0, 1, 1,
-1.158525, 0.0005426104, -1.148333, 1, 0, 0, 1, 1,
-1.155006, -0.2833735, -1.017227, 1, 0, 0, 1, 1,
-1.15455, -0.4806066, -0.7249628, 1, 0, 0, 1, 1,
-1.150677, 1.037057, -1.315448, 0, 0, 0, 1, 1,
-1.149943, 0.4182864, -1.384451, 0, 0, 0, 1, 1,
-1.149246, 0.1135832, -1.154732, 0, 0, 0, 1, 1,
-1.146425, -0.07234515, -2.864567, 0, 0, 0, 1, 1,
-1.145008, 0.2779717, -3.059438, 0, 0, 0, 1, 1,
-1.137323, -1.508504, -2.575137, 0, 0, 0, 1, 1,
-1.135185, -0.3009236, -2.005068, 0, 0, 0, 1, 1,
-1.133883, 0.9385381, 1.734753, 1, 1, 1, 1, 1,
-1.112563, 2.034112, -0.09507284, 1, 1, 1, 1, 1,
-1.110332, -0.04874839, -1.1538, 1, 1, 1, 1, 1,
-1.108312, 1.097775, -0.01519318, 1, 1, 1, 1, 1,
-1.096712, 0.8967717, 0.1058561, 1, 1, 1, 1, 1,
-1.08521, -2.101503, -2.211119, 1, 1, 1, 1, 1,
-1.082226, 0.8901614, -1.122625, 1, 1, 1, 1, 1,
-1.074411, -1.659557, -2.100936, 1, 1, 1, 1, 1,
-1.072876, 0.4051219, -2.114155, 1, 1, 1, 1, 1,
-1.065857, 0.7143648, -1.057544, 1, 1, 1, 1, 1,
-1.063964, 0.358531, -1.335788, 1, 1, 1, 1, 1,
-1.045398, -1.128709, -2.909143, 1, 1, 1, 1, 1,
-1.044877, 0.5022863, -0.6790578, 1, 1, 1, 1, 1,
-1.043653, -1.109881, -3.425534, 1, 1, 1, 1, 1,
-1.038148, 0.2533967, -2.565116, 1, 1, 1, 1, 1,
-1.034895, -1.259989, -2.137757, 0, 0, 1, 1, 1,
-1.033997, 0.4969365, -1.429711, 1, 0, 0, 1, 1,
-1.027643, -1.487186, -3.377789, 1, 0, 0, 1, 1,
-1.026286, 0.6589625, -0.9861514, 1, 0, 0, 1, 1,
-1.022424, -2.592283, -2.638488, 1, 0, 0, 1, 1,
-1.020508, 2.295824, 0.01913631, 1, 0, 0, 1, 1,
-1.019074, 0.7229957, -2.269672, 0, 0, 0, 1, 1,
-1.018231, -0.376743, -4.573457, 0, 0, 0, 1, 1,
-1.00703, -0.8735301, -2.78328, 0, 0, 0, 1, 1,
-1.005947, -0.6796661, -2.254623, 0, 0, 0, 1, 1,
-1.005716, -0.6842296, -2.609582, 0, 0, 0, 1, 1,
-1.003149, 0.9733367, -0.4817031, 0, 0, 0, 1, 1,
-1.000267, -0.8632882, -0.3343068, 0, 0, 0, 1, 1,
-0.9976613, 0.2053586, -0.8586582, 1, 1, 1, 1, 1,
-0.9967666, 1.132067, -1.818155, 1, 1, 1, 1, 1,
-0.993576, 0.02424152, -1.996953, 1, 1, 1, 1, 1,
-0.992425, 0.1300897, -0.8992596, 1, 1, 1, 1, 1,
-0.9916391, -1.371135, -2.939497, 1, 1, 1, 1, 1,
-0.9908658, 0.4444922, -0.5397757, 1, 1, 1, 1, 1,
-0.9849237, 0.710943, 0.427332, 1, 1, 1, 1, 1,
-0.9818863, 1.209518, -1.69632, 1, 1, 1, 1, 1,
-0.9726706, -1.519796, -2.443008, 1, 1, 1, 1, 1,
-0.9704672, 0.7362903, -1.941376, 1, 1, 1, 1, 1,
-0.9686392, -0.1282071, -1.313753, 1, 1, 1, 1, 1,
-0.9662762, 1.827368, -2.350958, 1, 1, 1, 1, 1,
-0.9608306, 0.06602813, -1.497638, 1, 1, 1, 1, 1,
-0.9596131, -2.193041, -3.369837, 1, 1, 1, 1, 1,
-0.9579269, 0.7495766, 0.6407847, 1, 1, 1, 1, 1,
-0.9570609, 1.343793, 0.1726452, 0, 0, 1, 1, 1,
-0.9532303, 0.281408, -1.949143, 1, 0, 0, 1, 1,
-0.9520487, 0.9372588, 0.5124934, 1, 0, 0, 1, 1,
-0.9438481, -0.4925573, -3.419571, 1, 0, 0, 1, 1,
-0.9423214, 0.4435914, -0.9424384, 1, 0, 0, 1, 1,
-0.9401489, 1.423198, 0.7762706, 1, 0, 0, 1, 1,
-0.9345353, 0.4073439, -1.240965, 0, 0, 0, 1, 1,
-0.9313337, 0.5569283, -0.6695864, 0, 0, 0, 1, 1,
-0.9270814, 0.1891297, 0.1130279, 0, 0, 0, 1, 1,
-0.9265248, 0.6556129, -1.182968, 0, 0, 0, 1, 1,
-0.9250959, 0.0007907925, -0.1253704, 0, 0, 0, 1, 1,
-0.9169284, 1.216996, -1.242031, 0, 0, 0, 1, 1,
-0.9152192, 1.235515, -1.003802, 0, 0, 0, 1, 1,
-0.9056773, -0.999315, -3.862796, 1, 1, 1, 1, 1,
-0.9045248, -1.906274, -1.245296, 1, 1, 1, 1, 1,
-0.8984472, -0.6603987, -1.955138, 1, 1, 1, 1, 1,
-0.8885259, 0.8497981, -0.3593516, 1, 1, 1, 1, 1,
-0.8879347, 0.4817597, -2.004828, 1, 1, 1, 1, 1,
-0.8871019, 0.5517831, -3.078416, 1, 1, 1, 1, 1,
-0.8868308, 1.159317, -1.580205, 1, 1, 1, 1, 1,
-0.8775051, -0.08734124, -2.186612, 1, 1, 1, 1, 1,
-0.8764826, -0.951495, -1.842247, 1, 1, 1, 1, 1,
-0.8721492, -0.6529152, -1.168104, 1, 1, 1, 1, 1,
-0.8582178, -0.07879764, -2.695717, 1, 1, 1, 1, 1,
-0.8544915, -0.2871505, -3.433162, 1, 1, 1, 1, 1,
-0.8542086, -2.063804, -3.416858, 1, 1, 1, 1, 1,
-0.8518062, -0.8191396, -1.936198, 1, 1, 1, 1, 1,
-0.8433836, -0.6025483, -0.4988107, 1, 1, 1, 1, 1,
-0.841194, 0.6855415, -0.8456791, 0, 0, 1, 1, 1,
-0.8397278, -1.289329, -3.552682, 1, 0, 0, 1, 1,
-0.8360124, 0.5323949, -1.582533, 1, 0, 0, 1, 1,
-0.8309833, 0.6034051, -1.837646, 1, 0, 0, 1, 1,
-0.8298229, 0.01136304, -1.733002, 1, 0, 0, 1, 1,
-0.8259343, -0.1213686, -1.963968, 1, 0, 0, 1, 1,
-0.8255008, 0.7063377, -0.4495669, 0, 0, 0, 1, 1,
-0.8254631, -1.560772, -2.444004, 0, 0, 0, 1, 1,
-0.8246651, -1.175979, -1.965253, 0, 0, 0, 1, 1,
-0.8212272, 0.1984904, 0.3724335, 0, 0, 0, 1, 1,
-0.8182925, -0.3647584, -0.8987388, 0, 0, 0, 1, 1,
-0.8152733, 1.090214, -1.28092, 0, 0, 0, 1, 1,
-0.8088398, 0.4941351, 0.5868264, 0, 0, 0, 1, 1,
-0.8039963, -0.6689849, -1.73815, 1, 1, 1, 1, 1,
-0.8013699, 0.4285278, -1.20967, 1, 1, 1, 1, 1,
-0.7969757, -1.401487, -3.041217, 1, 1, 1, 1, 1,
-0.7966259, 0.1135045, -1.213631, 1, 1, 1, 1, 1,
-0.7950826, -0.7871439, -2.762175, 1, 1, 1, 1, 1,
-0.7936579, -0.5174327, -1.985873, 1, 1, 1, 1, 1,
-0.7907699, 0.2778569, 0.08023591, 1, 1, 1, 1, 1,
-0.7899816, -1.025544, -3.033791, 1, 1, 1, 1, 1,
-0.7899727, -0.07935803, -0.2593386, 1, 1, 1, 1, 1,
-0.7890721, 1.393371, -0.9688671, 1, 1, 1, 1, 1,
-0.7886328, -1.831506, -3.820162, 1, 1, 1, 1, 1,
-0.7867771, 0.9330319, -0.4428406, 1, 1, 1, 1, 1,
-0.7863786, -0.904682, -2.015819, 1, 1, 1, 1, 1,
-0.7757332, -1.539443, -1.652696, 1, 1, 1, 1, 1,
-0.7753415, 2.479318, -2.078523, 1, 1, 1, 1, 1,
-0.7739538, 1.1729, 0.250348, 0, 0, 1, 1, 1,
-0.768137, -0.3553749, -1.431883, 1, 0, 0, 1, 1,
-0.7570868, 1.323362, -0.6699854, 1, 0, 0, 1, 1,
-0.7511823, 0.9417517, -0.01911417, 1, 0, 0, 1, 1,
-0.7511479, 3.091882, 1.219607, 1, 0, 0, 1, 1,
-0.743423, 0.4316947, -2.795413, 1, 0, 0, 1, 1,
-0.7422699, 0.9132736, 1.153036, 0, 0, 0, 1, 1,
-0.7412091, -0.8292266, -3.702034, 0, 0, 0, 1, 1,
-0.7388801, -0.2212535, -0.427366, 0, 0, 0, 1, 1,
-0.7378998, -0.2278774, -1.298644, 0, 0, 0, 1, 1,
-0.7377627, -0.5067274, -2.880264, 0, 0, 0, 1, 1,
-0.735367, -0.1222868, -3.147489, 0, 0, 0, 1, 1,
-0.7331599, -0.2507332, -1.252416, 0, 0, 0, 1, 1,
-0.7276857, -0.3342106, -1.753822, 1, 1, 1, 1, 1,
-0.7183937, 0.9547608, 0.7311421, 1, 1, 1, 1, 1,
-0.716146, -1.129766, -2.400201, 1, 1, 1, 1, 1,
-0.7132583, 0.2100107, -0.07883962, 1, 1, 1, 1, 1,
-0.7075742, 0.9772382, -0.9555764, 1, 1, 1, 1, 1,
-0.7033341, -0.296412, -2.446987, 1, 1, 1, 1, 1,
-0.703045, -0.06063597, -0.9901724, 1, 1, 1, 1, 1,
-0.6996397, 1.26267, -1.574653, 1, 1, 1, 1, 1,
-0.6947685, 0.6063117, -0.851478, 1, 1, 1, 1, 1,
-0.6933132, 0.08323378, -1.962692, 1, 1, 1, 1, 1,
-0.6922783, 0.9463598, -0.6426664, 1, 1, 1, 1, 1,
-0.6839605, 0.7258741, -0.6343428, 1, 1, 1, 1, 1,
-0.6834538, -1.625668, -3.957392, 1, 1, 1, 1, 1,
-0.6674392, 0.9993202, -1.426908, 1, 1, 1, 1, 1,
-0.6634583, -0.7904087, -2.456569, 1, 1, 1, 1, 1,
-0.6608861, 0.08298288, -0.6476282, 0, 0, 1, 1, 1,
-0.659743, -0.8152274, -3.931151, 1, 0, 0, 1, 1,
-0.6589422, -0.1704387, -3.356212, 1, 0, 0, 1, 1,
-0.6568878, 0.4149054, -1.126224, 1, 0, 0, 1, 1,
-0.6526614, -0.8408393, -2.787601, 1, 0, 0, 1, 1,
-0.6512629, 1.81901, -1.336799, 1, 0, 0, 1, 1,
-0.6475942, 0.005125129, -1.310349, 0, 0, 0, 1, 1,
-0.6447755, 1.412328, 0.1471265, 0, 0, 0, 1, 1,
-0.6434006, -1.437132, -2.056005, 0, 0, 0, 1, 1,
-0.6412372, 0.3357282, -0.243007, 0, 0, 0, 1, 1,
-0.6341851, -0.3729838, -5.207168, 0, 0, 0, 1, 1,
-0.6332244, -0.3085136, -1.866297, 0, 0, 0, 1, 1,
-0.6283097, -0.4821233, -1.93588, 0, 0, 0, 1, 1,
-0.6257591, -0.053047, -3.215463, 1, 1, 1, 1, 1,
-0.6245349, -0.7171074, -1.587004, 1, 1, 1, 1, 1,
-0.6197127, 0.2353463, -0.8721505, 1, 1, 1, 1, 1,
-0.6195257, -1.131789, -0.9202954, 1, 1, 1, 1, 1,
-0.6071498, -0.5159588, -2.404516, 1, 1, 1, 1, 1,
-0.6039195, 0.1245509, -1.626923, 1, 1, 1, 1, 1,
-0.6031623, -0.7117435, -2.775386, 1, 1, 1, 1, 1,
-0.5999004, 0.2105443, -0.5506305, 1, 1, 1, 1, 1,
-0.5908495, 0.5810983, -0.9492274, 1, 1, 1, 1, 1,
-0.5889721, -1.031851, -4.016119, 1, 1, 1, 1, 1,
-0.5882043, 1.245997, -2.071448, 1, 1, 1, 1, 1,
-0.5874245, -0.2080331, -2.609146, 1, 1, 1, 1, 1,
-0.5819027, -0.8007068, -2.752461, 1, 1, 1, 1, 1,
-0.5805216, -0.4836678, -3.474607, 1, 1, 1, 1, 1,
-0.5788214, -0.4823139, -1.579868, 1, 1, 1, 1, 1,
-0.5778343, 0.5754508, -0.2342882, 0, 0, 1, 1, 1,
-0.5761002, 1.936286, -0.1222935, 1, 0, 0, 1, 1,
-0.5754134, -0.865025, -1.603415, 1, 0, 0, 1, 1,
-0.5679873, 1.115143, -0.9677436, 1, 0, 0, 1, 1,
-0.5662041, 1.299188, 0.002144222, 1, 0, 0, 1, 1,
-0.5656655, -2.483783, -3.101007, 1, 0, 0, 1, 1,
-0.5632551, -0.9844553, -2.959544, 0, 0, 0, 1, 1,
-0.5613254, -0.8173755, -1.5058, 0, 0, 0, 1, 1,
-0.5583163, -1.385791, -2.87273, 0, 0, 0, 1, 1,
-0.5525683, -0.8517994, -3.602879, 0, 0, 0, 1, 1,
-0.5517651, -2.066806, -4.382091, 0, 0, 0, 1, 1,
-0.5467605, 0.7949386, 0.6876424, 0, 0, 0, 1, 1,
-0.5447314, 0.4061907, -1.644264, 0, 0, 0, 1, 1,
-0.5432853, 2.019366, 1.024228, 1, 1, 1, 1, 1,
-0.5336665, -0.4881891, -3.677778, 1, 1, 1, 1, 1,
-0.5261207, -0.04306275, -1.707818, 1, 1, 1, 1, 1,
-0.5260336, 1.026904, 1.122219, 1, 1, 1, 1, 1,
-0.5247881, -1.195911, -0.9942358, 1, 1, 1, 1, 1,
-0.5242871, -0.5957453, -4.245807, 1, 1, 1, 1, 1,
-0.5236984, 0.5633669, -1.188231, 1, 1, 1, 1, 1,
-0.5233493, 0.7035995, -0.8049387, 1, 1, 1, 1, 1,
-0.5204736, 0.6200232, -0.9957265, 1, 1, 1, 1, 1,
-0.5199658, -2.249317, -4.347188, 1, 1, 1, 1, 1,
-0.5185348, -0.4778309, -0.5761619, 1, 1, 1, 1, 1,
-0.5159939, -1.111539, -2.296129, 1, 1, 1, 1, 1,
-0.515359, -0.01570135, -1.297474, 1, 1, 1, 1, 1,
-0.5142592, -1.81641, -3.691458, 1, 1, 1, 1, 1,
-0.5096773, -0.8261103, -2.604177, 1, 1, 1, 1, 1,
-0.5059172, 1.303603, -1.167224, 0, 0, 1, 1, 1,
-0.4983558, 0.3057448, -0.8733648, 1, 0, 0, 1, 1,
-0.4983003, -1.6291, -3.989372, 1, 0, 0, 1, 1,
-0.4879536, 1.54188, 1.594145, 1, 0, 0, 1, 1,
-0.4865578, -1.163907, -2.673768, 1, 0, 0, 1, 1,
-0.4812648, -0.012811, -0.4668471, 1, 0, 0, 1, 1,
-0.4758475, -0.4391662, -3.967411, 0, 0, 0, 1, 1,
-0.463737, -1.395178, -2.665122, 0, 0, 0, 1, 1,
-0.462605, -0.6540258, -1.425781, 0, 0, 0, 1, 1,
-0.4621442, 0.1839282, -0.9504745, 0, 0, 0, 1, 1,
-0.4601806, -0.537062, -4.071142, 0, 0, 0, 1, 1,
-0.4601539, 0.2315295, -0.9472151, 0, 0, 0, 1, 1,
-0.4574035, 0.570425, 2.440725, 0, 0, 0, 1, 1,
-0.4568213, 1.690378, -0.8302957, 1, 1, 1, 1, 1,
-0.4548559, 0.1155929, -0.9690936, 1, 1, 1, 1, 1,
-0.4457331, 1.054176, 1.806976, 1, 1, 1, 1, 1,
-0.4426994, -0.3099529, -1.038314, 1, 1, 1, 1, 1,
-0.4402822, -0.353117, -2.201562, 1, 1, 1, 1, 1,
-0.4399372, 0.4734927, -0.9498376, 1, 1, 1, 1, 1,
-0.4378614, -0.1257649, -1.517826, 1, 1, 1, 1, 1,
-0.4374315, 0.3228416, -0.5280795, 1, 1, 1, 1, 1,
-0.4372102, -1.301536, -3.08475, 1, 1, 1, 1, 1,
-0.4359089, -0.7475452, -3.832254, 1, 1, 1, 1, 1,
-0.4357046, 1.068066, -1.369329, 1, 1, 1, 1, 1,
-0.434523, -0.01511659, -2.20844, 1, 1, 1, 1, 1,
-0.4324964, -0.7094544, -4.05417, 1, 1, 1, 1, 1,
-0.4280432, 0.02616918, -2.221752, 1, 1, 1, 1, 1,
-0.4279627, 0.216854, -2.164851, 1, 1, 1, 1, 1,
-0.4269404, 0.3444829, -0.6951216, 0, 0, 1, 1, 1,
-0.419293, 0.9922266, -0.08125856, 1, 0, 0, 1, 1,
-0.4191853, -1.228426, -2.897929, 1, 0, 0, 1, 1,
-0.4183785, -0.7471528, -3.617581, 1, 0, 0, 1, 1,
-0.4097245, 0.5252748, -1.809987, 1, 0, 0, 1, 1,
-0.4095766, 0.7779189, -0.2705809, 1, 0, 0, 1, 1,
-0.4093514, 0.1865705, -1.185222, 0, 0, 0, 1, 1,
-0.4085074, -0.4500356, -2.794461, 0, 0, 0, 1, 1,
-0.4050084, 1.705004, -0.494964, 0, 0, 0, 1, 1,
-0.404107, -0.1181321, -0.660326, 0, 0, 0, 1, 1,
-0.3988089, -0.04508455, -3.426871, 0, 0, 0, 1, 1,
-0.398466, -0.07932393, -1.576181, 0, 0, 0, 1, 1,
-0.3974264, -0.643748, -3.199949, 0, 0, 0, 1, 1,
-0.3951655, -1.427658, -0.2877532, 1, 1, 1, 1, 1,
-0.3938702, -0.5224444, -2.131685, 1, 1, 1, 1, 1,
-0.3935435, 0.1040564, 0.2200906, 1, 1, 1, 1, 1,
-0.3863105, -1.302283, -2.182907, 1, 1, 1, 1, 1,
-0.3855551, -1.164418, -3.444264, 1, 1, 1, 1, 1,
-0.3812031, -0.500187, -1.952759, 1, 1, 1, 1, 1,
-0.3765312, -0.2982389, -1.807544, 1, 1, 1, 1, 1,
-0.3747919, -0.05669242, -3.975316, 1, 1, 1, 1, 1,
-0.3679631, -1.631655, -2.661605, 1, 1, 1, 1, 1,
-0.3645582, -0.992879, -1.668112, 1, 1, 1, 1, 1,
-0.364517, -0.358275, -3.756151, 1, 1, 1, 1, 1,
-0.3642271, -0.6481925, -2.222212, 1, 1, 1, 1, 1,
-0.3478639, -1.749002, -3.312945, 1, 1, 1, 1, 1,
-0.3441969, -0.1988226, -3.772226, 1, 1, 1, 1, 1,
-0.3423546, 1.471683, -0.9653518, 1, 1, 1, 1, 1,
-0.3367586, -0.5879133, -1.671761, 0, 0, 1, 1, 1,
-0.3358551, 0.957408, -1.050612, 1, 0, 0, 1, 1,
-0.3336272, -0.08550843, -1.640133, 1, 0, 0, 1, 1,
-0.3319022, 0.5313389, -0.7010056, 1, 0, 0, 1, 1,
-0.3309395, -0.09510808, -1.540312, 1, 0, 0, 1, 1,
-0.3307287, 0.07396978, -2.438657, 1, 0, 0, 1, 1,
-0.3294454, -0.1297304, -2.006832, 0, 0, 0, 1, 1,
-0.3281373, 0.7122045, 0.127546, 0, 0, 0, 1, 1,
-0.3277036, 1.765613, -0.7299382, 0, 0, 0, 1, 1,
-0.3248775, 1.035889, -1.048316, 0, 0, 0, 1, 1,
-0.3232209, 1.397961, -0.4800052, 0, 0, 0, 1, 1,
-0.318212, -1.439081, -2.1398, 0, 0, 0, 1, 1,
-0.3049538, -0.8005014, -2.771337, 0, 0, 0, 1, 1,
-0.3034934, 0.09524241, -1.533756, 1, 1, 1, 1, 1,
-0.2891788, 1.299293, -0.5042033, 1, 1, 1, 1, 1,
-0.2846686, 0.1105739, -2.253035, 1, 1, 1, 1, 1,
-0.2844145, 0.06989697, -1.347772, 1, 1, 1, 1, 1,
-0.2796599, 0.8743121, -0.8044116, 1, 1, 1, 1, 1,
-0.2745602, 0.355562, 2.153867, 1, 1, 1, 1, 1,
-0.2744369, -0.724866, -2.659445, 1, 1, 1, 1, 1,
-0.2691237, 0.4869734, -0.4478671, 1, 1, 1, 1, 1,
-0.2687785, -0.350963, -3.082731, 1, 1, 1, 1, 1,
-0.2678326, 1.572108, -1.907964, 1, 1, 1, 1, 1,
-0.2557431, -1.247798, -2.025466, 1, 1, 1, 1, 1,
-0.2552786, -1.178554, -3.565707, 1, 1, 1, 1, 1,
-0.2546292, 0.98457, 0.1240427, 1, 1, 1, 1, 1,
-0.2542327, -0.5730472, -2.706791, 1, 1, 1, 1, 1,
-0.2526767, -1.665396, -2.479279, 1, 1, 1, 1, 1,
-0.2524435, 1.517282, 2.02153, 0, 0, 1, 1, 1,
-0.2513472, -0.5895327, -0.6998786, 1, 0, 0, 1, 1,
-0.2504755, -0.8604985, -3.215706, 1, 0, 0, 1, 1,
-0.2501645, -2.357642, -3.653063, 1, 0, 0, 1, 1,
-0.250159, 0.1757757, -2.108175, 1, 0, 0, 1, 1,
-0.2498748, -1.105472, -1.229422, 1, 0, 0, 1, 1,
-0.2458373, 2.09906, 0.00771384, 0, 0, 0, 1, 1,
-0.243636, -0.4710077, -2.303283, 0, 0, 0, 1, 1,
-0.2421316, -1.749813, -2.798684, 0, 0, 0, 1, 1,
-0.2413351, 0.2609198, -1.463087, 0, 0, 0, 1, 1,
-0.2394419, -0.7532595, -4.246813, 0, 0, 0, 1, 1,
-0.2386119, -0.7376796, -1.30625, 0, 0, 0, 1, 1,
-0.2381553, -0.3532175, -3.507531, 0, 0, 0, 1, 1,
-0.2375644, 1.50494, -0.1802667, 1, 1, 1, 1, 1,
-0.2351499, 0.8143475, 1.592122, 1, 1, 1, 1, 1,
-0.2316176, 0.6241063, -2.793719, 1, 1, 1, 1, 1,
-0.2266365, 0.265783, -0.5147143, 1, 1, 1, 1, 1,
-0.2239685, -0.2017225, -3.025113, 1, 1, 1, 1, 1,
-0.221654, 0.7271142, 0.08352634, 1, 1, 1, 1, 1,
-0.2170427, 1.649341, -0.8310311, 1, 1, 1, 1, 1,
-0.2161793, 0.003472722, -0.3495523, 1, 1, 1, 1, 1,
-0.2132956, 0.3793192, 1.989483, 1, 1, 1, 1, 1,
-0.2055123, -0.9010747, -2.805142, 1, 1, 1, 1, 1,
-0.2010385, -0.7039625, -2.438573, 1, 1, 1, 1, 1,
-0.1985575, -1.77834, -4.200746, 1, 1, 1, 1, 1,
-0.1966429, -1.18658, -3.198119, 1, 1, 1, 1, 1,
-0.1941557, 0.9791569, -1.115088, 1, 1, 1, 1, 1,
-0.1929567, -0.2045836, -1.353983, 1, 1, 1, 1, 1,
-0.1925047, -0.8990055, -2.08602, 0, 0, 1, 1, 1,
-0.1880598, -0.2309082, -4.492547, 1, 0, 0, 1, 1,
-0.1866823, 1.168424, -1.714226, 1, 0, 0, 1, 1,
-0.1856358, 1.579965, 1.964844, 1, 0, 0, 1, 1,
-0.182384, -0.8329686, -2.028363, 1, 0, 0, 1, 1,
-0.1816569, 0.4740845, -1.402754, 1, 0, 0, 1, 1,
-0.1799982, 0.8115854, 0.918982, 0, 0, 0, 1, 1,
-0.1782691, -0.6030674, -4.009934, 0, 0, 0, 1, 1,
-0.176897, -0.08934966, -1.255092, 0, 0, 0, 1, 1,
-0.1751963, -0.2023584, -1.626513, 0, 0, 0, 1, 1,
-0.1751396, 0.5169468, 0.5809541, 0, 0, 0, 1, 1,
-0.168904, 0.7703283, -0.4731566, 0, 0, 0, 1, 1,
-0.1685687, -1.937796, -2.0809, 0, 0, 0, 1, 1,
-0.168038, 1.819269, 1.049983, 1, 1, 1, 1, 1,
-0.1652853, -2.197728, -2.888918, 1, 1, 1, 1, 1,
-0.1641715, -1.088357, -3.992326, 1, 1, 1, 1, 1,
-0.1629032, 1.458739, -1.742471, 1, 1, 1, 1, 1,
-0.1601054, 0.4318037, -0.1618273, 1, 1, 1, 1, 1,
-0.1562616, 0.2453846, -1.401474, 1, 1, 1, 1, 1,
-0.1513582, -0.05442511, -0.6309868, 1, 1, 1, 1, 1,
-0.1472735, -0.09566175, -3.179073, 1, 1, 1, 1, 1,
-0.1449048, -1.106816, -1.317136, 1, 1, 1, 1, 1,
-0.143167, -0.1823845, -3.550485, 1, 1, 1, 1, 1,
-0.140689, 0.8894172, -1.084025, 1, 1, 1, 1, 1,
-0.135804, -0.5729748, -1.813539, 1, 1, 1, 1, 1,
-0.1315319, 0.6582, -1.411823, 1, 1, 1, 1, 1,
-0.131043, 0.1154533, -0.3111842, 1, 1, 1, 1, 1,
-0.1296133, -0.558315, -1.035392, 1, 1, 1, 1, 1,
-0.1292148, -0.07840215, -0.1381379, 0, 0, 1, 1, 1,
-0.129089, 0.4121094, -0.3830907, 1, 0, 0, 1, 1,
-0.1202794, 0.04421886, -0.6779319, 1, 0, 0, 1, 1,
-0.1198832, -1.848215, -0.4962216, 1, 0, 0, 1, 1,
-0.1176754, 1.133877, -0.8891011, 1, 0, 0, 1, 1,
-0.1147958, -0.2906711, -2.451186, 1, 0, 0, 1, 1,
-0.1121142, -0.3864424, -2.99047, 0, 0, 0, 1, 1,
-0.110702, -1.192854, -1.742905, 0, 0, 0, 1, 1,
-0.1081417, -1.536289, -3.07532, 0, 0, 0, 1, 1,
-0.10686, -0.4354104, -3.147338, 0, 0, 0, 1, 1,
-0.106705, 0.8982604, 0.8046774, 0, 0, 0, 1, 1,
-0.1044079, 0.6102219, -2.463512, 0, 0, 0, 1, 1,
-0.1040913, -1.471892, -2.190172, 0, 0, 0, 1, 1,
-0.1024408, -1.688376, -2.224822, 1, 1, 1, 1, 1,
-0.09784739, -2.631231, -3.572276, 1, 1, 1, 1, 1,
-0.09490508, -1.211873, -4.434175, 1, 1, 1, 1, 1,
-0.09477559, -1.438423, -2.718702, 1, 1, 1, 1, 1,
-0.09376388, 1.558003, -0.05698781, 1, 1, 1, 1, 1,
-0.08718628, 1.124119, -0.1352369, 1, 1, 1, 1, 1,
-0.08437121, -1.427645, -3.198257, 1, 1, 1, 1, 1,
-0.08373965, -0.4438202, -2.940268, 1, 1, 1, 1, 1,
-0.08301181, -0.3873037, -2.773239, 1, 1, 1, 1, 1,
-0.08298064, -1.803875, -2.142178, 1, 1, 1, 1, 1,
-0.08029409, 0.09950188, -1.215233, 1, 1, 1, 1, 1,
-0.07991683, -0.1986116, -2.313041, 1, 1, 1, 1, 1,
-0.07885467, -0.18524, -4.069339, 1, 1, 1, 1, 1,
-0.07860114, 2.110834, 0.7774271, 1, 1, 1, 1, 1,
-0.07672989, -1.005443, -4.0614, 1, 1, 1, 1, 1,
-0.07586813, -0.5352345, -2.636056, 0, 0, 1, 1, 1,
-0.07571358, 0.8341836, 0.2673566, 1, 0, 0, 1, 1,
-0.07515824, 0.1345286, -1.98132, 1, 0, 0, 1, 1,
-0.07112588, 0.2741212, -0.09800722, 1, 0, 0, 1, 1,
-0.07072664, 0.7422141, -0.4056601, 1, 0, 0, 1, 1,
-0.06611132, 2.511118, 1.182936, 1, 0, 0, 1, 1,
-0.06201831, -0.1953922, -1.460788, 0, 0, 0, 1, 1,
-0.05995846, 0.2864006, 0.06611522, 0, 0, 0, 1, 1,
-0.05967231, -0.1699352, -2.509998, 0, 0, 0, 1, 1,
-0.05317873, 0.9594075, -0.6217067, 0, 0, 0, 1, 1,
-0.04790688, -1.268569, -3.013824, 0, 0, 0, 1, 1,
-0.04190062, -0.08139314, -2.6916, 0, 0, 0, 1, 1,
-0.04084263, 0.7990822, 0.01811699, 0, 0, 0, 1, 1,
-0.04000853, -0.7890133, -2.666451, 1, 1, 1, 1, 1,
-0.03578346, 1.873636, -2.102095, 1, 1, 1, 1, 1,
-0.03254512, 1.31882, 0.2974179, 1, 1, 1, 1, 1,
-0.03206015, 0.4212395, 0.1202592, 1, 1, 1, 1, 1,
-0.0270546, -2.482014, -3.534428, 1, 1, 1, 1, 1,
-0.02177849, 0.3402938, 0.9801632, 1, 1, 1, 1, 1,
-0.01909078, -0.2228664, -3.078351, 1, 1, 1, 1, 1,
-0.01898856, -0.7922688, -1.86446, 1, 1, 1, 1, 1,
-0.01150511, -0.1959081, -3.644145, 1, 1, 1, 1, 1,
-0.008703916, -2.106283, -2.858897, 1, 1, 1, 1, 1,
-0.006681173, -0.08668281, -3.410712, 1, 1, 1, 1, 1,
-0.00594129, 0.06890195, 0.8243166, 1, 1, 1, 1, 1,
-0.004507494, -0.2761395, -4.57693, 1, 1, 1, 1, 1,
-0.003374526, -0.4015066, -4.264641, 1, 1, 1, 1, 1,
0.000283776, 0.118405, 1.324821, 1, 1, 1, 1, 1,
0.003908135, -0.1918132, 3.704033, 0, 0, 1, 1, 1,
0.004761121, -0.2699284, 3.39686, 1, 0, 0, 1, 1,
0.01113212, 0.8758128, 0.1200126, 1, 0, 0, 1, 1,
0.0173685, -1.458722, 2.43272, 1, 0, 0, 1, 1,
0.01747699, -0.3432764, 2.894705, 1, 0, 0, 1, 1,
0.02856462, 1.40576, 0.2336037, 1, 0, 0, 1, 1,
0.0371681, -0.4292122, 2.362034, 0, 0, 0, 1, 1,
0.03962101, 0.05975646, 2.833434, 0, 0, 0, 1, 1,
0.04138499, 1.323609, -1.511525, 0, 0, 0, 1, 1,
0.04220789, -1.060332, 3.452837, 0, 0, 0, 1, 1,
0.04649538, -1.316782, 3.825723, 0, 0, 0, 1, 1,
0.05327093, 1.820116, 0.5710263, 0, 0, 0, 1, 1,
0.0601114, 0.3766545, -0.711127, 0, 0, 0, 1, 1,
0.06388247, 0.1779306, 1.149999, 1, 1, 1, 1, 1,
0.06453378, 0.5879624, 2.153431, 1, 1, 1, 1, 1,
0.06790001, 0.8403166, -1.395969, 1, 1, 1, 1, 1,
0.07173052, 0.3468779, 2.245244, 1, 1, 1, 1, 1,
0.07271502, -0.6258028, 3.285776, 1, 1, 1, 1, 1,
0.07278068, 0.1057739, 2.426787, 1, 1, 1, 1, 1,
0.07460732, 1.317534, 1.00666, 1, 1, 1, 1, 1,
0.07540484, 1.897378, 0.8525757, 1, 1, 1, 1, 1,
0.0783756, 0.6551649, 0.4188834, 1, 1, 1, 1, 1,
0.08421955, 1.41213, -1.147375, 1, 1, 1, 1, 1,
0.08505628, 1.406953, 0.06278839, 1, 1, 1, 1, 1,
0.08806139, 1.771086, 0.1535379, 1, 1, 1, 1, 1,
0.0884219, -0.208522, 2.71776, 1, 1, 1, 1, 1,
0.08876301, -1.109536, 5.542268, 1, 1, 1, 1, 1,
0.08911365, 0.177328, -0.2695102, 1, 1, 1, 1, 1,
0.08953445, 0.1709081, -0.07409345, 0, 0, 1, 1, 1,
0.09590217, 1.011664, -0.09821322, 1, 0, 0, 1, 1,
0.09690069, 1.149521, 0.7635134, 1, 0, 0, 1, 1,
0.09998474, 0.3371618, -0.9088829, 1, 0, 0, 1, 1,
0.1071555, -0.6701246, 3.903688, 1, 0, 0, 1, 1,
0.1095339, -1.663763, 3.781354, 1, 0, 0, 1, 1,
0.1097631, 0.3160571, 0.2239575, 0, 0, 0, 1, 1,
0.1221185, -1.371254, 3.227478, 0, 0, 0, 1, 1,
0.1223772, 1.014117, -0.218896, 0, 0, 0, 1, 1,
0.1280508, 0.17494, 0.127353, 0, 0, 0, 1, 1,
0.1324338, -0.1749024, 1.960982, 0, 0, 0, 1, 1,
0.1420968, 0.8320141, 0.3833315, 0, 0, 0, 1, 1,
0.1439852, 1.022462, -0.130168, 0, 0, 0, 1, 1,
0.1472803, 2.327004, 0.2711052, 1, 1, 1, 1, 1,
0.1474274, -0.2875709, 2.107054, 1, 1, 1, 1, 1,
0.1474288, 1.61673, 1.345729, 1, 1, 1, 1, 1,
0.1531333, -1.138884, 3.94897, 1, 1, 1, 1, 1,
0.1541821, 0.7146944, 0.9150807, 1, 1, 1, 1, 1,
0.1547417, 1.062891, 2.073367, 1, 1, 1, 1, 1,
0.1664459, -1.193662, 2.714396, 1, 1, 1, 1, 1,
0.1664656, 0.6858357, 0.3088179, 1, 1, 1, 1, 1,
0.1700654, 0.4080434, 0.01756546, 1, 1, 1, 1, 1,
0.1705722, 1.539173, 0.2024747, 1, 1, 1, 1, 1,
0.1707274, 0.4348908, -1.141554, 1, 1, 1, 1, 1,
0.171864, 1.543612, 0.8279846, 1, 1, 1, 1, 1,
0.1719639, 0.370241, -1.203704, 1, 1, 1, 1, 1,
0.1723785, -0.3169772, 2.191772, 1, 1, 1, 1, 1,
0.1728848, 0.4016638, 2.152427, 1, 1, 1, 1, 1,
0.181677, -1.569372, 2.746489, 0, 0, 1, 1, 1,
0.1828923, 1.761795, -1.474276, 1, 0, 0, 1, 1,
0.1836581, 1.53836, 0.4918043, 1, 0, 0, 1, 1,
0.1922275, -1.306193, 0.8182181, 1, 0, 0, 1, 1,
0.1959826, 0.1716558, -0.05800689, 1, 0, 0, 1, 1,
0.1967636, 0.4990082, -0.9461689, 1, 0, 0, 1, 1,
0.1972197, -1.071054, 3.340513, 0, 0, 0, 1, 1,
0.1975277, -1.015298, 3.817631, 0, 0, 0, 1, 1,
0.2007682, -1.549144, 3.003037, 0, 0, 0, 1, 1,
0.2017696, 1.431134, -0.7537734, 0, 0, 0, 1, 1,
0.2028331, -0.08247418, 2.303822, 0, 0, 0, 1, 1,
0.2045037, 1.967163, -0.2726922, 0, 0, 0, 1, 1,
0.2045789, 1.013688, 1.110168, 0, 0, 0, 1, 1,
0.208947, 0.256674, 1.224423, 1, 1, 1, 1, 1,
0.2097634, -1.244898, 3.848589, 1, 1, 1, 1, 1,
0.2186633, 0.45139, 0.8661265, 1, 1, 1, 1, 1,
0.2189208, -0.7998762, 2.883946, 1, 1, 1, 1, 1,
0.2190043, -0.7004761, 4.407785, 1, 1, 1, 1, 1,
0.2226353, -1.407841, 1.775885, 1, 1, 1, 1, 1,
0.2251966, 0.5182688, -0.08128487, 1, 1, 1, 1, 1,
0.2278481, -1.569779, 0.9850731, 1, 1, 1, 1, 1,
0.2280049, 0.7974346, -0.2377407, 1, 1, 1, 1, 1,
0.2283231, 1.048697, -0.07237947, 1, 1, 1, 1, 1,
0.2286093, -0.2384916, 1.892845, 1, 1, 1, 1, 1,
0.2330001, 0.3516908, 0.2060083, 1, 1, 1, 1, 1,
0.2370525, 0.7121677, -0.03524192, 1, 1, 1, 1, 1,
0.2395404, 0.6715053, 1.572319, 1, 1, 1, 1, 1,
0.242968, -1.066397, 2.326948, 1, 1, 1, 1, 1,
0.2429834, 0.4076535, 2.009496, 0, 0, 1, 1, 1,
0.2473055, 0.499177, 0.663435, 1, 0, 0, 1, 1,
0.2489074, -0.9693267, 3.232549, 1, 0, 0, 1, 1,
0.2492294, -0.7350091, 2.599748, 1, 0, 0, 1, 1,
0.2505844, 0.458839, 0.4969025, 1, 0, 0, 1, 1,
0.2537296, 0.04075607, 2.583496, 1, 0, 0, 1, 1,
0.25508, 1.493249, -0.2059958, 0, 0, 0, 1, 1,
0.2583402, -0.4966796, 0.5880058, 0, 0, 0, 1, 1,
0.2683215, -1.006201, 3.024061, 0, 0, 0, 1, 1,
0.2688196, 0.5785818, 1.103645, 0, 0, 0, 1, 1,
0.2689211, 1.615754, 0.5601262, 0, 0, 0, 1, 1,
0.2692387, 0.1552997, 0.7595438, 0, 0, 0, 1, 1,
0.2712345, -1.158878, 3.630632, 0, 0, 0, 1, 1,
0.2714687, -0.6800149, 3.030159, 1, 1, 1, 1, 1,
0.2745149, -0.4075064, 4.086071, 1, 1, 1, 1, 1,
0.2749889, 0.5487665, 1.636587, 1, 1, 1, 1, 1,
0.2760412, -0.8119081, 1.878408, 1, 1, 1, 1, 1,
0.2788834, -1.366391, 2.935016, 1, 1, 1, 1, 1,
0.2800887, -0.3516974, 2.185463, 1, 1, 1, 1, 1,
0.281781, 0.9823888, 0.7292396, 1, 1, 1, 1, 1,
0.2827304, -1.021781, 2.849324, 1, 1, 1, 1, 1,
0.2866669, 0.9950703, 0.1630846, 1, 1, 1, 1, 1,
0.2905154, 0.1326628, 2.015996, 1, 1, 1, 1, 1,
0.2907643, -1.446252, 3.922935, 1, 1, 1, 1, 1,
0.2982141, -1.215201, 2.259083, 1, 1, 1, 1, 1,
0.3011207, -1.807369, 2.967408, 1, 1, 1, 1, 1,
0.3021062, 0.1145048, -0.4023391, 1, 1, 1, 1, 1,
0.3034987, 0.1453318, 0.7021755, 1, 1, 1, 1, 1,
0.3037142, -1.819071, 3.529538, 0, 0, 1, 1, 1,
0.3056295, 0.3630376, -0.2485933, 1, 0, 0, 1, 1,
0.3150266, -0.6750532, 2.244272, 1, 0, 0, 1, 1,
0.3150606, 0.3188361, 0.6378931, 1, 0, 0, 1, 1,
0.3172511, -0.4280029, 2.679224, 1, 0, 0, 1, 1,
0.3173186, -0.5053796, 2.140031, 1, 0, 0, 1, 1,
0.3222691, 0.8359352, 0.9658183, 0, 0, 0, 1, 1,
0.3229981, 0.9401969, 1.372697, 0, 0, 0, 1, 1,
0.3241949, -0.4484234, 2.052793, 0, 0, 0, 1, 1,
0.3298137, -0.2612068, 2.990234, 0, 0, 0, 1, 1,
0.3317988, 0.4448937, 0.720976, 0, 0, 0, 1, 1,
0.3329834, 0.0713009, 0.9736518, 0, 0, 0, 1, 1,
0.338945, -0.310214, 2.839834, 0, 0, 0, 1, 1,
0.3521848, 1.169857, 0.9978971, 1, 1, 1, 1, 1,
0.3610964, -1.42159, 3.453414, 1, 1, 1, 1, 1,
0.3648937, -2.44504, 1.464258, 1, 1, 1, 1, 1,
0.3714199, 0.9304065, -0.3667926, 1, 1, 1, 1, 1,
0.3794165, 0.9689302, 0.1566997, 1, 1, 1, 1, 1,
0.3815021, -0.376726, 1.950507, 1, 1, 1, 1, 1,
0.3958567, -0.02307482, 0.3000947, 1, 1, 1, 1, 1,
0.3996855, 0.2427794, 1.486642, 1, 1, 1, 1, 1,
0.4035634, -0.3441332, 3.565898, 1, 1, 1, 1, 1,
0.4045319, 0.1396448, 2.154912, 1, 1, 1, 1, 1,
0.4101708, 0.02475118, 1.958314, 1, 1, 1, 1, 1,
0.4183872, -0.4866181, 1.677897, 1, 1, 1, 1, 1,
0.4218335, 0.7873758, 2.205159, 1, 1, 1, 1, 1,
0.4288261, 1.711974, -0.008341227, 1, 1, 1, 1, 1,
0.4291943, -0.4163504, 3.254933, 1, 1, 1, 1, 1,
0.4352238, 0.4875947, 0.4207221, 0, 0, 1, 1, 1,
0.4352966, 0.1275018, -0.3493499, 1, 0, 0, 1, 1,
0.4367128, 1.137766, -0.1016822, 1, 0, 0, 1, 1,
0.4426032, -1.361811, 2.440367, 1, 0, 0, 1, 1,
0.4432776, 0.6611498, 1.14184, 1, 0, 0, 1, 1,
0.4572757, -0.4283834, 1.48039, 1, 0, 0, 1, 1,
0.4594938, -1.991939, 2.093762, 0, 0, 0, 1, 1,
0.4624465, 0.3693506, 1.746521, 0, 0, 0, 1, 1,
0.4649056, 0.6944518, 1.680134, 0, 0, 0, 1, 1,
0.4674987, 0.009746401, 2.822939, 0, 0, 0, 1, 1,
0.4706353, -0.6309, 2.665915, 0, 0, 0, 1, 1,
0.4732848, -0.3451797, 3.183533, 0, 0, 0, 1, 1,
0.4796025, -1.002678, 2.071987, 0, 0, 0, 1, 1,
0.4810349, -0.7949404, 1.225824, 1, 1, 1, 1, 1,
0.4820964, -1.426793, 3.384702, 1, 1, 1, 1, 1,
0.4849939, -0.7116688, 2.982579, 1, 1, 1, 1, 1,
0.4854958, -0.3793879, 1.99774, 1, 1, 1, 1, 1,
0.4879333, 0.7120927, -0.6930256, 1, 1, 1, 1, 1,
0.4937117, 0.7226133, 2.147423, 1, 1, 1, 1, 1,
0.4939538, -0.7911674, 2.269812, 1, 1, 1, 1, 1,
0.4956438, 1.863551, 0.1748604, 1, 1, 1, 1, 1,
0.5008634, -0.9052052, 2.242481, 1, 1, 1, 1, 1,
0.5091549, 2.370234, 2.11314, 1, 1, 1, 1, 1,
0.5096673, -0.316176, 2.56607, 1, 1, 1, 1, 1,
0.5111259, -1.518364, 2.124844, 1, 1, 1, 1, 1,
0.5114722, -0.3714052, 3.158237, 1, 1, 1, 1, 1,
0.5151316, -0.222627, 2.788577, 1, 1, 1, 1, 1,
0.5157511, 0.3124319, 2.850986, 1, 1, 1, 1, 1,
0.5187424, 1.976086, 1.307678, 0, 0, 1, 1, 1,
0.521634, -0.5692616, 1.673861, 1, 0, 0, 1, 1,
0.5277692, 1.023098, 1.8356, 1, 0, 0, 1, 1,
0.5286569, -0.1593879, 2.889189, 1, 0, 0, 1, 1,
0.5292456, -0.03689138, 0.3939619, 1, 0, 0, 1, 1,
0.5331539, 1.090137, -0.8376181, 1, 0, 0, 1, 1,
0.5333009, 1.668714, 0.1965119, 0, 0, 0, 1, 1,
0.5384439, 0.005238808, 3.693539, 0, 0, 0, 1, 1,
0.5388623, -0.1438223, 3.659806, 0, 0, 0, 1, 1,
0.5413491, -2.166471, 3.085699, 0, 0, 0, 1, 1,
0.5498703, -0.2144877, 2.844786, 0, 0, 0, 1, 1,
0.5504807, -0.2881442, 2.199836, 0, 0, 0, 1, 1,
0.5741753, 0.39641, 1.144543, 0, 0, 0, 1, 1,
0.5748474, -0.5128188, 1.303126, 1, 1, 1, 1, 1,
0.578783, 1.411946, 0.4414122, 1, 1, 1, 1, 1,
0.5789171, -0.1767475, 2.15452, 1, 1, 1, 1, 1,
0.5809626, 0.8533046, -0.6690426, 1, 1, 1, 1, 1,
0.5812789, -1.055446, 2.735538, 1, 1, 1, 1, 1,
0.58301, 0.5800544, 1.225182, 1, 1, 1, 1, 1,
0.5837106, -1.065639, 3.232378, 1, 1, 1, 1, 1,
0.5875237, -1.70469, 4.32593, 1, 1, 1, 1, 1,
0.5892807, 1.232086, 1.068844, 1, 1, 1, 1, 1,
0.5899361, -1.589964, 2.504768, 1, 1, 1, 1, 1,
0.6011826, -0.78887, 3.307319, 1, 1, 1, 1, 1,
0.6016597, -0.05437809, 0.2987279, 1, 1, 1, 1, 1,
0.6058811, -0.4138397, 1.814403, 1, 1, 1, 1, 1,
0.6062602, -0.3814024, 1.144537, 1, 1, 1, 1, 1,
0.6096277, 0.7926109, -0.06769279, 1, 1, 1, 1, 1,
0.6124256, 1.104045, 0.8919485, 0, 0, 1, 1, 1,
0.6152101, -0.482586, 1.0221, 1, 0, 0, 1, 1,
0.6195115, -0.78645, 1.690401, 1, 0, 0, 1, 1,
0.62001, 0.1627059, 1.088511, 1, 0, 0, 1, 1,
0.6268724, 0.5929502, 1.540056, 1, 0, 0, 1, 1,
0.6292876, -0.2625856, 2.530924, 1, 0, 0, 1, 1,
0.6305546, 1.772964, 0.5192398, 0, 0, 0, 1, 1,
0.6315181, -1.681383, 1.776893, 0, 0, 0, 1, 1,
0.6316216, 0.9551325, 1.298619, 0, 0, 0, 1, 1,
0.6321381, -1.032341, 2.264709, 0, 0, 0, 1, 1,
0.6347483, -1.062896, 1.495602, 0, 0, 0, 1, 1,
0.6382298, -0.01516451, 1.63518, 0, 0, 0, 1, 1,
0.6396801, -1.751979, 1.995547, 0, 0, 0, 1, 1,
0.6436062, 1.744747, 1.203388, 1, 1, 1, 1, 1,
0.6569275, -0.8389323, 1.442899, 1, 1, 1, 1, 1,
0.6570076, 0.157641, 2.386025, 1, 1, 1, 1, 1,
0.6574858, -0.8750173, 3.66876, 1, 1, 1, 1, 1,
0.6619657, -0.7823449, 2.643232, 1, 1, 1, 1, 1,
0.664192, 0.6007546, 0.8587517, 1, 1, 1, 1, 1,
0.6657695, -1.38315, 2.513993, 1, 1, 1, 1, 1,
0.6679827, 0.5723403, 2.151119, 1, 1, 1, 1, 1,
0.6713601, -1.54091, 3.403828, 1, 1, 1, 1, 1,
0.674438, 1.526384, 0.2772979, 1, 1, 1, 1, 1,
0.6801689, 1.84106, 0.7613714, 1, 1, 1, 1, 1,
0.6828332, -1.150284, 3.989928, 1, 1, 1, 1, 1,
0.6868614, 0.397721, 0.06679922, 1, 1, 1, 1, 1,
0.6897935, -0.1830278, 2.810122, 1, 1, 1, 1, 1,
0.6967503, -0.2853698, 1.11417, 1, 1, 1, 1, 1,
0.7000639, 0.2377286, 0.2773173, 0, 0, 1, 1, 1,
0.7017397, -0.9408103, 3.829279, 1, 0, 0, 1, 1,
0.7052888, -0.1029612, 0.3094651, 1, 0, 0, 1, 1,
0.7054473, 1.634595, 0.5821142, 1, 0, 0, 1, 1,
0.7076634, -0.9943787, 1.874611, 1, 0, 0, 1, 1,
0.7145591, 0.7063341, 0.2732363, 1, 0, 0, 1, 1,
0.7170942, -1.090828, 4.703252, 0, 0, 0, 1, 1,
0.7226532, -0.2011075, 1.630906, 0, 0, 0, 1, 1,
0.7232569, -1.467641, 2.13035, 0, 0, 0, 1, 1,
0.7296208, 0.8940533, 2.419734, 0, 0, 0, 1, 1,
0.733248, 1.174374, 0.4768633, 0, 0, 0, 1, 1,
0.7357584, 1.380045, 0.5413694, 0, 0, 0, 1, 1,
0.7361653, 0.2107763, 0.4224457, 0, 0, 0, 1, 1,
0.7387877, -1.737176, 2.984465, 1, 1, 1, 1, 1,
0.7434549, -1.142134, 1.947937, 1, 1, 1, 1, 1,
0.7466965, 1.332947, 1.326369, 1, 1, 1, 1, 1,
0.7492092, -2.204942, 3.004841, 1, 1, 1, 1, 1,
0.7495425, -0.3703483, 1.229498, 1, 1, 1, 1, 1,
0.7591248, -1.378428, 2.35784, 1, 1, 1, 1, 1,
0.7617344, 1.718408, 0.8937277, 1, 1, 1, 1, 1,
0.7618164, 0.7994977, 1.33721, 1, 1, 1, 1, 1,
0.7623546, 1.614938, -0.4139554, 1, 1, 1, 1, 1,
0.7630449, -1.533425, 1.699183, 1, 1, 1, 1, 1,
0.7633122, 1.45862, -0.5970657, 1, 1, 1, 1, 1,
0.7646254, 1.63688, 0.7059272, 1, 1, 1, 1, 1,
0.7649699, -0.188317, 1.958523, 1, 1, 1, 1, 1,
0.7724389, -1.059891, 1.648149, 1, 1, 1, 1, 1,
0.7749112, 0.05860103, 0.2287478, 1, 1, 1, 1, 1,
0.7794525, 0.356993, 3.423704, 0, 0, 1, 1, 1,
0.7824268, -2.018991, 3.578707, 1, 0, 0, 1, 1,
0.7830042, 0.6218324, -0.2495806, 1, 0, 0, 1, 1,
0.7848186, -0.3158942, 1.738718, 1, 0, 0, 1, 1,
0.7877045, -0.1515644, 2.250788, 1, 0, 0, 1, 1,
0.7901282, -0.4982764, 1.353386, 1, 0, 0, 1, 1,
0.7922208, 0.09056593, -0.05739607, 0, 0, 0, 1, 1,
0.7994826, 0.358647, 1.251879, 0, 0, 0, 1, 1,
0.8071507, 0.2835751, 1.361294, 0, 0, 0, 1, 1,
0.8138785, -0.05283872, 0.1086777, 0, 0, 0, 1, 1,
0.819129, -1.064711, 1.345841, 0, 0, 0, 1, 1,
0.8267612, 0.6413357, 0.658347, 0, 0, 0, 1, 1,
0.830107, -1.449226, 2.071055, 0, 0, 0, 1, 1,
0.8321146, -0.1921288, 3.430568, 1, 1, 1, 1, 1,
0.8354979, 0.7520724, 1.218529, 1, 1, 1, 1, 1,
0.8366032, -0.1534289, 2.115832, 1, 1, 1, 1, 1,
0.8428113, 1.562174, 0.9478543, 1, 1, 1, 1, 1,
0.8487685, 0.3439574, 2.45599, 1, 1, 1, 1, 1,
0.8497981, -1.184009, 2.322328, 1, 1, 1, 1, 1,
0.8503679, 1.168141, 0.7283546, 1, 1, 1, 1, 1,
0.8564936, 1.2716, 1.709302, 1, 1, 1, 1, 1,
0.8565639, -0.5529805, 3.242273, 1, 1, 1, 1, 1,
0.856608, 0.4411578, 1.343753, 1, 1, 1, 1, 1,
0.8653551, -0.08929475, 2.288661, 1, 1, 1, 1, 1,
0.8682687, -1.813843, 2.40395, 1, 1, 1, 1, 1,
0.8691832, -0.28799, 3.244392, 1, 1, 1, 1, 1,
0.8757486, -1.354206, 3.26062, 1, 1, 1, 1, 1,
0.8786932, -0.8800203, 3.998704, 1, 1, 1, 1, 1,
0.8839092, 2.209805, -0.6599234, 0, 0, 1, 1, 1,
0.8849922, 0.2096155, 1.612162, 1, 0, 0, 1, 1,
0.8990041, -0.3217501, 2.50828, 1, 0, 0, 1, 1,
0.9005155, -0.9901622, 2.245912, 1, 0, 0, 1, 1,
0.9020551, 0.8041884, 1.163404, 1, 0, 0, 1, 1,
0.9022492, 0.601926, 1.566032, 1, 0, 0, 1, 1,
0.9031181, 0.1071689, 2.08678, 0, 0, 0, 1, 1,
0.9039881, 0.04535086, 0.8315454, 0, 0, 0, 1, 1,
0.9062014, -0.4527361, 3.723285, 0, 0, 0, 1, 1,
0.9065177, 0.1944929, 2.260258, 0, 0, 0, 1, 1,
0.9083821, 0.7150492, 1.666459, 0, 0, 0, 1, 1,
0.9187506, -0.05270787, 2.466259, 0, 0, 0, 1, 1,
0.9198289, 0.4068237, -0.2523125, 0, 0, 0, 1, 1,
0.9214643, -0.0172025, 1.621732, 1, 1, 1, 1, 1,
0.9214666, 0.7228872, -0.6247131, 1, 1, 1, 1, 1,
0.923189, -1.299249, 3.027731, 1, 1, 1, 1, 1,
0.9392424, 1.177731, -0.5156737, 1, 1, 1, 1, 1,
0.9397468, -0.005753098, 2.249105, 1, 1, 1, 1, 1,
0.9430357, 1.464068, -0.378585, 1, 1, 1, 1, 1,
0.9457679, 0.5624313, 1.613278, 1, 1, 1, 1, 1,
0.9523759, 1.469763, 1.992871, 1, 1, 1, 1, 1,
0.9634844, 0.5246036, -0.8646755, 1, 1, 1, 1, 1,
0.9701089, 0.04588188, -0.0370323, 1, 1, 1, 1, 1,
0.9706742, -0.4981519, 0.8908239, 1, 1, 1, 1, 1,
0.9766347, -0.5688825, 2.852086, 1, 1, 1, 1, 1,
0.9767806, 0.1437479, 0.6160221, 1, 1, 1, 1, 1,
0.9775167, 0.3697505, 0.7676786, 1, 1, 1, 1, 1,
0.9817333, -0.5466257, 3.061278, 1, 1, 1, 1, 1,
0.9843486, 1.759034, 0.4469683, 0, 0, 1, 1, 1,
0.9908643, 0.4725455, 1.488147, 1, 0, 0, 1, 1,
0.9937433, -0.118356, 2.224109, 1, 0, 0, 1, 1,
1.002726, -0.001376355, 0.7691073, 1, 0, 0, 1, 1,
1.00617, 1.27515, 1.740396, 1, 0, 0, 1, 1,
1.006271, 0.7925231, 1.700358, 1, 0, 0, 1, 1,
1.015834, -0.813611, 2.786325, 0, 0, 0, 1, 1,
1.022545, -0.5076344, 2.568316, 0, 0, 0, 1, 1,
1.02377, -1.770254, 2.418177, 0, 0, 0, 1, 1,
1.029161, -0.4586034, 2.308366, 0, 0, 0, 1, 1,
1.032943, -0.1005321, 3.210732, 0, 0, 0, 1, 1,
1.034801, -2.116677, 2.130226, 0, 0, 0, 1, 1,
1.034992, -0.3420272, 3.052867, 0, 0, 0, 1, 1,
1.035755, -2.050065, 3.082122, 1, 1, 1, 1, 1,
1.040406, -1.750188, 4.856555, 1, 1, 1, 1, 1,
1.04042, 0.01548877, 2.570999, 1, 1, 1, 1, 1,
1.042849, 0.6789709, 0.9201974, 1, 1, 1, 1, 1,
1.043706, 0.1026066, 2.984247, 1, 1, 1, 1, 1,
1.047837, 1.340182, 1.323896, 1, 1, 1, 1, 1,
1.050587, -0.4083888, 0.6202358, 1, 1, 1, 1, 1,
1.052567, -0.1817777, 0.4893624, 1, 1, 1, 1, 1,
1.05284, 0.2786154, 1.833753, 1, 1, 1, 1, 1,
1.052853, -1.273671, 0.7172878, 1, 1, 1, 1, 1,
1.056949, -0.435196, 0.679665, 1, 1, 1, 1, 1,
1.05721, 0.06028159, -0.1900525, 1, 1, 1, 1, 1,
1.057597, 0.5556679, -0.3308809, 1, 1, 1, 1, 1,
1.059429, -0.6702003, 3.583404, 1, 1, 1, 1, 1,
1.061414, 0.467115, 0.6776301, 1, 1, 1, 1, 1,
1.070853, -0.7061121, 0.5928105, 0, 0, 1, 1, 1,
1.071025, -1.23263, 1.738983, 1, 0, 0, 1, 1,
1.076061, -0.541795, 2.075925, 1, 0, 0, 1, 1,
1.086309, -0.5083283, 3.474218, 1, 0, 0, 1, 1,
1.091757, -0.3235701, 0.3759655, 1, 0, 0, 1, 1,
1.092861, -0.1411122, 2.09457, 1, 0, 0, 1, 1,
1.104254, 0.7772298, -0.7116056, 0, 0, 0, 1, 1,
1.104455, 0.199839, 0.1552034, 0, 0, 0, 1, 1,
1.107832, -0.3807197, 1.825241, 0, 0, 0, 1, 1,
1.108938, -1.214553, 3.812902, 0, 0, 0, 1, 1,
1.111172, -0.700094, 2.724952, 0, 0, 0, 1, 1,
1.113931, 0.9077193, 1.668026, 0, 0, 0, 1, 1,
1.128155, -1.734888, 4.192924, 0, 0, 0, 1, 1,
1.13034, 0.0724116, 1.582838, 1, 1, 1, 1, 1,
1.131077, 1.761485, 1.001185, 1, 1, 1, 1, 1,
1.131328, -0.2990461, 2.246124, 1, 1, 1, 1, 1,
1.14987, 0.48346, -0.8293774, 1, 1, 1, 1, 1,
1.159293, 0.4065123, 0.1173127, 1, 1, 1, 1, 1,
1.173004, -0.07634285, 2.596426, 1, 1, 1, 1, 1,
1.174561, 0.6024737, 1.862528, 1, 1, 1, 1, 1,
1.176331, -0.7909977, 1.218449, 1, 1, 1, 1, 1,
1.17844, -0.2345599, 3.591609, 1, 1, 1, 1, 1,
1.178862, 0.3842157, 1.538297, 1, 1, 1, 1, 1,
1.180192, -1.037496, 5.480943, 1, 1, 1, 1, 1,
1.185228, -0.6789359, 0.8277209, 1, 1, 1, 1, 1,
1.189165, -1.416066, 1.798955, 1, 1, 1, 1, 1,
1.189367, 2.068195, -0.1818883, 1, 1, 1, 1, 1,
1.192489, 0.9241084, 2.000552, 1, 1, 1, 1, 1,
1.194597, 0.1033254, 1.305781, 0, 0, 1, 1, 1,
1.1961, 0.05563409, 2.084121, 1, 0, 0, 1, 1,
1.204839, 0.8829436, 2.539641, 1, 0, 0, 1, 1,
1.213407, 0.3272957, 1.017391, 1, 0, 0, 1, 1,
1.214393, -0.970102, 1.144747, 1, 0, 0, 1, 1,
1.220224, 0.9134582, 1.300054, 1, 0, 0, 1, 1,
1.221775, -0.854003, 3.087255, 0, 0, 0, 1, 1,
1.224201, -1.229402, 3.343453, 0, 0, 0, 1, 1,
1.231584, 0.7800936, 2.44839, 0, 0, 0, 1, 1,
1.236799, 0.3963912, 1.244142, 0, 0, 0, 1, 1,
1.238675, 0.1242752, 0.9672943, 0, 0, 0, 1, 1,
1.247476, 1.501605, 0.1528894, 0, 0, 0, 1, 1,
1.248624, -0.5762943, 3.481004, 0, 0, 0, 1, 1,
1.253577, 0.08580772, 1.576435, 1, 1, 1, 1, 1,
1.254036, 0.9224956, 1.178095, 1, 1, 1, 1, 1,
1.257845, -0.4324948, 0.0261016, 1, 1, 1, 1, 1,
1.258879, -0.4222003, 3.341302, 1, 1, 1, 1, 1,
1.26969, 1.538244, -0.02436406, 1, 1, 1, 1, 1,
1.269865, -1.042465, 1.365399, 1, 1, 1, 1, 1,
1.273299, -1.009943, 1.196689, 1, 1, 1, 1, 1,
1.274706, 1.864901, 2.905046, 1, 1, 1, 1, 1,
1.27496, 0.552062, 1.956251, 1, 1, 1, 1, 1,
1.277852, 0.5322371, 1.729546, 1, 1, 1, 1, 1,
1.281097, 1.849953, 0.5466541, 1, 1, 1, 1, 1,
1.286039, -0.5136859, 2.042521, 1, 1, 1, 1, 1,
1.287319, 1.546651, 1.080837, 1, 1, 1, 1, 1,
1.290632, 1.440285, 1.937086, 1, 1, 1, 1, 1,
1.292296, 1.529418, 0.9065009, 1, 1, 1, 1, 1,
1.296776, 0.9904213, 0.3775258, 0, 0, 1, 1, 1,
1.296782, -1.248285, 2.164442, 1, 0, 0, 1, 1,
1.297514, -0.6423086, 1.221247, 1, 0, 0, 1, 1,
1.305412, 1.149041, -0.4143893, 1, 0, 0, 1, 1,
1.308874, 0.7165443, 1.289972, 1, 0, 0, 1, 1,
1.319257, -1.258669, 1.917682, 1, 0, 0, 1, 1,
1.332074, 0.3034804, 2.033887, 0, 0, 0, 1, 1,
1.336615, 0.7988218, 0.2823423, 0, 0, 0, 1, 1,
1.341245, 0.8555783, 0.03610462, 0, 0, 0, 1, 1,
1.341942, -0.6766087, 2.698174, 0, 0, 0, 1, 1,
1.343088, -1.676901, 2.990597, 0, 0, 0, 1, 1,
1.358661, 0.1598343, 1.942, 0, 0, 0, 1, 1,
1.359976, 0.6749619, 1.699736, 0, 0, 0, 1, 1,
1.360556, -0.7502793, 1.559136, 1, 1, 1, 1, 1,
1.36368, -0.7458234, 1.2718, 1, 1, 1, 1, 1,
1.365825, 0.672151, 0.5949445, 1, 1, 1, 1, 1,
1.369954, -0.05089715, 1.968031, 1, 1, 1, 1, 1,
1.371525, -1.250669, 3.305774, 1, 1, 1, 1, 1,
1.387737, 0.5291167, 1.748379, 1, 1, 1, 1, 1,
1.391098, -1.112779, 3.027932, 1, 1, 1, 1, 1,
1.412273, -0.04491352, 1.66907, 1, 1, 1, 1, 1,
1.415453, 1.378469, 1.687355, 1, 1, 1, 1, 1,
1.418126, 0.3795387, 1.233899, 1, 1, 1, 1, 1,
1.426643, 0.2539801, -0.3458453, 1, 1, 1, 1, 1,
1.429719, -2.222924, 3.258, 1, 1, 1, 1, 1,
1.451586, 0.159814, -0.100625, 1, 1, 1, 1, 1,
1.457339, -0.8546425, 2.600889, 1, 1, 1, 1, 1,
1.465289, -0.4473151, 1.796477, 1, 1, 1, 1, 1,
1.465676, 0.6703334, 0.6330413, 0, 0, 1, 1, 1,
1.467842, 0.3712034, 0.9111456, 1, 0, 0, 1, 1,
1.473295, -0.3628572, -0.05913408, 1, 0, 0, 1, 1,
1.47426, 0.5526697, 2.004129, 1, 0, 0, 1, 1,
1.48918, -0.7189739, 0.7259427, 1, 0, 0, 1, 1,
1.505107, 0.1903723, 1.118949, 1, 0, 0, 1, 1,
1.514505, 0.9809489, 1.141967, 0, 0, 0, 1, 1,
1.515897, -0.5657541, 1.812638, 0, 0, 0, 1, 1,
1.516124, -1.101987, 0.8983498, 0, 0, 0, 1, 1,
1.518069, -1.272515, 2.270459, 0, 0, 0, 1, 1,
1.518162, 2.085066, 0.2440487, 0, 0, 0, 1, 1,
1.522264, -1.535903, 1.668372, 0, 0, 0, 1, 1,
1.545755, -0.0558416, 1.843928, 0, 0, 0, 1, 1,
1.564893, 2.112071, 0.7491494, 1, 1, 1, 1, 1,
1.565685, 1.320689, 2.557916, 1, 1, 1, 1, 1,
1.571288, -0.4299061, 0.7493743, 1, 1, 1, 1, 1,
1.593914, 1.164864, 0.6796266, 1, 1, 1, 1, 1,
1.602995, 0.8075606, 0.679409, 1, 1, 1, 1, 1,
1.604845, -0.7493653, 2.467301, 1, 1, 1, 1, 1,
1.611903, 2.571697, 0.4201035, 1, 1, 1, 1, 1,
1.621223, 0.4320824, 0.7152771, 1, 1, 1, 1, 1,
1.629218, 0.1040834, 2.018606, 1, 1, 1, 1, 1,
1.630049, 1.569163, 1.223213, 1, 1, 1, 1, 1,
1.651282, 0.9401455, 0.1732517, 1, 1, 1, 1, 1,
1.657121, 0.3444287, 0.7044416, 1, 1, 1, 1, 1,
1.661347, 1.065791, 2.337846, 1, 1, 1, 1, 1,
1.661787, -0.2187557, 0.9900098, 1, 1, 1, 1, 1,
1.670113, -0.386294, 1.06271, 1, 1, 1, 1, 1,
1.675679, -0.3020834, 2.010327, 0, 0, 1, 1, 1,
1.678872, 1.852173, 0.2445429, 1, 0, 0, 1, 1,
1.680271, 0.7661546, -0.1971576, 1, 0, 0, 1, 1,
1.6911, 0.3758465, 2.69162, 1, 0, 0, 1, 1,
1.697743, -0.5782115, 1.041301, 1, 0, 0, 1, 1,
1.718587, -1.718977, 3.665002, 1, 0, 0, 1, 1,
1.755579, -1.437157, 1.453395, 0, 0, 0, 1, 1,
1.762454, 1.022998, 0.4041073, 0, 0, 0, 1, 1,
1.765643, 1.732499, -0.05891459, 0, 0, 0, 1, 1,
1.776043, -1.310796, 1.906111, 0, 0, 0, 1, 1,
1.782143, 0.01654608, 0.275802, 0, 0, 0, 1, 1,
1.783627, -0.5857622, 3.081365, 0, 0, 0, 1, 1,
1.786846, -0.3494277, 1.674928, 0, 0, 0, 1, 1,
1.792504, -0.8341378, 1.301681, 1, 1, 1, 1, 1,
1.799145, -1.587434, 2.517532, 1, 1, 1, 1, 1,
1.801782, 1.615845, 0.7808297, 1, 1, 1, 1, 1,
1.811215, -1.53436, 0.02678736, 1, 1, 1, 1, 1,
1.871294, -1.018567, 2.583599, 1, 1, 1, 1, 1,
1.886353, -0.1747507, 3.191141, 1, 1, 1, 1, 1,
1.899779, -0.279994, 1.44924, 1, 1, 1, 1, 1,
1.902515, -0.03169358, 1.424825, 1, 1, 1, 1, 1,
1.935001, 1.576517, -0.3466011, 1, 1, 1, 1, 1,
1.958666, 0.09059758, 0.1529718, 1, 1, 1, 1, 1,
1.972786, -0.01872516, 4.798889, 1, 1, 1, 1, 1,
1.985451, -0.8473312, 3.048041, 1, 1, 1, 1, 1,
1.989184, -0.3672053, 1.157829, 1, 1, 1, 1, 1,
2.011202, -0.2751578, 1.165315, 1, 1, 1, 1, 1,
2.01568, -0.3081649, 2.632949, 1, 1, 1, 1, 1,
2.047334, 0.03902296, 0.7291757, 0, 0, 1, 1, 1,
2.09587, 0.1916461, 3.400525, 1, 0, 0, 1, 1,
2.102445, -1.164606, 2.519525, 1, 0, 0, 1, 1,
2.103976, 0.7129432, 1.560539, 1, 0, 0, 1, 1,
2.107218, -1.120355, 1.252663, 1, 0, 0, 1, 1,
2.109237, 0.7360768, 1.67307, 1, 0, 0, 1, 1,
2.128388, -1.277041, 1.872203, 0, 0, 0, 1, 1,
2.142009, -0.06588456, -0.5926446, 0, 0, 0, 1, 1,
2.188195, 0.6908485, 1.541056, 0, 0, 0, 1, 1,
2.21059, -0.5258654, 2.408235, 0, 0, 0, 1, 1,
2.26333, 0.2010094, 1.547127, 0, 0, 0, 1, 1,
2.264751, -1.01457, 2.410068, 0, 0, 0, 1, 1,
2.314346, -2.388924, 2.101022, 0, 0, 0, 1, 1,
2.383737, 1.602689, 3.998862, 1, 1, 1, 1, 1,
2.39408, -1.149108, 2.406142, 1, 1, 1, 1, 1,
2.415817, 0.7121204, 1.478552, 1, 1, 1, 1, 1,
2.590631, 1.974428, -0.4665165, 1, 1, 1, 1, 1,
2.629743, -0.9563627, 2.066965, 1, 1, 1, 1, 1,
2.687406, 1.235782, 0.3481131, 1, 1, 1, 1, 1,
3.459404, -0.3970807, 2.628645, 1, 1, 1, 1, 1
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
var radius = 9.465949;
var distance = 33.24874;
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
mvMatrix.translate( -0.320166, -0.4039558, -0.1675501 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.24874);
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
