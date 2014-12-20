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
-3.318433, -0.1782963, -1.373856, 1, 0, 0, 1,
-3.202012, 0.3342798, -2.257653, 1, 0.007843138, 0, 1,
-3.095227, 1.777689, -1.802912, 1, 0.01176471, 0, 1,
-2.699306, -0.4258041, -0.9057009, 1, 0.01960784, 0, 1,
-2.624162, -1.309688, -2.360392, 1, 0.02352941, 0, 1,
-2.622475, -0.2124626, -0.4025849, 1, 0.03137255, 0, 1,
-2.613627, 0.6743621, -0.505372, 1, 0.03529412, 0, 1,
-2.5592, -0.8791355, -3.90188, 1, 0.04313726, 0, 1,
-2.466695, -0.5114038, -0.9990389, 1, 0.04705882, 0, 1,
-2.455346, 1.431846, -1.124751, 1, 0.05490196, 0, 1,
-2.405573, 0.1129347, -0.9195821, 1, 0.05882353, 0, 1,
-2.372384, -2.34885, -2.251493, 1, 0.06666667, 0, 1,
-2.303901, 0.5358413, -2.759617, 1, 0.07058824, 0, 1,
-2.291226, 0.5832488, -2.893413, 1, 0.07843138, 0, 1,
-2.291158, -1.000657, -1.237217, 1, 0.08235294, 0, 1,
-2.272852, 1.391949, 1.074132, 1, 0.09019608, 0, 1,
-2.246315, -1.705793, -4.115786, 1, 0.09411765, 0, 1,
-2.235768, 0.6099013, -3.695245, 1, 0.1019608, 0, 1,
-2.213424, 0.3581025, -0.9985008, 1, 0.1098039, 0, 1,
-2.18832, 0.4635709, 0.405224, 1, 0.1137255, 0, 1,
-2.156372, 0.624303, 0.06259925, 1, 0.1215686, 0, 1,
-2.152177, 0.8970277, -1.196573, 1, 0.1254902, 0, 1,
-2.134655, -1.984087, -2.985639, 1, 0.1333333, 0, 1,
-2.133816, -0.7391598, -2.656415, 1, 0.1372549, 0, 1,
-2.124191, -0.8515177, -2.658792, 1, 0.145098, 0, 1,
-2.076656, -0.8098285, -0.9570699, 1, 0.1490196, 0, 1,
-2.064469, 0.2767279, -0.5795091, 1, 0.1568628, 0, 1,
-2.042595, 0.792057, -2.346994, 1, 0.1607843, 0, 1,
-2.008358, 0.1283271, -0.5309559, 1, 0.1686275, 0, 1,
-2.006464, 0.3157296, -1.739147, 1, 0.172549, 0, 1,
-1.984244, 0.6164593, -0.7537638, 1, 0.1803922, 0, 1,
-1.934389, -0.3115365, -1.96881, 1, 0.1843137, 0, 1,
-1.902243, 0.1235202, -0.6813964, 1, 0.1921569, 0, 1,
-1.886088, -0.04271337, -1.685839, 1, 0.1960784, 0, 1,
-1.858661, 0.7776604, -1.661995, 1, 0.2039216, 0, 1,
-1.854949, -0.3978874, -0.387184, 1, 0.2117647, 0, 1,
-1.838516, -1.041511, -2.122994, 1, 0.2156863, 0, 1,
-1.82951, -2.122825, -3.250592, 1, 0.2235294, 0, 1,
-1.822987, -0.4475007, -0.9435166, 1, 0.227451, 0, 1,
-1.821711, 0.6231353, 0.9248871, 1, 0.2352941, 0, 1,
-1.818374, -0.420947, -3.656561, 1, 0.2392157, 0, 1,
-1.81744, -0.6907027, -3.39625, 1, 0.2470588, 0, 1,
-1.812457, 0.1303377, -3.501964, 1, 0.2509804, 0, 1,
-1.801316, 0.6989349, -2.016424, 1, 0.2588235, 0, 1,
-1.79189, 0.6179807, 0.07592554, 1, 0.2627451, 0, 1,
-1.779011, -0.8516366, -0.5469137, 1, 0.2705882, 0, 1,
-1.770968, 1.219274, -1.054396, 1, 0.2745098, 0, 1,
-1.759015, -0.6105, -1.411565, 1, 0.282353, 0, 1,
-1.751818, -0.04350302, -0.4954726, 1, 0.2862745, 0, 1,
-1.715582, -0.6777528, -1.274411, 1, 0.2941177, 0, 1,
-1.674437, -0.7598157, -1.691611, 1, 0.3019608, 0, 1,
-1.673111, 0.7715922, -2.029702, 1, 0.3058824, 0, 1,
-1.663757, -0.477244, -1.638961, 1, 0.3137255, 0, 1,
-1.655775, -0.09109185, -2.893582, 1, 0.3176471, 0, 1,
-1.650665, 0.5768937, -3.113081, 1, 0.3254902, 0, 1,
-1.650151, -0.2608279, -1.999582, 1, 0.3294118, 0, 1,
-1.650093, 0.3369412, -1.000775, 1, 0.3372549, 0, 1,
-1.648045, 0.8011801, -0.7216051, 1, 0.3411765, 0, 1,
-1.640926, -0.2107504, -1.449489, 1, 0.3490196, 0, 1,
-1.633776, 2.383725, -0.9905477, 1, 0.3529412, 0, 1,
-1.628264, -0.09743464, -0.9579166, 1, 0.3607843, 0, 1,
-1.627383, -1.057072, -2.968153, 1, 0.3647059, 0, 1,
-1.622998, -0.2769873, -2.835277, 1, 0.372549, 0, 1,
-1.617571, -0.8669669, -1.846366, 1, 0.3764706, 0, 1,
-1.596633, 1.06466, -0.7208444, 1, 0.3843137, 0, 1,
-1.591181, 1.540555, 0.003831937, 1, 0.3882353, 0, 1,
-1.565835, 0.674017, -0.9089947, 1, 0.3960784, 0, 1,
-1.551351, -0.2631418, -3.492996, 1, 0.4039216, 0, 1,
-1.51924, -0.1237229, -0.6849048, 1, 0.4078431, 0, 1,
-1.517203, 0.0007668354, -0.3977102, 1, 0.4156863, 0, 1,
-1.514059, -1.547313, -2.176579, 1, 0.4196078, 0, 1,
-1.513804, 0.4439739, -1.337974, 1, 0.427451, 0, 1,
-1.496073, 0.9247429, -0.6096343, 1, 0.4313726, 0, 1,
-1.495413, 0.0191437, -3.198032, 1, 0.4392157, 0, 1,
-1.491431, 0.3123356, -1.670157, 1, 0.4431373, 0, 1,
-1.480938, -0.9040864, -3.008307, 1, 0.4509804, 0, 1,
-1.480365, 0.4626041, 0.1079077, 1, 0.454902, 0, 1,
-1.480239, -0.718143, -1.329672, 1, 0.4627451, 0, 1,
-1.480025, 1.265936, -1.502574, 1, 0.4666667, 0, 1,
-1.472023, -0.287213, -0.7415933, 1, 0.4745098, 0, 1,
-1.465847, 0.01069527, -1.562099, 1, 0.4784314, 0, 1,
-1.459088, 1.287659, -1.26795, 1, 0.4862745, 0, 1,
-1.448941, 0.3518482, -1.662406, 1, 0.4901961, 0, 1,
-1.434048, 2.23407, 1.418119, 1, 0.4980392, 0, 1,
-1.43281, -0.901902, -1.311272, 1, 0.5058824, 0, 1,
-1.424192, -0.9986015, -3.126873, 1, 0.509804, 0, 1,
-1.423789, -2.019627, -2.376144, 1, 0.5176471, 0, 1,
-1.42272, -0.1894958, -1.378109, 1, 0.5215687, 0, 1,
-1.417073, 0.4410116, -0.4473868, 1, 0.5294118, 0, 1,
-1.412702, 0.9393971, -0.708024, 1, 0.5333334, 0, 1,
-1.412456, 0.1230659, -0.5145948, 1, 0.5411765, 0, 1,
-1.412081, -1.214648, -1.261681, 1, 0.5450981, 0, 1,
-1.410019, -0.2144491, -1.54012, 1, 0.5529412, 0, 1,
-1.38865, 1.077826, -0.6172681, 1, 0.5568628, 0, 1,
-1.377233, 0.1100582, -2.987376, 1, 0.5647059, 0, 1,
-1.376487, -1.178916, -2.391479, 1, 0.5686275, 0, 1,
-1.369773, 1.594189, 0.8348914, 1, 0.5764706, 0, 1,
-1.36171, -0.3323279, -4.21208, 1, 0.5803922, 0, 1,
-1.356776, 2.188978, -1.036154, 1, 0.5882353, 0, 1,
-1.355534, 1.480517, 0.5375078, 1, 0.5921569, 0, 1,
-1.337029, 0.3560784, -0.3910555, 1, 0.6, 0, 1,
-1.336917, 0.666548, -0.877502, 1, 0.6078432, 0, 1,
-1.323547, -1.420645, -2.728349, 1, 0.6117647, 0, 1,
-1.323399, -0.8015671, -2.939837, 1, 0.6196079, 0, 1,
-1.321065, -0.1832362, 1.054764, 1, 0.6235294, 0, 1,
-1.319609, 1.585366, -1.011172, 1, 0.6313726, 0, 1,
-1.303247, -0.9138741, -2.527027, 1, 0.6352941, 0, 1,
-1.287796, 0.3076137, -1.876213, 1, 0.6431373, 0, 1,
-1.287163, 0.1780544, -2.603099, 1, 0.6470588, 0, 1,
-1.283913, -0.8455877, -1.667677, 1, 0.654902, 0, 1,
-1.283319, -1.568825, -2.00663, 1, 0.6588235, 0, 1,
-1.277453, 0.8960871, -2.612989, 1, 0.6666667, 0, 1,
-1.275926, 1.192564, -0.7127339, 1, 0.6705883, 0, 1,
-1.273918, -0.5482023, -2.755319, 1, 0.6784314, 0, 1,
-1.271572, -0.5332279, -0.81836, 1, 0.682353, 0, 1,
-1.270329, -1.925025, -1.761046, 1, 0.6901961, 0, 1,
-1.269898, -0.8882849, -1.501815, 1, 0.6941177, 0, 1,
-1.265456, 0.480886, -1.12826, 1, 0.7019608, 0, 1,
-1.255387, 0.2611171, -1.431562, 1, 0.7098039, 0, 1,
-1.236343, -1.036878, -2.931504, 1, 0.7137255, 0, 1,
-1.231658, -0.9745629, -1.553026, 1, 0.7215686, 0, 1,
-1.22333, 0.8151619, 0.5681715, 1, 0.7254902, 0, 1,
-1.218791, -0.1164292, -2.417893, 1, 0.7333333, 0, 1,
-1.2186, -0.1533256, -1.712557, 1, 0.7372549, 0, 1,
-1.210201, 0.7087249, 0.496427, 1, 0.7450981, 0, 1,
-1.20691, -1.538931, -3.211891, 1, 0.7490196, 0, 1,
-1.201406, 0.4104857, 0.6857736, 1, 0.7568628, 0, 1,
-1.200209, 0.6081611, 0.02506791, 1, 0.7607843, 0, 1,
-1.196663, 0.4139998, -0.2818354, 1, 0.7686275, 0, 1,
-1.191311, 0.8699415, -0.05565677, 1, 0.772549, 0, 1,
-1.187107, 1.100022, 0.1586658, 1, 0.7803922, 0, 1,
-1.185755, -1.072655, -0.7879257, 1, 0.7843137, 0, 1,
-1.181283, -0.5973902, -1.300566, 1, 0.7921569, 0, 1,
-1.17818, 0.09644006, -2.073306, 1, 0.7960784, 0, 1,
-1.174255, -0.06120235, -0.2778345, 1, 0.8039216, 0, 1,
-1.169924, -0.1474923, -1.782053, 1, 0.8117647, 0, 1,
-1.169479, 0.8170467, -0.9750935, 1, 0.8156863, 0, 1,
-1.162143, 0.2355951, -2.844565, 1, 0.8235294, 0, 1,
-1.153034, -0.5787268, -0.9442564, 1, 0.827451, 0, 1,
-1.150839, -1.010431, -2.358155, 1, 0.8352941, 0, 1,
-1.149589, 1.823991, -0.6305774, 1, 0.8392157, 0, 1,
-1.146451, 1.890738, 0.3218744, 1, 0.8470588, 0, 1,
-1.142779, 0.2822981, -0.4170621, 1, 0.8509804, 0, 1,
-1.139874, -1.484531, -1.785321, 1, 0.8588235, 0, 1,
-1.129607, 0.2215375, -0.8168896, 1, 0.8627451, 0, 1,
-1.125317, -1.259232, -3.323394, 1, 0.8705882, 0, 1,
-1.121768, -0.9388105, -3.223176, 1, 0.8745098, 0, 1,
-1.107586, 0.2180808, -2.657001, 1, 0.8823529, 0, 1,
-1.094529, 0.9577489, -1.584798, 1, 0.8862745, 0, 1,
-1.092958, -2.267242, -3.234815, 1, 0.8941177, 0, 1,
-1.086034, 1.080272, -1.10391, 1, 0.8980392, 0, 1,
-1.085816, 0.592567, -2.352721, 1, 0.9058824, 0, 1,
-1.082756, 1.206576, 0.1579746, 1, 0.9137255, 0, 1,
-1.071258, -1.28967, -2.614995, 1, 0.9176471, 0, 1,
-1.069049, -0.3309499, -0.7890014, 1, 0.9254902, 0, 1,
-1.056722, 1.667287, -0.686852, 1, 0.9294118, 0, 1,
-1.055123, 0.5425007, -2.101233, 1, 0.9372549, 0, 1,
-1.053398, -0.6577816, -3.262601, 1, 0.9411765, 0, 1,
-1.053155, 0.1584405, -1.863849, 1, 0.9490196, 0, 1,
-1.050146, -0.9644942, -1.977077, 1, 0.9529412, 0, 1,
-1.046599, -1.35556, -2.219601, 1, 0.9607843, 0, 1,
-1.045677, 0.7724482, -1.282922, 1, 0.9647059, 0, 1,
-1.042265, -1.255184, -2.283851, 1, 0.972549, 0, 1,
-1.031853, 1.870436, -1.102866, 1, 0.9764706, 0, 1,
-1.023278, -0.1045411, -2.155935, 1, 0.9843137, 0, 1,
-1.021446, 0.1456053, -2.559184, 1, 0.9882353, 0, 1,
-1.004481, 1.997266, -1.138348, 1, 0.9960784, 0, 1,
-1.000408, -0.01457923, -0.6784471, 0.9960784, 1, 0, 1,
-0.9985471, -0.1085763, -1.693575, 0.9921569, 1, 0, 1,
-0.9900606, 1.441872, -0.1967638, 0.9843137, 1, 0, 1,
-0.9783453, 0.374585, -1.004955, 0.9803922, 1, 0, 1,
-0.9732287, -0.493939, -0.9909375, 0.972549, 1, 0, 1,
-0.9666741, -0.6748819, -1.364961, 0.9686275, 1, 0, 1,
-0.9528824, -0.007442478, -1.310923, 0.9607843, 1, 0, 1,
-0.9503553, 0.1297468, -1.119368, 0.9568627, 1, 0, 1,
-0.9435843, -1.030351, -2.751962, 0.9490196, 1, 0, 1,
-0.9392532, -0.1427539, -1.454823, 0.945098, 1, 0, 1,
-0.9387136, -1.236723, -1.989354, 0.9372549, 1, 0, 1,
-0.9340889, -1.651298, -1.398742, 0.9333333, 1, 0, 1,
-0.928031, -0.8251253, -3.491597, 0.9254902, 1, 0, 1,
-0.9266192, 0.502297, -0.456526, 0.9215686, 1, 0, 1,
-0.9246432, 0.04508019, -0.9448785, 0.9137255, 1, 0, 1,
-0.9198437, 0.2628112, -1.758549, 0.9098039, 1, 0, 1,
-0.9185134, 0.6148347, -1.328055, 0.9019608, 1, 0, 1,
-0.9177159, -0.7096056, -2.108051, 0.8941177, 1, 0, 1,
-0.9168438, 1.42914, -1.509133, 0.8901961, 1, 0, 1,
-0.9141485, -0.2765213, -2.860248, 0.8823529, 1, 0, 1,
-0.9128169, -0.3166704, -3.711239, 0.8784314, 1, 0, 1,
-0.9109903, 0.8191795, -0.8729166, 0.8705882, 1, 0, 1,
-0.9102543, 0.4257294, -0.1981654, 0.8666667, 1, 0, 1,
-0.9071262, -1.900804, -2.255947, 0.8588235, 1, 0, 1,
-0.9046748, 1.847759, 0.6059021, 0.854902, 1, 0, 1,
-0.8913808, 0.3241477, -0.8741248, 0.8470588, 1, 0, 1,
-0.8865998, 2.589024, 1.208803, 0.8431373, 1, 0, 1,
-0.871465, -0.805517, -2.677974, 0.8352941, 1, 0, 1,
-0.865361, -0.7910917, -2.860373, 0.8313726, 1, 0, 1,
-0.8649926, -0.4445735, -0.9713243, 0.8235294, 1, 0, 1,
-0.863414, 1.700549, 1.183459, 0.8196079, 1, 0, 1,
-0.8474237, 1.063973, 0.7905414, 0.8117647, 1, 0, 1,
-0.8459473, 1.608192, -0.8270332, 0.8078431, 1, 0, 1,
-0.8426607, 1.498846, -0.3272432, 0.8, 1, 0, 1,
-0.8351967, 0.3192349, -1.442412, 0.7921569, 1, 0, 1,
-0.8280941, -1.088759, -2.99362, 0.7882353, 1, 0, 1,
-0.8279522, -0.2655043, -2.094714, 0.7803922, 1, 0, 1,
-0.8260077, 0.6253982, 0.1279922, 0.7764706, 1, 0, 1,
-0.8241351, -0.1251004, -1.522665, 0.7686275, 1, 0, 1,
-0.8236645, -0.01265719, -2.050807, 0.7647059, 1, 0, 1,
-0.8225392, -0.4053833, -3.267282, 0.7568628, 1, 0, 1,
-0.8208399, -1.361675, -1.43363, 0.7529412, 1, 0, 1,
-0.8198273, 0.3047667, -3.386799, 0.7450981, 1, 0, 1,
-0.8183598, 0.7764322, -1.78658, 0.7411765, 1, 0, 1,
-0.8153515, 0.6481863, -1.228921, 0.7333333, 1, 0, 1,
-0.8093508, -0.80728, -1.973694, 0.7294118, 1, 0, 1,
-0.8092644, 0.7390547, -1.541856, 0.7215686, 1, 0, 1,
-0.7992746, -1.087946, -2.89264, 0.7176471, 1, 0, 1,
-0.7760123, 1.261227, 0.6418244, 0.7098039, 1, 0, 1,
-0.7737062, 0.9631354, -0.2062381, 0.7058824, 1, 0, 1,
-0.7721621, 0.4610618, -0.2063663, 0.6980392, 1, 0, 1,
-0.768684, -2.07366, -3.989182, 0.6901961, 1, 0, 1,
-0.7660904, -1.36741, -2.267444, 0.6862745, 1, 0, 1,
-0.7655952, 0.6697519, -1.299275, 0.6784314, 1, 0, 1,
-0.7645559, 0.7631586, 1.173275, 0.6745098, 1, 0, 1,
-0.7642119, -0.5685351, -1.669535, 0.6666667, 1, 0, 1,
-0.763209, -0.6691992, -2.91243, 0.6627451, 1, 0, 1,
-0.7608215, 0.2433678, -1.160728, 0.654902, 1, 0, 1,
-0.7528764, 0.2252704, -0.7562189, 0.6509804, 1, 0, 1,
-0.7497697, -0.9962209, -2.936338, 0.6431373, 1, 0, 1,
-0.7481315, 1.696797, -0.3684375, 0.6392157, 1, 0, 1,
-0.7426727, 0.1868495, -0.9020395, 0.6313726, 1, 0, 1,
-0.7383927, -1.618971, -1.093107, 0.627451, 1, 0, 1,
-0.7287309, 1.096461, -0.584677, 0.6196079, 1, 0, 1,
-0.7257221, -0.5090863, -1.921153, 0.6156863, 1, 0, 1,
-0.7243217, -1.192644, -2.477878, 0.6078432, 1, 0, 1,
-0.7228243, 1.022566, -0.8354926, 0.6039216, 1, 0, 1,
-0.7216603, -0.4676256, 0.2053706, 0.5960785, 1, 0, 1,
-0.7202977, 0.2540257, -2.01476, 0.5882353, 1, 0, 1,
-0.7200647, 1.027166, 1.176453, 0.5843138, 1, 0, 1,
-0.7146905, 0.2844941, -0.5363411, 0.5764706, 1, 0, 1,
-0.7126689, 0.7936439, -2.734898, 0.572549, 1, 0, 1,
-0.711655, -0.2038005, -2.762219, 0.5647059, 1, 0, 1,
-0.7105172, -1.061274, -2.661044, 0.5607843, 1, 0, 1,
-0.704708, -1.200673, -2.704583, 0.5529412, 1, 0, 1,
-0.7040196, -1.363908, -3.219475, 0.5490196, 1, 0, 1,
-0.7023804, 0.02654944, -1.604037, 0.5411765, 1, 0, 1,
-0.6995705, -1.417549, -3.835101, 0.5372549, 1, 0, 1,
-0.6939931, 1.363135, 0.4125744, 0.5294118, 1, 0, 1,
-0.6937351, -2.057602, -2.91326, 0.5254902, 1, 0, 1,
-0.6923322, -0.2152075, -1.798392, 0.5176471, 1, 0, 1,
-0.6884795, 0.4941614, 0.01582093, 0.5137255, 1, 0, 1,
-0.6837986, 0.4779108, 0.9141065, 0.5058824, 1, 0, 1,
-0.6805604, 1.562247, -1.352299, 0.5019608, 1, 0, 1,
-0.6801345, -0.8272541, -3.419366, 0.4941176, 1, 0, 1,
-0.6726018, -1.67322, -2.13875, 0.4862745, 1, 0, 1,
-0.6724634, -0.8804207, -1.667045, 0.4823529, 1, 0, 1,
-0.6698987, -0.8289075, -4.202628, 0.4745098, 1, 0, 1,
-0.6665443, -0.2301963, -2.005809, 0.4705882, 1, 0, 1,
-0.6661262, 1.921222, -0.6053157, 0.4627451, 1, 0, 1,
-0.665703, 0.606686, -0.01440852, 0.4588235, 1, 0, 1,
-0.6648686, 0.2554775, -1.820832, 0.4509804, 1, 0, 1,
-0.6646734, 0.1637549, -0.8228559, 0.4470588, 1, 0, 1,
-0.6624612, -1.922265, -3.053776, 0.4392157, 1, 0, 1,
-0.6599553, 0.4441377, 0.2009869, 0.4352941, 1, 0, 1,
-0.6563649, -0.01407786, -0.4516123, 0.427451, 1, 0, 1,
-0.6499513, 0.418825, -1.694693, 0.4235294, 1, 0, 1,
-0.6448966, -0.8464628, -1.664096, 0.4156863, 1, 0, 1,
-0.6446575, 0.07276016, -1.444448, 0.4117647, 1, 0, 1,
-0.6416498, -1.709849, -1.64168, 0.4039216, 1, 0, 1,
-0.6397917, 0.3572278, -1.711225, 0.3960784, 1, 0, 1,
-0.6391135, -2.901804, -2.941454, 0.3921569, 1, 0, 1,
-0.638629, 1.175614, 0.2405952, 0.3843137, 1, 0, 1,
-0.6366422, 1.34218, 0.5903796, 0.3803922, 1, 0, 1,
-0.6298621, 0.988853, -1.429253, 0.372549, 1, 0, 1,
-0.6249339, -1.14853, -2.256627, 0.3686275, 1, 0, 1,
-0.6142178, -1.748162, -3.652206, 0.3607843, 1, 0, 1,
-0.6134185, -0.3331768, -3.721527, 0.3568628, 1, 0, 1,
-0.6003552, -0.6549051, -2.969038, 0.3490196, 1, 0, 1,
-0.5999919, -0.9366507, -2.963468, 0.345098, 1, 0, 1,
-0.59982, 1.389796, -0.2501449, 0.3372549, 1, 0, 1,
-0.5981055, 1.570925, -1.466778, 0.3333333, 1, 0, 1,
-0.5965207, 0.9328023, -1.79642, 0.3254902, 1, 0, 1,
-0.5920907, 0.1748984, -1.415985, 0.3215686, 1, 0, 1,
-0.5897426, -0.5892219, -2.874087, 0.3137255, 1, 0, 1,
-0.5883193, 0.5931173, -0.6825147, 0.3098039, 1, 0, 1,
-0.5860003, 0.1539338, -1.368487, 0.3019608, 1, 0, 1,
-0.582725, 1.039558, 0.7096654, 0.2941177, 1, 0, 1,
-0.5801546, 0.8111511, -1.85297, 0.2901961, 1, 0, 1,
-0.5655574, 0.9958254, -0.3448989, 0.282353, 1, 0, 1,
-0.5612243, 0.8722159, -0.5383732, 0.2784314, 1, 0, 1,
-0.555837, 0.9731968, -0.2740427, 0.2705882, 1, 0, 1,
-0.5540591, -0.4706777, -3.134117, 0.2666667, 1, 0, 1,
-0.549877, 0.139789, -2.953372, 0.2588235, 1, 0, 1,
-0.5485276, -0.1869933, -1.950233, 0.254902, 1, 0, 1,
-0.547293, -0.3545775, -0.9277563, 0.2470588, 1, 0, 1,
-0.5464432, -0.3273285, -1.896958, 0.2431373, 1, 0, 1,
-0.5445709, -0.5201468, -1.283885, 0.2352941, 1, 0, 1,
-0.5420409, 0.7521377, 1.921676, 0.2313726, 1, 0, 1,
-0.5393518, 1.956786, 0.2067972, 0.2235294, 1, 0, 1,
-0.5379465, 0.7408237, -0.06706931, 0.2196078, 1, 0, 1,
-0.5329894, 0.2821467, -0.5188299, 0.2117647, 1, 0, 1,
-0.5244744, -1.18594, -3.566968, 0.2078431, 1, 0, 1,
-0.5241412, -0.8958234, -1.831833, 0.2, 1, 0, 1,
-0.5226397, -0.9814061, -2.821559, 0.1921569, 1, 0, 1,
-0.5191512, 1.4888, 0.9456269, 0.1882353, 1, 0, 1,
-0.5147637, 0.0745009, -1.046404, 0.1803922, 1, 0, 1,
-0.5144345, 0.6792266, 0.5071877, 0.1764706, 1, 0, 1,
-0.513093, 0.1129, -2.110097, 0.1686275, 1, 0, 1,
-0.5124303, -1.442807, -3.961879, 0.1647059, 1, 0, 1,
-0.5116383, -1.184448, -2.518838, 0.1568628, 1, 0, 1,
-0.5078857, -0.3295882, -2.261148, 0.1529412, 1, 0, 1,
-0.5032597, -1.993236, -2.687108, 0.145098, 1, 0, 1,
-0.5020503, 0.5197868, -0.4095953, 0.1411765, 1, 0, 1,
-0.4994588, -0.9773768, -2.011501, 0.1333333, 1, 0, 1,
-0.4925325, -0.9481962, -2.912567, 0.1294118, 1, 0, 1,
-0.4916543, -0.4414306, -2.776758, 0.1215686, 1, 0, 1,
-0.4915102, 1.918311, -2.097996, 0.1176471, 1, 0, 1,
-0.4899924, 0.2652298, 0.7832975, 0.1098039, 1, 0, 1,
-0.4884121, -1.294647, -3.707363, 0.1058824, 1, 0, 1,
-0.488276, 0.8681221, -1.397287, 0.09803922, 1, 0, 1,
-0.4776794, -0.6649241, -2.600734, 0.09019608, 1, 0, 1,
-0.4770754, -0.24358, -1.552214, 0.08627451, 1, 0, 1,
-0.4746148, -2.458699, -3.528769, 0.07843138, 1, 0, 1,
-0.4745268, -1.088264, -3.715106, 0.07450981, 1, 0, 1,
-0.4745089, -0.9552747, -2.720754, 0.06666667, 1, 0, 1,
-0.4668311, -1.04615, -2.135544, 0.0627451, 1, 0, 1,
-0.4636067, 0.07146359, -1.242844, 0.05490196, 1, 0, 1,
-0.4586561, 0.3661065, -0.8634781, 0.05098039, 1, 0, 1,
-0.4574776, 1.096397, -1.386284, 0.04313726, 1, 0, 1,
-0.4526605, -1.440275, -3.222441, 0.03921569, 1, 0, 1,
-0.4523849, -0.2580921, -1.299707, 0.03137255, 1, 0, 1,
-0.450603, 0.3951725, -1.815954, 0.02745098, 1, 0, 1,
-0.4490583, 0.9228593, 0.9016919, 0.01960784, 1, 0, 1,
-0.4428579, 0.284557, -1.724239, 0.01568628, 1, 0, 1,
-0.4367944, 1.72387, -0.7051692, 0.007843138, 1, 0, 1,
-0.4263388, -0.2338779, -2.796125, 0.003921569, 1, 0, 1,
-0.4262476, 0.4155658, -1.831529, 0, 1, 0.003921569, 1,
-0.4227479, -0.6341377, -3.708876, 0, 1, 0.01176471, 1,
-0.4191387, -0.4082015, -1.573465, 0, 1, 0.01568628, 1,
-0.4186765, 0.6948579, -1.083638, 0, 1, 0.02352941, 1,
-0.4155513, -0.475808, -2.154413, 0, 1, 0.02745098, 1,
-0.4107812, 1.37541, -1.414238, 0, 1, 0.03529412, 1,
-0.4102328, -1.269718, -3.562768, 0, 1, 0.03921569, 1,
-0.4080692, -3.763239, -2.134917, 0, 1, 0.04705882, 1,
-0.4080407, -0.6187489, -1.530361, 0, 1, 0.05098039, 1,
-0.4065683, -1.783993, -3.266309, 0, 1, 0.05882353, 1,
-0.4018618, -1.344671, -4.532533, 0, 1, 0.0627451, 1,
-0.4007192, 1.225624, 0.4349212, 0, 1, 0.07058824, 1,
-0.3997804, -0.7022342, -1.200216, 0, 1, 0.07450981, 1,
-0.3969648, -0.02420183, -2.111565, 0, 1, 0.08235294, 1,
-0.3968945, -1.156484, -2.816244, 0, 1, 0.08627451, 1,
-0.3951676, 0.2387498, 0.1961456, 0, 1, 0.09411765, 1,
-0.3891577, -0.05972748, -2.00519, 0, 1, 0.1019608, 1,
-0.3876218, 1.143938, -0.7442231, 0, 1, 0.1058824, 1,
-0.3864722, 0.8003183, -0.3074322, 0, 1, 0.1137255, 1,
-0.3829313, 0.8193333, -0.2928827, 0, 1, 0.1176471, 1,
-0.3821677, 0.3487439, -0.5568057, 0, 1, 0.1254902, 1,
-0.3821055, 1.950713, 0.3928128, 0, 1, 0.1294118, 1,
-0.3801163, -1.910686, -1.436585, 0, 1, 0.1372549, 1,
-0.3716821, 1.765076, -2.382486, 0, 1, 0.1411765, 1,
-0.3663634, 0.1911509, -0.882923, 0, 1, 0.1490196, 1,
-0.3638522, -0.2840994, -2.948022, 0, 1, 0.1529412, 1,
-0.3629559, 1.822133, -0.3587941, 0, 1, 0.1607843, 1,
-0.3609384, -0.5743908, -3.10756, 0, 1, 0.1647059, 1,
-0.3589738, -1.746619, -2.28972, 0, 1, 0.172549, 1,
-0.3589462, 0.4610777, -1.21777, 0, 1, 0.1764706, 1,
-0.3585568, -0.7510433, -4.881876, 0, 1, 0.1843137, 1,
-0.3467072, -0.07055269, -1.093668, 0, 1, 0.1882353, 1,
-0.3380935, 0.08196443, -1.079415, 0, 1, 0.1960784, 1,
-0.3372453, 0.07967311, -0.207975, 0, 1, 0.2039216, 1,
-0.3363172, -0.3951332, -1.441614, 0, 1, 0.2078431, 1,
-0.333598, 1.563533, 1.444882, 0, 1, 0.2156863, 1,
-0.3335541, 0.05194402, -0.4603083, 0, 1, 0.2196078, 1,
-0.3334028, 0.8986156, -1.921362, 0, 1, 0.227451, 1,
-0.3310193, -0.8248215, -2.278313, 0, 1, 0.2313726, 1,
-0.3256964, -1.659032, -2.573429, 0, 1, 0.2392157, 1,
-0.3234297, -1.197766, -0.2390314, 0, 1, 0.2431373, 1,
-0.3200697, 0.1703306, -1.129034, 0, 1, 0.2509804, 1,
-0.3195798, 1.244717, -1.064626, 0, 1, 0.254902, 1,
-0.3168968, 1.122182, -1.011366, 0, 1, 0.2627451, 1,
-0.3157324, 0.1649338, -0.6469851, 0, 1, 0.2666667, 1,
-0.3156861, -0.4085368, -2.681469, 0, 1, 0.2745098, 1,
-0.3136473, -1.164858, -3.219028, 0, 1, 0.2784314, 1,
-0.3102693, -1.486503, -0.6480337, 0, 1, 0.2862745, 1,
-0.3042014, 0.09547199, -1.539962, 0, 1, 0.2901961, 1,
-0.3030182, 1.510461, 0.3798012, 0, 1, 0.2980392, 1,
-0.2982824, 2.271962, -0.2025631, 0, 1, 0.3058824, 1,
-0.2944067, 1.077912, -1.337032, 0, 1, 0.3098039, 1,
-0.2845119, -0.03583809, -0.9332314, 0, 1, 0.3176471, 1,
-0.2832917, -0.64679, -1.403729, 0, 1, 0.3215686, 1,
-0.28251, 1.657614, -0.3410109, 0, 1, 0.3294118, 1,
-0.2733805, 0.4154701, 2.068806, 0, 1, 0.3333333, 1,
-0.2709775, -0.3857954, -2.718142, 0, 1, 0.3411765, 1,
-0.2700859, 0.4086354, -1.363765, 0, 1, 0.345098, 1,
-0.2660368, -0.07667729, -1.191053, 0, 1, 0.3529412, 1,
-0.2598518, -0.08720415, -1.072605, 0, 1, 0.3568628, 1,
-0.2581735, 0.2034976, -1.309444, 0, 1, 0.3647059, 1,
-0.2577045, 0.1976161, -2.698913, 0, 1, 0.3686275, 1,
-0.2565848, 0.4330815, 0.8018828, 0, 1, 0.3764706, 1,
-0.2565449, -0.5707537, -3.036475, 0, 1, 0.3803922, 1,
-0.2554519, -0.4219635, -2.929298, 0, 1, 0.3882353, 1,
-0.2539198, 1.029606, -2.034135, 0, 1, 0.3921569, 1,
-0.2435755, 1.627627, -0.1416484, 0, 1, 0.4, 1,
-0.2433984, -1.091522, -2.277065, 0, 1, 0.4078431, 1,
-0.240203, -0.5103372, -3.312553, 0, 1, 0.4117647, 1,
-0.2364625, 1.639683, -0.2045149, 0, 1, 0.4196078, 1,
-0.2299741, -0.6462541, -1.186897, 0, 1, 0.4235294, 1,
-0.2186229, -1.302448, -2.831736, 0, 1, 0.4313726, 1,
-0.2173704, 0.4638841, -0.3350861, 0, 1, 0.4352941, 1,
-0.2137471, 0.165263, -1.248521, 0, 1, 0.4431373, 1,
-0.2104738, -0.6320714, -3.344541, 0, 1, 0.4470588, 1,
-0.2095906, -0.9904501, -3.871684, 0, 1, 0.454902, 1,
-0.2075183, -0.4677968, -2.905194, 0, 1, 0.4588235, 1,
-0.2017756, -0.2154316, -3.359547, 0, 1, 0.4666667, 1,
-0.2003415, -1.482152, -3.499328, 0, 1, 0.4705882, 1,
-0.1968945, -0.6469647, -3.121296, 0, 1, 0.4784314, 1,
-0.1967783, 0.9903857, 0.4786137, 0, 1, 0.4823529, 1,
-0.1959207, -2.175548, -1.474079, 0, 1, 0.4901961, 1,
-0.194274, -0.3864724, -0.9479207, 0, 1, 0.4941176, 1,
-0.1889349, 0.2589764, -0.9336385, 0, 1, 0.5019608, 1,
-0.1866394, 1.548919, 0.02472691, 0, 1, 0.509804, 1,
-0.1844198, 2.53247, 1.92412, 0, 1, 0.5137255, 1,
-0.1651338, 0.5168046, 1.028037, 0, 1, 0.5215687, 1,
-0.1645339, -0.1311215, -2.085275, 0, 1, 0.5254902, 1,
-0.1528143, 0.7879492, 0.4876492, 0, 1, 0.5333334, 1,
-0.1469984, 0.4068764, -1.306658, 0, 1, 0.5372549, 1,
-0.1415656, -0.02036748, -2.676447, 0, 1, 0.5450981, 1,
-0.1356251, 0.3841473, -0.5999973, 0, 1, 0.5490196, 1,
-0.1333243, 0.9596312, -0.3821834, 0, 1, 0.5568628, 1,
-0.1316269, 1.576514, -0.8065948, 0, 1, 0.5607843, 1,
-0.1311024, -0.1866861, -1.247524, 0, 1, 0.5686275, 1,
-0.1305658, 0.9435263, -1.446373, 0, 1, 0.572549, 1,
-0.1262751, 0.3082974, 0.6302827, 0, 1, 0.5803922, 1,
-0.1258182, -0.0298259, -1.427719, 0, 1, 0.5843138, 1,
-0.1250734, -0.5335857, -1.560839, 0, 1, 0.5921569, 1,
-0.118149, -0.9330439, -3.440694, 0, 1, 0.5960785, 1,
-0.1178369, -0.7463635, -1.923792, 0, 1, 0.6039216, 1,
-0.1167547, -0.7254424, -1.192083, 0, 1, 0.6117647, 1,
-0.1165394, -0.002155899, -2.698009, 0, 1, 0.6156863, 1,
-0.1148429, 1.002399, -0.5261272, 0, 1, 0.6235294, 1,
-0.1146787, 1.552315, 0.2625516, 0, 1, 0.627451, 1,
-0.1126671, -0.4170179, -2.494575, 0, 1, 0.6352941, 1,
-0.1112463, 1.36551, 0.295461, 0, 1, 0.6392157, 1,
-0.1108602, 1.017972, 1.06376, 0, 1, 0.6470588, 1,
-0.1019828, -0.4158407, -1.849678, 0, 1, 0.6509804, 1,
-0.09892352, 0.7287452, 2.002644, 0, 1, 0.6588235, 1,
-0.09239119, 1.359503, -0.108085, 0, 1, 0.6627451, 1,
-0.09204216, 0.8848267, 0.5853415, 0, 1, 0.6705883, 1,
-0.09168331, 0.07156099, 1.205762, 0, 1, 0.6745098, 1,
-0.08863489, 0.8004066, -0.6632336, 0, 1, 0.682353, 1,
-0.0857545, -1.00172, -3.20891, 0, 1, 0.6862745, 1,
-0.08331569, -0.1303226, -1.247817, 0, 1, 0.6941177, 1,
-0.08329955, -0.5831914, -3.710119, 0, 1, 0.7019608, 1,
-0.08001362, -0.3304987, -1.628129, 0, 1, 0.7058824, 1,
-0.0759237, 0.2704648, -1.484292, 0, 1, 0.7137255, 1,
-0.0732569, 0.1283812, 0.1697273, 0, 1, 0.7176471, 1,
-0.06848856, -1.228478, -2.940956, 0, 1, 0.7254902, 1,
-0.06654781, -0.05909096, -2.801645, 0, 1, 0.7294118, 1,
-0.06450965, -0.7789124, -3.858835, 0, 1, 0.7372549, 1,
-0.06434591, -1.175477, -0.7166579, 0, 1, 0.7411765, 1,
-0.06373502, -0.3701351, -1.418051, 0, 1, 0.7490196, 1,
-0.06354921, 0.4896138, -0.1710754, 0, 1, 0.7529412, 1,
-0.05873065, -0.7310116, -3.664119, 0, 1, 0.7607843, 1,
-0.05701178, 0.214154, 0.350174, 0, 1, 0.7647059, 1,
-0.05598645, -0.3960629, -2.924865, 0, 1, 0.772549, 1,
-0.05523979, 0.5494042, 1.366255, 0, 1, 0.7764706, 1,
-0.05346343, -0.6451654, -0.303691, 0, 1, 0.7843137, 1,
-0.05095683, -0.3725736, -2.191338, 0, 1, 0.7882353, 1,
-0.04912612, -0.8502802, -2.937162, 0, 1, 0.7960784, 1,
-0.0442819, -0.2740671, -3.290525, 0, 1, 0.8039216, 1,
-0.04141221, 0.3502358, 1.241925, 0, 1, 0.8078431, 1,
-0.03778651, 0.6553465, -0.2049435, 0, 1, 0.8156863, 1,
-0.03650201, 0.7002494, 0.9161603, 0, 1, 0.8196079, 1,
-0.03489014, 1.045749, 0.2666803, 0, 1, 0.827451, 1,
-0.03271418, -0.3793174, -1.472495, 0, 1, 0.8313726, 1,
-0.03110938, -0.6395491, -2.580277, 0, 1, 0.8392157, 1,
-0.03050723, 0.6174632, -0.5405334, 0, 1, 0.8431373, 1,
-0.0261609, -1.560902, -3.703341, 0, 1, 0.8509804, 1,
-0.02480167, -0.3221636, -2.888849, 0, 1, 0.854902, 1,
-0.02225436, -1.731864, -2.143833, 0, 1, 0.8627451, 1,
-0.0218522, 0.4711676, 0.654981, 0, 1, 0.8666667, 1,
-0.02100956, -1.004209, -2.990174, 0, 1, 0.8745098, 1,
-0.02058426, -1.351733, -3.944734, 0, 1, 0.8784314, 1,
-0.0201064, 0.3943323, -0.3182754, 0, 1, 0.8862745, 1,
-0.01699466, 1.00125, -0.5350483, 0, 1, 0.8901961, 1,
-0.01390163, -0.2258198, -1.533573, 0, 1, 0.8980392, 1,
-0.01122931, -1.259693, -3.696139, 0, 1, 0.9058824, 1,
-0.008810919, 0.5870351, -1.770041, 0, 1, 0.9098039, 1,
-0.008391705, 1.492062, -1.982899, 0, 1, 0.9176471, 1,
-0.00525285, 1.098671, -0.3634191, 0, 1, 0.9215686, 1,
-0.004585776, 1.346548, 0.3812415, 0, 1, 0.9294118, 1,
-0.003669183, 0.362684, -0.514174, 0, 1, 0.9333333, 1,
-0.002762274, -0.7653067, -2.847039, 0, 1, 0.9411765, 1,
-0.001703174, 0.2044212, -0.3851025, 0, 1, 0.945098, 1,
-0.0003567967, -1.212645, -1.716282, 0, 1, 0.9529412, 1,
0.001705416, -0.5458351, 2.173496, 0, 1, 0.9568627, 1,
0.002638197, -1.567011, 3.302807, 0, 1, 0.9647059, 1,
0.006099815, 0.03498682, 2.244232, 0, 1, 0.9686275, 1,
0.008650455, 2.667373, -1.60491, 0, 1, 0.9764706, 1,
0.009543159, -2.233203, 3.317592, 0, 1, 0.9803922, 1,
0.01182213, 1.729374, -0.3084482, 0, 1, 0.9882353, 1,
0.0157162, -1.198192, 3.765627, 0, 1, 0.9921569, 1,
0.02061608, 0.3255784, -0.1393538, 0, 1, 1, 1,
0.03362304, 1.038577, 0.6774278, 0, 0.9921569, 1, 1,
0.03690951, 0.9020026, 1.096412, 0, 0.9882353, 1, 1,
0.04460164, 1.142484, -1.002383, 0, 0.9803922, 1, 1,
0.04612064, -0.4514959, 3.175102, 0, 0.9764706, 1, 1,
0.0514999, 1.798908, 0.5207291, 0, 0.9686275, 1, 1,
0.05447149, -1.214482, 3.759456, 0, 0.9647059, 1, 1,
0.05592779, -1.945222, 4.586801, 0, 0.9568627, 1, 1,
0.06078656, -0.1225848, 3.15671, 0, 0.9529412, 1, 1,
0.06573589, 2.507167, 1.300962, 0, 0.945098, 1, 1,
0.06894007, 1.419303, 1.054042, 0, 0.9411765, 1, 1,
0.06973154, 2.196543, 0.1998976, 0, 0.9333333, 1, 1,
0.0746203, 0.09191249, 1.726687, 0, 0.9294118, 1, 1,
0.08039961, -0.4899072, 0.5595722, 0, 0.9215686, 1, 1,
0.08070189, -0.5053172, 2.217867, 0, 0.9176471, 1, 1,
0.0807735, 0.1785316, 1.782911, 0, 0.9098039, 1, 1,
0.08109546, -0.898036, 4.057978, 0, 0.9058824, 1, 1,
0.08597422, 1.174482, 0.7831334, 0, 0.8980392, 1, 1,
0.08838305, -0.95895, 1.795256, 0, 0.8901961, 1, 1,
0.08898736, 1.126106, 1.159843, 0, 0.8862745, 1, 1,
0.09045682, 0.5927426, 0.2137084, 0, 0.8784314, 1, 1,
0.09168173, 0.7447261, 0.7500508, 0, 0.8745098, 1, 1,
0.09192769, -0.3018799, 3.026593, 0, 0.8666667, 1, 1,
0.09484633, -0.3074644, 2.620556, 0, 0.8627451, 1, 1,
0.09614682, -1.468873, 2.239982, 0, 0.854902, 1, 1,
0.1016312, -1.886936, 3.808513, 0, 0.8509804, 1, 1,
0.1022639, 0.2245706, 0.4203038, 0, 0.8431373, 1, 1,
0.1063678, 1.028797, -0.4739155, 0, 0.8392157, 1, 1,
0.1077437, -1.404494, 4.103664, 0, 0.8313726, 1, 1,
0.1106754, 0.5721892, 0.5573559, 0, 0.827451, 1, 1,
0.1116118, -0.6409981, 2.108624, 0, 0.8196079, 1, 1,
0.1130507, -0.3569147, 3.894661, 0, 0.8156863, 1, 1,
0.1140138, 0.4441662, -1.018331, 0, 0.8078431, 1, 1,
0.1154746, -0.0196855, 1.283285, 0, 0.8039216, 1, 1,
0.1155481, -0.122894, 0.8725501, 0, 0.7960784, 1, 1,
0.1191308, -1.252416, 3.512913, 0, 0.7882353, 1, 1,
0.1200741, 0.468609, 1.194558, 0, 0.7843137, 1, 1,
0.1237034, 0.06844839, 1.43243, 0, 0.7764706, 1, 1,
0.1256201, 0.1851168, -1.291985, 0, 0.772549, 1, 1,
0.1303436, 0.9975847, -2.024826, 0, 0.7647059, 1, 1,
0.1341423, -0.4759194, 1.296101, 0, 0.7607843, 1, 1,
0.1345278, -0.4116067, 1.113113, 0, 0.7529412, 1, 1,
0.134916, -2.272267, 2.68281, 0, 0.7490196, 1, 1,
0.1382074, 1.303705, 1.083172, 0, 0.7411765, 1, 1,
0.1412717, 1.00734, -0.2016397, 0, 0.7372549, 1, 1,
0.1429868, -0.8123493, 3.372958, 0, 0.7294118, 1, 1,
0.1435831, -0.726842, 1.692704, 0, 0.7254902, 1, 1,
0.1447715, -0.08626517, 1.894212, 0, 0.7176471, 1, 1,
0.1457884, 0.2174246, 1.182412, 0, 0.7137255, 1, 1,
0.1466318, 2.177093, 1.158467, 0, 0.7058824, 1, 1,
0.1553644, 1.718002, -0.8645365, 0, 0.6980392, 1, 1,
0.1620925, -0.2230759, 1.727376, 0, 0.6941177, 1, 1,
0.1649698, -0.952719, 2.429591, 0, 0.6862745, 1, 1,
0.1669098, -1.029762, 3.225646, 0, 0.682353, 1, 1,
0.1681536, 1.024865, 0.4514563, 0, 0.6745098, 1, 1,
0.1684811, -0.5228409, 2.390611, 0, 0.6705883, 1, 1,
0.169548, -0.3636223, 2.360008, 0, 0.6627451, 1, 1,
0.1696525, 0.3922426, 0.6951442, 0, 0.6588235, 1, 1,
0.1791345, 0.7847303, -0.2235825, 0, 0.6509804, 1, 1,
0.1792689, -0.6957373, 3.76397, 0, 0.6470588, 1, 1,
0.1793324, 0.02051685, 1.536025, 0, 0.6392157, 1, 1,
0.1884722, -0.9834635, 3.309391, 0, 0.6352941, 1, 1,
0.1920802, 0.6691391, 0.6942755, 0, 0.627451, 1, 1,
0.195888, -0.3770387, 3.580105, 0, 0.6235294, 1, 1,
0.2008435, 0.1308785, -0.2755768, 0, 0.6156863, 1, 1,
0.203309, 0.4770211, 0.7859502, 0, 0.6117647, 1, 1,
0.2054913, -0.8597174, 4.372186, 0, 0.6039216, 1, 1,
0.2067531, 1.102686, 0.3359028, 0, 0.5960785, 1, 1,
0.2081359, -1.298883, 4.609117, 0, 0.5921569, 1, 1,
0.2084016, 0.2379985, 0.5744093, 0, 0.5843138, 1, 1,
0.2085555, -0.9114651, 4.048364, 0, 0.5803922, 1, 1,
0.2090299, 0.4273493, 1.043131, 0, 0.572549, 1, 1,
0.2106966, -0.8566823, 3.061644, 0, 0.5686275, 1, 1,
0.2129339, -0.01307111, 2.277981, 0, 0.5607843, 1, 1,
0.21579, 0.5871665, -0.437683, 0, 0.5568628, 1, 1,
0.2161414, 0.3683115, -0.5143576, 0, 0.5490196, 1, 1,
0.2175098, 0.04381022, 0.4727767, 0, 0.5450981, 1, 1,
0.2192925, 1.06444, -0.3858299, 0, 0.5372549, 1, 1,
0.21994, 0.7740915, 0.4052335, 0, 0.5333334, 1, 1,
0.2202495, -1.484345, 4.333074, 0, 0.5254902, 1, 1,
0.2242684, 1.973609, -0.005344955, 0, 0.5215687, 1, 1,
0.2243098, -1.087526, 3.001895, 0, 0.5137255, 1, 1,
0.2268975, 0.8764517, 0.2740256, 0, 0.509804, 1, 1,
0.2278688, 0.8514186, 0.1759814, 0, 0.5019608, 1, 1,
0.2312757, 0.2956995, 1.671651, 0, 0.4941176, 1, 1,
0.2406224, 0.6878474, 0.647902, 0, 0.4901961, 1, 1,
0.2460158, -1.184398, 3.378312, 0, 0.4823529, 1, 1,
0.246033, -0.8129425, 2.945005, 0, 0.4784314, 1, 1,
0.2542128, 0.2891044, 0.2982372, 0, 0.4705882, 1, 1,
0.255636, -0.4188401, 2.119084, 0, 0.4666667, 1, 1,
0.2565213, 1.853639, -0.6847498, 0, 0.4588235, 1, 1,
0.2573397, 0.2660502, 0.2395303, 0, 0.454902, 1, 1,
0.2607879, 0.6366182, 1.198106, 0, 0.4470588, 1, 1,
0.2645065, 0.1824722, 0.8625218, 0, 0.4431373, 1, 1,
0.265098, 1.380792, 1.146231, 0, 0.4352941, 1, 1,
0.271784, 0.1318354, 1.791818, 0, 0.4313726, 1, 1,
0.2720536, -1.22808, 2.476244, 0, 0.4235294, 1, 1,
0.2733235, -0.1519563, 2.763385, 0, 0.4196078, 1, 1,
0.2764566, 0.02436357, 2.576011, 0, 0.4117647, 1, 1,
0.2834908, 0.7207804, -0.732121, 0, 0.4078431, 1, 1,
0.2866244, -0.7561358, 4.728331, 0, 0.4, 1, 1,
0.2873, -0.4657417, 2.46943, 0, 0.3921569, 1, 1,
0.2873499, -0.203722, 3.986534, 0, 0.3882353, 1, 1,
0.2899731, -0.0336214, 1.312277, 0, 0.3803922, 1, 1,
0.2914444, -1.602381, 1.513026, 0, 0.3764706, 1, 1,
0.2927592, -0.2338815, 3.570163, 0, 0.3686275, 1, 1,
0.2943885, -0.2201645, -0.02061054, 0, 0.3647059, 1, 1,
0.2944925, -1.057334, 3.883982, 0, 0.3568628, 1, 1,
0.2953198, -0.2214614, 0.8020065, 0, 0.3529412, 1, 1,
0.2953852, -0.0398143, 1.460818, 0, 0.345098, 1, 1,
0.2996795, 0.001153494, 3.33076, 0, 0.3411765, 1, 1,
0.3005226, 1.335484, 0.7053049, 0, 0.3333333, 1, 1,
0.3035245, -0.675962, 3.472327, 0, 0.3294118, 1, 1,
0.3039834, -2.145348, 2.225214, 0, 0.3215686, 1, 1,
0.3061847, -0.722644, 2.955002, 0, 0.3176471, 1, 1,
0.306227, 0.3281165, 0.5703413, 0, 0.3098039, 1, 1,
0.309312, -1.087714, 3.912971, 0, 0.3058824, 1, 1,
0.3100519, 1.310052, -1.46201, 0, 0.2980392, 1, 1,
0.3116938, -1.537539, 1.799193, 0, 0.2901961, 1, 1,
0.3122578, 1.169351, -0.2108483, 0, 0.2862745, 1, 1,
0.3169484, 1.675419, 1.792351, 0, 0.2784314, 1, 1,
0.3175632, 1.534526, 0.9830669, 0, 0.2745098, 1, 1,
0.3182543, 1.556298, -0.3643281, 0, 0.2666667, 1, 1,
0.3231441, -0.5042077, 3.868303, 0, 0.2627451, 1, 1,
0.323238, -0.2668407, 1.991545, 0, 0.254902, 1, 1,
0.328996, -0.3556392, 2.824642, 0, 0.2509804, 1, 1,
0.3297546, 0.5137733, 1.811258, 0, 0.2431373, 1, 1,
0.3299294, 0.981552, -0.7629019, 0, 0.2392157, 1, 1,
0.3300029, -0.3851751, 4.229757, 0, 0.2313726, 1, 1,
0.3307795, -0.622664, -0.03841783, 0, 0.227451, 1, 1,
0.3317698, 1.184484, -0.02739271, 0, 0.2196078, 1, 1,
0.3352147, 0.6217096, -0.0724183, 0, 0.2156863, 1, 1,
0.3358852, -1.985095, 2.048871, 0, 0.2078431, 1, 1,
0.3387721, 1.615171, 0.146614, 0, 0.2039216, 1, 1,
0.3401267, 1.758097, 0.07832098, 0, 0.1960784, 1, 1,
0.3416949, 0.6962363, -0.2691422, 0, 0.1882353, 1, 1,
0.3435116, -0.7817364, 2.790985, 0, 0.1843137, 1, 1,
0.344666, 0.675428, -0.4283116, 0, 0.1764706, 1, 1,
0.3446964, -0.8618726, 3.89992, 0, 0.172549, 1, 1,
0.3464583, 1.428694, 0.08092154, 0, 0.1647059, 1, 1,
0.3520813, 0.2615165, 3.081877, 0, 0.1607843, 1, 1,
0.3576385, -0.7803006, 2.659675, 0, 0.1529412, 1, 1,
0.3582487, 1.337078, 0.4307849, 0, 0.1490196, 1, 1,
0.3583002, 0.1462759, -0.5134963, 0, 0.1411765, 1, 1,
0.3602339, 0.03138478, 1.168015, 0, 0.1372549, 1, 1,
0.3603413, -0.6861195, 2.492672, 0, 0.1294118, 1, 1,
0.3613185, -0.6906313, 1.464889, 0, 0.1254902, 1, 1,
0.362456, -0.4104981, 2.721579, 0, 0.1176471, 1, 1,
0.3630218, 0.8258346, 0.4591963, 0, 0.1137255, 1, 1,
0.366484, 0.3576146, 2.369887, 0, 0.1058824, 1, 1,
0.366956, -1.088749, 4.94558, 0, 0.09803922, 1, 1,
0.3671937, 0.6910576, 1.884848, 0, 0.09411765, 1, 1,
0.3674269, 0.3446151, 0.9025961, 0, 0.08627451, 1, 1,
0.367751, 0.5101624, 1.180183, 0, 0.08235294, 1, 1,
0.3713315, 0.8710934, -1.2872, 0, 0.07450981, 1, 1,
0.377481, -0.01181528, 0.7580518, 0, 0.07058824, 1, 1,
0.3797005, 0.6992073, 1.191306, 0, 0.0627451, 1, 1,
0.3851839, 0.7166284, -0.7931123, 0, 0.05882353, 1, 1,
0.3888093, -0.2572848, 4.947187, 0, 0.05098039, 1, 1,
0.3888595, 0.08373456, -0.2859817, 0, 0.04705882, 1, 1,
0.3902087, -0.1441168, 3.058442, 0, 0.03921569, 1, 1,
0.3931745, 0.3584424, 0.6446916, 0, 0.03529412, 1, 1,
0.3934927, -1.350535, 4.184863, 0, 0.02745098, 1, 1,
0.3967355, -1.201209, 3.665665, 0, 0.02352941, 1, 1,
0.3988632, -0.3286676, 2.713535, 0, 0.01568628, 1, 1,
0.4003398, -0.6974166, 1.523052, 0, 0.01176471, 1, 1,
0.4008589, 1.10507, 2.128632, 0, 0.003921569, 1, 1,
0.4024284, -0.9717493, 3.500901, 0.003921569, 0, 1, 1,
0.403567, 0.3916053, 0.9634293, 0.007843138, 0, 1, 1,
0.404265, -0.001303417, 1.347241, 0.01568628, 0, 1, 1,
0.406644, 1.997664, 0.1703508, 0.01960784, 0, 1, 1,
0.4138858, 2.273762, 0.5115204, 0.02745098, 0, 1, 1,
0.4186574, 1.481072, 0.1931081, 0.03137255, 0, 1, 1,
0.4212006, 0.7561606, 1.124672, 0.03921569, 0, 1, 1,
0.423966, -0.9089305, 2.390817, 0.04313726, 0, 1, 1,
0.4265015, 0.5731947, -1.647701, 0.05098039, 0, 1, 1,
0.4305325, 1.658261, 1.245341, 0.05490196, 0, 1, 1,
0.4328416, 1.097795, 0.6236104, 0.0627451, 0, 1, 1,
0.4355904, 0.7018591, 2.612632, 0.06666667, 0, 1, 1,
0.4393055, 0.08028433, 2.683036, 0.07450981, 0, 1, 1,
0.4394773, 0.09536622, 1.865602, 0.07843138, 0, 1, 1,
0.439979, 0.659493, 2.588878, 0.08627451, 0, 1, 1,
0.4408266, 0.07787973, 2.014821, 0.09019608, 0, 1, 1,
0.4450603, 1.644765, 0.6657931, 0.09803922, 0, 1, 1,
0.4478257, 0.1526014, 1.530847, 0.1058824, 0, 1, 1,
0.4483854, -0.2226433, 3.012307, 0.1098039, 0, 1, 1,
0.449735, 0.5520516, -0.6813721, 0.1176471, 0, 1, 1,
0.4628417, 0.1740199, 1.000499, 0.1215686, 0, 1, 1,
0.4635119, -0.3738534, 2.526031, 0.1294118, 0, 1, 1,
0.4651466, -1.157484, 2.276419, 0.1333333, 0, 1, 1,
0.4654531, 0.957984, 0.1791191, 0.1411765, 0, 1, 1,
0.465904, 0.5513709, 2.334893, 0.145098, 0, 1, 1,
0.466771, 0.8973667, -0.4323407, 0.1529412, 0, 1, 1,
0.4755998, 0.07802673, 1.774622, 0.1568628, 0, 1, 1,
0.4795477, -0.9682921, 0.4145237, 0.1647059, 0, 1, 1,
0.4822601, -0.8798285, 2.024296, 0.1686275, 0, 1, 1,
0.4830262, -0.02067914, 1.517255, 0.1764706, 0, 1, 1,
0.4841522, -0.2427862, 3.243688, 0.1803922, 0, 1, 1,
0.5005735, -0.8967118, 2.135965, 0.1882353, 0, 1, 1,
0.5019253, -0.02332168, 2.764521, 0.1921569, 0, 1, 1,
0.503228, -0.8787346, 1.699331, 0.2, 0, 1, 1,
0.5071085, -0.9093622, 1.576831, 0.2078431, 0, 1, 1,
0.5091289, 0.609613, -0.1720912, 0.2117647, 0, 1, 1,
0.5109385, 1.398186, -0.2284494, 0.2196078, 0, 1, 1,
0.512723, -0.757401, 1.703408, 0.2235294, 0, 1, 1,
0.5152503, 1.416496, 0.2682974, 0.2313726, 0, 1, 1,
0.5338767, 0.7147223, -0.4851255, 0.2352941, 0, 1, 1,
0.5343136, 0.2199228, 2.174332, 0.2431373, 0, 1, 1,
0.5345679, -1.026528, 2.909359, 0.2470588, 0, 1, 1,
0.5387654, 0.9735761, 1.799028, 0.254902, 0, 1, 1,
0.5396443, 0.6937269, 1.895514, 0.2588235, 0, 1, 1,
0.5448494, 0.2783162, 1.584383, 0.2666667, 0, 1, 1,
0.5454334, -0.3480374, 0.7723996, 0.2705882, 0, 1, 1,
0.5468048, -0.6752644, 3.005879, 0.2784314, 0, 1, 1,
0.5481296, -1.605722, 2.882049, 0.282353, 0, 1, 1,
0.5497192, 0.3417073, 1.756274, 0.2901961, 0, 1, 1,
0.5519749, 1.102222, 0.7061138, 0.2941177, 0, 1, 1,
0.5562586, -0.6068189, 2.328959, 0.3019608, 0, 1, 1,
0.5582361, -2.555373, 0.4972107, 0.3098039, 0, 1, 1,
0.5712738, 1.435671, 1.069389, 0.3137255, 0, 1, 1,
0.5713238, -0.6736799, 2.880028, 0.3215686, 0, 1, 1,
0.5713347, 0.9030482, 0.7127656, 0.3254902, 0, 1, 1,
0.5716581, -1.147733, 3.011984, 0.3333333, 0, 1, 1,
0.5722089, -0.1625435, 1.853124, 0.3372549, 0, 1, 1,
0.5762821, 0.009286388, 1.208852, 0.345098, 0, 1, 1,
0.5771291, -0.330255, 2.13707, 0.3490196, 0, 1, 1,
0.5777109, -0.1775403, 2.938982, 0.3568628, 0, 1, 1,
0.5779839, -0.6233873, 2.331525, 0.3607843, 0, 1, 1,
0.5866132, -0.3285377, 2.903235, 0.3686275, 0, 1, 1,
0.5895572, 1.772475, 1.1985, 0.372549, 0, 1, 1,
0.5936313, 0.2597181, 2.208287, 0.3803922, 0, 1, 1,
0.5938898, 1.811607, -0.2123678, 0.3843137, 0, 1, 1,
0.5941867, 0.3418732, 1.485868, 0.3921569, 0, 1, 1,
0.5943435, -2.072378, 2.75199, 0.3960784, 0, 1, 1,
0.6013288, 0.796683, 1.668879, 0.4039216, 0, 1, 1,
0.6019534, 0.4118181, 2.048403, 0.4117647, 0, 1, 1,
0.6070076, 0.2237108, 1.758227, 0.4156863, 0, 1, 1,
0.6072112, -1.826709, 4.45612, 0.4235294, 0, 1, 1,
0.6091556, -0.1156307, 1.636314, 0.427451, 0, 1, 1,
0.6096595, -0.5116768, 2.725815, 0.4352941, 0, 1, 1,
0.610471, -0.9784429, -0.07874442, 0.4392157, 0, 1, 1,
0.6108409, 0.2777865, 0.08076006, 0.4470588, 0, 1, 1,
0.611213, 1.789538, 1.127733, 0.4509804, 0, 1, 1,
0.6131651, 1.179822, 1.387457, 0.4588235, 0, 1, 1,
0.6153901, -0.004148796, 2.275511, 0.4627451, 0, 1, 1,
0.6167131, 0.9672008, 0.7707055, 0.4705882, 0, 1, 1,
0.619027, -0.2031251, 0.8548357, 0.4745098, 0, 1, 1,
0.6198, -1.138645, 1.148787, 0.4823529, 0, 1, 1,
0.6221185, 0.7416518, 1.634754, 0.4862745, 0, 1, 1,
0.6254587, -0.4686255, 1.245589, 0.4941176, 0, 1, 1,
0.6255081, -0.6482294, 2.377415, 0.5019608, 0, 1, 1,
0.6267375, -0.5673403, 0.7076545, 0.5058824, 0, 1, 1,
0.6291481, 1.570833, -0.8832524, 0.5137255, 0, 1, 1,
0.6349188, 0.1833275, 1.503817, 0.5176471, 0, 1, 1,
0.6395331, -0.6420557, 3.660899, 0.5254902, 0, 1, 1,
0.6409447, 0.3295619, 0.9869804, 0.5294118, 0, 1, 1,
0.6448457, -0.2940277, 3.517452, 0.5372549, 0, 1, 1,
0.6463245, 0.5776546, 2.082181, 0.5411765, 0, 1, 1,
0.6538993, 0.7061551, 0.4341829, 0.5490196, 0, 1, 1,
0.6606355, 1.760479, 0.7564734, 0.5529412, 0, 1, 1,
0.6607193, -1.12435, 4.038447, 0.5607843, 0, 1, 1,
0.6613848, 0.5090353, -0.7822686, 0.5647059, 0, 1, 1,
0.6650187, 0.04691054, 1.288368, 0.572549, 0, 1, 1,
0.668393, -1.889776, 2.021511, 0.5764706, 0, 1, 1,
0.6705956, 1.91116, -2.055264, 0.5843138, 0, 1, 1,
0.6725328, -0.6854931, 1.178488, 0.5882353, 0, 1, 1,
0.673681, -0.6119739, 3.529274, 0.5960785, 0, 1, 1,
0.6788666, -0.6902657, 1.274565, 0.6039216, 0, 1, 1,
0.6792392, -0.2832902, 3.205437, 0.6078432, 0, 1, 1,
0.6817878, 1.717593, -1.16529, 0.6156863, 0, 1, 1,
0.6837667, 0.4935116, 0.7966316, 0.6196079, 0, 1, 1,
0.6849834, 0.3571554, 1.909205, 0.627451, 0, 1, 1,
0.6927979, -1.21872, 1.770494, 0.6313726, 0, 1, 1,
0.6957777, -0.6170408, 2.412009, 0.6392157, 0, 1, 1,
0.6967347, 0.6869767, 1.223965, 0.6431373, 0, 1, 1,
0.6979269, -0.2052192, 3.077172, 0.6509804, 0, 1, 1,
0.7005857, -0.02610793, 1.044503, 0.654902, 0, 1, 1,
0.7045074, -1.529745, 3.603053, 0.6627451, 0, 1, 1,
0.7050043, -1.702225, 3.141272, 0.6666667, 0, 1, 1,
0.7077916, 0.6071272, 1.483458, 0.6745098, 0, 1, 1,
0.7164421, -0.2889754, 1.682652, 0.6784314, 0, 1, 1,
0.7237612, -0.7319489, 2.608869, 0.6862745, 0, 1, 1,
0.7250399, 0.9139583, 2.994434, 0.6901961, 0, 1, 1,
0.7335754, 0.7903861, -0.3169959, 0.6980392, 0, 1, 1,
0.7402104, -0.9703024, 2.156011, 0.7058824, 0, 1, 1,
0.7435946, 0.1630042, 1.857309, 0.7098039, 0, 1, 1,
0.7438607, -1.170053, 3.154821, 0.7176471, 0, 1, 1,
0.7506832, -1.417203, 2.933039, 0.7215686, 0, 1, 1,
0.7533204, 0.08963691, 1.477071, 0.7294118, 0, 1, 1,
0.7658616, -0.7336743, 0.7474194, 0.7333333, 0, 1, 1,
0.7685331, -0.8096839, 2.664211, 0.7411765, 0, 1, 1,
0.7704403, -0.6531401, 2.274552, 0.7450981, 0, 1, 1,
0.7746159, 0.4352109, 1.337, 0.7529412, 0, 1, 1,
0.780987, -1.336355, 2.548727, 0.7568628, 0, 1, 1,
0.7832554, 1.617735, -0.7387066, 0.7647059, 0, 1, 1,
0.7857987, -1.033203, 1.529907, 0.7686275, 0, 1, 1,
0.7942784, -0.4252784, 1.387424, 0.7764706, 0, 1, 1,
0.795575, -0.6616281, 4.104213, 0.7803922, 0, 1, 1,
0.8004061, 0.2166354, 0.5548195, 0.7882353, 0, 1, 1,
0.800802, 1.399149, -0.2682049, 0.7921569, 0, 1, 1,
0.8047231, 1.032699, 0.6954536, 0.8, 0, 1, 1,
0.8059061, 0.8868609, 1.629143, 0.8078431, 0, 1, 1,
0.8120092, 0.5659637, -0.1713675, 0.8117647, 0, 1, 1,
0.8152649, 1.403616, 0.0895043, 0.8196079, 0, 1, 1,
0.8182158, 0.6934869, -1.551942, 0.8235294, 0, 1, 1,
0.8205985, 1.30812, -0.3828144, 0.8313726, 0, 1, 1,
0.827004, -0.4897722, 0.7388054, 0.8352941, 0, 1, 1,
0.8309493, 1.409737, 1.367774, 0.8431373, 0, 1, 1,
0.8310156, -0.1091763, 0.8461421, 0.8470588, 0, 1, 1,
0.8318765, -0.4634324, 2.823238, 0.854902, 0, 1, 1,
0.834193, -0.6190481, 1.340788, 0.8588235, 0, 1, 1,
0.8351931, 0.6582982, 1.506828, 0.8666667, 0, 1, 1,
0.8379598, -0.7094366, 2.42328, 0.8705882, 0, 1, 1,
0.8444705, -0.569617, 3.139135, 0.8784314, 0, 1, 1,
0.8478168, 1.324119, -0.707326, 0.8823529, 0, 1, 1,
0.8572626, -0.4333872, 2.428731, 0.8901961, 0, 1, 1,
0.85839, 1.619197, -0.867907, 0.8941177, 0, 1, 1,
0.8600221, 0.2008879, 0.4946894, 0.9019608, 0, 1, 1,
0.8704757, -0.2423708, 1.02113, 0.9098039, 0, 1, 1,
0.8743689, 0.4491982, 1.43993, 0.9137255, 0, 1, 1,
0.8749999, -0.3804597, 2.433986, 0.9215686, 0, 1, 1,
0.8872979, 0.8636253, 0.2474753, 0.9254902, 0, 1, 1,
0.8910108, -1.6569, 2.524711, 0.9333333, 0, 1, 1,
0.8943403, -0.2537295, 1.679923, 0.9372549, 0, 1, 1,
0.8957191, -0.298434, 1.39483, 0.945098, 0, 1, 1,
0.9016057, 0.6067979, 1.514294, 0.9490196, 0, 1, 1,
0.9050059, -0.2086873, 2.739258, 0.9568627, 0, 1, 1,
0.9112584, -0.002676976, 1.387061, 0.9607843, 0, 1, 1,
0.9204065, 0.6812499, -0.2060741, 0.9686275, 0, 1, 1,
0.9214771, 1.190691, -0.4407816, 0.972549, 0, 1, 1,
0.9236175, -1.563349, 3.86593, 0.9803922, 0, 1, 1,
0.9245287, 2.023886, 0.7539893, 0.9843137, 0, 1, 1,
0.9259183, 0.9783112, -0.7658042, 0.9921569, 0, 1, 1,
0.9268492, 2.260083, -0.5803632, 0.9960784, 0, 1, 1,
0.9280801, 1.343095, -1.029213, 1, 0, 0.9960784, 1,
0.9340777, 0.1720142, 0.7482824, 1, 0, 0.9882353, 1,
0.9363734, -0.7129165, 2.108781, 1, 0, 0.9843137, 1,
0.9378482, 3.556057, -0.1036144, 1, 0, 0.9764706, 1,
0.9409416, -0.2866161, 1.333216, 1, 0, 0.972549, 1,
0.9435322, -1.520241, 3.793522, 1, 0, 0.9647059, 1,
0.9437121, -0.9662269, 2.860713, 1, 0, 0.9607843, 1,
0.945137, 0.9048577, 0.05706989, 1, 0, 0.9529412, 1,
0.9466792, 0.303946, 1.112733, 1, 0, 0.9490196, 1,
0.9477424, 0.1381196, 1.269481, 1, 0, 0.9411765, 1,
0.9522786, -0.2662098, 1.820783, 1, 0, 0.9372549, 1,
0.9608934, -0.7285552, 2.772445, 1, 0, 0.9294118, 1,
0.9622593, -0.2373545, 1.34185, 1, 0, 0.9254902, 1,
0.9757228, -0.8715102, 2.703594, 1, 0, 0.9176471, 1,
0.9839285, 2.882039, -0.6940792, 1, 0, 0.9137255, 1,
0.9855346, 0.5669424, 2.254242, 1, 0, 0.9058824, 1,
0.9922996, -0.8191069, 3.469944, 1, 0, 0.9019608, 1,
0.99976, -0.8997331, 1.277213, 1, 0, 0.8941177, 1,
1.005653, -1.21602, 1.492002, 1, 0, 0.8862745, 1,
1.0147, -0.2467552, 2.798143, 1, 0, 0.8823529, 1,
1.015268, -0.05845462, 3.761424, 1, 0, 0.8745098, 1,
1.017994, -0.2418296, 5.251661, 1, 0, 0.8705882, 1,
1.029265, -0.3935494, 1.378585, 1, 0, 0.8627451, 1,
1.030564, 0.4513192, 2.483227, 1, 0, 0.8588235, 1,
1.03355, 1.043597, 0.8833411, 1, 0, 0.8509804, 1,
1.035243, -1.163366, 4.579866, 1, 0, 0.8470588, 1,
1.040432, -1.087536, 2.830207, 1, 0, 0.8392157, 1,
1.04418, -0.01968217, 2.004744, 1, 0, 0.8352941, 1,
1.046465, 1.367692, 2.03672, 1, 0, 0.827451, 1,
1.047115, -0.116364, 1.24906, 1, 0, 0.8235294, 1,
1.048344, 0.6909168, 1.190949, 1, 0, 0.8156863, 1,
1.051474, -0.06273061, 2.88568, 1, 0, 0.8117647, 1,
1.054522, -1.80285, -0.2978269, 1, 0, 0.8039216, 1,
1.058663, -0.182131, 1.030304, 1, 0, 0.7960784, 1,
1.069805, -0.2656425, 0.2688738, 1, 0, 0.7921569, 1,
1.073617, -0.8086171, 1.868303, 1, 0, 0.7843137, 1,
1.075085, 0.7879612, 1.67786, 1, 0, 0.7803922, 1,
1.075847, 0.5478634, 0.4651209, 1, 0, 0.772549, 1,
1.077857, -0.02348412, 4.121701, 1, 0, 0.7686275, 1,
1.080949, -1.599041, 2.649288, 1, 0, 0.7607843, 1,
1.088103, -1.064032, 2.425345, 1, 0, 0.7568628, 1,
1.088324, -0.3430085, 0.9496483, 1, 0, 0.7490196, 1,
1.090582, 1.213101, 1.083547, 1, 0, 0.7450981, 1,
1.092911, -0.318142, 1.18769, 1, 0, 0.7372549, 1,
1.098812, -1.299245, 5.030589, 1, 0, 0.7333333, 1,
1.10949, 1.148722, 1.051446, 1, 0, 0.7254902, 1,
1.10952, 0.2987237, 2.235368, 1, 0, 0.7215686, 1,
1.109646, 0.3647918, 3.152067, 1, 0, 0.7137255, 1,
1.110675, -0.9875918, 1.0277, 1, 0, 0.7098039, 1,
1.112857, -0.2969607, 2.810719, 1, 0, 0.7019608, 1,
1.113178, 0.3507278, -0.4466743, 1, 0, 0.6941177, 1,
1.113802, 0.3636139, 0.8199808, 1, 0, 0.6901961, 1,
1.127524, 0.4258991, 1.554173, 1, 0, 0.682353, 1,
1.142899, -1.36303, 3.083196, 1, 0, 0.6784314, 1,
1.143904, 1.727214, 0.5930473, 1, 0, 0.6705883, 1,
1.157118, 0.3617321, 0.3975258, 1, 0, 0.6666667, 1,
1.163034, 0.02985956, 2.764598, 1, 0, 0.6588235, 1,
1.16304, 0.8089681, 0.3712713, 1, 0, 0.654902, 1,
1.176574, -0.6634934, 2.874071, 1, 0, 0.6470588, 1,
1.179372, -0.1310716, 0.9182015, 1, 0, 0.6431373, 1,
1.197808, -2.227555, 2.072434, 1, 0, 0.6352941, 1,
1.209512, 0.3801897, -0.02687535, 1, 0, 0.6313726, 1,
1.21415, -0.3435568, 1.94571, 1, 0, 0.6235294, 1,
1.235822, -0.9914304, 0.6328107, 1, 0, 0.6196079, 1,
1.24178, -0.4482055, 3.343258, 1, 0, 0.6117647, 1,
1.248976, -0.6779992, 1.939881, 1, 0, 0.6078432, 1,
1.250525, 0.5634794, 2.021613, 1, 0, 0.6, 1,
1.251996, -0.7204109, 1.876063, 1, 0, 0.5921569, 1,
1.254104, 0.635253, -0.5784547, 1, 0, 0.5882353, 1,
1.255604, 0.136015, 2.013506, 1, 0, 0.5803922, 1,
1.256078, -1.031146, 2.677507, 1, 0, 0.5764706, 1,
1.273894, 1.774921, 1.131896, 1, 0, 0.5686275, 1,
1.282963, -0.9094912, 1.733585, 1, 0, 0.5647059, 1,
1.288263, 0.02874878, 2.087358, 1, 0, 0.5568628, 1,
1.289833, 0.1441474, 0.3347714, 1, 0, 0.5529412, 1,
1.294409, -0.8536898, 3.10604, 1, 0, 0.5450981, 1,
1.31253, 1.109786, 2.416393, 1, 0, 0.5411765, 1,
1.31647, -1.814216, 1.637012, 1, 0, 0.5333334, 1,
1.316902, -1.409975, 0.8248259, 1, 0, 0.5294118, 1,
1.318137, -0.5783207, 1.648192, 1, 0, 0.5215687, 1,
1.31957, -0.1376946, -0.935362, 1, 0, 0.5176471, 1,
1.325931, 0.9416558, 0.9892013, 1, 0, 0.509804, 1,
1.326491, 0.08245368, 1.372886, 1, 0, 0.5058824, 1,
1.327401, -1.234016, 2.819394, 1, 0, 0.4980392, 1,
1.329307, 1.211565, -1.194735, 1, 0, 0.4901961, 1,
1.331072, 1.22302, -0.246645, 1, 0, 0.4862745, 1,
1.338259, 0.5383985, 1.847166, 1, 0, 0.4784314, 1,
1.338757, -0.5269074, 2.16919, 1, 0, 0.4745098, 1,
1.344497, -0.2522217, -0.2842962, 1, 0, 0.4666667, 1,
1.348, -0.6511864, 2.728158, 1, 0, 0.4627451, 1,
1.356052, -1.28783, 2.983292, 1, 0, 0.454902, 1,
1.362519, -2.335811, 2.860331, 1, 0, 0.4509804, 1,
1.368667, 0.08897479, 0.4537869, 1, 0, 0.4431373, 1,
1.370381, 0.2528811, 1.611081, 1, 0, 0.4392157, 1,
1.372528, 0.8282436, 3.904834, 1, 0, 0.4313726, 1,
1.375328, -0.823559, 0.9418114, 1, 0, 0.427451, 1,
1.384544, -0.2611915, 0.7762879, 1, 0, 0.4196078, 1,
1.388135, -0.5553423, 0.6582723, 1, 0, 0.4156863, 1,
1.391902, 0.03727466, 2.502666, 1, 0, 0.4078431, 1,
1.403746, -0.2183928, 2.487628, 1, 0, 0.4039216, 1,
1.407426, 0.7482373, 0.383607, 1, 0, 0.3960784, 1,
1.410902, 1.596683, -0.8431746, 1, 0, 0.3882353, 1,
1.439163, -1.028878, 1.326025, 1, 0, 0.3843137, 1,
1.448666, 0.3165506, 3.294748, 1, 0, 0.3764706, 1,
1.448921, 0.890408, 1.008042, 1, 0, 0.372549, 1,
1.456641, -0.09855343, 1.112831, 1, 0, 0.3647059, 1,
1.462714, 0.03275801, 1.070292, 1, 0, 0.3607843, 1,
1.480925, -0.6466894, 1.155695, 1, 0, 0.3529412, 1,
1.481667, -0.7423291, 2.621437, 1, 0, 0.3490196, 1,
1.485192, -0.5732313, 2.116576, 1, 0, 0.3411765, 1,
1.486928, -0.7611837, 2.860308, 1, 0, 0.3372549, 1,
1.494347, -0.0852182, 1.878864, 1, 0, 0.3294118, 1,
1.514864, 0.9651327, 1.051919, 1, 0, 0.3254902, 1,
1.519804, -0.8990033, 1.783385, 1, 0, 0.3176471, 1,
1.52847, -0.2849956, 2.430992, 1, 0, 0.3137255, 1,
1.539121, 0.1628466, 0.7931541, 1, 0, 0.3058824, 1,
1.539311, -0.7875372, 1.17253, 1, 0, 0.2980392, 1,
1.549015, 2.438944, -1.637177, 1, 0, 0.2941177, 1,
1.574878, -0.4552348, 1.790563, 1, 0, 0.2862745, 1,
1.584935, 0.8074376, 0.2005141, 1, 0, 0.282353, 1,
1.589339, -0.1441141, 1.841222, 1, 0, 0.2745098, 1,
1.595002, -0.1520813, 0.1922557, 1, 0, 0.2705882, 1,
1.597552, -0.008860896, 1.524959, 1, 0, 0.2627451, 1,
1.611144, 0.8343962, 0.4314006, 1, 0, 0.2588235, 1,
1.615495, 1.390461, 0.6084202, 1, 0, 0.2509804, 1,
1.632998, -0.9556843, 2.087393, 1, 0, 0.2470588, 1,
1.640922, 0.4035188, 1.005609, 1, 0, 0.2392157, 1,
1.662237, -0.06242136, -0.2511628, 1, 0, 0.2352941, 1,
1.663389, -0.4162874, 0.6874792, 1, 0, 0.227451, 1,
1.669647, 0.6751574, 0.7840742, 1, 0, 0.2235294, 1,
1.685881, -1.186664, 3.064757, 1, 0, 0.2156863, 1,
1.688575, 1.131628, 0.9401705, 1, 0, 0.2117647, 1,
1.689387, 0.3402728, -0.4325146, 1, 0, 0.2039216, 1,
1.703131, 0.5393161, -0.390621, 1, 0, 0.1960784, 1,
1.708694, 0.4540385, 0.4038461, 1, 0, 0.1921569, 1,
1.7142, -1.56319, 2.946089, 1, 0, 0.1843137, 1,
1.737271, -1.089034, 2.23459, 1, 0, 0.1803922, 1,
1.756441, -1.331309, 3.29566, 1, 0, 0.172549, 1,
1.823708, -0.5968376, -0.2263527, 1, 0, 0.1686275, 1,
1.825578, -0.2886166, 1.790294, 1, 0, 0.1607843, 1,
1.853615, 0.09463491, 1.629829, 1, 0, 0.1568628, 1,
1.883591, 0.9219716, 1.476727, 1, 0, 0.1490196, 1,
1.908931, -1.084561, 2.593462, 1, 0, 0.145098, 1,
1.920258, -0.3754095, 1.176925, 1, 0, 0.1372549, 1,
1.920515, 0.2350422, 0.8426259, 1, 0, 0.1333333, 1,
1.923707, -0.2693712, 0.2691608, 1, 0, 0.1254902, 1,
1.932698, 1.671801, 0.5092708, 1, 0, 0.1215686, 1,
1.959611, -0.9787409, 1.18765, 1, 0, 0.1137255, 1,
1.979679, -3.32778, 2.414335, 1, 0, 0.1098039, 1,
2.02936, 1.873018, 2.178, 1, 0, 0.1019608, 1,
2.063414, 3.126154, 0.707108, 1, 0, 0.09411765, 1,
2.069242, -1.967776, 3.249843, 1, 0, 0.09019608, 1,
2.181042, 1.829416, -2.369492, 1, 0, 0.08235294, 1,
2.216202, -1.802529, 1.972046, 1, 0, 0.07843138, 1,
2.240264, -0.0774272, 1.897697, 1, 0, 0.07058824, 1,
2.24434, 0.6650339, -0.06638537, 1, 0, 0.06666667, 1,
2.273905, 0.1221043, 0.1989149, 1, 0, 0.05882353, 1,
2.382516, 1.09422, 1.571746, 1, 0, 0.05490196, 1,
2.438817, -0.3074285, 1.47707, 1, 0, 0.04705882, 1,
2.497229, 0.6444016, 0.381925, 1, 0, 0.04313726, 1,
2.551563, 0.3869961, 0.6155025, 1, 0, 0.03529412, 1,
2.55274, 1.044739, 0.1544541, 1, 0, 0.03137255, 1,
2.556678, -0.6347017, 1.943556, 1, 0, 0.02352941, 1,
2.898131, -0.6468522, 1.554414, 1, 0, 0.01960784, 1,
3.003212, 1.118358, -0.06782034, 1, 0, 0.01176471, 1,
3.096774, 0.1976227, 0.9726624, 1, 0, 0.007843138, 1
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
-0.1108295, -5.00386, -6.599511, 0, -0.5, 0.5, 0.5,
-0.1108295, -5.00386, -6.599511, 1, -0.5, 0.5, 0.5,
-0.1108295, -5.00386, -6.599511, 1, 1.5, 0.5, 0.5,
-0.1108295, -5.00386, -6.599511, 0, 1.5, 0.5, 0.5
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
-4.40581, -0.103591, -6.599511, 0, -0.5, 0.5, 0.5,
-4.40581, -0.103591, -6.599511, 1, -0.5, 0.5, 0.5,
-4.40581, -0.103591, -6.599511, 1, 1.5, 0.5, 0.5,
-4.40581, -0.103591, -6.599511, 0, 1.5, 0.5, 0.5
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
-4.40581, -5.00386, 0.1848922, 0, -0.5, 0.5, 0.5,
-4.40581, -5.00386, 0.1848922, 1, -0.5, 0.5, 0.5,
-4.40581, -5.00386, 0.1848922, 1, 1.5, 0.5, 0.5,
-4.40581, -5.00386, 0.1848922, 0, 1.5, 0.5, 0.5
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
-3, -3.873029, -5.03388,
3, -3.873029, -5.03388,
-3, -3.873029, -5.03388,
-3, -4.061501, -5.294818,
-2, -3.873029, -5.03388,
-2, -4.061501, -5.294818,
-1, -3.873029, -5.03388,
-1, -4.061501, -5.294818,
0, -3.873029, -5.03388,
0, -4.061501, -5.294818,
1, -3.873029, -5.03388,
1, -4.061501, -5.294818,
2, -3.873029, -5.03388,
2, -4.061501, -5.294818,
3, -3.873029, -5.03388,
3, -4.061501, -5.294818
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
-3, -4.438445, -5.816695, 0, -0.5, 0.5, 0.5,
-3, -4.438445, -5.816695, 1, -0.5, 0.5, 0.5,
-3, -4.438445, -5.816695, 1, 1.5, 0.5, 0.5,
-3, -4.438445, -5.816695, 0, 1.5, 0.5, 0.5,
-2, -4.438445, -5.816695, 0, -0.5, 0.5, 0.5,
-2, -4.438445, -5.816695, 1, -0.5, 0.5, 0.5,
-2, -4.438445, -5.816695, 1, 1.5, 0.5, 0.5,
-2, -4.438445, -5.816695, 0, 1.5, 0.5, 0.5,
-1, -4.438445, -5.816695, 0, -0.5, 0.5, 0.5,
-1, -4.438445, -5.816695, 1, -0.5, 0.5, 0.5,
-1, -4.438445, -5.816695, 1, 1.5, 0.5, 0.5,
-1, -4.438445, -5.816695, 0, 1.5, 0.5, 0.5,
0, -4.438445, -5.816695, 0, -0.5, 0.5, 0.5,
0, -4.438445, -5.816695, 1, -0.5, 0.5, 0.5,
0, -4.438445, -5.816695, 1, 1.5, 0.5, 0.5,
0, -4.438445, -5.816695, 0, 1.5, 0.5, 0.5,
1, -4.438445, -5.816695, 0, -0.5, 0.5, 0.5,
1, -4.438445, -5.816695, 1, -0.5, 0.5, 0.5,
1, -4.438445, -5.816695, 1, 1.5, 0.5, 0.5,
1, -4.438445, -5.816695, 0, 1.5, 0.5, 0.5,
2, -4.438445, -5.816695, 0, -0.5, 0.5, 0.5,
2, -4.438445, -5.816695, 1, -0.5, 0.5, 0.5,
2, -4.438445, -5.816695, 1, 1.5, 0.5, 0.5,
2, -4.438445, -5.816695, 0, 1.5, 0.5, 0.5,
3, -4.438445, -5.816695, 0, -0.5, 0.5, 0.5,
3, -4.438445, -5.816695, 1, -0.5, 0.5, 0.5,
3, -4.438445, -5.816695, 1, 1.5, 0.5, 0.5,
3, -4.438445, -5.816695, 0, 1.5, 0.5, 0.5
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
-3.414661, -2, -5.03388,
-3.414661, 2, -5.03388,
-3.414661, -2, -5.03388,
-3.579852, -2, -5.294818,
-3.414661, 0, -5.03388,
-3.579852, 0, -5.294818,
-3.414661, 2, -5.03388,
-3.579852, 2, -5.294818
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
"0",
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
-3.910235, -2, -5.816695, 0, -0.5, 0.5, 0.5,
-3.910235, -2, -5.816695, 1, -0.5, 0.5, 0.5,
-3.910235, -2, -5.816695, 1, 1.5, 0.5, 0.5,
-3.910235, -2, -5.816695, 0, 1.5, 0.5, 0.5,
-3.910235, 0, -5.816695, 0, -0.5, 0.5, 0.5,
-3.910235, 0, -5.816695, 1, -0.5, 0.5, 0.5,
-3.910235, 0, -5.816695, 1, 1.5, 0.5, 0.5,
-3.910235, 0, -5.816695, 0, 1.5, 0.5, 0.5,
-3.910235, 2, -5.816695, 0, -0.5, 0.5, 0.5,
-3.910235, 2, -5.816695, 1, -0.5, 0.5, 0.5,
-3.910235, 2, -5.816695, 1, 1.5, 0.5, 0.5,
-3.910235, 2, -5.816695, 0, 1.5, 0.5, 0.5
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
-3.414661, -3.873029, -4,
-3.414661, -3.873029, 4,
-3.414661, -3.873029, -4,
-3.579852, -4.061501, -4,
-3.414661, -3.873029, -2,
-3.579852, -4.061501, -2,
-3.414661, -3.873029, 0,
-3.579852, -4.061501, 0,
-3.414661, -3.873029, 2,
-3.579852, -4.061501, 2,
-3.414661, -3.873029, 4,
-3.579852, -4.061501, 4
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
-3.910235, -4.438445, -4, 0, -0.5, 0.5, 0.5,
-3.910235, -4.438445, -4, 1, -0.5, 0.5, 0.5,
-3.910235, -4.438445, -4, 1, 1.5, 0.5, 0.5,
-3.910235, -4.438445, -4, 0, 1.5, 0.5, 0.5,
-3.910235, -4.438445, -2, 0, -0.5, 0.5, 0.5,
-3.910235, -4.438445, -2, 1, -0.5, 0.5, 0.5,
-3.910235, -4.438445, -2, 1, 1.5, 0.5, 0.5,
-3.910235, -4.438445, -2, 0, 1.5, 0.5, 0.5,
-3.910235, -4.438445, 0, 0, -0.5, 0.5, 0.5,
-3.910235, -4.438445, 0, 1, -0.5, 0.5, 0.5,
-3.910235, -4.438445, 0, 1, 1.5, 0.5, 0.5,
-3.910235, -4.438445, 0, 0, 1.5, 0.5, 0.5,
-3.910235, -4.438445, 2, 0, -0.5, 0.5, 0.5,
-3.910235, -4.438445, 2, 1, -0.5, 0.5, 0.5,
-3.910235, -4.438445, 2, 1, 1.5, 0.5, 0.5,
-3.910235, -4.438445, 2, 0, 1.5, 0.5, 0.5,
-3.910235, -4.438445, 4, 0, -0.5, 0.5, 0.5,
-3.910235, -4.438445, 4, 1, -0.5, 0.5, 0.5,
-3.910235, -4.438445, 4, 1, 1.5, 0.5, 0.5,
-3.910235, -4.438445, 4, 0, 1.5, 0.5, 0.5
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
-3.414661, -3.873029, -5.03388,
-3.414661, 3.665847, -5.03388,
-3.414661, -3.873029, 5.403664,
-3.414661, 3.665847, 5.403664,
-3.414661, -3.873029, -5.03388,
-3.414661, -3.873029, 5.403664,
-3.414661, 3.665847, -5.03388,
-3.414661, 3.665847, 5.403664,
-3.414661, -3.873029, -5.03388,
3.193002, -3.873029, -5.03388,
-3.414661, -3.873029, 5.403664,
3.193002, -3.873029, 5.403664,
-3.414661, 3.665847, -5.03388,
3.193002, 3.665847, -5.03388,
-3.414661, 3.665847, 5.403664,
3.193002, 3.665847, 5.403664,
3.193002, -3.873029, -5.03388,
3.193002, 3.665847, -5.03388,
3.193002, -3.873029, 5.403664,
3.193002, 3.665847, 5.403664,
3.193002, -3.873029, -5.03388,
3.193002, -3.873029, 5.403664,
3.193002, 3.665847, -5.03388,
3.193002, 3.665847, 5.403664
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
var radius = 7.727756;
var distance = 34.38166;
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
mvMatrix.translate( 0.1108295, 0.103591, -0.1848922 );
mvMatrix.scale( 1.264502, 1.108309, 0.8005141 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.38166);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
aminoethyl_phosphoro<-read.table("aminoethyl_phosphoro.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-aminoethyl_phosphoro$V2
```

```
## Error in eval(expr, envir, enclos): object 'aminoethyl_phosphoro' not found
```

```r
y<-aminoethyl_phosphoro$V3
```

```
## Error in eval(expr, envir, enclos): object 'aminoethyl_phosphoro' not found
```

```r
z<-aminoethyl_phosphoro$V4
```

```
## Error in eval(expr, envir, enclos): object 'aminoethyl_phosphoro' not found
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
-3.318433, -0.1782963, -1.373856, 0, 0, 1, 1, 1,
-3.202012, 0.3342798, -2.257653, 1, 0, 0, 1, 1,
-3.095227, 1.777689, -1.802912, 1, 0, 0, 1, 1,
-2.699306, -0.4258041, -0.9057009, 1, 0, 0, 1, 1,
-2.624162, -1.309688, -2.360392, 1, 0, 0, 1, 1,
-2.622475, -0.2124626, -0.4025849, 1, 0, 0, 1, 1,
-2.613627, 0.6743621, -0.505372, 0, 0, 0, 1, 1,
-2.5592, -0.8791355, -3.90188, 0, 0, 0, 1, 1,
-2.466695, -0.5114038, -0.9990389, 0, 0, 0, 1, 1,
-2.455346, 1.431846, -1.124751, 0, 0, 0, 1, 1,
-2.405573, 0.1129347, -0.9195821, 0, 0, 0, 1, 1,
-2.372384, -2.34885, -2.251493, 0, 0, 0, 1, 1,
-2.303901, 0.5358413, -2.759617, 0, 0, 0, 1, 1,
-2.291226, 0.5832488, -2.893413, 1, 1, 1, 1, 1,
-2.291158, -1.000657, -1.237217, 1, 1, 1, 1, 1,
-2.272852, 1.391949, 1.074132, 1, 1, 1, 1, 1,
-2.246315, -1.705793, -4.115786, 1, 1, 1, 1, 1,
-2.235768, 0.6099013, -3.695245, 1, 1, 1, 1, 1,
-2.213424, 0.3581025, -0.9985008, 1, 1, 1, 1, 1,
-2.18832, 0.4635709, 0.405224, 1, 1, 1, 1, 1,
-2.156372, 0.624303, 0.06259925, 1, 1, 1, 1, 1,
-2.152177, 0.8970277, -1.196573, 1, 1, 1, 1, 1,
-2.134655, -1.984087, -2.985639, 1, 1, 1, 1, 1,
-2.133816, -0.7391598, -2.656415, 1, 1, 1, 1, 1,
-2.124191, -0.8515177, -2.658792, 1, 1, 1, 1, 1,
-2.076656, -0.8098285, -0.9570699, 1, 1, 1, 1, 1,
-2.064469, 0.2767279, -0.5795091, 1, 1, 1, 1, 1,
-2.042595, 0.792057, -2.346994, 1, 1, 1, 1, 1,
-2.008358, 0.1283271, -0.5309559, 0, 0, 1, 1, 1,
-2.006464, 0.3157296, -1.739147, 1, 0, 0, 1, 1,
-1.984244, 0.6164593, -0.7537638, 1, 0, 0, 1, 1,
-1.934389, -0.3115365, -1.96881, 1, 0, 0, 1, 1,
-1.902243, 0.1235202, -0.6813964, 1, 0, 0, 1, 1,
-1.886088, -0.04271337, -1.685839, 1, 0, 0, 1, 1,
-1.858661, 0.7776604, -1.661995, 0, 0, 0, 1, 1,
-1.854949, -0.3978874, -0.387184, 0, 0, 0, 1, 1,
-1.838516, -1.041511, -2.122994, 0, 0, 0, 1, 1,
-1.82951, -2.122825, -3.250592, 0, 0, 0, 1, 1,
-1.822987, -0.4475007, -0.9435166, 0, 0, 0, 1, 1,
-1.821711, 0.6231353, 0.9248871, 0, 0, 0, 1, 1,
-1.818374, -0.420947, -3.656561, 0, 0, 0, 1, 1,
-1.81744, -0.6907027, -3.39625, 1, 1, 1, 1, 1,
-1.812457, 0.1303377, -3.501964, 1, 1, 1, 1, 1,
-1.801316, 0.6989349, -2.016424, 1, 1, 1, 1, 1,
-1.79189, 0.6179807, 0.07592554, 1, 1, 1, 1, 1,
-1.779011, -0.8516366, -0.5469137, 1, 1, 1, 1, 1,
-1.770968, 1.219274, -1.054396, 1, 1, 1, 1, 1,
-1.759015, -0.6105, -1.411565, 1, 1, 1, 1, 1,
-1.751818, -0.04350302, -0.4954726, 1, 1, 1, 1, 1,
-1.715582, -0.6777528, -1.274411, 1, 1, 1, 1, 1,
-1.674437, -0.7598157, -1.691611, 1, 1, 1, 1, 1,
-1.673111, 0.7715922, -2.029702, 1, 1, 1, 1, 1,
-1.663757, -0.477244, -1.638961, 1, 1, 1, 1, 1,
-1.655775, -0.09109185, -2.893582, 1, 1, 1, 1, 1,
-1.650665, 0.5768937, -3.113081, 1, 1, 1, 1, 1,
-1.650151, -0.2608279, -1.999582, 1, 1, 1, 1, 1,
-1.650093, 0.3369412, -1.000775, 0, 0, 1, 1, 1,
-1.648045, 0.8011801, -0.7216051, 1, 0, 0, 1, 1,
-1.640926, -0.2107504, -1.449489, 1, 0, 0, 1, 1,
-1.633776, 2.383725, -0.9905477, 1, 0, 0, 1, 1,
-1.628264, -0.09743464, -0.9579166, 1, 0, 0, 1, 1,
-1.627383, -1.057072, -2.968153, 1, 0, 0, 1, 1,
-1.622998, -0.2769873, -2.835277, 0, 0, 0, 1, 1,
-1.617571, -0.8669669, -1.846366, 0, 0, 0, 1, 1,
-1.596633, 1.06466, -0.7208444, 0, 0, 0, 1, 1,
-1.591181, 1.540555, 0.003831937, 0, 0, 0, 1, 1,
-1.565835, 0.674017, -0.9089947, 0, 0, 0, 1, 1,
-1.551351, -0.2631418, -3.492996, 0, 0, 0, 1, 1,
-1.51924, -0.1237229, -0.6849048, 0, 0, 0, 1, 1,
-1.517203, 0.0007668354, -0.3977102, 1, 1, 1, 1, 1,
-1.514059, -1.547313, -2.176579, 1, 1, 1, 1, 1,
-1.513804, 0.4439739, -1.337974, 1, 1, 1, 1, 1,
-1.496073, 0.9247429, -0.6096343, 1, 1, 1, 1, 1,
-1.495413, 0.0191437, -3.198032, 1, 1, 1, 1, 1,
-1.491431, 0.3123356, -1.670157, 1, 1, 1, 1, 1,
-1.480938, -0.9040864, -3.008307, 1, 1, 1, 1, 1,
-1.480365, 0.4626041, 0.1079077, 1, 1, 1, 1, 1,
-1.480239, -0.718143, -1.329672, 1, 1, 1, 1, 1,
-1.480025, 1.265936, -1.502574, 1, 1, 1, 1, 1,
-1.472023, -0.287213, -0.7415933, 1, 1, 1, 1, 1,
-1.465847, 0.01069527, -1.562099, 1, 1, 1, 1, 1,
-1.459088, 1.287659, -1.26795, 1, 1, 1, 1, 1,
-1.448941, 0.3518482, -1.662406, 1, 1, 1, 1, 1,
-1.434048, 2.23407, 1.418119, 1, 1, 1, 1, 1,
-1.43281, -0.901902, -1.311272, 0, 0, 1, 1, 1,
-1.424192, -0.9986015, -3.126873, 1, 0, 0, 1, 1,
-1.423789, -2.019627, -2.376144, 1, 0, 0, 1, 1,
-1.42272, -0.1894958, -1.378109, 1, 0, 0, 1, 1,
-1.417073, 0.4410116, -0.4473868, 1, 0, 0, 1, 1,
-1.412702, 0.9393971, -0.708024, 1, 0, 0, 1, 1,
-1.412456, 0.1230659, -0.5145948, 0, 0, 0, 1, 1,
-1.412081, -1.214648, -1.261681, 0, 0, 0, 1, 1,
-1.410019, -0.2144491, -1.54012, 0, 0, 0, 1, 1,
-1.38865, 1.077826, -0.6172681, 0, 0, 0, 1, 1,
-1.377233, 0.1100582, -2.987376, 0, 0, 0, 1, 1,
-1.376487, -1.178916, -2.391479, 0, 0, 0, 1, 1,
-1.369773, 1.594189, 0.8348914, 0, 0, 0, 1, 1,
-1.36171, -0.3323279, -4.21208, 1, 1, 1, 1, 1,
-1.356776, 2.188978, -1.036154, 1, 1, 1, 1, 1,
-1.355534, 1.480517, 0.5375078, 1, 1, 1, 1, 1,
-1.337029, 0.3560784, -0.3910555, 1, 1, 1, 1, 1,
-1.336917, 0.666548, -0.877502, 1, 1, 1, 1, 1,
-1.323547, -1.420645, -2.728349, 1, 1, 1, 1, 1,
-1.323399, -0.8015671, -2.939837, 1, 1, 1, 1, 1,
-1.321065, -0.1832362, 1.054764, 1, 1, 1, 1, 1,
-1.319609, 1.585366, -1.011172, 1, 1, 1, 1, 1,
-1.303247, -0.9138741, -2.527027, 1, 1, 1, 1, 1,
-1.287796, 0.3076137, -1.876213, 1, 1, 1, 1, 1,
-1.287163, 0.1780544, -2.603099, 1, 1, 1, 1, 1,
-1.283913, -0.8455877, -1.667677, 1, 1, 1, 1, 1,
-1.283319, -1.568825, -2.00663, 1, 1, 1, 1, 1,
-1.277453, 0.8960871, -2.612989, 1, 1, 1, 1, 1,
-1.275926, 1.192564, -0.7127339, 0, 0, 1, 1, 1,
-1.273918, -0.5482023, -2.755319, 1, 0, 0, 1, 1,
-1.271572, -0.5332279, -0.81836, 1, 0, 0, 1, 1,
-1.270329, -1.925025, -1.761046, 1, 0, 0, 1, 1,
-1.269898, -0.8882849, -1.501815, 1, 0, 0, 1, 1,
-1.265456, 0.480886, -1.12826, 1, 0, 0, 1, 1,
-1.255387, 0.2611171, -1.431562, 0, 0, 0, 1, 1,
-1.236343, -1.036878, -2.931504, 0, 0, 0, 1, 1,
-1.231658, -0.9745629, -1.553026, 0, 0, 0, 1, 1,
-1.22333, 0.8151619, 0.5681715, 0, 0, 0, 1, 1,
-1.218791, -0.1164292, -2.417893, 0, 0, 0, 1, 1,
-1.2186, -0.1533256, -1.712557, 0, 0, 0, 1, 1,
-1.210201, 0.7087249, 0.496427, 0, 0, 0, 1, 1,
-1.20691, -1.538931, -3.211891, 1, 1, 1, 1, 1,
-1.201406, 0.4104857, 0.6857736, 1, 1, 1, 1, 1,
-1.200209, 0.6081611, 0.02506791, 1, 1, 1, 1, 1,
-1.196663, 0.4139998, -0.2818354, 1, 1, 1, 1, 1,
-1.191311, 0.8699415, -0.05565677, 1, 1, 1, 1, 1,
-1.187107, 1.100022, 0.1586658, 1, 1, 1, 1, 1,
-1.185755, -1.072655, -0.7879257, 1, 1, 1, 1, 1,
-1.181283, -0.5973902, -1.300566, 1, 1, 1, 1, 1,
-1.17818, 0.09644006, -2.073306, 1, 1, 1, 1, 1,
-1.174255, -0.06120235, -0.2778345, 1, 1, 1, 1, 1,
-1.169924, -0.1474923, -1.782053, 1, 1, 1, 1, 1,
-1.169479, 0.8170467, -0.9750935, 1, 1, 1, 1, 1,
-1.162143, 0.2355951, -2.844565, 1, 1, 1, 1, 1,
-1.153034, -0.5787268, -0.9442564, 1, 1, 1, 1, 1,
-1.150839, -1.010431, -2.358155, 1, 1, 1, 1, 1,
-1.149589, 1.823991, -0.6305774, 0, 0, 1, 1, 1,
-1.146451, 1.890738, 0.3218744, 1, 0, 0, 1, 1,
-1.142779, 0.2822981, -0.4170621, 1, 0, 0, 1, 1,
-1.139874, -1.484531, -1.785321, 1, 0, 0, 1, 1,
-1.129607, 0.2215375, -0.8168896, 1, 0, 0, 1, 1,
-1.125317, -1.259232, -3.323394, 1, 0, 0, 1, 1,
-1.121768, -0.9388105, -3.223176, 0, 0, 0, 1, 1,
-1.107586, 0.2180808, -2.657001, 0, 0, 0, 1, 1,
-1.094529, 0.9577489, -1.584798, 0, 0, 0, 1, 1,
-1.092958, -2.267242, -3.234815, 0, 0, 0, 1, 1,
-1.086034, 1.080272, -1.10391, 0, 0, 0, 1, 1,
-1.085816, 0.592567, -2.352721, 0, 0, 0, 1, 1,
-1.082756, 1.206576, 0.1579746, 0, 0, 0, 1, 1,
-1.071258, -1.28967, -2.614995, 1, 1, 1, 1, 1,
-1.069049, -0.3309499, -0.7890014, 1, 1, 1, 1, 1,
-1.056722, 1.667287, -0.686852, 1, 1, 1, 1, 1,
-1.055123, 0.5425007, -2.101233, 1, 1, 1, 1, 1,
-1.053398, -0.6577816, -3.262601, 1, 1, 1, 1, 1,
-1.053155, 0.1584405, -1.863849, 1, 1, 1, 1, 1,
-1.050146, -0.9644942, -1.977077, 1, 1, 1, 1, 1,
-1.046599, -1.35556, -2.219601, 1, 1, 1, 1, 1,
-1.045677, 0.7724482, -1.282922, 1, 1, 1, 1, 1,
-1.042265, -1.255184, -2.283851, 1, 1, 1, 1, 1,
-1.031853, 1.870436, -1.102866, 1, 1, 1, 1, 1,
-1.023278, -0.1045411, -2.155935, 1, 1, 1, 1, 1,
-1.021446, 0.1456053, -2.559184, 1, 1, 1, 1, 1,
-1.004481, 1.997266, -1.138348, 1, 1, 1, 1, 1,
-1.000408, -0.01457923, -0.6784471, 1, 1, 1, 1, 1,
-0.9985471, -0.1085763, -1.693575, 0, 0, 1, 1, 1,
-0.9900606, 1.441872, -0.1967638, 1, 0, 0, 1, 1,
-0.9783453, 0.374585, -1.004955, 1, 0, 0, 1, 1,
-0.9732287, -0.493939, -0.9909375, 1, 0, 0, 1, 1,
-0.9666741, -0.6748819, -1.364961, 1, 0, 0, 1, 1,
-0.9528824, -0.007442478, -1.310923, 1, 0, 0, 1, 1,
-0.9503553, 0.1297468, -1.119368, 0, 0, 0, 1, 1,
-0.9435843, -1.030351, -2.751962, 0, 0, 0, 1, 1,
-0.9392532, -0.1427539, -1.454823, 0, 0, 0, 1, 1,
-0.9387136, -1.236723, -1.989354, 0, 0, 0, 1, 1,
-0.9340889, -1.651298, -1.398742, 0, 0, 0, 1, 1,
-0.928031, -0.8251253, -3.491597, 0, 0, 0, 1, 1,
-0.9266192, 0.502297, -0.456526, 0, 0, 0, 1, 1,
-0.9246432, 0.04508019, -0.9448785, 1, 1, 1, 1, 1,
-0.9198437, 0.2628112, -1.758549, 1, 1, 1, 1, 1,
-0.9185134, 0.6148347, -1.328055, 1, 1, 1, 1, 1,
-0.9177159, -0.7096056, -2.108051, 1, 1, 1, 1, 1,
-0.9168438, 1.42914, -1.509133, 1, 1, 1, 1, 1,
-0.9141485, -0.2765213, -2.860248, 1, 1, 1, 1, 1,
-0.9128169, -0.3166704, -3.711239, 1, 1, 1, 1, 1,
-0.9109903, 0.8191795, -0.8729166, 1, 1, 1, 1, 1,
-0.9102543, 0.4257294, -0.1981654, 1, 1, 1, 1, 1,
-0.9071262, -1.900804, -2.255947, 1, 1, 1, 1, 1,
-0.9046748, 1.847759, 0.6059021, 1, 1, 1, 1, 1,
-0.8913808, 0.3241477, -0.8741248, 1, 1, 1, 1, 1,
-0.8865998, 2.589024, 1.208803, 1, 1, 1, 1, 1,
-0.871465, -0.805517, -2.677974, 1, 1, 1, 1, 1,
-0.865361, -0.7910917, -2.860373, 1, 1, 1, 1, 1,
-0.8649926, -0.4445735, -0.9713243, 0, 0, 1, 1, 1,
-0.863414, 1.700549, 1.183459, 1, 0, 0, 1, 1,
-0.8474237, 1.063973, 0.7905414, 1, 0, 0, 1, 1,
-0.8459473, 1.608192, -0.8270332, 1, 0, 0, 1, 1,
-0.8426607, 1.498846, -0.3272432, 1, 0, 0, 1, 1,
-0.8351967, 0.3192349, -1.442412, 1, 0, 0, 1, 1,
-0.8280941, -1.088759, -2.99362, 0, 0, 0, 1, 1,
-0.8279522, -0.2655043, -2.094714, 0, 0, 0, 1, 1,
-0.8260077, 0.6253982, 0.1279922, 0, 0, 0, 1, 1,
-0.8241351, -0.1251004, -1.522665, 0, 0, 0, 1, 1,
-0.8236645, -0.01265719, -2.050807, 0, 0, 0, 1, 1,
-0.8225392, -0.4053833, -3.267282, 0, 0, 0, 1, 1,
-0.8208399, -1.361675, -1.43363, 0, 0, 0, 1, 1,
-0.8198273, 0.3047667, -3.386799, 1, 1, 1, 1, 1,
-0.8183598, 0.7764322, -1.78658, 1, 1, 1, 1, 1,
-0.8153515, 0.6481863, -1.228921, 1, 1, 1, 1, 1,
-0.8093508, -0.80728, -1.973694, 1, 1, 1, 1, 1,
-0.8092644, 0.7390547, -1.541856, 1, 1, 1, 1, 1,
-0.7992746, -1.087946, -2.89264, 1, 1, 1, 1, 1,
-0.7760123, 1.261227, 0.6418244, 1, 1, 1, 1, 1,
-0.7737062, 0.9631354, -0.2062381, 1, 1, 1, 1, 1,
-0.7721621, 0.4610618, -0.2063663, 1, 1, 1, 1, 1,
-0.768684, -2.07366, -3.989182, 1, 1, 1, 1, 1,
-0.7660904, -1.36741, -2.267444, 1, 1, 1, 1, 1,
-0.7655952, 0.6697519, -1.299275, 1, 1, 1, 1, 1,
-0.7645559, 0.7631586, 1.173275, 1, 1, 1, 1, 1,
-0.7642119, -0.5685351, -1.669535, 1, 1, 1, 1, 1,
-0.763209, -0.6691992, -2.91243, 1, 1, 1, 1, 1,
-0.7608215, 0.2433678, -1.160728, 0, 0, 1, 1, 1,
-0.7528764, 0.2252704, -0.7562189, 1, 0, 0, 1, 1,
-0.7497697, -0.9962209, -2.936338, 1, 0, 0, 1, 1,
-0.7481315, 1.696797, -0.3684375, 1, 0, 0, 1, 1,
-0.7426727, 0.1868495, -0.9020395, 1, 0, 0, 1, 1,
-0.7383927, -1.618971, -1.093107, 1, 0, 0, 1, 1,
-0.7287309, 1.096461, -0.584677, 0, 0, 0, 1, 1,
-0.7257221, -0.5090863, -1.921153, 0, 0, 0, 1, 1,
-0.7243217, -1.192644, -2.477878, 0, 0, 0, 1, 1,
-0.7228243, 1.022566, -0.8354926, 0, 0, 0, 1, 1,
-0.7216603, -0.4676256, 0.2053706, 0, 0, 0, 1, 1,
-0.7202977, 0.2540257, -2.01476, 0, 0, 0, 1, 1,
-0.7200647, 1.027166, 1.176453, 0, 0, 0, 1, 1,
-0.7146905, 0.2844941, -0.5363411, 1, 1, 1, 1, 1,
-0.7126689, 0.7936439, -2.734898, 1, 1, 1, 1, 1,
-0.711655, -0.2038005, -2.762219, 1, 1, 1, 1, 1,
-0.7105172, -1.061274, -2.661044, 1, 1, 1, 1, 1,
-0.704708, -1.200673, -2.704583, 1, 1, 1, 1, 1,
-0.7040196, -1.363908, -3.219475, 1, 1, 1, 1, 1,
-0.7023804, 0.02654944, -1.604037, 1, 1, 1, 1, 1,
-0.6995705, -1.417549, -3.835101, 1, 1, 1, 1, 1,
-0.6939931, 1.363135, 0.4125744, 1, 1, 1, 1, 1,
-0.6937351, -2.057602, -2.91326, 1, 1, 1, 1, 1,
-0.6923322, -0.2152075, -1.798392, 1, 1, 1, 1, 1,
-0.6884795, 0.4941614, 0.01582093, 1, 1, 1, 1, 1,
-0.6837986, 0.4779108, 0.9141065, 1, 1, 1, 1, 1,
-0.6805604, 1.562247, -1.352299, 1, 1, 1, 1, 1,
-0.6801345, -0.8272541, -3.419366, 1, 1, 1, 1, 1,
-0.6726018, -1.67322, -2.13875, 0, 0, 1, 1, 1,
-0.6724634, -0.8804207, -1.667045, 1, 0, 0, 1, 1,
-0.6698987, -0.8289075, -4.202628, 1, 0, 0, 1, 1,
-0.6665443, -0.2301963, -2.005809, 1, 0, 0, 1, 1,
-0.6661262, 1.921222, -0.6053157, 1, 0, 0, 1, 1,
-0.665703, 0.606686, -0.01440852, 1, 0, 0, 1, 1,
-0.6648686, 0.2554775, -1.820832, 0, 0, 0, 1, 1,
-0.6646734, 0.1637549, -0.8228559, 0, 0, 0, 1, 1,
-0.6624612, -1.922265, -3.053776, 0, 0, 0, 1, 1,
-0.6599553, 0.4441377, 0.2009869, 0, 0, 0, 1, 1,
-0.6563649, -0.01407786, -0.4516123, 0, 0, 0, 1, 1,
-0.6499513, 0.418825, -1.694693, 0, 0, 0, 1, 1,
-0.6448966, -0.8464628, -1.664096, 0, 0, 0, 1, 1,
-0.6446575, 0.07276016, -1.444448, 1, 1, 1, 1, 1,
-0.6416498, -1.709849, -1.64168, 1, 1, 1, 1, 1,
-0.6397917, 0.3572278, -1.711225, 1, 1, 1, 1, 1,
-0.6391135, -2.901804, -2.941454, 1, 1, 1, 1, 1,
-0.638629, 1.175614, 0.2405952, 1, 1, 1, 1, 1,
-0.6366422, 1.34218, 0.5903796, 1, 1, 1, 1, 1,
-0.6298621, 0.988853, -1.429253, 1, 1, 1, 1, 1,
-0.6249339, -1.14853, -2.256627, 1, 1, 1, 1, 1,
-0.6142178, -1.748162, -3.652206, 1, 1, 1, 1, 1,
-0.6134185, -0.3331768, -3.721527, 1, 1, 1, 1, 1,
-0.6003552, -0.6549051, -2.969038, 1, 1, 1, 1, 1,
-0.5999919, -0.9366507, -2.963468, 1, 1, 1, 1, 1,
-0.59982, 1.389796, -0.2501449, 1, 1, 1, 1, 1,
-0.5981055, 1.570925, -1.466778, 1, 1, 1, 1, 1,
-0.5965207, 0.9328023, -1.79642, 1, 1, 1, 1, 1,
-0.5920907, 0.1748984, -1.415985, 0, 0, 1, 1, 1,
-0.5897426, -0.5892219, -2.874087, 1, 0, 0, 1, 1,
-0.5883193, 0.5931173, -0.6825147, 1, 0, 0, 1, 1,
-0.5860003, 0.1539338, -1.368487, 1, 0, 0, 1, 1,
-0.582725, 1.039558, 0.7096654, 1, 0, 0, 1, 1,
-0.5801546, 0.8111511, -1.85297, 1, 0, 0, 1, 1,
-0.5655574, 0.9958254, -0.3448989, 0, 0, 0, 1, 1,
-0.5612243, 0.8722159, -0.5383732, 0, 0, 0, 1, 1,
-0.555837, 0.9731968, -0.2740427, 0, 0, 0, 1, 1,
-0.5540591, -0.4706777, -3.134117, 0, 0, 0, 1, 1,
-0.549877, 0.139789, -2.953372, 0, 0, 0, 1, 1,
-0.5485276, -0.1869933, -1.950233, 0, 0, 0, 1, 1,
-0.547293, -0.3545775, -0.9277563, 0, 0, 0, 1, 1,
-0.5464432, -0.3273285, -1.896958, 1, 1, 1, 1, 1,
-0.5445709, -0.5201468, -1.283885, 1, 1, 1, 1, 1,
-0.5420409, 0.7521377, 1.921676, 1, 1, 1, 1, 1,
-0.5393518, 1.956786, 0.2067972, 1, 1, 1, 1, 1,
-0.5379465, 0.7408237, -0.06706931, 1, 1, 1, 1, 1,
-0.5329894, 0.2821467, -0.5188299, 1, 1, 1, 1, 1,
-0.5244744, -1.18594, -3.566968, 1, 1, 1, 1, 1,
-0.5241412, -0.8958234, -1.831833, 1, 1, 1, 1, 1,
-0.5226397, -0.9814061, -2.821559, 1, 1, 1, 1, 1,
-0.5191512, 1.4888, 0.9456269, 1, 1, 1, 1, 1,
-0.5147637, 0.0745009, -1.046404, 1, 1, 1, 1, 1,
-0.5144345, 0.6792266, 0.5071877, 1, 1, 1, 1, 1,
-0.513093, 0.1129, -2.110097, 1, 1, 1, 1, 1,
-0.5124303, -1.442807, -3.961879, 1, 1, 1, 1, 1,
-0.5116383, -1.184448, -2.518838, 1, 1, 1, 1, 1,
-0.5078857, -0.3295882, -2.261148, 0, 0, 1, 1, 1,
-0.5032597, -1.993236, -2.687108, 1, 0, 0, 1, 1,
-0.5020503, 0.5197868, -0.4095953, 1, 0, 0, 1, 1,
-0.4994588, -0.9773768, -2.011501, 1, 0, 0, 1, 1,
-0.4925325, -0.9481962, -2.912567, 1, 0, 0, 1, 1,
-0.4916543, -0.4414306, -2.776758, 1, 0, 0, 1, 1,
-0.4915102, 1.918311, -2.097996, 0, 0, 0, 1, 1,
-0.4899924, 0.2652298, 0.7832975, 0, 0, 0, 1, 1,
-0.4884121, -1.294647, -3.707363, 0, 0, 0, 1, 1,
-0.488276, 0.8681221, -1.397287, 0, 0, 0, 1, 1,
-0.4776794, -0.6649241, -2.600734, 0, 0, 0, 1, 1,
-0.4770754, -0.24358, -1.552214, 0, 0, 0, 1, 1,
-0.4746148, -2.458699, -3.528769, 0, 0, 0, 1, 1,
-0.4745268, -1.088264, -3.715106, 1, 1, 1, 1, 1,
-0.4745089, -0.9552747, -2.720754, 1, 1, 1, 1, 1,
-0.4668311, -1.04615, -2.135544, 1, 1, 1, 1, 1,
-0.4636067, 0.07146359, -1.242844, 1, 1, 1, 1, 1,
-0.4586561, 0.3661065, -0.8634781, 1, 1, 1, 1, 1,
-0.4574776, 1.096397, -1.386284, 1, 1, 1, 1, 1,
-0.4526605, -1.440275, -3.222441, 1, 1, 1, 1, 1,
-0.4523849, -0.2580921, -1.299707, 1, 1, 1, 1, 1,
-0.450603, 0.3951725, -1.815954, 1, 1, 1, 1, 1,
-0.4490583, 0.9228593, 0.9016919, 1, 1, 1, 1, 1,
-0.4428579, 0.284557, -1.724239, 1, 1, 1, 1, 1,
-0.4367944, 1.72387, -0.7051692, 1, 1, 1, 1, 1,
-0.4263388, -0.2338779, -2.796125, 1, 1, 1, 1, 1,
-0.4262476, 0.4155658, -1.831529, 1, 1, 1, 1, 1,
-0.4227479, -0.6341377, -3.708876, 1, 1, 1, 1, 1,
-0.4191387, -0.4082015, -1.573465, 0, 0, 1, 1, 1,
-0.4186765, 0.6948579, -1.083638, 1, 0, 0, 1, 1,
-0.4155513, -0.475808, -2.154413, 1, 0, 0, 1, 1,
-0.4107812, 1.37541, -1.414238, 1, 0, 0, 1, 1,
-0.4102328, -1.269718, -3.562768, 1, 0, 0, 1, 1,
-0.4080692, -3.763239, -2.134917, 1, 0, 0, 1, 1,
-0.4080407, -0.6187489, -1.530361, 0, 0, 0, 1, 1,
-0.4065683, -1.783993, -3.266309, 0, 0, 0, 1, 1,
-0.4018618, -1.344671, -4.532533, 0, 0, 0, 1, 1,
-0.4007192, 1.225624, 0.4349212, 0, 0, 0, 1, 1,
-0.3997804, -0.7022342, -1.200216, 0, 0, 0, 1, 1,
-0.3969648, -0.02420183, -2.111565, 0, 0, 0, 1, 1,
-0.3968945, -1.156484, -2.816244, 0, 0, 0, 1, 1,
-0.3951676, 0.2387498, 0.1961456, 1, 1, 1, 1, 1,
-0.3891577, -0.05972748, -2.00519, 1, 1, 1, 1, 1,
-0.3876218, 1.143938, -0.7442231, 1, 1, 1, 1, 1,
-0.3864722, 0.8003183, -0.3074322, 1, 1, 1, 1, 1,
-0.3829313, 0.8193333, -0.2928827, 1, 1, 1, 1, 1,
-0.3821677, 0.3487439, -0.5568057, 1, 1, 1, 1, 1,
-0.3821055, 1.950713, 0.3928128, 1, 1, 1, 1, 1,
-0.3801163, -1.910686, -1.436585, 1, 1, 1, 1, 1,
-0.3716821, 1.765076, -2.382486, 1, 1, 1, 1, 1,
-0.3663634, 0.1911509, -0.882923, 1, 1, 1, 1, 1,
-0.3638522, -0.2840994, -2.948022, 1, 1, 1, 1, 1,
-0.3629559, 1.822133, -0.3587941, 1, 1, 1, 1, 1,
-0.3609384, -0.5743908, -3.10756, 1, 1, 1, 1, 1,
-0.3589738, -1.746619, -2.28972, 1, 1, 1, 1, 1,
-0.3589462, 0.4610777, -1.21777, 1, 1, 1, 1, 1,
-0.3585568, -0.7510433, -4.881876, 0, 0, 1, 1, 1,
-0.3467072, -0.07055269, -1.093668, 1, 0, 0, 1, 1,
-0.3380935, 0.08196443, -1.079415, 1, 0, 0, 1, 1,
-0.3372453, 0.07967311, -0.207975, 1, 0, 0, 1, 1,
-0.3363172, -0.3951332, -1.441614, 1, 0, 0, 1, 1,
-0.333598, 1.563533, 1.444882, 1, 0, 0, 1, 1,
-0.3335541, 0.05194402, -0.4603083, 0, 0, 0, 1, 1,
-0.3334028, 0.8986156, -1.921362, 0, 0, 0, 1, 1,
-0.3310193, -0.8248215, -2.278313, 0, 0, 0, 1, 1,
-0.3256964, -1.659032, -2.573429, 0, 0, 0, 1, 1,
-0.3234297, -1.197766, -0.2390314, 0, 0, 0, 1, 1,
-0.3200697, 0.1703306, -1.129034, 0, 0, 0, 1, 1,
-0.3195798, 1.244717, -1.064626, 0, 0, 0, 1, 1,
-0.3168968, 1.122182, -1.011366, 1, 1, 1, 1, 1,
-0.3157324, 0.1649338, -0.6469851, 1, 1, 1, 1, 1,
-0.3156861, -0.4085368, -2.681469, 1, 1, 1, 1, 1,
-0.3136473, -1.164858, -3.219028, 1, 1, 1, 1, 1,
-0.3102693, -1.486503, -0.6480337, 1, 1, 1, 1, 1,
-0.3042014, 0.09547199, -1.539962, 1, 1, 1, 1, 1,
-0.3030182, 1.510461, 0.3798012, 1, 1, 1, 1, 1,
-0.2982824, 2.271962, -0.2025631, 1, 1, 1, 1, 1,
-0.2944067, 1.077912, -1.337032, 1, 1, 1, 1, 1,
-0.2845119, -0.03583809, -0.9332314, 1, 1, 1, 1, 1,
-0.2832917, -0.64679, -1.403729, 1, 1, 1, 1, 1,
-0.28251, 1.657614, -0.3410109, 1, 1, 1, 1, 1,
-0.2733805, 0.4154701, 2.068806, 1, 1, 1, 1, 1,
-0.2709775, -0.3857954, -2.718142, 1, 1, 1, 1, 1,
-0.2700859, 0.4086354, -1.363765, 1, 1, 1, 1, 1,
-0.2660368, -0.07667729, -1.191053, 0, 0, 1, 1, 1,
-0.2598518, -0.08720415, -1.072605, 1, 0, 0, 1, 1,
-0.2581735, 0.2034976, -1.309444, 1, 0, 0, 1, 1,
-0.2577045, 0.1976161, -2.698913, 1, 0, 0, 1, 1,
-0.2565848, 0.4330815, 0.8018828, 1, 0, 0, 1, 1,
-0.2565449, -0.5707537, -3.036475, 1, 0, 0, 1, 1,
-0.2554519, -0.4219635, -2.929298, 0, 0, 0, 1, 1,
-0.2539198, 1.029606, -2.034135, 0, 0, 0, 1, 1,
-0.2435755, 1.627627, -0.1416484, 0, 0, 0, 1, 1,
-0.2433984, -1.091522, -2.277065, 0, 0, 0, 1, 1,
-0.240203, -0.5103372, -3.312553, 0, 0, 0, 1, 1,
-0.2364625, 1.639683, -0.2045149, 0, 0, 0, 1, 1,
-0.2299741, -0.6462541, -1.186897, 0, 0, 0, 1, 1,
-0.2186229, -1.302448, -2.831736, 1, 1, 1, 1, 1,
-0.2173704, 0.4638841, -0.3350861, 1, 1, 1, 1, 1,
-0.2137471, 0.165263, -1.248521, 1, 1, 1, 1, 1,
-0.2104738, -0.6320714, -3.344541, 1, 1, 1, 1, 1,
-0.2095906, -0.9904501, -3.871684, 1, 1, 1, 1, 1,
-0.2075183, -0.4677968, -2.905194, 1, 1, 1, 1, 1,
-0.2017756, -0.2154316, -3.359547, 1, 1, 1, 1, 1,
-0.2003415, -1.482152, -3.499328, 1, 1, 1, 1, 1,
-0.1968945, -0.6469647, -3.121296, 1, 1, 1, 1, 1,
-0.1967783, 0.9903857, 0.4786137, 1, 1, 1, 1, 1,
-0.1959207, -2.175548, -1.474079, 1, 1, 1, 1, 1,
-0.194274, -0.3864724, -0.9479207, 1, 1, 1, 1, 1,
-0.1889349, 0.2589764, -0.9336385, 1, 1, 1, 1, 1,
-0.1866394, 1.548919, 0.02472691, 1, 1, 1, 1, 1,
-0.1844198, 2.53247, 1.92412, 1, 1, 1, 1, 1,
-0.1651338, 0.5168046, 1.028037, 0, 0, 1, 1, 1,
-0.1645339, -0.1311215, -2.085275, 1, 0, 0, 1, 1,
-0.1528143, 0.7879492, 0.4876492, 1, 0, 0, 1, 1,
-0.1469984, 0.4068764, -1.306658, 1, 0, 0, 1, 1,
-0.1415656, -0.02036748, -2.676447, 1, 0, 0, 1, 1,
-0.1356251, 0.3841473, -0.5999973, 1, 0, 0, 1, 1,
-0.1333243, 0.9596312, -0.3821834, 0, 0, 0, 1, 1,
-0.1316269, 1.576514, -0.8065948, 0, 0, 0, 1, 1,
-0.1311024, -0.1866861, -1.247524, 0, 0, 0, 1, 1,
-0.1305658, 0.9435263, -1.446373, 0, 0, 0, 1, 1,
-0.1262751, 0.3082974, 0.6302827, 0, 0, 0, 1, 1,
-0.1258182, -0.0298259, -1.427719, 0, 0, 0, 1, 1,
-0.1250734, -0.5335857, -1.560839, 0, 0, 0, 1, 1,
-0.118149, -0.9330439, -3.440694, 1, 1, 1, 1, 1,
-0.1178369, -0.7463635, -1.923792, 1, 1, 1, 1, 1,
-0.1167547, -0.7254424, -1.192083, 1, 1, 1, 1, 1,
-0.1165394, -0.002155899, -2.698009, 1, 1, 1, 1, 1,
-0.1148429, 1.002399, -0.5261272, 1, 1, 1, 1, 1,
-0.1146787, 1.552315, 0.2625516, 1, 1, 1, 1, 1,
-0.1126671, -0.4170179, -2.494575, 1, 1, 1, 1, 1,
-0.1112463, 1.36551, 0.295461, 1, 1, 1, 1, 1,
-0.1108602, 1.017972, 1.06376, 1, 1, 1, 1, 1,
-0.1019828, -0.4158407, -1.849678, 1, 1, 1, 1, 1,
-0.09892352, 0.7287452, 2.002644, 1, 1, 1, 1, 1,
-0.09239119, 1.359503, -0.108085, 1, 1, 1, 1, 1,
-0.09204216, 0.8848267, 0.5853415, 1, 1, 1, 1, 1,
-0.09168331, 0.07156099, 1.205762, 1, 1, 1, 1, 1,
-0.08863489, 0.8004066, -0.6632336, 1, 1, 1, 1, 1,
-0.0857545, -1.00172, -3.20891, 0, 0, 1, 1, 1,
-0.08331569, -0.1303226, -1.247817, 1, 0, 0, 1, 1,
-0.08329955, -0.5831914, -3.710119, 1, 0, 0, 1, 1,
-0.08001362, -0.3304987, -1.628129, 1, 0, 0, 1, 1,
-0.0759237, 0.2704648, -1.484292, 1, 0, 0, 1, 1,
-0.0732569, 0.1283812, 0.1697273, 1, 0, 0, 1, 1,
-0.06848856, -1.228478, -2.940956, 0, 0, 0, 1, 1,
-0.06654781, -0.05909096, -2.801645, 0, 0, 0, 1, 1,
-0.06450965, -0.7789124, -3.858835, 0, 0, 0, 1, 1,
-0.06434591, -1.175477, -0.7166579, 0, 0, 0, 1, 1,
-0.06373502, -0.3701351, -1.418051, 0, 0, 0, 1, 1,
-0.06354921, 0.4896138, -0.1710754, 0, 0, 0, 1, 1,
-0.05873065, -0.7310116, -3.664119, 0, 0, 0, 1, 1,
-0.05701178, 0.214154, 0.350174, 1, 1, 1, 1, 1,
-0.05598645, -0.3960629, -2.924865, 1, 1, 1, 1, 1,
-0.05523979, 0.5494042, 1.366255, 1, 1, 1, 1, 1,
-0.05346343, -0.6451654, -0.303691, 1, 1, 1, 1, 1,
-0.05095683, -0.3725736, -2.191338, 1, 1, 1, 1, 1,
-0.04912612, -0.8502802, -2.937162, 1, 1, 1, 1, 1,
-0.0442819, -0.2740671, -3.290525, 1, 1, 1, 1, 1,
-0.04141221, 0.3502358, 1.241925, 1, 1, 1, 1, 1,
-0.03778651, 0.6553465, -0.2049435, 1, 1, 1, 1, 1,
-0.03650201, 0.7002494, 0.9161603, 1, 1, 1, 1, 1,
-0.03489014, 1.045749, 0.2666803, 1, 1, 1, 1, 1,
-0.03271418, -0.3793174, -1.472495, 1, 1, 1, 1, 1,
-0.03110938, -0.6395491, -2.580277, 1, 1, 1, 1, 1,
-0.03050723, 0.6174632, -0.5405334, 1, 1, 1, 1, 1,
-0.0261609, -1.560902, -3.703341, 1, 1, 1, 1, 1,
-0.02480167, -0.3221636, -2.888849, 0, 0, 1, 1, 1,
-0.02225436, -1.731864, -2.143833, 1, 0, 0, 1, 1,
-0.0218522, 0.4711676, 0.654981, 1, 0, 0, 1, 1,
-0.02100956, -1.004209, -2.990174, 1, 0, 0, 1, 1,
-0.02058426, -1.351733, -3.944734, 1, 0, 0, 1, 1,
-0.0201064, 0.3943323, -0.3182754, 1, 0, 0, 1, 1,
-0.01699466, 1.00125, -0.5350483, 0, 0, 0, 1, 1,
-0.01390163, -0.2258198, -1.533573, 0, 0, 0, 1, 1,
-0.01122931, -1.259693, -3.696139, 0, 0, 0, 1, 1,
-0.008810919, 0.5870351, -1.770041, 0, 0, 0, 1, 1,
-0.008391705, 1.492062, -1.982899, 0, 0, 0, 1, 1,
-0.00525285, 1.098671, -0.3634191, 0, 0, 0, 1, 1,
-0.004585776, 1.346548, 0.3812415, 0, 0, 0, 1, 1,
-0.003669183, 0.362684, -0.514174, 1, 1, 1, 1, 1,
-0.002762274, -0.7653067, -2.847039, 1, 1, 1, 1, 1,
-0.001703174, 0.2044212, -0.3851025, 1, 1, 1, 1, 1,
-0.0003567967, -1.212645, -1.716282, 1, 1, 1, 1, 1,
0.001705416, -0.5458351, 2.173496, 1, 1, 1, 1, 1,
0.002638197, -1.567011, 3.302807, 1, 1, 1, 1, 1,
0.006099815, 0.03498682, 2.244232, 1, 1, 1, 1, 1,
0.008650455, 2.667373, -1.60491, 1, 1, 1, 1, 1,
0.009543159, -2.233203, 3.317592, 1, 1, 1, 1, 1,
0.01182213, 1.729374, -0.3084482, 1, 1, 1, 1, 1,
0.0157162, -1.198192, 3.765627, 1, 1, 1, 1, 1,
0.02061608, 0.3255784, -0.1393538, 1, 1, 1, 1, 1,
0.03362304, 1.038577, 0.6774278, 1, 1, 1, 1, 1,
0.03690951, 0.9020026, 1.096412, 1, 1, 1, 1, 1,
0.04460164, 1.142484, -1.002383, 1, 1, 1, 1, 1,
0.04612064, -0.4514959, 3.175102, 0, 0, 1, 1, 1,
0.0514999, 1.798908, 0.5207291, 1, 0, 0, 1, 1,
0.05447149, -1.214482, 3.759456, 1, 0, 0, 1, 1,
0.05592779, -1.945222, 4.586801, 1, 0, 0, 1, 1,
0.06078656, -0.1225848, 3.15671, 1, 0, 0, 1, 1,
0.06573589, 2.507167, 1.300962, 1, 0, 0, 1, 1,
0.06894007, 1.419303, 1.054042, 0, 0, 0, 1, 1,
0.06973154, 2.196543, 0.1998976, 0, 0, 0, 1, 1,
0.0746203, 0.09191249, 1.726687, 0, 0, 0, 1, 1,
0.08039961, -0.4899072, 0.5595722, 0, 0, 0, 1, 1,
0.08070189, -0.5053172, 2.217867, 0, 0, 0, 1, 1,
0.0807735, 0.1785316, 1.782911, 0, 0, 0, 1, 1,
0.08109546, -0.898036, 4.057978, 0, 0, 0, 1, 1,
0.08597422, 1.174482, 0.7831334, 1, 1, 1, 1, 1,
0.08838305, -0.95895, 1.795256, 1, 1, 1, 1, 1,
0.08898736, 1.126106, 1.159843, 1, 1, 1, 1, 1,
0.09045682, 0.5927426, 0.2137084, 1, 1, 1, 1, 1,
0.09168173, 0.7447261, 0.7500508, 1, 1, 1, 1, 1,
0.09192769, -0.3018799, 3.026593, 1, 1, 1, 1, 1,
0.09484633, -0.3074644, 2.620556, 1, 1, 1, 1, 1,
0.09614682, -1.468873, 2.239982, 1, 1, 1, 1, 1,
0.1016312, -1.886936, 3.808513, 1, 1, 1, 1, 1,
0.1022639, 0.2245706, 0.4203038, 1, 1, 1, 1, 1,
0.1063678, 1.028797, -0.4739155, 1, 1, 1, 1, 1,
0.1077437, -1.404494, 4.103664, 1, 1, 1, 1, 1,
0.1106754, 0.5721892, 0.5573559, 1, 1, 1, 1, 1,
0.1116118, -0.6409981, 2.108624, 1, 1, 1, 1, 1,
0.1130507, -0.3569147, 3.894661, 1, 1, 1, 1, 1,
0.1140138, 0.4441662, -1.018331, 0, 0, 1, 1, 1,
0.1154746, -0.0196855, 1.283285, 1, 0, 0, 1, 1,
0.1155481, -0.122894, 0.8725501, 1, 0, 0, 1, 1,
0.1191308, -1.252416, 3.512913, 1, 0, 0, 1, 1,
0.1200741, 0.468609, 1.194558, 1, 0, 0, 1, 1,
0.1237034, 0.06844839, 1.43243, 1, 0, 0, 1, 1,
0.1256201, 0.1851168, -1.291985, 0, 0, 0, 1, 1,
0.1303436, 0.9975847, -2.024826, 0, 0, 0, 1, 1,
0.1341423, -0.4759194, 1.296101, 0, 0, 0, 1, 1,
0.1345278, -0.4116067, 1.113113, 0, 0, 0, 1, 1,
0.134916, -2.272267, 2.68281, 0, 0, 0, 1, 1,
0.1382074, 1.303705, 1.083172, 0, 0, 0, 1, 1,
0.1412717, 1.00734, -0.2016397, 0, 0, 0, 1, 1,
0.1429868, -0.8123493, 3.372958, 1, 1, 1, 1, 1,
0.1435831, -0.726842, 1.692704, 1, 1, 1, 1, 1,
0.1447715, -0.08626517, 1.894212, 1, 1, 1, 1, 1,
0.1457884, 0.2174246, 1.182412, 1, 1, 1, 1, 1,
0.1466318, 2.177093, 1.158467, 1, 1, 1, 1, 1,
0.1553644, 1.718002, -0.8645365, 1, 1, 1, 1, 1,
0.1620925, -0.2230759, 1.727376, 1, 1, 1, 1, 1,
0.1649698, -0.952719, 2.429591, 1, 1, 1, 1, 1,
0.1669098, -1.029762, 3.225646, 1, 1, 1, 1, 1,
0.1681536, 1.024865, 0.4514563, 1, 1, 1, 1, 1,
0.1684811, -0.5228409, 2.390611, 1, 1, 1, 1, 1,
0.169548, -0.3636223, 2.360008, 1, 1, 1, 1, 1,
0.1696525, 0.3922426, 0.6951442, 1, 1, 1, 1, 1,
0.1791345, 0.7847303, -0.2235825, 1, 1, 1, 1, 1,
0.1792689, -0.6957373, 3.76397, 1, 1, 1, 1, 1,
0.1793324, 0.02051685, 1.536025, 0, 0, 1, 1, 1,
0.1884722, -0.9834635, 3.309391, 1, 0, 0, 1, 1,
0.1920802, 0.6691391, 0.6942755, 1, 0, 0, 1, 1,
0.195888, -0.3770387, 3.580105, 1, 0, 0, 1, 1,
0.2008435, 0.1308785, -0.2755768, 1, 0, 0, 1, 1,
0.203309, 0.4770211, 0.7859502, 1, 0, 0, 1, 1,
0.2054913, -0.8597174, 4.372186, 0, 0, 0, 1, 1,
0.2067531, 1.102686, 0.3359028, 0, 0, 0, 1, 1,
0.2081359, -1.298883, 4.609117, 0, 0, 0, 1, 1,
0.2084016, 0.2379985, 0.5744093, 0, 0, 0, 1, 1,
0.2085555, -0.9114651, 4.048364, 0, 0, 0, 1, 1,
0.2090299, 0.4273493, 1.043131, 0, 0, 0, 1, 1,
0.2106966, -0.8566823, 3.061644, 0, 0, 0, 1, 1,
0.2129339, -0.01307111, 2.277981, 1, 1, 1, 1, 1,
0.21579, 0.5871665, -0.437683, 1, 1, 1, 1, 1,
0.2161414, 0.3683115, -0.5143576, 1, 1, 1, 1, 1,
0.2175098, 0.04381022, 0.4727767, 1, 1, 1, 1, 1,
0.2192925, 1.06444, -0.3858299, 1, 1, 1, 1, 1,
0.21994, 0.7740915, 0.4052335, 1, 1, 1, 1, 1,
0.2202495, -1.484345, 4.333074, 1, 1, 1, 1, 1,
0.2242684, 1.973609, -0.005344955, 1, 1, 1, 1, 1,
0.2243098, -1.087526, 3.001895, 1, 1, 1, 1, 1,
0.2268975, 0.8764517, 0.2740256, 1, 1, 1, 1, 1,
0.2278688, 0.8514186, 0.1759814, 1, 1, 1, 1, 1,
0.2312757, 0.2956995, 1.671651, 1, 1, 1, 1, 1,
0.2406224, 0.6878474, 0.647902, 1, 1, 1, 1, 1,
0.2460158, -1.184398, 3.378312, 1, 1, 1, 1, 1,
0.246033, -0.8129425, 2.945005, 1, 1, 1, 1, 1,
0.2542128, 0.2891044, 0.2982372, 0, 0, 1, 1, 1,
0.255636, -0.4188401, 2.119084, 1, 0, 0, 1, 1,
0.2565213, 1.853639, -0.6847498, 1, 0, 0, 1, 1,
0.2573397, 0.2660502, 0.2395303, 1, 0, 0, 1, 1,
0.2607879, 0.6366182, 1.198106, 1, 0, 0, 1, 1,
0.2645065, 0.1824722, 0.8625218, 1, 0, 0, 1, 1,
0.265098, 1.380792, 1.146231, 0, 0, 0, 1, 1,
0.271784, 0.1318354, 1.791818, 0, 0, 0, 1, 1,
0.2720536, -1.22808, 2.476244, 0, 0, 0, 1, 1,
0.2733235, -0.1519563, 2.763385, 0, 0, 0, 1, 1,
0.2764566, 0.02436357, 2.576011, 0, 0, 0, 1, 1,
0.2834908, 0.7207804, -0.732121, 0, 0, 0, 1, 1,
0.2866244, -0.7561358, 4.728331, 0, 0, 0, 1, 1,
0.2873, -0.4657417, 2.46943, 1, 1, 1, 1, 1,
0.2873499, -0.203722, 3.986534, 1, 1, 1, 1, 1,
0.2899731, -0.0336214, 1.312277, 1, 1, 1, 1, 1,
0.2914444, -1.602381, 1.513026, 1, 1, 1, 1, 1,
0.2927592, -0.2338815, 3.570163, 1, 1, 1, 1, 1,
0.2943885, -0.2201645, -0.02061054, 1, 1, 1, 1, 1,
0.2944925, -1.057334, 3.883982, 1, 1, 1, 1, 1,
0.2953198, -0.2214614, 0.8020065, 1, 1, 1, 1, 1,
0.2953852, -0.0398143, 1.460818, 1, 1, 1, 1, 1,
0.2996795, 0.001153494, 3.33076, 1, 1, 1, 1, 1,
0.3005226, 1.335484, 0.7053049, 1, 1, 1, 1, 1,
0.3035245, -0.675962, 3.472327, 1, 1, 1, 1, 1,
0.3039834, -2.145348, 2.225214, 1, 1, 1, 1, 1,
0.3061847, -0.722644, 2.955002, 1, 1, 1, 1, 1,
0.306227, 0.3281165, 0.5703413, 1, 1, 1, 1, 1,
0.309312, -1.087714, 3.912971, 0, 0, 1, 1, 1,
0.3100519, 1.310052, -1.46201, 1, 0, 0, 1, 1,
0.3116938, -1.537539, 1.799193, 1, 0, 0, 1, 1,
0.3122578, 1.169351, -0.2108483, 1, 0, 0, 1, 1,
0.3169484, 1.675419, 1.792351, 1, 0, 0, 1, 1,
0.3175632, 1.534526, 0.9830669, 1, 0, 0, 1, 1,
0.3182543, 1.556298, -0.3643281, 0, 0, 0, 1, 1,
0.3231441, -0.5042077, 3.868303, 0, 0, 0, 1, 1,
0.323238, -0.2668407, 1.991545, 0, 0, 0, 1, 1,
0.328996, -0.3556392, 2.824642, 0, 0, 0, 1, 1,
0.3297546, 0.5137733, 1.811258, 0, 0, 0, 1, 1,
0.3299294, 0.981552, -0.7629019, 0, 0, 0, 1, 1,
0.3300029, -0.3851751, 4.229757, 0, 0, 0, 1, 1,
0.3307795, -0.622664, -0.03841783, 1, 1, 1, 1, 1,
0.3317698, 1.184484, -0.02739271, 1, 1, 1, 1, 1,
0.3352147, 0.6217096, -0.0724183, 1, 1, 1, 1, 1,
0.3358852, -1.985095, 2.048871, 1, 1, 1, 1, 1,
0.3387721, 1.615171, 0.146614, 1, 1, 1, 1, 1,
0.3401267, 1.758097, 0.07832098, 1, 1, 1, 1, 1,
0.3416949, 0.6962363, -0.2691422, 1, 1, 1, 1, 1,
0.3435116, -0.7817364, 2.790985, 1, 1, 1, 1, 1,
0.344666, 0.675428, -0.4283116, 1, 1, 1, 1, 1,
0.3446964, -0.8618726, 3.89992, 1, 1, 1, 1, 1,
0.3464583, 1.428694, 0.08092154, 1, 1, 1, 1, 1,
0.3520813, 0.2615165, 3.081877, 1, 1, 1, 1, 1,
0.3576385, -0.7803006, 2.659675, 1, 1, 1, 1, 1,
0.3582487, 1.337078, 0.4307849, 1, 1, 1, 1, 1,
0.3583002, 0.1462759, -0.5134963, 1, 1, 1, 1, 1,
0.3602339, 0.03138478, 1.168015, 0, 0, 1, 1, 1,
0.3603413, -0.6861195, 2.492672, 1, 0, 0, 1, 1,
0.3613185, -0.6906313, 1.464889, 1, 0, 0, 1, 1,
0.362456, -0.4104981, 2.721579, 1, 0, 0, 1, 1,
0.3630218, 0.8258346, 0.4591963, 1, 0, 0, 1, 1,
0.366484, 0.3576146, 2.369887, 1, 0, 0, 1, 1,
0.366956, -1.088749, 4.94558, 0, 0, 0, 1, 1,
0.3671937, 0.6910576, 1.884848, 0, 0, 0, 1, 1,
0.3674269, 0.3446151, 0.9025961, 0, 0, 0, 1, 1,
0.367751, 0.5101624, 1.180183, 0, 0, 0, 1, 1,
0.3713315, 0.8710934, -1.2872, 0, 0, 0, 1, 1,
0.377481, -0.01181528, 0.7580518, 0, 0, 0, 1, 1,
0.3797005, 0.6992073, 1.191306, 0, 0, 0, 1, 1,
0.3851839, 0.7166284, -0.7931123, 1, 1, 1, 1, 1,
0.3888093, -0.2572848, 4.947187, 1, 1, 1, 1, 1,
0.3888595, 0.08373456, -0.2859817, 1, 1, 1, 1, 1,
0.3902087, -0.1441168, 3.058442, 1, 1, 1, 1, 1,
0.3931745, 0.3584424, 0.6446916, 1, 1, 1, 1, 1,
0.3934927, -1.350535, 4.184863, 1, 1, 1, 1, 1,
0.3967355, -1.201209, 3.665665, 1, 1, 1, 1, 1,
0.3988632, -0.3286676, 2.713535, 1, 1, 1, 1, 1,
0.4003398, -0.6974166, 1.523052, 1, 1, 1, 1, 1,
0.4008589, 1.10507, 2.128632, 1, 1, 1, 1, 1,
0.4024284, -0.9717493, 3.500901, 1, 1, 1, 1, 1,
0.403567, 0.3916053, 0.9634293, 1, 1, 1, 1, 1,
0.404265, -0.001303417, 1.347241, 1, 1, 1, 1, 1,
0.406644, 1.997664, 0.1703508, 1, 1, 1, 1, 1,
0.4138858, 2.273762, 0.5115204, 1, 1, 1, 1, 1,
0.4186574, 1.481072, 0.1931081, 0, 0, 1, 1, 1,
0.4212006, 0.7561606, 1.124672, 1, 0, 0, 1, 1,
0.423966, -0.9089305, 2.390817, 1, 0, 0, 1, 1,
0.4265015, 0.5731947, -1.647701, 1, 0, 0, 1, 1,
0.4305325, 1.658261, 1.245341, 1, 0, 0, 1, 1,
0.4328416, 1.097795, 0.6236104, 1, 0, 0, 1, 1,
0.4355904, 0.7018591, 2.612632, 0, 0, 0, 1, 1,
0.4393055, 0.08028433, 2.683036, 0, 0, 0, 1, 1,
0.4394773, 0.09536622, 1.865602, 0, 0, 0, 1, 1,
0.439979, 0.659493, 2.588878, 0, 0, 0, 1, 1,
0.4408266, 0.07787973, 2.014821, 0, 0, 0, 1, 1,
0.4450603, 1.644765, 0.6657931, 0, 0, 0, 1, 1,
0.4478257, 0.1526014, 1.530847, 0, 0, 0, 1, 1,
0.4483854, -0.2226433, 3.012307, 1, 1, 1, 1, 1,
0.449735, 0.5520516, -0.6813721, 1, 1, 1, 1, 1,
0.4628417, 0.1740199, 1.000499, 1, 1, 1, 1, 1,
0.4635119, -0.3738534, 2.526031, 1, 1, 1, 1, 1,
0.4651466, -1.157484, 2.276419, 1, 1, 1, 1, 1,
0.4654531, 0.957984, 0.1791191, 1, 1, 1, 1, 1,
0.465904, 0.5513709, 2.334893, 1, 1, 1, 1, 1,
0.466771, 0.8973667, -0.4323407, 1, 1, 1, 1, 1,
0.4755998, 0.07802673, 1.774622, 1, 1, 1, 1, 1,
0.4795477, -0.9682921, 0.4145237, 1, 1, 1, 1, 1,
0.4822601, -0.8798285, 2.024296, 1, 1, 1, 1, 1,
0.4830262, -0.02067914, 1.517255, 1, 1, 1, 1, 1,
0.4841522, -0.2427862, 3.243688, 1, 1, 1, 1, 1,
0.5005735, -0.8967118, 2.135965, 1, 1, 1, 1, 1,
0.5019253, -0.02332168, 2.764521, 1, 1, 1, 1, 1,
0.503228, -0.8787346, 1.699331, 0, 0, 1, 1, 1,
0.5071085, -0.9093622, 1.576831, 1, 0, 0, 1, 1,
0.5091289, 0.609613, -0.1720912, 1, 0, 0, 1, 1,
0.5109385, 1.398186, -0.2284494, 1, 0, 0, 1, 1,
0.512723, -0.757401, 1.703408, 1, 0, 0, 1, 1,
0.5152503, 1.416496, 0.2682974, 1, 0, 0, 1, 1,
0.5338767, 0.7147223, -0.4851255, 0, 0, 0, 1, 1,
0.5343136, 0.2199228, 2.174332, 0, 0, 0, 1, 1,
0.5345679, -1.026528, 2.909359, 0, 0, 0, 1, 1,
0.5387654, 0.9735761, 1.799028, 0, 0, 0, 1, 1,
0.5396443, 0.6937269, 1.895514, 0, 0, 0, 1, 1,
0.5448494, 0.2783162, 1.584383, 0, 0, 0, 1, 1,
0.5454334, -0.3480374, 0.7723996, 0, 0, 0, 1, 1,
0.5468048, -0.6752644, 3.005879, 1, 1, 1, 1, 1,
0.5481296, -1.605722, 2.882049, 1, 1, 1, 1, 1,
0.5497192, 0.3417073, 1.756274, 1, 1, 1, 1, 1,
0.5519749, 1.102222, 0.7061138, 1, 1, 1, 1, 1,
0.5562586, -0.6068189, 2.328959, 1, 1, 1, 1, 1,
0.5582361, -2.555373, 0.4972107, 1, 1, 1, 1, 1,
0.5712738, 1.435671, 1.069389, 1, 1, 1, 1, 1,
0.5713238, -0.6736799, 2.880028, 1, 1, 1, 1, 1,
0.5713347, 0.9030482, 0.7127656, 1, 1, 1, 1, 1,
0.5716581, -1.147733, 3.011984, 1, 1, 1, 1, 1,
0.5722089, -0.1625435, 1.853124, 1, 1, 1, 1, 1,
0.5762821, 0.009286388, 1.208852, 1, 1, 1, 1, 1,
0.5771291, -0.330255, 2.13707, 1, 1, 1, 1, 1,
0.5777109, -0.1775403, 2.938982, 1, 1, 1, 1, 1,
0.5779839, -0.6233873, 2.331525, 1, 1, 1, 1, 1,
0.5866132, -0.3285377, 2.903235, 0, 0, 1, 1, 1,
0.5895572, 1.772475, 1.1985, 1, 0, 0, 1, 1,
0.5936313, 0.2597181, 2.208287, 1, 0, 0, 1, 1,
0.5938898, 1.811607, -0.2123678, 1, 0, 0, 1, 1,
0.5941867, 0.3418732, 1.485868, 1, 0, 0, 1, 1,
0.5943435, -2.072378, 2.75199, 1, 0, 0, 1, 1,
0.6013288, 0.796683, 1.668879, 0, 0, 0, 1, 1,
0.6019534, 0.4118181, 2.048403, 0, 0, 0, 1, 1,
0.6070076, 0.2237108, 1.758227, 0, 0, 0, 1, 1,
0.6072112, -1.826709, 4.45612, 0, 0, 0, 1, 1,
0.6091556, -0.1156307, 1.636314, 0, 0, 0, 1, 1,
0.6096595, -0.5116768, 2.725815, 0, 0, 0, 1, 1,
0.610471, -0.9784429, -0.07874442, 0, 0, 0, 1, 1,
0.6108409, 0.2777865, 0.08076006, 1, 1, 1, 1, 1,
0.611213, 1.789538, 1.127733, 1, 1, 1, 1, 1,
0.6131651, 1.179822, 1.387457, 1, 1, 1, 1, 1,
0.6153901, -0.004148796, 2.275511, 1, 1, 1, 1, 1,
0.6167131, 0.9672008, 0.7707055, 1, 1, 1, 1, 1,
0.619027, -0.2031251, 0.8548357, 1, 1, 1, 1, 1,
0.6198, -1.138645, 1.148787, 1, 1, 1, 1, 1,
0.6221185, 0.7416518, 1.634754, 1, 1, 1, 1, 1,
0.6254587, -0.4686255, 1.245589, 1, 1, 1, 1, 1,
0.6255081, -0.6482294, 2.377415, 1, 1, 1, 1, 1,
0.6267375, -0.5673403, 0.7076545, 1, 1, 1, 1, 1,
0.6291481, 1.570833, -0.8832524, 1, 1, 1, 1, 1,
0.6349188, 0.1833275, 1.503817, 1, 1, 1, 1, 1,
0.6395331, -0.6420557, 3.660899, 1, 1, 1, 1, 1,
0.6409447, 0.3295619, 0.9869804, 1, 1, 1, 1, 1,
0.6448457, -0.2940277, 3.517452, 0, 0, 1, 1, 1,
0.6463245, 0.5776546, 2.082181, 1, 0, 0, 1, 1,
0.6538993, 0.7061551, 0.4341829, 1, 0, 0, 1, 1,
0.6606355, 1.760479, 0.7564734, 1, 0, 0, 1, 1,
0.6607193, -1.12435, 4.038447, 1, 0, 0, 1, 1,
0.6613848, 0.5090353, -0.7822686, 1, 0, 0, 1, 1,
0.6650187, 0.04691054, 1.288368, 0, 0, 0, 1, 1,
0.668393, -1.889776, 2.021511, 0, 0, 0, 1, 1,
0.6705956, 1.91116, -2.055264, 0, 0, 0, 1, 1,
0.6725328, -0.6854931, 1.178488, 0, 0, 0, 1, 1,
0.673681, -0.6119739, 3.529274, 0, 0, 0, 1, 1,
0.6788666, -0.6902657, 1.274565, 0, 0, 0, 1, 1,
0.6792392, -0.2832902, 3.205437, 0, 0, 0, 1, 1,
0.6817878, 1.717593, -1.16529, 1, 1, 1, 1, 1,
0.6837667, 0.4935116, 0.7966316, 1, 1, 1, 1, 1,
0.6849834, 0.3571554, 1.909205, 1, 1, 1, 1, 1,
0.6927979, -1.21872, 1.770494, 1, 1, 1, 1, 1,
0.6957777, -0.6170408, 2.412009, 1, 1, 1, 1, 1,
0.6967347, 0.6869767, 1.223965, 1, 1, 1, 1, 1,
0.6979269, -0.2052192, 3.077172, 1, 1, 1, 1, 1,
0.7005857, -0.02610793, 1.044503, 1, 1, 1, 1, 1,
0.7045074, -1.529745, 3.603053, 1, 1, 1, 1, 1,
0.7050043, -1.702225, 3.141272, 1, 1, 1, 1, 1,
0.7077916, 0.6071272, 1.483458, 1, 1, 1, 1, 1,
0.7164421, -0.2889754, 1.682652, 1, 1, 1, 1, 1,
0.7237612, -0.7319489, 2.608869, 1, 1, 1, 1, 1,
0.7250399, 0.9139583, 2.994434, 1, 1, 1, 1, 1,
0.7335754, 0.7903861, -0.3169959, 1, 1, 1, 1, 1,
0.7402104, -0.9703024, 2.156011, 0, 0, 1, 1, 1,
0.7435946, 0.1630042, 1.857309, 1, 0, 0, 1, 1,
0.7438607, -1.170053, 3.154821, 1, 0, 0, 1, 1,
0.7506832, -1.417203, 2.933039, 1, 0, 0, 1, 1,
0.7533204, 0.08963691, 1.477071, 1, 0, 0, 1, 1,
0.7658616, -0.7336743, 0.7474194, 1, 0, 0, 1, 1,
0.7685331, -0.8096839, 2.664211, 0, 0, 0, 1, 1,
0.7704403, -0.6531401, 2.274552, 0, 0, 0, 1, 1,
0.7746159, 0.4352109, 1.337, 0, 0, 0, 1, 1,
0.780987, -1.336355, 2.548727, 0, 0, 0, 1, 1,
0.7832554, 1.617735, -0.7387066, 0, 0, 0, 1, 1,
0.7857987, -1.033203, 1.529907, 0, 0, 0, 1, 1,
0.7942784, -0.4252784, 1.387424, 0, 0, 0, 1, 1,
0.795575, -0.6616281, 4.104213, 1, 1, 1, 1, 1,
0.8004061, 0.2166354, 0.5548195, 1, 1, 1, 1, 1,
0.800802, 1.399149, -0.2682049, 1, 1, 1, 1, 1,
0.8047231, 1.032699, 0.6954536, 1, 1, 1, 1, 1,
0.8059061, 0.8868609, 1.629143, 1, 1, 1, 1, 1,
0.8120092, 0.5659637, -0.1713675, 1, 1, 1, 1, 1,
0.8152649, 1.403616, 0.0895043, 1, 1, 1, 1, 1,
0.8182158, 0.6934869, -1.551942, 1, 1, 1, 1, 1,
0.8205985, 1.30812, -0.3828144, 1, 1, 1, 1, 1,
0.827004, -0.4897722, 0.7388054, 1, 1, 1, 1, 1,
0.8309493, 1.409737, 1.367774, 1, 1, 1, 1, 1,
0.8310156, -0.1091763, 0.8461421, 1, 1, 1, 1, 1,
0.8318765, -0.4634324, 2.823238, 1, 1, 1, 1, 1,
0.834193, -0.6190481, 1.340788, 1, 1, 1, 1, 1,
0.8351931, 0.6582982, 1.506828, 1, 1, 1, 1, 1,
0.8379598, -0.7094366, 2.42328, 0, 0, 1, 1, 1,
0.8444705, -0.569617, 3.139135, 1, 0, 0, 1, 1,
0.8478168, 1.324119, -0.707326, 1, 0, 0, 1, 1,
0.8572626, -0.4333872, 2.428731, 1, 0, 0, 1, 1,
0.85839, 1.619197, -0.867907, 1, 0, 0, 1, 1,
0.8600221, 0.2008879, 0.4946894, 1, 0, 0, 1, 1,
0.8704757, -0.2423708, 1.02113, 0, 0, 0, 1, 1,
0.8743689, 0.4491982, 1.43993, 0, 0, 0, 1, 1,
0.8749999, -0.3804597, 2.433986, 0, 0, 0, 1, 1,
0.8872979, 0.8636253, 0.2474753, 0, 0, 0, 1, 1,
0.8910108, -1.6569, 2.524711, 0, 0, 0, 1, 1,
0.8943403, -0.2537295, 1.679923, 0, 0, 0, 1, 1,
0.8957191, -0.298434, 1.39483, 0, 0, 0, 1, 1,
0.9016057, 0.6067979, 1.514294, 1, 1, 1, 1, 1,
0.9050059, -0.2086873, 2.739258, 1, 1, 1, 1, 1,
0.9112584, -0.002676976, 1.387061, 1, 1, 1, 1, 1,
0.9204065, 0.6812499, -0.2060741, 1, 1, 1, 1, 1,
0.9214771, 1.190691, -0.4407816, 1, 1, 1, 1, 1,
0.9236175, -1.563349, 3.86593, 1, 1, 1, 1, 1,
0.9245287, 2.023886, 0.7539893, 1, 1, 1, 1, 1,
0.9259183, 0.9783112, -0.7658042, 1, 1, 1, 1, 1,
0.9268492, 2.260083, -0.5803632, 1, 1, 1, 1, 1,
0.9280801, 1.343095, -1.029213, 1, 1, 1, 1, 1,
0.9340777, 0.1720142, 0.7482824, 1, 1, 1, 1, 1,
0.9363734, -0.7129165, 2.108781, 1, 1, 1, 1, 1,
0.9378482, 3.556057, -0.1036144, 1, 1, 1, 1, 1,
0.9409416, -0.2866161, 1.333216, 1, 1, 1, 1, 1,
0.9435322, -1.520241, 3.793522, 1, 1, 1, 1, 1,
0.9437121, -0.9662269, 2.860713, 0, 0, 1, 1, 1,
0.945137, 0.9048577, 0.05706989, 1, 0, 0, 1, 1,
0.9466792, 0.303946, 1.112733, 1, 0, 0, 1, 1,
0.9477424, 0.1381196, 1.269481, 1, 0, 0, 1, 1,
0.9522786, -0.2662098, 1.820783, 1, 0, 0, 1, 1,
0.9608934, -0.7285552, 2.772445, 1, 0, 0, 1, 1,
0.9622593, -0.2373545, 1.34185, 0, 0, 0, 1, 1,
0.9757228, -0.8715102, 2.703594, 0, 0, 0, 1, 1,
0.9839285, 2.882039, -0.6940792, 0, 0, 0, 1, 1,
0.9855346, 0.5669424, 2.254242, 0, 0, 0, 1, 1,
0.9922996, -0.8191069, 3.469944, 0, 0, 0, 1, 1,
0.99976, -0.8997331, 1.277213, 0, 0, 0, 1, 1,
1.005653, -1.21602, 1.492002, 0, 0, 0, 1, 1,
1.0147, -0.2467552, 2.798143, 1, 1, 1, 1, 1,
1.015268, -0.05845462, 3.761424, 1, 1, 1, 1, 1,
1.017994, -0.2418296, 5.251661, 1, 1, 1, 1, 1,
1.029265, -0.3935494, 1.378585, 1, 1, 1, 1, 1,
1.030564, 0.4513192, 2.483227, 1, 1, 1, 1, 1,
1.03355, 1.043597, 0.8833411, 1, 1, 1, 1, 1,
1.035243, -1.163366, 4.579866, 1, 1, 1, 1, 1,
1.040432, -1.087536, 2.830207, 1, 1, 1, 1, 1,
1.04418, -0.01968217, 2.004744, 1, 1, 1, 1, 1,
1.046465, 1.367692, 2.03672, 1, 1, 1, 1, 1,
1.047115, -0.116364, 1.24906, 1, 1, 1, 1, 1,
1.048344, 0.6909168, 1.190949, 1, 1, 1, 1, 1,
1.051474, -0.06273061, 2.88568, 1, 1, 1, 1, 1,
1.054522, -1.80285, -0.2978269, 1, 1, 1, 1, 1,
1.058663, -0.182131, 1.030304, 1, 1, 1, 1, 1,
1.069805, -0.2656425, 0.2688738, 0, 0, 1, 1, 1,
1.073617, -0.8086171, 1.868303, 1, 0, 0, 1, 1,
1.075085, 0.7879612, 1.67786, 1, 0, 0, 1, 1,
1.075847, 0.5478634, 0.4651209, 1, 0, 0, 1, 1,
1.077857, -0.02348412, 4.121701, 1, 0, 0, 1, 1,
1.080949, -1.599041, 2.649288, 1, 0, 0, 1, 1,
1.088103, -1.064032, 2.425345, 0, 0, 0, 1, 1,
1.088324, -0.3430085, 0.9496483, 0, 0, 0, 1, 1,
1.090582, 1.213101, 1.083547, 0, 0, 0, 1, 1,
1.092911, -0.318142, 1.18769, 0, 0, 0, 1, 1,
1.098812, -1.299245, 5.030589, 0, 0, 0, 1, 1,
1.10949, 1.148722, 1.051446, 0, 0, 0, 1, 1,
1.10952, 0.2987237, 2.235368, 0, 0, 0, 1, 1,
1.109646, 0.3647918, 3.152067, 1, 1, 1, 1, 1,
1.110675, -0.9875918, 1.0277, 1, 1, 1, 1, 1,
1.112857, -0.2969607, 2.810719, 1, 1, 1, 1, 1,
1.113178, 0.3507278, -0.4466743, 1, 1, 1, 1, 1,
1.113802, 0.3636139, 0.8199808, 1, 1, 1, 1, 1,
1.127524, 0.4258991, 1.554173, 1, 1, 1, 1, 1,
1.142899, -1.36303, 3.083196, 1, 1, 1, 1, 1,
1.143904, 1.727214, 0.5930473, 1, 1, 1, 1, 1,
1.157118, 0.3617321, 0.3975258, 1, 1, 1, 1, 1,
1.163034, 0.02985956, 2.764598, 1, 1, 1, 1, 1,
1.16304, 0.8089681, 0.3712713, 1, 1, 1, 1, 1,
1.176574, -0.6634934, 2.874071, 1, 1, 1, 1, 1,
1.179372, -0.1310716, 0.9182015, 1, 1, 1, 1, 1,
1.197808, -2.227555, 2.072434, 1, 1, 1, 1, 1,
1.209512, 0.3801897, -0.02687535, 1, 1, 1, 1, 1,
1.21415, -0.3435568, 1.94571, 0, 0, 1, 1, 1,
1.235822, -0.9914304, 0.6328107, 1, 0, 0, 1, 1,
1.24178, -0.4482055, 3.343258, 1, 0, 0, 1, 1,
1.248976, -0.6779992, 1.939881, 1, 0, 0, 1, 1,
1.250525, 0.5634794, 2.021613, 1, 0, 0, 1, 1,
1.251996, -0.7204109, 1.876063, 1, 0, 0, 1, 1,
1.254104, 0.635253, -0.5784547, 0, 0, 0, 1, 1,
1.255604, 0.136015, 2.013506, 0, 0, 0, 1, 1,
1.256078, -1.031146, 2.677507, 0, 0, 0, 1, 1,
1.273894, 1.774921, 1.131896, 0, 0, 0, 1, 1,
1.282963, -0.9094912, 1.733585, 0, 0, 0, 1, 1,
1.288263, 0.02874878, 2.087358, 0, 0, 0, 1, 1,
1.289833, 0.1441474, 0.3347714, 0, 0, 0, 1, 1,
1.294409, -0.8536898, 3.10604, 1, 1, 1, 1, 1,
1.31253, 1.109786, 2.416393, 1, 1, 1, 1, 1,
1.31647, -1.814216, 1.637012, 1, 1, 1, 1, 1,
1.316902, -1.409975, 0.8248259, 1, 1, 1, 1, 1,
1.318137, -0.5783207, 1.648192, 1, 1, 1, 1, 1,
1.31957, -0.1376946, -0.935362, 1, 1, 1, 1, 1,
1.325931, 0.9416558, 0.9892013, 1, 1, 1, 1, 1,
1.326491, 0.08245368, 1.372886, 1, 1, 1, 1, 1,
1.327401, -1.234016, 2.819394, 1, 1, 1, 1, 1,
1.329307, 1.211565, -1.194735, 1, 1, 1, 1, 1,
1.331072, 1.22302, -0.246645, 1, 1, 1, 1, 1,
1.338259, 0.5383985, 1.847166, 1, 1, 1, 1, 1,
1.338757, -0.5269074, 2.16919, 1, 1, 1, 1, 1,
1.344497, -0.2522217, -0.2842962, 1, 1, 1, 1, 1,
1.348, -0.6511864, 2.728158, 1, 1, 1, 1, 1,
1.356052, -1.28783, 2.983292, 0, 0, 1, 1, 1,
1.362519, -2.335811, 2.860331, 1, 0, 0, 1, 1,
1.368667, 0.08897479, 0.4537869, 1, 0, 0, 1, 1,
1.370381, 0.2528811, 1.611081, 1, 0, 0, 1, 1,
1.372528, 0.8282436, 3.904834, 1, 0, 0, 1, 1,
1.375328, -0.823559, 0.9418114, 1, 0, 0, 1, 1,
1.384544, -0.2611915, 0.7762879, 0, 0, 0, 1, 1,
1.388135, -0.5553423, 0.6582723, 0, 0, 0, 1, 1,
1.391902, 0.03727466, 2.502666, 0, 0, 0, 1, 1,
1.403746, -0.2183928, 2.487628, 0, 0, 0, 1, 1,
1.407426, 0.7482373, 0.383607, 0, 0, 0, 1, 1,
1.410902, 1.596683, -0.8431746, 0, 0, 0, 1, 1,
1.439163, -1.028878, 1.326025, 0, 0, 0, 1, 1,
1.448666, 0.3165506, 3.294748, 1, 1, 1, 1, 1,
1.448921, 0.890408, 1.008042, 1, 1, 1, 1, 1,
1.456641, -0.09855343, 1.112831, 1, 1, 1, 1, 1,
1.462714, 0.03275801, 1.070292, 1, 1, 1, 1, 1,
1.480925, -0.6466894, 1.155695, 1, 1, 1, 1, 1,
1.481667, -0.7423291, 2.621437, 1, 1, 1, 1, 1,
1.485192, -0.5732313, 2.116576, 1, 1, 1, 1, 1,
1.486928, -0.7611837, 2.860308, 1, 1, 1, 1, 1,
1.494347, -0.0852182, 1.878864, 1, 1, 1, 1, 1,
1.514864, 0.9651327, 1.051919, 1, 1, 1, 1, 1,
1.519804, -0.8990033, 1.783385, 1, 1, 1, 1, 1,
1.52847, -0.2849956, 2.430992, 1, 1, 1, 1, 1,
1.539121, 0.1628466, 0.7931541, 1, 1, 1, 1, 1,
1.539311, -0.7875372, 1.17253, 1, 1, 1, 1, 1,
1.549015, 2.438944, -1.637177, 1, 1, 1, 1, 1,
1.574878, -0.4552348, 1.790563, 0, 0, 1, 1, 1,
1.584935, 0.8074376, 0.2005141, 1, 0, 0, 1, 1,
1.589339, -0.1441141, 1.841222, 1, 0, 0, 1, 1,
1.595002, -0.1520813, 0.1922557, 1, 0, 0, 1, 1,
1.597552, -0.008860896, 1.524959, 1, 0, 0, 1, 1,
1.611144, 0.8343962, 0.4314006, 1, 0, 0, 1, 1,
1.615495, 1.390461, 0.6084202, 0, 0, 0, 1, 1,
1.632998, -0.9556843, 2.087393, 0, 0, 0, 1, 1,
1.640922, 0.4035188, 1.005609, 0, 0, 0, 1, 1,
1.662237, -0.06242136, -0.2511628, 0, 0, 0, 1, 1,
1.663389, -0.4162874, 0.6874792, 0, 0, 0, 1, 1,
1.669647, 0.6751574, 0.7840742, 0, 0, 0, 1, 1,
1.685881, -1.186664, 3.064757, 0, 0, 0, 1, 1,
1.688575, 1.131628, 0.9401705, 1, 1, 1, 1, 1,
1.689387, 0.3402728, -0.4325146, 1, 1, 1, 1, 1,
1.703131, 0.5393161, -0.390621, 1, 1, 1, 1, 1,
1.708694, 0.4540385, 0.4038461, 1, 1, 1, 1, 1,
1.7142, -1.56319, 2.946089, 1, 1, 1, 1, 1,
1.737271, -1.089034, 2.23459, 1, 1, 1, 1, 1,
1.756441, -1.331309, 3.29566, 1, 1, 1, 1, 1,
1.823708, -0.5968376, -0.2263527, 1, 1, 1, 1, 1,
1.825578, -0.2886166, 1.790294, 1, 1, 1, 1, 1,
1.853615, 0.09463491, 1.629829, 1, 1, 1, 1, 1,
1.883591, 0.9219716, 1.476727, 1, 1, 1, 1, 1,
1.908931, -1.084561, 2.593462, 1, 1, 1, 1, 1,
1.920258, -0.3754095, 1.176925, 1, 1, 1, 1, 1,
1.920515, 0.2350422, 0.8426259, 1, 1, 1, 1, 1,
1.923707, -0.2693712, 0.2691608, 1, 1, 1, 1, 1,
1.932698, 1.671801, 0.5092708, 0, 0, 1, 1, 1,
1.959611, -0.9787409, 1.18765, 1, 0, 0, 1, 1,
1.979679, -3.32778, 2.414335, 1, 0, 0, 1, 1,
2.02936, 1.873018, 2.178, 1, 0, 0, 1, 1,
2.063414, 3.126154, 0.707108, 1, 0, 0, 1, 1,
2.069242, -1.967776, 3.249843, 1, 0, 0, 1, 1,
2.181042, 1.829416, -2.369492, 0, 0, 0, 1, 1,
2.216202, -1.802529, 1.972046, 0, 0, 0, 1, 1,
2.240264, -0.0774272, 1.897697, 0, 0, 0, 1, 1,
2.24434, 0.6650339, -0.06638537, 0, 0, 0, 1, 1,
2.273905, 0.1221043, 0.1989149, 0, 0, 0, 1, 1,
2.382516, 1.09422, 1.571746, 0, 0, 0, 1, 1,
2.438817, -0.3074285, 1.47707, 0, 0, 0, 1, 1,
2.497229, 0.6444016, 0.381925, 1, 1, 1, 1, 1,
2.551563, 0.3869961, 0.6155025, 1, 1, 1, 1, 1,
2.55274, 1.044739, 0.1544541, 1, 1, 1, 1, 1,
2.556678, -0.6347017, 1.943556, 1, 1, 1, 1, 1,
2.898131, -0.6468522, 1.554414, 1, 1, 1, 1, 1,
3.003212, 1.118358, -0.06782034, 1, 1, 1, 1, 1,
3.096774, 0.1976227, 0.9726624, 1, 1, 1, 1, 1
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
var radius = 9.603569;
var distance = 33.73213;
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
mvMatrix.translate( 0.1108296, 0.103591, -0.1848922 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.73213);
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
