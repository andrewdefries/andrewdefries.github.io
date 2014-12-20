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
-2.890314, 0.7918113, -1.682223, 1, 0, 0, 1,
-2.636122, -1.842627, -2.667723, 1, 0.007843138, 0, 1,
-2.624965, 0.2750404, -1.817211, 1, 0.01176471, 0, 1,
-2.558859, -0.6792287, -2.614386, 1, 0.01960784, 0, 1,
-2.466196, -2.33398, -3.432695, 1, 0.02352941, 0, 1,
-2.460239, -0.6458724, -1.249251, 1, 0.03137255, 0, 1,
-2.444104, -0.00111828, -2.455936, 1, 0.03529412, 0, 1,
-2.443496, -0.4936122, -1.949256, 1, 0.04313726, 0, 1,
-2.442469, 0.7561387, 0.1688328, 1, 0.04705882, 0, 1,
-2.36271, 1.231812, -1.142883, 1, 0.05490196, 0, 1,
-2.344596, 0.3034914, -1.343362, 1, 0.05882353, 0, 1,
-2.210534, 0.8465997, -0.6590999, 1, 0.06666667, 0, 1,
-2.163503, 1.670071, -1.396563, 1, 0.07058824, 0, 1,
-2.131693, 0.1905222, -2.649979, 1, 0.07843138, 0, 1,
-2.107663, -0.6427764, -2.132066, 1, 0.08235294, 0, 1,
-2.097944, -0.711875, -3.154628, 1, 0.09019608, 0, 1,
-2.092456, 2.060475, -2.490697, 1, 0.09411765, 0, 1,
-2.077885, -1.832239, -3.165573, 1, 0.1019608, 0, 1,
-2.063983, -1.103212, -2.538275, 1, 0.1098039, 0, 1,
-2.054034, -0.07678204, -2.45354, 1, 0.1137255, 0, 1,
-2.040756, 0.5687205, -2.959975, 1, 0.1215686, 0, 1,
-2.028881, 0.9777124, -0.262045, 1, 0.1254902, 0, 1,
-1.963856, 1.589142, 0.5268362, 1, 0.1333333, 0, 1,
-1.96348, -1.345763, -2.854558, 1, 0.1372549, 0, 1,
-1.962386, 1.492937, -0.8952098, 1, 0.145098, 0, 1,
-1.949726, -0.9369081, -2.331256, 1, 0.1490196, 0, 1,
-1.896515, -0.563273, 0.08742959, 1, 0.1568628, 0, 1,
-1.895198, 1.786898, -0.6547454, 1, 0.1607843, 0, 1,
-1.888752, -0.3195645, -2.27501, 1, 0.1686275, 0, 1,
-1.887376, 1.312395, 0.2402126, 1, 0.172549, 0, 1,
-1.861222, -1.153659, -1.527522, 1, 0.1803922, 0, 1,
-1.832996, -0.82587, -1.288917, 1, 0.1843137, 0, 1,
-1.822958, -1.130632, -1.73699, 1, 0.1921569, 0, 1,
-1.805738, -0.9886601, -1.734316, 1, 0.1960784, 0, 1,
-1.789399, -0.1094013, -0.388451, 1, 0.2039216, 0, 1,
-1.788764, 1.461781, -1.288767, 1, 0.2117647, 0, 1,
-1.784124, 1.058697, -1.970255, 1, 0.2156863, 0, 1,
-1.776069, -0.9595256, -0.2682083, 1, 0.2235294, 0, 1,
-1.773588, 0.07578569, -2.217482, 1, 0.227451, 0, 1,
-1.740061, -0.2770219, -1.936544, 1, 0.2352941, 0, 1,
-1.73449, 1.226785, -1.965063, 1, 0.2392157, 0, 1,
-1.726109, 1.857886, -1.609407, 1, 0.2470588, 0, 1,
-1.722017, -0.1799647, -3.587389, 1, 0.2509804, 0, 1,
-1.716777, -0.3235044, -0.5128651, 1, 0.2588235, 0, 1,
-1.714702, 1.582269, -0.477551, 1, 0.2627451, 0, 1,
-1.711404, 0.6940572, -2.604815, 1, 0.2705882, 0, 1,
-1.710163, -0.443708, -3.477577, 1, 0.2745098, 0, 1,
-1.703305, -1.16954, -2.789099, 1, 0.282353, 0, 1,
-1.683398, 0.1904407, 0.9062073, 1, 0.2862745, 0, 1,
-1.677161, -0.5925283, -1.571296, 1, 0.2941177, 0, 1,
-1.668477, 1.234519, -1.443291, 1, 0.3019608, 0, 1,
-1.666776, 0.9211475, 0.800743, 1, 0.3058824, 0, 1,
-1.665145, 0.1254229, -1.463647, 1, 0.3137255, 0, 1,
-1.655553, 0.661644, -1.164708, 1, 0.3176471, 0, 1,
-1.653671, 0.9227282, -1.527229, 1, 0.3254902, 0, 1,
-1.646204, 1.935021, -1.593066, 1, 0.3294118, 0, 1,
-1.63642, 0.2341063, -1.891821, 1, 0.3372549, 0, 1,
-1.634989, 0.5171899, -0.3820076, 1, 0.3411765, 0, 1,
-1.615776, -0.8455625, -2.203673, 1, 0.3490196, 0, 1,
-1.613553, -0.2772459, -1.145286, 1, 0.3529412, 0, 1,
-1.601641, -0.2933421, -1.905441, 1, 0.3607843, 0, 1,
-1.599642, -0.7831181, -2.066582, 1, 0.3647059, 0, 1,
-1.599419, -0.3569348, -1.446527, 1, 0.372549, 0, 1,
-1.589623, -2.056795, -1.835627, 1, 0.3764706, 0, 1,
-1.580531, 2.359559, -0.7675191, 1, 0.3843137, 0, 1,
-1.574263, 0.4375958, -1.60212, 1, 0.3882353, 0, 1,
-1.563943, 0.8918021, -1.203795, 1, 0.3960784, 0, 1,
-1.548057, 0.3121437, -0.9507043, 1, 0.4039216, 0, 1,
-1.542079, 0.3147939, -1.66777, 1, 0.4078431, 0, 1,
-1.532966, 1.723773, -0.6502246, 1, 0.4156863, 0, 1,
-1.521999, -0.9498883, -0.6460152, 1, 0.4196078, 0, 1,
-1.521107, -0.8313138, -2.038119, 1, 0.427451, 0, 1,
-1.514937, -0.318101, -0.5111238, 1, 0.4313726, 0, 1,
-1.514647, -0.5155172, -2.043354, 1, 0.4392157, 0, 1,
-1.508369, 0.07247126, -1.030451, 1, 0.4431373, 0, 1,
-1.502867, -0.3562559, -3.758038, 1, 0.4509804, 0, 1,
-1.49763, 0.03182726, -1.787692, 1, 0.454902, 0, 1,
-1.490119, -1.215161, -1.968167, 1, 0.4627451, 0, 1,
-1.475907, 0.1406507, -1.678064, 1, 0.4666667, 0, 1,
-1.473827, 0.5331959, -1.381669, 1, 0.4745098, 0, 1,
-1.466214, -0.1203874, -3.080978, 1, 0.4784314, 0, 1,
-1.453294, 0.7465757, 0.8274221, 1, 0.4862745, 0, 1,
-1.453202, -0.0828983, -0.9606292, 1, 0.4901961, 0, 1,
-1.449695, 0.4473564, -0.8704337, 1, 0.4980392, 0, 1,
-1.446131, 0.8673558, -0.9733444, 1, 0.5058824, 0, 1,
-1.441838, -1.656638, -2.57237, 1, 0.509804, 0, 1,
-1.432602, -0.2962597, -0.8689485, 1, 0.5176471, 0, 1,
-1.428985, 0.165508, -2.172448, 1, 0.5215687, 0, 1,
-1.41324, -0.7522811, -2.204656, 1, 0.5294118, 0, 1,
-1.40442, 0.2707322, -0.3674616, 1, 0.5333334, 0, 1,
-1.401894, 1.516781, -1.207109, 1, 0.5411765, 0, 1,
-1.395647, 1.010335, -1.11068, 1, 0.5450981, 0, 1,
-1.391784, -0.9207864, -2.774182, 1, 0.5529412, 0, 1,
-1.389255, -0.2164283, -2.310687, 1, 0.5568628, 0, 1,
-1.388061, -1.108313, -2.023147, 1, 0.5647059, 0, 1,
-1.373732, 1.509191, -0.8107268, 1, 0.5686275, 0, 1,
-1.371118, 0.3864229, -2.298818, 1, 0.5764706, 0, 1,
-1.356156, 1.141126, -0.5055709, 1, 0.5803922, 0, 1,
-1.355616, -0.6644252, -1.561094, 1, 0.5882353, 0, 1,
-1.329618, 0.4233043, -0.6991571, 1, 0.5921569, 0, 1,
-1.327872, 0.6362699, -3.018363, 1, 0.6, 0, 1,
-1.319042, 2.375287, -0.3456906, 1, 0.6078432, 0, 1,
-1.314455, 1.04093, -0.8945484, 1, 0.6117647, 0, 1,
-1.30569, 0.8550891, -2.473481, 1, 0.6196079, 0, 1,
-1.30319, 1.117944, -0.9448347, 1, 0.6235294, 0, 1,
-1.298311, 1.91088, -1.871946, 1, 0.6313726, 0, 1,
-1.285634, 0.4572265, -2.434237, 1, 0.6352941, 0, 1,
-1.28077, 0.4411528, -0.09789129, 1, 0.6431373, 0, 1,
-1.278036, -0.1023279, -3.350799, 1, 0.6470588, 0, 1,
-1.277546, 0.4234557, -1.762474, 1, 0.654902, 0, 1,
-1.274757, -1.79843, -2.168276, 1, 0.6588235, 0, 1,
-1.273095, -0.1252653, -2.452254, 1, 0.6666667, 0, 1,
-1.265963, 0.6499421, -0.1461259, 1, 0.6705883, 0, 1,
-1.260619, -0.4900303, -1.639541, 1, 0.6784314, 0, 1,
-1.258179, 0.2713018, -1.528911, 1, 0.682353, 0, 1,
-1.243106, -0.3645157, -2.516012, 1, 0.6901961, 0, 1,
-1.241068, -0.5338581, -1.712944, 1, 0.6941177, 0, 1,
-1.227116, 0.9742566, 0.2002362, 1, 0.7019608, 0, 1,
-1.215998, -0.4908739, -2.010889, 1, 0.7098039, 0, 1,
-1.209641, 1.148975, -0.1473584, 1, 0.7137255, 0, 1,
-1.204589, -0.578273, -1.897273, 1, 0.7215686, 0, 1,
-1.204047, 0.235384, -1.349169, 1, 0.7254902, 0, 1,
-1.173142, -1.049788, -2.521698, 1, 0.7333333, 0, 1,
-1.159733, -0.3008738, -2.826682, 1, 0.7372549, 0, 1,
-1.151704, -1.143876, -2.290636, 1, 0.7450981, 0, 1,
-1.149624, -0.2510313, -0.07129444, 1, 0.7490196, 0, 1,
-1.145509, 1.380264, 0.2809545, 1, 0.7568628, 0, 1,
-1.138666, -0.7073343, -4.063899, 1, 0.7607843, 0, 1,
-1.13751, 0.7110484, -1.749989, 1, 0.7686275, 0, 1,
-1.137287, 1.356232, -0.6039014, 1, 0.772549, 0, 1,
-1.137028, -0.3867755, -0.9522778, 1, 0.7803922, 0, 1,
-1.125553, -1.076017, -2.334188, 1, 0.7843137, 0, 1,
-1.124181, 0.5073597, -0.7748415, 1, 0.7921569, 0, 1,
-1.114761, 0.8406529, 0.3141193, 1, 0.7960784, 0, 1,
-1.11304, -0.6690775, -1.42471, 1, 0.8039216, 0, 1,
-1.110006, -0.08029709, -1.229316, 1, 0.8117647, 0, 1,
-1.104374, -0.3123046, -1.813884, 1, 0.8156863, 0, 1,
-1.104164, -0.591132, -0.829473, 1, 0.8235294, 0, 1,
-1.096074, -0.4654915, -1.92387, 1, 0.827451, 0, 1,
-1.09071, 0.2740716, -1.776876, 1, 0.8352941, 0, 1,
-1.081775, 0.0533139, -3.76554, 1, 0.8392157, 0, 1,
-1.080507, -0.02683865, -0.9582225, 1, 0.8470588, 0, 1,
-1.072317, 0.2752464, -2.016974, 1, 0.8509804, 0, 1,
-1.058976, -0.9148211, -1.33497, 1, 0.8588235, 0, 1,
-1.05681, 1.662039, -0.3869282, 1, 0.8627451, 0, 1,
-1.053473, 0.2568775, 0.6501523, 1, 0.8705882, 0, 1,
-1.053249, -0.7387512, -2.091424, 1, 0.8745098, 0, 1,
-1.052776, 1.352977, -1.773823, 1, 0.8823529, 0, 1,
-1.050375, 0.9503493, -1.574282, 1, 0.8862745, 0, 1,
-1.047414, 0.7652413, 0.2393217, 1, 0.8941177, 0, 1,
-1.044402, -1.86069, -2.357487, 1, 0.8980392, 0, 1,
-1.041732, 0.2213621, -0.4501661, 1, 0.9058824, 0, 1,
-1.037249, -0.3223407, -2.20203, 1, 0.9137255, 0, 1,
-1.037112, -0.5528712, -1.482805, 1, 0.9176471, 0, 1,
-1.03706, -0.7120352, -3.261779, 1, 0.9254902, 0, 1,
-1.032908, 0.09381905, -1.044995, 1, 0.9294118, 0, 1,
-1.029879, -0.07218374, -0.8367311, 1, 0.9372549, 0, 1,
-1.02868, 0.3835502, -0.5038698, 1, 0.9411765, 0, 1,
-1.021111, -0.1549294, -2.329215, 1, 0.9490196, 0, 1,
-1.01111, -1.927705, -3.007898, 1, 0.9529412, 0, 1,
-0.9995081, 0.5318782, -0.1612257, 1, 0.9607843, 0, 1,
-0.9983094, -1.149401, -2.937978, 1, 0.9647059, 0, 1,
-0.9907761, 0.4520808, -2.821373, 1, 0.972549, 0, 1,
-0.9906942, -0.0920694, 1.000862, 1, 0.9764706, 0, 1,
-0.9886246, 0.09739055, -0.8658239, 1, 0.9843137, 0, 1,
-0.9883565, -0.8042569, -1.523279, 1, 0.9882353, 0, 1,
-0.9876989, 1.59094, -0.129124, 1, 0.9960784, 0, 1,
-0.9802094, 0.7119144, -1.242072, 0.9960784, 1, 0, 1,
-0.9705903, 1.240134, -1.246269, 0.9921569, 1, 0, 1,
-0.9501817, -1.076595, -1.474134, 0.9843137, 1, 0, 1,
-0.9465831, 0.09187832, -1.069214, 0.9803922, 1, 0, 1,
-0.9460339, 0.03526378, -1.003011, 0.972549, 1, 0, 1,
-0.9425977, -0.3450254, -2.32376, 0.9686275, 1, 0, 1,
-0.9391237, 0.467242, -0.2932438, 0.9607843, 1, 0, 1,
-0.9330162, 0.2266343, -0.007468258, 0.9568627, 1, 0, 1,
-0.9194621, 0.05088789, -2.701907, 0.9490196, 1, 0, 1,
-0.9124904, 0.590119, -0.9345493, 0.945098, 1, 0, 1,
-0.9124409, 0.2624359, -2.004479, 0.9372549, 1, 0, 1,
-0.9107291, 1.101473, -1.036922, 0.9333333, 1, 0, 1,
-0.9092914, -0.6253063, -1.610375, 0.9254902, 1, 0, 1,
-0.9072756, -0.3208277, -2.966548, 0.9215686, 1, 0, 1,
-0.9072362, 0.1329019, -1.159831, 0.9137255, 1, 0, 1,
-0.9052132, 1.853944, -2.445438, 0.9098039, 1, 0, 1,
-0.9015034, 0.8912542, -1.115876, 0.9019608, 1, 0, 1,
-0.9001003, -0.151024, -2.355168, 0.8941177, 1, 0, 1,
-0.8960249, 0.9523991, 0.1909768, 0.8901961, 1, 0, 1,
-0.8930184, -0.9996454, -2.944033, 0.8823529, 1, 0, 1,
-0.8927895, 0.3932532, 1.024871, 0.8784314, 1, 0, 1,
-0.8915915, 1.022395, -0.2881682, 0.8705882, 1, 0, 1,
-0.8868902, -0.5211374, -2.522119, 0.8666667, 1, 0, 1,
-0.8757167, -0.4156158, -1.563423, 0.8588235, 1, 0, 1,
-0.8753214, -0.06266557, -1.820203, 0.854902, 1, 0, 1,
-0.8735996, 0.8262474, 0.1177431, 0.8470588, 1, 0, 1,
-0.8735061, 0.9394878, -0.7651491, 0.8431373, 1, 0, 1,
-0.8663711, 1.390848, -3.622486, 0.8352941, 1, 0, 1,
-0.8547864, 0.6512578, -1.295777, 0.8313726, 1, 0, 1,
-0.8541874, -0.4499252, -1.05544, 0.8235294, 1, 0, 1,
-0.849919, -0.2851577, -1.320084, 0.8196079, 1, 0, 1,
-0.8449782, -0.5502733, 0.7646363, 0.8117647, 1, 0, 1,
-0.8405646, -0.4474968, -1.668228, 0.8078431, 1, 0, 1,
-0.83873, -1.467186, -3.436527, 0.8, 1, 0, 1,
-0.8282662, 0.4221804, -1.785471, 0.7921569, 1, 0, 1,
-0.8265969, -1.097321, -1.90518, 0.7882353, 1, 0, 1,
-0.8210803, 0.2538037, -0.5250193, 0.7803922, 1, 0, 1,
-0.8194164, 1.508093, -1.391628, 0.7764706, 1, 0, 1,
-0.8165105, 0.2657029, -1.137406, 0.7686275, 1, 0, 1,
-0.815937, -0.5175774, -1.371508, 0.7647059, 1, 0, 1,
-0.8028795, 1.069983, -2.714787, 0.7568628, 1, 0, 1,
-0.7969379, 0.5154218, -0.0762362, 0.7529412, 1, 0, 1,
-0.7953273, 0.3982033, -2.447935, 0.7450981, 1, 0, 1,
-0.7902107, 1.481635, -2.549161, 0.7411765, 1, 0, 1,
-0.7891149, 0.4856051, 0.2057276, 0.7333333, 1, 0, 1,
-0.7861139, -0.6677914, -1.892126, 0.7294118, 1, 0, 1,
-0.7803264, 0.2205722, -1.788666, 0.7215686, 1, 0, 1,
-0.7798157, 1.554135, -0.4068304, 0.7176471, 1, 0, 1,
-0.7784674, 0.7433562, -0.549897, 0.7098039, 1, 0, 1,
-0.7744697, 0.7130952, -1.197645, 0.7058824, 1, 0, 1,
-0.7683906, 0.5432692, 0.1839784, 0.6980392, 1, 0, 1,
-0.7431014, -0.9202862, -1.723514, 0.6901961, 1, 0, 1,
-0.7418131, 0.00176407, -2.265164, 0.6862745, 1, 0, 1,
-0.7409291, -0.8058152, -2.257175, 0.6784314, 1, 0, 1,
-0.7380103, 0.6116391, -1.911696, 0.6745098, 1, 0, 1,
-0.7371317, 2.150846, -0.6210184, 0.6666667, 1, 0, 1,
-0.7346304, 0.1923269, -0.7810968, 0.6627451, 1, 0, 1,
-0.7340274, -0.5857657, -3.145789, 0.654902, 1, 0, 1,
-0.7335501, 0.2715647, -1.673965, 0.6509804, 1, 0, 1,
-0.7287505, 1.350173, -2.05845, 0.6431373, 1, 0, 1,
-0.7272258, -1.272433, -1.210766, 0.6392157, 1, 0, 1,
-0.7267182, 0.4165851, -0.8698552, 0.6313726, 1, 0, 1,
-0.7245774, -0.4156689, -2.038546, 0.627451, 1, 0, 1,
-0.722246, -0.1929834, -1.505075, 0.6196079, 1, 0, 1,
-0.7219726, -0.05842083, -0.4703273, 0.6156863, 1, 0, 1,
-0.7117596, 0.7700951, -0.7124555, 0.6078432, 1, 0, 1,
-0.7085308, 0.9194219, -0.1202376, 0.6039216, 1, 0, 1,
-0.7069348, -0.9688327, -1.444352, 0.5960785, 1, 0, 1,
-0.7038668, 0.5549221, -1.991559, 0.5882353, 1, 0, 1,
-0.6985023, 0.778154, -1.172258, 0.5843138, 1, 0, 1,
-0.6955993, -0.2478388, -1.246093, 0.5764706, 1, 0, 1,
-0.6934627, -0.3428529, -1.868362, 0.572549, 1, 0, 1,
-0.687265, 0.09218711, -1.733978, 0.5647059, 1, 0, 1,
-0.6841846, 0.6627842, -3.032103, 0.5607843, 1, 0, 1,
-0.6827031, 0.2975304, -2.244586, 0.5529412, 1, 0, 1,
-0.6774732, -2.401063, -3.389799, 0.5490196, 1, 0, 1,
-0.6747023, 1.087507, -1.190525, 0.5411765, 1, 0, 1,
-0.6746432, -1.02979, -2.366764, 0.5372549, 1, 0, 1,
-0.6677663, -0.2848548, -3.898391, 0.5294118, 1, 0, 1,
-0.6613979, 2.080488, -1.25515, 0.5254902, 1, 0, 1,
-0.6593125, -0.07685994, -1.604147, 0.5176471, 1, 0, 1,
-0.6566158, 0.6759134, -0.9836548, 0.5137255, 1, 0, 1,
-0.654188, -0.3408543, -2.981874, 0.5058824, 1, 0, 1,
-0.6489294, -0.8356569, -1.500502, 0.5019608, 1, 0, 1,
-0.6474934, 0.8484952, -2.485806, 0.4941176, 1, 0, 1,
-0.6467575, 0.8588259, -1.07386, 0.4862745, 1, 0, 1,
-0.6382542, -0.334855, -3.142285, 0.4823529, 1, 0, 1,
-0.631598, 0.6384242, -0.8515866, 0.4745098, 1, 0, 1,
-0.6311416, -1.004794, -2.132296, 0.4705882, 1, 0, 1,
-0.6268038, 0.01420633, -0.9208006, 0.4627451, 1, 0, 1,
-0.6267388, 0.9553298, -0.5146207, 0.4588235, 1, 0, 1,
-0.6226283, 0.06482441, -1.084397, 0.4509804, 1, 0, 1,
-0.6199121, -0.7909243, -0.791671, 0.4470588, 1, 0, 1,
-0.6075834, 0.6318282, -1.774649, 0.4392157, 1, 0, 1,
-0.6036115, 0.1659518, -2.774981, 0.4352941, 1, 0, 1,
-0.6034943, -0.2545029, 0.9202549, 0.427451, 1, 0, 1,
-0.6002487, -2.253685, -3.126704, 0.4235294, 1, 0, 1,
-0.5920899, 3.376461, 1.232462, 0.4156863, 1, 0, 1,
-0.5873907, -0.6132911, -3.773968, 0.4117647, 1, 0, 1,
-0.5845262, 0.2889082, -1.254823, 0.4039216, 1, 0, 1,
-0.5806618, 0.05315225, -1.104211, 0.3960784, 1, 0, 1,
-0.5777638, -0.415974, -2.834075, 0.3921569, 1, 0, 1,
-0.5751879, 0.9709614, -1.407603, 0.3843137, 1, 0, 1,
-0.5732947, -1.128977, -3.538446, 0.3803922, 1, 0, 1,
-0.5688043, 0.4041754, -1.634479, 0.372549, 1, 0, 1,
-0.5685448, -0.5014297, -1.348869, 0.3686275, 1, 0, 1,
-0.5592229, -0.1720386, -2.688409, 0.3607843, 1, 0, 1,
-0.5555192, -0.006842562, -1.714443, 0.3568628, 1, 0, 1,
-0.5513309, -0.6770419, -2.573923, 0.3490196, 1, 0, 1,
-0.5503653, -0.2023287, -1.856991, 0.345098, 1, 0, 1,
-0.5491404, 1.727199, -0.3479334, 0.3372549, 1, 0, 1,
-0.5482972, 0.5415882, -0.956174, 0.3333333, 1, 0, 1,
-0.5391839, -1.25612, -1.636533, 0.3254902, 1, 0, 1,
-0.5386429, -0.5816306, -2.811601, 0.3215686, 1, 0, 1,
-0.5376108, -0.5168763, -2.681157, 0.3137255, 1, 0, 1,
-0.5364222, -0.7004824, -1.298326, 0.3098039, 1, 0, 1,
-0.5354923, -0.7463897, -3.195161, 0.3019608, 1, 0, 1,
-0.535162, 0.06300396, -1.063189, 0.2941177, 1, 0, 1,
-0.527894, -1.132008, -2.183407, 0.2901961, 1, 0, 1,
-0.5225596, 1.309371, -0.138862, 0.282353, 1, 0, 1,
-0.5209235, -0.02440385, -0.4530279, 0.2784314, 1, 0, 1,
-0.5186988, 0.7755146, 0.9811847, 0.2705882, 1, 0, 1,
-0.5161977, -0.9307252, -2.507414, 0.2666667, 1, 0, 1,
-0.5124873, -0.969031, -3.669603, 0.2588235, 1, 0, 1,
-0.5119864, -0.5429177, -2.422385, 0.254902, 1, 0, 1,
-0.5109427, -0.0435317, -0.9966065, 0.2470588, 1, 0, 1,
-0.5076883, -0.6959409, -1.842661, 0.2431373, 1, 0, 1,
-0.5074903, 1.28958, -0.3810628, 0.2352941, 1, 0, 1,
-0.5061522, -1.318597, -1.876358, 0.2313726, 1, 0, 1,
-0.505819, 0.7214742, -0.2272578, 0.2235294, 1, 0, 1,
-0.4976182, -0.5239461, -1.29847, 0.2196078, 1, 0, 1,
-0.4955766, -2.818197, -2.766557, 0.2117647, 1, 0, 1,
-0.4875627, -0.5414197, -3.709609, 0.2078431, 1, 0, 1,
-0.4802153, -0.5674809, -1.598375, 0.2, 1, 0, 1,
-0.4791764, 0.8994048, -1.147896, 0.1921569, 1, 0, 1,
-0.4788876, 0.8383791, -1.759624, 0.1882353, 1, 0, 1,
-0.4788456, 1.901245, -0.07038631, 0.1803922, 1, 0, 1,
-0.4746442, 0.3055496, -0.3688201, 0.1764706, 1, 0, 1,
-0.4730468, 1.039382, -0.4363177, 0.1686275, 1, 0, 1,
-0.4715007, 1.244288, 0.6501334, 0.1647059, 1, 0, 1,
-0.4709051, -0.4114117, -3.472646, 0.1568628, 1, 0, 1,
-0.4657248, -0.2197861, -3.657923, 0.1529412, 1, 0, 1,
-0.4649719, -0.05795285, -2.160977, 0.145098, 1, 0, 1,
-0.464076, -0.7119246, -3.011093, 0.1411765, 1, 0, 1,
-0.4611915, -0.476946, -0.5782502, 0.1333333, 1, 0, 1,
-0.4588465, 0.498155, 0.4640608, 0.1294118, 1, 0, 1,
-0.453388, -0.3142261, -3.025202, 0.1215686, 1, 0, 1,
-0.4521029, -1.854443, -0.6433784, 0.1176471, 1, 0, 1,
-0.4496142, -1.184264, -4.371863, 0.1098039, 1, 0, 1,
-0.4428433, -0.5705727, -2.497799, 0.1058824, 1, 0, 1,
-0.4399305, -1.486879, -2.33297, 0.09803922, 1, 0, 1,
-0.4397179, -0.3749895, -2.308074, 0.09019608, 1, 0, 1,
-0.4386137, -0.8567589, -1.790534, 0.08627451, 1, 0, 1,
-0.4359545, -0.1082971, -2.171383, 0.07843138, 1, 0, 1,
-0.4340337, -2.483744, -2.635474, 0.07450981, 1, 0, 1,
-0.4294094, 0.5678688, -0.6175224, 0.06666667, 1, 0, 1,
-0.4268925, -0.4930447, -2.584653, 0.0627451, 1, 0, 1,
-0.4253137, 0.5739453, -0.7753907, 0.05490196, 1, 0, 1,
-0.4223047, 0.3351403, -0.494022, 0.05098039, 1, 0, 1,
-0.422076, -0.6455119, -1.180543, 0.04313726, 1, 0, 1,
-0.4216814, -0.9941179, -2.17257, 0.03921569, 1, 0, 1,
-0.415255, 0.422524, -2.089629, 0.03137255, 1, 0, 1,
-0.4148846, -0.1825318, -2.631419, 0.02745098, 1, 0, 1,
-0.4056266, 3.247763, 0.8334383, 0.01960784, 1, 0, 1,
-0.4033283, 0.4074039, -0.6212668, 0.01568628, 1, 0, 1,
-0.3897077, -1.634394, -2.613841, 0.007843138, 1, 0, 1,
-0.3896448, -1.779757, -4.632938, 0.003921569, 1, 0, 1,
-0.3842645, -0.2090963, -1.027847, 0, 1, 0.003921569, 1,
-0.3775533, 0.7216164, 0.6622435, 0, 1, 0.01176471, 1,
-0.3750725, 0.5902777, 1.395932, 0, 1, 0.01568628, 1,
-0.37426, -1.693762, -2.625464, 0, 1, 0.02352941, 1,
-0.3736128, 0.2698606, -2.374664, 0, 1, 0.02745098, 1,
-0.3730864, 1.312951, 1.43165, 0, 1, 0.03529412, 1,
-0.3722179, -1.253855, -3.537846, 0, 1, 0.03921569, 1,
-0.3717148, 1.52506, 0.3357997, 0, 1, 0.04705882, 1,
-0.3714411, 0.6205611, 0.3301965, 0, 1, 0.05098039, 1,
-0.3704912, 0.1335091, -0.7593845, 0, 1, 0.05882353, 1,
-0.3702853, 1.335972, -1.625256, 0, 1, 0.0627451, 1,
-0.3569521, -1.200197, -2.808406, 0, 1, 0.07058824, 1,
-0.3541933, -0.4613793, -1.958637, 0, 1, 0.07450981, 1,
-0.3477863, 0.7362139, 0.5158868, 0, 1, 0.08235294, 1,
-0.3444661, 0.1079943, -1.019902, 0, 1, 0.08627451, 1,
-0.3426101, -0.2374342, -2.314559, 0, 1, 0.09411765, 1,
-0.3411462, -0.3562619, -0.6197304, 0, 1, 0.1019608, 1,
-0.3402205, 1.154141, -0.2667708, 0, 1, 0.1058824, 1,
-0.3399439, -0.1946267, -1.577648, 0, 1, 0.1137255, 1,
-0.3361573, -0.09602095, -0.8082195, 0, 1, 0.1176471, 1,
-0.3355904, 0.5351475, 0.05056657, 0, 1, 0.1254902, 1,
-0.3342607, 0.9775601, 0.5827598, 0, 1, 0.1294118, 1,
-0.3337204, -0.7300542, -3.21653, 0, 1, 0.1372549, 1,
-0.3332058, 1.983136, -0.7469164, 0, 1, 0.1411765, 1,
-0.3281777, 1.475312, 0.7733661, 0, 1, 0.1490196, 1,
-0.328162, -0.5727415, -3.356434, 0, 1, 0.1529412, 1,
-0.3266126, -0.3975478, -3.596533, 0, 1, 0.1607843, 1,
-0.3253178, -0.9028347, -3.202901, 0, 1, 0.1647059, 1,
-0.3252252, -0.1015346, -1.128509, 0, 1, 0.172549, 1,
-0.3242313, -1.164716, -5.982107, 0, 1, 0.1764706, 1,
-0.3236322, 1.01702, 0.1540087, 0, 1, 0.1843137, 1,
-0.3201091, 0.935873, -0.6819668, 0, 1, 0.1882353, 1,
-0.3182302, 0.8114895, 1.275353, 0, 1, 0.1960784, 1,
-0.3136119, 0.1720351, 0.1978012, 0, 1, 0.2039216, 1,
-0.312223, 0.9388047, -0.7106267, 0, 1, 0.2078431, 1,
-0.3099976, 0.09979695, -1.500442, 0, 1, 0.2156863, 1,
-0.3033538, 0.6658825, 0.3236586, 0, 1, 0.2196078, 1,
-0.3021912, 0.3897227, -0.140755, 0, 1, 0.227451, 1,
-0.3000368, 0.4249951, -0.7218773, 0, 1, 0.2313726, 1,
-0.2980534, -1.807006, -1.382483, 0, 1, 0.2392157, 1,
-0.2975005, -0.8530966, -2.54877, 0, 1, 0.2431373, 1,
-0.2954554, -0.8316227, -2.505619, 0, 1, 0.2509804, 1,
-0.2914506, 0.5130007, -0.8288772, 0, 1, 0.254902, 1,
-0.2889636, -1.030527, -2.170738, 0, 1, 0.2627451, 1,
-0.2878524, -0.3083118, -2.660031, 0, 1, 0.2666667, 1,
-0.2876595, -0.463807, -2.907545, 0, 1, 0.2745098, 1,
-0.2867134, 1.085324, -0.6146384, 0, 1, 0.2784314, 1,
-0.2833571, 0.6311726, 1.127476, 0, 1, 0.2862745, 1,
-0.2785625, 0.3177206, -0.1754503, 0, 1, 0.2901961, 1,
-0.2772986, -0.7293573, -2.72455, 0, 1, 0.2980392, 1,
-0.2748978, 0.4611735, -0.1219459, 0, 1, 0.3058824, 1,
-0.2744318, -1.42793, -3.747948, 0, 1, 0.3098039, 1,
-0.2742306, -0.9987072, -3.462036, 0, 1, 0.3176471, 1,
-0.2739191, -0.30093, -1.849195, 0, 1, 0.3215686, 1,
-0.2736339, 1.012145, 0.08405498, 0, 1, 0.3294118, 1,
-0.2712451, 1.655046, -0.5125072, 0, 1, 0.3333333, 1,
-0.2710122, 0.398658, 1.215101, 0, 1, 0.3411765, 1,
-0.2692223, -1.048369, -2.277983, 0, 1, 0.345098, 1,
-0.2689014, -0.2262245, -1.402585, 0, 1, 0.3529412, 1,
-0.2658319, 0.6247123, -0.07400031, 0, 1, 0.3568628, 1,
-0.2592866, -1.005652, -1.837125, 0, 1, 0.3647059, 1,
-0.2572193, -0.4254033, -2.016196, 0, 1, 0.3686275, 1,
-0.2568842, 0.843847, -1.220858, 0, 1, 0.3764706, 1,
-0.2568178, -0.07798852, -2.688599, 0, 1, 0.3803922, 1,
-0.2559547, 1.722599, -0.7376705, 0, 1, 0.3882353, 1,
-0.2550479, 1.516108, 0.01958857, 0, 1, 0.3921569, 1,
-0.2545499, 1.627167, -0.8792582, 0, 1, 0.4, 1,
-0.2532801, 0.6934437, -0.973664, 0, 1, 0.4078431, 1,
-0.2532288, 0.5737812, -0.6085074, 0, 1, 0.4117647, 1,
-0.2523779, -1.239347, -5.911067, 0, 1, 0.4196078, 1,
-0.2458381, -0.2713719, -1.768715, 0, 1, 0.4235294, 1,
-0.2431827, 1.909417, -0.3666221, 0, 1, 0.4313726, 1,
-0.2422604, -0.9135277, -3.033353, 0, 1, 0.4352941, 1,
-0.2409423, 0.5679768, -1.101316, 0, 1, 0.4431373, 1,
-0.240924, -1.290505, -2.721347, 0, 1, 0.4470588, 1,
-0.2405667, -0.3323779, -0.9557947, 0, 1, 0.454902, 1,
-0.2400471, -0.3944913, -3.399106, 0, 1, 0.4588235, 1,
-0.2393661, -0.2325612, -2.155388, 0, 1, 0.4666667, 1,
-0.2362949, -0.1855034, -0.01848842, 0, 1, 0.4705882, 1,
-0.2321952, 1.274131, -0.6644588, 0, 1, 0.4784314, 1,
-0.2222428, 1.189479, 0.6374084, 0, 1, 0.4823529, 1,
-0.2218129, 0.003436247, -0.7441063, 0, 1, 0.4901961, 1,
-0.2194188, 1.316615, 0.02423832, 0, 1, 0.4941176, 1,
-0.2167309, -0.5514396, -2.515738, 0, 1, 0.5019608, 1,
-0.2149759, -0.3982059, -2.104516, 0, 1, 0.509804, 1,
-0.2146288, 0.8063304, -0.3327152, 0, 1, 0.5137255, 1,
-0.2124443, 0.8678172, -0.3528871, 0, 1, 0.5215687, 1,
-0.210715, -0.09572036, -1.741466, 0, 1, 0.5254902, 1,
-0.2024361, 0.8294032, -1.870981, 0, 1, 0.5333334, 1,
-0.1937857, 1.304311, 0.8713777, 0, 1, 0.5372549, 1,
-0.1870421, -0.6800132, -2.992271, 0, 1, 0.5450981, 1,
-0.1856589, 0.08872221, -1.449502, 0, 1, 0.5490196, 1,
-0.1851896, 0.2977407, -0.4910498, 0, 1, 0.5568628, 1,
-0.1844787, 0.7199253, 0.009678967, 0, 1, 0.5607843, 1,
-0.1817975, 1.54297, -0.994734, 0, 1, 0.5686275, 1,
-0.1816082, 0.01212885, -0.721658, 0, 1, 0.572549, 1,
-0.180821, 0.3719859, 1.06568, 0, 1, 0.5803922, 1,
-0.18082, -0.3667361, -4.037169, 0, 1, 0.5843138, 1,
-0.1729716, -0.4552809, -2.542184, 0, 1, 0.5921569, 1,
-0.1707112, -0.1193377, -3.5836, 0, 1, 0.5960785, 1,
-0.1695585, 0.7758043, -2.72352, 0, 1, 0.6039216, 1,
-0.1678093, 1.543545, -1.284107, 0, 1, 0.6117647, 1,
-0.1677144, -0.4578907, -4.376317, 0, 1, 0.6156863, 1,
-0.1672771, -0.01346454, -3.686379, 0, 1, 0.6235294, 1,
-0.1666676, -1.125189, -3.925848, 0, 1, 0.627451, 1,
-0.1633079, -0.4904182, -3.066857, 0, 1, 0.6352941, 1,
-0.1630889, -1.193555, -4.536455, 0, 1, 0.6392157, 1,
-0.1591203, 0.3709441, -1.892443, 0, 1, 0.6470588, 1,
-0.1565272, 0.4593726, 0.08798804, 0, 1, 0.6509804, 1,
-0.1524164, -0.6507812, -4.146846, 0, 1, 0.6588235, 1,
-0.1498372, 1.267576, -0.7856979, 0, 1, 0.6627451, 1,
-0.1476918, 0.9134853, -1.932727, 0, 1, 0.6705883, 1,
-0.1451901, 1.123464, -1.303765, 0, 1, 0.6745098, 1,
-0.1421311, -1.796008, -2.578636, 0, 1, 0.682353, 1,
-0.1402913, -0.623925, -2.507751, 0, 1, 0.6862745, 1,
-0.1379243, 0.4476992, -1.509309, 0, 1, 0.6941177, 1,
-0.1374904, -0.4718659, -2.461632, 0, 1, 0.7019608, 1,
-0.137123, 0.2845285, 0.8322668, 0, 1, 0.7058824, 1,
-0.1363041, 1.057539, 0.2731667, 0, 1, 0.7137255, 1,
-0.1337223, 0.6262886, -0.3661284, 0, 1, 0.7176471, 1,
-0.1303921, 0.6616215, 0.07565953, 0, 1, 0.7254902, 1,
-0.1269398, 0.09398677, -1.525289, 0, 1, 0.7294118, 1,
-0.1235694, 1.093299, -0.6186553, 0, 1, 0.7372549, 1,
-0.1181248, 0.7066244, 0.1409695, 0, 1, 0.7411765, 1,
-0.1157584, -0.06596104, -0.6497996, 0, 1, 0.7490196, 1,
-0.1155618, 1.245029, -1.627774, 0, 1, 0.7529412, 1,
-0.1144328, -0.1980946, -2.248694, 0, 1, 0.7607843, 1,
-0.1138411, -0.782895, -3.802512, 0, 1, 0.7647059, 1,
-0.1068307, -0.4584372, -2.116431, 0, 1, 0.772549, 1,
-0.1066749, 0.2493133, -0.778654, 0, 1, 0.7764706, 1,
-0.1016995, -0.7696547, -1.588035, 0, 1, 0.7843137, 1,
-0.1000698, -0.4367482, -2.999524, 0, 1, 0.7882353, 1,
-0.09419423, 0.6783652, 0.4168366, 0, 1, 0.7960784, 1,
-0.09399845, -1.437908, -3.599676, 0, 1, 0.8039216, 1,
-0.09270984, 0.04925656, -0.6777275, 0, 1, 0.8078431, 1,
-0.09066814, -1.51911, -3.179859, 0, 1, 0.8156863, 1,
-0.0864857, -0.6950759, -2.152389, 0, 1, 0.8196079, 1,
-0.08554605, 1.066295, -1.312643, 0, 1, 0.827451, 1,
-0.07924731, 0.09432232, -0.5369323, 0, 1, 0.8313726, 1,
-0.07896753, -0.9463789, -4.737801, 0, 1, 0.8392157, 1,
-0.07895466, 0.3624817, -1.028957, 0, 1, 0.8431373, 1,
-0.07511751, -0.0927424, -2.082842, 0, 1, 0.8509804, 1,
-0.07393686, 0.7655304, 1.720115, 0, 1, 0.854902, 1,
-0.0732805, 0.9467906, -0.4996414, 0, 1, 0.8627451, 1,
-0.07184809, -1.199945, -3.808804, 0, 1, 0.8666667, 1,
-0.07065541, 0.9801458, 0.3922936, 0, 1, 0.8745098, 1,
-0.0672745, 0.02124351, -0.4708052, 0, 1, 0.8784314, 1,
-0.06655895, 0.9583813, -2.180009, 0, 1, 0.8862745, 1,
-0.06568073, -0.7624964, -5.652209, 0, 1, 0.8901961, 1,
-0.06431777, -0.6692294, -3.680214, 0, 1, 0.8980392, 1,
-0.06006136, -0.811286, -2.207637, 0, 1, 0.9058824, 1,
-0.05616939, 0.7456958, 1.514585, 0, 1, 0.9098039, 1,
-0.05379226, -1.106152, -1.41617, 0, 1, 0.9176471, 1,
-0.05340022, -0.1291973, -1.167244, 0, 1, 0.9215686, 1,
-0.05322397, -2.139013, -2.969798, 0, 1, 0.9294118, 1,
-0.05263309, -0.03459714, -2.083451, 0, 1, 0.9333333, 1,
-0.05216127, 0.4101728, 1.018024, 0, 1, 0.9411765, 1,
-0.0504172, 0.9166216, -1.533391, 0, 1, 0.945098, 1,
-0.0487195, 0.4149397, -0.7189767, 0, 1, 0.9529412, 1,
-0.04708488, 0.1141497, -1.120086, 0, 1, 0.9568627, 1,
-0.0445913, -0.1333569, -3.033056, 0, 1, 0.9647059, 1,
-0.04175637, 0.4778624, 0.5350226, 0, 1, 0.9686275, 1,
-0.04122696, 0.06676623, 0.215113, 0, 1, 0.9764706, 1,
-0.0409092, -0.3054125, -1.321076, 0, 1, 0.9803922, 1,
-0.04055705, 0.6015038, 0.2551132, 0, 1, 0.9882353, 1,
-0.0383543, 0.8162392, -0.5395731, 0, 1, 0.9921569, 1,
-0.02890804, -1.018295, -2.847218, 0, 1, 1, 1,
-0.02541818, 0.6156619, -1.374733, 0, 0.9921569, 1, 1,
-0.02469666, -0.1813262, -3.149089, 0, 0.9882353, 1, 1,
-0.02424583, 0.1570553, 2.028903, 0, 0.9803922, 1, 1,
-0.02185621, -0.3382733, -3.238522, 0, 0.9764706, 1, 1,
-0.0162355, 0.01004773, -0.6257522, 0, 0.9686275, 1, 1,
-0.01031367, -0.4856824, -3.180489, 0, 0.9647059, 1, 1,
-0.008567147, -0.3730365, -2.048014, 0, 0.9568627, 1, 1,
-0.007653289, 0.8273312, 0.6066848, 0, 0.9529412, 1, 1,
-0.006741149, -0.1687762, -2.263407, 0, 0.945098, 1, 1,
0.004548206, -0.129349, 1.564761, 0, 0.9411765, 1, 1,
0.005896638, 0.7436826, 0.5858192, 0, 0.9333333, 1, 1,
0.007472092, 0.05082333, 0.3423176, 0, 0.9294118, 1, 1,
0.00847315, -0.09327736, 2.756181, 0, 0.9215686, 1, 1,
0.01337591, 2.179281, 0.3445303, 0, 0.9176471, 1, 1,
0.01344481, 2.910391, 1.018958, 0, 0.9098039, 1, 1,
0.01492557, -0.1390798, 3.167292, 0, 0.9058824, 1, 1,
0.02837821, 0.04713003, 1.131535, 0, 0.8980392, 1, 1,
0.02921649, -1.610808, 4.319119, 0, 0.8901961, 1, 1,
0.03455565, -0.05919664, 3.738654, 0, 0.8862745, 1, 1,
0.0352923, -1.183048, 3.104662, 0, 0.8784314, 1, 1,
0.03911709, -0.4895619, 2.575624, 0, 0.8745098, 1, 1,
0.04092785, -1.681346, 2.96289, 0, 0.8666667, 1, 1,
0.04380161, -1.218354, 3.579939, 0, 0.8627451, 1, 1,
0.05114308, 0.9331452, 1.070645, 0, 0.854902, 1, 1,
0.05170397, -1.052356, 4.336464, 0, 0.8509804, 1, 1,
0.05258955, -0.5378823, 3.419245, 0, 0.8431373, 1, 1,
0.05345971, 0.2174456, 0.5118747, 0, 0.8392157, 1, 1,
0.05690219, -1.354026, 2.635009, 0, 0.8313726, 1, 1,
0.06074009, -0.6903934, 2.315491, 0, 0.827451, 1, 1,
0.06630705, -1.04603, 3.33385, 0, 0.8196079, 1, 1,
0.06895936, -1.235632, 5.016335, 0, 0.8156863, 1, 1,
0.07479215, -0.1773191, 3.516668, 0, 0.8078431, 1, 1,
0.07811347, 1.123081, 0.2362768, 0, 0.8039216, 1, 1,
0.08500679, -0.4208672, 2.737123, 0, 0.7960784, 1, 1,
0.08731612, -0.7528975, 1.83302, 0, 0.7882353, 1, 1,
0.08834877, 1.473107, -0.9488732, 0, 0.7843137, 1, 1,
0.09001768, 0.8811355, -0.04363925, 0, 0.7764706, 1, 1,
0.09200283, -0.3265523, 4.685919, 0, 0.772549, 1, 1,
0.0927925, 0.1720546, -0.5755225, 0, 0.7647059, 1, 1,
0.1126125, -1.209905, 1.508871, 0, 0.7607843, 1, 1,
0.1130919, 0.07328946, 1.261506, 0, 0.7529412, 1, 1,
0.1150389, 0.2109121, 0.08095442, 0, 0.7490196, 1, 1,
0.1166779, 0.5756441, 0.5558807, 0, 0.7411765, 1, 1,
0.119946, 0.8913597, -0.5487829, 0, 0.7372549, 1, 1,
0.1204692, 0.02270881, 0.9406337, 0, 0.7294118, 1, 1,
0.1234996, -1.104496, 3.408648, 0, 0.7254902, 1, 1,
0.12906, 0.07801998, -0.02419236, 0, 0.7176471, 1, 1,
0.1347099, 0.1515498, 1.296809, 0, 0.7137255, 1, 1,
0.1352824, -1.114948, 4.104298, 0, 0.7058824, 1, 1,
0.1353667, 0.1333529, 0.6770461, 0, 0.6980392, 1, 1,
0.1358681, -0.267261, 3.039999, 0, 0.6941177, 1, 1,
0.1361215, -1.534001, 1.446602, 0, 0.6862745, 1, 1,
0.1385253, -0.1143476, 3.12035, 0, 0.682353, 1, 1,
0.1402555, 0.5508974, 2.774274, 0, 0.6745098, 1, 1,
0.1410043, 1.071759, -1.408641, 0, 0.6705883, 1, 1,
0.1415216, 0.6439071, -1.425243, 0, 0.6627451, 1, 1,
0.1425837, -0.9006496, 3.553754, 0, 0.6588235, 1, 1,
0.1455041, -0.2409024, 2.31603, 0, 0.6509804, 1, 1,
0.1480809, 0.2174378, 0.05090563, 0, 0.6470588, 1, 1,
0.149813, -1.584807, 3.483205, 0, 0.6392157, 1, 1,
0.1500239, 0.6823857, 0.2236395, 0, 0.6352941, 1, 1,
0.1571742, -0.3829306, -0.1845917, 0, 0.627451, 1, 1,
0.1585486, -0.3150186, 2.577315, 0, 0.6235294, 1, 1,
0.1631576, -0.9115188, 0.5807679, 0, 0.6156863, 1, 1,
0.1635783, -0.9483705, 1.996736, 0, 0.6117647, 1, 1,
0.1656889, -1.889767, 1.219475, 0, 0.6039216, 1, 1,
0.1668352, -0.6566069, 2.304089, 0, 0.5960785, 1, 1,
0.1707666, -0.7764972, 2.730611, 0, 0.5921569, 1, 1,
0.1714082, 1.666265, -0.3194998, 0, 0.5843138, 1, 1,
0.1728544, -0.2203285, 1.802189, 0, 0.5803922, 1, 1,
0.1771136, 0.7012252, 0.06643313, 0, 0.572549, 1, 1,
0.1797788, -0.5142374, 3.372221, 0, 0.5686275, 1, 1,
0.1845429, 1.947279, 0.3523164, 0, 0.5607843, 1, 1,
0.185576, 0.2612363, -0.5640389, 0, 0.5568628, 1, 1,
0.1864462, -0.2966337, 2.434736, 0, 0.5490196, 1, 1,
0.1884646, -1.779344, 1.867938, 0, 0.5450981, 1, 1,
0.1897305, -0.9141858, 2.902999, 0, 0.5372549, 1, 1,
0.1929446, -0.4445985, 3.902444, 0, 0.5333334, 1, 1,
0.1961102, 0.2789874, 1.269567, 0, 0.5254902, 1, 1,
0.1990453, 0.280887, 1.210259, 0, 0.5215687, 1, 1,
0.2013095, -0.6356467, 3.260004, 0, 0.5137255, 1, 1,
0.2045501, -0.2664457, 0.1958834, 0, 0.509804, 1, 1,
0.2077427, -2.010874, 2.61961, 0, 0.5019608, 1, 1,
0.2097144, -0.1204855, 2.391598, 0, 0.4941176, 1, 1,
0.209815, -0.3683273, 1.970441, 0, 0.4901961, 1, 1,
0.210716, 0.2400845, 2.279972, 0, 0.4823529, 1, 1,
0.2111609, 1.03009, 1.770273, 0, 0.4784314, 1, 1,
0.2112589, -0.5753012, 4.267219, 0, 0.4705882, 1, 1,
0.211399, -2.642875, 3.096701, 0, 0.4666667, 1, 1,
0.2138077, -1.116143, 2.49166, 0, 0.4588235, 1, 1,
0.2138885, -0.5112962, 3.624502, 0, 0.454902, 1, 1,
0.2140382, 0.7610316, 2.402286, 0, 0.4470588, 1, 1,
0.2145019, 0.3267101, 1.749022, 0, 0.4431373, 1, 1,
0.2149254, 0.4653056, 1.058243, 0, 0.4352941, 1, 1,
0.2187713, -0.3938873, 2.54941, 0, 0.4313726, 1, 1,
0.2190845, -1.587917, 2.507848, 0, 0.4235294, 1, 1,
0.2191705, 0.3252802, -0.1529678, 0, 0.4196078, 1, 1,
0.2192783, -0.2435106, -0.2548206, 0, 0.4117647, 1, 1,
0.2216324, -0.005703326, 1.051198, 0, 0.4078431, 1, 1,
0.2226426, -1.041234, 1.292382, 0, 0.4, 1, 1,
0.2284347, -1.152313, 3.630807, 0, 0.3921569, 1, 1,
0.2315407, -1.653502, 4.432673, 0, 0.3882353, 1, 1,
0.2345182, 0.240021, -0.9026045, 0, 0.3803922, 1, 1,
0.2426681, -0.2444618, 1.556704, 0, 0.3764706, 1, 1,
0.2450567, 0.4640783, 0.8971326, 0, 0.3686275, 1, 1,
0.2488565, 0.5782863, 2.240727, 0, 0.3647059, 1, 1,
0.2509653, 1.109991, -1.436991, 0, 0.3568628, 1, 1,
0.2510613, 1.248719, 0.3398722, 0, 0.3529412, 1, 1,
0.2568571, -1.364666, 3.272419, 0, 0.345098, 1, 1,
0.2596933, -1.358859, 3.676932, 0, 0.3411765, 1, 1,
0.2616638, 1.115221, 1.310292, 0, 0.3333333, 1, 1,
0.2622593, -0.2093659, 2.736474, 0, 0.3294118, 1, 1,
0.2655875, -1.261653, 2.565783, 0, 0.3215686, 1, 1,
0.2663197, -0.1311014, 4.497417, 0, 0.3176471, 1, 1,
0.2680424, -0.8700138, 1.636425, 0, 0.3098039, 1, 1,
0.2709469, -1.299533, 1.54773, 0, 0.3058824, 1, 1,
0.2722968, 0.2454659, 1.703791, 0, 0.2980392, 1, 1,
0.276329, 0.08091407, 0.4832346, 0, 0.2901961, 1, 1,
0.2788192, -0.7202925, 3.096758, 0, 0.2862745, 1, 1,
0.2789409, -0.03626865, 3.664571, 0, 0.2784314, 1, 1,
0.2826542, 0.2296015, 1.209613, 0, 0.2745098, 1, 1,
0.2833204, -1.217887, 3.051816, 0, 0.2666667, 1, 1,
0.2856899, -1.24366, 2.625306, 0, 0.2627451, 1, 1,
0.2882654, 1.022617, 0.09965501, 0, 0.254902, 1, 1,
0.2900402, -0.1680338, 0.875439, 0, 0.2509804, 1, 1,
0.2915395, -0.707822, 1.92867, 0, 0.2431373, 1, 1,
0.2919171, 0.83745, -0.2919681, 0, 0.2392157, 1, 1,
0.2922974, -1.620408, 2.981897, 0, 0.2313726, 1, 1,
0.295567, 1.45302, -0.2984104, 0, 0.227451, 1, 1,
0.2969524, 1.460898, 0.1047419, 0, 0.2196078, 1, 1,
0.2971321, 1.045489, 1.979936, 0, 0.2156863, 1, 1,
0.2988796, 0.5550779, -0.1789929, 0, 0.2078431, 1, 1,
0.3026799, 0.5606546, 2.017189, 0, 0.2039216, 1, 1,
0.3031846, 0.7653871, -0.6978617, 0, 0.1960784, 1, 1,
0.3090669, -0.2713962, 2.735533, 0, 0.1882353, 1, 1,
0.3094882, -0.4211077, 2.327576, 0, 0.1843137, 1, 1,
0.3107089, 0.3909486, 0.1801959, 0, 0.1764706, 1, 1,
0.3113151, 0.8623041, 1.144536, 0, 0.172549, 1, 1,
0.3118108, 0.3212577, -3.36242, 0, 0.1647059, 1, 1,
0.3119265, 1.452569, -0.5855244, 0, 0.1607843, 1, 1,
0.3120221, 1.30835, 0.5047379, 0, 0.1529412, 1, 1,
0.3191887, -0.3568176, 1.869969, 0, 0.1490196, 1, 1,
0.3235239, 1.135806, 0.796627, 0, 0.1411765, 1, 1,
0.3277615, 0.2426487, 0.7463941, 0, 0.1372549, 1, 1,
0.3293611, -0.09020451, 2.711648, 0, 0.1294118, 1, 1,
0.3310478, 0.5915241, -0.9978161, 0, 0.1254902, 1, 1,
0.3361966, 0.02451137, 1.922746, 0, 0.1176471, 1, 1,
0.3373776, 0.03730696, -0.245051, 0, 0.1137255, 1, 1,
0.3435346, 0.03028492, 2.350222, 0, 0.1058824, 1, 1,
0.3516995, 1.522405, 0.2426371, 0, 0.09803922, 1, 1,
0.3569333, 0.1654579, 2.622927, 0, 0.09411765, 1, 1,
0.3633076, 1.304395, 0.2915949, 0, 0.08627451, 1, 1,
0.3643269, -0.6679365, 3.545023, 0, 0.08235294, 1, 1,
0.3660103, 0.2002637, 2.367685, 0, 0.07450981, 1, 1,
0.3718858, 0.4430499, 2.010124, 0, 0.07058824, 1, 1,
0.3722055, 0.2544924, 0.4355249, 0, 0.0627451, 1, 1,
0.375487, -0.1681994, 3.346068, 0, 0.05882353, 1, 1,
0.3812173, 0.2654099, 1.416581, 0, 0.05098039, 1, 1,
0.3829941, -0.9222753, 2.822478, 0, 0.04705882, 1, 1,
0.3848602, -1.638417, 5.343852, 0, 0.03921569, 1, 1,
0.3882275, 0.4055243, 0.4765425, 0, 0.03529412, 1, 1,
0.3888999, 1.402101, -0.03617667, 0, 0.02745098, 1, 1,
0.3898152, -0.796148, 2.550232, 0, 0.02352941, 1, 1,
0.3900701, 0.5417477, 0.4127722, 0, 0.01568628, 1, 1,
0.3947829, 0.5593178, 1.551677, 0, 0.01176471, 1, 1,
0.3953972, -0.9844741, 2.081323, 0, 0.003921569, 1, 1,
0.396175, -0.8724935, 2.740412, 0.003921569, 0, 1, 1,
0.3968082, -1.422885, 2.036123, 0.007843138, 0, 1, 1,
0.3988118, -0.7980012, 3.385969, 0.01568628, 0, 1, 1,
0.398968, 0.006013648, 2.696313, 0.01960784, 0, 1, 1,
0.3997575, 2.81455, -0.6791813, 0.02745098, 0, 1, 1,
0.4021981, 0.4180808, -1.033655, 0.03137255, 0, 1, 1,
0.4046553, -1.074541, 2.841451, 0.03921569, 0, 1, 1,
0.4089185, 0.1453453, 1.73407, 0.04313726, 0, 1, 1,
0.4092582, 0.4677994, 0.9023756, 0.05098039, 0, 1, 1,
0.4096792, -0.2205176, 2.295705, 0.05490196, 0, 1, 1,
0.4097101, -0.6005691, 1.113872, 0.0627451, 0, 1, 1,
0.4115194, 0.7477704, -1.47618, 0.06666667, 0, 1, 1,
0.4117664, 0.3212296, -0.07451354, 0.07450981, 0, 1, 1,
0.4130926, -2.37351, 2.132457, 0.07843138, 0, 1, 1,
0.414363, -0.7446709, 3.105939, 0.08627451, 0, 1, 1,
0.4163249, 1.481982, 0.2116454, 0.09019608, 0, 1, 1,
0.419527, -1.502561, 3.2287, 0.09803922, 0, 1, 1,
0.4198511, 0.1176164, 2.559354, 0.1058824, 0, 1, 1,
0.4290375, -0.5731434, 1.685678, 0.1098039, 0, 1, 1,
0.4436096, -0.8919413, 1.682371, 0.1176471, 0, 1, 1,
0.4634217, -1.533324, 2.186407, 0.1215686, 0, 1, 1,
0.4669669, -0.3197416, 1.524285, 0.1294118, 0, 1, 1,
0.4675204, -0.3167615, 1.47649, 0.1333333, 0, 1, 1,
0.4696565, 0.6682122, 1.287649, 0.1411765, 0, 1, 1,
0.4713441, -2.027613, 3.670435, 0.145098, 0, 1, 1,
0.4775129, 0.212882, 1.12303, 0.1529412, 0, 1, 1,
0.4791033, 1.683359, 0.2570805, 0.1568628, 0, 1, 1,
0.4799575, -2.066812, 2.395696, 0.1647059, 0, 1, 1,
0.4878362, 1.073702, 0.3705105, 0.1686275, 0, 1, 1,
0.4887767, -0.1301998, 1.102094, 0.1764706, 0, 1, 1,
0.4913013, -0.5518524, 3.264699, 0.1803922, 0, 1, 1,
0.4916917, -0.6514623, 1.849827, 0.1882353, 0, 1, 1,
0.4941549, 0.7776634, 1.250406, 0.1921569, 0, 1, 1,
0.4961714, 1.549603, 0.8573538, 0.2, 0, 1, 1,
0.4979057, -0.8609124, 2.628046, 0.2078431, 0, 1, 1,
0.5020335, -0.3235964, 2.157085, 0.2117647, 0, 1, 1,
0.5052986, 1.846753, -0.7290035, 0.2196078, 0, 1, 1,
0.5115346, 1.768371, 0.2052358, 0.2235294, 0, 1, 1,
0.514379, 0.6861215, 0.6581022, 0.2313726, 0, 1, 1,
0.5190205, 1.579237, 0.1239864, 0.2352941, 0, 1, 1,
0.5206459, -1.167183, 1.97954, 0.2431373, 0, 1, 1,
0.524222, 1.017763, -0.7397593, 0.2470588, 0, 1, 1,
0.5299494, 0.6215219, 1.014538, 0.254902, 0, 1, 1,
0.5309829, 0.9861484, 0.4090689, 0.2588235, 0, 1, 1,
0.5313249, 0.2959193, 1.390121, 0.2666667, 0, 1, 1,
0.5318065, 0.1946842, 0.6100944, 0.2705882, 0, 1, 1,
0.5363731, -0.3379569, 2.234628, 0.2784314, 0, 1, 1,
0.5378928, -0.2068279, 0.7719839, 0.282353, 0, 1, 1,
0.5406793, 0.8645359, 0.2612712, 0.2901961, 0, 1, 1,
0.5479461, 0.6396156, -0.1064806, 0.2941177, 0, 1, 1,
0.5616789, -3.098528, 1.70006, 0.3019608, 0, 1, 1,
0.5631396, -0.1069356, 1.610162, 0.3098039, 0, 1, 1,
0.5656994, 1.4882, 0.8316523, 0.3137255, 0, 1, 1,
0.5684297, -1.514664, 2.403671, 0.3215686, 0, 1, 1,
0.568842, 0.7025607, 0.8162838, 0.3254902, 0, 1, 1,
0.5693114, -0.3907011, 1.47066, 0.3333333, 0, 1, 1,
0.5853663, 0.1172875, -0.8599223, 0.3372549, 0, 1, 1,
0.5867791, 1.086707, 1.479691, 0.345098, 0, 1, 1,
0.5882762, 0.2448633, -0.4976149, 0.3490196, 0, 1, 1,
0.5904556, 2.091761, 1.341842, 0.3568628, 0, 1, 1,
0.5921311, 0.31536, 1.356725, 0.3607843, 0, 1, 1,
0.5941957, -0.04111767, 1.382135, 0.3686275, 0, 1, 1,
0.5947467, 2.50517, 1.065876, 0.372549, 0, 1, 1,
0.6069692, 0.5122557, 0.6454777, 0.3803922, 0, 1, 1,
0.6072134, -0.3098439, 2.909893, 0.3843137, 0, 1, 1,
0.6112763, -0.776938, 0.08520157, 0.3921569, 0, 1, 1,
0.611948, 2.246393, 0.4663517, 0.3960784, 0, 1, 1,
0.6123652, 1.29328, 0.2678645, 0.4039216, 0, 1, 1,
0.6145299, 0.2776772, 1.798039, 0.4117647, 0, 1, 1,
0.6179152, -0.30194, 2.648577, 0.4156863, 0, 1, 1,
0.6221068, 0.7340532, 1.178035, 0.4235294, 0, 1, 1,
0.6254355, 0.03866794, -0.4756676, 0.427451, 0, 1, 1,
0.6308, -0.01448996, 0.7193927, 0.4352941, 0, 1, 1,
0.6310149, -0.3402545, 1.596833, 0.4392157, 0, 1, 1,
0.6313049, 0.1075165, 2.855285, 0.4470588, 0, 1, 1,
0.6324223, 0.6163055, 0.4717491, 0.4509804, 0, 1, 1,
0.6346576, -0.08333376, 1.788728, 0.4588235, 0, 1, 1,
0.6386349, -0.07917885, 2.365868, 0.4627451, 0, 1, 1,
0.6415606, 0.03291781, 1.929338, 0.4705882, 0, 1, 1,
0.6494041, -0.337648, 2.804525, 0.4745098, 0, 1, 1,
0.6541076, 0.8709314, 0.2332799, 0.4823529, 0, 1, 1,
0.6579157, -1.49474, 2.562887, 0.4862745, 0, 1, 1,
0.6648855, 0.1278124, 1.737511, 0.4941176, 0, 1, 1,
0.6696928, -1.51363, 5.084646, 0.5019608, 0, 1, 1,
0.6742488, -1.348375, 3.081729, 0.5058824, 0, 1, 1,
0.6745941, -0.8196715, 2.047155, 0.5137255, 0, 1, 1,
0.6765575, -0.5223121, 1.917856, 0.5176471, 0, 1, 1,
0.6778145, 0.1552116, 2.73172, 0.5254902, 0, 1, 1,
0.6820309, -1.588207, 2.85715, 0.5294118, 0, 1, 1,
0.6826869, -0.60238, 2.563793, 0.5372549, 0, 1, 1,
0.6856542, 0.7436901, 0.6771653, 0.5411765, 0, 1, 1,
0.6972885, -1.228633, 4.750741, 0.5490196, 0, 1, 1,
0.7006334, -0.1045464, 2.907964, 0.5529412, 0, 1, 1,
0.7039026, 0.6340464, 2.978576, 0.5607843, 0, 1, 1,
0.7063548, -1.313639, 4.479407, 0.5647059, 0, 1, 1,
0.715534, -0.3365756, 2.807625, 0.572549, 0, 1, 1,
0.716803, -0.5567657, 3.635388, 0.5764706, 0, 1, 1,
0.7177364, -0.667004, 2.579185, 0.5843138, 0, 1, 1,
0.7203948, -1.070737, 3.001636, 0.5882353, 0, 1, 1,
0.7252443, -0.2149503, 3.162992, 0.5960785, 0, 1, 1,
0.7289309, 1.982806, 0.606541, 0.6039216, 0, 1, 1,
0.7296042, -1.213786, 0.4580508, 0.6078432, 0, 1, 1,
0.7301652, -0.6327885, 2.075591, 0.6156863, 0, 1, 1,
0.7364168, 0.9324746, 1.616053, 0.6196079, 0, 1, 1,
0.7441585, -0.3787306, 0.8255705, 0.627451, 0, 1, 1,
0.7447879, 0.4796391, 0.6670038, 0.6313726, 0, 1, 1,
0.7472029, -1.987509, 3.951038, 0.6392157, 0, 1, 1,
0.7478302, -0.6280149, 3.282963, 0.6431373, 0, 1, 1,
0.7487513, -0.02780693, 2.585052, 0.6509804, 0, 1, 1,
0.7488232, 0.3956756, 1.455216, 0.654902, 0, 1, 1,
0.7515325, 1.07801, 2.04555, 0.6627451, 0, 1, 1,
0.7558655, 0.1505883, 0.8316597, 0.6666667, 0, 1, 1,
0.7622119, -1.527313, 2.689866, 0.6745098, 0, 1, 1,
0.7639135, 1.995615, -0.1237228, 0.6784314, 0, 1, 1,
0.7642256, -0.2229067, 0.5819911, 0.6862745, 0, 1, 1,
0.7671805, -0.9269953, 3.613236, 0.6901961, 0, 1, 1,
0.7681882, 0.4160518, 2.709892, 0.6980392, 0, 1, 1,
0.7689686, -0.2167143, 3.06603, 0.7058824, 0, 1, 1,
0.7766707, 0.1933205, 2.895615, 0.7098039, 0, 1, 1,
0.7821889, -0.04733828, 3.393852, 0.7176471, 0, 1, 1,
0.790228, 0.4207088, 2.576779, 0.7215686, 0, 1, 1,
0.798076, 0.7098022, 1.537745, 0.7294118, 0, 1, 1,
0.8017875, -0.71751, 2.955939, 0.7333333, 0, 1, 1,
0.80433, 0.5051293, 0.5223774, 0.7411765, 0, 1, 1,
0.8051983, -1.847149, 2.493639, 0.7450981, 0, 1, 1,
0.8137158, -0.7071221, 1.912445, 0.7529412, 0, 1, 1,
0.8205882, -2.569437, 4.162071, 0.7568628, 0, 1, 1,
0.8219519, 1.299902, -0.2758366, 0.7647059, 0, 1, 1,
0.8239881, -0.8839753, 3.093461, 0.7686275, 0, 1, 1,
0.8297983, 1.664412, -1.089726, 0.7764706, 0, 1, 1,
0.8331796, -1.188037, 2.518143, 0.7803922, 0, 1, 1,
0.8386415, -0.5199135, 1.172803, 0.7882353, 0, 1, 1,
0.8463142, -0.215757, 0.7554212, 0.7921569, 0, 1, 1,
0.8466671, -0.02060585, 0.5031766, 0.8, 0, 1, 1,
0.860346, 0.9794549, 2.088104, 0.8078431, 0, 1, 1,
0.8608302, -0.3254887, 0.2216276, 0.8117647, 0, 1, 1,
0.8648285, 1.055386, -0.1184627, 0.8196079, 0, 1, 1,
0.8682595, 0.4159239, 2.573133, 0.8235294, 0, 1, 1,
0.8688673, -0.8568221, 2.167747, 0.8313726, 0, 1, 1,
0.8695539, -0.1084775, 2.464018, 0.8352941, 0, 1, 1,
0.8698666, -1.303038, 2.22718, 0.8431373, 0, 1, 1,
0.8726605, 1.761296, 0.8668534, 0.8470588, 0, 1, 1,
0.8744804, -1.686465, 2.016433, 0.854902, 0, 1, 1,
0.8797526, -1.357399, 2.009381, 0.8588235, 0, 1, 1,
0.8801927, -1.700592, 3.483113, 0.8666667, 0, 1, 1,
0.8834789, 1.926304, -1.607108, 0.8705882, 0, 1, 1,
0.8860843, 1.577983, 2.56924, 0.8784314, 0, 1, 1,
0.8874829, 0.4200619, -0.04794271, 0.8823529, 0, 1, 1,
0.8887944, 0.5308911, 1.687222, 0.8901961, 0, 1, 1,
0.8908288, -0.6664115, 0.2014346, 0.8941177, 0, 1, 1,
0.8915457, -0.210187, 0.6090245, 0.9019608, 0, 1, 1,
0.8935518, 0.4956742, 0.8853009, 0.9098039, 0, 1, 1,
0.8972941, 0.6958424, -0.6561697, 0.9137255, 0, 1, 1,
0.9062592, 0.1363778, 2.289249, 0.9215686, 0, 1, 1,
0.9104258, -0.8251427, 1.389327, 0.9254902, 0, 1, 1,
0.9125562, 0.003532526, 0.8223625, 0.9333333, 0, 1, 1,
0.913041, -0.4997897, 3.244436, 0.9372549, 0, 1, 1,
0.9132462, -0.3504835, -0.6940268, 0.945098, 0, 1, 1,
0.9176179, 0.3606177, 1.051718, 0.9490196, 0, 1, 1,
0.918658, -0.6849879, 4.095459, 0.9568627, 0, 1, 1,
0.9217159, -0.6783292, 3.159467, 0.9607843, 0, 1, 1,
0.9334021, -0.8800698, 1.2623, 0.9686275, 0, 1, 1,
0.9410564, 0.3308401, 1.179759, 0.972549, 0, 1, 1,
0.9436994, 1.143795, 0.3779589, 0.9803922, 0, 1, 1,
0.9455448, -2.180554, 1.279711, 0.9843137, 0, 1, 1,
0.963567, -0.05704962, 4.595638, 0.9921569, 0, 1, 1,
0.9657848, 0.4005809, 2.41975, 0.9960784, 0, 1, 1,
0.9674158, -1.670058, 2.67813, 1, 0, 0.9960784, 1,
0.9700888, -1.724574, 4.562326, 1, 0, 0.9882353, 1,
0.9725956, 0.3083527, 0.7512552, 1, 0, 0.9843137, 1,
0.9902099, -1.037489, 1.106868, 1, 0, 0.9764706, 1,
0.9912896, 0.173634, 1.567827, 1, 0, 0.972549, 1,
0.9928816, -0.4824248, 0.9989605, 1, 0, 0.9647059, 1,
1.003998, 1.761764, 0.1039231, 1, 0, 0.9607843, 1,
1.010768, -1.268629, 3.294925, 1, 0, 0.9529412, 1,
1.010869, 0.3047931, 0.4969682, 1, 0, 0.9490196, 1,
1.02134, 0.1446026, 0.4966787, 1, 0, 0.9411765, 1,
1.025824, 1.73684, 0.6628666, 1, 0, 0.9372549, 1,
1.026166, 0.4462424, 0.6752796, 1, 0, 0.9294118, 1,
1.026449, -0.3181003, 2.272499, 1, 0, 0.9254902, 1,
1.034408, 0.5698008, 2.03236, 1, 0, 0.9176471, 1,
1.04001, 0.2115751, 0.2401031, 1, 0, 0.9137255, 1,
1.044384, -0.5658936, 2.842088, 1, 0, 0.9058824, 1,
1.050488, -0.7556697, 2.461897, 1, 0, 0.9019608, 1,
1.05218, 0.4216636, 1.347471, 1, 0, 0.8941177, 1,
1.05238, -0.6070042, 1.294719, 1, 0, 0.8862745, 1,
1.055234, 0.5174011, 1.303598, 1, 0, 0.8823529, 1,
1.06523, 1.375373, 1.058103, 1, 0, 0.8745098, 1,
1.075542, 0.2750992, 1.381686, 1, 0, 0.8705882, 1,
1.088741, -0.9049429, 0.5704678, 1, 0, 0.8627451, 1,
1.089658, 0.814717, 1.693236, 1, 0, 0.8588235, 1,
1.090651, 0.4029998, 2.190499, 1, 0, 0.8509804, 1,
1.091801, -1.35975, 1.672351, 1, 0, 0.8470588, 1,
1.093138, 0.2829668, 2.787549, 1, 0, 0.8392157, 1,
1.093588, -0.1925018, 3.339108, 1, 0, 0.8352941, 1,
1.096491, 0.780291, 1.359814, 1, 0, 0.827451, 1,
1.101691, 1.38457, 2.734971, 1, 0, 0.8235294, 1,
1.102541, -0.02742358, 1.328399, 1, 0, 0.8156863, 1,
1.106718, -1.997762, 2.12557, 1, 0, 0.8117647, 1,
1.107985, 1.495115, 0.05592262, 1, 0, 0.8039216, 1,
1.119312, -0.6109137, 0.5922793, 1, 0, 0.7960784, 1,
1.119824, 0.2160757, 1.104595, 1, 0, 0.7921569, 1,
1.123793, -0.1380337, 0.4524799, 1, 0, 0.7843137, 1,
1.123917, -0.593915, 3.751205, 1, 0, 0.7803922, 1,
1.124021, 1.143808, 0.5553633, 1, 0, 0.772549, 1,
1.129582, -0.1286587, 1.896878, 1, 0, 0.7686275, 1,
1.132455, 1.260992, 1.157041, 1, 0, 0.7607843, 1,
1.138466, 0.02083503, 1.205057, 1, 0, 0.7568628, 1,
1.140134, -0.6615085, 4.149985, 1, 0, 0.7490196, 1,
1.148664, 0.1245001, 2.415222, 1, 0, 0.7450981, 1,
1.150814, -0.07921018, 3.713155, 1, 0, 0.7372549, 1,
1.157262, 0.3367362, 2.344644, 1, 0, 0.7333333, 1,
1.157786, -1.393996, 0.07387805, 1, 0, 0.7254902, 1,
1.165921, 0.2112143, 1.330949, 1, 0, 0.7215686, 1,
1.170545, 0.6164351, 1.745109, 1, 0, 0.7137255, 1,
1.180759, 1.67307, 1.685297, 1, 0, 0.7098039, 1,
1.183832, -1.286307, 1.177543, 1, 0, 0.7019608, 1,
1.194459, 0.3418397, 0.4116396, 1, 0, 0.6941177, 1,
1.198565, 0.5725214, -0.3236852, 1, 0, 0.6901961, 1,
1.198779, 2.750173, 0.866837, 1, 0, 0.682353, 1,
1.210925, -0.4834116, 1.757344, 1, 0, 0.6784314, 1,
1.215861, 0.7051651, 0.849665, 1, 0, 0.6705883, 1,
1.234015, -0.1417021, 0.8473296, 1, 0, 0.6666667, 1,
1.234796, -0.9704317, 2.020347, 1, 0, 0.6588235, 1,
1.244752, 1.62716, -0.4643734, 1, 0, 0.654902, 1,
1.252138, 1.015765, -0.1193164, 1, 0, 0.6470588, 1,
1.272039, 0.7054095, 1.059442, 1, 0, 0.6431373, 1,
1.284753, 0.8536578, 0.3325019, 1, 0, 0.6352941, 1,
1.294114, -0.8526804, 1.21798, 1, 0, 0.6313726, 1,
1.296281, 0.3666188, -0.001849482, 1, 0, 0.6235294, 1,
1.296327, 0.1411621, -0.553817, 1, 0, 0.6196079, 1,
1.296704, 0.4911849, 1.774079, 1, 0, 0.6117647, 1,
1.300807, -1.327159, 3.145894, 1, 0, 0.6078432, 1,
1.303713, 0.3596807, -0.2799881, 1, 0, 0.6, 1,
1.311858, 0.9297465, 0.1187376, 1, 0, 0.5921569, 1,
1.313781, 0.7796166, 1.755553, 1, 0, 0.5882353, 1,
1.32717, 0.1454024, -0.753334, 1, 0, 0.5803922, 1,
1.330129, 0.7059838, 0.7692515, 1, 0, 0.5764706, 1,
1.334163, 1.050067, 0.7065958, 1, 0, 0.5686275, 1,
1.350653, 1.670742, 1.608813, 1, 0, 0.5647059, 1,
1.351842, 0.8718429, 2.005427, 1, 0, 0.5568628, 1,
1.358604, -0.9643874, 2.631084, 1, 0, 0.5529412, 1,
1.362335, 0.00505901, 1.094617, 1, 0, 0.5450981, 1,
1.363637, -0.5259024, 2.276521, 1, 0, 0.5411765, 1,
1.371101, 1.338364, 1.268189, 1, 0, 0.5333334, 1,
1.372657, -0.5610148, 1.004005, 1, 0, 0.5294118, 1,
1.376239, -0.490445, 2.526933, 1, 0, 0.5215687, 1,
1.378032, 0.518198, 1.231386, 1, 0, 0.5176471, 1,
1.390224, 0.3460507, 2.834475, 1, 0, 0.509804, 1,
1.392757, 0.6675666, 3.777236, 1, 0, 0.5058824, 1,
1.398218, 0.5685976, 0.08885448, 1, 0, 0.4980392, 1,
1.403058, -1.36954, 2.308502, 1, 0, 0.4901961, 1,
1.40476, -0.7532541, 0.7686666, 1, 0, 0.4862745, 1,
1.420725, 1.371527, -0.6641675, 1, 0, 0.4784314, 1,
1.439285, -1.622162, 3.071073, 1, 0, 0.4745098, 1,
1.439565, 1.399553, 0.3988781, 1, 0, 0.4666667, 1,
1.447331, -0.8068178, 1.636844, 1, 0, 0.4627451, 1,
1.452058, -0.2941454, 1.308702, 1, 0, 0.454902, 1,
1.478038, 1.6683, 0.6942085, 1, 0, 0.4509804, 1,
1.484981, 0.7052449, 0.5539225, 1, 0, 0.4431373, 1,
1.485047, 0.7883724, 0.2714836, 1, 0, 0.4392157, 1,
1.485426, 0.936707, 0.834212, 1, 0, 0.4313726, 1,
1.4891, 0.2171725, 2.803389, 1, 0, 0.427451, 1,
1.513804, -0.6907322, 1.100273, 1, 0, 0.4196078, 1,
1.520671, 1.932324, 2.063293, 1, 0, 0.4156863, 1,
1.532802, 0.6855505, 3.008158, 1, 0, 0.4078431, 1,
1.533839, 0.2084073, 1.335366, 1, 0, 0.4039216, 1,
1.537122, -1.057784, 2.495978, 1, 0, 0.3960784, 1,
1.537183, -0.509435, 3.403079, 1, 0, 0.3882353, 1,
1.541028, 0.326208, 0.7211813, 1, 0, 0.3843137, 1,
1.558205, -0.885141, 2.622656, 1, 0, 0.3764706, 1,
1.558869, -0.4481378, 0.4110147, 1, 0, 0.372549, 1,
1.560339, 1.681328, 0.8440793, 1, 0, 0.3647059, 1,
1.560692, 2.241013, 0.7323664, 1, 0, 0.3607843, 1,
1.566981, -1.482313, 3.173121, 1, 0, 0.3529412, 1,
1.568706, -0.1421941, 0.3047917, 1, 0, 0.3490196, 1,
1.569046, 1.391394, 1.913526, 1, 0, 0.3411765, 1,
1.569581, 0.5274773, 1.324776, 1, 0, 0.3372549, 1,
1.580382, 1.350737, 1.285736, 1, 0, 0.3294118, 1,
1.594033, -0.6927408, 1.414501, 1, 0, 0.3254902, 1,
1.629048, 1.843221, 1.803534, 1, 0, 0.3176471, 1,
1.633181, 1.641386, 1.391274, 1, 0, 0.3137255, 1,
1.635019, -0.132436, 1.419592, 1, 0, 0.3058824, 1,
1.636614, 0.5228958, 1.484547, 1, 0, 0.2980392, 1,
1.643693, 0.5495926, 2.321057, 1, 0, 0.2941177, 1,
1.653868, -0.5142056, 2.025125, 1, 0, 0.2862745, 1,
1.670304, -0.04986282, 1.934413, 1, 0, 0.282353, 1,
1.672955, 0.4383486, 1.966207, 1, 0, 0.2745098, 1,
1.692004, 0.9200669, 1.054709, 1, 0, 0.2705882, 1,
1.696611, -0.4823081, 1.186985, 1, 0, 0.2627451, 1,
1.699396, 1.996152, 1.447365, 1, 0, 0.2588235, 1,
1.740742, 3.146911, 0.3477089, 1, 0, 0.2509804, 1,
1.751144, 0.5802231, -0.9177608, 1, 0, 0.2470588, 1,
1.759063, 0.3238288, 1.238804, 1, 0, 0.2392157, 1,
1.761209, 0.2481015, 0.1563027, 1, 0, 0.2352941, 1,
1.762444, 1.497264, 1.522591, 1, 0, 0.227451, 1,
1.793003, 0.4595778, 1.034652, 1, 0, 0.2235294, 1,
1.797011, 0.2709278, 1.479817, 1, 0, 0.2156863, 1,
1.83386, 2.458698, 0.383905, 1, 0, 0.2117647, 1,
1.873475, -0.4833997, 2.079944, 1, 0, 0.2039216, 1,
1.88849, -0.5871739, 0.1934793, 1, 0, 0.1960784, 1,
1.911087, 0.1224274, 1.135023, 1, 0, 0.1921569, 1,
1.967627, 0.02764886, 2.118097, 1, 0, 0.1843137, 1,
1.96801, -1.43954, 3.014474, 1, 0, 0.1803922, 1,
1.969289, 1.707775, 1.911089, 1, 0, 0.172549, 1,
1.974894, -1.163245, 1.796903, 1, 0, 0.1686275, 1,
2.016001, -0.3850291, 1.15252, 1, 0, 0.1607843, 1,
2.039701, 1.185908, 1.229489, 1, 0, 0.1568628, 1,
2.041092, -1.803533, 1.311223, 1, 0, 0.1490196, 1,
2.073073, 1.707741, -0.2062317, 1, 0, 0.145098, 1,
2.081652, -0.839259, 2.922665, 1, 0, 0.1372549, 1,
2.094538, 0.6159305, 2.35458, 1, 0, 0.1333333, 1,
2.123896, -0.1969133, 2.121799, 1, 0, 0.1254902, 1,
2.143317, 0.6085529, 0.3373241, 1, 0, 0.1215686, 1,
2.144712, -0.3947153, 2.342412, 1, 0, 0.1137255, 1,
2.173115, -0.540689, 1.74031, 1, 0, 0.1098039, 1,
2.184103, -0.6631147, 2.499788, 1, 0, 0.1019608, 1,
2.188628, -0.1988722, 1.725364, 1, 0, 0.09411765, 1,
2.193227, 0.8280184, 2.985465, 1, 0, 0.09019608, 1,
2.227841, 1.395477, 1.599306, 1, 0, 0.08235294, 1,
2.228809, 0.6973483, 0.1610272, 1, 0, 0.07843138, 1,
2.229095, 0.2283993, 0.6474901, 1, 0, 0.07058824, 1,
2.295846, -1.545737, 1.633954, 1, 0, 0.06666667, 1,
2.332175, -0.7389967, 1.673292, 1, 0, 0.05882353, 1,
2.363039, 0.5429435, 1.169783, 1, 0, 0.05490196, 1,
2.431343, -0.3498991, 1.559451, 1, 0, 0.04705882, 1,
2.477445, -1.743632, 1.933311, 1, 0, 0.04313726, 1,
2.485178, 0.21502, 0.9154808, 1, 0, 0.03529412, 1,
2.554652, -0.4055781, 0.8416294, 1, 0, 0.03137255, 1,
2.573602, 0.7161746, 1.152335, 1, 0, 0.02352941, 1,
2.63883, -0.5432137, 0.9657969, 1, 0, 0.01960784, 1,
3.066238, 0.1365541, -1.073474, 1, 0, 0.01176471, 1,
3.419454, -0.7975212, 2.133759, 1, 0, 0.007843138, 1
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
0.26457, -4.196039, -7.901857, 0, -0.5, 0.5, 0.5,
0.26457, -4.196039, -7.901857, 1, -0.5, 0.5, 0.5,
0.26457, -4.196039, -7.901857, 1, 1.5, 0.5, 0.5,
0.26457, -4.196039, -7.901857, 0, 1.5, 0.5, 0.5
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
-3.95982, 0.1389664, -7.901857, 0, -0.5, 0.5, 0.5,
-3.95982, 0.1389664, -7.901857, 1, -0.5, 0.5, 0.5,
-3.95982, 0.1389664, -7.901857, 1, 1.5, 0.5, 0.5,
-3.95982, 0.1389664, -7.901857, 0, 1.5, 0.5, 0.5
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
-3.95982, -4.196039, -0.3191276, 0, -0.5, 0.5, 0.5,
-3.95982, -4.196039, -0.3191276, 1, -0.5, 0.5, 0.5,
-3.95982, -4.196039, -0.3191276, 1, 1.5, 0.5, 0.5,
-3.95982, -4.196039, -0.3191276, 0, 1.5, 0.5, 0.5
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
-2, -3.195653, -6.151997,
3, -3.195653, -6.151997,
-2, -3.195653, -6.151997,
-2, -3.362384, -6.44364,
-1, -3.195653, -6.151997,
-1, -3.362384, -6.44364,
0, -3.195653, -6.151997,
0, -3.362384, -6.44364,
1, -3.195653, -6.151997,
1, -3.362384, -6.44364,
2, -3.195653, -6.151997,
2, -3.362384, -6.44364,
3, -3.195653, -6.151997,
3, -3.362384, -6.44364
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
-2, -3.695846, -7.026927, 0, -0.5, 0.5, 0.5,
-2, -3.695846, -7.026927, 1, -0.5, 0.5, 0.5,
-2, -3.695846, -7.026927, 1, 1.5, 0.5, 0.5,
-2, -3.695846, -7.026927, 0, 1.5, 0.5, 0.5,
-1, -3.695846, -7.026927, 0, -0.5, 0.5, 0.5,
-1, -3.695846, -7.026927, 1, -0.5, 0.5, 0.5,
-1, -3.695846, -7.026927, 1, 1.5, 0.5, 0.5,
-1, -3.695846, -7.026927, 0, 1.5, 0.5, 0.5,
0, -3.695846, -7.026927, 0, -0.5, 0.5, 0.5,
0, -3.695846, -7.026927, 1, -0.5, 0.5, 0.5,
0, -3.695846, -7.026927, 1, 1.5, 0.5, 0.5,
0, -3.695846, -7.026927, 0, 1.5, 0.5, 0.5,
1, -3.695846, -7.026927, 0, -0.5, 0.5, 0.5,
1, -3.695846, -7.026927, 1, -0.5, 0.5, 0.5,
1, -3.695846, -7.026927, 1, 1.5, 0.5, 0.5,
1, -3.695846, -7.026927, 0, 1.5, 0.5, 0.5,
2, -3.695846, -7.026927, 0, -0.5, 0.5, 0.5,
2, -3.695846, -7.026927, 1, -0.5, 0.5, 0.5,
2, -3.695846, -7.026927, 1, 1.5, 0.5, 0.5,
2, -3.695846, -7.026927, 0, 1.5, 0.5, 0.5,
3, -3.695846, -7.026927, 0, -0.5, 0.5, 0.5,
3, -3.695846, -7.026927, 1, -0.5, 0.5, 0.5,
3, -3.695846, -7.026927, 1, 1.5, 0.5, 0.5,
3, -3.695846, -7.026927, 0, 1.5, 0.5, 0.5
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
-2.984961, -3, -6.151997,
-2.984961, 3, -6.151997,
-2.984961, -3, -6.151997,
-3.147437, -3, -6.44364,
-2.984961, -2, -6.151997,
-3.147437, -2, -6.44364,
-2.984961, -1, -6.151997,
-3.147437, -1, -6.44364,
-2.984961, 0, -6.151997,
-3.147437, 0, -6.44364,
-2.984961, 1, -6.151997,
-3.147437, 1, -6.44364,
-2.984961, 2, -6.151997,
-3.147437, 2, -6.44364,
-2.984961, 3, -6.151997,
-3.147437, 3, -6.44364
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
-3.47239, -3, -7.026927, 0, -0.5, 0.5, 0.5,
-3.47239, -3, -7.026927, 1, -0.5, 0.5, 0.5,
-3.47239, -3, -7.026927, 1, 1.5, 0.5, 0.5,
-3.47239, -3, -7.026927, 0, 1.5, 0.5, 0.5,
-3.47239, -2, -7.026927, 0, -0.5, 0.5, 0.5,
-3.47239, -2, -7.026927, 1, -0.5, 0.5, 0.5,
-3.47239, -2, -7.026927, 1, 1.5, 0.5, 0.5,
-3.47239, -2, -7.026927, 0, 1.5, 0.5, 0.5,
-3.47239, -1, -7.026927, 0, -0.5, 0.5, 0.5,
-3.47239, -1, -7.026927, 1, -0.5, 0.5, 0.5,
-3.47239, -1, -7.026927, 1, 1.5, 0.5, 0.5,
-3.47239, -1, -7.026927, 0, 1.5, 0.5, 0.5,
-3.47239, 0, -7.026927, 0, -0.5, 0.5, 0.5,
-3.47239, 0, -7.026927, 1, -0.5, 0.5, 0.5,
-3.47239, 0, -7.026927, 1, 1.5, 0.5, 0.5,
-3.47239, 0, -7.026927, 0, 1.5, 0.5, 0.5,
-3.47239, 1, -7.026927, 0, -0.5, 0.5, 0.5,
-3.47239, 1, -7.026927, 1, -0.5, 0.5, 0.5,
-3.47239, 1, -7.026927, 1, 1.5, 0.5, 0.5,
-3.47239, 1, -7.026927, 0, 1.5, 0.5, 0.5,
-3.47239, 2, -7.026927, 0, -0.5, 0.5, 0.5,
-3.47239, 2, -7.026927, 1, -0.5, 0.5, 0.5,
-3.47239, 2, -7.026927, 1, 1.5, 0.5, 0.5,
-3.47239, 2, -7.026927, 0, 1.5, 0.5, 0.5,
-3.47239, 3, -7.026927, 0, -0.5, 0.5, 0.5,
-3.47239, 3, -7.026927, 1, -0.5, 0.5, 0.5,
-3.47239, 3, -7.026927, 1, 1.5, 0.5, 0.5,
-3.47239, 3, -7.026927, 0, 1.5, 0.5, 0.5
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
-2.984961, -3.195653, -4,
-2.984961, -3.195653, 4,
-2.984961, -3.195653, -4,
-3.147437, -3.362384, -4,
-2.984961, -3.195653, -2,
-3.147437, -3.362384, -2,
-2.984961, -3.195653, 0,
-3.147437, -3.362384, 0,
-2.984961, -3.195653, 2,
-3.147437, -3.362384, 2,
-2.984961, -3.195653, 4,
-3.147437, -3.362384, 4
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
-3.47239, -3.695846, -4, 0, -0.5, 0.5, 0.5,
-3.47239, -3.695846, -4, 1, -0.5, 0.5, 0.5,
-3.47239, -3.695846, -4, 1, 1.5, 0.5, 0.5,
-3.47239, -3.695846, -4, 0, 1.5, 0.5, 0.5,
-3.47239, -3.695846, -2, 0, -0.5, 0.5, 0.5,
-3.47239, -3.695846, -2, 1, -0.5, 0.5, 0.5,
-3.47239, -3.695846, -2, 1, 1.5, 0.5, 0.5,
-3.47239, -3.695846, -2, 0, 1.5, 0.5, 0.5,
-3.47239, -3.695846, 0, 0, -0.5, 0.5, 0.5,
-3.47239, -3.695846, 0, 1, -0.5, 0.5, 0.5,
-3.47239, -3.695846, 0, 1, 1.5, 0.5, 0.5,
-3.47239, -3.695846, 0, 0, 1.5, 0.5, 0.5,
-3.47239, -3.695846, 2, 0, -0.5, 0.5, 0.5,
-3.47239, -3.695846, 2, 1, -0.5, 0.5, 0.5,
-3.47239, -3.695846, 2, 1, 1.5, 0.5, 0.5,
-3.47239, -3.695846, 2, 0, 1.5, 0.5, 0.5,
-3.47239, -3.695846, 4, 0, -0.5, 0.5, 0.5,
-3.47239, -3.695846, 4, 1, -0.5, 0.5, 0.5,
-3.47239, -3.695846, 4, 1, 1.5, 0.5, 0.5,
-3.47239, -3.695846, 4, 0, 1.5, 0.5, 0.5
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
-2.984961, -3.195653, -6.151997,
-2.984961, 3.473586, -6.151997,
-2.984961, -3.195653, 5.513741,
-2.984961, 3.473586, 5.513741,
-2.984961, -3.195653, -6.151997,
-2.984961, -3.195653, 5.513741,
-2.984961, 3.473586, -6.151997,
-2.984961, 3.473586, 5.513741,
-2.984961, -3.195653, -6.151997,
3.514101, -3.195653, -6.151997,
-2.984961, -3.195653, 5.513741,
3.514101, -3.195653, 5.513741,
-2.984961, 3.473586, -6.151997,
3.514101, 3.473586, -6.151997,
-2.984961, 3.473586, 5.513741,
3.514101, 3.473586, 5.513741,
3.514101, -3.195653, -6.151997,
3.514101, 3.473586, -6.151997,
3.514101, -3.195653, 5.513741,
3.514101, 3.473586, 5.513741,
3.514101, -3.195653, -6.151997,
3.514101, -3.195653, 5.513741,
3.514101, 3.473586, -6.151997,
3.514101, 3.473586, 5.513741
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
var radius = 7.970561;
var distance = 35.46193;
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
mvMatrix.translate( -0.26457, -0.1389664, 0.3191276 );
mvMatrix.scale( 1.326026, 1.29219, 0.7387382 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.46193);
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
cyclopropane-1-carbo<-read.table("cyclopropane-1-carbo.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-cyclopropane-1-carbo$V2
```

```
## Error in eval(expr, envir, enclos): object 'cyclopropane' not found
```

```r
y<-cyclopropane-1-carbo$V3
```

```
## Error in eval(expr, envir, enclos): object 'cyclopropane' not found
```

```r
z<-cyclopropane-1-carbo$V4
```

```
## Error in eval(expr, envir, enclos): object 'cyclopropane' not found
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
-2.890314, 0.7918113, -1.682223, 0, 0, 1, 1, 1,
-2.636122, -1.842627, -2.667723, 1, 0, 0, 1, 1,
-2.624965, 0.2750404, -1.817211, 1, 0, 0, 1, 1,
-2.558859, -0.6792287, -2.614386, 1, 0, 0, 1, 1,
-2.466196, -2.33398, -3.432695, 1, 0, 0, 1, 1,
-2.460239, -0.6458724, -1.249251, 1, 0, 0, 1, 1,
-2.444104, -0.00111828, -2.455936, 0, 0, 0, 1, 1,
-2.443496, -0.4936122, -1.949256, 0, 0, 0, 1, 1,
-2.442469, 0.7561387, 0.1688328, 0, 0, 0, 1, 1,
-2.36271, 1.231812, -1.142883, 0, 0, 0, 1, 1,
-2.344596, 0.3034914, -1.343362, 0, 0, 0, 1, 1,
-2.210534, 0.8465997, -0.6590999, 0, 0, 0, 1, 1,
-2.163503, 1.670071, -1.396563, 0, 0, 0, 1, 1,
-2.131693, 0.1905222, -2.649979, 1, 1, 1, 1, 1,
-2.107663, -0.6427764, -2.132066, 1, 1, 1, 1, 1,
-2.097944, -0.711875, -3.154628, 1, 1, 1, 1, 1,
-2.092456, 2.060475, -2.490697, 1, 1, 1, 1, 1,
-2.077885, -1.832239, -3.165573, 1, 1, 1, 1, 1,
-2.063983, -1.103212, -2.538275, 1, 1, 1, 1, 1,
-2.054034, -0.07678204, -2.45354, 1, 1, 1, 1, 1,
-2.040756, 0.5687205, -2.959975, 1, 1, 1, 1, 1,
-2.028881, 0.9777124, -0.262045, 1, 1, 1, 1, 1,
-1.963856, 1.589142, 0.5268362, 1, 1, 1, 1, 1,
-1.96348, -1.345763, -2.854558, 1, 1, 1, 1, 1,
-1.962386, 1.492937, -0.8952098, 1, 1, 1, 1, 1,
-1.949726, -0.9369081, -2.331256, 1, 1, 1, 1, 1,
-1.896515, -0.563273, 0.08742959, 1, 1, 1, 1, 1,
-1.895198, 1.786898, -0.6547454, 1, 1, 1, 1, 1,
-1.888752, -0.3195645, -2.27501, 0, 0, 1, 1, 1,
-1.887376, 1.312395, 0.2402126, 1, 0, 0, 1, 1,
-1.861222, -1.153659, -1.527522, 1, 0, 0, 1, 1,
-1.832996, -0.82587, -1.288917, 1, 0, 0, 1, 1,
-1.822958, -1.130632, -1.73699, 1, 0, 0, 1, 1,
-1.805738, -0.9886601, -1.734316, 1, 0, 0, 1, 1,
-1.789399, -0.1094013, -0.388451, 0, 0, 0, 1, 1,
-1.788764, 1.461781, -1.288767, 0, 0, 0, 1, 1,
-1.784124, 1.058697, -1.970255, 0, 0, 0, 1, 1,
-1.776069, -0.9595256, -0.2682083, 0, 0, 0, 1, 1,
-1.773588, 0.07578569, -2.217482, 0, 0, 0, 1, 1,
-1.740061, -0.2770219, -1.936544, 0, 0, 0, 1, 1,
-1.73449, 1.226785, -1.965063, 0, 0, 0, 1, 1,
-1.726109, 1.857886, -1.609407, 1, 1, 1, 1, 1,
-1.722017, -0.1799647, -3.587389, 1, 1, 1, 1, 1,
-1.716777, -0.3235044, -0.5128651, 1, 1, 1, 1, 1,
-1.714702, 1.582269, -0.477551, 1, 1, 1, 1, 1,
-1.711404, 0.6940572, -2.604815, 1, 1, 1, 1, 1,
-1.710163, -0.443708, -3.477577, 1, 1, 1, 1, 1,
-1.703305, -1.16954, -2.789099, 1, 1, 1, 1, 1,
-1.683398, 0.1904407, 0.9062073, 1, 1, 1, 1, 1,
-1.677161, -0.5925283, -1.571296, 1, 1, 1, 1, 1,
-1.668477, 1.234519, -1.443291, 1, 1, 1, 1, 1,
-1.666776, 0.9211475, 0.800743, 1, 1, 1, 1, 1,
-1.665145, 0.1254229, -1.463647, 1, 1, 1, 1, 1,
-1.655553, 0.661644, -1.164708, 1, 1, 1, 1, 1,
-1.653671, 0.9227282, -1.527229, 1, 1, 1, 1, 1,
-1.646204, 1.935021, -1.593066, 1, 1, 1, 1, 1,
-1.63642, 0.2341063, -1.891821, 0, 0, 1, 1, 1,
-1.634989, 0.5171899, -0.3820076, 1, 0, 0, 1, 1,
-1.615776, -0.8455625, -2.203673, 1, 0, 0, 1, 1,
-1.613553, -0.2772459, -1.145286, 1, 0, 0, 1, 1,
-1.601641, -0.2933421, -1.905441, 1, 0, 0, 1, 1,
-1.599642, -0.7831181, -2.066582, 1, 0, 0, 1, 1,
-1.599419, -0.3569348, -1.446527, 0, 0, 0, 1, 1,
-1.589623, -2.056795, -1.835627, 0, 0, 0, 1, 1,
-1.580531, 2.359559, -0.7675191, 0, 0, 0, 1, 1,
-1.574263, 0.4375958, -1.60212, 0, 0, 0, 1, 1,
-1.563943, 0.8918021, -1.203795, 0, 0, 0, 1, 1,
-1.548057, 0.3121437, -0.9507043, 0, 0, 0, 1, 1,
-1.542079, 0.3147939, -1.66777, 0, 0, 0, 1, 1,
-1.532966, 1.723773, -0.6502246, 1, 1, 1, 1, 1,
-1.521999, -0.9498883, -0.6460152, 1, 1, 1, 1, 1,
-1.521107, -0.8313138, -2.038119, 1, 1, 1, 1, 1,
-1.514937, -0.318101, -0.5111238, 1, 1, 1, 1, 1,
-1.514647, -0.5155172, -2.043354, 1, 1, 1, 1, 1,
-1.508369, 0.07247126, -1.030451, 1, 1, 1, 1, 1,
-1.502867, -0.3562559, -3.758038, 1, 1, 1, 1, 1,
-1.49763, 0.03182726, -1.787692, 1, 1, 1, 1, 1,
-1.490119, -1.215161, -1.968167, 1, 1, 1, 1, 1,
-1.475907, 0.1406507, -1.678064, 1, 1, 1, 1, 1,
-1.473827, 0.5331959, -1.381669, 1, 1, 1, 1, 1,
-1.466214, -0.1203874, -3.080978, 1, 1, 1, 1, 1,
-1.453294, 0.7465757, 0.8274221, 1, 1, 1, 1, 1,
-1.453202, -0.0828983, -0.9606292, 1, 1, 1, 1, 1,
-1.449695, 0.4473564, -0.8704337, 1, 1, 1, 1, 1,
-1.446131, 0.8673558, -0.9733444, 0, 0, 1, 1, 1,
-1.441838, -1.656638, -2.57237, 1, 0, 0, 1, 1,
-1.432602, -0.2962597, -0.8689485, 1, 0, 0, 1, 1,
-1.428985, 0.165508, -2.172448, 1, 0, 0, 1, 1,
-1.41324, -0.7522811, -2.204656, 1, 0, 0, 1, 1,
-1.40442, 0.2707322, -0.3674616, 1, 0, 0, 1, 1,
-1.401894, 1.516781, -1.207109, 0, 0, 0, 1, 1,
-1.395647, 1.010335, -1.11068, 0, 0, 0, 1, 1,
-1.391784, -0.9207864, -2.774182, 0, 0, 0, 1, 1,
-1.389255, -0.2164283, -2.310687, 0, 0, 0, 1, 1,
-1.388061, -1.108313, -2.023147, 0, 0, 0, 1, 1,
-1.373732, 1.509191, -0.8107268, 0, 0, 0, 1, 1,
-1.371118, 0.3864229, -2.298818, 0, 0, 0, 1, 1,
-1.356156, 1.141126, -0.5055709, 1, 1, 1, 1, 1,
-1.355616, -0.6644252, -1.561094, 1, 1, 1, 1, 1,
-1.329618, 0.4233043, -0.6991571, 1, 1, 1, 1, 1,
-1.327872, 0.6362699, -3.018363, 1, 1, 1, 1, 1,
-1.319042, 2.375287, -0.3456906, 1, 1, 1, 1, 1,
-1.314455, 1.04093, -0.8945484, 1, 1, 1, 1, 1,
-1.30569, 0.8550891, -2.473481, 1, 1, 1, 1, 1,
-1.30319, 1.117944, -0.9448347, 1, 1, 1, 1, 1,
-1.298311, 1.91088, -1.871946, 1, 1, 1, 1, 1,
-1.285634, 0.4572265, -2.434237, 1, 1, 1, 1, 1,
-1.28077, 0.4411528, -0.09789129, 1, 1, 1, 1, 1,
-1.278036, -0.1023279, -3.350799, 1, 1, 1, 1, 1,
-1.277546, 0.4234557, -1.762474, 1, 1, 1, 1, 1,
-1.274757, -1.79843, -2.168276, 1, 1, 1, 1, 1,
-1.273095, -0.1252653, -2.452254, 1, 1, 1, 1, 1,
-1.265963, 0.6499421, -0.1461259, 0, 0, 1, 1, 1,
-1.260619, -0.4900303, -1.639541, 1, 0, 0, 1, 1,
-1.258179, 0.2713018, -1.528911, 1, 0, 0, 1, 1,
-1.243106, -0.3645157, -2.516012, 1, 0, 0, 1, 1,
-1.241068, -0.5338581, -1.712944, 1, 0, 0, 1, 1,
-1.227116, 0.9742566, 0.2002362, 1, 0, 0, 1, 1,
-1.215998, -0.4908739, -2.010889, 0, 0, 0, 1, 1,
-1.209641, 1.148975, -0.1473584, 0, 0, 0, 1, 1,
-1.204589, -0.578273, -1.897273, 0, 0, 0, 1, 1,
-1.204047, 0.235384, -1.349169, 0, 0, 0, 1, 1,
-1.173142, -1.049788, -2.521698, 0, 0, 0, 1, 1,
-1.159733, -0.3008738, -2.826682, 0, 0, 0, 1, 1,
-1.151704, -1.143876, -2.290636, 0, 0, 0, 1, 1,
-1.149624, -0.2510313, -0.07129444, 1, 1, 1, 1, 1,
-1.145509, 1.380264, 0.2809545, 1, 1, 1, 1, 1,
-1.138666, -0.7073343, -4.063899, 1, 1, 1, 1, 1,
-1.13751, 0.7110484, -1.749989, 1, 1, 1, 1, 1,
-1.137287, 1.356232, -0.6039014, 1, 1, 1, 1, 1,
-1.137028, -0.3867755, -0.9522778, 1, 1, 1, 1, 1,
-1.125553, -1.076017, -2.334188, 1, 1, 1, 1, 1,
-1.124181, 0.5073597, -0.7748415, 1, 1, 1, 1, 1,
-1.114761, 0.8406529, 0.3141193, 1, 1, 1, 1, 1,
-1.11304, -0.6690775, -1.42471, 1, 1, 1, 1, 1,
-1.110006, -0.08029709, -1.229316, 1, 1, 1, 1, 1,
-1.104374, -0.3123046, -1.813884, 1, 1, 1, 1, 1,
-1.104164, -0.591132, -0.829473, 1, 1, 1, 1, 1,
-1.096074, -0.4654915, -1.92387, 1, 1, 1, 1, 1,
-1.09071, 0.2740716, -1.776876, 1, 1, 1, 1, 1,
-1.081775, 0.0533139, -3.76554, 0, 0, 1, 1, 1,
-1.080507, -0.02683865, -0.9582225, 1, 0, 0, 1, 1,
-1.072317, 0.2752464, -2.016974, 1, 0, 0, 1, 1,
-1.058976, -0.9148211, -1.33497, 1, 0, 0, 1, 1,
-1.05681, 1.662039, -0.3869282, 1, 0, 0, 1, 1,
-1.053473, 0.2568775, 0.6501523, 1, 0, 0, 1, 1,
-1.053249, -0.7387512, -2.091424, 0, 0, 0, 1, 1,
-1.052776, 1.352977, -1.773823, 0, 0, 0, 1, 1,
-1.050375, 0.9503493, -1.574282, 0, 0, 0, 1, 1,
-1.047414, 0.7652413, 0.2393217, 0, 0, 0, 1, 1,
-1.044402, -1.86069, -2.357487, 0, 0, 0, 1, 1,
-1.041732, 0.2213621, -0.4501661, 0, 0, 0, 1, 1,
-1.037249, -0.3223407, -2.20203, 0, 0, 0, 1, 1,
-1.037112, -0.5528712, -1.482805, 1, 1, 1, 1, 1,
-1.03706, -0.7120352, -3.261779, 1, 1, 1, 1, 1,
-1.032908, 0.09381905, -1.044995, 1, 1, 1, 1, 1,
-1.029879, -0.07218374, -0.8367311, 1, 1, 1, 1, 1,
-1.02868, 0.3835502, -0.5038698, 1, 1, 1, 1, 1,
-1.021111, -0.1549294, -2.329215, 1, 1, 1, 1, 1,
-1.01111, -1.927705, -3.007898, 1, 1, 1, 1, 1,
-0.9995081, 0.5318782, -0.1612257, 1, 1, 1, 1, 1,
-0.9983094, -1.149401, -2.937978, 1, 1, 1, 1, 1,
-0.9907761, 0.4520808, -2.821373, 1, 1, 1, 1, 1,
-0.9906942, -0.0920694, 1.000862, 1, 1, 1, 1, 1,
-0.9886246, 0.09739055, -0.8658239, 1, 1, 1, 1, 1,
-0.9883565, -0.8042569, -1.523279, 1, 1, 1, 1, 1,
-0.9876989, 1.59094, -0.129124, 1, 1, 1, 1, 1,
-0.9802094, 0.7119144, -1.242072, 1, 1, 1, 1, 1,
-0.9705903, 1.240134, -1.246269, 0, 0, 1, 1, 1,
-0.9501817, -1.076595, -1.474134, 1, 0, 0, 1, 1,
-0.9465831, 0.09187832, -1.069214, 1, 0, 0, 1, 1,
-0.9460339, 0.03526378, -1.003011, 1, 0, 0, 1, 1,
-0.9425977, -0.3450254, -2.32376, 1, 0, 0, 1, 1,
-0.9391237, 0.467242, -0.2932438, 1, 0, 0, 1, 1,
-0.9330162, 0.2266343, -0.007468258, 0, 0, 0, 1, 1,
-0.9194621, 0.05088789, -2.701907, 0, 0, 0, 1, 1,
-0.9124904, 0.590119, -0.9345493, 0, 0, 0, 1, 1,
-0.9124409, 0.2624359, -2.004479, 0, 0, 0, 1, 1,
-0.9107291, 1.101473, -1.036922, 0, 0, 0, 1, 1,
-0.9092914, -0.6253063, -1.610375, 0, 0, 0, 1, 1,
-0.9072756, -0.3208277, -2.966548, 0, 0, 0, 1, 1,
-0.9072362, 0.1329019, -1.159831, 1, 1, 1, 1, 1,
-0.9052132, 1.853944, -2.445438, 1, 1, 1, 1, 1,
-0.9015034, 0.8912542, -1.115876, 1, 1, 1, 1, 1,
-0.9001003, -0.151024, -2.355168, 1, 1, 1, 1, 1,
-0.8960249, 0.9523991, 0.1909768, 1, 1, 1, 1, 1,
-0.8930184, -0.9996454, -2.944033, 1, 1, 1, 1, 1,
-0.8927895, 0.3932532, 1.024871, 1, 1, 1, 1, 1,
-0.8915915, 1.022395, -0.2881682, 1, 1, 1, 1, 1,
-0.8868902, -0.5211374, -2.522119, 1, 1, 1, 1, 1,
-0.8757167, -0.4156158, -1.563423, 1, 1, 1, 1, 1,
-0.8753214, -0.06266557, -1.820203, 1, 1, 1, 1, 1,
-0.8735996, 0.8262474, 0.1177431, 1, 1, 1, 1, 1,
-0.8735061, 0.9394878, -0.7651491, 1, 1, 1, 1, 1,
-0.8663711, 1.390848, -3.622486, 1, 1, 1, 1, 1,
-0.8547864, 0.6512578, -1.295777, 1, 1, 1, 1, 1,
-0.8541874, -0.4499252, -1.05544, 0, 0, 1, 1, 1,
-0.849919, -0.2851577, -1.320084, 1, 0, 0, 1, 1,
-0.8449782, -0.5502733, 0.7646363, 1, 0, 0, 1, 1,
-0.8405646, -0.4474968, -1.668228, 1, 0, 0, 1, 1,
-0.83873, -1.467186, -3.436527, 1, 0, 0, 1, 1,
-0.8282662, 0.4221804, -1.785471, 1, 0, 0, 1, 1,
-0.8265969, -1.097321, -1.90518, 0, 0, 0, 1, 1,
-0.8210803, 0.2538037, -0.5250193, 0, 0, 0, 1, 1,
-0.8194164, 1.508093, -1.391628, 0, 0, 0, 1, 1,
-0.8165105, 0.2657029, -1.137406, 0, 0, 0, 1, 1,
-0.815937, -0.5175774, -1.371508, 0, 0, 0, 1, 1,
-0.8028795, 1.069983, -2.714787, 0, 0, 0, 1, 1,
-0.7969379, 0.5154218, -0.0762362, 0, 0, 0, 1, 1,
-0.7953273, 0.3982033, -2.447935, 1, 1, 1, 1, 1,
-0.7902107, 1.481635, -2.549161, 1, 1, 1, 1, 1,
-0.7891149, 0.4856051, 0.2057276, 1, 1, 1, 1, 1,
-0.7861139, -0.6677914, -1.892126, 1, 1, 1, 1, 1,
-0.7803264, 0.2205722, -1.788666, 1, 1, 1, 1, 1,
-0.7798157, 1.554135, -0.4068304, 1, 1, 1, 1, 1,
-0.7784674, 0.7433562, -0.549897, 1, 1, 1, 1, 1,
-0.7744697, 0.7130952, -1.197645, 1, 1, 1, 1, 1,
-0.7683906, 0.5432692, 0.1839784, 1, 1, 1, 1, 1,
-0.7431014, -0.9202862, -1.723514, 1, 1, 1, 1, 1,
-0.7418131, 0.00176407, -2.265164, 1, 1, 1, 1, 1,
-0.7409291, -0.8058152, -2.257175, 1, 1, 1, 1, 1,
-0.7380103, 0.6116391, -1.911696, 1, 1, 1, 1, 1,
-0.7371317, 2.150846, -0.6210184, 1, 1, 1, 1, 1,
-0.7346304, 0.1923269, -0.7810968, 1, 1, 1, 1, 1,
-0.7340274, -0.5857657, -3.145789, 0, 0, 1, 1, 1,
-0.7335501, 0.2715647, -1.673965, 1, 0, 0, 1, 1,
-0.7287505, 1.350173, -2.05845, 1, 0, 0, 1, 1,
-0.7272258, -1.272433, -1.210766, 1, 0, 0, 1, 1,
-0.7267182, 0.4165851, -0.8698552, 1, 0, 0, 1, 1,
-0.7245774, -0.4156689, -2.038546, 1, 0, 0, 1, 1,
-0.722246, -0.1929834, -1.505075, 0, 0, 0, 1, 1,
-0.7219726, -0.05842083, -0.4703273, 0, 0, 0, 1, 1,
-0.7117596, 0.7700951, -0.7124555, 0, 0, 0, 1, 1,
-0.7085308, 0.9194219, -0.1202376, 0, 0, 0, 1, 1,
-0.7069348, -0.9688327, -1.444352, 0, 0, 0, 1, 1,
-0.7038668, 0.5549221, -1.991559, 0, 0, 0, 1, 1,
-0.6985023, 0.778154, -1.172258, 0, 0, 0, 1, 1,
-0.6955993, -0.2478388, -1.246093, 1, 1, 1, 1, 1,
-0.6934627, -0.3428529, -1.868362, 1, 1, 1, 1, 1,
-0.687265, 0.09218711, -1.733978, 1, 1, 1, 1, 1,
-0.6841846, 0.6627842, -3.032103, 1, 1, 1, 1, 1,
-0.6827031, 0.2975304, -2.244586, 1, 1, 1, 1, 1,
-0.6774732, -2.401063, -3.389799, 1, 1, 1, 1, 1,
-0.6747023, 1.087507, -1.190525, 1, 1, 1, 1, 1,
-0.6746432, -1.02979, -2.366764, 1, 1, 1, 1, 1,
-0.6677663, -0.2848548, -3.898391, 1, 1, 1, 1, 1,
-0.6613979, 2.080488, -1.25515, 1, 1, 1, 1, 1,
-0.6593125, -0.07685994, -1.604147, 1, 1, 1, 1, 1,
-0.6566158, 0.6759134, -0.9836548, 1, 1, 1, 1, 1,
-0.654188, -0.3408543, -2.981874, 1, 1, 1, 1, 1,
-0.6489294, -0.8356569, -1.500502, 1, 1, 1, 1, 1,
-0.6474934, 0.8484952, -2.485806, 1, 1, 1, 1, 1,
-0.6467575, 0.8588259, -1.07386, 0, 0, 1, 1, 1,
-0.6382542, -0.334855, -3.142285, 1, 0, 0, 1, 1,
-0.631598, 0.6384242, -0.8515866, 1, 0, 0, 1, 1,
-0.6311416, -1.004794, -2.132296, 1, 0, 0, 1, 1,
-0.6268038, 0.01420633, -0.9208006, 1, 0, 0, 1, 1,
-0.6267388, 0.9553298, -0.5146207, 1, 0, 0, 1, 1,
-0.6226283, 0.06482441, -1.084397, 0, 0, 0, 1, 1,
-0.6199121, -0.7909243, -0.791671, 0, 0, 0, 1, 1,
-0.6075834, 0.6318282, -1.774649, 0, 0, 0, 1, 1,
-0.6036115, 0.1659518, -2.774981, 0, 0, 0, 1, 1,
-0.6034943, -0.2545029, 0.9202549, 0, 0, 0, 1, 1,
-0.6002487, -2.253685, -3.126704, 0, 0, 0, 1, 1,
-0.5920899, 3.376461, 1.232462, 0, 0, 0, 1, 1,
-0.5873907, -0.6132911, -3.773968, 1, 1, 1, 1, 1,
-0.5845262, 0.2889082, -1.254823, 1, 1, 1, 1, 1,
-0.5806618, 0.05315225, -1.104211, 1, 1, 1, 1, 1,
-0.5777638, -0.415974, -2.834075, 1, 1, 1, 1, 1,
-0.5751879, 0.9709614, -1.407603, 1, 1, 1, 1, 1,
-0.5732947, -1.128977, -3.538446, 1, 1, 1, 1, 1,
-0.5688043, 0.4041754, -1.634479, 1, 1, 1, 1, 1,
-0.5685448, -0.5014297, -1.348869, 1, 1, 1, 1, 1,
-0.5592229, -0.1720386, -2.688409, 1, 1, 1, 1, 1,
-0.5555192, -0.006842562, -1.714443, 1, 1, 1, 1, 1,
-0.5513309, -0.6770419, -2.573923, 1, 1, 1, 1, 1,
-0.5503653, -0.2023287, -1.856991, 1, 1, 1, 1, 1,
-0.5491404, 1.727199, -0.3479334, 1, 1, 1, 1, 1,
-0.5482972, 0.5415882, -0.956174, 1, 1, 1, 1, 1,
-0.5391839, -1.25612, -1.636533, 1, 1, 1, 1, 1,
-0.5386429, -0.5816306, -2.811601, 0, 0, 1, 1, 1,
-0.5376108, -0.5168763, -2.681157, 1, 0, 0, 1, 1,
-0.5364222, -0.7004824, -1.298326, 1, 0, 0, 1, 1,
-0.5354923, -0.7463897, -3.195161, 1, 0, 0, 1, 1,
-0.535162, 0.06300396, -1.063189, 1, 0, 0, 1, 1,
-0.527894, -1.132008, -2.183407, 1, 0, 0, 1, 1,
-0.5225596, 1.309371, -0.138862, 0, 0, 0, 1, 1,
-0.5209235, -0.02440385, -0.4530279, 0, 0, 0, 1, 1,
-0.5186988, 0.7755146, 0.9811847, 0, 0, 0, 1, 1,
-0.5161977, -0.9307252, -2.507414, 0, 0, 0, 1, 1,
-0.5124873, -0.969031, -3.669603, 0, 0, 0, 1, 1,
-0.5119864, -0.5429177, -2.422385, 0, 0, 0, 1, 1,
-0.5109427, -0.0435317, -0.9966065, 0, 0, 0, 1, 1,
-0.5076883, -0.6959409, -1.842661, 1, 1, 1, 1, 1,
-0.5074903, 1.28958, -0.3810628, 1, 1, 1, 1, 1,
-0.5061522, -1.318597, -1.876358, 1, 1, 1, 1, 1,
-0.505819, 0.7214742, -0.2272578, 1, 1, 1, 1, 1,
-0.4976182, -0.5239461, -1.29847, 1, 1, 1, 1, 1,
-0.4955766, -2.818197, -2.766557, 1, 1, 1, 1, 1,
-0.4875627, -0.5414197, -3.709609, 1, 1, 1, 1, 1,
-0.4802153, -0.5674809, -1.598375, 1, 1, 1, 1, 1,
-0.4791764, 0.8994048, -1.147896, 1, 1, 1, 1, 1,
-0.4788876, 0.8383791, -1.759624, 1, 1, 1, 1, 1,
-0.4788456, 1.901245, -0.07038631, 1, 1, 1, 1, 1,
-0.4746442, 0.3055496, -0.3688201, 1, 1, 1, 1, 1,
-0.4730468, 1.039382, -0.4363177, 1, 1, 1, 1, 1,
-0.4715007, 1.244288, 0.6501334, 1, 1, 1, 1, 1,
-0.4709051, -0.4114117, -3.472646, 1, 1, 1, 1, 1,
-0.4657248, -0.2197861, -3.657923, 0, 0, 1, 1, 1,
-0.4649719, -0.05795285, -2.160977, 1, 0, 0, 1, 1,
-0.464076, -0.7119246, -3.011093, 1, 0, 0, 1, 1,
-0.4611915, -0.476946, -0.5782502, 1, 0, 0, 1, 1,
-0.4588465, 0.498155, 0.4640608, 1, 0, 0, 1, 1,
-0.453388, -0.3142261, -3.025202, 1, 0, 0, 1, 1,
-0.4521029, -1.854443, -0.6433784, 0, 0, 0, 1, 1,
-0.4496142, -1.184264, -4.371863, 0, 0, 0, 1, 1,
-0.4428433, -0.5705727, -2.497799, 0, 0, 0, 1, 1,
-0.4399305, -1.486879, -2.33297, 0, 0, 0, 1, 1,
-0.4397179, -0.3749895, -2.308074, 0, 0, 0, 1, 1,
-0.4386137, -0.8567589, -1.790534, 0, 0, 0, 1, 1,
-0.4359545, -0.1082971, -2.171383, 0, 0, 0, 1, 1,
-0.4340337, -2.483744, -2.635474, 1, 1, 1, 1, 1,
-0.4294094, 0.5678688, -0.6175224, 1, 1, 1, 1, 1,
-0.4268925, -0.4930447, -2.584653, 1, 1, 1, 1, 1,
-0.4253137, 0.5739453, -0.7753907, 1, 1, 1, 1, 1,
-0.4223047, 0.3351403, -0.494022, 1, 1, 1, 1, 1,
-0.422076, -0.6455119, -1.180543, 1, 1, 1, 1, 1,
-0.4216814, -0.9941179, -2.17257, 1, 1, 1, 1, 1,
-0.415255, 0.422524, -2.089629, 1, 1, 1, 1, 1,
-0.4148846, -0.1825318, -2.631419, 1, 1, 1, 1, 1,
-0.4056266, 3.247763, 0.8334383, 1, 1, 1, 1, 1,
-0.4033283, 0.4074039, -0.6212668, 1, 1, 1, 1, 1,
-0.3897077, -1.634394, -2.613841, 1, 1, 1, 1, 1,
-0.3896448, -1.779757, -4.632938, 1, 1, 1, 1, 1,
-0.3842645, -0.2090963, -1.027847, 1, 1, 1, 1, 1,
-0.3775533, 0.7216164, 0.6622435, 1, 1, 1, 1, 1,
-0.3750725, 0.5902777, 1.395932, 0, 0, 1, 1, 1,
-0.37426, -1.693762, -2.625464, 1, 0, 0, 1, 1,
-0.3736128, 0.2698606, -2.374664, 1, 0, 0, 1, 1,
-0.3730864, 1.312951, 1.43165, 1, 0, 0, 1, 1,
-0.3722179, -1.253855, -3.537846, 1, 0, 0, 1, 1,
-0.3717148, 1.52506, 0.3357997, 1, 0, 0, 1, 1,
-0.3714411, 0.6205611, 0.3301965, 0, 0, 0, 1, 1,
-0.3704912, 0.1335091, -0.7593845, 0, 0, 0, 1, 1,
-0.3702853, 1.335972, -1.625256, 0, 0, 0, 1, 1,
-0.3569521, -1.200197, -2.808406, 0, 0, 0, 1, 1,
-0.3541933, -0.4613793, -1.958637, 0, 0, 0, 1, 1,
-0.3477863, 0.7362139, 0.5158868, 0, 0, 0, 1, 1,
-0.3444661, 0.1079943, -1.019902, 0, 0, 0, 1, 1,
-0.3426101, -0.2374342, -2.314559, 1, 1, 1, 1, 1,
-0.3411462, -0.3562619, -0.6197304, 1, 1, 1, 1, 1,
-0.3402205, 1.154141, -0.2667708, 1, 1, 1, 1, 1,
-0.3399439, -0.1946267, -1.577648, 1, 1, 1, 1, 1,
-0.3361573, -0.09602095, -0.8082195, 1, 1, 1, 1, 1,
-0.3355904, 0.5351475, 0.05056657, 1, 1, 1, 1, 1,
-0.3342607, 0.9775601, 0.5827598, 1, 1, 1, 1, 1,
-0.3337204, -0.7300542, -3.21653, 1, 1, 1, 1, 1,
-0.3332058, 1.983136, -0.7469164, 1, 1, 1, 1, 1,
-0.3281777, 1.475312, 0.7733661, 1, 1, 1, 1, 1,
-0.328162, -0.5727415, -3.356434, 1, 1, 1, 1, 1,
-0.3266126, -0.3975478, -3.596533, 1, 1, 1, 1, 1,
-0.3253178, -0.9028347, -3.202901, 1, 1, 1, 1, 1,
-0.3252252, -0.1015346, -1.128509, 1, 1, 1, 1, 1,
-0.3242313, -1.164716, -5.982107, 1, 1, 1, 1, 1,
-0.3236322, 1.01702, 0.1540087, 0, 0, 1, 1, 1,
-0.3201091, 0.935873, -0.6819668, 1, 0, 0, 1, 1,
-0.3182302, 0.8114895, 1.275353, 1, 0, 0, 1, 1,
-0.3136119, 0.1720351, 0.1978012, 1, 0, 0, 1, 1,
-0.312223, 0.9388047, -0.7106267, 1, 0, 0, 1, 1,
-0.3099976, 0.09979695, -1.500442, 1, 0, 0, 1, 1,
-0.3033538, 0.6658825, 0.3236586, 0, 0, 0, 1, 1,
-0.3021912, 0.3897227, -0.140755, 0, 0, 0, 1, 1,
-0.3000368, 0.4249951, -0.7218773, 0, 0, 0, 1, 1,
-0.2980534, -1.807006, -1.382483, 0, 0, 0, 1, 1,
-0.2975005, -0.8530966, -2.54877, 0, 0, 0, 1, 1,
-0.2954554, -0.8316227, -2.505619, 0, 0, 0, 1, 1,
-0.2914506, 0.5130007, -0.8288772, 0, 0, 0, 1, 1,
-0.2889636, -1.030527, -2.170738, 1, 1, 1, 1, 1,
-0.2878524, -0.3083118, -2.660031, 1, 1, 1, 1, 1,
-0.2876595, -0.463807, -2.907545, 1, 1, 1, 1, 1,
-0.2867134, 1.085324, -0.6146384, 1, 1, 1, 1, 1,
-0.2833571, 0.6311726, 1.127476, 1, 1, 1, 1, 1,
-0.2785625, 0.3177206, -0.1754503, 1, 1, 1, 1, 1,
-0.2772986, -0.7293573, -2.72455, 1, 1, 1, 1, 1,
-0.2748978, 0.4611735, -0.1219459, 1, 1, 1, 1, 1,
-0.2744318, -1.42793, -3.747948, 1, 1, 1, 1, 1,
-0.2742306, -0.9987072, -3.462036, 1, 1, 1, 1, 1,
-0.2739191, -0.30093, -1.849195, 1, 1, 1, 1, 1,
-0.2736339, 1.012145, 0.08405498, 1, 1, 1, 1, 1,
-0.2712451, 1.655046, -0.5125072, 1, 1, 1, 1, 1,
-0.2710122, 0.398658, 1.215101, 1, 1, 1, 1, 1,
-0.2692223, -1.048369, -2.277983, 1, 1, 1, 1, 1,
-0.2689014, -0.2262245, -1.402585, 0, 0, 1, 1, 1,
-0.2658319, 0.6247123, -0.07400031, 1, 0, 0, 1, 1,
-0.2592866, -1.005652, -1.837125, 1, 0, 0, 1, 1,
-0.2572193, -0.4254033, -2.016196, 1, 0, 0, 1, 1,
-0.2568842, 0.843847, -1.220858, 1, 0, 0, 1, 1,
-0.2568178, -0.07798852, -2.688599, 1, 0, 0, 1, 1,
-0.2559547, 1.722599, -0.7376705, 0, 0, 0, 1, 1,
-0.2550479, 1.516108, 0.01958857, 0, 0, 0, 1, 1,
-0.2545499, 1.627167, -0.8792582, 0, 0, 0, 1, 1,
-0.2532801, 0.6934437, -0.973664, 0, 0, 0, 1, 1,
-0.2532288, 0.5737812, -0.6085074, 0, 0, 0, 1, 1,
-0.2523779, -1.239347, -5.911067, 0, 0, 0, 1, 1,
-0.2458381, -0.2713719, -1.768715, 0, 0, 0, 1, 1,
-0.2431827, 1.909417, -0.3666221, 1, 1, 1, 1, 1,
-0.2422604, -0.9135277, -3.033353, 1, 1, 1, 1, 1,
-0.2409423, 0.5679768, -1.101316, 1, 1, 1, 1, 1,
-0.240924, -1.290505, -2.721347, 1, 1, 1, 1, 1,
-0.2405667, -0.3323779, -0.9557947, 1, 1, 1, 1, 1,
-0.2400471, -0.3944913, -3.399106, 1, 1, 1, 1, 1,
-0.2393661, -0.2325612, -2.155388, 1, 1, 1, 1, 1,
-0.2362949, -0.1855034, -0.01848842, 1, 1, 1, 1, 1,
-0.2321952, 1.274131, -0.6644588, 1, 1, 1, 1, 1,
-0.2222428, 1.189479, 0.6374084, 1, 1, 1, 1, 1,
-0.2218129, 0.003436247, -0.7441063, 1, 1, 1, 1, 1,
-0.2194188, 1.316615, 0.02423832, 1, 1, 1, 1, 1,
-0.2167309, -0.5514396, -2.515738, 1, 1, 1, 1, 1,
-0.2149759, -0.3982059, -2.104516, 1, 1, 1, 1, 1,
-0.2146288, 0.8063304, -0.3327152, 1, 1, 1, 1, 1,
-0.2124443, 0.8678172, -0.3528871, 0, 0, 1, 1, 1,
-0.210715, -0.09572036, -1.741466, 1, 0, 0, 1, 1,
-0.2024361, 0.8294032, -1.870981, 1, 0, 0, 1, 1,
-0.1937857, 1.304311, 0.8713777, 1, 0, 0, 1, 1,
-0.1870421, -0.6800132, -2.992271, 1, 0, 0, 1, 1,
-0.1856589, 0.08872221, -1.449502, 1, 0, 0, 1, 1,
-0.1851896, 0.2977407, -0.4910498, 0, 0, 0, 1, 1,
-0.1844787, 0.7199253, 0.009678967, 0, 0, 0, 1, 1,
-0.1817975, 1.54297, -0.994734, 0, 0, 0, 1, 1,
-0.1816082, 0.01212885, -0.721658, 0, 0, 0, 1, 1,
-0.180821, 0.3719859, 1.06568, 0, 0, 0, 1, 1,
-0.18082, -0.3667361, -4.037169, 0, 0, 0, 1, 1,
-0.1729716, -0.4552809, -2.542184, 0, 0, 0, 1, 1,
-0.1707112, -0.1193377, -3.5836, 1, 1, 1, 1, 1,
-0.1695585, 0.7758043, -2.72352, 1, 1, 1, 1, 1,
-0.1678093, 1.543545, -1.284107, 1, 1, 1, 1, 1,
-0.1677144, -0.4578907, -4.376317, 1, 1, 1, 1, 1,
-0.1672771, -0.01346454, -3.686379, 1, 1, 1, 1, 1,
-0.1666676, -1.125189, -3.925848, 1, 1, 1, 1, 1,
-0.1633079, -0.4904182, -3.066857, 1, 1, 1, 1, 1,
-0.1630889, -1.193555, -4.536455, 1, 1, 1, 1, 1,
-0.1591203, 0.3709441, -1.892443, 1, 1, 1, 1, 1,
-0.1565272, 0.4593726, 0.08798804, 1, 1, 1, 1, 1,
-0.1524164, -0.6507812, -4.146846, 1, 1, 1, 1, 1,
-0.1498372, 1.267576, -0.7856979, 1, 1, 1, 1, 1,
-0.1476918, 0.9134853, -1.932727, 1, 1, 1, 1, 1,
-0.1451901, 1.123464, -1.303765, 1, 1, 1, 1, 1,
-0.1421311, -1.796008, -2.578636, 1, 1, 1, 1, 1,
-0.1402913, -0.623925, -2.507751, 0, 0, 1, 1, 1,
-0.1379243, 0.4476992, -1.509309, 1, 0, 0, 1, 1,
-0.1374904, -0.4718659, -2.461632, 1, 0, 0, 1, 1,
-0.137123, 0.2845285, 0.8322668, 1, 0, 0, 1, 1,
-0.1363041, 1.057539, 0.2731667, 1, 0, 0, 1, 1,
-0.1337223, 0.6262886, -0.3661284, 1, 0, 0, 1, 1,
-0.1303921, 0.6616215, 0.07565953, 0, 0, 0, 1, 1,
-0.1269398, 0.09398677, -1.525289, 0, 0, 0, 1, 1,
-0.1235694, 1.093299, -0.6186553, 0, 0, 0, 1, 1,
-0.1181248, 0.7066244, 0.1409695, 0, 0, 0, 1, 1,
-0.1157584, -0.06596104, -0.6497996, 0, 0, 0, 1, 1,
-0.1155618, 1.245029, -1.627774, 0, 0, 0, 1, 1,
-0.1144328, -0.1980946, -2.248694, 0, 0, 0, 1, 1,
-0.1138411, -0.782895, -3.802512, 1, 1, 1, 1, 1,
-0.1068307, -0.4584372, -2.116431, 1, 1, 1, 1, 1,
-0.1066749, 0.2493133, -0.778654, 1, 1, 1, 1, 1,
-0.1016995, -0.7696547, -1.588035, 1, 1, 1, 1, 1,
-0.1000698, -0.4367482, -2.999524, 1, 1, 1, 1, 1,
-0.09419423, 0.6783652, 0.4168366, 1, 1, 1, 1, 1,
-0.09399845, -1.437908, -3.599676, 1, 1, 1, 1, 1,
-0.09270984, 0.04925656, -0.6777275, 1, 1, 1, 1, 1,
-0.09066814, -1.51911, -3.179859, 1, 1, 1, 1, 1,
-0.0864857, -0.6950759, -2.152389, 1, 1, 1, 1, 1,
-0.08554605, 1.066295, -1.312643, 1, 1, 1, 1, 1,
-0.07924731, 0.09432232, -0.5369323, 1, 1, 1, 1, 1,
-0.07896753, -0.9463789, -4.737801, 1, 1, 1, 1, 1,
-0.07895466, 0.3624817, -1.028957, 1, 1, 1, 1, 1,
-0.07511751, -0.0927424, -2.082842, 1, 1, 1, 1, 1,
-0.07393686, 0.7655304, 1.720115, 0, 0, 1, 1, 1,
-0.0732805, 0.9467906, -0.4996414, 1, 0, 0, 1, 1,
-0.07184809, -1.199945, -3.808804, 1, 0, 0, 1, 1,
-0.07065541, 0.9801458, 0.3922936, 1, 0, 0, 1, 1,
-0.0672745, 0.02124351, -0.4708052, 1, 0, 0, 1, 1,
-0.06655895, 0.9583813, -2.180009, 1, 0, 0, 1, 1,
-0.06568073, -0.7624964, -5.652209, 0, 0, 0, 1, 1,
-0.06431777, -0.6692294, -3.680214, 0, 0, 0, 1, 1,
-0.06006136, -0.811286, -2.207637, 0, 0, 0, 1, 1,
-0.05616939, 0.7456958, 1.514585, 0, 0, 0, 1, 1,
-0.05379226, -1.106152, -1.41617, 0, 0, 0, 1, 1,
-0.05340022, -0.1291973, -1.167244, 0, 0, 0, 1, 1,
-0.05322397, -2.139013, -2.969798, 0, 0, 0, 1, 1,
-0.05263309, -0.03459714, -2.083451, 1, 1, 1, 1, 1,
-0.05216127, 0.4101728, 1.018024, 1, 1, 1, 1, 1,
-0.0504172, 0.9166216, -1.533391, 1, 1, 1, 1, 1,
-0.0487195, 0.4149397, -0.7189767, 1, 1, 1, 1, 1,
-0.04708488, 0.1141497, -1.120086, 1, 1, 1, 1, 1,
-0.0445913, -0.1333569, -3.033056, 1, 1, 1, 1, 1,
-0.04175637, 0.4778624, 0.5350226, 1, 1, 1, 1, 1,
-0.04122696, 0.06676623, 0.215113, 1, 1, 1, 1, 1,
-0.0409092, -0.3054125, -1.321076, 1, 1, 1, 1, 1,
-0.04055705, 0.6015038, 0.2551132, 1, 1, 1, 1, 1,
-0.0383543, 0.8162392, -0.5395731, 1, 1, 1, 1, 1,
-0.02890804, -1.018295, -2.847218, 1, 1, 1, 1, 1,
-0.02541818, 0.6156619, -1.374733, 1, 1, 1, 1, 1,
-0.02469666, -0.1813262, -3.149089, 1, 1, 1, 1, 1,
-0.02424583, 0.1570553, 2.028903, 1, 1, 1, 1, 1,
-0.02185621, -0.3382733, -3.238522, 0, 0, 1, 1, 1,
-0.0162355, 0.01004773, -0.6257522, 1, 0, 0, 1, 1,
-0.01031367, -0.4856824, -3.180489, 1, 0, 0, 1, 1,
-0.008567147, -0.3730365, -2.048014, 1, 0, 0, 1, 1,
-0.007653289, 0.8273312, 0.6066848, 1, 0, 0, 1, 1,
-0.006741149, -0.1687762, -2.263407, 1, 0, 0, 1, 1,
0.004548206, -0.129349, 1.564761, 0, 0, 0, 1, 1,
0.005896638, 0.7436826, 0.5858192, 0, 0, 0, 1, 1,
0.007472092, 0.05082333, 0.3423176, 0, 0, 0, 1, 1,
0.00847315, -0.09327736, 2.756181, 0, 0, 0, 1, 1,
0.01337591, 2.179281, 0.3445303, 0, 0, 0, 1, 1,
0.01344481, 2.910391, 1.018958, 0, 0, 0, 1, 1,
0.01492557, -0.1390798, 3.167292, 0, 0, 0, 1, 1,
0.02837821, 0.04713003, 1.131535, 1, 1, 1, 1, 1,
0.02921649, -1.610808, 4.319119, 1, 1, 1, 1, 1,
0.03455565, -0.05919664, 3.738654, 1, 1, 1, 1, 1,
0.0352923, -1.183048, 3.104662, 1, 1, 1, 1, 1,
0.03911709, -0.4895619, 2.575624, 1, 1, 1, 1, 1,
0.04092785, -1.681346, 2.96289, 1, 1, 1, 1, 1,
0.04380161, -1.218354, 3.579939, 1, 1, 1, 1, 1,
0.05114308, 0.9331452, 1.070645, 1, 1, 1, 1, 1,
0.05170397, -1.052356, 4.336464, 1, 1, 1, 1, 1,
0.05258955, -0.5378823, 3.419245, 1, 1, 1, 1, 1,
0.05345971, 0.2174456, 0.5118747, 1, 1, 1, 1, 1,
0.05690219, -1.354026, 2.635009, 1, 1, 1, 1, 1,
0.06074009, -0.6903934, 2.315491, 1, 1, 1, 1, 1,
0.06630705, -1.04603, 3.33385, 1, 1, 1, 1, 1,
0.06895936, -1.235632, 5.016335, 1, 1, 1, 1, 1,
0.07479215, -0.1773191, 3.516668, 0, 0, 1, 1, 1,
0.07811347, 1.123081, 0.2362768, 1, 0, 0, 1, 1,
0.08500679, -0.4208672, 2.737123, 1, 0, 0, 1, 1,
0.08731612, -0.7528975, 1.83302, 1, 0, 0, 1, 1,
0.08834877, 1.473107, -0.9488732, 1, 0, 0, 1, 1,
0.09001768, 0.8811355, -0.04363925, 1, 0, 0, 1, 1,
0.09200283, -0.3265523, 4.685919, 0, 0, 0, 1, 1,
0.0927925, 0.1720546, -0.5755225, 0, 0, 0, 1, 1,
0.1126125, -1.209905, 1.508871, 0, 0, 0, 1, 1,
0.1130919, 0.07328946, 1.261506, 0, 0, 0, 1, 1,
0.1150389, 0.2109121, 0.08095442, 0, 0, 0, 1, 1,
0.1166779, 0.5756441, 0.5558807, 0, 0, 0, 1, 1,
0.119946, 0.8913597, -0.5487829, 0, 0, 0, 1, 1,
0.1204692, 0.02270881, 0.9406337, 1, 1, 1, 1, 1,
0.1234996, -1.104496, 3.408648, 1, 1, 1, 1, 1,
0.12906, 0.07801998, -0.02419236, 1, 1, 1, 1, 1,
0.1347099, 0.1515498, 1.296809, 1, 1, 1, 1, 1,
0.1352824, -1.114948, 4.104298, 1, 1, 1, 1, 1,
0.1353667, 0.1333529, 0.6770461, 1, 1, 1, 1, 1,
0.1358681, -0.267261, 3.039999, 1, 1, 1, 1, 1,
0.1361215, -1.534001, 1.446602, 1, 1, 1, 1, 1,
0.1385253, -0.1143476, 3.12035, 1, 1, 1, 1, 1,
0.1402555, 0.5508974, 2.774274, 1, 1, 1, 1, 1,
0.1410043, 1.071759, -1.408641, 1, 1, 1, 1, 1,
0.1415216, 0.6439071, -1.425243, 1, 1, 1, 1, 1,
0.1425837, -0.9006496, 3.553754, 1, 1, 1, 1, 1,
0.1455041, -0.2409024, 2.31603, 1, 1, 1, 1, 1,
0.1480809, 0.2174378, 0.05090563, 1, 1, 1, 1, 1,
0.149813, -1.584807, 3.483205, 0, 0, 1, 1, 1,
0.1500239, 0.6823857, 0.2236395, 1, 0, 0, 1, 1,
0.1571742, -0.3829306, -0.1845917, 1, 0, 0, 1, 1,
0.1585486, -0.3150186, 2.577315, 1, 0, 0, 1, 1,
0.1631576, -0.9115188, 0.5807679, 1, 0, 0, 1, 1,
0.1635783, -0.9483705, 1.996736, 1, 0, 0, 1, 1,
0.1656889, -1.889767, 1.219475, 0, 0, 0, 1, 1,
0.1668352, -0.6566069, 2.304089, 0, 0, 0, 1, 1,
0.1707666, -0.7764972, 2.730611, 0, 0, 0, 1, 1,
0.1714082, 1.666265, -0.3194998, 0, 0, 0, 1, 1,
0.1728544, -0.2203285, 1.802189, 0, 0, 0, 1, 1,
0.1771136, 0.7012252, 0.06643313, 0, 0, 0, 1, 1,
0.1797788, -0.5142374, 3.372221, 0, 0, 0, 1, 1,
0.1845429, 1.947279, 0.3523164, 1, 1, 1, 1, 1,
0.185576, 0.2612363, -0.5640389, 1, 1, 1, 1, 1,
0.1864462, -0.2966337, 2.434736, 1, 1, 1, 1, 1,
0.1884646, -1.779344, 1.867938, 1, 1, 1, 1, 1,
0.1897305, -0.9141858, 2.902999, 1, 1, 1, 1, 1,
0.1929446, -0.4445985, 3.902444, 1, 1, 1, 1, 1,
0.1961102, 0.2789874, 1.269567, 1, 1, 1, 1, 1,
0.1990453, 0.280887, 1.210259, 1, 1, 1, 1, 1,
0.2013095, -0.6356467, 3.260004, 1, 1, 1, 1, 1,
0.2045501, -0.2664457, 0.1958834, 1, 1, 1, 1, 1,
0.2077427, -2.010874, 2.61961, 1, 1, 1, 1, 1,
0.2097144, -0.1204855, 2.391598, 1, 1, 1, 1, 1,
0.209815, -0.3683273, 1.970441, 1, 1, 1, 1, 1,
0.210716, 0.2400845, 2.279972, 1, 1, 1, 1, 1,
0.2111609, 1.03009, 1.770273, 1, 1, 1, 1, 1,
0.2112589, -0.5753012, 4.267219, 0, 0, 1, 1, 1,
0.211399, -2.642875, 3.096701, 1, 0, 0, 1, 1,
0.2138077, -1.116143, 2.49166, 1, 0, 0, 1, 1,
0.2138885, -0.5112962, 3.624502, 1, 0, 0, 1, 1,
0.2140382, 0.7610316, 2.402286, 1, 0, 0, 1, 1,
0.2145019, 0.3267101, 1.749022, 1, 0, 0, 1, 1,
0.2149254, 0.4653056, 1.058243, 0, 0, 0, 1, 1,
0.2187713, -0.3938873, 2.54941, 0, 0, 0, 1, 1,
0.2190845, -1.587917, 2.507848, 0, 0, 0, 1, 1,
0.2191705, 0.3252802, -0.1529678, 0, 0, 0, 1, 1,
0.2192783, -0.2435106, -0.2548206, 0, 0, 0, 1, 1,
0.2216324, -0.005703326, 1.051198, 0, 0, 0, 1, 1,
0.2226426, -1.041234, 1.292382, 0, 0, 0, 1, 1,
0.2284347, -1.152313, 3.630807, 1, 1, 1, 1, 1,
0.2315407, -1.653502, 4.432673, 1, 1, 1, 1, 1,
0.2345182, 0.240021, -0.9026045, 1, 1, 1, 1, 1,
0.2426681, -0.2444618, 1.556704, 1, 1, 1, 1, 1,
0.2450567, 0.4640783, 0.8971326, 1, 1, 1, 1, 1,
0.2488565, 0.5782863, 2.240727, 1, 1, 1, 1, 1,
0.2509653, 1.109991, -1.436991, 1, 1, 1, 1, 1,
0.2510613, 1.248719, 0.3398722, 1, 1, 1, 1, 1,
0.2568571, -1.364666, 3.272419, 1, 1, 1, 1, 1,
0.2596933, -1.358859, 3.676932, 1, 1, 1, 1, 1,
0.2616638, 1.115221, 1.310292, 1, 1, 1, 1, 1,
0.2622593, -0.2093659, 2.736474, 1, 1, 1, 1, 1,
0.2655875, -1.261653, 2.565783, 1, 1, 1, 1, 1,
0.2663197, -0.1311014, 4.497417, 1, 1, 1, 1, 1,
0.2680424, -0.8700138, 1.636425, 1, 1, 1, 1, 1,
0.2709469, -1.299533, 1.54773, 0, 0, 1, 1, 1,
0.2722968, 0.2454659, 1.703791, 1, 0, 0, 1, 1,
0.276329, 0.08091407, 0.4832346, 1, 0, 0, 1, 1,
0.2788192, -0.7202925, 3.096758, 1, 0, 0, 1, 1,
0.2789409, -0.03626865, 3.664571, 1, 0, 0, 1, 1,
0.2826542, 0.2296015, 1.209613, 1, 0, 0, 1, 1,
0.2833204, -1.217887, 3.051816, 0, 0, 0, 1, 1,
0.2856899, -1.24366, 2.625306, 0, 0, 0, 1, 1,
0.2882654, 1.022617, 0.09965501, 0, 0, 0, 1, 1,
0.2900402, -0.1680338, 0.875439, 0, 0, 0, 1, 1,
0.2915395, -0.707822, 1.92867, 0, 0, 0, 1, 1,
0.2919171, 0.83745, -0.2919681, 0, 0, 0, 1, 1,
0.2922974, -1.620408, 2.981897, 0, 0, 0, 1, 1,
0.295567, 1.45302, -0.2984104, 1, 1, 1, 1, 1,
0.2969524, 1.460898, 0.1047419, 1, 1, 1, 1, 1,
0.2971321, 1.045489, 1.979936, 1, 1, 1, 1, 1,
0.2988796, 0.5550779, -0.1789929, 1, 1, 1, 1, 1,
0.3026799, 0.5606546, 2.017189, 1, 1, 1, 1, 1,
0.3031846, 0.7653871, -0.6978617, 1, 1, 1, 1, 1,
0.3090669, -0.2713962, 2.735533, 1, 1, 1, 1, 1,
0.3094882, -0.4211077, 2.327576, 1, 1, 1, 1, 1,
0.3107089, 0.3909486, 0.1801959, 1, 1, 1, 1, 1,
0.3113151, 0.8623041, 1.144536, 1, 1, 1, 1, 1,
0.3118108, 0.3212577, -3.36242, 1, 1, 1, 1, 1,
0.3119265, 1.452569, -0.5855244, 1, 1, 1, 1, 1,
0.3120221, 1.30835, 0.5047379, 1, 1, 1, 1, 1,
0.3191887, -0.3568176, 1.869969, 1, 1, 1, 1, 1,
0.3235239, 1.135806, 0.796627, 1, 1, 1, 1, 1,
0.3277615, 0.2426487, 0.7463941, 0, 0, 1, 1, 1,
0.3293611, -0.09020451, 2.711648, 1, 0, 0, 1, 1,
0.3310478, 0.5915241, -0.9978161, 1, 0, 0, 1, 1,
0.3361966, 0.02451137, 1.922746, 1, 0, 0, 1, 1,
0.3373776, 0.03730696, -0.245051, 1, 0, 0, 1, 1,
0.3435346, 0.03028492, 2.350222, 1, 0, 0, 1, 1,
0.3516995, 1.522405, 0.2426371, 0, 0, 0, 1, 1,
0.3569333, 0.1654579, 2.622927, 0, 0, 0, 1, 1,
0.3633076, 1.304395, 0.2915949, 0, 0, 0, 1, 1,
0.3643269, -0.6679365, 3.545023, 0, 0, 0, 1, 1,
0.3660103, 0.2002637, 2.367685, 0, 0, 0, 1, 1,
0.3718858, 0.4430499, 2.010124, 0, 0, 0, 1, 1,
0.3722055, 0.2544924, 0.4355249, 0, 0, 0, 1, 1,
0.375487, -0.1681994, 3.346068, 1, 1, 1, 1, 1,
0.3812173, 0.2654099, 1.416581, 1, 1, 1, 1, 1,
0.3829941, -0.9222753, 2.822478, 1, 1, 1, 1, 1,
0.3848602, -1.638417, 5.343852, 1, 1, 1, 1, 1,
0.3882275, 0.4055243, 0.4765425, 1, 1, 1, 1, 1,
0.3888999, 1.402101, -0.03617667, 1, 1, 1, 1, 1,
0.3898152, -0.796148, 2.550232, 1, 1, 1, 1, 1,
0.3900701, 0.5417477, 0.4127722, 1, 1, 1, 1, 1,
0.3947829, 0.5593178, 1.551677, 1, 1, 1, 1, 1,
0.3953972, -0.9844741, 2.081323, 1, 1, 1, 1, 1,
0.396175, -0.8724935, 2.740412, 1, 1, 1, 1, 1,
0.3968082, -1.422885, 2.036123, 1, 1, 1, 1, 1,
0.3988118, -0.7980012, 3.385969, 1, 1, 1, 1, 1,
0.398968, 0.006013648, 2.696313, 1, 1, 1, 1, 1,
0.3997575, 2.81455, -0.6791813, 1, 1, 1, 1, 1,
0.4021981, 0.4180808, -1.033655, 0, 0, 1, 1, 1,
0.4046553, -1.074541, 2.841451, 1, 0, 0, 1, 1,
0.4089185, 0.1453453, 1.73407, 1, 0, 0, 1, 1,
0.4092582, 0.4677994, 0.9023756, 1, 0, 0, 1, 1,
0.4096792, -0.2205176, 2.295705, 1, 0, 0, 1, 1,
0.4097101, -0.6005691, 1.113872, 1, 0, 0, 1, 1,
0.4115194, 0.7477704, -1.47618, 0, 0, 0, 1, 1,
0.4117664, 0.3212296, -0.07451354, 0, 0, 0, 1, 1,
0.4130926, -2.37351, 2.132457, 0, 0, 0, 1, 1,
0.414363, -0.7446709, 3.105939, 0, 0, 0, 1, 1,
0.4163249, 1.481982, 0.2116454, 0, 0, 0, 1, 1,
0.419527, -1.502561, 3.2287, 0, 0, 0, 1, 1,
0.4198511, 0.1176164, 2.559354, 0, 0, 0, 1, 1,
0.4290375, -0.5731434, 1.685678, 1, 1, 1, 1, 1,
0.4436096, -0.8919413, 1.682371, 1, 1, 1, 1, 1,
0.4634217, -1.533324, 2.186407, 1, 1, 1, 1, 1,
0.4669669, -0.3197416, 1.524285, 1, 1, 1, 1, 1,
0.4675204, -0.3167615, 1.47649, 1, 1, 1, 1, 1,
0.4696565, 0.6682122, 1.287649, 1, 1, 1, 1, 1,
0.4713441, -2.027613, 3.670435, 1, 1, 1, 1, 1,
0.4775129, 0.212882, 1.12303, 1, 1, 1, 1, 1,
0.4791033, 1.683359, 0.2570805, 1, 1, 1, 1, 1,
0.4799575, -2.066812, 2.395696, 1, 1, 1, 1, 1,
0.4878362, 1.073702, 0.3705105, 1, 1, 1, 1, 1,
0.4887767, -0.1301998, 1.102094, 1, 1, 1, 1, 1,
0.4913013, -0.5518524, 3.264699, 1, 1, 1, 1, 1,
0.4916917, -0.6514623, 1.849827, 1, 1, 1, 1, 1,
0.4941549, 0.7776634, 1.250406, 1, 1, 1, 1, 1,
0.4961714, 1.549603, 0.8573538, 0, 0, 1, 1, 1,
0.4979057, -0.8609124, 2.628046, 1, 0, 0, 1, 1,
0.5020335, -0.3235964, 2.157085, 1, 0, 0, 1, 1,
0.5052986, 1.846753, -0.7290035, 1, 0, 0, 1, 1,
0.5115346, 1.768371, 0.2052358, 1, 0, 0, 1, 1,
0.514379, 0.6861215, 0.6581022, 1, 0, 0, 1, 1,
0.5190205, 1.579237, 0.1239864, 0, 0, 0, 1, 1,
0.5206459, -1.167183, 1.97954, 0, 0, 0, 1, 1,
0.524222, 1.017763, -0.7397593, 0, 0, 0, 1, 1,
0.5299494, 0.6215219, 1.014538, 0, 0, 0, 1, 1,
0.5309829, 0.9861484, 0.4090689, 0, 0, 0, 1, 1,
0.5313249, 0.2959193, 1.390121, 0, 0, 0, 1, 1,
0.5318065, 0.1946842, 0.6100944, 0, 0, 0, 1, 1,
0.5363731, -0.3379569, 2.234628, 1, 1, 1, 1, 1,
0.5378928, -0.2068279, 0.7719839, 1, 1, 1, 1, 1,
0.5406793, 0.8645359, 0.2612712, 1, 1, 1, 1, 1,
0.5479461, 0.6396156, -0.1064806, 1, 1, 1, 1, 1,
0.5616789, -3.098528, 1.70006, 1, 1, 1, 1, 1,
0.5631396, -0.1069356, 1.610162, 1, 1, 1, 1, 1,
0.5656994, 1.4882, 0.8316523, 1, 1, 1, 1, 1,
0.5684297, -1.514664, 2.403671, 1, 1, 1, 1, 1,
0.568842, 0.7025607, 0.8162838, 1, 1, 1, 1, 1,
0.5693114, -0.3907011, 1.47066, 1, 1, 1, 1, 1,
0.5853663, 0.1172875, -0.8599223, 1, 1, 1, 1, 1,
0.5867791, 1.086707, 1.479691, 1, 1, 1, 1, 1,
0.5882762, 0.2448633, -0.4976149, 1, 1, 1, 1, 1,
0.5904556, 2.091761, 1.341842, 1, 1, 1, 1, 1,
0.5921311, 0.31536, 1.356725, 1, 1, 1, 1, 1,
0.5941957, -0.04111767, 1.382135, 0, 0, 1, 1, 1,
0.5947467, 2.50517, 1.065876, 1, 0, 0, 1, 1,
0.6069692, 0.5122557, 0.6454777, 1, 0, 0, 1, 1,
0.6072134, -0.3098439, 2.909893, 1, 0, 0, 1, 1,
0.6112763, -0.776938, 0.08520157, 1, 0, 0, 1, 1,
0.611948, 2.246393, 0.4663517, 1, 0, 0, 1, 1,
0.6123652, 1.29328, 0.2678645, 0, 0, 0, 1, 1,
0.6145299, 0.2776772, 1.798039, 0, 0, 0, 1, 1,
0.6179152, -0.30194, 2.648577, 0, 0, 0, 1, 1,
0.6221068, 0.7340532, 1.178035, 0, 0, 0, 1, 1,
0.6254355, 0.03866794, -0.4756676, 0, 0, 0, 1, 1,
0.6308, -0.01448996, 0.7193927, 0, 0, 0, 1, 1,
0.6310149, -0.3402545, 1.596833, 0, 0, 0, 1, 1,
0.6313049, 0.1075165, 2.855285, 1, 1, 1, 1, 1,
0.6324223, 0.6163055, 0.4717491, 1, 1, 1, 1, 1,
0.6346576, -0.08333376, 1.788728, 1, 1, 1, 1, 1,
0.6386349, -0.07917885, 2.365868, 1, 1, 1, 1, 1,
0.6415606, 0.03291781, 1.929338, 1, 1, 1, 1, 1,
0.6494041, -0.337648, 2.804525, 1, 1, 1, 1, 1,
0.6541076, 0.8709314, 0.2332799, 1, 1, 1, 1, 1,
0.6579157, -1.49474, 2.562887, 1, 1, 1, 1, 1,
0.6648855, 0.1278124, 1.737511, 1, 1, 1, 1, 1,
0.6696928, -1.51363, 5.084646, 1, 1, 1, 1, 1,
0.6742488, -1.348375, 3.081729, 1, 1, 1, 1, 1,
0.6745941, -0.8196715, 2.047155, 1, 1, 1, 1, 1,
0.6765575, -0.5223121, 1.917856, 1, 1, 1, 1, 1,
0.6778145, 0.1552116, 2.73172, 1, 1, 1, 1, 1,
0.6820309, -1.588207, 2.85715, 1, 1, 1, 1, 1,
0.6826869, -0.60238, 2.563793, 0, 0, 1, 1, 1,
0.6856542, 0.7436901, 0.6771653, 1, 0, 0, 1, 1,
0.6972885, -1.228633, 4.750741, 1, 0, 0, 1, 1,
0.7006334, -0.1045464, 2.907964, 1, 0, 0, 1, 1,
0.7039026, 0.6340464, 2.978576, 1, 0, 0, 1, 1,
0.7063548, -1.313639, 4.479407, 1, 0, 0, 1, 1,
0.715534, -0.3365756, 2.807625, 0, 0, 0, 1, 1,
0.716803, -0.5567657, 3.635388, 0, 0, 0, 1, 1,
0.7177364, -0.667004, 2.579185, 0, 0, 0, 1, 1,
0.7203948, -1.070737, 3.001636, 0, 0, 0, 1, 1,
0.7252443, -0.2149503, 3.162992, 0, 0, 0, 1, 1,
0.7289309, 1.982806, 0.606541, 0, 0, 0, 1, 1,
0.7296042, -1.213786, 0.4580508, 0, 0, 0, 1, 1,
0.7301652, -0.6327885, 2.075591, 1, 1, 1, 1, 1,
0.7364168, 0.9324746, 1.616053, 1, 1, 1, 1, 1,
0.7441585, -0.3787306, 0.8255705, 1, 1, 1, 1, 1,
0.7447879, 0.4796391, 0.6670038, 1, 1, 1, 1, 1,
0.7472029, -1.987509, 3.951038, 1, 1, 1, 1, 1,
0.7478302, -0.6280149, 3.282963, 1, 1, 1, 1, 1,
0.7487513, -0.02780693, 2.585052, 1, 1, 1, 1, 1,
0.7488232, 0.3956756, 1.455216, 1, 1, 1, 1, 1,
0.7515325, 1.07801, 2.04555, 1, 1, 1, 1, 1,
0.7558655, 0.1505883, 0.8316597, 1, 1, 1, 1, 1,
0.7622119, -1.527313, 2.689866, 1, 1, 1, 1, 1,
0.7639135, 1.995615, -0.1237228, 1, 1, 1, 1, 1,
0.7642256, -0.2229067, 0.5819911, 1, 1, 1, 1, 1,
0.7671805, -0.9269953, 3.613236, 1, 1, 1, 1, 1,
0.7681882, 0.4160518, 2.709892, 1, 1, 1, 1, 1,
0.7689686, -0.2167143, 3.06603, 0, 0, 1, 1, 1,
0.7766707, 0.1933205, 2.895615, 1, 0, 0, 1, 1,
0.7821889, -0.04733828, 3.393852, 1, 0, 0, 1, 1,
0.790228, 0.4207088, 2.576779, 1, 0, 0, 1, 1,
0.798076, 0.7098022, 1.537745, 1, 0, 0, 1, 1,
0.8017875, -0.71751, 2.955939, 1, 0, 0, 1, 1,
0.80433, 0.5051293, 0.5223774, 0, 0, 0, 1, 1,
0.8051983, -1.847149, 2.493639, 0, 0, 0, 1, 1,
0.8137158, -0.7071221, 1.912445, 0, 0, 0, 1, 1,
0.8205882, -2.569437, 4.162071, 0, 0, 0, 1, 1,
0.8219519, 1.299902, -0.2758366, 0, 0, 0, 1, 1,
0.8239881, -0.8839753, 3.093461, 0, 0, 0, 1, 1,
0.8297983, 1.664412, -1.089726, 0, 0, 0, 1, 1,
0.8331796, -1.188037, 2.518143, 1, 1, 1, 1, 1,
0.8386415, -0.5199135, 1.172803, 1, 1, 1, 1, 1,
0.8463142, -0.215757, 0.7554212, 1, 1, 1, 1, 1,
0.8466671, -0.02060585, 0.5031766, 1, 1, 1, 1, 1,
0.860346, 0.9794549, 2.088104, 1, 1, 1, 1, 1,
0.8608302, -0.3254887, 0.2216276, 1, 1, 1, 1, 1,
0.8648285, 1.055386, -0.1184627, 1, 1, 1, 1, 1,
0.8682595, 0.4159239, 2.573133, 1, 1, 1, 1, 1,
0.8688673, -0.8568221, 2.167747, 1, 1, 1, 1, 1,
0.8695539, -0.1084775, 2.464018, 1, 1, 1, 1, 1,
0.8698666, -1.303038, 2.22718, 1, 1, 1, 1, 1,
0.8726605, 1.761296, 0.8668534, 1, 1, 1, 1, 1,
0.8744804, -1.686465, 2.016433, 1, 1, 1, 1, 1,
0.8797526, -1.357399, 2.009381, 1, 1, 1, 1, 1,
0.8801927, -1.700592, 3.483113, 1, 1, 1, 1, 1,
0.8834789, 1.926304, -1.607108, 0, 0, 1, 1, 1,
0.8860843, 1.577983, 2.56924, 1, 0, 0, 1, 1,
0.8874829, 0.4200619, -0.04794271, 1, 0, 0, 1, 1,
0.8887944, 0.5308911, 1.687222, 1, 0, 0, 1, 1,
0.8908288, -0.6664115, 0.2014346, 1, 0, 0, 1, 1,
0.8915457, -0.210187, 0.6090245, 1, 0, 0, 1, 1,
0.8935518, 0.4956742, 0.8853009, 0, 0, 0, 1, 1,
0.8972941, 0.6958424, -0.6561697, 0, 0, 0, 1, 1,
0.9062592, 0.1363778, 2.289249, 0, 0, 0, 1, 1,
0.9104258, -0.8251427, 1.389327, 0, 0, 0, 1, 1,
0.9125562, 0.003532526, 0.8223625, 0, 0, 0, 1, 1,
0.913041, -0.4997897, 3.244436, 0, 0, 0, 1, 1,
0.9132462, -0.3504835, -0.6940268, 0, 0, 0, 1, 1,
0.9176179, 0.3606177, 1.051718, 1, 1, 1, 1, 1,
0.918658, -0.6849879, 4.095459, 1, 1, 1, 1, 1,
0.9217159, -0.6783292, 3.159467, 1, 1, 1, 1, 1,
0.9334021, -0.8800698, 1.2623, 1, 1, 1, 1, 1,
0.9410564, 0.3308401, 1.179759, 1, 1, 1, 1, 1,
0.9436994, 1.143795, 0.3779589, 1, 1, 1, 1, 1,
0.9455448, -2.180554, 1.279711, 1, 1, 1, 1, 1,
0.963567, -0.05704962, 4.595638, 1, 1, 1, 1, 1,
0.9657848, 0.4005809, 2.41975, 1, 1, 1, 1, 1,
0.9674158, -1.670058, 2.67813, 1, 1, 1, 1, 1,
0.9700888, -1.724574, 4.562326, 1, 1, 1, 1, 1,
0.9725956, 0.3083527, 0.7512552, 1, 1, 1, 1, 1,
0.9902099, -1.037489, 1.106868, 1, 1, 1, 1, 1,
0.9912896, 0.173634, 1.567827, 1, 1, 1, 1, 1,
0.9928816, -0.4824248, 0.9989605, 1, 1, 1, 1, 1,
1.003998, 1.761764, 0.1039231, 0, 0, 1, 1, 1,
1.010768, -1.268629, 3.294925, 1, 0, 0, 1, 1,
1.010869, 0.3047931, 0.4969682, 1, 0, 0, 1, 1,
1.02134, 0.1446026, 0.4966787, 1, 0, 0, 1, 1,
1.025824, 1.73684, 0.6628666, 1, 0, 0, 1, 1,
1.026166, 0.4462424, 0.6752796, 1, 0, 0, 1, 1,
1.026449, -0.3181003, 2.272499, 0, 0, 0, 1, 1,
1.034408, 0.5698008, 2.03236, 0, 0, 0, 1, 1,
1.04001, 0.2115751, 0.2401031, 0, 0, 0, 1, 1,
1.044384, -0.5658936, 2.842088, 0, 0, 0, 1, 1,
1.050488, -0.7556697, 2.461897, 0, 0, 0, 1, 1,
1.05218, 0.4216636, 1.347471, 0, 0, 0, 1, 1,
1.05238, -0.6070042, 1.294719, 0, 0, 0, 1, 1,
1.055234, 0.5174011, 1.303598, 1, 1, 1, 1, 1,
1.06523, 1.375373, 1.058103, 1, 1, 1, 1, 1,
1.075542, 0.2750992, 1.381686, 1, 1, 1, 1, 1,
1.088741, -0.9049429, 0.5704678, 1, 1, 1, 1, 1,
1.089658, 0.814717, 1.693236, 1, 1, 1, 1, 1,
1.090651, 0.4029998, 2.190499, 1, 1, 1, 1, 1,
1.091801, -1.35975, 1.672351, 1, 1, 1, 1, 1,
1.093138, 0.2829668, 2.787549, 1, 1, 1, 1, 1,
1.093588, -0.1925018, 3.339108, 1, 1, 1, 1, 1,
1.096491, 0.780291, 1.359814, 1, 1, 1, 1, 1,
1.101691, 1.38457, 2.734971, 1, 1, 1, 1, 1,
1.102541, -0.02742358, 1.328399, 1, 1, 1, 1, 1,
1.106718, -1.997762, 2.12557, 1, 1, 1, 1, 1,
1.107985, 1.495115, 0.05592262, 1, 1, 1, 1, 1,
1.119312, -0.6109137, 0.5922793, 1, 1, 1, 1, 1,
1.119824, 0.2160757, 1.104595, 0, 0, 1, 1, 1,
1.123793, -0.1380337, 0.4524799, 1, 0, 0, 1, 1,
1.123917, -0.593915, 3.751205, 1, 0, 0, 1, 1,
1.124021, 1.143808, 0.5553633, 1, 0, 0, 1, 1,
1.129582, -0.1286587, 1.896878, 1, 0, 0, 1, 1,
1.132455, 1.260992, 1.157041, 1, 0, 0, 1, 1,
1.138466, 0.02083503, 1.205057, 0, 0, 0, 1, 1,
1.140134, -0.6615085, 4.149985, 0, 0, 0, 1, 1,
1.148664, 0.1245001, 2.415222, 0, 0, 0, 1, 1,
1.150814, -0.07921018, 3.713155, 0, 0, 0, 1, 1,
1.157262, 0.3367362, 2.344644, 0, 0, 0, 1, 1,
1.157786, -1.393996, 0.07387805, 0, 0, 0, 1, 1,
1.165921, 0.2112143, 1.330949, 0, 0, 0, 1, 1,
1.170545, 0.6164351, 1.745109, 1, 1, 1, 1, 1,
1.180759, 1.67307, 1.685297, 1, 1, 1, 1, 1,
1.183832, -1.286307, 1.177543, 1, 1, 1, 1, 1,
1.194459, 0.3418397, 0.4116396, 1, 1, 1, 1, 1,
1.198565, 0.5725214, -0.3236852, 1, 1, 1, 1, 1,
1.198779, 2.750173, 0.866837, 1, 1, 1, 1, 1,
1.210925, -0.4834116, 1.757344, 1, 1, 1, 1, 1,
1.215861, 0.7051651, 0.849665, 1, 1, 1, 1, 1,
1.234015, -0.1417021, 0.8473296, 1, 1, 1, 1, 1,
1.234796, -0.9704317, 2.020347, 1, 1, 1, 1, 1,
1.244752, 1.62716, -0.4643734, 1, 1, 1, 1, 1,
1.252138, 1.015765, -0.1193164, 1, 1, 1, 1, 1,
1.272039, 0.7054095, 1.059442, 1, 1, 1, 1, 1,
1.284753, 0.8536578, 0.3325019, 1, 1, 1, 1, 1,
1.294114, -0.8526804, 1.21798, 1, 1, 1, 1, 1,
1.296281, 0.3666188, -0.001849482, 0, 0, 1, 1, 1,
1.296327, 0.1411621, -0.553817, 1, 0, 0, 1, 1,
1.296704, 0.4911849, 1.774079, 1, 0, 0, 1, 1,
1.300807, -1.327159, 3.145894, 1, 0, 0, 1, 1,
1.303713, 0.3596807, -0.2799881, 1, 0, 0, 1, 1,
1.311858, 0.9297465, 0.1187376, 1, 0, 0, 1, 1,
1.313781, 0.7796166, 1.755553, 0, 0, 0, 1, 1,
1.32717, 0.1454024, -0.753334, 0, 0, 0, 1, 1,
1.330129, 0.7059838, 0.7692515, 0, 0, 0, 1, 1,
1.334163, 1.050067, 0.7065958, 0, 0, 0, 1, 1,
1.350653, 1.670742, 1.608813, 0, 0, 0, 1, 1,
1.351842, 0.8718429, 2.005427, 0, 0, 0, 1, 1,
1.358604, -0.9643874, 2.631084, 0, 0, 0, 1, 1,
1.362335, 0.00505901, 1.094617, 1, 1, 1, 1, 1,
1.363637, -0.5259024, 2.276521, 1, 1, 1, 1, 1,
1.371101, 1.338364, 1.268189, 1, 1, 1, 1, 1,
1.372657, -0.5610148, 1.004005, 1, 1, 1, 1, 1,
1.376239, -0.490445, 2.526933, 1, 1, 1, 1, 1,
1.378032, 0.518198, 1.231386, 1, 1, 1, 1, 1,
1.390224, 0.3460507, 2.834475, 1, 1, 1, 1, 1,
1.392757, 0.6675666, 3.777236, 1, 1, 1, 1, 1,
1.398218, 0.5685976, 0.08885448, 1, 1, 1, 1, 1,
1.403058, -1.36954, 2.308502, 1, 1, 1, 1, 1,
1.40476, -0.7532541, 0.7686666, 1, 1, 1, 1, 1,
1.420725, 1.371527, -0.6641675, 1, 1, 1, 1, 1,
1.439285, -1.622162, 3.071073, 1, 1, 1, 1, 1,
1.439565, 1.399553, 0.3988781, 1, 1, 1, 1, 1,
1.447331, -0.8068178, 1.636844, 1, 1, 1, 1, 1,
1.452058, -0.2941454, 1.308702, 0, 0, 1, 1, 1,
1.478038, 1.6683, 0.6942085, 1, 0, 0, 1, 1,
1.484981, 0.7052449, 0.5539225, 1, 0, 0, 1, 1,
1.485047, 0.7883724, 0.2714836, 1, 0, 0, 1, 1,
1.485426, 0.936707, 0.834212, 1, 0, 0, 1, 1,
1.4891, 0.2171725, 2.803389, 1, 0, 0, 1, 1,
1.513804, -0.6907322, 1.100273, 0, 0, 0, 1, 1,
1.520671, 1.932324, 2.063293, 0, 0, 0, 1, 1,
1.532802, 0.6855505, 3.008158, 0, 0, 0, 1, 1,
1.533839, 0.2084073, 1.335366, 0, 0, 0, 1, 1,
1.537122, -1.057784, 2.495978, 0, 0, 0, 1, 1,
1.537183, -0.509435, 3.403079, 0, 0, 0, 1, 1,
1.541028, 0.326208, 0.7211813, 0, 0, 0, 1, 1,
1.558205, -0.885141, 2.622656, 1, 1, 1, 1, 1,
1.558869, -0.4481378, 0.4110147, 1, 1, 1, 1, 1,
1.560339, 1.681328, 0.8440793, 1, 1, 1, 1, 1,
1.560692, 2.241013, 0.7323664, 1, 1, 1, 1, 1,
1.566981, -1.482313, 3.173121, 1, 1, 1, 1, 1,
1.568706, -0.1421941, 0.3047917, 1, 1, 1, 1, 1,
1.569046, 1.391394, 1.913526, 1, 1, 1, 1, 1,
1.569581, 0.5274773, 1.324776, 1, 1, 1, 1, 1,
1.580382, 1.350737, 1.285736, 1, 1, 1, 1, 1,
1.594033, -0.6927408, 1.414501, 1, 1, 1, 1, 1,
1.629048, 1.843221, 1.803534, 1, 1, 1, 1, 1,
1.633181, 1.641386, 1.391274, 1, 1, 1, 1, 1,
1.635019, -0.132436, 1.419592, 1, 1, 1, 1, 1,
1.636614, 0.5228958, 1.484547, 1, 1, 1, 1, 1,
1.643693, 0.5495926, 2.321057, 1, 1, 1, 1, 1,
1.653868, -0.5142056, 2.025125, 0, 0, 1, 1, 1,
1.670304, -0.04986282, 1.934413, 1, 0, 0, 1, 1,
1.672955, 0.4383486, 1.966207, 1, 0, 0, 1, 1,
1.692004, 0.9200669, 1.054709, 1, 0, 0, 1, 1,
1.696611, -0.4823081, 1.186985, 1, 0, 0, 1, 1,
1.699396, 1.996152, 1.447365, 1, 0, 0, 1, 1,
1.740742, 3.146911, 0.3477089, 0, 0, 0, 1, 1,
1.751144, 0.5802231, -0.9177608, 0, 0, 0, 1, 1,
1.759063, 0.3238288, 1.238804, 0, 0, 0, 1, 1,
1.761209, 0.2481015, 0.1563027, 0, 0, 0, 1, 1,
1.762444, 1.497264, 1.522591, 0, 0, 0, 1, 1,
1.793003, 0.4595778, 1.034652, 0, 0, 0, 1, 1,
1.797011, 0.2709278, 1.479817, 0, 0, 0, 1, 1,
1.83386, 2.458698, 0.383905, 1, 1, 1, 1, 1,
1.873475, -0.4833997, 2.079944, 1, 1, 1, 1, 1,
1.88849, -0.5871739, 0.1934793, 1, 1, 1, 1, 1,
1.911087, 0.1224274, 1.135023, 1, 1, 1, 1, 1,
1.967627, 0.02764886, 2.118097, 1, 1, 1, 1, 1,
1.96801, -1.43954, 3.014474, 1, 1, 1, 1, 1,
1.969289, 1.707775, 1.911089, 1, 1, 1, 1, 1,
1.974894, -1.163245, 1.796903, 1, 1, 1, 1, 1,
2.016001, -0.3850291, 1.15252, 1, 1, 1, 1, 1,
2.039701, 1.185908, 1.229489, 1, 1, 1, 1, 1,
2.041092, -1.803533, 1.311223, 1, 1, 1, 1, 1,
2.073073, 1.707741, -0.2062317, 1, 1, 1, 1, 1,
2.081652, -0.839259, 2.922665, 1, 1, 1, 1, 1,
2.094538, 0.6159305, 2.35458, 1, 1, 1, 1, 1,
2.123896, -0.1969133, 2.121799, 1, 1, 1, 1, 1,
2.143317, 0.6085529, 0.3373241, 0, 0, 1, 1, 1,
2.144712, -0.3947153, 2.342412, 1, 0, 0, 1, 1,
2.173115, -0.540689, 1.74031, 1, 0, 0, 1, 1,
2.184103, -0.6631147, 2.499788, 1, 0, 0, 1, 1,
2.188628, -0.1988722, 1.725364, 1, 0, 0, 1, 1,
2.193227, 0.8280184, 2.985465, 1, 0, 0, 1, 1,
2.227841, 1.395477, 1.599306, 0, 0, 0, 1, 1,
2.228809, 0.6973483, 0.1610272, 0, 0, 0, 1, 1,
2.229095, 0.2283993, 0.6474901, 0, 0, 0, 1, 1,
2.295846, -1.545737, 1.633954, 0, 0, 0, 1, 1,
2.332175, -0.7389967, 1.673292, 0, 0, 0, 1, 1,
2.363039, 0.5429435, 1.169783, 0, 0, 0, 1, 1,
2.431343, -0.3498991, 1.559451, 0, 0, 0, 1, 1,
2.477445, -1.743632, 1.933311, 1, 1, 1, 1, 1,
2.485178, 0.21502, 0.9154808, 1, 1, 1, 1, 1,
2.554652, -0.4055781, 0.8416294, 1, 1, 1, 1, 1,
2.573602, 0.7161746, 1.152335, 1, 1, 1, 1, 1,
2.63883, -0.5432137, 0.9657969, 1, 1, 1, 1, 1,
3.066238, 0.1365541, -1.073474, 1, 1, 1, 1, 1,
3.419454, -0.7975212, 2.133759, 1, 1, 1, 1, 1
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
var radius = 9.814979;
var distance = 34.47469;
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
mvMatrix.translate( -0.2645701, -0.1389666, 0.3191276 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.47469);
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
