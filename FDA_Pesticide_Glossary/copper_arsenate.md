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
-3.46044, -0.5819437, -2.103741, 1, 0, 0, 1,
-3.123722, 0.07751976, -2.016748, 1, 0.007843138, 0, 1,
-2.913875, 0.1906992, -2.143455, 1, 0.01176471, 0, 1,
-2.734241, -0.161772, -1.653543, 1, 0.01960784, 0, 1,
-2.575751, -1.104393, -0.9390785, 1, 0.02352941, 0, 1,
-2.5634, 1.707063, -0.1121612, 1, 0.03137255, 0, 1,
-2.52204, -1.305372, -1.354738, 1, 0.03529412, 0, 1,
-2.40539, 0.253119, -2.259259, 1, 0.04313726, 0, 1,
-2.377376, -0.2562453, -2.041522, 1, 0.04705882, 0, 1,
-2.345351, -0.2616684, -1.959748, 1, 0.05490196, 0, 1,
-2.314008, 1.573471, -0.3137752, 1, 0.05882353, 0, 1,
-2.298013, -1.118187, -1.896743, 1, 0.06666667, 0, 1,
-2.267636, -1.748075, -3.181478, 1, 0.07058824, 0, 1,
-2.212282, 0.9165019, -0.2328171, 1, 0.07843138, 0, 1,
-2.210564, -0.6587005, -3.010781, 1, 0.08235294, 0, 1,
-2.201982, -2.524926, -2.984442, 1, 0.09019608, 0, 1,
-2.135652, -0.4747245, -1.260194, 1, 0.09411765, 0, 1,
-2.132604, -0.07112192, -1.246713, 1, 0.1019608, 0, 1,
-2.13006, 0.4941429, -1.231625, 1, 0.1098039, 0, 1,
-2.124682, 0.7376818, -2.983736, 1, 0.1137255, 0, 1,
-2.100005, -0.4498938, -0.9185552, 1, 0.1215686, 0, 1,
-2.061383, -0.2693742, -1.329117, 1, 0.1254902, 0, 1,
-2.039147, 0.9283066, -1.350258, 1, 0.1333333, 0, 1,
-2.029703, 1.928993, -0.6731891, 1, 0.1372549, 0, 1,
-2.02866, 0.937595, -1.356949, 1, 0.145098, 0, 1,
-1.996944, -0.01704462, -0.986974, 1, 0.1490196, 0, 1,
-1.960176, -1.127778, -3.340533, 1, 0.1568628, 0, 1,
-1.953497, 1.433098, -2.622472, 1, 0.1607843, 0, 1,
-1.878376, 1.146986, -2.032925, 1, 0.1686275, 0, 1,
-1.872801, 0.2272805, -2.157161, 1, 0.172549, 0, 1,
-1.855065, -0.6810429, -1.493468, 1, 0.1803922, 0, 1,
-1.838538, 1.031917, -3.101091, 1, 0.1843137, 0, 1,
-1.835591, -0.9713128, -2.206377, 1, 0.1921569, 0, 1,
-1.818356, -0.2120312, -1.999462, 1, 0.1960784, 0, 1,
-1.791064, 0.9838085, -1.458612, 1, 0.2039216, 0, 1,
-1.7855, -0.151465, -1.190666, 1, 0.2117647, 0, 1,
-1.782761, 2.977522, -1.266011, 1, 0.2156863, 0, 1,
-1.779195, 0.4638128, -2.868006, 1, 0.2235294, 0, 1,
-1.769459, -0.4445881, -3.280182, 1, 0.227451, 0, 1,
-1.761239, -0.1774129, -3.482856, 1, 0.2352941, 0, 1,
-1.754549, -0.5934503, -4.470725, 1, 0.2392157, 0, 1,
-1.738896, -0.1243048, -1.920213, 1, 0.2470588, 0, 1,
-1.733489, 2.123656, -0.3298457, 1, 0.2509804, 0, 1,
-1.729875, 1.212549, -0.3388392, 1, 0.2588235, 0, 1,
-1.728227, -1.050566, -0.5667972, 1, 0.2627451, 0, 1,
-1.725634, 0.2494715, -2.23047, 1, 0.2705882, 0, 1,
-1.703724, -0.4989011, -0.3796999, 1, 0.2745098, 0, 1,
-1.69793, -1.878889, -1.653986, 1, 0.282353, 0, 1,
-1.689316, -1.275011, -2.126363, 1, 0.2862745, 0, 1,
-1.670998, 1.152466, -0.4501996, 1, 0.2941177, 0, 1,
-1.669904, -0.8384873, -2.242978, 1, 0.3019608, 0, 1,
-1.666678, 0.3455054, -1.580764, 1, 0.3058824, 0, 1,
-1.663031, 0.4759918, -0.01792483, 1, 0.3137255, 0, 1,
-1.648457, -0.9568104, -2.780386, 1, 0.3176471, 0, 1,
-1.642235, 0.3312277, -1.639525, 1, 0.3254902, 0, 1,
-1.63631, -0.5507631, -2.955475, 1, 0.3294118, 0, 1,
-1.628624, -1.265708, -1.547148, 1, 0.3372549, 0, 1,
-1.616905, 1.50256, -0.1783666, 1, 0.3411765, 0, 1,
-1.605461, 0.7183016, -1.409669, 1, 0.3490196, 0, 1,
-1.58741, -0.1056018, -2.060705, 1, 0.3529412, 0, 1,
-1.570584, -0.6945247, -0.7505515, 1, 0.3607843, 0, 1,
-1.548157, 0.8315466, -1.43917, 1, 0.3647059, 0, 1,
-1.54582, -0.7157586, -3.29162, 1, 0.372549, 0, 1,
-1.535035, -0.6791922, -1.177814, 1, 0.3764706, 0, 1,
-1.526937, 0.5098482, -1.285851, 1, 0.3843137, 0, 1,
-1.5192, -1.306409, -2.433568, 1, 0.3882353, 0, 1,
-1.512881, -0.1976242, -1.790682, 1, 0.3960784, 0, 1,
-1.51117, -0.3915037, -1.423783, 1, 0.4039216, 0, 1,
-1.506113, -1.242504, -2.407772, 1, 0.4078431, 0, 1,
-1.502094, 1.394719, -1.750654, 1, 0.4156863, 0, 1,
-1.498821, 0.2275195, -0.8324544, 1, 0.4196078, 0, 1,
-1.493758, -0.3882375, -2.441413, 1, 0.427451, 0, 1,
-1.482147, 0.9971692, -2.013443, 1, 0.4313726, 0, 1,
-1.481311, 0.9528477, -1.704322, 1, 0.4392157, 0, 1,
-1.468534, 1.23561, -0.9170853, 1, 0.4431373, 0, 1,
-1.456776, -0.06413847, -0.4851538, 1, 0.4509804, 0, 1,
-1.432824, 0.4882244, -0.6440074, 1, 0.454902, 0, 1,
-1.423329, -1.215696, -2.517612, 1, 0.4627451, 0, 1,
-1.419575, 0.4774672, 0.1596788, 1, 0.4666667, 0, 1,
-1.415852, 0.9240522, -2.699579, 1, 0.4745098, 0, 1,
-1.412944, -0.7520269, -0.9253467, 1, 0.4784314, 0, 1,
-1.410378, 0.1621423, -2.191321, 1, 0.4862745, 0, 1,
-1.408457, -0.6312439, -1.292958, 1, 0.4901961, 0, 1,
-1.376112, 0.3894066, -1.765646, 1, 0.4980392, 0, 1,
-1.368736, -2.504077, -1.434679, 1, 0.5058824, 0, 1,
-1.362692, 0.3231607, -1.827993, 1, 0.509804, 0, 1,
-1.342672, -0.4135062, -0.9727907, 1, 0.5176471, 0, 1,
-1.339079, 1.266312, -0.8538973, 1, 0.5215687, 0, 1,
-1.331915, -0.1664164, -1.163559, 1, 0.5294118, 0, 1,
-1.331303, -0.167489, -1.068757, 1, 0.5333334, 0, 1,
-1.32669, -0.3072131, -1.095626, 1, 0.5411765, 0, 1,
-1.320526, -0.3228622, -3.65123, 1, 0.5450981, 0, 1,
-1.313989, -1.372527, -0.9182355, 1, 0.5529412, 0, 1,
-1.304422, -1.471818, -2.90323, 1, 0.5568628, 0, 1,
-1.298965, -0.7449946, -4.005726, 1, 0.5647059, 0, 1,
-1.286381, -0.6433299, -2.250819, 1, 0.5686275, 0, 1,
-1.280868, -0.6037826, -1.502924, 1, 0.5764706, 0, 1,
-1.276972, 0.8554932, -0.1282303, 1, 0.5803922, 0, 1,
-1.275846, -1.125756, -2.459121, 1, 0.5882353, 0, 1,
-1.273266, 0.02269007, -2.132338, 1, 0.5921569, 0, 1,
-1.261073, 1.137812, -1.082703, 1, 0.6, 0, 1,
-1.233068, 0.8222223, -2.08496, 1, 0.6078432, 0, 1,
-1.225691, -0.3946299, -1.161036, 1, 0.6117647, 0, 1,
-1.218103, 0.9084397, 0.314856, 1, 0.6196079, 0, 1,
-1.216936, 0.914174, -0.9325198, 1, 0.6235294, 0, 1,
-1.210137, -0.3918535, -1.637398, 1, 0.6313726, 0, 1,
-1.203925, -0.880347, -3.202833, 1, 0.6352941, 0, 1,
-1.202045, 0.1177845, -2.064328, 1, 0.6431373, 0, 1,
-1.200102, 0.6071529, -1.45276, 1, 0.6470588, 0, 1,
-1.197683, -0.1819499, -1.614372, 1, 0.654902, 0, 1,
-1.195026, -1.208942, -3.162235, 1, 0.6588235, 0, 1,
-1.190809, -1.418832, -3.182079, 1, 0.6666667, 0, 1,
-1.185638, -2.23541, -3.58022, 1, 0.6705883, 0, 1,
-1.182299, -1.211075, -1.424979, 1, 0.6784314, 0, 1,
-1.180954, 0.934646, -1.423622, 1, 0.682353, 0, 1,
-1.1743, 0.5458173, -0.198732, 1, 0.6901961, 0, 1,
-1.174288, -0.09356093, 0.03252107, 1, 0.6941177, 0, 1,
-1.173215, -0.2013802, -3.147565, 1, 0.7019608, 0, 1,
-1.170158, -0.8821861, -2.406518, 1, 0.7098039, 0, 1,
-1.158965, 0.39212, -1.312788, 1, 0.7137255, 0, 1,
-1.154303, -0.2571409, -2.728209, 1, 0.7215686, 0, 1,
-1.153641, 1.092942, -2.7642, 1, 0.7254902, 0, 1,
-1.152579, -0.462863, -1.095208, 1, 0.7333333, 0, 1,
-1.152083, 1.473502, -0.9022857, 1, 0.7372549, 0, 1,
-1.150065, 0.5128667, -1.647302, 1, 0.7450981, 0, 1,
-1.147387, -0.7142636, -1.604248, 1, 0.7490196, 0, 1,
-1.145846, 0.5013658, -1.859089, 1, 0.7568628, 0, 1,
-1.140206, -0.6875902, -1.529441, 1, 0.7607843, 0, 1,
-1.134841, 1.889238, 0.7003536, 1, 0.7686275, 0, 1,
-1.131678, -1.549045, -2.046223, 1, 0.772549, 0, 1,
-1.126163, 0.2712855, -1.858566, 1, 0.7803922, 0, 1,
-1.12259, -0.6815131, -2.629226, 1, 0.7843137, 0, 1,
-1.118837, 0.6957145, -1.302679, 1, 0.7921569, 0, 1,
-1.114324, -0.9808511, -1.485414, 1, 0.7960784, 0, 1,
-1.098791, -0.02039439, -2.543726, 1, 0.8039216, 0, 1,
-1.098352, 1.380714, 0.07920289, 1, 0.8117647, 0, 1,
-1.090254, 1.331199, -2.78015, 1, 0.8156863, 0, 1,
-1.089939, 0.1360025, -1.315502, 1, 0.8235294, 0, 1,
-1.089087, 0.6586828, -0.7869918, 1, 0.827451, 0, 1,
-1.088602, -1.122737, -3.047264, 1, 0.8352941, 0, 1,
-1.088247, 1.403323, -0.5654067, 1, 0.8392157, 0, 1,
-1.08419, -0.1362731, -3.383255, 1, 0.8470588, 0, 1,
-1.082152, -0.222932, -1.327497, 1, 0.8509804, 0, 1,
-1.081429, 2.248793, -0.1724152, 1, 0.8588235, 0, 1,
-1.080425, 0.6132922, -1.702373, 1, 0.8627451, 0, 1,
-1.078908, -1.050393, -1.545259, 1, 0.8705882, 0, 1,
-1.076795, -0.02326573, -2.276942, 1, 0.8745098, 0, 1,
-1.064219, 0.2865489, -1.565119, 1, 0.8823529, 0, 1,
-1.059167, 0.1267876, -1.602971, 1, 0.8862745, 0, 1,
-1.059011, -0.2687862, -1.40675, 1, 0.8941177, 0, 1,
-1.055554, -0.23621, -2.648968, 1, 0.8980392, 0, 1,
-1.049438, -0.9120103, -3.211047, 1, 0.9058824, 0, 1,
-1.044034, 0.2480386, -1.565242, 1, 0.9137255, 0, 1,
-1.039908, -0.4627698, -1.365692, 1, 0.9176471, 0, 1,
-1.037424, 0.05141111, -0.701708, 1, 0.9254902, 0, 1,
-1.029718, 1.128738, -0.480664, 1, 0.9294118, 0, 1,
-1.022775, -1.331676, -2.266201, 1, 0.9372549, 0, 1,
-1.019993, -0.9911131, -2.177387, 1, 0.9411765, 0, 1,
-1.019714, 0.8530962, -0.5257665, 1, 0.9490196, 0, 1,
-1.018557, 0.5407543, -1.483846, 1, 0.9529412, 0, 1,
-1.009209, 0.6556084, -1.16504, 1, 0.9607843, 0, 1,
-1.001511, -0.1535722, -1.771012, 1, 0.9647059, 0, 1,
-0.9969651, -0.266727, -0.03973516, 1, 0.972549, 0, 1,
-0.9947455, 0.7728955, -2.297616, 1, 0.9764706, 0, 1,
-0.9823949, -0.6332246, -2.37475, 1, 0.9843137, 0, 1,
-0.9655635, -0.05975717, -2.007109, 1, 0.9882353, 0, 1,
-0.9622927, -0.4044091, -1.552888, 1, 0.9960784, 0, 1,
-0.9513263, -0.2290927, -2.391759, 0.9960784, 1, 0, 1,
-0.9460428, 0.8439236, 0.2882801, 0.9921569, 1, 0, 1,
-0.9412597, -2.275254, -4.123408, 0.9843137, 1, 0, 1,
-0.9384388, -0.01737769, -2.58725, 0.9803922, 1, 0, 1,
-0.9346092, 0.02283619, -2.848798, 0.972549, 1, 0, 1,
-0.9345277, 0.9368463, -0.7728895, 0.9686275, 1, 0, 1,
-0.9296079, 0.5872665, -0.2775445, 0.9607843, 1, 0, 1,
-0.9150719, 0.3861011, -2.03362, 0.9568627, 1, 0, 1,
-0.9146999, 0.9576612, -0.4646079, 0.9490196, 1, 0, 1,
-0.9107891, -0.2473111, -1.01364, 0.945098, 1, 0, 1,
-0.9039797, 1.34, -0.6426515, 0.9372549, 1, 0, 1,
-0.9006457, 0.129906, 0.9330956, 0.9333333, 1, 0, 1,
-0.8999843, 0.4724055, -0.08803941, 0.9254902, 1, 0, 1,
-0.8997794, -1.956753, -2.45042, 0.9215686, 1, 0, 1,
-0.8973028, 0.2195212, -1.871572, 0.9137255, 1, 0, 1,
-0.8893843, -0.745266, -1.921767, 0.9098039, 1, 0, 1,
-0.888545, 1.370686, 1.368542, 0.9019608, 1, 0, 1,
-0.8873943, 0.5948047, -0.3916189, 0.8941177, 1, 0, 1,
-0.8870884, 0.6523989, -1.377824, 0.8901961, 1, 0, 1,
-0.8804469, -1.926058, -2.300619, 0.8823529, 1, 0, 1,
-0.8760915, -0.2157212, -0.4612261, 0.8784314, 1, 0, 1,
-0.8754943, 0.6068574, 0.2211663, 0.8705882, 1, 0, 1,
-0.8692481, 0.2347919, 0.2087345, 0.8666667, 1, 0, 1,
-0.8691092, -0.6814381, -2.748675, 0.8588235, 1, 0, 1,
-0.858455, -0.3092203, -2.50341, 0.854902, 1, 0, 1,
-0.8548009, 1.109754, 0.8590407, 0.8470588, 1, 0, 1,
-0.8511202, -0.1241249, -1.244613, 0.8431373, 1, 0, 1,
-0.8438159, 0.1688619, 0.193809, 0.8352941, 1, 0, 1,
-0.8417256, 0.8378039, 0.2306177, 0.8313726, 1, 0, 1,
-0.8412305, 0.07764497, 0.4551087, 0.8235294, 1, 0, 1,
-0.8398636, 0.9441476, 1.09259, 0.8196079, 1, 0, 1,
-0.8311542, 0.2215794, 0.2270894, 0.8117647, 1, 0, 1,
-0.8282574, -0.4473234, -1.511958, 0.8078431, 1, 0, 1,
-0.8217657, -0.9879611, -2.443432, 0.8, 1, 0, 1,
-0.8187805, -1.550096, -1.672343, 0.7921569, 1, 0, 1,
-0.8110206, 0.8579454, -1.639605, 0.7882353, 1, 0, 1,
-0.8015841, -1.694953, -4.244372, 0.7803922, 1, 0, 1,
-0.7983062, -1.598319, -1.468166, 0.7764706, 1, 0, 1,
-0.7923954, 0.160885, -0.7713879, 0.7686275, 1, 0, 1,
-0.7907902, 0.1205086, -2.335553, 0.7647059, 1, 0, 1,
-0.7840329, 1.184835, -0.643891, 0.7568628, 1, 0, 1,
-0.7788441, 0.7759585, -1.717878, 0.7529412, 1, 0, 1,
-0.7771391, 0.8085623, -1.021681, 0.7450981, 1, 0, 1,
-0.7771359, 1.425022, 0.8533186, 0.7411765, 1, 0, 1,
-0.7727044, -1.187988, -2.127987, 0.7333333, 1, 0, 1,
-0.7657937, -0.3407241, -2.614434, 0.7294118, 1, 0, 1,
-0.7595856, -0.6108788, -2.11988, 0.7215686, 1, 0, 1,
-0.7595745, 0.4592506, 0.007213031, 0.7176471, 1, 0, 1,
-0.7545961, 1.465553, -1.056141, 0.7098039, 1, 0, 1,
-0.7425988, 0.2926874, 0.2683537, 0.7058824, 1, 0, 1,
-0.7340842, -0.6856411, -2.045452, 0.6980392, 1, 0, 1,
-0.7326782, 0.8489508, -1.555136, 0.6901961, 1, 0, 1,
-0.7324426, 0.8829969, -1.374592, 0.6862745, 1, 0, 1,
-0.7309209, -1.020908, -0.8206779, 0.6784314, 1, 0, 1,
-0.7308624, -0.5511686, -2.432525, 0.6745098, 1, 0, 1,
-0.7301067, -0.8027013, -2.578684, 0.6666667, 1, 0, 1,
-0.7158108, -0.7749994, -3.329544, 0.6627451, 1, 0, 1,
-0.7074999, -0.202671, -2.672982, 0.654902, 1, 0, 1,
-0.7049426, 0.784489, 0.01401681, 0.6509804, 1, 0, 1,
-0.7001453, -0.614536, -2.183561, 0.6431373, 1, 0, 1,
-0.6995108, -0.255733, -0.7919759, 0.6392157, 1, 0, 1,
-0.697324, 1.148147, -0.2070974, 0.6313726, 1, 0, 1,
-0.6967545, -0.08562801, -0.5484327, 0.627451, 1, 0, 1,
-0.6956046, -0.4270142, -1.187767, 0.6196079, 1, 0, 1,
-0.6948169, 0.1428152, 0.6515281, 0.6156863, 1, 0, 1,
-0.6875668, 0.2126062, -3.134172, 0.6078432, 1, 0, 1,
-0.6857653, 0.9684882, -2.655602, 0.6039216, 1, 0, 1,
-0.6840127, -1.062705, -1.767782, 0.5960785, 1, 0, 1,
-0.6830831, 0.7308351, 1.526157, 0.5882353, 1, 0, 1,
-0.6825473, -0.7055615, -1.795205, 0.5843138, 1, 0, 1,
-0.6816046, 1.438063, -0.2053744, 0.5764706, 1, 0, 1,
-0.6762668, 0.9260771, -0.3667402, 0.572549, 1, 0, 1,
-0.6760046, 0.6593727, 0.8678117, 0.5647059, 1, 0, 1,
-0.6720871, 1.175547, -2.074767, 0.5607843, 1, 0, 1,
-0.665161, 0.1294302, 1.045969, 0.5529412, 1, 0, 1,
-0.663626, 0.4662181, -1.218216, 0.5490196, 1, 0, 1,
-0.6619211, 1.284557, 0.222834, 0.5411765, 1, 0, 1,
-0.660356, -0.7731206, -4.611776, 0.5372549, 1, 0, 1,
-0.6574715, -0.2785764, -3.285792, 0.5294118, 1, 0, 1,
-0.6567557, -0.1941464, -2.148293, 0.5254902, 1, 0, 1,
-0.6543565, 0.111395, -2.907633, 0.5176471, 1, 0, 1,
-0.6534823, 1.214906, -1.123771, 0.5137255, 1, 0, 1,
-0.6473929, 2.400121, -0.7355952, 0.5058824, 1, 0, 1,
-0.641785, 0.3507175, -1.945055, 0.5019608, 1, 0, 1,
-0.6408803, -0.03168143, -1.240623, 0.4941176, 1, 0, 1,
-0.6343129, 0.4377928, -0.9059201, 0.4862745, 1, 0, 1,
-0.6320412, -0.2623675, -0.6666895, 0.4823529, 1, 0, 1,
-0.6302505, -0.3825624, -2.396496, 0.4745098, 1, 0, 1,
-0.622678, 0.8583868, -0.2627949, 0.4705882, 1, 0, 1,
-0.6223333, -0.9921243, -2.717408, 0.4627451, 1, 0, 1,
-0.6108872, -0.3328805, -2.453378, 0.4588235, 1, 0, 1,
-0.6106499, 0.9311306, -0.5052463, 0.4509804, 1, 0, 1,
-0.6076949, -1.154368, -4.343894, 0.4470588, 1, 0, 1,
-0.6006406, 0.7237292, 0.1622438, 0.4392157, 1, 0, 1,
-0.5996655, -2.27555, -3.98063, 0.4352941, 1, 0, 1,
-0.5987424, 0.887951, -2.093658, 0.427451, 1, 0, 1,
-0.5887021, -0.6159915, -4.144024, 0.4235294, 1, 0, 1,
-0.5875364, -0.5505939, -2.444191, 0.4156863, 1, 0, 1,
-0.5849705, -1.146643, -2.933413, 0.4117647, 1, 0, 1,
-0.5847989, -1.230443, -3.296462, 0.4039216, 1, 0, 1,
-0.5823008, 0.7397246, 0.8034449, 0.3960784, 1, 0, 1,
-0.580803, 0.1565995, -1.39207, 0.3921569, 1, 0, 1,
-0.5763988, -0.4272062, -1.659072, 0.3843137, 1, 0, 1,
-0.5757658, -0.4885479, -4.530012, 0.3803922, 1, 0, 1,
-0.5746562, -0.361471, -4.072206, 0.372549, 1, 0, 1,
-0.5741623, -0.8185166, -2.188425, 0.3686275, 1, 0, 1,
-0.5730762, -0.3624038, -3.542404, 0.3607843, 1, 0, 1,
-0.5702636, 1.20858, -1.159777, 0.3568628, 1, 0, 1,
-0.5700547, -0.9703887, -0.4515527, 0.3490196, 1, 0, 1,
-0.5597538, 0.5109181, 1.141445, 0.345098, 1, 0, 1,
-0.5588118, 1.389391, 0.871645, 0.3372549, 1, 0, 1,
-0.556998, 0.7682444, -1.103843, 0.3333333, 1, 0, 1,
-0.5562591, -1.361729, -2.617776, 0.3254902, 1, 0, 1,
-0.5522518, -1.023948, -1.264289, 0.3215686, 1, 0, 1,
-0.5500214, 0.6448441, -0.9071391, 0.3137255, 1, 0, 1,
-0.5499807, -0.01560087, -1.274813, 0.3098039, 1, 0, 1,
-0.5469636, -0.4452927, -2.050457, 0.3019608, 1, 0, 1,
-0.5449666, 0.7926474, -0.700613, 0.2941177, 1, 0, 1,
-0.5363681, -1.322266, -2.067497, 0.2901961, 1, 0, 1,
-0.5357289, -0.6500891, -2.848545, 0.282353, 1, 0, 1,
-0.5354264, -1.966656, -1.084147, 0.2784314, 1, 0, 1,
-0.5330649, -0.8676916, -2.774626, 0.2705882, 1, 0, 1,
-0.5296789, -1.731187, -3.308527, 0.2666667, 1, 0, 1,
-0.5281766, -0.374475, -1.343087, 0.2588235, 1, 0, 1,
-0.5276546, -0.8534386, -1.523469, 0.254902, 1, 0, 1,
-0.5239419, 2.620902, -0.2005173, 0.2470588, 1, 0, 1,
-0.5217393, 0.8390747, -1.361902, 0.2431373, 1, 0, 1,
-0.5210365, 0.2924218, -2.546125, 0.2352941, 1, 0, 1,
-0.5198483, 0.6440567, -1.418669, 0.2313726, 1, 0, 1,
-0.5166553, -1.090746, -2.254518, 0.2235294, 1, 0, 1,
-0.5166029, 0.1368217, -1.906765, 0.2196078, 1, 0, 1,
-0.5151149, -1.241276, -2.260386, 0.2117647, 1, 0, 1,
-0.5130581, -0.2063708, -2.714602, 0.2078431, 1, 0, 1,
-0.5019023, -0.7167591, -2.044475, 0.2, 1, 0, 1,
-0.5018641, 1.219665, -2.735854, 0.1921569, 1, 0, 1,
-0.4917097, 1.382053, -0.9139827, 0.1882353, 1, 0, 1,
-0.4910774, -0.9760103, -1.707827, 0.1803922, 1, 0, 1,
-0.4892986, -1.582792, -1.8073, 0.1764706, 1, 0, 1,
-0.4874743, -0.3360595, -1.63584, 0.1686275, 1, 0, 1,
-0.4863045, -0.4570051, -4.351291, 0.1647059, 1, 0, 1,
-0.4816758, -0.6217896, -2.457117, 0.1568628, 1, 0, 1,
-0.4801075, 0.7162194, -0.5963842, 0.1529412, 1, 0, 1,
-0.4798984, -0.5112464, -2.356275, 0.145098, 1, 0, 1,
-0.4781442, -0.3737527, -1.085801, 0.1411765, 1, 0, 1,
-0.4747315, 0.41175, -0.1851401, 0.1333333, 1, 0, 1,
-0.4687929, 1.38126, 0.5969153, 0.1294118, 1, 0, 1,
-0.4672818, 0.7814193, -1.285253, 0.1215686, 1, 0, 1,
-0.4648069, 0.5649282, -0.4617633, 0.1176471, 1, 0, 1,
-0.4579588, -0.6088636, -1.758791, 0.1098039, 1, 0, 1,
-0.4480582, -1.513421, -2.173847, 0.1058824, 1, 0, 1,
-0.4464149, -0.40262, -2.533829, 0.09803922, 1, 0, 1,
-0.4416926, -0.05319297, -1.595715, 0.09019608, 1, 0, 1,
-0.4406324, -1.21161, -2.930146, 0.08627451, 1, 0, 1,
-0.4355194, -0.9366572, -2.823173, 0.07843138, 1, 0, 1,
-0.4353695, 0.9951901, 1.903663, 0.07450981, 1, 0, 1,
-0.4267259, -0.8405246, -2.958757, 0.06666667, 1, 0, 1,
-0.4143955, -0.7323836, -1.811473, 0.0627451, 1, 0, 1,
-0.4084112, 0.04799328, -2.869258, 0.05490196, 1, 0, 1,
-0.4077622, -1.251412, -2.815932, 0.05098039, 1, 0, 1,
-0.4075499, 0.7134538, -0.2939692, 0.04313726, 1, 0, 1,
-0.4065908, -0.2155489, -0.6373451, 0.03921569, 1, 0, 1,
-0.4064018, 0.7651422, -1.363996, 0.03137255, 1, 0, 1,
-0.4054671, -2.017255, -1.830655, 0.02745098, 1, 0, 1,
-0.4004947, -1.262572, -2.259627, 0.01960784, 1, 0, 1,
-0.396769, 0.3666299, -1.894296, 0.01568628, 1, 0, 1,
-0.3962697, -0.798885, -1.741195, 0.007843138, 1, 0, 1,
-0.395628, -0.3474692, -2.254928, 0.003921569, 1, 0, 1,
-0.3948072, 0.3887387, -1.517567, 0, 1, 0.003921569, 1,
-0.3943066, 1.683578, 0.7343686, 0, 1, 0.01176471, 1,
-0.3911101, 1.176992, 0.3783801, 0, 1, 0.01568628, 1,
-0.3905089, 0.3366754, -0.4443395, 0, 1, 0.02352941, 1,
-0.3814202, -1.185272, -2.375187, 0, 1, 0.02745098, 1,
-0.3789635, -1.558573, -2.647637, 0, 1, 0.03529412, 1,
-0.3762593, 0.001739353, -0.05235023, 0, 1, 0.03921569, 1,
-0.37512, -0.4062518, -1.141338, 0, 1, 0.04705882, 1,
-0.3748105, 1.786826, -0.4170802, 0, 1, 0.05098039, 1,
-0.3729295, -1.047985, -3.144816, 0, 1, 0.05882353, 1,
-0.3651633, -0.9166824, -2.710558, 0, 1, 0.0627451, 1,
-0.36187, -0.04380956, -1.693774, 0, 1, 0.07058824, 1,
-0.358811, -1.53674, -4.062707, 0, 1, 0.07450981, 1,
-0.3484402, 0.3206924, -0.9701555, 0, 1, 0.08235294, 1,
-0.3463989, 0.7237889, -1.061214, 0, 1, 0.08627451, 1,
-0.3463264, -0.7382146, -3.694141, 0, 1, 0.09411765, 1,
-0.3461725, 0.2988352, 0.1510098, 0, 1, 0.1019608, 1,
-0.3454573, -0.90569, -0.7918113, 0, 1, 0.1058824, 1,
-0.334824, 0.1198286, -0.9124335, 0, 1, 0.1137255, 1,
-0.3335907, -1.801052, -2.575732, 0, 1, 0.1176471, 1,
-0.3271061, -2.358413, -3.050076, 0, 1, 0.1254902, 1,
-0.3217912, -0.1530477, -2.265378, 0, 1, 0.1294118, 1,
-0.3209721, -0.1749846, -3.516015, 0, 1, 0.1372549, 1,
-0.3181853, -0.7921937, -3.071722, 0, 1, 0.1411765, 1,
-0.3171501, -0.8113489, -2.625408, 0, 1, 0.1490196, 1,
-0.3156959, -1.36147, -4.130346, 0, 1, 0.1529412, 1,
-0.3152227, -0.6746837, -3.090693, 0, 1, 0.1607843, 1,
-0.3140492, 0.2799307, -0.05813271, 0, 1, 0.1647059, 1,
-0.3115148, -0.5187965, -2.274638, 0, 1, 0.172549, 1,
-0.3108946, 0.09646993, -1.501287, 0, 1, 0.1764706, 1,
-0.3101346, -0.4270879, -2.468076, 0, 1, 0.1843137, 1,
-0.3088521, 0.5355003, -0.3994625, 0, 1, 0.1882353, 1,
-0.3035803, -0.9877193, -2.810466, 0, 1, 0.1960784, 1,
-0.3029276, 0.8238121, -0.9541662, 0, 1, 0.2039216, 1,
-0.2947808, 1.909968, 2.048447, 0, 1, 0.2078431, 1,
-0.2925554, -0.2812863, -1.926185, 0, 1, 0.2156863, 1,
-0.2909534, -0.2404288, -2.506172, 0, 1, 0.2196078, 1,
-0.2858978, -1.070763, -2.623752, 0, 1, 0.227451, 1,
-0.2856862, -0.9846401, -2.078719, 0, 1, 0.2313726, 1,
-0.2786648, -0.3615445, -2.223193, 0, 1, 0.2392157, 1,
-0.27768, -2.033968, -2.020985, 0, 1, 0.2431373, 1,
-0.2774155, 0.7814916, -2.142171, 0, 1, 0.2509804, 1,
-0.2746806, 0.3830838, -1.016853, 0, 1, 0.254902, 1,
-0.274381, -1.214527, -1.998225, 0, 1, 0.2627451, 1,
-0.2741405, 0.549836, -0.7096031, 0, 1, 0.2666667, 1,
-0.2738724, 0.06229689, -2.041045, 0, 1, 0.2745098, 1,
-0.2726689, 1.267013, -1.231498, 0, 1, 0.2784314, 1,
-0.2717348, 0.08877517, -2.099808, 0, 1, 0.2862745, 1,
-0.2711954, -1.106555, -2.365016, 0, 1, 0.2901961, 1,
-0.2694371, 0.02613658, -1.166348, 0, 1, 0.2980392, 1,
-0.2641697, 0.2719731, -1.686991, 0, 1, 0.3058824, 1,
-0.2624908, -0.8928329, -2.593544, 0, 1, 0.3098039, 1,
-0.2537305, -0.7349188, -2.068279, 0, 1, 0.3176471, 1,
-0.2529931, -0.4017791, -1.975444, 0, 1, 0.3215686, 1,
-0.2486806, 0.3752006, -1.129997, 0, 1, 0.3294118, 1,
-0.2461732, 1.113521, -0.7266003, 0, 1, 0.3333333, 1,
-0.2453436, -0.2278541, -2.192852, 0, 1, 0.3411765, 1,
-0.2423037, -0.2586071, -1.468315, 0, 1, 0.345098, 1,
-0.2416535, 0.4770592, 0.09022073, 0, 1, 0.3529412, 1,
-0.2401617, 0.6085823, -0.460034, 0, 1, 0.3568628, 1,
-0.236169, 0.1596504, -0.05107212, 0, 1, 0.3647059, 1,
-0.2341669, -0.5871173, -3.632008, 0, 1, 0.3686275, 1,
-0.2303885, 0.1728518, -0.3647376, 0, 1, 0.3764706, 1,
-0.2285323, -1.193927, -3.653724, 0, 1, 0.3803922, 1,
-0.2257883, -1.272786, -3.83189, 0, 1, 0.3882353, 1,
-0.225498, 0.9927955, -0.7277946, 0, 1, 0.3921569, 1,
-0.2253956, 0.8739755, 0.06823237, 0, 1, 0.4, 1,
-0.2235323, -0.07931758, -1.543604, 0, 1, 0.4078431, 1,
-0.221992, -1.412006, -3.559, 0, 1, 0.4117647, 1,
-0.2131282, 0.3750294, 0.7946118, 0, 1, 0.4196078, 1,
-0.2110603, 0.46373, -1.960454, 0, 1, 0.4235294, 1,
-0.2075689, 0.1560313, -1.911964, 0, 1, 0.4313726, 1,
-0.2019935, 0.827306, -0.2745957, 0, 1, 0.4352941, 1,
-0.1990192, -0.795899, -1.955117, 0, 1, 0.4431373, 1,
-0.1986544, -0.7088441, -1.261161, 0, 1, 0.4470588, 1,
-0.1965975, -0.5253893, -1.920465, 0, 1, 0.454902, 1,
-0.1875454, -1.198838, -0.5267939, 0, 1, 0.4588235, 1,
-0.1863202, 0.1581651, -1.542199, 0, 1, 0.4666667, 1,
-0.1856523, -1.54379, -2.353254, 0, 1, 0.4705882, 1,
-0.1826314, 0.05276917, -1.231643, 0, 1, 0.4784314, 1,
-0.1809117, 1.510087, -0.6761096, 0, 1, 0.4823529, 1,
-0.1801765, -0.2246202, -2.968921, 0, 1, 0.4901961, 1,
-0.1793125, -0.7058822, -1.196434, 0, 1, 0.4941176, 1,
-0.1762074, 0.4667093, 0.5756882, 0, 1, 0.5019608, 1,
-0.1731878, -0.7337486, -3.249846, 0, 1, 0.509804, 1,
-0.1708532, 0.277824, 1.124145, 0, 1, 0.5137255, 1,
-0.1705255, 0.6206588, 0.3774493, 0, 1, 0.5215687, 1,
-0.1692457, -0.1555124, -0.1221099, 0, 1, 0.5254902, 1,
-0.1675921, 0.7944897, -0.9232029, 0, 1, 0.5333334, 1,
-0.16704, -1.18023, -4.068241, 0, 1, 0.5372549, 1,
-0.1652251, 1.267965, -0.4515284, 0, 1, 0.5450981, 1,
-0.1633835, -0.5514924, -1.784996, 0, 1, 0.5490196, 1,
-0.1618336, -1.608566, -3.213508, 0, 1, 0.5568628, 1,
-0.1561655, -0.6802999, -2.967063, 0, 1, 0.5607843, 1,
-0.1537807, 0.3534485, -0.724057, 0, 1, 0.5686275, 1,
-0.1535481, -1.218542, -3.313318, 0, 1, 0.572549, 1,
-0.144324, -0.3724978, -3.09752, 0, 1, 0.5803922, 1,
-0.14127, -0.6269667, -2.851955, 0, 1, 0.5843138, 1,
-0.1334205, -1.498946, -3.027361, 0, 1, 0.5921569, 1,
-0.1255911, 0.5937428, -0.5595245, 0, 1, 0.5960785, 1,
-0.1245865, 0.2063113, 0.8650575, 0, 1, 0.6039216, 1,
-0.1231062, -0.6078922, -3.327536, 0, 1, 0.6117647, 1,
-0.1190598, -0.6690754, -3.563052, 0, 1, 0.6156863, 1,
-0.1171475, 1.148264, 0.1488994, 0, 1, 0.6235294, 1,
-0.1119492, -0.3825239, -3.998262, 0, 1, 0.627451, 1,
-0.1091099, 0.6884563, -0.6752697, 0, 1, 0.6352941, 1,
-0.1071709, 0.6968414, -1.819497, 0, 1, 0.6392157, 1,
-0.1055632, 0.08596612, -0.3037806, 0, 1, 0.6470588, 1,
-0.105521, -0.4643736, -3.916335, 0, 1, 0.6509804, 1,
-0.1053421, 2.632027, -0.003795636, 0, 1, 0.6588235, 1,
-0.104527, 0.3112463, 0.8302457, 0, 1, 0.6627451, 1,
-0.1035086, 0.5078367, -0.03804734, 0, 1, 0.6705883, 1,
-0.1032534, -0.03520176, -2.586205, 0, 1, 0.6745098, 1,
-0.09677847, -0.7480889, -2.173582, 0, 1, 0.682353, 1,
-0.09314763, -0.007167072, -1.457195, 0, 1, 0.6862745, 1,
-0.08644453, 0.7229685, 0.6501365, 0, 1, 0.6941177, 1,
-0.08128197, -0.03456907, -1.398407, 0, 1, 0.7019608, 1,
-0.07507838, -0.9681059, -3.513088, 0, 1, 0.7058824, 1,
-0.0665998, -2.179898, -4.502265, 0, 1, 0.7137255, 1,
-0.06192136, 0.2202722, 1.465432, 0, 1, 0.7176471, 1,
-0.0582894, 0.6732156, -0.6974826, 0, 1, 0.7254902, 1,
-0.05384216, -0.4026612, -3.318645, 0, 1, 0.7294118, 1,
-0.05174845, 1.9604, -0.9797329, 0, 1, 0.7372549, 1,
-0.04989542, 0.7148095, 0.3302502, 0, 1, 0.7411765, 1,
-0.04874342, 1.017236, -0.2046547, 0, 1, 0.7490196, 1,
-0.04858357, -1.272702, -2.448987, 0, 1, 0.7529412, 1,
-0.0443109, 1.899762, 0.7583765, 0, 1, 0.7607843, 1,
-0.04262783, -0.4297607, -3.124828, 0, 1, 0.7647059, 1,
-0.04059042, 1.004502, -0.02536923, 0, 1, 0.772549, 1,
-0.03868696, 0.2056006, -0.9908491, 0, 1, 0.7764706, 1,
-0.03779634, 0.5228515, -2.166481, 0, 1, 0.7843137, 1,
-0.03584779, 1.04489, 0.9740078, 0, 1, 0.7882353, 1,
-0.0348379, -0.9738217, -3.118849, 0, 1, 0.7960784, 1,
-0.02928063, -0.1708042, -3.177287, 0, 1, 0.8039216, 1,
-0.02891192, -1.744877, -2.968546, 0, 1, 0.8078431, 1,
-0.0223584, -0.004489765, -0.817409, 0, 1, 0.8156863, 1,
-0.01944122, 2.756054, 0.3915812, 0, 1, 0.8196079, 1,
-0.01724056, 2.281833, -0.7252304, 0, 1, 0.827451, 1,
-0.01572923, 0.8162507, 0.7796215, 0, 1, 0.8313726, 1,
-0.01289737, 0.2265086, -0.4531673, 0, 1, 0.8392157, 1,
-0.01186704, 1.360577, 0.4163918, 0, 1, 0.8431373, 1,
-0.01017896, 0.04120563, 0.5499106, 0, 1, 0.8509804, 1,
-0.002804274, -0.9602722, -4.019524, 0, 1, 0.854902, 1,
-0.0005658302, 0.5304357, -1.732896, 0, 1, 0.8627451, 1,
0.00310915, 1.322937, 1.287855, 0, 1, 0.8666667, 1,
0.004048801, 0.5178319, -1.334931, 0, 1, 0.8745098, 1,
0.005559829, 1.25352, 0.04565391, 0, 1, 0.8784314, 1,
0.01063618, -1.54165, 3.720274, 0, 1, 0.8862745, 1,
0.01119344, -0.1277428, 2.217256, 0, 1, 0.8901961, 1,
0.01214231, 1.066366, -1.489576, 0, 1, 0.8980392, 1,
0.0124336, 1.447957, 0.5976258, 0, 1, 0.9058824, 1,
0.01494982, -1.103237, 2.396074, 0, 1, 0.9098039, 1,
0.01851604, -0.2306103, 3.484487, 0, 1, 0.9176471, 1,
0.02367414, -0.9035615, 2.787097, 0, 1, 0.9215686, 1,
0.02409566, 1.330329, 2.19758, 0, 1, 0.9294118, 1,
0.02728109, -0.2895956, 3.734756, 0, 1, 0.9333333, 1,
0.02880658, 1.191728, -0.1019117, 0, 1, 0.9411765, 1,
0.02884056, -1.893529, 2.369728, 0, 1, 0.945098, 1,
0.03164824, -0.3590586, 4.263994, 0, 1, 0.9529412, 1,
0.03677544, -0.8677947, 2.347574, 0, 1, 0.9568627, 1,
0.03687004, 0.5823539, -0.3022512, 0, 1, 0.9647059, 1,
0.03888445, -1.97177, 4.890587, 0, 1, 0.9686275, 1,
0.04137076, 0.9111984, 0.6902266, 0, 1, 0.9764706, 1,
0.04554498, -0.4708941, 3.044203, 0, 1, 0.9803922, 1,
0.04585052, 1.274903, -0.6353979, 0, 1, 0.9882353, 1,
0.04719356, -0.8104116, 1.671916, 0, 1, 0.9921569, 1,
0.04785693, -2.412424, 4.367345, 0, 1, 1, 1,
0.05025924, -1.200926, 3.172164, 0, 0.9921569, 1, 1,
0.05771106, 1.386015, 0.1495316, 0, 0.9882353, 1, 1,
0.06621739, 0.1435791, 0.4515363, 0, 0.9803922, 1, 1,
0.07201406, -0.4120429, 1.029701, 0, 0.9764706, 1, 1,
0.0723051, -0.4651018, 4.346616, 0, 0.9686275, 1, 1,
0.07320544, 0.5149546, 0.6922675, 0, 0.9647059, 1, 1,
0.0751695, 0.1210619, -0.7056406, 0, 0.9568627, 1, 1,
0.07555758, -0.3343193, 4.32878, 0, 0.9529412, 1, 1,
0.07577669, 1.08521, 1.446381, 0, 0.945098, 1, 1,
0.08265018, 0.3082443, 1.024347, 0, 0.9411765, 1, 1,
0.08446191, -0.9239908, 2.147371, 0, 0.9333333, 1, 1,
0.08776787, -0.5251617, 3.505867, 0, 0.9294118, 1, 1,
0.09023077, -1.270207, 2.648137, 0, 0.9215686, 1, 1,
0.09338167, -0.8197945, 2.841269, 0, 0.9176471, 1, 1,
0.09585469, -0.2049916, 1.970702, 0, 0.9098039, 1, 1,
0.1029645, -0.3703116, 4.739067, 0, 0.9058824, 1, 1,
0.1041832, -0.04873368, 2.650614, 0, 0.8980392, 1, 1,
0.1058775, -0.8309779, 3.471971, 0, 0.8901961, 1, 1,
0.1093915, -1.181401, 2.662771, 0, 0.8862745, 1, 1,
0.1099579, -0.7325358, 4.484241, 0, 0.8784314, 1, 1,
0.1131858, -1.146932, 3.276165, 0, 0.8745098, 1, 1,
0.1153488, -1.083916, 3.930874, 0, 0.8666667, 1, 1,
0.1195134, 0.3344494, -0.1666991, 0, 0.8627451, 1, 1,
0.1221615, -0.7527872, 3.884761, 0, 0.854902, 1, 1,
0.1251352, 0.9945082, 0.8556426, 0, 0.8509804, 1, 1,
0.1369854, 0.5698372, 0.9621046, 0, 0.8431373, 1, 1,
0.1397083, -1.618912, 1.786243, 0, 0.8392157, 1, 1,
0.1417098, 1.488629, -0.8337448, 0, 0.8313726, 1, 1,
0.1425551, -1.326594, 4.425747, 0, 0.827451, 1, 1,
0.1446407, -0.07773163, 2.239906, 0, 0.8196079, 1, 1,
0.144695, 0.171281, -0.5268098, 0, 0.8156863, 1, 1,
0.1449351, -0.1019452, 1.418625, 0, 0.8078431, 1, 1,
0.1498346, -0.4567432, 1.296185, 0, 0.8039216, 1, 1,
0.1498965, 1.49339, -0.8675376, 0, 0.7960784, 1, 1,
0.1509375, 0.6786751, -1.079365, 0, 0.7882353, 1, 1,
0.1519323, 0.1094689, -0.964316, 0, 0.7843137, 1, 1,
0.1537911, 0.4915698, -0.3667191, 0, 0.7764706, 1, 1,
0.1543209, 0.07750345, -0.04746341, 0, 0.772549, 1, 1,
0.154952, -0.1852066, 2.187292, 0, 0.7647059, 1, 1,
0.1550001, 1.877845, 1.164185, 0, 0.7607843, 1, 1,
0.1602745, 0.8914456, 0.5116027, 0, 0.7529412, 1, 1,
0.1617893, 0.7455902, 0.3738539, 0, 0.7490196, 1, 1,
0.1637748, 0.05360838, 1.340848, 0, 0.7411765, 1, 1,
0.1664476, -2.148787, 3.386134, 0, 0.7372549, 1, 1,
0.1666332, 1.095439, 1.446584, 0, 0.7294118, 1, 1,
0.1694579, -0.9136721, 3.228387, 0, 0.7254902, 1, 1,
0.169769, 0.2547249, -0.3601386, 0, 0.7176471, 1, 1,
0.1725921, 0.2208777, 1.88152, 0, 0.7137255, 1, 1,
0.175948, -1.515369, 3.224942, 0, 0.7058824, 1, 1,
0.1779358, -0.2405793, 4.052219, 0, 0.6980392, 1, 1,
0.179226, 0.9168245, -0.4652459, 0, 0.6941177, 1, 1,
0.17937, 0.06988671, 1.310455, 0, 0.6862745, 1, 1,
0.1855727, 0.8672201, 0.1429042, 0, 0.682353, 1, 1,
0.1903895, 1.428435, 0.5470248, 0, 0.6745098, 1, 1,
0.1906814, 0.3377679, 0.5589834, 0, 0.6705883, 1, 1,
0.1933232, -0.636091, 0.8128046, 0, 0.6627451, 1, 1,
0.1994478, 0.1805392, -0.6042806, 0, 0.6588235, 1, 1,
0.2003997, 0.6165517, 0.6455613, 0, 0.6509804, 1, 1,
0.200913, 1.507372, 1.39948, 0, 0.6470588, 1, 1,
0.2027367, 0.1968633, 2.45948, 0, 0.6392157, 1, 1,
0.2048826, 0.5484444, 1.262716, 0, 0.6352941, 1, 1,
0.2070852, -0.6699243, 2.346403, 0, 0.627451, 1, 1,
0.2119074, 0.6081626, 0.3621697, 0, 0.6235294, 1, 1,
0.2154192, 1.968552, 0.9655114, 0, 0.6156863, 1, 1,
0.2168342, 1.633646, 0.4285975, 0, 0.6117647, 1, 1,
0.2261954, -0.3007106, 1.834577, 0, 0.6039216, 1, 1,
0.2273564, -0.5433076, 2.399745, 0, 0.5960785, 1, 1,
0.2301499, -0.2856953, 3.336843, 0, 0.5921569, 1, 1,
0.2340905, 0.7261276, -0.2919477, 0, 0.5843138, 1, 1,
0.2346232, -0.05956672, 2.299943, 0, 0.5803922, 1, 1,
0.2391977, 0.02186202, 2.712677, 0, 0.572549, 1, 1,
0.2412002, 0.6088479, -0.3218343, 0, 0.5686275, 1, 1,
0.2474059, 0.3400149, 0.2250348, 0, 0.5607843, 1, 1,
0.2551182, -0.6440855, 3.238566, 0, 0.5568628, 1, 1,
0.2560211, 0.2371952, 1.535779, 0, 0.5490196, 1, 1,
0.2567427, -0.2200188, 0.7901105, 0, 0.5450981, 1, 1,
0.257194, 1.27806, 0.4691062, 0, 0.5372549, 1, 1,
0.2586054, 1.896943, 1.467534, 0, 0.5333334, 1, 1,
0.2625417, 0.7000443, -0.213004, 0, 0.5254902, 1, 1,
0.2664193, 0.9112819, 0.1253836, 0, 0.5215687, 1, 1,
0.2709894, -0.1480547, 2.004765, 0, 0.5137255, 1, 1,
0.2711071, -0.9419699, 3.131681, 0, 0.509804, 1, 1,
0.2822307, 1.0044, 0.5561689, 0, 0.5019608, 1, 1,
0.2887015, -1.673603, 4.190736, 0, 0.4941176, 1, 1,
0.2899736, 1.813375, -1.693743, 0, 0.4901961, 1, 1,
0.2900053, -0.01724765, 0.8581079, 0, 0.4823529, 1, 1,
0.2925873, -1.210813, -0.09267467, 0, 0.4784314, 1, 1,
0.2967732, -1.128026, 3.567975, 0, 0.4705882, 1, 1,
0.2983195, 0.158216, 1.111954, 0, 0.4666667, 1, 1,
0.3019616, 1.781461, 1.815403, 0, 0.4588235, 1, 1,
0.3058182, -1.802826, 1.866993, 0, 0.454902, 1, 1,
0.3074901, 0.2684497, 1.31555, 0, 0.4470588, 1, 1,
0.3141848, 1.098956, -0.003431237, 0, 0.4431373, 1, 1,
0.315492, 1.221784, 2.286884, 0, 0.4352941, 1, 1,
0.3162228, 0.4959131, 0.199209, 0, 0.4313726, 1, 1,
0.3198598, -1.100239, 3.744396, 0, 0.4235294, 1, 1,
0.3207124, 1.440877, 0.1981022, 0, 0.4196078, 1, 1,
0.3217145, -0.4577697, 2.278375, 0, 0.4117647, 1, 1,
0.3245413, 0.9612935, 0.9513565, 0, 0.4078431, 1, 1,
0.3321759, 1.40181, 0.5618882, 0, 0.4, 1, 1,
0.3324889, 1.366108, 0.6465391, 0, 0.3921569, 1, 1,
0.3350996, 0.2601578, 0.6812131, 0, 0.3882353, 1, 1,
0.336861, -0.7418675, 1.29737, 0, 0.3803922, 1, 1,
0.3408196, -2.206021, 5.503814, 0, 0.3764706, 1, 1,
0.342079, -0.09779631, 1.432858, 0, 0.3686275, 1, 1,
0.3434255, 1.119481, 0.08252787, 0, 0.3647059, 1, 1,
0.3446133, -0.5881895, 0.764888, 0, 0.3568628, 1, 1,
0.3448009, 0.8492979, -0.7025128, 0, 0.3529412, 1, 1,
0.3464516, -1.509101, 3.213894, 0, 0.345098, 1, 1,
0.3488961, -0.6417225, 3.434488, 0, 0.3411765, 1, 1,
0.3495959, 0.8213474, 1.804792, 0, 0.3333333, 1, 1,
0.3498666, 0.04071692, 0.7661385, 0, 0.3294118, 1, 1,
0.350204, -1.822916, 3.085289, 0, 0.3215686, 1, 1,
0.3555925, 0.8853545, -0.5828594, 0, 0.3176471, 1, 1,
0.357253, 0.1856006, 3.463856, 0, 0.3098039, 1, 1,
0.3579107, -1.28755, 3.676714, 0, 0.3058824, 1, 1,
0.3591823, 1.106337, 0.255619, 0, 0.2980392, 1, 1,
0.3593984, 0.4583443, -0.8614703, 0, 0.2901961, 1, 1,
0.3607041, 1.171384, 0.965227, 0, 0.2862745, 1, 1,
0.3614817, -0.2823149, 2.160028, 0, 0.2784314, 1, 1,
0.3681522, 0.370294, 1.388982, 0, 0.2745098, 1, 1,
0.3702119, -0.2426296, 2.969266, 0, 0.2666667, 1, 1,
0.3705395, 0.1595739, 2.297563, 0, 0.2627451, 1, 1,
0.3711725, 0.7691781, -0.8015181, 0, 0.254902, 1, 1,
0.3742109, 1.197829, -0.428914, 0, 0.2509804, 1, 1,
0.3747384, -0.09121887, 4.395245, 0, 0.2431373, 1, 1,
0.3751313, 0.4560733, 0.2591847, 0, 0.2392157, 1, 1,
0.3757091, -0.4107864, 1.980186, 0, 0.2313726, 1, 1,
0.3772269, 0.07327884, 0.9576187, 0, 0.227451, 1, 1,
0.3777529, -0.4775107, 2.203695, 0, 0.2196078, 1, 1,
0.3782015, -0.09358452, -0.8369104, 0, 0.2156863, 1, 1,
0.3804038, 0.894143, -0.05627696, 0, 0.2078431, 1, 1,
0.3893372, 0.9780508, -0.3445444, 0, 0.2039216, 1, 1,
0.3899716, -0.6428884, 1.155963, 0, 0.1960784, 1, 1,
0.3936449, -0.5307029, 0.9241888, 0, 0.1882353, 1, 1,
0.4012013, -0.8682789, 2.02442, 0, 0.1843137, 1, 1,
0.4024032, 0.7397953, 3.202573, 0, 0.1764706, 1, 1,
0.4056018, 1.398038, 1.241537, 0, 0.172549, 1, 1,
0.4096395, -0.5625457, 1.796963, 0, 0.1647059, 1, 1,
0.41058, -0.1499284, 3.807401, 0, 0.1607843, 1, 1,
0.4119619, -0.2653266, 2.129616, 0, 0.1529412, 1, 1,
0.4138614, 1.545609, -0.4311917, 0, 0.1490196, 1, 1,
0.4151548, 0.4487299, 0.8193701, 0, 0.1411765, 1, 1,
0.4168587, 2.199569, 1.716324, 0, 0.1372549, 1, 1,
0.4175582, 0.818645, -0.09925134, 0, 0.1294118, 1, 1,
0.420983, -0.2555968, 3.358535, 0, 0.1254902, 1, 1,
0.4220694, -1.894067, 2.504224, 0, 0.1176471, 1, 1,
0.4244584, -1.38865, 2.939609, 0, 0.1137255, 1, 1,
0.4249137, 0.1366006, 1.135193, 0, 0.1058824, 1, 1,
0.4274333, 0.1853948, -0.7030463, 0, 0.09803922, 1, 1,
0.4331698, 1.207594, 1.865589, 0, 0.09411765, 1, 1,
0.4363123, -0.4897676, 3.149197, 0, 0.08627451, 1, 1,
0.4363604, 1.98487, 0.6110757, 0, 0.08235294, 1, 1,
0.4380339, 1.200871, -0.4164858, 0, 0.07450981, 1, 1,
0.4408007, -1.341112, 2.388662, 0, 0.07058824, 1, 1,
0.4418092, 1.611162, -0.3824617, 0, 0.0627451, 1, 1,
0.44589, -2.32617, 1.732536, 0, 0.05882353, 1, 1,
0.4477402, 1.321021, -1.171844, 0, 0.05098039, 1, 1,
0.4485395, 0.1168637, 0.6991771, 0, 0.04705882, 1, 1,
0.4500186, -1.296167, 1.576994, 0, 0.03921569, 1, 1,
0.4597707, -0.2980453, 2.269167, 0, 0.03529412, 1, 1,
0.4604478, 0.1354869, 0.001639992, 0, 0.02745098, 1, 1,
0.4611621, 0.01664645, 2.792142, 0, 0.02352941, 1, 1,
0.4625629, 3.063618, -0.07844725, 0, 0.01568628, 1, 1,
0.4633716, -0.2537097, 1.405012, 0, 0.01176471, 1, 1,
0.4677658, 0.1119561, 2.413753, 0, 0.003921569, 1, 1,
0.4745367, -1.144016, 1.719789, 0.003921569, 0, 1, 1,
0.4761044, -0.3701372, 1.659518, 0.007843138, 0, 1, 1,
0.4772742, 0.7480564, 0.2832554, 0.01568628, 0, 1, 1,
0.4800546, -0.5220428, 2.493717, 0.01960784, 0, 1, 1,
0.4800754, 0.650664, -0.7631298, 0.02745098, 0, 1, 1,
0.4816886, 0.9261647, -0.1268062, 0.03137255, 0, 1, 1,
0.4828489, 0.9187916, 1.335723, 0.03921569, 0, 1, 1,
0.4849378, 0.3121269, 1.794513, 0.04313726, 0, 1, 1,
0.4851884, 0.1114532, 1.527254, 0.05098039, 0, 1, 1,
0.4939436, -1.945263, 1.866507, 0.05490196, 0, 1, 1,
0.4974268, 1.122367, 0.7944102, 0.0627451, 0, 1, 1,
0.4988896, -1.736045, 3.080982, 0.06666667, 0, 1, 1,
0.4990551, 0.6490008, 1.025333, 0.07450981, 0, 1, 1,
0.5037121, -0.3879767, 2.846175, 0.07843138, 0, 1, 1,
0.5039006, 1.309228, -0.8957488, 0.08627451, 0, 1, 1,
0.5039302, 0.01615806, 2.697759, 0.09019608, 0, 1, 1,
0.5091246, -0.0460383, 3.038025, 0.09803922, 0, 1, 1,
0.5129018, 0.06569781, 2.583905, 0.1058824, 0, 1, 1,
0.5149472, 1.122999, 1.719536, 0.1098039, 0, 1, 1,
0.5210428, -0.4578024, 1.487297, 0.1176471, 0, 1, 1,
0.5276718, 2.160843, 0.4617071, 0.1215686, 0, 1, 1,
0.5285136, -1.023727, 3.864817, 0.1294118, 0, 1, 1,
0.5296575, 0.619304, -0.3087375, 0.1333333, 0, 1, 1,
0.5331649, 1.291865, 0.3734092, 0.1411765, 0, 1, 1,
0.5364622, -0.1381777, 0.9902439, 0.145098, 0, 1, 1,
0.5423039, 2.502054, 0.3622127, 0.1529412, 0, 1, 1,
0.542914, -0.2192122, 2.520811, 0.1568628, 0, 1, 1,
0.549516, -0.9104729, 1.011347, 0.1647059, 0, 1, 1,
0.5565156, -1.157742, 1.948111, 0.1686275, 0, 1, 1,
0.5569994, -0.7918697, 2.068518, 0.1764706, 0, 1, 1,
0.5583175, -0.2087652, 0.9935869, 0.1803922, 0, 1, 1,
0.5632898, 1.438228, -1.468656, 0.1882353, 0, 1, 1,
0.563787, -0.1128611, 1.237144, 0.1921569, 0, 1, 1,
0.5702683, -1.004546, 2.975102, 0.2, 0, 1, 1,
0.5739897, 0.1260004, 0.8560716, 0.2078431, 0, 1, 1,
0.5751792, 2.502849, -1.569402, 0.2117647, 0, 1, 1,
0.5763297, 0.6482906, 0.5494727, 0.2196078, 0, 1, 1,
0.5763595, 1.069092, -0.08739293, 0.2235294, 0, 1, 1,
0.5907146, 0.3510627, 1.615793, 0.2313726, 0, 1, 1,
0.5907941, -0.2531812, 3.178941, 0.2352941, 0, 1, 1,
0.5918934, 1.809592, 0.3285629, 0.2431373, 0, 1, 1,
0.592732, -2.295886, 2.898535, 0.2470588, 0, 1, 1,
0.6008019, 1.178471, 1.406911, 0.254902, 0, 1, 1,
0.6069196, -1.003875, 3.847072, 0.2588235, 0, 1, 1,
0.6101146, -0.3847755, 2.776635, 0.2666667, 0, 1, 1,
0.6150114, -1.962561, 4.782255, 0.2705882, 0, 1, 1,
0.6163369, -0.3244033, 1.447168, 0.2784314, 0, 1, 1,
0.6190335, 1.214038, -0.7480786, 0.282353, 0, 1, 1,
0.6272566, -2.344579, 2.220101, 0.2901961, 0, 1, 1,
0.6290855, 0.4468751, 1.111864, 0.2941177, 0, 1, 1,
0.6312153, 0.7919689, 0.3086022, 0.3019608, 0, 1, 1,
0.6320857, 0.7921307, 0.6251389, 0.3098039, 0, 1, 1,
0.6340327, -3.272555, 3.324499, 0.3137255, 0, 1, 1,
0.6352904, 0.270334, 2.058389, 0.3215686, 0, 1, 1,
0.6378458, 0.9999581, 0.6491792, 0.3254902, 0, 1, 1,
0.6431612, 0.09204144, 0.9072579, 0.3333333, 0, 1, 1,
0.6439109, -0.2296874, 1.179552, 0.3372549, 0, 1, 1,
0.6457219, 0.5648063, 1.024591, 0.345098, 0, 1, 1,
0.6465715, -0.8993627, 1.969276, 0.3490196, 0, 1, 1,
0.6486396, 0.2415863, 2.441584, 0.3568628, 0, 1, 1,
0.6514251, -0.674449, 2.168947, 0.3607843, 0, 1, 1,
0.6550512, -1.291347, 3.498372, 0.3686275, 0, 1, 1,
0.6581335, -0.8908509, 2.410969, 0.372549, 0, 1, 1,
0.6608495, -0.2365559, 1.685058, 0.3803922, 0, 1, 1,
0.6625949, 0.1161967, 0.6861119, 0.3843137, 0, 1, 1,
0.6673518, -1.471639, 4.369563, 0.3921569, 0, 1, 1,
0.668049, 1.052561, -0.06107693, 0.3960784, 0, 1, 1,
0.6681048, 0.1420292, 2.158962, 0.4039216, 0, 1, 1,
0.6683335, -1.609975, 1.747383, 0.4117647, 0, 1, 1,
0.6694482, 1.15013, 1.694215, 0.4156863, 0, 1, 1,
0.6699946, -0.4473684, 1.99948, 0.4235294, 0, 1, 1,
0.6713743, -0.1723194, 2.641077, 0.427451, 0, 1, 1,
0.6822938, 0.01670867, 3.000005, 0.4352941, 0, 1, 1,
0.6827843, -1.33704, 1.257411, 0.4392157, 0, 1, 1,
0.6854036, -0.3676336, 1.539184, 0.4470588, 0, 1, 1,
0.6857073, -0.2133255, 0.7165718, 0.4509804, 0, 1, 1,
0.6873349, 1.033946, 0.6668999, 0.4588235, 0, 1, 1,
0.6884028, 0.919415, 1.00433, 0.4627451, 0, 1, 1,
0.6891587, -0.6735299, 1.844657, 0.4705882, 0, 1, 1,
0.6891637, -0.5279595, 3.859612, 0.4745098, 0, 1, 1,
0.6893498, 0.48524, 0.8311629, 0.4823529, 0, 1, 1,
0.6904986, 1.030742, 1.652406, 0.4862745, 0, 1, 1,
0.6914077, 1.168934, 1.263209, 0.4941176, 0, 1, 1,
0.701643, -0.4726218, 2.872209, 0.5019608, 0, 1, 1,
0.7031378, 0.6139379, 0.669987, 0.5058824, 0, 1, 1,
0.7130013, 0.2322103, 2.631293, 0.5137255, 0, 1, 1,
0.7144968, -1.178107, 1.211716, 0.5176471, 0, 1, 1,
0.7156017, -1.181102, 0.6491736, 0.5254902, 0, 1, 1,
0.7198081, -0.3784487, 2.121825, 0.5294118, 0, 1, 1,
0.7217925, 0.394253, 2.835421, 0.5372549, 0, 1, 1,
0.7222803, 1.808655, 0.2900111, 0.5411765, 0, 1, 1,
0.7245044, -0.06702814, 0.5320776, 0.5490196, 0, 1, 1,
0.7264073, -0.3423937, 2.664006, 0.5529412, 0, 1, 1,
0.7282273, -0.681031, 2.667758, 0.5607843, 0, 1, 1,
0.7285469, -1.235326, 2.068407, 0.5647059, 0, 1, 1,
0.7293091, 0.5608882, 1.433916, 0.572549, 0, 1, 1,
0.7323315, 0.7394676, -0.8476021, 0.5764706, 0, 1, 1,
0.7324368, -1.185552, 2.990768, 0.5843138, 0, 1, 1,
0.736019, -0.155008, 2.767802, 0.5882353, 0, 1, 1,
0.738284, 0.368658, 0.06837799, 0.5960785, 0, 1, 1,
0.7428555, 0.1701528, 0.6962464, 0.6039216, 0, 1, 1,
0.7429522, -0.5458241, 0.4678813, 0.6078432, 0, 1, 1,
0.743525, 0.3560803, 0.9497698, 0.6156863, 0, 1, 1,
0.7455233, -0.7497098, 2.19023, 0.6196079, 0, 1, 1,
0.7479121, 0.3243904, 2.196693, 0.627451, 0, 1, 1,
0.7491814, -0.03693505, 1.573576, 0.6313726, 0, 1, 1,
0.7508417, 0.2739909, 1.815754, 0.6392157, 0, 1, 1,
0.7549327, -0.4331849, 3.07369, 0.6431373, 0, 1, 1,
0.772567, -0.6105831, 3.094403, 0.6509804, 0, 1, 1,
0.778246, -2.108905, 1.769776, 0.654902, 0, 1, 1,
0.7802629, 0.6554866, 2.234772, 0.6627451, 0, 1, 1,
0.7807761, 1.83104, 0.6048676, 0.6666667, 0, 1, 1,
0.7856893, 0.6108814, 1.456496, 0.6745098, 0, 1, 1,
0.7925802, -1.591363, 3.931164, 0.6784314, 0, 1, 1,
0.7936665, 0.7674617, 1.579637, 0.6862745, 0, 1, 1,
0.7946372, 0.8383384, 2.229728, 0.6901961, 0, 1, 1,
0.7969041, -0.4018668, 2.348516, 0.6980392, 0, 1, 1,
0.7984934, -0.1495646, 1.517943, 0.7058824, 0, 1, 1,
0.7994131, -1.214097, 3.124366, 0.7098039, 0, 1, 1,
0.8019052, 0.3626755, 0.9165679, 0.7176471, 0, 1, 1,
0.8031182, -0.3262102, 3.247021, 0.7215686, 0, 1, 1,
0.8087922, 0.1140206, 0.156212, 0.7294118, 0, 1, 1,
0.8120572, 0.04110732, 3.749438, 0.7333333, 0, 1, 1,
0.8161877, -1.073923, 4.760377, 0.7411765, 0, 1, 1,
0.8183686, 0.006548156, 1.721601, 0.7450981, 0, 1, 1,
0.8222154, 0.2348707, 2.215297, 0.7529412, 0, 1, 1,
0.8237934, 0.5945821, 1.58972, 0.7568628, 0, 1, 1,
0.830739, -1.071881, 2.276596, 0.7647059, 0, 1, 1,
0.8356493, -1.3223, 2.855037, 0.7686275, 0, 1, 1,
0.835987, 0.3036241, 2.142874, 0.7764706, 0, 1, 1,
0.8447944, 0.1126072, 1.437181, 0.7803922, 0, 1, 1,
0.847993, -1.428605, 3.791277, 0.7882353, 0, 1, 1,
0.8486294, -0.77543, 0.9561237, 0.7921569, 0, 1, 1,
0.8496323, -0.9321028, 2.030279, 0.8, 0, 1, 1,
0.8509254, -1.285195, 4.141176, 0.8078431, 0, 1, 1,
0.8554391, 0.5116616, 1.654537, 0.8117647, 0, 1, 1,
0.8565555, 0.8616242, 0.3843012, 0.8196079, 0, 1, 1,
0.860771, 0.8345453, 2.304594, 0.8235294, 0, 1, 1,
0.8653052, 0.2590517, 1.691857, 0.8313726, 0, 1, 1,
0.8661079, -0.5288287, 3.398016, 0.8352941, 0, 1, 1,
0.8662425, 1.183738, -0.8534688, 0.8431373, 0, 1, 1,
0.8676791, -0.07103482, 2.554129, 0.8470588, 0, 1, 1,
0.8724903, 0.6512636, 1.11572, 0.854902, 0, 1, 1,
0.8733502, 1.247272, 0.7006232, 0.8588235, 0, 1, 1,
0.8746804, -0.7776531, 1.054905, 0.8666667, 0, 1, 1,
0.8765317, 0.9555368, 0.671691, 0.8705882, 0, 1, 1,
0.8867977, -0.5061389, 1.60809, 0.8784314, 0, 1, 1,
0.8879842, -1.329383, 1.954493, 0.8823529, 0, 1, 1,
0.8960139, 1.382088, 2.57094, 0.8901961, 0, 1, 1,
0.8985984, -0.07029758, 1.868734, 0.8941177, 0, 1, 1,
0.9044021, 0.4249004, 0.9069639, 0.9019608, 0, 1, 1,
0.904498, 1.351898, 1.563261, 0.9098039, 0, 1, 1,
0.9055208, -1.07457, 1.789545, 0.9137255, 0, 1, 1,
0.9070988, 0.1676773, -0.3356682, 0.9215686, 0, 1, 1,
0.9098018, 0.9461321, 1.307956, 0.9254902, 0, 1, 1,
0.9171635, -1.355705, 3.106827, 0.9333333, 0, 1, 1,
0.9173379, 1.252048, 0.5753188, 0.9372549, 0, 1, 1,
0.9188076, -0.3266973, 0.6560256, 0.945098, 0, 1, 1,
0.9259918, -1.649688, 3.726004, 0.9490196, 0, 1, 1,
0.9259988, -0.1894253, 1.417106, 0.9568627, 0, 1, 1,
0.9337987, 1.683812, 1.513653, 0.9607843, 0, 1, 1,
0.938518, -1.212212, 2.759923, 0.9686275, 0, 1, 1,
0.9512454, 0.1644563, 1.706543, 0.972549, 0, 1, 1,
0.9518554, 0.0212914, -0.2455147, 0.9803922, 0, 1, 1,
0.9528946, 0.5706355, 0.2782886, 0.9843137, 0, 1, 1,
0.9560795, -0.4813283, -0.7353994, 0.9921569, 0, 1, 1,
0.9610595, 0.1517273, 1.458249, 0.9960784, 0, 1, 1,
0.961109, -1.184137, 2.298146, 1, 0, 0.9960784, 1,
0.978082, -0.5846788, 2.379111, 1, 0, 0.9882353, 1,
0.9829109, 0.5144457, 0.2670036, 1, 0, 0.9843137, 1,
0.9848844, 1.896747, -0.06454232, 1, 0, 0.9764706, 1,
1.001367, 0.9540275, 0.1713483, 1, 0, 0.972549, 1,
1.009665, 0.2661753, 2.486624, 1, 0, 0.9647059, 1,
1.014961, 0.5160003, 1.559107, 1, 0, 0.9607843, 1,
1.015164, -0.7643125, 3.394255, 1, 0, 0.9529412, 1,
1.017462, -1.129525, 2.172552, 1, 0, 0.9490196, 1,
1.019329, 0.9014039, 0.6326388, 1, 0, 0.9411765, 1,
1.026334, -0.3026311, 1.665175, 1, 0, 0.9372549, 1,
1.032935, 0.0608956, 1.054958, 1, 0, 0.9294118, 1,
1.042479, 0.2532142, 0.540975, 1, 0, 0.9254902, 1,
1.045756, 2.382816, -0.3572465, 1, 0, 0.9176471, 1,
1.049201, -0.7511494, 1.204061, 1, 0, 0.9137255, 1,
1.056889, -1.800748, 2.716977, 1, 0, 0.9058824, 1,
1.059848, -0.2021672, 1.422264, 1, 0, 0.9019608, 1,
1.061317, 1.292067, 0.9222352, 1, 0, 0.8941177, 1,
1.063433, 1.716738, -1.014673, 1, 0, 0.8862745, 1,
1.063663, -0.4240047, 2.018689, 1, 0, 0.8823529, 1,
1.077162, -0.2948758, 1.876059, 1, 0, 0.8745098, 1,
1.083871, 0.2884371, 0.2906401, 1, 0, 0.8705882, 1,
1.086205, -1.231355, -0.7070131, 1, 0, 0.8627451, 1,
1.087284, 0.03654338, 1.50142, 1, 0, 0.8588235, 1,
1.089551, 1.216051, 1.563102, 1, 0, 0.8509804, 1,
1.101603, -0.7827694, 1.548464, 1, 0, 0.8470588, 1,
1.130346, 1.445279, 0.08700982, 1, 0, 0.8392157, 1,
1.133143, 2.303186, 0.7080365, 1, 0, 0.8352941, 1,
1.133772, -0.9047013, 3.846383, 1, 0, 0.827451, 1,
1.148079, 1.091717, 1.569165, 1, 0, 0.8235294, 1,
1.157075, 1.227009, 0.2048737, 1, 0, 0.8156863, 1,
1.158516, 0.615211, 2.038597, 1, 0, 0.8117647, 1,
1.176128, -0.7142529, 0.8855035, 1, 0, 0.8039216, 1,
1.176717, -0.1270834, 1.40536, 1, 0, 0.7960784, 1,
1.178204, -1.430803, 2.546125, 1, 0, 0.7921569, 1,
1.186601, 0.8655822, -0.5323439, 1, 0, 0.7843137, 1,
1.193824, -1.19535, 3.65238, 1, 0, 0.7803922, 1,
1.194929, -0.9858875, 2.317033, 1, 0, 0.772549, 1,
1.203587, -0.8142197, 3.928017, 1, 0, 0.7686275, 1,
1.205133, -1.63607, 1.895783, 1, 0, 0.7607843, 1,
1.20665, -1.543175, 3.619225, 1, 0, 0.7568628, 1,
1.20673, 0.4988729, 1.847715, 1, 0, 0.7490196, 1,
1.207814, -1.580423, 3.519636, 1, 0, 0.7450981, 1,
1.211561, 1.425561, 0.3888221, 1, 0, 0.7372549, 1,
1.214396, -1.207885, 1.423993, 1, 0, 0.7333333, 1,
1.22032, -0.5679473, 0.5408547, 1, 0, 0.7254902, 1,
1.222221, 0.758532, 0.2040731, 1, 0, 0.7215686, 1,
1.226837, -1.019021, 2.47066, 1, 0, 0.7137255, 1,
1.228057, -1.064392, 1.807742, 1, 0, 0.7098039, 1,
1.245605, 0.2890114, 1.877977, 1, 0, 0.7019608, 1,
1.249817, -1.210414, 1.844814, 1, 0, 0.6941177, 1,
1.250563, 0.5774118, 1.83196, 1, 0, 0.6901961, 1,
1.258564, -0.1608292, 0.9619368, 1, 0, 0.682353, 1,
1.269647, 1.000589, -0.07776841, 1, 0, 0.6784314, 1,
1.272248, 0.2079254, -0.6243367, 1, 0, 0.6705883, 1,
1.275748, -2.02488, 2.720894, 1, 0, 0.6666667, 1,
1.280827, 2.198747, -2.108344, 1, 0, 0.6588235, 1,
1.286948, 1.825435, 0.4807656, 1, 0, 0.654902, 1,
1.291825, -0.03647989, 2.960326, 1, 0, 0.6470588, 1,
1.29682, -0.4388628, 2.101606, 1, 0, 0.6431373, 1,
1.30294, 0.5501274, -1.855564, 1, 0, 0.6352941, 1,
1.308356, 0.2606397, 1.507985, 1, 0, 0.6313726, 1,
1.310718, -0.3019446, 0.9491771, 1, 0, 0.6235294, 1,
1.321064, 0.674461, 1.686188, 1, 0, 0.6196079, 1,
1.326515, 2.755289, 0.6895199, 1, 0, 0.6117647, 1,
1.327047, -0.5773456, 2.918346, 1, 0, 0.6078432, 1,
1.328969, 0.6959723, 1.30225, 1, 0, 0.6, 1,
1.331997, 0.05663614, 2.17836, 1, 0, 0.5921569, 1,
1.339057, 0.2035349, 0.7565293, 1, 0, 0.5882353, 1,
1.343331, -0.3118235, 2.253629, 1, 0, 0.5803922, 1,
1.359261, 0.7025657, 0.9008414, 1, 0, 0.5764706, 1,
1.371273, -1.409411, 3.164439, 1, 0, 0.5686275, 1,
1.385324, 0.9575177, 2.442655, 1, 0, 0.5647059, 1,
1.394439, 1.165752, 2.150076, 1, 0, 0.5568628, 1,
1.400904, 0.7067319, 0.6254942, 1, 0, 0.5529412, 1,
1.405943, -0.797897, 0.9569058, 1, 0, 0.5450981, 1,
1.417702, 0.4437806, 2.506415, 1, 0, 0.5411765, 1,
1.42315, 0.006491853, 1.903684, 1, 0, 0.5333334, 1,
1.427801, 1.426089, 0.6649876, 1, 0, 0.5294118, 1,
1.444513, 0.6411815, -1.107591, 1, 0, 0.5215687, 1,
1.447508, -1.587718, 2.238334, 1, 0, 0.5176471, 1,
1.448555, 0.2367609, 1.616721, 1, 0, 0.509804, 1,
1.449628, -0.05950895, 0.7249105, 1, 0, 0.5058824, 1,
1.452177, 1.386395, 2.258767, 1, 0, 0.4980392, 1,
1.456442, 0.8107113, 0.4341045, 1, 0, 0.4901961, 1,
1.456857, 0.1459365, 0.676442, 1, 0, 0.4862745, 1,
1.45753, 0.7388563, 0.8693748, 1, 0, 0.4784314, 1,
1.45903, -0.2143893, 2.559351, 1, 0, 0.4745098, 1,
1.462287, -1.113946, 0.9946488, 1, 0, 0.4666667, 1,
1.464828, 0.6739681, 0.08607209, 1, 0, 0.4627451, 1,
1.470744, 0.8138085, 3.897826, 1, 0, 0.454902, 1,
1.479037, -1.015221, -0.1631965, 1, 0, 0.4509804, 1,
1.479779, -0.7264792, 1.724255, 1, 0, 0.4431373, 1,
1.487124, 1.612104, -2.87998, 1, 0, 0.4392157, 1,
1.492732, -2.102197, 1.885549, 1, 0, 0.4313726, 1,
1.495011, 0.5188115, -0.4594349, 1, 0, 0.427451, 1,
1.496397, 0.2990014, 2.686535, 1, 0, 0.4196078, 1,
1.49646, -0.1154352, 0.07696351, 1, 0, 0.4156863, 1,
1.511568, -0.9003928, 2.466405, 1, 0, 0.4078431, 1,
1.51629, -1.12857, 1.486749, 1, 0, 0.4039216, 1,
1.526152, 1.426553, 0.08850688, 1, 0, 0.3960784, 1,
1.526723, -1.175853, 2.025303, 1, 0, 0.3882353, 1,
1.528469, -0.1917401, 1.851868, 1, 0, 0.3843137, 1,
1.531432, -0.5324866, 1.529185, 1, 0, 0.3764706, 1,
1.536287, 0.255228, 3.413661, 1, 0, 0.372549, 1,
1.5499, 1.492374, 0.6282641, 1, 0, 0.3647059, 1,
1.56325, 0.1332605, 1.944804, 1, 0, 0.3607843, 1,
1.566975, 0.1076484, 1.462419, 1, 0, 0.3529412, 1,
1.570781, -0.1353811, 1.236998, 1, 0, 0.3490196, 1,
1.583552, 1.377963, 0.246111, 1, 0, 0.3411765, 1,
1.584026, 1.541588, -0.3674842, 1, 0, 0.3372549, 1,
1.595193, -0.08577763, 2.069813, 1, 0, 0.3294118, 1,
1.597506, 0.4979026, 1.399277, 1, 0, 0.3254902, 1,
1.605578, -1.180779, 2.599868, 1, 0, 0.3176471, 1,
1.611609, -0.6053763, 1.43726, 1, 0, 0.3137255, 1,
1.618499, 0.6366016, 0.4080773, 1, 0, 0.3058824, 1,
1.622072, -0.01041297, 4.26716, 1, 0, 0.2980392, 1,
1.640772, 0.5449991, 2.149155, 1, 0, 0.2941177, 1,
1.648874, -0.6800821, 2.291463, 1, 0, 0.2862745, 1,
1.661441, 0.1417052, 1.231495, 1, 0, 0.282353, 1,
1.671823, -0.5330564, 1.185531, 1, 0, 0.2745098, 1,
1.673926, 0.083232, 1.932085, 1, 0, 0.2705882, 1,
1.687998, 2.062506, 0.9418835, 1, 0, 0.2627451, 1,
1.694183, 0.1645023, 2.684439, 1, 0, 0.2588235, 1,
1.696802, -1.174042, 2.387794, 1, 0, 0.2509804, 1,
1.70329, 0.3579754, 0.06749363, 1, 0, 0.2470588, 1,
1.707317, 0.3201009, 1.25667, 1, 0, 0.2392157, 1,
1.747781, -1.495532, 3.969283, 1, 0, 0.2352941, 1,
1.749761, 0.1821921, 1.817074, 1, 0, 0.227451, 1,
1.749796, -1.090024, 0.8378289, 1, 0, 0.2235294, 1,
1.752668, -3.269184, 3.274609, 1, 0, 0.2156863, 1,
1.757706, 0.4616607, 1.839346, 1, 0, 0.2117647, 1,
1.759038, -0.4570112, 0.847404, 1, 0, 0.2039216, 1,
1.76216, -1.663126, 0.7486343, 1, 0, 0.1960784, 1,
1.772266, 1.443658, 0.7394556, 1, 0, 0.1921569, 1,
1.780181, -0.5412467, 1.199294, 1, 0, 0.1843137, 1,
1.790624, -2.009409, 3.392381, 1, 0, 0.1803922, 1,
1.797207, -0.9119138, 0.9653096, 1, 0, 0.172549, 1,
1.830198, -1.246831, 3.501732, 1, 0, 0.1686275, 1,
1.830912, -1.165559, 2.310691, 1, 0, 0.1607843, 1,
1.852936, -0.7813442, 1.774615, 1, 0, 0.1568628, 1,
1.92427, -0.5584456, 2.508779, 1, 0, 0.1490196, 1,
1.925357, -0.8154989, 3.018074, 1, 0, 0.145098, 1,
2.011119, -0.09448579, 0.8605016, 1, 0, 0.1372549, 1,
2.032622, -1.988526, -0.5927833, 1, 0, 0.1333333, 1,
2.048448, -1.878321, 2.753871, 1, 0, 0.1254902, 1,
2.086376, -0.941599, 2.613683, 1, 0, 0.1215686, 1,
2.091518, 0.8581652, 1.591892, 1, 0, 0.1137255, 1,
2.164137, 0.1011254, 0.2527529, 1, 0, 0.1098039, 1,
2.201917, -0.2420414, 3.853771, 1, 0, 0.1019608, 1,
2.216346, -0.2205698, 1.556849, 1, 0, 0.09411765, 1,
2.265479, 0.4851314, 1.981495, 1, 0, 0.09019608, 1,
2.265735, -0.08821103, -0.2612855, 1, 0, 0.08235294, 1,
2.277187, -1.6072, 2.989959, 1, 0, 0.07843138, 1,
2.286657, 0.9123494, 2.669613, 1, 0, 0.07058824, 1,
2.342746, 0.04981509, 2.245102, 1, 0, 0.06666667, 1,
2.345963, -0.6650801, 0.5155378, 1, 0, 0.05882353, 1,
2.355348, -0.9099293, 3.252751, 1, 0, 0.05490196, 1,
2.35545, -0.742382, 2.675627, 1, 0, 0.04705882, 1,
2.543391, 0.4450089, 1.144026, 1, 0, 0.04313726, 1,
2.608927, -0.2094499, 2.558863, 1, 0, 0.03529412, 1,
2.630217, 0.6269152, 0.9389741, 1, 0, 0.03137255, 1,
2.704973, -1.201195, 2.210661, 1, 0, 0.02352941, 1,
2.813674, 0.8903372, 0.5536129, 1, 0, 0.01960784, 1,
2.943416, 1.150514, 2.580646, 1, 0, 0.01176471, 1,
3.193957, 2.237137, 1.892394, 1, 0, 0.007843138, 1
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
-0.1332419, -4.346536, -6.326369, 0, -0.5, 0.5, 0.5,
-0.1332419, -4.346536, -6.326369, 1, -0.5, 0.5, 0.5,
-0.1332419, -4.346536, -6.326369, 1, 1.5, 0.5, 0.5,
-0.1332419, -4.346536, -6.326369, 0, 1.5, 0.5, 0.5
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
-4.588361, -0.1044686, -6.326369, 0, -0.5, 0.5, 0.5,
-4.588361, -0.1044686, -6.326369, 1, -0.5, 0.5, 0.5,
-4.588361, -0.1044686, -6.326369, 1, 1.5, 0.5, 0.5,
-4.588361, -0.1044686, -6.326369, 0, 1.5, 0.5, 0.5
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
-4.588361, -4.346536, 0.4460187, 0, -0.5, 0.5, 0.5,
-4.588361, -4.346536, 0.4460187, 1, -0.5, 0.5, 0.5,
-4.588361, -4.346536, 0.4460187, 1, 1.5, 0.5, 0.5,
-4.588361, -4.346536, 0.4460187, 0, 1.5, 0.5, 0.5
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
-3, -3.367598, -4.76351,
3, -3.367598, -4.76351,
-3, -3.367598, -4.76351,
-3, -3.530754, -5.023987,
-2, -3.367598, -4.76351,
-2, -3.530754, -5.023987,
-1, -3.367598, -4.76351,
-1, -3.530754, -5.023987,
0, -3.367598, -4.76351,
0, -3.530754, -5.023987,
1, -3.367598, -4.76351,
1, -3.530754, -5.023987,
2, -3.367598, -4.76351,
2, -3.530754, -5.023987,
3, -3.367598, -4.76351,
3, -3.530754, -5.023987
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
-3, -3.857067, -5.54494, 0, -0.5, 0.5, 0.5,
-3, -3.857067, -5.54494, 1, -0.5, 0.5, 0.5,
-3, -3.857067, -5.54494, 1, 1.5, 0.5, 0.5,
-3, -3.857067, -5.54494, 0, 1.5, 0.5, 0.5,
-2, -3.857067, -5.54494, 0, -0.5, 0.5, 0.5,
-2, -3.857067, -5.54494, 1, -0.5, 0.5, 0.5,
-2, -3.857067, -5.54494, 1, 1.5, 0.5, 0.5,
-2, -3.857067, -5.54494, 0, 1.5, 0.5, 0.5,
-1, -3.857067, -5.54494, 0, -0.5, 0.5, 0.5,
-1, -3.857067, -5.54494, 1, -0.5, 0.5, 0.5,
-1, -3.857067, -5.54494, 1, 1.5, 0.5, 0.5,
-1, -3.857067, -5.54494, 0, 1.5, 0.5, 0.5,
0, -3.857067, -5.54494, 0, -0.5, 0.5, 0.5,
0, -3.857067, -5.54494, 1, -0.5, 0.5, 0.5,
0, -3.857067, -5.54494, 1, 1.5, 0.5, 0.5,
0, -3.857067, -5.54494, 0, 1.5, 0.5, 0.5,
1, -3.857067, -5.54494, 0, -0.5, 0.5, 0.5,
1, -3.857067, -5.54494, 1, -0.5, 0.5, 0.5,
1, -3.857067, -5.54494, 1, 1.5, 0.5, 0.5,
1, -3.857067, -5.54494, 0, 1.5, 0.5, 0.5,
2, -3.857067, -5.54494, 0, -0.5, 0.5, 0.5,
2, -3.857067, -5.54494, 1, -0.5, 0.5, 0.5,
2, -3.857067, -5.54494, 1, 1.5, 0.5, 0.5,
2, -3.857067, -5.54494, 0, 1.5, 0.5, 0.5,
3, -3.857067, -5.54494, 0, -0.5, 0.5, 0.5,
3, -3.857067, -5.54494, 1, -0.5, 0.5, 0.5,
3, -3.857067, -5.54494, 1, 1.5, 0.5, 0.5,
3, -3.857067, -5.54494, 0, 1.5, 0.5, 0.5
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
-3.560256, -3, -4.76351,
-3.560256, 3, -4.76351,
-3.560256, -3, -4.76351,
-3.731607, -3, -5.023987,
-3.560256, -2, -4.76351,
-3.731607, -2, -5.023987,
-3.560256, -1, -4.76351,
-3.731607, -1, -5.023987,
-3.560256, 0, -4.76351,
-3.731607, 0, -5.023987,
-3.560256, 1, -4.76351,
-3.731607, 1, -5.023987,
-3.560256, 2, -4.76351,
-3.731607, 2, -5.023987,
-3.560256, 3, -4.76351,
-3.731607, 3, -5.023987
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
-4.074308, -3, -5.54494, 0, -0.5, 0.5, 0.5,
-4.074308, -3, -5.54494, 1, -0.5, 0.5, 0.5,
-4.074308, -3, -5.54494, 1, 1.5, 0.5, 0.5,
-4.074308, -3, -5.54494, 0, 1.5, 0.5, 0.5,
-4.074308, -2, -5.54494, 0, -0.5, 0.5, 0.5,
-4.074308, -2, -5.54494, 1, -0.5, 0.5, 0.5,
-4.074308, -2, -5.54494, 1, 1.5, 0.5, 0.5,
-4.074308, -2, -5.54494, 0, 1.5, 0.5, 0.5,
-4.074308, -1, -5.54494, 0, -0.5, 0.5, 0.5,
-4.074308, -1, -5.54494, 1, -0.5, 0.5, 0.5,
-4.074308, -1, -5.54494, 1, 1.5, 0.5, 0.5,
-4.074308, -1, -5.54494, 0, 1.5, 0.5, 0.5,
-4.074308, 0, -5.54494, 0, -0.5, 0.5, 0.5,
-4.074308, 0, -5.54494, 1, -0.5, 0.5, 0.5,
-4.074308, 0, -5.54494, 1, 1.5, 0.5, 0.5,
-4.074308, 0, -5.54494, 0, 1.5, 0.5, 0.5,
-4.074308, 1, -5.54494, 0, -0.5, 0.5, 0.5,
-4.074308, 1, -5.54494, 1, -0.5, 0.5, 0.5,
-4.074308, 1, -5.54494, 1, 1.5, 0.5, 0.5,
-4.074308, 1, -5.54494, 0, 1.5, 0.5, 0.5,
-4.074308, 2, -5.54494, 0, -0.5, 0.5, 0.5,
-4.074308, 2, -5.54494, 1, -0.5, 0.5, 0.5,
-4.074308, 2, -5.54494, 1, 1.5, 0.5, 0.5,
-4.074308, 2, -5.54494, 0, 1.5, 0.5, 0.5,
-4.074308, 3, -5.54494, 0, -0.5, 0.5, 0.5,
-4.074308, 3, -5.54494, 1, -0.5, 0.5, 0.5,
-4.074308, 3, -5.54494, 1, 1.5, 0.5, 0.5,
-4.074308, 3, -5.54494, 0, 1.5, 0.5, 0.5
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
-3.560256, -3.367598, -4,
-3.560256, -3.367598, 4,
-3.560256, -3.367598, -4,
-3.731607, -3.530754, -4,
-3.560256, -3.367598, -2,
-3.731607, -3.530754, -2,
-3.560256, -3.367598, 0,
-3.731607, -3.530754, 0,
-3.560256, -3.367598, 2,
-3.731607, -3.530754, 2,
-3.560256, -3.367598, 4,
-3.731607, -3.530754, 4
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
-4.074308, -3.857067, -4, 0, -0.5, 0.5, 0.5,
-4.074308, -3.857067, -4, 1, -0.5, 0.5, 0.5,
-4.074308, -3.857067, -4, 1, 1.5, 0.5, 0.5,
-4.074308, -3.857067, -4, 0, 1.5, 0.5, 0.5,
-4.074308, -3.857067, -2, 0, -0.5, 0.5, 0.5,
-4.074308, -3.857067, -2, 1, -0.5, 0.5, 0.5,
-4.074308, -3.857067, -2, 1, 1.5, 0.5, 0.5,
-4.074308, -3.857067, -2, 0, 1.5, 0.5, 0.5,
-4.074308, -3.857067, 0, 0, -0.5, 0.5, 0.5,
-4.074308, -3.857067, 0, 1, -0.5, 0.5, 0.5,
-4.074308, -3.857067, 0, 1, 1.5, 0.5, 0.5,
-4.074308, -3.857067, 0, 0, 1.5, 0.5, 0.5,
-4.074308, -3.857067, 2, 0, -0.5, 0.5, 0.5,
-4.074308, -3.857067, 2, 1, -0.5, 0.5, 0.5,
-4.074308, -3.857067, 2, 1, 1.5, 0.5, 0.5,
-4.074308, -3.857067, 2, 0, 1.5, 0.5, 0.5,
-4.074308, -3.857067, 4, 0, -0.5, 0.5, 0.5,
-4.074308, -3.857067, 4, 1, -0.5, 0.5, 0.5,
-4.074308, -3.857067, 4, 1, 1.5, 0.5, 0.5,
-4.074308, -3.857067, 4, 0, 1.5, 0.5, 0.5
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
-3.560256, -3.367598, -4.76351,
-3.560256, 3.15866, -4.76351,
-3.560256, -3.367598, 5.655548,
-3.560256, 3.15866, 5.655548,
-3.560256, -3.367598, -4.76351,
-3.560256, -3.367598, 5.655548,
-3.560256, 3.15866, -4.76351,
-3.560256, 3.15866, 5.655548,
-3.560256, -3.367598, -4.76351,
3.293772, -3.367598, -4.76351,
-3.560256, -3.367598, 5.655548,
3.293772, -3.367598, 5.655548,
-3.560256, 3.15866, -4.76351,
3.293772, 3.15866, -4.76351,
-3.560256, 3.15866, 5.655548,
3.293772, 3.15866, 5.655548,
3.293772, -3.367598, -4.76351,
3.293772, 3.15866, -4.76351,
3.293772, -3.367598, 5.655548,
3.293772, 3.15866, 5.655548,
3.293772, -3.367598, -4.76351,
3.293772, -3.367598, 5.655548,
3.293772, 3.15866, -4.76351,
3.293772, 3.15866, 5.655548
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
var radius = 7.516173;
var distance = 33.4403;
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
mvMatrix.translate( 0.1332419, 0.1044686, -0.4460187 );
mvMatrix.scale( 1.185673, 1.245221, 0.7799778 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.4403);
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
copper_arsenate<-read.table("copper_arsenate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-copper_arsenate$V2
```

```
## Error in eval(expr, envir, enclos): object 'copper_arsenate' not found
```

```r
y<-copper_arsenate$V3
```

```
## Error in eval(expr, envir, enclos): object 'copper_arsenate' not found
```

```r
z<-copper_arsenate$V4
```

```
## Error in eval(expr, envir, enclos): object 'copper_arsenate' not found
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
-3.46044, -0.5819437, -2.103741, 0, 0, 1, 1, 1,
-3.123722, 0.07751976, -2.016748, 1, 0, 0, 1, 1,
-2.913875, 0.1906992, -2.143455, 1, 0, 0, 1, 1,
-2.734241, -0.161772, -1.653543, 1, 0, 0, 1, 1,
-2.575751, -1.104393, -0.9390785, 1, 0, 0, 1, 1,
-2.5634, 1.707063, -0.1121612, 1, 0, 0, 1, 1,
-2.52204, -1.305372, -1.354738, 0, 0, 0, 1, 1,
-2.40539, 0.253119, -2.259259, 0, 0, 0, 1, 1,
-2.377376, -0.2562453, -2.041522, 0, 0, 0, 1, 1,
-2.345351, -0.2616684, -1.959748, 0, 0, 0, 1, 1,
-2.314008, 1.573471, -0.3137752, 0, 0, 0, 1, 1,
-2.298013, -1.118187, -1.896743, 0, 0, 0, 1, 1,
-2.267636, -1.748075, -3.181478, 0, 0, 0, 1, 1,
-2.212282, 0.9165019, -0.2328171, 1, 1, 1, 1, 1,
-2.210564, -0.6587005, -3.010781, 1, 1, 1, 1, 1,
-2.201982, -2.524926, -2.984442, 1, 1, 1, 1, 1,
-2.135652, -0.4747245, -1.260194, 1, 1, 1, 1, 1,
-2.132604, -0.07112192, -1.246713, 1, 1, 1, 1, 1,
-2.13006, 0.4941429, -1.231625, 1, 1, 1, 1, 1,
-2.124682, 0.7376818, -2.983736, 1, 1, 1, 1, 1,
-2.100005, -0.4498938, -0.9185552, 1, 1, 1, 1, 1,
-2.061383, -0.2693742, -1.329117, 1, 1, 1, 1, 1,
-2.039147, 0.9283066, -1.350258, 1, 1, 1, 1, 1,
-2.029703, 1.928993, -0.6731891, 1, 1, 1, 1, 1,
-2.02866, 0.937595, -1.356949, 1, 1, 1, 1, 1,
-1.996944, -0.01704462, -0.986974, 1, 1, 1, 1, 1,
-1.960176, -1.127778, -3.340533, 1, 1, 1, 1, 1,
-1.953497, 1.433098, -2.622472, 1, 1, 1, 1, 1,
-1.878376, 1.146986, -2.032925, 0, 0, 1, 1, 1,
-1.872801, 0.2272805, -2.157161, 1, 0, 0, 1, 1,
-1.855065, -0.6810429, -1.493468, 1, 0, 0, 1, 1,
-1.838538, 1.031917, -3.101091, 1, 0, 0, 1, 1,
-1.835591, -0.9713128, -2.206377, 1, 0, 0, 1, 1,
-1.818356, -0.2120312, -1.999462, 1, 0, 0, 1, 1,
-1.791064, 0.9838085, -1.458612, 0, 0, 0, 1, 1,
-1.7855, -0.151465, -1.190666, 0, 0, 0, 1, 1,
-1.782761, 2.977522, -1.266011, 0, 0, 0, 1, 1,
-1.779195, 0.4638128, -2.868006, 0, 0, 0, 1, 1,
-1.769459, -0.4445881, -3.280182, 0, 0, 0, 1, 1,
-1.761239, -0.1774129, -3.482856, 0, 0, 0, 1, 1,
-1.754549, -0.5934503, -4.470725, 0, 0, 0, 1, 1,
-1.738896, -0.1243048, -1.920213, 1, 1, 1, 1, 1,
-1.733489, 2.123656, -0.3298457, 1, 1, 1, 1, 1,
-1.729875, 1.212549, -0.3388392, 1, 1, 1, 1, 1,
-1.728227, -1.050566, -0.5667972, 1, 1, 1, 1, 1,
-1.725634, 0.2494715, -2.23047, 1, 1, 1, 1, 1,
-1.703724, -0.4989011, -0.3796999, 1, 1, 1, 1, 1,
-1.69793, -1.878889, -1.653986, 1, 1, 1, 1, 1,
-1.689316, -1.275011, -2.126363, 1, 1, 1, 1, 1,
-1.670998, 1.152466, -0.4501996, 1, 1, 1, 1, 1,
-1.669904, -0.8384873, -2.242978, 1, 1, 1, 1, 1,
-1.666678, 0.3455054, -1.580764, 1, 1, 1, 1, 1,
-1.663031, 0.4759918, -0.01792483, 1, 1, 1, 1, 1,
-1.648457, -0.9568104, -2.780386, 1, 1, 1, 1, 1,
-1.642235, 0.3312277, -1.639525, 1, 1, 1, 1, 1,
-1.63631, -0.5507631, -2.955475, 1, 1, 1, 1, 1,
-1.628624, -1.265708, -1.547148, 0, 0, 1, 1, 1,
-1.616905, 1.50256, -0.1783666, 1, 0, 0, 1, 1,
-1.605461, 0.7183016, -1.409669, 1, 0, 0, 1, 1,
-1.58741, -0.1056018, -2.060705, 1, 0, 0, 1, 1,
-1.570584, -0.6945247, -0.7505515, 1, 0, 0, 1, 1,
-1.548157, 0.8315466, -1.43917, 1, 0, 0, 1, 1,
-1.54582, -0.7157586, -3.29162, 0, 0, 0, 1, 1,
-1.535035, -0.6791922, -1.177814, 0, 0, 0, 1, 1,
-1.526937, 0.5098482, -1.285851, 0, 0, 0, 1, 1,
-1.5192, -1.306409, -2.433568, 0, 0, 0, 1, 1,
-1.512881, -0.1976242, -1.790682, 0, 0, 0, 1, 1,
-1.51117, -0.3915037, -1.423783, 0, 0, 0, 1, 1,
-1.506113, -1.242504, -2.407772, 0, 0, 0, 1, 1,
-1.502094, 1.394719, -1.750654, 1, 1, 1, 1, 1,
-1.498821, 0.2275195, -0.8324544, 1, 1, 1, 1, 1,
-1.493758, -0.3882375, -2.441413, 1, 1, 1, 1, 1,
-1.482147, 0.9971692, -2.013443, 1, 1, 1, 1, 1,
-1.481311, 0.9528477, -1.704322, 1, 1, 1, 1, 1,
-1.468534, 1.23561, -0.9170853, 1, 1, 1, 1, 1,
-1.456776, -0.06413847, -0.4851538, 1, 1, 1, 1, 1,
-1.432824, 0.4882244, -0.6440074, 1, 1, 1, 1, 1,
-1.423329, -1.215696, -2.517612, 1, 1, 1, 1, 1,
-1.419575, 0.4774672, 0.1596788, 1, 1, 1, 1, 1,
-1.415852, 0.9240522, -2.699579, 1, 1, 1, 1, 1,
-1.412944, -0.7520269, -0.9253467, 1, 1, 1, 1, 1,
-1.410378, 0.1621423, -2.191321, 1, 1, 1, 1, 1,
-1.408457, -0.6312439, -1.292958, 1, 1, 1, 1, 1,
-1.376112, 0.3894066, -1.765646, 1, 1, 1, 1, 1,
-1.368736, -2.504077, -1.434679, 0, 0, 1, 1, 1,
-1.362692, 0.3231607, -1.827993, 1, 0, 0, 1, 1,
-1.342672, -0.4135062, -0.9727907, 1, 0, 0, 1, 1,
-1.339079, 1.266312, -0.8538973, 1, 0, 0, 1, 1,
-1.331915, -0.1664164, -1.163559, 1, 0, 0, 1, 1,
-1.331303, -0.167489, -1.068757, 1, 0, 0, 1, 1,
-1.32669, -0.3072131, -1.095626, 0, 0, 0, 1, 1,
-1.320526, -0.3228622, -3.65123, 0, 0, 0, 1, 1,
-1.313989, -1.372527, -0.9182355, 0, 0, 0, 1, 1,
-1.304422, -1.471818, -2.90323, 0, 0, 0, 1, 1,
-1.298965, -0.7449946, -4.005726, 0, 0, 0, 1, 1,
-1.286381, -0.6433299, -2.250819, 0, 0, 0, 1, 1,
-1.280868, -0.6037826, -1.502924, 0, 0, 0, 1, 1,
-1.276972, 0.8554932, -0.1282303, 1, 1, 1, 1, 1,
-1.275846, -1.125756, -2.459121, 1, 1, 1, 1, 1,
-1.273266, 0.02269007, -2.132338, 1, 1, 1, 1, 1,
-1.261073, 1.137812, -1.082703, 1, 1, 1, 1, 1,
-1.233068, 0.8222223, -2.08496, 1, 1, 1, 1, 1,
-1.225691, -0.3946299, -1.161036, 1, 1, 1, 1, 1,
-1.218103, 0.9084397, 0.314856, 1, 1, 1, 1, 1,
-1.216936, 0.914174, -0.9325198, 1, 1, 1, 1, 1,
-1.210137, -0.3918535, -1.637398, 1, 1, 1, 1, 1,
-1.203925, -0.880347, -3.202833, 1, 1, 1, 1, 1,
-1.202045, 0.1177845, -2.064328, 1, 1, 1, 1, 1,
-1.200102, 0.6071529, -1.45276, 1, 1, 1, 1, 1,
-1.197683, -0.1819499, -1.614372, 1, 1, 1, 1, 1,
-1.195026, -1.208942, -3.162235, 1, 1, 1, 1, 1,
-1.190809, -1.418832, -3.182079, 1, 1, 1, 1, 1,
-1.185638, -2.23541, -3.58022, 0, 0, 1, 1, 1,
-1.182299, -1.211075, -1.424979, 1, 0, 0, 1, 1,
-1.180954, 0.934646, -1.423622, 1, 0, 0, 1, 1,
-1.1743, 0.5458173, -0.198732, 1, 0, 0, 1, 1,
-1.174288, -0.09356093, 0.03252107, 1, 0, 0, 1, 1,
-1.173215, -0.2013802, -3.147565, 1, 0, 0, 1, 1,
-1.170158, -0.8821861, -2.406518, 0, 0, 0, 1, 1,
-1.158965, 0.39212, -1.312788, 0, 0, 0, 1, 1,
-1.154303, -0.2571409, -2.728209, 0, 0, 0, 1, 1,
-1.153641, 1.092942, -2.7642, 0, 0, 0, 1, 1,
-1.152579, -0.462863, -1.095208, 0, 0, 0, 1, 1,
-1.152083, 1.473502, -0.9022857, 0, 0, 0, 1, 1,
-1.150065, 0.5128667, -1.647302, 0, 0, 0, 1, 1,
-1.147387, -0.7142636, -1.604248, 1, 1, 1, 1, 1,
-1.145846, 0.5013658, -1.859089, 1, 1, 1, 1, 1,
-1.140206, -0.6875902, -1.529441, 1, 1, 1, 1, 1,
-1.134841, 1.889238, 0.7003536, 1, 1, 1, 1, 1,
-1.131678, -1.549045, -2.046223, 1, 1, 1, 1, 1,
-1.126163, 0.2712855, -1.858566, 1, 1, 1, 1, 1,
-1.12259, -0.6815131, -2.629226, 1, 1, 1, 1, 1,
-1.118837, 0.6957145, -1.302679, 1, 1, 1, 1, 1,
-1.114324, -0.9808511, -1.485414, 1, 1, 1, 1, 1,
-1.098791, -0.02039439, -2.543726, 1, 1, 1, 1, 1,
-1.098352, 1.380714, 0.07920289, 1, 1, 1, 1, 1,
-1.090254, 1.331199, -2.78015, 1, 1, 1, 1, 1,
-1.089939, 0.1360025, -1.315502, 1, 1, 1, 1, 1,
-1.089087, 0.6586828, -0.7869918, 1, 1, 1, 1, 1,
-1.088602, -1.122737, -3.047264, 1, 1, 1, 1, 1,
-1.088247, 1.403323, -0.5654067, 0, 0, 1, 1, 1,
-1.08419, -0.1362731, -3.383255, 1, 0, 0, 1, 1,
-1.082152, -0.222932, -1.327497, 1, 0, 0, 1, 1,
-1.081429, 2.248793, -0.1724152, 1, 0, 0, 1, 1,
-1.080425, 0.6132922, -1.702373, 1, 0, 0, 1, 1,
-1.078908, -1.050393, -1.545259, 1, 0, 0, 1, 1,
-1.076795, -0.02326573, -2.276942, 0, 0, 0, 1, 1,
-1.064219, 0.2865489, -1.565119, 0, 0, 0, 1, 1,
-1.059167, 0.1267876, -1.602971, 0, 0, 0, 1, 1,
-1.059011, -0.2687862, -1.40675, 0, 0, 0, 1, 1,
-1.055554, -0.23621, -2.648968, 0, 0, 0, 1, 1,
-1.049438, -0.9120103, -3.211047, 0, 0, 0, 1, 1,
-1.044034, 0.2480386, -1.565242, 0, 0, 0, 1, 1,
-1.039908, -0.4627698, -1.365692, 1, 1, 1, 1, 1,
-1.037424, 0.05141111, -0.701708, 1, 1, 1, 1, 1,
-1.029718, 1.128738, -0.480664, 1, 1, 1, 1, 1,
-1.022775, -1.331676, -2.266201, 1, 1, 1, 1, 1,
-1.019993, -0.9911131, -2.177387, 1, 1, 1, 1, 1,
-1.019714, 0.8530962, -0.5257665, 1, 1, 1, 1, 1,
-1.018557, 0.5407543, -1.483846, 1, 1, 1, 1, 1,
-1.009209, 0.6556084, -1.16504, 1, 1, 1, 1, 1,
-1.001511, -0.1535722, -1.771012, 1, 1, 1, 1, 1,
-0.9969651, -0.266727, -0.03973516, 1, 1, 1, 1, 1,
-0.9947455, 0.7728955, -2.297616, 1, 1, 1, 1, 1,
-0.9823949, -0.6332246, -2.37475, 1, 1, 1, 1, 1,
-0.9655635, -0.05975717, -2.007109, 1, 1, 1, 1, 1,
-0.9622927, -0.4044091, -1.552888, 1, 1, 1, 1, 1,
-0.9513263, -0.2290927, -2.391759, 1, 1, 1, 1, 1,
-0.9460428, 0.8439236, 0.2882801, 0, 0, 1, 1, 1,
-0.9412597, -2.275254, -4.123408, 1, 0, 0, 1, 1,
-0.9384388, -0.01737769, -2.58725, 1, 0, 0, 1, 1,
-0.9346092, 0.02283619, -2.848798, 1, 0, 0, 1, 1,
-0.9345277, 0.9368463, -0.7728895, 1, 0, 0, 1, 1,
-0.9296079, 0.5872665, -0.2775445, 1, 0, 0, 1, 1,
-0.9150719, 0.3861011, -2.03362, 0, 0, 0, 1, 1,
-0.9146999, 0.9576612, -0.4646079, 0, 0, 0, 1, 1,
-0.9107891, -0.2473111, -1.01364, 0, 0, 0, 1, 1,
-0.9039797, 1.34, -0.6426515, 0, 0, 0, 1, 1,
-0.9006457, 0.129906, 0.9330956, 0, 0, 0, 1, 1,
-0.8999843, 0.4724055, -0.08803941, 0, 0, 0, 1, 1,
-0.8997794, -1.956753, -2.45042, 0, 0, 0, 1, 1,
-0.8973028, 0.2195212, -1.871572, 1, 1, 1, 1, 1,
-0.8893843, -0.745266, -1.921767, 1, 1, 1, 1, 1,
-0.888545, 1.370686, 1.368542, 1, 1, 1, 1, 1,
-0.8873943, 0.5948047, -0.3916189, 1, 1, 1, 1, 1,
-0.8870884, 0.6523989, -1.377824, 1, 1, 1, 1, 1,
-0.8804469, -1.926058, -2.300619, 1, 1, 1, 1, 1,
-0.8760915, -0.2157212, -0.4612261, 1, 1, 1, 1, 1,
-0.8754943, 0.6068574, 0.2211663, 1, 1, 1, 1, 1,
-0.8692481, 0.2347919, 0.2087345, 1, 1, 1, 1, 1,
-0.8691092, -0.6814381, -2.748675, 1, 1, 1, 1, 1,
-0.858455, -0.3092203, -2.50341, 1, 1, 1, 1, 1,
-0.8548009, 1.109754, 0.8590407, 1, 1, 1, 1, 1,
-0.8511202, -0.1241249, -1.244613, 1, 1, 1, 1, 1,
-0.8438159, 0.1688619, 0.193809, 1, 1, 1, 1, 1,
-0.8417256, 0.8378039, 0.2306177, 1, 1, 1, 1, 1,
-0.8412305, 0.07764497, 0.4551087, 0, 0, 1, 1, 1,
-0.8398636, 0.9441476, 1.09259, 1, 0, 0, 1, 1,
-0.8311542, 0.2215794, 0.2270894, 1, 0, 0, 1, 1,
-0.8282574, -0.4473234, -1.511958, 1, 0, 0, 1, 1,
-0.8217657, -0.9879611, -2.443432, 1, 0, 0, 1, 1,
-0.8187805, -1.550096, -1.672343, 1, 0, 0, 1, 1,
-0.8110206, 0.8579454, -1.639605, 0, 0, 0, 1, 1,
-0.8015841, -1.694953, -4.244372, 0, 0, 0, 1, 1,
-0.7983062, -1.598319, -1.468166, 0, 0, 0, 1, 1,
-0.7923954, 0.160885, -0.7713879, 0, 0, 0, 1, 1,
-0.7907902, 0.1205086, -2.335553, 0, 0, 0, 1, 1,
-0.7840329, 1.184835, -0.643891, 0, 0, 0, 1, 1,
-0.7788441, 0.7759585, -1.717878, 0, 0, 0, 1, 1,
-0.7771391, 0.8085623, -1.021681, 1, 1, 1, 1, 1,
-0.7771359, 1.425022, 0.8533186, 1, 1, 1, 1, 1,
-0.7727044, -1.187988, -2.127987, 1, 1, 1, 1, 1,
-0.7657937, -0.3407241, -2.614434, 1, 1, 1, 1, 1,
-0.7595856, -0.6108788, -2.11988, 1, 1, 1, 1, 1,
-0.7595745, 0.4592506, 0.007213031, 1, 1, 1, 1, 1,
-0.7545961, 1.465553, -1.056141, 1, 1, 1, 1, 1,
-0.7425988, 0.2926874, 0.2683537, 1, 1, 1, 1, 1,
-0.7340842, -0.6856411, -2.045452, 1, 1, 1, 1, 1,
-0.7326782, 0.8489508, -1.555136, 1, 1, 1, 1, 1,
-0.7324426, 0.8829969, -1.374592, 1, 1, 1, 1, 1,
-0.7309209, -1.020908, -0.8206779, 1, 1, 1, 1, 1,
-0.7308624, -0.5511686, -2.432525, 1, 1, 1, 1, 1,
-0.7301067, -0.8027013, -2.578684, 1, 1, 1, 1, 1,
-0.7158108, -0.7749994, -3.329544, 1, 1, 1, 1, 1,
-0.7074999, -0.202671, -2.672982, 0, 0, 1, 1, 1,
-0.7049426, 0.784489, 0.01401681, 1, 0, 0, 1, 1,
-0.7001453, -0.614536, -2.183561, 1, 0, 0, 1, 1,
-0.6995108, -0.255733, -0.7919759, 1, 0, 0, 1, 1,
-0.697324, 1.148147, -0.2070974, 1, 0, 0, 1, 1,
-0.6967545, -0.08562801, -0.5484327, 1, 0, 0, 1, 1,
-0.6956046, -0.4270142, -1.187767, 0, 0, 0, 1, 1,
-0.6948169, 0.1428152, 0.6515281, 0, 0, 0, 1, 1,
-0.6875668, 0.2126062, -3.134172, 0, 0, 0, 1, 1,
-0.6857653, 0.9684882, -2.655602, 0, 0, 0, 1, 1,
-0.6840127, -1.062705, -1.767782, 0, 0, 0, 1, 1,
-0.6830831, 0.7308351, 1.526157, 0, 0, 0, 1, 1,
-0.6825473, -0.7055615, -1.795205, 0, 0, 0, 1, 1,
-0.6816046, 1.438063, -0.2053744, 1, 1, 1, 1, 1,
-0.6762668, 0.9260771, -0.3667402, 1, 1, 1, 1, 1,
-0.6760046, 0.6593727, 0.8678117, 1, 1, 1, 1, 1,
-0.6720871, 1.175547, -2.074767, 1, 1, 1, 1, 1,
-0.665161, 0.1294302, 1.045969, 1, 1, 1, 1, 1,
-0.663626, 0.4662181, -1.218216, 1, 1, 1, 1, 1,
-0.6619211, 1.284557, 0.222834, 1, 1, 1, 1, 1,
-0.660356, -0.7731206, -4.611776, 1, 1, 1, 1, 1,
-0.6574715, -0.2785764, -3.285792, 1, 1, 1, 1, 1,
-0.6567557, -0.1941464, -2.148293, 1, 1, 1, 1, 1,
-0.6543565, 0.111395, -2.907633, 1, 1, 1, 1, 1,
-0.6534823, 1.214906, -1.123771, 1, 1, 1, 1, 1,
-0.6473929, 2.400121, -0.7355952, 1, 1, 1, 1, 1,
-0.641785, 0.3507175, -1.945055, 1, 1, 1, 1, 1,
-0.6408803, -0.03168143, -1.240623, 1, 1, 1, 1, 1,
-0.6343129, 0.4377928, -0.9059201, 0, 0, 1, 1, 1,
-0.6320412, -0.2623675, -0.6666895, 1, 0, 0, 1, 1,
-0.6302505, -0.3825624, -2.396496, 1, 0, 0, 1, 1,
-0.622678, 0.8583868, -0.2627949, 1, 0, 0, 1, 1,
-0.6223333, -0.9921243, -2.717408, 1, 0, 0, 1, 1,
-0.6108872, -0.3328805, -2.453378, 1, 0, 0, 1, 1,
-0.6106499, 0.9311306, -0.5052463, 0, 0, 0, 1, 1,
-0.6076949, -1.154368, -4.343894, 0, 0, 0, 1, 1,
-0.6006406, 0.7237292, 0.1622438, 0, 0, 0, 1, 1,
-0.5996655, -2.27555, -3.98063, 0, 0, 0, 1, 1,
-0.5987424, 0.887951, -2.093658, 0, 0, 0, 1, 1,
-0.5887021, -0.6159915, -4.144024, 0, 0, 0, 1, 1,
-0.5875364, -0.5505939, -2.444191, 0, 0, 0, 1, 1,
-0.5849705, -1.146643, -2.933413, 1, 1, 1, 1, 1,
-0.5847989, -1.230443, -3.296462, 1, 1, 1, 1, 1,
-0.5823008, 0.7397246, 0.8034449, 1, 1, 1, 1, 1,
-0.580803, 0.1565995, -1.39207, 1, 1, 1, 1, 1,
-0.5763988, -0.4272062, -1.659072, 1, 1, 1, 1, 1,
-0.5757658, -0.4885479, -4.530012, 1, 1, 1, 1, 1,
-0.5746562, -0.361471, -4.072206, 1, 1, 1, 1, 1,
-0.5741623, -0.8185166, -2.188425, 1, 1, 1, 1, 1,
-0.5730762, -0.3624038, -3.542404, 1, 1, 1, 1, 1,
-0.5702636, 1.20858, -1.159777, 1, 1, 1, 1, 1,
-0.5700547, -0.9703887, -0.4515527, 1, 1, 1, 1, 1,
-0.5597538, 0.5109181, 1.141445, 1, 1, 1, 1, 1,
-0.5588118, 1.389391, 0.871645, 1, 1, 1, 1, 1,
-0.556998, 0.7682444, -1.103843, 1, 1, 1, 1, 1,
-0.5562591, -1.361729, -2.617776, 1, 1, 1, 1, 1,
-0.5522518, -1.023948, -1.264289, 0, 0, 1, 1, 1,
-0.5500214, 0.6448441, -0.9071391, 1, 0, 0, 1, 1,
-0.5499807, -0.01560087, -1.274813, 1, 0, 0, 1, 1,
-0.5469636, -0.4452927, -2.050457, 1, 0, 0, 1, 1,
-0.5449666, 0.7926474, -0.700613, 1, 0, 0, 1, 1,
-0.5363681, -1.322266, -2.067497, 1, 0, 0, 1, 1,
-0.5357289, -0.6500891, -2.848545, 0, 0, 0, 1, 1,
-0.5354264, -1.966656, -1.084147, 0, 0, 0, 1, 1,
-0.5330649, -0.8676916, -2.774626, 0, 0, 0, 1, 1,
-0.5296789, -1.731187, -3.308527, 0, 0, 0, 1, 1,
-0.5281766, -0.374475, -1.343087, 0, 0, 0, 1, 1,
-0.5276546, -0.8534386, -1.523469, 0, 0, 0, 1, 1,
-0.5239419, 2.620902, -0.2005173, 0, 0, 0, 1, 1,
-0.5217393, 0.8390747, -1.361902, 1, 1, 1, 1, 1,
-0.5210365, 0.2924218, -2.546125, 1, 1, 1, 1, 1,
-0.5198483, 0.6440567, -1.418669, 1, 1, 1, 1, 1,
-0.5166553, -1.090746, -2.254518, 1, 1, 1, 1, 1,
-0.5166029, 0.1368217, -1.906765, 1, 1, 1, 1, 1,
-0.5151149, -1.241276, -2.260386, 1, 1, 1, 1, 1,
-0.5130581, -0.2063708, -2.714602, 1, 1, 1, 1, 1,
-0.5019023, -0.7167591, -2.044475, 1, 1, 1, 1, 1,
-0.5018641, 1.219665, -2.735854, 1, 1, 1, 1, 1,
-0.4917097, 1.382053, -0.9139827, 1, 1, 1, 1, 1,
-0.4910774, -0.9760103, -1.707827, 1, 1, 1, 1, 1,
-0.4892986, -1.582792, -1.8073, 1, 1, 1, 1, 1,
-0.4874743, -0.3360595, -1.63584, 1, 1, 1, 1, 1,
-0.4863045, -0.4570051, -4.351291, 1, 1, 1, 1, 1,
-0.4816758, -0.6217896, -2.457117, 1, 1, 1, 1, 1,
-0.4801075, 0.7162194, -0.5963842, 0, 0, 1, 1, 1,
-0.4798984, -0.5112464, -2.356275, 1, 0, 0, 1, 1,
-0.4781442, -0.3737527, -1.085801, 1, 0, 0, 1, 1,
-0.4747315, 0.41175, -0.1851401, 1, 0, 0, 1, 1,
-0.4687929, 1.38126, 0.5969153, 1, 0, 0, 1, 1,
-0.4672818, 0.7814193, -1.285253, 1, 0, 0, 1, 1,
-0.4648069, 0.5649282, -0.4617633, 0, 0, 0, 1, 1,
-0.4579588, -0.6088636, -1.758791, 0, 0, 0, 1, 1,
-0.4480582, -1.513421, -2.173847, 0, 0, 0, 1, 1,
-0.4464149, -0.40262, -2.533829, 0, 0, 0, 1, 1,
-0.4416926, -0.05319297, -1.595715, 0, 0, 0, 1, 1,
-0.4406324, -1.21161, -2.930146, 0, 0, 0, 1, 1,
-0.4355194, -0.9366572, -2.823173, 0, 0, 0, 1, 1,
-0.4353695, 0.9951901, 1.903663, 1, 1, 1, 1, 1,
-0.4267259, -0.8405246, -2.958757, 1, 1, 1, 1, 1,
-0.4143955, -0.7323836, -1.811473, 1, 1, 1, 1, 1,
-0.4084112, 0.04799328, -2.869258, 1, 1, 1, 1, 1,
-0.4077622, -1.251412, -2.815932, 1, 1, 1, 1, 1,
-0.4075499, 0.7134538, -0.2939692, 1, 1, 1, 1, 1,
-0.4065908, -0.2155489, -0.6373451, 1, 1, 1, 1, 1,
-0.4064018, 0.7651422, -1.363996, 1, 1, 1, 1, 1,
-0.4054671, -2.017255, -1.830655, 1, 1, 1, 1, 1,
-0.4004947, -1.262572, -2.259627, 1, 1, 1, 1, 1,
-0.396769, 0.3666299, -1.894296, 1, 1, 1, 1, 1,
-0.3962697, -0.798885, -1.741195, 1, 1, 1, 1, 1,
-0.395628, -0.3474692, -2.254928, 1, 1, 1, 1, 1,
-0.3948072, 0.3887387, -1.517567, 1, 1, 1, 1, 1,
-0.3943066, 1.683578, 0.7343686, 1, 1, 1, 1, 1,
-0.3911101, 1.176992, 0.3783801, 0, 0, 1, 1, 1,
-0.3905089, 0.3366754, -0.4443395, 1, 0, 0, 1, 1,
-0.3814202, -1.185272, -2.375187, 1, 0, 0, 1, 1,
-0.3789635, -1.558573, -2.647637, 1, 0, 0, 1, 1,
-0.3762593, 0.001739353, -0.05235023, 1, 0, 0, 1, 1,
-0.37512, -0.4062518, -1.141338, 1, 0, 0, 1, 1,
-0.3748105, 1.786826, -0.4170802, 0, 0, 0, 1, 1,
-0.3729295, -1.047985, -3.144816, 0, 0, 0, 1, 1,
-0.3651633, -0.9166824, -2.710558, 0, 0, 0, 1, 1,
-0.36187, -0.04380956, -1.693774, 0, 0, 0, 1, 1,
-0.358811, -1.53674, -4.062707, 0, 0, 0, 1, 1,
-0.3484402, 0.3206924, -0.9701555, 0, 0, 0, 1, 1,
-0.3463989, 0.7237889, -1.061214, 0, 0, 0, 1, 1,
-0.3463264, -0.7382146, -3.694141, 1, 1, 1, 1, 1,
-0.3461725, 0.2988352, 0.1510098, 1, 1, 1, 1, 1,
-0.3454573, -0.90569, -0.7918113, 1, 1, 1, 1, 1,
-0.334824, 0.1198286, -0.9124335, 1, 1, 1, 1, 1,
-0.3335907, -1.801052, -2.575732, 1, 1, 1, 1, 1,
-0.3271061, -2.358413, -3.050076, 1, 1, 1, 1, 1,
-0.3217912, -0.1530477, -2.265378, 1, 1, 1, 1, 1,
-0.3209721, -0.1749846, -3.516015, 1, 1, 1, 1, 1,
-0.3181853, -0.7921937, -3.071722, 1, 1, 1, 1, 1,
-0.3171501, -0.8113489, -2.625408, 1, 1, 1, 1, 1,
-0.3156959, -1.36147, -4.130346, 1, 1, 1, 1, 1,
-0.3152227, -0.6746837, -3.090693, 1, 1, 1, 1, 1,
-0.3140492, 0.2799307, -0.05813271, 1, 1, 1, 1, 1,
-0.3115148, -0.5187965, -2.274638, 1, 1, 1, 1, 1,
-0.3108946, 0.09646993, -1.501287, 1, 1, 1, 1, 1,
-0.3101346, -0.4270879, -2.468076, 0, 0, 1, 1, 1,
-0.3088521, 0.5355003, -0.3994625, 1, 0, 0, 1, 1,
-0.3035803, -0.9877193, -2.810466, 1, 0, 0, 1, 1,
-0.3029276, 0.8238121, -0.9541662, 1, 0, 0, 1, 1,
-0.2947808, 1.909968, 2.048447, 1, 0, 0, 1, 1,
-0.2925554, -0.2812863, -1.926185, 1, 0, 0, 1, 1,
-0.2909534, -0.2404288, -2.506172, 0, 0, 0, 1, 1,
-0.2858978, -1.070763, -2.623752, 0, 0, 0, 1, 1,
-0.2856862, -0.9846401, -2.078719, 0, 0, 0, 1, 1,
-0.2786648, -0.3615445, -2.223193, 0, 0, 0, 1, 1,
-0.27768, -2.033968, -2.020985, 0, 0, 0, 1, 1,
-0.2774155, 0.7814916, -2.142171, 0, 0, 0, 1, 1,
-0.2746806, 0.3830838, -1.016853, 0, 0, 0, 1, 1,
-0.274381, -1.214527, -1.998225, 1, 1, 1, 1, 1,
-0.2741405, 0.549836, -0.7096031, 1, 1, 1, 1, 1,
-0.2738724, 0.06229689, -2.041045, 1, 1, 1, 1, 1,
-0.2726689, 1.267013, -1.231498, 1, 1, 1, 1, 1,
-0.2717348, 0.08877517, -2.099808, 1, 1, 1, 1, 1,
-0.2711954, -1.106555, -2.365016, 1, 1, 1, 1, 1,
-0.2694371, 0.02613658, -1.166348, 1, 1, 1, 1, 1,
-0.2641697, 0.2719731, -1.686991, 1, 1, 1, 1, 1,
-0.2624908, -0.8928329, -2.593544, 1, 1, 1, 1, 1,
-0.2537305, -0.7349188, -2.068279, 1, 1, 1, 1, 1,
-0.2529931, -0.4017791, -1.975444, 1, 1, 1, 1, 1,
-0.2486806, 0.3752006, -1.129997, 1, 1, 1, 1, 1,
-0.2461732, 1.113521, -0.7266003, 1, 1, 1, 1, 1,
-0.2453436, -0.2278541, -2.192852, 1, 1, 1, 1, 1,
-0.2423037, -0.2586071, -1.468315, 1, 1, 1, 1, 1,
-0.2416535, 0.4770592, 0.09022073, 0, 0, 1, 1, 1,
-0.2401617, 0.6085823, -0.460034, 1, 0, 0, 1, 1,
-0.236169, 0.1596504, -0.05107212, 1, 0, 0, 1, 1,
-0.2341669, -0.5871173, -3.632008, 1, 0, 0, 1, 1,
-0.2303885, 0.1728518, -0.3647376, 1, 0, 0, 1, 1,
-0.2285323, -1.193927, -3.653724, 1, 0, 0, 1, 1,
-0.2257883, -1.272786, -3.83189, 0, 0, 0, 1, 1,
-0.225498, 0.9927955, -0.7277946, 0, 0, 0, 1, 1,
-0.2253956, 0.8739755, 0.06823237, 0, 0, 0, 1, 1,
-0.2235323, -0.07931758, -1.543604, 0, 0, 0, 1, 1,
-0.221992, -1.412006, -3.559, 0, 0, 0, 1, 1,
-0.2131282, 0.3750294, 0.7946118, 0, 0, 0, 1, 1,
-0.2110603, 0.46373, -1.960454, 0, 0, 0, 1, 1,
-0.2075689, 0.1560313, -1.911964, 1, 1, 1, 1, 1,
-0.2019935, 0.827306, -0.2745957, 1, 1, 1, 1, 1,
-0.1990192, -0.795899, -1.955117, 1, 1, 1, 1, 1,
-0.1986544, -0.7088441, -1.261161, 1, 1, 1, 1, 1,
-0.1965975, -0.5253893, -1.920465, 1, 1, 1, 1, 1,
-0.1875454, -1.198838, -0.5267939, 1, 1, 1, 1, 1,
-0.1863202, 0.1581651, -1.542199, 1, 1, 1, 1, 1,
-0.1856523, -1.54379, -2.353254, 1, 1, 1, 1, 1,
-0.1826314, 0.05276917, -1.231643, 1, 1, 1, 1, 1,
-0.1809117, 1.510087, -0.6761096, 1, 1, 1, 1, 1,
-0.1801765, -0.2246202, -2.968921, 1, 1, 1, 1, 1,
-0.1793125, -0.7058822, -1.196434, 1, 1, 1, 1, 1,
-0.1762074, 0.4667093, 0.5756882, 1, 1, 1, 1, 1,
-0.1731878, -0.7337486, -3.249846, 1, 1, 1, 1, 1,
-0.1708532, 0.277824, 1.124145, 1, 1, 1, 1, 1,
-0.1705255, 0.6206588, 0.3774493, 0, 0, 1, 1, 1,
-0.1692457, -0.1555124, -0.1221099, 1, 0, 0, 1, 1,
-0.1675921, 0.7944897, -0.9232029, 1, 0, 0, 1, 1,
-0.16704, -1.18023, -4.068241, 1, 0, 0, 1, 1,
-0.1652251, 1.267965, -0.4515284, 1, 0, 0, 1, 1,
-0.1633835, -0.5514924, -1.784996, 1, 0, 0, 1, 1,
-0.1618336, -1.608566, -3.213508, 0, 0, 0, 1, 1,
-0.1561655, -0.6802999, -2.967063, 0, 0, 0, 1, 1,
-0.1537807, 0.3534485, -0.724057, 0, 0, 0, 1, 1,
-0.1535481, -1.218542, -3.313318, 0, 0, 0, 1, 1,
-0.144324, -0.3724978, -3.09752, 0, 0, 0, 1, 1,
-0.14127, -0.6269667, -2.851955, 0, 0, 0, 1, 1,
-0.1334205, -1.498946, -3.027361, 0, 0, 0, 1, 1,
-0.1255911, 0.5937428, -0.5595245, 1, 1, 1, 1, 1,
-0.1245865, 0.2063113, 0.8650575, 1, 1, 1, 1, 1,
-0.1231062, -0.6078922, -3.327536, 1, 1, 1, 1, 1,
-0.1190598, -0.6690754, -3.563052, 1, 1, 1, 1, 1,
-0.1171475, 1.148264, 0.1488994, 1, 1, 1, 1, 1,
-0.1119492, -0.3825239, -3.998262, 1, 1, 1, 1, 1,
-0.1091099, 0.6884563, -0.6752697, 1, 1, 1, 1, 1,
-0.1071709, 0.6968414, -1.819497, 1, 1, 1, 1, 1,
-0.1055632, 0.08596612, -0.3037806, 1, 1, 1, 1, 1,
-0.105521, -0.4643736, -3.916335, 1, 1, 1, 1, 1,
-0.1053421, 2.632027, -0.003795636, 1, 1, 1, 1, 1,
-0.104527, 0.3112463, 0.8302457, 1, 1, 1, 1, 1,
-0.1035086, 0.5078367, -0.03804734, 1, 1, 1, 1, 1,
-0.1032534, -0.03520176, -2.586205, 1, 1, 1, 1, 1,
-0.09677847, -0.7480889, -2.173582, 1, 1, 1, 1, 1,
-0.09314763, -0.007167072, -1.457195, 0, 0, 1, 1, 1,
-0.08644453, 0.7229685, 0.6501365, 1, 0, 0, 1, 1,
-0.08128197, -0.03456907, -1.398407, 1, 0, 0, 1, 1,
-0.07507838, -0.9681059, -3.513088, 1, 0, 0, 1, 1,
-0.0665998, -2.179898, -4.502265, 1, 0, 0, 1, 1,
-0.06192136, 0.2202722, 1.465432, 1, 0, 0, 1, 1,
-0.0582894, 0.6732156, -0.6974826, 0, 0, 0, 1, 1,
-0.05384216, -0.4026612, -3.318645, 0, 0, 0, 1, 1,
-0.05174845, 1.9604, -0.9797329, 0, 0, 0, 1, 1,
-0.04989542, 0.7148095, 0.3302502, 0, 0, 0, 1, 1,
-0.04874342, 1.017236, -0.2046547, 0, 0, 0, 1, 1,
-0.04858357, -1.272702, -2.448987, 0, 0, 0, 1, 1,
-0.0443109, 1.899762, 0.7583765, 0, 0, 0, 1, 1,
-0.04262783, -0.4297607, -3.124828, 1, 1, 1, 1, 1,
-0.04059042, 1.004502, -0.02536923, 1, 1, 1, 1, 1,
-0.03868696, 0.2056006, -0.9908491, 1, 1, 1, 1, 1,
-0.03779634, 0.5228515, -2.166481, 1, 1, 1, 1, 1,
-0.03584779, 1.04489, 0.9740078, 1, 1, 1, 1, 1,
-0.0348379, -0.9738217, -3.118849, 1, 1, 1, 1, 1,
-0.02928063, -0.1708042, -3.177287, 1, 1, 1, 1, 1,
-0.02891192, -1.744877, -2.968546, 1, 1, 1, 1, 1,
-0.0223584, -0.004489765, -0.817409, 1, 1, 1, 1, 1,
-0.01944122, 2.756054, 0.3915812, 1, 1, 1, 1, 1,
-0.01724056, 2.281833, -0.7252304, 1, 1, 1, 1, 1,
-0.01572923, 0.8162507, 0.7796215, 1, 1, 1, 1, 1,
-0.01289737, 0.2265086, -0.4531673, 1, 1, 1, 1, 1,
-0.01186704, 1.360577, 0.4163918, 1, 1, 1, 1, 1,
-0.01017896, 0.04120563, 0.5499106, 1, 1, 1, 1, 1,
-0.002804274, -0.9602722, -4.019524, 0, 0, 1, 1, 1,
-0.0005658302, 0.5304357, -1.732896, 1, 0, 0, 1, 1,
0.00310915, 1.322937, 1.287855, 1, 0, 0, 1, 1,
0.004048801, 0.5178319, -1.334931, 1, 0, 0, 1, 1,
0.005559829, 1.25352, 0.04565391, 1, 0, 0, 1, 1,
0.01063618, -1.54165, 3.720274, 1, 0, 0, 1, 1,
0.01119344, -0.1277428, 2.217256, 0, 0, 0, 1, 1,
0.01214231, 1.066366, -1.489576, 0, 0, 0, 1, 1,
0.0124336, 1.447957, 0.5976258, 0, 0, 0, 1, 1,
0.01494982, -1.103237, 2.396074, 0, 0, 0, 1, 1,
0.01851604, -0.2306103, 3.484487, 0, 0, 0, 1, 1,
0.02367414, -0.9035615, 2.787097, 0, 0, 0, 1, 1,
0.02409566, 1.330329, 2.19758, 0, 0, 0, 1, 1,
0.02728109, -0.2895956, 3.734756, 1, 1, 1, 1, 1,
0.02880658, 1.191728, -0.1019117, 1, 1, 1, 1, 1,
0.02884056, -1.893529, 2.369728, 1, 1, 1, 1, 1,
0.03164824, -0.3590586, 4.263994, 1, 1, 1, 1, 1,
0.03677544, -0.8677947, 2.347574, 1, 1, 1, 1, 1,
0.03687004, 0.5823539, -0.3022512, 1, 1, 1, 1, 1,
0.03888445, -1.97177, 4.890587, 1, 1, 1, 1, 1,
0.04137076, 0.9111984, 0.6902266, 1, 1, 1, 1, 1,
0.04554498, -0.4708941, 3.044203, 1, 1, 1, 1, 1,
0.04585052, 1.274903, -0.6353979, 1, 1, 1, 1, 1,
0.04719356, -0.8104116, 1.671916, 1, 1, 1, 1, 1,
0.04785693, -2.412424, 4.367345, 1, 1, 1, 1, 1,
0.05025924, -1.200926, 3.172164, 1, 1, 1, 1, 1,
0.05771106, 1.386015, 0.1495316, 1, 1, 1, 1, 1,
0.06621739, 0.1435791, 0.4515363, 1, 1, 1, 1, 1,
0.07201406, -0.4120429, 1.029701, 0, 0, 1, 1, 1,
0.0723051, -0.4651018, 4.346616, 1, 0, 0, 1, 1,
0.07320544, 0.5149546, 0.6922675, 1, 0, 0, 1, 1,
0.0751695, 0.1210619, -0.7056406, 1, 0, 0, 1, 1,
0.07555758, -0.3343193, 4.32878, 1, 0, 0, 1, 1,
0.07577669, 1.08521, 1.446381, 1, 0, 0, 1, 1,
0.08265018, 0.3082443, 1.024347, 0, 0, 0, 1, 1,
0.08446191, -0.9239908, 2.147371, 0, 0, 0, 1, 1,
0.08776787, -0.5251617, 3.505867, 0, 0, 0, 1, 1,
0.09023077, -1.270207, 2.648137, 0, 0, 0, 1, 1,
0.09338167, -0.8197945, 2.841269, 0, 0, 0, 1, 1,
0.09585469, -0.2049916, 1.970702, 0, 0, 0, 1, 1,
0.1029645, -0.3703116, 4.739067, 0, 0, 0, 1, 1,
0.1041832, -0.04873368, 2.650614, 1, 1, 1, 1, 1,
0.1058775, -0.8309779, 3.471971, 1, 1, 1, 1, 1,
0.1093915, -1.181401, 2.662771, 1, 1, 1, 1, 1,
0.1099579, -0.7325358, 4.484241, 1, 1, 1, 1, 1,
0.1131858, -1.146932, 3.276165, 1, 1, 1, 1, 1,
0.1153488, -1.083916, 3.930874, 1, 1, 1, 1, 1,
0.1195134, 0.3344494, -0.1666991, 1, 1, 1, 1, 1,
0.1221615, -0.7527872, 3.884761, 1, 1, 1, 1, 1,
0.1251352, 0.9945082, 0.8556426, 1, 1, 1, 1, 1,
0.1369854, 0.5698372, 0.9621046, 1, 1, 1, 1, 1,
0.1397083, -1.618912, 1.786243, 1, 1, 1, 1, 1,
0.1417098, 1.488629, -0.8337448, 1, 1, 1, 1, 1,
0.1425551, -1.326594, 4.425747, 1, 1, 1, 1, 1,
0.1446407, -0.07773163, 2.239906, 1, 1, 1, 1, 1,
0.144695, 0.171281, -0.5268098, 1, 1, 1, 1, 1,
0.1449351, -0.1019452, 1.418625, 0, 0, 1, 1, 1,
0.1498346, -0.4567432, 1.296185, 1, 0, 0, 1, 1,
0.1498965, 1.49339, -0.8675376, 1, 0, 0, 1, 1,
0.1509375, 0.6786751, -1.079365, 1, 0, 0, 1, 1,
0.1519323, 0.1094689, -0.964316, 1, 0, 0, 1, 1,
0.1537911, 0.4915698, -0.3667191, 1, 0, 0, 1, 1,
0.1543209, 0.07750345, -0.04746341, 0, 0, 0, 1, 1,
0.154952, -0.1852066, 2.187292, 0, 0, 0, 1, 1,
0.1550001, 1.877845, 1.164185, 0, 0, 0, 1, 1,
0.1602745, 0.8914456, 0.5116027, 0, 0, 0, 1, 1,
0.1617893, 0.7455902, 0.3738539, 0, 0, 0, 1, 1,
0.1637748, 0.05360838, 1.340848, 0, 0, 0, 1, 1,
0.1664476, -2.148787, 3.386134, 0, 0, 0, 1, 1,
0.1666332, 1.095439, 1.446584, 1, 1, 1, 1, 1,
0.1694579, -0.9136721, 3.228387, 1, 1, 1, 1, 1,
0.169769, 0.2547249, -0.3601386, 1, 1, 1, 1, 1,
0.1725921, 0.2208777, 1.88152, 1, 1, 1, 1, 1,
0.175948, -1.515369, 3.224942, 1, 1, 1, 1, 1,
0.1779358, -0.2405793, 4.052219, 1, 1, 1, 1, 1,
0.179226, 0.9168245, -0.4652459, 1, 1, 1, 1, 1,
0.17937, 0.06988671, 1.310455, 1, 1, 1, 1, 1,
0.1855727, 0.8672201, 0.1429042, 1, 1, 1, 1, 1,
0.1903895, 1.428435, 0.5470248, 1, 1, 1, 1, 1,
0.1906814, 0.3377679, 0.5589834, 1, 1, 1, 1, 1,
0.1933232, -0.636091, 0.8128046, 1, 1, 1, 1, 1,
0.1994478, 0.1805392, -0.6042806, 1, 1, 1, 1, 1,
0.2003997, 0.6165517, 0.6455613, 1, 1, 1, 1, 1,
0.200913, 1.507372, 1.39948, 1, 1, 1, 1, 1,
0.2027367, 0.1968633, 2.45948, 0, 0, 1, 1, 1,
0.2048826, 0.5484444, 1.262716, 1, 0, 0, 1, 1,
0.2070852, -0.6699243, 2.346403, 1, 0, 0, 1, 1,
0.2119074, 0.6081626, 0.3621697, 1, 0, 0, 1, 1,
0.2154192, 1.968552, 0.9655114, 1, 0, 0, 1, 1,
0.2168342, 1.633646, 0.4285975, 1, 0, 0, 1, 1,
0.2261954, -0.3007106, 1.834577, 0, 0, 0, 1, 1,
0.2273564, -0.5433076, 2.399745, 0, 0, 0, 1, 1,
0.2301499, -0.2856953, 3.336843, 0, 0, 0, 1, 1,
0.2340905, 0.7261276, -0.2919477, 0, 0, 0, 1, 1,
0.2346232, -0.05956672, 2.299943, 0, 0, 0, 1, 1,
0.2391977, 0.02186202, 2.712677, 0, 0, 0, 1, 1,
0.2412002, 0.6088479, -0.3218343, 0, 0, 0, 1, 1,
0.2474059, 0.3400149, 0.2250348, 1, 1, 1, 1, 1,
0.2551182, -0.6440855, 3.238566, 1, 1, 1, 1, 1,
0.2560211, 0.2371952, 1.535779, 1, 1, 1, 1, 1,
0.2567427, -0.2200188, 0.7901105, 1, 1, 1, 1, 1,
0.257194, 1.27806, 0.4691062, 1, 1, 1, 1, 1,
0.2586054, 1.896943, 1.467534, 1, 1, 1, 1, 1,
0.2625417, 0.7000443, -0.213004, 1, 1, 1, 1, 1,
0.2664193, 0.9112819, 0.1253836, 1, 1, 1, 1, 1,
0.2709894, -0.1480547, 2.004765, 1, 1, 1, 1, 1,
0.2711071, -0.9419699, 3.131681, 1, 1, 1, 1, 1,
0.2822307, 1.0044, 0.5561689, 1, 1, 1, 1, 1,
0.2887015, -1.673603, 4.190736, 1, 1, 1, 1, 1,
0.2899736, 1.813375, -1.693743, 1, 1, 1, 1, 1,
0.2900053, -0.01724765, 0.8581079, 1, 1, 1, 1, 1,
0.2925873, -1.210813, -0.09267467, 1, 1, 1, 1, 1,
0.2967732, -1.128026, 3.567975, 0, 0, 1, 1, 1,
0.2983195, 0.158216, 1.111954, 1, 0, 0, 1, 1,
0.3019616, 1.781461, 1.815403, 1, 0, 0, 1, 1,
0.3058182, -1.802826, 1.866993, 1, 0, 0, 1, 1,
0.3074901, 0.2684497, 1.31555, 1, 0, 0, 1, 1,
0.3141848, 1.098956, -0.003431237, 1, 0, 0, 1, 1,
0.315492, 1.221784, 2.286884, 0, 0, 0, 1, 1,
0.3162228, 0.4959131, 0.199209, 0, 0, 0, 1, 1,
0.3198598, -1.100239, 3.744396, 0, 0, 0, 1, 1,
0.3207124, 1.440877, 0.1981022, 0, 0, 0, 1, 1,
0.3217145, -0.4577697, 2.278375, 0, 0, 0, 1, 1,
0.3245413, 0.9612935, 0.9513565, 0, 0, 0, 1, 1,
0.3321759, 1.40181, 0.5618882, 0, 0, 0, 1, 1,
0.3324889, 1.366108, 0.6465391, 1, 1, 1, 1, 1,
0.3350996, 0.2601578, 0.6812131, 1, 1, 1, 1, 1,
0.336861, -0.7418675, 1.29737, 1, 1, 1, 1, 1,
0.3408196, -2.206021, 5.503814, 1, 1, 1, 1, 1,
0.342079, -0.09779631, 1.432858, 1, 1, 1, 1, 1,
0.3434255, 1.119481, 0.08252787, 1, 1, 1, 1, 1,
0.3446133, -0.5881895, 0.764888, 1, 1, 1, 1, 1,
0.3448009, 0.8492979, -0.7025128, 1, 1, 1, 1, 1,
0.3464516, -1.509101, 3.213894, 1, 1, 1, 1, 1,
0.3488961, -0.6417225, 3.434488, 1, 1, 1, 1, 1,
0.3495959, 0.8213474, 1.804792, 1, 1, 1, 1, 1,
0.3498666, 0.04071692, 0.7661385, 1, 1, 1, 1, 1,
0.350204, -1.822916, 3.085289, 1, 1, 1, 1, 1,
0.3555925, 0.8853545, -0.5828594, 1, 1, 1, 1, 1,
0.357253, 0.1856006, 3.463856, 1, 1, 1, 1, 1,
0.3579107, -1.28755, 3.676714, 0, 0, 1, 1, 1,
0.3591823, 1.106337, 0.255619, 1, 0, 0, 1, 1,
0.3593984, 0.4583443, -0.8614703, 1, 0, 0, 1, 1,
0.3607041, 1.171384, 0.965227, 1, 0, 0, 1, 1,
0.3614817, -0.2823149, 2.160028, 1, 0, 0, 1, 1,
0.3681522, 0.370294, 1.388982, 1, 0, 0, 1, 1,
0.3702119, -0.2426296, 2.969266, 0, 0, 0, 1, 1,
0.3705395, 0.1595739, 2.297563, 0, 0, 0, 1, 1,
0.3711725, 0.7691781, -0.8015181, 0, 0, 0, 1, 1,
0.3742109, 1.197829, -0.428914, 0, 0, 0, 1, 1,
0.3747384, -0.09121887, 4.395245, 0, 0, 0, 1, 1,
0.3751313, 0.4560733, 0.2591847, 0, 0, 0, 1, 1,
0.3757091, -0.4107864, 1.980186, 0, 0, 0, 1, 1,
0.3772269, 0.07327884, 0.9576187, 1, 1, 1, 1, 1,
0.3777529, -0.4775107, 2.203695, 1, 1, 1, 1, 1,
0.3782015, -0.09358452, -0.8369104, 1, 1, 1, 1, 1,
0.3804038, 0.894143, -0.05627696, 1, 1, 1, 1, 1,
0.3893372, 0.9780508, -0.3445444, 1, 1, 1, 1, 1,
0.3899716, -0.6428884, 1.155963, 1, 1, 1, 1, 1,
0.3936449, -0.5307029, 0.9241888, 1, 1, 1, 1, 1,
0.4012013, -0.8682789, 2.02442, 1, 1, 1, 1, 1,
0.4024032, 0.7397953, 3.202573, 1, 1, 1, 1, 1,
0.4056018, 1.398038, 1.241537, 1, 1, 1, 1, 1,
0.4096395, -0.5625457, 1.796963, 1, 1, 1, 1, 1,
0.41058, -0.1499284, 3.807401, 1, 1, 1, 1, 1,
0.4119619, -0.2653266, 2.129616, 1, 1, 1, 1, 1,
0.4138614, 1.545609, -0.4311917, 1, 1, 1, 1, 1,
0.4151548, 0.4487299, 0.8193701, 1, 1, 1, 1, 1,
0.4168587, 2.199569, 1.716324, 0, 0, 1, 1, 1,
0.4175582, 0.818645, -0.09925134, 1, 0, 0, 1, 1,
0.420983, -0.2555968, 3.358535, 1, 0, 0, 1, 1,
0.4220694, -1.894067, 2.504224, 1, 0, 0, 1, 1,
0.4244584, -1.38865, 2.939609, 1, 0, 0, 1, 1,
0.4249137, 0.1366006, 1.135193, 1, 0, 0, 1, 1,
0.4274333, 0.1853948, -0.7030463, 0, 0, 0, 1, 1,
0.4331698, 1.207594, 1.865589, 0, 0, 0, 1, 1,
0.4363123, -0.4897676, 3.149197, 0, 0, 0, 1, 1,
0.4363604, 1.98487, 0.6110757, 0, 0, 0, 1, 1,
0.4380339, 1.200871, -0.4164858, 0, 0, 0, 1, 1,
0.4408007, -1.341112, 2.388662, 0, 0, 0, 1, 1,
0.4418092, 1.611162, -0.3824617, 0, 0, 0, 1, 1,
0.44589, -2.32617, 1.732536, 1, 1, 1, 1, 1,
0.4477402, 1.321021, -1.171844, 1, 1, 1, 1, 1,
0.4485395, 0.1168637, 0.6991771, 1, 1, 1, 1, 1,
0.4500186, -1.296167, 1.576994, 1, 1, 1, 1, 1,
0.4597707, -0.2980453, 2.269167, 1, 1, 1, 1, 1,
0.4604478, 0.1354869, 0.001639992, 1, 1, 1, 1, 1,
0.4611621, 0.01664645, 2.792142, 1, 1, 1, 1, 1,
0.4625629, 3.063618, -0.07844725, 1, 1, 1, 1, 1,
0.4633716, -0.2537097, 1.405012, 1, 1, 1, 1, 1,
0.4677658, 0.1119561, 2.413753, 1, 1, 1, 1, 1,
0.4745367, -1.144016, 1.719789, 1, 1, 1, 1, 1,
0.4761044, -0.3701372, 1.659518, 1, 1, 1, 1, 1,
0.4772742, 0.7480564, 0.2832554, 1, 1, 1, 1, 1,
0.4800546, -0.5220428, 2.493717, 1, 1, 1, 1, 1,
0.4800754, 0.650664, -0.7631298, 1, 1, 1, 1, 1,
0.4816886, 0.9261647, -0.1268062, 0, 0, 1, 1, 1,
0.4828489, 0.9187916, 1.335723, 1, 0, 0, 1, 1,
0.4849378, 0.3121269, 1.794513, 1, 0, 0, 1, 1,
0.4851884, 0.1114532, 1.527254, 1, 0, 0, 1, 1,
0.4939436, -1.945263, 1.866507, 1, 0, 0, 1, 1,
0.4974268, 1.122367, 0.7944102, 1, 0, 0, 1, 1,
0.4988896, -1.736045, 3.080982, 0, 0, 0, 1, 1,
0.4990551, 0.6490008, 1.025333, 0, 0, 0, 1, 1,
0.5037121, -0.3879767, 2.846175, 0, 0, 0, 1, 1,
0.5039006, 1.309228, -0.8957488, 0, 0, 0, 1, 1,
0.5039302, 0.01615806, 2.697759, 0, 0, 0, 1, 1,
0.5091246, -0.0460383, 3.038025, 0, 0, 0, 1, 1,
0.5129018, 0.06569781, 2.583905, 0, 0, 0, 1, 1,
0.5149472, 1.122999, 1.719536, 1, 1, 1, 1, 1,
0.5210428, -0.4578024, 1.487297, 1, 1, 1, 1, 1,
0.5276718, 2.160843, 0.4617071, 1, 1, 1, 1, 1,
0.5285136, -1.023727, 3.864817, 1, 1, 1, 1, 1,
0.5296575, 0.619304, -0.3087375, 1, 1, 1, 1, 1,
0.5331649, 1.291865, 0.3734092, 1, 1, 1, 1, 1,
0.5364622, -0.1381777, 0.9902439, 1, 1, 1, 1, 1,
0.5423039, 2.502054, 0.3622127, 1, 1, 1, 1, 1,
0.542914, -0.2192122, 2.520811, 1, 1, 1, 1, 1,
0.549516, -0.9104729, 1.011347, 1, 1, 1, 1, 1,
0.5565156, -1.157742, 1.948111, 1, 1, 1, 1, 1,
0.5569994, -0.7918697, 2.068518, 1, 1, 1, 1, 1,
0.5583175, -0.2087652, 0.9935869, 1, 1, 1, 1, 1,
0.5632898, 1.438228, -1.468656, 1, 1, 1, 1, 1,
0.563787, -0.1128611, 1.237144, 1, 1, 1, 1, 1,
0.5702683, -1.004546, 2.975102, 0, 0, 1, 1, 1,
0.5739897, 0.1260004, 0.8560716, 1, 0, 0, 1, 1,
0.5751792, 2.502849, -1.569402, 1, 0, 0, 1, 1,
0.5763297, 0.6482906, 0.5494727, 1, 0, 0, 1, 1,
0.5763595, 1.069092, -0.08739293, 1, 0, 0, 1, 1,
0.5907146, 0.3510627, 1.615793, 1, 0, 0, 1, 1,
0.5907941, -0.2531812, 3.178941, 0, 0, 0, 1, 1,
0.5918934, 1.809592, 0.3285629, 0, 0, 0, 1, 1,
0.592732, -2.295886, 2.898535, 0, 0, 0, 1, 1,
0.6008019, 1.178471, 1.406911, 0, 0, 0, 1, 1,
0.6069196, -1.003875, 3.847072, 0, 0, 0, 1, 1,
0.6101146, -0.3847755, 2.776635, 0, 0, 0, 1, 1,
0.6150114, -1.962561, 4.782255, 0, 0, 0, 1, 1,
0.6163369, -0.3244033, 1.447168, 1, 1, 1, 1, 1,
0.6190335, 1.214038, -0.7480786, 1, 1, 1, 1, 1,
0.6272566, -2.344579, 2.220101, 1, 1, 1, 1, 1,
0.6290855, 0.4468751, 1.111864, 1, 1, 1, 1, 1,
0.6312153, 0.7919689, 0.3086022, 1, 1, 1, 1, 1,
0.6320857, 0.7921307, 0.6251389, 1, 1, 1, 1, 1,
0.6340327, -3.272555, 3.324499, 1, 1, 1, 1, 1,
0.6352904, 0.270334, 2.058389, 1, 1, 1, 1, 1,
0.6378458, 0.9999581, 0.6491792, 1, 1, 1, 1, 1,
0.6431612, 0.09204144, 0.9072579, 1, 1, 1, 1, 1,
0.6439109, -0.2296874, 1.179552, 1, 1, 1, 1, 1,
0.6457219, 0.5648063, 1.024591, 1, 1, 1, 1, 1,
0.6465715, -0.8993627, 1.969276, 1, 1, 1, 1, 1,
0.6486396, 0.2415863, 2.441584, 1, 1, 1, 1, 1,
0.6514251, -0.674449, 2.168947, 1, 1, 1, 1, 1,
0.6550512, -1.291347, 3.498372, 0, 0, 1, 1, 1,
0.6581335, -0.8908509, 2.410969, 1, 0, 0, 1, 1,
0.6608495, -0.2365559, 1.685058, 1, 0, 0, 1, 1,
0.6625949, 0.1161967, 0.6861119, 1, 0, 0, 1, 1,
0.6673518, -1.471639, 4.369563, 1, 0, 0, 1, 1,
0.668049, 1.052561, -0.06107693, 1, 0, 0, 1, 1,
0.6681048, 0.1420292, 2.158962, 0, 0, 0, 1, 1,
0.6683335, -1.609975, 1.747383, 0, 0, 0, 1, 1,
0.6694482, 1.15013, 1.694215, 0, 0, 0, 1, 1,
0.6699946, -0.4473684, 1.99948, 0, 0, 0, 1, 1,
0.6713743, -0.1723194, 2.641077, 0, 0, 0, 1, 1,
0.6822938, 0.01670867, 3.000005, 0, 0, 0, 1, 1,
0.6827843, -1.33704, 1.257411, 0, 0, 0, 1, 1,
0.6854036, -0.3676336, 1.539184, 1, 1, 1, 1, 1,
0.6857073, -0.2133255, 0.7165718, 1, 1, 1, 1, 1,
0.6873349, 1.033946, 0.6668999, 1, 1, 1, 1, 1,
0.6884028, 0.919415, 1.00433, 1, 1, 1, 1, 1,
0.6891587, -0.6735299, 1.844657, 1, 1, 1, 1, 1,
0.6891637, -0.5279595, 3.859612, 1, 1, 1, 1, 1,
0.6893498, 0.48524, 0.8311629, 1, 1, 1, 1, 1,
0.6904986, 1.030742, 1.652406, 1, 1, 1, 1, 1,
0.6914077, 1.168934, 1.263209, 1, 1, 1, 1, 1,
0.701643, -0.4726218, 2.872209, 1, 1, 1, 1, 1,
0.7031378, 0.6139379, 0.669987, 1, 1, 1, 1, 1,
0.7130013, 0.2322103, 2.631293, 1, 1, 1, 1, 1,
0.7144968, -1.178107, 1.211716, 1, 1, 1, 1, 1,
0.7156017, -1.181102, 0.6491736, 1, 1, 1, 1, 1,
0.7198081, -0.3784487, 2.121825, 1, 1, 1, 1, 1,
0.7217925, 0.394253, 2.835421, 0, 0, 1, 1, 1,
0.7222803, 1.808655, 0.2900111, 1, 0, 0, 1, 1,
0.7245044, -0.06702814, 0.5320776, 1, 0, 0, 1, 1,
0.7264073, -0.3423937, 2.664006, 1, 0, 0, 1, 1,
0.7282273, -0.681031, 2.667758, 1, 0, 0, 1, 1,
0.7285469, -1.235326, 2.068407, 1, 0, 0, 1, 1,
0.7293091, 0.5608882, 1.433916, 0, 0, 0, 1, 1,
0.7323315, 0.7394676, -0.8476021, 0, 0, 0, 1, 1,
0.7324368, -1.185552, 2.990768, 0, 0, 0, 1, 1,
0.736019, -0.155008, 2.767802, 0, 0, 0, 1, 1,
0.738284, 0.368658, 0.06837799, 0, 0, 0, 1, 1,
0.7428555, 0.1701528, 0.6962464, 0, 0, 0, 1, 1,
0.7429522, -0.5458241, 0.4678813, 0, 0, 0, 1, 1,
0.743525, 0.3560803, 0.9497698, 1, 1, 1, 1, 1,
0.7455233, -0.7497098, 2.19023, 1, 1, 1, 1, 1,
0.7479121, 0.3243904, 2.196693, 1, 1, 1, 1, 1,
0.7491814, -0.03693505, 1.573576, 1, 1, 1, 1, 1,
0.7508417, 0.2739909, 1.815754, 1, 1, 1, 1, 1,
0.7549327, -0.4331849, 3.07369, 1, 1, 1, 1, 1,
0.772567, -0.6105831, 3.094403, 1, 1, 1, 1, 1,
0.778246, -2.108905, 1.769776, 1, 1, 1, 1, 1,
0.7802629, 0.6554866, 2.234772, 1, 1, 1, 1, 1,
0.7807761, 1.83104, 0.6048676, 1, 1, 1, 1, 1,
0.7856893, 0.6108814, 1.456496, 1, 1, 1, 1, 1,
0.7925802, -1.591363, 3.931164, 1, 1, 1, 1, 1,
0.7936665, 0.7674617, 1.579637, 1, 1, 1, 1, 1,
0.7946372, 0.8383384, 2.229728, 1, 1, 1, 1, 1,
0.7969041, -0.4018668, 2.348516, 1, 1, 1, 1, 1,
0.7984934, -0.1495646, 1.517943, 0, 0, 1, 1, 1,
0.7994131, -1.214097, 3.124366, 1, 0, 0, 1, 1,
0.8019052, 0.3626755, 0.9165679, 1, 0, 0, 1, 1,
0.8031182, -0.3262102, 3.247021, 1, 0, 0, 1, 1,
0.8087922, 0.1140206, 0.156212, 1, 0, 0, 1, 1,
0.8120572, 0.04110732, 3.749438, 1, 0, 0, 1, 1,
0.8161877, -1.073923, 4.760377, 0, 0, 0, 1, 1,
0.8183686, 0.006548156, 1.721601, 0, 0, 0, 1, 1,
0.8222154, 0.2348707, 2.215297, 0, 0, 0, 1, 1,
0.8237934, 0.5945821, 1.58972, 0, 0, 0, 1, 1,
0.830739, -1.071881, 2.276596, 0, 0, 0, 1, 1,
0.8356493, -1.3223, 2.855037, 0, 0, 0, 1, 1,
0.835987, 0.3036241, 2.142874, 0, 0, 0, 1, 1,
0.8447944, 0.1126072, 1.437181, 1, 1, 1, 1, 1,
0.847993, -1.428605, 3.791277, 1, 1, 1, 1, 1,
0.8486294, -0.77543, 0.9561237, 1, 1, 1, 1, 1,
0.8496323, -0.9321028, 2.030279, 1, 1, 1, 1, 1,
0.8509254, -1.285195, 4.141176, 1, 1, 1, 1, 1,
0.8554391, 0.5116616, 1.654537, 1, 1, 1, 1, 1,
0.8565555, 0.8616242, 0.3843012, 1, 1, 1, 1, 1,
0.860771, 0.8345453, 2.304594, 1, 1, 1, 1, 1,
0.8653052, 0.2590517, 1.691857, 1, 1, 1, 1, 1,
0.8661079, -0.5288287, 3.398016, 1, 1, 1, 1, 1,
0.8662425, 1.183738, -0.8534688, 1, 1, 1, 1, 1,
0.8676791, -0.07103482, 2.554129, 1, 1, 1, 1, 1,
0.8724903, 0.6512636, 1.11572, 1, 1, 1, 1, 1,
0.8733502, 1.247272, 0.7006232, 1, 1, 1, 1, 1,
0.8746804, -0.7776531, 1.054905, 1, 1, 1, 1, 1,
0.8765317, 0.9555368, 0.671691, 0, 0, 1, 1, 1,
0.8867977, -0.5061389, 1.60809, 1, 0, 0, 1, 1,
0.8879842, -1.329383, 1.954493, 1, 0, 0, 1, 1,
0.8960139, 1.382088, 2.57094, 1, 0, 0, 1, 1,
0.8985984, -0.07029758, 1.868734, 1, 0, 0, 1, 1,
0.9044021, 0.4249004, 0.9069639, 1, 0, 0, 1, 1,
0.904498, 1.351898, 1.563261, 0, 0, 0, 1, 1,
0.9055208, -1.07457, 1.789545, 0, 0, 0, 1, 1,
0.9070988, 0.1676773, -0.3356682, 0, 0, 0, 1, 1,
0.9098018, 0.9461321, 1.307956, 0, 0, 0, 1, 1,
0.9171635, -1.355705, 3.106827, 0, 0, 0, 1, 1,
0.9173379, 1.252048, 0.5753188, 0, 0, 0, 1, 1,
0.9188076, -0.3266973, 0.6560256, 0, 0, 0, 1, 1,
0.9259918, -1.649688, 3.726004, 1, 1, 1, 1, 1,
0.9259988, -0.1894253, 1.417106, 1, 1, 1, 1, 1,
0.9337987, 1.683812, 1.513653, 1, 1, 1, 1, 1,
0.938518, -1.212212, 2.759923, 1, 1, 1, 1, 1,
0.9512454, 0.1644563, 1.706543, 1, 1, 1, 1, 1,
0.9518554, 0.0212914, -0.2455147, 1, 1, 1, 1, 1,
0.9528946, 0.5706355, 0.2782886, 1, 1, 1, 1, 1,
0.9560795, -0.4813283, -0.7353994, 1, 1, 1, 1, 1,
0.9610595, 0.1517273, 1.458249, 1, 1, 1, 1, 1,
0.961109, -1.184137, 2.298146, 1, 1, 1, 1, 1,
0.978082, -0.5846788, 2.379111, 1, 1, 1, 1, 1,
0.9829109, 0.5144457, 0.2670036, 1, 1, 1, 1, 1,
0.9848844, 1.896747, -0.06454232, 1, 1, 1, 1, 1,
1.001367, 0.9540275, 0.1713483, 1, 1, 1, 1, 1,
1.009665, 0.2661753, 2.486624, 1, 1, 1, 1, 1,
1.014961, 0.5160003, 1.559107, 0, 0, 1, 1, 1,
1.015164, -0.7643125, 3.394255, 1, 0, 0, 1, 1,
1.017462, -1.129525, 2.172552, 1, 0, 0, 1, 1,
1.019329, 0.9014039, 0.6326388, 1, 0, 0, 1, 1,
1.026334, -0.3026311, 1.665175, 1, 0, 0, 1, 1,
1.032935, 0.0608956, 1.054958, 1, 0, 0, 1, 1,
1.042479, 0.2532142, 0.540975, 0, 0, 0, 1, 1,
1.045756, 2.382816, -0.3572465, 0, 0, 0, 1, 1,
1.049201, -0.7511494, 1.204061, 0, 0, 0, 1, 1,
1.056889, -1.800748, 2.716977, 0, 0, 0, 1, 1,
1.059848, -0.2021672, 1.422264, 0, 0, 0, 1, 1,
1.061317, 1.292067, 0.9222352, 0, 0, 0, 1, 1,
1.063433, 1.716738, -1.014673, 0, 0, 0, 1, 1,
1.063663, -0.4240047, 2.018689, 1, 1, 1, 1, 1,
1.077162, -0.2948758, 1.876059, 1, 1, 1, 1, 1,
1.083871, 0.2884371, 0.2906401, 1, 1, 1, 1, 1,
1.086205, -1.231355, -0.7070131, 1, 1, 1, 1, 1,
1.087284, 0.03654338, 1.50142, 1, 1, 1, 1, 1,
1.089551, 1.216051, 1.563102, 1, 1, 1, 1, 1,
1.101603, -0.7827694, 1.548464, 1, 1, 1, 1, 1,
1.130346, 1.445279, 0.08700982, 1, 1, 1, 1, 1,
1.133143, 2.303186, 0.7080365, 1, 1, 1, 1, 1,
1.133772, -0.9047013, 3.846383, 1, 1, 1, 1, 1,
1.148079, 1.091717, 1.569165, 1, 1, 1, 1, 1,
1.157075, 1.227009, 0.2048737, 1, 1, 1, 1, 1,
1.158516, 0.615211, 2.038597, 1, 1, 1, 1, 1,
1.176128, -0.7142529, 0.8855035, 1, 1, 1, 1, 1,
1.176717, -0.1270834, 1.40536, 1, 1, 1, 1, 1,
1.178204, -1.430803, 2.546125, 0, 0, 1, 1, 1,
1.186601, 0.8655822, -0.5323439, 1, 0, 0, 1, 1,
1.193824, -1.19535, 3.65238, 1, 0, 0, 1, 1,
1.194929, -0.9858875, 2.317033, 1, 0, 0, 1, 1,
1.203587, -0.8142197, 3.928017, 1, 0, 0, 1, 1,
1.205133, -1.63607, 1.895783, 1, 0, 0, 1, 1,
1.20665, -1.543175, 3.619225, 0, 0, 0, 1, 1,
1.20673, 0.4988729, 1.847715, 0, 0, 0, 1, 1,
1.207814, -1.580423, 3.519636, 0, 0, 0, 1, 1,
1.211561, 1.425561, 0.3888221, 0, 0, 0, 1, 1,
1.214396, -1.207885, 1.423993, 0, 0, 0, 1, 1,
1.22032, -0.5679473, 0.5408547, 0, 0, 0, 1, 1,
1.222221, 0.758532, 0.2040731, 0, 0, 0, 1, 1,
1.226837, -1.019021, 2.47066, 1, 1, 1, 1, 1,
1.228057, -1.064392, 1.807742, 1, 1, 1, 1, 1,
1.245605, 0.2890114, 1.877977, 1, 1, 1, 1, 1,
1.249817, -1.210414, 1.844814, 1, 1, 1, 1, 1,
1.250563, 0.5774118, 1.83196, 1, 1, 1, 1, 1,
1.258564, -0.1608292, 0.9619368, 1, 1, 1, 1, 1,
1.269647, 1.000589, -0.07776841, 1, 1, 1, 1, 1,
1.272248, 0.2079254, -0.6243367, 1, 1, 1, 1, 1,
1.275748, -2.02488, 2.720894, 1, 1, 1, 1, 1,
1.280827, 2.198747, -2.108344, 1, 1, 1, 1, 1,
1.286948, 1.825435, 0.4807656, 1, 1, 1, 1, 1,
1.291825, -0.03647989, 2.960326, 1, 1, 1, 1, 1,
1.29682, -0.4388628, 2.101606, 1, 1, 1, 1, 1,
1.30294, 0.5501274, -1.855564, 1, 1, 1, 1, 1,
1.308356, 0.2606397, 1.507985, 1, 1, 1, 1, 1,
1.310718, -0.3019446, 0.9491771, 0, 0, 1, 1, 1,
1.321064, 0.674461, 1.686188, 1, 0, 0, 1, 1,
1.326515, 2.755289, 0.6895199, 1, 0, 0, 1, 1,
1.327047, -0.5773456, 2.918346, 1, 0, 0, 1, 1,
1.328969, 0.6959723, 1.30225, 1, 0, 0, 1, 1,
1.331997, 0.05663614, 2.17836, 1, 0, 0, 1, 1,
1.339057, 0.2035349, 0.7565293, 0, 0, 0, 1, 1,
1.343331, -0.3118235, 2.253629, 0, 0, 0, 1, 1,
1.359261, 0.7025657, 0.9008414, 0, 0, 0, 1, 1,
1.371273, -1.409411, 3.164439, 0, 0, 0, 1, 1,
1.385324, 0.9575177, 2.442655, 0, 0, 0, 1, 1,
1.394439, 1.165752, 2.150076, 0, 0, 0, 1, 1,
1.400904, 0.7067319, 0.6254942, 0, 0, 0, 1, 1,
1.405943, -0.797897, 0.9569058, 1, 1, 1, 1, 1,
1.417702, 0.4437806, 2.506415, 1, 1, 1, 1, 1,
1.42315, 0.006491853, 1.903684, 1, 1, 1, 1, 1,
1.427801, 1.426089, 0.6649876, 1, 1, 1, 1, 1,
1.444513, 0.6411815, -1.107591, 1, 1, 1, 1, 1,
1.447508, -1.587718, 2.238334, 1, 1, 1, 1, 1,
1.448555, 0.2367609, 1.616721, 1, 1, 1, 1, 1,
1.449628, -0.05950895, 0.7249105, 1, 1, 1, 1, 1,
1.452177, 1.386395, 2.258767, 1, 1, 1, 1, 1,
1.456442, 0.8107113, 0.4341045, 1, 1, 1, 1, 1,
1.456857, 0.1459365, 0.676442, 1, 1, 1, 1, 1,
1.45753, 0.7388563, 0.8693748, 1, 1, 1, 1, 1,
1.45903, -0.2143893, 2.559351, 1, 1, 1, 1, 1,
1.462287, -1.113946, 0.9946488, 1, 1, 1, 1, 1,
1.464828, 0.6739681, 0.08607209, 1, 1, 1, 1, 1,
1.470744, 0.8138085, 3.897826, 0, 0, 1, 1, 1,
1.479037, -1.015221, -0.1631965, 1, 0, 0, 1, 1,
1.479779, -0.7264792, 1.724255, 1, 0, 0, 1, 1,
1.487124, 1.612104, -2.87998, 1, 0, 0, 1, 1,
1.492732, -2.102197, 1.885549, 1, 0, 0, 1, 1,
1.495011, 0.5188115, -0.4594349, 1, 0, 0, 1, 1,
1.496397, 0.2990014, 2.686535, 0, 0, 0, 1, 1,
1.49646, -0.1154352, 0.07696351, 0, 0, 0, 1, 1,
1.511568, -0.9003928, 2.466405, 0, 0, 0, 1, 1,
1.51629, -1.12857, 1.486749, 0, 0, 0, 1, 1,
1.526152, 1.426553, 0.08850688, 0, 0, 0, 1, 1,
1.526723, -1.175853, 2.025303, 0, 0, 0, 1, 1,
1.528469, -0.1917401, 1.851868, 0, 0, 0, 1, 1,
1.531432, -0.5324866, 1.529185, 1, 1, 1, 1, 1,
1.536287, 0.255228, 3.413661, 1, 1, 1, 1, 1,
1.5499, 1.492374, 0.6282641, 1, 1, 1, 1, 1,
1.56325, 0.1332605, 1.944804, 1, 1, 1, 1, 1,
1.566975, 0.1076484, 1.462419, 1, 1, 1, 1, 1,
1.570781, -0.1353811, 1.236998, 1, 1, 1, 1, 1,
1.583552, 1.377963, 0.246111, 1, 1, 1, 1, 1,
1.584026, 1.541588, -0.3674842, 1, 1, 1, 1, 1,
1.595193, -0.08577763, 2.069813, 1, 1, 1, 1, 1,
1.597506, 0.4979026, 1.399277, 1, 1, 1, 1, 1,
1.605578, -1.180779, 2.599868, 1, 1, 1, 1, 1,
1.611609, -0.6053763, 1.43726, 1, 1, 1, 1, 1,
1.618499, 0.6366016, 0.4080773, 1, 1, 1, 1, 1,
1.622072, -0.01041297, 4.26716, 1, 1, 1, 1, 1,
1.640772, 0.5449991, 2.149155, 1, 1, 1, 1, 1,
1.648874, -0.6800821, 2.291463, 0, 0, 1, 1, 1,
1.661441, 0.1417052, 1.231495, 1, 0, 0, 1, 1,
1.671823, -0.5330564, 1.185531, 1, 0, 0, 1, 1,
1.673926, 0.083232, 1.932085, 1, 0, 0, 1, 1,
1.687998, 2.062506, 0.9418835, 1, 0, 0, 1, 1,
1.694183, 0.1645023, 2.684439, 1, 0, 0, 1, 1,
1.696802, -1.174042, 2.387794, 0, 0, 0, 1, 1,
1.70329, 0.3579754, 0.06749363, 0, 0, 0, 1, 1,
1.707317, 0.3201009, 1.25667, 0, 0, 0, 1, 1,
1.747781, -1.495532, 3.969283, 0, 0, 0, 1, 1,
1.749761, 0.1821921, 1.817074, 0, 0, 0, 1, 1,
1.749796, -1.090024, 0.8378289, 0, 0, 0, 1, 1,
1.752668, -3.269184, 3.274609, 0, 0, 0, 1, 1,
1.757706, 0.4616607, 1.839346, 1, 1, 1, 1, 1,
1.759038, -0.4570112, 0.847404, 1, 1, 1, 1, 1,
1.76216, -1.663126, 0.7486343, 1, 1, 1, 1, 1,
1.772266, 1.443658, 0.7394556, 1, 1, 1, 1, 1,
1.780181, -0.5412467, 1.199294, 1, 1, 1, 1, 1,
1.790624, -2.009409, 3.392381, 1, 1, 1, 1, 1,
1.797207, -0.9119138, 0.9653096, 1, 1, 1, 1, 1,
1.830198, -1.246831, 3.501732, 1, 1, 1, 1, 1,
1.830912, -1.165559, 2.310691, 1, 1, 1, 1, 1,
1.852936, -0.7813442, 1.774615, 1, 1, 1, 1, 1,
1.92427, -0.5584456, 2.508779, 1, 1, 1, 1, 1,
1.925357, -0.8154989, 3.018074, 1, 1, 1, 1, 1,
2.011119, -0.09448579, 0.8605016, 1, 1, 1, 1, 1,
2.032622, -1.988526, -0.5927833, 1, 1, 1, 1, 1,
2.048448, -1.878321, 2.753871, 1, 1, 1, 1, 1,
2.086376, -0.941599, 2.613683, 0, 0, 1, 1, 1,
2.091518, 0.8581652, 1.591892, 1, 0, 0, 1, 1,
2.164137, 0.1011254, 0.2527529, 1, 0, 0, 1, 1,
2.201917, -0.2420414, 3.853771, 1, 0, 0, 1, 1,
2.216346, -0.2205698, 1.556849, 1, 0, 0, 1, 1,
2.265479, 0.4851314, 1.981495, 1, 0, 0, 1, 1,
2.265735, -0.08821103, -0.2612855, 0, 0, 0, 1, 1,
2.277187, -1.6072, 2.989959, 0, 0, 0, 1, 1,
2.286657, 0.9123494, 2.669613, 0, 0, 0, 1, 1,
2.342746, 0.04981509, 2.245102, 0, 0, 0, 1, 1,
2.345963, -0.6650801, 0.5155378, 0, 0, 0, 1, 1,
2.355348, -0.9099293, 3.252751, 0, 0, 0, 1, 1,
2.35545, -0.742382, 2.675627, 0, 0, 0, 1, 1,
2.543391, 0.4450089, 1.144026, 1, 1, 1, 1, 1,
2.608927, -0.2094499, 2.558863, 1, 1, 1, 1, 1,
2.630217, 0.6269152, 0.9389741, 1, 1, 1, 1, 1,
2.704973, -1.201195, 2.210661, 1, 1, 1, 1, 1,
2.813674, 0.8903372, 0.5536129, 1, 1, 1, 1, 1,
2.943416, 1.150514, 2.580646, 1, 1, 1, 1, 1,
3.193957, 2.237137, 1.892394, 1, 1, 1, 1, 1
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
var radius = 9.385164;
var distance = 32.96499;
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
mvMatrix.translate( 0.1332421, 0.1044686, -0.4460187 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.96499);
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
