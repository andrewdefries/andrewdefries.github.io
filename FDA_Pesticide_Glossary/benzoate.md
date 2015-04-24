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
-3.119362, -0.9877619, -2.483725, 1, 0, 0, 1,
-2.874506, 0.7646201, -2.511384, 1, 0.007843138, 0, 1,
-2.866765, 0.9324667, 0.5968494, 1, 0.01176471, 0, 1,
-2.85807, 0.2433206, -2.941718, 1, 0.01960784, 0, 1,
-2.83641, -0.6632468, -1.628706, 1, 0.02352941, 0, 1,
-2.766611, 0.08952695, -1.610591, 1, 0.03137255, 0, 1,
-2.754832, 0.8934934, -2.861446, 1, 0.03529412, 0, 1,
-2.641329, 0.341937, -0.1353391, 1, 0.04313726, 0, 1,
-2.628827, -0.8349178, -2.194977, 1, 0.04705882, 0, 1,
-2.603154, -0.3311111, -1.276212, 1, 0.05490196, 0, 1,
-2.584954, 1.650254, -1.246882, 1, 0.05882353, 0, 1,
-2.507184, 0.9813597, -1.436891, 1, 0.06666667, 0, 1,
-2.506996, 0.5206798, 0.4386333, 1, 0.07058824, 0, 1,
-2.504707, 0.08000144, -1.093425, 1, 0.07843138, 0, 1,
-2.503077, -0.2444875, -1.316595, 1, 0.08235294, 0, 1,
-2.473699, -0.3584006, -2.021892, 1, 0.09019608, 0, 1,
-2.439242, -0.4165155, -1.417491, 1, 0.09411765, 0, 1,
-2.30942, -1.274222, -2.301161, 1, 0.1019608, 0, 1,
-2.206289, 0.5280581, -0.6814858, 1, 0.1098039, 0, 1,
-2.192574, -0.803561, -2.757579, 1, 0.1137255, 0, 1,
-2.188257, 1.694898, -0.3185957, 1, 0.1215686, 0, 1,
-2.179742, 1.362638, -1.229813, 1, 0.1254902, 0, 1,
-2.171266, -0.3925733, -2.011252, 1, 0.1333333, 0, 1,
-2.160902, 0.6788118, -2.455507, 1, 0.1372549, 0, 1,
-2.132169, 1.166479, -0.3815602, 1, 0.145098, 0, 1,
-2.067562, -0.08500414, -1.501263, 1, 0.1490196, 0, 1,
-2.06053, -0.1446203, -2.771373, 1, 0.1568628, 0, 1,
-2.028339, -1.616565, -2.80739, 1, 0.1607843, 0, 1,
-2.022071, -0.004400346, -1.915042, 1, 0.1686275, 0, 1,
-1.994329, 0.04898416, -1.767476, 1, 0.172549, 0, 1,
-1.969408, 0.2947866, -1.555697, 1, 0.1803922, 0, 1,
-1.962695, -0.58082, -1.447278, 1, 0.1843137, 0, 1,
-1.945665, 0.2888511, -0.9832634, 1, 0.1921569, 0, 1,
-1.937672, 0.9929826, -0.3014282, 1, 0.1960784, 0, 1,
-1.890614, 0.243042, -1.241715, 1, 0.2039216, 0, 1,
-1.856655, -0.7295721, -1.353948, 1, 0.2117647, 0, 1,
-1.853427, -0.08857255, -3.241781, 1, 0.2156863, 0, 1,
-1.826738, 2.189055, -1.215115, 1, 0.2235294, 0, 1,
-1.819355, 0.7766071, 0.176824, 1, 0.227451, 0, 1,
-1.817361, 1.841359, -1.731618, 1, 0.2352941, 0, 1,
-1.810144, -0.07385217, -2.005723, 1, 0.2392157, 0, 1,
-1.790317, -0.642197, -2.345052, 1, 0.2470588, 0, 1,
-1.764782, 0.228249, -1.051596, 1, 0.2509804, 0, 1,
-1.763997, 1.058293, -0.3107336, 1, 0.2588235, 0, 1,
-1.762938, -0.1657457, -0.8589675, 1, 0.2627451, 0, 1,
-1.752852, 1.759256, -0.875343, 1, 0.2705882, 0, 1,
-1.747194, -3.220745, -2.914287, 1, 0.2745098, 0, 1,
-1.743474, 0.4736116, -0.392118, 1, 0.282353, 0, 1,
-1.743326, 1.787747, -1.175461, 1, 0.2862745, 0, 1,
-1.723654, 0.08279455, -1.409254, 1, 0.2941177, 0, 1,
-1.7071, 0.1103722, -0.7837977, 1, 0.3019608, 0, 1,
-1.676978, -1.122961, -3.618168, 1, 0.3058824, 0, 1,
-1.674706, 2.006896, -1.077947, 1, 0.3137255, 0, 1,
-1.674587, 0.3634216, -1.619768, 1, 0.3176471, 0, 1,
-1.671334, -0.2487698, -0.5615002, 1, 0.3254902, 0, 1,
-1.658924, -1.82072, -2.518005, 1, 0.3294118, 0, 1,
-1.65703, 1.754246, -0.6455376, 1, 0.3372549, 0, 1,
-1.630108, -0.7334672, -3.574229, 1, 0.3411765, 0, 1,
-1.609357, 1.128619, 1.018536, 1, 0.3490196, 0, 1,
-1.598595, -0.07168493, -2.041843, 1, 0.3529412, 0, 1,
-1.595147, 0.8495547, -1.776406, 1, 0.3607843, 0, 1,
-1.593057, -0.2878487, -3.336715, 1, 0.3647059, 0, 1,
-1.587208, 0.7551302, -0.9076067, 1, 0.372549, 0, 1,
-1.579258, 0.08966973, -1.188756, 1, 0.3764706, 0, 1,
-1.578708, 0.7229771, -0.1957441, 1, 0.3843137, 0, 1,
-1.534703, -0.2824453, -1.108548, 1, 0.3882353, 0, 1,
-1.522361, 0.6611378, -1.490206, 1, 0.3960784, 0, 1,
-1.511631, 0.3986291, -0.9157124, 1, 0.4039216, 0, 1,
-1.504261, 0.2500244, -1.164065, 1, 0.4078431, 0, 1,
-1.496842, -0.9831789, -2.666275, 1, 0.4156863, 0, 1,
-1.495993, -0.7116386, -4.362579, 1, 0.4196078, 0, 1,
-1.475295, -0.7841678, -0.4730532, 1, 0.427451, 0, 1,
-1.455854, -0.1783794, -0.4167749, 1, 0.4313726, 0, 1,
-1.455356, 0.6442921, -0.02768034, 1, 0.4392157, 0, 1,
-1.451539, 0.5885599, -1.075332, 1, 0.4431373, 0, 1,
-1.43916, 0.3845393, -0.6707889, 1, 0.4509804, 0, 1,
-1.437192, -0.1327939, -1.798729, 1, 0.454902, 0, 1,
-1.43579, 1.078652, -2.309228, 1, 0.4627451, 0, 1,
-1.424514, 2.621778, -1.935481, 1, 0.4666667, 0, 1,
-1.421046, -1.602953, -1.762666, 1, 0.4745098, 0, 1,
-1.391671, -0.4135807, -3.278691, 1, 0.4784314, 0, 1,
-1.387643, 0.2387721, 0.1019649, 1, 0.4862745, 0, 1,
-1.380897, -0.209364, -1.199182, 1, 0.4901961, 0, 1,
-1.378473, -1.365675, -3.405422, 1, 0.4980392, 0, 1,
-1.367026, -0.4661796, -0.9367753, 1, 0.5058824, 0, 1,
-1.362496, 0.306273, -1.309599, 1, 0.509804, 0, 1,
-1.358239, -1.264947, -2.930398, 1, 0.5176471, 0, 1,
-1.355613, -0.5015523, -1.496732, 1, 0.5215687, 0, 1,
-1.353776, 0.4451211, -2.213275, 1, 0.5294118, 0, 1,
-1.340251, 0.1320411, -2.353359, 1, 0.5333334, 0, 1,
-1.339462, -0.4322702, -3.555748, 1, 0.5411765, 0, 1,
-1.328234, -0.08454757, 0.2657863, 1, 0.5450981, 0, 1,
-1.32432, -0.1263788, -0.9726189, 1, 0.5529412, 0, 1,
-1.322333, 2.1637, -2.699688, 1, 0.5568628, 0, 1,
-1.322326, -0.4612441, -0.4898123, 1, 0.5647059, 0, 1,
-1.30989, -0.2836735, -2.347218, 1, 0.5686275, 0, 1,
-1.305392, 0.8830698, -1.701541, 1, 0.5764706, 0, 1,
-1.293938, 1.903008, -0.4706276, 1, 0.5803922, 0, 1,
-1.28986, 2.344639, 0.2889547, 1, 0.5882353, 0, 1,
-1.282767, 0.7825948, 0.5217568, 1, 0.5921569, 0, 1,
-1.251806, 0.9288611, -2.67696, 1, 0.6, 0, 1,
-1.251089, 0.7394637, -2.136777, 1, 0.6078432, 0, 1,
-1.249452, -0.8136603, -0.2560741, 1, 0.6117647, 0, 1,
-1.242593, -0.4650777, -2.233863, 1, 0.6196079, 0, 1,
-1.234276, 0.60345, -1.758345, 1, 0.6235294, 0, 1,
-1.209059, -0.4737593, -3.836887, 1, 0.6313726, 0, 1,
-1.208837, -0.7345488, -1.877159, 1, 0.6352941, 0, 1,
-1.206687, 1.137119, -0.3280655, 1, 0.6431373, 0, 1,
-1.202604, -0.9093874, -3.362994, 1, 0.6470588, 0, 1,
-1.198754, 0.664308, -1.542301, 1, 0.654902, 0, 1,
-1.196869, 0.5316461, -0.9633532, 1, 0.6588235, 0, 1,
-1.192828, 0.3767552, -0.6805923, 1, 0.6666667, 0, 1,
-1.191671, -0.9913346, -1.644096, 1, 0.6705883, 0, 1,
-1.189035, 0.7871153, -0.8868166, 1, 0.6784314, 0, 1,
-1.174116, 1.631824, -0.3379376, 1, 0.682353, 0, 1,
-1.15788, -2.043968, -1.984012, 1, 0.6901961, 0, 1,
-1.147683, -0.73046, -1.509415, 1, 0.6941177, 0, 1,
-1.144936, 1.355519, -0.03817225, 1, 0.7019608, 0, 1,
-1.128803, -0.5214318, -1.351182, 1, 0.7098039, 0, 1,
-1.126703, -0.4661158, -2.270995, 1, 0.7137255, 0, 1,
-1.114902, -1.578701, -2.6632, 1, 0.7215686, 0, 1,
-1.114101, -1.033575, -2.710671, 1, 0.7254902, 0, 1,
-1.111911, 1.009532, -3.877135, 1, 0.7333333, 0, 1,
-1.111014, 0.01922717, -3.043914, 1, 0.7372549, 0, 1,
-1.100933, 1.494633, -0.6995059, 1, 0.7450981, 0, 1,
-1.097739, -0.178961, -0.1010899, 1, 0.7490196, 0, 1,
-1.092768, 1.648263, -0.3472373, 1, 0.7568628, 0, 1,
-1.088557, 0.8522595, -0.6127843, 1, 0.7607843, 0, 1,
-1.08568, -0.5753496, 0.21095, 1, 0.7686275, 0, 1,
-1.077713, 0.128538, 1.533342, 1, 0.772549, 0, 1,
-1.075142, -1.29631, -2.788861, 1, 0.7803922, 0, 1,
-1.07187, -0.4036914, -2.450874, 1, 0.7843137, 0, 1,
-1.050668, -0.590617, -4.432141, 1, 0.7921569, 0, 1,
-1.049902, 0.8247124, -1.653705, 1, 0.7960784, 0, 1,
-1.047376, 0.6145962, -1.955508, 1, 0.8039216, 0, 1,
-1.044203, 0.372995, -1.178064, 1, 0.8117647, 0, 1,
-1.037541, 0.2969934, -0.5601707, 1, 0.8156863, 0, 1,
-1.03667, 0.1321658, -1.505217, 1, 0.8235294, 0, 1,
-1.035239, 1.010152, -0.9056575, 1, 0.827451, 0, 1,
-1.03241, 1.547905, -1.533859, 1, 0.8352941, 0, 1,
-1.030403, 1.01556, -0.6887072, 1, 0.8392157, 0, 1,
-1.025114, 1.089392, 1.73463, 1, 0.8470588, 0, 1,
-1.023949, 0.1312933, -1.375361, 1, 0.8509804, 0, 1,
-1.021951, -0.3148074, -2.314449, 1, 0.8588235, 0, 1,
-1.021536, -1.802478, -1.943752, 1, 0.8627451, 0, 1,
-1.020584, 0.8945982, -0.3316028, 1, 0.8705882, 0, 1,
-1.018129, -0.7635741, -1.117101, 1, 0.8745098, 0, 1,
-1.002583, -1.17318, -2.704598, 1, 0.8823529, 0, 1,
-0.9997874, 0.2859218, 0.5142146, 1, 0.8862745, 0, 1,
-0.9992217, 0.648412, -1.384342, 1, 0.8941177, 0, 1,
-0.9889079, 0.2738487, -0.3897074, 1, 0.8980392, 0, 1,
-0.9829241, -0.1487104, -1.415275, 1, 0.9058824, 0, 1,
-0.9744468, -0.09349004, -1.927224, 1, 0.9137255, 0, 1,
-0.9726104, 0.1590036, -2.623415, 1, 0.9176471, 0, 1,
-0.9697516, -0.335299, -2.159249, 1, 0.9254902, 0, 1,
-0.9639235, 0.5475789, -1.37809, 1, 0.9294118, 0, 1,
-0.9626842, 0.6533707, -0.8498581, 1, 0.9372549, 0, 1,
-0.962547, -1.447133, -1.994339, 1, 0.9411765, 0, 1,
-0.9555328, -0.7065852, -1.967832, 1, 0.9490196, 0, 1,
-0.9529192, 0.2337802, -1.867385, 1, 0.9529412, 0, 1,
-0.9489272, 1.215957, 0.184144, 1, 0.9607843, 0, 1,
-0.9467612, 0.4790765, -1.146768, 1, 0.9647059, 0, 1,
-0.9462658, -0.856602, -2.460294, 1, 0.972549, 0, 1,
-0.9433566, 0.474159, -0.2027465, 1, 0.9764706, 0, 1,
-0.9289293, 2.111479, -0.5303664, 1, 0.9843137, 0, 1,
-0.9252328, -0.5623162, -2.508464, 1, 0.9882353, 0, 1,
-0.9208283, -0.9590524, -4.326328, 1, 0.9960784, 0, 1,
-0.9200398, 0.03911844, -2.697331, 0.9960784, 1, 0, 1,
-0.9172841, -0.3859659, -2.74725, 0.9921569, 1, 0, 1,
-0.9107994, -0.3048027, -1.152326, 0.9843137, 1, 0, 1,
-0.9065384, -0.113255, -2.252285, 0.9803922, 1, 0, 1,
-0.9030386, -1.198548, -0.727289, 0.972549, 1, 0, 1,
-0.9025556, 3.030221, -1.06169, 0.9686275, 1, 0, 1,
-0.8997334, 0.8690294, 0.07616876, 0.9607843, 1, 0, 1,
-0.8922971, 0.8643899, -1.3609, 0.9568627, 1, 0, 1,
-0.8916953, 0.358793, -2.159781, 0.9490196, 1, 0, 1,
-0.8825693, -0.4755003, -1.93615, 0.945098, 1, 0, 1,
-0.8810349, -0.2561871, -2.076821, 0.9372549, 1, 0, 1,
-0.8782727, -0.725012, -3.262071, 0.9333333, 1, 0, 1,
-0.8748183, -0.8032475, -3.592998, 0.9254902, 1, 0, 1,
-0.8747498, 1.239783, 0.4946477, 0.9215686, 1, 0, 1,
-0.8741592, -1.134975, -1.817192, 0.9137255, 1, 0, 1,
-0.8733636, 0.0333754, -2.794285, 0.9098039, 1, 0, 1,
-0.8718278, 1.036851, -0.4246231, 0.9019608, 1, 0, 1,
-0.8648902, 1.697108, -0.2586515, 0.8941177, 1, 0, 1,
-0.8615412, 0.2504547, -2.977692, 0.8901961, 1, 0, 1,
-0.8568056, -1.066915, -3.772386, 0.8823529, 1, 0, 1,
-0.8566254, 0.39017, -1.050545, 0.8784314, 1, 0, 1,
-0.8522471, -2.024459, -2.528478, 0.8705882, 1, 0, 1,
-0.8510656, -0.5720053, -2.906215, 0.8666667, 1, 0, 1,
-0.8466676, 0.5363809, 0.3819912, 0.8588235, 1, 0, 1,
-0.8444801, -0.6624532, -0.1338391, 0.854902, 1, 0, 1,
-0.8436303, -1.504595, -3.992251, 0.8470588, 1, 0, 1,
-0.841937, 0.1319571, -1.533682, 0.8431373, 1, 0, 1,
-0.8366833, -0.5255818, -1.661678, 0.8352941, 1, 0, 1,
-0.8342611, 0.009652578, -2.191015, 0.8313726, 1, 0, 1,
-0.8331774, -0.3353654, -0.5839849, 0.8235294, 1, 0, 1,
-0.8322197, -0.1409501, -3.883525, 0.8196079, 1, 0, 1,
-0.8273082, -0.22359, -0.7631335, 0.8117647, 1, 0, 1,
-0.824892, 0.3591124, 0.6378015, 0.8078431, 1, 0, 1,
-0.8216876, -0.2270287, -2.766423, 0.8, 1, 0, 1,
-0.8209677, 0.1868542, -2.255038, 0.7921569, 1, 0, 1,
-0.8207305, 0.1731875, -0.6829688, 0.7882353, 1, 0, 1,
-0.819409, -0.5649346, -3.422863, 0.7803922, 1, 0, 1,
-0.8174692, 0.3700874, -0.4184814, 0.7764706, 1, 0, 1,
-0.8163147, 2.416636, -0.1472557, 0.7686275, 1, 0, 1,
-0.8162349, 1.056342, -3.006401, 0.7647059, 1, 0, 1,
-0.8140165, -1.217578, -2.773143, 0.7568628, 1, 0, 1,
-0.8119496, -0.1967251, -3.161366, 0.7529412, 1, 0, 1,
-0.811632, 0.5631983, -0.5142667, 0.7450981, 1, 0, 1,
-0.8106967, -0.2516467, -1.402131, 0.7411765, 1, 0, 1,
-0.7985045, 0.06317124, -1.345297, 0.7333333, 1, 0, 1,
-0.7958692, 0.089429, -1.077788, 0.7294118, 1, 0, 1,
-0.7933221, 1.04252, -0.6266015, 0.7215686, 1, 0, 1,
-0.7884369, 0.5900082, -0.4993316, 0.7176471, 1, 0, 1,
-0.7870636, 0.3568066, -2.294343, 0.7098039, 1, 0, 1,
-0.7844847, -0.5050489, -1.379256, 0.7058824, 1, 0, 1,
-0.783743, 0.6487569, -0.7843592, 0.6980392, 1, 0, 1,
-0.7835993, -0.6535257, -0.6667163, 0.6901961, 1, 0, 1,
-0.778737, 0.7505488, -1.673295, 0.6862745, 1, 0, 1,
-0.7716339, -0.5274663, -3.026375, 0.6784314, 1, 0, 1,
-0.7678311, -0.2279648, -1.864683, 0.6745098, 1, 0, 1,
-0.766597, -0.01585701, -0.4176994, 0.6666667, 1, 0, 1,
-0.7649726, -1.032516, -1.715955, 0.6627451, 1, 0, 1,
-0.7645063, 0.8329409, -0.114102, 0.654902, 1, 0, 1,
-0.7626953, -0.6006588, -3.726943, 0.6509804, 1, 0, 1,
-0.7587595, -1.403177, -3.14021, 0.6431373, 1, 0, 1,
-0.7577815, 0.5166721, -1.707745, 0.6392157, 1, 0, 1,
-0.7571578, 1.244286, 1.265281, 0.6313726, 1, 0, 1,
-0.7561658, 0.8818157, -0.2274949, 0.627451, 1, 0, 1,
-0.7510616, -0.8629468, -1.797012, 0.6196079, 1, 0, 1,
-0.7475795, 0.8402553, 2.160016, 0.6156863, 1, 0, 1,
-0.7427812, -1.858234, -1.545967, 0.6078432, 1, 0, 1,
-0.7388049, 0.005656213, -0.4139274, 0.6039216, 1, 0, 1,
-0.738598, -1.338369, -1.001798, 0.5960785, 1, 0, 1,
-0.7346835, -0.7853792, -1.536621, 0.5882353, 1, 0, 1,
-0.726886, 0.2607694, -1.865778, 0.5843138, 1, 0, 1,
-0.7258217, -0.2934578, -2.009797, 0.5764706, 1, 0, 1,
-0.7206743, -0.6131905, -3.496833, 0.572549, 1, 0, 1,
-0.7204804, -1.057345, -2.280842, 0.5647059, 1, 0, 1,
-0.7189292, -0.9810125, -4.374233, 0.5607843, 1, 0, 1,
-0.7162759, 0.2483688, -2.162093, 0.5529412, 1, 0, 1,
-0.7158024, -1.342517, -3.376489, 0.5490196, 1, 0, 1,
-0.7068542, 2.609475, 0.7453977, 0.5411765, 1, 0, 1,
-0.7026063, -0.9846973, -2.898938, 0.5372549, 1, 0, 1,
-0.7016162, 0.4992337, -2.015212, 0.5294118, 1, 0, 1,
-0.7009939, -0.6519786, -4.347147, 0.5254902, 1, 0, 1,
-0.6986154, 1.894232, 0.8195453, 0.5176471, 1, 0, 1,
-0.6978339, -0.8154508, -2.955665, 0.5137255, 1, 0, 1,
-0.6952901, -1.315098, -2.771608, 0.5058824, 1, 0, 1,
-0.6924844, -1.286772, -3.468074, 0.5019608, 1, 0, 1,
-0.6754416, -0.301527, -2.048643, 0.4941176, 1, 0, 1,
-0.6731675, 0.3637693, -1.094714, 0.4862745, 1, 0, 1,
-0.6729608, 0.902787, 0.8087209, 0.4823529, 1, 0, 1,
-0.6643055, -0.1431118, 0.3174331, 0.4745098, 1, 0, 1,
-0.6636167, 0.03197606, -1.190163, 0.4705882, 1, 0, 1,
-0.6587339, -0.5886968, -1.250144, 0.4627451, 1, 0, 1,
-0.6555443, -1.55369, -3.284825, 0.4588235, 1, 0, 1,
-0.6551622, -1.782882, -2.997515, 0.4509804, 1, 0, 1,
-0.6503108, -0.2729763, -0.9826425, 0.4470588, 1, 0, 1,
-0.6497725, -0.8963909, -2.940949, 0.4392157, 1, 0, 1,
-0.6496603, 1.000801, -1.141353, 0.4352941, 1, 0, 1,
-0.6481277, 0.4264353, -1.575153, 0.427451, 1, 0, 1,
-0.6469443, 0.007637576, -2.316441, 0.4235294, 1, 0, 1,
-0.6466814, 1.430877, -0.3466449, 0.4156863, 1, 0, 1,
-0.6462445, 0.6931016, -1.042848, 0.4117647, 1, 0, 1,
-0.643952, -1.89726, -2.120985, 0.4039216, 1, 0, 1,
-0.6438412, 0.5441067, -0.1698833, 0.3960784, 1, 0, 1,
-0.6434392, -0.487343, -1.819579, 0.3921569, 1, 0, 1,
-0.6423005, 2.601323, -1.648208, 0.3843137, 1, 0, 1,
-0.6404089, 0.199511, -2.71131, 0.3803922, 1, 0, 1,
-0.6300847, 1.496098, 0.6927229, 0.372549, 1, 0, 1,
-0.6266059, -2.792073, -1.71845, 0.3686275, 1, 0, 1,
-0.6230702, 0.6670156, 0.004301753, 0.3607843, 1, 0, 1,
-0.6222267, 1.037776, -1.660686, 0.3568628, 1, 0, 1,
-0.6214578, -0.1004116, -2.120725, 0.3490196, 1, 0, 1,
-0.6187832, -0.6887345, -2.50297, 0.345098, 1, 0, 1,
-0.6168466, 0.5264512, 0.03604788, 0.3372549, 1, 0, 1,
-0.6159465, 0.2897027, -0.754802, 0.3333333, 1, 0, 1,
-0.6129343, -1.526736, -1.491093, 0.3254902, 1, 0, 1,
-0.6105785, 0.8524501, -0.9172128, 0.3215686, 1, 0, 1,
-0.6095886, 0.8133565, -0.6717654, 0.3137255, 1, 0, 1,
-0.6090549, 1.022802, 0.8054924, 0.3098039, 1, 0, 1,
-0.6073335, 0.7161424, -1.865873, 0.3019608, 1, 0, 1,
-0.6058112, 1.744404, -0.8573329, 0.2941177, 1, 0, 1,
-0.6026101, 0.05817861, -0.645584, 0.2901961, 1, 0, 1,
-0.5973453, 0.2259651, -0.2202088, 0.282353, 1, 0, 1,
-0.5941433, -0.9735836, -1.101883, 0.2784314, 1, 0, 1,
-0.5939538, -1.489637, -3.456142, 0.2705882, 1, 0, 1,
-0.5938007, 0.1727637, -1.380217, 0.2666667, 1, 0, 1,
-0.5886326, 0.4371156, -2.138698, 0.2588235, 1, 0, 1,
-0.5876777, 1.147413, 0.698826, 0.254902, 1, 0, 1,
-0.586642, -0.3513143, -3.705899, 0.2470588, 1, 0, 1,
-0.5852324, -1.197528, -1.706386, 0.2431373, 1, 0, 1,
-0.5849174, -1.286452, -4.236805, 0.2352941, 1, 0, 1,
-0.5837225, 1.498594, -0.3552531, 0.2313726, 1, 0, 1,
-0.5822666, 0.1111387, -2.015977, 0.2235294, 1, 0, 1,
-0.5803072, -1.563761, -2.871022, 0.2196078, 1, 0, 1,
-0.5757574, -1.462629, -1.232068, 0.2117647, 1, 0, 1,
-0.5755377, 0.9937098, -1.438753, 0.2078431, 1, 0, 1,
-0.5753908, -0.4930746, -2.961724, 0.2, 1, 0, 1,
-0.5694331, 0.06626974, 0.7059313, 0.1921569, 1, 0, 1,
-0.5691576, 0.4919717, 0.2096256, 0.1882353, 1, 0, 1,
-0.5658035, 0.02747693, -0.9438038, 0.1803922, 1, 0, 1,
-0.5583302, -1.297769, -4.042838, 0.1764706, 1, 0, 1,
-0.5557036, -0.272709, -2.847847, 0.1686275, 1, 0, 1,
-0.5533645, 1.050625, 0.1270995, 0.1647059, 1, 0, 1,
-0.5518616, 0.4503301, -1.305753, 0.1568628, 1, 0, 1,
-0.5453775, 0.2445526, -2.012233, 0.1529412, 1, 0, 1,
-0.5424318, -0.5921452, -2.111547, 0.145098, 1, 0, 1,
-0.5420136, 0.0525268, -2.831778, 0.1411765, 1, 0, 1,
-0.5410143, 0.2199367, -1.981108, 0.1333333, 1, 0, 1,
-0.5378811, 0.2635047, 0.01010885, 0.1294118, 1, 0, 1,
-0.5364174, 1.850295, -1.654334, 0.1215686, 1, 0, 1,
-0.5362434, 0.7458769, -1.535524, 0.1176471, 1, 0, 1,
-0.5296042, 0.3424977, -1.308397, 0.1098039, 1, 0, 1,
-0.5230426, -0.3851976, -3.28503, 0.1058824, 1, 0, 1,
-0.5218136, -0.5307373, -3.721632, 0.09803922, 1, 0, 1,
-0.5204037, 0.9922881, -0.01225416, 0.09019608, 1, 0, 1,
-0.5199265, 0.5528545, -0.3514878, 0.08627451, 1, 0, 1,
-0.5183095, 0.9819828, -0.6101825, 0.07843138, 1, 0, 1,
-0.5135098, 0.3578525, -2.360785, 0.07450981, 1, 0, 1,
-0.5119521, 0.2178681, -2.800592, 0.06666667, 1, 0, 1,
-0.507969, 0.7056526, -0.7354973, 0.0627451, 1, 0, 1,
-0.5059359, -0.285538, -1.047591, 0.05490196, 1, 0, 1,
-0.5019461, 0.7878175, -0.5826188, 0.05098039, 1, 0, 1,
-0.4950782, 0.8372881, -0.911328, 0.04313726, 1, 0, 1,
-0.4934231, 0.9324445, -1.355584, 0.03921569, 1, 0, 1,
-0.4917099, -0.05151756, -2.250844, 0.03137255, 1, 0, 1,
-0.4885768, 0.2645078, 0.4438791, 0.02745098, 1, 0, 1,
-0.4818663, 1.034283, -1.900724, 0.01960784, 1, 0, 1,
-0.4799985, 1.45902, 0.1300311, 0.01568628, 1, 0, 1,
-0.4764302, -0.72678, -4.209366, 0.007843138, 1, 0, 1,
-0.4739134, 1.288759, -0.7546432, 0.003921569, 1, 0, 1,
-0.472128, -0.3209883, -3.039882, 0, 1, 0.003921569, 1,
-0.4717872, 0.1027183, -0.3874227, 0, 1, 0.01176471, 1,
-0.4691221, 1.853463, -0.01614639, 0, 1, 0.01568628, 1,
-0.467293, 1.062147, -0.6630901, 0, 1, 0.02352941, 1,
-0.4647034, 1.541559, -0.5797044, 0, 1, 0.02745098, 1,
-0.4642155, 0.5050717, -1.060189, 0, 1, 0.03529412, 1,
-0.4616531, 0.1323995, -1.02185, 0, 1, 0.03921569, 1,
-0.4606199, 0.1408517, -1.573856, 0, 1, 0.04705882, 1,
-0.460141, -1.173438, -3.894081, 0, 1, 0.05098039, 1,
-0.4567387, 1.651951, 0.1794294, 0, 1, 0.05882353, 1,
-0.4516107, 1.205065, -0.1508613, 0, 1, 0.0627451, 1,
-0.4465543, 1.208206, 0.3897695, 0, 1, 0.07058824, 1,
-0.4452989, 1.337633, 0.8959054, 0, 1, 0.07450981, 1,
-0.4407757, -0.8552855, -1.862691, 0, 1, 0.08235294, 1,
-0.4385897, 0.9443235, -0.366051, 0, 1, 0.08627451, 1,
-0.4360811, -1.786701, -2.503275, 0, 1, 0.09411765, 1,
-0.4351974, 0.9633361, 1.62129, 0, 1, 0.1019608, 1,
-0.4343635, 0.6162946, 0.3053973, 0, 1, 0.1058824, 1,
-0.4333938, 0.3054626, -1.119363, 0, 1, 0.1137255, 1,
-0.4310858, -0.2036095, -1.202683, 0, 1, 0.1176471, 1,
-0.4263635, -1.947328, -3.186239, 0, 1, 0.1254902, 1,
-0.4237764, 0.8548853, -1.285911, 0, 1, 0.1294118, 1,
-0.4196054, -0.9054598, -3.155908, 0, 1, 0.1372549, 1,
-0.4180001, -1.344108, -1.013585, 0, 1, 0.1411765, 1,
-0.4158035, 0.6076248, 0.1687371, 0, 1, 0.1490196, 1,
-0.410301, -0.03830064, -1.30762, 0, 1, 0.1529412, 1,
-0.4091014, 0.4765507, 1.064188, 0, 1, 0.1607843, 1,
-0.4087604, -1.130663, -3.125167, 0, 1, 0.1647059, 1,
-0.4031495, 0.1676075, -0.8455104, 0, 1, 0.172549, 1,
-0.4029319, -0.3616169, -2.745529, 0, 1, 0.1764706, 1,
-0.3957793, 0.02447343, -0.8498541, 0, 1, 0.1843137, 1,
-0.3954341, 0.2721625, -1.310114, 0, 1, 0.1882353, 1,
-0.3941141, 0.151562, -2.130299, 0, 1, 0.1960784, 1,
-0.3920725, 0.3443152, -0.1698368, 0, 1, 0.2039216, 1,
-0.391258, 1.036096, -1.527392, 0, 1, 0.2078431, 1,
-0.3893892, 0.152924, -2.352816, 0, 1, 0.2156863, 1,
-0.3860997, 1.082606, 0.8482614, 0, 1, 0.2196078, 1,
-0.3824755, 0.4612615, 0.05078581, 0, 1, 0.227451, 1,
-0.381925, 2.108487, -0.7314596, 0, 1, 0.2313726, 1,
-0.3817136, 0.2037827, -1.344447, 0, 1, 0.2392157, 1,
-0.3809718, 2.47259, 0.3724673, 0, 1, 0.2431373, 1,
-0.3797754, 1.432114, -0.5184187, 0, 1, 0.2509804, 1,
-0.3788208, 0.5925457, -1.795754, 0, 1, 0.254902, 1,
-0.3782081, 0.416421, -1.300911, 0, 1, 0.2627451, 1,
-0.3768722, 0.4404019, -1.549276, 0, 1, 0.2666667, 1,
-0.3767336, 0.5894493, -1.139952, 0, 1, 0.2745098, 1,
-0.3730978, 1.297696, -1.045891, 0, 1, 0.2784314, 1,
-0.3723796, 0.8109956, 0.008053221, 0, 1, 0.2862745, 1,
-0.3711123, -1.562447, -3.313683, 0, 1, 0.2901961, 1,
-0.36898, -0.5674375, -3.208078, 0, 1, 0.2980392, 1,
-0.3632449, -0.05453981, -1.524669, 0, 1, 0.3058824, 1,
-0.3593223, -0.2720329, -2.204994, 0, 1, 0.3098039, 1,
-0.3592533, 1.454581, -0.9022608, 0, 1, 0.3176471, 1,
-0.3525371, -0.3740517, -3.27821, 0, 1, 0.3215686, 1,
-0.3521162, -0.5848092, -3.551988, 0, 1, 0.3294118, 1,
-0.351027, 0.5662346, -1.460945, 0, 1, 0.3333333, 1,
-0.3423013, 0.3152312, -1.052221, 0, 1, 0.3411765, 1,
-0.3390629, -0.2608741, -2.073426, 0, 1, 0.345098, 1,
-0.3286592, -1.775711, -3.106428, 0, 1, 0.3529412, 1,
-0.3251395, 0.5159792, -0.3291422, 0, 1, 0.3568628, 1,
-0.3246342, -0.4704176, -2.683383, 0, 1, 0.3647059, 1,
-0.32329, -0.09186424, -3.05578, 0, 1, 0.3686275, 1,
-0.3186577, -0.8296555, -3.496162, 0, 1, 0.3764706, 1,
-0.3158132, 0.2111049, -0.6136532, 0, 1, 0.3803922, 1,
-0.3097589, 0.7895041, -0.6461087, 0, 1, 0.3882353, 1,
-0.3051448, -0.9049538, -3.998179, 0, 1, 0.3921569, 1,
-0.3049723, 0.9252837, -1.771813, 0, 1, 0.4, 1,
-0.3009575, -0.1568528, -1.60635, 0, 1, 0.4078431, 1,
-0.3002249, 0.8069291, -1.072627, 0, 1, 0.4117647, 1,
-0.2985924, -1.747966, -2.6333, 0, 1, 0.4196078, 1,
-0.2899823, 1.507736, 0.232675, 0, 1, 0.4235294, 1,
-0.2895248, -0.09768777, -0.4222102, 0, 1, 0.4313726, 1,
-0.2884469, -1.671325, -4.482534, 0, 1, 0.4352941, 1,
-0.2850272, -0.572872, -1.95768, 0, 1, 0.4431373, 1,
-0.2802831, -0.5415124, -2.602655, 0, 1, 0.4470588, 1,
-0.276646, 1.588102, 0.0853745, 0, 1, 0.454902, 1,
-0.2753327, -0.2921655, -3.435012, 0, 1, 0.4588235, 1,
-0.2733181, 0.2297649, -0.1105338, 0, 1, 0.4666667, 1,
-0.2663493, -1.002363, -1.58108, 0, 1, 0.4705882, 1,
-0.265467, -0.4113984, -3.513693, 0, 1, 0.4784314, 1,
-0.2654305, -0.6949092, -1.620436, 0, 1, 0.4823529, 1,
-0.263171, 0.2506541, -3.198533, 0, 1, 0.4901961, 1,
-0.2625428, -0.3726599, -5.414548, 0, 1, 0.4941176, 1,
-0.2577989, -0.2206927, -1.870357, 0, 1, 0.5019608, 1,
-0.2531399, -3.366408, -3.64045, 0, 1, 0.509804, 1,
-0.2509151, -2.246379, -1.724779, 0, 1, 0.5137255, 1,
-0.2506315, 0.2420039, 0.1590049, 0, 1, 0.5215687, 1,
-0.2497967, -1.853095, -3.094324, 0, 1, 0.5254902, 1,
-0.2471664, 0.4209442, 0.8454059, 0, 1, 0.5333334, 1,
-0.2454179, 0.305414, -0.6516966, 0, 1, 0.5372549, 1,
-0.239246, 0.4844261, -0.7367759, 0, 1, 0.5450981, 1,
-0.2384624, -0.8243811, -2.356522, 0, 1, 0.5490196, 1,
-0.2374729, 0.3818268, 0.6890135, 0, 1, 0.5568628, 1,
-0.2365959, 1.435838, -2.392683, 0, 1, 0.5607843, 1,
-0.2248689, -0.5762582, -2.026308, 0, 1, 0.5686275, 1,
-0.2239458, 1.478076, -0.9177988, 0, 1, 0.572549, 1,
-0.2239322, -1.279571, -3.101631, 0, 1, 0.5803922, 1,
-0.222065, -0.9402601, -3.130661, 0, 1, 0.5843138, 1,
-0.2184364, -1.344394, -1.289886, 0, 1, 0.5921569, 1,
-0.2155409, -0.3549728, -0.8103309, 0, 1, 0.5960785, 1,
-0.212705, -1.05861, -3.56444, 0, 1, 0.6039216, 1,
-0.2055304, -0.5680401, -2.621828, 0, 1, 0.6117647, 1,
-0.2006427, 0.7075729, 2.407766, 0, 1, 0.6156863, 1,
-0.1966608, -0.3724482, -5.187025, 0, 1, 0.6235294, 1,
-0.1961306, 1.339389, 0.1776132, 0, 1, 0.627451, 1,
-0.1923656, 0.6122476, -0.8311028, 0, 1, 0.6352941, 1,
-0.1871281, -0.3694725, -4.497376, 0, 1, 0.6392157, 1,
-0.1855934, -0.971661, -2.75161, 0, 1, 0.6470588, 1,
-0.1849438, -0.1892781, -2.990576, 0, 1, 0.6509804, 1,
-0.179672, 0.6802857, 0.3988838, 0, 1, 0.6588235, 1,
-0.1793391, 1.307458, -1.924198, 0, 1, 0.6627451, 1,
-0.1786798, -1.065415, -3.986451, 0, 1, 0.6705883, 1,
-0.1767893, -0.09753402, -3.675586, 0, 1, 0.6745098, 1,
-0.1728697, -1.112037, -2.701072, 0, 1, 0.682353, 1,
-0.1705905, 0.3181386, 0.5745847, 0, 1, 0.6862745, 1,
-0.1678017, -0.5391673, -5.057059, 0, 1, 0.6941177, 1,
-0.1657755, 1.649081, -0.9667767, 0, 1, 0.7019608, 1,
-0.1641815, -2.116023, -3.880408, 0, 1, 0.7058824, 1,
-0.1627571, 0.5988356, 0.7375396, 0, 1, 0.7137255, 1,
-0.1561061, -2.861908, -2.314133, 0, 1, 0.7176471, 1,
-0.1557603, -1.059178, -2.992352, 0, 1, 0.7254902, 1,
-0.1539889, 1.177273, 1.120593, 0, 1, 0.7294118, 1,
-0.1506321, 0.374895, -0.07819334, 0, 1, 0.7372549, 1,
-0.1486239, -0.7046432, -1.513198, 0, 1, 0.7411765, 1,
-0.148283, -0.2775607, -3.955886, 0, 1, 0.7490196, 1,
-0.1476523, -0.1904808, -2.474596, 0, 1, 0.7529412, 1,
-0.1462274, -0.6567922, -3.093212, 0, 1, 0.7607843, 1,
-0.1410726, -1.316412, -1.866832, 0, 1, 0.7647059, 1,
-0.1409473, 0.1266846, -0.9494875, 0, 1, 0.772549, 1,
-0.1326602, -0.4061951, -3.428111, 0, 1, 0.7764706, 1,
-0.132506, -0.5301128, -3.415796, 0, 1, 0.7843137, 1,
-0.131263, -0.4386809, -3.169259, 0, 1, 0.7882353, 1,
-0.130684, 0.2980613, -1.204051, 0, 1, 0.7960784, 1,
-0.1296156, 0.3482002, -0.4951529, 0, 1, 0.8039216, 1,
-0.1236109, 0.3405973, -2.297272, 0, 1, 0.8078431, 1,
-0.1234659, -1.605164, -0.986082, 0, 1, 0.8156863, 1,
-0.1227396, -0.7109812, -2.379704, 0, 1, 0.8196079, 1,
-0.117623, -0.0982735, -1.33418, 0, 1, 0.827451, 1,
-0.1128028, -0.9067259, -3.308068, 0, 1, 0.8313726, 1,
-0.1100418, 1.066877, -0.3038565, 0, 1, 0.8392157, 1,
-0.1074942, 1.020483, -0.4513976, 0, 1, 0.8431373, 1,
-0.1061704, 0.863396, -1.376283, 0, 1, 0.8509804, 1,
-0.09949399, -0.5922866, -3.849628, 0, 1, 0.854902, 1,
-0.09493798, -0.2613983, -2.312333, 0, 1, 0.8627451, 1,
-0.09351033, -0.237589, -3.791026, 0, 1, 0.8666667, 1,
-0.09284056, 0.7519546, 0.9414996, 0, 1, 0.8745098, 1,
-0.09167536, 1.441986, 0.859298, 0, 1, 0.8784314, 1,
-0.0880302, -0.2638934, -2.073245, 0, 1, 0.8862745, 1,
-0.08301418, -0.4668195, -0.6228728, 0, 1, 0.8901961, 1,
-0.08300649, -0.1053511, -1.095146, 0, 1, 0.8980392, 1,
-0.07610091, -0.03862271, -2.783998, 0, 1, 0.9058824, 1,
-0.07467905, 0.6332877, -0.01471625, 0, 1, 0.9098039, 1,
-0.07251264, 0.6018162, 1.056036, 0, 1, 0.9176471, 1,
-0.07155504, -0.2130349, -3.880577, 0, 1, 0.9215686, 1,
-0.071417, 0.3054614, 0.5532844, 0, 1, 0.9294118, 1,
-0.0704705, 0.1622994, -0.6364095, 0, 1, 0.9333333, 1,
-0.06732742, 0.3262572, -0.7647958, 0, 1, 0.9411765, 1,
-0.06619859, 1.397818, 2.162756, 0, 1, 0.945098, 1,
-0.05741488, 0.5104666, 0.9551662, 0, 1, 0.9529412, 1,
-0.05238454, 0.8738188, 0.6833128, 0, 1, 0.9568627, 1,
-0.05176784, 0.12573, 0.3223563, 0, 1, 0.9647059, 1,
-0.04964695, 0.557904, -0.1871048, 0, 1, 0.9686275, 1,
-0.04783136, 0.7660069, 0.2486745, 0, 1, 0.9764706, 1,
-0.04570257, 1.482294, -1.71358, 0, 1, 0.9803922, 1,
-0.03620556, -1.509605, -1.583382, 0, 1, 0.9882353, 1,
-0.03443467, -1.46541, -4.188277, 0, 1, 0.9921569, 1,
-0.03396061, -1.377822, -2.638755, 0, 1, 1, 1,
-0.03395666, 1.38772, 0.7162347, 0, 0.9921569, 1, 1,
-0.03023069, 1.63881, 1.195921, 0, 0.9882353, 1, 1,
-0.02992877, -2.482334, -3.646275, 0, 0.9803922, 1, 1,
-0.02922901, 1.322821, -1.041256, 0, 0.9764706, 1, 1,
-0.02708121, -1.012697, -3.700486, 0, 0.9686275, 1, 1,
-0.02546057, -0.5682564, -2.500602, 0, 0.9647059, 1, 1,
-0.02196913, -0.1995309, -3.99294, 0, 0.9568627, 1, 1,
-0.01856095, 0.4602431, 1.998361, 0, 0.9529412, 1, 1,
-0.01803749, 0.07275978, -0.7295015, 0, 0.945098, 1, 1,
-0.01772011, 0.5336018, 0.418177, 0, 0.9411765, 1, 1,
-0.01357999, -1.297914, -2.471829, 0, 0.9333333, 1, 1,
-0.01105546, -1.045673, -0.5963481, 0, 0.9294118, 1, 1,
-0.00904663, 0.1931855, -0.1786071, 0, 0.9215686, 1, 1,
-0.005543407, 0.1220819, -1.599, 0, 0.9176471, 1, 1,
-0.004928687, -0.5154943, -3.823901, 0, 0.9098039, 1, 1,
-0.002588124, -0.3617882, -3.003317, 0, 0.9058824, 1, 1,
-0.00071239, 0.001197585, -0.6726485, 0, 0.8980392, 1, 1,
0.001395975, 0.5508865, -0.3103259, 0, 0.8901961, 1, 1,
0.001732623, 1.309283, -0.8345261, 0, 0.8862745, 1, 1,
0.001764798, -0.4256792, 3.362583, 0, 0.8784314, 1, 1,
0.003138534, -0.2242626, 3.000718, 0, 0.8745098, 1, 1,
0.003946471, 0.1342869, 1.599786, 0, 0.8666667, 1, 1,
0.004858874, -1.541379, 1.559673, 0, 0.8627451, 1, 1,
0.006248309, 0.9799458, 0.1104709, 0, 0.854902, 1, 1,
0.008374264, 0.09371943, -0.7643772, 0, 0.8509804, 1, 1,
0.01110367, 1.027675, 0.4303428, 0, 0.8431373, 1, 1,
0.0114484, -0.06417213, 2.740244, 0, 0.8392157, 1, 1,
0.01654017, -0.076376, 3.023858, 0, 0.8313726, 1, 1,
0.01669458, 0.5358229, -2.205915, 0, 0.827451, 1, 1,
0.01736548, -0.510704, 3.038514, 0, 0.8196079, 1, 1,
0.01758931, -0.03336764, 2.649976, 0, 0.8156863, 1, 1,
0.01853165, 1.17556, 0.09216658, 0, 0.8078431, 1, 1,
0.01918771, 0.008544981, -0.4567024, 0, 0.8039216, 1, 1,
0.01980878, -0.03151643, 3.736047, 0, 0.7960784, 1, 1,
0.0272009, 1.25309, -0.8212477, 0, 0.7882353, 1, 1,
0.03140437, 1.30473, 0.7626288, 0, 0.7843137, 1, 1,
0.03586117, 1.215915, 1.293317, 0, 0.7764706, 1, 1,
0.04140445, -0.9917723, 3.642989, 0, 0.772549, 1, 1,
0.04168254, 0.2707201, 0.7935682, 0, 0.7647059, 1, 1,
0.04193781, 0.4787657, 1.675795, 0, 0.7607843, 1, 1,
0.04529383, -0.1945865, 4.18825, 0, 0.7529412, 1, 1,
0.04626127, 0.2950394, 1.243619, 0, 0.7490196, 1, 1,
0.04782418, 0.1063046, -0.2963636, 0, 0.7411765, 1, 1,
0.05082533, -0.06625803, 1.00675, 0, 0.7372549, 1, 1,
0.05324837, 0.506799, -0.8849699, 0, 0.7294118, 1, 1,
0.0553075, -1.146519, 2.71729, 0, 0.7254902, 1, 1,
0.05752748, 0.1671536, 0.8735168, 0, 0.7176471, 1, 1,
0.05938483, -1.617384, 2.39309, 0, 0.7137255, 1, 1,
0.06126413, 0.3550667, 0.7510149, 0, 0.7058824, 1, 1,
0.06389696, -0.4225119, 2.54221, 0, 0.6980392, 1, 1,
0.06446182, 0.1531738, 2.684271, 0, 0.6941177, 1, 1,
0.067117, 0.5166787, 1.249127, 0, 0.6862745, 1, 1,
0.07162853, -2.758588, 4.140996, 0, 0.682353, 1, 1,
0.07381656, -0.5246699, 4.152181, 0, 0.6745098, 1, 1,
0.08411139, -0.01377132, 0.2541837, 0, 0.6705883, 1, 1,
0.09135988, 1.168694, 1.724389, 0, 0.6627451, 1, 1,
0.09258843, -1.00171, 2.327234, 0, 0.6588235, 1, 1,
0.09754952, 0.09883504, 0.8271448, 0, 0.6509804, 1, 1,
0.09802447, -1.800143, 1.840485, 0, 0.6470588, 1, 1,
0.1057017, -2.736711, 4.195162, 0, 0.6392157, 1, 1,
0.1166076, -0.3287742, 0.5579374, 0, 0.6352941, 1, 1,
0.1221777, 0.8787801, -0.3718582, 0, 0.627451, 1, 1,
0.1228012, 0.4033732, -0.4929197, 0, 0.6235294, 1, 1,
0.1229226, 1.765163, 1.018212, 0, 0.6156863, 1, 1,
0.1241966, -0.8700765, 2.812479, 0, 0.6117647, 1, 1,
0.1254685, 0.08745308, 0.7470863, 0, 0.6039216, 1, 1,
0.130742, 0.2453974, 0.3647661, 0, 0.5960785, 1, 1,
0.1309136, 0.6552419, 0.2614141, 0, 0.5921569, 1, 1,
0.1320768, -1.321005, 2.810458, 0, 0.5843138, 1, 1,
0.1329371, 0.8190182, -1.353528, 0, 0.5803922, 1, 1,
0.1412388, 0.3154643, 0.08806813, 0, 0.572549, 1, 1,
0.1460229, 0.08075771, 1.735757, 0, 0.5686275, 1, 1,
0.1498155, -0.5580439, 1.999618, 0, 0.5607843, 1, 1,
0.157583, -1.313623, 4.07484, 0, 0.5568628, 1, 1,
0.157666, -0.08619305, 1.209278, 0, 0.5490196, 1, 1,
0.1643639, -0.3221091, 2.881556, 0, 0.5450981, 1, 1,
0.1715822, 0.554069, 0.1883112, 0, 0.5372549, 1, 1,
0.1758193, -0.5392317, 3.7617, 0, 0.5333334, 1, 1,
0.1879095, 1.038998, -0.08473311, 0, 0.5254902, 1, 1,
0.1909941, -0.9698334, 2.263037, 0, 0.5215687, 1, 1,
0.1923565, 0.8030387, -0.2781807, 0, 0.5137255, 1, 1,
0.1976588, -0.6618493, 3.746701, 0, 0.509804, 1, 1,
0.2052584, -0.5595681, 4.621699, 0, 0.5019608, 1, 1,
0.209963, 2.24496, 0.7673113, 0, 0.4941176, 1, 1,
0.2135773, -0.09432888, 0.7205832, 0, 0.4901961, 1, 1,
0.2139727, 0.32482, -0.6838537, 0, 0.4823529, 1, 1,
0.216771, -0.7892538, 2.959523, 0, 0.4784314, 1, 1,
0.2189124, 0.2929207, 0.2301109, 0, 0.4705882, 1, 1,
0.219125, -0.8171765, 1.134845, 0, 0.4666667, 1, 1,
0.2223553, -0.2600737, 4.281393, 0, 0.4588235, 1, 1,
0.228459, -0.5793, 1.286263, 0, 0.454902, 1, 1,
0.2286789, 1.791612, -0.6029833, 0, 0.4470588, 1, 1,
0.2364156, -0.4611814, 1.427277, 0, 0.4431373, 1, 1,
0.2367707, 1.102348, 1.746603, 0, 0.4352941, 1, 1,
0.236976, -0.3356839, 1.044512, 0, 0.4313726, 1, 1,
0.2392093, 1.095357, 0.2196416, 0, 0.4235294, 1, 1,
0.2412661, 0.6415551, 0.3808241, 0, 0.4196078, 1, 1,
0.2448175, 0.4268958, 1.013971, 0, 0.4117647, 1, 1,
0.2455039, -0.9523395, 2.206103, 0, 0.4078431, 1, 1,
0.2458941, -0.06232178, 2.181831, 0, 0.4, 1, 1,
0.2462918, 1.407373, -0.2020153, 0, 0.3921569, 1, 1,
0.2490744, 1.115391, 1.051008, 0, 0.3882353, 1, 1,
0.2505584, 0.1843033, 0.596127, 0, 0.3803922, 1, 1,
0.2508162, 0.4026493, 0.1130136, 0, 0.3764706, 1, 1,
0.253841, 0.3273493, 0.1093686, 0, 0.3686275, 1, 1,
0.2610754, 0.6595187, 1.027161, 0, 0.3647059, 1, 1,
0.2629764, -0.01117675, 1.40721, 0, 0.3568628, 1, 1,
0.271663, -0.3502378, 3.642049, 0, 0.3529412, 1, 1,
0.2723628, -0.2762312, 2.818009, 0, 0.345098, 1, 1,
0.2752809, 1.703222, -0.1086518, 0, 0.3411765, 1, 1,
0.2772106, -0.06460328, 2.235816, 0, 0.3333333, 1, 1,
0.2785603, 2.27497, 2.523466, 0, 0.3294118, 1, 1,
0.2799965, -0.283766, 2.437273, 0, 0.3215686, 1, 1,
0.2816762, -0.7965603, 3.655873, 0, 0.3176471, 1, 1,
0.2831556, -0.313664, 2.623569, 0, 0.3098039, 1, 1,
0.2843478, -0.8432425, 1.02226, 0, 0.3058824, 1, 1,
0.2868313, 0.8400839, 0.3031121, 0, 0.2980392, 1, 1,
0.2868593, -0.2282581, 2.291949, 0, 0.2901961, 1, 1,
0.2887017, -1.059869, 3.009701, 0, 0.2862745, 1, 1,
0.2927947, -2.601663, 3.640654, 0, 0.2784314, 1, 1,
0.2929471, -0.2032313, 0.7400361, 0, 0.2745098, 1, 1,
0.2937969, 1.281492, -0.9040246, 0, 0.2666667, 1, 1,
0.2940712, -0.7998958, 2.71502, 0, 0.2627451, 1, 1,
0.3064857, -1.819284, 1.329807, 0, 0.254902, 1, 1,
0.3075091, -1.031998, 2.952788, 0, 0.2509804, 1, 1,
0.3101175, -0.1879109, 0.3741023, 0, 0.2431373, 1, 1,
0.3159399, -0.1043599, 1.90035, 0, 0.2392157, 1, 1,
0.3162834, 0.8965261, 1.550503, 0, 0.2313726, 1, 1,
0.3165336, 1.120634, 0.5963739, 0, 0.227451, 1, 1,
0.3190658, 1.763175, 1.258028, 0, 0.2196078, 1, 1,
0.3257361, 0.4489849, -0.4695106, 0, 0.2156863, 1, 1,
0.333498, -0.2936516, 2.829679, 0, 0.2078431, 1, 1,
0.3346894, -1.04591, 3.016932, 0, 0.2039216, 1, 1,
0.3347239, 0.1068136, 3.10466, 0, 0.1960784, 1, 1,
0.3371085, 0.4257351, -1.05638, 0, 0.1882353, 1, 1,
0.342086, -1.84458, 3.695792, 0, 0.1843137, 1, 1,
0.3464716, -0.7165993, 1.416929, 0, 0.1764706, 1, 1,
0.3507832, -0.007692623, 2.062227, 0, 0.172549, 1, 1,
0.3511738, 3.0709, -1.360087, 0, 0.1647059, 1, 1,
0.3536698, 0.5167567, -0.9537519, 0, 0.1607843, 1, 1,
0.3551256, 0.6370984, -0.7395598, 0, 0.1529412, 1, 1,
0.3592534, -0.3340028, 4.05694, 0, 0.1490196, 1, 1,
0.3613803, -1.623633, 3.929142, 0, 0.1411765, 1, 1,
0.3625015, -1.170394, 3.51968, 0, 0.1372549, 1, 1,
0.3627994, 0.6461513, 1.803588, 0, 0.1294118, 1, 1,
0.3694639, 1.977981, -1.568709, 0, 0.1254902, 1, 1,
0.3727773, -1.282476, 1.938491, 0, 0.1176471, 1, 1,
0.3734607, 0.3157218, 0.2449627, 0, 0.1137255, 1, 1,
0.3778189, 1.147544, 0.4049229, 0, 0.1058824, 1, 1,
0.3778521, 0.998776, 0.4250231, 0, 0.09803922, 1, 1,
0.3791243, -0.8980625, 3.578392, 0, 0.09411765, 1, 1,
0.3794509, -0.5726505, 2.051867, 0, 0.08627451, 1, 1,
0.3825182, -1.001729, 3.733596, 0, 0.08235294, 1, 1,
0.3874168, 0.5598035, -0.4554398, 0, 0.07450981, 1, 1,
0.3885459, 0.3359182, 0.7675415, 0, 0.07058824, 1, 1,
0.3903213, -0.7730473, 2.537539, 0, 0.0627451, 1, 1,
0.3953177, 1.057505, -0.431855, 0, 0.05882353, 1, 1,
0.4008005, -0.06156761, 1.760668, 0, 0.05098039, 1, 1,
0.4017508, 0.9536746, 1.625458, 0, 0.04705882, 1, 1,
0.4041413, 0.7086552, 1.076527, 0, 0.03921569, 1, 1,
0.4086259, -0.3136797, 2.658661, 0, 0.03529412, 1, 1,
0.4109116, 0.6714641, 0.1121599, 0, 0.02745098, 1, 1,
0.4198462, 0.3623576, 2.900594, 0, 0.02352941, 1, 1,
0.4217706, 0.07229677, 1.738465, 0, 0.01568628, 1, 1,
0.4278895, -3.402768, 1.538008, 0, 0.01176471, 1, 1,
0.4287908, -0.9210773, 2.221295, 0, 0.003921569, 1, 1,
0.4360686, 1.814257, -0.522857, 0.003921569, 0, 1, 1,
0.437295, -2.265317, 0.2774495, 0.007843138, 0, 1, 1,
0.4383275, -0.5702552, 1.793796, 0.01568628, 0, 1, 1,
0.4405837, 1.110434, -0.7551458, 0.01960784, 0, 1, 1,
0.4418465, -1.289007, 1.84859, 0.02745098, 0, 1, 1,
0.4427192, -0.3861934, 2.170763, 0.03137255, 0, 1, 1,
0.4502222, -0.7410378, 0.990741, 0.03921569, 0, 1, 1,
0.4510356, -0.08050327, 2.851393, 0.04313726, 0, 1, 1,
0.4527066, -0.03281676, 1.732918, 0.05098039, 0, 1, 1,
0.4558287, -0.226936, 2.309522, 0.05490196, 0, 1, 1,
0.4565026, 0.2321075, 1.802438, 0.0627451, 0, 1, 1,
0.4642873, -2.040394, 3.562545, 0.06666667, 0, 1, 1,
0.466098, -0.07196719, 2.81965, 0.07450981, 0, 1, 1,
0.4672663, 1.908298, 0.6924155, 0.07843138, 0, 1, 1,
0.4688899, -0.2723322, 2.259448, 0.08627451, 0, 1, 1,
0.4703426, 1.253156, 0.2694347, 0.09019608, 0, 1, 1,
0.4721371, -0.377632, 1.21145, 0.09803922, 0, 1, 1,
0.4735993, -0.02786555, 2.730773, 0.1058824, 0, 1, 1,
0.4759491, 0.270992, 0.1302769, 0.1098039, 0, 1, 1,
0.4778588, -0.6447932, 1.775272, 0.1176471, 0, 1, 1,
0.4782502, -0.5051188, 2.151731, 0.1215686, 0, 1, 1,
0.4871871, -0.2131489, 1.363897, 0.1294118, 0, 1, 1,
0.4921382, 0.984219, -0.146726, 0.1333333, 0, 1, 1,
0.4926666, -0.6506201, 3.707207, 0.1411765, 0, 1, 1,
0.4936296, -0.6926754, 2.985553, 0.145098, 0, 1, 1,
0.4989075, -0.1308538, 3.43794, 0.1529412, 0, 1, 1,
0.4992103, -0.3122875, 2.164387, 0.1568628, 0, 1, 1,
0.5018648, -0.1864824, 1.961018, 0.1647059, 0, 1, 1,
0.5035689, -0.8075939, 2.771765, 0.1686275, 0, 1, 1,
0.5083122, -0.4815883, 0.9372497, 0.1764706, 0, 1, 1,
0.514276, 0.5571147, 1.177207, 0.1803922, 0, 1, 1,
0.5195675, 0.3772386, 2.415675, 0.1882353, 0, 1, 1,
0.5240608, -0.3421528, 2.361023, 0.1921569, 0, 1, 1,
0.5262968, -0.9677084, 3.860623, 0.2, 0, 1, 1,
0.5319824, 0.2089337, -0.6856714, 0.2078431, 0, 1, 1,
0.5355039, 0.887788, 0.8058073, 0.2117647, 0, 1, 1,
0.5413375, 1.194057, 1.364835, 0.2196078, 0, 1, 1,
0.5594384, 0.3340833, 0.7984367, 0.2235294, 0, 1, 1,
0.5595849, -0.5682644, 3.770505, 0.2313726, 0, 1, 1,
0.561205, -1.502429, 2.995854, 0.2352941, 0, 1, 1,
0.5612581, -0.06186906, 1.316356, 0.2431373, 0, 1, 1,
0.5638119, 0.6705584, -0.6231961, 0.2470588, 0, 1, 1,
0.564778, 0.3342905, 0.0411449, 0.254902, 0, 1, 1,
0.5647944, 2.655486, 0.3568192, 0.2588235, 0, 1, 1,
0.5698867, -0.3460031, 0.3970741, 0.2666667, 0, 1, 1,
0.5699556, 0.2353001, 1.343431, 0.2705882, 0, 1, 1,
0.5713656, -1.105996, 3.487175, 0.2784314, 0, 1, 1,
0.5719784, 0.1172177, 2.019865, 0.282353, 0, 1, 1,
0.5759599, -0.8323606, 0.9352226, 0.2901961, 0, 1, 1,
0.5761147, 1.527791, 1.541894, 0.2941177, 0, 1, 1,
0.5763925, 0.1487033, 2.836703, 0.3019608, 0, 1, 1,
0.5766652, -0.5318542, 2.569503, 0.3098039, 0, 1, 1,
0.5803258, -0.4223502, 0.1474029, 0.3137255, 0, 1, 1,
0.5808284, -0.5672607, 2.398093, 0.3215686, 0, 1, 1,
0.5809054, 0.8081551, 0.4077438, 0.3254902, 0, 1, 1,
0.5820511, -0.08801948, 1.268209, 0.3333333, 0, 1, 1,
0.5894016, -1.195788, 3.332794, 0.3372549, 0, 1, 1,
0.5912591, -1.060484, 1.856121, 0.345098, 0, 1, 1,
0.6026286, 0.2638483, 1.11702, 0.3490196, 0, 1, 1,
0.6043176, -0.4208277, 3.345268, 0.3568628, 0, 1, 1,
0.6093141, -0.7663378, 2.470937, 0.3607843, 0, 1, 1,
0.6112288, -0.02114471, 1.661886, 0.3686275, 0, 1, 1,
0.6159177, 0.592802, 1.353956, 0.372549, 0, 1, 1,
0.61594, -0.5889197, 1.743944, 0.3803922, 0, 1, 1,
0.6210132, 1.607853, -0.4091529, 0.3843137, 0, 1, 1,
0.6222128, -0.5944889, -0.1663539, 0.3921569, 0, 1, 1,
0.623393, 1.080731, 2.032557, 0.3960784, 0, 1, 1,
0.630515, 1.469519, 0.2846334, 0.4039216, 0, 1, 1,
0.6353288, 0.2151533, -0.2678508, 0.4117647, 0, 1, 1,
0.6370336, 0.6840645, 0.6688772, 0.4156863, 0, 1, 1,
0.6398663, -1.481331, 2.067301, 0.4235294, 0, 1, 1,
0.6429157, 1.002639, -0.517516, 0.427451, 0, 1, 1,
0.6438815, 0.7910012, -2.067396, 0.4352941, 0, 1, 1,
0.6446732, -1.021268, 3.819492, 0.4392157, 0, 1, 1,
0.6510857, -0.8242579, 3.431582, 0.4470588, 0, 1, 1,
0.6595747, -0.2416369, 3.415032, 0.4509804, 0, 1, 1,
0.6605237, 0.9297776, -0.07172054, 0.4588235, 0, 1, 1,
0.6684555, -1.017267, 3.684778, 0.4627451, 0, 1, 1,
0.67342, -0.2023492, 3.320296, 0.4705882, 0, 1, 1,
0.6738519, -1.338817, 2.294467, 0.4745098, 0, 1, 1,
0.6820687, 1.664458, -1.598658, 0.4823529, 0, 1, 1,
0.6822857, -0.8369646, 2.195425, 0.4862745, 0, 1, 1,
0.6837692, 0.7738363, 0.1147869, 0.4941176, 0, 1, 1,
0.6852012, -0.7208368, 2.052814, 0.5019608, 0, 1, 1,
0.6882617, -1.040049, 4.118462, 0.5058824, 0, 1, 1,
0.6899429, 2.065133, 1.23407, 0.5137255, 0, 1, 1,
0.6908284, 0.3269762, 0.05571429, 0.5176471, 0, 1, 1,
0.694838, -0.04917695, 1.067638, 0.5254902, 0, 1, 1,
0.6949927, 0.4338397, 2.564689, 0.5294118, 0, 1, 1,
0.6979921, 0.3535763, 1.011592, 0.5372549, 0, 1, 1,
0.6988068, -0.07383821, 2.926161, 0.5411765, 0, 1, 1,
0.6989751, 2.098718, -0.1303649, 0.5490196, 0, 1, 1,
0.7042876, 1.868175, 0.1870528, 0.5529412, 0, 1, 1,
0.7058895, 1.435591, 0.1053743, 0.5607843, 0, 1, 1,
0.7109641, -0.07184014, 1.807, 0.5647059, 0, 1, 1,
0.7110825, -2.174016, 1.520848, 0.572549, 0, 1, 1,
0.715592, -0.9844937, 2.34498, 0.5764706, 0, 1, 1,
0.7208831, -0.3402259, 2.52172, 0.5843138, 0, 1, 1,
0.7318254, 1.234062, 1.455306, 0.5882353, 0, 1, 1,
0.7340864, 1.900206, -0.2439986, 0.5960785, 0, 1, 1,
0.7357391, -0.2259019, -0.2706559, 0.6039216, 0, 1, 1,
0.7387296, -1.065043, 2.601895, 0.6078432, 0, 1, 1,
0.7411159, 1.018272, 0.2698102, 0.6156863, 0, 1, 1,
0.7480067, 1.677397, 0.7274913, 0.6196079, 0, 1, 1,
0.750187, -0.9623388, 1.597413, 0.627451, 0, 1, 1,
0.7524216, 1.064655, 1.287413, 0.6313726, 0, 1, 1,
0.7545866, 0.2603367, 1.497203, 0.6392157, 0, 1, 1,
0.7685105, -1.175314, 3.682402, 0.6431373, 0, 1, 1,
0.772845, -1.303969, 2.051403, 0.6509804, 0, 1, 1,
0.7810804, -1.364964, 2.97814, 0.654902, 0, 1, 1,
0.7880105, 0.1970344, 2.284603, 0.6627451, 0, 1, 1,
0.7891719, 0.7528989, 0.8899747, 0.6666667, 0, 1, 1,
0.794309, -0.6688201, 2.189841, 0.6745098, 0, 1, 1,
0.7973846, -0.09440405, 3.337623, 0.6784314, 0, 1, 1,
0.7977885, 0.8013602, 0.6486723, 0.6862745, 0, 1, 1,
0.7998756, -0.4285342, 2.970923, 0.6901961, 0, 1, 1,
0.802756, 0.3386461, 0.8338285, 0.6980392, 0, 1, 1,
0.8033777, -1.702485, 3.152475, 0.7058824, 0, 1, 1,
0.8079955, -1.255994, 2.843879, 0.7098039, 0, 1, 1,
0.8100158, -0.3823042, 3.124153, 0.7176471, 0, 1, 1,
0.8142802, 0.1006413, 3.030244, 0.7215686, 0, 1, 1,
0.8155391, -0.0585725, 3.183165, 0.7294118, 0, 1, 1,
0.8196475, 1.378367, -1.166774, 0.7333333, 0, 1, 1,
0.8207535, -0.6035544, 1.19732, 0.7411765, 0, 1, 1,
0.8224806, 0.1609699, 1.511974, 0.7450981, 0, 1, 1,
0.8279752, -0.5299041, 1.236417, 0.7529412, 0, 1, 1,
0.8302824, 0.08043025, -0.006385829, 0.7568628, 0, 1, 1,
0.8377826, -1.441573, 2.150893, 0.7647059, 0, 1, 1,
0.8464766, -2.310611, 3.134547, 0.7686275, 0, 1, 1,
0.8482086, -0.09850144, 1.344349, 0.7764706, 0, 1, 1,
0.8482093, -0.6622514, 1.613995, 0.7803922, 0, 1, 1,
0.8522649, 2.424989, -1.241228, 0.7882353, 0, 1, 1,
0.8532258, -0.2559357, 2.746617, 0.7921569, 0, 1, 1,
0.8602704, 0.1254312, 1.968885, 0.8, 0, 1, 1,
0.8680904, 0.2565676, 1.684433, 0.8078431, 0, 1, 1,
0.8841069, -1.472625, 4.56689, 0.8117647, 0, 1, 1,
0.8860513, -0.9299849, 4.252686, 0.8196079, 0, 1, 1,
0.8883665, -1.184674, 3.649049, 0.8235294, 0, 1, 1,
0.9033809, -0.2827656, 2.043243, 0.8313726, 0, 1, 1,
0.906179, -0.8241848, 2.980122, 0.8352941, 0, 1, 1,
0.9133949, -0.4947368, 0.6084083, 0.8431373, 0, 1, 1,
0.9140825, 1.78122, 0.7471731, 0.8470588, 0, 1, 1,
0.9147457, -0.1437623, 2.040878, 0.854902, 0, 1, 1,
0.9186999, 0.02554625, 2.266481, 0.8588235, 0, 1, 1,
0.9223146, 0.6065641, 0.5603772, 0.8666667, 0, 1, 1,
0.9238622, 0.6905636, 0.598462, 0.8705882, 0, 1, 1,
0.926805, -0.5312464, 2.229628, 0.8784314, 0, 1, 1,
0.9287046, 0.2530099, -0.3477195, 0.8823529, 0, 1, 1,
0.9349295, -0.08306767, 1.608487, 0.8901961, 0, 1, 1,
0.935821, -1.306332, 0.8043839, 0.8941177, 0, 1, 1,
0.9407842, -0.2868536, 1.763059, 0.9019608, 0, 1, 1,
0.9563996, 1.655371, 0.3177848, 0.9098039, 0, 1, 1,
0.9594399, 0.2298861, 1.297675, 0.9137255, 0, 1, 1,
0.967106, 1.037379, 1.477227, 0.9215686, 0, 1, 1,
0.9681498, 0.4298091, 0.9098054, 0.9254902, 0, 1, 1,
0.9687778, -0.253902, 2.716797, 0.9333333, 0, 1, 1,
0.970471, 0.1577329, 0.617089, 0.9372549, 0, 1, 1,
0.9807314, -0.4784071, 2.639448, 0.945098, 0, 1, 1,
0.9832844, 1.163818, 1.409389, 0.9490196, 0, 1, 1,
0.9839819, 1.218476, 0.6245519, 0.9568627, 0, 1, 1,
0.9839858, -1.179422, 1.789243, 0.9607843, 0, 1, 1,
0.9918339, 0.6815001, -0.3622991, 0.9686275, 0, 1, 1,
0.9935936, 0.2721197, 0.5963789, 0.972549, 0, 1, 1,
0.9945017, -0.2166297, 1.124869, 0.9803922, 0, 1, 1,
0.995007, -1.150982, 3.655078, 0.9843137, 0, 1, 1,
0.9974406, 1.212595, 1.422937, 0.9921569, 0, 1, 1,
0.9987581, -0.09534325, 2.840863, 0.9960784, 0, 1, 1,
1.00371, 0.8146322, 0.6493025, 1, 0, 0.9960784, 1,
1.004045, -0.2925383, 2.077175, 1, 0, 0.9882353, 1,
1.006516, 1.035812, 0.29411, 1, 0, 0.9843137, 1,
1.007592, -0.2537315, 3.093141, 1, 0, 0.9764706, 1,
1.007686, 0.4663354, 2.412879, 1, 0, 0.972549, 1,
1.010188, -0.2737935, 1.556406, 1, 0, 0.9647059, 1,
1.011654, -0.5472031, 3.052379, 1, 0, 0.9607843, 1,
1.012392, -0.3439043, 1.960336, 1, 0, 0.9529412, 1,
1.016319, 0.6562078, 2.386368, 1, 0, 0.9490196, 1,
1.016967, -0.2305163, 2.426126, 1, 0, 0.9411765, 1,
1.022034, -1.892575, 2.885479, 1, 0, 0.9372549, 1,
1.02263, -0.4167091, 2.255908, 1, 0, 0.9294118, 1,
1.022681, 1.616745, -1.297143, 1, 0, 0.9254902, 1,
1.033178, -1.260285, 3.289614, 1, 0, 0.9176471, 1,
1.034884, -1.988724, 1.769004, 1, 0, 0.9137255, 1,
1.041278, -0.9980377, 2.587945, 1, 0, 0.9058824, 1,
1.050018, -0.7929292, 3.669338, 1, 0, 0.9019608, 1,
1.050073, -0.4590918, 2.18172, 1, 0, 0.8941177, 1,
1.05934, 0.4541561, 1.560708, 1, 0, 0.8862745, 1,
1.059807, -0.4973147, 3.392778, 1, 0, 0.8823529, 1,
1.064376, 1.250191, -0.3634441, 1, 0, 0.8745098, 1,
1.069439, -0.9376116, 3.475416, 1, 0, 0.8705882, 1,
1.073328, 1.151592, -0.06213076, 1, 0, 0.8627451, 1,
1.075163, -1.096344, 2.92314, 1, 0, 0.8588235, 1,
1.082, -1.236414, 2.720186, 1, 0, 0.8509804, 1,
1.082113, 0.04811798, -0.312084, 1, 0, 0.8470588, 1,
1.096953, 0.05443377, -0.1786266, 1, 0, 0.8392157, 1,
1.105235, 0.4952281, 1.628371, 1, 0, 0.8352941, 1,
1.121244, 1.237413, 2.024201, 1, 0, 0.827451, 1,
1.124358, 0.2867719, 2.498435, 1, 0, 0.8235294, 1,
1.128692, 0.2187351, 2.322671, 1, 0, 0.8156863, 1,
1.136701, -0.02972295, 2.618069, 1, 0, 0.8117647, 1,
1.139412, 0.3902004, 0.1969456, 1, 0, 0.8039216, 1,
1.149988, 0.6223577, -0.5468824, 1, 0, 0.7960784, 1,
1.153349, 0.7622235, -0.4196351, 1, 0, 0.7921569, 1,
1.155342, 1.659352, 0.96947, 1, 0, 0.7843137, 1,
1.178305, -0.1918034, 3.101768, 1, 0, 0.7803922, 1,
1.178507, -0.4414662, 1.227459, 1, 0, 0.772549, 1,
1.180986, -0.5698377, 1.075318, 1, 0, 0.7686275, 1,
1.192179, -0.563826, 2.056671, 1, 0, 0.7607843, 1,
1.194871, 0.4258725, 2.857582, 1, 0, 0.7568628, 1,
1.196494, 1.338868, 1.623321, 1, 0, 0.7490196, 1,
1.198189, 1.131514, 0.6535754, 1, 0, 0.7450981, 1,
1.205604, -0.7116315, 2.987215, 1, 0, 0.7372549, 1,
1.217452, 0.5854729, 0.8414782, 1, 0, 0.7333333, 1,
1.224147, 1.358024, 1.132373, 1, 0, 0.7254902, 1,
1.235315, -0.8621255, 1.852289, 1, 0, 0.7215686, 1,
1.237317, -0.13923, -0.0971868, 1, 0, 0.7137255, 1,
1.238636, -0.744721, 3.459404, 1, 0, 0.7098039, 1,
1.243952, -0.8179058, 2.503336, 1, 0, 0.7019608, 1,
1.244808, -0.04686486, 1.026815, 1, 0, 0.6941177, 1,
1.247573, 0.0587495, 2.172845, 1, 0, 0.6901961, 1,
1.248643, -0.4360918, 0.2081771, 1, 0, 0.682353, 1,
1.252077, 0.8098887, 1.419617, 1, 0, 0.6784314, 1,
1.252728, 0.8859837, 1.059304, 1, 0, 0.6705883, 1,
1.256764, 0.2790823, 0.2873435, 1, 0, 0.6666667, 1,
1.261223, 0.01129868, 2.664886, 1, 0, 0.6588235, 1,
1.264865, 1.343492, 1.913325, 1, 0, 0.654902, 1,
1.269615, 0.6693053, -0.4881751, 1, 0, 0.6470588, 1,
1.281584, -2.456383, 2.404609, 1, 0, 0.6431373, 1,
1.282858, 1.856348, 0.5567183, 1, 0, 0.6352941, 1,
1.29394, 1.090545, 1.094388, 1, 0, 0.6313726, 1,
1.295461, 0.2913748, 0.6933799, 1, 0, 0.6235294, 1,
1.297355, -0.4391228, 1.879008, 1, 0, 0.6196079, 1,
1.301498, 0.6724944, 0.7672738, 1, 0, 0.6117647, 1,
1.305557, 1.882532, -0.9975367, 1, 0, 0.6078432, 1,
1.307408, 0.2208273, 0.1041875, 1, 0, 0.6, 1,
1.310629, -0.1687956, 1.13423, 1, 0, 0.5921569, 1,
1.313908, 0.6387459, 2.562198, 1, 0, 0.5882353, 1,
1.313964, -0.1450111, 3.571217, 1, 0, 0.5803922, 1,
1.314026, 0.951775, 0.4253691, 1, 0, 0.5764706, 1,
1.319211, -1.93316, 1.836804, 1, 0, 0.5686275, 1,
1.323599, -1.428479, 1.540273, 1, 0, 0.5647059, 1,
1.325739, -0.2786547, 0.06205375, 1, 0, 0.5568628, 1,
1.329487, 0.2022313, 2.482145, 1, 0, 0.5529412, 1,
1.341142, -0.2207658, 2.062733, 1, 0, 0.5450981, 1,
1.344046, 0.0895225, 0.6440096, 1, 0, 0.5411765, 1,
1.347935, -2.286798, 2.584849, 1, 0, 0.5333334, 1,
1.352751, -1.110548, 1.952269, 1, 0, 0.5294118, 1,
1.360189, -0.477701, 1.056707, 1, 0, 0.5215687, 1,
1.360837, -0.4479868, 1.128284, 1, 0, 0.5176471, 1,
1.372301, -1.822309, 2.683167, 1, 0, 0.509804, 1,
1.376593, 1.816892, 0.07855204, 1, 0, 0.5058824, 1,
1.383927, 0.01776513, 1.678555, 1, 0, 0.4980392, 1,
1.385635, 0.263233, 1.41223, 1, 0, 0.4901961, 1,
1.386537, -0.6439043, 3.141483, 1, 0, 0.4862745, 1,
1.387534, 2.037002, -0.06904723, 1, 0, 0.4784314, 1,
1.390609, -0.1546292, 1.634267, 1, 0, 0.4745098, 1,
1.409974, 1.381647, 0.8715022, 1, 0, 0.4666667, 1,
1.458533, 0.7605813, 1.222198, 1, 0, 0.4627451, 1,
1.460279, 0.4093065, 1.961214, 1, 0, 0.454902, 1,
1.461501, 0.7004148, 1.529824, 1, 0, 0.4509804, 1,
1.471009, 0.4271561, 1.023805, 1, 0, 0.4431373, 1,
1.479168, 0.6685016, -0.03834364, 1, 0, 0.4392157, 1,
1.48596, -0.362552, 1.267249, 1, 0, 0.4313726, 1,
1.494345, 1.427677, -0.3386714, 1, 0, 0.427451, 1,
1.494823, -0.8177404, 0.6711403, 1, 0, 0.4196078, 1,
1.501165, 0.9954303, 1.131499, 1, 0, 0.4156863, 1,
1.503948, 0.01350844, 0.4934735, 1, 0, 0.4078431, 1,
1.529391, 1.022211, -0.0685246, 1, 0, 0.4039216, 1,
1.555525, 1.296692, 0.8639604, 1, 0, 0.3960784, 1,
1.565467, -0.1540411, 1.831068, 1, 0, 0.3882353, 1,
1.569836, 0.751726, 1.423684, 1, 0, 0.3843137, 1,
1.579283, -0.02505169, 1.971335, 1, 0, 0.3764706, 1,
1.580568, -0.8838804, 1.83457, 1, 0, 0.372549, 1,
1.59929, 0.8612423, -0.3709759, 1, 0, 0.3647059, 1,
1.60194, -1.397276, 1.637792, 1, 0, 0.3607843, 1,
1.61032, -1.374353, 2.359444, 1, 0, 0.3529412, 1,
1.613243, 0.4804029, 1.552797, 1, 0, 0.3490196, 1,
1.613546, -0.3417702, 1.939881, 1, 0, 0.3411765, 1,
1.62933, -0.4620973, 2.79472, 1, 0, 0.3372549, 1,
1.629979, -0.03537338, 0.450872, 1, 0, 0.3294118, 1,
1.634481, -1.600035, 0.8882033, 1, 0, 0.3254902, 1,
1.638994, -0.1860969, 1.72419, 1, 0, 0.3176471, 1,
1.649592, 0.115256, -0.2167878, 1, 0, 0.3137255, 1,
1.65341, 1.745478, 0.3823808, 1, 0, 0.3058824, 1,
1.666898, 0.7836516, 0.06560417, 1, 0, 0.2980392, 1,
1.669458, -0.8873869, 2.022974, 1, 0, 0.2941177, 1,
1.67957, 0.3020973, 1.399, 1, 0, 0.2862745, 1,
1.6841, -0.2384579, 2.31604, 1, 0, 0.282353, 1,
1.690091, -0.4087787, 1.408413, 1, 0, 0.2745098, 1,
1.692361, 0.6041723, 2.584753, 1, 0, 0.2705882, 1,
1.700937, -0.4462885, 3.272335, 1, 0, 0.2627451, 1,
1.702528, 0.7667749, 0.6448207, 1, 0, 0.2588235, 1,
1.716874, 0.2320756, 1.807174, 1, 0, 0.2509804, 1,
1.727466, 2.679417, 2.092754, 1, 0, 0.2470588, 1,
1.732244, -0.2357326, 1.847755, 1, 0, 0.2392157, 1,
1.736073, -0.8291969, 2.020396, 1, 0, 0.2352941, 1,
1.739507, -1.097789, 3.625319, 1, 0, 0.227451, 1,
1.760543, -0.7994941, 3.044473, 1, 0, 0.2235294, 1,
1.770463, -0.01306285, 2.261514, 1, 0, 0.2156863, 1,
1.777332, -0.2509556, 1.574348, 1, 0, 0.2117647, 1,
1.78091, 1.754008, 0.762718, 1, 0, 0.2039216, 1,
1.800589, -0.1129903, 2.781167, 1, 0, 0.1960784, 1,
1.815261, 0.0577007, 1.067048, 1, 0, 0.1921569, 1,
1.826066, 1.041592, 1.478178, 1, 0, 0.1843137, 1,
1.862674, 0.7596025, 0.9791722, 1, 0, 0.1803922, 1,
1.877802, -0.9860113, 1.091152, 1, 0, 0.172549, 1,
1.87833, 0.2952069, 1.893268, 1, 0, 0.1686275, 1,
1.900993, -0.09251174, 1.019002, 1, 0, 0.1607843, 1,
1.91743, -0.1823854, 1.910675, 1, 0, 0.1568628, 1,
1.921435, -1.119239, 1.34654, 1, 0, 0.1490196, 1,
1.937454, -0.9441912, 1.330214, 1, 0, 0.145098, 1,
1.939297, 0.3717546, 1.103955, 1, 0, 0.1372549, 1,
1.943151, 0.3268173, 1.896017, 1, 0, 0.1333333, 1,
1.94594, 0.6747313, -0.5861405, 1, 0, 0.1254902, 1,
1.958024, -0.6301647, 3.29403, 1, 0, 0.1215686, 1,
1.976271, -0.1352665, 1.05759, 1, 0, 0.1137255, 1,
2.017567, 1.08699, 1.428663, 1, 0, 0.1098039, 1,
2.040192, -1.35578, 2.841047, 1, 0, 0.1019608, 1,
2.054356, -0.9730898, 1.066607, 1, 0, 0.09411765, 1,
2.061802, 0.507883, 1.038504, 1, 0, 0.09019608, 1,
2.07129, -2.021603, 2.887404, 1, 0, 0.08235294, 1,
2.136641, -0.5792357, 0.9265607, 1, 0, 0.07843138, 1,
2.16248, 2.978472, -0.03123605, 1, 0, 0.07058824, 1,
2.167972, 1.233491, 1.050154, 1, 0, 0.06666667, 1,
2.17722, -1.051751, 1.117491, 1, 0, 0.05882353, 1,
2.344736, 0.5689188, 1.522845, 1, 0, 0.05490196, 1,
2.349662, 0.4578896, 0.6995379, 1, 0, 0.04705882, 1,
2.372978, 0.3138419, 2.508334, 1, 0, 0.04313726, 1,
2.423692, -0.9612539, 1.895492, 1, 0, 0.03529412, 1,
2.5576, 0.04908627, 4.134172, 1, 0, 0.03137255, 1,
2.747862, 0.2790599, 2.028117, 1, 0, 0.02352941, 1,
2.848781, 1.66092, 1.146124, 1, 0, 0.01960784, 1,
2.913055, 0.8015532, 0.0004002102, 1, 0, 0.01176471, 1,
3.626029, -1.831585, 3.092891, 1, 0, 0.007843138, 1
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
0.2533332, -4.500055, -7.115692, 0, -0.5, 0.5, 0.5,
0.2533332, -4.500055, -7.115692, 1, -0.5, 0.5, 0.5,
0.2533332, -4.500055, -7.115692, 1, 1.5, 0.5, 0.5,
0.2533332, -4.500055, -7.115692, 0, 1.5, 0.5, 0.5
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
-4.262706, -0.1659342, -7.115692, 0, -0.5, 0.5, 0.5,
-4.262706, -0.1659342, -7.115692, 1, -0.5, 0.5, 0.5,
-4.262706, -0.1659342, -7.115692, 1, 1.5, 0.5, 0.5,
-4.262706, -0.1659342, -7.115692, 0, 1.5, 0.5, 0.5
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
-4.262706, -4.500055, -0.3964245, 0, -0.5, 0.5, 0.5,
-4.262706, -4.500055, -0.3964245, 1, -0.5, 0.5, 0.5,
-4.262706, -4.500055, -0.3964245, 1, 1.5, 0.5, 0.5,
-4.262706, -4.500055, -0.3964245, 0, 1.5, 0.5, 0.5
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
-3, -3.499873, -5.565092,
3, -3.499873, -5.565092,
-3, -3.499873, -5.565092,
-3, -3.66657, -5.823525,
-2, -3.499873, -5.565092,
-2, -3.66657, -5.823525,
-1, -3.499873, -5.565092,
-1, -3.66657, -5.823525,
0, -3.499873, -5.565092,
0, -3.66657, -5.823525,
1, -3.499873, -5.565092,
1, -3.66657, -5.823525,
2, -3.499873, -5.565092,
2, -3.66657, -5.823525,
3, -3.499873, -5.565092,
3, -3.66657, -5.823525
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
-3, -3.999964, -6.340392, 0, -0.5, 0.5, 0.5,
-3, -3.999964, -6.340392, 1, -0.5, 0.5, 0.5,
-3, -3.999964, -6.340392, 1, 1.5, 0.5, 0.5,
-3, -3.999964, -6.340392, 0, 1.5, 0.5, 0.5,
-2, -3.999964, -6.340392, 0, -0.5, 0.5, 0.5,
-2, -3.999964, -6.340392, 1, -0.5, 0.5, 0.5,
-2, -3.999964, -6.340392, 1, 1.5, 0.5, 0.5,
-2, -3.999964, -6.340392, 0, 1.5, 0.5, 0.5,
-1, -3.999964, -6.340392, 0, -0.5, 0.5, 0.5,
-1, -3.999964, -6.340392, 1, -0.5, 0.5, 0.5,
-1, -3.999964, -6.340392, 1, 1.5, 0.5, 0.5,
-1, -3.999964, -6.340392, 0, 1.5, 0.5, 0.5,
0, -3.999964, -6.340392, 0, -0.5, 0.5, 0.5,
0, -3.999964, -6.340392, 1, -0.5, 0.5, 0.5,
0, -3.999964, -6.340392, 1, 1.5, 0.5, 0.5,
0, -3.999964, -6.340392, 0, 1.5, 0.5, 0.5,
1, -3.999964, -6.340392, 0, -0.5, 0.5, 0.5,
1, -3.999964, -6.340392, 1, -0.5, 0.5, 0.5,
1, -3.999964, -6.340392, 1, 1.5, 0.5, 0.5,
1, -3.999964, -6.340392, 0, 1.5, 0.5, 0.5,
2, -3.999964, -6.340392, 0, -0.5, 0.5, 0.5,
2, -3.999964, -6.340392, 1, -0.5, 0.5, 0.5,
2, -3.999964, -6.340392, 1, 1.5, 0.5, 0.5,
2, -3.999964, -6.340392, 0, 1.5, 0.5, 0.5,
3, -3.999964, -6.340392, 0, -0.5, 0.5, 0.5,
3, -3.999964, -6.340392, 1, -0.5, 0.5, 0.5,
3, -3.999964, -6.340392, 1, 1.5, 0.5, 0.5,
3, -3.999964, -6.340392, 0, 1.5, 0.5, 0.5
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
-3.220543, -3, -5.565092,
-3.220543, 3, -5.565092,
-3.220543, -3, -5.565092,
-3.394237, -3, -5.823525,
-3.220543, -2, -5.565092,
-3.394237, -2, -5.823525,
-3.220543, -1, -5.565092,
-3.394237, -1, -5.823525,
-3.220543, 0, -5.565092,
-3.394237, 0, -5.823525,
-3.220543, 1, -5.565092,
-3.394237, 1, -5.823525,
-3.220543, 2, -5.565092,
-3.394237, 2, -5.823525,
-3.220543, 3, -5.565092,
-3.394237, 3, -5.823525
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
-3.741624, -3, -6.340392, 0, -0.5, 0.5, 0.5,
-3.741624, -3, -6.340392, 1, -0.5, 0.5, 0.5,
-3.741624, -3, -6.340392, 1, 1.5, 0.5, 0.5,
-3.741624, -3, -6.340392, 0, 1.5, 0.5, 0.5,
-3.741624, -2, -6.340392, 0, -0.5, 0.5, 0.5,
-3.741624, -2, -6.340392, 1, -0.5, 0.5, 0.5,
-3.741624, -2, -6.340392, 1, 1.5, 0.5, 0.5,
-3.741624, -2, -6.340392, 0, 1.5, 0.5, 0.5,
-3.741624, -1, -6.340392, 0, -0.5, 0.5, 0.5,
-3.741624, -1, -6.340392, 1, -0.5, 0.5, 0.5,
-3.741624, -1, -6.340392, 1, 1.5, 0.5, 0.5,
-3.741624, -1, -6.340392, 0, 1.5, 0.5, 0.5,
-3.741624, 0, -6.340392, 0, -0.5, 0.5, 0.5,
-3.741624, 0, -6.340392, 1, -0.5, 0.5, 0.5,
-3.741624, 0, -6.340392, 1, 1.5, 0.5, 0.5,
-3.741624, 0, -6.340392, 0, 1.5, 0.5, 0.5,
-3.741624, 1, -6.340392, 0, -0.5, 0.5, 0.5,
-3.741624, 1, -6.340392, 1, -0.5, 0.5, 0.5,
-3.741624, 1, -6.340392, 1, 1.5, 0.5, 0.5,
-3.741624, 1, -6.340392, 0, 1.5, 0.5, 0.5,
-3.741624, 2, -6.340392, 0, -0.5, 0.5, 0.5,
-3.741624, 2, -6.340392, 1, -0.5, 0.5, 0.5,
-3.741624, 2, -6.340392, 1, 1.5, 0.5, 0.5,
-3.741624, 2, -6.340392, 0, 1.5, 0.5, 0.5,
-3.741624, 3, -6.340392, 0, -0.5, 0.5, 0.5,
-3.741624, 3, -6.340392, 1, -0.5, 0.5, 0.5,
-3.741624, 3, -6.340392, 1, 1.5, 0.5, 0.5,
-3.741624, 3, -6.340392, 0, 1.5, 0.5, 0.5
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
-3.220543, -3.499873, -4,
-3.220543, -3.499873, 4,
-3.220543, -3.499873, -4,
-3.394237, -3.66657, -4,
-3.220543, -3.499873, -2,
-3.394237, -3.66657, -2,
-3.220543, -3.499873, 0,
-3.394237, -3.66657, 0,
-3.220543, -3.499873, 2,
-3.394237, -3.66657, 2,
-3.220543, -3.499873, 4,
-3.394237, -3.66657, 4
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
-3.741624, -3.999964, -4, 0, -0.5, 0.5, 0.5,
-3.741624, -3.999964, -4, 1, -0.5, 0.5, 0.5,
-3.741624, -3.999964, -4, 1, 1.5, 0.5, 0.5,
-3.741624, -3.999964, -4, 0, 1.5, 0.5, 0.5,
-3.741624, -3.999964, -2, 0, -0.5, 0.5, 0.5,
-3.741624, -3.999964, -2, 1, -0.5, 0.5, 0.5,
-3.741624, -3.999964, -2, 1, 1.5, 0.5, 0.5,
-3.741624, -3.999964, -2, 0, 1.5, 0.5, 0.5,
-3.741624, -3.999964, 0, 0, -0.5, 0.5, 0.5,
-3.741624, -3.999964, 0, 1, -0.5, 0.5, 0.5,
-3.741624, -3.999964, 0, 1, 1.5, 0.5, 0.5,
-3.741624, -3.999964, 0, 0, 1.5, 0.5, 0.5,
-3.741624, -3.999964, 2, 0, -0.5, 0.5, 0.5,
-3.741624, -3.999964, 2, 1, -0.5, 0.5, 0.5,
-3.741624, -3.999964, 2, 1, 1.5, 0.5, 0.5,
-3.741624, -3.999964, 2, 0, 1.5, 0.5, 0.5,
-3.741624, -3.999964, 4, 0, -0.5, 0.5, 0.5,
-3.741624, -3.999964, 4, 1, -0.5, 0.5, 0.5,
-3.741624, -3.999964, 4, 1, 1.5, 0.5, 0.5,
-3.741624, -3.999964, 4, 0, 1.5, 0.5, 0.5
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
-3.220543, -3.499873, -5.565092,
-3.220543, 3.168005, -5.565092,
-3.220543, -3.499873, 4.772243,
-3.220543, 3.168005, 4.772243,
-3.220543, -3.499873, -5.565092,
-3.220543, -3.499873, 4.772243,
-3.220543, 3.168005, -5.565092,
-3.220543, 3.168005, 4.772243,
-3.220543, -3.499873, -5.565092,
3.727209, -3.499873, -5.565092,
-3.220543, -3.499873, 4.772243,
3.727209, -3.499873, 4.772243,
-3.220543, 3.168005, -5.565092,
3.727209, 3.168005, -5.565092,
-3.220543, 3.168005, 4.772243,
3.727209, 3.168005, 4.772243,
3.727209, -3.499873, -5.565092,
3.727209, 3.168005, -5.565092,
3.727209, -3.499873, 4.772243,
3.727209, 3.168005, 4.772243,
3.727209, -3.499873, -5.565092,
3.727209, -3.499873, 4.772243,
3.727209, 3.168005, -5.565092,
3.727209, 3.168005, 4.772243
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
var radius = 7.543925;
var distance = 33.56378;
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
mvMatrix.translate( -0.2533332, 0.1659342, 0.3964245 );
mvMatrix.scale( 1.173997, 1.223274, 0.7890468 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.56378);
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
benzoate<-read.table("benzoate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-benzoate$V2
```

```
## Error in eval(expr, envir, enclos): object 'benzoate' not found
```

```r
y<-benzoate$V3
```

```
## Error in eval(expr, envir, enclos): object 'benzoate' not found
```

```r
z<-benzoate$V4
```

```
## Error in eval(expr, envir, enclos): object 'benzoate' not found
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
-3.119362, -0.9877619, -2.483725, 0, 0, 1, 1, 1,
-2.874506, 0.7646201, -2.511384, 1, 0, 0, 1, 1,
-2.866765, 0.9324667, 0.5968494, 1, 0, 0, 1, 1,
-2.85807, 0.2433206, -2.941718, 1, 0, 0, 1, 1,
-2.83641, -0.6632468, -1.628706, 1, 0, 0, 1, 1,
-2.766611, 0.08952695, -1.610591, 1, 0, 0, 1, 1,
-2.754832, 0.8934934, -2.861446, 0, 0, 0, 1, 1,
-2.641329, 0.341937, -0.1353391, 0, 0, 0, 1, 1,
-2.628827, -0.8349178, -2.194977, 0, 0, 0, 1, 1,
-2.603154, -0.3311111, -1.276212, 0, 0, 0, 1, 1,
-2.584954, 1.650254, -1.246882, 0, 0, 0, 1, 1,
-2.507184, 0.9813597, -1.436891, 0, 0, 0, 1, 1,
-2.506996, 0.5206798, 0.4386333, 0, 0, 0, 1, 1,
-2.504707, 0.08000144, -1.093425, 1, 1, 1, 1, 1,
-2.503077, -0.2444875, -1.316595, 1, 1, 1, 1, 1,
-2.473699, -0.3584006, -2.021892, 1, 1, 1, 1, 1,
-2.439242, -0.4165155, -1.417491, 1, 1, 1, 1, 1,
-2.30942, -1.274222, -2.301161, 1, 1, 1, 1, 1,
-2.206289, 0.5280581, -0.6814858, 1, 1, 1, 1, 1,
-2.192574, -0.803561, -2.757579, 1, 1, 1, 1, 1,
-2.188257, 1.694898, -0.3185957, 1, 1, 1, 1, 1,
-2.179742, 1.362638, -1.229813, 1, 1, 1, 1, 1,
-2.171266, -0.3925733, -2.011252, 1, 1, 1, 1, 1,
-2.160902, 0.6788118, -2.455507, 1, 1, 1, 1, 1,
-2.132169, 1.166479, -0.3815602, 1, 1, 1, 1, 1,
-2.067562, -0.08500414, -1.501263, 1, 1, 1, 1, 1,
-2.06053, -0.1446203, -2.771373, 1, 1, 1, 1, 1,
-2.028339, -1.616565, -2.80739, 1, 1, 1, 1, 1,
-2.022071, -0.004400346, -1.915042, 0, 0, 1, 1, 1,
-1.994329, 0.04898416, -1.767476, 1, 0, 0, 1, 1,
-1.969408, 0.2947866, -1.555697, 1, 0, 0, 1, 1,
-1.962695, -0.58082, -1.447278, 1, 0, 0, 1, 1,
-1.945665, 0.2888511, -0.9832634, 1, 0, 0, 1, 1,
-1.937672, 0.9929826, -0.3014282, 1, 0, 0, 1, 1,
-1.890614, 0.243042, -1.241715, 0, 0, 0, 1, 1,
-1.856655, -0.7295721, -1.353948, 0, 0, 0, 1, 1,
-1.853427, -0.08857255, -3.241781, 0, 0, 0, 1, 1,
-1.826738, 2.189055, -1.215115, 0, 0, 0, 1, 1,
-1.819355, 0.7766071, 0.176824, 0, 0, 0, 1, 1,
-1.817361, 1.841359, -1.731618, 0, 0, 0, 1, 1,
-1.810144, -0.07385217, -2.005723, 0, 0, 0, 1, 1,
-1.790317, -0.642197, -2.345052, 1, 1, 1, 1, 1,
-1.764782, 0.228249, -1.051596, 1, 1, 1, 1, 1,
-1.763997, 1.058293, -0.3107336, 1, 1, 1, 1, 1,
-1.762938, -0.1657457, -0.8589675, 1, 1, 1, 1, 1,
-1.752852, 1.759256, -0.875343, 1, 1, 1, 1, 1,
-1.747194, -3.220745, -2.914287, 1, 1, 1, 1, 1,
-1.743474, 0.4736116, -0.392118, 1, 1, 1, 1, 1,
-1.743326, 1.787747, -1.175461, 1, 1, 1, 1, 1,
-1.723654, 0.08279455, -1.409254, 1, 1, 1, 1, 1,
-1.7071, 0.1103722, -0.7837977, 1, 1, 1, 1, 1,
-1.676978, -1.122961, -3.618168, 1, 1, 1, 1, 1,
-1.674706, 2.006896, -1.077947, 1, 1, 1, 1, 1,
-1.674587, 0.3634216, -1.619768, 1, 1, 1, 1, 1,
-1.671334, -0.2487698, -0.5615002, 1, 1, 1, 1, 1,
-1.658924, -1.82072, -2.518005, 1, 1, 1, 1, 1,
-1.65703, 1.754246, -0.6455376, 0, 0, 1, 1, 1,
-1.630108, -0.7334672, -3.574229, 1, 0, 0, 1, 1,
-1.609357, 1.128619, 1.018536, 1, 0, 0, 1, 1,
-1.598595, -0.07168493, -2.041843, 1, 0, 0, 1, 1,
-1.595147, 0.8495547, -1.776406, 1, 0, 0, 1, 1,
-1.593057, -0.2878487, -3.336715, 1, 0, 0, 1, 1,
-1.587208, 0.7551302, -0.9076067, 0, 0, 0, 1, 1,
-1.579258, 0.08966973, -1.188756, 0, 0, 0, 1, 1,
-1.578708, 0.7229771, -0.1957441, 0, 0, 0, 1, 1,
-1.534703, -0.2824453, -1.108548, 0, 0, 0, 1, 1,
-1.522361, 0.6611378, -1.490206, 0, 0, 0, 1, 1,
-1.511631, 0.3986291, -0.9157124, 0, 0, 0, 1, 1,
-1.504261, 0.2500244, -1.164065, 0, 0, 0, 1, 1,
-1.496842, -0.9831789, -2.666275, 1, 1, 1, 1, 1,
-1.495993, -0.7116386, -4.362579, 1, 1, 1, 1, 1,
-1.475295, -0.7841678, -0.4730532, 1, 1, 1, 1, 1,
-1.455854, -0.1783794, -0.4167749, 1, 1, 1, 1, 1,
-1.455356, 0.6442921, -0.02768034, 1, 1, 1, 1, 1,
-1.451539, 0.5885599, -1.075332, 1, 1, 1, 1, 1,
-1.43916, 0.3845393, -0.6707889, 1, 1, 1, 1, 1,
-1.437192, -0.1327939, -1.798729, 1, 1, 1, 1, 1,
-1.43579, 1.078652, -2.309228, 1, 1, 1, 1, 1,
-1.424514, 2.621778, -1.935481, 1, 1, 1, 1, 1,
-1.421046, -1.602953, -1.762666, 1, 1, 1, 1, 1,
-1.391671, -0.4135807, -3.278691, 1, 1, 1, 1, 1,
-1.387643, 0.2387721, 0.1019649, 1, 1, 1, 1, 1,
-1.380897, -0.209364, -1.199182, 1, 1, 1, 1, 1,
-1.378473, -1.365675, -3.405422, 1, 1, 1, 1, 1,
-1.367026, -0.4661796, -0.9367753, 0, 0, 1, 1, 1,
-1.362496, 0.306273, -1.309599, 1, 0, 0, 1, 1,
-1.358239, -1.264947, -2.930398, 1, 0, 0, 1, 1,
-1.355613, -0.5015523, -1.496732, 1, 0, 0, 1, 1,
-1.353776, 0.4451211, -2.213275, 1, 0, 0, 1, 1,
-1.340251, 0.1320411, -2.353359, 1, 0, 0, 1, 1,
-1.339462, -0.4322702, -3.555748, 0, 0, 0, 1, 1,
-1.328234, -0.08454757, 0.2657863, 0, 0, 0, 1, 1,
-1.32432, -0.1263788, -0.9726189, 0, 0, 0, 1, 1,
-1.322333, 2.1637, -2.699688, 0, 0, 0, 1, 1,
-1.322326, -0.4612441, -0.4898123, 0, 0, 0, 1, 1,
-1.30989, -0.2836735, -2.347218, 0, 0, 0, 1, 1,
-1.305392, 0.8830698, -1.701541, 0, 0, 0, 1, 1,
-1.293938, 1.903008, -0.4706276, 1, 1, 1, 1, 1,
-1.28986, 2.344639, 0.2889547, 1, 1, 1, 1, 1,
-1.282767, 0.7825948, 0.5217568, 1, 1, 1, 1, 1,
-1.251806, 0.9288611, -2.67696, 1, 1, 1, 1, 1,
-1.251089, 0.7394637, -2.136777, 1, 1, 1, 1, 1,
-1.249452, -0.8136603, -0.2560741, 1, 1, 1, 1, 1,
-1.242593, -0.4650777, -2.233863, 1, 1, 1, 1, 1,
-1.234276, 0.60345, -1.758345, 1, 1, 1, 1, 1,
-1.209059, -0.4737593, -3.836887, 1, 1, 1, 1, 1,
-1.208837, -0.7345488, -1.877159, 1, 1, 1, 1, 1,
-1.206687, 1.137119, -0.3280655, 1, 1, 1, 1, 1,
-1.202604, -0.9093874, -3.362994, 1, 1, 1, 1, 1,
-1.198754, 0.664308, -1.542301, 1, 1, 1, 1, 1,
-1.196869, 0.5316461, -0.9633532, 1, 1, 1, 1, 1,
-1.192828, 0.3767552, -0.6805923, 1, 1, 1, 1, 1,
-1.191671, -0.9913346, -1.644096, 0, 0, 1, 1, 1,
-1.189035, 0.7871153, -0.8868166, 1, 0, 0, 1, 1,
-1.174116, 1.631824, -0.3379376, 1, 0, 0, 1, 1,
-1.15788, -2.043968, -1.984012, 1, 0, 0, 1, 1,
-1.147683, -0.73046, -1.509415, 1, 0, 0, 1, 1,
-1.144936, 1.355519, -0.03817225, 1, 0, 0, 1, 1,
-1.128803, -0.5214318, -1.351182, 0, 0, 0, 1, 1,
-1.126703, -0.4661158, -2.270995, 0, 0, 0, 1, 1,
-1.114902, -1.578701, -2.6632, 0, 0, 0, 1, 1,
-1.114101, -1.033575, -2.710671, 0, 0, 0, 1, 1,
-1.111911, 1.009532, -3.877135, 0, 0, 0, 1, 1,
-1.111014, 0.01922717, -3.043914, 0, 0, 0, 1, 1,
-1.100933, 1.494633, -0.6995059, 0, 0, 0, 1, 1,
-1.097739, -0.178961, -0.1010899, 1, 1, 1, 1, 1,
-1.092768, 1.648263, -0.3472373, 1, 1, 1, 1, 1,
-1.088557, 0.8522595, -0.6127843, 1, 1, 1, 1, 1,
-1.08568, -0.5753496, 0.21095, 1, 1, 1, 1, 1,
-1.077713, 0.128538, 1.533342, 1, 1, 1, 1, 1,
-1.075142, -1.29631, -2.788861, 1, 1, 1, 1, 1,
-1.07187, -0.4036914, -2.450874, 1, 1, 1, 1, 1,
-1.050668, -0.590617, -4.432141, 1, 1, 1, 1, 1,
-1.049902, 0.8247124, -1.653705, 1, 1, 1, 1, 1,
-1.047376, 0.6145962, -1.955508, 1, 1, 1, 1, 1,
-1.044203, 0.372995, -1.178064, 1, 1, 1, 1, 1,
-1.037541, 0.2969934, -0.5601707, 1, 1, 1, 1, 1,
-1.03667, 0.1321658, -1.505217, 1, 1, 1, 1, 1,
-1.035239, 1.010152, -0.9056575, 1, 1, 1, 1, 1,
-1.03241, 1.547905, -1.533859, 1, 1, 1, 1, 1,
-1.030403, 1.01556, -0.6887072, 0, 0, 1, 1, 1,
-1.025114, 1.089392, 1.73463, 1, 0, 0, 1, 1,
-1.023949, 0.1312933, -1.375361, 1, 0, 0, 1, 1,
-1.021951, -0.3148074, -2.314449, 1, 0, 0, 1, 1,
-1.021536, -1.802478, -1.943752, 1, 0, 0, 1, 1,
-1.020584, 0.8945982, -0.3316028, 1, 0, 0, 1, 1,
-1.018129, -0.7635741, -1.117101, 0, 0, 0, 1, 1,
-1.002583, -1.17318, -2.704598, 0, 0, 0, 1, 1,
-0.9997874, 0.2859218, 0.5142146, 0, 0, 0, 1, 1,
-0.9992217, 0.648412, -1.384342, 0, 0, 0, 1, 1,
-0.9889079, 0.2738487, -0.3897074, 0, 0, 0, 1, 1,
-0.9829241, -0.1487104, -1.415275, 0, 0, 0, 1, 1,
-0.9744468, -0.09349004, -1.927224, 0, 0, 0, 1, 1,
-0.9726104, 0.1590036, -2.623415, 1, 1, 1, 1, 1,
-0.9697516, -0.335299, -2.159249, 1, 1, 1, 1, 1,
-0.9639235, 0.5475789, -1.37809, 1, 1, 1, 1, 1,
-0.9626842, 0.6533707, -0.8498581, 1, 1, 1, 1, 1,
-0.962547, -1.447133, -1.994339, 1, 1, 1, 1, 1,
-0.9555328, -0.7065852, -1.967832, 1, 1, 1, 1, 1,
-0.9529192, 0.2337802, -1.867385, 1, 1, 1, 1, 1,
-0.9489272, 1.215957, 0.184144, 1, 1, 1, 1, 1,
-0.9467612, 0.4790765, -1.146768, 1, 1, 1, 1, 1,
-0.9462658, -0.856602, -2.460294, 1, 1, 1, 1, 1,
-0.9433566, 0.474159, -0.2027465, 1, 1, 1, 1, 1,
-0.9289293, 2.111479, -0.5303664, 1, 1, 1, 1, 1,
-0.9252328, -0.5623162, -2.508464, 1, 1, 1, 1, 1,
-0.9208283, -0.9590524, -4.326328, 1, 1, 1, 1, 1,
-0.9200398, 0.03911844, -2.697331, 1, 1, 1, 1, 1,
-0.9172841, -0.3859659, -2.74725, 0, 0, 1, 1, 1,
-0.9107994, -0.3048027, -1.152326, 1, 0, 0, 1, 1,
-0.9065384, -0.113255, -2.252285, 1, 0, 0, 1, 1,
-0.9030386, -1.198548, -0.727289, 1, 0, 0, 1, 1,
-0.9025556, 3.030221, -1.06169, 1, 0, 0, 1, 1,
-0.8997334, 0.8690294, 0.07616876, 1, 0, 0, 1, 1,
-0.8922971, 0.8643899, -1.3609, 0, 0, 0, 1, 1,
-0.8916953, 0.358793, -2.159781, 0, 0, 0, 1, 1,
-0.8825693, -0.4755003, -1.93615, 0, 0, 0, 1, 1,
-0.8810349, -0.2561871, -2.076821, 0, 0, 0, 1, 1,
-0.8782727, -0.725012, -3.262071, 0, 0, 0, 1, 1,
-0.8748183, -0.8032475, -3.592998, 0, 0, 0, 1, 1,
-0.8747498, 1.239783, 0.4946477, 0, 0, 0, 1, 1,
-0.8741592, -1.134975, -1.817192, 1, 1, 1, 1, 1,
-0.8733636, 0.0333754, -2.794285, 1, 1, 1, 1, 1,
-0.8718278, 1.036851, -0.4246231, 1, 1, 1, 1, 1,
-0.8648902, 1.697108, -0.2586515, 1, 1, 1, 1, 1,
-0.8615412, 0.2504547, -2.977692, 1, 1, 1, 1, 1,
-0.8568056, -1.066915, -3.772386, 1, 1, 1, 1, 1,
-0.8566254, 0.39017, -1.050545, 1, 1, 1, 1, 1,
-0.8522471, -2.024459, -2.528478, 1, 1, 1, 1, 1,
-0.8510656, -0.5720053, -2.906215, 1, 1, 1, 1, 1,
-0.8466676, 0.5363809, 0.3819912, 1, 1, 1, 1, 1,
-0.8444801, -0.6624532, -0.1338391, 1, 1, 1, 1, 1,
-0.8436303, -1.504595, -3.992251, 1, 1, 1, 1, 1,
-0.841937, 0.1319571, -1.533682, 1, 1, 1, 1, 1,
-0.8366833, -0.5255818, -1.661678, 1, 1, 1, 1, 1,
-0.8342611, 0.009652578, -2.191015, 1, 1, 1, 1, 1,
-0.8331774, -0.3353654, -0.5839849, 0, 0, 1, 1, 1,
-0.8322197, -0.1409501, -3.883525, 1, 0, 0, 1, 1,
-0.8273082, -0.22359, -0.7631335, 1, 0, 0, 1, 1,
-0.824892, 0.3591124, 0.6378015, 1, 0, 0, 1, 1,
-0.8216876, -0.2270287, -2.766423, 1, 0, 0, 1, 1,
-0.8209677, 0.1868542, -2.255038, 1, 0, 0, 1, 1,
-0.8207305, 0.1731875, -0.6829688, 0, 0, 0, 1, 1,
-0.819409, -0.5649346, -3.422863, 0, 0, 0, 1, 1,
-0.8174692, 0.3700874, -0.4184814, 0, 0, 0, 1, 1,
-0.8163147, 2.416636, -0.1472557, 0, 0, 0, 1, 1,
-0.8162349, 1.056342, -3.006401, 0, 0, 0, 1, 1,
-0.8140165, -1.217578, -2.773143, 0, 0, 0, 1, 1,
-0.8119496, -0.1967251, -3.161366, 0, 0, 0, 1, 1,
-0.811632, 0.5631983, -0.5142667, 1, 1, 1, 1, 1,
-0.8106967, -0.2516467, -1.402131, 1, 1, 1, 1, 1,
-0.7985045, 0.06317124, -1.345297, 1, 1, 1, 1, 1,
-0.7958692, 0.089429, -1.077788, 1, 1, 1, 1, 1,
-0.7933221, 1.04252, -0.6266015, 1, 1, 1, 1, 1,
-0.7884369, 0.5900082, -0.4993316, 1, 1, 1, 1, 1,
-0.7870636, 0.3568066, -2.294343, 1, 1, 1, 1, 1,
-0.7844847, -0.5050489, -1.379256, 1, 1, 1, 1, 1,
-0.783743, 0.6487569, -0.7843592, 1, 1, 1, 1, 1,
-0.7835993, -0.6535257, -0.6667163, 1, 1, 1, 1, 1,
-0.778737, 0.7505488, -1.673295, 1, 1, 1, 1, 1,
-0.7716339, -0.5274663, -3.026375, 1, 1, 1, 1, 1,
-0.7678311, -0.2279648, -1.864683, 1, 1, 1, 1, 1,
-0.766597, -0.01585701, -0.4176994, 1, 1, 1, 1, 1,
-0.7649726, -1.032516, -1.715955, 1, 1, 1, 1, 1,
-0.7645063, 0.8329409, -0.114102, 0, 0, 1, 1, 1,
-0.7626953, -0.6006588, -3.726943, 1, 0, 0, 1, 1,
-0.7587595, -1.403177, -3.14021, 1, 0, 0, 1, 1,
-0.7577815, 0.5166721, -1.707745, 1, 0, 0, 1, 1,
-0.7571578, 1.244286, 1.265281, 1, 0, 0, 1, 1,
-0.7561658, 0.8818157, -0.2274949, 1, 0, 0, 1, 1,
-0.7510616, -0.8629468, -1.797012, 0, 0, 0, 1, 1,
-0.7475795, 0.8402553, 2.160016, 0, 0, 0, 1, 1,
-0.7427812, -1.858234, -1.545967, 0, 0, 0, 1, 1,
-0.7388049, 0.005656213, -0.4139274, 0, 0, 0, 1, 1,
-0.738598, -1.338369, -1.001798, 0, 0, 0, 1, 1,
-0.7346835, -0.7853792, -1.536621, 0, 0, 0, 1, 1,
-0.726886, 0.2607694, -1.865778, 0, 0, 0, 1, 1,
-0.7258217, -0.2934578, -2.009797, 1, 1, 1, 1, 1,
-0.7206743, -0.6131905, -3.496833, 1, 1, 1, 1, 1,
-0.7204804, -1.057345, -2.280842, 1, 1, 1, 1, 1,
-0.7189292, -0.9810125, -4.374233, 1, 1, 1, 1, 1,
-0.7162759, 0.2483688, -2.162093, 1, 1, 1, 1, 1,
-0.7158024, -1.342517, -3.376489, 1, 1, 1, 1, 1,
-0.7068542, 2.609475, 0.7453977, 1, 1, 1, 1, 1,
-0.7026063, -0.9846973, -2.898938, 1, 1, 1, 1, 1,
-0.7016162, 0.4992337, -2.015212, 1, 1, 1, 1, 1,
-0.7009939, -0.6519786, -4.347147, 1, 1, 1, 1, 1,
-0.6986154, 1.894232, 0.8195453, 1, 1, 1, 1, 1,
-0.6978339, -0.8154508, -2.955665, 1, 1, 1, 1, 1,
-0.6952901, -1.315098, -2.771608, 1, 1, 1, 1, 1,
-0.6924844, -1.286772, -3.468074, 1, 1, 1, 1, 1,
-0.6754416, -0.301527, -2.048643, 1, 1, 1, 1, 1,
-0.6731675, 0.3637693, -1.094714, 0, 0, 1, 1, 1,
-0.6729608, 0.902787, 0.8087209, 1, 0, 0, 1, 1,
-0.6643055, -0.1431118, 0.3174331, 1, 0, 0, 1, 1,
-0.6636167, 0.03197606, -1.190163, 1, 0, 0, 1, 1,
-0.6587339, -0.5886968, -1.250144, 1, 0, 0, 1, 1,
-0.6555443, -1.55369, -3.284825, 1, 0, 0, 1, 1,
-0.6551622, -1.782882, -2.997515, 0, 0, 0, 1, 1,
-0.6503108, -0.2729763, -0.9826425, 0, 0, 0, 1, 1,
-0.6497725, -0.8963909, -2.940949, 0, 0, 0, 1, 1,
-0.6496603, 1.000801, -1.141353, 0, 0, 0, 1, 1,
-0.6481277, 0.4264353, -1.575153, 0, 0, 0, 1, 1,
-0.6469443, 0.007637576, -2.316441, 0, 0, 0, 1, 1,
-0.6466814, 1.430877, -0.3466449, 0, 0, 0, 1, 1,
-0.6462445, 0.6931016, -1.042848, 1, 1, 1, 1, 1,
-0.643952, -1.89726, -2.120985, 1, 1, 1, 1, 1,
-0.6438412, 0.5441067, -0.1698833, 1, 1, 1, 1, 1,
-0.6434392, -0.487343, -1.819579, 1, 1, 1, 1, 1,
-0.6423005, 2.601323, -1.648208, 1, 1, 1, 1, 1,
-0.6404089, 0.199511, -2.71131, 1, 1, 1, 1, 1,
-0.6300847, 1.496098, 0.6927229, 1, 1, 1, 1, 1,
-0.6266059, -2.792073, -1.71845, 1, 1, 1, 1, 1,
-0.6230702, 0.6670156, 0.004301753, 1, 1, 1, 1, 1,
-0.6222267, 1.037776, -1.660686, 1, 1, 1, 1, 1,
-0.6214578, -0.1004116, -2.120725, 1, 1, 1, 1, 1,
-0.6187832, -0.6887345, -2.50297, 1, 1, 1, 1, 1,
-0.6168466, 0.5264512, 0.03604788, 1, 1, 1, 1, 1,
-0.6159465, 0.2897027, -0.754802, 1, 1, 1, 1, 1,
-0.6129343, -1.526736, -1.491093, 1, 1, 1, 1, 1,
-0.6105785, 0.8524501, -0.9172128, 0, 0, 1, 1, 1,
-0.6095886, 0.8133565, -0.6717654, 1, 0, 0, 1, 1,
-0.6090549, 1.022802, 0.8054924, 1, 0, 0, 1, 1,
-0.6073335, 0.7161424, -1.865873, 1, 0, 0, 1, 1,
-0.6058112, 1.744404, -0.8573329, 1, 0, 0, 1, 1,
-0.6026101, 0.05817861, -0.645584, 1, 0, 0, 1, 1,
-0.5973453, 0.2259651, -0.2202088, 0, 0, 0, 1, 1,
-0.5941433, -0.9735836, -1.101883, 0, 0, 0, 1, 1,
-0.5939538, -1.489637, -3.456142, 0, 0, 0, 1, 1,
-0.5938007, 0.1727637, -1.380217, 0, 0, 0, 1, 1,
-0.5886326, 0.4371156, -2.138698, 0, 0, 0, 1, 1,
-0.5876777, 1.147413, 0.698826, 0, 0, 0, 1, 1,
-0.586642, -0.3513143, -3.705899, 0, 0, 0, 1, 1,
-0.5852324, -1.197528, -1.706386, 1, 1, 1, 1, 1,
-0.5849174, -1.286452, -4.236805, 1, 1, 1, 1, 1,
-0.5837225, 1.498594, -0.3552531, 1, 1, 1, 1, 1,
-0.5822666, 0.1111387, -2.015977, 1, 1, 1, 1, 1,
-0.5803072, -1.563761, -2.871022, 1, 1, 1, 1, 1,
-0.5757574, -1.462629, -1.232068, 1, 1, 1, 1, 1,
-0.5755377, 0.9937098, -1.438753, 1, 1, 1, 1, 1,
-0.5753908, -0.4930746, -2.961724, 1, 1, 1, 1, 1,
-0.5694331, 0.06626974, 0.7059313, 1, 1, 1, 1, 1,
-0.5691576, 0.4919717, 0.2096256, 1, 1, 1, 1, 1,
-0.5658035, 0.02747693, -0.9438038, 1, 1, 1, 1, 1,
-0.5583302, -1.297769, -4.042838, 1, 1, 1, 1, 1,
-0.5557036, -0.272709, -2.847847, 1, 1, 1, 1, 1,
-0.5533645, 1.050625, 0.1270995, 1, 1, 1, 1, 1,
-0.5518616, 0.4503301, -1.305753, 1, 1, 1, 1, 1,
-0.5453775, 0.2445526, -2.012233, 0, 0, 1, 1, 1,
-0.5424318, -0.5921452, -2.111547, 1, 0, 0, 1, 1,
-0.5420136, 0.0525268, -2.831778, 1, 0, 0, 1, 1,
-0.5410143, 0.2199367, -1.981108, 1, 0, 0, 1, 1,
-0.5378811, 0.2635047, 0.01010885, 1, 0, 0, 1, 1,
-0.5364174, 1.850295, -1.654334, 1, 0, 0, 1, 1,
-0.5362434, 0.7458769, -1.535524, 0, 0, 0, 1, 1,
-0.5296042, 0.3424977, -1.308397, 0, 0, 0, 1, 1,
-0.5230426, -0.3851976, -3.28503, 0, 0, 0, 1, 1,
-0.5218136, -0.5307373, -3.721632, 0, 0, 0, 1, 1,
-0.5204037, 0.9922881, -0.01225416, 0, 0, 0, 1, 1,
-0.5199265, 0.5528545, -0.3514878, 0, 0, 0, 1, 1,
-0.5183095, 0.9819828, -0.6101825, 0, 0, 0, 1, 1,
-0.5135098, 0.3578525, -2.360785, 1, 1, 1, 1, 1,
-0.5119521, 0.2178681, -2.800592, 1, 1, 1, 1, 1,
-0.507969, 0.7056526, -0.7354973, 1, 1, 1, 1, 1,
-0.5059359, -0.285538, -1.047591, 1, 1, 1, 1, 1,
-0.5019461, 0.7878175, -0.5826188, 1, 1, 1, 1, 1,
-0.4950782, 0.8372881, -0.911328, 1, 1, 1, 1, 1,
-0.4934231, 0.9324445, -1.355584, 1, 1, 1, 1, 1,
-0.4917099, -0.05151756, -2.250844, 1, 1, 1, 1, 1,
-0.4885768, 0.2645078, 0.4438791, 1, 1, 1, 1, 1,
-0.4818663, 1.034283, -1.900724, 1, 1, 1, 1, 1,
-0.4799985, 1.45902, 0.1300311, 1, 1, 1, 1, 1,
-0.4764302, -0.72678, -4.209366, 1, 1, 1, 1, 1,
-0.4739134, 1.288759, -0.7546432, 1, 1, 1, 1, 1,
-0.472128, -0.3209883, -3.039882, 1, 1, 1, 1, 1,
-0.4717872, 0.1027183, -0.3874227, 1, 1, 1, 1, 1,
-0.4691221, 1.853463, -0.01614639, 0, 0, 1, 1, 1,
-0.467293, 1.062147, -0.6630901, 1, 0, 0, 1, 1,
-0.4647034, 1.541559, -0.5797044, 1, 0, 0, 1, 1,
-0.4642155, 0.5050717, -1.060189, 1, 0, 0, 1, 1,
-0.4616531, 0.1323995, -1.02185, 1, 0, 0, 1, 1,
-0.4606199, 0.1408517, -1.573856, 1, 0, 0, 1, 1,
-0.460141, -1.173438, -3.894081, 0, 0, 0, 1, 1,
-0.4567387, 1.651951, 0.1794294, 0, 0, 0, 1, 1,
-0.4516107, 1.205065, -0.1508613, 0, 0, 0, 1, 1,
-0.4465543, 1.208206, 0.3897695, 0, 0, 0, 1, 1,
-0.4452989, 1.337633, 0.8959054, 0, 0, 0, 1, 1,
-0.4407757, -0.8552855, -1.862691, 0, 0, 0, 1, 1,
-0.4385897, 0.9443235, -0.366051, 0, 0, 0, 1, 1,
-0.4360811, -1.786701, -2.503275, 1, 1, 1, 1, 1,
-0.4351974, 0.9633361, 1.62129, 1, 1, 1, 1, 1,
-0.4343635, 0.6162946, 0.3053973, 1, 1, 1, 1, 1,
-0.4333938, 0.3054626, -1.119363, 1, 1, 1, 1, 1,
-0.4310858, -0.2036095, -1.202683, 1, 1, 1, 1, 1,
-0.4263635, -1.947328, -3.186239, 1, 1, 1, 1, 1,
-0.4237764, 0.8548853, -1.285911, 1, 1, 1, 1, 1,
-0.4196054, -0.9054598, -3.155908, 1, 1, 1, 1, 1,
-0.4180001, -1.344108, -1.013585, 1, 1, 1, 1, 1,
-0.4158035, 0.6076248, 0.1687371, 1, 1, 1, 1, 1,
-0.410301, -0.03830064, -1.30762, 1, 1, 1, 1, 1,
-0.4091014, 0.4765507, 1.064188, 1, 1, 1, 1, 1,
-0.4087604, -1.130663, -3.125167, 1, 1, 1, 1, 1,
-0.4031495, 0.1676075, -0.8455104, 1, 1, 1, 1, 1,
-0.4029319, -0.3616169, -2.745529, 1, 1, 1, 1, 1,
-0.3957793, 0.02447343, -0.8498541, 0, 0, 1, 1, 1,
-0.3954341, 0.2721625, -1.310114, 1, 0, 0, 1, 1,
-0.3941141, 0.151562, -2.130299, 1, 0, 0, 1, 1,
-0.3920725, 0.3443152, -0.1698368, 1, 0, 0, 1, 1,
-0.391258, 1.036096, -1.527392, 1, 0, 0, 1, 1,
-0.3893892, 0.152924, -2.352816, 1, 0, 0, 1, 1,
-0.3860997, 1.082606, 0.8482614, 0, 0, 0, 1, 1,
-0.3824755, 0.4612615, 0.05078581, 0, 0, 0, 1, 1,
-0.381925, 2.108487, -0.7314596, 0, 0, 0, 1, 1,
-0.3817136, 0.2037827, -1.344447, 0, 0, 0, 1, 1,
-0.3809718, 2.47259, 0.3724673, 0, 0, 0, 1, 1,
-0.3797754, 1.432114, -0.5184187, 0, 0, 0, 1, 1,
-0.3788208, 0.5925457, -1.795754, 0, 0, 0, 1, 1,
-0.3782081, 0.416421, -1.300911, 1, 1, 1, 1, 1,
-0.3768722, 0.4404019, -1.549276, 1, 1, 1, 1, 1,
-0.3767336, 0.5894493, -1.139952, 1, 1, 1, 1, 1,
-0.3730978, 1.297696, -1.045891, 1, 1, 1, 1, 1,
-0.3723796, 0.8109956, 0.008053221, 1, 1, 1, 1, 1,
-0.3711123, -1.562447, -3.313683, 1, 1, 1, 1, 1,
-0.36898, -0.5674375, -3.208078, 1, 1, 1, 1, 1,
-0.3632449, -0.05453981, -1.524669, 1, 1, 1, 1, 1,
-0.3593223, -0.2720329, -2.204994, 1, 1, 1, 1, 1,
-0.3592533, 1.454581, -0.9022608, 1, 1, 1, 1, 1,
-0.3525371, -0.3740517, -3.27821, 1, 1, 1, 1, 1,
-0.3521162, -0.5848092, -3.551988, 1, 1, 1, 1, 1,
-0.351027, 0.5662346, -1.460945, 1, 1, 1, 1, 1,
-0.3423013, 0.3152312, -1.052221, 1, 1, 1, 1, 1,
-0.3390629, -0.2608741, -2.073426, 1, 1, 1, 1, 1,
-0.3286592, -1.775711, -3.106428, 0, 0, 1, 1, 1,
-0.3251395, 0.5159792, -0.3291422, 1, 0, 0, 1, 1,
-0.3246342, -0.4704176, -2.683383, 1, 0, 0, 1, 1,
-0.32329, -0.09186424, -3.05578, 1, 0, 0, 1, 1,
-0.3186577, -0.8296555, -3.496162, 1, 0, 0, 1, 1,
-0.3158132, 0.2111049, -0.6136532, 1, 0, 0, 1, 1,
-0.3097589, 0.7895041, -0.6461087, 0, 0, 0, 1, 1,
-0.3051448, -0.9049538, -3.998179, 0, 0, 0, 1, 1,
-0.3049723, 0.9252837, -1.771813, 0, 0, 0, 1, 1,
-0.3009575, -0.1568528, -1.60635, 0, 0, 0, 1, 1,
-0.3002249, 0.8069291, -1.072627, 0, 0, 0, 1, 1,
-0.2985924, -1.747966, -2.6333, 0, 0, 0, 1, 1,
-0.2899823, 1.507736, 0.232675, 0, 0, 0, 1, 1,
-0.2895248, -0.09768777, -0.4222102, 1, 1, 1, 1, 1,
-0.2884469, -1.671325, -4.482534, 1, 1, 1, 1, 1,
-0.2850272, -0.572872, -1.95768, 1, 1, 1, 1, 1,
-0.2802831, -0.5415124, -2.602655, 1, 1, 1, 1, 1,
-0.276646, 1.588102, 0.0853745, 1, 1, 1, 1, 1,
-0.2753327, -0.2921655, -3.435012, 1, 1, 1, 1, 1,
-0.2733181, 0.2297649, -0.1105338, 1, 1, 1, 1, 1,
-0.2663493, -1.002363, -1.58108, 1, 1, 1, 1, 1,
-0.265467, -0.4113984, -3.513693, 1, 1, 1, 1, 1,
-0.2654305, -0.6949092, -1.620436, 1, 1, 1, 1, 1,
-0.263171, 0.2506541, -3.198533, 1, 1, 1, 1, 1,
-0.2625428, -0.3726599, -5.414548, 1, 1, 1, 1, 1,
-0.2577989, -0.2206927, -1.870357, 1, 1, 1, 1, 1,
-0.2531399, -3.366408, -3.64045, 1, 1, 1, 1, 1,
-0.2509151, -2.246379, -1.724779, 1, 1, 1, 1, 1,
-0.2506315, 0.2420039, 0.1590049, 0, 0, 1, 1, 1,
-0.2497967, -1.853095, -3.094324, 1, 0, 0, 1, 1,
-0.2471664, 0.4209442, 0.8454059, 1, 0, 0, 1, 1,
-0.2454179, 0.305414, -0.6516966, 1, 0, 0, 1, 1,
-0.239246, 0.4844261, -0.7367759, 1, 0, 0, 1, 1,
-0.2384624, -0.8243811, -2.356522, 1, 0, 0, 1, 1,
-0.2374729, 0.3818268, 0.6890135, 0, 0, 0, 1, 1,
-0.2365959, 1.435838, -2.392683, 0, 0, 0, 1, 1,
-0.2248689, -0.5762582, -2.026308, 0, 0, 0, 1, 1,
-0.2239458, 1.478076, -0.9177988, 0, 0, 0, 1, 1,
-0.2239322, -1.279571, -3.101631, 0, 0, 0, 1, 1,
-0.222065, -0.9402601, -3.130661, 0, 0, 0, 1, 1,
-0.2184364, -1.344394, -1.289886, 0, 0, 0, 1, 1,
-0.2155409, -0.3549728, -0.8103309, 1, 1, 1, 1, 1,
-0.212705, -1.05861, -3.56444, 1, 1, 1, 1, 1,
-0.2055304, -0.5680401, -2.621828, 1, 1, 1, 1, 1,
-0.2006427, 0.7075729, 2.407766, 1, 1, 1, 1, 1,
-0.1966608, -0.3724482, -5.187025, 1, 1, 1, 1, 1,
-0.1961306, 1.339389, 0.1776132, 1, 1, 1, 1, 1,
-0.1923656, 0.6122476, -0.8311028, 1, 1, 1, 1, 1,
-0.1871281, -0.3694725, -4.497376, 1, 1, 1, 1, 1,
-0.1855934, -0.971661, -2.75161, 1, 1, 1, 1, 1,
-0.1849438, -0.1892781, -2.990576, 1, 1, 1, 1, 1,
-0.179672, 0.6802857, 0.3988838, 1, 1, 1, 1, 1,
-0.1793391, 1.307458, -1.924198, 1, 1, 1, 1, 1,
-0.1786798, -1.065415, -3.986451, 1, 1, 1, 1, 1,
-0.1767893, -0.09753402, -3.675586, 1, 1, 1, 1, 1,
-0.1728697, -1.112037, -2.701072, 1, 1, 1, 1, 1,
-0.1705905, 0.3181386, 0.5745847, 0, 0, 1, 1, 1,
-0.1678017, -0.5391673, -5.057059, 1, 0, 0, 1, 1,
-0.1657755, 1.649081, -0.9667767, 1, 0, 0, 1, 1,
-0.1641815, -2.116023, -3.880408, 1, 0, 0, 1, 1,
-0.1627571, 0.5988356, 0.7375396, 1, 0, 0, 1, 1,
-0.1561061, -2.861908, -2.314133, 1, 0, 0, 1, 1,
-0.1557603, -1.059178, -2.992352, 0, 0, 0, 1, 1,
-0.1539889, 1.177273, 1.120593, 0, 0, 0, 1, 1,
-0.1506321, 0.374895, -0.07819334, 0, 0, 0, 1, 1,
-0.1486239, -0.7046432, -1.513198, 0, 0, 0, 1, 1,
-0.148283, -0.2775607, -3.955886, 0, 0, 0, 1, 1,
-0.1476523, -0.1904808, -2.474596, 0, 0, 0, 1, 1,
-0.1462274, -0.6567922, -3.093212, 0, 0, 0, 1, 1,
-0.1410726, -1.316412, -1.866832, 1, 1, 1, 1, 1,
-0.1409473, 0.1266846, -0.9494875, 1, 1, 1, 1, 1,
-0.1326602, -0.4061951, -3.428111, 1, 1, 1, 1, 1,
-0.132506, -0.5301128, -3.415796, 1, 1, 1, 1, 1,
-0.131263, -0.4386809, -3.169259, 1, 1, 1, 1, 1,
-0.130684, 0.2980613, -1.204051, 1, 1, 1, 1, 1,
-0.1296156, 0.3482002, -0.4951529, 1, 1, 1, 1, 1,
-0.1236109, 0.3405973, -2.297272, 1, 1, 1, 1, 1,
-0.1234659, -1.605164, -0.986082, 1, 1, 1, 1, 1,
-0.1227396, -0.7109812, -2.379704, 1, 1, 1, 1, 1,
-0.117623, -0.0982735, -1.33418, 1, 1, 1, 1, 1,
-0.1128028, -0.9067259, -3.308068, 1, 1, 1, 1, 1,
-0.1100418, 1.066877, -0.3038565, 1, 1, 1, 1, 1,
-0.1074942, 1.020483, -0.4513976, 1, 1, 1, 1, 1,
-0.1061704, 0.863396, -1.376283, 1, 1, 1, 1, 1,
-0.09949399, -0.5922866, -3.849628, 0, 0, 1, 1, 1,
-0.09493798, -0.2613983, -2.312333, 1, 0, 0, 1, 1,
-0.09351033, -0.237589, -3.791026, 1, 0, 0, 1, 1,
-0.09284056, 0.7519546, 0.9414996, 1, 0, 0, 1, 1,
-0.09167536, 1.441986, 0.859298, 1, 0, 0, 1, 1,
-0.0880302, -0.2638934, -2.073245, 1, 0, 0, 1, 1,
-0.08301418, -0.4668195, -0.6228728, 0, 0, 0, 1, 1,
-0.08300649, -0.1053511, -1.095146, 0, 0, 0, 1, 1,
-0.07610091, -0.03862271, -2.783998, 0, 0, 0, 1, 1,
-0.07467905, 0.6332877, -0.01471625, 0, 0, 0, 1, 1,
-0.07251264, 0.6018162, 1.056036, 0, 0, 0, 1, 1,
-0.07155504, -0.2130349, -3.880577, 0, 0, 0, 1, 1,
-0.071417, 0.3054614, 0.5532844, 0, 0, 0, 1, 1,
-0.0704705, 0.1622994, -0.6364095, 1, 1, 1, 1, 1,
-0.06732742, 0.3262572, -0.7647958, 1, 1, 1, 1, 1,
-0.06619859, 1.397818, 2.162756, 1, 1, 1, 1, 1,
-0.05741488, 0.5104666, 0.9551662, 1, 1, 1, 1, 1,
-0.05238454, 0.8738188, 0.6833128, 1, 1, 1, 1, 1,
-0.05176784, 0.12573, 0.3223563, 1, 1, 1, 1, 1,
-0.04964695, 0.557904, -0.1871048, 1, 1, 1, 1, 1,
-0.04783136, 0.7660069, 0.2486745, 1, 1, 1, 1, 1,
-0.04570257, 1.482294, -1.71358, 1, 1, 1, 1, 1,
-0.03620556, -1.509605, -1.583382, 1, 1, 1, 1, 1,
-0.03443467, -1.46541, -4.188277, 1, 1, 1, 1, 1,
-0.03396061, -1.377822, -2.638755, 1, 1, 1, 1, 1,
-0.03395666, 1.38772, 0.7162347, 1, 1, 1, 1, 1,
-0.03023069, 1.63881, 1.195921, 1, 1, 1, 1, 1,
-0.02992877, -2.482334, -3.646275, 1, 1, 1, 1, 1,
-0.02922901, 1.322821, -1.041256, 0, 0, 1, 1, 1,
-0.02708121, -1.012697, -3.700486, 1, 0, 0, 1, 1,
-0.02546057, -0.5682564, -2.500602, 1, 0, 0, 1, 1,
-0.02196913, -0.1995309, -3.99294, 1, 0, 0, 1, 1,
-0.01856095, 0.4602431, 1.998361, 1, 0, 0, 1, 1,
-0.01803749, 0.07275978, -0.7295015, 1, 0, 0, 1, 1,
-0.01772011, 0.5336018, 0.418177, 0, 0, 0, 1, 1,
-0.01357999, -1.297914, -2.471829, 0, 0, 0, 1, 1,
-0.01105546, -1.045673, -0.5963481, 0, 0, 0, 1, 1,
-0.00904663, 0.1931855, -0.1786071, 0, 0, 0, 1, 1,
-0.005543407, 0.1220819, -1.599, 0, 0, 0, 1, 1,
-0.004928687, -0.5154943, -3.823901, 0, 0, 0, 1, 1,
-0.002588124, -0.3617882, -3.003317, 0, 0, 0, 1, 1,
-0.00071239, 0.001197585, -0.6726485, 1, 1, 1, 1, 1,
0.001395975, 0.5508865, -0.3103259, 1, 1, 1, 1, 1,
0.001732623, 1.309283, -0.8345261, 1, 1, 1, 1, 1,
0.001764798, -0.4256792, 3.362583, 1, 1, 1, 1, 1,
0.003138534, -0.2242626, 3.000718, 1, 1, 1, 1, 1,
0.003946471, 0.1342869, 1.599786, 1, 1, 1, 1, 1,
0.004858874, -1.541379, 1.559673, 1, 1, 1, 1, 1,
0.006248309, 0.9799458, 0.1104709, 1, 1, 1, 1, 1,
0.008374264, 0.09371943, -0.7643772, 1, 1, 1, 1, 1,
0.01110367, 1.027675, 0.4303428, 1, 1, 1, 1, 1,
0.0114484, -0.06417213, 2.740244, 1, 1, 1, 1, 1,
0.01654017, -0.076376, 3.023858, 1, 1, 1, 1, 1,
0.01669458, 0.5358229, -2.205915, 1, 1, 1, 1, 1,
0.01736548, -0.510704, 3.038514, 1, 1, 1, 1, 1,
0.01758931, -0.03336764, 2.649976, 1, 1, 1, 1, 1,
0.01853165, 1.17556, 0.09216658, 0, 0, 1, 1, 1,
0.01918771, 0.008544981, -0.4567024, 1, 0, 0, 1, 1,
0.01980878, -0.03151643, 3.736047, 1, 0, 0, 1, 1,
0.0272009, 1.25309, -0.8212477, 1, 0, 0, 1, 1,
0.03140437, 1.30473, 0.7626288, 1, 0, 0, 1, 1,
0.03586117, 1.215915, 1.293317, 1, 0, 0, 1, 1,
0.04140445, -0.9917723, 3.642989, 0, 0, 0, 1, 1,
0.04168254, 0.2707201, 0.7935682, 0, 0, 0, 1, 1,
0.04193781, 0.4787657, 1.675795, 0, 0, 0, 1, 1,
0.04529383, -0.1945865, 4.18825, 0, 0, 0, 1, 1,
0.04626127, 0.2950394, 1.243619, 0, 0, 0, 1, 1,
0.04782418, 0.1063046, -0.2963636, 0, 0, 0, 1, 1,
0.05082533, -0.06625803, 1.00675, 0, 0, 0, 1, 1,
0.05324837, 0.506799, -0.8849699, 1, 1, 1, 1, 1,
0.0553075, -1.146519, 2.71729, 1, 1, 1, 1, 1,
0.05752748, 0.1671536, 0.8735168, 1, 1, 1, 1, 1,
0.05938483, -1.617384, 2.39309, 1, 1, 1, 1, 1,
0.06126413, 0.3550667, 0.7510149, 1, 1, 1, 1, 1,
0.06389696, -0.4225119, 2.54221, 1, 1, 1, 1, 1,
0.06446182, 0.1531738, 2.684271, 1, 1, 1, 1, 1,
0.067117, 0.5166787, 1.249127, 1, 1, 1, 1, 1,
0.07162853, -2.758588, 4.140996, 1, 1, 1, 1, 1,
0.07381656, -0.5246699, 4.152181, 1, 1, 1, 1, 1,
0.08411139, -0.01377132, 0.2541837, 1, 1, 1, 1, 1,
0.09135988, 1.168694, 1.724389, 1, 1, 1, 1, 1,
0.09258843, -1.00171, 2.327234, 1, 1, 1, 1, 1,
0.09754952, 0.09883504, 0.8271448, 1, 1, 1, 1, 1,
0.09802447, -1.800143, 1.840485, 1, 1, 1, 1, 1,
0.1057017, -2.736711, 4.195162, 0, 0, 1, 1, 1,
0.1166076, -0.3287742, 0.5579374, 1, 0, 0, 1, 1,
0.1221777, 0.8787801, -0.3718582, 1, 0, 0, 1, 1,
0.1228012, 0.4033732, -0.4929197, 1, 0, 0, 1, 1,
0.1229226, 1.765163, 1.018212, 1, 0, 0, 1, 1,
0.1241966, -0.8700765, 2.812479, 1, 0, 0, 1, 1,
0.1254685, 0.08745308, 0.7470863, 0, 0, 0, 1, 1,
0.130742, 0.2453974, 0.3647661, 0, 0, 0, 1, 1,
0.1309136, 0.6552419, 0.2614141, 0, 0, 0, 1, 1,
0.1320768, -1.321005, 2.810458, 0, 0, 0, 1, 1,
0.1329371, 0.8190182, -1.353528, 0, 0, 0, 1, 1,
0.1412388, 0.3154643, 0.08806813, 0, 0, 0, 1, 1,
0.1460229, 0.08075771, 1.735757, 0, 0, 0, 1, 1,
0.1498155, -0.5580439, 1.999618, 1, 1, 1, 1, 1,
0.157583, -1.313623, 4.07484, 1, 1, 1, 1, 1,
0.157666, -0.08619305, 1.209278, 1, 1, 1, 1, 1,
0.1643639, -0.3221091, 2.881556, 1, 1, 1, 1, 1,
0.1715822, 0.554069, 0.1883112, 1, 1, 1, 1, 1,
0.1758193, -0.5392317, 3.7617, 1, 1, 1, 1, 1,
0.1879095, 1.038998, -0.08473311, 1, 1, 1, 1, 1,
0.1909941, -0.9698334, 2.263037, 1, 1, 1, 1, 1,
0.1923565, 0.8030387, -0.2781807, 1, 1, 1, 1, 1,
0.1976588, -0.6618493, 3.746701, 1, 1, 1, 1, 1,
0.2052584, -0.5595681, 4.621699, 1, 1, 1, 1, 1,
0.209963, 2.24496, 0.7673113, 1, 1, 1, 1, 1,
0.2135773, -0.09432888, 0.7205832, 1, 1, 1, 1, 1,
0.2139727, 0.32482, -0.6838537, 1, 1, 1, 1, 1,
0.216771, -0.7892538, 2.959523, 1, 1, 1, 1, 1,
0.2189124, 0.2929207, 0.2301109, 0, 0, 1, 1, 1,
0.219125, -0.8171765, 1.134845, 1, 0, 0, 1, 1,
0.2223553, -0.2600737, 4.281393, 1, 0, 0, 1, 1,
0.228459, -0.5793, 1.286263, 1, 0, 0, 1, 1,
0.2286789, 1.791612, -0.6029833, 1, 0, 0, 1, 1,
0.2364156, -0.4611814, 1.427277, 1, 0, 0, 1, 1,
0.2367707, 1.102348, 1.746603, 0, 0, 0, 1, 1,
0.236976, -0.3356839, 1.044512, 0, 0, 0, 1, 1,
0.2392093, 1.095357, 0.2196416, 0, 0, 0, 1, 1,
0.2412661, 0.6415551, 0.3808241, 0, 0, 0, 1, 1,
0.2448175, 0.4268958, 1.013971, 0, 0, 0, 1, 1,
0.2455039, -0.9523395, 2.206103, 0, 0, 0, 1, 1,
0.2458941, -0.06232178, 2.181831, 0, 0, 0, 1, 1,
0.2462918, 1.407373, -0.2020153, 1, 1, 1, 1, 1,
0.2490744, 1.115391, 1.051008, 1, 1, 1, 1, 1,
0.2505584, 0.1843033, 0.596127, 1, 1, 1, 1, 1,
0.2508162, 0.4026493, 0.1130136, 1, 1, 1, 1, 1,
0.253841, 0.3273493, 0.1093686, 1, 1, 1, 1, 1,
0.2610754, 0.6595187, 1.027161, 1, 1, 1, 1, 1,
0.2629764, -0.01117675, 1.40721, 1, 1, 1, 1, 1,
0.271663, -0.3502378, 3.642049, 1, 1, 1, 1, 1,
0.2723628, -0.2762312, 2.818009, 1, 1, 1, 1, 1,
0.2752809, 1.703222, -0.1086518, 1, 1, 1, 1, 1,
0.2772106, -0.06460328, 2.235816, 1, 1, 1, 1, 1,
0.2785603, 2.27497, 2.523466, 1, 1, 1, 1, 1,
0.2799965, -0.283766, 2.437273, 1, 1, 1, 1, 1,
0.2816762, -0.7965603, 3.655873, 1, 1, 1, 1, 1,
0.2831556, -0.313664, 2.623569, 1, 1, 1, 1, 1,
0.2843478, -0.8432425, 1.02226, 0, 0, 1, 1, 1,
0.2868313, 0.8400839, 0.3031121, 1, 0, 0, 1, 1,
0.2868593, -0.2282581, 2.291949, 1, 0, 0, 1, 1,
0.2887017, -1.059869, 3.009701, 1, 0, 0, 1, 1,
0.2927947, -2.601663, 3.640654, 1, 0, 0, 1, 1,
0.2929471, -0.2032313, 0.7400361, 1, 0, 0, 1, 1,
0.2937969, 1.281492, -0.9040246, 0, 0, 0, 1, 1,
0.2940712, -0.7998958, 2.71502, 0, 0, 0, 1, 1,
0.3064857, -1.819284, 1.329807, 0, 0, 0, 1, 1,
0.3075091, -1.031998, 2.952788, 0, 0, 0, 1, 1,
0.3101175, -0.1879109, 0.3741023, 0, 0, 0, 1, 1,
0.3159399, -0.1043599, 1.90035, 0, 0, 0, 1, 1,
0.3162834, 0.8965261, 1.550503, 0, 0, 0, 1, 1,
0.3165336, 1.120634, 0.5963739, 1, 1, 1, 1, 1,
0.3190658, 1.763175, 1.258028, 1, 1, 1, 1, 1,
0.3257361, 0.4489849, -0.4695106, 1, 1, 1, 1, 1,
0.333498, -0.2936516, 2.829679, 1, 1, 1, 1, 1,
0.3346894, -1.04591, 3.016932, 1, 1, 1, 1, 1,
0.3347239, 0.1068136, 3.10466, 1, 1, 1, 1, 1,
0.3371085, 0.4257351, -1.05638, 1, 1, 1, 1, 1,
0.342086, -1.84458, 3.695792, 1, 1, 1, 1, 1,
0.3464716, -0.7165993, 1.416929, 1, 1, 1, 1, 1,
0.3507832, -0.007692623, 2.062227, 1, 1, 1, 1, 1,
0.3511738, 3.0709, -1.360087, 1, 1, 1, 1, 1,
0.3536698, 0.5167567, -0.9537519, 1, 1, 1, 1, 1,
0.3551256, 0.6370984, -0.7395598, 1, 1, 1, 1, 1,
0.3592534, -0.3340028, 4.05694, 1, 1, 1, 1, 1,
0.3613803, -1.623633, 3.929142, 1, 1, 1, 1, 1,
0.3625015, -1.170394, 3.51968, 0, 0, 1, 1, 1,
0.3627994, 0.6461513, 1.803588, 1, 0, 0, 1, 1,
0.3694639, 1.977981, -1.568709, 1, 0, 0, 1, 1,
0.3727773, -1.282476, 1.938491, 1, 0, 0, 1, 1,
0.3734607, 0.3157218, 0.2449627, 1, 0, 0, 1, 1,
0.3778189, 1.147544, 0.4049229, 1, 0, 0, 1, 1,
0.3778521, 0.998776, 0.4250231, 0, 0, 0, 1, 1,
0.3791243, -0.8980625, 3.578392, 0, 0, 0, 1, 1,
0.3794509, -0.5726505, 2.051867, 0, 0, 0, 1, 1,
0.3825182, -1.001729, 3.733596, 0, 0, 0, 1, 1,
0.3874168, 0.5598035, -0.4554398, 0, 0, 0, 1, 1,
0.3885459, 0.3359182, 0.7675415, 0, 0, 0, 1, 1,
0.3903213, -0.7730473, 2.537539, 0, 0, 0, 1, 1,
0.3953177, 1.057505, -0.431855, 1, 1, 1, 1, 1,
0.4008005, -0.06156761, 1.760668, 1, 1, 1, 1, 1,
0.4017508, 0.9536746, 1.625458, 1, 1, 1, 1, 1,
0.4041413, 0.7086552, 1.076527, 1, 1, 1, 1, 1,
0.4086259, -0.3136797, 2.658661, 1, 1, 1, 1, 1,
0.4109116, 0.6714641, 0.1121599, 1, 1, 1, 1, 1,
0.4198462, 0.3623576, 2.900594, 1, 1, 1, 1, 1,
0.4217706, 0.07229677, 1.738465, 1, 1, 1, 1, 1,
0.4278895, -3.402768, 1.538008, 1, 1, 1, 1, 1,
0.4287908, -0.9210773, 2.221295, 1, 1, 1, 1, 1,
0.4360686, 1.814257, -0.522857, 1, 1, 1, 1, 1,
0.437295, -2.265317, 0.2774495, 1, 1, 1, 1, 1,
0.4383275, -0.5702552, 1.793796, 1, 1, 1, 1, 1,
0.4405837, 1.110434, -0.7551458, 1, 1, 1, 1, 1,
0.4418465, -1.289007, 1.84859, 1, 1, 1, 1, 1,
0.4427192, -0.3861934, 2.170763, 0, 0, 1, 1, 1,
0.4502222, -0.7410378, 0.990741, 1, 0, 0, 1, 1,
0.4510356, -0.08050327, 2.851393, 1, 0, 0, 1, 1,
0.4527066, -0.03281676, 1.732918, 1, 0, 0, 1, 1,
0.4558287, -0.226936, 2.309522, 1, 0, 0, 1, 1,
0.4565026, 0.2321075, 1.802438, 1, 0, 0, 1, 1,
0.4642873, -2.040394, 3.562545, 0, 0, 0, 1, 1,
0.466098, -0.07196719, 2.81965, 0, 0, 0, 1, 1,
0.4672663, 1.908298, 0.6924155, 0, 0, 0, 1, 1,
0.4688899, -0.2723322, 2.259448, 0, 0, 0, 1, 1,
0.4703426, 1.253156, 0.2694347, 0, 0, 0, 1, 1,
0.4721371, -0.377632, 1.21145, 0, 0, 0, 1, 1,
0.4735993, -0.02786555, 2.730773, 0, 0, 0, 1, 1,
0.4759491, 0.270992, 0.1302769, 1, 1, 1, 1, 1,
0.4778588, -0.6447932, 1.775272, 1, 1, 1, 1, 1,
0.4782502, -0.5051188, 2.151731, 1, 1, 1, 1, 1,
0.4871871, -0.2131489, 1.363897, 1, 1, 1, 1, 1,
0.4921382, 0.984219, -0.146726, 1, 1, 1, 1, 1,
0.4926666, -0.6506201, 3.707207, 1, 1, 1, 1, 1,
0.4936296, -0.6926754, 2.985553, 1, 1, 1, 1, 1,
0.4989075, -0.1308538, 3.43794, 1, 1, 1, 1, 1,
0.4992103, -0.3122875, 2.164387, 1, 1, 1, 1, 1,
0.5018648, -0.1864824, 1.961018, 1, 1, 1, 1, 1,
0.5035689, -0.8075939, 2.771765, 1, 1, 1, 1, 1,
0.5083122, -0.4815883, 0.9372497, 1, 1, 1, 1, 1,
0.514276, 0.5571147, 1.177207, 1, 1, 1, 1, 1,
0.5195675, 0.3772386, 2.415675, 1, 1, 1, 1, 1,
0.5240608, -0.3421528, 2.361023, 1, 1, 1, 1, 1,
0.5262968, -0.9677084, 3.860623, 0, 0, 1, 1, 1,
0.5319824, 0.2089337, -0.6856714, 1, 0, 0, 1, 1,
0.5355039, 0.887788, 0.8058073, 1, 0, 0, 1, 1,
0.5413375, 1.194057, 1.364835, 1, 0, 0, 1, 1,
0.5594384, 0.3340833, 0.7984367, 1, 0, 0, 1, 1,
0.5595849, -0.5682644, 3.770505, 1, 0, 0, 1, 1,
0.561205, -1.502429, 2.995854, 0, 0, 0, 1, 1,
0.5612581, -0.06186906, 1.316356, 0, 0, 0, 1, 1,
0.5638119, 0.6705584, -0.6231961, 0, 0, 0, 1, 1,
0.564778, 0.3342905, 0.0411449, 0, 0, 0, 1, 1,
0.5647944, 2.655486, 0.3568192, 0, 0, 0, 1, 1,
0.5698867, -0.3460031, 0.3970741, 0, 0, 0, 1, 1,
0.5699556, 0.2353001, 1.343431, 0, 0, 0, 1, 1,
0.5713656, -1.105996, 3.487175, 1, 1, 1, 1, 1,
0.5719784, 0.1172177, 2.019865, 1, 1, 1, 1, 1,
0.5759599, -0.8323606, 0.9352226, 1, 1, 1, 1, 1,
0.5761147, 1.527791, 1.541894, 1, 1, 1, 1, 1,
0.5763925, 0.1487033, 2.836703, 1, 1, 1, 1, 1,
0.5766652, -0.5318542, 2.569503, 1, 1, 1, 1, 1,
0.5803258, -0.4223502, 0.1474029, 1, 1, 1, 1, 1,
0.5808284, -0.5672607, 2.398093, 1, 1, 1, 1, 1,
0.5809054, 0.8081551, 0.4077438, 1, 1, 1, 1, 1,
0.5820511, -0.08801948, 1.268209, 1, 1, 1, 1, 1,
0.5894016, -1.195788, 3.332794, 1, 1, 1, 1, 1,
0.5912591, -1.060484, 1.856121, 1, 1, 1, 1, 1,
0.6026286, 0.2638483, 1.11702, 1, 1, 1, 1, 1,
0.6043176, -0.4208277, 3.345268, 1, 1, 1, 1, 1,
0.6093141, -0.7663378, 2.470937, 1, 1, 1, 1, 1,
0.6112288, -0.02114471, 1.661886, 0, 0, 1, 1, 1,
0.6159177, 0.592802, 1.353956, 1, 0, 0, 1, 1,
0.61594, -0.5889197, 1.743944, 1, 0, 0, 1, 1,
0.6210132, 1.607853, -0.4091529, 1, 0, 0, 1, 1,
0.6222128, -0.5944889, -0.1663539, 1, 0, 0, 1, 1,
0.623393, 1.080731, 2.032557, 1, 0, 0, 1, 1,
0.630515, 1.469519, 0.2846334, 0, 0, 0, 1, 1,
0.6353288, 0.2151533, -0.2678508, 0, 0, 0, 1, 1,
0.6370336, 0.6840645, 0.6688772, 0, 0, 0, 1, 1,
0.6398663, -1.481331, 2.067301, 0, 0, 0, 1, 1,
0.6429157, 1.002639, -0.517516, 0, 0, 0, 1, 1,
0.6438815, 0.7910012, -2.067396, 0, 0, 0, 1, 1,
0.6446732, -1.021268, 3.819492, 0, 0, 0, 1, 1,
0.6510857, -0.8242579, 3.431582, 1, 1, 1, 1, 1,
0.6595747, -0.2416369, 3.415032, 1, 1, 1, 1, 1,
0.6605237, 0.9297776, -0.07172054, 1, 1, 1, 1, 1,
0.6684555, -1.017267, 3.684778, 1, 1, 1, 1, 1,
0.67342, -0.2023492, 3.320296, 1, 1, 1, 1, 1,
0.6738519, -1.338817, 2.294467, 1, 1, 1, 1, 1,
0.6820687, 1.664458, -1.598658, 1, 1, 1, 1, 1,
0.6822857, -0.8369646, 2.195425, 1, 1, 1, 1, 1,
0.6837692, 0.7738363, 0.1147869, 1, 1, 1, 1, 1,
0.6852012, -0.7208368, 2.052814, 1, 1, 1, 1, 1,
0.6882617, -1.040049, 4.118462, 1, 1, 1, 1, 1,
0.6899429, 2.065133, 1.23407, 1, 1, 1, 1, 1,
0.6908284, 0.3269762, 0.05571429, 1, 1, 1, 1, 1,
0.694838, -0.04917695, 1.067638, 1, 1, 1, 1, 1,
0.6949927, 0.4338397, 2.564689, 1, 1, 1, 1, 1,
0.6979921, 0.3535763, 1.011592, 0, 0, 1, 1, 1,
0.6988068, -0.07383821, 2.926161, 1, 0, 0, 1, 1,
0.6989751, 2.098718, -0.1303649, 1, 0, 0, 1, 1,
0.7042876, 1.868175, 0.1870528, 1, 0, 0, 1, 1,
0.7058895, 1.435591, 0.1053743, 1, 0, 0, 1, 1,
0.7109641, -0.07184014, 1.807, 1, 0, 0, 1, 1,
0.7110825, -2.174016, 1.520848, 0, 0, 0, 1, 1,
0.715592, -0.9844937, 2.34498, 0, 0, 0, 1, 1,
0.7208831, -0.3402259, 2.52172, 0, 0, 0, 1, 1,
0.7318254, 1.234062, 1.455306, 0, 0, 0, 1, 1,
0.7340864, 1.900206, -0.2439986, 0, 0, 0, 1, 1,
0.7357391, -0.2259019, -0.2706559, 0, 0, 0, 1, 1,
0.7387296, -1.065043, 2.601895, 0, 0, 0, 1, 1,
0.7411159, 1.018272, 0.2698102, 1, 1, 1, 1, 1,
0.7480067, 1.677397, 0.7274913, 1, 1, 1, 1, 1,
0.750187, -0.9623388, 1.597413, 1, 1, 1, 1, 1,
0.7524216, 1.064655, 1.287413, 1, 1, 1, 1, 1,
0.7545866, 0.2603367, 1.497203, 1, 1, 1, 1, 1,
0.7685105, -1.175314, 3.682402, 1, 1, 1, 1, 1,
0.772845, -1.303969, 2.051403, 1, 1, 1, 1, 1,
0.7810804, -1.364964, 2.97814, 1, 1, 1, 1, 1,
0.7880105, 0.1970344, 2.284603, 1, 1, 1, 1, 1,
0.7891719, 0.7528989, 0.8899747, 1, 1, 1, 1, 1,
0.794309, -0.6688201, 2.189841, 1, 1, 1, 1, 1,
0.7973846, -0.09440405, 3.337623, 1, 1, 1, 1, 1,
0.7977885, 0.8013602, 0.6486723, 1, 1, 1, 1, 1,
0.7998756, -0.4285342, 2.970923, 1, 1, 1, 1, 1,
0.802756, 0.3386461, 0.8338285, 1, 1, 1, 1, 1,
0.8033777, -1.702485, 3.152475, 0, 0, 1, 1, 1,
0.8079955, -1.255994, 2.843879, 1, 0, 0, 1, 1,
0.8100158, -0.3823042, 3.124153, 1, 0, 0, 1, 1,
0.8142802, 0.1006413, 3.030244, 1, 0, 0, 1, 1,
0.8155391, -0.0585725, 3.183165, 1, 0, 0, 1, 1,
0.8196475, 1.378367, -1.166774, 1, 0, 0, 1, 1,
0.8207535, -0.6035544, 1.19732, 0, 0, 0, 1, 1,
0.8224806, 0.1609699, 1.511974, 0, 0, 0, 1, 1,
0.8279752, -0.5299041, 1.236417, 0, 0, 0, 1, 1,
0.8302824, 0.08043025, -0.006385829, 0, 0, 0, 1, 1,
0.8377826, -1.441573, 2.150893, 0, 0, 0, 1, 1,
0.8464766, -2.310611, 3.134547, 0, 0, 0, 1, 1,
0.8482086, -0.09850144, 1.344349, 0, 0, 0, 1, 1,
0.8482093, -0.6622514, 1.613995, 1, 1, 1, 1, 1,
0.8522649, 2.424989, -1.241228, 1, 1, 1, 1, 1,
0.8532258, -0.2559357, 2.746617, 1, 1, 1, 1, 1,
0.8602704, 0.1254312, 1.968885, 1, 1, 1, 1, 1,
0.8680904, 0.2565676, 1.684433, 1, 1, 1, 1, 1,
0.8841069, -1.472625, 4.56689, 1, 1, 1, 1, 1,
0.8860513, -0.9299849, 4.252686, 1, 1, 1, 1, 1,
0.8883665, -1.184674, 3.649049, 1, 1, 1, 1, 1,
0.9033809, -0.2827656, 2.043243, 1, 1, 1, 1, 1,
0.906179, -0.8241848, 2.980122, 1, 1, 1, 1, 1,
0.9133949, -0.4947368, 0.6084083, 1, 1, 1, 1, 1,
0.9140825, 1.78122, 0.7471731, 1, 1, 1, 1, 1,
0.9147457, -0.1437623, 2.040878, 1, 1, 1, 1, 1,
0.9186999, 0.02554625, 2.266481, 1, 1, 1, 1, 1,
0.9223146, 0.6065641, 0.5603772, 1, 1, 1, 1, 1,
0.9238622, 0.6905636, 0.598462, 0, 0, 1, 1, 1,
0.926805, -0.5312464, 2.229628, 1, 0, 0, 1, 1,
0.9287046, 0.2530099, -0.3477195, 1, 0, 0, 1, 1,
0.9349295, -0.08306767, 1.608487, 1, 0, 0, 1, 1,
0.935821, -1.306332, 0.8043839, 1, 0, 0, 1, 1,
0.9407842, -0.2868536, 1.763059, 1, 0, 0, 1, 1,
0.9563996, 1.655371, 0.3177848, 0, 0, 0, 1, 1,
0.9594399, 0.2298861, 1.297675, 0, 0, 0, 1, 1,
0.967106, 1.037379, 1.477227, 0, 0, 0, 1, 1,
0.9681498, 0.4298091, 0.9098054, 0, 0, 0, 1, 1,
0.9687778, -0.253902, 2.716797, 0, 0, 0, 1, 1,
0.970471, 0.1577329, 0.617089, 0, 0, 0, 1, 1,
0.9807314, -0.4784071, 2.639448, 0, 0, 0, 1, 1,
0.9832844, 1.163818, 1.409389, 1, 1, 1, 1, 1,
0.9839819, 1.218476, 0.6245519, 1, 1, 1, 1, 1,
0.9839858, -1.179422, 1.789243, 1, 1, 1, 1, 1,
0.9918339, 0.6815001, -0.3622991, 1, 1, 1, 1, 1,
0.9935936, 0.2721197, 0.5963789, 1, 1, 1, 1, 1,
0.9945017, -0.2166297, 1.124869, 1, 1, 1, 1, 1,
0.995007, -1.150982, 3.655078, 1, 1, 1, 1, 1,
0.9974406, 1.212595, 1.422937, 1, 1, 1, 1, 1,
0.9987581, -0.09534325, 2.840863, 1, 1, 1, 1, 1,
1.00371, 0.8146322, 0.6493025, 1, 1, 1, 1, 1,
1.004045, -0.2925383, 2.077175, 1, 1, 1, 1, 1,
1.006516, 1.035812, 0.29411, 1, 1, 1, 1, 1,
1.007592, -0.2537315, 3.093141, 1, 1, 1, 1, 1,
1.007686, 0.4663354, 2.412879, 1, 1, 1, 1, 1,
1.010188, -0.2737935, 1.556406, 1, 1, 1, 1, 1,
1.011654, -0.5472031, 3.052379, 0, 0, 1, 1, 1,
1.012392, -0.3439043, 1.960336, 1, 0, 0, 1, 1,
1.016319, 0.6562078, 2.386368, 1, 0, 0, 1, 1,
1.016967, -0.2305163, 2.426126, 1, 0, 0, 1, 1,
1.022034, -1.892575, 2.885479, 1, 0, 0, 1, 1,
1.02263, -0.4167091, 2.255908, 1, 0, 0, 1, 1,
1.022681, 1.616745, -1.297143, 0, 0, 0, 1, 1,
1.033178, -1.260285, 3.289614, 0, 0, 0, 1, 1,
1.034884, -1.988724, 1.769004, 0, 0, 0, 1, 1,
1.041278, -0.9980377, 2.587945, 0, 0, 0, 1, 1,
1.050018, -0.7929292, 3.669338, 0, 0, 0, 1, 1,
1.050073, -0.4590918, 2.18172, 0, 0, 0, 1, 1,
1.05934, 0.4541561, 1.560708, 0, 0, 0, 1, 1,
1.059807, -0.4973147, 3.392778, 1, 1, 1, 1, 1,
1.064376, 1.250191, -0.3634441, 1, 1, 1, 1, 1,
1.069439, -0.9376116, 3.475416, 1, 1, 1, 1, 1,
1.073328, 1.151592, -0.06213076, 1, 1, 1, 1, 1,
1.075163, -1.096344, 2.92314, 1, 1, 1, 1, 1,
1.082, -1.236414, 2.720186, 1, 1, 1, 1, 1,
1.082113, 0.04811798, -0.312084, 1, 1, 1, 1, 1,
1.096953, 0.05443377, -0.1786266, 1, 1, 1, 1, 1,
1.105235, 0.4952281, 1.628371, 1, 1, 1, 1, 1,
1.121244, 1.237413, 2.024201, 1, 1, 1, 1, 1,
1.124358, 0.2867719, 2.498435, 1, 1, 1, 1, 1,
1.128692, 0.2187351, 2.322671, 1, 1, 1, 1, 1,
1.136701, -0.02972295, 2.618069, 1, 1, 1, 1, 1,
1.139412, 0.3902004, 0.1969456, 1, 1, 1, 1, 1,
1.149988, 0.6223577, -0.5468824, 1, 1, 1, 1, 1,
1.153349, 0.7622235, -0.4196351, 0, 0, 1, 1, 1,
1.155342, 1.659352, 0.96947, 1, 0, 0, 1, 1,
1.178305, -0.1918034, 3.101768, 1, 0, 0, 1, 1,
1.178507, -0.4414662, 1.227459, 1, 0, 0, 1, 1,
1.180986, -0.5698377, 1.075318, 1, 0, 0, 1, 1,
1.192179, -0.563826, 2.056671, 1, 0, 0, 1, 1,
1.194871, 0.4258725, 2.857582, 0, 0, 0, 1, 1,
1.196494, 1.338868, 1.623321, 0, 0, 0, 1, 1,
1.198189, 1.131514, 0.6535754, 0, 0, 0, 1, 1,
1.205604, -0.7116315, 2.987215, 0, 0, 0, 1, 1,
1.217452, 0.5854729, 0.8414782, 0, 0, 0, 1, 1,
1.224147, 1.358024, 1.132373, 0, 0, 0, 1, 1,
1.235315, -0.8621255, 1.852289, 0, 0, 0, 1, 1,
1.237317, -0.13923, -0.0971868, 1, 1, 1, 1, 1,
1.238636, -0.744721, 3.459404, 1, 1, 1, 1, 1,
1.243952, -0.8179058, 2.503336, 1, 1, 1, 1, 1,
1.244808, -0.04686486, 1.026815, 1, 1, 1, 1, 1,
1.247573, 0.0587495, 2.172845, 1, 1, 1, 1, 1,
1.248643, -0.4360918, 0.2081771, 1, 1, 1, 1, 1,
1.252077, 0.8098887, 1.419617, 1, 1, 1, 1, 1,
1.252728, 0.8859837, 1.059304, 1, 1, 1, 1, 1,
1.256764, 0.2790823, 0.2873435, 1, 1, 1, 1, 1,
1.261223, 0.01129868, 2.664886, 1, 1, 1, 1, 1,
1.264865, 1.343492, 1.913325, 1, 1, 1, 1, 1,
1.269615, 0.6693053, -0.4881751, 1, 1, 1, 1, 1,
1.281584, -2.456383, 2.404609, 1, 1, 1, 1, 1,
1.282858, 1.856348, 0.5567183, 1, 1, 1, 1, 1,
1.29394, 1.090545, 1.094388, 1, 1, 1, 1, 1,
1.295461, 0.2913748, 0.6933799, 0, 0, 1, 1, 1,
1.297355, -0.4391228, 1.879008, 1, 0, 0, 1, 1,
1.301498, 0.6724944, 0.7672738, 1, 0, 0, 1, 1,
1.305557, 1.882532, -0.9975367, 1, 0, 0, 1, 1,
1.307408, 0.2208273, 0.1041875, 1, 0, 0, 1, 1,
1.310629, -0.1687956, 1.13423, 1, 0, 0, 1, 1,
1.313908, 0.6387459, 2.562198, 0, 0, 0, 1, 1,
1.313964, -0.1450111, 3.571217, 0, 0, 0, 1, 1,
1.314026, 0.951775, 0.4253691, 0, 0, 0, 1, 1,
1.319211, -1.93316, 1.836804, 0, 0, 0, 1, 1,
1.323599, -1.428479, 1.540273, 0, 0, 0, 1, 1,
1.325739, -0.2786547, 0.06205375, 0, 0, 0, 1, 1,
1.329487, 0.2022313, 2.482145, 0, 0, 0, 1, 1,
1.341142, -0.2207658, 2.062733, 1, 1, 1, 1, 1,
1.344046, 0.0895225, 0.6440096, 1, 1, 1, 1, 1,
1.347935, -2.286798, 2.584849, 1, 1, 1, 1, 1,
1.352751, -1.110548, 1.952269, 1, 1, 1, 1, 1,
1.360189, -0.477701, 1.056707, 1, 1, 1, 1, 1,
1.360837, -0.4479868, 1.128284, 1, 1, 1, 1, 1,
1.372301, -1.822309, 2.683167, 1, 1, 1, 1, 1,
1.376593, 1.816892, 0.07855204, 1, 1, 1, 1, 1,
1.383927, 0.01776513, 1.678555, 1, 1, 1, 1, 1,
1.385635, 0.263233, 1.41223, 1, 1, 1, 1, 1,
1.386537, -0.6439043, 3.141483, 1, 1, 1, 1, 1,
1.387534, 2.037002, -0.06904723, 1, 1, 1, 1, 1,
1.390609, -0.1546292, 1.634267, 1, 1, 1, 1, 1,
1.409974, 1.381647, 0.8715022, 1, 1, 1, 1, 1,
1.458533, 0.7605813, 1.222198, 1, 1, 1, 1, 1,
1.460279, 0.4093065, 1.961214, 0, 0, 1, 1, 1,
1.461501, 0.7004148, 1.529824, 1, 0, 0, 1, 1,
1.471009, 0.4271561, 1.023805, 1, 0, 0, 1, 1,
1.479168, 0.6685016, -0.03834364, 1, 0, 0, 1, 1,
1.48596, -0.362552, 1.267249, 1, 0, 0, 1, 1,
1.494345, 1.427677, -0.3386714, 1, 0, 0, 1, 1,
1.494823, -0.8177404, 0.6711403, 0, 0, 0, 1, 1,
1.501165, 0.9954303, 1.131499, 0, 0, 0, 1, 1,
1.503948, 0.01350844, 0.4934735, 0, 0, 0, 1, 1,
1.529391, 1.022211, -0.0685246, 0, 0, 0, 1, 1,
1.555525, 1.296692, 0.8639604, 0, 0, 0, 1, 1,
1.565467, -0.1540411, 1.831068, 0, 0, 0, 1, 1,
1.569836, 0.751726, 1.423684, 0, 0, 0, 1, 1,
1.579283, -0.02505169, 1.971335, 1, 1, 1, 1, 1,
1.580568, -0.8838804, 1.83457, 1, 1, 1, 1, 1,
1.59929, 0.8612423, -0.3709759, 1, 1, 1, 1, 1,
1.60194, -1.397276, 1.637792, 1, 1, 1, 1, 1,
1.61032, -1.374353, 2.359444, 1, 1, 1, 1, 1,
1.613243, 0.4804029, 1.552797, 1, 1, 1, 1, 1,
1.613546, -0.3417702, 1.939881, 1, 1, 1, 1, 1,
1.62933, -0.4620973, 2.79472, 1, 1, 1, 1, 1,
1.629979, -0.03537338, 0.450872, 1, 1, 1, 1, 1,
1.634481, -1.600035, 0.8882033, 1, 1, 1, 1, 1,
1.638994, -0.1860969, 1.72419, 1, 1, 1, 1, 1,
1.649592, 0.115256, -0.2167878, 1, 1, 1, 1, 1,
1.65341, 1.745478, 0.3823808, 1, 1, 1, 1, 1,
1.666898, 0.7836516, 0.06560417, 1, 1, 1, 1, 1,
1.669458, -0.8873869, 2.022974, 1, 1, 1, 1, 1,
1.67957, 0.3020973, 1.399, 0, 0, 1, 1, 1,
1.6841, -0.2384579, 2.31604, 1, 0, 0, 1, 1,
1.690091, -0.4087787, 1.408413, 1, 0, 0, 1, 1,
1.692361, 0.6041723, 2.584753, 1, 0, 0, 1, 1,
1.700937, -0.4462885, 3.272335, 1, 0, 0, 1, 1,
1.702528, 0.7667749, 0.6448207, 1, 0, 0, 1, 1,
1.716874, 0.2320756, 1.807174, 0, 0, 0, 1, 1,
1.727466, 2.679417, 2.092754, 0, 0, 0, 1, 1,
1.732244, -0.2357326, 1.847755, 0, 0, 0, 1, 1,
1.736073, -0.8291969, 2.020396, 0, 0, 0, 1, 1,
1.739507, -1.097789, 3.625319, 0, 0, 0, 1, 1,
1.760543, -0.7994941, 3.044473, 0, 0, 0, 1, 1,
1.770463, -0.01306285, 2.261514, 0, 0, 0, 1, 1,
1.777332, -0.2509556, 1.574348, 1, 1, 1, 1, 1,
1.78091, 1.754008, 0.762718, 1, 1, 1, 1, 1,
1.800589, -0.1129903, 2.781167, 1, 1, 1, 1, 1,
1.815261, 0.0577007, 1.067048, 1, 1, 1, 1, 1,
1.826066, 1.041592, 1.478178, 1, 1, 1, 1, 1,
1.862674, 0.7596025, 0.9791722, 1, 1, 1, 1, 1,
1.877802, -0.9860113, 1.091152, 1, 1, 1, 1, 1,
1.87833, 0.2952069, 1.893268, 1, 1, 1, 1, 1,
1.900993, -0.09251174, 1.019002, 1, 1, 1, 1, 1,
1.91743, -0.1823854, 1.910675, 1, 1, 1, 1, 1,
1.921435, -1.119239, 1.34654, 1, 1, 1, 1, 1,
1.937454, -0.9441912, 1.330214, 1, 1, 1, 1, 1,
1.939297, 0.3717546, 1.103955, 1, 1, 1, 1, 1,
1.943151, 0.3268173, 1.896017, 1, 1, 1, 1, 1,
1.94594, 0.6747313, -0.5861405, 1, 1, 1, 1, 1,
1.958024, -0.6301647, 3.29403, 0, 0, 1, 1, 1,
1.976271, -0.1352665, 1.05759, 1, 0, 0, 1, 1,
2.017567, 1.08699, 1.428663, 1, 0, 0, 1, 1,
2.040192, -1.35578, 2.841047, 1, 0, 0, 1, 1,
2.054356, -0.9730898, 1.066607, 1, 0, 0, 1, 1,
2.061802, 0.507883, 1.038504, 1, 0, 0, 1, 1,
2.07129, -2.021603, 2.887404, 0, 0, 0, 1, 1,
2.136641, -0.5792357, 0.9265607, 0, 0, 0, 1, 1,
2.16248, 2.978472, -0.03123605, 0, 0, 0, 1, 1,
2.167972, 1.233491, 1.050154, 0, 0, 0, 1, 1,
2.17722, -1.051751, 1.117491, 0, 0, 0, 1, 1,
2.344736, 0.5689188, 1.522845, 0, 0, 0, 1, 1,
2.349662, 0.4578896, 0.6995379, 0, 0, 0, 1, 1,
2.372978, 0.3138419, 2.508334, 1, 1, 1, 1, 1,
2.423692, -0.9612539, 1.895492, 1, 1, 1, 1, 1,
2.5576, 0.04908627, 4.134172, 1, 1, 1, 1, 1,
2.747862, 0.2790599, 2.028117, 1, 1, 1, 1, 1,
2.848781, 1.66092, 1.146124, 1, 1, 1, 1, 1,
2.913055, 0.8015532, 0.0004002102, 1, 1, 1, 1, 1,
3.626029, -1.831585, 3.092891, 1, 1, 1, 1, 1
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
var radius = 9.416992;
var distance = 33.07679;
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
mvMatrix.translate( -0.2533333, 0.1659341, 0.3964245 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.07679);
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