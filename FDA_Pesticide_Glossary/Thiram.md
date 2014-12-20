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
-3.123487, 0.927562, -2.193237, 1, 0, 0, 1,
-2.883045, 1.212097, -1.37054, 1, 0.007843138, 0, 1,
-2.797056, -0.3585745, -1.622736, 1, 0.01176471, 0, 1,
-2.768602, -0.9398435, -3.597244, 1, 0.01960784, 0, 1,
-2.692151, 1.220921, -0.2394188, 1, 0.02352941, 0, 1,
-2.631055, 0.8084728, -3.03356, 1, 0.03137255, 0, 1,
-2.623117, -1.09844, 0.3073882, 1, 0.03529412, 0, 1,
-2.545126, 1.718088, -1.595402, 1, 0.04313726, 0, 1,
-2.385693, 0.555394, -0.6004261, 1, 0.04705882, 0, 1,
-2.333062, -0.0309376, -2.227608, 1, 0.05490196, 0, 1,
-2.263451, -0.9402127, -1.919567, 1, 0.05882353, 0, 1,
-2.249382, -0.3920484, -2.453218, 1, 0.06666667, 0, 1,
-2.244686, 1.264293, -0.3605254, 1, 0.07058824, 0, 1,
-2.242562, -0.5306333, -1.660553, 1, 0.07843138, 0, 1,
-2.239754, 0.3070819, -2.833983, 1, 0.08235294, 0, 1,
-2.217921, 0.3370465, -1.913627, 1, 0.09019608, 0, 1,
-2.210848, 0.2943123, -0.482965, 1, 0.09411765, 0, 1,
-2.207059, 0.1894047, -0.8524577, 1, 0.1019608, 0, 1,
-2.193752, 1.830829, -0.09238249, 1, 0.1098039, 0, 1,
-2.168001, 0.1567393, -3.20528, 1, 0.1137255, 0, 1,
-2.074178, -0.3053252, -2.303308, 1, 0.1215686, 0, 1,
-2.063209, -0.4280528, -2.042165, 1, 0.1254902, 0, 1,
-2.060233, 2.375746, -0.5288497, 1, 0.1333333, 0, 1,
-2.051545, 0.1839363, -0.777483, 1, 0.1372549, 0, 1,
-2.023629, -0.2973987, -0.2921133, 1, 0.145098, 0, 1,
-2.009217, -1.433463, -2.426679, 1, 0.1490196, 0, 1,
-1.982889, 0.4484972, -2.339109, 1, 0.1568628, 0, 1,
-1.979233, 0.5614673, -2.042132, 1, 0.1607843, 0, 1,
-1.967018, 0.9476906, -0.2126699, 1, 0.1686275, 0, 1,
-1.963253, -0.03336429, -0.9636713, 1, 0.172549, 0, 1,
-1.961478, 0.513695, -0.9156938, 1, 0.1803922, 0, 1,
-1.950086, 1.229399, -0.578088, 1, 0.1843137, 0, 1,
-1.903039, -0.1730709, -1.190853, 1, 0.1921569, 0, 1,
-1.895387, -0.4561224, -1.235934, 1, 0.1960784, 0, 1,
-1.888818, -1.184661, -2.381393, 1, 0.2039216, 0, 1,
-1.885954, 0.5541954, -1.299587, 1, 0.2117647, 0, 1,
-1.882149, 0.9558054, -2.108877, 1, 0.2156863, 0, 1,
-1.881673, -0.6940455, -1.893888, 1, 0.2235294, 0, 1,
-1.874949, 0.779761, -2.312659, 1, 0.227451, 0, 1,
-1.868024, 1.460049, 0.2457947, 1, 0.2352941, 0, 1,
-1.863518, 1.144681, -1.995055, 1, 0.2392157, 0, 1,
-1.842289, -0.6818241, -2.848401, 1, 0.2470588, 0, 1,
-1.837403, -0.5105876, -2.488301, 1, 0.2509804, 0, 1,
-1.820303, 0.1575098, -0.8976383, 1, 0.2588235, 0, 1,
-1.809736, -0.2090861, -1.491201, 1, 0.2627451, 0, 1,
-1.808353, -1.268168, -3.64793, 1, 0.2705882, 0, 1,
-1.782507, -1.518053, -2.126315, 1, 0.2745098, 0, 1,
-1.772973, 0.7380931, -1.25082, 1, 0.282353, 0, 1,
-1.767293, -0.4279289, -0.609382, 1, 0.2862745, 0, 1,
-1.74583, -0.1318662, -0.7252038, 1, 0.2941177, 0, 1,
-1.735346, -1.902578, -2.182853, 1, 0.3019608, 0, 1,
-1.712512, -1.185631, -3.128057, 1, 0.3058824, 0, 1,
-1.697037, -0.1438617, -1.537222, 1, 0.3137255, 0, 1,
-1.690911, 0.4666736, -0.5992821, 1, 0.3176471, 0, 1,
-1.679177, 0.8958785, -1.594259, 1, 0.3254902, 0, 1,
-1.675089, 0.7172123, 0.4461201, 1, 0.3294118, 0, 1,
-1.665344, 0.6160517, -2.608734, 1, 0.3372549, 0, 1,
-1.664581, -0.752162, -2.606764, 1, 0.3411765, 0, 1,
-1.647289, 0.2116332, 0.2240929, 1, 0.3490196, 0, 1,
-1.641706, -1.347185, -2.027637, 1, 0.3529412, 0, 1,
-1.627884, 2.042752, -1.052969, 1, 0.3607843, 0, 1,
-1.62439, 0.07467813, -0.7231193, 1, 0.3647059, 0, 1,
-1.621989, -0.9697071, -3.647549, 1, 0.372549, 0, 1,
-1.621399, 1.827255, 0.3382702, 1, 0.3764706, 0, 1,
-1.597854, 0.5436465, -0.7558016, 1, 0.3843137, 0, 1,
-1.579236, 1.966348, -0.751941, 1, 0.3882353, 0, 1,
-1.572721, 0.7613114, -1.912802, 1, 0.3960784, 0, 1,
-1.56747, 0.7842851, -1.252874, 1, 0.4039216, 0, 1,
-1.553738, 2.328588, -1.009132, 1, 0.4078431, 0, 1,
-1.542113, 0.6207061, -0.2298504, 1, 0.4156863, 0, 1,
-1.525767, -0.7669092, -2.338648, 1, 0.4196078, 0, 1,
-1.524981, 0.7309222, -0.4968041, 1, 0.427451, 0, 1,
-1.48439, 1.160872, 1.533732, 1, 0.4313726, 0, 1,
-1.473338, -1.42234, -1.656665, 1, 0.4392157, 0, 1,
-1.471108, -3.136435, -2.401091, 1, 0.4431373, 0, 1,
-1.469957, -1.342324, -0.1302552, 1, 0.4509804, 0, 1,
-1.454761, 1.702391, -2.986132, 1, 0.454902, 0, 1,
-1.44721, -0.9759995, -2.447103, 1, 0.4627451, 0, 1,
-1.446367, 0.01444047, -1.306102, 1, 0.4666667, 0, 1,
-1.443615, 0.5429909, -0.5604824, 1, 0.4745098, 0, 1,
-1.427772, -0.2281621, -0.989567, 1, 0.4784314, 0, 1,
-1.426772, -0.3733189, -3.238634, 1, 0.4862745, 0, 1,
-1.425759, -1.306555, -1.446693, 1, 0.4901961, 0, 1,
-1.412218, 0.3856699, -0.7692003, 1, 0.4980392, 0, 1,
-1.406023, -0.2795338, -2.00618, 1, 0.5058824, 0, 1,
-1.406019, -1.336817, -3.213195, 1, 0.509804, 0, 1,
-1.405169, -1.241076, -3.887163, 1, 0.5176471, 0, 1,
-1.399627, 0.05519168, -1.329338, 1, 0.5215687, 0, 1,
-1.39193, -0.9352981, -0.05215392, 1, 0.5294118, 0, 1,
-1.389486, 1.169908, -0.7041225, 1, 0.5333334, 0, 1,
-1.370792, -0.04265752, -2.854026, 1, 0.5411765, 0, 1,
-1.359281, 0.2158434, -1.304388, 1, 0.5450981, 0, 1,
-1.35803, -0.1476532, -1.354489, 1, 0.5529412, 0, 1,
-1.353286, 0.3903801, -2.646344, 1, 0.5568628, 0, 1,
-1.351121, -0.1401384, -1.278288, 1, 0.5647059, 0, 1,
-1.341307, -0.9091516, -0.8389494, 1, 0.5686275, 0, 1,
-1.340448, 2.277879, -0.4930218, 1, 0.5764706, 0, 1,
-1.330054, 1.252917, -0.3476651, 1, 0.5803922, 0, 1,
-1.323626, -0.3413327, -1.990859, 1, 0.5882353, 0, 1,
-1.315483, -0.3226155, 0.01301628, 1, 0.5921569, 0, 1,
-1.314189, 1.629722, -0.6833015, 1, 0.6, 0, 1,
-1.303719, -0.8310494, -3.344409, 1, 0.6078432, 0, 1,
-1.298508, 0.7439275, -1.213569, 1, 0.6117647, 0, 1,
-1.291533, -1.092935, -0.8608592, 1, 0.6196079, 0, 1,
-1.284154, 1.249758, -1.092443, 1, 0.6235294, 0, 1,
-1.27865, 0.343211, -2.274841, 1, 0.6313726, 0, 1,
-1.276343, -1.040985, -2.534898, 1, 0.6352941, 0, 1,
-1.269039, 2.910805, 1.528235, 1, 0.6431373, 0, 1,
-1.263125, -0.1973215, -2.900854, 1, 0.6470588, 0, 1,
-1.261971, -1.109632, -2.390678, 1, 0.654902, 0, 1,
-1.261655, 0.5229435, -0.875379, 1, 0.6588235, 0, 1,
-1.258302, 0.2819402, -1.543042, 1, 0.6666667, 0, 1,
-1.25611, -0.6619944, -3.036744, 1, 0.6705883, 0, 1,
-1.255955, 0.4065316, -1.145265, 1, 0.6784314, 0, 1,
-1.25538, 0.6817492, -1.002474, 1, 0.682353, 0, 1,
-1.255197, 1.517397, -0.8447165, 1, 0.6901961, 0, 1,
-1.252702, -0.299817, -2.515858, 1, 0.6941177, 0, 1,
-1.24499, 2.071512, 1.676455, 1, 0.7019608, 0, 1,
-1.242452, 0.5574011, -1.366186, 1, 0.7098039, 0, 1,
-1.240182, -1.5676, -2.215577, 1, 0.7137255, 0, 1,
-1.239733, -0.02025812, -1.550679, 1, 0.7215686, 0, 1,
-1.22597, -0.4571832, -3.488538, 1, 0.7254902, 0, 1,
-1.225668, -0.2873331, -2.1799, 1, 0.7333333, 0, 1,
-1.222837, -1.206291, -0.6375557, 1, 0.7372549, 0, 1,
-1.222224, 0.3629963, -0.08967203, 1, 0.7450981, 0, 1,
-1.21315, 0.1975004, -0.9341807, 1, 0.7490196, 0, 1,
-1.208332, -0.1754213, -3.212716, 1, 0.7568628, 0, 1,
-1.206842, 2.201073, -1.816689, 1, 0.7607843, 0, 1,
-1.206765, 0.8926136, -0.2347671, 1, 0.7686275, 0, 1,
-1.201267, 0.5164005, -0.4839121, 1, 0.772549, 0, 1,
-1.199213, -1.358266, -2.289459, 1, 0.7803922, 0, 1,
-1.19003, -0.0677097, -2.222287, 1, 0.7843137, 0, 1,
-1.179441, 0.6363949, -3.121423, 1, 0.7921569, 0, 1,
-1.178227, -0.4193043, 0.481828, 1, 0.7960784, 0, 1,
-1.165337, -1.871249, -1.119893, 1, 0.8039216, 0, 1,
-1.16028, -0.506834, -1.30834, 1, 0.8117647, 0, 1,
-1.157606, 0.6445618, -2.336543, 1, 0.8156863, 0, 1,
-1.156682, 0.5144317, -0.6755493, 1, 0.8235294, 0, 1,
-1.151625, -0.2972095, -3.696989, 1, 0.827451, 0, 1,
-1.148642, -0.5929567, -0.2033278, 1, 0.8352941, 0, 1,
-1.127135, 0.02327945, -1.693624, 1, 0.8392157, 0, 1,
-1.126766, 0.7816756, -0.5194249, 1, 0.8470588, 0, 1,
-1.126592, -2.17246, -2.677572, 1, 0.8509804, 0, 1,
-1.111638, -0.03020306, -1.460155, 1, 0.8588235, 0, 1,
-1.109148, -1.618137, -3.971185, 1, 0.8627451, 0, 1,
-1.102236, -0.1039128, -2.028961, 1, 0.8705882, 0, 1,
-1.102123, -0.4662821, -1.875509, 1, 0.8745098, 0, 1,
-1.075627, -0.9221501, -2.94169, 1, 0.8823529, 0, 1,
-1.07554, -0.4338472, -1.51625, 1, 0.8862745, 0, 1,
-1.065563, 0.1597877, -2.292796, 1, 0.8941177, 0, 1,
-1.060141, 1.363101, -1.298421, 1, 0.8980392, 0, 1,
-1.055962, 0.8963329, -3.075078, 1, 0.9058824, 0, 1,
-1.051495, 2.630106, -0.1848806, 1, 0.9137255, 0, 1,
-1.03946, -1.635756, -2.703379, 1, 0.9176471, 0, 1,
-1.038605, -2.565002, -2.601691, 1, 0.9254902, 0, 1,
-1.03384, -1.057492, -3.289748, 1, 0.9294118, 0, 1,
-1.029097, -0.3299913, -1.072173, 1, 0.9372549, 0, 1,
-1.027405, 0.6426128, 1.531775, 1, 0.9411765, 0, 1,
-1.025331, 1.433228, 0.3657308, 1, 0.9490196, 0, 1,
-1.01955, 0.3712304, 0.9454665, 1, 0.9529412, 0, 1,
-1.018445, -0.06707088, -0.8829313, 1, 0.9607843, 0, 1,
-1.018281, -0.4160405, -2.760683, 1, 0.9647059, 0, 1,
-1.014781, -0.1771632, -2.720539, 1, 0.972549, 0, 1,
-1.014488, 1.677646, -1.543228, 1, 0.9764706, 0, 1,
-1.01129, -1.378098, -1.660025, 1, 0.9843137, 0, 1,
-1.010768, -0.008479497, -2.942399, 1, 0.9882353, 0, 1,
-0.9945571, 0.07173234, 0.7393795, 1, 0.9960784, 0, 1,
-0.9939454, 0.28839, -1.277957, 0.9960784, 1, 0, 1,
-0.9858832, 0.4751822, -1.710782, 0.9921569, 1, 0, 1,
-0.9856142, 0.7849202, -1.840342, 0.9843137, 1, 0, 1,
-0.9817144, 0.6624469, -0.5967962, 0.9803922, 1, 0, 1,
-0.9813975, -0.7975251, -1.699474, 0.972549, 1, 0, 1,
-0.9775655, -0.1709077, -1.401236, 0.9686275, 1, 0, 1,
-0.9725038, -1.492067, -2.619525, 0.9607843, 1, 0, 1,
-0.969797, -0.7703229, -2.804088, 0.9568627, 1, 0, 1,
-0.967259, -2.36872, -2.46536, 0.9490196, 1, 0, 1,
-0.9565525, 0.6312727, -2.611633, 0.945098, 1, 0, 1,
-0.9490765, 0.5016555, -1.496243, 0.9372549, 1, 0, 1,
-0.9453763, 0.4619002, -0.6802664, 0.9333333, 1, 0, 1,
-0.935987, -1.001114, -2.252524, 0.9254902, 1, 0, 1,
-0.9291573, -0.9101465, -3.316046, 0.9215686, 1, 0, 1,
-0.9231427, 0.5520324, -0.1803241, 0.9137255, 1, 0, 1,
-0.9223981, 0.1753091, -1.266021, 0.9098039, 1, 0, 1,
-0.9214008, -0.07107633, -2.583448, 0.9019608, 1, 0, 1,
-0.9206209, 0.1900347, -0.9104624, 0.8941177, 1, 0, 1,
-0.907429, -0.2637417, -2.860056, 0.8901961, 1, 0, 1,
-0.9065524, -0.5362105, -1.926215, 0.8823529, 1, 0, 1,
-0.8922898, 0.3786452, -2.515826, 0.8784314, 1, 0, 1,
-0.8918741, -0.7888249, -2.244264, 0.8705882, 1, 0, 1,
-0.8899987, -2.019292, -3.011665, 0.8666667, 1, 0, 1,
-0.8850384, -0.04143861, -2.328682, 0.8588235, 1, 0, 1,
-0.8847662, 0.6070527, -0.551021, 0.854902, 1, 0, 1,
-0.882939, 1.069133, 0.348859, 0.8470588, 1, 0, 1,
-0.8821948, -0.2086487, -1.885881, 0.8431373, 1, 0, 1,
-0.8786681, -0.3987719, -0.920702, 0.8352941, 1, 0, 1,
-0.877467, -0.4212252, -1.435652, 0.8313726, 1, 0, 1,
-0.8731766, -0.2623423, -1.646983, 0.8235294, 1, 0, 1,
-0.8719732, 0.5439945, -1.52707, 0.8196079, 1, 0, 1,
-0.8596653, -2.421162, -2.906592, 0.8117647, 1, 0, 1,
-0.8551297, -0.8713296, -2.943833, 0.8078431, 1, 0, 1,
-0.8534786, -0.3359142, -1.319004, 0.8, 1, 0, 1,
-0.8500929, -1.058402, -1.655041, 0.7921569, 1, 0, 1,
-0.848254, -0.6648977, -2.559183, 0.7882353, 1, 0, 1,
-0.8465862, 0.2025879, -0.4268059, 0.7803922, 1, 0, 1,
-0.846243, 2.685595, 0.310052, 0.7764706, 1, 0, 1,
-0.8420212, 0.4823249, -1.437866, 0.7686275, 1, 0, 1,
-0.837779, -0.5708483, -3.63784, 0.7647059, 1, 0, 1,
-0.8247091, 0.511568, -0.1049859, 0.7568628, 1, 0, 1,
-0.8226676, -0.7348605, -2.237104, 0.7529412, 1, 0, 1,
-0.8201918, 0.1313645, -1.687423, 0.7450981, 1, 0, 1,
-0.8188559, 0.08394643, -1.850986, 0.7411765, 1, 0, 1,
-0.8162712, 0.8307825, -1.883006, 0.7333333, 1, 0, 1,
-0.8136609, -1.211893, -1.467716, 0.7294118, 1, 0, 1,
-0.811711, -1.650759, -2.795254, 0.7215686, 1, 0, 1,
-0.802898, 1.931709, -0.7241639, 0.7176471, 1, 0, 1,
-0.8011344, -0.1571705, -0.7952803, 0.7098039, 1, 0, 1,
-0.7963209, -0.01551795, -1.700773, 0.7058824, 1, 0, 1,
-0.7941124, -2.344026, -3.966551, 0.6980392, 1, 0, 1,
-0.7797046, -0.3901719, -0.858683, 0.6901961, 1, 0, 1,
-0.7779085, -2.860193, -1.776931, 0.6862745, 1, 0, 1,
-0.7711062, 1.183713, -0.7925748, 0.6784314, 1, 0, 1,
-0.7694704, 0.4543984, -1.073126, 0.6745098, 1, 0, 1,
-0.7691651, 0.9146106, -1.226106, 0.6666667, 1, 0, 1,
-0.7673588, -0.6428328, -2.953961, 0.6627451, 1, 0, 1,
-0.7647406, 1.633675, -1.966475, 0.654902, 1, 0, 1,
-0.7620395, 0.5476097, -1.10388, 0.6509804, 1, 0, 1,
-0.7577748, 2.151651, 0.1362692, 0.6431373, 1, 0, 1,
-0.7571592, 0.3053202, -0.728634, 0.6392157, 1, 0, 1,
-0.7566808, 0.5792671, -2.388312, 0.6313726, 1, 0, 1,
-0.7535772, -0.7238982, -2.771636, 0.627451, 1, 0, 1,
-0.7457757, -0.7475187, -1.862412, 0.6196079, 1, 0, 1,
-0.7426953, 0.62115, -2.623592, 0.6156863, 1, 0, 1,
-0.7418132, 1.894577, -1.441612, 0.6078432, 1, 0, 1,
-0.7367592, 0.1833907, -2.292863, 0.6039216, 1, 0, 1,
-0.7323005, -1.609068, -3.761117, 0.5960785, 1, 0, 1,
-0.7214653, -0.6353853, -2.13051, 0.5882353, 1, 0, 1,
-0.7192631, -0.1148149, -1.982538, 0.5843138, 1, 0, 1,
-0.7157433, -0.005462568, -2.272046, 0.5764706, 1, 0, 1,
-0.7140318, 0.1449699, -1.165482, 0.572549, 1, 0, 1,
-0.7037619, 0.7042848, -1.666269, 0.5647059, 1, 0, 1,
-0.6982803, 0.454123, -0.04503793, 0.5607843, 1, 0, 1,
-0.6980496, 0.09620297, -1.76065, 0.5529412, 1, 0, 1,
-0.6854641, 1.399863, -1.89826, 0.5490196, 1, 0, 1,
-0.6820444, 1.622389, -0.5445439, 0.5411765, 1, 0, 1,
-0.6793482, 0.704408, 0.2381098, 0.5372549, 1, 0, 1,
-0.6790279, -2.679165, -3.409266, 0.5294118, 1, 0, 1,
-0.6757324, 0.5869657, -1.274865, 0.5254902, 1, 0, 1,
-0.6712483, 0.2808171, 1.163224, 0.5176471, 1, 0, 1,
-0.6670138, 0.0726764, -0.6813885, 0.5137255, 1, 0, 1,
-0.665633, -0.3034792, -3.491058, 0.5058824, 1, 0, 1,
-0.6635791, 1.327011, -1.336081, 0.5019608, 1, 0, 1,
-0.6605855, 0.6643806, -1.491411, 0.4941176, 1, 0, 1,
-0.6552894, 0.5380262, 0.1286418, 0.4862745, 1, 0, 1,
-0.6497669, 0.4781332, -0.5888532, 0.4823529, 1, 0, 1,
-0.6422247, -0.2007391, -1.663772, 0.4745098, 1, 0, 1,
-0.6417938, 0.4127393, -0.07470702, 0.4705882, 1, 0, 1,
-0.6362407, 1.856508, -3.18684, 0.4627451, 1, 0, 1,
-0.6339553, -0.2805772, -1.879592, 0.4588235, 1, 0, 1,
-0.6300415, 2.376774, -1.039359, 0.4509804, 1, 0, 1,
-0.6249292, -0.186712, -1.223469, 0.4470588, 1, 0, 1,
-0.624873, 0.238303, -2.74658, 0.4392157, 1, 0, 1,
-0.6234947, 0.2580901, -1.555288, 0.4352941, 1, 0, 1,
-0.6217809, -0.1082992, 0.4932245, 0.427451, 1, 0, 1,
-0.6197586, -1.288557, -2.73068, 0.4235294, 1, 0, 1,
-0.6187118, 1.091726, -0.4011417, 0.4156863, 1, 0, 1,
-0.6162629, 0.270958, -1.044973, 0.4117647, 1, 0, 1,
-0.611334, 2.46853, 0.05134371, 0.4039216, 1, 0, 1,
-0.6107179, 1.588147, -0.4273868, 0.3960784, 1, 0, 1,
-0.6105693, -0.9147307, -4.423372, 0.3921569, 1, 0, 1,
-0.6100891, 2.789671, -0.5313169, 0.3843137, 1, 0, 1,
-0.6094928, -0.02422655, -0.4700753, 0.3803922, 1, 0, 1,
-0.6072615, -2.78001, -2.985159, 0.372549, 1, 0, 1,
-0.6069571, -1.052779, -3.646813, 0.3686275, 1, 0, 1,
-0.6036892, 0.3001841, -1.070401, 0.3607843, 1, 0, 1,
-0.5997394, 1.479048, -0.1237095, 0.3568628, 1, 0, 1,
-0.5978783, -0.1062714, -1.578872, 0.3490196, 1, 0, 1,
-0.5971893, 0.331175, 0.2047899, 0.345098, 1, 0, 1,
-0.5966948, -0.4632795, -2.305239, 0.3372549, 1, 0, 1,
-0.5964021, 1.181329, -0.5657837, 0.3333333, 1, 0, 1,
-0.5914884, -0.1265288, 0.1340506, 0.3254902, 1, 0, 1,
-0.5893172, 0.159916, -2.31476, 0.3215686, 1, 0, 1,
-0.588883, -0.6875888, -1.320928, 0.3137255, 1, 0, 1,
-0.583919, -0.8542538, -2.951823, 0.3098039, 1, 0, 1,
-0.5822784, -1.902445, -1.368349, 0.3019608, 1, 0, 1,
-0.5812662, -0.5025325, -3.029614, 0.2941177, 1, 0, 1,
-0.5791782, -0.5900081, -2.774198, 0.2901961, 1, 0, 1,
-0.5760902, -1.00362, -1.73319, 0.282353, 1, 0, 1,
-0.5729977, 0.5006713, -2.153769, 0.2784314, 1, 0, 1,
-0.5674512, 1.079051, 0.5652813, 0.2705882, 1, 0, 1,
-0.5618365, -1.743135, -3.321406, 0.2666667, 1, 0, 1,
-0.5582848, -0.2664882, -2.605212, 0.2588235, 1, 0, 1,
-0.557737, -0.2718206, 0.3213495, 0.254902, 1, 0, 1,
-0.5574769, 1.045591, -1.406212, 0.2470588, 1, 0, 1,
-0.550193, -0.03383691, -2.281353, 0.2431373, 1, 0, 1,
-0.5449623, -1.267383, -3.638089, 0.2352941, 1, 0, 1,
-0.534478, 0.3681679, 0.2169445, 0.2313726, 1, 0, 1,
-0.5342166, -0.4465467, -2.891447, 0.2235294, 1, 0, 1,
-0.5334711, -2.331892, -2.533763, 0.2196078, 1, 0, 1,
-0.5264351, -0.2257126, -2.296687, 0.2117647, 1, 0, 1,
-0.5254061, -0.3118534, -1.721229, 0.2078431, 1, 0, 1,
-0.5250331, 1.101125, -0.2575599, 0.2, 1, 0, 1,
-0.5245863, -0.7014326, -1.294739, 0.1921569, 1, 0, 1,
-0.5210507, 0.3078588, -1.931948, 0.1882353, 1, 0, 1,
-0.5175111, 0.8375164, 0.8711537, 0.1803922, 1, 0, 1,
-0.5106496, -1.179953, -2.709899, 0.1764706, 1, 0, 1,
-0.5099353, 0.4200122, -0.6053088, 0.1686275, 1, 0, 1,
-0.5093654, 0.5945855, -0.8156192, 0.1647059, 1, 0, 1,
-0.509105, 0.3952277, 0.06085933, 0.1568628, 1, 0, 1,
-0.5087584, 0.6341828, 1.239551, 0.1529412, 1, 0, 1,
-0.5075471, 1.227196, -1.37559, 0.145098, 1, 0, 1,
-0.5027004, -1.078939, -2.035837, 0.1411765, 1, 0, 1,
-0.4991449, 1.080639, 1.506892, 0.1333333, 1, 0, 1,
-0.4988655, 0.85019, -0.01071526, 0.1294118, 1, 0, 1,
-0.4892136, -0.7437711, -2.995585, 0.1215686, 1, 0, 1,
-0.4739583, -0.1039889, -1.63885, 0.1176471, 1, 0, 1,
-0.4732352, -0.1626349, -4.550201, 0.1098039, 1, 0, 1,
-0.4730117, 0.6818911, 0.001423363, 0.1058824, 1, 0, 1,
-0.4716701, 0.1857517, -0.771543, 0.09803922, 1, 0, 1,
-0.471617, 0.9398694, 0.5599065, 0.09019608, 1, 0, 1,
-0.4707094, -1.000118, -2.385413, 0.08627451, 1, 0, 1,
-0.4681201, 0.5621818, 0.3224693, 0.07843138, 1, 0, 1,
-0.4669139, 0.2362539, -2.721676, 0.07450981, 1, 0, 1,
-0.4643809, 0.9693933, 0.7322611, 0.06666667, 1, 0, 1,
-0.4625349, 1.192842, -0.08777744, 0.0627451, 1, 0, 1,
-0.4588827, -0.1576702, -2.092715, 0.05490196, 1, 0, 1,
-0.455494, 0.5543138, -1.973316, 0.05098039, 1, 0, 1,
-0.4545486, -0.8449537, -2.897856, 0.04313726, 1, 0, 1,
-0.4509857, -0.1755746, -0.9273356, 0.03921569, 1, 0, 1,
-0.4431689, -0.4124559, -2.103452, 0.03137255, 1, 0, 1,
-0.441394, 1.31404, -0.4050848, 0.02745098, 1, 0, 1,
-0.4375475, 0.4238837, -0.5514941, 0.01960784, 1, 0, 1,
-0.4368359, -0.5240856, -0.837115, 0.01568628, 1, 0, 1,
-0.4360438, 0.4587025, -0.05046748, 0.007843138, 1, 0, 1,
-0.4354604, 0.6216139, -3.26079, 0.003921569, 1, 0, 1,
-0.4318478, -1.663197, -1.16101, 0, 1, 0.003921569, 1,
-0.4295391, -1.411119, -1.794665, 0, 1, 0.01176471, 1,
-0.428132, -1.132174, -3.659907, 0, 1, 0.01568628, 1,
-0.4251884, -0.2813358, -2.377481, 0, 1, 0.02352941, 1,
-0.4236791, 0.6785073, -3.476629, 0, 1, 0.02745098, 1,
-0.4220043, 0.4081984, -1.296317, 0, 1, 0.03529412, 1,
-0.4159894, -0.7508823, -2.02446, 0, 1, 0.03921569, 1,
-0.4105861, 2.30207, 0.4462379, 0, 1, 0.04705882, 1,
-0.4041084, -0.9690893, -2.358123, 0, 1, 0.05098039, 1,
-0.3996492, 0.4128501, -3.374213, 0, 1, 0.05882353, 1,
-0.3994567, 0.9423035, -0.9258216, 0, 1, 0.0627451, 1,
-0.3974708, 0.4434954, -0.03898631, 0, 1, 0.07058824, 1,
-0.3829111, -1.489954, -2.562839, 0, 1, 0.07450981, 1,
-0.377129, 0.2715937, -0.6973408, 0, 1, 0.08235294, 1,
-0.3763996, 1.103421, -2.19171, 0, 1, 0.08627451, 1,
-0.3727727, -1.468075, -2.594263, 0, 1, 0.09411765, 1,
-0.3719525, -0.4112044, -1.938131, 0, 1, 0.1019608, 1,
-0.3693669, 1.060363, -0.5244452, 0, 1, 0.1058824, 1,
-0.3669696, 0.6960297, -0.3956137, 0, 1, 0.1137255, 1,
-0.3661864, -1.732739, -3.355854, 0, 1, 0.1176471, 1,
-0.3658088, 0.2917225, -1.301457, 0, 1, 0.1254902, 1,
-0.3625471, 0.2279435, -1.630949, 0, 1, 0.1294118, 1,
-0.3577095, -1.819197, -1.505866, 0, 1, 0.1372549, 1,
-0.3573571, 0.3540671, 1.307296, 0, 1, 0.1411765, 1,
-0.3557712, -0.5882215, -1.477862, 0, 1, 0.1490196, 1,
-0.3535335, -1.404332, -4.517663, 0, 1, 0.1529412, 1,
-0.3531965, -0.4096872, -2.724876, 0, 1, 0.1607843, 1,
-0.3529468, -1.37553, -1.900798, 0, 1, 0.1647059, 1,
-0.3518341, 0.9093446, -1.418016, 0, 1, 0.172549, 1,
-0.3514619, -0.8780389, -1.742608, 0, 1, 0.1764706, 1,
-0.3484575, -1.390963, -3.114832, 0, 1, 0.1843137, 1,
-0.3462669, -0.4616798, -3.231087, 0, 1, 0.1882353, 1,
-0.3415031, -1.575587, -0.679611, 0, 1, 0.1960784, 1,
-0.3370055, -1.372608, -3.848537, 0, 1, 0.2039216, 1,
-0.3345282, 0.3560338, -1.611839, 0, 1, 0.2078431, 1,
-0.3326422, -1.022054, -4.106241, 0, 1, 0.2156863, 1,
-0.3267882, 1.795108, 0.1027093, 0, 1, 0.2196078, 1,
-0.3235295, -0.4483259, -3.4989, 0, 1, 0.227451, 1,
-0.3230799, -0.3105909, -1.106442, 0, 1, 0.2313726, 1,
-0.3221539, 1.454275, -0.3349227, 0, 1, 0.2392157, 1,
-0.3198942, -1.504965, -0.9000256, 0, 1, 0.2431373, 1,
-0.3177118, 1.184413, -1.919074, 0, 1, 0.2509804, 1,
-0.3160129, -0.507268, -1.720133, 0, 1, 0.254902, 1,
-0.3107018, 0.5121897, -0.3512458, 0, 1, 0.2627451, 1,
-0.3068016, 0.6930964, 0.280059, 0, 1, 0.2666667, 1,
-0.3055173, -0.64475, -1.154566, 0, 1, 0.2745098, 1,
-0.3041389, 1.081026, -0.7900738, 0, 1, 0.2784314, 1,
-0.303776, 0.4825169, -0.3911151, 0, 1, 0.2862745, 1,
-0.2934062, -1.811795, -1.76473, 0, 1, 0.2901961, 1,
-0.2898468, 0.5417798, -1.17969, 0, 1, 0.2980392, 1,
-0.2897322, -0.7629608, -2.109812, 0, 1, 0.3058824, 1,
-0.2872572, -0.5250675, -2.904942, 0, 1, 0.3098039, 1,
-0.2842053, -0.3052765, -2.898282, 0, 1, 0.3176471, 1,
-0.2821911, -0.2776964, -1.516152, 0, 1, 0.3215686, 1,
-0.2783033, 0.9458471, -1.075226, 0, 1, 0.3294118, 1,
-0.277706, 0.0360086, -2.603533, 0, 1, 0.3333333, 1,
-0.268922, -0.1709389, -2.245347, 0, 1, 0.3411765, 1,
-0.2644723, 0.3072562, -1.455189, 0, 1, 0.345098, 1,
-0.2639736, -1.048393, -3.752734, 0, 1, 0.3529412, 1,
-0.2601429, 0.4809187, 2.235416, 0, 1, 0.3568628, 1,
-0.2545844, 0.4488533, 1.161263, 0, 1, 0.3647059, 1,
-0.2544669, -1.268137, -3.536836, 0, 1, 0.3686275, 1,
-0.2451119, 2.088481, 0.8471649, 0, 1, 0.3764706, 1,
-0.2450998, 0.9504588, 0.7951074, 0, 1, 0.3803922, 1,
-0.2447218, -1.726591, -2.139017, 0, 1, 0.3882353, 1,
-0.2433168, 2.312143, -0.1785383, 0, 1, 0.3921569, 1,
-0.2401506, -0.4225389, -4.077724, 0, 1, 0.4, 1,
-0.239276, 1.497054, -1.226071, 0, 1, 0.4078431, 1,
-0.2383548, 0.6225057, 0.3124307, 0, 1, 0.4117647, 1,
-0.237809, -0.2184633, -3.678648, 0, 1, 0.4196078, 1,
-0.2369592, 1.15122, 0.9710006, 0, 1, 0.4235294, 1,
-0.2349275, 0.8057503, 0.02552022, 0, 1, 0.4313726, 1,
-0.2259936, -0.4850833, -1.900683, 0, 1, 0.4352941, 1,
-0.2209064, -1.199947, -4.033961, 0, 1, 0.4431373, 1,
-0.2119887, 1.294494, 0.4840373, 0, 1, 0.4470588, 1,
-0.2076612, -1.469975, -2.552532, 0, 1, 0.454902, 1,
-0.2047308, -0.6336035, -4.064402, 0, 1, 0.4588235, 1,
-0.2033352, -0.2578814, -3.069858, 0, 1, 0.4666667, 1,
-0.2000514, 1.00962, -0.1915261, 0, 1, 0.4705882, 1,
-0.1947068, -0.5591725, -4.573325, 0, 1, 0.4784314, 1,
-0.1944166, 1.720843, 0.213727, 0, 1, 0.4823529, 1,
-0.1940402, -1.656848, -2.540691, 0, 1, 0.4901961, 1,
-0.1932456, -0.03929642, -2.070931, 0, 1, 0.4941176, 1,
-0.1895365, -0.3904079, -1.371455, 0, 1, 0.5019608, 1,
-0.1867815, -1.33926, -3.42275, 0, 1, 0.509804, 1,
-0.1856339, -0.6117408, -2.921502, 0, 1, 0.5137255, 1,
-0.1828004, 0.4283451, -1.575166, 0, 1, 0.5215687, 1,
-0.1822117, -0.7584956, -2.768022, 0, 1, 0.5254902, 1,
-0.1820043, -0.2791576, -3.686801, 0, 1, 0.5333334, 1,
-0.1797168, 1.293848, -0.1019977, 0, 1, 0.5372549, 1,
-0.1792363, 0.04447861, -1.450771, 0, 1, 0.5450981, 1,
-0.1789555, 0.1058637, 0.6118363, 0, 1, 0.5490196, 1,
-0.1717051, 1.757242, -1.079831, 0, 1, 0.5568628, 1,
-0.1705873, 0.3672128, 0.06803705, 0, 1, 0.5607843, 1,
-0.1696985, 0.4769637, -1.538676, 0, 1, 0.5686275, 1,
-0.1669398, -2.510628, -3.199432, 0, 1, 0.572549, 1,
-0.1667205, 0.1839382, -2.366569, 0, 1, 0.5803922, 1,
-0.1666707, 1.080419, 1.83354, 0, 1, 0.5843138, 1,
-0.1641983, -0.8704026, -3.262982, 0, 1, 0.5921569, 1,
-0.1639455, -0.2067363, -1.848677, 0, 1, 0.5960785, 1,
-0.1623002, 1.279917, -1.544086, 0, 1, 0.6039216, 1,
-0.1622903, -1.581317, -0.4229554, 0, 1, 0.6117647, 1,
-0.1608303, -0.8805863, -2.979545, 0, 1, 0.6156863, 1,
-0.1518725, -0.4680866, -3.608953, 0, 1, 0.6235294, 1,
-0.151179, -1.406227, -1.920201, 0, 1, 0.627451, 1,
-0.1502433, 0.3564445, 0.8770725, 0, 1, 0.6352941, 1,
-0.1490468, 1.253043, -0.274949, 0, 1, 0.6392157, 1,
-0.1445722, 0.6559765, -0.9987467, 0, 1, 0.6470588, 1,
-0.1407205, 1.469533, -0.4513801, 0, 1, 0.6509804, 1,
-0.1405494, -0.08068828, -1.815638, 0, 1, 0.6588235, 1,
-0.1404957, 1.8855, -0.2580725, 0, 1, 0.6627451, 1,
-0.1401687, 1.565027, -0.1759265, 0, 1, 0.6705883, 1,
-0.1374156, 1.453709, -0.02470968, 0, 1, 0.6745098, 1,
-0.1361379, 0.8872485, -1.320455, 0, 1, 0.682353, 1,
-0.1316383, -0.4390947, -3.997114, 0, 1, 0.6862745, 1,
-0.118177, 0.05242831, -1.49766, 0, 1, 0.6941177, 1,
-0.1163351, -0.5161977, -3.401631, 0, 1, 0.7019608, 1,
-0.1161294, -0.9765689, -2.463087, 0, 1, 0.7058824, 1,
-0.1124591, -1.034592, -4.286659, 0, 1, 0.7137255, 1,
-0.1093674, -0.9256336, -2.761541, 0, 1, 0.7176471, 1,
-0.1064988, 0.176789, -1.322988, 0, 1, 0.7254902, 1,
-0.1054413, -0.9110327, -2.495268, 0, 1, 0.7294118, 1,
-0.1048356, 0.5100776, 0.1125339, 0, 1, 0.7372549, 1,
-0.1042852, 0.9283514, -0.7045607, 0, 1, 0.7411765, 1,
-0.1040838, 0.2831019, -1.242793, 0, 1, 0.7490196, 1,
-0.1022929, 1.418201, 1.7232, 0, 1, 0.7529412, 1,
-0.09800512, -1.106987, -2.904001, 0, 1, 0.7607843, 1,
-0.09671135, -0.8386174, -3.133483, 0, 1, 0.7647059, 1,
-0.09492198, -2.749956, -2.972786, 0, 1, 0.772549, 1,
-0.09362091, 0.06598198, -0.9963591, 0, 1, 0.7764706, 1,
-0.08897155, -1.997576, -1.340822, 0, 1, 0.7843137, 1,
-0.08888055, -0.8988047, -2.030482, 0, 1, 0.7882353, 1,
-0.08200178, 0.5014569, 0.8961655, 0, 1, 0.7960784, 1,
-0.0814393, -2.454237, -3.021578, 0, 1, 0.8039216, 1,
-0.07923889, 1.550718, 0.8264912, 0, 1, 0.8078431, 1,
-0.07615932, -1.409901, -3.91111, 0, 1, 0.8156863, 1,
-0.06371701, 0.1679532, -2.254687, 0, 1, 0.8196079, 1,
-0.06168659, 0.0004767531, 0.2626478, 0, 1, 0.827451, 1,
-0.05983797, -0.8366636, -2.824695, 0, 1, 0.8313726, 1,
-0.05980686, 0.127498, -1.816355, 0, 1, 0.8392157, 1,
-0.05755466, 1.170113, -1.993138, 0, 1, 0.8431373, 1,
-0.05255096, -0.4716507, -1.907533, 0, 1, 0.8509804, 1,
-0.05029225, -0.2490734, -1.546434, 0, 1, 0.854902, 1,
-0.04858245, 0.3296476, 1.339821, 0, 1, 0.8627451, 1,
-0.04624455, 0.4688028, 0.5088426, 0, 1, 0.8666667, 1,
-0.03790512, -1.385397, -4.451729, 0, 1, 0.8745098, 1,
-0.03025946, 0.1934151, -1.395806, 0, 1, 0.8784314, 1,
-0.02141351, -0.4504541, -2.101239, 0, 1, 0.8862745, 1,
-0.02110428, 0.5892314, -0.3718286, 0, 1, 0.8901961, 1,
-0.01940197, -0.02715526, -1.459939, 0, 1, 0.8980392, 1,
-0.01883722, -0.1928249, -3.039963, 0, 1, 0.9058824, 1,
-0.01815983, 1.126137, -0.8376964, 0, 1, 0.9098039, 1,
-0.01763211, 1.005662, 0.04147835, 0, 1, 0.9176471, 1,
-0.01026478, 0.5862275, 0.1688143, 0, 1, 0.9215686, 1,
-0.009615084, -0.4795921, -4.261475, 0, 1, 0.9294118, 1,
-0.008399372, 0.0129578, 0.460843, 0, 1, 0.9333333, 1,
-0.004394162, -1.230013, -4.477057, 0, 1, 0.9411765, 1,
0.004443299, -0.8470594, 4.165498, 0, 1, 0.945098, 1,
0.006140358, -1.762038, 2.921349, 0, 1, 0.9529412, 1,
0.01206495, 0.5287126, -0.1765732, 0, 1, 0.9568627, 1,
0.01537119, -0.6115683, 2.679631, 0, 1, 0.9647059, 1,
0.02210192, 1.255813, 0.5311369, 0, 1, 0.9686275, 1,
0.02395669, -1.3585, 1.932513, 0, 1, 0.9764706, 1,
0.02401789, 0.8747773, -0.04983037, 0, 1, 0.9803922, 1,
0.02490429, 0.3759198, -0.7365035, 0, 1, 0.9882353, 1,
0.02552143, 1.669424, -0.7340589, 0, 1, 0.9921569, 1,
0.03047686, -0.1221646, 1.698779, 0, 1, 1, 1,
0.03861206, 0.3838008, -0.1112085, 0, 0.9921569, 1, 1,
0.04077739, -0.05521797, 0.2580786, 0, 0.9882353, 1, 1,
0.04160093, -0.08630581, 2.218727, 0, 0.9803922, 1, 1,
0.042454, 1.205244, 0.3986904, 0, 0.9764706, 1, 1,
0.0531784, 0.9511408, -0.1264312, 0, 0.9686275, 1, 1,
0.0551892, 0.1948521, -0.1116263, 0, 0.9647059, 1, 1,
0.05739599, -0.3846528, 2.68548, 0, 0.9568627, 1, 1,
0.05752861, -0.4728285, 4.407498, 0, 0.9529412, 1, 1,
0.05846028, -0.6329526, 2.452962, 0, 0.945098, 1, 1,
0.06109511, 0.3649275, 1.567578, 0, 0.9411765, 1, 1,
0.0633148, -2.057578, 4.19429, 0, 0.9333333, 1, 1,
0.06664925, -0.9833267, 4.179812, 0, 0.9294118, 1, 1,
0.0690239, -0.2242212, 2.4089, 0, 0.9215686, 1, 1,
0.07159861, -0.9718971, 3.247387, 0, 0.9176471, 1, 1,
0.0751657, 0.948415, 0.4691813, 0, 0.9098039, 1, 1,
0.07741249, 1.018801, -0.6564498, 0, 0.9058824, 1, 1,
0.08017503, -0.2895863, 1.874857, 0, 0.8980392, 1, 1,
0.08020579, -0.3090841, 1.610215, 0, 0.8901961, 1, 1,
0.08327666, -0.574586, 2.23402, 0, 0.8862745, 1, 1,
0.0920343, -1.687677, 3.00121, 0, 0.8784314, 1, 1,
0.09428823, -0.9649659, 3.323135, 0, 0.8745098, 1, 1,
0.09479291, -0.2804092, 3.539927, 0, 0.8666667, 1, 1,
0.09616067, 1.629244, 1.095764, 0, 0.8627451, 1, 1,
0.09653085, -0.2814617, 1.48327, 0, 0.854902, 1, 1,
0.1011406, 1.710827, -0.8159334, 0, 0.8509804, 1, 1,
0.1029036, -0.4109185, 3.777278, 0, 0.8431373, 1, 1,
0.1077309, -0.4838023, 2.850894, 0, 0.8392157, 1, 1,
0.109404, -0.9240035, 2.355429, 0, 0.8313726, 1, 1,
0.1106393, -0.007306417, 1.425749, 0, 0.827451, 1, 1,
0.1114796, -1.941039, 2.879214, 0, 0.8196079, 1, 1,
0.1125521, -1.172218, 3.32796, 0, 0.8156863, 1, 1,
0.1162572, 1.762493, 0.5943782, 0, 0.8078431, 1, 1,
0.1178848, 1.797481, -0.5012127, 0, 0.8039216, 1, 1,
0.1213239, -1.108582, 2.512029, 0, 0.7960784, 1, 1,
0.1271977, 0.817389, -0.06786639, 0, 0.7882353, 1, 1,
0.1274437, -1.119937, 3.786717, 0, 0.7843137, 1, 1,
0.1294722, 2.009491, 0.3686611, 0, 0.7764706, 1, 1,
0.1307863, 0.8831306, 1.047399, 0, 0.772549, 1, 1,
0.1331088, 1.001028, -0.6171813, 0, 0.7647059, 1, 1,
0.1348543, 0.977483, -0.5665539, 0, 0.7607843, 1, 1,
0.1373018, -1.90896, 2.7702, 0, 0.7529412, 1, 1,
0.1493521, -1.203974, 4.239591, 0, 0.7490196, 1, 1,
0.1504336, -1.333508, 2.315478, 0, 0.7411765, 1, 1,
0.150539, -0.8532838, 4.036486, 0, 0.7372549, 1, 1,
0.1621285, 0.1731762, 1.193406, 0, 0.7294118, 1, 1,
0.1657052, 0.0954655, 0.5534993, 0, 0.7254902, 1, 1,
0.1658268, 0.4561656, -0.2853241, 0, 0.7176471, 1, 1,
0.1661296, -1.042715, 2.295077, 0, 0.7137255, 1, 1,
0.1663046, 0.7324299, 0.6853229, 0, 0.7058824, 1, 1,
0.1702214, -1.673702, 3.412471, 0, 0.6980392, 1, 1,
0.1725272, 1.177276, 0.4758449, 0, 0.6941177, 1, 1,
0.1766315, 0.9409387, 0.08628172, 0, 0.6862745, 1, 1,
0.17681, 0.9878701, -0.6273733, 0, 0.682353, 1, 1,
0.1792784, 1.610029, -0.7925639, 0, 0.6745098, 1, 1,
0.1859182, -0.1100472, 2.522859, 0, 0.6705883, 1, 1,
0.1865644, -0.2372358, 0.9893826, 0, 0.6627451, 1, 1,
0.1871571, -1.06753, 2.621341, 0, 0.6588235, 1, 1,
0.1896459, 0.8988757, 0.852707, 0, 0.6509804, 1, 1,
0.1925401, 0.5221152, 0.1483364, 0, 0.6470588, 1, 1,
0.1952918, -0.4320984, 1.164901, 0, 0.6392157, 1, 1,
0.1958807, -0.4713097, 3.137081, 0, 0.6352941, 1, 1,
0.1964073, -0.2186239, 2.053863, 0, 0.627451, 1, 1,
0.1998176, -0.6407729, 2.901733, 0, 0.6235294, 1, 1,
0.2007185, 0.7917453, -0.7809553, 0, 0.6156863, 1, 1,
0.2012231, -0.3070796, 1.16124, 0, 0.6117647, 1, 1,
0.2021447, -0.508164, 3.320391, 0, 0.6039216, 1, 1,
0.2041831, -0.1510568, 3.876664, 0, 0.5960785, 1, 1,
0.2088859, -0.1503269, 2.098713, 0, 0.5921569, 1, 1,
0.2094263, 0.1488441, 1.679117, 0, 0.5843138, 1, 1,
0.2110309, 0.4438691, 0.2388087, 0, 0.5803922, 1, 1,
0.2156995, -0.9769899, 2.462722, 0, 0.572549, 1, 1,
0.217664, -2.543652, 3.380261, 0, 0.5686275, 1, 1,
0.2200932, -2.753172, 2.503961, 0, 0.5607843, 1, 1,
0.2212343, 0.7852144, 1.34857, 0, 0.5568628, 1, 1,
0.2212833, -0.844945, 1.376696, 0, 0.5490196, 1, 1,
0.2239387, -0.04664337, 0.2721315, 0, 0.5450981, 1, 1,
0.2262002, -1.49028, 3.119061, 0, 0.5372549, 1, 1,
0.2303386, 1.323844, -0.07517413, 0, 0.5333334, 1, 1,
0.2319246, -1.011009, 2.028559, 0, 0.5254902, 1, 1,
0.2369692, 1.337601, -0.2015204, 0, 0.5215687, 1, 1,
0.2392865, 2.117331, -0.1344422, 0, 0.5137255, 1, 1,
0.242413, -0.911139, 3.340174, 0, 0.509804, 1, 1,
0.2425392, 1.014438, -1.139865, 0, 0.5019608, 1, 1,
0.2493645, -1.226936, 3.2868, 0, 0.4941176, 1, 1,
0.2519774, 1.010738, 1.324261, 0, 0.4901961, 1, 1,
0.2530775, 1.326509, 0.07017069, 0, 0.4823529, 1, 1,
0.2596245, 0.008624539, 1.967434, 0, 0.4784314, 1, 1,
0.2627681, 0.9343849, -0.1026126, 0, 0.4705882, 1, 1,
0.2649115, 1.196189, -2.016076, 0, 0.4666667, 1, 1,
0.2666273, 1.318522, 1.910726, 0, 0.4588235, 1, 1,
0.2679156, -3.41884, 1.519427, 0, 0.454902, 1, 1,
0.2712698, 0.2375634, -1.301935, 0, 0.4470588, 1, 1,
0.2714804, -0.6496947, 1.269221, 0, 0.4431373, 1, 1,
0.2722511, -0.9917855, 5.555776, 0, 0.4352941, 1, 1,
0.2725863, 0.448885, -0.07407188, 0, 0.4313726, 1, 1,
0.2779101, -0.1714529, 1.91086, 0, 0.4235294, 1, 1,
0.2788387, 0.5630519, 0.01235281, 0, 0.4196078, 1, 1,
0.2788997, -0.1804949, 1.906495, 0, 0.4117647, 1, 1,
0.2811381, 1.389175, 0.4981396, 0, 0.4078431, 1, 1,
0.2863913, 0.8965683, -0.3246074, 0, 0.4, 1, 1,
0.2878326, 1.104853, 0.8742698, 0, 0.3921569, 1, 1,
0.2878717, -0.06785188, 1.25123, 0, 0.3882353, 1, 1,
0.2922267, 0.6327895, 1.201554, 0, 0.3803922, 1, 1,
0.2967586, -0.1279655, 1.370794, 0, 0.3764706, 1, 1,
0.3001999, 0.2146851, 0.7614364, 0, 0.3686275, 1, 1,
0.3010439, 0.505753, 0.2755823, 0, 0.3647059, 1, 1,
0.3058893, 1.714637, 0.793005, 0, 0.3568628, 1, 1,
0.3125974, -0.7718024, 2.054178, 0, 0.3529412, 1, 1,
0.3142318, -0.7005957, 2.464537, 0, 0.345098, 1, 1,
0.3154402, -1.040038, 2.6589, 0, 0.3411765, 1, 1,
0.3159253, 0.9568293, -1.292279, 0, 0.3333333, 1, 1,
0.3174631, -0.01372819, 3.236845, 0, 0.3294118, 1, 1,
0.3186553, -0.6472332, 1.094265, 0, 0.3215686, 1, 1,
0.3192371, -0.1269223, 1.578226, 0, 0.3176471, 1, 1,
0.3213345, -0.1948197, 4.134403, 0, 0.3098039, 1, 1,
0.3232412, -0.2838133, 0.9583339, 0, 0.3058824, 1, 1,
0.3256233, 0.4997401, 1.430793, 0, 0.2980392, 1, 1,
0.3288536, -0.1097675, 2.89114, 0, 0.2901961, 1, 1,
0.3294703, 0.9234354, -0.4733041, 0, 0.2862745, 1, 1,
0.3316853, 0.134656, 1.872111, 0, 0.2784314, 1, 1,
0.3428772, -0.6117613, 3.550885, 0, 0.2745098, 1, 1,
0.3478925, -0.195224, -0.0277554, 0, 0.2666667, 1, 1,
0.3491231, -1.408373, 3.250243, 0, 0.2627451, 1, 1,
0.3502728, -0.1797431, 0.09439774, 0, 0.254902, 1, 1,
0.3511085, 1.699591, 0.3382403, 0, 0.2509804, 1, 1,
0.3517677, 0.06562027, 2.124358, 0, 0.2431373, 1, 1,
0.3534346, 1.99481, 0.9977819, 0, 0.2392157, 1, 1,
0.3588035, -0.06681877, 0.9745665, 0, 0.2313726, 1, 1,
0.3617255, -3.142961, 3.243911, 0, 0.227451, 1, 1,
0.3663351, -1.455603, 3.092671, 0, 0.2196078, 1, 1,
0.3682981, -0.4926733, 1.775472, 0, 0.2156863, 1, 1,
0.3685207, -1.512015, 1.960869, 0, 0.2078431, 1, 1,
0.3696312, 0.2063558, 1.221352, 0, 0.2039216, 1, 1,
0.3716319, 1.29855, -0.8300924, 0, 0.1960784, 1, 1,
0.372118, 1.768558, -0.4956707, 0, 0.1882353, 1, 1,
0.3760773, 0.08866478, 1.418363, 0, 0.1843137, 1, 1,
0.3841317, 1.477813, 1.705699, 0, 0.1764706, 1, 1,
0.3842962, 0.133683, 1.238606, 0, 0.172549, 1, 1,
0.3917201, -0.6307647, 2.392476, 0, 0.1647059, 1, 1,
0.3964622, 1.547156, -0.6342559, 0, 0.1607843, 1, 1,
0.3989809, 0.6904477, 0.4531159, 0, 0.1529412, 1, 1,
0.4010349, 0.277359, 0.9105478, 0, 0.1490196, 1, 1,
0.4016886, -1.18663, 2.40063, 0, 0.1411765, 1, 1,
0.4033834, -0.8530661, 3.348067, 0, 0.1372549, 1, 1,
0.4048356, 0.04201933, 1.373868, 0, 0.1294118, 1, 1,
0.408032, 0.8935147, -1.091549, 0, 0.1254902, 1, 1,
0.4125334, -0.882352, 2.068321, 0, 0.1176471, 1, 1,
0.4162644, -0.2785486, 2.012412, 0, 0.1137255, 1, 1,
0.4240117, 0.0312031, 2.054937, 0, 0.1058824, 1, 1,
0.4260498, 0.9808558, -0.1645334, 0, 0.09803922, 1, 1,
0.4307817, -3.220065, 4.54051, 0, 0.09411765, 1, 1,
0.4336419, 0.6047556, 0.5829313, 0, 0.08627451, 1, 1,
0.4343022, 0.6276449, 0.1655682, 0, 0.08235294, 1, 1,
0.4353905, -1.338903, 2.31077, 0, 0.07450981, 1, 1,
0.4421948, 0.7263807, 0.3712433, 0, 0.07058824, 1, 1,
0.4424242, 0.303892, 0.3729527, 0, 0.0627451, 1, 1,
0.4427243, 1.717662, -0.5186613, 0, 0.05882353, 1, 1,
0.4460708, 1.678326, 0.06541125, 0, 0.05098039, 1, 1,
0.4497089, -0.1333042, 2.253028, 0, 0.04705882, 1, 1,
0.4504747, -0.833356, 3.686896, 0, 0.03921569, 1, 1,
0.455608, 0.3298127, 0.9469604, 0, 0.03529412, 1, 1,
0.4563538, -0.3262567, 0.8667709, 0, 0.02745098, 1, 1,
0.4575834, -0.01910291, 1.428436, 0, 0.02352941, 1, 1,
0.4577726, -1.263248, 2.347042, 0, 0.01568628, 1, 1,
0.4594972, -0.08425153, 2.097469, 0, 0.01176471, 1, 1,
0.4613607, -0.2098076, -0.1115547, 0, 0.003921569, 1, 1,
0.4656847, -0.4719603, 2.981721, 0.003921569, 0, 1, 1,
0.466847, 0.02839191, 4.515052, 0.007843138, 0, 1, 1,
0.4720462, -0.1814128, 0.1351791, 0.01568628, 0, 1, 1,
0.4739827, 0.4612422, 1.12527, 0.01960784, 0, 1, 1,
0.4821827, 0.75142, 0.3243622, 0.02745098, 0, 1, 1,
0.4841214, 0.8252707, 1.648034, 0.03137255, 0, 1, 1,
0.4846828, 1.223855, 1.779947, 0.03921569, 0, 1, 1,
0.486805, 3.567965, 0.9944715, 0.04313726, 0, 1, 1,
0.4876588, 1.466791, 1.257297, 0.05098039, 0, 1, 1,
0.4889599, -0.3790213, 3.504989, 0.05490196, 0, 1, 1,
0.4979452, -0.1143014, 3.373603, 0.0627451, 0, 1, 1,
0.5002779, 0.2434435, 1.450014, 0.06666667, 0, 1, 1,
0.5022179, -0.3007801, 2.800029, 0.07450981, 0, 1, 1,
0.5033634, -0.9116459, 2.793981, 0.07843138, 0, 1, 1,
0.5057719, 1.342555, -0.2072167, 0.08627451, 0, 1, 1,
0.5073168, 2.115714, -1.149666, 0.09019608, 0, 1, 1,
0.5091689, 0.8753597, -1.276297, 0.09803922, 0, 1, 1,
0.5162752, -0.02014736, 2.274265, 0.1058824, 0, 1, 1,
0.5199992, -0.3450944, 1.681049, 0.1098039, 0, 1, 1,
0.5205976, 0.9342321, 1.562678, 0.1176471, 0, 1, 1,
0.5286916, -0.5935388, 2.427344, 0.1215686, 0, 1, 1,
0.5341202, -0.8923703, 4.33606, 0.1294118, 0, 1, 1,
0.5395226, 2.739958, 0.6326759, 0.1333333, 0, 1, 1,
0.5412276, -1.029086, 2.646631, 0.1411765, 0, 1, 1,
0.543781, -0.6168919, 2.678984, 0.145098, 0, 1, 1,
0.5487729, -1.058186, 1.870063, 0.1529412, 0, 1, 1,
0.549897, -0.2768436, 1.867404, 0.1568628, 0, 1, 1,
0.5508811, 1.698713, -0.5591559, 0.1647059, 0, 1, 1,
0.5528569, 1.61242, -0.2507355, 0.1686275, 0, 1, 1,
0.5538695, 0.7777758, -0.4260263, 0.1764706, 0, 1, 1,
0.5730076, 0.4949957, 0.4556976, 0.1803922, 0, 1, 1,
0.5740631, -1.525964, 4.271426, 0.1882353, 0, 1, 1,
0.5743438, -0.6639506, 1.496731, 0.1921569, 0, 1, 1,
0.5750402, 0.1693212, 1.425748, 0.2, 0, 1, 1,
0.5755053, 0.7912278, 1.337773, 0.2078431, 0, 1, 1,
0.5856317, 0.5246061, 0.8528959, 0.2117647, 0, 1, 1,
0.5865598, -0.3172641, 2.118008, 0.2196078, 0, 1, 1,
0.5895917, -0.5791168, 1.742846, 0.2235294, 0, 1, 1,
0.6012411, -1.527134, 2.919063, 0.2313726, 0, 1, 1,
0.6013095, 0.0540784, 1.460681, 0.2352941, 0, 1, 1,
0.6059226, -0.8621881, 2.562907, 0.2431373, 0, 1, 1,
0.610997, 0.9900443, 0.8037912, 0.2470588, 0, 1, 1,
0.6193201, -0.6900266, 1.230179, 0.254902, 0, 1, 1,
0.6209332, 0.02127459, 0.9871436, 0.2588235, 0, 1, 1,
0.6266552, 1.072284, 1.005565, 0.2666667, 0, 1, 1,
0.6380275, -0.585407, 2.123592, 0.2705882, 0, 1, 1,
0.6385914, -0.1846992, 0.8386176, 0.2784314, 0, 1, 1,
0.640945, 1.580563, 0.2507437, 0.282353, 0, 1, 1,
0.64147, -1.059652, 2.28697, 0.2901961, 0, 1, 1,
0.6543725, -1.734054, 1.829798, 0.2941177, 0, 1, 1,
0.6678289, -1.308069, -0.5818645, 0.3019608, 0, 1, 1,
0.6728945, 1.632196, 1.529549, 0.3098039, 0, 1, 1,
0.6751416, -0.5091622, 2.04384, 0.3137255, 0, 1, 1,
0.6770725, -1.126433, 1.238052, 0.3215686, 0, 1, 1,
0.6771296, -0.0217494, 2.491296, 0.3254902, 0, 1, 1,
0.6848196, 1.398797, 0.654208, 0.3333333, 0, 1, 1,
0.6848346, -1.401611, 2.972155, 0.3372549, 0, 1, 1,
0.6867301, 1.25412, 1.977751, 0.345098, 0, 1, 1,
0.6921492, 0.1786743, 1.789622, 0.3490196, 0, 1, 1,
0.6951555, 0.467622, 1.408977, 0.3568628, 0, 1, 1,
0.7065288, -1.014893, 1.833481, 0.3607843, 0, 1, 1,
0.7131873, 0.3466804, 1.622795, 0.3686275, 0, 1, 1,
0.7133118, -0.344337, 0.6869217, 0.372549, 0, 1, 1,
0.7134438, 1.993882, -0.1730227, 0.3803922, 0, 1, 1,
0.7162914, 0.5702573, 0.6701131, 0.3843137, 0, 1, 1,
0.7194703, 0.375332, 2.426179, 0.3921569, 0, 1, 1,
0.7210386, 0.7853064, 0.5122465, 0.3960784, 0, 1, 1,
0.7216328, 0.54571, 0.8575225, 0.4039216, 0, 1, 1,
0.7232192, -2.282749, 3.92836, 0.4117647, 0, 1, 1,
0.7234005, -1.466777, 1.776009, 0.4156863, 0, 1, 1,
0.7248961, 1.73209, 1.84268, 0.4235294, 0, 1, 1,
0.7259879, -1.140397, 4.529787, 0.427451, 0, 1, 1,
0.7265657, 0.1259603, 1.589795, 0.4352941, 0, 1, 1,
0.7298508, 1.325799, 0.732308, 0.4392157, 0, 1, 1,
0.7351889, -0.108725, 1.770708, 0.4470588, 0, 1, 1,
0.7353858, -0.5474228, 3.639413, 0.4509804, 0, 1, 1,
0.7387155, 0.07268357, 1.964055, 0.4588235, 0, 1, 1,
0.7389297, -0.4860576, 2.129156, 0.4627451, 0, 1, 1,
0.7430369, 1.7538, 0.6060296, 0.4705882, 0, 1, 1,
0.743246, 0.3729362, 2.642029, 0.4745098, 0, 1, 1,
0.7438189, -0.8694432, 0.8824836, 0.4823529, 0, 1, 1,
0.7460814, -0.3291231, 3.498467, 0.4862745, 0, 1, 1,
0.7469791, -0.4488058, 1.574236, 0.4941176, 0, 1, 1,
0.7490859, -0.01301578, 2.190476, 0.5019608, 0, 1, 1,
0.7509129, -0.3983358, 3.785943, 0.5058824, 0, 1, 1,
0.7599646, 1.038185, 0.9812816, 0.5137255, 0, 1, 1,
0.7604311, -0.1775292, 1.686682, 0.5176471, 0, 1, 1,
0.7605041, -0.2454982, 1.732378, 0.5254902, 0, 1, 1,
0.7627168, -0.07926919, -0.1498897, 0.5294118, 0, 1, 1,
0.763307, 1.068893, -0.7991897, 0.5372549, 0, 1, 1,
0.7657471, -0.925534, 2.709394, 0.5411765, 0, 1, 1,
0.7676873, -1.769668, 2.504521, 0.5490196, 0, 1, 1,
0.7710943, 1.386048, 0.7589591, 0.5529412, 0, 1, 1,
0.7776502, 0.6674097, 0.5681681, 0.5607843, 0, 1, 1,
0.7820376, -0.01702983, 2.360363, 0.5647059, 0, 1, 1,
0.78697, 2.383824, -0.7334067, 0.572549, 0, 1, 1,
0.7875165, 0.7668096, 0.6807923, 0.5764706, 0, 1, 1,
0.7892728, -1.862106, 1.519901, 0.5843138, 0, 1, 1,
0.7960576, -0.8250963, 0.8658972, 0.5882353, 0, 1, 1,
0.7963732, 0.5043499, 0.09127313, 0.5960785, 0, 1, 1,
0.7968338, -1.289259, 2.988895, 0.6039216, 0, 1, 1,
0.7971497, 0.3438108, -0.3815265, 0.6078432, 0, 1, 1,
0.7997943, 1.635898, 1.331882, 0.6156863, 0, 1, 1,
0.8060891, 0.6681547, 1.725948, 0.6196079, 0, 1, 1,
0.8074257, -0.07968543, 2.286231, 0.627451, 0, 1, 1,
0.8116447, 0.7370033, 1.378124, 0.6313726, 0, 1, 1,
0.8119735, 0.2731506, -0.6986126, 0.6392157, 0, 1, 1,
0.8129301, 1.583343, 0.8511614, 0.6431373, 0, 1, 1,
0.8143466, 0.7149659, 0.9997829, 0.6509804, 0, 1, 1,
0.8170946, 0.3874489, 1.588905, 0.654902, 0, 1, 1,
0.8199605, 0.3740617, 0.8332218, 0.6627451, 0, 1, 1,
0.8210065, 0.6533657, 1.187054, 0.6666667, 0, 1, 1,
0.824623, -1.790066, 4.090683, 0.6745098, 0, 1, 1,
0.8282574, -0.5971733, 1.268064, 0.6784314, 0, 1, 1,
0.8287826, -0.4601284, 2.644536, 0.6862745, 0, 1, 1,
0.8302188, 0.4897961, 1.096032, 0.6901961, 0, 1, 1,
0.8336728, -0.2026652, 0.384163, 0.6980392, 0, 1, 1,
0.835643, -0.6104624, 2.890718, 0.7058824, 0, 1, 1,
0.8428267, -0.1401115, 0.7823667, 0.7098039, 0, 1, 1,
0.8469065, -0.9901797, 1.865059, 0.7176471, 0, 1, 1,
0.8472934, 1.0107, -0.0885505, 0.7215686, 0, 1, 1,
0.8480771, 0.7793497, -0.7888448, 0.7294118, 0, 1, 1,
0.8505299, -0.6632769, 1.505178, 0.7333333, 0, 1, 1,
0.8550315, 1.289848, -0.5241689, 0.7411765, 0, 1, 1,
0.8585723, 1.672542, 1.916165, 0.7450981, 0, 1, 1,
0.8617016, -1.621473, 1.035228, 0.7529412, 0, 1, 1,
0.8661133, -0.9154648, 2.341654, 0.7568628, 0, 1, 1,
0.8680095, 0.08736952, 3.190117, 0.7647059, 0, 1, 1,
0.8704787, 0.1914035, 2.371528, 0.7686275, 0, 1, 1,
0.8791246, -1.234285, 4.577939, 0.7764706, 0, 1, 1,
0.8871775, 1.238582, -0.6351779, 0.7803922, 0, 1, 1,
0.888414, 0.2181987, 1.529356, 0.7882353, 0, 1, 1,
0.8915856, -0.3315349, 2.617203, 0.7921569, 0, 1, 1,
0.8923568, 0.6656871, 0.6687764, 0.8, 0, 1, 1,
0.8944323, 0.6722445, -0.6543641, 0.8078431, 0, 1, 1,
0.8953674, 1.114999, 1.091229, 0.8117647, 0, 1, 1,
0.8976299, 0.02513529, 1.800926, 0.8196079, 0, 1, 1,
0.8999018, -0.7449986, 1.043794, 0.8235294, 0, 1, 1,
0.9051592, 0.08912086, 1.009342, 0.8313726, 0, 1, 1,
0.9062533, -0.4760846, 0.6775545, 0.8352941, 0, 1, 1,
0.9168909, 1.576653, 0.02778362, 0.8431373, 0, 1, 1,
0.9240277, 0.7051416, 1.760746, 0.8470588, 0, 1, 1,
0.9256195, 0.3619294, 2.022694, 0.854902, 0, 1, 1,
0.9315392, 0.8373982, 0.5315282, 0.8588235, 0, 1, 1,
0.9320605, -1.362189, 3.682737, 0.8666667, 0, 1, 1,
0.9378346, 0.08587871, 2.275399, 0.8705882, 0, 1, 1,
0.9476808, 2.028353, 0.3242658, 0.8784314, 0, 1, 1,
0.9494142, -0.9182103, 2.227461, 0.8823529, 0, 1, 1,
0.9550244, -0.5098915, 2.919683, 0.8901961, 0, 1, 1,
0.9604028, -0.8285538, 1.962701, 0.8941177, 0, 1, 1,
0.9636427, -0.4019685, 1.854086, 0.9019608, 0, 1, 1,
0.9640869, 0.9443985, -1.043542, 0.9098039, 0, 1, 1,
0.9652907, -0.3987946, 1.801155, 0.9137255, 0, 1, 1,
0.9709228, 2.397136, 0.4376568, 0.9215686, 0, 1, 1,
0.9761439, 2.221395, -0.208124, 0.9254902, 0, 1, 1,
0.9796776, -0.1094588, 3.013872, 0.9333333, 0, 1, 1,
0.9830062, 0.5858708, 0.5406388, 0.9372549, 0, 1, 1,
0.9863311, 0.08042216, 1.177713, 0.945098, 0, 1, 1,
0.9874065, 1.152451, 0.1768663, 0.9490196, 0, 1, 1,
0.9882219, 0.5457033, 1.461636, 0.9568627, 0, 1, 1,
0.9890273, 0.02684328, -0.1798093, 0.9607843, 0, 1, 1,
0.9908148, -0.1648291, -0.7461054, 0.9686275, 0, 1, 1,
0.9936993, -0.3957299, 0.9638634, 0.972549, 0, 1, 1,
0.9938053, 0.05419888, 0.8042952, 0.9803922, 0, 1, 1,
0.9966895, -0.9225771, 0.67123, 0.9843137, 0, 1, 1,
0.9976709, 0.5464426, 1.919945, 0.9921569, 0, 1, 1,
1.000661, -0.2773995, 0.9773579, 0.9960784, 0, 1, 1,
1.002975, 1.520127, 0.3100613, 1, 0, 0.9960784, 1,
1.003346, -0.6498245, 2.158186, 1, 0, 0.9882353, 1,
1.021918, -0.06552775, 0.8131285, 1, 0, 0.9843137, 1,
1.022429, 0.5427502, 1.485204, 1, 0, 0.9764706, 1,
1.031866, 1.661154, 0.360836, 1, 0, 0.972549, 1,
1.035758, -0.1583146, 1.051498, 1, 0, 0.9647059, 1,
1.039508, -0.6039481, 2.913403, 1, 0, 0.9607843, 1,
1.04189, 0.0887363, 1.679954, 1, 0, 0.9529412, 1,
1.05405, -0.830344, 2.427604, 1, 0, 0.9490196, 1,
1.059088, 0.605396, 1.762371, 1, 0, 0.9411765, 1,
1.059147, 0.04341584, 0.727011, 1, 0, 0.9372549, 1,
1.062397, -0.5453871, 2.228578, 1, 0, 0.9294118, 1,
1.063975, 1.166042, 0.3066358, 1, 0, 0.9254902, 1,
1.076747, -1.370673, 2.683002, 1, 0, 0.9176471, 1,
1.084654, 1.498399, -0.7350051, 1, 0, 0.9137255, 1,
1.08495, 0.399066, 0.9511459, 1, 0, 0.9058824, 1,
1.097279, -1.954326, 1.29368, 1, 0, 0.9019608, 1,
1.097615, 1.73256, -0.7548956, 1, 0, 0.8941177, 1,
1.098442, 0.3997634, 0.863667, 1, 0, 0.8862745, 1,
1.100672, 0.7266538, -0.4380191, 1, 0, 0.8823529, 1,
1.102935, 0.3888927, -0.1998971, 1, 0, 0.8745098, 1,
1.104563, -0.8931043, 3.121209, 1, 0, 0.8705882, 1,
1.106362, -0.5997416, 0.9545147, 1, 0, 0.8627451, 1,
1.110942, 0.9311082, 0.2541986, 1, 0, 0.8588235, 1,
1.112078, -0.2740461, 1.233173, 1, 0, 0.8509804, 1,
1.112782, 0.9148654, 0.4042718, 1, 0, 0.8470588, 1,
1.118308, 0.245351, 1.438809, 1, 0, 0.8392157, 1,
1.128536, -1.184952, 2.134186, 1, 0, 0.8352941, 1,
1.131263, 0.5224503, -0.7101997, 1, 0, 0.827451, 1,
1.134621, -0.5549372, 0.2274368, 1, 0, 0.8235294, 1,
1.134634, -0.8237078, 0.6960212, 1, 0, 0.8156863, 1,
1.141473, -0.7678052, 2.6753, 1, 0, 0.8117647, 1,
1.143313, -0.287823, 2.920112, 1, 0, 0.8039216, 1,
1.144196, -0.4920927, 1.054382, 1, 0, 0.7960784, 1,
1.146374, -1.9963, 3.516487, 1, 0, 0.7921569, 1,
1.147555, -0.2267818, 0.8487399, 1, 0, 0.7843137, 1,
1.147808, -0.2437033, 1.470872, 1, 0, 0.7803922, 1,
1.152076, -0.5251093, 1.548514, 1, 0, 0.772549, 1,
1.152979, 0.06708757, 1.670951, 1, 0, 0.7686275, 1,
1.17053, -0.8897358, 1.536681, 1, 0, 0.7607843, 1,
1.178317, -0.3721449, 1.752396, 1, 0, 0.7568628, 1,
1.182598, -1.035148, 3.452099, 1, 0, 0.7490196, 1,
1.188425, -0.3846732, 3.684398, 1, 0, 0.7450981, 1,
1.190366, 0.01068547, 1.735952, 1, 0, 0.7372549, 1,
1.191784, 0.7998115, 1.933457, 1, 0, 0.7333333, 1,
1.195951, -0.4777742, 0.2348271, 1, 0, 0.7254902, 1,
1.207704, -0.3344916, 1.877679, 1, 0, 0.7215686, 1,
1.236218, 0.7606648, -0.04237157, 1, 0, 0.7137255, 1,
1.249671, 0.5091445, 2.188172, 1, 0, 0.7098039, 1,
1.254656, -0.3579078, 2.745331, 1, 0, 0.7019608, 1,
1.259441, 0.219952, 0.9280744, 1, 0, 0.6941177, 1,
1.260651, -1.386447, 2.421072, 1, 0, 0.6901961, 1,
1.276671, -0.3958572, 2.03394, 1, 0, 0.682353, 1,
1.277914, -0.7091087, 3.231146, 1, 0, 0.6784314, 1,
1.280468, -0.5034267, 1.032213, 1, 0, 0.6705883, 1,
1.281667, -1.728039, 3.967581, 1, 0, 0.6666667, 1,
1.282812, 0.724792, 0.8580987, 1, 0, 0.6588235, 1,
1.296242, -0.1712559, 3.141257, 1, 0, 0.654902, 1,
1.298519, -1.149162, 2.531625, 1, 0, 0.6470588, 1,
1.312584, 1.167105, -0.6085786, 1, 0, 0.6431373, 1,
1.316522, -0.3408934, 2.473779, 1, 0, 0.6352941, 1,
1.328106, 1.291999, 2.485624, 1, 0, 0.6313726, 1,
1.337687, -0.7296397, 1.302612, 1, 0, 0.6235294, 1,
1.341662, -2.154943, 2.806548, 1, 0, 0.6196079, 1,
1.346605, 0.1860738, 0.572902, 1, 0, 0.6117647, 1,
1.348549, -0.06979316, 2.481472, 1, 0, 0.6078432, 1,
1.350915, 1.148228, 0.4995017, 1, 0, 0.6, 1,
1.35093, 0.626661, 1.436564, 1, 0, 0.5921569, 1,
1.353169, 0.7585515, -0.0442017, 1, 0, 0.5882353, 1,
1.35411, -1.69812, 2.875593, 1, 0, 0.5803922, 1,
1.355596, -1.353084, 0.3974269, 1, 0, 0.5764706, 1,
1.356615, 0.05217106, 2.006713, 1, 0, 0.5686275, 1,
1.361321, 0.2461981, 0.2188484, 1, 0, 0.5647059, 1,
1.362669, -0.8297449, 2.410888, 1, 0, 0.5568628, 1,
1.373189, -0.9195106, 1.952651, 1, 0, 0.5529412, 1,
1.375058, -2.285749, 2.287988, 1, 0, 0.5450981, 1,
1.38942, -0.7202023, 2.384232, 1, 0, 0.5411765, 1,
1.392144, 0.8685058, 0.95303, 1, 0, 0.5333334, 1,
1.392705, 1.533413, 1.165439, 1, 0, 0.5294118, 1,
1.401208, 1.442949, -0.7262681, 1, 0, 0.5215687, 1,
1.403533, 0.9194616, 0.5444372, 1, 0, 0.5176471, 1,
1.42017, -0.1364825, 3.06858, 1, 0, 0.509804, 1,
1.42181, -1.579016, 1.007487, 1, 0, 0.5058824, 1,
1.421822, 0.7766892, 0.6447803, 1, 0, 0.4980392, 1,
1.426537, -1.680662, 2.690717, 1, 0, 0.4901961, 1,
1.427057, -0.1009195, 1.585179, 1, 0, 0.4862745, 1,
1.441246, -0.34135, 0.5580719, 1, 0, 0.4784314, 1,
1.444666, -1.396199, 2.654262, 1, 0, 0.4745098, 1,
1.466387, -1.07019, 0.4976874, 1, 0, 0.4666667, 1,
1.494267, -0.164823, 1.947743, 1, 0, 0.4627451, 1,
1.500373, 0.7456014, 1.139126, 1, 0, 0.454902, 1,
1.508828, 0.1724667, 2.013331, 1, 0, 0.4509804, 1,
1.512694, 0.7678789, 1.800113, 1, 0, 0.4431373, 1,
1.516696, 0.3647986, 0.5344704, 1, 0, 0.4392157, 1,
1.516908, 0.8975469, 0.01644039, 1, 0, 0.4313726, 1,
1.526542, -1.042612, 0.06288559, 1, 0, 0.427451, 1,
1.543995, 2.447408, 1.29616, 1, 0, 0.4196078, 1,
1.562558, 0.2126726, 0.3385667, 1, 0, 0.4156863, 1,
1.562899, -0.2038163, 0.8962798, 1, 0, 0.4078431, 1,
1.569508, -1.206208, 3.289766, 1, 0, 0.4039216, 1,
1.582876, 1.193602, 1.373578, 1, 0, 0.3960784, 1,
1.59184, -1.48356, 2.717332, 1, 0, 0.3882353, 1,
1.592429, 1.201457, 0.9922459, 1, 0, 0.3843137, 1,
1.601591, 0.711455, 1.234658, 1, 0, 0.3764706, 1,
1.632993, 1.618204, 1.465564, 1, 0, 0.372549, 1,
1.640409, 0.6491958, 0.9034108, 1, 0, 0.3647059, 1,
1.647214, -0.9223976, 3.878518, 1, 0, 0.3607843, 1,
1.648256, 1.233302, 1.255146, 1, 0, 0.3529412, 1,
1.655343, 0.5038502, 0.02802097, 1, 0, 0.3490196, 1,
1.657709, 0.7631697, 1.653229, 1, 0, 0.3411765, 1,
1.660555, -0.7402726, -0.75055, 1, 0, 0.3372549, 1,
1.679567, 0.3770578, 1.392336, 1, 0, 0.3294118, 1,
1.688843, -0.0990662, 2.327949, 1, 0, 0.3254902, 1,
1.690869, 0.1060351, 0.7078361, 1, 0, 0.3176471, 1,
1.709813, -0.3839058, 2.003726, 1, 0, 0.3137255, 1,
1.719132, -0.5040223, 3.505213, 1, 0, 0.3058824, 1,
1.721489, 1.441013, 1.146007, 1, 0, 0.2980392, 1,
1.731752, 0.5334771, 2.14051, 1, 0, 0.2941177, 1,
1.737173, 0.7381641, 4.226799, 1, 0, 0.2862745, 1,
1.739219, -1.334152, 1.986351, 1, 0, 0.282353, 1,
1.741199, 1.848289, 2.346078, 1, 0, 0.2745098, 1,
1.74972, -1.48023, 1.412828, 1, 0, 0.2705882, 1,
1.75949, -0.0453932, 0.3745592, 1, 0, 0.2627451, 1,
1.776734, -0.5463412, 1.671294, 1, 0, 0.2588235, 1,
1.803424, 0.6231638, 1.278454, 1, 0, 0.2509804, 1,
1.803642, -0.3969522, 3.951863, 1, 0, 0.2470588, 1,
1.808889, -1.484129, 2.315947, 1, 0, 0.2392157, 1,
1.813102, 0.2738918, 1.959491, 1, 0, 0.2352941, 1,
1.813662, 0.4261728, 2.394506, 1, 0, 0.227451, 1,
1.821517, -0.485989, 2.734442, 1, 0, 0.2235294, 1,
1.822924, 0.6094716, 2.037153, 1, 0, 0.2156863, 1,
1.826629, -2.358167, 2.039008, 1, 0, 0.2117647, 1,
1.833325, -1.613935, 4.282988, 1, 0, 0.2039216, 1,
1.836208, 0.2088569, 2.468196, 1, 0, 0.1960784, 1,
1.836251, -0.369154, 0.800927, 1, 0, 0.1921569, 1,
1.85739, -1.446678, 3.489907, 1, 0, 0.1843137, 1,
1.871931, -0.5964947, 1.787248, 1, 0, 0.1803922, 1,
1.88027, 0.2751775, 2.812941, 1, 0, 0.172549, 1,
1.893439, -0.3086333, 1.533127, 1, 0, 0.1686275, 1,
1.902865, 1.086758, 0.6121968, 1, 0, 0.1607843, 1,
1.906377, 0.7514901, 2.213834, 1, 0, 0.1568628, 1,
1.907958, 0.4111841, 0.7468479, 1, 0, 0.1490196, 1,
1.930843, -0.9744682, 2.003247, 1, 0, 0.145098, 1,
1.95507, 0.1165477, 2.64667, 1, 0, 0.1372549, 1,
2.000062, -0.4931245, 3.512475, 1, 0, 0.1333333, 1,
2.0081, -1.563701, 0.9451109, 1, 0, 0.1254902, 1,
2.02335, -0.2157249, 1.819891, 1, 0, 0.1215686, 1,
2.072503, 0.0368324, 1.329276, 1, 0, 0.1137255, 1,
2.085022, 0.1407021, 3.40705, 1, 0, 0.1098039, 1,
2.085463, 0.9955716, 1.535452, 1, 0, 0.1019608, 1,
2.104032, 1.061182, 0.5974483, 1, 0, 0.09411765, 1,
2.109547, 0.6589465, 2.866953, 1, 0, 0.09019608, 1,
2.136658, -1.403581, 1.759261, 1, 0, 0.08235294, 1,
2.137388, -0.7575743, 1.522267, 1, 0, 0.07843138, 1,
2.20863, -0.2463043, 1.489586, 1, 0, 0.07058824, 1,
2.262935, -1.226891, 1.615946, 1, 0, 0.06666667, 1,
2.279759, 1.677254, -0.1718026, 1, 0, 0.05882353, 1,
2.365304, 1.04029, -0.3542325, 1, 0, 0.05490196, 1,
2.447954, 0.541505, 0.2088572, 1, 0, 0.04705882, 1,
2.482111, -2.054307, 0.727656, 1, 0, 0.04313726, 1,
2.491812, 0.2986712, 2.295505, 1, 0, 0.03529412, 1,
2.520591, 0.02310036, 1.224307, 1, 0, 0.03137255, 1,
2.711383, 0.1533707, 1.915555, 1, 0, 0.02352941, 1,
2.743303, -0.615248, 1.243922, 1, 0, 0.01960784, 1,
2.749451, -0.08576266, 1.220633, 1, 0, 0.01176471, 1,
3.116776, 1.448855, 2.272994, 1, 0, 0.007843138, 1
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
-0.003355742, -4.603104, -6.290207, 0, -0.5, 0.5, 0.5,
-0.003355742, -4.603104, -6.290207, 1, -0.5, 0.5, 0.5,
-0.003355742, -4.603104, -6.290207, 1, 1.5, 0.5, 0.5,
-0.003355742, -4.603104, -6.290207, 0, 1.5, 0.5, 0.5
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
-4.181212, 0.07456219, -6.290207, 0, -0.5, 0.5, 0.5,
-4.181212, 0.07456219, -6.290207, 1, -0.5, 0.5, 0.5,
-4.181212, 0.07456219, -6.290207, 1, 1.5, 0.5, 0.5,
-4.181212, 0.07456219, -6.290207, 0, 1.5, 0.5, 0.5
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
-4.181212, -4.603104, 0.4912255, 0, -0.5, 0.5, 0.5,
-4.181212, -4.603104, 0.4912255, 1, -0.5, 0.5, 0.5,
-4.181212, -4.603104, 0.4912255, 1, 1.5, 0.5, 0.5,
-4.181212, -4.603104, 0.4912255, 0, 1.5, 0.5, 0.5
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
-3, -3.523642, -4.725261,
3, -3.523642, -4.725261,
-3, -3.523642, -4.725261,
-3, -3.703552, -4.986085,
-2, -3.523642, -4.725261,
-2, -3.703552, -4.986085,
-1, -3.523642, -4.725261,
-1, -3.703552, -4.986085,
0, -3.523642, -4.725261,
0, -3.703552, -4.986085,
1, -3.523642, -4.725261,
1, -3.703552, -4.986085,
2, -3.523642, -4.725261,
2, -3.703552, -4.986085,
3, -3.523642, -4.725261,
3, -3.703552, -4.986085
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
-3, -4.063373, -5.507734, 0, -0.5, 0.5, 0.5,
-3, -4.063373, -5.507734, 1, -0.5, 0.5, 0.5,
-3, -4.063373, -5.507734, 1, 1.5, 0.5, 0.5,
-3, -4.063373, -5.507734, 0, 1.5, 0.5, 0.5,
-2, -4.063373, -5.507734, 0, -0.5, 0.5, 0.5,
-2, -4.063373, -5.507734, 1, -0.5, 0.5, 0.5,
-2, -4.063373, -5.507734, 1, 1.5, 0.5, 0.5,
-2, -4.063373, -5.507734, 0, 1.5, 0.5, 0.5,
-1, -4.063373, -5.507734, 0, -0.5, 0.5, 0.5,
-1, -4.063373, -5.507734, 1, -0.5, 0.5, 0.5,
-1, -4.063373, -5.507734, 1, 1.5, 0.5, 0.5,
-1, -4.063373, -5.507734, 0, 1.5, 0.5, 0.5,
0, -4.063373, -5.507734, 0, -0.5, 0.5, 0.5,
0, -4.063373, -5.507734, 1, -0.5, 0.5, 0.5,
0, -4.063373, -5.507734, 1, 1.5, 0.5, 0.5,
0, -4.063373, -5.507734, 0, 1.5, 0.5, 0.5,
1, -4.063373, -5.507734, 0, -0.5, 0.5, 0.5,
1, -4.063373, -5.507734, 1, -0.5, 0.5, 0.5,
1, -4.063373, -5.507734, 1, 1.5, 0.5, 0.5,
1, -4.063373, -5.507734, 0, 1.5, 0.5, 0.5,
2, -4.063373, -5.507734, 0, -0.5, 0.5, 0.5,
2, -4.063373, -5.507734, 1, -0.5, 0.5, 0.5,
2, -4.063373, -5.507734, 1, 1.5, 0.5, 0.5,
2, -4.063373, -5.507734, 0, 1.5, 0.5, 0.5,
3, -4.063373, -5.507734, 0, -0.5, 0.5, 0.5,
3, -4.063373, -5.507734, 1, -0.5, 0.5, 0.5,
3, -4.063373, -5.507734, 1, 1.5, 0.5, 0.5,
3, -4.063373, -5.507734, 0, 1.5, 0.5, 0.5
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
-3.217091, -3, -4.725261,
-3.217091, 3, -4.725261,
-3.217091, -3, -4.725261,
-3.377778, -3, -4.986085,
-3.217091, -2, -4.725261,
-3.377778, -2, -4.986085,
-3.217091, -1, -4.725261,
-3.377778, -1, -4.986085,
-3.217091, 0, -4.725261,
-3.377778, 0, -4.986085,
-3.217091, 1, -4.725261,
-3.377778, 1, -4.986085,
-3.217091, 2, -4.725261,
-3.377778, 2, -4.986085,
-3.217091, 3, -4.725261,
-3.377778, 3, -4.986085
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
-3.699152, -3, -5.507734, 0, -0.5, 0.5, 0.5,
-3.699152, -3, -5.507734, 1, -0.5, 0.5, 0.5,
-3.699152, -3, -5.507734, 1, 1.5, 0.5, 0.5,
-3.699152, -3, -5.507734, 0, 1.5, 0.5, 0.5,
-3.699152, -2, -5.507734, 0, -0.5, 0.5, 0.5,
-3.699152, -2, -5.507734, 1, -0.5, 0.5, 0.5,
-3.699152, -2, -5.507734, 1, 1.5, 0.5, 0.5,
-3.699152, -2, -5.507734, 0, 1.5, 0.5, 0.5,
-3.699152, -1, -5.507734, 0, -0.5, 0.5, 0.5,
-3.699152, -1, -5.507734, 1, -0.5, 0.5, 0.5,
-3.699152, -1, -5.507734, 1, 1.5, 0.5, 0.5,
-3.699152, -1, -5.507734, 0, 1.5, 0.5, 0.5,
-3.699152, 0, -5.507734, 0, -0.5, 0.5, 0.5,
-3.699152, 0, -5.507734, 1, -0.5, 0.5, 0.5,
-3.699152, 0, -5.507734, 1, 1.5, 0.5, 0.5,
-3.699152, 0, -5.507734, 0, 1.5, 0.5, 0.5,
-3.699152, 1, -5.507734, 0, -0.5, 0.5, 0.5,
-3.699152, 1, -5.507734, 1, -0.5, 0.5, 0.5,
-3.699152, 1, -5.507734, 1, 1.5, 0.5, 0.5,
-3.699152, 1, -5.507734, 0, 1.5, 0.5, 0.5,
-3.699152, 2, -5.507734, 0, -0.5, 0.5, 0.5,
-3.699152, 2, -5.507734, 1, -0.5, 0.5, 0.5,
-3.699152, 2, -5.507734, 1, 1.5, 0.5, 0.5,
-3.699152, 2, -5.507734, 0, 1.5, 0.5, 0.5,
-3.699152, 3, -5.507734, 0, -0.5, 0.5, 0.5,
-3.699152, 3, -5.507734, 1, -0.5, 0.5, 0.5,
-3.699152, 3, -5.507734, 1, 1.5, 0.5, 0.5,
-3.699152, 3, -5.507734, 0, 1.5, 0.5, 0.5
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
-3.217091, -3.523642, -4,
-3.217091, -3.523642, 4,
-3.217091, -3.523642, -4,
-3.377778, -3.703552, -4,
-3.217091, -3.523642, -2,
-3.377778, -3.703552, -2,
-3.217091, -3.523642, 0,
-3.377778, -3.703552, 0,
-3.217091, -3.523642, 2,
-3.377778, -3.703552, 2,
-3.217091, -3.523642, 4,
-3.377778, -3.703552, 4
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
-3.699152, -4.063373, -4, 0, -0.5, 0.5, 0.5,
-3.699152, -4.063373, -4, 1, -0.5, 0.5, 0.5,
-3.699152, -4.063373, -4, 1, 1.5, 0.5, 0.5,
-3.699152, -4.063373, -4, 0, 1.5, 0.5, 0.5,
-3.699152, -4.063373, -2, 0, -0.5, 0.5, 0.5,
-3.699152, -4.063373, -2, 1, -0.5, 0.5, 0.5,
-3.699152, -4.063373, -2, 1, 1.5, 0.5, 0.5,
-3.699152, -4.063373, -2, 0, 1.5, 0.5, 0.5,
-3.699152, -4.063373, 0, 0, -0.5, 0.5, 0.5,
-3.699152, -4.063373, 0, 1, -0.5, 0.5, 0.5,
-3.699152, -4.063373, 0, 1, 1.5, 0.5, 0.5,
-3.699152, -4.063373, 0, 0, 1.5, 0.5, 0.5,
-3.699152, -4.063373, 2, 0, -0.5, 0.5, 0.5,
-3.699152, -4.063373, 2, 1, -0.5, 0.5, 0.5,
-3.699152, -4.063373, 2, 1, 1.5, 0.5, 0.5,
-3.699152, -4.063373, 2, 0, 1.5, 0.5, 0.5,
-3.699152, -4.063373, 4, 0, -0.5, 0.5, 0.5,
-3.699152, -4.063373, 4, 1, -0.5, 0.5, 0.5,
-3.699152, -4.063373, 4, 1, 1.5, 0.5, 0.5,
-3.699152, -4.063373, 4, 0, 1.5, 0.5, 0.5
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
-3.217091, -3.523642, -4.725261,
-3.217091, 3.672767, -4.725261,
-3.217091, -3.523642, 5.707712,
-3.217091, 3.672767, 5.707712,
-3.217091, -3.523642, -4.725261,
-3.217091, -3.523642, 5.707712,
-3.217091, 3.672767, -4.725261,
-3.217091, 3.672767, 5.707712,
-3.217091, -3.523642, -4.725261,
3.21038, -3.523642, -4.725261,
-3.217091, -3.523642, 5.707712,
3.21038, -3.523642, 5.707712,
-3.217091, 3.672767, -4.725261,
3.21038, 3.672767, -4.725261,
-3.217091, 3.672767, 5.707712,
3.21038, 3.672767, 5.707712,
3.21038, -3.523642, -4.725261,
3.21038, 3.672767, -4.725261,
3.21038, -3.523642, 5.707712,
3.21038, 3.672767, 5.707712,
3.21038, -3.523642, -4.725261,
3.21038, -3.523642, 5.707712,
3.21038, 3.672767, -4.725261,
3.21038, 3.672767, 5.707712
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
var radius = 7.588306;
var distance = 33.76123;
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
mvMatrix.translate( 0.003355742, -0.07456219, -0.4912255 );
mvMatrix.scale( 1.276494, 1.1401, 0.7864129 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.76123);
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
Thiram<-read.table("Thiram.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Thiram$V2
```

```
## Error in eval(expr, envir, enclos): object 'Thiram' not found
```

```r
y<-Thiram$V3
```

```
## Error in eval(expr, envir, enclos): object 'Thiram' not found
```

```r
z<-Thiram$V4
```

```
## Error in eval(expr, envir, enclos): object 'Thiram' not found
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
-3.123487, 0.927562, -2.193237, 0, 0, 1, 1, 1,
-2.883045, 1.212097, -1.37054, 1, 0, 0, 1, 1,
-2.797056, -0.3585745, -1.622736, 1, 0, 0, 1, 1,
-2.768602, -0.9398435, -3.597244, 1, 0, 0, 1, 1,
-2.692151, 1.220921, -0.2394188, 1, 0, 0, 1, 1,
-2.631055, 0.8084728, -3.03356, 1, 0, 0, 1, 1,
-2.623117, -1.09844, 0.3073882, 0, 0, 0, 1, 1,
-2.545126, 1.718088, -1.595402, 0, 0, 0, 1, 1,
-2.385693, 0.555394, -0.6004261, 0, 0, 0, 1, 1,
-2.333062, -0.0309376, -2.227608, 0, 0, 0, 1, 1,
-2.263451, -0.9402127, -1.919567, 0, 0, 0, 1, 1,
-2.249382, -0.3920484, -2.453218, 0, 0, 0, 1, 1,
-2.244686, 1.264293, -0.3605254, 0, 0, 0, 1, 1,
-2.242562, -0.5306333, -1.660553, 1, 1, 1, 1, 1,
-2.239754, 0.3070819, -2.833983, 1, 1, 1, 1, 1,
-2.217921, 0.3370465, -1.913627, 1, 1, 1, 1, 1,
-2.210848, 0.2943123, -0.482965, 1, 1, 1, 1, 1,
-2.207059, 0.1894047, -0.8524577, 1, 1, 1, 1, 1,
-2.193752, 1.830829, -0.09238249, 1, 1, 1, 1, 1,
-2.168001, 0.1567393, -3.20528, 1, 1, 1, 1, 1,
-2.074178, -0.3053252, -2.303308, 1, 1, 1, 1, 1,
-2.063209, -0.4280528, -2.042165, 1, 1, 1, 1, 1,
-2.060233, 2.375746, -0.5288497, 1, 1, 1, 1, 1,
-2.051545, 0.1839363, -0.777483, 1, 1, 1, 1, 1,
-2.023629, -0.2973987, -0.2921133, 1, 1, 1, 1, 1,
-2.009217, -1.433463, -2.426679, 1, 1, 1, 1, 1,
-1.982889, 0.4484972, -2.339109, 1, 1, 1, 1, 1,
-1.979233, 0.5614673, -2.042132, 1, 1, 1, 1, 1,
-1.967018, 0.9476906, -0.2126699, 0, 0, 1, 1, 1,
-1.963253, -0.03336429, -0.9636713, 1, 0, 0, 1, 1,
-1.961478, 0.513695, -0.9156938, 1, 0, 0, 1, 1,
-1.950086, 1.229399, -0.578088, 1, 0, 0, 1, 1,
-1.903039, -0.1730709, -1.190853, 1, 0, 0, 1, 1,
-1.895387, -0.4561224, -1.235934, 1, 0, 0, 1, 1,
-1.888818, -1.184661, -2.381393, 0, 0, 0, 1, 1,
-1.885954, 0.5541954, -1.299587, 0, 0, 0, 1, 1,
-1.882149, 0.9558054, -2.108877, 0, 0, 0, 1, 1,
-1.881673, -0.6940455, -1.893888, 0, 0, 0, 1, 1,
-1.874949, 0.779761, -2.312659, 0, 0, 0, 1, 1,
-1.868024, 1.460049, 0.2457947, 0, 0, 0, 1, 1,
-1.863518, 1.144681, -1.995055, 0, 0, 0, 1, 1,
-1.842289, -0.6818241, -2.848401, 1, 1, 1, 1, 1,
-1.837403, -0.5105876, -2.488301, 1, 1, 1, 1, 1,
-1.820303, 0.1575098, -0.8976383, 1, 1, 1, 1, 1,
-1.809736, -0.2090861, -1.491201, 1, 1, 1, 1, 1,
-1.808353, -1.268168, -3.64793, 1, 1, 1, 1, 1,
-1.782507, -1.518053, -2.126315, 1, 1, 1, 1, 1,
-1.772973, 0.7380931, -1.25082, 1, 1, 1, 1, 1,
-1.767293, -0.4279289, -0.609382, 1, 1, 1, 1, 1,
-1.74583, -0.1318662, -0.7252038, 1, 1, 1, 1, 1,
-1.735346, -1.902578, -2.182853, 1, 1, 1, 1, 1,
-1.712512, -1.185631, -3.128057, 1, 1, 1, 1, 1,
-1.697037, -0.1438617, -1.537222, 1, 1, 1, 1, 1,
-1.690911, 0.4666736, -0.5992821, 1, 1, 1, 1, 1,
-1.679177, 0.8958785, -1.594259, 1, 1, 1, 1, 1,
-1.675089, 0.7172123, 0.4461201, 1, 1, 1, 1, 1,
-1.665344, 0.6160517, -2.608734, 0, 0, 1, 1, 1,
-1.664581, -0.752162, -2.606764, 1, 0, 0, 1, 1,
-1.647289, 0.2116332, 0.2240929, 1, 0, 0, 1, 1,
-1.641706, -1.347185, -2.027637, 1, 0, 0, 1, 1,
-1.627884, 2.042752, -1.052969, 1, 0, 0, 1, 1,
-1.62439, 0.07467813, -0.7231193, 1, 0, 0, 1, 1,
-1.621989, -0.9697071, -3.647549, 0, 0, 0, 1, 1,
-1.621399, 1.827255, 0.3382702, 0, 0, 0, 1, 1,
-1.597854, 0.5436465, -0.7558016, 0, 0, 0, 1, 1,
-1.579236, 1.966348, -0.751941, 0, 0, 0, 1, 1,
-1.572721, 0.7613114, -1.912802, 0, 0, 0, 1, 1,
-1.56747, 0.7842851, -1.252874, 0, 0, 0, 1, 1,
-1.553738, 2.328588, -1.009132, 0, 0, 0, 1, 1,
-1.542113, 0.6207061, -0.2298504, 1, 1, 1, 1, 1,
-1.525767, -0.7669092, -2.338648, 1, 1, 1, 1, 1,
-1.524981, 0.7309222, -0.4968041, 1, 1, 1, 1, 1,
-1.48439, 1.160872, 1.533732, 1, 1, 1, 1, 1,
-1.473338, -1.42234, -1.656665, 1, 1, 1, 1, 1,
-1.471108, -3.136435, -2.401091, 1, 1, 1, 1, 1,
-1.469957, -1.342324, -0.1302552, 1, 1, 1, 1, 1,
-1.454761, 1.702391, -2.986132, 1, 1, 1, 1, 1,
-1.44721, -0.9759995, -2.447103, 1, 1, 1, 1, 1,
-1.446367, 0.01444047, -1.306102, 1, 1, 1, 1, 1,
-1.443615, 0.5429909, -0.5604824, 1, 1, 1, 1, 1,
-1.427772, -0.2281621, -0.989567, 1, 1, 1, 1, 1,
-1.426772, -0.3733189, -3.238634, 1, 1, 1, 1, 1,
-1.425759, -1.306555, -1.446693, 1, 1, 1, 1, 1,
-1.412218, 0.3856699, -0.7692003, 1, 1, 1, 1, 1,
-1.406023, -0.2795338, -2.00618, 0, 0, 1, 1, 1,
-1.406019, -1.336817, -3.213195, 1, 0, 0, 1, 1,
-1.405169, -1.241076, -3.887163, 1, 0, 0, 1, 1,
-1.399627, 0.05519168, -1.329338, 1, 0, 0, 1, 1,
-1.39193, -0.9352981, -0.05215392, 1, 0, 0, 1, 1,
-1.389486, 1.169908, -0.7041225, 1, 0, 0, 1, 1,
-1.370792, -0.04265752, -2.854026, 0, 0, 0, 1, 1,
-1.359281, 0.2158434, -1.304388, 0, 0, 0, 1, 1,
-1.35803, -0.1476532, -1.354489, 0, 0, 0, 1, 1,
-1.353286, 0.3903801, -2.646344, 0, 0, 0, 1, 1,
-1.351121, -0.1401384, -1.278288, 0, 0, 0, 1, 1,
-1.341307, -0.9091516, -0.8389494, 0, 0, 0, 1, 1,
-1.340448, 2.277879, -0.4930218, 0, 0, 0, 1, 1,
-1.330054, 1.252917, -0.3476651, 1, 1, 1, 1, 1,
-1.323626, -0.3413327, -1.990859, 1, 1, 1, 1, 1,
-1.315483, -0.3226155, 0.01301628, 1, 1, 1, 1, 1,
-1.314189, 1.629722, -0.6833015, 1, 1, 1, 1, 1,
-1.303719, -0.8310494, -3.344409, 1, 1, 1, 1, 1,
-1.298508, 0.7439275, -1.213569, 1, 1, 1, 1, 1,
-1.291533, -1.092935, -0.8608592, 1, 1, 1, 1, 1,
-1.284154, 1.249758, -1.092443, 1, 1, 1, 1, 1,
-1.27865, 0.343211, -2.274841, 1, 1, 1, 1, 1,
-1.276343, -1.040985, -2.534898, 1, 1, 1, 1, 1,
-1.269039, 2.910805, 1.528235, 1, 1, 1, 1, 1,
-1.263125, -0.1973215, -2.900854, 1, 1, 1, 1, 1,
-1.261971, -1.109632, -2.390678, 1, 1, 1, 1, 1,
-1.261655, 0.5229435, -0.875379, 1, 1, 1, 1, 1,
-1.258302, 0.2819402, -1.543042, 1, 1, 1, 1, 1,
-1.25611, -0.6619944, -3.036744, 0, 0, 1, 1, 1,
-1.255955, 0.4065316, -1.145265, 1, 0, 0, 1, 1,
-1.25538, 0.6817492, -1.002474, 1, 0, 0, 1, 1,
-1.255197, 1.517397, -0.8447165, 1, 0, 0, 1, 1,
-1.252702, -0.299817, -2.515858, 1, 0, 0, 1, 1,
-1.24499, 2.071512, 1.676455, 1, 0, 0, 1, 1,
-1.242452, 0.5574011, -1.366186, 0, 0, 0, 1, 1,
-1.240182, -1.5676, -2.215577, 0, 0, 0, 1, 1,
-1.239733, -0.02025812, -1.550679, 0, 0, 0, 1, 1,
-1.22597, -0.4571832, -3.488538, 0, 0, 0, 1, 1,
-1.225668, -0.2873331, -2.1799, 0, 0, 0, 1, 1,
-1.222837, -1.206291, -0.6375557, 0, 0, 0, 1, 1,
-1.222224, 0.3629963, -0.08967203, 0, 0, 0, 1, 1,
-1.21315, 0.1975004, -0.9341807, 1, 1, 1, 1, 1,
-1.208332, -0.1754213, -3.212716, 1, 1, 1, 1, 1,
-1.206842, 2.201073, -1.816689, 1, 1, 1, 1, 1,
-1.206765, 0.8926136, -0.2347671, 1, 1, 1, 1, 1,
-1.201267, 0.5164005, -0.4839121, 1, 1, 1, 1, 1,
-1.199213, -1.358266, -2.289459, 1, 1, 1, 1, 1,
-1.19003, -0.0677097, -2.222287, 1, 1, 1, 1, 1,
-1.179441, 0.6363949, -3.121423, 1, 1, 1, 1, 1,
-1.178227, -0.4193043, 0.481828, 1, 1, 1, 1, 1,
-1.165337, -1.871249, -1.119893, 1, 1, 1, 1, 1,
-1.16028, -0.506834, -1.30834, 1, 1, 1, 1, 1,
-1.157606, 0.6445618, -2.336543, 1, 1, 1, 1, 1,
-1.156682, 0.5144317, -0.6755493, 1, 1, 1, 1, 1,
-1.151625, -0.2972095, -3.696989, 1, 1, 1, 1, 1,
-1.148642, -0.5929567, -0.2033278, 1, 1, 1, 1, 1,
-1.127135, 0.02327945, -1.693624, 0, 0, 1, 1, 1,
-1.126766, 0.7816756, -0.5194249, 1, 0, 0, 1, 1,
-1.126592, -2.17246, -2.677572, 1, 0, 0, 1, 1,
-1.111638, -0.03020306, -1.460155, 1, 0, 0, 1, 1,
-1.109148, -1.618137, -3.971185, 1, 0, 0, 1, 1,
-1.102236, -0.1039128, -2.028961, 1, 0, 0, 1, 1,
-1.102123, -0.4662821, -1.875509, 0, 0, 0, 1, 1,
-1.075627, -0.9221501, -2.94169, 0, 0, 0, 1, 1,
-1.07554, -0.4338472, -1.51625, 0, 0, 0, 1, 1,
-1.065563, 0.1597877, -2.292796, 0, 0, 0, 1, 1,
-1.060141, 1.363101, -1.298421, 0, 0, 0, 1, 1,
-1.055962, 0.8963329, -3.075078, 0, 0, 0, 1, 1,
-1.051495, 2.630106, -0.1848806, 0, 0, 0, 1, 1,
-1.03946, -1.635756, -2.703379, 1, 1, 1, 1, 1,
-1.038605, -2.565002, -2.601691, 1, 1, 1, 1, 1,
-1.03384, -1.057492, -3.289748, 1, 1, 1, 1, 1,
-1.029097, -0.3299913, -1.072173, 1, 1, 1, 1, 1,
-1.027405, 0.6426128, 1.531775, 1, 1, 1, 1, 1,
-1.025331, 1.433228, 0.3657308, 1, 1, 1, 1, 1,
-1.01955, 0.3712304, 0.9454665, 1, 1, 1, 1, 1,
-1.018445, -0.06707088, -0.8829313, 1, 1, 1, 1, 1,
-1.018281, -0.4160405, -2.760683, 1, 1, 1, 1, 1,
-1.014781, -0.1771632, -2.720539, 1, 1, 1, 1, 1,
-1.014488, 1.677646, -1.543228, 1, 1, 1, 1, 1,
-1.01129, -1.378098, -1.660025, 1, 1, 1, 1, 1,
-1.010768, -0.008479497, -2.942399, 1, 1, 1, 1, 1,
-0.9945571, 0.07173234, 0.7393795, 1, 1, 1, 1, 1,
-0.9939454, 0.28839, -1.277957, 1, 1, 1, 1, 1,
-0.9858832, 0.4751822, -1.710782, 0, 0, 1, 1, 1,
-0.9856142, 0.7849202, -1.840342, 1, 0, 0, 1, 1,
-0.9817144, 0.6624469, -0.5967962, 1, 0, 0, 1, 1,
-0.9813975, -0.7975251, -1.699474, 1, 0, 0, 1, 1,
-0.9775655, -0.1709077, -1.401236, 1, 0, 0, 1, 1,
-0.9725038, -1.492067, -2.619525, 1, 0, 0, 1, 1,
-0.969797, -0.7703229, -2.804088, 0, 0, 0, 1, 1,
-0.967259, -2.36872, -2.46536, 0, 0, 0, 1, 1,
-0.9565525, 0.6312727, -2.611633, 0, 0, 0, 1, 1,
-0.9490765, 0.5016555, -1.496243, 0, 0, 0, 1, 1,
-0.9453763, 0.4619002, -0.6802664, 0, 0, 0, 1, 1,
-0.935987, -1.001114, -2.252524, 0, 0, 0, 1, 1,
-0.9291573, -0.9101465, -3.316046, 0, 0, 0, 1, 1,
-0.9231427, 0.5520324, -0.1803241, 1, 1, 1, 1, 1,
-0.9223981, 0.1753091, -1.266021, 1, 1, 1, 1, 1,
-0.9214008, -0.07107633, -2.583448, 1, 1, 1, 1, 1,
-0.9206209, 0.1900347, -0.9104624, 1, 1, 1, 1, 1,
-0.907429, -0.2637417, -2.860056, 1, 1, 1, 1, 1,
-0.9065524, -0.5362105, -1.926215, 1, 1, 1, 1, 1,
-0.8922898, 0.3786452, -2.515826, 1, 1, 1, 1, 1,
-0.8918741, -0.7888249, -2.244264, 1, 1, 1, 1, 1,
-0.8899987, -2.019292, -3.011665, 1, 1, 1, 1, 1,
-0.8850384, -0.04143861, -2.328682, 1, 1, 1, 1, 1,
-0.8847662, 0.6070527, -0.551021, 1, 1, 1, 1, 1,
-0.882939, 1.069133, 0.348859, 1, 1, 1, 1, 1,
-0.8821948, -0.2086487, -1.885881, 1, 1, 1, 1, 1,
-0.8786681, -0.3987719, -0.920702, 1, 1, 1, 1, 1,
-0.877467, -0.4212252, -1.435652, 1, 1, 1, 1, 1,
-0.8731766, -0.2623423, -1.646983, 0, 0, 1, 1, 1,
-0.8719732, 0.5439945, -1.52707, 1, 0, 0, 1, 1,
-0.8596653, -2.421162, -2.906592, 1, 0, 0, 1, 1,
-0.8551297, -0.8713296, -2.943833, 1, 0, 0, 1, 1,
-0.8534786, -0.3359142, -1.319004, 1, 0, 0, 1, 1,
-0.8500929, -1.058402, -1.655041, 1, 0, 0, 1, 1,
-0.848254, -0.6648977, -2.559183, 0, 0, 0, 1, 1,
-0.8465862, 0.2025879, -0.4268059, 0, 0, 0, 1, 1,
-0.846243, 2.685595, 0.310052, 0, 0, 0, 1, 1,
-0.8420212, 0.4823249, -1.437866, 0, 0, 0, 1, 1,
-0.837779, -0.5708483, -3.63784, 0, 0, 0, 1, 1,
-0.8247091, 0.511568, -0.1049859, 0, 0, 0, 1, 1,
-0.8226676, -0.7348605, -2.237104, 0, 0, 0, 1, 1,
-0.8201918, 0.1313645, -1.687423, 1, 1, 1, 1, 1,
-0.8188559, 0.08394643, -1.850986, 1, 1, 1, 1, 1,
-0.8162712, 0.8307825, -1.883006, 1, 1, 1, 1, 1,
-0.8136609, -1.211893, -1.467716, 1, 1, 1, 1, 1,
-0.811711, -1.650759, -2.795254, 1, 1, 1, 1, 1,
-0.802898, 1.931709, -0.7241639, 1, 1, 1, 1, 1,
-0.8011344, -0.1571705, -0.7952803, 1, 1, 1, 1, 1,
-0.7963209, -0.01551795, -1.700773, 1, 1, 1, 1, 1,
-0.7941124, -2.344026, -3.966551, 1, 1, 1, 1, 1,
-0.7797046, -0.3901719, -0.858683, 1, 1, 1, 1, 1,
-0.7779085, -2.860193, -1.776931, 1, 1, 1, 1, 1,
-0.7711062, 1.183713, -0.7925748, 1, 1, 1, 1, 1,
-0.7694704, 0.4543984, -1.073126, 1, 1, 1, 1, 1,
-0.7691651, 0.9146106, -1.226106, 1, 1, 1, 1, 1,
-0.7673588, -0.6428328, -2.953961, 1, 1, 1, 1, 1,
-0.7647406, 1.633675, -1.966475, 0, 0, 1, 1, 1,
-0.7620395, 0.5476097, -1.10388, 1, 0, 0, 1, 1,
-0.7577748, 2.151651, 0.1362692, 1, 0, 0, 1, 1,
-0.7571592, 0.3053202, -0.728634, 1, 0, 0, 1, 1,
-0.7566808, 0.5792671, -2.388312, 1, 0, 0, 1, 1,
-0.7535772, -0.7238982, -2.771636, 1, 0, 0, 1, 1,
-0.7457757, -0.7475187, -1.862412, 0, 0, 0, 1, 1,
-0.7426953, 0.62115, -2.623592, 0, 0, 0, 1, 1,
-0.7418132, 1.894577, -1.441612, 0, 0, 0, 1, 1,
-0.7367592, 0.1833907, -2.292863, 0, 0, 0, 1, 1,
-0.7323005, -1.609068, -3.761117, 0, 0, 0, 1, 1,
-0.7214653, -0.6353853, -2.13051, 0, 0, 0, 1, 1,
-0.7192631, -0.1148149, -1.982538, 0, 0, 0, 1, 1,
-0.7157433, -0.005462568, -2.272046, 1, 1, 1, 1, 1,
-0.7140318, 0.1449699, -1.165482, 1, 1, 1, 1, 1,
-0.7037619, 0.7042848, -1.666269, 1, 1, 1, 1, 1,
-0.6982803, 0.454123, -0.04503793, 1, 1, 1, 1, 1,
-0.6980496, 0.09620297, -1.76065, 1, 1, 1, 1, 1,
-0.6854641, 1.399863, -1.89826, 1, 1, 1, 1, 1,
-0.6820444, 1.622389, -0.5445439, 1, 1, 1, 1, 1,
-0.6793482, 0.704408, 0.2381098, 1, 1, 1, 1, 1,
-0.6790279, -2.679165, -3.409266, 1, 1, 1, 1, 1,
-0.6757324, 0.5869657, -1.274865, 1, 1, 1, 1, 1,
-0.6712483, 0.2808171, 1.163224, 1, 1, 1, 1, 1,
-0.6670138, 0.0726764, -0.6813885, 1, 1, 1, 1, 1,
-0.665633, -0.3034792, -3.491058, 1, 1, 1, 1, 1,
-0.6635791, 1.327011, -1.336081, 1, 1, 1, 1, 1,
-0.6605855, 0.6643806, -1.491411, 1, 1, 1, 1, 1,
-0.6552894, 0.5380262, 0.1286418, 0, 0, 1, 1, 1,
-0.6497669, 0.4781332, -0.5888532, 1, 0, 0, 1, 1,
-0.6422247, -0.2007391, -1.663772, 1, 0, 0, 1, 1,
-0.6417938, 0.4127393, -0.07470702, 1, 0, 0, 1, 1,
-0.6362407, 1.856508, -3.18684, 1, 0, 0, 1, 1,
-0.6339553, -0.2805772, -1.879592, 1, 0, 0, 1, 1,
-0.6300415, 2.376774, -1.039359, 0, 0, 0, 1, 1,
-0.6249292, -0.186712, -1.223469, 0, 0, 0, 1, 1,
-0.624873, 0.238303, -2.74658, 0, 0, 0, 1, 1,
-0.6234947, 0.2580901, -1.555288, 0, 0, 0, 1, 1,
-0.6217809, -0.1082992, 0.4932245, 0, 0, 0, 1, 1,
-0.6197586, -1.288557, -2.73068, 0, 0, 0, 1, 1,
-0.6187118, 1.091726, -0.4011417, 0, 0, 0, 1, 1,
-0.6162629, 0.270958, -1.044973, 1, 1, 1, 1, 1,
-0.611334, 2.46853, 0.05134371, 1, 1, 1, 1, 1,
-0.6107179, 1.588147, -0.4273868, 1, 1, 1, 1, 1,
-0.6105693, -0.9147307, -4.423372, 1, 1, 1, 1, 1,
-0.6100891, 2.789671, -0.5313169, 1, 1, 1, 1, 1,
-0.6094928, -0.02422655, -0.4700753, 1, 1, 1, 1, 1,
-0.6072615, -2.78001, -2.985159, 1, 1, 1, 1, 1,
-0.6069571, -1.052779, -3.646813, 1, 1, 1, 1, 1,
-0.6036892, 0.3001841, -1.070401, 1, 1, 1, 1, 1,
-0.5997394, 1.479048, -0.1237095, 1, 1, 1, 1, 1,
-0.5978783, -0.1062714, -1.578872, 1, 1, 1, 1, 1,
-0.5971893, 0.331175, 0.2047899, 1, 1, 1, 1, 1,
-0.5966948, -0.4632795, -2.305239, 1, 1, 1, 1, 1,
-0.5964021, 1.181329, -0.5657837, 1, 1, 1, 1, 1,
-0.5914884, -0.1265288, 0.1340506, 1, 1, 1, 1, 1,
-0.5893172, 0.159916, -2.31476, 0, 0, 1, 1, 1,
-0.588883, -0.6875888, -1.320928, 1, 0, 0, 1, 1,
-0.583919, -0.8542538, -2.951823, 1, 0, 0, 1, 1,
-0.5822784, -1.902445, -1.368349, 1, 0, 0, 1, 1,
-0.5812662, -0.5025325, -3.029614, 1, 0, 0, 1, 1,
-0.5791782, -0.5900081, -2.774198, 1, 0, 0, 1, 1,
-0.5760902, -1.00362, -1.73319, 0, 0, 0, 1, 1,
-0.5729977, 0.5006713, -2.153769, 0, 0, 0, 1, 1,
-0.5674512, 1.079051, 0.5652813, 0, 0, 0, 1, 1,
-0.5618365, -1.743135, -3.321406, 0, 0, 0, 1, 1,
-0.5582848, -0.2664882, -2.605212, 0, 0, 0, 1, 1,
-0.557737, -0.2718206, 0.3213495, 0, 0, 0, 1, 1,
-0.5574769, 1.045591, -1.406212, 0, 0, 0, 1, 1,
-0.550193, -0.03383691, -2.281353, 1, 1, 1, 1, 1,
-0.5449623, -1.267383, -3.638089, 1, 1, 1, 1, 1,
-0.534478, 0.3681679, 0.2169445, 1, 1, 1, 1, 1,
-0.5342166, -0.4465467, -2.891447, 1, 1, 1, 1, 1,
-0.5334711, -2.331892, -2.533763, 1, 1, 1, 1, 1,
-0.5264351, -0.2257126, -2.296687, 1, 1, 1, 1, 1,
-0.5254061, -0.3118534, -1.721229, 1, 1, 1, 1, 1,
-0.5250331, 1.101125, -0.2575599, 1, 1, 1, 1, 1,
-0.5245863, -0.7014326, -1.294739, 1, 1, 1, 1, 1,
-0.5210507, 0.3078588, -1.931948, 1, 1, 1, 1, 1,
-0.5175111, 0.8375164, 0.8711537, 1, 1, 1, 1, 1,
-0.5106496, -1.179953, -2.709899, 1, 1, 1, 1, 1,
-0.5099353, 0.4200122, -0.6053088, 1, 1, 1, 1, 1,
-0.5093654, 0.5945855, -0.8156192, 1, 1, 1, 1, 1,
-0.509105, 0.3952277, 0.06085933, 1, 1, 1, 1, 1,
-0.5087584, 0.6341828, 1.239551, 0, 0, 1, 1, 1,
-0.5075471, 1.227196, -1.37559, 1, 0, 0, 1, 1,
-0.5027004, -1.078939, -2.035837, 1, 0, 0, 1, 1,
-0.4991449, 1.080639, 1.506892, 1, 0, 0, 1, 1,
-0.4988655, 0.85019, -0.01071526, 1, 0, 0, 1, 1,
-0.4892136, -0.7437711, -2.995585, 1, 0, 0, 1, 1,
-0.4739583, -0.1039889, -1.63885, 0, 0, 0, 1, 1,
-0.4732352, -0.1626349, -4.550201, 0, 0, 0, 1, 1,
-0.4730117, 0.6818911, 0.001423363, 0, 0, 0, 1, 1,
-0.4716701, 0.1857517, -0.771543, 0, 0, 0, 1, 1,
-0.471617, 0.9398694, 0.5599065, 0, 0, 0, 1, 1,
-0.4707094, -1.000118, -2.385413, 0, 0, 0, 1, 1,
-0.4681201, 0.5621818, 0.3224693, 0, 0, 0, 1, 1,
-0.4669139, 0.2362539, -2.721676, 1, 1, 1, 1, 1,
-0.4643809, 0.9693933, 0.7322611, 1, 1, 1, 1, 1,
-0.4625349, 1.192842, -0.08777744, 1, 1, 1, 1, 1,
-0.4588827, -0.1576702, -2.092715, 1, 1, 1, 1, 1,
-0.455494, 0.5543138, -1.973316, 1, 1, 1, 1, 1,
-0.4545486, -0.8449537, -2.897856, 1, 1, 1, 1, 1,
-0.4509857, -0.1755746, -0.9273356, 1, 1, 1, 1, 1,
-0.4431689, -0.4124559, -2.103452, 1, 1, 1, 1, 1,
-0.441394, 1.31404, -0.4050848, 1, 1, 1, 1, 1,
-0.4375475, 0.4238837, -0.5514941, 1, 1, 1, 1, 1,
-0.4368359, -0.5240856, -0.837115, 1, 1, 1, 1, 1,
-0.4360438, 0.4587025, -0.05046748, 1, 1, 1, 1, 1,
-0.4354604, 0.6216139, -3.26079, 1, 1, 1, 1, 1,
-0.4318478, -1.663197, -1.16101, 1, 1, 1, 1, 1,
-0.4295391, -1.411119, -1.794665, 1, 1, 1, 1, 1,
-0.428132, -1.132174, -3.659907, 0, 0, 1, 1, 1,
-0.4251884, -0.2813358, -2.377481, 1, 0, 0, 1, 1,
-0.4236791, 0.6785073, -3.476629, 1, 0, 0, 1, 1,
-0.4220043, 0.4081984, -1.296317, 1, 0, 0, 1, 1,
-0.4159894, -0.7508823, -2.02446, 1, 0, 0, 1, 1,
-0.4105861, 2.30207, 0.4462379, 1, 0, 0, 1, 1,
-0.4041084, -0.9690893, -2.358123, 0, 0, 0, 1, 1,
-0.3996492, 0.4128501, -3.374213, 0, 0, 0, 1, 1,
-0.3994567, 0.9423035, -0.9258216, 0, 0, 0, 1, 1,
-0.3974708, 0.4434954, -0.03898631, 0, 0, 0, 1, 1,
-0.3829111, -1.489954, -2.562839, 0, 0, 0, 1, 1,
-0.377129, 0.2715937, -0.6973408, 0, 0, 0, 1, 1,
-0.3763996, 1.103421, -2.19171, 0, 0, 0, 1, 1,
-0.3727727, -1.468075, -2.594263, 1, 1, 1, 1, 1,
-0.3719525, -0.4112044, -1.938131, 1, 1, 1, 1, 1,
-0.3693669, 1.060363, -0.5244452, 1, 1, 1, 1, 1,
-0.3669696, 0.6960297, -0.3956137, 1, 1, 1, 1, 1,
-0.3661864, -1.732739, -3.355854, 1, 1, 1, 1, 1,
-0.3658088, 0.2917225, -1.301457, 1, 1, 1, 1, 1,
-0.3625471, 0.2279435, -1.630949, 1, 1, 1, 1, 1,
-0.3577095, -1.819197, -1.505866, 1, 1, 1, 1, 1,
-0.3573571, 0.3540671, 1.307296, 1, 1, 1, 1, 1,
-0.3557712, -0.5882215, -1.477862, 1, 1, 1, 1, 1,
-0.3535335, -1.404332, -4.517663, 1, 1, 1, 1, 1,
-0.3531965, -0.4096872, -2.724876, 1, 1, 1, 1, 1,
-0.3529468, -1.37553, -1.900798, 1, 1, 1, 1, 1,
-0.3518341, 0.9093446, -1.418016, 1, 1, 1, 1, 1,
-0.3514619, -0.8780389, -1.742608, 1, 1, 1, 1, 1,
-0.3484575, -1.390963, -3.114832, 0, 0, 1, 1, 1,
-0.3462669, -0.4616798, -3.231087, 1, 0, 0, 1, 1,
-0.3415031, -1.575587, -0.679611, 1, 0, 0, 1, 1,
-0.3370055, -1.372608, -3.848537, 1, 0, 0, 1, 1,
-0.3345282, 0.3560338, -1.611839, 1, 0, 0, 1, 1,
-0.3326422, -1.022054, -4.106241, 1, 0, 0, 1, 1,
-0.3267882, 1.795108, 0.1027093, 0, 0, 0, 1, 1,
-0.3235295, -0.4483259, -3.4989, 0, 0, 0, 1, 1,
-0.3230799, -0.3105909, -1.106442, 0, 0, 0, 1, 1,
-0.3221539, 1.454275, -0.3349227, 0, 0, 0, 1, 1,
-0.3198942, -1.504965, -0.9000256, 0, 0, 0, 1, 1,
-0.3177118, 1.184413, -1.919074, 0, 0, 0, 1, 1,
-0.3160129, -0.507268, -1.720133, 0, 0, 0, 1, 1,
-0.3107018, 0.5121897, -0.3512458, 1, 1, 1, 1, 1,
-0.3068016, 0.6930964, 0.280059, 1, 1, 1, 1, 1,
-0.3055173, -0.64475, -1.154566, 1, 1, 1, 1, 1,
-0.3041389, 1.081026, -0.7900738, 1, 1, 1, 1, 1,
-0.303776, 0.4825169, -0.3911151, 1, 1, 1, 1, 1,
-0.2934062, -1.811795, -1.76473, 1, 1, 1, 1, 1,
-0.2898468, 0.5417798, -1.17969, 1, 1, 1, 1, 1,
-0.2897322, -0.7629608, -2.109812, 1, 1, 1, 1, 1,
-0.2872572, -0.5250675, -2.904942, 1, 1, 1, 1, 1,
-0.2842053, -0.3052765, -2.898282, 1, 1, 1, 1, 1,
-0.2821911, -0.2776964, -1.516152, 1, 1, 1, 1, 1,
-0.2783033, 0.9458471, -1.075226, 1, 1, 1, 1, 1,
-0.277706, 0.0360086, -2.603533, 1, 1, 1, 1, 1,
-0.268922, -0.1709389, -2.245347, 1, 1, 1, 1, 1,
-0.2644723, 0.3072562, -1.455189, 1, 1, 1, 1, 1,
-0.2639736, -1.048393, -3.752734, 0, 0, 1, 1, 1,
-0.2601429, 0.4809187, 2.235416, 1, 0, 0, 1, 1,
-0.2545844, 0.4488533, 1.161263, 1, 0, 0, 1, 1,
-0.2544669, -1.268137, -3.536836, 1, 0, 0, 1, 1,
-0.2451119, 2.088481, 0.8471649, 1, 0, 0, 1, 1,
-0.2450998, 0.9504588, 0.7951074, 1, 0, 0, 1, 1,
-0.2447218, -1.726591, -2.139017, 0, 0, 0, 1, 1,
-0.2433168, 2.312143, -0.1785383, 0, 0, 0, 1, 1,
-0.2401506, -0.4225389, -4.077724, 0, 0, 0, 1, 1,
-0.239276, 1.497054, -1.226071, 0, 0, 0, 1, 1,
-0.2383548, 0.6225057, 0.3124307, 0, 0, 0, 1, 1,
-0.237809, -0.2184633, -3.678648, 0, 0, 0, 1, 1,
-0.2369592, 1.15122, 0.9710006, 0, 0, 0, 1, 1,
-0.2349275, 0.8057503, 0.02552022, 1, 1, 1, 1, 1,
-0.2259936, -0.4850833, -1.900683, 1, 1, 1, 1, 1,
-0.2209064, -1.199947, -4.033961, 1, 1, 1, 1, 1,
-0.2119887, 1.294494, 0.4840373, 1, 1, 1, 1, 1,
-0.2076612, -1.469975, -2.552532, 1, 1, 1, 1, 1,
-0.2047308, -0.6336035, -4.064402, 1, 1, 1, 1, 1,
-0.2033352, -0.2578814, -3.069858, 1, 1, 1, 1, 1,
-0.2000514, 1.00962, -0.1915261, 1, 1, 1, 1, 1,
-0.1947068, -0.5591725, -4.573325, 1, 1, 1, 1, 1,
-0.1944166, 1.720843, 0.213727, 1, 1, 1, 1, 1,
-0.1940402, -1.656848, -2.540691, 1, 1, 1, 1, 1,
-0.1932456, -0.03929642, -2.070931, 1, 1, 1, 1, 1,
-0.1895365, -0.3904079, -1.371455, 1, 1, 1, 1, 1,
-0.1867815, -1.33926, -3.42275, 1, 1, 1, 1, 1,
-0.1856339, -0.6117408, -2.921502, 1, 1, 1, 1, 1,
-0.1828004, 0.4283451, -1.575166, 0, 0, 1, 1, 1,
-0.1822117, -0.7584956, -2.768022, 1, 0, 0, 1, 1,
-0.1820043, -0.2791576, -3.686801, 1, 0, 0, 1, 1,
-0.1797168, 1.293848, -0.1019977, 1, 0, 0, 1, 1,
-0.1792363, 0.04447861, -1.450771, 1, 0, 0, 1, 1,
-0.1789555, 0.1058637, 0.6118363, 1, 0, 0, 1, 1,
-0.1717051, 1.757242, -1.079831, 0, 0, 0, 1, 1,
-0.1705873, 0.3672128, 0.06803705, 0, 0, 0, 1, 1,
-0.1696985, 0.4769637, -1.538676, 0, 0, 0, 1, 1,
-0.1669398, -2.510628, -3.199432, 0, 0, 0, 1, 1,
-0.1667205, 0.1839382, -2.366569, 0, 0, 0, 1, 1,
-0.1666707, 1.080419, 1.83354, 0, 0, 0, 1, 1,
-0.1641983, -0.8704026, -3.262982, 0, 0, 0, 1, 1,
-0.1639455, -0.2067363, -1.848677, 1, 1, 1, 1, 1,
-0.1623002, 1.279917, -1.544086, 1, 1, 1, 1, 1,
-0.1622903, -1.581317, -0.4229554, 1, 1, 1, 1, 1,
-0.1608303, -0.8805863, -2.979545, 1, 1, 1, 1, 1,
-0.1518725, -0.4680866, -3.608953, 1, 1, 1, 1, 1,
-0.151179, -1.406227, -1.920201, 1, 1, 1, 1, 1,
-0.1502433, 0.3564445, 0.8770725, 1, 1, 1, 1, 1,
-0.1490468, 1.253043, -0.274949, 1, 1, 1, 1, 1,
-0.1445722, 0.6559765, -0.9987467, 1, 1, 1, 1, 1,
-0.1407205, 1.469533, -0.4513801, 1, 1, 1, 1, 1,
-0.1405494, -0.08068828, -1.815638, 1, 1, 1, 1, 1,
-0.1404957, 1.8855, -0.2580725, 1, 1, 1, 1, 1,
-0.1401687, 1.565027, -0.1759265, 1, 1, 1, 1, 1,
-0.1374156, 1.453709, -0.02470968, 1, 1, 1, 1, 1,
-0.1361379, 0.8872485, -1.320455, 1, 1, 1, 1, 1,
-0.1316383, -0.4390947, -3.997114, 0, 0, 1, 1, 1,
-0.118177, 0.05242831, -1.49766, 1, 0, 0, 1, 1,
-0.1163351, -0.5161977, -3.401631, 1, 0, 0, 1, 1,
-0.1161294, -0.9765689, -2.463087, 1, 0, 0, 1, 1,
-0.1124591, -1.034592, -4.286659, 1, 0, 0, 1, 1,
-0.1093674, -0.9256336, -2.761541, 1, 0, 0, 1, 1,
-0.1064988, 0.176789, -1.322988, 0, 0, 0, 1, 1,
-0.1054413, -0.9110327, -2.495268, 0, 0, 0, 1, 1,
-0.1048356, 0.5100776, 0.1125339, 0, 0, 0, 1, 1,
-0.1042852, 0.9283514, -0.7045607, 0, 0, 0, 1, 1,
-0.1040838, 0.2831019, -1.242793, 0, 0, 0, 1, 1,
-0.1022929, 1.418201, 1.7232, 0, 0, 0, 1, 1,
-0.09800512, -1.106987, -2.904001, 0, 0, 0, 1, 1,
-0.09671135, -0.8386174, -3.133483, 1, 1, 1, 1, 1,
-0.09492198, -2.749956, -2.972786, 1, 1, 1, 1, 1,
-0.09362091, 0.06598198, -0.9963591, 1, 1, 1, 1, 1,
-0.08897155, -1.997576, -1.340822, 1, 1, 1, 1, 1,
-0.08888055, -0.8988047, -2.030482, 1, 1, 1, 1, 1,
-0.08200178, 0.5014569, 0.8961655, 1, 1, 1, 1, 1,
-0.0814393, -2.454237, -3.021578, 1, 1, 1, 1, 1,
-0.07923889, 1.550718, 0.8264912, 1, 1, 1, 1, 1,
-0.07615932, -1.409901, -3.91111, 1, 1, 1, 1, 1,
-0.06371701, 0.1679532, -2.254687, 1, 1, 1, 1, 1,
-0.06168659, 0.0004767531, 0.2626478, 1, 1, 1, 1, 1,
-0.05983797, -0.8366636, -2.824695, 1, 1, 1, 1, 1,
-0.05980686, 0.127498, -1.816355, 1, 1, 1, 1, 1,
-0.05755466, 1.170113, -1.993138, 1, 1, 1, 1, 1,
-0.05255096, -0.4716507, -1.907533, 1, 1, 1, 1, 1,
-0.05029225, -0.2490734, -1.546434, 0, 0, 1, 1, 1,
-0.04858245, 0.3296476, 1.339821, 1, 0, 0, 1, 1,
-0.04624455, 0.4688028, 0.5088426, 1, 0, 0, 1, 1,
-0.03790512, -1.385397, -4.451729, 1, 0, 0, 1, 1,
-0.03025946, 0.1934151, -1.395806, 1, 0, 0, 1, 1,
-0.02141351, -0.4504541, -2.101239, 1, 0, 0, 1, 1,
-0.02110428, 0.5892314, -0.3718286, 0, 0, 0, 1, 1,
-0.01940197, -0.02715526, -1.459939, 0, 0, 0, 1, 1,
-0.01883722, -0.1928249, -3.039963, 0, 0, 0, 1, 1,
-0.01815983, 1.126137, -0.8376964, 0, 0, 0, 1, 1,
-0.01763211, 1.005662, 0.04147835, 0, 0, 0, 1, 1,
-0.01026478, 0.5862275, 0.1688143, 0, 0, 0, 1, 1,
-0.009615084, -0.4795921, -4.261475, 0, 0, 0, 1, 1,
-0.008399372, 0.0129578, 0.460843, 1, 1, 1, 1, 1,
-0.004394162, -1.230013, -4.477057, 1, 1, 1, 1, 1,
0.004443299, -0.8470594, 4.165498, 1, 1, 1, 1, 1,
0.006140358, -1.762038, 2.921349, 1, 1, 1, 1, 1,
0.01206495, 0.5287126, -0.1765732, 1, 1, 1, 1, 1,
0.01537119, -0.6115683, 2.679631, 1, 1, 1, 1, 1,
0.02210192, 1.255813, 0.5311369, 1, 1, 1, 1, 1,
0.02395669, -1.3585, 1.932513, 1, 1, 1, 1, 1,
0.02401789, 0.8747773, -0.04983037, 1, 1, 1, 1, 1,
0.02490429, 0.3759198, -0.7365035, 1, 1, 1, 1, 1,
0.02552143, 1.669424, -0.7340589, 1, 1, 1, 1, 1,
0.03047686, -0.1221646, 1.698779, 1, 1, 1, 1, 1,
0.03861206, 0.3838008, -0.1112085, 1, 1, 1, 1, 1,
0.04077739, -0.05521797, 0.2580786, 1, 1, 1, 1, 1,
0.04160093, -0.08630581, 2.218727, 1, 1, 1, 1, 1,
0.042454, 1.205244, 0.3986904, 0, 0, 1, 1, 1,
0.0531784, 0.9511408, -0.1264312, 1, 0, 0, 1, 1,
0.0551892, 0.1948521, -0.1116263, 1, 0, 0, 1, 1,
0.05739599, -0.3846528, 2.68548, 1, 0, 0, 1, 1,
0.05752861, -0.4728285, 4.407498, 1, 0, 0, 1, 1,
0.05846028, -0.6329526, 2.452962, 1, 0, 0, 1, 1,
0.06109511, 0.3649275, 1.567578, 0, 0, 0, 1, 1,
0.0633148, -2.057578, 4.19429, 0, 0, 0, 1, 1,
0.06664925, -0.9833267, 4.179812, 0, 0, 0, 1, 1,
0.0690239, -0.2242212, 2.4089, 0, 0, 0, 1, 1,
0.07159861, -0.9718971, 3.247387, 0, 0, 0, 1, 1,
0.0751657, 0.948415, 0.4691813, 0, 0, 0, 1, 1,
0.07741249, 1.018801, -0.6564498, 0, 0, 0, 1, 1,
0.08017503, -0.2895863, 1.874857, 1, 1, 1, 1, 1,
0.08020579, -0.3090841, 1.610215, 1, 1, 1, 1, 1,
0.08327666, -0.574586, 2.23402, 1, 1, 1, 1, 1,
0.0920343, -1.687677, 3.00121, 1, 1, 1, 1, 1,
0.09428823, -0.9649659, 3.323135, 1, 1, 1, 1, 1,
0.09479291, -0.2804092, 3.539927, 1, 1, 1, 1, 1,
0.09616067, 1.629244, 1.095764, 1, 1, 1, 1, 1,
0.09653085, -0.2814617, 1.48327, 1, 1, 1, 1, 1,
0.1011406, 1.710827, -0.8159334, 1, 1, 1, 1, 1,
0.1029036, -0.4109185, 3.777278, 1, 1, 1, 1, 1,
0.1077309, -0.4838023, 2.850894, 1, 1, 1, 1, 1,
0.109404, -0.9240035, 2.355429, 1, 1, 1, 1, 1,
0.1106393, -0.007306417, 1.425749, 1, 1, 1, 1, 1,
0.1114796, -1.941039, 2.879214, 1, 1, 1, 1, 1,
0.1125521, -1.172218, 3.32796, 1, 1, 1, 1, 1,
0.1162572, 1.762493, 0.5943782, 0, 0, 1, 1, 1,
0.1178848, 1.797481, -0.5012127, 1, 0, 0, 1, 1,
0.1213239, -1.108582, 2.512029, 1, 0, 0, 1, 1,
0.1271977, 0.817389, -0.06786639, 1, 0, 0, 1, 1,
0.1274437, -1.119937, 3.786717, 1, 0, 0, 1, 1,
0.1294722, 2.009491, 0.3686611, 1, 0, 0, 1, 1,
0.1307863, 0.8831306, 1.047399, 0, 0, 0, 1, 1,
0.1331088, 1.001028, -0.6171813, 0, 0, 0, 1, 1,
0.1348543, 0.977483, -0.5665539, 0, 0, 0, 1, 1,
0.1373018, -1.90896, 2.7702, 0, 0, 0, 1, 1,
0.1493521, -1.203974, 4.239591, 0, 0, 0, 1, 1,
0.1504336, -1.333508, 2.315478, 0, 0, 0, 1, 1,
0.150539, -0.8532838, 4.036486, 0, 0, 0, 1, 1,
0.1621285, 0.1731762, 1.193406, 1, 1, 1, 1, 1,
0.1657052, 0.0954655, 0.5534993, 1, 1, 1, 1, 1,
0.1658268, 0.4561656, -0.2853241, 1, 1, 1, 1, 1,
0.1661296, -1.042715, 2.295077, 1, 1, 1, 1, 1,
0.1663046, 0.7324299, 0.6853229, 1, 1, 1, 1, 1,
0.1702214, -1.673702, 3.412471, 1, 1, 1, 1, 1,
0.1725272, 1.177276, 0.4758449, 1, 1, 1, 1, 1,
0.1766315, 0.9409387, 0.08628172, 1, 1, 1, 1, 1,
0.17681, 0.9878701, -0.6273733, 1, 1, 1, 1, 1,
0.1792784, 1.610029, -0.7925639, 1, 1, 1, 1, 1,
0.1859182, -0.1100472, 2.522859, 1, 1, 1, 1, 1,
0.1865644, -0.2372358, 0.9893826, 1, 1, 1, 1, 1,
0.1871571, -1.06753, 2.621341, 1, 1, 1, 1, 1,
0.1896459, 0.8988757, 0.852707, 1, 1, 1, 1, 1,
0.1925401, 0.5221152, 0.1483364, 1, 1, 1, 1, 1,
0.1952918, -0.4320984, 1.164901, 0, 0, 1, 1, 1,
0.1958807, -0.4713097, 3.137081, 1, 0, 0, 1, 1,
0.1964073, -0.2186239, 2.053863, 1, 0, 0, 1, 1,
0.1998176, -0.6407729, 2.901733, 1, 0, 0, 1, 1,
0.2007185, 0.7917453, -0.7809553, 1, 0, 0, 1, 1,
0.2012231, -0.3070796, 1.16124, 1, 0, 0, 1, 1,
0.2021447, -0.508164, 3.320391, 0, 0, 0, 1, 1,
0.2041831, -0.1510568, 3.876664, 0, 0, 0, 1, 1,
0.2088859, -0.1503269, 2.098713, 0, 0, 0, 1, 1,
0.2094263, 0.1488441, 1.679117, 0, 0, 0, 1, 1,
0.2110309, 0.4438691, 0.2388087, 0, 0, 0, 1, 1,
0.2156995, -0.9769899, 2.462722, 0, 0, 0, 1, 1,
0.217664, -2.543652, 3.380261, 0, 0, 0, 1, 1,
0.2200932, -2.753172, 2.503961, 1, 1, 1, 1, 1,
0.2212343, 0.7852144, 1.34857, 1, 1, 1, 1, 1,
0.2212833, -0.844945, 1.376696, 1, 1, 1, 1, 1,
0.2239387, -0.04664337, 0.2721315, 1, 1, 1, 1, 1,
0.2262002, -1.49028, 3.119061, 1, 1, 1, 1, 1,
0.2303386, 1.323844, -0.07517413, 1, 1, 1, 1, 1,
0.2319246, -1.011009, 2.028559, 1, 1, 1, 1, 1,
0.2369692, 1.337601, -0.2015204, 1, 1, 1, 1, 1,
0.2392865, 2.117331, -0.1344422, 1, 1, 1, 1, 1,
0.242413, -0.911139, 3.340174, 1, 1, 1, 1, 1,
0.2425392, 1.014438, -1.139865, 1, 1, 1, 1, 1,
0.2493645, -1.226936, 3.2868, 1, 1, 1, 1, 1,
0.2519774, 1.010738, 1.324261, 1, 1, 1, 1, 1,
0.2530775, 1.326509, 0.07017069, 1, 1, 1, 1, 1,
0.2596245, 0.008624539, 1.967434, 1, 1, 1, 1, 1,
0.2627681, 0.9343849, -0.1026126, 0, 0, 1, 1, 1,
0.2649115, 1.196189, -2.016076, 1, 0, 0, 1, 1,
0.2666273, 1.318522, 1.910726, 1, 0, 0, 1, 1,
0.2679156, -3.41884, 1.519427, 1, 0, 0, 1, 1,
0.2712698, 0.2375634, -1.301935, 1, 0, 0, 1, 1,
0.2714804, -0.6496947, 1.269221, 1, 0, 0, 1, 1,
0.2722511, -0.9917855, 5.555776, 0, 0, 0, 1, 1,
0.2725863, 0.448885, -0.07407188, 0, 0, 0, 1, 1,
0.2779101, -0.1714529, 1.91086, 0, 0, 0, 1, 1,
0.2788387, 0.5630519, 0.01235281, 0, 0, 0, 1, 1,
0.2788997, -0.1804949, 1.906495, 0, 0, 0, 1, 1,
0.2811381, 1.389175, 0.4981396, 0, 0, 0, 1, 1,
0.2863913, 0.8965683, -0.3246074, 0, 0, 0, 1, 1,
0.2878326, 1.104853, 0.8742698, 1, 1, 1, 1, 1,
0.2878717, -0.06785188, 1.25123, 1, 1, 1, 1, 1,
0.2922267, 0.6327895, 1.201554, 1, 1, 1, 1, 1,
0.2967586, -0.1279655, 1.370794, 1, 1, 1, 1, 1,
0.3001999, 0.2146851, 0.7614364, 1, 1, 1, 1, 1,
0.3010439, 0.505753, 0.2755823, 1, 1, 1, 1, 1,
0.3058893, 1.714637, 0.793005, 1, 1, 1, 1, 1,
0.3125974, -0.7718024, 2.054178, 1, 1, 1, 1, 1,
0.3142318, -0.7005957, 2.464537, 1, 1, 1, 1, 1,
0.3154402, -1.040038, 2.6589, 1, 1, 1, 1, 1,
0.3159253, 0.9568293, -1.292279, 1, 1, 1, 1, 1,
0.3174631, -0.01372819, 3.236845, 1, 1, 1, 1, 1,
0.3186553, -0.6472332, 1.094265, 1, 1, 1, 1, 1,
0.3192371, -0.1269223, 1.578226, 1, 1, 1, 1, 1,
0.3213345, -0.1948197, 4.134403, 1, 1, 1, 1, 1,
0.3232412, -0.2838133, 0.9583339, 0, 0, 1, 1, 1,
0.3256233, 0.4997401, 1.430793, 1, 0, 0, 1, 1,
0.3288536, -0.1097675, 2.89114, 1, 0, 0, 1, 1,
0.3294703, 0.9234354, -0.4733041, 1, 0, 0, 1, 1,
0.3316853, 0.134656, 1.872111, 1, 0, 0, 1, 1,
0.3428772, -0.6117613, 3.550885, 1, 0, 0, 1, 1,
0.3478925, -0.195224, -0.0277554, 0, 0, 0, 1, 1,
0.3491231, -1.408373, 3.250243, 0, 0, 0, 1, 1,
0.3502728, -0.1797431, 0.09439774, 0, 0, 0, 1, 1,
0.3511085, 1.699591, 0.3382403, 0, 0, 0, 1, 1,
0.3517677, 0.06562027, 2.124358, 0, 0, 0, 1, 1,
0.3534346, 1.99481, 0.9977819, 0, 0, 0, 1, 1,
0.3588035, -0.06681877, 0.9745665, 0, 0, 0, 1, 1,
0.3617255, -3.142961, 3.243911, 1, 1, 1, 1, 1,
0.3663351, -1.455603, 3.092671, 1, 1, 1, 1, 1,
0.3682981, -0.4926733, 1.775472, 1, 1, 1, 1, 1,
0.3685207, -1.512015, 1.960869, 1, 1, 1, 1, 1,
0.3696312, 0.2063558, 1.221352, 1, 1, 1, 1, 1,
0.3716319, 1.29855, -0.8300924, 1, 1, 1, 1, 1,
0.372118, 1.768558, -0.4956707, 1, 1, 1, 1, 1,
0.3760773, 0.08866478, 1.418363, 1, 1, 1, 1, 1,
0.3841317, 1.477813, 1.705699, 1, 1, 1, 1, 1,
0.3842962, 0.133683, 1.238606, 1, 1, 1, 1, 1,
0.3917201, -0.6307647, 2.392476, 1, 1, 1, 1, 1,
0.3964622, 1.547156, -0.6342559, 1, 1, 1, 1, 1,
0.3989809, 0.6904477, 0.4531159, 1, 1, 1, 1, 1,
0.4010349, 0.277359, 0.9105478, 1, 1, 1, 1, 1,
0.4016886, -1.18663, 2.40063, 1, 1, 1, 1, 1,
0.4033834, -0.8530661, 3.348067, 0, 0, 1, 1, 1,
0.4048356, 0.04201933, 1.373868, 1, 0, 0, 1, 1,
0.408032, 0.8935147, -1.091549, 1, 0, 0, 1, 1,
0.4125334, -0.882352, 2.068321, 1, 0, 0, 1, 1,
0.4162644, -0.2785486, 2.012412, 1, 0, 0, 1, 1,
0.4240117, 0.0312031, 2.054937, 1, 0, 0, 1, 1,
0.4260498, 0.9808558, -0.1645334, 0, 0, 0, 1, 1,
0.4307817, -3.220065, 4.54051, 0, 0, 0, 1, 1,
0.4336419, 0.6047556, 0.5829313, 0, 0, 0, 1, 1,
0.4343022, 0.6276449, 0.1655682, 0, 0, 0, 1, 1,
0.4353905, -1.338903, 2.31077, 0, 0, 0, 1, 1,
0.4421948, 0.7263807, 0.3712433, 0, 0, 0, 1, 1,
0.4424242, 0.303892, 0.3729527, 0, 0, 0, 1, 1,
0.4427243, 1.717662, -0.5186613, 1, 1, 1, 1, 1,
0.4460708, 1.678326, 0.06541125, 1, 1, 1, 1, 1,
0.4497089, -0.1333042, 2.253028, 1, 1, 1, 1, 1,
0.4504747, -0.833356, 3.686896, 1, 1, 1, 1, 1,
0.455608, 0.3298127, 0.9469604, 1, 1, 1, 1, 1,
0.4563538, -0.3262567, 0.8667709, 1, 1, 1, 1, 1,
0.4575834, -0.01910291, 1.428436, 1, 1, 1, 1, 1,
0.4577726, -1.263248, 2.347042, 1, 1, 1, 1, 1,
0.4594972, -0.08425153, 2.097469, 1, 1, 1, 1, 1,
0.4613607, -0.2098076, -0.1115547, 1, 1, 1, 1, 1,
0.4656847, -0.4719603, 2.981721, 1, 1, 1, 1, 1,
0.466847, 0.02839191, 4.515052, 1, 1, 1, 1, 1,
0.4720462, -0.1814128, 0.1351791, 1, 1, 1, 1, 1,
0.4739827, 0.4612422, 1.12527, 1, 1, 1, 1, 1,
0.4821827, 0.75142, 0.3243622, 1, 1, 1, 1, 1,
0.4841214, 0.8252707, 1.648034, 0, 0, 1, 1, 1,
0.4846828, 1.223855, 1.779947, 1, 0, 0, 1, 1,
0.486805, 3.567965, 0.9944715, 1, 0, 0, 1, 1,
0.4876588, 1.466791, 1.257297, 1, 0, 0, 1, 1,
0.4889599, -0.3790213, 3.504989, 1, 0, 0, 1, 1,
0.4979452, -0.1143014, 3.373603, 1, 0, 0, 1, 1,
0.5002779, 0.2434435, 1.450014, 0, 0, 0, 1, 1,
0.5022179, -0.3007801, 2.800029, 0, 0, 0, 1, 1,
0.5033634, -0.9116459, 2.793981, 0, 0, 0, 1, 1,
0.5057719, 1.342555, -0.2072167, 0, 0, 0, 1, 1,
0.5073168, 2.115714, -1.149666, 0, 0, 0, 1, 1,
0.5091689, 0.8753597, -1.276297, 0, 0, 0, 1, 1,
0.5162752, -0.02014736, 2.274265, 0, 0, 0, 1, 1,
0.5199992, -0.3450944, 1.681049, 1, 1, 1, 1, 1,
0.5205976, 0.9342321, 1.562678, 1, 1, 1, 1, 1,
0.5286916, -0.5935388, 2.427344, 1, 1, 1, 1, 1,
0.5341202, -0.8923703, 4.33606, 1, 1, 1, 1, 1,
0.5395226, 2.739958, 0.6326759, 1, 1, 1, 1, 1,
0.5412276, -1.029086, 2.646631, 1, 1, 1, 1, 1,
0.543781, -0.6168919, 2.678984, 1, 1, 1, 1, 1,
0.5487729, -1.058186, 1.870063, 1, 1, 1, 1, 1,
0.549897, -0.2768436, 1.867404, 1, 1, 1, 1, 1,
0.5508811, 1.698713, -0.5591559, 1, 1, 1, 1, 1,
0.5528569, 1.61242, -0.2507355, 1, 1, 1, 1, 1,
0.5538695, 0.7777758, -0.4260263, 1, 1, 1, 1, 1,
0.5730076, 0.4949957, 0.4556976, 1, 1, 1, 1, 1,
0.5740631, -1.525964, 4.271426, 1, 1, 1, 1, 1,
0.5743438, -0.6639506, 1.496731, 1, 1, 1, 1, 1,
0.5750402, 0.1693212, 1.425748, 0, 0, 1, 1, 1,
0.5755053, 0.7912278, 1.337773, 1, 0, 0, 1, 1,
0.5856317, 0.5246061, 0.8528959, 1, 0, 0, 1, 1,
0.5865598, -0.3172641, 2.118008, 1, 0, 0, 1, 1,
0.5895917, -0.5791168, 1.742846, 1, 0, 0, 1, 1,
0.6012411, -1.527134, 2.919063, 1, 0, 0, 1, 1,
0.6013095, 0.0540784, 1.460681, 0, 0, 0, 1, 1,
0.6059226, -0.8621881, 2.562907, 0, 0, 0, 1, 1,
0.610997, 0.9900443, 0.8037912, 0, 0, 0, 1, 1,
0.6193201, -0.6900266, 1.230179, 0, 0, 0, 1, 1,
0.6209332, 0.02127459, 0.9871436, 0, 0, 0, 1, 1,
0.6266552, 1.072284, 1.005565, 0, 0, 0, 1, 1,
0.6380275, -0.585407, 2.123592, 0, 0, 0, 1, 1,
0.6385914, -0.1846992, 0.8386176, 1, 1, 1, 1, 1,
0.640945, 1.580563, 0.2507437, 1, 1, 1, 1, 1,
0.64147, -1.059652, 2.28697, 1, 1, 1, 1, 1,
0.6543725, -1.734054, 1.829798, 1, 1, 1, 1, 1,
0.6678289, -1.308069, -0.5818645, 1, 1, 1, 1, 1,
0.6728945, 1.632196, 1.529549, 1, 1, 1, 1, 1,
0.6751416, -0.5091622, 2.04384, 1, 1, 1, 1, 1,
0.6770725, -1.126433, 1.238052, 1, 1, 1, 1, 1,
0.6771296, -0.0217494, 2.491296, 1, 1, 1, 1, 1,
0.6848196, 1.398797, 0.654208, 1, 1, 1, 1, 1,
0.6848346, -1.401611, 2.972155, 1, 1, 1, 1, 1,
0.6867301, 1.25412, 1.977751, 1, 1, 1, 1, 1,
0.6921492, 0.1786743, 1.789622, 1, 1, 1, 1, 1,
0.6951555, 0.467622, 1.408977, 1, 1, 1, 1, 1,
0.7065288, -1.014893, 1.833481, 1, 1, 1, 1, 1,
0.7131873, 0.3466804, 1.622795, 0, 0, 1, 1, 1,
0.7133118, -0.344337, 0.6869217, 1, 0, 0, 1, 1,
0.7134438, 1.993882, -0.1730227, 1, 0, 0, 1, 1,
0.7162914, 0.5702573, 0.6701131, 1, 0, 0, 1, 1,
0.7194703, 0.375332, 2.426179, 1, 0, 0, 1, 1,
0.7210386, 0.7853064, 0.5122465, 1, 0, 0, 1, 1,
0.7216328, 0.54571, 0.8575225, 0, 0, 0, 1, 1,
0.7232192, -2.282749, 3.92836, 0, 0, 0, 1, 1,
0.7234005, -1.466777, 1.776009, 0, 0, 0, 1, 1,
0.7248961, 1.73209, 1.84268, 0, 0, 0, 1, 1,
0.7259879, -1.140397, 4.529787, 0, 0, 0, 1, 1,
0.7265657, 0.1259603, 1.589795, 0, 0, 0, 1, 1,
0.7298508, 1.325799, 0.732308, 0, 0, 0, 1, 1,
0.7351889, -0.108725, 1.770708, 1, 1, 1, 1, 1,
0.7353858, -0.5474228, 3.639413, 1, 1, 1, 1, 1,
0.7387155, 0.07268357, 1.964055, 1, 1, 1, 1, 1,
0.7389297, -0.4860576, 2.129156, 1, 1, 1, 1, 1,
0.7430369, 1.7538, 0.6060296, 1, 1, 1, 1, 1,
0.743246, 0.3729362, 2.642029, 1, 1, 1, 1, 1,
0.7438189, -0.8694432, 0.8824836, 1, 1, 1, 1, 1,
0.7460814, -0.3291231, 3.498467, 1, 1, 1, 1, 1,
0.7469791, -0.4488058, 1.574236, 1, 1, 1, 1, 1,
0.7490859, -0.01301578, 2.190476, 1, 1, 1, 1, 1,
0.7509129, -0.3983358, 3.785943, 1, 1, 1, 1, 1,
0.7599646, 1.038185, 0.9812816, 1, 1, 1, 1, 1,
0.7604311, -0.1775292, 1.686682, 1, 1, 1, 1, 1,
0.7605041, -0.2454982, 1.732378, 1, 1, 1, 1, 1,
0.7627168, -0.07926919, -0.1498897, 1, 1, 1, 1, 1,
0.763307, 1.068893, -0.7991897, 0, 0, 1, 1, 1,
0.7657471, -0.925534, 2.709394, 1, 0, 0, 1, 1,
0.7676873, -1.769668, 2.504521, 1, 0, 0, 1, 1,
0.7710943, 1.386048, 0.7589591, 1, 0, 0, 1, 1,
0.7776502, 0.6674097, 0.5681681, 1, 0, 0, 1, 1,
0.7820376, -0.01702983, 2.360363, 1, 0, 0, 1, 1,
0.78697, 2.383824, -0.7334067, 0, 0, 0, 1, 1,
0.7875165, 0.7668096, 0.6807923, 0, 0, 0, 1, 1,
0.7892728, -1.862106, 1.519901, 0, 0, 0, 1, 1,
0.7960576, -0.8250963, 0.8658972, 0, 0, 0, 1, 1,
0.7963732, 0.5043499, 0.09127313, 0, 0, 0, 1, 1,
0.7968338, -1.289259, 2.988895, 0, 0, 0, 1, 1,
0.7971497, 0.3438108, -0.3815265, 0, 0, 0, 1, 1,
0.7997943, 1.635898, 1.331882, 1, 1, 1, 1, 1,
0.8060891, 0.6681547, 1.725948, 1, 1, 1, 1, 1,
0.8074257, -0.07968543, 2.286231, 1, 1, 1, 1, 1,
0.8116447, 0.7370033, 1.378124, 1, 1, 1, 1, 1,
0.8119735, 0.2731506, -0.6986126, 1, 1, 1, 1, 1,
0.8129301, 1.583343, 0.8511614, 1, 1, 1, 1, 1,
0.8143466, 0.7149659, 0.9997829, 1, 1, 1, 1, 1,
0.8170946, 0.3874489, 1.588905, 1, 1, 1, 1, 1,
0.8199605, 0.3740617, 0.8332218, 1, 1, 1, 1, 1,
0.8210065, 0.6533657, 1.187054, 1, 1, 1, 1, 1,
0.824623, -1.790066, 4.090683, 1, 1, 1, 1, 1,
0.8282574, -0.5971733, 1.268064, 1, 1, 1, 1, 1,
0.8287826, -0.4601284, 2.644536, 1, 1, 1, 1, 1,
0.8302188, 0.4897961, 1.096032, 1, 1, 1, 1, 1,
0.8336728, -0.2026652, 0.384163, 1, 1, 1, 1, 1,
0.835643, -0.6104624, 2.890718, 0, 0, 1, 1, 1,
0.8428267, -0.1401115, 0.7823667, 1, 0, 0, 1, 1,
0.8469065, -0.9901797, 1.865059, 1, 0, 0, 1, 1,
0.8472934, 1.0107, -0.0885505, 1, 0, 0, 1, 1,
0.8480771, 0.7793497, -0.7888448, 1, 0, 0, 1, 1,
0.8505299, -0.6632769, 1.505178, 1, 0, 0, 1, 1,
0.8550315, 1.289848, -0.5241689, 0, 0, 0, 1, 1,
0.8585723, 1.672542, 1.916165, 0, 0, 0, 1, 1,
0.8617016, -1.621473, 1.035228, 0, 0, 0, 1, 1,
0.8661133, -0.9154648, 2.341654, 0, 0, 0, 1, 1,
0.8680095, 0.08736952, 3.190117, 0, 0, 0, 1, 1,
0.8704787, 0.1914035, 2.371528, 0, 0, 0, 1, 1,
0.8791246, -1.234285, 4.577939, 0, 0, 0, 1, 1,
0.8871775, 1.238582, -0.6351779, 1, 1, 1, 1, 1,
0.888414, 0.2181987, 1.529356, 1, 1, 1, 1, 1,
0.8915856, -0.3315349, 2.617203, 1, 1, 1, 1, 1,
0.8923568, 0.6656871, 0.6687764, 1, 1, 1, 1, 1,
0.8944323, 0.6722445, -0.6543641, 1, 1, 1, 1, 1,
0.8953674, 1.114999, 1.091229, 1, 1, 1, 1, 1,
0.8976299, 0.02513529, 1.800926, 1, 1, 1, 1, 1,
0.8999018, -0.7449986, 1.043794, 1, 1, 1, 1, 1,
0.9051592, 0.08912086, 1.009342, 1, 1, 1, 1, 1,
0.9062533, -0.4760846, 0.6775545, 1, 1, 1, 1, 1,
0.9168909, 1.576653, 0.02778362, 1, 1, 1, 1, 1,
0.9240277, 0.7051416, 1.760746, 1, 1, 1, 1, 1,
0.9256195, 0.3619294, 2.022694, 1, 1, 1, 1, 1,
0.9315392, 0.8373982, 0.5315282, 1, 1, 1, 1, 1,
0.9320605, -1.362189, 3.682737, 1, 1, 1, 1, 1,
0.9378346, 0.08587871, 2.275399, 0, 0, 1, 1, 1,
0.9476808, 2.028353, 0.3242658, 1, 0, 0, 1, 1,
0.9494142, -0.9182103, 2.227461, 1, 0, 0, 1, 1,
0.9550244, -0.5098915, 2.919683, 1, 0, 0, 1, 1,
0.9604028, -0.8285538, 1.962701, 1, 0, 0, 1, 1,
0.9636427, -0.4019685, 1.854086, 1, 0, 0, 1, 1,
0.9640869, 0.9443985, -1.043542, 0, 0, 0, 1, 1,
0.9652907, -0.3987946, 1.801155, 0, 0, 0, 1, 1,
0.9709228, 2.397136, 0.4376568, 0, 0, 0, 1, 1,
0.9761439, 2.221395, -0.208124, 0, 0, 0, 1, 1,
0.9796776, -0.1094588, 3.013872, 0, 0, 0, 1, 1,
0.9830062, 0.5858708, 0.5406388, 0, 0, 0, 1, 1,
0.9863311, 0.08042216, 1.177713, 0, 0, 0, 1, 1,
0.9874065, 1.152451, 0.1768663, 1, 1, 1, 1, 1,
0.9882219, 0.5457033, 1.461636, 1, 1, 1, 1, 1,
0.9890273, 0.02684328, -0.1798093, 1, 1, 1, 1, 1,
0.9908148, -0.1648291, -0.7461054, 1, 1, 1, 1, 1,
0.9936993, -0.3957299, 0.9638634, 1, 1, 1, 1, 1,
0.9938053, 0.05419888, 0.8042952, 1, 1, 1, 1, 1,
0.9966895, -0.9225771, 0.67123, 1, 1, 1, 1, 1,
0.9976709, 0.5464426, 1.919945, 1, 1, 1, 1, 1,
1.000661, -0.2773995, 0.9773579, 1, 1, 1, 1, 1,
1.002975, 1.520127, 0.3100613, 1, 1, 1, 1, 1,
1.003346, -0.6498245, 2.158186, 1, 1, 1, 1, 1,
1.021918, -0.06552775, 0.8131285, 1, 1, 1, 1, 1,
1.022429, 0.5427502, 1.485204, 1, 1, 1, 1, 1,
1.031866, 1.661154, 0.360836, 1, 1, 1, 1, 1,
1.035758, -0.1583146, 1.051498, 1, 1, 1, 1, 1,
1.039508, -0.6039481, 2.913403, 0, 0, 1, 1, 1,
1.04189, 0.0887363, 1.679954, 1, 0, 0, 1, 1,
1.05405, -0.830344, 2.427604, 1, 0, 0, 1, 1,
1.059088, 0.605396, 1.762371, 1, 0, 0, 1, 1,
1.059147, 0.04341584, 0.727011, 1, 0, 0, 1, 1,
1.062397, -0.5453871, 2.228578, 1, 0, 0, 1, 1,
1.063975, 1.166042, 0.3066358, 0, 0, 0, 1, 1,
1.076747, -1.370673, 2.683002, 0, 0, 0, 1, 1,
1.084654, 1.498399, -0.7350051, 0, 0, 0, 1, 1,
1.08495, 0.399066, 0.9511459, 0, 0, 0, 1, 1,
1.097279, -1.954326, 1.29368, 0, 0, 0, 1, 1,
1.097615, 1.73256, -0.7548956, 0, 0, 0, 1, 1,
1.098442, 0.3997634, 0.863667, 0, 0, 0, 1, 1,
1.100672, 0.7266538, -0.4380191, 1, 1, 1, 1, 1,
1.102935, 0.3888927, -0.1998971, 1, 1, 1, 1, 1,
1.104563, -0.8931043, 3.121209, 1, 1, 1, 1, 1,
1.106362, -0.5997416, 0.9545147, 1, 1, 1, 1, 1,
1.110942, 0.9311082, 0.2541986, 1, 1, 1, 1, 1,
1.112078, -0.2740461, 1.233173, 1, 1, 1, 1, 1,
1.112782, 0.9148654, 0.4042718, 1, 1, 1, 1, 1,
1.118308, 0.245351, 1.438809, 1, 1, 1, 1, 1,
1.128536, -1.184952, 2.134186, 1, 1, 1, 1, 1,
1.131263, 0.5224503, -0.7101997, 1, 1, 1, 1, 1,
1.134621, -0.5549372, 0.2274368, 1, 1, 1, 1, 1,
1.134634, -0.8237078, 0.6960212, 1, 1, 1, 1, 1,
1.141473, -0.7678052, 2.6753, 1, 1, 1, 1, 1,
1.143313, -0.287823, 2.920112, 1, 1, 1, 1, 1,
1.144196, -0.4920927, 1.054382, 1, 1, 1, 1, 1,
1.146374, -1.9963, 3.516487, 0, 0, 1, 1, 1,
1.147555, -0.2267818, 0.8487399, 1, 0, 0, 1, 1,
1.147808, -0.2437033, 1.470872, 1, 0, 0, 1, 1,
1.152076, -0.5251093, 1.548514, 1, 0, 0, 1, 1,
1.152979, 0.06708757, 1.670951, 1, 0, 0, 1, 1,
1.17053, -0.8897358, 1.536681, 1, 0, 0, 1, 1,
1.178317, -0.3721449, 1.752396, 0, 0, 0, 1, 1,
1.182598, -1.035148, 3.452099, 0, 0, 0, 1, 1,
1.188425, -0.3846732, 3.684398, 0, 0, 0, 1, 1,
1.190366, 0.01068547, 1.735952, 0, 0, 0, 1, 1,
1.191784, 0.7998115, 1.933457, 0, 0, 0, 1, 1,
1.195951, -0.4777742, 0.2348271, 0, 0, 0, 1, 1,
1.207704, -0.3344916, 1.877679, 0, 0, 0, 1, 1,
1.236218, 0.7606648, -0.04237157, 1, 1, 1, 1, 1,
1.249671, 0.5091445, 2.188172, 1, 1, 1, 1, 1,
1.254656, -0.3579078, 2.745331, 1, 1, 1, 1, 1,
1.259441, 0.219952, 0.9280744, 1, 1, 1, 1, 1,
1.260651, -1.386447, 2.421072, 1, 1, 1, 1, 1,
1.276671, -0.3958572, 2.03394, 1, 1, 1, 1, 1,
1.277914, -0.7091087, 3.231146, 1, 1, 1, 1, 1,
1.280468, -0.5034267, 1.032213, 1, 1, 1, 1, 1,
1.281667, -1.728039, 3.967581, 1, 1, 1, 1, 1,
1.282812, 0.724792, 0.8580987, 1, 1, 1, 1, 1,
1.296242, -0.1712559, 3.141257, 1, 1, 1, 1, 1,
1.298519, -1.149162, 2.531625, 1, 1, 1, 1, 1,
1.312584, 1.167105, -0.6085786, 1, 1, 1, 1, 1,
1.316522, -0.3408934, 2.473779, 1, 1, 1, 1, 1,
1.328106, 1.291999, 2.485624, 1, 1, 1, 1, 1,
1.337687, -0.7296397, 1.302612, 0, 0, 1, 1, 1,
1.341662, -2.154943, 2.806548, 1, 0, 0, 1, 1,
1.346605, 0.1860738, 0.572902, 1, 0, 0, 1, 1,
1.348549, -0.06979316, 2.481472, 1, 0, 0, 1, 1,
1.350915, 1.148228, 0.4995017, 1, 0, 0, 1, 1,
1.35093, 0.626661, 1.436564, 1, 0, 0, 1, 1,
1.353169, 0.7585515, -0.0442017, 0, 0, 0, 1, 1,
1.35411, -1.69812, 2.875593, 0, 0, 0, 1, 1,
1.355596, -1.353084, 0.3974269, 0, 0, 0, 1, 1,
1.356615, 0.05217106, 2.006713, 0, 0, 0, 1, 1,
1.361321, 0.2461981, 0.2188484, 0, 0, 0, 1, 1,
1.362669, -0.8297449, 2.410888, 0, 0, 0, 1, 1,
1.373189, -0.9195106, 1.952651, 0, 0, 0, 1, 1,
1.375058, -2.285749, 2.287988, 1, 1, 1, 1, 1,
1.38942, -0.7202023, 2.384232, 1, 1, 1, 1, 1,
1.392144, 0.8685058, 0.95303, 1, 1, 1, 1, 1,
1.392705, 1.533413, 1.165439, 1, 1, 1, 1, 1,
1.401208, 1.442949, -0.7262681, 1, 1, 1, 1, 1,
1.403533, 0.9194616, 0.5444372, 1, 1, 1, 1, 1,
1.42017, -0.1364825, 3.06858, 1, 1, 1, 1, 1,
1.42181, -1.579016, 1.007487, 1, 1, 1, 1, 1,
1.421822, 0.7766892, 0.6447803, 1, 1, 1, 1, 1,
1.426537, -1.680662, 2.690717, 1, 1, 1, 1, 1,
1.427057, -0.1009195, 1.585179, 1, 1, 1, 1, 1,
1.441246, -0.34135, 0.5580719, 1, 1, 1, 1, 1,
1.444666, -1.396199, 2.654262, 1, 1, 1, 1, 1,
1.466387, -1.07019, 0.4976874, 1, 1, 1, 1, 1,
1.494267, -0.164823, 1.947743, 1, 1, 1, 1, 1,
1.500373, 0.7456014, 1.139126, 0, 0, 1, 1, 1,
1.508828, 0.1724667, 2.013331, 1, 0, 0, 1, 1,
1.512694, 0.7678789, 1.800113, 1, 0, 0, 1, 1,
1.516696, 0.3647986, 0.5344704, 1, 0, 0, 1, 1,
1.516908, 0.8975469, 0.01644039, 1, 0, 0, 1, 1,
1.526542, -1.042612, 0.06288559, 1, 0, 0, 1, 1,
1.543995, 2.447408, 1.29616, 0, 0, 0, 1, 1,
1.562558, 0.2126726, 0.3385667, 0, 0, 0, 1, 1,
1.562899, -0.2038163, 0.8962798, 0, 0, 0, 1, 1,
1.569508, -1.206208, 3.289766, 0, 0, 0, 1, 1,
1.582876, 1.193602, 1.373578, 0, 0, 0, 1, 1,
1.59184, -1.48356, 2.717332, 0, 0, 0, 1, 1,
1.592429, 1.201457, 0.9922459, 0, 0, 0, 1, 1,
1.601591, 0.711455, 1.234658, 1, 1, 1, 1, 1,
1.632993, 1.618204, 1.465564, 1, 1, 1, 1, 1,
1.640409, 0.6491958, 0.9034108, 1, 1, 1, 1, 1,
1.647214, -0.9223976, 3.878518, 1, 1, 1, 1, 1,
1.648256, 1.233302, 1.255146, 1, 1, 1, 1, 1,
1.655343, 0.5038502, 0.02802097, 1, 1, 1, 1, 1,
1.657709, 0.7631697, 1.653229, 1, 1, 1, 1, 1,
1.660555, -0.7402726, -0.75055, 1, 1, 1, 1, 1,
1.679567, 0.3770578, 1.392336, 1, 1, 1, 1, 1,
1.688843, -0.0990662, 2.327949, 1, 1, 1, 1, 1,
1.690869, 0.1060351, 0.7078361, 1, 1, 1, 1, 1,
1.709813, -0.3839058, 2.003726, 1, 1, 1, 1, 1,
1.719132, -0.5040223, 3.505213, 1, 1, 1, 1, 1,
1.721489, 1.441013, 1.146007, 1, 1, 1, 1, 1,
1.731752, 0.5334771, 2.14051, 1, 1, 1, 1, 1,
1.737173, 0.7381641, 4.226799, 0, 0, 1, 1, 1,
1.739219, -1.334152, 1.986351, 1, 0, 0, 1, 1,
1.741199, 1.848289, 2.346078, 1, 0, 0, 1, 1,
1.74972, -1.48023, 1.412828, 1, 0, 0, 1, 1,
1.75949, -0.0453932, 0.3745592, 1, 0, 0, 1, 1,
1.776734, -0.5463412, 1.671294, 1, 0, 0, 1, 1,
1.803424, 0.6231638, 1.278454, 0, 0, 0, 1, 1,
1.803642, -0.3969522, 3.951863, 0, 0, 0, 1, 1,
1.808889, -1.484129, 2.315947, 0, 0, 0, 1, 1,
1.813102, 0.2738918, 1.959491, 0, 0, 0, 1, 1,
1.813662, 0.4261728, 2.394506, 0, 0, 0, 1, 1,
1.821517, -0.485989, 2.734442, 0, 0, 0, 1, 1,
1.822924, 0.6094716, 2.037153, 0, 0, 0, 1, 1,
1.826629, -2.358167, 2.039008, 1, 1, 1, 1, 1,
1.833325, -1.613935, 4.282988, 1, 1, 1, 1, 1,
1.836208, 0.2088569, 2.468196, 1, 1, 1, 1, 1,
1.836251, -0.369154, 0.800927, 1, 1, 1, 1, 1,
1.85739, -1.446678, 3.489907, 1, 1, 1, 1, 1,
1.871931, -0.5964947, 1.787248, 1, 1, 1, 1, 1,
1.88027, 0.2751775, 2.812941, 1, 1, 1, 1, 1,
1.893439, -0.3086333, 1.533127, 1, 1, 1, 1, 1,
1.902865, 1.086758, 0.6121968, 1, 1, 1, 1, 1,
1.906377, 0.7514901, 2.213834, 1, 1, 1, 1, 1,
1.907958, 0.4111841, 0.7468479, 1, 1, 1, 1, 1,
1.930843, -0.9744682, 2.003247, 1, 1, 1, 1, 1,
1.95507, 0.1165477, 2.64667, 1, 1, 1, 1, 1,
2.000062, -0.4931245, 3.512475, 1, 1, 1, 1, 1,
2.0081, -1.563701, 0.9451109, 1, 1, 1, 1, 1,
2.02335, -0.2157249, 1.819891, 0, 0, 1, 1, 1,
2.072503, 0.0368324, 1.329276, 1, 0, 0, 1, 1,
2.085022, 0.1407021, 3.40705, 1, 0, 0, 1, 1,
2.085463, 0.9955716, 1.535452, 1, 0, 0, 1, 1,
2.104032, 1.061182, 0.5974483, 1, 0, 0, 1, 1,
2.109547, 0.6589465, 2.866953, 1, 0, 0, 1, 1,
2.136658, -1.403581, 1.759261, 0, 0, 0, 1, 1,
2.137388, -0.7575743, 1.522267, 0, 0, 0, 1, 1,
2.20863, -0.2463043, 1.489586, 0, 0, 0, 1, 1,
2.262935, -1.226891, 1.615946, 0, 0, 0, 1, 1,
2.279759, 1.677254, -0.1718026, 0, 0, 0, 1, 1,
2.365304, 1.04029, -0.3542325, 0, 0, 0, 1, 1,
2.447954, 0.541505, 0.2088572, 0, 0, 0, 1, 1,
2.482111, -2.054307, 0.727656, 1, 1, 1, 1, 1,
2.491812, 0.2986712, 2.295505, 1, 1, 1, 1, 1,
2.520591, 0.02310036, 1.224307, 1, 1, 1, 1, 1,
2.711383, 0.1533707, 1.915555, 1, 1, 1, 1, 1,
2.743303, -0.615248, 1.243922, 1, 1, 1, 1, 1,
2.749451, -0.08576266, 1.220633, 1, 1, 1, 1, 1,
3.116776, 1.448855, 2.272994, 1, 1, 1, 1, 1
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
var radius = 9.459035;
var distance = 33.22446;
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
mvMatrix.translate( 0.00335598, -0.07456207, -0.4912255 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.22446);
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
