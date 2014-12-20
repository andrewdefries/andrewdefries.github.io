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
-2.625979, 1.354171, -0.6025236, 1, 0, 0, 1,
-2.550366, -1.139043, -2.452026, 1, 0.007843138, 0, 1,
-2.507205, -0.4050226, -1.954784, 1, 0.01176471, 0, 1,
-2.478076, -0.8049049, -2.856385, 1, 0.01960784, 0, 1,
-2.459683, -0.3614303, -0.4931795, 1, 0.02352941, 0, 1,
-2.322021, -0.1263982, -1.678994, 1, 0.03137255, 0, 1,
-2.313607, 0.7396226, -1.935087, 1, 0.03529412, 0, 1,
-2.304168, 0.6777527, -1.780374, 1, 0.04313726, 0, 1,
-2.259345, 1.193142, -0.7731856, 1, 0.04705882, 0, 1,
-2.147904, -1.628741, -0.9104829, 1, 0.05490196, 0, 1,
-2.126825, 0.6699246, -1.593604, 1, 0.05882353, 0, 1,
-2.123257, -0.4152604, -1.271351, 1, 0.06666667, 0, 1,
-2.119375, -0.5977551, -2.563892, 1, 0.07058824, 0, 1,
-2.118901, 1.328081, -0.2445701, 1, 0.07843138, 0, 1,
-2.110106, 0.8915665, -2.970825, 1, 0.08235294, 0, 1,
-2.072715, -0.07067532, -1.481041, 1, 0.09019608, 0, 1,
-2.07223, 0.4632401, -2.280538, 1, 0.09411765, 0, 1,
-2.07112, 1.114395, -2.257428, 1, 0.1019608, 0, 1,
-2.060689, -0.6763682, -2.528047, 1, 0.1098039, 0, 1,
-2.038284, 0.8148125, -0.6972468, 1, 0.1137255, 0, 1,
-2.028534, -1.056186, 0.1089236, 1, 0.1215686, 0, 1,
-2.02847, -2.093428, -1.947646, 1, 0.1254902, 0, 1,
-2.027179, 0.6861731, -0.5322739, 1, 0.1333333, 0, 1,
-1.979642, 0.7139155, -0.8154615, 1, 0.1372549, 0, 1,
-1.972772, -0.8045561, -2.075586, 1, 0.145098, 0, 1,
-1.963962, -0.03477512, -0.720486, 1, 0.1490196, 0, 1,
-1.952904, -0.492122, -3.363496, 1, 0.1568628, 0, 1,
-1.919631, 0.2124541, -0.7512251, 1, 0.1607843, 0, 1,
-1.888819, 0.1726748, -3.059471, 1, 0.1686275, 0, 1,
-1.84954, -0.6472386, -3.132489, 1, 0.172549, 0, 1,
-1.849495, -1.71216, -2.970171, 1, 0.1803922, 0, 1,
-1.837393, 0.009716494, -3.216047, 1, 0.1843137, 0, 1,
-1.815836, -0.5611264, -3.569896, 1, 0.1921569, 0, 1,
-1.791289, -0.54061, -2.272879, 1, 0.1960784, 0, 1,
-1.791166, -0.1374236, -0.7037929, 1, 0.2039216, 0, 1,
-1.779471, 1.629964, -0.7801282, 1, 0.2117647, 0, 1,
-1.771394, 0.33935, -1.911065, 1, 0.2156863, 0, 1,
-1.753549, -0.116672, -1.978459, 1, 0.2235294, 0, 1,
-1.749367, 0.2764406, -1.29259, 1, 0.227451, 0, 1,
-1.721604, -2.175713, -2.017997, 1, 0.2352941, 0, 1,
-1.719831, -0.4038225, -2.825737, 1, 0.2392157, 0, 1,
-1.718194, -1.189231, -0.6005031, 1, 0.2470588, 0, 1,
-1.715847, -0.3918531, 1.102289, 1, 0.2509804, 0, 1,
-1.702781, -0.1608634, -1.225352, 1, 0.2588235, 0, 1,
-1.678368, -0.2850152, -2.842319, 1, 0.2627451, 0, 1,
-1.643814, -0.5290598, -2.429757, 1, 0.2705882, 0, 1,
-1.624642, -1.58497, -1.683974, 1, 0.2745098, 0, 1,
-1.623984, 1.062708, -1.287425, 1, 0.282353, 0, 1,
-1.591157, 0.6128704, -0.8330534, 1, 0.2862745, 0, 1,
-1.569759, -1.100868, -2.435245, 1, 0.2941177, 0, 1,
-1.568484, 0.2393296, -0.643383, 1, 0.3019608, 0, 1,
-1.560834, 0.7932681, -0.6210753, 1, 0.3058824, 0, 1,
-1.559004, 0.7822393, -0.3550609, 1, 0.3137255, 0, 1,
-1.555457, 0.3108271, -1.479602, 1, 0.3176471, 0, 1,
-1.548863, -1.400213, -0.0142521, 1, 0.3254902, 0, 1,
-1.540603, -1.355425, -2.202064, 1, 0.3294118, 0, 1,
-1.513791, 0.8857074, -0.9724435, 1, 0.3372549, 0, 1,
-1.506303, -0.8791175, -2.919708, 1, 0.3411765, 0, 1,
-1.505895, -0.4379101, -1.817099, 1, 0.3490196, 0, 1,
-1.500492, 0.8467765, -1.057472, 1, 0.3529412, 0, 1,
-1.492347, -1.365973, -3.707052, 1, 0.3607843, 0, 1,
-1.471379, -0.9628796, -2.865777, 1, 0.3647059, 0, 1,
-1.449676, -0.1582371, -0.9529303, 1, 0.372549, 0, 1,
-1.436742, 0.4862109, -0.6616225, 1, 0.3764706, 0, 1,
-1.43535, -0.0857089, -1.207126, 1, 0.3843137, 0, 1,
-1.429753, 0.03650936, -2.657281, 1, 0.3882353, 0, 1,
-1.429474, -0.09299777, -1.118126, 1, 0.3960784, 0, 1,
-1.425255, -0.02226321, -2.900413, 1, 0.4039216, 0, 1,
-1.415309, 0.9611321, 0.397367, 1, 0.4078431, 0, 1,
-1.412227, -0.6208379, -2.690865, 1, 0.4156863, 0, 1,
-1.411371, -0.1703784, -3.249348, 1, 0.4196078, 0, 1,
-1.411286, 1.100912, -0.7698992, 1, 0.427451, 0, 1,
-1.403245, 1.64005, -1.409103, 1, 0.4313726, 0, 1,
-1.39141, -0.1773851, -0.4408333, 1, 0.4392157, 0, 1,
-1.388246, -0.1578031, -2.210562, 1, 0.4431373, 0, 1,
-1.384886, 0.4148457, -1.020036, 1, 0.4509804, 0, 1,
-1.373585, -0.2233335, -1.776186, 1, 0.454902, 0, 1,
-1.368035, 0.6675178, -1.906982, 1, 0.4627451, 0, 1,
-1.367866, -0.3248394, -1.926635, 1, 0.4666667, 0, 1,
-1.314919, 0.544451, -3.086289, 1, 0.4745098, 0, 1,
-1.310251, -0.7093983, -1.139006, 1, 0.4784314, 0, 1,
-1.309526, -1.884923, -1.59228, 1, 0.4862745, 0, 1,
-1.308303, 0.5566279, -0.6048932, 1, 0.4901961, 0, 1,
-1.301619, -0.1182795, -1.657179, 1, 0.4980392, 0, 1,
-1.292355, -0.6955758, -1.265378, 1, 0.5058824, 0, 1,
-1.286887, -0.008843406, -1.405433, 1, 0.509804, 0, 1,
-1.283833, -1.176662, -2.721791, 1, 0.5176471, 0, 1,
-1.279322, 1.023107, -2.206854, 1, 0.5215687, 0, 1,
-1.273842, 1.538777, 0.8640702, 1, 0.5294118, 0, 1,
-1.27024, -0.7039034, -2.702984, 1, 0.5333334, 0, 1,
-1.266886, -0.5209605, -4.394763, 1, 0.5411765, 0, 1,
-1.264379, -1.45576, -4.025323, 1, 0.5450981, 0, 1,
-1.261078, -2.696246, -1.588789, 1, 0.5529412, 0, 1,
-1.250659, -0.08351658, -1.642308, 1, 0.5568628, 0, 1,
-1.241458, 0.6635119, -0.04721382, 1, 0.5647059, 0, 1,
-1.235286, -0.05557504, -1.184124, 1, 0.5686275, 0, 1,
-1.231801, 0.2078479, -2.40732, 1, 0.5764706, 0, 1,
-1.22675, 0.9081317, 0.4142662, 1, 0.5803922, 0, 1,
-1.226495, 0.101614, -1.324439, 1, 0.5882353, 0, 1,
-1.226228, -0.07987274, -1.643681, 1, 0.5921569, 0, 1,
-1.223016, -1.155625, -1.264258, 1, 0.6, 0, 1,
-1.217916, 0.1910683, -1.010653, 1, 0.6078432, 0, 1,
-1.215379, -0.2721905, -3.818445, 1, 0.6117647, 0, 1,
-1.210096, 0.8438482, -1.425634, 1, 0.6196079, 0, 1,
-1.202229, 1.742921, -0.7448171, 1, 0.6235294, 0, 1,
-1.201691, 0.903364, -0.01049804, 1, 0.6313726, 0, 1,
-1.193095, 0.3965396, -1.959787, 1, 0.6352941, 0, 1,
-1.191767, 1.445097, -0.9988019, 1, 0.6431373, 0, 1,
-1.191289, -0.8009753, -1.282909, 1, 0.6470588, 0, 1,
-1.18882, 0.01790467, -2.411719, 1, 0.654902, 0, 1,
-1.186321, -1.122609, -2.290016, 1, 0.6588235, 0, 1,
-1.182459, 0.8563718, -0.4046211, 1, 0.6666667, 0, 1,
-1.179985, 0.07940469, -1.110545, 1, 0.6705883, 0, 1,
-1.175178, 0.2023705, -1.635214, 1, 0.6784314, 0, 1,
-1.16173, -1.270285, -1.786525, 1, 0.682353, 0, 1,
-1.160555, -0.6359774, -1.844892, 1, 0.6901961, 0, 1,
-1.149714, -0.01064454, -2.236066, 1, 0.6941177, 0, 1,
-1.149201, -1.384179, -3.449228, 1, 0.7019608, 0, 1,
-1.148012, 0.5339836, -0.756496, 1, 0.7098039, 0, 1,
-1.146609, -1.527046, -1.348696, 1, 0.7137255, 0, 1,
-1.14482, 0.8890154, -0.6208302, 1, 0.7215686, 0, 1,
-1.143757, 0.6788471, -0.5359551, 1, 0.7254902, 0, 1,
-1.138654, -0.125501, -2.433766, 1, 0.7333333, 0, 1,
-1.136419, 0.1751206, -2.472009, 1, 0.7372549, 0, 1,
-1.132702, -0.5555105, -1.165728, 1, 0.7450981, 0, 1,
-1.131763, 0.3015712, 0.04327443, 1, 0.7490196, 0, 1,
-1.110748, -0.1852256, -1.512448, 1, 0.7568628, 0, 1,
-1.106934, -0.9347824, -3.657944, 1, 0.7607843, 0, 1,
-1.105853, 0.2961956, 0.2205703, 1, 0.7686275, 0, 1,
-1.105576, 1.578808, -0.5060375, 1, 0.772549, 0, 1,
-1.098847, -0.5118981, -3.352171, 1, 0.7803922, 0, 1,
-1.093422, -0.1692048, -2.384334, 1, 0.7843137, 0, 1,
-1.089498, -0.1265625, -1.42102, 1, 0.7921569, 0, 1,
-1.084089, -1.420038, -2.395366, 1, 0.7960784, 0, 1,
-1.082023, -0.6817519, -4.208639, 1, 0.8039216, 0, 1,
-1.079698, -0.7463121, -3.118964, 1, 0.8117647, 0, 1,
-1.078891, -0.4353808, -2.609281, 1, 0.8156863, 0, 1,
-1.070358, -0.3535665, -1.590942, 1, 0.8235294, 0, 1,
-1.067133, 0.1075674, -2.553312, 1, 0.827451, 0, 1,
-1.066886, -0.3610632, -3.860838, 1, 0.8352941, 0, 1,
-1.05701, 0.5001031, -1.82412, 1, 0.8392157, 0, 1,
-1.05644, 0.6394096, -1.540947, 1, 0.8470588, 0, 1,
-1.054901, 0.932838, -0.2136573, 1, 0.8509804, 0, 1,
-1.052944, -0.01136321, -2.583155, 1, 0.8588235, 0, 1,
-1.039812, -0.08581893, -3.810625, 1, 0.8627451, 0, 1,
-1.039614, -0.06694535, -1.769178, 1, 0.8705882, 0, 1,
-1.039244, -0.1802703, -3.596147, 1, 0.8745098, 0, 1,
-1.030874, 0.5534116, -2.291286, 1, 0.8823529, 0, 1,
-1.026439, 0.09620299, -1.948575, 1, 0.8862745, 0, 1,
-1.025673, 1.421282, -0.2074393, 1, 0.8941177, 0, 1,
-1.019505, 0.6049442, -0.6099875, 1, 0.8980392, 0, 1,
-1.016682, -0.7297429, -2.829427, 1, 0.9058824, 0, 1,
-1.003667, 1.001809, 0.6464543, 1, 0.9137255, 0, 1,
-1.000179, 0.6888142, -2.396027, 1, 0.9176471, 0, 1,
-0.9997714, -0.5061942, -1.571222, 1, 0.9254902, 0, 1,
-0.9922386, 1.193874, 0.0271577, 1, 0.9294118, 0, 1,
-0.9910156, 0.6329502, -2.12353, 1, 0.9372549, 0, 1,
-0.9807244, 1.556454, -0.7793832, 1, 0.9411765, 0, 1,
-0.978258, 1.368029, -0.7091957, 1, 0.9490196, 0, 1,
-0.9685936, 0.7600553, -0.2892853, 1, 0.9529412, 0, 1,
-0.965858, 0.9183396, -0.3203162, 1, 0.9607843, 0, 1,
-0.9587899, -2.653192, -2.163272, 1, 0.9647059, 0, 1,
-0.9570736, -0.6973291, -1.131915, 1, 0.972549, 0, 1,
-0.9545291, 0.5225387, -0.5538201, 1, 0.9764706, 0, 1,
-0.9542946, -0.9963685, -2.087073, 1, 0.9843137, 0, 1,
-0.9515356, 1.320089, -0.3006452, 1, 0.9882353, 0, 1,
-0.9430994, -0.07892318, -0.3417968, 1, 0.9960784, 0, 1,
-0.9341194, 0.6344892, -0.4455274, 0.9960784, 1, 0, 1,
-0.9326966, 1.024378, -0.8072519, 0.9921569, 1, 0, 1,
-0.9308587, -0.05379215, -0.3370292, 0.9843137, 1, 0, 1,
-0.926396, -0.1616445, -1.10848, 0.9803922, 1, 0, 1,
-0.9246926, 0.1603088, -0.9570256, 0.972549, 1, 0, 1,
-0.9214044, -0.8972203, -2.759702, 0.9686275, 1, 0, 1,
-0.9157258, 0.2374123, -1.578926, 0.9607843, 1, 0, 1,
-0.9127086, 0.7959564, 0.4485953, 0.9568627, 1, 0, 1,
-0.9122741, 0.5479949, -0.7851966, 0.9490196, 1, 0, 1,
-0.9121044, 0.2791312, -2.091771, 0.945098, 1, 0, 1,
-0.9074194, 0.2379103, -1.044661, 0.9372549, 1, 0, 1,
-0.9054147, 0.4999619, 0.2128974, 0.9333333, 1, 0, 1,
-0.8988691, -0.1998816, -2.462514, 0.9254902, 1, 0, 1,
-0.8986719, -0.691709, -3.367077, 0.9215686, 1, 0, 1,
-0.8983407, -0.7013882, -1.534688, 0.9137255, 1, 0, 1,
-0.8894783, -0.08465339, -0.6791101, 0.9098039, 1, 0, 1,
-0.887767, -0.3462754, -0.4237583, 0.9019608, 1, 0, 1,
-0.876925, -0.7293077, -1.950346, 0.8941177, 1, 0, 1,
-0.8747032, 1.16563, -0.9033269, 0.8901961, 1, 0, 1,
-0.8714381, 1.110264, -1.212584, 0.8823529, 1, 0, 1,
-0.8660015, -0.17309, -2.330177, 0.8784314, 1, 0, 1,
-0.846546, -0.1092204, -1.110546, 0.8705882, 1, 0, 1,
-0.8439214, -0.2929423, -0.8682746, 0.8666667, 1, 0, 1,
-0.8434744, -0.4485133, -2.248139, 0.8588235, 1, 0, 1,
-0.8398972, 0.836353, -0.4793321, 0.854902, 1, 0, 1,
-0.8393233, -0.5726978, -0.4403, 0.8470588, 1, 0, 1,
-0.8377345, 1.294817, 1.033362, 0.8431373, 1, 0, 1,
-0.8369592, 1.69515, -0.4034406, 0.8352941, 1, 0, 1,
-0.8365229, -0.03811373, -1.557291, 0.8313726, 1, 0, 1,
-0.8353596, 0.1100444, -2.7958, 0.8235294, 1, 0, 1,
-0.8339806, 1.121182, -0.1412497, 0.8196079, 1, 0, 1,
-0.8320295, -0.6460039, -2.610604, 0.8117647, 1, 0, 1,
-0.8278952, 0.270184, -1.492736, 0.8078431, 1, 0, 1,
-0.8273133, 0.644426, -0.6534784, 0.8, 1, 0, 1,
-0.8132123, 0.2531482, -1.82138, 0.7921569, 1, 0, 1,
-0.8103193, 1.125161, -2.23191, 0.7882353, 1, 0, 1,
-0.8052478, -0.3741091, -1.959107, 0.7803922, 1, 0, 1,
-0.8043128, 0.3202927, -2.80518, 0.7764706, 1, 0, 1,
-0.7979099, 0.09493794, -0.9828988, 0.7686275, 1, 0, 1,
-0.796765, 1.06793, 0.5175197, 0.7647059, 1, 0, 1,
-0.7937192, -1.703686, -1.180997, 0.7568628, 1, 0, 1,
-0.7929151, 1.241165, -1.216414, 0.7529412, 1, 0, 1,
-0.7913876, -0.4374841, -2.941125, 0.7450981, 1, 0, 1,
-0.7881337, -0.5620465, -0.8454813, 0.7411765, 1, 0, 1,
-0.7831449, -0.3297342, -1.904351, 0.7333333, 1, 0, 1,
-0.780274, 2.32639, 1.283885, 0.7294118, 1, 0, 1,
-0.7760692, 0.2097481, -0.790058, 0.7215686, 1, 0, 1,
-0.7747784, 0.2641072, -0.7595651, 0.7176471, 1, 0, 1,
-0.7741721, 0.4982356, -2.579159, 0.7098039, 1, 0, 1,
-0.7738057, 0.6147465, -1.921784, 0.7058824, 1, 0, 1,
-0.7720097, 1.185963, -2.481837, 0.6980392, 1, 0, 1,
-0.7674527, -1.513111, -4.112065, 0.6901961, 1, 0, 1,
-0.7651289, 0.9717318, -0.2238176, 0.6862745, 1, 0, 1,
-0.7635279, 0.5397614, -1.682301, 0.6784314, 1, 0, 1,
-0.7562901, -0.7498069, -2.689188, 0.6745098, 1, 0, 1,
-0.7557973, 0.2460298, -2.039753, 0.6666667, 1, 0, 1,
-0.7525879, 0.6653563, -2.540143, 0.6627451, 1, 0, 1,
-0.7523428, 1.202307, -0.2650851, 0.654902, 1, 0, 1,
-0.7521656, 0.2888698, -0.9922423, 0.6509804, 1, 0, 1,
-0.7448648, 0.2625337, -0.8231676, 0.6431373, 1, 0, 1,
-0.7438278, 0.688768, -2.050365, 0.6392157, 1, 0, 1,
-0.7390844, -3.553408, -2.058661, 0.6313726, 1, 0, 1,
-0.7294021, -0.477929, -3.077335, 0.627451, 1, 0, 1,
-0.7281716, 0.2416522, -3.145441, 0.6196079, 1, 0, 1,
-0.7276932, -0.838965, -3.785507, 0.6156863, 1, 0, 1,
-0.7206084, -0.2131342, -2.169219, 0.6078432, 1, 0, 1,
-0.7156224, -0.1103801, -2.126896, 0.6039216, 1, 0, 1,
-0.7150229, -0.3341316, -1.168138, 0.5960785, 1, 0, 1,
-0.7146705, -1.245417, -3.557524, 0.5882353, 1, 0, 1,
-0.7118366, 0.4690879, -1.86824, 0.5843138, 1, 0, 1,
-0.7114556, 2.450387, -1.376526, 0.5764706, 1, 0, 1,
-0.708733, 0.7508461, 1.231688, 0.572549, 1, 0, 1,
-0.7049426, -0.5254891, -3.325149, 0.5647059, 1, 0, 1,
-0.7036904, 1.894597, -0.5347745, 0.5607843, 1, 0, 1,
-0.702501, 1.515171, -0.6641448, 0.5529412, 1, 0, 1,
-0.6980003, 0.8310491, 0.0345769, 0.5490196, 1, 0, 1,
-0.6958399, -1.236427, -2.172844, 0.5411765, 1, 0, 1,
-0.6870119, 0.05484863, -1.184725, 0.5372549, 1, 0, 1,
-0.6828604, 0.2037233, -2.712206, 0.5294118, 1, 0, 1,
-0.6825123, 0.5716882, 0.04332275, 0.5254902, 1, 0, 1,
-0.6807849, -0.1847934, -1.717733, 0.5176471, 1, 0, 1,
-0.6803518, -0.1066011, -3.167456, 0.5137255, 1, 0, 1,
-0.6711845, 1.679451, -2.300138, 0.5058824, 1, 0, 1,
-0.6705997, -0.7083116, -3.436055, 0.5019608, 1, 0, 1,
-0.6583169, -0.3477661, -1.877161, 0.4941176, 1, 0, 1,
-0.6582731, -1.149186, -3.695715, 0.4862745, 1, 0, 1,
-0.6571078, 0.7407068, 0.2708664, 0.4823529, 1, 0, 1,
-0.6566988, -0.260762, -1.4408, 0.4745098, 1, 0, 1,
-0.6527846, 0.6135724, -0.6645479, 0.4705882, 1, 0, 1,
-0.6489579, 0.3288611, -1.015087, 0.4627451, 1, 0, 1,
-0.6486123, -1.912998, -2.907939, 0.4588235, 1, 0, 1,
-0.6408697, 1.311966, -0.4269058, 0.4509804, 1, 0, 1,
-0.6341935, -1.03793, -3.181721, 0.4470588, 1, 0, 1,
-0.6329655, -0.3745931, -1.820736, 0.4392157, 1, 0, 1,
-0.6326968, 0.8923552, -0.990831, 0.4352941, 1, 0, 1,
-0.6308308, 0.1850833, -1.495759, 0.427451, 1, 0, 1,
-0.6288034, 0.01903712, -2.250408, 0.4235294, 1, 0, 1,
-0.6246405, -0.5538667, -2.410107, 0.4156863, 1, 0, 1,
-0.6210625, 1.009424, -1.031018, 0.4117647, 1, 0, 1,
-0.6190245, -1.730183, -2.330533, 0.4039216, 1, 0, 1,
-0.6181098, -1.020521, -3.32578, 0.3960784, 1, 0, 1,
-0.6145, -2.208076, -3.842768, 0.3921569, 1, 0, 1,
-0.6094971, 1.494385, -0.05550494, 0.3843137, 1, 0, 1,
-0.609069, 1.759425, -0.7523276, 0.3803922, 1, 0, 1,
-0.6082965, 1.728715, 0.7871692, 0.372549, 1, 0, 1,
-0.6065903, 0.2137892, -0.9526667, 0.3686275, 1, 0, 1,
-0.5992981, 0.1579788, -1.596178, 0.3607843, 1, 0, 1,
-0.5992572, -0.3317603, -1.960899, 0.3568628, 1, 0, 1,
-0.5977435, 1.873247, -1.273675, 0.3490196, 1, 0, 1,
-0.5879976, -1.337235, -2.337443, 0.345098, 1, 0, 1,
-0.5844148, 0.3276469, -0.4198081, 0.3372549, 1, 0, 1,
-0.5798661, 0.2297288, 0.1430383, 0.3333333, 1, 0, 1,
-0.5723177, 0.9900316, 1.659626, 0.3254902, 1, 0, 1,
-0.5708368, -2.016405, -0.9142042, 0.3215686, 1, 0, 1,
-0.5682411, 0.5187683, -2.044611, 0.3137255, 1, 0, 1,
-0.5603297, 0.02453552, -0.4599405, 0.3098039, 1, 0, 1,
-0.5599259, -0.7874963, -1.880242, 0.3019608, 1, 0, 1,
-0.5569899, 0.3514304, -2.427423, 0.2941177, 1, 0, 1,
-0.5478475, 0.1355408, -2.64053, 0.2901961, 1, 0, 1,
-0.5461879, -0.4380184, -2.742021, 0.282353, 1, 0, 1,
-0.5445919, -1.067815, -2.640579, 0.2784314, 1, 0, 1,
-0.5422707, 1.685329, 0.7158212, 0.2705882, 1, 0, 1,
-0.5392631, 1.140715, -0.7257904, 0.2666667, 1, 0, 1,
-0.5391428, -0.323819, -1.496777, 0.2588235, 1, 0, 1,
-0.534437, -0.3378816, -1.768429, 0.254902, 1, 0, 1,
-0.53117, 1.000207, -0.6291084, 0.2470588, 1, 0, 1,
-0.5274617, -1.729051, -5.513309, 0.2431373, 1, 0, 1,
-0.5247564, -0.8114283, -2.063469, 0.2352941, 1, 0, 1,
-0.5244629, 1.266526, -2.265378, 0.2313726, 1, 0, 1,
-0.5236965, 1.457058, -1.050525, 0.2235294, 1, 0, 1,
-0.5217567, 1.779283, -0.4068027, 0.2196078, 1, 0, 1,
-0.5205005, 0.1249369, -0.8236033, 0.2117647, 1, 0, 1,
-0.5195791, -0.2295974, -1.062119, 0.2078431, 1, 0, 1,
-0.5195728, 0.2503715, 1.654542, 0.2, 1, 0, 1,
-0.5171409, -0.06923164, -1.176786, 0.1921569, 1, 0, 1,
-0.5167245, 0.9618467, -1.524621, 0.1882353, 1, 0, 1,
-0.5164162, -0.5850819, -2.678423, 0.1803922, 1, 0, 1,
-0.5155743, -0.4647835, -3.126688, 0.1764706, 1, 0, 1,
-0.5152912, 0.242721, -0.9792387, 0.1686275, 1, 0, 1,
-0.5147812, -0.4747104, -2.048374, 0.1647059, 1, 0, 1,
-0.5116765, 1.163292, -0.4694677, 0.1568628, 1, 0, 1,
-0.5058958, -1.496464, -3.529857, 0.1529412, 1, 0, 1,
-0.5031474, 1.637967, 0.5531737, 0.145098, 1, 0, 1,
-0.4992053, -0.08348124, -0.929839, 0.1411765, 1, 0, 1,
-0.4965651, 0.8101377, -1.109181, 0.1333333, 1, 0, 1,
-0.4955834, 1.873988, 1.446334, 0.1294118, 1, 0, 1,
-0.4950766, 0.8904545, 0.01605014, 0.1215686, 1, 0, 1,
-0.4939315, -0.4497857, -1.22747, 0.1176471, 1, 0, 1,
-0.4901347, -2.236651, -3.864673, 0.1098039, 1, 0, 1,
-0.489499, -0.5990233, -3.283289, 0.1058824, 1, 0, 1,
-0.4888844, 0.06698729, -2.760564, 0.09803922, 1, 0, 1,
-0.4851298, 0.6345121, -0.6168377, 0.09019608, 1, 0, 1,
-0.4845092, -0.2832642, -1.489301, 0.08627451, 1, 0, 1,
-0.4838219, 0.1524368, -0.6072783, 0.07843138, 1, 0, 1,
-0.4836091, 0.3153503, -1.450432, 0.07450981, 1, 0, 1,
-0.4786972, -0.1362921, -1.153025, 0.06666667, 1, 0, 1,
-0.4750373, 0.5457261, -1.42385, 0.0627451, 1, 0, 1,
-0.4748263, 0.3797973, -0.278839, 0.05490196, 1, 0, 1,
-0.4746346, 0.5423462, -0.6170521, 0.05098039, 1, 0, 1,
-0.4741502, -0.0108505, -1.753109, 0.04313726, 1, 0, 1,
-0.4735053, 0.9774989, 2.369148, 0.03921569, 1, 0, 1,
-0.469759, 0.7920082, 0.2113978, 0.03137255, 1, 0, 1,
-0.4691782, -0.2778746, -2.073624, 0.02745098, 1, 0, 1,
-0.4583456, -1.474868, -1.25833, 0.01960784, 1, 0, 1,
-0.4535688, -0.1687939, -3.499796, 0.01568628, 1, 0, 1,
-0.451947, -0.6195341, -4.782886, 0.007843138, 1, 0, 1,
-0.449032, -0.9841954, -4.004992, 0.003921569, 1, 0, 1,
-0.4484943, -0.5484888, -2.691191, 0, 1, 0.003921569, 1,
-0.4451664, 1.064841, 0.5744236, 0, 1, 0.01176471, 1,
-0.4451554, -1.166643, -4.883551, 0, 1, 0.01568628, 1,
-0.4377962, -0.3253991, -2.802118, 0, 1, 0.02352941, 1,
-0.4354995, -1.348675, -3.547729, 0, 1, 0.02745098, 1,
-0.4333222, 0.6377115, -1.091772, 0, 1, 0.03529412, 1,
-0.4313852, 0.5580912, 0.488427, 0, 1, 0.03921569, 1,
-0.431314, -0.5001502, -0.9929845, 0, 1, 0.04705882, 1,
-0.430364, 0.3563326, -0.5150748, 0, 1, 0.05098039, 1,
-0.4267612, 0.9314173, -0.3757236, 0, 1, 0.05882353, 1,
-0.4196605, 0.3469499, -0.9462051, 0, 1, 0.0627451, 1,
-0.4195168, 0.4339457, -1.657227, 0, 1, 0.07058824, 1,
-0.4186005, 1.357672, 0.168249, 0, 1, 0.07450981, 1,
-0.4174741, -0.8502976, -2.634266, 0, 1, 0.08235294, 1,
-0.4141871, 1.163332, -0.3959299, 0, 1, 0.08627451, 1,
-0.4114897, 2.061582, 0.1335343, 0, 1, 0.09411765, 1,
-0.4079358, 0.5603429, -2.910485, 0, 1, 0.1019608, 1,
-0.4067743, 1.760036, -1.345286, 0, 1, 0.1058824, 1,
-0.4020165, 1.416071, -0.08700303, 0, 1, 0.1137255, 1,
-0.3986707, -1.003682, -4.182428, 0, 1, 0.1176471, 1,
-0.3969021, 0.7856774, 0.7368579, 0, 1, 0.1254902, 1,
-0.3953839, 0.9268848, -0.5838987, 0, 1, 0.1294118, 1,
-0.3934878, 0.12786, -2.462919, 0, 1, 0.1372549, 1,
-0.3914466, 0.04457829, -1.712863, 0, 1, 0.1411765, 1,
-0.3891096, -1.749979, -2.332443, 0, 1, 0.1490196, 1,
-0.3854154, 0.1577148, -1.394704, 0, 1, 0.1529412, 1,
-0.3807054, 0.06907501, -3.391567, 0, 1, 0.1607843, 1,
-0.3807032, -1.109581, -3.115963, 0, 1, 0.1647059, 1,
-0.3792464, 2.235174, -1.683796, 0, 1, 0.172549, 1,
-0.3778097, 0.04821315, -3.073038, 0, 1, 0.1764706, 1,
-0.3720687, -0.2491415, -2.455876, 0, 1, 0.1843137, 1,
-0.3705344, 0.9088513, -1.321787, 0, 1, 0.1882353, 1,
-0.3613044, 0.01381136, -2.595251, 0, 1, 0.1960784, 1,
-0.3600415, 1.068228, 1.035313, 0, 1, 0.2039216, 1,
-0.3594016, 1.054754, -0.6441603, 0, 1, 0.2078431, 1,
-0.3507653, -0.6427529, -1.974071, 0, 1, 0.2156863, 1,
-0.3491836, -0.9060674, -2.672949, 0, 1, 0.2196078, 1,
-0.3469293, -0.6329795, -3.535137, 0, 1, 0.227451, 1,
-0.3446968, 0.481919, -1.689521, 0, 1, 0.2313726, 1,
-0.3408455, -0.2432171, -2.015544, 0, 1, 0.2392157, 1,
-0.3371171, 1.269536, -2.134181, 0, 1, 0.2431373, 1,
-0.3359711, -0.4104469, -1.666925, 0, 1, 0.2509804, 1,
-0.333746, 0.2109679, -1.357947, 0, 1, 0.254902, 1,
-0.3312858, 0.1854214, 0.4066208, 0, 1, 0.2627451, 1,
-0.3289907, -0.1005112, -3.194321, 0, 1, 0.2666667, 1,
-0.3283453, 0.3752768, -0.2671366, 0, 1, 0.2745098, 1,
-0.3248723, -0.5357101, -1.924907, 0, 1, 0.2784314, 1,
-0.3239701, 0.3433373, -1.072003, 0, 1, 0.2862745, 1,
-0.3208727, -0.2262496, -1.795424, 0, 1, 0.2901961, 1,
-0.3191448, -2.099358, -3.657214, 0, 1, 0.2980392, 1,
-0.3121784, -0.5907965, -2.618883, 0, 1, 0.3058824, 1,
-0.310074, -0.2401815, -2.16962, 0, 1, 0.3098039, 1,
-0.3035209, -0.6262959, -1.501628, 0, 1, 0.3176471, 1,
-0.3027053, 1.834774, -0.8538427, 0, 1, 0.3215686, 1,
-0.3007123, 0.02452276, -1.061868, 0, 1, 0.3294118, 1,
-0.2989726, -0.639803, -2.379954, 0, 1, 0.3333333, 1,
-0.2936608, -0.2183741, -3.751653, 0, 1, 0.3411765, 1,
-0.2908544, -0.01221286, -1.499362, 0, 1, 0.345098, 1,
-0.286489, 0.6297719, 0.2875577, 0, 1, 0.3529412, 1,
-0.2836186, 0.6549022, 0.8139139, 0, 1, 0.3568628, 1,
-0.2822673, -2.399151, -2.047261, 0, 1, 0.3647059, 1,
-0.2797788, -3.315229, -4.443463, 0, 1, 0.3686275, 1,
-0.2771752, 0.4894134, 0.6025206, 0, 1, 0.3764706, 1,
-0.2739396, 2.168535, -0.04542064, 0, 1, 0.3803922, 1,
-0.2724309, -0.9263424, -1.704277, 0, 1, 0.3882353, 1,
-0.2701534, 1.463595, -0.9739386, 0, 1, 0.3921569, 1,
-0.2665907, -0.06614193, -2.141075, 0, 1, 0.4, 1,
-0.2565823, 1.074842, 0.08639233, 0, 1, 0.4078431, 1,
-0.2560258, -0.08169546, -1.874204, 0, 1, 0.4117647, 1,
-0.2547004, 0.5523928, -0.6525462, 0, 1, 0.4196078, 1,
-0.2546111, 1.126808, -0.01134139, 0, 1, 0.4235294, 1,
-0.253113, 1.3153, -0.6731456, 0, 1, 0.4313726, 1,
-0.2527389, 0.3522406, 0.5478157, 0, 1, 0.4352941, 1,
-0.2504575, -0.7996745, -3.113377, 0, 1, 0.4431373, 1,
-0.2474187, 0.1807244, -0.5299666, 0, 1, 0.4470588, 1,
-0.2308159, 0.2920655, 0.6904042, 0, 1, 0.454902, 1,
-0.2299404, -2.173447, -3.272961, 0, 1, 0.4588235, 1,
-0.2289865, -1.140359, -4.569779, 0, 1, 0.4666667, 1,
-0.2289423, 1.770672, 0.7341896, 0, 1, 0.4705882, 1,
-0.2285661, 0.1598482, -0.9551281, 0, 1, 0.4784314, 1,
-0.2255623, -1.603404, -3.474298, 0, 1, 0.4823529, 1,
-0.2215489, 2.633783, 0.9350047, 0, 1, 0.4901961, 1,
-0.2180795, -1.463165, -3.620735, 0, 1, 0.4941176, 1,
-0.2157613, 1.506326, 1.179943, 0, 1, 0.5019608, 1,
-0.2149157, -1.550248, -1.349673, 0, 1, 0.509804, 1,
-0.2121506, -0.1465662, -2.368578, 0, 1, 0.5137255, 1,
-0.2111378, 1.191214, -0.9781081, 0, 1, 0.5215687, 1,
-0.2090405, -0.4600229, -1.502695, 0, 1, 0.5254902, 1,
-0.2084578, 0.4946603, 0.769921, 0, 1, 0.5333334, 1,
-0.2075251, -0.5462449, -1.131632, 0, 1, 0.5372549, 1,
-0.206077, 1.488201, 0.5744074, 0, 1, 0.5450981, 1,
-0.2030529, -0.01856525, -0.8514539, 0, 1, 0.5490196, 1,
-0.2009107, -0.9865616, -2.567238, 0, 1, 0.5568628, 1,
-0.1993003, 1.804695, -1.197609, 0, 1, 0.5607843, 1,
-0.1990746, 1.841828, -0.7304065, 0, 1, 0.5686275, 1,
-0.1968123, 1.536774, -1.524938, 0, 1, 0.572549, 1,
-0.1920246, -0.9197577, -2.068415, 0, 1, 0.5803922, 1,
-0.189092, -0.3926433, -1.859771, 0, 1, 0.5843138, 1,
-0.1848053, -1.467042, -3.354617, 0, 1, 0.5921569, 1,
-0.1829539, 1.124033, -0.133582, 0, 1, 0.5960785, 1,
-0.182775, -0.2540679, -0.7736304, 0, 1, 0.6039216, 1,
-0.1818665, -0.7590815, -2.219537, 0, 1, 0.6117647, 1,
-0.1814649, -1.818192, -3.246283, 0, 1, 0.6156863, 1,
-0.1793499, -0.2541113, -2.687128, 0, 1, 0.6235294, 1,
-0.1780318, -0.4838498, -3.389476, 0, 1, 0.627451, 1,
-0.1776898, 0.9479018, -1.15816, 0, 1, 0.6352941, 1,
-0.1747793, 0.1442906, 0.1256672, 0, 1, 0.6392157, 1,
-0.1738169, 2.358686, -0.1079279, 0, 1, 0.6470588, 1,
-0.1707449, -0.8747752, -2.113076, 0, 1, 0.6509804, 1,
-0.1699685, 2.253601, -1.164964, 0, 1, 0.6588235, 1,
-0.1692303, 0.5008831, -1.622792, 0, 1, 0.6627451, 1,
-0.1631887, 1.41978, 2.051882, 0, 1, 0.6705883, 1,
-0.1608412, -0.2831505, -2.268946, 0, 1, 0.6745098, 1,
-0.1601552, 0.3372229, -0.01779292, 0, 1, 0.682353, 1,
-0.1598886, 0.7280558, 0.37139, 0, 1, 0.6862745, 1,
-0.1597037, -0.4578655, -2.561746, 0, 1, 0.6941177, 1,
-0.1585319, -1.486099, -2.703362, 0, 1, 0.7019608, 1,
-0.155194, 1.596345, 1.575713, 0, 1, 0.7058824, 1,
-0.1515262, -1.863473, -2.025937, 0, 1, 0.7137255, 1,
-0.1441885, -0.3220467, -1.940352, 0, 1, 0.7176471, 1,
-0.1384815, 0.2838325, 0.8761729, 0, 1, 0.7254902, 1,
-0.1341235, 0.1373303, -0.04149073, 0, 1, 0.7294118, 1,
-0.1330725, 1.347003, 0.002156693, 0, 1, 0.7372549, 1,
-0.1294073, -1.342086, -2.788838, 0, 1, 0.7411765, 1,
-0.1203266, -1.351479, -3.432581, 0, 1, 0.7490196, 1,
-0.1194445, -1.457994, -2.428678, 0, 1, 0.7529412, 1,
-0.1110963, 0.3317786, 0.4119819, 0, 1, 0.7607843, 1,
-0.09599519, 0.9158983, 0.859966, 0, 1, 0.7647059, 1,
-0.09369928, -0.3056256, -2.428119, 0, 1, 0.772549, 1,
-0.09123644, -1.302886, -4.631015, 0, 1, 0.7764706, 1,
-0.089176, -0.1905165, -3.174862, 0, 1, 0.7843137, 1,
-0.08896766, -1.331337, -2.135582, 0, 1, 0.7882353, 1,
-0.08678293, -0.5024988, -2.117584, 0, 1, 0.7960784, 1,
-0.08591478, 2.285178, 0.3858944, 0, 1, 0.8039216, 1,
-0.08430763, 0.1881665, -0.7954726, 0, 1, 0.8078431, 1,
-0.08256427, -0.2009336, -2.903388, 0, 1, 0.8156863, 1,
-0.08124483, 0.6194425, 1.09899, 0, 1, 0.8196079, 1,
-0.08054022, 0.5028391, 0.6330905, 0, 1, 0.827451, 1,
-0.08012004, -0.1603398, -2.051056, 0, 1, 0.8313726, 1,
-0.07456361, -0.2945504, -4.052859, 0, 1, 0.8392157, 1,
-0.07057457, 0.6998249, -2.483304, 0, 1, 0.8431373, 1,
-0.06345952, -0.2930528, -2.934435, 0, 1, 0.8509804, 1,
-0.06278498, 0.4186077, -2.53403, 0, 1, 0.854902, 1,
-0.06167114, -0.6111484, -3.924317, 0, 1, 0.8627451, 1,
-0.06099776, -0.363228, -5.077494, 0, 1, 0.8666667, 1,
-0.05904612, 0.9051272, -1.470474, 0, 1, 0.8745098, 1,
-0.0576679, -1.645208, -3.160244, 0, 1, 0.8784314, 1,
-0.05760282, 0.6466923, 0.8903209, 0, 1, 0.8862745, 1,
-0.0562953, 1.346606, 1.238686, 0, 1, 0.8901961, 1,
-0.0541954, -2.149237, -4.781199, 0, 1, 0.8980392, 1,
-0.0510215, 0.743303, -0.8522462, 0, 1, 0.9058824, 1,
-0.04988652, -0.2499765, -2.809566, 0, 1, 0.9098039, 1,
-0.0474524, 1.01592, 0.4854198, 0, 1, 0.9176471, 1,
-0.04713625, -0.5042616, -3.282414, 0, 1, 0.9215686, 1,
-0.04689856, 0.293851, 1.118381, 0, 1, 0.9294118, 1,
-0.04504043, 0.8229601, -0.8826624, 0, 1, 0.9333333, 1,
-0.04306913, -0.5184585, -4.388147, 0, 1, 0.9411765, 1,
-0.04274406, 0.0619972, 1.956281, 0, 1, 0.945098, 1,
-0.04093349, -0.9014282, -4.113824, 0, 1, 0.9529412, 1,
-0.04008097, -1.841197, -3.158181, 0, 1, 0.9568627, 1,
-0.03957611, -0.205532, -2.398934, 0, 1, 0.9647059, 1,
-0.03623646, -0.2871539, -3.993636, 0, 1, 0.9686275, 1,
-0.03261907, -0.85773, -4.997639, 0, 1, 0.9764706, 1,
-0.02115697, -0.3353108, -2.780674, 0, 1, 0.9803922, 1,
-0.01372713, -2.310961, -5.182078, 0, 1, 0.9882353, 1,
-0.01336299, -0.4270448, -3.077283, 0, 1, 0.9921569, 1,
-0.0129993, -1.265149, -0.5896562, 0, 1, 1, 1,
-0.01141445, -0.5078338, -4.411533, 0, 0.9921569, 1, 1,
-0.00952699, -1.025498, -2.302987, 0, 0.9882353, 1, 1,
-0.009420527, -0.1719774, 0.06626163, 0, 0.9803922, 1, 1,
-0.004278453, 0.6041713, -0.6252697, 0, 0.9764706, 1, 1,
-0.001431572, 1.074734, 0.3856058, 0, 0.9686275, 1, 1,
-0.0003395662, -0.434776, -4.720057, 0, 0.9647059, 1, 1,
0.001115476, -2.213882, 2.809439, 0, 0.9568627, 1, 1,
0.001946133, -0.4136168, 2.357062, 0, 0.9529412, 1, 1,
0.009633147, -2.136628, 3.635409, 0, 0.945098, 1, 1,
0.0140616, 1.028397, 2.303558, 0, 0.9411765, 1, 1,
0.01487152, -1.454948, 3.30002, 0, 0.9333333, 1, 1,
0.01705517, -1.424545, 5.485114, 0, 0.9294118, 1, 1,
0.02012755, 0.5236032, 0.5721365, 0, 0.9215686, 1, 1,
0.02429643, 0.5725045, 1.637392, 0, 0.9176471, 1, 1,
0.02714028, -0.4789819, 3.840698, 0, 0.9098039, 1, 1,
0.03295526, 0.3510426, -0.6435027, 0, 0.9058824, 1, 1,
0.03471439, -0.101309, 2.898933, 0, 0.8980392, 1, 1,
0.03831253, 0.5574329, 1.25164, 0, 0.8901961, 1, 1,
0.04102419, 1.548057, 0.4677082, 0, 0.8862745, 1, 1,
0.04256846, 0.05827889, -0.4032437, 0, 0.8784314, 1, 1,
0.04329443, 1.065009, 0.09796406, 0, 0.8745098, 1, 1,
0.04650896, 0.6070938, 0.9031513, 0, 0.8666667, 1, 1,
0.04817705, -0.4385336, 3.790851, 0, 0.8627451, 1, 1,
0.04888892, 0.7283821, 1.775102, 0, 0.854902, 1, 1,
0.04928213, -1.631636, 3.186325, 0, 0.8509804, 1, 1,
0.04964413, 0.5867466, 0.3990359, 0, 0.8431373, 1, 1,
0.05269251, -1.736813, 1.528954, 0, 0.8392157, 1, 1,
0.05537359, -0.5631238, 3.332986, 0, 0.8313726, 1, 1,
0.05635187, 0.1642293, -0.2134929, 0, 0.827451, 1, 1,
0.05718483, -0.6741829, 4.746736, 0, 0.8196079, 1, 1,
0.05855085, 2.137736, 1.035035, 0, 0.8156863, 1, 1,
0.06128917, 1.964801, 0.06852207, 0, 0.8078431, 1, 1,
0.06290281, 0.664304, -0.7408814, 0, 0.8039216, 1, 1,
0.06301914, 0.5122021, 0.4537446, 0, 0.7960784, 1, 1,
0.06303909, 1.157637, -1.357961, 0, 0.7882353, 1, 1,
0.06406735, 0.5819756, -0.1877616, 0, 0.7843137, 1, 1,
0.06517544, 1.783262, -1.182038, 0, 0.7764706, 1, 1,
0.06528232, 0.2071486, -0.7318017, 0, 0.772549, 1, 1,
0.06998195, -1.315672, 2.94243, 0, 0.7647059, 1, 1,
0.07101014, 0.5434612, -1.055086, 0, 0.7607843, 1, 1,
0.08265454, -0.8371868, 4.746241, 0, 0.7529412, 1, 1,
0.09346069, 0.005346076, -0.4518049, 0, 0.7490196, 1, 1,
0.09397542, 0.03651315, 1.291533, 0, 0.7411765, 1, 1,
0.09692699, 2.196345, -0.8915532, 0, 0.7372549, 1, 1,
0.1017262, 0.5864095, 0.7978811, 0, 0.7294118, 1, 1,
0.1088897, -1.425303, 3.993304, 0, 0.7254902, 1, 1,
0.1088945, 0.7860135, -1.09725, 0, 0.7176471, 1, 1,
0.109607, -0.9671852, 2.042755, 0, 0.7137255, 1, 1,
0.1097397, 0.3844068, 0.33806, 0, 0.7058824, 1, 1,
0.1106285, -0.310307, 3.941609, 0, 0.6980392, 1, 1,
0.1133012, 0.5998626, 0.9815271, 0, 0.6941177, 1, 1,
0.1137838, -1.487483, 4.652299, 0, 0.6862745, 1, 1,
0.1160021, -0.7653348, 2.305478, 0, 0.682353, 1, 1,
0.1297336, -1.986962, 3.285723, 0, 0.6745098, 1, 1,
0.1318368, -0.8001814, 3.455964, 0, 0.6705883, 1, 1,
0.1318614, 0.8940368, -0.377284, 0, 0.6627451, 1, 1,
0.1414334, 0.1120852, -0.8447217, 0, 0.6588235, 1, 1,
0.1425979, 1.208461, -0.646504, 0, 0.6509804, 1, 1,
0.1436471, 0.4211181, 0.2714988, 0, 0.6470588, 1, 1,
0.1469932, 0.3512282, -0.04336138, 0, 0.6392157, 1, 1,
0.1495361, -1.443779, 3.655711, 0, 0.6352941, 1, 1,
0.1497411, -1.463248, 3.128814, 0, 0.627451, 1, 1,
0.1502577, 0.6233814, -0.2400161, 0, 0.6235294, 1, 1,
0.151408, -1.206301, 2.540754, 0, 0.6156863, 1, 1,
0.1521052, -1.000557, 4.789738, 0, 0.6117647, 1, 1,
0.1563044, -1.02314, 1.479854, 0, 0.6039216, 1, 1,
0.159945, 0.4795656, 0.7632135, 0, 0.5960785, 1, 1,
0.1622236, 0.07489737, -0.09508042, 0, 0.5921569, 1, 1,
0.1650653, 1.729445, -0.04106186, 0, 0.5843138, 1, 1,
0.1704924, -1.959557, 2.708249, 0, 0.5803922, 1, 1,
0.1707369, 0.5214704, 1.088272, 0, 0.572549, 1, 1,
0.1722418, 0.125164, -0.8505837, 0, 0.5686275, 1, 1,
0.17314, -0.8762707, 2.92995, 0, 0.5607843, 1, 1,
0.1734307, 0.2416571, 0.9611893, 0, 0.5568628, 1, 1,
0.175395, -1.896953, 1.595751, 0, 0.5490196, 1, 1,
0.1791681, 0.941869, 1.250018, 0, 0.5450981, 1, 1,
0.1841074, -1.004179, 2.78267, 0, 0.5372549, 1, 1,
0.1919733, -1.241326, 2.029314, 0, 0.5333334, 1, 1,
0.1930322, 0.421561, -0.2188808, 0, 0.5254902, 1, 1,
0.1945779, 2.137433, -0.3207747, 0, 0.5215687, 1, 1,
0.1952355, -0.7957416, 2.777787, 0, 0.5137255, 1, 1,
0.1983698, 0.1014881, 2.390347, 0, 0.509804, 1, 1,
0.1994574, -0.4028035, 2.971171, 0, 0.5019608, 1, 1,
0.2122043, 2.024108, -1.083944, 0, 0.4941176, 1, 1,
0.2131992, -1.675635, 3.188768, 0, 0.4901961, 1, 1,
0.2137878, 0.2881637, 2.665651, 0, 0.4823529, 1, 1,
0.2138854, 0.7342868, 0.9085531, 0, 0.4784314, 1, 1,
0.217945, -1.225232, 2.83483, 0, 0.4705882, 1, 1,
0.2237104, -1.816764, 3.633866, 0, 0.4666667, 1, 1,
0.2268424, -0.9778515, 2.666612, 0, 0.4588235, 1, 1,
0.2288641, 0.1000261, -0.5452726, 0, 0.454902, 1, 1,
0.2293205, -0.7161851, 3.27887, 0, 0.4470588, 1, 1,
0.2306034, -1.110531, 4.316536, 0, 0.4431373, 1, 1,
0.2324393, -0.224785, 3.571311, 0, 0.4352941, 1, 1,
0.2337949, -1.025944, 1.408804, 0, 0.4313726, 1, 1,
0.2386888, -0.6028445, 3.213686, 0, 0.4235294, 1, 1,
0.2439665, -1.397519, 1.434253, 0, 0.4196078, 1, 1,
0.2441661, 1.840265, 0.4592147, 0, 0.4117647, 1, 1,
0.2493022, 1.681334, 1.360908, 0, 0.4078431, 1, 1,
0.250874, -0.4687844, 2.15302, 0, 0.4, 1, 1,
0.2511855, -0.2173659, 1.582142, 0, 0.3921569, 1, 1,
0.2522115, 1.123939, 0.6655087, 0, 0.3882353, 1, 1,
0.2525516, 0.9303021, 0.3586157, 0, 0.3803922, 1, 1,
0.2545492, 1.179262, -0.3549084, 0, 0.3764706, 1, 1,
0.2555932, 0.9902825, 0.5620158, 0, 0.3686275, 1, 1,
0.259493, 0.1480256, 0.1158476, 0, 0.3647059, 1, 1,
0.2606184, 1.836347, 0.8532083, 0, 0.3568628, 1, 1,
0.2637835, -0.4810537, 3.826929, 0, 0.3529412, 1, 1,
0.2643901, -0.8233767, 2.166112, 0, 0.345098, 1, 1,
0.2646282, -0.1583606, 5.010343, 0, 0.3411765, 1, 1,
0.2695302, -0.6735584, 4.816846, 0, 0.3333333, 1, 1,
0.2699291, -0.293232, 2.777537, 0, 0.3294118, 1, 1,
0.2703491, 0.07823909, 0.3233795, 0, 0.3215686, 1, 1,
0.2729518, -0.762454, 4.036194, 0, 0.3176471, 1, 1,
0.2777313, 0.2219205, -0.006218533, 0, 0.3098039, 1, 1,
0.2797967, -0.1200467, 2.634902, 0, 0.3058824, 1, 1,
0.281373, -0.3441414, 2.2122, 0, 0.2980392, 1, 1,
0.2821937, 0.912931, 1.292952, 0, 0.2901961, 1, 1,
0.2844109, 0.09249058, 2.557242, 0, 0.2862745, 1, 1,
0.2845218, -0.5340943, 1.85594, 0, 0.2784314, 1, 1,
0.2850457, 1.424065, 0.3849404, 0, 0.2745098, 1, 1,
0.2858307, 0.9764053, -0.5909128, 0, 0.2666667, 1, 1,
0.2941239, -0.4793085, 2.620587, 0, 0.2627451, 1, 1,
0.3013267, 0.2596153, 1.770057, 0, 0.254902, 1, 1,
0.3022937, 0.2988168, 1.822329, 0, 0.2509804, 1, 1,
0.3027063, 1.070361, -0.5809016, 0, 0.2431373, 1, 1,
0.3034615, 0.8455385, -0.09319232, 0, 0.2392157, 1, 1,
0.3073103, 0.4895245, 1.705965, 0, 0.2313726, 1, 1,
0.3082505, -0.01959846, 1.882389, 0, 0.227451, 1, 1,
0.3094445, -0.8298979, 2.310843, 0, 0.2196078, 1, 1,
0.3100688, -0.1341868, 1.970084, 0, 0.2156863, 1, 1,
0.3114363, -0.3747367, 1.345505, 0, 0.2078431, 1, 1,
0.3190449, -0.4419964, 1.972825, 0, 0.2039216, 1, 1,
0.3218171, 1.256866, 2.094981, 0, 0.1960784, 1, 1,
0.3244275, -0.07783134, 0.2899759, 0, 0.1882353, 1, 1,
0.3335593, 1.747197, -0.6837699, 0, 0.1843137, 1, 1,
0.3336694, -1.837518, 2.498904, 0, 0.1764706, 1, 1,
0.3345734, -0.9123595, 1.301283, 0, 0.172549, 1, 1,
0.3365662, -0.135954, 1.13454, 0, 0.1647059, 1, 1,
0.3427211, 1.745908, 1.303719, 0, 0.1607843, 1, 1,
0.3516817, 0.1236547, 1.295909, 0, 0.1529412, 1, 1,
0.3554868, -1.348249, 4.642279, 0, 0.1490196, 1, 1,
0.3566142, -1.025456, 2.653174, 0, 0.1411765, 1, 1,
0.3631963, -0.004077797, 0.7429424, 0, 0.1372549, 1, 1,
0.3637692, 0.3041745, 1.578338, 0, 0.1294118, 1, 1,
0.368625, -0.2541052, 1.744108, 0, 0.1254902, 1, 1,
0.3742079, -1.251227, 3.36705, 0, 0.1176471, 1, 1,
0.3777418, -0.06265266, 0.7623999, 0, 0.1137255, 1, 1,
0.3887823, 1.175497, 0.8172465, 0, 0.1058824, 1, 1,
0.390069, 0.8230979, -0.7824709, 0, 0.09803922, 1, 1,
0.394979, -0.4250384, 2.13695, 0, 0.09411765, 1, 1,
0.4062948, -0.8813787, -0.1936982, 0, 0.08627451, 1, 1,
0.4069758, 0.2073407, 0.6470464, 0, 0.08235294, 1, 1,
0.4091537, 0.04178417, 0.3516879, 0, 0.07450981, 1, 1,
0.4128494, 0.9791594, 0.8313829, 0, 0.07058824, 1, 1,
0.4135285, 1.839472, -0.6652372, 0, 0.0627451, 1, 1,
0.4217406, 2.079264, 0.1459976, 0, 0.05882353, 1, 1,
0.4229855, -0.2137986, 1.415159, 0, 0.05098039, 1, 1,
0.4231743, 1.401254, -0.6633058, 0, 0.04705882, 1, 1,
0.424826, -1.016935, 3.346946, 0, 0.03921569, 1, 1,
0.4249926, -0.8101224, 1.17007, 0, 0.03529412, 1, 1,
0.4256745, -0.8927088, 2.873386, 0, 0.02745098, 1, 1,
0.4305138, -0.6907026, 1.601394, 0, 0.02352941, 1, 1,
0.437116, 1.600659, -0.8136312, 0, 0.01568628, 1, 1,
0.4440313, -0.1868931, 0.5930784, 0, 0.01176471, 1, 1,
0.4458458, -1.099381, 2.231423, 0, 0.003921569, 1, 1,
0.453604, 0.4287745, 1.661986, 0.003921569, 0, 1, 1,
0.4596709, 1.841299, 1.366487, 0.007843138, 0, 1, 1,
0.4673826, -0.05499714, 0.1446008, 0.01568628, 0, 1, 1,
0.4689623, 1.016791, 2.30286, 0.01960784, 0, 1, 1,
0.4807936, -1.119357, 4.132377, 0.02745098, 0, 1, 1,
0.485631, -0.9032676, 1.129467, 0.03137255, 0, 1, 1,
0.4880354, -0.7968774, 3.133781, 0.03921569, 0, 1, 1,
0.4926735, -0.04910636, 0.9839516, 0.04313726, 0, 1, 1,
0.4972073, 1.050962, 1.133848, 0.05098039, 0, 1, 1,
0.497359, -1.159441, 1.25154, 0.05490196, 0, 1, 1,
0.5034618, -0.1878148, 3.164728, 0.0627451, 0, 1, 1,
0.5037343, 2.557185, 1.262913, 0.06666667, 0, 1, 1,
0.504143, -1.382085, 2.873827, 0.07450981, 0, 1, 1,
0.509445, -0.2570637, 2.885204, 0.07843138, 0, 1, 1,
0.5101588, 0.2408872, 1.104089, 0.08627451, 0, 1, 1,
0.5142428, 2.332497, 2.907212, 0.09019608, 0, 1, 1,
0.5185052, 0.3445897, 2.757368, 0.09803922, 0, 1, 1,
0.5212539, 1.320792, 0.5018572, 0.1058824, 0, 1, 1,
0.5226465, -1.497541, 3.353314, 0.1098039, 0, 1, 1,
0.5248985, 0.8961134, 0.05491512, 0.1176471, 0, 1, 1,
0.5264611, 0.6505973, -1.359795, 0.1215686, 0, 1, 1,
0.5266622, -1.760809, 4.727933, 0.1294118, 0, 1, 1,
0.5301486, 0.3823896, 0.124685, 0.1333333, 0, 1, 1,
0.5347346, 0.2720647, 0.7660116, 0.1411765, 0, 1, 1,
0.5360644, 0.3519517, 0.572165, 0.145098, 0, 1, 1,
0.5369962, 0.4087545, 1.360324, 0.1529412, 0, 1, 1,
0.5387076, -0.6823847, 4.185561, 0.1568628, 0, 1, 1,
0.5390782, -0.6717157, 1.870307, 0.1647059, 0, 1, 1,
0.5398846, -0.2544102, 2.371714, 0.1686275, 0, 1, 1,
0.5402596, 0.9540725, 0.01389696, 0.1764706, 0, 1, 1,
0.5464162, 0.1306322, 0.1576481, 0.1803922, 0, 1, 1,
0.5496452, -1.714979, 2.621944, 0.1882353, 0, 1, 1,
0.5595067, -0.8322905, 1.583953, 0.1921569, 0, 1, 1,
0.5599939, -0.2569498, 3.326463, 0.2, 0, 1, 1,
0.5601098, -1.950128, 1.770038, 0.2078431, 0, 1, 1,
0.5613743, 0.5566267, 0.03474213, 0.2117647, 0, 1, 1,
0.562883, 1.304072, 0.6400849, 0.2196078, 0, 1, 1,
0.5634961, 1.539385, -0.2245557, 0.2235294, 0, 1, 1,
0.5690005, 1.770419, -0.6130548, 0.2313726, 0, 1, 1,
0.5690543, 1.292683, -1.020472, 0.2352941, 0, 1, 1,
0.5728451, -1.026246, 3.350521, 0.2431373, 0, 1, 1,
0.576525, 0.04508346, 1.353727, 0.2470588, 0, 1, 1,
0.5812443, -0.6496844, 1.81031, 0.254902, 0, 1, 1,
0.5813333, -1.78667, 2.579495, 0.2588235, 0, 1, 1,
0.5847029, 0.2313775, 1.537614, 0.2666667, 0, 1, 1,
0.5867121, -1.85232, 3.2856, 0.2705882, 0, 1, 1,
0.5870326, -0.318732, 0.1078831, 0.2784314, 0, 1, 1,
0.5871395, 2.692994, 0.05567062, 0.282353, 0, 1, 1,
0.5926479, -1.610197, 3.190237, 0.2901961, 0, 1, 1,
0.5926604, -2.169743, 2.591637, 0.2941177, 0, 1, 1,
0.6007763, -0.04139571, -0.01368459, 0.3019608, 0, 1, 1,
0.603216, -0.7996448, 2.566577, 0.3098039, 0, 1, 1,
0.606041, -1.641877, 2.810818, 0.3137255, 0, 1, 1,
0.6121435, 0.3032474, 0.5272089, 0.3215686, 0, 1, 1,
0.6161853, -1.577922, 4.195904, 0.3254902, 0, 1, 1,
0.6163892, 0.4151728, 2.03738, 0.3333333, 0, 1, 1,
0.6195176, -0.5140763, 2.068907, 0.3372549, 0, 1, 1,
0.6229998, -2.824248, 2.967959, 0.345098, 0, 1, 1,
0.6241872, -0.8381799, 2.383237, 0.3490196, 0, 1, 1,
0.6273401, -0.1784191, 0.3370791, 0.3568628, 0, 1, 1,
0.6276487, -0.04359168, 2.156314, 0.3607843, 0, 1, 1,
0.6276502, -0.5835047, 2.539605, 0.3686275, 0, 1, 1,
0.6325924, -0.918161, 2.627725, 0.372549, 0, 1, 1,
0.6419267, -1.051417, 3.039753, 0.3803922, 0, 1, 1,
0.6419416, -0.1546863, 1.143837, 0.3843137, 0, 1, 1,
0.6451457, 1.251528, -0.7855057, 0.3921569, 0, 1, 1,
0.6507177, 0.4342, 0.3118, 0.3960784, 0, 1, 1,
0.6522265, -0.3252526, 2.027421, 0.4039216, 0, 1, 1,
0.6538098, -1.5399, 2.774801, 0.4117647, 0, 1, 1,
0.6607848, 0.6002757, 2.082416, 0.4156863, 0, 1, 1,
0.6655361, -0.8796623, 2.944264, 0.4235294, 0, 1, 1,
0.6657439, 1.064432, 0.4588309, 0.427451, 0, 1, 1,
0.6686051, -0.01751378, 1.633515, 0.4352941, 0, 1, 1,
0.6687492, -0.6899903, 1.48133, 0.4392157, 0, 1, 1,
0.6691419, 0.1828822, 1.192602, 0.4470588, 0, 1, 1,
0.6753141, 0.2509991, 1.762718, 0.4509804, 0, 1, 1,
0.6768634, -2.022092, 2.996833, 0.4588235, 0, 1, 1,
0.6770347, 1.620442, 1.462319, 0.4627451, 0, 1, 1,
0.6787808, -0.5876569, 2.180469, 0.4705882, 0, 1, 1,
0.6814281, 0.2429294, 2.187262, 0.4745098, 0, 1, 1,
0.6827731, -0.5587136, 0.8358092, 0.4823529, 0, 1, 1,
0.6839159, 0.5585031, 0.5672557, 0.4862745, 0, 1, 1,
0.6875436, 0.673762, 1.423992, 0.4941176, 0, 1, 1,
0.6890812, -0.04931919, 0.4913704, 0.5019608, 0, 1, 1,
0.6924863, -0.8438637, 3.020097, 0.5058824, 0, 1, 1,
0.6939537, 0.1898243, 2.190625, 0.5137255, 0, 1, 1,
0.6953942, -0.3012638, 2.084756, 0.5176471, 0, 1, 1,
0.6958612, 0.2762401, 0.2878546, 0.5254902, 0, 1, 1,
0.7035935, -0.9261655, 2.788755, 0.5294118, 0, 1, 1,
0.7086715, 1.560576, 1.030875, 0.5372549, 0, 1, 1,
0.7102361, 0.2069188, 0.8204555, 0.5411765, 0, 1, 1,
0.7117012, -0.2283697, 2.630588, 0.5490196, 0, 1, 1,
0.712937, -1.091439, 3.09075, 0.5529412, 0, 1, 1,
0.7144396, -0.8889437, 2.814384, 0.5607843, 0, 1, 1,
0.7234786, -0.8106923, 2.583249, 0.5647059, 0, 1, 1,
0.7310947, 0.3877657, 1.658847, 0.572549, 0, 1, 1,
0.7325286, -1.680727, 2.503083, 0.5764706, 0, 1, 1,
0.748454, 0.2596934, 3.443417, 0.5843138, 0, 1, 1,
0.7580277, -0.5267081, 2.901239, 0.5882353, 0, 1, 1,
0.7588662, 1.376166, 0.9878064, 0.5960785, 0, 1, 1,
0.7601575, 0.07978577, 0.8012477, 0.6039216, 0, 1, 1,
0.7632374, 0.8746732, 1.50259, 0.6078432, 0, 1, 1,
0.7671796, 1.340175, -0.584865, 0.6156863, 0, 1, 1,
0.7685315, -2.116651, 2.274764, 0.6196079, 0, 1, 1,
0.7690441, -2.284714, 2.066049, 0.627451, 0, 1, 1,
0.7693638, 0.3281308, 0.1769717, 0.6313726, 0, 1, 1,
0.7790087, -0.5465958, 2.189869, 0.6392157, 0, 1, 1,
0.7793317, 0.7132038, -0.840876, 0.6431373, 0, 1, 1,
0.779444, -0.5133854, 0.9618714, 0.6509804, 0, 1, 1,
0.7858233, 0.4660725, 2.176821, 0.654902, 0, 1, 1,
0.7864547, -1.620372, 1.936765, 0.6627451, 0, 1, 1,
0.7866372, 0.9223296, 1.57258, 0.6666667, 0, 1, 1,
0.7892525, 1.020848, -1.672188, 0.6745098, 0, 1, 1,
0.7928865, 0.5230991, 1.273113, 0.6784314, 0, 1, 1,
0.7951254, 0.1955857, 2.976772, 0.6862745, 0, 1, 1,
0.8001729, 1.082418, 0.4973296, 0.6901961, 0, 1, 1,
0.8012172, 0.7241725, -0.7681757, 0.6980392, 0, 1, 1,
0.8019522, 1.561006, 1.398291, 0.7058824, 0, 1, 1,
0.8073449, 1.441059, 1.072693, 0.7098039, 0, 1, 1,
0.8088169, -1.572826, 2.31669, 0.7176471, 0, 1, 1,
0.8096129, 0.2727958, 1.036303, 0.7215686, 0, 1, 1,
0.8123843, -0.9485588, 1.268089, 0.7294118, 0, 1, 1,
0.8174443, -0.04045589, 1.12364, 0.7333333, 0, 1, 1,
0.8176746, -0.04307001, 1.792197, 0.7411765, 0, 1, 1,
0.8248265, 0.4252604, 1.626626, 0.7450981, 0, 1, 1,
0.8249474, 0.7307904, 2.776445, 0.7529412, 0, 1, 1,
0.8264126, -1.380402, 3.618688, 0.7568628, 0, 1, 1,
0.8291745, 0.5655868, 0.1472221, 0.7647059, 0, 1, 1,
0.8294314, 0.4587821, 1.898834, 0.7686275, 0, 1, 1,
0.8305466, 0.4858706, 0.3550583, 0.7764706, 0, 1, 1,
0.8317035, 0.1897876, 4.316707, 0.7803922, 0, 1, 1,
0.834217, -0.3190484, 2.433408, 0.7882353, 0, 1, 1,
0.8343124, -0.0965054, 0.7546117, 0.7921569, 0, 1, 1,
0.8356307, -1.304147, 2.741045, 0.8, 0, 1, 1,
0.8387039, -1.04536, 2.656892, 0.8078431, 0, 1, 1,
0.8459393, 0.8918215, 2.300398, 0.8117647, 0, 1, 1,
0.8555362, -0.04250899, 0.1671294, 0.8196079, 0, 1, 1,
0.8571168, 0.9957577, -0.6398031, 0.8235294, 0, 1, 1,
0.8621511, 0.241323, 1.798375, 0.8313726, 0, 1, 1,
0.865818, 1.213812, -0.3738978, 0.8352941, 0, 1, 1,
0.8672494, 1.1158, 0.07677871, 0.8431373, 0, 1, 1,
0.8740401, 0.2473845, 0.3981494, 0.8470588, 0, 1, 1,
0.8773215, -0.5662774, 3.653091, 0.854902, 0, 1, 1,
0.8881617, 1.752284, -1.477859, 0.8588235, 0, 1, 1,
0.8915394, 0.3960089, 0.1741134, 0.8666667, 0, 1, 1,
0.8972938, 0.1152398, 0.8610643, 0.8705882, 0, 1, 1,
0.9054073, 2.446518, -0.4177655, 0.8784314, 0, 1, 1,
0.9079592, -0.9492528, 1.392941, 0.8823529, 0, 1, 1,
0.9082935, -0.3957036, 0.5112643, 0.8901961, 0, 1, 1,
0.910184, -0.4875502, 1.229118, 0.8941177, 0, 1, 1,
0.9157068, 0.1738504, 1.029465, 0.9019608, 0, 1, 1,
0.9164076, -1.218504, 0.8359364, 0.9098039, 0, 1, 1,
0.9359346, 0.6386181, 2.638844, 0.9137255, 0, 1, 1,
0.9407059, 0.3529408, 1.344223, 0.9215686, 0, 1, 1,
0.9563631, 0.6743836, 1.478419, 0.9254902, 0, 1, 1,
0.9736667, -0.03443153, 2.818418, 0.9333333, 0, 1, 1,
0.9749274, 0.6094552, 0.335834, 0.9372549, 0, 1, 1,
0.9767111, -0.5056257, 2.436365, 0.945098, 0, 1, 1,
0.9822786, -0.3610157, 0.04273086, 0.9490196, 0, 1, 1,
0.9835514, -0.8075867, 4.21529, 0.9568627, 0, 1, 1,
0.9953403, -0.4140735, 1.928957, 0.9607843, 0, 1, 1,
1.006389, 0.06031688, 3.158834, 0.9686275, 0, 1, 1,
1.01239, -0.769826, 3.474522, 0.972549, 0, 1, 1,
1.018618, -0.924857, 2.70276, 0.9803922, 0, 1, 1,
1.023062, 0.3155416, 2.482768, 0.9843137, 0, 1, 1,
1.024372, -0.9901802, 0.6481793, 0.9921569, 0, 1, 1,
1.031803, -0.8182298, 3.449058, 0.9960784, 0, 1, 1,
1.042859, 1.539373, 0.9299433, 1, 0, 0.9960784, 1,
1.04643, -1.652348, 1.081272, 1, 0, 0.9882353, 1,
1.048658, -0.01134346, -0.6604065, 1, 0, 0.9843137, 1,
1.068763, 1.208342, 1.752603, 1, 0, 0.9764706, 1,
1.069064, 1.592721, 0.92735, 1, 0, 0.972549, 1,
1.076204, 0.8982177, 1.59342, 1, 0, 0.9647059, 1,
1.08011, 0.5621123, 1.178216, 1, 0, 0.9607843, 1,
1.08314, 0.9176152, 2.239026, 1, 0, 0.9529412, 1,
1.086329, -0.9363226, 3.094925, 1, 0, 0.9490196, 1,
1.086859, 0.3569144, 1.248763, 1, 0, 0.9411765, 1,
1.087498, 0.3578973, 0.6603009, 1, 0, 0.9372549, 1,
1.089119, -1.051301, 3.008084, 1, 0, 0.9294118, 1,
1.090345, 0.5208161, 1.100185, 1, 0, 0.9254902, 1,
1.091243, 0.1069579, 1.350664, 1, 0, 0.9176471, 1,
1.092189, 0.2125389, 2.404447, 1, 0, 0.9137255, 1,
1.092263, 0.5278386, 2.260123, 1, 0, 0.9058824, 1,
1.102232, 0.617906, 1.473789, 1, 0, 0.9019608, 1,
1.10297, 0.7686759, 1.324291, 1, 0, 0.8941177, 1,
1.104872, 0.3841016, 2.220775, 1, 0, 0.8862745, 1,
1.105627, 0.7124654, 1.030648, 1, 0, 0.8823529, 1,
1.108203, 2.036312, -1.295815, 1, 0, 0.8745098, 1,
1.111785, 1.443347, -0.5549027, 1, 0, 0.8705882, 1,
1.113073, -0.158323, 0.9870963, 1, 0, 0.8627451, 1,
1.122519, 0.5031306, 0.952598, 1, 0, 0.8588235, 1,
1.1265, -0.423707, 2.330037, 1, 0, 0.8509804, 1,
1.138261, -0.1991056, 1.340704, 1, 0, 0.8470588, 1,
1.138527, -0.08582245, 0.284547, 1, 0, 0.8392157, 1,
1.154425, -0.6302686, 1.029369, 1, 0, 0.8352941, 1,
1.156404, -1.06481, 2.219407, 1, 0, 0.827451, 1,
1.156749, 0.982875, 0.533897, 1, 0, 0.8235294, 1,
1.158831, 1.470582, 1.427696, 1, 0, 0.8156863, 1,
1.162198, 0.4909733, 1.796321, 1, 0, 0.8117647, 1,
1.167301, 0.5071226, 0.3019717, 1, 0, 0.8039216, 1,
1.167478, 0.5477386, 2.049424, 1, 0, 0.7960784, 1,
1.178887, -1.006626, 3.673438, 1, 0, 0.7921569, 1,
1.183056, -0.9097416, 0.3439892, 1, 0, 0.7843137, 1,
1.183721, -0.9082784, 2.530132, 1, 0, 0.7803922, 1,
1.187322, -1.134359, 2.571223, 1, 0, 0.772549, 1,
1.187703, 0.5374472, 1.412616, 1, 0, 0.7686275, 1,
1.193575, 0.5666542, 3.434093, 1, 0, 0.7607843, 1,
1.204296, -1.404233, 2.932485, 1, 0, 0.7568628, 1,
1.204333, -0.5702904, 1.276083, 1, 0, 0.7490196, 1,
1.207577, 0.9662843, 1.110455, 1, 0, 0.7450981, 1,
1.214634, 1.496382, 1.399933, 1, 0, 0.7372549, 1,
1.215044, 1.8101, -0.7767235, 1, 0, 0.7333333, 1,
1.217637, -0.8365352, 2.685109, 1, 0, 0.7254902, 1,
1.223286, -0.4859767, 2.950707, 1, 0, 0.7215686, 1,
1.224306, -0.7404321, 1.134136, 1, 0, 0.7137255, 1,
1.226323, 1.328875, 1.366863, 1, 0, 0.7098039, 1,
1.226838, -2.272495, 2.03002, 1, 0, 0.7019608, 1,
1.237069, 0.07764779, 3.16546, 1, 0, 0.6941177, 1,
1.242021, 1.002652, 0.07022001, 1, 0, 0.6901961, 1,
1.243909, -0.3345518, 1.495761, 1, 0, 0.682353, 1,
1.245325, -0.5841864, 1.154637, 1, 0, 0.6784314, 1,
1.247696, 0.7209851, 0.6148033, 1, 0, 0.6705883, 1,
1.258209, 1.397608, 1.559428, 1, 0, 0.6666667, 1,
1.280315, 0.4547956, 1.279536, 1, 0, 0.6588235, 1,
1.284112, -0.9292679, 4.268669, 1, 0, 0.654902, 1,
1.287807, -0.814751, 0.7306835, 1, 0, 0.6470588, 1,
1.291066, 1.014717, -0.3011533, 1, 0, 0.6431373, 1,
1.294462, -0.5454445, 2.383095, 1, 0, 0.6352941, 1,
1.306737, -1.291044, 1.246649, 1, 0, 0.6313726, 1,
1.320215, 1.565639, 0.1211466, 1, 0, 0.6235294, 1,
1.332925, 0.3713698, 0.7885527, 1, 0, 0.6196079, 1,
1.333506, -1.051697, 2.288299, 1, 0, 0.6117647, 1,
1.334428, -0.133989, 3.180689, 1, 0, 0.6078432, 1,
1.345109, -0.8384669, 2.979053, 1, 0, 0.6, 1,
1.360587, 1.497471, -0.5502841, 1, 0, 0.5921569, 1,
1.365689, -0.4688978, 2.785666, 1, 0, 0.5882353, 1,
1.367829, 0.1203784, 1.249468, 1, 0, 0.5803922, 1,
1.367859, -1.708494, 1.607503, 1, 0, 0.5764706, 1,
1.37263, -1.640203, 1.55026, 1, 0, 0.5686275, 1,
1.373714, -0.2299571, 2.1946, 1, 0, 0.5647059, 1,
1.376945, 1.12972, 1.713641, 1, 0, 0.5568628, 1,
1.381204, -1.18018, 2.056037, 1, 0, 0.5529412, 1,
1.382295, -0.153545, 1.465498, 1, 0, 0.5450981, 1,
1.39958, 1.007183, 2.227473, 1, 0, 0.5411765, 1,
1.404267, 0.8841812, -0.5011573, 1, 0, 0.5333334, 1,
1.414217, -0.5491227, 2.066253, 1, 0, 0.5294118, 1,
1.415626, 2.418147, -0.7696872, 1, 0, 0.5215687, 1,
1.417975, -0.4997292, 2.951221, 1, 0, 0.5176471, 1,
1.418596, 1.195902, 0.4280288, 1, 0, 0.509804, 1,
1.440645, 0.4547933, 0.9435943, 1, 0, 0.5058824, 1,
1.446302, 0.4536474, 1.018165, 1, 0, 0.4980392, 1,
1.451584, 1.222517, 0.7900848, 1, 0, 0.4901961, 1,
1.452471, -1.466893, 1.387177, 1, 0, 0.4862745, 1,
1.457461, -0.4836164, 2.202379, 1, 0, 0.4784314, 1,
1.457634, -0.3611694, 1.323935, 1, 0, 0.4745098, 1,
1.462921, 1.375978, 1.613468, 1, 0, 0.4666667, 1,
1.478432, 0.1525889, 1.449689, 1, 0, 0.4627451, 1,
1.480337, 0.06130889, -0.003332807, 1, 0, 0.454902, 1,
1.484606, 1.226865, 2.258881, 1, 0, 0.4509804, 1,
1.513048, 1.900942, 0.6875497, 1, 0, 0.4431373, 1,
1.51644, -0.5251922, 2.55308, 1, 0, 0.4392157, 1,
1.525077, -1.571242, 2.11652, 1, 0, 0.4313726, 1,
1.527206, 0.7026156, 2.610701, 1, 0, 0.427451, 1,
1.529697, -0.8100404, 3.521858, 1, 0, 0.4196078, 1,
1.532373, -2.050446, 0.432373, 1, 0, 0.4156863, 1,
1.550452, 0.5819855, 0.5718111, 1, 0, 0.4078431, 1,
1.56176, 0.8138315, 1.560106, 1, 0, 0.4039216, 1,
1.565657, 0.3343206, 0.5572272, 1, 0, 0.3960784, 1,
1.590609, 0.1420734, 1.676688, 1, 0, 0.3882353, 1,
1.593069, 0.8249775, 0.805366, 1, 0, 0.3843137, 1,
1.594647, 0.2407314, 2.267321, 1, 0, 0.3764706, 1,
1.597287, 1.21968, -0.1634935, 1, 0, 0.372549, 1,
1.598477, -0.5266637, 2.459628, 1, 0, 0.3647059, 1,
1.599533, 1.227664, 1.628149, 1, 0, 0.3607843, 1,
1.628446, -1.962411, 2.974575, 1, 0, 0.3529412, 1,
1.64191, 0.2128701, 0.8593197, 1, 0, 0.3490196, 1,
1.649991, 0.7746049, 1.397916, 1, 0, 0.3411765, 1,
1.654208, -0.5398464, 2.387932, 1, 0, 0.3372549, 1,
1.671155, -0.4923782, 2.38805, 1, 0, 0.3294118, 1,
1.68916, 0.1726746, 1.971701, 1, 0, 0.3254902, 1,
1.69085, 2.229337, 1.568226, 1, 0, 0.3176471, 1,
1.698352, 0.0420038, 1.613694, 1, 0, 0.3137255, 1,
1.700271, -1.106998, 1.626036, 1, 0, 0.3058824, 1,
1.70359, -0.3682212, -0.6091679, 1, 0, 0.2980392, 1,
1.705494, 0.2778502, -0.06855641, 1, 0, 0.2941177, 1,
1.713534, 1.225169, 1.743279, 1, 0, 0.2862745, 1,
1.715002, 0.04828275, 1.546687, 1, 0, 0.282353, 1,
1.725138, -1.236335, 1.904632, 1, 0, 0.2745098, 1,
1.732711, 0.3586134, 1.695016, 1, 0, 0.2705882, 1,
1.735495, -1.150266, 1.89761, 1, 0, 0.2627451, 1,
1.736356, 0.6791084, 1.694582, 1, 0, 0.2588235, 1,
1.745136, 1.368216, 0.9083475, 1, 0, 0.2509804, 1,
1.751746, -0.8982271, 2.528163, 1, 0, 0.2470588, 1,
1.764929, -0.4977093, 2.371695, 1, 0, 0.2392157, 1,
1.77451, -1.309863, 3.19911, 1, 0, 0.2352941, 1,
1.796728, 0.9911849, 0.4818435, 1, 0, 0.227451, 1,
1.797382, -1.134055, 3.616802, 1, 0, 0.2235294, 1,
1.798961, 0.9867394, 2.362893, 1, 0, 0.2156863, 1,
1.810483, 0.3901825, 1.464002, 1, 0, 0.2117647, 1,
1.811563, 0.0723137, 2.73229, 1, 0, 0.2039216, 1,
1.817178, 0.7510919, 3.748695, 1, 0, 0.1960784, 1,
1.859777, -0.09379472, 2.582715, 1, 0, 0.1921569, 1,
1.881415, 1.294126, 1.21054, 1, 0, 0.1843137, 1,
1.928657, 0.09483304, 2.791509, 1, 0, 0.1803922, 1,
1.929829, 0.09974996, 2.861038, 1, 0, 0.172549, 1,
1.963452, 1.522485, 1.57359, 1, 0, 0.1686275, 1,
1.963946, 0.02151233, 1.841253, 1, 0, 0.1607843, 1,
1.973918, 0.4258479, 1.546251, 1, 0, 0.1568628, 1,
1.982006, -1.013723, 2.135061, 1, 0, 0.1490196, 1,
1.994962, 2.055956, 0.8469121, 1, 0, 0.145098, 1,
2.031756, -0.5383167, 2.506675, 1, 0, 0.1372549, 1,
2.061134, -0.03197223, 0.7786803, 1, 0, 0.1333333, 1,
2.075195, 2.617168, -1.490634, 1, 0, 0.1254902, 1,
2.097171, -2.322485, 2.849936, 1, 0, 0.1215686, 1,
2.16132, -1.601056, 0.1668544, 1, 0, 0.1137255, 1,
2.169129, -0.1568379, 0.7146456, 1, 0, 0.1098039, 1,
2.172522, 0.5189732, 2.837029, 1, 0, 0.1019608, 1,
2.191016, -1.049004, 1.915863, 1, 0, 0.09411765, 1,
2.192247, -0.5608981, 2.736265, 1, 0, 0.09019608, 1,
2.208893, 0.9673229, 1.498881, 1, 0, 0.08235294, 1,
2.236841, -0.2302555, 3.025568, 1, 0, 0.07843138, 1,
2.335634, 0.9448004, -1.725308, 1, 0, 0.07058824, 1,
2.400038, 0.1599613, 1.395125, 1, 0, 0.06666667, 1,
2.41711, -1.674868, 2.057734, 1, 0, 0.05882353, 1,
2.447831, -1.558825, 3.522766, 1, 0, 0.05490196, 1,
2.461262, 0.3382361, 1.766437, 1, 0, 0.04705882, 1,
2.49075, -1.013656, 1.385423, 1, 0, 0.04313726, 1,
2.509677, -1.366524, 1.372225, 1, 0, 0.03529412, 1,
2.552223, -0.3785347, -0.1388866, 1, 0, 0.03137255, 1,
2.593913, -0.2850258, 0.1808051, 1, 0, 0.02352941, 1,
3.063021, -0.4080598, 1.539366, 1, 0, 0.01960784, 1,
3.077401, 0.4361669, 0.6206552, 1, 0, 0.01176471, 1,
3.162462, 1.707132, 1.712032, 1, 0, 0.007843138, 1
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
0.2682412, -4.612173, -7.377542, 0, -0.5, 0.5, 0.5,
0.2682412, -4.612173, -7.377542, 1, -0.5, 0.5, 0.5,
0.2682412, -4.612173, -7.377542, 1, 1.5, 0.5, 0.5,
0.2682412, -4.612173, -7.377542, 0, 1.5, 0.5, 0.5
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
-3.60712, -0.4302068, -7.377542, 0, -0.5, 0.5, 0.5,
-3.60712, -0.4302068, -7.377542, 1, -0.5, 0.5, 0.5,
-3.60712, -0.4302068, -7.377542, 1, 1.5, 0.5, 0.5,
-3.60712, -0.4302068, -7.377542, 0, 1.5, 0.5, 0.5
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
-3.60712, -4.612173, -0.01409769, 0, -0.5, 0.5, 0.5,
-3.60712, -4.612173, -0.01409769, 1, -0.5, 0.5, 0.5,
-3.60712, -4.612173, -0.01409769, 1, 1.5, 0.5, 0.5,
-3.60712, -4.612173, -0.01409769, 0, 1.5, 0.5, 0.5
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
-2, -3.647104, -5.678286,
3, -3.647104, -5.678286,
-2, -3.647104, -5.678286,
-2, -3.807949, -5.961495,
-1, -3.647104, -5.678286,
-1, -3.807949, -5.961495,
0, -3.647104, -5.678286,
0, -3.807949, -5.961495,
1, -3.647104, -5.678286,
1, -3.807949, -5.961495,
2, -3.647104, -5.678286,
2, -3.807949, -5.961495,
3, -3.647104, -5.678286,
3, -3.807949, -5.961495
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
-2, -4.129639, -6.527914, 0, -0.5, 0.5, 0.5,
-2, -4.129639, -6.527914, 1, -0.5, 0.5, 0.5,
-2, -4.129639, -6.527914, 1, 1.5, 0.5, 0.5,
-2, -4.129639, -6.527914, 0, 1.5, 0.5, 0.5,
-1, -4.129639, -6.527914, 0, -0.5, 0.5, 0.5,
-1, -4.129639, -6.527914, 1, -0.5, 0.5, 0.5,
-1, -4.129639, -6.527914, 1, 1.5, 0.5, 0.5,
-1, -4.129639, -6.527914, 0, 1.5, 0.5, 0.5,
0, -4.129639, -6.527914, 0, -0.5, 0.5, 0.5,
0, -4.129639, -6.527914, 1, -0.5, 0.5, 0.5,
0, -4.129639, -6.527914, 1, 1.5, 0.5, 0.5,
0, -4.129639, -6.527914, 0, 1.5, 0.5, 0.5,
1, -4.129639, -6.527914, 0, -0.5, 0.5, 0.5,
1, -4.129639, -6.527914, 1, -0.5, 0.5, 0.5,
1, -4.129639, -6.527914, 1, 1.5, 0.5, 0.5,
1, -4.129639, -6.527914, 0, 1.5, 0.5, 0.5,
2, -4.129639, -6.527914, 0, -0.5, 0.5, 0.5,
2, -4.129639, -6.527914, 1, -0.5, 0.5, 0.5,
2, -4.129639, -6.527914, 1, 1.5, 0.5, 0.5,
2, -4.129639, -6.527914, 0, 1.5, 0.5, 0.5,
3, -4.129639, -6.527914, 0, -0.5, 0.5, 0.5,
3, -4.129639, -6.527914, 1, -0.5, 0.5, 0.5,
3, -4.129639, -6.527914, 1, 1.5, 0.5, 0.5,
3, -4.129639, -6.527914, 0, 1.5, 0.5, 0.5
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
-2.712806, -3, -5.678286,
-2.712806, 2, -5.678286,
-2.712806, -3, -5.678286,
-2.861858, -3, -5.961495,
-2.712806, -2, -5.678286,
-2.861858, -2, -5.961495,
-2.712806, -1, -5.678286,
-2.861858, -1, -5.961495,
-2.712806, 0, -5.678286,
-2.861858, 0, -5.961495,
-2.712806, 1, -5.678286,
-2.861858, 1, -5.961495,
-2.712806, 2, -5.678286,
-2.861858, 2, -5.961495
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
-3.159963, -3, -6.527914, 0, -0.5, 0.5, 0.5,
-3.159963, -3, -6.527914, 1, -0.5, 0.5, 0.5,
-3.159963, -3, -6.527914, 1, 1.5, 0.5, 0.5,
-3.159963, -3, -6.527914, 0, 1.5, 0.5, 0.5,
-3.159963, -2, -6.527914, 0, -0.5, 0.5, 0.5,
-3.159963, -2, -6.527914, 1, -0.5, 0.5, 0.5,
-3.159963, -2, -6.527914, 1, 1.5, 0.5, 0.5,
-3.159963, -2, -6.527914, 0, 1.5, 0.5, 0.5,
-3.159963, -1, -6.527914, 0, -0.5, 0.5, 0.5,
-3.159963, -1, -6.527914, 1, -0.5, 0.5, 0.5,
-3.159963, -1, -6.527914, 1, 1.5, 0.5, 0.5,
-3.159963, -1, -6.527914, 0, 1.5, 0.5, 0.5,
-3.159963, 0, -6.527914, 0, -0.5, 0.5, 0.5,
-3.159963, 0, -6.527914, 1, -0.5, 0.5, 0.5,
-3.159963, 0, -6.527914, 1, 1.5, 0.5, 0.5,
-3.159963, 0, -6.527914, 0, 1.5, 0.5, 0.5,
-3.159963, 1, -6.527914, 0, -0.5, 0.5, 0.5,
-3.159963, 1, -6.527914, 1, -0.5, 0.5, 0.5,
-3.159963, 1, -6.527914, 1, 1.5, 0.5, 0.5,
-3.159963, 1, -6.527914, 0, 1.5, 0.5, 0.5,
-3.159963, 2, -6.527914, 0, -0.5, 0.5, 0.5,
-3.159963, 2, -6.527914, 1, -0.5, 0.5, 0.5,
-3.159963, 2, -6.527914, 1, 1.5, 0.5, 0.5,
-3.159963, 2, -6.527914, 0, 1.5, 0.5, 0.5
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
-2.712806, -3.647104, -4,
-2.712806, -3.647104, 4,
-2.712806, -3.647104, -4,
-2.861858, -3.807949, -4,
-2.712806, -3.647104, -2,
-2.861858, -3.807949, -2,
-2.712806, -3.647104, 0,
-2.861858, -3.807949, 0,
-2.712806, -3.647104, 2,
-2.861858, -3.807949, 2,
-2.712806, -3.647104, 4,
-2.861858, -3.807949, 4
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
-3.159963, -4.129639, -4, 0, -0.5, 0.5, 0.5,
-3.159963, -4.129639, -4, 1, -0.5, 0.5, 0.5,
-3.159963, -4.129639, -4, 1, 1.5, 0.5, 0.5,
-3.159963, -4.129639, -4, 0, 1.5, 0.5, 0.5,
-3.159963, -4.129639, -2, 0, -0.5, 0.5, 0.5,
-3.159963, -4.129639, -2, 1, -0.5, 0.5, 0.5,
-3.159963, -4.129639, -2, 1, 1.5, 0.5, 0.5,
-3.159963, -4.129639, -2, 0, 1.5, 0.5, 0.5,
-3.159963, -4.129639, 0, 0, -0.5, 0.5, 0.5,
-3.159963, -4.129639, 0, 1, -0.5, 0.5, 0.5,
-3.159963, -4.129639, 0, 1, 1.5, 0.5, 0.5,
-3.159963, -4.129639, 0, 0, 1.5, 0.5, 0.5,
-3.159963, -4.129639, 2, 0, -0.5, 0.5, 0.5,
-3.159963, -4.129639, 2, 1, -0.5, 0.5, 0.5,
-3.159963, -4.129639, 2, 1, 1.5, 0.5, 0.5,
-3.159963, -4.129639, 2, 0, 1.5, 0.5, 0.5,
-3.159963, -4.129639, 4, 0, -0.5, 0.5, 0.5,
-3.159963, -4.129639, 4, 1, -0.5, 0.5, 0.5,
-3.159963, -4.129639, 4, 1, 1.5, 0.5, 0.5,
-3.159963, -4.129639, 4, 0, 1.5, 0.5, 0.5
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
-2.712806, -3.647104, -5.678286,
-2.712806, 2.78669, -5.678286,
-2.712806, -3.647104, 5.65009,
-2.712806, 2.78669, 5.65009,
-2.712806, -3.647104, -5.678286,
-2.712806, -3.647104, 5.65009,
-2.712806, 2.78669, -5.678286,
-2.712806, 2.78669, 5.65009,
-2.712806, -3.647104, -5.678286,
3.249288, -3.647104, -5.678286,
-2.712806, -3.647104, 5.65009,
3.249288, -3.647104, 5.65009,
-2.712806, 2.78669, -5.678286,
3.249288, 2.78669, -5.678286,
-2.712806, 2.78669, 5.65009,
3.249288, 2.78669, 5.65009,
3.249288, -3.647104, -5.678286,
3.249288, 2.78669, -5.678286,
3.249288, -3.647104, 5.65009,
3.249288, 2.78669, 5.65009,
3.249288, -3.647104, -5.678286,
3.249288, -3.647104, 5.65009,
3.249288, 2.78669, -5.678286,
3.249288, 2.78669, 5.65009
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
var radius = 7.650516;
var distance = 34.03801;
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
mvMatrix.translate( -0.2682412, 0.4302068, 0.01409769 );
mvMatrix.scale( 1.387413, 1.285694, 0.7301918 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.03801);
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
demeton-O<-read.table("demeton-O.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-demeton-O$V2
```

```
## Error in eval(expr, envir, enclos): object 'demeton' not found
```

```r
y<-demeton-O$V3
```

```
## Error in eval(expr, envir, enclos): object 'demeton' not found
```

```r
z<-demeton-O$V4
```

```
## Error in eval(expr, envir, enclos): object 'demeton' not found
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
-2.625979, 1.354171, -0.6025236, 0, 0, 1, 1, 1,
-2.550366, -1.139043, -2.452026, 1, 0, 0, 1, 1,
-2.507205, -0.4050226, -1.954784, 1, 0, 0, 1, 1,
-2.478076, -0.8049049, -2.856385, 1, 0, 0, 1, 1,
-2.459683, -0.3614303, -0.4931795, 1, 0, 0, 1, 1,
-2.322021, -0.1263982, -1.678994, 1, 0, 0, 1, 1,
-2.313607, 0.7396226, -1.935087, 0, 0, 0, 1, 1,
-2.304168, 0.6777527, -1.780374, 0, 0, 0, 1, 1,
-2.259345, 1.193142, -0.7731856, 0, 0, 0, 1, 1,
-2.147904, -1.628741, -0.9104829, 0, 0, 0, 1, 1,
-2.126825, 0.6699246, -1.593604, 0, 0, 0, 1, 1,
-2.123257, -0.4152604, -1.271351, 0, 0, 0, 1, 1,
-2.119375, -0.5977551, -2.563892, 0, 0, 0, 1, 1,
-2.118901, 1.328081, -0.2445701, 1, 1, 1, 1, 1,
-2.110106, 0.8915665, -2.970825, 1, 1, 1, 1, 1,
-2.072715, -0.07067532, -1.481041, 1, 1, 1, 1, 1,
-2.07223, 0.4632401, -2.280538, 1, 1, 1, 1, 1,
-2.07112, 1.114395, -2.257428, 1, 1, 1, 1, 1,
-2.060689, -0.6763682, -2.528047, 1, 1, 1, 1, 1,
-2.038284, 0.8148125, -0.6972468, 1, 1, 1, 1, 1,
-2.028534, -1.056186, 0.1089236, 1, 1, 1, 1, 1,
-2.02847, -2.093428, -1.947646, 1, 1, 1, 1, 1,
-2.027179, 0.6861731, -0.5322739, 1, 1, 1, 1, 1,
-1.979642, 0.7139155, -0.8154615, 1, 1, 1, 1, 1,
-1.972772, -0.8045561, -2.075586, 1, 1, 1, 1, 1,
-1.963962, -0.03477512, -0.720486, 1, 1, 1, 1, 1,
-1.952904, -0.492122, -3.363496, 1, 1, 1, 1, 1,
-1.919631, 0.2124541, -0.7512251, 1, 1, 1, 1, 1,
-1.888819, 0.1726748, -3.059471, 0, 0, 1, 1, 1,
-1.84954, -0.6472386, -3.132489, 1, 0, 0, 1, 1,
-1.849495, -1.71216, -2.970171, 1, 0, 0, 1, 1,
-1.837393, 0.009716494, -3.216047, 1, 0, 0, 1, 1,
-1.815836, -0.5611264, -3.569896, 1, 0, 0, 1, 1,
-1.791289, -0.54061, -2.272879, 1, 0, 0, 1, 1,
-1.791166, -0.1374236, -0.7037929, 0, 0, 0, 1, 1,
-1.779471, 1.629964, -0.7801282, 0, 0, 0, 1, 1,
-1.771394, 0.33935, -1.911065, 0, 0, 0, 1, 1,
-1.753549, -0.116672, -1.978459, 0, 0, 0, 1, 1,
-1.749367, 0.2764406, -1.29259, 0, 0, 0, 1, 1,
-1.721604, -2.175713, -2.017997, 0, 0, 0, 1, 1,
-1.719831, -0.4038225, -2.825737, 0, 0, 0, 1, 1,
-1.718194, -1.189231, -0.6005031, 1, 1, 1, 1, 1,
-1.715847, -0.3918531, 1.102289, 1, 1, 1, 1, 1,
-1.702781, -0.1608634, -1.225352, 1, 1, 1, 1, 1,
-1.678368, -0.2850152, -2.842319, 1, 1, 1, 1, 1,
-1.643814, -0.5290598, -2.429757, 1, 1, 1, 1, 1,
-1.624642, -1.58497, -1.683974, 1, 1, 1, 1, 1,
-1.623984, 1.062708, -1.287425, 1, 1, 1, 1, 1,
-1.591157, 0.6128704, -0.8330534, 1, 1, 1, 1, 1,
-1.569759, -1.100868, -2.435245, 1, 1, 1, 1, 1,
-1.568484, 0.2393296, -0.643383, 1, 1, 1, 1, 1,
-1.560834, 0.7932681, -0.6210753, 1, 1, 1, 1, 1,
-1.559004, 0.7822393, -0.3550609, 1, 1, 1, 1, 1,
-1.555457, 0.3108271, -1.479602, 1, 1, 1, 1, 1,
-1.548863, -1.400213, -0.0142521, 1, 1, 1, 1, 1,
-1.540603, -1.355425, -2.202064, 1, 1, 1, 1, 1,
-1.513791, 0.8857074, -0.9724435, 0, 0, 1, 1, 1,
-1.506303, -0.8791175, -2.919708, 1, 0, 0, 1, 1,
-1.505895, -0.4379101, -1.817099, 1, 0, 0, 1, 1,
-1.500492, 0.8467765, -1.057472, 1, 0, 0, 1, 1,
-1.492347, -1.365973, -3.707052, 1, 0, 0, 1, 1,
-1.471379, -0.9628796, -2.865777, 1, 0, 0, 1, 1,
-1.449676, -0.1582371, -0.9529303, 0, 0, 0, 1, 1,
-1.436742, 0.4862109, -0.6616225, 0, 0, 0, 1, 1,
-1.43535, -0.0857089, -1.207126, 0, 0, 0, 1, 1,
-1.429753, 0.03650936, -2.657281, 0, 0, 0, 1, 1,
-1.429474, -0.09299777, -1.118126, 0, 0, 0, 1, 1,
-1.425255, -0.02226321, -2.900413, 0, 0, 0, 1, 1,
-1.415309, 0.9611321, 0.397367, 0, 0, 0, 1, 1,
-1.412227, -0.6208379, -2.690865, 1, 1, 1, 1, 1,
-1.411371, -0.1703784, -3.249348, 1, 1, 1, 1, 1,
-1.411286, 1.100912, -0.7698992, 1, 1, 1, 1, 1,
-1.403245, 1.64005, -1.409103, 1, 1, 1, 1, 1,
-1.39141, -0.1773851, -0.4408333, 1, 1, 1, 1, 1,
-1.388246, -0.1578031, -2.210562, 1, 1, 1, 1, 1,
-1.384886, 0.4148457, -1.020036, 1, 1, 1, 1, 1,
-1.373585, -0.2233335, -1.776186, 1, 1, 1, 1, 1,
-1.368035, 0.6675178, -1.906982, 1, 1, 1, 1, 1,
-1.367866, -0.3248394, -1.926635, 1, 1, 1, 1, 1,
-1.314919, 0.544451, -3.086289, 1, 1, 1, 1, 1,
-1.310251, -0.7093983, -1.139006, 1, 1, 1, 1, 1,
-1.309526, -1.884923, -1.59228, 1, 1, 1, 1, 1,
-1.308303, 0.5566279, -0.6048932, 1, 1, 1, 1, 1,
-1.301619, -0.1182795, -1.657179, 1, 1, 1, 1, 1,
-1.292355, -0.6955758, -1.265378, 0, 0, 1, 1, 1,
-1.286887, -0.008843406, -1.405433, 1, 0, 0, 1, 1,
-1.283833, -1.176662, -2.721791, 1, 0, 0, 1, 1,
-1.279322, 1.023107, -2.206854, 1, 0, 0, 1, 1,
-1.273842, 1.538777, 0.8640702, 1, 0, 0, 1, 1,
-1.27024, -0.7039034, -2.702984, 1, 0, 0, 1, 1,
-1.266886, -0.5209605, -4.394763, 0, 0, 0, 1, 1,
-1.264379, -1.45576, -4.025323, 0, 0, 0, 1, 1,
-1.261078, -2.696246, -1.588789, 0, 0, 0, 1, 1,
-1.250659, -0.08351658, -1.642308, 0, 0, 0, 1, 1,
-1.241458, 0.6635119, -0.04721382, 0, 0, 0, 1, 1,
-1.235286, -0.05557504, -1.184124, 0, 0, 0, 1, 1,
-1.231801, 0.2078479, -2.40732, 0, 0, 0, 1, 1,
-1.22675, 0.9081317, 0.4142662, 1, 1, 1, 1, 1,
-1.226495, 0.101614, -1.324439, 1, 1, 1, 1, 1,
-1.226228, -0.07987274, -1.643681, 1, 1, 1, 1, 1,
-1.223016, -1.155625, -1.264258, 1, 1, 1, 1, 1,
-1.217916, 0.1910683, -1.010653, 1, 1, 1, 1, 1,
-1.215379, -0.2721905, -3.818445, 1, 1, 1, 1, 1,
-1.210096, 0.8438482, -1.425634, 1, 1, 1, 1, 1,
-1.202229, 1.742921, -0.7448171, 1, 1, 1, 1, 1,
-1.201691, 0.903364, -0.01049804, 1, 1, 1, 1, 1,
-1.193095, 0.3965396, -1.959787, 1, 1, 1, 1, 1,
-1.191767, 1.445097, -0.9988019, 1, 1, 1, 1, 1,
-1.191289, -0.8009753, -1.282909, 1, 1, 1, 1, 1,
-1.18882, 0.01790467, -2.411719, 1, 1, 1, 1, 1,
-1.186321, -1.122609, -2.290016, 1, 1, 1, 1, 1,
-1.182459, 0.8563718, -0.4046211, 1, 1, 1, 1, 1,
-1.179985, 0.07940469, -1.110545, 0, 0, 1, 1, 1,
-1.175178, 0.2023705, -1.635214, 1, 0, 0, 1, 1,
-1.16173, -1.270285, -1.786525, 1, 0, 0, 1, 1,
-1.160555, -0.6359774, -1.844892, 1, 0, 0, 1, 1,
-1.149714, -0.01064454, -2.236066, 1, 0, 0, 1, 1,
-1.149201, -1.384179, -3.449228, 1, 0, 0, 1, 1,
-1.148012, 0.5339836, -0.756496, 0, 0, 0, 1, 1,
-1.146609, -1.527046, -1.348696, 0, 0, 0, 1, 1,
-1.14482, 0.8890154, -0.6208302, 0, 0, 0, 1, 1,
-1.143757, 0.6788471, -0.5359551, 0, 0, 0, 1, 1,
-1.138654, -0.125501, -2.433766, 0, 0, 0, 1, 1,
-1.136419, 0.1751206, -2.472009, 0, 0, 0, 1, 1,
-1.132702, -0.5555105, -1.165728, 0, 0, 0, 1, 1,
-1.131763, 0.3015712, 0.04327443, 1, 1, 1, 1, 1,
-1.110748, -0.1852256, -1.512448, 1, 1, 1, 1, 1,
-1.106934, -0.9347824, -3.657944, 1, 1, 1, 1, 1,
-1.105853, 0.2961956, 0.2205703, 1, 1, 1, 1, 1,
-1.105576, 1.578808, -0.5060375, 1, 1, 1, 1, 1,
-1.098847, -0.5118981, -3.352171, 1, 1, 1, 1, 1,
-1.093422, -0.1692048, -2.384334, 1, 1, 1, 1, 1,
-1.089498, -0.1265625, -1.42102, 1, 1, 1, 1, 1,
-1.084089, -1.420038, -2.395366, 1, 1, 1, 1, 1,
-1.082023, -0.6817519, -4.208639, 1, 1, 1, 1, 1,
-1.079698, -0.7463121, -3.118964, 1, 1, 1, 1, 1,
-1.078891, -0.4353808, -2.609281, 1, 1, 1, 1, 1,
-1.070358, -0.3535665, -1.590942, 1, 1, 1, 1, 1,
-1.067133, 0.1075674, -2.553312, 1, 1, 1, 1, 1,
-1.066886, -0.3610632, -3.860838, 1, 1, 1, 1, 1,
-1.05701, 0.5001031, -1.82412, 0, 0, 1, 1, 1,
-1.05644, 0.6394096, -1.540947, 1, 0, 0, 1, 1,
-1.054901, 0.932838, -0.2136573, 1, 0, 0, 1, 1,
-1.052944, -0.01136321, -2.583155, 1, 0, 0, 1, 1,
-1.039812, -0.08581893, -3.810625, 1, 0, 0, 1, 1,
-1.039614, -0.06694535, -1.769178, 1, 0, 0, 1, 1,
-1.039244, -0.1802703, -3.596147, 0, 0, 0, 1, 1,
-1.030874, 0.5534116, -2.291286, 0, 0, 0, 1, 1,
-1.026439, 0.09620299, -1.948575, 0, 0, 0, 1, 1,
-1.025673, 1.421282, -0.2074393, 0, 0, 0, 1, 1,
-1.019505, 0.6049442, -0.6099875, 0, 0, 0, 1, 1,
-1.016682, -0.7297429, -2.829427, 0, 0, 0, 1, 1,
-1.003667, 1.001809, 0.6464543, 0, 0, 0, 1, 1,
-1.000179, 0.6888142, -2.396027, 1, 1, 1, 1, 1,
-0.9997714, -0.5061942, -1.571222, 1, 1, 1, 1, 1,
-0.9922386, 1.193874, 0.0271577, 1, 1, 1, 1, 1,
-0.9910156, 0.6329502, -2.12353, 1, 1, 1, 1, 1,
-0.9807244, 1.556454, -0.7793832, 1, 1, 1, 1, 1,
-0.978258, 1.368029, -0.7091957, 1, 1, 1, 1, 1,
-0.9685936, 0.7600553, -0.2892853, 1, 1, 1, 1, 1,
-0.965858, 0.9183396, -0.3203162, 1, 1, 1, 1, 1,
-0.9587899, -2.653192, -2.163272, 1, 1, 1, 1, 1,
-0.9570736, -0.6973291, -1.131915, 1, 1, 1, 1, 1,
-0.9545291, 0.5225387, -0.5538201, 1, 1, 1, 1, 1,
-0.9542946, -0.9963685, -2.087073, 1, 1, 1, 1, 1,
-0.9515356, 1.320089, -0.3006452, 1, 1, 1, 1, 1,
-0.9430994, -0.07892318, -0.3417968, 1, 1, 1, 1, 1,
-0.9341194, 0.6344892, -0.4455274, 1, 1, 1, 1, 1,
-0.9326966, 1.024378, -0.8072519, 0, 0, 1, 1, 1,
-0.9308587, -0.05379215, -0.3370292, 1, 0, 0, 1, 1,
-0.926396, -0.1616445, -1.10848, 1, 0, 0, 1, 1,
-0.9246926, 0.1603088, -0.9570256, 1, 0, 0, 1, 1,
-0.9214044, -0.8972203, -2.759702, 1, 0, 0, 1, 1,
-0.9157258, 0.2374123, -1.578926, 1, 0, 0, 1, 1,
-0.9127086, 0.7959564, 0.4485953, 0, 0, 0, 1, 1,
-0.9122741, 0.5479949, -0.7851966, 0, 0, 0, 1, 1,
-0.9121044, 0.2791312, -2.091771, 0, 0, 0, 1, 1,
-0.9074194, 0.2379103, -1.044661, 0, 0, 0, 1, 1,
-0.9054147, 0.4999619, 0.2128974, 0, 0, 0, 1, 1,
-0.8988691, -0.1998816, -2.462514, 0, 0, 0, 1, 1,
-0.8986719, -0.691709, -3.367077, 0, 0, 0, 1, 1,
-0.8983407, -0.7013882, -1.534688, 1, 1, 1, 1, 1,
-0.8894783, -0.08465339, -0.6791101, 1, 1, 1, 1, 1,
-0.887767, -0.3462754, -0.4237583, 1, 1, 1, 1, 1,
-0.876925, -0.7293077, -1.950346, 1, 1, 1, 1, 1,
-0.8747032, 1.16563, -0.9033269, 1, 1, 1, 1, 1,
-0.8714381, 1.110264, -1.212584, 1, 1, 1, 1, 1,
-0.8660015, -0.17309, -2.330177, 1, 1, 1, 1, 1,
-0.846546, -0.1092204, -1.110546, 1, 1, 1, 1, 1,
-0.8439214, -0.2929423, -0.8682746, 1, 1, 1, 1, 1,
-0.8434744, -0.4485133, -2.248139, 1, 1, 1, 1, 1,
-0.8398972, 0.836353, -0.4793321, 1, 1, 1, 1, 1,
-0.8393233, -0.5726978, -0.4403, 1, 1, 1, 1, 1,
-0.8377345, 1.294817, 1.033362, 1, 1, 1, 1, 1,
-0.8369592, 1.69515, -0.4034406, 1, 1, 1, 1, 1,
-0.8365229, -0.03811373, -1.557291, 1, 1, 1, 1, 1,
-0.8353596, 0.1100444, -2.7958, 0, 0, 1, 1, 1,
-0.8339806, 1.121182, -0.1412497, 1, 0, 0, 1, 1,
-0.8320295, -0.6460039, -2.610604, 1, 0, 0, 1, 1,
-0.8278952, 0.270184, -1.492736, 1, 0, 0, 1, 1,
-0.8273133, 0.644426, -0.6534784, 1, 0, 0, 1, 1,
-0.8132123, 0.2531482, -1.82138, 1, 0, 0, 1, 1,
-0.8103193, 1.125161, -2.23191, 0, 0, 0, 1, 1,
-0.8052478, -0.3741091, -1.959107, 0, 0, 0, 1, 1,
-0.8043128, 0.3202927, -2.80518, 0, 0, 0, 1, 1,
-0.7979099, 0.09493794, -0.9828988, 0, 0, 0, 1, 1,
-0.796765, 1.06793, 0.5175197, 0, 0, 0, 1, 1,
-0.7937192, -1.703686, -1.180997, 0, 0, 0, 1, 1,
-0.7929151, 1.241165, -1.216414, 0, 0, 0, 1, 1,
-0.7913876, -0.4374841, -2.941125, 1, 1, 1, 1, 1,
-0.7881337, -0.5620465, -0.8454813, 1, 1, 1, 1, 1,
-0.7831449, -0.3297342, -1.904351, 1, 1, 1, 1, 1,
-0.780274, 2.32639, 1.283885, 1, 1, 1, 1, 1,
-0.7760692, 0.2097481, -0.790058, 1, 1, 1, 1, 1,
-0.7747784, 0.2641072, -0.7595651, 1, 1, 1, 1, 1,
-0.7741721, 0.4982356, -2.579159, 1, 1, 1, 1, 1,
-0.7738057, 0.6147465, -1.921784, 1, 1, 1, 1, 1,
-0.7720097, 1.185963, -2.481837, 1, 1, 1, 1, 1,
-0.7674527, -1.513111, -4.112065, 1, 1, 1, 1, 1,
-0.7651289, 0.9717318, -0.2238176, 1, 1, 1, 1, 1,
-0.7635279, 0.5397614, -1.682301, 1, 1, 1, 1, 1,
-0.7562901, -0.7498069, -2.689188, 1, 1, 1, 1, 1,
-0.7557973, 0.2460298, -2.039753, 1, 1, 1, 1, 1,
-0.7525879, 0.6653563, -2.540143, 1, 1, 1, 1, 1,
-0.7523428, 1.202307, -0.2650851, 0, 0, 1, 1, 1,
-0.7521656, 0.2888698, -0.9922423, 1, 0, 0, 1, 1,
-0.7448648, 0.2625337, -0.8231676, 1, 0, 0, 1, 1,
-0.7438278, 0.688768, -2.050365, 1, 0, 0, 1, 1,
-0.7390844, -3.553408, -2.058661, 1, 0, 0, 1, 1,
-0.7294021, -0.477929, -3.077335, 1, 0, 0, 1, 1,
-0.7281716, 0.2416522, -3.145441, 0, 0, 0, 1, 1,
-0.7276932, -0.838965, -3.785507, 0, 0, 0, 1, 1,
-0.7206084, -0.2131342, -2.169219, 0, 0, 0, 1, 1,
-0.7156224, -0.1103801, -2.126896, 0, 0, 0, 1, 1,
-0.7150229, -0.3341316, -1.168138, 0, 0, 0, 1, 1,
-0.7146705, -1.245417, -3.557524, 0, 0, 0, 1, 1,
-0.7118366, 0.4690879, -1.86824, 0, 0, 0, 1, 1,
-0.7114556, 2.450387, -1.376526, 1, 1, 1, 1, 1,
-0.708733, 0.7508461, 1.231688, 1, 1, 1, 1, 1,
-0.7049426, -0.5254891, -3.325149, 1, 1, 1, 1, 1,
-0.7036904, 1.894597, -0.5347745, 1, 1, 1, 1, 1,
-0.702501, 1.515171, -0.6641448, 1, 1, 1, 1, 1,
-0.6980003, 0.8310491, 0.0345769, 1, 1, 1, 1, 1,
-0.6958399, -1.236427, -2.172844, 1, 1, 1, 1, 1,
-0.6870119, 0.05484863, -1.184725, 1, 1, 1, 1, 1,
-0.6828604, 0.2037233, -2.712206, 1, 1, 1, 1, 1,
-0.6825123, 0.5716882, 0.04332275, 1, 1, 1, 1, 1,
-0.6807849, -0.1847934, -1.717733, 1, 1, 1, 1, 1,
-0.6803518, -0.1066011, -3.167456, 1, 1, 1, 1, 1,
-0.6711845, 1.679451, -2.300138, 1, 1, 1, 1, 1,
-0.6705997, -0.7083116, -3.436055, 1, 1, 1, 1, 1,
-0.6583169, -0.3477661, -1.877161, 1, 1, 1, 1, 1,
-0.6582731, -1.149186, -3.695715, 0, 0, 1, 1, 1,
-0.6571078, 0.7407068, 0.2708664, 1, 0, 0, 1, 1,
-0.6566988, -0.260762, -1.4408, 1, 0, 0, 1, 1,
-0.6527846, 0.6135724, -0.6645479, 1, 0, 0, 1, 1,
-0.6489579, 0.3288611, -1.015087, 1, 0, 0, 1, 1,
-0.6486123, -1.912998, -2.907939, 1, 0, 0, 1, 1,
-0.6408697, 1.311966, -0.4269058, 0, 0, 0, 1, 1,
-0.6341935, -1.03793, -3.181721, 0, 0, 0, 1, 1,
-0.6329655, -0.3745931, -1.820736, 0, 0, 0, 1, 1,
-0.6326968, 0.8923552, -0.990831, 0, 0, 0, 1, 1,
-0.6308308, 0.1850833, -1.495759, 0, 0, 0, 1, 1,
-0.6288034, 0.01903712, -2.250408, 0, 0, 0, 1, 1,
-0.6246405, -0.5538667, -2.410107, 0, 0, 0, 1, 1,
-0.6210625, 1.009424, -1.031018, 1, 1, 1, 1, 1,
-0.6190245, -1.730183, -2.330533, 1, 1, 1, 1, 1,
-0.6181098, -1.020521, -3.32578, 1, 1, 1, 1, 1,
-0.6145, -2.208076, -3.842768, 1, 1, 1, 1, 1,
-0.6094971, 1.494385, -0.05550494, 1, 1, 1, 1, 1,
-0.609069, 1.759425, -0.7523276, 1, 1, 1, 1, 1,
-0.6082965, 1.728715, 0.7871692, 1, 1, 1, 1, 1,
-0.6065903, 0.2137892, -0.9526667, 1, 1, 1, 1, 1,
-0.5992981, 0.1579788, -1.596178, 1, 1, 1, 1, 1,
-0.5992572, -0.3317603, -1.960899, 1, 1, 1, 1, 1,
-0.5977435, 1.873247, -1.273675, 1, 1, 1, 1, 1,
-0.5879976, -1.337235, -2.337443, 1, 1, 1, 1, 1,
-0.5844148, 0.3276469, -0.4198081, 1, 1, 1, 1, 1,
-0.5798661, 0.2297288, 0.1430383, 1, 1, 1, 1, 1,
-0.5723177, 0.9900316, 1.659626, 1, 1, 1, 1, 1,
-0.5708368, -2.016405, -0.9142042, 0, 0, 1, 1, 1,
-0.5682411, 0.5187683, -2.044611, 1, 0, 0, 1, 1,
-0.5603297, 0.02453552, -0.4599405, 1, 0, 0, 1, 1,
-0.5599259, -0.7874963, -1.880242, 1, 0, 0, 1, 1,
-0.5569899, 0.3514304, -2.427423, 1, 0, 0, 1, 1,
-0.5478475, 0.1355408, -2.64053, 1, 0, 0, 1, 1,
-0.5461879, -0.4380184, -2.742021, 0, 0, 0, 1, 1,
-0.5445919, -1.067815, -2.640579, 0, 0, 0, 1, 1,
-0.5422707, 1.685329, 0.7158212, 0, 0, 0, 1, 1,
-0.5392631, 1.140715, -0.7257904, 0, 0, 0, 1, 1,
-0.5391428, -0.323819, -1.496777, 0, 0, 0, 1, 1,
-0.534437, -0.3378816, -1.768429, 0, 0, 0, 1, 1,
-0.53117, 1.000207, -0.6291084, 0, 0, 0, 1, 1,
-0.5274617, -1.729051, -5.513309, 1, 1, 1, 1, 1,
-0.5247564, -0.8114283, -2.063469, 1, 1, 1, 1, 1,
-0.5244629, 1.266526, -2.265378, 1, 1, 1, 1, 1,
-0.5236965, 1.457058, -1.050525, 1, 1, 1, 1, 1,
-0.5217567, 1.779283, -0.4068027, 1, 1, 1, 1, 1,
-0.5205005, 0.1249369, -0.8236033, 1, 1, 1, 1, 1,
-0.5195791, -0.2295974, -1.062119, 1, 1, 1, 1, 1,
-0.5195728, 0.2503715, 1.654542, 1, 1, 1, 1, 1,
-0.5171409, -0.06923164, -1.176786, 1, 1, 1, 1, 1,
-0.5167245, 0.9618467, -1.524621, 1, 1, 1, 1, 1,
-0.5164162, -0.5850819, -2.678423, 1, 1, 1, 1, 1,
-0.5155743, -0.4647835, -3.126688, 1, 1, 1, 1, 1,
-0.5152912, 0.242721, -0.9792387, 1, 1, 1, 1, 1,
-0.5147812, -0.4747104, -2.048374, 1, 1, 1, 1, 1,
-0.5116765, 1.163292, -0.4694677, 1, 1, 1, 1, 1,
-0.5058958, -1.496464, -3.529857, 0, 0, 1, 1, 1,
-0.5031474, 1.637967, 0.5531737, 1, 0, 0, 1, 1,
-0.4992053, -0.08348124, -0.929839, 1, 0, 0, 1, 1,
-0.4965651, 0.8101377, -1.109181, 1, 0, 0, 1, 1,
-0.4955834, 1.873988, 1.446334, 1, 0, 0, 1, 1,
-0.4950766, 0.8904545, 0.01605014, 1, 0, 0, 1, 1,
-0.4939315, -0.4497857, -1.22747, 0, 0, 0, 1, 1,
-0.4901347, -2.236651, -3.864673, 0, 0, 0, 1, 1,
-0.489499, -0.5990233, -3.283289, 0, 0, 0, 1, 1,
-0.4888844, 0.06698729, -2.760564, 0, 0, 0, 1, 1,
-0.4851298, 0.6345121, -0.6168377, 0, 0, 0, 1, 1,
-0.4845092, -0.2832642, -1.489301, 0, 0, 0, 1, 1,
-0.4838219, 0.1524368, -0.6072783, 0, 0, 0, 1, 1,
-0.4836091, 0.3153503, -1.450432, 1, 1, 1, 1, 1,
-0.4786972, -0.1362921, -1.153025, 1, 1, 1, 1, 1,
-0.4750373, 0.5457261, -1.42385, 1, 1, 1, 1, 1,
-0.4748263, 0.3797973, -0.278839, 1, 1, 1, 1, 1,
-0.4746346, 0.5423462, -0.6170521, 1, 1, 1, 1, 1,
-0.4741502, -0.0108505, -1.753109, 1, 1, 1, 1, 1,
-0.4735053, 0.9774989, 2.369148, 1, 1, 1, 1, 1,
-0.469759, 0.7920082, 0.2113978, 1, 1, 1, 1, 1,
-0.4691782, -0.2778746, -2.073624, 1, 1, 1, 1, 1,
-0.4583456, -1.474868, -1.25833, 1, 1, 1, 1, 1,
-0.4535688, -0.1687939, -3.499796, 1, 1, 1, 1, 1,
-0.451947, -0.6195341, -4.782886, 1, 1, 1, 1, 1,
-0.449032, -0.9841954, -4.004992, 1, 1, 1, 1, 1,
-0.4484943, -0.5484888, -2.691191, 1, 1, 1, 1, 1,
-0.4451664, 1.064841, 0.5744236, 1, 1, 1, 1, 1,
-0.4451554, -1.166643, -4.883551, 0, 0, 1, 1, 1,
-0.4377962, -0.3253991, -2.802118, 1, 0, 0, 1, 1,
-0.4354995, -1.348675, -3.547729, 1, 0, 0, 1, 1,
-0.4333222, 0.6377115, -1.091772, 1, 0, 0, 1, 1,
-0.4313852, 0.5580912, 0.488427, 1, 0, 0, 1, 1,
-0.431314, -0.5001502, -0.9929845, 1, 0, 0, 1, 1,
-0.430364, 0.3563326, -0.5150748, 0, 0, 0, 1, 1,
-0.4267612, 0.9314173, -0.3757236, 0, 0, 0, 1, 1,
-0.4196605, 0.3469499, -0.9462051, 0, 0, 0, 1, 1,
-0.4195168, 0.4339457, -1.657227, 0, 0, 0, 1, 1,
-0.4186005, 1.357672, 0.168249, 0, 0, 0, 1, 1,
-0.4174741, -0.8502976, -2.634266, 0, 0, 0, 1, 1,
-0.4141871, 1.163332, -0.3959299, 0, 0, 0, 1, 1,
-0.4114897, 2.061582, 0.1335343, 1, 1, 1, 1, 1,
-0.4079358, 0.5603429, -2.910485, 1, 1, 1, 1, 1,
-0.4067743, 1.760036, -1.345286, 1, 1, 1, 1, 1,
-0.4020165, 1.416071, -0.08700303, 1, 1, 1, 1, 1,
-0.3986707, -1.003682, -4.182428, 1, 1, 1, 1, 1,
-0.3969021, 0.7856774, 0.7368579, 1, 1, 1, 1, 1,
-0.3953839, 0.9268848, -0.5838987, 1, 1, 1, 1, 1,
-0.3934878, 0.12786, -2.462919, 1, 1, 1, 1, 1,
-0.3914466, 0.04457829, -1.712863, 1, 1, 1, 1, 1,
-0.3891096, -1.749979, -2.332443, 1, 1, 1, 1, 1,
-0.3854154, 0.1577148, -1.394704, 1, 1, 1, 1, 1,
-0.3807054, 0.06907501, -3.391567, 1, 1, 1, 1, 1,
-0.3807032, -1.109581, -3.115963, 1, 1, 1, 1, 1,
-0.3792464, 2.235174, -1.683796, 1, 1, 1, 1, 1,
-0.3778097, 0.04821315, -3.073038, 1, 1, 1, 1, 1,
-0.3720687, -0.2491415, -2.455876, 0, 0, 1, 1, 1,
-0.3705344, 0.9088513, -1.321787, 1, 0, 0, 1, 1,
-0.3613044, 0.01381136, -2.595251, 1, 0, 0, 1, 1,
-0.3600415, 1.068228, 1.035313, 1, 0, 0, 1, 1,
-0.3594016, 1.054754, -0.6441603, 1, 0, 0, 1, 1,
-0.3507653, -0.6427529, -1.974071, 1, 0, 0, 1, 1,
-0.3491836, -0.9060674, -2.672949, 0, 0, 0, 1, 1,
-0.3469293, -0.6329795, -3.535137, 0, 0, 0, 1, 1,
-0.3446968, 0.481919, -1.689521, 0, 0, 0, 1, 1,
-0.3408455, -0.2432171, -2.015544, 0, 0, 0, 1, 1,
-0.3371171, 1.269536, -2.134181, 0, 0, 0, 1, 1,
-0.3359711, -0.4104469, -1.666925, 0, 0, 0, 1, 1,
-0.333746, 0.2109679, -1.357947, 0, 0, 0, 1, 1,
-0.3312858, 0.1854214, 0.4066208, 1, 1, 1, 1, 1,
-0.3289907, -0.1005112, -3.194321, 1, 1, 1, 1, 1,
-0.3283453, 0.3752768, -0.2671366, 1, 1, 1, 1, 1,
-0.3248723, -0.5357101, -1.924907, 1, 1, 1, 1, 1,
-0.3239701, 0.3433373, -1.072003, 1, 1, 1, 1, 1,
-0.3208727, -0.2262496, -1.795424, 1, 1, 1, 1, 1,
-0.3191448, -2.099358, -3.657214, 1, 1, 1, 1, 1,
-0.3121784, -0.5907965, -2.618883, 1, 1, 1, 1, 1,
-0.310074, -0.2401815, -2.16962, 1, 1, 1, 1, 1,
-0.3035209, -0.6262959, -1.501628, 1, 1, 1, 1, 1,
-0.3027053, 1.834774, -0.8538427, 1, 1, 1, 1, 1,
-0.3007123, 0.02452276, -1.061868, 1, 1, 1, 1, 1,
-0.2989726, -0.639803, -2.379954, 1, 1, 1, 1, 1,
-0.2936608, -0.2183741, -3.751653, 1, 1, 1, 1, 1,
-0.2908544, -0.01221286, -1.499362, 1, 1, 1, 1, 1,
-0.286489, 0.6297719, 0.2875577, 0, 0, 1, 1, 1,
-0.2836186, 0.6549022, 0.8139139, 1, 0, 0, 1, 1,
-0.2822673, -2.399151, -2.047261, 1, 0, 0, 1, 1,
-0.2797788, -3.315229, -4.443463, 1, 0, 0, 1, 1,
-0.2771752, 0.4894134, 0.6025206, 1, 0, 0, 1, 1,
-0.2739396, 2.168535, -0.04542064, 1, 0, 0, 1, 1,
-0.2724309, -0.9263424, -1.704277, 0, 0, 0, 1, 1,
-0.2701534, 1.463595, -0.9739386, 0, 0, 0, 1, 1,
-0.2665907, -0.06614193, -2.141075, 0, 0, 0, 1, 1,
-0.2565823, 1.074842, 0.08639233, 0, 0, 0, 1, 1,
-0.2560258, -0.08169546, -1.874204, 0, 0, 0, 1, 1,
-0.2547004, 0.5523928, -0.6525462, 0, 0, 0, 1, 1,
-0.2546111, 1.126808, -0.01134139, 0, 0, 0, 1, 1,
-0.253113, 1.3153, -0.6731456, 1, 1, 1, 1, 1,
-0.2527389, 0.3522406, 0.5478157, 1, 1, 1, 1, 1,
-0.2504575, -0.7996745, -3.113377, 1, 1, 1, 1, 1,
-0.2474187, 0.1807244, -0.5299666, 1, 1, 1, 1, 1,
-0.2308159, 0.2920655, 0.6904042, 1, 1, 1, 1, 1,
-0.2299404, -2.173447, -3.272961, 1, 1, 1, 1, 1,
-0.2289865, -1.140359, -4.569779, 1, 1, 1, 1, 1,
-0.2289423, 1.770672, 0.7341896, 1, 1, 1, 1, 1,
-0.2285661, 0.1598482, -0.9551281, 1, 1, 1, 1, 1,
-0.2255623, -1.603404, -3.474298, 1, 1, 1, 1, 1,
-0.2215489, 2.633783, 0.9350047, 1, 1, 1, 1, 1,
-0.2180795, -1.463165, -3.620735, 1, 1, 1, 1, 1,
-0.2157613, 1.506326, 1.179943, 1, 1, 1, 1, 1,
-0.2149157, -1.550248, -1.349673, 1, 1, 1, 1, 1,
-0.2121506, -0.1465662, -2.368578, 1, 1, 1, 1, 1,
-0.2111378, 1.191214, -0.9781081, 0, 0, 1, 1, 1,
-0.2090405, -0.4600229, -1.502695, 1, 0, 0, 1, 1,
-0.2084578, 0.4946603, 0.769921, 1, 0, 0, 1, 1,
-0.2075251, -0.5462449, -1.131632, 1, 0, 0, 1, 1,
-0.206077, 1.488201, 0.5744074, 1, 0, 0, 1, 1,
-0.2030529, -0.01856525, -0.8514539, 1, 0, 0, 1, 1,
-0.2009107, -0.9865616, -2.567238, 0, 0, 0, 1, 1,
-0.1993003, 1.804695, -1.197609, 0, 0, 0, 1, 1,
-0.1990746, 1.841828, -0.7304065, 0, 0, 0, 1, 1,
-0.1968123, 1.536774, -1.524938, 0, 0, 0, 1, 1,
-0.1920246, -0.9197577, -2.068415, 0, 0, 0, 1, 1,
-0.189092, -0.3926433, -1.859771, 0, 0, 0, 1, 1,
-0.1848053, -1.467042, -3.354617, 0, 0, 0, 1, 1,
-0.1829539, 1.124033, -0.133582, 1, 1, 1, 1, 1,
-0.182775, -0.2540679, -0.7736304, 1, 1, 1, 1, 1,
-0.1818665, -0.7590815, -2.219537, 1, 1, 1, 1, 1,
-0.1814649, -1.818192, -3.246283, 1, 1, 1, 1, 1,
-0.1793499, -0.2541113, -2.687128, 1, 1, 1, 1, 1,
-0.1780318, -0.4838498, -3.389476, 1, 1, 1, 1, 1,
-0.1776898, 0.9479018, -1.15816, 1, 1, 1, 1, 1,
-0.1747793, 0.1442906, 0.1256672, 1, 1, 1, 1, 1,
-0.1738169, 2.358686, -0.1079279, 1, 1, 1, 1, 1,
-0.1707449, -0.8747752, -2.113076, 1, 1, 1, 1, 1,
-0.1699685, 2.253601, -1.164964, 1, 1, 1, 1, 1,
-0.1692303, 0.5008831, -1.622792, 1, 1, 1, 1, 1,
-0.1631887, 1.41978, 2.051882, 1, 1, 1, 1, 1,
-0.1608412, -0.2831505, -2.268946, 1, 1, 1, 1, 1,
-0.1601552, 0.3372229, -0.01779292, 1, 1, 1, 1, 1,
-0.1598886, 0.7280558, 0.37139, 0, 0, 1, 1, 1,
-0.1597037, -0.4578655, -2.561746, 1, 0, 0, 1, 1,
-0.1585319, -1.486099, -2.703362, 1, 0, 0, 1, 1,
-0.155194, 1.596345, 1.575713, 1, 0, 0, 1, 1,
-0.1515262, -1.863473, -2.025937, 1, 0, 0, 1, 1,
-0.1441885, -0.3220467, -1.940352, 1, 0, 0, 1, 1,
-0.1384815, 0.2838325, 0.8761729, 0, 0, 0, 1, 1,
-0.1341235, 0.1373303, -0.04149073, 0, 0, 0, 1, 1,
-0.1330725, 1.347003, 0.002156693, 0, 0, 0, 1, 1,
-0.1294073, -1.342086, -2.788838, 0, 0, 0, 1, 1,
-0.1203266, -1.351479, -3.432581, 0, 0, 0, 1, 1,
-0.1194445, -1.457994, -2.428678, 0, 0, 0, 1, 1,
-0.1110963, 0.3317786, 0.4119819, 0, 0, 0, 1, 1,
-0.09599519, 0.9158983, 0.859966, 1, 1, 1, 1, 1,
-0.09369928, -0.3056256, -2.428119, 1, 1, 1, 1, 1,
-0.09123644, -1.302886, -4.631015, 1, 1, 1, 1, 1,
-0.089176, -0.1905165, -3.174862, 1, 1, 1, 1, 1,
-0.08896766, -1.331337, -2.135582, 1, 1, 1, 1, 1,
-0.08678293, -0.5024988, -2.117584, 1, 1, 1, 1, 1,
-0.08591478, 2.285178, 0.3858944, 1, 1, 1, 1, 1,
-0.08430763, 0.1881665, -0.7954726, 1, 1, 1, 1, 1,
-0.08256427, -0.2009336, -2.903388, 1, 1, 1, 1, 1,
-0.08124483, 0.6194425, 1.09899, 1, 1, 1, 1, 1,
-0.08054022, 0.5028391, 0.6330905, 1, 1, 1, 1, 1,
-0.08012004, -0.1603398, -2.051056, 1, 1, 1, 1, 1,
-0.07456361, -0.2945504, -4.052859, 1, 1, 1, 1, 1,
-0.07057457, 0.6998249, -2.483304, 1, 1, 1, 1, 1,
-0.06345952, -0.2930528, -2.934435, 1, 1, 1, 1, 1,
-0.06278498, 0.4186077, -2.53403, 0, 0, 1, 1, 1,
-0.06167114, -0.6111484, -3.924317, 1, 0, 0, 1, 1,
-0.06099776, -0.363228, -5.077494, 1, 0, 0, 1, 1,
-0.05904612, 0.9051272, -1.470474, 1, 0, 0, 1, 1,
-0.0576679, -1.645208, -3.160244, 1, 0, 0, 1, 1,
-0.05760282, 0.6466923, 0.8903209, 1, 0, 0, 1, 1,
-0.0562953, 1.346606, 1.238686, 0, 0, 0, 1, 1,
-0.0541954, -2.149237, -4.781199, 0, 0, 0, 1, 1,
-0.0510215, 0.743303, -0.8522462, 0, 0, 0, 1, 1,
-0.04988652, -0.2499765, -2.809566, 0, 0, 0, 1, 1,
-0.0474524, 1.01592, 0.4854198, 0, 0, 0, 1, 1,
-0.04713625, -0.5042616, -3.282414, 0, 0, 0, 1, 1,
-0.04689856, 0.293851, 1.118381, 0, 0, 0, 1, 1,
-0.04504043, 0.8229601, -0.8826624, 1, 1, 1, 1, 1,
-0.04306913, -0.5184585, -4.388147, 1, 1, 1, 1, 1,
-0.04274406, 0.0619972, 1.956281, 1, 1, 1, 1, 1,
-0.04093349, -0.9014282, -4.113824, 1, 1, 1, 1, 1,
-0.04008097, -1.841197, -3.158181, 1, 1, 1, 1, 1,
-0.03957611, -0.205532, -2.398934, 1, 1, 1, 1, 1,
-0.03623646, -0.2871539, -3.993636, 1, 1, 1, 1, 1,
-0.03261907, -0.85773, -4.997639, 1, 1, 1, 1, 1,
-0.02115697, -0.3353108, -2.780674, 1, 1, 1, 1, 1,
-0.01372713, -2.310961, -5.182078, 1, 1, 1, 1, 1,
-0.01336299, -0.4270448, -3.077283, 1, 1, 1, 1, 1,
-0.0129993, -1.265149, -0.5896562, 1, 1, 1, 1, 1,
-0.01141445, -0.5078338, -4.411533, 1, 1, 1, 1, 1,
-0.00952699, -1.025498, -2.302987, 1, 1, 1, 1, 1,
-0.009420527, -0.1719774, 0.06626163, 1, 1, 1, 1, 1,
-0.004278453, 0.6041713, -0.6252697, 0, 0, 1, 1, 1,
-0.001431572, 1.074734, 0.3856058, 1, 0, 0, 1, 1,
-0.0003395662, -0.434776, -4.720057, 1, 0, 0, 1, 1,
0.001115476, -2.213882, 2.809439, 1, 0, 0, 1, 1,
0.001946133, -0.4136168, 2.357062, 1, 0, 0, 1, 1,
0.009633147, -2.136628, 3.635409, 1, 0, 0, 1, 1,
0.0140616, 1.028397, 2.303558, 0, 0, 0, 1, 1,
0.01487152, -1.454948, 3.30002, 0, 0, 0, 1, 1,
0.01705517, -1.424545, 5.485114, 0, 0, 0, 1, 1,
0.02012755, 0.5236032, 0.5721365, 0, 0, 0, 1, 1,
0.02429643, 0.5725045, 1.637392, 0, 0, 0, 1, 1,
0.02714028, -0.4789819, 3.840698, 0, 0, 0, 1, 1,
0.03295526, 0.3510426, -0.6435027, 0, 0, 0, 1, 1,
0.03471439, -0.101309, 2.898933, 1, 1, 1, 1, 1,
0.03831253, 0.5574329, 1.25164, 1, 1, 1, 1, 1,
0.04102419, 1.548057, 0.4677082, 1, 1, 1, 1, 1,
0.04256846, 0.05827889, -0.4032437, 1, 1, 1, 1, 1,
0.04329443, 1.065009, 0.09796406, 1, 1, 1, 1, 1,
0.04650896, 0.6070938, 0.9031513, 1, 1, 1, 1, 1,
0.04817705, -0.4385336, 3.790851, 1, 1, 1, 1, 1,
0.04888892, 0.7283821, 1.775102, 1, 1, 1, 1, 1,
0.04928213, -1.631636, 3.186325, 1, 1, 1, 1, 1,
0.04964413, 0.5867466, 0.3990359, 1, 1, 1, 1, 1,
0.05269251, -1.736813, 1.528954, 1, 1, 1, 1, 1,
0.05537359, -0.5631238, 3.332986, 1, 1, 1, 1, 1,
0.05635187, 0.1642293, -0.2134929, 1, 1, 1, 1, 1,
0.05718483, -0.6741829, 4.746736, 1, 1, 1, 1, 1,
0.05855085, 2.137736, 1.035035, 1, 1, 1, 1, 1,
0.06128917, 1.964801, 0.06852207, 0, 0, 1, 1, 1,
0.06290281, 0.664304, -0.7408814, 1, 0, 0, 1, 1,
0.06301914, 0.5122021, 0.4537446, 1, 0, 0, 1, 1,
0.06303909, 1.157637, -1.357961, 1, 0, 0, 1, 1,
0.06406735, 0.5819756, -0.1877616, 1, 0, 0, 1, 1,
0.06517544, 1.783262, -1.182038, 1, 0, 0, 1, 1,
0.06528232, 0.2071486, -0.7318017, 0, 0, 0, 1, 1,
0.06998195, -1.315672, 2.94243, 0, 0, 0, 1, 1,
0.07101014, 0.5434612, -1.055086, 0, 0, 0, 1, 1,
0.08265454, -0.8371868, 4.746241, 0, 0, 0, 1, 1,
0.09346069, 0.005346076, -0.4518049, 0, 0, 0, 1, 1,
0.09397542, 0.03651315, 1.291533, 0, 0, 0, 1, 1,
0.09692699, 2.196345, -0.8915532, 0, 0, 0, 1, 1,
0.1017262, 0.5864095, 0.7978811, 1, 1, 1, 1, 1,
0.1088897, -1.425303, 3.993304, 1, 1, 1, 1, 1,
0.1088945, 0.7860135, -1.09725, 1, 1, 1, 1, 1,
0.109607, -0.9671852, 2.042755, 1, 1, 1, 1, 1,
0.1097397, 0.3844068, 0.33806, 1, 1, 1, 1, 1,
0.1106285, -0.310307, 3.941609, 1, 1, 1, 1, 1,
0.1133012, 0.5998626, 0.9815271, 1, 1, 1, 1, 1,
0.1137838, -1.487483, 4.652299, 1, 1, 1, 1, 1,
0.1160021, -0.7653348, 2.305478, 1, 1, 1, 1, 1,
0.1297336, -1.986962, 3.285723, 1, 1, 1, 1, 1,
0.1318368, -0.8001814, 3.455964, 1, 1, 1, 1, 1,
0.1318614, 0.8940368, -0.377284, 1, 1, 1, 1, 1,
0.1414334, 0.1120852, -0.8447217, 1, 1, 1, 1, 1,
0.1425979, 1.208461, -0.646504, 1, 1, 1, 1, 1,
0.1436471, 0.4211181, 0.2714988, 1, 1, 1, 1, 1,
0.1469932, 0.3512282, -0.04336138, 0, 0, 1, 1, 1,
0.1495361, -1.443779, 3.655711, 1, 0, 0, 1, 1,
0.1497411, -1.463248, 3.128814, 1, 0, 0, 1, 1,
0.1502577, 0.6233814, -0.2400161, 1, 0, 0, 1, 1,
0.151408, -1.206301, 2.540754, 1, 0, 0, 1, 1,
0.1521052, -1.000557, 4.789738, 1, 0, 0, 1, 1,
0.1563044, -1.02314, 1.479854, 0, 0, 0, 1, 1,
0.159945, 0.4795656, 0.7632135, 0, 0, 0, 1, 1,
0.1622236, 0.07489737, -0.09508042, 0, 0, 0, 1, 1,
0.1650653, 1.729445, -0.04106186, 0, 0, 0, 1, 1,
0.1704924, -1.959557, 2.708249, 0, 0, 0, 1, 1,
0.1707369, 0.5214704, 1.088272, 0, 0, 0, 1, 1,
0.1722418, 0.125164, -0.8505837, 0, 0, 0, 1, 1,
0.17314, -0.8762707, 2.92995, 1, 1, 1, 1, 1,
0.1734307, 0.2416571, 0.9611893, 1, 1, 1, 1, 1,
0.175395, -1.896953, 1.595751, 1, 1, 1, 1, 1,
0.1791681, 0.941869, 1.250018, 1, 1, 1, 1, 1,
0.1841074, -1.004179, 2.78267, 1, 1, 1, 1, 1,
0.1919733, -1.241326, 2.029314, 1, 1, 1, 1, 1,
0.1930322, 0.421561, -0.2188808, 1, 1, 1, 1, 1,
0.1945779, 2.137433, -0.3207747, 1, 1, 1, 1, 1,
0.1952355, -0.7957416, 2.777787, 1, 1, 1, 1, 1,
0.1983698, 0.1014881, 2.390347, 1, 1, 1, 1, 1,
0.1994574, -0.4028035, 2.971171, 1, 1, 1, 1, 1,
0.2122043, 2.024108, -1.083944, 1, 1, 1, 1, 1,
0.2131992, -1.675635, 3.188768, 1, 1, 1, 1, 1,
0.2137878, 0.2881637, 2.665651, 1, 1, 1, 1, 1,
0.2138854, 0.7342868, 0.9085531, 1, 1, 1, 1, 1,
0.217945, -1.225232, 2.83483, 0, 0, 1, 1, 1,
0.2237104, -1.816764, 3.633866, 1, 0, 0, 1, 1,
0.2268424, -0.9778515, 2.666612, 1, 0, 0, 1, 1,
0.2288641, 0.1000261, -0.5452726, 1, 0, 0, 1, 1,
0.2293205, -0.7161851, 3.27887, 1, 0, 0, 1, 1,
0.2306034, -1.110531, 4.316536, 1, 0, 0, 1, 1,
0.2324393, -0.224785, 3.571311, 0, 0, 0, 1, 1,
0.2337949, -1.025944, 1.408804, 0, 0, 0, 1, 1,
0.2386888, -0.6028445, 3.213686, 0, 0, 0, 1, 1,
0.2439665, -1.397519, 1.434253, 0, 0, 0, 1, 1,
0.2441661, 1.840265, 0.4592147, 0, 0, 0, 1, 1,
0.2493022, 1.681334, 1.360908, 0, 0, 0, 1, 1,
0.250874, -0.4687844, 2.15302, 0, 0, 0, 1, 1,
0.2511855, -0.2173659, 1.582142, 1, 1, 1, 1, 1,
0.2522115, 1.123939, 0.6655087, 1, 1, 1, 1, 1,
0.2525516, 0.9303021, 0.3586157, 1, 1, 1, 1, 1,
0.2545492, 1.179262, -0.3549084, 1, 1, 1, 1, 1,
0.2555932, 0.9902825, 0.5620158, 1, 1, 1, 1, 1,
0.259493, 0.1480256, 0.1158476, 1, 1, 1, 1, 1,
0.2606184, 1.836347, 0.8532083, 1, 1, 1, 1, 1,
0.2637835, -0.4810537, 3.826929, 1, 1, 1, 1, 1,
0.2643901, -0.8233767, 2.166112, 1, 1, 1, 1, 1,
0.2646282, -0.1583606, 5.010343, 1, 1, 1, 1, 1,
0.2695302, -0.6735584, 4.816846, 1, 1, 1, 1, 1,
0.2699291, -0.293232, 2.777537, 1, 1, 1, 1, 1,
0.2703491, 0.07823909, 0.3233795, 1, 1, 1, 1, 1,
0.2729518, -0.762454, 4.036194, 1, 1, 1, 1, 1,
0.2777313, 0.2219205, -0.006218533, 1, 1, 1, 1, 1,
0.2797967, -0.1200467, 2.634902, 0, 0, 1, 1, 1,
0.281373, -0.3441414, 2.2122, 1, 0, 0, 1, 1,
0.2821937, 0.912931, 1.292952, 1, 0, 0, 1, 1,
0.2844109, 0.09249058, 2.557242, 1, 0, 0, 1, 1,
0.2845218, -0.5340943, 1.85594, 1, 0, 0, 1, 1,
0.2850457, 1.424065, 0.3849404, 1, 0, 0, 1, 1,
0.2858307, 0.9764053, -0.5909128, 0, 0, 0, 1, 1,
0.2941239, -0.4793085, 2.620587, 0, 0, 0, 1, 1,
0.3013267, 0.2596153, 1.770057, 0, 0, 0, 1, 1,
0.3022937, 0.2988168, 1.822329, 0, 0, 0, 1, 1,
0.3027063, 1.070361, -0.5809016, 0, 0, 0, 1, 1,
0.3034615, 0.8455385, -0.09319232, 0, 0, 0, 1, 1,
0.3073103, 0.4895245, 1.705965, 0, 0, 0, 1, 1,
0.3082505, -0.01959846, 1.882389, 1, 1, 1, 1, 1,
0.3094445, -0.8298979, 2.310843, 1, 1, 1, 1, 1,
0.3100688, -0.1341868, 1.970084, 1, 1, 1, 1, 1,
0.3114363, -0.3747367, 1.345505, 1, 1, 1, 1, 1,
0.3190449, -0.4419964, 1.972825, 1, 1, 1, 1, 1,
0.3218171, 1.256866, 2.094981, 1, 1, 1, 1, 1,
0.3244275, -0.07783134, 0.2899759, 1, 1, 1, 1, 1,
0.3335593, 1.747197, -0.6837699, 1, 1, 1, 1, 1,
0.3336694, -1.837518, 2.498904, 1, 1, 1, 1, 1,
0.3345734, -0.9123595, 1.301283, 1, 1, 1, 1, 1,
0.3365662, -0.135954, 1.13454, 1, 1, 1, 1, 1,
0.3427211, 1.745908, 1.303719, 1, 1, 1, 1, 1,
0.3516817, 0.1236547, 1.295909, 1, 1, 1, 1, 1,
0.3554868, -1.348249, 4.642279, 1, 1, 1, 1, 1,
0.3566142, -1.025456, 2.653174, 1, 1, 1, 1, 1,
0.3631963, -0.004077797, 0.7429424, 0, 0, 1, 1, 1,
0.3637692, 0.3041745, 1.578338, 1, 0, 0, 1, 1,
0.368625, -0.2541052, 1.744108, 1, 0, 0, 1, 1,
0.3742079, -1.251227, 3.36705, 1, 0, 0, 1, 1,
0.3777418, -0.06265266, 0.7623999, 1, 0, 0, 1, 1,
0.3887823, 1.175497, 0.8172465, 1, 0, 0, 1, 1,
0.390069, 0.8230979, -0.7824709, 0, 0, 0, 1, 1,
0.394979, -0.4250384, 2.13695, 0, 0, 0, 1, 1,
0.4062948, -0.8813787, -0.1936982, 0, 0, 0, 1, 1,
0.4069758, 0.2073407, 0.6470464, 0, 0, 0, 1, 1,
0.4091537, 0.04178417, 0.3516879, 0, 0, 0, 1, 1,
0.4128494, 0.9791594, 0.8313829, 0, 0, 0, 1, 1,
0.4135285, 1.839472, -0.6652372, 0, 0, 0, 1, 1,
0.4217406, 2.079264, 0.1459976, 1, 1, 1, 1, 1,
0.4229855, -0.2137986, 1.415159, 1, 1, 1, 1, 1,
0.4231743, 1.401254, -0.6633058, 1, 1, 1, 1, 1,
0.424826, -1.016935, 3.346946, 1, 1, 1, 1, 1,
0.4249926, -0.8101224, 1.17007, 1, 1, 1, 1, 1,
0.4256745, -0.8927088, 2.873386, 1, 1, 1, 1, 1,
0.4305138, -0.6907026, 1.601394, 1, 1, 1, 1, 1,
0.437116, 1.600659, -0.8136312, 1, 1, 1, 1, 1,
0.4440313, -0.1868931, 0.5930784, 1, 1, 1, 1, 1,
0.4458458, -1.099381, 2.231423, 1, 1, 1, 1, 1,
0.453604, 0.4287745, 1.661986, 1, 1, 1, 1, 1,
0.4596709, 1.841299, 1.366487, 1, 1, 1, 1, 1,
0.4673826, -0.05499714, 0.1446008, 1, 1, 1, 1, 1,
0.4689623, 1.016791, 2.30286, 1, 1, 1, 1, 1,
0.4807936, -1.119357, 4.132377, 1, 1, 1, 1, 1,
0.485631, -0.9032676, 1.129467, 0, 0, 1, 1, 1,
0.4880354, -0.7968774, 3.133781, 1, 0, 0, 1, 1,
0.4926735, -0.04910636, 0.9839516, 1, 0, 0, 1, 1,
0.4972073, 1.050962, 1.133848, 1, 0, 0, 1, 1,
0.497359, -1.159441, 1.25154, 1, 0, 0, 1, 1,
0.5034618, -0.1878148, 3.164728, 1, 0, 0, 1, 1,
0.5037343, 2.557185, 1.262913, 0, 0, 0, 1, 1,
0.504143, -1.382085, 2.873827, 0, 0, 0, 1, 1,
0.509445, -0.2570637, 2.885204, 0, 0, 0, 1, 1,
0.5101588, 0.2408872, 1.104089, 0, 0, 0, 1, 1,
0.5142428, 2.332497, 2.907212, 0, 0, 0, 1, 1,
0.5185052, 0.3445897, 2.757368, 0, 0, 0, 1, 1,
0.5212539, 1.320792, 0.5018572, 0, 0, 0, 1, 1,
0.5226465, -1.497541, 3.353314, 1, 1, 1, 1, 1,
0.5248985, 0.8961134, 0.05491512, 1, 1, 1, 1, 1,
0.5264611, 0.6505973, -1.359795, 1, 1, 1, 1, 1,
0.5266622, -1.760809, 4.727933, 1, 1, 1, 1, 1,
0.5301486, 0.3823896, 0.124685, 1, 1, 1, 1, 1,
0.5347346, 0.2720647, 0.7660116, 1, 1, 1, 1, 1,
0.5360644, 0.3519517, 0.572165, 1, 1, 1, 1, 1,
0.5369962, 0.4087545, 1.360324, 1, 1, 1, 1, 1,
0.5387076, -0.6823847, 4.185561, 1, 1, 1, 1, 1,
0.5390782, -0.6717157, 1.870307, 1, 1, 1, 1, 1,
0.5398846, -0.2544102, 2.371714, 1, 1, 1, 1, 1,
0.5402596, 0.9540725, 0.01389696, 1, 1, 1, 1, 1,
0.5464162, 0.1306322, 0.1576481, 1, 1, 1, 1, 1,
0.5496452, -1.714979, 2.621944, 1, 1, 1, 1, 1,
0.5595067, -0.8322905, 1.583953, 1, 1, 1, 1, 1,
0.5599939, -0.2569498, 3.326463, 0, 0, 1, 1, 1,
0.5601098, -1.950128, 1.770038, 1, 0, 0, 1, 1,
0.5613743, 0.5566267, 0.03474213, 1, 0, 0, 1, 1,
0.562883, 1.304072, 0.6400849, 1, 0, 0, 1, 1,
0.5634961, 1.539385, -0.2245557, 1, 0, 0, 1, 1,
0.5690005, 1.770419, -0.6130548, 1, 0, 0, 1, 1,
0.5690543, 1.292683, -1.020472, 0, 0, 0, 1, 1,
0.5728451, -1.026246, 3.350521, 0, 0, 0, 1, 1,
0.576525, 0.04508346, 1.353727, 0, 0, 0, 1, 1,
0.5812443, -0.6496844, 1.81031, 0, 0, 0, 1, 1,
0.5813333, -1.78667, 2.579495, 0, 0, 0, 1, 1,
0.5847029, 0.2313775, 1.537614, 0, 0, 0, 1, 1,
0.5867121, -1.85232, 3.2856, 0, 0, 0, 1, 1,
0.5870326, -0.318732, 0.1078831, 1, 1, 1, 1, 1,
0.5871395, 2.692994, 0.05567062, 1, 1, 1, 1, 1,
0.5926479, -1.610197, 3.190237, 1, 1, 1, 1, 1,
0.5926604, -2.169743, 2.591637, 1, 1, 1, 1, 1,
0.6007763, -0.04139571, -0.01368459, 1, 1, 1, 1, 1,
0.603216, -0.7996448, 2.566577, 1, 1, 1, 1, 1,
0.606041, -1.641877, 2.810818, 1, 1, 1, 1, 1,
0.6121435, 0.3032474, 0.5272089, 1, 1, 1, 1, 1,
0.6161853, -1.577922, 4.195904, 1, 1, 1, 1, 1,
0.6163892, 0.4151728, 2.03738, 1, 1, 1, 1, 1,
0.6195176, -0.5140763, 2.068907, 1, 1, 1, 1, 1,
0.6229998, -2.824248, 2.967959, 1, 1, 1, 1, 1,
0.6241872, -0.8381799, 2.383237, 1, 1, 1, 1, 1,
0.6273401, -0.1784191, 0.3370791, 1, 1, 1, 1, 1,
0.6276487, -0.04359168, 2.156314, 1, 1, 1, 1, 1,
0.6276502, -0.5835047, 2.539605, 0, 0, 1, 1, 1,
0.6325924, -0.918161, 2.627725, 1, 0, 0, 1, 1,
0.6419267, -1.051417, 3.039753, 1, 0, 0, 1, 1,
0.6419416, -0.1546863, 1.143837, 1, 0, 0, 1, 1,
0.6451457, 1.251528, -0.7855057, 1, 0, 0, 1, 1,
0.6507177, 0.4342, 0.3118, 1, 0, 0, 1, 1,
0.6522265, -0.3252526, 2.027421, 0, 0, 0, 1, 1,
0.6538098, -1.5399, 2.774801, 0, 0, 0, 1, 1,
0.6607848, 0.6002757, 2.082416, 0, 0, 0, 1, 1,
0.6655361, -0.8796623, 2.944264, 0, 0, 0, 1, 1,
0.6657439, 1.064432, 0.4588309, 0, 0, 0, 1, 1,
0.6686051, -0.01751378, 1.633515, 0, 0, 0, 1, 1,
0.6687492, -0.6899903, 1.48133, 0, 0, 0, 1, 1,
0.6691419, 0.1828822, 1.192602, 1, 1, 1, 1, 1,
0.6753141, 0.2509991, 1.762718, 1, 1, 1, 1, 1,
0.6768634, -2.022092, 2.996833, 1, 1, 1, 1, 1,
0.6770347, 1.620442, 1.462319, 1, 1, 1, 1, 1,
0.6787808, -0.5876569, 2.180469, 1, 1, 1, 1, 1,
0.6814281, 0.2429294, 2.187262, 1, 1, 1, 1, 1,
0.6827731, -0.5587136, 0.8358092, 1, 1, 1, 1, 1,
0.6839159, 0.5585031, 0.5672557, 1, 1, 1, 1, 1,
0.6875436, 0.673762, 1.423992, 1, 1, 1, 1, 1,
0.6890812, -0.04931919, 0.4913704, 1, 1, 1, 1, 1,
0.6924863, -0.8438637, 3.020097, 1, 1, 1, 1, 1,
0.6939537, 0.1898243, 2.190625, 1, 1, 1, 1, 1,
0.6953942, -0.3012638, 2.084756, 1, 1, 1, 1, 1,
0.6958612, 0.2762401, 0.2878546, 1, 1, 1, 1, 1,
0.7035935, -0.9261655, 2.788755, 1, 1, 1, 1, 1,
0.7086715, 1.560576, 1.030875, 0, 0, 1, 1, 1,
0.7102361, 0.2069188, 0.8204555, 1, 0, 0, 1, 1,
0.7117012, -0.2283697, 2.630588, 1, 0, 0, 1, 1,
0.712937, -1.091439, 3.09075, 1, 0, 0, 1, 1,
0.7144396, -0.8889437, 2.814384, 1, 0, 0, 1, 1,
0.7234786, -0.8106923, 2.583249, 1, 0, 0, 1, 1,
0.7310947, 0.3877657, 1.658847, 0, 0, 0, 1, 1,
0.7325286, -1.680727, 2.503083, 0, 0, 0, 1, 1,
0.748454, 0.2596934, 3.443417, 0, 0, 0, 1, 1,
0.7580277, -0.5267081, 2.901239, 0, 0, 0, 1, 1,
0.7588662, 1.376166, 0.9878064, 0, 0, 0, 1, 1,
0.7601575, 0.07978577, 0.8012477, 0, 0, 0, 1, 1,
0.7632374, 0.8746732, 1.50259, 0, 0, 0, 1, 1,
0.7671796, 1.340175, -0.584865, 1, 1, 1, 1, 1,
0.7685315, -2.116651, 2.274764, 1, 1, 1, 1, 1,
0.7690441, -2.284714, 2.066049, 1, 1, 1, 1, 1,
0.7693638, 0.3281308, 0.1769717, 1, 1, 1, 1, 1,
0.7790087, -0.5465958, 2.189869, 1, 1, 1, 1, 1,
0.7793317, 0.7132038, -0.840876, 1, 1, 1, 1, 1,
0.779444, -0.5133854, 0.9618714, 1, 1, 1, 1, 1,
0.7858233, 0.4660725, 2.176821, 1, 1, 1, 1, 1,
0.7864547, -1.620372, 1.936765, 1, 1, 1, 1, 1,
0.7866372, 0.9223296, 1.57258, 1, 1, 1, 1, 1,
0.7892525, 1.020848, -1.672188, 1, 1, 1, 1, 1,
0.7928865, 0.5230991, 1.273113, 1, 1, 1, 1, 1,
0.7951254, 0.1955857, 2.976772, 1, 1, 1, 1, 1,
0.8001729, 1.082418, 0.4973296, 1, 1, 1, 1, 1,
0.8012172, 0.7241725, -0.7681757, 1, 1, 1, 1, 1,
0.8019522, 1.561006, 1.398291, 0, 0, 1, 1, 1,
0.8073449, 1.441059, 1.072693, 1, 0, 0, 1, 1,
0.8088169, -1.572826, 2.31669, 1, 0, 0, 1, 1,
0.8096129, 0.2727958, 1.036303, 1, 0, 0, 1, 1,
0.8123843, -0.9485588, 1.268089, 1, 0, 0, 1, 1,
0.8174443, -0.04045589, 1.12364, 1, 0, 0, 1, 1,
0.8176746, -0.04307001, 1.792197, 0, 0, 0, 1, 1,
0.8248265, 0.4252604, 1.626626, 0, 0, 0, 1, 1,
0.8249474, 0.7307904, 2.776445, 0, 0, 0, 1, 1,
0.8264126, -1.380402, 3.618688, 0, 0, 0, 1, 1,
0.8291745, 0.5655868, 0.1472221, 0, 0, 0, 1, 1,
0.8294314, 0.4587821, 1.898834, 0, 0, 0, 1, 1,
0.8305466, 0.4858706, 0.3550583, 0, 0, 0, 1, 1,
0.8317035, 0.1897876, 4.316707, 1, 1, 1, 1, 1,
0.834217, -0.3190484, 2.433408, 1, 1, 1, 1, 1,
0.8343124, -0.0965054, 0.7546117, 1, 1, 1, 1, 1,
0.8356307, -1.304147, 2.741045, 1, 1, 1, 1, 1,
0.8387039, -1.04536, 2.656892, 1, 1, 1, 1, 1,
0.8459393, 0.8918215, 2.300398, 1, 1, 1, 1, 1,
0.8555362, -0.04250899, 0.1671294, 1, 1, 1, 1, 1,
0.8571168, 0.9957577, -0.6398031, 1, 1, 1, 1, 1,
0.8621511, 0.241323, 1.798375, 1, 1, 1, 1, 1,
0.865818, 1.213812, -0.3738978, 1, 1, 1, 1, 1,
0.8672494, 1.1158, 0.07677871, 1, 1, 1, 1, 1,
0.8740401, 0.2473845, 0.3981494, 1, 1, 1, 1, 1,
0.8773215, -0.5662774, 3.653091, 1, 1, 1, 1, 1,
0.8881617, 1.752284, -1.477859, 1, 1, 1, 1, 1,
0.8915394, 0.3960089, 0.1741134, 1, 1, 1, 1, 1,
0.8972938, 0.1152398, 0.8610643, 0, 0, 1, 1, 1,
0.9054073, 2.446518, -0.4177655, 1, 0, 0, 1, 1,
0.9079592, -0.9492528, 1.392941, 1, 0, 0, 1, 1,
0.9082935, -0.3957036, 0.5112643, 1, 0, 0, 1, 1,
0.910184, -0.4875502, 1.229118, 1, 0, 0, 1, 1,
0.9157068, 0.1738504, 1.029465, 1, 0, 0, 1, 1,
0.9164076, -1.218504, 0.8359364, 0, 0, 0, 1, 1,
0.9359346, 0.6386181, 2.638844, 0, 0, 0, 1, 1,
0.9407059, 0.3529408, 1.344223, 0, 0, 0, 1, 1,
0.9563631, 0.6743836, 1.478419, 0, 0, 0, 1, 1,
0.9736667, -0.03443153, 2.818418, 0, 0, 0, 1, 1,
0.9749274, 0.6094552, 0.335834, 0, 0, 0, 1, 1,
0.9767111, -0.5056257, 2.436365, 0, 0, 0, 1, 1,
0.9822786, -0.3610157, 0.04273086, 1, 1, 1, 1, 1,
0.9835514, -0.8075867, 4.21529, 1, 1, 1, 1, 1,
0.9953403, -0.4140735, 1.928957, 1, 1, 1, 1, 1,
1.006389, 0.06031688, 3.158834, 1, 1, 1, 1, 1,
1.01239, -0.769826, 3.474522, 1, 1, 1, 1, 1,
1.018618, -0.924857, 2.70276, 1, 1, 1, 1, 1,
1.023062, 0.3155416, 2.482768, 1, 1, 1, 1, 1,
1.024372, -0.9901802, 0.6481793, 1, 1, 1, 1, 1,
1.031803, -0.8182298, 3.449058, 1, 1, 1, 1, 1,
1.042859, 1.539373, 0.9299433, 1, 1, 1, 1, 1,
1.04643, -1.652348, 1.081272, 1, 1, 1, 1, 1,
1.048658, -0.01134346, -0.6604065, 1, 1, 1, 1, 1,
1.068763, 1.208342, 1.752603, 1, 1, 1, 1, 1,
1.069064, 1.592721, 0.92735, 1, 1, 1, 1, 1,
1.076204, 0.8982177, 1.59342, 1, 1, 1, 1, 1,
1.08011, 0.5621123, 1.178216, 0, 0, 1, 1, 1,
1.08314, 0.9176152, 2.239026, 1, 0, 0, 1, 1,
1.086329, -0.9363226, 3.094925, 1, 0, 0, 1, 1,
1.086859, 0.3569144, 1.248763, 1, 0, 0, 1, 1,
1.087498, 0.3578973, 0.6603009, 1, 0, 0, 1, 1,
1.089119, -1.051301, 3.008084, 1, 0, 0, 1, 1,
1.090345, 0.5208161, 1.100185, 0, 0, 0, 1, 1,
1.091243, 0.1069579, 1.350664, 0, 0, 0, 1, 1,
1.092189, 0.2125389, 2.404447, 0, 0, 0, 1, 1,
1.092263, 0.5278386, 2.260123, 0, 0, 0, 1, 1,
1.102232, 0.617906, 1.473789, 0, 0, 0, 1, 1,
1.10297, 0.7686759, 1.324291, 0, 0, 0, 1, 1,
1.104872, 0.3841016, 2.220775, 0, 0, 0, 1, 1,
1.105627, 0.7124654, 1.030648, 1, 1, 1, 1, 1,
1.108203, 2.036312, -1.295815, 1, 1, 1, 1, 1,
1.111785, 1.443347, -0.5549027, 1, 1, 1, 1, 1,
1.113073, -0.158323, 0.9870963, 1, 1, 1, 1, 1,
1.122519, 0.5031306, 0.952598, 1, 1, 1, 1, 1,
1.1265, -0.423707, 2.330037, 1, 1, 1, 1, 1,
1.138261, -0.1991056, 1.340704, 1, 1, 1, 1, 1,
1.138527, -0.08582245, 0.284547, 1, 1, 1, 1, 1,
1.154425, -0.6302686, 1.029369, 1, 1, 1, 1, 1,
1.156404, -1.06481, 2.219407, 1, 1, 1, 1, 1,
1.156749, 0.982875, 0.533897, 1, 1, 1, 1, 1,
1.158831, 1.470582, 1.427696, 1, 1, 1, 1, 1,
1.162198, 0.4909733, 1.796321, 1, 1, 1, 1, 1,
1.167301, 0.5071226, 0.3019717, 1, 1, 1, 1, 1,
1.167478, 0.5477386, 2.049424, 1, 1, 1, 1, 1,
1.178887, -1.006626, 3.673438, 0, 0, 1, 1, 1,
1.183056, -0.9097416, 0.3439892, 1, 0, 0, 1, 1,
1.183721, -0.9082784, 2.530132, 1, 0, 0, 1, 1,
1.187322, -1.134359, 2.571223, 1, 0, 0, 1, 1,
1.187703, 0.5374472, 1.412616, 1, 0, 0, 1, 1,
1.193575, 0.5666542, 3.434093, 1, 0, 0, 1, 1,
1.204296, -1.404233, 2.932485, 0, 0, 0, 1, 1,
1.204333, -0.5702904, 1.276083, 0, 0, 0, 1, 1,
1.207577, 0.9662843, 1.110455, 0, 0, 0, 1, 1,
1.214634, 1.496382, 1.399933, 0, 0, 0, 1, 1,
1.215044, 1.8101, -0.7767235, 0, 0, 0, 1, 1,
1.217637, -0.8365352, 2.685109, 0, 0, 0, 1, 1,
1.223286, -0.4859767, 2.950707, 0, 0, 0, 1, 1,
1.224306, -0.7404321, 1.134136, 1, 1, 1, 1, 1,
1.226323, 1.328875, 1.366863, 1, 1, 1, 1, 1,
1.226838, -2.272495, 2.03002, 1, 1, 1, 1, 1,
1.237069, 0.07764779, 3.16546, 1, 1, 1, 1, 1,
1.242021, 1.002652, 0.07022001, 1, 1, 1, 1, 1,
1.243909, -0.3345518, 1.495761, 1, 1, 1, 1, 1,
1.245325, -0.5841864, 1.154637, 1, 1, 1, 1, 1,
1.247696, 0.7209851, 0.6148033, 1, 1, 1, 1, 1,
1.258209, 1.397608, 1.559428, 1, 1, 1, 1, 1,
1.280315, 0.4547956, 1.279536, 1, 1, 1, 1, 1,
1.284112, -0.9292679, 4.268669, 1, 1, 1, 1, 1,
1.287807, -0.814751, 0.7306835, 1, 1, 1, 1, 1,
1.291066, 1.014717, -0.3011533, 1, 1, 1, 1, 1,
1.294462, -0.5454445, 2.383095, 1, 1, 1, 1, 1,
1.306737, -1.291044, 1.246649, 1, 1, 1, 1, 1,
1.320215, 1.565639, 0.1211466, 0, 0, 1, 1, 1,
1.332925, 0.3713698, 0.7885527, 1, 0, 0, 1, 1,
1.333506, -1.051697, 2.288299, 1, 0, 0, 1, 1,
1.334428, -0.133989, 3.180689, 1, 0, 0, 1, 1,
1.345109, -0.8384669, 2.979053, 1, 0, 0, 1, 1,
1.360587, 1.497471, -0.5502841, 1, 0, 0, 1, 1,
1.365689, -0.4688978, 2.785666, 0, 0, 0, 1, 1,
1.367829, 0.1203784, 1.249468, 0, 0, 0, 1, 1,
1.367859, -1.708494, 1.607503, 0, 0, 0, 1, 1,
1.37263, -1.640203, 1.55026, 0, 0, 0, 1, 1,
1.373714, -0.2299571, 2.1946, 0, 0, 0, 1, 1,
1.376945, 1.12972, 1.713641, 0, 0, 0, 1, 1,
1.381204, -1.18018, 2.056037, 0, 0, 0, 1, 1,
1.382295, -0.153545, 1.465498, 1, 1, 1, 1, 1,
1.39958, 1.007183, 2.227473, 1, 1, 1, 1, 1,
1.404267, 0.8841812, -0.5011573, 1, 1, 1, 1, 1,
1.414217, -0.5491227, 2.066253, 1, 1, 1, 1, 1,
1.415626, 2.418147, -0.7696872, 1, 1, 1, 1, 1,
1.417975, -0.4997292, 2.951221, 1, 1, 1, 1, 1,
1.418596, 1.195902, 0.4280288, 1, 1, 1, 1, 1,
1.440645, 0.4547933, 0.9435943, 1, 1, 1, 1, 1,
1.446302, 0.4536474, 1.018165, 1, 1, 1, 1, 1,
1.451584, 1.222517, 0.7900848, 1, 1, 1, 1, 1,
1.452471, -1.466893, 1.387177, 1, 1, 1, 1, 1,
1.457461, -0.4836164, 2.202379, 1, 1, 1, 1, 1,
1.457634, -0.3611694, 1.323935, 1, 1, 1, 1, 1,
1.462921, 1.375978, 1.613468, 1, 1, 1, 1, 1,
1.478432, 0.1525889, 1.449689, 1, 1, 1, 1, 1,
1.480337, 0.06130889, -0.003332807, 0, 0, 1, 1, 1,
1.484606, 1.226865, 2.258881, 1, 0, 0, 1, 1,
1.513048, 1.900942, 0.6875497, 1, 0, 0, 1, 1,
1.51644, -0.5251922, 2.55308, 1, 0, 0, 1, 1,
1.525077, -1.571242, 2.11652, 1, 0, 0, 1, 1,
1.527206, 0.7026156, 2.610701, 1, 0, 0, 1, 1,
1.529697, -0.8100404, 3.521858, 0, 0, 0, 1, 1,
1.532373, -2.050446, 0.432373, 0, 0, 0, 1, 1,
1.550452, 0.5819855, 0.5718111, 0, 0, 0, 1, 1,
1.56176, 0.8138315, 1.560106, 0, 0, 0, 1, 1,
1.565657, 0.3343206, 0.5572272, 0, 0, 0, 1, 1,
1.590609, 0.1420734, 1.676688, 0, 0, 0, 1, 1,
1.593069, 0.8249775, 0.805366, 0, 0, 0, 1, 1,
1.594647, 0.2407314, 2.267321, 1, 1, 1, 1, 1,
1.597287, 1.21968, -0.1634935, 1, 1, 1, 1, 1,
1.598477, -0.5266637, 2.459628, 1, 1, 1, 1, 1,
1.599533, 1.227664, 1.628149, 1, 1, 1, 1, 1,
1.628446, -1.962411, 2.974575, 1, 1, 1, 1, 1,
1.64191, 0.2128701, 0.8593197, 1, 1, 1, 1, 1,
1.649991, 0.7746049, 1.397916, 1, 1, 1, 1, 1,
1.654208, -0.5398464, 2.387932, 1, 1, 1, 1, 1,
1.671155, -0.4923782, 2.38805, 1, 1, 1, 1, 1,
1.68916, 0.1726746, 1.971701, 1, 1, 1, 1, 1,
1.69085, 2.229337, 1.568226, 1, 1, 1, 1, 1,
1.698352, 0.0420038, 1.613694, 1, 1, 1, 1, 1,
1.700271, -1.106998, 1.626036, 1, 1, 1, 1, 1,
1.70359, -0.3682212, -0.6091679, 1, 1, 1, 1, 1,
1.705494, 0.2778502, -0.06855641, 1, 1, 1, 1, 1,
1.713534, 1.225169, 1.743279, 0, 0, 1, 1, 1,
1.715002, 0.04828275, 1.546687, 1, 0, 0, 1, 1,
1.725138, -1.236335, 1.904632, 1, 0, 0, 1, 1,
1.732711, 0.3586134, 1.695016, 1, 0, 0, 1, 1,
1.735495, -1.150266, 1.89761, 1, 0, 0, 1, 1,
1.736356, 0.6791084, 1.694582, 1, 0, 0, 1, 1,
1.745136, 1.368216, 0.9083475, 0, 0, 0, 1, 1,
1.751746, -0.8982271, 2.528163, 0, 0, 0, 1, 1,
1.764929, -0.4977093, 2.371695, 0, 0, 0, 1, 1,
1.77451, -1.309863, 3.19911, 0, 0, 0, 1, 1,
1.796728, 0.9911849, 0.4818435, 0, 0, 0, 1, 1,
1.797382, -1.134055, 3.616802, 0, 0, 0, 1, 1,
1.798961, 0.9867394, 2.362893, 0, 0, 0, 1, 1,
1.810483, 0.3901825, 1.464002, 1, 1, 1, 1, 1,
1.811563, 0.0723137, 2.73229, 1, 1, 1, 1, 1,
1.817178, 0.7510919, 3.748695, 1, 1, 1, 1, 1,
1.859777, -0.09379472, 2.582715, 1, 1, 1, 1, 1,
1.881415, 1.294126, 1.21054, 1, 1, 1, 1, 1,
1.928657, 0.09483304, 2.791509, 1, 1, 1, 1, 1,
1.929829, 0.09974996, 2.861038, 1, 1, 1, 1, 1,
1.963452, 1.522485, 1.57359, 1, 1, 1, 1, 1,
1.963946, 0.02151233, 1.841253, 1, 1, 1, 1, 1,
1.973918, 0.4258479, 1.546251, 1, 1, 1, 1, 1,
1.982006, -1.013723, 2.135061, 1, 1, 1, 1, 1,
1.994962, 2.055956, 0.8469121, 1, 1, 1, 1, 1,
2.031756, -0.5383167, 2.506675, 1, 1, 1, 1, 1,
2.061134, -0.03197223, 0.7786803, 1, 1, 1, 1, 1,
2.075195, 2.617168, -1.490634, 1, 1, 1, 1, 1,
2.097171, -2.322485, 2.849936, 0, 0, 1, 1, 1,
2.16132, -1.601056, 0.1668544, 1, 0, 0, 1, 1,
2.169129, -0.1568379, 0.7146456, 1, 0, 0, 1, 1,
2.172522, 0.5189732, 2.837029, 1, 0, 0, 1, 1,
2.191016, -1.049004, 1.915863, 1, 0, 0, 1, 1,
2.192247, -0.5608981, 2.736265, 1, 0, 0, 1, 1,
2.208893, 0.9673229, 1.498881, 0, 0, 0, 1, 1,
2.236841, -0.2302555, 3.025568, 0, 0, 0, 1, 1,
2.335634, 0.9448004, -1.725308, 0, 0, 0, 1, 1,
2.400038, 0.1599613, 1.395125, 0, 0, 0, 1, 1,
2.41711, -1.674868, 2.057734, 0, 0, 0, 1, 1,
2.447831, -1.558825, 3.522766, 0, 0, 0, 1, 1,
2.461262, 0.3382361, 1.766437, 0, 0, 0, 1, 1,
2.49075, -1.013656, 1.385423, 1, 1, 1, 1, 1,
2.509677, -1.366524, 1.372225, 1, 1, 1, 1, 1,
2.552223, -0.3785347, -0.1388866, 1, 1, 1, 1, 1,
2.593913, -0.2850258, 0.1808051, 1, 1, 1, 1, 1,
3.063021, -0.4080598, 1.539366, 1, 1, 1, 1, 1,
3.077401, 0.4361669, 0.6206552, 1, 1, 1, 1, 1,
3.162462, 1.707132, 1.712032, 1, 1, 1, 1, 1
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
var radius = 9.488448;
var distance = 33.32777;
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
mvMatrix.translate( -0.2682412, 0.4302067, 0.01409769 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.32777);
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
