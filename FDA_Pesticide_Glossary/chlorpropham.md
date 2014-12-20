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
-3.265768, 0.2705078, -2.01046, 1, 0, 0, 1,
-2.821323, -0.09258075, -0.4508563, 1, 0.007843138, 0, 1,
-2.690992, 0.5824964, -2.120711, 1, 0.01176471, 0, 1,
-2.60899, -0.2313392, -1.889678, 1, 0.01960784, 0, 1,
-2.572423, 0.8976196, -0.5470447, 1, 0.02352941, 0, 1,
-2.51301, -0.7401242, -0.7147551, 1, 0.03137255, 0, 1,
-2.502529, 1.537205, -2.353747, 1, 0.03529412, 0, 1,
-2.416141, -0.8505021, -0.1587818, 1, 0.04313726, 0, 1,
-2.364966, -0.002976991, -0.5386385, 1, 0.04705882, 0, 1,
-2.342667, 0.2463796, -0.9423119, 1, 0.05490196, 0, 1,
-2.315775, 1.235121, -1.835355, 1, 0.05882353, 0, 1,
-2.295162, -0.3735339, -2.308844, 1, 0.06666667, 0, 1,
-2.284875, 1.597449, -2.390366, 1, 0.07058824, 0, 1,
-2.27867, -0.09796035, -1.790004, 1, 0.07843138, 0, 1,
-2.274726, -0.9911417, -1.698708, 1, 0.08235294, 0, 1,
-2.22273, -0.3865086, -1.663355, 1, 0.09019608, 0, 1,
-2.218999, 0.9125645, -1.234011, 1, 0.09411765, 0, 1,
-2.217477, 0.7302105, -0.9961821, 1, 0.1019608, 0, 1,
-2.21468, 1.305298, -0.8575976, 1, 0.1098039, 0, 1,
-2.205049, -0.09295558, -1.086663, 1, 0.1137255, 0, 1,
-2.185118, -1.914543, -3.217865, 1, 0.1215686, 0, 1,
-2.161959, -1.219313, -1.090769, 1, 0.1254902, 0, 1,
-2.102697, -1.084242, -1.889828, 1, 0.1333333, 0, 1,
-2.069369, 0.9441952, 1.317521, 1, 0.1372549, 0, 1,
-2.039768, 0.2776526, -0.4276763, 1, 0.145098, 0, 1,
-2.018855, -0.4806172, -2.211993, 1, 0.1490196, 0, 1,
-2.014264, -0.7615528, -2.037095, 1, 0.1568628, 0, 1,
-2.003741, 0.05417546, -1.798738, 1, 0.1607843, 0, 1,
-1.983286, 0.1712241, -1.442647, 1, 0.1686275, 0, 1,
-1.982772, -0.5943154, -2.353788, 1, 0.172549, 0, 1,
-1.971129, 0.8389484, -0.5854225, 1, 0.1803922, 0, 1,
-1.944039, -1.658982, -3.414609, 1, 0.1843137, 0, 1,
-1.898714, 0.4209741, -2.122861, 1, 0.1921569, 0, 1,
-1.877842, 2.706916, -0.5909976, 1, 0.1960784, 0, 1,
-1.852483, -0.6096637, -1.53402, 1, 0.2039216, 0, 1,
-1.844908, 0.9725661, -2.093764, 1, 0.2117647, 0, 1,
-1.838226, -0.6177886, -3.171448, 1, 0.2156863, 0, 1,
-1.81166, 0.7365913, -0.8910572, 1, 0.2235294, 0, 1,
-1.799944, -0.2872063, -2.20635, 1, 0.227451, 0, 1,
-1.786858, -0.830075, -0.8878343, 1, 0.2352941, 0, 1,
-1.781217, -0.185534, -2.65695, 1, 0.2392157, 0, 1,
-1.770327, -0.07716543, -1.092231, 1, 0.2470588, 0, 1,
-1.767187, 1.557075, -3.339024, 1, 0.2509804, 0, 1,
-1.762012, -0.8671497, -2.787272, 1, 0.2588235, 0, 1,
-1.758174, -0.4314936, -2.4506, 1, 0.2627451, 0, 1,
-1.742889, -1.414823, 0.002692344, 1, 0.2705882, 0, 1,
-1.737511, 0.9720039, -2.307955, 1, 0.2745098, 0, 1,
-1.724035, 1.070661, -0.3339168, 1, 0.282353, 0, 1,
-1.718292, -1.156302, -1.34455, 1, 0.2862745, 0, 1,
-1.716857, -0.1212038, -1.843081, 1, 0.2941177, 0, 1,
-1.708762, -0.9965176, -1.253513, 1, 0.3019608, 0, 1,
-1.706109, 0.5934885, -1.635681, 1, 0.3058824, 0, 1,
-1.683372, -1.112357, -0.4460055, 1, 0.3137255, 0, 1,
-1.669422, -1.375533, -0.9636678, 1, 0.3176471, 0, 1,
-1.66558, 0.5516041, -2.190435, 1, 0.3254902, 0, 1,
-1.638133, 0.3723443, -0.6718198, 1, 0.3294118, 0, 1,
-1.635764, 1.165573, -1.157158, 1, 0.3372549, 0, 1,
-1.629102, -0.5026715, -3.721627, 1, 0.3411765, 0, 1,
-1.62843, 2.709087, 0.2247183, 1, 0.3490196, 0, 1,
-1.593125, 0.009774006, -1.728035, 1, 0.3529412, 0, 1,
-1.58248, 0.1073544, -0.1916843, 1, 0.3607843, 0, 1,
-1.574682, -0.1503644, -2.145067, 1, 0.3647059, 0, 1,
-1.573851, 1.434631, -1.219653, 1, 0.372549, 0, 1,
-1.561466, 0.4675176, -0.9207525, 1, 0.3764706, 0, 1,
-1.559123, 0.4903545, -1.847082, 1, 0.3843137, 0, 1,
-1.537443, 1.194014, -1.128718, 1, 0.3882353, 0, 1,
-1.518362, -1.141977, -2.070115, 1, 0.3960784, 0, 1,
-1.517283, 1.069561, -2.991254, 1, 0.4039216, 0, 1,
-1.507536, 0.6570398, -1.264757, 1, 0.4078431, 0, 1,
-1.50186, -0.1939381, -3.063789, 1, 0.4156863, 0, 1,
-1.497395, -0.4766351, -4.194023, 1, 0.4196078, 0, 1,
-1.481271, 0.2228902, -3.008809, 1, 0.427451, 0, 1,
-1.472299, -0.5352691, -2.169777, 1, 0.4313726, 0, 1,
-1.466518, 0.6278061, -0.4735125, 1, 0.4392157, 0, 1,
-1.451887, 0.1178324, -1.679506, 1, 0.4431373, 0, 1,
-1.448296, -0.1649512, -2.967312, 1, 0.4509804, 0, 1,
-1.444916, 0.4194633, -0.4089322, 1, 0.454902, 0, 1,
-1.42475, -0.8684587, -2.040228, 1, 0.4627451, 0, 1,
-1.420598, 0.3966306, -1.69539, 1, 0.4666667, 0, 1,
-1.401689, -0.5341154, -1.808764, 1, 0.4745098, 0, 1,
-1.396464, 0.4037191, 0.7562618, 1, 0.4784314, 0, 1,
-1.39646, 0.5018627, 0.1586803, 1, 0.4862745, 0, 1,
-1.383396, 0.4736076, -0.3765546, 1, 0.4901961, 0, 1,
-1.382897, -0.571606, -2.046371, 1, 0.4980392, 0, 1,
-1.38042, -0.8080859, -0.5068079, 1, 0.5058824, 0, 1,
-1.379323, 0.3071172, -0.07981722, 1, 0.509804, 0, 1,
-1.364763, 0.4023346, 0.01015088, 1, 0.5176471, 0, 1,
-1.342775, -0.3771186, -1.295352, 1, 0.5215687, 0, 1,
-1.324643, -0.05197123, -0.925241, 1, 0.5294118, 0, 1,
-1.321453, -0.1270848, -1.24363, 1, 0.5333334, 0, 1,
-1.320784, 2.584226, 0.3088448, 1, 0.5411765, 0, 1,
-1.31352, 1.433783, -1.044911, 1, 0.5450981, 0, 1,
-1.309873, -1.382533, -3.43863, 1, 0.5529412, 0, 1,
-1.304539, -0.1344084, 0.1008134, 1, 0.5568628, 0, 1,
-1.301963, 1.0512, -0.4631935, 1, 0.5647059, 0, 1,
-1.293788, 1.526456, -0.8278098, 1, 0.5686275, 0, 1,
-1.293, -0.6362993, -2.272148, 1, 0.5764706, 0, 1,
-1.28992, -0.5466218, -3.478523, 1, 0.5803922, 0, 1,
-1.284467, -0.4840859, -3.259233, 1, 0.5882353, 0, 1,
-1.284092, -0.6755871, -1.829646, 1, 0.5921569, 0, 1,
-1.271524, -0.7327374, -3.542273, 1, 0.6, 0, 1,
-1.270278, 0.0925822, -1.273077, 1, 0.6078432, 0, 1,
-1.26265, -0.6477889, -1.144002, 1, 0.6117647, 0, 1,
-1.260043, -0.1306682, -0.2713133, 1, 0.6196079, 0, 1,
-1.258727, 0.9486724, -0.7109907, 1, 0.6235294, 0, 1,
-1.258132, -0.3730303, -0.5108935, 1, 0.6313726, 0, 1,
-1.257031, 1.837072, -0.5652124, 1, 0.6352941, 0, 1,
-1.25351, -0.6448262, -0.2978627, 1, 0.6431373, 0, 1,
-1.244775, -0.3391191, -3.438025, 1, 0.6470588, 0, 1,
-1.233756, 0.2452166, -1.409418, 1, 0.654902, 0, 1,
-1.221311, 0.03278875, -3.065733, 1, 0.6588235, 0, 1,
-1.204268, -0.4868881, -2.11848, 1, 0.6666667, 0, 1,
-1.202549, 0.09237976, -1.289201, 1, 0.6705883, 0, 1,
-1.202259, -0.05711213, -0.4418019, 1, 0.6784314, 0, 1,
-1.196456, -1.29263, -1.488534, 1, 0.682353, 0, 1,
-1.192448, -1.139484, -2.149962, 1, 0.6901961, 0, 1,
-1.18758, 0.3425256, -0.08274782, 1, 0.6941177, 0, 1,
-1.184241, -2.124173, -4.103991, 1, 0.7019608, 0, 1,
-1.172283, 0.5964922, 0.1049467, 1, 0.7098039, 0, 1,
-1.170282, -0.6674003, -1.436684, 1, 0.7137255, 0, 1,
-1.169239, 1.444162, -0.2348533, 1, 0.7215686, 0, 1,
-1.167438, -0.2211753, -1.592293, 1, 0.7254902, 0, 1,
-1.159809, 1.9527, -1.267742, 1, 0.7333333, 0, 1,
-1.159165, 0.9618961, -2.033737, 1, 0.7372549, 0, 1,
-1.153312, 1.230913, -1.225233, 1, 0.7450981, 0, 1,
-1.148188, -0.9091721, -2.778204, 1, 0.7490196, 0, 1,
-1.137367, -0.01156032, -1.311949, 1, 0.7568628, 0, 1,
-1.132982, -0.3159882, -1.646532, 1, 0.7607843, 0, 1,
-1.132029, 0.7214985, 0.6596515, 1, 0.7686275, 0, 1,
-1.127558, -1.278773, -2.251757, 1, 0.772549, 0, 1,
-1.12605, -2.418117, -3.801491, 1, 0.7803922, 0, 1,
-1.124526, 0.8337047, -0.5201422, 1, 0.7843137, 0, 1,
-1.123665, -0.8566484, -2.299507, 1, 0.7921569, 0, 1,
-1.123522, 2.451646, -0.7857985, 1, 0.7960784, 0, 1,
-1.122284, 0.640402, -2.444421, 1, 0.8039216, 0, 1,
-1.118127, 0.06953298, -0.7261271, 1, 0.8117647, 0, 1,
-1.11692, -0.5512905, -2.698122, 1, 0.8156863, 0, 1,
-1.113942, 0.1777376, -1.402755, 1, 0.8235294, 0, 1,
-1.100604, -1.836597, -2.127645, 1, 0.827451, 0, 1,
-1.098367, 1.531299, -0.3979215, 1, 0.8352941, 0, 1,
-1.092193, -0.770462, -1.438697, 1, 0.8392157, 0, 1,
-1.070568, 0.6773379, -1.664565, 1, 0.8470588, 0, 1,
-1.069165, 0.3267416, -1.075995, 1, 0.8509804, 0, 1,
-1.066013, -0.2283849, -4.101071, 1, 0.8588235, 0, 1,
-1.065925, -0.0381031, -2.930473, 1, 0.8627451, 0, 1,
-1.063867, -1.539292, -3.339803, 1, 0.8705882, 0, 1,
-1.061388, 0.5127708, -2.303183, 1, 0.8745098, 0, 1,
-1.056937, -0.02807077, -2.946678, 1, 0.8823529, 0, 1,
-1.048348, 0.4089314, -2.092355, 1, 0.8862745, 0, 1,
-1.046668, -0.8887317, -0.639731, 1, 0.8941177, 0, 1,
-1.045035, 0.0755421, -3.089432, 1, 0.8980392, 0, 1,
-1.032466, -0.01635099, -0.5762959, 1, 0.9058824, 0, 1,
-1.032024, 0.002624887, -1.766448, 1, 0.9137255, 0, 1,
-1.029498, 1.011275, 0.01953581, 1, 0.9176471, 0, 1,
-1.027403, -0.1480689, -3.027673, 1, 0.9254902, 0, 1,
-1.024367, -0.2949498, -2.041736, 1, 0.9294118, 0, 1,
-1.018853, 0.05604918, -2.665155, 1, 0.9372549, 0, 1,
-1.017317, -0.9914614, -2.729717, 1, 0.9411765, 0, 1,
-1.001953, 0.596506, -0.9213981, 1, 0.9490196, 0, 1,
-0.9982221, 0.3689126, -1.151924, 1, 0.9529412, 0, 1,
-0.992361, 0.8134341, -1.815325, 1, 0.9607843, 0, 1,
-0.990894, 0.4578437, -1.167831, 1, 0.9647059, 0, 1,
-0.9881427, 0.1194236, -1.697675, 1, 0.972549, 0, 1,
-0.983108, -0.5296491, -0.6657553, 1, 0.9764706, 0, 1,
-0.9774432, 1.804697, -0.08010311, 1, 0.9843137, 0, 1,
-0.9762819, 0.06513943, -1.821882, 1, 0.9882353, 0, 1,
-0.971622, 0.585098, 0.1530904, 1, 0.9960784, 0, 1,
-0.9667806, -0.3538216, -1.907655, 0.9960784, 1, 0, 1,
-0.9653232, -0.575879, -1.498992, 0.9921569, 1, 0, 1,
-0.9652849, -1.326247, -2.168515, 0.9843137, 1, 0, 1,
-0.9645289, -0.4803289, -2.508699, 0.9803922, 1, 0, 1,
-0.9643531, -0.5223565, -2.529224, 0.972549, 1, 0, 1,
-0.9615847, -0.06743479, -1.598228, 0.9686275, 1, 0, 1,
-0.9575571, 0.8278067, -1.716229, 0.9607843, 1, 0, 1,
-0.9522328, 0.2586653, -1.205309, 0.9568627, 1, 0, 1,
-0.9513948, -0.4743798, -1.925118, 0.9490196, 1, 0, 1,
-0.9479505, -1.475175, -2.966135, 0.945098, 1, 0, 1,
-0.9408193, 0.06398284, -2.85206, 0.9372549, 1, 0, 1,
-0.9399176, 0.6913277, -0.5666171, 0.9333333, 1, 0, 1,
-0.9332285, 0.6759046, -1.830119, 0.9254902, 1, 0, 1,
-0.9330046, 1.480236, -1.295767, 0.9215686, 1, 0, 1,
-0.9295868, -1.167878, -2.408056, 0.9137255, 1, 0, 1,
-0.9238825, -1.045617, -2.440431, 0.9098039, 1, 0, 1,
-0.9212546, -0.1860297, -1.917307, 0.9019608, 1, 0, 1,
-0.9178331, 1.213577, 0.01600363, 0.8941177, 1, 0, 1,
-0.9100974, -1.378657, -3.206157, 0.8901961, 1, 0, 1,
-0.9091102, -1.541034, -2.372204, 0.8823529, 1, 0, 1,
-0.9082432, -0.584954, -3.298047, 0.8784314, 1, 0, 1,
-0.9066818, 1.392548, 0.2092451, 0.8705882, 1, 0, 1,
-0.9054024, -2.248782, -2.819272, 0.8666667, 1, 0, 1,
-0.8937076, 0.2892236, -2.428864, 0.8588235, 1, 0, 1,
-0.8894473, 0.08849602, -0.6970742, 0.854902, 1, 0, 1,
-0.8820188, 1.926104, -1.871838, 0.8470588, 1, 0, 1,
-0.8762239, -0.416733, -3.826229, 0.8431373, 1, 0, 1,
-0.8749892, 0.5343931, -0.8044143, 0.8352941, 1, 0, 1,
-0.8748637, -1.135952, -1.792217, 0.8313726, 1, 0, 1,
-0.8725837, 0.1729047, -1.945132, 0.8235294, 1, 0, 1,
-0.8699414, -0.7854121, -2.341184, 0.8196079, 1, 0, 1,
-0.8680354, -0.9159169, -3.02461, 0.8117647, 1, 0, 1,
-0.8673413, -2.453607, -2.593687, 0.8078431, 1, 0, 1,
-0.8599937, -0.7585008, -3.097443, 0.8, 1, 0, 1,
-0.8591602, 0.6854683, 0.3552664, 0.7921569, 1, 0, 1,
-0.8589903, -0.1920835, -1.607838, 0.7882353, 1, 0, 1,
-0.8551752, 0.5111624, -1.638842, 0.7803922, 1, 0, 1,
-0.8547657, -0.6328804, -1.587126, 0.7764706, 1, 0, 1,
-0.8523206, 1.170532, -1.405018, 0.7686275, 1, 0, 1,
-0.8515143, 0.01426652, 0.003333617, 0.7647059, 1, 0, 1,
-0.8506006, -0.7907681, -1.877273, 0.7568628, 1, 0, 1,
-0.8503275, -0.9607577, -1.324382, 0.7529412, 1, 0, 1,
-0.8479883, 0.9957211, -0.857655, 0.7450981, 1, 0, 1,
-0.8472686, 0.01162648, -1.658665, 0.7411765, 1, 0, 1,
-0.8447725, -0.7053163, -1.834574, 0.7333333, 1, 0, 1,
-0.8431157, 1.54952, -0.09082453, 0.7294118, 1, 0, 1,
-0.8398004, 0.1059077, -2.006581, 0.7215686, 1, 0, 1,
-0.8373296, 0.4796583, 0.4142318, 0.7176471, 1, 0, 1,
-0.8352754, 1.014465, 0.2964526, 0.7098039, 1, 0, 1,
-0.8292075, -1.131682, -2.280037, 0.7058824, 1, 0, 1,
-0.8237396, -0.7430381, -2.97879, 0.6980392, 1, 0, 1,
-0.815244, 0.8327976, 0.4282886, 0.6901961, 1, 0, 1,
-0.8150248, 0.3892171, -0.7419761, 0.6862745, 1, 0, 1,
-0.80585, -0.08226313, -1.422355, 0.6784314, 1, 0, 1,
-0.8040622, 0.3392846, -1.103831, 0.6745098, 1, 0, 1,
-0.8027119, 0.4685528, -2.911555, 0.6666667, 1, 0, 1,
-0.8014743, 1.224678, -0.4777038, 0.6627451, 1, 0, 1,
-0.7996715, 0.4123929, -0.448274, 0.654902, 1, 0, 1,
-0.7982663, 2.695562, 0.6183059, 0.6509804, 1, 0, 1,
-0.7932998, 0.9339539, -0.9284283, 0.6431373, 1, 0, 1,
-0.793146, -0.2823766, 0.4692313, 0.6392157, 1, 0, 1,
-0.7905641, -0.8493751, -3.784472, 0.6313726, 1, 0, 1,
-0.7832541, -0.6163048, -0.1081216, 0.627451, 1, 0, 1,
-0.7828885, 0.2188328, 0.7432395, 0.6196079, 1, 0, 1,
-0.7713336, -2.468938, -2.376702, 0.6156863, 1, 0, 1,
-0.7605701, 0.6476963, -1.785708, 0.6078432, 1, 0, 1,
-0.7558501, 1.341425, -1.349343, 0.6039216, 1, 0, 1,
-0.7534167, -1.010367, -1.538764, 0.5960785, 1, 0, 1,
-0.7478403, 2.010112, 1.944365, 0.5882353, 1, 0, 1,
-0.7466695, -1.513193, -3.317828, 0.5843138, 1, 0, 1,
-0.7456193, 1.992549, -0.2019688, 0.5764706, 1, 0, 1,
-0.7439349, -2.439156, -3.549245, 0.572549, 1, 0, 1,
-0.7432981, 0.2781623, -2.86093, 0.5647059, 1, 0, 1,
-0.7428006, 1.794011, -0.6508653, 0.5607843, 1, 0, 1,
-0.7420536, -1.31378, -2.371056, 0.5529412, 1, 0, 1,
-0.7375214, -0.4475068, -3.537316, 0.5490196, 1, 0, 1,
-0.7288504, -0.2666944, -3.348662, 0.5411765, 1, 0, 1,
-0.7275767, -1.147729, -2.928159, 0.5372549, 1, 0, 1,
-0.7260383, 0.3026235, -1.091934, 0.5294118, 1, 0, 1,
-0.72374, -1.028402, -1.483801, 0.5254902, 1, 0, 1,
-0.7212919, 1.362359, -0.2263737, 0.5176471, 1, 0, 1,
-0.7189839, 0.8019449, -0.01449408, 0.5137255, 1, 0, 1,
-0.717532, -0.4534729, -1.071786, 0.5058824, 1, 0, 1,
-0.715782, 1.421928, -0.479771, 0.5019608, 1, 0, 1,
-0.7128969, -0.6853983, -2.473562, 0.4941176, 1, 0, 1,
-0.7110279, -0.2561319, -1.740942, 0.4862745, 1, 0, 1,
-0.707719, 1.266559, 1.611177, 0.4823529, 1, 0, 1,
-0.7054299, -0.8679813, -1.944953, 0.4745098, 1, 0, 1,
-0.7045902, 2.21881, -0.07732913, 0.4705882, 1, 0, 1,
-0.7031017, 1.241912, 0.4714572, 0.4627451, 1, 0, 1,
-0.69886, -0.232612, -2.304632, 0.4588235, 1, 0, 1,
-0.6987446, 0.1154075, -2.023071, 0.4509804, 1, 0, 1,
-0.698085, 0.4323625, -0.4048156, 0.4470588, 1, 0, 1,
-0.6973067, 0.907526, -0.2973496, 0.4392157, 1, 0, 1,
-0.6941986, -0.5217189, -2.770519, 0.4352941, 1, 0, 1,
-0.6848258, -0.8729908, -1.830254, 0.427451, 1, 0, 1,
-0.6823611, 0.5707735, -2.479031, 0.4235294, 1, 0, 1,
-0.6786934, -1.40467, -4.026941, 0.4156863, 1, 0, 1,
-0.6771947, -0.6566663, -2.369637, 0.4117647, 1, 0, 1,
-0.6765007, 0.5536362, -0.2251728, 0.4039216, 1, 0, 1,
-0.6759489, -0.4083984, -0.3400902, 0.3960784, 1, 0, 1,
-0.6678307, -0.497259, -1.583007, 0.3921569, 1, 0, 1,
-0.6676384, -0.3677573, -1.800793, 0.3843137, 1, 0, 1,
-0.6634603, -0.7617939, -3.746706, 0.3803922, 1, 0, 1,
-0.6630784, -0.4970679, -1.65516, 0.372549, 1, 0, 1,
-0.6601725, 1.105659, -0.2358271, 0.3686275, 1, 0, 1,
-0.6596408, 0.3944467, -0.9948173, 0.3607843, 1, 0, 1,
-0.6462574, -0.5066816, -2.24209, 0.3568628, 1, 0, 1,
-0.6421987, 0.4941327, -3.329493, 0.3490196, 1, 0, 1,
-0.6403356, -1.952289, -5.580008, 0.345098, 1, 0, 1,
-0.6370106, 0.5894904, -1.680959, 0.3372549, 1, 0, 1,
-0.6264749, -1.487307, -3.36197, 0.3333333, 1, 0, 1,
-0.623389, 0.6122702, 0.06852099, 0.3254902, 1, 0, 1,
-0.6217394, 0.6001776, -0.7775057, 0.3215686, 1, 0, 1,
-0.6204982, -0.5154741, -3.065242, 0.3137255, 1, 0, 1,
-0.6160048, 0.2137097, -0.02010202, 0.3098039, 1, 0, 1,
-0.6159558, -0.6926179, -1.222783, 0.3019608, 1, 0, 1,
-0.6132069, 1.085075, -0.1154531, 0.2941177, 1, 0, 1,
-0.6080658, -1.567053, -3.540351, 0.2901961, 1, 0, 1,
-0.6066456, -0.9906704, -2.340299, 0.282353, 1, 0, 1,
-0.6059033, -0.7956118, -2.166317, 0.2784314, 1, 0, 1,
-0.5994349, 0.6231065, -0.6181901, 0.2705882, 1, 0, 1,
-0.5989892, -1.191949, -2.773431, 0.2666667, 1, 0, 1,
-0.5935019, 0.5222124, -0.007613105, 0.2588235, 1, 0, 1,
-0.5932425, -1.716112, -4.203251, 0.254902, 1, 0, 1,
-0.5922467, -2.341187, -3.68391, 0.2470588, 1, 0, 1,
-0.5873557, 1.530875, -0.1893298, 0.2431373, 1, 0, 1,
-0.5853817, -0.7757795, -3.233516, 0.2352941, 1, 0, 1,
-0.5829054, -0.4071455, -1.815489, 0.2313726, 1, 0, 1,
-0.5812758, -0.006549787, -0.8677254, 0.2235294, 1, 0, 1,
-0.5812314, -0.9690503, -2.956964, 0.2196078, 1, 0, 1,
-0.5777824, 1.334172, -1.141754, 0.2117647, 1, 0, 1,
-0.5769621, -2.089942, -4.339248, 0.2078431, 1, 0, 1,
-0.5757337, -1.228617, -2.835545, 0.2, 1, 0, 1,
-0.5739357, -0.5163102, -2.700474, 0.1921569, 1, 0, 1,
-0.5723068, -1.165709, -2.215166, 0.1882353, 1, 0, 1,
-0.567499, -0.4368899, -1.536261, 0.1803922, 1, 0, 1,
-0.5670223, -1.077749, -2.598817, 0.1764706, 1, 0, 1,
-0.5659836, 0.004334817, -2.263397, 0.1686275, 1, 0, 1,
-0.5623143, 0.1163669, -2.121949, 0.1647059, 1, 0, 1,
-0.5476642, 0.6188208, -2.1288, 0.1568628, 1, 0, 1,
-0.5469867, 0.8528937, 0.3051804, 0.1529412, 1, 0, 1,
-0.5409098, 0.07771699, -3.534992, 0.145098, 1, 0, 1,
-0.5402864, 0.6329049, -0.6581668, 0.1411765, 1, 0, 1,
-0.5359409, -0.5176134, -2.528075, 0.1333333, 1, 0, 1,
-0.5320569, 0.7859704, 0.5947837, 0.1294118, 1, 0, 1,
-0.527995, 1.905064, 2.183761, 0.1215686, 1, 0, 1,
-0.527917, 1.059905, -0.9213769, 0.1176471, 1, 0, 1,
-0.5251018, 0.1215391, -2.27403, 0.1098039, 1, 0, 1,
-0.5203443, -0.8395482, -3.276862, 0.1058824, 1, 0, 1,
-0.5179765, 1.35612, -0.7220086, 0.09803922, 1, 0, 1,
-0.5166321, 0.6915635, 0.3462895, 0.09019608, 1, 0, 1,
-0.514562, -1.853174, -3.922063, 0.08627451, 1, 0, 1,
-0.5094715, -2.099194, -5.273114, 0.07843138, 1, 0, 1,
-0.5090415, 0.004639949, -0.551775, 0.07450981, 1, 0, 1,
-0.5026655, -0.3177238, -2.595449, 0.06666667, 1, 0, 1,
-0.5019231, 1.052971, 0.09273043, 0.0627451, 1, 0, 1,
-0.4963001, -0.8960369, -3.093946, 0.05490196, 1, 0, 1,
-0.496143, 2.238524, 0.4163407, 0.05098039, 1, 0, 1,
-0.4930515, 0.8472258, -0.9524889, 0.04313726, 1, 0, 1,
-0.4916135, -0.07399281, 0.1256254, 0.03921569, 1, 0, 1,
-0.4908072, -0.925612, -3.509255, 0.03137255, 1, 0, 1,
-0.4898891, -0.04158895, -0.7135619, 0.02745098, 1, 0, 1,
-0.4859789, 1.942872, -1.894851, 0.01960784, 1, 0, 1,
-0.4830618, -0.3832268, -4.086846, 0.01568628, 1, 0, 1,
-0.4827113, -0.506099, -2.781958, 0.007843138, 1, 0, 1,
-0.4758998, -0.5774822, -1.588152, 0.003921569, 1, 0, 1,
-0.473626, -0.4480885, -2.241111, 0, 1, 0.003921569, 1,
-0.468, -2.506725, -4.442356, 0, 1, 0.01176471, 1,
-0.4664827, -0.9085171, -3.113124, 0, 1, 0.01568628, 1,
-0.4658326, 0.00342552, -0.621245, 0, 1, 0.02352941, 1,
-0.4641867, 1.511423, 1.224051, 0, 1, 0.02745098, 1,
-0.4626703, -0.4193147, -2.770321, 0, 1, 0.03529412, 1,
-0.4619766, 1.554195, -0.7948098, 0, 1, 0.03921569, 1,
-0.4602892, -0.7374068, -1.849934, 0, 1, 0.04705882, 1,
-0.4561843, -0.3090177, -2.817474, 0, 1, 0.05098039, 1,
-0.4501179, -1.206909, -4.667381, 0, 1, 0.05882353, 1,
-0.4435792, 1.822409, -1.456216, 0, 1, 0.0627451, 1,
-0.4394076, -1.232585, -4.604439, 0, 1, 0.07058824, 1,
-0.4389256, -1.19148, -4.022321, 0, 1, 0.07450981, 1,
-0.4382493, -1.280992, -1.200028, 0, 1, 0.08235294, 1,
-0.4330396, -1.496055, -0.7135881, 0, 1, 0.08627451, 1,
-0.4317301, 2.290753, 1.426481, 0, 1, 0.09411765, 1,
-0.4312282, 0.0370374, -5.131351, 0, 1, 0.1019608, 1,
-0.430596, 0.4457018, -1.870632, 0, 1, 0.1058824, 1,
-0.4280052, 1.376514, -0.3747027, 0, 1, 0.1137255, 1,
-0.423685, -0.7046214, -3.91039, 0, 1, 0.1176471, 1,
-0.4193828, 1.002378, 0.279512, 0, 1, 0.1254902, 1,
-0.4149896, -1.450675, -2.734602, 0, 1, 0.1294118, 1,
-0.4142529, -1.097867, -1.902904, 0, 1, 0.1372549, 1,
-0.4117711, 0.1102641, -1.585564, 0, 1, 0.1411765, 1,
-0.411698, -0.7853696, -1.120535, 0, 1, 0.1490196, 1,
-0.4114296, -0.60725, -3.756636, 0, 1, 0.1529412, 1,
-0.4097585, -0.5747469, -2.399564, 0, 1, 0.1607843, 1,
-0.4064927, 1.297862, -0.4342474, 0, 1, 0.1647059, 1,
-0.4063239, 0.7341163, -0.5686645, 0, 1, 0.172549, 1,
-0.404465, 0.4303358, -1.133281, 0, 1, 0.1764706, 1,
-0.3985772, 0.9054641, -1.422943, 0, 1, 0.1843137, 1,
-0.3977268, -0.0414263, -0.9017483, 0, 1, 0.1882353, 1,
-0.3952389, -0.03837089, -0.7042549, 0, 1, 0.1960784, 1,
-0.3835205, 0.3649265, 0.4893706, 0, 1, 0.2039216, 1,
-0.3686973, -0.0866856, -1.133894, 0, 1, 0.2078431, 1,
-0.3615992, 0.5322424, 0.5708353, 0, 1, 0.2156863, 1,
-0.3574423, -0.004638935, -0.9941163, 0, 1, 0.2196078, 1,
-0.353627, -0.5828636, -3.355842, 0, 1, 0.227451, 1,
-0.3534333, -0.4963099, -1.689184, 0, 1, 0.2313726, 1,
-0.3477961, -0.3333952, -0.1910286, 0, 1, 0.2392157, 1,
-0.3469541, -0.18647, -0.8685033, 0, 1, 0.2431373, 1,
-0.3414388, -0.404191, -3.480274, 0, 1, 0.2509804, 1,
-0.3398291, 0.9661546, -0.8648207, 0, 1, 0.254902, 1,
-0.3353322, 0.141372, -0.4951656, 0, 1, 0.2627451, 1,
-0.3349777, -1.312565, -4.271534, 0, 1, 0.2666667, 1,
-0.3270023, 1.769769, 0.9921852, 0, 1, 0.2745098, 1,
-0.3262451, 0.3439376, -0.4857574, 0, 1, 0.2784314, 1,
-0.3261358, 0.9795073, -0.7581431, 0, 1, 0.2862745, 1,
-0.3224104, 0.9589509, 0.1068507, 0, 1, 0.2901961, 1,
-0.3212198, 0.03703202, -0.5662504, 0, 1, 0.2980392, 1,
-0.3183735, -1.715353, -3.638932, 0, 1, 0.3058824, 1,
-0.3164831, -0.779824, -1.856323, 0, 1, 0.3098039, 1,
-0.3125055, 0.4404782, -1.873465, 0, 1, 0.3176471, 1,
-0.3118806, 1.03416, -1.560389, 0, 1, 0.3215686, 1,
-0.3078733, -0.06974639, -2.656706, 0, 1, 0.3294118, 1,
-0.3047381, 1.152186, -0.0812356, 0, 1, 0.3333333, 1,
-0.3030659, -0.3840098, -2.858675, 0, 1, 0.3411765, 1,
-0.2970099, -0.03196818, -0.6400805, 0, 1, 0.345098, 1,
-0.2967629, -0.6521343, -3.779947, 0, 1, 0.3529412, 1,
-0.2959134, 1.999085, 1.847972, 0, 1, 0.3568628, 1,
-0.2953266, -0.2646372, -2.712668, 0, 1, 0.3647059, 1,
-0.2928844, 0.8127614, -0.4919008, 0, 1, 0.3686275, 1,
-0.2900907, -0.6096368, -3.161557, 0, 1, 0.3764706, 1,
-0.2884397, -0.7006677, -3.718127, 0, 1, 0.3803922, 1,
-0.287808, 0.5646282, 0.2535827, 0, 1, 0.3882353, 1,
-0.2875556, -1.320694, -2.717202, 0, 1, 0.3921569, 1,
-0.2872527, 1.778364, 0.5391889, 0, 1, 0.4, 1,
-0.2868447, -1.630894, -1.990987, 0, 1, 0.4078431, 1,
-0.2841142, -0.6182812, -2.338364, 0, 1, 0.4117647, 1,
-0.2828776, 0.03820214, 0.05982704, 0, 1, 0.4196078, 1,
-0.2795231, -0.1926609, -2.503764, 0, 1, 0.4235294, 1,
-0.2765369, 1.026931, 0.07847184, 0, 1, 0.4313726, 1,
-0.2730744, 0.01200671, -0.5828626, 0, 1, 0.4352941, 1,
-0.2718897, -0.6078993, -3.615198, 0, 1, 0.4431373, 1,
-0.2691337, -0.6481321, -3.312811, 0, 1, 0.4470588, 1,
-0.2671213, 0.4411462, 0.624681, 0, 1, 0.454902, 1,
-0.2620896, 1.188124, -1.891087, 0, 1, 0.4588235, 1,
-0.2590917, 0.02823709, -2.412985, 0, 1, 0.4666667, 1,
-0.2575524, 0.7387711, -1.745856, 0, 1, 0.4705882, 1,
-0.2556135, 1.341184, -0.08338963, 0, 1, 0.4784314, 1,
-0.2490806, 0.4871202, -1.687142, 0, 1, 0.4823529, 1,
-0.245964, 0.9005173, 0.7408876, 0, 1, 0.4901961, 1,
-0.2442611, -0.2987749, -2.203944, 0, 1, 0.4941176, 1,
-0.2416274, -0.1177282, -1.269602, 0, 1, 0.5019608, 1,
-0.2362579, -0.7820343, -2.870085, 0, 1, 0.509804, 1,
-0.2306444, 0.7908032, -0.6245353, 0, 1, 0.5137255, 1,
-0.229237, -0.862681, -0.6909607, 0, 1, 0.5215687, 1,
-0.2225024, -0.6631287, -1.471029, 0, 1, 0.5254902, 1,
-0.2195858, -0.5116575, -4.220544, 0, 1, 0.5333334, 1,
-0.210858, -0.7530371, -4.103253, 0, 1, 0.5372549, 1,
-0.2104661, -0.482646, -0.7955294, 0, 1, 0.5450981, 1,
-0.2070359, -0.224144, -1.388949, 0, 1, 0.5490196, 1,
-0.2067554, 0.001725397, -0.6592085, 0, 1, 0.5568628, 1,
-0.2065109, 0.7087389, -1.991247, 0, 1, 0.5607843, 1,
-0.2063543, 0.7749643, 0.1213597, 0, 1, 0.5686275, 1,
-0.2026492, -0.5172481, -2.601989, 0, 1, 0.572549, 1,
-0.2002876, 0.1755815, -1.133742, 0, 1, 0.5803922, 1,
-0.2000087, 0.4811634, -0.4209078, 0, 1, 0.5843138, 1,
-0.1985083, -0.7852538, -3.4026, 0, 1, 0.5921569, 1,
-0.1960565, -1.046534, -1.755409, 0, 1, 0.5960785, 1,
-0.1953006, -0.9304436, -1.978161, 0, 1, 0.6039216, 1,
-0.1942892, 0.8835818, 0.1867037, 0, 1, 0.6117647, 1,
-0.1935737, -0.8619336, -2.262404, 0, 1, 0.6156863, 1,
-0.1923495, 1.155617, 2.079826, 0, 1, 0.6235294, 1,
-0.191882, -1.270163, -2.191033, 0, 1, 0.627451, 1,
-0.1867985, -0.6854679, -1.76804, 0, 1, 0.6352941, 1,
-0.1840447, 1.772435, -0.8815441, 0, 1, 0.6392157, 1,
-0.1777089, -0.0487359, -0.5662313, 0, 1, 0.6470588, 1,
-0.1756399, -0.652061, -3.322688, 0, 1, 0.6509804, 1,
-0.1753383, 0.590359, 0.4502314, 0, 1, 0.6588235, 1,
-0.1713526, -0.4918532, -3.020563, 0, 1, 0.6627451, 1,
-0.1623789, 0.6210943, 0.8180376, 0, 1, 0.6705883, 1,
-0.1613045, 0.1859467, -0.1866838, 0, 1, 0.6745098, 1,
-0.1539469, -2.37618, -4.348728, 0, 1, 0.682353, 1,
-0.1511903, -0.2393164, -4.624171, 0, 1, 0.6862745, 1,
-0.1449817, 3.103013, -0.5137485, 0, 1, 0.6941177, 1,
-0.1449535, -0.9829592, -4.426585, 0, 1, 0.7019608, 1,
-0.1412949, -1.262895, -3.186678, 0, 1, 0.7058824, 1,
-0.1397668, -0.4548207, -1.749388, 0, 1, 0.7137255, 1,
-0.1371566, -0.5309309, -2.378181, 0, 1, 0.7176471, 1,
-0.1359504, -2.598511, -3.367574, 0, 1, 0.7254902, 1,
-0.1322264, 0.2212391, -1.378382, 0, 1, 0.7294118, 1,
-0.1309614, 0.9441039, 0.8902106, 0, 1, 0.7372549, 1,
-0.1298983, -0.3396477, -1.403712, 0, 1, 0.7411765, 1,
-0.1249238, 1.535405, 0.9333861, 0, 1, 0.7490196, 1,
-0.1230745, -0.4063627, -2.736485, 0, 1, 0.7529412, 1,
-0.1227698, 0.3777134, -0.3049425, 0, 1, 0.7607843, 1,
-0.1227538, 0.158568, -0.6319509, 0, 1, 0.7647059, 1,
-0.1220445, -1.08759, -3.820361, 0, 1, 0.772549, 1,
-0.120072, -1.237442, -3.231356, 0, 1, 0.7764706, 1,
-0.1195382, 0.4008121, -1.455878, 0, 1, 0.7843137, 1,
-0.1148072, 0.4439953, 1.733432, 0, 1, 0.7882353, 1,
-0.1140782, -0.7267169, -3.345181, 0, 1, 0.7960784, 1,
-0.1108804, -0.1026234, -2.853014, 0, 1, 0.8039216, 1,
-0.1106947, 1.21097, 0.7409431, 0, 1, 0.8078431, 1,
-0.1090605, 0.9137886, 0.03561499, 0, 1, 0.8156863, 1,
-0.1066658, -0.5549691, -2.099361, 0, 1, 0.8196079, 1,
-0.09431405, 1.368602, 0.2251716, 0, 1, 0.827451, 1,
-0.09007826, 0.6317474, -1.719535, 0, 1, 0.8313726, 1,
-0.084046, -0.3027268, -2.160506, 0, 1, 0.8392157, 1,
-0.0829305, -1.245402, -1.611509, 0, 1, 0.8431373, 1,
-0.07857988, -0.9402617, -1.778004, 0, 1, 0.8509804, 1,
-0.07816777, -0.08148476, -1.444589, 0, 1, 0.854902, 1,
-0.07536433, 1.00422, 0.1013951, 0, 1, 0.8627451, 1,
-0.07402604, 0.05242841, 0.3471955, 0, 1, 0.8666667, 1,
-0.07396943, -0.2575789, -2.14304, 0, 1, 0.8745098, 1,
-0.07373735, 1.334155, -0.5202035, 0, 1, 0.8784314, 1,
-0.07351019, -1.263366, -2.83374, 0, 1, 0.8862745, 1,
-0.07309731, 0.3046196, -0.5207484, 0, 1, 0.8901961, 1,
-0.07063742, -0.5839058, -4.999875, 0, 1, 0.8980392, 1,
-0.06101519, -0.4694406, -2.490215, 0, 1, 0.9058824, 1,
-0.05919517, 0.8888918, -0.7285658, 0, 1, 0.9098039, 1,
-0.05872778, -1.767567, -2.470963, 0, 1, 0.9176471, 1,
-0.05607505, 2.291366, 0.7500059, 0, 1, 0.9215686, 1,
-0.0559915, -1.841705, -4.184525, 0, 1, 0.9294118, 1,
-0.05567305, 0.1166923, 0.7161039, 0, 1, 0.9333333, 1,
-0.05019617, -0.0218617, -1.390247, 0, 1, 0.9411765, 1,
-0.0478332, -1.958415, -3.695451, 0, 1, 0.945098, 1,
-0.04491782, 1.619533, -1.438671, 0, 1, 0.9529412, 1,
-0.04184441, -0.3061721, -2.513111, 0, 1, 0.9568627, 1,
-0.0397833, -0.6289781, -3.726889, 0, 1, 0.9647059, 1,
-0.03845064, 0.5613046, 0.1468008, 0, 1, 0.9686275, 1,
-0.03239228, -1.051496, -3.45249, 0, 1, 0.9764706, 1,
-0.02840286, 0.5839449, 0.2069071, 0, 1, 0.9803922, 1,
-0.02757124, -0.4299951, -2.983081, 0, 1, 0.9882353, 1,
-0.02712247, -1.599933, -3.40066, 0, 1, 0.9921569, 1,
-0.02619548, -0.4797209, -1.535095, 0, 1, 1, 1,
-0.02593197, -0.80365, -2.741856, 0, 0.9921569, 1, 1,
-0.02375982, 0.5768485, 0.2229438, 0, 0.9882353, 1, 1,
-0.02196624, -1.78688, -3.000856, 0, 0.9803922, 1, 1,
-0.02108845, 1.139675, -1.399928, 0, 0.9764706, 1, 1,
-0.01227591, -1.516865, -2.165134, 0, 0.9686275, 1, 1,
-0.005098581, 0.5838244, -0.3085319, 0, 0.9647059, 1, 1,
-0.002820742, 2.414044, -0.4269896, 0, 0.9568627, 1, 1,
-0.001770392, -1.365138, -2.409266, 0, 0.9529412, 1, 1,
-0.001298164, -0.2697732, -3.375182, 0, 0.945098, 1, 1,
-0.001269097, 0.2791647, 0.864808, 0, 0.9411765, 1, 1,
9.042031e-05, -0.03638598, 3.043266, 0, 0.9333333, 1, 1,
0.0006016886, 0.2883933, -0.5740202, 0, 0.9294118, 1, 1,
0.001545292, -0.4259598, 4.516523, 0, 0.9215686, 1, 1,
0.007428808, 0.1241893, 1.526079, 0, 0.9176471, 1, 1,
0.009312055, -1.004493, 3.690593, 0, 0.9098039, 1, 1,
0.01171621, -1.550608, 3.183987, 0, 0.9058824, 1, 1,
0.01233512, 0.8968929, 0.3949674, 0, 0.8980392, 1, 1,
0.01749628, 0.2849876, 0.9263633, 0, 0.8901961, 1, 1,
0.0186588, 0.8960386, -1.194577, 0, 0.8862745, 1, 1,
0.02072075, -0.6911664, 3.398985, 0, 0.8784314, 1, 1,
0.0207977, 0.4206009, 0.7959463, 0, 0.8745098, 1, 1,
0.02361676, 1.118495, 1.906676, 0, 0.8666667, 1, 1,
0.02385884, -1.105854, 4.511792, 0, 0.8627451, 1, 1,
0.02628702, -0.2200684, 2.735667, 0, 0.854902, 1, 1,
0.02704765, -0.04428865, 2.850353, 0, 0.8509804, 1, 1,
0.02808459, -0.6624805, 2.859469, 0, 0.8431373, 1, 1,
0.03064025, 1.332408, 0.1125935, 0, 0.8392157, 1, 1,
0.03732475, 0.5426711, -1.460172, 0, 0.8313726, 1, 1,
0.04012272, 0.8902721, -0.1980295, 0, 0.827451, 1, 1,
0.04404795, 0.01275664, 2.051242, 0, 0.8196079, 1, 1,
0.05008297, -0.007962052, 1.793754, 0, 0.8156863, 1, 1,
0.05679365, 1.999168, -1.277143, 0, 0.8078431, 1, 1,
0.05751214, 0.3717805, 0.5271831, 0, 0.8039216, 1, 1,
0.0580468, -0.6190156, 3.465573, 0, 0.7960784, 1, 1,
0.0600744, -0.1180196, 2.430547, 0, 0.7882353, 1, 1,
0.06062018, -0.2360301, 3.100291, 0, 0.7843137, 1, 1,
0.0635078, 0.4478769, -0.4489277, 0, 0.7764706, 1, 1,
0.06357394, -1.646795, 5.876174, 0, 0.772549, 1, 1,
0.06467024, -0.2068204, 1.050215, 0, 0.7647059, 1, 1,
0.06538154, -0.4978029, 3.020624, 0, 0.7607843, 1, 1,
0.0657958, 0.5318833, -0.1934038, 0, 0.7529412, 1, 1,
0.07067388, -1.696703, 2.924673, 0, 0.7490196, 1, 1,
0.07508606, -0.9081588, 3.544212, 0, 0.7411765, 1, 1,
0.07864086, -0.3380954, 1.740229, 0, 0.7372549, 1, 1,
0.08062746, 0.5026039, -0.2613246, 0, 0.7294118, 1, 1,
0.08239105, 0.1635702, 1.020118, 0, 0.7254902, 1, 1,
0.08517816, -1.659405, 2.3795, 0, 0.7176471, 1, 1,
0.08527292, 0.2249972, -0.5754363, 0, 0.7137255, 1, 1,
0.08558629, 1.316464, -0.1404389, 0, 0.7058824, 1, 1,
0.08579874, -2.112393, 3.531959, 0, 0.6980392, 1, 1,
0.08589403, 0.04980942, 4.046424, 0, 0.6941177, 1, 1,
0.09347942, 0.1414944, 0.8107391, 0, 0.6862745, 1, 1,
0.09591056, 1.041578, 1.557035, 0, 0.682353, 1, 1,
0.1009161, 0.4660451, -2.394726, 0, 0.6745098, 1, 1,
0.101713, -0.236461, 3.440366, 0, 0.6705883, 1, 1,
0.1058259, -1.36956, 4.223975, 0, 0.6627451, 1, 1,
0.1060345, 0.8217822, -0.6837735, 0, 0.6588235, 1, 1,
0.1070983, 0.5755412, 0.6804818, 0, 0.6509804, 1, 1,
0.1075041, -0.7520743, 4.279808, 0, 0.6470588, 1, 1,
0.1115346, -0.2538773, 1.466923, 0, 0.6392157, 1, 1,
0.1119271, 0.6963358, 0.4066006, 0, 0.6352941, 1, 1,
0.1214867, -1.051854, 4.796193, 0, 0.627451, 1, 1,
0.1227565, 0.362974, 0.5346407, 0, 0.6235294, 1, 1,
0.1233995, 0.2066826, -0.7930071, 0, 0.6156863, 1, 1,
0.1241177, 0.09566289, 1.191209, 0, 0.6117647, 1, 1,
0.1254057, -0.335653, 1.980603, 0, 0.6039216, 1, 1,
0.1276386, 0.6744145, 1.03211, 0, 0.5960785, 1, 1,
0.1293922, 1.658876, 0.7726837, 0, 0.5921569, 1, 1,
0.1369028, 0.8071482, -1.344903, 0, 0.5843138, 1, 1,
0.1402184, -0.587873, 5.13518, 0, 0.5803922, 1, 1,
0.1448115, 0.1787763, -0.5039183, 0, 0.572549, 1, 1,
0.1488202, -1.585866, 2.296177, 0, 0.5686275, 1, 1,
0.1491178, -1.103423, 2.49385, 0, 0.5607843, 1, 1,
0.1520015, -0.2392722, 1.966562, 0, 0.5568628, 1, 1,
0.1527127, -0.6545195, 4.47843, 0, 0.5490196, 1, 1,
0.1532988, 1.234101, 0.4349216, 0, 0.5450981, 1, 1,
0.1556262, -1.277512, 0.699378, 0, 0.5372549, 1, 1,
0.1572027, 0.7331141, 1.097222, 0, 0.5333334, 1, 1,
0.1620811, 1.178638, 0.9043776, 0, 0.5254902, 1, 1,
0.1628885, 0.4886226, 0.6126081, 0, 0.5215687, 1, 1,
0.1666736, -1.088149, 1.896769, 0, 0.5137255, 1, 1,
0.1681953, 1.395139, 0.1421706, 0, 0.509804, 1, 1,
0.1729805, -1.393989, 2.780708, 0, 0.5019608, 1, 1,
0.1749295, 0.9366536, 0.9160239, 0, 0.4941176, 1, 1,
0.182387, 0.5394698, 1.257323, 0, 0.4901961, 1, 1,
0.1826554, -0.3518458, 1.745862, 0, 0.4823529, 1, 1,
0.1860039, 0.6746394, 0.5158828, 0, 0.4784314, 1, 1,
0.1869334, -0.7053681, 3.944429, 0, 0.4705882, 1, 1,
0.1880085, 0.6266253, 1.005399, 0, 0.4666667, 1, 1,
0.1927457, 0.6161677, -0.5614905, 0, 0.4588235, 1, 1,
0.1930017, 0.4475732, -0.1622269, 0, 0.454902, 1, 1,
0.1954786, 1.831556, -1.376345, 0, 0.4470588, 1, 1,
0.1973929, 1.016359, -0.63966, 0, 0.4431373, 1, 1,
0.1984209, -1.318591, 3.357745, 0, 0.4352941, 1, 1,
0.2024323, 1.196102, -1.41305, 0, 0.4313726, 1, 1,
0.2032702, 0.4607773, 0.9900162, 0, 0.4235294, 1, 1,
0.2037367, -0.6198682, 3.187867, 0, 0.4196078, 1, 1,
0.2067976, 1.082286, 0.8325047, 0, 0.4117647, 1, 1,
0.2088119, -1.041603, 2.863234, 0, 0.4078431, 1, 1,
0.209791, 1.130105, -0.974644, 0, 0.4, 1, 1,
0.2099179, 0.7259817, -0.736865, 0, 0.3921569, 1, 1,
0.2153692, 1.381275, -0.6366181, 0, 0.3882353, 1, 1,
0.2154049, 1.246022, 1.054986, 0, 0.3803922, 1, 1,
0.219544, 1.628445, -0.04671064, 0, 0.3764706, 1, 1,
0.2218034, -0.09911177, 1.280174, 0, 0.3686275, 1, 1,
0.2256075, -0.2422361, 0.4774108, 0, 0.3647059, 1, 1,
0.2266577, -0.7987219, 3.532433, 0, 0.3568628, 1, 1,
0.2281034, 0.5648794, -1.092183, 0, 0.3529412, 1, 1,
0.2286336, 0.6850803, -0.7722207, 0, 0.345098, 1, 1,
0.2331693, 0.2253308, 0.9518327, 0, 0.3411765, 1, 1,
0.2332931, 1.15159, -0.01916426, 0, 0.3333333, 1, 1,
0.2356042, 0.03371131, 1.501528, 0, 0.3294118, 1, 1,
0.2420789, 0.7474445, 0.5518144, 0, 0.3215686, 1, 1,
0.2451451, 0.1804679, 1.664347, 0, 0.3176471, 1, 1,
0.2509303, -0.8726122, 2.957989, 0, 0.3098039, 1, 1,
0.2562458, -1.203659, 1.449415, 0, 0.3058824, 1, 1,
0.2643079, -1.544738, 2.045245, 0, 0.2980392, 1, 1,
0.2699669, -0.6506379, 3.081661, 0, 0.2901961, 1, 1,
0.2712595, 0.1538028, 2.137464, 0, 0.2862745, 1, 1,
0.2720502, -0.02396551, 1.278062, 0, 0.2784314, 1, 1,
0.2729324, -0.9450397, 2.764696, 0, 0.2745098, 1, 1,
0.2738929, 1.657164, 1.297949, 0, 0.2666667, 1, 1,
0.2801408, 1.153776, -0.6367395, 0, 0.2627451, 1, 1,
0.2820177, 0.07258922, 0.7060946, 0, 0.254902, 1, 1,
0.2823354, 0.8112673, 0.2091826, 0, 0.2509804, 1, 1,
0.2831111, 0.4982023, 0.3059165, 0, 0.2431373, 1, 1,
0.2848504, -0.7001085, 0.4573323, 0, 0.2392157, 1, 1,
0.2865969, -0.08305204, 0.975045, 0, 0.2313726, 1, 1,
0.2884332, -1.018335, 3.426374, 0, 0.227451, 1, 1,
0.2915951, 0.7596617, 0.6074326, 0, 0.2196078, 1, 1,
0.2950358, 0.4403367, -0.5967955, 0, 0.2156863, 1, 1,
0.295252, 0.7071013, 0.1979503, 0, 0.2078431, 1, 1,
0.29769, -0.6495821, 2.427002, 0, 0.2039216, 1, 1,
0.2985445, -1.217136, 4.747611, 0, 0.1960784, 1, 1,
0.3025811, 0.7240142, 1.31619, 0, 0.1882353, 1, 1,
0.3066453, 0.4650791, 0.2119486, 0, 0.1843137, 1, 1,
0.3135665, -1.019264, 3.660053, 0, 0.1764706, 1, 1,
0.3146028, -0.08886319, 1.448724, 0, 0.172549, 1, 1,
0.3254153, -0.03509841, 0.7995878, 0, 0.1647059, 1, 1,
0.3261903, -0.7245407, 3.043741, 0, 0.1607843, 1, 1,
0.3345152, -0.7004467, 3.757562, 0, 0.1529412, 1, 1,
0.3374758, 1.252977, -0.7019019, 0, 0.1490196, 1, 1,
0.338271, 0.6997378, 0.4840733, 0, 0.1411765, 1, 1,
0.3383097, -1.225347, 4.016423, 0, 0.1372549, 1, 1,
0.338996, -0.4310547, 1.127077, 0, 0.1294118, 1, 1,
0.3405615, -2.277045, 2.767558, 0, 0.1254902, 1, 1,
0.3430623, -0.7340466, 2.596551, 0, 0.1176471, 1, 1,
0.3452838, 1.419972, 1.600285, 0, 0.1137255, 1, 1,
0.349328, 0.002363232, 1.127762, 0, 0.1058824, 1, 1,
0.3515593, 1.188928, -0.01676082, 0, 0.09803922, 1, 1,
0.3518911, -0.5554097, 3.41708, 0, 0.09411765, 1, 1,
0.3527856, -0.7756917, 3.980484, 0, 0.08627451, 1, 1,
0.3585154, -1.062007, 1.385728, 0, 0.08235294, 1, 1,
0.3613805, 0.1065482, 1.928202, 0, 0.07450981, 1, 1,
0.3619292, -0.01577656, 2.362677, 0, 0.07058824, 1, 1,
0.3624316, 1.007169, 0.2131718, 0, 0.0627451, 1, 1,
0.3631669, -0.9830031, 2.747463, 0, 0.05882353, 1, 1,
0.364923, -1.167077, 4.361668, 0, 0.05098039, 1, 1,
0.3671438, 0.03158409, 0.6887775, 0, 0.04705882, 1, 1,
0.3735538, -0.8809025, 1.136776, 0, 0.03921569, 1, 1,
0.3755663, -0.5670605, 2.25009, 0, 0.03529412, 1, 1,
0.3798142, -0.3040359, 3.46023, 0, 0.02745098, 1, 1,
0.3814981, -0.02177101, 2.224051, 0, 0.02352941, 1, 1,
0.3825982, 0.3427038, 0.6608965, 0, 0.01568628, 1, 1,
0.3913738, 0.4036501, 1.089708, 0, 0.01176471, 1, 1,
0.3947956, 0.1443079, 0.8729105, 0, 0.003921569, 1, 1,
0.4005513, 0.5430737, -0.3615185, 0.003921569, 0, 1, 1,
0.4085544, -1.145682, 4.325199, 0.007843138, 0, 1, 1,
0.4103278, -0.3660212, 3.533752, 0.01568628, 0, 1, 1,
0.4104002, -1.406514, 2.167239, 0.01960784, 0, 1, 1,
0.4114475, -0.6557817, 2.338399, 0.02745098, 0, 1, 1,
0.4117498, 1.348685, 2.000253, 0.03137255, 0, 1, 1,
0.4146039, -1.864549, 2.361952, 0.03921569, 0, 1, 1,
0.4163323, 1.499132, 0.9446005, 0.04313726, 0, 1, 1,
0.41871, -0.04385898, 0.546214, 0.05098039, 0, 1, 1,
0.4225562, 0.7381371, 0.9687443, 0.05490196, 0, 1, 1,
0.4244284, 0.4230196, -0.1890709, 0.0627451, 0, 1, 1,
0.4310645, -0.5826319, 0.7671512, 0.06666667, 0, 1, 1,
0.4328697, -1.322709, 2.848845, 0.07450981, 0, 1, 1,
0.4336025, 0.0275057, 1.014598, 0.07843138, 0, 1, 1,
0.4350653, 1.089666, 0.8764604, 0.08627451, 0, 1, 1,
0.4356981, -0.3693903, 3.581469, 0.09019608, 0, 1, 1,
0.4367556, 0.297451, 1.308071, 0.09803922, 0, 1, 1,
0.4372248, -0.7511672, 3.273829, 0.1058824, 0, 1, 1,
0.4409608, -1.488384, 3.53853, 0.1098039, 0, 1, 1,
0.4410997, 0.7246195, 3.534547, 0.1176471, 0, 1, 1,
0.4511659, 0.734925, -1.403206, 0.1215686, 0, 1, 1,
0.4516936, -0.2820148, 1.776246, 0.1294118, 0, 1, 1,
0.4580507, -0.8783006, 3.065854, 0.1333333, 0, 1, 1,
0.4583791, 0.6563139, 2.164204, 0.1411765, 0, 1, 1,
0.4588351, 0.6392791, -0.2147704, 0.145098, 0, 1, 1,
0.4588822, 0.8967621, -0.4099275, 0.1529412, 0, 1, 1,
0.4601952, 0.06542139, 1.634587, 0.1568628, 0, 1, 1,
0.463732, -1.10381, 4.891791, 0.1647059, 0, 1, 1,
0.4680746, -0.1858649, 1.534472, 0.1686275, 0, 1, 1,
0.4730603, -0.4096329, 1.192338, 0.1764706, 0, 1, 1,
0.4754393, 0.752064, 2.182216, 0.1803922, 0, 1, 1,
0.4759622, 0.3702456, 2.419605, 0.1882353, 0, 1, 1,
0.4781926, 1.033249, -0.1694047, 0.1921569, 0, 1, 1,
0.4811043, 0.2948161, 0.4888999, 0.2, 0, 1, 1,
0.4818259, -0.7719043, 2.282338, 0.2078431, 0, 1, 1,
0.4884474, -0.2204288, 0.4576876, 0.2117647, 0, 1, 1,
0.4912292, 0.2675298, 1.690932, 0.2196078, 0, 1, 1,
0.4930994, -1.57415, 2.413009, 0.2235294, 0, 1, 1,
0.4940228, 3.253944, 0.724605, 0.2313726, 0, 1, 1,
0.5050315, -0.3211973, 1.441102, 0.2352941, 0, 1, 1,
0.5068104, -0.6284806, 2.097924, 0.2431373, 0, 1, 1,
0.5093397, 0.8272659, 2.143208, 0.2470588, 0, 1, 1,
0.517453, -1.82573, 3.821137, 0.254902, 0, 1, 1,
0.5193087, 0.4795815, 1.207157, 0.2588235, 0, 1, 1,
0.5205064, -0.3569539, 0.2070872, 0.2666667, 0, 1, 1,
0.5257622, 1.513041, -0.4074604, 0.2705882, 0, 1, 1,
0.5273696, 0.7714379, 0.9078, 0.2784314, 0, 1, 1,
0.5314923, 1.98092, -0.08915681, 0.282353, 0, 1, 1,
0.534016, -0.8837495, 3.03889, 0.2901961, 0, 1, 1,
0.5374216, 0.6140399, 1.040208, 0.2941177, 0, 1, 1,
0.5374956, -1.088893, 1.982164, 0.3019608, 0, 1, 1,
0.5412002, 0.5132248, 0.9838372, 0.3098039, 0, 1, 1,
0.5469773, 0.6766126, -0.6535301, 0.3137255, 0, 1, 1,
0.5547161, 0.290506, 0.6695357, 0.3215686, 0, 1, 1,
0.5580691, -0.1345791, 0.7606971, 0.3254902, 0, 1, 1,
0.5645429, -2.011511, 3.236096, 0.3333333, 0, 1, 1,
0.5666353, -0.4321363, 1.270079, 0.3372549, 0, 1, 1,
0.5689004, 0.4505118, 1.505897, 0.345098, 0, 1, 1,
0.5691199, -0.5171482, 5.444547, 0.3490196, 0, 1, 1,
0.5698766, 0.8031417, 1.91735, 0.3568628, 0, 1, 1,
0.5714034, -1.280224, 2.862516, 0.3607843, 0, 1, 1,
0.5770779, 0.07978924, 2.927968, 0.3686275, 0, 1, 1,
0.5813262, 1.783863, -0.5996087, 0.372549, 0, 1, 1,
0.5825936, 0.4943392, 1.156953, 0.3803922, 0, 1, 1,
0.5960174, 1.417968, 0.8253561, 0.3843137, 0, 1, 1,
0.5971494, -1.960851, 1.587073, 0.3921569, 0, 1, 1,
0.6024708, 0.3322614, -1.336197, 0.3960784, 0, 1, 1,
0.6150877, -0.8506997, 1.142298, 0.4039216, 0, 1, 1,
0.6152645, 0.227375, 2.607321, 0.4117647, 0, 1, 1,
0.615343, 0.7723391, 1.329022, 0.4156863, 0, 1, 1,
0.6156209, 2.379738, 0.547412, 0.4235294, 0, 1, 1,
0.6172985, -0.009844351, 2.282744, 0.427451, 0, 1, 1,
0.6201505, -0.728328, 3.949394, 0.4352941, 0, 1, 1,
0.6299397, 1.936482, -1.768405, 0.4392157, 0, 1, 1,
0.6336582, -1.751153, 1.821633, 0.4470588, 0, 1, 1,
0.6346559, 0.9437208, -0.4397063, 0.4509804, 0, 1, 1,
0.6362096, -1.376913, 2.855648, 0.4588235, 0, 1, 1,
0.6381335, -0.6675616, 1.960682, 0.4627451, 0, 1, 1,
0.6385316, -0.03884322, 0.3094669, 0.4705882, 0, 1, 1,
0.6391716, -0.7510519, 2.688612, 0.4745098, 0, 1, 1,
0.6434819, -1.175176, 0.9573076, 0.4823529, 0, 1, 1,
0.6462327, 0.9563306, 0.9551911, 0.4862745, 0, 1, 1,
0.6479174, -1.170667, 2.724787, 0.4941176, 0, 1, 1,
0.6482644, 2.988816, -1.394071, 0.5019608, 0, 1, 1,
0.6567302, 0.6696003, 1.233683, 0.5058824, 0, 1, 1,
0.6570986, -0.4075525, 2.322311, 0.5137255, 0, 1, 1,
0.6607348, -0.1768839, 4.697622, 0.5176471, 0, 1, 1,
0.6676405, -1.013413, 1.649806, 0.5254902, 0, 1, 1,
0.672172, 0.9724877, 0.390402, 0.5294118, 0, 1, 1,
0.6765818, 0.5156242, -0.07633761, 0.5372549, 0, 1, 1,
0.6790243, -0.2028394, 2.846924, 0.5411765, 0, 1, 1,
0.680909, 0.4389132, 1.803055, 0.5490196, 0, 1, 1,
0.6814865, -0.1820869, 2.623618, 0.5529412, 0, 1, 1,
0.695256, 0.8692891, -0.121637, 0.5607843, 0, 1, 1,
0.6952701, -0.4834725, 1.21031, 0.5647059, 0, 1, 1,
0.6966638, 0.4435756, 1.957346, 0.572549, 0, 1, 1,
0.7040719, -0.9991645, 2.034594, 0.5764706, 0, 1, 1,
0.7063936, 1.294193, -0.4585438, 0.5843138, 0, 1, 1,
0.7090636, -0.6461456, 2.401936, 0.5882353, 0, 1, 1,
0.7128125, -0.3943028, 1.272057, 0.5960785, 0, 1, 1,
0.7182306, -1.024101, 3.412194, 0.6039216, 0, 1, 1,
0.718399, 0.7129897, -0.2898593, 0.6078432, 0, 1, 1,
0.7188609, 0.2693401, 1.54039, 0.6156863, 0, 1, 1,
0.7190009, -1.731647, 2.264588, 0.6196079, 0, 1, 1,
0.7202075, 0.2307971, -0.3993417, 0.627451, 0, 1, 1,
0.7234236, -1.546858, 2.95561, 0.6313726, 0, 1, 1,
0.7260799, -1.547603, 2.048999, 0.6392157, 0, 1, 1,
0.7280085, -0.3646374, 2.727183, 0.6431373, 0, 1, 1,
0.7291342, 0.390922, 2.32864, 0.6509804, 0, 1, 1,
0.7312986, 1.786743, -0.5953331, 0.654902, 0, 1, 1,
0.7337863, 0.7767889, 0.9920703, 0.6627451, 0, 1, 1,
0.7346798, -0.3432983, 2.496725, 0.6666667, 0, 1, 1,
0.7352665, 0.4376534, 1.68644, 0.6745098, 0, 1, 1,
0.7365621, -0.8167232, 1.306419, 0.6784314, 0, 1, 1,
0.7419461, -0.2338449, 1.155843, 0.6862745, 0, 1, 1,
0.7429492, -1.314793, 1.865649, 0.6901961, 0, 1, 1,
0.7446862, -1.463139, 3.525005, 0.6980392, 0, 1, 1,
0.7457286, -1.197914, 0.8166896, 0.7058824, 0, 1, 1,
0.7495811, 0.2616231, 1.664712, 0.7098039, 0, 1, 1,
0.761104, 0.5100703, 0.8371919, 0.7176471, 0, 1, 1,
0.7674802, -0.1297966, 2.203449, 0.7215686, 0, 1, 1,
0.7723647, -0.4207601, 0.5290935, 0.7294118, 0, 1, 1,
0.7728249, -0.5863562, 2.395327, 0.7333333, 0, 1, 1,
0.7827823, -0.6543527, 1.816592, 0.7411765, 0, 1, 1,
0.7886001, 1.688922, -0.6315537, 0.7450981, 0, 1, 1,
0.7898918, -0.5998428, 1.813681, 0.7529412, 0, 1, 1,
0.7922696, -0.5369021, 3.25354, 0.7568628, 0, 1, 1,
0.7926984, -1.542516, 1.342368, 0.7647059, 0, 1, 1,
0.7935681, -1.246461, 2.120109, 0.7686275, 0, 1, 1,
0.7959482, 0.6730068, -0.5883382, 0.7764706, 0, 1, 1,
0.7980049, -1.226022, 3.090748, 0.7803922, 0, 1, 1,
0.7992062, -0.922249, 3.93005, 0.7882353, 0, 1, 1,
0.8004053, -0.4822223, 0.6228862, 0.7921569, 0, 1, 1,
0.8041556, 0.01009701, 1.081705, 0.8, 0, 1, 1,
0.8067591, -1.568086, 2.685404, 0.8078431, 0, 1, 1,
0.8069293, -0.1518436, 1.267813, 0.8117647, 0, 1, 1,
0.8071836, -0.3432514, 1.758178, 0.8196079, 0, 1, 1,
0.8079169, 0.3848995, 0.5849854, 0.8235294, 0, 1, 1,
0.8082737, 1.37356, -0.5993808, 0.8313726, 0, 1, 1,
0.8084176, 1.510233, 1.265306, 0.8352941, 0, 1, 1,
0.8129515, -1.560508, 1.666583, 0.8431373, 0, 1, 1,
0.8151292, 0.2075875, 1.451194, 0.8470588, 0, 1, 1,
0.8151757, 2.046816, 2.371494, 0.854902, 0, 1, 1,
0.8152004, -1.325541, 3.009877, 0.8588235, 0, 1, 1,
0.8152462, -1.027653, 2.070977, 0.8666667, 0, 1, 1,
0.8154245, 0.1899613, 0.5525368, 0.8705882, 0, 1, 1,
0.8156908, -0.9559402, 1.011358, 0.8784314, 0, 1, 1,
0.8187612, 0.9884808, 0.3848366, 0.8823529, 0, 1, 1,
0.8332126, -0.358086, 1.316213, 0.8901961, 0, 1, 1,
0.8518137, -0.8907771, 1.183171, 0.8941177, 0, 1, 1,
0.8672039, 0.244603, 0.1637097, 0.9019608, 0, 1, 1,
0.8747909, -1.080006, 2.220009, 0.9098039, 0, 1, 1,
0.8786972, -0.4945276, 1.85374, 0.9137255, 0, 1, 1,
0.8808991, -0.7251413, 1.914204, 0.9215686, 0, 1, 1,
0.8845615, -0.8828555, 2.107013, 0.9254902, 0, 1, 1,
0.8864027, -0.4739839, 1.843459, 0.9333333, 0, 1, 1,
0.8891143, 2.270388, 2.587503, 0.9372549, 0, 1, 1,
0.8891648, -0.3303564, 0.9535553, 0.945098, 0, 1, 1,
0.8902863, -0.9900932, 2.509399, 0.9490196, 0, 1, 1,
0.8907981, -0.2643997, 0.9593667, 0.9568627, 0, 1, 1,
0.8909723, 0.9872898, -1.538093, 0.9607843, 0, 1, 1,
0.898274, -0.006664315, 3.731214, 0.9686275, 0, 1, 1,
0.9015755, 2.220613, 1.571594, 0.972549, 0, 1, 1,
0.9092106, -1.609739, 2.26166, 0.9803922, 0, 1, 1,
0.9103479, 0.006820615, 1.641562, 0.9843137, 0, 1, 1,
0.9139603, -0.5680557, 1.013692, 0.9921569, 0, 1, 1,
0.916341, -1.505002, 1.781786, 0.9960784, 0, 1, 1,
0.9205356, -0.8756068, 3.437386, 1, 0, 0.9960784, 1,
0.9223382, -0.8520865, 2.084461, 1, 0, 0.9882353, 1,
0.9240825, 0.7001871, 1.350726, 1, 0, 0.9843137, 1,
0.9243442, -0.3562523, 2.511976, 1, 0, 0.9764706, 1,
0.9259089, 0.1657831, 0.1076855, 1, 0, 0.972549, 1,
0.9276556, 0.04436623, -1.014486, 1, 0, 0.9647059, 1,
0.9360356, -2.179909, 3.801286, 1, 0, 0.9607843, 1,
0.9403331, -0.3889356, 3.241126, 1, 0, 0.9529412, 1,
0.9445648, -0.2767211, 2.59934, 1, 0, 0.9490196, 1,
0.9523019, -1.296097, 3.91012, 1, 0, 0.9411765, 1,
0.9535511, 1.118961, 1.849912, 1, 0, 0.9372549, 1,
0.9655213, 1.575659, -0.0150784, 1, 0, 0.9294118, 1,
0.9659579, 0.06737657, 0.9849327, 1, 0, 0.9254902, 1,
0.971972, 0.07487477, 1.602519, 1, 0, 0.9176471, 1,
0.9769846, 0.09719126, 1.521294, 1, 0, 0.9137255, 1,
0.9840049, 0.3815616, 0.3831138, 1, 0, 0.9058824, 1,
0.9878022, 0.2179835, 1.42493, 1, 0, 0.9019608, 1,
0.9886815, 0.2628005, 0.02770884, 1, 0, 0.8941177, 1,
0.9999983, -1.959642, 2.783562, 1, 0, 0.8862745, 1,
1.009086, 0.4104956, 2.828383, 1, 0, 0.8823529, 1,
1.009912, -0.08855355, 1.725368, 1, 0, 0.8745098, 1,
1.014293, -0.5883288, 1.765212, 1, 0, 0.8705882, 1,
1.029443, -0.09801771, 1.278551, 1, 0, 0.8627451, 1,
1.037673, -0.006345587, 1.817824, 1, 0, 0.8588235, 1,
1.045147, 0.1496552, 2.539858, 1, 0, 0.8509804, 1,
1.045812, 0.8715781, 1.169832, 1, 0, 0.8470588, 1,
1.047557, -1.468018, 3.088382, 1, 0, 0.8392157, 1,
1.049412, -0.7721866, 3.018484, 1, 0, 0.8352941, 1,
1.051069, -0.01828527, 1.905006, 1, 0, 0.827451, 1,
1.055864, -0.8340015, 0.7763957, 1, 0, 0.8235294, 1,
1.058601, -0.2633588, 2.478576, 1, 0, 0.8156863, 1,
1.059309, 1.390481, -0.8518413, 1, 0, 0.8117647, 1,
1.069562, 0.01988796, 1.603198, 1, 0, 0.8039216, 1,
1.073313, 1.05012, 2.063953, 1, 0, 0.7960784, 1,
1.085226, 0.0191411, 0.3858057, 1, 0, 0.7921569, 1,
1.086674, -0.8527538, 4.670815, 1, 0, 0.7843137, 1,
1.086827, -0.324705, 2.449089, 1, 0, 0.7803922, 1,
1.088698, 0.7439245, 0.8431957, 1, 0, 0.772549, 1,
1.100809, -0.8233364, 0.6828027, 1, 0, 0.7686275, 1,
1.101325, -0.2052734, 2.625598, 1, 0, 0.7607843, 1,
1.102078, 1.450354, -0.6558478, 1, 0, 0.7568628, 1,
1.103271, -1.771577, 1.06712, 1, 0, 0.7490196, 1,
1.103849, 0.3291828, 2.213455, 1, 0, 0.7450981, 1,
1.109972, 0.1661401, 0.6724841, 1, 0, 0.7372549, 1,
1.111623, -0.1479671, 0.2491374, 1, 0, 0.7333333, 1,
1.114508, 0.3922797, 2.0901, 1, 0, 0.7254902, 1,
1.114773, -2.047657, 3.981449, 1, 0, 0.7215686, 1,
1.118117, 1.214692, 0.09535154, 1, 0, 0.7137255, 1,
1.133306, 1.433815, 1.688645, 1, 0, 0.7098039, 1,
1.134521, -1.023295, 2.470554, 1, 0, 0.7019608, 1,
1.141276, -0.8501337, 2.543288, 1, 0, 0.6941177, 1,
1.162099, -1.440769, 2.288802, 1, 0, 0.6901961, 1,
1.167143, 1.430458, -0.1547208, 1, 0, 0.682353, 1,
1.167915, -0.06032037, 1.083903, 1, 0, 0.6784314, 1,
1.173651, 1.60505, 0.1451191, 1, 0, 0.6705883, 1,
1.180285, 2.226892, 1.860798, 1, 0, 0.6666667, 1,
1.193692, 0.1741718, 0.3417231, 1, 0, 0.6588235, 1,
1.212065, 0.3691472, 0.4488532, 1, 0, 0.654902, 1,
1.21467, 0.7469519, 0.7158771, 1, 0, 0.6470588, 1,
1.215274, 1.160159, 0.2420564, 1, 0, 0.6431373, 1,
1.217335, -0.690715, -0.7930921, 1, 0, 0.6352941, 1,
1.225372, 0.03756544, 1.51269, 1, 0, 0.6313726, 1,
1.227439, 1.243113, 0.1538898, 1, 0, 0.6235294, 1,
1.235304, 1.875654, 1.849021, 1, 0, 0.6196079, 1,
1.249031, -0.5865316, 3.452394, 1, 0, 0.6117647, 1,
1.253439, 0.9164825, 1.410026, 1, 0, 0.6078432, 1,
1.256492, -0.6268723, 2.19159, 1, 0, 0.6, 1,
1.257024, 0.1662263, 0.3700853, 1, 0, 0.5921569, 1,
1.259018, -0.4999245, 0.557578, 1, 0, 0.5882353, 1,
1.260569, -0.3369064, 0.3988496, 1, 0, 0.5803922, 1,
1.265061, -1.142657, 3.308974, 1, 0, 0.5764706, 1,
1.269864, -0.4160382, 2.154313, 1, 0, 0.5686275, 1,
1.272601, 0.5471306, 2.206531, 1, 0, 0.5647059, 1,
1.275311, 0.2301174, 2.58412, 1, 0, 0.5568628, 1,
1.277307, 0.4285084, 1.29137, 1, 0, 0.5529412, 1,
1.283069, -0.6564041, 0.7788828, 1, 0, 0.5450981, 1,
1.296113, 0.01773212, 1.690769, 1, 0, 0.5411765, 1,
1.304775, -0.06616815, 0.2821872, 1, 0, 0.5333334, 1,
1.321761, -0.03787759, 3.874527, 1, 0, 0.5294118, 1,
1.334337, -0.0767361, -0.2877305, 1, 0, 0.5215687, 1,
1.337895, -1.27444, 0.1058468, 1, 0, 0.5176471, 1,
1.355118, -1.688893, 2.221323, 1, 0, 0.509804, 1,
1.371639, -0.1026134, 2.51513, 1, 0, 0.5058824, 1,
1.372266, -1.015428, 2.455713, 1, 0, 0.4980392, 1,
1.372777, 0.04904816, 0.004034027, 1, 0, 0.4901961, 1,
1.377102, -0.09831292, 1.584259, 1, 0, 0.4862745, 1,
1.377216, 1.249753, 1.117454, 1, 0, 0.4784314, 1,
1.384887, -0.3148896, 2.968246, 1, 0, 0.4745098, 1,
1.393136, 0.8679944, 0.4432478, 1, 0, 0.4666667, 1,
1.394272, -1.657663, 3.089915, 1, 0, 0.4627451, 1,
1.395902, 0.2785987, 3.583687, 1, 0, 0.454902, 1,
1.398519, -0.1537243, 1.115781, 1, 0, 0.4509804, 1,
1.407261, -0.1388834, 1.071961, 1, 0, 0.4431373, 1,
1.412162, -0.729382, 2.363205, 1, 0, 0.4392157, 1,
1.413424, 0.3896327, 2.119775, 1, 0, 0.4313726, 1,
1.419349, 1.409095, -2.020721, 1, 0, 0.427451, 1,
1.439578, 1.244228, 0.1732292, 1, 0, 0.4196078, 1,
1.449996, -0.08383805, 1.36594, 1, 0, 0.4156863, 1,
1.455912, -0.4652486, 3.310355, 1, 0, 0.4078431, 1,
1.466619, 0.5166275, 0.556256, 1, 0, 0.4039216, 1,
1.471176, -1.483192, 1.242955, 1, 0, 0.3960784, 1,
1.478217, 1.311219, 0.293132, 1, 0, 0.3882353, 1,
1.478544, -0.6412932, 0.5756755, 1, 0, 0.3843137, 1,
1.487684, -1.237377, 2.226837, 1, 0, 0.3764706, 1,
1.49268, 0.4345221, 2.801425, 1, 0, 0.372549, 1,
1.507869, 1.453119, 1.317834, 1, 0, 0.3647059, 1,
1.510973, 0.1888207, 2.730326, 1, 0, 0.3607843, 1,
1.515147, 0.8680796, 1.503105, 1, 0, 0.3529412, 1,
1.516391, 0.7435532, 0.2683245, 1, 0, 0.3490196, 1,
1.526914, -1.70317, 1.354912, 1, 0, 0.3411765, 1,
1.528891, 0.4410872, -0.606814, 1, 0, 0.3372549, 1,
1.531841, 0.5649282, -0.2897065, 1, 0, 0.3294118, 1,
1.557661, 0.782275, 0.9742078, 1, 0, 0.3254902, 1,
1.568416, 1.393829, 1.278669, 1, 0, 0.3176471, 1,
1.568598, -0.3754199, 2.087525, 1, 0, 0.3137255, 1,
1.580121, 0.09882445, 3.042872, 1, 0, 0.3058824, 1,
1.587265, -0.9682337, 1.911228, 1, 0, 0.2980392, 1,
1.597116, 1.105694, -0.1964037, 1, 0, 0.2941177, 1,
1.604628, -1.213464, 5.349903, 1, 0, 0.2862745, 1,
1.609392, -0.5064366, 1.538019, 1, 0, 0.282353, 1,
1.620803, 1.86421, 0.432188, 1, 0, 0.2745098, 1,
1.651101, 0.7867803, 1.824265, 1, 0, 0.2705882, 1,
1.673877, 0.9312848, 1.906273, 1, 0, 0.2627451, 1,
1.679161, 1.356151, -0.4415732, 1, 0, 0.2588235, 1,
1.679176, 1.987902, 2.482071, 1, 0, 0.2509804, 1,
1.679707, 0.2015474, 3.03449, 1, 0, 0.2470588, 1,
1.689007, 1.477374, 1.290548, 1, 0, 0.2392157, 1,
1.693878, 0.9563832, 1.025955, 1, 0, 0.2352941, 1,
1.694862, 1.960621, 0.7680181, 1, 0, 0.227451, 1,
1.697178, -3.223457, 3.528549, 1, 0, 0.2235294, 1,
1.722155, -0.4190292, 0.4639672, 1, 0, 0.2156863, 1,
1.73471, -0.4064385, 1.033081, 1, 0, 0.2117647, 1,
1.74703, 1.293293, 1.832283, 1, 0, 0.2039216, 1,
1.755805, 0.4994601, 2.891994, 1, 0, 0.1960784, 1,
1.758101, -2.484599, 3.467734, 1, 0, 0.1921569, 1,
1.788621, 0.3985338, 2.081439, 1, 0, 0.1843137, 1,
1.792403, -0.2727497, 0.3761196, 1, 0, 0.1803922, 1,
1.808129, 0.3235632, 1.384353, 1, 0, 0.172549, 1,
1.809966, -2.019995, 0.7905517, 1, 0, 0.1686275, 1,
1.818875, 1.499688, 1.295002, 1, 0, 0.1607843, 1,
1.819962, -1.778977, 0.4038547, 1, 0, 0.1568628, 1,
1.844407, 0.5740069, -0.1439831, 1, 0, 0.1490196, 1,
1.849606, -0.4095204, 1.915103, 1, 0, 0.145098, 1,
1.889684, 0.4779854, 2.427735, 1, 0, 0.1372549, 1,
1.912354, 0.2084871, 4.039845, 1, 0, 0.1333333, 1,
1.912705, 0.246168, 0.3505936, 1, 0, 0.1254902, 1,
1.93769, -1.091252, 2.544298, 1, 0, 0.1215686, 1,
1.966106, -1.009466, 0.5890232, 1, 0, 0.1137255, 1,
2.062924, -0.8059807, 2.988951, 1, 0, 0.1098039, 1,
2.067633, 0.3422319, 3.63833, 1, 0, 0.1019608, 1,
2.083509, 0.6601663, 2.572854, 1, 0, 0.09411765, 1,
2.102694, -0.5973059, 3.769798, 1, 0, 0.09019608, 1,
2.106332, 0.04946761, 2.252626, 1, 0, 0.08235294, 1,
2.115016, -1.506941, 1.177439, 1, 0, 0.07843138, 1,
2.174044, 1.410834, 1.821949, 1, 0, 0.07058824, 1,
2.236969, -0.1244907, 0.6246881, 1, 0, 0.06666667, 1,
2.244332, -0.6887028, 1.87686, 1, 0, 0.05882353, 1,
2.286184, 0.1001672, 1.758094, 1, 0, 0.05490196, 1,
2.308503, -0.4014061, -0.5176706, 1, 0, 0.04705882, 1,
2.389777, -0.2091804, 2.025322, 1, 0, 0.04313726, 1,
2.410911, 0.523856, 0.7278668, 1, 0, 0.03529412, 1,
2.417346, -1.280105, 1.736147, 1, 0, 0.03137255, 1,
2.597579, 0.8379039, 0.6855296, 1, 0, 0.02352941, 1,
2.675349, -0.0728161, 2.02796, 1, 0, 0.01960784, 1,
2.94815, -1.086687, 3.730152, 1, 0, 0.01176471, 1,
3.220968, 0.3856051, 1.018579, 1, 0, 0.007843138, 1
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
-0.02240002, -4.321376, -7.521831, 0, -0.5, 0.5, 0.5,
-0.02240002, -4.321376, -7.521831, 1, -0.5, 0.5, 0.5,
-0.02240002, -4.321376, -7.521831, 1, 1.5, 0.5, 0.5,
-0.02240002, -4.321376, -7.521831, 0, 1.5, 0.5, 0.5
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
-4.36527, 0.01524377, -7.521831, 0, -0.5, 0.5, 0.5,
-4.36527, 0.01524377, -7.521831, 1, -0.5, 0.5, 0.5,
-4.36527, 0.01524377, -7.521831, 1, 1.5, 0.5, 0.5,
-4.36527, 0.01524377, -7.521831, 0, 1.5, 0.5, 0.5
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
-4.36527, -4.321376, 0.1480832, 0, -0.5, 0.5, 0.5,
-4.36527, -4.321376, 0.1480832, 1, -0.5, 0.5, 0.5,
-4.36527, -4.321376, 0.1480832, 1, 1.5, 0.5, 0.5,
-4.36527, -4.321376, 0.1480832, 0, 1.5, 0.5, 0.5
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
-3, -3.320618, -5.751851,
3, -3.320618, -5.751851,
-3, -3.320618, -5.751851,
-3, -3.487411, -6.046847,
-2, -3.320618, -5.751851,
-2, -3.487411, -6.046847,
-1, -3.320618, -5.751851,
-1, -3.487411, -6.046847,
0, -3.320618, -5.751851,
0, -3.487411, -6.046847,
1, -3.320618, -5.751851,
1, -3.487411, -6.046847,
2, -3.320618, -5.751851,
2, -3.487411, -6.046847,
3, -3.320618, -5.751851,
3, -3.487411, -6.046847
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
-3, -3.820997, -6.636841, 0, -0.5, 0.5, 0.5,
-3, -3.820997, -6.636841, 1, -0.5, 0.5, 0.5,
-3, -3.820997, -6.636841, 1, 1.5, 0.5, 0.5,
-3, -3.820997, -6.636841, 0, 1.5, 0.5, 0.5,
-2, -3.820997, -6.636841, 0, -0.5, 0.5, 0.5,
-2, -3.820997, -6.636841, 1, -0.5, 0.5, 0.5,
-2, -3.820997, -6.636841, 1, 1.5, 0.5, 0.5,
-2, -3.820997, -6.636841, 0, 1.5, 0.5, 0.5,
-1, -3.820997, -6.636841, 0, -0.5, 0.5, 0.5,
-1, -3.820997, -6.636841, 1, -0.5, 0.5, 0.5,
-1, -3.820997, -6.636841, 1, 1.5, 0.5, 0.5,
-1, -3.820997, -6.636841, 0, 1.5, 0.5, 0.5,
0, -3.820997, -6.636841, 0, -0.5, 0.5, 0.5,
0, -3.820997, -6.636841, 1, -0.5, 0.5, 0.5,
0, -3.820997, -6.636841, 1, 1.5, 0.5, 0.5,
0, -3.820997, -6.636841, 0, 1.5, 0.5, 0.5,
1, -3.820997, -6.636841, 0, -0.5, 0.5, 0.5,
1, -3.820997, -6.636841, 1, -0.5, 0.5, 0.5,
1, -3.820997, -6.636841, 1, 1.5, 0.5, 0.5,
1, -3.820997, -6.636841, 0, 1.5, 0.5, 0.5,
2, -3.820997, -6.636841, 0, -0.5, 0.5, 0.5,
2, -3.820997, -6.636841, 1, -0.5, 0.5, 0.5,
2, -3.820997, -6.636841, 1, 1.5, 0.5, 0.5,
2, -3.820997, -6.636841, 0, 1.5, 0.5, 0.5,
3, -3.820997, -6.636841, 0, -0.5, 0.5, 0.5,
3, -3.820997, -6.636841, 1, -0.5, 0.5, 0.5,
3, -3.820997, -6.636841, 1, 1.5, 0.5, 0.5,
3, -3.820997, -6.636841, 0, 1.5, 0.5, 0.5
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
-3.363069, -3, -5.751851,
-3.363069, 3, -5.751851,
-3.363069, -3, -5.751851,
-3.530102, -3, -6.046847,
-3.363069, -2, -5.751851,
-3.530102, -2, -6.046847,
-3.363069, -1, -5.751851,
-3.530102, -1, -6.046847,
-3.363069, 0, -5.751851,
-3.530102, 0, -6.046847,
-3.363069, 1, -5.751851,
-3.530102, 1, -6.046847,
-3.363069, 2, -5.751851,
-3.530102, 2, -6.046847,
-3.363069, 3, -5.751851,
-3.530102, 3, -6.046847
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
-3.864169, -3, -6.636841, 0, -0.5, 0.5, 0.5,
-3.864169, -3, -6.636841, 1, -0.5, 0.5, 0.5,
-3.864169, -3, -6.636841, 1, 1.5, 0.5, 0.5,
-3.864169, -3, -6.636841, 0, 1.5, 0.5, 0.5,
-3.864169, -2, -6.636841, 0, -0.5, 0.5, 0.5,
-3.864169, -2, -6.636841, 1, -0.5, 0.5, 0.5,
-3.864169, -2, -6.636841, 1, 1.5, 0.5, 0.5,
-3.864169, -2, -6.636841, 0, 1.5, 0.5, 0.5,
-3.864169, -1, -6.636841, 0, -0.5, 0.5, 0.5,
-3.864169, -1, -6.636841, 1, -0.5, 0.5, 0.5,
-3.864169, -1, -6.636841, 1, 1.5, 0.5, 0.5,
-3.864169, -1, -6.636841, 0, 1.5, 0.5, 0.5,
-3.864169, 0, -6.636841, 0, -0.5, 0.5, 0.5,
-3.864169, 0, -6.636841, 1, -0.5, 0.5, 0.5,
-3.864169, 0, -6.636841, 1, 1.5, 0.5, 0.5,
-3.864169, 0, -6.636841, 0, 1.5, 0.5, 0.5,
-3.864169, 1, -6.636841, 0, -0.5, 0.5, 0.5,
-3.864169, 1, -6.636841, 1, -0.5, 0.5, 0.5,
-3.864169, 1, -6.636841, 1, 1.5, 0.5, 0.5,
-3.864169, 1, -6.636841, 0, 1.5, 0.5, 0.5,
-3.864169, 2, -6.636841, 0, -0.5, 0.5, 0.5,
-3.864169, 2, -6.636841, 1, -0.5, 0.5, 0.5,
-3.864169, 2, -6.636841, 1, 1.5, 0.5, 0.5,
-3.864169, 2, -6.636841, 0, 1.5, 0.5, 0.5,
-3.864169, 3, -6.636841, 0, -0.5, 0.5, 0.5,
-3.864169, 3, -6.636841, 1, -0.5, 0.5, 0.5,
-3.864169, 3, -6.636841, 1, 1.5, 0.5, 0.5,
-3.864169, 3, -6.636841, 0, 1.5, 0.5, 0.5
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
-3.363069, -3.320618, -4,
-3.363069, -3.320618, 4,
-3.363069, -3.320618, -4,
-3.530102, -3.487411, -4,
-3.363069, -3.320618, -2,
-3.530102, -3.487411, -2,
-3.363069, -3.320618, 0,
-3.530102, -3.487411, 0,
-3.363069, -3.320618, 2,
-3.530102, -3.487411, 2,
-3.363069, -3.320618, 4,
-3.530102, -3.487411, 4
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
-3.864169, -3.820997, -4, 0, -0.5, 0.5, 0.5,
-3.864169, -3.820997, -4, 1, -0.5, 0.5, 0.5,
-3.864169, -3.820997, -4, 1, 1.5, 0.5, 0.5,
-3.864169, -3.820997, -4, 0, 1.5, 0.5, 0.5,
-3.864169, -3.820997, -2, 0, -0.5, 0.5, 0.5,
-3.864169, -3.820997, -2, 1, -0.5, 0.5, 0.5,
-3.864169, -3.820997, -2, 1, 1.5, 0.5, 0.5,
-3.864169, -3.820997, -2, 0, 1.5, 0.5, 0.5,
-3.864169, -3.820997, 0, 0, -0.5, 0.5, 0.5,
-3.864169, -3.820997, 0, 1, -0.5, 0.5, 0.5,
-3.864169, -3.820997, 0, 1, 1.5, 0.5, 0.5,
-3.864169, -3.820997, 0, 0, 1.5, 0.5, 0.5,
-3.864169, -3.820997, 2, 0, -0.5, 0.5, 0.5,
-3.864169, -3.820997, 2, 1, -0.5, 0.5, 0.5,
-3.864169, -3.820997, 2, 1, 1.5, 0.5, 0.5,
-3.864169, -3.820997, 2, 0, 1.5, 0.5, 0.5,
-3.864169, -3.820997, 4, 0, -0.5, 0.5, 0.5,
-3.864169, -3.820997, 4, 1, -0.5, 0.5, 0.5,
-3.864169, -3.820997, 4, 1, 1.5, 0.5, 0.5,
-3.864169, -3.820997, 4, 0, 1.5, 0.5, 0.5
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
-3.363069, -3.320618, -5.751851,
-3.363069, 3.351105, -5.751851,
-3.363069, -3.320618, 6.048017,
-3.363069, 3.351105, 6.048017,
-3.363069, -3.320618, -5.751851,
-3.363069, -3.320618, 6.048017,
-3.363069, 3.351105, -5.751851,
-3.363069, 3.351105, 6.048017,
-3.363069, -3.320618, -5.751851,
3.318269, -3.320618, -5.751851,
-3.363069, -3.320618, 6.048017,
3.318269, -3.320618, 6.048017,
-3.363069, 3.351105, -5.751851,
3.318269, 3.351105, -5.751851,
-3.363069, 3.351105, 6.048017,
3.318269, 3.351105, 6.048017,
3.318269, -3.320618, -5.751851,
3.318269, 3.351105, -5.751851,
3.318269, -3.320618, 6.048017,
3.318269, 3.351105, 6.048017,
3.318269, -3.320618, -5.751851,
3.318269, -3.320618, 6.048017,
3.318269, 3.351105, -5.751851,
3.318269, 3.351105, 6.048017
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
var radius = 8.069806;
var distance = 35.90348;
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
mvMatrix.translate( 0.02240002, -0.01524377, -0.1480832 );
mvMatrix.scale( 1.305911, 1.307793, 0.7394348 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.90348);
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
chlorpropham<-read.table("chlorpropham.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-chlorpropham$V2
```

```
## Error in eval(expr, envir, enclos): object 'chlorpropham' not found
```

```r
y<-chlorpropham$V3
```

```
## Error in eval(expr, envir, enclos): object 'chlorpropham' not found
```

```r
z<-chlorpropham$V4
```

```
## Error in eval(expr, envir, enclos): object 'chlorpropham' not found
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
-3.265768, 0.2705078, -2.01046, 0, 0, 1, 1, 1,
-2.821323, -0.09258075, -0.4508563, 1, 0, 0, 1, 1,
-2.690992, 0.5824964, -2.120711, 1, 0, 0, 1, 1,
-2.60899, -0.2313392, -1.889678, 1, 0, 0, 1, 1,
-2.572423, 0.8976196, -0.5470447, 1, 0, 0, 1, 1,
-2.51301, -0.7401242, -0.7147551, 1, 0, 0, 1, 1,
-2.502529, 1.537205, -2.353747, 0, 0, 0, 1, 1,
-2.416141, -0.8505021, -0.1587818, 0, 0, 0, 1, 1,
-2.364966, -0.002976991, -0.5386385, 0, 0, 0, 1, 1,
-2.342667, 0.2463796, -0.9423119, 0, 0, 0, 1, 1,
-2.315775, 1.235121, -1.835355, 0, 0, 0, 1, 1,
-2.295162, -0.3735339, -2.308844, 0, 0, 0, 1, 1,
-2.284875, 1.597449, -2.390366, 0, 0, 0, 1, 1,
-2.27867, -0.09796035, -1.790004, 1, 1, 1, 1, 1,
-2.274726, -0.9911417, -1.698708, 1, 1, 1, 1, 1,
-2.22273, -0.3865086, -1.663355, 1, 1, 1, 1, 1,
-2.218999, 0.9125645, -1.234011, 1, 1, 1, 1, 1,
-2.217477, 0.7302105, -0.9961821, 1, 1, 1, 1, 1,
-2.21468, 1.305298, -0.8575976, 1, 1, 1, 1, 1,
-2.205049, -0.09295558, -1.086663, 1, 1, 1, 1, 1,
-2.185118, -1.914543, -3.217865, 1, 1, 1, 1, 1,
-2.161959, -1.219313, -1.090769, 1, 1, 1, 1, 1,
-2.102697, -1.084242, -1.889828, 1, 1, 1, 1, 1,
-2.069369, 0.9441952, 1.317521, 1, 1, 1, 1, 1,
-2.039768, 0.2776526, -0.4276763, 1, 1, 1, 1, 1,
-2.018855, -0.4806172, -2.211993, 1, 1, 1, 1, 1,
-2.014264, -0.7615528, -2.037095, 1, 1, 1, 1, 1,
-2.003741, 0.05417546, -1.798738, 1, 1, 1, 1, 1,
-1.983286, 0.1712241, -1.442647, 0, 0, 1, 1, 1,
-1.982772, -0.5943154, -2.353788, 1, 0, 0, 1, 1,
-1.971129, 0.8389484, -0.5854225, 1, 0, 0, 1, 1,
-1.944039, -1.658982, -3.414609, 1, 0, 0, 1, 1,
-1.898714, 0.4209741, -2.122861, 1, 0, 0, 1, 1,
-1.877842, 2.706916, -0.5909976, 1, 0, 0, 1, 1,
-1.852483, -0.6096637, -1.53402, 0, 0, 0, 1, 1,
-1.844908, 0.9725661, -2.093764, 0, 0, 0, 1, 1,
-1.838226, -0.6177886, -3.171448, 0, 0, 0, 1, 1,
-1.81166, 0.7365913, -0.8910572, 0, 0, 0, 1, 1,
-1.799944, -0.2872063, -2.20635, 0, 0, 0, 1, 1,
-1.786858, -0.830075, -0.8878343, 0, 0, 0, 1, 1,
-1.781217, -0.185534, -2.65695, 0, 0, 0, 1, 1,
-1.770327, -0.07716543, -1.092231, 1, 1, 1, 1, 1,
-1.767187, 1.557075, -3.339024, 1, 1, 1, 1, 1,
-1.762012, -0.8671497, -2.787272, 1, 1, 1, 1, 1,
-1.758174, -0.4314936, -2.4506, 1, 1, 1, 1, 1,
-1.742889, -1.414823, 0.002692344, 1, 1, 1, 1, 1,
-1.737511, 0.9720039, -2.307955, 1, 1, 1, 1, 1,
-1.724035, 1.070661, -0.3339168, 1, 1, 1, 1, 1,
-1.718292, -1.156302, -1.34455, 1, 1, 1, 1, 1,
-1.716857, -0.1212038, -1.843081, 1, 1, 1, 1, 1,
-1.708762, -0.9965176, -1.253513, 1, 1, 1, 1, 1,
-1.706109, 0.5934885, -1.635681, 1, 1, 1, 1, 1,
-1.683372, -1.112357, -0.4460055, 1, 1, 1, 1, 1,
-1.669422, -1.375533, -0.9636678, 1, 1, 1, 1, 1,
-1.66558, 0.5516041, -2.190435, 1, 1, 1, 1, 1,
-1.638133, 0.3723443, -0.6718198, 1, 1, 1, 1, 1,
-1.635764, 1.165573, -1.157158, 0, 0, 1, 1, 1,
-1.629102, -0.5026715, -3.721627, 1, 0, 0, 1, 1,
-1.62843, 2.709087, 0.2247183, 1, 0, 0, 1, 1,
-1.593125, 0.009774006, -1.728035, 1, 0, 0, 1, 1,
-1.58248, 0.1073544, -0.1916843, 1, 0, 0, 1, 1,
-1.574682, -0.1503644, -2.145067, 1, 0, 0, 1, 1,
-1.573851, 1.434631, -1.219653, 0, 0, 0, 1, 1,
-1.561466, 0.4675176, -0.9207525, 0, 0, 0, 1, 1,
-1.559123, 0.4903545, -1.847082, 0, 0, 0, 1, 1,
-1.537443, 1.194014, -1.128718, 0, 0, 0, 1, 1,
-1.518362, -1.141977, -2.070115, 0, 0, 0, 1, 1,
-1.517283, 1.069561, -2.991254, 0, 0, 0, 1, 1,
-1.507536, 0.6570398, -1.264757, 0, 0, 0, 1, 1,
-1.50186, -0.1939381, -3.063789, 1, 1, 1, 1, 1,
-1.497395, -0.4766351, -4.194023, 1, 1, 1, 1, 1,
-1.481271, 0.2228902, -3.008809, 1, 1, 1, 1, 1,
-1.472299, -0.5352691, -2.169777, 1, 1, 1, 1, 1,
-1.466518, 0.6278061, -0.4735125, 1, 1, 1, 1, 1,
-1.451887, 0.1178324, -1.679506, 1, 1, 1, 1, 1,
-1.448296, -0.1649512, -2.967312, 1, 1, 1, 1, 1,
-1.444916, 0.4194633, -0.4089322, 1, 1, 1, 1, 1,
-1.42475, -0.8684587, -2.040228, 1, 1, 1, 1, 1,
-1.420598, 0.3966306, -1.69539, 1, 1, 1, 1, 1,
-1.401689, -0.5341154, -1.808764, 1, 1, 1, 1, 1,
-1.396464, 0.4037191, 0.7562618, 1, 1, 1, 1, 1,
-1.39646, 0.5018627, 0.1586803, 1, 1, 1, 1, 1,
-1.383396, 0.4736076, -0.3765546, 1, 1, 1, 1, 1,
-1.382897, -0.571606, -2.046371, 1, 1, 1, 1, 1,
-1.38042, -0.8080859, -0.5068079, 0, 0, 1, 1, 1,
-1.379323, 0.3071172, -0.07981722, 1, 0, 0, 1, 1,
-1.364763, 0.4023346, 0.01015088, 1, 0, 0, 1, 1,
-1.342775, -0.3771186, -1.295352, 1, 0, 0, 1, 1,
-1.324643, -0.05197123, -0.925241, 1, 0, 0, 1, 1,
-1.321453, -0.1270848, -1.24363, 1, 0, 0, 1, 1,
-1.320784, 2.584226, 0.3088448, 0, 0, 0, 1, 1,
-1.31352, 1.433783, -1.044911, 0, 0, 0, 1, 1,
-1.309873, -1.382533, -3.43863, 0, 0, 0, 1, 1,
-1.304539, -0.1344084, 0.1008134, 0, 0, 0, 1, 1,
-1.301963, 1.0512, -0.4631935, 0, 0, 0, 1, 1,
-1.293788, 1.526456, -0.8278098, 0, 0, 0, 1, 1,
-1.293, -0.6362993, -2.272148, 0, 0, 0, 1, 1,
-1.28992, -0.5466218, -3.478523, 1, 1, 1, 1, 1,
-1.284467, -0.4840859, -3.259233, 1, 1, 1, 1, 1,
-1.284092, -0.6755871, -1.829646, 1, 1, 1, 1, 1,
-1.271524, -0.7327374, -3.542273, 1, 1, 1, 1, 1,
-1.270278, 0.0925822, -1.273077, 1, 1, 1, 1, 1,
-1.26265, -0.6477889, -1.144002, 1, 1, 1, 1, 1,
-1.260043, -0.1306682, -0.2713133, 1, 1, 1, 1, 1,
-1.258727, 0.9486724, -0.7109907, 1, 1, 1, 1, 1,
-1.258132, -0.3730303, -0.5108935, 1, 1, 1, 1, 1,
-1.257031, 1.837072, -0.5652124, 1, 1, 1, 1, 1,
-1.25351, -0.6448262, -0.2978627, 1, 1, 1, 1, 1,
-1.244775, -0.3391191, -3.438025, 1, 1, 1, 1, 1,
-1.233756, 0.2452166, -1.409418, 1, 1, 1, 1, 1,
-1.221311, 0.03278875, -3.065733, 1, 1, 1, 1, 1,
-1.204268, -0.4868881, -2.11848, 1, 1, 1, 1, 1,
-1.202549, 0.09237976, -1.289201, 0, 0, 1, 1, 1,
-1.202259, -0.05711213, -0.4418019, 1, 0, 0, 1, 1,
-1.196456, -1.29263, -1.488534, 1, 0, 0, 1, 1,
-1.192448, -1.139484, -2.149962, 1, 0, 0, 1, 1,
-1.18758, 0.3425256, -0.08274782, 1, 0, 0, 1, 1,
-1.184241, -2.124173, -4.103991, 1, 0, 0, 1, 1,
-1.172283, 0.5964922, 0.1049467, 0, 0, 0, 1, 1,
-1.170282, -0.6674003, -1.436684, 0, 0, 0, 1, 1,
-1.169239, 1.444162, -0.2348533, 0, 0, 0, 1, 1,
-1.167438, -0.2211753, -1.592293, 0, 0, 0, 1, 1,
-1.159809, 1.9527, -1.267742, 0, 0, 0, 1, 1,
-1.159165, 0.9618961, -2.033737, 0, 0, 0, 1, 1,
-1.153312, 1.230913, -1.225233, 0, 0, 0, 1, 1,
-1.148188, -0.9091721, -2.778204, 1, 1, 1, 1, 1,
-1.137367, -0.01156032, -1.311949, 1, 1, 1, 1, 1,
-1.132982, -0.3159882, -1.646532, 1, 1, 1, 1, 1,
-1.132029, 0.7214985, 0.6596515, 1, 1, 1, 1, 1,
-1.127558, -1.278773, -2.251757, 1, 1, 1, 1, 1,
-1.12605, -2.418117, -3.801491, 1, 1, 1, 1, 1,
-1.124526, 0.8337047, -0.5201422, 1, 1, 1, 1, 1,
-1.123665, -0.8566484, -2.299507, 1, 1, 1, 1, 1,
-1.123522, 2.451646, -0.7857985, 1, 1, 1, 1, 1,
-1.122284, 0.640402, -2.444421, 1, 1, 1, 1, 1,
-1.118127, 0.06953298, -0.7261271, 1, 1, 1, 1, 1,
-1.11692, -0.5512905, -2.698122, 1, 1, 1, 1, 1,
-1.113942, 0.1777376, -1.402755, 1, 1, 1, 1, 1,
-1.100604, -1.836597, -2.127645, 1, 1, 1, 1, 1,
-1.098367, 1.531299, -0.3979215, 1, 1, 1, 1, 1,
-1.092193, -0.770462, -1.438697, 0, 0, 1, 1, 1,
-1.070568, 0.6773379, -1.664565, 1, 0, 0, 1, 1,
-1.069165, 0.3267416, -1.075995, 1, 0, 0, 1, 1,
-1.066013, -0.2283849, -4.101071, 1, 0, 0, 1, 1,
-1.065925, -0.0381031, -2.930473, 1, 0, 0, 1, 1,
-1.063867, -1.539292, -3.339803, 1, 0, 0, 1, 1,
-1.061388, 0.5127708, -2.303183, 0, 0, 0, 1, 1,
-1.056937, -0.02807077, -2.946678, 0, 0, 0, 1, 1,
-1.048348, 0.4089314, -2.092355, 0, 0, 0, 1, 1,
-1.046668, -0.8887317, -0.639731, 0, 0, 0, 1, 1,
-1.045035, 0.0755421, -3.089432, 0, 0, 0, 1, 1,
-1.032466, -0.01635099, -0.5762959, 0, 0, 0, 1, 1,
-1.032024, 0.002624887, -1.766448, 0, 0, 0, 1, 1,
-1.029498, 1.011275, 0.01953581, 1, 1, 1, 1, 1,
-1.027403, -0.1480689, -3.027673, 1, 1, 1, 1, 1,
-1.024367, -0.2949498, -2.041736, 1, 1, 1, 1, 1,
-1.018853, 0.05604918, -2.665155, 1, 1, 1, 1, 1,
-1.017317, -0.9914614, -2.729717, 1, 1, 1, 1, 1,
-1.001953, 0.596506, -0.9213981, 1, 1, 1, 1, 1,
-0.9982221, 0.3689126, -1.151924, 1, 1, 1, 1, 1,
-0.992361, 0.8134341, -1.815325, 1, 1, 1, 1, 1,
-0.990894, 0.4578437, -1.167831, 1, 1, 1, 1, 1,
-0.9881427, 0.1194236, -1.697675, 1, 1, 1, 1, 1,
-0.983108, -0.5296491, -0.6657553, 1, 1, 1, 1, 1,
-0.9774432, 1.804697, -0.08010311, 1, 1, 1, 1, 1,
-0.9762819, 0.06513943, -1.821882, 1, 1, 1, 1, 1,
-0.971622, 0.585098, 0.1530904, 1, 1, 1, 1, 1,
-0.9667806, -0.3538216, -1.907655, 1, 1, 1, 1, 1,
-0.9653232, -0.575879, -1.498992, 0, 0, 1, 1, 1,
-0.9652849, -1.326247, -2.168515, 1, 0, 0, 1, 1,
-0.9645289, -0.4803289, -2.508699, 1, 0, 0, 1, 1,
-0.9643531, -0.5223565, -2.529224, 1, 0, 0, 1, 1,
-0.9615847, -0.06743479, -1.598228, 1, 0, 0, 1, 1,
-0.9575571, 0.8278067, -1.716229, 1, 0, 0, 1, 1,
-0.9522328, 0.2586653, -1.205309, 0, 0, 0, 1, 1,
-0.9513948, -0.4743798, -1.925118, 0, 0, 0, 1, 1,
-0.9479505, -1.475175, -2.966135, 0, 0, 0, 1, 1,
-0.9408193, 0.06398284, -2.85206, 0, 0, 0, 1, 1,
-0.9399176, 0.6913277, -0.5666171, 0, 0, 0, 1, 1,
-0.9332285, 0.6759046, -1.830119, 0, 0, 0, 1, 1,
-0.9330046, 1.480236, -1.295767, 0, 0, 0, 1, 1,
-0.9295868, -1.167878, -2.408056, 1, 1, 1, 1, 1,
-0.9238825, -1.045617, -2.440431, 1, 1, 1, 1, 1,
-0.9212546, -0.1860297, -1.917307, 1, 1, 1, 1, 1,
-0.9178331, 1.213577, 0.01600363, 1, 1, 1, 1, 1,
-0.9100974, -1.378657, -3.206157, 1, 1, 1, 1, 1,
-0.9091102, -1.541034, -2.372204, 1, 1, 1, 1, 1,
-0.9082432, -0.584954, -3.298047, 1, 1, 1, 1, 1,
-0.9066818, 1.392548, 0.2092451, 1, 1, 1, 1, 1,
-0.9054024, -2.248782, -2.819272, 1, 1, 1, 1, 1,
-0.8937076, 0.2892236, -2.428864, 1, 1, 1, 1, 1,
-0.8894473, 0.08849602, -0.6970742, 1, 1, 1, 1, 1,
-0.8820188, 1.926104, -1.871838, 1, 1, 1, 1, 1,
-0.8762239, -0.416733, -3.826229, 1, 1, 1, 1, 1,
-0.8749892, 0.5343931, -0.8044143, 1, 1, 1, 1, 1,
-0.8748637, -1.135952, -1.792217, 1, 1, 1, 1, 1,
-0.8725837, 0.1729047, -1.945132, 0, 0, 1, 1, 1,
-0.8699414, -0.7854121, -2.341184, 1, 0, 0, 1, 1,
-0.8680354, -0.9159169, -3.02461, 1, 0, 0, 1, 1,
-0.8673413, -2.453607, -2.593687, 1, 0, 0, 1, 1,
-0.8599937, -0.7585008, -3.097443, 1, 0, 0, 1, 1,
-0.8591602, 0.6854683, 0.3552664, 1, 0, 0, 1, 1,
-0.8589903, -0.1920835, -1.607838, 0, 0, 0, 1, 1,
-0.8551752, 0.5111624, -1.638842, 0, 0, 0, 1, 1,
-0.8547657, -0.6328804, -1.587126, 0, 0, 0, 1, 1,
-0.8523206, 1.170532, -1.405018, 0, 0, 0, 1, 1,
-0.8515143, 0.01426652, 0.003333617, 0, 0, 0, 1, 1,
-0.8506006, -0.7907681, -1.877273, 0, 0, 0, 1, 1,
-0.8503275, -0.9607577, -1.324382, 0, 0, 0, 1, 1,
-0.8479883, 0.9957211, -0.857655, 1, 1, 1, 1, 1,
-0.8472686, 0.01162648, -1.658665, 1, 1, 1, 1, 1,
-0.8447725, -0.7053163, -1.834574, 1, 1, 1, 1, 1,
-0.8431157, 1.54952, -0.09082453, 1, 1, 1, 1, 1,
-0.8398004, 0.1059077, -2.006581, 1, 1, 1, 1, 1,
-0.8373296, 0.4796583, 0.4142318, 1, 1, 1, 1, 1,
-0.8352754, 1.014465, 0.2964526, 1, 1, 1, 1, 1,
-0.8292075, -1.131682, -2.280037, 1, 1, 1, 1, 1,
-0.8237396, -0.7430381, -2.97879, 1, 1, 1, 1, 1,
-0.815244, 0.8327976, 0.4282886, 1, 1, 1, 1, 1,
-0.8150248, 0.3892171, -0.7419761, 1, 1, 1, 1, 1,
-0.80585, -0.08226313, -1.422355, 1, 1, 1, 1, 1,
-0.8040622, 0.3392846, -1.103831, 1, 1, 1, 1, 1,
-0.8027119, 0.4685528, -2.911555, 1, 1, 1, 1, 1,
-0.8014743, 1.224678, -0.4777038, 1, 1, 1, 1, 1,
-0.7996715, 0.4123929, -0.448274, 0, 0, 1, 1, 1,
-0.7982663, 2.695562, 0.6183059, 1, 0, 0, 1, 1,
-0.7932998, 0.9339539, -0.9284283, 1, 0, 0, 1, 1,
-0.793146, -0.2823766, 0.4692313, 1, 0, 0, 1, 1,
-0.7905641, -0.8493751, -3.784472, 1, 0, 0, 1, 1,
-0.7832541, -0.6163048, -0.1081216, 1, 0, 0, 1, 1,
-0.7828885, 0.2188328, 0.7432395, 0, 0, 0, 1, 1,
-0.7713336, -2.468938, -2.376702, 0, 0, 0, 1, 1,
-0.7605701, 0.6476963, -1.785708, 0, 0, 0, 1, 1,
-0.7558501, 1.341425, -1.349343, 0, 0, 0, 1, 1,
-0.7534167, -1.010367, -1.538764, 0, 0, 0, 1, 1,
-0.7478403, 2.010112, 1.944365, 0, 0, 0, 1, 1,
-0.7466695, -1.513193, -3.317828, 0, 0, 0, 1, 1,
-0.7456193, 1.992549, -0.2019688, 1, 1, 1, 1, 1,
-0.7439349, -2.439156, -3.549245, 1, 1, 1, 1, 1,
-0.7432981, 0.2781623, -2.86093, 1, 1, 1, 1, 1,
-0.7428006, 1.794011, -0.6508653, 1, 1, 1, 1, 1,
-0.7420536, -1.31378, -2.371056, 1, 1, 1, 1, 1,
-0.7375214, -0.4475068, -3.537316, 1, 1, 1, 1, 1,
-0.7288504, -0.2666944, -3.348662, 1, 1, 1, 1, 1,
-0.7275767, -1.147729, -2.928159, 1, 1, 1, 1, 1,
-0.7260383, 0.3026235, -1.091934, 1, 1, 1, 1, 1,
-0.72374, -1.028402, -1.483801, 1, 1, 1, 1, 1,
-0.7212919, 1.362359, -0.2263737, 1, 1, 1, 1, 1,
-0.7189839, 0.8019449, -0.01449408, 1, 1, 1, 1, 1,
-0.717532, -0.4534729, -1.071786, 1, 1, 1, 1, 1,
-0.715782, 1.421928, -0.479771, 1, 1, 1, 1, 1,
-0.7128969, -0.6853983, -2.473562, 1, 1, 1, 1, 1,
-0.7110279, -0.2561319, -1.740942, 0, 0, 1, 1, 1,
-0.707719, 1.266559, 1.611177, 1, 0, 0, 1, 1,
-0.7054299, -0.8679813, -1.944953, 1, 0, 0, 1, 1,
-0.7045902, 2.21881, -0.07732913, 1, 0, 0, 1, 1,
-0.7031017, 1.241912, 0.4714572, 1, 0, 0, 1, 1,
-0.69886, -0.232612, -2.304632, 1, 0, 0, 1, 1,
-0.6987446, 0.1154075, -2.023071, 0, 0, 0, 1, 1,
-0.698085, 0.4323625, -0.4048156, 0, 0, 0, 1, 1,
-0.6973067, 0.907526, -0.2973496, 0, 0, 0, 1, 1,
-0.6941986, -0.5217189, -2.770519, 0, 0, 0, 1, 1,
-0.6848258, -0.8729908, -1.830254, 0, 0, 0, 1, 1,
-0.6823611, 0.5707735, -2.479031, 0, 0, 0, 1, 1,
-0.6786934, -1.40467, -4.026941, 0, 0, 0, 1, 1,
-0.6771947, -0.6566663, -2.369637, 1, 1, 1, 1, 1,
-0.6765007, 0.5536362, -0.2251728, 1, 1, 1, 1, 1,
-0.6759489, -0.4083984, -0.3400902, 1, 1, 1, 1, 1,
-0.6678307, -0.497259, -1.583007, 1, 1, 1, 1, 1,
-0.6676384, -0.3677573, -1.800793, 1, 1, 1, 1, 1,
-0.6634603, -0.7617939, -3.746706, 1, 1, 1, 1, 1,
-0.6630784, -0.4970679, -1.65516, 1, 1, 1, 1, 1,
-0.6601725, 1.105659, -0.2358271, 1, 1, 1, 1, 1,
-0.6596408, 0.3944467, -0.9948173, 1, 1, 1, 1, 1,
-0.6462574, -0.5066816, -2.24209, 1, 1, 1, 1, 1,
-0.6421987, 0.4941327, -3.329493, 1, 1, 1, 1, 1,
-0.6403356, -1.952289, -5.580008, 1, 1, 1, 1, 1,
-0.6370106, 0.5894904, -1.680959, 1, 1, 1, 1, 1,
-0.6264749, -1.487307, -3.36197, 1, 1, 1, 1, 1,
-0.623389, 0.6122702, 0.06852099, 1, 1, 1, 1, 1,
-0.6217394, 0.6001776, -0.7775057, 0, 0, 1, 1, 1,
-0.6204982, -0.5154741, -3.065242, 1, 0, 0, 1, 1,
-0.6160048, 0.2137097, -0.02010202, 1, 0, 0, 1, 1,
-0.6159558, -0.6926179, -1.222783, 1, 0, 0, 1, 1,
-0.6132069, 1.085075, -0.1154531, 1, 0, 0, 1, 1,
-0.6080658, -1.567053, -3.540351, 1, 0, 0, 1, 1,
-0.6066456, -0.9906704, -2.340299, 0, 0, 0, 1, 1,
-0.6059033, -0.7956118, -2.166317, 0, 0, 0, 1, 1,
-0.5994349, 0.6231065, -0.6181901, 0, 0, 0, 1, 1,
-0.5989892, -1.191949, -2.773431, 0, 0, 0, 1, 1,
-0.5935019, 0.5222124, -0.007613105, 0, 0, 0, 1, 1,
-0.5932425, -1.716112, -4.203251, 0, 0, 0, 1, 1,
-0.5922467, -2.341187, -3.68391, 0, 0, 0, 1, 1,
-0.5873557, 1.530875, -0.1893298, 1, 1, 1, 1, 1,
-0.5853817, -0.7757795, -3.233516, 1, 1, 1, 1, 1,
-0.5829054, -0.4071455, -1.815489, 1, 1, 1, 1, 1,
-0.5812758, -0.006549787, -0.8677254, 1, 1, 1, 1, 1,
-0.5812314, -0.9690503, -2.956964, 1, 1, 1, 1, 1,
-0.5777824, 1.334172, -1.141754, 1, 1, 1, 1, 1,
-0.5769621, -2.089942, -4.339248, 1, 1, 1, 1, 1,
-0.5757337, -1.228617, -2.835545, 1, 1, 1, 1, 1,
-0.5739357, -0.5163102, -2.700474, 1, 1, 1, 1, 1,
-0.5723068, -1.165709, -2.215166, 1, 1, 1, 1, 1,
-0.567499, -0.4368899, -1.536261, 1, 1, 1, 1, 1,
-0.5670223, -1.077749, -2.598817, 1, 1, 1, 1, 1,
-0.5659836, 0.004334817, -2.263397, 1, 1, 1, 1, 1,
-0.5623143, 0.1163669, -2.121949, 1, 1, 1, 1, 1,
-0.5476642, 0.6188208, -2.1288, 1, 1, 1, 1, 1,
-0.5469867, 0.8528937, 0.3051804, 0, 0, 1, 1, 1,
-0.5409098, 0.07771699, -3.534992, 1, 0, 0, 1, 1,
-0.5402864, 0.6329049, -0.6581668, 1, 0, 0, 1, 1,
-0.5359409, -0.5176134, -2.528075, 1, 0, 0, 1, 1,
-0.5320569, 0.7859704, 0.5947837, 1, 0, 0, 1, 1,
-0.527995, 1.905064, 2.183761, 1, 0, 0, 1, 1,
-0.527917, 1.059905, -0.9213769, 0, 0, 0, 1, 1,
-0.5251018, 0.1215391, -2.27403, 0, 0, 0, 1, 1,
-0.5203443, -0.8395482, -3.276862, 0, 0, 0, 1, 1,
-0.5179765, 1.35612, -0.7220086, 0, 0, 0, 1, 1,
-0.5166321, 0.6915635, 0.3462895, 0, 0, 0, 1, 1,
-0.514562, -1.853174, -3.922063, 0, 0, 0, 1, 1,
-0.5094715, -2.099194, -5.273114, 0, 0, 0, 1, 1,
-0.5090415, 0.004639949, -0.551775, 1, 1, 1, 1, 1,
-0.5026655, -0.3177238, -2.595449, 1, 1, 1, 1, 1,
-0.5019231, 1.052971, 0.09273043, 1, 1, 1, 1, 1,
-0.4963001, -0.8960369, -3.093946, 1, 1, 1, 1, 1,
-0.496143, 2.238524, 0.4163407, 1, 1, 1, 1, 1,
-0.4930515, 0.8472258, -0.9524889, 1, 1, 1, 1, 1,
-0.4916135, -0.07399281, 0.1256254, 1, 1, 1, 1, 1,
-0.4908072, -0.925612, -3.509255, 1, 1, 1, 1, 1,
-0.4898891, -0.04158895, -0.7135619, 1, 1, 1, 1, 1,
-0.4859789, 1.942872, -1.894851, 1, 1, 1, 1, 1,
-0.4830618, -0.3832268, -4.086846, 1, 1, 1, 1, 1,
-0.4827113, -0.506099, -2.781958, 1, 1, 1, 1, 1,
-0.4758998, -0.5774822, -1.588152, 1, 1, 1, 1, 1,
-0.473626, -0.4480885, -2.241111, 1, 1, 1, 1, 1,
-0.468, -2.506725, -4.442356, 1, 1, 1, 1, 1,
-0.4664827, -0.9085171, -3.113124, 0, 0, 1, 1, 1,
-0.4658326, 0.00342552, -0.621245, 1, 0, 0, 1, 1,
-0.4641867, 1.511423, 1.224051, 1, 0, 0, 1, 1,
-0.4626703, -0.4193147, -2.770321, 1, 0, 0, 1, 1,
-0.4619766, 1.554195, -0.7948098, 1, 0, 0, 1, 1,
-0.4602892, -0.7374068, -1.849934, 1, 0, 0, 1, 1,
-0.4561843, -0.3090177, -2.817474, 0, 0, 0, 1, 1,
-0.4501179, -1.206909, -4.667381, 0, 0, 0, 1, 1,
-0.4435792, 1.822409, -1.456216, 0, 0, 0, 1, 1,
-0.4394076, -1.232585, -4.604439, 0, 0, 0, 1, 1,
-0.4389256, -1.19148, -4.022321, 0, 0, 0, 1, 1,
-0.4382493, -1.280992, -1.200028, 0, 0, 0, 1, 1,
-0.4330396, -1.496055, -0.7135881, 0, 0, 0, 1, 1,
-0.4317301, 2.290753, 1.426481, 1, 1, 1, 1, 1,
-0.4312282, 0.0370374, -5.131351, 1, 1, 1, 1, 1,
-0.430596, 0.4457018, -1.870632, 1, 1, 1, 1, 1,
-0.4280052, 1.376514, -0.3747027, 1, 1, 1, 1, 1,
-0.423685, -0.7046214, -3.91039, 1, 1, 1, 1, 1,
-0.4193828, 1.002378, 0.279512, 1, 1, 1, 1, 1,
-0.4149896, -1.450675, -2.734602, 1, 1, 1, 1, 1,
-0.4142529, -1.097867, -1.902904, 1, 1, 1, 1, 1,
-0.4117711, 0.1102641, -1.585564, 1, 1, 1, 1, 1,
-0.411698, -0.7853696, -1.120535, 1, 1, 1, 1, 1,
-0.4114296, -0.60725, -3.756636, 1, 1, 1, 1, 1,
-0.4097585, -0.5747469, -2.399564, 1, 1, 1, 1, 1,
-0.4064927, 1.297862, -0.4342474, 1, 1, 1, 1, 1,
-0.4063239, 0.7341163, -0.5686645, 1, 1, 1, 1, 1,
-0.404465, 0.4303358, -1.133281, 1, 1, 1, 1, 1,
-0.3985772, 0.9054641, -1.422943, 0, 0, 1, 1, 1,
-0.3977268, -0.0414263, -0.9017483, 1, 0, 0, 1, 1,
-0.3952389, -0.03837089, -0.7042549, 1, 0, 0, 1, 1,
-0.3835205, 0.3649265, 0.4893706, 1, 0, 0, 1, 1,
-0.3686973, -0.0866856, -1.133894, 1, 0, 0, 1, 1,
-0.3615992, 0.5322424, 0.5708353, 1, 0, 0, 1, 1,
-0.3574423, -0.004638935, -0.9941163, 0, 0, 0, 1, 1,
-0.353627, -0.5828636, -3.355842, 0, 0, 0, 1, 1,
-0.3534333, -0.4963099, -1.689184, 0, 0, 0, 1, 1,
-0.3477961, -0.3333952, -0.1910286, 0, 0, 0, 1, 1,
-0.3469541, -0.18647, -0.8685033, 0, 0, 0, 1, 1,
-0.3414388, -0.404191, -3.480274, 0, 0, 0, 1, 1,
-0.3398291, 0.9661546, -0.8648207, 0, 0, 0, 1, 1,
-0.3353322, 0.141372, -0.4951656, 1, 1, 1, 1, 1,
-0.3349777, -1.312565, -4.271534, 1, 1, 1, 1, 1,
-0.3270023, 1.769769, 0.9921852, 1, 1, 1, 1, 1,
-0.3262451, 0.3439376, -0.4857574, 1, 1, 1, 1, 1,
-0.3261358, 0.9795073, -0.7581431, 1, 1, 1, 1, 1,
-0.3224104, 0.9589509, 0.1068507, 1, 1, 1, 1, 1,
-0.3212198, 0.03703202, -0.5662504, 1, 1, 1, 1, 1,
-0.3183735, -1.715353, -3.638932, 1, 1, 1, 1, 1,
-0.3164831, -0.779824, -1.856323, 1, 1, 1, 1, 1,
-0.3125055, 0.4404782, -1.873465, 1, 1, 1, 1, 1,
-0.3118806, 1.03416, -1.560389, 1, 1, 1, 1, 1,
-0.3078733, -0.06974639, -2.656706, 1, 1, 1, 1, 1,
-0.3047381, 1.152186, -0.0812356, 1, 1, 1, 1, 1,
-0.3030659, -0.3840098, -2.858675, 1, 1, 1, 1, 1,
-0.2970099, -0.03196818, -0.6400805, 1, 1, 1, 1, 1,
-0.2967629, -0.6521343, -3.779947, 0, 0, 1, 1, 1,
-0.2959134, 1.999085, 1.847972, 1, 0, 0, 1, 1,
-0.2953266, -0.2646372, -2.712668, 1, 0, 0, 1, 1,
-0.2928844, 0.8127614, -0.4919008, 1, 0, 0, 1, 1,
-0.2900907, -0.6096368, -3.161557, 1, 0, 0, 1, 1,
-0.2884397, -0.7006677, -3.718127, 1, 0, 0, 1, 1,
-0.287808, 0.5646282, 0.2535827, 0, 0, 0, 1, 1,
-0.2875556, -1.320694, -2.717202, 0, 0, 0, 1, 1,
-0.2872527, 1.778364, 0.5391889, 0, 0, 0, 1, 1,
-0.2868447, -1.630894, -1.990987, 0, 0, 0, 1, 1,
-0.2841142, -0.6182812, -2.338364, 0, 0, 0, 1, 1,
-0.2828776, 0.03820214, 0.05982704, 0, 0, 0, 1, 1,
-0.2795231, -0.1926609, -2.503764, 0, 0, 0, 1, 1,
-0.2765369, 1.026931, 0.07847184, 1, 1, 1, 1, 1,
-0.2730744, 0.01200671, -0.5828626, 1, 1, 1, 1, 1,
-0.2718897, -0.6078993, -3.615198, 1, 1, 1, 1, 1,
-0.2691337, -0.6481321, -3.312811, 1, 1, 1, 1, 1,
-0.2671213, 0.4411462, 0.624681, 1, 1, 1, 1, 1,
-0.2620896, 1.188124, -1.891087, 1, 1, 1, 1, 1,
-0.2590917, 0.02823709, -2.412985, 1, 1, 1, 1, 1,
-0.2575524, 0.7387711, -1.745856, 1, 1, 1, 1, 1,
-0.2556135, 1.341184, -0.08338963, 1, 1, 1, 1, 1,
-0.2490806, 0.4871202, -1.687142, 1, 1, 1, 1, 1,
-0.245964, 0.9005173, 0.7408876, 1, 1, 1, 1, 1,
-0.2442611, -0.2987749, -2.203944, 1, 1, 1, 1, 1,
-0.2416274, -0.1177282, -1.269602, 1, 1, 1, 1, 1,
-0.2362579, -0.7820343, -2.870085, 1, 1, 1, 1, 1,
-0.2306444, 0.7908032, -0.6245353, 1, 1, 1, 1, 1,
-0.229237, -0.862681, -0.6909607, 0, 0, 1, 1, 1,
-0.2225024, -0.6631287, -1.471029, 1, 0, 0, 1, 1,
-0.2195858, -0.5116575, -4.220544, 1, 0, 0, 1, 1,
-0.210858, -0.7530371, -4.103253, 1, 0, 0, 1, 1,
-0.2104661, -0.482646, -0.7955294, 1, 0, 0, 1, 1,
-0.2070359, -0.224144, -1.388949, 1, 0, 0, 1, 1,
-0.2067554, 0.001725397, -0.6592085, 0, 0, 0, 1, 1,
-0.2065109, 0.7087389, -1.991247, 0, 0, 0, 1, 1,
-0.2063543, 0.7749643, 0.1213597, 0, 0, 0, 1, 1,
-0.2026492, -0.5172481, -2.601989, 0, 0, 0, 1, 1,
-0.2002876, 0.1755815, -1.133742, 0, 0, 0, 1, 1,
-0.2000087, 0.4811634, -0.4209078, 0, 0, 0, 1, 1,
-0.1985083, -0.7852538, -3.4026, 0, 0, 0, 1, 1,
-0.1960565, -1.046534, -1.755409, 1, 1, 1, 1, 1,
-0.1953006, -0.9304436, -1.978161, 1, 1, 1, 1, 1,
-0.1942892, 0.8835818, 0.1867037, 1, 1, 1, 1, 1,
-0.1935737, -0.8619336, -2.262404, 1, 1, 1, 1, 1,
-0.1923495, 1.155617, 2.079826, 1, 1, 1, 1, 1,
-0.191882, -1.270163, -2.191033, 1, 1, 1, 1, 1,
-0.1867985, -0.6854679, -1.76804, 1, 1, 1, 1, 1,
-0.1840447, 1.772435, -0.8815441, 1, 1, 1, 1, 1,
-0.1777089, -0.0487359, -0.5662313, 1, 1, 1, 1, 1,
-0.1756399, -0.652061, -3.322688, 1, 1, 1, 1, 1,
-0.1753383, 0.590359, 0.4502314, 1, 1, 1, 1, 1,
-0.1713526, -0.4918532, -3.020563, 1, 1, 1, 1, 1,
-0.1623789, 0.6210943, 0.8180376, 1, 1, 1, 1, 1,
-0.1613045, 0.1859467, -0.1866838, 1, 1, 1, 1, 1,
-0.1539469, -2.37618, -4.348728, 1, 1, 1, 1, 1,
-0.1511903, -0.2393164, -4.624171, 0, 0, 1, 1, 1,
-0.1449817, 3.103013, -0.5137485, 1, 0, 0, 1, 1,
-0.1449535, -0.9829592, -4.426585, 1, 0, 0, 1, 1,
-0.1412949, -1.262895, -3.186678, 1, 0, 0, 1, 1,
-0.1397668, -0.4548207, -1.749388, 1, 0, 0, 1, 1,
-0.1371566, -0.5309309, -2.378181, 1, 0, 0, 1, 1,
-0.1359504, -2.598511, -3.367574, 0, 0, 0, 1, 1,
-0.1322264, 0.2212391, -1.378382, 0, 0, 0, 1, 1,
-0.1309614, 0.9441039, 0.8902106, 0, 0, 0, 1, 1,
-0.1298983, -0.3396477, -1.403712, 0, 0, 0, 1, 1,
-0.1249238, 1.535405, 0.9333861, 0, 0, 0, 1, 1,
-0.1230745, -0.4063627, -2.736485, 0, 0, 0, 1, 1,
-0.1227698, 0.3777134, -0.3049425, 0, 0, 0, 1, 1,
-0.1227538, 0.158568, -0.6319509, 1, 1, 1, 1, 1,
-0.1220445, -1.08759, -3.820361, 1, 1, 1, 1, 1,
-0.120072, -1.237442, -3.231356, 1, 1, 1, 1, 1,
-0.1195382, 0.4008121, -1.455878, 1, 1, 1, 1, 1,
-0.1148072, 0.4439953, 1.733432, 1, 1, 1, 1, 1,
-0.1140782, -0.7267169, -3.345181, 1, 1, 1, 1, 1,
-0.1108804, -0.1026234, -2.853014, 1, 1, 1, 1, 1,
-0.1106947, 1.21097, 0.7409431, 1, 1, 1, 1, 1,
-0.1090605, 0.9137886, 0.03561499, 1, 1, 1, 1, 1,
-0.1066658, -0.5549691, -2.099361, 1, 1, 1, 1, 1,
-0.09431405, 1.368602, 0.2251716, 1, 1, 1, 1, 1,
-0.09007826, 0.6317474, -1.719535, 1, 1, 1, 1, 1,
-0.084046, -0.3027268, -2.160506, 1, 1, 1, 1, 1,
-0.0829305, -1.245402, -1.611509, 1, 1, 1, 1, 1,
-0.07857988, -0.9402617, -1.778004, 1, 1, 1, 1, 1,
-0.07816777, -0.08148476, -1.444589, 0, 0, 1, 1, 1,
-0.07536433, 1.00422, 0.1013951, 1, 0, 0, 1, 1,
-0.07402604, 0.05242841, 0.3471955, 1, 0, 0, 1, 1,
-0.07396943, -0.2575789, -2.14304, 1, 0, 0, 1, 1,
-0.07373735, 1.334155, -0.5202035, 1, 0, 0, 1, 1,
-0.07351019, -1.263366, -2.83374, 1, 0, 0, 1, 1,
-0.07309731, 0.3046196, -0.5207484, 0, 0, 0, 1, 1,
-0.07063742, -0.5839058, -4.999875, 0, 0, 0, 1, 1,
-0.06101519, -0.4694406, -2.490215, 0, 0, 0, 1, 1,
-0.05919517, 0.8888918, -0.7285658, 0, 0, 0, 1, 1,
-0.05872778, -1.767567, -2.470963, 0, 0, 0, 1, 1,
-0.05607505, 2.291366, 0.7500059, 0, 0, 0, 1, 1,
-0.0559915, -1.841705, -4.184525, 0, 0, 0, 1, 1,
-0.05567305, 0.1166923, 0.7161039, 1, 1, 1, 1, 1,
-0.05019617, -0.0218617, -1.390247, 1, 1, 1, 1, 1,
-0.0478332, -1.958415, -3.695451, 1, 1, 1, 1, 1,
-0.04491782, 1.619533, -1.438671, 1, 1, 1, 1, 1,
-0.04184441, -0.3061721, -2.513111, 1, 1, 1, 1, 1,
-0.0397833, -0.6289781, -3.726889, 1, 1, 1, 1, 1,
-0.03845064, 0.5613046, 0.1468008, 1, 1, 1, 1, 1,
-0.03239228, -1.051496, -3.45249, 1, 1, 1, 1, 1,
-0.02840286, 0.5839449, 0.2069071, 1, 1, 1, 1, 1,
-0.02757124, -0.4299951, -2.983081, 1, 1, 1, 1, 1,
-0.02712247, -1.599933, -3.40066, 1, 1, 1, 1, 1,
-0.02619548, -0.4797209, -1.535095, 1, 1, 1, 1, 1,
-0.02593197, -0.80365, -2.741856, 1, 1, 1, 1, 1,
-0.02375982, 0.5768485, 0.2229438, 1, 1, 1, 1, 1,
-0.02196624, -1.78688, -3.000856, 1, 1, 1, 1, 1,
-0.02108845, 1.139675, -1.399928, 0, 0, 1, 1, 1,
-0.01227591, -1.516865, -2.165134, 1, 0, 0, 1, 1,
-0.005098581, 0.5838244, -0.3085319, 1, 0, 0, 1, 1,
-0.002820742, 2.414044, -0.4269896, 1, 0, 0, 1, 1,
-0.001770392, -1.365138, -2.409266, 1, 0, 0, 1, 1,
-0.001298164, -0.2697732, -3.375182, 1, 0, 0, 1, 1,
-0.001269097, 0.2791647, 0.864808, 0, 0, 0, 1, 1,
9.042031e-05, -0.03638598, 3.043266, 0, 0, 0, 1, 1,
0.0006016886, 0.2883933, -0.5740202, 0, 0, 0, 1, 1,
0.001545292, -0.4259598, 4.516523, 0, 0, 0, 1, 1,
0.007428808, 0.1241893, 1.526079, 0, 0, 0, 1, 1,
0.009312055, -1.004493, 3.690593, 0, 0, 0, 1, 1,
0.01171621, -1.550608, 3.183987, 0, 0, 0, 1, 1,
0.01233512, 0.8968929, 0.3949674, 1, 1, 1, 1, 1,
0.01749628, 0.2849876, 0.9263633, 1, 1, 1, 1, 1,
0.0186588, 0.8960386, -1.194577, 1, 1, 1, 1, 1,
0.02072075, -0.6911664, 3.398985, 1, 1, 1, 1, 1,
0.0207977, 0.4206009, 0.7959463, 1, 1, 1, 1, 1,
0.02361676, 1.118495, 1.906676, 1, 1, 1, 1, 1,
0.02385884, -1.105854, 4.511792, 1, 1, 1, 1, 1,
0.02628702, -0.2200684, 2.735667, 1, 1, 1, 1, 1,
0.02704765, -0.04428865, 2.850353, 1, 1, 1, 1, 1,
0.02808459, -0.6624805, 2.859469, 1, 1, 1, 1, 1,
0.03064025, 1.332408, 0.1125935, 1, 1, 1, 1, 1,
0.03732475, 0.5426711, -1.460172, 1, 1, 1, 1, 1,
0.04012272, 0.8902721, -0.1980295, 1, 1, 1, 1, 1,
0.04404795, 0.01275664, 2.051242, 1, 1, 1, 1, 1,
0.05008297, -0.007962052, 1.793754, 1, 1, 1, 1, 1,
0.05679365, 1.999168, -1.277143, 0, 0, 1, 1, 1,
0.05751214, 0.3717805, 0.5271831, 1, 0, 0, 1, 1,
0.0580468, -0.6190156, 3.465573, 1, 0, 0, 1, 1,
0.0600744, -0.1180196, 2.430547, 1, 0, 0, 1, 1,
0.06062018, -0.2360301, 3.100291, 1, 0, 0, 1, 1,
0.0635078, 0.4478769, -0.4489277, 1, 0, 0, 1, 1,
0.06357394, -1.646795, 5.876174, 0, 0, 0, 1, 1,
0.06467024, -0.2068204, 1.050215, 0, 0, 0, 1, 1,
0.06538154, -0.4978029, 3.020624, 0, 0, 0, 1, 1,
0.0657958, 0.5318833, -0.1934038, 0, 0, 0, 1, 1,
0.07067388, -1.696703, 2.924673, 0, 0, 0, 1, 1,
0.07508606, -0.9081588, 3.544212, 0, 0, 0, 1, 1,
0.07864086, -0.3380954, 1.740229, 0, 0, 0, 1, 1,
0.08062746, 0.5026039, -0.2613246, 1, 1, 1, 1, 1,
0.08239105, 0.1635702, 1.020118, 1, 1, 1, 1, 1,
0.08517816, -1.659405, 2.3795, 1, 1, 1, 1, 1,
0.08527292, 0.2249972, -0.5754363, 1, 1, 1, 1, 1,
0.08558629, 1.316464, -0.1404389, 1, 1, 1, 1, 1,
0.08579874, -2.112393, 3.531959, 1, 1, 1, 1, 1,
0.08589403, 0.04980942, 4.046424, 1, 1, 1, 1, 1,
0.09347942, 0.1414944, 0.8107391, 1, 1, 1, 1, 1,
0.09591056, 1.041578, 1.557035, 1, 1, 1, 1, 1,
0.1009161, 0.4660451, -2.394726, 1, 1, 1, 1, 1,
0.101713, -0.236461, 3.440366, 1, 1, 1, 1, 1,
0.1058259, -1.36956, 4.223975, 1, 1, 1, 1, 1,
0.1060345, 0.8217822, -0.6837735, 1, 1, 1, 1, 1,
0.1070983, 0.5755412, 0.6804818, 1, 1, 1, 1, 1,
0.1075041, -0.7520743, 4.279808, 1, 1, 1, 1, 1,
0.1115346, -0.2538773, 1.466923, 0, 0, 1, 1, 1,
0.1119271, 0.6963358, 0.4066006, 1, 0, 0, 1, 1,
0.1214867, -1.051854, 4.796193, 1, 0, 0, 1, 1,
0.1227565, 0.362974, 0.5346407, 1, 0, 0, 1, 1,
0.1233995, 0.2066826, -0.7930071, 1, 0, 0, 1, 1,
0.1241177, 0.09566289, 1.191209, 1, 0, 0, 1, 1,
0.1254057, -0.335653, 1.980603, 0, 0, 0, 1, 1,
0.1276386, 0.6744145, 1.03211, 0, 0, 0, 1, 1,
0.1293922, 1.658876, 0.7726837, 0, 0, 0, 1, 1,
0.1369028, 0.8071482, -1.344903, 0, 0, 0, 1, 1,
0.1402184, -0.587873, 5.13518, 0, 0, 0, 1, 1,
0.1448115, 0.1787763, -0.5039183, 0, 0, 0, 1, 1,
0.1488202, -1.585866, 2.296177, 0, 0, 0, 1, 1,
0.1491178, -1.103423, 2.49385, 1, 1, 1, 1, 1,
0.1520015, -0.2392722, 1.966562, 1, 1, 1, 1, 1,
0.1527127, -0.6545195, 4.47843, 1, 1, 1, 1, 1,
0.1532988, 1.234101, 0.4349216, 1, 1, 1, 1, 1,
0.1556262, -1.277512, 0.699378, 1, 1, 1, 1, 1,
0.1572027, 0.7331141, 1.097222, 1, 1, 1, 1, 1,
0.1620811, 1.178638, 0.9043776, 1, 1, 1, 1, 1,
0.1628885, 0.4886226, 0.6126081, 1, 1, 1, 1, 1,
0.1666736, -1.088149, 1.896769, 1, 1, 1, 1, 1,
0.1681953, 1.395139, 0.1421706, 1, 1, 1, 1, 1,
0.1729805, -1.393989, 2.780708, 1, 1, 1, 1, 1,
0.1749295, 0.9366536, 0.9160239, 1, 1, 1, 1, 1,
0.182387, 0.5394698, 1.257323, 1, 1, 1, 1, 1,
0.1826554, -0.3518458, 1.745862, 1, 1, 1, 1, 1,
0.1860039, 0.6746394, 0.5158828, 1, 1, 1, 1, 1,
0.1869334, -0.7053681, 3.944429, 0, 0, 1, 1, 1,
0.1880085, 0.6266253, 1.005399, 1, 0, 0, 1, 1,
0.1927457, 0.6161677, -0.5614905, 1, 0, 0, 1, 1,
0.1930017, 0.4475732, -0.1622269, 1, 0, 0, 1, 1,
0.1954786, 1.831556, -1.376345, 1, 0, 0, 1, 1,
0.1973929, 1.016359, -0.63966, 1, 0, 0, 1, 1,
0.1984209, -1.318591, 3.357745, 0, 0, 0, 1, 1,
0.2024323, 1.196102, -1.41305, 0, 0, 0, 1, 1,
0.2032702, 0.4607773, 0.9900162, 0, 0, 0, 1, 1,
0.2037367, -0.6198682, 3.187867, 0, 0, 0, 1, 1,
0.2067976, 1.082286, 0.8325047, 0, 0, 0, 1, 1,
0.2088119, -1.041603, 2.863234, 0, 0, 0, 1, 1,
0.209791, 1.130105, -0.974644, 0, 0, 0, 1, 1,
0.2099179, 0.7259817, -0.736865, 1, 1, 1, 1, 1,
0.2153692, 1.381275, -0.6366181, 1, 1, 1, 1, 1,
0.2154049, 1.246022, 1.054986, 1, 1, 1, 1, 1,
0.219544, 1.628445, -0.04671064, 1, 1, 1, 1, 1,
0.2218034, -0.09911177, 1.280174, 1, 1, 1, 1, 1,
0.2256075, -0.2422361, 0.4774108, 1, 1, 1, 1, 1,
0.2266577, -0.7987219, 3.532433, 1, 1, 1, 1, 1,
0.2281034, 0.5648794, -1.092183, 1, 1, 1, 1, 1,
0.2286336, 0.6850803, -0.7722207, 1, 1, 1, 1, 1,
0.2331693, 0.2253308, 0.9518327, 1, 1, 1, 1, 1,
0.2332931, 1.15159, -0.01916426, 1, 1, 1, 1, 1,
0.2356042, 0.03371131, 1.501528, 1, 1, 1, 1, 1,
0.2420789, 0.7474445, 0.5518144, 1, 1, 1, 1, 1,
0.2451451, 0.1804679, 1.664347, 1, 1, 1, 1, 1,
0.2509303, -0.8726122, 2.957989, 1, 1, 1, 1, 1,
0.2562458, -1.203659, 1.449415, 0, 0, 1, 1, 1,
0.2643079, -1.544738, 2.045245, 1, 0, 0, 1, 1,
0.2699669, -0.6506379, 3.081661, 1, 0, 0, 1, 1,
0.2712595, 0.1538028, 2.137464, 1, 0, 0, 1, 1,
0.2720502, -0.02396551, 1.278062, 1, 0, 0, 1, 1,
0.2729324, -0.9450397, 2.764696, 1, 0, 0, 1, 1,
0.2738929, 1.657164, 1.297949, 0, 0, 0, 1, 1,
0.2801408, 1.153776, -0.6367395, 0, 0, 0, 1, 1,
0.2820177, 0.07258922, 0.7060946, 0, 0, 0, 1, 1,
0.2823354, 0.8112673, 0.2091826, 0, 0, 0, 1, 1,
0.2831111, 0.4982023, 0.3059165, 0, 0, 0, 1, 1,
0.2848504, -0.7001085, 0.4573323, 0, 0, 0, 1, 1,
0.2865969, -0.08305204, 0.975045, 0, 0, 0, 1, 1,
0.2884332, -1.018335, 3.426374, 1, 1, 1, 1, 1,
0.2915951, 0.7596617, 0.6074326, 1, 1, 1, 1, 1,
0.2950358, 0.4403367, -0.5967955, 1, 1, 1, 1, 1,
0.295252, 0.7071013, 0.1979503, 1, 1, 1, 1, 1,
0.29769, -0.6495821, 2.427002, 1, 1, 1, 1, 1,
0.2985445, -1.217136, 4.747611, 1, 1, 1, 1, 1,
0.3025811, 0.7240142, 1.31619, 1, 1, 1, 1, 1,
0.3066453, 0.4650791, 0.2119486, 1, 1, 1, 1, 1,
0.3135665, -1.019264, 3.660053, 1, 1, 1, 1, 1,
0.3146028, -0.08886319, 1.448724, 1, 1, 1, 1, 1,
0.3254153, -0.03509841, 0.7995878, 1, 1, 1, 1, 1,
0.3261903, -0.7245407, 3.043741, 1, 1, 1, 1, 1,
0.3345152, -0.7004467, 3.757562, 1, 1, 1, 1, 1,
0.3374758, 1.252977, -0.7019019, 1, 1, 1, 1, 1,
0.338271, 0.6997378, 0.4840733, 1, 1, 1, 1, 1,
0.3383097, -1.225347, 4.016423, 0, 0, 1, 1, 1,
0.338996, -0.4310547, 1.127077, 1, 0, 0, 1, 1,
0.3405615, -2.277045, 2.767558, 1, 0, 0, 1, 1,
0.3430623, -0.7340466, 2.596551, 1, 0, 0, 1, 1,
0.3452838, 1.419972, 1.600285, 1, 0, 0, 1, 1,
0.349328, 0.002363232, 1.127762, 1, 0, 0, 1, 1,
0.3515593, 1.188928, -0.01676082, 0, 0, 0, 1, 1,
0.3518911, -0.5554097, 3.41708, 0, 0, 0, 1, 1,
0.3527856, -0.7756917, 3.980484, 0, 0, 0, 1, 1,
0.3585154, -1.062007, 1.385728, 0, 0, 0, 1, 1,
0.3613805, 0.1065482, 1.928202, 0, 0, 0, 1, 1,
0.3619292, -0.01577656, 2.362677, 0, 0, 0, 1, 1,
0.3624316, 1.007169, 0.2131718, 0, 0, 0, 1, 1,
0.3631669, -0.9830031, 2.747463, 1, 1, 1, 1, 1,
0.364923, -1.167077, 4.361668, 1, 1, 1, 1, 1,
0.3671438, 0.03158409, 0.6887775, 1, 1, 1, 1, 1,
0.3735538, -0.8809025, 1.136776, 1, 1, 1, 1, 1,
0.3755663, -0.5670605, 2.25009, 1, 1, 1, 1, 1,
0.3798142, -0.3040359, 3.46023, 1, 1, 1, 1, 1,
0.3814981, -0.02177101, 2.224051, 1, 1, 1, 1, 1,
0.3825982, 0.3427038, 0.6608965, 1, 1, 1, 1, 1,
0.3913738, 0.4036501, 1.089708, 1, 1, 1, 1, 1,
0.3947956, 0.1443079, 0.8729105, 1, 1, 1, 1, 1,
0.4005513, 0.5430737, -0.3615185, 1, 1, 1, 1, 1,
0.4085544, -1.145682, 4.325199, 1, 1, 1, 1, 1,
0.4103278, -0.3660212, 3.533752, 1, 1, 1, 1, 1,
0.4104002, -1.406514, 2.167239, 1, 1, 1, 1, 1,
0.4114475, -0.6557817, 2.338399, 1, 1, 1, 1, 1,
0.4117498, 1.348685, 2.000253, 0, 0, 1, 1, 1,
0.4146039, -1.864549, 2.361952, 1, 0, 0, 1, 1,
0.4163323, 1.499132, 0.9446005, 1, 0, 0, 1, 1,
0.41871, -0.04385898, 0.546214, 1, 0, 0, 1, 1,
0.4225562, 0.7381371, 0.9687443, 1, 0, 0, 1, 1,
0.4244284, 0.4230196, -0.1890709, 1, 0, 0, 1, 1,
0.4310645, -0.5826319, 0.7671512, 0, 0, 0, 1, 1,
0.4328697, -1.322709, 2.848845, 0, 0, 0, 1, 1,
0.4336025, 0.0275057, 1.014598, 0, 0, 0, 1, 1,
0.4350653, 1.089666, 0.8764604, 0, 0, 0, 1, 1,
0.4356981, -0.3693903, 3.581469, 0, 0, 0, 1, 1,
0.4367556, 0.297451, 1.308071, 0, 0, 0, 1, 1,
0.4372248, -0.7511672, 3.273829, 0, 0, 0, 1, 1,
0.4409608, -1.488384, 3.53853, 1, 1, 1, 1, 1,
0.4410997, 0.7246195, 3.534547, 1, 1, 1, 1, 1,
0.4511659, 0.734925, -1.403206, 1, 1, 1, 1, 1,
0.4516936, -0.2820148, 1.776246, 1, 1, 1, 1, 1,
0.4580507, -0.8783006, 3.065854, 1, 1, 1, 1, 1,
0.4583791, 0.6563139, 2.164204, 1, 1, 1, 1, 1,
0.4588351, 0.6392791, -0.2147704, 1, 1, 1, 1, 1,
0.4588822, 0.8967621, -0.4099275, 1, 1, 1, 1, 1,
0.4601952, 0.06542139, 1.634587, 1, 1, 1, 1, 1,
0.463732, -1.10381, 4.891791, 1, 1, 1, 1, 1,
0.4680746, -0.1858649, 1.534472, 1, 1, 1, 1, 1,
0.4730603, -0.4096329, 1.192338, 1, 1, 1, 1, 1,
0.4754393, 0.752064, 2.182216, 1, 1, 1, 1, 1,
0.4759622, 0.3702456, 2.419605, 1, 1, 1, 1, 1,
0.4781926, 1.033249, -0.1694047, 1, 1, 1, 1, 1,
0.4811043, 0.2948161, 0.4888999, 0, 0, 1, 1, 1,
0.4818259, -0.7719043, 2.282338, 1, 0, 0, 1, 1,
0.4884474, -0.2204288, 0.4576876, 1, 0, 0, 1, 1,
0.4912292, 0.2675298, 1.690932, 1, 0, 0, 1, 1,
0.4930994, -1.57415, 2.413009, 1, 0, 0, 1, 1,
0.4940228, 3.253944, 0.724605, 1, 0, 0, 1, 1,
0.5050315, -0.3211973, 1.441102, 0, 0, 0, 1, 1,
0.5068104, -0.6284806, 2.097924, 0, 0, 0, 1, 1,
0.5093397, 0.8272659, 2.143208, 0, 0, 0, 1, 1,
0.517453, -1.82573, 3.821137, 0, 0, 0, 1, 1,
0.5193087, 0.4795815, 1.207157, 0, 0, 0, 1, 1,
0.5205064, -0.3569539, 0.2070872, 0, 0, 0, 1, 1,
0.5257622, 1.513041, -0.4074604, 0, 0, 0, 1, 1,
0.5273696, 0.7714379, 0.9078, 1, 1, 1, 1, 1,
0.5314923, 1.98092, -0.08915681, 1, 1, 1, 1, 1,
0.534016, -0.8837495, 3.03889, 1, 1, 1, 1, 1,
0.5374216, 0.6140399, 1.040208, 1, 1, 1, 1, 1,
0.5374956, -1.088893, 1.982164, 1, 1, 1, 1, 1,
0.5412002, 0.5132248, 0.9838372, 1, 1, 1, 1, 1,
0.5469773, 0.6766126, -0.6535301, 1, 1, 1, 1, 1,
0.5547161, 0.290506, 0.6695357, 1, 1, 1, 1, 1,
0.5580691, -0.1345791, 0.7606971, 1, 1, 1, 1, 1,
0.5645429, -2.011511, 3.236096, 1, 1, 1, 1, 1,
0.5666353, -0.4321363, 1.270079, 1, 1, 1, 1, 1,
0.5689004, 0.4505118, 1.505897, 1, 1, 1, 1, 1,
0.5691199, -0.5171482, 5.444547, 1, 1, 1, 1, 1,
0.5698766, 0.8031417, 1.91735, 1, 1, 1, 1, 1,
0.5714034, -1.280224, 2.862516, 1, 1, 1, 1, 1,
0.5770779, 0.07978924, 2.927968, 0, 0, 1, 1, 1,
0.5813262, 1.783863, -0.5996087, 1, 0, 0, 1, 1,
0.5825936, 0.4943392, 1.156953, 1, 0, 0, 1, 1,
0.5960174, 1.417968, 0.8253561, 1, 0, 0, 1, 1,
0.5971494, -1.960851, 1.587073, 1, 0, 0, 1, 1,
0.6024708, 0.3322614, -1.336197, 1, 0, 0, 1, 1,
0.6150877, -0.8506997, 1.142298, 0, 0, 0, 1, 1,
0.6152645, 0.227375, 2.607321, 0, 0, 0, 1, 1,
0.615343, 0.7723391, 1.329022, 0, 0, 0, 1, 1,
0.6156209, 2.379738, 0.547412, 0, 0, 0, 1, 1,
0.6172985, -0.009844351, 2.282744, 0, 0, 0, 1, 1,
0.6201505, -0.728328, 3.949394, 0, 0, 0, 1, 1,
0.6299397, 1.936482, -1.768405, 0, 0, 0, 1, 1,
0.6336582, -1.751153, 1.821633, 1, 1, 1, 1, 1,
0.6346559, 0.9437208, -0.4397063, 1, 1, 1, 1, 1,
0.6362096, -1.376913, 2.855648, 1, 1, 1, 1, 1,
0.6381335, -0.6675616, 1.960682, 1, 1, 1, 1, 1,
0.6385316, -0.03884322, 0.3094669, 1, 1, 1, 1, 1,
0.6391716, -0.7510519, 2.688612, 1, 1, 1, 1, 1,
0.6434819, -1.175176, 0.9573076, 1, 1, 1, 1, 1,
0.6462327, 0.9563306, 0.9551911, 1, 1, 1, 1, 1,
0.6479174, -1.170667, 2.724787, 1, 1, 1, 1, 1,
0.6482644, 2.988816, -1.394071, 1, 1, 1, 1, 1,
0.6567302, 0.6696003, 1.233683, 1, 1, 1, 1, 1,
0.6570986, -0.4075525, 2.322311, 1, 1, 1, 1, 1,
0.6607348, -0.1768839, 4.697622, 1, 1, 1, 1, 1,
0.6676405, -1.013413, 1.649806, 1, 1, 1, 1, 1,
0.672172, 0.9724877, 0.390402, 1, 1, 1, 1, 1,
0.6765818, 0.5156242, -0.07633761, 0, 0, 1, 1, 1,
0.6790243, -0.2028394, 2.846924, 1, 0, 0, 1, 1,
0.680909, 0.4389132, 1.803055, 1, 0, 0, 1, 1,
0.6814865, -0.1820869, 2.623618, 1, 0, 0, 1, 1,
0.695256, 0.8692891, -0.121637, 1, 0, 0, 1, 1,
0.6952701, -0.4834725, 1.21031, 1, 0, 0, 1, 1,
0.6966638, 0.4435756, 1.957346, 0, 0, 0, 1, 1,
0.7040719, -0.9991645, 2.034594, 0, 0, 0, 1, 1,
0.7063936, 1.294193, -0.4585438, 0, 0, 0, 1, 1,
0.7090636, -0.6461456, 2.401936, 0, 0, 0, 1, 1,
0.7128125, -0.3943028, 1.272057, 0, 0, 0, 1, 1,
0.7182306, -1.024101, 3.412194, 0, 0, 0, 1, 1,
0.718399, 0.7129897, -0.2898593, 0, 0, 0, 1, 1,
0.7188609, 0.2693401, 1.54039, 1, 1, 1, 1, 1,
0.7190009, -1.731647, 2.264588, 1, 1, 1, 1, 1,
0.7202075, 0.2307971, -0.3993417, 1, 1, 1, 1, 1,
0.7234236, -1.546858, 2.95561, 1, 1, 1, 1, 1,
0.7260799, -1.547603, 2.048999, 1, 1, 1, 1, 1,
0.7280085, -0.3646374, 2.727183, 1, 1, 1, 1, 1,
0.7291342, 0.390922, 2.32864, 1, 1, 1, 1, 1,
0.7312986, 1.786743, -0.5953331, 1, 1, 1, 1, 1,
0.7337863, 0.7767889, 0.9920703, 1, 1, 1, 1, 1,
0.7346798, -0.3432983, 2.496725, 1, 1, 1, 1, 1,
0.7352665, 0.4376534, 1.68644, 1, 1, 1, 1, 1,
0.7365621, -0.8167232, 1.306419, 1, 1, 1, 1, 1,
0.7419461, -0.2338449, 1.155843, 1, 1, 1, 1, 1,
0.7429492, -1.314793, 1.865649, 1, 1, 1, 1, 1,
0.7446862, -1.463139, 3.525005, 1, 1, 1, 1, 1,
0.7457286, -1.197914, 0.8166896, 0, 0, 1, 1, 1,
0.7495811, 0.2616231, 1.664712, 1, 0, 0, 1, 1,
0.761104, 0.5100703, 0.8371919, 1, 0, 0, 1, 1,
0.7674802, -0.1297966, 2.203449, 1, 0, 0, 1, 1,
0.7723647, -0.4207601, 0.5290935, 1, 0, 0, 1, 1,
0.7728249, -0.5863562, 2.395327, 1, 0, 0, 1, 1,
0.7827823, -0.6543527, 1.816592, 0, 0, 0, 1, 1,
0.7886001, 1.688922, -0.6315537, 0, 0, 0, 1, 1,
0.7898918, -0.5998428, 1.813681, 0, 0, 0, 1, 1,
0.7922696, -0.5369021, 3.25354, 0, 0, 0, 1, 1,
0.7926984, -1.542516, 1.342368, 0, 0, 0, 1, 1,
0.7935681, -1.246461, 2.120109, 0, 0, 0, 1, 1,
0.7959482, 0.6730068, -0.5883382, 0, 0, 0, 1, 1,
0.7980049, -1.226022, 3.090748, 1, 1, 1, 1, 1,
0.7992062, -0.922249, 3.93005, 1, 1, 1, 1, 1,
0.8004053, -0.4822223, 0.6228862, 1, 1, 1, 1, 1,
0.8041556, 0.01009701, 1.081705, 1, 1, 1, 1, 1,
0.8067591, -1.568086, 2.685404, 1, 1, 1, 1, 1,
0.8069293, -0.1518436, 1.267813, 1, 1, 1, 1, 1,
0.8071836, -0.3432514, 1.758178, 1, 1, 1, 1, 1,
0.8079169, 0.3848995, 0.5849854, 1, 1, 1, 1, 1,
0.8082737, 1.37356, -0.5993808, 1, 1, 1, 1, 1,
0.8084176, 1.510233, 1.265306, 1, 1, 1, 1, 1,
0.8129515, -1.560508, 1.666583, 1, 1, 1, 1, 1,
0.8151292, 0.2075875, 1.451194, 1, 1, 1, 1, 1,
0.8151757, 2.046816, 2.371494, 1, 1, 1, 1, 1,
0.8152004, -1.325541, 3.009877, 1, 1, 1, 1, 1,
0.8152462, -1.027653, 2.070977, 1, 1, 1, 1, 1,
0.8154245, 0.1899613, 0.5525368, 0, 0, 1, 1, 1,
0.8156908, -0.9559402, 1.011358, 1, 0, 0, 1, 1,
0.8187612, 0.9884808, 0.3848366, 1, 0, 0, 1, 1,
0.8332126, -0.358086, 1.316213, 1, 0, 0, 1, 1,
0.8518137, -0.8907771, 1.183171, 1, 0, 0, 1, 1,
0.8672039, 0.244603, 0.1637097, 1, 0, 0, 1, 1,
0.8747909, -1.080006, 2.220009, 0, 0, 0, 1, 1,
0.8786972, -0.4945276, 1.85374, 0, 0, 0, 1, 1,
0.8808991, -0.7251413, 1.914204, 0, 0, 0, 1, 1,
0.8845615, -0.8828555, 2.107013, 0, 0, 0, 1, 1,
0.8864027, -0.4739839, 1.843459, 0, 0, 0, 1, 1,
0.8891143, 2.270388, 2.587503, 0, 0, 0, 1, 1,
0.8891648, -0.3303564, 0.9535553, 0, 0, 0, 1, 1,
0.8902863, -0.9900932, 2.509399, 1, 1, 1, 1, 1,
0.8907981, -0.2643997, 0.9593667, 1, 1, 1, 1, 1,
0.8909723, 0.9872898, -1.538093, 1, 1, 1, 1, 1,
0.898274, -0.006664315, 3.731214, 1, 1, 1, 1, 1,
0.9015755, 2.220613, 1.571594, 1, 1, 1, 1, 1,
0.9092106, -1.609739, 2.26166, 1, 1, 1, 1, 1,
0.9103479, 0.006820615, 1.641562, 1, 1, 1, 1, 1,
0.9139603, -0.5680557, 1.013692, 1, 1, 1, 1, 1,
0.916341, -1.505002, 1.781786, 1, 1, 1, 1, 1,
0.9205356, -0.8756068, 3.437386, 1, 1, 1, 1, 1,
0.9223382, -0.8520865, 2.084461, 1, 1, 1, 1, 1,
0.9240825, 0.7001871, 1.350726, 1, 1, 1, 1, 1,
0.9243442, -0.3562523, 2.511976, 1, 1, 1, 1, 1,
0.9259089, 0.1657831, 0.1076855, 1, 1, 1, 1, 1,
0.9276556, 0.04436623, -1.014486, 1, 1, 1, 1, 1,
0.9360356, -2.179909, 3.801286, 0, 0, 1, 1, 1,
0.9403331, -0.3889356, 3.241126, 1, 0, 0, 1, 1,
0.9445648, -0.2767211, 2.59934, 1, 0, 0, 1, 1,
0.9523019, -1.296097, 3.91012, 1, 0, 0, 1, 1,
0.9535511, 1.118961, 1.849912, 1, 0, 0, 1, 1,
0.9655213, 1.575659, -0.0150784, 1, 0, 0, 1, 1,
0.9659579, 0.06737657, 0.9849327, 0, 0, 0, 1, 1,
0.971972, 0.07487477, 1.602519, 0, 0, 0, 1, 1,
0.9769846, 0.09719126, 1.521294, 0, 0, 0, 1, 1,
0.9840049, 0.3815616, 0.3831138, 0, 0, 0, 1, 1,
0.9878022, 0.2179835, 1.42493, 0, 0, 0, 1, 1,
0.9886815, 0.2628005, 0.02770884, 0, 0, 0, 1, 1,
0.9999983, -1.959642, 2.783562, 0, 0, 0, 1, 1,
1.009086, 0.4104956, 2.828383, 1, 1, 1, 1, 1,
1.009912, -0.08855355, 1.725368, 1, 1, 1, 1, 1,
1.014293, -0.5883288, 1.765212, 1, 1, 1, 1, 1,
1.029443, -0.09801771, 1.278551, 1, 1, 1, 1, 1,
1.037673, -0.006345587, 1.817824, 1, 1, 1, 1, 1,
1.045147, 0.1496552, 2.539858, 1, 1, 1, 1, 1,
1.045812, 0.8715781, 1.169832, 1, 1, 1, 1, 1,
1.047557, -1.468018, 3.088382, 1, 1, 1, 1, 1,
1.049412, -0.7721866, 3.018484, 1, 1, 1, 1, 1,
1.051069, -0.01828527, 1.905006, 1, 1, 1, 1, 1,
1.055864, -0.8340015, 0.7763957, 1, 1, 1, 1, 1,
1.058601, -0.2633588, 2.478576, 1, 1, 1, 1, 1,
1.059309, 1.390481, -0.8518413, 1, 1, 1, 1, 1,
1.069562, 0.01988796, 1.603198, 1, 1, 1, 1, 1,
1.073313, 1.05012, 2.063953, 1, 1, 1, 1, 1,
1.085226, 0.0191411, 0.3858057, 0, 0, 1, 1, 1,
1.086674, -0.8527538, 4.670815, 1, 0, 0, 1, 1,
1.086827, -0.324705, 2.449089, 1, 0, 0, 1, 1,
1.088698, 0.7439245, 0.8431957, 1, 0, 0, 1, 1,
1.100809, -0.8233364, 0.6828027, 1, 0, 0, 1, 1,
1.101325, -0.2052734, 2.625598, 1, 0, 0, 1, 1,
1.102078, 1.450354, -0.6558478, 0, 0, 0, 1, 1,
1.103271, -1.771577, 1.06712, 0, 0, 0, 1, 1,
1.103849, 0.3291828, 2.213455, 0, 0, 0, 1, 1,
1.109972, 0.1661401, 0.6724841, 0, 0, 0, 1, 1,
1.111623, -0.1479671, 0.2491374, 0, 0, 0, 1, 1,
1.114508, 0.3922797, 2.0901, 0, 0, 0, 1, 1,
1.114773, -2.047657, 3.981449, 0, 0, 0, 1, 1,
1.118117, 1.214692, 0.09535154, 1, 1, 1, 1, 1,
1.133306, 1.433815, 1.688645, 1, 1, 1, 1, 1,
1.134521, -1.023295, 2.470554, 1, 1, 1, 1, 1,
1.141276, -0.8501337, 2.543288, 1, 1, 1, 1, 1,
1.162099, -1.440769, 2.288802, 1, 1, 1, 1, 1,
1.167143, 1.430458, -0.1547208, 1, 1, 1, 1, 1,
1.167915, -0.06032037, 1.083903, 1, 1, 1, 1, 1,
1.173651, 1.60505, 0.1451191, 1, 1, 1, 1, 1,
1.180285, 2.226892, 1.860798, 1, 1, 1, 1, 1,
1.193692, 0.1741718, 0.3417231, 1, 1, 1, 1, 1,
1.212065, 0.3691472, 0.4488532, 1, 1, 1, 1, 1,
1.21467, 0.7469519, 0.7158771, 1, 1, 1, 1, 1,
1.215274, 1.160159, 0.2420564, 1, 1, 1, 1, 1,
1.217335, -0.690715, -0.7930921, 1, 1, 1, 1, 1,
1.225372, 0.03756544, 1.51269, 1, 1, 1, 1, 1,
1.227439, 1.243113, 0.1538898, 0, 0, 1, 1, 1,
1.235304, 1.875654, 1.849021, 1, 0, 0, 1, 1,
1.249031, -0.5865316, 3.452394, 1, 0, 0, 1, 1,
1.253439, 0.9164825, 1.410026, 1, 0, 0, 1, 1,
1.256492, -0.6268723, 2.19159, 1, 0, 0, 1, 1,
1.257024, 0.1662263, 0.3700853, 1, 0, 0, 1, 1,
1.259018, -0.4999245, 0.557578, 0, 0, 0, 1, 1,
1.260569, -0.3369064, 0.3988496, 0, 0, 0, 1, 1,
1.265061, -1.142657, 3.308974, 0, 0, 0, 1, 1,
1.269864, -0.4160382, 2.154313, 0, 0, 0, 1, 1,
1.272601, 0.5471306, 2.206531, 0, 0, 0, 1, 1,
1.275311, 0.2301174, 2.58412, 0, 0, 0, 1, 1,
1.277307, 0.4285084, 1.29137, 0, 0, 0, 1, 1,
1.283069, -0.6564041, 0.7788828, 1, 1, 1, 1, 1,
1.296113, 0.01773212, 1.690769, 1, 1, 1, 1, 1,
1.304775, -0.06616815, 0.2821872, 1, 1, 1, 1, 1,
1.321761, -0.03787759, 3.874527, 1, 1, 1, 1, 1,
1.334337, -0.0767361, -0.2877305, 1, 1, 1, 1, 1,
1.337895, -1.27444, 0.1058468, 1, 1, 1, 1, 1,
1.355118, -1.688893, 2.221323, 1, 1, 1, 1, 1,
1.371639, -0.1026134, 2.51513, 1, 1, 1, 1, 1,
1.372266, -1.015428, 2.455713, 1, 1, 1, 1, 1,
1.372777, 0.04904816, 0.004034027, 1, 1, 1, 1, 1,
1.377102, -0.09831292, 1.584259, 1, 1, 1, 1, 1,
1.377216, 1.249753, 1.117454, 1, 1, 1, 1, 1,
1.384887, -0.3148896, 2.968246, 1, 1, 1, 1, 1,
1.393136, 0.8679944, 0.4432478, 1, 1, 1, 1, 1,
1.394272, -1.657663, 3.089915, 1, 1, 1, 1, 1,
1.395902, 0.2785987, 3.583687, 0, 0, 1, 1, 1,
1.398519, -0.1537243, 1.115781, 1, 0, 0, 1, 1,
1.407261, -0.1388834, 1.071961, 1, 0, 0, 1, 1,
1.412162, -0.729382, 2.363205, 1, 0, 0, 1, 1,
1.413424, 0.3896327, 2.119775, 1, 0, 0, 1, 1,
1.419349, 1.409095, -2.020721, 1, 0, 0, 1, 1,
1.439578, 1.244228, 0.1732292, 0, 0, 0, 1, 1,
1.449996, -0.08383805, 1.36594, 0, 0, 0, 1, 1,
1.455912, -0.4652486, 3.310355, 0, 0, 0, 1, 1,
1.466619, 0.5166275, 0.556256, 0, 0, 0, 1, 1,
1.471176, -1.483192, 1.242955, 0, 0, 0, 1, 1,
1.478217, 1.311219, 0.293132, 0, 0, 0, 1, 1,
1.478544, -0.6412932, 0.5756755, 0, 0, 0, 1, 1,
1.487684, -1.237377, 2.226837, 1, 1, 1, 1, 1,
1.49268, 0.4345221, 2.801425, 1, 1, 1, 1, 1,
1.507869, 1.453119, 1.317834, 1, 1, 1, 1, 1,
1.510973, 0.1888207, 2.730326, 1, 1, 1, 1, 1,
1.515147, 0.8680796, 1.503105, 1, 1, 1, 1, 1,
1.516391, 0.7435532, 0.2683245, 1, 1, 1, 1, 1,
1.526914, -1.70317, 1.354912, 1, 1, 1, 1, 1,
1.528891, 0.4410872, -0.606814, 1, 1, 1, 1, 1,
1.531841, 0.5649282, -0.2897065, 1, 1, 1, 1, 1,
1.557661, 0.782275, 0.9742078, 1, 1, 1, 1, 1,
1.568416, 1.393829, 1.278669, 1, 1, 1, 1, 1,
1.568598, -0.3754199, 2.087525, 1, 1, 1, 1, 1,
1.580121, 0.09882445, 3.042872, 1, 1, 1, 1, 1,
1.587265, -0.9682337, 1.911228, 1, 1, 1, 1, 1,
1.597116, 1.105694, -0.1964037, 1, 1, 1, 1, 1,
1.604628, -1.213464, 5.349903, 0, 0, 1, 1, 1,
1.609392, -0.5064366, 1.538019, 1, 0, 0, 1, 1,
1.620803, 1.86421, 0.432188, 1, 0, 0, 1, 1,
1.651101, 0.7867803, 1.824265, 1, 0, 0, 1, 1,
1.673877, 0.9312848, 1.906273, 1, 0, 0, 1, 1,
1.679161, 1.356151, -0.4415732, 1, 0, 0, 1, 1,
1.679176, 1.987902, 2.482071, 0, 0, 0, 1, 1,
1.679707, 0.2015474, 3.03449, 0, 0, 0, 1, 1,
1.689007, 1.477374, 1.290548, 0, 0, 0, 1, 1,
1.693878, 0.9563832, 1.025955, 0, 0, 0, 1, 1,
1.694862, 1.960621, 0.7680181, 0, 0, 0, 1, 1,
1.697178, -3.223457, 3.528549, 0, 0, 0, 1, 1,
1.722155, -0.4190292, 0.4639672, 0, 0, 0, 1, 1,
1.73471, -0.4064385, 1.033081, 1, 1, 1, 1, 1,
1.74703, 1.293293, 1.832283, 1, 1, 1, 1, 1,
1.755805, 0.4994601, 2.891994, 1, 1, 1, 1, 1,
1.758101, -2.484599, 3.467734, 1, 1, 1, 1, 1,
1.788621, 0.3985338, 2.081439, 1, 1, 1, 1, 1,
1.792403, -0.2727497, 0.3761196, 1, 1, 1, 1, 1,
1.808129, 0.3235632, 1.384353, 1, 1, 1, 1, 1,
1.809966, -2.019995, 0.7905517, 1, 1, 1, 1, 1,
1.818875, 1.499688, 1.295002, 1, 1, 1, 1, 1,
1.819962, -1.778977, 0.4038547, 1, 1, 1, 1, 1,
1.844407, 0.5740069, -0.1439831, 1, 1, 1, 1, 1,
1.849606, -0.4095204, 1.915103, 1, 1, 1, 1, 1,
1.889684, 0.4779854, 2.427735, 1, 1, 1, 1, 1,
1.912354, 0.2084871, 4.039845, 1, 1, 1, 1, 1,
1.912705, 0.246168, 0.3505936, 1, 1, 1, 1, 1,
1.93769, -1.091252, 2.544298, 0, 0, 1, 1, 1,
1.966106, -1.009466, 0.5890232, 1, 0, 0, 1, 1,
2.062924, -0.8059807, 2.988951, 1, 0, 0, 1, 1,
2.067633, 0.3422319, 3.63833, 1, 0, 0, 1, 1,
2.083509, 0.6601663, 2.572854, 1, 0, 0, 1, 1,
2.102694, -0.5973059, 3.769798, 1, 0, 0, 1, 1,
2.106332, 0.04946761, 2.252626, 0, 0, 0, 1, 1,
2.115016, -1.506941, 1.177439, 0, 0, 0, 1, 1,
2.174044, 1.410834, 1.821949, 0, 0, 0, 1, 1,
2.236969, -0.1244907, 0.6246881, 0, 0, 0, 1, 1,
2.244332, -0.6887028, 1.87686, 0, 0, 0, 1, 1,
2.286184, 0.1001672, 1.758094, 0, 0, 0, 1, 1,
2.308503, -0.4014061, -0.5176706, 0, 0, 0, 1, 1,
2.389777, -0.2091804, 2.025322, 1, 1, 1, 1, 1,
2.410911, 0.523856, 0.7278668, 1, 1, 1, 1, 1,
2.417346, -1.280105, 1.736147, 1, 1, 1, 1, 1,
2.597579, 0.8379039, 0.6855296, 1, 1, 1, 1, 1,
2.675349, -0.0728161, 2.02796, 1, 1, 1, 1, 1,
2.94815, -1.086687, 3.730152, 1, 1, 1, 1, 1,
3.220968, 0.3856051, 1.018579, 1, 1, 1, 1, 1
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
var radius = 9.914654;
var distance = 34.8248;
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
mvMatrix.translate( 0.0223999, -0.01524401, -0.1480832 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.8248);
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
