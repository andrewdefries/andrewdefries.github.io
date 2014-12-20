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
-2.830375, 0.5968045, -0.8044827, 1, 0, 0, 1,
-2.803213, -0.2914516, -1.813895, 1, 0.007843138, 0, 1,
-2.791906, 0.7840019, -1.134376, 1, 0.01176471, 0, 1,
-2.662268, -1.718659, -3.443352, 1, 0.01960784, 0, 1,
-2.574996, -0.4145927, -3.353524, 1, 0.02352941, 0, 1,
-2.562424, -0.4479174, -2.191478, 1, 0.03137255, 0, 1,
-2.480777, 0.5886972, -2.256697, 1, 0.03529412, 0, 1,
-2.473635, -0.5594741, -1.515229, 1, 0.04313726, 0, 1,
-2.44212, 0.4752263, -0.9270091, 1, 0.04705882, 0, 1,
-2.359921, -0.6093168, -2.101878, 1, 0.05490196, 0, 1,
-2.319928, 0.7908922, -1.451469, 1, 0.05882353, 0, 1,
-2.203507, 0.2036061, -0.8982851, 1, 0.06666667, 0, 1,
-2.19008, -0.1705248, -1.58261, 1, 0.07058824, 0, 1,
-2.161981, 2.355191, 0.2191429, 1, 0.07843138, 0, 1,
-2.126509, 0.2353742, -1.908355, 1, 0.08235294, 0, 1,
-2.090875, -1.358884, -1.672623, 1, 0.09019608, 0, 1,
-2.083525, -1.690249, -4.103933, 1, 0.09411765, 0, 1,
-2.076818, -1.850977, -0.9684027, 1, 0.1019608, 0, 1,
-2.074852, -0.04427293, -0.47389, 1, 0.1098039, 0, 1,
-2.067291, 1.50232, 1.764655, 1, 0.1137255, 0, 1,
-2.03965, -0.08858623, -1.561612, 1, 0.1215686, 0, 1,
-1.966101, -1.397008, -2.139933, 1, 0.1254902, 0, 1,
-1.949364, -1.764519, -3.792783, 1, 0.1333333, 0, 1,
-1.940391, 0.8199694, -2.532818, 1, 0.1372549, 0, 1,
-1.918083, 1.267443, -1.015314, 1, 0.145098, 0, 1,
-1.904816, -0.5067335, -1.85022, 1, 0.1490196, 0, 1,
-1.904652, 0.9486328, -0.8821245, 1, 0.1568628, 0, 1,
-1.890115, -1.335743, -0.9041319, 1, 0.1607843, 0, 1,
-1.884388, -0.3302814, -2.897529, 1, 0.1686275, 0, 1,
-1.871187, -0.3985085, -0.9349943, 1, 0.172549, 0, 1,
-1.870885, -0.5524632, -1.814805, 1, 0.1803922, 0, 1,
-1.860183, 0.7195843, -2.263458, 1, 0.1843137, 0, 1,
-1.858432, 2.386897, -1.884902, 1, 0.1921569, 0, 1,
-1.857668, 0.270468, -2.221611, 1, 0.1960784, 0, 1,
-1.840337, -0.3358511, -1.029696, 1, 0.2039216, 0, 1,
-1.839621, 0.5288094, -0.6565877, 1, 0.2117647, 0, 1,
-1.838645, -0.2573297, -1.856753, 1, 0.2156863, 0, 1,
-1.832174, -0.3536716, -0.2551254, 1, 0.2235294, 0, 1,
-1.821453, 0.5584838, -1.137175, 1, 0.227451, 0, 1,
-1.783082, -0.7538349, -1.929446, 1, 0.2352941, 0, 1,
-1.761327, -0.6444577, -2.157215, 1, 0.2392157, 0, 1,
-1.751115, -0.918254, -0.4452076, 1, 0.2470588, 0, 1,
-1.750812, 0.529621, -0.3413293, 1, 0.2509804, 0, 1,
-1.745788, -0.4261499, -2.332016, 1, 0.2588235, 0, 1,
-1.720509, 1.232095, -1.411582, 1, 0.2627451, 0, 1,
-1.719952, -1.206202, -3.068955, 1, 0.2705882, 0, 1,
-1.714872, 2.042545, -0.6922973, 1, 0.2745098, 0, 1,
-1.711506, 0.5054407, -0.9175809, 1, 0.282353, 0, 1,
-1.708279, -1.385663, 0.2772683, 1, 0.2862745, 0, 1,
-1.700938, 0.6238022, -1.623755, 1, 0.2941177, 0, 1,
-1.695316, -1.013394, -2.371922, 1, 0.3019608, 0, 1,
-1.684208, -0.4638676, -2.087682, 1, 0.3058824, 0, 1,
-1.672322, -1.196962, -2.090998, 1, 0.3137255, 0, 1,
-1.646282, -0.6186194, -1.286075, 1, 0.3176471, 0, 1,
-1.626655, -0.4051245, -0.6287656, 1, 0.3254902, 0, 1,
-1.622743, 0.525132, -2.415252, 1, 0.3294118, 0, 1,
-1.603631, 2.367196, 0.5218543, 1, 0.3372549, 0, 1,
-1.601519, -1.101134, -0.2951736, 1, 0.3411765, 0, 1,
-1.589541, 1.133372, -0.9981204, 1, 0.3490196, 0, 1,
-1.58817, 0.168015, -0.9153084, 1, 0.3529412, 0, 1,
-1.57695, 1.096953, 0.2851747, 1, 0.3607843, 0, 1,
-1.566272, -1.978151, -1.139345, 1, 0.3647059, 0, 1,
-1.565824, 0.6963484, -2.137331, 1, 0.372549, 0, 1,
-1.564772, 0.7754869, -1.234349, 1, 0.3764706, 0, 1,
-1.553329, -1.129013, -2.447889, 1, 0.3843137, 0, 1,
-1.550205, 2.721678, -0.9030641, 1, 0.3882353, 0, 1,
-1.549796, -0.05323233, 0.05516937, 1, 0.3960784, 0, 1,
-1.539902, 0.09269134, -1.544921, 1, 0.4039216, 0, 1,
-1.536133, -1.143672, -0.3671119, 1, 0.4078431, 0, 1,
-1.514266, 1.334003, -2.004811, 1, 0.4156863, 0, 1,
-1.512195, -1.956373, -2.090925, 1, 0.4196078, 0, 1,
-1.493786, -0.8708251, -2.706241, 1, 0.427451, 0, 1,
-1.480278, -0.9972018, -4.160741, 1, 0.4313726, 0, 1,
-1.475498, 0.7754985, -1.538637, 1, 0.4392157, 0, 1,
-1.472543, -1.401807, -2.912812, 1, 0.4431373, 0, 1,
-1.443743, 1.366852, 1.064178, 1, 0.4509804, 0, 1,
-1.434629, -0.2718173, -1.443249, 1, 0.454902, 0, 1,
-1.433472, 0.7901013, 1.016902, 1, 0.4627451, 0, 1,
-1.428169, -1.405654, -2.86009, 1, 0.4666667, 0, 1,
-1.419236, 0.5804373, -1.875156, 1, 0.4745098, 0, 1,
-1.41408, -0.3369542, -1.244896, 1, 0.4784314, 0, 1,
-1.413137, 1.122633, -0.5454631, 1, 0.4862745, 0, 1,
-1.409395, -0.3783498, -3.448586, 1, 0.4901961, 0, 1,
-1.408658, 0.3360707, -2.63675, 1, 0.4980392, 0, 1,
-1.403655, 1.233513, 0.4788244, 1, 0.5058824, 0, 1,
-1.402897, 0.9055846, -1.535991, 1, 0.509804, 0, 1,
-1.397987, -1.557402, -2.135525, 1, 0.5176471, 0, 1,
-1.39703, 1.148389, -1.596728, 1, 0.5215687, 0, 1,
-1.388, 1.225057, -1.200897, 1, 0.5294118, 0, 1,
-1.383856, -0.8000059, -2.648165, 1, 0.5333334, 0, 1,
-1.382332, 2.093075, -1.441062, 1, 0.5411765, 0, 1,
-1.378228, -0.05751635, -1.917399, 1, 0.5450981, 0, 1,
-1.377574, -1.094992, -0.9718823, 1, 0.5529412, 0, 1,
-1.377421, 0.01183461, 0.8573341, 1, 0.5568628, 0, 1,
-1.37281, 0.1600352, -1.340541, 1, 0.5647059, 0, 1,
-1.370279, 0.07692104, -1.073128, 1, 0.5686275, 0, 1,
-1.370114, 0.4425114, -1.487591, 1, 0.5764706, 0, 1,
-1.367904, -0.0996775, -1.415209, 1, 0.5803922, 0, 1,
-1.363247, -0.1453892, -1.840334, 1, 0.5882353, 0, 1,
-1.360062, -1.612821, -3.772363, 1, 0.5921569, 0, 1,
-1.350514, -0.7895314, -1.491585, 1, 0.6, 0, 1,
-1.348355, 2.7908, -0.9259868, 1, 0.6078432, 0, 1,
-1.347479, 0.05295938, -1.766502, 1, 0.6117647, 0, 1,
-1.319951, -0.1955398, -3.35959, 1, 0.6196079, 0, 1,
-1.317243, 0.014942, -1.177177, 1, 0.6235294, 0, 1,
-1.307912, 0.9287919, -1.985417, 1, 0.6313726, 0, 1,
-1.302851, -0.6459783, -3.030476, 1, 0.6352941, 0, 1,
-1.290127, -0.1360508, -1.553841, 1, 0.6431373, 0, 1,
-1.282137, 0.4434983, -2.807111, 1, 0.6470588, 0, 1,
-1.266221, -0.01018478, -1.819854, 1, 0.654902, 0, 1,
-1.25886, 1.256258, -1.318976, 1, 0.6588235, 0, 1,
-1.252574, -0.5078766, -2.789322, 1, 0.6666667, 0, 1,
-1.251538, 0.2621572, -3.30108, 1, 0.6705883, 0, 1,
-1.230161, -0.7487122, -2.751398, 1, 0.6784314, 0, 1,
-1.230048, -0.6606324, -0.4541751, 1, 0.682353, 0, 1,
-1.230033, 1.114551, -1.684878, 1, 0.6901961, 0, 1,
-1.226835, -0.5550507, -1.732701, 1, 0.6941177, 0, 1,
-1.223666, -0.2460219, -3.061876, 1, 0.7019608, 0, 1,
-1.218164, 0.7085379, -1.944455, 1, 0.7098039, 0, 1,
-1.216301, 0.5088863, -2.138276, 1, 0.7137255, 0, 1,
-1.212043, -0.7490205, -0.9599434, 1, 0.7215686, 0, 1,
-1.21198, 0.4667932, -0.3578781, 1, 0.7254902, 0, 1,
-1.208727, -0.6679851, -1.93266, 1, 0.7333333, 0, 1,
-1.19551, 0.8683162, 1.699394, 1, 0.7372549, 0, 1,
-1.178909, -0.1451212, -1.93528, 1, 0.7450981, 0, 1,
-1.16193, 0.856436, -2.258083, 1, 0.7490196, 0, 1,
-1.150568, -0.8012549, -2.612262, 1, 0.7568628, 0, 1,
-1.144383, -0.7170697, -0.946451, 1, 0.7607843, 0, 1,
-1.143974, -1.636661, -2.181512, 1, 0.7686275, 0, 1,
-1.138348, 0.4776117, -1.550911, 1, 0.772549, 0, 1,
-1.135682, -0.5596149, -2.684948, 1, 0.7803922, 0, 1,
-1.133831, 0.3116786, -2.026487, 1, 0.7843137, 0, 1,
-1.115939, 0.9554678, -1.163416, 1, 0.7921569, 0, 1,
-1.109124, -0.09557865, -1.947479, 1, 0.7960784, 0, 1,
-1.108285, -1.315579, -3.433815, 1, 0.8039216, 0, 1,
-1.107584, -0.2476079, -3.243202, 1, 0.8117647, 0, 1,
-1.103675, -0.9599231, -2.120462, 1, 0.8156863, 0, 1,
-1.10007, -1.647066, -0.8657649, 1, 0.8235294, 0, 1,
-1.098209, 0.5718197, -0.03960714, 1, 0.827451, 0, 1,
-1.095609, 0.358647, -0.9927141, 1, 0.8352941, 0, 1,
-1.088048, 1.972612, 1.363151, 1, 0.8392157, 0, 1,
-1.078877, 0.661136, -0.3716147, 1, 0.8470588, 0, 1,
-1.073227, -0.5719187, -3.613645, 1, 0.8509804, 0, 1,
-1.067959, 0.09427293, -2.506013, 1, 0.8588235, 0, 1,
-1.067276, -0.9746148, -2.136289, 1, 0.8627451, 0, 1,
-1.057579, 1.004335, -0.09341998, 1, 0.8705882, 0, 1,
-1.054952, 0.3344233, -1.563865, 1, 0.8745098, 0, 1,
-1.050805, 0.3634431, 1.070712, 1, 0.8823529, 0, 1,
-1.038197, -0.4938715, -2.947455, 1, 0.8862745, 0, 1,
-1.030365, -1.701, -2.725343, 1, 0.8941177, 0, 1,
-1.029782, -0.1918501, -1.50251, 1, 0.8980392, 0, 1,
-1.027216, -0.731277, -2.44192, 1, 0.9058824, 0, 1,
-1.026422, -1.61866, -2.170827, 1, 0.9137255, 0, 1,
-1.01936, 2.363648, -1.590145, 1, 0.9176471, 0, 1,
-1.01453, -0.4388218, -1.595016, 1, 0.9254902, 0, 1,
-1.009402, -0.2014409, -1.096485, 1, 0.9294118, 0, 1,
-1.009074, 1.198878, -0.8837756, 1, 0.9372549, 0, 1,
-1.008135, 0.109032, -2.734374, 1, 0.9411765, 0, 1,
-0.9990265, 0.4879223, -0.2828235, 1, 0.9490196, 0, 1,
-0.9985923, -0.8903247, -0.5997556, 1, 0.9529412, 0, 1,
-0.9961451, -0.4972357, -2.737019, 1, 0.9607843, 0, 1,
-0.9842373, 1.556179, 0.8759116, 1, 0.9647059, 0, 1,
-0.9824574, -1.980432, -3.432376, 1, 0.972549, 0, 1,
-0.9701768, -0.6799042, -2.309988, 1, 0.9764706, 0, 1,
-0.9696822, 0.7714827, -0.4319978, 1, 0.9843137, 0, 1,
-0.9687758, 0.4871124, -1.412558, 1, 0.9882353, 0, 1,
-0.9647119, 0.1085612, -0.9524642, 1, 0.9960784, 0, 1,
-0.9623278, -0.7219143, -2.80405, 0.9960784, 1, 0, 1,
-0.9544188, -0.7058145, -1.997471, 0.9921569, 1, 0, 1,
-0.9530697, -1.565586, -2.061461, 0.9843137, 1, 0, 1,
-0.9491896, 2.121596, -0.7296523, 0.9803922, 1, 0, 1,
-0.936181, -0.6902128, -2.432809, 0.972549, 1, 0, 1,
-0.9201229, 0.4449729, -1.341626, 0.9686275, 1, 0, 1,
-0.9200247, 0.02207756, -1.754142, 0.9607843, 1, 0, 1,
-0.9177051, -0.5566617, -2.102423, 0.9568627, 1, 0, 1,
-0.9064518, 1.320766, 0.7172975, 0.9490196, 1, 0, 1,
-0.9033628, 1.451637, 0.09965654, 0.945098, 1, 0, 1,
-0.8997852, 1.643654, -2.15481, 0.9372549, 1, 0, 1,
-0.8997087, 0.02671779, -1.48691, 0.9333333, 1, 0, 1,
-0.8963864, -1.122878, -4.740142, 0.9254902, 1, 0, 1,
-0.8955467, -1.161414, -1.951789, 0.9215686, 1, 0, 1,
-0.8871058, -0.6440471, -1.339718, 0.9137255, 1, 0, 1,
-0.8840305, 1.592021, 0.8275464, 0.9098039, 1, 0, 1,
-0.8820031, -0.0117286, -0.4703154, 0.9019608, 1, 0, 1,
-0.8810671, -0.1298605, -2.651683, 0.8941177, 1, 0, 1,
-0.8786107, 0.2611687, -2.7837, 0.8901961, 1, 0, 1,
-0.8739038, -0.09766727, -3.537094, 0.8823529, 1, 0, 1,
-0.8690572, 0.8772324, -0.1757457, 0.8784314, 1, 0, 1,
-0.8610219, -0.1587783, -1.868189, 0.8705882, 1, 0, 1,
-0.8548127, 0.8981912, 0.440242, 0.8666667, 1, 0, 1,
-0.8504121, 2.953517, 0.2340741, 0.8588235, 1, 0, 1,
-0.8464875, 1.909579, -1.544055, 0.854902, 1, 0, 1,
-0.8460785, -0.7033509, -2.322477, 0.8470588, 1, 0, 1,
-0.8441842, 1.342722, 0.1353127, 0.8431373, 1, 0, 1,
-0.8414508, -1.189366, -2.329343, 0.8352941, 1, 0, 1,
-0.8244411, 0.3154511, -3.031242, 0.8313726, 1, 0, 1,
-0.815002, -0.3439979, -2.045882, 0.8235294, 1, 0, 1,
-0.8145765, 0.4590303, -1.943147, 0.8196079, 1, 0, 1,
-0.8117141, -1.213802, -2.808922, 0.8117647, 1, 0, 1,
-0.805945, 0.647516, 0.4812251, 0.8078431, 1, 0, 1,
-0.8043544, 0.2429205, -2.920891, 0.8, 1, 0, 1,
-0.8043069, 0.1789508, -1.457735, 0.7921569, 1, 0, 1,
-0.7879359, 1.830182, 1.587068, 0.7882353, 1, 0, 1,
-0.7866611, 0.9493225, -0.1937378, 0.7803922, 1, 0, 1,
-0.7863411, -0.3058376, -0.4373586, 0.7764706, 1, 0, 1,
-0.78195, -0.877049, -3.113991, 0.7686275, 1, 0, 1,
-0.7662018, 0.5647147, 0.1909422, 0.7647059, 1, 0, 1,
-0.7624493, 1.558887, -1.92551, 0.7568628, 1, 0, 1,
-0.760551, 0.4710126, -1.951416, 0.7529412, 1, 0, 1,
-0.7570251, 1.265867, 0.7287581, 0.7450981, 1, 0, 1,
-0.7554374, 0.3336803, -2.695033, 0.7411765, 1, 0, 1,
-0.7466447, -0.808708, -0.9787176, 0.7333333, 1, 0, 1,
-0.7436146, -0.1126016, -0.9181903, 0.7294118, 1, 0, 1,
-0.7415437, -0.583758, -2.644839, 0.7215686, 1, 0, 1,
-0.741492, -0.6094564, -2.880255, 0.7176471, 1, 0, 1,
-0.7411084, 1.609367, -2.177864, 0.7098039, 1, 0, 1,
-0.7404898, -0.5019594, -1.647104, 0.7058824, 1, 0, 1,
-0.7388052, -1.44603, -2.333994, 0.6980392, 1, 0, 1,
-0.7387342, 1.081879, 0.03802795, 0.6901961, 1, 0, 1,
-0.7366379, -0.9777268, -2.982687, 0.6862745, 1, 0, 1,
-0.7310175, 1.134293, -0.7923005, 0.6784314, 1, 0, 1,
-0.7291784, 1.022022, -0.7881066, 0.6745098, 1, 0, 1,
-0.7289976, 0.8229194, -1.45133, 0.6666667, 1, 0, 1,
-0.7279907, 0.8453369, -0.4869182, 0.6627451, 1, 0, 1,
-0.7277671, -0.4574902, -0.5848264, 0.654902, 1, 0, 1,
-0.7273729, 0.9908652, -1.026305, 0.6509804, 1, 0, 1,
-0.7271941, -1.306854, -3.561947, 0.6431373, 1, 0, 1,
-0.7253058, 1.345665, 0.1136919, 0.6392157, 1, 0, 1,
-0.7229998, -0.5065385, -1.343505, 0.6313726, 1, 0, 1,
-0.7222331, 0.5082517, -0.3941607, 0.627451, 1, 0, 1,
-0.7202118, -0.304235, -0.6808435, 0.6196079, 1, 0, 1,
-0.7198425, -0.4659781, -1.797816, 0.6156863, 1, 0, 1,
-0.7192762, 0.8106014, -0.6666189, 0.6078432, 1, 0, 1,
-0.7187829, -0.5454098, -1.849993, 0.6039216, 1, 0, 1,
-0.7173026, 0.3041492, -2.142026, 0.5960785, 1, 0, 1,
-0.7132623, -1.074367, -1.9226, 0.5882353, 1, 0, 1,
-0.7082583, -1.017385, -4.160944, 0.5843138, 1, 0, 1,
-0.7050044, -0.2712988, -2.994758, 0.5764706, 1, 0, 1,
-0.6994773, -1.777742, -1.933311, 0.572549, 1, 0, 1,
-0.6984639, -1.116312, -1.667188, 0.5647059, 1, 0, 1,
-0.6982879, 0.6674647, 0.601763, 0.5607843, 1, 0, 1,
-0.6974008, -0.9237646, -2.666333, 0.5529412, 1, 0, 1,
-0.6933268, -1.044177, -2.704011, 0.5490196, 1, 0, 1,
-0.6930851, -0.3655973, -3.290354, 0.5411765, 1, 0, 1,
-0.6923704, 1.046656, -3.019882, 0.5372549, 1, 0, 1,
-0.6848536, 0.1533896, -1.372918, 0.5294118, 1, 0, 1,
-0.6838895, 2.524132, 0.04057238, 0.5254902, 1, 0, 1,
-0.6745685, 0.4373684, -0.06249925, 0.5176471, 1, 0, 1,
-0.673833, 0.2101994, -1.504439, 0.5137255, 1, 0, 1,
-0.6673106, -1.42632, -2.867418, 0.5058824, 1, 0, 1,
-0.6656337, 0.6709839, 0.3998104, 0.5019608, 1, 0, 1,
-0.6655918, -1.098316, -3.49702, 0.4941176, 1, 0, 1,
-0.657865, -0.2912577, -0.6868909, 0.4862745, 1, 0, 1,
-0.6566547, -0.4506043, -1.779357, 0.4823529, 1, 0, 1,
-0.6561232, -0.102759, -3.529363, 0.4745098, 1, 0, 1,
-0.6510604, -0.0726637, -1.730219, 0.4705882, 1, 0, 1,
-0.6483212, 2.561018, 0.7481599, 0.4627451, 1, 0, 1,
-0.6473962, -0.185175, -2.447671, 0.4588235, 1, 0, 1,
-0.6431012, -1.337731, -2.394484, 0.4509804, 1, 0, 1,
-0.6407635, 0.6115846, -0.952246, 0.4470588, 1, 0, 1,
-0.6393185, 0.4514573, -1.062846, 0.4392157, 1, 0, 1,
-0.6390204, -0.3900179, -1.201953, 0.4352941, 1, 0, 1,
-0.6388766, -0.4522606, -1.413382, 0.427451, 1, 0, 1,
-0.6385845, 0.2281218, -1.106096, 0.4235294, 1, 0, 1,
-0.6382389, -0.9486272, -2.23379, 0.4156863, 1, 0, 1,
-0.6330671, -0.4421225, -3.225019, 0.4117647, 1, 0, 1,
-0.6304141, 1.362279, 0.2788921, 0.4039216, 1, 0, 1,
-0.6259977, -0.6851829, -0.9564162, 0.3960784, 1, 0, 1,
-0.6220528, -1.155988, -3.032556, 0.3921569, 1, 0, 1,
-0.6081629, 0.2342883, -1.85116, 0.3843137, 1, 0, 1,
-0.6076084, 2.031829, -0.4849812, 0.3803922, 1, 0, 1,
-0.6035503, -2.110202, -2.796184, 0.372549, 1, 0, 1,
-0.5988836, 0.6214521, -0.3785731, 0.3686275, 1, 0, 1,
-0.5984586, 0.3496268, 0.02475794, 0.3607843, 1, 0, 1,
-0.594447, -0.7778184, -1.870569, 0.3568628, 1, 0, 1,
-0.5938565, 1.055298, 1.063454, 0.3490196, 1, 0, 1,
-0.5923007, -0.311727, -2.386096, 0.345098, 1, 0, 1,
-0.5914403, -0.8063523, -0.7291066, 0.3372549, 1, 0, 1,
-0.5909662, -0.7475352, -2.468267, 0.3333333, 1, 0, 1,
-0.589404, 1.679611, 0.3294963, 0.3254902, 1, 0, 1,
-0.5816482, -0.4470913, -1.527433, 0.3215686, 1, 0, 1,
-0.5810717, 0.2878236, -0.2215987, 0.3137255, 1, 0, 1,
-0.5805895, -1.045467, -3.12224, 0.3098039, 1, 0, 1,
-0.5768078, -0.1323907, -0.9541109, 0.3019608, 1, 0, 1,
-0.5749763, 1.46473, 0.2584492, 0.2941177, 1, 0, 1,
-0.5729645, 0.8406997, 1.2882, 0.2901961, 1, 0, 1,
-0.5697613, -1.506486, -2.761801, 0.282353, 1, 0, 1,
-0.5592194, 0.2486902, -3.325176, 0.2784314, 1, 0, 1,
-0.5565804, 0.1258089, -0.5323243, 0.2705882, 1, 0, 1,
-0.5552157, 1.753049, -2.097233, 0.2666667, 1, 0, 1,
-0.5536111, 0.2615628, -1.25999, 0.2588235, 1, 0, 1,
-0.5446584, 1.016963, -0.1259484, 0.254902, 1, 0, 1,
-0.5437455, -1.243629, -2.195735, 0.2470588, 1, 0, 1,
-0.5432224, 0.3373569, -2.233078, 0.2431373, 1, 0, 1,
-0.5282962, -0.05561274, -3.372729, 0.2352941, 1, 0, 1,
-0.5219494, -0.2783226, -2.17433, 0.2313726, 1, 0, 1,
-0.5214366, 0.5364085, -0.4875106, 0.2235294, 1, 0, 1,
-0.5188944, 0.2772379, 1.360181, 0.2196078, 1, 0, 1,
-0.5138056, -2.107397, -1.958426, 0.2117647, 1, 0, 1,
-0.5118818, 1.852875, -1.719581, 0.2078431, 1, 0, 1,
-0.5110395, -1.164814, -2.799709, 0.2, 1, 0, 1,
-0.5089381, 0.6475493, -0.3771647, 0.1921569, 1, 0, 1,
-0.5054693, -0.3641472, -2.090329, 0.1882353, 1, 0, 1,
-0.5024886, -0.5869229, -2.219692, 0.1803922, 1, 0, 1,
-0.4991046, 0.02773092, -3.444576, 0.1764706, 1, 0, 1,
-0.4982036, 1.417354, -1.19612, 0.1686275, 1, 0, 1,
-0.4965654, -0.2848907, -3.00363, 0.1647059, 1, 0, 1,
-0.4943102, 1.438966, -0.6681291, 0.1568628, 1, 0, 1,
-0.4934122, -0.5142236, -1.726482, 0.1529412, 1, 0, 1,
-0.4927787, -0.08622414, -1.675176, 0.145098, 1, 0, 1,
-0.4890702, -0.05208013, -2.455002, 0.1411765, 1, 0, 1,
-0.4857697, -0.4907528, -2.042671, 0.1333333, 1, 0, 1,
-0.4816414, 0.5941265, 0.3401533, 0.1294118, 1, 0, 1,
-0.4809627, -0.3438733, -0.8639256, 0.1215686, 1, 0, 1,
-0.4747742, -1.264545, -4.145544, 0.1176471, 1, 0, 1,
-0.4732455, 1.365469, 0.3082229, 0.1098039, 1, 0, 1,
-0.4727416, -0.3895268, -2.725522, 0.1058824, 1, 0, 1,
-0.4635954, -1.880167, -2.852502, 0.09803922, 1, 0, 1,
-0.4585953, 0.5342211, -2.108638, 0.09019608, 1, 0, 1,
-0.4513588, 1.543017, 0.3812657, 0.08627451, 1, 0, 1,
-0.4502863, 0.5322869, -2.083989, 0.07843138, 1, 0, 1,
-0.450062, 1.332913, -0.4715915, 0.07450981, 1, 0, 1,
-0.4446826, 0.9368862, -1.100304, 0.06666667, 1, 0, 1,
-0.437088, 0.3320455, 0.8880047, 0.0627451, 1, 0, 1,
-0.4361548, 2.014186, -0.09746756, 0.05490196, 1, 0, 1,
-0.4338336, 0.9511767, -2.398217, 0.05098039, 1, 0, 1,
-0.4334142, 0.5706013, 0.4674047, 0.04313726, 1, 0, 1,
-0.4322344, 2.64419, -0.6649185, 0.03921569, 1, 0, 1,
-0.4318634, 0.2521332, -1.953739, 0.03137255, 1, 0, 1,
-0.4277446, -0.5184066, -1.374429, 0.02745098, 1, 0, 1,
-0.4252016, 1.305747, -1.43014, 0.01960784, 1, 0, 1,
-0.4191782, 0.06872023, -2.409285, 0.01568628, 1, 0, 1,
-0.4188884, 0.01904336, -2.528877, 0.007843138, 1, 0, 1,
-0.4142464, -0.1639122, -3.625793, 0.003921569, 1, 0, 1,
-0.4139548, 1.690226, -0.2748086, 0, 1, 0.003921569, 1,
-0.4122626, 0.1560633, -0.587686, 0, 1, 0.01176471, 1,
-0.4081074, 1.122881, -0.05868265, 0, 1, 0.01568628, 1,
-0.4036763, -2.333363, -4.445752, 0, 1, 0.02352941, 1,
-0.4029887, 1.947741, -1.722254, 0, 1, 0.02745098, 1,
-0.4003778, 0.191107, -1.092997, 0, 1, 0.03529412, 1,
-0.3963273, -0.5122711, -2.36536, 0, 1, 0.03921569, 1,
-0.3941329, -0.3508374, -2.674097, 0, 1, 0.04705882, 1,
-0.3940652, 0.3718453, -0.543968, 0, 1, 0.05098039, 1,
-0.3889343, -0.4512341, -1.641204, 0, 1, 0.05882353, 1,
-0.3846288, -1.581429, -3.893883, 0, 1, 0.0627451, 1,
-0.3811739, 0.956822, 1.125108, 0, 1, 0.07058824, 1,
-0.3783665, -0.2467895, -2.36542, 0, 1, 0.07450981, 1,
-0.3743525, -0.3172457, -2.919748, 0, 1, 0.08235294, 1,
-0.374243, -0.8451187, -2.99265, 0, 1, 0.08627451, 1,
-0.3725164, 1.328783, 0.1488336, 0, 1, 0.09411765, 1,
-0.3724552, -1.925, -3.330073, 0, 1, 0.1019608, 1,
-0.3612783, 0.2192154, -0.3255377, 0, 1, 0.1058824, 1,
-0.3601103, -0.6248562, -2.939667, 0, 1, 0.1137255, 1,
-0.3590142, -0.8681294, -3.687057, 0, 1, 0.1176471, 1,
-0.3529721, -1.501984, -2.914853, 0, 1, 0.1254902, 1,
-0.3527323, 0.298854, -0.1881184, 0, 1, 0.1294118, 1,
-0.3490156, 0.399942, -1.997703, 0, 1, 0.1372549, 1,
-0.3462824, -0.4889024, -2.298511, 0, 1, 0.1411765, 1,
-0.3460918, -0.6645856, -2.642248, 0, 1, 0.1490196, 1,
-0.3449735, 0.678518, -0.4698419, 0, 1, 0.1529412, 1,
-0.3442251, -1.443905, -3.362567, 0, 1, 0.1607843, 1,
-0.3430004, -1.115969, -1.111393, 0, 1, 0.1647059, 1,
-0.3407911, -0.5498227, -1.849399, 0, 1, 0.172549, 1,
-0.3407868, -0.3209477, -2.653574, 0, 1, 0.1764706, 1,
-0.3322997, -0.7496242, -0.8103723, 0, 1, 0.1843137, 1,
-0.3315824, 1.45868, 0.03431142, 0, 1, 0.1882353, 1,
-0.3304518, 0.2559224, -1.075268, 0, 1, 0.1960784, 1,
-0.3284974, -1.321267, -4.196489, 0, 1, 0.2039216, 1,
-0.3269936, 0.02621554, -0.549324, 0, 1, 0.2078431, 1,
-0.3264017, -1.250153, -1.506953, 0, 1, 0.2156863, 1,
-0.3260976, -0.2362837, -2.017688, 0, 1, 0.2196078, 1,
-0.3258992, -1.679095, -3.928488, 0, 1, 0.227451, 1,
-0.3249944, 0.6086175, 0.8907967, 0, 1, 0.2313726, 1,
-0.3133696, 0.07773494, -0.277878, 0, 1, 0.2392157, 1,
-0.310086, -0.4483235, -3.021379, 0, 1, 0.2431373, 1,
-0.3098168, 1.37794, -0.732609, 0, 1, 0.2509804, 1,
-0.309182, 1.617323, -0.370687, 0, 1, 0.254902, 1,
-0.3086065, 0.8327142, -0.6802741, 0, 1, 0.2627451, 1,
-0.3032289, -0.07551277, -3.048779, 0, 1, 0.2666667, 1,
-0.3004105, -1.901437, -4.226492, 0, 1, 0.2745098, 1,
-0.2995586, -1.055662, -4.846301, 0, 1, 0.2784314, 1,
-0.2954437, -1.483386, -6.12827, 0, 1, 0.2862745, 1,
-0.2938246, 0.03220962, -3.848146, 0, 1, 0.2901961, 1,
-0.2910169, -0.5549212, -4.456407, 0, 1, 0.2980392, 1,
-0.2903727, 0.2235707, -2.148021, 0, 1, 0.3058824, 1,
-0.2901991, -0.2826052, 0.3893997, 0, 1, 0.3098039, 1,
-0.2899129, 0.2782374, -0.01428275, 0, 1, 0.3176471, 1,
-0.2873071, -0.5717552, -3.644074, 0, 1, 0.3215686, 1,
-0.2844919, 0.3506534, -1.545163, 0, 1, 0.3294118, 1,
-0.2824454, 0.009895202, -1.945883, 0, 1, 0.3333333, 1,
-0.2818385, 0.8210132, 0.9297204, 0, 1, 0.3411765, 1,
-0.2818194, -1.187549, -1.889348, 0, 1, 0.345098, 1,
-0.2816561, -2.180663, -2.740139, 0, 1, 0.3529412, 1,
-0.2757684, 0.2799218, -0.9087289, 0, 1, 0.3568628, 1,
-0.274623, -0.9403948, -1.818321, 0, 1, 0.3647059, 1,
-0.2743962, 0.3190807, -0.5297631, 0, 1, 0.3686275, 1,
-0.2711837, 0.2447739, -2.693653, 0, 1, 0.3764706, 1,
-0.2686664, -1.052863, -3.662238, 0, 1, 0.3803922, 1,
-0.2650767, 0.5383751, 1.467458, 0, 1, 0.3882353, 1,
-0.263748, -0.5403144, -3.439995, 0, 1, 0.3921569, 1,
-0.261805, 0.2209526, -1.947752, 0, 1, 0.4, 1,
-0.2607402, 0.8010685, 1.052396, 0, 1, 0.4078431, 1,
-0.2602841, -1.919011, -3.858219, 0, 1, 0.4117647, 1,
-0.2601887, -0.8684875, -0.5638106, 0, 1, 0.4196078, 1,
-0.2597467, -1.018856, -1.184534, 0, 1, 0.4235294, 1,
-0.2562422, -1.023322, -2.56338, 0, 1, 0.4313726, 1,
-0.2554399, 0.6933615, 0.2164816, 0, 1, 0.4352941, 1,
-0.2504987, -2.332631, -6.712281, 0, 1, 0.4431373, 1,
-0.2430558, -0.9172941, -2.990621, 0, 1, 0.4470588, 1,
-0.2426105, 0.3179943, -1.148105, 0, 1, 0.454902, 1,
-0.2393979, -0.8748492, -1.333622, 0, 1, 0.4588235, 1,
-0.2364436, 1.202397, 0.7919329, 0, 1, 0.4666667, 1,
-0.236291, 1.671016, 0.1828161, 0, 1, 0.4705882, 1,
-0.2361452, -1.309551, -2.749126, 0, 1, 0.4784314, 1,
-0.2306608, 0.6840446, 1.086507, 0, 1, 0.4823529, 1,
-0.2302435, -0.5533206, -0.07095268, 0, 1, 0.4901961, 1,
-0.2299257, 0.1189423, -0.9665648, 0, 1, 0.4941176, 1,
-0.2290742, 0.5656268, -0.3461646, 0, 1, 0.5019608, 1,
-0.2289559, 0.4471205, -1.054434, 0, 1, 0.509804, 1,
-0.2285089, -2.061164, -2.621659, 0, 1, 0.5137255, 1,
-0.2275349, 1.624124, -1.455843, 0, 1, 0.5215687, 1,
-0.2272948, -0.3134071, -2.196654, 0, 1, 0.5254902, 1,
-0.2210993, 1.057509, -0.6699966, 0, 1, 0.5333334, 1,
-0.2203965, 1.213042, -0.2869855, 0, 1, 0.5372549, 1,
-0.2203914, 0.2681073, -1.310047, 0, 1, 0.5450981, 1,
-0.2191769, 0.1529876, -0.06282838, 0, 1, 0.5490196, 1,
-0.2148654, 0.252328, 1.00534, 0, 1, 0.5568628, 1,
-0.2117092, -1.336669, -3.367329, 0, 1, 0.5607843, 1,
-0.2095511, 1.046935, -0.3428094, 0, 1, 0.5686275, 1,
-0.2016097, -1.269411, -3.415052, 0, 1, 0.572549, 1,
-0.1999893, -0.4513862, -3.808741, 0, 1, 0.5803922, 1,
-0.1999462, 2.682845, -1.409516, 0, 1, 0.5843138, 1,
-0.1991253, -0.2607076, -3.285224, 0, 1, 0.5921569, 1,
-0.1976624, 0.2572138, -0.6669295, 0, 1, 0.5960785, 1,
-0.1971484, 0.7195692, -0.1323872, 0, 1, 0.6039216, 1,
-0.1948746, -0.9900073, -1.597136, 0, 1, 0.6117647, 1,
-0.194554, 0.2736735, -0.05683405, 0, 1, 0.6156863, 1,
-0.1911015, 0.5941133, -0.8789497, 0, 1, 0.6235294, 1,
-0.1885101, -1.848862, -2.965501, 0, 1, 0.627451, 1,
-0.1862921, -0.8338589, -3.251514, 0, 1, 0.6352941, 1,
-0.1811849, 0.4951712, -1.347988, 0, 1, 0.6392157, 1,
-0.1810339, 0.2047125, -0.01538815, 0, 1, 0.6470588, 1,
-0.1797548, 1.836891, -0.1017561, 0, 1, 0.6509804, 1,
-0.169813, 0.1671546, -1.965201, 0, 1, 0.6588235, 1,
-0.1676378, 0.8436522, -1.752241, 0, 1, 0.6627451, 1,
-0.1650845, -1.057065, -3.885105, 0, 1, 0.6705883, 1,
-0.1638807, 0.9926921, -0.553071, 0, 1, 0.6745098, 1,
-0.1591309, -2.691219, -2.706074, 0, 1, 0.682353, 1,
-0.1550944, -1.141775, -3.45601, 0, 1, 0.6862745, 1,
-0.1530749, 0.9572946, -0.5000318, 0, 1, 0.6941177, 1,
-0.1527307, -0.3683648, -2.198605, 0, 1, 0.7019608, 1,
-0.152286, -0.5534548, -1.123367, 0, 1, 0.7058824, 1,
-0.1457522, -1.4768, -4.061802, 0, 1, 0.7137255, 1,
-0.1442595, 0.5190884, 0.9726541, 0, 1, 0.7176471, 1,
-0.1438478, 1.187987, -0.07066722, 0, 1, 0.7254902, 1,
-0.1435311, -0.6339541, -3.053811, 0, 1, 0.7294118, 1,
-0.137013, -0.9723638, -2.162989, 0, 1, 0.7372549, 1,
-0.1317074, -0.2678353, -1.917801, 0, 1, 0.7411765, 1,
-0.1305485, 0.01767138, -0.06945863, 0, 1, 0.7490196, 1,
-0.124476, 0.8287647, 0.4481346, 0, 1, 0.7529412, 1,
-0.1225853, -0.5336219, -3.474707, 0, 1, 0.7607843, 1,
-0.1219612, 0.09947453, -0.7575201, 0, 1, 0.7647059, 1,
-0.1168769, -0.5876427, -3.817455, 0, 1, 0.772549, 1,
-0.1165328, -1.584868, -3.138104, 0, 1, 0.7764706, 1,
-0.1157748, 0.3749361, 0.03281165, 0, 1, 0.7843137, 1,
-0.1142963, 0.5507542, 0.3569536, 0, 1, 0.7882353, 1,
-0.1087071, 0.4462714, 0.735277, 0, 1, 0.7960784, 1,
-0.1054091, -0.6659144, -3.191994, 0, 1, 0.8039216, 1,
-0.104077, 1.639853, 0.1087781, 0, 1, 0.8078431, 1,
-0.1022118, -0.913916, -2.512992, 0, 1, 0.8156863, 1,
-0.09939677, -0.05004771, -2.688071, 0, 1, 0.8196079, 1,
-0.09865913, 3.326954, 1.076115, 0, 1, 0.827451, 1,
-0.09695173, 0.1780907, -0.09190069, 0, 1, 0.8313726, 1,
-0.09650451, 1.177845, -0.0477028, 0, 1, 0.8392157, 1,
-0.09283078, 0.5527042, 0.5901123, 0, 1, 0.8431373, 1,
-0.08743469, -0.5069292, -4.583123, 0, 1, 0.8509804, 1,
-0.08715313, -0.06828103, -3.617597, 0, 1, 0.854902, 1,
-0.08423951, 1.311826, 0.09945931, 0, 1, 0.8627451, 1,
-0.08119636, 0.8705199, -0.5124846, 0, 1, 0.8666667, 1,
-0.08021, -0.2434777, -2.723421, 0, 1, 0.8745098, 1,
-0.07786655, 1.470595, 1.080927, 0, 1, 0.8784314, 1,
-0.07682873, -1.845764, -2.331497, 0, 1, 0.8862745, 1,
-0.07525703, -0.4205079, -1.955436, 0, 1, 0.8901961, 1,
-0.07486757, -1.536803, -4.228305, 0, 1, 0.8980392, 1,
-0.06855981, -1.411064, -4.465611, 0, 1, 0.9058824, 1,
-0.06780945, -1.2949, -2.658506, 0, 1, 0.9098039, 1,
-0.06550415, 0.4591338, 1.736282, 0, 1, 0.9176471, 1,
-0.06400873, 0.9108515, 1.549278, 0, 1, 0.9215686, 1,
-0.05982464, -1.250002, -2.777625, 0, 1, 0.9294118, 1,
-0.05007776, 0.6624826, 0.4667045, 0, 1, 0.9333333, 1,
-0.04962165, 0.0306641, -0.9882395, 0, 1, 0.9411765, 1,
-0.04793539, 0.7709585, 1.557263, 0, 1, 0.945098, 1,
-0.03949703, -0.8144479, -2.696255, 0, 1, 0.9529412, 1,
-0.03855003, 1.831361, 0.4858353, 0, 1, 0.9568627, 1,
-0.03493354, -0.2546291, -3.470649, 0, 1, 0.9647059, 1,
-0.03345025, -1.745077, -4.364017, 0, 1, 0.9686275, 1,
-0.03211638, -1.057006, -3.696906, 0, 1, 0.9764706, 1,
-0.02093964, 0.1746743, -1.210574, 0, 1, 0.9803922, 1,
-0.01628585, 1.418453, -1.218723, 0, 1, 0.9882353, 1,
-0.01588277, 0.7734991, -1.017098, 0, 1, 0.9921569, 1,
-0.01086569, -0.5587118, -2.26941, 0, 1, 1, 1,
-0.009377691, 0.4849771, 0.1753094, 0, 0.9921569, 1, 1,
0.01091301, -0.431604, 3.328731, 0, 0.9882353, 1, 1,
0.01386216, 0.349683, -1.260249, 0, 0.9803922, 1, 1,
0.01807965, -0.9378046, 4.234498, 0, 0.9764706, 1, 1,
0.02112965, 0.4753768, 1.345205, 0, 0.9686275, 1, 1,
0.02296789, 0.01191128, 1.637827, 0, 0.9647059, 1, 1,
0.02562138, -0.8486451, 2.706597, 0, 0.9568627, 1, 1,
0.02755852, 2.204904, 0.6804971, 0, 0.9529412, 1, 1,
0.02768716, 1.673295, -1.467697, 0, 0.945098, 1, 1,
0.02802077, 1.359579, 0.755532, 0, 0.9411765, 1, 1,
0.03427252, -0.2882061, 4.956771, 0, 0.9333333, 1, 1,
0.03613434, -0.4064508, 1.448549, 0, 0.9294118, 1, 1,
0.03848366, 0.5151191, -0.4518324, 0, 0.9215686, 1, 1,
0.04164141, -0.3668244, 1.674711, 0, 0.9176471, 1, 1,
0.04173237, -0.1041821, 3.639439, 0, 0.9098039, 1, 1,
0.04177637, -1.197132, 2.500003, 0, 0.9058824, 1, 1,
0.04321611, 0.9564179, 1.817937, 0, 0.8980392, 1, 1,
0.0571427, 0.6089653, 0.05636984, 0, 0.8901961, 1, 1,
0.06217851, -1.05404, 4.66303, 0, 0.8862745, 1, 1,
0.0634045, 0.3569974, -1.325702, 0, 0.8784314, 1, 1,
0.06352157, 0.8994394, -1.577145, 0, 0.8745098, 1, 1,
0.06438044, 0.6442625, 0.8478795, 0, 0.8666667, 1, 1,
0.07271167, 1.04347, 0.7105906, 0, 0.8627451, 1, 1,
0.07293538, -1.340909, 3.558248, 0, 0.854902, 1, 1,
0.07463484, 0.3230362, 0.7556757, 0, 0.8509804, 1, 1,
0.07732108, 0.5796781, -2.208705, 0, 0.8431373, 1, 1,
0.08097441, -1.913829, 2.36454, 0, 0.8392157, 1, 1,
0.08212239, 1.458138, 1.825593, 0, 0.8313726, 1, 1,
0.08450504, 0.2526859, 1.221159, 0, 0.827451, 1, 1,
0.08763035, -0.5832116, 2.041203, 0, 0.8196079, 1, 1,
0.09149324, -0.4214519, 4.066013, 0, 0.8156863, 1, 1,
0.09278359, 0.7747814, -0.7571926, 0, 0.8078431, 1, 1,
0.1023183, 1.543447, -0.07074277, 0, 0.8039216, 1, 1,
0.103263, 0.27414, 0.8285074, 0, 0.7960784, 1, 1,
0.103294, -0.2617537, 2.29354, 0, 0.7882353, 1, 1,
0.1049331, -1.355965, 3.812196, 0, 0.7843137, 1, 1,
0.1060627, -0.7815556, 3.432469, 0, 0.7764706, 1, 1,
0.1125491, 0.4079833, 1.030378, 0, 0.772549, 1, 1,
0.1163214, -0.9971551, 4.459797, 0, 0.7647059, 1, 1,
0.1223641, 0.3327473, 1.178152, 0, 0.7607843, 1, 1,
0.1227532, -0.2634888, 2.287109, 0, 0.7529412, 1, 1,
0.1230925, -0.04017318, 0.3767222, 0, 0.7490196, 1, 1,
0.1283024, -1.030043, 3.442443, 0, 0.7411765, 1, 1,
0.130581, 0.5737005, 0.3787836, 0, 0.7372549, 1, 1,
0.1325935, -0.7210962, 4.963981, 0, 0.7294118, 1, 1,
0.1344287, 0.1908901, 0.6247532, 0, 0.7254902, 1, 1,
0.1401096, 1.858708, -1.379024, 0, 0.7176471, 1, 1,
0.1422155, 0.1661674, -1.714466, 0, 0.7137255, 1, 1,
0.1424429, -0.06691477, 2.420823, 0, 0.7058824, 1, 1,
0.1450199, -2.555001, 3.398511, 0, 0.6980392, 1, 1,
0.1501465, -0.3754031, 6.12452, 0, 0.6941177, 1, 1,
0.1515417, -0.3324252, 2.715056, 0, 0.6862745, 1, 1,
0.1518402, -1.626352, 2.253612, 0, 0.682353, 1, 1,
0.1546974, -0.8510645, 2.5279, 0, 0.6745098, 1, 1,
0.1548749, 1.082886, 0.06667885, 0, 0.6705883, 1, 1,
0.1561844, 0.09126744, 0.815909, 0, 0.6627451, 1, 1,
0.1590929, 1.472397, 1.046181, 0, 0.6588235, 1, 1,
0.1613002, -0.3275553, 2.173211, 0, 0.6509804, 1, 1,
0.1626927, 1.172381, -0.2455343, 0, 0.6470588, 1, 1,
0.1655556, 0.008617761, 1.790582, 0, 0.6392157, 1, 1,
0.1668052, -1.673846, 3.199303, 0, 0.6352941, 1, 1,
0.1672248, -1.036634, 2.903368, 0, 0.627451, 1, 1,
0.16911, 2.395694, 0.1206337, 0, 0.6235294, 1, 1,
0.1723731, 0.1753636, 0.151103, 0, 0.6156863, 1, 1,
0.1773383, -1.990636, 2.747883, 0, 0.6117647, 1, 1,
0.1815983, -0.7384883, 2.287397, 0, 0.6039216, 1, 1,
0.1818707, 0.6609784, -1.153978, 0, 0.5960785, 1, 1,
0.1881083, 1.098416, 0.09140196, 0, 0.5921569, 1, 1,
0.1926373, 1.133407, -0.3275928, 0, 0.5843138, 1, 1,
0.193122, 0.3565049, 2.148596, 0, 0.5803922, 1, 1,
0.1954493, 0.6726813, 1.493494, 0, 0.572549, 1, 1,
0.1955395, -0.7532076, 2.851083, 0, 0.5686275, 1, 1,
0.1976369, 0.4555648, 1.437265, 0, 0.5607843, 1, 1,
0.2031013, 0.3939775, 0.06906612, 0, 0.5568628, 1, 1,
0.203525, -0.6339564, 4.227884, 0, 0.5490196, 1, 1,
0.2041764, -1.202046, 1.75523, 0, 0.5450981, 1, 1,
0.2082532, -0.1955002, -0.1624091, 0, 0.5372549, 1, 1,
0.2125985, -0.001194369, 1.364791, 0, 0.5333334, 1, 1,
0.214131, -0.8004007, 0.6348562, 0, 0.5254902, 1, 1,
0.2146441, 0.8683144, 1.113525, 0, 0.5215687, 1, 1,
0.2150435, -0.07950623, 1.717541, 0, 0.5137255, 1, 1,
0.2157117, -0.9160846, 2.290851, 0, 0.509804, 1, 1,
0.216651, -1.328399, 1.285124, 0, 0.5019608, 1, 1,
0.216937, 1.087341, 0.7172189, 0, 0.4941176, 1, 1,
0.2179944, 0.7133576, 0.3913544, 0, 0.4901961, 1, 1,
0.2212704, -0.5261918, 3.322716, 0, 0.4823529, 1, 1,
0.2276029, 0.5102794, -0.6164241, 0, 0.4784314, 1, 1,
0.227892, 1.869868, 0.5139856, 0, 0.4705882, 1, 1,
0.22865, -0.5640635, 2.010761, 0, 0.4666667, 1, 1,
0.2293807, 1.877969, 2.017463, 0, 0.4588235, 1, 1,
0.2311189, -0.7125754, 2.631752, 0, 0.454902, 1, 1,
0.2329715, 1.666556, 0.1263072, 0, 0.4470588, 1, 1,
0.233224, -1.725235, 3.960006, 0, 0.4431373, 1, 1,
0.2347146, -1.176715, 1.814912, 0, 0.4352941, 1, 1,
0.236516, 1.846682, -0.4912868, 0, 0.4313726, 1, 1,
0.2365978, 1.328856, -1.617243, 0, 0.4235294, 1, 1,
0.2371472, -0.4622858, 1.46553, 0, 0.4196078, 1, 1,
0.2422071, -0.1078814, 1.791329, 0, 0.4117647, 1, 1,
0.243337, 0.5385341, -0.07501727, 0, 0.4078431, 1, 1,
0.2467515, -0.1919713, 2.387452, 0, 0.4, 1, 1,
0.2468465, -0.2587169, 1.848297, 0, 0.3921569, 1, 1,
0.248028, -0.3061954, 2.746883, 0, 0.3882353, 1, 1,
0.2501314, -1.493768, 3.286349, 0, 0.3803922, 1, 1,
0.2521012, -0.09749808, 1.799016, 0, 0.3764706, 1, 1,
0.2560929, 0.03944309, 2.920166, 0, 0.3686275, 1, 1,
0.2575502, -1.871734, 2.24037, 0, 0.3647059, 1, 1,
0.2588741, 1.274995, -0.1132539, 0, 0.3568628, 1, 1,
0.2635196, -0.6772426, 2.013485, 0, 0.3529412, 1, 1,
0.2637446, 0.09443875, 0.8641355, 0, 0.345098, 1, 1,
0.265469, 0.3007265, 0.7897573, 0, 0.3411765, 1, 1,
0.2692088, 0.6694165, 0.02180823, 0, 0.3333333, 1, 1,
0.2695742, -1.317921, 2.486838, 0, 0.3294118, 1, 1,
0.2699138, -0.06678285, 3.122302, 0, 0.3215686, 1, 1,
0.2775673, 0.08863802, 1.270325, 0, 0.3176471, 1, 1,
0.2795022, 0.06571797, 0.1691792, 0, 0.3098039, 1, 1,
0.2839365, -0.3012215, 3.163196, 0, 0.3058824, 1, 1,
0.2857279, 1.237137, -0.08319122, 0, 0.2980392, 1, 1,
0.2886185, -1.224528, 2.655099, 0, 0.2901961, 1, 1,
0.2940869, 0.6963673, 0.1240803, 0, 0.2862745, 1, 1,
0.2941264, 0.3686655, 2.735069, 0, 0.2784314, 1, 1,
0.2967811, -0.1302607, 2.029096, 0, 0.2745098, 1, 1,
0.2988985, -0.1937489, 0.5951675, 0, 0.2666667, 1, 1,
0.3020998, 1.257141, -0.9062303, 0, 0.2627451, 1, 1,
0.3147953, 0.06431124, -0.1189267, 0, 0.254902, 1, 1,
0.314987, 1.351892, 0.3730884, 0, 0.2509804, 1, 1,
0.3153949, 0.4121515, 0.227059, 0, 0.2431373, 1, 1,
0.3158119, -1.042695, 4.046481, 0, 0.2392157, 1, 1,
0.317346, -0.5494764, 1.701876, 0, 0.2313726, 1, 1,
0.3219569, 0.0007043757, 1.735018, 0, 0.227451, 1, 1,
0.3245269, 0.7458593, 1.120205, 0, 0.2196078, 1, 1,
0.3275556, 0.6509641, -0.9760607, 0, 0.2156863, 1, 1,
0.3293297, 0.8134783, 0.7023646, 0, 0.2078431, 1, 1,
0.3433585, 0.855876, -1.16812, 0, 0.2039216, 1, 1,
0.3448247, -0.009836331, -0.239999, 0, 0.1960784, 1, 1,
0.3453815, 0.8259771, 0.8986171, 0, 0.1882353, 1, 1,
0.3481675, -0.3697766, 1.964389, 0, 0.1843137, 1, 1,
0.3541874, 0.8587244, 0.3423171, 0, 0.1764706, 1, 1,
0.3601659, 0.6931887, 0.8181015, 0, 0.172549, 1, 1,
0.3626754, 0.6036683, 0.7728075, 0, 0.1647059, 1, 1,
0.3646006, -0.1727938, 2.102746, 0, 0.1607843, 1, 1,
0.3648537, -1.405279, 1.479698, 0, 0.1529412, 1, 1,
0.3676359, 0.9936304, -0.09990078, 0, 0.1490196, 1, 1,
0.3702332, -0.7158918, 2.340519, 0, 0.1411765, 1, 1,
0.3742541, -0.2282126, 2.956278, 0, 0.1372549, 1, 1,
0.379523, -1.733396, 2.345305, 0, 0.1294118, 1, 1,
0.3801984, -1.858426, 4.527311, 0, 0.1254902, 1, 1,
0.3807458, -1.953922, 2.50603, 0, 0.1176471, 1, 1,
0.3817153, 1.450813, 0.6164486, 0, 0.1137255, 1, 1,
0.3847019, -0.6316413, 2.782977, 0, 0.1058824, 1, 1,
0.3911832, 0.9903455, 0.4934938, 0, 0.09803922, 1, 1,
0.3938021, 0.5655304, 1.345181, 0, 0.09411765, 1, 1,
0.3964021, -0.9609959, 3.589492, 0, 0.08627451, 1, 1,
0.4034987, 0.9927074, -1.000116, 0, 0.08235294, 1, 1,
0.4077979, -2.066793, 2.441831, 0, 0.07450981, 1, 1,
0.4084535, 1.931492, 0.2214365, 0, 0.07058824, 1, 1,
0.4102264, 0.9874725, -0.07893836, 0, 0.0627451, 1, 1,
0.4114985, 0.01607396, 2.376244, 0, 0.05882353, 1, 1,
0.4236203, 0.6582353, 0.2493513, 0, 0.05098039, 1, 1,
0.4249598, -3.397204, 2.417426, 0, 0.04705882, 1, 1,
0.4251102, 1.083015, 0.9557278, 0, 0.03921569, 1, 1,
0.4259989, -0.6420476, 1.96255, 0, 0.03529412, 1, 1,
0.4280656, 0.4563762, -0.4220546, 0, 0.02745098, 1, 1,
0.4301978, 1.000517, -0.2751285, 0, 0.02352941, 1, 1,
0.4420398, -0.4476183, 1.657345, 0, 0.01568628, 1, 1,
0.4429322, 0.8443234, 1.050535, 0, 0.01176471, 1, 1,
0.4441121, -0.3394639, 2.510622, 0, 0.003921569, 1, 1,
0.4468682, 1.413497, -0.8193175, 0.003921569, 0, 1, 1,
0.4474785, 2.139681, 2.159861, 0.007843138, 0, 1, 1,
0.4481125, 0.7111642, 2.003381, 0.01568628, 0, 1, 1,
0.4492579, 1.506158, 0.5902147, 0.01960784, 0, 1, 1,
0.4493463, 2.033055, 0.2344483, 0.02745098, 0, 1, 1,
0.4512436, 0.8134507, 0.5450254, 0.03137255, 0, 1, 1,
0.4593231, 0.27173, -0.9513665, 0.03921569, 0, 1, 1,
0.4608389, -0.9207813, 2.060211, 0.04313726, 0, 1, 1,
0.460851, -0.122816, 1.231286, 0.05098039, 0, 1, 1,
0.4614352, 0.03563344, 2.108872, 0.05490196, 0, 1, 1,
0.4630319, 0.7572159, 0.7722202, 0.0627451, 0, 1, 1,
0.4663397, 1.296468, 1.257211, 0.06666667, 0, 1, 1,
0.4676611, 0.0821824, 0.7897975, 0.07450981, 0, 1, 1,
0.4715267, 1.543977, 2.148867, 0.07843138, 0, 1, 1,
0.4804178, -0.1280744, 2.173432, 0.08627451, 0, 1, 1,
0.4849145, 0.3955278, -0.4644351, 0.09019608, 0, 1, 1,
0.4873994, -0.5537617, 2.556701, 0.09803922, 0, 1, 1,
0.4875807, 1.446108, -0.01781936, 0.1058824, 0, 1, 1,
0.4950427, -0.137148, 3.693188, 0.1098039, 0, 1, 1,
0.4975603, 0.992331, -0.4094845, 0.1176471, 0, 1, 1,
0.5016386, 0.104608, 2.18804, 0.1215686, 0, 1, 1,
0.5032841, 1.132965, 0.198781, 0.1294118, 0, 1, 1,
0.5038447, 2.036589, 0.2159061, 0.1333333, 0, 1, 1,
0.5135627, -0.3181535, 0.7618904, 0.1411765, 0, 1, 1,
0.5135692, -0.2539996, 2.062421, 0.145098, 0, 1, 1,
0.5150753, 0.6732016, 0.2882689, 0.1529412, 0, 1, 1,
0.517798, 0.3184007, 3.066496, 0.1568628, 0, 1, 1,
0.51876, -0.6272202, 2.223303, 0.1647059, 0, 1, 1,
0.5200064, -0.523736, -0.08252473, 0.1686275, 0, 1, 1,
0.5229821, -0.1428453, 2.905994, 0.1764706, 0, 1, 1,
0.5238418, 1.317515, -0.1646597, 0.1803922, 0, 1, 1,
0.5239304, -0.08406519, 2.76073, 0.1882353, 0, 1, 1,
0.5252726, 0.3342339, 2.115641, 0.1921569, 0, 1, 1,
0.5262373, 0.7300496, 0.6885324, 0.2, 0, 1, 1,
0.5314351, -1.402203, 2.136691, 0.2078431, 0, 1, 1,
0.5316542, -0.4293422, 1.228036, 0.2117647, 0, 1, 1,
0.5357305, 0.1858035, 2.895022, 0.2196078, 0, 1, 1,
0.539978, 0.8520266, 1.970194, 0.2235294, 0, 1, 1,
0.5431359, 0.8092667, 1.251354, 0.2313726, 0, 1, 1,
0.5461617, -1.732813, 1.198185, 0.2352941, 0, 1, 1,
0.549427, 1.526092, 0.357396, 0.2431373, 0, 1, 1,
0.553422, 0.09818838, 1.395519, 0.2470588, 0, 1, 1,
0.5572315, -0.8337893, 2.934306, 0.254902, 0, 1, 1,
0.5632468, 0.4560794, 0.8783346, 0.2588235, 0, 1, 1,
0.5638787, -0.0768095, 2.927747, 0.2666667, 0, 1, 1,
0.5641394, 0.6063885, 0.6363754, 0.2705882, 0, 1, 1,
0.5666935, 2.698296, -1.077665, 0.2784314, 0, 1, 1,
0.569424, -0.46217, 1.682296, 0.282353, 0, 1, 1,
0.5725322, 1.074572, 0.7644825, 0.2901961, 0, 1, 1,
0.5737885, 1.565082, 0.7643193, 0.2941177, 0, 1, 1,
0.5752265, -0.2762503, 2.72173, 0.3019608, 0, 1, 1,
0.5775952, 1.161975, 1.377634, 0.3098039, 0, 1, 1,
0.5783798, -0.3740085, 2.523793, 0.3137255, 0, 1, 1,
0.5814032, 0.6371885, 2.11507, 0.3215686, 0, 1, 1,
0.5854161, 0.5190174, 0.2955724, 0.3254902, 0, 1, 1,
0.5923212, 0.6097403, 2.512498, 0.3333333, 0, 1, 1,
0.5944518, 0.7322899, 0.8475154, 0.3372549, 0, 1, 1,
0.595126, -1.775739, 3.522005, 0.345098, 0, 1, 1,
0.5998648, 0.1819363, 3.597672, 0.3490196, 0, 1, 1,
0.6013584, 1.445889, 0.9038392, 0.3568628, 0, 1, 1,
0.6035399, -0.7238987, 1.663048, 0.3607843, 0, 1, 1,
0.6071444, 0.1511547, 1.531328, 0.3686275, 0, 1, 1,
0.6156511, 0.3255833, 1.627087, 0.372549, 0, 1, 1,
0.6201183, -0.07124769, 1.383016, 0.3803922, 0, 1, 1,
0.6218533, -0.7195708, 2.509342, 0.3843137, 0, 1, 1,
0.622124, -0.5030154, 1.881973, 0.3921569, 0, 1, 1,
0.6235285, 1.362407, 0.04180062, 0.3960784, 0, 1, 1,
0.6244786, -1.82057, 1.2668, 0.4039216, 0, 1, 1,
0.631988, -0.6406082, 1.453762, 0.4117647, 0, 1, 1,
0.6337173, -1.139399, 2.586893, 0.4156863, 0, 1, 1,
0.6419016, 0.7011256, -0.320369, 0.4235294, 0, 1, 1,
0.6431901, 2.156991, -0.01238907, 0.427451, 0, 1, 1,
0.6467739, -0.2768145, 1.798146, 0.4352941, 0, 1, 1,
0.6480459, -0.7476667, 1.363392, 0.4392157, 0, 1, 1,
0.6491464, 1.897435, 0.6256537, 0.4470588, 0, 1, 1,
0.6533431, -1.027096, 2.015914, 0.4509804, 0, 1, 1,
0.6581808, 0.05224638, 1.226269, 0.4588235, 0, 1, 1,
0.6638238, 0.09957852, 1.950588, 0.4627451, 0, 1, 1,
0.6685169, 0.7659171, -0.6470627, 0.4705882, 0, 1, 1,
0.6693343, -0.6086707, 3.747834, 0.4745098, 0, 1, 1,
0.6715655, 0.6171501, 0.05673652, 0.4823529, 0, 1, 1,
0.6740078, -0.9143796, 2.1548, 0.4862745, 0, 1, 1,
0.6775019, 1.680983, -0.02723884, 0.4941176, 0, 1, 1,
0.67987, -1.150102, 1.802617, 0.5019608, 0, 1, 1,
0.6861019, -0.1248415, 2.04844, 0.5058824, 0, 1, 1,
0.6863001, -1.12036, 1.911484, 0.5137255, 0, 1, 1,
0.6931847, -0.06069793, 0.6825272, 0.5176471, 0, 1, 1,
0.6947433, -1.060734, 3.005678, 0.5254902, 0, 1, 1,
0.6973115, -0.3527051, 1.075125, 0.5294118, 0, 1, 1,
0.7037023, 0.2098052, 2.045428, 0.5372549, 0, 1, 1,
0.7105742, -0.06898633, 2.140275, 0.5411765, 0, 1, 1,
0.7127337, 0.1838611, 2.911336, 0.5490196, 0, 1, 1,
0.7140098, 0.1105509, -0.01539723, 0.5529412, 0, 1, 1,
0.7182542, 1.235564, -0.5020397, 0.5607843, 0, 1, 1,
0.7198321, 0.2734297, 0.7970463, 0.5647059, 0, 1, 1,
0.7199904, -0.3359531, 3.448662, 0.572549, 0, 1, 1,
0.7228063, -2.497066, 3.212392, 0.5764706, 0, 1, 1,
0.7275062, 1.703147, 0.2217464, 0.5843138, 0, 1, 1,
0.7277878, -0.2983896, 1.415394, 0.5882353, 0, 1, 1,
0.7303524, -0.1768574, 2.672482, 0.5960785, 0, 1, 1,
0.7306392, -0.9626978, 2.314556, 0.6039216, 0, 1, 1,
0.7313126, -0.4409051, 1.390971, 0.6078432, 0, 1, 1,
0.7330228, 0.2121754, 1.279763, 0.6156863, 0, 1, 1,
0.7348971, 0.6162794, 0.449223, 0.6196079, 0, 1, 1,
0.7377944, 0.8563769, 1.565884, 0.627451, 0, 1, 1,
0.7391775, -1.120823, 2.956618, 0.6313726, 0, 1, 1,
0.7399674, -0.02438614, 1.330143, 0.6392157, 0, 1, 1,
0.7401299, 0.5760295, 1.627385, 0.6431373, 0, 1, 1,
0.743121, 0.08666049, 1.857932, 0.6509804, 0, 1, 1,
0.7437682, 1.135883, 0.8152748, 0.654902, 0, 1, 1,
0.7448001, -1.044206, 0.8080024, 0.6627451, 0, 1, 1,
0.7490537, -1.079226, 2.603676, 0.6666667, 0, 1, 1,
0.7512906, -0.3695805, 3.18426, 0.6745098, 0, 1, 1,
0.7516497, -1.530466, 3.617893, 0.6784314, 0, 1, 1,
0.7548175, 0.6113842, -0.3374872, 0.6862745, 0, 1, 1,
0.7568545, -0.6065959, 2.192324, 0.6901961, 0, 1, 1,
0.7572725, -0.7337548, 1.734514, 0.6980392, 0, 1, 1,
0.7574263, -0.8003853, 2.855504, 0.7058824, 0, 1, 1,
0.758322, 0.2637691, -0.8795163, 0.7098039, 0, 1, 1,
0.7603595, 1.142068, 0.9972596, 0.7176471, 0, 1, 1,
0.7658109, -0.3447902, 3.637123, 0.7215686, 0, 1, 1,
0.7675399, 0.5593325, 1.613181, 0.7294118, 0, 1, 1,
0.7733968, 0.4032768, 2.445558, 0.7333333, 0, 1, 1,
0.779447, 0.7457081, -0.2659363, 0.7411765, 0, 1, 1,
0.7937663, -0.1211572, 3.276955, 0.7450981, 0, 1, 1,
0.7953598, -0.1182418, 2.035565, 0.7529412, 0, 1, 1,
0.7958057, 0.07930765, 0.2059288, 0.7568628, 0, 1, 1,
0.8037483, -1.117403, 1.687639, 0.7647059, 0, 1, 1,
0.8054721, -0.09786294, 1.612597, 0.7686275, 0, 1, 1,
0.8123246, -0.687001, 0.4192281, 0.7764706, 0, 1, 1,
0.8139272, -0.04441796, 0.6912758, 0.7803922, 0, 1, 1,
0.8151857, 1.003742, 0.5942829, 0.7882353, 0, 1, 1,
0.8178041, -0.315479, 2.037707, 0.7921569, 0, 1, 1,
0.8205968, 0.1168841, 2.797669, 0.8, 0, 1, 1,
0.8224809, -1.415784, 2.082994, 0.8078431, 0, 1, 1,
0.8230582, -0.6256418, 3.275766, 0.8117647, 0, 1, 1,
0.8267947, 0.4626873, -1.467542, 0.8196079, 0, 1, 1,
0.8274266, -0.6671457, 3.021355, 0.8235294, 0, 1, 1,
0.8363038, -0.4637198, 1.004744, 0.8313726, 0, 1, 1,
0.8399671, -0.3282988, 4.147066, 0.8352941, 0, 1, 1,
0.8424608, -1.937222, 1.85898, 0.8431373, 0, 1, 1,
0.842828, -0.856571, 3.475094, 0.8470588, 0, 1, 1,
0.8495398, -0.1898214, 2.288362, 0.854902, 0, 1, 1,
0.8514773, -0.7640703, 2.271452, 0.8588235, 0, 1, 1,
0.8531556, -0.135859, 3.233984, 0.8666667, 0, 1, 1,
0.8555793, -1.080089, 3.037853, 0.8705882, 0, 1, 1,
0.8558832, -0.9283313, 3.412176, 0.8784314, 0, 1, 1,
0.8589113, -0.7958152, 2.447203, 0.8823529, 0, 1, 1,
0.8593261, -0.8594033, 1.035665, 0.8901961, 0, 1, 1,
0.8696674, 0.3489426, 0.5722275, 0.8941177, 0, 1, 1,
0.8707553, 1.438323, 0.8674735, 0.9019608, 0, 1, 1,
0.8818871, 0.09420845, 1.666874, 0.9098039, 0, 1, 1,
0.8830447, -2.148399, 2.640692, 0.9137255, 0, 1, 1,
0.8837301, 1.914298, 0.540656, 0.9215686, 0, 1, 1,
0.8896975, 1.299558, -0.9591962, 0.9254902, 0, 1, 1,
0.892203, 0.6740153, 1.462514, 0.9333333, 0, 1, 1,
0.896309, -0.4433796, 1.232647, 0.9372549, 0, 1, 1,
0.9024279, 1.081255, 2.189182, 0.945098, 0, 1, 1,
0.9100088, -1.22186, 2.418773, 0.9490196, 0, 1, 1,
0.9101408, 0.5216972, 1.397654, 0.9568627, 0, 1, 1,
0.9119337, 0.9043336, 1.215914, 0.9607843, 0, 1, 1,
0.9131918, 0.4841312, 0.7606793, 0.9686275, 0, 1, 1,
0.915196, 0.4012593, -0.6677754, 0.972549, 0, 1, 1,
0.9178408, 0.1853601, 2.550889, 0.9803922, 0, 1, 1,
0.9186005, 2.183603, 0.3530684, 0.9843137, 0, 1, 1,
0.9224202, -1.370268, 2.66942, 0.9921569, 0, 1, 1,
0.926613, -1.427107, 2.931928, 0.9960784, 0, 1, 1,
0.9385457, -1.818453, 1.418309, 1, 0, 0.9960784, 1,
0.9400902, -0.2239977, 1.300109, 1, 0, 0.9882353, 1,
0.9439005, 0.3661467, 0.8247525, 1, 0, 0.9843137, 1,
0.9439381, 0.6691059, 0.3477078, 1, 0, 0.9764706, 1,
0.9449077, 1.738483, 0.4720009, 1, 0, 0.972549, 1,
0.9508269, 0.0230291, 1.416275, 1, 0, 0.9647059, 1,
0.9534155, 0.5941783, 1.777362, 1, 0, 0.9607843, 1,
0.9608059, 0.7695683, 1.380338, 1, 0, 0.9529412, 1,
0.9611493, 1.869168, 0.7256768, 1, 0, 0.9490196, 1,
0.9619293, -0.3574453, 2.836732, 1, 0, 0.9411765, 1,
0.9664203, -0.6414369, 1.033226, 1, 0, 0.9372549, 1,
0.9683062, 1.392896, 2.219205, 1, 0, 0.9294118, 1,
0.9806052, -1.773494, 2.295079, 1, 0, 0.9254902, 1,
0.9813672, -0.4293478, 2.815837, 1, 0, 0.9176471, 1,
0.9816248, 0.7414374, -0.6412638, 1, 0, 0.9137255, 1,
0.9851375, -0.08789422, 1.001944, 1, 0, 0.9058824, 1,
0.9913323, -0.873096, 1.749116, 1, 0, 0.9019608, 1,
0.993435, -1.151677, 2.61818, 1, 0, 0.8941177, 1,
0.9969254, -0.09182064, 2.017716, 1, 0, 0.8862745, 1,
1.003841, -1.539346, 0.203787, 1, 0, 0.8823529, 1,
1.004281, 0.3890993, -0.4820248, 1, 0, 0.8745098, 1,
1.00466, -1.257044, 1.528294, 1, 0, 0.8705882, 1,
1.00543, 1.900254, -0.02142605, 1, 0, 0.8627451, 1,
1.01387, -0.1533514, 1.86419, 1, 0, 0.8588235, 1,
1.016587, 0.4144288, -0.2678981, 1, 0, 0.8509804, 1,
1.019738, 1.393481, 0.5274321, 1, 0, 0.8470588, 1,
1.022143, 0.9308665, 2.197239, 1, 0, 0.8392157, 1,
1.025401, 0.02358956, 1.286031, 1, 0, 0.8352941, 1,
1.040886, 0.3971081, 2.646201, 1, 0, 0.827451, 1,
1.053252, 1.198441, -1.034385, 1, 0, 0.8235294, 1,
1.055522, 0.4579999, 1.838971, 1, 0, 0.8156863, 1,
1.05755, -0.9327359, 2.757272, 1, 0, 0.8117647, 1,
1.058573, 0.2772763, 3.13524, 1, 0, 0.8039216, 1,
1.059402, -0.63433, 4.314151, 1, 0, 0.7960784, 1,
1.059423, 0.2605509, -1.162068, 1, 0, 0.7921569, 1,
1.063435, 2.137062, 0.7187957, 1, 0, 0.7843137, 1,
1.065252, -0.5902931, 4.073719, 1, 0, 0.7803922, 1,
1.065831, -0.4669809, 3.696909, 1, 0, 0.772549, 1,
1.077577, -0.9309177, 1.386944, 1, 0, 0.7686275, 1,
1.078112, -0.342755, 3.243626, 1, 0, 0.7607843, 1,
1.079729, 0.7806606, 2.236252, 1, 0, 0.7568628, 1,
1.081467, -0.9052826, 2.588396, 1, 0, 0.7490196, 1,
1.083342, 0.2209293, 1.185406, 1, 0, 0.7450981, 1,
1.085831, -0.894258, 4.29239, 1, 0, 0.7372549, 1,
1.098105, -1.243822, 3.775011, 1, 0, 0.7333333, 1,
1.103469, -1.665298, 2.053246, 1, 0, 0.7254902, 1,
1.108374, -0.223252, 1.571402, 1, 0, 0.7215686, 1,
1.110147, -2.043759, 1.833219, 1, 0, 0.7137255, 1,
1.112341, 0.6543988, 1.592577, 1, 0, 0.7098039, 1,
1.118307, 1.078723, 1.891642, 1, 0, 0.7019608, 1,
1.120089, -0.8335304, 4.516928, 1, 0, 0.6941177, 1,
1.123904, -0.3675621, 3.216928, 1, 0, 0.6901961, 1,
1.124256, -0.08248442, 1.621039, 1, 0, 0.682353, 1,
1.132717, -0.9165549, 1.723166, 1, 0, 0.6784314, 1,
1.134103, -0.8834312, 1.516135, 1, 0, 0.6705883, 1,
1.136129, 0.2022804, 1.424429, 1, 0, 0.6666667, 1,
1.147739, 1.154194, 0.5456845, 1, 0, 0.6588235, 1,
1.156233, -0.001775602, 1.750686, 1, 0, 0.654902, 1,
1.173155, 0.422036, 2.880684, 1, 0, 0.6470588, 1,
1.180575, 1.244875, 1.842818, 1, 0, 0.6431373, 1,
1.18115, -1.74015, 1.606277, 1, 0, 0.6352941, 1,
1.186171, -0.3231632, 0.9367856, 1, 0, 0.6313726, 1,
1.186353, -1.182326, 3.409411, 1, 0, 0.6235294, 1,
1.187474, 0.7517401, 0.1806554, 1, 0, 0.6196079, 1,
1.203999, -0.6678062, 4.879786, 1, 0, 0.6117647, 1,
1.224187, -0.292744, 1.413628, 1, 0, 0.6078432, 1,
1.233163, -0.5871487, 2.344519, 1, 0, 0.6, 1,
1.240927, -0.163203, 1.979503, 1, 0, 0.5921569, 1,
1.24495, -0.6742572, 0.6058087, 1, 0, 0.5882353, 1,
1.246092, 0.6981772, 1.769518, 1, 0, 0.5803922, 1,
1.247959, 0.05815826, 2.498309, 1, 0, 0.5764706, 1,
1.248074, -0.6171263, 2.075976, 1, 0, 0.5686275, 1,
1.248849, -0.2433184, 0.6218797, 1, 0, 0.5647059, 1,
1.249576, 0.7047929, 1.998433, 1, 0, 0.5568628, 1,
1.253206, -0.9423953, 1.396913, 1, 0, 0.5529412, 1,
1.256683, -0.2331894, 1.546444, 1, 0, 0.5450981, 1,
1.258863, 1.628975, -0.2924916, 1, 0, 0.5411765, 1,
1.267642, 0.5794915, 1.817832, 1, 0, 0.5333334, 1,
1.270995, -1.104772, 3.005004, 1, 0, 0.5294118, 1,
1.299987, 1.174863, 0.3633258, 1, 0, 0.5215687, 1,
1.310876, -0.01340153, 1.225286, 1, 0, 0.5176471, 1,
1.317677, 1.773933, 1.7946, 1, 0, 0.509804, 1,
1.329858, 0.7377919, 1.631555, 1, 0, 0.5058824, 1,
1.330388, 0.869602, 2.328231, 1, 0, 0.4980392, 1,
1.337777, -0.3986784, 0.9213984, 1, 0, 0.4901961, 1,
1.340156, -1.975469, 3.406459, 1, 0, 0.4862745, 1,
1.349972, 0.4786367, 1.439983, 1, 0, 0.4784314, 1,
1.353008, -2.116192, 2.117225, 1, 0, 0.4745098, 1,
1.358363, -0.09684396, 0.9305463, 1, 0, 0.4666667, 1,
1.36078, 1.802392, 0.4174075, 1, 0, 0.4627451, 1,
1.370323, -1.740657, 2.182662, 1, 0, 0.454902, 1,
1.390584, 0.5278476, 2.140715, 1, 0, 0.4509804, 1,
1.403511, 0.3253588, 1.845516, 1, 0, 0.4431373, 1,
1.408082, 0.9318567, 2.181498, 1, 0, 0.4392157, 1,
1.410956, 1.030534, 1.710388, 1, 0, 0.4313726, 1,
1.431256, -1.874121, 2.730458, 1, 0, 0.427451, 1,
1.475213, 1.364953, 1.33818, 1, 0, 0.4196078, 1,
1.481681, -0.4025769, 1.418253, 1, 0, 0.4156863, 1,
1.488251, -0.8521731, 0.4140803, 1, 0, 0.4078431, 1,
1.523816, 0.3018092, 2.123148, 1, 0, 0.4039216, 1,
1.529812, 0.4151263, -0.2524618, 1, 0, 0.3960784, 1,
1.529999, 0.9841996, -0.1617643, 1, 0, 0.3882353, 1,
1.533996, 0.05678872, 0.7107832, 1, 0, 0.3843137, 1,
1.554304, 0.3193285, 1.742086, 1, 0, 0.3764706, 1,
1.554871, 0.763388, 0.08600442, 1, 0, 0.372549, 1,
1.567126, -0.1623751, 0.2097154, 1, 0, 0.3647059, 1,
1.568548, -0.7793586, 2.711287, 1, 0, 0.3607843, 1,
1.571952, 0.7196234, 1.845252, 1, 0, 0.3529412, 1,
1.583295, 1.4533, 0.2227686, 1, 0, 0.3490196, 1,
1.584568, -1.4339, 3.901672, 1, 0, 0.3411765, 1,
1.589129, 1.425405, 0.5573589, 1, 0, 0.3372549, 1,
1.62464, -0.2422464, 1.637818, 1, 0, 0.3294118, 1,
1.63434, -0.8724695, 0.7368771, 1, 0, 0.3254902, 1,
1.651767, 1.106058, 1.380531, 1, 0, 0.3176471, 1,
1.65256, 0.1428175, 0.2731625, 1, 0, 0.3137255, 1,
1.655016, -2.078815, 0.8616033, 1, 0, 0.3058824, 1,
1.662076, -0.3067646, 1.58903, 1, 0, 0.2980392, 1,
1.669211, 0.4990639, 1.767247, 1, 0, 0.2941177, 1,
1.670977, 0.4911208, 1.430046, 1, 0, 0.2862745, 1,
1.672024, -2.012613, 3.517734, 1, 0, 0.282353, 1,
1.695555, -0.04401897, 3.315285, 1, 0, 0.2745098, 1,
1.703902, -1.129258, 1.264696, 1, 0, 0.2705882, 1,
1.711779, 1.343006, 0.7084517, 1, 0, 0.2627451, 1,
1.712473, -1.049888, 3.055171, 1, 0, 0.2588235, 1,
1.738968, -1.257761, 2.02523, 1, 0, 0.2509804, 1,
1.742326, 1.059294, 2.633546, 1, 0, 0.2470588, 1,
1.818084, -0.3550483, 2.19547, 1, 0, 0.2392157, 1,
1.81996, -0.4013129, 1.286976, 1, 0, 0.2352941, 1,
1.832771, -0.395817, 0.1199432, 1, 0, 0.227451, 1,
1.833089, -0.1514385, 1.790581, 1, 0, 0.2235294, 1,
1.834504, -0.7408724, 0.5437344, 1, 0, 0.2156863, 1,
1.853339, 0.1188349, 2.963222, 1, 0, 0.2117647, 1,
1.870519, -0.4684389, -0.2213451, 1, 0, 0.2039216, 1,
1.871647, 2.576757, -1.81878, 1, 0, 0.1960784, 1,
1.884094, 1.920707, 1.15957, 1, 0, 0.1921569, 1,
1.901247, 0.4583558, 0.7389594, 1, 0, 0.1843137, 1,
1.920665, -0.8335499, 1.68593, 1, 0, 0.1803922, 1,
1.928154, -0.1822682, 1.553689, 1, 0, 0.172549, 1,
1.930216, -1.563622, 2.135839, 1, 0, 0.1686275, 1,
1.948204, -0.217754, 1.320894, 1, 0, 0.1607843, 1,
1.987372, 0.7047312, -0.2226286, 1, 0, 0.1568628, 1,
1.993955, 0.03663596, 2.834291, 1, 0, 0.1490196, 1,
2.002224, -0.1158728, 2.070518, 1, 0, 0.145098, 1,
2.007501, -0.9137069, 1.734529, 1, 0, 0.1372549, 1,
2.01834, 0.167315, 0.9793667, 1, 0, 0.1333333, 1,
2.023932, 0.163718, 0.714018, 1, 0, 0.1254902, 1,
2.027297, 0.4992742, 0.5562989, 1, 0, 0.1215686, 1,
2.029525, 0.1071514, 0.7466006, 1, 0, 0.1137255, 1,
2.037023, 0.3616767, 1.999562, 1, 0, 0.1098039, 1,
2.066397, -0.8507738, 2.109248, 1, 0, 0.1019608, 1,
2.122566, -1.348069, 3.170773, 1, 0, 0.09411765, 1,
2.161106, 0.1901657, 0.0702196, 1, 0, 0.09019608, 1,
2.239249, 0.2118167, 0.2604081, 1, 0, 0.08235294, 1,
2.250422, -2.911122, 0.7251527, 1, 0, 0.07843138, 1,
2.337472, -2.324607, 2.835924, 1, 0, 0.07058824, 1,
2.344199, 0.7268646, 0.9389808, 1, 0, 0.06666667, 1,
2.355241, -1.510837, 3.571367, 1, 0, 0.05882353, 1,
2.409493, -1.793358, 1.672027, 1, 0, 0.05490196, 1,
2.419111, 0.7597247, 3.225097, 1, 0, 0.04705882, 1,
2.467883, 0.3134785, 2.382845, 1, 0, 0.04313726, 1,
2.470843, 0.6554739, 2.283721, 1, 0, 0.03529412, 1,
2.512521, 0.3925935, 4.368738, 1, 0, 0.03137255, 1,
2.550553, 1.131493, 1.609545, 1, 0, 0.02352941, 1,
2.697438, -2.530407, 1.898999, 1, 0, 0.01960784, 1,
3.025374, -0.58094, 0.4928702, 1, 0, 0.01176471, 1,
3.820472, 0.6484557, 0.7110692, 1, 0, 0.007843138, 1
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
0.4950483, -4.536949, -8.888119, 0, -0.5, 0.5, 0.5,
0.4950483, -4.536949, -8.888119, 1, -0.5, 0.5, 0.5,
0.4950483, -4.536949, -8.888119, 1, 1.5, 0.5, 0.5,
0.4950483, -4.536949, -8.888119, 0, 1.5, 0.5, 0.5
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
-3.957694, -0.03512478, -8.888119, 0, -0.5, 0.5, 0.5,
-3.957694, -0.03512478, -8.888119, 1, -0.5, 0.5, 0.5,
-3.957694, -0.03512478, -8.888119, 1, 1.5, 0.5, 0.5,
-3.957694, -0.03512478, -8.888119, 0, 1.5, 0.5, 0.5
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
-3.957694, -4.536949, -0.2938802, 0, -0.5, 0.5, 0.5,
-3.957694, -4.536949, -0.2938802, 1, -0.5, 0.5, 0.5,
-3.957694, -4.536949, -0.2938802, 1, 1.5, 0.5, 0.5,
-3.957694, -4.536949, -0.2938802, 0, 1.5, 0.5, 0.5
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
-2, -3.498066, -6.904833,
3, -3.498066, -6.904833,
-2, -3.498066, -6.904833,
-2, -3.671213, -7.23538,
-1, -3.498066, -6.904833,
-1, -3.671213, -7.23538,
0, -3.498066, -6.904833,
0, -3.671213, -7.23538,
1, -3.498066, -6.904833,
1, -3.671213, -7.23538,
2, -3.498066, -6.904833,
2, -3.671213, -7.23538,
3, -3.498066, -6.904833,
3, -3.671213, -7.23538
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
-2, -4.017508, -7.896476, 0, -0.5, 0.5, 0.5,
-2, -4.017508, -7.896476, 1, -0.5, 0.5, 0.5,
-2, -4.017508, -7.896476, 1, 1.5, 0.5, 0.5,
-2, -4.017508, -7.896476, 0, 1.5, 0.5, 0.5,
-1, -4.017508, -7.896476, 0, -0.5, 0.5, 0.5,
-1, -4.017508, -7.896476, 1, -0.5, 0.5, 0.5,
-1, -4.017508, -7.896476, 1, 1.5, 0.5, 0.5,
-1, -4.017508, -7.896476, 0, 1.5, 0.5, 0.5,
0, -4.017508, -7.896476, 0, -0.5, 0.5, 0.5,
0, -4.017508, -7.896476, 1, -0.5, 0.5, 0.5,
0, -4.017508, -7.896476, 1, 1.5, 0.5, 0.5,
0, -4.017508, -7.896476, 0, 1.5, 0.5, 0.5,
1, -4.017508, -7.896476, 0, -0.5, 0.5, 0.5,
1, -4.017508, -7.896476, 1, -0.5, 0.5, 0.5,
1, -4.017508, -7.896476, 1, 1.5, 0.5, 0.5,
1, -4.017508, -7.896476, 0, 1.5, 0.5, 0.5,
2, -4.017508, -7.896476, 0, -0.5, 0.5, 0.5,
2, -4.017508, -7.896476, 1, -0.5, 0.5, 0.5,
2, -4.017508, -7.896476, 1, 1.5, 0.5, 0.5,
2, -4.017508, -7.896476, 0, 1.5, 0.5, 0.5,
3, -4.017508, -7.896476, 0, -0.5, 0.5, 0.5,
3, -4.017508, -7.896476, 1, -0.5, 0.5, 0.5,
3, -4.017508, -7.896476, 1, 1.5, 0.5, 0.5,
3, -4.017508, -7.896476, 0, 1.5, 0.5, 0.5
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
-2.930138, -3, -6.904833,
-2.930138, 3, -6.904833,
-2.930138, -3, -6.904833,
-3.101397, -3, -7.23538,
-2.930138, -2, -6.904833,
-3.101397, -2, -7.23538,
-2.930138, -1, -6.904833,
-3.101397, -1, -7.23538,
-2.930138, 0, -6.904833,
-3.101397, 0, -7.23538,
-2.930138, 1, -6.904833,
-3.101397, 1, -7.23538,
-2.930138, 2, -6.904833,
-3.101397, 2, -7.23538,
-2.930138, 3, -6.904833,
-3.101397, 3, -7.23538
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
-3.443916, -3, -7.896476, 0, -0.5, 0.5, 0.5,
-3.443916, -3, -7.896476, 1, -0.5, 0.5, 0.5,
-3.443916, -3, -7.896476, 1, 1.5, 0.5, 0.5,
-3.443916, -3, -7.896476, 0, 1.5, 0.5, 0.5,
-3.443916, -2, -7.896476, 0, -0.5, 0.5, 0.5,
-3.443916, -2, -7.896476, 1, -0.5, 0.5, 0.5,
-3.443916, -2, -7.896476, 1, 1.5, 0.5, 0.5,
-3.443916, -2, -7.896476, 0, 1.5, 0.5, 0.5,
-3.443916, -1, -7.896476, 0, -0.5, 0.5, 0.5,
-3.443916, -1, -7.896476, 1, -0.5, 0.5, 0.5,
-3.443916, -1, -7.896476, 1, 1.5, 0.5, 0.5,
-3.443916, -1, -7.896476, 0, 1.5, 0.5, 0.5,
-3.443916, 0, -7.896476, 0, -0.5, 0.5, 0.5,
-3.443916, 0, -7.896476, 1, -0.5, 0.5, 0.5,
-3.443916, 0, -7.896476, 1, 1.5, 0.5, 0.5,
-3.443916, 0, -7.896476, 0, 1.5, 0.5, 0.5,
-3.443916, 1, -7.896476, 0, -0.5, 0.5, 0.5,
-3.443916, 1, -7.896476, 1, -0.5, 0.5, 0.5,
-3.443916, 1, -7.896476, 1, 1.5, 0.5, 0.5,
-3.443916, 1, -7.896476, 0, 1.5, 0.5, 0.5,
-3.443916, 2, -7.896476, 0, -0.5, 0.5, 0.5,
-3.443916, 2, -7.896476, 1, -0.5, 0.5, 0.5,
-3.443916, 2, -7.896476, 1, 1.5, 0.5, 0.5,
-3.443916, 2, -7.896476, 0, 1.5, 0.5, 0.5,
-3.443916, 3, -7.896476, 0, -0.5, 0.5, 0.5,
-3.443916, 3, -7.896476, 1, -0.5, 0.5, 0.5,
-3.443916, 3, -7.896476, 1, 1.5, 0.5, 0.5,
-3.443916, 3, -7.896476, 0, 1.5, 0.5, 0.5
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
-2.930138, -3.498066, -6,
-2.930138, -3.498066, 6,
-2.930138, -3.498066, -6,
-3.101397, -3.671213, -6,
-2.930138, -3.498066, -4,
-3.101397, -3.671213, -4,
-2.930138, -3.498066, -2,
-3.101397, -3.671213, -2,
-2.930138, -3.498066, 0,
-3.101397, -3.671213, 0,
-2.930138, -3.498066, 2,
-3.101397, -3.671213, 2,
-2.930138, -3.498066, 4,
-3.101397, -3.671213, 4,
-2.930138, -3.498066, 6,
-3.101397, -3.671213, 6
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
"-6",
"-4",
"-2",
"0",
"2",
"4",
"6"
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
-3.443916, -4.017508, -6, 0, -0.5, 0.5, 0.5,
-3.443916, -4.017508, -6, 1, -0.5, 0.5, 0.5,
-3.443916, -4.017508, -6, 1, 1.5, 0.5, 0.5,
-3.443916, -4.017508, -6, 0, 1.5, 0.5, 0.5,
-3.443916, -4.017508, -4, 0, -0.5, 0.5, 0.5,
-3.443916, -4.017508, -4, 1, -0.5, 0.5, 0.5,
-3.443916, -4.017508, -4, 1, 1.5, 0.5, 0.5,
-3.443916, -4.017508, -4, 0, 1.5, 0.5, 0.5,
-3.443916, -4.017508, -2, 0, -0.5, 0.5, 0.5,
-3.443916, -4.017508, -2, 1, -0.5, 0.5, 0.5,
-3.443916, -4.017508, -2, 1, 1.5, 0.5, 0.5,
-3.443916, -4.017508, -2, 0, 1.5, 0.5, 0.5,
-3.443916, -4.017508, 0, 0, -0.5, 0.5, 0.5,
-3.443916, -4.017508, 0, 1, -0.5, 0.5, 0.5,
-3.443916, -4.017508, 0, 1, 1.5, 0.5, 0.5,
-3.443916, -4.017508, 0, 0, 1.5, 0.5, 0.5,
-3.443916, -4.017508, 2, 0, -0.5, 0.5, 0.5,
-3.443916, -4.017508, 2, 1, -0.5, 0.5, 0.5,
-3.443916, -4.017508, 2, 1, 1.5, 0.5, 0.5,
-3.443916, -4.017508, 2, 0, 1.5, 0.5, 0.5,
-3.443916, -4.017508, 4, 0, -0.5, 0.5, 0.5,
-3.443916, -4.017508, 4, 1, -0.5, 0.5, 0.5,
-3.443916, -4.017508, 4, 1, 1.5, 0.5, 0.5,
-3.443916, -4.017508, 4, 0, 1.5, 0.5, 0.5,
-3.443916, -4.017508, 6, 0, -0.5, 0.5, 0.5,
-3.443916, -4.017508, 6, 1, -0.5, 0.5, 0.5,
-3.443916, -4.017508, 6, 1, 1.5, 0.5, 0.5,
-3.443916, -4.017508, 6, 0, 1.5, 0.5, 0.5
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
-2.930138, -3.498066, -6.904833,
-2.930138, 3.427817, -6.904833,
-2.930138, -3.498066, 6.317072,
-2.930138, 3.427817, 6.317072,
-2.930138, -3.498066, -6.904833,
-2.930138, -3.498066, 6.317072,
-2.930138, 3.427817, -6.904833,
-2.930138, 3.427817, 6.317072,
-2.930138, -3.498066, -6.904833,
3.920234, -3.498066, -6.904833,
-2.930138, -3.498066, 6.317072,
3.920234, -3.498066, 6.317072,
-2.930138, 3.427817, -6.904833,
3.920234, 3.427817, -6.904833,
-2.930138, 3.427817, 6.317072,
3.920234, 3.427817, 6.317072,
3.920234, -3.498066, -6.904833,
3.920234, 3.427817, -6.904833,
3.920234, -3.498066, 6.317072,
3.920234, 3.427817, 6.317072,
3.920234, -3.498066, -6.904833,
3.920234, -3.498066, 6.317072,
3.920234, 3.427817, -6.904833,
3.920234, 3.427817, 6.317072
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
var radius = 8.769552;
var distance = 39.01673;
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
mvMatrix.translate( -0.4950483, 0.03512478, 0.2938802 );
mvMatrix.scale( 1.384131, 1.36904, 0.717129 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -39.01673);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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


