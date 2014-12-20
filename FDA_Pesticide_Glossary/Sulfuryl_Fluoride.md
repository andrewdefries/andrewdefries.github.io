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
-3.388129, -1.321373, -0.5075435, 1, 0, 0, 1,
-3.216908, 0.1474529, -2.204092, 1, 0.007843138, 0, 1,
-3.002159, -0.2242951, -0.8674144, 1, 0.01176471, 0, 1,
-2.899137, -0.2764636, -1.905785, 1, 0.01960784, 0, 1,
-2.696846, 0.2689431, -2.121947, 1, 0.02352941, 0, 1,
-2.665474, -0.9378147, -1.585248, 1, 0.03137255, 0, 1,
-2.535314, 0.5826455, -1.522194, 1, 0.03529412, 0, 1,
-2.457227, 0.3797538, -1.28947, 1, 0.04313726, 0, 1,
-2.330437, -1.227402, -3.946656, 1, 0.04705882, 0, 1,
-2.275932, -0.133508, -2.867871, 1, 0.05490196, 0, 1,
-2.266152, -0.4992805, -1.294284, 1, 0.05882353, 0, 1,
-2.224968, 0.5357081, 0.9055225, 1, 0.06666667, 0, 1,
-2.222786, -0.4080723, -1.152745, 1, 0.07058824, 0, 1,
-2.167377, 0.9874154, -2.719392, 1, 0.07843138, 0, 1,
-2.153732, -1.094783, -2.149214, 1, 0.08235294, 0, 1,
-2.121895, -0.9884644, -2.495129, 1, 0.09019608, 0, 1,
-2.071735, 0.304123, -0.1458217, 1, 0.09411765, 0, 1,
-2.056198, 0.1056322, -1.798396, 1, 0.1019608, 0, 1,
-2.052233, 0.2668229, -1.958873, 1, 0.1098039, 0, 1,
-2.043417, -1.841884, -0.5633688, 1, 0.1137255, 0, 1,
-2.036105, -0.1502137, -1.76365, 1, 0.1215686, 0, 1,
-2.027327, 0.865647, -0.9401889, 1, 0.1254902, 0, 1,
-1.99719, -0.3244759, -1.41227, 1, 0.1333333, 0, 1,
-1.915704, 0.9481021, -2.057945, 1, 0.1372549, 0, 1,
-1.912058, 0.7284232, -1.012971, 1, 0.145098, 0, 1,
-1.907594, 0.1020829, -0.6047572, 1, 0.1490196, 0, 1,
-1.898498, -0.4761755, -2.673091, 1, 0.1568628, 0, 1,
-1.896742, 0.5572499, -2.080103, 1, 0.1607843, 0, 1,
-1.854431, 0.2081545, -0.7274092, 1, 0.1686275, 0, 1,
-1.838087, -0.3240618, -2.767916, 1, 0.172549, 0, 1,
-1.827906, -0.9035254, -3.806333, 1, 0.1803922, 0, 1,
-1.816079, -0.1943963, 0.08042929, 1, 0.1843137, 0, 1,
-1.810344, -0.6496954, -1.565479, 1, 0.1921569, 0, 1,
-1.800479, 1.600937, -2.193387, 1, 0.1960784, 0, 1,
-1.797816, -1.656856, -3.182424, 1, 0.2039216, 0, 1,
-1.777031, 0.6038908, -0.8807293, 1, 0.2117647, 0, 1,
-1.774903, -1.520483, -3.209026, 1, 0.2156863, 0, 1,
-1.767208, 1.091628, -1.694358, 1, 0.2235294, 0, 1,
-1.764996, -0.1295792, -0.7280725, 1, 0.227451, 0, 1,
-1.759751, 1.202668, 0.4704608, 1, 0.2352941, 0, 1,
-1.756108, 1.149768, -1.000165, 1, 0.2392157, 0, 1,
-1.750817, -0.05901963, -2.652522, 1, 0.2470588, 0, 1,
-1.741153, 0.1108568, -1.346678, 1, 0.2509804, 0, 1,
-1.734003, -0.6351225, -3.582323, 1, 0.2588235, 0, 1,
-1.72424, 0.6931676, -2.192139, 1, 0.2627451, 0, 1,
-1.723312, 1.212423, 0.006854945, 1, 0.2705882, 0, 1,
-1.70142, 0.4258121, -1.325868, 1, 0.2745098, 0, 1,
-1.698578, -0.5090851, -2.81713, 1, 0.282353, 0, 1,
-1.693057, -0.6189206, -0.9799172, 1, 0.2862745, 0, 1,
-1.691665, -0.3859051, -0.6206754, 1, 0.2941177, 0, 1,
-1.638776, 0.05258452, -3.321652, 1, 0.3019608, 0, 1,
-1.63529, -0.8342572, -2.197688, 1, 0.3058824, 0, 1,
-1.623981, 1.669509, -0.4833146, 1, 0.3137255, 0, 1,
-1.619587, 1.34206, -1.098252, 1, 0.3176471, 0, 1,
-1.616981, 0.5929356, -1.736616, 1, 0.3254902, 0, 1,
-1.607586, 0.219818, -1.420426, 1, 0.3294118, 0, 1,
-1.583795, 0.5964866, -1.31535, 1, 0.3372549, 0, 1,
-1.579562, -0.6575755, -1.65541, 1, 0.3411765, 0, 1,
-1.563047, -0.05601446, -1.700939, 1, 0.3490196, 0, 1,
-1.560352, 1.405305, -1.171371, 1, 0.3529412, 0, 1,
-1.556629, -1.722756, -0.6065891, 1, 0.3607843, 0, 1,
-1.556605, -0.6619664, -1.983543, 1, 0.3647059, 0, 1,
-1.549967, -0.1175365, -0.5779807, 1, 0.372549, 0, 1,
-1.546071, -0.0769934, -1.903453, 1, 0.3764706, 0, 1,
-1.543338, -0.3399473, -0.6020202, 1, 0.3843137, 0, 1,
-1.53592, 1.770634, -0.236112, 1, 0.3882353, 0, 1,
-1.527717, -0.4576699, -0.1339764, 1, 0.3960784, 0, 1,
-1.517982, -1.254831, -1.302248, 1, 0.4039216, 0, 1,
-1.505883, 0.6436862, -1.134435, 1, 0.4078431, 0, 1,
-1.501894, 0.6494907, -2.399156, 1, 0.4156863, 0, 1,
-1.48409, -1.335968, -3.677464, 1, 0.4196078, 0, 1,
-1.469092, 1.49811, -0.4224225, 1, 0.427451, 0, 1,
-1.466466, 1.325784, 0.236682, 1, 0.4313726, 0, 1,
-1.465781, 2.179255, -1.322596, 1, 0.4392157, 0, 1,
-1.452992, -0.4770857, -1.843178, 1, 0.4431373, 0, 1,
-1.451645, -1.083287, -2.844482, 1, 0.4509804, 0, 1,
-1.448102, 0.1205768, -0.658625, 1, 0.454902, 0, 1,
-1.432579, 1.548334, -0.6015348, 1, 0.4627451, 0, 1,
-1.431399, 0.05853522, -3.538332, 1, 0.4666667, 0, 1,
-1.429014, -1.716278, -1.648278, 1, 0.4745098, 0, 1,
-1.426838, -1.488576, -2.839744, 1, 0.4784314, 0, 1,
-1.426028, -0.2375815, -2.653238, 1, 0.4862745, 0, 1,
-1.424431, -0.8766347, -4.187947, 1, 0.4901961, 0, 1,
-1.393895, -0.2649608, -2.30855, 1, 0.4980392, 0, 1,
-1.383704, -0.8838637, -2.373405, 1, 0.5058824, 0, 1,
-1.380816, 0.3457149, -1.069149, 1, 0.509804, 0, 1,
-1.380563, 1.044765, -0.3618399, 1, 0.5176471, 0, 1,
-1.360402, 0.7829859, -2.085531, 1, 0.5215687, 0, 1,
-1.345649, -0.5085468, -1.032462, 1, 0.5294118, 0, 1,
-1.345102, -0.3258671, -1.582723, 1, 0.5333334, 0, 1,
-1.342923, -0.7676021, -2.662357, 1, 0.5411765, 0, 1,
-1.331462, -0.1913922, -1.309494, 1, 0.5450981, 0, 1,
-1.321899, 1.215968, -1.268526, 1, 0.5529412, 0, 1,
-1.31874, -3.188193, -2.742819, 1, 0.5568628, 0, 1,
-1.312431, 2.062327, -0.136448, 1, 0.5647059, 0, 1,
-1.299179, -0.2731798, -3.054821, 1, 0.5686275, 0, 1,
-1.296429, 1.148134, 0.1389171, 1, 0.5764706, 0, 1,
-1.285723, -1.400232, -1.392395, 1, 0.5803922, 0, 1,
-1.277262, -0.1312411, -3.036317, 1, 0.5882353, 0, 1,
-1.272521, 1.263551, -2.458078, 1, 0.5921569, 0, 1,
-1.26593, 1.270916, -1.016314, 1, 0.6, 0, 1,
-1.263826, -0.3647353, -0.1746327, 1, 0.6078432, 0, 1,
-1.255108, -0.5132099, -1.684805, 1, 0.6117647, 0, 1,
-1.251805, -0.06450294, -1.787537, 1, 0.6196079, 0, 1,
-1.249385, -2.790085, -3.568908, 1, 0.6235294, 0, 1,
-1.249246, -1.103515, -2.321146, 1, 0.6313726, 0, 1,
-1.249009, -0.8083214, -3.158048, 1, 0.6352941, 0, 1,
-1.245531, 0.5023875, -0.8266044, 1, 0.6431373, 0, 1,
-1.231924, -0.1206383, -0.1717301, 1, 0.6470588, 0, 1,
-1.231694, -0.3232472, -3.911273, 1, 0.654902, 0, 1,
-1.208645, 1.24053, -0.8310122, 1, 0.6588235, 0, 1,
-1.206115, 0.9439492, -0.4955654, 1, 0.6666667, 0, 1,
-1.189085, -0.4149576, -2.781942, 1, 0.6705883, 0, 1,
-1.186067, -1.171246, -4.449368, 1, 0.6784314, 0, 1,
-1.182552, 0.6842514, 0.1141225, 1, 0.682353, 0, 1,
-1.181157, -0.5679969, -3.397831, 1, 0.6901961, 0, 1,
-1.176926, 0.9318284, 0.5104703, 1, 0.6941177, 0, 1,
-1.170533, -0.3612446, -2.192191, 1, 0.7019608, 0, 1,
-1.166796, 0.49991, -1.41711, 1, 0.7098039, 0, 1,
-1.166537, -0.6634241, -1.257026, 1, 0.7137255, 0, 1,
-1.158695, 0.3386894, -2.533915, 1, 0.7215686, 0, 1,
-1.151597, 1.597697, -0.7653664, 1, 0.7254902, 0, 1,
-1.144094, -0.7982822, -2.950842, 1, 0.7333333, 0, 1,
-1.138899, 0.3561005, 0.4647334, 1, 0.7372549, 0, 1,
-1.132568, 1.705045, -0.2338143, 1, 0.7450981, 0, 1,
-1.099523, -0.6106661, -0.8274443, 1, 0.7490196, 0, 1,
-1.097885, 0.9237911, -1.907509, 1, 0.7568628, 0, 1,
-1.095609, -0.8026103, -1.439004, 1, 0.7607843, 0, 1,
-1.092056, -2.381438, -2.588094, 1, 0.7686275, 0, 1,
-1.08998, 0.9449071, -0.5515712, 1, 0.772549, 0, 1,
-1.089425, 0.5977823, -1.922981, 1, 0.7803922, 0, 1,
-1.088532, 1.29467, -0.9080918, 1, 0.7843137, 0, 1,
-1.087604, -1.111806, -2.633204, 1, 0.7921569, 0, 1,
-1.080676, 1.266014, -2.320087, 1, 0.7960784, 0, 1,
-1.064263, -1.15605, -1.973501, 1, 0.8039216, 0, 1,
-1.062414, 0.5749167, -2.511854, 1, 0.8117647, 0, 1,
-1.061647, 0.9787379, -2.246716, 1, 0.8156863, 0, 1,
-1.061332, -0.6069241, -3.513656, 1, 0.8235294, 0, 1,
-1.055821, 2.358785, 1.612458, 1, 0.827451, 0, 1,
-1.050568, 1.285145, -0.3730005, 1, 0.8352941, 0, 1,
-1.041108, 1.120902, -0.8647106, 1, 0.8392157, 0, 1,
-1.037241, -1.417976, -2.833789, 1, 0.8470588, 0, 1,
-1.03462, -0.1423469, 0.2185377, 1, 0.8509804, 0, 1,
-1.018336, 0.2970497, -1.251125, 1, 0.8588235, 0, 1,
-1.018204, 0.0619459, -3.457759, 1, 0.8627451, 0, 1,
-1.010326, 0.4181189, -0.6901423, 1, 0.8705882, 0, 1,
-1.008899, -1.738984, -4.21073, 1, 0.8745098, 0, 1,
-1.004636, 0.4261404, 0.06489271, 1, 0.8823529, 0, 1,
-0.9917188, -0.3340742, -1.021401, 1, 0.8862745, 0, 1,
-0.98836, 1.563148, -0.4283752, 1, 0.8941177, 0, 1,
-0.9878466, -0.01995189, -2.952522, 1, 0.8980392, 0, 1,
-0.9870724, 0.2304356, -1.45259, 1, 0.9058824, 0, 1,
-0.9740893, 0.7161713, 0.2985801, 1, 0.9137255, 0, 1,
-0.9740493, -0.7482324, -1.407777, 1, 0.9176471, 0, 1,
-0.96728, -0.2371052, -1.997777, 1, 0.9254902, 0, 1,
-0.9636184, -0.4013379, -2.625672, 1, 0.9294118, 0, 1,
-0.9575039, 1.736346, 1.004464, 1, 0.9372549, 0, 1,
-0.9561956, 0.08997171, -2.163593, 1, 0.9411765, 0, 1,
-0.9439507, 0.7541595, -1.742164, 1, 0.9490196, 0, 1,
-0.9434458, 0.01734763, -3.0532, 1, 0.9529412, 0, 1,
-0.94105, 0.5049253, -0.5134101, 1, 0.9607843, 0, 1,
-0.937648, 0.2759785, -1.22598, 1, 0.9647059, 0, 1,
-0.9351258, -1.585798, -3.028386, 1, 0.972549, 0, 1,
-0.9340104, -1.006414, -3.7417, 1, 0.9764706, 0, 1,
-0.9247166, 1.280173, -0.4399168, 1, 0.9843137, 0, 1,
-0.922105, -0.4619382, -2.389232, 1, 0.9882353, 0, 1,
-0.9220576, -1.116039, -1.345709, 1, 0.9960784, 0, 1,
-0.922013, 0.9862226, -1.32716, 0.9960784, 1, 0, 1,
-0.9209422, 0.2518131, -1.092462, 0.9921569, 1, 0, 1,
-0.9091156, 0.02981221, -2.004656, 0.9843137, 1, 0, 1,
-0.9044012, -0.03787383, -1.58005, 0.9803922, 1, 0, 1,
-0.8941063, 0.9964359, 0.2801699, 0.972549, 1, 0, 1,
-0.8904797, -0.2430144, -1.02866, 0.9686275, 1, 0, 1,
-0.8794414, 0.2026946, -0.8410803, 0.9607843, 1, 0, 1,
-0.8784953, -0.1805726, -2.554374, 0.9568627, 1, 0, 1,
-0.8770638, -0.4648774, -0.7210026, 0.9490196, 1, 0, 1,
-0.8769586, 0.556258, -0.6426334, 0.945098, 1, 0, 1,
-0.8760176, 0.8279602, 0.3426535, 0.9372549, 1, 0, 1,
-0.8750117, 0.124257, -0.8946306, 0.9333333, 1, 0, 1,
-0.8748777, -0.2588065, -2.486039, 0.9254902, 1, 0, 1,
-0.8742333, 0.1674242, -3.179823, 0.9215686, 1, 0, 1,
-0.8684153, 1.147401, -1.235214, 0.9137255, 1, 0, 1,
-0.8663076, 0.741305, -0.7099016, 0.9098039, 1, 0, 1,
-0.8651478, 0.4085181, -1.821029, 0.9019608, 1, 0, 1,
-0.8621877, -0.2912855, -1.05154, 0.8941177, 1, 0, 1,
-0.8618191, 0.8531837, -0.1780327, 0.8901961, 1, 0, 1,
-0.8593701, -0.07795042, -1.031666, 0.8823529, 1, 0, 1,
-0.8585235, 0.3631888, 1.120926, 0.8784314, 1, 0, 1,
-0.8577744, 1.983609, -1.874262, 0.8705882, 1, 0, 1,
-0.8549722, 0.3711747, 0.02963635, 0.8666667, 1, 0, 1,
-0.8490773, -0.3521905, -2.151664, 0.8588235, 1, 0, 1,
-0.847804, 0.1460166, 0.150714, 0.854902, 1, 0, 1,
-0.8461159, 0.5095511, -0.6208034, 0.8470588, 1, 0, 1,
-0.8398348, -0.7407423, -1.507189, 0.8431373, 1, 0, 1,
-0.8367528, 1.58444, 0.4242468, 0.8352941, 1, 0, 1,
-0.8273144, -0.8555364, -2.499593, 0.8313726, 1, 0, 1,
-0.816274, -2.327561, -3.040068, 0.8235294, 1, 0, 1,
-0.8151203, -0.2201576, -3.481952, 0.8196079, 1, 0, 1,
-0.8143703, 0.4428385, -2.8189, 0.8117647, 1, 0, 1,
-0.8134196, -0.05942796, -2.824169, 0.8078431, 1, 0, 1,
-0.8130807, 0.6522069, -0.8407366, 0.8, 1, 0, 1,
-0.8057148, 1.624839, -1.081529, 0.7921569, 1, 0, 1,
-0.8046229, 0.5619624, 0.7585055, 0.7882353, 1, 0, 1,
-0.8038605, -1.227585, -3.956892, 0.7803922, 1, 0, 1,
-0.7995058, 0.7296473, -0.6613019, 0.7764706, 1, 0, 1,
-0.7976077, 0.4841401, -2.771669, 0.7686275, 1, 0, 1,
-0.7906942, -0.2989617, -0.4183371, 0.7647059, 1, 0, 1,
-0.7866603, 0.3231961, -0.2671451, 0.7568628, 1, 0, 1,
-0.7860997, -0.5069839, -1.953852, 0.7529412, 1, 0, 1,
-0.7785511, -0.5652977, -3.462859, 0.7450981, 1, 0, 1,
-0.7720643, 1.399213, 0.8451962, 0.7411765, 1, 0, 1,
-0.7717604, -1.460417, -2.556463, 0.7333333, 1, 0, 1,
-0.7692885, 0.3687572, -1.742844, 0.7294118, 1, 0, 1,
-0.7679161, -0.3371295, -2.284762, 0.7215686, 1, 0, 1,
-0.7678447, -0.4702932, -2.647282, 0.7176471, 1, 0, 1,
-0.7650502, -0.1678841, -1.522303, 0.7098039, 1, 0, 1,
-0.7649041, -0.512315, -4.218113, 0.7058824, 1, 0, 1,
-0.7608201, -1.063876, -4.240104, 0.6980392, 1, 0, 1,
-0.759473, -0.5447633, -2.728838, 0.6901961, 1, 0, 1,
-0.7590457, -0.3183405, -2.865, 0.6862745, 1, 0, 1,
-0.7551894, -0.5580289, -2.485252, 0.6784314, 1, 0, 1,
-0.7478763, -0.543909, -1.468423, 0.6745098, 1, 0, 1,
-0.7443161, 1.545262, -1.830417, 0.6666667, 1, 0, 1,
-0.7401176, -0.4609611, -2.942335, 0.6627451, 1, 0, 1,
-0.7310983, -0.7648394, -2.012192, 0.654902, 1, 0, 1,
-0.7279047, -0.1851889, -3.356579, 0.6509804, 1, 0, 1,
-0.7276492, -0.7266943, -2.20204, 0.6431373, 1, 0, 1,
-0.7216172, 0.2292613, 1.459152, 0.6392157, 1, 0, 1,
-0.7197003, -0.8077991, -2.655051, 0.6313726, 1, 0, 1,
-0.7178617, -0.7238622, -2.22695, 0.627451, 1, 0, 1,
-0.716857, -0.488993, 0.2528214, 0.6196079, 1, 0, 1,
-0.7127594, 0.9443142, -0.5569164, 0.6156863, 1, 0, 1,
-0.7042799, 0.483775, -0.5393407, 0.6078432, 1, 0, 1,
-0.6961512, 1.822798, -0.04264297, 0.6039216, 1, 0, 1,
-0.6887333, -1.558842, -2.197652, 0.5960785, 1, 0, 1,
-0.6841208, -1.355601, -2.085086, 0.5882353, 1, 0, 1,
-0.6826855, 0.6187475, -1.709046, 0.5843138, 1, 0, 1,
-0.6823922, -0.3821682, -1.981551, 0.5764706, 1, 0, 1,
-0.6804926, 0.9781505, -0.2517518, 0.572549, 1, 0, 1,
-0.6781722, -0.5818876, -3.891504, 0.5647059, 1, 0, 1,
-0.6702656, 1.01141, -1.191136, 0.5607843, 1, 0, 1,
-0.6653295, 0.1352005, -0.5788655, 0.5529412, 1, 0, 1,
-0.6592543, -1.490502, -1.692481, 0.5490196, 1, 0, 1,
-0.6591467, 0.6754937, -0.2535057, 0.5411765, 1, 0, 1,
-0.6465324, 0.1935307, -0.7159925, 0.5372549, 1, 0, 1,
-0.6451595, 0.314539, -0.4776223, 0.5294118, 1, 0, 1,
-0.6430684, 0.7949368, -0.07993755, 0.5254902, 1, 0, 1,
-0.6377135, 0.103438, -0.3809077, 0.5176471, 1, 0, 1,
-0.6336417, -0.7026207, -1.16954, 0.5137255, 1, 0, 1,
-0.6328897, 1.577721, -1.628917, 0.5058824, 1, 0, 1,
-0.6316161, -0.2317407, -2.288248, 0.5019608, 1, 0, 1,
-0.6231557, 0.2332149, -2.720752, 0.4941176, 1, 0, 1,
-0.6120156, 0.009255961, -1.698425, 0.4862745, 1, 0, 1,
-0.6116754, 1.205759, 0.1000768, 0.4823529, 1, 0, 1,
-0.5925035, -0.3241301, -1.937659, 0.4745098, 1, 0, 1,
-0.5900855, -0.9737494, -2.94693, 0.4705882, 1, 0, 1,
-0.5836498, 0.6219208, -3.240207, 0.4627451, 1, 0, 1,
-0.5826595, 1.44901, -0.5864556, 0.4588235, 1, 0, 1,
-0.5812363, -0.2795733, -2.176501, 0.4509804, 1, 0, 1,
-0.5748281, -0.2257801, -3.414288, 0.4470588, 1, 0, 1,
-0.5738289, -0.8631362, -2.714119, 0.4392157, 1, 0, 1,
-0.5722973, -0.1095954, -3.503903, 0.4352941, 1, 0, 1,
-0.5688311, 0.6346627, -1.223613, 0.427451, 1, 0, 1,
-0.5683272, -0.6430528, -1.997213, 0.4235294, 1, 0, 1,
-0.5643438, 0.06457414, -1.199111, 0.4156863, 1, 0, 1,
-0.5634128, -0.0514693, -2.717924, 0.4117647, 1, 0, 1,
-0.5616952, 0.7606109, 1.055261, 0.4039216, 1, 0, 1,
-0.5586418, -1.457452, -1.754083, 0.3960784, 1, 0, 1,
-0.5570896, 1.05268, 0.868967, 0.3921569, 1, 0, 1,
-0.5563789, -1.113286, -2.044483, 0.3843137, 1, 0, 1,
-0.5536734, -0.8846446, -3.19959, 0.3803922, 1, 0, 1,
-0.5532397, 2.08273, 0.6445383, 0.372549, 1, 0, 1,
-0.552922, -0.7358345, -2.602846, 0.3686275, 1, 0, 1,
-0.5526699, 0.3896431, -0.7127309, 0.3607843, 1, 0, 1,
-0.5515611, 0.7298006, 0.2726684, 0.3568628, 1, 0, 1,
-0.5503255, 0.2720549, 1.146168, 0.3490196, 1, 0, 1,
-0.5462289, -1.039447, -3.063155, 0.345098, 1, 0, 1,
-0.5459841, 0.7363037, 0.5449726, 0.3372549, 1, 0, 1,
-0.5224593, 0.6767281, 0.4570816, 0.3333333, 1, 0, 1,
-0.5223657, 0.8445691, -0.6360537, 0.3254902, 1, 0, 1,
-0.5221982, 0.9532056, 0.7147963, 0.3215686, 1, 0, 1,
-0.521219, 0.8484941, -1.866845, 0.3137255, 1, 0, 1,
-0.5200077, -0.1403356, -2.227287, 0.3098039, 1, 0, 1,
-0.5158693, -0.6600598, -2.474823, 0.3019608, 1, 0, 1,
-0.5126913, 0.03588635, -1.043427, 0.2941177, 1, 0, 1,
-0.5116132, -0.6016847, -3.223928, 0.2901961, 1, 0, 1,
-0.5092495, -0.5397871, -2.015456, 0.282353, 1, 0, 1,
-0.5088674, -0.2532439, -2.097443, 0.2784314, 1, 0, 1,
-0.5086217, 0.04349282, -2.623881, 0.2705882, 1, 0, 1,
-0.5082283, 0.6959413, -0.2246432, 0.2666667, 1, 0, 1,
-0.5081534, 0.5996109, -0.5493417, 0.2588235, 1, 0, 1,
-0.5034562, 1.724498, -0.5868019, 0.254902, 1, 0, 1,
-0.5016209, 0.4557564, -2.74704, 0.2470588, 1, 0, 1,
-0.5008752, 0.06442873, 1.210411, 0.2431373, 1, 0, 1,
-0.5008548, -1.332814, -3.101599, 0.2352941, 1, 0, 1,
-0.5003518, -0.5688579, -1.972448, 0.2313726, 1, 0, 1,
-0.49406, -1.368885, -2.646656, 0.2235294, 1, 0, 1,
-0.4933366, 0.4851511, -1.290611, 0.2196078, 1, 0, 1,
-0.4835922, 1.14353, -1.376031, 0.2117647, 1, 0, 1,
-0.4834846, 1.593419, -1.404386, 0.2078431, 1, 0, 1,
-0.4764495, -0.7885848, -3.522177, 0.2, 1, 0, 1,
-0.4729467, 0.8496434, -0.4235674, 0.1921569, 1, 0, 1,
-0.4697948, -0.1488139, -1.552111, 0.1882353, 1, 0, 1,
-0.4678762, -0.974071, -2.539076, 0.1803922, 1, 0, 1,
-0.4620237, -1.301051, -2.023587, 0.1764706, 1, 0, 1,
-0.4551379, -1.300341, -3.782601, 0.1686275, 1, 0, 1,
-0.4537568, -0.8529204, -2.990196, 0.1647059, 1, 0, 1,
-0.4527247, -0.2086175, -2.740848, 0.1568628, 1, 0, 1,
-0.4524102, 1.143031, -0.2618498, 0.1529412, 1, 0, 1,
-0.4381903, 1.150951, -0.06960367, 0.145098, 1, 0, 1,
-0.434967, -1.097108, -2.824744, 0.1411765, 1, 0, 1,
-0.4309609, 1.116743, 0.8985066, 0.1333333, 1, 0, 1,
-0.4248358, -2.309681, -2.134376, 0.1294118, 1, 0, 1,
-0.4218011, -1.471212, -1.847405, 0.1215686, 1, 0, 1,
-0.4205599, 0.8332362, -1.773174, 0.1176471, 1, 0, 1,
-0.4177676, -0.1676463, -2.30303, 0.1098039, 1, 0, 1,
-0.4168395, 0.3529143, -0.4202331, 0.1058824, 1, 0, 1,
-0.4164525, 0.5811058, -0.8373992, 0.09803922, 1, 0, 1,
-0.4146284, -0.03034612, -0.1932075, 0.09019608, 1, 0, 1,
-0.4047408, 1.743579, -2.738128, 0.08627451, 1, 0, 1,
-0.4043433, -0.8508711, -2.11684, 0.07843138, 1, 0, 1,
-0.4017657, 1.418236, -0.0550345, 0.07450981, 1, 0, 1,
-0.4010202, 1.489548, -0.2452677, 0.06666667, 1, 0, 1,
-0.397321, 0.1208383, -0.8279846, 0.0627451, 1, 0, 1,
-0.3951323, 0.1680162, -0.3975258, 0.05490196, 1, 0, 1,
-0.3916959, -1.31439, -3.999081, 0.05098039, 1, 0, 1,
-0.3907759, 0.7956358, -0.3825543, 0.04313726, 1, 0, 1,
-0.3895787, 0.5294245, -0.6018471, 0.03921569, 1, 0, 1,
-0.3889648, -0.5684672, -2.823959, 0.03137255, 1, 0, 1,
-0.3875225, 0.8426643, 0.6109254, 0.02745098, 1, 0, 1,
-0.3825561, 0.5739836, -0.9206175, 0.01960784, 1, 0, 1,
-0.3733201, -0.1822296, -2.90707, 0.01568628, 1, 0, 1,
-0.3694354, -1.317171, -4.771287, 0.007843138, 1, 0, 1,
-0.3679744, 0.4369821, 2.354976, 0.003921569, 1, 0, 1,
-0.3663638, 0.7939001, 0.1611722, 0, 1, 0.003921569, 1,
-0.3468318, 0.6011285, -0.7935267, 0, 1, 0.01176471, 1,
-0.3461634, -0.9262804, -4.400939, 0, 1, 0.01568628, 1,
-0.3443573, 2.222111, -0.5015876, 0, 1, 0.02352941, 1,
-0.3427691, 0.1122737, -1.270041, 0, 1, 0.02745098, 1,
-0.3338266, 0.2121747, -1.496777, 0, 1, 0.03529412, 1,
-0.3283443, 0.1401484, -1.226745, 0, 1, 0.03921569, 1,
-0.3274387, -0.7524326, -3.215302, 0, 1, 0.04705882, 1,
-0.327268, 1.618256, 0.01508408, 0, 1, 0.05098039, 1,
-0.3205647, 0.6735906, -0.7604446, 0, 1, 0.05882353, 1,
-0.3202619, -1.845801, -2.603016, 0, 1, 0.0627451, 1,
-0.3170745, 1.601375, -0.3827113, 0, 1, 0.07058824, 1,
-0.315246, 0.5721992, 0.7370797, 0, 1, 0.07450981, 1,
-0.3139079, 2.019955, -1.162924, 0, 1, 0.08235294, 1,
-0.3107913, -1.024375, -4.212664, 0, 1, 0.08627451, 1,
-0.3084298, -0.09711412, -2.021008, 0, 1, 0.09411765, 1,
-0.305795, 1.1157, 0.4446853, 0, 1, 0.1019608, 1,
-0.3051482, 0.08442382, 0.1775204, 0, 1, 0.1058824, 1,
-0.3005497, -0.1685359, -1.830644, 0, 1, 0.1137255, 1,
-0.3001756, -1.157156, -2.76156, 0, 1, 0.1176471, 1,
-0.2970507, -0.7430533, -1.635396, 0, 1, 0.1254902, 1,
-0.2917838, -1.50512, -3.888441, 0, 1, 0.1294118, 1,
-0.2903821, -0.09399816, -2.092112, 0, 1, 0.1372549, 1,
-0.2815348, -1.472851, -2.610486, 0, 1, 0.1411765, 1,
-0.2812171, -1.038084, -1.971316, 0, 1, 0.1490196, 1,
-0.2750667, -0.2278926, -2.983427, 0, 1, 0.1529412, 1,
-0.2746884, 0.4484977, -1.139924, 0, 1, 0.1607843, 1,
-0.2745339, -0.1971276, -1.982617, 0, 1, 0.1647059, 1,
-0.2743712, 1.377541, -0.3822944, 0, 1, 0.172549, 1,
-0.2713605, -0.0928373, -0.7878205, 0, 1, 0.1764706, 1,
-0.2710172, 2.222622, 1.35377, 0, 1, 0.1843137, 1,
-0.2701654, 0.2877447, -1.540969, 0, 1, 0.1882353, 1,
-0.266596, -0.208503, -2.213183, 0, 1, 0.1960784, 1,
-0.2665125, -1.004466, -3.972901, 0, 1, 0.2039216, 1,
-0.2658647, 0.8875703, -1.542057, 0, 1, 0.2078431, 1,
-0.2649251, 1.499664, -1.28164, 0, 1, 0.2156863, 1,
-0.2637548, 0.5058771, -1.230968, 0, 1, 0.2196078, 1,
-0.2592907, 1.698844, -1.952434, 0, 1, 0.227451, 1,
-0.2556808, 0.3945605, -0.1665424, 0, 1, 0.2313726, 1,
-0.25088, -1.147271, -1.907534, 0, 1, 0.2392157, 1,
-0.2496254, -1.816895, -3.585553, 0, 1, 0.2431373, 1,
-0.2442622, 0.7200972, -0.4454849, 0, 1, 0.2509804, 1,
-0.2421756, -1.039208, -3.663917, 0, 1, 0.254902, 1,
-0.2396665, -1.022336, -1.508731, 0, 1, 0.2627451, 1,
-0.2368085, 0.8419461, -0.9316207, 0, 1, 0.2666667, 1,
-0.2343344, -0.4291193, -3.997704, 0, 1, 0.2745098, 1,
-0.2342887, -0.4406854, -3.959225, 0, 1, 0.2784314, 1,
-0.2334034, 0.36224, -1.576078, 0, 1, 0.2862745, 1,
-0.2332816, 0.5114759, -0.8987395, 0, 1, 0.2901961, 1,
-0.2300672, 0.1886996, -0.8916276, 0, 1, 0.2980392, 1,
-0.2277305, 1.431058, 0.6799129, 0, 1, 0.3058824, 1,
-0.2248425, 0.9341357, 0.8054175, 0, 1, 0.3098039, 1,
-0.2208572, -0.2584276, -2.869628, 0, 1, 0.3176471, 1,
-0.2186156, -0.7553827, -1.636876, 0, 1, 0.3215686, 1,
-0.2169135, 2.07884, -0.2135429, 0, 1, 0.3294118, 1,
-0.2159106, 0.8448809, -0.4290037, 0, 1, 0.3333333, 1,
-0.2137064, -0.7642365, -3.197923, 0, 1, 0.3411765, 1,
-0.2135832, 0.9942139, -0.1209565, 0, 1, 0.345098, 1,
-0.2130967, 0.4105818, -2.750481, 0, 1, 0.3529412, 1,
-0.2080438, 0.748192, 0.3886797, 0, 1, 0.3568628, 1,
-0.2063886, 0.5122353, 1.253367, 0, 1, 0.3647059, 1,
-0.2049198, 1.046057, -1.378322, 0, 1, 0.3686275, 1,
-0.2032956, -0.4854745, -2.585122, 0, 1, 0.3764706, 1,
-0.1999702, -1.505115, -1.984816, 0, 1, 0.3803922, 1,
-0.1974917, 0.1237792, -3.573797, 0, 1, 0.3882353, 1,
-0.1956244, -0.6312043, -4.175931, 0, 1, 0.3921569, 1,
-0.193467, 0.4192268, -1.715755, 0, 1, 0.4, 1,
-0.1854259, 0.06619824, 0.2542136, 0, 1, 0.4078431, 1,
-0.1846351, -1.014588, -2.75989, 0, 1, 0.4117647, 1,
-0.1815848, 0.6368703, 0.787642, 0, 1, 0.4196078, 1,
-0.1802275, 0.7542341, 1.401664, 0, 1, 0.4235294, 1,
-0.1763786, 2.576926, 0.9611606, 0, 1, 0.4313726, 1,
-0.1762753, -0.567046, -1.702613, 0, 1, 0.4352941, 1,
-0.1731732, -0.4571902, -2.181789, 0, 1, 0.4431373, 1,
-0.1723138, -0.8408993, -3.443109, 0, 1, 0.4470588, 1,
-0.1708954, -0.0920686, -2.243335, 0, 1, 0.454902, 1,
-0.1708732, -0.1642635, -2.240083, 0, 1, 0.4588235, 1,
-0.1634295, -0.2034707, -1.615089, 0, 1, 0.4666667, 1,
-0.1550875, 0.8820316, 0.4836609, 0, 1, 0.4705882, 1,
-0.1516764, -2.829502, -3.636224, 0, 1, 0.4784314, 1,
-0.1502067, -0.2791118, -2.770915, 0, 1, 0.4823529, 1,
-0.1489554, 0.6439871, -0.8547398, 0, 1, 0.4901961, 1,
-0.1449847, 2.023755, -0.9495808, 0, 1, 0.4941176, 1,
-0.1438387, -0.7196518, -2.2204, 0, 1, 0.5019608, 1,
-0.1413536, 0.03745493, 0.09920448, 0, 1, 0.509804, 1,
-0.1381225, -1.029708, -2.152905, 0, 1, 0.5137255, 1,
-0.1369869, -0.5600775, -3.561473, 0, 1, 0.5215687, 1,
-0.1250393, -0.1014223, -1.86343, 0, 1, 0.5254902, 1,
-0.1246833, 1.5867, -0.4518322, 0, 1, 0.5333334, 1,
-0.1246418, 1.406064, 0.2539126, 0, 1, 0.5372549, 1,
-0.1233776, -0.1605415, -3.015921, 0, 1, 0.5450981, 1,
-0.1219822, -0.2963189, -3.281831, 0, 1, 0.5490196, 1,
-0.1187851, -0.6196808, -2.5448, 0, 1, 0.5568628, 1,
-0.11369, -0.5342849, -1.613058, 0, 1, 0.5607843, 1,
-0.1129158, -0.1951633, -1.417361, 0, 1, 0.5686275, 1,
-0.1120809, 1.407941, -0.06826875, 0, 1, 0.572549, 1,
-0.1099291, -2.225018, -1.933173, 0, 1, 0.5803922, 1,
-0.1067577, -1.620996, -3.725779, 0, 1, 0.5843138, 1,
-0.1066699, 1.492818, -1.237613, 0, 1, 0.5921569, 1,
-0.1044554, 2.277952, -0.3479674, 0, 1, 0.5960785, 1,
-0.1027431, -0.2443797, -1.840862, 0, 1, 0.6039216, 1,
-0.09978203, -0.3662362, -3.580372, 0, 1, 0.6117647, 1,
-0.09827255, 0.4050628, -0.4395287, 0, 1, 0.6156863, 1,
-0.09604664, 0.07694115, -1.776432, 0, 1, 0.6235294, 1,
-0.09488513, -0.6391261, -2.000345, 0, 1, 0.627451, 1,
-0.09182164, 0.4671062, -2.77617, 0, 1, 0.6352941, 1,
-0.0895853, -1.552303, -4.031714, 0, 1, 0.6392157, 1,
-0.0892736, -0.02912071, -1.771599, 0, 1, 0.6470588, 1,
-0.08619755, -0.2783521, -2.418563, 0, 1, 0.6509804, 1,
-0.08482318, -0.1231581, -3.153699, 0, 1, 0.6588235, 1,
-0.08253663, 0.8098205, 0.5341889, 0, 1, 0.6627451, 1,
-0.08105, -0.4409487, -3.677447, 0, 1, 0.6705883, 1,
-0.07784257, -2.195982, -4.03507, 0, 1, 0.6745098, 1,
-0.0749575, 0.785843, 0.08693767, 0, 1, 0.682353, 1,
-0.06955324, -0.9116542, -4.183875, 0, 1, 0.6862745, 1,
-0.06890564, -1.227001, -3.429711, 0, 1, 0.6941177, 1,
-0.06824926, -0.09820117, -2.64438, 0, 1, 0.7019608, 1,
-0.06660823, 0.6855186, 0.8600489, 0, 1, 0.7058824, 1,
-0.06412438, 0.1404698, -0.9402668, 0, 1, 0.7137255, 1,
-0.06364084, -0.0683317, -1.819235, 0, 1, 0.7176471, 1,
-0.06345177, -0.2790612, -2.315675, 0, 1, 0.7254902, 1,
-0.06302034, 0.9862691, 0.8752525, 0, 1, 0.7294118, 1,
-0.06197364, -2.507706, -4.010368, 0, 1, 0.7372549, 1,
-0.05738311, -2.063181, -3.267264, 0, 1, 0.7411765, 1,
-0.05438324, 0.07166299, 0.03640203, 0, 1, 0.7490196, 1,
-0.0484287, 0.3712703, 0.2072115, 0, 1, 0.7529412, 1,
-0.04522587, -1.409939, -3.842623, 0, 1, 0.7607843, 1,
-0.03497725, -0.6979621, -2.765733, 0, 1, 0.7647059, 1,
-0.03241702, 0.4348631, -0.3331048, 0, 1, 0.772549, 1,
-0.0313564, -0.09474798, -2.068371, 0, 1, 0.7764706, 1,
-0.02743536, -0.4088166, -2.160433, 0, 1, 0.7843137, 1,
-0.02695639, 0.06829673, -0.3432355, 0, 1, 0.7882353, 1,
-0.01681359, 0.4384513, 0.3812666, 0, 1, 0.7960784, 1,
-0.01322325, 1.23137, -0.152257, 0, 1, 0.8039216, 1,
-0.01285944, 1.571054, 0.5411671, 0, 1, 0.8078431, 1,
-0.012401, -0.5915594, -3.302263, 0, 1, 0.8156863, 1,
-0.01239177, 1.827188, 0.2583469, 0, 1, 0.8196079, 1,
-0.009593984, -1.680298, -3.809268, 0, 1, 0.827451, 1,
-0.009172374, -0.1442772, -2.666837, 0, 1, 0.8313726, 1,
-0.008878461, -1.079972, -2.988498, 0, 1, 0.8392157, 1,
-0.004855114, 1.770904, 1.200632, 0, 1, 0.8431373, 1,
-0.003337095, 0.5485486, 0.3406362, 0, 1, 0.8509804, 1,
-0.001051632, -0.8418024, -2.524581, 0, 1, 0.854902, 1,
0.0001843731, -1.155538, 4.122025, 0, 1, 0.8627451, 1,
0.007991008, -1.063923, 4.643707, 0, 1, 0.8666667, 1,
0.008144364, -0.2516398, 4.044586, 0, 1, 0.8745098, 1,
0.009935995, -0.6689162, 2.867168, 0, 1, 0.8784314, 1,
0.0133709, 1.211944, -0.760699, 0, 1, 0.8862745, 1,
0.01506073, 0.6122106, 0.9805527, 0, 1, 0.8901961, 1,
0.01747707, -1.416232, 1.452051, 0, 1, 0.8980392, 1,
0.01815721, 1.62231, -0.04299648, 0, 1, 0.9058824, 1,
0.02050191, -1.329178, 2.556105, 0, 1, 0.9098039, 1,
0.02156325, 0.5727682, -2.362137, 0, 1, 0.9176471, 1,
0.02861705, -1.751603, 2.751189, 0, 1, 0.9215686, 1,
0.02944302, -1.431512, 2.621701, 0, 1, 0.9294118, 1,
0.03112902, 0.6481407, -0.2616063, 0, 1, 0.9333333, 1,
0.03249896, 1.080861, 0.1660606, 0, 1, 0.9411765, 1,
0.03360856, -1.209068, 1.483686, 0, 1, 0.945098, 1,
0.03430263, -0.9608884, 0.3688141, 0, 1, 0.9529412, 1,
0.03432997, -0.01075389, 1.6275, 0, 1, 0.9568627, 1,
0.03663942, 1.142031, -0.2233686, 0, 1, 0.9647059, 1,
0.04109111, -1.05613, 5.249751, 0, 1, 0.9686275, 1,
0.04535233, -0.3584758, 3.044627, 0, 1, 0.9764706, 1,
0.04731498, -0.991179, 4.344484, 0, 1, 0.9803922, 1,
0.05562547, -1.598625, 3.617737, 0, 1, 0.9882353, 1,
0.05767518, 0.3135492, 1.44502, 0, 1, 0.9921569, 1,
0.05823462, -0.741459, 4.188549, 0, 1, 1, 1,
0.05869228, -0.08412229, 1.987796, 0, 0.9921569, 1, 1,
0.05931618, -1.103051, 1.799005, 0, 0.9882353, 1, 1,
0.06070369, 1.876834, -1.051092, 0, 0.9803922, 1, 1,
0.06094673, 0.3961346, 0.5266664, 0, 0.9764706, 1, 1,
0.06283022, 1.846814, 0.01851612, 0, 0.9686275, 1, 1,
0.06780063, 0.09753387, 1.609162, 0, 0.9647059, 1, 1,
0.06862582, 0.3576213, -0.7817143, 0, 0.9568627, 1, 1,
0.07056709, 0.4094595, -1.477033, 0, 0.9529412, 1, 1,
0.07184464, -1.140139, 3.94272, 0, 0.945098, 1, 1,
0.07331154, 1.944405, -0.6714002, 0, 0.9411765, 1, 1,
0.07463591, -1.236827, 1.050645, 0, 0.9333333, 1, 1,
0.07555354, 0.06218753, 0.2153765, 0, 0.9294118, 1, 1,
0.08342963, -0.7071934, 2.87532, 0, 0.9215686, 1, 1,
0.08615738, -0.8185686, 2.364027, 0, 0.9176471, 1, 1,
0.0869482, 0.1593138, -0.1285392, 0, 0.9098039, 1, 1,
0.08891865, 1.494805, 0.08860532, 0, 0.9058824, 1, 1,
0.09072006, 2.188343, 1.524982, 0, 0.8980392, 1, 1,
0.09081551, -0.5066754, 2.082572, 0, 0.8901961, 1, 1,
0.09088679, -3.040299, 3.822789, 0, 0.8862745, 1, 1,
0.09245609, 0.3985253, -0.3520851, 0, 0.8784314, 1, 1,
0.09332896, -0.4647649, 2.920289, 0, 0.8745098, 1, 1,
0.09735703, -0.2293632, 4.421376, 0, 0.8666667, 1, 1,
0.09951603, -1.018769, 3.167059, 0, 0.8627451, 1, 1,
0.1067985, -1.045976, 3.078269, 0, 0.854902, 1, 1,
0.1074984, 1.041686, 1.073514, 0, 0.8509804, 1, 1,
0.1083533, 1.355004, 1.168273, 0, 0.8431373, 1, 1,
0.1148577, 1.422597, -0.3734981, 0, 0.8392157, 1, 1,
0.1161662, 1.332662, -0.4975025, 0, 0.8313726, 1, 1,
0.1186165, 0.3229937, 2.533115, 0, 0.827451, 1, 1,
0.1216222, -2.130565, 3.486794, 0, 0.8196079, 1, 1,
0.1217875, 0.3398783, 0.4642645, 0, 0.8156863, 1, 1,
0.1227514, 1.653418, 1.048051, 0, 0.8078431, 1, 1,
0.1236679, -0.735197, 3.92541, 0, 0.8039216, 1, 1,
0.1278764, 0.9860957, 1.246351, 0, 0.7960784, 1, 1,
0.1286218, 0.5179116, -0.9016713, 0, 0.7882353, 1, 1,
0.1289483, 0.4333211, -0.6363547, 0, 0.7843137, 1, 1,
0.1342728, -0.2242091, 0.3644287, 0, 0.7764706, 1, 1,
0.1381885, 0.3199047, 0.3202105, 0, 0.772549, 1, 1,
0.1382283, -1.815419, 3.724683, 0, 0.7647059, 1, 1,
0.1402699, 1.645231, -0.1988694, 0, 0.7607843, 1, 1,
0.1416011, -1.024525, 2.711523, 0, 0.7529412, 1, 1,
0.146058, -2.284316, 3.784702, 0, 0.7490196, 1, 1,
0.150699, -0.7297398, 3.081319, 0, 0.7411765, 1, 1,
0.1518902, 0.4323668, 1.219795, 0, 0.7372549, 1, 1,
0.1534266, -0.5134621, 2.962238, 0, 0.7294118, 1, 1,
0.1539696, -0.24878, 3.728963, 0, 0.7254902, 1, 1,
0.1575979, -0.4007692, 3.821242, 0, 0.7176471, 1, 1,
0.1601397, 0.1492676, 1.12585, 0, 0.7137255, 1, 1,
0.1613612, 0.03818211, 1.974598, 0, 0.7058824, 1, 1,
0.1628573, -0.5600924, 5.771554, 0, 0.6980392, 1, 1,
0.1648165, 1.512464, -1.654076, 0, 0.6941177, 1, 1,
0.1686026, 2.992863, -0.2603136, 0, 0.6862745, 1, 1,
0.1700153, 0.274657, 1.854671, 0, 0.682353, 1, 1,
0.1720164, -0.9668491, 3.247648, 0, 0.6745098, 1, 1,
0.1734611, -0.7244909, 2.440831, 0, 0.6705883, 1, 1,
0.1787316, 0.621483, -0.5815103, 0, 0.6627451, 1, 1,
0.1815413, -0.2609212, 2.94905, 0, 0.6588235, 1, 1,
0.1846558, 1.114097, 0.6072331, 0, 0.6509804, 1, 1,
0.1948475, 1.368935, 0.8629472, 0, 0.6470588, 1, 1,
0.1966989, -0.6903972, 3.936403, 0, 0.6392157, 1, 1,
0.2016494, 1.848764, 0.5909895, 0, 0.6352941, 1, 1,
0.2066716, 1.096193, -0.1668105, 0, 0.627451, 1, 1,
0.2066952, 1.30637, 1.074269, 0, 0.6235294, 1, 1,
0.2090755, -1.308671, 0.7432151, 0, 0.6156863, 1, 1,
0.214591, 0.1036856, 2.119255, 0, 0.6117647, 1, 1,
0.2272054, 0.06174274, 1.385518, 0, 0.6039216, 1, 1,
0.2298926, -1.361282, 3.255513, 0, 0.5960785, 1, 1,
0.2307195, -0.1638011, 2.88352, 0, 0.5921569, 1, 1,
0.2364471, 1.212609, 0.6133543, 0, 0.5843138, 1, 1,
0.236772, -0.2770295, 1.333385, 0, 0.5803922, 1, 1,
0.2409421, 1.488051, 1.539263, 0, 0.572549, 1, 1,
0.2450638, -0.6067532, 2.232225, 0, 0.5686275, 1, 1,
0.2469517, -0.1870082, 2.357815, 0, 0.5607843, 1, 1,
0.250596, 0.1476028, 1.204421, 0, 0.5568628, 1, 1,
0.250803, 0.7251517, 0.4140379, 0, 0.5490196, 1, 1,
0.2525395, 0.6025567, -0.7051561, 0, 0.5450981, 1, 1,
0.2531015, 0.5810909, 0.457554, 0, 0.5372549, 1, 1,
0.2542506, 1.180966, 0.6241081, 0, 0.5333334, 1, 1,
0.255502, -0.4568653, 2.705197, 0, 0.5254902, 1, 1,
0.2558603, -0.4690614, 3.094119, 0, 0.5215687, 1, 1,
0.2575658, 2.131848, 1.717523, 0, 0.5137255, 1, 1,
0.2605867, -0.7742898, 1.599915, 0, 0.509804, 1, 1,
0.2606079, 0.7417802, 0.2775031, 0, 0.5019608, 1, 1,
0.2650602, 0.6089663, 0.8385618, 0, 0.4941176, 1, 1,
0.2789797, 0.3507468, -1.080724, 0, 0.4901961, 1, 1,
0.2876763, 2.404319, 0.8457625, 0, 0.4823529, 1, 1,
0.289916, -0.4453894, 1.993105, 0, 0.4784314, 1, 1,
0.2903689, 0.722205, -0.4851918, 0, 0.4705882, 1, 1,
0.2928185, 1.224832, -1.255642, 0, 0.4666667, 1, 1,
0.2980631, -0.2119503, 1.046403, 0, 0.4588235, 1, 1,
0.3063935, -0.3579336, 3.413997, 0, 0.454902, 1, 1,
0.309293, 1.878299, -0.6988876, 0, 0.4470588, 1, 1,
0.3097436, 0.8700498, 1.270705, 0, 0.4431373, 1, 1,
0.3117976, 0.7907993, 1.0378, 0, 0.4352941, 1, 1,
0.3131831, 0.00706085, 2.895669, 0, 0.4313726, 1, 1,
0.3179376, -1.068545, 2.390379, 0, 0.4235294, 1, 1,
0.320246, -0.0996091, 1.028779, 0, 0.4196078, 1, 1,
0.3204508, -2.046595, 3.567088, 0, 0.4117647, 1, 1,
0.32076, -0.2870857, 2.0058, 0, 0.4078431, 1, 1,
0.321034, 0.1461699, 0.07989384, 0, 0.4, 1, 1,
0.3260876, -0.3364842, 1.818346, 0, 0.3921569, 1, 1,
0.3264771, -0.2242779, 2.784768, 0, 0.3882353, 1, 1,
0.3271855, -0.1562887, 0.2849801, 0, 0.3803922, 1, 1,
0.3277309, -0.6062168, 3.679153, 0, 0.3764706, 1, 1,
0.3325241, 0.1826869, 1.253343, 0, 0.3686275, 1, 1,
0.3345694, -0.3236924, 1.828275, 0, 0.3647059, 1, 1,
0.3351571, 0.2604195, 1.983596, 0, 0.3568628, 1, 1,
0.3353685, 0.03582976, -0.2113502, 0, 0.3529412, 1, 1,
0.3399538, 1.216305, -0.8722234, 0, 0.345098, 1, 1,
0.341455, -0.9074349, 3.726942, 0, 0.3411765, 1, 1,
0.3423896, 0.5589499, 1.342309, 0, 0.3333333, 1, 1,
0.3435307, 0.782537, 3.204759, 0, 0.3294118, 1, 1,
0.3457226, -0.7789758, 2.329928, 0, 0.3215686, 1, 1,
0.3459366, 1.764146, 0.5464137, 0, 0.3176471, 1, 1,
0.3497446, 0.7330495, 0.8114217, 0, 0.3098039, 1, 1,
0.3562256, 1.188048, 0.8989353, 0, 0.3058824, 1, 1,
0.3575415, 1.384979, 0.7605346, 0, 0.2980392, 1, 1,
0.357704, 0.9848853, -1.233081, 0, 0.2901961, 1, 1,
0.3589488, -1.057244, 1.331763, 0, 0.2862745, 1, 1,
0.364761, 0.8113803, 1.952651, 0, 0.2784314, 1, 1,
0.3656999, 1.116783, 0.3231882, 0, 0.2745098, 1, 1,
0.366776, 2.064394, 0.5582041, 0, 0.2666667, 1, 1,
0.3687093, 0.4677575, 1.984361, 0, 0.2627451, 1, 1,
0.3695962, -0.4803835, 1.189652, 0, 0.254902, 1, 1,
0.3766662, -0.05968675, 1.619816, 0, 0.2509804, 1, 1,
0.3773085, 0.2902919, 1.467718, 0, 0.2431373, 1, 1,
0.3774033, 1.390693, 1.428823, 0, 0.2392157, 1, 1,
0.3774908, 0.3595264, 1.332511, 0, 0.2313726, 1, 1,
0.3800819, 0.7735804, -1.575945, 0, 0.227451, 1, 1,
0.3852143, -1.461231, 4.333727, 0, 0.2196078, 1, 1,
0.3873551, -0.9628762, 3.769267, 0, 0.2156863, 1, 1,
0.3921608, 0.1477691, 0.7676492, 0, 0.2078431, 1, 1,
0.3939257, -0.9504988, 2.52432, 0, 0.2039216, 1, 1,
0.3953298, -0.4846665, 2.460881, 0, 0.1960784, 1, 1,
0.3973394, -2.700935, 1.813167, 0, 0.1882353, 1, 1,
0.3988409, 0.159444, 0.3169191, 0, 0.1843137, 1, 1,
0.4041869, 0.4230126, 2.77735, 0, 0.1764706, 1, 1,
0.4046003, -0.9731389, 3.284933, 0, 0.172549, 1, 1,
0.405542, -0.3454787, 2.094917, 0, 0.1647059, 1, 1,
0.4060917, 0.8155963, 1.633747, 0, 0.1607843, 1, 1,
0.4072574, 1.101993, 0.7082982, 0, 0.1529412, 1, 1,
0.407286, -0.5739976, 2.974286, 0, 0.1490196, 1, 1,
0.4082904, 0.3889089, 0.9231013, 0, 0.1411765, 1, 1,
0.408393, 0.04764901, 2.28053, 0, 0.1372549, 1, 1,
0.4108473, 0.3991763, 2.066369, 0, 0.1294118, 1, 1,
0.4154979, -1.728439, 2.530932, 0, 0.1254902, 1, 1,
0.4159881, -1.231502, 4.204724, 0, 0.1176471, 1, 1,
0.4220756, 1.323703, 0.6568913, 0, 0.1137255, 1, 1,
0.4286467, 1.247985, 0.6050852, 0, 0.1058824, 1, 1,
0.4300186, -0.2123751, 1.113688, 0, 0.09803922, 1, 1,
0.4314446, 1.231671, 0.5863442, 0, 0.09411765, 1, 1,
0.4341991, -1.133388, 2.193692, 0, 0.08627451, 1, 1,
0.4470824, 0.3712765, -0.8517596, 0, 0.08235294, 1, 1,
0.4503598, 1.145197, -0.5645586, 0, 0.07450981, 1, 1,
0.4521219, 0.4216266, 1.88743, 0, 0.07058824, 1, 1,
0.4532929, 0.2087273, 0.1446112, 0, 0.0627451, 1, 1,
0.4559314, 0.3179123, 1.312211, 0, 0.05882353, 1, 1,
0.4568135, -1.135055, 3.271328, 0, 0.05098039, 1, 1,
0.4588883, -1.412322, 1.575779, 0, 0.04705882, 1, 1,
0.4595158, 0.9903628, -1.031098, 0, 0.03921569, 1, 1,
0.4596131, -0.5329784, 3.135148, 0, 0.03529412, 1, 1,
0.460218, 2.01109, 0.4586181, 0, 0.02745098, 1, 1,
0.4625706, 1.22418, 1.189826, 0, 0.02352941, 1, 1,
0.4647342, 2.147817, 1.372917, 0, 0.01568628, 1, 1,
0.4668546, -0.2543451, 3.863128, 0, 0.01176471, 1, 1,
0.469728, -1.466276, 3.099743, 0, 0.003921569, 1, 1,
0.4725106, -1.345602, 2.035633, 0.003921569, 0, 1, 1,
0.47371, -0.1576958, 2.162343, 0.007843138, 0, 1, 1,
0.4742096, -0.526232, 2.730994, 0.01568628, 0, 1, 1,
0.4754249, 1.500221, -0.7077003, 0.01960784, 0, 1, 1,
0.4754877, 1.135994, -1.259832, 0.02745098, 0, 1, 1,
0.4792814, -2.879454, 3.291145, 0.03137255, 0, 1, 1,
0.4804845, -0.8001903, 2.274568, 0.03921569, 0, 1, 1,
0.4844513, 0.7512997, 1.287913, 0.04313726, 0, 1, 1,
0.4853518, -1.10873, 2.460901, 0.05098039, 0, 1, 1,
0.4878961, 1.767594, 1.692608, 0.05490196, 0, 1, 1,
0.4896603, -0.2544164, 1.353399, 0.0627451, 0, 1, 1,
0.4911326, 0.3281838, 0.9187315, 0.06666667, 0, 1, 1,
0.4911334, -0.05898007, 2.471021, 0.07450981, 0, 1, 1,
0.4912969, 1.449016, 0.5146167, 0.07843138, 0, 1, 1,
0.4926983, 0.09630248, 1.980301, 0.08627451, 0, 1, 1,
0.5005533, -1.229246, 3.292135, 0.09019608, 0, 1, 1,
0.5011936, 0.3628053, 1.217104, 0.09803922, 0, 1, 1,
0.5041937, 0.3278389, 1.760073, 0.1058824, 0, 1, 1,
0.5065256, 0.856208, 1.304404, 0.1098039, 0, 1, 1,
0.5089759, 0.6240783, 0.5772469, 0.1176471, 0, 1, 1,
0.509095, 0.4353271, 2.518866, 0.1215686, 0, 1, 1,
0.5107781, 0.1228708, 1.276766, 0.1294118, 0, 1, 1,
0.5127234, -0.141644, 2.497843, 0.1333333, 0, 1, 1,
0.5139102, 0.8622493, -1.047898, 0.1411765, 0, 1, 1,
0.5155693, -1.790953, 3.216045, 0.145098, 0, 1, 1,
0.5195947, 1.019444, -0.5704535, 0.1529412, 0, 1, 1,
0.5198561, 0.9103155, 0.6872213, 0.1568628, 0, 1, 1,
0.5204834, -0.02383901, 1.239249, 0.1647059, 0, 1, 1,
0.5298466, -0.9102269, 2.673502, 0.1686275, 0, 1, 1,
0.5373901, -0.6754789, 2.516414, 0.1764706, 0, 1, 1,
0.5412109, -0.7383235, 2.06465, 0.1803922, 0, 1, 1,
0.5439903, -0.2509126, 2.490588, 0.1882353, 0, 1, 1,
0.5449221, 0.00334295, 3.499688, 0.1921569, 0, 1, 1,
0.5477647, -1.004844, 4.223621, 0.2, 0, 1, 1,
0.5487301, -0.04154459, 2.598768, 0.2078431, 0, 1, 1,
0.54887, 1.205797, 0.4092265, 0.2117647, 0, 1, 1,
0.5491587, -0.3000347, 1.512048, 0.2196078, 0, 1, 1,
0.5515992, 0.09819048, 0.7459048, 0.2235294, 0, 1, 1,
0.5518914, 0.2414392, 1.839584, 0.2313726, 0, 1, 1,
0.5547544, -2.365162, 3.563216, 0.2352941, 0, 1, 1,
0.5673522, 1.9107, -0.1408342, 0.2431373, 0, 1, 1,
0.5691588, -1.421602, 3.079752, 0.2470588, 0, 1, 1,
0.574556, -1.017244, 4.33487, 0.254902, 0, 1, 1,
0.5749856, 1.498702, -0.4911612, 0.2588235, 0, 1, 1,
0.5833069, -0.174403, 1.945389, 0.2666667, 0, 1, 1,
0.5837102, 0.2404064, 1.934824, 0.2705882, 0, 1, 1,
0.5849335, -0.7278895, 2.082483, 0.2784314, 0, 1, 1,
0.5862295, -0.3952297, 2.734909, 0.282353, 0, 1, 1,
0.5870538, -0.2160193, 1.048483, 0.2901961, 0, 1, 1,
0.5892886, 0.4338388, 1.564926, 0.2941177, 0, 1, 1,
0.5892907, -0.7565668, 1.366317, 0.3019608, 0, 1, 1,
0.5911717, -1.697703, 2.927533, 0.3098039, 0, 1, 1,
0.5949557, -0.01005172, 1.159312, 0.3137255, 0, 1, 1,
0.5980695, 0.8788932, 1.723402, 0.3215686, 0, 1, 1,
0.5982915, -0.234814, 3.086657, 0.3254902, 0, 1, 1,
0.601545, 0.5596184, 0.01413035, 0.3333333, 0, 1, 1,
0.6017566, 1.734291, 0.3871609, 0.3372549, 0, 1, 1,
0.6026962, -0.9896884, 1.631934, 0.345098, 0, 1, 1,
0.6155004, 0.2394778, 0.8257971, 0.3490196, 0, 1, 1,
0.615779, 0.3064903, 2.167906, 0.3568628, 0, 1, 1,
0.6163599, 1.409385, -0.4372429, 0.3607843, 0, 1, 1,
0.61762, -0.1540388, 1.313867, 0.3686275, 0, 1, 1,
0.6207719, 0.2245366, 1.427629, 0.372549, 0, 1, 1,
0.6211315, -1.343444, 3.31122, 0.3803922, 0, 1, 1,
0.6234145, -1.236435, 4.511835, 0.3843137, 0, 1, 1,
0.6251217, -0.9254307, 2.423297, 0.3921569, 0, 1, 1,
0.6334019, 1.077805, -0.1168997, 0.3960784, 0, 1, 1,
0.6336128, 0.6634132, 0.9611419, 0.4039216, 0, 1, 1,
0.6338807, -0.9308757, 3.33018, 0.4117647, 0, 1, 1,
0.6390884, 0.3643263, -0.4396639, 0.4156863, 0, 1, 1,
0.6427247, 0.4971194, 0.4603636, 0.4235294, 0, 1, 1,
0.6435912, -0.1313908, 1.70224, 0.427451, 0, 1, 1,
0.6458022, 0.3910887, 1.771201, 0.4352941, 0, 1, 1,
0.6501083, 0.06374115, 3.282832, 0.4392157, 0, 1, 1,
0.6510437, -0.2160229, 4.011358, 0.4470588, 0, 1, 1,
0.6515734, 1.327682, -0.9174239, 0.4509804, 0, 1, 1,
0.6528351, 0.4371516, 1.779455, 0.4588235, 0, 1, 1,
0.6613428, -1.296544, 2.876735, 0.4627451, 0, 1, 1,
0.6651475, -0.2760043, 2.434221, 0.4705882, 0, 1, 1,
0.6669477, 0.4403411, 2.349876, 0.4745098, 0, 1, 1,
0.6738575, 0.0415145, 0.3328526, 0.4823529, 0, 1, 1,
0.6746389, 0.8941801, 0.5414472, 0.4862745, 0, 1, 1,
0.6760614, -1.854906, 1.363995, 0.4941176, 0, 1, 1,
0.6790256, 1.023654, 0.07063196, 0.5019608, 0, 1, 1,
0.6806418, -0.7147098, 1.369094, 0.5058824, 0, 1, 1,
0.6872451, -0.4443792, 2.427437, 0.5137255, 0, 1, 1,
0.6926079, 0.9279175, 0.7434186, 0.5176471, 0, 1, 1,
0.7006431, -0.6155385, 3.788182, 0.5254902, 0, 1, 1,
0.705398, -0.4006059, 1.182749, 0.5294118, 0, 1, 1,
0.7062478, -0.4266887, 4.067818, 0.5372549, 0, 1, 1,
0.7075719, -0.9441673, 3.757788, 0.5411765, 0, 1, 1,
0.7084948, -0.4453923, 2.409198, 0.5490196, 0, 1, 1,
0.7106472, 0.2210059, 0.03470635, 0.5529412, 0, 1, 1,
0.7201384, -0.2204106, 2.234215, 0.5607843, 0, 1, 1,
0.7226417, 0.2105049, 3.084334, 0.5647059, 0, 1, 1,
0.7262446, 0.3750818, -0.4743499, 0.572549, 0, 1, 1,
0.7300007, 1.432002, 0.8672667, 0.5764706, 0, 1, 1,
0.7333886, 0.3008007, 3.054133, 0.5843138, 0, 1, 1,
0.7408845, -0.3867364, 2.887555, 0.5882353, 0, 1, 1,
0.7491872, 0.3530322, 1.431769, 0.5960785, 0, 1, 1,
0.7519278, 1.445919, 0.04182822, 0.6039216, 0, 1, 1,
0.7579979, 1.241289, -0.08989365, 0.6078432, 0, 1, 1,
0.7582476, 0.4697536, 1.476386, 0.6156863, 0, 1, 1,
0.7584122, 1.164146, 1.337199, 0.6196079, 0, 1, 1,
0.7645609, -0.7246982, 2.338635, 0.627451, 0, 1, 1,
0.7652122, -0.340704, -0.004205993, 0.6313726, 0, 1, 1,
0.7714971, 0.2298117, 2.070048, 0.6392157, 0, 1, 1,
0.7726765, 1.050013, -1.796739, 0.6431373, 0, 1, 1,
0.7740698, -0.8197991, 2.43332, 0.6509804, 0, 1, 1,
0.7791105, 0.6581575, 1.496248, 0.654902, 0, 1, 1,
0.7837498, 1.672916, -0.3817973, 0.6627451, 0, 1, 1,
0.7909665, 0.5747577, 2.039454, 0.6666667, 0, 1, 1,
0.7919627, -1.31055, 2.034289, 0.6745098, 0, 1, 1,
0.796414, 0.3669288, 2.182173, 0.6784314, 0, 1, 1,
0.7980136, 1.262329, -0.8497816, 0.6862745, 0, 1, 1,
0.8006235, -0.1467566, 1.104749, 0.6901961, 0, 1, 1,
0.8056417, -0.7917488, 1.269125, 0.6980392, 0, 1, 1,
0.8070828, -0.4235459, 3.022475, 0.7058824, 0, 1, 1,
0.8085684, 0.4269079, -0.7357001, 0.7098039, 0, 1, 1,
0.8118929, -0.01447869, 2.557542, 0.7176471, 0, 1, 1,
0.8221086, -0.009769538, 1.73849, 0.7215686, 0, 1, 1,
0.8259289, 0.6804688, 1.682117, 0.7294118, 0, 1, 1,
0.8259488, -0.1323635, -0.251316, 0.7333333, 0, 1, 1,
0.8353229, -0.2333598, 2.719527, 0.7411765, 0, 1, 1,
0.8362408, -1.120439, 2.841871, 0.7450981, 0, 1, 1,
0.8387243, 0.006390767, 2.679909, 0.7529412, 0, 1, 1,
0.8506982, 0.5417041, 0.8452421, 0.7568628, 0, 1, 1,
0.8509205, 1.599954, 1.683679, 0.7647059, 0, 1, 1,
0.8523656, -0.493978, 2.895725, 0.7686275, 0, 1, 1,
0.8536111, 0.9624376, 0.9794178, 0.7764706, 0, 1, 1,
0.8540245, -0.323131, 1.945758, 0.7803922, 0, 1, 1,
0.8552667, 0.01720653, 1.464892, 0.7882353, 0, 1, 1,
0.8648666, 1.511091, -0.9091103, 0.7921569, 0, 1, 1,
0.8652717, 0.4783022, 3.818206, 0.8, 0, 1, 1,
0.8675928, -1.777509, 1.994256, 0.8078431, 0, 1, 1,
0.869219, 0.3139374, 2.121602, 0.8117647, 0, 1, 1,
0.8728792, 1.016635, -1.732445, 0.8196079, 0, 1, 1,
0.8745696, 1.618868, 0.9444198, 0.8235294, 0, 1, 1,
0.8765357, 0.7351444, -0.1621325, 0.8313726, 0, 1, 1,
0.8811249, -0.494003, 2.362109, 0.8352941, 0, 1, 1,
0.8812693, 0.9539194, 0.672812, 0.8431373, 0, 1, 1,
0.8821885, -0.5726842, 2.928335, 0.8470588, 0, 1, 1,
0.8852865, -0.9725523, 2.662207, 0.854902, 0, 1, 1,
0.8858756, 1.381378, 0.6039299, 0.8588235, 0, 1, 1,
0.8863215, 0.9098582, -0.9233072, 0.8666667, 0, 1, 1,
0.8875523, 0.6481411, 0.8007814, 0.8705882, 0, 1, 1,
0.8941222, -1.497171, 3.192608, 0.8784314, 0, 1, 1,
0.8965424, 0.855225, -0.3220286, 0.8823529, 0, 1, 1,
0.8991408, -1.739229, 2.624871, 0.8901961, 0, 1, 1,
0.9029776, -1.078452, 3.287004, 0.8941177, 0, 1, 1,
0.9047634, -1.124487, 2.896681, 0.9019608, 0, 1, 1,
0.908361, -0.1715934, 1.009283, 0.9098039, 0, 1, 1,
0.9105955, -0.04274987, 1.530082, 0.9137255, 0, 1, 1,
0.9132227, -0.6816245, 1.296819, 0.9215686, 0, 1, 1,
0.9164131, 0.4374625, -0.2438726, 0.9254902, 0, 1, 1,
0.9193526, 0.06534892, -0.4258361, 0.9333333, 0, 1, 1,
0.9299498, -0.2141162, 3.023964, 0.9372549, 0, 1, 1,
0.9326514, 0.7031358, -0.1074822, 0.945098, 0, 1, 1,
0.9579566, 1.209503, 0.7845597, 0.9490196, 0, 1, 1,
0.9621084, -0.173089, 1.44713, 0.9568627, 0, 1, 1,
0.9633161, 0.9910207, -0.01454014, 0.9607843, 0, 1, 1,
0.9651677, 0.4933456, 2.795533, 0.9686275, 0, 1, 1,
0.9669876, -0.3205222, 1.525995, 0.972549, 0, 1, 1,
0.9672327, 0.1752384, -0.3801896, 0.9803922, 0, 1, 1,
0.9691924, 1.487637, 0.02444907, 0.9843137, 0, 1, 1,
0.9705343, 0.06527516, 2.829368, 0.9921569, 0, 1, 1,
0.9708825, -0.6590606, 2.593861, 0.9960784, 0, 1, 1,
0.9767472, -0.09085011, 1.547709, 1, 0, 0.9960784, 1,
0.9816533, -0.1551955, 0.2927357, 1, 0, 0.9882353, 1,
0.9855739, -0.1488813, 1.586488, 1, 0, 0.9843137, 1,
0.9882357, 0.4622348, -0.793062, 1, 0, 0.9764706, 1,
0.9890662, 1.593163, 1.94004, 1, 0, 0.972549, 1,
0.9947944, -0.752369, 3.397766, 1, 0, 0.9647059, 1,
0.9965106, -0.8261886, 2.328974, 1, 0, 0.9607843, 1,
0.9966352, 0.2750666, 0.7231342, 1, 0, 0.9529412, 1,
1.008815, -2.661431, 2.694815, 1, 0, 0.9490196, 1,
1.01453, 1.59635, 2.102457, 1, 0, 0.9411765, 1,
1.01604, -1.52984, 2.677062, 1, 0, 0.9372549, 1,
1.026158, -0.9075198, 0.7474922, 1, 0, 0.9294118, 1,
1.03255, 0.8269706, -0.1430258, 1, 0, 0.9254902, 1,
1.032722, -0.250005, 3.276701, 1, 0, 0.9176471, 1,
1.038443, 1.709731, 2.730104, 1, 0, 0.9137255, 1,
1.053649, -0.6004637, 2.020218, 1, 0, 0.9058824, 1,
1.058385, -0.1735552, 2.721153, 1, 0, 0.9019608, 1,
1.059713, 0.3021138, 1.584785, 1, 0, 0.8941177, 1,
1.063953, -0.02135788, 2.223029, 1, 0, 0.8862745, 1,
1.068196, 0.7410421, 1.789538, 1, 0, 0.8823529, 1,
1.074219, 0.04183581, 0.4069425, 1, 0, 0.8745098, 1,
1.080758, -0.8335856, 3.49763, 1, 0, 0.8705882, 1,
1.081187, -0.5089734, 2.065352, 1, 0, 0.8627451, 1,
1.082803, -1.243125, 0.6129754, 1, 0, 0.8588235, 1,
1.085343, -1.538178, 3.76553, 1, 0, 0.8509804, 1,
1.086297, 1.758133, -0.3771015, 1, 0, 0.8470588, 1,
1.089253, -2.498999, 3.358373, 1, 0, 0.8392157, 1,
1.099787, 1.255252, 2.372799, 1, 0, 0.8352941, 1,
1.108259, -0.7445249, 2.431945, 1, 0, 0.827451, 1,
1.117361, -0.9915533, 1.137391, 1, 0, 0.8235294, 1,
1.124479, 0.9531782, 0.6919166, 1, 0, 0.8156863, 1,
1.128084, 0.1364793, 2.662167, 1, 0, 0.8117647, 1,
1.130054, 0.5741256, 1.487869, 1, 0, 0.8039216, 1,
1.134059, 0.8992319, 1.262231, 1, 0, 0.7960784, 1,
1.135303, 1.263165, 1.411927, 1, 0, 0.7921569, 1,
1.136816, -0.7619597, 1.391068, 1, 0, 0.7843137, 1,
1.139369, 0.2739867, 1.57242, 1, 0, 0.7803922, 1,
1.162462, -1.051543, 2.41231, 1, 0, 0.772549, 1,
1.163174, 0.5878129, 1.347953, 1, 0, 0.7686275, 1,
1.164678, 0.07423202, 2.983704, 1, 0, 0.7607843, 1,
1.166362, -0.5048106, 2.845106, 1, 0, 0.7568628, 1,
1.183787, -0.200215, -0.1891871, 1, 0, 0.7490196, 1,
1.184699, -0.03328475, 1.27722, 1, 0, 0.7450981, 1,
1.1869, 0.8042228, 1.323596, 1, 0, 0.7372549, 1,
1.192891, 0.0260969, 1.596922, 1, 0, 0.7333333, 1,
1.196844, -0.5095272, 2.502083, 1, 0, 0.7254902, 1,
1.197078, 1.510515, 0.857194, 1, 0, 0.7215686, 1,
1.199491, 0.07204489, 1.285251, 1, 0, 0.7137255, 1,
1.199929, -0.2304442, 1.501428, 1, 0, 0.7098039, 1,
1.201514, -0.3454407, 1.117364, 1, 0, 0.7019608, 1,
1.205218, 0.2225417, 1.883978, 1, 0, 0.6941177, 1,
1.21183, 0.05401921, 1.665256, 1, 0, 0.6901961, 1,
1.218375, 0.7545978, -0.3359408, 1, 0, 0.682353, 1,
1.219267, -0.01370312, 0.9817755, 1, 0, 0.6784314, 1,
1.222252, 0.5492206, -0.08438567, 1, 0, 0.6705883, 1,
1.231823, -0.2631923, 2.747249, 1, 0, 0.6666667, 1,
1.237986, -0.1983205, 1.135165, 1, 0, 0.6588235, 1,
1.241368, -1.055028, 2.162822, 1, 0, 0.654902, 1,
1.241731, 0.5276611, 0.3314843, 1, 0, 0.6470588, 1,
1.250517, -0.6763606, 3.036954, 1, 0, 0.6431373, 1,
1.264601, 1.513856, 0.2072339, 1, 0, 0.6352941, 1,
1.265872, -2.288464, 3.243155, 1, 0, 0.6313726, 1,
1.270064, -0.6587006, 0.5247988, 1, 0, 0.6235294, 1,
1.27246, 0.01554912, -0.07180323, 1, 0, 0.6196079, 1,
1.275929, -0.4871984, 2.250156, 1, 0, 0.6117647, 1,
1.279437, 0.2464166, 1.879091, 1, 0, 0.6078432, 1,
1.307552, 0.500932, -0.2292659, 1, 0, 0.6, 1,
1.314342, -0.901628, 1.797334, 1, 0, 0.5921569, 1,
1.32131, -1.658925, 2.22611, 1, 0, 0.5882353, 1,
1.322703, -1.051005, 3.98087, 1, 0, 0.5803922, 1,
1.329509, -0.528349, 2.388663, 1, 0, 0.5764706, 1,
1.33003, -1.922072, 3.572338, 1, 0, 0.5686275, 1,
1.333337, -0.8129566, 2.227033, 1, 0, 0.5647059, 1,
1.336302, 1.908784, -1.050202, 1, 0, 0.5568628, 1,
1.343408, 0.5592889, 1.019579, 1, 0, 0.5529412, 1,
1.352654, 0.8464119, 1.094871, 1, 0, 0.5450981, 1,
1.358904, 1.078543, -0.4840444, 1, 0, 0.5411765, 1,
1.360904, -0.8512912, 2.253502, 1, 0, 0.5333334, 1,
1.362798, 0.2913359, 1.316392, 1, 0, 0.5294118, 1,
1.367453, 0.665385, 2.174326, 1, 0, 0.5215687, 1,
1.372804, -0.0290713, 4.444872, 1, 0, 0.5176471, 1,
1.373052, 0.1773558, -0.2699549, 1, 0, 0.509804, 1,
1.37923, -1.247567, 1.241339, 1, 0, 0.5058824, 1,
1.379457, 0.3915995, 3.378138, 1, 0, 0.4980392, 1,
1.38194, -0.1302577, 0.8295234, 1, 0, 0.4901961, 1,
1.383079, -1.75757, 4.399675, 1, 0, 0.4862745, 1,
1.401069, -0.7028943, 1.796731, 1, 0, 0.4784314, 1,
1.424624, -1.199585, 1.726217, 1, 0, 0.4745098, 1,
1.435707, 0.06054733, 1.286065, 1, 0, 0.4666667, 1,
1.442288, 1.745507, -1.979523, 1, 0, 0.4627451, 1,
1.471384, -2.302761, 3.144923, 1, 0, 0.454902, 1,
1.474335, 1.062989, 1.144859, 1, 0, 0.4509804, 1,
1.476921, 0.949598, 1.444293, 1, 0, 0.4431373, 1,
1.482288, -0.07027015, 1.317565, 1, 0, 0.4392157, 1,
1.483061, 1.162111, 2.17647, 1, 0, 0.4313726, 1,
1.485039, 0.6541913, 2.765565, 1, 0, 0.427451, 1,
1.490415, -0.07836138, -0.5640465, 1, 0, 0.4196078, 1,
1.502011, 0.204247, 1.992524, 1, 0, 0.4156863, 1,
1.507343, 1.28436, 0.094762, 1, 0, 0.4078431, 1,
1.515358, -1.048327, 1.294546, 1, 0, 0.4039216, 1,
1.516351, -0.06029318, 0.8552396, 1, 0, 0.3960784, 1,
1.527847, 0.07565265, 2.157613, 1, 0, 0.3882353, 1,
1.537655, 0.01848623, 1.207706, 1, 0, 0.3843137, 1,
1.544168, 0.9247031, 2.439692, 1, 0, 0.3764706, 1,
1.551394, -0.1102255, 1.024639, 1, 0, 0.372549, 1,
1.557809, 0.8519396, 2.498139, 1, 0, 0.3647059, 1,
1.558926, -0.04122918, 3.170079, 1, 0, 0.3607843, 1,
1.562955, 1.131309, 2.526841, 1, 0, 0.3529412, 1,
1.571656, -0.120512, 3.048603, 1, 0, 0.3490196, 1,
1.582182, -0.258008, 2.425434, 1, 0, 0.3411765, 1,
1.598675, 0.954856, 1.150764, 1, 0, 0.3372549, 1,
1.599963, -0.3335729, 2.412722, 1, 0, 0.3294118, 1,
1.601512, 0.7282613, 1.540722, 1, 0, 0.3254902, 1,
1.610913, -1.016298, 3.469232, 1, 0, 0.3176471, 1,
1.61176, -0.3383494, 0.671546, 1, 0, 0.3137255, 1,
1.621692, -0.6706781, 3.018977, 1, 0, 0.3058824, 1,
1.635584, -0.2504225, 1.953725, 1, 0, 0.2980392, 1,
1.666982, 0.6342951, -1.030288, 1, 0, 0.2941177, 1,
1.699232, 1.41988, 0.7824275, 1, 0, 0.2862745, 1,
1.702905, -0.4547471, 2.180825, 1, 0, 0.282353, 1,
1.703674, 0.3029108, 1.542692, 1, 0, 0.2745098, 1,
1.706185, -1.224073, 2.20185, 1, 0, 0.2705882, 1,
1.714884, 1.290141, 2.321404, 1, 0, 0.2627451, 1,
1.715544, 0.536553, 1.208697, 1, 0, 0.2588235, 1,
1.737817, 1.145598, -0.1934161, 1, 0, 0.2509804, 1,
1.738572, 1.326621, 0.3486811, 1, 0, 0.2470588, 1,
1.739982, 0.5577356, 0.7363499, 1, 0, 0.2392157, 1,
1.79769, -0.2951439, 2.143839, 1, 0, 0.2352941, 1,
1.799102, 1.0015, 2.790699, 1, 0, 0.227451, 1,
1.799538, 1.272974, 2.464227, 1, 0, 0.2235294, 1,
1.813942, 0.5160019, 2.939406, 1, 0, 0.2156863, 1,
1.818059, -0.7015134, 2.630849, 1, 0, 0.2117647, 1,
1.849794, -0.2684023, 0.1547508, 1, 0, 0.2039216, 1,
1.874665, -0.4246391, 1.567329, 1, 0, 0.1960784, 1,
1.880071, -0.7086536, 2.080768, 1, 0, 0.1921569, 1,
1.881919, -1.53461, 3.247302, 1, 0, 0.1843137, 1,
1.889525, -1.177591, 1.715428, 1, 0, 0.1803922, 1,
1.917123, -0.3615408, 1.320957, 1, 0, 0.172549, 1,
1.922802, -1.760756, 1.824081, 1, 0, 0.1686275, 1,
1.925338, 0.7852429, 2.769054, 1, 0, 0.1607843, 1,
1.932936, -1.885803, 1.651601, 1, 0, 0.1568628, 1,
1.973901, -1.197191, 1.627887, 1, 0, 0.1490196, 1,
1.981947, 0.227, 0.4402619, 1, 0, 0.145098, 1,
2.009689, -0.2460303, 3.14208, 1, 0, 0.1372549, 1,
2.051261, -0.4214556, 1.088883, 1, 0, 0.1333333, 1,
2.102101, 0.2951363, 1.294453, 1, 0, 0.1254902, 1,
2.105925, 0.1100589, 3.767359, 1, 0, 0.1215686, 1,
2.153809, -1.171936, 2.294793, 1, 0, 0.1137255, 1,
2.171725, -0.6125104, 1.273712, 1, 0, 0.1098039, 1,
2.191923, 1.142768, 3.269982, 1, 0, 0.1019608, 1,
2.198976, -1.805102, 1.660458, 1, 0, 0.09411765, 1,
2.220395, -1.162853, 1.270131, 1, 0, 0.09019608, 1,
2.245699, -1.865359, 3.269004, 1, 0, 0.08235294, 1,
2.249071, 0.8897009, 0.413379, 1, 0, 0.07843138, 1,
2.254308, -0.8185103, 2.387094, 1, 0, 0.07058824, 1,
2.270029, 1.283659, 0.7672659, 1, 0, 0.06666667, 1,
2.354187, 0.4447878, 0.6865276, 1, 0, 0.05882353, 1,
2.36372, 0.6833628, 1.933848, 1, 0, 0.05490196, 1,
2.422267, 0.8644835, -0.398323, 1, 0, 0.04705882, 1,
2.440501, 0.7454111, -0.3850555, 1, 0, 0.04313726, 1,
2.458681, 1.728277, 0.4794511, 1, 0, 0.03529412, 1,
2.466862, -1.239904, 1.698019, 1, 0, 0.03137255, 1,
2.539019, -0.5887437, 4.089065, 1, 0, 0.02352941, 1,
2.924337, 0.1730351, 1.356441, 1, 0, 0.01960784, 1,
2.946012, -0.4243151, 0.7966134, 1, 0, 0.01176471, 1,
2.973858, -0.03151666, 0.1135324, 1, 0, 0.007843138, 1
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
-0.2071354, -4.235882, -6.558299, 0, -0.5, 0.5, 0.5,
-0.2071354, -4.235882, -6.558299, 1, -0.5, 0.5, 0.5,
-0.2071354, -4.235882, -6.558299, 1, 1.5, 0.5, 0.5,
-0.2071354, -4.235882, -6.558299, 0, 1.5, 0.5, 0.5
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
-4.466485, -0.09766483, -6.558299, 0, -0.5, 0.5, 0.5,
-4.466485, -0.09766483, -6.558299, 1, -0.5, 0.5, 0.5,
-4.466485, -0.09766483, -6.558299, 1, 1.5, 0.5, 0.5,
-4.466485, -0.09766483, -6.558299, 0, 1.5, 0.5, 0.5
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
-4.466485, -4.235882, 0.5001338, 0, -0.5, 0.5, 0.5,
-4.466485, -4.235882, 0.5001338, 1, -0.5, 0.5, 0.5,
-4.466485, -4.235882, 0.5001338, 1, 1.5, 0.5, 0.5,
-4.466485, -4.235882, 0.5001338, 0, 1.5, 0.5, 0.5
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
-3, -3.280909, -4.92943,
2, -3.280909, -4.92943,
-3, -3.280909, -4.92943,
-3, -3.440071, -5.200908,
-2, -3.280909, -4.92943,
-2, -3.440071, -5.200908,
-1, -3.280909, -4.92943,
-1, -3.440071, -5.200908,
0, -3.280909, -4.92943,
0, -3.440071, -5.200908,
1, -3.280909, -4.92943,
1, -3.440071, -5.200908,
2, -3.280909, -4.92943,
2, -3.440071, -5.200908
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
-3, -3.758395, -5.743864, 0, -0.5, 0.5, 0.5,
-3, -3.758395, -5.743864, 1, -0.5, 0.5, 0.5,
-3, -3.758395, -5.743864, 1, 1.5, 0.5, 0.5,
-3, -3.758395, -5.743864, 0, 1.5, 0.5, 0.5,
-2, -3.758395, -5.743864, 0, -0.5, 0.5, 0.5,
-2, -3.758395, -5.743864, 1, -0.5, 0.5, 0.5,
-2, -3.758395, -5.743864, 1, 1.5, 0.5, 0.5,
-2, -3.758395, -5.743864, 0, 1.5, 0.5, 0.5,
-1, -3.758395, -5.743864, 0, -0.5, 0.5, 0.5,
-1, -3.758395, -5.743864, 1, -0.5, 0.5, 0.5,
-1, -3.758395, -5.743864, 1, 1.5, 0.5, 0.5,
-1, -3.758395, -5.743864, 0, 1.5, 0.5, 0.5,
0, -3.758395, -5.743864, 0, -0.5, 0.5, 0.5,
0, -3.758395, -5.743864, 1, -0.5, 0.5, 0.5,
0, -3.758395, -5.743864, 1, 1.5, 0.5, 0.5,
0, -3.758395, -5.743864, 0, 1.5, 0.5, 0.5,
1, -3.758395, -5.743864, 0, -0.5, 0.5, 0.5,
1, -3.758395, -5.743864, 1, -0.5, 0.5, 0.5,
1, -3.758395, -5.743864, 1, 1.5, 0.5, 0.5,
1, -3.758395, -5.743864, 0, 1.5, 0.5, 0.5,
2, -3.758395, -5.743864, 0, -0.5, 0.5, 0.5,
2, -3.758395, -5.743864, 1, -0.5, 0.5, 0.5,
2, -3.758395, -5.743864, 1, 1.5, 0.5, 0.5,
2, -3.758395, -5.743864, 0, 1.5, 0.5, 0.5
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
-3.483558, -3, -4.92943,
-3.483558, 2, -4.92943,
-3.483558, -3, -4.92943,
-3.647379, -3, -5.200908,
-3.483558, -2, -4.92943,
-3.647379, -2, -5.200908,
-3.483558, -1, -4.92943,
-3.647379, -1, -5.200908,
-3.483558, 0, -4.92943,
-3.647379, 0, -5.200908,
-3.483558, 1, -4.92943,
-3.647379, 1, -5.200908,
-3.483558, 2, -4.92943,
-3.647379, 2, -5.200908
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
-3.975022, -3, -5.743864, 0, -0.5, 0.5, 0.5,
-3.975022, -3, -5.743864, 1, -0.5, 0.5, 0.5,
-3.975022, -3, -5.743864, 1, 1.5, 0.5, 0.5,
-3.975022, -3, -5.743864, 0, 1.5, 0.5, 0.5,
-3.975022, -2, -5.743864, 0, -0.5, 0.5, 0.5,
-3.975022, -2, -5.743864, 1, -0.5, 0.5, 0.5,
-3.975022, -2, -5.743864, 1, 1.5, 0.5, 0.5,
-3.975022, -2, -5.743864, 0, 1.5, 0.5, 0.5,
-3.975022, -1, -5.743864, 0, -0.5, 0.5, 0.5,
-3.975022, -1, -5.743864, 1, -0.5, 0.5, 0.5,
-3.975022, -1, -5.743864, 1, 1.5, 0.5, 0.5,
-3.975022, -1, -5.743864, 0, 1.5, 0.5, 0.5,
-3.975022, 0, -5.743864, 0, -0.5, 0.5, 0.5,
-3.975022, 0, -5.743864, 1, -0.5, 0.5, 0.5,
-3.975022, 0, -5.743864, 1, 1.5, 0.5, 0.5,
-3.975022, 0, -5.743864, 0, 1.5, 0.5, 0.5,
-3.975022, 1, -5.743864, 0, -0.5, 0.5, 0.5,
-3.975022, 1, -5.743864, 1, -0.5, 0.5, 0.5,
-3.975022, 1, -5.743864, 1, 1.5, 0.5, 0.5,
-3.975022, 1, -5.743864, 0, 1.5, 0.5, 0.5,
-3.975022, 2, -5.743864, 0, -0.5, 0.5, 0.5,
-3.975022, 2, -5.743864, 1, -0.5, 0.5, 0.5,
-3.975022, 2, -5.743864, 1, 1.5, 0.5, 0.5,
-3.975022, 2, -5.743864, 0, 1.5, 0.5, 0.5
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
-3.483558, -3.280909, -4,
-3.483558, -3.280909, 4,
-3.483558, -3.280909, -4,
-3.647379, -3.440071, -4,
-3.483558, -3.280909, -2,
-3.647379, -3.440071, -2,
-3.483558, -3.280909, 0,
-3.647379, -3.440071, 0,
-3.483558, -3.280909, 2,
-3.647379, -3.440071, 2,
-3.483558, -3.280909, 4,
-3.647379, -3.440071, 4
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
-3.975022, -3.758395, -4, 0, -0.5, 0.5, 0.5,
-3.975022, -3.758395, -4, 1, -0.5, 0.5, 0.5,
-3.975022, -3.758395, -4, 1, 1.5, 0.5, 0.5,
-3.975022, -3.758395, -4, 0, 1.5, 0.5, 0.5,
-3.975022, -3.758395, -2, 0, -0.5, 0.5, 0.5,
-3.975022, -3.758395, -2, 1, -0.5, 0.5, 0.5,
-3.975022, -3.758395, -2, 1, 1.5, 0.5, 0.5,
-3.975022, -3.758395, -2, 0, 1.5, 0.5, 0.5,
-3.975022, -3.758395, 0, 0, -0.5, 0.5, 0.5,
-3.975022, -3.758395, 0, 1, -0.5, 0.5, 0.5,
-3.975022, -3.758395, 0, 1, 1.5, 0.5, 0.5,
-3.975022, -3.758395, 0, 0, 1.5, 0.5, 0.5,
-3.975022, -3.758395, 2, 0, -0.5, 0.5, 0.5,
-3.975022, -3.758395, 2, 1, -0.5, 0.5, 0.5,
-3.975022, -3.758395, 2, 1, 1.5, 0.5, 0.5,
-3.975022, -3.758395, 2, 0, 1.5, 0.5, 0.5,
-3.975022, -3.758395, 4, 0, -0.5, 0.5, 0.5,
-3.975022, -3.758395, 4, 1, -0.5, 0.5, 0.5,
-3.975022, -3.758395, 4, 1, 1.5, 0.5, 0.5,
-3.975022, -3.758395, 4, 0, 1.5, 0.5, 0.5
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
-3.483558, -3.280909, -4.92943,
-3.483558, 3.085579, -4.92943,
-3.483558, -3.280909, 5.929697,
-3.483558, 3.085579, 5.929697,
-3.483558, -3.280909, -4.92943,
-3.483558, -3.280909, 5.929697,
-3.483558, 3.085579, -4.92943,
-3.483558, 3.085579, 5.929697,
-3.483558, -3.280909, -4.92943,
3.069288, -3.280909, -4.92943,
-3.483558, -3.280909, 5.929697,
3.069288, -3.280909, 5.929697,
-3.483558, 3.085579, -4.92943,
3.069288, 3.085579, -4.92943,
-3.483558, 3.085579, 5.929697,
3.069288, 3.085579, 5.929697,
3.069288, -3.280909, -4.92943,
3.069288, 3.085579, -4.92943,
3.069288, -3.280909, 5.929697,
3.069288, 3.085579, 5.929697,
3.069288, -3.280909, -4.92943,
3.069288, -3.280909, 5.929697,
3.069288, 3.085579, -4.92943,
3.069288, 3.085579, 5.929697
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
var radius = 7.577871;
var distance = 33.7148;
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
mvMatrix.translate( 0.2071354, 0.09766483, -0.5001338 );
mvMatrix.scale( 1.250349, 1.286949, 0.7545121 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.7148);
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
Sulfuryl_Fluoride<-read.table("Sulfuryl_Fluoride.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Sulfuryl_Fluoride$V2
```

```
## Error in eval(expr, envir, enclos): object 'Sulfuryl_Fluoride' not found
```

```r
y<-Sulfuryl_Fluoride$V3
```

```
## Error in eval(expr, envir, enclos): object 'Sulfuryl_Fluoride' not found
```

```r
z<-Sulfuryl_Fluoride$V4
```

```
## Error in eval(expr, envir, enclos): object 'Sulfuryl_Fluoride' not found
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
-3.388129, -1.321373, -0.5075435, 0, 0, 1, 1, 1,
-3.216908, 0.1474529, -2.204092, 1, 0, 0, 1, 1,
-3.002159, -0.2242951, -0.8674144, 1, 0, 0, 1, 1,
-2.899137, -0.2764636, -1.905785, 1, 0, 0, 1, 1,
-2.696846, 0.2689431, -2.121947, 1, 0, 0, 1, 1,
-2.665474, -0.9378147, -1.585248, 1, 0, 0, 1, 1,
-2.535314, 0.5826455, -1.522194, 0, 0, 0, 1, 1,
-2.457227, 0.3797538, -1.28947, 0, 0, 0, 1, 1,
-2.330437, -1.227402, -3.946656, 0, 0, 0, 1, 1,
-2.275932, -0.133508, -2.867871, 0, 0, 0, 1, 1,
-2.266152, -0.4992805, -1.294284, 0, 0, 0, 1, 1,
-2.224968, 0.5357081, 0.9055225, 0, 0, 0, 1, 1,
-2.222786, -0.4080723, -1.152745, 0, 0, 0, 1, 1,
-2.167377, 0.9874154, -2.719392, 1, 1, 1, 1, 1,
-2.153732, -1.094783, -2.149214, 1, 1, 1, 1, 1,
-2.121895, -0.9884644, -2.495129, 1, 1, 1, 1, 1,
-2.071735, 0.304123, -0.1458217, 1, 1, 1, 1, 1,
-2.056198, 0.1056322, -1.798396, 1, 1, 1, 1, 1,
-2.052233, 0.2668229, -1.958873, 1, 1, 1, 1, 1,
-2.043417, -1.841884, -0.5633688, 1, 1, 1, 1, 1,
-2.036105, -0.1502137, -1.76365, 1, 1, 1, 1, 1,
-2.027327, 0.865647, -0.9401889, 1, 1, 1, 1, 1,
-1.99719, -0.3244759, -1.41227, 1, 1, 1, 1, 1,
-1.915704, 0.9481021, -2.057945, 1, 1, 1, 1, 1,
-1.912058, 0.7284232, -1.012971, 1, 1, 1, 1, 1,
-1.907594, 0.1020829, -0.6047572, 1, 1, 1, 1, 1,
-1.898498, -0.4761755, -2.673091, 1, 1, 1, 1, 1,
-1.896742, 0.5572499, -2.080103, 1, 1, 1, 1, 1,
-1.854431, 0.2081545, -0.7274092, 0, 0, 1, 1, 1,
-1.838087, -0.3240618, -2.767916, 1, 0, 0, 1, 1,
-1.827906, -0.9035254, -3.806333, 1, 0, 0, 1, 1,
-1.816079, -0.1943963, 0.08042929, 1, 0, 0, 1, 1,
-1.810344, -0.6496954, -1.565479, 1, 0, 0, 1, 1,
-1.800479, 1.600937, -2.193387, 1, 0, 0, 1, 1,
-1.797816, -1.656856, -3.182424, 0, 0, 0, 1, 1,
-1.777031, 0.6038908, -0.8807293, 0, 0, 0, 1, 1,
-1.774903, -1.520483, -3.209026, 0, 0, 0, 1, 1,
-1.767208, 1.091628, -1.694358, 0, 0, 0, 1, 1,
-1.764996, -0.1295792, -0.7280725, 0, 0, 0, 1, 1,
-1.759751, 1.202668, 0.4704608, 0, 0, 0, 1, 1,
-1.756108, 1.149768, -1.000165, 0, 0, 0, 1, 1,
-1.750817, -0.05901963, -2.652522, 1, 1, 1, 1, 1,
-1.741153, 0.1108568, -1.346678, 1, 1, 1, 1, 1,
-1.734003, -0.6351225, -3.582323, 1, 1, 1, 1, 1,
-1.72424, 0.6931676, -2.192139, 1, 1, 1, 1, 1,
-1.723312, 1.212423, 0.006854945, 1, 1, 1, 1, 1,
-1.70142, 0.4258121, -1.325868, 1, 1, 1, 1, 1,
-1.698578, -0.5090851, -2.81713, 1, 1, 1, 1, 1,
-1.693057, -0.6189206, -0.9799172, 1, 1, 1, 1, 1,
-1.691665, -0.3859051, -0.6206754, 1, 1, 1, 1, 1,
-1.638776, 0.05258452, -3.321652, 1, 1, 1, 1, 1,
-1.63529, -0.8342572, -2.197688, 1, 1, 1, 1, 1,
-1.623981, 1.669509, -0.4833146, 1, 1, 1, 1, 1,
-1.619587, 1.34206, -1.098252, 1, 1, 1, 1, 1,
-1.616981, 0.5929356, -1.736616, 1, 1, 1, 1, 1,
-1.607586, 0.219818, -1.420426, 1, 1, 1, 1, 1,
-1.583795, 0.5964866, -1.31535, 0, 0, 1, 1, 1,
-1.579562, -0.6575755, -1.65541, 1, 0, 0, 1, 1,
-1.563047, -0.05601446, -1.700939, 1, 0, 0, 1, 1,
-1.560352, 1.405305, -1.171371, 1, 0, 0, 1, 1,
-1.556629, -1.722756, -0.6065891, 1, 0, 0, 1, 1,
-1.556605, -0.6619664, -1.983543, 1, 0, 0, 1, 1,
-1.549967, -0.1175365, -0.5779807, 0, 0, 0, 1, 1,
-1.546071, -0.0769934, -1.903453, 0, 0, 0, 1, 1,
-1.543338, -0.3399473, -0.6020202, 0, 0, 0, 1, 1,
-1.53592, 1.770634, -0.236112, 0, 0, 0, 1, 1,
-1.527717, -0.4576699, -0.1339764, 0, 0, 0, 1, 1,
-1.517982, -1.254831, -1.302248, 0, 0, 0, 1, 1,
-1.505883, 0.6436862, -1.134435, 0, 0, 0, 1, 1,
-1.501894, 0.6494907, -2.399156, 1, 1, 1, 1, 1,
-1.48409, -1.335968, -3.677464, 1, 1, 1, 1, 1,
-1.469092, 1.49811, -0.4224225, 1, 1, 1, 1, 1,
-1.466466, 1.325784, 0.236682, 1, 1, 1, 1, 1,
-1.465781, 2.179255, -1.322596, 1, 1, 1, 1, 1,
-1.452992, -0.4770857, -1.843178, 1, 1, 1, 1, 1,
-1.451645, -1.083287, -2.844482, 1, 1, 1, 1, 1,
-1.448102, 0.1205768, -0.658625, 1, 1, 1, 1, 1,
-1.432579, 1.548334, -0.6015348, 1, 1, 1, 1, 1,
-1.431399, 0.05853522, -3.538332, 1, 1, 1, 1, 1,
-1.429014, -1.716278, -1.648278, 1, 1, 1, 1, 1,
-1.426838, -1.488576, -2.839744, 1, 1, 1, 1, 1,
-1.426028, -0.2375815, -2.653238, 1, 1, 1, 1, 1,
-1.424431, -0.8766347, -4.187947, 1, 1, 1, 1, 1,
-1.393895, -0.2649608, -2.30855, 1, 1, 1, 1, 1,
-1.383704, -0.8838637, -2.373405, 0, 0, 1, 1, 1,
-1.380816, 0.3457149, -1.069149, 1, 0, 0, 1, 1,
-1.380563, 1.044765, -0.3618399, 1, 0, 0, 1, 1,
-1.360402, 0.7829859, -2.085531, 1, 0, 0, 1, 1,
-1.345649, -0.5085468, -1.032462, 1, 0, 0, 1, 1,
-1.345102, -0.3258671, -1.582723, 1, 0, 0, 1, 1,
-1.342923, -0.7676021, -2.662357, 0, 0, 0, 1, 1,
-1.331462, -0.1913922, -1.309494, 0, 0, 0, 1, 1,
-1.321899, 1.215968, -1.268526, 0, 0, 0, 1, 1,
-1.31874, -3.188193, -2.742819, 0, 0, 0, 1, 1,
-1.312431, 2.062327, -0.136448, 0, 0, 0, 1, 1,
-1.299179, -0.2731798, -3.054821, 0, 0, 0, 1, 1,
-1.296429, 1.148134, 0.1389171, 0, 0, 0, 1, 1,
-1.285723, -1.400232, -1.392395, 1, 1, 1, 1, 1,
-1.277262, -0.1312411, -3.036317, 1, 1, 1, 1, 1,
-1.272521, 1.263551, -2.458078, 1, 1, 1, 1, 1,
-1.26593, 1.270916, -1.016314, 1, 1, 1, 1, 1,
-1.263826, -0.3647353, -0.1746327, 1, 1, 1, 1, 1,
-1.255108, -0.5132099, -1.684805, 1, 1, 1, 1, 1,
-1.251805, -0.06450294, -1.787537, 1, 1, 1, 1, 1,
-1.249385, -2.790085, -3.568908, 1, 1, 1, 1, 1,
-1.249246, -1.103515, -2.321146, 1, 1, 1, 1, 1,
-1.249009, -0.8083214, -3.158048, 1, 1, 1, 1, 1,
-1.245531, 0.5023875, -0.8266044, 1, 1, 1, 1, 1,
-1.231924, -0.1206383, -0.1717301, 1, 1, 1, 1, 1,
-1.231694, -0.3232472, -3.911273, 1, 1, 1, 1, 1,
-1.208645, 1.24053, -0.8310122, 1, 1, 1, 1, 1,
-1.206115, 0.9439492, -0.4955654, 1, 1, 1, 1, 1,
-1.189085, -0.4149576, -2.781942, 0, 0, 1, 1, 1,
-1.186067, -1.171246, -4.449368, 1, 0, 0, 1, 1,
-1.182552, 0.6842514, 0.1141225, 1, 0, 0, 1, 1,
-1.181157, -0.5679969, -3.397831, 1, 0, 0, 1, 1,
-1.176926, 0.9318284, 0.5104703, 1, 0, 0, 1, 1,
-1.170533, -0.3612446, -2.192191, 1, 0, 0, 1, 1,
-1.166796, 0.49991, -1.41711, 0, 0, 0, 1, 1,
-1.166537, -0.6634241, -1.257026, 0, 0, 0, 1, 1,
-1.158695, 0.3386894, -2.533915, 0, 0, 0, 1, 1,
-1.151597, 1.597697, -0.7653664, 0, 0, 0, 1, 1,
-1.144094, -0.7982822, -2.950842, 0, 0, 0, 1, 1,
-1.138899, 0.3561005, 0.4647334, 0, 0, 0, 1, 1,
-1.132568, 1.705045, -0.2338143, 0, 0, 0, 1, 1,
-1.099523, -0.6106661, -0.8274443, 1, 1, 1, 1, 1,
-1.097885, 0.9237911, -1.907509, 1, 1, 1, 1, 1,
-1.095609, -0.8026103, -1.439004, 1, 1, 1, 1, 1,
-1.092056, -2.381438, -2.588094, 1, 1, 1, 1, 1,
-1.08998, 0.9449071, -0.5515712, 1, 1, 1, 1, 1,
-1.089425, 0.5977823, -1.922981, 1, 1, 1, 1, 1,
-1.088532, 1.29467, -0.9080918, 1, 1, 1, 1, 1,
-1.087604, -1.111806, -2.633204, 1, 1, 1, 1, 1,
-1.080676, 1.266014, -2.320087, 1, 1, 1, 1, 1,
-1.064263, -1.15605, -1.973501, 1, 1, 1, 1, 1,
-1.062414, 0.5749167, -2.511854, 1, 1, 1, 1, 1,
-1.061647, 0.9787379, -2.246716, 1, 1, 1, 1, 1,
-1.061332, -0.6069241, -3.513656, 1, 1, 1, 1, 1,
-1.055821, 2.358785, 1.612458, 1, 1, 1, 1, 1,
-1.050568, 1.285145, -0.3730005, 1, 1, 1, 1, 1,
-1.041108, 1.120902, -0.8647106, 0, 0, 1, 1, 1,
-1.037241, -1.417976, -2.833789, 1, 0, 0, 1, 1,
-1.03462, -0.1423469, 0.2185377, 1, 0, 0, 1, 1,
-1.018336, 0.2970497, -1.251125, 1, 0, 0, 1, 1,
-1.018204, 0.0619459, -3.457759, 1, 0, 0, 1, 1,
-1.010326, 0.4181189, -0.6901423, 1, 0, 0, 1, 1,
-1.008899, -1.738984, -4.21073, 0, 0, 0, 1, 1,
-1.004636, 0.4261404, 0.06489271, 0, 0, 0, 1, 1,
-0.9917188, -0.3340742, -1.021401, 0, 0, 0, 1, 1,
-0.98836, 1.563148, -0.4283752, 0, 0, 0, 1, 1,
-0.9878466, -0.01995189, -2.952522, 0, 0, 0, 1, 1,
-0.9870724, 0.2304356, -1.45259, 0, 0, 0, 1, 1,
-0.9740893, 0.7161713, 0.2985801, 0, 0, 0, 1, 1,
-0.9740493, -0.7482324, -1.407777, 1, 1, 1, 1, 1,
-0.96728, -0.2371052, -1.997777, 1, 1, 1, 1, 1,
-0.9636184, -0.4013379, -2.625672, 1, 1, 1, 1, 1,
-0.9575039, 1.736346, 1.004464, 1, 1, 1, 1, 1,
-0.9561956, 0.08997171, -2.163593, 1, 1, 1, 1, 1,
-0.9439507, 0.7541595, -1.742164, 1, 1, 1, 1, 1,
-0.9434458, 0.01734763, -3.0532, 1, 1, 1, 1, 1,
-0.94105, 0.5049253, -0.5134101, 1, 1, 1, 1, 1,
-0.937648, 0.2759785, -1.22598, 1, 1, 1, 1, 1,
-0.9351258, -1.585798, -3.028386, 1, 1, 1, 1, 1,
-0.9340104, -1.006414, -3.7417, 1, 1, 1, 1, 1,
-0.9247166, 1.280173, -0.4399168, 1, 1, 1, 1, 1,
-0.922105, -0.4619382, -2.389232, 1, 1, 1, 1, 1,
-0.9220576, -1.116039, -1.345709, 1, 1, 1, 1, 1,
-0.922013, 0.9862226, -1.32716, 1, 1, 1, 1, 1,
-0.9209422, 0.2518131, -1.092462, 0, 0, 1, 1, 1,
-0.9091156, 0.02981221, -2.004656, 1, 0, 0, 1, 1,
-0.9044012, -0.03787383, -1.58005, 1, 0, 0, 1, 1,
-0.8941063, 0.9964359, 0.2801699, 1, 0, 0, 1, 1,
-0.8904797, -0.2430144, -1.02866, 1, 0, 0, 1, 1,
-0.8794414, 0.2026946, -0.8410803, 1, 0, 0, 1, 1,
-0.8784953, -0.1805726, -2.554374, 0, 0, 0, 1, 1,
-0.8770638, -0.4648774, -0.7210026, 0, 0, 0, 1, 1,
-0.8769586, 0.556258, -0.6426334, 0, 0, 0, 1, 1,
-0.8760176, 0.8279602, 0.3426535, 0, 0, 0, 1, 1,
-0.8750117, 0.124257, -0.8946306, 0, 0, 0, 1, 1,
-0.8748777, -0.2588065, -2.486039, 0, 0, 0, 1, 1,
-0.8742333, 0.1674242, -3.179823, 0, 0, 0, 1, 1,
-0.8684153, 1.147401, -1.235214, 1, 1, 1, 1, 1,
-0.8663076, 0.741305, -0.7099016, 1, 1, 1, 1, 1,
-0.8651478, 0.4085181, -1.821029, 1, 1, 1, 1, 1,
-0.8621877, -0.2912855, -1.05154, 1, 1, 1, 1, 1,
-0.8618191, 0.8531837, -0.1780327, 1, 1, 1, 1, 1,
-0.8593701, -0.07795042, -1.031666, 1, 1, 1, 1, 1,
-0.8585235, 0.3631888, 1.120926, 1, 1, 1, 1, 1,
-0.8577744, 1.983609, -1.874262, 1, 1, 1, 1, 1,
-0.8549722, 0.3711747, 0.02963635, 1, 1, 1, 1, 1,
-0.8490773, -0.3521905, -2.151664, 1, 1, 1, 1, 1,
-0.847804, 0.1460166, 0.150714, 1, 1, 1, 1, 1,
-0.8461159, 0.5095511, -0.6208034, 1, 1, 1, 1, 1,
-0.8398348, -0.7407423, -1.507189, 1, 1, 1, 1, 1,
-0.8367528, 1.58444, 0.4242468, 1, 1, 1, 1, 1,
-0.8273144, -0.8555364, -2.499593, 1, 1, 1, 1, 1,
-0.816274, -2.327561, -3.040068, 0, 0, 1, 1, 1,
-0.8151203, -0.2201576, -3.481952, 1, 0, 0, 1, 1,
-0.8143703, 0.4428385, -2.8189, 1, 0, 0, 1, 1,
-0.8134196, -0.05942796, -2.824169, 1, 0, 0, 1, 1,
-0.8130807, 0.6522069, -0.8407366, 1, 0, 0, 1, 1,
-0.8057148, 1.624839, -1.081529, 1, 0, 0, 1, 1,
-0.8046229, 0.5619624, 0.7585055, 0, 0, 0, 1, 1,
-0.8038605, -1.227585, -3.956892, 0, 0, 0, 1, 1,
-0.7995058, 0.7296473, -0.6613019, 0, 0, 0, 1, 1,
-0.7976077, 0.4841401, -2.771669, 0, 0, 0, 1, 1,
-0.7906942, -0.2989617, -0.4183371, 0, 0, 0, 1, 1,
-0.7866603, 0.3231961, -0.2671451, 0, 0, 0, 1, 1,
-0.7860997, -0.5069839, -1.953852, 0, 0, 0, 1, 1,
-0.7785511, -0.5652977, -3.462859, 1, 1, 1, 1, 1,
-0.7720643, 1.399213, 0.8451962, 1, 1, 1, 1, 1,
-0.7717604, -1.460417, -2.556463, 1, 1, 1, 1, 1,
-0.7692885, 0.3687572, -1.742844, 1, 1, 1, 1, 1,
-0.7679161, -0.3371295, -2.284762, 1, 1, 1, 1, 1,
-0.7678447, -0.4702932, -2.647282, 1, 1, 1, 1, 1,
-0.7650502, -0.1678841, -1.522303, 1, 1, 1, 1, 1,
-0.7649041, -0.512315, -4.218113, 1, 1, 1, 1, 1,
-0.7608201, -1.063876, -4.240104, 1, 1, 1, 1, 1,
-0.759473, -0.5447633, -2.728838, 1, 1, 1, 1, 1,
-0.7590457, -0.3183405, -2.865, 1, 1, 1, 1, 1,
-0.7551894, -0.5580289, -2.485252, 1, 1, 1, 1, 1,
-0.7478763, -0.543909, -1.468423, 1, 1, 1, 1, 1,
-0.7443161, 1.545262, -1.830417, 1, 1, 1, 1, 1,
-0.7401176, -0.4609611, -2.942335, 1, 1, 1, 1, 1,
-0.7310983, -0.7648394, -2.012192, 0, 0, 1, 1, 1,
-0.7279047, -0.1851889, -3.356579, 1, 0, 0, 1, 1,
-0.7276492, -0.7266943, -2.20204, 1, 0, 0, 1, 1,
-0.7216172, 0.2292613, 1.459152, 1, 0, 0, 1, 1,
-0.7197003, -0.8077991, -2.655051, 1, 0, 0, 1, 1,
-0.7178617, -0.7238622, -2.22695, 1, 0, 0, 1, 1,
-0.716857, -0.488993, 0.2528214, 0, 0, 0, 1, 1,
-0.7127594, 0.9443142, -0.5569164, 0, 0, 0, 1, 1,
-0.7042799, 0.483775, -0.5393407, 0, 0, 0, 1, 1,
-0.6961512, 1.822798, -0.04264297, 0, 0, 0, 1, 1,
-0.6887333, -1.558842, -2.197652, 0, 0, 0, 1, 1,
-0.6841208, -1.355601, -2.085086, 0, 0, 0, 1, 1,
-0.6826855, 0.6187475, -1.709046, 0, 0, 0, 1, 1,
-0.6823922, -0.3821682, -1.981551, 1, 1, 1, 1, 1,
-0.6804926, 0.9781505, -0.2517518, 1, 1, 1, 1, 1,
-0.6781722, -0.5818876, -3.891504, 1, 1, 1, 1, 1,
-0.6702656, 1.01141, -1.191136, 1, 1, 1, 1, 1,
-0.6653295, 0.1352005, -0.5788655, 1, 1, 1, 1, 1,
-0.6592543, -1.490502, -1.692481, 1, 1, 1, 1, 1,
-0.6591467, 0.6754937, -0.2535057, 1, 1, 1, 1, 1,
-0.6465324, 0.1935307, -0.7159925, 1, 1, 1, 1, 1,
-0.6451595, 0.314539, -0.4776223, 1, 1, 1, 1, 1,
-0.6430684, 0.7949368, -0.07993755, 1, 1, 1, 1, 1,
-0.6377135, 0.103438, -0.3809077, 1, 1, 1, 1, 1,
-0.6336417, -0.7026207, -1.16954, 1, 1, 1, 1, 1,
-0.6328897, 1.577721, -1.628917, 1, 1, 1, 1, 1,
-0.6316161, -0.2317407, -2.288248, 1, 1, 1, 1, 1,
-0.6231557, 0.2332149, -2.720752, 1, 1, 1, 1, 1,
-0.6120156, 0.009255961, -1.698425, 0, 0, 1, 1, 1,
-0.6116754, 1.205759, 0.1000768, 1, 0, 0, 1, 1,
-0.5925035, -0.3241301, -1.937659, 1, 0, 0, 1, 1,
-0.5900855, -0.9737494, -2.94693, 1, 0, 0, 1, 1,
-0.5836498, 0.6219208, -3.240207, 1, 0, 0, 1, 1,
-0.5826595, 1.44901, -0.5864556, 1, 0, 0, 1, 1,
-0.5812363, -0.2795733, -2.176501, 0, 0, 0, 1, 1,
-0.5748281, -0.2257801, -3.414288, 0, 0, 0, 1, 1,
-0.5738289, -0.8631362, -2.714119, 0, 0, 0, 1, 1,
-0.5722973, -0.1095954, -3.503903, 0, 0, 0, 1, 1,
-0.5688311, 0.6346627, -1.223613, 0, 0, 0, 1, 1,
-0.5683272, -0.6430528, -1.997213, 0, 0, 0, 1, 1,
-0.5643438, 0.06457414, -1.199111, 0, 0, 0, 1, 1,
-0.5634128, -0.0514693, -2.717924, 1, 1, 1, 1, 1,
-0.5616952, 0.7606109, 1.055261, 1, 1, 1, 1, 1,
-0.5586418, -1.457452, -1.754083, 1, 1, 1, 1, 1,
-0.5570896, 1.05268, 0.868967, 1, 1, 1, 1, 1,
-0.5563789, -1.113286, -2.044483, 1, 1, 1, 1, 1,
-0.5536734, -0.8846446, -3.19959, 1, 1, 1, 1, 1,
-0.5532397, 2.08273, 0.6445383, 1, 1, 1, 1, 1,
-0.552922, -0.7358345, -2.602846, 1, 1, 1, 1, 1,
-0.5526699, 0.3896431, -0.7127309, 1, 1, 1, 1, 1,
-0.5515611, 0.7298006, 0.2726684, 1, 1, 1, 1, 1,
-0.5503255, 0.2720549, 1.146168, 1, 1, 1, 1, 1,
-0.5462289, -1.039447, -3.063155, 1, 1, 1, 1, 1,
-0.5459841, 0.7363037, 0.5449726, 1, 1, 1, 1, 1,
-0.5224593, 0.6767281, 0.4570816, 1, 1, 1, 1, 1,
-0.5223657, 0.8445691, -0.6360537, 1, 1, 1, 1, 1,
-0.5221982, 0.9532056, 0.7147963, 0, 0, 1, 1, 1,
-0.521219, 0.8484941, -1.866845, 1, 0, 0, 1, 1,
-0.5200077, -0.1403356, -2.227287, 1, 0, 0, 1, 1,
-0.5158693, -0.6600598, -2.474823, 1, 0, 0, 1, 1,
-0.5126913, 0.03588635, -1.043427, 1, 0, 0, 1, 1,
-0.5116132, -0.6016847, -3.223928, 1, 0, 0, 1, 1,
-0.5092495, -0.5397871, -2.015456, 0, 0, 0, 1, 1,
-0.5088674, -0.2532439, -2.097443, 0, 0, 0, 1, 1,
-0.5086217, 0.04349282, -2.623881, 0, 0, 0, 1, 1,
-0.5082283, 0.6959413, -0.2246432, 0, 0, 0, 1, 1,
-0.5081534, 0.5996109, -0.5493417, 0, 0, 0, 1, 1,
-0.5034562, 1.724498, -0.5868019, 0, 0, 0, 1, 1,
-0.5016209, 0.4557564, -2.74704, 0, 0, 0, 1, 1,
-0.5008752, 0.06442873, 1.210411, 1, 1, 1, 1, 1,
-0.5008548, -1.332814, -3.101599, 1, 1, 1, 1, 1,
-0.5003518, -0.5688579, -1.972448, 1, 1, 1, 1, 1,
-0.49406, -1.368885, -2.646656, 1, 1, 1, 1, 1,
-0.4933366, 0.4851511, -1.290611, 1, 1, 1, 1, 1,
-0.4835922, 1.14353, -1.376031, 1, 1, 1, 1, 1,
-0.4834846, 1.593419, -1.404386, 1, 1, 1, 1, 1,
-0.4764495, -0.7885848, -3.522177, 1, 1, 1, 1, 1,
-0.4729467, 0.8496434, -0.4235674, 1, 1, 1, 1, 1,
-0.4697948, -0.1488139, -1.552111, 1, 1, 1, 1, 1,
-0.4678762, -0.974071, -2.539076, 1, 1, 1, 1, 1,
-0.4620237, -1.301051, -2.023587, 1, 1, 1, 1, 1,
-0.4551379, -1.300341, -3.782601, 1, 1, 1, 1, 1,
-0.4537568, -0.8529204, -2.990196, 1, 1, 1, 1, 1,
-0.4527247, -0.2086175, -2.740848, 1, 1, 1, 1, 1,
-0.4524102, 1.143031, -0.2618498, 0, 0, 1, 1, 1,
-0.4381903, 1.150951, -0.06960367, 1, 0, 0, 1, 1,
-0.434967, -1.097108, -2.824744, 1, 0, 0, 1, 1,
-0.4309609, 1.116743, 0.8985066, 1, 0, 0, 1, 1,
-0.4248358, -2.309681, -2.134376, 1, 0, 0, 1, 1,
-0.4218011, -1.471212, -1.847405, 1, 0, 0, 1, 1,
-0.4205599, 0.8332362, -1.773174, 0, 0, 0, 1, 1,
-0.4177676, -0.1676463, -2.30303, 0, 0, 0, 1, 1,
-0.4168395, 0.3529143, -0.4202331, 0, 0, 0, 1, 1,
-0.4164525, 0.5811058, -0.8373992, 0, 0, 0, 1, 1,
-0.4146284, -0.03034612, -0.1932075, 0, 0, 0, 1, 1,
-0.4047408, 1.743579, -2.738128, 0, 0, 0, 1, 1,
-0.4043433, -0.8508711, -2.11684, 0, 0, 0, 1, 1,
-0.4017657, 1.418236, -0.0550345, 1, 1, 1, 1, 1,
-0.4010202, 1.489548, -0.2452677, 1, 1, 1, 1, 1,
-0.397321, 0.1208383, -0.8279846, 1, 1, 1, 1, 1,
-0.3951323, 0.1680162, -0.3975258, 1, 1, 1, 1, 1,
-0.3916959, -1.31439, -3.999081, 1, 1, 1, 1, 1,
-0.3907759, 0.7956358, -0.3825543, 1, 1, 1, 1, 1,
-0.3895787, 0.5294245, -0.6018471, 1, 1, 1, 1, 1,
-0.3889648, -0.5684672, -2.823959, 1, 1, 1, 1, 1,
-0.3875225, 0.8426643, 0.6109254, 1, 1, 1, 1, 1,
-0.3825561, 0.5739836, -0.9206175, 1, 1, 1, 1, 1,
-0.3733201, -0.1822296, -2.90707, 1, 1, 1, 1, 1,
-0.3694354, -1.317171, -4.771287, 1, 1, 1, 1, 1,
-0.3679744, 0.4369821, 2.354976, 1, 1, 1, 1, 1,
-0.3663638, 0.7939001, 0.1611722, 1, 1, 1, 1, 1,
-0.3468318, 0.6011285, -0.7935267, 1, 1, 1, 1, 1,
-0.3461634, -0.9262804, -4.400939, 0, 0, 1, 1, 1,
-0.3443573, 2.222111, -0.5015876, 1, 0, 0, 1, 1,
-0.3427691, 0.1122737, -1.270041, 1, 0, 0, 1, 1,
-0.3338266, 0.2121747, -1.496777, 1, 0, 0, 1, 1,
-0.3283443, 0.1401484, -1.226745, 1, 0, 0, 1, 1,
-0.3274387, -0.7524326, -3.215302, 1, 0, 0, 1, 1,
-0.327268, 1.618256, 0.01508408, 0, 0, 0, 1, 1,
-0.3205647, 0.6735906, -0.7604446, 0, 0, 0, 1, 1,
-0.3202619, -1.845801, -2.603016, 0, 0, 0, 1, 1,
-0.3170745, 1.601375, -0.3827113, 0, 0, 0, 1, 1,
-0.315246, 0.5721992, 0.7370797, 0, 0, 0, 1, 1,
-0.3139079, 2.019955, -1.162924, 0, 0, 0, 1, 1,
-0.3107913, -1.024375, -4.212664, 0, 0, 0, 1, 1,
-0.3084298, -0.09711412, -2.021008, 1, 1, 1, 1, 1,
-0.305795, 1.1157, 0.4446853, 1, 1, 1, 1, 1,
-0.3051482, 0.08442382, 0.1775204, 1, 1, 1, 1, 1,
-0.3005497, -0.1685359, -1.830644, 1, 1, 1, 1, 1,
-0.3001756, -1.157156, -2.76156, 1, 1, 1, 1, 1,
-0.2970507, -0.7430533, -1.635396, 1, 1, 1, 1, 1,
-0.2917838, -1.50512, -3.888441, 1, 1, 1, 1, 1,
-0.2903821, -0.09399816, -2.092112, 1, 1, 1, 1, 1,
-0.2815348, -1.472851, -2.610486, 1, 1, 1, 1, 1,
-0.2812171, -1.038084, -1.971316, 1, 1, 1, 1, 1,
-0.2750667, -0.2278926, -2.983427, 1, 1, 1, 1, 1,
-0.2746884, 0.4484977, -1.139924, 1, 1, 1, 1, 1,
-0.2745339, -0.1971276, -1.982617, 1, 1, 1, 1, 1,
-0.2743712, 1.377541, -0.3822944, 1, 1, 1, 1, 1,
-0.2713605, -0.0928373, -0.7878205, 1, 1, 1, 1, 1,
-0.2710172, 2.222622, 1.35377, 0, 0, 1, 1, 1,
-0.2701654, 0.2877447, -1.540969, 1, 0, 0, 1, 1,
-0.266596, -0.208503, -2.213183, 1, 0, 0, 1, 1,
-0.2665125, -1.004466, -3.972901, 1, 0, 0, 1, 1,
-0.2658647, 0.8875703, -1.542057, 1, 0, 0, 1, 1,
-0.2649251, 1.499664, -1.28164, 1, 0, 0, 1, 1,
-0.2637548, 0.5058771, -1.230968, 0, 0, 0, 1, 1,
-0.2592907, 1.698844, -1.952434, 0, 0, 0, 1, 1,
-0.2556808, 0.3945605, -0.1665424, 0, 0, 0, 1, 1,
-0.25088, -1.147271, -1.907534, 0, 0, 0, 1, 1,
-0.2496254, -1.816895, -3.585553, 0, 0, 0, 1, 1,
-0.2442622, 0.7200972, -0.4454849, 0, 0, 0, 1, 1,
-0.2421756, -1.039208, -3.663917, 0, 0, 0, 1, 1,
-0.2396665, -1.022336, -1.508731, 1, 1, 1, 1, 1,
-0.2368085, 0.8419461, -0.9316207, 1, 1, 1, 1, 1,
-0.2343344, -0.4291193, -3.997704, 1, 1, 1, 1, 1,
-0.2342887, -0.4406854, -3.959225, 1, 1, 1, 1, 1,
-0.2334034, 0.36224, -1.576078, 1, 1, 1, 1, 1,
-0.2332816, 0.5114759, -0.8987395, 1, 1, 1, 1, 1,
-0.2300672, 0.1886996, -0.8916276, 1, 1, 1, 1, 1,
-0.2277305, 1.431058, 0.6799129, 1, 1, 1, 1, 1,
-0.2248425, 0.9341357, 0.8054175, 1, 1, 1, 1, 1,
-0.2208572, -0.2584276, -2.869628, 1, 1, 1, 1, 1,
-0.2186156, -0.7553827, -1.636876, 1, 1, 1, 1, 1,
-0.2169135, 2.07884, -0.2135429, 1, 1, 1, 1, 1,
-0.2159106, 0.8448809, -0.4290037, 1, 1, 1, 1, 1,
-0.2137064, -0.7642365, -3.197923, 1, 1, 1, 1, 1,
-0.2135832, 0.9942139, -0.1209565, 1, 1, 1, 1, 1,
-0.2130967, 0.4105818, -2.750481, 0, 0, 1, 1, 1,
-0.2080438, 0.748192, 0.3886797, 1, 0, 0, 1, 1,
-0.2063886, 0.5122353, 1.253367, 1, 0, 0, 1, 1,
-0.2049198, 1.046057, -1.378322, 1, 0, 0, 1, 1,
-0.2032956, -0.4854745, -2.585122, 1, 0, 0, 1, 1,
-0.1999702, -1.505115, -1.984816, 1, 0, 0, 1, 1,
-0.1974917, 0.1237792, -3.573797, 0, 0, 0, 1, 1,
-0.1956244, -0.6312043, -4.175931, 0, 0, 0, 1, 1,
-0.193467, 0.4192268, -1.715755, 0, 0, 0, 1, 1,
-0.1854259, 0.06619824, 0.2542136, 0, 0, 0, 1, 1,
-0.1846351, -1.014588, -2.75989, 0, 0, 0, 1, 1,
-0.1815848, 0.6368703, 0.787642, 0, 0, 0, 1, 1,
-0.1802275, 0.7542341, 1.401664, 0, 0, 0, 1, 1,
-0.1763786, 2.576926, 0.9611606, 1, 1, 1, 1, 1,
-0.1762753, -0.567046, -1.702613, 1, 1, 1, 1, 1,
-0.1731732, -0.4571902, -2.181789, 1, 1, 1, 1, 1,
-0.1723138, -0.8408993, -3.443109, 1, 1, 1, 1, 1,
-0.1708954, -0.0920686, -2.243335, 1, 1, 1, 1, 1,
-0.1708732, -0.1642635, -2.240083, 1, 1, 1, 1, 1,
-0.1634295, -0.2034707, -1.615089, 1, 1, 1, 1, 1,
-0.1550875, 0.8820316, 0.4836609, 1, 1, 1, 1, 1,
-0.1516764, -2.829502, -3.636224, 1, 1, 1, 1, 1,
-0.1502067, -0.2791118, -2.770915, 1, 1, 1, 1, 1,
-0.1489554, 0.6439871, -0.8547398, 1, 1, 1, 1, 1,
-0.1449847, 2.023755, -0.9495808, 1, 1, 1, 1, 1,
-0.1438387, -0.7196518, -2.2204, 1, 1, 1, 1, 1,
-0.1413536, 0.03745493, 0.09920448, 1, 1, 1, 1, 1,
-0.1381225, -1.029708, -2.152905, 1, 1, 1, 1, 1,
-0.1369869, -0.5600775, -3.561473, 0, 0, 1, 1, 1,
-0.1250393, -0.1014223, -1.86343, 1, 0, 0, 1, 1,
-0.1246833, 1.5867, -0.4518322, 1, 0, 0, 1, 1,
-0.1246418, 1.406064, 0.2539126, 1, 0, 0, 1, 1,
-0.1233776, -0.1605415, -3.015921, 1, 0, 0, 1, 1,
-0.1219822, -0.2963189, -3.281831, 1, 0, 0, 1, 1,
-0.1187851, -0.6196808, -2.5448, 0, 0, 0, 1, 1,
-0.11369, -0.5342849, -1.613058, 0, 0, 0, 1, 1,
-0.1129158, -0.1951633, -1.417361, 0, 0, 0, 1, 1,
-0.1120809, 1.407941, -0.06826875, 0, 0, 0, 1, 1,
-0.1099291, -2.225018, -1.933173, 0, 0, 0, 1, 1,
-0.1067577, -1.620996, -3.725779, 0, 0, 0, 1, 1,
-0.1066699, 1.492818, -1.237613, 0, 0, 0, 1, 1,
-0.1044554, 2.277952, -0.3479674, 1, 1, 1, 1, 1,
-0.1027431, -0.2443797, -1.840862, 1, 1, 1, 1, 1,
-0.09978203, -0.3662362, -3.580372, 1, 1, 1, 1, 1,
-0.09827255, 0.4050628, -0.4395287, 1, 1, 1, 1, 1,
-0.09604664, 0.07694115, -1.776432, 1, 1, 1, 1, 1,
-0.09488513, -0.6391261, -2.000345, 1, 1, 1, 1, 1,
-0.09182164, 0.4671062, -2.77617, 1, 1, 1, 1, 1,
-0.0895853, -1.552303, -4.031714, 1, 1, 1, 1, 1,
-0.0892736, -0.02912071, -1.771599, 1, 1, 1, 1, 1,
-0.08619755, -0.2783521, -2.418563, 1, 1, 1, 1, 1,
-0.08482318, -0.1231581, -3.153699, 1, 1, 1, 1, 1,
-0.08253663, 0.8098205, 0.5341889, 1, 1, 1, 1, 1,
-0.08105, -0.4409487, -3.677447, 1, 1, 1, 1, 1,
-0.07784257, -2.195982, -4.03507, 1, 1, 1, 1, 1,
-0.0749575, 0.785843, 0.08693767, 1, 1, 1, 1, 1,
-0.06955324, -0.9116542, -4.183875, 0, 0, 1, 1, 1,
-0.06890564, -1.227001, -3.429711, 1, 0, 0, 1, 1,
-0.06824926, -0.09820117, -2.64438, 1, 0, 0, 1, 1,
-0.06660823, 0.6855186, 0.8600489, 1, 0, 0, 1, 1,
-0.06412438, 0.1404698, -0.9402668, 1, 0, 0, 1, 1,
-0.06364084, -0.0683317, -1.819235, 1, 0, 0, 1, 1,
-0.06345177, -0.2790612, -2.315675, 0, 0, 0, 1, 1,
-0.06302034, 0.9862691, 0.8752525, 0, 0, 0, 1, 1,
-0.06197364, -2.507706, -4.010368, 0, 0, 0, 1, 1,
-0.05738311, -2.063181, -3.267264, 0, 0, 0, 1, 1,
-0.05438324, 0.07166299, 0.03640203, 0, 0, 0, 1, 1,
-0.0484287, 0.3712703, 0.2072115, 0, 0, 0, 1, 1,
-0.04522587, -1.409939, -3.842623, 0, 0, 0, 1, 1,
-0.03497725, -0.6979621, -2.765733, 1, 1, 1, 1, 1,
-0.03241702, 0.4348631, -0.3331048, 1, 1, 1, 1, 1,
-0.0313564, -0.09474798, -2.068371, 1, 1, 1, 1, 1,
-0.02743536, -0.4088166, -2.160433, 1, 1, 1, 1, 1,
-0.02695639, 0.06829673, -0.3432355, 1, 1, 1, 1, 1,
-0.01681359, 0.4384513, 0.3812666, 1, 1, 1, 1, 1,
-0.01322325, 1.23137, -0.152257, 1, 1, 1, 1, 1,
-0.01285944, 1.571054, 0.5411671, 1, 1, 1, 1, 1,
-0.012401, -0.5915594, -3.302263, 1, 1, 1, 1, 1,
-0.01239177, 1.827188, 0.2583469, 1, 1, 1, 1, 1,
-0.009593984, -1.680298, -3.809268, 1, 1, 1, 1, 1,
-0.009172374, -0.1442772, -2.666837, 1, 1, 1, 1, 1,
-0.008878461, -1.079972, -2.988498, 1, 1, 1, 1, 1,
-0.004855114, 1.770904, 1.200632, 1, 1, 1, 1, 1,
-0.003337095, 0.5485486, 0.3406362, 1, 1, 1, 1, 1,
-0.001051632, -0.8418024, -2.524581, 0, 0, 1, 1, 1,
0.0001843731, -1.155538, 4.122025, 1, 0, 0, 1, 1,
0.007991008, -1.063923, 4.643707, 1, 0, 0, 1, 1,
0.008144364, -0.2516398, 4.044586, 1, 0, 0, 1, 1,
0.009935995, -0.6689162, 2.867168, 1, 0, 0, 1, 1,
0.0133709, 1.211944, -0.760699, 1, 0, 0, 1, 1,
0.01506073, 0.6122106, 0.9805527, 0, 0, 0, 1, 1,
0.01747707, -1.416232, 1.452051, 0, 0, 0, 1, 1,
0.01815721, 1.62231, -0.04299648, 0, 0, 0, 1, 1,
0.02050191, -1.329178, 2.556105, 0, 0, 0, 1, 1,
0.02156325, 0.5727682, -2.362137, 0, 0, 0, 1, 1,
0.02861705, -1.751603, 2.751189, 0, 0, 0, 1, 1,
0.02944302, -1.431512, 2.621701, 0, 0, 0, 1, 1,
0.03112902, 0.6481407, -0.2616063, 1, 1, 1, 1, 1,
0.03249896, 1.080861, 0.1660606, 1, 1, 1, 1, 1,
0.03360856, -1.209068, 1.483686, 1, 1, 1, 1, 1,
0.03430263, -0.9608884, 0.3688141, 1, 1, 1, 1, 1,
0.03432997, -0.01075389, 1.6275, 1, 1, 1, 1, 1,
0.03663942, 1.142031, -0.2233686, 1, 1, 1, 1, 1,
0.04109111, -1.05613, 5.249751, 1, 1, 1, 1, 1,
0.04535233, -0.3584758, 3.044627, 1, 1, 1, 1, 1,
0.04731498, -0.991179, 4.344484, 1, 1, 1, 1, 1,
0.05562547, -1.598625, 3.617737, 1, 1, 1, 1, 1,
0.05767518, 0.3135492, 1.44502, 1, 1, 1, 1, 1,
0.05823462, -0.741459, 4.188549, 1, 1, 1, 1, 1,
0.05869228, -0.08412229, 1.987796, 1, 1, 1, 1, 1,
0.05931618, -1.103051, 1.799005, 1, 1, 1, 1, 1,
0.06070369, 1.876834, -1.051092, 1, 1, 1, 1, 1,
0.06094673, 0.3961346, 0.5266664, 0, 0, 1, 1, 1,
0.06283022, 1.846814, 0.01851612, 1, 0, 0, 1, 1,
0.06780063, 0.09753387, 1.609162, 1, 0, 0, 1, 1,
0.06862582, 0.3576213, -0.7817143, 1, 0, 0, 1, 1,
0.07056709, 0.4094595, -1.477033, 1, 0, 0, 1, 1,
0.07184464, -1.140139, 3.94272, 1, 0, 0, 1, 1,
0.07331154, 1.944405, -0.6714002, 0, 0, 0, 1, 1,
0.07463591, -1.236827, 1.050645, 0, 0, 0, 1, 1,
0.07555354, 0.06218753, 0.2153765, 0, 0, 0, 1, 1,
0.08342963, -0.7071934, 2.87532, 0, 0, 0, 1, 1,
0.08615738, -0.8185686, 2.364027, 0, 0, 0, 1, 1,
0.0869482, 0.1593138, -0.1285392, 0, 0, 0, 1, 1,
0.08891865, 1.494805, 0.08860532, 0, 0, 0, 1, 1,
0.09072006, 2.188343, 1.524982, 1, 1, 1, 1, 1,
0.09081551, -0.5066754, 2.082572, 1, 1, 1, 1, 1,
0.09088679, -3.040299, 3.822789, 1, 1, 1, 1, 1,
0.09245609, 0.3985253, -0.3520851, 1, 1, 1, 1, 1,
0.09332896, -0.4647649, 2.920289, 1, 1, 1, 1, 1,
0.09735703, -0.2293632, 4.421376, 1, 1, 1, 1, 1,
0.09951603, -1.018769, 3.167059, 1, 1, 1, 1, 1,
0.1067985, -1.045976, 3.078269, 1, 1, 1, 1, 1,
0.1074984, 1.041686, 1.073514, 1, 1, 1, 1, 1,
0.1083533, 1.355004, 1.168273, 1, 1, 1, 1, 1,
0.1148577, 1.422597, -0.3734981, 1, 1, 1, 1, 1,
0.1161662, 1.332662, -0.4975025, 1, 1, 1, 1, 1,
0.1186165, 0.3229937, 2.533115, 1, 1, 1, 1, 1,
0.1216222, -2.130565, 3.486794, 1, 1, 1, 1, 1,
0.1217875, 0.3398783, 0.4642645, 1, 1, 1, 1, 1,
0.1227514, 1.653418, 1.048051, 0, 0, 1, 1, 1,
0.1236679, -0.735197, 3.92541, 1, 0, 0, 1, 1,
0.1278764, 0.9860957, 1.246351, 1, 0, 0, 1, 1,
0.1286218, 0.5179116, -0.9016713, 1, 0, 0, 1, 1,
0.1289483, 0.4333211, -0.6363547, 1, 0, 0, 1, 1,
0.1342728, -0.2242091, 0.3644287, 1, 0, 0, 1, 1,
0.1381885, 0.3199047, 0.3202105, 0, 0, 0, 1, 1,
0.1382283, -1.815419, 3.724683, 0, 0, 0, 1, 1,
0.1402699, 1.645231, -0.1988694, 0, 0, 0, 1, 1,
0.1416011, -1.024525, 2.711523, 0, 0, 0, 1, 1,
0.146058, -2.284316, 3.784702, 0, 0, 0, 1, 1,
0.150699, -0.7297398, 3.081319, 0, 0, 0, 1, 1,
0.1518902, 0.4323668, 1.219795, 0, 0, 0, 1, 1,
0.1534266, -0.5134621, 2.962238, 1, 1, 1, 1, 1,
0.1539696, -0.24878, 3.728963, 1, 1, 1, 1, 1,
0.1575979, -0.4007692, 3.821242, 1, 1, 1, 1, 1,
0.1601397, 0.1492676, 1.12585, 1, 1, 1, 1, 1,
0.1613612, 0.03818211, 1.974598, 1, 1, 1, 1, 1,
0.1628573, -0.5600924, 5.771554, 1, 1, 1, 1, 1,
0.1648165, 1.512464, -1.654076, 1, 1, 1, 1, 1,
0.1686026, 2.992863, -0.2603136, 1, 1, 1, 1, 1,
0.1700153, 0.274657, 1.854671, 1, 1, 1, 1, 1,
0.1720164, -0.9668491, 3.247648, 1, 1, 1, 1, 1,
0.1734611, -0.7244909, 2.440831, 1, 1, 1, 1, 1,
0.1787316, 0.621483, -0.5815103, 1, 1, 1, 1, 1,
0.1815413, -0.2609212, 2.94905, 1, 1, 1, 1, 1,
0.1846558, 1.114097, 0.6072331, 1, 1, 1, 1, 1,
0.1948475, 1.368935, 0.8629472, 1, 1, 1, 1, 1,
0.1966989, -0.6903972, 3.936403, 0, 0, 1, 1, 1,
0.2016494, 1.848764, 0.5909895, 1, 0, 0, 1, 1,
0.2066716, 1.096193, -0.1668105, 1, 0, 0, 1, 1,
0.2066952, 1.30637, 1.074269, 1, 0, 0, 1, 1,
0.2090755, -1.308671, 0.7432151, 1, 0, 0, 1, 1,
0.214591, 0.1036856, 2.119255, 1, 0, 0, 1, 1,
0.2272054, 0.06174274, 1.385518, 0, 0, 0, 1, 1,
0.2298926, -1.361282, 3.255513, 0, 0, 0, 1, 1,
0.2307195, -0.1638011, 2.88352, 0, 0, 0, 1, 1,
0.2364471, 1.212609, 0.6133543, 0, 0, 0, 1, 1,
0.236772, -0.2770295, 1.333385, 0, 0, 0, 1, 1,
0.2409421, 1.488051, 1.539263, 0, 0, 0, 1, 1,
0.2450638, -0.6067532, 2.232225, 0, 0, 0, 1, 1,
0.2469517, -0.1870082, 2.357815, 1, 1, 1, 1, 1,
0.250596, 0.1476028, 1.204421, 1, 1, 1, 1, 1,
0.250803, 0.7251517, 0.4140379, 1, 1, 1, 1, 1,
0.2525395, 0.6025567, -0.7051561, 1, 1, 1, 1, 1,
0.2531015, 0.5810909, 0.457554, 1, 1, 1, 1, 1,
0.2542506, 1.180966, 0.6241081, 1, 1, 1, 1, 1,
0.255502, -0.4568653, 2.705197, 1, 1, 1, 1, 1,
0.2558603, -0.4690614, 3.094119, 1, 1, 1, 1, 1,
0.2575658, 2.131848, 1.717523, 1, 1, 1, 1, 1,
0.2605867, -0.7742898, 1.599915, 1, 1, 1, 1, 1,
0.2606079, 0.7417802, 0.2775031, 1, 1, 1, 1, 1,
0.2650602, 0.6089663, 0.8385618, 1, 1, 1, 1, 1,
0.2789797, 0.3507468, -1.080724, 1, 1, 1, 1, 1,
0.2876763, 2.404319, 0.8457625, 1, 1, 1, 1, 1,
0.289916, -0.4453894, 1.993105, 1, 1, 1, 1, 1,
0.2903689, 0.722205, -0.4851918, 0, 0, 1, 1, 1,
0.2928185, 1.224832, -1.255642, 1, 0, 0, 1, 1,
0.2980631, -0.2119503, 1.046403, 1, 0, 0, 1, 1,
0.3063935, -0.3579336, 3.413997, 1, 0, 0, 1, 1,
0.309293, 1.878299, -0.6988876, 1, 0, 0, 1, 1,
0.3097436, 0.8700498, 1.270705, 1, 0, 0, 1, 1,
0.3117976, 0.7907993, 1.0378, 0, 0, 0, 1, 1,
0.3131831, 0.00706085, 2.895669, 0, 0, 0, 1, 1,
0.3179376, -1.068545, 2.390379, 0, 0, 0, 1, 1,
0.320246, -0.0996091, 1.028779, 0, 0, 0, 1, 1,
0.3204508, -2.046595, 3.567088, 0, 0, 0, 1, 1,
0.32076, -0.2870857, 2.0058, 0, 0, 0, 1, 1,
0.321034, 0.1461699, 0.07989384, 0, 0, 0, 1, 1,
0.3260876, -0.3364842, 1.818346, 1, 1, 1, 1, 1,
0.3264771, -0.2242779, 2.784768, 1, 1, 1, 1, 1,
0.3271855, -0.1562887, 0.2849801, 1, 1, 1, 1, 1,
0.3277309, -0.6062168, 3.679153, 1, 1, 1, 1, 1,
0.3325241, 0.1826869, 1.253343, 1, 1, 1, 1, 1,
0.3345694, -0.3236924, 1.828275, 1, 1, 1, 1, 1,
0.3351571, 0.2604195, 1.983596, 1, 1, 1, 1, 1,
0.3353685, 0.03582976, -0.2113502, 1, 1, 1, 1, 1,
0.3399538, 1.216305, -0.8722234, 1, 1, 1, 1, 1,
0.341455, -0.9074349, 3.726942, 1, 1, 1, 1, 1,
0.3423896, 0.5589499, 1.342309, 1, 1, 1, 1, 1,
0.3435307, 0.782537, 3.204759, 1, 1, 1, 1, 1,
0.3457226, -0.7789758, 2.329928, 1, 1, 1, 1, 1,
0.3459366, 1.764146, 0.5464137, 1, 1, 1, 1, 1,
0.3497446, 0.7330495, 0.8114217, 1, 1, 1, 1, 1,
0.3562256, 1.188048, 0.8989353, 0, 0, 1, 1, 1,
0.3575415, 1.384979, 0.7605346, 1, 0, 0, 1, 1,
0.357704, 0.9848853, -1.233081, 1, 0, 0, 1, 1,
0.3589488, -1.057244, 1.331763, 1, 0, 0, 1, 1,
0.364761, 0.8113803, 1.952651, 1, 0, 0, 1, 1,
0.3656999, 1.116783, 0.3231882, 1, 0, 0, 1, 1,
0.366776, 2.064394, 0.5582041, 0, 0, 0, 1, 1,
0.3687093, 0.4677575, 1.984361, 0, 0, 0, 1, 1,
0.3695962, -0.4803835, 1.189652, 0, 0, 0, 1, 1,
0.3766662, -0.05968675, 1.619816, 0, 0, 0, 1, 1,
0.3773085, 0.2902919, 1.467718, 0, 0, 0, 1, 1,
0.3774033, 1.390693, 1.428823, 0, 0, 0, 1, 1,
0.3774908, 0.3595264, 1.332511, 0, 0, 0, 1, 1,
0.3800819, 0.7735804, -1.575945, 1, 1, 1, 1, 1,
0.3852143, -1.461231, 4.333727, 1, 1, 1, 1, 1,
0.3873551, -0.9628762, 3.769267, 1, 1, 1, 1, 1,
0.3921608, 0.1477691, 0.7676492, 1, 1, 1, 1, 1,
0.3939257, -0.9504988, 2.52432, 1, 1, 1, 1, 1,
0.3953298, -0.4846665, 2.460881, 1, 1, 1, 1, 1,
0.3973394, -2.700935, 1.813167, 1, 1, 1, 1, 1,
0.3988409, 0.159444, 0.3169191, 1, 1, 1, 1, 1,
0.4041869, 0.4230126, 2.77735, 1, 1, 1, 1, 1,
0.4046003, -0.9731389, 3.284933, 1, 1, 1, 1, 1,
0.405542, -0.3454787, 2.094917, 1, 1, 1, 1, 1,
0.4060917, 0.8155963, 1.633747, 1, 1, 1, 1, 1,
0.4072574, 1.101993, 0.7082982, 1, 1, 1, 1, 1,
0.407286, -0.5739976, 2.974286, 1, 1, 1, 1, 1,
0.4082904, 0.3889089, 0.9231013, 1, 1, 1, 1, 1,
0.408393, 0.04764901, 2.28053, 0, 0, 1, 1, 1,
0.4108473, 0.3991763, 2.066369, 1, 0, 0, 1, 1,
0.4154979, -1.728439, 2.530932, 1, 0, 0, 1, 1,
0.4159881, -1.231502, 4.204724, 1, 0, 0, 1, 1,
0.4220756, 1.323703, 0.6568913, 1, 0, 0, 1, 1,
0.4286467, 1.247985, 0.6050852, 1, 0, 0, 1, 1,
0.4300186, -0.2123751, 1.113688, 0, 0, 0, 1, 1,
0.4314446, 1.231671, 0.5863442, 0, 0, 0, 1, 1,
0.4341991, -1.133388, 2.193692, 0, 0, 0, 1, 1,
0.4470824, 0.3712765, -0.8517596, 0, 0, 0, 1, 1,
0.4503598, 1.145197, -0.5645586, 0, 0, 0, 1, 1,
0.4521219, 0.4216266, 1.88743, 0, 0, 0, 1, 1,
0.4532929, 0.2087273, 0.1446112, 0, 0, 0, 1, 1,
0.4559314, 0.3179123, 1.312211, 1, 1, 1, 1, 1,
0.4568135, -1.135055, 3.271328, 1, 1, 1, 1, 1,
0.4588883, -1.412322, 1.575779, 1, 1, 1, 1, 1,
0.4595158, 0.9903628, -1.031098, 1, 1, 1, 1, 1,
0.4596131, -0.5329784, 3.135148, 1, 1, 1, 1, 1,
0.460218, 2.01109, 0.4586181, 1, 1, 1, 1, 1,
0.4625706, 1.22418, 1.189826, 1, 1, 1, 1, 1,
0.4647342, 2.147817, 1.372917, 1, 1, 1, 1, 1,
0.4668546, -0.2543451, 3.863128, 1, 1, 1, 1, 1,
0.469728, -1.466276, 3.099743, 1, 1, 1, 1, 1,
0.4725106, -1.345602, 2.035633, 1, 1, 1, 1, 1,
0.47371, -0.1576958, 2.162343, 1, 1, 1, 1, 1,
0.4742096, -0.526232, 2.730994, 1, 1, 1, 1, 1,
0.4754249, 1.500221, -0.7077003, 1, 1, 1, 1, 1,
0.4754877, 1.135994, -1.259832, 1, 1, 1, 1, 1,
0.4792814, -2.879454, 3.291145, 0, 0, 1, 1, 1,
0.4804845, -0.8001903, 2.274568, 1, 0, 0, 1, 1,
0.4844513, 0.7512997, 1.287913, 1, 0, 0, 1, 1,
0.4853518, -1.10873, 2.460901, 1, 0, 0, 1, 1,
0.4878961, 1.767594, 1.692608, 1, 0, 0, 1, 1,
0.4896603, -0.2544164, 1.353399, 1, 0, 0, 1, 1,
0.4911326, 0.3281838, 0.9187315, 0, 0, 0, 1, 1,
0.4911334, -0.05898007, 2.471021, 0, 0, 0, 1, 1,
0.4912969, 1.449016, 0.5146167, 0, 0, 0, 1, 1,
0.4926983, 0.09630248, 1.980301, 0, 0, 0, 1, 1,
0.5005533, -1.229246, 3.292135, 0, 0, 0, 1, 1,
0.5011936, 0.3628053, 1.217104, 0, 0, 0, 1, 1,
0.5041937, 0.3278389, 1.760073, 0, 0, 0, 1, 1,
0.5065256, 0.856208, 1.304404, 1, 1, 1, 1, 1,
0.5089759, 0.6240783, 0.5772469, 1, 1, 1, 1, 1,
0.509095, 0.4353271, 2.518866, 1, 1, 1, 1, 1,
0.5107781, 0.1228708, 1.276766, 1, 1, 1, 1, 1,
0.5127234, -0.141644, 2.497843, 1, 1, 1, 1, 1,
0.5139102, 0.8622493, -1.047898, 1, 1, 1, 1, 1,
0.5155693, -1.790953, 3.216045, 1, 1, 1, 1, 1,
0.5195947, 1.019444, -0.5704535, 1, 1, 1, 1, 1,
0.5198561, 0.9103155, 0.6872213, 1, 1, 1, 1, 1,
0.5204834, -0.02383901, 1.239249, 1, 1, 1, 1, 1,
0.5298466, -0.9102269, 2.673502, 1, 1, 1, 1, 1,
0.5373901, -0.6754789, 2.516414, 1, 1, 1, 1, 1,
0.5412109, -0.7383235, 2.06465, 1, 1, 1, 1, 1,
0.5439903, -0.2509126, 2.490588, 1, 1, 1, 1, 1,
0.5449221, 0.00334295, 3.499688, 1, 1, 1, 1, 1,
0.5477647, -1.004844, 4.223621, 0, 0, 1, 1, 1,
0.5487301, -0.04154459, 2.598768, 1, 0, 0, 1, 1,
0.54887, 1.205797, 0.4092265, 1, 0, 0, 1, 1,
0.5491587, -0.3000347, 1.512048, 1, 0, 0, 1, 1,
0.5515992, 0.09819048, 0.7459048, 1, 0, 0, 1, 1,
0.5518914, 0.2414392, 1.839584, 1, 0, 0, 1, 1,
0.5547544, -2.365162, 3.563216, 0, 0, 0, 1, 1,
0.5673522, 1.9107, -0.1408342, 0, 0, 0, 1, 1,
0.5691588, -1.421602, 3.079752, 0, 0, 0, 1, 1,
0.574556, -1.017244, 4.33487, 0, 0, 0, 1, 1,
0.5749856, 1.498702, -0.4911612, 0, 0, 0, 1, 1,
0.5833069, -0.174403, 1.945389, 0, 0, 0, 1, 1,
0.5837102, 0.2404064, 1.934824, 0, 0, 0, 1, 1,
0.5849335, -0.7278895, 2.082483, 1, 1, 1, 1, 1,
0.5862295, -0.3952297, 2.734909, 1, 1, 1, 1, 1,
0.5870538, -0.2160193, 1.048483, 1, 1, 1, 1, 1,
0.5892886, 0.4338388, 1.564926, 1, 1, 1, 1, 1,
0.5892907, -0.7565668, 1.366317, 1, 1, 1, 1, 1,
0.5911717, -1.697703, 2.927533, 1, 1, 1, 1, 1,
0.5949557, -0.01005172, 1.159312, 1, 1, 1, 1, 1,
0.5980695, 0.8788932, 1.723402, 1, 1, 1, 1, 1,
0.5982915, -0.234814, 3.086657, 1, 1, 1, 1, 1,
0.601545, 0.5596184, 0.01413035, 1, 1, 1, 1, 1,
0.6017566, 1.734291, 0.3871609, 1, 1, 1, 1, 1,
0.6026962, -0.9896884, 1.631934, 1, 1, 1, 1, 1,
0.6155004, 0.2394778, 0.8257971, 1, 1, 1, 1, 1,
0.615779, 0.3064903, 2.167906, 1, 1, 1, 1, 1,
0.6163599, 1.409385, -0.4372429, 1, 1, 1, 1, 1,
0.61762, -0.1540388, 1.313867, 0, 0, 1, 1, 1,
0.6207719, 0.2245366, 1.427629, 1, 0, 0, 1, 1,
0.6211315, -1.343444, 3.31122, 1, 0, 0, 1, 1,
0.6234145, -1.236435, 4.511835, 1, 0, 0, 1, 1,
0.6251217, -0.9254307, 2.423297, 1, 0, 0, 1, 1,
0.6334019, 1.077805, -0.1168997, 1, 0, 0, 1, 1,
0.6336128, 0.6634132, 0.9611419, 0, 0, 0, 1, 1,
0.6338807, -0.9308757, 3.33018, 0, 0, 0, 1, 1,
0.6390884, 0.3643263, -0.4396639, 0, 0, 0, 1, 1,
0.6427247, 0.4971194, 0.4603636, 0, 0, 0, 1, 1,
0.6435912, -0.1313908, 1.70224, 0, 0, 0, 1, 1,
0.6458022, 0.3910887, 1.771201, 0, 0, 0, 1, 1,
0.6501083, 0.06374115, 3.282832, 0, 0, 0, 1, 1,
0.6510437, -0.2160229, 4.011358, 1, 1, 1, 1, 1,
0.6515734, 1.327682, -0.9174239, 1, 1, 1, 1, 1,
0.6528351, 0.4371516, 1.779455, 1, 1, 1, 1, 1,
0.6613428, -1.296544, 2.876735, 1, 1, 1, 1, 1,
0.6651475, -0.2760043, 2.434221, 1, 1, 1, 1, 1,
0.6669477, 0.4403411, 2.349876, 1, 1, 1, 1, 1,
0.6738575, 0.0415145, 0.3328526, 1, 1, 1, 1, 1,
0.6746389, 0.8941801, 0.5414472, 1, 1, 1, 1, 1,
0.6760614, -1.854906, 1.363995, 1, 1, 1, 1, 1,
0.6790256, 1.023654, 0.07063196, 1, 1, 1, 1, 1,
0.6806418, -0.7147098, 1.369094, 1, 1, 1, 1, 1,
0.6872451, -0.4443792, 2.427437, 1, 1, 1, 1, 1,
0.6926079, 0.9279175, 0.7434186, 1, 1, 1, 1, 1,
0.7006431, -0.6155385, 3.788182, 1, 1, 1, 1, 1,
0.705398, -0.4006059, 1.182749, 1, 1, 1, 1, 1,
0.7062478, -0.4266887, 4.067818, 0, 0, 1, 1, 1,
0.7075719, -0.9441673, 3.757788, 1, 0, 0, 1, 1,
0.7084948, -0.4453923, 2.409198, 1, 0, 0, 1, 1,
0.7106472, 0.2210059, 0.03470635, 1, 0, 0, 1, 1,
0.7201384, -0.2204106, 2.234215, 1, 0, 0, 1, 1,
0.7226417, 0.2105049, 3.084334, 1, 0, 0, 1, 1,
0.7262446, 0.3750818, -0.4743499, 0, 0, 0, 1, 1,
0.7300007, 1.432002, 0.8672667, 0, 0, 0, 1, 1,
0.7333886, 0.3008007, 3.054133, 0, 0, 0, 1, 1,
0.7408845, -0.3867364, 2.887555, 0, 0, 0, 1, 1,
0.7491872, 0.3530322, 1.431769, 0, 0, 0, 1, 1,
0.7519278, 1.445919, 0.04182822, 0, 0, 0, 1, 1,
0.7579979, 1.241289, -0.08989365, 0, 0, 0, 1, 1,
0.7582476, 0.4697536, 1.476386, 1, 1, 1, 1, 1,
0.7584122, 1.164146, 1.337199, 1, 1, 1, 1, 1,
0.7645609, -0.7246982, 2.338635, 1, 1, 1, 1, 1,
0.7652122, -0.340704, -0.004205993, 1, 1, 1, 1, 1,
0.7714971, 0.2298117, 2.070048, 1, 1, 1, 1, 1,
0.7726765, 1.050013, -1.796739, 1, 1, 1, 1, 1,
0.7740698, -0.8197991, 2.43332, 1, 1, 1, 1, 1,
0.7791105, 0.6581575, 1.496248, 1, 1, 1, 1, 1,
0.7837498, 1.672916, -0.3817973, 1, 1, 1, 1, 1,
0.7909665, 0.5747577, 2.039454, 1, 1, 1, 1, 1,
0.7919627, -1.31055, 2.034289, 1, 1, 1, 1, 1,
0.796414, 0.3669288, 2.182173, 1, 1, 1, 1, 1,
0.7980136, 1.262329, -0.8497816, 1, 1, 1, 1, 1,
0.8006235, -0.1467566, 1.104749, 1, 1, 1, 1, 1,
0.8056417, -0.7917488, 1.269125, 1, 1, 1, 1, 1,
0.8070828, -0.4235459, 3.022475, 0, 0, 1, 1, 1,
0.8085684, 0.4269079, -0.7357001, 1, 0, 0, 1, 1,
0.8118929, -0.01447869, 2.557542, 1, 0, 0, 1, 1,
0.8221086, -0.009769538, 1.73849, 1, 0, 0, 1, 1,
0.8259289, 0.6804688, 1.682117, 1, 0, 0, 1, 1,
0.8259488, -0.1323635, -0.251316, 1, 0, 0, 1, 1,
0.8353229, -0.2333598, 2.719527, 0, 0, 0, 1, 1,
0.8362408, -1.120439, 2.841871, 0, 0, 0, 1, 1,
0.8387243, 0.006390767, 2.679909, 0, 0, 0, 1, 1,
0.8506982, 0.5417041, 0.8452421, 0, 0, 0, 1, 1,
0.8509205, 1.599954, 1.683679, 0, 0, 0, 1, 1,
0.8523656, -0.493978, 2.895725, 0, 0, 0, 1, 1,
0.8536111, 0.9624376, 0.9794178, 0, 0, 0, 1, 1,
0.8540245, -0.323131, 1.945758, 1, 1, 1, 1, 1,
0.8552667, 0.01720653, 1.464892, 1, 1, 1, 1, 1,
0.8648666, 1.511091, -0.9091103, 1, 1, 1, 1, 1,
0.8652717, 0.4783022, 3.818206, 1, 1, 1, 1, 1,
0.8675928, -1.777509, 1.994256, 1, 1, 1, 1, 1,
0.869219, 0.3139374, 2.121602, 1, 1, 1, 1, 1,
0.8728792, 1.016635, -1.732445, 1, 1, 1, 1, 1,
0.8745696, 1.618868, 0.9444198, 1, 1, 1, 1, 1,
0.8765357, 0.7351444, -0.1621325, 1, 1, 1, 1, 1,
0.8811249, -0.494003, 2.362109, 1, 1, 1, 1, 1,
0.8812693, 0.9539194, 0.672812, 1, 1, 1, 1, 1,
0.8821885, -0.5726842, 2.928335, 1, 1, 1, 1, 1,
0.8852865, -0.9725523, 2.662207, 1, 1, 1, 1, 1,
0.8858756, 1.381378, 0.6039299, 1, 1, 1, 1, 1,
0.8863215, 0.9098582, -0.9233072, 1, 1, 1, 1, 1,
0.8875523, 0.6481411, 0.8007814, 0, 0, 1, 1, 1,
0.8941222, -1.497171, 3.192608, 1, 0, 0, 1, 1,
0.8965424, 0.855225, -0.3220286, 1, 0, 0, 1, 1,
0.8991408, -1.739229, 2.624871, 1, 0, 0, 1, 1,
0.9029776, -1.078452, 3.287004, 1, 0, 0, 1, 1,
0.9047634, -1.124487, 2.896681, 1, 0, 0, 1, 1,
0.908361, -0.1715934, 1.009283, 0, 0, 0, 1, 1,
0.9105955, -0.04274987, 1.530082, 0, 0, 0, 1, 1,
0.9132227, -0.6816245, 1.296819, 0, 0, 0, 1, 1,
0.9164131, 0.4374625, -0.2438726, 0, 0, 0, 1, 1,
0.9193526, 0.06534892, -0.4258361, 0, 0, 0, 1, 1,
0.9299498, -0.2141162, 3.023964, 0, 0, 0, 1, 1,
0.9326514, 0.7031358, -0.1074822, 0, 0, 0, 1, 1,
0.9579566, 1.209503, 0.7845597, 1, 1, 1, 1, 1,
0.9621084, -0.173089, 1.44713, 1, 1, 1, 1, 1,
0.9633161, 0.9910207, -0.01454014, 1, 1, 1, 1, 1,
0.9651677, 0.4933456, 2.795533, 1, 1, 1, 1, 1,
0.9669876, -0.3205222, 1.525995, 1, 1, 1, 1, 1,
0.9672327, 0.1752384, -0.3801896, 1, 1, 1, 1, 1,
0.9691924, 1.487637, 0.02444907, 1, 1, 1, 1, 1,
0.9705343, 0.06527516, 2.829368, 1, 1, 1, 1, 1,
0.9708825, -0.6590606, 2.593861, 1, 1, 1, 1, 1,
0.9767472, -0.09085011, 1.547709, 1, 1, 1, 1, 1,
0.9816533, -0.1551955, 0.2927357, 1, 1, 1, 1, 1,
0.9855739, -0.1488813, 1.586488, 1, 1, 1, 1, 1,
0.9882357, 0.4622348, -0.793062, 1, 1, 1, 1, 1,
0.9890662, 1.593163, 1.94004, 1, 1, 1, 1, 1,
0.9947944, -0.752369, 3.397766, 1, 1, 1, 1, 1,
0.9965106, -0.8261886, 2.328974, 0, 0, 1, 1, 1,
0.9966352, 0.2750666, 0.7231342, 1, 0, 0, 1, 1,
1.008815, -2.661431, 2.694815, 1, 0, 0, 1, 1,
1.01453, 1.59635, 2.102457, 1, 0, 0, 1, 1,
1.01604, -1.52984, 2.677062, 1, 0, 0, 1, 1,
1.026158, -0.9075198, 0.7474922, 1, 0, 0, 1, 1,
1.03255, 0.8269706, -0.1430258, 0, 0, 0, 1, 1,
1.032722, -0.250005, 3.276701, 0, 0, 0, 1, 1,
1.038443, 1.709731, 2.730104, 0, 0, 0, 1, 1,
1.053649, -0.6004637, 2.020218, 0, 0, 0, 1, 1,
1.058385, -0.1735552, 2.721153, 0, 0, 0, 1, 1,
1.059713, 0.3021138, 1.584785, 0, 0, 0, 1, 1,
1.063953, -0.02135788, 2.223029, 0, 0, 0, 1, 1,
1.068196, 0.7410421, 1.789538, 1, 1, 1, 1, 1,
1.074219, 0.04183581, 0.4069425, 1, 1, 1, 1, 1,
1.080758, -0.8335856, 3.49763, 1, 1, 1, 1, 1,
1.081187, -0.5089734, 2.065352, 1, 1, 1, 1, 1,
1.082803, -1.243125, 0.6129754, 1, 1, 1, 1, 1,
1.085343, -1.538178, 3.76553, 1, 1, 1, 1, 1,
1.086297, 1.758133, -0.3771015, 1, 1, 1, 1, 1,
1.089253, -2.498999, 3.358373, 1, 1, 1, 1, 1,
1.099787, 1.255252, 2.372799, 1, 1, 1, 1, 1,
1.108259, -0.7445249, 2.431945, 1, 1, 1, 1, 1,
1.117361, -0.9915533, 1.137391, 1, 1, 1, 1, 1,
1.124479, 0.9531782, 0.6919166, 1, 1, 1, 1, 1,
1.128084, 0.1364793, 2.662167, 1, 1, 1, 1, 1,
1.130054, 0.5741256, 1.487869, 1, 1, 1, 1, 1,
1.134059, 0.8992319, 1.262231, 1, 1, 1, 1, 1,
1.135303, 1.263165, 1.411927, 0, 0, 1, 1, 1,
1.136816, -0.7619597, 1.391068, 1, 0, 0, 1, 1,
1.139369, 0.2739867, 1.57242, 1, 0, 0, 1, 1,
1.162462, -1.051543, 2.41231, 1, 0, 0, 1, 1,
1.163174, 0.5878129, 1.347953, 1, 0, 0, 1, 1,
1.164678, 0.07423202, 2.983704, 1, 0, 0, 1, 1,
1.166362, -0.5048106, 2.845106, 0, 0, 0, 1, 1,
1.183787, -0.200215, -0.1891871, 0, 0, 0, 1, 1,
1.184699, -0.03328475, 1.27722, 0, 0, 0, 1, 1,
1.1869, 0.8042228, 1.323596, 0, 0, 0, 1, 1,
1.192891, 0.0260969, 1.596922, 0, 0, 0, 1, 1,
1.196844, -0.5095272, 2.502083, 0, 0, 0, 1, 1,
1.197078, 1.510515, 0.857194, 0, 0, 0, 1, 1,
1.199491, 0.07204489, 1.285251, 1, 1, 1, 1, 1,
1.199929, -0.2304442, 1.501428, 1, 1, 1, 1, 1,
1.201514, -0.3454407, 1.117364, 1, 1, 1, 1, 1,
1.205218, 0.2225417, 1.883978, 1, 1, 1, 1, 1,
1.21183, 0.05401921, 1.665256, 1, 1, 1, 1, 1,
1.218375, 0.7545978, -0.3359408, 1, 1, 1, 1, 1,
1.219267, -0.01370312, 0.9817755, 1, 1, 1, 1, 1,
1.222252, 0.5492206, -0.08438567, 1, 1, 1, 1, 1,
1.231823, -0.2631923, 2.747249, 1, 1, 1, 1, 1,
1.237986, -0.1983205, 1.135165, 1, 1, 1, 1, 1,
1.241368, -1.055028, 2.162822, 1, 1, 1, 1, 1,
1.241731, 0.5276611, 0.3314843, 1, 1, 1, 1, 1,
1.250517, -0.6763606, 3.036954, 1, 1, 1, 1, 1,
1.264601, 1.513856, 0.2072339, 1, 1, 1, 1, 1,
1.265872, -2.288464, 3.243155, 1, 1, 1, 1, 1,
1.270064, -0.6587006, 0.5247988, 0, 0, 1, 1, 1,
1.27246, 0.01554912, -0.07180323, 1, 0, 0, 1, 1,
1.275929, -0.4871984, 2.250156, 1, 0, 0, 1, 1,
1.279437, 0.2464166, 1.879091, 1, 0, 0, 1, 1,
1.307552, 0.500932, -0.2292659, 1, 0, 0, 1, 1,
1.314342, -0.901628, 1.797334, 1, 0, 0, 1, 1,
1.32131, -1.658925, 2.22611, 0, 0, 0, 1, 1,
1.322703, -1.051005, 3.98087, 0, 0, 0, 1, 1,
1.329509, -0.528349, 2.388663, 0, 0, 0, 1, 1,
1.33003, -1.922072, 3.572338, 0, 0, 0, 1, 1,
1.333337, -0.8129566, 2.227033, 0, 0, 0, 1, 1,
1.336302, 1.908784, -1.050202, 0, 0, 0, 1, 1,
1.343408, 0.5592889, 1.019579, 0, 0, 0, 1, 1,
1.352654, 0.8464119, 1.094871, 1, 1, 1, 1, 1,
1.358904, 1.078543, -0.4840444, 1, 1, 1, 1, 1,
1.360904, -0.8512912, 2.253502, 1, 1, 1, 1, 1,
1.362798, 0.2913359, 1.316392, 1, 1, 1, 1, 1,
1.367453, 0.665385, 2.174326, 1, 1, 1, 1, 1,
1.372804, -0.0290713, 4.444872, 1, 1, 1, 1, 1,
1.373052, 0.1773558, -0.2699549, 1, 1, 1, 1, 1,
1.37923, -1.247567, 1.241339, 1, 1, 1, 1, 1,
1.379457, 0.3915995, 3.378138, 1, 1, 1, 1, 1,
1.38194, -0.1302577, 0.8295234, 1, 1, 1, 1, 1,
1.383079, -1.75757, 4.399675, 1, 1, 1, 1, 1,
1.401069, -0.7028943, 1.796731, 1, 1, 1, 1, 1,
1.424624, -1.199585, 1.726217, 1, 1, 1, 1, 1,
1.435707, 0.06054733, 1.286065, 1, 1, 1, 1, 1,
1.442288, 1.745507, -1.979523, 1, 1, 1, 1, 1,
1.471384, -2.302761, 3.144923, 0, 0, 1, 1, 1,
1.474335, 1.062989, 1.144859, 1, 0, 0, 1, 1,
1.476921, 0.949598, 1.444293, 1, 0, 0, 1, 1,
1.482288, -0.07027015, 1.317565, 1, 0, 0, 1, 1,
1.483061, 1.162111, 2.17647, 1, 0, 0, 1, 1,
1.485039, 0.6541913, 2.765565, 1, 0, 0, 1, 1,
1.490415, -0.07836138, -0.5640465, 0, 0, 0, 1, 1,
1.502011, 0.204247, 1.992524, 0, 0, 0, 1, 1,
1.507343, 1.28436, 0.094762, 0, 0, 0, 1, 1,
1.515358, -1.048327, 1.294546, 0, 0, 0, 1, 1,
1.516351, -0.06029318, 0.8552396, 0, 0, 0, 1, 1,
1.527847, 0.07565265, 2.157613, 0, 0, 0, 1, 1,
1.537655, 0.01848623, 1.207706, 0, 0, 0, 1, 1,
1.544168, 0.9247031, 2.439692, 1, 1, 1, 1, 1,
1.551394, -0.1102255, 1.024639, 1, 1, 1, 1, 1,
1.557809, 0.8519396, 2.498139, 1, 1, 1, 1, 1,
1.558926, -0.04122918, 3.170079, 1, 1, 1, 1, 1,
1.562955, 1.131309, 2.526841, 1, 1, 1, 1, 1,
1.571656, -0.120512, 3.048603, 1, 1, 1, 1, 1,
1.582182, -0.258008, 2.425434, 1, 1, 1, 1, 1,
1.598675, 0.954856, 1.150764, 1, 1, 1, 1, 1,
1.599963, -0.3335729, 2.412722, 1, 1, 1, 1, 1,
1.601512, 0.7282613, 1.540722, 1, 1, 1, 1, 1,
1.610913, -1.016298, 3.469232, 1, 1, 1, 1, 1,
1.61176, -0.3383494, 0.671546, 1, 1, 1, 1, 1,
1.621692, -0.6706781, 3.018977, 1, 1, 1, 1, 1,
1.635584, -0.2504225, 1.953725, 1, 1, 1, 1, 1,
1.666982, 0.6342951, -1.030288, 1, 1, 1, 1, 1,
1.699232, 1.41988, 0.7824275, 0, 0, 1, 1, 1,
1.702905, -0.4547471, 2.180825, 1, 0, 0, 1, 1,
1.703674, 0.3029108, 1.542692, 1, 0, 0, 1, 1,
1.706185, -1.224073, 2.20185, 1, 0, 0, 1, 1,
1.714884, 1.290141, 2.321404, 1, 0, 0, 1, 1,
1.715544, 0.536553, 1.208697, 1, 0, 0, 1, 1,
1.737817, 1.145598, -0.1934161, 0, 0, 0, 1, 1,
1.738572, 1.326621, 0.3486811, 0, 0, 0, 1, 1,
1.739982, 0.5577356, 0.7363499, 0, 0, 0, 1, 1,
1.79769, -0.2951439, 2.143839, 0, 0, 0, 1, 1,
1.799102, 1.0015, 2.790699, 0, 0, 0, 1, 1,
1.799538, 1.272974, 2.464227, 0, 0, 0, 1, 1,
1.813942, 0.5160019, 2.939406, 0, 0, 0, 1, 1,
1.818059, -0.7015134, 2.630849, 1, 1, 1, 1, 1,
1.849794, -0.2684023, 0.1547508, 1, 1, 1, 1, 1,
1.874665, -0.4246391, 1.567329, 1, 1, 1, 1, 1,
1.880071, -0.7086536, 2.080768, 1, 1, 1, 1, 1,
1.881919, -1.53461, 3.247302, 1, 1, 1, 1, 1,
1.889525, -1.177591, 1.715428, 1, 1, 1, 1, 1,
1.917123, -0.3615408, 1.320957, 1, 1, 1, 1, 1,
1.922802, -1.760756, 1.824081, 1, 1, 1, 1, 1,
1.925338, 0.7852429, 2.769054, 1, 1, 1, 1, 1,
1.932936, -1.885803, 1.651601, 1, 1, 1, 1, 1,
1.973901, -1.197191, 1.627887, 1, 1, 1, 1, 1,
1.981947, 0.227, 0.4402619, 1, 1, 1, 1, 1,
2.009689, -0.2460303, 3.14208, 1, 1, 1, 1, 1,
2.051261, -0.4214556, 1.088883, 1, 1, 1, 1, 1,
2.102101, 0.2951363, 1.294453, 1, 1, 1, 1, 1,
2.105925, 0.1100589, 3.767359, 0, 0, 1, 1, 1,
2.153809, -1.171936, 2.294793, 1, 0, 0, 1, 1,
2.171725, -0.6125104, 1.273712, 1, 0, 0, 1, 1,
2.191923, 1.142768, 3.269982, 1, 0, 0, 1, 1,
2.198976, -1.805102, 1.660458, 1, 0, 0, 1, 1,
2.220395, -1.162853, 1.270131, 1, 0, 0, 1, 1,
2.245699, -1.865359, 3.269004, 0, 0, 0, 1, 1,
2.249071, 0.8897009, 0.413379, 0, 0, 0, 1, 1,
2.254308, -0.8185103, 2.387094, 0, 0, 0, 1, 1,
2.270029, 1.283659, 0.7672659, 0, 0, 0, 1, 1,
2.354187, 0.4447878, 0.6865276, 0, 0, 0, 1, 1,
2.36372, 0.6833628, 1.933848, 0, 0, 0, 1, 1,
2.422267, 0.8644835, -0.398323, 0, 0, 0, 1, 1,
2.440501, 0.7454111, -0.3850555, 1, 1, 1, 1, 1,
2.458681, 1.728277, 0.4794511, 1, 1, 1, 1, 1,
2.466862, -1.239904, 1.698019, 1, 1, 1, 1, 1,
2.539019, -0.5887437, 4.089065, 1, 1, 1, 1, 1,
2.924337, 0.1730351, 1.356441, 1, 1, 1, 1, 1,
2.946012, -0.4243151, 0.7966134, 1, 1, 1, 1, 1,
2.973858, -0.03151666, 0.1135324, 1, 1, 1, 1, 1
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
var radius = 9.433348;
var distance = 33.13423;
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
mvMatrix.translate( 0.2071353, 0.09766483, -0.5001338 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.13423);
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
