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
-3.490297, -0.4997711, -1.526248, 1, 0, 0, 1,
-3.137551, 0.4708931, -1.136227, 1, 0.007843138, 0, 1,
-3.080519, 0.2586037, -2.018423, 1, 0.01176471, 0, 1,
-3.006167, 1.222435, -1.136276, 1, 0.01960784, 0, 1,
-2.865095, 0.03672058, -0.5633752, 1, 0.02352941, 0, 1,
-2.812957, -1.37057, -1.01039, 1, 0.03137255, 0, 1,
-2.785238, -2.035116, -3.534063, 1, 0.03529412, 0, 1,
-2.680719, 2.17206, -0.285177, 1, 0.04313726, 0, 1,
-2.650028, 0.7056263, -0.08442552, 1, 0.04705882, 0, 1,
-2.514143, 0.04138904, -1.108681, 1, 0.05490196, 0, 1,
-2.512851, -0.7076823, -1.118604, 1, 0.05882353, 0, 1,
-2.490616, -0.4379863, -2.406915, 1, 0.06666667, 0, 1,
-2.444795, 0.6233174, -2.241611, 1, 0.07058824, 0, 1,
-2.362642, 1.010928, -0.8972259, 1, 0.07843138, 0, 1,
-2.355597, -1.334193, -1.183214, 1, 0.08235294, 0, 1,
-2.325277, -0.2131804, -2.578872, 1, 0.09019608, 0, 1,
-2.306907, 0.301716, -0.282197, 1, 0.09411765, 0, 1,
-2.270529, -0.134122, -0.8300533, 1, 0.1019608, 0, 1,
-2.256011, -1.016922, -1.949878, 1, 0.1098039, 0, 1,
-2.232422, 1.149195, -1.614012, 1, 0.1137255, 0, 1,
-2.221331, -0.7277762, -0.7519857, 1, 0.1215686, 0, 1,
-2.198441, 1.845877, 0.1098648, 1, 0.1254902, 0, 1,
-2.158267, 1.486178, -2.345681, 1, 0.1333333, 0, 1,
-2.144012, 1.227778, 0.003976626, 1, 0.1372549, 0, 1,
-2.14019, -0.157437, -3.129625, 1, 0.145098, 0, 1,
-2.113012, -0.213944, -1.648561, 1, 0.1490196, 0, 1,
-2.110945, -0.09221113, 0.3526638, 1, 0.1568628, 0, 1,
-2.110574, 2.156193, -1.914876, 1, 0.1607843, 0, 1,
-2.098429, -0.343343, -0.172823, 1, 0.1686275, 0, 1,
-2.076026, 1.330289, -2.613306, 1, 0.172549, 0, 1,
-2.026088, 0.5700646, -1.603513, 1, 0.1803922, 0, 1,
-1.970642, -0.1749573, -2.352465, 1, 0.1843137, 0, 1,
-1.967592, 0.9721295, 1.270865, 1, 0.1921569, 0, 1,
-1.966566, -0.7953297, -2.64053, 1, 0.1960784, 0, 1,
-1.96325, 0.536056, -1.654914, 1, 0.2039216, 0, 1,
-1.962635, -0.529694, -1.253388, 1, 0.2117647, 0, 1,
-1.956594, 0.008327837, -2.058865, 1, 0.2156863, 0, 1,
-1.900011, 0.109365, -2.060633, 1, 0.2235294, 0, 1,
-1.880246, -2.043271, -2.015687, 1, 0.227451, 0, 1,
-1.870059, -0.318328, -1.290851, 1, 0.2352941, 0, 1,
-1.856465, -1.221903, -3.05264, 1, 0.2392157, 0, 1,
-1.846563, 0.0543548, -1.148643, 1, 0.2470588, 0, 1,
-1.846187, -1.685509, 0.3181741, 1, 0.2509804, 0, 1,
-1.835455, -1.032036, -1.717864, 1, 0.2588235, 0, 1,
-1.831058, -0.4994214, -3.928258, 1, 0.2627451, 0, 1,
-1.820931, 1.507241, -3.016155, 1, 0.2705882, 0, 1,
-1.79478, 1.634501, -1.384181, 1, 0.2745098, 0, 1,
-1.784815, 0.7793162, -2.555112, 1, 0.282353, 0, 1,
-1.783358, -0.3051882, -1.816802, 1, 0.2862745, 0, 1,
-1.768972, -0.8435445, -2.142081, 1, 0.2941177, 0, 1,
-1.762212, -0.7480413, -1.669003, 1, 0.3019608, 0, 1,
-1.714683, 0.7996296, -0.7126627, 1, 0.3058824, 0, 1,
-1.708568, 1.8179, -0.1301319, 1, 0.3137255, 0, 1,
-1.704272, 0.6241233, -1.63074, 1, 0.3176471, 0, 1,
-1.697668, 1.284941, 1.976632, 1, 0.3254902, 0, 1,
-1.694282, 1.665935, -2.899588, 1, 0.3294118, 0, 1,
-1.693706, 0.2535535, -3.004129, 1, 0.3372549, 0, 1,
-1.687259, -0.199116, -2.505958, 1, 0.3411765, 0, 1,
-1.670998, 0.3764901, -1.615229, 1, 0.3490196, 0, 1,
-1.666239, 1.112015, -2.407456, 1, 0.3529412, 0, 1,
-1.648356, -0.3223794, -1.122448, 1, 0.3607843, 0, 1,
-1.636869, -0.1111802, -0.7272338, 1, 0.3647059, 0, 1,
-1.629753, 0.2765167, -1.0686, 1, 0.372549, 0, 1,
-1.628189, -1.436128, -1.961992, 1, 0.3764706, 0, 1,
-1.626305, 0.482679, -1.362857, 1, 0.3843137, 0, 1,
-1.619727, -0.6522476, -3.517076, 1, 0.3882353, 0, 1,
-1.616871, 0.495734, -3.431849, 1, 0.3960784, 0, 1,
-1.615985, 0.3691776, -1.311236, 1, 0.4039216, 0, 1,
-1.61473, -0.02925671, -1.143508, 1, 0.4078431, 0, 1,
-1.610813, -0.7697549, -1.854992, 1, 0.4156863, 0, 1,
-1.601634, -0.123493, -1.014008, 1, 0.4196078, 0, 1,
-1.591321, 0.9714928, -0.8930847, 1, 0.427451, 0, 1,
-1.587468, 0.03237146, -0.8198418, 1, 0.4313726, 0, 1,
-1.58285, 0.4905407, -1.791205, 1, 0.4392157, 0, 1,
-1.575631, 0.1125539, 0.3957002, 1, 0.4431373, 0, 1,
-1.573184, 1.17615, -2.26104, 1, 0.4509804, 0, 1,
-1.558122, 1.146393, 0.1389944, 1, 0.454902, 0, 1,
-1.546978, -0.2515526, -0.800179, 1, 0.4627451, 0, 1,
-1.543031, -1.290639, -1.950234, 1, 0.4666667, 0, 1,
-1.538633, -0.6337441, -3.758783, 1, 0.4745098, 0, 1,
-1.511311, 0.4832992, -1.924881, 1, 0.4784314, 0, 1,
-1.504166, 0.6014469, -0.4947523, 1, 0.4862745, 0, 1,
-1.492034, 0.1709719, -2.589095, 1, 0.4901961, 0, 1,
-1.491671, 0.4887926, -2.299845, 1, 0.4980392, 0, 1,
-1.490282, -0.09025374, -1.50484, 1, 0.5058824, 0, 1,
-1.476121, 0.7538279, 1.497662, 1, 0.509804, 0, 1,
-1.475728, 0.8065884, -1.576487, 1, 0.5176471, 0, 1,
-1.460015, -0.1205405, -3.127248, 1, 0.5215687, 0, 1,
-1.453185, -1.624446, -2.137203, 1, 0.5294118, 0, 1,
-1.447004, 0.5229611, -2.457311, 1, 0.5333334, 0, 1,
-1.443381, 0.5902113, -1.591206, 1, 0.5411765, 0, 1,
-1.43884, -1.397334, -1.20702, 1, 0.5450981, 0, 1,
-1.433541, -0.9324771, -3.199532, 1, 0.5529412, 0, 1,
-1.431026, -2.523235, -2.503429, 1, 0.5568628, 0, 1,
-1.424572, -0.108194, -1.507268, 1, 0.5647059, 0, 1,
-1.411365, 1.325248, -0.8707911, 1, 0.5686275, 0, 1,
-1.408002, 0.620639, -1.213806, 1, 0.5764706, 0, 1,
-1.407905, -0.9335986, -2.297982, 1, 0.5803922, 0, 1,
-1.405545, 0.2662369, -2.098055, 1, 0.5882353, 0, 1,
-1.403711, -1.163127, -2.758358, 1, 0.5921569, 0, 1,
-1.403659, 0.38484, -1.591461, 1, 0.6, 0, 1,
-1.398291, 0.4349626, -2.377557, 1, 0.6078432, 0, 1,
-1.398252, 1.710121, -1.030012, 1, 0.6117647, 0, 1,
-1.397168, -0.9431712, -0.8621302, 1, 0.6196079, 0, 1,
-1.390399, 0.9267334, -1.104637, 1, 0.6235294, 0, 1,
-1.390081, -1.568272, -1.811407, 1, 0.6313726, 0, 1,
-1.382513, -0.6829872, 0.7744098, 1, 0.6352941, 0, 1,
-1.373188, 0.7084516, -0.8129024, 1, 0.6431373, 0, 1,
-1.371079, 0.2168088, -1.39682, 1, 0.6470588, 0, 1,
-1.368832, -1.72178, -2.467494, 1, 0.654902, 0, 1,
-1.364202, 1.083237, 1.008843, 1, 0.6588235, 0, 1,
-1.361536, -0.118944, -2.652805, 1, 0.6666667, 0, 1,
-1.354149, 0.2618903, -0.03508776, 1, 0.6705883, 0, 1,
-1.344841, 1.51696, -0.6419992, 1, 0.6784314, 0, 1,
-1.342705, -0.08948386, 0.91845, 1, 0.682353, 0, 1,
-1.338078, -0.7210308, -1.617307, 1, 0.6901961, 0, 1,
-1.33251, 0.6071149, -1.363646, 1, 0.6941177, 0, 1,
-1.327875, 2.554894, -1.434468, 1, 0.7019608, 0, 1,
-1.315991, -0.1724349, -1.317886, 1, 0.7098039, 0, 1,
-1.309006, -0.5508394, -2.88116, 1, 0.7137255, 0, 1,
-1.297661, 0.5485873, -1.597386, 1, 0.7215686, 0, 1,
-1.294074, -0.3438055, -0.6464172, 1, 0.7254902, 0, 1,
-1.272871, -0.6758447, -2.452665, 1, 0.7333333, 0, 1,
-1.251233, 0.791064, -2.595675, 1, 0.7372549, 0, 1,
-1.246554, 0.09798153, -2.865379, 1, 0.7450981, 0, 1,
-1.240946, -0.3488585, -3.732095, 1, 0.7490196, 0, 1,
-1.238587, 0.2084266, -2.624373, 1, 0.7568628, 0, 1,
-1.230121, 0.250135, -1.25998, 1, 0.7607843, 0, 1,
-1.218877, 0.1472691, -1.390007, 1, 0.7686275, 0, 1,
-1.213294, -1.15943, -3.584096, 1, 0.772549, 0, 1,
-1.209928, -0.08002909, -3.622977, 1, 0.7803922, 0, 1,
-1.206067, 0.1162106, -2.256556, 1, 0.7843137, 0, 1,
-1.205393, -0.5188954, -0.661647, 1, 0.7921569, 0, 1,
-1.202491, -2.236663, -2.482552, 1, 0.7960784, 0, 1,
-1.193895, 2.022741, 2.954799, 1, 0.8039216, 0, 1,
-1.186639, -0.4792125, -2.906039, 1, 0.8117647, 0, 1,
-1.185597, 0.2930773, -2.168237, 1, 0.8156863, 0, 1,
-1.181892, -0.5680709, -2.278947, 1, 0.8235294, 0, 1,
-1.170709, 0.4474235, -1.335716, 1, 0.827451, 0, 1,
-1.169327, 0.5306292, -0.383067, 1, 0.8352941, 0, 1,
-1.168304, 0.4693344, -2.074605, 1, 0.8392157, 0, 1,
-1.161984, 0.660497, 0.302649, 1, 0.8470588, 0, 1,
-1.156237, -0.3778042, -3.189411, 1, 0.8509804, 0, 1,
-1.153596, 1.155184, -0.03461712, 1, 0.8588235, 0, 1,
-1.147373, 0.4855834, -0.7564606, 1, 0.8627451, 0, 1,
-1.144041, -1.250539, -2.130556, 1, 0.8705882, 0, 1,
-1.143305, 0.1444839, -1.171006, 1, 0.8745098, 0, 1,
-1.134895, 1.839726, -0.3723639, 1, 0.8823529, 0, 1,
-1.133983, 0.6682644, -2.271913, 1, 0.8862745, 0, 1,
-1.12792, -0.3054747, -1.652473, 1, 0.8941177, 0, 1,
-1.121676, -0.2466636, -0.4563828, 1, 0.8980392, 0, 1,
-1.121155, -1.178527, -1.049717, 1, 0.9058824, 0, 1,
-1.11639, -1.444931, -0.2459576, 1, 0.9137255, 0, 1,
-1.11627, -0.2607324, -2.186788, 1, 0.9176471, 0, 1,
-1.115709, 0.1875857, -2.573984, 1, 0.9254902, 0, 1,
-1.113426, 0.5093604, -1.060726, 1, 0.9294118, 0, 1,
-1.106911, 1.207542, 0.4928962, 1, 0.9372549, 0, 1,
-1.103298, 0.02331642, -1.379526, 1, 0.9411765, 0, 1,
-1.097606, -0.9415129, -2.19089, 1, 0.9490196, 0, 1,
-1.091955, 0.7801492, -1.759314, 1, 0.9529412, 0, 1,
-1.087871, 0.7511775, -1.413008, 1, 0.9607843, 0, 1,
-1.077922, -0.4768906, -1.240455, 1, 0.9647059, 0, 1,
-1.075756, -0.4891991, -1.658554, 1, 0.972549, 0, 1,
-1.057679, 1.878277, -0.3060192, 1, 0.9764706, 0, 1,
-1.056411, 0.5417292, -1.711939, 1, 0.9843137, 0, 1,
-1.052598, 0.0009654618, -1.774484, 1, 0.9882353, 0, 1,
-1.039884, -0.2441267, 0.2079614, 1, 0.9960784, 0, 1,
-1.032617, -0.9356616, -2.568544, 0.9960784, 1, 0, 1,
-1.029028, -0.07174874, -0.2592287, 0.9921569, 1, 0, 1,
-1.02772, 1.223266, -1.091994, 0.9843137, 1, 0, 1,
-1.019326, 0.5169184, -2.205499, 0.9803922, 1, 0, 1,
-1.015439, -0.910629, -1.470884, 0.972549, 1, 0, 1,
-1.0148, 0.7992618, -2.032648, 0.9686275, 1, 0, 1,
-1.003746, 0.8158872, -3.947041, 0.9607843, 1, 0, 1,
-1.001009, 0.558989, -1.270075, 0.9568627, 1, 0, 1,
-0.9978966, 0.231024, -2.449895, 0.9490196, 1, 0, 1,
-0.9971365, 1.014681, 0.2213349, 0.945098, 1, 0, 1,
-0.9934562, -0.5863751, -1.654316, 0.9372549, 1, 0, 1,
-0.9864573, -1.215123, -2.976364, 0.9333333, 1, 0, 1,
-0.9810716, -0.4234203, -0.9106666, 0.9254902, 1, 0, 1,
-0.9803636, -0.9742164, -3.516193, 0.9215686, 1, 0, 1,
-0.9755574, -1.014141, -1.09737, 0.9137255, 1, 0, 1,
-0.9724854, -0.9730687, -1.497862, 0.9098039, 1, 0, 1,
-0.9705917, 0.04355508, -1.519149, 0.9019608, 1, 0, 1,
-0.9645019, 0.1075246, -2.123315, 0.8941177, 1, 0, 1,
-0.95997, 1.55645, 0.1517333, 0.8901961, 1, 0, 1,
-0.9549158, 0.04496561, -0.507023, 0.8823529, 1, 0, 1,
-0.9475862, -0.6703524, -1.963479, 0.8784314, 1, 0, 1,
-0.9396869, -0.2850918, -0.9795583, 0.8705882, 1, 0, 1,
-0.9361299, 0.5140489, -1.896028, 0.8666667, 1, 0, 1,
-0.9316572, -0.09924834, -1.061299, 0.8588235, 1, 0, 1,
-0.9198915, -0.8964388, -1.427031, 0.854902, 1, 0, 1,
-0.9194677, 0.09837481, -2.945231, 0.8470588, 1, 0, 1,
-0.9180645, 1.084375, 0.2196041, 0.8431373, 1, 0, 1,
-0.9050406, 1.194388, -2.114702, 0.8352941, 1, 0, 1,
-0.9027727, 0.7104204, -1.225801, 0.8313726, 1, 0, 1,
-0.9015752, 0.5314578, -1.863829, 0.8235294, 1, 0, 1,
-0.8988883, -0.5406668, -0.6529546, 0.8196079, 1, 0, 1,
-0.8974807, 2.094465, 0.186617, 0.8117647, 1, 0, 1,
-0.8787951, 0.5457738, -0.8039662, 0.8078431, 1, 0, 1,
-0.8763964, -0.009636222, -0.5680859, 0.8, 1, 0, 1,
-0.8750504, -0.5272675, -2.008705, 0.7921569, 1, 0, 1,
-0.8716173, 1.842885, -0.2023617, 0.7882353, 1, 0, 1,
-0.8533369, 1.142697, -0.7764505, 0.7803922, 1, 0, 1,
-0.8457929, 1.411278, -1.904024, 0.7764706, 1, 0, 1,
-0.8449792, -0.5245164, -1.808134, 0.7686275, 1, 0, 1,
-0.8418291, -0.4488687, 0.959821, 0.7647059, 1, 0, 1,
-0.8414228, -0.0360389, -2.72863, 0.7568628, 1, 0, 1,
-0.8380759, -0.05085796, -1.893988, 0.7529412, 1, 0, 1,
-0.8343996, 1.180472, -1.247831, 0.7450981, 1, 0, 1,
-0.8323701, 1.917707, -0.5708423, 0.7411765, 1, 0, 1,
-0.831733, 0.8785118, -1.129484, 0.7333333, 1, 0, 1,
-0.8277212, 0.9346601, -1.364183, 0.7294118, 1, 0, 1,
-0.8251816, 1.232223, -0.3714336, 0.7215686, 1, 0, 1,
-0.8249073, 1.278181, 0.4065034, 0.7176471, 1, 0, 1,
-0.8199428, -0.5747639, -2.654835, 0.7098039, 1, 0, 1,
-0.8172762, 1.216442, 0.3118657, 0.7058824, 1, 0, 1,
-0.8050088, 0.1777354, -0.5307866, 0.6980392, 1, 0, 1,
-0.8034407, -0.2941684, -1.628468, 0.6901961, 1, 0, 1,
-0.8004412, -0.05447818, -1.957819, 0.6862745, 1, 0, 1,
-0.7990438, -0.8822574, -2.765815, 0.6784314, 1, 0, 1,
-0.7948802, -0.3637605, -2.539177, 0.6745098, 1, 0, 1,
-0.7919294, -0.8407342, -1.86306, 0.6666667, 1, 0, 1,
-0.7901543, -1.634628, -2.230208, 0.6627451, 1, 0, 1,
-0.7838185, -0.288075, -1.786679, 0.654902, 1, 0, 1,
-0.7833233, 0.902081, -1.335125, 0.6509804, 1, 0, 1,
-0.7765655, -0.2640063, -2.052499, 0.6431373, 1, 0, 1,
-0.7761329, -0.9787433, -1.462576, 0.6392157, 1, 0, 1,
-0.7759931, -0.4133419, -0.2304514, 0.6313726, 1, 0, 1,
-0.7708169, 1.161087, -1.319012, 0.627451, 1, 0, 1,
-0.7706212, -0.7010171, -0.9947737, 0.6196079, 1, 0, 1,
-0.767797, 0.8974253, -2.469337, 0.6156863, 1, 0, 1,
-0.7669045, -1.014548, -2.996693, 0.6078432, 1, 0, 1,
-0.7655714, 0.831174, -0.8475264, 0.6039216, 1, 0, 1,
-0.7650171, 0.2396774, -1.756865, 0.5960785, 1, 0, 1,
-0.7646067, -0.1491939, -2.90502, 0.5882353, 1, 0, 1,
-0.763314, 0.05791233, -1.016785, 0.5843138, 1, 0, 1,
-0.7600104, 0.1463604, -1.409589, 0.5764706, 1, 0, 1,
-0.7558032, -0.1270729, -1.522381, 0.572549, 1, 0, 1,
-0.7507109, 1.244857, 0.08635917, 0.5647059, 1, 0, 1,
-0.7416876, 1.54418, -2.607632, 0.5607843, 1, 0, 1,
-0.726994, -0.4704132, -2.804206, 0.5529412, 1, 0, 1,
-0.724777, 0.6180511, -0.1662452, 0.5490196, 1, 0, 1,
-0.7137707, 1.18861, 0.06189536, 0.5411765, 1, 0, 1,
-0.7118081, 1.167294, 0.9124493, 0.5372549, 1, 0, 1,
-0.7065979, 0.1050009, -2.71272, 0.5294118, 1, 0, 1,
-0.7039564, 1.000655, 0.05745852, 0.5254902, 1, 0, 1,
-0.6995108, -1.199156, -2.429744, 0.5176471, 1, 0, 1,
-0.6959327, -0.4358886, -2.826244, 0.5137255, 1, 0, 1,
-0.6916623, 1.168334, -2.258862, 0.5058824, 1, 0, 1,
-0.6882294, 0.1760788, -1.070292, 0.5019608, 1, 0, 1,
-0.682314, -0.5675948, -1.092982, 0.4941176, 1, 0, 1,
-0.6811022, 0.2264723, -1.828785, 0.4862745, 1, 0, 1,
-0.6790989, 2.393257, 0.1445235, 0.4823529, 1, 0, 1,
-0.6755434, -0.8646553, -2.906126, 0.4745098, 1, 0, 1,
-0.675429, 0.3980242, -1.908114, 0.4705882, 1, 0, 1,
-0.6742869, -0.2078663, -1.47551, 0.4627451, 1, 0, 1,
-0.6741078, 0.6873425, -0.2350499, 0.4588235, 1, 0, 1,
-0.663064, -0.2984944, -1.346665, 0.4509804, 1, 0, 1,
-0.6621401, -0.07889231, -1.453942, 0.4470588, 1, 0, 1,
-0.660571, 1.903773, 0.09081133, 0.4392157, 1, 0, 1,
-0.6578733, -0.9128484, -3.333522, 0.4352941, 1, 0, 1,
-0.6567546, -0.007852985, 0.8130992, 0.427451, 1, 0, 1,
-0.6556666, -0.04556454, -1.718714, 0.4235294, 1, 0, 1,
-0.6529629, 0.1663761, -2.25501, 0.4156863, 1, 0, 1,
-0.6469992, -0.803727, -1.660113, 0.4117647, 1, 0, 1,
-0.6402295, 0.8609713, 0.9424883, 0.4039216, 1, 0, 1,
-0.6369497, -1.384797, -3.967495, 0.3960784, 1, 0, 1,
-0.636384, -0.7207461, -2.385042, 0.3921569, 1, 0, 1,
-0.636001, 0.1738583, -0.7014432, 0.3843137, 1, 0, 1,
-0.6348301, 0.8205886, 0.9199489, 0.3803922, 1, 0, 1,
-0.6343746, 0.1802611, 1.041995, 0.372549, 1, 0, 1,
-0.6307215, -0.145028, -2.141133, 0.3686275, 1, 0, 1,
-0.6267601, 0.8558875, -0.1398138, 0.3607843, 1, 0, 1,
-0.6225194, -1.337576, -3.566948, 0.3568628, 1, 0, 1,
-0.6221676, -1.380264, -2.709277, 0.3490196, 1, 0, 1,
-0.6189381, 1.181076, -0.2450203, 0.345098, 1, 0, 1,
-0.6173043, 0.9405675, -0.03229418, 0.3372549, 1, 0, 1,
-0.6089541, 0.05071773, -2.027532, 0.3333333, 1, 0, 1,
-0.6084924, 0.3917505, -0.6852264, 0.3254902, 1, 0, 1,
-0.6070548, 0.0692869, -1.500111, 0.3215686, 1, 0, 1,
-0.6034898, -1.230207, -0.872772, 0.3137255, 1, 0, 1,
-0.6026793, -0.5455962, -2.383324, 0.3098039, 1, 0, 1,
-0.6024649, -0.3386114, -3.104393, 0.3019608, 1, 0, 1,
-0.59694, -0.7718085, -1.818414, 0.2941177, 1, 0, 1,
-0.5946619, -0.2710851, -1.773265, 0.2901961, 1, 0, 1,
-0.5912517, -0.5452383, -0.5358686, 0.282353, 1, 0, 1,
-0.5845287, -1.250503, -2.863633, 0.2784314, 1, 0, 1,
-0.5841227, 0.8702528, -2.064733, 0.2705882, 1, 0, 1,
-0.5807099, -1.318815, -3.180958, 0.2666667, 1, 0, 1,
-0.5800204, -0.7274206, -2.172928, 0.2588235, 1, 0, 1,
-0.5787691, 0.02061593, -2.51018, 0.254902, 1, 0, 1,
-0.5769234, 0.7403317, 1.721992, 0.2470588, 1, 0, 1,
-0.5754314, -1.398888, -0.678057, 0.2431373, 1, 0, 1,
-0.5736696, -3.154255, -4.767177, 0.2352941, 1, 0, 1,
-0.5694251, 1.686406, -0.5021798, 0.2313726, 1, 0, 1,
-0.5683348, 1.897955, -1.071523, 0.2235294, 1, 0, 1,
-0.5668697, -0.3894071, -2.027824, 0.2196078, 1, 0, 1,
-0.56215, -1.605442, -3.290381, 0.2117647, 1, 0, 1,
-0.5595057, -0.8237492, -1.85189, 0.2078431, 1, 0, 1,
-0.5594274, -2.01582, -2.844242, 0.2, 1, 0, 1,
-0.5457165, 0.4486395, 0.06256569, 0.1921569, 1, 0, 1,
-0.5367234, -1.119103, -3.727465, 0.1882353, 1, 0, 1,
-0.5347145, -0.09126584, -3.045968, 0.1803922, 1, 0, 1,
-0.5302944, 2.455425, -1.486507, 0.1764706, 1, 0, 1,
-0.5291848, 0.3876566, -1.136886, 0.1686275, 1, 0, 1,
-0.523845, 0.03994763, 0.796333, 0.1647059, 1, 0, 1,
-0.522876, 0.7898657, -1.936407, 0.1568628, 1, 0, 1,
-0.5188679, 0.923092, -0.5370088, 0.1529412, 1, 0, 1,
-0.5187858, 0.03552296, -0.6606392, 0.145098, 1, 0, 1,
-0.5177784, 0.3152007, -1.196009, 0.1411765, 1, 0, 1,
-0.5171556, 0.9318835, -1.54129, 0.1333333, 1, 0, 1,
-0.5149958, -0.6873152, -1.967032, 0.1294118, 1, 0, 1,
-0.511299, -1.909798, -3.775916, 0.1215686, 1, 0, 1,
-0.5102459, -0.05220921, -1.588912, 0.1176471, 1, 0, 1,
-0.5065586, -1.206581, -3.217979, 0.1098039, 1, 0, 1,
-0.5061531, 0.2447317, -1.826347, 0.1058824, 1, 0, 1,
-0.5052399, 2.790709, 0.2168982, 0.09803922, 1, 0, 1,
-0.5048105, -0.9783818, -3.663542, 0.09019608, 1, 0, 1,
-0.5025939, -0.03061344, -1.421206, 0.08627451, 1, 0, 1,
-0.5003092, 0.3189216, -1.843514, 0.07843138, 1, 0, 1,
-0.4907774, -1.442532, -1.621649, 0.07450981, 1, 0, 1,
-0.4892242, -0.5041487, -3.65424, 0.06666667, 1, 0, 1,
-0.4884496, -1.005412, -4.593419, 0.0627451, 1, 0, 1,
-0.4814817, -1.185006, -2.349489, 0.05490196, 1, 0, 1,
-0.4808787, -0.7171324, -4.420133, 0.05098039, 1, 0, 1,
-0.4745059, -1.466712, -1.914363, 0.04313726, 1, 0, 1,
-0.4740499, -0.1151764, -1.845129, 0.03921569, 1, 0, 1,
-0.4646954, -0.8430894, -2.887696, 0.03137255, 1, 0, 1,
-0.4618661, -0.9235163, -1.386502, 0.02745098, 1, 0, 1,
-0.4613749, 0.5872654, 0.3008978, 0.01960784, 1, 0, 1,
-0.4574879, -0.5298766, -2.019303, 0.01568628, 1, 0, 1,
-0.4566064, -0.4526434, -2.463803, 0.007843138, 1, 0, 1,
-0.4558046, 0.5669928, -0.5257596, 0.003921569, 1, 0, 1,
-0.4526661, 1.316794, 0.05716318, 0, 1, 0.003921569, 1,
-0.4488185, 0.2884754, 0.09621102, 0, 1, 0.01176471, 1,
-0.4400014, -1.101158, -1.867181, 0, 1, 0.01568628, 1,
-0.4397992, 0.1527653, -2.022472, 0, 1, 0.02352941, 1,
-0.4376624, -1.169833, -3.66437, 0, 1, 0.02745098, 1,
-0.4356311, 1.596515, -1.906929, 0, 1, 0.03529412, 1,
-0.4206747, 1.876733, -1.096776, 0, 1, 0.03921569, 1,
-0.4205783, -1.677422, -1.970303, 0, 1, 0.04705882, 1,
-0.4204106, 0.8681228, -0.595858, 0, 1, 0.05098039, 1,
-0.4198718, -0.8392212, -2.656123, 0, 1, 0.05882353, 1,
-0.4189096, -0.1084633, -2.570025, 0, 1, 0.0627451, 1,
-0.4162547, 1.538659, -2.970035, 0, 1, 0.07058824, 1,
-0.4100736, 0.5586678, -1.675897, 0, 1, 0.07450981, 1,
-0.4070488, 0.4370078, -0.3735184, 0, 1, 0.08235294, 1,
-0.4069243, -0.369932, -2.04797, 0, 1, 0.08627451, 1,
-0.4064002, -0.2843579, -1.658195, 0, 1, 0.09411765, 1,
-0.4035614, -0.8443677, -2.963583, 0, 1, 0.1019608, 1,
-0.4034258, -1.782909, -3.73892, 0, 1, 0.1058824, 1,
-0.3984876, -0.01621275, 0.9352965, 0, 1, 0.1137255, 1,
-0.398017, 1.035526, -1.924529, 0, 1, 0.1176471, 1,
-0.3973672, 0.6801242, -1.285769, 0, 1, 0.1254902, 1,
-0.3952353, -0.5951083, -2.812632, 0, 1, 0.1294118, 1,
-0.3945731, 0.1323476, -1.420557, 0, 1, 0.1372549, 1,
-0.3905265, -0.3623191, -1.102702, 0, 1, 0.1411765, 1,
-0.3840738, -0.0359862, -2.411419, 0, 1, 0.1490196, 1,
-0.3788874, -0.5713052, -1.849588, 0, 1, 0.1529412, 1,
-0.376849, 1.519427, 0.8652492, 0, 1, 0.1607843, 1,
-0.376842, -0.07199559, -1.545153, 0, 1, 0.1647059, 1,
-0.3725096, -1.435392, -2.696479, 0, 1, 0.172549, 1,
-0.3717708, 0.6888483, -0.3755337, 0, 1, 0.1764706, 1,
-0.3717615, 1.266534, -0.624299, 0, 1, 0.1843137, 1,
-0.3699944, 0.6715681, -0.5021298, 0, 1, 0.1882353, 1,
-0.3691682, 0.3785945, -2.853215, 0, 1, 0.1960784, 1,
-0.3677529, -0.8836572, -1.633054, 0, 1, 0.2039216, 1,
-0.3665091, 1.648015, 2.326921, 0, 1, 0.2078431, 1,
-0.3659449, -0.9501877, -2.460697, 0, 1, 0.2156863, 1,
-0.3634784, 1.275016, -1.003601, 0, 1, 0.2196078, 1,
-0.3624353, -0.4049481, -0.5040237, 0, 1, 0.227451, 1,
-0.3622364, 0.6198688, 2.280733, 0, 1, 0.2313726, 1,
-0.3594061, -0.6691077, -2.571953, 0, 1, 0.2392157, 1,
-0.355735, -0.242432, -2.744422, 0, 1, 0.2431373, 1,
-0.3520613, 0.4922368, -2.83384, 0, 1, 0.2509804, 1,
-0.3494336, 1.680818, 0.1877586, 0, 1, 0.254902, 1,
-0.3489407, 0.8085034, 1.132917, 0, 1, 0.2627451, 1,
-0.3438262, -0.07846166, -3.416915, 0, 1, 0.2666667, 1,
-0.3408414, 0.341636, -1.255259, 0, 1, 0.2745098, 1,
-0.3403446, -2.388635, -1.738612, 0, 1, 0.2784314, 1,
-0.340117, -0.5524791, -1.825947, 0, 1, 0.2862745, 1,
-0.339596, 0.4414167, 1.677935, 0, 1, 0.2901961, 1,
-0.336817, 0.7499035, -0.566089, 0, 1, 0.2980392, 1,
-0.3360865, -0.7881802, -2.12587, 0, 1, 0.3058824, 1,
-0.3358079, -0.672133, -3.422029, 0, 1, 0.3098039, 1,
-0.3357201, -0.4575624, -2.825463, 0, 1, 0.3176471, 1,
-0.3352897, 1.633766, -0.4408631, 0, 1, 0.3215686, 1,
-0.3342105, 0.6220282, -0.331365, 0, 1, 0.3294118, 1,
-0.3334102, -0.5814229, -2.654315, 0, 1, 0.3333333, 1,
-0.3317451, -1.516321, -2.84692, 0, 1, 0.3411765, 1,
-0.3317082, -1.077789, -3.258647, 0, 1, 0.345098, 1,
-0.3313037, -0.9918171, -3.428229, 0, 1, 0.3529412, 1,
-0.3312744, -0.9114015, -1.224927, 0, 1, 0.3568628, 1,
-0.3267871, -0.6769062, -4.299462, 0, 1, 0.3647059, 1,
-0.3262887, 0.1229003, -0.5708576, 0, 1, 0.3686275, 1,
-0.3226528, 0.9521628, 0.3351092, 0, 1, 0.3764706, 1,
-0.3216409, -2.236747, -4.927961, 0, 1, 0.3803922, 1,
-0.3179263, -1.951427, -3.933298, 0, 1, 0.3882353, 1,
-0.3132442, -0.5760788, -3.83539, 0, 1, 0.3921569, 1,
-0.3117175, -0.2290053, -0.8575121, 0, 1, 0.4, 1,
-0.3097263, 0.788368, -2.332218, 0, 1, 0.4078431, 1,
-0.30711, 1.65755, -0.7994792, 0, 1, 0.4117647, 1,
-0.3000755, 1.127495, -0.6180078, 0, 1, 0.4196078, 1,
-0.2981962, -0.2691162, -2.048908, 0, 1, 0.4235294, 1,
-0.2911758, 0.3920365, -1.336668, 0, 1, 0.4313726, 1,
-0.285605, 1.698416, -1.709446, 0, 1, 0.4352941, 1,
-0.2837833, 0.6759999, -0.1426957, 0, 1, 0.4431373, 1,
-0.2823592, -0.2105431, -3.106767, 0, 1, 0.4470588, 1,
-0.2817117, 0.9621888, -0.5404326, 0, 1, 0.454902, 1,
-0.2709661, -0.2806878, -3.203364, 0, 1, 0.4588235, 1,
-0.2707409, -0.4594588, -3.652776, 0, 1, 0.4666667, 1,
-0.2692403, 0.0736467, -0.221029, 0, 1, 0.4705882, 1,
-0.2687588, 0.2244542, 0.5618669, 0, 1, 0.4784314, 1,
-0.2640094, -2.026743, -2.39711, 0, 1, 0.4823529, 1,
-0.2602509, -0.03517231, -0.6001946, 0, 1, 0.4901961, 1,
-0.2602108, 0.1878348, 0.1137355, 0, 1, 0.4941176, 1,
-0.2561964, -1.078758, -3.401452, 0, 1, 0.5019608, 1,
-0.253837, -0.03775405, -0.5727716, 0, 1, 0.509804, 1,
-0.250601, -0.2214633, -3.714411, 0, 1, 0.5137255, 1,
-0.2483378, -1.539724, -1.58937, 0, 1, 0.5215687, 1,
-0.2481738, -0.9092429, -3.037016, 0, 1, 0.5254902, 1,
-0.2437006, 0.3487288, -0.9390323, 0, 1, 0.5333334, 1,
-0.2423994, 0.9161927, -0.4618345, 0, 1, 0.5372549, 1,
-0.2411096, -0.6872996, -4.260693, 0, 1, 0.5450981, 1,
-0.2376463, 2.522281, 0.1437979, 0, 1, 0.5490196, 1,
-0.2334675, 0.01082467, -0.07420721, 0, 1, 0.5568628, 1,
-0.2324748, -1.20925, -4.460165, 0, 1, 0.5607843, 1,
-0.2312767, -0.09435816, -1.529691, 0, 1, 0.5686275, 1,
-0.2308747, 0.1606359, -2.594764, 0, 1, 0.572549, 1,
-0.2288361, -1.397403, -1.692052, 0, 1, 0.5803922, 1,
-0.2274829, -0.04520449, -1.48335, 0, 1, 0.5843138, 1,
-0.2273537, -0.6301207, -2.971863, 0, 1, 0.5921569, 1,
-0.2266375, -1.257507, -2.588877, 0, 1, 0.5960785, 1,
-0.2194653, -0.6645473, -2.615875, 0, 1, 0.6039216, 1,
-0.2174865, 0.2810375, -0.9404342, 0, 1, 0.6117647, 1,
-0.2140904, -0.1889123, -1.768459, 0, 1, 0.6156863, 1,
-0.2132149, 0.2940075, -0.2095639, 0, 1, 0.6235294, 1,
-0.20934, 0.8001202, 1.031357, 0, 1, 0.627451, 1,
-0.2006967, -1.483329, -2.711937, 0, 1, 0.6352941, 1,
-0.2001029, -1.996136, -2.361759, 0, 1, 0.6392157, 1,
-0.1996397, 0.547587, -0.9248556, 0, 1, 0.6470588, 1,
-0.1993112, 0.1661699, -1.302169, 0, 1, 0.6509804, 1,
-0.195289, -0.5387535, -2.65835, 0, 1, 0.6588235, 1,
-0.1928601, -0.2603006, -2.34803, 0, 1, 0.6627451, 1,
-0.189832, 0.859111, -0.6990061, 0, 1, 0.6705883, 1,
-0.1892035, -1.440012, -2.83196, 0, 1, 0.6745098, 1,
-0.1887598, -0.637885, -3.209466, 0, 1, 0.682353, 1,
-0.1873446, -1.981794, -3.176188, 0, 1, 0.6862745, 1,
-0.1818222, 1.758084, -1.022229, 0, 1, 0.6941177, 1,
-0.1763109, 0.2959675, 0.02531995, 0, 1, 0.7019608, 1,
-0.1725291, 0.9071218, -0.3652982, 0, 1, 0.7058824, 1,
-0.1624943, -0.4638063, -2.858183, 0, 1, 0.7137255, 1,
-0.1588074, 1.391305, -0.6102564, 0, 1, 0.7176471, 1,
-0.1465814, 1.111434, -1.437063, 0, 1, 0.7254902, 1,
-0.1456419, -1.447794, -3.68192, 0, 1, 0.7294118, 1,
-0.1426633, 0.05537479, 0.3140336, 0, 1, 0.7372549, 1,
-0.1332952, 2.02118, -0.42825, 0, 1, 0.7411765, 1,
-0.1313546, -0.3050209, -4.762943, 0, 1, 0.7490196, 1,
-0.1285674, 0.6684337, 1.364046, 0, 1, 0.7529412, 1,
-0.1282072, 2.082714, 0.019903, 0, 1, 0.7607843, 1,
-0.1280367, -0.2346352, -2.064646, 0, 1, 0.7647059, 1,
-0.1276046, -0.203671, -3.500441, 0, 1, 0.772549, 1,
-0.1243532, 0.04232535, -0.944492, 0, 1, 0.7764706, 1,
-0.1241766, 0.7350366, -0.9482695, 0, 1, 0.7843137, 1,
-0.1217272, 0.2559443, -0.1396165, 0, 1, 0.7882353, 1,
-0.1150066, 0.4274012, 1.287308, 0, 1, 0.7960784, 1,
-0.114798, -1.40957, -2.765098, 0, 1, 0.8039216, 1,
-0.1134535, 0.7940153, -0.01792799, 0, 1, 0.8078431, 1,
-0.1111158, 0.4808879, 0.3582971, 0, 1, 0.8156863, 1,
-0.1087889, -1.126796, -3.398351, 0, 1, 0.8196079, 1,
-0.1069116, -1.511866, -2.679808, 0, 1, 0.827451, 1,
-0.09990768, -1.38154, -2.942465, 0, 1, 0.8313726, 1,
-0.09804795, -1.435097, -1.945251, 0, 1, 0.8392157, 1,
-0.09700032, -0.6864858, -4.719001, 0, 1, 0.8431373, 1,
-0.09444904, 0.819039, -0.1366276, 0, 1, 0.8509804, 1,
-0.09227259, 0.2109884, -1.90066, 0, 1, 0.854902, 1,
-0.09221591, -1.154694, -3.758475, 0, 1, 0.8627451, 1,
-0.09124404, 0.3873938, 0.2912332, 0, 1, 0.8666667, 1,
-0.08865104, 0.6727839, 3.111518, 0, 1, 0.8745098, 1,
-0.08613206, -0.240797, -3.752427, 0, 1, 0.8784314, 1,
-0.08299748, 0.2556579, 1.220942, 0, 1, 0.8862745, 1,
-0.07612845, -0.1218905, -1.283615, 0, 1, 0.8901961, 1,
-0.07296193, 1.65701, -1.127794, 0, 1, 0.8980392, 1,
-0.07260089, -0.3049035, -4.00532, 0, 1, 0.9058824, 1,
-0.07069067, -1.063393, -2.754241, 0, 1, 0.9098039, 1,
-0.07032455, -0.3485292, -2.346509, 0, 1, 0.9176471, 1,
-0.06216985, -1.464751, -3.652579, 0, 1, 0.9215686, 1,
-0.06072678, 1.756803, -0.8619205, 0, 1, 0.9294118, 1,
-0.0599398, -0.4294262, -2.23791, 0, 1, 0.9333333, 1,
-0.04919619, 1.046914, 1.305555, 0, 1, 0.9411765, 1,
-0.04731682, 1.552251, 0.2063444, 0, 1, 0.945098, 1,
-0.04525763, -0.1384166, -2.31231, 0, 1, 0.9529412, 1,
-0.04215214, 0.2375698, -0.6771418, 0, 1, 0.9568627, 1,
-0.04186035, 1.086088, -0.6715472, 0, 1, 0.9647059, 1,
-0.04132322, 0.7822041, 0.6529534, 0, 1, 0.9686275, 1,
-0.04108294, -0.4794629, -2.279258, 0, 1, 0.9764706, 1,
-0.03637448, -1.442191, -1.450526, 0, 1, 0.9803922, 1,
-0.0361913, 1.247887, -0.3196074, 0, 1, 0.9882353, 1,
-0.03457082, 0.6065888, -0.5404092, 0, 1, 0.9921569, 1,
-0.03403012, 0.4620076, -1.498108, 0, 1, 1, 1,
-0.03335804, -2.890769, -3.496943, 0, 0.9921569, 1, 1,
-0.03019917, 0.5095333, 0.3072881, 0, 0.9882353, 1, 1,
-0.0277522, -0.8191074, -4.477421, 0, 0.9803922, 1, 1,
-0.02565972, -0.2633203, -4.677341, 0, 0.9764706, 1, 1,
-0.01815723, -1.427298, -2.28935, 0, 0.9686275, 1, 1,
-0.007373249, 0.2116191, -0.4078583, 0, 0.9647059, 1, 1,
-0.005517303, 1.692638, 0.3943897, 0, 0.9568627, 1, 1,
-0.005159128, -0.9528438, -4.624068, 0, 0.9529412, 1, 1,
-0.004232828, -1.959496, -3.498828, 0, 0.945098, 1, 1,
-0.001830124, -0.0950048, -3.523026, 0, 0.9411765, 1, 1,
0.003166862, 0.03484164, 0.05507426, 0, 0.9333333, 1, 1,
0.009172148, -0.2981447, 0.6210755, 0, 0.9294118, 1, 1,
0.01824032, 1.771384, 0.5329666, 0, 0.9215686, 1, 1,
0.03015737, -0.05641536, 1.468799, 0, 0.9176471, 1, 1,
0.0320261, 1.341533, -1.632688, 0, 0.9098039, 1, 1,
0.03266412, -1.001251, 2.739928, 0, 0.9058824, 1, 1,
0.0345365, -0.8018115, 0.2703447, 0, 0.8980392, 1, 1,
0.03819128, 2.501127, -0.002704513, 0, 0.8901961, 1, 1,
0.04360931, 0.7574164, -1.101204, 0, 0.8862745, 1, 1,
0.04650119, -1.307537, 3.304463, 0, 0.8784314, 1, 1,
0.0470355, -1.760763, 3.691253, 0, 0.8745098, 1, 1,
0.05009142, 0.1133468, 0.4166383, 0, 0.8666667, 1, 1,
0.05170995, 1.172192, -0.8804076, 0, 0.8627451, 1, 1,
0.0560429, -0.6053757, 0.7313729, 0, 0.854902, 1, 1,
0.05729626, 0.8658139, 0.08868148, 0, 0.8509804, 1, 1,
0.0581513, 0.04389164, 1.800739, 0, 0.8431373, 1, 1,
0.05996205, 0.3192753, -0.3549269, 0, 0.8392157, 1, 1,
0.06011717, 0.6280969, 0.1998288, 0, 0.8313726, 1, 1,
0.06174483, -0.5193455, 4.324254, 0, 0.827451, 1, 1,
0.06186911, 2.013346, 0.1018679, 0, 0.8196079, 1, 1,
0.06641006, 0.6254472, 0.8345563, 0, 0.8156863, 1, 1,
0.07247308, 1.291619, -1.025698, 0, 0.8078431, 1, 1,
0.07376349, -0.4365545, 3.339793, 0, 0.8039216, 1, 1,
0.0779458, 1.383762, 1.229759, 0, 0.7960784, 1, 1,
0.0823425, 0.9616885, 0.3017215, 0, 0.7882353, 1, 1,
0.08243497, -1.856891, 5.021911, 0, 0.7843137, 1, 1,
0.08441357, 0.08254746, 2.973226, 0, 0.7764706, 1, 1,
0.08868828, -1.349914, 2.080323, 0, 0.772549, 1, 1,
0.08941157, -0.3355054, 3.315666, 0, 0.7647059, 1, 1,
0.0918994, -0.3952639, 2.709263, 0, 0.7607843, 1, 1,
0.09213265, -1.498098, 2.813945, 0, 0.7529412, 1, 1,
0.09380636, 0.4602361, 0.2826272, 0, 0.7490196, 1, 1,
0.09439049, 0.3631659, -0.3200886, 0, 0.7411765, 1, 1,
0.09529486, -0.1874171, 2.958305, 0, 0.7372549, 1, 1,
0.09766944, 1.240954, 0.681383, 0, 0.7294118, 1, 1,
0.10042, 0.01639734, 0.8758023, 0, 0.7254902, 1, 1,
0.1054698, -1.246557, 3.610953, 0, 0.7176471, 1, 1,
0.1063354, -0.6619117, 4.615789, 0, 0.7137255, 1, 1,
0.1070785, -0.6577032, 3.226385, 0, 0.7058824, 1, 1,
0.1095805, -1.475351, 3.409695, 0, 0.6980392, 1, 1,
0.1114841, -1.952799, 3.608691, 0, 0.6941177, 1, 1,
0.1137556, 0.03271167, 1.346521, 0, 0.6862745, 1, 1,
0.1155002, -0.7951117, 4.079596, 0, 0.682353, 1, 1,
0.1162168, 0.05057446, 2.985566, 0, 0.6745098, 1, 1,
0.1171401, 1.191569, -0.3189478, 0, 0.6705883, 1, 1,
0.1183113, -1.382589, 2.99958, 0, 0.6627451, 1, 1,
0.1239702, -1.98034, 3.404988, 0, 0.6588235, 1, 1,
0.1240845, -1.328672, 0.8052836, 0, 0.6509804, 1, 1,
0.1249194, 0.7423255, -0.5810942, 0, 0.6470588, 1, 1,
0.1268847, -0.6148731, 1.057593, 0, 0.6392157, 1, 1,
0.1270654, -0.4942805, 2.73366, 0, 0.6352941, 1, 1,
0.1284561, -0.5365761, 1.716381, 0, 0.627451, 1, 1,
0.1308623, 0.8064959, -0.2792118, 0, 0.6235294, 1, 1,
0.1356026, -1.158744, 3.912216, 0, 0.6156863, 1, 1,
0.1368325, 0.007201146, 0.1016023, 0, 0.6117647, 1, 1,
0.1389303, 0.2477237, -0.162707, 0, 0.6039216, 1, 1,
0.1412176, 0.7482765, 0.8486369, 0, 0.5960785, 1, 1,
0.1435031, 0.2287977, -0.9888381, 0, 0.5921569, 1, 1,
0.1532278, 0.03078307, 3.067683, 0, 0.5843138, 1, 1,
0.1538602, 1.081493, 1.895858, 0, 0.5803922, 1, 1,
0.1642068, -0.5566554, 3.063777, 0, 0.572549, 1, 1,
0.1714017, 0.07636923, -0.6267132, 0, 0.5686275, 1, 1,
0.1715873, 0.6881008, 0.6273524, 0, 0.5607843, 1, 1,
0.1718722, -1.520334, 4.308811, 0, 0.5568628, 1, 1,
0.1728704, -1.837384, 2.010831, 0, 0.5490196, 1, 1,
0.1731946, -0.1215754, 0.696242, 0, 0.5450981, 1, 1,
0.1739354, -1.031811, 0.7939361, 0, 0.5372549, 1, 1,
0.1746904, 0.6271307, 1.079713, 0, 0.5333334, 1, 1,
0.1747606, -0.6025497, 3.644825, 0, 0.5254902, 1, 1,
0.175824, -0.6992223, 3.716547, 0, 0.5215687, 1, 1,
0.1805963, -0.05815975, 1.282329, 0, 0.5137255, 1, 1,
0.1830977, -0.6044698, 1.616423, 0, 0.509804, 1, 1,
0.1835, -0.5986115, 3.498022, 0, 0.5019608, 1, 1,
0.185607, 0.9052894, -0.8456872, 0, 0.4941176, 1, 1,
0.1861365, 0.1920105, 1.156444, 0, 0.4901961, 1, 1,
0.1880998, -0.3701361, 3.573677, 0, 0.4823529, 1, 1,
0.1895966, 0.2152905, 0.06475811, 0, 0.4784314, 1, 1,
0.190152, 1.34391, 0.3520443, 0, 0.4705882, 1, 1,
0.1902676, 1.024913, 2.041463, 0, 0.4666667, 1, 1,
0.1907072, 1.90514, -0.1268352, 0, 0.4588235, 1, 1,
0.1908605, 0.8515735, 0.9678671, 0, 0.454902, 1, 1,
0.1915932, -0.1808032, 4.922599, 0, 0.4470588, 1, 1,
0.1920981, -1.588201, 4.838067, 0, 0.4431373, 1, 1,
0.1922627, 0.4662557, 0.3460918, 0, 0.4352941, 1, 1,
0.1942055, 0.3151557, -0.945708, 0, 0.4313726, 1, 1,
0.1951833, -0.2183963, 2.555147, 0, 0.4235294, 1, 1,
0.1972339, 0.1183075, 0.2245512, 0, 0.4196078, 1, 1,
0.1992186, -0.6431713, 5.557584, 0, 0.4117647, 1, 1,
0.203919, -1.619724, 5.045193, 0, 0.4078431, 1, 1,
0.2043279, -0.009310052, 1.493392, 0, 0.4, 1, 1,
0.2086565, 1.156193, -0.2071529, 0, 0.3921569, 1, 1,
0.2105936, -0.4079003, 1.804217, 0, 0.3882353, 1, 1,
0.2132909, 0.598245, -1.239339, 0, 0.3803922, 1, 1,
0.2136948, -0.2820688, 4.09277, 0, 0.3764706, 1, 1,
0.214664, 0.5009047, -0.2400674, 0, 0.3686275, 1, 1,
0.2182585, -0.06418868, 0.9395818, 0, 0.3647059, 1, 1,
0.2183599, -0.8778558, 2.458411, 0, 0.3568628, 1, 1,
0.2220163, -0.6976161, 2.134633, 0, 0.3529412, 1, 1,
0.2244781, -0.1830889, 2.465403, 0, 0.345098, 1, 1,
0.2281394, 1.691119, 0.02939519, 0, 0.3411765, 1, 1,
0.2401466, -0.1986643, 2.371562, 0, 0.3333333, 1, 1,
0.2405862, -1.410151, 2.348593, 0, 0.3294118, 1, 1,
0.2446625, -1.58548, 5.087631, 0, 0.3215686, 1, 1,
0.2507298, -0.2429209, 3.887424, 0, 0.3176471, 1, 1,
0.2511931, 0.9777496, 0.5256429, 0, 0.3098039, 1, 1,
0.2547049, -0.3186586, 1.911324, 0, 0.3058824, 1, 1,
0.2551306, -0.38911, 2.64379, 0, 0.2980392, 1, 1,
0.2574096, 2.238767, 0.513787, 0, 0.2901961, 1, 1,
0.2631826, -1.718059, 3.6199, 0, 0.2862745, 1, 1,
0.2645397, 0.6658081, -0.7414484, 0, 0.2784314, 1, 1,
0.2683245, 2.60333, 0.9819801, 0, 0.2745098, 1, 1,
0.2697712, 0.02179565, 2.914262, 0, 0.2666667, 1, 1,
0.2699903, -0.6939464, 1.953816, 0, 0.2627451, 1, 1,
0.2770513, 0.06423974, 2.051091, 0, 0.254902, 1, 1,
0.277274, -1.142714, 1.680811, 0, 0.2509804, 1, 1,
0.2805757, -1.71863, 2.544476, 0, 0.2431373, 1, 1,
0.2817926, 0.8299178, 2.239016, 0, 0.2392157, 1, 1,
0.2818318, -0.4645312, 0.1041279, 0, 0.2313726, 1, 1,
0.2865153, 0.8874192, 1.355738, 0, 0.227451, 1, 1,
0.2872932, -0.121025, 2.948701, 0, 0.2196078, 1, 1,
0.2880105, 1.980015, 0.02525836, 0, 0.2156863, 1, 1,
0.2934004, 0.3945592, 2.169904, 0, 0.2078431, 1, 1,
0.2968282, 1.188925, 0.5806438, 0, 0.2039216, 1, 1,
0.2991804, 0.07072327, 0.296452, 0, 0.1960784, 1, 1,
0.3064615, -1.088506, 1.646246, 0, 0.1882353, 1, 1,
0.3068475, -1.20059, 3.380222, 0, 0.1843137, 1, 1,
0.307602, -1.164518, 2.057852, 0, 0.1764706, 1, 1,
0.3130064, -0.8137611, 4.031327, 0, 0.172549, 1, 1,
0.3139172, -0.3203219, 2.367634, 0, 0.1647059, 1, 1,
0.3151839, -1.385029, 2.78415, 0, 0.1607843, 1, 1,
0.3154035, 1.873925, 1.086439, 0, 0.1529412, 1, 1,
0.3175789, -0.3261015, 1.625957, 0, 0.1490196, 1, 1,
0.3184222, -0.7261415, 3.415172, 0, 0.1411765, 1, 1,
0.3210831, -1.118623, 1.703475, 0, 0.1372549, 1, 1,
0.3268351, -0.9901943, 2.33306, 0, 0.1294118, 1, 1,
0.3277562, -1.354331, 2.975802, 0, 0.1254902, 1, 1,
0.3307137, 0.8817762, 0.6519384, 0, 0.1176471, 1, 1,
0.3322246, -0.009335489, -0.7182279, 0, 0.1137255, 1, 1,
0.3360311, -0.8237237, 2.394545, 0, 0.1058824, 1, 1,
0.3394883, 1.656818, 0.04505571, 0, 0.09803922, 1, 1,
0.3410108, -0.5142031, 3.219198, 0, 0.09411765, 1, 1,
0.3430235, -1.187834, 2.794332, 0, 0.08627451, 1, 1,
0.347955, -0.7586209, 2.565712, 0, 0.08235294, 1, 1,
0.3508871, 0.07266602, 0.9825228, 0, 0.07450981, 1, 1,
0.3524121, 0.5678422, -0.4930041, 0, 0.07058824, 1, 1,
0.3535179, 0.5044124, -0.7957245, 0, 0.0627451, 1, 1,
0.3552847, 0.7848408, 1.960841, 0, 0.05882353, 1, 1,
0.3573861, -0.7068214, 1.63768, 0, 0.05098039, 1, 1,
0.3577399, 0.3218265, 0.2257896, 0, 0.04705882, 1, 1,
0.3595324, 1.454282, 0.376656, 0, 0.03921569, 1, 1,
0.363031, -1.262551, 2.7059, 0, 0.03529412, 1, 1,
0.3699402, 0.03781866, 1.279237, 0, 0.02745098, 1, 1,
0.3700363, -0.7405442, 1.573274, 0, 0.02352941, 1, 1,
0.3725793, -1.858379, 3.739057, 0, 0.01568628, 1, 1,
0.374413, -0.9467492, 3.58078, 0, 0.01176471, 1, 1,
0.377708, -0.8468898, 2.567058, 0, 0.003921569, 1, 1,
0.3801946, 0.9078432, 0.6861305, 0.003921569, 0, 1, 1,
0.381729, -0.3035836, 2.617307, 0.007843138, 0, 1, 1,
0.3829025, 2.709106, -1.214448, 0.01568628, 0, 1, 1,
0.3846525, -1.005683, 1.476053, 0.01960784, 0, 1, 1,
0.3858972, 1.494537, 1.641961, 0.02745098, 0, 1, 1,
0.3887981, 0.4802134, 0.6490025, 0.03137255, 0, 1, 1,
0.3915054, -1.731725, 3.256026, 0.03921569, 0, 1, 1,
0.3953093, 0.5464157, 2.41801, 0.04313726, 0, 1, 1,
0.400978, 1.094935, 1.916624, 0.05098039, 0, 1, 1,
0.4064001, -0.9401655, 4.491983, 0.05490196, 0, 1, 1,
0.4072171, -1.04923, 3.579084, 0.0627451, 0, 1, 1,
0.4082049, -0.6574297, 3.835537, 0.06666667, 0, 1, 1,
0.4093095, 2.081046, -1.103024, 0.07450981, 0, 1, 1,
0.410248, 0.1719065, 1.59468, 0.07843138, 0, 1, 1,
0.4178816, -0.3529383, 1.127529, 0.08627451, 0, 1, 1,
0.4214461, -0.2746888, 5.691454, 0.09019608, 0, 1, 1,
0.4230799, 0.4058432, 2.757624, 0.09803922, 0, 1, 1,
0.4264994, -0.01939832, 1.282321, 0.1058824, 0, 1, 1,
0.4268467, -0.9523521, 2.779359, 0.1098039, 0, 1, 1,
0.4315686, -0.3263641, 1.356357, 0.1176471, 0, 1, 1,
0.4327081, 0.7562326, 1.236305, 0.1215686, 0, 1, 1,
0.4345351, -0.1708227, 2.401492, 0.1294118, 0, 1, 1,
0.4351721, 1.136868, 1.614795, 0.1333333, 0, 1, 1,
0.4394618, -0.067438, 2.106436, 0.1411765, 0, 1, 1,
0.4416108, -1.281918, 2.781718, 0.145098, 0, 1, 1,
0.4432342, 2.015522, -0.05980432, 0.1529412, 0, 1, 1,
0.4447626, -1.382806, 1.979151, 0.1568628, 0, 1, 1,
0.4452493, -1.677721, 4.693727, 0.1647059, 0, 1, 1,
0.4475155, -0.7310064, 3.591691, 0.1686275, 0, 1, 1,
0.4501343, 0.04544158, 3.317039, 0.1764706, 0, 1, 1,
0.4577855, -1.844052, 3.351001, 0.1803922, 0, 1, 1,
0.4589987, -0.07920443, 2.211544, 0.1882353, 0, 1, 1,
0.4679467, 1.430763, 1.187429, 0.1921569, 0, 1, 1,
0.468418, 0.3539212, 1.711084, 0.2, 0, 1, 1,
0.4688001, 0.5300612, -0.2911033, 0.2078431, 0, 1, 1,
0.4774841, -0.9930516, 2.597248, 0.2117647, 0, 1, 1,
0.4788787, -1.921781, 0.9986181, 0.2196078, 0, 1, 1,
0.4810658, 1.547555, 0.2753618, 0.2235294, 0, 1, 1,
0.4812377, 1.40806, 0.2734586, 0.2313726, 0, 1, 1,
0.4876209, 1.332855, 2.134947, 0.2352941, 0, 1, 1,
0.4932225, -0.1415257, 3.962405, 0.2431373, 0, 1, 1,
0.4938038, -0.2695419, 3.684141, 0.2470588, 0, 1, 1,
0.4947247, -1.093605, 0.9913316, 0.254902, 0, 1, 1,
0.4962131, 1.250704, 0.2014123, 0.2588235, 0, 1, 1,
0.4970791, 1.777129, -0.2932642, 0.2666667, 0, 1, 1,
0.5001967, -0.08779887, 1.943567, 0.2705882, 0, 1, 1,
0.5036583, 0.9756311, 0.9581683, 0.2784314, 0, 1, 1,
0.505976, 1.372256, -0.2934388, 0.282353, 0, 1, 1,
0.5064953, 0.2228227, -0.2275916, 0.2901961, 0, 1, 1,
0.5088214, -0.9620333, 1.672971, 0.2941177, 0, 1, 1,
0.5088646, -0.1059928, 3.483806, 0.3019608, 0, 1, 1,
0.5141399, -0.4747109, 4.955946, 0.3098039, 0, 1, 1,
0.5143851, 0.07347032, 1.145296, 0.3137255, 0, 1, 1,
0.5170874, 0.7151095, 2.758851, 0.3215686, 0, 1, 1,
0.5173838, -0.4799638, 2.164792, 0.3254902, 0, 1, 1,
0.522978, -2.288305, 4.006635, 0.3333333, 0, 1, 1,
0.5248355, 2.104049, 0.4430552, 0.3372549, 0, 1, 1,
0.5303462, 2.202553, 0.4564981, 0.345098, 0, 1, 1,
0.5338581, 1.186713, -0.3642262, 0.3490196, 0, 1, 1,
0.5367103, 0.1932772, 1.120048, 0.3568628, 0, 1, 1,
0.5390054, 0.5772142, 1.200082, 0.3607843, 0, 1, 1,
0.5392227, 1.635792, 0.484084, 0.3686275, 0, 1, 1,
0.5498364, 0.463659, 1.19828, 0.372549, 0, 1, 1,
0.5502163, 0.6116477, -0.6061708, 0.3803922, 0, 1, 1,
0.5578104, -1.205402, 3.767992, 0.3843137, 0, 1, 1,
0.5667196, -0.6274665, 0.623925, 0.3921569, 0, 1, 1,
0.5700915, 0.2883324, -0.1958691, 0.3960784, 0, 1, 1,
0.5710391, 0.4471145, 2.131562, 0.4039216, 0, 1, 1,
0.5732633, -1.032201, 3.281875, 0.4117647, 0, 1, 1,
0.5739353, -0.1376543, 1.487376, 0.4156863, 0, 1, 1,
0.5768491, -1.109669, 1.574684, 0.4235294, 0, 1, 1,
0.5787409, 0.4397948, 1.90642, 0.427451, 0, 1, 1,
0.5788509, -0.5397444, 3.339607, 0.4352941, 0, 1, 1,
0.586482, -0.4312968, 1.077263, 0.4392157, 0, 1, 1,
0.5879101, 0.8818084, -0.05471044, 0.4470588, 0, 1, 1,
0.5897815, 0.9941548, 1.474065, 0.4509804, 0, 1, 1,
0.5898674, 0.2271863, 1.124336, 0.4588235, 0, 1, 1,
0.5908757, 0.0204331, 3.038997, 0.4627451, 0, 1, 1,
0.5910832, -0.3498418, 2.062623, 0.4705882, 0, 1, 1,
0.5919228, -0.03799931, 2.771822, 0.4745098, 0, 1, 1,
0.5945585, 0.1473951, 3.477232, 0.4823529, 0, 1, 1,
0.5947365, 1.987853, -0.03735549, 0.4862745, 0, 1, 1,
0.5953379, -0.1018668, 0.802445, 0.4941176, 0, 1, 1,
0.5961952, 0.003946024, 3.058314, 0.5019608, 0, 1, 1,
0.603865, 1.290066, 0.8250079, 0.5058824, 0, 1, 1,
0.603907, 1.369831, -0.298629, 0.5137255, 0, 1, 1,
0.6073222, -0.6635591, 1.219532, 0.5176471, 0, 1, 1,
0.6209353, 0.1924603, 0.4275174, 0.5254902, 0, 1, 1,
0.6214802, 0.4980309, 2.053319, 0.5294118, 0, 1, 1,
0.623126, -2.198582, 2.46793, 0.5372549, 0, 1, 1,
0.6248084, 1.827408, 0.6176244, 0.5411765, 0, 1, 1,
0.6270851, -0.4540441, 2.79656, 0.5490196, 0, 1, 1,
0.630241, 0.3834899, 0.7489814, 0.5529412, 0, 1, 1,
0.6359466, 0.04906693, 1.601011, 0.5607843, 0, 1, 1,
0.6418457, 0.6789703, 0.6629593, 0.5647059, 0, 1, 1,
0.6457785, -0.5769554, 4.190475, 0.572549, 0, 1, 1,
0.6512365, -0.9810028, 2.951626, 0.5764706, 0, 1, 1,
0.65541, 0.6423545, -0.2505831, 0.5843138, 0, 1, 1,
0.6572009, 0.82871, 0.254738, 0.5882353, 0, 1, 1,
0.6612241, -0.7144267, 3.100364, 0.5960785, 0, 1, 1,
0.6691591, 1.484363, 1.507913, 0.6039216, 0, 1, 1,
0.6704286, -0.04190682, 0.9334646, 0.6078432, 0, 1, 1,
0.6713706, 1.68091, -0.3852336, 0.6156863, 0, 1, 1,
0.6716173, -0.7710556, 4.16877, 0.6196079, 0, 1, 1,
0.6737473, 0.5809479, 0.02658194, 0.627451, 0, 1, 1,
0.6771429, -0.09458876, 2.554265, 0.6313726, 0, 1, 1,
0.6772717, 0.9178834, 1.30207, 0.6392157, 0, 1, 1,
0.6778712, -1.023801, 0.4680207, 0.6431373, 0, 1, 1,
0.6838183, -0.7266638, 1.532713, 0.6509804, 0, 1, 1,
0.6878204, 0.8509919, 0.6619191, 0.654902, 0, 1, 1,
0.688036, 0.2683077, 1.567353, 0.6627451, 0, 1, 1,
0.6896385, -1.324686, 3.232599, 0.6666667, 0, 1, 1,
0.6914915, 1.026401, -0.2098743, 0.6745098, 0, 1, 1,
0.6968217, 0.7382403, 0.6098144, 0.6784314, 0, 1, 1,
0.6968856, -1.020459, 4.04424, 0.6862745, 0, 1, 1,
0.6986696, 1.010789, -1.373741, 0.6901961, 0, 1, 1,
0.7025989, -0.9541841, 2.890763, 0.6980392, 0, 1, 1,
0.7042698, -2.714091, 3.931467, 0.7058824, 0, 1, 1,
0.7054504, 0.6076287, 1.0805, 0.7098039, 0, 1, 1,
0.7059702, -0.2564328, 1.096459, 0.7176471, 0, 1, 1,
0.7063352, -0.4368956, 2.917376, 0.7215686, 0, 1, 1,
0.7125126, -0.1159053, 0.4797352, 0.7294118, 0, 1, 1,
0.7162088, 1.21861, 0.4754483, 0.7333333, 0, 1, 1,
0.7206265, -0.8117642, 1.485081, 0.7411765, 0, 1, 1,
0.7208794, -1.592257, 2.491199, 0.7450981, 0, 1, 1,
0.7236854, 0.8913742, -0.8614557, 0.7529412, 0, 1, 1,
0.7275014, 1.427428, 0.6958697, 0.7568628, 0, 1, 1,
0.7395525, -2.27741, 2.672068, 0.7647059, 0, 1, 1,
0.73965, -0.4030708, 2.666322, 0.7686275, 0, 1, 1,
0.7420202, 0.5323898, 1.490268, 0.7764706, 0, 1, 1,
0.7429039, -1.855371, 1.826527, 0.7803922, 0, 1, 1,
0.7475169, -0.3411149, -0.1383735, 0.7882353, 0, 1, 1,
0.7508974, -1.451473, 2.987352, 0.7921569, 0, 1, 1,
0.7535433, -0.5248601, 2.891956, 0.8, 0, 1, 1,
0.7536525, 1.035411, -0.9709671, 0.8078431, 0, 1, 1,
0.7581884, 1.072941, 1.171149, 0.8117647, 0, 1, 1,
0.7585188, 3.246039, 0.4916172, 0.8196079, 0, 1, 1,
0.76276, 1.761172, -0.5837198, 0.8235294, 0, 1, 1,
0.7638364, -0.8260316, 1.597746, 0.8313726, 0, 1, 1,
0.7654287, -0.7399358, 2.73037, 0.8352941, 0, 1, 1,
0.7721231, -1.330552, 1.796361, 0.8431373, 0, 1, 1,
0.7766573, -0.1338762, 0.7737218, 0.8470588, 0, 1, 1,
0.780889, 0.6877314, -0.4350814, 0.854902, 0, 1, 1,
0.7816082, -0.5076873, 1.294873, 0.8588235, 0, 1, 1,
0.78358, 2.011333, 0.6229183, 0.8666667, 0, 1, 1,
0.7838181, 0.1834213, -1.685235, 0.8705882, 0, 1, 1,
0.8026373, 1.353357, 2.065514, 0.8784314, 0, 1, 1,
0.8063741, -0.6602592, 2.992876, 0.8823529, 0, 1, 1,
0.8126857, 1.579902, 1.339605, 0.8901961, 0, 1, 1,
0.8155434, 0.7434533, 1.25731, 0.8941177, 0, 1, 1,
0.8198639, -0.292233, 2.866942, 0.9019608, 0, 1, 1,
0.8225013, -0.1007037, 1.139309, 0.9098039, 0, 1, 1,
0.8349255, 0.258317, 1.785196, 0.9137255, 0, 1, 1,
0.837521, -1.77629, 2.863992, 0.9215686, 0, 1, 1,
0.8479195, 0.3404645, -1.514876, 0.9254902, 0, 1, 1,
0.849704, -0.1263974, 2.697036, 0.9333333, 0, 1, 1,
0.8498049, 0.8221023, 2.480852, 0.9372549, 0, 1, 1,
0.8600557, 0.6247978, -0.9011887, 0.945098, 0, 1, 1,
0.8607938, 0.9187586, 0.460998, 0.9490196, 0, 1, 1,
0.8765081, 0.4639742, 1.785792, 0.9568627, 0, 1, 1,
0.877507, 1.185426, 1.527109, 0.9607843, 0, 1, 1,
0.8795475, -0.1889775, 0.2392031, 0.9686275, 0, 1, 1,
0.8878658, 0.588143, 1.908469, 0.972549, 0, 1, 1,
0.8955288, -1.151428, 4.069706, 0.9803922, 0, 1, 1,
0.8957214, 1.773643, 0.6640752, 0.9843137, 0, 1, 1,
0.8984646, -0.663538, 2.122406, 0.9921569, 0, 1, 1,
0.8989228, 0.3818306, 1.378368, 0.9960784, 0, 1, 1,
0.9009133, 0.08934783, 1.322652, 1, 0, 0.9960784, 1,
0.902689, -1.297025, 1.809513, 1, 0, 0.9882353, 1,
0.902993, -1.232812, 4.091008, 1, 0, 0.9843137, 1,
0.9095879, 1.078223, 2.037608, 1, 0, 0.9764706, 1,
0.9113373, -0.5709467, 2.942826, 1, 0, 0.972549, 1,
0.9183381, -0.1451446, 2.578174, 1, 0, 0.9647059, 1,
0.9186717, 0.009996829, 0.8913313, 1, 0, 0.9607843, 1,
0.9214571, 0.6412476, 1.726195, 1, 0, 0.9529412, 1,
0.9242609, 0.9960508, 2.24137, 1, 0, 0.9490196, 1,
0.9312053, -0.0110021, 1.44111, 1, 0, 0.9411765, 1,
0.9313161, 1.179566, 1.306472, 1, 0, 0.9372549, 1,
0.9352161, 0.6034432, 1.292992, 1, 0, 0.9294118, 1,
0.9505507, -0.9647301, 2.456015, 1, 0, 0.9254902, 1,
0.9582417, -2.275796, 3.060214, 1, 0, 0.9176471, 1,
0.9586739, 0.1345341, 0.3968381, 1, 0, 0.9137255, 1,
0.9721441, 1.197752, 0.9829534, 1, 0, 0.9058824, 1,
0.9728679, -0.9006385, 2.878263, 1, 0, 0.9019608, 1,
0.9730372, 0.8777444, 0.3800938, 1, 0, 0.8941177, 1,
0.9738516, -1.520336, 3.546837, 1, 0, 0.8862745, 1,
0.9744692, -0.7382357, 0.3562421, 1, 0, 0.8823529, 1,
0.9754789, -0.1369667, 2.368795, 1, 0, 0.8745098, 1,
0.9879528, 0.6742547, 1.164156, 1, 0, 0.8705882, 1,
0.9909579, -1.054986, 1.863627, 1, 0, 0.8627451, 1,
0.9983293, -0.4512124, 1.487391, 1, 0, 0.8588235, 1,
1.003415, 1.594157, 1.419737, 1, 0, 0.8509804, 1,
1.003663, 0.7715325, -0.1205804, 1, 0, 0.8470588, 1,
1.003755, -0.6562408, 0.8284191, 1, 0, 0.8392157, 1,
1.008743, 1.750801, 2.20417, 1, 0, 0.8352941, 1,
1.010627, 0.7452968, -0.2819698, 1, 0, 0.827451, 1,
1.016121, 1.486806, 1.707462, 1, 0, 0.8235294, 1,
1.027496, -0.4603902, 2.701678, 1, 0, 0.8156863, 1,
1.028913, -0.9259466, 2.965433, 1, 0, 0.8117647, 1,
1.041483, -0.1304668, 1.65308, 1, 0, 0.8039216, 1,
1.04156, -1.095797, 1.533183, 1, 0, 0.7960784, 1,
1.042641, 0.5623688, 2.684678, 1, 0, 0.7921569, 1,
1.043994, -0.4470736, 1.770267, 1, 0, 0.7843137, 1,
1.048671, -0.2724193, 3.785863, 1, 0, 0.7803922, 1,
1.052404, -2.379825, 1.514355, 1, 0, 0.772549, 1,
1.056209, -0.3300702, 1.655352, 1, 0, 0.7686275, 1,
1.056874, -0.5275989, 1.894306, 1, 0, 0.7607843, 1,
1.079509, -0.6101669, 2.083855, 1, 0, 0.7568628, 1,
1.082818, 0.9617355, 3.249635, 1, 0, 0.7490196, 1,
1.085553, 0.8862464, 1.476562, 1, 0, 0.7450981, 1,
1.087072, 1.113493, -0.1403461, 1, 0, 0.7372549, 1,
1.093398, 1.463533, 0.4532911, 1, 0, 0.7333333, 1,
1.099479, -0.8837265, 3.016323, 1, 0, 0.7254902, 1,
1.114825, -0.4500297, 2.773617, 1, 0, 0.7215686, 1,
1.117544, -0.9269207, 3.378889, 1, 0, 0.7137255, 1,
1.122499, -0.4438108, 1.491092, 1, 0, 0.7098039, 1,
1.133142, 0.2390002, 3.353273, 1, 0, 0.7019608, 1,
1.133677, 2.409753, -0.5421108, 1, 0, 0.6941177, 1,
1.143261, 0.2469142, 1.993942, 1, 0, 0.6901961, 1,
1.144302, -1.047447, 1.797533, 1, 0, 0.682353, 1,
1.154303, -0.2284727, 2.315475, 1, 0, 0.6784314, 1,
1.1563, -1.186212, 2.652766, 1, 0, 0.6705883, 1,
1.165477, 0.2511805, 1.027225, 1, 0, 0.6666667, 1,
1.166613, -1.185364, 0.8534373, 1, 0, 0.6588235, 1,
1.174664, -0.1292227, 1.858389, 1, 0, 0.654902, 1,
1.176059, -0.944543, 1.743269, 1, 0, 0.6470588, 1,
1.177235, -0.8498291, 2.562908, 1, 0, 0.6431373, 1,
1.180947, 0.5292486, -1.141886, 1, 0, 0.6352941, 1,
1.186364, -1.739231, 2.646806, 1, 0, 0.6313726, 1,
1.187865, -0.5118309, 0.3487949, 1, 0, 0.6235294, 1,
1.191979, -0.3270464, 2.522921, 1, 0, 0.6196079, 1,
1.192826, -2.192622, 1.741832, 1, 0, 0.6117647, 1,
1.193692, 0.1401092, 2.645139, 1, 0, 0.6078432, 1,
1.201055, -0.6234514, 1.620368, 1, 0, 0.6, 1,
1.203003, 1.524713, 0.1368609, 1, 0, 0.5921569, 1,
1.205359, 0.305067, 0.3101974, 1, 0, 0.5882353, 1,
1.206503, -0.1239614, 1.837612, 1, 0, 0.5803922, 1,
1.212739, 0.6499252, 0.4370983, 1, 0, 0.5764706, 1,
1.224937, 1.509629, -0.1237977, 1, 0, 0.5686275, 1,
1.225545, 2.023226, 0.7655783, 1, 0, 0.5647059, 1,
1.229957, 2.12527, -0.5334589, 1, 0, 0.5568628, 1,
1.240781, -0.2230662, 2.419746, 1, 0, 0.5529412, 1,
1.258419, 1.335657, 0.5416243, 1, 0, 0.5450981, 1,
1.260226, -0.6560056, 0.7482972, 1, 0, 0.5411765, 1,
1.266647, -1.5037, 4.93512, 1, 0, 0.5333334, 1,
1.282855, -1.970786, 1.835079, 1, 0, 0.5294118, 1,
1.286103, -1.702359, 1.386747, 1, 0, 0.5215687, 1,
1.286135, -0.307165, 2.133588, 1, 0, 0.5176471, 1,
1.292943, -1.129421, 0.4373341, 1, 0, 0.509804, 1,
1.299418, 0.7145027, 1.671013, 1, 0, 0.5058824, 1,
1.308403, 1.648346, 1.789277, 1, 0, 0.4980392, 1,
1.310384, 0.577208, 1.785833, 1, 0, 0.4901961, 1,
1.315574, -0.1885376, 0.8871367, 1, 0, 0.4862745, 1,
1.329019, -1.047769, 3.47998, 1, 0, 0.4784314, 1,
1.335771, 2.265106, -1.027348, 1, 0, 0.4745098, 1,
1.33797, -0.7435072, 1.257432, 1, 0, 0.4666667, 1,
1.358711, -1.601498, 2.211307, 1, 0, 0.4627451, 1,
1.361928, -1.622805, 2.07499, 1, 0, 0.454902, 1,
1.372437, 1.018946, 1.106894, 1, 0, 0.4509804, 1,
1.375259, -1.886819, 2.544365, 1, 0, 0.4431373, 1,
1.385854, -0.6386775, 2.199947, 1, 0, 0.4392157, 1,
1.400368, -0.6037312, 1.299024, 1, 0, 0.4313726, 1,
1.403167, 0.6208641, 1.415046, 1, 0, 0.427451, 1,
1.413302, -0.3366381, 2.567818, 1, 0, 0.4196078, 1,
1.423045, -0.3303418, 2.626536, 1, 0, 0.4156863, 1,
1.428128, 0.7128058, 1.267512, 1, 0, 0.4078431, 1,
1.433524, 2.074903, -0.6764132, 1, 0, 0.4039216, 1,
1.440346, -0.9290359, 2.645242, 1, 0, 0.3960784, 1,
1.451666, -1.317742, 2.152307, 1, 0, 0.3882353, 1,
1.469092, -0.5144913, 2.900161, 1, 0, 0.3843137, 1,
1.489478, 1.299118, 0.2646377, 1, 0, 0.3764706, 1,
1.494412, 1.557627, 0.7790276, 1, 0, 0.372549, 1,
1.499049, 0.4430965, -0.1740499, 1, 0, 0.3647059, 1,
1.500206, 0.8366562, -0.1641195, 1, 0, 0.3607843, 1,
1.509715, -0.5385649, 1.847685, 1, 0, 0.3529412, 1,
1.512394, 0.4273119, 1.083985, 1, 0, 0.3490196, 1,
1.520706, 1.172415, 1.207007, 1, 0, 0.3411765, 1,
1.523804, 0.2936198, 2.888426, 1, 0, 0.3372549, 1,
1.525948, -1.667616, 1.977601, 1, 0, 0.3294118, 1,
1.53378, 0.3341696, 0.6106171, 1, 0, 0.3254902, 1,
1.54189, -1.245853, 0.9371077, 1, 0, 0.3176471, 1,
1.545528, 1.660816, 0.46119, 1, 0, 0.3137255, 1,
1.553945, -1.477336, 3.68467, 1, 0, 0.3058824, 1,
1.556493, 0.888782, 1.048373, 1, 0, 0.2980392, 1,
1.558149, -0.1730407, 0.05027525, 1, 0, 0.2941177, 1,
1.56486, 1.183904, 1.740805, 1, 0, 0.2862745, 1,
1.598591, -0.005311855, 1.085965, 1, 0, 0.282353, 1,
1.612299, -1.419085, 0.9254858, 1, 0, 0.2745098, 1,
1.62181, -0.3392624, 0.6623908, 1, 0, 0.2705882, 1,
1.65269, -0.1057063, 1.507492, 1, 0, 0.2627451, 1,
1.662311, 2.947402, 0.2701495, 1, 0, 0.2588235, 1,
1.668742, 0.3536768, 0.9506564, 1, 0, 0.2509804, 1,
1.679408, -0.5672059, 1.471375, 1, 0, 0.2470588, 1,
1.683214, -0.4006695, 2.168103, 1, 0, 0.2392157, 1,
1.684696, -2.065001, 1.238754, 1, 0, 0.2352941, 1,
1.688607, 0.274157, 0.5365019, 1, 0, 0.227451, 1,
1.713364, -0.2814612, 0.9567624, 1, 0, 0.2235294, 1,
1.720545, -0.3728941, 2.089736, 1, 0, 0.2156863, 1,
1.742401, -1.252908, 1.02844, 1, 0, 0.2117647, 1,
1.752053, 0.2539535, 1.416069, 1, 0, 0.2039216, 1,
1.756384, 1.056552, 0.9774011, 1, 0, 0.1960784, 1,
1.764235, -0.7877069, 2.93282, 1, 0, 0.1921569, 1,
1.802453, -0.2730948, 2.449456, 1, 0, 0.1843137, 1,
1.867179, 0.8765851, 0.8148779, 1, 0, 0.1803922, 1,
1.87039, -0.3912425, -0.5509686, 1, 0, 0.172549, 1,
1.882388, 0.6769996, 1.097234, 1, 0, 0.1686275, 1,
1.895244, -0.1807325, 2.782849, 1, 0, 0.1607843, 1,
1.923511, 0.4056565, 2.852145, 1, 0, 0.1568628, 1,
1.925961, -2.430054, 2.581897, 1, 0, 0.1490196, 1,
1.928824, -0.3582049, 2.377291, 1, 0, 0.145098, 1,
1.943675, 0.04193071, 1.415411, 1, 0, 0.1372549, 1,
2.049084, 0.9631242, 1.43682, 1, 0, 0.1333333, 1,
2.064645, -0.5526352, 1.907902, 1, 0, 0.1254902, 1,
2.065296, 0.1651871, 1.123003, 1, 0, 0.1215686, 1,
2.079026, -0.3521597, 1.475307, 1, 0, 0.1137255, 1,
2.163116, -0.02440096, -0.01047588, 1, 0, 0.1098039, 1,
2.165981, -1.065854, 3.925557, 1, 0, 0.1019608, 1,
2.196295, 0.5782871, 0.7716293, 1, 0, 0.09411765, 1,
2.201451, -0.6825704, 2.314845, 1, 0, 0.09019608, 1,
2.242841, -0.2353932, 0.1745686, 1, 0, 0.08235294, 1,
2.329092, -1.385605, 2.945624, 1, 0, 0.07843138, 1,
2.34355, 1.55476, 0.9256771, 1, 0, 0.07058824, 1,
2.393817, 1.056691, 1.038573, 1, 0, 0.06666667, 1,
2.434465, -0.2378465, 3.074728, 1, 0, 0.05882353, 1,
2.498985, -0.3571514, 1.902742, 1, 0, 0.05490196, 1,
2.553296, -1.171828, 2.607012, 1, 0, 0.04705882, 1,
2.580957, -0.2324263, 1.601545, 1, 0, 0.04313726, 1,
2.648206, -0.7602814, 3.206157, 1, 0, 0.03529412, 1,
2.771452, -0.5571949, 0.3304677, 1, 0, 0.03137255, 1,
3.201093, -0.8718051, 0.7645129, 1, 0, 0.02352941, 1,
3.361154, 0.1126482, 1.130718, 1, 0, 0.01960784, 1,
3.400867, -0.5932729, 4.063885, 1, 0, 0.01176471, 1,
3.899656, -0.08167524, 0.5996705, 1, 0, 0.007843138, 1
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
0.2046795, -4.239105, -6.727952, 0, -0.5, 0.5, 0.5,
0.2046795, -4.239105, -6.727952, 1, -0.5, 0.5, 0.5,
0.2046795, -4.239105, -6.727952, 1, 1.5, 0.5, 0.5,
0.2046795, -4.239105, -6.727952, 0, 1.5, 0.5, 0.5
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
-4.742894, 0.04589224, -6.727952, 0, -0.5, 0.5, 0.5,
-4.742894, 0.04589224, -6.727952, 1, -0.5, 0.5, 0.5,
-4.742894, 0.04589224, -6.727952, 1, 1.5, 0.5, 0.5,
-4.742894, 0.04589224, -6.727952, 0, 1.5, 0.5, 0.5
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
-4.742894, -4.239105, 0.3817465, 0, -0.5, 0.5, 0.5,
-4.742894, -4.239105, 0.3817465, 1, -0.5, 0.5, 0.5,
-4.742894, -4.239105, 0.3817465, 1, 1.5, 0.5, 0.5,
-4.742894, -4.239105, 0.3817465, 0, 1.5, 0.5, 0.5
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
-2, -3.250259, -5.087253,
2, -3.250259, -5.087253,
-2, -3.250259, -5.087253,
-2, -3.415067, -5.360703,
0, -3.250259, -5.087253,
0, -3.415067, -5.360703,
2, -3.250259, -5.087253,
2, -3.415067, -5.360703
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
-2, -3.744682, -5.907602, 0, -0.5, 0.5, 0.5,
-2, -3.744682, -5.907602, 1, -0.5, 0.5, 0.5,
-2, -3.744682, -5.907602, 1, 1.5, 0.5, 0.5,
-2, -3.744682, -5.907602, 0, 1.5, 0.5, 0.5,
0, -3.744682, -5.907602, 0, -0.5, 0.5, 0.5,
0, -3.744682, -5.907602, 1, -0.5, 0.5, 0.5,
0, -3.744682, -5.907602, 1, 1.5, 0.5, 0.5,
0, -3.744682, -5.907602, 0, 1.5, 0.5, 0.5,
2, -3.744682, -5.907602, 0, -0.5, 0.5, 0.5,
2, -3.744682, -5.907602, 1, -0.5, 0.5, 0.5,
2, -3.744682, -5.907602, 1, 1.5, 0.5, 0.5,
2, -3.744682, -5.907602, 0, 1.5, 0.5, 0.5
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
-3.601146, -3, -5.087253,
-3.601146, 3, -5.087253,
-3.601146, -3, -5.087253,
-3.791437, -3, -5.360703,
-3.601146, -2, -5.087253,
-3.791437, -2, -5.360703,
-3.601146, -1, -5.087253,
-3.791437, -1, -5.360703,
-3.601146, 0, -5.087253,
-3.791437, 0, -5.360703,
-3.601146, 1, -5.087253,
-3.791437, 1, -5.360703,
-3.601146, 2, -5.087253,
-3.791437, 2, -5.360703,
-3.601146, 3, -5.087253,
-3.791437, 3, -5.360703
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
-4.172019, -3, -5.907602, 0, -0.5, 0.5, 0.5,
-4.172019, -3, -5.907602, 1, -0.5, 0.5, 0.5,
-4.172019, -3, -5.907602, 1, 1.5, 0.5, 0.5,
-4.172019, -3, -5.907602, 0, 1.5, 0.5, 0.5,
-4.172019, -2, -5.907602, 0, -0.5, 0.5, 0.5,
-4.172019, -2, -5.907602, 1, -0.5, 0.5, 0.5,
-4.172019, -2, -5.907602, 1, 1.5, 0.5, 0.5,
-4.172019, -2, -5.907602, 0, 1.5, 0.5, 0.5,
-4.172019, -1, -5.907602, 0, -0.5, 0.5, 0.5,
-4.172019, -1, -5.907602, 1, -0.5, 0.5, 0.5,
-4.172019, -1, -5.907602, 1, 1.5, 0.5, 0.5,
-4.172019, -1, -5.907602, 0, 1.5, 0.5, 0.5,
-4.172019, 0, -5.907602, 0, -0.5, 0.5, 0.5,
-4.172019, 0, -5.907602, 1, -0.5, 0.5, 0.5,
-4.172019, 0, -5.907602, 1, 1.5, 0.5, 0.5,
-4.172019, 0, -5.907602, 0, 1.5, 0.5, 0.5,
-4.172019, 1, -5.907602, 0, -0.5, 0.5, 0.5,
-4.172019, 1, -5.907602, 1, -0.5, 0.5, 0.5,
-4.172019, 1, -5.907602, 1, 1.5, 0.5, 0.5,
-4.172019, 1, -5.907602, 0, 1.5, 0.5, 0.5,
-4.172019, 2, -5.907602, 0, -0.5, 0.5, 0.5,
-4.172019, 2, -5.907602, 1, -0.5, 0.5, 0.5,
-4.172019, 2, -5.907602, 1, 1.5, 0.5, 0.5,
-4.172019, 2, -5.907602, 0, 1.5, 0.5, 0.5,
-4.172019, 3, -5.907602, 0, -0.5, 0.5, 0.5,
-4.172019, 3, -5.907602, 1, -0.5, 0.5, 0.5,
-4.172019, 3, -5.907602, 1, 1.5, 0.5, 0.5,
-4.172019, 3, -5.907602, 0, 1.5, 0.5, 0.5
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
-3.601146, -3.250259, -4,
-3.601146, -3.250259, 4,
-3.601146, -3.250259, -4,
-3.791437, -3.415067, -4,
-3.601146, -3.250259, -2,
-3.791437, -3.415067, -2,
-3.601146, -3.250259, 0,
-3.791437, -3.415067, 0,
-3.601146, -3.250259, 2,
-3.791437, -3.415067, 2,
-3.601146, -3.250259, 4,
-3.791437, -3.415067, 4
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
-4.172019, -3.744682, -4, 0, -0.5, 0.5, 0.5,
-4.172019, -3.744682, -4, 1, -0.5, 0.5, 0.5,
-4.172019, -3.744682, -4, 1, 1.5, 0.5, 0.5,
-4.172019, -3.744682, -4, 0, 1.5, 0.5, 0.5,
-4.172019, -3.744682, -2, 0, -0.5, 0.5, 0.5,
-4.172019, -3.744682, -2, 1, -0.5, 0.5, 0.5,
-4.172019, -3.744682, -2, 1, 1.5, 0.5, 0.5,
-4.172019, -3.744682, -2, 0, 1.5, 0.5, 0.5,
-4.172019, -3.744682, 0, 0, -0.5, 0.5, 0.5,
-4.172019, -3.744682, 0, 1, -0.5, 0.5, 0.5,
-4.172019, -3.744682, 0, 1, 1.5, 0.5, 0.5,
-4.172019, -3.744682, 0, 0, 1.5, 0.5, 0.5,
-4.172019, -3.744682, 2, 0, -0.5, 0.5, 0.5,
-4.172019, -3.744682, 2, 1, -0.5, 0.5, 0.5,
-4.172019, -3.744682, 2, 1, 1.5, 0.5, 0.5,
-4.172019, -3.744682, 2, 0, 1.5, 0.5, 0.5,
-4.172019, -3.744682, 4, 0, -0.5, 0.5, 0.5,
-4.172019, -3.744682, 4, 1, -0.5, 0.5, 0.5,
-4.172019, -3.744682, 4, 1, 1.5, 0.5, 0.5,
-4.172019, -3.744682, 4, 0, 1.5, 0.5, 0.5
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
-3.601146, -3.250259, -5.087253,
-3.601146, 3.342044, -5.087253,
-3.601146, -3.250259, 5.850746,
-3.601146, 3.342044, 5.850746,
-3.601146, -3.250259, -5.087253,
-3.601146, -3.250259, 5.850746,
-3.601146, 3.342044, -5.087253,
-3.601146, 3.342044, 5.850746,
-3.601146, -3.250259, -5.087253,
4.010505, -3.250259, -5.087253,
-3.601146, -3.250259, 5.850746,
4.010505, -3.250259, 5.850746,
-3.601146, 3.342044, -5.087253,
4.010505, 3.342044, -5.087253,
-3.601146, 3.342044, 5.850746,
4.010505, 3.342044, 5.850746,
4.010505, -3.250259, -5.087253,
4.010505, 3.342044, -5.087253,
4.010505, -3.250259, 5.850746,
4.010505, 3.342044, 5.850746,
4.010505, -3.250259, -5.087253,
4.010505, -3.250259, 5.850746,
4.010505, 3.342044, -5.087253,
4.010505, 3.342044, 5.850746
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
var radius = 7.93883;
var distance = 35.32075;
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
mvMatrix.translate( -0.2046795, -0.04589224, -0.3817465 );
mvMatrix.scale( 1.127695, 1.302067, 0.7847522 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.32075);
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
acetonitrile<-read.table("acetonitrile.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-acetonitrile$V2
```

```
## Error in eval(expr, envir, enclos): object 'acetonitrile' not found
```

```r
y<-acetonitrile$V3
```

```
## Error in eval(expr, envir, enclos): object 'acetonitrile' not found
```

```r
z<-acetonitrile$V4
```

```
## Error in eval(expr, envir, enclos): object 'acetonitrile' not found
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
-3.490297, -0.4997711, -1.526248, 0, 0, 1, 1, 1,
-3.137551, 0.4708931, -1.136227, 1, 0, 0, 1, 1,
-3.080519, 0.2586037, -2.018423, 1, 0, 0, 1, 1,
-3.006167, 1.222435, -1.136276, 1, 0, 0, 1, 1,
-2.865095, 0.03672058, -0.5633752, 1, 0, 0, 1, 1,
-2.812957, -1.37057, -1.01039, 1, 0, 0, 1, 1,
-2.785238, -2.035116, -3.534063, 0, 0, 0, 1, 1,
-2.680719, 2.17206, -0.285177, 0, 0, 0, 1, 1,
-2.650028, 0.7056263, -0.08442552, 0, 0, 0, 1, 1,
-2.514143, 0.04138904, -1.108681, 0, 0, 0, 1, 1,
-2.512851, -0.7076823, -1.118604, 0, 0, 0, 1, 1,
-2.490616, -0.4379863, -2.406915, 0, 0, 0, 1, 1,
-2.444795, 0.6233174, -2.241611, 0, 0, 0, 1, 1,
-2.362642, 1.010928, -0.8972259, 1, 1, 1, 1, 1,
-2.355597, -1.334193, -1.183214, 1, 1, 1, 1, 1,
-2.325277, -0.2131804, -2.578872, 1, 1, 1, 1, 1,
-2.306907, 0.301716, -0.282197, 1, 1, 1, 1, 1,
-2.270529, -0.134122, -0.8300533, 1, 1, 1, 1, 1,
-2.256011, -1.016922, -1.949878, 1, 1, 1, 1, 1,
-2.232422, 1.149195, -1.614012, 1, 1, 1, 1, 1,
-2.221331, -0.7277762, -0.7519857, 1, 1, 1, 1, 1,
-2.198441, 1.845877, 0.1098648, 1, 1, 1, 1, 1,
-2.158267, 1.486178, -2.345681, 1, 1, 1, 1, 1,
-2.144012, 1.227778, 0.003976626, 1, 1, 1, 1, 1,
-2.14019, -0.157437, -3.129625, 1, 1, 1, 1, 1,
-2.113012, -0.213944, -1.648561, 1, 1, 1, 1, 1,
-2.110945, -0.09221113, 0.3526638, 1, 1, 1, 1, 1,
-2.110574, 2.156193, -1.914876, 1, 1, 1, 1, 1,
-2.098429, -0.343343, -0.172823, 0, 0, 1, 1, 1,
-2.076026, 1.330289, -2.613306, 1, 0, 0, 1, 1,
-2.026088, 0.5700646, -1.603513, 1, 0, 0, 1, 1,
-1.970642, -0.1749573, -2.352465, 1, 0, 0, 1, 1,
-1.967592, 0.9721295, 1.270865, 1, 0, 0, 1, 1,
-1.966566, -0.7953297, -2.64053, 1, 0, 0, 1, 1,
-1.96325, 0.536056, -1.654914, 0, 0, 0, 1, 1,
-1.962635, -0.529694, -1.253388, 0, 0, 0, 1, 1,
-1.956594, 0.008327837, -2.058865, 0, 0, 0, 1, 1,
-1.900011, 0.109365, -2.060633, 0, 0, 0, 1, 1,
-1.880246, -2.043271, -2.015687, 0, 0, 0, 1, 1,
-1.870059, -0.318328, -1.290851, 0, 0, 0, 1, 1,
-1.856465, -1.221903, -3.05264, 0, 0, 0, 1, 1,
-1.846563, 0.0543548, -1.148643, 1, 1, 1, 1, 1,
-1.846187, -1.685509, 0.3181741, 1, 1, 1, 1, 1,
-1.835455, -1.032036, -1.717864, 1, 1, 1, 1, 1,
-1.831058, -0.4994214, -3.928258, 1, 1, 1, 1, 1,
-1.820931, 1.507241, -3.016155, 1, 1, 1, 1, 1,
-1.79478, 1.634501, -1.384181, 1, 1, 1, 1, 1,
-1.784815, 0.7793162, -2.555112, 1, 1, 1, 1, 1,
-1.783358, -0.3051882, -1.816802, 1, 1, 1, 1, 1,
-1.768972, -0.8435445, -2.142081, 1, 1, 1, 1, 1,
-1.762212, -0.7480413, -1.669003, 1, 1, 1, 1, 1,
-1.714683, 0.7996296, -0.7126627, 1, 1, 1, 1, 1,
-1.708568, 1.8179, -0.1301319, 1, 1, 1, 1, 1,
-1.704272, 0.6241233, -1.63074, 1, 1, 1, 1, 1,
-1.697668, 1.284941, 1.976632, 1, 1, 1, 1, 1,
-1.694282, 1.665935, -2.899588, 1, 1, 1, 1, 1,
-1.693706, 0.2535535, -3.004129, 0, 0, 1, 1, 1,
-1.687259, -0.199116, -2.505958, 1, 0, 0, 1, 1,
-1.670998, 0.3764901, -1.615229, 1, 0, 0, 1, 1,
-1.666239, 1.112015, -2.407456, 1, 0, 0, 1, 1,
-1.648356, -0.3223794, -1.122448, 1, 0, 0, 1, 1,
-1.636869, -0.1111802, -0.7272338, 1, 0, 0, 1, 1,
-1.629753, 0.2765167, -1.0686, 0, 0, 0, 1, 1,
-1.628189, -1.436128, -1.961992, 0, 0, 0, 1, 1,
-1.626305, 0.482679, -1.362857, 0, 0, 0, 1, 1,
-1.619727, -0.6522476, -3.517076, 0, 0, 0, 1, 1,
-1.616871, 0.495734, -3.431849, 0, 0, 0, 1, 1,
-1.615985, 0.3691776, -1.311236, 0, 0, 0, 1, 1,
-1.61473, -0.02925671, -1.143508, 0, 0, 0, 1, 1,
-1.610813, -0.7697549, -1.854992, 1, 1, 1, 1, 1,
-1.601634, -0.123493, -1.014008, 1, 1, 1, 1, 1,
-1.591321, 0.9714928, -0.8930847, 1, 1, 1, 1, 1,
-1.587468, 0.03237146, -0.8198418, 1, 1, 1, 1, 1,
-1.58285, 0.4905407, -1.791205, 1, 1, 1, 1, 1,
-1.575631, 0.1125539, 0.3957002, 1, 1, 1, 1, 1,
-1.573184, 1.17615, -2.26104, 1, 1, 1, 1, 1,
-1.558122, 1.146393, 0.1389944, 1, 1, 1, 1, 1,
-1.546978, -0.2515526, -0.800179, 1, 1, 1, 1, 1,
-1.543031, -1.290639, -1.950234, 1, 1, 1, 1, 1,
-1.538633, -0.6337441, -3.758783, 1, 1, 1, 1, 1,
-1.511311, 0.4832992, -1.924881, 1, 1, 1, 1, 1,
-1.504166, 0.6014469, -0.4947523, 1, 1, 1, 1, 1,
-1.492034, 0.1709719, -2.589095, 1, 1, 1, 1, 1,
-1.491671, 0.4887926, -2.299845, 1, 1, 1, 1, 1,
-1.490282, -0.09025374, -1.50484, 0, 0, 1, 1, 1,
-1.476121, 0.7538279, 1.497662, 1, 0, 0, 1, 1,
-1.475728, 0.8065884, -1.576487, 1, 0, 0, 1, 1,
-1.460015, -0.1205405, -3.127248, 1, 0, 0, 1, 1,
-1.453185, -1.624446, -2.137203, 1, 0, 0, 1, 1,
-1.447004, 0.5229611, -2.457311, 1, 0, 0, 1, 1,
-1.443381, 0.5902113, -1.591206, 0, 0, 0, 1, 1,
-1.43884, -1.397334, -1.20702, 0, 0, 0, 1, 1,
-1.433541, -0.9324771, -3.199532, 0, 0, 0, 1, 1,
-1.431026, -2.523235, -2.503429, 0, 0, 0, 1, 1,
-1.424572, -0.108194, -1.507268, 0, 0, 0, 1, 1,
-1.411365, 1.325248, -0.8707911, 0, 0, 0, 1, 1,
-1.408002, 0.620639, -1.213806, 0, 0, 0, 1, 1,
-1.407905, -0.9335986, -2.297982, 1, 1, 1, 1, 1,
-1.405545, 0.2662369, -2.098055, 1, 1, 1, 1, 1,
-1.403711, -1.163127, -2.758358, 1, 1, 1, 1, 1,
-1.403659, 0.38484, -1.591461, 1, 1, 1, 1, 1,
-1.398291, 0.4349626, -2.377557, 1, 1, 1, 1, 1,
-1.398252, 1.710121, -1.030012, 1, 1, 1, 1, 1,
-1.397168, -0.9431712, -0.8621302, 1, 1, 1, 1, 1,
-1.390399, 0.9267334, -1.104637, 1, 1, 1, 1, 1,
-1.390081, -1.568272, -1.811407, 1, 1, 1, 1, 1,
-1.382513, -0.6829872, 0.7744098, 1, 1, 1, 1, 1,
-1.373188, 0.7084516, -0.8129024, 1, 1, 1, 1, 1,
-1.371079, 0.2168088, -1.39682, 1, 1, 1, 1, 1,
-1.368832, -1.72178, -2.467494, 1, 1, 1, 1, 1,
-1.364202, 1.083237, 1.008843, 1, 1, 1, 1, 1,
-1.361536, -0.118944, -2.652805, 1, 1, 1, 1, 1,
-1.354149, 0.2618903, -0.03508776, 0, 0, 1, 1, 1,
-1.344841, 1.51696, -0.6419992, 1, 0, 0, 1, 1,
-1.342705, -0.08948386, 0.91845, 1, 0, 0, 1, 1,
-1.338078, -0.7210308, -1.617307, 1, 0, 0, 1, 1,
-1.33251, 0.6071149, -1.363646, 1, 0, 0, 1, 1,
-1.327875, 2.554894, -1.434468, 1, 0, 0, 1, 1,
-1.315991, -0.1724349, -1.317886, 0, 0, 0, 1, 1,
-1.309006, -0.5508394, -2.88116, 0, 0, 0, 1, 1,
-1.297661, 0.5485873, -1.597386, 0, 0, 0, 1, 1,
-1.294074, -0.3438055, -0.6464172, 0, 0, 0, 1, 1,
-1.272871, -0.6758447, -2.452665, 0, 0, 0, 1, 1,
-1.251233, 0.791064, -2.595675, 0, 0, 0, 1, 1,
-1.246554, 0.09798153, -2.865379, 0, 0, 0, 1, 1,
-1.240946, -0.3488585, -3.732095, 1, 1, 1, 1, 1,
-1.238587, 0.2084266, -2.624373, 1, 1, 1, 1, 1,
-1.230121, 0.250135, -1.25998, 1, 1, 1, 1, 1,
-1.218877, 0.1472691, -1.390007, 1, 1, 1, 1, 1,
-1.213294, -1.15943, -3.584096, 1, 1, 1, 1, 1,
-1.209928, -0.08002909, -3.622977, 1, 1, 1, 1, 1,
-1.206067, 0.1162106, -2.256556, 1, 1, 1, 1, 1,
-1.205393, -0.5188954, -0.661647, 1, 1, 1, 1, 1,
-1.202491, -2.236663, -2.482552, 1, 1, 1, 1, 1,
-1.193895, 2.022741, 2.954799, 1, 1, 1, 1, 1,
-1.186639, -0.4792125, -2.906039, 1, 1, 1, 1, 1,
-1.185597, 0.2930773, -2.168237, 1, 1, 1, 1, 1,
-1.181892, -0.5680709, -2.278947, 1, 1, 1, 1, 1,
-1.170709, 0.4474235, -1.335716, 1, 1, 1, 1, 1,
-1.169327, 0.5306292, -0.383067, 1, 1, 1, 1, 1,
-1.168304, 0.4693344, -2.074605, 0, 0, 1, 1, 1,
-1.161984, 0.660497, 0.302649, 1, 0, 0, 1, 1,
-1.156237, -0.3778042, -3.189411, 1, 0, 0, 1, 1,
-1.153596, 1.155184, -0.03461712, 1, 0, 0, 1, 1,
-1.147373, 0.4855834, -0.7564606, 1, 0, 0, 1, 1,
-1.144041, -1.250539, -2.130556, 1, 0, 0, 1, 1,
-1.143305, 0.1444839, -1.171006, 0, 0, 0, 1, 1,
-1.134895, 1.839726, -0.3723639, 0, 0, 0, 1, 1,
-1.133983, 0.6682644, -2.271913, 0, 0, 0, 1, 1,
-1.12792, -0.3054747, -1.652473, 0, 0, 0, 1, 1,
-1.121676, -0.2466636, -0.4563828, 0, 0, 0, 1, 1,
-1.121155, -1.178527, -1.049717, 0, 0, 0, 1, 1,
-1.11639, -1.444931, -0.2459576, 0, 0, 0, 1, 1,
-1.11627, -0.2607324, -2.186788, 1, 1, 1, 1, 1,
-1.115709, 0.1875857, -2.573984, 1, 1, 1, 1, 1,
-1.113426, 0.5093604, -1.060726, 1, 1, 1, 1, 1,
-1.106911, 1.207542, 0.4928962, 1, 1, 1, 1, 1,
-1.103298, 0.02331642, -1.379526, 1, 1, 1, 1, 1,
-1.097606, -0.9415129, -2.19089, 1, 1, 1, 1, 1,
-1.091955, 0.7801492, -1.759314, 1, 1, 1, 1, 1,
-1.087871, 0.7511775, -1.413008, 1, 1, 1, 1, 1,
-1.077922, -0.4768906, -1.240455, 1, 1, 1, 1, 1,
-1.075756, -0.4891991, -1.658554, 1, 1, 1, 1, 1,
-1.057679, 1.878277, -0.3060192, 1, 1, 1, 1, 1,
-1.056411, 0.5417292, -1.711939, 1, 1, 1, 1, 1,
-1.052598, 0.0009654618, -1.774484, 1, 1, 1, 1, 1,
-1.039884, -0.2441267, 0.2079614, 1, 1, 1, 1, 1,
-1.032617, -0.9356616, -2.568544, 1, 1, 1, 1, 1,
-1.029028, -0.07174874, -0.2592287, 0, 0, 1, 1, 1,
-1.02772, 1.223266, -1.091994, 1, 0, 0, 1, 1,
-1.019326, 0.5169184, -2.205499, 1, 0, 0, 1, 1,
-1.015439, -0.910629, -1.470884, 1, 0, 0, 1, 1,
-1.0148, 0.7992618, -2.032648, 1, 0, 0, 1, 1,
-1.003746, 0.8158872, -3.947041, 1, 0, 0, 1, 1,
-1.001009, 0.558989, -1.270075, 0, 0, 0, 1, 1,
-0.9978966, 0.231024, -2.449895, 0, 0, 0, 1, 1,
-0.9971365, 1.014681, 0.2213349, 0, 0, 0, 1, 1,
-0.9934562, -0.5863751, -1.654316, 0, 0, 0, 1, 1,
-0.9864573, -1.215123, -2.976364, 0, 0, 0, 1, 1,
-0.9810716, -0.4234203, -0.9106666, 0, 0, 0, 1, 1,
-0.9803636, -0.9742164, -3.516193, 0, 0, 0, 1, 1,
-0.9755574, -1.014141, -1.09737, 1, 1, 1, 1, 1,
-0.9724854, -0.9730687, -1.497862, 1, 1, 1, 1, 1,
-0.9705917, 0.04355508, -1.519149, 1, 1, 1, 1, 1,
-0.9645019, 0.1075246, -2.123315, 1, 1, 1, 1, 1,
-0.95997, 1.55645, 0.1517333, 1, 1, 1, 1, 1,
-0.9549158, 0.04496561, -0.507023, 1, 1, 1, 1, 1,
-0.9475862, -0.6703524, -1.963479, 1, 1, 1, 1, 1,
-0.9396869, -0.2850918, -0.9795583, 1, 1, 1, 1, 1,
-0.9361299, 0.5140489, -1.896028, 1, 1, 1, 1, 1,
-0.9316572, -0.09924834, -1.061299, 1, 1, 1, 1, 1,
-0.9198915, -0.8964388, -1.427031, 1, 1, 1, 1, 1,
-0.9194677, 0.09837481, -2.945231, 1, 1, 1, 1, 1,
-0.9180645, 1.084375, 0.2196041, 1, 1, 1, 1, 1,
-0.9050406, 1.194388, -2.114702, 1, 1, 1, 1, 1,
-0.9027727, 0.7104204, -1.225801, 1, 1, 1, 1, 1,
-0.9015752, 0.5314578, -1.863829, 0, 0, 1, 1, 1,
-0.8988883, -0.5406668, -0.6529546, 1, 0, 0, 1, 1,
-0.8974807, 2.094465, 0.186617, 1, 0, 0, 1, 1,
-0.8787951, 0.5457738, -0.8039662, 1, 0, 0, 1, 1,
-0.8763964, -0.009636222, -0.5680859, 1, 0, 0, 1, 1,
-0.8750504, -0.5272675, -2.008705, 1, 0, 0, 1, 1,
-0.8716173, 1.842885, -0.2023617, 0, 0, 0, 1, 1,
-0.8533369, 1.142697, -0.7764505, 0, 0, 0, 1, 1,
-0.8457929, 1.411278, -1.904024, 0, 0, 0, 1, 1,
-0.8449792, -0.5245164, -1.808134, 0, 0, 0, 1, 1,
-0.8418291, -0.4488687, 0.959821, 0, 0, 0, 1, 1,
-0.8414228, -0.0360389, -2.72863, 0, 0, 0, 1, 1,
-0.8380759, -0.05085796, -1.893988, 0, 0, 0, 1, 1,
-0.8343996, 1.180472, -1.247831, 1, 1, 1, 1, 1,
-0.8323701, 1.917707, -0.5708423, 1, 1, 1, 1, 1,
-0.831733, 0.8785118, -1.129484, 1, 1, 1, 1, 1,
-0.8277212, 0.9346601, -1.364183, 1, 1, 1, 1, 1,
-0.8251816, 1.232223, -0.3714336, 1, 1, 1, 1, 1,
-0.8249073, 1.278181, 0.4065034, 1, 1, 1, 1, 1,
-0.8199428, -0.5747639, -2.654835, 1, 1, 1, 1, 1,
-0.8172762, 1.216442, 0.3118657, 1, 1, 1, 1, 1,
-0.8050088, 0.1777354, -0.5307866, 1, 1, 1, 1, 1,
-0.8034407, -0.2941684, -1.628468, 1, 1, 1, 1, 1,
-0.8004412, -0.05447818, -1.957819, 1, 1, 1, 1, 1,
-0.7990438, -0.8822574, -2.765815, 1, 1, 1, 1, 1,
-0.7948802, -0.3637605, -2.539177, 1, 1, 1, 1, 1,
-0.7919294, -0.8407342, -1.86306, 1, 1, 1, 1, 1,
-0.7901543, -1.634628, -2.230208, 1, 1, 1, 1, 1,
-0.7838185, -0.288075, -1.786679, 0, 0, 1, 1, 1,
-0.7833233, 0.902081, -1.335125, 1, 0, 0, 1, 1,
-0.7765655, -0.2640063, -2.052499, 1, 0, 0, 1, 1,
-0.7761329, -0.9787433, -1.462576, 1, 0, 0, 1, 1,
-0.7759931, -0.4133419, -0.2304514, 1, 0, 0, 1, 1,
-0.7708169, 1.161087, -1.319012, 1, 0, 0, 1, 1,
-0.7706212, -0.7010171, -0.9947737, 0, 0, 0, 1, 1,
-0.767797, 0.8974253, -2.469337, 0, 0, 0, 1, 1,
-0.7669045, -1.014548, -2.996693, 0, 0, 0, 1, 1,
-0.7655714, 0.831174, -0.8475264, 0, 0, 0, 1, 1,
-0.7650171, 0.2396774, -1.756865, 0, 0, 0, 1, 1,
-0.7646067, -0.1491939, -2.90502, 0, 0, 0, 1, 1,
-0.763314, 0.05791233, -1.016785, 0, 0, 0, 1, 1,
-0.7600104, 0.1463604, -1.409589, 1, 1, 1, 1, 1,
-0.7558032, -0.1270729, -1.522381, 1, 1, 1, 1, 1,
-0.7507109, 1.244857, 0.08635917, 1, 1, 1, 1, 1,
-0.7416876, 1.54418, -2.607632, 1, 1, 1, 1, 1,
-0.726994, -0.4704132, -2.804206, 1, 1, 1, 1, 1,
-0.724777, 0.6180511, -0.1662452, 1, 1, 1, 1, 1,
-0.7137707, 1.18861, 0.06189536, 1, 1, 1, 1, 1,
-0.7118081, 1.167294, 0.9124493, 1, 1, 1, 1, 1,
-0.7065979, 0.1050009, -2.71272, 1, 1, 1, 1, 1,
-0.7039564, 1.000655, 0.05745852, 1, 1, 1, 1, 1,
-0.6995108, -1.199156, -2.429744, 1, 1, 1, 1, 1,
-0.6959327, -0.4358886, -2.826244, 1, 1, 1, 1, 1,
-0.6916623, 1.168334, -2.258862, 1, 1, 1, 1, 1,
-0.6882294, 0.1760788, -1.070292, 1, 1, 1, 1, 1,
-0.682314, -0.5675948, -1.092982, 1, 1, 1, 1, 1,
-0.6811022, 0.2264723, -1.828785, 0, 0, 1, 1, 1,
-0.6790989, 2.393257, 0.1445235, 1, 0, 0, 1, 1,
-0.6755434, -0.8646553, -2.906126, 1, 0, 0, 1, 1,
-0.675429, 0.3980242, -1.908114, 1, 0, 0, 1, 1,
-0.6742869, -0.2078663, -1.47551, 1, 0, 0, 1, 1,
-0.6741078, 0.6873425, -0.2350499, 1, 0, 0, 1, 1,
-0.663064, -0.2984944, -1.346665, 0, 0, 0, 1, 1,
-0.6621401, -0.07889231, -1.453942, 0, 0, 0, 1, 1,
-0.660571, 1.903773, 0.09081133, 0, 0, 0, 1, 1,
-0.6578733, -0.9128484, -3.333522, 0, 0, 0, 1, 1,
-0.6567546, -0.007852985, 0.8130992, 0, 0, 0, 1, 1,
-0.6556666, -0.04556454, -1.718714, 0, 0, 0, 1, 1,
-0.6529629, 0.1663761, -2.25501, 0, 0, 0, 1, 1,
-0.6469992, -0.803727, -1.660113, 1, 1, 1, 1, 1,
-0.6402295, 0.8609713, 0.9424883, 1, 1, 1, 1, 1,
-0.6369497, -1.384797, -3.967495, 1, 1, 1, 1, 1,
-0.636384, -0.7207461, -2.385042, 1, 1, 1, 1, 1,
-0.636001, 0.1738583, -0.7014432, 1, 1, 1, 1, 1,
-0.6348301, 0.8205886, 0.9199489, 1, 1, 1, 1, 1,
-0.6343746, 0.1802611, 1.041995, 1, 1, 1, 1, 1,
-0.6307215, -0.145028, -2.141133, 1, 1, 1, 1, 1,
-0.6267601, 0.8558875, -0.1398138, 1, 1, 1, 1, 1,
-0.6225194, -1.337576, -3.566948, 1, 1, 1, 1, 1,
-0.6221676, -1.380264, -2.709277, 1, 1, 1, 1, 1,
-0.6189381, 1.181076, -0.2450203, 1, 1, 1, 1, 1,
-0.6173043, 0.9405675, -0.03229418, 1, 1, 1, 1, 1,
-0.6089541, 0.05071773, -2.027532, 1, 1, 1, 1, 1,
-0.6084924, 0.3917505, -0.6852264, 1, 1, 1, 1, 1,
-0.6070548, 0.0692869, -1.500111, 0, 0, 1, 1, 1,
-0.6034898, -1.230207, -0.872772, 1, 0, 0, 1, 1,
-0.6026793, -0.5455962, -2.383324, 1, 0, 0, 1, 1,
-0.6024649, -0.3386114, -3.104393, 1, 0, 0, 1, 1,
-0.59694, -0.7718085, -1.818414, 1, 0, 0, 1, 1,
-0.5946619, -0.2710851, -1.773265, 1, 0, 0, 1, 1,
-0.5912517, -0.5452383, -0.5358686, 0, 0, 0, 1, 1,
-0.5845287, -1.250503, -2.863633, 0, 0, 0, 1, 1,
-0.5841227, 0.8702528, -2.064733, 0, 0, 0, 1, 1,
-0.5807099, -1.318815, -3.180958, 0, 0, 0, 1, 1,
-0.5800204, -0.7274206, -2.172928, 0, 0, 0, 1, 1,
-0.5787691, 0.02061593, -2.51018, 0, 0, 0, 1, 1,
-0.5769234, 0.7403317, 1.721992, 0, 0, 0, 1, 1,
-0.5754314, -1.398888, -0.678057, 1, 1, 1, 1, 1,
-0.5736696, -3.154255, -4.767177, 1, 1, 1, 1, 1,
-0.5694251, 1.686406, -0.5021798, 1, 1, 1, 1, 1,
-0.5683348, 1.897955, -1.071523, 1, 1, 1, 1, 1,
-0.5668697, -0.3894071, -2.027824, 1, 1, 1, 1, 1,
-0.56215, -1.605442, -3.290381, 1, 1, 1, 1, 1,
-0.5595057, -0.8237492, -1.85189, 1, 1, 1, 1, 1,
-0.5594274, -2.01582, -2.844242, 1, 1, 1, 1, 1,
-0.5457165, 0.4486395, 0.06256569, 1, 1, 1, 1, 1,
-0.5367234, -1.119103, -3.727465, 1, 1, 1, 1, 1,
-0.5347145, -0.09126584, -3.045968, 1, 1, 1, 1, 1,
-0.5302944, 2.455425, -1.486507, 1, 1, 1, 1, 1,
-0.5291848, 0.3876566, -1.136886, 1, 1, 1, 1, 1,
-0.523845, 0.03994763, 0.796333, 1, 1, 1, 1, 1,
-0.522876, 0.7898657, -1.936407, 1, 1, 1, 1, 1,
-0.5188679, 0.923092, -0.5370088, 0, 0, 1, 1, 1,
-0.5187858, 0.03552296, -0.6606392, 1, 0, 0, 1, 1,
-0.5177784, 0.3152007, -1.196009, 1, 0, 0, 1, 1,
-0.5171556, 0.9318835, -1.54129, 1, 0, 0, 1, 1,
-0.5149958, -0.6873152, -1.967032, 1, 0, 0, 1, 1,
-0.511299, -1.909798, -3.775916, 1, 0, 0, 1, 1,
-0.5102459, -0.05220921, -1.588912, 0, 0, 0, 1, 1,
-0.5065586, -1.206581, -3.217979, 0, 0, 0, 1, 1,
-0.5061531, 0.2447317, -1.826347, 0, 0, 0, 1, 1,
-0.5052399, 2.790709, 0.2168982, 0, 0, 0, 1, 1,
-0.5048105, -0.9783818, -3.663542, 0, 0, 0, 1, 1,
-0.5025939, -0.03061344, -1.421206, 0, 0, 0, 1, 1,
-0.5003092, 0.3189216, -1.843514, 0, 0, 0, 1, 1,
-0.4907774, -1.442532, -1.621649, 1, 1, 1, 1, 1,
-0.4892242, -0.5041487, -3.65424, 1, 1, 1, 1, 1,
-0.4884496, -1.005412, -4.593419, 1, 1, 1, 1, 1,
-0.4814817, -1.185006, -2.349489, 1, 1, 1, 1, 1,
-0.4808787, -0.7171324, -4.420133, 1, 1, 1, 1, 1,
-0.4745059, -1.466712, -1.914363, 1, 1, 1, 1, 1,
-0.4740499, -0.1151764, -1.845129, 1, 1, 1, 1, 1,
-0.4646954, -0.8430894, -2.887696, 1, 1, 1, 1, 1,
-0.4618661, -0.9235163, -1.386502, 1, 1, 1, 1, 1,
-0.4613749, 0.5872654, 0.3008978, 1, 1, 1, 1, 1,
-0.4574879, -0.5298766, -2.019303, 1, 1, 1, 1, 1,
-0.4566064, -0.4526434, -2.463803, 1, 1, 1, 1, 1,
-0.4558046, 0.5669928, -0.5257596, 1, 1, 1, 1, 1,
-0.4526661, 1.316794, 0.05716318, 1, 1, 1, 1, 1,
-0.4488185, 0.2884754, 0.09621102, 1, 1, 1, 1, 1,
-0.4400014, -1.101158, -1.867181, 0, 0, 1, 1, 1,
-0.4397992, 0.1527653, -2.022472, 1, 0, 0, 1, 1,
-0.4376624, -1.169833, -3.66437, 1, 0, 0, 1, 1,
-0.4356311, 1.596515, -1.906929, 1, 0, 0, 1, 1,
-0.4206747, 1.876733, -1.096776, 1, 0, 0, 1, 1,
-0.4205783, -1.677422, -1.970303, 1, 0, 0, 1, 1,
-0.4204106, 0.8681228, -0.595858, 0, 0, 0, 1, 1,
-0.4198718, -0.8392212, -2.656123, 0, 0, 0, 1, 1,
-0.4189096, -0.1084633, -2.570025, 0, 0, 0, 1, 1,
-0.4162547, 1.538659, -2.970035, 0, 0, 0, 1, 1,
-0.4100736, 0.5586678, -1.675897, 0, 0, 0, 1, 1,
-0.4070488, 0.4370078, -0.3735184, 0, 0, 0, 1, 1,
-0.4069243, -0.369932, -2.04797, 0, 0, 0, 1, 1,
-0.4064002, -0.2843579, -1.658195, 1, 1, 1, 1, 1,
-0.4035614, -0.8443677, -2.963583, 1, 1, 1, 1, 1,
-0.4034258, -1.782909, -3.73892, 1, 1, 1, 1, 1,
-0.3984876, -0.01621275, 0.9352965, 1, 1, 1, 1, 1,
-0.398017, 1.035526, -1.924529, 1, 1, 1, 1, 1,
-0.3973672, 0.6801242, -1.285769, 1, 1, 1, 1, 1,
-0.3952353, -0.5951083, -2.812632, 1, 1, 1, 1, 1,
-0.3945731, 0.1323476, -1.420557, 1, 1, 1, 1, 1,
-0.3905265, -0.3623191, -1.102702, 1, 1, 1, 1, 1,
-0.3840738, -0.0359862, -2.411419, 1, 1, 1, 1, 1,
-0.3788874, -0.5713052, -1.849588, 1, 1, 1, 1, 1,
-0.376849, 1.519427, 0.8652492, 1, 1, 1, 1, 1,
-0.376842, -0.07199559, -1.545153, 1, 1, 1, 1, 1,
-0.3725096, -1.435392, -2.696479, 1, 1, 1, 1, 1,
-0.3717708, 0.6888483, -0.3755337, 1, 1, 1, 1, 1,
-0.3717615, 1.266534, -0.624299, 0, 0, 1, 1, 1,
-0.3699944, 0.6715681, -0.5021298, 1, 0, 0, 1, 1,
-0.3691682, 0.3785945, -2.853215, 1, 0, 0, 1, 1,
-0.3677529, -0.8836572, -1.633054, 1, 0, 0, 1, 1,
-0.3665091, 1.648015, 2.326921, 1, 0, 0, 1, 1,
-0.3659449, -0.9501877, -2.460697, 1, 0, 0, 1, 1,
-0.3634784, 1.275016, -1.003601, 0, 0, 0, 1, 1,
-0.3624353, -0.4049481, -0.5040237, 0, 0, 0, 1, 1,
-0.3622364, 0.6198688, 2.280733, 0, 0, 0, 1, 1,
-0.3594061, -0.6691077, -2.571953, 0, 0, 0, 1, 1,
-0.355735, -0.242432, -2.744422, 0, 0, 0, 1, 1,
-0.3520613, 0.4922368, -2.83384, 0, 0, 0, 1, 1,
-0.3494336, 1.680818, 0.1877586, 0, 0, 0, 1, 1,
-0.3489407, 0.8085034, 1.132917, 1, 1, 1, 1, 1,
-0.3438262, -0.07846166, -3.416915, 1, 1, 1, 1, 1,
-0.3408414, 0.341636, -1.255259, 1, 1, 1, 1, 1,
-0.3403446, -2.388635, -1.738612, 1, 1, 1, 1, 1,
-0.340117, -0.5524791, -1.825947, 1, 1, 1, 1, 1,
-0.339596, 0.4414167, 1.677935, 1, 1, 1, 1, 1,
-0.336817, 0.7499035, -0.566089, 1, 1, 1, 1, 1,
-0.3360865, -0.7881802, -2.12587, 1, 1, 1, 1, 1,
-0.3358079, -0.672133, -3.422029, 1, 1, 1, 1, 1,
-0.3357201, -0.4575624, -2.825463, 1, 1, 1, 1, 1,
-0.3352897, 1.633766, -0.4408631, 1, 1, 1, 1, 1,
-0.3342105, 0.6220282, -0.331365, 1, 1, 1, 1, 1,
-0.3334102, -0.5814229, -2.654315, 1, 1, 1, 1, 1,
-0.3317451, -1.516321, -2.84692, 1, 1, 1, 1, 1,
-0.3317082, -1.077789, -3.258647, 1, 1, 1, 1, 1,
-0.3313037, -0.9918171, -3.428229, 0, 0, 1, 1, 1,
-0.3312744, -0.9114015, -1.224927, 1, 0, 0, 1, 1,
-0.3267871, -0.6769062, -4.299462, 1, 0, 0, 1, 1,
-0.3262887, 0.1229003, -0.5708576, 1, 0, 0, 1, 1,
-0.3226528, 0.9521628, 0.3351092, 1, 0, 0, 1, 1,
-0.3216409, -2.236747, -4.927961, 1, 0, 0, 1, 1,
-0.3179263, -1.951427, -3.933298, 0, 0, 0, 1, 1,
-0.3132442, -0.5760788, -3.83539, 0, 0, 0, 1, 1,
-0.3117175, -0.2290053, -0.8575121, 0, 0, 0, 1, 1,
-0.3097263, 0.788368, -2.332218, 0, 0, 0, 1, 1,
-0.30711, 1.65755, -0.7994792, 0, 0, 0, 1, 1,
-0.3000755, 1.127495, -0.6180078, 0, 0, 0, 1, 1,
-0.2981962, -0.2691162, -2.048908, 0, 0, 0, 1, 1,
-0.2911758, 0.3920365, -1.336668, 1, 1, 1, 1, 1,
-0.285605, 1.698416, -1.709446, 1, 1, 1, 1, 1,
-0.2837833, 0.6759999, -0.1426957, 1, 1, 1, 1, 1,
-0.2823592, -0.2105431, -3.106767, 1, 1, 1, 1, 1,
-0.2817117, 0.9621888, -0.5404326, 1, 1, 1, 1, 1,
-0.2709661, -0.2806878, -3.203364, 1, 1, 1, 1, 1,
-0.2707409, -0.4594588, -3.652776, 1, 1, 1, 1, 1,
-0.2692403, 0.0736467, -0.221029, 1, 1, 1, 1, 1,
-0.2687588, 0.2244542, 0.5618669, 1, 1, 1, 1, 1,
-0.2640094, -2.026743, -2.39711, 1, 1, 1, 1, 1,
-0.2602509, -0.03517231, -0.6001946, 1, 1, 1, 1, 1,
-0.2602108, 0.1878348, 0.1137355, 1, 1, 1, 1, 1,
-0.2561964, -1.078758, -3.401452, 1, 1, 1, 1, 1,
-0.253837, -0.03775405, -0.5727716, 1, 1, 1, 1, 1,
-0.250601, -0.2214633, -3.714411, 1, 1, 1, 1, 1,
-0.2483378, -1.539724, -1.58937, 0, 0, 1, 1, 1,
-0.2481738, -0.9092429, -3.037016, 1, 0, 0, 1, 1,
-0.2437006, 0.3487288, -0.9390323, 1, 0, 0, 1, 1,
-0.2423994, 0.9161927, -0.4618345, 1, 0, 0, 1, 1,
-0.2411096, -0.6872996, -4.260693, 1, 0, 0, 1, 1,
-0.2376463, 2.522281, 0.1437979, 1, 0, 0, 1, 1,
-0.2334675, 0.01082467, -0.07420721, 0, 0, 0, 1, 1,
-0.2324748, -1.20925, -4.460165, 0, 0, 0, 1, 1,
-0.2312767, -0.09435816, -1.529691, 0, 0, 0, 1, 1,
-0.2308747, 0.1606359, -2.594764, 0, 0, 0, 1, 1,
-0.2288361, -1.397403, -1.692052, 0, 0, 0, 1, 1,
-0.2274829, -0.04520449, -1.48335, 0, 0, 0, 1, 1,
-0.2273537, -0.6301207, -2.971863, 0, 0, 0, 1, 1,
-0.2266375, -1.257507, -2.588877, 1, 1, 1, 1, 1,
-0.2194653, -0.6645473, -2.615875, 1, 1, 1, 1, 1,
-0.2174865, 0.2810375, -0.9404342, 1, 1, 1, 1, 1,
-0.2140904, -0.1889123, -1.768459, 1, 1, 1, 1, 1,
-0.2132149, 0.2940075, -0.2095639, 1, 1, 1, 1, 1,
-0.20934, 0.8001202, 1.031357, 1, 1, 1, 1, 1,
-0.2006967, -1.483329, -2.711937, 1, 1, 1, 1, 1,
-0.2001029, -1.996136, -2.361759, 1, 1, 1, 1, 1,
-0.1996397, 0.547587, -0.9248556, 1, 1, 1, 1, 1,
-0.1993112, 0.1661699, -1.302169, 1, 1, 1, 1, 1,
-0.195289, -0.5387535, -2.65835, 1, 1, 1, 1, 1,
-0.1928601, -0.2603006, -2.34803, 1, 1, 1, 1, 1,
-0.189832, 0.859111, -0.6990061, 1, 1, 1, 1, 1,
-0.1892035, -1.440012, -2.83196, 1, 1, 1, 1, 1,
-0.1887598, -0.637885, -3.209466, 1, 1, 1, 1, 1,
-0.1873446, -1.981794, -3.176188, 0, 0, 1, 1, 1,
-0.1818222, 1.758084, -1.022229, 1, 0, 0, 1, 1,
-0.1763109, 0.2959675, 0.02531995, 1, 0, 0, 1, 1,
-0.1725291, 0.9071218, -0.3652982, 1, 0, 0, 1, 1,
-0.1624943, -0.4638063, -2.858183, 1, 0, 0, 1, 1,
-0.1588074, 1.391305, -0.6102564, 1, 0, 0, 1, 1,
-0.1465814, 1.111434, -1.437063, 0, 0, 0, 1, 1,
-0.1456419, -1.447794, -3.68192, 0, 0, 0, 1, 1,
-0.1426633, 0.05537479, 0.3140336, 0, 0, 0, 1, 1,
-0.1332952, 2.02118, -0.42825, 0, 0, 0, 1, 1,
-0.1313546, -0.3050209, -4.762943, 0, 0, 0, 1, 1,
-0.1285674, 0.6684337, 1.364046, 0, 0, 0, 1, 1,
-0.1282072, 2.082714, 0.019903, 0, 0, 0, 1, 1,
-0.1280367, -0.2346352, -2.064646, 1, 1, 1, 1, 1,
-0.1276046, -0.203671, -3.500441, 1, 1, 1, 1, 1,
-0.1243532, 0.04232535, -0.944492, 1, 1, 1, 1, 1,
-0.1241766, 0.7350366, -0.9482695, 1, 1, 1, 1, 1,
-0.1217272, 0.2559443, -0.1396165, 1, 1, 1, 1, 1,
-0.1150066, 0.4274012, 1.287308, 1, 1, 1, 1, 1,
-0.114798, -1.40957, -2.765098, 1, 1, 1, 1, 1,
-0.1134535, 0.7940153, -0.01792799, 1, 1, 1, 1, 1,
-0.1111158, 0.4808879, 0.3582971, 1, 1, 1, 1, 1,
-0.1087889, -1.126796, -3.398351, 1, 1, 1, 1, 1,
-0.1069116, -1.511866, -2.679808, 1, 1, 1, 1, 1,
-0.09990768, -1.38154, -2.942465, 1, 1, 1, 1, 1,
-0.09804795, -1.435097, -1.945251, 1, 1, 1, 1, 1,
-0.09700032, -0.6864858, -4.719001, 1, 1, 1, 1, 1,
-0.09444904, 0.819039, -0.1366276, 1, 1, 1, 1, 1,
-0.09227259, 0.2109884, -1.90066, 0, 0, 1, 1, 1,
-0.09221591, -1.154694, -3.758475, 1, 0, 0, 1, 1,
-0.09124404, 0.3873938, 0.2912332, 1, 0, 0, 1, 1,
-0.08865104, 0.6727839, 3.111518, 1, 0, 0, 1, 1,
-0.08613206, -0.240797, -3.752427, 1, 0, 0, 1, 1,
-0.08299748, 0.2556579, 1.220942, 1, 0, 0, 1, 1,
-0.07612845, -0.1218905, -1.283615, 0, 0, 0, 1, 1,
-0.07296193, 1.65701, -1.127794, 0, 0, 0, 1, 1,
-0.07260089, -0.3049035, -4.00532, 0, 0, 0, 1, 1,
-0.07069067, -1.063393, -2.754241, 0, 0, 0, 1, 1,
-0.07032455, -0.3485292, -2.346509, 0, 0, 0, 1, 1,
-0.06216985, -1.464751, -3.652579, 0, 0, 0, 1, 1,
-0.06072678, 1.756803, -0.8619205, 0, 0, 0, 1, 1,
-0.0599398, -0.4294262, -2.23791, 1, 1, 1, 1, 1,
-0.04919619, 1.046914, 1.305555, 1, 1, 1, 1, 1,
-0.04731682, 1.552251, 0.2063444, 1, 1, 1, 1, 1,
-0.04525763, -0.1384166, -2.31231, 1, 1, 1, 1, 1,
-0.04215214, 0.2375698, -0.6771418, 1, 1, 1, 1, 1,
-0.04186035, 1.086088, -0.6715472, 1, 1, 1, 1, 1,
-0.04132322, 0.7822041, 0.6529534, 1, 1, 1, 1, 1,
-0.04108294, -0.4794629, -2.279258, 1, 1, 1, 1, 1,
-0.03637448, -1.442191, -1.450526, 1, 1, 1, 1, 1,
-0.0361913, 1.247887, -0.3196074, 1, 1, 1, 1, 1,
-0.03457082, 0.6065888, -0.5404092, 1, 1, 1, 1, 1,
-0.03403012, 0.4620076, -1.498108, 1, 1, 1, 1, 1,
-0.03335804, -2.890769, -3.496943, 1, 1, 1, 1, 1,
-0.03019917, 0.5095333, 0.3072881, 1, 1, 1, 1, 1,
-0.0277522, -0.8191074, -4.477421, 1, 1, 1, 1, 1,
-0.02565972, -0.2633203, -4.677341, 0, 0, 1, 1, 1,
-0.01815723, -1.427298, -2.28935, 1, 0, 0, 1, 1,
-0.007373249, 0.2116191, -0.4078583, 1, 0, 0, 1, 1,
-0.005517303, 1.692638, 0.3943897, 1, 0, 0, 1, 1,
-0.005159128, -0.9528438, -4.624068, 1, 0, 0, 1, 1,
-0.004232828, -1.959496, -3.498828, 1, 0, 0, 1, 1,
-0.001830124, -0.0950048, -3.523026, 0, 0, 0, 1, 1,
0.003166862, 0.03484164, 0.05507426, 0, 0, 0, 1, 1,
0.009172148, -0.2981447, 0.6210755, 0, 0, 0, 1, 1,
0.01824032, 1.771384, 0.5329666, 0, 0, 0, 1, 1,
0.03015737, -0.05641536, 1.468799, 0, 0, 0, 1, 1,
0.0320261, 1.341533, -1.632688, 0, 0, 0, 1, 1,
0.03266412, -1.001251, 2.739928, 0, 0, 0, 1, 1,
0.0345365, -0.8018115, 0.2703447, 1, 1, 1, 1, 1,
0.03819128, 2.501127, -0.002704513, 1, 1, 1, 1, 1,
0.04360931, 0.7574164, -1.101204, 1, 1, 1, 1, 1,
0.04650119, -1.307537, 3.304463, 1, 1, 1, 1, 1,
0.0470355, -1.760763, 3.691253, 1, 1, 1, 1, 1,
0.05009142, 0.1133468, 0.4166383, 1, 1, 1, 1, 1,
0.05170995, 1.172192, -0.8804076, 1, 1, 1, 1, 1,
0.0560429, -0.6053757, 0.7313729, 1, 1, 1, 1, 1,
0.05729626, 0.8658139, 0.08868148, 1, 1, 1, 1, 1,
0.0581513, 0.04389164, 1.800739, 1, 1, 1, 1, 1,
0.05996205, 0.3192753, -0.3549269, 1, 1, 1, 1, 1,
0.06011717, 0.6280969, 0.1998288, 1, 1, 1, 1, 1,
0.06174483, -0.5193455, 4.324254, 1, 1, 1, 1, 1,
0.06186911, 2.013346, 0.1018679, 1, 1, 1, 1, 1,
0.06641006, 0.6254472, 0.8345563, 1, 1, 1, 1, 1,
0.07247308, 1.291619, -1.025698, 0, 0, 1, 1, 1,
0.07376349, -0.4365545, 3.339793, 1, 0, 0, 1, 1,
0.0779458, 1.383762, 1.229759, 1, 0, 0, 1, 1,
0.0823425, 0.9616885, 0.3017215, 1, 0, 0, 1, 1,
0.08243497, -1.856891, 5.021911, 1, 0, 0, 1, 1,
0.08441357, 0.08254746, 2.973226, 1, 0, 0, 1, 1,
0.08868828, -1.349914, 2.080323, 0, 0, 0, 1, 1,
0.08941157, -0.3355054, 3.315666, 0, 0, 0, 1, 1,
0.0918994, -0.3952639, 2.709263, 0, 0, 0, 1, 1,
0.09213265, -1.498098, 2.813945, 0, 0, 0, 1, 1,
0.09380636, 0.4602361, 0.2826272, 0, 0, 0, 1, 1,
0.09439049, 0.3631659, -0.3200886, 0, 0, 0, 1, 1,
0.09529486, -0.1874171, 2.958305, 0, 0, 0, 1, 1,
0.09766944, 1.240954, 0.681383, 1, 1, 1, 1, 1,
0.10042, 0.01639734, 0.8758023, 1, 1, 1, 1, 1,
0.1054698, -1.246557, 3.610953, 1, 1, 1, 1, 1,
0.1063354, -0.6619117, 4.615789, 1, 1, 1, 1, 1,
0.1070785, -0.6577032, 3.226385, 1, 1, 1, 1, 1,
0.1095805, -1.475351, 3.409695, 1, 1, 1, 1, 1,
0.1114841, -1.952799, 3.608691, 1, 1, 1, 1, 1,
0.1137556, 0.03271167, 1.346521, 1, 1, 1, 1, 1,
0.1155002, -0.7951117, 4.079596, 1, 1, 1, 1, 1,
0.1162168, 0.05057446, 2.985566, 1, 1, 1, 1, 1,
0.1171401, 1.191569, -0.3189478, 1, 1, 1, 1, 1,
0.1183113, -1.382589, 2.99958, 1, 1, 1, 1, 1,
0.1239702, -1.98034, 3.404988, 1, 1, 1, 1, 1,
0.1240845, -1.328672, 0.8052836, 1, 1, 1, 1, 1,
0.1249194, 0.7423255, -0.5810942, 1, 1, 1, 1, 1,
0.1268847, -0.6148731, 1.057593, 0, 0, 1, 1, 1,
0.1270654, -0.4942805, 2.73366, 1, 0, 0, 1, 1,
0.1284561, -0.5365761, 1.716381, 1, 0, 0, 1, 1,
0.1308623, 0.8064959, -0.2792118, 1, 0, 0, 1, 1,
0.1356026, -1.158744, 3.912216, 1, 0, 0, 1, 1,
0.1368325, 0.007201146, 0.1016023, 1, 0, 0, 1, 1,
0.1389303, 0.2477237, -0.162707, 0, 0, 0, 1, 1,
0.1412176, 0.7482765, 0.8486369, 0, 0, 0, 1, 1,
0.1435031, 0.2287977, -0.9888381, 0, 0, 0, 1, 1,
0.1532278, 0.03078307, 3.067683, 0, 0, 0, 1, 1,
0.1538602, 1.081493, 1.895858, 0, 0, 0, 1, 1,
0.1642068, -0.5566554, 3.063777, 0, 0, 0, 1, 1,
0.1714017, 0.07636923, -0.6267132, 0, 0, 0, 1, 1,
0.1715873, 0.6881008, 0.6273524, 1, 1, 1, 1, 1,
0.1718722, -1.520334, 4.308811, 1, 1, 1, 1, 1,
0.1728704, -1.837384, 2.010831, 1, 1, 1, 1, 1,
0.1731946, -0.1215754, 0.696242, 1, 1, 1, 1, 1,
0.1739354, -1.031811, 0.7939361, 1, 1, 1, 1, 1,
0.1746904, 0.6271307, 1.079713, 1, 1, 1, 1, 1,
0.1747606, -0.6025497, 3.644825, 1, 1, 1, 1, 1,
0.175824, -0.6992223, 3.716547, 1, 1, 1, 1, 1,
0.1805963, -0.05815975, 1.282329, 1, 1, 1, 1, 1,
0.1830977, -0.6044698, 1.616423, 1, 1, 1, 1, 1,
0.1835, -0.5986115, 3.498022, 1, 1, 1, 1, 1,
0.185607, 0.9052894, -0.8456872, 1, 1, 1, 1, 1,
0.1861365, 0.1920105, 1.156444, 1, 1, 1, 1, 1,
0.1880998, -0.3701361, 3.573677, 1, 1, 1, 1, 1,
0.1895966, 0.2152905, 0.06475811, 1, 1, 1, 1, 1,
0.190152, 1.34391, 0.3520443, 0, 0, 1, 1, 1,
0.1902676, 1.024913, 2.041463, 1, 0, 0, 1, 1,
0.1907072, 1.90514, -0.1268352, 1, 0, 0, 1, 1,
0.1908605, 0.8515735, 0.9678671, 1, 0, 0, 1, 1,
0.1915932, -0.1808032, 4.922599, 1, 0, 0, 1, 1,
0.1920981, -1.588201, 4.838067, 1, 0, 0, 1, 1,
0.1922627, 0.4662557, 0.3460918, 0, 0, 0, 1, 1,
0.1942055, 0.3151557, -0.945708, 0, 0, 0, 1, 1,
0.1951833, -0.2183963, 2.555147, 0, 0, 0, 1, 1,
0.1972339, 0.1183075, 0.2245512, 0, 0, 0, 1, 1,
0.1992186, -0.6431713, 5.557584, 0, 0, 0, 1, 1,
0.203919, -1.619724, 5.045193, 0, 0, 0, 1, 1,
0.2043279, -0.009310052, 1.493392, 0, 0, 0, 1, 1,
0.2086565, 1.156193, -0.2071529, 1, 1, 1, 1, 1,
0.2105936, -0.4079003, 1.804217, 1, 1, 1, 1, 1,
0.2132909, 0.598245, -1.239339, 1, 1, 1, 1, 1,
0.2136948, -0.2820688, 4.09277, 1, 1, 1, 1, 1,
0.214664, 0.5009047, -0.2400674, 1, 1, 1, 1, 1,
0.2182585, -0.06418868, 0.9395818, 1, 1, 1, 1, 1,
0.2183599, -0.8778558, 2.458411, 1, 1, 1, 1, 1,
0.2220163, -0.6976161, 2.134633, 1, 1, 1, 1, 1,
0.2244781, -0.1830889, 2.465403, 1, 1, 1, 1, 1,
0.2281394, 1.691119, 0.02939519, 1, 1, 1, 1, 1,
0.2401466, -0.1986643, 2.371562, 1, 1, 1, 1, 1,
0.2405862, -1.410151, 2.348593, 1, 1, 1, 1, 1,
0.2446625, -1.58548, 5.087631, 1, 1, 1, 1, 1,
0.2507298, -0.2429209, 3.887424, 1, 1, 1, 1, 1,
0.2511931, 0.9777496, 0.5256429, 1, 1, 1, 1, 1,
0.2547049, -0.3186586, 1.911324, 0, 0, 1, 1, 1,
0.2551306, -0.38911, 2.64379, 1, 0, 0, 1, 1,
0.2574096, 2.238767, 0.513787, 1, 0, 0, 1, 1,
0.2631826, -1.718059, 3.6199, 1, 0, 0, 1, 1,
0.2645397, 0.6658081, -0.7414484, 1, 0, 0, 1, 1,
0.2683245, 2.60333, 0.9819801, 1, 0, 0, 1, 1,
0.2697712, 0.02179565, 2.914262, 0, 0, 0, 1, 1,
0.2699903, -0.6939464, 1.953816, 0, 0, 0, 1, 1,
0.2770513, 0.06423974, 2.051091, 0, 0, 0, 1, 1,
0.277274, -1.142714, 1.680811, 0, 0, 0, 1, 1,
0.2805757, -1.71863, 2.544476, 0, 0, 0, 1, 1,
0.2817926, 0.8299178, 2.239016, 0, 0, 0, 1, 1,
0.2818318, -0.4645312, 0.1041279, 0, 0, 0, 1, 1,
0.2865153, 0.8874192, 1.355738, 1, 1, 1, 1, 1,
0.2872932, -0.121025, 2.948701, 1, 1, 1, 1, 1,
0.2880105, 1.980015, 0.02525836, 1, 1, 1, 1, 1,
0.2934004, 0.3945592, 2.169904, 1, 1, 1, 1, 1,
0.2968282, 1.188925, 0.5806438, 1, 1, 1, 1, 1,
0.2991804, 0.07072327, 0.296452, 1, 1, 1, 1, 1,
0.3064615, -1.088506, 1.646246, 1, 1, 1, 1, 1,
0.3068475, -1.20059, 3.380222, 1, 1, 1, 1, 1,
0.307602, -1.164518, 2.057852, 1, 1, 1, 1, 1,
0.3130064, -0.8137611, 4.031327, 1, 1, 1, 1, 1,
0.3139172, -0.3203219, 2.367634, 1, 1, 1, 1, 1,
0.3151839, -1.385029, 2.78415, 1, 1, 1, 1, 1,
0.3154035, 1.873925, 1.086439, 1, 1, 1, 1, 1,
0.3175789, -0.3261015, 1.625957, 1, 1, 1, 1, 1,
0.3184222, -0.7261415, 3.415172, 1, 1, 1, 1, 1,
0.3210831, -1.118623, 1.703475, 0, 0, 1, 1, 1,
0.3268351, -0.9901943, 2.33306, 1, 0, 0, 1, 1,
0.3277562, -1.354331, 2.975802, 1, 0, 0, 1, 1,
0.3307137, 0.8817762, 0.6519384, 1, 0, 0, 1, 1,
0.3322246, -0.009335489, -0.7182279, 1, 0, 0, 1, 1,
0.3360311, -0.8237237, 2.394545, 1, 0, 0, 1, 1,
0.3394883, 1.656818, 0.04505571, 0, 0, 0, 1, 1,
0.3410108, -0.5142031, 3.219198, 0, 0, 0, 1, 1,
0.3430235, -1.187834, 2.794332, 0, 0, 0, 1, 1,
0.347955, -0.7586209, 2.565712, 0, 0, 0, 1, 1,
0.3508871, 0.07266602, 0.9825228, 0, 0, 0, 1, 1,
0.3524121, 0.5678422, -0.4930041, 0, 0, 0, 1, 1,
0.3535179, 0.5044124, -0.7957245, 0, 0, 0, 1, 1,
0.3552847, 0.7848408, 1.960841, 1, 1, 1, 1, 1,
0.3573861, -0.7068214, 1.63768, 1, 1, 1, 1, 1,
0.3577399, 0.3218265, 0.2257896, 1, 1, 1, 1, 1,
0.3595324, 1.454282, 0.376656, 1, 1, 1, 1, 1,
0.363031, -1.262551, 2.7059, 1, 1, 1, 1, 1,
0.3699402, 0.03781866, 1.279237, 1, 1, 1, 1, 1,
0.3700363, -0.7405442, 1.573274, 1, 1, 1, 1, 1,
0.3725793, -1.858379, 3.739057, 1, 1, 1, 1, 1,
0.374413, -0.9467492, 3.58078, 1, 1, 1, 1, 1,
0.377708, -0.8468898, 2.567058, 1, 1, 1, 1, 1,
0.3801946, 0.9078432, 0.6861305, 1, 1, 1, 1, 1,
0.381729, -0.3035836, 2.617307, 1, 1, 1, 1, 1,
0.3829025, 2.709106, -1.214448, 1, 1, 1, 1, 1,
0.3846525, -1.005683, 1.476053, 1, 1, 1, 1, 1,
0.3858972, 1.494537, 1.641961, 1, 1, 1, 1, 1,
0.3887981, 0.4802134, 0.6490025, 0, 0, 1, 1, 1,
0.3915054, -1.731725, 3.256026, 1, 0, 0, 1, 1,
0.3953093, 0.5464157, 2.41801, 1, 0, 0, 1, 1,
0.400978, 1.094935, 1.916624, 1, 0, 0, 1, 1,
0.4064001, -0.9401655, 4.491983, 1, 0, 0, 1, 1,
0.4072171, -1.04923, 3.579084, 1, 0, 0, 1, 1,
0.4082049, -0.6574297, 3.835537, 0, 0, 0, 1, 1,
0.4093095, 2.081046, -1.103024, 0, 0, 0, 1, 1,
0.410248, 0.1719065, 1.59468, 0, 0, 0, 1, 1,
0.4178816, -0.3529383, 1.127529, 0, 0, 0, 1, 1,
0.4214461, -0.2746888, 5.691454, 0, 0, 0, 1, 1,
0.4230799, 0.4058432, 2.757624, 0, 0, 0, 1, 1,
0.4264994, -0.01939832, 1.282321, 0, 0, 0, 1, 1,
0.4268467, -0.9523521, 2.779359, 1, 1, 1, 1, 1,
0.4315686, -0.3263641, 1.356357, 1, 1, 1, 1, 1,
0.4327081, 0.7562326, 1.236305, 1, 1, 1, 1, 1,
0.4345351, -0.1708227, 2.401492, 1, 1, 1, 1, 1,
0.4351721, 1.136868, 1.614795, 1, 1, 1, 1, 1,
0.4394618, -0.067438, 2.106436, 1, 1, 1, 1, 1,
0.4416108, -1.281918, 2.781718, 1, 1, 1, 1, 1,
0.4432342, 2.015522, -0.05980432, 1, 1, 1, 1, 1,
0.4447626, -1.382806, 1.979151, 1, 1, 1, 1, 1,
0.4452493, -1.677721, 4.693727, 1, 1, 1, 1, 1,
0.4475155, -0.7310064, 3.591691, 1, 1, 1, 1, 1,
0.4501343, 0.04544158, 3.317039, 1, 1, 1, 1, 1,
0.4577855, -1.844052, 3.351001, 1, 1, 1, 1, 1,
0.4589987, -0.07920443, 2.211544, 1, 1, 1, 1, 1,
0.4679467, 1.430763, 1.187429, 1, 1, 1, 1, 1,
0.468418, 0.3539212, 1.711084, 0, 0, 1, 1, 1,
0.4688001, 0.5300612, -0.2911033, 1, 0, 0, 1, 1,
0.4774841, -0.9930516, 2.597248, 1, 0, 0, 1, 1,
0.4788787, -1.921781, 0.9986181, 1, 0, 0, 1, 1,
0.4810658, 1.547555, 0.2753618, 1, 0, 0, 1, 1,
0.4812377, 1.40806, 0.2734586, 1, 0, 0, 1, 1,
0.4876209, 1.332855, 2.134947, 0, 0, 0, 1, 1,
0.4932225, -0.1415257, 3.962405, 0, 0, 0, 1, 1,
0.4938038, -0.2695419, 3.684141, 0, 0, 0, 1, 1,
0.4947247, -1.093605, 0.9913316, 0, 0, 0, 1, 1,
0.4962131, 1.250704, 0.2014123, 0, 0, 0, 1, 1,
0.4970791, 1.777129, -0.2932642, 0, 0, 0, 1, 1,
0.5001967, -0.08779887, 1.943567, 0, 0, 0, 1, 1,
0.5036583, 0.9756311, 0.9581683, 1, 1, 1, 1, 1,
0.505976, 1.372256, -0.2934388, 1, 1, 1, 1, 1,
0.5064953, 0.2228227, -0.2275916, 1, 1, 1, 1, 1,
0.5088214, -0.9620333, 1.672971, 1, 1, 1, 1, 1,
0.5088646, -0.1059928, 3.483806, 1, 1, 1, 1, 1,
0.5141399, -0.4747109, 4.955946, 1, 1, 1, 1, 1,
0.5143851, 0.07347032, 1.145296, 1, 1, 1, 1, 1,
0.5170874, 0.7151095, 2.758851, 1, 1, 1, 1, 1,
0.5173838, -0.4799638, 2.164792, 1, 1, 1, 1, 1,
0.522978, -2.288305, 4.006635, 1, 1, 1, 1, 1,
0.5248355, 2.104049, 0.4430552, 1, 1, 1, 1, 1,
0.5303462, 2.202553, 0.4564981, 1, 1, 1, 1, 1,
0.5338581, 1.186713, -0.3642262, 1, 1, 1, 1, 1,
0.5367103, 0.1932772, 1.120048, 1, 1, 1, 1, 1,
0.5390054, 0.5772142, 1.200082, 1, 1, 1, 1, 1,
0.5392227, 1.635792, 0.484084, 0, 0, 1, 1, 1,
0.5498364, 0.463659, 1.19828, 1, 0, 0, 1, 1,
0.5502163, 0.6116477, -0.6061708, 1, 0, 0, 1, 1,
0.5578104, -1.205402, 3.767992, 1, 0, 0, 1, 1,
0.5667196, -0.6274665, 0.623925, 1, 0, 0, 1, 1,
0.5700915, 0.2883324, -0.1958691, 1, 0, 0, 1, 1,
0.5710391, 0.4471145, 2.131562, 0, 0, 0, 1, 1,
0.5732633, -1.032201, 3.281875, 0, 0, 0, 1, 1,
0.5739353, -0.1376543, 1.487376, 0, 0, 0, 1, 1,
0.5768491, -1.109669, 1.574684, 0, 0, 0, 1, 1,
0.5787409, 0.4397948, 1.90642, 0, 0, 0, 1, 1,
0.5788509, -0.5397444, 3.339607, 0, 0, 0, 1, 1,
0.586482, -0.4312968, 1.077263, 0, 0, 0, 1, 1,
0.5879101, 0.8818084, -0.05471044, 1, 1, 1, 1, 1,
0.5897815, 0.9941548, 1.474065, 1, 1, 1, 1, 1,
0.5898674, 0.2271863, 1.124336, 1, 1, 1, 1, 1,
0.5908757, 0.0204331, 3.038997, 1, 1, 1, 1, 1,
0.5910832, -0.3498418, 2.062623, 1, 1, 1, 1, 1,
0.5919228, -0.03799931, 2.771822, 1, 1, 1, 1, 1,
0.5945585, 0.1473951, 3.477232, 1, 1, 1, 1, 1,
0.5947365, 1.987853, -0.03735549, 1, 1, 1, 1, 1,
0.5953379, -0.1018668, 0.802445, 1, 1, 1, 1, 1,
0.5961952, 0.003946024, 3.058314, 1, 1, 1, 1, 1,
0.603865, 1.290066, 0.8250079, 1, 1, 1, 1, 1,
0.603907, 1.369831, -0.298629, 1, 1, 1, 1, 1,
0.6073222, -0.6635591, 1.219532, 1, 1, 1, 1, 1,
0.6209353, 0.1924603, 0.4275174, 1, 1, 1, 1, 1,
0.6214802, 0.4980309, 2.053319, 1, 1, 1, 1, 1,
0.623126, -2.198582, 2.46793, 0, 0, 1, 1, 1,
0.6248084, 1.827408, 0.6176244, 1, 0, 0, 1, 1,
0.6270851, -0.4540441, 2.79656, 1, 0, 0, 1, 1,
0.630241, 0.3834899, 0.7489814, 1, 0, 0, 1, 1,
0.6359466, 0.04906693, 1.601011, 1, 0, 0, 1, 1,
0.6418457, 0.6789703, 0.6629593, 1, 0, 0, 1, 1,
0.6457785, -0.5769554, 4.190475, 0, 0, 0, 1, 1,
0.6512365, -0.9810028, 2.951626, 0, 0, 0, 1, 1,
0.65541, 0.6423545, -0.2505831, 0, 0, 0, 1, 1,
0.6572009, 0.82871, 0.254738, 0, 0, 0, 1, 1,
0.6612241, -0.7144267, 3.100364, 0, 0, 0, 1, 1,
0.6691591, 1.484363, 1.507913, 0, 0, 0, 1, 1,
0.6704286, -0.04190682, 0.9334646, 0, 0, 0, 1, 1,
0.6713706, 1.68091, -0.3852336, 1, 1, 1, 1, 1,
0.6716173, -0.7710556, 4.16877, 1, 1, 1, 1, 1,
0.6737473, 0.5809479, 0.02658194, 1, 1, 1, 1, 1,
0.6771429, -0.09458876, 2.554265, 1, 1, 1, 1, 1,
0.6772717, 0.9178834, 1.30207, 1, 1, 1, 1, 1,
0.6778712, -1.023801, 0.4680207, 1, 1, 1, 1, 1,
0.6838183, -0.7266638, 1.532713, 1, 1, 1, 1, 1,
0.6878204, 0.8509919, 0.6619191, 1, 1, 1, 1, 1,
0.688036, 0.2683077, 1.567353, 1, 1, 1, 1, 1,
0.6896385, -1.324686, 3.232599, 1, 1, 1, 1, 1,
0.6914915, 1.026401, -0.2098743, 1, 1, 1, 1, 1,
0.6968217, 0.7382403, 0.6098144, 1, 1, 1, 1, 1,
0.6968856, -1.020459, 4.04424, 1, 1, 1, 1, 1,
0.6986696, 1.010789, -1.373741, 1, 1, 1, 1, 1,
0.7025989, -0.9541841, 2.890763, 1, 1, 1, 1, 1,
0.7042698, -2.714091, 3.931467, 0, 0, 1, 1, 1,
0.7054504, 0.6076287, 1.0805, 1, 0, 0, 1, 1,
0.7059702, -0.2564328, 1.096459, 1, 0, 0, 1, 1,
0.7063352, -0.4368956, 2.917376, 1, 0, 0, 1, 1,
0.7125126, -0.1159053, 0.4797352, 1, 0, 0, 1, 1,
0.7162088, 1.21861, 0.4754483, 1, 0, 0, 1, 1,
0.7206265, -0.8117642, 1.485081, 0, 0, 0, 1, 1,
0.7208794, -1.592257, 2.491199, 0, 0, 0, 1, 1,
0.7236854, 0.8913742, -0.8614557, 0, 0, 0, 1, 1,
0.7275014, 1.427428, 0.6958697, 0, 0, 0, 1, 1,
0.7395525, -2.27741, 2.672068, 0, 0, 0, 1, 1,
0.73965, -0.4030708, 2.666322, 0, 0, 0, 1, 1,
0.7420202, 0.5323898, 1.490268, 0, 0, 0, 1, 1,
0.7429039, -1.855371, 1.826527, 1, 1, 1, 1, 1,
0.7475169, -0.3411149, -0.1383735, 1, 1, 1, 1, 1,
0.7508974, -1.451473, 2.987352, 1, 1, 1, 1, 1,
0.7535433, -0.5248601, 2.891956, 1, 1, 1, 1, 1,
0.7536525, 1.035411, -0.9709671, 1, 1, 1, 1, 1,
0.7581884, 1.072941, 1.171149, 1, 1, 1, 1, 1,
0.7585188, 3.246039, 0.4916172, 1, 1, 1, 1, 1,
0.76276, 1.761172, -0.5837198, 1, 1, 1, 1, 1,
0.7638364, -0.8260316, 1.597746, 1, 1, 1, 1, 1,
0.7654287, -0.7399358, 2.73037, 1, 1, 1, 1, 1,
0.7721231, -1.330552, 1.796361, 1, 1, 1, 1, 1,
0.7766573, -0.1338762, 0.7737218, 1, 1, 1, 1, 1,
0.780889, 0.6877314, -0.4350814, 1, 1, 1, 1, 1,
0.7816082, -0.5076873, 1.294873, 1, 1, 1, 1, 1,
0.78358, 2.011333, 0.6229183, 1, 1, 1, 1, 1,
0.7838181, 0.1834213, -1.685235, 0, 0, 1, 1, 1,
0.8026373, 1.353357, 2.065514, 1, 0, 0, 1, 1,
0.8063741, -0.6602592, 2.992876, 1, 0, 0, 1, 1,
0.8126857, 1.579902, 1.339605, 1, 0, 0, 1, 1,
0.8155434, 0.7434533, 1.25731, 1, 0, 0, 1, 1,
0.8198639, -0.292233, 2.866942, 1, 0, 0, 1, 1,
0.8225013, -0.1007037, 1.139309, 0, 0, 0, 1, 1,
0.8349255, 0.258317, 1.785196, 0, 0, 0, 1, 1,
0.837521, -1.77629, 2.863992, 0, 0, 0, 1, 1,
0.8479195, 0.3404645, -1.514876, 0, 0, 0, 1, 1,
0.849704, -0.1263974, 2.697036, 0, 0, 0, 1, 1,
0.8498049, 0.8221023, 2.480852, 0, 0, 0, 1, 1,
0.8600557, 0.6247978, -0.9011887, 0, 0, 0, 1, 1,
0.8607938, 0.9187586, 0.460998, 1, 1, 1, 1, 1,
0.8765081, 0.4639742, 1.785792, 1, 1, 1, 1, 1,
0.877507, 1.185426, 1.527109, 1, 1, 1, 1, 1,
0.8795475, -0.1889775, 0.2392031, 1, 1, 1, 1, 1,
0.8878658, 0.588143, 1.908469, 1, 1, 1, 1, 1,
0.8955288, -1.151428, 4.069706, 1, 1, 1, 1, 1,
0.8957214, 1.773643, 0.6640752, 1, 1, 1, 1, 1,
0.8984646, -0.663538, 2.122406, 1, 1, 1, 1, 1,
0.8989228, 0.3818306, 1.378368, 1, 1, 1, 1, 1,
0.9009133, 0.08934783, 1.322652, 1, 1, 1, 1, 1,
0.902689, -1.297025, 1.809513, 1, 1, 1, 1, 1,
0.902993, -1.232812, 4.091008, 1, 1, 1, 1, 1,
0.9095879, 1.078223, 2.037608, 1, 1, 1, 1, 1,
0.9113373, -0.5709467, 2.942826, 1, 1, 1, 1, 1,
0.9183381, -0.1451446, 2.578174, 1, 1, 1, 1, 1,
0.9186717, 0.009996829, 0.8913313, 0, 0, 1, 1, 1,
0.9214571, 0.6412476, 1.726195, 1, 0, 0, 1, 1,
0.9242609, 0.9960508, 2.24137, 1, 0, 0, 1, 1,
0.9312053, -0.0110021, 1.44111, 1, 0, 0, 1, 1,
0.9313161, 1.179566, 1.306472, 1, 0, 0, 1, 1,
0.9352161, 0.6034432, 1.292992, 1, 0, 0, 1, 1,
0.9505507, -0.9647301, 2.456015, 0, 0, 0, 1, 1,
0.9582417, -2.275796, 3.060214, 0, 0, 0, 1, 1,
0.9586739, 0.1345341, 0.3968381, 0, 0, 0, 1, 1,
0.9721441, 1.197752, 0.9829534, 0, 0, 0, 1, 1,
0.9728679, -0.9006385, 2.878263, 0, 0, 0, 1, 1,
0.9730372, 0.8777444, 0.3800938, 0, 0, 0, 1, 1,
0.9738516, -1.520336, 3.546837, 0, 0, 0, 1, 1,
0.9744692, -0.7382357, 0.3562421, 1, 1, 1, 1, 1,
0.9754789, -0.1369667, 2.368795, 1, 1, 1, 1, 1,
0.9879528, 0.6742547, 1.164156, 1, 1, 1, 1, 1,
0.9909579, -1.054986, 1.863627, 1, 1, 1, 1, 1,
0.9983293, -0.4512124, 1.487391, 1, 1, 1, 1, 1,
1.003415, 1.594157, 1.419737, 1, 1, 1, 1, 1,
1.003663, 0.7715325, -0.1205804, 1, 1, 1, 1, 1,
1.003755, -0.6562408, 0.8284191, 1, 1, 1, 1, 1,
1.008743, 1.750801, 2.20417, 1, 1, 1, 1, 1,
1.010627, 0.7452968, -0.2819698, 1, 1, 1, 1, 1,
1.016121, 1.486806, 1.707462, 1, 1, 1, 1, 1,
1.027496, -0.4603902, 2.701678, 1, 1, 1, 1, 1,
1.028913, -0.9259466, 2.965433, 1, 1, 1, 1, 1,
1.041483, -0.1304668, 1.65308, 1, 1, 1, 1, 1,
1.04156, -1.095797, 1.533183, 1, 1, 1, 1, 1,
1.042641, 0.5623688, 2.684678, 0, 0, 1, 1, 1,
1.043994, -0.4470736, 1.770267, 1, 0, 0, 1, 1,
1.048671, -0.2724193, 3.785863, 1, 0, 0, 1, 1,
1.052404, -2.379825, 1.514355, 1, 0, 0, 1, 1,
1.056209, -0.3300702, 1.655352, 1, 0, 0, 1, 1,
1.056874, -0.5275989, 1.894306, 1, 0, 0, 1, 1,
1.079509, -0.6101669, 2.083855, 0, 0, 0, 1, 1,
1.082818, 0.9617355, 3.249635, 0, 0, 0, 1, 1,
1.085553, 0.8862464, 1.476562, 0, 0, 0, 1, 1,
1.087072, 1.113493, -0.1403461, 0, 0, 0, 1, 1,
1.093398, 1.463533, 0.4532911, 0, 0, 0, 1, 1,
1.099479, -0.8837265, 3.016323, 0, 0, 0, 1, 1,
1.114825, -0.4500297, 2.773617, 0, 0, 0, 1, 1,
1.117544, -0.9269207, 3.378889, 1, 1, 1, 1, 1,
1.122499, -0.4438108, 1.491092, 1, 1, 1, 1, 1,
1.133142, 0.2390002, 3.353273, 1, 1, 1, 1, 1,
1.133677, 2.409753, -0.5421108, 1, 1, 1, 1, 1,
1.143261, 0.2469142, 1.993942, 1, 1, 1, 1, 1,
1.144302, -1.047447, 1.797533, 1, 1, 1, 1, 1,
1.154303, -0.2284727, 2.315475, 1, 1, 1, 1, 1,
1.1563, -1.186212, 2.652766, 1, 1, 1, 1, 1,
1.165477, 0.2511805, 1.027225, 1, 1, 1, 1, 1,
1.166613, -1.185364, 0.8534373, 1, 1, 1, 1, 1,
1.174664, -0.1292227, 1.858389, 1, 1, 1, 1, 1,
1.176059, -0.944543, 1.743269, 1, 1, 1, 1, 1,
1.177235, -0.8498291, 2.562908, 1, 1, 1, 1, 1,
1.180947, 0.5292486, -1.141886, 1, 1, 1, 1, 1,
1.186364, -1.739231, 2.646806, 1, 1, 1, 1, 1,
1.187865, -0.5118309, 0.3487949, 0, 0, 1, 1, 1,
1.191979, -0.3270464, 2.522921, 1, 0, 0, 1, 1,
1.192826, -2.192622, 1.741832, 1, 0, 0, 1, 1,
1.193692, 0.1401092, 2.645139, 1, 0, 0, 1, 1,
1.201055, -0.6234514, 1.620368, 1, 0, 0, 1, 1,
1.203003, 1.524713, 0.1368609, 1, 0, 0, 1, 1,
1.205359, 0.305067, 0.3101974, 0, 0, 0, 1, 1,
1.206503, -0.1239614, 1.837612, 0, 0, 0, 1, 1,
1.212739, 0.6499252, 0.4370983, 0, 0, 0, 1, 1,
1.224937, 1.509629, -0.1237977, 0, 0, 0, 1, 1,
1.225545, 2.023226, 0.7655783, 0, 0, 0, 1, 1,
1.229957, 2.12527, -0.5334589, 0, 0, 0, 1, 1,
1.240781, -0.2230662, 2.419746, 0, 0, 0, 1, 1,
1.258419, 1.335657, 0.5416243, 1, 1, 1, 1, 1,
1.260226, -0.6560056, 0.7482972, 1, 1, 1, 1, 1,
1.266647, -1.5037, 4.93512, 1, 1, 1, 1, 1,
1.282855, -1.970786, 1.835079, 1, 1, 1, 1, 1,
1.286103, -1.702359, 1.386747, 1, 1, 1, 1, 1,
1.286135, -0.307165, 2.133588, 1, 1, 1, 1, 1,
1.292943, -1.129421, 0.4373341, 1, 1, 1, 1, 1,
1.299418, 0.7145027, 1.671013, 1, 1, 1, 1, 1,
1.308403, 1.648346, 1.789277, 1, 1, 1, 1, 1,
1.310384, 0.577208, 1.785833, 1, 1, 1, 1, 1,
1.315574, -0.1885376, 0.8871367, 1, 1, 1, 1, 1,
1.329019, -1.047769, 3.47998, 1, 1, 1, 1, 1,
1.335771, 2.265106, -1.027348, 1, 1, 1, 1, 1,
1.33797, -0.7435072, 1.257432, 1, 1, 1, 1, 1,
1.358711, -1.601498, 2.211307, 1, 1, 1, 1, 1,
1.361928, -1.622805, 2.07499, 0, 0, 1, 1, 1,
1.372437, 1.018946, 1.106894, 1, 0, 0, 1, 1,
1.375259, -1.886819, 2.544365, 1, 0, 0, 1, 1,
1.385854, -0.6386775, 2.199947, 1, 0, 0, 1, 1,
1.400368, -0.6037312, 1.299024, 1, 0, 0, 1, 1,
1.403167, 0.6208641, 1.415046, 1, 0, 0, 1, 1,
1.413302, -0.3366381, 2.567818, 0, 0, 0, 1, 1,
1.423045, -0.3303418, 2.626536, 0, 0, 0, 1, 1,
1.428128, 0.7128058, 1.267512, 0, 0, 0, 1, 1,
1.433524, 2.074903, -0.6764132, 0, 0, 0, 1, 1,
1.440346, -0.9290359, 2.645242, 0, 0, 0, 1, 1,
1.451666, -1.317742, 2.152307, 0, 0, 0, 1, 1,
1.469092, -0.5144913, 2.900161, 0, 0, 0, 1, 1,
1.489478, 1.299118, 0.2646377, 1, 1, 1, 1, 1,
1.494412, 1.557627, 0.7790276, 1, 1, 1, 1, 1,
1.499049, 0.4430965, -0.1740499, 1, 1, 1, 1, 1,
1.500206, 0.8366562, -0.1641195, 1, 1, 1, 1, 1,
1.509715, -0.5385649, 1.847685, 1, 1, 1, 1, 1,
1.512394, 0.4273119, 1.083985, 1, 1, 1, 1, 1,
1.520706, 1.172415, 1.207007, 1, 1, 1, 1, 1,
1.523804, 0.2936198, 2.888426, 1, 1, 1, 1, 1,
1.525948, -1.667616, 1.977601, 1, 1, 1, 1, 1,
1.53378, 0.3341696, 0.6106171, 1, 1, 1, 1, 1,
1.54189, -1.245853, 0.9371077, 1, 1, 1, 1, 1,
1.545528, 1.660816, 0.46119, 1, 1, 1, 1, 1,
1.553945, -1.477336, 3.68467, 1, 1, 1, 1, 1,
1.556493, 0.888782, 1.048373, 1, 1, 1, 1, 1,
1.558149, -0.1730407, 0.05027525, 1, 1, 1, 1, 1,
1.56486, 1.183904, 1.740805, 0, 0, 1, 1, 1,
1.598591, -0.005311855, 1.085965, 1, 0, 0, 1, 1,
1.612299, -1.419085, 0.9254858, 1, 0, 0, 1, 1,
1.62181, -0.3392624, 0.6623908, 1, 0, 0, 1, 1,
1.65269, -0.1057063, 1.507492, 1, 0, 0, 1, 1,
1.662311, 2.947402, 0.2701495, 1, 0, 0, 1, 1,
1.668742, 0.3536768, 0.9506564, 0, 0, 0, 1, 1,
1.679408, -0.5672059, 1.471375, 0, 0, 0, 1, 1,
1.683214, -0.4006695, 2.168103, 0, 0, 0, 1, 1,
1.684696, -2.065001, 1.238754, 0, 0, 0, 1, 1,
1.688607, 0.274157, 0.5365019, 0, 0, 0, 1, 1,
1.713364, -0.2814612, 0.9567624, 0, 0, 0, 1, 1,
1.720545, -0.3728941, 2.089736, 0, 0, 0, 1, 1,
1.742401, -1.252908, 1.02844, 1, 1, 1, 1, 1,
1.752053, 0.2539535, 1.416069, 1, 1, 1, 1, 1,
1.756384, 1.056552, 0.9774011, 1, 1, 1, 1, 1,
1.764235, -0.7877069, 2.93282, 1, 1, 1, 1, 1,
1.802453, -0.2730948, 2.449456, 1, 1, 1, 1, 1,
1.867179, 0.8765851, 0.8148779, 1, 1, 1, 1, 1,
1.87039, -0.3912425, -0.5509686, 1, 1, 1, 1, 1,
1.882388, 0.6769996, 1.097234, 1, 1, 1, 1, 1,
1.895244, -0.1807325, 2.782849, 1, 1, 1, 1, 1,
1.923511, 0.4056565, 2.852145, 1, 1, 1, 1, 1,
1.925961, -2.430054, 2.581897, 1, 1, 1, 1, 1,
1.928824, -0.3582049, 2.377291, 1, 1, 1, 1, 1,
1.943675, 0.04193071, 1.415411, 1, 1, 1, 1, 1,
2.049084, 0.9631242, 1.43682, 1, 1, 1, 1, 1,
2.064645, -0.5526352, 1.907902, 1, 1, 1, 1, 1,
2.065296, 0.1651871, 1.123003, 0, 0, 1, 1, 1,
2.079026, -0.3521597, 1.475307, 1, 0, 0, 1, 1,
2.163116, -0.02440096, -0.01047588, 1, 0, 0, 1, 1,
2.165981, -1.065854, 3.925557, 1, 0, 0, 1, 1,
2.196295, 0.5782871, 0.7716293, 1, 0, 0, 1, 1,
2.201451, -0.6825704, 2.314845, 1, 0, 0, 1, 1,
2.242841, -0.2353932, 0.1745686, 0, 0, 0, 1, 1,
2.329092, -1.385605, 2.945624, 0, 0, 0, 1, 1,
2.34355, 1.55476, 0.9256771, 0, 0, 0, 1, 1,
2.393817, 1.056691, 1.038573, 0, 0, 0, 1, 1,
2.434465, -0.2378465, 3.074728, 0, 0, 0, 1, 1,
2.498985, -0.3571514, 1.902742, 0, 0, 0, 1, 1,
2.553296, -1.171828, 2.607012, 0, 0, 0, 1, 1,
2.580957, -0.2324263, 1.601545, 1, 1, 1, 1, 1,
2.648206, -0.7602814, 3.206157, 1, 1, 1, 1, 1,
2.771452, -0.5571949, 0.3304677, 1, 1, 1, 1, 1,
3.201093, -0.8718051, 0.7645129, 1, 1, 1, 1, 1,
3.361154, 0.1126482, 1.130718, 1, 1, 1, 1, 1,
3.400867, -0.5932729, 4.063885, 1, 1, 1, 1, 1,
3.899656, -0.08167524, 0.5996705, 1, 1, 1, 1, 1
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
var radius = 9.807686;
var distance = 34.44908;
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
mvMatrix.translate( -0.2046795, -0.04589224, -0.3817465 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.44908);
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
