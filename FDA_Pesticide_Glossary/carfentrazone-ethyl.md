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
-3.391467, -0.02497396, -0.2022373, 1, 0, 0, 1,
-2.93369, 0.1129164, -1.7686, 1, 0.007843138, 0, 1,
-2.81895, -0.9060484, -1.17245, 1, 0.01176471, 0, 1,
-2.75163, -0.5710793, -1.828454, 1, 0.01960784, 0, 1,
-2.613858, -0.09675419, -1.039885, 1, 0.02352941, 0, 1,
-2.473336, -0.7399045, -2.150296, 1, 0.03137255, 0, 1,
-2.461336, 0.206744, -0.2397478, 1, 0.03529412, 0, 1,
-2.40054, -1.136978, -2.257293, 1, 0.04313726, 0, 1,
-2.366968, 1.672686, -0.133466, 1, 0.04705882, 0, 1,
-2.287819, -0.3284833, -0.2097415, 1, 0.05490196, 0, 1,
-2.273515, 1.441985, 0.4321365, 1, 0.05882353, 0, 1,
-2.221663, -0.09366049, -2.490668, 1, 0.06666667, 0, 1,
-2.180733, 0.8939117, -0.9735484, 1, 0.07058824, 0, 1,
-2.148659, 1.099641, 0.07552635, 1, 0.07843138, 0, 1,
-2.11425, 0.9680415, -0.4596577, 1, 0.08235294, 0, 1,
-2.05638, -1.553275, -1.16141, 1, 0.09019608, 0, 1,
-2.029859, 0.3688705, -0.3967307, 1, 0.09411765, 0, 1,
-2.020759, 0.3697031, -1.967488, 1, 0.1019608, 0, 1,
-2.016426, -1.259995, -3.620059, 1, 0.1098039, 0, 1,
-1.985329, 0.2176427, -0.4455656, 1, 0.1137255, 0, 1,
-1.976254, 0.4382831, -2.443436, 1, 0.1215686, 0, 1,
-1.879762, -1.388561, -1.852742, 1, 0.1254902, 0, 1,
-1.875249, -0.0753326, -1.591305, 1, 0.1333333, 0, 1,
-1.874932, -0.9361405, -2.381193, 1, 0.1372549, 0, 1,
-1.854341, 1.200093, 0.5054084, 1, 0.145098, 0, 1,
-1.841933, 0.6397431, -1.540234, 1, 0.1490196, 0, 1,
-1.837603, 0.7940912, -1.382843, 1, 0.1568628, 0, 1,
-1.83331, 1.24241, -0.4503175, 1, 0.1607843, 0, 1,
-1.827434, -0.8358639, -0.7111607, 1, 0.1686275, 0, 1,
-1.81472, 0.9865551, 0.4470802, 1, 0.172549, 0, 1,
-1.809349, 0.1223593, -1.96823, 1, 0.1803922, 0, 1,
-1.802374, -0.4034005, -3.16977, 1, 0.1843137, 0, 1,
-1.800559, 0.330416, -1.26986, 1, 0.1921569, 0, 1,
-1.769178, -0.9672836, -1.178568, 1, 0.1960784, 0, 1,
-1.765819, -0.5617753, -1.195047, 1, 0.2039216, 0, 1,
-1.75042, -0.1587744, -1.382748, 1, 0.2117647, 0, 1,
-1.747294, -0.03609404, -2.316877, 1, 0.2156863, 0, 1,
-1.745427, 1.284893, -2.291288, 1, 0.2235294, 0, 1,
-1.74259, -1.100417, -1.442229, 1, 0.227451, 0, 1,
-1.73969, 2.909699, -0.8418042, 1, 0.2352941, 0, 1,
-1.716456, -0.8856213, -2.073514, 1, 0.2392157, 0, 1,
-1.708569, -0.1325512, -2.85814, 1, 0.2470588, 0, 1,
-1.676357, -1.330403, -2.01865, 1, 0.2509804, 0, 1,
-1.667212, -1.280676, -2.970846, 1, 0.2588235, 0, 1,
-1.665847, -0.8786806, -1.61312, 1, 0.2627451, 0, 1,
-1.656418, -0.3942747, -1.266246, 1, 0.2705882, 0, 1,
-1.635622, -0.3554813, -1.533321, 1, 0.2745098, 0, 1,
-1.628799, 1.56331, -0.2187358, 1, 0.282353, 0, 1,
-1.622024, 0.8170652, -2.192322, 1, 0.2862745, 0, 1,
-1.618718, 1.532173, -0.1125926, 1, 0.2941177, 0, 1,
-1.572435, -0.7759581, -2.545554, 1, 0.3019608, 0, 1,
-1.569024, -0.01285905, -0.4815807, 1, 0.3058824, 0, 1,
-1.568879, 0.04789875, 0.1171145, 1, 0.3137255, 0, 1,
-1.562892, -0.410762, 0.009182381, 1, 0.3176471, 0, 1,
-1.556742, 0.5342439, -0.6591246, 1, 0.3254902, 0, 1,
-1.556195, -0.8080234, -1.229587, 1, 0.3294118, 0, 1,
-1.549996, 0.04439282, -2.114149, 1, 0.3372549, 0, 1,
-1.547371, 0.4011612, -0.3227472, 1, 0.3411765, 0, 1,
-1.546709, 1.173992, -1.147475, 1, 0.3490196, 0, 1,
-1.545608, 1.501314, -0.2531817, 1, 0.3529412, 0, 1,
-1.535184, 0.471923, -1.49112, 1, 0.3607843, 0, 1,
-1.506191, 1.290348, -1.977675, 1, 0.3647059, 0, 1,
-1.495928, 1.261833, 0.4486804, 1, 0.372549, 0, 1,
-1.495266, 0.006657708, -0.5270987, 1, 0.3764706, 0, 1,
-1.494359, -0.9195775, -2.063017, 1, 0.3843137, 0, 1,
-1.483142, 0.590435, -2.121991, 1, 0.3882353, 0, 1,
-1.46521, 0.5411364, -1.962534, 1, 0.3960784, 0, 1,
-1.463571, 1.179845, -1.810311, 1, 0.4039216, 0, 1,
-1.45205, -1.408263, -3.384068, 1, 0.4078431, 0, 1,
-1.445596, 0.4519837, -0.01083646, 1, 0.4156863, 0, 1,
-1.431423, -0.04781524, -2.008304, 1, 0.4196078, 0, 1,
-1.423164, 1.486673, -1.417808, 1, 0.427451, 0, 1,
-1.400854, 0.5929534, -0.1259421, 1, 0.4313726, 0, 1,
-1.399193, -0.2476429, -0.9795755, 1, 0.4392157, 0, 1,
-1.383663, 0.4824773, -2.16869, 1, 0.4431373, 0, 1,
-1.383335, -0.08141262, -0.8964615, 1, 0.4509804, 0, 1,
-1.376555, 1.170156, -0.9300476, 1, 0.454902, 0, 1,
-1.373281, -0.3277402, 0.2861862, 1, 0.4627451, 0, 1,
-1.36876, 1.577111, -0.06533278, 1, 0.4666667, 0, 1,
-1.364411, -0.9004359, -1.065897, 1, 0.4745098, 0, 1,
-1.357806, 0.930365, -1.330625, 1, 0.4784314, 0, 1,
-1.356911, -0.6377569, -1.53081, 1, 0.4862745, 0, 1,
-1.352334, -0.8395572, -3.929925, 1, 0.4901961, 0, 1,
-1.347107, 0.9796068, -0.6628295, 1, 0.4980392, 0, 1,
-1.346765, -1.62505, -2.478839, 1, 0.5058824, 0, 1,
-1.343357, 1.362131, -0.3448604, 1, 0.509804, 0, 1,
-1.342833, 0.6326545, -0.5344135, 1, 0.5176471, 0, 1,
-1.335455, 0.8871936, -1.03204, 1, 0.5215687, 0, 1,
-1.3338, 0.8487623, -0.00117068, 1, 0.5294118, 0, 1,
-1.329657, -1.581001, -2.873982, 1, 0.5333334, 0, 1,
-1.323875, 2.001973, -1.721088, 1, 0.5411765, 0, 1,
-1.308589, -0.7392824, -2.309341, 1, 0.5450981, 0, 1,
-1.300757, -0.03196636, -1.58145, 1, 0.5529412, 0, 1,
-1.298051, 1.190653, -0.6586058, 1, 0.5568628, 0, 1,
-1.29421, -0.6261601, -0.6724951, 1, 0.5647059, 0, 1,
-1.285017, -0.2915714, -2.661022, 1, 0.5686275, 0, 1,
-1.278343, -1.03034, -1.684753, 1, 0.5764706, 0, 1,
-1.25691, -0.8088767, -4.636991, 1, 0.5803922, 0, 1,
-1.251175, -1.153798, -2.338698, 1, 0.5882353, 0, 1,
-1.250997, 0.6724691, -0.352779, 1, 0.5921569, 0, 1,
-1.249605, 1.234316, -0.5416028, 1, 0.6, 0, 1,
-1.247181, 1.528238, -1.99319, 1, 0.6078432, 0, 1,
-1.246668, -0.2024234, -3.118888, 1, 0.6117647, 0, 1,
-1.240752, -0.01984365, -2.652861, 1, 0.6196079, 0, 1,
-1.236948, -0.3401724, -3.438723, 1, 0.6235294, 0, 1,
-1.232254, -1.845863, -2.757525, 1, 0.6313726, 0, 1,
-1.225236, -1.736989, -1.946628, 1, 0.6352941, 0, 1,
-1.217438, -1.863926, -4.305943, 1, 0.6431373, 0, 1,
-1.212174, -3.009764, -3.440248, 1, 0.6470588, 0, 1,
-1.207325, 0.5950907, -0.6949373, 1, 0.654902, 0, 1,
-1.207141, -1.053476, -2.12897, 1, 0.6588235, 0, 1,
-1.204961, -0.615389, -2.877983, 1, 0.6666667, 0, 1,
-1.204502, -1.052454, -1.096032, 1, 0.6705883, 0, 1,
-1.203759, 1.004535, -0.6312733, 1, 0.6784314, 0, 1,
-1.199183, -1.389026, -1.604166, 1, 0.682353, 0, 1,
-1.196209, -0.5762079, -2.01394, 1, 0.6901961, 0, 1,
-1.192887, -0.2251913, -2.011808, 1, 0.6941177, 0, 1,
-1.192834, -0.52038, -1.391525, 1, 0.7019608, 0, 1,
-1.186461, 0.4535721, -0.514682, 1, 0.7098039, 0, 1,
-1.185487, -1.912313, -2.981165, 1, 0.7137255, 0, 1,
-1.176219, -0.9255171, -2.041527, 1, 0.7215686, 0, 1,
-1.174793, 2.069474, -1.269686, 1, 0.7254902, 0, 1,
-1.169754, 0.06085891, -1.752742, 1, 0.7333333, 0, 1,
-1.168402, -0.7954201, -0.7800737, 1, 0.7372549, 0, 1,
-1.164887, 0.9543501, -0.8488307, 1, 0.7450981, 0, 1,
-1.159614, -0.9410198, -1.719435, 1, 0.7490196, 0, 1,
-1.156535, -1.029899, -3.291039, 1, 0.7568628, 0, 1,
-1.146326, 0.02815653, -1.845762, 1, 0.7607843, 0, 1,
-1.14209, 1.02652, -0.1140856, 1, 0.7686275, 0, 1,
-1.132652, -0.7170439, -2.430751, 1, 0.772549, 0, 1,
-1.122175, 1.260121, -0.7006775, 1, 0.7803922, 0, 1,
-1.110906, 0.8809011, -1.121507, 1, 0.7843137, 0, 1,
-1.110125, 1.289873, -0.1154398, 1, 0.7921569, 0, 1,
-1.103486, -0.9812841, -3.019051, 1, 0.7960784, 0, 1,
-1.09474, -1.284591, -1.815118, 1, 0.8039216, 0, 1,
-1.086416, -0.1231454, -3.233857, 1, 0.8117647, 0, 1,
-1.082566, 0.5341916, -1.564489, 1, 0.8156863, 0, 1,
-1.079438, 1.03002, -0.5695481, 1, 0.8235294, 0, 1,
-1.076969, 0.200815, -3.26079, 1, 0.827451, 0, 1,
-1.0743, 1.249012, 0.08681114, 1, 0.8352941, 0, 1,
-1.065921, -1.321455, -1.374033, 1, 0.8392157, 0, 1,
-1.061274, 0.8866898, -2.794479, 1, 0.8470588, 0, 1,
-1.048602, -0.7325686, -2.325681, 1, 0.8509804, 0, 1,
-1.045882, 0.1818619, -0.9428275, 1, 0.8588235, 0, 1,
-1.036496, -0.5275532, -2.636909, 1, 0.8627451, 0, 1,
-1.033564, -0.9902487, -2.018557, 1, 0.8705882, 0, 1,
-1.033069, 1.446246, -0.001831197, 1, 0.8745098, 0, 1,
-1.029384, 0.7285933, -0.6994501, 1, 0.8823529, 0, 1,
-1.025699, 0.7065603, -0.5305128, 1, 0.8862745, 0, 1,
-1.015396, -0.03700503, 0.2985289, 1, 0.8941177, 0, 1,
-1.001363, -0.4463688, -2.569494, 1, 0.8980392, 0, 1,
-0.9984772, -2.105796, -0.8323874, 1, 0.9058824, 0, 1,
-0.9909705, 0.3366413, -1.100765, 1, 0.9137255, 0, 1,
-0.9844287, 1.001106, -1.170749, 1, 0.9176471, 0, 1,
-0.9802529, -1.046519, -1.322022, 1, 0.9254902, 0, 1,
-0.9791612, 1.549103, -0.1202376, 1, 0.9294118, 0, 1,
-0.977748, -0.1481618, -2.422206, 1, 0.9372549, 0, 1,
-0.9738175, 0.8580673, -2.656515, 1, 0.9411765, 0, 1,
-0.9617428, -0.9165093, -2.900778, 1, 0.9490196, 0, 1,
-0.9549145, 1.919284, -0.7295893, 1, 0.9529412, 0, 1,
-0.9465531, 0.7094442, -0.7895215, 1, 0.9607843, 0, 1,
-0.9414622, 0.2561842, -2.007402, 1, 0.9647059, 0, 1,
-0.9370857, 0.5579203, -0.6034532, 1, 0.972549, 0, 1,
-0.9331048, 0.182945, -0.7250091, 1, 0.9764706, 0, 1,
-0.9311026, 1.469796, 0.1223408, 1, 0.9843137, 0, 1,
-0.9284807, 0.4103362, -2.717365, 1, 0.9882353, 0, 1,
-0.9216684, 0.788857, -1.87854, 1, 0.9960784, 0, 1,
-0.91083, 1.872904, -0.5328699, 0.9960784, 1, 0, 1,
-0.9079246, -0.4084404, -2.99416, 0.9921569, 1, 0, 1,
-0.9068361, 1.390611, 0.670806, 0.9843137, 1, 0, 1,
-0.9035817, 1.573621, -0.9328906, 0.9803922, 1, 0, 1,
-0.9028005, -2.470235, -2.135574, 0.972549, 1, 0, 1,
-0.9013606, 2.097683, -0.918591, 0.9686275, 1, 0, 1,
-0.8993442, 1.100682, -1.637456, 0.9607843, 1, 0, 1,
-0.8930935, 0.5319961, -3.103425, 0.9568627, 1, 0, 1,
-0.8900152, 0.106043, -1.678745, 0.9490196, 1, 0, 1,
-0.8773564, -0.2821436, -0.1924083, 0.945098, 1, 0, 1,
-0.8743453, -0.2652942, -0.5821088, 0.9372549, 1, 0, 1,
-0.8703463, 1.113544, 1.930648, 0.9333333, 1, 0, 1,
-0.86981, 0.1699489, -1.658305, 0.9254902, 1, 0, 1,
-0.8656643, -0.2506781, -1.545318, 0.9215686, 1, 0, 1,
-0.8634951, -0.6912189, -2.860526, 0.9137255, 1, 0, 1,
-0.8580056, -1.264845, -2.242827, 0.9098039, 1, 0, 1,
-0.8551111, 0.4757406, -1.42728, 0.9019608, 1, 0, 1,
-0.8535975, 0.1356791, 0.6986446, 0.8941177, 1, 0, 1,
-0.8495598, 1.351772, -0.3654234, 0.8901961, 1, 0, 1,
-0.8480457, 0.5234084, -1.315994, 0.8823529, 1, 0, 1,
-0.8459502, 0.1812801, -3.493395, 0.8784314, 1, 0, 1,
-0.845162, -1.509119, -3.162844, 0.8705882, 1, 0, 1,
-0.841293, 0.4954863, -1.347663, 0.8666667, 1, 0, 1,
-0.8343903, -0.4788751, -2.693042, 0.8588235, 1, 0, 1,
-0.8258189, 3.031704, -0.9599885, 0.854902, 1, 0, 1,
-0.825712, 0.9351606, -0.588222, 0.8470588, 1, 0, 1,
-0.8250608, 0.4291067, -1.012334, 0.8431373, 1, 0, 1,
-0.8250174, -0.6783339, -2.038797, 0.8352941, 1, 0, 1,
-0.8225085, 0.2416142, -1.313566, 0.8313726, 1, 0, 1,
-0.8215635, -0.3445571, -2.383901, 0.8235294, 1, 0, 1,
-0.8138207, 0.3804513, -2.101614, 0.8196079, 1, 0, 1,
-0.8121755, -0.8983217, -3.179901, 0.8117647, 1, 0, 1,
-0.8115816, 3.077917, 0.7313806, 0.8078431, 1, 0, 1,
-0.8086884, 0.4589529, 0.613502, 0.8, 1, 0, 1,
-0.7998434, -0.3321223, -1.449706, 0.7921569, 1, 0, 1,
-0.7956505, 0.5433373, -0.5460358, 0.7882353, 1, 0, 1,
-0.7948924, 0.6228771, -1.652541, 0.7803922, 1, 0, 1,
-0.7929464, 1.071874, -1.115984, 0.7764706, 1, 0, 1,
-0.7915683, 0.411772, -0.9775624, 0.7686275, 1, 0, 1,
-0.7914178, -0.5568629, 0.3998415, 0.7647059, 1, 0, 1,
-0.7895311, 0.2675932, -0.95058, 0.7568628, 1, 0, 1,
-0.7885018, -0.280822, -3.785218, 0.7529412, 1, 0, 1,
-0.7845283, 0.4056087, -2.540973, 0.7450981, 1, 0, 1,
-0.7819387, 3.627899, -1.013895, 0.7411765, 1, 0, 1,
-0.7752628, -1.636231, -1.901048, 0.7333333, 1, 0, 1,
-0.7674364, -1.795853, -3.424051, 0.7294118, 1, 0, 1,
-0.7633017, -0.3408784, -2.985752, 0.7215686, 1, 0, 1,
-0.7612523, -1.521699, -3.261566, 0.7176471, 1, 0, 1,
-0.7601016, 0.5101095, -0.683605, 0.7098039, 1, 0, 1,
-0.7582797, -0.1303006, -1.566367, 0.7058824, 1, 0, 1,
-0.7571329, -0.02887513, -2.699927, 0.6980392, 1, 0, 1,
-0.7539871, 0.1371435, -1.19358, 0.6901961, 1, 0, 1,
-0.7513602, -1.28509, -3.539455, 0.6862745, 1, 0, 1,
-0.7391382, -0.1787346, -0.870858, 0.6784314, 1, 0, 1,
-0.7372397, 0.1710223, -1.653881, 0.6745098, 1, 0, 1,
-0.7366373, 0.9394584, 0.2313831, 0.6666667, 1, 0, 1,
-0.7347284, -0.5367903, -1.864818, 0.6627451, 1, 0, 1,
-0.7334451, 0.2647198, -2.973379, 0.654902, 1, 0, 1,
-0.731508, -0.5844057, -2.927007, 0.6509804, 1, 0, 1,
-0.7309433, -0.7189766, -1.823879, 0.6431373, 1, 0, 1,
-0.7206246, 0.0740601, -0.5272182, 0.6392157, 1, 0, 1,
-0.7148909, 0.2261232, -1.97065, 0.6313726, 1, 0, 1,
-0.7098591, -0.2624559, -1.034402, 0.627451, 1, 0, 1,
-0.7023754, -0.4579208, 0.02096548, 0.6196079, 1, 0, 1,
-0.701036, 0.3473758, -1.751351, 0.6156863, 1, 0, 1,
-0.697845, 1.535933, 0.3475757, 0.6078432, 1, 0, 1,
-0.6957567, -1.614514, -3.88051, 0.6039216, 1, 0, 1,
-0.690837, 0.2829947, -1.41171, 0.5960785, 1, 0, 1,
-0.6895052, 0.9136835, -1.438096, 0.5882353, 1, 0, 1,
-0.6885081, -0.2000302, -1.148802, 0.5843138, 1, 0, 1,
-0.6853724, -0.5215709, -1.374115, 0.5764706, 1, 0, 1,
-0.6817074, 1.385052, 0.3501859, 0.572549, 1, 0, 1,
-0.6813366, 0.3629621, -1.396278, 0.5647059, 1, 0, 1,
-0.6777219, -2.566264, -1.662511, 0.5607843, 1, 0, 1,
-0.6767682, 0.5945126, -2.011988, 0.5529412, 1, 0, 1,
-0.6745631, -0.04776595, 0.4312449, 0.5490196, 1, 0, 1,
-0.664557, -1.404247, -2.471249, 0.5411765, 1, 0, 1,
-0.6594101, -0.3196943, -1.648177, 0.5372549, 1, 0, 1,
-0.6580881, -1.130026, -2.982017, 0.5294118, 1, 0, 1,
-0.6549212, -1.010067, -2.254059, 0.5254902, 1, 0, 1,
-0.6509454, 0.5689981, -1.531718, 0.5176471, 1, 0, 1,
-0.6455889, -1.275881, -1.947757, 0.5137255, 1, 0, 1,
-0.6432015, -0.4868298, -1.522756, 0.5058824, 1, 0, 1,
-0.641283, -0.140245, -1.838592, 0.5019608, 1, 0, 1,
-0.6380488, -0.8853002, -3.542163, 0.4941176, 1, 0, 1,
-0.6339339, -0.6474376, -2.581603, 0.4862745, 1, 0, 1,
-0.6302128, 0.7806938, 0.6000642, 0.4823529, 1, 0, 1,
-0.6299201, -0.2983038, -1.950583, 0.4745098, 1, 0, 1,
-0.6270781, 0.8793866, -0.6361088, 0.4705882, 1, 0, 1,
-0.6237105, -0.654388, -0.7505341, 0.4627451, 1, 0, 1,
-0.6219392, -0.5062087, -3.505454, 0.4588235, 1, 0, 1,
-0.6159151, 1.662743, -0.006005514, 0.4509804, 1, 0, 1,
-0.6135712, -0.2647944, -1.276478, 0.4470588, 1, 0, 1,
-0.6069717, 0.3231036, -2.163736, 0.4392157, 1, 0, 1,
-0.604274, 0.6657959, -1.129428, 0.4352941, 1, 0, 1,
-0.5955074, 0.8986366, -1.797723, 0.427451, 1, 0, 1,
-0.5945091, 0.8116191, -0.01387466, 0.4235294, 1, 0, 1,
-0.5931849, -0.5615712, -3.53141, 0.4156863, 1, 0, 1,
-0.5925419, -0.08017104, 0.0245352, 0.4117647, 1, 0, 1,
-0.5917025, 0.3696069, -1.611718, 0.4039216, 1, 0, 1,
-0.5880604, -0.7871671, -3.328228, 0.3960784, 1, 0, 1,
-0.5860918, 0.7534321, -1.012357, 0.3921569, 1, 0, 1,
-0.5856848, -0.3499415, -2.466495, 0.3843137, 1, 0, 1,
-0.5816377, -0.5319962, -2.011238, 0.3803922, 1, 0, 1,
-0.5795896, -1.563972, -2.451278, 0.372549, 1, 0, 1,
-0.5774338, 0.5134856, -0.2684225, 0.3686275, 1, 0, 1,
-0.5758589, 2.072452, 0.05902511, 0.3607843, 1, 0, 1,
-0.5747039, -0.6716416, -2.816845, 0.3568628, 1, 0, 1,
-0.5711592, -0.4024083, -2.593525, 0.3490196, 1, 0, 1,
-0.5657967, 0.7067608, -0.1631289, 0.345098, 1, 0, 1,
-0.5639114, 1.349959, 0.2075041, 0.3372549, 1, 0, 1,
-0.5617179, -0.8237656, -3.591352, 0.3333333, 1, 0, 1,
-0.5614962, -0.6556072, -0.6836503, 0.3254902, 1, 0, 1,
-0.5590401, 0.02994913, -3.697726, 0.3215686, 1, 0, 1,
-0.5584485, 0.4444603, -1.016997, 0.3137255, 1, 0, 1,
-0.5548033, -0.5988953, -3.651832, 0.3098039, 1, 0, 1,
-0.5534127, 1.262389, -0.9472975, 0.3019608, 1, 0, 1,
-0.5467618, -0.2947125, -1.14099, 0.2941177, 1, 0, 1,
-0.5461842, -1.501557, -1.947824, 0.2901961, 1, 0, 1,
-0.5413585, 0.5898104, -0.145824, 0.282353, 1, 0, 1,
-0.54056, 1.343255, -0.9373097, 0.2784314, 1, 0, 1,
-0.5378542, 0.7309498, -1.077858, 0.2705882, 1, 0, 1,
-0.537616, -1.521067, -1.954741, 0.2666667, 1, 0, 1,
-0.524288, 0.09499954, -0.3858105, 0.2588235, 1, 0, 1,
-0.5208697, -1.986673, -1.326882, 0.254902, 1, 0, 1,
-0.5204327, -0.1403802, -1.092107, 0.2470588, 1, 0, 1,
-0.5106831, 0.3325391, -2.024832, 0.2431373, 1, 0, 1,
-0.5085545, -0.6104864, -1.975081, 0.2352941, 1, 0, 1,
-0.5014492, 0.4009661, -0.3156617, 0.2313726, 1, 0, 1,
-0.4879746, -0.216306, -0.4791991, 0.2235294, 1, 0, 1,
-0.4845617, -1.410563, -2.399976, 0.2196078, 1, 0, 1,
-0.4837858, 1.105804, -2.339396, 0.2117647, 1, 0, 1,
-0.4818534, 1.439031, -1.037472, 0.2078431, 1, 0, 1,
-0.4814191, 2.288656, -0.5414149, 0.2, 1, 0, 1,
-0.4801098, 0.8053432, 0.09126629, 0.1921569, 1, 0, 1,
-0.4779881, -1.704034, -3.454628, 0.1882353, 1, 0, 1,
-0.4774774, 1.227762, 0.06253908, 0.1803922, 1, 0, 1,
-0.4736293, 0.05738469, -1.305696, 0.1764706, 1, 0, 1,
-0.4718341, 0.8499359, 0.6500748, 0.1686275, 1, 0, 1,
-0.4665036, -0.4606985, -4.087323, 0.1647059, 1, 0, 1,
-0.4651057, 0.9142508, -0.4830167, 0.1568628, 1, 0, 1,
-0.4650081, -0.5845764, -3.479664, 0.1529412, 1, 0, 1,
-0.4648949, 0.2537152, -3.156567, 0.145098, 1, 0, 1,
-0.4611613, 2.484626, -0.4528293, 0.1411765, 1, 0, 1,
-0.4567167, 0.2959726, -1.246533, 0.1333333, 1, 0, 1,
-0.4525159, 0.8556713, -0.02894673, 0.1294118, 1, 0, 1,
-0.451609, -0.1217448, -2.063326, 0.1215686, 1, 0, 1,
-0.4512948, -0.9168575, -3.041454, 0.1176471, 1, 0, 1,
-0.4499693, -1.081118, -2.237813, 0.1098039, 1, 0, 1,
-0.4463133, 0.7283551, -2.858239, 0.1058824, 1, 0, 1,
-0.4459966, -0.8952335, -4.301803, 0.09803922, 1, 0, 1,
-0.4449657, -1.06129, -3.132769, 0.09019608, 1, 0, 1,
-0.4444814, 2.278649, 0.9474232, 0.08627451, 1, 0, 1,
-0.4427303, -1.510284, -3.880918, 0.07843138, 1, 0, 1,
-0.4417844, 0.31383, -0.7453058, 0.07450981, 1, 0, 1,
-0.4392581, 0.8429042, -1.477144, 0.06666667, 1, 0, 1,
-0.4386584, -0.5139811, -2.192578, 0.0627451, 1, 0, 1,
-0.4371896, 0.2330483, -2.257706, 0.05490196, 1, 0, 1,
-0.4337746, -0.2843553, -2.469901, 0.05098039, 1, 0, 1,
-0.4273943, 0.7246523, -0.8477523, 0.04313726, 1, 0, 1,
-0.4247109, 1.002143, 0.401634, 0.03921569, 1, 0, 1,
-0.4190961, 1.067919, -0.2926533, 0.03137255, 1, 0, 1,
-0.4178448, -0.3680965, -3.567714, 0.02745098, 1, 0, 1,
-0.4167033, 1.110695, 0.9239171, 0.01960784, 1, 0, 1,
-0.4137812, -1.048154, -2.58385, 0.01568628, 1, 0, 1,
-0.410225, -0.9163417, -2.802291, 0.007843138, 1, 0, 1,
-0.4077621, -0.1476238, -2.498563, 0.003921569, 1, 0, 1,
-0.4051657, -1.032257, -3.523979, 0, 1, 0.003921569, 1,
-0.4035473, 0.06506871, -1.34177, 0, 1, 0.01176471, 1,
-0.4027592, -0.01115632, -1.542646, 0, 1, 0.01568628, 1,
-0.4012859, -0.9416582, -3.271689, 0, 1, 0.02352941, 1,
-0.3992883, -0.02164575, -1.704765, 0, 1, 0.02745098, 1,
-0.3987995, 0.2118248, -0.9267032, 0, 1, 0.03529412, 1,
-0.3985289, -1.655108, -2.075293, 0, 1, 0.03921569, 1,
-0.3974392, 0.1645482, -2.891339, 0, 1, 0.04705882, 1,
-0.3966931, 0.5785033, 0.5078835, 0, 1, 0.05098039, 1,
-0.3874657, -0.5854171, -2.308068, 0, 1, 0.05882353, 1,
-0.3834965, -0.3716006, -4.627604, 0, 1, 0.0627451, 1,
-0.3830344, -0.6812574, -4.06852, 0, 1, 0.07058824, 1,
-0.3820471, -0.8022047, -2.715097, 0, 1, 0.07450981, 1,
-0.3798849, 0.07132177, -1.363373, 0, 1, 0.08235294, 1,
-0.3761233, 0.8340039, 1.15112, 0, 1, 0.08627451, 1,
-0.369551, 1.195396, -1.458202, 0, 1, 0.09411765, 1,
-0.3694205, -0.58562, -2.624094, 0, 1, 0.1019608, 1,
-0.3692104, -0.7573112, -3.425022, 0, 1, 0.1058824, 1,
-0.3666431, 0.454279, -0.1812452, 0, 1, 0.1137255, 1,
-0.3613826, 0.4283404, 0.6617665, 0, 1, 0.1176471, 1,
-0.3613601, 0.8315067, 0.1254169, 0, 1, 0.1254902, 1,
-0.3575372, 0.9823831, -0.7559714, 0, 1, 0.1294118, 1,
-0.3574021, -0.811156, -3.867259, 0, 1, 0.1372549, 1,
-0.3521222, 0.4731371, 1.295529, 0, 1, 0.1411765, 1,
-0.3519277, -1.752066, -2.042961, 0, 1, 0.1490196, 1,
-0.3506829, 0.1587094, -0.01797919, 0, 1, 0.1529412, 1,
-0.3502758, 1.006983, -1.491476, 0, 1, 0.1607843, 1,
-0.3466204, 0.7801023, 0.8872536, 0, 1, 0.1647059, 1,
-0.3442809, -0.7741022, -5.424114, 0, 1, 0.172549, 1,
-0.3436663, 0.8470972, -0.169109, 0, 1, 0.1764706, 1,
-0.3427284, 0.9004627, 0.1362904, 0, 1, 0.1843137, 1,
-0.3421449, -0.1972812, -1.860574, 0, 1, 0.1882353, 1,
-0.3403841, 1.067877, -1.084245, 0, 1, 0.1960784, 1,
-0.3393306, -0.03697759, -1.621953, 0, 1, 0.2039216, 1,
-0.3384412, -0.2801568, -1.117618, 0, 1, 0.2078431, 1,
-0.3382346, -0.07856733, -0.1789968, 0, 1, 0.2156863, 1,
-0.3363059, 0.06369549, -1.935946, 0, 1, 0.2196078, 1,
-0.3329529, 0.2421704, -0.8195711, 0, 1, 0.227451, 1,
-0.3314902, 0.04140176, -1.527433, 0, 1, 0.2313726, 1,
-0.3269332, 2.346706, -0.9903336, 0, 1, 0.2392157, 1,
-0.3164085, 0.2947297, -0.675371, 0, 1, 0.2431373, 1,
-0.3132388, -1.259338, -3.485524, 0, 1, 0.2509804, 1,
-0.3130436, 0.5903711, -0.1215069, 0, 1, 0.254902, 1,
-0.3114516, -0.8172565, -1.812323, 0, 1, 0.2627451, 1,
-0.3069347, -0.4514752, -1.43674, 0, 1, 0.2666667, 1,
-0.3067065, -0.3729955, -2.048645, 0, 1, 0.2745098, 1,
-0.3007678, 2.849934, -1.861015, 0, 1, 0.2784314, 1,
-0.2910038, 0.8827041, -1.565776, 0, 1, 0.2862745, 1,
-0.2896931, 0.4410121, 1.969157, 0, 1, 0.2901961, 1,
-0.2894824, 0.5928286, -0.8755271, 0, 1, 0.2980392, 1,
-0.2890983, 0.2389638, -1.002734, 0, 1, 0.3058824, 1,
-0.2877655, 0.5770683, -0.5864448, 0, 1, 0.3098039, 1,
-0.2867863, -0.318277, -2.53573, 0, 1, 0.3176471, 1,
-0.2853393, -0.3081919, -2.558789, 0, 1, 0.3215686, 1,
-0.2833104, 2.072021, 0.04909584, 0, 1, 0.3294118, 1,
-0.2820783, -0.2084691, -1.929419, 0, 1, 0.3333333, 1,
-0.2817593, 0.8932474, 0.1730711, 0, 1, 0.3411765, 1,
-0.2809505, 0.7190505, 0.6872965, 0, 1, 0.345098, 1,
-0.2790149, -0.3555295, -1.040238, 0, 1, 0.3529412, 1,
-0.2778051, 0.8973153, 1.565908, 0, 1, 0.3568628, 1,
-0.269175, 2.387625, -1.751701, 0, 1, 0.3647059, 1,
-0.264399, 0.3229659, 0.364813, 0, 1, 0.3686275, 1,
-0.2631356, 0.795763, -1.624756, 0, 1, 0.3764706, 1,
-0.259336, 0.6442533, -0.6160032, 0, 1, 0.3803922, 1,
-0.2578616, -0.2897081, -2.881275, 0, 1, 0.3882353, 1,
-0.2536853, 0.7967609, -0.3677621, 0, 1, 0.3921569, 1,
-0.2500384, 0.5495644, -1.576253, 0, 1, 0.4, 1,
-0.2471568, 0.08070774, -2.094199, 0, 1, 0.4078431, 1,
-0.244561, 0.2083379, -1.473098, 0, 1, 0.4117647, 1,
-0.2433185, 0.4092366, -1.213409, 0, 1, 0.4196078, 1,
-0.2416315, -0.9657221, -4.957892, 0, 1, 0.4235294, 1,
-0.2395777, -0.1018677, -0.3519698, 0, 1, 0.4313726, 1,
-0.2346633, 0.1523428, -0.1983223, 0, 1, 0.4352941, 1,
-0.2326252, 0.02216556, -2.917673, 0, 1, 0.4431373, 1,
-0.2250418, -0.1927931, -1.943204, 0, 1, 0.4470588, 1,
-0.2232453, -0.3000363, -1.508564, 0, 1, 0.454902, 1,
-0.2229724, 0.5892739, -0.527551, 0, 1, 0.4588235, 1,
-0.2203993, -0.9525718, -3.151602, 0, 1, 0.4666667, 1,
-0.2167894, -1.040324, -2.590207, 0, 1, 0.4705882, 1,
-0.2098883, 1.086248, 1.53522, 0, 1, 0.4784314, 1,
-0.2058232, -1.352247, -2.020485, 0, 1, 0.4823529, 1,
-0.2029547, -1.392413, -5.073859, 0, 1, 0.4901961, 1,
-0.2004681, -1.950921, -3.380286, 0, 1, 0.4941176, 1,
-0.198805, 0.1754466, 0.06675617, 0, 1, 0.5019608, 1,
-0.1973911, 0.1555215, -1.240418, 0, 1, 0.509804, 1,
-0.1959341, -0.3960083, -1.834162, 0, 1, 0.5137255, 1,
-0.1926625, 0.1784898, -0.5763051, 0, 1, 0.5215687, 1,
-0.190641, 0.5190758, 1.309117, 0, 1, 0.5254902, 1,
-0.184422, -1.257372, -3.530407, 0, 1, 0.5333334, 1,
-0.1835432, -0.2312665, -2.550395, 0, 1, 0.5372549, 1,
-0.1818776, -1.870224, -3.282115, 0, 1, 0.5450981, 1,
-0.1817091, 0.1505025, 0.2051987, 0, 1, 0.5490196, 1,
-0.177037, -0.5571659, -3.492008, 0, 1, 0.5568628, 1,
-0.1677376, -0.4319487, -2.91194, 0, 1, 0.5607843, 1,
-0.159264, 0.3675861, -0.628786, 0, 1, 0.5686275, 1,
-0.1543868, 0.1796384, -1.011129, 0, 1, 0.572549, 1,
-0.151667, -0.5548345, -1.789486, 0, 1, 0.5803922, 1,
-0.148923, 0.2368155, 0.3135183, 0, 1, 0.5843138, 1,
-0.1483204, -0.448599, -3.747455, 0, 1, 0.5921569, 1,
-0.1457753, 0.2252772, 0.3645373, 0, 1, 0.5960785, 1,
-0.1439336, -0.4899191, -2.885639, 0, 1, 0.6039216, 1,
-0.1426354, -0.6250988, -4.297922, 0, 1, 0.6117647, 1,
-0.1425231, 1.604475, -0.3973988, 0, 1, 0.6156863, 1,
-0.140571, -0.5390716, -1.912532, 0, 1, 0.6235294, 1,
-0.1405673, -0.8521487, -3.13972, 0, 1, 0.627451, 1,
-0.1386232, -0.9761609, -4.242274, 0, 1, 0.6352941, 1,
-0.1383093, 1.655667, -0.680401, 0, 1, 0.6392157, 1,
-0.1321143, -1.616728, -3.121878, 0, 1, 0.6470588, 1,
-0.1320053, 1.582755, 1.341346, 0, 1, 0.6509804, 1,
-0.1290293, 0.5534636, -0.2715831, 0, 1, 0.6588235, 1,
-0.1278626, 1.143348, -0.4286076, 0, 1, 0.6627451, 1,
-0.1256734, 0.9346284, -1.100979, 0, 1, 0.6705883, 1,
-0.1255066, -1.773238, -5.536307, 0, 1, 0.6745098, 1,
-0.1224414, 0.1218607, -0.9231561, 0, 1, 0.682353, 1,
-0.119622, -2.460762, -3.121465, 0, 1, 0.6862745, 1,
-0.116534, -0.4731221, -1.869126, 0, 1, 0.6941177, 1,
-0.1154252, 1.144092, 0.6043437, 0, 1, 0.7019608, 1,
-0.1151351, -0.3613271, -1.867933, 0, 1, 0.7058824, 1,
-0.1146797, 0.6235961, 0.8376022, 0, 1, 0.7137255, 1,
-0.1142304, 0.293357, 1.014629, 0, 1, 0.7176471, 1,
-0.1007978, 0.5065236, 0.8541596, 0, 1, 0.7254902, 1,
-0.09830055, -0.7685742, -2.391141, 0, 1, 0.7294118, 1,
-0.09742983, -0.06886632, -1.737244, 0, 1, 0.7372549, 1,
-0.09580348, -0.2221157, -2.460939, 0, 1, 0.7411765, 1,
-0.094515, 2.433995, 0.0645581, 0, 1, 0.7490196, 1,
-0.09289051, 1.587096, 0.5200534, 0, 1, 0.7529412, 1,
-0.09088305, 0.09085625, 1.019767, 0, 1, 0.7607843, 1,
-0.08973332, -0.2516603, -4.700973, 0, 1, 0.7647059, 1,
-0.08858454, -0.108168, -1.776566, 0, 1, 0.772549, 1,
-0.08801603, -0.3784963, -1.604057, 0, 1, 0.7764706, 1,
-0.08640844, 1.127215, 0.9906465, 0, 1, 0.7843137, 1,
-0.07579605, -1.006638, -2.468734, 0, 1, 0.7882353, 1,
-0.07063422, -0.03689469, -3.262676, 0, 1, 0.7960784, 1,
-0.06537611, 1.702266, 0.9253402, 0, 1, 0.8039216, 1,
-0.06220357, 0.9714785, -0.3414527, 0, 1, 0.8078431, 1,
-0.06203311, 1.346331, -1.202225, 0, 1, 0.8156863, 1,
-0.05683069, 0.4092081, -3.064796, 0, 1, 0.8196079, 1,
-0.0560467, -1.808021, -3.624953, 0, 1, 0.827451, 1,
-0.05451433, -0.6467027, -5.499008, 0, 1, 0.8313726, 1,
-0.05376948, -1.06944, -4.562252, 0, 1, 0.8392157, 1,
-0.0510577, 1.331695, 1.06679, 0, 1, 0.8431373, 1,
-0.04410166, -0.6460226, -2.853075, 0, 1, 0.8509804, 1,
-0.03846305, 1.442961, -2.755638, 0, 1, 0.854902, 1,
-0.03638079, 0.4449914, -1.281859, 0, 1, 0.8627451, 1,
-0.03478609, 0.4578482, 0.4197585, 0, 1, 0.8666667, 1,
-0.03455792, -1.254583, -2.778664, 0, 1, 0.8745098, 1,
-0.02984624, 0.1640744, 0.9050217, 0, 1, 0.8784314, 1,
-0.02789211, -0.04730369, -3.860672, 0, 1, 0.8862745, 1,
-0.0254989, 1.477278, 0.2646084, 0, 1, 0.8901961, 1,
-0.02472513, -0.2379546, -1.562356, 0, 1, 0.8980392, 1,
-0.02183774, 1.114152, -0.642956, 0, 1, 0.9058824, 1,
-0.02024825, -0.2765, -1.908863, 0, 1, 0.9098039, 1,
-0.01622558, 0.6395183, -0.1313586, 0, 1, 0.9176471, 1,
-0.0157456, 0.2395373, -1.798135, 0, 1, 0.9215686, 1,
-0.01519463, 0.5789795, -1.272398, 0, 1, 0.9294118, 1,
-0.005460192, -0.2074432, -1.835702, 0, 1, 0.9333333, 1,
-0.004573205, 0.06584035, -0.6403372, 0, 1, 0.9411765, 1,
-0.001667556, -2.177274, -2.013552, 0, 1, 0.945098, 1,
0.005248451, -0.3309892, 3.592277, 0, 1, 0.9529412, 1,
0.01856216, 1.396771, -0.3966272, 0, 1, 0.9568627, 1,
0.0192137, 0.6722079, 1.413959, 0, 1, 0.9647059, 1,
0.0228928, 0.07964469, 2.240927, 0, 1, 0.9686275, 1,
0.0234723, 0.5942908, 1.505147, 0, 1, 0.9764706, 1,
0.0239718, 0.0478742, 1.463429, 0, 1, 0.9803922, 1,
0.0293722, -0.8895065, 3.257244, 0, 1, 0.9882353, 1,
0.038167, 0.7229913, -0.8049724, 0, 1, 0.9921569, 1,
0.038835, 1.321307, -0.05924511, 0, 1, 1, 1,
0.04074032, 1.291795, 0.4542464, 0, 0.9921569, 1, 1,
0.04271268, 0.9686385, 1.359714, 0, 0.9882353, 1, 1,
0.0432839, 0.6903959, 1.145494, 0, 0.9803922, 1, 1,
0.0447182, -0.5363499, 4.15981, 0, 0.9764706, 1, 1,
0.04577132, -0.0206548, 4.051675, 0, 0.9686275, 1, 1,
0.04828617, -0.1130425, 2.14511, 0, 0.9647059, 1, 1,
0.04929727, -0.7268537, 2.947865, 0, 0.9568627, 1, 1,
0.05022077, -1.144645, 2.686718, 0, 0.9529412, 1, 1,
0.05185728, -0.07015378, 2.565902, 0, 0.945098, 1, 1,
0.05473061, 1.081795, -0.6523457, 0, 0.9411765, 1, 1,
0.05611528, 0.1904345, 0.2019566, 0, 0.9333333, 1, 1,
0.06097573, 1.346582, 1.197757, 0, 0.9294118, 1, 1,
0.06359699, -0.1840964, 2.584593, 0, 0.9215686, 1, 1,
0.06388164, -1.330343, 1.912504, 0, 0.9176471, 1, 1,
0.06640738, 0.195455, 1.282132, 0, 0.9098039, 1, 1,
0.06713554, -1.589455, 2.673742, 0, 0.9058824, 1, 1,
0.06993438, 0.009538637, 1.538156, 0, 0.8980392, 1, 1,
0.07938543, -0.5232115, 1.729526, 0, 0.8901961, 1, 1,
0.07975288, -1.182052, 2.980196, 0, 0.8862745, 1, 1,
0.08499855, 0.3385233, 0.4719757, 0, 0.8784314, 1, 1,
0.0868343, -0.6012224, 1.999647, 0, 0.8745098, 1, 1,
0.08833729, 1.239463, -0.07172117, 0, 0.8666667, 1, 1,
0.09200347, -1.693481, 4.128728, 0, 0.8627451, 1, 1,
0.09327318, 0.9051036, 0.7633123, 0, 0.854902, 1, 1,
0.09455715, 0.1142304, 0.617789, 0, 0.8509804, 1, 1,
0.09865422, -0.9380108, 3.062161, 0, 0.8431373, 1, 1,
0.1022357, 1.986229, -0.1123204, 0, 0.8392157, 1, 1,
0.1025185, -0.6613973, 3.175818, 0, 0.8313726, 1, 1,
0.1038177, -0.2670635, 2.407537, 0, 0.827451, 1, 1,
0.1071912, -0.9205674, 1.702, 0, 0.8196079, 1, 1,
0.1127277, 0.7734982, -0.5399889, 0, 0.8156863, 1, 1,
0.1142403, 1.478717, 1.371246, 0, 0.8078431, 1, 1,
0.1150074, 0.2705131, -0.2886756, 0, 0.8039216, 1, 1,
0.1163802, 0.8624316, 1.211897, 0, 0.7960784, 1, 1,
0.1165458, -0.161773, 5.228034, 0, 0.7882353, 1, 1,
0.1185533, -0.2381411, 2.823059, 0, 0.7843137, 1, 1,
0.1201574, -1.415814, 3.4243, 0, 0.7764706, 1, 1,
0.1205419, -0.06714162, 1.903013, 0, 0.772549, 1, 1,
0.1230836, 0.438555, 1.096788, 0, 0.7647059, 1, 1,
0.1257235, 1.123319, -0.7046283, 0, 0.7607843, 1, 1,
0.1267158, -0.315204, 2.834876, 0, 0.7529412, 1, 1,
0.1272853, 0.9168945, 1.331809, 0, 0.7490196, 1, 1,
0.1277445, 0.4851325, -0.7444402, 0, 0.7411765, 1, 1,
0.1285224, 1.173272, 1.159543, 0, 0.7372549, 1, 1,
0.1297532, 0.2087607, -0.502308, 0, 0.7294118, 1, 1,
0.1297607, 1.461575, -0.5454259, 0, 0.7254902, 1, 1,
0.1302885, 0.2890065, -0.068106, 0, 0.7176471, 1, 1,
0.1315858, -0.2453291, 2.286795, 0, 0.7137255, 1, 1,
0.1328518, 1.305537, 0.3931051, 0, 0.7058824, 1, 1,
0.1367767, -1.122665, 2.304436, 0, 0.6980392, 1, 1,
0.137712, -0.06663301, 3.519278, 0, 0.6941177, 1, 1,
0.1382765, -0.6014228, 2.442045, 0, 0.6862745, 1, 1,
0.1396884, 0.4313706, -0.2748393, 0, 0.682353, 1, 1,
0.1437955, -0.1451688, 3.349029, 0, 0.6745098, 1, 1,
0.1439417, -0.6414069, 2.246939, 0, 0.6705883, 1, 1,
0.1452641, 0.92123, -0.6846545, 0, 0.6627451, 1, 1,
0.1457864, -1.342825, 4.038719, 0, 0.6588235, 1, 1,
0.1464135, -0.01953707, 0.8435623, 0, 0.6509804, 1, 1,
0.1466337, -0.6614063, 3.23491, 0, 0.6470588, 1, 1,
0.1475753, -0.7265173, 3.854694, 0, 0.6392157, 1, 1,
0.159168, -0.4035372, 0.815722, 0, 0.6352941, 1, 1,
0.1610257, -0.2162923, 0.9067712, 0, 0.627451, 1, 1,
0.1651154, -0.4806501, 2.907373, 0, 0.6235294, 1, 1,
0.1681233, 0.1032853, 0.714055, 0, 0.6156863, 1, 1,
0.1767051, 0.2413787, -0.07072273, 0, 0.6117647, 1, 1,
0.1767993, 1.439336, 0.05740973, 0, 0.6039216, 1, 1,
0.1781123, -1.092095, 2.520709, 0, 0.5960785, 1, 1,
0.1795765, -0.1318089, -0.1102542, 0, 0.5921569, 1, 1,
0.1816089, -0.2169131, 3.20289, 0, 0.5843138, 1, 1,
0.1855284, -0.45757, 2.188263, 0, 0.5803922, 1, 1,
0.1877598, -0.2895293, 1.842375, 0, 0.572549, 1, 1,
0.187789, -0.6823341, 3.629992, 0, 0.5686275, 1, 1,
0.1973536, -1.098525, 2.387215, 0, 0.5607843, 1, 1,
0.1996372, 1.830157, -0.8183022, 0, 0.5568628, 1, 1,
0.2031251, -1.280777, 2.52683, 0, 0.5490196, 1, 1,
0.2091363, -0.2368477, 2.804965, 0, 0.5450981, 1, 1,
0.2107772, -1.001786, 2.221175, 0, 0.5372549, 1, 1,
0.2113831, 0.1735696, 0.7377081, 0, 0.5333334, 1, 1,
0.2117581, -0.7160068, 0.07540452, 0, 0.5254902, 1, 1,
0.2150486, -0.4426765, 1.382038, 0, 0.5215687, 1, 1,
0.2189931, -0.5963097, 2.18072, 0, 0.5137255, 1, 1,
0.2297063, 1.153447, -1.477904, 0, 0.509804, 1, 1,
0.2312315, -0.7337531, 3.659043, 0, 0.5019608, 1, 1,
0.2348109, -0.2391475, 2.221332, 0, 0.4941176, 1, 1,
0.2351071, 1.156603, -0.1812919, 0, 0.4901961, 1, 1,
0.2409669, 0.1035425, 0.9213055, 0, 0.4823529, 1, 1,
0.2417282, 0.9270855, -0.06732634, 0, 0.4784314, 1, 1,
0.2423545, 0.7706598, -1.812778, 0, 0.4705882, 1, 1,
0.2427561, 0.6711236, 0.8975503, 0, 0.4666667, 1, 1,
0.2431201, -0.7196796, 4.703594, 0, 0.4588235, 1, 1,
0.2461963, 0.7558482, -0.02894562, 0, 0.454902, 1, 1,
0.2471767, 1.270123, 0.5844284, 0, 0.4470588, 1, 1,
0.264152, 1.255043, -1.278202, 0, 0.4431373, 1, 1,
0.2702774, 0.01209163, -0.04203434, 0, 0.4352941, 1, 1,
0.2711866, 1.146899, 0.2860125, 0, 0.4313726, 1, 1,
0.2768031, -1.648304, 4.240354, 0, 0.4235294, 1, 1,
0.2810277, 0.1080633, 0.6802816, 0, 0.4196078, 1, 1,
0.2812805, -0.3313234, 1.56196, 0, 0.4117647, 1, 1,
0.2822348, -0.3193502, 2.737045, 0, 0.4078431, 1, 1,
0.2857673, 0.2638783, 0.7048846, 0, 0.4, 1, 1,
0.2921401, -0.3232013, 3.535802, 0, 0.3921569, 1, 1,
0.2945116, 0.2493633, 0.4604233, 0, 0.3882353, 1, 1,
0.2976259, 0.1225135, 1.732896, 0, 0.3803922, 1, 1,
0.2995021, -1.043636, 4.300133, 0, 0.3764706, 1, 1,
0.308448, 0.8262472, -1.224536, 0, 0.3686275, 1, 1,
0.3087333, 2.764385, 0.6730202, 0, 0.3647059, 1, 1,
0.3129823, 1.531087, -0.3629651, 0, 0.3568628, 1, 1,
0.3134457, -1.361684, 3.883604, 0, 0.3529412, 1, 1,
0.3137634, 0.4598053, 0.5618247, 0, 0.345098, 1, 1,
0.3139886, 0.9516416, -1.016681, 0, 0.3411765, 1, 1,
0.3204316, -0.3239644, 2.363776, 0, 0.3333333, 1, 1,
0.3350034, -1.867984, 4.255419, 0, 0.3294118, 1, 1,
0.3358781, -0.1373026, 2.16998, 0, 0.3215686, 1, 1,
0.3395525, 1.066846, 0.3263617, 0, 0.3176471, 1, 1,
0.3412254, -0.4934582, 1.341318, 0, 0.3098039, 1, 1,
0.3415969, -1.597203, 1.462036, 0, 0.3058824, 1, 1,
0.345811, 0.1676873, 2.644463, 0, 0.2980392, 1, 1,
0.3469673, 0.8688731, -0.9508499, 0, 0.2901961, 1, 1,
0.3526913, 1.321971, 0.7540551, 0, 0.2862745, 1, 1,
0.3533921, -0.9103901, 3.603189, 0, 0.2784314, 1, 1,
0.3562295, -0.5187472, 2.145546, 0, 0.2745098, 1, 1,
0.3607168, 0.6252421, 1.245191, 0, 0.2666667, 1, 1,
0.3636024, -1.091014, 4.554772, 0, 0.2627451, 1, 1,
0.3666794, 0.4549184, 0.5964509, 0, 0.254902, 1, 1,
0.3693643, -0.4718032, 2.608888, 0, 0.2509804, 1, 1,
0.3714706, -0.02756473, 0.09433628, 0, 0.2431373, 1, 1,
0.3759046, -0.1265681, 0.7730843, 0, 0.2392157, 1, 1,
0.3763747, -0.8771906, 3.816445, 0, 0.2313726, 1, 1,
0.3817109, 0.343137, 2.127672, 0, 0.227451, 1, 1,
0.3834837, 0.88155, 1.920066, 0, 0.2196078, 1, 1,
0.3876128, 1.388244, 0.8285618, 0, 0.2156863, 1, 1,
0.3902012, -0.3674282, 3.141547, 0, 0.2078431, 1, 1,
0.4039455, 0.6562526, -1.450498, 0, 0.2039216, 1, 1,
0.4052972, -0.5896823, 2.249095, 0, 0.1960784, 1, 1,
0.4086998, 0.3753016, 1.183036, 0, 0.1882353, 1, 1,
0.4175507, 0.68248, 0.04612027, 0, 0.1843137, 1, 1,
0.4191016, -1.889022, 2.850064, 0, 0.1764706, 1, 1,
0.4224036, 1.312389, 0.4589586, 0, 0.172549, 1, 1,
0.4228144, -0.4509576, 1.559675, 0, 0.1647059, 1, 1,
0.4236028, -0.002033525, 2.758967, 0, 0.1607843, 1, 1,
0.4291468, -0.09471436, 1.960554, 0, 0.1529412, 1, 1,
0.429519, -0.390015, 1.927439, 0, 0.1490196, 1, 1,
0.4333244, -1.333452, 3.526357, 0, 0.1411765, 1, 1,
0.4338434, 1.269934, 0.4124106, 0, 0.1372549, 1, 1,
0.4365639, -1.813209, 3.249135, 0, 0.1294118, 1, 1,
0.4382527, 0.8360943, -0.5443498, 0, 0.1254902, 1, 1,
0.4445912, -0.05509881, 1.729261, 0, 0.1176471, 1, 1,
0.4495131, -2.081909, 2.953834, 0, 0.1137255, 1, 1,
0.4498915, 1.876655, 1.014812, 0, 0.1058824, 1, 1,
0.4502147, -0.4228411, 4.373381, 0, 0.09803922, 1, 1,
0.4548364, 0.07287994, -0.5311928, 0, 0.09411765, 1, 1,
0.457561, 1.483535, -1.511231, 0, 0.08627451, 1, 1,
0.4584738, -0.6248798, 1.640609, 0, 0.08235294, 1, 1,
0.4598163, 1.253557, 1.134418, 0, 0.07450981, 1, 1,
0.4606518, 1.212318, -0.4431215, 0, 0.07058824, 1, 1,
0.4616092, -0.2863944, 2.137959, 0, 0.0627451, 1, 1,
0.4617971, 0.5465143, -0.5183495, 0, 0.05882353, 1, 1,
0.4624541, 0.6728069, 1.249737, 0, 0.05098039, 1, 1,
0.466285, -0.3374782, 2.149271, 0, 0.04705882, 1, 1,
0.4669442, 1.19534, -1.013941, 0, 0.03921569, 1, 1,
0.4684326, 0.7551171, 1.45544, 0, 0.03529412, 1, 1,
0.468599, -0.8793025, 2.443808, 0, 0.02745098, 1, 1,
0.478317, 0.5209364, 0.8008243, 0, 0.02352941, 1, 1,
0.4793163, -0.4255371, 2.004175, 0, 0.01568628, 1, 1,
0.4801157, -1.922822, 3.599539, 0, 0.01176471, 1, 1,
0.4808499, -0.09423505, 0.7897666, 0, 0.003921569, 1, 1,
0.4838126, -1.803797, 2.44552, 0.003921569, 0, 1, 1,
0.4896699, -0.5202408, 2.103633, 0.007843138, 0, 1, 1,
0.4908808, -1.311324, 3.901574, 0.01568628, 0, 1, 1,
0.4967843, -1.120779, 2.271595, 0.01960784, 0, 1, 1,
0.50052, -0.7414169, 3.224793, 0.02745098, 0, 1, 1,
0.504713, -1.309716, 3.541349, 0.03137255, 0, 1, 1,
0.5075074, -0.4030535, 4.06104, 0.03921569, 0, 1, 1,
0.5116802, 1.022256, 0.9858903, 0.04313726, 0, 1, 1,
0.5140432, 0.8165967, 0.8168595, 0.05098039, 0, 1, 1,
0.5156991, 0.374984, 1.12452, 0.05490196, 0, 1, 1,
0.5200691, 0.8369511, 0.3176188, 0.0627451, 0, 1, 1,
0.5210754, 0.4760688, -0.3734006, 0.06666667, 0, 1, 1,
0.5233278, -0.7675577, 3.745629, 0.07450981, 0, 1, 1,
0.5265104, -0.1962026, 2.996938, 0.07843138, 0, 1, 1,
0.5277323, 0.9336351, 0.291256, 0.08627451, 0, 1, 1,
0.5350639, 0.6703516, 1.596328, 0.09019608, 0, 1, 1,
0.5390572, 0.3561984, 0.3676862, 0.09803922, 0, 1, 1,
0.5455073, -1.995584, 0.7516105, 0.1058824, 0, 1, 1,
0.5477737, -0.3648214, 1.458349, 0.1098039, 0, 1, 1,
0.5502094, 0.17784, 2.265824, 0.1176471, 0, 1, 1,
0.5521666, 0.8704314, 0.3019195, 0.1215686, 0, 1, 1,
0.5529081, 1.745103, -1.566828, 0.1294118, 0, 1, 1,
0.5571944, -0.5536585, -0.01141977, 0.1333333, 0, 1, 1,
0.5589629, -0.02392958, 2.489134, 0.1411765, 0, 1, 1,
0.5608773, 0.1355264, 0.4151333, 0.145098, 0, 1, 1,
0.564492, -0.3558956, 0.7173919, 0.1529412, 0, 1, 1,
0.5714892, 0.4715407, 1.330948, 0.1568628, 0, 1, 1,
0.5784013, 0.8746181, -0.5066055, 0.1647059, 0, 1, 1,
0.5826852, -0.2533188, 1.438775, 0.1686275, 0, 1, 1,
0.5838812, 0.03124515, 2.112359, 0.1764706, 0, 1, 1,
0.5853609, 1.371816, 1.54309, 0.1803922, 0, 1, 1,
0.5893598, -0.3616957, 3.261741, 0.1882353, 0, 1, 1,
0.5907999, -0.6143537, 1.49475, 0.1921569, 0, 1, 1,
0.5921618, -0.3653515, 0.9490911, 0.2, 0, 1, 1,
0.5937207, 0.7631057, -0.1919761, 0.2078431, 0, 1, 1,
0.599643, 1.448339, 0.2608162, 0.2117647, 0, 1, 1,
0.5998504, 2.905197, 1.218582, 0.2196078, 0, 1, 1,
0.6019301, 2.093753, -1.050809, 0.2235294, 0, 1, 1,
0.6029894, 0.241869, 0.03426961, 0.2313726, 0, 1, 1,
0.6049965, 1.24316, -0.7183089, 0.2352941, 0, 1, 1,
0.6068864, -0.2749286, 2.858019, 0.2431373, 0, 1, 1,
0.6088971, 0.8577168, 0.7117798, 0.2470588, 0, 1, 1,
0.612243, -1.104047, 0.7304712, 0.254902, 0, 1, 1,
0.6199589, -0.7519147, 1.055879, 0.2588235, 0, 1, 1,
0.6237527, -1.188593, 3.697271, 0.2666667, 0, 1, 1,
0.6239603, 0.5852487, 0.6003582, 0.2705882, 0, 1, 1,
0.624875, -0.1731299, 2.633695, 0.2784314, 0, 1, 1,
0.6253877, -0.3211633, 0.941626, 0.282353, 0, 1, 1,
0.6283914, 0.6676676, 1.932055, 0.2901961, 0, 1, 1,
0.6289424, 1.363498, -1.424491, 0.2941177, 0, 1, 1,
0.6307883, 1.608781, 1.407034, 0.3019608, 0, 1, 1,
0.6312755, -1.357011, 1.794909, 0.3098039, 0, 1, 1,
0.6343344, -1.697543, 3.159621, 0.3137255, 0, 1, 1,
0.6364363, -0.93276, 2.566486, 0.3215686, 0, 1, 1,
0.6379641, 0.436343, 2.47398, 0.3254902, 0, 1, 1,
0.6458266, 0.9943934, 0.9181452, 0.3333333, 0, 1, 1,
0.6510473, 1.423945, 1.83538, 0.3372549, 0, 1, 1,
0.6511205, 1.399181, -0.1838508, 0.345098, 0, 1, 1,
0.6518052, 0.008431832, 0.8702273, 0.3490196, 0, 1, 1,
0.6544061, -1.418216, 1.850126, 0.3568628, 0, 1, 1,
0.6612989, 0.04596933, 1.424715, 0.3607843, 0, 1, 1,
0.6648456, 0.5319074, 1.800391, 0.3686275, 0, 1, 1,
0.6705236, -0.4859486, 1.25388, 0.372549, 0, 1, 1,
0.6705762, -1.430233, 3.809731, 0.3803922, 0, 1, 1,
0.677497, 0.4757626, 1.008392, 0.3843137, 0, 1, 1,
0.6798872, -2.293457, 2.649774, 0.3921569, 0, 1, 1,
0.6865488, 0.4593479, 1.03611, 0.3960784, 0, 1, 1,
0.6879358, -1.092658, 3.537258, 0.4039216, 0, 1, 1,
0.6930928, -2.156389, 1.880691, 0.4117647, 0, 1, 1,
0.6984057, 0.7795371, 0.834819, 0.4156863, 0, 1, 1,
0.699086, -0.07598717, 2.231524, 0.4235294, 0, 1, 1,
0.7032833, 0.2541945, -0.2246826, 0.427451, 0, 1, 1,
0.7090281, -0.9633002, 2.748059, 0.4352941, 0, 1, 1,
0.7108747, -0.9197816, 2.059123, 0.4392157, 0, 1, 1,
0.7127348, -1.273082, 3.071195, 0.4470588, 0, 1, 1,
0.7140331, -0.9220801, 2.974769, 0.4509804, 0, 1, 1,
0.7175769, 0.9559063, 1.004535, 0.4588235, 0, 1, 1,
0.7188634, -1.276163, 3.174624, 0.4627451, 0, 1, 1,
0.7204639, 0.1721707, 1.67221, 0.4705882, 0, 1, 1,
0.7246112, -0.02570101, 0.3562191, 0.4745098, 0, 1, 1,
0.7273394, -2.310647, 2.638204, 0.4823529, 0, 1, 1,
0.7301615, -0.07941569, 0.8465206, 0.4862745, 0, 1, 1,
0.7303271, 0.8180102, 1.243212, 0.4941176, 0, 1, 1,
0.7305533, -0.12748, 3.222839, 0.5019608, 0, 1, 1,
0.7338929, -0.6261751, -0.4212914, 0.5058824, 0, 1, 1,
0.7390187, -0.1902177, 1.672527, 0.5137255, 0, 1, 1,
0.7437898, -1.059059, 1.755359, 0.5176471, 0, 1, 1,
0.7479192, 1.066479, 1.881081, 0.5254902, 0, 1, 1,
0.7521949, -0.4058958, 2.188254, 0.5294118, 0, 1, 1,
0.759352, -0.2077192, 1.940966, 0.5372549, 0, 1, 1,
0.7642031, -1.735549, 2.488281, 0.5411765, 0, 1, 1,
0.7647917, 0.9158511, 0.4964896, 0.5490196, 0, 1, 1,
0.7655396, -2.736165, 1.94145, 0.5529412, 0, 1, 1,
0.7680408, 2.448822, -1.388154, 0.5607843, 0, 1, 1,
0.7981547, -0.934614, 2.572907, 0.5647059, 0, 1, 1,
0.8073446, 0.4115139, 1.349662, 0.572549, 0, 1, 1,
0.8080072, 0.3536609, 2.903837, 0.5764706, 0, 1, 1,
0.8090252, 1.219302, 1.522321, 0.5843138, 0, 1, 1,
0.8136807, -0.1623348, 1.616307, 0.5882353, 0, 1, 1,
0.8138514, 0.9156607, -0.1840948, 0.5960785, 0, 1, 1,
0.8176183, -0.0599281, 0.4863867, 0.6039216, 0, 1, 1,
0.8178685, 0.3094316, 0.9945145, 0.6078432, 0, 1, 1,
0.8215319, -0.8208126, 2.709538, 0.6156863, 0, 1, 1,
0.8241682, -1.047572, 1.966296, 0.6196079, 0, 1, 1,
0.826215, 0.3207574, 2.752619, 0.627451, 0, 1, 1,
0.8263444, 0.6896709, 0.7040288, 0.6313726, 0, 1, 1,
0.8291013, 0.371044, 0.3159007, 0.6392157, 0, 1, 1,
0.8318708, -0.6395554, 3.60255, 0.6431373, 0, 1, 1,
0.8329739, -0.2273166, 1.048746, 0.6509804, 0, 1, 1,
0.8340573, -0.7659779, 3.032382, 0.654902, 0, 1, 1,
0.8342443, 0.4663474, -0.07103696, 0.6627451, 0, 1, 1,
0.8358551, 0.1956106, 1.224209, 0.6666667, 0, 1, 1,
0.8416864, -0.7603036, 2.36617, 0.6745098, 0, 1, 1,
0.8443678, -1.447738, 2.555171, 0.6784314, 0, 1, 1,
0.8465576, 1.99507, 0.8471753, 0.6862745, 0, 1, 1,
0.8493254, 0.4262447, 1.027079, 0.6901961, 0, 1, 1,
0.8521404, -0.4008631, 2.480682, 0.6980392, 0, 1, 1,
0.8528553, 0.3074362, 0.293058, 0.7058824, 0, 1, 1,
0.852985, -0.8404384, 3.816082, 0.7098039, 0, 1, 1,
0.8545856, -0.159399, 3.02648, 0.7176471, 0, 1, 1,
0.8571686, -1.018236, 4.310341, 0.7215686, 0, 1, 1,
0.8590949, 0.1966405, 2.15221, 0.7294118, 0, 1, 1,
0.8602936, -1.092237, 0.4032347, 0.7333333, 0, 1, 1,
0.8615589, -0.4802617, 2.657751, 0.7411765, 0, 1, 1,
0.8725036, -0.9796667, 0.8081779, 0.7450981, 0, 1, 1,
0.8735344, -0.6260715, 0.7562384, 0.7529412, 0, 1, 1,
0.8747485, 0.167505, 0.4350114, 0.7568628, 0, 1, 1,
0.8749219, 1.034638, 1.602762, 0.7647059, 0, 1, 1,
0.8799012, -0.8270229, 1.764756, 0.7686275, 0, 1, 1,
0.8803985, 0.1491446, 3.165536, 0.7764706, 0, 1, 1,
0.8854316, -0.7407448, 2.578018, 0.7803922, 0, 1, 1,
0.8858076, 0.6381032, 0.2971248, 0.7882353, 0, 1, 1,
0.8894912, -0.6850505, 2.451124, 0.7921569, 0, 1, 1,
0.8960013, -1.867084, 3.748835, 0.8, 0, 1, 1,
0.8973586, -0.9585815, 2.585375, 0.8078431, 0, 1, 1,
0.8981899, -0.9797594, 3.027044, 0.8117647, 0, 1, 1,
0.9034643, -0.344753, 1.894719, 0.8196079, 0, 1, 1,
0.9036539, -1.579844, 3.678377, 0.8235294, 0, 1, 1,
0.9063857, -0.2151563, 1.46141, 0.8313726, 0, 1, 1,
0.9122553, 2.367937, -0.1597164, 0.8352941, 0, 1, 1,
0.9126098, 0.5700403, -0.5025763, 0.8431373, 0, 1, 1,
0.9157282, 2.624456, 0.7350294, 0.8470588, 0, 1, 1,
0.9160301, 1.61333, 0.8687963, 0.854902, 0, 1, 1,
0.9194666, -0.2004353, 2.260602, 0.8588235, 0, 1, 1,
0.9259023, -0.7268285, 2.773887, 0.8666667, 0, 1, 1,
0.9272757, 0.651089, 1.860876, 0.8705882, 0, 1, 1,
0.9294639, 1.832557, 0.5447366, 0.8784314, 0, 1, 1,
0.9294916, -0.1386194, 1.197854, 0.8823529, 0, 1, 1,
0.9307977, 0.03794771, 2.682826, 0.8901961, 0, 1, 1,
0.9310061, -1.864114, 2.101683, 0.8941177, 0, 1, 1,
0.9470609, -2.004339, 2.459263, 0.9019608, 0, 1, 1,
0.9483209, 0.5888485, 0.07499743, 0.9098039, 0, 1, 1,
0.9502555, 0.0841139, 2.19828, 0.9137255, 0, 1, 1,
0.9627527, 0.004974108, 1.046254, 0.9215686, 0, 1, 1,
0.9705514, 2.794206, -0.09601646, 0.9254902, 0, 1, 1,
0.9758959, -0.2816246, 1.652564, 0.9333333, 0, 1, 1,
0.9858909, 0.5343245, 1.093528, 0.9372549, 0, 1, 1,
0.9891977, 1.016491, 1.12828, 0.945098, 0, 1, 1,
0.9999669, 0.4974981, 1.537226, 0.9490196, 0, 1, 1,
1.004955, 2.309327, -0.4833541, 0.9568627, 0, 1, 1,
1.007743, 0.6607907, 2.055443, 0.9607843, 0, 1, 1,
1.015228, 0.1726592, 1.294589, 0.9686275, 0, 1, 1,
1.015489, -0.04936756, 3.417095, 0.972549, 0, 1, 1,
1.016295, -0.9903967, 2.162719, 0.9803922, 0, 1, 1,
1.021333, -1.350353, 5.152318, 0.9843137, 0, 1, 1,
1.026343, -0.3124305, -0.1792881, 0.9921569, 0, 1, 1,
1.02796, 1.223002, 1.188008, 0.9960784, 0, 1, 1,
1.030234, 1.586469, 0.5639582, 1, 0, 0.9960784, 1,
1.033951, -0.8040293, 1.70683, 1, 0, 0.9882353, 1,
1.038373, -1.554913, 1.827074, 1, 0, 0.9843137, 1,
1.040541, -0.1538435, 2.506646, 1, 0, 0.9764706, 1,
1.045148, 1.264443, 1.639368, 1, 0, 0.972549, 1,
1.047994, 1.065437, 1.574044, 1, 0, 0.9647059, 1,
1.054541, -0.7495999, 0.2644636, 1, 0, 0.9607843, 1,
1.057664, 1.754798, -1.015337, 1, 0, 0.9529412, 1,
1.057811, 0.2813004, 1.129092, 1, 0, 0.9490196, 1,
1.061822, -0.002389472, 0.8124076, 1, 0, 0.9411765, 1,
1.062421, 0.6842499, 1.262877, 1, 0, 0.9372549, 1,
1.066992, -0.1789697, 2.31432, 1, 0, 0.9294118, 1,
1.067862, -0.4806047, 3.310303, 1, 0, 0.9254902, 1,
1.069054, -0.5794724, 2.51111, 1, 0, 0.9176471, 1,
1.069991, 2.058279, -0.5994286, 1, 0, 0.9137255, 1,
1.079557, 0.2874722, 0.191668, 1, 0, 0.9058824, 1,
1.081475, -0.3482063, 0.44575, 1, 0, 0.9019608, 1,
1.098197, -0.6832698, 2.932508, 1, 0, 0.8941177, 1,
1.09936, 0.1315797, -0.2914388, 1, 0, 0.8862745, 1,
1.099771, 0.2003096, 1.125158, 1, 0, 0.8823529, 1,
1.112226, -0.1989294, 3.274993, 1, 0, 0.8745098, 1,
1.112784, -1.518172, 2.365321, 1, 0, 0.8705882, 1,
1.118929, 1.338831, -0.0007276287, 1, 0, 0.8627451, 1,
1.120775, -0.1812059, 1.498231, 1, 0, 0.8588235, 1,
1.128109, -0.5782296, 0.7225798, 1, 0, 0.8509804, 1,
1.128953, -1.218006, 2.625904, 1, 0, 0.8470588, 1,
1.131058, -1.78334, 2.913482, 1, 0, 0.8392157, 1,
1.136104, 0.6393115, 1.202651, 1, 0, 0.8352941, 1,
1.137912, 1.995737, -0.4609265, 1, 0, 0.827451, 1,
1.138441, 0.8095175, 2.398229, 1, 0, 0.8235294, 1,
1.145959, -1.318297, 4.363957, 1, 0, 0.8156863, 1,
1.148183, -0.9423412, 1.899147, 1, 0, 0.8117647, 1,
1.157872, -0.5820476, 1.461374, 1, 0, 0.8039216, 1,
1.163759, -1.445539, 3.061699, 1, 0, 0.7960784, 1,
1.164363, 1.200296, 2.10448, 1, 0, 0.7921569, 1,
1.170123, 0.7635192, 0.8484048, 1, 0, 0.7843137, 1,
1.172973, 0.02744258, 0.3017301, 1, 0, 0.7803922, 1,
1.174347, -0.8329595, 3.510442, 1, 0, 0.772549, 1,
1.179688, -0.566112, 1.419402, 1, 0, 0.7686275, 1,
1.180522, 1.220718, 0.8566843, 1, 0, 0.7607843, 1,
1.184529, 0.5506625, -0.05473635, 1, 0, 0.7568628, 1,
1.186193, 0.02738119, 2.125194, 1, 0, 0.7490196, 1,
1.190422, 0.3920982, 1.720042, 1, 0, 0.7450981, 1,
1.190727, -0.4730212, 0.6860563, 1, 0, 0.7372549, 1,
1.191225, 0.4449343, 0.8017209, 1, 0, 0.7333333, 1,
1.193033, 0.3280856, 1.232739, 1, 0, 0.7254902, 1,
1.193207, 0.1218927, 1.1145, 1, 0, 0.7215686, 1,
1.202672, 0.2520796, 2.3971, 1, 0, 0.7137255, 1,
1.203225, 0.2757138, 0.6986358, 1, 0, 0.7098039, 1,
1.207374, -1.439641, 1.381912, 1, 0, 0.7019608, 1,
1.224134, 0.4979616, 1.045954, 1, 0, 0.6941177, 1,
1.225326, 0.8492931, 3.054144, 1, 0, 0.6901961, 1,
1.227158, 0.3353291, 2.238794, 1, 0, 0.682353, 1,
1.256651, -0.9763727, 2.503027, 1, 0, 0.6784314, 1,
1.257038, -0.2844591, 0.822246, 1, 0, 0.6705883, 1,
1.261997, -0.6716248, 2.580566, 1, 0, 0.6666667, 1,
1.264661, 0.2884589, 1.875351, 1, 0, 0.6588235, 1,
1.265803, -0.7118227, 1.102273, 1, 0, 0.654902, 1,
1.267491, -0.5668747, 0.4615697, 1, 0, 0.6470588, 1,
1.270472, -1.265079, 3.382567, 1, 0, 0.6431373, 1,
1.273334, 1.409606, 0.6473362, 1, 0, 0.6352941, 1,
1.28325, 0.7700751, 2.318025, 1, 0, 0.6313726, 1,
1.289653, -0.5862529, 0.153078, 1, 0, 0.6235294, 1,
1.305441, -0.2565242, 1.669256, 1, 0, 0.6196079, 1,
1.305441, 0.7758956, 1.170929, 1, 0, 0.6117647, 1,
1.306528, 0.3104771, 2.438614, 1, 0, 0.6078432, 1,
1.327947, 1.392599, 1.583647, 1, 0, 0.6, 1,
1.338753, 0.4024378, 3.090185, 1, 0, 0.5921569, 1,
1.341256, 1.135721, -0.1306093, 1, 0, 0.5882353, 1,
1.343988, -1.262392, 2.187436, 1, 0, 0.5803922, 1,
1.350561, 1.813268, 1.412946, 1, 0, 0.5764706, 1,
1.350603, -0.01351766, 2.030545, 1, 0, 0.5686275, 1,
1.362229, -0.138709, 2.453247, 1, 0, 0.5647059, 1,
1.370376, 0.3757606, 0.3756233, 1, 0, 0.5568628, 1,
1.387746, -0.0891829, 2.336603, 1, 0, 0.5529412, 1,
1.389236, 0.03201746, -1.440528, 1, 0, 0.5450981, 1,
1.392263, 2.969723, 0.2125788, 1, 0, 0.5411765, 1,
1.41426, 1.212494, 0.9367732, 1, 0, 0.5333334, 1,
1.453505, 0.2579571, 0.9325226, 1, 0, 0.5294118, 1,
1.483613, 0.3414586, 0.04203579, 1, 0, 0.5215687, 1,
1.491256, -2.033248, 1.133045, 1, 0, 0.5176471, 1,
1.493432, 0.03041489, 2.231355, 1, 0, 0.509804, 1,
1.493888, -1.001509, 1.160346, 1, 0, 0.5058824, 1,
1.510243, -0.1392932, 2.089683, 1, 0, 0.4980392, 1,
1.512078, -2.515301, 4.14466, 1, 0, 0.4901961, 1,
1.519921, 0.2738739, 1.058234, 1, 0, 0.4862745, 1,
1.52513, -0.341383, 3.29501, 1, 0, 0.4784314, 1,
1.529203, -2.284233, 1.646818, 1, 0, 0.4745098, 1,
1.531222, 0.6115535, 0.2116687, 1, 0, 0.4666667, 1,
1.532977, -0.05305281, 4.303018, 1, 0, 0.4627451, 1,
1.533941, -0.1814828, 2.804506, 1, 0, 0.454902, 1,
1.534664, 0.2848816, 1.830596, 1, 0, 0.4509804, 1,
1.552434, 0.7374286, 2.286558, 1, 0, 0.4431373, 1,
1.555666, 0.1165663, 1.282062, 1, 0, 0.4392157, 1,
1.555878, 1.293995, -0.0442053, 1, 0, 0.4313726, 1,
1.555956, 0.8349673, 1.83625, 1, 0, 0.427451, 1,
1.567938, -2.891158, 4.445055, 1, 0, 0.4196078, 1,
1.570663, -2.294776, 2.882133, 1, 0, 0.4156863, 1,
1.572467, -0.2927277, 1.04941, 1, 0, 0.4078431, 1,
1.574777, 0.9231541, 2.155164, 1, 0, 0.4039216, 1,
1.61136, 0.02352945, 2.016653, 1, 0, 0.3960784, 1,
1.61159, 0.3575529, 1.314145, 1, 0, 0.3882353, 1,
1.614329, 2.566198, 1.738318, 1, 0, 0.3843137, 1,
1.621567, 0.03033226, 1.863055, 1, 0, 0.3764706, 1,
1.648119, -0.1372904, 1.211682, 1, 0, 0.372549, 1,
1.662865, -0.02897568, 1.81883, 1, 0, 0.3647059, 1,
1.662916, -0.8797624, 3.30961, 1, 0, 0.3607843, 1,
1.66739, 0.2196622, 0.3581576, 1, 0, 0.3529412, 1,
1.670979, 1.247897, 2.353272, 1, 0, 0.3490196, 1,
1.672126, 1.764977, 0.6058334, 1, 0, 0.3411765, 1,
1.698407, 0.3871179, -0.6690277, 1, 0, 0.3372549, 1,
1.708633, 1.037373, 1.808432, 1, 0, 0.3294118, 1,
1.715121, 0.9436182, -0.5741999, 1, 0, 0.3254902, 1,
1.724649, 0.371553, 0.7491738, 1, 0, 0.3176471, 1,
1.729326, -1.552241, 3.093643, 1, 0, 0.3137255, 1,
1.741969, -0.02967709, 0.6355042, 1, 0, 0.3058824, 1,
1.756171, -0.2694741, 3.324461, 1, 0, 0.2980392, 1,
1.758374, 0.2841692, 2.83913, 1, 0, 0.2941177, 1,
1.773179, -0.631013, 1.904347, 1, 0, 0.2862745, 1,
1.788498, -0.4727678, 0.883994, 1, 0, 0.282353, 1,
1.805195, -0.3242768, -1.027032, 1, 0, 0.2745098, 1,
1.809721, 1.243774, 2.653853, 1, 0, 0.2705882, 1,
1.811425, -1.846043, 1.852362, 1, 0, 0.2627451, 1,
1.829467, 0.08877282, 2.197145, 1, 0, 0.2588235, 1,
1.842524, 0.4987943, -0.1149823, 1, 0, 0.2509804, 1,
1.848449, 0.5616435, 1.365089, 1, 0, 0.2470588, 1,
1.8512, -0.09590416, 2.193853, 1, 0, 0.2392157, 1,
1.853472, -0.7419785, 0.8588796, 1, 0, 0.2352941, 1,
1.861795, -0.004664445, 0.901643, 1, 0, 0.227451, 1,
1.868362, -0.5018535, 2.032679, 1, 0, 0.2235294, 1,
1.877445, 0.6888027, 1.54227, 1, 0, 0.2156863, 1,
1.888367, -0.7875518, 0.4356831, 1, 0, 0.2117647, 1,
1.947697, -1.366833, 0.9799969, 1, 0, 0.2039216, 1,
1.964916, -1.937523, 1.860976, 1, 0, 0.1960784, 1,
1.983354, 0.814202, 0.184418, 1, 0, 0.1921569, 1,
1.992523, -0.251813, 0.7012705, 1, 0, 0.1843137, 1,
1.995564, -0.3245065, 1.492518, 1, 0, 0.1803922, 1,
2.00598, -0.1295645, 1.973909, 1, 0, 0.172549, 1,
2.00965, 0.6034822, 2.373671, 1, 0, 0.1686275, 1,
2.01742, -1.163519, 2.60817, 1, 0, 0.1607843, 1,
2.021961, 1.76559, 2.673838, 1, 0, 0.1568628, 1,
2.032435, 0.8104338, 1.005331, 1, 0, 0.1490196, 1,
2.035496, 2.08511, 1.290971, 1, 0, 0.145098, 1,
2.076245, 0.02333185, 0.4413535, 1, 0, 0.1372549, 1,
2.081091, -0.2893814, 2.269531, 1, 0, 0.1333333, 1,
2.106085, -1.138857, 2.942543, 1, 0, 0.1254902, 1,
2.11523, 0.7315925, 0.6295738, 1, 0, 0.1215686, 1,
2.117375, -0.04315489, 1.039964, 1, 0, 0.1137255, 1,
2.183662, 1.378524, 0.2196891, 1, 0, 0.1098039, 1,
2.216068, 1.744063, -0.1585504, 1, 0, 0.1019608, 1,
2.289299, 0.2758391, 1.872488, 1, 0, 0.09411765, 1,
2.306919, 2.739365, 0.08051367, 1, 0, 0.09019608, 1,
2.372135, 0.07396474, 1.379139, 1, 0, 0.08235294, 1,
2.38143, -0.1757683, 2.534668, 1, 0, 0.07843138, 1,
2.38836, 0.5265149, 1.609075, 1, 0, 0.07058824, 1,
2.405144, -0.0330572, 3.242485, 1, 0, 0.06666667, 1,
2.472125, -1.748793, 1.373441, 1, 0, 0.05882353, 1,
2.478518, -0.003829745, 1.867955, 1, 0, 0.05490196, 1,
2.500176, 0.2626895, -0.7668893, 1, 0, 0.04705882, 1,
2.593043, 1.492741, -0.9158982, 1, 0, 0.04313726, 1,
2.63733, -0.4880203, 1.108207, 1, 0, 0.03529412, 1,
2.685899, -0.7459152, 2.48662, 1, 0, 0.03137255, 1,
2.715548, 1.464567, 2.921855, 1, 0, 0.02352941, 1,
2.741671, 1.795316, 2.917342, 1, 0, 0.01960784, 1,
2.863418, 0.4292938, 0.1895053, 1, 0, 0.01176471, 1,
2.969328, -0.6632818, 2.094087, 1, 0, 0.007843138, 1
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
-0.2110691, -4.134848, -7.360863, 0, -0.5, 0.5, 0.5,
-0.2110691, -4.134848, -7.360863, 1, -0.5, 0.5, 0.5,
-0.2110691, -4.134848, -7.360863, 1, 1.5, 0.5, 0.5,
-0.2110691, -4.134848, -7.360863, 0, 1.5, 0.5, 0.5
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
-4.469621, 0.3090674, -7.360863, 0, -0.5, 0.5, 0.5,
-4.469621, 0.3090674, -7.360863, 1, -0.5, 0.5, 0.5,
-4.469621, 0.3090674, -7.360863, 1, 1.5, 0.5, 0.5,
-4.469621, 0.3090674, -7.360863, 0, 1.5, 0.5, 0.5
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
-4.469621, -4.134848, -0.1541367, 0, -0.5, 0.5, 0.5,
-4.469621, -4.134848, -0.1541367, 1, -0.5, 0.5, 0.5,
-4.469621, -4.134848, -0.1541367, 1, 1.5, 0.5, 0.5,
-4.469621, -4.134848, -0.1541367, 0, 1.5, 0.5, 0.5
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
-3, -3.109329, -5.697773,
2, -3.109329, -5.697773,
-3, -3.109329, -5.697773,
-3, -3.280249, -5.974954,
-2, -3.109329, -5.697773,
-2, -3.280249, -5.974954,
-1, -3.109329, -5.697773,
-1, -3.280249, -5.974954,
0, -3.109329, -5.697773,
0, -3.280249, -5.974954,
1, -3.109329, -5.697773,
1, -3.280249, -5.974954,
2, -3.109329, -5.697773,
2, -3.280249, -5.974954
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
-3, -3.622089, -6.529318, 0, -0.5, 0.5, 0.5,
-3, -3.622089, -6.529318, 1, -0.5, 0.5, 0.5,
-3, -3.622089, -6.529318, 1, 1.5, 0.5, 0.5,
-3, -3.622089, -6.529318, 0, 1.5, 0.5, 0.5,
-2, -3.622089, -6.529318, 0, -0.5, 0.5, 0.5,
-2, -3.622089, -6.529318, 1, -0.5, 0.5, 0.5,
-2, -3.622089, -6.529318, 1, 1.5, 0.5, 0.5,
-2, -3.622089, -6.529318, 0, 1.5, 0.5, 0.5,
-1, -3.622089, -6.529318, 0, -0.5, 0.5, 0.5,
-1, -3.622089, -6.529318, 1, -0.5, 0.5, 0.5,
-1, -3.622089, -6.529318, 1, 1.5, 0.5, 0.5,
-1, -3.622089, -6.529318, 0, 1.5, 0.5, 0.5,
0, -3.622089, -6.529318, 0, -0.5, 0.5, 0.5,
0, -3.622089, -6.529318, 1, -0.5, 0.5, 0.5,
0, -3.622089, -6.529318, 1, 1.5, 0.5, 0.5,
0, -3.622089, -6.529318, 0, 1.5, 0.5, 0.5,
1, -3.622089, -6.529318, 0, -0.5, 0.5, 0.5,
1, -3.622089, -6.529318, 1, -0.5, 0.5, 0.5,
1, -3.622089, -6.529318, 1, 1.5, 0.5, 0.5,
1, -3.622089, -6.529318, 0, 1.5, 0.5, 0.5,
2, -3.622089, -6.529318, 0, -0.5, 0.5, 0.5,
2, -3.622089, -6.529318, 1, -0.5, 0.5, 0.5,
2, -3.622089, -6.529318, 1, 1.5, 0.5, 0.5,
2, -3.622089, -6.529318, 0, 1.5, 0.5, 0.5
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
-3.486879, -3, -5.697773,
-3.486879, 3, -5.697773,
-3.486879, -3, -5.697773,
-3.650669, -3, -5.974954,
-3.486879, -2, -5.697773,
-3.650669, -2, -5.974954,
-3.486879, -1, -5.697773,
-3.650669, -1, -5.974954,
-3.486879, 0, -5.697773,
-3.650669, 0, -5.974954,
-3.486879, 1, -5.697773,
-3.650669, 1, -5.974954,
-3.486879, 2, -5.697773,
-3.650669, 2, -5.974954,
-3.486879, 3, -5.697773,
-3.650669, 3, -5.974954
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
-3.97825, -3, -6.529318, 0, -0.5, 0.5, 0.5,
-3.97825, -3, -6.529318, 1, -0.5, 0.5, 0.5,
-3.97825, -3, -6.529318, 1, 1.5, 0.5, 0.5,
-3.97825, -3, -6.529318, 0, 1.5, 0.5, 0.5,
-3.97825, -2, -6.529318, 0, -0.5, 0.5, 0.5,
-3.97825, -2, -6.529318, 1, -0.5, 0.5, 0.5,
-3.97825, -2, -6.529318, 1, 1.5, 0.5, 0.5,
-3.97825, -2, -6.529318, 0, 1.5, 0.5, 0.5,
-3.97825, -1, -6.529318, 0, -0.5, 0.5, 0.5,
-3.97825, -1, -6.529318, 1, -0.5, 0.5, 0.5,
-3.97825, -1, -6.529318, 1, 1.5, 0.5, 0.5,
-3.97825, -1, -6.529318, 0, 1.5, 0.5, 0.5,
-3.97825, 0, -6.529318, 0, -0.5, 0.5, 0.5,
-3.97825, 0, -6.529318, 1, -0.5, 0.5, 0.5,
-3.97825, 0, -6.529318, 1, 1.5, 0.5, 0.5,
-3.97825, 0, -6.529318, 0, 1.5, 0.5, 0.5,
-3.97825, 1, -6.529318, 0, -0.5, 0.5, 0.5,
-3.97825, 1, -6.529318, 1, -0.5, 0.5, 0.5,
-3.97825, 1, -6.529318, 1, 1.5, 0.5, 0.5,
-3.97825, 1, -6.529318, 0, 1.5, 0.5, 0.5,
-3.97825, 2, -6.529318, 0, -0.5, 0.5, 0.5,
-3.97825, 2, -6.529318, 1, -0.5, 0.5, 0.5,
-3.97825, 2, -6.529318, 1, 1.5, 0.5, 0.5,
-3.97825, 2, -6.529318, 0, 1.5, 0.5, 0.5,
-3.97825, 3, -6.529318, 0, -0.5, 0.5, 0.5,
-3.97825, 3, -6.529318, 1, -0.5, 0.5, 0.5,
-3.97825, 3, -6.529318, 1, 1.5, 0.5, 0.5,
-3.97825, 3, -6.529318, 0, 1.5, 0.5, 0.5
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
-3.486879, -3.109329, -4,
-3.486879, -3.109329, 4,
-3.486879, -3.109329, -4,
-3.650669, -3.280249, -4,
-3.486879, -3.109329, -2,
-3.650669, -3.280249, -2,
-3.486879, -3.109329, 0,
-3.650669, -3.280249, 0,
-3.486879, -3.109329, 2,
-3.650669, -3.280249, 2,
-3.486879, -3.109329, 4,
-3.650669, -3.280249, 4
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
-3.97825, -3.622089, -4, 0, -0.5, 0.5, 0.5,
-3.97825, -3.622089, -4, 1, -0.5, 0.5, 0.5,
-3.97825, -3.622089, -4, 1, 1.5, 0.5, 0.5,
-3.97825, -3.622089, -4, 0, 1.5, 0.5, 0.5,
-3.97825, -3.622089, -2, 0, -0.5, 0.5, 0.5,
-3.97825, -3.622089, -2, 1, -0.5, 0.5, 0.5,
-3.97825, -3.622089, -2, 1, 1.5, 0.5, 0.5,
-3.97825, -3.622089, -2, 0, 1.5, 0.5, 0.5,
-3.97825, -3.622089, 0, 0, -0.5, 0.5, 0.5,
-3.97825, -3.622089, 0, 1, -0.5, 0.5, 0.5,
-3.97825, -3.622089, 0, 1, 1.5, 0.5, 0.5,
-3.97825, -3.622089, 0, 0, 1.5, 0.5, 0.5,
-3.97825, -3.622089, 2, 0, -0.5, 0.5, 0.5,
-3.97825, -3.622089, 2, 1, -0.5, 0.5, 0.5,
-3.97825, -3.622089, 2, 1, 1.5, 0.5, 0.5,
-3.97825, -3.622089, 2, 0, 1.5, 0.5, 0.5,
-3.97825, -3.622089, 4, 0, -0.5, 0.5, 0.5,
-3.97825, -3.622089, 4, 1, -0.5, 0.5, 0.5,
-3.97825, -3.622089, 4, 1, 1.5, 0.5, 0.5,
-3.97825, -3.622089, 4, 0, 1.5, 0.5, 0.5
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
-3.486879, -3.109329, -5.697773,
-3.486879, 3.727464, -5.697773,
-3.486879, -3.109329, 5.389499,
-3.486879, 3.727464, 5.389499,
-3.486879, -3.109329, -5.697773,
-3.486879, -3.109329, 5.389499,
-3.486879, 3.727464, -5.697773,
-3.486879, 3.727464, 5.389499,
-3.486879, -3.109329, -5.697773,
3.06474, -3.109329, -5.697773,
-3.486879, -3.109329, 5.389499,
3.06474, -3.109329, 5.389499,
-3.486879, 3.727464, -5.697773,
3.06474, 3.727464, -5.697773,
-3.486879, 3.727464, 5.389499,
3.06474, 3.727464, 5.389499,
3.06474, -3.109329, -5.697773,
3.06474, 3.727464, -5.697773,
3.06474, -3.109329, 5.389499,
3.06474, 3.727464, 5.389499,
3.06474, -3.109329, -5.697773,
3.06474, -3.109329, 5.389499,
3.06474, 3.727464, -5.697773,
3.06474, 3.727464, 5.389499
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
var radius = 7.785742;
var distance = 34.63964;
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
mvMatrix.translate( 0.2110691, -0.3090674, 0.1541367 );
mvMatrix.scale( 1.284888, 1.231293, 0.7592577 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.63964);
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
carfentrazone-ethyl<-read.table("carfentrazone-ethyl.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-carfentrazone-ethyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'carfentrazone' not found
```

```r
y<-carfentrazone-ethyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'carfentrazone' not found
```

```r
z<-carfentrazone-ethyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'carfentrazone' not found
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
-3.391467, -0.02497396, -0.2022373, 0, 0, 1, 1, 1,
-2.93369, 0.1129164, -1.7686, 1, 0, 0, 1, 1,
-2.81895, -0.9060484, -1.17245, 1, 0, 0, 1, 1,
-2.75163, -0.5710793, -1.828454, 1, 0, 0, 1, 1,
-2.613858, -0.09675419, -1.039885, 1, 0, 0, 1, 1,
-2.473336, -0.7399045, -2.150296, 1, 0, 0, 1, 1,
-2.461336, 0.206744, -0.2397478, 0, 0, 0, 1, 1,
-2.40054, -1.136978, -2.257293, 0, 0, 0, 1, 1,
-2.366968, 1.672686, -0.133466, 0, 0, 0, 1, 1,
-2.287819, -0.3284833, -0.2097415, 0, 0, 0, 1, 1,
-2.273515, 1.441985, 0.4321365, 0, 0, 0, 1, 1,
-2.221663, -0.09366049, -2.490668, 0, 0, 0, 1, 1,
-2.180733, 0.8939117, -0.9735484, 0, 0, 0, 1, 1,
-2.148659, 1.099641, 0.07552635, 1, 1, 1, 1, 1,
-2.11425, 0.9680415, -0.4596577, 1, 1, 1, 1, 1,
-2.05638, -1.553275, -1.16141, 1, 1, 1, 1, 1,
-2.029859, 0.3688705, -0.3967307, 1, 1, 1, 1, 1,
-2.020759, 0.3697031, -1.967488, 1, 1, 1, 1, 1,
-2.016426, -1.259995, -3.620059, 1, 1, 1, 1, 1,
-1.985329, 0.2176427, -0.4455656, 1, 1, 1, 1, 1,
-1.976254, 0.4382831, -2.443436, 1, 1, 1, 1, 1,
-1.879762, -1.388561, -1.852742, 1, 1, 1, 1, 1,
-1.875249, -0.0753326, -1.591305, 1, 1, 1, 1, 1,
-1.874932, -0.9361405, -2.381193, 1, 1, 1, 1, 1,
-1.854341, 1.200093, 0.5054084, 1, 1, 1, 1, 1,
-1.841933, 0.6397431, -1.540234, 1, 1, 1, 1, 1,
-1.837603, 0.7940912, -1.382843, 1, 1, 1, 1, 1,
-1.83331, 1.24241, -0.4503175, 1, 1, 1, 1, 1,
-1.827434, -0.8358639, -0.7111607, 0, 0, 1, 1, 1,
-1.81472, 0.9865551, 0.4470802, 1, 0, 0, 1, 1,
-1.809349, 0.1223593, -1.96823, 1, 0, 0, 1, 1,
-1.802374, -0.4034005, -3.16977, 1, 0, 0, 1, 1,
-1.800559, 0.330416, -1.26986, 1, 0, 0, 1, 1,
-1.769178, -0.9672836, -1.178568, 1, 0, 0, 1, 1,
-1.765819, -0.5617753, -1.195047, 0, 0, 0, 1, 1,
-1.75042, -0.1587744, -1.382748, 0, 0, 0, 1, 1,
-1.747294, -0.03609404, -2.316877, 0, 0, 0, 1, 1,
-1.745427, 1.284893, -2.291288, 0, 0, 0, 1, 1,
-1.74259, -1.100417, -1.442229, 0, 0, 0, 1, 1,
-1.73969, 2.909699, -0.8418042, 0, 0, 0, 1, 1,
-1.716456, -0.8856213, -2.073514, 0, 0, 0, 1, 1,
-1.708569, -0.1325512, -2.85814, 1, 1, 1, 1, 1,
-1.676357, -1.330403, -2.01865, 1, 1, 1, 1, 1,
-1.667212, -1.280676, -2.970846, 1, 1, 1, 1, 1,
-1.665847, -0.8786806, -1.61312, 1, 1, 1, 1, 1,
-1.656418, -0.3942747, -1.266246, 1, 1, 1, 1, 1,
-1.635622, -0.3554813, -1.533321, 1, 1, 1, 1, 1,
-1.628799, 1.56331, -0.2187358, 1, 1, 1, 1, 1,
-1.622024, 0.8170652, -2.192322, 1, 1, 1, 1, 1,
-1.618718, 1.532173, -0.1125926, 1, 1, 1, 1, 1,
-1.572435, -0.7759581, -2.545554, 1, 1, 1, 1, 1,
-1.569024, -0.01285905, -0.4815807, 1, 1, 1, 1, 1,
-1.568879, 0.04789875, 0.1171145, 1, 1, 1, 1, 1,
-1.562892, -0.410762, 0.009182381, 1, 1, 1, 1, 1,
-1.556742, 0.5342439, -0.6591246, 1, 1, 1, 1, 1,
-1.556195, -0.8080234, -1.229587, 1, 1, 1, 1, 1,
-1.549996, 0.04439282, -2.114149, 0, 0, 1, 1, 1,
-1.547371, 0.4011612, -0.3227472, 1, 0, 0, 1, 1,
-1.546709, 1.173992, -1.147475, 1, 0, 0, 1, 1,
-1.545608, 1.501314, -0.2531817, 1, 0, 0, 1, 1,
-1.535184, 0.471923, -1.49112, 1, 0, 0, 1, 1,
-1.506191, 1.290348, -1.977675, 1, 0, 0, 1, 1,
-1.495928, 1.261833, 0.4486804, 0, 0, 0, 1, 1,
-1.495266, 0.006657708, -0.5270987, 0, 0, 0, 1, 1,
-1.494359, -0.9195775, -2.063017, 0, 0, 0, 1, 1,
-1.483142, 0.590435, -2.121991, 0, 0, 0, 1, 1,
-1.46521, 0.5411364, -1.962534, 0, 0, 0, 1, 1,
-1.463571, 1.179845, -1.810311, 0, 0, 0, 1, 1,
-1.45205, -1.408263, -3.384068, 0, 0, 0, 1, 1,
-1.445596, 0.4519837, -0.01083646, 1, 1, 1, 1, 1,
-1.431423, -0.04781524, -2.008304, 1, 1, 1, 1, 1,
-1.423164, 1.486673, -1.417808, 1, 1, 1, 1, 1,
-1.400854, 0.5929534, -0.1259421, 1, 1, 1, 1, 1,
-1.399193, -0.2476429, -0.9795755, 1, 1, 1, 1, 1,
-1.383663, 0.4824773, -2.16869, 1, 1, 1, 1, 1,
-1.383335, -0.08141262, -0.8964615, 1, 1, 1, 1, 1,
-1.376555, 1.170156, -0.9300476, 1, 1, 1, 1, 1,
-1.373281, -0.3277402, 0.2861862, 1, 1, 1, 1, 1,
-1.36876, 1.577111, -0.06533278, 1, 1, 1, 1, 1,
-1.364411, -0.9004359, -1.065897, 1, 1, 1, 1, 1,
-1.357806, 0.930365, -1.330625, 1, 1, 1, 1, 1,
-1.356911, -0.6377569, -1.53081, 1, 1, 1, 1, 1,
-1.352334, -0.8395572, -3.929925, 1, 1, 1, 1, 1,
-1.347107, 0.9796068, -0.6628295, 1, 1, 1, 1, 1,
-1.346765, -1.62505, -2.478839, 0, 0, 1, 1, 1,
-1.343357, 1.362131, -0.3448604, 1, 0, 0, 1, 1,
-1.342833, 0.6326545, -0.5344135, 1, 0, 0, 1, 1,
-1.335455, 0.8871936, -1.03204, 1, 0, 0, 1, 1,
-1.3338, 0.8487623, -0.00117068, 1, 0, 0, 1, 1,
-1.329657, -1.581001, -2.873982, 1, 0, 0, 1, 1,
-1.323875, 2.001973, -1.721088, 0, 0, 0, 1, 1,
-1.308589, -0.7392824, -2.309341, 0, 0, 0, 1, 1,
-1.300757, -0.03196636, -1.58145, 0, 0, 0, 1, 1,
-1.298051, 1.190653, -0.6586058, 0, 0, 0, 1, 1,
-1.29421, -0.6261601, -0.6724951, 0, 0, 0, 1, 1,
-1.285017, -0.2915714, -2.661022, 0, 0, 0, 1, 1,
-1.278343, -1.03034, -1.684753, 0, 0, 0, 1, 1,
-1.25691, -0.8088767, -4.636991, 1, 1, 1, 1, 1,
-1.251175, -1.153798, -2.338698, 1, 1, 1, 1, 1,
-1.250997, 0.6724691, -0.352779, 1, 1, 1, 1, 1,
-1.249605, 1.234316, -0.5416028, 1, 1, 1, 1, 1,
-1.247181, 1.528238, -1.99319, 1, 1, 1, 1, 1,
-1.246668, -0.2024234, -3.118888, 1, 1, 1, 1, 1,
-1.240752, -0.01984365, -2.652861, 1, 1, 1, 1, 1,
-1.236948, -0.3401724, -3.438723, 1, 1, 1, 1, 1,
-1.232254, -1.845863, -2.757525, 1, 1, 1, 1, 1,
-1.225236, -1.736989, -1.946628, 1, 1, 1, 1, 1,
-1.217438, -1.863926, -4.305943, 1, 1, 1, 1, 1,
-1.212174, -3.009764, -3.440248, 1, 1, 1, 1, 1,
-1.207325, 0.5950907, -0.6949373, 1, 1, 1, 1, 1,
-1.207141, -1.053476, -2.12897, 1, 1, 1, 1, 1,
-1.204961, -0.615389, -2.877983, 1, 1, 1, 1, 1,
-1.204502, -1.052454, -1.096032, 0, 0, 1, 1, 1,
-1.203759, 1.004535, -0.6312733, 1, 0, 0, 1, 1,
-1.199183, -1.389026, -1.604166, 1, 0, 0, 1, 1,
-1.196209, -0.5762079, -2.01394, 1, 0, 0, 1, 1,
-1.192887, -0.2251913, -2.011808, 1, 0, 0, 1, 1,
-1.192834, -0.52038, -1.391525, 1, 0, 0, 1, 1,
-1.186461, 0.4535721, -0.514682, 0, 0, 0, 1, 1,
-1.185487, -1.912313, -2.981165, 0, 0, 0, 1, 1,
-1.176219, -0.9255171, -2.041527, 0, 0, 0, 1, 1,
-1.174793, 2.069474, -1.269686, 0, 0, 0, 1, 1,
-1.169754, 0.06085891, -1.752742, 0, 0, 0, 1, 1,
-1.168402, -0.7954201, -0.7800737, 0, 0, 0, 1, 1,
-1.164887, 0.9543501, -0.8488307, 0, 0, 0, 1, 1,
-1.159614, -0.9410198, -1.719435, 1, 1, 1, 1, 1,
-1.156535, -1.029899, -3.291039, 1, 1, 1, 1, 1,
-1.146326, 0.02815653, -1.845762, 1, 1, 1, 1, 1,
-1.14209, 1.02652, -0.1140856, 1, 1, 1, 1, 1,
-1.132652, -0.7170439, -2.430751, 1, 1, 1, 1, 1,
-1.122175, 1.260121, -0.7006775, 1, 1, 1, 1, 1,
-1.110906, 0.8809011, -1.121507, 1, 1, 1, 1, 1,
-1.110125, 1.289873, -0.1154398, 1, 1, 1, 1, 1,
-1.103486, -0.9812841, -3.019051, 1, 1, 1, 1, 1,
-1.09474, -1.284591, -1.815118, 1, 1, 1, 1, 1,
-1.086416, -0.1231454, -3.233857, 1, 1, 1, 1, 1,
-1.082566, 0.5341916, -1.564489, 1, 1, 1, 1, 1,
-1.079438, 1.03002, -0.5695481, 1, 1, 1, 1, 1,
-1.076969, 0.200815, -3.26079, 1, 1, 1, 1, 1,
-1.0743, 1.249012, 0.08681114, 1, 1, 1, 1, 1,
-1.065921, -1.321455, -1.374033, 0, 0, 1, 1, 1,
-1.061274, 0.8866898, -2.794479, 1, 0, 0, 1, 1,
-1.048602, -0.7325686, -2.325681, 1, 0, 0, 1, 1,
-1.045882, 0.1818619, -0.9428275, 1, 0, 0, 1, 1,
-1.036496, -0.5275532, -2.636909, 1, 0, 0, 1, 1,
-1.033564, -0.9902487, -2.018557, 1, 0, 0, 1, 1,
-1.033069, 1.446246, -0.001831197, 0, 0, 0, 1, 1,
-1.029384, 0.7285933, -0.6994501, 0, 0, 0, 1, 1,
-1.025699, 0.7065603, -0.5305128, 0, 0, 0, 1, 1,
-1.015396, -0.03700503, 0.2985289, 0, 0, 0, 1, 1,
-1.001363, -0.4463688, -2.569494, 0, 0, 0, 1, 1,
-0.9984772, -2.105796, -0.8323874, 0, 0, 0, 1, 1,
-0.9909705, 0.3366413, -1.100765, 0, 0, 0, 1, 1,
-0.9844287, 1.001106, -1.170749, 1, 1, 1, 1, 1,
-0.9802529, -1.046519, -1.322022, 1, 1, 1, 1, 1,
-0.9791612, 1.549103, -0.1202376, 1, 1, 1, 1, 1,
-0.977748, -0.1481618, -2.422206, 1, 1, 1, 1, 1,
-0.9738175, 0.8580673, -2.656515, 1, 1, 1, 1, 1,
-0.9617428, -0.9165093, -2.900778, 1, 1, 1, 1, 1,
-0.9549145, 1.919284, -0.7295893, 1, 1, 1, 1, 1,
-0.9465531, 0.7094442, -0.7895215, 1, 1, 1, 1, 1,
-0.9414622, 0.2561842, -2.007402, 1, 1, 1, 1, 1,
-0.9370857, 0.5579203, -0.6034532, 1, 1, 1, 1, 1,
-0.9331048, 0.182945, -0.7250091, 1, 1, 1, 1, 1,
-0.9311026, 1.469796, 0.1223408, 1, 1, 1, 1, 1,
-0.9284807, 0.4103362, -2.717365, 1, 1, 1, 1, 1,
-0.9216684, 0.788857, -1.87854, 1, 1, 1, 1, 1,
-0.91083, 1.872904, -0.5328699, 1, 1, 1, 1, 1,
-0.9079246, -0.4084404, -2.99416, 0, 0, 1, 1, 1,
-0.9068361, 1.390611, 0.670806, 1, 0, 0, 1, 1,
-0.9035817, 1.573621, -0.9328906, 1, 0, 0, 1, 1,
-0.9028005, -2.470235, -2.135574, 1, 0, 0, 1, 1,
-0.9013606, 2.097683, -0.918591, 1, 0, 0, 1, 1,
-0.8993442, 1.100682, -1.637456, 1, 0, 0, 1, 1,
-0.8930935, 0.5319961, -3.103425, 0, 0, 0, 1, 1,
-0.8900152, 0.106043, -1.678745, 0, 0, 0, 1, 1,
-0.8773564, -0.2821436, -0.1924083, 0, 0, 0, 1, 1,
-0.8743453, -0.2652942, -0.5821088, 0, 0, 0, 1, 1,
-0.8703463, 1.113544, 1.930648, 0, 0, 0, 1, 1,
-0.86981, 0.1699489, -1.658305, 0, 0, 0, 1, 1,
-0.8656643, -0.2506781, -1.545318, 0, 0, 0, 1, 1,
-0.8634951, -0.6912189, -2.860526, 1, 1, 1, 1, 1,
-0.8580056, -1.264845, -2.242827, 1, 1, 1, 1, 1,
-0.8551111, 0.4757406, -1.42728, 1, 1, 1, 1, 1,
-0.8535975, 0.1356791, 0.6986446, 1, 1, 1, 1, 1,
-0.8495598, 1.351772, -0.3654234, 1, 1, 1, 1, 1,
-0.8480457, 0.5234084, -1.315994, 1, 1, 1, 1, 1,
-0.8459502, 0.1812801, -3.493395, 1, 1, 1, 1, 1,
-0.845162, -1.509119, -3.162844, 1, 1, 1, 1, 1,
-0.841293, 0.4954863, -1.347663, 1, 1, 1, 1, 1,
-0.8343903, -0.4788751, -2.693042, 1, 1, 1, 1, 1,
-0.8258189, 3.031704, -0.9599885, 1, 1, 1, 1, 1,
-0.825712, 0.9351606, -0.588222, 1, 1, 1, 1, 1,
-0.8250608, 0.4291067, -1.012334, 1, 1, 1, 1, 1,
-0.8250174, -0.6783339, -2.038797, 1, 1, 1, 1, 1,
-0.8225085, 0.2416142, -1.313566, 1, 1, 1, 1, 1,
-0.8215635, -0.3445571, -2.383901, 0, 0, 1, 1, 1,
-0.8138207, 0.3804513, -2.101614, 1, 0, 0, 1, 1,
-0.8121755, -0.8983217, -3.179901, 1, 0, 0, 1, 1,
-0.8115816, 3.077917, 0.7313806, 1, 0, 0, 1, 1,
-0.8086884, 0.4589529, 0.613502, 1, 0, 0, 1, 1,
-0.7998434, -0.3321223, -1.449706, 1, 0, 0, 1, 1,
-0.7956505, 0.5433373, -0.5460358, 0, 0, 0, 1, 1,
-0.7948924, 0.6228771, -1.652541, 0, 0, 0, 1, 1,
-0.7929464, 1.071874, -1.115984, 0, 0, 0, 1, 1,
-0.7915683, 0.411772, -0.9775624, 0, 0, 0, 1, 1,
-0.7914178, -0.5568629, 0.3998415, 0, 0, 0, 1, 1,
-0.7895311, 0.2675932, -0.95058, 0, 0, 0, 1, 1,
-0.7885018, -0.280822, -3.785218, 0, 0, 0, 1, 1,
-0.7845283, 0.4056087, -2.540973, 1, 1, 1, 1, 1,
-0.7819387, 3.627899, -1.013895, 1, 1, 1, 1, 1,
-0.7752628, -1.636231, -1.901048, 1, 1, 1, 1, 1,
-0.7674364, -1.795853, -3.424051, 1, 1, 1, 1, 1,
-0.7633017, -0.3408784, -2.985752, 1, 1, 1, 1, 1,
-0.7612523, -1.521699, -3.261566, 1, 1, 1, 1, 1,
-0.7601016, 0.5101095, -0.683605, 1, 1, 1, 1, 1,
-0.7582797, -0.1303006, -1.566367, 1, 1, 1, 1, 1,
-0.7571329, -0.02887513, -2.699927, 1, 1, 1, 1, 1,
-0.7539871, 0.1371435, -1.19358, 1, 1, 1, 1, 1,
-0.7513602, -1.28509, -3.539455, 1, 1, 1, 1, 1,
-0.7391382, -0.1787346, -0.870858, 1, 1, 1, 1, 1,
-0.7372397, 0.1710223, -1.653881, 1, 1, 1, 1, 1,
-0.7366373, 0.9394584, 0.2313831, 1, 1, 1, 1, 1,
-0.7347284, -0.5367903, -1.864818, 1, 1, 1, 1, 1,
-0.7334451, 0.2647198, -2.973379, 0, 0, 1, 1, 1,
-0.731508, -0.5844057, -2.927007, 1, 0, 0, 1, 1,
-0.7309433, -0.7189766, -1.823879, 1, 0, 0, 1, 1,
-0.7206246, 0.0740601, -0.5272182, 1, 0, 0, 1, 1,
-0.7148909, 0.2261232, -1.97065, 1, 0, 0, 1, 1,
-0.7098591, -0.2624559, -1.034402, 1, 0, 0, 1, 1,
-0.7023754, -0.4579208, 0.02096548, 0, 0, 0, 1, 1,
-0.701036, 0.3473758, -1.751351, 0, 0, 0, 1, 1,
-0.697845, 1.535933, 0.3475757, 0, 0, 0, 1, 1,
-0.6957567, -1.614514, -3.88051, 0, 0, 0, 1, 1,
-0.690837, 0.2829947, -1.41171, 0, 0, 0, 1, 1,
-0.6895052, 0.9136835, -1.438096, 0, 0, 0, 1, 1,
-0.6885081, -0.2000302, -1.148802, 0, 0, 0, 1, 1,
-0.6853724, -0.5215709, -1.374115, 1, 1, 1, 1, 1,
-0.6817074, 1.385052, 0.3501859, 1, 1, 1, 1, 1,
-0.6813366, 0.3629621, -1.396278, 1, 1, 1, 1, 1,
-0.6777219, -2.566264, -1.662511, 1, 1, 1, 1, 1,
-0.6767682, 0.5945126, -2.011988, 1, 1, 1, 1, 1,
-0.6745631, -0.04776595, 0.4312449, 1, 1, 1, 1, 1,
-0.664557, -1.404247, -2.471249, 1, 1, 1, 1, 1,
-0.6594101, -0.3196943, -1.648177, 1, 1, 1, 1, 1,
-0.6580881, -1.130026, -2.982017, 1, 1, 1, 1, 1,
-0.6549212, -1.010067, -2.254059, 1, 1, 1, 1, 1,
-0.6509454, 0.5689981, -1.531718, 1, 1, 1, 1, 1,
-0.6455889, -1.275881, -1.947757, 1, 1, 1, 1, 1,
-0.6432015, -0.4868298, -1.522756, 1, 1, 1, 1, 1,
-0.641283, -0.140245, -1.838592, 1, 1, 1, 1, 1,
-0.6380488, -0.8853002, -3.542163, 1, 1, 1, 1, 1,
-0.6339339, -0.6474376, -2.581603, 0, 0, 1, 1, 1,
-0.6302128, 0.7806938, 0.6000642, 1, 0, 0, 1, 1,
-0.6299201, -0.2983038, -1.950583, 1, 0, 0, 1, 1,
-0.6270781, 0.8793866, -0.6361088, 1, 0, 0, 1, 1,
-0.6237105, -0.654388, -0.7505341, 1, 0, 0, 1, 1,
-0.6219392, -0.5062087, -3.505454, 1, 0, 0, 1, 1,
-0.6159151, 1.662743, -0.006005514, 0, 0, 0, 1, 1,
-0.6135712, -0.2647944, -1.276478, 0, 0, 0, 1, 1,
-0.6069717, 0.3231036, -2.163736, 0, 0, 0, 1, 1,
-0.604274, 0.6657959, -1.129428, 0, 0, 0, 1, 1,
-0.5955074, 0.8986366, -1.797723, 0, 0, 0, 1, 1,
-0.5945091, 0.8116191, -0.01387466, 0, 0, 0, 1, 1,
-0.5931849, -0.5615712, -3.53141, 0, 0, 0, 1, 1,
-0.5925419, -0.08017104, 0.0245352, 1, 1, 1, 1, 1,
-0.5917025, 0.3696069, -1.611718, 1, 1, 1, 1, 1,
-0.5880604, -0.7871671, -3.328228, 1, 1, 1, 1, 1,
-0.5860918, 0.7534321, -1.012357, 1, 1, 1, 1, 1,
-0.5856848, -0.3499415, -2.466495, 1, 1, 1, 1, 1,
-0.5816377, -0.5319962, -2.011238, 1, 1, 1, 1, 1,
-0.5795896, -1.563972, -2.451278, 1, 1, 1, 1, 1,
-0.5774338, 0.5134856, -0.2684225, 1, 1, 1, 1, 1,
-0.5758589, 2.072452, 0.05902511, 1, 1, 1, 1, 1,
-0.5747039, -0.6716416, -2.816845, 1, 1, 1, 1, 1,
-0.5711592, -0.4024083, -2.593525, 1, 1, 1, 1, 1,
-0.5657967, 0.7067608, -0.1631289, 1, 1, 1, 1, 1,
-0.5639114, 1.349959, 0.2075041, 1, 1, 1, 1, 1,
-0.5617179, -0.8237656, -3.591352, 1, 1, 1, 1, 1,
-0.5614962, -0.6556072, -0.6836503, 1, 1, 1, 1, 1,
-0.5590401, 0.02994913, -3.697726, 0, 0, 1, 1, 1,
-0.5584485, 0.4444603, -1.016997, 1, 0, 0, 1, 1,
-0.5548033, -0.5988953, -3.651832, 1, 0, 0, 1, 1,
-0.5534127, 1.262389, -0.9472975, 1, 0, 0, 1, 1,
-0.5467618, -0.2947125, -1.14099, 1, 0, 0, 1, 1,
-0.5461842, -1.501557, -1.947824, 1, 0, 0, 1, 1,
-0.5413585, 0.5898104, -0.145824, 0, 0, 0, 1, 1,
-0.54056, 1.343255, -0.9373097, 0, 0, 0, 1, 1,
-0.5378542, 0.7309498, -1.077858, 0, 0, 0, 1, 1,
-0.537616, -1.521067, -1.954741, 0, 0, 0, 1, 1,
-0.524288, 0.09499954, -0.3858105, 0, 0, 0, 1, 1,
-0.5208697, -1.986673, -1.326882, 0, 0, 0, 1, 1,
-0.5204327, -0.1403802, -1.092107, 0, 0, 0, 1, 1,
-0.5106831, 0.3325391, -2.024832, 1, 1, 1, 1, 1,
-0.5085545, -0.6104864, -1.975081, 1, 1, 1, 1, 1,
-0.5014492, 0.4009661, -0.3156617, 1, 1, 1, 1, 1,
-0.4879746, -0.216306, -0.4791991, 1, 1, 1, 1, 1,
-0.4845617, -1.410563, -2.399976, 1, 1, 1, 1, 1,
-0.4837858, 1.105804, -2.339396, 1, 1, 1, 1, 1,
-0.4818534, 1.439031, -1.037472, 1, 1, 1, 1, 1,
-0.4814191, 2.288656, -0.5414149, 1, 1, 1, 1, 1,
-0.4801098, 0.8053432, 0.09126629, 1, 1, 1, 1, 1,
-0.4779881, -1.704034, -3.454628, 1, 1, 1, 1, 1,
-0.4774774, 1.227762, 0.06253908, 1, 1, 1, 1, 1,
-0.4736293, 0.05738469, -1.305696, 1, 1, 1, 1, 1,
-0.4718341, 0.8499359, 0.6500748, 1, 1, 1, 1, 1,
-0.4665036, -0.4606985, -4.087323, 1, 1, 1, 1, 1,
-0.4651057, 0.9142508, -0.4830167, 1, 1, 1, 1, 1,
-0.4650081, -0.5845764, -3.479664, 0, 0, 1, 1, 1,
-0.4648949, 0.2537152, -3.156567, 1, 0, 0, 1, 1,
-0.4611613, 2.484626, -0.4528293, 1, 0, 0, 1, 1,
-0.4567167, 0.2959726, -1.246533, 1, 0, 0, 1, 1,
-0.4525159, 0.8556713, -0.02894673, 1, 0, 0, 1, 1,
-0.451609, -0.1217448, -2.063326, 1, 0, 0, 1, 1,
-0.4512948, -0.9168575, -3.041454, 0, 0, 0, 1, 1,
-0.4499693, -1.081118, -2.237813, 0, 0, 0, 1, 1,
-0.4463133, 0.7283551, -2.858239, 0, 0, 0, 1, 1,
-0.4459966, -0.8952335, -4.301803, 0, 0, 0, 1, 1,
-0.4449657, -1.06129, -3.132769, 0, 0, 0, 1, 1,
-0.4444814, 2.278649, 0.9474232, 0, 0, 0, 1, 1,
-0.4427303, -1.510284, -3.880918, 0, 0, 0, 1, 1,
-0.4417844, 0.31383, -0.7453058, 1, 1, 1, 1, 1,
-0.4392581, 0.8429042, -1.477144, 1, 1, 1, 1, 1,
-0.4386584, -0.5139811, -2.192578, 1, 1, 1, 1, 1,
-0.4371896, 0.2330483, -2.257706, 1, 1, 1, 1, 1,
-0.4337746, -0.2843553, -2.469901, 1, 1, 1, 1, 1,
-0.4273943, 0.7246523, -0.8477523, 1, 1, 1, 1, 1,
-0.4247109, 1.002143, 0.401634, 1, 1, 1, 1, 1,
-0.4190961, 1.067919, -0.2926533, 1, 1, 1, 1, 1,
-0.4178448, -0.3680965, -3.567714, 1, 1, 1, 1, 1,
-0.4167033, 1.110695, 0.9239171, 1, 1, 1, 1, 1,
-0.4137812, -1.048154, -2.58385, 1, 1, 1, 1, 1,
-0.410225, -0.9163417, -2.802291, 1, 1, 1, 1, 1,
-0.4077621, -0.1476238, -2.498563, 1, 1, 1, 1, 1,
-0.4051657, -1.032257, -3.523979, 1, 1, 1, 1, 1,
-0.4035473, 0.06506871, -1.34177, 1, 1, 1, 1, 1,
-0.4027592, -0.01115632, -1.542646, 0, 0, 1, 1, 1,
-0.4012859, -0.9416582, -3.271689, 1, 0, 0, 1, 1,
-0.3992883, -0.02164575, -1.704765, 1, 0, 0, 1, 1,
-0.3987995, 0.2118248, -0.9267032, 1, 0, 0, 1, 1,
-0.3985289, -1.655108, -2.075293, 1, 0, 0, 1, 1,
-0.3974392, 0.1645482, -2.891339, 1, 0, 0, 1, 1,
-0.3966931, 0.5785033, 0.5078835, 0, 0, 0, 1, 1,
-0.3874657, -0.5854171, -2.308068, 0, 0, 0, 1, 1,
-0.3834965, -0.3716006, -4.627604, 0, 0, 0, 1, 1,
-0.3830344, -0.6812574, -4.06852, 0, 0, 0, 1, 1,
-0.3820471, -0.8022047, -2.715097, 0, 0, 0, 1, 1,
-0.3798849, 0.07132177, -1.363373, 0, 0, 0, 1, 1,
-0.3761233, 0.8340039, 1.15112, 0, 0, 0, 1, 1,
-0.369551, 1.195396, -1.458202, 1, 1, 1, 1, 1,
-0.3694205, -0.58562, -2.624094, 1, 1, 1, 1, 1,
-0.3692104, -0.7573112, -3.425022, 1, 1, 1, 1, 1,
-0.3666431, 0.454279, -0.1812452, 1, 1, 1, 1, 1,
-0.3613826, 0.4283404, 0.6617665, 1, 1, 1, 1, 1,
-0.3613601, 0.8315067, 0.1254169, 1, 1, 1, 1, 1,
-0.3575372, 0.9823831, -0.7559714, 1, 1, 1, 1, 1,
-0.3574021, -0.811156, -3.867259, 1, 1, 1, 1, 1,
-0.3521222, 0.4731371, 1.295529, 1, 1, 1, 1, 1,
-0.3519277, -1.752066, -2.042961, 1, 1, 1, 1, 1,
-0.3506829, 0.1587094, -0.01797919, 1, 1, 1, 1, 1,
-0.3502758, 1.006983, -1.491476, 1, 1, 1, 1, 1,
-0.3466204, 0.7801023, 0.8872536, 1, 1, 1, 1, 1,
-0.3442809, -0.7741022, -5.424114, 1, 1, 1, 1, 1,
-0.3436663, 0.8470972, -0.169109, 1, 1, 1, 1, 1,
-0.3427284, 0.9004627, 0.1362904, 0, 0, 1, 1, 1,
-0.3421449, -0.1972812, -1.860574, 1, 0, 0, 1, 1,
-0.3403841, 1.067877, -1.084245, 1, 0, 0, 1, 1,
-0.3393306, -0.03697759, -1.621953, 1, 0, 0, 1, 1,
-0.3384412, -0.2801568, -1.117618, 1, 0, 0, 1, 1,
-0.3382346, -0.07856733, -0.1789968, 1, 0, 0, 1, 1,
-0.3363059, 0.06369549, -1.935946, 0, 0, 0, 1, 1,
-0.3329529, 0.2421704, -0.8195711, 0, 0, 0, 1, 1,
-0.3314902, 0.04140176, -1.527433, 0, 0, 0, 1, 1,
-0.3269332, 2.346706, -0.9903336, 0, 0, 0, 1, 1,
-0.3164085, 0.2947297, -0.675371, 0, 0, 0, 1, 1,
-0.3132388, -1.259338, -3.485524, 0, 0, 0, 1, 1,
-0.3130436, 0.5903711, -0.1215069, 0, 0, 0, 1, 1,
-0.3114516, -0.8172565, -1.812323, 1, 1, 1, 1, 1,
-0.3069347, -0.4514752, -1.43674, 1, 1, 1, 1, 1,
-0.3067065, -0.3729955, -2.048645, 1, 1, 1, 1, 1,
-0.3007678, 2.849934, -1.861015, 1, 1, 1, 1, 1,
-0.2910038, 0.8827041, -1.565776, 1, 1, 1, 1, 1,
-0.2896931, 0.4410121, 1.969157, 1, 1, 1, 1, 1,
-0.2894824, 0.5928286, -0.8755271, 1, 1, 1, 1, 1,
-0.2890983, 0.2389638, -1.002734, 1, 1, 1, 1, 1,
-0.2877655, 0.5770683, -0.5864448, 1, 1, 1, 1, 1,
-0.2867863, -0.318277, -2.53573, 1, 1, 1, 1, 1,
-0.2853393, -0.3081919, -2.558789, 1, 1, 1, 1, 1,
-0.2833104, 2.072021, 0.04909584, 1, 1, 1, 1, 1,
-0.2820783, -0.2084691, -1.929419, 1, 1, 1, 1, 1,
-0.2817593, 0.8932474, 0.1730711, 1, 1, 1, 1, 1,
-0.2809505, 0.7190505, 0.6872965, 1, 1, 1, 1, 1,
-0.2790149, -0.3555295, -1.040238, 0, 0, 1, 1, 1,
-0.2778051, 0.8973153, 1.565908, 1, 0, 0, 1, 1,
-0.269175, 2.387625, -1.751701, 1, 0, 0, 1, 1,
-0.264399, 0.3229659, 0.364813, 1, 0, 0, 1, 1,
-0.2631356, 0.795763, -1.624756, 1, 0, 0, 1, 1,
-0.259336, 0.6442533, -0.6160032, 1, 0, 0, 1, 1,
-0.2578616, -0.2897081, -2.881275, 0, 0, 0, 1, 1,
-0.2536853, 0.7967609, -0.3677621, 0, 0, 0, 1, 1,
-0.2500384, 0.5495644, -1.576253, 0, 0, 0, 1, 1,
-0.2471568, 0.08070774, -2.094199, 0, 0, 0, 1, 1,
-0.244561, 0.2083379, -1.473098, 0, 0, 0, 1, 1,
-0.2433185, 0.4092366, -1.213409, 0, 0, 0, 1, 1,
-0.2416315, -0.9657221, -4.957892, 0, 0, 0, 1, 1,
-0.2395777, -0.1018677, -0.3519698, 1, 1, 1, 1, 1,
-0.2346633, 0.1523428, -0.1983223, 1, 1, 1, 1, 1,
-0.2326252, 0.02216556, -2.917673, 1, 1, 1, 1, 1,
-0.2250418, -0.1927931, -1.943204, 1, 1, 1, 1, 1,
-0.2232453, -0.3000363, -1.508564, 1, 1, 1, 1, 1,
-0.2229724, 0.5892739, -0.527551, 1, 1, 1, 1, 1,
-0.2203993, -0.9525718, -3.151602, 1, 1, 1, 1, 1,
-0.2167894, -1.040324, -2.590207, 1, 1, 1, 1, 1,
-0.2098883, 1.086248, 1.53522, 1, 1, 1, 1, 1,
-0.2058232, -1.352247, -2.020485, 1, 1, 1, 1, 1,
-0.2029547, -1.392413, -5.073859, 1, 1, 1, 1, 1,
-0.2004681, -1.950921, -3.380286, 1, 1, 1, 1, 1,
-0.198805, 0.1754466, 0.06675617, 1, 1, 1, 1, 1,
-0.1973911, 0.1555215, -1.240418, 1, 1, 1, 1, 1,
-0.1959341, -0.3960083, -1.834162, 1, 1, 1, 1, 1,
-0.1926625, 0.1784898, -0.5763051, 0, 0, 1, 1, 1,
-0.190641, 0.5190758, 1.309117, 1, 0, 0, 1, 1,
-0.184422, -1.257372, -3.530407, 1, 0, 0, 1, 1,
-0.1835432, -0.2312665, -2.550395, 1, 0, 0, 1, 1,
-0.1818776, -1.870224, -3.282115, 1, 0, 0, 1, 1,
-0.1817091, 0.1505025, 0.2051987, 1, 0, 0, 1, 1,
-0.177037, -0.5571659, -3.492008, 0, 0, 0, 1, 1,
-0.1677376, -0.4319487, -2.91194, 0, 0, 0, 1, 1,
-0.159264, 0.3675861, -0.628786, 0, 0, 0, 1, 1,
-0.1543868, 0.1796384, -1.011129, 0, 0, 0, 1, 1,
-0.151667, -0.5548345, -1.789486, 0, 0, 0, 1, 1,
-0.148923, 0.2368155, 0.3135183, 0, 0, 0, 1, 1,
-0.1483204, -0.448599, -3.747455, 0, 0, 0, 1, 1,
-0.1457753, 0.2252772, 0.3645373, 1, 1, 1, 1, 1,
-0.1439336, -0.4899191, -2.885639, 1, 1, 1, 1, 1,
-0.1426354, -0.6250988, -4.297922, 1, 1, 1, 1, 1,
-0.1425231, 1.604475, -0.3973988, 1, 1, 1, 1, 1,
-0.140571, -0.5390716, -1.912532, 1, 1, 1, 1, 1,
-0.1405673, -0.8521487, -3.13972, 1, 1, 1, 1, 1,
-0.1386232, -0.9761609, -4.242274, 1, 1, 1, 1, 1,
-0.1383093, 1.655667, -0.680401, 1, 1, 1, 1, 1,
-0.1321143, -1.616728, -3.121878, 1, 1, 1, 1, 1,
-0.1320053, 1.582755, 1.341346, 1, 1, 1, 1, 1,
-0.1290293, 0.5534636, -0.2715831, 1, 1, 1, 1, 1,
-0.1278626, 1.143348, -0.4286076, 1, 1, 1, 1, 1,
-0.1256734, 0.9346284, -1.100979, 1, 1, 1, 1, 1,
-0.1255066, -1.773238, -5.536307, 1, 1, 1, 1, 1,
-0.1224414, 0.1218607, -0.9231561, 1, 1, 1, 1, 1,
-0.119622, -2.460762, -3.121465, 0, 0, 1, 1, 1,
-0.116534, -0.4731221, -1.869126, 1, 0, 0, 1, 1,
-0.1154252, 1.144092, 0.6043437, 1, 0, 0, 1, 1,
-0.1151351, -0.3613271, -1.867933, 1, 0, 0, 1, 1,
-0.1146797, 0.6235961, 0.8376022, 1, 0, 0, 1, 1,
-0.1142304, 0.293357, 1.014629, 1, 0, 0, 1, 1,
-0.1007978, 0.5065236, 0.8541596, 0, 0, 0, 1, 1,
-0.09830055, -0.7685742, -2.391141, 0, 0, 0, 1, 1,
-0.09742983, -0.06886632, -1.737244, 0, 0, 0, 1, 1,
-0.09580348, -0.2221157, -2.460939, 0, 0, 0, 1, 1,
-0.094515, 2.433995, 0.0645581, 0, 0, 0, 1, 1,
-0.09289051, 1.587096, 0.5200534, 0, 0, 0, 1, 1,
-0.09088305, 0.09085625, 1.019767, 0, 0, 0, 1, 1,
-0.08973332, -0.2516603, -4.700973, 1, 1, 1, 1, 1,
-0.08858454, -0.108168, -1.776566, 1, 1, 1, 1, 1,
-0.08801603, -0.3784963, -1.604057, 1, 1, 1, 1, 1,
-0.08640844, 1.127215, 0.9906465, 1, 1, 1, 1, 1,
-0.07579605, -1.006638, -2.468734, 1, 1, 1, 1, 1,
-0.07063422, -0.03689469, -3.262676, 1, 1, 1, 1, 1,
-0.06537611, 1.702266, 0.9253402, 1, 1, 1, 1, 1,
-0.06220357, 0.9714785, -0.3414527, 1, 1, 1, 1, 1,
-0.06203311, 1.346331, -1.202225, 1, 1, 1, 1, 1,
-0.05683069, 0.4092081, -3.064796, 1, 1, 1, 1, 1,
-0.0560467, -1.808021, -3.624953, 1, 1, 1, 1, 1,
-0.05451433, -0.6467027, -5.499008, 1, 1, 1, 1, 1,
-0.05376948, -1.06944, -4.562252, 1, 1, 1, 1, 1,
-0.0510577, 1.331695, 1.06679, 1, 1, 1, 1, 1,
-0.04410166, -0.6460226, -2.853075, 1, 1, 1, 1, 1,
-0.03846305, 1.442961, -2.755638, 0, 0, 1, 1, 1,
-0.03638079, 0.4449914, -1.281859, 1, 0, 0, 1, 1,
-0.03478609, 0.4578482, 0.4197585, 1, 0, 0, 1, 1,
-0.03455792, -1.254583, -2.778664, 1, 0, 0, 1, 1,
-0.02984624, 0.1640744, 0.9050217, 1, 0, 0, 1, 1,
-0.02789211, -0.04730369, -3.860672, 1, 0, 0, 1, 1,
-0.0254989, 1.477278, 0.2646084, 0, 0, 0, 1, 1,
-0.02472513, -0.2379546, -1.562356, 0, 0, 0, 1, 1,
-0.02183774, 1.114152, -0.642956, 0, 0, 0, 1, 1,
-0.02024825, -0.2765, -1.908863, 0, 0, 0, 1, 1,
-0.01622558, 0.6395183, -0.1313586, 0, 0, 0, 1, 1,
-0.0157456, 0.2395373, -1.798135, 0, 0, 0, 1, 1,
-0.01519463, 0.5789795, -1.272398, 0, 0, 0, 1, 1,
-0.005460192, -0.2074432, -1.835702, 1, 1, 1, 1, 1,
-0.004573205, 0.06584035, -0.6403372, 1, 1, 1, 1, 1,
-0.001667556, -2.177274, -2.013552, 1, 1, 1, 1, 1,
0.005248451, -0.3309892, 3.592277, 1, 1, 1, 1, 1,
0.01856216, 1.396771, -0.3966272, 1, 1, 1, 1, 1,
0.0192137, 0.6722079, 1.413959, 1, 1, 1, 1, 1,
0.0228928, 0.07964469, 2.240927, 1, 1, 1, 1, 1,
0.0234723, 0.5942908, 1.505147, 1, 1, 1, 1, 1,
0.0239718, 0.0478742, 1.463429, 1, 1, 1, 1, 1,
0.0293722, -0.8895065, 3.257244, 1, 1, 1, 1, 1,
0.038167, 0.7229913, -0.8049724, 1, 1, 1, 1, 1,
0.038835, 1.321307, -0.05924511, 1, 1, 1, 1, 1,
0.04074032, 1.291795, 0.4542464, 1, 1, 1, 1, 1,
0.04271268, 0.9686385, 1.359714, 1, 1, 1, 1, 1,
0.0432839, 0.6903959, 1.145494, 1, 1, 1, 1, 1,
0.0447182, -0.5363499, 4.15981, 0, 0, 1, 1, 1,
0.04577132, -0.0206548, 4.051675, 1, 0, 0, 1, 1,
0.04828617, -0.1130425, 2.14511, 1, 0, 0, 1, 1,
0.04929727, -0.7268537, 2.947865, 1, 0, 0, 1, 1,
0.05022077, -1.144645, 2.686718, 1, 0, 0, 1, 1,
0.05185728, -0.07015378, 2.565902, 1, 0, 0, 1, 1,
0.05473061, 1.081795, -0.6523457, 0, 0, 0, 1, 1,
0.05611528, 0.1904345, 0.2019566, 0, 0, 0, 1, 1,
0.06097573, 1.346582, 1.197757, 0, 0, 0, 1, 1,
0.06359699, -0.1840964, 2.584593, 0, 0, 0, 1, 1,
0.06388164, -1.330343, 1.912504, 0, 0, 0, 1, 1,
0.06640738, 0.195455, 1.282132, 0, 0, 0, 1, 1,
0.06713554, -1.589455, 2.673742, 0, 0, 0, 1, 1,
0.06993438, 0.009538637, 1.538156, 1, 1, 1, 1, 1,
0.07938543, -0.5232115, 1.729526, 1, 1, 1, 1, 1,
0.07975288, -1.182052, 2.980196, 1, 1, 1, 1, 1,
0.08499855, 0.3385233, 0.4719757, 1, 1, 1, 1, 1,
0.0868343, -0.6012224, 1.999647, 1, 1, 1, 1, 1,
0.08833729, 1.239463, -0.07172117, 1, 1, 1, 1, 1,
0.09200347, -1.693481, 4.128728, 1, 1, 1, 1, 1,
0.09327318, 0.9051036, 0.7633123, 1, 1, 1, 1, 1,
0.09455715, 0.1142304, 0.617789, 1, 1, 1, 1, 1,
0.09865422, -0.9380108, 3.062161, 1, 1, 1, 1, 1,
0.1022357, 1.986229, -0.1123204, 1, 1, 1, 1, 1,
0.1025185, -0.6613973, 3.175818, 1, 1, 1, 1, 1,
0.1038177, -0.2670635, 2.407537, 1, 1, 1, 1, 1,
0.1071912, -0.9205674, 1.702, 1, 1, 1, 1, 1,
0.1127277, 0.7734982, -0.5399889, 1, 1, 1, 1, 1,
0.1142403, 1.478717, 1.371246, 0, 0, 1, 1, 1,
0.1150074, 0.2705131, -0.2886756, 1, 0, 0, 1, 1,
0.1163802, 0.8624316, 1.211897, 1, 0, 0, 1, 1,
0.1165458, -0.161773, 5.228034, 1, 0, 0, 1, 1,
0.1185533, -0.2381411, 2.823059, 1, 0, 0, 1, 1,
0.1201574, -1.415814, 3.4243, 1, 0, 0, 1, 1,
0.1205419, -0.06714162, 1.903013, 0, 0, 0, 1, 1,
0.1230836, 0.438555, 1.096788, 0, 0, 0, 1, 1,
0.1257235, 1.123319, -0.7046283, 0, 0, 0, 1, 1,
0.1267158, -0.315204, 2.834876, 0, 0, 0, 1, 1,
0.1272853, 0.9168945, 1.331809, 0, 0, 0, 1, 1,
0.1277445, 0.4851325, -0.7444402, 0, 0, 0, 1, 1,
0.1285224, 1.173272, 1.159543, 0, 0, 0, 1, 1,
0.1297532, 0.2087607, -0.502308, 1, 1, 1, 1, 1,
0.1297607, 1.461575, -0.5454259, 1, 1, 1, 1, 1,
0.1302885, 0.2890065, -0.068106, 1, 1, 1, 1, 1,
0.1315858, -0.2453291, 2.286795, 1, 1, 1, 1, 1,
0.1328518, 1.305537, 0.3931051, 1, 1, 1, 1, 1,
0.1367767, -1.122665, 2.304436, 1, 1, 1, 1, 1,
0.137712, -0.06663301, 3.519278, 1, 1, 1, 1, 1,
0.1382765, -0.6014228, 2.442045, 1, 1, 1, 1, 1,
0.1396884, 0.4313706, -0.2748393, 1, 1, 1, 1, 1,
0.1437955, -0.1451688, 3.349029, 1, 1, 1, 1, 1,
0.1439417, -0.6414069, 2.246939, 1, 1, 1, 1, 1,
0.1452641, 0.92123, -0.6846545, 1, 1, 1, 1, 1,
0.1457864, -1.342825, 4.038719, 1, 1, 1, 1, 1,
0.1464135, -0.01953707, 0.8435623, 1, 1, 1, 1, 1,
0.1466337, -0.6614063, 3.23491, 1, 1, 1, 1, 1,
0.1475753, -0.7265173, 3.854694, 0, 0, 1, 1, 1,
0.159168, -0.4035372, 0.815722, 1, 0, 0, 1, 1,
0.1610257, -0.2162923, 0.9067712, 1, 0, 0, 1, 1,
0.1651154, -0.4806501, 2.907373, 1, 0, 0, 1, 1,
0.1681233, 0.1032853, 0.714055, 1, 0, 0, 1, 1,
0.1767051, 0.2413787, -0.07072273, 1, 0, 0, 1, 1,
0.1767993, 1.439336, 0.05740973, 0, 0, 0, 1, 1,
0.1781123, -1.092095, 2.520709, 0, 0, 0, 1, 1,
0.1795765, -0.1318089, -0.1102542, 0, 0, 0, 1, 1,
0.1816089, -0.2169131, 3.20289, 0, 0, 0, 1, 1,
0.1855284, -0.45757, 2.188263, 0, 0, 0, 1, 1,
0.1877598, -0.2895293, 1.842375, 0, 0, 0, 1, 1,
0.187789, -0.6823341, 3.629992, 0, 0, 0, 1, 1,
0.1973536, -1.098525, 2.387215, 1, 1, 1, 1, 1,
0.1996372, 1.830157, -0.8183022, 1, 1, 1, 1, 1,
0.2031251, -1.280777, 2.52683, 1, 1, 1, 1, 1,
0.2091363, -0.2368477, 2.804965, 1, 1, 1, 1, 1,
0.2107772, -1.001786, 2.221175, 1, 1, 1, 1, 1,
0.2113831, 0.1735696, 0.7377081, 1, 1, 1, 1, 1,
0.2117581, -0.7160068, 0.07540452, 1, 1, 1, 1, 1,
0.2150486, -0.4426765, 1.382038, 1, 1, 1, 1, 1,
0.2189931, -0.5963097, 2.18072, 1, 1, 1, 1, 1,
0.2297063, 1.153447, -1.477904, 1, 1, 1, 1, 1,
0.2312315, -0.7337531, 3.659043, 1, 1, 1, 1, 1,
0.2348109, -0.2391475, 2.221332, 1, 1, 1, 1, 1,
0.2351071, 1.156603, -0.1812919, 1, 1, 1, 1, 1,
0.2409669, 0.1035425, 0.9213055, 1, 1, 1, 1, 1,
0.2417282, 0.9270855, -0.06732634, 1, 1, 1, 1, 1,
0.2423545, 0.7706598, -1.812778, 0, 0, 1, 1, 1,
0.2427561, 0.6711236, 0.8975503, 1, 0, 0, 1, 1,
0.2431201, -0.7196796, 4.703594, 1, 0, 0, 1, 1,
0.2461963, 0.7558482, -0.02894562, 1, 0, 0, 1, 1,
0.2471767, 1.270123, 0.5844284, 1, 0, 0, 1, 1,
0.264152, 1.255043, -1.278202, 1, 0, 0, 1, 1,
0.2702774, 0.01209163, -0.04203434, 0, 0, 0, 1, 1,
0.2711866, 1.146899, 0.2860125, 0, 0, 0, 1, 1,
0.2768031, -1.648304, 4.240354, 0, 0, 0, 1, 1,
0.2810277, 0.1080633, 0.6802816, 0, 0, 0, 1, 1,
0.2812805, -0.3313234, 1.56196, 0, 0, 0, 1, 1,
0.2822348, -0.3193502, 2.737045, 0, 0, 0, 1, 1,
0.2857673, 0.2638783, 0.7048846, 0, 0, 0, 1, 1,
0.2921401, -0.3232013, 3.535802, 1, 1, 1, 1, 1,
0.2945116, 0.2493633, 0.4604233, 1, 1, 1, 1, 1,
0.2976259, 0.1225135, 1.732896, 1, 1, 1, 1, 1,
0.2995021, -1.043636, 4.300133, 1, 1, 1, 1, 1,
0.308448, 0.8262472, -1.224536, 1, 1, 1, 1, 1,
0.3087333, 2.764385, 0.6730202, 1, 1, 1, 1, 1,
0.3129823, 1.531087, -0.3629651, 1, 1, 1, 1, 1,
0.3134457, -1.361684, 3.883604, 1, 1, 1, 1, 1,
0.3137634, 0.4598053, 0.5618247, 1, 1, 1, 1, 1,
0.3139886, 0.9516416, -1.016681, 1, 1, 1, 1, 1,
0.3204316, -0.3239644, 2.363776, 1, 1, 1, 1, 1,
0.3350034, -1.867984, 4.255419, 1, 1, 1, 1, 1,
0.3358781, -0.1373026, 2.16998, 1, 1, 1, 1, 1,
0.3395525, 1.066846, 0.3263617, 1, 1, 1, 1, 1,
0.3412254, -0.4934582, 1.341318, 1, 1, 1, 1, 1,
0.3415969, -1.597203, 1.462036, 0, 0, 1, 1, 1,
0.345811, 0.1676873, 2.644463, 1, 0, 0, 1, 1,
0.3469673, 0.8688731, -0.9508499, 1, 0, 0, 1, 1,
0.3526913, 1.321971, 0.7540551, 1, 0, 0, 1, 1,
0.3533921, -0.9103901, 3.603189, 1, 0, 0, 1, 1,
0.3562295, -0.5187472, 2.145546, 1, 0, 0, 1, 1,
0.3607168, 0.6252421, 1.245191, 0, 0, 0, 1, 1,
0.3636024, -1.091014, 4.554772, 0, 0, 0, 1, 1,
0.3666794, 0.4549184, 0.5964509, 0, 0, 0, 1, 1,
0.3693643, -0.4718032, 2.608888, 0, 0, 0, 1, 1,
0.3714706, -0.02756473, 0.09433628, 0, 0, 0, 1, 1,
0.3759046, -0.1265681, 0.7730843, 0, 0, 0, 1, 1,
0.3763747, -0.8771906, 3.816445, 0, 0, 0, 1, 1,
0.3817109, 0.343137, 2.127672, 1, 1, 1, 1, 1,
0.3834837, 0.88155, 1.920066, 1, 1, 1, 1, 1,
0.3876128, 1.388244, 0.8285618, 1, 1, 1, 1, 1,
0.3902012, -0.3674282, 3.141547, 1, 1, 1, 1, 1,
0.4039455, 0.6562526, -1.450498, 1, 1, 1, 1, 1,
0.4052972, -0.5896823, 2.249095, 1, 1, 1, 1, 1,
0.4086998, 0.3753016, 1.183036, 1, 1, 1, 1, 1,
0.4175507, 0.68248, 0.04612027, 1, 1, 1, 1, 1,
0.4191016, -1.889022, 2.850064, 1, 1, 1, 1, 1,
0.4224036, 1.312389, 0.4589586, 1, 1, 1, 1, 1,
0.4228144, -0.4509576, 1.559675, 1, 1, 1, 1, 1,
0.4236028, -0.002033525, 2.758967, 1, 1, 1, 1, 1,
0.4291468, -0.09471436, 1.960554, 1, 1, 1, 1, 1,
0.429519, -0.390015, 1.927439, 1, 1, 1, 1, 1,
0.4333244, -1.333452, 3.526357, 1, 1, 1, 1, 1,
0.4338434, 1.269934, 0.4124106, 0, 0, 1, 1, 1,
0.4365639, -1.813209, 3.249135, 1, 0, 0, 1, 1,
0.4382527, 0.8360943, -0.5443498, 1, 0, 0, 1, 1,
0.4445912, -0.05509881, 1.729261, 1, 0, 0, 1, 1,
0.4495131, -2.081909, 2.953834, 1, 0, 0, 1, 1,
0.4498915, 1.876655, 1.014812, 1, 0, 0, 1, 1,
0.4502147, -0.4228411, 4.373381, 0, 0, 0, 1, 1,
0.4548364, 0.07287994, -0.5311928, 0, 0, 0, 1, 1,
0.457561, 1.483535, -1.511231, 0, 0, 0, 1, 1,
0.4584738, -0.6248798, 1.640609, 0, 0, 0, 1, 1,
0.4598163, 1.253557, 1.134418, 0, 0, 0, 1, 1,
0.4606518, 1.212318, -0.4431215, 0, 0, 0, 1, 1,
0.4616092, -0.2863944, 2.137959, 0, 0, 0, 1, 1,
0.4617971, 0.5465143, -0.5183495, 1, 1, 1, 1, 1,
0.4624541, 0.6728069, 1.249737, 1, 1, 1, 1, 1,
0.466285, -0.3374782, 2.149271, 1, 1, 1, 1, 1,
0.4669442, 1.19534, -1.013941, 1, 1, 1, 1, 1,
0.4684326, 0.7551171, 1.45544, 1, 1, 1, 1, 1,
0.468599, -0.8793025, 2.443808, 1, 1, 1, 1, 1,
0.478317, 0.5209364, 0.8008243, 1, 1, 1, 1, 1,
0.4793163, -0.4255371, 2.004175, 1, 1, 1, 1, 1,
0.4801157, -1.922822, 3.599539, 1, 1, 1, 1, 1,
0.4808499, -0.09423505, 0.7897666, 1, 1, 1, 1, 1,
0.4838126, -1.803797, 2.44552, 1, 1, 1, 1, 1,
0.4896699, -0.5202408, 2.103633, 1, 1, 1, 1, 1,
0.4908808, -1.311324, 3.901574, 1, 1, 1, 1, 1,
0.4967843, -1.120779, 2.271595, 1, 1, 1, 1, 1,
0.50052, -0.7414169, 3.224793, 1, 1, 1, 1, 1,
0.504713, -1.309716, 3.541349, 0, 0, 1, 1, 1,
0.5075074, -0.4030535, 4.06104, 1, 0, 0, 1, 1,
0.5116802, 1.022256, 0.9858903, 1, 0, 0, 1, 1,
0.5140432, 0.8165967, 0.8168595, 1, 0, 0, 1, 1,
0.5156991, 0.374984, 1.12452, 1, 0, 0, 1, 1,
0.5200691, 0.8369511, 0.3176188, 1, 0, 0, 1, 1,
0.5210754, 0.4760688, -0.3734006, 0, 0, 0, 1, 1,
0.5233278, -0.7675577, 3.745629, 0, 0, 0, 1, 1,
0.5265104, -0.1962026, 2.996938, 0, 0, 0, 1, 1,
0.5277323, 0.9336351, 0.291256, 0, 0, 0, 1, 1,
0.5350639, 0.6703516, 1.596328, 0, 0, 0, 1, 1,
0.5390572, 0.3561984, 0.3676862, 0, 0, 0, 1, 1,
0.5455073, -1.995584, 0.7516105, 0, 0, 0, 1, 1,
0.5477737, -0.3648214, 1.458349, 1, 1, 1, 1, 1,
0.5502094, 0.17784, 2.265824, 1, 1, 1, 1, 1,
0.5521666, 0.8704314, 0.3019195, 1, 1, 1, 1, 1,
0.5529081, 1.745103, -1.566828, 1, 1, 1, 1, 1,
0.5571944, -0.5536585, -0.01141977, 1, 1, 1, 1, 1,
0.5589629, -0.02392958, 2.489134, 1, 1, 1, 1, 1,
0.5608773, 0.1355264, 0.4151333, 1, 1, 1, 1, 1,
0.564492, -0.3558956, 0.7173919, 1, 1, 1, 1, 1,
0.5714892, 0.4715407, 1.330948, 1, 1, 1, 1, 1,
0.5784013, 0.8746181, -0.5066055, 1, 1, 1, 1, 1,
0.5826852, -0.2533188, 1.438775, 1, 1, 1, 1, 1,
0.5838812, 0.03124515, 2.112359, 1, 1, 1, 1, 1,
0.5853609, 1.371816, 1.54309, 1, 1, 1, 1, 1,
0.5893598, -0.3616957, 3.261741, 1, 1, 1, 1, 1,
0.5907999, -0.6143537, 1.49475, 1, 1, 1, 1, 1,
0.5921618, -0.3653515, 0.9490911, 0, 0, 1, 1, 1,
0.5937207, 0.7631057, -0.1919761, 1, 0, 0, 1, 1,
0.599643, 1.448339, 0.2608162, 1, 0, 0, 1, 1,
0.5998504, 2.905197, 1.218582, 1, 0, 0, 1, 1,
0.6019301, 2.093753, -1.050809, 1, 0, 0, 1, 1,
0.6029894, 0.241869, 0.03426961, 1, 0, 0, 1, 1,
0.6049965, 1.24316, -0.7183089, 0, 0, 0, 1, 1,
0.6068864, -0.2749286, 2.858019, 0, 0, 0, 1, 1,
0.6088971, 0.8577168, 0.7117798, 0, 0, 0, 1, 1,
0.612243, -1.104047, 0.7304712, 0, 0, 0, 1, 1,
0.6199589, -0.7519147, 1.055879, 0, 0, 0, 1, 1,
0.6237527, -1.188593, 3.697271, 0, 0, 0, 1, 1,
0.6239603, 0.5852487, 0.6003582, 0, 0, 0, 1, 1,
0.624875, -0.1731299, 2.633695, 1, 1, 1, 1, 1,
0.6253877, -0.3211633, 0.941626, 1, 1, 1, 1, 1,
0.6283914, 0.6676676, 1.932055, 1, 1, 1, 1, 1,
0.6289424, 1.363498, -1.424491, 1, 1, 1, 1, 1,
0.6307883, 1.608781, 1.407034, 1, 1, 1, 1, 1,
0.6312755, -1.357011, 1.794909, 1, 1, 1, 1, 1,
0.6343344, -1.697543, 3.159621, 1, 1, 1, 1, 1,
0.6364363, -0.93276, 2.566486, 1, 1, 1, 1, 1,
0.6379641, 0.436343, 2.47398, 1, 1, 1, 1, 1,
0.6458266, 0.9943934, 0.9181452, 1, 1, 1, 1, 1,
0.6510473, 1.423945, 1.83538, 1, 1, 1, 1, 1,
0.6511205, 1.399181, -0.1838508, 1, 1, 1, 1, 1,
0.6518052, 0.008431832, 0.8702273, 1, 1, 1, 1, 1,
0.6544061, -1.418216, 1.850126, 1, 1, 1, 1, 1,
0.6612989, 0.04596933, 1.424715, 1, 1, 1, 1, 1,
0.6648456, 0.5319074, 1.800391, 0, 0, 1, 1, 1,
0.6705236, -0.4859486, 1.25388, 1, 0, 0, 1, 1,
0.6705762, -1.430233, 3.809731, 1, 0, 0, 1, 1,
0.677497, 0.4757626, 1.008392, 1, 0, 0, 1, 1,
0.6798872, -2.293457, 2.649774, 1, 0, 0, 1, 1,
0.6865488, 0.4593479, 1.03611, 1, 0, 0, 1, 1,
0.6879358, -1.092658, 3.537258, 0, 0, 0, 1, 1,
0.6930928, -2.156389, 1.880691, 0, 0, 0, 1, 1,
0.6984057, 0.7795371, 0.834819, 0, 0, 0, 1, 1,
0.699086, -0.07598717, 2.231524, 0, 0, 0, 1, 1,
0.7032833, 0.2541945, -0.2246826, 0, 0, 0, 1, 1,
0.7090281, -0.9633002, 2.748059, 0, 0, 0, 1, 1,
0.7108747, -0.9197816, 2.059123, 0, 0, 0, 1, 1,
0.7127348, -1.273082, 3.071195, 1, 1, 1, 1, 1,
0.7140331, -0.9220801, 2.974769, 1, 1, 1, 1, 1,
0.7175769, 0.9559063, 1.004535, 1, 1, 1, 1, 1,
0.7188634, -1.276163, 3.174624, 1, 1, 1, 1, 1,
0.7204639, 0.1721707, 1.67221, 1, 1, 1, 1, 1,
0.7246112, -0.02570101, 0.3562191, 1, 1, 1, 1, 1,
0.7273394, -2.310647, 2.638204, 1, 1, 1, 1, 1,
0.7301615, -0.07941569, 0.8465206, 1, 1, 1, 1, 1,
0.7303271, 0.8180102, 1.243212, 1, 1, 1, 1, 1,
0.7305533, -0.12748, 3.222839, 1, 1, 1, 1, 1,
0.7338929, -0.6261751, -0.4212914, 1, 1, 1, 1, 1,
0.7390187, -0.1902177, 1.672527, 1, 1, 1, 1, 1,
0.7437898, -1.059059, 1.755359, 1, 1, 1, 1, 1,
0.7479192, 1.066479, 1.881081, 1, 1, 1, 1, 1,
0.7521949, -0.4058958, 2.188254, 1, 1, 1, 1, 1,
0.759352, -0.2077192, 1.940966, 0, 0, 1, 1, 1,
0.7642031, -1.735549, 2.488281, 1, 0, 0, 1, 1,
0.7647917, 0.9158511, 0.4964896, 1, 0, 0, 1, 1,
0.7655396, -2.736165, 1.94145, 1, 0, 0, 1, 1,
0.7680408, 2.448822, -1.388154, 1, 0, 0, 1, 1,
0.7981547, -0.934614, 2.572907, 1, 0, 0, 1, 1,
0.8073446, 0.4115139, 1.349662, 0, 0, 0, 1, 1,
0.8080072, 0.3536609, 2.903837, 0, 0, 0, 1, 1,
0.8090252, 1.219302, 1.522321, 0, 0, 0, 1, 1,
0.8136807, -0.1623348, 1.616307, 0, 0, 0, 1, 1,
0.8138514, 0.9156607, -0.1840948, 0, 0, 0, 1, 1,
0.8176183, -0.0599281, 0.4863867, 0, 0, 0, 1, 1,
0.8178685, 0.3094316, 0.9945145, 0, 0, 0, 1, 1,
0.8215319, -0.8208126, 2.709538, 1, 1, 1, 1, 1,
0.8241682, -1.047572, 1.966296, 1, 1, 1, 1, 1,
0.826215, 0.3207574, 2.752619, 1, 1, 1, 1, 1,
0.8263444, 0.6896709, 0.7040288, 1, 1, 1, 1, 1,
0.8291013, 0.371044, 0.3159007, 1, 1, 1, 1, 1,
0.8318708, -0.6395554, 3.60255, 1, 1, 1, 1, 1,
0.8329739, -0.2273166, 1.048746, 1, 1, 1, 1, 1,
0.8340573, -0.7659779, 3.032382, 1, 1, 1, 1, 1,
0.8342443, 0.4663474, -0.07103696, 1, 1, 1, 1, 1,
0.8358551, 0.1956106, 1.224209, 1, 1, 1, 1, 1,
0.8416864, -0.7603036, 2.36617, 1, 1, 1, 1, 1,
0.8443678, -1.447738, 2.555171, 1, 1, 1, 1, 1,
0.8465576, 1.99507, 0.8471753, 1, 1, 1, 1, 1,
0.8493254, 0.4262447, 1.027079, 1, 1, 1, 1, 1,
0.8521404, -0.4008631, 2.480682, 1, 1, 1, 1, 1,
0.8528553, 0.3074362, 0.293058, 0, 0, 1, 1, 1,
0.852985, -0.8404384, 3.816082, 1, 0, 0, 1, 1,
0.8545856, -0.159399, 3.02648, 1, 0, 0, 1, 1,
0.8571686, -1.018236, 4.310341, 1, 0, 0, 1, 1,
0.8590949, 0.1966405, 2.15221, 1, 0, 0, 1, 1,
0.8602936, -1.092237, 0.4032347, 1, 0, 0, 1, 1,
0.8615589, -0.4802617, 2.657751, 0, 0, 0, 1, 1,
0.8725036, -0.9796667, 0.8081779, 0, 0, 0, 1, 1,
0.8735344, -0.6260715, 0.7562384, 0, 0, 0, 1, 1,
0.8747485, 0.167505, 0.4350114, 0, 0, 0, 1, 1,
0.8749219, 1.034638, 1.602762, 0, 0, 0, 1, 1,
0.8799012, -0.8270229, 1.764756, 0, 0, 0, 1, 1,
0.8803985, 0.1491446, 3.165536, 0, 0, 0, 1, 1,
0.8854316, -0.7407448, 2.578018, 1, 1, 1, 1, 1,
0.8858076, 0.6381032, 0.2971248, 1, 1, 1, 1, 1,
0.8894912, -0.6850505, 2.451124, 1, 1, 1, 1, 1,
0.8960013, -1.867084, 3.748835, 1, 1, 1, 1, 1,
0.8973586, -0.9585815, 2.585375, 1, 1, 1, 1, 1,
0.8981899, -0.9797594, 3.027044, 1, 1, 1, 1, 1,
0.9034643, -0.344753, 1.894719, 1, 1, 1, 1, 1,
0.9036539, -1.579844, 3.678377, 1, 1, 1, 1, 1,
0.9063857, -0.2151563, 1.46141, 1, 1, 1, 1, 1,
0.9122553, 2.367937, -0.1597164, 1, 1, 1, 1, 1,
0.9126098, 0.5700403, -0.5025763, 1, 1, 1, 1, 1,
0.9157282, 2.624456, 0.7350294, 1, 1, 1, 1, 1,
0.9160301, 1.61333, 0.8687963, 1, 1, 1, 1, 1,
0.9194666, -0.2004353, 2.260602, 1, 1, 1, 1, 1,
0.9259023, -0.7268285, 2.773887, 1, 1, 1, 1, 1,
0.9272757, 0.651089, 1.860876, 0, 0, 1, 1, 1,
0.9294639, 1.832557, 0.5447366, 1, 0, 0, 1, 1,
0.9294916, -0.1386194, 1.197854, 1, 0, 0, 1, 1,
0.9307977, 0.03794771, 2.682826, 1, 0, 0, 1, 1,
0.9310061, -1.864114, 2.101683, 1, 0, 0, 1, 1,
0.9470609, -2.004339, 2.459263, 1, 0, 0, 1, 1,
0.9483209, 0.5888485, 0.07499743, 0, 0, 0, 1, 1,
0.9502555, 0.0841139, 2.19828, 0, 0, 0, 1, 1,
0.9627527, 0.004974108, 1.046254, 0, 0, 0, 1, 1,
0.9705514, 2.794206, -0.09601646, 0, 0, 0, 1, 1,
0.9758959, -0.2816246, 1.652564, 0, 0, 0, 1, 1,
0.9858909, 0.5343245, 1.093528, 0, 0, 0, 1, 1,
0.9891977, 1.016491, 1.12828, 0, 0, 0, 1, 1,
0.9999669, 0.4974981, 1.537226, 1, 1, 1, 1, 1,
1.004955, 2.309327, -0.4833541, 1, 1, 1, 1, 1,
1.007743, 0.6607907, 2.055443, 1, 1, 1, 1, 1,
1.015228, 0.1726592, 1.294589, 1, 1, 1, 1, 1,
1.015489, -0.04936756, 3.417095, 1, 1, 1, 1, 1,
1.016295, -0.9903967, 2.162719, 1, 1, 1, 1, 1,
1.021333, -1.350353, 5.152318, 1, 1, 1, 1, 1,
1.026343, -0.3124305, -0.1792881, 1, 1, 1, 1, 1,
1.02796, 1.223002, 1.188008, 1, 1, 1, 1, 1,
1.030234, 1.586469, 0.5639582, 1, 1, 1, 1, 1,
1.033951, -0.8040293, 1.70683, 1, 1, 1, 1, 1,
1.038373, -1.554913, 1.827074, 1, 1, 1, 1, 1,
1.040541, -0.1538435, 2.506646, 1, 1, 1, 1, 1,
1.045148, 1.264443, 1.639368, 1, 1, 1, 1, 1,
1.047994, 1.065437, 1.574044, 1, 1, 1, 1, 1,
1.054541, -0.7495999, 0.2644636, 0, 0, 1, 1, 1,
1.057664, 1.754798, -1.015337, 1, 0, 0, 1, 1,
1.057811, 0.2813004, 1.129092, 1, 0, 0, 1, 1,
1.061822, -0.002389472, 0.8124076, 1, 0, 0, 1, 1,
1.062421, 0.6842499, 1.262877, 1, 0, 0, 1, 1,
1.066992, -0.1789697, 2.31432, 1, 0, 0, 1, 1,
1.067862, -0.4806047, 3.310303, 0, 0, 0, 1, 1,
1.069054, -0.5794724, 2.51111, 0, 0, 0, 1, 1,
1.069991, 2.058279, -0.5994286, 0, 0, 0, 1, 1,
1.079557, 0.2874722, 0.191668, 0, 0, 0, 1, 1,
1.081475, -0.3482063, 0.44575, 0, 0, 0, 1, 1,
1.098197, -0.6832698, 2.932508, 0, 0, 0, 1, 1,
1.09936, 0.1315797, -0.2914388, 0, 0, 0, 1, 1,
1.099771, 0.2003096, 1.125158, 1, 1, 1, 1, 1,
1.112226, -0.1989294, 3.274993, 1, 1, 1, 1, 1,
1.112784, -1.518172, 2.365321, 1, 1, 1, 1, 1,
1.118929, 1.338831, -0.0007276287, 1, 1, 1, 1, 1,
1.120775, -0.1812059, 1.498231, 1, 1, 1, 1, 1,
1.128109, -0.5782296, 0.7225798, 1, 1, 1, 1, 1,
1.128953, -1.218006, 2.625904, 1, 1, 1, 1, 1,
1.131058, -1.78334, 2.913482, 1, 1, 1, 1, 1,
1.136104, 0.6393115, 1.202651, 1, 1, 1, 1, 1,
1.137912, 1.995737, -0.4609265, 1, 1, 1, 1, 1,
1.138441, 0.8095175, 2.398229, 1, 1, 1, 1, 1,
1.145959, -1.318297, 4.363957, 1, 1, 1, 1, 1,
1.148183, -0.9423412, 1.899147, 1, 1, 1, 1, 1,
1.157872, -0.5820476, 1.461374, 1, 1, 1, 1, 1,
1.163759, -1.445539, 3.061699, 1, 1, 1, 1, 1,
1.164363, 1.200296, 2.10448, 0, 0, 1, 1, 1,
1.170123, 0.7635192, 0.8484048, 1, 0, 0, 1, 1,
1.172973, 0.02744258, 0.3017301, 1, 0, 0, 1, 1,
1.174347, -0.8329595, 3.510442, 1, 0, 0, 1, 1,
1.179688, -0.566112, 1.419402, 1, 0, 0, 1, 1,
1.180522, 1.220718, 0.8566843, 1, 0, 0, 1, 1,
1.184529, 0.5506625, -0.05473635, 0, 0, 0, 1, 1,
1.186193, 0.02738119, 2.125194, 0, 0, 0, 1, 1,
1.190422, 0.3920982, 1.720042, 0, 0, 0, 1, 1,
1.190727, -0.4730212, 0.6860563, 0, 0, 0, 1, 1,
1.191225, 0.4449343, 0.8017209, 0, 0, 0, 1, 1,
1.193033, 0.3280856, 1.232739, 0, 0, 0, 1, 1,
1.193207, 0.1218927, 1.1145, 0, 0, 0, 1, 1,
1.202672, 0.2520796, 2.3971, 1, 1, 1, 1, 1,
1.203225, 0.2757138, 0.6986358, 1, 1, 1, 1, 1,
1.207374, -1.439641, 1.381912, 1, 1, 1, 1, 1,
1.224134, 0.4979616, 1.045954, 1, 1, 1, 1, 1,
1.225326, 0.8492931, 3.054144, 1, 1, 1, 1, 1,
1.227158, 0.3353291, 2.238794, 1, 1, 1, 1, 1,
1.256651, -0.9763727, 2.503027, 1, 1, 1, 1, 1,
1.257038, -0.2844591, 0.822246, 1, 1, 1, 1, 1,
1.261997, -0.6716248, 2.580566, 1, 1, 1, 1, 1,
1.264661, 0.2884589, 1.875351, 1, 1, 1, 1, 1,
1.265803, -0.7118227, 1.102273, 1, 1, 1, 1, 1,
1.267491, -0.5668747, 0.4615697, 1, 1, 1, 1, 1,
1.270472, -1.265079, 3.382567, 1, 1, 1, 1, 1,
1.273334, 1.409606, 0.6473362, 1, 1, 1, 1, 1,
1.28325, 0.7700751, 2.318025, 1, 1, 1, 1, 1,
1.289653, -0.5862529, 0.153078, 0, 0, 1, 1, 1,
1.305441, -0.2565242, 1.669256, 1, 0, 0, 1, 1,
1.305441, 0.7758956, 1.170929, 1, 0, 0, 1, 1,
1.306528, 0.3104771, 2.438614, 1, 0, 0, 1, 1,
1.327947, 1.392599, 1.583647, 1, 0, 0, 1, 1,
1.338753, 0.4024378, 3.090185, 1, 0, 0, 1, 1,
1.341256, 1.135721, -0.1306093, 0, 0, 0, 1, 1,
1.343988, -1.262392, 2.187436, 0, 0, 0, 1, 1,
1.350561, 1.813268, 1.412946, 0, 0, 0, 1, 1,
1.350603, -0.01351766, 2.030545, 0, 0, 0, 1, 1,
1.362229, -0.138709, 2.453247, 0, 0, 0, 1, 1,
1.370376, 0.3757606, 0.3756233, 0, 0, 0, 1, 1,
1.387746, -0.0891829, 2.336603, 0, 0, 0, 1, 1,
1.389236, 0.03201746, -1.440528, 1, 1, 1, 1, 1,
1.392263, 2.969723, 0.2125788, 1, 1, 1, 1, 1,
1.41426, 1.212494, 0.9367732, 1, 1, 1, 1, 1,
1.453505, 0.2579571, 0.9325226, 1, 1, 1, 1, 1,
1.483613, 0.3414586, 0.04203579, 1, 1, 1, 1, 1,
1.491256, -2.033248, 1.133045, 1, 1, 1, 1, 1,
1.493432, 0.03041489, 2.231355, 1, 1, 1, 1, 1,
1.493888, -1.001509, 1.160346, 1, 1, 1, 1, 1,
1.510243, -0.1392932, 2.089683, 1, 1, 1, 1, 1,
1.512078, -2.515301, 4.14466, 1, 1, 1, 1, 1,
1.519921, 0.2738739, 1.058234, 1, 1, 1, 1, 1,
1.52513, -0.341383, 3.29501, 1, 1, 1, 1, 1,
1.529203, -2.284233, 1.646818, 1, 1, 1, 1, 1,
1.531222, 0.6115535, 0.2116687, 1, 1, 1, 1, 1,
1.532977, -0.05305281, 4.303018, 1, 1, 1, 1, 1,
1.533941, -0.1814828, 2.804506, 0, 0, 1, 1, 1,
1.534664, 0.2848816, 1.830596, 1, 0, 0, 1, 1,
1.552434, 0.7374286, 2.286558, 1, 0, 0, 1, 1,
1.555666, 0.1165663, 1.282062, 1, 0, 0, 1, 1,
1.555878, 1.293995, -0.0442053, 1, 0, 0, 1, 1,
1.555956, 0.8349673, 1.83625, 1, 0, 0, 1, 1,
1.567938, -2.891158, 4.445055, 0, 0, 0, 1, 1,
1.570663, -2.294776, 2.882133, 0, 0, 0, 1, 1,
1.572467, -0.2927277, 1.04941, 0, 0, 0, 1, 1,
1.574777, 0.9231541, 2.155164, 0, 0, 0, 1, 1,
1.61136, 0.02352945, 2.016653, 0, 0, 0, 1, 1,
1.61159, 0.3575529, 1.314145, 0, 0, 0, 1, 1,
1.614329, 2.566198, 1.738318, 0, 0, 0, 1, 1,
1.621567, 0.03033226, 1.863055, 1, 1, 1, 1, 1,
1.648119, -0.1372904, 1.211682, 1, 1, 1, 1, 1,
1.662865, -0.02897568, 1.81883, 1, 1, 1, 1, 1,
1.662916, -0.8797624, 3.30961, 1, 1, 1, 1, 1,
1.66739, 0.2196622, 0.3581576, 1, 1, 1, 1, 1,
1.670979, 1.247897, 2.353272, 1, 1, 1, 1, 1,
1.672126, 1.764977, 0.6058334, 1, 1, 1, 1, 1,
1.698407, 0.3871179, -0.6690277, 1, 1, 1, 1, 1,
1.708633, 1.037373, 1.808432, 1, 1, 1, 1, 1,
1.715121, 0.9436182, -0.5741999, 1, 1, 1, 1, 1,
1.724649, 0.371553, 0.7491738, 1, 1, 1, 1, 1,
1.729326, -1.552241, 3.093643, 1, 1, 1, 1, 1,
1.741969, -0.02967709, 0.6355042, 1, 1, 1, 1, 1,
1.756171, -0.2694741, 3.324461, 1, 1, 1, 1, 1,
1.758374, 0.2841692, 2.83913, 1, 1, 1, 1, 1,
1.773179, -0.631013, 1.904347, 0, 0, 1, 1, 1,
1.788498, -0.4727678, 0.883994, 1, 0, 0, 1, 1,
1.805195, -0.3242768, -1.027032, 1, 0, 0, 1, 1,
1.809721, 1.243774, 2.653853, 1, 0, 0, 1, 1,
1.811425, -1.846043, 1.852362, 1, 0, 0, 1, 1,
1.829467, 0.08877282, 2.197145, 1, 0, 0, 1, 1,
1.842524, 0.4987943, -0.1149823, 0, 0, 0, 1, 1,
1.848449, 0.5616435, 1.365089, 0, 0, 0, 1, 1,
1.8512, -0.09590416, 2.193853, 0, 0, 0, 1, 1,
1.853472, -0.7419785, 0.8588796, 0, 0, 0, 1, 1,
1.861795, -0.004664445, 0.901643, 0, 0, 0, 1, 1,
1.868362, -0.5018535, 2.032679, 0, 0, 0, 1, 1,
1.877445, 0.6888027, 1.54227, 0, 0, 0, 1, 1,
1.888367, -0.7875518, 0.4356831, 1, 1, 1, 1, 1,
1.947697, -1.366833, 0.9799969, 1, 1, 1, 1, 1,
1.964916, -1.937523, 1.860976, 1, 1, 1, 1, 1,
1.983354, 0.814202, 0.184418, 1, 1, 1, 1, 1,
1.992523, -0.251813, 0.7012705, 1, 1, 1, 1, 1,
1.995564, -0.3245065, 1.492518, 1, 1, 1, 1, 1,
2.00598, -0.1295645, 1.973909, 1, 1, 1, 1, 1,
2.00965, 0.6034822, 2.373671, 1, 1, 1, 1, 1,
2.01742, -1.163519, 2.60817, 1, 1, 1, 1, 1,
2.021961, 1.76559, 2.673838, 1, 1, 1, 1, 1,
2.032435, 0.8104338, 1.005331, 1, 1, 1, 1, 1,
2.035496, 2.08511, 1.290971, 1, 1, 1, 1, 1,
2.076245, 0.02333185, 0.4413535, 1, 1, 1, 1, 1,
2.081091, -0.2893814, 2.269531, 1, 1, 1, 1, 1,
2.106085, -1.138857, 2.942543, 1, 1, 1, 1, 1,
2.11523, 0.7315925, 0.6295738, 0, 0, 1, 1, 1,
2.117375, -0.04315489, 1.039964, 1, 0, 0, 1, 1,
2.183662, 1.378524, 0.2196891, 1, 0, 0, 1, 1,
2.216068, 1.744063, -0.1585504, 1, 0, 0, 1, 1,
2.289299, 0.2758391, 1.872488, 1, 0, 0, 1, 1,
2.306919, 2.739365, 0.08051367, 1, 0, 0, 1, 1,
2.372135, 0.07396474, 1.379139, 0, 0, 0, 1, 1,
2.38143, -0.1757683, 2.534668, 0, 0, 0, 1, 1,
2.38836, 0.5265149, 1.609075, 0, 0, 0, 1, 1,
2.405144, -0.0330572, 3.242485, 0, 0, 0, 1, 1,
2.472125, -1.748793, 1.373441, 0, 0, 0, 1, 1,
2.478518, -0.003829745, 1.867955, 0, 0, 0, 1, 1,
2.500176, 0.2626895, -0.7668893, 0, 0, 0, 1, 1,
2.593043, 1.492741, -0.9158982, 1, 1, 1, 1, 1,
2.63733, -0.4880203, 1.108207, 1, 1, 1, 1, 1,
2.685899, -0.7459152, 2.48662, 1, 1, 1, 1, 1,
2.715548, 1.464567, 2.921855, 1, 1, 1, 1, 1,
2.741671, 1.795316, 2.917342, 1, 1, 1, 1, 1,
2.863418, 0.4292938, 0.1895053, 1, 1, 1, 1, 1,
2.969328, -0.6632818, 2.094087, 1, 1, 1, 1, 1
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
var radius = 9.64369;
var distance = 33.87305;
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
mvMatrix.translate( 0.2110691, -0.3090675, 0.1541367 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.87305);
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
