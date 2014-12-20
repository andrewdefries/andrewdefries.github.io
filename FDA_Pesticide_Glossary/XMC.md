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
-3.053055, -0.1494068, -0.9724538, 1, 0, 0, 1,
-2.850299, 0.5040055, -1.521955, 1, 0.007843138, 0, 1,
-2.787025, 0.6637386, -2.09847, 1, 0.01176471, 0, 1,
-2.383649, -0.6358635, -1.945289, 1, 0.01960784, 0, 1,
-2.371036, 1.142529, -0.5028879, 1, 0.02352941, 0, 1,
-2.342242, 0.6604258, -0.4894587, 1, 0.03137255, 0, 1,
-2.292708, 1.35834, -0.06909802, 1, 0.03529412, 0, 1,
-2.238645, -0.5982579, -1.766817, 1, 0.04313726, 0, 1,
-2.236465, -2.259589, -2.05611, 1, 0.04705882, 0, 1,
-2.232122, -0.201388, -2.042876, 1, 0.05490196, 0, 1,
-2.219044, 0.1136743, -0.0474499, 1, 0.05882353, 0, 1,
-2.189751, 0.5219968, -0.1725536, 1, 0.06666667, 0, 1,
-2.168271, -1.016348, -1.776414, 1, 0.07058824, 0, 1,
-2.157146, 1.911924, -1.092377, 1, 0.07843138, 0, 1,
-2.139332, 0.5021646, -2.949885, 1, 0.08235294, 0, 1,
-2.110363, -0.7380863, -2.143785, 1, 0.09019608, 0, 1,
-2.081484, -0.697601, -0.247017, 1, 0.09411765, 0, 1,
-2.023566, 0.911578, -0.02238025, 1, 0.1019608, 0, 1,
-2.004587, -0.2864193, -0.2518717, 1, 0.1098039, 0, 1,
-1.94837, 0.1116636, -1.516876, 1, 0.1137255, 0, 1,
-1.932595, 0.3372876, -2.238509, 1, 0.1215686, 0, 1,
-1.930614, -1.306563, -3.463347, 1, 0.1254902, 0, 1,
-1.91906, -0.3851254, -1.021935, 1, 0.1333333, 0, 1,
-1.899621, 1.333554, 0.1961676, 1, 0.1372549, 0, 1,
-1.886747, -2.652841, -3.044159, 1, 0.145098, 0, 1,
-1.863345, 0.8016681, -0.8558845, 1, 0.1490196, 0, 1,
-1.839286, -0.4100968, -1.141003, 1, 0.1568628, 0, 1,
-1.83039, 1.54927, 1.084861, 1, 0.1607843, 0, 1,
-1.798337, -0.580185, -2.78045, 1, 0.1686275, 0, 1,
-1.782956, -0.005400776, -2.169759, 1, 0.172549, 0, 1,
-1.777394, 0.06575922, -0.8044533, 1, 0.1803922, 0, 1,
-1.768155, -1.290816, -1.82003, 1, 0.1843137, 0, 1,
-1.712825, -0.5265073, -2.308604, 1, 0.1921569, 0, 1,
-1.70328, 0.2018981, -1.499168, 1, 0.1960784, 0, 1,
-1.697731, -0.7007842, -0.1350729, 1, 0.2039216, 0, 1,
-1.696704, -0.7941638, -1.142521, 1, 0.2117647, 0, 1,
-1.685949, 0.02885839, -1.892103, 1, 0.2156863, 0, 1,
-1.669318, -0.6247689, -2.992355, 1, 0.2235294, 0, 1,
-1.666812, 0.5548819, -0.577755, 1, 0.227451, 0, 1,
-1.66204, -0.614677, -1.427887, 1, 0.2352941, 0, 1,
-1.660345, 2.165068, -2.198413, 1, 0.2392157, 0, 1,
-1.655173, -0.8406103, -3.182311, 1, 0.2470588, 0, 1,
-1.644691, -0.1810353, -1.247515, 1, 0.2509804, 0, 1,
-1.636965, 1.138645, -1.153739, 1, 0.2588235, 0, 1,
-1.612599, 1.451656, -1.016453, 1, 0.2627451, 0, 1,
-1.587795, -0.4449726, -1.792058, 1, 0.2705882, 0, 1,
-1.577378, -0.02662283, -2.327929, 1, 0.2745098, 0, 1,
-1.573068, -0.7697179, -2.078554, 1, 0.282353, 0, 1,
-1.568174, 1.719303, -1.217783, 1, 0.2862745, 0, 1,
-1.559367, 0.2257794, -1.071525, 1, 0.2941177, 0, 1,
-1.555574, -0.1692818, -1.391461, 1, 0.3019608, 0, 1,
-1.552906, 0.8355212, -1.729917, 1, 0.3058824, 0, 1,
-1.547219, -2.135534, -2.887096, 1, 0.3137255, 0, 1,
-1.535961, -0.0340534, -0.646643, 1, 0.3176471, 0, 1,
-1.531298, 0.7582087, -1.760511, 1, 0.3254902, 0, 1,
-1.514375, -0.6612212, -0.3795281, 1, 0.3294118, 0, 1,
-1.505909, 1.56577, -2.792243, 1, 0.3372549, 0, 1,
-1.503068, -0.2398098, -1.080478, 1, 0.3411765, 0, 1,
-1.500313, 0.1305416, -4.527527, 1, 0.3490196, 0, 1,
-1.496103, -1.253971, -1.223666, 1, 0.3529412, 0, 1,
-1.472898, 2.686888, 0.4722505, 1, 0.3607843, 0, 1,
-1.468457, -2.057112, -3.384368, 1, 0.3647059, 0, 1,
-1.46481, 1.470504, -2.174411, 1, 0.372549, 0, 1,
-1.46469, -0.09828925, -1.728031, 1, 0.3764706, 0, 1,
-1.447388, 0.9518385, -1.513719, 1, 0.3843137, 0, 1,
-1.447098, -0.4248692, -2.615009, 1, 0.3882353, 0, 1,
-1.442351, 2.132431, -1.0037, 1, 0.3960784, 0, 1,
-1.429493, 0.0936068, -2.974317, 1, 0.4039216, 0, 1,
-1.42207, -0.3645484, -1.391093, 1, 0.4078431, 0, 1,
-1.40759, -0.9411753, -2.28468, 1, 0.4156863, 0, 1,
-1.406625, -2.626775, -2.573878, 1, 0.4196078, 0, 1,
-1.386622, 1.200521, 1.133953, 1, 0.427451, 0, 1,
-1.383312, 0.8188976, -3.773535, 1, 0.4313726, 0, 1,
-1.374581, 0.2793666, 0.02652893, 1, 0.4392157, 0, 1,
-1.371878, -2.699092, -2.004263, 1, 0.4431373, 0, 1,
-1.364836, 0.2314471, -2.93598, 1, 0.4509804, 0, 1,
-1.362467, 0.410738, -1.216231, 1, 0.454902, 0, 1,
-1.359596, 0.05752755, -2.271256, 1, 0.4627451, 0, 1,
-1.357446, 1.002373, -0.1222381, 1, 0.4666667, 0, 1,
-1.354923, 1.342209, -1.106971, 1, 0.4745098, 0, 1,
-1.351059, 0.7275383, -1.485488, 1, 0.4784314, 0, 1,
-1.346182, -0.07466449, -2.707508, 1, 0.4862745, 0, 1,
-1.343955, 0.2814781, 1.148516, 1, 0.4901961, 0, 1,
-1.342668, -0.09618777, -3.66234, 1, 0.4980392, 0, 1,
-1.335027, 1.022912, -1.473267, 1, 0.5058824, 0, 1,
-1.322675, 0.5247408, 0.7535098, 1, 0.509804, 0, 1,
-1.319168, -0.1211823, -2.048851, 1, 0.5176471, 0, 1,
-1.319058, -0.6117147, -1.190828, 1, 0.5215687, 0, 1,
-1.318696, 0.5546498, -0.4227211, 1, 0.5294118, 0, 1,
-1.316898, -1.099782, -1.409879, 1, 0.5333334, 0, 1,
-1.299578, -0.893654, -1.445814, 1, 0.5411765, 0, 1,
-1.29626, 0.2155482, -2.134391, 1, 0.5450981, 0, 1,
-1.290016, -0.2515625, -2.256335, 1, 0.5529412, 0, 1,
-1.284693, -0.7021935, -2.079011, 1, 0.5568628, 0, 1,
-1.274764, -0.231279, -2.021067, 1, 0.5647059, 0, 1,
-1.26935, 0.8721584, 0.1486087, 1, 0.5686275, 0, 1,
-1.268188, 0.5958933, -1.230338, 1, 0.5764706, 0, 1,
-1.264557, 0.3111607, -1.924391, 1, 0.5803922, 0, 1,
-1.262279, 1.205021, 0.8071168, 1, 0.5882353, 0, 1,
-1.254499, 0.5580471, 0.2503324, 1, 0.5921569, 0, 1,
-1.251276, -1.135106, -1.59703, 1, 0.6, 0, 1,
-1.250084, -0.1847016, 0.3861725, 1, 0.6078432, 0, 1,
-1.244048, -0.0389545, 0.2696892, 1, 0.6117647, 0, 1,
-1.243783, 0.9365578, -1.008656, 1, 0.6196079, 0, 1,
-1.240743, 0.7490776, -1.374596, 1, 0.6235294, 0, 1,
-1.230925, 1.000944, -1.002181, 1, 0.6313726, 0, 1,
-1.227087, -0.9459289, -0.09135829, 1, 0.6352941, 0, 1,
-1.220027, -0.06907181, 1.042717, 1, 0.6431373, 0, 1,
-1.217333, 0.7360402, -1.92556, 1, 0.6470588, 0, 1,
-1.217323, -1.82609, -2.757463, 1, 0.654902, 0, 1,
-1.209796, 0.921743, -1.133248, 1, 0.6588235, 0, 1,
-1.207938, -0.7290192, -3.225079, 1, 0.6666667, 0, 1,
-1.203362, 0.7320407, -0.7740183, 1, 0.6705883, 0, 1,
-1.193544, -0.2379792, -3.18301, 1, 0.6784314, 0, 1,
-1.184384, -1.212879, -3.312627, 1, 0.682353, 0, 1,
-1.18161, 0.2807071, -0.9331728, 1, 0.6901961, 0, 1,
-1.174981, -0.482805, -1.994371, 1, 0.6941177, 0, 1,
-1.164919, 0.9255025, -0.4657067, 1, 0.7019608, 0, 1,
-1.159674, -3.116012, -4.395988, 1, 0.7098039, 0, 1,
-1.157899, 1.269132, 0.3488321, 1, 0.7137255, 0, 1,
-1.152637, -1.588403, -1.137362, 1, 0.7215686, 0, 1,
-1.151753, -1.719959, -1.033147, 1, 0.7254902, 0, 1,
-1.149012, 2.252686, -2.037442, 1, 0.7333333, 0, 1,
-1.14661, -0.6052271, -3.564976, 1, 0.7372549, 0, 1,
-1.128484, -1.764162, -3.804309, 1, 0.7450981, 0, 1,
-1.125433, -0.005919787, -1.545517, 1, 0.7490196, 0, 1,
-1.120961, -1.187235, -2.579774, 1, 0.7568628, 0, 1,
-1.108095, 0.2073519, -0.6856602, 1, 0.7607843, 0, 1,
-1.096134, -0.3613212, -1.253839, 1, 0.7686275, 0, 1,
-1.095485, 0.4541795, -0.5321422, 1, 0.772549, 0, 1,
-1.093263, 1.249658, 1.130067, 1, 0.7803922, 0, 1,
-1.092297, -0.875946, -2.08611, 1, 0.7843137, 0, 1,
-1.090646, 1.180396, -0.2388886, 1, 0.7921569, 0, 1,
-1.089905, 1.179403, -2.164304, 1, 0.7960784, 0, 1,
-1.088035, 0.1600451, -0.4476701, 1, 0.8039216, 0, 1,
-1.085955, 0.5750493, -0.1439381, 1, 0.8117647, 0, 1,
-1.084262, -1.606184, -0.7996579, 1, 0.8156863, 0, 1,
-1.07973, -0.3817613, 0.4648905, 1, 0.8235294, 0, 1,
-1.079146, -1.103594, -2.020089, 1, 0.827451, 0, 1,
-1.074796, 0.430897, -0.3429014, 1, 0.8352941, 0, 1,
-1.069913, 0.6206851, -1.500663, 1, 0.8392157, 0, 1,
-1.068844, -0.1817713, -3.02782, 1, 0.8470588, 0, 1,
-1.068583, 0.1783895, -1.049291, 1, 0.8509804, 0, 1,
-1.067536, 0.9133271, -1.761652, 1, 0.8588235, 0, 1,
-1.060552, -0.06970534, -0.6862313, 1, 0.8627451, 0, 1,
-1.055194, 0.3535497, 1.05766, 1, 0.8705882, 0, 1,
-1.05455, -0.85821, -2.122382, 1, 0.8745098, 0, 1,
-1.053635, 0.1956516, -0.05756024, 1, 0.8823529, 0, 1,
-1.052232, -0.01600967, -0.7973806, 1, 0.8862745, 0, 1,
-1.041767, 0.9795138, -1.529078, 1, 0.8941177, 0, 1,
-1.032102, -0.7094927, -1.091494, 1, 0.8980392, 0, 1,
-1.031217, -1.221731, -2.252272, 1, 0.9058824, 0, 1,
-1.019807, -0.5720103, -1.778097, 1, 0.9137255, 0, 1,
-1.01516, -0.1962591, -2.965487, 1, 0.9176471, 0, 1,
-1.012551, -0.4503224, -2.060705, 1, 0.9254902, 0, 1,
-1.008667, -0.2782841, -2.077946, 1, 0.9294118, 0, 1,
-1.00526, -1.307637, -1.947989, 1, 0.9372549, 0, 1,
-1.002035, -0.8726709, -0.6817981, 1, 0.9411765, 0, 1,
-0.9872383, -0.1662691, -2.429213, 1, 0.9490196, 0, 1,
-0.9856492, 1.635346, 0.7923556, 1, 0.9529412, 0, 1,
-0.985597, 0.2213621, -1.156788, 1, 0.9607843, 0, 1,
-0.9813485, -0.3910948, -2.963421, 1, 0.9647059, 0, 1,
-0.9796353, 0.4416986, -1.355919, 1, 0.972549, 0, 1,
-0.9795957, -0.2271055, -3.241936, 1, 0.9764706, 0, 1,
-0.9753309, -0.973138, -2.917661, 1, 0.9843137, 0, 1,
-0.9734055, 2.247062, -0.04570223, 1, 0.9882353, 0, 1,
-0.97224, 1.234673, -1.89208, 1, 0.9960784, 0, 1,
-0.9663744, 2.041759, -0.4751603, 0.9960784, 1, 0, 1,
-0.9613969, 0.1097084, -0.7120389, 0.9921569, 1, 0, 1,
-0.9596568, -0.5863793, -1.581353, 0.9843137, 1, 0, 1,
-0.9562652, -0.1579614, 0.4382124, 0.9803922, 1, 0, 1,
-0.9467027, -0.1221183, -3.894356, 0.972549, 1, 0, 1,
-0.9434198, 0.2485832, -0.3592449, 0.9686275, 1, 0, 1,
-0.9365817, -0.6013792, -2.841224, 0.9607843, 1, 0, 1,
-0.9353359, 1.778604, -0.5284964, 0.9568627, 1, 0, 1,
-0.9276624, 0.6118436, -0.4243474, 0.9490196, 1, 0, 1,
-0.9218231, 0.7898529, -2.762485, 0.945098, 1, 0, 1,
-0.9208412, 1.390943, -0.5357439, 0.9372549, 1, 0, 1,
-0.9203151, 0.8568568, -1.854648, 0.9333333, 1, 0, 1,
-0.918076, 0.1304038, -0.9459687, 0.9254902, 1, 0, 1,
-0.9152323, -0.04505903, -2.841671, 0.9215686, 1, 0, 1,
-0.9083594, 0.2799188, -1.344866, 0.9137255, 1, 0, 1,
-0.9063934, 0.2904683, -1.953964, 0.9098039, 1, 0, 1,
-0.8992586, -1.538823, -1.581983, 0.9019608, 1, 0, 1,
-0.8980658, -1.210915, -1.760496, 0.8941177, 1, 0, 1,
-0.8966689, 1.28368, -0.9693081, 0.8901961, 1, 0, 1,
-0.8953658, 0.5872446, -1.701057, 0.8823529, 1, 0, 1,
-0.8929687, 0.311952, -1.465851, 0.8784314, 1, 0, 1,
-0.8824136, 0.7573035, -1.00053, 0.8705882, 1, 0, 1,
-0.8790707, -0.3866469, -0.8565062, 0.8666667, 1, 0, 1,
-0.8763356, 0.8360305, -0.9929096, 0.8588235, 1, 0, 1,
-0.8745928, -2.366069, -3.94941, 0.854902, 1, 0, 1,
-0.8714508, -0.1836043, -1.406455, 0.8470588, 1, 0, 1,
-0.8677293, -0.6864209, -3.043653, 0.8431373, 1, 0, 1,
-0.8648157, 0.8280793, 0.5186375, 0.8352941, 1, 0, 1,
-0.8578443, 0.1601906, -1.246874, 0.8313726, 1, 0, 1,
-0.8529868, -1.026414, -2.232701, 0.8235294, 1, 0, 1,
-0.8525161, -0.2542774, -1.036325, 0.8196079, 1, 0, 1,
-0.8431499, 0.4869055, -1.921375, 0.8117647, 1, 0, 1,
-0.8408298, -2.050783, -5.397386, 0.8078431, 1, 0, 1,
-0.8383366, 0.1951379, -1.093241, 0.8, 1, 0, 1,
-0.8369789, 0.2067313, -1.146835, 0.7921569, 1, 0, 1,
-0.8367808, -0.6731837, -3.852318, 0.7882353, 1, 0, 1,
-0.8342612, -0.7442727, -2.469728, 0.7803922, 1, 0, 1,
-0.818654, 0.8868763, 0.0127833, 0.7764706, 1, 0, 1,
-0.8173101, -0.04553989, -2.435689, 0.7686275, 1, 0, 1,
-0.8149732, -0.260305, -1.570289, 0.7647059, 1, 0, 1,
-0.8102053, -0.4768462, -3.179444, 0.7568628, 1, 0, 1,
-0.8101921, -0.731012, -3.314333, 0.7529412, 1, 0, 1,
-0.8097866, 0.2865441, -0.05279871, 0.7450981, 1, 0, 1,
-0.8076563, 1.524224, 1.924309, 0.7411765, 1, 0, 1,
-0.8020931, -1.199902, -4.20751, 0.7333333, 1, 0, 1,
-0.7990595, 0.7622229, -1.302189, 0.7294118, 1, 0, 1,
-0.7984454, -0.1065851, -3.084488, 0.7215686, 1, 0, 1,
-0.7980568, 0.3896482, -1.307995, 0.7176471, 1, 0, 1,
-0.7980298, 0.6098686, 0.3942933, 0.7098039, 1, 0, 1,
-0.7926532, 0.03431164, -2.364575, 0.7058824, 1, 0, 1,
-0.7899907, -0.64721, -2.660974, 0.6980392, 1, 0, 1,
-0.7872903, 0.1008103, -1.009587, 0.6901961, 1, 0, 1,
-0.7867049, 0.6123372, -2.160441, 0.6862745, 1, 0, 1,
-0.7865966, -1.601756, -1.920775, 0.6784314, 1, 0, 1,
-0.7864431, -0.374591, -2.117754, 0.6745098, 1, 0, 1,
-0.7859235, -0.8352072, -3.111058, 0.6666667, 1, 0, 1,
-0.7838746, -0.1792127, -2.375559, 0.6627451, 1, 0, 1,
-0.7820454, 1.281297, 1.380234, 0.654902, 1, 0, 1,
-0.7813948, -1.071059, -2.960203, 0.6509804, 1, 0, 1,
-0.7794671, 1.487115, -0.8497023, 0.6431373, 1, 0, 1,
-0.7722223, -0.9967945, -4.009671, 0.6392157, 1, 0, 1,
-0.7698964, 0.3175693, -0.4248073, 0.6313726, 1, 0, 1,
-0.7693084, 1.218407, -1.309667, 0.627451, 1, 0, 1,
-0.7685581, -1.055546, -2.945265, 0.6196079, 1, 0, 1,
-0.7645809, 0.8368229, -1.521524, 0.6156863, 1, 0, 1,
-0.7630237, -1.184247, -2.31096, 0.6078432, 1, 0, 1,
-0.7564207, -0.2984775, -1.336448, 0.6039216, 1, 0, 1,
-0.7527639, -0.5812035, -1.933615, 0.5960785, 1, 0, 1,
-0.7523353, 0.4275931, -2.602445, 0.5882353, 1, 0, 1,
-0.741261, 0.3969755, -0.2163238, 0.5843138, 1, 0, 1,
-0.7403631, 0.220874, -0.2732478, 0.5764706, 1, 0, 1,
-0.7363671, -0.7299294, -4.265397, 0.572549, 1, 0, 1,
-0.7358561, 1.506223, -0.6536629, 0.5647059, 1, 0, 1,
-0.7331612, 0.508473, -2.601235, 0.5607843, 1, 0, 1,
-0.730796, 1.422807, -2.067879, 0.5529412, 1, 0, 1,
-0.729516, -0.3090153, -2.129003, 0.5490196, 1, 0, 1,
-0.7291259, 1.516494, 0.6330982, 0.5411765, 1, 0, 1,
-0.723946, 0.2105691, -2.351268, 0.5372549, 1, 0, 1,
-0.7218187, 1.213313, 0.9330995, 0.5294118, 1, 0, 1,
-0.7161556, -0.033491, -1.473723, 0.5254902, 1, 0, 1,
-0.7126808, -0.7453245, -3.994292, 0.5176471, 1, 0, 1,
-0.7113613, -0.7575042, -1.012482, 0.5137255, 1, 0, 1,
-0.7110401, 1.729472, -0.2367503, 0.5058824, 1, 0, 1,
-0.7057959, 0.06536731, -3.28119, 0.5019608, 1, 0, 1,
-0.7031494, 0.2791374, -2.752578, 0.4941176, 1, 0, 1,
-0.7006205, 0.2671492, -0.8030082, 0.4862745, 1, 0, 1,
-0.6989778, 0.1755598, -1.168826, 0.4823529, 1, 0, 1,
-0.6977187, 0.6832348, -1.715671, 0.4745098, 1, 0, 1,
-0.6944991, 0.2088847, -0.3786546, 0.4705882, 1, 0, 1,
-0.6858101, 0.144903, -2.651202, 0.4627451, 1, 0, 1,
-0.6782351, 1.748533, 0.4414918, 0.4588235, 1, 0, 1,
-0.6774892, 0.1906434, -1.911777, 0.4509804, 1, 0, 1,
-0.6772423, 1.077445, -0.3926982, 0.4470588, 1, 0, 1,
-0.6759762, -1.035924, -2.971936, 0.4392157, 1, 0, 1,
-0.673755, 0.9923813, -0.8086606, 0.4352941, 1, 0, 1,
-0.6707973, 0.5438123, -1.470523, 0.427451, 1, 0, 1,
-0.6705657, 0.7921702, -0.9655811, 0.4235294, 1, 0, 1,
-0.6657533, -0.3107359, -1.794384, 0.4156863, 1, 0, 1,
-0.6632817, 1.118637, -1.041955, 0.4117647, 1, 0, 1,
-0.6624936, 0.7150479, 1.420825, 0.4039216, 1, 0, 1,
-0.6613839, -2.591258, -1.341522, 0.3960784, 1, 0, 1,
-0.6587287, 0.435046, -1.600406, 0.3921569, 1, 0, 1,
-0.652801, -0.3092169, -2.019345, 0.3843137, 1, 0, 1,
-0.6482994, -0.2094742, -0.3512473, 0.3803922, 1, 0, 1,
-0.6479452, 1.536797, -0.3260446, 0.372549, 1, 0, 1,
-0.6446154, 0.692173, -0.2296828, 0.3686275, 1, 0, 1,
-0.642141, 0.5004894, -0.4600856, 0.3607843, 1, 0, 1,
-0.6388611, -1.399374, -2.85329, 0.3568628, 1, 0, 1,
-0.6378295, 0.3743327, -0.5190317, 0.3490196, 1, 0, 1,
-0.6341431, 0.1712035, -0.1484501, 0.345098, 1, 0, 1,
-0.6289853, -0.8892563, -2.842485, 0.3372549, 1, 0, 1,
-0.6289287, -0.1362273, -1.605987, 0.3333333, 1, 0, 1,
-0.6284903, -1.091825, -0.8289756, 0.3254902, 1, 0, 1,
-0.6241123, 0.2852169, -1.299469, 0.3215686, 1, 0, 1,
-0.6214066, -0.9370652, -0.01111387, 0.3137255, 1, 0, 1,
-0.6212105, -0.07903438, -0.3252181, 0.3098039, 1, 0, 1,
-0.6181656, 0.6082404, -0.5763835, 0.3019608, 1, 0, 1,
-0.6166394, 0.2563433, -1.862934, 0.2941177, 1, 0, 1,
-0.6158995, -0.8284189, -0.4160697, 0.2901961, 1, 0, 1,
-0.6110934, 0.767333, 0.3753187, 0.282353, 1, 0, 1,
-0.6109781, 2.130346, -0.381124, 0.2784314, 1, 0, 1,
-0.6016774, -0.9028355, -4.496159, 0.2705882, 1, 0, 1,
-0.6009448, -0.1348316, -4.177713, 0.2666667, 1, 0, 1,
-0.5996862, 1.066292, 0.3221547, 0.2588235, 1, 0, 1,
-0.5992631, 1.218122, 0.04624397, 0.254902, 1, 0, 1,
-0.5990633, 1.018853, 0.5749767, 0.2470588, 1, 0, 1,
-0.5988224, 1.604081, -0.6772528, 0.2431373, 1, 0, 1,
-0.5951084, -0.08851373, -1.165795, 0.2352941, 1, 0, 1,
-0.5906032, 0.7387913, -0.9387935, 0.2313726, 1, 0, 1,
-0.5905014, -0.0981805, -2.925197, 0.2235294, 1, 0, 1,
-0.58731, -0.963755, -2.656269, 0.2196078, 1, 0, 1,
-0.5872836, -0.6651447, -1.672723, 0.2117647, 1, 0, 1,
-0.5759818, -0.983761, -1.622134, 0.2078431, 1, 0, 1,
-0.5755162, -0.0217666, 0.361576, 0.2, 1, 0, 1,
-0.5741009, -1.34939, -4.069688, 0.1921569, 1, 0, 1,
-0.5696414, -0.912965, -0.3040166, 0.1882353, 1, 0, 1,
-0.569493, -1.086345, -0.6431957, 0.1803922, 1, 0, 1,
-0.566642, 0.6795624, 0.2625973, 0.1764706, 1, 0, 1,
-0.5630466, 0.7234372, -0.611821, 0.1686275, 1, 0, 1,
-0.5604523, 0.03215738, -0.6933155, 0.1647059, 1, 0, 1,
-0.5593285, -0.9976222, -2.76335, 0.1568628, 1, 0, 1,
-0.5563149, 0.4857448, -2.012626, 0.1529412, 1, 0, 1,
-0.5559322, -0.2924384, -2.955223, 0.145098, 1, 0, 1,
-0.5559286, -1.857289, -2.689175, 0.1411765, 1, 0, 1,
-0.5539372, -1.102416, -2.714095, 0.1333333, 1, 0, 1,
-0.5535685, 0.4161184, -0.1678605, 0.1294118, 1, 0, 1,
-0.5486915, -1.090963, -2.614917, 0.1215686, 1, 0, 1,
-0.5484402, -1.260952, -3.040177, 0.1176471, 1, 0, 1,
-0.5462599, -0.01512781, -1.890332, 0.1098039, 1, 0, 1,
-0.5418084, 0.6128426, 0.2763981, 0.1058824, 1, 0, 1,
-0.5400552, -2.671824, -2.592052, 0.09803922, 1, 0, 1,
-0.5314316, 0.8788819, -0.3930329, 0.09019608, 1, 0, 1,
-0.5294214, -0.4778858, -1.368532, 0.08627451, 1, 0, 1,
-0.5283005, 0.3225987, -2.319406, 0.07843138, 1, 0, 1,
-0.5220073, -0.6435165, -3.730934, 0.07450981, 1, 0, 1,
-0.5205328, 0.4291238, 0.5212064, 0.06666667, 1, 0, 1,
-0.5185343, 0.3932558, -0.1199658, 0.0627451, 1, 0, 1,
-0.5161161, 1.581758, 0.2965309, 0.05490196, 1, 0, 1,
-0.5154659, 0.1408918, -2.818547, 0.05098039, 1, 0, 1,
-0.5138883, -3.705391, -3.957266, 0.04313726, 1, 0, 1,
-0.5137069, 2.02415, 1.461515, 0.03921569, 1, 0, 1,
-0.5092635, 0.09724369, -0.5823621, 0.03137255, 1, 0, 1,
-0.5042829, -1.238882, -4.839163, 0.02745098, 1, 0, 1,
-0.5032431, 0.5250403, 0.3694572, 0.01960784, 1, 0, 1,
-0.4982767, -1.047924, -4.113491, 0.01568628, 1, 0, 1,
-0.4979007, -0.4605412, -2.757956, 0.007843138, 1, 0, 1,
-0.4919084, 1.12799, 1.242958, 0.003921569, 1, 0, 1,
-0.4918952, 1.043755, 1.686111, 0, 1, 0.003921569, 1,
-0.4871178, 0.7929083, 0.558353, 0, 1, 0.01176471, 1,
-0.4828737, -0.0107802, -1.281499, 0, 1, 0.01568628, 1,
-0.4752054, -1.250467, -3.689847, 0, 1, 0.02352941, 1,
-0.4679261, -0.1732776, -0.6400844, 0, 1, 0.02745098, 1,
-0.4669382, -1.491707, -3.399913, 0, 1, 0.03529412, 1,
-0.4664244, -0.3679022, -2.253632, 0, 1, 0.03921569, 1,
-0.4519423, -1.564684, -1.215714, 0, 1, 0.04705882, 1,
-0.4511406, -1.626518, -4.535627, 0, 1, 0.05098039, 1,
-0.4460727, -0.1790144, -3.713518, 0, 1, 0.05882353, 1,
-0.4443684, 0.6426415, -0.1727583, 0, 1, 0.0627451, 1,
-0.4429329, 0.6596739, -0.5851672, 0, 1, 0.07058824, 1,
-0.4394675, -0.3687579, -1.705014, 0, 1, 0.07450981, 1,
-0.4384367, -1.682763, -3.123953, 0, 1, 0.08235294, 1,
-0.4380527, -0.06891915, -0.1732891, 0, 1, 0.08627451, 1,
-0.4365489, 1.023077, -0.1115622, 0, 1, 0.09411765, 1,
-0.4311523, 0.3557734, -2.061913, 0, 1, 0.1019608, 1,
-0.4295137, -0.02723383, -0.9474114, 0, 1, 0.1058824, 1,
-0.4273789, -0.2041261, -3.111679, 0, 1, 0.1137255, 1,
-0.4215357, 0.2865005, -1.570864, 0, 1, 0.1176471, 1,
-0.4207199, 1.603399, -1.843579, 0, 1, 0.1254902, 1,
-0.4206466, 0.1769233, -1.414526, 0, 1, 0.1294118, 1,
-0.4203115, -0.783114, -2.715333, 0, 1, 0.1372549, 1,
-0.4175064, 2.282817, 0.3639069, 0, 1, 0.1411765, 1,
-0.413032, 0.2164246, -0.7305028, 0, 1, 0.1490196, 1,
-0.4111035, 0.2335333, -1.811204, 0, 1, 0.1529412, 1,
-0.408182, -0.06368098, -1.424775, 0, 1, 0.1607843, 1,
-0.4056752, -0.5827802, -1.152937, 0, 1, 0.1647059, 1,
-0.4048025, -1.441126, -3.302157, 0, 1, 0.172549, 1,
-0.4033386, 2.038188, 0.07052866, 0, 1, 0.1764706, 1,
-0.3966548, 0.2536696, -2.378917, 0, 1, 0.1843137, 1,
-0.3961878, -1.885701, -2.219047, 0, 1, 0.1882353, 1,
-0.3940322, 1.235227, 0.7527688, 0, 1, 0.1960784, 1,
-0.3933654, 0.4490292, -0.09294727, 0, 1, 0.2039216, 1,
-0.391362, -0.5889555, -2.786831, 0, 1, 0.2078431, 1,
-0.3882773, 0.02865368, -3.744747, 0, 1, 0.2156863, 1,
-0.3831547, 1.067903, 0.4360535, 0, 1, 0.2196078, 1,
-0.381846, -0.792841, -2.662837, 0, 1, 0.227451, 1,
-0.3786069, 0.03815251, -3.000121, 0, 1, 0.2313726, 1,
-0.3747461, 1.84022, 0.4689423, 0, 1, 0.2392157, 1,
-0.373458, -0.7855766, -2.633657, 0, 1, 0.2431373, 1,
-0.3682198, -0.06556204, -1.574503, 0, 1, 0.2509804, 1,
-0.361037, 1.007178, -0.6852888, 0, 1, 0.254902, 1,
-0.3566375, -0.9974263, -2.712602, 0, 1, 0.2627451, 1,
-0.3546018, 1.896898, 1.412531, 0, 1, 0.2666667, 1,
-0.3530857, -0.5218211, -2.365106, 0, 1, 0.2745098, 1,
-0.3521415, 0.1906864, -0.9239033, 0, 1, 0.2784314, 1,
-0.3487505, -0.6449402, -1.717237, 0, 1, 0.2862745, 1,
-0.348241, -0.0979934, -0.8460124, 0, 1, 0.2901961, 1,
-0.3377633, 1.558726, 0.3484044, 0, 1, 0.2980392, 1,
-0.3302938, 0.1789695, -1.390457, 0, 1, 0.3058824, 1,
-0.3270668, -1.034752, -2.004252, 0, 1, 0.3098039, 1,
-0.32478, 0.9864953, -0.327543, 0, 1, 0.3176471, 1,
-0.3232957, -1.247299, -3.792207, 0, 1, 0.3215686, 1,
-0.3195827, 0.2418513, -2.126365, 0, 1, 0.3294118, 1,
-0.3156519, -1.708546, -3.560011, 0, 1, 0.3333333, 1,
-0.3102629, -1.186437, -3.530847, 0, 1, 0.3411765, 1,
-0.3065663, -1.094867, -1.722893, 0, 1, 0.345098, 1,
-0.2958639, 0.5361739, -0.5699088, 0, 1, 0.3529412, 1,
-0.2954603, 0.6928653, -1.2125, 0, 1, 0.3568628, 1,
-0.294535, -1.875245, -1.686028, 0, 1, 0.3647059, 1,
-0.2929833, 0.1658878, -2.440728, 0, 1, 0.3686275, 1,
-0.2898331, -0.04481761, -2.586572, 0, 1, 0.3764706, 1,
-0.2799392, -1.026714, -4.565392, 0, 1, 0.3803922, 1,
-0.2781579, -1.001222, -2.334311, 0, 1, 0.3882353, 1,
-0.2780848, -1.375086, -2.231403, 0, 1, 0.3921569, 1,
-0.2779475, -0.2823366, -0.8763419, 0, 1, 0.4, 1,
-0.2754899, -1.489198, -1.009886, 0, 1, 0.4078431, 1,
-0.2750288, 0.2537643, -0.651793, 0, 1, 0.4117647, 1,
-0.2739491, 0.5948498, -0.2009228, 0, 1, 0.4196078, 1,
-0.2724543, -0.1507126, -2.892647, 0, 1, 0.4235294, 1,
-0.2672226, -0.5831159, -3.735774, 0, 1, 0.4313726, 1,
-0.2661648, -0.5626847, -2.729534, 0, 1, 0.4352941, 1,
-0.2656492, -0.4489837, -3.532313, 0, 1, 0.4431373, 1,
-0.2651045, 0.519356, -0.2197442, 0, 1, 0.4470588, 1,
-0.264674, 0.4419953, -0.5478745, 0, 1, 0.454902, 1,
-0.2644856, 0.2705429, -3.011177, 0, 1, 0.4588235, 1,
-0.2632715, 1.030116, -0.1644151, 0, 1, 0.4666667, 1,
-0.2623937, -1.189922, -4.10148, 0, 1, 0.4705882, 1,
-0.2594114, -0.3909783, -2.959203, 0, 1, 0.4784314, 1,
-0.2592365, -1.092016, -2.943093, 0, 1, 0.4823529, 1,
-0.2587265, 0.4420144, -1.036991, 0, 1, 0.4901961, 1,
-0.2569485, -0.05612316, -3.273422, 0, 1, 0.4941176, 1,
-0.2561951, -1.686253, -3.88616, 0, 1, 0.5019608, 1,
-0.2487048, 0.5296156, -0.03032437, 0, 1, 0.509804, 1,
-0.2483054, -0.6065096, -3.7317, 0, 1, 0.5137255, 1,
-0.2467742, -1.288664, -4.35291, 0, 1, 0.5215687, 1,
-0.2370492, 0.6026803, -1.76461, 0, 1, 0.5254902, 1,
-0.233718, 0.6824722, -0.4437199, 0, 1, 0.5333334, 1,
-0.2336958, -0.2591118, -4.59448, 0, 1, 0.5372549, 1,
-0.2330041, -0.395681, -3.077657, 0, 1, 0.5450981, 1,
-0.2317192, -0.4619689, -3.858617, 0, 1, 0.5490196, 1,
-0.2292831, 2.808399, -1.693363, 0, 1, 0.5568628, 1,
-0.2263607, 2.593509, -1.286126, 0, 1, 0.5607843, 1,
-0.2231336, -0.6825356, -2.269701, 0, 1, 0.5686275, 1,
-0.2220915, 0.2566968, -0.7083541, 0, 1, 0.572549, 1,
-0.2198294, -2.011214, -3.590861, 0, 1, 0.5803922, 1,
-0.2184066, 1.863849, -0.4978164, 0, 1, 0.5843138, 1,
-0.2141445, -0.03407219, -2.369979, 0, 1, 0.5921569, 1,
-0.2119275, -0.7246543, -2.713709, 0, 1, 0.5960785, 1,
-0.2088663, -1.235773, -3.413956, 0, 1, 0.6039216, 1,
-0.2083659, 1.555241, -0.4080348, 0, 1, 0.6117647, 1,
-0.2057891, 1.30357, -0.1741526, 0, 1, 0.6156863, 1,
-0.1991406, 1.255083, -0.6654841, 0, 1, 0.6235294, 1,
-0.1935218, 1.410343, 0.5732468, 0, 1, 0.627451, 1,
-0.1928239, -1.067329, -3.881761, 0, 1, 0.6352941, 1,
-0.1837537, 0.3884228, -1.587995, 0, 1, 0.6392157, 1,
-0.181372, 0.2173329, -1.056083, 0, 1, 0.6470588, 1,
-0.1782201, 1.078369, -1.347038, 0, 1, 0.6509804, 1,
-0.1730112, 1.286285, 1.170736, 0, 1, 0.6588235, 1,
-0.1657954, 0.2657137, -1.731194, 0, 1, 0.6627451, 1,
-0.1656815, 1.189404, 0.7940313, 0, 1, 0.6705883, 1,
-0.1654552, 2.606406, -1.59494, 0, 1, 0.6745098, 1,
-0.1652168, 0.007798053, 0.7074668, 0, 1, 0.682353, 1,
-0.1635091, -0.9193994, -0.08716708, 0, 1, 0.6862745, 1,
-0.1627593, 0.3224297, 1.623821, 0, 1, 0.6941177, 1,
-0.1618339, -2.480869, -3.536233, 0, 1, 0.7019608, 1,
-0.1616583, 0.5297717, -0.05779103, 0, 1, 0.7058824, 1,
-0.1598121, 0.5982426, 0.9851762, 0, 1, 0.7137255, 1,
-0.1573565, 1.176256, -0.723978, 0, 1, 0.7176471, 1,
-0.1537567, 0.6632671, -0.7558861, 0, 1, 0.7254902, 1,
-0.1505617, -1.189835, -2.144793, 0, 1, 0.7294118, 1,
-0.1468196, -0.2009096, -5.785961, 0, 1, 0.7372549, 1,
-0.1415002, 1.322017, 1.360338, 0, 1, 0.7411765, 1,
-0.1403422, -0.6176738, -1.872866, 0, 1, 0.7490196, 1,
-0.1389207, 1.13328, -1.290013, 0, 1, 0.7529412, 1,
-0.1378803, 0.6702633, -0.3381331, 0, 1, 0.7607843, 1,
-0.1323396, -2.303206, -1.45749, 0, 1, 0.7647059, 1,
-0.1312729, 0.9602177, 0.2844679, 0, 1, 0.772549, 1,
-0.1288006, 0.7478358, -0.5801123, 0, 1, 0.7764706, 1,
-0.1263707, -1.276591, -3.385599, 0, 1, 0.7843137, 1,
-0.1207699, -0.9536751, -4.843634, 0, 1, 0.7882353, 1,
-0.1202808, -1.200064, -3.186529, 0, 1, 0.7960784, 1,
-0.1184292, 0.5778607, -1.521487, 0, 1, 0.8039216, 1,
-0.1126081, -1.13043, -3.482662, 0, 1, 0.8078431, 1,
-0.1087383, 0.9384077, 0.6951951, 0, 1, 0.8156863, 1,
-0.1083248, -0.7229167, -4.016382, 0, 1, 0.8196079, 1,
-0.1075131, -1.355873, -2.367868, 0, 1, 0.827451, 1,
-0.1018981, -1.858298, -2.390357, 0, 1, 0.8313726, 1,
-0.1008276, -0.1364478, -4.20252, 0, 1, 0.8392157, 1,
-0.09995988, 1.381883, 0.5665476, 0, 1, 0.8431373, 1,
-0.09790825, 0.5825698, -1.186226, 0, 1, 0.8509804, 1,
-0.09789626, -1.236021, -4.366593, 0, 1, 0.854902, 1,
-0.09554603, -0.8347759, -4.237996, 0, 1, 0.8627451, 1,
-0.09420748, 0.6143267, -0.8856966, 0, 1, 0.8666667, 1,
-0.0923404, 0.8993852, -1.106981, 0, 1, 0.8745098, 1,
-0.09108341, 0.9152322, -0.03917072, 0, 1, 0.8784314, 1,
-0.08940877, 0.4714638, -0.9413584, 0, 1, 0.8862745, 1,
-0.08931042, -1.052606, -1.94134, 0, 1, 0.8901961, 1,
-0.0881517, 0.7672886, 1.016625, 0, 1, 0.8980392, 1,
-0.08667028, 1.11756, 0.3544773, 0, 1, 0.9058824, 1,
-0.08603397, -0.1793602, -0.8907869, 0, 1, 0.9098039, 1,
-0.08107834, 0.01062512, -3.713307, 0, 1, 0.9176471, 1,
-0.08088271, -0.4907782, -3.146133, 0, 1, 0.9215686, 1,
-0.08045638, -1.373079, -3.96225, 0, 1, 0.9294118, 1,
-0.06943368, -0.3364473, -1.545574, 0, 1, 0.9333333, 1,
-0.06795373, 0.7743589, -0.9995908, 0, 1, 0.9411765, 1,
-0.06608965, 0.7995692, -0.9650291, 0, 1, 0.945098, 1,
-0.05986917, -0.238975, -2.592788, 0, 1, 0.9529412, 1,
-0.05648476, 1.353191, 0.5191563, 0, 1, 0.9568627, 1,
-0.05629439, 1.511569, -1.116157, 0, 1, 0.9647059, 1,
-0.05531216, -0.2500425, -2.743817, 0, 1, 0.9686275, 1,
-0.05413251, 0.2482894, 1.650291, 0, 1, 0.9764706, 1,
-0.05369375, 0.4487593, -2.257128, 0, 1, 0.9803922, 1,
-0.04832869, 0.3208518, -0.751498, 0, 1, 0.9882353, 1,
-0.04798282, 0.4230584, -0.3655638, 0, 1, 0.9921569, 1,
-0.04709301, -1.441534, -1.916222, 0, 1, 1, 1,
-0.04411321, 0.5731567, -0.01198561, 0, 0.9921569, 1, 1,
-0.04393651, -0.8313257, -3.095653, 0, 0.9882353, 1, 1,
-0.04268424, -1.494796, -3.473698, 0, 0.9803922, 1, 1,
-0.04081809, -0.0123109, -2.472256, 0, 0.9764706, 1, 1,
-0.04041264, 0.002777526, -1.650425, 0, 0.9686275, 1, 1,
-0.03472007, 0.5922967, -1.9801, 0, 0.9647059, 1, 1,
-0.03418066, 0.4552776, 0.3073771, 0, 0.9568627, 1, 1,
-0.0293582, 0.9051284, -1.217551, 0, 0.9529412, 1, 1,
-0.02642112, 1.404973, -1.339605, 0, 0.945098, 1, 1,
-0.02282948, 0.9146011, -1.380289, 0, 0.9411765, 1, 1,
-0.02046616, 1.576825, 0.5988556, 0, 0.9333333, 1, 1,
-0.01750733, 0.3807847, -1.104816, 0, 0.9294118, 1, 1,
-0.01611265, 1.726488, 0.4857797, 0, 0.9215686, 1, 1,
-0.01168351, -0.2462254, -3.441288, 0, 0.9176471, 1, 1,
-0.002338192, -1.540918, -3.156499, 0, 0.9098039, 1, 1,
-0.0008863264, -0.3682995, -2.239471, 0, 0.9058824, 1, 1,
0.005239458, 1.431983, 0.3423671, 0, 0.8980392, 1, 1,
0.005746901, -1.145699, 1.675482, 0, 0.8901961, 1, 1,
0.008100044, 0.196689, -0.1764835, 0, 0.8862745, 1, 1,
0.008169348, 1.941384, 0.7551991, 0, 0.8784314, 1, 1,
0.008505195, -1.13661, 2.798743, 0, 0.8745098, 1, 1,
0.01150985, -0.06528523, 3.652717, 0, 0.8666667, 1, 1,
0.01391214, -0.4245648, 2.370316, 0, 0.8627451, 1, 1,
0.0139559, -0.06848723, 3.609035, 0, 0.854902, 1, 1,
0.01727425, -0.5612973, 4.00104, 0, 0.8509804, 1, 1,
0.0175666, -0.6141735, 2.301452, 0, 0.8431373, 1, 1,
0.01997132, 0.6875725, 0.4863616, 0, 0.8392157, 1, 1,
0.02482891, -0.3258781, 2.579965, 0, 0.8313726, 1, 1,
0.02717075, -0.08290897, 2.357746, 0, 0.827451, 1, 1,
0.03199675, -0.9018294, 4.016783, 0, 0.8196079, 1, 1,
0.03207934, -0.186294, 3.062382, 0, 0.8156863, 1, 1,
0.04687984, 1.091862, -1.897099, 0, 0.8078431, 1, 1,
0.04718968, 0.04240658, 0.4252952, 0, 0.8039216, 1, 1,
0.05371035, 0.4740653, 1.399077, 0, 0.7960784, 1, 1,
0.05517006, 1.322402, -0.2321061, 0, 0.7882353, 1, 1,
0.0556695, -2.082601, 2.046602, 0, 0.7843137, 1, 1,
0.0582057, -0.8242772, 2.931217, 0, 0.7764706, 1, 1,
0.05856239, 1.30223, 0.4074594, 0, 0.772549, 1, 1,
0.0623848, -0.1674455, 4.853134, 0, 0.7647059, 1, 1,
0.0627455, 0.7001516, -0.2789396, 0, 0.7607843, 1, 1,
0.06448603, -0.2012062, 3.618692, 0, 0.7529412, 1, 1,
0.06811363, 1.023752, 3.065995, 0, 0.7490196, 1, 1,
0.07539236, 1.197309, -0.8123425, 0, 0.7411765, 1, 1,
0.07698103, -2.340313, 2.040619, 0, 0.7372549, 1, 1,
0.07813051, 0.6234585, -0.591453, 0, 0.7294118, 1, 1,
0.08192192, -1.481174, 3.521515, 0, 0.7254902, 1, 1,
0.08538406, -0.5062777, 2.823264, 0, 0.7176471, 1, 1,
0.08735266, -0.03043602, 0.9713997, 0, 0.7137255, 1, 1,
0.09443758, -0.3860089, 1.92611, 0, 0.7058824, 1, 1,
0.09592879, 1.24751, -0.1618668, 0, 0.6980392, 1, 1,
0.0966807, -0.2492684, 2.950227, 0, 0.6941177, 1, 1,
0.09978482, 1.058861, 1.788826, 0, 0.6862745, 1, 1,
0.1027765, 1.90884, -1.397518, 0, 0.682353, 1, 1,
0.107117, 0.1039174, 0.710997, 0, 0.6745098, 1, 1,
0.1098659, -1.74133, 3.45341, 0, 0.6705883, 1, 1,
0.112116, -1.387556e-05, 2.044069, 0, 0.6627451, 1, 1,
0.1126416, 0.9254574, -0.09175076, 0, 0.6588235, 1, 1,
0.1136253, 0.02925935, 0.322227, 0, 0.6509804, 1, 1,
0.1175119, 1.288785, -0.9366318, 0, 0.6470588, 1, 1,
0.1190718, 1.807789, 1.292483, 0, 0.6392157, 1, 1,
0.1260941, -0.587653, 3.209473, 0, 0.6352941, 1, 1,
0.1302205, -0.9937329, 4.05382, 0, 0.627451, 1, 1,
0.1369902, -0.05023405, 0.8847389, 0, 0.6235294, 1, 1,
0.1391933, -0.8034493, 1.309491, 0, 0.6156863, 1, 1,
0.1413019, 0.6318902, -0.1907012, 0, 0.6117647, 1, 1,
0.1428857, 0.5166758, -0.005575326, 0, 0.6039216, 1, 1,
0.1431043, -2.197544, 2.457334, 0, 0.5960785, 1, 1,
0.1446385, -0.3313381, 2.384033, 0, 0.5921569, 1, 1,
0.1457823, -0.401001, 3.68621, 0, 0.5843138, 1, 1,
0.1464174, -1.111191, 1.082881, 0, 0.5803922, 1, 1,
0.1531491, 0.718662, 0.4754099, 0, 0.572549, 1, 1,
0.1537112, -0.05755977, 4.021056, 0, 0.5686275, 1, 1,
0.1540463, 1.925545, 0.05323691, 0, 0.5607843, 1, 1,
0.1544897, -0.01188116, 1.972411, 0, 0.5568628, 1, 1,
0.1597204, 0.8365878, -0.6584895, 0, 0.5490196, 1, 1,
0.1644032, -1.275377, 4.338319, 0, 0.5450981, 1, 1,
0.1648049, -0.2007092, 2.410197, 0, 0.5372549, 1, 1,
0.1657606, -0.5719028, 4.589742, 0, 0.5333334, 1, 1,
0.1706413, 0.08736614, 2.011267, 0, 0.5254902, 1, 1,
0.1725911, -0.7256833, 2.920035, 0, 0.5215687, 1, 1,
0.1740761, -0.4230272, 4.234198, 0, 0.5137255, 1, 1,
0.1793359, -0.8051141, 3.769319, 0, 0.509804, 1, 1,
0.1862899, -0.4115697, 4.892349, 0, 0.5019608, 1, 1,
0.1883654, 0.8850393, 1.465387, 0, 0.4941176, 1, 1,
0.1886764, 0.9221265, 0.06437867, 0, 0.4901961, 1, 1,
0.1902007, 0.1131542, 1.41633, 0, 0.4823529, 1, 1,
0.1935991, -0.6065924, 2.716006, 0, 0.4784314, 1, 1,
0.1962857, -0.2764602, 4.449569, 0, 0.4705882, 1, 1,
0.1999516, -0.9546949, 2.693611, 0, 0.4666667, 1, 1,
0.2026606, -1.148107, 4.360599, 0, 0.4588235, 1, 1,
0.2034343, 0.6526332, 0.4691916, 0, 0.454902, 1, 1,
0.2040279, 0.111943, 1.369868, 0, 0.4470588, 1, 1,
0.2043829, 0.07689308, 2.362531, 0, 0.4431373, 1, 1,
0.2073257, -0.1660887, 1.987308, 0, 0.4352941, 1, 1,
0.2082503, -0.642608, 1.72633, 0, 0.4313726, 1, 1,
0.2123598, 0.4278334, -0.8922052, 0, 0.4235294, 1, 1,
0.2131331, 1.280865, 0.1714931, 0, 0.4196078, 1, 1,
0.2134934, -0.09888692, 0.2834102, 0, 0.4117647, 1, 1,
0.2144521, 0.2171187, 1.920646, 0, 0.4078431, 1, 1,
0.2177379, -2.088956, 2.571498, 0, 0.4, 1, 1,
0.2195947, 0.3732817, 0.2245615, 0, 0.3921569, 1, 1,
0.2221402, 1.782869, -0.8831847, 0, 0.3882353, 1, 1,
0.2234742, -0.1361891, -0.3903226, 0, 0.3803922, 1, 1,
0.2235407, -1.676299, 4.20004, 0, 0.3764706, 1, 1,
0.2238848, 2.442519, -0.580588, 0, 0.3686275, 1, 1,
0.2381564, -0.5791979, 3.791868, 0, 0.3647059, 1, 1,
0.2381734, -0.1567638, 1.885408, 0, 0.3568628, 1, 1,
0.2395918, -0.7065991, 3.366982, 0, 0.3529412, 1, 1,
0.2419984, 0.7541423, 0.6235159, 0, 0.345098, 1, 1,
0.2437132, 0.6156311, 2.051862, 0, 0.3411765, 1, 1,
0.2548265, 0.4281697, 0.05862885, 0, 0.3333333, 1, 1,
0.2572485, -0.232787, 1.45873, 0, 0.3294118, 1, 1,
0.2590513, 1.103493, 0.7434925, 0, 0.3215686, 1, 1,
0.2600284, 2.608054, 0.0279119, 0, 0.3176471, 1, 1,
0.2619092, 3.005764, 0.103611, 0, 0.3098039, 1, 1,
0.2638094, 0.6711966, 0.3510734, 0, 0.3058824, 1, 1,
0.2681752, -0.1199407, 2.454509, 0, 0.2980392, 1, 1,
0.2689481, 1.610863, 0.3256075, 0, 0.2901961, 1, 1,
0.2727353, -2.099479, 3.791069, 0, 0.2862745, 1, 1,
0.2736382, 1.003482, 1.021707, 0, 0.2784314, 1, 1,
0.2775438, -1.030114, 2.896839, 0, 0.2745098, 1, 1,
0.2776442, -0.9129862, 3.456703, 0, 0.2666667, 1, 1,
0.2824627, 0.09912185, 0.1986592, 0, 0.2627451, 1, 1,
0.2869794, 0.1974603, 0.7706599, 0, 0.254902, 1, 1,
0.2898662, 0.5848923, 0.5386353, 0, 0.2509804, 1, 1,
0.297754, 1.176933, 0.1941576, 0, 0.2431373, 1, 1,
0.2998853, 0.275052, -1.294177, 0, 0.2392157, 1, 1,
0.3010369, 0.2822131, 2.673193, 0, 0.2313726, 1, 1,
0.3034096, 1.427223, 1.605883, 0, 0.227451, 1, 1,
0.3035168, -0.2059904, 1.866365, 0, 0.2196078, 1, 1,
0.3073092, 1.80438, -0.8612354, 0, 0.2156863, 1, 1,
0.3091787, 0.6398011, 1.103048, 0, 0.2078431, 1, 1,
0.3126501, 0.4507777, 0.1800144, 0, 0.2039216, 1, 1,
0.3135017, -1.236772, 2.521215, 0, 0.1960784, 1, 1,
0.3136687, -0.4330361, 1.136756, 0, 0.1882353, 1, 1,
0.3140875, 0.5089148, -0.7513114, 0, 0.1843137, 1, 1,
0.3146849, -1.094096, 1.501187, 0, 0.1764706, 1, 1,
0.314899, -0.2052419, 2.658321, 0, 0.172549, 1, 1,
0.3184516, -0.3676838, 3.516409, 0, 0.1647059, 1, 1,
0.3261332, -0.3435817, 1.992585, 0, 0.1607843, 1, 1,
0.3303924, 0.4950129, 2.230328, 0, 0.1529412, 1, 1,
0.3327025, -1.791974, 2.495126, 0, 0.1490196, 1, 1,
0.332856, -0.05937908, 1.184712, 0, 0.1411765, 1, 1,
0.3346564, -0.3461059, 3.396211, 0, 0.1372549, 1, 1,
0.3366817, 0.9720382, 0.898379, 0, 0.1294118, 1, 1,
0.3369507, -0.3992255, 2.096174, 0, 0.1254902, 1, 1,
0.3391791, 0.1141369, 1.46639, 0, 0.1176471, 1, 1,
0.3502989, -0.2119708, 2.126808, 0, 0.1137255, 1, 1,
0.3506604, -0.8079247, 4.305377, 0, 0.1058824, 1, 1,
0.3512654, -0.6827888, 4.056014, 0, 0.09803922, 1, 1,
0.3515348, -0.4045531, 3.057715, 0, 0.09411765, 1, 1,
0.3528193, 1.543489, 0.7306986, 0, 0.08627451, 1, 1,
0.3600528, -0.6346294, 3.715265, 0, 0.08235294, 1, 1,
0.3632511, 2.095965, 0.7480902, 0, 0.07450981, 1, 1,
0.3660594, -1.10145, 3.580097, 0, 0.07058824, 1, 1,
0.3684007, -0.7678974, 3.409885, 0, 0.0627451, 1, 1,
0.3691348, -0.2302973, 1.268218, 0, 0.05882353, 1, 1,
0.3722962, 0.1295322, 0.9673656, 0, 0.05098039, 1, 1,
0.3723076, 0.8153062, 0.8807873, 0, 0.04705882, 1, 1,
0.3727574, 2.201427, 0.2920847, 0, 0.03921569, 1, 1,
0.3747225, 0.591232, 0.5354306, 0, 0.03529412, 1, 1,
0.3761609, -0.8934569, 1.348061, 0, 0.02745098, 1, 1,
0.3775474, 0.6673681, -0.1318852, 0, 0.02352941, 1, 1,
0.3776125, 0.2698953, 1.345069, 0, 0.01568628, 1, 1,
0.379388, -0.9853727, 4.519288, 0, 0.01176471, 1, 1,
0.3798595, 0.2587469, -1.18231, 0, 0.003921569, 1, 1,
0.3890255, 1.926698, -0.5368524, 0.003921569, 0, 1, 1,
0.3998328, -0.4102235, 2.687105, 0.007843138, 0, 1, 1,
0.4005204, 0.5127816, -0.4378304, 0.01568628, 0, 1, 1,
0.4009296, -0.9585106, 1.645706, 0.01960784, 0, 1, 1,
0.4070537, 0.6280382, 0.4274129, 0.02745098, 0, 1, 1,
0.4131774, 1.239, -2.661263, 0.03137255, 0, 1, 1,
0.4155555, 1.373505, -0.08549816, 0.03921569, 0, 1, 1,
0.4204675, -0.1185991, 1.256552, 0.04313726, 0, 1, 1,
0.4208045, 2.344157, 1.552569, 0.05098039, 0, 1, 1,
0.4246907, -0.1952208, 2.522549, 0.05490196, 0, 1, 1,
0.4310112, 0.360164, 1.479775, 0.0627451, 0, 1, 1,
0.4344755, -0.6051499, 1.606645, 0.06666667, 0, 1, 1,
0.4344795, -0.4827518, 2.276541, 0.07450981, 0, 1, 1,
0.4371122, -0.02203908, 0.3695378, 0.07843138, 0, 1, 1,
0.4403377, 0.3659203, 2.158984, 0.08627451, 0, 1, 1,
0.4445833, 0.04787561, 0.4984905, 0.09019608, 0, 1, 1,
0.4472409, -0.6028303, 2.616754, 0.09803922, 0, 1, 1,
0.4492297, 1.156767, -0.8050157, 0.1058824, 0, 1, 1,
0.4511874, 0.3803395, 1.476502, 0.1098039, 0, 1, 1,
0.4552614, 0.806751, 0.4665841, 0.1176471, 0, 1, 1,
0.4563132, -0.4361512, 1.628136, 0.1215686, 0, 1, 1,
0.4588353, 0.03662136, 2.408259, 0.1294118, 0, 1, 1,
0.4590288, 1.126936, 0.791087, 0.1333333, 0, 1, 1,
0.4616166, -1.050249, 1.918719, 0.1411765, 0, 1, 1,
0.4624338, 0.8264824, 2.21698, 0.145098, 0, 1, 1,
0.4635241, -1.786318, 1.654281, 0.1529412, 0, 1, 1,
0.4639358, -0.65118, 2.932728, 0.1568628, 0, 1, 1,
0.4671246, -0.6832059, 3.67054, 0.1647059, 0, 1, 1,
0.4678648, 1.011876, 1.038526, 0.1686275, 0, 1, 1,
0.4712306, -0.07706045, 2.197827, 0.1764706, 0, 1, 1,
0.471669, 0.01410087, -0.9100125, 0.1803922, 0, 1, 1,
0.4729114, -1.717849, 4.203719, 0.1882353, 0, 1, 1,
0.4751094, 1.161474, 1.831786, 0.1921569, 0, 1, 1,
0.4829716, 0.379252, 0.620514, 0.2, 0, 1, 1,
0.4845406, 1.323318, -1.090928, 0.2078431, 0, 1, 1,
0.4866516, -0.4061178, 4.010342, 0.2117647, 0, 1, 1,
0.490469, 0.4553585, -0.05918467, 0.2196078, 0, 1, 1,
0.4916474, 1.548124, -2.068964, 0.2235294, 0, 1, 1,
0.49775, 0.735662, -0.5795789, 0.2313726, 0, 1, 1,
0.5005317, 0.3921703, 1.546766, 0.2352941, 0, 1, 1,
0.5098272, 0.09384812, 0.3524307, 0.2431373, 0, 1, 1,
0.5115303, 0.2635385, 0.3367878, 0.2470588, 0, 1, 1,
0.512548, -0.0429806, 0.9996015, 0.254902, 0, 1, 1,
0.5164186, -0.07483865, 1.557622, 0.2588235, 0, 1, 1,
0.5169061, 1.361081, 1.604907, 0.2666667, 0, 1, 1,
0.5196723, 1.558403, -1.247558, 0.2705882, 0, 1, 1,
0.5199097, 0.02834374, 1.160199, 0.2784314, 0, 1, 1,
0.528133, 0.1900332, 0.2392644, 0.282353, 0, 1, 1,
0.5324182, -1.653569, 3.182574, 0.2901961, 0, 1, 1,
0.5333334, 0.2444785, -0.2033644, 0.2941177, 0, 1, 1,
0.5339082, 1.74622, -0.8611796, 0.3019608, 0, 1, 1,
0.5341753, -0.5198804, 2.236936, 0.3098039, 0, 1, 1,
0.5395001, 1.951451, -0.4161772, 0.3137255, 0, 1, 1,
0.5398039, 0.7826649, -0.1742339, 0.3215686, 0, 1, 1,
0.5451343, -0.7943489, 1.991309, 0.3254902, 0, 1, 1,
0.5458259, -1.468609, 0.7772079, 0.3333333, 0, 1, 1,
0.5508196, -0.5811203, 3.179779, 0.3372549, 0, 1, 1,
0.5573339, 0.8837474, 1.077531, 0.345098, 0, 1, 1,
0.5603246, 0.3382822, 0.3722702, 0.3490196, 0, 1, 1,
0.5626668, -0.5291814, 4.104844, 0.3568628, 0, 1, 1,
0.5641258, 0.7718925, -0.6812484, 0.3607843, 0, 1, 1,
0.5644906, -0.3562032, 2.195362, 0.3686275, 0, 1, 1,
0.5645738, -1.341351, 1.540742, 0.372549, 0, 1, 1,
0.5648829, 0.3844019, 1.19622, 0.3803922, 0, 1, 1,
0.5711538, 0.8878202, 1.746764, 0.3843137, 0, 1, 1,
0.5724118, -0.1939013, 1.1809, 0.3921569, 0, 1, 1,
0.5734596, -0.9309464, 3.263655, 0.3960784, 0, 1, 1,
0.575617, -0.282818, 2.425781, 0.4039216, 0, 1, 1,
0.5874078, 0.5149511, 0.4929321, 0.4117647, 0, 1, 1,
0.5887873, 0.8262347, 0.9638554, 0.4156863, 0, 1, 1,
0.5918286, 0.8345684, 0.651687, 0.4235294, 0, 1, 1,
0.5919582, -0.8349685, 1.766223, 0.427451, 0, 1, 1,
0.5934284, -0.03268097, 0.9528678, 0.4352941, 0, 1, 1,
0.5935888, 0.5123063, 0.135689, 0.4392157, 0, 1, 1,
0.5969445, 1.079827, -0.5764173, 0.4470588, 0, 1, 1,
0.5981621, 0.02261081, 2.000822, 0.4509804, 0, 1, 1,
0.6001047, -0.8514274, 2.793716, 0.4588235, 0, 1, 1,
0.6101121, -0.9480469, 3.834636, 0.4627451, 0, 1, 1,
0.6144012, 1.011351, -0.4425303, 0.4705882, 0, 1, 1,
0.6169563, -0.2741407, 1.959357, 0.4745098, 0, 1, 1,
0.6326447, -0.7996885, 0.4585267, 0.4823529, 0, 1, 1,
0.6335474, 0.4733235, 1.664694, 0.4862745, 0, 1, 1,
0.6354804, 0.455691, 1.627442, 0.4941176, 0, 1, 1,
0.6389386, -0.9056708, 3.32276, 0.5019608, 0, 1, 1,
0.640619, 0.7549654, 1.848366, 0.5058824, 0, 1, 1,
0.6422411, 0.4431703, -0.7012231, 0.5137255, 0, 1, 1,
0.6433938, -0.07201317, 2.089873, 0.5176471, 0, 1, 1,
0.6461474, 0.06200757, 1.368071, 0.5254902, 0, 1, 1,
0.6465177, 0.5692748, 0.6618446, 0.5294118, 0, 1, 1,
0.6537104, 0.4727261, 0.3464167, 0.5372549, 0, 1, 1,
0.6578691, -1.146962, 2.600586, 0.5411765, 0, 1, 1,
0.6603923, 0.8663269, 0.09940708, 0.5490196, 0, 1, 1,
0.6640219, 0.4101069, 2.619295, 0.5529412, 0, 1, 1,
0.6687686, -1.138856, 1.155518, 0.5607843, 0, 1, 1,
0.6774395, -0.258531, 2.854691, 0.5647059, 0, 1, 1,
0.6774654, 0.4619997, -0.6087946, 0.572549, 0, 1, 1,
0.6775099, 1.87873, -0.580081, 0.5764706, 0, 1, 1,
0.6811222, 1.933476, 0.4412794, 0.5843138, 0, 1, 1,
0.684568, 0.3964449, 0.4991352, 0.5882353, 0, 1, 1,
0.6939337, -0.8298807, 2.70622, 0.5960785, 0, 1, 1,
0.6978533, -1.013694, 2.26654, 0.6039216, 0, 1, 1,
0.7042028, -1.914945, 3.259021, 0.6078432, 0, 1, 1,
0.7047168, -0.7351713, 2.205742, 0.6156863, 0, 1, 1,
0.707782, -0.4581327, 2.145324, 0.6196079, 0, 1, 1,
0.7099053, 0.5752444, 0.1508617, 0.627451, 0, 1, 1,
0.7138641, 0.6991471, 0.4613042, 0.6313726, 0, 1, 1,
0.7189316, -1.088435, 2.207704, 0.6392157, 0, 1, 1,
0.7209207, 0.7723722, 0.6116052, 0.6431373, 0, 1, 1,
0.7320679, 1.183891, 0.7870506, 0.6509804, 0, 1, 1,
0.7351156, 0.4621278, 1.610719, 0.654902, 0, 1, 1,
0.7358387, 0.1878071, 0.8291852, 0.6627451, 0, 1, 1,
0.7411658, -1.091549, 1.177348, 0.6666667, 0, 1, 1,
0.7419433, -1.176319, 1.098414, 0.6745098, 0, 1, 1,
0.7482729, -1.698335, 2.975635, 0.6784314, 0, 1, 1,
0.7509118, -2.912356, 2.898294, 0.6862745, 0, 1, 1,
0.7519412, 0.3559206, 0.04161631, 0.6901961, 0, 1, 1,
0.7571602, -0.2545648, 3.688207, 0.6980392, 0, 1, 1,
0.7583526, 0.9122518, -0.8877845, 0.7058824, 0, 1, 1,
0.7642649, -0.7055931, 3.71484, 0.7098039, 0, 1, 1,
0.7728989, -0.7665903, 4.145176, 0.7176471, 0, 1, 1,
0.7779006, -1.698535, 2.616304, 0.7215686, 0, 1, 1,
0.7807221, -2.585693, 3.063544, 0.7294118, 0, 1, 1,
0.7815036, 0.3449597, 0.6790019, 0.7333333, 0, 1, 1,
0.7855602, 0.7804954, 0.0009975343, 0.7411765, 0, 1, 1,
0.794173, -0.338837, 1.494811, 0.7450981, 0, 1, 1,
0.8005196, -0.2198865, 1.977304, 0.7529412, 0, 1, 1,
0.8061556, -1.247411, 1.518603, 0.7568628, 0, 1, 1,
0.8076072, -0.06764024, 0.4927154, 0.7647059, 0, 1, 1,
0.8081889, -0.1782983, 1.038693, 0.7686275, 0, 1, 1,
0.8140333, -0.610765, 2.342675, 0.7764706, 0, 1, 1,
0.8176426, -0.0003295968, 3.197801, 0.7803922, 0, 1, 1,
0.8181207, 1.731565, 0.8859088, 0.7882353, 0, 1, 1,
0.82918, -0.07005563, -0.3308317, 0.7921569, 0, 1, 1,
0.8315623, -0.003639368, 1.089946, 0.8, 0, 1, 1,
0.8331149, 1.109283, -1.496087, 0.8078431, 0, 1, 1,
0.8423725, 0.6889642, 1.066075, 0.8117647, 0, 1, 1,
0.8454965, -2.690201, 3.506992, 0.8196079, 0, 1, 1,
0.8570004, -2.678724, 2.373562, 0.8235294, 0, 1, 1,
0.8608841, -1.627642, 4.171278, 0.8313726, 0, 1, 1,
0.8611068, -1.478026, 1.891084, 0.8352941, 0, 1, 1,
0.861417, -0.9088492, 1.861412, 0.8431373, 0, 1, 1,
0.8719319, -1.088971, 0.7248891, 0.8470588, 0, 1, 1,
0.875026, 1.212771, -1.565516, 0.854902, 0, 1, 1,
0.8821725, -1.027093, 2.027004, 0.8588235, 0, 1, 1,
0.882988, -0.8830044, 1.431644, 0.8666667, 0, 1, 1,
0.8852246, 2.236904, 0.3313127, 0.8705882, 0, 1, 1,
0.8878453, 1.056835, 1.169595, 0.8784314, 0, 1, 1,
0.8949357, -0.9670922, 1.288259, 0.8823529, 0, 1, 1,
0.8979092, 0.7525892, 1.086538, 0.8901961, 0, 1, 1,
0.8982208, -1.297173, 2.092333, 0.8941177, 0, 1, 1,
0.9002436, -0.2423694, 2.045805, 0.9019608, 0, 1, 1,
0.9030778, 1.140233, 0.3168504, 0.9098039, 0, 1, 1,
0.9035677, -0.8797949, 1.966354, 0.9137255, 0, 1, 1,
0.9052547, 0.8402742, -0.03288581, 0.9215686, 0, 1, 1,
0.9081853, -0.6505854, 2.746081, 0.9254902, 0, 1, 1,
0.9095626, 1.063265, 0.030031, 0.9333333, 0, 1, 1,
0.9177533, -1.075776, 2.962286, 0.9372549, 0, 1, 1,
0.9182227, 2.321233, 2.380923, 0.945098, 0, 1, 1,
0.9191603, -0.3720488, 1.875527, 0.9490196, 0, 1, 1,
0.9230937, -0.2230976, 1.375452, 0.9568627, 0, 1, 1,
0.9243625, 0.05727157, 0.6210666, 0.9607843, 0, 1, 1,
0.9262942, 0.07845462, 1.661095, 0.9686275, 0, 1, 1,
0.9266319, 0.7686443, 0.3012567, 0.972549, 0, 1, 1,
0.9325581, -0.2749704, 0.9690911, 0.9803922, 0, 1, 1,
0.9375426, -1.129456, 1.569694, 0.9843137, 0, 1, 1,
0.9535076, -0.3020664, 1.541706, 0.9921569, 0, 1, 1,
0.9562997, 0.4776765, 0.2987528, 0.9960784, 0, 1, 1,
0.9742951, 0.1574548, 0.1234338, 1, 0, 0.9960784, 1,
0.9814889, 0.4171634, 1.725671, 1, 0, 0.9882353, 1,
0.9826828, -0.4003914, 2.920671, 1, 0, 0.9843137, 1,
0.9832238, 0.8700168, -0.08218589, 1, 0, 0.9764706, 1,
0.9849755, -1.823575, 2.122763, 1, 0, 0.972549, 1,
0.9886498, 0.6019361, 0.3359683, 1, 0, 0.9647059, 1,
0.9891654, 0.01259582, 1.959041, 1, 0, 0.9607843, 1,
0.99296, -1.28379, 3.622403, 1, 0, 0.9529412, 1,
0.9931265, 1.849409, 0.6834033, 1, 0, 0.9490196, 1,
0.9970115, 0.5932295, 2.801536, 1, 0, 0.9411765, 1,
1.009215, 0.1299865, 1.746999, 1, 0, 0.9372549, 1,
1.020133, 1.367079, 1.332236, 1, 0, 0.9294118, 1,
1.023054, -0.1421458, 1.025152, 1, 0, 0.9254902, 1,
1.025902, -0.5847465, 3.029305, 1, 0, 0.9176471, 1,
1.026019, 0.5229056, 2.400249, 1, 0, 0.9137255, 1,
1.029989, 1.144004, -0.2545089, 1, 0, 0.9058824, 1,
1.03129, 0.6146647, 1.841126, 1, 0, 0.9019608, 1,
1.031913, -0.07126275, 1.832356, 1, 0, 0.8941177, 1,
1.034589, -1.291157, 1.718663, 1, 0, 0.8862745, 1,
1.034665, -1.345201, 2.144329, 1, 0, 0.8823529, 1,
1.03502, -1.14269, 2.286852, 1, 0, 0.8745098, 1,
1.038737, 0.5892267, 1.415826, 1, 0, 0.8705882, 1,
1.05111, -0.6131178, 1.914395, 1, 0, 0.8627451, 1,
1.053666, -0.3841544, 2.39965, 1, 0, 0.8588235, 1,
1.056957, 1.282799, 0.1986043, 1, 0, 0.8509804, 1,
1.059983, -0.1852327, 1.884883, 1, 0, 0.8470588, 1,
1.062975, -1.120242, 3.820606, 1, 0, 0.8392157, 1,
1.069006, -0.7792245, 3.095638, 1, 0, 0.8352941, 1,
1.070529, 1.341572, 0.3649259, 1, 0, 0.827451, 1,
1.072108, 0.8405201, 1.081935, 1, 0, 0.8235294, 1,
1.073927, -0.8277094, 2.86264, 1, 0, 0.8156863, 1,
1.080805, -0.3555026, 1.638694, 1, 0, 0.8117647, 1,
1.085339, -0.6510274, 2.90429, 1, 0, 0.8039216, 1,
1.085681, -1.119053, 1.029255, 1, 0, 0.7960784, 1,
1.087651, 1.087762, 0.8295561, 1, 0, 0.7921569, 1,
1.089685, -1.210937, 3.185731, 1, 0, 0.7843137, 1,
1.09181, 1.42222, -0.8643759, 1, 0, 0.7803922, 1,
1.103854, 1.405646, 2.401774, 1, 0, 0.772549, 1,
1.107842, 0.3767269, 1.43658, 1, 0, 0.7686275, 1,
1.110592, -0.8677066, 3.492395, 1, 0, 0.7607843, 1,
1.116334, 1.590447, -0.557976, 1, 0, 0.7568628, 1,
1.118551, -0.01424989, 1.207429, 1, 0, 0.7490196, 1,
1.122132, 1.135186, 0.9728626, 1, 0, 0.7450981, 1,
1.125041, -0.4890771, 2.089963, 1, 0, 0.7372549, 1,
1.128553, 0.4827504, 1.138342, 1, 0, 0.7333333, 1,
1.130676, 1.499108, 1.477979, 1, 0, 0.7254902, 1,
1.13871, -0.5218413, 2.733034, 1, 0, 0.7215686, 1,
1.150525, 1.129319, 1.814239, 1, 0, 0.7137255, 1,
1.151896, 0.5817153, 0.6415853, 1, 0, 0.7098039, 1,
1.155149, 0.1650536, 0.7336842, 1, 0, 0.7019608, 1,
1.157842, -1.058175, 3.776064, 1, 0, 0.6941177, 1,
1.158946, -1.263607, 2.945543, 1, 0, 0.6901961, 1,
1.159596, -0.3194056, 1.355557, 1, 0, 0.682353, 1,
1.16186, -0.7550005, 2.860423, 1, 0, 0.6784314, 1,
1.173523, -1.778445, 3.372564, 1, 0, 0.6705883, 1,
1.179133, 0.06246199, 0.9190065, 1, 0, 0.6666667, 1,
1.181271, 0.8887411, 0.5425754, 1, 0, 0.6588235, 1,
1.187082, 0.4335514, -1.527473, 1, 0, 0.654902, 1,
1.189131, 0.01036627, 1.979326, 1, 0, 0.6470588, 1,
1.191483, -0.7862686, 1.488907, 1, 0, 0.6431373, 1,
1.204502, 0.1526952, 1.848058, 1, 0, 0.6352941, 1,
1.20514, -0.9373881, 2.867219, 1, 0, 0.6313726, 1,
1.205764, -1.127181, 1.486699, 1, 0, 0.6235294, 1,
1.209341, 0.8246872, 0.2520951, 1, 0, 0.6196079, 1,
1.2115, -0.5708815, 2.018915, 1, 0, 0.6117647, 1,
1.214315, 0.21477, 0.4939781, 1, 0, 0.6078432, 1,
1.216062, 0.5466978, 1.467429, 1, 0, 0.6, 1,
1.217736, 0.7498901, 2.078069, 1, 0, 0.5921569, 1,
1.217944, 1.758044, 0.385233, 1, 0, 0.5882353, 1,
1.221118, 0.3933721, 2.167387, 1, 0, 0.5803922, 1,
1.221577, 1.060686, 1.466142, 1, 0, 0.5764706, 1,
1.224174, -0.8676565, 3.004019, 1, 0, 0.5686275, 1,
1.226028, -0.9556276, 2.839484, 1, 0, 0.5647059, 1,
1.22704, -0.4381136, 1.816765, 1, 0, 0.5568628, 1,
1.24083, -0.9326595, 0.8907007, 1, 0, 0.5529412, 1,
1.244235, 2.430999, 1.32937, 1, 0, 0.5450981, 1,
1.248332, 0.5965303, 0.5473745, 1, 0, 0.5411765, 1,
1.263568, -0.5439019, 1.2918, 1, 0, 0.5333334, 1,
1.26802, -0.2452948, 0.9687239, 1, 0, 0.5294118, 1,
1.274507, 0.03378383, 2.077071, 1, 0, 0.5215687, 1,
1.292235, 0.1101356, 2.492363, 1, 0, 0.5176471, 1,
1.2923, 1.545219, -0.5938766, 1, 0, 0.509804, 1,
1.293614, -0.614729, 1.46209, 1, 0, 0.5058824, 1,
1.294342, 1.349807, 1.009849, 1, 0, 0.4980392, 1,
1.297469, 0.3602505, 0.5852515, 1, 0, 0.4901961, 1,
1.298728, -0.6640379, 1.678797, 1, 0, 0.4862745, 1,
1.300496, 0.5715572, 2.502916, 1, 0, 0.4784314, 1,
1.305962, 0.2655224, 1.009514, 1, 0, 0.4745098, 1,
1.317831, -0.808427, 1.324056, 1, 0, 0.4666667, 1,
1.3199, -0.9343636, 3.398135, 1, 0, 0.4627451, 1,
1.322875, -1.181195, 1.056848, 1, 0, 0.454902, 1,
1.335799, -0.2372656, 2.393492, 1, 0, 0.4509804, 1,
1.339604, 0.8439642, 1.057299, 1, 0, 0.4431373, 1,
1.340234, 0.3007181, 0.9059854, 1, 0, 0.4392157, 1,
1.353134, 1.320349, 0.6168468, 1, 0, 0.4313726, 1,
1.361472, 1.386778, 0.9343382, 1, 0, 0.427451, 1,
1.368581, 0.0708461, 2.479128, 1, 0, 0.4196078, 1,
1.369006, 0.3023762, 1.413226, 1, 0, 0.4156863, 1,
1.370573, -1.891211, 2.73631, 1, 0, 0.4078431, 1,
1.402596, 1.079288, 0.5801799, 1, 0, 0.4039216, 1,
1.40896, -0.8347163, 0.9073741, 1, 0, 0.3960784, 1,
1.415352, -0.05869802, -0.2010357, 1, 0, 0.3882353, 1,
1.417254, -2.982585, 2.631135, 1, 0, 0.3843137, 1,
1.423494, -0.3484408, 1.49097, 1, 0, 0.3764706, 1,
1.436571, -0.2085854, 0.6764658, 1, 0, 0.372549, 1,
1.443347, 0.354524, 1.025158, 1, 0, 0.3647059, 1,
1.450538, -0.6811253, 3.779925, 1, 0, 0.3607843, 1,
1.452521, 0.335607, 3.101381, 1, 0, 0.3529412, 1,
1.461126, -0.4735167, 2.742005, 1, 0, 0.3490196, 1,
1.463015, 0.0276894, 0.9406047, 1, 0, 0.3411765, 1,
1.466049, 1.928199, 1.357522, 1, 0, 0.3372549, 1,
1.466312, 0.585252, 0.3523385, 1, 0, 0.3294118, 1,
1.472757, -0.1582415, 2.371593, 1, 0, 0.3254902, 1,
1.473473, -0.02547129, 0.1665022, 1, 0, 0.3176471, 1,
1.478926, -1.227643, 2.545146, 1, 0, 0.3137255, 1,
1.500145, 0.1110531, 1.30845, 1, 0, 0.3058824, 1,
1.518686, 0.5975379, 1.073488, 1, 0, 0.2980392, 1,
1.549418, -1.989278, 2.125165, 1, 0, 0.2941177, 1,
1.564212, 0.4501883, 2.102763, 1, 0, 0.2862745, 1,
1.609337, -0.5943943, 1.730626, 1, 0, 0.282353, 1,
1.616451, 0.2344212, 1.600476, 1, 0, 0.2745098, 1,
1.628255, -0.06556943, 2.653573, 1, 0, 0.2705882, 1,
1.628781, 0.616927, -0.7622029, 1, 0, 0.2627451, 1,
1.641868, -1.56961, 4.609388, 1, 0, 0.2588235, 1,
1.644292, -1.066296, 2.123748, 1, 0, 0.2509804, 1,
1.646657, 1.645373, 1.601212, 1, 0, 0.2470588, 1,
1.676913, 0.229049, 1.710608, 1, 0, 0.2392157, 1,
1.683735, -0.987941, 0.8588896, 1, 0, 0.2352941, 1,
1.691261, -0.4344301, 2.194781, 1, 0, 0.227451, 1,
1.713482, 0.439122, 0.5029084, 1, 0, 0.2235294, 1,
1.717091, 0.1476011, 2.135468, 1, 0, 0.2156863, 1,
1.738794, 0.8967176, 0.7082103, 1, 0, 0.2117647, 1,
1.757232, -1.920744, 2.855084, 1, 0, 0.2039216, 1,
1.779254, -2.250071, 2.293, 1, 0, 0.1960784, 1,
1.779698, -0.3189171, 1.811952, 1, 0, 0.1921569, 1,
1.78747, 1.81676, 1.135546, 1, 0, 0.1843137, 1,
1.792004, 1.667919, -0.2997048, 1, 0, 0.1803922, 1,
1.793628, 0.9705779, 0.7152268, 1, 0, 0.172549, 1,
1.806345, -0.2299341, 1.541845, 1, 0, 0.1686275, 1,
1.840884, 0.7376884, 1.130741, 1, 0, 0.1607843, 1,
1.882913, -0.1953508, 0.1749838, 1, 0, 0.1568628, 1,
1.90676, -0.6787015, 3.060064, 1, 0, 0.1490196, 1,
1.909897, -0.8576465, 1.403473, 1, 0, 0.145098, 1,
1.950673, -0.6084604, 1.485922, 1, 0, 0.1372549, 1,
1.96938, 2.3823, 2.518053, 1, 0, 0.1333333, 1,
1.980884, -0.68179, 1.907028, 1, 0, 0.1254902, 1,
2.001707, -1.275866, 4.158934, 1, 0, 0.1215686, 1,
2.010503, -0.7801241, 0.8612719, 1, 0, 0.1137255, 1,
2.039657, 2.115618, 0.9585994, 1, 0, 0.1098039, 1,
2.049337, -0.6951107, 1.172451, 1, 0, 0.1019608, 1,
2.061733, -0.4689783, 2.312713, 1, 0, 0.09411765, 1,
2.067739, -0.390121, 1.802804, 1, 0, 0.09019608, 1,
2.07995, -0.3033718, 2.310588, 1, 0, 0.08235294, 1,
2.11779, 0.2451096, 0.7608135, 1, 0, 0.07843138, 1,
2.132131, 0.8594999, 0.5945306, 1, 0, 0.07058824, 1,
2.267744, 0.4464379, 0.2062457, 1, 0, 0.06666667, 1,
2.273704, -0.3184333, -0.4571769, 1, 0, 0.05882353, 1,
2.286182, -1.92109, 1.669805, 1, 0, 0.05490196, 1,
2.325512, 1.129804, 0.7275577, 1, 0, 0.04705882, 1,
2.327525, 1.372131, 0.7772657, 1, 0, 0.04313726, 1,
2.423762, 0.3637758, 2.18217, 1, 0, 0.03529412, 1,
2.504118, -0.1945138, 2.962532, 1, 0, 0.03137255, 1,
2.55471, 0.2297762, 1.352613, 1, 0, 0.02352941, 1,
2.660465, 0.6867119, 3.199467, 1, 0, 0.01960784, 1,
2.688211, 0.3340366, 2.567063, 1, 0, 0.01176471, 1,
3.392843, -0.3901437, 2.677604, 1, 0, 0.007843138, 1
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
0.1698941, -4.842932, -7.595935, 0, -0.5, 0.5, 0.5,
0.1698941, -4.842932, -7.595935, 1, -0.5, 0.5, 0.5,
0.1698941, -4.842932, -7.595935, 1, 1.5, 0.5, 0.5,
0.1698941, -4.842932, -7.595935, 0, 1.5, 0.5, 0.5
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
-4.145635, -0.3498137, -7.595935, 0, -0.5, 0.5, 0.5,
-4.145635, -0.3498137, -7.595935, 1, -0.5, 0.5, 0.5,
-4.145635, -0.3498137, -7.595935, 1, 1.5, 0.5, 0.5,
-4.145635, -0.3498137, -7.595935, 0, 1.5, 0.5, 0.5
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
-4.145635, -4.842932, -0.446806, 0, -0.5, 0.5, 0.5,
-4.145635, -4.842932, -0.446806, 1, -0.5, 0.5, 0.5,
-4.145635, -4.842932, -0.446806, 1, 1.5, 0.5, 0.5,
-4.145635, -4.842932, -0.446806, 0, 1.5, 0.5, 0.5
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
-3, -3.806058, -5.946136,
3, -3.806058, -5.946136,
-3, -3.806058, -5.946136,
-3, -3.978871, -6.221102,
-2, -3.806058, -5.946136,
-2, -3.978871, -6.221102,
-1, -3.806058, -5.946136,
-1, -3.978871, -6.221102,
0, -3.806058, -5.946136,
0, -3.978871, -6.221102,
1, -3.806058, -5.946136,
1, -3.978871, -6.221102,
2, -3.806058, -5.946136,
2, -3.978871, -6.221102,
3, -3.806058, -5.946136,
3, -3.978871, -6.221102
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
-3, -4.324495, -6.771035, 0, -0.5, 0.5, 0.5,
-3, -4.324495, -6.771035, 1, -0.5, 0.5, 0.5,
-3, -4.324495, -6.771035, 1, 1.5, 0.5, 0.5,
-3, -4.324495, -6.771035, 0, 1.5, 0.5, 0.5,
-2, -4.324495, -6.771035, 0, -0.5, 0.5, 0.5,
-2, -4.324495, -6.771035, 1, -0.5, 0.5, 0.5,
-2, -4.324495, -6.771035, 1, 1.5, 0.5, 0.5,
-2, -4.324495, -6.771035, 0, 1.5, 0.5, 0.5,
-1, -4.324495, -6.771035, 0, -0.5, 0.5, 0.5,
-1, -4.324495, -6.771035, 1, -0.5, 0.5, 0.5,
-1, -4.324495, -6.771035, 1, 1.5, 0.5, 0.5,
-1, -4.324495, -6.771035, 0, 1.5, 0.5, 0.5,
0, -4.324495, -6.771035, 0, -0.5, 0.5, 0.5,
0, -4.324495, -6.771035, 1, -0.5, 0.5, 0.5,
0, -4.324495, -6.771035, 1, 1.5, 0.5, 0.5,
0, -4.324495, -6.771035, 0, 1.5, 0.5, 0.5,
1, -4.324495, -6.771035, 0, -0.5, 0.5, 0.5,
1, -4.324495, -6.771035, 1, -0.5, 0.5, 0.5,
1, -4.324495, -6.771035, 1, 1.5, 0.5, 0.5,
1, -4.324495, -6.771035, 0, 1.5, 0.5, 0.5,
2, -4.324495, -6.771035, 0, -0.5, 0.5, 0.5,
2, -4.324495, -6.771035, 1, -0.5, 0.5, 0.5,
2, -4.324495, -6.771035, 1, 1.5, 0.5, 0.5,
2, -4.324495, -6.771035, 0, 1.5, 0.5, 0.5,
3, -4.324495, -6.771035, 0, -0.5, 0.5, 0.5,
3, -4.324495, -6.771035, 1, -0.5, 0.5, 0.5,
3, -4.324495, -6.771035, 1, 1.5, 0.5, 0.5,
3, -4.324495, -6.771035, 0, 1.5, 0.5, 0.5
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
-3.149744, -3, -5.946136,
-3.149744, 3, -5.946136,
-3.149744, -3, -5.946136,
-3.315726, -3, -6.221102,
-3.149744, -2, -5.946136,
-3.315726, -2, -6.221102,
-3.149744, -1, -5.946136,
-3.315726, -1, -6.221102,
-3.149744, 0, -5.946136,
-3.315726, 0, -6.221102,
-3.149744, 1, -5.946136,
-3.315726, 1, -6.221102,
-3.149744, 2, -5.946136,
-3.315726, 2, -6.221102,
-3.149744, 3, -5.946136,
-3.315726, 3, -6.221102
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
-3.647689, -3, -6.771035, 0, -0.5, 0.5, 0.5,
-3.647689, -3, -6.771035, 1, -0.5, 0.5, 0.5,
-3.647689, -3, -6.771035, 1, 1.5, 0.5, 0.5,
-3.647689, -3, -6.771035, 0, 1.5, 0.5, 0.5,
-3.647689, -2, -6.771035, 0, -0.5, 0.5, 0.5,
-3.647689, -2, -6.771035, 1, -0.5, 0.5, 0.5,
-3.647689, -2, -6.771035, 1, 1.5, 0.5, 0.5,
-3.647689, -2, -6.771035, 0, 1.5, 0.5, 0.5,
-3.647689, -1, -6.771035, 0, -0.5, 0.5, 0.5,
-3.647689, -1, -6.771035, 1, -0.5, 0.5, 0.5,
-3.647689, -1, -6.771035, 1, 1.5, 0.5, 0.5,
-3.647689, -1, -6.771035, 0, 1.5, 0.5, 0.5,
-3.647689, 0, -6.771035, 0, -0.5, 0.5, 0.5,
-3.647689, 0, -6.771035, 1, -0.5, 0.5, 0.5,
-3.647689, 0, -6.771035, 1, 1.5, 0.5, 0.5,
-3.647689, 0, -6.771035, 0, 1.5, 0.5, 0.5,
-3.647689, 1, -6.771035, 0, -0.5, 0.5, 0.5,
-3.647689, 1, -6.771035, 1, -0.5, 0.5, 0.5,
-3.647689, 1, -6.771035, 1, 1.5, 0.5, 0.5,
-3.647689, 1, -6.771035, 0, 1.5, 0.5, 0.5,
-3.647689, 2, -6.771035, 0, -0.5, 0.5, 0.5,
-3.647689, 2, -6.771035, 1, -0.5, 0.5, 0.5,
-3.647689, 2, -6.771035, 1, 1.5, 0.5, 0.5,
-3.647689, 2, -6.771035, 0, 1.5, 0.5, 0.5,
-3.647689, 3, -6.771035, 0, -0.5, 0.5, 0.5,
-3.647689, 3, -6.771035, 1, -0.5, 0.5, 0.5,
-3.647689, 3, -6.771035, 1, 1.5, 0.5, 0.5,
-3.647689, 3, -6.771035, 0, 1.5, 0.5, 0.5
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
-3.149744, -3.806058, -4,
-3.149744, -3.806058, 4,
-3.149744, -3.806058, -4,
-3.315726, -3.978871, -4,
-3.149744, -3.806058, -2,
-3.315726, -3.978871, -2,
-3.149744, -3.806058, 0,
-3.315726, -3.978871, 0,
-3.149744, -3.806058, 2,
-3.315726, -3.978871, 2,
-3.149744, -3.806058, 4,
-3.315726, -3.978871, 4
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
-3.647689, -4.324495, -4, 0, -0.5, 0.5, 0.5,
-3.647689, -4.324495, -4, 1, -0.5, 0.5, 0.5,
-3.647689, -4.324495, -4, 1, 1.5, 0.5, 0.5,
-3.647689, -4.324495, -4, 0, 1.5, 0.5, 0.5,
-3.647689, -4.324495, -2, 0, -0.5, 0.5, 0.5,
-3.647689, -4.324495, -2, 1, -0.5, 0.5, 0.5,
-3.647689, -4.324495, -2, 1, 1.5, 0.5, 0.5,
-3.647689, -4.324495, -2, 0, 1.5, 0.5, 0.5,
-3.647689, -4.324495, 0, 0, -0.5, 0.5, 0.5,
-3.647689, -4.324495, 0, 1, -0.5, 0.5, 0.5,
-3.647689, -4.324495, 0, 1, 1.5, 0.5, 0.5,
-3.647689, -4.324495, 0, 0, 1.5, 0.5, 0.5,
-3.647689, -4.324495, 2, 0, -0.5, 0.5, 0.5,
-3.647689, -4.324495, 2, 1, -0.5, 0.5, 0.5,
-3.647689, -4.324495, 2, 1, 1.5, 0.5, 0.5,
-3.647689, -4.324495, 2, 0, 1.5, 0.5, 0.5,
-3.647689, -4.324495, 4, 0, -0.5, 0.5, 0.5,
-3.647689, -4.324495, 4, 1, -0.5, 0.5, 0.5,
-3.647689, -4.324495, 4, 1, 1.5, 0.5, 0.5,
-3.647689, -4.324495, 4, 0, 1.5, 0.5, 0.5
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
-3.149744, -3.806058, -5.946136,
-3.149744, 3.106431, -5.946136,
-3.149744, -3.806058, 5.052524,
-3.149744, 3.106431, 5.052524,
-3.149744, -3.806058, -5.946136,
-3.149744, -3.806058, 5.052524,
-3.149744, 3.106431, -5.946136,
-3.149744, 3.106431, 5.052524,
-3.149744, -3.806058, -5.946136,
3.489532, -3.806058, -5.946136,
-3.149744, -3.806058, 5.052524,
3.489532, -3.806058, 5.052524,
-3.149744, 3.106431, -5.946136,
3.489532, 3.106431, -5.946136,
-3.149744, 3.106431, 5.052524,
3.489532, 3.106431, 5.052524,
3.489532, -3.806058, -5.946136,
3.489532, 3.106431, -5.946136,
3.489532, -3.806058, 5.052524,
3.489532, 3.106431, 5.052524,
3.489532, -3.806058, -5.946136,
3.489532, -3.806058, 5.052524,
3.489532, 3.106431, -5.946136,
3.489532, 3.106431, 5.052524
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
var radius = 7.790135;
var distance = 34.65919;
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
mvMatrix.translate( -0.1698941, 0.3498137, 0.446806 );
mvMatrix.scale( 1.268639, 1.218497, 0.7658066 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.65919);
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
XMC<-read.table("XMC.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-XMC$V2
```

```
## Error in eval(expr, envir, enclos): object 'XMC' not found
```

```r
y<-XMC$V3
```

```
## Error in eval(expr, envir, enclos): object 'XMC' not found
```

```r
z<-XMC$V4
```

```
## Error in eval(expr, envir, enclos): object 'XMC' not found
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
-3.053055, -0.1494068, -0.9724538, 0, 0, 1, 1, 1,
-2.850299, 0.5040055, -1.521955, 1, 0, 0, 1, 1,
-2.787025, 0.6637386, -2.09847, 1, 0, 0, 1, 1,
-2.383649, -0.6358635, -1.945289, 1, 0, 0, 1, 1,
-2.371036, 1.142529, -0.5028879, 1, 0, 0, 1, 1,
-2.342242, 0.6604258, -0.4894587, 1, 0, 0, 1, 1,
-2.292708, 1.35834, -0.06909802, 0, 0, 0, 1, 1,
-2.238645, -0.5982579, -1.766817, 0, 0, 0, 1, 1,
-2.236465, -2.259589, -2.05611, 0, 0, 0, 1, 1,
-2.232122, -0.201388, -2.042876, 0, 0, 0, 1, 1,
-2.219044, 0.1136743, -0.0474499, 0, 0, 0, 1, 1,
-2.189751, 0.5219968, -0.1725536, 0, 0, 0, 1, 1,
-2.168271, -1.016348, -1.776414, 0, 0, 0, 1, 1,
-2.157146, 1.911924, -1.092377, 1, 1, 1, 1, 1,
-2.139332, 0.5021646, -2.949885, 1, 1, 1, 1, 1,
-2.110363, -0.7380863, -2.143785, 1, 1, 1, 1, 1,
-2.081484, -0.697601, -0.247017, 1, 1, 1, 1, 1,
-2.023566, 0.911578, -0.02238025, 1, 1, 1, 1, 1,
-2.004587, -0.2864193, -0.2518717, 1, 1, 1, 1, 1,
-1.94837, 0.1116636, -1.516876, 1, 1, 1, 1, 1,
-1.932595, 0.3372876, -2.238509, 1, 1, 1, 1, 1,
-1.930614, -1.306563, -3.463347, 1, 1, 1, 1, 1,
-1.91906, -0.3851254, -1.021935, 1, 1, 1, 1, 1,
-1.899621, 1.333554, 0.1961676, 1, 1, 1, 1, 1,
-1.886747, -2.652841, -3.044159, 1, 1, 1, 1, 1,
-1.863345, 0.8016681, -0.8558845, 1, 1, 1, 1, 1,
-1.839286, -0.4100968, -1.141003, 1, 1, 1, 1, 1,
-1.83039, 1.54927, 1.084861, 1, 1, 1, 1, 1,
-1.798337, -0.580185, -2.78045, 0, 0, 1, 1, 1,
-1.782956, -0.005400776, -2.169759, 1, 0, 0, 1, 1,
-1.777394, 0.06575922, -0.8044533, 1, 0, 0, 1, 1,
-1.768155, -1.290816, -1.82003, 1, 0, 0, 1, 1,
-1.712825, -0.5265073, -2.308604, 1, 0, 0, 1, 1,
-1.70328, 0.2018981, -1.499168, 1, 0, 0, 1, 1,
-1.697731, -0.7007842, -0.1350729, 0, 0, 0, 1, 1,
-1.696704, -0.7941638, -1.142521, 0, 0, 0, 1, 1,
-1.685949, 0.02885839, -1.892103, 0, 0, 0, 1, 1,
-1.669318, -0.6247689, -2.992355, 0, 0, 0, 1, 1,
-1.666812, 0.5548819, -0.577755, 0, 0, 0, 1, 1,
-1.66204, -0.614677, -1.427887, 0, 0, 0, 1, 1,
-1.660345, 2.165068, -2.198413, 0, 0, 0, 1, 1,
-1.655173, -0.8406103, -3.182311, 1, 1, 1, 1, 1,
-1.644691, -0.1810353, -1.247515, 1, 1, 1, 1, 1,
-1.636965, 1.138645, -1.153739, 1, 1, 1, 1, 1,
-1.612599, 1.451656, -1.016453, 1, 1, 1, 1, 1,
-1.587795, -0.4449726, -1.792058, 1, 1, 1, 1, 1,
-1.577378, -0.02662283, -2.327929, 1, 1, 1, 1, 1,
-1.573068, -0.7697179, -2.078554, 1, 1, 1, 1, 1,
-1.568174, 1.719303, -1.217783, 1, 1, 1, 1, 1,
-1.559367, 0.2257794, -1.071525, 1, 1, 1, 1, 1,
-1.555574, -0.1692818, -1.391461, 1, 1, 1, 1, 1,
-1.552906, 0.8355212, -1.729917, 1, 1, 1, 1, 1,
-1.547219, -2.135534, -2.887096, 1, 1, 1, 1, 1,
-1.535961, -0.0340534, -0.646643, 1, 1, 1, 1, 1,
-1.531298, 0.7582087, -1.760511, 1, 1, 1, 1, 1,
-1.514375, -0.6612212, -0.3795281, 1, 1, 1, 1, 1,
-1.505909, 1.56577, -2.792243, 0, 0, 1, 1, 1,
-1.503068, -0.2398098, -1.080478, 1, 0, 0, 1, 1,
-1.500313, 0.1305416, -4.527527, 1, 0, 0, 1, 1,
-1.496103, -1.253971, -1.223666, 1, 0, 0, 1, 1,
-1.472898, 2.686888, 0.4722505, 1, 0, 0, 1, 1,
-1.468457, -2.057112, -3.384368, 1, 0, 0, 1, 1,
-1.46481, 1.470504, -2.174411, 0, 0, 0, 1, 1,
-1.46469, -0.09828925, -1.728031, 0, 0, 0, 1, 1,
-1.447388, 0.9518385, -1.513719, 0, 0, 0, 1, 1,
-1.447098, -0.4248692, -2.615009, 0, 0, 0, 1, 1,
-1.442351, 2.132431, -1.0037, 0, 0, 0, 1, 1,
-1.429493, 0.0936068, -2.974317, 0, 0, 0, 1, 1,
-1.42207, -0.3645484, -1.391093, 0, 0, 0, 1, 1,
-1.40759, -0.9411753, -2.28468, 1, 1, 1, 1, 1,
-1.406625, -2.626775, -2.573878, 1, 1, 1, 1, 1,
-1.386622, 1.200521, 1.133953, 1, 1, 1, 1, 1,
-1.383312, 0.8188976, -3.773535, 1, 1, 1, 1, 1,
-1.374581, 0.2793666, 0.02652893, 1, 1, 1, 1, 1,
-1.371878, -2.699092, -2.004263, 1, 1, 1, 1, 1,
-1.364836, 0.2314471, -2.93598, 1, 1, 1, 1, 1,
-1.362467, 0.410738, -1.216231, 1, 1, 1, 1, 1,
-1.359596, 0.05752755, -2.271256, 1, 1, 1, 1, 1,
-1.357446, 1.002373, -0.1222381, 1, 1, 1, 1, 1,
-1.354923, 1.342209, -1.106971, 1, 1, 1, 1, 1,
-1.351059, 0.7275383, -1.485488, 1, 1, 1, 1, 1,
-1.346182, -0.07466449, -2.707508, 1, 1, 1, 1, 1,
-1.343955, 0.2814781, 1.148516, 1, 1, 1, 1, 1,
-1.342668, -0.09618777, -3.66234, 1, 1, 1, 1, 1,
-1.335027, 1.022912, -1.473267, 0, 0, 1, 1, 1,
-1.322675, 0.5247408, 0.7535098, 1, 0, 0, 1, 1,
-1.319168, -0.1211823, -2.048851, 1, 0, 0, 1, 1,
-1.319058, -0.6117147, -1.190828, 1, 0, 0, 1, 1,
-1.318696, 0.5546498, -0.4227211, 1, 0, 0, 1, 1,
-1.316898, -1.099782, -1.409879, 1, 0, 0, 1, 1,
-1.299578, -0.893654, -1.445814, 0, 0, 0, 1, 1,
-1.29626, 0.2155482, -2.134391, 0, 0, 0, 1, 1,
-1.290016, -0.2515625, -2.256335, 0, 0, 0, 1, 1,
-1.284693, -0.7021935, -2.079011, 0, 0, 0, 1, 1,
-1.274764, -0.231279, -2.021067, 0, 0, 0, 1, 1,
-1.26935, 0.8721584, 0.1486087, 0, 0, 0, 1, 1,
-1.268188, 0.5958933, -1.230338, 0, 0, 0, 1, 1,
-1.264557, 0.3111607, -1.924391, 1, 1, 1, 1, 1,
-1.262279, 1.205021, 0.8071168, 1, 1, 1, 1, 1,
-1.254499, 0.5580471, 0.2503324, 1, 1, 1, 1, 1,
-1.251276, -1.135106, -1.59703, 1, 1, 1, 1, 1,
-1.250084, -0.1847016, 0.3861725, 1, 1, 1, 1, 1,
-1.244048, -0.0389545, 0.2696892, 1, 1, 1, 1, 1,
-1.243783, 0.9365578, -1.008656, 1, 1, 1, 1, 1,
-1.240743, 0.7490776, -1.374596, 1, 1, 1, 1, 1,
-1.230925, 1.000944, -1.002181, 1, 1, 1, 1, 1,
-1.227087, -0.9459289, -0.09135829, 1, 1, 1, 1, 1,
-1.220027, -0.06907181, 1.042717, 1, 1, 1, 1, 1,
-1.217333, 0.7360402, -1.92556, 1, 1, 1, 1, 1,
-1.217323, -1.82609, -2.757463, 1, 1, 1, 1, 1,
-1.209796, 0.921743, -1.133248, 1, 1, 1, 1, 1,
-1.207938, -0.7290192, -3.225079, 1, 1, 1, 1, 1,
-1.203362, 0.7320407, -0.7740183, 0, 0, 1, 1, 1,
-1.193544, -0.2379792, -3.18301, 1, 0, 0, 1, 1,
-1.184384, -1.212879, -3.312627, 1, 0, 0, 1, 1,
-1.18161, 0.2807071, -0.9331728, 1, 0, 0, 1, 1,
-1.174981, -0.482805, -1.994371, 1, 0, 0, 1, 1,
-1.164919, 0.9255025, -0.4657067, 1, 0, 0, 1, 1,
-1.159674, -3.116012, -4.395988, 0, 0, 0, 1, 1,
-1.157899, 1.269132, 0.3488321, 0, 0, 0, 1, 1,
-1.152637, -1.588403, -1.137362, 0, 0, 0, 1, 1,
-1.151753, -1.719959, -1.033147, 0, 0, 0, 1, 1,
-1.149012, 2.252686, -2.037442, 0, 0, 0, 1, 1,
-1.14661, -0.6052271, -3.564976, 0, 0, 0, 1, 1,
-1.128484, -1.764162, -3.804309, 0, 0, 0, 1, 1,
-1.125433, -0.005919787, -1.545517, 1, 1, 1, 1, 1,
-1.120961, -1.187235, -2.579774, 1, 1, 1, 1, 1,
-1.108095, 0.2073519, -0.6856602, 1, 1, 1, 1, 1,
-1.096134, -0.3613212, -1.253839, 1, 1, 1, 1, 1,
-1.095485, 0.4541795, -0.5321422, 1, 1, 1, 1, 1,
-1.093263, 1.249658, 1.130067, 1, 1, 1, 1, 1,
-1.092297, -0.875946, -2.08611, 1, 1, 1, 1, 1,
-1.090646, 1.180396, -0.2388886, 1, 1, 1, 1, 1,
-1.089905, 1.179403, -2.164304, 1, 1, 1, 1, 1,
-1.088035, 0.1600451, -0.4476701, 1, 1, 1, 1, 1,
-1.085955, 0.5750493, -0.1439381, 1, 1, 1, 1, 1,
-1.084262, -1.606184, -0.7996579, 1, 1, 1, 1, 1,
-1.07973, -0.3817613, 0.4648905, 1, 1, 1, 1, 1,
-1.079146, -1.103594, -2.020089, 1, 1, 1, 1, 1,
-1.074796, 0.430897, -0.3429014, 1, 1, 1, 1, 1,
-1.069913, 0.6206851, -1.500663, 0, 0, 1, 1, 1,
-1.068844, -0.1817713, -3.02782, 1, 0, 0, 1, 1,
-1.068583, 0.1783895, -1.049291, 1, 0, 0, 1, 1,
-1.067536, 0.9133271, -1.761652, 1, 0, 0, 1, 1,
-1.060552, -0.06970534, -0.6862313, 1, 0, 0, 1, 1,
-1.055194, 0.3535497, 1.05766, 1, 0, 0, 1, 1,
-1.05455, -0.85821, -2.122382, 0, 0, 0, 1, 1,
-1.053635, 0.1956516, -0.05756024, 0, 0, 0, 1, 1,
-1.052232, -0.01600967, -0.7973806, 0, 0, 0, 1, 1,
-1.041767, 0.9795138, -1.529078, 0, 0, 0, 1, 1,
-1.032102, -0.7094927, -1.091494, 0, 0, 0, 1, 1,
-1.031217, -1.221731, -2.252272, 0, 0, 0, 1, 1,
-1.019807, -0.5720103, -1.778097, 0, 0, 0, 1, 1,
-1.01516, -0.1962591, -2.965487, 1, 1, 1, 1, 1,
-1.012551, -0.4503224, -2.060705, 1, 1, 1, 1, 1,
-1.008667, -0.2782841, -2.077946, 1, 1, 1, 1, 1,
-1.00526, -1.307637, -1.947989, 1, 1, 1, 1, 1,
-1.002035, -0.8726709, -0.6817981, 1, 1, 1, 1, 1,
-0.9872383, -0.1662691, -2.429213, 1, 1, 1, 1, 1,
-0.9856492, 1.635346, 0.7923556, 1, 1, 1, 1, 1,
-0.985597, 0.2213621, -1.156788, 1, 1, 1, 1, 1,
-0.9813485, -0.3910948, -2.963421, 1, 1, 1, 1, 1,
-0.9796353, 0.4416986, -1.355919, 1, 1, 1, 1, 1,
-0.9795957, -0.2271055, -3.241936, 1, 1, 1, 1, 1,
-0.9753309, -0.973138, -2.917661, 1, 1, 1, 1, 1,
-0.9734055, 2.247062, -0.04570223, 1, 1, 1, 1, 1,
-0.97224, 1.234673, -1.89208, 1, 1, 1, 1, 1,
-0.9663744, 2.041759, -0.4751603, 1, 1, 1, 1, 1,
-0.9613969, 0.1097084, -0.7120389, 0, 0, 1, 1, 1,
-0.9596568, -0.5863793, -1.581353, 1, 0, 0, 1, 1,
-0.9562652, -0.1579614, 0.4382124, 1, 0, 0, 1, 1,
-0.9467027, -0.1221183, -3.894356, 1, 0, 0, 1, 1,
-0.9434198, 0.2485832, -0.3592449, 1, 0, 0, 1, 1,
-0.9365817, -0.6013792, -2.841224, 1, 0, 0, 1, 1,
-0.9353359, 1.778604, -0.5284964, 0, 0, 0, 1, 1,
-0.9276624, 0.6118436, -0.4243474, 0, 0, 0, 1, 1,
-0.9218231, 0.7898529, -2.762485, 0, 0, 0, 1, 1,
-0.9208412, 1.390943, -0.5357439, 0, 0, 0, 1, 1,
-0.9203151, 0.8568568, -1.854648, 0, 0, 0, 1, 1,
-0.918076, 0.1304038, -0.9459687, 0, 0, 0, 1, 1,
-0.9152323, -0.04505903, -2.841671, 0, 0, 0, 1, 1,
-0.9083594, 0.2799188, -1.344866, 1, 1, 1, 1, 1,
-0.9063934, 0.2904683, -1.953964, 1, 1, 1, 1, 1,
-0.8992586, -1.538823, -1.581983, 1, 1, 1, 1, 1,
-0.8980658, -1.210915, -1.760496, 1, 1, 1, 1, 1,
-0.8966689, 1.28368, -0.9693081, 1, 1, 1, 1, 1,
-0.8953658, 0.5872446, -1.701057, 1, 1, 1, 1, 1,
-0.8929687, 0.311952, -1.465851, 1, 1, 1, 1, 1,
-0.8824136, 0.7573035, -1.00053, 1, 1, 1, 1, 1,
-0.8790707, -0.3866469, -0.8565062, 1, 1, 1, 1, 1,
-0.8763356, 0.8360305, -0.9929096, 1, 1, 1, 1, 1,
-0.8745928, -2.366069, -3.94941, 1, 1, 1, 1, 1,
-0.8714508, -0.1836043, -1.406455, 1, 1, 1, 1, 1,
-0.8677293, -0.6864209, -3.043653, 1, 1, 1, 1, 1,
-0.8648157, 0.8280793, 0.5186375, 1, 1, 1, 1, 1,
-0.8578443, 0.1601906, -1.246874, 1, 1, 1, 1, 1,
-0.8529868, -1.026414, -2.232701, 0, 0, 1, 1, 1,
-0.8525161, -0.2542774, -1.036325, 1, 0, 0, 1, 1,
-0.8431499, 0.4869055, -1.921375, 1, 0, 0, 1, 1,
-0.8408298, -2.050783, -5.397386, 1, 0, 0, 1, 1,
-0.8383366, 0.1951379, -1.093241, 1, 0, 0, 1, 1,
-0.8369789, 0.2067313, -1.146835, 1, 0, 0, 1, 1,
-0.8367808, -0.6731837, -3.852318, 0, 0, 0, 1, 1,
-0.8342612, -0.7442727, -2.469728, 0, 0, 0, 1, 1,
-0.818654, 0.8868763, 0.0127833, 0, 0, 0, 1, 1,
-0.8173101, -0.04553989, -2.435689, 0, 0, 0, 1, 1,
-0.8149732, -0.260305, -1.570289, 0, 0, 0, 1, 1,
-0.8102053, -0.4768462, -3.179444, 0, 0, 0, 1, 1,
-0.8101921, -0.731012, -3.314333, 0, 0, 0, 1, 1,
-0.8097866, 0.2865441, -0.05279871, 1, 1, 1, 1, 1,
-0.8076563, 1.524224, 1.924309, 1, 1, 1, 1, 1,
-0.8020931, -1.199902, -4.20751, 1, 1, 1, 1, 1,
-0.7990595, 0.7622229, -1.302189, 1, 1, 1, 1, 1,
-0.7984454, -0.1065851, -3.084488, 1, 1, 1, 1, 1,
-0.7980568, 0.3896482, -1.307995, 1, 1, 1, 1, 1,
-0.7980298, 0.6098686, 0.3942933, 1, 1, 1, 1, 1,
-0.7926532, 0.03431164, -2.364575, 1, 1, 1, 1, 1,
-0.7899907, -0.64721, -2.660974, 1, 1, 1, 1, 1,
-0.7872903, 0.1008103, -1.009587, 1, 1, 1, 1, 1,
-0.7867049, 0.6123372, -2.160441, 1, 1, 1, 1, 1,
-0.7865966, -1.601756, -1.920775, 1, 1, 1, 1, 1,
-0.7864431, -0.374591, -2.117754, 1, 1, 1, 1, 1,
-0.7859235, -0.8352072, -3.111058, 1, 1, 1, 1, 1,
-0.7838746, -0.1792127, -2.375559, 1, 1, 1, 1, 1,
-0.7820454, 1.281297, 1.380234, 0, 0, 1, 1, 1,
-0.7813948, -1.071059, -2.960203, 1, 0, 0, 1, 1,
-0.7794671, 1.487115, -0.8497023, 1, 0, 0, 1, 1,
-0.7722223, -0.9967945, -4.009671, 1, 0, 0, 1, 1,
-0.7698964, 0.3175693, -0.4248073, 1, 0, 0, 1, 1,
-0.7693084, 1.218407, -1.309667, 1, 0, 0, 1, 1,
-0.7685581, -1.055546, -2.945265, 0, 0, 0, 1, 1,
-0.7645809, 0.8368229, -1.521524, 0, 0, 0, 1, 1,
-0.7630237, -1.184247, -2.31096, 0, 0, 0, 1, 1,
-0.7564207, -0.2984775, -1.336448, 0, 0, 0, 1, 1,
-0.7527639, -0.5812035, -1.933615, 0, 0, 0, 1, 1,
-0.7523353, 0.4275931, -2.602445, 0, 0, 0, 1, 1,
-0.741261, 0.3969755, -0.2163238, 0, 0, 0, 1, 1,
-0.7403631, 0.220874, -0.2732478, 1, 1, 1, 1, 1,
-0.7363671, -0.7299294, -4.265397, 1, 1, 1, 1, 1,
-0.7358561, 1.506223, -0.6536629, 1, 1, 1, 1, 1,
-0.7331612, 0.508473, -2.601235, 1, 1, 1, 1, 1,
-0.730796, 1.422807, -2.067879, 1, 1, 1, 1, 1,
-0.729516, -0.3090153, -2.129003, 1, 1, 1, 1, 1,
-0.7291259, 1.516494, 0.6330982, 1, 1, 1, 1, 1,
-0.723946, 0.2105691, -2.351268, 1, 1, 1, 1, 1,
-0.7218187, 1.213313, 0.9330995, 1, 1, 1, 1, 1,
-0.7161556, -0.033491, -1.473723, 1, 1, 1, 1, 1,
-0.7126808, -0.7453245, -3.994292, 1, 1, 1, 1, 1,
-0.7113613, -0.7575042, -1.012482, 1, 1, 1, 1, 1,
-0.7110401, 1.729472, -0.2367503, 1, 1, 1, 1, 1,
-0.7057959, 0.06536731, -3.28119, 1, 1, 1, 1, 1,
-0.7031494, 0.2791374, -2.752578, 1, 1, 1, 1, 1,
-0.7006205, 0.2671492, -0.8030082, 0, 0, 1, 1, 1,
-0.6989778, 0.1755598, -1.168826, 1, 0, 0, 1, 1,
-0.6977187, 0.6832348, -1.715671, 1, 0, 0, 1, 1,
-0.6944991, 0.2088847, -0.3786546, 1, 0, 0, 1, 1,
-0.6858101, 0.144903, -2.651202, 1, 0, 0, 1, 1,
-0.6782351, 1.748533, 0.4414918, 1, 0, 0, 1, 1,
-0.6774892, 0.1906434, -1.911777, 0, 0, 0, 1, 1,
-0.6772423, 1.077445, -0.3926982, 0, 0, 0, 1, 1,
-0.6759762, -1.035924, -2.971936, 0, 0, 0, 1, 1,
-0.673755, 0.9923813, -0.8086606, 0, 0, 0, 1, 1,
-0.6707973, 0.5438123, -1.470523, 0, 0, 0, 1, 1,
-0.6705657, 0.7921702, -0.9655811, 0, 0, 0, 1, 1,
-0.6657533, -0.3107359, -1.794384, 0, 0, 0, 1, 1,
-0.6632817, 1.118637, -1.041955, 1, 1, 1, 1, 1,
-0.6624936, 0.7150479, 1.420825, 1, 1, 1, 1, 1,
-0.6613839, -2.591258, -1.341522, 1, 1, 1, 1, 1,
-0.6587287, 0.435046, -1.600406, 1, 1, 1, 1, 1,
-0.652801, -0.3092169, -2.019345, 1, 1, 1, 1, 1,
-0.6482994, -0.2094742, -0.3512473, 1, 1, 1, 1, 1,
-0.6479452, 1.536797, -0.3260446, 1, 1, 1, 1, 1,
-0.6446154, 0.692173, -0.2296828, 1, 1, 1, 1, 1,
-0.642141, 0.5004894, -0.4600856, 1, 1, 1, 1, 1,
-0.6388611, -1.399374, -2.85329, 1, 1, 1, 1, 1,
-0.6378295, 0.3743327, -0.5190317, 1, 1, 1, 1, 1,
-0.6341431, 0.1712035, -0.1484501, 1, 1, 1, 1, 1,
-0.6289853, -0.8892563, -2.842485, 1, 1, 1, 1, 1,
-0.6289287, -0.1362273, -1.605987, 1, 1, 1, 1, 1,
-0.6284903, -1.091825, -0.8289756, 1, 1, 1, 1, 1,
-0.6241123, 0.2852169, -1.299469, 0, 0, 1, 1, 1,
-0.6214066, -0.9370652, -0.01111387, 1, 0, 0, 1, 1,
-0.6212105, -0.07903438, -0.3252181, 1, 0, 0, 1, 1,
-0.6181656, 0.6082404, -0.5763835, 1, 0, 0, 1, 1,
-0.6166394, 0.2563433, -1.862934, 1, 0, 0, 1, 1,
-0.6158995, -0.8284189, -0.4160697, 1, 0, 0, 1, 1,
-0.6110934, 0.767333, 0.3753187, 0, 0, 0, 1, 1,
-0.6109781, 2.130346, -0.381124, 0, 0, 0, 1, 1,
-0.6016774, -0.9028355, -4.496159, 0, 0, 0, 1, 1,
-0.6009448, -0.1348316, -4.177713, 0, 0, 0, 1, 1,
-0.5996862, 1.066292, 0.3221547, 0, 0, 0, 1, 1,
-0.5992631, 1.218122, 0.04624397, 0, 0, 0, 1, 1,
-0.5990633, 1.018853, 0.5749767, 0, 0, 0, 1, 1,
-0.5988224, 1.604081, -0.6772528, 1, 1, 1, 1, 1,
-0.5951084, -0.08851373, -1.165795, 1, 1, 1, 1, 1,
-0.5906032, 0.7387913, -0.9387935, 1, 1, 1, 1, 1,
-0.5905014, -0.0981805, -2.925197, 1, 1, 1, 1, 1,
-0.58731, -0.963755, -2.656269, 1, 1, 1, 1, 1,
-0.5872836, -0.6651447, -1.672723, 1, 1, 1, 1, 1,
-0.5759818, -0.983761, -1.622134, 1, 1, 1, 1, 1,
-0.5755162, -0.0217666, 0.361576, 1, 1, 1, 1, 1,
-0.5741009, -1.34939, -4.069688, 1, 1, 1, 1, 1,
-0.5696414, -0.912965, -0.3040166, 1, 1, 1, 1, 1,
-0.569493, -1.086345, -0.6431957, 1, 1, 1, 1, 1,
-0.566642, 0.6795624, 0.2625973, 1, 1, 1, 1, 1,
-0.5630466, 0.7234372, -0.611821, 1, 1, 1, 1, 1,
-0.5604523, 0.03215738, -0.6933155, 1, 1, 1, 1, 1,
-0.5593285, -0.9976222, -2.76335, 1, 1, 1, 1, 1,
-0.5563149, 0.4857448, -2.012626, 0, 0, 1, 1, 1,
-0.5559322, -0.2924384, -2.955223, 1, 0, 0, 1, 1,
-0.5559286, -1.857289, -2.689175, 1, 0, 0, 1, 1,
-0.5539372, -1.102416, -2.714095, 1, 0, 0, 1, 1,
-0.5535685, 0.4161184, -0.1678605, 1, 0, 0, 1, 1,
-0.5486915, -1.090963, -2.614917, 1, 0, 0, 1, 1,
-0.5484402, -1.260952, -3.040177, 0, 0, 0, 1, 1,
-0.5462599, -0.01512781, -1.890332, 0, 0, 0, 1, 1,
-0.5418084, 0.6128426, 0.2763981, 0, 0, 0, 1, 1,
-0.5400552, -2.671824, -2.592052, 0, 0, 0, 1, 1,
-0.5314316, 0.8788819, -0.3930329, 0, 0, 0, 1, 1,
-0.5294214, -0.4778858, -1.368532, 0, 0, 0, 1, 1,
-0.5283005, 0.3225987, -2.319406, 0, 0, 0, 1, 1,
-0.5220073, -0.6435165, -3.730934, 1, 1, 1, 1, 1,
-0.5205328, 0.4291238, 0.5212064, 1, 1, 1, 1, 1,
-0.5185343, 0.3932558, -0.1199658, 1, 1, 1, 1, 1,
-0.5161161, 1.581758, 0.2965309, 1, 1, 1, 1, 1,
-0.5154659, 0.1408918, -2.818547, 1, 1, 1, 1, 1,
-0.5138883, -3.705391, -3.957266, 1, 1, 1, 1, 1,
-0.5137069, 2.02415, 1.461515, 1, 1, 1, 1, 1,
-0.5092635, 0.09724369, -0.5823621, 1, 1, 1, 1, 1,
-0.5042829, -1.238882, -4.839163, 1, 1, 1, 1, 1,
-0.5032431, 0.5250403, 0.3694572, 1, 1, 1, 1, 1,
-0.4982767, -1.047924, -4.113491, 1, 1, 1, 1, 1,
-0.4979007, -0.4605412, -2.757956, 1, 1, 1, 1, 1,
-0.4919084, 1.12799, 1.242958, 1, 1, 1, 1, 1,
-0.4918952, 1.043755, 1.686111, 1, 1, 1, 1, 1,
-0.4871178, 0.7929083, 0.558353, 1, 1, 1, 1, 1,
-0.4828737, -0.0107802, -1.281499, 0, 0, 1, 1, 1,
-0.4752054, -1.250467, -3.689847, 1, 0, 0, 1, 1,
-0.4679261, -0.1732776, -0.6400844, 1, 0, 0, 1, 1,
-0.4669382, -1.491707, -3.399913, 1, 0, 0, 1, 1,
-0.4664244, -0.3679022, -2.253632, 1, 0, 0, 1, 1,
-0.4519423, -1.564684, -1.215714, 1, 0, 0, 1, 1,
-0.4511406, -1.626518, -4.535627, 0, 0, 0, 1, 1,
-0.4460727, -0.1790144, -3.713518, 0, 0, 0, 1, 1,
-0.4443684, 0.6426415, -0.1727583, 0, 0, 0, 1, 1,
-0.4429329, 0.6596739, -0.5851672, 0, 0, 0, 1, 1,
-0.4394675, -0.3687579, -1.705014, 0, 0, 0, 1, 1,
-0.4384367, -1.682763, -3.123953, 0, 0, 0, 1, 1,
-0.4380527, -0.06891915, -0.1732891, 0, 0, 0, 1, 1,
-0.4365489, 1.023077, -0.1115622, 1, 1, 1, 1, 1,
-0.4311523, 0.3557734, -2.061913, 1, 1, 1, 1, 1,
-0.4295137, -0.02723383, -0.9474114, 1, 1, 1, 1, 1,
-0.4273789, -0.2041261, -3.111679, 1, 1, 1, 1, 1,
-0.4215357, 0.2865005, -1.570864, 1, 1, 1, 1, 1,
-0.4207199, 1.603399, -1.843579, 1, 1, 1, 1, 1,
-0.4206466, 0.1769233, -1.414526, 1, 1, 1, 1, 1,
-0.4203115, -0.783114, -2.715333, 1, 1, 1, 1, 1,
-0.4175064, 2.282817, 0.3639069, 1, 1, 1, 1, 1,
-0.413032, 0.2164246, -0.7305028, 1, 1, 1, 1, 1,
-0.4111035, 0.2335333, -1.811204, 1, 1, 1, 1, 1,
-0.408182, -0.06368098, -1.424775, 1, 1, 1, 1, 1,
-0.4056752, -0.5827802, -1.152937, 1, 1, 1, 1, 1,
-0.4048025, -1.441126, -3.302157, 1, 1, 1, 1, 1,
-0.4033386, 2.038188, 0.07052866, 1, 1, 1, 1, 1,
-0.3966548, 0.2536696, -2.378917, 0, 0, 1, 1, 1,
-0.3961878, -1.885701, -2.219047, 1, 0, 0, 1, 1,
-0.3940322, 1.235227, 0.7527688, 1, 0, 0, 1, 1,
-0.3933654, 0.4490292, -0.09294727, 1, 0, 0, 1, 1,
-0.391362, -0.5889555, -2.786831, 1, 0, 0, 1, 1,
-0.3882773, 0.02865368, -3.744747, 1, 0, 0, 1, 1,
-0.3831547, 1.067903, 0.4360535, 0, 0, 0, 1, 1,
-0.381846, -0.792841, -2.662837, 0, 0, 0, 1, 1,
-0.3786069, 0.03815251, -3.000121, 0, 0, 0, 1, 1,
-0.3747461, 1.84022, 0.4689423, 0, 0, 0, 1, 1,
-0.373458, -0.7855766, -2.633657, 0, 0, 0, 1, 1,
-0.3682198, -0.06556204, -1.574503, 0, 0, 0, 1, 1,
-0.361037, 1.007178, -0.6852888, 0, 0, 0, 1, 1,
-0.3566375, -0.9974263, -2.712602, 1, 1, 1, 1, 1,
-0.3546018, 1.896898, 1.412531, 1, 1, 1, 1, 1,
-0.3530857, -0.5218211, -2.365106, 1, 1, 1, 1, 1,
-0.3521415, 0.1906864, -0.9239033, 1, 1, 1, 1, 1,
-0.3487505, -0.6449402, -1.717237, 1, 1, 1, 1, 1,
-0.348241, -0.0979934, -0.8460124, 1, 1, 1, 1, 1,
-0.3377633, 1.558726, 0.3484044, 1, 1, 1, 1, 1,
-0.3302938, 0.1789695, -1.390457, 1, 1, 1, 1, 1,
-0.3270668, -1.034752, -2.004252, 1, 1, 1, 1, 1,
-0.32478, 0.9864953, -0.327543, 1, 1, 1, 1, 1,
-0.3232957, -1.247299, -3.792207, 1, 1, 1, 1, 1,
-0.3195827, 0.2418513, -2.126365, 1, 1, 1, 1, 1,
-0.3156519, -1.708546, -3.560011, 1, 1, 1, 1, 1,
-0.3102629, -1.186437, -3.530847, 1, 1, 1, 1, 1,
-0.3065663, -1.094867, -1.722893, 1, 1, 1, 1, 1,
-0.2958639, 0.5361739, -0.5699088, 0, 0, 1, 1, 1,
-0.2954603, 0.6928653, -1.2125, 1, 0, 0, 1, 1,
-0.294535, -1.875245, -1.686028, 1, 0, 0, 1, 1,
-0.2929833, 0.1658878, -2.440728, 1, 0, 0, 1, 1,
-0.2898331, -0.04481761, -2.586572, 1, 0, 0, 1, 1,
-0.2799392, -1.026714, -4.565392, 1, 0, 0, 1, 1,
-0.2781579, -1.001222, -2.334311, 0, 0, 0, 1, 1,
-0.2780848, -1.375086, -2.231403, 0, 0, 0, 1, 1,
-0.2779475, -0.2823366, -0.8763419, 0, 0, 0, 1, 1,
-0.2754899, -1.489198, -1.009886, 0, 0, 0, 1, 1,
-0.2750288, 0.2537643, -0.651793, 0, 0, 0, 1, 1,
-0.2739491, 0.5948498, -0.2009228, 0, 0, 0, 1, 1,
-0.2724543, -0.1507126, -2.892647, 0, 0, 0, 1, 1,
-0.2672226, -0.5831159, -3.735774, 1, 1, 1, 1, 1,
-0.2661648, -0.5626847, -2.729534, 1, 1, 1, 1, 1,
-0.2656492, -0.4489837, -3.532313, 1, 1, 1, 1, 1,
-0.2651045, 0.519356, -0.2197442, 1, 1, 1, 1, 1,
-0.264674, 0.4419953, -0.5478745, 1, 1, 1, 1, 1,
-0.2644856, 0.2705429, -3.011177, 1, 1, 1, 1, 1,
-0.2632715, 1.030116, -0.1644151, 1, 1, 1, 1, 1,
-0.2623937, -1.189922, -4.10148, 1, 1, 1, 1, 1,
-0.2594114, -0.3909783, -2.959203, 1, 1, 1, 1, 1,
-0.2592365, -1.092016, -2.943093, 1, 1, 1, 1, 1,
-0.2587265, 0.4420144, -1.036991, 1, 1, 1, 1, 1,
-0.2569485, -0.05612316, -3.273422, 1, 1, 1, 1, 1,
-0.2561951, -1.686253, -3.88616, 1, 1, 1, 1, 1,
-0.2487048, 0.5296156, -0.03032437, 1, 1, 1, 1, 1,
-0.2483054, -0.6065096, -3.7317, 1, 1, 1, 1, 1,
-0.2467742, -1.288664, -4.35291, 0, 0, 1, 1, 1,
-0.2370492, 0.6026803, -1.76461, 1, 0, 0, 1, 1,
-0.233718, 0.6824722, -0.4437199, 1, 0, 0, 1, 1,
-0.2336958, -0.2591118, -4.59448, 1, 0, 0, 1, 1,
-0.2330041, -0.395681, -3.077657, 1, 0, 0, 1, 1,
-0.2317192, -0.4619689, -3.858617, 1, 0, 0, 1, 1,
-0.2292831, 2.808399, -1.693363, 0, 0, 0, 1, 1,
-0.2263607, 2.593509, -1.286126, 0, 0, 0, 1, 1,
-0.2231336, -0.6825356, -2.269701, 0, 0, 0, 1, 1,
-0.2220915, 0.2566968, -0.7083541, 0, 0, 0, 1, 1,
-0.2198294, -2.011214, -3.590861, 0, 0, 0, 1, 1,
-0.2184066, 1.863849, -0.4978164, 0, 0, 0, 1, 1,
-0.2141445, -0.03407219, -2.369979, 0, 0, 0, 1, 1,
-0.2119275, -0.7246543, -2.713709, 1, 1, 1, 1, 1,
-0.2088663, -1.235773, -3.413956, 1, 1, 1, 1, 1,
-0.2083659, 1.555241, -0.4080348, 1, 1, 1, 1, 1,
-0.2057891, 1.30357, -0.1741526, 1, 1, 1, 1, 1,
-0.1991406, 1.255083, -0.6654841, 1, 1, 1, 1, 1,
-0.1935218, 1.410343, 0.5732468, 1, 1, 1, 1, 1,
-0.1928239, -1.067329, -3.881761, 1, 1, 1, 1, 1,
-0.1837537, 0.3884228, -1.587995, 1, 1, 1, 1, 1,
-0.181372, 0.2173329, -1.056083, 1, 1, 1, 1, 1,
-0.1782201, 1.078369, -1.347038, 1, 1, 1, 1, 1,
-0.1730112, 1.286285, 1.170736, 1, 1, 1, 1, 1,
-0.1657954, 0.2657137, -1.731194, 1, 1, 1, 1, 1,
-0.1656815, 1.189404, 0.7940313, 1, 1, 1, 1, 1,
-0.1654552, 2.606406, -1.59494, 1, 1, 1, 1, 1,
-0.1652168, 0.007798053, 0.7074668, 1, 1, 1, 1, 1,
-0.1635091, -0.9193994, -0.08716708, 0, 0, 1, 1, 1,
-0.1627593, 0.3224297, 1.623821, 1, 0, 0, 1, 1,
-0.1618339, -2.480869, -3.536233, 1, 0, 0, 1, 1,
-0.1616583, 0.5297717, -0.05779103, 1, 0, 0, 1, 1,
-0.1598121, 0.5982426, 0.9851762, 1, 0, 0, 1, 1,
-0.1573565, 1.176256, -0.723978, 1, 0, 0, 1, 1,
-0.1537567, 0.6632671, -0.7558861, 0, 0, 0, 1, 1,
-0.1505617, -1.189835, -2.144793, 0, 0, 0, 1, 1,
-0.1468196, -0.2009096, -5.785961, 0, 0, 0, 1, 1,
-0.1415002, 1.322017, 1.360338, 0, 0, 0, 1, 1,
-0.1403422, -0.6176738, -1.872866, 0, 0, 0, 1, 1,
-0.1389207, 1.13328, -1.290013, 0, 0, 0, 1, 1,
-0.1378803, 0.6702633, -0.3381331, 0, 0, 0, 1, 1,
-0.1323396, -2.303206, -1.45749, 1, 1, 1, 1, 1,
-0.1312729, 0.9602177, 0.2844679, 1, 1, 1, 1, 1,
-0.1288006, 0.7478358, -0.5801123, 1, 1, 1, 1, 1,
-0.1263707, -1.276591, -3.385599, 1, 1, 1, 1, 1,
-0.1207699, -0.9536751, -4.843634, 1, 1, 1, 1, 1,
-0.1202808, -1.200064, -3.186529, 1, 1, 1, 1, 1,
-0.1184292, 0.5778607, -1.521487, 1, 1, 1, 1, 1,
-0.1126081, -1.13043, -3.482662, 1, 1, 1, 1, 1,
-0.1087383, 0.9384077, 0.6951951, 1, 1, 1, 1, 1,
-0.1083248, -0.7229167, -4.016382, 1, 1, 1, 1, 1,
-0.1075131, -1.355873, -2.367868, 1, 1, 1, 1, 1,
-0.1018981, -1.858298, -2.390357, 1, 1, 1, 1, 1,
-0.1008276, -0.1364478, -4.20252, 1, 1, 1, 1, 1,
-0.09995988, 1.381883, 0.5665476, 1, 1, 1, 1, 1,
-0.09790825, 0.5825698, -1.186226, 1, 1, 1, 1, 1,
-0.09789626, -1.236021, -4.366593, 0, 0, 1, 1, 1,
-0.09554603, -0.8347759, -4.237996, 1, 0, 0, 1, 1,
-0.09420748, 0.6143267, -0.8856966, 1, 0, 0, 1, 1,
-0.0923404, 0.8993852, -1.106981, 1, 0, 0, 1, 1,
-0.09108341, 0.9152322, -0.03917072, 1, 0, 0, 1, 1,
-0.08940877, 0.4714638, -0.9413584, 1, 0, 0, 1, 1,
-0.08931042, -1.052606, -1.94134, 0, 0, 0, 1, 1,
-0.0881517, 0.7672886, 1.016625, 0, 0, 0, 1, 1,
-0.08667028, 1.11756, 0.3544773, 0, 0, 0, 1, 1,
-0.08603397, -0.1793602, -0.8907869, 0, 0, 0, 1, 1,
-0.08107834, 0.01062512, -3.713307, 0, 0, 0, 1, 1,
-0.08088271, -0.4907782, -3.146133, 0, 0, 0, 1, 1,
-0.08045638, -1.373079, -3.96225, 0, 0, 0, 1, 1,
-0.06943368, -0.3364473, -1.545574, 1, 1, 1, 1, 1,
-0.06795373, 0.7743589, -0.9995908, 1, 1, 1, 1, 1,
-0.06608965, 0.7995692, -0.9650291, 1, 1, 1, 1, 1,
-0.05986917, -0.238975, -2.592788, 1, 1, 1, 1, 1,
-0.05648476, 1.353191, 0.5191563, 1, 1, 1, 1, 1,
-0.05629439, 1.511569, -1.116157, 1, 1, 1, 1, 1,
-0.05531216, -0.2500425, -2.743817, 1, 1, 1, 1, 1,
-0.05413251, 0.2482894, 1.650291, 1, 1, 1, 1, 1,
-0.05369375, 0.4487593, -2.257128, 1, 1, 1, 1, 1,
-0.04832869, 0.3208518, -0.751498, 1, 1, 1, 1, 1,
-0.04798282, 0.4230584, -0.3655638, 1, 1, 1, 1, 1,
-0.04709301, -1.441534, -1.916222, 1, 1, 1, 1, 1,
-0.04411321, 0.5731567, -0.01198561, 1, 1, 1, 1, 1,
-0.04393651, -0.8313257, -3.095653, 1, 1, 1, 1, 1,
-0.04268424, -1.494796, -3.473698, 1, 1, 1, 1, 1,
-0.04081809, -0.0123109, -2.472256, 0, 0, 1, 1, 1,
-0.04041264, 0.002777526, -1.650425, 1, 0, 0, 1, 1,
-0.03472007, 0.5922967, -1.9801, 1, 0, 0, 1, 1,
-0.03418066, 0.4552776, 0.3073771, 1, 0, 0, 1, 1,
-0.0293582, 0.9051284, -1.217551, 1, 0, 0, 1, 1,
-0.02642112, 1.404973, -1.339605, 1, 0, 0, 1, 1,
-0.02282948, 0.9146011, -1.380289, 0, 0, 0, 1, 1,
-0.02046616, 1.576825, 0.5988556, 0, 0, 0, 1, 1,
-0.01750733, 0.3807847, -1.104816, 0, 0, 0, 1, 1,
-0.01611265, 1.726488, 0.4857797, 0, 0, 0, 1, 1,
-0.01168351, -0.2462254, -3.441288, 0, 0, 0, 1, 1,
-0.002338192, -1.540918, -3.156499, 0, 0, 0, 1, 1,
-0.0008863264, -0.3682995, -2.239471, 0, 0, 0, 1, 1,
0.005239458, 1.431983, 0.3423671, 1, 1, 1, 1, 1,
0.005746901, -1.145699, 1.675482, 1, 1, 1, 1, 1,
0.008100044, 0.196689, -0.1764835, 1, 1, 1, 1, 1,
0.008169348, 1.941384, 0.7551991, 1, 1, 1, 1, 1,
0.008505195, -1.13661, 2.798743, 1, 1, 1, 1, 1,
0.01150985, -0.06528523, 3.652717, 1, 1, 1, 1, 1,
0.01391214, -0.4245648, 2.370316, 1, 1, 1, 1, 1,
0.0139559, -0.06848723, 3.609035, 1, 1, 1, 1, 1,
0.01727425, -0.5612973, 4.00104, 1, 1, 1, 1, 1,
0.0175666, -0.6141735, 2.301452, 1, 1, 1, 1, 1,
0.01997132, 0.6875725, 0.4863616, 1, 1, 1, 1, 1,
0.02482891, -0.3258781, 2.579965, 1, 1, 1, 1, 1,
0.02717075, -0.08290897, 2.357746, 1, 1, 1, 1, 1,
0.03199675, -0.9018294, 4.016783, 1, 1, 1, 1, 1,
0.03207934, -0.186294, 3.062382, 1, 1, 1, 1, 1,
0.04687984, 1.091862, -1.897099, 0, 0, 1, 1, 1,
0.04718968, 0.04240658, 0.4252952, 1, 0, 0, 1, 1,
0.05371035, 0.4740653, 1.399077, 1, 0, 0, 1, 1,
0.05517006, 1.322402, -0.2321061, 1, 0, 0, 1, 1,
0.0556695, -2.082601, 2.046602, 1, 0, 0, 1, 1,
0.0582057, -0.8242772, 2.931217, 1, 0, 0, 1, 1,
0.05856239, 1.30223, 0.4074594, 0, 0, 0, 1, 1,
0.0623848, -0.1674455, 4.853134, 0, 0, 0, 1, 1,
0.0627455, 0.7001516, -0.2789396, 0, 0, 0, 1, 1,
0.06448603, -0.2012062, 3.618692, 0, 0, 0, 1, 1,
0.06811363, 1.023752, 3.065995, 0, 0, 0, 1, 1,
0.07539236, 1.197309, -0.8123425, 0, 0, 0, 1, 1,
0.07698103, -2.340313, 2.040619, 0, 0, 0, 1, 1,
0.07813051, 0.6234585, -0.591453, 1, 1, 1, 1, 1,
0.08192192, -1.481174, 3.521515, 1, 1, 1, 1, 1,
0.08538406, -0.5062777, 2.823264, 1, 1, 1, 1, 1,
0.08735266, -0.03043602, 0.9713997, 1, 1, 1, 1, 1,
0.09443758, -0.3860089, 1.92611, 1, 1, 1, 1, 1,
0.09592879, 1.24751, -0.1618668, 1, 1, 1, 1, 1,
0.0966807, -0.2492684, 2.950227, 1, 1, 1, 1, 1,
0.09978482, 1.058861, 1.788826, 1, 1, 1, 1, 1,
0.1027765, 1.90884, -1.397518, 1, 1, 1, 1, 1,
0.107117, 0.1039174, 0.710997, 1, 1, 1, 1, 1,
0.1098659, -1.74133, 3.45341, 1, 1, 1, 1, 1,
0.112116, -1.387556e-05, 2.044069, 1, 1, 1, 1, 1,
0.1126416, 0.9254574, -0.09175076, 1, 1, 1, 1, 1,
0.1136253, 0.02925935, 0.322227, 1, 1, 1, 1, 1,
0.1175119, 1.288785, -0.9366318, 1, 1, 1, 1, 1,
0.1190718, 1.807789, 1.292483, 0, 0, 1, 1, 1,
0.1260941, -0.587653, 3.209473, 1, 0, 0, 1, 1,
0.1302205, -0.9937329, 4.05382, 1, 0, 0, 1, 1,
0.1369902, -0.05023405, 0.8847389, 1, 0, 0, 1, 1,
0.1391933, -0.8034493, 1.309491, 1, 0, 0, 1, 1,
0.1413019, 0.6318902, -0.1907012, 1, 0, 0, 1, 1,
0.1428857, 0.5166758, -0.005575326, 0, 0, 0, 1, 1,
0.1431043, -2.197544, 2.457334, 0, 0, 0, 1, 1,
0.1446385, -0.3313381, 2.384033, 0, 0, 0, 1, 1,
0.1457823, -0.401001, 3.68621, 0, 0, 0, 1, 1,
0.1464174, -1.111191, 1.082881, 0, 0, 0, 1, 1,
0.1531491, 0.718662, 0.4754099, 0, 0, 0, 1, 1,
0.1537112, -0.05755977, 4.021056, 0, 0, 0, 1, 1,
0.1540463, 1.925545, 0.05323691, 1, 1, 1, 1, 1,
0.1544897, -0.01188116, 1.972411, 1, 1, 1, 1, 1,
0.1597204, 0.8365878, -0.6584895, 1, 1, 1, 1, 1,
0.1644032, -1.275377, 4.338319, 1, 1, 1, 1, 1,
0.1648049, -0.2007092, 2.410197, 1, 1, 1, 1, 1,
0.1657606, -0.5719028, 4.589742, 1, 1, 1, 1, 1,
0.1706413, 0.08736614, 2.011267, 1, 1, 1, 1, 1,
0.1725911, -0.7256833, 2.920035, 1, 1, 1, 1, 1,
0.1740761, -0.4230272, 4.234198, 1, 1, 1, 1, 1,
0.1793359, -0.8051141, 3.769319, 1, 1, 1, 1, 1,
0.1862899, -0.4115697, 4.892349, 1, 1, 1, 1, 1,
0.1883654, 0.8850393, 1.465387, 1, 1, 1, 1, 1,
0.1886764, 0.9221265, 0.06437867, 1, 1, 1, 1, 1,
0.1902007, 0.1131542, 1.41633, 1, 1, 1, 1, 1,
0.1935991, -0.6065924, 2.716006, 1, 1, 1, 1, 1,
0.1962857, -0.2764602, 4.449569, 0, 0, 1, 1, 1,
0.1999516, -0.9546949, 2.693611, 1, 0, 0, 1, 1,
0.2026606, -1.148107, 4.360599, 1, 0, 0, 1, 1,
0.2034343, 0.6526332, 0.4691916, 1, 0, 0, 1, 1,
0.2040279, 0.111943, 1.369868, 1, 0, 0, 1, 1,
0.2043829, 0.07689308, 2.362531, 1, 0, 0, 1, 1,
0.2073257, -0.1660887, 1.987308, 0, 0, 0, 1, 1,
0.2082503, -0.642608, 1.72633, 0, 0, 0, 1, 1,
0.2123598, 0.4278334, -0.8922052, 0, 0, 0, 1, 1,
0.2131331, 1.280865, 0.1714931, 0, 0, 0, 1, 1,
0.2134934, -0.09888692, 0.2834102, 0, 0, 0, 1, 1,
0.2144521, 0.2171187, 1.920646, 0, 0, 0, 1, 1,
0.2177379, -2.088956, 2.571498, 0, 0, 0, 1, 1,
0.2195947, 0.3732817, 0.2245615, 1, 1, 1, 1, 1,
0.2221402, 1.782869, -0.8831847, 1, 1, 1, 1, 1,
0.2234742, -0.1361891, -0.3903226, 1, 1, 1, 1, 1,
0.2235407, -1.676299, 4.20004, 1, 1, 1, 1, 1,
0.2238848, 2.442519, -0.580588, 1, 1, 1, 1, 1,
0.2381564, -0.5791979, 3.791868, 1, 1, 1, 1, 1,
0.2381734, -0.1567638, 1.885408, 1, 1, 1, 1, 1,
0.2395918, -0.7065991, 3.366982, 1, 1, 1, 1, 1,
0.2419984, 0.7541423, 0.6235159, 1, 1, 1, 1, 1,
0.2437132, 0.6156311, 2.051862, 1, 1, 1, 1, 1,
0.2548265, 0.4281697, 0.05862885, 1, 1, 1, 1, 1,
0.2572485, -0.232787, 1.45873, 1, 1, 1, 1, 1,
0.2590513, 1.103493, 0.7434925, 1, 1, 1, 1, 1,
0.2600284, 2.608054, 0.0279119, 1, 1, 1, 1, 1,
0.2619092, 3.005764, 0.103611, 1, 1, 1, 1, 1,
0.2638094, 0.6711966, 0.3510734, 0, 0, 1, 1, 1,
0.2681752, -0.1199407, 2.454509, 1, 0, 0, 1, 1,
0.2689481, 1.610863, 0.3256075, 1, 0, 0, 1, 1,
0.2727353, -2.099479, 3.791069, 1, 0, 0, 1, 1,
0.2736382, 1.003482, 1.021707, 1, 0, 0, 1, 1,
0.2775438, -1.030114, 2.896839, 1, 0, 0, 1, 1,
0.2776442, -0.9129862, 3.456703, 0, 0, 0, 1, 1,
0.2824627, 0.09912185, 0.1986592, 0, 0, 0, 1, 1,
0.2869794, 0.1974603, 0.7706599, 0, 0, 0, 1, 1,
0.2898662, 0.5848923, 0.5386353, 0, 0, 0, 1, 1,
0.297754, 1.176933, 0.1941576, 0, 0, 0, 1, 1,
0.2998853, 0.275052, -1.294177, 0, 0, 0, 1, 1,
0.3010369, 0.2822131, 2.673193, 0, 0, 0, 1, 1,
0.3034096, 1.427223, 1.605883, 1, 1, 1, 1, 1,
0.3035168, -0.2059904, 1.866365, 1, 1, 1, 1, 1,
0.3073092, 1.80438, -0.8612354, 1, 1, 1, 1, 1,
0.3091787, 0.6398011, 1.103048, 1, 1, 1, 1, 1,
0.3126501, 0.4507777, 0.1800144, 1, 1, 1, 1, 1,
0.3135017, -1.236772, 2.521215, 1, 1, 1, 1, 1,
0.3136687, -0.4330361, 1.136756, 1, 1, 1, 1, 1,
0.3140875, 0.5089148, -0.7513114, 1, 1, 1, 1, 1,
0.3146849, -1.094096, 1.501187, 1, 1, 1, 1, 1,
0.314899, -0.2052419, 2.658321, 1, 1, 1, 1, 1,
0.3184516, -0.3676838, 3.516409, 1, 1, 1, 1, 1,
0.3261332, -0.3435817, 1.992585, 1, 1, 1, 1, 1,
0.3303924, 0.4950129, 2.230328, 1, 1, 1, 1, 1,
0.3327025, -1.791974, 2.495126, 1, 1, 1, 1, 1,
0.332856, -0.05937908, 1.184712, 1, 1, 1, 1, 1,
0.3346564, -0.3461059, 3.396211, 0, 0, 1, 1, 1,
0.3366817, 0.9720382, 0.898379, 1, 0, 0, 1, 1,
0.3369507, -0.3992255, 2.096174, 1, 0, 0, 1, 1,
0.3391791, 0.1141369, 1.46639, 1, 0, 0, 1, 1,
0.3502989, -0.2119708, 2.126808, 1, 0, 0, 1, 1,
0.3506604, -0.8079247, 4.305377, 1, 0, 0, 1, 1,
0.3512654, -0.6827888, 4.056014, 0, 0, 0, 1, 1,
0.3515348, -0.4045531, 3.057715, 0, 0, 0, 1, 1,
0.3528193, 1.543489, 0.7306986, 0, 0, 0, 1, 1,
0.3600528, -0.6346294, 3.715265, 0, 0, 0, 1, 1,
0.3632511, 2.095965, 0.7480902, 0, 0, 0, 1, 1,
0.3660594, -1.10145, 3.580097, 0, 0, 0, 1, 1,
0.3684007, -0.7678974, 3.409885, 0, 0, 0, 1, 1,
0.3691348, -0.2302973, 1.268218, 1, 1, 1, 1, 1,
0.3722962, 0.1295322, 0.9673656, 1, 1, 1, 1, 1,
0.3723076, 0.8153062, 0.8807873, 1, 1, 1, 1, 1,
0.3727574, 2.201427, 0.2920847, 1, 1, 1, 1, 1,
0.3747225, 0.591232, 0.5354306, 1, 1, 1, 1, 1,
0.3761609, -0.8934569, 1.348061, 1, 1, 1, 1, 1,
0.3775474, 0.6673681, -0.1318852, 1, 1, 1, 1, 1,
0.3776125, 0.2698953, 1.345069, 1, 1, 1, 1, 1,
0.379388, -0.9853727, 4.519288, 1, 1, 1, 1, 1,
0.3798595, 0.2587469, -1.18231, 1, 1, 1, 1, 1,
0.3890255, 1.926698, -0.5368524, 1, 1, 1, 1, 1,
0.3998328, -0.4102235, 2.687105, 1, 1, 1, 1, 1,
0.4005204, 0.5127816, -0.4378304, 1, 1, 1, 1, 1,
0.4009296, -0.9585106, 1.645706, 1, 1, 1, 1, 1,
0.4070537, 0.6280382, 0.4274129, 1, 1, 1, 1, 1,
0.4131774, 1.239, -2.661263, 0, 0, 1, 1, 1,
0.4155555, 1.373505, -0.08549816, 1, 0, 0, 1, 1,
0.4204675, -0.1185991, 1.256552, 1, 0, 0, 1, 1,
0.4208045, 2.344157, 1.552569, 1, 0, 0, 1, 1,
0.4246907, -0.1952208, 2.522549, 1, 0, 0, 1, 1,
0.4310112, 0.360164, 1.479775, 1, 0, 0, 1, 1,
0.4344755, -0.6051499, 1.606645, 0, 0, 0, 1, 1,
0.4344795, -0.4827518, 2.276541, 0, 0, 0, 1, 1,
0.4371122, -0.02203908, 0.3695378, 0, 0, 0, 1, 1,
0.4403377, 0.3659203, 2.158984, 0, 0, 0, 1, 1,
0.4445833, 0.04787561, 0.4984905, 0, 0, 0, 1, 1,
0.4472409, -0.6028303, 2.616754, 0, 0, 0, 1, 1,
0.4492297, 1.156767, -0.8050157, 0, 0, 0, 1, 1,
0.4511874, 0.3803395, 1.476502, 1, 1, 1, 1, 1,
0.4552614, 0.806751, 0.4665841, 1, 1, 1, 1, 1,
0.4563132, -0.4361512, 1.628136, 1, 1, 1, 1, 1,
0.4588353, 0.03662136, 2.408259, 1, 1, 1, 1, 1,
0.4590288, 1.126936, 0.791087, 1, 1, 1, 1, 1,
0.4616166, -1.050249, 1.918719, 1, 1, 1, 1, 1,
0.4624338, 0.8264824, 2.21698, 1, 1, 1, 1, 1,
0.4635241, -1.786318, 1.654281, 1, 1, 1, 1, 1,
0.4639358, -0.65118, 2.932728, 1, 1, 1, 1, 1,
0.4671246, -0.6832059, 3.67054, 1, 1, 1, 1, 1,
0.4678648, 1.011876, 1.038526, 1, 1, 1, 1, 1,
0.4712306, -0.07706045, 2.197827, 1, 1, 1, 1, 1,
0.471669, 0.01410087, -0.9100125, 1, 1, 1, 1, 1,
0.4729114, -1.717849, 4.203719, 1, 1, 1, 1, 1,
0.4751094, 1.161474, 1.831786, 1, 1, 1, 1, 1,
0.4829716, 0.379252, 0.620514, 0, 0, 1, 1, 1,
0.4845406, 1.323318, -1.090928, 1, 0, 0, 1, 1,
0.4866516, -0.4061178, 4.010342, 1, 0, 0, 1, 1,
0.490469, 0.4553585, -0.05918467, 1, 0, 0, 1, 1,
0.4916474, 1.548124, -2.068964, 1, 0, 0, 1, 1,
0.49775, 0.735662, -0.5795789, 1, 0, 0, 1, 1,
0.5005317, 0.3921703, 1.546766, 0, 0, 0, 1, 1,
0.5098272, 0.09384812, 0.3524307, 0, 0, 0, 1, 1,
0.5115303, 0.2635385, 0.3367878, 0, 0, 0, 1, 1,
0.512548, -0.0429806, 0.9996015, 0, 0, 0, 1, 1,
0.5164186, -0.07483865, 1.557622, 0, 0, 0, 1, 1,
0.5169061, 1.361081, 1.604907, 0, 0, 0, 1, 1,
0.5196723, 1.558403, -1.247558, 0, 0, 0, 1, 1,
0.5199097, 0.02834374, 1.160199, 1, 1, 1, 1, 1,
0.528133, 0.1900332, 0.2392644, 1, 1, 1, 1, 1,
0.5324182, -1.653569, 3.182574, 1, 1, 1, 1, 1,
0.5333334, 0.2444785, -0.2033644, 1, 1, 1, 1, 1,
0.5339082, 1.74622, -0.8611796, 1, 1, 1, 1, 1,
0.5341753, -0.5198804, 2.236936, 1, 1, 1, 1, 1,
0.5395001, 1.951451, -0.4161772, 1, 1, 1, 1, 1,
0.5398039, 0.7826649, -0.1742339, 1, 1, 1, 1, 1,
0.5451343, -0.7943489, 1.991309, 1, 1, 1, 1, 1,
0.5458259, -1.468609, 0.7772079, 1, 1, 1, 1, 1,
0.5508196, -0.5811203, 3.179779, 1, 1, 1, 1, 1,
0.5573339, 0.8837474, 1.077531, 1, 1, 1, 1, 1,
0.5603246, 0.3382822, 0.3722702, 1, 1, 1, 1, 1,
0.5626668, -0.5291814, 4.104844, 1, 1, 1, 1, 1,
0.5641258, 0.7718925, -0.6812484, 1, 1, 1, 1, 1,
0.5644906, -0.3562032, 2.195362, 0, 0, 1, 1, 1,
0.5645738, -1.341351, 1.540742, 1, 0, 0, 1, 1,
0.5648829, 0.3844019, 1.19622, 1, 0, 0, 1, 1,
0.5711538, 0.8878202, 1.746764, 1, 0, 0, 1, 1,
0.5724118, -0.1939013, 1.1809, 1, 0, 0, 1, 1,
0.5734596, -0.9309464, 3.263655, 1, 0, 0, 1, 1,
0.575617, -0.282818, 2.425781, 0, 0, 0, 1, 1,
0.5874078, 0.5149511, 0.4929321, 0, 0, 0, 1, 1,
0.5887873, 0.8262347, 0.9638554, 0, 0, 0, 1, 1,
0.5918286, 0.8345684, 0.651687, 0, 0, 0, 1, 1,
0.5919582, -0.8349685, 1.766223, 0, 0, 0, 1, 1,
0.5934284, -0.03268097, 0.9528678, 0, 0, 0, 1, 1,
0.5935888, 0.5123063, 0.135689, 0, 0, 0, 1, 1,
0.5969445, 1.079827, -0.5764173, 1, 1, 1, 1, 1,
0.5981621, 0.02261081, 2.000822, 1, 1, 1, 1, 1,
0.6001047, -0.8514274, 2.793716, 1, 1, 1, 1, 1,
0.6101121, -0.9480469, 3.834636, 1, 1, 1, 1, 1,
0.6144012, 1.011351, -0.4425303, 1, 1, 1, 1, 1,
0.6169563, -0.2741407, 1.959357, 1, 1, 1, 1, 1,
0.6326447, -0.7996885, 0.4585267, 1, 1, 1, 1, 1,
0.6335474, 0.4733235, 1.664694, 1, 1, 1, 1, 1,
0.6354804, 0.455691, 1.627442, 1, 1, 1, 1, 1,
0.6389386, -0.9056708, 3.32276, 1, 1, 1, 1, 1,
0.640619, 0.7549654, 1.848366, 1, 1, 1, 1, 1,
0.6422411, 0.4431703, -0.7012231, 1, 1, 1, 1, 1,
0.6433938, -0.07201317, 2.089873, 1, 1, 1, 1, 1,
0.6461474, 0.06200757, 1.368071, 1, 1, 1, 1, 1,
0.6465177, 0.5692748, 0.6618446, 1, 1, 1, 1, 1,
0.6537104, 0.4727261, 0.3464167, 0, 0, 1, 1, 1,
0.6578691, -1.146962, 2.600586, 1, 0, 0, 1, 1,
0.6603923, 0.8663269, 0.09940708, 1, 0, 0, 1, 1,
0.6640219, 0.4101069, 2.619295, 1, 0, 0, 1, 1,
0.6687686, -1.138856, 1.155518, 1, 0, 0, 1, 1,
0.6774395, -0.258531, 2.854691, 1, 0, 0, 1, 1,
0.6774654, 0.4619997, -0.6087946, 0, 0, 0, 1, 1,
0.6775099, 1.87873, -0.580081, 0, 0, 0, 1, 1,
0.6811222, 1.933476, 0.4412794, 0, 0, 0, 1, 1,
0.684568, 0.3964449, 0.4991352, 0, 0, 0, 1, 1,
0.6939337, -0.8298807, 2.70622, 0, 0, 0, 1, 1,
0.6978533, -1.013694, 2.26654, 0, 0, 0, 1, 1,
0.7042028, -1.914945, 3.259021, 0, 0, 0, 1, 1,
0.7047168, -0.7351713, 2.205742, 1, 1, 1, 1, 1,
0.707782, -0.4581327, 2.145324, 1, 1, 1, 1, 1,
0.7099053, 0.5752444, 0.1508617, 1, 1, 1, 1, 1,
0.7138641, 0.6991471, 0.4613042, 1, 1, 1, 1, 1,
0.7189316, -1.088435, 2.207704, 1, 1, 1, 1, 1,
0.7209207, 0.7723722, 0.6116052, 1, 1, 1, 1, 1,
0.7320679, 1.183891, 0.7870506, 1, 1, 1, 1, 1,
0.7351156, 0.4621278, 1.610719, 1, 1, 1, 1, 1,
0.7358387, 0.1878071, 0.8291852, 1, 1, 1, 1, 1,
0.7411658, -1.091549, 1.177348, 1, 1, 1, 1, 1,
0.7419433, -1.176319, 1.098414, 1, 1, 1, 1, 1,
0.7482729, -1.698335, 2.975635, 1, 1, 1, 1, 1,
0.7509118, -2.912356, 2.898294, 1, 1, 1, 1, 1,
0.7519412, 0.3559206, 0.04161631, 1, 1, 1, 1, 1,
0.7571602, -0.2545648, 3.688207, 1, 1, 1, 1, 1,
0.7583526, 0.9122518, -0.8877845, 0, 0, 1, 1, 1,
0.7642649, -0.7055931, 3.71484, 1, 0, 0, 1, 1,
0.7728989, -0.7665903, 4.145176, 1, 0, 0, 1, 1,
0.7779006, -1.698535, 2.616304, 1, 0, 0, 1, 1,
0.7807221, -2.585693, 3.063544, 1, 0, 0, 1, 1,
0.7815036, 0.3449597, 0.6790019, 1, 0, 0, 1, 1,
0.7855602, 0.7804954, 0.0009975343, 0, 0, 0, 1, 1,
0.794173, -0.338837, 1.494811, 0, 0, 0, 1, 1,
0.8005196, -0.2198865, 1.977304, 0, 0, 0, 1, 1,
0.8061556, -1.247411, 1.518603, 0, 0, 0, 1, 1,
0.8076072, -0.06764024, 0.4927154, 0, 0, 0, 1, 1,
0.8081889, -0.1782983, 1.038693, 0, 0, 0, 1, 1,
0.8140333, -0.610765, 2.342675, 0, 0, 0, 1, 1,
0.8176426, -0.0003295968, 3.197801, 1, 1, 1, 1, 1,
0.8181207, 1.731565, 0.8859088, 1, 1, 1, 1, 1,
0.82918, -0.07005563, -0.3308317, 1, 1, 1, 1, 1,
0.8315623, -0.003639368, 1.089946, 1, 1, 1, 1, 1,
0.8331149, 1.109283, -1.496087, 1, 1, 1, 1, 1,
0.8423725, 0.6889642, 1.066075, 1, 1, 1, 1, 1,
0.8454965, -2.690201, 3.506992, 1, 1, 1, 1, 1,
0.8570004, -2.678724, 2.373562, 1, 1, 1, 1, 1,
0.8608841, -1.627642, 4.171278, 1, 1, 1, 1, 1,
0.8611068, -1.478026, 1.891084, 1, 1, 1, 1, 1,
0.861417, -0.9088492, 1.861412, 1, 1, 1, 1, 1,
0.8719319, -1.088971, 0.7248891, 1, 1, 1, 1, 1,
0.875026, 1.212771, -1.565516, 1, 1, 1, 1, 1,
0.8821725, -1.027093, 2.027004, 1, 1, 1, 1, 1,
0.882988, -0.8830044, 1.431644, 1, 1, 1, 1, 1,
0.8852246, 2.236904, 0.3313127, 0, 0, 1, 1, 1,
0.8878453, 1.056835, 1.169595, 1, 0, 0, 1, 1,
0.8949357, -0.9670922, 1.288259, 1, 0, 0, 1, 1,
0.8979092, 0.7525892, 1.086538, 1, 0, 0, 1, 1,
0.8982208, -1.297173, 2.092333, 1, 0, 0, 1, 1,
0.9002436, -0.2423694, 2.045805, 1, 0, 0, 1, 1,
0.9030778, 1.140233, 0.3168504, 0, 0, 0, 1, 1,
0.9035677, -0.8797949, 1.966354, 0, 0, 0, 1, 1,
0.9052547, 0.8402742, -0.03288581, 0, 0, 0, 1, 1,
0.9081853, -0.6505854, 2.746081, 0, 0, 0, 1, 1,
0.9095626, 1.063265, 0.030031, 0, 0, 0, 1, 1,
0.9177533, -1.075776, 2.962286, 0, 0, 0, 1, 1,
0.9182227, 2.321233, 2.380923, 0, 0, 0, 1, 1,
0.9191603, -0.3720488, 1.875527, 1, 1, 1, 1, 1,
0.9230937, -0.2230976, 1.375452, 1, 1, 1, 1, 1,
0.9243625, 0.05727157, 0.6210666, 1, 1, 1, 1, 1,
0.9262942, 0.07845462, 1.661095, 1, 1, 1, 1, 1,
0.9266319, 0.7686443, 0.3012567, 1, 1, 1, 1, 1,
0.9325581, -0.2749704, 0.9690911, 1, 1, 1, 1, 1,
0.9375426, -1.129456, 1.569694, 1, 1, 1, 1, 1,
0.9535076, -0.3020664, 1.541706, 1, 1, 1, 1, 1,
0.9562997, 0.4776765, 0.2987528, 1, 1, 1, 1, 1,
0.9742951, 0.1574548, 0.1234338, 1, 1, 1, 1, 1,
0.9814889, 0.4171634, 1.725671, 1, 1, 1, 1, 1,
0.9826828, -0.4003914, 2.920671, 1, 1, 1, 1, 1,
0.9832238, 0.8700168, -0.08218589, 1, 1, 1, 1, 1,
0.9849755, -1.823575, 2.122763, 1, 1, 1, 1, 1,
0.9886498, 0.6019361, 0.3359683, 1, 1, 1, 1, 1,
0.9891654, 0.01259582, 1.959041, 0, 0, 1, 1, 1,
0.99296, -1.28379, 3.622403, 1, 0, 0, 1, 1,
0.9931265, 1.849409, 0.6834033, 1, 0, 0, 1, 1,
0.9970115, 0.5932295, 2.801536, 1, 0, 0, 1, 1,
1.009215, 0.1299865, 1.746999, 1, 0, 0, 1, 1,
1.020133, 1.367079, 1.332236, 1, 0, 0, 1, 1,
1.023054, -0.1421458, 1.025152, 0, 0, 0, 1, 1,
1.025902, -0.5847465, 3.029305, 0, 0, 0, 1, 1,
1.026019, 0.5229056, 2.400249, 0, 0, 0, 1, 1,
1.029989, 1.144004, -0.2545089, 0, 0, 0, 1, 1,
1.03129, 0.6146647, 1.841126, 0, 0, 0, 1, 1,
1.031913, -0.07126275, 1.832356, 0, 0, 0, 1, 1,
1.034589, -1.291157, 1.718663, 0, 0, 0, 1, 1,
1.034665, -1.345201, 2.144329, 1, 1, 1, 1, 1,
1.03502, -1.14269, 2.286852, 1, 1, 1, 1, 1,
1.038737, 0.5892267, 1.415826, 1, 1, 1, 1, 1,
1.05111, -0.6131178, 1.914395, 1, 1, 1, 1, 1,
1.053666, -0.3841544, 2.39965, 1, 1, 1, 1, 1,
1.056957, 1.282799, 0.1986043, 1, 1, 1, 1, 1,
1.059983, -0.1852327, 1.884883, 1, 1, 1, 1, 1,
1.062975, -1.120242, 3.820606, 1, 1, 1, 1, 1,
1.069006, -0.7792245, 3.095638, 1, 1, 1, 1, 1,
1.070529, 1.341572, 0.3649259, 1, 1, 1, 1, 1,
1.072108, 0.8405201, 1.081935, 1, 1, 1, 1, 1,
1.073927, -0.8277094, 2.86264, 1, 1, 1, 1, 1,
1.080805, -0.3555026, 1.638694, 1, 1, 1, 1, 1,
1.085339, -0.6510274, 2.90429, 1, 1, 1, 1, 1,
1.085681, -1.119053, 1.029255, 1, 1, 1, 1, 1,
1.087651, 1.087762, 0.8295561, 0, 0, 1, 1, 1,
1.089685, -1.210937, 3.185731, 1, 0, 0, 1, 1,
1.09181, 1.42222, -0.8643759, 1, 0, 0, 1, 1,
1.103854, 1.405646, 2.401774, 1, 0, 0, 1, 1,
1.107842, 0.3767269, 1.43658, 1, 0, 0, 1, 1,
1.110592, -0.8677066, 3.492395, 1, 0, 0, 1, 1,
1.116334, 1.590447, -0.557976, 0, 0, 0, 1, 1,
1.118551, -0.01424989, 1.207429, 0, 0, 0, 1, 1,
1.122132, 1.135186, 0.9728626, 0, 0, 0, 1, 1,
1.125041, -0.4890771, 2.089963, 0, 0, 0, 1, 1,
1.128553, 0.4827504, 1.138342, 0, 0, 0, 1, 1,
1.130676, 1.499108, 1.477979, 0, 0, 0, 1, 1,
1.13871, -0.5218413, 2.733034, 0, 0, 0, 1, 1,
1.150525, 1.129319, 1.814239, 1, 1, 1, 1, 1,
1.151896, 0.5817153, 0.6415853, 1, 1, 1, 1, 1,
1.155149, 0.1650536, 0.7336842, 1, 1, 1, 1, 1,
1.157842, -1.058175, 3.776064, 1, 1, 1, 1, 1,
1.158946, -1.263607, 2.945543, 1, 1, 1, 1, 1,
1.159596, -0.3194056, 1.355557, 1, 1, 1, 1, 1,
1.16186, -0.7550005, 2.860423, 1, 1, 1, 1, 1,
1.173523, -1.778445, 3.372564, 1, 1, 1, 1, 1,
1.179133, 0.06246199, 0.9190065, 1, 1, 1, 1, 1,
1.181271, 0.8887411, 0.5425754, 1, 1, 1, 1, 1,
1.187082, 0.4335514, -1.527473, 1, 1, 1, 1, 1,
1.189131, 0.01036627, 1.979326, 1, 1, 1, 1, 1,
1.191483, -0.7862686, 1.488907, 1, 1, 1, 1, 1,
1.204502, 0.1526952, 1.848058, 1, 1, 1, 1, 1,
1.20514, -0.9373881, 2.867219, 1, 1, 1, 1, 1,
1.205764, -1.127181, 1.486699, 0, 0, 1, 1, 1,
1.209341, 0.8246872, 0.2520951, 1, 0, 0, 1, 1,
1.2115, -0.5708815, 2.018915, 1, 0, 0, 1, 1,
1.214315, 0.21477, 0.4939781, 1, 0, 0, 1, 1,
1.216062, 0.5466978, 1.467429, 1, 0, 0, 1, 1,
1.217736, 0.7498901, 2.078069, 1, 0, 0, 1, 1,
1.217944, 1.758044, 0.385233, 0, 0, 0, 1, 1,
1.221118, 0.3933721, 2.167387, 0, 0, 0, 1, 1,
1.221577, 1.060686, 1.466142, 0, 0, 0, 1, 1,
1.224174, -0.8676565, 3.004019, 0, 0, 0, 1, 1,
1.226028, -0.9556276, 2.839484, 0, 0, 0, 1, 1,
1.22704, -0.4381136, 1.816765, 0, 0, 0, 1, 1,
1.24083, -0.9326595, 0.8907007, 0, 0, 0, 1, 1,
1.244235, 2.430999, 1.32937, 1, 1, 1, 1, 1,
1.248332, 0.5965303, 0.5473745, 1, 1, 1, 1, 1,
1.263568, -0.5439019, 1.2918, 1, 1, 1, 1, 1,
1.26802, -0.2452948, 0.9687239, 1, 1, 1, 1, 1,
1.274507, 0.03378383, 2.077071, 1, 1, 1, 1, 1,
1.292235, 0.1101356, 2.492363, 1, 1, 1, 1, 1,
1.2923, 1.545219, -0.5938766, 1, 1, 1, 1, 1,
1.293614, -0.614729, 1.46209, 1, 1, 1, 1, 1,
1.294342, 1.349807, 1.009849, 1, 1, 1, 1, 1,
1.297469, 0.3602505, 0.5852515, 1, 1, 1, 1, 1,
1.298728, -0.6640379, 1.678797, 1, 1, 1, 1, 1,
1.300496, 0.5715572, 2.502916, 1, 1, 1, 1, 1,
1.305962, 0.2655224, 1.009514, 1, 1, 1, 1, 1,
1.317831, -0.808427, 1.324056, 1, 1, 1, 1, 1,
1.3199, -0.9343636, 3.398135, 1, 1, 1, 1, 1,
1.322875, -1.181195, 1.056848, 0, 0, 1, 1, 1,
1.335799, -0.2372656, 2.393492, 1, 0, 0, 1, 1,
1.339604, 0.8439642, 1.057299, 1, 0, 0, 1, 1,
1.340234, 0.3007181, 0.9059854, 1, 0, 0, 1, 1,
1.353134, 1.320349, 0.6168468, 1, 0, 0, 1, 1,
1.361472, 1.386778, 0.9343382, 1, 0, 0, 1, 1,
1.368581, 0.0708461, 2.479128, 0, 0, 0, 1, 1,
1.369006, 0.3023762, 1.413226, 0, 0, 0, 1, 1,
1.370573, -1.891211, 2.73631, 0, 0, 0, 1, 1,
1.402596, 1.079288, 0.5801799, 0, 0, 0, 1, 1,
1.40896, -0.8347163, 0.9073741, 0, 0, 0, 1, 1,
1.415352, -0.05869802, -0.2010357, 0, 0, 0, 1, 1,
1.417254, -2.982585, 2.631135, 0, 0, 0, 1, 1,
1.423494, -0.3484408, 1.49097, 1, 1, 1, 1, 1,
1.436571, -0.2085854, 0.6764658, 1, 1, 1, 1, 1,
1.443347, 0.354524, 1.025158, 1, 1, 1, 1, 1,
1.450538, -0.6811253, 3.779925, 1, 1, 1, 1, 1,
1.452521, 0.335607, 3.101381, 1, 1, 1, 1, 1,
1.461126, -0.4735167, 2.742005, 1, 1, 1, 1, 1,
1.463015, 0.0276894, 0.9406047, 1, 1, 1, 1, 1,
1.466049, 1.928199, 1.357522, 1, 1, 1, 1, 1,
1.466312, 0.585252, 0.3523385, 1, 1, 1, 1, 1,
1.472757, -0.1582415, 2.371593, 1, 1, 1, 1, 1,
1.473473, -0.02547129, 0.1665022, 1, 1, 1, 1, 1,
1.478926, -1.227643, 2.545146, 1, 1, 1, 1, 1,
1.500145, 0.1110531, 1.30845, 1, 1, 1, 1, 1,
1.518686, 0.5975379, 1.073488, 1, 1, 1, 1, 1,
1.549418, -1.989278, 2.125165, 1, 1, 1, 1, 1,
1.564212, 0.4501883, 2.102763, 0, 0, 1, 1, 1,
1.609337, -0.5943943, 1.730626, 1, 0, 0, 1, 1,
1.616451, 0.2344212, 1.600476, 1, 0, 0, 1, 1,
1.628255, -0.06556943, 2.653573, 1, 0, 0, 1, 1,
1.628781, 0.616927, -0.7622029, 1, 0, 0, 1, 1,
1.641868, -1.56961, 4.609388, 1, 0, 0, 1, 1,
1.644292, -1.066296, 2.123748, 0, 0, 0, 1, 1,
1.646657, 1.645373, 1.601212, 0, 0, 0, 1, 1,
1.676913, 0.229049, 1.710608, 0, 0, 0, 1, 1,
1.683735, -0.987941, 0.8588896, 0, 0, 0, 1, 1,
1.691261, -0.4344301, 2.194781, 0, 0, 0, 1, 1,
1.713482, 0.439122, 0.5029084, 0, 0, 0, 1, 1,
1.717091, 0.1476011, 2.135468, 0, 0, 0, 1, 1,
1.738794, 0.8967176, 0.7082103, 1, 1, 1, 1, 1,
1.757232, -1.920744, 2.855084, 1, 1, 1, 1, 1,
1.779254, -2.250071, 2.293, 1, 1, 1, 1, 1,
1.779698, -0.3189171, 1.811952, 1, 1, 1, 1, 1,
1.78747, 1.81676, 1.135546, 1, 1, 1, 1, 1,
1.792004, 1.667919, -0.2997048, 1, 1, 1, 1, 1,
1.793628, 0.9705779, 0.7152268, 1, 1, 1, 1, 1,
1.806345, -0.2299341, 1.541845, 1, 1, 1, 1, 1,
1.840884, 0.7376884, 1.130741, 1, 1, 1, 1, 1,
1.882913, -0.1953508, 0.1749838, 1, 1, 1, 1, 1,
1.90676, -0.6787015, 3.060064, 1, 1, 1, 1, 1,
1.909897, -0.8576465, 1.403473, 1, 1, 1, 1, 1,
1.950673, -0.6084604, 1.485922, 1, 1, 1, 1, 1,
1.96938, 2.3823, 2.518053, 1, 1, 1, 1, 1,
1.980884, -0.68179, 1.907028, 1, 1, 1, 1, 1,
2.001707, -1.275866, 4.158934, 0, 0, 1, 1, 1,
2.010503, -0.7801241, 0.8612719, 1, 0, 0, 1, 1,
2.039657, 2.115618, 0.9585994, 1, 0, 0, 1, 1,
2.049337, -0.6951107, 1.172451, 1, 0, 0, 1, 1,
2.061733, -0.4689783, 2.312713, 1, 0, 0, 1, 1,
2.067739, -0.390121, 1.802804, 1, 0, 0, 1, 1,
2.07995, -0.3033718, 2.310588, 0, 0, 0, 1, 1,
2.11779, 0.2451096, 0.7608135, 0, 0, 0, 1, 1,
2.132131, 0.8594999, 0.5945306, 0, 0, 0, 1, 1,
2.267744, 0.4464379, 0.2062457, 0, 0, 0, 1, 1,
2.273704, -0.3184333, -0.4571769, 0, 0, 0, 1, 1,
2.286182, -1.92109, 1.669805, 0, 0, 0, 1, 1,
2.325512, 1.129804, 0.7275577, 0, 0, 0, 1, 1,
2.327525, 1.372131, 0.7772657, 1, 1, 1, 1, 1,
2.423762, 0.3637758, 2.18217, 1, 1, 1, 1, 1,
2.504118, -0.1945138, 2.962532, 1, 1, 1, 1, 1,
2.55471, 0.2297762, 1.352613, 1, 1, 1, 1, 1,
2.660465, 0.6867119, 3.199467, 1, 1, 1, 1, 1,
2.688211, 0.3340366, 2.567063, 1, 1, 1, 1, 1,
3.392843, -0.3901437, 2.677604, 1, 1, 1, 1, 1
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
var radius = 9.651787;
var distance = 33.90149;
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
mvMatrix.translate( -0.169894, 0.3498135, 0.446806 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.90149);
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
