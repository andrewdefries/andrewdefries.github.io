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
-3.102092, 0.8729876, -1.349806, 1, 0, 0, 1,
-3.019519, -0.4592378, -3.272005, 1, 0.007843138, 0, 1,
-2.875883, 1.405447, -0.8230484, 1, 0.01176471, 0, 1,
-2.844852, 1.394289, -2.16174, 1, 0.01960784, 0, 1,
-2.793721, 0.9993632, -0.6524826, 1, 0.02352941, 0, 1,
-2.789334, -0.07695696, -1.821328, 1, 0.03137255, 0, 1,
-2.752069, 0.2525987, -1.421708, 1, 0.03529412, 0, 1,
-2.712441, 0.1636048, -2.234932, 1, 0.04313726, 0, 1,
-2.693871, 0.9665682, -0.9565488, 1, 0.04705882, 0, 1,
-2.591844, 0.01830197, -2.510646, 1, 0.05490196, 0, 1,
-2.532679, 1.078381, -0.433717, 1, 0.05882353, 0, 1,
-2.530744, 1.750921, -0.3116624, 1, 0.06666667, 0, 1,
-2.525517, -0.884447, -1.532987, 1, 0.07058824, 0, 1,
-2.464563, -1.021431, -2.141091, 1, 0.07843138, 0, 1,
-2.457145, 0.8868618, -1.78571, 1, 0.08235294, 0, 1,
-2.421956, -1.441361, -0.4744071, 1, 0.09019608, 0, 1,
-2.388142, 0.4687718, -1.261071, 1, 0.09411765, 0, 1,
-2.38342, -0.6112368, -2.647991, 1, 0.1019608, 0, 1,
-2.356523, 0.4514422, -0.7255065, 1, 0.1098039, 0, 1,
-2.317815, 0.5613641, -2.180221, 1, 0.1137255, 0, 1,
-2.31343, 0.6584655, -1.367791, 1, 0.1215686, 0, 1,
-2.24437, -0.5055242, -0.4712829, 1, 0.1254902, 0, 1,
-2.165319, -0.7005469, -3.141683, 1, 0.1333333, 0, 1,
-2.123389, -0.9859292, -2.985927, 1, 0.1372549, 0, 1,
-2.115299, -0.6472952, -1.834539, 1, 0.145098, 0, 1,
-2.113751, -1.169229, -2.945269, 1, 0.1490196, 0, 1,
-2.03034, 1.101101, -1.779285, 1, 0.1568628, 0, 1,
-2.005953, 0.469473, -1.767291, 1, 0.1607843, 0, 1,
-2.004546, -2.312603, -2.377711, 1, 0.1686275, 0, 1,
-1.989386, 0.5824377, -0.3396908, 1, 0.172549, 0, 1,
-1.989281, 0.6806057, -1.311887, 1, 0.1803922, 0, 1,
-1.977456, 0.8073437, -0.6990194, 1, 0.1843137, 0, 1,
-1.952251, 0.8538026, -1.666844, 1, 0.1921569, 0, 1,
-1.935233, -0.2534918, -0.7861341, 1, 0.1960784, 0, 1,
-1.897326, 0.04853937, -1.784099, 1, 0.2039216, 0, 1,
-1.888571, 1.552, 0.6297563, 1, 0.2117647, 0, 1,
-1.874258, 1.370903, -0.1908634, 1, 0.2156863, 0, 1,
-1.873348, 0.9286188, -2.460391, 1, 0.2235294, 0, 1,
-1.869136, 0.5405879, -0.9706224, 1, 0.227451, 0, 1,
-1.839603, -0.9486503, -2.658064, 1, 0.2352941, 0, 1,
-1.836636, -0.01322046, -1.690515, 1, 0.2392157, 0, 1,
-1.835007, -1.319686, -1.188018, 1, 0.2470588, 0, 1,
-1.80763, 0.3735424, -1.264955, 1, 0.2509804, 0, 1,
-1.781112, -0.826285, -2.081484, 1, 0.2588235, 0, 1,
-1.753893, -0.4351493, -2.452339, 1, 0.2627451, 0, 1,
-1.747724, -0.7078843, -0.4054468, 1, 0.2705882, 0, 1,
-1.69324, -0.1235067, -1.481068, 1, 0.2745098, 0, 1,
-1.682496, -0.1258107, -0.7617761, 1, 0.282353, 0, 1,
-1.679801, -0.8794389, -2.04033, 1, 0.2862745, 0, 1,
-1.676401, -1.63, -2.303576, 1, 0.2941177, 0, 1,
-1.662045, 0.4669757, -1.590227, 1, 0.3019608, 0, 1,
-1.660564, -1.802915, -3.134828, 1, 0.3058824, 0, 1,
-1.657173, -1.000556, -1.649339, 1, 0.3137255, 0, 1,
-1.65526, 0.5127468, 0.6173455, 1, 0.3176471, 0, 1,
-1.653841, -0.7600003, -3.211084, 1, 0.3254902, 0, 1,
-1.642693, 1.058265, -1.246769, 1, 0.3294118, 0, 1,
-1.624423, -0.5745934, -2.623155, 1, 0.3372549, 0, 1,
-1.623165, -0.322087, -2.08123, 1, 0.3411765, 0, 1,
-1.619248, 2.117647, -0.4571864, 1, 0.3490196, 0, 1,
-1.612171, 0.292223, -2.904388, 1, 0.3529412, 0, 1,
-1.611117, 1.460845, 0.2362979, 1, 0.3607843, 0, 1,
-1.611117, -0.9046795, -0.5986527, 1, 0.3647059, 0, 1,
-1.610446, -0.9400513, -2.082005, 1, 0.372549, 0, 1,
-1.609973, -0.0996056, -1.159182, 1, 0.3764706, 0, 1,
-1.600414, 0.07102175, -1.738689, 1, 0.3843137, 0, 1,
-1.586418, 1.243384, -0.7739896, 1, 0.3882353, 0, 1,
-1.570591, -1.018829, -1.109999, 1, 0.3960784, 0, 1,
-1.564402, 0.6955453, -2.32538, 1, 0.4039216, 0, 1,
-1.54565, 0.994734, -1.775245, 1, 0.4078431, 0, 1,
-1.536164, -0.7807387, -1.544642, 1, 0.4156863, 0, 1,
-1.523257, -0.1281119, -1.598004, 1, 0.4196078, 0, 1,
-1.517021, 1.273976, 0.9990754, 1, 0.427451, 0, 1,
-1.512522, 1.385045, -0.3996536, 1, 0.4313726, 0, 1,
-1.507837, 0.7183576, -0.6615766, 1, 0.4392157, 0, 1,
-1.497441, -1.013468, -2.249442, 1, 0.4431373, 0, 1,
-1.467915, -0.6767366, -0.5368017, 1, 0.4509804, 0, 1,
-1.465684, -0.9480691, -2.49016, 1, 0.454902, 0, 1,
-1.464261, -1.474663, -0.5145226, 1, 0.4627451, 0, 1,
-1.458732, 0.6325739, -1.985736, 1, 0.4666667, 0, 1,
-1.458357, 0.6289907, -0.2852327, 1, 0.4745098, 0, 1,
-1.446215, 1.893669, -0.3576004, 1, 0.4784314, 0, 1,
-1.444963, -0.9619383, -1.972759, 1, 0.4862745, 0, 1,
-1.439726, 0.02717226, -1.734589, 1, 0.4901961, 0, 1,
-1.436708, 0.3368563, -2.893413, 1, 0.4980392, 0, 1,
-1.434649, 0.3955372, -1.622104, 1, 0.5058824, 0, 1,
-1.433528, 0.4820719, -0.9975199, 1, 0.509804, 0, 1,
-1.433109, 2.170352, -2.398591, 1, 0.5176471, 0, 1,
-1.430933, -0.3629779, -3.844493, 1, 0.5215687, 0, 1,
-1.419796, 1.56207, -0.6313549, 1, 0.5294118, 0, 1,
-1.417652, 2.225433, -0.3063687, 1, 0.5333334, 0, 1,
-1.406308, -3.052803, -1.646438, 1, 0.5411765, 0, 1,
-1.405312, 1.866404, -0.1652917, 1, 0.5450981, 0, 1,
-1.404927, 0.08314549, -2.413282, 1, 0.5529412, 0, 1,
-1.395442, 1.458818, -1.187716, 1, 0.5568628, 0, 1,
-1.381825, 1.05742, 0.05079724, 1, 0.5647059, 0, 1,
-1.381081, -1.140315, -1.197783, 1, 0.5686275, 0, 1,
-1.378378, -0.8197883, -1.806243, 1, 0.5764706, 0, 1,
-1.378355, -0.3888768, -1.737207, 1, 0.5803922, 0, 1,
-1.374742, 0.6122202, -1.3815, 1, 0.5882353, 0, 1,
-1.342642, -0.3100283, -2.009212, 1, 0.5921569, 0, 1,
-1.342582, 0.7932701, -1.306135, 1, 0.6, 0, 1,
-1.331776, 0.7947831, -1.333497, 1, 0.6078432, 0, 1,
-1.32621, -1.125601, -1.5082, 1, 0.6117647, 0, 1,
-1.324488, -0.7772524, -3.348664, 1, 0.6196079, 0, 1,
-1.322926, 1.552896, -0.4269761, 1, 0.6235294, 0, 1,
-1.319011, 0.1789991, -1.537244, 1, 0.6313726, 0, 1,
-1.304951, -0.1489172, -0.854853, 1, 0.6352941, 0, 1,
-1.304803, 0.4596184, -0.8898552, 1, 0.6431373, 0, 1,
-1.301562, -0.3879951, -2.115318, 1, 0.6470588, 0, 1,
-1.301339, 0.8228173, -3.8676, 1, 0.654902, 0, 1,
-1.298078, 0.8629078, 0.2676335, 1, 0.6588235, 0, 1,
-1.290817, -0.5568944, -1.014762, 1, 0.6666667, 0, 1,
-1.28899, 0.8540726, -1.564267, 1, 0.6705883, 0, 1,
-1.285888, 0.9218141, -0.6944513, 1, 0.6784314, 0, 1,
-1.281545, -0.7429793, -3.015937, 1, 0.682353, 0, 1,
-1.274811, -0.5195967, 0.08109037, 1, 0.6901961, 0, 1,
-1.268207, -0.5002798, -2.601125, 1, 0.6941177, 0, 1,
-1.260649, -0.5985553, -3.17092, 1, 0.7019608, 0, 1,
-1.254479, -0.284552, -2.047584, 1, 0.7098039, 0, 1,
-1.252588, 2.386013, 0.5050806, 1, 0.7137255, 0, 1,
-1.243591, -0.07728815, -0.3870485, 1, 0.7215686, 0, 1,
-1.240374, -1.308635, -2.144501, 1, 0.7254902, 0, 1,
-1.238636, 0.5965172, -0.4678404, 1, 0.7333333, 0, 1,
-1.235991, -0.3986183, -1.900729, 1, 0.7372549, 0, 1,
-1.235459, 1.834772, 0.5356835, 1, 0.7450981, 0, 1,
-1.233775, 0.9072008, -0.8737206, 1, 0.7490196, 0, 1,
-1.229159, 0.948844, -2.425365, 1, 0.7568628, 0, 1,
-1.226548, -0.3760637, -1.223646, 1, 0.7607843, 0, 1,
-1.224055, 0.9909196, -3.109455, 1, 0.7686275, 0, 1,
-1.222819, 0.1156114, -2.028494, 1, 0.772549, 0, 1,
-1.220788, -0.5587564, -2.997903, 1, 0.7803922, 0, 1,
-1.219543, -0.5289844, -2.732695, 1, 0.7843137, 0, 1,
-1.219052, 0.4476858, -2.095749, 1, 0.7921569, 0, 1,
-1.216207, -1.226682, -2.27374, 1, 0.7960784, 0, 1,
-1.213149, -0.4539345, -1.911758, 1, 0.8039216, 0, 1,
-1.211064, 1.024249, -2.325434, 1, 0.8117647, 0, 1,
-1.202096, -1.816012, -1.679886, 1, 0.8156863, 0, 1,
-1.193241, 0.06274184, -1.417323, 1, 0.8235294, 0, 1,
-1.1917, -0.5972081, -0.8909057, 1, 0.827451, 0, 1,
-1.189695, 0.3873725, -2.201033, 1, 0.8352941, 0, 1,
-1.18694, -0.1517103, -1.830485, 1, 0.8392157, 0, 1,
-1.185867, -0.8479264, -2.318376, 1, 0.8470588, 0, 1,
-1.183127, 0.7269054, 1.033124, 1, 0.8509804, 0, 1,
-1.174582, -1.992607, -3.639906, 1, 0.8588235, 0, 1,
-1.174005, -1.439649, -2.943527, 1, 0.8627451, 0, 1,
-1.172052, -1.064819, -3.088177, 1, 0.8705882, 0, 1,
-1.170712, -1.526619, -2.04155, 1, 0.8745098, 0, 1,
-1.165418, 0.8156492, -0.3290563, 1, 0.8823529, 0, 1,
-1.164373, -0.7192678, -2.20666, 1, 0.8862745, 0, 1,
-1.163943, -0.8776532, -2.42862, 1, 0.8941177, 0, 1,
-1.15953, -0.4689086, -0.6644529, 1, 0.8980392, 0, 1,
-1.158698, -0.1221556, -2.261833, 1, 0.9058824, 0, 1,
-1.15535, -0.4960645, -0.4706964, 1, 0.9137255, 0, 1,
-1.149212, -0.7812097, -4.991086, 1, 0.9176471, 0, 1,
-1.148333, 2.312838, -0.9700145, 1, 0.9254902, 0, 1,
-1.142393, 0.1499844, -2.462812, 1, 0.9294118, 0, 1,
-1.13975, 0.6641075, -1.821778, 1, 0.9372549, 0, 1,
-1.133437, -1.192265, -2.367826, 1, 0.9411765, 0, 1,
-1.132579, -0.3511026, -1.822912, 1, 0.9490196, 0, 1,
-1.128073, 1.331469, -0.1507266, 1, 0.9529412, 0, 1,
-1.127818, -0.2983977, -2.740464, 1, 0.9607843, 0, 1,
-1.107493, -1.841114, -3.599289, 1, 0.9647059, 0, 1,
-1.087144, 1.133871, -2.429464, 1, 0.972549, 0, 1,
-1.086868, -2.502463, -2.557932, 1, 0.9764706, 0, 1,
-1.084303, -1.426565, -1.653911, 1, 0.9843137, 0, 1,
-1.076679, 0.03428453, -1.539512, 1, 0.9882353, 0, 1,
-1.074186, -0.02103265, -0.584013, 1, 0.9960784, 0, 1,
-1.073589, -0.9740062, -3.779409, 0.9960784, 1, 0, 1,
-1.07144, 0.4964621, -0.7756491, 0.9921569, 1, 0, 1,
-1.070926, 0.9814867, -0.2528978, 0.9843137, 1, 0, 1,
-1.068357, -0.7526546, -2.382251, 0.9803922, 1, 0, 1,
-1.067891, -0.1020428, -1.15285, 0.972549, 1, 0, 1,
-1.067065, 3.340541, 0.2076846, 0.9686275, 1, 0, 1,
-1.063375, -1.425959, -1.164158, 0.9607843, 1, 0, 1,
-1.055296, 0.5298789, -0.5453075, 0.9568627, 1, 0, 1,
-1.052638, -1.824545, -1.278128, 0.9490196, 1, 0, 1,
-1.051093, 1.604923, -0.8073349, 0.945098, 1, 0, 1,
-1.049811, 0.1662544, -1.213526, 0.9372549, 1, 0, 1,
-1.048643, -0.8162043, -1.626212, 0.9333333, 1, 0, 1,
-1.046575, -1.61205, -2.354722, 0.9254902, 1, 0, 1,
-1.037182, -1.362175, -0.8783824, 0.9215686, 1, 0, 1,
-1.035858, -0.6332801, -2.681633, 0.9137255, 1, 0, 1,
-1.034172, 0.04365083, -2.215453, 0.9098039, 1, 0, 1,
-1.033633, -1.321163, -2.175363, 0.9019608, 1, 0, 1,
-1.033039, 0.850341, -3.980135, 0.8941177, 1, 0, 1,
-1.031222, -1.241388, -3.121131, 0.8901961, 1, 0, 1,
-1.023109, 0.4325222, -1.41061, 0.8823529, 1, 0, 1,
-1.022009, 1.486488, 1.406567, 0.8784314, 1, 0, 1,
-1.01922, -0.09063733, -1.419147, 0.8705882, 1, 0, 1,
-1.01843, 1.543267, -1.661838, 0.8666667, 1, 0, 1,
-1.012226, -0.1292878, -0.9641384, 0.8588235, 1, 0, 1,
-0.9977669, 2.39624, -0.4580101, 0.854902, 1, 0, 1,
-0.9959744, 0.5920939, -0.5279663, 0.8470588, 1, 0, 1,
-0.9939781, 0.6299755, -1.173709, 0.8431373, 1, 0, 1,
-0.9825738, -0.4225735, -3.283058, 0.8352941, 1, 0, 1,
-0.9746768, 0.5639792, -1.181226, 0.8313726, 1, 0, 1,
-0.9697234, 1.005915, 0.2862692, 0.8235294, 1, 0, 1,
-0.9670376, -0.7179455, -2.85454, 0.8196079, 1, 0, 1,
-0.955651, -0.4702004, -2.27789, 0.8117647, 1, 0, 1,
-0.9507677, -0.3576847, -1.366644, 0.8078431, 1, 0, 1,
-0.9506928, 1.395875, -0.129031, 0.8, 1, 0, 1,
-0.9501897, -1.031881, -3.026444, 0.7921569, 1, 0, 1,
-0.9472995, 0.4550261, -2.050208, 0.7882353, 1, 0, 1,
-0.937647, 1.816399, -2.703817, 0.7803922, 1, 0, 1,
-0.9312735, -0.6667659, -1.283191, 0.7764706, 1, 0, 1,
-0.9274547, 0.9868443, -1.492339, 0.7686275, 1, 0, 1,
-0.9231553, 1.506251, -1.849368, 0.7647059, 1, 0, 1,
-0.9181643, 2.060966, -1.129753, 0.7568628, 1, 0, 1,
-0.9114291, 0.3601226, -0.8636943, 0.7529412, 1, 0, 1,
-0.9041345, 1.163438, 0.2830423, 0.7450981, 1, 0, 1,
-0.9014853, 1.780191, -0.8695155, 0.7411765, 1, 0, 1,
-0.9013274, -1.91461, -4.860889, 0.7333333, 1, 0, 1,
-0.8943278, 0.9889925, -0.8959336, 0.7294118, 1, 0, 1,
-0.8910137, 2.26182, -0.6347702, 0.7215686, 1, 0, 1,
-0.8908367, 0.5838483, -1.755569, 0.7176471, 1, 0, 1,
-0.8869242, -0.3186073, -1.949566, 0.7098039, 1, 0, 1,
-0.8840637, -1.354331, -2.216049, 0.7058824, 1, 0, 1,
-0.881164, 1.003767, 0.8729352, 0.6980392, 1, 0, 1,
-0.8678586, 0.1980404, -1.334556, 0.6901961, 1, 0, 1,
-0.8536356, -0.3596737, -2.877615, 0.6862745, 1, 0, 1,
-0.8504073, 3.018747, 2.566698, 0.6784314, 1, 0, 1,
-0.8441194, -0.6129678, -1.988357, 0.6745098, 1, 0, 1,
-0.8430383, 1.240226, 0.248312, 0.6666667, 1, 0, 1,
-0.842773, 0.5037574, -1.398971, 0.6627451, 1, 0, 1,
-0.8427101, -0.7733629, -1.906868, 0.654902, 1, 0, 1,
-0.841442, -0.4050134, -0.8911858, 0.6509804, 1, 0, 1,
-0.8380423, 0.4188115, -2.969472, 0.6431373, 1, 0, 1,
-0.8338754, -1.15415, -1.927104, 0.6392157, 1, 0, 1,
-0.8297831, 0.6139447, -0.8291008, 0.6313726, 1, 0, 1,
-0.8269421, 1.370302, -1.462571, 0.627451, 1, 0, 1,
-0.8214028, 0.08161594, -2.040163, 0.6196079, 1, 0, 1,
-0.8175804, 2.136336, -2.29765, 0.6156863, 1, 0, 1,
-0.8164331, 0.29908, -2.668912, 0.6078432, 1, 0, 1,
-0.8033264, -0.004367291, 0.7276478, 0.6039216, 1, 0, 1,
-0.8014349, -0.04216367, -1.042607, 0.5960785, 1, 0, 1,
-0.7869836, 0.5429261, -2.75924, 0.5882353, 1, 0, 1,
-0.7868059, -0.2537249, -1.445075, 0.5843138, 1, 0, 1,
-0.7849452, -0.5989248, -2.102273, 0.5764706, 1, 0, 1,
-0.7807754, -0.9925367, -2.361724, 0.572549, 1, 0, 1,
-0.7803708, 1.29973, -0.6681474, 0.5647059, 1, 0, 1,
-0.778571, 1.032278, -1.035353, 0.5607843, 1, 0, 1,
-0.7758972, -1.112086, -2.66135, 0.5529412, 1, 0, 1,
-0.7741227, 0.05920845, -2.372024, 0.5490196, 1, 0, 1,
-0.7734227, 1.349764, 0.06260438, 0.5411765, 1, 0, 1,
-0.768629, 0.6455839, -1.639981, 0.5372549, 1, 0, 1,
-0.7656907, -1.094613, -3.535745, 0.5294118, 1, 0, 1,
-0.7608643, -1.270787, -1.948188, 0.5254902, 1, 0, 1,
-0.7542271, 1.15465, -0.1111463, 0.5176471, 1, 0, 1,
-0.7535611, -0.09510749, -1.415811, 0.5137255, 1, 0, 1,
-0.7531814, -0.001866071, -1.138647, 0.5058824, 1, 0, 1,
-0.7472447, -0.4369614, -1.579213, 0.5019608, 1, 0, 1,
-0.7451872, -0.7586138, -1.936952, 0.4941176, 1, 0, 1,
-0.7448465, -0.7194448, -3.602897, 0.4862745, 1, 0, 1,
-0.7421259, -0.5434121, -3.772392, 0.4823529, 1, 0, 1,
-0.7413298, 1.027815, -1.910828, 0.4745098, 1, 0, 1,
-0.7402423, 2.836757, -0.4238999, 0.4705882, 1, 0, 1,
-0.7399905, -0.6376483, -1.248292, 0.4627451, 1, 0, 1,
-0.7346138, -0.6752154, -1.447854, 0.4588235, 1, 0, 1,
-0.7320238, -1.088352, -2.613, 0.4509804, 1, 0, 1,
-0.7304584, -0.2868732, -1.785674, 0.4470588, 1, 0, 1,
-0.7296814, -0.5404744, -2.249493, 0.4392157, 1, 0, 1,
-0.7238744, -0.2749716, -2.850174, 0.4352941, 1, 0, 1,
-0.7228552, 0.5677696, -0.6855376, 0.427451, 1, 0, 1,
-0.7215979, -1.168574, -3.944009, 0.4235294, 1, 0, 1,
-0.7190955, -1.840764, -2.012938, 0.4156863, 1, 0, 1,
-0.717469, -0.1468467, -0.7717648, 0.4117647, 1, 0, 1,
-0.694022, -0.6102629, -2.371286, 0.4039216, 1, 0, 1,
-0.6934492, 0.6563316, -1.530268, 0.3960784, 1, 0, 1,
-0.6911595, 0.943757, -1.127463, 0.3921569, 1, 0, 1,
-0.6885964, -0.4758103, -1.640192, 0.3843137, 1, 0, 1,
-0.6843621, 1.202809, -0.4412728, 0.3803922, 1, 0, 1,
-0.6807976, -0.0690091, -2.233994, 0.372549, 1, 0, 1,
-0.6782557, 0.1013102, -0.5561532, 0.3686275, 1, 0, 1,
-0.6767373, 0.8360258, -0.5484352, 0.3607843, 1, 0, 1,
-0.6698528, 0.08182656, -2.527454, 0.3568628, 1, 0, 1,
-0.6562704, -0.2451952, -1.414751, 0.3490196, 1, 0, 1,
-0.6538821, 0.8290387, -0.6607823, 0.345098, 1, 0, 1,
-0.6526471, 0.1984007, -1.401616, 0.3372549, 1, 0, 1,
-0.6514558, 1.317582, -1.803258, 0.3333333, 1, 0, 1,
-0.6511079, 0.6324738, -0.3029082, 0.3254902, 1, 0, 1,
-0.6478477, 1.324446, -1.376582, 0.3215686, 1, 0, 1,
-0.6475952, -1.066861, -4.273354, 0.3137255, 1, 0, 1,
-0.6461368, 0.3475738, -1.804312, 0.3098039, 1, 0, 1,
-0.6455238, 1.273497, 0.3155206, 0.3019608, 1, 0, 1,
-0.6402557, 0.9489887, 0.2672185, 0.2941177, 1, 0, 1,
-0.6401451, -1.172259, -2.125876, 0.2901961, 1, 0, 1,
-0.6394764, 1.184657, 0.1653777, 0.282353, 1, 0, 1,
-0.6345257, -0.4238293, -1.720091, 0.2784314, 1, 0, 1,
-0.6327138, -0.5602083, -0.5110663, 0.2705882, 1, 0, 1,
-0.6244141, -0.1972623, -1.768778, 0.2666667, 1, 0, 1,
-0.623064, -0.08118901, -2.822838, 0.2588235, 1, 0, 1,
-0.6178776, 1.146655, -0.6548706, 0.254902, 1, 0, 1,
-0.6134852, -1.501481, -2.661754, 0.2470588, 1, 0, 1,
-0.6118445, -0.3378857, -0.9411671, 0.2431373, 1, 0, 1,
-0.6090973, 2.486614, 1.11857, 0.2352941, 1, 0, 1,
-0.6039841, -1.106619, -2.470239, 0.2313726, 1, 0, 1,
-0.6039252, -0.1468821, -1.589629, 0.2235294, 1, 0, 1,
-0.6038338, 0.710513, -0.05088052, 0.2196078, 1, 0, 1,
-0.6032538, -0.08763428, -1.340735, 0.2117647, 1, 0, 1,
-0.601461, -0.5884686, -3.130432, 0.2078431, 1, 0, 1,
-0.5982242, 2.036885, -0.4563983, 0.2, 1, 0, 1,
-0.5936436, 0.01780842, -2.178646, 0.1921569, 1, 0, 1,
-0.5933278, 0.8928399, -1.160225, 0.1882353, 1, 0, 1,
-0.5933164, -0.1202152, -3.242816, 0.1803922, 1, 0, 1,
-0.5911573, 0.520073, -1.234606, 0.1764706, 1, 0, 1,
-0.5875331, 0.1366976, -1.013031, 0.1686275, 1, 0, 1,
-0.5867854, -0.5945862, -2.031782, 0.1647059, 1, 0, 1,
-0.5835629, -1.086884, -3.444478, 0.1568628, 1, 0, 1,
-0.5831693, 0.840423, -1.227064, 0.1529412, 1, 0, 1,
-0.58248, 0.5453312, -2.572896, 0.145098, 1, 0, 1,
-0.5810784, -1.122564, -1.662436, 0.1411765, 1, 0, 1,
-0.5794901, -1.095156, -2.299683, 0.1333333, 1, 0, 1,
-0.5790056, -0.4218456, -0.5391404, 0.1294118, 1, 0, 1,
-0.5772361, 0.130392, -2.664179, 0.1215686, 1, 0, 1,
-0.5761567, -1.398993, -2.610287, 0.1176471, 1, 0, 1,
-0.5761021, 0.892188, 0.8402826, 0.1098039, 1, 0, 1,
-0.5718433, 1.905581, 0.3393996, 0.1058824, 1, 0, 1,
-0.5706795, 0.2805184, 0.3048497, 0.09803922, 1, 0, 1,
-0.5700478, 0.6321313, -0.8833628, 0.09019608, 1, 0, 1,
-0.567589, -0.3563679, -0.912114, 0.08627451, 1, 0, 1,
-0.5661855, -1.23327, -1.523338, 0.07843138, 1, 0, 1,
-0.560542, 0.1479407, -1.371804, 0.07450981, 1, 0, 1,
-0.5441685, -0.07147948, -0.7405304, 0.06666667, 1, 0, 1,
-0.5409073, -1.62613, -2.667368, 0.0627451, 1, 0, 1,
-0.5375309, 0.6673225, -0.1717975, 0.05490196, 1, 0, 1,
-0.5365389, 1.13789, -2.033988, 0.05098039, 1, 0, 1,
-0.5355352, 0.4186558, -2.703168, 0.04313726, 1, 0, 1,
-0.5281626, -1.15626, -1.268127, 0.03921569, 1, 0, 1,
-0.5267627, 1.110306, 0.3958299, 0.03137255, 1, 0, 1,
-0.5175033, 0.1067048, -3.213643, 0.02745098, 1, 0, 1,
-0.5133194, 0.472376, -1.827233, 0.01960784, 1, 0, 1,
-0.5121021, -0.8522643, -3.217152, 0.01568628, 1, 0, 1,
-0.5116343, 1.247436, -0.2392217, 0.007843138, 1, 0, 1,
-0.50432, -1.110551, -3.075758, 0.003921569, 1, 0, 1,
-0.5003618, -1.111526, -1.586122, 0, 1, 0.003921569, 1,
-0.4908895, -1.104087, -2.08108, 0, 1, 0.01176471, 1,
-0.4884767, 0.385864, 0.2206521, 0, 1, 0.01568628, 1,
-0.4858408, 1.93191, -0.8353353, 0, 1, 0.02352941, 1,
-0.4850986, 0.6740929, -0.09822167, 0, 1, 0.02745098, 1,
-0.482981, 0.3290681, 0.218753, 0, 1, 0.03529412, 1,
-0.4820288, 3.331467, -1.114065, 0, 1, 0.03921569, 1,
-0.4812339, -0.723617, -2.913383, 0, 1, 0.04705882, 1,
-0.480022, 0.9108412, -1.032509, 0, 1, 0.05098039, 1,
-0.4765765, 1.16669, -1.528947, 0, 1, 0.05882353, 1,
-0.4713951, -1.493625, -0.389132, 0, 1, 0.0627451, 1,
-0.4699684, -0.3762096, -4.703856, 0, 1, 0.07058824, 1,
-0.4699043, 0.224025, -2.578687, 0, 1, 0.07450981, 1,
-0.4646622, 0.7904125, 0.4398343, 0, 1, 0.08235294, 1,
-0.4606937, 0.4327124, 1.189895, 0, 1, 0.08627451, 1,
-0.4603604, -1.147031, -2.701506, 0, 1, 0.09411765, 1,
-0.4583853, 0.381352, -2.337541, 0, 1, 0.1019608, 1,
-0.4575606, 1.102665, -1.093184, 0, 1, 0.1058824, 1,
-0.4574636, 0.3046964, -0.5449403, 0, 1, 0.1137255, 1,
-0.4553342, -0.09725887, -3.564017, 0, 1, 0.1176471, 1,
-0.4526702, -0.5552477, -1.402521, 0, 1, 0.1254902, 1,
-0.4513119, -0.2380207, -3.131207, 0, 1, 0.1294118, 1,
-0.4505141, 0.5806707, -2.521678, 0, 1, 0.1372549, 1,
-0.4480332, 0.05536174, 0.5947371, 0, 1, 0.1411765, 1,
-0.4466239, 0.1385318, -1.896277, 0, 1, 0.1490196, 1,
-0.4458922, -0.03456748, -2.76148, 0, 1, 0.1529412, 1,
-0.4445974, -0.3572678, -1.595245, 0, 1, 0.1607843, 1,
-0.4396296, -0.6921782, -3.944288, 0, 1, 0.1647059, 1,
-0.4378572, -1.202248, -3.562052, 0, 1, 0.172549, 1,
-0.4357424, -1.235066, -2.285937, 0, 1, 0.1764706, 1,
-0.4357319, -0.7228669, -2.976959, 0, 1, 0.1843137, 1,
-0.4353202, -0.05563832, -2.379246, 0, 1, 0.1882353, 1,
-0.4271504, -0.0400302, -1.466038, 0, 1, 0.1960784, 1,
-0.4265866, -1.586192, -2.959863, 0, 1, 0.2039216, 1,
-0.4264667, 0.5718079, -2.691714, 0, 1, 0.2078431, 1,
-0.425255, -0.4182893, -2.738051, 0, 1, 0.2156863, 1,
-0.4248412, -0.4901511, -2.123142, 0, 1, 0.2196078, 1,
-0.4245828, -0.5313579, -2.3397, 0, 1, 0.227451, 1,
-0.4237299, 0.8474756, 0.335694, 0, 1, 0.2313726, 1,
-0.4228323, -1.091455, -1.723407, 0, 1, 0.2392157, 1,
-0.4194642, -0.1296805, -2.94467, 0, 1, 0.2431373, 1,
-0.4185181, -0.4851401, -2.446522, 0, 1, 0.2509804, 1,
-0.4172051, -0.5005777, -1.69477, 0, 1, 0.254902, 1,
-0.4121985, -1.231854, -2.316333, 0, 1, 0.2627451, 1,
-0.4058579, 1.09672, -0.6723576, 0, 1, 0.2666667, 1,
-0.4033842, -0.915222, -0.9616894, 0, 1, 0.2745098, 1,
-0.4002338, 0.3621646, -0.4808935, 0, 1, 0.2784314, 1,
-0.396551, 0.4527464, 1.224095, 0, 1, 0.2862745, 1,
-0.3960254, 1.227894, -0.08741821, 0, 1, 0.2901961, 1,
-0.3947364, 0.6148243, -2.559207, 0, 1, 0.2980392, 1,
-0.3940679, -0.08638537, -2.325913, 0, 1, 0.3058824, 1,
-0.3940346, 0.06804672, -0.8948801, 0, 1, 0.3098039, 1,
-0.3938718, -0.3496723, -3.088569, 0, 1, 0.3176471, 1,
-0.3838741, -1.440674, -4.416271, 0, 1, 0.3215686, 1,
-0.3837496, -0.07505772, -0.5362735, 0, 1, 0.3294118, 1,
-0.3793724, 0.8702374, 0.1597286, 0, 1, 0.3333333, 1,
-0.3778205, -0.0777765, -0.3090609, 0, 1, 0.3411765, 1,
-0.3696832, -0.2619642, -1.86366, 0, 1, 0.345098, 1,
-0.3679259, 0.2280408, -1.779642, 0, 1, 0.3529412, 1,
-0.3677867, 0.3722762, -2.045919, 0, 1, 0.3568628, 1,
-0.3660487, 1.150815, -0.3230095, 0, 1, 0.3647059, 1,
-0.3621187, 0.6063186, -1.05603, 0, 1, 0.3686275, 1,
-0.3603708, -0.3044118, -0.4650186, 0, 1, 0.3764706, 1,
-0.3519838, 1.877259, 0.2412982, 0, 1, 0.3803922, 1,
-0.3506893, 1.545575, -0.6065403, 0, 1, 0.3882353, 1,
-0.3477758, 1.010485, -1.387944, 0, 1, 0.3921569, 1,
-0.3475202, 0.9908493, -0.5624602, 0, 1, 0.4, 1,
-0.346259, 0.07452393, 0.6335419, 0, 1, 0.4078431, 1,
-0.3447863, -1.031603, -2.460594, 0, 1, 0.4117647, 1,
-0.3443013, -0.3061341, 0.9283538, 0, 1, 0.4196078, 1,
-0.3441845, -1.232796, -3.865605, 0, 1, 0.4235294, 1,
-0.3419701, 0.3454887, -0.3309018, 0, 1, 0.4313726, 1,
-0.3388211, 0.3669449, -0.9033697, 0, 1, 0.4352941, 1,
-0.3384098, 0.9993225, -0.5198695, 0, 1, 0.4431373, 1,
-0.3368843, 0.8525134, 0.4837233, 0, 1, 0.4470588, 1,
-0.334475, 0.4441589, -1.336054, 0, 1, 0.454902, 1,
-0.3329766, -0.1753324, -2.13039, 0, 1, 0.4588235, 1,
-0.332653, -0.653669, -1.004235, 0, 1, 0.4666667, 1,
-0.3312915, -0.02510604, -1.614789, 0, 1, 0.4705882, 1,
-0.3289579, -0.4112983, -2.562959, 0, 1, 0.4784314, 1,
-0.3284487, -1.926285, -3.658554, 0, 1, 0.4823529, 1,
-0.3227801, -0.5158685, -2.315772, 0, 1, 0.4901961, 1,
-0.3222748, 0.739522, 0.9352204, 0, 1, 0.4941176, 1,
-0.3200029, 1.391306, 1.015769, 0, 1, 0.5019608, 1,
-0.3084221, -0.4912552, -3.045501, 0, 1, 0.509804, 1,
-0.3066637, -0.5919436, -2.51519, 0, 1, 0.5137255, 1,
-0.302438, 1.667929, -0.5373083, 0, 1, 0.5215687, 1,
-0.302146, 0.6396645, -0.4989952, 0, 1, 0.5254902, 1,
-0.3008212, -0.3644551, -2.628128, 0, 1, 0.5333334, 1,
-0.2960165, -0.3785865, -0.8884225, 0, 1, 0.5372549, 1,
-0.2906458, -1.641041, -0.9791334, 0, 1, 0.5450981, 1,
-0.2849596, 0.5606918, 0.1495717, 0, 1, 0.5490196, 1,
-0.2804098, -0.7265111, -2.723817, 0, 1, 0.5568628, 1,
-0.2723296, -1.562921, -4.506616, 0, 1, 0.5607843, 1,
-0.2679608, -0.8615681, -4.327715, 0, 1, 0.5686275, 1,
-0.2678998, 0.5613965, -0.1412271, 0, 1, 0.572549, 1,
-0.2673049, -0.3071008, -1.160879, 0, 1, 0.5803922, 1,
-0.2616822, -0.04322813, -1.658578, 0, 1, 0.5843138, 1,
-0.2606812, -0.5824358, -3.242486, 0, 1, 0.5921569, 1,
-0.2589048, 0.2805006, 0.2676402, 0, 1, 0.5960785, 1,
-0.2581848, 0.9208225, 0.7973133, 0, 1, 0.6039216, 1,
-0.2517444, 1.155483, 0.4346691, 0, 1, 0.6117647, 1,
-0.2466473, -0.4184516, -1.560681, 0, 1, 0.6156863, 1,
-0.2426199, 0.5810189, -0.1672699, 0, 1, 0.6235294, 1,
-0.2402992, -0.2516087, -1.454614, 0, 1, 0.627451, 1,
-0.2400688, 1.320089, -0.07702392, 0, 1, 0.6352941, 1,
-0.2374153, -0.426086, -2.370456, 0, 1, 0.6392157, 1,
-0.2333199, -0.5962461, -3.333465, 0, 1, 0.6470588, 1,
-0.2332445, 0.2350044, -2.381149, 0, 1, 0.6509804, 1,
-0.2319368, 1.213139, 0.8089437, 0, 1, 0.6588235, 1,
-0.2284781, 1.100518, -0.004721095, 0, 1, 0.6627451, 1,
-0.2257764, -0.5721739, -2.994074, 0, 1, 0.6705883, 1,
-0.2215115, -0.6090955, -2.169372, 0, 1, 0.6745098, 1,
-0.2203857, 1.993479, 1.52096, 0, 1, 0.682353, 1,
-0.2136501, 0.6487907, 0.4071911, 0, 1, 0.6862745, 1,
-0.2130383, 1.493081, -0.6131939, 0, 1, 0.6941177, 1,
-0.211278, 0.8738319, 0.637557, 0, 1, 0.7019608, 1,
-0.2077032, 0.203104, -0.8865146, 0, 1, 0.7058824, 1,
-0.206776, 0.4596229, -1.850873, 0, 1, 0.7137255, 1,
-0.2049042, 0.4053439, -0.2564346, 0, 1, 0.7176471, 1,
-0.2005151, 1.043748, 1.651945, 0, 1, 0.7254902, 1,
-0.1982184, 0.4462019, 0.1581737, 0, 1, 0.7294118, 1,
-0.1926898, 0.02247808, -2.33665, 0, 1, 0.7372549, 1,
-0.1923967, 1.739621, -0.276926, 0, 1, 0.7411765, 1,
-0.1898735, 1.34851, -0.4577955, 0, 1, 0.7490196, 1,
-0.1896972, -1.171335, -3.757478, 0, 1, 0.7529412, 1,
-0.1895508, 0.5066603, 0.1147105, 0, 1, 0.7607843, 1,
-0.1857845, -0.622273, -4.646636, 0, 1, 0.7647059, 1,
-0.1821459, -1.370415, -2.866255, 0, 1, 0.772549, 1,
-0.1816702, -0.1776478, -2.11637, 0, 1, 0.7764706, 1,
-0.1787915, 1.311442, -0.7305871, 0, 1, 0.7843137, 1,
-0.1711963, 2.318866, 0.7966948, 0, 1, 0.7882353, 1,
-0.1649735, 0.1272692, -0.9763637, 0, 1, 0.7960784, 1,
-0.1623056, -1.574164, -3.861263, 0, 1, 0.8039216, 1,
-0.1601876, 0.908159, 0.6930181, 0, 1, 0.8078431, 1,
-0.1567255, -1.359207, -3.583746, 0, 1, 0.8156863, 1,
-0.1557286, -0.004064254, -2.647722, 0, 1, 0.8196079, 1,
-0.1475071, -0.004524584, -0.7824287, 0, 1, 0.827451, 1,
-0.1440818, 0.4506844, 0.0590277, 0, 1, 0.8313726, 1,
-0.1423572, 1.233553, 1.694073, 0, 1, 0.8392157, 1,
-0.1370496, 0.9404002, -0.2909042, 0, 1, 0.8431373, 1,
-0.1353848, -0.05991341, -2.669094, 0, 1, 0.8509804, 1,
-0.1342629, -1.266214, -5.038016, 0, 1, 0.854902, 1,
-0.1309109, -1.589644, -2.300265, 0, 1, 0.8627451, 1,
-0.1300769, -0.670442, -2.611454, 0, 1, 0.8666667, 1,
-0.1281554, 0.3196102, 0.8260878, 0, 1, 0.8745098, 1,
-0.1249714, 2.373858, -0.9052962, 0, 1, 0.8784314, 1,
-0.12196, -0.2738937, -2.727145, 0, 1, 0.8862745, 1,
-0.1188105, -0.642135, -2.779275, 0, 1, 0.8901961, 1,
-0.1167288, -1.190325, -4.232197, 0, 1, 0.8980392, 1,
-0.1166301, -0.7979746, -4.579961, 0, 1, 0.9058824, 1,
-0.1148914, -0.8085846, -2.134029, 0, 1, 0.9098039, 1,
-0.1140185, 0.4514948, -0.04687046, 0, 1, 0.9176471, 1,
-0.1139667, -1.252544, -3.552577, 0, 1, 0.9215686, 1,
-0.1119865, 0.4480991, -0.2938527, 0, 1, 0.9294118, 1,
-0.109312, -0.07104526, -2.426057, 0, 1, 0.9333333, 1,
-0.1069278, 0.1199871, -0.4067277, 0, 1, 0.9411765, 1,
-0.09889048, 1.009101, -0.5294059, 0, 1, 0.945098, 1,
-0.09739518, -1.316456, -3.096627, 0, 1, 0.9529412, 1,
-0.09366652, -0.7540238, -3.830931, 0, 1, 0.9568627, 1,
-0.09324843, -0.5242642, -3.360311, 0, 1, 0.9647059, 1,
-0.09244394, -1.558005, -2.34119, 0, 1, 0.9686275, 1,
-0.08887616, -0.655018, -3.881791, 0, 1, 0.9764706, 1,
-0.08607528, 0.1883998, 0.7836023, 0, 1, 0.9803922, 1,
-0.08424461, 0.1126502, -0.5524884, 0, 1, 0.9882353, 1,
-0.07314588, -0.893428, -4.691144, 0, 1, 0.9921569, 1,
-0.07135009, 0.3064311, 0.6357288, 0, 1, 1, 1,
-0.06786825, -0.3970215, -3.278542, 0, 0.9921569, 1, 1,
-0.06577928, 1.386141, -0.4065608, 0, 0.9882353, 1, 1,
-0.06561679, -0.7581294, -2.853486, 0, 0.9803922, 1, 1,
-0.05694247, -0.6519213, -3.010438, 0, 0.9764706, 1, 1,
-0.0562664, -0.2616377, -3.979451, 0, 0.9686275, 1, 1,
-0.05625789, -0.2795883, -3.227512, 0, 0.9647059, 1, 1,
-0.05488828, -0.8317311, -4.177784, 0, 0.9568627, 1, 1,
-0.05358418, 1.125162, 0.737494, 0, 0.9529412, 1, 1,
-0.04934222, -0.2936547, -2.329129, 0, 0.945098, 1, 1,
-0.04605351, 0.5876335, -0.6915607, 0, 0.9411765, 1, 1,
-0.03965878, -0.6675574, -2.183342, 0, 0.9333333, 1, 1,
-0.03945802, 0.6426573, 1.653124, 0, 0.9294118, 1, 1,
-0.0367489, 0.1787271, 0.03762869, 0, 0.9215686, 1, 1,
-0.03393384, 0.9845484, -0.8694153, 0, 0.9176471, 1, 1,
-0.02991216, -1.066325, -2.899504, 0, 0.9098039, 1, 1,
-0.02177676, 2.066342, 1.985267, 0, 0.9058824, 1, 1,
-0.02105993, -0.1330874, -2.547892, 0, 0.8980392, 1, 1,
-0.02082694, -0.5806052, -2.547779, 0, 0.8901961, 1, 1,
-0.01977018, 0.8025882, 0.9977821, 0, 0.8862745, 1, 1,
-0.01659192, -0.164712, -2.828265, 0, 0.8784314, 1, 1,
-0.01311829, 0.1864432, 0.5605178, 0, 0.8745098, 1, 1,
-0.01285394, 0.5780923, -1.481665, 0, 0.8666667, 1, 1,
-0.009135754, -0.08081151, -4.209679, 0, 0.8627451, 1, 1,
-0.008216282, 0.02701991, -1.158367, 0, 0.854902, 1, 1,
-0.007774489, 0.2320097, 0.6540356, 0, 0.8509804, 1, 1,
-0.007181503, -1.160887, -3.953599, 0, 0.8431373, 1, 1,
-0.004856144, -0.1216584, -2.505797, 0, 0.8392157, 1, 1,
-0.0008854028, 1.291242, -0.4426159, 0, 0.8313726, 1, 1,
-0.0007399757, -0.4776297, -2.879602, 0, 0.827451, 1, 1,
0.003487187, -1.906727, 2.282918, 0, 0.8196079, 1, 1,
0.005783937, -1.657037, 2.683904, 0, 0.8156863, 1, 1,
0.007827856, 0.597058, -0.2425535, 0, 0.8078431, 1, 1,
0.01042345, 0.3712646, 0.1356002, 0, 0.8039216, 1, 1,
0.01235767, -0.8044323, 4.445284, 0, 0.7960784, 1, 1,
0.01297651, -1.411934, 2.521152, 0, 0.7882353, 1, 1,
0.01344937, 0.9298971, -0.1257548, 0, 0.7843137, 1, 1,
0.01365823, 0.4991868, -0.1594056, 0, 0.7764706, 1, 1,
0.01493964, -0.1265169, 3.039725, 0, 0.772549, 1, 1,
0.01617605, 1.983279, -0.1051821, 0, 0.7647059, 1, 1,
0.01700378, -1.145507, 2.572313, 0, 0.7607843, 1, 1,
0.0250007, 0.3326192, -0.3392995, 0, 0.7529412, 1, 1,
0.02759032, 1.982717, 1.561745, 0, 0.7490196, 1, 1,
0.029022, -0.309832, 4.122201, 0, 0.7411765, 1, 1,
0.03686012, -0.6615798, 3.880447, 0, 0.7372549, 1, 1,
0.03825957, 0.09638187, 0.4746923, 0, 0.7294118, 1, 1,
0.03968107, -1.17112, 3.465804, 0, 0.7254902, 1, 1,
0.04217463, -0.5685468, 2.648407, 0, 0.7176471, 1, 1,
0.04809124, 1.254188, 1.675835, 0, 0.7137255, 1, 1,
0.04845544, -0.06265353, 3.036567, 0, 0.7058824, 1, 1,
0.04924926, -0.3392173, 1.919351, 0, 0.6980392, 1, 1,
0.05600566, -0.3680839, 2.278282, 0, 0.6941177, 1, 1,
0.057128, -0.08331189, 1.727305, 0, 0.6862745, 1, 1,
0.06073259, 1.555605, -0.5273075, 0, 0.682353, 1, 1,
0.06189178, -0.281234, 2.27769, 0, 0.6745098, 1, 1,
0.06556839, 1.341798, -1.043771, 0, 0.6705883, 1, 1,
0.06610841, 0.6475658, -0.3173881, 0, 0.6627451, 1, 1,
0.0706387, 0.5760227, 0.08338841, 0, 0.6588235, 1, 1,
0.07152117, -0.5114603, 4.097148, 0, 0.6509804, 1, 1,
0.07229084, -0.2132899, 2.714905, 0, 0.6470588, 1, 1,
0.0750016, 0.267266, 0.4367304, 0, 0.6392157, 1, 1,
0.0786111, -1.410259, 1.832615, 0, 0.6352941, 1, 1,
0.07904981, -1.700198, 2.78435, 0, 0.627451, 1, 1,
0.07960153, -1.146544, 5.802792, 0, 0.6235294, 1, 1,
0.0807287, -0.9006169, 2.543632, 0, 0.6156863, 1, 1,
0.08312266, 0.1264922, -0.09176927, 0, 0.6117647, 1, 1,
0.08340317, 1.16178, 1.735334, 0, 0.6039216, 1, 1,
0.08642592, -1.452701, 1.585528, 0, 0.5960785, 1, 1,
0.09208799, 2.113351, 0.6360366, 0, 0.5921569, 1, 1,
0.09244516, 1.149738, 1.781893, 0, 0.5843138, 1, 1,
0.09328691, -1.159259, 2.832099, 0, 0.5803922, 1, 1,
0.1051497, 1.356205, 1.473504, 0, 0.572549, 1, 1,
0.1127679, 1.511933, -1.814029, 0, 0.5686275, 1, 1,
0.1158371, 1.636209, -1.255439, 0, 0.5607843, 1, 1,
0.1160547, 0.9560729, 0.8844075, 0, 0.5568628, 1, 1,
0.1213383, 0.4882609, -0.1842031, 0, 0.5490196, 1, 1,
0.124602, -0.7437091, 2.286777, 0, 0.5450981, 1, 1,
0.1251764, 0.6388204, -0.1960655, 0, 0.5372549, 1, 1,
0.1258426, -1.210749, 0.6048976, 0, 0.5333334, 1, 1,
0.1266112, -0.1561571, 4.496596, 0, 0.5254902, 1, 1,
0.1291649, -0.6503072, 2.214468, 0, 0.5215687, 1, 1,
0.1331345, -1.149101, 2.976209, 0, 0.5137255, 1, 1,
0.1334694, 1.276751, -1.913153, 0, 0.509804, 1, 1,
0.1335195, 0.6568111, 0.1305053, 0, 0.5019608, 1, 1,
0.1357464, -1.908655, 5.789937, 0, 0.4941176, 1, 1,
0.1359089, 1.382439, -0.03402385, 0, 0.4901961, 1, 1,
0.1360949, 1.634785, -0.9706244, 0, 0.4823529, 1, 1,
0.1395369, -0.1491159, 3.02391, 0, 0.4784314, 1, 1,
0.1399797, 0.3218184, 2.045132, 0, 0.4705882, 1, 1,
0.1407564, -0.8967171, 2.529329, 0, 0.4666667, 1, 1,
0.1428477, 0.4858902, -0.2653525, 0, 0.4588235, 1, 1,
0.14538, -3.19579, 3.597753, 0, 0.454902, 1, 1,
0.1490791, 0.01381032, -0.3997582, 0, 0.4470588, 1, 1,
0.1499502, 1.262487, 2.818149, 0, 0.4431373, 1, 1,
0.1506912, 0.6189128, 0.6607489, 0, 0.4352941, 1, 1,
0.1541942, -1.4065, 3.033432, 0, 0.4313726, 1, 1,
0.1542824, 1.66246, 0.2630162, 0, 0.4235294, 1, 1,
0.1581486, 1.494816, 4.211412, 0, 0.4196078, 1, 1,
0.1602986, -1.052122, 3.819814, 0, 0.4117647, 1, 1,
0.1649278, 0.1636841, -0.7212801, 0, 0.4078431, 1, 1,
0.1653387, 1.13718, 0.3496162, 0, 0.4, 1, 1,
0.1707212, 1.159977, 1.220245, 0, 0.3921569, 1, 1,
0.1733438, 0.4993323, -0.5466274, 0, 0.3882353, 1, 1,
0.1760963, -1.720406, 2.707697, 0, 0.3803922, 1, 1,
0.1770294, -0.9403639, 2.76121, 0, 0.3764706, 1, 1,
0.1801429, -0.1511892, 0.00912648, 0, 0.3686275, 1, 1,
0.1830116, -1.284225, 2.786043, 0, 0.3647059, 1, 1,
0.1841329, -0.2117816, 2.692321, 0, 0.3568628, 1, 1,
0.1841798, 0.9894959, -0.9997362, 0, 0.3529412, 1, 1,
0.1858433, 1.021183, -0.1613557, 0, 0.345098, 1, 1,
0.1868189, -0.708178, 3.83445, 0, 0.3411765, 1, 1,
0.1885313, -1.435985, 4.660244, 0, 0.3333333, 1, 1,
0.1888179, -0.4348225, 3.132221, 0, 0.3294118, 1, 1,
0.1973396, -0.07516426, 2.642667, 0, 0.3215686, 1, 1,
0.2004294, 1.445126, 1.294037, 0, 0.3176471, 1, 1,
0.2014662, 1.235185, 1.005973, 0, 0.3098039, 1, 1,
0.2039958, 0.8373633, 0.9245746, 0, 0.3058824, 1, 1,
0.213773, -1.356495, 2.288606, 0, 0.2980392, 1, 1,
0.2145328, 0.8317833, 0.03351176, 0, 0.2901961, 1, 1,
0.2157124, -0.4799606, 2.854798, 0, 0.2862745, 1, 1,
0.2175563, 1.745076, 0.5547826, 0, 0.2784314, 1, 1,
0.2219397, -0.6356469, 3.332496, 0, 0.2745098, 1, 1,
0.2295729, -1.731528, 4.015774, 0, 0.2666667, 1, 1,
0.2323909, -0.5281484, 2.44998, 0, 0.2627451, 1, 1,
0.2374889, -1.247515, 3.609937, 0, 0.254902, 1, 1,
0.2379966, -0.556266, 2.597106, 0, 0.2509804, 1, 1,
0.238992, 0.9604326, 0.9435788, 0, 0.2431373, 1, 1,
0.2408043, -0.2460965, 2.656665, 0, 0.2392157, 1, 1,
0.2416072, -0.9302706, 2.306197, 0, 0.2313726, 1, 1,
0.2507986, 0.2982722, 0.01442636, 0, 0.227451, 1, 1,
0.2527516, 0.8585831, 0.8219724, 0, 0.2196078, 1, 1,
0.2546362, 0.744285, -1.521777, 0, 0.2156863, 1, 1,
0.255565, 0.5414796, 0.7687544, 0, 0.2078431, 1, 1,
0.2582976, -0.1027108, 3.11188, 0, 0.2039216, 1, 1,
0.2606615, 0.8129121, -0.9853335, 0, 0.1960784, 1, 1,
0.2682085, 0.6044227, 0.1165472, 0, 0.1882353, 1, 1,
0.2694065, 1.468452, -0.8222235, 0, 0.1843137, 1, 1,
0.26949, 1.806756, 0.03647031, 0, 0.1764706, 1, 1,
0.2734441, 0.6877196, 0.5953651, 0, 0.172549, 1, 1,
0.2748847, -1.00619, 3.131566, 0, 0.1647059, 1, 1,
0.2781006, -0.1598817, 1.524641, 0, 0.1607843, 1, 1,
0.2787099, 1.224037, 0.2285617, 0, 0.1529412, 1, 1,
0.2845284, -0.3182981, 1.604638, 0, 0.1490196, 1, 1,
0.2864293, -0.5773548, 1.657558, 0, 0.1411765, 1, 1,
0.2866907, -1.013509, 1.965254, 0, 0.1372549, 1, 1,
0.3012799, -0.08696863, 0.5937952, 0, 0.1294118, 1, 1,
0.309677, 1.653982, -0.01645354, 0, 0.1254902, 1, 1,
0.3117141, 0.9132613, 0.5822966, 0, 0.1176471, 1, 1,
0.3124632, -0.07809868, 1.634055, 0, 0.1137255, 1, 1,
0.3131402, -1.610536, 2.363295, 0, 0.1058824, 1, 1,
0.3168582, -0.6246327, 2.54015, 0, 0.09803922, 1, 1,
0.3174405, 0.09844247, 1.994678, 0, 0.09411765, 1, 1,
0.3253295, -0.2412046, 1.561781, 0, 0.08627451, 1, 1,
0.3259226, -0.4694844, 4.569819, 0, 0.08235294, 1, 1,
0.3304724, -1.083803, 1.301626, 0, 0.07450981, 1, 1,
0.3307014, 0.9005138, 1.133058, 0, 0.07058824, 1, 1,
0.335129, 0.1165191, 2.196967, 0, 0.0627451, 1, 1,
0.3387347, 0.4753623, -0.09190712, 0, 0.05882353, 1, 1,
0.339448, 0.1728514, 1.304435, 0, 0.05098039, 1, 1,
0.3432211, -0.1016561, 2.990641, 0, 0.04705882, 1, 1,
0.3458542, 0.7663093, 0.2146273, 0, 0.03921569, 1, 1,
0.3462416, 0.5049492, 2.450866, 0, 0.03529412, 1, 1,
0.3485753, 0.8039868, -0.4862542, 0, 0.02745098, 1, 1,
0.3490875, -1.151143, 3.486044, 0, 0.02352941, 1, 1,
0.3495537, -2.222801, 2.715072, 0, 0.01568628, 1, 1,
0.3518231, 0.6167575, 0.9283032, 0, 0.01176471, 1, 1,
0.3562168, 1.321003, -0.4942834, 0, 0.003921569, 1, 1,
0.3628278, 0.5073396, 0.01037435, 0.003921569, 0, 1, 1,
0.3635771, -1.106643, 4.995597, 0.007843138, 0, 1, 1,
0.365903, -1.061154, 3.934308, 0.01568628, 0, 1, 1,
0.3665486, -0.9493875, 3.467982, 0.01960784, 0, 1, 1,
0.3718393, -0.4650217, 3.51586, 0.02745098, 0, 1, 1,
0.3738001, 0.02829225, 1.816258, 0.03137255, 0, 1, 1,
0.3774906, 0.3058788, 1.313306, 0.03921569, 0, 1, 1,
0.3795475, 1.192483, -0.2942063, 0.04313726, 0, 1, 1,
0.3857797, 0.02084784, -0.02658599, 0.05098039, 0, 1, 1,
0.3860361, 1.767947, 1.122424, 0.05490196, 0, 1, 1,
0.3926922, -0.4808293, 2.05265, 0.0627451, 0, 1, 1,
0.3934569, 0.5301341, -0.4018613, 0.06666667, 0, 1, 1,
0.4018022, 0.8565539, -0.8738351, 0.07450981, 0, 1, 1,
0.408593, -0.7515375, 2.353676, 0.07843138, 0, 1, 1,
0.4123241, 1.085349, 0.4551413, 0.08627451, 0, 1, 1,
0.4141334, 0.5662459, 0.08413602, 0.09019608, 0, 1, 1,
0.4178253, 1.1387, 0.7916248, 0.09803922, 0, 1, 1,
0.4204743, -0.8313317, 1.836251, 0.1058824, 0, 1, 1,
0.4266662, 0.7590454, 0.416069, 0.1098039, 0, 1, 1,
0.4303377, -0.8492959, 2.204837, 0.1176471, 0, 1, 1,
0.4331777, -2.075611, 1.372231, 0.1215686, 0, 1, 1,
0.43444, 0.7572315, 0.5074611, 0.1294118, 0, 1, 1,
0.4357348, 1.323233, 2.494861, 0.1333333, 0, 1, 1,
0.4374618, -0.7879565, 3.065851, 0.1411765, 0, 1, 1,
0.4381223, -0.01302479, -0.05386927, 0.145098, 0, 1, 1,
0.4388462, -0.3869966, 4.139689, 0.1529412, 0, 1, 1,
0.4389648, 0.5795717, -0.548577, 0.1568628, 0, 1, 1,
0.4438836, -0.236174, 2.353702, 0.1647059, 0, 1, 1,
0.4461474, -0.6277472, 2.93214, 0.1686275, 0, 1, 1,
0.4501821, -1.836408, 3.922556, 0.1764706, 0, 1, 1,
0.4503041, 0.03285085, 0.4771769, 0.1803922, 0, 1, 1,
0.4510671, -0.4042971, 2.767753, 0.1882353, 0, 1, 1,
0.4536547, -0.9898645, 2.406419, 0.1921569, 0, 1, 1,
0.454118, -0.2201105, 1.253325, 0.2, 0, 1, 1,
0.4544094, 0.3437889, 1.236108, 0.2078431, 0, 1, 1,
0.45494, 0.8524664, -0.5471619, 0.2117647, 0, 1, 1,
0.4550374, 0.2686762, 2.132102, 0.2196078, 0, 1, 1,
0.4629445, -0.2501347, 1.68582, 0.2235294, 0, 1, 1,
0.4658391, 1.239553, 0.6423599, 0.2313726, 0, 1, 1,
0.4668311, -1.238284, 4.214488, 0.2352941, 0, 1, 1,
0.469422, -0.8295134, 1.796231, 0.2431373, 0, 1, 1,
0.4748453, 0.02615202, 0.5598072, 0.2470588, 0, 1, 1,
0.475362, 1.211536, -0.09581894, 0.254902, 0, 1, 1,
0.4761507, -0.8704166, 1.990689, 0.2588235, 0, 1, 1,
0.4873985, 0.4281553, 0.4141898, 0.2666667, 0, 1, 1,
0.4886251, 0.9687805, 0.7338631, 0.2705882, 0, 1, 1,
0.4961323, 2.654851, 0.4961708, 0.2784314, 0, 1, 1,
0.4979664, 0.2161155, 1.362943, 0.282353, 0, 1, 1,
0.5003554, 0.3887819, -0.004703839, 0.2901961, 0, 1, 1,
0.5011295, 1.097214, 0.9551682, 0.2941177, 0, 1, 1,
0.5084522, 0.03231179, 0.5419389, 0.3019608, 0, 1, 1,
0.5131326, -0.4785488, 1.778571, 0.3098039, 0, 1, 1,
0.5141796, 0.3808169, 0.7943726, 0.3137255, 0, 1, 1,
0.5155994, 0.4958047, 1.333413, 0.3215686, 0, 1, 1,
0.5172812, 0.06170572, 1.883944, 0.3254902, 0, 1, 1,
0.5184552, -0.9899758, 2.271502, 0.3333333, 0, 1, 1,
0.5205715, -1.071061, 4.080443, 0.3372549, 0, 1, 1,
0.5254061, -0.004141348, 4.027489, 0.345098, 0, 1, 1,
0.5298091, -1.27515, 1.351497, 0.3490196, 0, 1, 1,
0.5359907, -0.7916675, 2.606156, 0.3568628, 0, 1, 1,
0.5376073, 0.1718245, 0.06278452, 0.3607843, 0, 1, 1,
0.5379844, -0.6713168, 0.461584, 0.3686275, 0, 1, 1,
0.5456943, -0.6257901, 1.329806, 0.372549, 0, 1, 1,
0.5480517, 0.6964799, -0.07244893, 0.3803922, 0, 1, 1,
0.5496629, 0.626402, 1.80576, 0.3843137, 0, 1, 1,
0.5527359, -1.467948, 0.800544, 0.3921569, 0, 1, 1,
0.5530401, -0.3072861, 0.9280237, 0.3960784, 0, 1, 1,
0.5621926, -1.619357, 2.068929, 0.4039216, 0, 1, 1,
0.5677073, 0.5729592, 3.281015, 0.4117647, 0, 1, 1,
0.5700716, 0.1523524, 2.185988, 0.4156863, 0, 1, 1,
0.5715761, -0.405276, 0.5774102, 0.4235294, 0, 1, 1,
0.5723653, 2.624998, -0.600862, 0.427451, 0, 1, 1,
0.5772632, -1.366374, 1.305365, 0.4352941, 0, 1, 1,
0.5781883, 0.1309839, 3.098567, 0.4392157, 0, 1, 1,
0.5804189, 1.041154, 1.009475, 0.4470588, 0, 1, 1,
0.5861901, 0.2500751, 1.375616, 0.4509804, 0, 1, 1,
0.5863042, 0.5994327, 1.42054, 0.4588235, 0, 1, 1,
0.5896504, -0.1970925, 1.288154, 0.4627451, 0, 1, 1,
0.5900406, 1.533973, -0.09863544, 0.4705882, 0, 1, 1,
0.5986663, 1.593283, -0.2708099, 0.4745098, 0, 1, 1,
0.6050307, 0.3472523, -1.501313, 0.4823529, 0, 1, 1,
0.605333, -0.4856013, 1.809749, 0.4862745, 0, 1, 1,
0.6091006, 0.4568372, 0.1773355, 0.4941176, 0, 1, 1,
0.6093799, -0.4814598, 4.083829, 0.5019608, 0, 1, 1,
0.6191205, 0.3068585, 0.7435176, 0.5058824, 0, 1, 1,
0.6228964, -0.6145794, 3.672716, 0.5137255, 0, 1, 1,
0.6352553, 1.24891, -0.1650299, 0.5176471, 0, 1, 1,
0.6433194, 2.044419, 1.323664, 0.5254902, 0, 1, 1,
0.6469526, 1.836852, 1.599977, 0.5294118, 0, 1, 1,
0.6481428, -0.7060271, 3.394662, 0.5372549, 0, 1, 1,
0.6485311, -0.5701681, 2.259122, 0.5411765, 0, 1, 1,
0.6510324, 0.4734198, 1.528028, 0.5490196, 0, 1, 1,
0.6511555, 0.007148097, 2.230738, 0.5529412, 0, 1, 1,
0.6597481, -1.870722, 2.544397, 0.5607843, 0, 1, 1,
0.6614805, 0.2560828, 0.2434829, 0.5647059, 0, 1, 1,
0.6675104, 0.07508189, 2.117218, 0.572549, 0, 1, 1,
0.6693451, -0.2029389, 3.327616, 0.5764706, 0, 1, 1,
0.6762474, -0.4584821, 2.970656, 0.5843138, 0, 1, 1,
0.6780304, -0.2498252, 2.07114, 0.5882353, 0, 1, 1,
0.6791417, 1.756354, 2.362695, 0.5960785, 0, 1, 1,
0.6868885, 1.07213, 2.229653, 0.6039216, 0, 1, 1,
0.6877831, -0.5663987, 0.9300451, 0.6078432, 0, 1, 1,
0.6898474, 1.026555, 0.7859408, 0.6156863, 0, 1, 1,
0.6977303, -0.7399083, 2.459432, 0.6196079, 0, 1, 1,
0.6978145, -0.4484696, 1.612003, 0.627451, 0, 1, 1,
0.6991082, -0.4605994, 2.266224, 0.6313726, 0, 1, 1,
0.7018794, 0.7429404, 0.9798546, 0.6392157, 0, 1, 1,
0.7032918, 0.4678502, -0.2682455, 0.6431373, 0, 1, 1,
0.7041901, -0.5447411, 2.721642, 0.6509804, 0, 1, 1,
0.7069437, 0.5827506, 1.461408, 0.654902, 0, 1, 1,
0.7110462, -0.0026047, 0.9879562, 0.6627451, 0, 1, 1,
0.7155129, -0.8566038, 3.934648, 0.6666667, 0, 1, 1,
0.7170668, -0.460298, 2.266939, 0.6745098, 0, 1, 1,
0.7200898, 0.2322922, 1.064973, 0.6784314, 0, 1, 1,
0.7269902, -0.3934487, 2.05887, 0.6862745, 0, 1, 1,
0.7279059, -2.850848, 2.559203, 0.6901961, 0, 1, 1,
0.7288389, 0.9342431, 1.137829, 0.6980392, 0, 1, 1,
0.7307568, 0.04759151, 1.911805, 0.7058824, 0, 1, 1,
0.7344642, -0.6467174, 3.769268, 0.7098039, 0, 1, 1,
0.7382045, 0.8731855, -0.5252391, 0.7176471, 0, 1, 1,
0.7391053, -0.2047689, 1.752455, 0.7215686, 0, 1, 1,
0.7456292, -0.1886717, 0.01817664, 0.7294118, 0, 1, 1,
0.750619, -1.110606, 2.752001, 0.7333333, 0, 1, 1,
0.7523344, -0.4906121, 2.305632, 0.7411765, 0, 1, 1,
0.7545857, -0.9049347, 2.285864, 0.7450981, 0, 1, 1,
0.7551782, -0.3598668, 2.746592, 0.7529412, 0, 1, 1,
0.7552927, -0.3720624, 1.849626, 0.7568628, 0, 1, 1,
0.7597488, 0.2122437, 1.840877, 0.7647059, 0, 1, 1,
0.7615191, -0.5204608, 4.542459, 0.7686275, 0, 1, 1,
0.7623971, -0.956898, 0.7589095, 0.7764706, 0, 1, 1,
0.7697318, -0.6514957, 3.69713, 0.7803922, 0, 1, 1,
0.7753156, 1.658373, 0.6708643, 0.7882353, 0, 1, 1,
0.7771277, -0.2250289, 1.453604, 0.7921569, 0, 1, 1,
0.7771536, -1.425915, 3.836965, 0.8, 0, 1, 1,
0.7819308, -0.4626945, 3.28605, 0.8078431, 0, 1, 1,
0.7882108, -0.6903225, 2.604088, 0.8117647, 0, 1, 1,
0.7905308, 0.7285966, 2.144693, 0.8196079, 0, 1, 1,
0.8000721, -0.1752117, 1.483341, 0.8235294, 0, 1, 1,
0.8024738, -1.622034, 1.770108, 0.8313726, 0, 1, 1,
0.8129716, -0.9177746, 2.964017, 0.8352941, 0, 1, 1,
0.8130174, -1.198646, 2.389566, 0.8431373, 0, 1, 1,
0.8136376, 0.9466642, 1.783824, 0.8470588, 0, 1, 1,
0.8143926, -1.109702, 2.85329, 0.854902, 0, 1, 1,
0.8147907, -1.31536, 2.595522, 0.8588235, 0, 1, 1,
0.8162463, 1.048961, 0.2777982, 0.8666667, 0, 1, 1,
0.8195457, -0.9924576, 4.813498, 0.8705882, 0, 1, 1,
0.8203088, -0.7968439, 1.620011, 0.8784314, 0, 1, 1,
0.823823, 0.782674, 1.150297, 0.8823529, 0, 1, 1,
0.8243851, -0.211539, 2.28489, 0.8901961, 0, 1, 1,
0.8254489, 0.6398647, 0.6937523, 0.8941177, 0, 1, 1,
0.8336393, -0.8093274, 0.9650629, 0.9019608, 0, 1, 1,
0.8408853, 0.9952197, 0.8230761, 0.9098039, 0, 1, 1,
0.8412566, -0.5110368, 0.3670275, 0.9137255, 0, 1, 1,
0.8447213, -0.3219799, 2.390803, 0.9215686, 0, 1, 1,
0.8573722, -0.3599498, 2.591636, 0.9254902, 0, 1, 1,
0.8665547, -1.758327, 2.751162, 0.9333333, 0, 1, 1,
0.8667949, 0.3810236, 0.6128763, 0.9372549, 0, 1, 1,
0.8669888, 0.3152112, 2.606675, 0.945098, 0, 1, 1,
0.8692049, -0.6541735, 4.393322, 0.9490196, 0, 1, 1,
0.8775537, -0.2435688, 1.73872, 0.9568627, 0, 1, 1,
0.884847, -0.2476195, 0.9937892, 0.9607843, 0, 1, 1,
0.889413, 0.7253043, -0.03405177, 0.9686275, 0, 1, 1,
0.8896131, 0.462114, 1.570132, 0.972549, 0, 1, 1,
0.8961403, -1.494536, 3.454728, 0.9803922, 0, 1, 1,
0.9016478, -0.02259718, 1.253819, 0.9843137, 0, 1, 1,
0.9032611, -0.3680286, 2.228828, 0.9921569, 0, 1, 1,
0.9056541, -1.34237, 1.729387, 0.9960784, 0, 1, 1,
0.9058331, 0.2105021, 1.029918, 1, 0, 0.9960784, 1,
0.9115843, 0.1453388, 1.482598, 1, 0, 0.9882353, 1,
0.9116072, 0.1852459, 0.02990745, 1, 0, 0.9843137, 1,
0.9120663, 0.02971586, 2.051938, 1, 0, 0.9764706, 1,
0.914092, -0.6096875, 1.955596, 1, 0, 0.972549, 1,
0.9158382, 0.09843677, 0.9141549, 1, 0, 0.9647059, 1,
0.9174554, 0.6440511, 1.702705, 1, 0, 0.9607843, 1,
0.9247621, 1.664708, 0.3272972, 1, 0, 0.9529412, 1,
0.9326569, 2.004436, 0.04161113, 1, 0, 0.9490196, 1,
0.9379231, -1.333552, 2.393394, 1, 0, 0.9411765, 1,
0.938067, 1.359816, 1.793853, 1, 0, 0.9372549, 1,
0.943669, 0.9576778, 1.397866, 1, 0, 0.9294118, 1,
0.9454669, -0.9818126, 1.901302, 1, 0, 0.9254902, 1,
0.9580243, -1.85551, 0.7042007, 1, 0, 0.9176471, 1,
0.959859, -2.816687, 1.716542, 1, 0, 0.9137255, 1,
0.9642943, -0.6389987, 3.745098, 1, 0, 0.9058824, 1,
0.9662482, 1.212404, 0.699788, 1, 0, 0.9019608, 1,
0.9713975, -1.200047, 0.6591017, 1, 0, 0.8941177, 1,
0.9754637, 1.136791, 1.45349, 1, 0, 0.8862745, 1,
0.9790164, -0.08903795, 1.232743, 1, 0, 0.8823529, 1,
0.9849566, 1.245708, 0.9600366, 1, 0, 0.8745098, 1,
0.9902887, -0.6875139, 0.7524507, 1, 0, 0.8705882, 1,
1.001117, 1.830255, 0.6843292, 1, 0, 0.8627451, 1,
1.003168, -0.3066868, 2.628175, 1, 0, 0.8588235, 1,
1.003467, -0.5163735, 1.631992, 1, 0, 0.8509804, 1,
1.005575, 1.798046, 0.498925, 1, 0, 0.8470588, 1,
1.007122, 0.5326731, 1.42138, 1, 0, 0.8392157, 1,
1.011367, 0.7130974, 0.2843174, 1, 0, 0.8352941, 1,
1.015782, -0.5466412, 0.1585602, 1, 0, 0.827451, 1,
1.020726, -0.5278913, 1.293709, 1, 0, 0.8235294, 1,
1.022455, 2.6451, -0.341032, 1, 0, 0.8156863, 1,
1.024096, 0.8463845, 0.7280207, 1, 0, 0.8117647, 1,
1.031384, -0.6960627, 1.074045, 1, 0, 0.8039216, 1,
1.043572, -1.007888, 0.9097748, 1, 0, 0.7960784, 1,
1.047548, -1.167115, 2.795334, 1, 0, 0.7921569, 1,
1.048496, 0.8686935, 0.5817739, 1, 0, 0.7843137, 1,
1.064783, 1.101338, 2.070694, 1, 0, 0.7803922, 1,
1.072514, -0.2934424, 1.996634, 1, 0, 0.772549, 1,
1.072596, -0.1267842, 3.435437, 1, 0, 0.7686275, 1,
1.073463, 1.520226, 0.6789915, 1, 0, 0.7607843, 1,
1.076913, 0.03511529, 1.968532, 1, 0, 0.7568628, 1,
1.092202, 0.5848522, 1.079959, 1, 0, 0.7490196, 1,
1.093199, 0.2051848, 1.022424, 1, 0, 0.7450981, 1,
1.093512, 1.45657, 2.068226, 1, 0, 0.7372549, 1,
1.098665, 0.7439122, 0.2747692, 1, 0, 0.7333333, 1,
1.10022, -0.1992291, 0.6350256, 1, 0, 0.7254902, 1,
1.110094, -1.339271, 1.868265, 1, 0, 0.7215686, 1,
1.11426, 1.880296, 1.359149, 1, 0, 0.7137255, 1,
1.117561, 1.777575, 0.4914074, 1, 0, 0.7098039, 1,
1.122967, 0.8754773, 1.256843, 1, 0, 0.7019608, 1,
1.123124, -0.5283384, 2.066565, 1, 0, 0.6941177, 1,
1.151688, 0.52233, 0.2657651, 1, 0, 0.6901961, 1,
1.15705, 0.01350637, 1.553257, 1, 0, 0.682353, 1,
1.163685, -0.8752983, 2.451523, 1, 0, 0.6784314, 1,
1.165475, 2.298787, 0.08012694, 1, 0, 0.6705883, 1,
1.172933, -0.8038443, 4.377569, 1, 0, 0.6666667, 1,
1.178291, -1.382979, 2.277635, 1, 0, 0.6588235, 1,
1.193057, 0.8342055, 2.237571, 1, 0, 0.654902, 1,
1.194986, -0.4230147, 1.418437, 1, 0, 0.6470588, 1,
1.199665, -0.06123693, 1.310357, 1, 0, 0.6431373, 1,
1.201463, -0.2414818, 1.955869, 1, 0, 0.6352941, 1,
1.205356, -0.9794973, 2.888492, 1, 0, 0.6313726, 1,
1.215065, 0.1141879, 1.487789, 1, 0, 0.6235294, 1,
1.234063, 0.8421944, 0.8291669, 1, 0, 0.6196079, 1,
1.236463, -0.6943164, 1.722461, 1, 0, 0.6117647, 1,
1.244072, 0.2111349, 1.070289, 1, 0, 0.6078432, 1,
1.256404, -1.044105, 2.663668, 1, 0, 0.6, 1,
1.256585, 2.37481, -0.2320247, 1, 0, 0.5921569, 1,
1.261198, 1.404824, -0.3848803, 1, 0, 0.5882353, 1,
1.266352, -0.9212974, 1.592175, 1, 0, 0.5803922, 1,
1.266924, 1.607621, 1.452443, 1, 0, 0.5764706, 1,
1.267829, 0.08939099, 1.589995, 1, 0, 0.5686275, 1,
1.282531, 1.208292, 0.01603404, 1, 0, 0.5647059, 1,
1.299088, 0.5511513, 0.6641564, 1, 0, 0.5568628, 1,
1.301479, 0.004059918, 0.4432426, 1, 0, 0.5529412, 1,
1.305133, -1.336996, 2.31061, 1, 0, 0.5450981, 1,
1.310522, 2.171167, 0.4143764, 1, 0, 0.5411765, 1,
1.31516, 1.694945, 0.4553304, 1, 0, 0.5333334, 1,
1.323067, 1.344808, 3.488416, 1, 0, 0.5294118, 1,
1.327872, -1.94676, 2.292637, 1, 0, 0.5215687, 1,
1.329047, -1.158866, 3.333672, 1, 0, 0.5176471, 1,
1.329585, 1.968024, -0.9254553, 1, 0, 0.509804, 1,
1.334087, -0.3065622, 3.589646, 1, 0, 0.5058824, 1,
1.340209, -0.04521951, 1.468171, 1, 0, 0.4980392, 1,
1.360912, -0.8265821, 1.198863, 1, 0, 0.4901961, 1,
1.36386, -2.123737, 3.117823, 1, 0, 0.4862745, 1,
1.373914, 0.8412642, 0.707482, 1, 0, 0.4784314, 1,
1.379696, -0.2341224, 1.93041, 1, 0, 0.4745098, 1,
1.382244, 0.8292007, 0.953689, 1, 0, 0.4666667, 1,
1.382732, 1.553918, 1.357833, 1, 0, 0.4627451, 1,
1.388319, -0.555761, 2.479195, 1, 0, 0.454902, 1,
1.428243, 0.7041669, 1.958585, 1, 0, 0.4509804, 1,
1.433257, -1.211142, 2.118051, 1, 0, 0.4431373, 1,
1.439691, -0.7349322, 2.246452, 1, 0, 0.4392157, 1,
1.464412, -0.07606646, 2.210711, 1, 0, 0.4313726, 1,
1.469315, -1.533673, 1.260399, 1, 0, 0.427451, 1,
1.475516, 0.6550732, 1.904658, 1, 0, 0.4196078, 1,
1.489287, -0.01566708, 2.042511, 1, 0, 0.4156863, 1,
1.493311, 0.6869836, -0.2763012, 1, 0, 0.4078431, 1,
1.508653, -0.002424701, 0.2404022, 1, 0, 0.4039216, 1,
1.523915, -0.2624325, 1.559295, 1, 0, 0.3960784, 1,
1.52831, -2.391505, 2.735283, 1, 0, 0.3882353, 1,
1.529362, -1.852802, 3.70457, 1, 0, 0.3843137, 1,
1.53872, -0.7876845, 1.186517, 1, 0, 0.3764706, 1,
1.542764, -1.345529, 3.112832, 1, 0, 0.372549, 1,
1.548719, -0.6249201, 1.700977, 1, 0, 0.3647059, 1,
1.558236, 1.516709, 1.239788, 1, 0, 0.3607843, 1,
1.580081, -0.3858911, 3.004897, 1, 0, 0.3529412, 1,
1.590124, -0.718132, 3.146609, 1, 0, 0.3490196, 1,
1.59303, 0.2323842, -0.1148013, 1, 0, 0.3411765, 1,
1.616737, 0.6392543, 1.258124, 1, 0, 0.3372549, 1,
1.620777, -2.986392, 2.158026, 1, 0, 0.3294118, 1,
1.621581, 2.77013, 1.072574, 1, 0, 0.3254902, 1,
1.633095, -1.418452, 2.713723, 1, 0, 0.3176471, 1,
1.638883, -2.260144, 1.99236, 1, 0, 0.3137255, 1,
1.64093, 1.058529, -0.09803341, 1, 0, 0.3058824, 1,
1.662046, -0.08135152, 2.000259, 1, 0, 0.2980392, 1,
1.677994, -0.8813576, 1.502674, 1, 0, 0.2941177, 1,
1.686735, -0.4442646, 1.433063, 1, 0, 0.2862745, 1,
1.699622, 0.6660737, 0.01991762, 1, 0, 0.282353, 1,
1.713748, -0.06020596, 1.64449, 1, 0, 0.2745098, 1,
1.737517, -2.403142, 1.579873, 1, 0, 0.2705882, 1,
1.806098, 1.303278, 0.8514736, 1, 0, 0.2627451, 1,
1.824431, 0.3626523, 3.326073, 1, 0, 0.2588235, 1,
1.859646, 1.356604, 0.5491799, 1, 0, 0.2509804, 1,
1.866947, -1.076794, 1.315153, 1, 0, 0.2470588, 1,
1.870547, 1.407656, 1.235262, 1, 0, 0.2392157, 1,
1.873769, 0.4306588, 0.5457721, 1, 0, 0.2352941, 1,
1.874576, -0.8816408, 3.395275, 1, 0, 0.227451, 1,
1.874996, -0.8626579, 2.483359, 1, 0, 0.2235294, 1,
1.87754, 0.04552929, 1.913733, 1, 0, 0.2156863, 1,
1.891125, 0.2320305, 1.660399, 1, 0, 0.2117647, 1,
1.891147, 1.041029, -0.005848384, 1, 0, 0.2039216, 1,
1.927706, -1.46112, 2.341278, 1, 0, 0.1960784, 1,
1.950205, -0.8854254, 1.818598, 1, 0, 0.1921569, 1,
1.956725, 1.485302, 1.272135, 1, 0, 0.1843137, 1,
1.963318, 0.6332449, 2.074152, 1, 0, 0.1803922, 1,
1.980055, -0.9191468, 1.240619, 1, 0, 0.172549, 1,
1.981752, 0.5347615, 1.62369, 1, 0, 0.1686275, 1,
1.983613, -1.294461, 0.2738061, 1, 0, 0.1607843, 1,
2.011134, -1.465143, 3.299972, 1, 0, 0.1568628, 1,
2.045144, -1.559672, 3.339976, 1, 0, 0.1490196, 1,
2.047317, 0.9850693, 1.03162, 1, 0, 0.145098, 1,
2.052163, -0.1847444, 3.40157, 1, 0, 0.1372549, 1,
2.053741, -1.467855, 1.520732, 1, 0, 0.1333333, 1,
2.0765, -0.6452447, 2.07804, 1, 0, 0.1254902, 1,
2.079248, -0.3868752, 1.285761, 1, 0, 0.1215686, 1,
2.08788, 1.05256, 1.962907, 1, 0, 0.1137255, 1,
2.111374, 0.5797734, 1.946626, 1, 0, 0.1098039, 1,
2.172873, 1.0991, 0.2762285, 1, 0, 0.1019608, 1,
2.173653, -1.325629, 2.973943, 1, 0, 0.09411765, 1,
2.194723, -0.1288639, 1.685753, 1, 0, 0.09019608, 1,
2.202533, 0.2920052, 3.429198, 1, 0, 0.08235294, 1,
2.22789, 1.597749, 0.1850856, 1, 0, 0.07843138, 1,
2.229813, 0.4197409, 3.082299, 1, 0, 0.07058824, 1,
2.239901, -3.318701, 1.376903, 1, 0, 0.06666667, 1,
2.330456, -0.3479569, 2.340669, 1, 0, 0.05882353, 1,
2.439646, -1.194062, 2.550058, 1, 0, 0.05490196, 1,
2.468168, 1.069441, -0.3367008, 1, 0, 0.04705882, 1,
2.528651, 0.04777009, 3.754882, 1, 0, 0.04313726, 1,
2.562363, 0.7845445, 0.8616362, 1, 0, 0.03529412, 1,
2.713164, 0.5719703, 0.2902807, 1, 0, 0.03137255, 1,
2.770989, 1.328316, -0.261733, 1, 0, 0.02352941, 1,
2.810677, 0.8270424, 1.108826, 1, 0, 0.01960784, 1,
2.935475, -2.447224, 1.225721, 1, 0, 0.01176471, 1,
3.335713, -0.2945037, 2.475872, 1, 0, 0.007843138, 1
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
0.1168107, -4.447442, -6.875533, 0, -0.5, 0.5, 0.5,
0.1168107, -4.447442, -6.875533, 1, -0.5, 0.5, 0.5,
0.1168107, -4.447442, -6.875533, 1, 1.5, 0.5, 0.5,
0.1168107, -4.447442, -6.875533, 0, 1.5, 0.5, 0.5
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
-4.193299, 0.01092005, -6.875533, 0, -0.5, 0.5, 0.5,
-4.193299, 0.01092005, -6.875533, 1, -0.5, 0.5, 0.5,
-4.193299, 0.01092005, -6.875533, 1, 1.5, 0.5, 0.5,
-4.193299, 0.01092005, -6.875533, 0, 1.5, 0.5, 0.5
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
-4.193299, -4.447442, 0.3823876, 0, -0.5, 0.5, 0.5,
-4.193299, -4.447442, 0.3823876, 1, -0.5, 0.5, 0.5,
-4.193299, -4.447442, 0.3823876, 1, 1.5, 0.5, 0.5,
-4.193299, -4.447442, 0.3823876, 0, 1.5, 0.5, 0.5
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
-3, -3.418589, -5.200628,
3, -3.418589, -5.200628,
-3, -3.418589, -5.200628,
-3, -3.590065, -5.479779,
-2, -3.418589, -5.200628,
-2, -3.590065, -5.479779,
-1, -3.418589, -5.200628,
-1, -3.590065, -5.479779,
0, -3.418589, -5.200628,
0, -3.590065, -5.479779,
1, -3.418589, -5.200628,
1, -3.590065, -5.479779,
2, -3.418589, -5.200628,
2, -3.590065, -5.479779,
3, -3.418589, -5.200628,
3, -3.590065, -5.479779
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
-3, -3.933016, -6.038081, 0, -0.5, 0.5, 0.5,
-3, -3.933016, -6.038081, 1, -0.5, 0.5, 0.5,
-3, -3.933016, -6.038081, 1, 1.5, 0.5, 0.5,
-3, -3.933016, -6.038081, 0, 1.5, 0.5, 0.5,
-2, -3.933016, -6.038081, 0, -0.5, 0.5, 0.5,
-2, -3.933016, -6.038081, 1, -0.5, 0.5, 0.5,
-2, -3.933016, -6.038081, 1, 1.5, 0.5, 0.5,
-2, -3.933016, -6.038081, 0, 1.5, 0.5, 0.5,
-1, -3.933016, -6.038081, 0, -0.5, 0.5, 0.5,
-1, -3.933016, -6.038081, 1, -0.5, 0.5, 0.5,
-1, -3.933016, -6.038081, 1, 1.5, 0.5, 0.5,
-1, -3.933016, -6.038081, 0, 1.5, 0.5, 0.5,
0, -3.933016, -6.038081, 0, -0.5, 0.5, 0.5,
0, -3.933016, -6.038081, 1, -0.5, 0.5, 0.5,
0, -3.933016, -6.038081, 1, 1.5, 0.5, 0.5,
0, -3.933016, -6.038081, 0, 1.5, 0.5, 0.5,
1, -3.933016, -6.038081, 0, -0.5, 0.5, 0.5,
1, -3.933016, -6.038081, 1, -0.5, 0.5, 0.5,
1, -3.933016, -6.038081, 1, 1.5, 0.5, 0.5,
1, -3.933016, -6.038081, 0, 1.5, 0.5, 0.5,
2, -3.933016, -6.038081, 0, -0.5, 0.5, 0.5,
2, -3.933016, -6.038081, 1, -0.5, 0.5, 0.5,
2, -3.933016, -6.038081, 1, 1.5, 0.5, 0.5,
2, -3.933016, -6.038081, 0, 1.5, 0.5, 0.5,
3, -3.933016, -6.038081, 0, -0.5, 0.5, 0.5,
3, -3.933016, -6.038081, 1, -0.5, 0.5, 0.5,
3, -3.933016, -6.038081, 1, 1.5, 0.5, 0.5,
3, -3.933016, -6.038081, 0, 1.5, 0.5, 0.5
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
-3.198659, -3, -5.200628,
-3.198659, 3, -5.200628,
-3.198659, -3, -5.200628,
-3.364432, -3, -5.479779,
-3.198659, -2, -5.200628,
-3.364432, -2, -5.479779,
-3.198659, -1, -5.200628,
-3.364432, -1, -5.479779,
-3.198659, 0, -5.200628,
-3.364432, 0, -5.479779,
-3.198659, 1, -5.200628,
-3.364432, 1, -5.479779,
-3.198659, 2, -5.200628,
-3.364432, 2, -5.479779,
-3.198659, 3, -5.200628,
-3.364432, 3, -5.479779
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
-3.695979, -3, -6.038081, 0, -0.5, 0.5, 0.5,
-3.695979, -3, -6.038081, 1, -0.5, 0.5, 0.5,
-3.695979, -3, -6.038081, 1, 1.5, 0.5, 0.5,
-3.695979, -3, -6.038081, 0, 1.5, 0.5, 0.5,
-3.695979, -2, -6.038081, 0, -0.5, 0.5, 0.5,
-3.695979, -2, -6.038081, 1, -0.5, 0.5, 0.5,
-3.695979, -2, -6.038081, 1, 1.5, 0.5, 0.5,
-3.695979, -2, -6.038081, 0, 1.5, 0.5, 0.5,
-3.695979, -1, -6.038081, 0, -0.5, 0.5, 0.5,
-3.695979, -1, -6.038081, 1, -0.5, 0.5, 0.5,
-3.695979, -1, -6.038081, 1, 1.5, 0.5, 0.5,
-3.695979, -1, -6.038081, 0, 1.5, 0.5, 0.5,
-3.695979, 0, -6.038081, 0, -0.5, 0.5, 0.5,
-3.695979, 0, -6.038081, 1, -0.5, 0.5, 0.5,
-3.695979, 0, -6.038081, 1, 1.5, 0.5, 0.5,
-3.695979, 0, -6.038081, 0, 1.5, 0.5, 0.5,
-3.695979, 1, -6.038081, 0, -0.5, 0.5, 0.5,
-3.695979, 1, -6.038081, 1, -0.5, 0.5, 0.5,
-3.695979, 1, -6.038081, 1, 1.5, 0.5, 0.5,
-3.695979, 1, -6.038081, 0, 1.5, 0.5, 0.5,
-3.695979, 2, -6.038081, 0, -0.5, 0.5, 0.5,
-3.695979, 2, -6.038081, 1, -0.5, 0.5, 0.5,
-3.695979, 2, -6.038081, 1, 1.5, 0.5, 0.5,
-3.695979, 2, -6.038081, 0, 1.5, 0.5, 0.5,
-3.695979, 3, -6.038081, 0, -0.5, 0.5, 0.5,
-3.695979, 3, -6.038081, 1, -0.5, 0.5, 0.5,
-3.695979, 3, -6.038081, 1, 1.5, 0.5, 0.5,
-3.695979, 3, -6.038081, 0, 1.5, 0.5, 0.5
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
-3.198659, -3.418589, -4,
-3.198659, -3.418589, 4,
-3.198659, -3.418589, -4,
-3.364432, -3.590065, -4,
-3.198659, -3.418589, -2,
-3.364432, -3.590065, -2,
-3.198659, -3.418589, 0,
-3.364432, -3.590065, 0,
-3.198659, -3.418589, 2,
-3.364432, -3.590065, 2,
-3.198659, -3.418589, 4,
-3.364432, -3.590065, 4
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
-3.695979, -3.933016, -4, 0, -0.5, 0.5, 0.5,
-3.695979, -3.933016, -4, 1, -0.5, 0.5, 0.5,
-3.695979, -3.933016, -4, 1, 1.5, 0.5, 0.5,
-3.695979, -3.933016, -4, 0, 1.5, 0.5, 0.5,
-3.695979, -3.933016, -2, 0, -0.5, 0.5, 0.5,
-3.695979, -3.933016, -2, 1, -0.5, 0.5, 0.5,
-3.695979, -3.933016, -2, 1, 1.5, 0.5, 0.5,
-3.695979, -3.933016, -2, 0, 1.5, 0.5, 0.5,
-3.695979, -3.933016, 0, 0, -0.5, 0.5, 0.5,
-3.695979, -3.933016, 0, 1, -0.5, 0.5, 0.5,
-3.695979, -3.933016, 0, 1, 1.5, 0.5, 0.5,
-3.695979, -3.933016, 0, 0, 1.5, 0.5, 0.5,
-3.695979, -3.933016, 2, 0, -0.5, 0.5, 0.5,
-3.695979, -3.933016, 2, 1, -0.5, 0.5, 0.5,
-3.695979, -3.933016, 2, 1, 1.5, 0.5, 0.5,
-3.695979, -3.933016, 2, 0, 1.5, 0.5, 0.5,
-3.695979, -3.933016, 4, 0, -0.5, 0.5, 0.5,
-3.695979, -3.933016, 4, 1, -0.5, 0.5, 0.5,
-3.695979, -3.933016, 4, 1, 1.5, 0.5, 0.5,
-3.695979, -3.933016, 4, 0, 1.5, 0.5, 0.5
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
-3.198659, -3.418589, -5.200628,
-3.198659, 3.440429, -5.200628,
-3.198659, -3.418589, 5.965404,
-3.198659, 3.440429, 5.965404,
-3.198659, -3.418589, -5.200628,
-3.198659, -3.418589, 5.965404,
-3.198659, 3.440429, -5.200628,
-3.198659, 3.440429, 5.965404,
-3.198659, -3.418589, -5.200628,
3.43228, -3.418589, -5.200628,
-3.198659, -3.418589, 5.965404,
3.43228, -3.418589, 5.965404,
-3.198659, 3.440429, -5.200628,
3.43228, 3.440429, -5.200628,
-3.198659, 3.440429, 5.965404,
3.43228, 3.440429, 5.965404,
3.43228, -3.418589, -5.200628,
3.43228, 3.440429, -5.200628,
3.43228, -3.418589, 5.965404,
3.43228, 3.440429, 5.965404,
3.43228, -3.418589, -5.200628,
3.43228, -3.418589, 5.965404,
3.43228, 3.440429, -5.200628,
3.43228, 3.440429, 5.965404
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
var radius = 7.842351;
var distance = 34.89151;
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
mvMatrix.translate( -0.1168107, -0.01092005, -0.3823876 );
mvMatrix.scale( 1.278749, 1.236227, 0.7593837 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.89151);
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
dicofol<-read.table("dicofol.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-dicofol$V2
```

```
## Error in eval(expr, envir, enclos): object 'dicofol' not found
```

```r
y<-dicofol$V3
```

```
## Error in eval(expr, envir, enclos): object 'dicofol' not found
```

```r
z<-dicofol$V4
```

```
## Error in eval(expr, envir, enclos): object 'dicofol' not found
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
-3.102092, 0.8729876, -1.349806, 0, 0, 1, 1, 1,
-3.019519, -0.4592378, -3.272005, 1, 0, 0, 1, 1,
-2.875883, 1.405447, -0.8230484, 1, 0, 0, 1, 1,
-2.844852, 1.394289, -2.16174, 1, 0, 0, 1, 1,
-2.793721, 0.9993632, -0.6524826, 1, 0, 0, 1, 1,
-2.789334, -0.07695696, -1.821328, 1, 0, 0, 1, 1,
-2.752069, 0.2525987, -1.421708, 0, 0, 0, 1, 1,
-2.712441, 0.1636048, -2.234932, 0, 0, 0, 1, 1,
-2.693871, 0.9665682, -0.9565488, 0, 0, 0, 1, 1,
-2.591844, 0.01830197, -2.510646, 0, 0, 0, 1, 1,
-2.532679, 1.078381, -0.433717, 0, 0, 0, 1, 1,
-2.530744, 1.750921, -0.3116624, 0, 0, 0, 1, 1,
-2.525517, -0.884447, -1.532987, 0, 0, 0, 1, 1,
-2.464563, -1.021431, -2.141091, 1, 1, 1, 1, 1,
-2.457145, 0.8868618, -1.78571, 1, 1, 1, 1, 1,
-2.421956, -1.441361, -0.4744071, 1, 1, 1, 1, 1,
-2.388142, 0.4687718, -1.261071, 1, 1, 1, 1, 1,
-2.38342, -0.6112368, -2.647991, 1, 1, 1, 1, 1,
-2.356523, 0.4514422, -0.7255065, 1, 1, 1, 1, 1,
-2.317815, 0.5613641, -2.180221, 1, 1, 1, 1, 1,
-2.31343, 0.6584655, -1.367791, 1, 1, 1, 1, 1,
-2.24437, -0.5055242, -0.4712829, 1, 1, 1, 1, 1,
-2.165319, -0.7005469, -3.141683, 1, 1, 1, 1, 1,
-2.123389, -0.9859292, -2.985927, 1, 1, 1, 1, 1,
-2.115299, -0.6472952, -1.834539, 1, 1, 1, 1, 1,
-2.113751, -1.169229, -2.945269, 1, 1, 1, 1, 1,
-2.03034, 1.101101, -1.779285, 1, 1, 1, 1, 1,
-2.005953, 0.469473, -1.767291, 1, 1, 1, 1, 1,
-2.004546, -2.312603, -2.377711, 0, 0, 1, 1, 1,
-1.989386, 0.5824377, -0.3396908, 1, 0, 0, 1, 1,
-1.989281, 0.6806057, -1.311887, 1, 0, 0, 1, 1,
-1.977456, 0.8073437, -0.6990194, 1, 0, 0, 1, 1,
-1.952251, 0.8538026, -1.666844, 1, 0, 0, 1, 1,
-1.935233, -0.2534918, -0.7861341, 1, 0, 0, 1, 1,
-1.897326, 0.04853937, -1.784099, 0, 0, 0, 1, 1,
-1.888571, 1.552, 0.6297563, 0, 0, 0, 1, 1,
-1.874258, 1.370903, -0.1908634, 0, 0, 0, 1, 1,
-1.873348, 0.9286188, -2.460391, 0, 0, 0, 1, 1,
-1.869136, 0.5405879, -0.9706224, 0, 0, 0, 1, 1,
-1.839603, -0.9486503, -2.658064, 0, 0, 0, 1, 1,
-1.836636, -0.01322046, -1.690515, 0, 0, 0, 1, 1,
-1.835007, -1.319686, -1.188018, 1, 1, 1, 1, 1,
-1.80763, 0.3735424, -1.264955, 1, 1, 1, 1, 1,
-1.781112, -0.826285, -2.081484, 1, 1, 1, 1, 1,
-1.753893, -0.4351493, -2.452339, 1, 1, 1, 1, 1,
-1.747724, -0.7078843, -0.4054468, 1, 1, 1, 1, 1,
-1.69324, -0.1235067, -1.481068, 1, 1, 1, 1, 1,
-1.682496, -0.1258107, -0.7617761, 1, 1, 1, 1, 1,
-1.679801, -0.8794389, -2.04033, 1, 1, 1, 1, 1,
-1.676401, -1.63, -2.303576, 1, 1, 1, 1, 1,
-1.662045, 0.4669757, -1.590227, 1, 1, 1, 1, 1,
-1.660564, -1.802915, -3.134828, 1, 1, 1, 1, 1,
-1.657173, -1.000556, -1.649339, 1, 1, 1, 1, 1,
-1.65526, 0.5127468, 0.6173455, 1, 1, 1, 1, 1,
-1.653841, -0.7600003, -3.211084, 1, 1, 1, 1, 1,
-1.642693, 1.058265, -1.246769, 1, 1, 1, 1, 1,
-1.624423, -0.5745934, -2.623155, 0, 0, 1, 1, 1,
-1.623165, -0.322087, -2.08123, 1, 0, 0, 1, 1,
-1.619248, 2.117647, -0.4571864, 1, 0, 0, 1, 1,
-1.612171, 0.292223, -2.904388, 1, 0, 0, 1, 1,
-1.611117, 1.460845, 0.2362979, 1, 0, 0, 1, 1,
-1.611117, -0.9046795, -0.5986527, 1, 0, 0, 1, 1,
-1.610446, -0.9400513, -2.082005, 0, 0, 0, 1, 1,
-1.609973, -0.0996056, -1.159182, 0, 0, 0, 1, 1,
-1.600414, 0.07102175, -1.738689, 0, 0, 0, 1, 1,
-1.586418, 1.243384, -0.7739896, 0, 0, 0, 1, 1,
-1.570591, -1.018829, -1.109999, 0, 0, 0, 1, 1,
-1.564402, 0.6955453, -2.32538, 0, 0, 0, 1, 1,
-1.54565, 0.994734, -1.775245, 0, 0, 0, 1, 1,
-1.536164, -0.7807387, -1.544642, 1, 1, 1, 1, 1,
-1.523257, -0.1281119, -1.598004, 1, 1, 1, 1, 1,
-1.517021, 1.273976, 0.9990754, 1, 1, 1, 1, 1,
-1.512522, 1.385045, -0.3996536, 1, 1, 1, 1, 1,
-1.507837, 0.7183576, -0.6615766, 1, 1, 1, 1, 1,
-1.497441, -1.013468, -2.249442, 1, 1, 1, 1, 1,
-1.467915, -0.6767366, -0.5368017, 1, 1, 1, 1, 1,
-1.465684, -0.9480691, -2.49016, 1, 1, 1, 1, 1,
-1.464261, -1.474663, -0.5145226, 1, 1, 1, 1, 1,
-1.458732, 0.6325739, -1.985736, 1, 1, 1, 1, 1,
-1.458357, 0.6289907, -0.2852327, 1, 1, 1, 1, 1,
-1.446215, 1.893669, -0.3576004, 1, 1, 1, 1, 1,
-1.444963, -0.9619383, -1.972759, 1, 1, 1, 1, 1,
-1.439726, 0.02717226, -1.734589, 1, 1, 1, 1, 1,
-1.436708, 0.3368563, -2.893413, 1, 1, 1, 1, 1,
-1.434649, 0.3955372, -1.622104, 0, 0, 1, 1, 1,
-1.433528, 0.4820719, -0.9975199, 1, 0, 0, 1, 1,
-1.433109, 2.170352, -2.398591, 1, 0, 0, 1, 1,
-1.430933, -0.3629779, -3.844493, 1, 0, 0, 1, 1,
-1.419796, 1.56207, -0.6313549, 1, 0, 0, 1, 1,
-1.417652, 2.225433, -0.3063687, 1, 0, 0, 1, 1,
-1.406308, -3.052803, -1.646438, 0, 0, 0, 1, 1,
-1.405312, 1.866404, -0.1652917, 0, 0, 0, 1, 1,
-1.404927, 0.08314549, -2.413282, 0, 0, 0, 1, 1,
-1.395442, 1.458818, -1.187716, 0, 0, 0, 1, 1,
-1.381825, 1.05742, 0.05079724, 0, 0, 0, 1, 1,
-1.381081, -1.140315, -1.197783, 0, 0, 0, 1, 1,
-1.378378, -0.8197883, -1.806243, 0, 0, 0, 1, 1,
-1.378355, -0.3888768, -1.737207, 1, 1, 1, 1, 1,
-1.374742, 0.6122202, -1.3815, 1, 1, 1, 1, 1,
-1.342642, -0.3100283, -2.009212, 1, 1, 1, 1, 1,
-1.342582, 0.7932701, -1.306135, 1, 1, 1, 1, 1,
-1.331776, 0.7947831, -1.333497, 1, 1, 1, 1, 1,
-1.32621, -1.125601, -1.5082, 1, 1, 1, 1, 1,
-1.324488, -0.7772524, -3.348664, 1, 1, 1, 1, 1,
-1.322926, 1.552896, -0.4269761, 1, 1, 1, 1, 1,
-1.319011, 0.1789991, -1.537244, 1, 1, 1, 1, 1,
-1.304951, -0.1489172, -0.854853, 1, 1, 1, 1, 1,
-1.304803, 0.4596184, -0.8898552, 1, 1, 1, 1, 1,
-1.301562, -0.3879951, -2.115318, 1, 1, 1, 1, 1,
-1.301339, 0.8228173, -3.8676, 1, 1, 1, 1, 1,
-1.298078, 0.8629078, 0.2676335, 1, 1, 1, 1, 1,
-1.290817, -0.5568944, -1.014762, 1, 1, 1, 1, 1,
-1.28899, 0.8540726, -1.564267, 0, 0, 1, 1, 1,
-1.285888, 0.9218141, -0.6944513, 1, 0, 0, 1, 1,
-1.281545, -0.7429793, -3.015937, 1, 0, 0, 1, 1,
-1.274811, -0.5195967, 0.08109037, 1, 0, 0, 1, 1,
-1.268207, -0.5002798, -2.601125, 1, 0, 0, 1, 1,
-1.260649, -0.5985553, -3.17092, 1, 0, 0, 1, 1,
-1.254479, -0.284552, -2.047584, 0, 0, 0, 1, 1,
-1.252588, 2.386013, 0.5050806, 0, 0, 0, 1, 1,
-1.243591, -0.07728815, -0.3870485, 0, 0, 0, 1, 1,
-1.240374, -1.308635, -2.144501, 0, 0, 0, 1, 1,
-1.238636, 0.5965172, -0.4678404, 0, 0, 0, 1, 1,
-1.235991, -0.3986183, -1.900729, 0, 0, 0, 1, 1,
-1.235459, 1.834772, 0.5356835, 0, 0, 0, 1, 1,
-1.233775, 0.9072008, -0.8737206, 1, 1, 1, 1, 1,
-1.229159, 0.948844, -2.425365, 1, 1, 1, 1, 1,
-1.226548, -0.3760637, -1.223646, 1, 1, 1, 1, 1,
-1.224055, 0.9909196, -3.109455, 1, 1, 1, 1, 1,
-1.222819, 0.1156114, -2.028494, 1, 1, 1, 1, 1,
-1.220788, -0.5587564, -2.997903, 1, 1, 1, 1, 1,
-1.219543, -0.5289844, -2.732695, 1, 1, 1, 1, 1,
-1.219052, 0.4476858, -2.095749, 1, 1, 1, 1, 1,
-1.216207, -1.226682, -2.27374, 1, 1, 1, 1, 1,
-1.213149, -0.4539345, -1.911758, 1, 1, 1, 1, 1,
-1.211064, 1.024249, -2.325434, 1, 1, 1, 1, 1,
-1.202096, -1.816012, -1.679886, 1, 1, 1, 1, 1,
-1.193241, 0.06274184, -1.417323, 1, 1, 1, 1, 1,
-1.1917, -0.5972081, -0.8909057, 1, 1, 1, 1, 1,
-1.189695, 0.3873725, -2.201033, 1, 1, 1, 1, 1,
-1.18694, -0.1517103, -1.830485, 0, 0, 1, 1, 1,
-1.185867, -0.8479264, -2.318376, 1, 0, 0, 1, 1,
-1.183127, 0.7269054, 1.033124, 1, 0, 0, 1, 1,
-1.174582, -1.992607, -3.639906, 1, 0, 0, 1, 1,
-1.174005, -1.439649, -2.943527, 1, 0, 0, 1, 1,
-1.172052, -1.064819, -3.088177, 1, 0, 0, 1, 1,
-1.170712, -1.526619, -2.04155, 0, 0, 0, 1, 1,
-1.165418, 0.8156492, -0.3290563, 0, 0, 0, 1, 1,
-1.164373, -0.7192678, -2.20666, 0, 0, 0, 1, 1,
-1.163943, -0.8776532, -2.42862, 0, 0, 0, 1, 1,
-1.15953, -0.4689086, -0.6644529, 0, 0, 0, 1, 1,
-1.158698, -0.1221556, -2.261833, 0, 0, 0, 1, 1,
-1.15535, -0.4960645, -0.4706964, 0, 0, 0, 1, 1,
-1.149212, -0.7812097, -4.991086, 1, 1, 1, 1, 1,
-1.148333, 2.312838, -0.9700145, 1, 1, 1, 1, 1,
-1.142393, 0.1499844, -2.462812, 1, 1, 1, 1, 1,
-1.13975, 0.6641075, -1.821778, 1, 1, 1, 1, 1,
-1.133437, -1.192265, -2.367826, 1, 1, 1, 1, 1,
-1.132579, -0.3511026, -1.822912, 1, 1, 1, 1, 1,
-1.128073, 1.331469, -0.1507266, 1, 1, 1, 1, 1,
-1.127818, -0.2983977, -2.740464, 1, 1, 1, 1, 1,
-1.107493, -1.841114, -3.599289, 1, 1, 1, 1, 1,
-1.087144, 1.133871, -2.429464, 1, 1, 1, 1, 1,
-1.086868, -2.502463, -2.557932, 1, 1, 1, 1, 1,
-1.084303, -1.426565, -1.653911, 1, 1, 1, 1, 1,
-1.076679, 0.03428453, -1.539512, 1, 1, 1, 1, 1,
-1.074186, -0.02103265, -0.584013, 1, 1, 1, 1, 1,
-1.073589, -0.9740062, -3.779409, 1, 1, 1, 1, 1,
-1.07144, 0.4964621, -0.7756491, 0, 0, 1, 1, 1,
-1.070926, 0.9814867, -0.2528978, 1, 0, 0, 1, 1,
-1.068357, -0.7526546, -2.382251, 1, 0, 0, 1, 1,
-1.067891, -0.1020428, -1.15285, 1, 0, 0, 1, 1,
-1.067065, 3.340541, 0.2076846, 1, 0, 0, 1, 1,
-1.063375, -1.425959, -1.164158, 1, 0, 0, 1, 1,
-1.055296, 0.5298789, -0.5453075, 0, 0, 0, 1, 1,
-1.052638, -1.824545, -1.278128, 0, 0, 0, 1, 1,
-1.051093, 1.604923, -0.8073349, 0, 0, 0, 1, 1,
-1.049811, 0.1662544, -1.213526, 0, 0, 0, 1, 1,
-1.048643, -0.8162043, -1.626212, 0, 0, 0, 1, 1,
-1.046575, -1.61205, -2.354722, 0, 0, 0, 1, 1,
-1.037182, -1.362175, -0.8783824, 0, 0, 0, 1, 1,
-1.035858, -0.6332801, -2.681633, 1, 1, 1, 1, 1,
-1.034172, 0.04365083, -2.215453, 1, 1, 1, 1, 1,
-1.033633, -1.321163, -2.175363, 1, 1, 1, 1, 1,
-1.033039, 0.850341, -3.980135, 1, 1, 1, 1, 1,
-1.031222, -1.241388, -3.121131, 1, 1, 1, 1, 1,
-1.023109, 0.4325222, -1.41061, 1, 1, 1, 1, 1,
-1.022009, 1.486488, 1.406567, 1, 1, 1, 1, 1,
-1.01922, -0.09063733, -1.419147, 1, 1, 1, 1, 1,
-1.01843, 1.543267, -1.661838, 1, 1, 1, 1, 1,
-1.012226, -0.1292878, -0.9641384, 1, 1, 1, 1, 1,
-0.9977669, 2.39624, -0.4580101, 1, 1, 1, 1, 1,
-0.9959744, 0.5920939, -0.5279663, 1, 1, 1, 1, 1,
-0.9939781, 0.6299755, -1.173709, 1, 1, 1, 1, 1,
-0.9825738, -0.4225735, -3.283058, 1, 1, 1, 1, 1,
-0.9746768, 0.5639792, -1.181226, 1, 1, 1, 1, 1,
-0.9697234, 1.005915, 0.2862692, 0, 0, 1, 1, 1,
-0.9670376, -0.7179455, -2.85454, 1, 0, 0, 1, 1,
-0.955651, -0.4702004, -2.27789, 1, 0, 0, 1, 1,
-0.9507677, -0.3576847, -1.366644, 1, 0, 0, 1, 1,
-0.9506928, 1.395875, -0.129031, 1, 0, 0, 1, 1,
-0.9501897, -1.031881, -3.026444, 1, 0, 0, 1, 1,
-0.9472995, 0.4550261, -2.050208, 0, 0, 0, 1, 1,
-0.937647, 1.816399, -2.703817, 0, 0, 0, 1, 1,
-0.9312735, -0.6667659, -1.283191, 0, 0, 0, 1, 1,
-0.9274547, 0.9868443, -1.492339, 0, 0, 0, 1, 1,
-0.9231553, 1.506251, -1.849368, 0, 0, 0, 1, 1,
-0.9181643, 2.060966, -1.129753, 0, 0, 0, 1, 1,
-0.9114291, 0.3601226, -0.8636943, 0, 0, 0, 1, 1,
-0.9041345, 1.163438, 0.2830423, 1, 1, 1, 1, 1,
-0.9014853, 1.780191, -0.8695155, 1, 1, 1, 1, 1,
-0.9013274, -1.91461, -4.860889, 1, 1, 1, 1, 1,
-0.8943278, 0.9889925, -0.8959336, 1, 1, 1, 1, 1,
-0.8910137, 2.26182, -0.6347702, 1, 1, 1, 1, 1,
-0.8908367, 0.5838483, -1.755569, 1, 1, 1, 1, 1,
-0.8869242, -0.3186073, -1.949566, 1, 1, 1, 1, 1,
-0.8840637, -1.354331, -2.216049, 1, 1, 1, 1, 1,
-0.881164, 1.003767, 0.8729352, 1, 1, 1, 1, 1,
-0.8678586, 0.1980404, -1.334556, 1, 1, 1, 1, 1,
-0.8536356, -0.3596737, -2.877615, 1, 1, 1, 1, 1,
-0.8504073, 3.018747, 2.566698, 1, 1, 1, 1, 1,
-0.8441194, -0.6129678, -1.988357, 1, 1, 1, 1, 1,
-0.8430383, 1.240226, 0.248312, 1, 1, 1, 1, 1,
-0.842773, 0.5037574, -1.398971, 1, 1, 1, 1, 1,
-0.8427101, -0.7733629, -1.906868, 0, 0, 1, 1, 1,
-0.841442, -0.4050134, -0.8911858, 1, 0, 0, 1, 1,
-0.8380423, 0.4188115, -2.969472, 1, 0, 0, 1, 1,
-0.8338754, -1.15415, -1.927104, 1, 0, 0, 1, 1,
-0.8297831, 0.6139447, -0.8291008, 1, 0, 0, 1, 1,
-0.8269421, 1.370302, -1.462571, 1, 0, 0, 1, 1,
-0.8214028, 0.08161594, -2.040163, 0, 0, 0, 1, 1,
-0.8175804, 2.136336, -2.29765, 0, 0, 0, 1, 1,
-0.8164331, 0.29908, -2.668912, 0, 0, 0, 1, 1,
-0.8033264, -0.004367291, 0.7276478, 0, 0, 0, 1, 1,
-0.8014349, -0.04216367, -1.042607, 0, 0, 0, 1, 1,
-0.7869836, 0.5429261, -2.75924, 0, 0, 0, 1, 1,
-0.7868059, -0.2537249, -1.445075, 0, 0, 0, 1, 1,
-0.7849452, -0.5989248, -2.102273, 1, 1, 1, 1, 1,
-0.7807754, -0.9925367, -2.361724, 1, 1, 1, 1, 1,
-0.7803708, 1.29973, -0.6681474, 1, 1, 1, 1, 1,
-0.778571, 1.032278, -1.035353, 1, 1, 1, 1, 1,
-0.7758972, -1.112086, -2.66135, 1, 1, 1, 1, 1,
-0.7741227, 0.05920845, -2.372024, 1, 1, 1, 1, 1,
-0.7734227, 1.349764, 0.06260438, 1, 1, 1, 1, 1,
-0.768629, 0.6455839, -1.639981, 1, 1, 1, 1, 1,
-0.7656907, -1.094613, -3.535745, 1, 1, 1, 1, 1,
-0.7608643, -1.270787, -1.948188, 1, 1, 1, 1, 1,
-0.7542271, 1.15465, -0.1111463, 1, 1, 1, 1, 1,
-0.7535611, -0.09510749, -1.415811, 1, 1, 1, 1, 1,
-0.7531814, -0.001866071, -1.138647, 1, 1, 1, 1, 1,
-0.7472447, -0.4369614, -1.579213, 1, 1, 1, 1, 1,
-0.7451872, -0.7586138, -1.936952, 1, 1, 1, 1, 1,
-0.7448465, -0.7194448, -3.602897, 0, 0, 1, 1, 1,
-0.7421259, -0.5434121, -3.772392, 1, 0, 0, 1, 1,
-0.7413298, 1.027815, -1.910828, 1, 0, 0, 1, 1,
-0.7402423, 2.836757, -0.4238999, 1, 0, 0, 1, 1,
-0.7399905, -0.6376483, -1.248292, 1, 0, 0, 1, 1,
-0.7346138, -0.6752154, -1.447854, 1, 0, 0, 1, 1,
-0.7320238, -1.088352, -2.613, 0, 0, 0, 1, 1,
-0.7304584, -0.2868732, -1.785674, 0, 0, 0, 1, 1,
-0.7296814, -0.5404744, -2.249493, 0, 0, 0, 1, 1,
-0.7238744, -0.2749716, -2.850174, 0, 0, 0, 1, 1,
-0.7228552, 0.5677696, -0.6855376, 0, 0, 0, 1, 1,
-0.7215979, -1.168574, -3.944009, 0, 0, 0, 1, 1,
-0.7190955, -1.840764, -2.012938, 0, 0, 0, 1, 1,
-0.717469, -0.1468467, -0.7717648, 1, 1, 1, 1, 1,
-0.694022, -0.6102629, -2.371286, 1, 1, 1, 1, 1,
-0.6934492, 0.6563316, -1.530268, 1, 1, 1, 1, 1,
-0.6911595, 0.943757, -1.127463, 1, 1, 1, 1, 1,
-0.6885964, -0.4758103, -1.640192, 1, 1, 1, 1, 1,
-0.6843621, 1.202809, -0.4412728, 1, 1, 1, 1, 1,
-0.6807976, -0.0690091, -2.233994, 1, 1, 1, 1, 1,
-0.6782557, 0.1013102, -0.5561532, 1, 1, 1, 1, 1,
-0.6767373, 0.8360258, -0.5484352, 1, 1, 1, 1, 1,
-0.6698528, 0.08182656, -2.527454, 1, 1, 1, 1, 1,
-0.6562704, -0.2451952, -1.414751, 1, 1, 1, 1, 1,
-0.6538821, 0.8290387, -0.6607823, 1, 1, 1, 1, 1,
-0.6526471, 0.1984007, -1.401616, 1, 1, 1, 1, 1,
-0.6514558, 1.317582, -1.803258, 1, 1, 1, 1, 1,
-0.6511079, 0.6324738, -0.3029082, 1, 1, 1, 1, 1,
-0.6478477, 1.324446, -1.376582, 0, 0, 1, 1, 1,
-0.6475952, -1.066861, -4.273354, 1, 0, 0, 1, 1,
-0.6461368, 0.3475738, -1.804312, 1, 0, 0, 1, 1,
-0.6455238, 1.273497, 0.3155206, 1, 0, 0, 1, 1,
-0.6402557, 0.9489887, 0.2672185, 1, 0, 0, 1, 1,
-0.6401451, -1.172259, -2.125876, 1, 0, 0, 1, 1,
-0.6394764, 1.184657, 0.1653777, 0, 0, 0, 1, 1,
-0.6345257, -0.4238293, -1.720091, 0, 0, 0, 1, 1,
-0.6327138, -0.5602083, -0.5110663, 0, 0, 0, 1, 1,
-0.6244141, -0.1972623, -1.768778, 0, 0, 0, 1, 1,
-0.623064, -0.08118901, -2.822838, 0, 0, 0, 1, 1,
-0.6178776, 1.146655, -0.6548706, 0, 0, 0, 1, 1,
-0.6134852, -1.501481, -2.661754, 0, 0, 0, 1, 1,
-0.6118445, -0.3378857, -0.9411671, 1, 1, 1, 1, 1,
-0.6090973, 2.486614, 1.11857, 1, 1, 1, 1, 1,
-0.6039841, -1.106619, -2.470239, 1, 1, 1, 1, 1,
-0.6039252, -0.1468821, -1.589629, 1, 1, 1, 1, 1,
-0.6038338, 0.710513, -0.05088052, 1, 1, 1, 1, 1,
-0.6032538, -0.08763428, -1.340735, 1, 1, 1, 1, 1,
-0.601461, -0.5884686, -3.130432, 1, 1, 1, 1, 1,
-0.5982242, 2.036885, -0.4563983, 1, 1, 1, 1, 1,
-0.5936436, 0.01780842, -2.178646, 1, 1, 1, 1, 1,
-0.5933278, 0.8928399, -1.160225, 1, 1, 1, 1, 1,
-0.5933164, -0.1202152, -3.242816, 1, 1, 1, 1, 1,
-0.5911573, 0.520073, -1.234606, 1, 1, 1, 1, 1,
-0.5875331, 0.1366976, -1.013031, 1, 1, 1, 1, 1,
-0.5867854, -0.5945862, -2.031782, 1, 1, 1, 1, 1,
-0.5835629, -1.086884, -3.444478, 1, 1, 1, 1, 1,
-0.5831693, 0.840423, -1.227064, 0, 0, 1, 1, 1,
-0.58248, 0.5453312, -2.572896, 1, 0, 0, 1, 1,
-0.5810784, -1.122564, -1.662436, 1, 0, 0, 1, 1,
-0.5794901, -1.095156, -2.299683, 1, 0, 0, 1, 1,
-0.5790056, -0.4218456, -0.5391404, 1, 0, 0, 1, 1,
-0.5772361, 0.130392, -2.664179, 1, 0, 0, 1, 1,
-0.5761567, -1.398993, -2.610287, 0, 0, 0, 1, 1,
-0.5761021, 0.892188, 0.8402826, 0, 0, 0, 1, 1,
-0.5718433, 1.905581, 0.3393996, 0, 0, 0, 1, 1,
-0.5706795, 0.2805184, 0.3048497, 0, 0, 0, 1, 1,
-0.5700478, 0.6321313, -0.8833628, 0, 0, 0, 1, 1,
-0.567589, -0.3563679, -0.912114, 0, 0, 0, 1, 1,
-0.5661855, -1.23327, -1.523338, 0, 0, 0, 1, 1,
-0.560542, 0.1479407, -1.371804, 1, 1, 1, 1, 1,
-0.5441685, -0.07147948, -0.7405304, 1, 1, 1, 1, 1,
-0.5409073, -1.62613, -2.667368, 1, 1, 1, 1, 1,
-0.5375309, 0.6673225, -0.1717975, 1, 1, 1, 1, 1,
-0.5365389, 1.13789, -2.033988, 1, 1, 1, 1, 1,
-0.5355352, 0.4186558, -2.703168, 1, 1, 1, 1, 1,
-0.5281626, -1.15626, -1.268127, 1, 1, 1, 1, 1,
-0.5267627, 1.110306, 0.3958299, 1, 1, 1, 1, 1,
-0.5175033, 0.1067048, -3.213643, 1, 1, 1, 1, 1,
-0.5133194, 0.472376, -1.827233, 1, 1, 1, 1, 1,
-0.5121021, -0.8522643, -3.217152, 1, 1, 1, 1, 1,
-0.5116343, 1.247436, -0.2392217, 1, 1, 1, 1, 1,
-0.50432, -1.110551, -3.075758, 1, 1, 1, 1, 1,
-0.5003618, -1.111526, -1.586122, 1, 1, 1, 1, 1,
-0.4908895, -1.104087, -2.08108, 1, 1, 1, 1, 1,
-0.4884767, 0.385864, 0.2206521, 0, 0, 1, 1, 1,
-0.4858408, 1.93191, -0.8353353, 1, 0, 0, 1, 1,
-0.4850986, 0.6740929, -0.09822167, 1, 0, 0, 1, 1,
-0.482981, 0.3290681, 0.218753, 1, 0, 0, 1, 1,
-0.4820288, 3.331467, -1.114065, 1, 0, 0, 1, 1,
-0.4812339, -0.723617, -2.913383, 1, 0, 0, 1, 1,
-0.480022, 0.9108412, -1.032509, 0, 0, 0, 1, 1,
-0.4765765, 1.16669, -1.528947, 0, 0, 0, 1, 1,
-0.4713951, -1.493625, -0.389132, 0, 0, 0, 1, 1,
-0.4699684, -0.3762096, -4.703856, 0, 0, 0, 1, 1,
-0.4699043, 0.224025, -2.578687, 0, 0, 0, 1, 1,
-0.4646622, 0.7904125, 0.4398343, 0, 0, 0, 1, 1,
-0.4606937, 0.4327124, 1.189895, 0, 0, 0, 1, 1,
-0.4603604, -1.147031, -2.701506, 1, 1, 1, 1, 1,
-0.4583853, 0.381352, -2.337541, 1, 1, 1, 1, 1,
-0.4575606, 1.102665, -1.093184, 1, 1, 1, 1, 1,
-0.4574636, 0.3046964, -0.5449403, 1, 1, 1, 1, 1,
-0.4553342, -0.09725887, -3.564017, 1, 1, 1, 1, 1,
-0.4526702, -0.5552477, -1.402521, 1, 1, 1, 1, 1,
-0.4513119, -0.2380207, -3.131207, 1, 1, 1, 1, 1,
-0.4505141, 0.5806707, -2.521678, 1, 1, 1, 1, 1,
-0.4480332, 0.05536174, 0.5947371, 1, 1, 1, 1, 1,
-0.4466239, 0.1385318, -1.896277, 1, 1, 1, 1, 1,
-0.4458922, -0.03456748, -2.76148, 1, 1, 1, 1, 1,
-0.4445974, -0.3572678, -1.595245, 1, 1, 1, 1, 1,
-0.4396296, -0.6921782, -3.944288, 1, 1, 1, 1, 1,
-0.4378572, -1.202248, -3.562052, 1, 1, 1, 1, 1,
-0.4357424, -1.235066, -2.285937, 1, 1, 1, 1, 1,
-0.4357319, -0.7228669, -2.976959, 0, 0, 1, 1, 1,
-0.4353202, -0.05563832, -2.379246, 1, 0, 0, 1, 1,
-0.4271504, -0.0400302, -1.466038, 1, 0, 0, 1, 1,
-0.4265866, -1.586192, -2.959863, 1, 0, 0, 1, 1,
-0.4264667, 0.5718079, -2.691714, 1, 0, 0, 1, 1,
-0.425255, -0.4182893, -2.738051, 1, 0, 0, 1, 1,
-0.4248412, -0.4901511, -2.123142, 0, 0, 0, 1, 1,
-0.4245828, -0.5313579, -2.3397, 0, 0, 0, 1, 1,
-0.4237299, 0.8474756, 0.335694, 0, 0, 0, 1, 1,
-0.4228323, -1.091455, -1.723407, 0, 0, 0, 1, 1,
-0.4194642, -0.1296805, -2.94467, 0, 0, 0, 1, 1,
-0.4185181, -0.4851401, -2.446522, 0, 0, 0, 1, 1,
-0.4172051, -0.5005777, -1.69477, 0, 0, 0, 1, 1,
-0.4121985, -1.231854, -2.316333, 1, 1, 1, 1, 1,
-0.4058579, 1.09672, -0.6723576, 1, 1, 1, 1, 1,
-0.4033842, -0.915222, -0.9616894, 1, 1, 1, 1, 1,
-0.4002338, 0.3621646, -0.4808935, 1, 1, 1, 1, 1,
-0.396551, 0.4527464, 1.224095, 1, 1, 1, 1, 1,
-0.3960254, 1.227894, -0.08741821, 1, 1, 1, 1, 1,
-0.3947364, 0.6148243, -2.559207, 1, 1, 1, 1, 1,
-0.3940679, -0.08638537, -2.325913, 1, 1, 1, 1, 1,
-0.3940346, 0.06804672, -0.8948801, 1, 1, 1, 1, 1,
-0.3938718, -0.3496723, -3.088569, 1, 1, 1, 1, 1,
-0.3838741, -1.440674, -4.416271, 1, 1, 1, 1, 1,
-0.3837496, -0.07505772, -0.5362735, 1, 1, 1, 1, 1,
-0.3793724, 0.8702374, 0.1597286, 1, 1, 1, 1, 1,
-0.3778205, -0.0777765, -0.3090609, 1, 1, 1, 1, 1,
-0.3696832, -0.2619642, -1.86366, 1, 1, 1, 1, 1,
-0.3679259, 0.2280408, -1.779642, 0, 0, 1, 1, 1,
-0.3677867, 0.3722762, -2.045919, 1, 0, 0, 1, 1,
-0.3660487, 1.150815, -0.3230095, 1, 0, 0, 1, 1,
-0.3621187, 0.6063186, -1.05603, 1, 0, 0, 1, 1,
-0.3603708, -0.3044118, -0.4650186, 1, 0, 0, 1, 1,
-0.3519838, 1.877259, 0.2412982, 1, 0, 0, 1, 1,
-0.3506893, 1.545575, -0.6065403, 0, 0, 0, 1, 1,
-0.3477758, 1.010485, -1.387944, 0, 0, 0, 1, 1,
-0.3475202, 0.9908493, -0.5624602, 0, 0, 0, 1, 1,
-0.346259, 0.07452393, 0.6335419, 0, 0, 0, 1, 1,
-0.3447863, -1.031603, -2.460594, 0, 0, 0, 1, 1,
-0.3443013, -0.3061341, 0.9283538, 0, 0, 0, 1, 1,
-0.3441845, -1.232796, -3.865605, 0, 0, 0, 1, 1,
-0.3419701, 0.3454887, -0.3309018, 1, 1, 1, 1, 1,
-0.3388211, 0.3669449, -0.9033697, 1, 1, 1, 1, 1,
-0.3384098, 0.9993225, -0.5198695, 1, 1, 1, 1, 1,
-0.3368843, 0.8525134, 0.4837233, 1, 1, 1, 1, 1,
-0.334475, 0.4441589, -1.336054, 1, 1, 1, 1, 1,
-0.3329766, -0.1753324, -2.13039, 1, 1, 1, 1, 1,
-0.332653, -0.653669, -1.004235, 1, 1, 1, 1, 1,
-0.3312915, -0.02510604, -1.614789, 1, 1, 1, 1, 1,
-0.3289579, -0.4112983, -2.562959, 1, 1, 1, 1, 1,
-0.3284487, -1.926285, -3.658554, 1, 1, 1, 1, 1,
-0.3227801, -0.5158685, -2.315772, 1, 1, 1, 1, 1,
-0.3222748, 0.739522, 0.9352204, 1, 1, 1, 1, 1,
-0.3200029, 1.391306, 1.015769, 1, 1, 1, 1, 1,
-0.3084221, -0.4912552, -3.045501, 1, 1, 1, 1, 1,
-0.3066637, -0.5919436, -2.51519, 1, 1, 1, 1, 1,
-0.302438, 1.667929, -0.5373083, 0, 0, 1, 1, 1,
-0.302146, 0.6396645, -0.4989952, 1, 0, 0, 1, 1,
-0.3008212, -0.3644551, -2.628128, 1, 0, 0, 1, 1,
-0.2960165, -0.3785865, -0.8884225, 1, 0, 0, 1, 1,
-0.2906458, -1.641041, -0.9791334, 1, 0, 0, 1, 1,
-0.2849596, 0.5606918, 0.1495717, 1, 0, 0, 1, 1,
-0.2804098, -0.7265111, -2.723817, 0, 0, 0, 1, 1,
-0.2723296, -1.562921, -4.506616, 0, 0, 0, 1, 1,
-0.2679608, -0.8615681, -4.327715, 0, 0, 0, 1, 1,
-0.2678998, 0.5613965, -0.1412271, 0, 0, 0, 1, 1,
-0.2673049, -0.3071008, -1.160879, 0, 0, 0, 1, 1,
-0.2616822, -0.04322813, -1.658578, 0, 0, 0, 1, 1,
-0.2606812, -0.5824358, -3.242486, 0, 0, 0, 1, 1,
-0.2589048, 0.2805006, 0.2676402, 1, 1, 1, 1, 1,
-0.2581848, 0.9208225, 0.7973133, 1, 1, 1, 1, 1,
-0.2517444, 1.155483, 0.4346691, 1, 1, 1, 1, 1,
-0.2466473, -0.4184516, -1.560681, 1, 1, 1, 1, 1,
-0.2426199, 0.5810189, -0.1672699, 1, 1, 1, 1, 1,
-0.2402992, -0.2516087, -1.454614, 1, 1, 1, 1, 1,
-0.2400688, 1.320089, -0.07702392, 1, 1, 1, 1, 1,
-0.2374153, -0.426086, -2.370456, 1, 1, 1, 1, 1,
-0.2333199, -0.5962461, -3.333465, 1, 1, 1, 1, 1,
-0.2332445, 0.2350044, -2.381149, 1, 1, 1, 1, 1,
-0.2319368, 1.213139, 0.8089437, 1, 1, 1, 1, 1,
-0.2284781, 1.100518, -0.004721095, 1, 1, 1, 1, 1,
-0.2257764, -0.5721739, -2.994074, 1, 1, 1, 1, 1,
-0.2215115, -0.6090955, -2.169372, 1, 1, 1, 1, 1,
-0.2203857, 1.993479, 1.52096, 1, 1, 1, 1, 1,
-0.2136501, 0.6487907, 0.4071911, 0, 0, 1, 1, 1,
-0.2130383, 1.493081, -0.6131939, 1, 0, 0, 1, 1,
-0.211278, 0.8738319, 0.637557, 1, 0, 0, 1, 1,
-0.2077032, 0.203104, -0.8865146, 1, 0, 0, 1, 1,
-0.206776, 0.4596229, -1.850873, 1, 0, 0, 1, 1,
-0.2049042, 0.4053439, -0.2564346, 1, 0, 0, 1, 1,
-0.2005151, 1.043748, 1.651945, 0, 0, 0, 1, 1,
-0.1982184, 0.4462019, 0.1581737, 0, 0, 0, 1, 1,
-0.1926898, 0.02247808, -2.33665, 0, 0, 0, 1, 1,
-0.1923967, 1.739621, -0.276926, 0, 0, 0, 1, 1,
-0.1898735, 1.34851, -0.4577955, 0, 0, 0, 1, 1,
-0.1896972, -1.171335, -3.757478, 0, 0, 0, 1, 1,
-0.1895508, 0.5066603, 0.1147105, 0, 0, 0, 1, 1,
-0.1857845, -0.622273, -4.646636, 1, 1, 1, 1, 1,
-0.1821459, -1.370415, -2.866255, 1, 1, 1, 1, 1,
-0.1816702, -0.1776478, -2.11637, 1, 1, 1, 1, 1,
-0.1787915, 1.311442, -0.7305871, 1, 1, 1, 1, 1,
-0.1711963, 2.318866, 0.7966948, 1, 1, 1, 1, 1,
-0.1649735, 0.1272692, -0.9763637, 1, 1, 1, 1, 1,
-0.1623056, -1.574164, -3.861263, 1, 1, 1, 1, 1,
-0.1601876, 0.908159, 0.6930181, 1, 1, 1, 1, 1,
-0.1567255, -1.359207, -3.583746, 1, 1, 1, 1, 1,
-0.1557286, -0.004064254, -2.647722, 1, 1, 1, 1, 1,
-0.1475071, -0.004524584, -0.7824287, 1, 1, 1, 1, 1,
-0.1440818, 0.4506844, 0.0590277, 1, 1, 1, 1, 1,
-0.1423572, 1.233553, 1.694073, 1, 1, 1, 1, 1,
-0.1370496, 0.9404002, -0.2909042, 1, 1, 1, 1, 1,
-0.1353848, -0.05991341, -2.669094, 1, 1, 1, 1, 1,
-0.1342629, -1.266214, -5.038016, 0, 0, 1, 1, 1,
-0.1309109, -1.589644, -2.300265, 1, 0, 0, 1, 1,
-0.1300769, -0.670442, -2.611454, 1, 0, 0, 1, 1,
-0.1281554, 0.3196102, 0.8260878, 1, 0, 0, 1, 1,
-0.1249714, 2.373858, -0.9052962, 1, 0, 0, 1, 1,
-0.12196, -0.2738937, -2.727145, 1, 0, 0, 1, 1,
-0.1188105, -0.642135, -2.779275, 0, 0, 0, 1, 1,
-0.1167288, -1.190325, -4.232197, 0, 0, 0, 1, 1,
-0.1166301, -0.7979746, -4.579961, 0, 0, 0, 1, 1,
-0.1148914, -0.8085846, -2.134029, 0, 0, 0, 1, 1,
-0.1140185, 0.4514948, -0.04687046, 0, 0, 0, 1, 1,
-0.1139667, -1.252544, -3.552577, 0, 0, 0, 1, 1,
-0.1119865, 0.4480991, -0.2938527, 0, 0, 0, 1, 1,
-0.109312, -0.07104526, -2.426057, 1, 1, 1, 1, 1,
-0.1069278, 0.1199871, -0.4067277, 1, 1, 1, 1, 1,
-0.09889048, 1.009101, -0.5294059, 1, 1, 1, 1, 1,
-0.09739518, -1.316456, -3.096627, 1, 1, 1, 1, 1,
-0.09366652, -0.7540238, -3.830931, 1, 1, 1, 1, 1,
-0.09324843, -0.5242642, -3.360311, 1, 1, 1, 1, 1,
-0.09244394, -1.558005, -2.34119, 1, 1, 1, 1, 1,
-0.08887616, -0.655018, -3.881791, 1, 1, 1, 1, 1,
-0.08607528, 0.1883998, 0.7836023, 1, 1, 1, 1, 1,
-0.08424461, 0.1126502, -0.5524884, 1, 1, 1, 1, 1,
-0.07314588, -0.893428, -4.691144, 1, 1, 1, 1, 1,
-0.07135009, 0.3064311, 0.6357288, 1, 1, 1, 1, 1,
-0.06786825, -0.3970215, -3.278542, 1, 1, 1, 1, 1,
-0.06577928, 1.386141, -0.4065608, 1, 1, 1, 1, 1,
-0.06561679, -0.7581294, -2.853486, 1, 1, 1, 1, 1,
-0.05694247, -0.6519213, -3.010438, 0, 0, 1, 1, 1,
-0.0562664, -0.2616377, -3.979451, 1, 0, 0, 1, 1,
-0.05625789, -0.2795883, -3.227512, 1, 0, 0, 1, 1,
-0.05488828, -0.8317311, -4.177784, 1, 0, 0, 1, 1,
-0.05358418, 1.125162, 0.737494, 1, 0, 0, 1, 1,
-0.04934222, -0.2936547, -2.329129, 1, 0, 0, 1, 1,
-0.04605351, 0.5876335, -0.6915607, 0, 0, 0, 1, 1,
-0.03965878, -0.6675574, -2.183342, 0, 0, 0, 1, 1,
-0.03945802, 0.6426573, 1.653124, 0, 0, 0, 1, 1,
-0.0367489, 0.1787271, 0.03762869, 0, 0, 0, 1, 1,
-0.03393384, 0.9845484, -0.8694153, 0, 0, 0, 1, 1,
-0.02991216, -1.066325, -2.899504, 0, 0, 0, 1, 1,
-0.02177676, 2.066342, 1.985267, 0, 0, 0, 1, 1,
-0.02105993, -0.1330874, -2.547892, 1, 1, 1, 1, 1,
-0.02082694, -0.5806052, -2.547779, 1, 1, 1, 1, 1,
-0.01977018, 0.8025882, 0.9977821, 1, 1, 1, 1, 1,
-0.01659192, -0.164712, -2.828265, 1, 1, 1, 1, 1,
-0.01311829, 0.1864432, 0.5605178, 1, 1, 1, 1, 1,
-0.01285394, 0.5780923, -1.481665, 1, 1, 1, 1, 1,
-0.009135754, -0.08081151, -4.209679, 1, 1, 1, 1, 1,
-0.008216282, 0.02701991, -1.158367, 1, 1, 1, 1, 1,
-0.007774489, 0.2320097, 0.6540356, 1, 1, 1, 1, 1,
-0.007181503, -1.160887, -3.953599, 1, 1, 1, 1, 1,
-0.004856144, -0.1216584, -2.505797, 1, 1, 1, 1, 1,
-0.0008854028, 1.291242, -0.4426159, 1, 1, 1, 1, 1,
-0.0007399757, -0.4776297, -2.879602, 1, 1, 1, 1, 1,
0.003487187, -1.906727, 2.282918, 1, 1, 1, 1, 1,
0.005783937, -1.657037, 2.683904, 1, 1, 1, 1, 1,
0.007827856, 0.597058, -0.2425535, 0, 0, 1, 1, 1,
0.01042345, 0.3712646, 0.1356002, 1, 0, 0, 1, 1,
0.01235767, -0.8044323, 4.445284, 1, 0, 0, 1, 1,
0.01297651, -1.411934, 2.521152, 1, 0, 0, 1, 1,
0.01344937, 0.9298971, -0.1257548, 1, 0, 0, 1, 1,
0.01365823, 0.4991868, -0.1594056, 1, 0, 0, 1, 1,
0.01493964, -0.1265169, 3.039725, 0, 0, 0, 1, 1,
0.01617605, 1.983279, -0.1051821, 0, 0, 0, 1, 1,
0.01700378, -1.145507, 2.572313, 0, 0, 0, 1, 1,
0.0250007, 0.3326192, -0.3392995, 0, 0, 0, 1, 1,
0.02759032, 1.982717, 1.561745, 0, 0, 0, 1, 1,
0.029022, -0.309832, 4.122201, 0, 0, 0, 1, 1,
0.03686012, -0.6615798, 3.880447, 0, 0, 0, 1, 1,
0.03825957, 0.09638187, 0.4746923, 1, 1, 1, 1, 1,
0.03968107, -1.17112, 3.465804, 1, 1, 1, 1, 1,
0.04217463, -0.5685468, 2.648407, 1, 1, 1, 1, 1,
0.04809124, 1.254188, 1.675835, 1, 1, 1, 1, 1,
0.04845544, -0.06265353, 3.036567, 1, 1, 1, 1, 1,
0.04924926, -0.3392173, 1.919351, 1, 1, 1, 1, 1,
0.05600566, -0.3680839, 2.278282, 1, 1, 1, 1, 1,
0.057128, -0.08331189, 1.727305, 1, 1, 1, 1, 1,
0.06073259, 1.555605, -0.5273075, 1, 1, 1, 1, 1,
0.06189178, -0.281234, 2.27769, 1, 1, 1, 1, 1,
0.06556839, 1.341798, -1.043771, 1, 1, 1, 1, 1,
0.06610841, 0.6475658, -0.3173881, 1, 1, 1, 1, 1,
0.0706387, 0.5760227, 0.08338841, 1, 1, 1, 1, 1,
0.07152117, -0.5114603, 4.097148, 1, 1, 1, 1, 1,
0.07229084, -0.2132899, 2.714905, 1, 1, 1, 1, 1,
0.0750016, 0.267266, 0.4367304, 0, 0, 1, 1, 1,
0.0786111, -1.410259, 1.832615, 1, 0, 0, 1, 1,
0.07904981, -1.700198, 2.78435, 1, 0, 0, 1, 1,
0.07960153, -1.146544, 5.802792, 1, 0, 0, 1, 1,
0.0807287, -0.9006169, 2.543632, 1, 0, 0, 1, 1,
0.08312266, 0.1264922, -0.09176927, 1, 0, 0, 1, 1,
0.08340317, 1.16178, 1.735334, 0, 0, 0, 1, 1,
0.08642592, -1.452701, 1.585528, 0, 0, 0, 1, 1,
0.09208799, 2.113351, 0.6360366, 0, 0, 0, 1, 1,
0.09244516, 1.149738, 1.781893, 0, 0, 0, 1, 1,
0.09328691, -1.159259, 2.832099, 0, 0, 0, 1, 1,
0.1051497, 1.356205, 1.473504, 0, 0, 0, 1, 1,
0.1127679, 1.511933, -1.814029, 0, 0, 0, 1, 1,
0.1158371, 1.636209, -1.255439, 1, 1, 1, 1, 1,
0.1160547, 0.9560729, 0.8844075, 1, 1, 1, 1, 1,
0.1213383, 0.4882609, -0.1842031, 1, 1, 1, 1, 1,
0.124602, -0.7437091, 2.286777, 1, 1, 1, 1, 1,
0.1251764, 0.6388204, -0.1960655, 1, 1, 1, 1, 1,
0.1258426, -1.210749, 0.6048976, 1, 1, 1, 1, 1,
0.1266112, -0.1561571, 4.496596, 1, 1, 1, 1, 1,
0.1291649, -0.6503072, 2.214468, 1, 1, 1, 1, 1,
0.1331345, -1.149101, 2.976209, 1, 1, 1, 1, 1,
0.1334694, 1.276751, -1.913153, 1, 1, 1, 1, 1,
0.1335195, 0.6568111, 0.1305053, 1, 1, 1, 1, 1,
0.1357464, -1.908655, 5.789937, 1, 1, 1, 1, 1,
0.1359089, 1.382439, -0.03402385, 1, 1, 1, 1, 1,
0.1360949, 1.634785, -0.9706244, 1, 1, 1, 1, 1,
0.1395369, -0.1491159, 3.02391, 1, 1, 1, 1, 1,
0.1399797, 0.3218184, 2.045132, 0, 0, 1, 1, 1,
0.1407564, -0.8967171, 2.529329, 1, 0, 0, 1, 1,
0.1428477, 0.4858902, -0.2653525, 1, 0, 0, 1, 1,
0.14538, -3.19579, 3.597753, 1, 0, 0, 1, 1,
0.1490791, 0.01381032, -0.3997582, 1, 0, 0, 1, 1,
0.1499502, 1.262487, 2.818149, 1, 0, 0, 1, 1,
0.1506912, 0.6189128, 0.6607489, 0, 0, 0, 1, 1,
0.1541942, -1.4065, 3.033432, 0, 0, 0, 1, 1,
0.1542824, 1.66246, 0.2630162, 0, 0, 0, 1, 1,
0.1581486, 1.494816, 4.211412, 0, 0, 0, 1, 1,
0.1602986, -1.052122, 3.819814, 0, 0, 0, 1, 1,
0.1649278, 0.1636841, -0.7212801, 0, 0, 0, 1, 1,
0.1653387, 1.13718, 0.3496162, 0, 0, 0, 1, 1,
0.1707212, 1.159977, 1.220245, 1, 1, 1, 1, 1,
0.1733438, 0.4993323, -0.5466274, 1, 1, 1, 1, 1,
0.1760963, -1.720406, 2.707697, 1, 1, 1, 1, 1,
0.1770294, -0.9403639, 2.76121, 1, 1, 1, 1, 1,
0.1801429, -0.1511892, 0.00912648, 1, 1, 1, 1, 1,
0.1830116, -1.284225, 2.786043, 1, 1, 1, 1, 1,
0.1841329, -0.2117816, 2.692321, 1, 1, 1, 1, 1,
0.1841798, 0.9894959, -0.9997362, 1, 1, 1, 1, 1,
0.1858433, 1.021183, -0.1613557, 1, 1, 1, 1, 1,
0.1868189, -0.708178, 3.83445, 1, 1, 1, 1, 1,
0.1885313, -1.435985, 4.660244, 1, 1, 1, 1, 1,
0.1888179, -0.4348225, 3.132221, 1, 1, 1, 1, 1,
0.1973396, -0.07516426, 2.642667, 1, 1, 1, 1, 1,
0.2004294, 1.445126, 1.294037, 1, 1, 1, 1, 1,
0.2014662, 1.235185, 1.005973, 1, 1, 1, 1, 1,
0.2039958, 0.8373633, 0.9245746, 0, 0, 1, 1, 1,
0.213773, -1.356495, 2.288606, 1, 0, 0, 1, 1,
0.2145328, 0.8317833, 0.03351176, 1, 0, 0, 1, 1,
0.2157124, -0.4799606, 2.854798, 1, 0, 0, 1, 1,
0.2175563, 1.745076, 0.5547826, 1, 0, 0, 1, 1,
0.2219397, -0.6356469, 3.332496, 1, 0, 0, 1, 1,
0.2295729, -1.731528, 4.015774, 0, 0, 0, 1, 1,
0.2323909, -0.5281484, 2.44998, 0, 0, 0, 1, 1,
0.2374889, -1.247515, 3.609937, 0, 0, 0, 1, 1,
0.2379966, -0.556266, 2.597106, 0, 0, 0, 1, 1,
0.238992, 0.9604326, 0.9435788, 0, 0, 0, 1, 1,
0.2408043, -0.2460965, 2.656665, 0, 0, 0, 1, 1,
0.2416072, -0.9302706, 2.306197, 0, 0, 0, 1, 1,
0.2507986, 0.2982722, 0.01442636, 1, 1, 1, 1, 1,
0.2527516, 0.8585831, 0.8219724, 1, 1, 1, 1, 1,
0.2546362, 0.744285, -1.521777, 1, 1, 1, 1, 1,
0.255565, 0.5414796, 0.7687544, 1, 1, 1, 1, 1,
0.2582976, -0.1027108, 3.11188, 1, 1, 1, 1, 1,
0.2606615, 0.8129121, -0.9853335, 1, 1, 1, 1, 1,
0.2682085, 0.6044227, 0.1165472, 1, 1, 1, 1, 1,
0.2694065, 1.468452, -0.8222235, 1, 1, 1, 1, 1,
0.26949, 1.806756, 0.03647031, 1, 1, 1, 1, 1,
0.2734441, 0.6877196, 0.5953651, 1, 1, 1, 1, 1,
0.2748847, -1.00619, 3.131566, 1, 1, 1, 1, 1,
0.2781006, -0.1598817, 1.524641, 1, 1, 1, 1, 1,
0.2787099, 1.224037, 0.2285617, 1, 1, 1, 1, 1,
0.2845284, -0.3182981, 1.604638, 1, 1, 1, 1, 1,
0.2864293, -0.5773548, 1.657558, 1, 1, 1, 1, 1,
0.2866907, -1.013509, 1.965254, 0, 0, 1, 1, 1,
0.3012799, -0.08696863, 0.5937952, 1, 0, 0, 1, 1,
0.309677, 1.653982, -0.01645354, 1, 0, 0, 1, 1,
0.3117141, 0.9132613, 0.5822966, 1, 0, 0, 1, 1,
0.3124632, -0.07809868, 1.634055, 1, 0, 0, 1, 1,
0.3131402, -1.610536, 2.363295, 1, 0, 0, 1, 1,
0.3168582, -0.6246327, 2.54015, 0, 0, 0, 1, 1,
0.3174405, 0.09844247, 1.994678, 0, 0, 0, 1, 1,
0.3253295, -0.2412046, 1.561781, 0, 0, 0, 1, 1,
0.3259226, -0.4694844, 4.569819, 0, 0, 0, 1, 1,
0.3304724, -1.083803, 1.301626, 0, 0, 0, 1, 1,
0.3307014, 0.9005138, 1.133058, 0, 0, 0, 1, 1,
0.335129, 0.1165191, 2.196967, 0, 0, 0, 1, 1,
0.3387347, 0.4753623, -0.09190712, 1, 1, 1, 1, 1,
0.339448, 0.1728514, 1.304435, 1, 1, 1, 1, 1,
0.3432211, -0.1016561, 2.990641, 1, 1, 1, 1, 1,
0.3458542, 0.7663093, 0.2146273, 1, 1, 1, 1, 1,
0.3462416, 0.5049492, 2.450866, 1, 1, 1, 1, 1,
0.3485753, 0.8039868, -0.4862542, 1, 1, 1, 1, 1,
0.3490875, -1.151143, 3.486044, 1, 1, 1, 1, 1,
0.3495537, -2.222801, 2.715072, 1, 1, 1, 1, 1,
0.3518231, 0.6167575, 0.9283032, 1, 1, 1, 1, 1,
0.3562168, 1.321003, -0.4942834, 1, 1, 1, 1, 1,
0.3628278, 0.5073396, 0.01037435, 1, 1, 1, 1, 1,
0.3635771, -1.106643, 4.995597, 1, 1, 1, 1, 1,
0.365903, -1.061154, 3.934308, 1, 1, 1, 1, 1,
0.3665486, -0.9493875, 3.467982, 1, 1, 1, 1, 1,
0.3718393, -0.4650217, 3.51586, 1, 1, 1, 1, 1,
0.3738001, 0.02829225, 1.816258, 0, 0, 1, 1, 1,
0.3774906, 0.3058788, 1.313306, 1, 0, 0, 1, 1,
0.3795475, 1.192483, -0.2942063, 1, 0, 0, 1, 1,
0.3857797, 0.02084784, -0.02658599, 1, 0, 0, 1, 1,
0.3860361, 1.767947, 1.122424, 1, 0, 0, 1, 1,
0.3926922, -0.4808293, 2.05265, 1, 0, 0, 1, 1,
0.3934569, 0.5301341, -0.4018613, 0, 0, 0, 1, 1,
0.4018022, 0.8565539, -0.8738351, 0, 0, 0, 1, 1,
0.408593, -0.7515375, 2.353676, 0, 0, 0, 1, 1,
0.4123241, 1.085349, 0.4551413, 0, 0, 0, 1, 1,
0.4141334, 0.5662459, 0.08413602, 0, 0, 0, 1, 1,
0.4178253, 1.1387, 0.7916248, 0, 0, 0, 1, 1,
0.4204743, -0.8313317, 1.836251, 0, 0, 0, 1, 1,
0.4266662, 0.7590454, 0.416069, 1, 1, 1, 1, 1,
0.4303377, -0.8492959, 2.204837, 1, 1, 1, 1, 1,
0.4331777, -2.075611, 1.372231, 1, 1, 1, 1, 1,
0.43444, 0.7572315, 0.5074611, 1, 1, 1, 1, 1,
0.4357348, 1.323233, 2.494861, 1, 1, 1, 1, 1,
0.4374618, -0.7879565, 3.065851, 1, 1, 1, 1, 1,
0.4381223, -0.01302479, -0.05386927, 1, 1, 1, 1, 1,
0.4388462, -0.3869966, 4.139689, 1, 1, 1, 1, 1,
0.4389648, 0.5795717, -0.548577, 1, 1, 1, 1, 1,
0.4438836, -0.236174, 2.353702, 1, 1, 1, 1, 1,
0.4461474, -0.6277472, 2.93214, 1, 1, 1, 1, 1,
0.4501821, -1.836408, 3.922556, 1, 1, 1, 1, 1,
0.4503041, 0.03285085, 0.4771769, 1, 1, 1, 1, 1,
0.4510671, -0.4042971, 2.767753, 1, 1, 1, 1, 1,
0.4536547, -0.9898645, 2.406419, 1, 1, 1, 1, 1,
0.454118, -0.2201105, 1.253325, 0, 0, 1, 1, 1,
0.4544094, 0.3437889, 1.236108, 1, 0, 0, 1, 1,
0.45494, 0.8524664, -0.5471619, 1, 0, 0, 1, 1,
0.4550374, 0.2686762, 2.132102, 1, 0, 0, 1, 1,
0.4629445, -0.2501347, 1.68582, 1, 0, 0, 1, 1,
0.4658391, 1.239553, 0.6423599, 1, 0, 0, 1, 1,
0.4668311, -1.238284, 4.214488, 0, 0, 0, 1, 1,
0.469422, -0.8295134, 1.796231, 0, 0, 0, 1, 1,
0.4748453, 0.02615202, 0.5598072, 0, 0, 0, 1, 1,
0.475362, 1.211536, -0.09581894, 0, 0, 0, 1, 1,
0.4761507, -0.8704166, 1.990689, 0, 0, 0, 1, 1,
0.4873985, 0.4281553, 0.4141898, 0, 0, 0, 1, 1,
0.4886251, 0.9687805, 0.7338631, 0, 0, 0, 1, 1,
0.4961323, 2.654851, 0.4961708, 1, 1, 1, 1, 1,
0.4979664, 0.2161155, 1.362943, 1, 1, 1, 1, 1,
0.5003554, 0.3887819, -0.004703839, 1, 1, 1, 1, 1,
0.5011295, 1.097214, 0.9551682, 1, 1, 1, 1, 1,
0.5084522, 0.03231179, 0.5419389, 1, 1, 1, 1, 1,
0.5131326, -0.4785488, 1.778571, 1, 1, 1, 1, 1,
0.5141796, 0.3808169, 0.7943726, 1, 1, 1, 1, 1,
0.5155994, 0.4958047, 1.333413, 1, 1, 1, 1, 1,
0.5172812, 0.06170572, 1.883944, 1, 1, 1, 1, 1,
0.5184552, -0.9899758, 2.271502, 1, 1, 1, 1, 1,
0.5205715, -1.071061, 4.080443, 1, 1, 1, 1, 1,
0.5254061, -0.004141348, 4.027489, 1, 1, 1, 1, 1,
0.5298091, -1.27515, 1.351497, 1, 1, 1, 1, 1,
0.5359907, -0.7916675, 2.606156, 1, 1, 1, 1, 1,
0.5376073, 0.1718245, 0.06278452, 1, 1, 1, 1, 1,
0.5379844, -0.6713168, 0.461584, 0, 0, 1, 1, 1,
0.5456943, -0.6257901, 1.329806, 1, 0, 0, 1, 1,
0.5480517, 0.6964799, -0.07244893, 1, 0, 0, 1, 1,
0.5496629, 0.626402, 1.80576, 1, 0, 0, 1, 1,
0.5527359, -1.467948, 0.800544, 1, 0, 0, 1, 1,
0.5530401, -0.3072861, 0.9280237, 1, 0, 0, 1, 1,
0.5621926, -1.619357, 2.068929, 0, 0, 0, 1, 1,
0.5677073, 0.5729592, 3.281015, 0, 0, 0, 1, 1,
0.5700716, 0.1523524, 2.185988, 0, 0, 0, 1, 1,
0.5715761, -0.405276, 0.5774102, 0, 0, 0, 1, 1,
0.5723653, 2.624998, -0.600862, 0, 0, 0, 1, 1,
0.5772632, -1.366374, 1.305365, 0, 0, 0, 1, 1,
0.5781883, 0.1309839, 3.098567, 0, 0, 0, 1, 1,
0.5804189, 1.041154, 1.009475, 1, 1, 1, 1, 1,
0.5861901, 0.2500751, 1.375616, 1, 1, 1, 1, 1,
0.5863042, 0.5994327, 1.42054, 1, 1, 1, 1, 1,
0.5896504, -0.1970925, 1.288154, 1, 1, 1, 1, 1,
0.5900406, 1.533973, -0.09863544, 1, 1, 1, 1, 1,
0.5986663, 1.593283, -0.2708099, 1, 1, 1, 1, 1,
0.6050307, 0.3472523, -1.501313, 1, 1, 1, 1, 1,
0.605333, -0.4856013, 1.809749, 1, 1, 1, 1, 1,
0.6091006, 0.4568372, 0.1773355, 1, 1, 1, 1, 1,
0.6093799, -0.4814598, 4.083829, 1, 1, 1, 1, 1,
0.6191205, 0.3068585, 0.7435176, 1, 1, 1, 1, 1,
0.6228964, -0.6145794, 3.672716, 1, 1, 1, 1, 1,
0.6352553, 1.24891, -0.1650299, 1, 1, 1, 1, 1,
0.6433194, 2.044419, 1.323664, 1, 1, 1, 1, 1,
0.6469526, 1.836852, 1.599977, 1, 1, 1, 1, 1,
0.6481428, -0.7060271, 3.394662, 0, 0, 1, 1, 1,
0.6485311, -0.5701681, 2.259122, 1, 0, 0, 1, 1,
0.6510324, 0.4734198, 1.528028, 1, 0, 0, 1, 1,
0.6511555, 0.007148097, 2.230738, 1, 0, 0, 1, 1,
0.6597481, -1.870722, 2.544397, 1, 0, 0, 1, 1,
0.6614805, 0.2560828, 0.2434829, 1, 0, 0, 1, 1,
0.6675104, 0.07508189, 2.117218, 0, 0, 0, 1, 1,
0.6693451, -0.2029389, 3.327616, 0, 0, 0, 1, 1,
0.6762474, -0.4584821, 2.970656, 0, 0, 0, 1, 1,
0.6780304, -0.2498252, 2.07114, 0, 0, 0, 1, 1,
0.6791417, 1.756354, 2.362695, 0, 0, 0, 1, 1,
0.6868885, 1.07213, 2.229653, 0, 0, 0, 1, 1,
0.6877831, -0.5663987, 0.9300451, 0, 0, 0, 1, 1,
0.6898474, 1.026555, 0.7859408, 1, 1, 1, 1, 1,
0.6977303, -0.7399083, 2.459432, 1, 1, 1, 1, 1,
0.6978145, -0.4484696, 1.612003, 1, 1, 1, 1, 1,
0.6991082, -0.4605994, 2.266224, 1, 1, 1, 1, 1,
0.7018794, 0.7429404, 0.9798546, 1, 1, 1, 1, 1,
0.7032918, 0.4678502, -0.2682455, 1, 1, 1, 1, 1,
0.7041901, -0.5447411, 2.721642, 1, 1, 1, 1, 1,
0.7069437, 0.5827506, 1.461408, 1, 1, 1, 1, 1,
0.7110462, -0.0026047, 0.9879562, 1, 1, 1, 1, 1,
0.7155129, -0.8566038, 3.934648, 1, 1, 1, 1, 1,
0.7170668, -0.460298, 2.266939, 1, 1, 1, 1, 1,
0.7200898, 0.2322922, 1.064973, 1, 1, 1, 1, 1,
0.7269902, -0.3934487, 2.05887, 1, 1, 1, 1, 1,
0.7279059, -2.850848, 2.559203, 1, 1, 1, 1, 1,
0.7288389, 0.9342431, 1.137829, 1, 1, 1, 1, 1,
0.7307568, 0.04759151, 1.911805, 0, 0, 1, 1, 1,
0.7344642, -0.6467174, 3.769268, 1, 0, 0, 1, 1,
0.7382045, 0.8731855, -0.5252391, 1, 0, 0, 1, 1,
0.7391053, -0.2047689, 1.752455, 1, 0, 0, 1, 1,
0.7456292, -0.1886717, 0.01817664, 1, 0, 0, 1, 1,
0.750619, -1.110606, 2.752001, 1, 0, 0, 1, 1,
0.7523344, -0.4906121, 2.305632, 0, 0, 0, 1, 1,
0.7545857, -0.9049347, 2.285864, 0, 0, 0, 1, 1,
0.7551782, -0.3598668, 2.746592, 0, 0, 0, 1, 1,
0.7552927, -0.3720624, 1.849626, 0, 0, 0, 1, 1,
0.7597488, 0.2122437, 1.840877, 0, 0, 0, 1, 1,
0.7615191, -0.5204608, 4.542459, 0, 0, 0, 1, 1,
0.7623971, -0.956898, 0.7589095, 0, 0, 0, 1, 1,
0.7697318, -0.6514957, 3.69713, 1, 1, 1, 1, 1,
0.7753156, 1.658373, 0.6708643, 1, 1, 1, 1, 1,
0.7771277, -0.2250289, 1.453604, 1, 1, 1, 1, 1,
0.7771536, -1.425915, 3.836965, 1, 1, 1, 1, 1,
0.7819308, -0.4626945, 3.28605, 1, 1, 1, 1, 1,
0.7882108, -0.6903225, 2.604088, 1, 1, 1, 1, 1,
0.7905308, 0.7285966, 2.144693, 1, 1, 1, 1, 1,
0.8000721, -0.1752117, 1.483341, 1, 1, 1, 1, 1,
0.8024738, -1.622034, 1.770108, 1, 1, 1, 1, 1,
0.8129716, -0.9177746, 2.964017, 1, 1, 1, 1, 1,
0.8130174, -1.198646, 2.389566, 1, 1, 1, 1, 1,
0.8136376, 0.9466642, 1.783824, 1, 1, 1, 1, 1,
0.8143926, -1.109702, 2.85329, 1, 1, 1, 1, 1,
0.8147907, -1.31536, 2.595522, 1, 1, 1, 1, 1,
0.8162463, 1.048961, 0.2777982, 1, 1, 1, 1, 1,
0.8195457, -0.9924576, 4.813498, 0, 0, 1, 1, 1,
0.8203088, -0.7968439, 1.620011, 1, 0, 0, 1, 1,
0.823823, 0.782674, 1.150297, 1, 0, 0, 1, 1,
0.8243851, -0.211539, 2.28489, 1, 0, 0, 1, 1,
0.8254489, 0.6398647, 0.6937523, 1, 0, 0, 1, 1,
0.8336393, -0.8093274, 0.9650629, 1, 0, 0, 1, 1,
0.8408853, 0.9952197, 0.8230761, 0, 0, 0, 1, 1,
0.8412566, -0.5110368, 0.3670275, 0, 0, 0, 1, 1,
0.8447213, -0.3219799, 2.390803, 0, 0, 0, 1, 1,
0.8573722, -0.3599498, 2.591636, 0, 0, 0, 1, 1,
0.8665547, -1.758327, 2.751162, 0, 0, 0, 1, 1,
0.8667949, 0.3810236, 0.6128763, 0, 0, 0, 1, 1,
0.8669888, 0.3152112, 2.606675, 0, 0, 0, 1, 1,
0.8692049, -0.6541735, 4.393322, 1, 1, 1, 1, 1,
0.8775537, -0.2435688, 1.73872, 1, 1, 1, 1, 1,
0.884847, -0.2476195, 0.9937892, 1, 1, 1, 1, 1,
0.889413, 0.7253043, -0.03405177, 1, 1, 1, 1, 1,
0.8896131, 0.462114, 1.570132, 1, 1, 1, 1, 1,
0.8961403, -1.494536, 3.454728, 1, 1, 1, 1, 1,
0.9016478, -0.02259718, 1.253819, 1, 1, 1, 1, 1,
0.9032611, -0.3680286, 2.228828, 1, 1, 1, 1, 1,
0.9056541, -1.34237, 1.729387, 1, 1, 1, 1, 1,
0.9058331, 0.2105021, 1.029918, 1, 1, 1, 1, 1,
0.9115843, 0.1453388, 1.482598, 1, 1, 1, 1, 1,
0.9116072, 0.1852459, 0.02990745, 1, 1, 1, 1, 1,
0.9120663, 0.02971586, 2.051938, 1, 1, 1, 1, 1,
0.914092, -0.6096875, 1.955596, 1, 1, 1, 1, 1,
0.9158382, 0.09843677, 0.9141549, 1, 1, 1, 1, 1,
0.9174554, 0.6440511, 1.702705, 0, 0, 1, 1, 1,
0.9247621, 1.664708, 0.3272972, 1, 0, 0, 1, 1,
0.9326569, 2.004436, 0.04161113, 1, 0, 0, 1, 1,
0.9379231, -1.333552, 2.393394, 1, 0, 0, 1, 1,
0.938067, 1.359816, 1.793853, 1, 0, 0, 1, 1,
0.943669, 0.9576778, 1.397866, 1, 0, 0, 1, 1,
0.9454669, -0.9818126, 1.901302, 0, 0, 0, 1, 1,
0.9580243, -1.85551, 0.7042007, 0, 0, 0, 1, 1,
0.959859, -2.816687, 1.716542, 0, 0, 0, 1, 1,
0.9642943, -0.6389987, 3.745098, 0, 0, 0, 1, 1,
0.9662482, 1.212404, 0.699788, 0, 0, 0, 1, 1,
0.9713975, -1.200047, 0.6591017, 0, 0, 0, 1, 1,
0.9754637, 1.136791, 1.45349, 0, 0, 0, 1, 1,
0.9790164, -0.08903795, 1.232743, 1, 1, 1, 1, 1,
0.9849566, 1.245708, 0.9600366, 1, 1, 1, 1, 1,
0.9902887, -0.6875139, 0.7524507, 1, 1, 1, 1, 1,
1.001117, 1.830255, 0.6843292, 1, 1, 1, 1, 1,
1.003168, -0.3066868, 2.628175, 1, 1, 1, 1, 1,
1.003467, -0.5163735, 1.631992, 1, 1, 1, 1, 1,
1.005575, 1.798046, 0.498925, 1, 1, 1, 1, 1,
1.007122, 0.5326731, 1.42138, 1, 1, 1, 1, 1,
1.011367, 0.7130974, 0.2843174, 1, 1, 1, 1, 1,
1.015782, -0.5466412, 0.1585602, 1, 1, 1, 1, 1,
1.020726, -0.5278913, 1.293709, 1, 1, 1, 1, 1,
1.022455, 2.6451, -0.341032, 1, 1, 1, 1, 1,
1.024096, 0.8463845, 0.7280207, 1, 1, 1, 1, 1,
1.031384, -0.6960627, 1.074045, 1, 1, 1, 1, 1,
1.043572, -1.007888, 0.9097748, 1, 1, 1, 1, 1,
1.047548, -1.167115, 2.795334, 0, 0, 1, 1, 1,
1.048496, 0.8686935, 0.5817739, 1, 0, 0, 1, 1,
1.064783, 1.101338, 2.070694, 1, 0, 0, 1, 1,
1.072514, -0.2934424, 1.996634, 1, 0, 0, 1, 1,
1.072596, -0.1267842, 3.435437, 1, 0, 0, 1, 1,
1.073463, 1.520226, 0.6789915, 1, 0, 0, 1, 1,
1.076913, 0.03511529, 1.968532, 0, 0, 0, 1, 1,
1.092202, 0.5848522, 1.079959, 0, 0, 0, 1, 1,
1.093199, 0.2051848, 1.022424, 0, 0, 0, 1, 1,
1.093512, 1.45657, 2.068226, 0, 0, 0, 1, 1,
1.098665, 0.7439122, 0.2747692, 0, 0, 0, 1, 1,
1.10022, -0.1992291, 0.6350256, 0, 0, 0, 1, 1,
1.110094, -1.339271, 1.868265, 0, 0, 0, 1, 1,
1.11426, 1.880296, 1.359149, 1, 1, 1, 1, 1,
1.117561, 1.777575, 0.4914074, 1, 1, 1, 1, 1,
1.122967, 0.8754773, 1.256843, 1, 1, 1, 1, 1,
1.123124, -0.5283384, 2.066565, 1, 1, 1, 1, 1,
1.151688, 0.52233, 0.2657651, 1, 1, 1, 1, 1,
1.15705, 0.01350637, 1.553257, 1, 1, 1, 1, 1,
1.163685, -0.8752983, 2.451523, 1, 1, 1, 1, 1,
1.165475, 2.298787, 0.08012694, 1, 1, 1, 1, 1,
1.172933, -0.8038443, 4.377569, 1, 1, 1, 1, 1,
1.178291, -1.382979, 2.277635, 1, 1, 1, 1, 1,
1.193057, 0.8342055, 2.237571, 1, 1, 1, 1, 1,
1.194986, -0.4230147, 1.418437, 1, 1, 1, 1, 1,
1.199665, -0.06123693, 1.310357, 1, 1, 1, 1, 1,
1.201463, -0.2414818, 1.955869, 1, 1, 1, 1, 1,
1.205356, -0.9794973, 2.888492, 1, 1, 1, 1, 1,
1.215065, 0.1141879, 1.487789, 0, 0, 1, 1, 1,
1.234063, 0.8421944, 0.8291669, 1, 0, 0, 1, 1,
1.236463, -0.6943164, 1.722461, 1, 0, 0, 1, 1,
1.244072, 0.2111349, 1.070289, 1, 0, 0, 1, 1,
1.256404, -1.044105, 2.663668, 1, 0, 0, 1, 1,
1.256585, 2.37481, -0.2320247, 1, 0, 0, 1, 1,
1.261198, 1.404824, -0.3848803, 0, 0, 0, 1, 1,
1.266352, -0.9212974, 1.592175, 0, 0, 0, 1, 1,
1.266924, 1.607621, 1.452443, 0, 0, 0, 1, 1,
1.267829, 0.08939099, 1.589995, 0, 0, 0, 1, 1,
1.282531, 1.208292, 0.01603404, 0, 0, 0, 1, 1,
1.299088, 0.5511513, 0.6641564, 0, 0, 0, 1, 1,
1.301479, 0.004059918, 0.4432426, 0, 0, 0, 1, 1,
1.305133, -1.336996, 2.31061, 1, 1, 1, 1, 1,
1.310522, 2.171167, 0.4143764, 1, 1, 1, 1, 1,
1.31516, 1.694945, 0.4553304, 1, 1, 1, 1, 1,
1.323067, 1.344808, 3.488416, 1, 1, 1, 1, 1,
1.327872, -1.94676, 2.292637, 1, 1, 1, 1, 1,
1.329047, -1.158866, 3.333672, 1, 1, 1, 1, 1,
1.329585, 1.968024, -0.9254553, 1, 1, 1, 1, 1,
1.334087, -0.3065622, 3.589646, 1, 1, 1, 1, 1,
1.340209, -0.04521951, 1.468171, 1, 1, 1, 1, 1,
1.360912, -0.8265821, 1.198863, 1, 1, 1, 1, 1,
1.36386, -2.123737, 3.117823, 1, 1, 1, 1, 1,
1.373914, 0.8412642, 0.707482, 1, 1, 1, 1, 1,
1.379696, -0.2341224, 1.93041, 1, 1, 1, 1, 1,
1.382244, 0.8292007, 0.953689, 1, 1, 1, 1, 1,
1.382732, 1.553918, 1.357833, 1, 1, 1, 1, 1,
1.388319, -0.555761, 2.479195, 0, 0, 1, 1, 1,
1.428243, 0.7041669, 1.958585, 1, 0, 0, 1, 1,
1.433257, -1.211142, 2.118051, 1, 0, 0, 1, 1,
1.439691, -0.7349322, 2.246452, 1, 0, 0, 1, 1,
1.464412, -0.07606646, 2.210711, 1, 0, 0, 1, 1,
1.469315, -1.533673, 1.260399, 1, 0, 0, 1, 1,
1.475516, 0.6550732, 1.904658, 0, 0, 0, 1, 1,
1.489287, -0.01566708, 2.042511, 0, 0, 0, 1, 1,
1.493311, 0.6869836, -0.2763012, 0, 0, 0, 1, 1,
1.508653, -0.002424701, 0.2404022, 0, 0, 0, 1, 1,
1.523915, -0.2624325, 1.559295, 0, 0, 0, 1, 1,
1.52831, -2.391505, 2.735283, 0, 0, 0, 1, 1,
1.529362, -1.852802, 3.70457, 0, 0, 0, 1, 1,
1.53872, -0.7876845, 1.186517, 1, 1, 1, 1, 1,
1.542764, -1.345529, 3.112832, 1, 1, 1, 1, 1,
1.548719, -0.6249201, 1.700977, 1, 1, 1, 1, 1,
1.558236, 1.516709, 1.239788, 1, 1, 1, 1, 1,
1.580081, -0.3858911, 3.004897, 1, 1, 1, 1, 1,
1.590124, -0.718132, 3.146609, 1, 1, 1, 1, 1,
1.59303, 0.2323842, -0.1148013, 1, 1, 1, 1, 1,
1.616737, 0.6392543, 1.258124, 1, 1, 1, 1, 1,
1.620777, -2.986392, 2.158026, 1, 1, 1, 1, 1,
1.621581, 2.77013, 1.072574, 1, 1, 1, 1, 1,
1.633095, -1.418452, 2.713723, 1, 1, 1, 1, 1,
1.638883, -2.260144, 1.99236, 1, 1, 1, 1, 1,
1.64093, 1.058529, -0.09803341, 1, 1, 1, 1, 1,
1.662046, -0.08135152, 2.000259, 1, 1, 1, 1, 1,
1.677994, -0.8813576, 1.502674, 1, 1, 1, 1, 1,
1.686735, -0.4442646, 1.433063, 0, 0, 1, 1, 1,
1.699622, 0.6660737, 0.01991762, 1, 0, 0, 1, 1,
1.713748, -0.06020596, 1.64449, 1, 0, 0, 1, 1,
1.737517, -2.403142, 1.579873, 1, 0, 0, 1, 1,
1.806098, 1.303278, 0.8514736, 1, 0, 0, 1, 1,
1.824431, 0.3626523, 3.326073, 1, 0, 0, 1, 1,
1.859646, 1.356604, 0.5491799, 0, 0, 0, 1, 1,
1.866947, -1.076794, 1.315153, 0, 0, 0, 1, 1,
1.870547, 1.407656, 1.235262, 0, 0, 0, 1, 1,
1.873769, 0.4306588, 0.5457721, 0, 0, 0, 1, 1,
1.874576, -0.8816408, 3.395275, 0, 0, 0, 1, 1,
1.874996, -0.8626579, 2.483359, 0, 0, 0, 1, 1,
1.87754, 0.04552929, 1.913733, 0, 0, 0, 1, 1,
1.891125, 0.2320305, 1.660399, 1, 1, 1, 1, 1,
1.891147, 1.041029, -0.005848384, 1, 1, 1, 1, 1,
1.927706, -1.46112, 2.341278, 1, 1, 1, 1, 1,
1.950205, -0.8854254, 1.818598, 1, 1, 1, 1, 1,
1.956725, 1.485302, 1.272135, 1, 1, 1, 1, 1,
1.963318, 0.6332449, 2.074152, 1, 1, 1, 1, 1,
1.980055, -0.9191468, 1.240619, 1, 1, 1, 1, 1,
1.981752, 0.5347615, 1.62369, 1, 1, 1, 1, 1,
1.983613, -1.294461, 0.2738061, 1, 1, 1, 1, 1,
2.011134, -1.465143, 3.299972, 1, 1, 1, 1, 1,
2.045144, -1.559672, 3.339976, 1, 1, 1, 1, 1,
2.047317, 0.9850693, 1.03162, 1, 1, 1, 1, 1,
2.052163, -0.1847444, 3.40157, 1, 1, 1, 1, 1,
2.053741, -1.467855, 1.520732, 1, 1, 1, 1, 1,
2.0765, -0.6452447, 2.07804, 1, 1, 1, 1, 1,
2.079248, -0.3868752, 1.285761, 0, 0, 1, 1, 1,
2.08788, 1.05256, 1.962907, 1, 0, 0, 1, 1,
2.111374, 0.5797734, 1.946626, 1, 0, 0, 1, 1,
2.172873, 1.0991, 0.2762285, 1, 0, 0, 1, 1,
2.173653, -1.325629, 2.973943, 1, 0, 0, 1, 1,
2.194723, -0.1288639, 1.685753, 1, 0, 0, 1, 1,
2.202533, 0.2920052, 3.429198, 0, 0, 0, 1, 1,
2.22789, 1.597749, 0.1850856, 0, 0, 0, 1, 1,
2.229813, 0.4197409, 3.082299, 0, 0, 0, 1, 1,
2.239901, -3.318701, 1.376903, 0, 0, 0, 1, 1,
2.330456, -0.3479569, 2.340669, 0, 0, 0, 1, 1,
2.439646, -1.194062, 2.550058, 0, 0, 0, 1, 1,
2.468168, 1.069441, -0.3367008, 0, 0, 0, 1, 1,
2.528651, 0.04777009, 3.754882, 1, 1, 1, 1, 1,
2.562363, 0.7845445, 0.8616362, 1, 1, 1, 1, 1,
2.713164, 0.5719703, 0.2902807, 1, 1, 1, 1, 1,
2.770989, 1.328316, -0.261733, 1, 1, 1, 1, 1,
2.810677, 0.8270424, 1.108826, 1, 1, 1, 1, 1,
2.935475, -2.447224, 1.225721, 1, 1, 1, 1, 1,
3.335713, -0.2945037, 2.475872, 1, 1, 1, 1, 1
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
var radius = 9.700375;
var distance = 34.07215;
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
mvMatrix.translate( -0.1168106, -0.01092005, -0.3823876 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.07215);
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