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
-3.454696, 1.113697, -0.5583053, 1, 0, 0, 1,
-3.246032, -0.6598253, -0.1468249, 1, 0.007843138, 0, 1,
-3.197082, 1.515689, 0.2724244, 1, 0.01176471, 0, 1,
-3.062762, 0.2446973, -0.7708849, 1, 0.01960784, 0, 1,
-2.702724, -0.07883491, -1.051725, 1, 0.02352941, 0, 1,
-2.651259, -0.5893698, -1.316632, 1, 0.03137255, 0, 1,
-2.578141, 2.853476, 0.264236, 1, 0.03529412, 0, 1,
-2.524047, 0.4887182, -2.260367, 1, 0.04313726, 0, 1,
-2.400307, 0.267112, -1.127174, 1, 0.04705882, 0, 1,
-2.397678, -0.5842326, -0.8988174, 1, 0.05490196, 0, 1,
-2.351525, 0.817433, -0.5255367, 1, 0.05882353, 0, 1,
-2.327733, 0.1416032, 1.188736, 1, 0.06666667, 0, 1,
-2.326922, -0.5333218, -1.891338, 1, 0.07058824, 0, 1,
-2.316285, 0.9088262, -1.553687, 1, 0.07843138, 0, 1,
-2.313824, 0.7864033, -1.15777, 1, 0.08235294, 0, 1,
-2.27482, 0.1000832, -1.579825, 1, 0.09019608, 0, 1,
-2.266808, 1.264364, -0.458728, 1, 0.09411765, 0, 1,
-2.221549, 0.277051, -0.7124478, 1, 0.1019608, 0, 1,
-2.187906, 1.147893, -1.298777, 1, 0.1098039, 0, 1,
-2.153263, -0.8754341, -5.009527, 1, 0.1137255, 0, 1,
-2.15011, 0.8613098, -0.3117905, 1, 0.1215686, 0, 1,
-2.135964, 0.07236002, -1.546526, 1, 0.1254902, 0, 1,
-2.125282, 0.9776919, -1.397467, 1, 0.1333333, 0, 1,
-2.037198, -1.250443, -1.264881, 1, 0.1372549, 0, 1,
-2.005974, -0.2407847, -1.458437, 1, 0.145098, 0, 1,
-2.004893, 0.03835957, -2.083895, 1, 0.1490196, 0, 1,
-1.986298, 0.4246103, -3.988039, 1, 0.1568628, 0, 1,
-1.984928, -0.1869874, -1.482893, 1, 0.1607843, 0, 1,
-1.976924, 0.5536009, -0.929571, 1, 0.1686275, 0, 1,
-1.924519, -0.330825, -1.502138, 1, 0.172549, 0, 1,
-1.920928, -1.016096, -0.198073, 1, 0.1803922, 0, 1,
-1.899474, 0.3433298, -1.842875, 1, 0.1843137, 0, 1,
-1.888695, -0.4373017, -2.295879, 1, 0.1921569, 0, 1,
-1.887263, 0.6914279, -0.5681814, 1, 0.1960784, 0, 1,
-1.886726, -1.023741, -2.005156, 1, 0.2039216, 0, 1,
-1.859254, 0.5586125, -1.475799, 1, 0.2117647, 0, 1,
-1.841642, 0.3340266, -0.8692079, 1, 0.2156863, 0, 1,
-1.811076, 0.7984618, 0.9495068, 1, 0.2235294, 0, 1,
-1.80432, -0.261952, -1.711594, 1, 0.227451, 0, 1,
-1.804044, 0.8159369, -0.3796919, 1, 0.2352941, 0, 1,
-1.7881, -1.017414, -1.455909, 1, 0.2392157, 0, 1,
-1.780477, -0.7769848, -0.2272172, 1, 0.2470588, 0, 1,
-1.777281, 1.871198, 0.04489712, 1, 0.2509804, 0, 1,
-1.765234, 0.1274631, -0.5632062, 1, 0.2588235, 0, 1,
-1.763517, -1.219429, -2.378089, 1, 0.2627451, 0, 1,
-1.759123, -0.07411126, -1.347058, 1, 0.2705882, 0, 1,
-1.75846, 0.3082243, -0.6442842, 1, 0.2745098, 0, 1,
-1.75654, -0.04289337, -1.982316, 1, 0.282353, 0, 1,
-1.731493, -1.952061, -3.292429, 1, 0.2862745, 0, 1,
-1.722259, -0.3503613, -3.898573, 1, 0.2941177, 0, 1,
-1.708033, 0.4869637, -2.26693, 1, 0.3019608, 0, 1,
-1.704934, 0.1761253, -1.076086, 1, 0.3058824, 0, 1,
-1.682798, 0.8859884, -0.3574325, 1, 0.3137255, 0, 1,
-1.67048, 4.190245, 0.7182674, 1, 0.3176471, 0, 1,
-1.665834, 0.3533012, -1.383986, 1, 0.3254902, 0, 1,
-1.663149, -1.001162, -2.676691, 1, 0.3294118, 0, 1,
-1.652123, 1.387872, -1.265436, 1, 0.3372549, 0, 1,
-1.652108, 0.08655686, -0.7176927, 1, 0.3411765, 0, 1,
-1.63405, 0.989237, -1.493398, 1, 0.3490196, 0, 1,
-1.632165, -2.212363, -2.706943, 1, 0.3529412, 0, 1,
-1.630725, -1.614582, -1.534079, 1, 0.3607843, 0, 1,
-1.610978, 0.3719471, -0.9788542, 1, 0.3647059, 0, 1,
-1.603102, -1.892388, -3.303987, 1, 0.372549, 0, 1,
-1.591383, 0.7142813, -0.3962798, 1, 0.3764706, 0, 1,
-1.586798, -0.4989825, -1.629295, 1, 0.3843137, 0, 1,
-1.570181, 0.6813907, 0.3257816, 1, 0.3882353, 0, 1,
-1.549631, -1.422432, -1.604094, 1, 0.3960784, 0, 1,
-1.54328, 0.2156514, -2.228985, 1, 0.4039216, 0, 1,
-1.540383, 0.4429976, -1.304802, 1, 0.4078431, 0, 1,
-1.535635, -1.646638, -1.035964, 1, 0.4156863, 0, 1,
-1.524643, 0.9167687, -0.6079218, 1, 0.4196078, 0, 1,
-1.513842, -1.963926, -3.909158, 1, 0.427451, 0, 1,
-1.465422, -1.508276, -3.611589, 1, 0.4313726, 0, 1,
-1.463839, 0.9378073, -3.230611, 1, 0.4392157, 0, 1,
-1.44488, -2.270305, -1.430265, 1, 0.4431373, 0, 1,
-1.443834, -0.6479082, -1.642106, 1, 0.4509804, 0, 1,
-1.441094, 1.161326, -2.246629, 1, 0.454902, 0, 1,
-1.441041, -0.8226292, -1.904196, 1, 0.4627451, 0, 1,
-1.411994, -0.6816126, -3.776778, 1, 0.4666667, 0, 1,
-1.407241, -0.6423582, -2.020817, 1, 0.4745098, 0, 1,
-1.407041, -0.3335847, -1.235358, 1, 0.4784314, 0, 1,
-1.398843, 0.2254397, -2.057756, 1, 0.4862745, 0, 1,
-1.391101, -0.5665802, -2.521023, 1, 0.4901961, 0, 1,
-1.389457, -0.631581, -1.785349, 1, 0.4980392, 0, 1,
-1.387812, 0.9540409, -1.643979, 1, 0.5058824, 0, 1,
-1.383565, -1.646964, -2.295312, 1, 0.509804, 0, 1,
-1.379032, -0.1619674, -1.971225, 1, 0.5176471, 0, 1,
-1.37901, 0.6840809, -0.07105214, 1, 0.5215687, 0, 1,
-1.374967, -2.037045, -1.659517, 1, 0.5294118, 0, 1,
-1.368616, 0.696818, -1.046656, 1, 0.5333334, 0, 1,
-1.350758, -0.4778083, -1.475145, 1, 0.5411765, 0, 1,
-1.337488, 0.2527202, -1.879761, 1, 0.5450981, 0, 1,
-1.333179, -0.4476252, -3.466199, 1, 0.5529412, 0, 1,
-1.330428, -1.390091, -2.071728, 1, 0.5568628, 0, 1,
-1.325981, -1.616843, -1.003272, 1, 0.5647059, 0, 1,
-1.308125, -0.4940461, -4.274325, 1, 0.5686275, 0, 1,
-1.300413, -0.501298, -3.074107, 1, 0.5764706, 0, 1,
-1.285698, 0.03224551, -3.500395, 1, 0.5803922, 0, 1,
-1.28445, -0.3719617, -3.772309, 1, 0.5882353, 0, 1,
-1.27038, 0.4855382, -1.675506, 1, 0.5921569, 0, 1,
-1.246304, -1.042277, -2.786259, 1, 0.6, 0, 1,
-1.244186, -0.2926065, -1.545122, 1, 0.6078432, 0, 1,
-1.243705, -0.4023137, -2.937269, 1, 0.6117647, 0, 1,
-1.226066, 0.1090107, -0.806985, 1, 0.6196079, 0, 1,
-1.222589, 0.6805689, -2.227616, 1, 0.6235294, 0, 1,
-1.201841, -0.2430496, 0.2463327, 1, 0.6313726, 0, 1,
-1.199153, -0.09175403, -1.494557, 1, 0.6352941, 0, 1,
-1.199136, -0.3159829, -1.386278, 1, 0.6431373, 0, 1,
-1.198501, -1.13562, -1.218246, 1, 0.6470588, 0, 1,
-1.196022, 0.3365405, -1.100191, 1, 0.654902, 0, 1,
-1.193538, -0.3886107, -1.703334, 1, 0.6588235, 0, 1,
-1.184302, -0.09895685, -1.409223, 1, 0.6666667, 0, 1,
-1.178239, 1.010169, -0.9465119, 1, 0.6705883, 0, 1,
-1.169575, -0.3830573, -3.546403, 1, 0.6784314, 0, 1,
-1.168162, 0.05816084, -0.4061373, 1, 0.682353, 0, 1,
-1.164306, 0.1112445, 0.1635939, 1, 0.6901961, 0, 1,
-1.163808, 0.499743, -0.352604, 1, 0.6941177, 0, 1,
-1.159776, -0.4744823, 0.5095995, 1, 0.7019608, 0, 1,
-1.157397, -0.5556792, -2.96181, 1, 0.7098039, 0, 1,
-1.148671, -1.514468, -3.308854, 1, 0.7137255, 0, 1,
-1.146548, 0.06625877, -2.703809, 1, 0.7215686, 0, 1,
-1.141771, 1.856922, -1.412325, 1, 0.7254902, 0, 1,
-1.135562, -0.9451663, -2.366336, 1, 0.7333333, 0, 1,
-1.130333, -0.1348403, 0.590262, 1, 0.7372549, 0, 1,
-1.116933, -0.6546319, -1.694491, 1, 0.7450981, 0, 1,
-1.116118, 2.009851, -0.726121, 1, 0.7490196, 0, 1,
-1.096697, -0.04447888, -1.526751, 1, 0.7568628, 0, 1,
-1.096069, -0.3817902, -0.04717882, 1, 0.7607843, 0, 1,
-1.093844, 0.2336437, -0.3818005, 1, 0.7686275, 0, 1,
-1.09365, 0.2513989, -0.7304811, 1, 0.772549, 0, 1,
-1.091571, -0.893607, 0.2245971, 1, 0.7803922, 0, 1,
-1.086652, -0.411893, -3.198475, 1, 0.7843137, 0, 1,
-1.067485, -1.269286, -1.807161, 1, 0.7921569, 0, 1,
-1.061114, -0.6477848, -0.8167962, 1, 0.7960784, 0, 1,
-1.056406, 1.475043, 0.041371, 1, 0.8039216, 0, 1,
-1.048751, 0.283445, -0.2508796, 1, 0.8117647, 0, 1,
-1.042562, -0.4913167, -1.342663, 1, 0.8156863, 0, 1,
-1.029715, 0.4789633, -1.545874, 1, 0.8235294, 0, 1,
-1.024899, -0.09996049, -2.307887, 1, 0.827451, 0, 1,
-1.021734, 0.1560873, -1.707851, 1, 0.8352941, 0, 1,
-1.015221, -0.3129691, -0.2270355, 1, 0.8392157, 0, 1,
-1.013513, -1.266098, -1.287304, 1, 0.8470588, 0, 1,
-1.003312, -1.333052, -1.557237, 1, 0.8509804, 0, 1,
-1.001622, -0.4831199, -1.318138, 1, 0.8588235, 0, 1,
-0.9987704, -0.3351193, -1.810283, 1, 0.8627451, 0, 1,
-0.9939459, 0.3762755, -3.486892, 1, 0.8705882, 0, 1,
-0.9908695, -1.305335, -2.17336, 1, 0.8745098, 0, 1,
-0.9869176, 1.196552, 0.6528993, 1, 0.8823529, 0, 1,
-0.9816372, -0.5941449, -2.52773, 1, 0.8862745, 0, 1,
-0.9815887, -0.9959381, -2.877012, 1, 0.8941177, 0, 1,
-0.9780306, -0.4878969, -4.168682, 1, 0.8980392, 0, 1,
-0.9696949, -0.155757, -1.826776, 1, 0.9058824, 0, 1,
-0.9672685, -0.008876846, 0.1221385, 1, 0.9137255, 0, 1,
-0.9613244, -1.652399, -3.547562, 1, 0.9176471, 0, 1,
-0.9578354, -1.022381, -2.158672, 1, 0.9254902, 0, 1,
-0.954092, 0.08028294, -0.6218361, 1, 0.9294118, 0, 1,
-0.9540053, -0.1338322, -1.713353, 1, 0.9372549, 0, 1,
-0.9504584, -1.153531, -4.101161, 1, 0.9411765, 0, 1,
-0.9500892, -0.9492246, -0.6647564, 1, 0.9490196, 0, 1,
-0.9361625, 0.1076386, -0.7871556, 1, 0.9529412, 0, 1,
-0.9349653, 0.9774231, 0.2171042, 1, 0.9607843, 0, 1,
-0.9311131, -0.834629, -2.906158, 1, 0.9647059, 0, 1,
-0.9299636, -0.1821914, -1.89792, 1, 0.972549, 0, 1,
-0.915833, -0.05858273, -0.6331853, 1, 0.9764706, 0, 1,
-0.9143696, -0.728157, -3.299749, 1, 0.9843137, 0, 1,
-0.9090151, -0.6230707, -1.032181, 1, 0.9882353, 0, 1,
-0.9089817, 1.065243, -2.011572, 1, 0.9960784, 0, 1,
-0.9089648, 1.681164, -0.8137165, 0.9960784, 1, 0, 1,
-0.9070381, 0.06908392, -1.997671, 0.9921569, 1, 0, 1,
-0.9066954, 1.164826, 1.04591, 0.9843137, 1, 0, 1,
-0.9040193, 0.116424, -1.81836, 0.9803922, 1, 0, 1,
-0.9031711, -0.2737236, -1.553775, 0.972549, 1, 0, 1,
-0.897561, 1.136257, -0.8132581, 0.9686275, 1, 0, 1,
-0.8807232, 2.71272, 0.2457877, 0.9607843, 1, 0, 1,
-0.8784043, 0.3683138, -1.152858, 0.9568627, 1, 0, 1,
-0.875407, -1.265339, -1.763909, 0.9490196, 1, 0, 1,
-0.8746133, -1.303325, -2.402117, 0.945098, 1, 0, 1,
-0.8745202, -0.5516047, -1.140635, 0.9372549, 1, 0, 1,
-0.8730099, 0.101552, -2.612405, 0.9333333, 1, 0, 1,
-0.8714564, -0.08112665, -2.313851, 0.9254902, 1, 0, 1,
-0.8698455, 0.325271, -1.728886, 0.9215686, 1, 0, 1,
-0.8693931, -0.3619849, -1.858553, 0.9137255, 1, 0, 1,
-0.8690145, -0.0852862, -0.3444649, 0.9098039, 1, 0, 1,
-0.8666354, 0.02437142, -0.2002311, 0.9019608, 1, 0, 1,
-0.8633218, 0.3150198, -2.697756, 0.8941177, 1, 0, 1,
-0.8633178, -0.5335665, -1.1564, 0.8901961, 1, 0, 1,
-0.8569343, -0.2560258, -2.944809, 0.8823529, 1, 0, 1,
-0.8523973, 1.785564, 0.07795973, 0.8784314, 1, 0, 1,
-0.8449425, 1.442746, -0.6547084, 0.8705882, 1, 0, 1,
-0.8414469, 0.2567572, -2.03068, 0.8666667, 1, 0, 1,
-0.8398387, 0.3062245, -1.266569, 0.8588235, 1, 0, 1,
-0.8385583, 0.1953296, -0.4265187, 0.854902, 1, 0, 1,
-0.837308, -0.2096611, -1.427288, 0.8470588, 1, 0, 1,
-0.8294445, 0.5513681, -1.110389, 0.8431373, 1, 0, 1,
-0.8223389, 0.482383, -0.6910466, 0.8352941, 1, 0, 1,
-0.8221231, 1.26692, -0.09301968, 0.8313726, 1, 0, 1,
-0.816321, 1.116452, -2.019793, 0.8235294, 1, 0, 1,
-0.8109635, -0.48415, -0.6484846, 0.8196079, 1, 0, 1,
-0.8103065, -0.5554333, -2.57494, 0.8117647, 1, 0, 1,
-0.8088834, 0.8852462, -0.7906842, 0.8078431, 1, 0, 1,
-0.8085995, 0.6928051, -0.6933877, 0.8, 1, 0, 1,
-0.8080838, -0.6239796, -1.789613, 0.7921569, 1, 0, 1,
-0.8075932, -1.893457, -1.477553, 0.7882353, 1, 0, 1,
-0.8059508, -0.8305618, -1.855963, 0.7803922, 1, 0, 1,
-0.8011026, -0.5260143, -1.710472, 0.7764706, 1, 0, 1,
-0.7999423, 1.787421, -1.262792, 0.7686275, 1, 0, 1,
-0.7975654, 1.839401, 0.866398, 0.7647059, 1, 0, 1,
-0.7912328, 0.9044712, -1.716926, 0.7568628, 1, 0, 1,
-0.7898545, 1.070278, -0.3651529, 0.7529412, 1, 0, 1,
-0.7858129, 1.753273, -1.348738, 0.7450981, 1, 0, 1,
-0.7851123, -1.504842, -2.872129, 0.7411765, 1, 0, 1,
-0.7834859, -0.9737071, -3.787204, 0.7333333, 1, 0, 1,
-0.78312, 1.771624, -0.2386458, 0.7294118, 1, 0, 1,
-0.7808481, -1.325224, -1.966105, 0.7215686, 1, 0, 1,
-0.7792394, 1.026648, -1.176399, 0.7176471, 1, 0, 1,
-0.7768474, 0.8016862, -0.3694476, 0.7098039, 1, 0, 1,
-0.7658812, -0.8305923, -2.244059, 0.7058824, 1, 0, 1,
-0.765734, -1.052503, -1.475019, 0.6980392, 1, 0, 1,
-0.7640467, 0.06589906, -2.727746, 0.6901961, 1, 0, 1,
-0.7635754, 0.9583784, -0.7440432, 0.6862745, 1, 0, 1,
-0.7542093, -0.5321352, -0.03656843, 0.6784314, 1, 0, 1,
-0.7457047, 0.3688871, -1.233628, 0.6745098, 1, 0, 1,
-0.7394816, -0.5125402, -2.588729, 0.6666667, 1, 0, 1,
-0.7393873, 0.3519428, -0.4692261, 0.6627451, 1, 0, 1,
-0.7391305, 0.2119661, -1.829045, 0.654902, 1, 0, 1,
-0.7354861, 1.486908, -1.38444, 0.6509804, 1, 0, 1,
-0.7297921, 0.4205586, -1.801844, 0.6431373, 1, 0, 1,
-0.729259, -1.801052, -3.797049, 0.6392157, 1, 0, 1,
-0.7287608, 2.073122, -0.08504185, 0.6313726, 1, 0, 1,
-0.7283671, 0.236475, -1.144568, 0.627451, 1, 0, 1,
-0.7246989, -1.546339, -3.532343, 0.6196079, 1, 0, 1,
-0.72448, 3.357799, 0.3723678, 0.6156863, 1, 0, 1,
-0.72158, 1.404644, -0.1128011, 0.6078432, 1, 0, 1,
-0.7178624, -1.888201, -3.288113, 0.6039216, 1, 0, 1,
-0.7162979, 1.454627, 0.352063, 0.5960785, 1, 0, 1,
-0.7160325, 0.6923259, -0.528987, 0.5882353, 1, 0, 1,
-0.7156943, 0.160422, -2.518364, 0.5843138, 1, 0, 1,
-0.7064839, -0.7608212, -0.9232526, 0.5764706, 1, 0, 1,
-0.6959921, 0.02748638, -0.8470455, 0.572549, 1, 0, 1,
-0.693856, -0.2262181, -1.523639, 0.5647059, 1, 0, 1,
-0.690521, 0.1639956, -0.8887596, 0.5607843, 1, 0, 1,
-0.6871744, 0.1220317, -1.319723, 0.5529412, 1, 0, 1,
-0.6851238, 0.04393553, -2.342945, 0.5490196, 1, 0, 1,
-0.6824355, 0.4676626, -2.990146, 0.5411765, 1, 0, 1,
-0.6785534, -0.832532, -3.872228, 0.5372549, 1, 0, 1,
-0.6767214, 1.014774, -1.777121, 0.5294118, 1, 0, 1,
-0.6701267, 1.36453, -0.790427, 0.5254902, 1, 0, 1,
-0.6668338, 1.11896, -0.2719891, 0.5176471, 1, 0, 1,
-0.6645448, 0.5099384, 0.8030496, 0.5137255, 1, 0, 1,
-0.6600043, -0.3394088, -2.865581, 0.5058824, 1, 0, 1,
-0.658517, -0.5357333, -2.682631, 0.5019608, 1, 0, 1,
-0.6514962, 0.5917937, -2.111367, 0.4941176, 1, 0, 1,
-0.63938, -0.9875956, -3.035399, 0.4862745, 1, 0, 1,
-0.6380487, 0.6072434, -1.631776, 0.4823529, 1, 0, 1,
-0.6377838, 0.7482862, -1.149228, 0.4745098, 1, 0, 1,
-0.6344975, -0.1567527, -1.867187, 0.4705882, 1, 0, 1,
-0.625993, -0.3576034, -2.237438, 0.4627451, 1, 0, 1,
-0.623115, -0.313472, -2.610647, 0.4588235, 1, 0, 1,
-0.6205328, -2.647147, -2.963852, 0.4509804, 1, 0, 1,
-0.6192864, -0.5104013, -2.203083, 0.4470588, 1, 0, 1,
-0.6179631, -0.2090439, -1.416621, 0.4392157, 1, 0, 1,
-0.6156044, -0.3132198, -2.071912, 0.4352941, 1, 0, 1,
-0.6138529, 0.8053492, -3.032553, 0.427451, 1, 0, 1,
-0.6132573, 1.294082, -1.501982, 0.4235294, 1, 0, 1,
-0.610099, 0.4846255, -1.796539, 0.4156863, 1, 0, 1,
-0.6029544, -0.8240072, -4.027339, 0.4117647, 1, 0, 1,
-0.6022654, -0.8367726, -1.460808, 0.4039216, 1, 0, 1,
-0.6013602, -0.4583799, -0.4328591, 0.3960784, 1, 0, 1,
-0.5985613, 0.1676539, -1.040129, 0.3921569, 1, 0, 1,
-0.5955185, 0.2301334, -1.263059, 0.3843137, 1, 0, 1,
-0.5940535, -0.2056014, -0.06795407, 0.3803922, 1, 0, 1,
-0.5871447, 0.7883769, -3.101334, 0.372549, 1, 0, 1,
-0.5866338, -0.1441927, -1.448521, 0.3686275, 1, 0, 1,
-0.5860689, -0.4203932, -3.59406, 0.3607843, 1, 0, 1,
-0.5836648, -1.30738, -3.206676, 0.3568628, 1, 0, 1,
-0.5773406, 0.001602161, -2.536188, 0.3490196, 1, 0, 1,
-0.5742449, -0.2331035, -1.107767, 0.345098, 1, 0, 1,
-0.5722042, 1.148381, -2.247515, 0.3372549, 1, 0, 1,
-0.564968, 0.03948915, -3.418273, 0.3333333, 1, 0, 1,
-0.5620741, -0.02750479, -1.473811, 0.3254902, 1, 0, 1,
-0.559527, -0.9987874, -1.229568, 0.3215686, 1, 0, 1,
-0.5572067, -0.733564, -2.201522, 0.3137255, 1, 0, 1,
-0.5509128, 0.2896101, -0.2851461, 0.3098039, 1, 0, 1,
-0.5504082, -0.7410127, -1.655463, 0.3019608, 1, 0, 1,
-0.5498626, -2.12151, -2.365964, 0.2941177, 1, 0, 1,
-0.5492258, 0.5809575, -0.5966826, 0.2901961, 1, 0, 1,
-0.5461891, 0.436776, -0.7386432, 0.282353, 1, 0, 1,
-0.5439007, -0.6782138, -2.483883, 0.2784314, 1, 0, 1,
-0.5365983, 1.170214, 0.3873968, 0.2705882, 1, 0, 1,
-0.5360056, -1.070899, -1.632965, 0.2666667, 1, 0, 1,
-0.5324697, -0.1840724, -2.082851, 0.2588235, 1, 0, 1,
-0.5265871, 0.2608444, -1.32863, 0.254902, 1, 0, 1,
-0.5252324, -0.6721361, -2.787349, 0.2470588, 1, 0, 1,
-0.5236941, -0.3624353, -1.787206, 0.2431373, 1, 0, 1,
-0.5191222, 1.426236, -2.163462, 0.2352941, 1, 0, 1,
-0.514091, 0.7676884, -1.687262, 0.2313726, 1, 0, 1,
-0.5126643, -0.2012573, -1.55186, 0.2235294, 1, 0, 1,
-0.5056211, -0.3564612, -1.881004, 0.2196078, 1, 0, 1,
-0.5046132, 0.08757081, -2.776482, 0.2117647, 1, 0, 1,
-0.5028648, -1.120221, -3.378804, 0.2078431, 1, 0, 1,
-0.5021557, -2.398733, -2.352917, 0.2, 1, 0, 1,
-0.5001535, 0.8744937, 0.3629385, 0.1921569, 1, 0, 1,
-0.4867525, 0.3027676, 0.1555884, 0.1882353, 1, 0, 1,
-0.4821537, 0.1323462, 0.2539424, 0.1803922, 1, 0, 1,
-0.4780427, 1.37491, 0.105408, 0.1764706, 1, 0, 1,
-0.4764745, -0.1204587, -2.021451, 0.1686275, 1, 0, 1,
-0.4745735, -0.9245024, -2.2286, 0.1647059, 1, 0, 1,
-0.4738114, -0.5632096, -1.69575, 0.1568628, 1, 0, 1,
-0.4700112, -0.09471085, -2.036141, 0.1529412, 1, 0, 1,
-0.4692773, 0.0782401, -0.05958142, 0.145098, 1, 0, 1,
-0.4680811, -1.49612, -1.065682, 0.1411765, 1, 0, 1,
-0.4677248, 2.088486, -0.9852316, 0.1333333, 1, 0, 1,
-0.4677071, -0.8468465, -2.171231, 0.1294118, 1, 0, 1,
-0.4654157, -0.3175527, -4.849432, 0.1215686, 1, 0, 1,
-0.4637346, 1.142706, -0.6705832, 0.1176471, 1, 0, 1,
-0.4605461, -0.02058902, 0.1915542, 0.1098039, 1, 0, 1,
-0.459771, -0.471254, -2.978219, 0.1058824, 1, 0, 1,
-0.4584309, -0.7171347, -0.2037439, 0.09803922, 1, 0, 1,
-0.4490457, 0.189224, -0.568023, 0.09019608, 1, 0, 1,
-0.4472876, 1.158521, -1.876746, 0.08627451, 1, 0, 1,
-0.4462685, -0.6010195, -4.239592, 0.07843138, 1, 0, 1,
-0.4457089, -1.980853, -4.916523, 0.07450981, 1, 0, 1,
-0.4374271, -0.6074114, -2.583542, 0.06666667, 1, 0, 1,
-0.4324834, -0.2777355, -2.706071, 0.0627451, 1, 0, 1,
-0.4290677, -1.205783, -2.101187, 0.05490196, 1, 0, 1,
-0.4152269, -0.002831419, -2.441063, 0.05098039, 1, 0, 1,
-0.4134366, -0.3737, -1.748378, 0.04313726, 1, 0, 1,
-0.4111041, 2.145042, 1.042239, 0.03921569, 1, 0, 1,
-0.4100737, 0.6955228, -3.970699, 0.03137255, 1, 0, 1,
-0.4087279, -0.6956683, -1.682438, 0.02745098, 1, 0, 1,
-0.4047806, -0.002197844, -2.966773, 0.01960784, 1, 0, 1,
-0.4046064, 0.3671978, -1.238842, 0.01568628, 1, 0, 1,
-0.4041932, -1.846723, -3.07901, 0.007843138, 1, 0, 1,
-0.3985985, -0.2721643, -0.5750069, 0.003921569, 1, 0, 1,
-0.3979132, 0.6742631, -0.4924359, 0, 1, 0.003921569, 1,
-0.3979063, 0.8019051, -2.034068, 0, 1, 0.01176471, 1,
-0.3955923, -0.1037273, -2.079421, 0, 1, 0.01568628, 1,
-0.3946864, -0.002803643, -2.674127, 0, 1, 0.02352941, 1,
-0.3945753, -0.8485188, -1.343802, 0, 1, 0.02745098, 1,
-0.3937476, 0.5294589, -0.2347703, 0, 1, 0.03529412, 1,
-0.3912939, -1.737171, -1.925435, 0, 1, 0.03921569, 1,
-0.3912634, 1.035318, 1.092877, 0, 1, 0.04705882, 1,
-0.3804443, -0.1816066, -3.320218, 0, 1, 0.05098039, 1,
-0.3796132, 0.7193965, 0.17916, 0, 1, 0.05882353, 1,
-0.378071, -0.9348774, -2.037183, 0, 1, 0.0627451, 1,
-0.3756804, -0.56993, -1.524656, 0, 1, 0.07058824, 1,
-0.3742375, 1.187208, -1.475214, 0, 1, 0.07450981, 1,
-0.373778, 0.2050757, -1.983173, 0, 1, 0.08235294, 1,
-0.3710684, -0.06005733, -2.403015, 0, 1, 0.08627451, 1,
-0.3649522, -0.9889991, -1.657329, 0, 1, 0.09411765, 1,
-0.364091, 0.6351358, 0.8530009, 0, 1, 0.1019608, 1,
-0.3633071, 0.7540532, -1.579668, 0, 1, 0.1058824, 1,
-0.3613984, 0.3728549, -0.5732189, 0, 1, 0.1137255, 1,
-0.360743, -1.255995, -3.56763, 0, 1, 0.1176471, 1,
-0.3562513, 1.518623, 0.2763065, 0, 1, 0.1254902, 1,
-0.3516192, -1.368677, -0.9216716, 0, 1, 0.1294118, 1,
-0.3513515, -0.02395589, -0.9586774, 0, 1, 0.1372549, 1,
-0.3499014, -0.7929559, -2.741497, 0, 1, 0.1411765, 1,
-0.349857, 0.6838502, -1.044406, 0, 1, 0.1490196, 1,
-0.3485823, 0.2723512, -1.286182, 0, 1, 0.1529412, 1,
-0.3460035, -1.122156, -2.230601, 0, 1, 0.1607843, 1,
-0.3444159, 0.6638278, 0.124511, 0, 1, 0.1647059, 1,
-0.343832, 0.8321777, 0.3293991, 0, 1, 0.172549, 1,
-0.3423968, -1.832745, -1.990854, 0, 1, 0.1764706, 1,
-0.3399407, -0.002414837, -1.324109, 0, 1, 0.1843137, 1,
-0.3338469, 0.1970992, -1.149587, 0, 1, 0.1882353, 1,
-0.3290781, 0.3634237, -2.446121, 0, 1, 0.1960784, 1,
-0.3270688, 1.128913, 1.160001, 0, 1, 0.2039216, 1,
-0.3262794, -0.6329517, -1.973618, 0, 1, 0.2078431, 1,
-0.3145864, -0.108169, -1.928377, 0, 1, 0.2156863, 1,
-0.3138953, -0.1206651, -1.933875, 0, 1, 0.2196078, 1,
-0.311739, -0.6715314, -3.202183, 0, 1, 0.227451, 1,
-0.3067455, 0.8967645, -0.6651998, 0, 1, 0.2313726, 1,
-0.3064587, -2.060965, -3.346095, 0, 1, 0.2392157, 1,
-0.3049914, 0.8858635, -0.3320212, 0, 1, 0.2431373, 1,
-0.3040391, 0.09399682, 0.3985987, 0, 1, 0.2509804, 1,
-0.3013312, 0.5044076, 0.2828434, 0, 1, 0.254902, 1,
-0.2987122, 0.05673648, -0.210322, 0, 1, 0.2627451, 1,
-0.2905082, 0.7539216, -0.05374534, 0, 1, 0.2666667, 1,
-0.2905073, -0.5107978, -4.151177, 0, 1, 0.2745098, 1,
-0.2838944, -0.2911671, -2.839605, 0, 1, 0.2784314, 1,
-0.2828037, 0.6486865, 0.6115716, 0, 1, 0.2862745, 1,
-0.2819172, 0.3762164, -1.448057, 0, 1, 0.2901961, 1,
-0.278015, 0.6841158, -1.680417, 0, 1, 0.2980392, 1,
-0.2759941, -0.1076948, -1.044023, 0, 1, 0.3058824, 1,
-0.273498, 2.023592, -0.1020988, 0, 1, 0.3098039, 1,
-0.2690259, 0.04632055, -0.926672, 0, 1, 0.3176471, 1,
-0.2648052, -0.004433615, -1.652415, 0, 1, 0.3215686, 1,
-0.2624757, -0.9981364, -3.560212, 0, 1, 0.3294118, 1,
-0.2617463, 1.326075, -2.08489, 0, 1, 0.3333333, 1,
-0.2602601, 1.996379, -0.6728557, 0, 1, 0.3411765, 1,
-0.2576536, -0.3041085, -3.01446, 0, 1, 0.345098, 1,
-0.2551414, 0.1848524, -1.019811, 0, 1, 0.3529412, 1,
-0.2412816, -0.7803834, -3.81856, 0, 1, 0.3568628, 1,
-0.2410304, 0.4882976, -0.4003823, 0, 1, 0.3647059, 1,
-0.2390713, -0.1999633, -1.73673, 0, 1, 0.3686275, 1,
-0.2388544, 0.7039866, -0.3824715, 0, 1, 0.3764706, 1,
-0.2384609, -1.002533, -2.908471, 0, 1, 0.3803922, 1,
-0.235604, -1.843634, -3.638854, 0, 1, 0.3882353, 1,
-0.2351535, 1.542672, 0.2100172, 0, 1, 0.3921569, 1,
-0.2332291, -1.507236, -3.163793, 0, 1, 0.4, 1,
-0.2328666, 0.3511769, -1.960434, 0, 1, 0.4078431, 1,
-0.2328278, 0.1420417, -0.7947546, 0, 1, 0.4117647, 1,
-0.2282542, -0.1973223, -4.240483, 0, 1, 0.4196078, 1,
-0.2252946, 0.14974, -3.170125, 0, 1, 0.4235294, 1,
-0.2232749, 0.5250608, -1.136534, 0, 1, 0.4313726, 1,
-0.2207504, -1.315336, -2.555571, 0, 1, 0.4352941, 1,
-0.2205498, -0.4282351, -4.572506, 0, 1, 0.4431373, 1,
-0.220217, 0.05714538, -0.7303314, 0, 1, 0.4470588, 1,
-0.2184984, -0.1913564, -1.483279, 0, 1, 0.454902, 1,
-0.2155791, 0.4642074, -1.181132, 0, 1, 0.4588235, 1,
-0.2151954, 2.038378, 0.1196331, 0, 1, 0.4666667, 1,
-0.2123836, 1.185705, 0.1885117, 0, 1, 0.4705882, 1,
-0.2068835, -0.09971718, -2.020271, 0, 1, 0.4784314, 1,
-0.2051175, -0.9068868, -3.689759, 0, 1, 0.4823529, 1,
-0.2046744, 0.3705393, 0.001960695, 0, 1, 0.4901961, 1,
-0.1994783, -2.507736, -1.899392, 0, 1, 0.4941176, 1,
-0.1988155, 0.132245, -0.4690096, 0, 1, 0.5019608, 1,
-0.1978535, -1.014684, -2.843821, 0, 1, 0.509804, 1,
-0.1939106, -0.1863878, -2.639283, 0, 1, 0.5137255, 1,
-0.1924047, -0.8330815, -3.754726, 0, 1, 0.5215687, 1,
-0.1922952, -0.07237381, -2.07185, 0, 1, 0.5254902, 1,
-0.1896781, -0.2733476, -2.360174, 0, 1, 0.5333334, 1,
-0.188915, -0.2719926, -1.754502, 0, 1, 0.5372549, 1,
-0.1885424, -0.1085646, -1.032754, 0, 1, 0.5450981, 1,
-0.188469, 1.005284, -1.395926, 0, 1, 0.5490196, 1,
-0.1831871, 0.6120037, -0.2854468, 0, 1, 0.5568628, 1,
-0.1818734, 0.2471657, -0.9866585, 0, 1, 0.5607843, 1,
-0.1788744, 0.9667692, -1.345417, 0, 1, 0.5686275, 1,
-0.1786313, 2.148118, 0.7644591, 0, 1, 0.572549, 1,
-0.1719041, -2.129573, -4.434234, 0, 1, 0.5803922, 1,
-0.1702426, -1.553957, -3.231771, 0, 1, 0.5843138, 1,
-0.1661826, -1.38693, -2.211218, 0, 1, 0.5921569, 1,
-0.1593451, -0.6060545, -4.327393, 0, 1, 0.5960785, 1,
-0.1578141, 0.01470331, -3.15022, 0, 1, 0.6039216, 1,
-0.1573081, 0.7223203, 0.12922, 0, 1, 0.6117647, 1,
-0.1569468, 0.06415413, -2.261086, 0, 1, 0.6156863, 1,
-0.1562896, 1.253582, -0.3835182, 0, 1, 0.6235294, 1,
-0.1552863, -0.3206549, -3.21119, 0, 1, 0.627451, 1,
-0.1546807, 0.3547723, -1.498306, 0, 1, 0.6352941, 1,
-0.1509245, 0.767358, -0.08165547, 0, 1, 0.6392157, 1,
-0.1507858, 0.2165094, -3.675648e-05, 0, 1, 0.6470588, 1,
-0.1505777, 0.5258193, -1.539324, 0, 1, 0.6509804, 1,
-0.1503407, 0.1939107, -2.735156, 0, 1, 0.6588235, 1,
-0.1460085, 0.6279921, -1.190746, 0, 1, 0.6627451, 1,
-0.1439458, 1.133299, -1.308018, 0, 1, 0.6705883, 1,
-0.1351399, -0.5200834, -2.21552, 0, 1, 0.6745098, 1,
-0.1337552, -0.2681886, -2.022597, 0, 1, 0.682353, 1,
-0.1330175, 1.751895, 0.3223672, 0, 1, 0.6862745, 1,
-0.1263305, 0.7097282, 1.248019, 0, 1, 0.6941177, 1,
-0.1249024, 0.5508835, -0.6500235, 0, 1, 0.7019608, 1,
-0.1219059, 0.9715738, -0.5195122, 0, 1, 0.7058824, 1,
-0.1202512, -1.125923, -2.332677, 0, 1, 0.7137255, 1,
-0.1181439, -0.9561989, -4.128131, 0, 1, 0.7176471, 1,
-0.1128374, 1.874041, -0.7921649, 0, 1, 0.7254902, 1,
-0.112354, 1.760345, 1.037776, 0, 1, 0.7294118, 1,
-0.1111016, 0.9265124, -1.709775, 0, 1, 0.7372549, 1,
-0.1100265, -0.6442602, -3.251633, 0, 1, 0.7411765, 1,
-0.1096685, 0.3612056, -0.5905129, 0, 1, 0.7490196, 1,
-0.1093821, 0.5368, -0.5017262, 0, 1, 0.7529412, 1,
-0.1040342, -1.604607, -4.252235, 0, 1, 0.7607843, 1,
-0.1036108, 1.194482, -0.6495262, 0, 1, 0.7647059, 1,
-0.102379, 0.6533409, 1.654156, 0, 1, 0.772549, 1,
-0.09861481, -0.3792425, -1.795328, 0, 1, 0.7764706, 1,
-0.09097637, -1.53291, -4.017646, 0, 1, 0.7843137, 1,
-0.09016369, 0.108178, -1.317129, 0, 1, 0.7882353, 1,
-0.08843473, 0.2034928, 0.9031617, 0, 1, 0.7960784, 1,
-0.08718222, -0.4570418, -3.470328, 0, 1, 0.8039216, 1,
-0.08626607, -0.2518092, -0.9364827, 0, 1, 0.8078431, 1,
-0.08622108, -0.02847087, -2.213353, 0, 1, 0.8156863, 1,
-0.08396249, 0.2685648, 0.5149268, 0, 1, 0.8196079, 1,
-0.08306944, 0.7704585, 1.481355, 0, 1, 0.827451, 1,
-0.08180936, 0.9563526, -1.341727, 0, 1, 0.8313726, 1,
-0.07814956, 1.538225, -1.706504, 0, 1, 0.8392157, 1,
-0.07405884, -0.2719258, -2.790061, 0, 1, 0.8431373, 1,
-0.07154083, -0.2051793, -2.143671, 0, 1, 0.8509804, 1,
-0.05820678, 0.7592533, -1.931273, 0, 1, 0.854902, 1,
-0.05784238, -0.24294, -1.10239, 0, 1, 0.8627451, 1,
-0.0550314, 0.03226159, -1.931513, 0, 1, 0.8666667, 1,
-0.05321853, -1.135693, -3.592901, 0, 1, 0.8745098, 1,
-0.05145429, 0.7591532, -0.08592699, 0, 1, 0.8784314, 1,
-0.05041311, 0.5015356, -0.1116325, 0, 1, 0.8862745, 1,
-0.04755406, 0.4472981, 1.556564, 0, 1, 0.8901961, 1,
-0.04463351, 0.2310106, 0.5186729, 0, 1, 0.8980392, 1,
-0.04404961, 2.710483, -0.03381816, 0, 1, 0.9058824, 1,
-0.0416519, 0.7226852, -0.2232678, 0, 1, 0.9098039, 1,
-0.0345997, -1.334238, -2.035815, 0, 1, 0.9176471, 1,
-0.02895098, -0.983691, -3.890263, 0, 1, 0.9215686, 1,
-0.0259986, 1.580569, 0.7536316, 0, 1, 0.9294118, 1,
-0.02473692, 0.02979414, -0.1963991, 0, 1, 0.9333333, 1,
-0.01957211, 0.4187377, -0.6586628, 0, 1, 0.9411765, 1,
-0.0149779, -1.724193, -1.250791, 0, 1, 0.945098, 1,
-0.01215089, -0.6603187, -4.075271, 0, 1, 0.9529412, 1,
-0.01204773, -1.175467, -4.270849, 0, 1, 0.9568627, 1,
-0.0118321, -2.299987, -2.542852, 0, 1, 0.9647059, 1,
-0.0110533, 1.023131, 0.299877, 0, 1, 0.9686275, 1,
-0.007762936, 0.8513673, -0.1456451, 0, 1, 0.9764706, 1,
-0.002277972, 1.638783, -0.9144365, 0, 1, 0.9803922, 1,
-0.002157753, -2.692345, -3.509718, 0, 1, 0.9882353, 1,
-0.001824192, 0.4580489, -0.3641944, 0, 1, 0.9921569, 1,
-0.0002793889, -0.9522585, -2.122181, 0, 1, 1, 1,
0.001521076, -0.6057219, 4.08547, 0, 0.9921569, 1, 1,
0.002812681, -1.480628, 1.830519, 0, 0.9882353, 1, 1,
0.003475386, 0.7054818, -0.4795572, 0, 0.9803922, 1, 1,
0.008875707, -1.428218, 4.467979, 0, 0.9764706, 1, 1,
0.009074982, -0.4736923, 2.540607, 0, 0.9686275, 1, 1,
0.01262837, 0.004216445, 2.776347, 0, 0.9647059, 1, 1,
0.01329622, 0.3223491, 0.7193506, 0, 0.9568627, 1, 1,
0.01966169, -1.573183, 2.37108, 0, 0.9529412, 1, 1,
0.0210176, -0.3082072, 3.4009, 0, 0.945098, 1, 1,
0.0214847, 0.2806015, 1.485556, 0, 0.9411765, 1, 1,
0.02379606, -1.36273, 4.452761, 0, 0.9333333, 1, 1,
0.0246712, 0.09115303, 0.1198488, 0, 0.9294118, 1, 1,
0.02543679, -0.7659895, 1.965063, 0, 0.9215686, 1, 1,
0.02809327, -1.196935, 4.253867, 0, 0.9176471, 1, 1,
0.03451334, 1.066399, -0.2030338, 0, 0.9098039, 1, 1,
0.03841253, 0.2807336, -0.3239826, 0, 0.9058824, 1, 1,
0.04015586, -0.6853772, 2.612097, 0, 0.8980392, 1, 1,
0.0479531, 0.08796521, 2.527984, 0, 0.8901961, 1, 1,
0.05390637, -1.343402, 2.222958, 0, 0.8862745, 1, 1,
0.05455622, 0.03679096, 1.768732, 0, 0.8784314, 1, 1,
0.05718014, -1.462392, 2.481251, 0, 0.8745098, 1, 1,
0.05876698, 0.6328202, 1.307562, 0, 0.8666667, 1, 1,
0.07073358, -0.6027619, 3.468342, 0, 0.8627451, 1, 1,
0.07160959, -0.7130954, 2.820405, 0, 0.854902, 1, 1,
0.07622577, 0.2518759, -0.4662517, 0, 0.8509804, 1, 1,
0.09389092, -0.5334343, 2.705559, 0, 0.8431373, 1, 1,
0.09428366, 0.4993172, 1.59893, 0, 0.8392157, 1, 1,
0.09696297, 1.13058, 1.3071, 0, 0.8313726, 1, 1,
0.09822886, -0.5624484, 1.757764, 0, 0.827451, 1, 1,
0.1000118, -0.1854418, 3.56669, 0, 0.8196079, 1, 1,
0.1032449, 0.2488954, 0.639988, 0, 0.8156863, 1, 1,
0.1067483, -0.007695836, 2.339628, 0, 0.8078431, 1, 1,
0.1072216, -1.314856, 2.967185, 0, 0.8039216, 1, 1,
0.1077597, 0.5540997, 1.519254, 0, 0.7960784, 1, 1,
0.1100237, -1.614818, 4.579487, 0, 0.7882353, 1, 1,
0.11256, -0.400488, 3.879026, 0, 0.7843137, 1, 1,
0.1217411, -1.400503, 2.614827, 0, 0.7764706, 1, 1,
0.1218961, -1.231719, 3.41371, 0, 0.772549, 1, 1,
0.123831, 0.5871403, -0.323599, 0, 0.7647059, 1, 1,
0.1287248, -0.9524692, 2.848641, 0, 0.7607843, 1, 1,
0.1311194, -0.8775989, 2.924931, 0, 0.7529412, 1, 1,
0.1357876, 1.575979, -0.5416555, 0, 0.7490196, 1, 1,
0.1360507, 0.9688424, 0.3703162, 0, 0.7411765, 1, 1,
0.1378101, 1.341411, 1.051931, 0, 0.7372549, 1, 1,
0.1392916, -0.3049988, 3.675037, 0, 0.7294118, 1, 1,
0.1443153, 0.6265322, -0.5764219, 0, 0.7254902, 1, 1,
0.1468157, -0.9198649, 2.557802, 0, 0.7176471, 1, 1,
0.1501568, -0.5923929, 4.081061, 0, 0.7137255, 1, 1,
0.1509208, -1.636988, 2.221936, 0, 0.7058824, 1, 1,
0.1535425, 0.2529786, -0.1231599, 0, 0.6980392, 1, 1,
0.1561479, 0.0200677, 2.718287, 0, 0.6941177, 1, 1,
0.1564508, -0.1102985, 0.1768866, 0, 0.6862745, 1, 1,
0.158796, 1.084555, -0.8226467, 0, 0.682353, 1, 1,
0.1592503, -0.09844819, 2.395843, 0, 0.6745098, 1, 1,
0.1647834, 1.109867, 1.148071, 0, 0.6705883, 1, 1,
0.1689257, 0.8883766, -1.039791, 0, 0.6627451, 1, 1,
0.1693639, -1.307693, 1.394976, 0, 0.6588235, 1, 1,
0.1697613, -0.05929811, 3.028617, 0, 0.6509804, 1, 1,
0.1721404, 0.325502, -0.157547, 0, 0.6470588, 1, 1,
0.1729479, 0.4504199, 1.642234, 0, 0.6392157, 1, 1,
0.1786259, -0.2187422, 2.799323, 0, 0.6352941, 1, 1,
0.1797553, 2.772752, -1.428647, 0, 0.627451, 1, 1,
0.1813348, 1.639119, -1.043537, 0, 0.6235294, 1, 1,
0.1825435, -0.6381673, 2.064517, 0, 0.6156863, 1, 1,
0.1839532, -0.02526949, 1.244126, 0, 0.6117647, 1, 1,
0.1852303, 0.3340045, 1.232628, 0, 0.6039216, 1, 1,
0.1864283, 0.0372444, 1.075233, 0, 0.5960785, 1, 1,
0.201918, -0.696278, 2.610976, 0, 0.5921569, 1, 1,
0.2023842, -0.5164268, 3.534904, 0, 0.5843138, 1, 1,
0.2036285, 0.2871424, 1.998351, 0, 0.5803922, 1, 1,
0.2171865, 0.3329762, 0.5256736, 0, 0.572549, 1, 1,
0.2229242, 1.047343, -0.3591961, 0, 0.5686275, 1, 1,
0.2234163, -0.3910155, 3.753697, 0, 0.5607843, 1, 1,
0.2249019, -1.348362, 1.885141, 0, 0.5568628, 1, 1,
0.2256075, 0.1361858, 2.782278, 0, 0.5490196, 1, 1,
0.2269465, 0.8710303, -1.824629, 0, 0.5450981, 1, 1,
0.2275354, 0.07869498, -0.615336, 0, 0.5372549, 1, 1,
0.228239, 0.6453694, -0.1099053, 0, 0.5333334, 1, 1,
0.2296554, -0.2218029, 1.599707, 0, 0.5254902, 1, 1,
0.2337884, 0.5375714, -0.3524026, 0, 0.5215687, 1, 1,
0.2356229, 0.3735061, 0.5332785, 0, 0.5137255, 1, 1,
0.2445292, -0.9058838, 3.721586, 0, 0.509804, 1, 1,
0.2461585, 0.5931342, 0.6266428, 0, 0.5019608, 1, 1,
0.2463688, 0.7989323, 0.7455711, 0, 0.4941176, 1, 1,
0.2498278, 0.7050068, -0.5520231, 0, 0.4901961, 1, 1,
0.2508406, 0.5485211, 0.9208743, 0, 0.4823529, 1, 1,
0.2508537, 0.538003, 1.80009, 0, 0.4784314, 1, 1,
0.2510809, 0.4676645, 0.4986338, 0, 0.4705882, 1, 1,
0.2582427, 1.232791, -0.3388291, 0, 0.4666667, 1, 1,
0.2587595, -0.1639583, 1.554101, 0, 0.4588235, 1, 1,
0.259699, -1.174633, 2.512577, 0, 0.454902, 1, 1,
0.2604566, 0.7358609, -0.05778801, 0, 0.4470588, 1, 1,
0.2634418, 0.3019016, 2.571768, 0, 0.4431373, 1, 1,
0.2641612, 1.233781, -1.06143, 0, 0.4352941, 1, 1,
0.2757581, 0.36871, 0.3922417, 0, 0.4313726, 1, 1,
0.2782545, -1.89414, 3.900964, 0, 0.4235294, 1, 1,
0.2791642, -0.1320235, -0.4175359, 0, 0.4196078, 1, 1,
0.2796935, -1.024147, 3.363742, 0, 0.4117647, 1, 1,
0.2826, 0.01994369, 1.47747, 0, 0.4078431, 1, 1,
0.2833644, 0.05076447, 1.14736, 0, 0.4, 1, 1,
0.2863177, 0.187237, 0.9239348, 0, 0.3921569, 1, 1,
0.2899745, 0.383216, 1.375433, 0, 0.3882353, 1, 1,
0.2964585, 0.5632831, -0.2277557, 0, 0.3803922, 1, 1,
0.3043887, -0.09734366, 2.047431, 0, 0.3764706, 1, 1,
0.3109544, -1.244538, 2.153731, 0, 0.3686275, 1, 1,
0.3165875, -1.176854, 2.970072, 0, 0.3647059, 1, 1,
0.3183978, 0.5962189, 2.383586, 0, 0.3568628, 1, 1,
0.3189734, 1.083941, 0.387565, 0, 0.3529412, 1, 1,
0.3194263, 0.5195859, 1.032932, 0, 0.345098, 1, 1,
0.3219585, 1.422551, 1.159496, 0, 0.3411765, 1, 1,
0.3231624, 0.9719011, 1.629826, 0, 0.3333333, 1, 1,
0.3249316, 2.028393, -0.4767894, 0, 0.3294118, 1, 1,
0.3257666, 0.1618648, 0.3784877, 0, 0.3215686, 1, 1,
0.3291461, 1.744968, 0.6203144, 0, 0.3176471, 1, 1,
0.3294443, 1.016641, 0.3508598, 0, 0.3098039, 1, 1,
0.331489, 1.155957, 0.4174899, 0, 0.3058824, 1, 1,
0.3375475, 1.008485, -1.46372, 0, 0.2980392, 1, 1,
0.3376542, -1.866788, 3.633027, 0, 0.2901961, 1, 1,
0.3406612, 0.6080624, 0.7208442, 0, 0.2862745, 1, 1,
0.3434708, -0.6065192, 2.157738, 0, 0.2784314, 1, 1,
0.3440855, 1.191281, 1.136504, 0, 0.2745098, 1, 1,
0.3443848, 0.4806378, -0.3856611, 0, 0.2666667, 1, 1,
0.3446822, -0.879585, 2.055496, 0, 0.2627451, 1, 1,
0.3457383, 0.370896, 1.036052, 0, 0.254902, 1, 1,
0.3486062, 1.511115, 0.6573893, 0, 0.2509804, 1, 1,
0.3516957, -0.2037784, 0.6025932, 0, 0.2431373, 1, 1,
0.3541172, 0.2201202, 2.250932, 0, 0.2392157, 1, 1,
0.3579396, 0.761813, 1.07605, 0, 0.2313726, 1, 1,
0.3606122, 0.5956019, 0.3212067, 0, 0.227451, 1, 1,
0.3618034, 1.644677, 0.4490182, 0, 0.2196078, 1, 1,
0.3647274, 0.4730232, -0.3860312, 0, 0.2156863, 1, 1,
0.365033, 0.6807293, -2.238289, 0, 0.2078431, 1, 1,
0.3652912, 0.01841757, 1.133369, 0, 0.2039216, 1, 1,
0.3662526, -1.429186, 1.864604, 0, 0.1960784, 1, 1,
0.3665018, 1.11841, -0.007323188, 0, 0.1882353, 1, 1,
0.3695683, 1.400975, -0.485534, 0, 0.1843137, 1, 1,
0.3707531, 0.2041069, -1.159999, 0, 0.1764706, 1, 1,
0.3716517, -0.2231187, 2.344666, 0, 0.172549, 1, 1,
0.3728346, 0.04221588, 0.3415921, 0, 0.1647059, 1, 1,
0.3846726, -1.504963, 2.999228, 0, 0.1607843, 1, 1,
0.3888488, 0.08833814, 0.4740417, 0, 0.1529412, 1, 1,
0.3889416, -0.9187846, 3.452455, 0, 0.1490196, 1, 1,
0.3918104, -0.4408042, 1.748745, 0, 0.1411765, 1, 1,
0.3922536, -0.4032499, 2.859148, 0, 0.1372549, 1, 1,
0.3950492, 0.01336546, 0.3029157, 0, 0.1294118, 1, 1,
0.3984513, 1.547836, 1.222122, 0, 0.1254902, 1, 1,
0.3989196, -0.4095778, 3.728958, 0, 0.1176471, 1, 1,
0.4008567, 0.1838266, 2.291592, 0, 0.1137255, 1, 1,
0.4018095, 0.7372048, 0.1950761, 0, 0.1058824, 1, 1,
0.401868, -0.7709098, 3.919228, 0, 0.09803922, 1, 1,
0.4096053, 0.03741929, 1.528675, 0, 0.09411765, 1, 1,
0.4098939, -0.2424309, 3.952147, 0, 0.08627451, 1, 1,
0.4110482, 0.338205, 1.84583, 0, 0.08235294, 1, 1,
0.4137354, -2.197173, 3.851114, 0, 0.07450981, 1, 1,
0.4140662, 2.190337, 1.763642, 0, 0.07058824, 1, 1,
0.415206, -0.893085, 2.092032, 0, 0.0627451, 1, 1,
0.4167701, 0.9200264, 0.7967095, 0, 0.05882353, 1, 1,
0.4198509, 1.624565, -1.127556, 0, 0.05098039, 1, 1,
0.4226343, 0.1562196, 1.506308, 0, 0.04705882, 1, 1,
0.4247068, -1.759759, 4.051644, 0, 0.03921569, 1, 1,
0.4252638, -0.2918645, 1.374786, 0, 0.03529412, 1, 1,
0.4292252, -1.239412, 3.536092, 0, 0.02745098, 1, 1,
0.4297918, 0.8107338, 0.5320528, 0, 0.02352941, 1, 1,
0.4302312, 0.07771052, 0.9953153, 0, 0.01568628, 1, 1,
0.4308488, 0.8737192, 0.559078, 0, 0.01176471, 1, 1,
0.4314131, 0.7229217, 0.5879392, 0, 0.003921569, 1, 1,
0.4327866, -0.1327717, 2.007419, 0.003921569, 0, 1, 1,
0.4335603, 0.1323783, 2.691344, 0.007843138, 0, 1, 1,
0.4369947, -0.5868495, 1.28264, 0.01568628, 0, 1, 1,
0.4515534, 1.754811, -0.3363197, 0.01960784, 0, 1, 1,
0.4587878, 0.2478708, 2.058677, 0.02745098, 0, 1, 1,
0.4617495, -1.580345, 2.516891, 0.03137255, 0, 1, 1,
0.4673236, 0.634724, 0.0682677, 0.03921569, 0, 1, 1,
0.4691187, -0.4056695, 1.793598, 0.04313726, 0, 1, 1,
0.4723536, 0.773917, 1.915422, 0.05098039, 0, 1, 1,
0.4730464, 0.3142294, 1.189053, 0.05490196, 0, 1, 1,
0.4751233, -0.06075614, 1.752678, 0.0627451, 0, 1, 1,
0.4860615, -0.861956, 3.745638, 0.06666667, 0, 1, 1,
0.4870643, 1.226901, 1.261255, 0.07450981, 0, 1, 1,
0.4900146, 0.3140362, 0.01525354, 0.07843138, 0, 1, 1,
0.4926423, 0.09626403, 1.652056, 0.08627451, 0, 1, 1,
0.4986851, 0.4877108, -0.1691824, 0.09019608, 0, 1, 1,
0.5066326, -1.539579, 2.844062, 0.09803922, 0, 1, 1,
0.5095865, -0.1587401, 1.81481, 0.1058824, 0, 1, 1,
0.5148838, -0.9156478, 2.174924, 0.1098039, 0, 1, 1,
0.5156209, -0.0999558, 1.240381, 0.1176471, 0, 1, 1,
0.5189922, -1.726694, 4.18812, 0.1215686, 0, 1, 1,
0.5248161, 0.3407516, 0.7900418, 0.1294118, 0, 1, 1,
0.5294201, -2.778042, 3.246357, 0.1333333, 0, 1, 1,
0.5310473, 1.600183, 0.5982977, 0.1411765, 0, 1, 1,
0.5342876, 1.205612, 0.9647413, 0.145098, 0, 1, 1,
0.5350175, -0.4330996, 1.504329, 0.1529412, 0, 1, 1,
0.5402564, -1.30438, 2.878073, 0.1568628, 0, 1, 1,
0.5404174, 0.05187216, 1.011122, 0.1647059, 0, 1, 1,
0.5414922, -0.6936594, 1.423637, 0.1686275, 0, 1, 1,
0.542411, -0.05897674, 0.7775768, 0.1764706, 0, 1, 1,
0.5447053, -1.875872, 2.220082, 0.1803922, 0, 1, 1,
0.5457566, 0.8283805, 1.108891, 0.1882353, 0, 1, 1,
0.54635, -1.199839, 1.516844, 0.1921569, 0, 1, 1,
0.5463536, -0.2386569, 1.428638, 0.2, 0, 1, 1,
0.5477893, 0.0149207, 0.3658787, 0.2078431, 0, 1, 1,
0.5485864, 1.101443, 0.3360294, 0.2117647, 0, 1, 1,
0.5542311, -1.163656, 3.553713, 0.2196078, 0, 1, 1,
0.5542403, -0.4206264, 3.039634, 0.2235294, 0, 1, 1,
0.5542614, 0.7651211, 0.7811878, 0.2313726, 0, 1, 1,
0.5589587, -0.3802043, 3.429384, 0.2352941, 0, 1, 1,
0.5596343, 0.1872963, 1.675358, 0.2431373, 0, 1, 1,
0.5605607, -0.03236098, 1.330729, 0.2470588, 0, 1, 1,
0.5643202, 0.7035986, 2.73025, 0.254902, 0, 1, 1,
0.5693114, -0.3737321, 1.490407, 0.2588235, 0, 1, 1,
0.5761786, -0.437202, 2.823424, 0.2666667, 0, 1, 1,
0.5781052, 1.118093, 0.5694309, 0.2705882, 0, 1, 1,
0.5833957, 0.2352757, 0.2633804, 0.2784314, 0, 1, 1,
0.5847359, -0.08133027, 1.587182, 0.282353, 0, 1, 1,
0.5881256, 0.497498, 1.668145, 0.2901961, 0, 1, 1,
0.5894596, 0.08662753, 2.439675, 0.2941177, 0, 1, 1,
0.5926744, 0.3386869, 0.1247959, 0.3019608, 0, 1, 1,
0.6018274, 0.1446991, 2.203501, 0.3098039, 0, 1, 1,
0.6032528, -0.439117, 3.406915, 0.3137255, 0, 1, 1,
0.6056372, 0.9496038, -0.3184014, 0.3215686, 0, 1, 1,
0.6066933, 0.4659981, 0.8996671, 0.3254902, 0, 1, 1,
0.6087818, 0.2484534, 1.449497, 0.3333333, 0, 1, 1,
0.613849, -1.459533, 2.609178, 0.3372549, 0, 1, 1,
0.6163233, -0.4768212, 2.902197, 0.345098, 0, 1, 1,
0.6167655, -1.902872, 2.623418, 0.3490196, 0, 1, 1,
0.6222751, -1.730599, 2.005066, 0.3568628, 0, 1, 1,
0.6244022, -0.860809, 3.372744, 0.3607843, 0, 1, 1,
0.6247776, -0.196027, 2.300835, 0.3686275, 0, 1, 1,
0.6310496, 1.091039, -0.3801537, 0.372549, 0, 1, 1,
0.6320851, -1.030352, 2.120304, 0.3803922, 0, 1, 1,
0.6336465, 0.5348933, 0.9312698, 0.3843137, 0, 1, 1,
0.6404818, -0.3486905, 2.899242, 0.3921569, 0, 1, 1,
0.6420513, -1.401207, 3.612882, 0.3960784, 0, 1, 1,
0.6511482, -0.8970423, 2.205935, 0.4039216, 0, 1, 1,
0.651773, 1.744539, 0.9592835, 0.4117647, 0, 1, 1,
0.6523269, -1.114776, 2.869931, 0.4156863, 0, 1, 1,
0.6570269, -0.1491179, 0.7568659, 0.4235294, 0, 1, 1,
0.6613289, 0.7058453, 0.2226591, 0.427451, 0, 1, 1,
0.6629994, -0.5990761, 2.496462, 0.4352941, 0, 1, 1,
0.6648174, -0.6489154, 1.761189, 0.4392157, 0, 1, 1,
0.6732024, -0.3905603, 2.168345, 0.4470588, 0, 1, 1,
0.6742588, 0.6930498, 1.47582, 0.4509804, 0, 1, 1,
0.6773837, 1.715363, 1.433383, 0.4588235, 0, 1, 1,
0.6804227, 1.159061, -0.548335, 0.4627451, 0, 1, 1,
0.6844509, -0.1681132, 3.946984, 0.4705882, 0, 1, 1,
0.6845315, -0.9696115, 3.883405, 0.4745098, 0, 1, 1,
0.689329, -0.3108087, 1.730162, 0.4823529, 0, 1, 1,
0.6915489, 1.154234, -1.324559, 0.4862745, 0, 1, 1,
0.6942885, 0.1208193, 1.290635, 0.4941176, 0, 1, 1,
0.6981987, 2.376554, -0.161327, 0.5019608, 0, 1, 1,
0.7088842, -0.2803052, 2.691812, 0.5058824, 0, 1, 1,
0.7129081, -0.2670148, 2.960437, 0.5137255, 0, 1, 1,
0.7133624, 1.645099, 0.1789287, 0.5176471, 0, 1, 1,
0.7163538, -0.07435712, -0.3519543, 0.5254902, 0, 1, 1,
0.720036, 0.3798496, 1.246915, 0.5294118, 0, 1, 1,
0.7296547, -0.1497587, 3.623363, 0.5372549, 0, 1, 1,
0.7345498, 0.6151599, 3.117837, 0.5411765, 0, 1, 1,
0.7353656, 0.3873402, -0.5256584, 0.5490196, 0, 1, 1,
0.7367899, 1.219868, 0.4645791, 0.5529412, 0, 1, 1,
0.7370303, 0.3170861, 0.7304261, 0.5607843, 0, 1, 1,
0.7379769, 0.7634777, -0.3091149, 0.5647059, 0, 1, 1,
0.7431935, -0.01872524, 2.506416, 0.572549, 0, 1, 1,
0.7478385, 0.8128453, -0.09947848, 0.5764706, 0, 1, 1,
0.748468, 1.491447, 1.892278, 0.5843138, 0, 1, 1,
0.751184, 1.080147, -0.1397262, 0.5882353, 0, 1, 1,
0.7607297, 1.123717, 0.3093077, 0.5960785, 0, 1, 1,
0.7625037, -1.68435, 2.313313, 0.6039216, 0, 1, 1,
0.7745047, -0.5786045, 1.202835, 0.6078432, 0, 1, 1,
0.7807676, 0.3396129, 0.558306, 0.6156863, 0, 1, 1,
0.7810662, -1.02703, 2.460588, 0.6196079, 0, 1, 1,
0.7901932, 0.9154568, 2.556962, 0.627451, 0, 1, 1,
0.792125, 1.109916, 1.56054, 0.6313726, 0, 1, 1,
0.7928113, -2.270788, 3.924866, 0.6392157, 0, 1, 1,
0.7971487, 1.741231, -1.28397, 0.6431373, 0, 1, 1,
0.7978322, -0.2724037, 0.854043, 0.6509804, 0, 1, 1,
0.8002965, 0.5882472, 2.431072, 0.654902, 0, 1, 1,
0.8072674, -0.6624483, 0.7005586, 0.6627451, 0, 1, 1,
0.8078887, 0.08280928, 1.727921, 0.6666667, 0, 1, 1,
0.8172619, -0.6132571, 2.003582, 0.6745098, 0, 1, 1,
0.8191681, -0.1194757, 2.19092, 0.6784314, 0, 1, 1,
0.8262928, -1.491635, 3.023589, 0.6862745, 0, 1, 1,
0.827971, 1.447345, 1.101936, 0.6901961, 0, 1, 1,
0.8292638, -2.840613, 3.35201, 0.6980392, 0, 1, 1,
0.8305297, -0.3298728, 3.589043, 0.7058824, 0, 1, 1,
0.8361413, 0.2130202, 3.047173, 0.7098039, 0, 1, 1,
0.8370659, 0.1582334, 0.7804704, 0.7176471, 0, 1, 1,
0.837153, 0.9237703, 1.084579, 0.7215686, 0, 1, 1,
0.8389679, 0.843651, 2.018336, 0.7294118, 0, 1, 1,
0.8395585, -0.1592886, 3.58629, 0.7333333, 0, 1, 1,
0.844265, 0.04397196, -0.2768623, 0.7411765, 0, 1, 1,
0.847932, -0.2563386, 1.104943, 0.7450981, 0, 1, 1,
0.8520012, -0.0003506491, 1.874283, 0.7529412, 0, 1, 1,
0.8525816, 1.25849, 0.7511951, 0.7568628, 0, 1, 1,
0.8551999, -0.1782171, 1.026402, 0.7647059, 0, 1, 1,
0.8558789, 0.1673256, 0.3124458, 0.7686275, 0, 1, 1,
0.8562677, 1.426856, 2.234342, 0.7764706, 0, 1, 1,
0.8596919, 0.2479522, 1.267741, 0.7803922, 0, 1, 1,
0.8597063, -0.3093164, 1.762172, 0.7882353, 0, 1, 1,
0.8613068, 1.130573, 1.62096, 0.7921569, 0, 1, 1,
0.8622567, 0.2254233, 2.110712, 0.8, 0, 1, 1,
0.8661243, -1.452664, 3.668649, 0.8078431, 0, 1, 1,
0.8762657, 0.4547287, 2.440582, 0.8117647, 0, 1, 1,
0.8766779, 0.8968129, 2.408885, 0.8196079, 0, 1, 1,
0.8786842, -0.2655623, 0.6628308, 0.8235294, 0, 1, 1,
0.882335, -0.08740741, 1.084549, 0.8313726, 0, 1, 1,
0.8835715, 2.075605, 1.640084, 0.8352941, 0, 1, 1,
0.88718, 0.3335651, 2.062636, 0.8431373, 0, 1, 1,
0.8873919, 1.135659, 1.923699, 0.8470588, 0, 1, 1,
0.8957754, -0.4864256, 2.943131, 0.854902, 0, 1, 1,
0.8960313, -0.8341443, 2.135504, 0.8588235, 0, 1, 1,
0.8978237, -1.529408, 1.620477, 0.8666667, 0, 1, 1,
0.9024984, -0.876839, 1.877717, 0.8705882, 0, 1, 1,
0.9026549, -0.6294598, 2.738149, 0.8784314, 0, 1, 1,
0.9075285, 0.2707375, -0.1414811, 0.8823529, 0, 1, 1,
0.9107592, -0.1033831, 1.445484, 0.8901961, 0, 1, 1,
0.9122673, 1.3546, 3.017183, 0.8941177, 0, 1, 1,
0.9148777, -0.0599752, 0.744517, 0.9019608, 0, 1, 1,
0.9187265, -0.9797774, 1.177798, 0.9098039, 0, 1, 1,
0.921841, -0.988148, 1.862034, 0.9137255, 0, 1, 1,
0.9231107, 1.051275, 2.154544, 0.9215686, 0, 1, 1,
0.9238661, -1.029169, 3.359929, 0.9254902, 0, 1, 1,
0.9278108, 0.3051229, 1.088021, 0.9333333, 0, 1, 1,
0.9312056, 0.6292506, 2.300447, 0.9372549, 0, 1, 1,
0.9331691, 1.868543, 2.205762, 0.945098, 0, 1, 1,
0.9377058, -0.7862929, 0.5314086, 0.9490196, 0, 1, 1,
0.9395633, 0.5554315, 2.107664, 0.9568627, 0, 1, 1,
0.9452015, -1.310245, 2.521808, 0.9607843, 0, 1, 1,
0.9484384, 1.990425, 0.409698, 0.9686275, 0, 1, 1,
0.9500382, 0.3786397, 0.9024759, 0.972549, 0, 1, 1,
0.9505815, 2.479626, 0.3627645, 0.9803922, 0, 1, 1,
0.9571624, -0.2718174, 1.825574, 0.9843137, 0, 1, 1,
0.9585237, 0.25556, 0.4594312, 0.9921569, 0, 1, 1,
0.9592402, -1.022004, 2.814968, 0.9960784, 0, 1, 1,
0.9678376, 1.052056, 1.719312, 1, 0, 0.9960784, 1,
0.9683196, -0.8189833, 3.243406, 1, 0, 0.9882353, 1,
0.9723929, -0.01362865, 2.189139, 1, 0, 0.9843137, 1,
0.9763749, 0.9403653, -0.205846, 1, 0, 0.9764706, 1,
0.976905, -0.9027395, 1.971773, 1, 0, 0.972549, 1,
0.9821039, 1.307059, 3.021168, 1, 0, 0.9647059, 1,
0.9870877, -0.5282665, 2.410698, 1, 0, 0.9607843, 1,
0.9941823, -1.903141, 3.630569, 1, 0, 0.9529412, 1,
0.9964475, 0.6291451, -0.5096207, 1, 0, 0.9490196, 1,
1.004647, 1.458602, 1.781957, 1, 0, 0.9411765, 1,
1.015696, -0.5228837, 2.054279, 1, 0, 0.9372549, 1,
1.016214, -0.5566884, 2.252337, 1, 0, 0.9294118, 1,
1.024916, -0.3899068, 0.02656513, 1, 0, 0.9254902, 1,
1.028623, -0.4378254, 2.634366, 1, 0, 0.9176471, 1,
1.032931, 0.442185, 0.8672739, 1, 0, 0.9137255, 1,
1.033791, -0.8970356, 1.668786, 1, 0, 0.9058824, 1,
1.040147, 1.119392, 1.792076, 1, 0, 0.9019608, 1,
1.046797, -0.2190535, -0.2499145, 1, 0, 0.8941177, 1,
1.049117, 2.530236, 0.2286186, 1, 0, 0.8862745, 1,
1.051638, -0.003993697, 2.815868, 1, 0, 0.8823529, 1,
1.057945, -0.5792756, 2.542814, 1, 0, 0.8745098, 1,
1.06089, -0.00825881, 2.371423, 1, 0, 0.8705882, 1,
1.063742, -0.3819355, 2.107139, 1, 0, 0.8627451, 1,
1.072631, -0.7311854, 1.979318, 1, 0, 0.8588235, 1,
1.080534, -2.115015, 1.727781, 1, 0, 0.8509804, 1,
1.08635, -0.6603435, 2.156659, 1, 0, 0.8470588, 1,
1.089167, -1.839853, 2.923107, 1, 0, 0.8392157, 1,
1.090884, 0.7559749, 2.762902, 1, 0, 0.8352941, 1,
1.099444, 0.8671582, 0.1769488, 1, 0, 0.827451, 1,
1.100716, -1.246521, 2.589262, 1, 0, 0.8235294, 1,
1.102814, 1.779163, 0.2220547, 1, 0, 0.8156863, 1,
1.10428, -0.8000594, 2.382522, 1, 0, 0.8117647, 1,
1.105368, -1.22341, 2.169613, 1, 0, 0.8039216, 1,
1.112737, -0.2695351, 0.3643555, 1, 0, 0.7960784, 1,
1.11338, -1.815656, 3.012801, 1, 0, 0.7921569, 1,
1.119871, -0.266799, 1.310638, 1, 0, 0.7843137, 1,
1.120104, -0.6229494, 2.547338, 1, 0, 0.7803922, 1,
1.136965, 0.4578178, -0.01071002, 1, 0, 0.772549, 1,
1.147742, -0.9657264, 0.9437486, 1, 0, 0.7686275, 1,
1.152719, -2.059444, 3.494988, 1, 0, 0.7607843, 1,
1.165274, 0.04622977, 2.503977, 1, 0, 0.7568628, 1,
1.167363, -0.9307977, 1.731478, 1, 0, 0.7490196, 1,
1.169073, 0.2860704, 1.664685, 1, 0, 0.7450981, 1,
1.172096, 1.399468, 0.4025803, 1, 0, 0.7372549, 1,
1.17257, 0.7909942, 0.897324, 1, 0, 0.7333333, 1,
1.177542, -1.077644, 2.398795, 1, 0, 0.7254902, 1,
1.181088, -0.211484, 0.2984577, 1, 0, 0.7215686, 1,
1.193985, 1.389612, 1.099452, 1, 0, 0.7137255, 1,
1.200828, -1.038947, 1.396505, 1, 0, 0.7098039, 1,
1.206816, -0.2806985, 1.374999, 1, 0, 0.7019608, 1,
1.222178, 0.4111368, -1.791963, 1, 0, 0.6941177, 1,
1.229365, 0.6994798, 0.3823692, 1, 0, 0.6901961, 1,
1.23967, -0.6740994, 0.915278, 1, 0, 0.682353, 1,
1.257679, -1.064252, 1.925174, 1, 0, 0.6784314, 1,
1.25915, 1.921331, -0.6244701, 1, 0, 0.6705883, 1,
1.260269, -0.8423564, 1.132169, 1, 0, 0.6666667, 1,
1.264477, -0.06367861, 2.82761, 1, 0, 0.6588235, 1,
1.264884, 1.174749, 0.6132992, 1, 0, 0.654902, 1,
1.265067, -0.5309952, 2.764386, 1, 0, 0.6470588, 1,
1.281499, 0.06674375, -0.9983981, 1, 0, 0.6431373, 1,
1.286417, -0.445339, 2.474264, 1, 0, 0.6352941, 1,
1.287382, -0.2779168, 1.248695, 1, 0, 0.6313726, 1,
1.301157, 1.754928, 0.5050728, 1, 0, 0.6235294, 1,
1.309211, -0.8801004, 2.185593, 1, 0, 0.6196079, 1,
1.312356, -0.02281549, 0.4181952, 1, 0, 0.6117647, 1,
1.335661, 0.813998, 0.6307434, 1, 0, 0.6078432, 1,
1.348075, 0.1848624, 0.6855857, 1, 0, 0.6, 1,
1.350208, 0.3191688, 0.928835, 1, 0, 0.5921569, 1,
1.366439, -1.30345, 2.459118, 1, 0, 0.5882353, 1,
1.370271, 0.3875472, -0.6375269, 1, 0, 0.5803922, 1,
1.370839, -0.4689702, 2.642034, 1, 0, 0.5764706, 1,
1.375693, -1.182557, 1.828125, 1, 0, 0.5686275, 1,
1.378103, 1.184862, 0.8126745, 1, 0, 0.5647059, 1,
1.40324, -0.5149368, 2.973901, 1, 0, 0.5568628, 1,
1.40442, -0.05229656, 0.6672671, 1, 0, 0.5529412, 1,
1.404439, 0.408433, 2.403621, 1, 0, 0.5450981, 1,
1.408981, -1.118481, 3.079106, 1, 0, 0.5411765, 1,
1.410823, -2.589804, 2.06886, 1, 0, 0.5333334, 1,
1.423332, -0.1064504, -0.1009999, 1, 0, 0.5294118, 1,
1.430468, -0.1633848, 3.235421, 1, 0, 0.5215687, 1,
1.435427, 0.7180634, 1.532439, 1, 0, 0.5176471, 1,
1.439221, -1.602505, 3.172963, 1, 0, 0.509804, 1,
1.446693, -0.6643074, 2.790486, 1, 0, 0.5058824, 1,
1.450019, -0.2823274, 1.736254, 1, 0, 0.4980392, 1,
1.453782, 0.364801, 1.271178, 1, 0, 0.4901961, 1,
1.461445, 0.7636995, -0.7454485, 1, 0, 0.4862745, 1,
1.468695, -0.7795808, 3.136551, 1, 0, 0.4784314, 1,
1.480693, -0.3250942, 0.604354, 1, 0, 0.4745098, 1,
1.507389, 1.035699, 1.094616, 1, 0, 0.4666667, 1,
1.514494, 1.353034, 0.7946393, 1, 0, 0.4627451, 1,
1.517141, -0.5200268, 3.618726, 1, 0, 0.454902, 1,
1.526133, -0.6410198, 2.237101, 1, 0, 0.4509804, 1,
1.526584, -1.33818, 3.912232, 1, 0, 0.4431373, 1,
1.528941, 0.984775, 0.9021106, 1, 0, 0.4392157, 1,
1.53411, 0.9600698, -0.1296078, 1, 0, 0.4313726, 1,
1.535486, 1.288971, 1.69995, 1, 0, 0.427451, 1,
1.537651, 0.6785896, 2.052184, 1, 0, 0.4196078, 1,
1.542628, 0.09736675, 0.8469625, 1, 0, 0.4156863, 1,
1.556857, 1.491378, -0.4878221, 1, 0, 0.4078431, 1,
1.564862, 0.0223392, 2.063968, 1, 0, 0.4039216, 1,
1.579183, -0.952472, 1.010643, 1, 0, 0.3960784, 1,
1.58655, 1.438271, 2.149004, 1, 0, 0.3882353, 1,
1.608663, 1.676859, -0.2111852, 1, 0, 0.3843137, 1,
1.627021, -0.08436994, 3.198639, 1, 0, 0.3764706, 1,
1.641733, 0.7477145, 2.226275, 1, 0, 0.372549, 1,
1.648579, 0.1157652, 2.138804, 1, 0, 0.3647059, 1,
1.649304, 0.02437251, 1.057894, 1, 0, 0.3607843, 1,
1.651876, -0.3549072, 1.84507, 1, 0, 0.3529412, 1,
1.667982, 1.87001, 0.128011, 1, 0, 0.3490196, 1,
1.673135, 0.3015173, 1.223368, 1, 0, 0.3411765, 1,
1.684885, 1.608545, 1.543465, 1, 0, 0.3372549, 1,
1.707753, -0.5000629, 1.203569, 1, 0, 0.3294118, 1,
1.71491, 0.1389036, 2.164772, 1, 0, 0.3254902, 1,
1.715482, -0.5693195, 1.383135, 1, 0, 0.3176471, 1,
1.715621, 2.802086, 0.8689215, 1, 0, 0.3137255, 1,
1.715657, -0.7234713, 0.3699751, 1, 0, 0.3058824, 1,
1.718731, -1.3934, 1.385254, 1, 0, 0.2980392, 1,
1.722347, 0.6970343, -0.3558981, 1, 0, 0.2941177, 1,
1.727032, -1.78928, 1.957469, 1, 0, 0.2862745, 1,
1.730213, -1.891393, 4.052557, 1, 0, 0.282353, 1,
1.736506, 0.279902, 1.587831, 1, 0, 0.2745098, 1,
1.738107, -1.254271, 1.808523, 1, 0, 0.2705882, 1,
1.738558, -0.1051837, 1.540757, 1, 0, 0.2627451, 1,
1.741189, 0.450739, 2.38043, 1, 0, 0.2588235, 1,
1.743441, 1.59827, 1.62312, 1, 0, 0.2509804, 1,
1.780831, 0.8051127, 1.454604, 1, 0, 0.2470588, 1,
1.831137, 0.7164047, 0.6752585, 1, 0, 0.2392157, 1,
1.852533, 0.1817489, 3.582627, 1, 0, 0.2352941, 1,
1.867527, 0.0879937, 1.561347, 1, 0, 0.227451, 1,
1.870493, 0.05645759, 2.083407, 1, 0, 0.2235294, 1,
1.876021, 0.07590492, 2.787329, 1, 0, 0.2156863, 1,
1.887073, -0.4727074, 1.947621, 1, 0, 0.2117647, 1,
1.892835, 2.013136, 1.999673, 1, 0, 0.2039216, 1,
1.910536, 1.254545, 0.427799, 1, 0, 0.1960784, 1,
1.914582, -0.03844201, 0.6613433, 1, 0, 0.1921569, 1,
1.954009, 0.1766434, 3.023566, 1, 0, 0.1843137, 1,
1.961062, 0.7592595, 0.8701426, 1, 0, 0.1803922, 1,
1.998617, 0.31431, 0.4304203, 1, 0, 0.172549, 1,
2.007667, -0.08695165, 1.812283, 1, 0, 0.1686275, 1,
2.032297, 0.2471409, 1.586224, 1, 0, 0.1607843, 1,
2.037659, 0.07390784, 0.2881906, 1, 0, 0.1568628, 1,
2.071751, 1.248637, 2.489051, 1, 0, 0.1490196, 1,
2.072911, 1.26941, 1.633103, 1, 0, 0.145098, 1,
2.1077, 0.7407952, -0.03527684, 1, 0, 0.1372549, 1,
2.129616, -1.578429, 2.908945, 1, 0, 0.1333333, 1,
2.132552, 0.003421962, 3.109416, 1, 0, 0.1254902, 1,
2.157161, -1.256556, 1.754027, 1, 0, 0.1215686, 1,
2.171829, -0.1081098, 2.23548, 1, 0, 0.1137255, 1,
2.24443, -1.338561, 2.012058, 1, 0, 0.1098039, 1,
2.259911, -0.6085675, 1.497651, 1, 0, 0.1019608, 1,
2.284325, -0.07582534, 2.532882, 1, 0, 0.09411765, 1,
2.315058, 2.086196, 1.51165, 1, 0, 0.09019608, 1,
2.355084, 1.158651, 1.089442, 1, 0, 0.08235294, 1,
2.453053, -2.03612, 2.910165, 1, 0, 0.07843138, 1,
2.53561, 0.3890843, 2.591283, 1, 0, 0.07058824, 1,
2.599556, 0.4080372, 1.513503, 1, 0, 0.06666667, 1,
2.729513, -0.407551, 1.004835, 1, 0, 0.05882353, 1,
2.749379, -0.3070472, 2.121426, 1, 0, 0.05490196, 1,
2.767073, 0.7722508, 0.8408852, 1, 0, 0.04705882, 1,
2.81072, 0.01100822, 2.422282, 1, 0, 0.04313726, 1,
2.831241, 0.554269, 0.1310394, 1, 0, 0.03529412, 1,
2.955457, -1.530338, 1.236878, 1, 0, 0.03137255, 1,
2.978145, -1.189731, 2.559154, 1, 0, 0.02352941, 1,
3.138754, 0.3451675, 2.794089, 1, 0, 0.01960784, 1,
3.215764, 0.3988061, 0.7157164, 1, 0, 0.01176471, 1,
3.216141, -0.1055413, 3.221447, 1, 0, 0.007843138, 1
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
-0.1192777, -4.032343, -6.634865, 0, -0.5, 0.5, 0.5,
-0.1192777, -4.032343, -6.634865, 1, -0.5, 0.5, 0.5,
-0.1192777, -4.032343, -6.634865, 1, 1.5, 0.5, 0.5,
-0.1192777, -4.032343, -6.634865, 0, 1.5, 0.5, 0.5
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
-4.585403, 0.6748161, -6.634865, 0, -0.5, 0.5, 0.5,
-4.585403, 0.6748161, -6.634865, 1, -0.5, 0.5, 0.5,
-4.585403, 0.6748161, -6.634865, 1, 1.5, 0.5, 0.5,
-4.585403, 0.6748161, -6.634865, 0, 1.5, 0.5, 0.5
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
-4.585403, -4.032343, -0.2150199, 0, -0.5, 0.5, 0.5,
-4.585403, -4.032343, -0.2150199, 1, -0.5, 0.5, 0.5,
-4.585403, -4.032343, -0.2150199, 1, 1.5, 0.5, 0.5,
-4.585403, -4.032343, -0.2150199, 0, 1.5, 0.5, 0.5
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
-3, -2.946076, -5.153362,
3, -2.946076, -5.153362,
-3, -2.946076, -5.153362,
-3, -3.12712, -5.40028,
-2, -2.946076, -5.153362,
-2, -3.12712, -5.40028,
-1, -2.946076, -5.153362,
-1, -3.12712, -5.40028,
0, -2.946076, -5.153362,
0, -3.12712, -5.40028,
1, -2.946076, -5.153362,
1, -3.12712, -5.40028,
2, -2.946076, -5.153362,
2, -3.12712, -5.40028,
3, -2.946076, -5.153362,
3, -3.12712, -5.40028
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
-3, -3.48921, -5.894114, 0, -0.5, 0.5, 0.5,
-3, -3.48921, -5.894114, 1, -0.5, 0.5, 0.5,
-3, -3.48921, -5.894114, 1, 1.5, 0.5, 0.5,
-3, -3.48921, -5.894114, 0, 1.5, 0.5, 0.5,
-2, -3.48921, -5.894114, 0, -0.5, 0.5, 0.5,
-2, -3.48921, -5.894114, 1, -0.5, 0.5, 0.5,
-2, -3.48921, -5.894114, 1, 1.5, 0.5, 0.5,
-2, -3.48921, -5.894114, 0, 1.5, 0.5, 0.5,
-1, -3.48921, -5.894114, 0, -0.5, 0.5, 0.5,
-1, -3.48921, -5.894114, 1, -0.5, 0.5, 0.5,
-1, -3.48921, -5.894114, 1, 1.5, 0.5, 0.5,
-1, -3.48921, -5.894114, 0, 1.5, 0.5, 0.5,
0, -3.48921, -5.894114, 0, -0.5, 0.5, 0.5,
0, -3.48921, -5.894114, 1, -0.5, 0.5, 0.5,
0, -3.48921, -5.894114, 1, 1.5, 0.5, 0.5,
0, -3.48921, -5.894114, 0, 1.5, 0.5, 0.5,
1, -3.48921, -5.894114, 0, -0.5, 0.5, 0.5,
1, -3.48921, -5.894114, 1, -0.5, 0.5, 0.5,
1, -3.48921, -5.894114, 1, 1.5, 0.5, 0.5,
1, -3.48921, -5.894114, 0, 1.5, 0.5, 0.5,
2, -3.48921, -5.894114, 0, -0.5, 0.5, 0.5,
2, -3.48921, -5.894114, 1, -0.5, 0.5, 0.5,
2, -3.48921, -5.894114, 1, 1.5, 0.5, 0.5,
2, -3.48921, -5.894114, 0, 1.5, 0.5, 0.5,
3, -3.48921, -5.894114, 0, -0.5, 0.5, 0.5,
3, -3.48921, -5.894114, 1, -0.5, 0.5, 0.5,
3, -3.48921, -5.894114, 1, 1.5, 0.5, 0.5,
3, -3.48921, -5.894114, 0, 1.5, 0.5, 0.5
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
-3.554759, -2, -5.153362,
-3.554759, 4, -5.153362,
-3.554759, -2, -5.153362,
-3.726533, -2, -5.40028,
-3.554759, 0, -5.153362,
-3.726533, 0, -5.40028,
-3.554759, 2, -5.153362,
-3.726533, 2, -5.40028,
-3.554759, 4, -5.153362,
-3.726533, 4, -5.40028
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
"2",
"4"
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
-4.070081, -2, -5.894114, 0, -0.5, 0.5, 0.5,
-4.070081, -2, -5.894114, 1, -0.5, 0.5, 0.5,
-4.070081, -2, -5.894114, 1, 1.5, 0.5, 0.5,
-4.070081, -2, -5.894114, 0, 1.5, 0.5, 0.5,
-4.070081, 0, -5.894114, 0, -0.5, 0.5, 0.5,
-4.070081, 0, -5.894114, 1, -0.5, 0.5, 0.5,
-4.070081, 0, -5.894114, 1, 1.5, 0.5, 0.5,
-4.070081, 0, -5.894114, 0, 1.5, 0.5, 0.5,
-4.070081, 2, -5.894114, 0, -0.5, 0.5, 0.5,
-4.070081, 2, -5.894114, 1, -0.5, 0.5, 0.5,
-4.070081, 2, -5.894114, 1, 1.5, 0.5, 0.5,
-4.070081, 2, -5.894114, 0, 1.5, 0.5, 0.5,
-4.070081, 4, -5.894114, 0, -0.5, 0.5, 0.5,
-4.070081, 4, -5.894114, 1, -0.5, 0.5, 0.5,
-4.070081, 4, -5.894114, 1, 1.5, 0.5, 0.5,
-4.070081, 4, -5.894114, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-3.554759, -2.946076, -4,
-3.554759, -2.946076, 4,
-3.554759, -2.946076, -4,
-3.726533, -3.12712, -4,
-3.554759, -2.946076, -2,
-3.726533, -3.12712, -2,
-3.554759, -2.946076, 0,
-3.726533, -3.12712, 0,
-3.554759, -2.946076, 2,
-3.726533, -3.12712, 2,
-3.554759, -2.946076, 4,
-3.726533, -3.12712, 4
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
-4.070081, -3.48921, -4, 0, -0.5, 0.5, 0.5,
-4.070081, -3.48921, -4, 1, -0.5, 0.5, 0.5,
-4.070081, -3.48921, -4, 1, 1.5, 0.5, 0.5,
-4.070081, -3.48921, -4, 0, 1.5, 0.5, 0.5,
-4.070081, -3.48921, -2, 0, -0.5, 0.5, 0.5,
-4.070081, -3.48921, -2, 1, -0.5, 0.5, 0.5,
-4.070081, -3.48921, -2, 1, 1.5, 0.5, 0.5,
-4.070081, -3.48921, -2, 0, 1.5, 0.5, 0.5,
-4.070081, -3.48921, 0, 0, -0.5, 0.5, 0.5,
-4.070081, -3.48921, 0, 1, -0.5, 0.5, 0.5,
-4.070081, -3.48921, 0, 1, 1.5, 0.5, 0.5,
-4.070081, -3.48921, 0, 0, 1.5, 0.5, 0.5,
-4.070081, -3.48921, 2, 0, -0.5, 0.5, 0.5,
-4.070081, -3.48921, 2, 1, -0.5, 0.5, 0.5,
-4.070081, -3.48921, 2, 1, 1.5, 0.5, 0.5,
-4.070081, -3.48921, 2, 0, 1.5, 0.5, 0.5,
-4.070081, -3.48921, 4, 0, -0.5, 0.5, 0.5,
-4.070081, -3.48921, 4, 1, -0.5, 0.5, 0.5,
-4.070081, -3.48921, 4, 1, 1.5, 0.5, 0.5,
-4.070081, -3.48921, 4, 0, 1.5, 0.5, 0.5
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
-3.554759, -2.946076, -5.153362,
-3.554759, 4.295708, -5.153362,
-3.554759, -2.946076, 4.723322,
-3.554759, 4.295708, 4.723322,
-3.554759, -2.946076, -5.153362,
-3.554759, -2.946076, 4.723322,
-3.554759, 4.295708, -5.153362,
-3.554759, 4.295708, 4.723322,
-3.554759, -2.946076, -5.153362,
3.316203, -2.946076, -5.153362,
-3.554759, -2.946076, 4.723322,
3.316203, -2.946076, 4.723322,
-3.554759, 4.295708, -5.153362,
3.316203, 4.295708, -5.153362,
-3.554759, 4.295708, 4.723322,
3.316203, 4.295708, 4.723322,
3.316203, -2.946076, -5.153362,
3.316203, 4.295708, -5.153362,
3.316203, -2.946076, 4.723322,
3.316203, 4.295708, 4.723322,
3.316203, -2.946076, -5.153362,
3.316203, -2.946076, 4.723322,
3.316203, 4.295708, -5.153362,
3.316203, 4.295708, 4.723322
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
var radius = 7.498625;
var distance = 33.36223;
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
mvMatrix.translate( 0.1192777, -0.6748161, 0.2150199 );
mvMatrix.scale( 1.179989, 1.119567, 0.8208888 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.36223);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
blasticidin-S<-read.table("blasticidin-S.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-blasticidin-S$V2
```

```
## Error in eval(expr, envir, enclos): object 'blasticidin' not found
```

```r
y<-blasticidin-S$V3
```

```
## Error in eval(expr, envir, enclos): object 'blasticidin' not found
```

```r
z<-blasticidin-S$V4
```

```
## Error in eval(expr, envir, enclos): object 'blasticidin' not found
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
-3.454696, 1.113697, -0.5583053, 0, 0, 1, 1, 1,
-3.246032, -0.6598253, -0.1468249, 1, 0, 0, 1, 1,
-3.197082, 1.515689, 0.2724244, 1, 0, 0, 1, 1,
-3.062762, 0.2446973, -0.7708849, 1, 0, 0, 1, 1,
-2.702724, -0.07883491, -1.051725, 1, 0, 0, 1, 1,
-2.651259, -0.5893698, -1.316632, 1, 0, 0, 1, 1,
-2.578141, 2.853476, 0.264236, 0, 0, 0, 1, 1,
-2.524047, 0.4887182, -2.260367, 0, 0, 0, 1, 1,
-2.400307, 0.267112, -1.127174, 0, 0, 0, 1, 1,
-2.397678, -0.5842326, -0.8988174, 0, 0, 0, 1, 1,
-2.351525, 0.817433, -0.5255367, 0, 0, 0, 1, 1,
-2.327733, 0.1416032, 1.188736, 0, 0, 0, 1, 1,
-2.326922, -0.5333218, -1.891338, 0, 0, 0, 1, 1,
-2.316285, 0.9088262, -1.553687, 1, 1, 1, 1, 1,
-2.313824, 0.7864033, -1.15777, 1, 1, 1, 1, 1,
-2.27482, 0.1000832, -1.579825, 1, 1, 1, 1, 1,
-2.266808, 1.264364, -0.458728, 1, 1, 1, 1, 1,
-2.221549, 0.277051, -0.7124478, 1, 1, 1, 1, 1,
-2.187906, 1.147893, -1.298777, 1, 1, 1, 1, 1,
-2.153263, -0.8754341, -5.009527, 1, 1, 1, 1, 1,
-2.15011, 0.8613098, -0.3117905, 1, 1, 1, 1, 1,
-2.135964, 0.07236002, -1.546526, 1, 1, 1, 1, 1,
-2.125282, 0.9776919, -1.397467, 1, 1, 1, 1, 1,
-2.037198, -1.250443, -1.264881, 1, 1, 1, 1, 1,
-2.005974, -0.2407847, -1.458437, 1, 1, 1, 1, 1,
-2.004893, 0.03835957, -2.083895, 1, 1, 1, 1, 1,
-1.986298, 0.4246103, -3.988039, 1, 1, 1, 1, 1,
-1.984928, -0.1869874, -1.482893, 1, 1, 1, 1, 1,
-1.976924, 0.5536009, -0.929571, 0, 0, 1, 1, 1,
-1.924519, -0.330825, -1.502138, 1, 0, 0, 1, 1,
-1.920928, -1.016096, -0.198073, 1, 0, 0, 1, 1,
-1.899474, 0.3433298, -1.842875, 1, 0, 0, 1, 1,
-1.888695, -0.4373017, -2.295879, 1, 0, 0, 1, 1,
-1.887263, 0.6914279, -0.5681814, 1, 0, 0, 1, 1,
-1.886726, -1.023741, -2.005156, 0, 0, 0, 1, 1,
-1.859254, 0.5586125, -1.475799, 0, 0, 0, 1, 1,
-1.841642, 0.3340266, -0.8692079, 0, 0, 0, 1, 1,
-1.811076, 0.7984618, 0.9495068, 0, 0, 0, 1, 1,
-1.80432, -0.261952, -1.711594, 0, 0, 0, 1, 1,
-1.804044, 0.8159369, -0.3796919, 0, 0, 0, 1, 1,
-1.7881, -1.017414, -1.455909, 0, 0, 0, 1, 1,
-1.780477, -0.7769848, -0.2272172, 1, 1, 1, 1, 1,
-1.777281, 1.871198, 0.04489712, 1, 1, 1, 1, 1,
-1.765234, 0.1274631, -0.5632062, 1, 1, 1, 1, 1,
-1.763517, -1.219429, -2.378089, 1, 1, 1, 1, 1,
-1.759123, -0.07411126, -1.347058, 1, 1, 1, 1, 1,
-1.75846, 0.3082243, -0.6442842, 1, 1, 1, 1, 1,
-1.75654, -0.04289337, -1.982316, 1, 1, 1, 1, 1,
-1.731493, -1.952061, -3.292429, 1, 1, 1, 1, 1,
-1.722259, -0.3503613, -3.898573, 1, 1, 1, 1, 1,
-1.708033, 0.4869637, -2.26693, 1, 1, 1, 1, 1,
-1.704934, 0.1761253, -1.076086, 1, 1, 1, 1, 1,
-1.682798, 0.8859884, -0.3574325, 1, 1, 1, 1, 1,
-1.67048, 4.190245, 0.7182674, 1, 1, 1, 1, 1,
-1.665834, 0.3533012, -1.383986, 1, 1, 1, 1, 1,
-1.663149, -1.001162, -2.676691, 1, 1, 1, 1, 1,
-1.652123, 1.387872, -1.265436, 0, 0, 1, 1, 1,
-1.652108, 0.08655686, -0.7176927, 1, 0, 0, 1, 1,
-1.63405, 0.989237, -1.493398, 1, 0, 0, 1, 1,
-1.632165, -2.212363, -2.706943, 1, 0, 0, 1, 1,
-1.630725, -1.614582, -1.534079, 1, 0, 0, 1, 1,
-1.610978, 0.3719471, -0.9788542, 1, 0, 0, 1, 1,
-1.603102, -1.892388, -3.303987, 0, 0, 0, 1, 1,
-1.591383, 0.7142813, -0.3962798, 0, 0, 0, 1, 1,
-1.586798, -0.4989825, -1.629295, 0, 0, 0, 1, 1,
-1.570181, 0.6813907, 0.3257816, 0, 0, 0, 1, 1,
-1.549631, -1.422432, -1.604094, 0, 0, 0, 1, 1,
-1.54328, 0.2156514, -2.228985, 0, 0, 0, 1, 1,
-1.540383, 0.4429976, -1.304802, 0, 0, 0, 1, 1,
-1.535635, -1.646638, -1.035964, 1, 1, 1, 1, 1,
-1.524643, 0.9167687, -0.6079218, 1, 1, 1, 1, 1,
-1.513842, -1.963926, -3.909158, 1, 1, 1, 1, 1,
-1.465422, -1.508276, -3.611589, 1, 1, 1, 1, 1,
-1.463839, 0.9378073, -3.230611, 1, 1, 1, 1, 1,
-1.44488, -2.270305, -1.430265, 1, 1, 1, 1, 1,
-1.443834, -0.6479082, -1.642106, 1, 1, 1, 1, 1,
-1.441094, 1.161326, -2.246629, 1, 1, 1, 1, 1,
-1.441041, -0.8226292, -1.904196, 1, 1, 1, 1, 1,
-1.411994, -0.6816126, -3.776778, 1, 1, 1, 1, 1,
-1.407241, -0.6423582, -2.020817, 1, 1, 1, 1, 1,
-1.407041, -0.3335847, -1.235358, 1, 1, 1, 1, 1,
-1.398843, 0.2254397, -2.057756, 1, 1, 1, 1, 1,
-1.391101, -0.5665802, -2.521023, 1, 1, 1, 1, 1,
-1.389457, -0.631581, -1.785349, 1, 1, 1, 1, 1,
-1.387812, 0.9540409, -1.643979, 0, 0, 1, 1, 1,
-1.383565, -1.646964, -2.295312, 1, 0, 0, 1, 1,
-1.379032, -0.1619674, -1.971225, 1, 0, 0, 1, 1,
-1.37901, 0.6840809, -0.07105214, 1, 0, 0, 1, 1,
-1.374967, -2.037045, -1.659517, 1, 0, 0, 1, 1,
-1.368616, 0.696818, -1.046656, 1, 0, 0, 1, 1,
-1.350758, -0.4778083, -1.475145, 0, 0, 0, 1, 1,
-1.337488, 0.2527202, -1.879761, 0, 0, 0, 1, 1,
-1.333179, -0.4476252, -3.466199, 0, 0, 0, 1, 1,
-1.330428, -1.390091, -2.071728, 0, 0, 0, 1, 1,
-1.325981, -1.616843, -1.003272, 0, 0, 0, 1, 1,
-1.308125, -0.4940461, -4.274325, 0, 0, 0, 1, 1,
-1.300413, -0.501298, -3.074107, 0, 0, 0, 1, 1,
-1.285698, 0.03224551, -3.500395, 1, 1, 1, 1, 1,
-1.28445, -0.3719617, -3.772309, 1, 1, 1, 1, 1,
-1.27038, 0.4855382, -1.675506, 1, 1, 1, 1, 1,
-1.246304, -1.042277, -2.786259, 1, 1, 1, 1, 1,
-1.244186, -0.2926065, -1.545122, 1, 1, 1, 1, 1,
-1.243705, -0.4023137, -2.937269, 1, 1, 1, 1, 1,
-1.226066, 0.1090107, -0.806985, 1, 1, 1, 1, 1,
-1.222589, 0.6805689, -2.227616, 1, 1, 1, 1, 1,
-1.201841, -0.2430496, 0.2463327, 1, 1, 1, 1, 1,
-1.199153, -0.09175403, -1.494557, 1, 1, 1, 1, 1,
-1.199136, -0.3159829, -1.386278, 1, 1, 1, 1, 1,
-1.198501, -1.13562, -1.218246, 1, 1, 1, 1, 1,
-1.196022, 0.3365405, -1.100191, 1, 1, 1, 1, 1,
-1.193538, -0.3886107, -1.703334, 1, 1, 1, 1, 1,
-1.184302, -0.09895685, -1.409223, 1, 1, 1, 1, 1,
-1.178239, 1.010169, -0.9465119, 0, 0, 1, 1, 1,
-1.169575, -0.3830573, -3.546403, 1, 0, 0, 1, 1,
-1.168162, 0.05816084, -0.4061373, 1, 0, 0, 1, 1,
-1.164306, 0.1112445, 0.1635939, 1, 0, 0, 1, 1,
-1.163808, 0.499743, -0.352604, 1, 0, 0, 1, 1,
-1.159776, -0.4744823, 0.5095995, 1, 0, 0, 1, 1,
-1.157397, -0.5556792, -2.96181, 0, 0, 0, 1, 1,
-1.148671, -1.514468, -3.308854, 0, 0, 0, 1, 1,
-1.146548, 0.06625877, -2.703809, 0, 0, 0, 1, 1,
-1.141771, 1.856922, -1.412325, 0, 0, 0, 1, 1,
-1.135562, -0.9451663, -2.366336, 0, 0, 0, 1, 1,
-1.130333, -0.1348403, 0.590262, 0, 0, 0, 1, 1,
-1.116933, -0.6546319, -1.694491, 0, 0, 0, 1, 1,
-1.116118, 2.009851, -0.726121, 1, 1, 1, 1, 1,
-1.096697, -0.04447888, -1.526751, 1, 1, 1, 1, 1,
-1.096069, -0.3817902, -0.04717882, 1, 1, 1, 1, 1,
-1.093844, 0.2336437, -0.3818005, 1, 1, 1, 1, 1,
-1.09365, 0.2513989, -0.7304811, 1, 1, 1, 1, 1,
-1.091571, -0.893607, 0.2245971, 1, 1, 1, 1, 1,
-1.086652, -0.411893, -3.198475, 1, 1, 1, 1, 1,
-1.067485, -1.269286, -1.807161, 1, 1, 1, 1, 1,
-1.061114, -0.6477848, -0.8167962, 1, 1, 1, 1, 1,
-1.056406, 1.475043, 0.041371, 1, 1, 1, 1, 1,
-1.048751, 0.283445, -0.2508796, 1, 1, 1, 1, 1,
-1.042562, -0.4913167, -1.342663, 1, 1, 1, 1, 1,
-1.029715, 0.4789633, -1.545874, 1, 1, 1, 1, 1,
-1.024899, -0.09996049, -2.307887, 1, 1, 1, 1, 1,
-1.021734, 0.1560873, -1.707851, 1, 1, 1, 1, 1,
-1.015221, -0.3129691, -0.2270355, 0, 0, 1, 1, 1,
-1.013513, -1.266098, -1.287304, 1, 0, 0, 1, 1,
-1.003312, -1.333052, -1.557237, 1, 0, 0, 1, 1,
-1.001622, -0.4831199, -1.318138, 1, 0, 0, 1, 1,
-0.9987704, -0.3351193, -1.810283, 1, 0, 0, 1, 1,
-0.9939459, 0.3762755, -3.486892, 1, 0, 0, 1, 1,
-0.9908695, -1.305335, -2.17336, 0, 0, 0, 1, 1,
-0.9869176, 1.196552, 0.6528993, 0, 0, 0, 1, 1,
-0.9816372, -0.5941449, -2.52773, 0, 0, 0, 1, 1,
-0.9815887, -0.9959381, -2.877012, 0, 0, 0, 1, 1,
-0.9780306, -0.4878969, -4.168682, 0, 0, 0, 1, 1,
-0.9696949, -0.155757, -1.826776, 0, 0, 0, 1, 1,
-0.9672685, -0.008876846, 0.1221385, 0, 0, 0, 1, 1,
-0.9613244, -1.652399, -3.547562, 1, 1, 1, 1, 1,
-0.9578354, -1.022381, -2.158672, 1, 1, 1, 1, 1,
-0.954092, 0.08028294, -0.6218361, 1, 1, 1, 1, 1,
-0.9540053, -0.1338322, -1.713353, 1, 1, 1, 1, 1,
-0.9504584, -1.153531, -4.101161, 1, 1, 1, 1, 1,
-0.9500892, -0.9492246, -0.6647564, 1, 1, 1, 1, 1,
-0.9361625, 0.1076386, -0.7871556, 1, 1, 1, 1, 1,
-0.9349653, 0.9774231, 0.2171042, 1, 1, 1, 1, 1,
-0.9311131, -0.834629, -2.906158, 1, 1, 1, 1, 1,
-0.9299636, -0.1821914, -1.89792, 1, 1, 1, 1, 1,
-0.915833, -0.05858273, -0.6331853, 1, 1, 1, 1, 1,
-0.9143696, -0.728157, -3.299749, 1, 1, 1, 1, 1,
-0.9090151, -0.6230707, -1.032181, 1, 1, 1, 1, 1,
-0.9089817, 1.065243, -2.011572, 1, 1, 1, 1, 1,
-0.9089648, 1.681164, -0.8137165, 1, 1, 1, 1, 1,
-0.9070381, 0.06908392, -1.997671, 0, 0, 1, 1, 1,
-0.9066954, 1.164826, 1.04591, 1, 0, 0, 1, 1,
-0.9040193, 0.116424, -1.81836, 1, 0, 0, 1, 1,
-0.9031711, -0.2737236, -1.553775, 1, 0, 0, 1, 1,
-0.897561, 1.136257, -0.8132581, 1, 0, 0, 1, 1,
-0.8807232, 2.71272, 0.2457877, 1, 0, 0, 1, 1,
-0.8784043, 0.3683138, -1.152858, 0, 0, 0, 1, 1,
-0.875407, -1.265339, -1.763909, 0, 0, 0, 1, 1,
-0.8746133, -1.303325, -2.402117, 0, 0, 0, 1, 1,
-0.8745202, -0.5516047, -1.140635, 0, 0, 0, 1, 1,
-0.8730099, 0.101552, -2.612405, 0, 0, 0, 1, 1,
-0.8714564, -0.08112665, -2.313851, 0, 0, 0, 1, 1,
-0.8698455, 0.325271, -1.728886, 0, 0, 0, 1, 1,
-0.8693931, -0.3619849, -1.858553, 1, 1, 1, 1, 1,
-0.8690145, -0.0852862, -0.3444649, 1, 1, 1, 1, 1,
-0.8666354, 0.02437142, -0.2002311, 1, 1, 1, 1, 1,
-0.8633218, 0.3150198, -2.697756, 1, 1, 1, 1, 1,
-0.8633178, -0.5335665, -1.1564, 1, 1, 1, 1, 1,
-0.8569343, -0.2560258, -2.944809, 1, 1, 1, 1, 1,
-0.8523973, 1.785564, 0.07795973, 1, 1, 1, 1, 1,
-0.8449425, 1.442746, -0.6547084, 1, 1, 1, 1, 1,
-0.8414469, 0.2567572, -2.03068, 1, 1, 1, 1, 1,
-0.8398387, 0.3062245, -1.266569, 1, 1, 1, 1, 1,
-0.8385583, 0.1953296, -0.4265187, 1, 1, 1, 1, 1,
-0.837308, -0.2096611, -1.427288, 1, 1, 1, 1, 1,
-0.8294445, 0.5513681, -1.110389, 1, 1, 1, 1, 1,
-0.8223389, 0.482383, -0.6910466, 1, 1, 1, 1, 1,
-0.8221231, 1.26692, -0.09301968, 1, 1, 1, 1, 1,
-0.816321, 1.116452, -2.019793, 0, 0, 1, 1, 1,
-0.8109635, -0.48415, -0.6484846, 1, 0, 0, 1, 1,
-0.8103065, -0.5554333, -2.57494, 1, 0, 0, 1, 1,
-0.8088834, 0.8852462, -0.7906842, 1, 0, 0, 1, 1,
-0.8085995, 0.6928051, -0.6933877, 1, 0, 0, 1, 1,
-0.8080838, -0.6239796, -1.789613, 1, 0, 0, 1, 1,
-0.8075932, -1.893457, -1.477553, 0, 0, 0, 1, 1,
-0.8059508, -0.8305618, -1.855963, 0, 0, 0, 1, 1,
-0.8011026, -0.5260143, -1.710472, 0, 0, 0, 1, 1,
-0.7999423, 1.787421, -1.262792, 0, 0, 0, 1, 1,
-0.7975654, 1.839401, 0.866398, 0, 0, 0, 1, 1,
-0.7912328, 0.9044712, -1.716926, 0, 0, 0, 1, 1,
-0.7898545, 1.070278, -0.3651529, 0, 0, 0, 1, 1,
-0.7858129, 1.753273, -1.348738, 1, 1, 1, 1, 1,
-0.7851123, -1.504842, -2.872129, 1, 1, 1, 1, 1,
-0.7834859, -0.9737071, -3.787204, 1, 1, 1, 1, 1,
-0.78312, 1.771624, -0.2386458, 1, 1, 1, 1, 1,
-0.7808481, -1.325224, -1.966105, 1, 1, 1, 1, 1,
-0.7792394, 1.026648, -1.176399, 1, 1, 1, 1, 1,
-0.7768474, 0.8016862, -0.3694476, 1, 1, 1, 1, 1,
-0.7658812, -0.8305923, -2.244059, 1, 1, 1, 1, 1,
-0.765734, -1.052503, -1.475019, 1, 1, 1, 1, 1,
-0.7640467, 0.06589906, -2.727746, 1, 1, 1, 1, 1,
-0.7635754, 0.9583784, -0.7440432, 1, 1, 1, 1, 1,
-0.7542093, -0.5321352, -0.03656843, 1, 1, 1, 1, 1,
-0.7457047, 0.3688871, -1.233628, 1, 1, 1, 1, 1,
-0.7394816, -0.5125402, -2.588729, 1, 1, 1, 1, 1,
-0.7393873, 0.3519428, -0.4692261, 1, 1, 1, 1, 1,
-0.7391305, 0.2119661, -1.829045, 0, 0, 1, 1, 1,
-0.7354861, 1.486908, -1.38444, 1, 0, 0, 1, 1,
-0.7297921, 0.4205586, -1.801844, 1, 0, 0, 1, 1,
-0.729259, -1.801052, -3.797049, 1, 0, 0, 1, 1,
-0.7287608, 2.073122, -0.08504185, 1, 0, 0, 1, 1,
-0.7283671, 0.236475, -1.144568, 1, 0, 0, 1, 1,
-0.7246989, -1.546339, -3.532343, 0, 0, 0, 1, 1,
-0.72448, 3.357799, 0.3723678, 0, 0, 0, 1, 1,
-0.72158, 1.404644, -0.1128011, 0, 0, 0, 1, 1,
-0.7178624, -1.888201, -3.288113, 0, 0, 0, 1, 1,
-0.7162979, 1.454627, 0.352063, 0, 0, 0, 1, 1,
-0.7160325, 0.6923259, -0.528987, 0, 0, 0, 1, 1,
-0.7156943, 0.160422, -2.518364, 0, 0, 0, 1, 1,
-0.7064839, -0.7608212, -0.9232526, 1, 1, 1, 1, 1,
-0.6959921, 0.02748638, -0.8470455, 1, 1, 1, 1, 1,
-0.693856, -0.2262181, -1.523639, 1, 1, 1, 1, 1,
-0.690521, 0.1639956, -0.8887596, 1, 1, 1, 1, 1,
-0.6871744, 0.1220317, -1.319723, 1, 1, 1, 1, 1,
-0.6851238, 0.04393553, -2.342945, 1, 1, 1, 1, 1,
-0.6824355, 0.4676626, -2.990146, 1, 1, 1, 1, 1,
-0.6785534, -0.832532, -3.872228, 1, 1, 1, 1, 1,
-0.6767214, 1.014774, -1.777121, 1, 1, 1, 1, 1,
-0.6701267, 1.36453, -0.790427, 1, 1, 1, 1, 1,
-0.6668338, 1.11896, -0.2719891, 1, 1, 1, 1, 1,
-0.6645448, 0.5099384, 0.8030496, 1, 1, 1, 1, 1,
-0.6600043, -0.3394088, -2.865581, 1, 1, 1, 1, 1,
-0.658517, -0.5357333, -2.682631, 1, 1, 1, 1, 1,
-0.6514962, 0.5917937, -2.111367, 1, 1, 1, 1, 1,
-0.63938, -0.9875956, -3.035399, 0, 0, 1, 1, 1,
-0.6380487, 0.6072434, -1.631776, 1, 0, 0, 1, 1,
-0.6377838, 0.7482862, -1.149228, 1, 0, 0, 1, 1,
-0.6344975, -0.1567527, -1.867187, 1, 0, 0, 1, 1,
-0.625993, -0.3576034, -2.237438, 1, 0, 0, 1, 1,
-0.623115, -0.313472, -2.610647, 1, 0, 0, 1, 1,
-0.6205328, -2.647147, -2.963852, 0, 0, 0, 1, 1,
-0.6192864, -0.5104013, -2.203083, 0, 0, 0, 1, 1,
-0.6179631, -0.2090439, -1.416621, 0, 0, 0, 1, 1,
-0.6156044, -0.3132198, -2.071912, 0, 0, 0, 1, 1,
-0.6138529, 0.8053492, -3.032553, 0, 0, 0, 1, 1,
-0.6132573, 1.294082, -1.501982, 0, 0, 0, 1, 1,
-0.610099, 0.4846255, -1.796539, 0, 0, 0, 1, 1,
-0.6029544, -0.8240072, -4.027339, 1, 1, 1, 1, 1,
-0.6022654, -0.8367726, -1.460808, 1, 1, 1, 1, 1,
-0.6013602, -0.4583799, -0.4328591, 1, 1, 1, 1, 1,
-0.5985613, 0.1676539, -1.040129, 1, 1, 1, 1, 1,
-0.5955185, 0.2301334, -1.263059, 1, 1, 1, 1, 1,
-0.5940535, -0.2056014, -0.06795407, 1, 1, 1, 1, 1,
-0.5871447, 0.7883769, -3.101334, 1, 1, 1, 1, 1,
-0.5866338, -0.1441927, -1.448521, 1, 1, 1, 1, 1,
-0.5860689, -0.4203932, -3.59406, 1, 1, 1, 1, 1,
-0.5836648, -1.30738, -3.206676, 1, 1, 1, 1, 1,
-0.5773406, 0.001602161, -2.536188, 1, 1, 1, 1, 1,
-0.5742449, -0.2331035, -1.107767, 1, 1, 1, 1, 1,
-0.5722042, 1.148381, -2.247515, 1, 1, 1, 1, 1,
-0.564968, 0.03948915, -3.418273, 1, 1, 1, 1, 1,
-0.5620741, -0.02750479, -1.473811, 1, 1, 1, 1, 1,
-0.559527, -0.9987874, -1.229568, 0, 0, 1, 1, 1,
-0.5572067, -0.733564, -2.201522, 1, 0, 0, 1, 1,
-0.5509128, 0.2896101, -0.2851461, 1, 0, 0, 1, 1,
-0.5504082, -0.7410127, -1.655463, 1, 0, 0, 1, 1,
-0.5498626, -2.12151, -2.365964, 1, 0, 0, 1, 1,
-0.5492258, 0.5809575, -0.5966826, 1, 0, 0, 1, 1,
-0.5461891, 0.436776, -0.7386432, 0, 0, 0, 1, 1,
-0.5439007, -0.6782138, -2.483883, 0, 0, 0, 1, 1,
-0.5365983, 1.170214, 0.3873968, 0, 0, 0, 1, 1,
-0.5360056, -1.070899, -1.632965, 0, 0, 0, 1, 1,
-0.5324697, -0.1840724, -2.082851, 0, 0, 0, 1, 1,
-0.5265871, 0.2608444, -1.32863, 0, 0, 0, 1, 1,
-0.5252324, -0.6721361, -2.787349, 0, 0, 0, 1, 1,
-0.5236941, -0.3624353, -1.787206, 1, 1, 1, 1, 1,
-0.5191222, 1.426236, -2.163462, 1, 1, 1, 1, 1,
-0.514091, 0.7676884, -1.687262, 1, 1, 1, 1, 1,
-0.5126643, -0.2012573, -1.55186, 1, 1, 1, 1, 1,
-0.5056211, -0.3564612, -1.881004, 1, 1, 1, 1, 1,
-0.5046132, 0.08757081, -2.776482, 1, 1, 1, 1, 1,
-0.5028648, -1.120221, -3.378804, 1, 1, 1, 1, 1,
-0.5021557, -2.398733, -2.352917, 1, 1, 1, 1, 1,
-0.5001535, 0.8744937, 0.3629385, 1, 1, 1, 1, 1,
-0.4867525, 0.3027676, 0.1555884, 1, 1, 1, 1, 1,
-0.4821537, 0.1323462, 0.2539424, 1, 1, 1, 1, 1,
-0.4780427, 1.37491, 0.105408, 1, 1, 1, 1, 1,
-0.4764745, -0.1204587, -2.021451, 1, 1, 1, 1, 1,
-0.4745735, -0.9245024, -2.2286, 1, 1, 1, 1, 1,
-0.4738114, -0.5632096, -1.69575, 1, 1, 1, 1, 1,
-0.4700112, -0.09471085, -2.036141, 0, 0, 1, 1, 1,
-0.4692773, 0.0782401, -0.05958142, 1, 0, 0, 1, 1,
-0.4680811, -1.49612, -1.065682, 1, 0, 0, 1, 1,
-0.4677248, 2.088486, -0.9852316, 1, 0, 0, 1, 1,
-0.4677071, -0.8468465, -2.171231, 1, 0, 0, 1, 1,
-0.4654157, -0.3175527, -4.849432, 1, 0, 0, 1, 1,
-0.4637346, 1.142706, -0.6705832, 0, 0, 0, 1, 1,
-0.4605461, -0.02058902, 0.1915542, 0, 0, 0, 1, 1,
-0.459771, -0.471254, -2.978219, 0, 0, 0, 1, 1,
-0.4584309, -0.7171347, -0.2037439, 0, 0, 0, 1, 1,
-0.4490457, 0.189224, -0.568023, 0, 0, 0, 1, 1,
-0.4472876, 1.158521, -1.876746, 0, 0, 0, 1, 1,
-0.4462685, -0.6010195, -4.239592, 0, 0, 0, 1, 1,
-0.4457089, -1.980853, -4.916523, 1, 1, 1, 1, 1,
-0.4374271, -0.6074114, -2.583542, 1, 1, 1, 1, 1,
-0.4324834, -0.2777355, -2.706071, 1, 1, 1, 1, 1,
-0.4290677, -1.205783, -2.101187, 1, 1, 1, 1, 1,
-0.4152269, -0.002831419, -2.441063, 1, 1, 1, 1, 1,
-0.4134366, -0.3737, -1.748378, 1, 1, 1, 1, 1,
-0.4111041, 2.145042, 1.042239, 1, 1, 1, 1, 1,
-0.4100737, 0.6955228, -3.970699, 1, 1, 1, 1, 1,
-0.4087279, -0.6956683, -1.682438, 1, 1, 1, 1, 1,
-0.4047806, -0.002197844, -2.966773, 1, 1, 1, 1, 1,
-0.4046064, 0.3671978, -1.238842, 1, 1, 1, 1, 1,
-0.4041932, -1.846723, -3.07901, 1, 1, 1, 1, 1,
-0.3985985, -0.2721643, -0.5750069, 1, 1, 1, 1, 1,
-0.3979132, 0.6742631, -0.4924359, 1, 1, 1, 1, 1,
-0.3979063, 0.8019051, -2.034068, 1, 1, 1, 1, 1,
-0.3955923, -0.1037273, -2.079421, 0, 0, 1, 1, 1,
-0.3946864, -0.002803643, -2.674127, 1, 0, 0, 1, 1,
-0.3945753, -0.8485188, -1.343802, 1, 0, 0, 1, 1,
-0.3937476, 0.5294589, -0.2347703, 1, 0, 0, 1, 1,
-0.3912939, -1.737171, -1.925435, 1, 0, 0, 1, 1,
-0.3912634, 1.035318, 1.092877, 1, 0, 0, 1, 1,
-0.3804443, -0.1816066, -3.320218, 0, 0, 0, 1, 1,
-0.3796132, 0.7193965, 0.17916, 0, 0, 0, 1, 1,
-0.378071, -0.9348774, -2.037183, 0, 0, 0, 1, 1,
-0.3756804, -0.56993, -1.524656, 0, 0, 0, 1, 1,
-0.3742375, 1.187208, -1.475214, 0, 0, 0, 1, 1,
-0.373778, 0.2050757, -1.983173, 0, 0, 0, 1, 1,
-0.3710684, -0.06005733, -2.403015, 0, 0, 0, 1, 1,
-0.3649522, -0.9889991, -1.657329, 1, 1, 1, 1, 1,
-0.364091, 0.6351358, 0.8530009, 1, 1, 1, 1, 1,
-0.3633071, 0.7540532, -1.579668, 1, 1, 1, 1, 1,
-0.3613984, 0.3728549, -0.5732189, 1, 1, 1, 1, 1,
-0.360743, -1.255995, -3.56763, 1, 1, 1, 1, 1,
-0.3562513, 1.518623, 0.2763065, 1, 1, 1, 1, 1,
-0.3516192, -1.368677, -0.9216716, 1, 1, 1, 1, 1,
-0.3513515, -0.02395589, -0.9586774, 1, 1, 1, 1, 1,
-0.3499014, -0.7929559, -2.741497, 1, 1, 1, 1, 1,
-0.349857, 0.6838502, -1.044406, 1, 1, 1, 1, 1,
-0.3485823, 0.2723512, -1.286182, 1, 1, 1, 1, 1,
-0.3460035, -1.122156, -2.230601, 1, 1, 1, 1, 1,
-0.3444159, 0.6638278, 0.124511, 1, 1, 1, 1, 1,
-0.343832, 0.8321777, 0.3293991, 1, 1, 1, 1, 1,
-0.3423968, -1.832745, -1.990854, 1, 1, 1, 1, 1,
-0.3399407, -0.002414837, -1.324109, 0, 0, 1, 1, 1,
-0.3338469, 0.1970992, -1.149587, 1, 0, 0, 1, 1,
-0.3290781, 0.3634237, -2.446121, 1, 0, 0, 1, 1,
-0.3270688, 1.128913, 1.160001, 1, 0, 0, 1, 1,
-0.3262794, -0.6329517, -1.973618, 1, 0, 0, 1, 1,
-0.3145864, -0.108169, -1.928377, 1, 0, 0, 1, 1,
-0.3138953, -0.1206651, -1.933875, 0, 0, 0, 1, 1,
-0.311739, -0.6715314, -3.202183, 0, 0, 0, 1, 1,
-0.3067455, 0.8967645, -0.6651998, 0, 0, 0, 1, 1,
-0.3064587, -2.060965, -3.346095, 0, 0, 0, 1, 1,
-0.3049914, 0.8858635, -0.3320212, 0, 0, 0, 1, 1,
-0.3040391, 0.09399682, 0.3985987, 0, 0, 0, 1, 1,
-0.3013312, 0.5044076, 0.2828434, 0, 0, 0, 1, 1,
-0.2987122, 0.05673648, -0.210322, 1, 1, 1, 1, 1,
-0.2905082, 0.7539216, -0.05374534, 1, 1, 1, 1, 1,
-0.2905073, -0.5107978, -4.151177, 1, 1, 1, 1, 1,
-0.2838944, -0.2911671, -2.839605, 1, 1, 1, 1, 1,
-0.2828037, 0.6486865, 0.6115716, 1, 1, 1, 1, 1,
-0.2819172, 0.3762164, -1.448057, 1, 1, 1, 1, 1,
-0.278015, 0.6841158, -1.680417, 1, 1, 1, 1, 1,
-0.2759941, -0.1076948, -1.044023, 1, 1, 1, 1, 1,
-0.273498, 2.023592, -0.1020988, 1, 1, 1, 1, 1,
-0.2690259, 0.04632055, -0.926672, 1, 1, 1, 1, 1,
-0.2648052, -0.004433615, -1.652415, 1, 1, 1, 1, 1,
-0.2624757, -0.9981364, -3.560212, 1, 1, 1, 1, 1,
-0.2617463, 1.326075, -2.08489, 1, 1, 1, 1, 1,
-0.2602601, 1.996379, -0.6728557, 1, 1, 1, 1, 1,
-0.2576536, -0.3041085, -3.01446, 1, 1, 1, 1, 1,
-0.2551414, 0.1848524, -1.019811, 0, 0, 1, 1, 1,
-0.2412816, -0.7803834, -3.81856, 1, 0, 0, 1, 1,
-0.2410304, 0.4882976, -0.4003823, 1, 0, 0, 1, 1,
-0.2390713, -0.1999633, -1.73673, 1, 0, 0, 1, 1,
-0.2388544, 0.7039866, -0.3824715, 1, 0, 0, 1, 1,
-0.2384609, -1.002533, -2.908471, 1, 0, 0, 1, 1,
-0.235604, -1.843634, -3.638854, 0, 0, 0, 1, 1,
-0.2351535, 1.542672, 0.2100172, 0, 0, 0, 1, 1,
-0.2332291, -1.507236, -3.163793, 0, 0, 0, 1, 1,
-0.2328666, 0.3511769, -1.960434, 0, 0, 0, 1, 1,
-0.2328278, 0.1420417, -0.7947546, 0, 0, 0, 1, 1,
-0.2282542, -0.1973223, -4.240483, 0, 0, 0, 1, 1,
-0.2252946, 0.14974, -3.170125, 0, 0, 0, 1, 1,
-0.2232749, 0.5250608, -1.136534, 1, 1, 1, 1, 1,
-0.2207504, -1.315336, -2.555571, 1, 1, 1, 1, 1,
-0.2205498, -0.4282351, -4.572506, 1, 1, 1, 1, 1,
-0.220217, 0.05714538, -0.7303314, 1, 1, 1, 1, 1,
-0.2184984, -0.1913564, -1.483279, 1, 1, 1, 1, 1,
-0.2155791, 0.4642074, -1.181132, 1, 1, 1, 1, 1,
-0.2151954, 2.038378, 0.1196331, 1, 1, 1, 1, 1,
-0.2123836, 1.185705, 0.1885117, 1, 1, 1, 1, 1,
-0.2068835, -0.09971718, -2.020271, 1, 1, 1, 1, 1,
-0.2051175, -0.9068868, -3.689759, 1, 1, 1, 1, 1,
-0.2046744, 0.3705393, 0.001960695, 1, 1, 1, 1, 1,
-0.1994783, -2.507736, -1.899392, 1, 1, 1, 1, 1,
-0.1988155, 0.132245, -0.4690096, 1, 1, 1, 1, 1,
-0.1978535, -1.014684, -2.843821, 1, 1, 1, 1, 1,
-0.1939106, -0.1863878, -2.639283, 1, 1, 1, 1, 1,
-0.1924047, -0.8330815, -3.754726, 0, 0, 1, 1, 1,
-0.1922952, -0.07237381, -2.07185, 1, 0, 0, 1, 1,
-0.1896781, -0.2733476, -2.360174, 1, 0, 0, 1, 1,
-0.188915, -0.2719926, -1.754502, 1, 0, 0, 1, 1,
-0.1885424, -0.1085646, -1.032754, 1, 0, 0, 1, 1,
-0.188469, 1.005284, -1.395926, 1, 0, 0, 1, 1,
-0.1831871, 0.6120037, -0.2854468, 0, 0, 0, 1, 1,
-0.1818734, 0.2471657, -0.9866585, 0, 0, 0, 1, 1,
-0.1788744, 0.9667692, -1.345417, 0, 0, 0, 1, 1,
-0.1786313, 2.148118, 0.7644591, 0, 0, 0, 1, 1,
-0.1719041, -2.129573, -4.434234, 0, 0, 0, 1, 1,
-0.1702426, -1.553957, -3.231771, 0, 0, 0, 1, 1,
-0.1661826, -1.38693, -2.211218, 0, 0, 0, 1, 1,
-0.1593451, -0.6060545, -4.327393, 1, 1, 1, 1, 1,
-0.1578141, 0.01470331, -3.15022, 1, 1, 1, 1, 1,
-0.1573081, 0.7223203, 0.12922, 1, 1, 1, 1, 1,
-0.1569468, 0.06415413, -2.261086, 1, 1, 1, 1, 1,
-0.1562896, 1.253582, -0.3835182, 1, 1, 1, 1, 1,
-0.1552863, -0.3206549, -3.21119, 1, 1, 1, 1, 1,
-0.1546807, 0.3547723, -1.498306, 1, 1, 1, 1, 1,
-0.1509245, 0.767358, -0.08165547, 1, 1, 1, 1, 1,
-0.1507858, 0.2165094, -3.675648e-05, 1, 1, 1, 1, 1,
-0.1505777, 0.5258193, -1.539324, 1, 1, 1, 1, 1,
-0.1503407, 0.1939107, -2.735156, 1, 1, 1, 1, 1,
-0.1460085, 0.6279921, -1.190746, 1, 1, 1, 1, 1,
-0.1439458, 1.133299, -1.308018, 1, 1, 1, 1, 1,
-0.1351399, -0.5200834, -2.21552, 1, 1, 1, 1, 1,
-0.1337552, -0.2681886, -2.022597, 1, 1, 1, 1, 1,
-0.1330175, 1.751895, 0.3223672, 0, 0, 1, 1, 1,
-0.1263305, 0.7097282, 1.248019, 1, 0, 0, 1, 1,
-0.1249024, 0.5508835, -0.6500235, 1, 0, 0, 1, 1,
-0.1219059, 0.9715738, -0.5195122, 1, 0, 0, 1, 1,
-0.1202512, -1.125923, -2.332677, 1, 0, 0, 1, 1,
-0.1181439, -0.9561989, -4.128131, 1, 0, 0, 1, 1,
-0.1128374, 1.874041, -0.7921649, 0, 0, 0, 1, 1,
-0.112354, 1.760345, 1.037776, 0, 0, 0, 1, 1,
-0.1111016, 0.9265124, -1.709775, 0, 0, 0, 1, 1,
-0.1100265, -0.6442602, -3.251633, 0, 0, 0, 1, 1,
-0.1096685, 0.3612056, -0.5905129, 0, 0, 0, 1, 1,
-0.1093821, 0.5368, -0.5017262, 0, 0, 0, 1, 1,
-0.1040342, -1.604607, -4.252235, 0, 0, 0, 1, 1,
-0.1036108, 1.194482, -0.6495262, 1, 1, 1, 1, 1,
-0.102379, 0.6533409, 1.654156, 1, 1, 1, 1, 1,
-0.09861481, -0.3792425, -1.795328, 1, 1, 1, 1, 1,
-0.09097637, -1.53291, -4.017646, 1, 1, 1, 1, 1,
-0.09016369, 0.108178, -1.317129, 1, 1, 1, 1, 1,
-0.08843473, 0.2034928, 0.9031617, 1, 1, 1, 1, 1,
-0.08718222, -0.4570418, -3.470328, 1, 1, 1, 1, 1,
-0.08626607, -0.2518092, -0.9364827, 1, 1, 1, 1, 1,
-0.08622108, -0.02847087, -2.213353, 1, 1, 1, 1, 1,
-0.08396249, 0.2685648, 0.5149268, 1, 1, 1, 1, 1,
-0.08306944, 0.7704585, 1.481355, 1, 1, 1, 1, 1,
-0.08180936, 0.9563526, -1.341727, 1, 1, 1, 1, 1,
-0.07814956, 1.538225, -1.706504, 1, 1, 1, 1, 1,
-0.07405884, -0.2719258, -2.790061, 1, 1, 1, 1, 1,
-0.07154083, -0.2051793, -2.143671, 1, 1, 1, 1, 1,
-0.05820678, 0.7592533, -1.931273, 0, 0, 1, 1, 1,
-0.05784238, -0.24294, -1.10239, 1, 0, 0, 1, 1,
-0.0550314, 0.03226159, -1.931513, 1, 0, 0, 1, 1,
-0.05321853, -1.135693, -3.592901, 1, 0, 0, 1, 1,
-0.05145429, 0.7591532, -0.08592699, 1, 0, 0, 1, 1,
-0.05041311, 0.5015356, -0.1116325, 1, 0, 0, 1, 1,
-0.04755406, 0.4472981, 1.556564, 0, 0, 0, 1, 1,
-0.04463351, 0.2310106, 0.5186729, 0, 0, 0, 1, 1,
-0.04404961, 2.710483, -0.03381816, 0, 0, 0, 1, 1,
-0.0416519, 0.7226852, -0.2232678, 0, 0, 0, 1, 1,
-0.0345997, -1.334238, -2.035815, 0, 0, 0, 1, 1,
-0.02895098, -0.983691, -3.890263, 0, 0, 0, 1, 1,
-0.0259986, 1.580569, 0.7536316, 0, 0, 0, 1, 1,
-0.02473692, 0.02979414, -0.1963991, 1, 1, 1, 1, 1,
-0.01957211, 0.4187377, -0.6586628, 1, 1, 1, 1, 1,
-0.0149779, -1.724193, -1.250791, 1, 1, 1, 1, 1,
-0.01215089, -0.6603187, -4.075271, 1, 1, 1, 1, 1,
-0.01204773, -1.175467, -4.270849, 1, 1, 1, 1, 1,
-0.0118321, -2.299987, -2.542852, 1, 1, 1, 1, 1,
-0.0110533, 1.023131, 0.299877, 1, 1, 1, 1, 1,
-0.007762936, 0.8513673, -0.1456451, 1, 1, 1, 1, 1,
-0.002277972, 1.638783, -0.9144365, 1, 1, 1, 1, 1,
-0.002157753, -2.692345, -3.509718, 1, 1, 1, 1, 1,
-0.001824192, 0.4580489, -0.3641944, 1, 1, 1, 1, 1,
-0.0002793889, -0.9522585, -2.122181, 1, 1, 1, 1, 1,
0.001521076, -0.6057219, 4.08547, 1, 1, 1, 1, 1,
0.002812681, -1.480628, 1.830519, 1, 1, 1, 1, 1,
0.003475386, 0.7054818, -0.4795572, 1, 1, 1, 1, 1,
0.008875707, -1.428218, 4.467979, 0, 0, 1, 1, 1,
0.009074982, -0.4736923, 2.540607, 1, 0, 0, 1, 1,
0.01262837, 0.004216445, 2.776347, 1, 0, 0, 1, 1,
0.01329622, 0.3223491, 0.7193506, 1, 0, 0, 1, 1,
0.01966169, -1.573183, 2.37108, 1, 0, 0, 1, 1,
0.0210176, -0.3082072, 3.4009, 1, 0, 0, 1, 1,
0.0214847, 0.2806015, 1.485556, 0, 0, 0, 1, 1,
0.02379606, -1.36273, 4.452761, 0, 0, 0, 1, 1,
0.0246712, 0.09115303, 0.1198488, 0, 0, 0, 1, 1,
0.02543679, -0.7659895, 1.965063, 0, 0, 0, 1, 1,
0.02809327, -1.196935, 4.253867, 0, 0, 0, 1, 1,
0.03451334, 1.066399, -0.2030338, 0, 0, 0, 1, 1,
0.03841253, 0.2807336, -0.3239826, 0, 0, 0, 1, 1,
0.04015586, -0.6853772, 2.612097, 1, 1, 1, 1, 1,
0.0479531, 0.08796521, 2.527984, 1, 1, 1, 1, 1,
0.05390637, -1.343402, 2.222958, 1, 1, 1, 1, 1,
0.05455622, 0.03679096, 1.768732, 1, 1, 1, 1, 1,
0.05718014, -1.462392, 2.481251, 1, 1, 1, 1, 1,
0.05876698, 0.6328202, 1.307562, 1, 1, 1, 1, 1,
0.07073358, -0.6027619, 3.468342, 1, 1, 1, 1, 1,
0.07160959, -0.7130954, 2.820405, 1, 1, 1, 1, 1,
0.07622577, 0.2518759, -0.4662517, 1, 1, 1, 1, 1,
0.09389092, -0.5334343, 2.705559, 1, 1, 1, 1, 1,
0.09428366, 0.4993172, 1.59893, 1, 1, 1, 1, 1,
0.09696297, 1.13058, 1.3071, 1, 1, 1, 1, 1,
0.09822886, -0.5624484, 1.757764, 1, 1, 1, 1, 1,
0.1000118, -0.1854418, 3.56669, 1, 1, 1, 1, 1,
0.1032449, 0.2488954, 0.639988, 1, 1, 1, 1, 1,
0.1067483, -0.007695836, 2.339628, 0, 0, 1, 1, 1,
0.1072216, -1.314856, 2.967185, 1, 0, 0, 1, 1,
0.1077597, 0.5540997, 1.519254, 1, 0, 0, 1, 1,
0.1100237, -1.614818, 4.579487, 1, 0, 0, 1, 1,
0.11256, -0.400488, 3.879026, 1, 0, 0, 1, 1,
0.1217411, -1.400503, 2.614827, 1, 0, 0, 1, 1,
0.1218961, -1.231719, 3.41371, 0, 0, 0, 1, 1,
0.123831, 0.5871403, -0.323599, 0, 0, 0, 1, 1,
0.1287248, -0.9524692, 2.848641, 0, 0, 0, 1, 1,
0.1311194, -0.8775989, 2.924931, 0, 0, 0, 1, 1,
0.1357876, 1.575979, -0.5416555, 0, 0, 0, 1, 1,
0.1360507, 0.9688424, 0.3703162, 0, 0, 0, 1, 1,
0.1378101, 1.341411, 1.051931, 0, 0, 0, 1, 1,
0.1392916, -0.3049988, 3.675037, 1, 1, 1, 1, 1,
0.1443153, 0.6265322, -0.5764219, 1, 1, 1, 1, 1,
0.1468157, -0.9198649, 2.557802, 1, 1, 1, 1, 1,
0.1501568, -0.5923929, 4.081061, 1, 1, 1, 1, 1,
0.1509208, -1.636988, 2.221936, 1, 1, 1, 1, 1,
0.1535425, 0.2529786, -0.1231599, 1, 1, 1, 1, 1,
0.1561479, 0.0200677, 2.718287, 1, 1, 1, 1, 1,
0.1564508, -0.1102985, 0.1768866, 1, 1, 1, 1, 1,
0.158796, 1.084555, -0.8226467, 1, 1, 1, 1, 1,
0.1592503, -0.09844819, 2.395843, 1, 1, 1, 1, 1,
0.1647834, 1.109867, 1.148071, 1, 1, 1, 1, 1,
0.1689257, 0.8883766, -1.039791, 1, 1, 1, 1, 1,
0.1693639, -1.307693, 1.394976, 1, 1, 1, 1, 1,
0.1697613, -0.05929811, 3.028617, 1, 1, 1, 1, 1,
0.1721404, 0.325502, -0.157547, 1, 1, 1, 1, 1,
0.1729479, 0.4504199, 1.642234, 0, 0, 1, 1, 1,
0.1786259, -0.2187422, 2.799323, 1, 0, 0, 1, 1,
0.1797553, 2.772752, -1.428647, 1, 0, 0, 1, 1,
0.1813348, 1.639119, -1.043537, 1, 0, 0, 1, 1,
0.1825435, -0.6381673, 2.064517, 1, 0, 0, 1, 1,
0.1839532, -0.02526949, 1.244126, 1, 0, 0, 1, 1,
0.1852303, 0.3340045, 1.232628, 0, 0, 0, 1, 1,
0.1864283, 0.0372444, 1.075233, 0, 0, 0, 1, 1,
0.201918, -0.696278, 2.610976, 0, 0, 0, 1, 1,
0.2023842, -0.5164268, 3.534904, 0, 0, 0, 1, 1,
0.2036285, 0.2871424, 1.998351, 0, 0, 0, 1, 1,
0.2171865, 0.3329762, 0.5256736, 0, 0, 0, 1, 1,
0.2229242, 1.047343, -0.3591961, 0, 0, 0, 1, 1,
0.2234163, -0.3910155, 3.753697, 1, 1, 1, 1, 1,
0.2249019, -1.348362, 1.885141, 1, 1, 1, 1, 1,
0.2256075, 0.1361858, 2.782278, 1, 1, 1, 1, 1,
0.2269465, 0.8710303, -1.824629, 1, 1, 1, 1, 1,
0.2275354, 0.07869498, -0.615336, 1, 1, 1, 1, 1,
0.228239, 0.6453694, -0.1099053, 1, 1, 1, 1, 1,
0.2296554, -0.2218029, 1.599707, 1, 1, 1, 1, 1,
0.2337884, 0.5375714, -0.3524026, 1, 1, 1, 1, 1,
0.2356229, 0.3735061, 0.5332785, 1, 1, 1, 1, 1,
0.2445292, -0.9058838, 3.721586, 1, 1, 1, 1, 1,
0.2461585, 0.5931342, 0.6266428, 1, 1, 1, 1, 1,
0.2463688, 0.7989323, 0.7455711, 1, 1, 1, 1, 1,
0.2498278, 0.7050068, -0.5520231, 1, 1, 1, 1, 1,
0.2508406, 0.5485211, 0.9208743, 1, 1, 1, 1, 1,
0.2508537, 0.538003, 1.80009, 1, 1, 1, 1, 1,
0.2510809, 0.4676645, 0.4986338, 0, 0, 1, 1, 1,
0.2582427, 1.232791, -0.3388291, 1, 0, 0, 1, 1,
0.2587595, -0.1639583, 1.554101, 1, 0, 0, 1, 1,
0.259699, -1.174633, 2.512577, 1, 0, 0, 1, 1,
0.2604566, 0.7358609, -0.05778801, 1, 0, 0, 1, 1,
0.2634418, 0.3019016, 2.571768, 1, 0, 0, 1, 1,
0.2641612, 1.233781, -1.06143, 0, 0, 0, 1, 1,
0.2757581, 0.36871, 0.3922417, 0, 0, 0, 1, 1,
0.2782545, -1.89414, 3.900964, 0, 0, 0, 1, 1,
0.2791642, -0.1320235, -0.4175359, 0, 0, 0, 1, 1,
0.2796935, -1.024147, 3.363742, 0, 0, 0, 1, 1,
0.2826, 0.01994369, 1.47747, 0, 0, 0, 1, 1,
0.2833644, 0.05076447, 1.14736, 0, 0, 0, 1, 1,
0.2863177, 0.187237, 0.9239348, 1, 1, 1, 1, 1,
0.2899745, 0.383216, 1.375433, 1, 1, 1, 1, 1,
0.2964585, 0.5632831, -0.2277557, 1, 1, 1, 1, 1,
0.3043887, -0.09734366, 2.047431, 1, 1, 1, 1, 1,
0.3109544, -1.244538, 2.153731, 1, 1, 1, 1, 1,
0.3165875, -1.176854, 2.970072, 1, 1, 1, 1, 1,
0.3183978, 0.5962189, 2.383586, 1, 1, 1, 1, 1,
0.3189734, 1.083941, 0.387565, 1, 1, 1, 1, 1,
0.3194263, 0.5195859, 1.032932, 1, 1, 1, 1, 1,
0.3219585, 1.422551, 1.159496, 1, 1, 1, 1, 1,
0.3231624, 0.9719011, 1.629826, 1, 1, 1, 1, 1,
0.3249316, 2.028393, -0.4767894, 1, 1, 1, 1, 1,
0.3257666, 0.1618648, 0.3784877, 1, 1, 1, 1, 1,
0.3291461, 1.744968, 0.6203144, 1, 1, 1, 1, 1,
0.3294443, 1.016641, 0.3508598, 1, 1, 1, 1, 1,
0.331489, 1.155957, 0.4174899, 0, 0, 1, 1, 1,
0.3375475, 1.008485, -1.46372, 1, 0, 0, 1, 1,
0.3376542, -1.866788, 3.633027, 1, 0, 0, 1, 1,
0.3406612, 0.6080624, 0.7208442, 1, 0, 0, 1, 1,
0.3434708, -0.6065192, 2.157738, 1, 0, 0, 1, 1,
0.3440855, 1.191281, 1.136504, 1, 0, 0, 1, 1,
0.3443848, 0.4806378, -0.3856611, 0, 0, 0, 1, 1,
0.3446822, -0.879585, 2.055496, 0, 0, 0, 1, 1,
0.3457383, 0.370896, 1.036052, 0, 0, 0, 1, 1,
0.3486062, 1.511115, 0.6573893, 0, 0, 0, 1, 1,
0.3516957, -0.2037784, 0.6025932, 0, 0, 0, 1, 1,
0.3541172, 0.2201202, 2.250932, 0, 0, 0, 1, 1,
0.3579396, 0.761813, 1.07605, 0, 0, 0, 1, 1,
0.3606122, 0.5956019, 0.3212067, 1, 1, 1, 1, 1,
0.3618034, 1.644677, 0.4490182, 1, 1, 1, 1, 1,
0.3647274, 0.4730232, -0.3860312, 1, 1, 1, 1, 1,
0.365033, 0.6807293, -2.238289, 1, 1, 1, 1, 1,
0.3652912, 0.01841757, 1.133369, 1, 1, 1, 1, 1,
0.3662526, -1.429186, 1.864604, 1, 1, 1, 1, 1,
0.3665018, 1.11841, -0.007323188, 1, 1, 1, 1, 1,
0.3695683, 1.400975, -0.485534, 1, 1, 1, 1, 1,
0.3707531, 0.2041069, -1.159999, 1, 1, 1, 1, 1,
0.3716517, -0.2231187, 2.344666, 1, 1, 1, 1, 1,
0.3728346, 0.04221588, 0.3415921, 1, 1, 1, 1, 1,
0.3846726, -1.504963, 2.999228, 1, 1, 1, 1, 1,
0.3888488, 0.08833814, 0.4740417, 1, 1, 1, 1, 1,
0.3889416, -0.9187846, 3.452455, 1, 1, 1, 1, 1,
0.3918104, -0.4408042, 1.748745, 1, 1, 1, 1, 1,
0.3922536, -0.4032499, 2.859148, 0, 0, 1, 1, 1,
0.3950492, 0.01336546, 0.3029157, 1, 0, 0, 1, 1,
0.3984513, 1.547836, 1.222122, 1, 0, 0, 1, 1,
0.3989196, -0.4095778, 3.728958, 1, 0, 0, 1, 1,
0.4008567, 0.1838266, 2.291592, 1, 0, 0, 1, 1,
0.4018095, 0.7372048, 0.1950761, 1, 0, 0, 1, 1,
0.401868, -0.7709098, 3.919228, 0, 0, 0, 1, 1,
0.4096053, 0.03741929, 1.528675, 0, 0, 0, 1, 1,
0.4098939, -0.2424309, 3.952147, 0, 0, 0, 1, 1,
0.4110482, 0.338205, 1.84583, 0, 0, 0, 1, 1,
0.4137354, -2.197173, 3.851114, 0, 0, 0, 1, 1,
0.4140662, 2.190337, 1.763642, 0, 0, 0, 1, 1,
0.415206, -0.893085, 2.092032, 0, 0, 0, 1, 1,
0.4167701, 0.9200264, 0.7967095, 1, 1, 1, 1, 1,
0.4198509, 1.624565, -1.127556, 1, 1, 1, 1, 1,
0.4226343, 0.1562196, 1.506308, 1, 1, 1, 1, 1,
0.4247068, -1.759759, 4.051644, 1, 1, 1, 1, 1,
0.4252638, -0.2918645, 1.374786, 1, 1, 1, 1, 1,
0.4292252, -1.239412, 3.536092, 1, 1, 1, 1, 1,
0.4297918, 0.8107338, 0.5320528, 1, 1, 1, 1, 1,
0.4302312, 0.07771052, 0.9953153, 1, 1, 1, 1, 1,
0.4308488, 0.8737192, 0.559078, 1, 1, 1, 1, 1,
0.4314131, 0.7229217, 0.5879392, 1, 1, 1, 1, 1,
0.4327866, -0.1327717, 2.007419, 1, 1, 1, 1, 1,
0.4335603, 0.1323783, 2.691344, 1, 1, 1, 1, 1,
0.4369947, -0.5868495, 1.28264, 1, 1, 1, 1, 1,
0.4515534, 1.754811, -0.3363197, 1, 1, 1, 1, 1,
0.4587878, 0.2478708, 2.058677, 1, 1, 1, 1, 1,
0.4617495, -1.580345, 2.516891, 0, 0, 1, 1, 1,
0.4673236, 0.634724, 0.0682677, 1, 0, 0, 1, 1,
0.4691187, -0.4056695, 1.793598, 1, 0, 0, 1, 1,
0.4723536, 0.773917, 1.915422, 1, 0, 0, 1, 1,
0.4730464, 0.3142294, 1.189053, 1, 0, 0, 1, 1,
0.4751233, -0.06075614, 1.752678, 1, 0, 0, 1, 1,
0.4860615, -0.861956, 3.745638, 0, 0, 0, 1, 1,
0.4870643, 1.226901, 1.261255, 0, 0, 0, 1, 1,
0.4900146, 0.3140362, 0.01525354, 0, 0, 0, 1, 1,
0.4926423, 0.09626403, 1.652056, 0, 0, 0, 1, 1,
0.4986851, 0.4877108, -0.1691824, 0, 0, 0, 1, 1,
0.5066326, -1.539579, 2.844062, 0, 0, 0, 1, 1,
0.5095865, -0.1587401, 1.81481, 0, 0, 0, 1, 1,
0.5148838, -0.9156478, 2.174924, 1, 1, 1, 1, 1,
0.5156209, -0.0999558, 1.240381, 1, 1, 1, 1, 1,
0.5189922, -1.726694, 4.18812, 1, 1, 1, 1, 1,
0.5248161, 0.3407516, 0.7900418, 1, 1, 1, 1, 1,
0.5294201, -2.778042, 3.246357, 1, 1, 1, 1, 1,
0.5310473, 1.600183, 0.5982977, 1, 1, 1, 1, 1,
0.5342876, 1.205612, 0.9647413, 1, 1, 1, 1, 1,
0.5350175, -0.4330996, 1.504329, 1, 1, 1, 1, 1,
0.5402564, -1.30438, 2.878073, 1, 1, 1, 1, 1,
0.5404174, 0.05187216, 1.011122, 1, 1, 1, 1, 1,
0.5414922, -0.6936594, 1.423637, 1, 1, 1, 1, 1,
0.542411, -0.05897674, 0.7775768, 1, 1, 1, 1, 1,
0.5447053, -1.875872, 2.220082, 1, 1, 1, 1, 1,
0.5457566, 0.8283805, 1.108891, 1, 1, 1, 1, 1,
0.54635, -1.199839, 1.516844, 1, 1, 1, 1, 1,
0.5463536, -0.2386569, 1.428638, 0, 0, 1, 1, 1,
0.5477893, 0.0149207, 0.3658787, 1, 0, 0, 1, 1,
0.5485864, 1.101443, 0.3360294, 1, 0, 0, 1, 1,
0.5542311, -1.163656, 3.553713, 1, 0, 0, 1, 1,
0.5542403, -0.4206264, 3.039634, 1, 0, 0, 1, 1,
0.5542614, 0.7651211, 0.7811878, 1, 0, 0, 1, 1,
0.5589587, -0.3802043, 3.429384, 0, 0, 0, 1, 1,
0.5596343, 0.1872963, 1.675358, 0, 0, 0, 1, 1,
0.5605607, -0.03236098, 1.330729, 0, 0, 0, 1, 1,
0.5643202, 0.7035986, 2.73025, 0, 0, 0, 1, 1,
0.5693114, -0.3737321, 1.490407, 0, 0, 0, 1, 1,
0.5761786, -0.437202, 2.823424, 0, 0, 0, 1, 1,
0.5781052, 1.118093, 0.5694309, 0, 0, 0, 1, 1,
0.5833957, 0.2352757, 0.2633804, 1, 1, 1, 1, 1,
0.5847359, -0.08133027, 1.587182, 1, 1, 1, 1, 1,
0.5881256, 0.497498, 1.668145, 1, 1, 1, 1, 1,
0.5894596, 0.08662753, 2.439675, 1, 1, 1, 1, 1,
0.5926744, 0.3386869, 0.1247959, 1, 1, 1, 1, 1,
0.6018274, 0.1446991, 2.203501, 1, 1, 1, 1, 1,
0.6032528, -0.439117, 3.406915, 1, 1, 1, 1, 1,
0.6056372, 0.9496038, -0.3184014, 1, 1, 1, 1, 1,
0.6066933, 0.4659981, 0.8996671, 1, 1, 1, 1, 1,
0.6087818, 0.2484534, 1.449497, 1, 1, 1, 1, 1,
0.613849, -1.459533, 2.609178, 1, 1, 1, 1, 1,
0.6163233, -0.4768212, 2.902197, 1, 1, 1, 1, 1,
0.6167655, -1.902872, 2.623418, 1, 1, 1, 1, 1,
0.6222751, -1.730599, 2.005066, 1, 1, 1, 1, 1,
0.6244022, -0.860809, 3.372744, 1, 1, 1, 1, 1,
0.6247776, -0.196027, 2.300835, 0, 0, 1, 1, 1,
0.6310496, 1.091039, -0.3801537, 1, 0, 0, 1, 1,
0.6320851, -1.030352, 2.120304, 1, 0, 0, 1, 1,
0.6336465, 0.5348933, 0.9312698, 1, 0, 0, 1, 1,
0.6404818, -0.3486905, 2.899242, 1, 0, 0, 1, 1,
0.6420513, -1.401207, 3.612882, 1, 0, 0, 1, 1,
0.6511482, -0.8970423, 2.205935, 0, 0, 0, 1, 1,
0.651773, 1.744539, 0.9592835, 0, 0, 0, 1, 1,
0.6523269, -1.114776, 2.869931, 0, 0, 0, 1, 1,
0.6570269, -0.1491179, 0.7568659, 0, 0, 0, 1, 1,
0.6613289, 0.7058453, 0.2226591, 0, 0, 0, 1, 1,
0.6629994, -0.5990761, 2.496462, 0, 0, 0, 1, 1,
0.6648174, -0.6489154, 1.761189, 0, 0, 0, 1, 1,
0.6732024, -0.3905603, 2.168345, 1, 1, 1, 1, 1,
0.6742588, 0.6930498, 1.47582, 1, 1, 1, 1, 1,
0.6773837, 1.715363, 1.433383, 1, 1, 1, 1, 1,
0.6804227, 1.159061, -0.548335, 1, 1, 1, 1, 1,
0.6844509, -0.1681132, 3.946984, 1, 1, 1, 1, 1,
0.6845315, -0.9696115, 3.883405, 1, 1, 1, 1, 1,
0.689329, -0.3108087, 1.730162, 1, 1, 1, 1, 1,
0.6915489, 1.154234, -1.324559, 1, 1, 1, 1, 1,
0.6942885, 0.1208193, 1.290635, 1, 1, 1, 1, 1,
0.6981987, 2.376554, -0.161327, 1, 1, 1, 1, 1,
0.7088842, -0.2803052, 2.691812, 1, 1, 1, 1, 1,
0.7129081, -0.2670148, 2.960437, 1, 1, 1, 1, 1,
0.7133624, 1.645099, 0.1789287, 1, 1, 1, 1, 1,
0.7163538, -0.07435712, -0.3519543, 1, 1, 1, 1, 1,
0.720036, 0.3798496, 1.246915, 1, 1, 1, 1, 1,
0.7296547, -0.1497587, 3.623363, 0, 0, 1, 1, 1,
0.7345498, 0.6151599, 3.117837, 1, 0, 0, 1, 1,
0.7353656, 0.3873402, -0.5256584, 1, 0, 0, 1, 1,
0.7367899, 1.219868, 0.4645791, 1, 0, 0, 1, 1,
0.7370303, 0.3170861, 0.7304261, 1, 0, 0, 1, 1,
0.7379769, 0.7634777, -0.3091149, 1, 0, 0, 1, 1,
0.7431935, -0.01872524, 2.506416, 0, 0, 0, 1, 1,
0.7478385, 0.8128453, -0.09947848, 0, 0, 0, 1, 1,
0.748468, 1.491447, 1.892278, 0, 0, 0, 1, 1,
0.751184, 1.080147, -0.1397262, 0, 0, 0, 1, 1,
0.7607297, 1.123717, 0.3093077, 0, 0, 0, 1, 1,
0.7625037, -1.68435, 2.313313, 0, 0, 0, 1, 1,
0.7745047, -0.5786045, 1.202835, 0, 0, 0, 1, 1,
0.7807676, 0.3396129, 0.558306, 1, 1, 1, 1, 1,
0.7810662, -1.02703, 2.460588, 1, 1, 1, 1, 1,
0.7901932, 0.9154568, 2.556962, 1, 1, 1, 1, 1,
0.792125, 1.109916, 1.56054, 1, 1, 1, 1, 1,
0.7928113, -2.270788, 3.924866, 1, 1, 1, 1, 1,
0.7971487, 1.741231, -1.28397, 1, 1, 1, 1, 1,
0.7978322, -0.2724037, 0.854043, 1, 1, 1, 1, 1,
0.8002965, 0.5882472, 2.431072, 1, 1, 1, 1, 1,
0.8072674, -0.6624483, 0.7005586, 1, 1, 1, 1, 1,
0.8078887, 0.08280928, 1.727921, 1, 1, 1, 1, 1,
0.8172619, -0.6132571, 2.003582, 1, 1, 1, 1, 1,
0.8191681, -0.1194757, 2.19092, 1, 1, 1, 1, 1,
0.8262928, -1.491635, 3.023589, 1, 1, 1, 1, 1,
0.827971, 1.447345, 1.101936, 1, 1, 1, 1, 1,
0.8292638, -2.840613, 3.35201, 1, 1, 1, 1, 1,
0.8305297, -0.3298728, 3.589043, 0, 0, 1, 1, 1,
0.8361413, 0.2130202, 3.047173, 1, 0, 0, 1, 1,
0.8370659, 0.1582334, 0.7804704, 1, 0, 0, 1, 1,
0.837153, 0.9237703, 1.084579, 1, 0, 0, 1, 1,
0.8389679, 0.843651, 2.018336, 1, 0, 0, 1, 1,
0.8395585, -0.1592886, 3.58629, 1, 0, 0, 1, 1,
0.844265, 0.04397196, -0.2768623, 0, 0, 0, 1, 1,
0.847932, -0.2563386, 1.104943, 0, 0, 0, 1, 1,
0.8520012, -0.0003506491, 1.874283, 0, 0, 0, 1, 1,
0.8525816, 1.25849, 0.7511951, 0, 0, 0, 1, 1,
0.8551999, -0.1782171, 1.026402, 0, 0, 0, 1, 1,
0.8558789, 0.1673256, 0.3124458, 0, 0, 0, 1, 1,
0.8562677, 1.426856, 2.234342, 0, 0, 0, 1, 1,
0.8596919, 0.2479522, 1.267741, 1, 1, 1, 1, 1,
0.8597063, -0.3093164, 1.762172, 1, 1, 1, 1, 1,
0.8613068, 1.130573, 1.62096, 1, 1, 1, 1, 1,
0.8622567, 0.2254233, 2.110712, 1, 1, 1, 1, 1,
0.8661243, -1.452664, 3.668649, 1, 1, 1, 1, 1,
0.8762657, 0.4547287, 2.440582, 1, 1, 1, 1, 1,
0.8766779, 0.8968129, 2.408885, 1, 1, 1, 1, 1,
0.8786842, -0.2655623, 0.6628308, 1, 1, 1, 1, 1,
0.882335, -0.08740741, 1.084549, 1, 1, 1, 1, 1,
0.8835715, 2.075605, 1.640084, 1, 1, 1, 1, 1,
0.88718, 0.3335651, 2.062636, 1, 1, 1, 1, 1,
0.8873919, 1.135659, 1.923699, 1, 1, 1, 1, 1,
0.8957754, -0.4864256, 2.943131, 1, 1, 1, 1, 1,
0.8960313, -0.8341443, 2.135504, 1, 1, 1, 1, 1,
0.8978237, -1.529408, 1.620477, 1, 1, 1, 1, 1,
0.9024984, -0.876839, 1.877717, 0, 0, 1, 1, 1,
0.9026549, -0.6294598, 2.738149, 1, 0, 0, 1, 1,
0.9075285, 0.2707375, -0.1414811, 1, 0, 0, 1, 1,
0.9107592, -0.1033831, 1.445484, 1, 0, 0, 1, 1,
0.9122673, 1.3546, 3.017183, 1, 0, 0, 1, 1,
0.9148777, -0.0599752, 0.744517, 1, 0, 0, 1, 1,
0.9187265, -0.9797774, 1.177798, 0, 0, 0, 1, 1,
0.921841, -0.988148, 1.862034, 0, 0, 0, 1, 1,
0.9231107, 1.051275, 2.154544, 0, 0, 0, 1, 1,
0.9238661, -1.029169, 3.359929, 0, 0, 0, 1, 1,
0.9278108, 0.3051229, 1.088021, 0, 0, 0, 1, 1,
0.9312056, 0.6292506, 2.300447, 0, 0, 0, 1, 1,
0.9331691, 1.868543, 2.205762, 0, 0, 0, 1, 1,
0.9377058, -0.7862929, 0.5314086, 1, 1, 1, 1, 1,
0.9395633, 0.5554315, 2.107664, 1, 1, 1, 1, 1,
0.9452015, -1.310245, 2.521808, 1, 1, 1, 1, 1,
0.9484384, 1.990425, 0.409698, 1, 1, 1, 1, 1,
0.9500382, 0.3786397, 0.9024759, 1, 1, 1, 1, 1,
0.9505815, 2.479626, 0.3627645, 1, 1, 1, 1, 1,
0.9571624, -0.2718174, 1.825574, 1, 1, 1, 1, 1,
0.9585237, 0.25556, 0.4594312, 1, 1, 1, 1, 1,
0.9592402, -1.022004, 2.814968, 1, 1, 1, 1, 1,
0.9678376, 1.052056, 1.719312, 1, 1, 1, 1, 1,
0.9683196, -0.8189833, 3.243406, 1, 1, 1, 1, 1,
0.9723929, -0.01362865, 2.189139, 1, 1, 1, 1, 1,
0.9763749, 0.9403653, -0.205846, 1, 1, 1, 1, 1,
0.976905, -0.9027395, 1.971773, 1, 1, 1, 1, 1,
0.9821039, 1.307059, 3.021168, 1, 1, 1, 1, 1,
0.9870877, -0.5282665, 2.410698, 0, 0, 1, 1, 1,
0.9941823, -1.903141, 3.630569, 1, 0, 0, 1, 1,
0.9964475, 0.6291451, -0.5096207, 1, 0, 0, 1, 1,
1.004647, 1.458602, 1.781957, 1, 0, 0, 1, 1,
1.015696, -0.5228837, 2.054279, 1, 0, 0, 1, 1,
1.016214, -0.5566884, 2.252337, 1, 0, 0, 1, 1,
1.024916, -0.3899068, 0.02656513, 0, 0, 0, 1, 1,
1.028623, -0.4378254, 2.634366, 0, 0, 0, 1, 1,
1.032931, 0.442185, 0.8672739, 0, 0, 0, 1, 1,
1.033791, -0.8970356, 1.668786, 0, 0, 0, 1, 1,
1.040147, 1.119392, 1.792076, 0, 0, 0, 1, 1,
1.046797, -0.2190535, -0.2499145, 0, 0, 0, 1, 1,
1.049117, 2.530236, 0.2286186, 0, 0, 0, 1, 1,
1.051638, -0.003993697, 2.815868, 1, 1, 1, 1, 1,
1.057945, -0.5792756, 2.542814, 1, 1, 1, 1, 1,
1.06089, -0.00825881, 2.371423, 1, 1, 1, 1, 1,
1.063742, -0.3819355, 2.107139, 1, 1, 1, 1, 1,
1.072631, -0.7311854, 1.979318, 1, 1, 1, 1, 1,
1.080534, -2.115015, 1.727781, 1, 1, 1, 1, 1,
1.08635, -0.6603435, 2.156659, 1, 1, 1, 1, 1,
1.089167, -1.839853, 2.923107, 1, 1, 1, 1, 1,
1.090884, 0.7559749, 2.762902, 1, 1, 1, 1, 1,
1.099444, 0.8671582, 0.1769488, 1, 1, 1, 1, 1,
1.100716, -1.246521, 2.589262, 1, 1, 1, 1, 1,
1.102814, 1.779163, 0.2220547, 1, 1, 1, 1, 1,
1.10428, -0.8000594, 2.382522, 1, 1, 1, 1, 1,
1.105368, -1.22341, 2.169613, 1, 1, 1, 1, 1,
1.112737, -0.2695351, 0.3643555, 1, 1, 1, 1, 1,
1.11338, -1.815656, 3.012801, 0, 0, 1, 1, 1,
1.119871, -0.266799, 1.310638, 1, 0, 0, 1, 1,
1.120104, -0.6229494, 2.547338, 1, 0, 0, 1, 1,
1.136965, 0.4578178, -0.01071002, 1, 0, 0, 1, 1,
1.147742, -0.9657264, 0.9437486, 1, 0, 0, 1, 1,
1.152719, -2.059444, 3.494988, 1, 0, 0, 1, 1,
1.165274, 0.04622977, 2.503977, 0, 0, 0, 1, 1,
1.167363, -0.9307977, 1.731478, 0, 0, 0, 1, 1,
1.169073, 0.2860704, 1.664685, 0, 0, 0, 1, 1,
1.172096, 1.399468, 0.4025803, 0, 0, 0, 1, 1,
1.17257, 0.7909942, 0.897324, 0, 0, 0, 1, 1,
1.177542, -1.077644, 2.398795, 0, 0, 0, 1, 1,
1.181088, -0.211484, 0.2984577, 0, 0, 0, 1, 1,
1.193985, 1.389612, 1.099452, 1, 1, 1, 1, 1,
1.200828, -1.038947, 1.396505, 1, 1, 1, 1, 1,
1.206816, -0.2806985, 1.374999, 1, 1, 1, 1, 1,
1.222178, 0.4111368, -1.791963, 1, 1, 1, 1, 1,
1.229365, 0.6994798, 0.3823692, 1, 1, 1, 1, 1,
1.23967, -0.6740994, 0.915278, 1, 1, 1, 1, 1,
1.257679, -1.064252, 1.925174, 1, 1, 1, 1, 1,
1.25915, 1.921331, -0.6244701, 1, 1, 1, 1, 1,
1.260269, -0.8423564, 1.132169, 1, 1, 1, 1, 1,
1.264477, -0.06367861, 2.82761, 1, 1, 1, 1, 1,
1.264884, 1.174749, 0.6132992, 1, 1, 1, 1, 1,
1.265067, -0.5309952, 2.764386, 1, 1, 1, 1, 1,
1.281499, 0.06674375, -0.9983981, 1, 1, 1, 1, 1,
1.286417, -0.445339, 2.474264, 1, 1, 1, 1, 1,
1.287382, -0.2779168, 1.248695, 1, 1, 1, 1, 1,
1.301157, 1.754928, 0.5050728, 0, 0, 1, 1, 1,
1.309211, -0.8801004, 2.185593, 1, 0, 0, 1, 1,
1.312356, -0.02281549, 0.4181952, 1, 0, 0, 1, 1,
1.335661, 0.813998, 0.6307434, 1, 0, 0, 1, 1,
1.348075, 0.1848624, 0.6855857, 1, 0, 0, 1, 1,
1.350208, 0.3191688, 0.928835, 1, 0, 0, 1, 1,
1.366439, -1.30345, 2.459118, 0, 0, 0, 1, 1,
1.370271, 0.3875472, -0.6375269, 0, 0, 0, 1, 1,
1.370839, -0.4689702, 2.642034, 0, 0, 0, 1, 1,
1.375693, -1.182557, 1.828125, 0, 0, 0, 1, 1,
1.378103, 1.184862, 0.8126745, 0, 0, 0, 1, 1,
1.40324, -0.5149368, 2.973901, 0, 0, 0, 1, 1,
1.40442, -0.05229656, 0.6672671, 0, 0, 0, 1, 1,
1.404439, 0.408433, 2.403621, 1, 1, 1, 1, 1,
1.408981, -1.118481, 3.079106, 1, 1, 1, 1, 1,
1.410823, -2.589804, 2.06886, 1, 1, 1, 1, 1,
1.423332, -0.1064504, -0.1009999, 1, 1, 1, 1, 1,
1.430468, -0.1633848, 3.235421, 1, 1, 1, 1, 1,
1.435427, 0.7180634, 1.532439, 1, 1, 1, 1, 1,
1.439221, -1.602505, 3.172963, 1, 1, 1, 1, 1,
1.446693, -0.6643074, 2.790486, 1, 1, 1, 1, 1,
1.450019, -0.2823274, 1.736254, 1, 1, 1, 1, 1,
1.453782, 0.364801, 1.271178, 1, 1, 1, 1, 1,
1.461445, 0.7636995, -0.7454485, 1, 1, 1, 1, 1,
1.468695, -0.7795808, 3.136551, 1, 1, 1, 1, 1,
1.480693, -0.3250942, 0.604354, 1, 1, 1, 1, 1,
1.507389, 1.035699, 1.094616, 1, 1, 1, 1, 1,
1.514494, 1.353034, 0.7946393, 1, 1, 1, 1, 1,
1.517141, -0.5200268, 3.618726, 0, 0, 1, 1, 1,
1.526133, -0.6410198, 2.237101, 1, 0, 0, 1, 1,
1.526584, -1.33818, 3.912232, 1, 0, 0, 1, 1,
1.528941, 0.984775, 0.9021106, 1, 0, 0, 1, 1,
1.53411, 0.9600698, -0.1296078, 1, 0, 0, 1, 1,
1.535486, 1.288971, 1.69995, 1, 0, 0, 1, 1,
1.537651, 0.6785896, 2.052184, 0, 0, 0, 1, 1,
1.542628, 0.09736675, 0.8469625, 0, 0, 0, 1, 1,
1.556857, 1.491378, -0.4878221, 0, 0, 0, 1, 1,
1.564862, 0.0223392, 2.063968, 0, 0, 0, 1, 1,
1.579183, -0.952472, 1.010643, 0, 0, 0, 1, 1,
1.58655, 1.438271, 2.149004, 0, 0, 0, 1, 1,
1.608663, 1.676859, -0.2111852, 0, 0, 0, 1, 1,
1.627021, -0.08436994, 3.198639, 1, 1, 1, 1, 1,
1.641733, 0.7477145, 2.226275, 1, 1, 1, 1, 1,
1.648579, 0.1157652, 2.138804, 1, 1, 1, 1, 1,
1.649304, 0.02437251, 1.057894, 1, 1, 1, 1, 1,
1.651876, -0.3549072, 1.84507, 1, 1, 1, 1, 1,
1.667982, 1.87001, 0.128011, 1, 1, 1, 1, 1,
1.673135, 0.3015173, 1.223368, 1, 1, 1, 1, 1,
1.684885, 1.608545, 1.543465, 1, 1, 1, 1, 1,
1.707753, -0.5000629, 1.203569, 1, 1, 1, 1, 1,
1.71491, 0.1389036, 2.164772, 1, 1, 1, 1, 1,
1.715482, -0.5693195, 1.383135, 1, 1, 1, 1, 1,
1.715621, 2.802086, 0.8689215, 1, 1, 1, 1, 1,
1.715657, -0.7234713, 0.3699751, 1, 1, 1, 1, 1,
1.718731, -1.3934, 1.385254, 1, 1, 1, 1, 1,
1.722347, 0.6970343, -0.3558981, 1, 1, 1, 1, 1,
1.727032, -1.78928, 1.957469, 0, 0, 1, 1, 1,
1.730213, -1.891393, 4.052557, 1, 0, 0, 1, 1,
1.736506, 0.279902, 1.587831, 1, 0, 0, 1, 1,
1.738107, -1.254271, 1.808523, 1, 0, 0, 1, 1,
1.738558, -0.1051837, 1.540757, 1, 0, 0, 1, 1,
1.741189, 0.450739, 2.38043, 1, 0, 0, 1, 1,
1.743441, 1.59827, 1.62312, 0, 0, 0, 1, 1,
1.780831, 0.8051127, 1.454604, 0, 0, 0, 1, 1,
1.831137, 0.7164047, 0.6752585, 0, 0, 0, 1, 1,
1.852533, 0.1817489, 3.582627, 0, 0, 0, 1, 1,
1.867527, 0.0879937, 1.561347, 0, 0, 0, 1, 1,
1.870493, 0.05645759, 2.083407, 0, 0, 0, 1, 1,
1.876021, 0.07590492, 2.787329, 0, 0, 0, 1, 1,
1.887073, -0.4727074, 1.947621, 1, 1, 1, 1, 1,
1.892835, 2.013136, 1.999673, 1, 1, 1, 1, 1,
1.910536, 1.254545, 0.427799, 1, 1, 1, 1, 1,
1.914582, -0.03844201, 0.6613433, 1, 1, 1, 1, 1,
1.954009, 0.1766434, 3.023566, 1, 1, 1, 1, 1,
1.961062, 0.7592595, 0.8701426, 1, 1, 1, 1, 1,
1.998617, 0.31431, 0.4304203, 1, 1, 1, 1, 1,
2.007667, -0.08695165, 1.812283, 1, 1, 1, 1, 1,
2.032297, 0.2471409, 1.586224, 1, 1, 1, 1, 1,
2.037659, 0.07390784, 0.2881906, 1, 1, 1, 1, 1,
2.071751, 1.248637, 2.489051, 1, 1, 1, 1, 1,
2.072911, 1.26941, 1.633103, 1, 1, 1, 1, 1,
2.1077, 0.7407952, -0.03527684, 1, 1, 1, 1, 1,
2.129616, -1.578429, 2.908945, 1, 1, 1, 1, 1,
2.132552, 0.003421962, 3.109416, 1, 1, 1, 1, 1,
2.157161, -1.256556, 1.754027, 0, 0, 1, 1, 1,
2.171829, -0.1081098, 2.23548, 1, 0, 0, 1, 1,
2.24443, -1.338561, 2.012058, 1, 0, 0, 1, 1,
2.259911, -0.6085675, 1.497651, 1, 0, 0, 1, 1,
2.284325, -0.07582534, 2.532882, 1, 0, 0, 1, 1,
2.315058, 2.086196, 1.51165, 1, 0, 0, 1, 1,
2.355084, 1.158651, 1.089442, 0, 0, 0, 1, 1,
2.453053, -2.03612, 2.910165, 0, 0, 0, 1, 1,
2.53561, 0.3890843, 2.591283, 0, 0, 0, 1, 1,
2.599556, 0.4080372, 1.513503, 0, 0, 0, 1, 1,
2.729513, -0.407551, 1.004835, 0, 0, 0, 1, 1,
2.749379, -0.3070472, 2.121426, 0, 0, 0, 1, 1,
2.767073, 0.7722508, 0.8408852, 0, 0, 0, 1, 1,
2.81072, 0.01100822, 2.422282, 1, 1, 1, 1, 1,
2.831241, 0.554269, 0.1310394, 1, 1, 1, 1, 1,
2.955457, -1.530338, 1.236878, 1, 1, 1, 1, 1,
2.978145, -1.189731, 2.559154, 1, 1, 1, 1, 1,
3.138754, 0.3451675, 2.794089, 1, 1, 1, 1, 1,
3.215764, 0.3988061, 0.7157164, 1, 1, 1, 1, 1,
3.216141, -0.1055413, 3.221447, 1, 1, 1, 1, 1
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
var radius = 9.383024;
var distance = 32.95747;
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
mvMatrix.translate( 0.1192777, -0.6748161, 0.2150199 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.95747);
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