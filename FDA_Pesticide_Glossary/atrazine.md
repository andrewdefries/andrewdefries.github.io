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
-3.477374, -0.1947789, -1.359164, 1, 0, 0, 1,
-2.777313, 0.4757414, -2.992376, 1, 0.007843138, 0, 1,
-2.746114, -0.2779559, -1.027009, 1, 0.01176471, 0, 1,
-2.632729, -0.7430437, -1.576452, 1, 0.01960784, 0, 1,
-2.600945, -1.175553, -2.99162, 1, 0.02352941, 0, 1,
-2.377784, -0.5082231, -1.026117, 1, 0.03137255, 0, 1,
-2.364579, -0.5404291, -2.152764, 1, 0.03529412, 0, 1,
-2.355159, -0.08709232, -1.252123, 1, 0.04313726, 0, 1,
-2.326452, 1.432437, -0.1294874, 1, 0.04705882, 0, 1,
-2.278649, 0.1745345, -3.469172, 1, 0.05490196, 0, 1,
-2.251726, 0.3265082, -1.301176, 1, 0.05882353, 0, 1,
-2.219298, 0.0054952, 0.8230848, 1, 0.06666667, 0, 1,
-2.206738, 0.9555411, -0.7147595, 1, 0.07058824, 0, 1,
-2.20156, -0.7626761, -1.781766, 1, 0.07843138, 0, 1,
-2.163933, 1.319894, -0.1941452, 1, 0.08235294, 0, 1,
-2.103831, 0.7142057, -2.14936, 1, 0.09019608, 0, 1,
-2.087713, -1.428007, -1.0821, 1, 0.09411765, 0, 1,
-2.067854, -0.5254099, -1.20494, 1, 0.1019608, 0, 1,
-2.051251, -0.8958241, -2.448166, 1, 0.1098039, 0, 1,
-2.038244, 1.284211, -0.9556318, 1, 0.1137255, 0, 1,
-2.0052, -2.547971, -2.614649, 1, 0.1215686, 0, 1,
-1.996338, -0.9712771, -1.998158, 1, 0.1254902, 0, 1,
-1.994523, -0.1475329, -2.674786, 1, 0.1333333, 0, 1,
-1.968414, -0.4051177, 1.162109, 1, 0.1372549, 0, 1,
-1.952574, 1.341972, -1.150493, 1, 0.145098, 0, 1,
-1.951973, -0.4744191, -0.3852468, 1, 0.1490196, 0, 1,
-1.946726, 0.9276746, -0.05033936, 1, 0.1568628, 0, 1,
-1.883365, -2.033166, -2.604244, 1, 0.1607843, 0, 1,
-1.879133, -0.4325226, -3.273413, 1, 0.1686275, 0, 1,
-1.852298, 1.112482, -0.476799, 1, 0.172549, 0, 1,
-1.840396, -0.02111237, -2.677012, 1, 0.1803922, 0, 1,
-1.830268, -0.5526117, -2.668428, 1, 0.1843137, 0, 1,
-1.828163, 0.1311838, 0.9673642, 1, 0.1921569, 0, 1,
-1.826461, -0.6794742, -1.369707, 1, 0.1960784, 0, 1,
-1.813211, 0.9938284, -1.038034, 1, 0.2039216, 0, 1,
-1.791853, -1.299477, -2.509972, 1, 0.2117647, 0, 1,
-1.790947, -0.6820043, -0.03786556, 1, 0.2156863, 0, 1,
-1.783799, -0.6684267, -0.6449587, 1, 0.2235294, 0, 1,
-1.747777, 0.4237891, -1.03208, 1, 0.227451, 0, 1,
-1.747323, 0.2033059, -2.774016, 1, 0.2352941, 0, 1,
-1.72078, 1.123646, -1.651935, 1, 0.2392157, 0, 1,
-1.700437, 0.5383259, -1.255156, 1, 0.2470588, 0, 1,
-1.699275, 1.131826, 1.132229, 1, 0.2509804, 0, 1,
-1.672632, -1.326003, -0.9953303, 1, 0.2588235, 0, 1,
-1.659771, -2.402562, -4.02492, 1, 0.2627451, 0, 1,
-1.653922, 0.7205792, -1.975419, 1, 0.2705882, 0, 1,
-1.651306, 0.8367003, -1.485176, 1, 0.2745098, 0, 1,
-1.646457, -1.174036, -0.7594409, 1, 0.282353, 0, 1,
-1.629318, -2.563188, -1.507535, 1, 0.2862745, 0, 1,
-1.626281, -0.02264019, -1.601155, 1, 0.2941177, 0, 1,
-1.625341, -0.3890578, -0.8827205, 1, 0.3019608, 0, 1,
-1.617702, -0.2243912, 0.1421139, 1, 0.3058824, 0, 1,
-1.592521, -0.6700966, -2.316026, 1, 0.3137255, 0, 1,
-1.576949, -0.6318862, -1.589156, 1, 0.3176471, 0, 1,
-1.567545, -0.4498952, 0.4665809, 1, 0.3254902, 0, 1,
-1.562267, 1.009487, -1.059587, 1, 0.3294118, 0, 1,
-1.55741, 0.7867714, -0.4189971, 1, 0.3372549, 0, 1,
-1.554101, 0.2415818, 0.8464002, 1, 0.3411765, 0, 1,
-1.547261, 0.3277256, -2.576426, 1, 0.3490196, 0, 1,
-1.543237, 0.1514978, -0.3834376, 1, 0.3529412, 0, 1,
-1.540036, -1.203866, -2.898322, 1, 0.3607843, 0, 1,
-1.528877, -0.7727452, -0.9733464, 1, 0.3647059, 0, 1,
-1.527499, -0.184724, -0.6129055, 1, 0.372549, 0, 1,
-1.526167, 2.005342, -1.110904, 1, 0.3764706, 0, 1,
-1.51207, -0.8419625, -0.8095041, 1, 0.3843137, 0, 1,
-1.504825, 1.226165, 0.1864355, 1, 0.3882353, 0, 1,
-1.492018, 0.04516012, -2.782145, 1, 0.3960784, 0, 1,
-1.48219, 0.1025417, -1.008784, 1, 0.4039216, 0, 1,
-1.47665, 0.5432019, -1.83756, 1, 0.4078431, 0, 1,
-1.463061, -0.0235215, -2.228138, 1, 0.4156863, 0, 1,
-1.46166, 1.272887, 1.290236, 1, 0.4196078, 0, 1,
-1.456176, 1.713779, -1.179526, 1, 0.427451, 0, 1,
-1.455969, 0.4458244, -0.1062933, 1, 0.4313726, 0, 1,
-1.453311, 1.167138, 0.5773972, 1, 0.4392157, 0, 1,
-1.43799, -1.401808, -1.308305, 1, 0.4431373, 0, 1,
-1.424213, -0.6697057, -1.569005, 1, 0.4509804, 0, 1,
-1.419295, -1.8202, -2.231144, 1, 0.454902, 0, 1,
-1.414356, 1.267245, -0.01764168, 1, 0.4627451, 0, 1,
-1.404985, -0.008721017, -0.3637861, 1, 0.4666667, 0, 1,
-1.399525, -0.5788626, -1.236892, 1, 0.4745098, 0, 1,
-1.388159, -0.2400347, -1.497259, 1, 0.4784314, 0, 1,
-1.359444, 0.8877916, -0.8325608, 1, 0.4862745, 0, 1,
-1.352064, -0.9537805, -1.720555, 1, 0.4901961, 0, 1,
-1.338891, -0.434596, -1.919399, 1, 0.4980392, 0, 1,
-1.326511, -0.2641675, -1.007468, 1, 0.5058824, 0, 1,
-1.324007, 0.9752851, -0.6107019, 1, 0.509804, 0, 1,
-1.323272, 1.024884, -0.6969832, 1, 0.5176471, 0, 1,
-1.309505, 0.2075999, -2.206414, 1, 0.5215687, 0, 1,
-1.306317, -2.825735, -3.072949, 1, 0.5294118, 0, 1,
-1.305565, 1.109871, -0.9031616, 1, 0.5333334, 0, 1,
-1.30509, -0.2271969, -1.37434, 1, 0.5411765, 0, 1,
-1.304898, 0.2250375, -3.321177, 1, 0.5450981, 0, 1,
-1.295707, 0.8167339, -1.060881, 1, 0.5529412, 0, 1,
-1.291297, 0.1517885, -2.314981, 1, 0.5568628, 0, 1,
-1.274053, 0.2324029, -1.889315, 1, 0.5647059, 0, 1,
-1.268079, -0.4331791, -1.171263, 1, 0.5686275, 0, 1,
-1.265161, -0.7132261, -2.055888, 1, 0.5764706, 0, 1,
-1.256345, -0.2951341, -1.989147, 1, 0.5803922, 0, 1,
-1.255248, 0.0978454, -0.7903977, 1, 0.5882353, 0, 1,
-1.25062, 0.2886407, -1.239648, 1, 0.5921569, 0, 1,
-1.244109, 0.03998954, -2.826227, 1, 0.6, 0, 1,
-1.240361, 0.2001098, -0.9430566, 1, 0.6078432, 0, 1,
-1.229954, -0.4145031, -2.69298, 1, 0.6117647, 0, 1,
-1.223966, -2.272627, -1.878697, 1, 0.6196079, 0, 1,
-1.2217, 0.004334419, -1.013048, 1, 0.6235294, 0, 1,
-1.21853, -0.001345541, -1.321087, 1, 0.6313726, 0, 1,
-1.214427, 0.1651773, -2.266402, 1, 0.6352941, 0, 1,
-1.206081, -0.9671796, -1.652458, 1, 0.6431373, 0, 1,
-1.204316, 1.877427, -0.890925, 1, 0.6470588, 0, 1,
-1.192258, 0.01279312, -1.074343, 1, 0.654902, 0, 1,
-1.183393, -0.002504496, -1.182727, 1, 0.6588235, 0, 1,
-1.181802, -0.3214958, -3.055959, 1, 0.6666667, 0, 1,
-1.180893, 1.184533, -0.7158988, 1, 0.6705883, 0, 1,
-1.175991, 0.2038635, -0.3756844, 1, 0.6784314, 0, 1,
-1.172416, 0.457798, -0.7115396, 1, 0.682353, 0, 1,
-1.170747, 0.1413672, -0.7948316, 1, 0.6901961, 0, 1,
-1.168468, -0.1683455, 0.563892, 1, 0.6941177, 0, 1,
-1.165086, -1.19619, -2.07923, 1, 0.7019608, 0, 1,
-1.154514, -0.08136347, -0.3983079, 1, 0.7098039, 0, 1,
-1.141787, -0.4525151, -1.93667, 1, 0.7137255, 0, 1,
-1.139551, 0.5115444, 0.2230837, 1, 0.7215686, 0, 1,
-1.13624, 0.4610535, -0.6992962, 1, 0.7254902, 0, 1,
-1.131842, 0.2273698, -2.03655, 1, 0.7333333, 0, 1,
-1.126942, -1.485587, -2.105085, 1, 0.7372549, 0, 1,
-1.124746, 1.528532, 0.7036406, 1, 0.7450981, 0, 1,
-1.117763, 1.960972, -1.572235, 1, 0.7490196, 0, 1,
-1.116743, 0.6377659, -1.190537, 1, 0.7568628, 0, 1,
-1.11639, 1.47285, -0.6471009, 1, 0.7607843, 0, 1,
-1.108446, 0.4768957, -0.5978426, 1, 0.7686275, 0, 1,
-1.108161, -0.3009208, -3.020949, 1, 0.772549, 0, 1,
-1.104235, 1.721299, -1.61816, 1, 0.7803922, 0, 1,
-1.098766, -0.1271711, -3.10877, 1, 0.7843137, 0, 1,
-1.097619, 0.3510673, -2.28284, 1, 0.7921569, 0, 1,
-1.091253, -1.631985, -2.939233, 1, 0.7960784, 0, 1,
-1.088982, 0.8578864, -0.388776, 1, 0.8039216, 0, 1,
-1.087813, -0.774403, -2.8253, 1, 0.8117647, 0, 1,
-1.071864, -0.4726122, -1.117694, 1, 0.8156863, 0, 1,
-1.071506, 1.463423, -0.7659461, 1, 0.8235294, 0, 1,
-1.067529, -0.7409524, -4.4899, 1, 0.827451, 0, 1,
-1.056811, 0.2802636, 0.2535333, 1, 0.8352941, 0, 1,
-1.054428, -0.4542436, -3.45663, 1, 0.8392157, 0, 1,
-1.041059, 0.7242038, 0.6642447, 1, 0.8470588, 0, 1,
-1.037314, -1.353392, -3.06919, 1, 0.8509804, 0, 1,
-1.03586, -0.8227826, -1.11765, 1, 0.8588235, 0, 1,
-1.033174, -0.2975062, -1.830644, 1, 0.8627451, 0, 1,
-1.022361, 0.4355689, 0.520318, 1, 0.8705882, 0, 1,
-1.022323, -1.13961, -2.858414, 1, 0.8745098, 0, 1,
-1.022238, 0.8596585, -0.6589072, 1, 0.8823529, 0, 1,
-1.020879, 1.102341, 1.440891, 1, 0.8862745, 0, 1,
-1.018265, 1.138252, -0.8969082, 1, 0.8941177, 0, 1,
-1.00238, -0.5992256, -2.811624, 1, 0.8980392, 0, 1,
-1.000765, 0.4401844, -1.080722, 1, 0.9058824, 0, 1,
-1.000406, 0.0008809855, -2.164905, 1, 0.9137255, 0, 1,
-1.000326, 0.7267144, -1.9063, 1, 0.9176471, 0, 1,
-0.9973223, -1.308285, -2.40512, 1, 0.9254902, 0, 1,
-0.9853133, 0.06014057, -2.412117, 1, 0.9294118, 0, 1,
-0.9839404, -0.3733565, -0.4025621, 1, 0.9372549, 0, 1,
-0.9820787, -0.8511547, -1.772037, 1, 0.9411765, 0, 1,
-0.9798983, 0.1610884, -1.850694, 1, 0.9490196, 0, 1,
-0.9736856, 0.05036219, 0.03413681, 1, 0.9529412, 0, 1,
-0.9725052, -1.270547, -0.2195159, 1, 0.9607843, 0, 1,
-0.9722368, -1.478907, -0.8305278, 1, 0.9647059, 0, 1,
-0.9715351, 2.779397, -0.09312932, 1, 0.972549, 0, 1,
-0.9698104, 1.408554, -0.9407506, 1, 0.9764706, 0, 1,
-0.9693355, -0.4682675, -1.716109, 1, 0.9843137, 0, 1,
-0.9690903, -0.04669519, -2.29435, 1, 0.9882353, 0, 1,
-0.9620318, 1.160508, -1.451462, 1, 0.9960784, 0, 1,
-0.9618441, 0.5437105, -1.156007, 0.9960784, 1, 0, 1,
-0.9613562, 1.445434, -1.756154, 0.9921569, 1, 0, 1,
-0.9526458, 0.3606322, -0.52452, 0.9843137, 1, 0, 1,
-0.9468833, -0.8717324, -2.63432, 0.9803922, 1, 0, 1,
-0.9430282, -1.785883, -3.921383, 0.972549, 1, 0, 1,
-0.9426225, 0.3269992, -0.2194239, 0.9686275, 1, 0, 1,
-0.9426165, 0.1772378, -1.404246, 0.9607843, 1, 0, 1,
-0.9327303, 0.1311356, -0.6012286, 0.9568627, 1, 0, 1,
-0.9327078, 0.9557711, -0.8113297, 0.9490196, 1, 0, 1,
-0.9322587, 0.6945029, -1.222555, 0.945098, 1, 0, 1,
-0.92492, 0.7308696, -1.962213, 0.9372549, 1, 0, 1,
-0.922505, -0.6300256, -3.821651, 0.9333333, 1, 0, 1,
-0.9221811, -1.878557, -2.38389, 0.9254902, 1, 0, 1,
-0.918073, -1.1105, -1.34727, 0.9215686, 1, 0, 1,
-0.9130782, 0.01103644, -2.956346, 0.9137255, 1, 0, 1,
-0.9054159, -0.4005643, -0.5973062, 0.9098039, 1, 0, 1,
-0.8987319, -0.6537804, -2.101691, 0.9019608, 1, 0, 1,
-0.8944144, -0.2195361, -2.388291, 0.8941177, 1, 0, 1,
-0.8916553, -0.4841624, -2.269473, 0.8901961, 1, 0, 1,
-0.8876461, -0.3514425, -2.223918, 0.8823529, 1, 0, 1,
-0.8825904, 0.7105594, -0.1909673, 0.8784314, 1, 0, 1,
-0.8762393, -0.225742, -1.058663, 0.8705882, 1, 0, 1,
-0.868508, 0.06258146, -1.980833, 0.8666667, 1, 0, 1,
-0.8463128, 1.761532, 0.03703809, 0.8588235, 1, 0, 1,
-0.8460005, 0.3975906, -0.3896527, 0.854902, 1, 0, 1,
-0.8427424, 0.434426, -1.757514, 0.8470588, 1, 0, 1,
-0.8426843, 0.4539041, -1.755632, 0.8431373, 1, 0, 1,
-0.84203, -1.132565, -0.5037005, 0.8352941, 1, 0, 1,
-0.835579, 0.1672668, -0.3215675, 0.8313726, 1, 0, 1,
-0.8341847, -1.80493, -2.119513, 0.8235294, 1, 0, 1,
-0.8337462, 1.462814, -1.237246, 0.8196079, 1, 0, 1,
-0.8334236, -0.4899516, -2.518537, 0.8117647, 1, 0, 1,
-0.8291073, 0.7156371, -1.338727, 0.8078431, 1, 0, 1,
-0.826907, -0.05324313, 0.1859195, 0.8, 1, 0, 1,
-0.8253871, -0.169098, -3.757798, 0.7921569, 1, 0, 1,
-0.8252512, -1.29841, -1.215563, 0.7882353, 1, 0, 1,
-0.8252023, -0.209153, -1.973134, 0.7803922, 1, 0, 1,
-0.8233189, -0.7282965, -0.9395009, 0.7764706, 1, 0, 1,
-0.8201965, -1.106812, -2.34873, 0.7686275, 1, 0, 1,
-0.8094931, -0.5484377, -0.7689627, 0.7647059, 1, 0, 1,
-0.8091605, 1.144128, -2.704608, 0.7568628, 1, 0, 1,
-0.8087003, -0.3557758, -1.807587, 0.7529412, 1, 0, 1,
-0.8082851, 0.3884496, -1.23129, 0.7450981, 1, 0, 1,
-0.8074918, -0.2121177, -1.726559, 0.7411765, 1, 0, 1,
-0.8069661, 0.02481218, -1.044527, 0.7333333, 1, 0, 1,
-0.8038376, -0.364083, -2.415857, 0.7294118, 1, 0, 1,
-0.7965803, -0.353348, -1.18838, 0.7215686, 1, 0, 1,
-0.7934612, -0.1524591, -0.4815128, 0.7176471, 1, 0, 1,
-0.7891465, 1.197577, 0.6749656, 0.7098039, 1, 0, 1,
-0.7790901, -0.2853567, -1.59847, 0.7058824, 1, 0, 1,
-0.7778186, 1.475472, 0.871314, 0.6980392, 1, 0, 1,
-0.7767376, 0.5741147, -0.5055565, 0.6901961, 1, 0, 1,
-0.7746495, -1.329435, -1.930011, 0.6862745, 1, 0, 1,
-0.7689334, 0.6615821, 1.444698, 0.6784314, 1, 0, 1,
-0.7678173, -0.4419307, -1.799887, 0.6745098, 1, 0, 1,
-0.7678113, -2.26072, -4.79512, 0.6666667, 1, 0, 1,
-0.7614081, -0.8935498, -1.642312, 0.6627451, 1, 0, 1,
-0.7589551, -0.8819816, -3.087387, 0.654902, 1, 0, 1,
-0.7587356, 0.3653276, -1.519825, 0.6509804, 1, 0, 1,
-0.7574999, -1.528736, -1.713791, 0.6431373, 1, 0, 1,
-0.755353, -1.091098, -1.401757, 0.6392157, 1, 0, 1,
-0.7513967, -0.8664569, -3.819008, 0.6313726, 1, 0, 1,
-0.7509094, -0.3326746, -0.5882466, 0.627451, 1, 0, 1,
-0.7507468, -1.145017, -3.396894, 0.6196079, 1, 0, 1,
-0.7492397, -0.2427484, -1.217711, 0.6156863, 1, 0, 1,
-0.7478335, 1.634204, 0.5729855, 0.6078432, 1, 0, 1,
-0.7428668, -0.7914247, -2.6248, 0.6039216, 1, 0, 1,
-0.7396472, -0.4435224, -2.441025, 0.5960785, 1, 0, 1,
-0.7296911, -1.320278, -2.817372, 0.5882353, 1, 0, 1,
-0.7189852, 0.403953, -0.9136583, 0.5843138, 1, 0, 1,
-0.7147917, -0.8593838, -2.331433, 0.5764706, 1, 0, 1,
-0.7110665, 1.683999, -0.7256574, 0.572549, 1, 0, 1,
-0.7051291, 0.1100269, -2.333074, 0.5647059, 1, 0, 1,
-0.7049984, 0.4854484, -1.86726, 0.5607843, 1, 0, 1,
-0.7032647, 0.8328398, -1.093425, 0.5529412, 1, 0, 1,
-0.6997863, -0.6641526, -2.515253, 0.5490196, 1, 0, 1,
-0.6978068, -0.07427408, -0.947188, 0.5411765, 1, 0, 1,
-0.6957567, 1.080324, -1.545578, 0.5372549, 1, 0, 1,
-0.6937894, 0.4520564, 0.07397483, 0.5294118, 1, 0, 1,
-0.6895118, -1.801373, -4.446215, 0.5254902, 1, 0, 1,
-0.6862643, 0.674885, -0.6741415, 0.5176471, 1, 0, 1,
-0.6849357, 0.08054637, -0.09421856, 0.5137255, 1, 0, 1,
-0.6834323, -0.5274966, -3.441322, 0.5058824, 1, 0, 1,
-0.6824073, -0.2318399, -0.9671022, 0.5019608, 1, 0, 1,
-0.6808431, 0.6484367, -0.5189459, 0.4941176, 1, 0, 1,
-0.6774774, 0.9929051, -0.2785596, 0.4862745, 1, 0, 1,
-0.6695697, -0.3733093, -3.35225, 0.4823529, 1, 0, 1,
-0.6693519, 0.481906, -0.6199461, 0.4745098, 1, 0, 1,
-0.6681352, 2.024369, -0.191213, 0.4705882, 1, 0, 1,
-0.6676207, -1.052443, -2.675736, 0.4627451, 1, 0, 1,
-0.6667442, -0.3721017, -3.175966, 0.4588235, 1, 0, 1,
-0.6597624, 0.1165341, -1.710578, 0.4509804, 1, 0, 1,
-0.6580763, -0.2961651, -1.482325, 0.4470588, 1, 0, 1,
-0.6576822, -0.3481351, -3.780344, 0.4392157, 1, 0, 1,
-0.6566888, -1.099581, -3.765961, 0.4352941, 1, 0, 1,
-0.6538308, -1.425145, -3.470347, 0.427451, 1, 0, 1,
-0.6511703, -1.3927, -1.792519, 0.4235294, 1, 0, 1,
-0.6498123, -1.106368, -3.911774, 0.4156863, 1, 0, 1,
-0.639468, -0.622992, -2.492069, 0.4117647, 1, 0, 1,
-0.6387249, -0.139358, -2.323078, 0.4039216, 1, 0, 1,
-0.635611, -1.380577, -2.801886, 0.3960784, 1, 0, 1,
-0.6342272, -0.3943189, -1.738212, 0.3921569, 1, 0, 1,
-0.6299191, -0.007924371, 0.5356374, 0.3843137, 1, 0, 1,
-0.6282026, -0.4107834, -1.605315, 0.3803922, 1, 0, 1,
-0.6281469, 0.6681252, -0.9119321, 0.372549, 1, 0, 1,
-0.619879, 1.072669, -0.05922467, 0.3686275, 1, 0, 1,
-0.617837, -0.4050634, -2.726675, 0.3607843, 1, 0, 1,
-0.6159819, -1.097276, -3.218289, 0.3568628, 1, 0, 1,
-0.6102892, 2.254033, -0.4710343, 0.3490196, 1, 0, 1,
-0.6030726, -1.850192, -4.120764, 0.345098, 1, 0, 1,
-0.6020817, 0.3927598, -1.759924, 0.3372549, 1, 0, 1,
-0.5970899, 1.177177, 0.8363309, 0.3333333, 1, 0, 1,
-0.593743, -0.3133719, -2.941566, 0.3254902, 1, 0, 1,
-0.5936511, -0.0379152, -0.8089029, 0.3215686, 1, 0, 1,
-0.5896294, -0.5454544, -2.154956, 0.3137255, 1, 0, 1,
-0.5834598, 0.7458542, 0.5311204, 0.3098039, 1, 0, 1,
-0.5729885, -0.7021505, -2.589128, 0.3019608, 1, 0, 1,
-0.5702742, 0.1987828, -3.648102, 0.2941177, 1, 0, 1,
-0.5695164, 0.7200633, -0.1731776, 0.2901961, 1, 0, 1,
-0.5660004, 0.1950562, -1.280431, 0.282353, 1, 0, 1,
-0.564167, -1.052898, -2.804348, 0.2784314, 1, 0, 1,
-0.5637712, -0.127939, -3.041884, 0.2705882, 1, 0, 1,
-0.5634437, 0.7760631, -1.949705, 0.2666667, 1, 0, 1,
-0.5607079, -0.107378, -1.823703, 0.2588235, 1, 0, 1,
-0.5593171, -0.1421452, -1.165601, 0.254902, 1, 0, 1,
-0.558102, -0.7615188, 0.1179524, 0.2470588, 1, 0, 1,
-0.554476, 1.115307, -1.739198, 0.2431373, 1, 0, 1,
-0.5527238, 0.04443232, -2.371819, 0.2352941, 1, 0, 1,
-0.5490233, 0.5338297, -0.6176842, 0.2313726, 1, 0, 1,
-0.5466806, -0.6240797, -1.751115, 0.2235294, 1, 0, 1,
-0.5418981, -2.305827, -2.365925, 0.2196078, 1, 0, 1,
-0.5373214, -0.1010399, -2.735469, 0.2117647, 1, 0, 1,
-0.5357788, -0.2642489, -1.934683, 0.2078431, 1, 0, 1,
-0.5324261, 0.7221717, -0.6458596, 0.2, 1, 0, 1,
-0.5264649, 1.043335, -1.582554, 0.1921569, 1, 0, 1,
-0.5238827, 1.080353, 0.7897816, 0.1882353, 1, 0, 1,
-0.5175101, 0.8291964, -0.7426874, 0.1803922, 1, 0, 1,
-0.5154645, 0.2198181, -1.580062, 0.1764706, 1, 0, 1,
-0.51342, -1.28453, -2.622842, 0.1686275, 1, 0, 1,
-0.513225, 0.2844874, -2.134624, 0.1647059, 1, 0, 1,
-0.512978, -1.306936, -2.963738, 0.1568628, 1, 0, 1,
-0.5103874, 1.522122, 1.996456, 0.1529412, 1, 0, 1,
-0.5083697, 0.0636548, -2.218805, 0.145098, 1, 0, 1,
-0.5083274, 0.2905864, -1.040921, 0.1411765, 1, 0, 1,
-0.5073682, 1.163723, -0.3084822, 0.1333333, 1, 0, 1,
-0.505569, 0.7148051, 0.01291261, 0.1294118, 1, 0, 1,
-0.5043809, -0.8642464, -2.498788, 0.1215686, 1, 0, 1,
-0.5034521, -1.67138, -2.40975, 0.1176471, 1, 0, 1,
-0.494948, 1.339453, -0.1608339, 0.1098039, 1, 0, 1,
-0.4940008, 1.215784, -0.3864228, 0.1058824, 1, 0, 1,
-0.4911888, -2.064902, -2.639823, 0.09803922, 1, 0, 1,
-0.4901093, 0.8221611, 0.4481079, 0.09019608, 1, 0, 1,
-0.4873063, -1.347873, -3.436701, 0.08627451, 1, 0, 1,
-0.4851923, 1.011543, -0.1504763, 0.07843138, 1, 0, 1,
-0.4815818, 1.005653, 0.9052324, 0.07450981, 1, 0, 1,
-0.4798788, 1.213718, -1.899937, 0.06666667, 1, 0, 1,
-0.4784504, 0.7216653, -1.180834, 0.0627451, 1, 0, 1,
-0.4784001, -0.5674847, -1.691458, 0.05490196, 1, 0, 1,
-0.4782773, -1.063195, -4.436928, 0.05098039, 1, 0, 1,
-0.4728691, -0.6123351, -2.639985, 0.04313726, 1, 0, 1,
-0.4710284, -2.220587, -2.189146, 0.03921569, 1, 0, 1,
-0.4668871, 0.8559787, -0.2975419, 0.03137255, 1, 0, 1,
-0.4653175, 2.616488, -1.512277, 0.02745098, 1, 0, 1,
-0.4558313, 0.6539689, -0.8024203, 0.01960784, 1, 0, 1,
-0.4431058, 0.9446236, -0.3733644, 0.01568628, 1, 0, 1,
-0.4429354, -0.6775321, -0.827618, 0.007843138, 1, 0, 1,
-0.4390484, 1.300202, 0.9836195, 0.003921569, 1, 0, 1,
-0.4382712, 0.3102252, 1.705117, 0, 1, 0.003921569, 1,
-0.4361998, -1.565335, -1.755847, 0, 1, 0.01176471, 1,
-0.4312664, -0.03185684, -1.320276, 0, 1, 0.01568628, 1,
-0.4296115, 0.267331, 0.3796878, 0, 1, 0.02352941, 1,
-0.4225981, -1.277373, -1.530562, 0, 1, 0.02745098, 1,
-0.4201927, -1.129179, -1.658878, 0, 1, 0.03529412, 1,
-0.4186557, 1.53652, -0.09388684, 0, 1, 0.03921569, 1,
-0.4156582, -0.5889868, -1.463525, 0, 1, 0.04705882, 1,
-0.4102353, -0.79693, -2.779842, 0, 1, 0.05098039, 1,
-0.4078919, 0.7994435, 0.2420687, 0, 1, 0.05882353, 1,
-0.4062676, 0.4008664, -0.2715228, 0, 1, 0.0627451, 1,
-0.406192, -0.3237693, -3.13192, 0, 1, 0.07058824, 1,
-0.4044213, -0.004399489, -0.4693859, 0, 1, 0.07450981, 1,
-0.4038266, -0.923134, -1.375932, 0, 1, 0.08235294, 1,
-0.4030774, -1.17229, -2.571139, 0, 1, 0.08627451, 1,
-0.4024459, 0.2529564, -0.2473082, 0, 1, 0.09411765, 1,
-0.4021668, 1.577808, 0.8076748, 0, 1, 0.1019608, 1,
-0.4000409, -0.0346163, -1.437103, 0, 1, 0.1058824, 1,
-0.3962171, -0.5005224, -2.788952, 0, 1, 0.1137255, 1,
-0.3934851, -0.5770251, -3.346895, 0, 1, 0.1176471, 1,
-0.3931149, -0.07678211, 0.5766658, 0, 1, 0.1254902, 1,
-0.3890922, 2.04715, -0.6445532, 0, 1, 0.1294118, 1,
-0.3843508, -0.3576365, -2.265342, 0, 1, 0.1372549, 1,
-0.382214, 0.3167376, -0.4305171, 0, 1, 0.1411765, 1,
-0.379986, -1.010072, -4.073939, 0, 1, 0.1490196, 1,
-0.3792288, -0.003756758, -0.830897, 0, 1, 0.1529412, 1,
-0.3749533, 1.047261, -2.9347, 0, 1, 0.1607843, 1,
-0.3741352, -0.7725934, -2.534672, 0, 1, 0.1647059, 1,
-0.3730035, -0.1459488, -3.274141, 0, 1, 0.172549, 1,
-0.3717418, 0.8420174, 1.280103, 0, 1, 0.1764706, 1,
-0.364164, -0.6439832, -2.222932, 0, 1, 0.1843137, 1,
-0.3638017, 0.3574515, -0.245942, 0, 1, 0.1882353, 1,
-0.3633957, 1.731905, 0.4269169, 0, 1, 0.1960784, 1,
-0.3622389, -0.1120287, -1.439907, 0, 1, 0.2039216, 1,
-0.3620314, -0.5640696, -2.497316, 0, 1, 0.2078431, 1,
-0.352469, 1.560449, -0.5886836, 0, 1, 0.2156863, 1,
-0.3508311, -2.269832, -1.348448, 0, 1, 0.2196078, 1,
-0.3506088, 0.7076869, -1.815992, 0, 1, 0.227451, 1,
-0.3494701, -0.7735815, -2.538967, 0, 1, 0.2313726, 1,
-0.3475145, 0.299644, 0.01996327, 0, 1, 0.2392157, 1,
-0.3457005, -0.5704626, -3.844398, 0, 1, 0.2431373, 1,
-0.3419052, 0.2021947, -1.045489, 0, 1, 0.2509804, 1,
-0.3391632, -1.512864, -3.601006, 0, 1, 0.254902, 1,
-0.3362443, -0.1264118, -1.21246, 0, 1, 0.2627451, 1,
-0.3319261, 0.8768792, -0.3907196, 0, 1, 0.2666667, 1,
-0.3287716, -0.256556, -1.937319, 0, 1, 0.2745098, 1,
-0.3209185, 0.650473, -0.5225332, 0, 1, 0.2784314, 1,
-0.3155155, 0.3689539, 0.5433238, 0, 1, 0.2862745, 1,
-0.3151427, 0.9315091, -0.5174673, 0, 1, 0.2901961, 1,
-0.3140046, 1.39599, -0.3228366, 0, 1, 0.2980392, 1,
-0.3016454, -0.9650952, -3.902777, 0, 1, 0.3058824, 1,
-0.2992169, -2.667622, -3.541469, 0, 1, 0.3098039, 1,
-0.2985815, -0.830096, -2.313132, 0, 1, 0.3176471, 1,
-0.2973633, -1.622536, -2.442867, 0, 1, 0.3215686, 1,
-0.2925963, -0.5006206, -2.279067, 0, 1, 0.3294118, 1,
-0.290052, -1.23187, -1.331455, 0, 1, 0.3333333, 1,
-0.2884406, 1.655306, 1.428365, 0, 1, 0.3411765, 1,
-0.2832687, 0.7146441, 0.2245596, 0, 1, 0.345098, 1,
-0.2819527, 0.953519, 0.2920033, 0, 1, 0.3529412, 1,
-0.2773629, 1.406335, -0.9554275, 0, 1, 0.3568628, 1,
-0.2756472, -0.4693301, -2.311424, 0, 1, 0.3647059, 1,
-0.2719627, -0.5092383, -3.132699, 0, 1, 0.3686275, 1,
-0.2664512, -1.557828, -5.144372, 0, 1, 0.3764706, 1,
-0.2598571, -0.1133215, -1.424988, 0, 1, 0.3803922, 1,
-0.2595235, 0.3342618, 1.914067, 0, 1, 0.3882353, 1,
-0.2564451, -0.3870476, -3.593675, 0, 1, 0.3921569, 1,
-0.2540016, 1.172365, -0.3468828, 0, 1, 0.4, 1,
-0.2516021, -0.5035144, -2.219954, 0, 1, 0.4078431, 1,
-0.249685, 1.153018, -1.163059, 0, 1, 0.4117647, 1,
-0.2482502, -0.004058416, -0.6432994, 0, 1, 0.4196078, 1,
-0.2465091, 0.09401591, -1.780795, 0, 1, 0.4235294, 1,
-0.2460636, 1.769019, 1.704789, 0, 1, 0.4313726, 1,
-0.2406533, 0.624219, 0.6094053, 0, 1, 0.4352941, 1,
-0.2345184, -0.9061632, -3.525807, 0, 1, 0.4431373, 1,
-0.2327467, -0.1541025, 0.8285021, 0, 1, 0.4470588, 1,
-0.2288818, -1.385932, -3.239903, 0, 1, 0.454902, 1,
-0.2278428, -1.134517, -3.27849, 0, 1, 0.4588235, 1,
-0.2276958, 0.302848, -1.413178, 0, 1, 0.4666667, 1,
-0.2240766, 0.06793864, -2.100236, 0, 1, 0.4705882, 1,
-0.2218551, -0.8866674, -0.3435856, 0, 1, 0.4784314, 1,
-0.2191207, 1.478706, -0.8931527, 0, 1, 0.4823529, 1,
-0.2186289, 1.039011, 0.05951723, 0, 1, 0.4901961, 1,
-0.2178911, -0.88471, -3.276811, 0, 1, 0.4941176, 1,
-0.213745, 0.6632333, -2.004934, 0, 1, 0.5019608, 1,
-0.2124019, 1.882804, -0.6973554, 0, 1, 0.509804, 1,
-0.2116809, -0.1091352, -2.901725, 0, 1, 0.5137255, 1,
-0.211629, -0.7322934, -2.158957, 0, 1, 0.5215687, 1,
-0.209442, -0.2931363, -2.620717, 0, 1, 0.5254902, 1,
-0.2077569, -0.5555601, -2.922728, 0, 1, 0.5333334, 1,
-0.2046106, -0.2373767, -2.687409, 0, 1, 0.5372549, 1,
-0.2045194, 0.3334635, -0.08905894, 0, 1, 0.5450981, 1,
-0.1978352, -0.4652179, -2.45155, 0, 1, 0.5490196, 1,
-0.1942882, 1.730261, -0.5336727, 0, 1, 0.5568628, 1,
-0.1931263, -0.2596996, -1.916968, 0, 1, 0.5607843, 1,
-0.1922329, -0.4642634, -2.44341, 0, 1, 0.5686275, 1,
-0.1870486, -0.2445142, -2.1379, 0, 1, 0.572549, 1,
-0.184571, -0.213225, -0.5581709, 0, 1, 0.5803922, 1,
-0.1823498, 0.2591455, -0.5584556, 0, 1, 0.5843138, 1,
-0.1822218, 0.1004537, -1.418318, 0, 1, 0.5921569, 1,
-0.1765791, 1.101138, -0.3717447, 0, 1, 0.5960785, 1,
-0.1761604, 0.5969496, 1.459079, 0, 1, 0.6039216, 1,
-0.1746888, 1.186988, -0.1352626, 0, 1, 0.6117647, 1,
-0.1732066, -0.66034, -2.171796, 0, 1, 0.6156863, 1,
-0.1655604, 0.135143, 0.6119277, 0, 1, 0.6235294, 1,
-0.1610478, -3.242611, -2.421547, 0, 1, 0.627451, 1,
-0.1570917, -1.274804, -4.238534, 0, 1, 0.6352941, 1,
-0.1570443, 0.1810669, -1.083542, 0, 1, 0.6392157, 1,
-0.1521401, 0.2848097, -1.657359, 0, 1, 0.6470588, 1,
-0.1520527, 0.2215673, 0.3023198, 0, 1, 0.6509804, 1,
-0.1520033, 0.07560602, -0.5342317, 0, 1, 0.6588235, 1,
-0.150751, -1.393201, -4.028744, 0, 1, 0.6627451, 1,
-0.147305, -2.224355, -3.707013, 0, 1, 0.6705883, 1,
-0.1440959, 0.7883319, -1.57007, 0, 1, 0.6745098, 1,
-0.1425707, -0.8444942, -3.765449, 0, 1, 0.682353, 1,
-0.1407967, -0.9861944, -3.988483, 0, 1, 0.6862745, 1,
-0.1407399, 0.9017179, 0.763182, 0, 1, 0.6941177, 1,
-0.1354019, 0.6027899, -0.6365962, 0, 1, 0.7019608, 1,
-0.1299303, -0.269798, -3.592849, 0, 1, 0.7058824, 1,
-0.1183225, 0.440165, 0.3891874, 0, 1, 0.7137255, 1,
-0.1140995, 0.2999556, -0.2933139, 0, 1, 0.7176471, 1,
-0.1135727, 0.1550104, -0.8949943, 0, 1, 0.7254902, 1,
-0.1104669, 0.9801788, 1.518334, 0, 1, 0.7294118, 1,
-0.1054985, 0.7398934, -0.4081688, 0, 1, 0.7372549, 1,
-0.1042052, -0.1507179, -2.114614, 0, 1, 0.7411765, 1,
-0.1038493, 0.1772413, -0.198573, 0, 1, 0.7490196, 1,
-0.09985971, -0.980213, -1.951797, 0, 1, 0.7529412, 1,
-0.09798501, 1.341165, -1.149488, 0, 1, 0.7607843, 1,
-0.09231237, -1.246053, -2.821835, 0, 1, 0.7647059, 1,
-0.09173885, -0.190174, -0.3549585, 0, 1, 0.772549, 1,
-0.08147524, 0.3195958, -0.3118127, 0, 1, 0.7764706, 1,
-0.08073309, 0.2478691, 0.4259243, 0, 1, 0.7843137, 1,
-0.07809898, 1.158471, -1.534881, 0, 1, 0.7882353, 1,
-0.07803527, 1.413721, -0.2220783, 0, 1, 0.7960784, 1,
-0.0747401, 0.2858927, -1.134, 0, 1, 0.8039216, 1,
-0.07308267, -0.4511886, -3.371592, 0, 1, 0.8078431, 1,
-0.07153079, -0.3055088, -4.613185, 0, 1, 0.8156863, 1,
-0.07074954, -0.8295507, -2.825167, 0, 1, 0.8196079, 1,
-0.06720774, -0.617694, -2.920408, 0, 1, 0.827451, 1,
-0.065359, -2.919292, -1.732925, 0, 1, 0.8313726, 1,
-0.0646148, -1.162072, -4.587781, 0, 1, 0.8392157, 1,
-0.0620511, 0.9384608, -0.7717298, 0, 1, 0.8431373, 1,
-0.05674105, 1.634034, 1.453178, 0, 1, 0.8509804, 1,
-0.05548483, 0.7361349, 0.1312895, 0, 1, 0.854902, 1,
-0.05382609, -0.2938546, -1.869974, 0, 1, 0.8627451, 1,
-0.05369992, -0.0693794, -4.125659, 0, 1, 0.8666667, 1,
-0.04996735, 0.9289669, -0.0381337, 0, 1, 0.8745098, 1,
-0.04793817, -0.03099141, -3.771647, 0, 1, 0.8784314, 1,
-0.04633415, 0.4270838, 0.8116247, 0, 1, 0.8862745, 1,
-0.0444556, 0.4728601, -3.076555, 0, 1, 0.8901961, 1,
-0.04187275, 0.8988101, -1.562868, 0, 1, 0.8980392, 1,
-0.04010847, 0.9716881, -0.07901856, 0, 1, 0.9058824, 1,
-0.03049384, 0.9776973, -0.4781353, 0, 1, 0.9098039, 1,
-0.02961492, 0.2549626, -2.63231, 0, 1, 0.9176471, 1,
-0.02850614, 0.9576079, -1.595201, 0, 1, 0.9215686, 1,
-0.02706846, -0.5835677, -1.975838, 0, 1, 0.9294118, 1,
-0.0256242, 1.748346, 0.2327713, 0, 1, 0.9333333, 1,
-0.02493846, 0.543545, 1.114643, 0, 1, 0.9411765, 1,
-0.01768653, 1.603647, 0.4211766, 0, 1, 0.945098, 1,
-0.01740748, -1.244349, -1.402438, 0, 1, 0.9529412, 1,
-0.0171028, -0.04159187, -1.220956, 0, 1, 0.9568627, 1,
-0.01703981, -1.247707, -2.930283, 0, 1, 0.9647059, 1,
-0.01290692, 1.188697, 0.8550662, 0, 1, 0.9686275, 1,
-0.004085055, -0.7296306, -2.94764, 0, 1, 0.9764706, 1,
0.0084507, -0.01932835, 3.079696, 0, 1, 0.9803922, 1,
0.01118384, 0.2467157, -0.4394257, 0, 1, 0.9882353, 1,
0.01208075, 0.5162436, -0.8067787, 0, 1, 0.9921569, 1,
0.01227078, -0.3774982, 3.003466, 0, 1, 1, 1,
0.02077079, 0.9308842, 0.3345701, 0, 0.9921569, 1, 1,
0.02087923, -0.5649673, 3.123812, 0, 0.9882353, 1, 1,
0.02380421, -2.431043, 2.630325, 0, 0.9803922, 1, 1,
0.02448655, -1.341728, 4.566014, 0, 0.9764706, 1, 1,
0.02885064, 1.245667, -0.2592134, 0, 0.9686275, 1, 1,
0.04044586, 0.5541991, 0.7559656, 0, 0.9647059, 1, 1,
0.04115115, -0.02350132, 0.9965675, 0, 0.9568627, 1, 1,
0.0440023, -1.985026, 3.041601, 0, 0.9529412, 1, 1,
0.04583988, 0.7192579, -0.8971776, 0, 0.945098, 1, 1,
0.04826479, -0.649291, 2.413046, 0, 0.9411765, 1, 1,
0.05327805, 1.121525, -0.8024117, 0, 0.9333333, 1, 1,
0.05614712, 0.04634587, 0.1491787, 0, 0.9294118, 1, 1,
0.05947186, -3.0664, 2.626323, 0, 0.9215686, 1, 1,
0.06273045, 1.631119, 0.3400654, 0, 0.9176471, 1, 1,
0.06702699, 0.04939694, 0.6943017, 0, 0.9098039, 1, 1,
0.06878507, 0.1572668, -1.18252, 0, 0.9058824, 1, 1,
0.07372723, -1.559285, 3.168447, 0, 0.8980392, 1, 1,
0.07512048, -0.9215317, 4.173707, 0, 0.8901961, 1, 1,
0.07681078, 0.9344828, 0.3247794, 0, 0.8862745, 1, 1,
0.07849535, -1.544702, 4.115266, 0, 0.8784314, 1, 1,
0.07968424, 0.7554305, 0.973357, 0, 0.8745098, 1, 1,
0.08239834, 2.569219, 0.7638328, 0, 0.8666667, 1, 1,
0.08461893, 0.8634017, 1.729533, 0, 0.8627451, 1, 1,
0.0873879, -0.6765589, 2.497507, 0, 0.854902, 1, 1,
0.0922974, 0.3300133, 0.9486269, 0, 0.8509804, 1, 1,
0.092558, -0.1434456, 1.091741, 0, 0.8431373, 1, 1,
0.1024681, 0.6997008, -0.8405663, 0, 0.8392157, 1, 1,
0.105275, 0.2878885, -0.287427, 0, 0.8313726, 1, 1,
0.1159479, -0.9448873, 2.827644, 0, 0.827451, 1, 1,
0.1188423, 1.014635, 0.3664788, 0, 0.8196079, 1, 1,
0.1212825, 1.596217, 0.9206368, 0, 0.8156863, 1, 1,
0.1230713, 0.1124016, -0.6970868, 0, 0.8078431, 1, 1,
0.1247244, 1.208882, -0.5642952, 0, 0.8039216, 1, 1,
0.1258943, -0.9348715, 2.905971, 0, 0.7960784, 1, 1,
0.1267746, 1.131776, 0.1356948, 0, 0.7882353, 1, 1,
0.1385287, 2.248056, -0.4020055, 0, 0.7843137, 1, 1,
0.1405703, 1.091943, -1.071042, 0, 0.7764706, 1, 1,
0.1460829, -0.4070331, 2.772834, 0, 0.772549, 1, 1,
0.1519602, -0.5178901, 2.667011, 0, 0.7647059, 1, 1,
0.1644647, -0.7340742, 2.118671, 0, 0.7607843, 1, 1,
0.1652938, -0.239859, 2.705585, 0, 0.7529412, 1, 1,
0.1670464, -0.8805228, 4.469297, 0, 0.7490196, 1, 1,
0.1691392, -0.7272856, 0.9861795, 0, 0.7411765, 1, 1,
0.1732516, -0.1601796, 1.328339, 0, 0.7372549, 1, 1,
0.1771041, 0.2299046, 0.8484314, 0, 0.7294118, 1, 1,
0.1798835, -0.710332, 5.273083, 0, 0.7254902, 1, 1,
0.1806817, 1.031959, -0.4597097, 0, 0.7176471, 1, 1,
0.1819061, -0.5611035, 3.490062, 0, 0.7137255, 1, 1,
0.1856915, -2.200055, 2.04941, 0, 0.7058824, 1, 1,
0.1934194, -0.06311013, -0.1966789, 0, 0.6980392, 1, 1,
0.1946978, -2.012706, 5.28981, 0, 0.6941177, 1, 1,
0.1999845, 1.044455, 0.4235854, 0, 0.6862745, 1, 1,
0.2013558, 1.132286, 0.6535399, 0, 0.682353, 1, 1,
0.2026222, -2.454021, 2.718714, 0, 0.6745098, 1, 1,
0.2028127, 0.3859345, 1.70014, 0, 0.6705883, 1, 1,
0.2192767, 1.541002, -0.6529971, 0, 0.6627451, 1, 1,
0.2210855, 0.1987836, 0.9393975, 0, 0.6588235, 1, 1,
0.2225338, -0.583554, 1.702391, 0, 0.6509804, 1, 1,
0.2251094, 0.3435185, 0.5612703, 0, 0.6470588, 1, 1,
0.2255119, -0.1400589, 2.831362, 0, 0.6392157, 1, 1,
0.2274867, 0.5135937, 1.339166, 0, 0.6352941, 1, 1,
0.2313199, 0.04616479, 0.0241091, 0, 0.627451, 1, 1,
0.2377238, -0.2151362, 2.937327, 0, 0.6235294, 1, 1,
0.2377465, -0.8862787, 4.791219, 0, 0.6156863, 1, 1,
0.2395655, 2.085215, 1.170584, 0, 0.6117647, 1, 1,
0.2441633, -0.2915364, 2.55812, 0, 0.6039216, 1, 1,
0.2452468, -0.7015768, 2.109164, 0, 0.5960785, 1, 1,
0.2515855, 1.569528, -0.4106377, 0, 0.5921569, 1, 1,
0.2536259, -1.188195, 2.362188, 0, 0.5843138, 1, 1,
0.2545072, -0.8358507, 4.95348, 0, 0.5803922, 1, 1,
0.2594492, -1.464096, 2.75971, 0, 0.572549, 1, 1,
0.2614559, 0.6170549, 1.062804, 0, 0.5686275, 1, 1,
0.2659039, -0.3079327, 4.030923, 0, 0.5607843, 1, 1,
0.266272, -1.001523, 3.603818, 0, 0.5568628, 1, 1,
0.2706933, 0.3617899, 0.2672348, 0, 0.5490196, 1, 1,
0.271089, -0.1480853, 3.802117, 0, 0.5450981, 1, 1,
0.2727906, -0.880652, 2.685514, 0, 0.5372549, 1, 1,
0.2729454, 0.3859817, 1.55795, 0, 0.5333334, 1, 1,
0.2751275, 1.424222, -0.4616595, 0, 0.5254902, 1, 1,
0.2753294, -0.600829, 1.872924, 0, 0.5215687, 1, 1,
0.2777577, 0.2937419, 1.64295, 0, 0.5137255, 1, 1,
0.2881723, 1.379219, -0.6826289, 0, 0.509804, 1, 1,
0.2953811, -0.6143512, 3.860671, 0, 0.5019608, 1, 1,
0.2959976, -2.203225, 3.087827, 0, 0.4941176, 1, 1,
0.2987992, -0.5128711, 1.935871, 0, 0.4901961, 1, 1,
0.3005874, 0.00330644, 2.749834, 0, 0.4823529, 1, 1,
0.3025215, -0.125867, 2.750497, 0, 0.4784314, 1, 1,
0.3032308, -0.1313379, 4.060669, 0, 0.4705882, 1, 1,
0.3038151, 0.1986947, 0.679944, 0, 0.4666667, 1, 1,
0.3085202, 0.5847853, 0.8982171, 0, 0.4588235, 1, 1,
0.3118689, -1.865795, 3.082162, 0, 0.454902, 1, 1,
0.3130778, -0.08291641, 0.9661393, 0, 0.4470588, 1, 1,
0.3177721, 1.72471, 0.296906, 0, 0.4431373, 1, 1,
0.3189482, -0.9998705, 2.628341, 0, 0.4352941, 1, 1,
0.3209595, -1.511652, 2.158453, 0, 0.4313726, 1, 1,
0.322049, 1.567116, -0.2127497, 0, 0.4235294, 1, 1,
0.324426, 1.690428, 0.1892281, 0, 0.4196078, 1, 1,
0.3246001, 2.117028, -1.651349, 0, 0.4117647, 1, 1,
0.3251153, -1.949462, 2.178108, 0, 0.4078431, 1, 1,
0.3252976, 0.4225573, 0.7293525, 0, 0.4, 1, 1,
0.329963, 0.2230861, 1.11975, 0, 0.3921569, 1, 1,
0.332213, 0.4153967, 1.797767, 0, 0.3882353, 1, 1,
0.3329179, 0.6056006, 1.378341, 0, 0.3803922, 1, 1,
0.3333039, -1.281646, 2.253224, 0, 0.3764706, 1, 1,
0.3427386, -0.3537524, 3.632943, 0, 0.3686275, 1, 1,
0.3450313, 0.2472528, 0.7879104, 0, 0.3647059, 1, 1,
0.3470964, 1.767022, -0.1376125, 0, 0.3568628, 1, 1,
0.3478298, -0.5176639, 3.644017, 0, 0.3529412, 1, 1,
0.348775, -0.4359924, 1.190315, 0, 0.345098, 1, 1,
0.3516458, -0.4044042, 3.183567, 0, 0.3411765, 1, 1,
0.3534683, 0.9783601, 0.5664125, 0, 0.3333333, 1, 1,
0.3553569, 1.838993, 0.1303975, 0, 0.3294118, 1, 1,
0.3562102, 0.4241864, 1.61801, 0, 0.3215686, 1, 1,
0.3582107, -0.2146014, 0.5373563, 0, 0.3176471, 1, 1,
0.359889, 0.5840137, -1.510746, 0, 0.3098039, 1, 1,
0.3605389, -0.5850213, 4.114079, 0, 0.3058824, 1, 1,
0.3618244, -0.7332711, 1.951396, 0, 0.2980392, 1, 1,
0.3639546, 1.512981, -1.060573, 0, 0.2901961, 1, 1,
0.3662092, -0.3311753, 1.067401, 0, 0.2862745, 1, 1,
0.3666176, 1.38593, -0.7838898, 0, 0.2784314, 1, 1,
0.3689959, 0.3061374, 1.787645, 0, 0.2745098, 1, 1,
0.3742156, -0.5710354, 3.152327, 0, 0.2666667, 1, 1,
0.3751879, -0.7791932, 3.319163, 0, 0.2627451, 1, 1,
0.3787044, -0.02837772, 3.546581, 0, 0.254902, 1, 1,
0.3796283, -0.02652076, 2.215051, 0, 0.2509804, 1, 1,
0.3804406, 0.6738994, 0.8465624, 0, 0.2431373, 1, 1,
0.3857148, -0.9457018, 1.758621, 0, 0.2392157, 1, 1,
0.3886663, -1.522905, 3.486191, 0, 0.2313726, 1, 1,
0.3916618, 0.02009835, 1.754048, 0, 0.227451, 1, 1,
0.3922524, 0.6088337, 1.054269, 0, 0.2196078, 1, 1,
0.3924218, -1.272681, 3.180389, 0, 0.2156863, 1, 1,
0.3938117, -1.267384, 4.609873, 0, 0.2078431, 1, 1,
0.396719, -1.211077, 1.436034, 0, 0.2039216, 1, 1,
0.3998856, 1.454718, -0.02489805, 0, 0.1960784, 1, 1,
0.4006686, 0.2994224, 0.3522551, 0, 0.1882353, 1, 1,
0.4047786, -0.9942264, 2.308594, 0, 0.1843137, 1, 1,
0.4232452, 1.45543, -0.029849, 0, 0.1764706, 1, 1,
0.4275417, -0.07917763, 2.76813, 0, 0.172549, 1, 1,
0.4281515, 0.0209306, 3.311155, 0, 0.1647059, 1, 1,
0.4311087, -1.380663, 1.956083, 0, 0.1607843, 1, 1,
0.4314906, -0.5481038, 2.389016, 0, 0.1529412, 1, 1,
0.4403193, 0.2443708, 1.085263, 0, 0.1490196, 1, 1,
0.4407942, -1.187614, 3.060827, 0, 0.1411765, 1, 1,
0.442327, 0.4754405, 0.7726074, 0, 0.1372549, 1, 1,
0.4435755, 1.421987, 0.294724, 0, 0.1294118, 1, 1,
0.4525173, -0.2673406, 0.4947806, 0, 0.1254902, 1, 1,
0.4542431, -0.02719001, 1.969383, 0, 0.1176471, 1, 1,
0.4546104, -0.4617208, 2.277204, 0, 0.1137255, 1, 1,
0.4552706, -2.130837, 3.336577, 0, 0.1058824, 1, 1,
0.455343, -1.594486, 0.7209695, 0, 0.09803922, 1, 1,
0.4561652, 0.5636506, 0.06211907, 0, 0.09411765, 1, 1,
0.4571987, 1.775128, 0.1882126, 0, 0.08627451, 1, 1,
0.4580476, 2.637622, 0.1244581, 0, 0.08235294, 1, 1,
0.4583049, -0.4033889, 1.87754, 0, 0.07450981, 1, 1,
0.4621729, -0.8976725, 2.020114, 0, 0.07058824, 1, 1,
0.4633515, -0.2068829, 0.06180122, 0, 0.0627451, 1, 1,
0.4645016, -0.7837464, 3.435888, 0, 0.05882353, 1, 1,
0.4665851, -1.178869, 2.168823, 0, 0.05098039, 1, 1,
0.4673999, -0.6719353, 2.59241, 0, 0.04705882, 1, 1,
0.4721679, -0.404439, 1.232261, 0, 0.03921569, 1, 1,
0.4731975, 0.2902376, 0.2092883, 0, 0.03529412, 1, 1,
0.4732311, -0.7015679, 2.524178, 0, 0.02745098, 1, 1,
0.4780383, -2.312152, 2.284522, 0, 0.02352941, 1, 1,
0.4793465, -1.055248, 2.117866, 0, 0.01568628, 1, 1,
0.4812804, -0.6637116, 4.124107, 0, 0.01176471, 1, 1,
0.4840847, 0.3046385, 0.7689251, 0, 0.003921569, 1, 1,
0.4874345, 0.3458154, 0.3953432, 0.003921569, 0, 1, 1,
0.4879113, -0.9135112, 3.938633, 0.007843138, 0, 1, 1,
0.4910295, 0.8641145, 2.320958, 0.01568628, 0, 1, 1,
0.4911323, 0.5727509, 0.09600673, 0.01960784, 0, 1, 1,
0.494661, 0.6875749, 0.01800424, 0.02745098, 0, 1, 1,
0.4961573, -1.770201, 4.342978, 0.03137255, 0, 1, 1,
0.4972435, 0.3428582, 0.486205, 0.03921569, 0, 1, 1,
0.5007709, 0.4929823, -0.546353, 0.04313726, 0, 1, 1,
0.5015391, -0.03238653, 1.242292, 0.05098039, 0, 1, 1,
0.5032505, -0.5020358, 1.95478, 0.05490196, 0, 1, 1,
0.506294, 0.9051126, 0.4280161, 0.0627451, 0, 1, 1,
0.5072227, -0.1914042, 1.61046, 0.06666667, 0, 1, 1,
0.5087273, -0.9793961, 0.3397972, 0.07450981, 0, 1, 1,
0.5152393, 0.7970756, 0.8364725, 0.07843138, 0, 1, 1,
0.5163295, 0.5180537, 0.449737, 0.08627451, 0, 1, 1,
0.5165231, 0.5805382, 1.131091, 0.09019608, 0, 1, 1,
0.5168775, 1.916129, 1.832954, 0.09803922, 0, 1, 1,
0.5204432, 0.1955642, 1.171881, 0.1058824, 0, 1, 1,
0.5218786, -0.4578514, 1.796817, 0.1098039, 0, 1, 1,
0.5268462, -0.3414637, 1.095278, 0.1176471, 0, 1, 1,
0.5308576, -0.7114262, 2.39245, 0.1215686, 0, 1, 1,
0.5312265, -0.05580941, 0.7450426, 0.1294118, 0, 1, 1,
0.531794, 0.9762079, 1.884097, 0.1333333, 0, 1, 1,
0.5356976, -0.156461, 2.20214, 0.1411765, 0, 1, 1,
0.5383313, -0.3239793, 1.744354, 0.145098, 0, 1, 1,
0.5385977, -0.683619, 3.011496, 0.1529412, 0, 1, 1,
0.5427706, 0.09444845, 2.426074, 0.1568628, 0, 1, 1,
0.5428451, 1.227486, 1.435185, 0.1647059, 0, 1, 1,
0.5474873, -0.1340494, 1.240999, 0.1686275, 0, 1, 1,
0.549288, -0.151461, -0.158055, 0.1764706, 0, 1, 1,
0.5500315, 0.104408, 1.722545, 0.1803922, 0, 1, 1,
0.5582641, 0.3756731, 2.31491, 0.1882353, 0, 1, 1,
0.5686531, 0.8962423, -0.5736603, 0.1921569, 0, 1, 1,
0.5703036, -0.8131027, 1.47671, 0.2, 0, 1, 1,
0.5758872, -1.114583, 1.770529, 0.2078431, 0, 1, 1,
0.576495, 0.2336772, 1.029834, 0.2117647, 0, 1, 1,
0.5789806, -0.7128888, 2.769656, 0.2196078, 0, 1, 1,
0.5802135, 0.4061824, 1.354547, 0.2235294, 0, 1, 1,
0.5871806, 1.850168, -0.6523367, 0.2313726, 0, 1, 1,
0.5919243, -2.197684, 4.69135, 0.2352941, 0, 1, 1,
0.5967045, 0.7641041, 2.549762, 0.2431373, 0, 1, 1,
0.59949, 0.611105, 0.5597528, 0.2470588, 0, 1, 1,
0.6021188, -0.4606202, 1.094106, 0.254902, 0, 1, 1,
0.6058852, 1.068373, -0.5390793, 0.2588235, 0, 1, 1,
0.606676, 0.3702341, 1.973444, 0.2666667, 0, 1, 1,
0.6092251, 1.16461, 0.9762999, 0.2705882, 0, 1, 1,
0.6147417, 0.3168235, -0.03233039, 0.2784314, 0, 1, 1,
0.615484, 1.300629, 0.6573828, 0.282353, 0, 1, 1,
0.6179466, -0.1477519, 3.262341, 0.2901961, 0, 1, 1,
0.6228753, 1.125653, 2.349498, 0.2941177, 0, 1, 1,
0.6239652, -0.2899376, 0.8132999, 0.3019608, 0, 1, 1,
0.6247742, 0.9889692, 0.758753, 0.3098039, 0, 1, 1,
0.6270697, -1.610412, 2.835444, 0.3137255, 0, 1, 1,
0.6278741, 1.107727, 0.8540102, 0.3215686, 0, 1, 1,
0.6291682, -0.6771318, 1.881708, 0.3254902, 0, 1, 1,
0.6295338, 1.149068, 1.318162, 0.3333333, 0, 1, 1,
0.632386, 0.9191, 0.9110641, 0.3372549, 0, 1, 1,
0.6422961, -0.5713177, 3.181797, 0.345098, 0, 1, 1,
0.6432913, -0.8952295, 2.096802, 0.3490196, 0, 1, 1,
0.6485211, 2.027286, -0.7963979, 0.3568628, 0, 1, 1,
0.650525, 0.3918907, 0.05032961, 0.3607843, 0, 1, 1,
0.6521724, 0.3014136, 1.381994, 0.3686275, 0, 1, 1,
0.6549013, 0.552169, 0.7296658, 0.372549, 0, 1, 1,
0.6568117, 1.765993, -0.2917247, 0.3803922, 0, 1, 1,
0.6624542, -0.2135728, 4.388616, 0.3843137, 0, 1, 1,
0.6630788, -1.513455, 2.560316, 0.3921569, 0, 1, 1,
0.6639764, -0.7345961, 3.255717, 0.3960784, 0, 1, 1,
0.6649595, -2.514026, 3.435947, 0.4039216, 0, 1, 1,
0.6663366, 0.04369673, 2.36751, 0.4117647, 0, 1, 1,
0.667658, 0.3430634, 0.8172148, 0.4156863, 0, 1, 1,
0.6682286, -0.9400356, 4.480519, 0.4235294, 0, 1, 1,
0.6714182, 0.5003749, 1.507071, 0.427451, 0, 1, 1,
0.6717576, -0.8670641, 2.232343, 0.4352941, 0, 1, 1,
0.6718554, -0.2013969, 2.811474, 0.4392157, 0, 1, 1,
0.6753626, -0.493527, 3.178906, 0.4470588, 0, 1, 1,
0.6763974, -1.265092, 1.894014, 0.4509804, 0, 1, 1,
0.6773006, 0.1042756, 2.5077, 0.4588235, 0, 1, 1,
0.6776028, 0.5445992, 0.822823, 0.4627451, 0, 1, 1,
0.681375, 0.5062822, -0.2997558, 0.4705882, 0, 1, 1,
0.6836033, 0.4294845, 1.505655, 0.4745098, 0, 1, 1,
0.6839992, 1.607476, -0.775075, 0.4823529, 0, 1, 1,
0.6849059, 0.6189556, -0.8087088, 0.4862745, 0, 1, 1,
0.685201, -0.1486697, 1.404651, 0.4941176, 0, 1, 1,
0.6887665, 0.3326957, 1.155855, 0.5019608, 0, 1, 1,
0.6913703, 1.261002, 1.412332, 0.5058824, 0, 1, 1,
0.6924891, -0.4999598, 3.471402, 0.5137255, 0, 1, 1,
0.7014794, -1.651424, 3.443594, 0.5176471, 0, 1, 1,
0.7026558, -1.17828, 2.865825, 0.5254902, 0, 1, 1,
0.706964, 0.02699961, 2.43542, 0.5294118, 0, 1, 1,
0.7070314, 1.380486, 2.229224, 0.5372549, 0, 1, 1,
0.7137732, -0.7382157, 2.011345, 0.5411765, 0, 1, 1,
0.7147419, 0.7535704, 1.512337, 0.5490196, 0, 1, 1,
0.7151267, 1.070515, 0.112163, 0.5529412, 0, 1, 1,
0.7154764, -0.2365666, 2.115289, 0.5607843, 0, 1, 1,
0.7179026, 0.7261897, 0.4439139, 0.5647059, 0, 1, 1,
0.7181, -0.7317599, 2.398805, 0.572549, 0, 1, 1,
0.718448, -0.7231932, 3.235509, 0.5764706, 0, 1, 1,
0.7211289, -0.4013383, 2.488444, 0.5843138, 0, 1, 1,
0.7214627, 0.4363969, 0.3433218, 0.5882353, 0, 1, 1,
0.7255709, 1.575814, 1.976939, 0.5960785, 0, 1, 1,
0.7304597, -0.3484713, 1.822361, 0.6039216, 0, 1, 1,
0.7308274, -0.832009, 0.9707483, 0.6078432, 0, 1, 1,
0.733552, -0.383933, 0.6760378, 0.6156863, 0, 1, 1,
0.7341877, 1.258952, 1.362806, 0.6196079, 0, 1, 1,
0.7455288, 1.516979, -1.043264, 0.627451, 0, 1, 1,
0.7456173, 1.338656, -0.2201723, 0.6313726, 0, 1, 1,
0.7531109, -0.2733416, 1.291857, 0.6392157, 0, 1, 1,
0.7533851, -0.5330221, 2.432032, 0.6431373, 0, 1, 1,
0.7582017, -1.290486, 3.95086, 0.6509804, 0, 1, 1,
0.7670652, -0.2076068, 1.028204, 0.654902, 0, 1, 1,
0.7684947, -0.2516945, 1.861358, 0.6627451, 0, 1, 1,
0.7696271, -1.399765, 2.676644, 0.6666667, 0, 1, 1,
0.7701986, -1.002694, 1.766237, 0.6745098, 0, 1, 1,
0.7719529, 1.2645, -1.539878, 0.6784314, 0, 1, 1,
0.7766086, -0.0762981, 0.9109942, 0.6862745, 0, 1, 1,
0.7802663, 0.0398582, 3.445897, 0.6901961, 0, 1, 1,
0.7806259, 0.5616444, 0.211796, 0.6980392, 0, 1, 1,
0.7823218, 0.06772105, 2.576727, 0.7058824, 0, 1, 1,
0.7854857, -0.6906043, 2.528017, 0.7098039, 0, 1, 1,
0.7960042, 0.08370367, 2.413399, 0.7176471, 0, 1, 1,
0.800152, -0.7082613, 2.270959, 0.7215686, 0, 1, 1,
0.8042039, -1.347191, 1.681702, 0.7294118, 0, 1, 1,
0.8102003, -1.144797, 1.261581, 0.7333333, 0, 1, 1,
0.812119, -0.96021, 2.996197, 0.7411765, 0, 1, 1,
0.8153619, 1.742364, 1.808937, 0.7450981, 0, 1, 1,
0.8188793, 2.19203, -0.9447311, 0.7529412, 0, 1, 1,
0.8197404, -1.234948, 2.12425, 0.7568628, 0, 1, 1,
0.8209732, -1.072625, 2.86937, 0.7647059, 0, 1, 1,
0.8228276, 0.003830696, 1.073124, 0.7686275, 0, 1, 1,
0.826419, -1.060456, 3.466729, 0.7764706, 0, 1, 1,
0.8354275, -0.68783, 2.404593, 0.7803922, 0, 1, 1,
0.8417444, 0.7533346, 0.6946764, 0.7882353, 0, 1, 1,
0.8445264, -1.615567, 4.115852, 0.7921569, 0, 1, 1,
0.8515822, 1.108538, 1.262297, 0.8, 0, 1, 1,
0.8520257, 0.6414909, 0.2071126, 0.8078431, 0, 1, 1,
0.8538952, 1.295146, 1.378842, 0.8117647, 0, 1, 1,
0.8553651, -1.814015, 3.681928, 0.8196079, 0, 1, 1,
0.8604423, -0.5717044, 2.485242, 0.8235294, 0, 1, 1,
0.8711625, 0.2869364, 1.398726, 0.8313726, 0, 1, 1,
0.875897, 0.5901124, 2.72283, 0.8352941, 0, 1, 1,
0.8832428, 0.8138216, 0.4227319, 0.8431373, 0, 1, 1,
0.8865479, 2.117038, 0.9986836, 0.8470588, 0, 1, 1,
0.8885161, 1.527844, 1.648175, 0.854902, 0, 1, 1,
0.8916699, 1.306153, 1.824856, 0.8588235, 0, 1, 1,
0.8926209, -0.1528261, 1.678388, 0.8666667, 0, 1, 1,
0.8940158, 1.638522, -0.455905, 0.8705882, 0, 1, 1,
0.8941994, 0.762369, 0.874311, 0.8784314, 0, 1, 1,
0.8988096, 1.901588, 0.3126603, 0.8823529, 0, 1, 1,
0.9004377, -0.5106828, 0.9645565, 0.8901961, 0, 1, 1,
0.9054928, 1.342066, 0.7765389, 0.8941177, 0, 1, 1,
0.9194188, -0.4121612, 0.7069824, 0.9019608, 0, 1, 1,
0.9241434, 0.5078946, 0.4947611, 0.9098039, 0, 1, 1,
0.9245411, 0.1125266, 3.100673, 0.9137255, 0, 1, 1,
0.92462, 1.755373, 0.5629979, 0.9215686, 0, 1, 1,
0.9247444, 0.5779967, 2.705975, 0.9254902, 0, 1, 1,
0.9277804, 0.02899539, 1.653391, 0.9333333, 0, 1, 1,
0.9321216, -0.8486976, 2.603798, 0.9372549, 0, 1, 1,
0.9367291, 1.207495, 1.195249, 0.945098, 0, 1, 1,
0.9402637, 0.487249, 1.216173, 0.9490196, 0, 1, 1,
0.9406307, 1.100768, 0.9884216, 0.9568627, 0, 1, 1,
0.9415796, 0.06381134, 1.701786, 0.9607843, 0, 1, 1,
0.9494614, 0.5082265, 1.760373, 0.9686275, 0, 1, 1,
0.9501385, 0.9081051, 2.720595, 0.972549, 0, 1, 1,
0.9517282, 2.044256, 0.9806947, 0.9803922, 0, 1, 1,
0.952049, -1.944396, 2.310882, 0.9843137, 0, 1, 1,
0.9607452, 0.2985473, 2.136359, 0.9921569, 0, 1, 1,
0.963305, -1.370589, 3.819146, 0.9960784, 0, 1, 1,
0.965157, -1.261135, 4.0419, 1, 0, 0.9960784, 1,
0.9733899, -0.003250702, 2.628239, 1, 0, 0.9882353, 1,
0.9756616, 0.04148204, 2.161705, 1, 0, 0.9843137, 1,
0.981874, 1.377169, -0.6063684, 1, 0, 0.9764706, 1,
0.9898049, 0.4359218, 1.073836, 1, 0, 0.972549, 1,
0.994009, 0.05064352, 2.952322, 1, 0, 0.9647059, 1,
1.000551, 0.8546291, -0.2239068, 1, 0, 0.9607843, 1,
1.000734, 0.8107821, 0.8283483, 1, 0, 0.9529412, 1,
1.001592, -0.3323875, 2.921328, 1, 0, 0.9490196, 1,
1.006522, -0.7261528, 3.714937, 1, 0, 0.9411765, 1,
1.006823, -0.411351, 2.865726, 1, 0, 0.9372549, 1,
1.009107, -2.328454, 2.846916, 1, 0, 0.9294118, 1,
1.010013, 0.8828456, -0.9120793, 1, 0, 0.9254902, 1,
1.013506, 0.2504441, 2.334963, 1, 0, 0.9176471, 1,
1.015671, -0.1381485, -0.007963267, 1, 0, 0.9137255, 1,
1.025374, 0.7809119, 0.1607443, 1, 0, 0.9058824, 1,
1.028447, 0.5794094, 0.2072109, 1, 0, 0.9019608, 1,
1.029314, 1.373071, 0.4529435, 1, 0, 0.8941177, 1,
1.036744, 0.1079174, 0.6139645, 1, 0, 0.8862745, 1,
1.041392, 0.1006844, 3.063936, 1, 0, 0.8823529, 1,
1.043404, 2.673331, 0.3573447, 1, 0, 0.8745098, 1,
1.046562, 0.5523332, 0.04488501, 1, 0, 0.8705882, 1,
1.048096, -1.017024, 2.995542, 1, 0, 0.8627451, 1,
1.049933, 1.862999, 0.9426394, 1, 0, 0.8588235, 1,
1.051854, 1.314214, 1.255244, 1, 0, 0.8509804, 1,
1.053676, 0.535549, -0.02568766, 1, 0, 0.8470588, 1,
1.05588, -0.6615295, 1.739272, 1, 0, 0.8392157, 1,
1.062616, 0.9478254, -0.3195806, 1, 0, 0.8352941, 1,
1.072747, 1.930253, -0.1280405, 1, 0, 0.827451, 1,
1.074141, -0.503979, 2.30823, 1, 0, 0.8235294, 1,
1.077684, -0.07364675, 1.28579, 1, 0, 0.8156863, 1,
1.07879, -0.4153567, 4.424778, 1, 0, 0.8117647, 1,
1.087292, 2.284725, 0.964845, 1, 0, 0.8039216, 1,
1.09764, 1.033991, 1.320091, 1, 0, 0.7960784, 1,
1.11287, -1.10875, 1.334314, 1, 0, 0.7921569, 1,
1.113428, -0.1698461, 0.5838284, 1, 0, 0.7843137, 1,
1.113699, -2.092492, 3.485875, 1, 0, 0.7803922, 1,
1.115954, 1.091093, 2.885221, 1, 0, 0.772549, 1,
1.116309, -1.343194, 2.864719, 1, 0, 0.7686275, 1,
1.120744, -1.477932, 2.556381, 1, 0, 0.7607843, 1,
1.12809, 1.277635, 1.316199, 1, 0, 0.7568628, 1,
1.141034, 0.3782853, 2.193197, 1, 0, 0.7490196, 1,
1.143049, -0.1867119, 0.4688172, 1, 0, 0.7450981, 1,
1.150506, -1.945011, 2.753396, 1, 0, 0.7372549, 1,
1.172273, 0.7049345, 1.691632, 1, 0, 0.7333333, 1,
1.179369, 0.2866997, 0.3823373, 1, 0, 0.7254902, 1,
1.181952, 0.5793686, 1.673217, 1, 0, 0.7215686, 1,
1.183345, -0.2561017, 2.015988, 1, 0, 0.7137255, 1,
1.188729, 1.313154, 1.199701, 1, 0, 0.7098039, 1,
1.190666, 1.738519, -0.5701247, 1, 0, 0.7019608, 1,
1.202704, 0.03798664, 0.9748904, 1, 0, 0.6941177, 1,
1.203437, -0.8450114, 3.441088, 1, 0, 0.6901961, 1,
1.204201, 1.052382, 1.480438, 1, 0, 0.682353, 1,
1.206337, 1.02537, 1.027468, 1, 0, 0.6784314, 1,
1.210344, -0.8690609, 1.684208, 1, 0, 0.6705883, 1,
1.214171, 1.020733, 0.3219935, 1, 0, 0.6666667, 1,
1.224317, -0.02611068, 2.021784, 1, 0, 0.6588235, 1,
1.224897, -0.5477288, 2.988611, 1, 0, 0.654902, 1,
1.231014, -0.5147517, 1.711623, 1, 0, 0.6470588, 1,
1.249711, -1.39938, 3.783894, 1, 0, 0.6431373, 1,
1.253387, 0.2166313, 0.7560115, 1, 0, 0.6352941, 1,
1.255918, -0.6842918, 4.138004, 1, 0, 0.6313726, 1,
1.26199, -0.6175306, 0.9035492, 1, 0, 0.6235294, 1,
1.264038, -0.5224399, 3.207331, 1, 0, 0.6196079, 1,
1.265367, 1.104767, 0.0450212, 1, 0, 0.6117647, 1,
1.276232, -1.668358, 2.145448, 1, 0, 0.6078432, 1,
1.278527, 1.983472, 0.8477101, 1, 0, 0.6, 1,
1.285349, 1.043996, -0.8970118, 1, 0, 0.5921569, 1,
1.286561, -1.091296, 1.738487, 1, 0, 0.5882353, 1,
1.288641, -0.3684914, 0.8999029, 1, 0, 0.5803922, 1,
1.295187, 2.441783, 1.602158, 1, 0, 0.5764706, 1,
1.296866, -1.512651, 1.903384, 1, 0, 0.5686275, 1,
1.310964, 0.3579294, 0.9765152, 1, 0, 0.5647059, 1,
1.312134, 1.475153, 0.5136632, 1, 0, 0.5568628, 1,
1.313299, 0.6604893, 1.233603, 1, 0, 0.5529412, 1,
1.317238, -0.847762, 1.828491, 1, 0, 0.5450981, 1,
1.322486, -0.7138715, -0.4453399, 1, 0, 0.5411765, 1,
1.326431, -0.3445175, 2.190771, 1, 0, 0.5333334, 1,
1.332362, 0.7593918, -0.7678288, 1, 0, 0.5294118, 1,
1.334517, 1.35237, -0.5103097, 1, 0, 0.5215687, 1,
1.347295, -0.5068787, 1.71052, 1, 0, 0.5176471, 1,
1.349256, 0.6392201, 0.9226493, 1, 0, 0.509804, 1,
1.351605, 1.378682, 0.9358972, 1, 0, 0.5058824, 1,
1.360152, 0.4094673, -0.0307399, 1, 0, 0.4980392, 1,
1.362613, 0.8482953, 1.388536, 1, 0, 0.4901961, 1,
1.362746, -0.4027411, 0.6007976, 1, 0, 0.4862745, 1,
1.365892, 0.184466, 1.287428, 1, 0, 0.4784314, 1,
1.367566, 1.050434, 1.065529, 1, 0, 0.4745098, 1,
1.387311, 0.1898893, 1.9527, 1, 0, 0.4666667, 1,
1.388216, 0.405029, 3.154907, 1, 0, 0.4627451, 1,
1.402309, 1.069227, 1.056926, 1, 0, 0.454902, 1,
1.403725, 0.3532622, 0.8994553, 1, 0, 0.4509804, 1,
1.40876, -0.8763221, 2.32238, 1, 0, 0.4431373, 1,
1.426228, 2.484042, -0.002632703, 1, 0, 0.4392157, 1,
1.429613, 0.5649141, 0.7903216, 1, 0, 0.4313726, 1,
1.431221, -0.187169, 2.625846, 1, 0, 0.427451, 1,
1.434269, 0.1082137, 1.819358, 1, 0, 0.4196078, 1,
1.444144, -0.4454866, 1.085048, 1, 0, 0.4156863, 1,
1.467549, 0.1544875, 2.400061, 1, 0, 0.4078431, 1,
1.468395, 0.6058158, 0.7811106, 1, 0, 0.4039216, 1,
1.489433, -0.9001388, 2.546072, 1, 0, 0.3960784, 1,
1.498715, -0.3657736, 0.8051134, 1, 0, 0.3882353, 1,
1.511595, -0.5479417, 3.559006, 1, 0, 0.3843137, 1,
1.514394, -1.698648, 4.031769, 1, 0, 0.3764706, 1,
1.518608, -1.729445, 1.207517, 1, 0, 0.372549, 1,
1.520334, -1.051461, 2.171146, 1, 0, 0.3647059, 1,
1.548597, -0.1420983, 1.085264, 1, 0, 0.3607843, 1,
1.549877, 0.2523564, 1.682179, 1, 0, 0.3529412, 1,
1.576103, -0.5247575, 2.757959, 1, 0, 0.3490196, 1,
1.577559, -0.4158299, 1.649766, 1, 0, 0.3411765, 1,
1.577911, -2.050182, 2.497413, 1, 0, 0.3372549, 1,
1.581157, -0.578061, 2.890985, 1, 0, 0.3294118, 1,
1.593679, 0.0002914405, 3.088422, 1, 0, 0.3254902, 1,
1.594379, 0.6141287, 1.769863, 1, 0, 0.3176471, 1,
1.600744, 0.7780744, 2.201549, 1, 0, 0.3137255, 1,
1.606122, 1.971337, 0.6086642, 1, 0, 0.3058824, 1,
1.623962, 0.007396723, 2.096661, 1, 0, 0.2980392, 1,
1.637264, -0.5106127, 1.575842, 1, 0, 0.2941177, 1,
1.64081, -0.4005684, 1.552887, 1, 0, 0.2862745, 1,
1.686243, 0.5421843, 1.980251, 1, 0, 0.282353, 1,
1.688163, 1.070607, -0.1322885, 1, 0, 0.2745098, 1,
1.693227, 1.988088, 0.5484462, 1, 0, 0.2705882, 1,
1.695111, 0.7292759, 1.137829, 1, 0, 0.2627451, 1,
1.698252, -0.220827, 2.509529, 1, 0, 0.2588235, 1,
1.703115, -0.6079566, 2.565412, 1, 0, 0.2509804, 1,
1.706719, -0.2042339, 1.040384, 1, 0, 0.2470588, 1,
1.7069, 1.400827, 1.863316, 1, 0, 0.2392157, 1,
1.709647, -1.347342, 2.170765, 1, 0, 0.2352941, 1,
1.725652, -0.2098779, 0.9240167, 1, 0, 0.227451, 1,
1.728759, 0.3920111, 1.861724, 1, 0, 0.2235294, 1,
1.733605, 0.7551416, 1.237988, 1, 0, 0.2156863, 1,
1.775611, 0.9833394, -0.9228784, 1, 0, 0.2117647, 1,
1.776807, 1.192573, 0.4985476, 1, 0, 0.2039216, 1,
1.789411, -0.8959584, 1.274032, 1, 0, 0.1960784, 1,
1.826145, -0.1333337, 2.304099, 1, 0, 0.1921569, 1,
1.837848, 0.7333768, 0.1068462, 1, 0, 0.1843137, 1,
1.838003, -1.002425, 2.087154, 1, 0, 0.1803922, 1,
1.845807, -1.317361, 2.062459, 1, 0, 0.172549, 1,
1.865246, 0.0668054, 0.7071185, 1, 0, 0.1686275, 1,
1.870045, -0.7341746, 2.682793, 1, 0, 0.1607843, 1,
1.876192, -0.2315767, -0.01911134, 1, 0, 0.1568628, 1,
1.877351, 0.5756385, 1.253436, 1, 0, 0.1490196, 1,
1.902321, 0.03146756, 2.933381, 1, 0, 0.145098, 1,
1.916679, -0.173569, 2.590907, 1, 0, 0.1372549, 1,
1.923944, 1.416201, 1.271366, 1, 0, 0.1333333, 1,
1.934177, -0.1850929, 2.081933, 1, 0, 0.1254902, 1,
1.949561, -0.307588, 1.449886, 1, 0, 0.1215686, 1,
1.952338, 0.1251648, 1.025019, 1, 0, 0.1137255, 1,
2.00155, 0.7484239, 0.08287279, 1, 0, 0.1098039, 1,
2.021229, -0.9357853, 2.425834, 1, 0, 0.1019608, 1,
2.083308, 0.04059878, -1.400258, 1, 0, 0.09411765, 1,
2.097307, -1.250551, 1.913987, 1, 0, 0.09019608, 1,
2.119003, -1.797919, 1.035975, 1, 0, 0.08235294, 1,
2.141491, 0.4123743, 1.595138, 1, 0, 0.07843138, 1,
2.144197, -0.3663079, 1.672728, 1, 0, 0.07058824, 1,
2.160514, -0.5168453, 2.7235, 1, 0, 0.06666667, 1,
2.225045, 1.363551, 1.464066, 1, 0, 0.05882353, 1,
2.250949, 0.2024744, 1.288843, 1, 0, 0.05490196, 1,
2.286706, -0.8660555, 2.299356, 1, 0, 0.04705882, 1,
2.28917, 1.174541, 1.166673, 1, 0, 0.04313726, 1,
2.554499, 0.7772647, 2.222891, 1, 0, 0.03529412, 1,
2.614339, 0.3546716, 1.28708, 1, 0, 0.03137255, 1,
2.62872, -1.079226, 2.313638, 1, 0, 0.02352941, 1,
2.636533, -0.6337107, 2.434159, 1, 0, 0.01960784, 1,
2.660178, -0.4100965, 1.472901, 1, 0, 0.01176471, 1,
2.699081, -0.153389, 0.9981575, 1, 0, 0.007843138, 1
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
-0.3891464, -4.263341, -6.912965, 0, -0.5, 0.5, 0.5,
-0.3891464, -4.263341, -6.912965, 1, -0.5, 0.5, 0.5,
-0.3891464, -4.263341, -6.912965, 1, 1.5, 0.5, 0.5,
-0.3891464, -4.263341, -6.912965, 0, 1.5, 0.5, 0.5
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
-4.524283, -0.2316071, -6.912965, 0, -0.5, 0.5, 0.5,
-4.524283, -0.2316071, -6.912965, 1, -0.5, 0.5, 0.5,
-4.524283, -0.2316071, -6.912965, 1, 1.5, 0.5, 0.5,
-4.524283, -0.2316071, -6.912965, 0, 1.5, 0.5, 0.5
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
-4.524283, -4.263341, 0.07271934, 0, -0.5, 0.5, 0.5,
-4.524283, -4.263341, 0.07271934, 1, -0.5, 0.5, 0.5,
-4.524283, -4.263341, 0.07271934, 1, 1.5, 0.5, 0.5,
-4.524283, -4.263341, 0.07271934, 0, 1.5, 0.5, 0.5
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
-3, -3.332941, -5.300884,
2, -3.332941, -5.300884,
-3, -3.332941, -5.300884,
-3, -3.488008, -5.569564,
-2, -3.332941, -5.300884,
-2, -3.488008, -5.569564,
-1, -3.332941, -5.300884,
-1, -3.488008, -5.569564,
0, -3.332941, -5.300884,
0, -3.488008, -5.569564,
1, -3.332941, -5.300884,
1, -3.488008, -5.569564,
2, -3.332941, -5.300884,
2, -3.488008, -5.569564
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
-3, -3.798141, -6.106925, 0, -0.5, 0.5, 0.5,
-3, -3.798141, -6.106925, 1, -0.5, 0.5, 0.5,
-3, -3.798141, -6.106925, 1, 1.5, 0.5, 0.5,
-3, -3.798141, -6.106925, 0, 1.5, 0.5, 0.5,
-2, -3.798141, -6.106925, 0, -0.5, 0.5, 0.5,
-2, -3.798141, -6.106925, 1, -0.5, 0.5, 0.5,
-2, -3.798141, -6.106925, 1, 1.5, 0.5, 0.5,
-2, -3.798141, -6.106925, 0, 1.5, 0.5, 0.5,
-1, -3.798141, -6.106925, 0, -0.5, 0.5, 0.5,
-1, -3.798141, -6.106925, 1, -0.5, 0.5, 0.5,
-1, -3.798141, -6.106925, 1, 1.5, 0.5, 0.5,
-1, -3.798141, -6.106925, 0, 1.5, 0.5, 0.5,
0, -3.798141, -6.106925, 0, -0.5, 0.5, 0.5,
0, -3.798141, -6.106925, 1, -0.5, 0.5, 0.5,
0, -3.798141, -6.106925, 1, 1.5, 0.5, 0.5,
0, -3.798141, -6.106925, 0, 1.5, 0.5, 0.5,
1, -3.798141, -6.106925, 0, -0.5, 0.5, 0.5,
1, -3.798141, -6.106925, 1, -0.5, 0.5, 0.5,
1, -3.798141, -6.106925, 1, 1.5, 0.5, 0.5,
1, -3.798141, -6.106925, 0, 1.5, 0.5, 0.5,
2, -3.798141, -6.106925, 0, -0.5, 0.5, 0.5,
2, -3.798141, -6.106925, 1, -0.5, 0.5, 0.5,
2, -3.798141, -6.106925, 1, 1.5, 0.5, 0.5,
2, -3.798141, -6.106925, 0, 1.5, 0.5, 0.5
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
-3.570021, -3, -5.300884,
-3.570021, 2, -5.300884,
-3.570021, -3, -5.300884,
-3.729065, -3, -5.569564,
-3.570021, -2, -5.300884,
-3.729065, -2, -5.569564,
-3.570021, -1, -5.300884,
-3.729065, -1, -5.569564,
-3.570021, 0, -5.300884,
-3.729065, 0, -5.569564,
-3.570021, 1, -5.300884,
-3.729065, 1, -5.569564,
-3.570021, 2, -5.300884,
-3.729065, 2, -5.569564
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
-4.047153, -3, -6.106925, 0, -0.5, 0.5, 0.5,
-4.047153, -3, -6.106925, 1, -0.5, 0.5, 0.5,
-4.047153, -3, -6.106925, 1, 1.5, 0.5, 0.5,
-4.047153, -3, -6.106925, 0, 1.5, 0.5, 0.5,
-4.047153, -2, -6.106925, 0, -0.5, 0.5, 0.5,
-4.047153, -2, -6.106925, 1, -0.5, 0.5, 0.5,
-4.047153, -2, -6.106925, 1, 1.5, 0.5, 0.5,
-4.047153, -2, -6.106925, 0, 1.5, 0.5, 0.5,
-4.047153, -1, -6.106925, 0, -0.5, 0.5, 0.5,
-4.047153, -1, -6.106925, 1, -0.5, 0.5, 0.5,
-4.047153, -1, -6.106925, 1, 1.5, 0.5, 0.5,
-4.047153, -1, -6.106925, 0, 1.5, 0.5, 0.5,
-4.047153, 0, -6.106925, 0, -0.5, 0.5, 0.5,
-4.047153, 0, -6.106925, 1, -0.5, 0.5, 0.5,
-4.047153, 0, -6.106925, 1, 1.5, 0.5, 0.5,
-4.047153, 0, -6.106925, 0, 1.5, 0.5, 0.5,
-4.047153, 1, -6.106925, 0, -0.5, 0.5, 0.5,
-4.047153, 1, -6.106925, 1, -0.5, 0.5, 0.5,
-4.047153, 1, -6.106925, 1, 1.5, 0.5, 0.5,
-4.047153, 1, -6.106925, 0, 1.5, 0.5, 0.5,
-4.047153, 2, -6.106925, 0, -0.5, 0.5, 0.5,
-4.047153, 2, -6.106925, 1, -0.5, 0.5, 0.5,
-4.047153, 2, -6.106925, 1, 1.5, 0.5, 0.5,
-4.047153, 2, -6.106925, 0, 1.5, 0.5, 0.5
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
-3.570021, -3.332941, -4,
-3.570021, -3.332941, 4,
-3.570021, -3.332941, -4,
-3.729065, -3.488008, -4,
-3.570021, -3.332941, -2,
-3.729065, -3.488008, -2,
-3.570021, -3.332941, 0,
-3.729065, -3.488008, 0,
-3.570021, -3.332941, 2,
-3.729065, -3.488008, 2,
-3.570021, -3.332941, 4,
-3.729065, -3.488008, 4
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
-4.047153, -3.798141, -4, 0, -0.5, 0.5, 0.5,
-4.047153, -3.798141, -4, 1, -0.5, 0.5, 0.5,
-4.047153, -3.798141, -4, 1, 1.5, 0.5, 0.5,
-4.047153, -3.798141, -4, 0, 1.5, 0.5, 0.5,
-4.047153, -3.798141, -2, 0, -0.5, 0.5, 0.5,
-4.047153, -3.798141, -2, 1, -0.5, 0.5, 0.5,
-4.047153, -3.798141, -2, 1, 1.5, 0.5, 0.5,
-4.047153, -3.798141, -2, 0, 1.5, 0.5, 0.5,
-4.047153, -3.798141, 0, 0, -0.5, 0.5, 0.5,
-4.047153, -3.798141, 0, 1, -0.5, 0.5, 0.5,
-4.047153, -3.798141, 0, 1, 1.5, 0.5, 0.5,
-4.047153, -3.798141, 0, 0, 1.5, 0.5, 0.5,
-4.047153, -3.798141, 2, 0, -0.5, 0.5, 0.5,
-4.047153, -3.798141, 2, 1, -0.5, 0.5, 0.5,
-4.047153, -3.798141, 2, 1, 1.5, 0.5, 0.5,
-4.047153, -3.798141, 2, 0, 1.5, 0.5, 0.5,
-4.047153, -3.798141, 4, 0, -0.5, 0.5, 0.5,
-4.047153, -3.798141, 4, 1, -0.5, 0.5, 0.5,
-4.047153, -3.798141, 4, 1, 1.5, 0.5, 0.5,
-4.047153, -3.798141, 4, 0, 1.5, 0.5, 0.5
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
-3.570021, -3.332941, -5.300884,
-3.570021, 2.869727, -5.300884,
-3.570021, -3.332941, 5.446323,
-3.570021, 2.869727, 5.446323,
-3.570021, -3.332941, -5.300884,
-3.570021, -3.332941, 5.446323,
-3.570021, 2.869727, -5.300884,
-3.570021, 2.869727, 5.446323,
-3.570021, -3.332941, -5.300884,
2.791728, -3.332941, -5.300884,
-3.570021, -3.332941, 5.446323,
2.791728, -3.332941, 5.446323,
-3.570021, 2.869727, -5.300884,
2.791728, 2.869727, -5.300884,
-3.570021, 2.869727, 5.446323,
2.791728, 2.869727, 5.446323,
2.791728, -3.332941, -5.300884,
2.791728, 2.869727, -5.300884,
2.791728, -3.332941, 5.446323,
2.791728, 2.869727, 5.446323,
2.791728, -3.332941, -5.300884,
2.791728, -3.332941, 5.446323,
2.791728, 2.869727, -5.300884,
2.791728, 2.869727, 5.446323
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
var radius = 7.44606;
var distance = 33.12836;
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
mvMatrix.translate( 0.3891464, 0.2316071, -0.07271934 );
mvMatrix.scale( 1.265505, 1.297962, 0.7491087 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.12836);
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
atrazine<-read.table("atrazine.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-atrazine$V2
```

```
## Error in eval(expr, envir, enclos): object 'atrazine' not found
```

```r
y<-atrazine$V3
```

```
## Error in eval(expr, envir, enclos): object 'atrazine' not found
```

```r
z<-atrazine$V4
```

```
## Error in eval(expr, envir, enclos): object 'atrazine' not found
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
-3.477374, -0.1947789, -1.359164, 0, 0, 1, 1, 1,
-2.777313, 0.4757414, -2.992376, 1, 0, 0, 1, 1,
-2.746114, -0.2779559, -1.027009, 1, 0, 0, 1, 1,
-2.632729, -0.7430437, -1.576452, 1, 0, 0, 1, 1,
-2.600945, -1.175553, -2.99162, 1, 0, 0, 1, 1,
-2.377784, -0.5082231, -1.026117, 1, 0, 0, 1, 1,
-2.364579, -0.5404291, -2.152764, 0, 0, 0, 1, 1,
-2.355159, -0.08709232, -1.252123, 0, 0, 0, 1, 1,
-2.326452, 1.432437, -0.1294874, 0, 0, 0, 1, 1,
-2.278649, 0.1745345, -3.469172, 0, 0, 0, 1, 1,
-2.251726, 0.3265082, -1.301176, 0, 0, 0, 1, 1,
-2.219298, 0.0054952, 0.8230848, 0, 0, 0, 1, 1,
-2.206738, 0.9555411, -0.7147595, 0, 0, 0, 1, 1,
-2.20156, -0.7626761, -1.781766, 1, 1, 1, 1, 1,
-2.163933, 1.319894, -0.1941452, 1, 1, 1, 1, 1,
-2.103831, 0.7142057, -2.14936, 1, 1, 1, 1, 1,
-2.087713, -1.428007, -1.0821, 1, 1, 1, 1, 1,
-2.067854, -0.5254099, -1.20494, 1, 1, 1, 1, 1,
-2.051251, -0.8958241, -2.448166, 1, 1, 1, 1, 1,
-2.038244, 1.284211, -0.9556318, 1, 1, 1, 1, 1,
-2.0052, -2.547971, -2.614649, 1, 1, 1, 1, 1,
-1.996338, -0.9712771, -1.998158, 1, 1, 1, 1, 1,
-1.994523, -0.1475329, -2.674786, 1, 1, 1, 1, 1,
-1.968414, -0.4051177, 1.162109, 1, 1, 1, 1, 1,
-1.952574, 1.341972, -1.150493, 1, 1, 1, 1, 1,
-1.951973, -0.4744191, -0.3852468, 1, 1, 1, 1, 1,
-1.946726, 0.9276746, -0.05033936, 1, 1, 1, 1, 1,
-1.883365, -2.033166, -2.604244, 1, 1, 1, 1, 1,
-1.879133, -0.4325226, -3.273413, 0, 0, 1, 1, 1,
-1.852298, 1.112482, -0.476799, 1, 0, 0, 1, 1,
-1.840396, -0.02111237, -2.677012, 1, 0, 0, 1, 1,
-1.830268, -0.5526117, -2.668428, 1, 0, 0, 1, 1,
-1.828163, 0.1311838, 0.9673642, 1, 0, 0, 1, 1,
-1.826461, -0.6794742, -1.369707, 1, 0, 0, 1, 1,
-1.813211, 0.9938284, -1.038034, 0, 0, 0, 1, 1,
-1.791853, -1.299477, -2.509972, 0, 0, 0, 1, 1,
-1.790947, -0.6820043, -0.03786556, 0, 0, 0, 1, 1,
-1.783799, -0.6684267, -0.6449587, 0, 0, 0, 1, 1,
-1.747777, 0.4237891, -1.03208, 0, 0, 0, 1, 1,
-1.747323, 0.2033059, -2.774016, 0, 0, 0, 1, 1,
-1.72078, 1.123646, -1.651935, 0, 0, 0, 1, 1,
-1.700437, 0.5383259, -1.255156, 1, 1, 1, 1, 1,
-1.699275, 1.131826, 1.132229, 1, 1, 1, 1, 1,
-1.672632, -1.326003, -0.9953303, 1, 1, 1, 1, 1,
-1.659771, -2.402562, -4.02492, 1, 1, 1, 1, 1,
-1.653922, 0.7205792, -1.975419, 1, 1, 1, 1, 1,
-1.651306, 0.8367003, -1.485176, 1, 1, 1, 1, 1,
-1.646457, -1.174036, -0.7594409, 1, 1, 1, 1, 1,
-1.629318, -2.563188, -1.507535, 1, 1, 1, 1, 1,
-1.626281, -0.02264019, -1.601155, 1, 1, 1, 1, 1,
-1.625341, -0.3890578, -0.8827205, 1, 1, 1, 1, 1,
-1.617702, -0.2243912, 0.1421139, 1, 1, 1, 1, 1,
-1.592521, -0.6700966, -2.316026, 1, 1, 1, 1, 1,
-1.576949, -0.6318862, -1.589156, 1, 1, 1, 1, 1,
-1.567545, -0.4498952, 0.4665809, 1, 1, 1, 1, 1,
-1.562267, 1.009487, -1.059587, 1, 1, 1, 1, 1,
-1.55741, 0.7867714, -0.4189971, 0, 0, 1, 1, 1,
-1.554101, 0.2415818, 0.8464002, 1, 0, 0, 1, 1,
-1.547261, 0.3277256, -2.576426, 1, 0, 0, 1, 1,
-1.543237, 0.1514978, -0.3834376, 1, 0, 0, 1, 1,
-1.540036, -1.203866, -2.898322, 1, 0, 0, 1, 1,
-1.528877, -0.7727452, -0.9733464, 1, 0, 0, 1, 1,
-1.527499, -0.184724, -0.6129055, 0, 0, 0, 1, 1,
-1.526167, 2.005342, -1.110904, 0, 0, 0, 1, 1,
-1.51207, -0.8419625, -0.8095041, 0, 0, 0, 1, 1,
-1.504825, 1.226165, 0.1864355, 0, 0, 0, 1, 1,
-1.492018, 0.04516012, -2.782145, 0, 0, 0, 1, 1,
-1.48219, 0.1025417, -1.008784, 0, 0, 0, 1, 1,
-1.47665, 0.5432019, -1.83756, 0, 0, 0, 1, 1,
-1.463061, -0.0235215, -2.228138, 1, 1, 1, 1, 1,
-1.46166, 1.272887, 1.290236, 1, 1, 1, 1, 1,
-1.456176, 1.713779, -1.179526, 1, 1, 1, 1, 1,
-1.455969, 0.4458244, -0.1062933, 1, 1, 1, 1, 1,
-1.453311, 1.167138, 0.5773972, 1, 1, 1, 1, 1,
-1.43799, -1.401808, -1.308305, 1, 1, 1, 1, 1,
-1.424213, -0.6697057, -1.569005, 1, 1, 1, 1, 1,
-1.419295, -1.8202, -2.231144, 1, 1, 1, 1, 1,
-1.414356, 1.267245, -0.01764168, 1, 1, 1, 1, 1,
-1.404985, -0.008721017, -0.3637861, 1, 1, 1, 1, 1,
-1.399525, -0.5788626, -1.236892, 1, 1, 1, 1, 1,
-1.388159, -0.2400347, -1.497259, 1, 1, 1, 1, 1,
-1.359444, 0.8877916, -0.8325608, 1, 1, 1, 1, 1,
-1.352064, -0.9537805, -1.720555, 1, 1, 1, 1, 1,
-1.338891, -0.434596, -1.919399, 1, 1, 1, 1, 1,
-1.326511, -0.2641675, -1.007468, 0, 0, 1, 1, 1,
-1.324007, 0.9752851, -0.6107019, 1, 0, 0, 1, 1,
-1.323272, 1.024884, -0.6969832, 1, 0, 0, 1, 1,
-1.309505, 0.2075999, -2.206414, 1, 0, 0, 1, 1,
-1.306317, -2.825735, -3.072949, 1, 0, 0, 1, 1,
-1.305565, 1.109871, -0.9031616, 1, 0, 0, 1, 1,
-1.30509, -0.2271969, -1.37434, 0, 0, 0, 1, 1,
-1.304898, 0.2250375, -3.321177, 0, 0, 0, 1, 1,
-1.295707, 0.8167339, -1.060881, 0, 0, 0, 1, 1,
-1.291297, 0.1517885, -2.314981, 0, 0, 0, 1, 1,
-1.274053, 0.2324029, -1.889315, 0, 0, 0, 1, 1,
-1.268079, -0.4331791, -1.171263, 0, 0, 0, 1, 1,
-1.265161, -0.7132261, -2.055888, 0, 0, 0, 1, 1,
-1.256345, -0.2951341, -1.989147, 1, 1, 1, 1, 1,
-1.255248, 0.0978454, -0.7903977, 1, 1, 1, 1, 1,
-1.25062, 0.2886407, -1.239648, 1, 1, 1, 1, 1,
-1.244109, 0.03998954, -2.826227, 1, 1, 1, 1, 1,
-1.240361, 0.2001098, -0.9430566, 1, 1, 1, 1, 1,
-1.229954, -0.4145031, -2.69298, 1, 1, 1, 1, 1,
-1.223966, -2.272627, -1.878697, 1, 1, 1, 1, 1,
-1.2217, 0.004334419, -1.013048, 1, 1, 1, 1, 1,
-1.21853, -0.001345541, -1.321087, 1, 1, 1, 1, 1,
-1.214427, 0.1651773, -2.266402, 1, 1, 1, 1, 1,
-1.206081, -0.9671796, -1.652458, 1, 1, 1, 1, 1,
-1.204316, 1.877427, -0.890925, 1, 1, 1, 1, 1,
-1.192258, 0.01279312, -1.074343, 1, 1, 1, 1, 1,
-1.183393, -0.002504496, -1.182727, 1, 1, 1, 1, 1,
-1.181802, -0.3214958, -3.055959, 1, 1, 1, 1, 1,
-1.180893, 1.184533, -0.7158988, 0, 0, 1, 1, 1,
-1.175991, 0.2038635, -0.3756844, 1, 0, 0, 1, 1,
-1.172416, 0.457798, -0.7115396, 1, 0, 0, 1, 1,
-1.170747, 0.1413672, -0.7948316, 1, 0, 0, 1, 1,
-1.168468, -0.1683455, 0.563892, 1, 0, 0, 1, 1,
-1.165086, -1.19619, -2.07923, 1, 0, 0, 1, 1,
-1.154514, -0.08136347, -0.3983079, 0, 0, 0, 1, 1,
-1.141787, -0.4525151, -1.93667, 0, 0, 0, 1, 1,
-1.139551, 0.5115444, 0.2230837, 0, 0, 0, 1, 1,
-1.13624, 0.4610535, -0.6992962, 0, 0, 0, 1, 1,
-1.131842, 0.2273698, -2.03655, 0, 0, 0, 1, 1,
-1.126942, -1.485587, -2.105085, 0, 0, 0, 1, 1,
-1.124746, 1.528532, 0.7036406, 0, 0, 0, 1, 1,
-1.117763, 1.960972, -1.572235, 1, 1, 1, 1, 1,
-1.116743, 0.6377659, -1.190537, 1, 1, 1, 1, 1,
-1.11639, 1.47285, -0.6471009, 1, 1, 1, 1, 1,
-1.108446, 0.4768957, -0.5978426, 1, 1, 1, 1, 1,
-1.108161, -0.3009208, -3.020949, 1, 1, 1, 1, 1,
-1.104235, 1.721299, -1.61816, 1, 1, 1, 1, 1,
-1.098766, -0.1271711, -3.10877, 1, 1, 1, 1, 1,
-1.097619, 0.3510673, -2.28284, 1, 1, 1, 1, 1,
-1.091253, -1.631985, -2.939233, 1, 1, 1, 1, 1,
-1.088982, 0.8578864, -0.388776, 1, 1, 1, 1, 1,
-1.087813, -0.774403, -2.8253, 1, 1, 1, 1, 1,
-1.071864, -0.4726122, -1.117694, 1, 1, 1, 1, 1,
-1.071506, 1.463423, -0.7659461, 1, 1, 1, 1, 1,
-1.067529, -0.7409524, -4.4899, 1, 1, 1, 1, 1,
-1.056811, 0.2802636, 0.2535333, 1, 1, 1, 1, 1,
-1.054428, -0.4542436, -3.45663, 0, 0, 1, 1, 1,
-1.041059, 0.7242038, 0.6642447, 1, 0, 0, 1, 1,
-1.037314, -1.353392, -3.06919, 1, 0, 0, 1, 1,
-1.03586, -0.8227826, -1.11765, 1, 0, 0, 1, 1,
-1.033174, -0.2975062, -1.830644, 1, 0, 0, 1, 1,
-1.022361, 0.4355689, 0.520318, 1, 0, 0, 1, 1,
-1.022323, -1.13961, -2.858414, 0, 0, 0, 1, 1,
-1.022238, 0.8596585, -0.6589072, 0, 0, 0, 1, 1,
-1.020879, 1.102341, 1.440891, 0, 0, 0, 1, 1,
-1.018265, 1.138252, -0.8969082, 0, 0, 0, 1, 1,
-1.00238, -0.5992256, -2.811624, 0, 0, 0, 1, 1,
-1.000765, 0.4401844, -1.080722, 0, 0, 0, 1, 1,
-1.000406, 0.0008809855, -2.164905, 0, 0, 0, 1, 1,
-1.000326, 0.7267144, -1.9063, 1, 1, 1, 1, 1,
-0.9973223, -1.308285, -2.40512, 1, 1, 1, 1, 1,
-0.9853133, 0.06014057, -2.412117, 1, 1, 1, 1, 1,
-0.9839404, -0.3733565, -0.4025621, 1, 1, 1, 1, 1,
-0.9820787, -0.8511547, -1.772037, 1, 1, 1, 1, 1,
-0.9798983, 0.1610884, -1.850694, 1, 1, 1, 1, 1,
-0.9736856, 0.05036219, 0.03413681, 1, 1, 1, 1, 1,
-0.9725052, -1.270547, -0.2195159, 1, 1, 1, 1, 1,
-0.9722368, -1.478907, -0.8305278, 1, 1, 1, 1, 1,
-0.9715351, 2.779397, -0.09312932, 1, 1, 1, 1, 1,
-0.9698104, 1.408554, -0.9407506, 1, 1, 1, 1, 1,
-0.9693355, -0.4682675, -1.716109, 1, 1, 1, 1, 1,
-0.9690903, -0.04669519, -2.29435, 1, 1, 1, 1, 1,
-0.9620318, 1.160508, -1.451462, 1, 1, 1, 1, 1,
-0.9618441, 0.5437105, -1.156007, 1, 1, 1, 1, 1,
-0.9613562, 1.445434, -1.756154, 0, 0, 1, 1, 1,
-0.9526458, 0.3606322, -0.52452, 1, 0, 0, 1, 1,
-0.9468833, -0.8717324, -2.63432, 1, 0, 0, 1, 1,
-0.9430282, -1.785883, -3.921383, 1, 0, 0, 1, 1,
-0.9426225, 0.3269992, -0.2194239, 1, 0, 0, 1, 1,
-0.9426165, 0.1772378, -1.404246, 1, 0, 0, 1, 1,
-0.9327303, 0.1311356, -0.6012286, 0, 0, 0, 1, 1,
-0.9327078, 0.9557711, -0.8113297, 0, 0, 0, 1, 1,
-0.9322587, 0.6945029, -1.222555, 0, 0, 0, 1, 1,
-0.92492, 0.7308696, -1.962213, 0, 0, 0, 1, 1,
-0.922505, -0.6300256, -3.821651, 0, 0, 0, 1, 1,
-0.9221811, -1.878557, -2.38389, 0, 0, 0, 1, 1,
-0.918073, -1.1105, -1.34727, 0, 0, 0, 1, 1,
-0.9130782, 0.01103644, -2.956346, 1, 1, 1, 1, 1,
-0.9054159, -0.4005643, -0.5973062, 1, 1, 1, 1, 1,
-0.8987319, -0.6537804, -2.101691, 1, 1, 1, 1, 1,
-0.8944144, -0.2195361, -2.388291, 1, 1, 1, 1, 1,
-0.8916553, -0.4841624, -2.269473, 1, 1, 1, 1, 1,
-0.8876461, -0.3514425, -2.223918, 1, 1, 1, 1, 1,
-0.8825904, 0.7105594, -0.1909673, 1, 1, 1, 1, 1,
-0.8762393, -0.225742, -1.058663, 1, 1, 1, 1, 1,
-0.868508, 0.06258146, -1.980833, 1, 1, 1, 1, 1,
-0.8463128, 1.761532, 0.03703809, 1, 1, 1, 1, 1,
-0.8460005, 0.3975906, -0.3896527, 1, 1, 1, 1, 1,
-0.8427424, 0.434426, -1.757514, 1, 1, 1, 1, 1,
-0.8426843, 0.4539041, -1.755632, 1, 1, 1, 1, 1,
-0.84203, -1.132565, -0.5037005, 1, 1, 1, 1, 1,
-0.835579, 0.1672668, -0.3215675, 1, 1, 1, 1, 1,
-0.8341847, -1.80493, -2.119513, 0, 0, 1, 1, 1,
-0.8337462, 1.462814, -1.237246, 1, 0, 0, 1, 1,
-0.8334236, -0.4899516, -2.518537, 1, 0, 0, 1, 1,
-0.8291073, 0.7156371, -1.338727, 1, 0, 0, 1, 1,
-0.826907, -0.05324313, 0.1859195, 1, 0, 0, 1, 1,
-0.8253871, -0.169098, -3.757798, 1, 0, 0, 1, 1,
-0.8252512, -1.29841, -1.215563, 0, 0, 0, 1, 1,
-0.8252023, -0.209153, -1.973134, 0, 0, 0, 1, 1,
-0.8233189, -0.7282965, -0.9395009, 0, 0, 0, 1, 1,
-0.8201965, -1.106812, -2.34873, 0, 0, 0, 1, 1,
-0.8094931, -0.5484377, -0.7689627, 0, 0, 0, 1, 1,
-0.8091605, 1.144128, -2.704608, 0, 0, 0, 1, 1,
-0.8087003, -0.3557758, -1.807587, 0, 0, 0, 1, 1,
-0.8082851, 0.3884496, -1.23129, 1, 1, 1, 1, 1,
-0.8074918, -0.2121177, -1.726559, 1, 1, 1, 1, 1,
-0.8069661, 0.02481218, -1.044527, 1, 1, 1, 1, 1,
-0.8038376, -0.364083, -2.415857, 1, 1, 1, 1, 1,
-0.7965803, -0.353348, -1.18838, 1, 1, 1, 1, 1,
-0.7934612, -0.1524591, -0.4815128, 1, 1, 1, 1, 1,
-0.7891465, 1.197577, 0.6749656, 1, 1, 1, 1, 1,
-0.7790901, -0.2853567, -1.59847, 1, 1, 1, 1, 1,
-0.7778186, 1.475472, 0.871314, 1, 1, 1, 1, 1,
-0.7767376, 0.5741147, -0.5055565, 1, 1, 1, 1, 1,
-0.7746495, -1.329435, -1.930011, 1, 1, 1, 1, 1,
-0.7689334, 0.6615821, 1.444698, 1, 1, 1, 1, 1,
-0.7678173, -0.4419307, -1.799887, 1, 1, 1, 1, 1,
-0.7678113, -2.26072, -4.79512, 1, 1, 1, 1, 1,
-0.7614081, -0.8935498, -1.642312, 1, 1, 1, 1, 1,
-0.7589551, -0.8819816, -3.087387, 0, 0, 1, 1, 1,
-0.7587356, 0.3653276, -1.519825, 1, 0, 0, 1, 1,
-0.7574999, -1.528736, -1.713791, 1, 0, 0, 1, 1,
-0.755353, -1.091098, -1.401757, 1, 0, 0, 1, 1,
-0.7513967, -0.8664569, -3.819008, 1, 0, 0, 1, 1,
-0.7509094, -0.3326746, -0.5882466, 1, 0, 0, 1, 1,
-0.7507468, -1.145017, -3.396894, 0, 0, 0, 1, 1,
-0.7492397, -0.2427484, -1.217711, 0, 0, 0, 1, 1,
-0.7478335, 1.634204, 0.5729855, 0, 0, 0, 1, 1,
-0.7428668, -0.7914247, -2.6248, 0, 0, 0, 1, 1,
-0.7396472, -0.4435224, -2.441025, 0, 0, 0, 1, 1,
-0.7296911, -1.320278, -2.817372, 0, 0, 0, 1, 1,
-0.7189852, 0.403953, -0.9136583, 0, 0, 0, 1, 1,
-0.7147917, -0.8593838, -2.331433, 1, 1, 1, 1, 1,
-0.7110665, 1.683999, -0.7256574, 1, 1, 1, 1, 1,
-0.7051291, 0.1100269, -2.333074, 1, 1, 1, 1, 1,
-0.7049984, 0.4854484, -1.86726, 1, 1, 1, 1, 1,
-0.7032647, 0.8328398, -1.093425, 1, 1, 1, 1, 1,
-0.6997863, -0.6641526, -2.515253, 1, 1, 1, 1, 1,
-0.6978068, -0.07427408, -0.947188, 1, 1, 1, 1, 1,
-0.6957567, 1.080324, -1.545578, 1, 1, 1, 1, 1,
-0.6937894, 0.4520564, 0.07397483, 1, 1, 1, 1, 1,
-0.6895118, -1.801373, -4.446215, 1, 1, 1, 1, 1,
-0.6862643, 0.674885, -0.6741415, 1, 1, 1, 1, 1,
-0.6849357, 0.08054637, -0.09421856, 1, 1, 1, 1, 1,
-0.6834323, -0.5274966, -3.441322, 1, 1, 1, 1, 1,
-0.6824073, -0.2318399, -0.9671022, 1, 1, 1, 1, 1,
-0.6808431, 0.6484367, -0.5189459, 1, 1, 1, 1, 1,
-0.6774774, 0.9929051, -0.2785596, 0, 0, 1, 1, 1,
-0.6695697, -0.3733093, -3.35225, 1, 0, 0, 1, 1,
-0.6693519, 0.481906, -0.6199461, 1, 0, 0, 1, 1,
-0.6681352, 2.024369, -0.191213, 1, 0, 0, 1, 1,
-0.6676207, -1.052443, -2.675736, 1, 0, 0, 1, 1,
-0.6667442, -0.3721017, -3.175966, 1, 0, 0, 1, 1,
-0.6597624, 0.1165341, -1.710578, 0, 0, 0, 1, 1,
-0.6580763, -0.2961651, -1.482325, 0, 0, 0, 1, 1,
-0.6576822, -0.3481351, -3.780344, 0, 0, 0, 1, 1,
-0.6566888, -1.099581, -3.765961, 0, 0, 0, 1, 1,
-0.6538308, -1.425145, -3.470347, 0, 0, 0, 1, 1,
-0.6511703, -1.3927, -1.792519, 0, 0, 0, 1, 1,
-0.6498123, -1.106368, -3.911774, 0, 0, 0, 1, 1,
-0.639468, -0.622992, -2.492069, 1, 1, 1, 1, 1,
-0.6387249, -0.139358, -2.323078, 1, 1, 1, 1, 1,
-0.635611, -1.380577, -2.801886, 1, 1, 1, 1, 1,
-0.6342272, -0.3943189, -1.738212, 1, 1, 1, 1, 1,
-0.6299191, -0.007924371, 0.5356374, 1, 1, 1, 1, 1,
-0.6282026, -0.4107834, -1.605315, 1, 1, 1, 1, 1,
-0.6281469, 0.6681252, -0.9119321, 1, 1, 1, 1, 1,
-0.619879, 1.072669, -0.05922467, 1, 1, 1, 1, 1,
-0.617837, -0.4050634, -2.726675, 1, 1, 1, 1, 1,
-0.6159819, -1.097276, -3.218289, 1, 1, 1, 1, 1,
-0.6102892, 2.254033, -0.4710343, 1, 1, 1, 1, 1,
-0.6030726, -1.850192, -4.120764, 1, 1, 1, 1, 1,
-0.6020817, 0.3927598, -1.759924, 1, 1, 1, 1, 1,
-0.5970899, 1.177177, 0.8363309, 1, 1, 1, 1, 1,
-0.593743, -0.3133719, -2.941566, 1, 1, 1, 1, 1,
-0.5936511, -0.0379152, -0.8089029, 0, 0, 1, 1, 1,
-0.5896294, -0.5454544, -2.154956, 1, 0, 0, 1, 1,
-0.5834598, 0.7458542, 0.5311204, 1, 0, 0, 1, 1,
-0.5729885, -0.7021505, -2.589128, 1, 0, 0, 1, 1,
-0.5702742, 0.1987828, -3.648102, 1, 0, 0, 1, 1,
-0.5695164, 0.7200633, -0.1731776, 1, 0, 0, 1, 1,
-0.5660004, 0.1950562, -1.280431, 0, 0, 0, 1, 1,
-0.564167, -1.052898, -2.804348, 0, 0, 0, 1, 1,
-0.5637712, -0.127939, -3.041884, 0, 0, 0, 1, 1,
-0.5634437, 0.7760631, -1.949705, 0, 0, 0, 1, 1,
-0.5607079, -0.107378, -1.823703, 0, 0, 0, 1, 1,
-0.5593171, -0.1421452, -1.165601, 0, 0, 0, 1, 1,
-0.558102, -0.7615188, 0.1179524, 0, 0, 0, 1, 1,
-0.554476, 1.115307, -1.739198, 1, 1, 1, 1, 1,
-0.5527238, 0.04443232, -2.371819, 1, 1, 1, 1, 1,
-0.5490233, 0.5338297, -0.6176842, 1, 1, 1, 1, 1,
-0.5466806, -0.6240797, -1.751115, 1, 1, 1, 1, 1,
-0.5418981, -2.305827, -2.365925, 1, 1, 1, 1, 1,
-0.5373214, -0.1010399, -2.735469, 1, 1, 1, 1, 1,
-0.5357788, -0.2642489, -1.934683, 1, 1, 1, 1, 1,
-0.5324261, 0.7221717, -0.6458596, 1, 1, 1, 1, 1,
-0.5264649, 1.043335, -1.582554, 1, 1, 1, 1, 1,
-0.5238827, 1.080353, 0.7897816, 1, 1, 1, 1, 1,
-0.5175101, 0.8291964, -0.7426874, 1, 1, 1, 1, 1,
-0.5154645, 0.2198181, -1.580062, 1, 1, 1, 1, 1,
-0.51342, -1.28453, -2.622842, 1, 1, 1, 1, 1,
-0.513225, 0.2844874, -2.134624, 1, 1, 1, 1, 1,
-0.512978, -1.306936, -2.963738, 1, 1, 1, 1, 1,
-0.5103874, 1.522122, 1.996456, 0, 0, 1, 1, 1,
-0.5083697, 0.0636548, -2.218805, 1, 0, 0, 1, 1,
-0.5083274, 0.2905864, -1.040921, 1, 0, 0, 1, 1,
-0.5073682, 1.163723, -0.3084822, 1, 0, 0, 1, 1,
-0.505569, 0.7148051, 0.01291261, 1, 0, 0, 1, 1,
-0.5043809, -0.8642464, -2.498788, 1, 0, 0, 1, 1,
-0.5034521, -1.67138, -2.40975, 0, 0, 0, 1, 1,
-0.494948, 1.339453, -0.1608339, 0, 0, 0, 1, 1,
-0.4940008, 1.215784, -0.3864228, 0, 0, 0, 1, 1,
-0.4911888, -2.064902, -2.639823, 0, 0, 0, 1, 1,
-0.4901093, 0.8221611, 0.4481079, 0, 0, 0, 1, 1,
-0.4873063, -1.347873, -3.436701, 0, 0, 0, 1, 1,
-0.4851923, 1.011543, -0.1504763, 0, 0, 0, 1, 1,
-0.4815818, 1.005653, 0.9052324, 1, 1, 1, 1, 1,
-0.4798788, 1.213718, -1.899937, 1, 1, 1, 1, 1,
-0.4784504, 0.7216653, -1.180834, 1, 1, 1, 1, 1,
-0.4784001, -0.5674847, -1.691458, 1, 1, 1, 1, 1,
-0.4782773, -1.063195, -4.436928, 1, 1, 1, 1, 1,
-0.4728691, -0.6123351, -2.639985, 1, 1, 1, 1, 1,
-0.4710284, -2.220587, -2.189146, 1, 1, 1, 1, 1,
-0.4668871, 0.8559787, -0.2975419, 1, 1, 1, 1, 1,
-0.4653175, 2.616488, -1.512277, 1, 1, 1, 1, 1,
-0.4558313, 0.6539689, -0.8024203, 1, 1, 1, 1, 1,
-0.4431058, 0.9446236, -0.3733644, 1, 1, 1, 1, 1,
-0.4429354, -0.6775321, -0.827618, 1, 1, 1, 1, 1,
-0.4390484, 1.300202, 0.9836195, 1, 1, 1, 1, 1,
-0.4382712, 0.3102252, 1.705117, 1, 1, 1, 1, 1,
-0.4361998, -1.565335, -1.755847, 1, 1, 1, 1, 1,
-0.4312664, -0.03185684, -1.320276, 0, 0, 1, 1, 1,
-0.4296115, 0.267331, 0.3796878, 1, 0, 0, 1, 1,
-0.4225981, -1.277373, -1.530562, 1, 0, 0, 1, 1,
-0.4201927, -1.129179, -1.658878, 1, 0, 0, 1, 1,
-0.4186557, 1.53652, -0.09388684, 1, 0, 0, 1, 1,
-0.4156582, -0.5889868, -1.463525, 1, 0, 0, 1, 1,
-0.4102353, -0.79693, -2.779842, 0, 0, 0, 1, 1,
-0.4078919, 0.7994435, 0.2420687, 0, 0, 0, 1, 1,
-0.4062676, 0.4008664, -0.2715228, 0, 0, 0, 1, 1,
-0.406192, -0.3237693, -3.13192, 0, 0, 0, 1, 1,
-0.4044213, -0.004399489, -0.4693859, 0, 0, 0, 1, 1,
-0.4038266, -0.923134, -1.375932, 0, 0, 0, 1, 1,
-0.4030774, -1.17229, -2.571139, 0, 0, 0, 1, 1,
-0.4024459, 0.2529564, -0.2473082, 1, 1, 1, 1, 1,
-0.4021668, 1.577808, 0.8076748, 1, 1, 1, 1, 1,
-0.4000409, -0.0346163, -1.437103, 1, 1, 1, 1, 1,
-0.3962171, -0.5005224, -2.788952, 1, 1, 1, 1, 1,
-0.3934851, -0.5770251, -3.346895, 1, 1, 1, 1, 1,
-0.3931149, -0.07678211, 0.5766658, 1, 1, 1, 1, 1,
-0.3890922, 2.04715, -0.6445532, 1, 1, 1, 1, 1,
-0.3843508, -0.3576365, -2.265342, 1, 1, 1, 1, 1,
-0.382214, 0.3167376, -0.4305171, 1, 1, 1, 1, 1,
-0.379986, -1.010072, -4.073939, 1, 1, 1, 1, 1,
-0.3792288, -0.003756758, -0.830897, 1, 1, 1, 1, 1,
-0.3749533, 1.047261, -2.9347, 1, 1, 1, 1, 1,
-0.3741352, -0.7725934, -2.534672, 1, 1, 1, 1, 1,
-0.3730035, -0.1459488, -3.274141, 1, 1, 1, 1, 1,
-0.3717418, 0.8420174, 1.280103, 1, 1, 1, 1, 1,
-0.364164, -0.6439832, -2.222932, 0, 0, 1, 1, 1,
-0.3638017, 0.3574515, -0.245942, 1, 0, 0, 1, 1,
-0.3633957, 1.731905, 0.4269169, 1, 0, 0, 1, 1,
-0.3622389, -0.1120287, -1.439907, 1, 0, 0, 1, 1,
-0.3620314, -0.5640696, -2.497316, 1, 0, 0, 1, 1,
-0.352469, 1.560449, -0.5886836, 1, 0, 0, 1, 1,
-0.3508311, -2.269832, -1.348448, 0, 0, 0, 1, 1,
-0.3506088, 0.7076869, -1.815992, 0, 0, 0, 1, 1,
-0.3494701, -0.7735815, -2.538967, 0, 0, 0, 1, 1,
-0.3475145, 0.299644, 0.01996327, 0, 0, 0, 1, 1,
-0.3457005, -0.5704626, -3.844398, 0, 0, 0, 1, 1,
-0.3419052, 0.2021947, -1.045489, 0, 0, 0, 1, 1,
-0.3391632, -1.512864, -3.601006, 0, 0, 0, 1, 1,
-0.3362443, -0.1264118, -1.21246, 1, 1, 1, 1, 1,
-0.3319261, 0.8768792, -0.3907196, 1, 1, 1, 1, 1,
-0.3287716, -0.256556, -1.937319, 1, 1, 1, 1, 1,
-0.3209185, 0.650473, -0.5225332, 1, 1, 1, 1, 1,
-0.3155155, 0.3689539, 0.5433238, 1, 1, 1, 1, 1,
-0.3151427, 0.9315091, -0.5174673, 1, 1, 1, 1, 1,
-0.3140046, 1.39599, -0.3228366, 1, 1, 1, 1, 1,
-0.3016454, -0.9650952, -3.902777, 1, 1, 1, 1, 1,
-0.2992169, -2.667622, -3.541469, 1, 1, 1, 1, 1,
-0.2985815, -0.830096, -2.313132, 1, 1, 1, 1, 1,
-0.2973633, -1.622536, -2.442867, 1, 1, 1, 1, 1,
-0.2925963, -0.5006206, -2.279067, 1, 1, 1, 1, 1,
-0.290052, -1.23187, -1.331455, 1, 1, 1, 1, 1,
-0.2884406, 1.655306, 1.428365, 1, 1, 1, 1, 1,
-0.2832687, 0.7146441, 0.2245596, 1, 1, 1, 1, 1,
-0.2819527, 0.953519, 0.2920033, 0, 0, 1, 1, 1,
-0.2773629, 1.406335, -0.9554275, 1, 0, 0, 1, 1,
-0.2756472, -0.4693301, -2.311424, 1, 0, 0, 1, 1,
-0.2719627, -0.5092383, -3.132699, 1, 0, 0, 1, 1,
-0.2664512, -1.557828, -5.144372, 1, 0, 0, 1, 1,
-0.2598571, -0.1133215, -1.424988, 1, 0, 0, 1, 1,
-0.2595235, 0.3342618, 1.914067, 0, 0, 0, 1, 1,
-0.2564451, -0.3870476, -3.593675, 0, 0, 0, 1, 1,
-0.2540016, 1.172365, -0.3468828, 0, 0, 0, 1, 1,
-0.2516021, -0.5035144, -2.219954, 0, 0, 0, 1, 1,
-0.249685, 1.153018, -1.163059, 0, 0, 0, 1, 1,
-0.2482502, -0.004058416, -0.6432994, 0, 0, 0, 1, 1,
-0.2465091, 0.09401591, -1.780795, 0, 0, 0, 1, 1,
-0.2460636, 1.769019, 1.704789, 1, 1, 1, 1, 1,
-0.2406533, 0.624219, 0.6094053, 1, 1, 1, 1, 1,
-0.2345184, -0.9061632, -3.525807, 1, 1, 1, 1, 1,
-0.2327467, -0.1541025, 0.8285021, 1, 1, 1, 1, 1,
-0.2288818, -1.385932, -3.239903, 1, 1, 1, 1, 1,
-0.2278428, -1.134517, -3.27849, 1, 1, 1, 1, 1,
-0.2276958, 0.302848, -1.413178, 1, 1, 1, 1, 1,
-0.2240766, 0.06793864, -2.100236, 1, 1, 1, 1, 1,
-0.2218551, -0.8866674, -0.3435856, 1, 1, 1, 1, 1,
-0.2191207, 1.478706, -0.8931527, 1, 1, 1, 1, 1,
-0.2186289, 1.039011, 0.05951723, 1, 1, 1, 1, 1,
-0.2178911, -0.88471, -3.276811, 1, 1, 1, 1, 1,
-0.213745, 0.6632333, -2.004934, 1, 1, 1, 1, 1,
-0.2124019, 1.882804, -0.6973554, 1, 1, 1, 1, 1,
-0.2116809, -0.1091352, -2.901725, 1, 1, 1, 1, 1,
-0.211629, -0.7322934, -2.158957, 0, 0, 1, 1, 1,
-0.209442, -0.2931363, -2.620717, 1, 0, 0, 1, 1,
-0.2077569, -0.5555601, -2.922728, 1, 0, 0, 1, 1,
-0.2046106, -0.2373767, -2.687409, 1, 0, 0, 1, 1,
-0.2045194, 0.3334635, -0.08905894, 1, 0, 0, 1, 1,
-0.1978352, -0.4652179, -2.45155, 1, 0, 0, 1, 1,
-0.1942882, 1.730261, -0.5336727, 0, 0, 0, 1, 1,
-0.1931263, -0.2596996, -1.916968, 0, 0, 0, 1, 1,
-0.1922329, -0.4642634, -2.44341, 0, 0, 0, 1, 1,
-0.1870486, -0.2445142, -2.1379, 0, 0, 0, 1, 1,
-0.184571, -0.213225, -0.5581709, 0, 0, 0, 1, 1,
-0.1823498, 0.2591455, -0.5584556, 0, 0, 0, 1, 1,
-0.1822218, 0.1004537, -1.418318, 0, 0, 0, 1, 1,
-0.1765791, 1.101138, -0.3717447, 1, 1, 1, 1, 1,
-0.1761604, 0.5969496, 1.459079, 1, 1, 1, 1, 1,
-0.1746888, 1.186988, -0.1352626, 1, 1, 1, 1, 1,
-0.1732066, -0.66034, -2.171796, 1, 1, 1, 1, 1,
-0.1655604, 0.135143, 0.6119277, 1, 1, 1, 1, 1,
-0.1610478, -3.242611, -2.421547, 1, 1, 1, 1, 1,
-0.1570917, -1.274804, -4.238534, 1, 1, 1, 1, 1,
-0.1570443, 0.1810669, -1.083542, 1, 1, 1, 1, 1,
-0.1521401, 0.2848097, -1.657359, 1, 1, 1, 1, 1,
-0.1520527, 0.2215673, 0.3023198, 1, 1, 1, 1, 1,
-0.1520033, 0.07560602, -0.5342317, 1, 1, 1, 1, 1,
-0.150751, -1.393201, -4.028744, 1, 1, 1, 1, 1,
-0.147305, -2.224355, -3.707013, 1, 1, 1, 1, 1,
-0.1440959, 0.7883319, -1.57007, 1, 1, 1, 1, 1,
-0.1425707, -0.8444942, -3.765449, 1, 1, 1, 1, 1,
-0.1407967, -0.9861944, -3.988483, 0, 0, 1, 1, 1,
-0.1407399, 0.9017179, 0.763182, 1, 0, 0, 1, 1,
-0.1354019, 0.6027899, -0.6365962, 1, 0, 0, 1, 1,
-0.1299303, -0.269798, -3.592849, 1, 0, 0, 1, 1,
-0.1183225, 0.440165, 0.3891874, 1, 0, 0, 1, 1,
-0.1140995, 0.2999556, -0.2933139, 1, 0, 0, 1, 1,
-0.1135727, 0.1550104, -0.8949943, 0, 0, 0, 1, 1,
-0.1104669, 0.9801788, 1.518334, 0, 0, 0, 1, 1,
-0.1054985, 0.7398934, -0.4081688, 0, 0, 0, 1, 1,
-0.1042052, -0.1507179, -2.114614, 0, 0, 0, 1, 1,
-0.1038493, 0.1772413, -0.198573, 0, 0, 0, 1, 1,
-0.09985971, -0.980213, -1.951797, 0, 0, 0, 1, 1,
-0.09798501, 1.341165, -1.149488, 0, 0, 0, 1, 1,
-0.09231237, -1.246053, -2.821835, 1, 1, 1, 1, 1,
-0.09173885, -0.190174, -0.3549585, 1, 1, 1, 1, 1,
-0.08147524, 0.3195958, -0.3118127, 1, 1, 1, 1, 1,
-0.08073309, 0.2478691, 0.4259243, 1, 1, 1, 1, 1,
-0.07809898, 1.158471, -1.534881, 1, 1, 1, 1, 1,
-0.07803527, 1.413721, -0.2220783, 1, 1, 1, 1, 1,
-0.0747401, 0.2858927, -1.134, 1, 1, 1, 1, 1,
-0.07308267, -0.4511886, -3.371592, 1, 1, 1, 1, 1,
-0.07153079, -0.3055088, -4.613185, 1, 1, 1, 1, 1,
-0.07074954, -0.8295507, -2.825167, 1, 1, 1, 1, 1,
-0.06720774, -0.617694, -2.920408, 1, 1, 1, 1, 1,
-0.065359, -2.919292, -1.732925, 1, 1, 1, 1, 1,
-0.0646148, -1.162072, -4.587781, 1, 1, 1, 1, 1,
-0.0620511, 0.9384608, -0.7717298, 1, 1, 1, 1, 1,
-0.05674105, 1.634034, 1.453178, 1, 1, 1, 1, 1,
-0.05548483, 0.7361349, 0.1312895, 0, 0, 1, 1, 1,
-0.05382609, -0.2938546, -1.869974, 1, 0, 0, 1, 1,
-0.05369992, -0.0693794, -4.125659, 1, 0, 0, 1, 1,
-0.04996735, 0.9289669, -0.0381337, 1, 0, 0, 1, 1,
-0.04793817, -0.03099141, -3.771647, 1, 0, 0, 1, 1,
-0.04633415, 0.4270838, 0.8116247, 1, 0, 0, 1, 1,
-0.0444556, 0.4728601, -3.076555, 0, 0, 0, 1, 1,
-0.04187275, 0.8988101, -1.562868, 0, 0, 0, 1, 1,
-0.04010847, 0.9716881, -0.07901856, 0, 0, 0, 1, 1,
-0.03049384, 0.9776973, -0.4781353, 0, 0, 0, 1, 1,
-0.02961492, 0.2549626, -2.63231, 0, 0, 0, 1, 1,
-0.02850614, 0.9576079, -1.595201, 0, 0, 0, 1, 1,
-0.02706846, -0.5835677, -1.975838, 0, 0, 0, 1, 1,
-0.0256242, 1.748346, 0.2327713, 1, 1, 1, 1, 1,
-0.02493846, 0.543545, 1.114643, 1, 1, 1, 1, 1,
-0.01768653, 1.603647, 0.4211766, 1, 1, 1, 1, 1,
-0.01740748, -1.244349, -1.402438, 1, 1, 1, 1, 1,
-0.0171028, -0.04159187, -1.220956, 1, 1, 1, 1, 1,
-0.01703981, -1.247707, -2.930283, 1, 1, 1, 1, 1,
-0.01290692, 1.188697, 0.8550662, 1, 1, 1, 1, 1,
-0.004085055, -0.7296306, -2.94764, 1, 1, 1, 1, 1,
0.0084507, -0.01932835, 3.079696, 1, 1, 1, 1, 1,
0.01118384, 0.2467157, -0.4394257, 1, 1, 1, 1, 1,
0.01208075, 0.5162436, -0.8067787, 1, 1, 1, 1, 1,
0.01227078, -0.3774982, 3.003466, 1, 1, 1, 1, 1,
0.02077079, 0.9308842, 0.3345701, 1, 1, 1, 1, 1,
0.02087923, -0.5649673, 3.123812, 1, 1, 1, 1, 1,
0.02380421, -2.431043, 2.630325, 1, 1, 1, 1, 1,
0.02448655, -1.341728, 4.566014, 0, 0, 1, 1, 1,
0.02885064, 1.245667, -0.2592134, 1, 0, 0, 1, 1,
0.04044586, 0.5541991, 0.7559656, 1, 0, 0, 1, 1,
0.04115115, -0.02350132, 0.9965675, 1, 0, 0, 1, 1,
0.0440023, -1.985026, 3.041601, 1, 0, 0, 1, 1,
0.04583988, 0.7192579, -0.8971776, 1, 0, 0, 1, 1,
0.04826479, -0.649291, 2.413046, 0, 0, 0, 1, 1,
0.05327805, 1.121525, -0.8024117, 0, 0, 0, 1, 1,
0.05614712, 0.04634587, 0.1491787, 0, 0, 0, 1, 1,
0.05947186, -3.0664, 2.626323, 0, 0, 0, 1, 1,
0.06273045, 1.631119, 0.3400654, 0, 0, 0, 1, 1,
0.06702699, 0.04939694, 0.6943017, 0, 0, 0, 1, 1,
0.06878507, 0.1572668, -1.18252, 0, 0, 0, 1, 1,
0.07372723, -1.559285, 3.168447, 1, 1, 1, 1, 1,
0.07512048, -0.9215317, 4.173707, 1, 1, 1, 1, 1,
0.07681078, 0.9344828, 0.3247794, 1, 1, 1, 1, 1,
0.07849535, -1.544702, 4.115266, 1, 1, 1, 1, 1,
0.07968424, 0.7554305, 0.973357, 1, 1, 1, 1, 1,
0.08239834, 2.569219, 0.7638328, 1, 1, 1, 1, 1,
0.08461893, 0.8634017, 1.729533, 1, 1, 1, 1, 1,
0.0873879, -0.6765589, 2.497507, 1, 1, 1, 1, 1,
0.0922974, 0.3300133, 0.9486269, 1, 1, 1, 1, 1,
0.092558, -0.1434456, 1.091741, 1, 1, 1, 1, 1,
0.1024681, 0.6997008, -0.8405663, 1, 1, 1, 1, 1,
0.105275, 0.2878885, -0.287427, 1, 1, 1, 1, 1,
0.1159479, -0.9448873, 2.827644, 1, 1, 1, 1, 1,
0.1188423, 1.014635, 0.3664788, 1, 1, 1, 1, 1,
0.1212825, 1.596217, 0.9206368, 1, 1, 1, 1, 1,
0.1230713, 0.1124016, -0.6970868, 0, 0, 1, 1, 1,
0.1247244, 1.208882, -0.5642952, 1, 0, 0, 1, 1,
0.1258943, -0.9348715, 2.905971, 1, 0, 0, 1, 1,
0.1267746, 1.131776, 0.1356948, 1, 0, 0, 1, 1,
0.1385287, 2.248056, -0.4020055, 1, 0, 0, 1, 1,
0.1405703, 1.091943, -1.071042, 1, 0, 0, 1, 1,
0.1460829, -0.4070331, 2.772834, 0, 0, 0, 1, 1,
0.1519602, -0.5178901, 2.667011, 0, 0, 0, 1, 1,
0.1644647, -0.7340742, 2.118671, 0, 0, 0, 1, 1,
0.1652938, -0.239859, 2.705585, 0, 0, 0, 1, 1,
0.1670464, -0.8805228, 4.469297, 0, 0, 0, 1, 1,
0.1691392, -0.7272856, 0.9861795, 0, 0, 0, 1, 1,
0.1732516, -0.1601796, 1.328339, 0, 0, 0, 1, 1,
0.1771041, 0.2299046, 0.8484314, 1, 1, 1, 1, 1,
0.1798835, -0.710332, 5.273083, 1, 1, 1, 1, 1,
0.1806817, 1.031959, -0.4597097, 1, 1, 1, 1, 1,
0.1819061, -0.5611035, 3.490062, 1, 1, 1, 1, 1,
0.1856915, -2.200055, 2.04941, 1, 1, 1, 1, 1,
0.1934194, -0.06311013, -0.1966789, 1, 1, 1, 1, 1,
0.1946978, -2.012706, 5.28981, 1, 1, 1, 1, 1,
0.1999845, 1.044455, 0.4235854, 1, 1, 1, 1, 1,
0.2013558, 1.132286, 0.6535399, 1, 1, 1, 1, 1,
0.2026222, -2.454021, 2.718714, 1, 1, 1, 1, 1,
0.2028127, 0.3859345, 1.70014, 1, 1, 1, 1, 1,
0.2192767, 1.541002, -0.6529971, 1, 1, 1, 1, 1,
0.2210855, 0.1987836, 0.9393975, 1, 1, 1, 1, 1,
0.2225338, -0.583554, 1.702391, 1, 1, 1, 1, 1,
0.2251094, 0.3435185, 0.5612703, 1, 1, 1, 1, 1,
0.2255119, -0.1400589, 2.831362, 0, 0, 1, 1, 1,
0.2274867, 0.5135937, 1.339166, 1, 0, 0, 1, 1,
0.2313199, 0.04616479, 0.0241091, 1, 0, 0, 1, 1,
0.2377238, -0.2151362, 2.937327, 1, 0, 0, 1, 1,
0.2377465, -0.8862787, 4.791219, 1, 0, 0, 1, 1,
0.2395655, 2.085215, 1.170584, 1, 0, 0, 1, 1,
0.2441633, -0.2915364, 2.55812, 0, 0, 0, 1, 1,
0.2452468, -0.7015768, 2.109164, 0, 0, 0, 1, 1,
0.2515855, 1.569528, -0.4106377, 0, 0, 0, 1, 1,
0.2536259, -1.188195, 2.362188, 0, 0, 0, 1, 1,
0.2545072, -0.8358507, 4.95348, 0, 0, 0, 1, 1,
0.2594492, -1.464096, 2.75971, 0, 0, 0, 1, 1,
0.2614559, 0.6170549, 1.062804, 0, 0, 0, 1, 1,
0.2659039, -0.3079327, 4.030923, 1, 1, 1, 1, 1,
0.266272, -1.001523, 3.603818, 1, 1, 1, 1, 1,
0.2706933, 0.3617899, 0.2672348, 1, 1, 1, 1, 1,
0.271089, -0.1480853, 3.802117, 1, 1, 1, 1, 1,
0.2727906, -0.880652, 2.685514, 1, 1, 1, 1, 1,
0.2729454, 0.3859817, 1.55795, 1, 1, 1, 1, 1,
0.2751275, 1.424222, -0.4616595, 1, 1, 1, 1, 1,
0.2753294, -0.600829, 1.872924, 1, 1, 1, 1, 1,
0.2777577, 0.2937419, 1.64295, 1, 1, 1, 1, 1,
0.2881723, 1.379219, -0.6826289, 1, 1, 1, 1, 1,
0.2953811, -0.6143512, 3.860671, 1, 1, 1, 1, 1,
0.2959976, -2.203225, 3.087827, 1, 1, 1, 1, 1,
0.2987992, -0.5128711, 1.935871, 1, 1, 1, 1, 1,
0.3005874, 0.00330644, 2.749834, 1, 1, 1, 1, 1,
0.3025215, -0.125867, 2.750497, 1, 1, 1, 1, 1,
0.3032308, -0.1313379, 4.060669, 0, 0, 1, 1, 1,
0.3038151, 0.1986947, 0.679944, 1, 0, 0, 1, 1,
0.3085202, 0.5847853, 0.8982171, 1, 0, 0, 1, 1,
0.3118689, -1.865795, 3.082162, 1, 0, 0, 1, 1,
0.3130778, -0.08291641, 0.9661393, 1, 0, 0, 1, 1,
0.3177721, 1.72471, 0.296906, 1, 0, 0, 1, 1,
0.3189482, -0.9998705, 2.628341, 0, 0, 0, 1, 1,
0.3209595, -1.511652, 2.158453, 0, 0, 0, 1, 1,
0.322049, 1.567116, -0.2127497, 0, 0, 0, 1, 1,
0.324426, 1.690428, 0.1892281, 0, 0, 0, 1, 1,
0.3246001, 2.117028, -1.651349, 0, 0, 0, 1, 1,
0.3251153, -1.949462, 2.178108, 0, 0, 0, 1, 1,
0.3252976, 0.4225573, 0.7293525, 0, 0, 0, 1, 1,
0.329963, 0.2230861, 1.11975, 1, 1, 1, 1, 1,
0.332213, 0.4153967, 1.797767, 1, 1, 1, 1, 1,
0.3329179, 0.6056006, 1.378341, 1, 1, 1, 1, 1,
0.3333039, -1.281646, 2.253224, 1, 1, 1, 1, 1,
0.3427386, -0.3537524, 3.632943, 1, 1, 1, 1, 1,
0.3450313, 0.2472528, 0.7879104, 1, 1, 1, 1, 1,
0.3470964, 1.767022, -0.1376125, 1, 1, 1, 1, 1,
0.3478298, -0.5176639, 3.644017, 1, 1, 1, 1, 1,
0.348775, -0.4359924, 1.190315, 1, 1, 1, 1, 1,
0.3516458, -0.4044042, 3.183567, 1, 1, 1, 1, 1,
0.3534683, 0.9783601, 0.5664125, 1, 1, 1, 1, 1,
0.3553569, 1.838993, 0.1303975, 1, 1, 1, 1, 1,
0.3562102, 0.4241864, 1.61801, 1, 1, 1, 1, 1,
0.3582107, -0.2146014, 0.5373563, 1, 1, 1, 1, 1,
0.359889, 0.5840137, -1.510746, 1, 1, 1, 1, 1,
0.3605389, -0.5850213, 4.114079, 0, 0, 1, 1, 1,
0.3618244, -0.7332711, 1.951396, 1, 0, 0, 1, 1,
0.3639546, 1.512981, -1.060573, 1, 0, 0, 1, 1,
0.3662092, -0.3311753, 1.067401, 1, 0, 0, 1, 1,
0.3666176, 1.38593, -0.7838898, 1, 0, 0, 1, 1,
0.3689959, 0.3061374, 1.787645, 1, 0, 0, 1, 1,
0.3742156, -0.5710354, 3.152327, 0, 0, 0, 1, 1,
0.3751879, -0.7791932, 3.319163, 0, 0, 0, 1, 1,
0.3787044, -0.02837772, 3.546581, 0, 0, 0, 1, 1,
0.3796283, -0.02652076, 2.215051, 0, 0, 0, 1, 1,
0.3804406, 0.6738994, 0.8465624, 0, 0, 0, 1, 1,
0.3857148, -0.9457018, 1.758621, 0, 0, 0, 1, 1,
0.3886663, -1.522905, 3.486191, 0, 0, 0, 1, 1,
0.3916618, 0.02009835, 1.754048, 1, 1, 1, 1, 1,
0.3922524, 0.6088337, 1.054269, 1, 1, 1, 1, 1,
0.3924218, -1.272681, 3.180389, 1, 1, 1, 1, 1,
0.3938117, -1.267384, 4.609873, 1, 1, 1, 1, 1,
0.396719, -1.211077, 1.436034, 1, 1, 1, 1, 1,
0.3998856, 1.454718, -0.02489805, 1, 1, 1, 1, 1,
0.4006686, 0.2994224, 0.3522551, 1, 1, 1, 1, 1,
0.4047786, -0.9942264, 2.308594, 1, 1, 1, 1, 1,
0.4232452, 1.45543, -0.029849, 1, 1, 1, 1, 1,
0.4275417, -0.07917763, 2.76813, 1, 1, 1, 1, 1,
0.4281515, 0.0209306, 3.311155, 1, 1, 1, 1, 1,
0.4311087, -1.380663, 1.956083, 1, 1, 1, 1, 1,
0.4314906, -0.5481038, 2.389016, 1, 1, 1, 1, 1,
0.4403193, 0.2443708, 1.085263, 1, 1, 1, 1, 1,
0.4407942, -1.187614, 3.060827, 1, 1, 1, 1, 1,
0.442327, 0.4754405, 0.7726074, 0, 0, 1, 1, 1,
0.4435755, 1.421987, 0.294724, 1, 0, 0, 1, 1,
0.4525173, -0.2673406, 0.4947806, 1, 0, 0, 1, 1,
0.4542431, -0.02719001, 1.969383, 1, 0, 0, 1, 1,
0.4546104, -0.4617208, 2.277204, 1, 0, 0, 1, 1,
0.4552706, -2.130837, 3.336577, 1, 0, 0, 1, 1,
0.455343, -1.594486, 0.7209695, 0, 0, 0, 1, 1,
0.4561652, 0.5636506, 0.06211907, 0, 0, 0, 1, 1,
0.4571987, 1.775128, 0.1882126, 0, 0, 0, 1, 1,
0.4580476, 2.637622, 0.1244581, 0, 0, 0, 1, 1,
0.4583049, -0.4033889, 1.87754, 0, 0, 0, 1, 1,
0.4621729, -0.8976725, 2.020114, 0, 0, 0, 1, 1,
0.4633515, -0.2068829, 0.06180122, 0, 0, 0, 1, 1,
0.4645016, -0.7837464, 3.435888, 1, 1, 1, 1, 1,
0.4665851, -1.178869, 2.168823, 1, 1, 1, 1, 1,
0.4673999, -0.6719353, 2.59241, 1, 1, 1, 1, 1,
0.4721679, -0.404439, 1.232261, 1, 1, 1, 1, 1,
0.4731975, 0.2902376, 0.2092883, 1, 1, 1, 1, 1,
0.4732311, -0.7015679, 2.524178, 1, 1, 1, 1, 1,
0.4780383, -2.312152, 2.284522, 1, 1, 1, 1, 1,
0.4793465, -1.055248, 2.117866, 1, 1, 1, 1, 1,
0.4812804, -0.6637116, 4.124107, 1, 1, 1, 1, 1,
0.4840847, 0.3046385, 0.7689251, 1, 1, 1, 1, 1,
0.4874345, 0.3458154, 0.3953432, 1, 1, 1, 1, 1,
0.4879113, -0.9135112, 3.938633, 1, 1, 1, 1, 1,
0.4910295, 0.8641145, 2.320958, 1, 1, 1, 1, 1,
0.4911323, 0.5727509, 0.09600673, 1, 1, 1, 1, 1,
0.494661, 0.6875749, 0.01800424, 1, 1, 1, 1, 1,
0.4961573, -1.770201, 4.342978, 0, 0, 1, 1, 1,
0.4972435, 0.3428582, 0.486205, 1, 0, 0, 1, 1,
0.5007709, 0.4929823, -0.546353, 1, 0, 0, 1, 1,
0.5015391, -0.03238653, 1.242292, 1, 0, 0, 1, 1,
0.5032505, -0.5020358, 1.95478, 1, 0, 0, 1, 1,
0.506294, 0.9051126, 0.4280161, 1, 0, 0, 1, 1,
0.5072227, -0.1914042, 1.61046, 0, 0, 0, 1, 1,
0.5087273, -0.9793961, 0.3397972, 0, 0, 0, 1, 1,
0.5152393, 0.7970756, 0.8364725, 0, 0, 0, 1, 1,
0.5163295, 0.5180537, 0.449737, 0, 0, 0, 1, 1,
0.5165231, 0.5805382, 1.131091, 0, 0, 0, 1, 1,
0.5168775, 1.916129, 1.832954, 0, 0, 0, 1, 1,
0.5204432, 0.1955642, 1.171881, 0, 0, 0, 1, 1,
0.5218786, -0.4578514, 1.796817, 1, 1, 1, 1, 1,
0.5268462, -0.3414637, 1.095278, 1, 1, 1, 1, 1,
0.5308576, -0.7114262, 2.39245, 1, 1, 1, 1, 1,
0.5312265, -0.05580941, 0.7450426, 1, 1, 1, 1, 1,
0.531794, 0.9762079, 1.884097, 1, 1, 1, 1, 1,
0.5356976, -0.156461, 2.20214, 1, 1, 1, 1, 1,
0.5383313, -0.3239793, 1.744354, 1, 1, 1, 1, 1,
0.5385977, -0.683619, 3.011496, 1, 1, 1, 1, 1,
0.5427706, 0.09444845, 2.426074, 1, 1, 1, 1, 1,
0.5428451, 1.227486, 1.435185, 1, 1, 1, 1, 1,
0.5474873, -0.1340494, 1.240999, 1, 1, 1, 1, 1,
0.549288, -0.151461, -0.158055, 1, 1, 1, 1, 1,
0.5500315, 0.104408, 1.722545, 1, 1, 1, 1, 1,
0.5582641, 0.3756731, 2.31491, 1, 1, 1, 1, 1,
0.5686531, 0.8962423, -0.5736603, 1, 1, 1, 1, 1,
0.5703036, -0.8131027, 1.47671, 0, 0, 1, 1, 1,
0.5758872, -1.114583, 1.770529, 1, 0, 0, 1, 1,
0.576495, 0.2336772, 1.029834, 1, 0, 0, 1, 1,
0.5789806, -0.7128888, 2.769656, 1, 0, 0, 1, 1,
0.5802135, 0.4061824, 1.354547, 1, 0, 0, 1, 1,
0.5871806, 1.850168, -0.6523367, 1, 0, 0, 1, 1,
0.5919243, -2.197684, 4.69135, 0, 0, 0, 1, 1,
0.5967045, 0.7641041, 2.549762, 0, 0, 0, 1, 1,
0.59949, 0.611105, 0.5597528, 0, 0, 0, 1, 1,
0.6021188, -0.4606202, 1.094106, 0, 0, 0, 1, 1,
0.6058852, 1.068373, -0.5390793, 0, 0, 0, 1, 1,
0.606676, 0.3702341, 1.973444, 0, 0, 0, 1, 1,
0.6092251, 1.16461, 0.9762999, 0, 0, 0, 1, 1,
0.6147417, 0.3168235, -0.03233039, 1, 1, 1, 1, 1,
0.615484, 1.300629, 0.6573828, 1, 1, 1, 1, 1,
0.6179466, -0.1477519, 3.262341, 1, 1, 1, 1, 1,
0.6228753, 1.125653, 2.349498, 1, 1, 1, 1, 1,
0.6239652, -0.2899376, 0.8132999, 1, 1, 1, 1, 1,
0.6247742, 0.9889692, 0.758753, 1, 1, 1, 1, 1,
0.6270697, -1.610412, 2.835444, 1, 1, 1, 1, 1,
0.6278741, 1.107727, 0.8540102, 1, 1, 1, 1, 1,
0.6291682, -0.6771318, 1.881708, 1, 1, 1, 1, 1,
0.6295338, 1.149068, 1.318162, 1, 1, 1, 1, 1,
0.632386, 0.9191, 0.9110641, 1, 1, 1, 1, 1,
0.6422961, -0.5713177, 3.181797, 1, 1, 1, 1, 1,
0.6432913, -0.8952295, 2.096802, 1, 1, 1, 1, 1,
0.6485211, 2.027286, -0.7963979, 1, 1, 1, 1, 1,
0.650525, 0.3918907, 0.05032961, 1, 1, 1, 1, 1,
0.6521724, 0.3014136, 1.381994, 0, 0, 1, 1, 1,
0.6549013, 0.552169, 0.7296658, 1, 0, 0, 1, 1,
0.6568117, 1.765993, -0.2917247, 1, 0, 0, 1, 1,
0.6624542, -0.2135728, 4.388616, 1, 0, 0, 1, 1,
0.6630788, -1.513455, 2.560316, 1, 0, 0, 1, 1,
0.6639764, -0.7345961, 3.255717, 1, 0, 0, 1, 1,
0.6649595, -2.514026, 3.435947, 0, 0, 0, 1, 1,
0.6663366, 0.04369673, 2.36751, 0, 0, 0, 1, 1,
0.667658, 0.3430634, 0.8172148, 0, 0, 0, 1, 1,
0.6682286, -0.9400356, 4.480519, 0, 0, 0, 1, 1,
0.6714182, 0.5003749, 1.507071, 0, 0, 0, 1, 1,
0.6717576, -0.8670641, 2.232343, 0, 0, 0, 1, 1,
0.6718554, -0.2013969, 2.811474, 0, 0, 0, 1, 1,
0.6753626, -0.493527, 3.178906, 1, 1, 1, 1, 1,
0.6763974, -1.265092, 1.894014, 1, 1, 1, 1, 1,
0.6773006, 0.1042756, 2.5077, 1, 1, 1, 1, 1,
0.6776028, 0.5445992, 0.822823, 1, 1, 1, 1, 1,
0.681375, 0.5062822, -0.2997558, 1, 1, 1, 1, 1,
0.6836033, 0.4294845, 1.505655, 1, 1, 1, 1, 1,
0.6839992, 1.607476, -0.775075, 1, 1, 1, 1, 1,
0.6849059, 0.6189556, -0.8087088, 1, 1, 1, 1, 1,
0.685201, -0.1486697, 1.404651, 1, 1, 1, 1, 1,
0.6887665, 0.3326957, 1.155855, 1, 1, 1, 1, 1,
0.6913703, 1.261002, 1.412332, 1, 1, 1, 1, 1,
0.6924891, -0.4999598, 3.471402, 1, 1, 1, 1, 1,
0.7014794, -1.651424, 3.443594, 1, 1, 1, 1, 1,
0.7026558, -1.17828, 2.865825, 1, 1, 1, 1, 1,
0.706964, 0.02699961, 2.43542, 1, 1, 1, 1, 1,
0.7070314, 1.380486, 2.229224, 0, 0, 1, 1, 1,
0.7137732, -0.7382157, 2.011345, 1, 0, 0, 1, 1,
0.7147419, 0.7535704, 1.512337, 1, 0, 0, 1, 1,
0.7151267, 1.070515, 0.112163, 1, 0, 0, 1, 1,
0.7154764, -0.2365666, 2.115289, 1, 0, 0, 1, 1,
0.7179026, 0.7261897, 0.4439139, 1, 0, 0, 1, 1,
0.7181, -0.7317599, 2.398805, 0, 0, 0, 1, 1,
0.718448, -0.7231932, 3.235509, 0, 0, 0, 1, 1,
0.7211289, -0.4013383, 2.488444, 0, 0, 0, 1, 1,
0.7214627, 0.4363969, 0.3433218, 0, 0, 0, 1, 1,
0.7255709, 1.575814, 1.976939, 0, 0, 0, 1, 1,
0.7304597, -0.3484713, 1.822361, 0, 0, 0, 1, 1,
0.7308274, -0.832009, 0.9707483, 0, 0, 0, 1, 1,
0.733552, -0.383933, 0.6760378, 1, 1, 1, 1, 1,
0.7341877, 1.258952, 1.362806, 1, 1, 1, 1, 1,
0.7455288, 1.516979, -1.043264, 1, 1, 1, 1, 1,
0.7456173, 1.338656, -0.2201723, 1, 1, 1, 1, 1,
0.7531109, -0.2733416, 1.291857, 1, 1, 1, 1, 1,
0.7533851, -0.5330221, 2.432032, 1, 1, 1, 1, 1,
0.7582017, -1.290486, 3.95086, 1, 1, 1, 1, 1,
0.7670652, -0.2076068, 1.028204, 1, 1, 1, 1, 1,
0.7684947, -0.2516945, 1.861358, 1, 1, 1, 1, 1,
0.7696271, -1.399765, 2.676644, 1, 1, 1, 1, 1,
0.7701986, -1.002694, 1.766237, 1, 1, 1, 1, 1,
0.7719529, 1.2645, -1.539878, 1, 1, 1, 1, 1,
0.7766086, -0.0762981, 0.9109942, 1, 1, 1, 1, 1,
0.7802663, 0.0398582, 3.445897, 1, 1, 1, 1, 1,
0.7806259, 0.5616444, 0.211796, 1, 1, 1, 1, 1,
0.7823218, 0.06772105, 2.576727, 0, 0, 1, 1, 1,
0.7854857, -0.6906043, 2.528017, 1, 0, 0, 1, 1,
0.7960042, 0.08370367, 2.413399, 1, 0, 0, 1, 1,
0.800152, -0.7082613, 2.270959, 1, 0, 0, 1, 1,
0.8042039, -1.347191, 1.681702, 1, 0, 0, 1, 1,
0.8102003, -1.144797, 1.261581, 1, 0, 0, 1, 1,
0.812119, -0.96021, 2.996197, 0, 0, 0, 1, 1,
0.8153619, 1.742364, 1.808937, 0, 0, 0, 1, 1,
0.8188793, 2.19203, -0.9447311, 0, 0, 0, 1, 1,
0.8197404, -1.234948, 2.12425, 0, 0, 0, 1, 1,
0.8209732, -1.072625, 2.86937, 0, 0, 0, 1, 1,
0.8228276, 0.003830696, 1.073124, 0, 0, 0, 1, 1,
0.826419, -1.060456, 3.466729, 0, 0, 0, 1, 1,
0.8354275, -0.68783, 2.404593, 1, 1, 1, 1, 1,
0.8417444, 0.7533346, 0.6946764, 1, 1, 1, 1, 1,
0.8445264, -1.615567, 4.115852, 1, 1, 1, 1, 1,
0.8515822, 1.108538, 1.262297, 1, 1, 1, 1, 1,
0.8520257, 0.6414909, 0.2071126, 1, 1, 1, 1, 1,
0.8538952, 1.295146, 1.378842, 1, 1, 1, 1, 1,
0.8553651, -1.814015, 3.681928, 1, 1, 1, 1, 1,
0.8604423, -0.5717044, 2.485242, 1, 1, 1, 1, 1,
0.8711625, 0.2869364, 1.398726, 1, 1, 1, 1, 1,
0.875897, 0.5901124, 2.72283, 1, 1, 1, 1, 1,
0.8832428, 0.8138216, 0.4227319, 1, 1, 1, 1, 1,
0.8865479, 2.117038, 0.9986836, 1, 1, 1, 1, 1,
0.8885161, 1.527844, 1.648175, 1, 1, 1, 1, 1,
0.8916699, 1.306153, 1.824856, 1, 1, 1, 1, 1,
0.8926209, -0.1528261, 1.678388, 1, 1, 1, 1, 1,
0.8940158, 1.638522, -0.455905, 0, 0, 1, 1, 1,
0.8941994, 0.762369, 0.874311, 1, 0, 0, 1, 1,
0.8988096, 1.901588, 0.3126603, 1, 0, 0, 1, 1,
0.9004377, -0.5106828, 0.9645565, 1, 0, 0, 1, 1,
0.9054928, 1.342066, 0.7765389, 1, 0, 0, 1, 1,
0.9194188, -0.4121612, 0.7069824, 1, 0, 0, 1, 1,
0.9241434, 0.5078946, 0.4947611, 0, 0, 0, 1, 1,
0.9245411, 0.1125266, 3.100673, 0, 0, 0, 1, 1,
0.92462, 1.755373, 0.5629979, 0, 0, 0, 1, 1,
0.9247444, 0.5779967, 2.705975, 0, 0, 0, 1, 1,
0.9277804, 0.02899539, 1.653391, 0, 0, 0, 1, 1,
0.9321216, -0.8486976, 2.603798, 0, 0, 0, 1, 1,
0.9367291, 1.207495, 1.195249, 0, 0, 0, 1, 1,
0.9402637, 0.487249, 1.216173, 1, 1, 1, 1, 1,
0.9406307, 1.100768, 0.9884216, 1, 1, 1, 1, 1,
0.9415796, 0.06381134, 1.701786, 1, 1, 1, 1, 1,
0.9494614, 0.5082265, 1.760373, 1, 1, 1, 1, 1,
0.9501385, 0.9081051, 2.720595, 1, 1, 1, 1, 1,
0.9517282, 2.044256, 0.9806947, 1, 1, 1, 1, 1,
0.952049, -1.944396, 2.310882, 1, 1, 1, 1, 1,
0.9607452, 0.2985473, 2.136359, 1, 1, 1, 1, 1,
0.963305, -1.370589, 3.819146, 1, 1, 1, 1, 1,
0.965157, -1.261135, 4.0419, 1, 1, 1, 1, 1,
0.9733899, -0.003250702, 2.628239, 1, 1, 1, 1, 1,
0.9756616, 0.04148204, 2.161705, 1, 1, 1, 1, 1,
0.981874, 1.377169, -0.6063684, 1, 1, 1, 1, 1,
0.9898049, 0.4359218, 1.073836, 1, 1, 1, 1, 1,
0.994009, 0.05064352, 2.952322, 1, 1, 1, 1, 1,
1.000551, 0.8546291, -0.2239068, 0, 0, 1, 1, 1,
1.000734, 0.8107821, 0.8283483, 1, 0, 0, 1, 1,
1.001592, -0.3323875, 2.921328, 1, 0, 0, 1, 1,
1.006522, -0.7261528, 3.714937, 1, 0, 0, 1, 1,
1.006823, -0.411351, 2.865726, 1, 0, 0, 1, 1,
1.009107, -2.328454, 2.846916, 1, 0, 0, 1, 1,
1.010013, 0.8828456, -0.9120793, 0, 0, 0, 1, 1,
1.013506, 0.2504441, 2.334963, 0, 0, 0, 1, 1,
1.015671, -0.1381485, -0.007963267, 0, 0, 0, 1, 1,
1.025374, 0.7809119, 0.1607443, 0, 0, 0, 1, 1,
1.028447, 0.5794094, 0.2072109, 0, 0, 0, 1, 1,
1.029314, 1.373071, 0.4529435, 0, 0, 0, 1, 1,
1.036744, 0.1079174, 0.6139645, 0, 0, 0, 1, 1,
1.041392, 0.1006844, 3.063936, 1, 1, 1, 1, 1,
1.043404, 2.673331, 0.3573447, 1, 1, 1, 1, 1,
1.046562, 0.5523332, 0.04488501, 1, 1, 1, 1, 1,
1.048096, -1.017024, 2.995542, 1, 1, 1, 1, 1,
1.049933, 1.862999, 0.9426394, 1, 1, 1, 1, 1,
1.051854, 1.314214, 1.255244, 1, 1, 1, 1, 1,
1.053676, 0.535549, -0.02568766, 1, 1, 1, 1, 1,
1.05588, -0.6615295, 1.739272, 1, 1, 1, 1, 1,
1.062616, 0.9478254, -0.3195806, 1, 1, 1, 1, 1,
1.072747, 1.930253, -0.1280405, 1, 1, 1, 1, 1,
1.074141, -0.503979, 2.30823, 1, 1, 1, 1, 1,
1.077684, -0.07364675, 1.28579, 1, 1, 1, 1, 1,
1.07879, -0.4153567, 4.424778, 1, 1, 1, 1, 1,
1.087292, 2.284725, 0.964845, 1, 1, 1, 1, 1,
1.09764, 1.033991, 1.320091, 1, 1, 1, 1, 1,
1.11287, -1.10875, 1.334314, 0, 0, 1, 1, 1,
1.113428, -0.1698461, 0.5838284, 1, 0, 0, 1, 1,
1.113699, -2.092492, 3.485875, 1, 0, 0, 1, 1,
1.115954, 1.091093, 2.885221, 1, 0, 0, 1, 1,
1.116309, -1.343194, 2.864719, 1, 0, 0, 1, 1,
1.120744, -1.477932, 2.556381, 1, 0, 0, 1, 1,
1.12809, 1.277635, 1.316199, 0, 0, 0, 1, 1,
1.141034, 0.3782853, 2.193197, 0, 0, 0, 1, 1,
1.143049, -0.1867119, 0.4688172, 0, 0, 0, 1, 1,
1.150506, -1.945011, 2.753396, 0, 0, 0, 1, 1,
1.172273, 0.7049345, 1.691632, 0, 0, 0, 1, 1,
1.179369, 0.2866997, 0.3823373, 0, 0, 0, 1, 1,
1.181952, 0.5793686, 1.673217, 0, 0, 0, 1, 1,
1.183345, -0.2561017, 2.015988, 1, 1, 1, 1, 1,
1.188729, 1.313154, 1.199701, 1, 1, 1, 1, 1,
1.190666, 1.738519, -0.5701247, 1, 1, 1, 1, 1,
1.202704, 0.03798664, 0.9748904, 1, 1, 1, 1, 1,
1.203437, -0.8450114, 3.441088, 1, 1, 1, 1, 1,
1.204201, 1.052382, 1.480438, 1, 1, 1, 1, 1,
1.206337, 1.02537, 1.027468, 1, 1, 1, 1, 1,
1.210344, -0.8690609, 1.684208, 1, 1, 1, 1, 1,
1.214171, 1.020733, 0.3219935, 1, 1, 1, 1, 1,
1.224317, -0.02611068, 2.021784, 1, 1, 1, 1, 1,
1.224897, -0.5477288, 2.988611, 1, 1, 1, 1, 1,
1.231014, -0.5147517, 1.711623, 1, 1, 1, 1, 1,
1.249711, -1.39938, 3.783894, 1, 1, 1, 1, 1,
1.253387, 0.2166313, 0.7560115, 1, 1, 1, 1, 1,
1.255918, -0.6842918, 4.138004, 1, 1, 1, 1, 1,
1.26199, -0.6175306, 0.9035492, 0, 0, 1, 1, 1,
1.264038, -0.5224399, 3.207331, 1, 0, 0, 1, 1,
1.265367, 1.104767, 0.0450212, 1, 0, 0, 1, 1,
1.276232, -1.668358, 2.145448, 1, 0, 0, 1, 1,
1.278527, 1.983472, 0.8477101, 1, 0, 0, 1, 1,
1.285349, 1.043996, -0.8970118, 1, 0, 0, 1, 1,
1.286561, -1.091296, 1.738487, 0, 0, 0, 1, 1,
1.288641, -0.3684914, 0.8999029, 0, 0, 0, 1, 1,
1.295187, 2.441783, 1.602158, 0, 0, 0, 1, 1,
1.296866, -1.512651, 1.903384, 0, 0, 0, 1, 1,
1.310964, 0.3579294, 0.9765152, 0, 0, 0, 1, 1,
1.312134, 1.475153, 0.5136632, 0, 0, 0, 1, 1,
1.313299, 0.6604893, 1.233603, 0, 0, 0, 1, 1,
1.317238, -0.847762, 1.828491, 1, 1, 1, 1, 1,
1.322486, -0.7138715, -0.4453399, 1, 1, 1, 1, 1,
1.326431, -0.3445175, 2.190771, 1, 1, 1, 1, 1,
1.332362, 0.7593918, -0.7678288, 1, 1, 1, 1, 1,
1.334517, 1.35237, -0.5103097, 1, 1, 1, 1, 1,
1.347295, -0.5068787, 1.71052, 1, 1, 1, 1, 1,
1.349256, 0.6392201, 0.9226493, 1, 1, 1, 1, 1,
1.351605, 1.378682, 0.9358972, 1, 1, 1, 1, 1,
1.360152, 0.4094673, -0.0307399, 1, 1, 1, 1, 1,
1.362613, 0.8482953, 1.388536, 1, 1, 1, 1, 1,
1.362746, -0.4027411, 0.6007976, 1, 1, 1, 1, 1,
1.365892, 0.184466, 1.287428, 1, 1, 1, 1, 1,
1.367566, 1.050434, 1.065529, 1, 1, 1, 1, 1,
1.387311, 0.1898893, 1.9527, 1, 1, 1, 1, 1,
1.388216, 0.405029, 3.154907, 1, 1, 1, 1, 1,
1.402309, 1.069227, 1.056926, 0, 0, 1, 1, 1,
1.403725, 0.3532622, 0.8994553, 1, 0, 0, 1, 1,
1.40876, -0.8763221, 2.32238, 1, 0, 0, 1, 1,
1.426228, 2.484042, -0.002632703, 1, 0, 0, 1, 1,
1.429613, 0.5649141, 0.7903216, 1, 0, 0, 1, 1,
1.431221, -0.187169, 2.625846, 1, 0, 0, 1, 1,
1.434269, 0.1082137, 1.819358, 0, 0, 0, 1, 1,
1.444144, -0.4454866, 1.085048, 0, 0, 0, 1, 1,
1.467549, 0.1544875, 2.400061, 0, 0, 0, 1, 1,
1.468395, 0.6058158, 0.7811106, 0, 0, 0, 1, 1,
1.489433, -0.9001388, 2.546072, 0, 0, 0, 1, 1,
1.498715, -0.3657736, 0.8051134, 0, 0, 0, 1, 1,
1.511595, -0.5479417, 3.559006, 0, 0, 0, 1, 1,
1.514394, -1.698648, 4.031769, 1, 1, 1, 1, 1,
1.518608, -1.729445, 1.207517, 1, 1, 1, 1, 1,
1.520334, -1.051461, 2.171146, 1, 1, 1, 1, 1,
1.548597, -0.1420983, 1.085264, 1, 1, 1, 1, 1,
1.549877, 0.2523564, 1.682179, 1, 1, 1, 1, 1,
1.576103, -0.5247575, 2.757959, 1, 1, 1, 1, 1,
1.577559, -0.4158299, 1.649766, 1, 1, 1, 1, 1,
1.577911, -2.050182, 2.497413, 1, 1, 1, 1, 1,
1.581157, -0.578061, 2.890985, 1, 1, 1, 1, 1,
1.593679, 0.0002914405, 3.088422, 1, 1, 1, 1, 1,
1.594379, 0.6141287, 1.769863, 1, 1, 1, 1, 1,
1.600744, 0.7780744, 2.201549, 1, 1, 1, 1, 1,
1.606122, 1.971337, 0.6086642, 1, 1, 1, 1, 1,
1.623962, 0.007396723, 2.096661, 1, 1, 1, 1, 1,
1.637264, -0.5106127, 1.575842, 1, 1, 1, 1, 1,
1.64081, -0.4005684, 1.552887, 0, 0, 1, 1, 1,
1.686243, 0.5421843, 1.980251, 1, 0, 0, 1, 1,
1.688163, 1.070607, -0.1322885, 1, 0, 0, 1, 1,
1.693227, 1.988088, 0.5484462, 1, 0, 0, 1, 1,
1.695111, 0.7292759, 1.137829, 1, 0, 0, 1, 1,
1.698252, -0.220827, 2.509529, 1, 0, 0, 1, 1,
1.703115, -0.6079566, 2.565412, 0, 0, 0, 1, 1,
1.706719, -0.2042339, 1.040384, 0, 0, 0, 1, 1,
1.7069, 1.400827, 1.863316, 0, 0, 0, 1, 1,
1.709647, -1.347342, 2.170765, 0, 0, 0, 1, 1,
1.725652, -0.2098779, 0.9240167, 0, 0, 0, 1, 1,
1.728759, 0.3920111, 1.861724, 0, 0, 0, 1, 1,
1.733605, 0.7551416, 1.237988, 0, 0, 0, 1, 1,
1.775611, 0.9833394, -0.9228784, 1, 1, 1, 1, 1,
1.776807, 1.192573, 0.4985476, 1, 1, 1, 1, 1,
1.789411, -0.8959584, 1.274032, 1, 1, 1, 1, 1,
1.826145, -0.1333337, 2.304099, 1, 1, 1, 1, 1,
1.837848, 0.7333768, 0.1068462, 1, 1, 1, 1, 1,
1.838003, -1.002425, 2.087154, 1, 1, 1, 1, 1,
1.845807, -1.317361, 2.062459, 1, 1, 1, 1, 1,
1.865246, 0.0668054, 0.7071185, 1, 1, 1, 1, 1,
1.870045, -0.7341746, 2.682793, 1, 1, 1, 1, 1,
1.876192, -0.2315767, -0.01911134, 1, 1, 1, 1, 1,
1.877351, 0.5756385, 1.253436, 1, 1, 1, 1, 1,
1.902321, 0.03146756, 2.933381, 1, 1, 1, 1, 1,
1.916679, -0.173569, 2.590907, 1, 1, 1, 1, 1,
1.923944, 1.416201, 1.271366, 1, 1, 1, 1, 1,
1.934177, -0.1850929, 2.081933, 1, 1, 1, 1, 1,
1.949561, -0.307588, 1.449886, 0, 0, 1, 1, 1,
1.952338, 0.1251648, 1.025019, 1, 0, 0, 1, 1,
2.00155, 0.7484239, 0.08287279, 1, 0, 0, 1, 1,
2.021229, -0.9357853, 2.425834, 1, 0, 0, 1, 1,
2.083308, 0.04059878, -1.400258, 1, 0, 0, 1, 1,
2.097307, -1.250551, 1.913987, 1, 0, 0, 1, 1,
2.119003, -1.797919, 1.035975, 0, 0, 0, 1, 1,
2.141491, 0.4123743, 1.595138, 0, 0, 0, 1, 1,
2.144197, -0.3663079, 1.672728, 0, 0, 0, 1, 1,
2.160514, -0.5168453, 2.7235, 0, 0, 0, 1, 1,
2.225045, 1.363551, 1.464066, 0, 0, 0, 1, 1,
2.250949, 0.2024744, 1.288843, 0, 0, 0, 1, 1,
2.286706, -0.8660555, 2.299356, 0, 0, 0, 1, 1,
2.28917, 1.174541, 1.166673, 1, 1, 1, 1, 1,
2.554499, 0.7772647, 2.222891, 1, 1, 1, 1, 1,
2.614339, 0.3546716, 1.28708, 1, 1, 1, 1, 1,
2.62872, -1.079226, 2.313638, 1, 1, 1, 1, 1,
2.636533, -0.6337107, 2.434159, 1, 1, 1, 1, 1,
2.660178, -0.4100965, 1.472901, 1, 1, 1, 1, 1,
2.699081, -0.153389, 0.9981575, 1, 1, 1, 1, 1
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
var radius = 9.29835;
var distance = 32.66006;
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
mvMatrix.translate( 0.3891463, 0.2316072, -0.07271934 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.66006);
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
