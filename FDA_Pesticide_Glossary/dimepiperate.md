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
-3.673685, -1.350255, -1.3082, 1, 0, 0, 1,
-2.91952, 0.2530061, -2.337909, 1, 0.007843138, 0, 1,
-2.736038, -1.232404, -0.8540759, 1, 0.01176471, 0, 1,
-2.627896, -0.7286248, -2.880038, 1, 0.01960784, 0, 1,
-2.477013, 1.584048, -0.6772287, 1, 0.02352941, 0, 1,
-2.466583, 0.7944202, -1.666032, 1, 0.03137255, 0, 1,
-2.466345, -0.8065231, -3.024888, 1, 0.03529412, 0, 1,
-2.435335, -0.8302537, -0.9559296, 1, 0.04313726, 0, 1,
-2.35678, -1.764978, -1.677089, 1, 0.04705882, 0, 1,
-2.321407, 1.028666, 0.4218612, 1, 0.05490196, 0, 1,
-2.301539, -0.3244183, -2.131665, 1, 0.05882353, 0, 1,
-2.298361, -0.9743086, -1.197154, 1, 0.06666667, 0, 1,
-2.297942, -0.2403544, -1.281313, 1, 0.07058824, 0, 1,
-2.254028, -1.097518, -2.514137, 1, 0.07843138, 0, 1,
-2.128003, -2.128788, -3.904546, 1, 0.08235294, 0, 1,
-2.088187, -0.9247462, -3.07286, 1, 0.09019608, 0, 1,
-2.049539, -0.6575201, -1.560377, 1, 0.09411765, 0, 1,
-2.037915, -1.231475, 0.2792352, 1, 0.1019608, 0, 1,
-2.033056, -1.943528, -1.567845, 1, 0.1098039, 0, 1,
-2.029651, -0.3841628, -0.2960672, 1, 0.1137255, 0, 1,
-2.018132, 0.1038228, -1.110486, 1, 0.1215686, 0, 1,
-2.012303, -1.805828, -1.510754, 1, 0.1254902, 0, 1,
-2.009536, 0.6896569, -0.740992, 1, 0.1333333, 0, 1,
-1.936015, 1.201159, -0.3545445, 1, 0.1372549, 0, 1,
-1.932943, 0.2363517, 0.4587743, 1, 0.145098, 0, 1,
-1.897251, -1.529018, -1.45649, 1, 0.1490196, 0, 1,
-1.884159, 0.3648228, 1.148703, 1, 0.1568628, 0, 1,
-1.860246, 0.1837244, -0.0181896, 1, 0.1607843, 0, 1,
-1.854554, -0.06901543, -2.25905, 1, 0.1686275, 0, 1,
-1.848787, 0.5698484, -1.616342, 1, 0.172549, 0, 1,
-1.838433, 1.062689, 0.2359769, 1, 0.1803922, 0, 1,
-1.819841, -2.380219, -3.38089, 1, 0.1843137, 0, 1,
-1.809127, -0.2412824, -1.872519, 1, 0.1921569, 0, 1,
-1.807361, 1.702934, -1.649519, 1, 0.1960784, 0, 1,
-1.800144, 0.355009, -2.226807, 1, 0.2039216, 0, 1,
-1.778503, 0.2020629, -0.3460582, 1, 0.2117647, 0, 1,
-1.745228, 0.1516752, -3.276784, 1, 0.2156863, 0, 1,
-1.742875, 0.3663032, -0.1947127, 1, 0.2235294, 0, 1,
-1.732473, -2.020185, -2.754272, 1, 0.227451, 0, 1,
-1.731741, 0.9578387, -1.099236, 1, 0.2352941, 0, 1,
-1.721867, 0.4206151, -0.8667369, 1, 0.2392157, 0, 1,
-1.712119, -0.4184404, -2.284656, 1, 0.2470588, 0, 1,
-1.698075, 0.6078647, -0.8039719, 1, 0.2509804, 0, 1,
-1.684741, -1.560619, -1.901673, 1, 0.2588235, 0, 1,
-1.683248, -0.1380819, -0.7961674, 1, 0.2627451, 0, 1,
-1.668404, 1.077108, -2.199881, 1, 0.2705882, 0, 1,
-1.651702, -0.04248958, -0.9375569, 1, 0.2745098, 0, 1,
-1.648212, 0.5619581, -0.5398968, 1, 0.282353, 0, 1,
-1.647726, -0.8367552, -1.540407, 1, 0.2862745, 0, 1,
-1.637096, -1.120018, -2.932129, 1, 0.2941177, 0, 1,
-1.631389, -0.3218708, -3.323973, 1, 0.3019608, 0, 1,
-1.623177, 0.6364704, -0.3734732, 1, 0.3058824, 0, 1,
-1.62311, -0.7822784, -3.367775, 1, 0.3137255, 0, 1,
-1.60397, 0.9684385, -0.4024414, 1, 0.3176471, 0, 1,
-1.594611, 0.2018448, -1.879463, 1, 0.3254902, 0, 1,
-1.587467, -2.467349, -1.795419, 1, 0.3294118, 0, 1,
-1.586193, 0.203425, 0.4662257, 1, 0.3372549, 0, 1,
-1.566522, -0.3033539, -0.5282606, 1, 0.3411765, 0, 1,
-1.559339, 1.440215, -1.457009, 1, 0.3490196, 0, 1,
-1.546324, 0.5578946, -1.005981, 1, 0.3529412, 0, 1,
-1.54436, 0.8079914, 0.2830555, 1, 0.3607843, 0, 1,
-1.536733, 0.5548006, -2.60003, 1, 0.3647059, 0, 1,
-1.527677, -0.2960656, -1.656226, 1, 0.372549, 0, 1,
-1.524676, -0.5721271, -1.86535, 1, 0.3764706, 0, 1,
-1.513869, -1.88597, -3.48681, 1, 0.3843137, 0, 1,
-1.510204, -0.1667394, -3.292501, 1, 0.3882353, 0, 1,
-1.50905, 0.3355879, 0.2878962, 1, 0.3960784, 0, 1,
-1.498021, -0.7350334, -1.225938, 1, 0.4039216, 0, 1,
-1.492833, 1.186193, -0.017013, 1, 0.4078431, 0, 1,
-1.487779, -1.590506, -3.182614, 1, 0.4156863, 0, 1,
-1.455834, 0.368116, -0.6200147, 1, 0.4196078, 0, 1,
-1.446757, 1.244502, -0.721976, 1, 0.427451, 0, 1,
-1.43352, -1.583794, -1.398462, 1, 0.4313726, 0, 1,
-1.429719, 0.3291498, -0.7101006, 1, 0.4392157, 0, 1,
-1.427398, -0.900065, -2.026072, 1, 0.4431373, 0, 1,
-1.401082, -0.08068509, -2.103623, 1, 0.4509804, 0, 1,
-1.399456, 0.2748157, -0.8178806, 1, 0.454902, 0, 1,
-1.393288, -1.35031, -1.779078, 1, 0.4627451, 0, 1,
-1.389951, 0.4134283, -0.6961976, 1, 0.4666667, 0, 1,
-1.37487, 0.3135639, -2.046681, 1, 0.4745098, 0, 1,
-1.371426, -0.3618817, -3.57697, 1, 0.4784314, 0, 1,
-1.357741, -0.4241383, -2.578777, 1, 0.4862745, 0, 1,
-1.350972, -0.27136, -2.717765, 1, 0.4901961, 0, 1,
-1.349509, 1.441517, -0.01002892, 1, 0.4980392, 0, 1,
-1.340128, -1.694858, -1.635044, 1, 0.5058824, 0, 1,
-1.314314, -1.163698, -3.103703, 1, 0.509804, 0, 1,
-1.295495, 0.9291095, 1.488225, 1, 0.5176471, 0, 1,
-1.276312, -0.3208046, 0.2894985, 1, 0.5215687, 0, 1,
-1.274206, 0.2771602, -2.525779, 1, 0.5294118, 0, 1,
-1.269181, 0.1084683, -2.847085, 1, 0.5333334, 0, 1,
-1.26476, -1.573515, -2.951161, 1, 0.5411765, 0, 1,
-1.261234, 0.2086267, -3.126351, 1, 0.5450981, 0, 1,
-1.259908, 1.074892, 1.757023, 1, 0.5529412, 0, 1,
-1.25968, -0.4087947, -2.685382, 1, 0.5568628, 0, 1,
-1.256772, -2.01583, -3.464309, 1, 0.5647059, 0, 1,
-1.254712, -1.620695, -1.238201, 1, 0.5686275, 0, 1,
-1.253709, 0.7672232, -2.747005, 1, 0.5764706, 0, 1,
-1.238492, 0.09722698, -2.966534, 1, 0.5803922, 0, 1,
-1.234333, -0.3791888, -1.990532, 1, 0.5882353, 0, 1,
-1.22484, 0.2031729, 0.133307, 1, 0.5921569, 0, 1,
-1.224019, -1.767748, -3.640781, 1, 0.6, 0, 1,
-1.20893, 2.02746, -0.4619007, 1, 0.6078432, 0, 1,
-1.196488, 1.304808, -0.4776488, 1, 0.6117647, 0, 1,
-1.191622, -1.308228, -3.127057, 1, 0.6196079, 0, 1,
-1.189242, 0.1913862, -0.4856652, 1, 0.6235294, 0, 1,
-1.187804, -0.7200732, -3.207084, 1, 0.6313726, 0, 1,
-1.184509, 0.3475056, -1.483341, 1, 0.6352941, 0, 1,
-1.17779, -0.8522663, -2.055177, 1, 0.6431373, 0, 1,
-1.175356, 2.02526, -0.1207636, 1, 0.6470588, 0, 1,
-1.17279, -1.262696, -1.186231, 1, 0.654902, 0, 1,
-1.169608, -0.4859277, -2.79353, 1, 0.6588235, 0, 1,
-1.167748, 0.5832313, 0.1918624, 1, 0.6666667, 0, 1,
-1.161711, -1.191692, -3.352551, 1, 0.6705883, 0, 1,
-1.160647, 2.507827, 0.3626533, 1, 0.6784314, 0, 1,
-1.160057, 1.144836, -0.01773531, 1, 0.682353, 0, 1,
-1.152992, -1.336292, -2.72891, 1, 0.6901961, 0, 1,
-1.147761, 1.079897, 0.4481788, 1, 0.6941177, 0, 1,
-1.143999, 0.1027166, -2.053737, 1, 0.7019608, 0, 1,
-1.139273, -1.691525, -2.247181, 1, 0.7098039, 0, 1,
-1.137927, -0.404166, -1.951802, 1, 0.7137255, 0, 1,
-1.131093, -1.355362, -0.7325546, 1, 0.7215686, 0, 1,
-1.128527, -0.9393668, -0.7811805, 1, 0.7254902, 0, 1,
-1.122409, -0.1035876, -2.70788, 1, 0.7333333, 0, 1,
-1.122097, -0.5891495, -3.103879, 1, 0.7372549, 0, 1,
-1.115231, 1.067923, -1.841701, 1, 0.7450981, 0, 1,
-1.112542, -0.5290188, 0.538135, 1, 0.7490196, 0, 1,
-1.109393, -0.6681069, -2.20159, 1, 0.7568628, 0, 1,
-1.108361, 1.559739, -0.989436, 1, 0.7607843, 0, 1,
-1.106904, -1.240443, -3.380208, 1, 0.7686275, 0, 1,
-1.100571, -1.553931, -3.256691, 1, 0.772549, 0, 1,
-1.097176, 0.06714553, -1.751892, 1, 0.7803922, 0, 1,
-1.087469, -0.8904917, -2.498288, 1, 0.7843137, 0, 1,
-1.086701, -0.2867774, -1.387869, 1, 0.7921569, 0, 1,
-1.084867, 1.055147, 0.7303174, 1, 0.7960784, 0, 1,
-1.083726, 2.38513, 0.2716965, 1, 0.8039216, 0, 1,
-1.081358, 0.4015377, -1.893497, 1, 0.8117647, 0, 1,
-1.078667, 0.6253013, -0.8888536, 1, 0.8156863, 0, 1,
-1.076966, 0.3718835, -0.7662407, 1, 0.8235294, 0, 1,
-1.07342, -0.4869645, -2.837314, 1, 0.827451, 0, 1,
-1.066734, -1.752657, -3.420388, 1, 0.8352941, 0, 1,
-1.065668, 0.7998778, -2.42791, 1, 0.8392157, 0, 1,
-1.064883, -1.102133, -2.176668, 1, 0.8470588, 0, 1,
-1.062792, -0.1841177, -1.215336, 1, 0.8509804, 0, 1,
-1.050416, -1.747626, -2.681489, 1, 0.8588235, 0, 1,
-1.0484, -0.7124807, -2.422639, 1, 0.8627451, 0, 1,
-1.045402, -0.1943371, -1.918662, 1, 0.8705882, 0, 1,
-1.043668, -0.8594923, -1.619228, 1, 0.8745098, 0, 1,
-1.037067, 0.511905, -1.366784, 1, 0.8823529, 0, 1,
-1.036207, 0.350414, -0.1849539, 1, 0.8862745, 0, 1,
-1.033564, -0.3019377, -3.57295, 1, 0.8941177, 0, 1,
-1.031723, 1.484391, -0.7014816, 1, 0.8980392, 0, 1,
-1.025219, -0.7377687, -1.597164, 1, 0.9058824, 0, 1,
-1.024197, 1.73031, -1.580924, 1, 0.9137255, 0, 1,
-1.019444, 0.09635108, -2.153626, 1, 0.9176471, 0, 1,
-1.019017, 1.63766, -0.8358403, 1, 0.9254902, 0, 1,
-1.016246, 0.6332585, -0.9147561, 1, 0.9294118, 0, 1,
-1.016147, 1.576364, -0.99126, 1, 0.9372549, 0, 1,
-1.012098, -0.2072233, -2.544347, 1, 0.9411765, 0, 1,
-1.005599, 1.020537, -1.424674, 1, 0.9490196, 0, 1,
-1.000333, -0.05879519, -1.260497, 1, 0.9529412, 0, 1,
-0.9970722, 0.6035388, -0.6394346, 1, 0.9607843, 0, 1,
-0.9953737, -0.4936364, -1.045336, 1, 0.9647059, 0, 1,
-0.993937, -1.611459, -3.312655, 1, 0.972549, 0, 1,
-0.9911507, -0.2187639, -0.4797199, 1, 0.9764706, 0, 1,
-0.9896584, 0.9743692, -1.823763, 1, 0.9843137, 0, 1,
-0.9875178, -0.9207119, -4.336063, 1, 0.9882353, 0, 1,
-0.9812165, 0.5686042, -1.027518, 1, 0.9960784, 0, 1,
-0.9767863, -0.048274, -1.020779, 0.9960784, 1, 0, 1,
-0.972607, 0.6180876, 0.86257, 0.9921569, 1, 0, 1,
-0.9714518, -0.756943, -1.546549, 0.9843137, 1, 0, 1,
-0.969775, 0.9399354, -0.8519003, 0.9803922, 1, 0, 1,
-0.9648942, 1.834997, -0.8318579, 0.972549, 1, 0, 1,
-0.963282, -1.056789, -0.9247096, 0.9686275, 1, 0, 1,
-0.951752, -1.969802, -4.893635, 0.9607843, 1, 0, 1,
-0.9492533, -0.2044016, -1.773061, 0.9568627, 1, 0, 1,
-0.946604, -1.027149, -2.803862, 0.9490196, 1, 0, 1,
-0.946438, -1.113848, -2.612305, 0.945098, 1, 0, 1,
-0.9436253, 1.010796, -2.180702, 0.9372549, 1, 0, 1,
-0.9367616, -0.1197223, -0.3075663, 0.9333333, 1, 0, 1,
-0.9331437, -0.6885445, -3.591519, 0.9254902, 1, 0, 1,
-0.9331407, -0.369024, -2.058766, 0.9215686, 1, 0, 1,
-0.9319764, -0.2444129, -1.877958, 0.9137255, 1, 0, 1,
-0.9074618, 1.979666, -0.5016382, 0.9098039, 1, 0, 1,
-0.9072557, -1.294947, -3.635694, 0.9019608, 1, 0, 1,
-0.9057094, -0.6914795, -2.310086, 0.8941177, 1, 0, 1,
-0.9042037, -0.141824, -1.901452, 0.8901961, 1, 0, 1,
-0.8989151, -0.08100764, -1.319699, 0.8823529, 1, 0, 1,
-0.8975537, -1.542282, -1.919698, 0.8784314, 1, 0, 1,
-0.8951237, -0.3684949, -2.57257, 0.8705882, 1, 0, 1,
-0.887809, 0.1939264, -1.219038, 0.8666667, 1, 0, 1,
-0.8835828, -0.7083033, -1.535953, 0.8588235, 1, 0, 1,
-0.8783991, -0.7651863, -1.812512, 0.854902, 1, 0, 1,
-0.8734336, 0.2376274, -1.827643, 0.8470588, 1, 0, 1,
-0.8676703, -0.8442686, -3.451147, 0.8431373, 1, 0, 1,
-0.8643932, -2.094112, -1.46887, 0.8352941, 1, 0, 1,
-0.8603599, 1.058578, -1.437248, 0.8313726, 1, 0, 1,
-0.8501531, 2.414005, 0.4147162, 0.8235294, 1, 0, 1,
-0.8453678, -0.3036775, -3.478107, 0.8196079, 1, 0, 1,
-0.8446917, -0.1989898, -1.729924, 0.8117647, 1, 0, 1,
-0.8421828, -1.343196, -2.741487, 0.8078431, 1, 0, 1,
-0.8405373, -0.09113044, -0.5709608, 0.8, 1, 0, 1,
-0.835366, 0.7360064, -1.035923, 0.7921569, 1, 0, 1,
-0.8247315, -0.4507533, -1.383308, 0.7882353, 1, 0, 1,
-0.8225208, 0.1499154, -1.460359, 0.7803922, 1, 0, 1,
-0.8126801, 1.090598, -1.084429, 0.7764706, 1, 0, 1,
-0.8117368, 0.1764495, -1.627291, 0.7686275, 1, 0, 1,
-0.8066983, -1.718835, -4.543192, 0.7647059, 1, 0, 1,
-0.8043486, -0.1411311, -1.946509, 0.7568628, 1, 0, 1,
-0.799837, 0.434553, -1.33612, 0.7529412, 1, 0, 1,
-0.7956827, -0.5404438, -3.294596, 0.7450981, 1, 0, 1,
-0.7915305, 1.351956, -0.6848379, 0.7411765, 1, 0, 1,
-0.7908649, 0.2336307, -3.772351, 0.7333333, 1, 0, 1,
-0.786208, 0.4539762, -0.5450107, 0.7294118, 1, 0, 1,
-0.779236, -0.5044367, -0.5628725, 0.7215686, 1, 0, 1,
-0.7782376, -0.840745, -1.450748, 0.7176471, 1, 0, 1,
-0.7762147, -0.03348396, -1.146849, 0.7098039, 1, 0, 1,
-0.7754598, 0.227937, -1.556988, 0.7058824, 1, 0, 1,
-0.7726589, 1.706721, 0.1249317, 0.6980392, 1, 0, 1,
-0.7660766, 1.51294, 0.1289362, 0.6901961, 1, 0, 1,
-0.7652416, 2.651678, -1.582508, 0.6862745, 1, 0, 1,
-0.7650905, -0.2832927, -2.018343, 0.6784314, 1, 0, 1,
-0.7586237, 1.038104, -0.4218678, 0.6745098, 1, 0, 1,
-0.7579669, 1.597158, -0.06286277, 0.6666667, 1, 0, 1,
-0.7496877, -0.386531, -3.666629, 0.6627451, 1, 0, 1,
-0.7490863, -0.593257, -2.318922, 0.654902, 1, 0, 1,
-0.7409705, -1.217623, -3.240945, 0.6509804, 1, 0, 1,
-0.7351155, -0.007295221, -2.374457, 0.6431373, 1, 0, 1,
-0.7335171, -1.534721, -2.299685, 0.6392157, 1, 0, 1,
-0.7317871, -2.179899, -3.229039, 0.6313726, 1, 0, 1,
-0.7296691, 0.9405642, -1.356109, 0.627451, 1, 0, 1,
-0.7223147, 0.1148921, -0.6020864, 0.6196079, 1, 0, 1,
-0.7192745, 1.568962, -1.072994, 0.6156863, 1, 0, 1,
-0.7169718, 0.1303317, -0.1482371, 0.6078432, 1, 0, 1,
-0.7134472, 0.1615135, -2.626354, 0.6039216, 1, 0, 1,
-0.7110932, 0.6608395, -0.2186967, 0.5960785, 1, 0, 1,
-0.7063515, -0.2754094, -2.232027, 0.5882353, 1, 0, 1,
-0.6944496, 0.2810552, -0.7272825, 0.5843138, 1, 0, 1,
-0.6930243, -0.8392216, -1.109767, 0.5764706, 1, 0, 1,
-0.6908974, 1.232486, -1.767532, 0.572549, 1, 0, 1,
-0.6890505, -1.234623, 0.02188936, 0.5647059, 1, 0, 1,
-0.6867079, 0.2637713, -1.246035, 0.5607843, 1, 0, 1,
-0.6783735, -2.278473, -2.751915, 0.5529412, 1, 0, 1,
-0.6783677, 1.317486, 0.8287465, 0.5490196, 1, 0, 1,
-0.6773129, 1.159904, -0.8820187, 0.5411765, 1, 0, 1,
-0.6734854, 0.00156359, -1.487725, 0.5372549, 1, 0, 1,
-0.6729231, 1.614235, -0.1722286, 0.5294118, 1, 0, 1,
-0.6713677, -0.5092471, -1.574107, 0.5254902, 1, 0, 1,
-0.6698927, -2.127688, -3.031455, 0.5176471, 1, 0, 1,
-0.6690682, 0.1185351, -0.9050374, 0.5137255, 1, 0, 1,
-0.6651946, 1.043413, -1.356432, 0.5058824, 1, 0, 1,
-0.6646153, 1.363067, -1.126076, 0.5019608, 1, 0, 1,
-0.6612548, 1.917329, -0.6197844, 0.4941176, 1, 0, 1,
-0.6548034, 0.3254583, 0.07300601, 0.4862745, 1, 0, 1,
-0.6536599, 0.8825625, -2.124457, 0.4823529, 1, 0, 1,
-0.6440678, 0.8432415, -1.800075, 0.4745098, 1, 0, 1,
-0.6421492, -0.9500457, -2.830025, 0.4705882, 1, 0, 1,
-0.6418912, 0.004556168, -2.233519, 0.4627451, 1, 0, 1,
-0.637399, -0.1634703, -1.838756, 0.4588235, 1, 0, 1,
-0.6371509, -0.1872384, -1.253698, 0.4509804, 1, 0, 1,
-0.6350894, -1.337709, -2.390689, 0.4470588, 1, 0, 1,
-0.6297567, -1.209446, -4.485882, 0.4392157, 1, 0, 1,
-0.6272908, 1.603833, 0.4720234, 0.4352941, 1, 0, 1,
-0.6272737, 0.03066008, -2.272994, 0.427451, 1, 0, 1,
-0.6227881, -1.096752, -2.844701, 0.4235294, 1, 0, 1,
-0.6197582, -0.07713883, -0.1405552, 0.4156863, 1, 0, 1,
-0.6179978, 2.234095, 0.4317787, 0.4117647, 1, 0, 1,
-0.6143581, -0.5017368, -2.720949, 0.4039216, 1, 0, 1,
-0.6084739, -0.7505392, -2.200753, 0.3960784, 1, 0, 1,
-0.6065114, 0.5939416, -0.980718, 0.3921569, 1, 0, 1,
-0.6039345, -0.3179407, -1.297414, 0.3843137, 1, 0, 1,
-0.6012095, -0.4791582, -0.9888655, 0.3803922, 1, 0, 1,
-0.5998995, -0.2691342, -2.494592, 0.372549, 1, 0, 1,
-0.5992607, -0.2376645, -1.305605, 0.3686275, 1, 0, 1,
-0.5991503, 1.04045, -0.7538099, 0.3607843, 1, 0, 1,
-0.5981538, -0.8275478, -3.632633, 0.3568628, 1, 0, 1,
-0.5957118, 1.132506, -0.2310176, 0.3490196, 1, 0, 1,
-0.5953392, 0.2044452, -1.533306, 0.345098, 1, 0, 1,
-0.591556, 0.9843154, -0.2306657, 0.3372549, 1, 0, 1,
-0.5911822, 0.7345312, -0.6190341, 0.3333333, 1, 0, 1,
-0.5861233, 1.099696, -1.03598, 0.3254902, 1, 0, 1,
-0.5853169, 1.969427, -0.4322081, 0.3215686, 1, 0, 1,
-0.5811751, -1.522939, -3.574078, 0.3137255, 1, 0, 1,
-0.5808827, -0.5941157, -3.702431, 0.3098039, 1, 0, 1,
-0.5798194, 0.4389153, 0.967565, 0.3019608, 1, 0, 1,
-0.5794871, -1.612804, -2.455638, 0.2941177, 1, 0, 1,
-0.5793849, 0.8182644, -1.980453, 0.2901961, 1, 0, 1,
-0.5788062, 1.953788, 0.5045803, 0.282353, 1, 0, 1,
-0.5703779, 0.3778896, -1.05096, 0.2784314, 1, 0, 1,
-0.5703367, 1.072373, -0.7053727, 0.2705882, 1, 0, 1,
-0.568413, 0.9239053, -0.4279015, 0.2666667, 1, 0, 1,
-0.5654491, -0.2308547, -1.662301, 0.2588235, 1, 0, 1,
-0.5649744, -0.6044693, -1.253997, 0.254902, 1, 0, 1,
-0.5618269, 0.6395803, -1.1825, 0.2470588, 1, 0, 1,
-0.5613536, 0.3896684, 0.737138, 0.2431373, 1, 0, 1,
-0.5604907, 1.009751, -0.7970472, 0.2352941, 1, 0, 1,
-0.5560716, 0.7626551, -1.397871, 0.2313726, 1, 0, 1,
-0.5552636, -2.027153, -1.22833, 0.2235294, 1, 0, 1,
-0.5538427, 1.731016, -0.288134, 0.2196078, 1, 0, 1,
-0.553537, 0.2058148, 0.1323428, 0.2117647, 1, 0, 1,
-0.5517433, -0.3078887, -2.565127, 0.2078431, 1, 0, 1,
-0.5466586, 1.634373, -0.880159, 0.2, 1, 0, 1,
-0.534515, -1.649998, -1.169919, 0.1921569, 1, 0, 1,
-0.5316002, -0.6928518, -3.2228, 0.1882353, 1, 0, 1,
-0.5238603, 0.4017431, -0.6217692, 0.1803922, 1, 0, 1,
-0.5228096, -0.2342503, -1.037291, 0.1764706, 1, 0, 1,
-0.520341, 0.3820409, -2.239717, 0.1686275, 1, 0, 1,
-0.5173764, -0.4363396, -2.892122, 0.1647059, 1, 0, 1,
-0.5116993, 0.8824076, -0.5558057, 0.1568628, 1, 0, 1,
-0.505787, -0.1479979, -0.6993457, 0.1529412, 1, 0, 1,
-0.5016745, -0.1518351, -0.1189483, 0.145098, 1, 0, 1,
-0.4906193, -1.441834, -2.793813, 0.1411765, 1, 0, 1,
-0.4892117, 0.4769921, -1.653113, 0.1333333, 1, 0, 1,
-0.4865824, -1.332009, -2.612916, 0.1294118, 1, 0, 1,
-0.4789023, -0.08743351, -3.160518, 0.1215686, 1, 0, 1,
-0.4729329, 0.5331483, -2.456079, 0.1176471, 1, 0, 1,
-0.4721281, -1.733368, -3.111201, 0.1098039, 1, 0, 1,
-0.4720516, 0.640608, 0.2186882, 0.1058824, 1, 0, 1,
-0.4649737, 0.6933137, -0.8681422, 0.09803922, 1, 0, 1,
-0.458411, -0.9366243, -3.42897, 0.09019608, 1, 0, 1,
-0.4583166, -0.3548734, -3.006431, 0.08627451, 1, 0, 1,
-0.4549654, -1.435781, -4.244846, 0.07843138, 1, 0, 1,
-0.4545985, -0.2454397, -3.070334, 0.07450981, 1, 0, 1,
-0.4503745, 0.2522697, 0.7802842, 0.06666667, 1, 0, 1,
-0.4488266, -0.9042299, -3.276076, 0.0627451, 1, 0, 1,
-0.4413498, -0.1363111, -2.735802, 0.05490196, 1, 0, 1,
-0.4406968, -0.2146307, -3.126489, 0.05098039, 1, 0, 1,
-0.4406568, 0.08306177, -0.8175648, 0.04313726, 1, 0, 1,
-0.4363002, -0.6992595, -2.285285, 0.03921569, 1, 0, 1,
-0.4304795, 0.1902234, 0.8615876, 0.03137255, 1, 0, 1,
-0.429429, -0.3399593, -1.832167, 0.02745098, 1, 0, 1,
-0.4285423, 1.006883, -1.056689, 0.01960784, 1, 0, 1,
-0.427883, -0.4685551, -2.363304, 0.01568628, 1, 0, 1,
-0.4265341, -1.270662, -2.454035, 0.007843138, 1, 0, 1,
-0.4236909, -0.9375175, -1.123337, 0.003921569, 1, 0, 1,
-0.4233879, -0.269334, -3.475152, 0, 1, 0.003921569, 1,
-0.4179837, 0.6256737, -2.341027, 0, 1, 0.01176471, 1,
-0.4179196, -0.7386496, -1.752621, 0, 1, 0.01568628, 1,
-0.4123287, -1.526536, -3.138277, 0, 1, 0.02352941, 1,
-0.4106826, -1.087038, -1.946376, 0, 1, 0.02745098, 1,
-0.4104495, -1.783771, -3.638721, 0, 1, 0.03529412, 1,
-0.4078736, -0.8426085, -5.062387, 0, 1, 0.03921569, 1,
-0.4039762, 0.4477573, 0.1893538, 0, 1, 0.04705882, 1,
-0.4020316, -0.147739, -2.481489, 0, 1, 0.05098039, 1,
-0.3987548, 0.0274506, -2.485092, 0, 1, 0.05882353, 1,
-0.3974872, -1.628906, -2.801827, 0, 1, 0.0627451, 1,
-0.3842916, -0.9535472, -1.839417, 0, 1, 0.07058824, 1,
-0.3824267, 0.5362955, -0.9623735, 0, 1, 0.07450981, 1,
-0.3786799, -0.7655792, -2.755305, 0, 1, 0.08235294, 1,
-0.3777611, 1.225292, -0.5104018, 0, 1, 0.08627451, 1,
-0.3773569, -0.3652013, -2.227704, 0, 1, 0.09411765, 1,
-0.3772085, -0.9802986, -3.575528, 0, 1, 0.1019608, 1,
-0.3770266, 0.3682027, -0.8277093, 0, 1, 0.1058824, 1,
-0.3766781, 1.021236, -1.368098, 0, 1, 0.1137255, 1,
-0.3706897, 0.5149618, -0.006336481, 0, 1, 0.1176471, 1,
-0.3704561, -0.03622891, -1.390762, 0, 1, 0.1254902, 1,
-0.3649055, -0.2106196, -3.098596, 0, 1, 0.1294118, 1,
-0.3645403, 1.36458, 1.970914, 0, 1, 0.1372549, 1,
-0.3593129, 1.335744, -0.9218968, 0, 1, 0.1411765, 1,
-0.3574896, 0.9741957, -0.5547171, 0, 1, 0.1490196, 1,
-0.3565702, 0.1237344, 1.190467, 0, 1, 0.1529412, 1,
-0.3549732, -0.1853784, -2.437958, 0, 1, 0.1607843, 1,
-0.3520131, -0.09185258, -3.827528, 0, 1, 0.1647059, 1,
-0.351817, 0.8948422, -1.044773, 0, 1, 0.172549, 1,
-0.3472043, 0.475535, 0.2116763, 0, 1, 0.1764706, 1,
-0.3465881, -0.6082013, -4.099619, 0, 1, 0.1843137, 1,
-0.3381818, 1.081645, -0.5459163, 0, 1, 0.1882353, 1,
-0.3368165, 1.505289, 0.4475863, 0, 1, 0.1960784, 1,
-0.3352292, -1.937871, -2.761099, 0, 1, 0.2039216, 1,
-0.3286041, -0.7677223, -2.504835, 0, 1, 0.2078431, 1,
-0.32541, -2.099061, -3.842749, 0, 1, 0.2156863, 1,
-0.3243306, -0.9328644, -0.07714111, 0, 1, 0.2196078, 1,
-0.3218789, 1.07952, -0.7293143, 0, 1, 0.227451, 1,
-0.321287, -0.2012371, -1.413461, 0, 1, 0.2313726, 1,
-0.3164532, -0.5557176, -3.11799, 0, 1, 0.2392157, 1,
-0.3027864, 0.8247747, 0.7090725, 0, 1, 0.2431373, 1,
-0.3013202, -0.02092821, -1.740554, 0, 1, 0.2509804, 1,
-0.295684, 0.298538, -1.051886, 0, 1, 0.254902, 1,
-0.2922952, 0.3301001, -0.5801982, 0, 1, 0.2627451, 1,
-0.2921386, -0.4591061, -3.439215, 0, 1, 0.2666667, 1,
-0.2912253, 0.08325434, -1.405047, 0, 1, 0.2745098, 1,
-0.2892174, -0.1108347, 0.07293375, 0, 1, 0.2784314, 1,
-0.2888358, -0.9509199, -1.136547, 0, 1, 0.2862745, 1,
-0.2877882, -0.1433696, -1.913979, 0, 1, 0.2901961, 1,
-0.2863505, 1.258606, 1.106288, 0, 1, 0.2980392, 1,
-0.2834411, 1.529249, -0.1550945, 0, 1, 0.3058824, 1,
-0.2826233, -0.9085956, -2.630263, 0, 1, 0.3098039, 1,
-0.2787823, 1.351159, 1.996467, 0, 1, 0.3176471, 1,
-0.2686186, -0.2110687, -3.162618, 0, 1, 0.3215686, 1,
-0.2665406, 0.878695, -0.1325755, 0, 1, 0.3294118, 1,
-0.2602527, -0.2502152, -2.526511, 0, 1, 0.3333333, 1,
-0.2569067, -0.507962, -2.533828, 0, 1, 0.3411765, 1,
-0.2542525, 0.4346732, 0.3256448, 0, 1, 0.345098, 1,
-0.2542, -0.4829309, -2.510165, 0, 1, 0.3529412, 1,
-0.2526619, -1.263508, -4.911626, 0, 1, 0.3568628, 1,
-0.2513919, 0.5334635, 0.9263487, 0, 1, 0.3647059, 1,
-0.2413639, -1.072427, -3.273271, 0, 1, 0.3686275, 1,
-0.2348743, 1.140113, -1.269814, 0, 1, 0.3764706, 1,
-0.2307469, -0.1878557, -2.3705, 0, 1, 0.3803922, 1,
-0.229176, 1.488255, 1.542428, 0, 1, 0.3882353, 1,
-0.22786, -1.605439, -2.140235, 0, 1, 0.3921569, 1,
-0.2275849, 0.8388063, -0.8402439, 0, 1, 0.4, 1,
-0.2216284, 0.9978486, -0.6086082, 0, 1, 0.4078431, 1,
-0.2205167, -0.7852879, -0.8567843, 0, 1, 0.4117647, 1,
-0.2198454, 0.1972087, -2.25308, 0, 1, 0.4196078, 1,
-0.2194469, 0.01653444, -1.379718, 0, 1, 0.4235294, 1,
-0.2172944, 0.397991, -0.9856984, 0, 1, 0.4313726, 1,
-0.2161703, 0.477209, 0.5024362, 0, 1, 0.4352941, 1,
-0.2113837, 0.8272721, -0.7154318, 0, 1, 0.4431373, 1,
-0.2028558, -0.6785981, -2.153264, 0, 1, 0.4470588, 1,
-0.2027393, -0.6775396, -3.906718, 0, 1, 0.454902, 1,
-0.2014849, 0.4940619, -1.253347, 0, 1, 0.4588235, 1,
-0.2002717, -0.469766, -3.22599, 0, 1, 0.4666667, 1,
-0.1999167, -0.1853546, -2.04823, 0, 1, 0.4705882, 1,
-0.192635, -0.1087544, -1.138187, 0, 1, 0.4784314, 1,
-0.188482, 1.499655, -0.584244, 0, 1, 0.4823529, 1,
-0.1876458, 0.3855329, -0.0045214, 0, 1, 0.4901961, 1,
-0.1822836, 0.6433094, -0.1605018, 0, 1, 0.4941176, 1,
-0.1791666, -0.1407191, -1.532431, 0, 1, 0.5019608, 1,
-0.1781712, -0.109614, -3.452318, 0, 1, 0.509804, 1,
-0.177026, -1.097283, -3.523903, 0, 1, 0.5137255, 1,
-0.176369, -0.9530224, -2.6906, 0, 1, 0.5215687, 1,
-0.1735042, 0.2240964, 0.5870202, 0, 1, 0.5254902, 1,
-0.171875, -2.134243, -4.315836, 0, 1, 0.5333334, 1,
-0.1693793, 0.05891852, -2.004622, 0, 1, 0.5372549, 1,
-0.1682223, 0.5607815, -0.9600298, 0, 1, 0.5450981, 1,
-0.1574997, -0.6823243, -2.228878, 0, 1, 0.5490196, 1,
-0.1567869, 1.230096, -2.206883, 0, 1, 0.5568628, 1,
-0.1541875, -1.140939, -2.032418, 0, 1, 0.5607843, 1,
-0.1504337, -1.413492, -3.213344, 0, 1, 0.5686275, 1,
-0.1495691, 0.1765029, -1.173612, 0, 1, 0.572549, 1,
-0.1489585, 0.7324856, -0.1557754, 0, 1, 0.5803922, 1,
-0.1479707, 0.7599199, 1.284069, 0, 1, 0.5843138, 1,
-0.1458075, -2.28658, -3.837883, 0, 1, 0.5921569, 1,
-0.1440619, 0.5216655, -0.8843402, 0, 1, 0.5960785, 1,
-0.1393255, -2.161619, -1.016621, 0, 1, 0.6039216, 1,
-0.1383948, -0.9964243, -3.409405, 0, 1, 0.6117647, 1,
-0.1375075, 0.742163, 0.03555747, 0, 1, 0.6156863, 1,
-0.1332045, 0.09898158, -1.208195, 0, 1, 0.6235294, 1,
-0.1272663, -0.03596771, -1.212816, 0, 1, 0.627451, 1,
-0.1247273, -1.011658, -3.4165, 0, 1, 0.6352941, 1,
-0.1235879, 0.07654915, -1.189896, 0, 1, 0.6392157, 1,
-0.1233408, 0.2221071, 0.7775273, 0, 1, 0.6470588, 1,
-0.1216568, 1.430838, 1.70547, 0, 1, 0.6509804, 1,
-0.1216163, -0.4662509, -1.137602, 0, 1, 0.6588235, 1,
-0.1187083, 0.7237044, -0.4534684, 0, 1, 0.6627451, 1,
-0.1126906, -1.752376, -3.141178, 0, 1, 0.6705883, 1,
-0.1121822, 0.1128588, -1.758095, 0, 1, 0.6745098, 1,
-0.1085267, 0.0390356, -0.9426356, 0, 1, 0.682353, 1,
-0.1080442, 0.9720179, 0.4182082, 0, 1, 0.6862745, 1,
-0.1041451, -0.05795891, -1.691199, 0, 1, 0.6941177, 1,
-0.09706227, -1.134512, -3.216593, 0, 1, 0.7019608, 1,
-0.09590357, -1.392686, -1.889151, 0, 1, 0.7058824, 1,
-0.09494036, -0.4171522, -3.229145, 0, 1, 0.7137255, 1,
-0.08506492, -1.184713, -2.913836, 0, 1, 0.7176471, 1,
-0.08111145, -0.7164738, -4.863894, 0, 1, 0.7254902, 1,
-0.07119586, -2.036547, -4.361069, 0, 1, 0.7294118, 1,
-0.06564236, 0.1978778, 0.07142273, 0, 1, 0.7372549, 1,
-0.05389078, 0.6973234, 0.4204953, 0, 1, 0.7411765, 1,
-0.05202609, 1.301324, 0.3324733, 0, 1, 0.7490196, 1,
-0.05050219, 0.7408232, 1.322374, 0, 1, 0.7529412, 1,
-0.05037104, 0.09549374, -1.333917, 0, 1, 0.7607843, 1,
-0.05033933, 1.311358, 0.5329323, 0, 1, 0.7647059, 1,
-0.04911439, 0.9802171, -1.478466, 0, 1, 0.772549, 1,
-0.04900092, -0.0637971, -3.034798, 0, 1, 0.7764706, 1,
-0.04605699, -0.03035856, -0.8773893, 0, 1, 0.7843137, 1,
-0.04477343, -1.221521, -4.370107, 0, 1, 0.7882353, 1,
-0.04397057, -0.8528937, -3.640998, 0, 1, 0.7960784, 1,
-0.04140121, -0.2732224, -2.241683, 0, 1, 0.8039216, 1,
-0.04092404, 0.4632453, 1.379238, 0, 1, 0.8078431, 1,
-0.03787715, -1.230134, -3.018075, 0, 1, 0.8156863, 1,
-0.03768523, 0.7278137, -0.3959353, 0, 1, 0.8196079, 1,
-0.02839812, 0.6637537, 0.5955026, 0, 1, 0.827451, 1,
-0.02729475, -0.2591319, -2.465248, 0, 1, 0.8313726, 1,
-0.02685807, -0.2843351, -4.065454, 0, 1, 0.8392157, 1,
-0.02339917, 1.073424, 1.634622, 0, 1, 0.8431373, 1,
-0.02281273, 0.5102594, 3.061581, 0, 1, 0.8509804, 1,
-0.02253773, 2.053334, 1.328655, 0, 1, 0.854902, 1,
-0.01847808, 1.476579, 0.2251373, 0, 1, 0.8627451, 1,
-0.01701419, -0.3837025, -4.53376, 0, 1, 0.8666667, 1,
-0.01422121, 0.02399786, 1.623209, 0, 1, 0.8745098, 1,
-0.01042004, -0.1309011, -2.933751, 0, 1, 0.8784314, 1,
-0.008261387, 0.3669026, -0.6672791, 0, 1, 0.8862745, 1,
-0.004400758, -1.065882, -3.261535, 0, 1, 0.8901961, 1,
0.0009828056, 0.09045505, -1.511053, 0, 1, 0.8980392, 1,
0.003348666, 0.3730168, -0.2917956, 0, 1, 0.9058824, 1,
0.004718435, 0.4809225, -0.520728, 0, 1, 0.9098039, 1,
0.0148827, 0.6571783, -0.6634638, 0, 1, 0.9176471, 1,
0.01515114, -0.460433, 3.191273, 0, 1, 0.9215686, 1,
0.01628747, 0.9337432, -0.535434, 0, 1, 0.9294118, 1,
0.01990195, 0.1585027, -0.4688765, 0, 1, 0.9333333, 1,
0.02412579, 0.06184066, -0.2655181, 0, 1, 0.9411765, 1,
0.02530396, -2.300187, 1.772055, 0, 1, 0.945098, 1,
0.02747152, -0.2449002, 4.863704, 0, 1, 0.9529412, 1,
0.02918587, 1.214702, 0.8790879, 0, 1, 0.9568627, 1,
0.0310897, -0.6263291, 1.867099, 0, 1, 0.9647059, 1,
0.03685422, -0.2955881, 3.934628, 0, 1, 0.9686275, 1,
0.03760768, 0.6859857, -0.7549723, 0, 1, 0.9764706, 1,
0.03909387, 0.7154069, -1.197953, 0, 1, 0.9803922, 1,
0.04217607, 0.3119733, 0.4255566, 0, 1, 0.9882353, 1,
0.04486001, 0.160938, -0.7138326, 0, 1, 0.9921569, 1,
0.04939713, -1.403343, 3.037035, 0, 1, 1, 1,
0.05394465, 0.3161798, -0.9176918, 0, 0.9921569, 1, 1,
0.05535668, 1.014045, 2.706551, 0, 0.9882353, 1, 1,
0.05806411, -0.4811607, 2.645939, 0, 0.9803922, 1, 1,
0.05913839, 0.8241592, -0.5765088, 0, 0.9764706, 1, 1,
0.06386706, 1.523703, -0.884007, 0, 0.9686275, 1, 1,
0.06891686, -0.7061374, 2.5288, 0, 0.9647059, 1, 1,
0.07013129, 0.6063548, -0.7857327, 0, 0.9568627, 1, 1,
0.07041822, 0.9902562, 0.1755084, 0, 0.9529412, 1, 1,
0.07153414, 0.6551025, -0.4824597, 0, 0.945098, 1, 1,
0.07330509, 1.026144, 0.1569283, 0, 0.9411765, 1, 1,
0.07475754, 1.33679, -0.7798449, 0, 0.9333333, 1, 1,
0.07566302, 0.9372864, 0.07243501, 0, 0.9294118, 1, 1,
0.07819618, 0.8587521, -1.122027, 0, 0.9215686, 1, 1,
0.08215167, 0.2472925, 0.4583616, 0, 0.9176471, 1, 1,
0.08326566, 0.04440439, 0.9550929, 0, 0.9098039, 1, 1,
0.08353025, 0.2188206, 0.8324785, 0, 0.9058824, 1, 1,
0.08948781, 0.7853374, -0.9679977, 0, 0.8980392, 1, 1,
0.09401765, 0.4024629, 0.8241597, 0, 0.8901961, 1, 1,
0.09427326, 0.4488128, 1.182287, 0, 0.8862745, 1, 1,
0.09563624, -0.1134622, 1.154357, 0, 0.8784314, 1, 1,
0.09906739, -1.361526, 3.217849, 0, 0.8745098, 1, 1,
0.1039046, 0.02029383, 1.250654, 0, 0.8666667, 1, 1,
0.106351, -0.248126, 3.194305, 0, 0.8627451, 1, 1,
0.1068669, 0.03313518, 1.984297, 0, 0.854902, 1, 1,
0.1070289, 0.2442228, -0.1948003, 0, 0.8509804, 1, 1,
0.1073995, 0.03582039, 1.671417, 0, 0.8431373, 1, 1,
0.1075151, 0.7655038, -0.5379051, 0, 0.8392157, 1, 1,
0.1078903, -0.3006862, 1.82446, 0, 0.8313726, 1, 1,
0.1101185, -2.125943, 2.869838, 0, 0.827451, 1, 1,
0.112582, 0.3628092, -0.1459463, 0, 0.8196079, 1, 1,
0.113468, -0.8632857, 1.599262, 0, 0.8156863, 1, 1,
0.1135515, 2.319505, 0.5833366, 0, 0.8078431, 1, 1,
0.1141454, 1.624358, 0.7293633, 0, 0.8039216, 1, 1,
0.1163877, 0.2128196, 1.039581, 0, 0.7960784, 1, 1,
0.116997, -0.1440506, 2.434542, 0, 0.7882353, 1, 1,
0.1186489, 1.143674, 0.7545206, 0, 0.7843137, 1, 1,
0.1205095, -0.7727046, 4.100954, 0, 0.7764706, 1, 1,
0.1231843, -0.02818103, 1.420719, 0, 0.772549, 1, 1,
0.1260176, 1.690495, 0.6482953, 0, 0.7647059, 1, 1,
0.1288643, -0.6123149, 2.888623, 0, 0.7607843, 1, 1,
0.1295898, -0.2910601, 1.7568, 0, 0.7529412, 1, 1,
0.1308469, 0.7935677, 2.34901, 0, 0.7490196, 1, 1,
0.1314685, 1.621411, 0.3472934, 0, 0.7411765, 1, 1,
0.1325486, 0.7682458, -0.4814214, 0, 0.7372549, 1, 1,
0.1336271, -1.169648, 5.393994, 0, 0.7294118, 1, 1,
0.1338241, 0.6312166, 0.08017665, 0, 0.7254902, 1, 1,
0.1338422, 0.8408042, 0.5640402, 0, 0.7176471, 1, 1,
0.1353467, 0.8692876, 1.487691, 0, 0.7137255, 1, 1,
0.1365753, 1.093861, 0.0766462, 0, 0.7058824, 1, 1,
0.1386251, -0.5939626, 3.779076, 0, 0.6980392, 1, 1,
0.141087, -0.06202058, 1.347792, 0, 0.6941177, 1, 1,
0.1474113, 0.4745275, 0.5384331, 0, 0.6862745, 1, 1,
0.1499943, 2.395373, -0.5573573, 0, 0.682353, 1, 1,
0.1505054, -0.9868654, 2.124974, 0, 0.6745098, 1, 1,
0.1576478, -0.2125098, 2.251832, 0, 0.6705883, 1, 1,
0.1577632, 1.15617, 1.492477, 0, 0.6627451, 1, 1,
0.1591258, 0.3232019, -0.9688975, 0, 0.6588235, 1, 1,
0.1606353, -1.581159, 0.4630522, 0, 0.6509804, 1, 1,
0.1626365, 1.41256, 1.641526, 0, 0.6470588, 1, 1,
0.1746611, 1.830051, -1.456947, 0, 0.6392157, 1, 1,
0.1754878, 1.142711, -0.6099979, 0, 0.6352941, 1, 1,
0.1759693, 1.465885, -0.4956129, 0, 0.627451, 1, 1,
0.1778039, -1.75593, 2.370984, 0, 0.6235294, 1, 1,
0.178144, 0.871007, 0.7905194, 0, 0.6156863, 1, 1,
0.1819171, 0.2566802, -0.1856718, 0, 0.6117647, 1, 1,
0.1823534, 1.476387, 0.1877389, 0, 0.6039216, 1, 1,
0.1882039, -0.9481229, 2.272047, 0, 0.5960785, 1, 1,
0.1953749, -0.8298444, 4.161879, 0, 0.5921569, 1, 1,
0.1988649, -0.5598087, 2.5993, 0, 0.5843138, 1, 1,
0.2007631, -1.69345, 2.410606, 0, 0.5803922, 1, 1,
0.2040657, -0.1914296, 1.860863, 0, 0.572549, 1, 1,
0.2119649, 0.4790301, 1.439539, 0, 0.5686275, 1, 1,
0.2137004, -0.5963266, 3.642456, 0, 0.5607843, 1, 1,
0.2148059, -0.3201849, 2.031221, 0, 0.5568628, 1, 1,
0.2167836, 0.234941, 1.560766, 0, 0.5490196, 1, 1,
0.216823, -0.5909278, 3.148514, 0, 0.5450981, 1, 1,
0.2189241, 2.289215, 0.2625051, 0, 0.5372549, 1, 1,
0.2201753, 1.277537, 1.111894, 0, 0.5333334, 1, 1,
0.2216575, 0.03822856, 0.9490171, 0, 0.5254902, 1, 1,
0.2240627, -2.027483, 2.511908, 0, 0.5215687, 1, 1,
0.2249518, 0.5982087, 0.6975926, 0, 0.5137255, 1, 1,
0.228331, 0.04530878, 3.163871, 0, 0.509804, 1, 1,
0.229473, 0.8868186, 0.1460311, 0, 0.5019608, 1, 1,
0.2366364, -0.4343302, 1.392295, 0, 0.4941176, 1, 1,
0.2428009, -1.222969, 6.078348, 0, 0.4901961, 1, 1,
0.2467362, 1.464337, 1.689933, 0, 0.4823529, 1, 1,
0.2478026, -1.247849, 2.426946, 0, 0.4784314, 1, 1,
0.2491994, 0.04520778, 2.616409, 0, 0.4705882, 1, 1,
0.2495955, -1.413169, 2.982183, 0, 0.4666667, 1, 1,
0.2497143, 0.7844002, -1.409504, 0, 0.4588235, 1, 1,
0.2510523, 0.8316227, -0.4220029, 0, 0.454902, 1, 1,
0.2521862, -0.5051137, 2.451509, 0, 0.4470588, 1, 1,
0.2527186, -3.118829, 3.38552, 0, 0.4431373, 1, 1,
0.2539959, 0.1860241, 0.7329493, 0, 0.4352941, 1, 1,
0.2544383, 0.3867346, 1.405645, 0, 0.4313726, 1, 1,
0.256589, 1.200559, -0.9814224, 0, 0.4235294, 1, 1,
0.2594811, -0.3981793, 1.806148, 0, 0.4196078, 1, 1,
0.259977, 0.7611946, 0.9924988, 0, 0.4117647, 1, 1,
0.2643856, -0.1131655, 2.242859, 0, 0.4078431, 1, 1,
0.2652369, -0.3327146, 3.48065, 0, 0.4, 1, 1,
0.2679642, -0.1582619, 1.399317, 0, 0.3921569, 1, 1,
0.2753327, 0.5252387, 2.349666, 0, 0.3882353, 1, 1,
0.2758409, 0.06030547, 0.8779115, 0, 0.3803922, 1, 1,
0.2824542, 1.275495, 1.226112, 0, 0.3764706, 1, 1,
0.2830796, 0.6286813, 0.003126793, 0, 0.3686275, 1, 1,
0.2845255, 0.6818652, -1.262803, 0, 0.3647059, 1, 1,
0.2877231, 0.06179185, 0.4506074, 0, 0.3568628, 1, 1,
0.2892244, -1.617546, 2.634174, 0, 0.3529412, 1, 1,
0.2897849, -0.6441575, 1.495411, 0, 0.345098, 1, 1,
0.2912771, -1.03784, 4.756639, 0, 0.3411765, 1, 1,
0.2927506, -0.3242044, 2.855202, 0, 0.3333333, 1, 1,
0.2969202, 0.3874985, -0.797621, 0, 0.3294118, 1, 1,
0.2973606, 1.621721, 0.180353, 0, 0.3215686, 1, 1,
0.2978403, -0.5749887, 3.5917, 0, 0.3176471, 1, 1,
0.2984697, 0.574188, 0.1646422, 0, 0.3098039, 1, 1,
0.2996598, 0.5019814, 0.4949341, 0, 0.3058824, 1, 1,
0.3036779, -1.602817, 2.396984, 0, 0.2980392, 1, 1,
0.3063557, 0.4711503, 0.7101222, 0, 0.2901961, 1, 1,
0.311734, -0.2617706, 1.905631, 0, 0.2862745, 1, 1,
0.3249141, -0.4749413, 2.718164, 0, 0.2784314, 1, 1,
0.3258741, 0.1080665, 1.202056, 0, 0.2745098, 1, 1,
0.3275054, 1.557322, 1.703602, 0, 0.2666667, 1, 1,
0.3311211, 2.014456, 0.5794381, 0, 0.2627451, 1, 1,
0.334292, -1.105267, 3.076017, 0, 0.254902, 1, 1,
0.3345842, -1.028511, 3.745107, 0, 0.2509804, 1, 1,
0.3358311, -1.772471, 4.760838, 0, 0.2431373, 1, 1,
0.3365042, -0.2703876, 2.516614, 0, 0.2392157, 1, 1,
0.3381467, -0.77803, 2.891382, 0, 0.2313726, 1, 1,
0.3400243, -0.53785, 1.655772, 0, 0.227451, 1, 1,
0.3426319, 1.813928, 1.347571, 0, 0.2196078, 1, 1,
0.3427399, -0.3718155, 3.870137, 0, 0.2156863, 1, 1,
0.3471336, 0.5105075, 2.596104, 0, 0.2078431, 1, 1,
0.3559969, -0.44331, 2.160241, 0, 0.2039216, 1, 1,
0.3576873, 0.8148251, 1.004058, 0, 0.1960784, 1, 1,
0.3589145, -1.23054, 1.9563, 0, 0.1882353, 1, 1,
0.3659472, -1.890591, 5.030209, 0, 0.1843137, 1, 1,
0.3672658, -0.9749846, 3.525054, 0, 0.1764706, 1, 1,
0.3683133, -0.2238326, 4.374096, 0, 0.172549, 1, 1,
0.3789228, -1.603325, 3.434779, 0, 0.1647059, 1, 1,
0.3820634, -0.3107044, 3.291815, 0, 0.1607843, 1, 1,
0.3888844, 1.096145, 2.22796, 0, 0.1529412, 1, 1,
0.3918337, 0.6573013, -0.3274973, 0, 0.1490196, 1, 1,
0.3971386, 0.483739, 0.9494296, 0, 0.1411765, 1, 1,
0.4073552, 0.4341604, 2.190976, 0, 0.1372549, 1, 1,
0.4176687, 0.4547031, 0.2558402, 0, 0.1294118, 1, 1,
0.4184095, 0.4305536, -0.2892168, 0, 0.1254902, 1, 1,
0.4215991, 0.05678614, 1.481362, 0, 0.1176471, 1, 1,
0.4216742, 0.4605238, 1.028973, 0, 0.1137255, 1, 1,
0.4229684, 0.5334985, 2.503964, 0, 0.1058824, 1, 1,
0.4264748, 0.812659, 1.462627, 0, 0.09803922, 1, 1,
0.4330287, -0.8311042, 2.468363, 0, 0.09411765, 1, 1,
0.433733, -1.247186, 3.26411, 0, 0.08627451, 1, 1,
0.437254, 0.9414956, 1.718171, 0, 0.08235294, 1, 1,
0.437414, 0.4142924, 1.969307, 0, 0.07450981, 1, 1,
0.437862, 0.949864, 0.7580769, 0, 0.07058824, 1, 1,
0.4381255, -0.1704267, 1.0646, 0, 0.0627451, 1, 1,
0.4404296, 0.5693258, 0.2138525, 0, 0.05882353, 1, 1,
0.4409295, 0.2512743, 2.070028, 0, 0.05098039, 1, 1,
0.442093, 0.5867084, 1.973107, 0, 0.04705882, 1, 1,
0.4425835, -0.1298182, 3.441049, 0, 0.03921569, 1, 1,
0.4441401, -0.3028278, 1.698358, 0, 0.03529412, 1, 1,
0.447845, 1.23265, 1.687874, 0, 0.02745098, 1, 1,
0.4537613, -1.486093, 1.442612, 0, 0.02352941, 1, 1,
0.4569553, -0.4287706, 2.878809, 0, 0.01568628, 1, 1,
0.4608341, -1.807457, 1.734723, 0, 0.01176471, 1, 1,
0.4628369, -0.129912, 1.671106, 0, 0.003921569, 1, 1,
0.4636626, 0.08966417, 2.334592, 0.003921569, 0, 1, 1,
0.4649716, -0.5870552, 1.692702, 0.007843138, 0, 1, 1,
0.4750377, 0.4017701, 1.69026, 0.01568628, 0, 1, 1,
0.4766085, -0.5317818, 2.105842, 0.01960784, 0, 1, 1,
0.4845685, 1.044131, 1.542588, 0.02745098, 0, 1, 1,
0.4846733, 0.2179433, 1.652004, 0.03137255, 0, 1, 1,
0.4856388, 0.4452881, 0.3153782, 0.03921569, 0, 1, 1,
0.4861686, 0.6374724, 0.8760766, 0.04313726, 0, 1, 1,
0.4864661, 0.2828823, -0.2987769, 0.05098039, 0, 1, 1,
0.4878125, -0.0260344, 0.02544297, 0.05490196, 0, 1, 1,
0.4899762, -0.1387692, 0.7614566, 0.0627451, 0, 1, 1,
0.4911422, 1.071498, 1.651112, 0.06666667, 0, 1, 1,
0.5023723, -0.5470332, 3.978427, 0.07450981, 0, 1, 1,
0.5046054, -0.9696029, 1.281029, 0.07843138, 0, 1, 1,
0.5061831, -0.7444309, 2.105666, 0.08627451, 0, 1, 1,
0.5071303, 0.09513521, 0.003607135, 0.09019608, 0, 1, 1,
0.5079277, 1.058955, -0.22162, 0.09803922, 0, 1, 1,
0.5161017, 0.06914534, 0.6792074, 0.1058824, 0, 1, 1,
0.5203975, -1.138608, 1.943058, 0.1098039, 0, 1, 1,
0.5204337, 0.1686235, 0.7528562, 0.1176471, 0, 1, 1,
0.5218886, -1.251199, 2.350673, 0.1215686, 0, 1, 1,
0.5227731, 0.9880354, 1.271876, 0.1294118, 0, 1, 1,
0.5260411, 0.1033513, 3.517493, 0.1333333, 0, 1, 1,
0.5275366, -0.04982212, 1.664649, 0.1411765, 0, 1, 1,
0.5324324, -0.3905909, 0.2617874, 0.145098, 0, 1, 1,
0.532474, -2.025382, 2.441445, 0.1529412, 0, 1, 1,
0.532998, 1.081951, -0.02100615, 0.1568628, 0, 1, 1,
0.5339602, -0.05925406, -0.512351, 0.1647059, 0, 1, 1,
0.5350525, -0.3888822, 1.894536, 0.1686275, 0, 1, 1,
0.5384449, 0.2503539, 0.1695614, 0.1764706, 0, 1, 1,
0.550742, -0.5483877, -0.539459, 0.1803922, 0, 1, 1,
0.5531074, -0.001079491, 0.1162274, 0.1882353, 0, 1, 1,
0.5590886, 0.1658574, 0.5639072, 0.1921569, 0, 1, 1,
0.5592027, 0.8446987, 2.305256, 0.2, 0, 1, 1,
0.5600846, -0.0527379, 2.29133, 0.2078431, 0, 1, 1,
0.5628877, 0.7650818, 0.5641022, 0.2117647, 0, 1, 1,
0.5644519, 1.353189, -1.470246, 0.2196078, 0, 1, 1,
0.5733882, -0.372032, 2.241787, 0.2235294, 0, 1, 1,
0.5802243, 0.08297957, 1.372732, 0.2313726, 0, 1, 1,
0.5856159, 0.03689026, 3.362505, 0.2352941, 0, 1, 1,
0.5859255, 1.384445, 1.33031, 0.2431373, 0, 1, 1,
0.5899379, -0.9227018, 1.493681, 0.2470588, 0, 1, 1,
0.5905142, 1.144692, 0.0689323, 0.254902, 0, 1, 1,
0.5926618, -0.7590485, 4.804561, 0.2588235, 0, 1, 1,
0.5981082, -1.411372, 0.8162517, 0.2666667, 0, 1, 1,
0.6053467, -0.01308924, 1.705741, 0.2705882, 0, 1, 1,
0.6100832, -0.3590118, 3.319488, 0.2784314, 0, 1, 1,
0.6136286, -0.6548316, 1.219538, 0.282353, 0, 1, 1,
0.6152838, 0.915283, 0.005930009, 0.2901961, 0, 1, 1,
0.6189494, 1.860581, -0.7643829, 0.2941177, 0, 1, 1,
0.6243161, -1.461392, 3.015909, 0.3019608, 0, 1, 1,
0.6243406, 0.9032489, 1.630161, 0.3098039, 0, 1, 1,
0.6245966, -1.087117, 2.09539, 0.3137255, 0, 1, 1,
0.6253377, 0.7157061, 1.239959, 0.3215686, 0, 1, 1,
0.6279809, 0.1229621, 0.823211, 0.3254902, 0, 1, 1,
0.6325745, -0.3929332, 5.031448, 0.3333333, 0, 1, 1,
0.6333433, -0.2585931, 1.111454, 0.3372549, 0, 1, 1,
0.6384157, -0.2030713, 1.05092, 0.345098, 0, 1, 1,
0.6386399, 0.2667206, -0.09488375, 0.3490196, 0, 1, 1,
0.6392263, -0.9445704, 2.597409, 0.3568628, 0, 1, 1,
0.6404079, -0.6981141, 2.496554, 0.3607843, 0, 1, 1,
0.6457412, 0.3501911, 1.496076, 0.3686275, 0, 1, 1,
0.6486137, -2.4189, 4.52578, 0.372549, 0, 1, 1,
0.6498414, 0.09049644, 2.559672, 0.3803922, 0, 1, 1,
0.6505888, -1.150316, 1.98991, 0.3843137, 0, 1, 1,
0.6523449, 1.16429, 0.2139695, 0.3921569, 0, 1, 1,
0.6524905, 0.07260843, 0.9228287, 0.3960784, 0, 1, 1,
0.661265, 0.9033727, -0.6394218, 0.4039216, 0, 1, 1,
0.6640382, 0.3066128, 0.6609743, 0.4117647, 0, 1, 1,
0.6681554, -0.809817, 1.871996, 0.4156863, 0, 1, 1,
0.6688387, 0.4661896, 1.03353, 0.4235294, 0, 1, 1,
0.6709647, -0.3522874, 3.575388, 0.427451, 0, 1, 1,
0.6719133, -0.171232, 0.7458245, 0.4352941, 0, 1, 1,
0.6744984, 0.6280261, 0.1528308, 0.4392157, 0, 1, 1,
0.679502, 1.018287, 1.794065, 0.4470588, 0, 1, 1,
0.6820104, 0.2774415, 2.562609, 0.4509804, 0, 1, 1,
0.6865267, -0.09786122, 2.28966, 0.4588235, 0, 1, 1,
0.6877787, 0.00267929, 1.463327, 0.4627451, 0, 1, 1,
0.6887766, -0.2039492, 0.9556314, 0.4705882, 0, 1, 1,
0.6896255, 0.4961558, 1.998386, 0.4745098, 0, 1, 1,
0.6907698, 1.713944, 1.289716, 0.4823529, 0, 1, 1,
0.6934297, -0.170422, 2.812018, 0.4862745, 0, 1, 1,
0.694277, 0.2132841, 1.9558, 0.4941176, 0, 1, 1,
0.6945285, -1.06035, 2.428594, 0.5019608, 0, 1, 1,
0.6971136, -1.121929, 1.639758, 0.5058824, 0, 1, 1,
0.6985437, 0.2047075, 0.2666731, 0.5137255, 0, 1, 1,
0.7035857, 0.1935816, 3.065178, 0.5176471, 0, 1, 1,
0.705776, -0.6204063, 1.114623, 0.5254902, 0, 1, 1,
0.7080308, 0.4271851, 0.8914044, 0.5294118, 0, 1, 1,
0.7095671, -0.4069505, 1.312755, 0.5372549, 0, 1, 1,
0.7168279, -0.4482973, 2.16581, 0.5411765, 0, 1, 1,
0.7169889, 0.1215943, 3.277739, 0.5490196, 0, 1, 1,
0.7186302, 0.4648605, 0.7576036, 0.5529412, 0, 1, 1,
0.7231014, -1.872596, 2.213575, 0.5607843, 0, 1, 1,
0.7232491, -1.333087, 2.510359, 0.5647059, 0, 1, 1,
0.7243043, 0.06243188, 1.02476, 0.572549, 0, 1, 1,
0.7257067, -0.04962654, 2.319758, 0.5764706, 0, 1, 1,
0.7261686, 1.083221, 1.143341, 0.5843138, 0, 1, 1,
0.7348637, 1.213622, 1.808805, 0.5882353, 0, 1, 1,
0.7393173, -0.2818423, 1.241052, 0.5960785, 0, 1, 1,
0.745765, -1.014824, 2.116534, 0.6039216, 0, 1, 1,
0.7467503, 1.128561, 0.08958553, 0.6078432, 0, 1, 1,
0.7526894, 1.480242, 2.95393, 0.6156863, 0, 1, 1,
0.7604653, 1.371674, 0.4457006, 0.6196079, 0, 1, 1,
0.7606103, -0.7463173, 1.219379, 0.627451, 0, 1, 1,
0.7631779, 0.4020488, 1.528147, 0.6313726, 0, 1, 1,
0.7641134, -1.170573, 3.092225, 0.6392157, 0, 1, 1,
0.773436, 3.005578, -1.154202, 0.6431373, 0, 1, 1,
0.7753481, -1.563256, 3.336889, 0.6509804, 0, 1, 1,
0.7810221, 0.2216531, 3.056792, 0.654902, 0, 1, 1,
0.7842391, 0.2084873, 0.2034831, 0.6627451, 0, 1, 1,
0.7899656, -1.096948, 0.9986647, 0.6666667, 0, 1, 1,
0.7912211, -0.8101359, 2.599637, 0.6745098, 0, 1, 1,
0.794605, -2.8329, 2.741433, 0.6784314, 0, 1, 1,
0.7965581, 0.6731977, 0.3620336, 0.6862745, 0, 1, 1,
0.7976174, -0.3249003, 2.337594, 0.6901961, 0, 1, 1,
0.7979773, -1.079716, 3.250061, 0.6980392, 0, 1, 1,
0.8061557, -2.095796, 3.606441, 0.7058824, 0, 1, 1,
0.8064362, 0.9804776, -0.4025827, 0.7098039, 0, 1, 1,
0.8088035, 0.3695945, -0.5019207, 0.7176471, 0, 1, 1,
0.8169652, -0.4558583, 2.344029, 0.7215686, 0, 1, 1,
0.8176603, 0.6134886, 0.3517137, 0.7294118, 0, 1, 1,
0.8476251, 2.108088, 0.2312756, 0.7333333, 0, 1, 1,
0.8491171, 0.4135081, 1.134155, 0.7411765, 0, 1, 1,
0.8553378, 0.3525824, 1.202889, 0.7450981, 0, 1, 1,
0.8652694, -0.8147532, 2.182416, 0.7529412, 0, 1, 1,
0.8683653, -0.4010633, 1.828538, 0.7568628, 0, 1, 1,
0.8702613, 0.1796909, 1.847728, 0.7647059, 0, 1, 1,
0.8732013, -0.04266417, 1.886337, 0.7686275, 0, 1, 1,
0.876134, -0.3195709, 0.9747338, 0.7764706, 0, 1, 1,
0.8820994, -0.09563886, 0.8480141, 0.7803922, 0, 1, 1,
0.8848019, -1.474827, 1.849536, 0.7882353, 0, 1, 1,
0.8883349, -0.7742081, 1.810301, 0.7921569, 0, 1, 1,
0.888661, -1.056989, 2.776275, 0.8, 0, 1, 1,
0.8918632, -1.520061, 3.159372, 0.8078431, 0, 1, 1,
0.8961529, 1.209076, -0.1507376, 0.8117647, 0, 1, 1,
0.906535, -1.279663, 2.1752, 0.8196079, 0, 1, 1,
0.9069574, -1.326751, 1.815201, 0.8235294, 0, 1, 1,
0.9114398, -1.275513, 2.416606, 0.8313726, 0, 1, 1,
0.9124072, 1.315828, -0.5616925, 0.8352941, 0, 1, 1,
0.9148439, 0.3948022, 0.6524324, 0.8431373, 0, 1, 1,
0.9163761, 0.3667592, 1.886858, 0.8470588, 0, 1, 1,
0.917455, -1.186548, 3.119378, 0.854902, 0, 1, 1,
0.9200795, -0.6363966, 2.235429, 0.8588235, 0, 1, 1,
0.9230967, -0.05827469, 0.743377, 0.8666667, 0, 1, 1,
0.9236826, 1.312262, -1.071641, 0.8705882, 0, 1, 1,
0.9303975, -0.8926579, 3.74148, 0.8784314, 0, 1, 1,
0.9307849, 0.04565652, -0.1620985, 0.8823529, 0, 1, 1,
0.9374918, -0.3572109, 0.1094567, 0.8901961, 0, 1, 1,
0.9490211, 0.4038146, 0.9712732, 0.8941177, 0, 1, 1,
0.9532282, -0.9549233, 5.816828, 0.9019608, 0, 1, 1,
0.9547688, -0.8494671, 1.325974, 0.9098039, 0, 1, 1,
0.9697332, 0.1102872, 1.636867, 0.9137255, 0, 1, 1,
0.9740944, -0.9760622, 1.97932, 0.9215686, 0, 1, 1,
0.9761885, -1.931469, 3.41663, 0.9254902, 0, 1, 1,
0.9780183, -0.5506968, 2.276101, 0.9333333, 0, 1, 1,
0.9810249, -0.7378068, 1.914187, 0.9372549, 0, 1, 1,
0.9869274, 1.339472, -0.1982963, 0.945098, 0, 1, 1,
0.9873379, 0.7709086, 0.05513458, 0.9490196, 0, 1, 1,
0.9948544, 2.902045, 1.483352, 0.9568627, 0, 1, 1,
0.9951987, 0.9635393, 2.0687, 0.9607843, 0, 1, 1,
1.010048, 0.8258937, 0.7081465, 0.9686275, 0, 1, 1,
1.010748, 1.034555, -0.2127179, 0.972549, 0, 1, 1,
1.013603, 0.9599886, 1.299122, 0.9803922, 0, 1, 1,
1.018226, -1.091065, 3.137669, 0.9843137, 0, 1, 1,
1.021573, 0.0005842915, 0.6805668, 0.9921569, 0, 1, 1,
1.022957, -1.976845, 1.86195, 0.9960784, 0, 1, 1,
1.026511, 0.1320921, 1.806567, 1, 0, 0.9960784, 1,
1.027502, -0.1612175, 2.105591, 1, 0, 0.9882353, 1,
1.033133, -1.029269, 4.051174, 1, 0, 0.9843137, 1,
1.041962, -1.498017, 3.351519, 1, 0, 0.9764706, 1,
1.042139, 0.3547835, 1.239678, 1, 0, 0.972549, 1,
1.043346, 0.02879149, 2.057831, 1, 0, 0.9647059, 1,
1.044051, -0.8287669, 2.406879, 1, 0, 0.9607843, 1,
1.044131, -0.3561957, 0.8981221, 1, 0, 0.9529412, 1,
1.046779, 0.8245708, 0.1975196, 1, 0, 0.9490196, 1,
1.046833, 0.8934417, 1.760275, 1, 0, 0.9411765, 1,
1.062997, 0.3985632, 1.112479, 1, 0, 0.9372549, 1,
1.074025, -0.9605156, 2.191247, 1, 0, 0.9294118, 1,
1.076694, -1.388643, 2.572906, 1, 0, 0.9254902, 1,
1.078008, -0.4114217, 3.140794, 1, 0, 0.9176471, 1,
1.079908, 2.240512, 0.4607975, 1, 0, 0.9137255, 1,
1.084014, -1.057198, 1.039706, 1, 0, 0.9058824, 1,
1.086676, -0.7620329, 3.706351, 1, 0, 0.9019608, 1,
1.087357, -1.841289, 3.801564, 1, 0, 0.8941177, 1,
1.090247, -0.8996297, 1.584217, 1, 0, 0.8862745, 1,
1.09659, 0.7084019, 0.2658791, 1, 0, 0.8823529, 1,
1.099464, -0.9094844, 3.631283, 1, 0, 0.8745098, 1,
1.100176, -1.648452, 2.333211, 1, 0, 0.8705882, 1,
1.101873, -0.8349934, 2.166691, 1, 0, 0.8627451, 1,
1.104829, 0.7911618, 0.9879928, 1, 0, 0.8588235, 1,
1.10551, 0.4746636, 0.3535844, 1, 0, 0.8509804, 1,
1.115423, -1.683516, 1.736417, 1, 0, 0.8470588, 1,
1.119084, 0.03181665, 2.612318, 1, 0, 0.8392157, 1,
1.124111, -0.3612893, 2.590561, 1, 0, 0.8352941, 1,
1.137084, -0.3986749, 1.979231, 1, 0, 0.827451, 1,
1.144494, -0.493164, 1.927896, 1, 0, 0.8235294, 1,
1.145692, 0.4092523, 1.887225, 1, 0, 0.8156863, 1,
1.145836, -1.79028, 2.38992, 1, 0, 0.8117647, 1,
1.147651, 0.2297158, 2.241835, 1, 0, 0.8039216, 1,
1.152505, 0.3345316, 4.100936, 1, 0, 0.7960784, 1,
1.162987, -0.8456034, 1.470469, 1, 0, 0.7921569, 1,
1.163458, 0.1050361, 1.949449, 1, 0, 0.7843137, 1,
1.164973, 0.5288599, 1.750633, 1, 0, 0.7803922, 1,
1.165351, 0.7812313, 1.123941, 1, 0, 0.772549, 1,
1.167333, -0.3610699, 2.974938, 1, 0, 0.7686275, 1,
1.16767, -0.009797944, 1.502026, 1, 0, 0.7607843, 1,
1.182187, 1.788895, 1.787173, 1, 0, 0.7568628, 1,
1.189862, 0.3278292, 1.479054, 1, 0, 0.7490196, 1,
1.196206, -1.202488, 1.825838, 1, 0, 0.7450981, 1,
1.197611, -1.030395, 1.913228, 1, 0, 0.7372549, 1,
1.210925, 1.400875, -0.5252799, 1, 0, 0.7333333, 1,
1.215167, -0.3951852, 3.409512, 1, 0, 0.7254902, 1,
1.216588, -2.19921, 3.245528, 1, 0, 0.7215686, 1,
1.218263, -0.5325485, -0.1464685, 1, 0, 0.7137255, 1,
1.223747, 0.9254579, 1.977827, 1, 0, 0.7098039, 1,
1.228191, -0.5514869, 1.307815, 1, 0, 0.7019608, 1,
1.23378, -0.2567156, 0.8630187, 1, 0, 0.6941177, 1,
1.24593, 0.109369, -0.6263024, 1, 0, 0.6901961, 1,
1.249265, -0.6906258, 1.674612, 1, 0, 0.682353, 1,
1.249538, -2.49506, 3.684624, 1, 0, 0.6784314, 1,
1.257011, 1.549314, 0.9038333, 1, 0, 0.6705883, 1,
1.260196, -2.191219, 2.874832, 1, 0, 0.6666667, 1,
1.268469, -1.734574, 2.658944, 1, 0, 0.6588235, 1,
1.271835, 0.4049097, 0.8852752, 1, 0, 0.654902, 1,
1.274456, -0.590744, 1.680153, 1, 0, 0.6470588, 1,
1.279798, 0.2544762, 1.621483, 1, 0, 0.6431373, 1,
1.284321, -0.928094, 2.9136, 1, 0, 0.6352941, 1,
1.285837, -1.434348, 2.314673, 1, 0, 0.6313726, 1,
1.287022, 0.1377556, 2.478412, 1, 0, 0.6235294, 1,
1.292507, -1.011069, 0.495497, 1, 0, 0.6196079, 1,
1.306902, 2.167767, 0.1101189, 1, 0, 0.6117647, 1,
1.316001, 0.573127, 0.9373233, 1, 0, 0.6078432, 1,
1.322855, -0.6447923, 1.467142, 1, 0, 0.6, 1,
1.327238, 0.4829445, 1.173233, 1, 0, 0.5921569, 1,
1.330613, -2.555872, 3.489438, 1, 0, 0.5882353, 1,
1.334899, -0.6880768, 1.786321, 1, 0, 0.5803922, 1,
1.339331, -0.5688565, 3.374537, 1, 0, 0.5764706, 1,
1.343154, -1.862345, 1.414254, 1, 0, 0.5686275, 1,
1.364379, 1.236224, 1.075732, 1, 0, 0.5647059, 1,
1.364485, 0.04391702, 3.842973, 1, 0, 0.5568628, 1,
1.384492, 1.497769, 0.2995547, 1, 0, 0.5529412, 1,
1.392853, -0.6357123, 2.018554, 1, 0, 0.5450981, 1,
1.397205, 0.9645048, -0.04454972, 1, 0, 0.5411765, 1,
1.400749, -0.8349003, 2.541674, 1, 0, 0.5333334, 1,
1.428709, -1.39598, 1.338064, 1, 0, 0.5294118, 1,
1.461564, 0.2703582, 0.08590566, 1, 0, 0.5215687, 1,
1.462621, 1.270638, 0.9991209, 1, 0, 0.5176471, 1,
1.46272, 2.037534, 2.125957, 1, 0, 0.509804, 1,
1.48595, -1.263062, 4.223933, 1, 0, 0.5058824, 1,
1.491372, 0.4199221, 2.271854, 1, 0, 0.4980392, 1,
1.498688, -0.1160241, 0.7284941, 1, 0, 0.4901961, 1,
1.515441, 0.1093778, 1.997615, 1, 0, 0.4862745, 1,
1.533365, -2.080574, 3.82213, 1, 0, 0.4784314, 1,
1.539535, 2.229792, 0.1945624, 1, 0, 0.4745098, 1,
1.539659, 0.9667239, 1.999925, 1, 0, 0.4666667, 1,
1.54022, 1.491601, 0.3521698, 1, 0, 0.4627451, 1,
1.545715, -1.442997, 2.082222, 1, 0, 0.454902, 1,
1.549178, -0.7649459, 2.463093, 1, 0, 0.4509804, 1,
1.554381, -1.763685, 2.498669, 1, 0, 0.4431373, 1,
1.554679, 1.378725, -0.5431022, 1, 0, 0.4392157, 1,
1.574042, 2.063644, 1.97989, 1, 0, 0.4313726, 1,
1.579081, 0.03198364, 0.910059, 1, 0, 0.427451, 1,
1.590532, -0.0213135, 0.3971206, 1, 0, 0.4196078, 1,
1.621799, 1.518782, 0.8668069, 1, 0, 0.4156863, 1,
1.636586, -0.579816, 1.801034, 1, 0, 0.4078431, 1,
1.642096, 0.1295702, 1.523642, 1, 0, 0.4039216, 1,
1.657368, -1.760465, 4.508978, 1, 0, 0.3960784, 1,
1.659929, 0.2560491, 3.829183, 1, 0, 0.3882353, 1,
1.664178, 0.871538, 1.843757, 1, 0, 0.3843137, 1,
1.667515, 0.7036315, -0.3822285, 1, 0, 0.3764706, 1,
1.670969, -0.4738334, 0.7718174, 1, 0, 0.372549, 1,
1.685354, -0.3722553, 2.248357, 1, 0, 0.3647059, 1,
1.696729, -1.567499, 0.8108733, 1, 0, 0.3607843, 1,
1.705453, 1.404209, 1.788234, 1, 0, 0.3529412, 1,
1.706287, 0.9438664, 1.339545, 1, 0, 0.3490196, 1,
1.708828, -1.014912, 1.568484, 1, 0, 0.3411765, 1,
1.715166, -0.8573815, 3.585101, 1, 0, 0.3372549, 1,
1.734549, -0.8903847, 2.549099, 1, 0, 0.3294118, 1,
1.734933, 0.6303713, -0.1628389, 1, 0, 0.3254902, 1,
1.75118, -0.4925531, -0.4155326, 1, 0, 0.3176471, 1,
1.764325, -0.02947701, 2.309609, 1, 0, 0.3137255, 1,
1.775201, 1.361203, 0.3333562, 1, 0, 0.3058824, 1,
1.790717, -0.5855671, 3.189213, 1, 0, 0.2980392, 1,
1.791916, -0.2068279, 2.454553, 1, 0, 0.2941177, 1,
1.802301, 1.282389, 0.9455382, 1, 0, 0.2862745, 1,
1.812141, 0.7419609, 1.611905, 1, 0, 0.282353, 1,
1.812661, 0.6373793, 1.197388, 1, 0, 0.2745098, 1,
1.824117, 1.725304, 1.707406, 1, 0, 0.2705882, 1,
1.832065, 0.01613144, 2.312537, 1, 0, 0.2627451, 1,
1.841609, -0.9158735, 1.615293, 1, 0, 0.2588235, 1,
1.854218, 1.57465, 0.0542765, 1, 0, 0.2509804, 1,
1.866817, 2.881403, 0.9014186, 1, 0, 0.2470588, 1,
1.894967, 2.974958, 0.2145933, 1, 0, 0.2392157, 1,
1.951322, -0.2911212, 0.4619946, 1, 0, 0.2352941, 1,
1.955564, 0.2063966, 2.877839, 1, 0, 0.227451, 1,
1.959427, -0.5022104, 3.412741, 1, 0, 0.2235294, 1,
1.96533, -0.3139235, 2.026683, 1, 0, 0.2156863, 1,
1.986127, 0.2442505, 0.3653734, 1, 0, 0.2117647, 1,
2.01951, 0.190177, 0.339956, 1, 0, 0.2039216, 1,
2.02457, 0.81532, -0.2159219, 1, 0, 0.1960784, 1,
2.050464, 0.08073883, 3.425237, 1, 0, 0.1921569, 1,
2.055791, -0.2561568, -0.3882476, 1, 0, 0.1843137, 1,
2.065388, -0.9739075, 3.135746, 1, 0, 0.1803922, 1,
2.129827, 0.9031421, 0.8913482, 1, 0, 0.172549, 1,
2.13194, 1.94334, -0.2529879, 1, 0, 0.1686275, 1,
2.148038, -0.7786335, 3.088073, 1, 0, 0.1607843, 1,
2.171258, 2.223872, 0.7734725, 1, 0, 0.1568628, 1,
2.174325, 0.06340148, 3.027831, 1, 0, 0.1490196, 1,
2.214955, -1.108177, 3.054272, 1, 0, 0.145098, 1,
2.224157, 0.8816544, 1.716371, 1, 0, 0.1372549, 1,
2.226076, 0.04877158, 1.615345, 1, 0, 0.1333333, 1,
2.241695, 0.2368563, 1.410007, 1, 0, 0.1254902, 1,
2.289955, 0.6862078, 0.6689497, 1, 0, 0.1215686, 1,
2.296681, -1.412081, 1.667282, 1, 0, 0.1137255, 1,
2.349784, 0.8613394, 1.773357, 1, 0, 0.1098039, 1,
2.383294, -0.5414778, 0.2973419, 1, 0, 0.1019608, 1,
2.445446, -0.3394672, 3.473742, 1, 0, 0.09411765, 1,
2.484493, -0.05488726, 0.87467, 1, 0, 0.09019608, 1,
2.501802, -0.5909925, 3.248576, 1, 0, 0.08235294, 1,
2.62987, 0.4847151, 1.664701, 1, 0, 0.07843138, 1,
2.638836, 1.877003, -0.05033617, 1, 0, 0.07058824, 1,
2.645307, 0.2188876, -0.5157239, 1, 0, 0.06666667, 1,
2.654564, -1.122759, 1.78829, 1, 0, 0.05882353, 1,
2.785054, -0.1104783, 0.7911478, 1, 0, 0.05490196, 1,
2.802552, -0.1981974, 1.200483, 1, 0, 0.04705882, 1,
2.876754, -0.3484937, 0.6651771, 1, 0, 0.04313726, 1,
2.920763, -0.1093665, 0.5983891, 1, 0, 0.03529412, 1,
2.935101, -2.04592, 2.997726, 1, 0, 0.03137255, 1,
2.940902, -0.001467202, 3.721994, 1, 0, 0.02352941, 1,
2.964397, -1.02381, 2.954849, 1, 0, 0.01960784, 1,
3.052723, -0.5661991, 1.047051, 1, 0, 0.01176471, 1,
3.574041, 0.04479819, 2.53571, 1, 0, 0.007843138, 1
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
-0.04982185, -4.156917, -6.950742, 0, -0.5, 0.5, 0.5,
-0.04982185, -4.156917, -6.950742, 1, -0.5, 0.5, 0.5,
-0.04982185, -4.156917, -6.950742, 1, 1.5, 0.5, 0.5,
-0.04982185, -4.156917, -6.950742, 0, 1.5, 0.5, 0.5
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
-4.902174, -0.0566256, -6.950742, 0, -0.5, 0.5, 0.5,
-4.902174, -0.0566256, -6.950742, 1, -0.5, 0.5, 0.5,
-4.902174, -0.0566256, -6.950742, 1, 1.5, 0.5, 0.5,
-4.902174, -0.0566256, -6.950742, 0, 1.5, 0.5, 0.5
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
-4.902174, -4.156917, 0.5079803, 0, -0.5, 0.5, 0.5,
-4.902174, -4.156917, 0.5079803, 1, -0.5, 0.5, 0.5,
-4.902174, -4.156917, 0.5079803, 1, 1.5, 0.5, 0.5,
-4.902174, -4.156917, 0.5079803, 0, 1.5, 0.5, 0.5
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
-2, -3.210696, -5.229498,
2, -3.210696, -5.229498,
-2, -3.210696, -5.229498,
-2, -3.368399, -5.516373,
0, -3.210696, -5.229498,
0, -3.368399, -5.516373,
2, -3.210696, -5.229498,
2, -3.368399, -5.516373
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
"0",
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
-2, -3.683806, -6.09012, 0, -0.5, 0.5, 0.5,
-2, -3.683806, -6.09012, 1, -0.5, 0.5, 0.5,
-2, -3.683806, -6.09012, 1, 1.5, 0.5, 0.5,
-2, -3.683806, -6.09012, 0, 1.5, 0.5, 0.5,
0, -3.683806, -6.09012, 0, -0.5, 0.5, 0.5,
0, -3.683806, -6.09012, 1, -0.5, 0.5, 0.5,
0, -3.683806, -6.09012, 1, 1.5, 0.5, 0.5,
0, -3.683806, -6.09012, 0, 1.5, 0.5, 0.5,
2, -3.683806, -6.09012, 0, -0.5, 0.5, 0.5,
2, -3.683806, -6.09012, 1, -0.5, 0.5, 0.5,
2, -3.683806, -6.09012, 1, 1.5, 0.5, 0.5,
2, -3.683806, -6.09012, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.7824, -3, -5.229498,
-3.7824, 3, -5.229498,
-3.7824, -3, -5.229498,
-3.969029, -3, -5.516373,
-3.7824, -2, -5.229498,
-3.969029, -2, -5.516373,
-3.7824, -1, -5.229498,
-3.969029, -1, -5.516373,
-3.7824, 0, -5.229498,
-3.969029, 0, -5.516373,
-3.7824, 1, -5.229498,
-3.969029, 1, -5.516373,
-3.7824, 2, -5.229498,
-3.969029, 2, -5.516373,
-3.7824, 3, -5.229498,
-3.969029, 3, -5.516373
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
-4.342287, -3, -6.09012, 0, -0.5, 0.5, 0.5,
-4.342287, -3, -6.09012, 1, -0.5, 0.5, 0.5,
-4.342287, -3, -6.09012, 1, 1.5, 0.5, 0.5,
-4.342287, -3, -6.09012, 0, 1.5, 0.5, 0.5,
-4.342287, -2, -6.09012, 0, -0.5, 0.5, 0.5,
-4.342287, -2, -6.09012, 1, -0.5, 0.5, 0.5,
-4.342287, -2, -6.09012, 1, 1.5, 0.5, 0.5,
-4.342287, -2, -6.09012, 0, 1.5, 0.5, 0.5,
-4.342287, -1, -6.09012, 0, -0.5, 0.5, 0.5,
-4.342287, -1, -6.09012, 1, -0.5, 0.5, 0.5,
-4.342287, -1, -6.09012, 1, 1.5, 0.5, 0.5,
-4.342287, -1, -6.09012, 0, 1.5, 0.5, 0.5,
-4.342287, 0, -6.09012, 0, -0.5, 0.5, 0.5,
-4.342287, 0, -6.09012, 1, -0.5, 0.5, 0.5,
-4.342287, 0, -6.09012, 1, 1.5, 0.5, 0.5,
-4.342287, 0, -6.09012, 0, 1.5, 0.5, 0.5,
-4.342287, 1, -6.09012, 0, -0.5, 0.5, 0.5,
-4.342287, 1, -6.09012, 1, -0.5, 0.5, 0.5,
-4.342287, 1, -6.09012, 1, 1.5, 0.5, 0.5,
-4.342287, 1, -6.09012, 0, 1.5, 0.5, 0.5,
-4.342287, 2, -6.09012, 0, -0.5, 0.5, 0.5,
-4.342287, 2, -6.09012, 1, -0.5, 0.5, 0.5,
-4.342287, 2, -6.09012, 1, 1.5, 0.5, 0.5,
-4.342287, 2, -6.09012, 0, 1.5, 0.5, 0.5,
-4.342287, 3, -6.09012, 0, -0.5, 0.5, 0.5,
-4.342287, 3, -6.09012, 1, -0.5, 0.5, 0.5,
-4.342287, 3, -6.09012, 1, 1.5, 0.5, 0.5,
-4.342287, 3, -6.09012, 0, 1.5, 0.5, 0.5
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
-3.7824, -3.210696, -4,
-3.7824, -3.210696, 6,
-3.7824, -3.210696, -4,
-3.969029, -3.368399, -4,
-3.7824, -3.210696, -2,
-3.969029, -3.368399, -2,
-3.7824, -3.210696, 0,
-3.969029, -3.368399, 0,
-3.7824, -3.210696, 2,
-3.969029, -3.368399, 2,
-3.7824, -3.210696, 4,
-3.969029, -3.368399, 4,
-3.7824, -3.210696, 6,
-3.969029, -3.368399, 6
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
-4.342287, -3.683806, -4, 0, -0.5, 0.5, 0.5,
-4.342287, -3.683806, -4, 1, -0.5, 0.5, 0.5,
-4.342287, -3.683806, -4, 1, 1.5, 0.5, 0.5,
-4.342287, -3.683806, -4, 0, 1.5, 0.5, 0.5,
-4.342287, -3.683806, -2, 0, -0.5, 0.5, 0.5,
-4.342287, -3.683806, -2, 1, -0.5, 0.5, 0.5,
-4.342287, -3.683806, -2, 1, 1.5, 0.5, 0.5,
-4.342287, -3.683806, -2, 0, 1.5, 0.5, 0.5,
-4.342287, -3.683806, 0, 0, -0.5, 0.5, 0.5,
-4.342287, -3.683806, 0, 1, -0.5, 0.5, 0.5,
-4.342287, -3.683806, 0, 1, 1.5, 0.5, 0.5,
-4.342287, -3.683806, 0, 0, 1.5, 0.5, 0.5,
-4.342287, -3.683806, 2, 0, -0.5, 0.5, 0.5,
-4.342287, -3.683806, 2, 1, -0.5, 0.5, 0.5,
-4.342287, -3.683806, 2, 1, 1.5, 0.5, 0.5,
-4.342287, -3.683806, 2, 0, 1.5, 0.5, 0.5,
-4.342287, -3.683806, 4, 0, -0.5, 0.5, 0.5,
-4.342287, -3.683806, 4, 1, -0.5, 0.5, 0.5,
-4.342287, -3.683806, 4, 1, 1.5, 0.5, 0.5,
-4.342287, -3.683806, 4, 0, 1.5, 0.5, 0.5,
-4.342287, -3.683806, 6, 0, -0.5, 0.5, 0.5,
-4.342287, -3.683806, 6, 1, -0.5, 0.5, 0.5,
-4.342287, -3.683806, 6, 1, 1.5, 0.5, 0.5,
-4.342287, -3.683806, 6, 0, 1.5, 0.5, 0.5
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
-3.7824, -3.210696, -5.229498,
-3.7824, 3.097444, -5.229498,
-3.7824, -3.210696, 6.245459,
-3.7824, 3.097444, 6.245459,
-3.7824, -3.210696, -5.229498,
-3.7824, -3.210696, 6.245459,
-3.7824, 3.097444, -5.229498,
-3.7824, 3.097444, 6.245459,
-3.7824, -3.210696, -5.229498,
3.682757, -3.210696, -5.229498,
-3.7824, -3.210696, 6.245459,
3.682757, -3.210696, 6.245459,
-3.7824, 3.097444, -5.229498,
3.682757, 3.097444, -5.229498,
-3.7824, 3.097444, 6.245459,
3.682757, 3.097444, 6.245459,
3.682757, -3.210696, -5.229498,
3.682757, 3.097444, -5.229498,
3.682757, -3.210696, 6.245459,
3.682757, 3.097444, 6.245459,
3.682757, -3.210696, -5.229498,
3.682757, -3.210696, 6.245459,
3.682757, 3.097444, -5.229498,
3.682757, 3.097444, 6.245459
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
var radius = 8.048699;
var distance = 35.80957;
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
mvMatrix.translate( 0.04982185, 0.0566256, -0.5079803 );
mvMatrix.scale( 1.165737, 1.379553, 0.7583828 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.80957);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
dimepiperate<-read.table("dimepiperate.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-dimepiperate$V2
```

```
## Error in eval(expr, envir, enclos): object 'dimepiperate' not found
```

```r
y<-dimepiperate$V3
```

```
## Error in eval(expr, envir, enclos): object 'dimepiperate' not found
```

```r
z<-dimepiperate$V4
```

```
## Error in eval(expr, envir, enclos): object 'dimepiperate' not found
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
-3.673685, -1.350255, -1.3082, 0, 0, 1, 1, 1,
-2.91952, 0.2530061, -2.337909, 1, 0, 0, 1, 1,
-2.736038, -1.232404, -0.8540759, 1, 0, 0, 1, 1,
-2.627896, -0.7286248, -2.880038, 1, 0, 0, 1, 1,
-2.477013, 1.584048, -0.6772287, 1, 0, 0, 1, 1,
-2.466583, 0.7944202, -1.666032, 1, 0, 0, 1, 1,
-2.466345, -0.8065231, -3.024888, 0, 0, 0, 1, 1,
-2.435335, -0.8302537, -0.9559296, 0, 0, 0, 1, 1,
-2.35678, -1.764978, -1.677089, 0, 0, 0, 1, 1,
-2.321407, 1.028666, 0.4218612, 0, 0, 0, 1, 1,
-2.301539, -0.3244183, -2.131665, 0, 0, 0, 1, 1,
-2.298361, -0.9743086, -1.197154, 0, 0, 0, 1, 1,
-2.297942, -0.2403544, -1.281313, 0, 0, 0, 1, 1,
-2.254028, -1.097518, -2.514137, 1, 1, 1, 1, 1,
-2.128003, -2.128788, -3.904546, 1, 1, 1, 1, 1,
-2.088187, -0.9247462, -3.07286, 1, 1, 1, 1, 1,
-2.049539, -0.6575201, -1.560377, 1, 1, 1, 1, 1,
-2.037915, -1.231475, 0.2792352, 1, 1, 1, 1, 1,
-2.033056, -1.943528, -1.567845, 1, 1, 1, 1, 1,
-2.029651, -0.3841628, -0.2960672, 1, 1, 1, 1, 1,
-2.018132, 0.1038228, -1.110486, 1, 1, 1, 1, 1,
-2.012303, -1.805828, -1.510754, 1, 1, 1, 1, 1,
-2.009536, 0.6896569, -0.740992, 1, 1, 1, 1, 1,
-1.936015, 1.201159, -0.3545445, 1, 1, 1, 1, 1,
-1.932943, 0.2363517, 0.4587743, 1, 1, 1, 1, 1,
-1.897251, -1.529018, -1.45649, 1, 1, 1, 1, 1,
-1.884159, 0.3648228, 1.148703, 1, 1, 1, 1, 1,
-1.860246, 0.1837244, -0.0181896, 1, 1, 1, 1, 1,
-1.854554, -0.06901543, -2.25905, 0, 0, 1, 1, 1,
-1.848787, 0.5698484, -1.616342, 1, 0, 0, 1, 1,
-1.838433, 1.062689, 0.2359769, 1, 0, 0, 1, 1,
-1.819841, -2.380219, -3.38089, 1, 0, 0, 1, 1,
-1.809127, -0.2412824, -1.872519, 1, 0, 0, 1, 1,
-1.807361, 1.702934, -1.649519, 1, 0, 0, 1, 1,
-1.800144, 0.355009, -2.226807, 0, 0, 0, 1, 1,
-1.778503, 0.2020629, -0.3460582, 0, 0, 0, 1, 1,
-1.745228, 0.1516752, -3.276784, 0, 0, 0, 1, 1,
-1.742875, 0.3663032, -0.1947127, 0, 0, 0, 1, 1,
-1.732473, -2.020185, -2.754272, 0, 0, 0, 1, 1,
-1.731741, 0.9578387, -1.099236, 0, 0, 0, 1, 1,
-1.721867, 0.4206151, -0.8667369, 0, 0, 0, 1, 1,
-1.712119, -0.4184404, -2.284656, 1, 1, 1, 1, 1,
-1.698075, 0.6078647, -0.8039719, 1, 1, 1, 1, 1,
-1.684741, -1.560619, -1.901673, 1, 1, 1, 1, 1,
-1.683248, -0.1380819, -0.7961674, 1, 1, 1, 1, 1,
-1.668404, 1.077108, -2.199881, 1, 1, 1, 1, 1,
-1.651702, -0.04248958, -0.9375569, 1, 1, 1, 1, 1,
-1.648212, 0.5619581, -0.5398968, 1, 1, 1, 1, 1,
-1.647726, -0.8367552, -1.540407, 1, 1, 1, 1, 1,
-1.637096, -1.120018, -2.932129, 1, 1, 1, 1, 1,
-1.631389, -0.3218708, -3.323973, 1, 1, 1, 1, 1,
-1.623177, 0.6364704, -0.3734732, 1, 1, 1, 1, 1,
-1.62311, -0.7822784, -3.367775, 1, 1, 1, 1, 1,
-1.60397, 0.9684385, -0.4024414, 1, 1, 1, 1, 1,
-1.594611, 0.2018448, -1.879463, 1, 1, 1, 1, 1,
-1.587467, -2.467349, -1.795419, 1, 1, 1, 1, 1,
-1.586193, 0.203425, 0.4662257, 0, 0, 1, 1, 1,
-1.566522, -0.3033539, -0.5282606, 1, 0, 0, 1, 1,
-1.559339, 1.440215, -1.457009, 1, 0, 0, 1, 1,
-1.546324, 0.5578946, -1.005981, 1, 0, 0, 1, 1,
-1.54436, 0.8079914, 0.2830555, 1, 0, 0, 1, 1,
-1.536733, 0.5548006, -2.60003, 1, 0, 0, 1, 1,
-1.527677, -0.2960656, -1.656226, 0, 0, 0, 1, 1,
-1.524676, -0.5721271, -1.86535, 0, 0, 0, 1, 1,
-1.513869, -1.88597, -3.48681, 0, 0, 0, 1, 1,
-1.510204, -0.1667394, -3.292501, 0, 0, 0, 1, 1,
-1.50905, 0.3355879, 0.2878962, 0, 0, 0, 1, 1,
-1.498021, -0.7350334, -1.225938, 0, 0, 0, 1, 1,
-1.492833, 1.186193, -0.017013, 0, 0, 0, 1, 1,
-1.487779, -1.590506, -3.182614, 1, 1, 1, 1, 1,
-1.455834, 0.368116, -0.6200147, 1, 1, 1, 1, 1,
-1.446757, 1.244502, -0.721976, 1, 1, 1, 1, 1,
-1.43352, -1.583794, -1.398462, 1, 1, 1, 1, 1,
-1.429719, 0.3291498, -0.7101006, 1, 1, 1, 1, 1,
-1.427398, -0.900065, -2.026072, 1, 1, 1, 1, 1,
-1.401082, -0.08068509, -2.103623, 1, 1, 1, 1, 1,
-1.399456, 0.2748157, -0.8178806, 1, 1, 1, 1, 1,
-1.393288, -1.35031, -1.779078, 1, 1, 1, 1, 1,
-1.389951, 0.4134283, -0.6961976, 1, 1, 1, 1, 1,
-1.37487, 0.3135639, -2.046681, 1, 1, 1, 1, 1,
-1.371426, -0.3618817, -3.57697, 1, 1, 1, 1, 1,
-1.357741, -0.4241383, -2.578777, 1, 1, 1, 1, 1,
-1.350972, -0.27136, -2.717765, 1, 1, 1, 1, 1,
-1.349509, 1.441517, -0.01002892, 1, 1, 1, 1, 1,
-1.340128, -1.694858, -1.635044, 0, 0, 1, 1, 1,
-1.314314, -1.163698, -3.103703, 1, 0, 0, 1, 1,
-1.295495, 0.9291095, 1.488225, 1, 0, 0, 1, 1,
-1.276312, -0.3208046, 0.2894985, 1, 0, 0, 1, 1,
-1.274206, 0.2771602, -2.525779, 1, 0, 0, 1, 1,
-1.269181, 0.1084683, -2.847085, 1, 0, 0, 1, 1,
-1.26476, -1.573515, -2.951161, 0, 0, 0, 1, 1,
-1.261234, 0.2086267, -3.126351, 0, 0, 0, 1, 1,
-1.259908, 1.074892, 1.757023, 0, 0, 0, 1, 1,
-1.25968, -0.4087947, -2.685382, 0, 0, 0, 1, 1,
-1.256772, -2.01583, -3.464309, 0, 0, 0, 1, 1,
-1.254712, -1.620695, -1.238201, 0, 0, 0, 1, 1,
-1.253709, 0.7672232, -2.747005, 0, 0, 0, 1, 1,
-1.238492, 0.09722698, -2.966534, 1, 1, 1, 1, 1,
-1.234333, -0.3791888, -1.990532, 1, 1, 1, 1, 1,
-1.22484, 0.2031729, 0.133307, 1, 1, 1, 1, 1,
-1.224019, -1.767748, -3.640781, 1, 1, 1, 1, 1,
-1.20893, 2.02746, -0.4619007, 1, 1, 1, 1, 1,
-1.196488, 1.304808, -0.4776488, 1, 1, 1, 1, 1,
-1.191622, -1.308228, -3.127057, 1, 1, 1, 1, 1,
-1.189242, 0.1913862, -0.4856652, 1, 1, 1, 1, 1,
-1.187804, -0.7200732, -3.207084, 1, 1, 1, 1, 1,
-1.184509, 0.3475056, -1.483341, 1, 1, 1, 1, 1,
-1.17779, -0.8522663, -2.055177, 1, 1, 1, 1, 1,
-1.175356, 2.02526, -0.1207636, 1, 1, 1, 1, 1,
-1.17279, -1.262696, -1.186231, 1, 1, 1, 1, 1,
-1.169608, -0.4859277, -2.79353, 1, 1, 1, 1, 1,
-1.167748, 0.5832313, 0.1918624, 1, 1, 1, 1, 1,
-1.161711, -1.191692, -3.352551, 0, 0, 1, 1, 1,
-1.160647, 2.507827, 0.3626533, 1, 0, 0, 1, 1,
-1.160057, 1.144836, -0.01773531, 1, 0, 0, 1, 1,
-1.152992, -1.336292, -2.72891, 1, 0, 0, 1, 1,
-1.147761, 1.079897, 0.4481788, 1, 0, 0, 1, 1,
-1.143999, 0.1027166, -2.053737, 1, 0, 0, 1, 1,
-1.139273, -1.691525, -2.247181, 0, 0, 0, 1, 1,
-1.137927, -0.404166, -1.951802, 0, 0, 0, 1, 1,
-1.131093, -1.355362, -0.7325546, 0, 0, 0, 1, 1,
-1.128527, -0.9393668, -0.7811805, 0, 0, 0, 1, 1,
-1.122409, -0.1035876, -2.70788, 0, 0, 0, 1, 1,
-1.122097, -0.5891495, -3.103879, 0, 0, 0, 1, 1,
-1.115231, 1.067923, -1.841701, 0, 0, 0, 1, 1,
-1.112542, -0.5290188, 0.538135, 1, 1, 1, 1, 1,
-1.109393, -0.6681069, -2.20159, 1, 1, 1, 1, 1,
-1.108361, 1.559739, -0.989436, 1, 1, 1, 1, 1,
-1.106904, -1.240443, -3.380208, 1, 1, 1, 1, 1,
-1.100571, -1.553931, -3.256691, 1, 1, 1, 1, 1,
-1.097176, 0.06714553, -1.751892, 1, 1, 1, 1, 1,
-1.087469, -0.8904917, -2.498288, 1, 1, 1, 1, 1,
-1.086701, -0.2867774, -1.387869, 1, 1, 1, 1, 1,
-1.084867, 1.055147, 0.7303174, 1, 1, 1, 1, 1,
-1.083726, 2.38513, 0.2716965, 1, 1, 1, 1, 1,
-1.081358, 0.4015377, -1.893497, 1, 1, 1, 1, 1,
-1.078667, 0.6253013, -0.8888536, 1, 1, 1, 1, 1,
-1.076966, 0.3718835, -0.7662407, 1, 1, 1, 1, 1,
-1.07342, -0.4869645, -2.837314, 1, 1, 1, 1, 1,
-1.066734, -1.752657, -3.420388, 1, 1, 1, 1, 1,
-1.065668, 0.7998778, -2.42791, 0, 0, 1, 1, 1,
-1.064883, -1.102133, -2.176668, 1, 0, 0, 1, 1,
-1.062792, -0.1841177, -1.215336, 1, 0, 0, 1, 1,
-1.050416, -1.747626, -2.681489, 1, 0, 0, 1, 1,
-1.0484, -0.7124807, -2.422639, 1, 0, 0, 1, 1,
-1.045402, -0.1943371, -1.918662, 1, 0, 0, 1, 1,
-1.043668, -0.8594923, -1.619228, 0, 0, 0, 1, 1,
-1.037067, 0.511905, -1.366784, 0, 0, 0, 1, 1,
-1.036207, 0.350414, -0.1849539, 0, 0, 0, 1, 1,
-1.033564, -0.3019377, -3.57295, 0, 0, 0, 1, 1,
-1.031723, 1.484391, -0.7014816, 0, 0, 0, 1, 1,
-1.025219, -0.7377687, -1.597164, 0, 0, 0, 1, 1,
-1.024197, 1.73031, -1.580924, 0, 0, 0, 1, 1,
-1.019444, 0.09635108, -2.153626, 1, 1, 1, 1, 1,
-1.019017, 1.63766, -0.8358403, 1, 1, 1, 1, 1,
-1.016246, 0.6332585, -0.9147561, 1, 1, 1, 1, 1,
-1.016147, 1.576364, -0.99126, 1, 1, 1, 1, 1,
-1.012098, -0.2072233, -2.544347, 1, 1, 1, 1, 1,
-1.005599, 1.020537, -1.424674, 1, 1, 1, 1, 1,
-1.000333, -0.05879519, -1.260497, 1, 1, 1, 1, 1,
-0.9970722, 0.6035388, -0.6394346, 1, 1, 1, 1, 1,
-0.9953737, -0.4936364, -1.045336, 1, 1, 1, 1, 1,
-0.993937, -1.611459, -3.312655, 1, 1, 1, 1, 1,
-0.9911507, -0.2187639, -0.4797199, 1, 1, 1, 1, 1,
-0.9896584, 0.9743692, -1.823763, 1, 1, 1, 1, 1,
-0.9875178, -0.9207119, -4.336063, 1, 1, 1, 1, 1,
-0.9812165, 0.5686042, -1.027518, 1, 1, 1, 1, 1,
-0.9767863, -0.048274, -1.020779, 1, 1, 1, 1, 1,
-0.972607, 0.6180876, 0.86257, 0, 0, 1, 1, 1,
-0.9714518, -0.756943, -1.546549, 1, 0, 0, 1, 1,
-0.969775, 0.9399354, -0.8519003, 1, 0, 0, 1, 1,
-0.9648942, 1.834997, -0.8318579, 1, 0, 0, 1, 1,
-0.963282, -1.056789, -0.9247096, 1, 0, 0, 1, 1,
-0.951752, -1.969802, -4.893635, 1, 0, 0, 1, 1,
-0.9492533, -0.2044016, -1.773061, 0, 0, 0, 1, 1,
-0.946604, -1.027149, -2.803862, 0, 0, 0, 1, 1,
-0.946438, -1.113848, -2.612305, 0, 0, 0, 1, 1,
-0.9436253, 1.010796, -2.180702, 0, 0, 0, 1, 1,
-0.9367616, -0.1197223, -0.3075663, 0, 0, 0, 1, 1,
-0.9331437, -0.6885445, -3.591519, 0, 0, 0, 1, 1,
-0.9331407, -0.369024, -2.058766, 0, 0, 0, 1, 1,
-0.9319764, -0.2444129, -1.877958, 1, 1, 1, 1, 1,
-0.9074618, 1.979666, -0.5016382, 1, 1, 1, 1, 1,
-0.9072557, -1.294947, -3.635694, 1, 1, 1, 1, 1,
-0.9057094, -0.6914795, -2.310086, 1, 1, 1, 1, 1,
-0.9042037, -0.141824, -1.901452, 1, 1, 1, 1, 1,
-0.8989151, -0.08100764, -1.319699, 1, 1, 1, 1, 1,
-0.8975537, -1.542282, -1.919698, 1, 1, 1, 1, 1,
-0.8951237, -0.3684949, -2.57257, 1, 1, 1, 1, 1,
-0.887809, 0.1939264, -1.219038, 1, 1, 1, 1, 1,
-0.8835828, -0.7083033, -1.535953, 1, 1, 1, 1, 1,
-0.8783991, -0.7651863, -1.812512, 1, 1, 1, 1, 1,
-0.8734336, 0.2376274, -1.827643, 1, 1, 1, 1, 1,
-0.8676703, -0.8442686, -3.451147, 1, 1, 1, 1, 1,
-0.8643932, -2.094112, -1.46887, 1, 1, 1, 1, 1,
-0.8603599, 1.058578, -1.437248, 1, 1, 1, 1, 1,
-0.8501531, 2.414005, 0.4147162, 0, 0, 1, 1, 1,
-0.8453678, -0.3036775, -3.478107, 1, 0, 0, 1, 1,
-0.8446917, -0.1989898, -1.729924, 1, 0, 0, 1, 1,
-0.8421828, -1.343196, -2.741487, 1, 0, 0, 1, 1,
-0.8405373, -0.09113044, -0.5709608, 1, 0, 0, 1, 1,
-0.835366, 0.7360064, -1.035923, 1, 0, 0, 1, 1,
-0.8247315, -0.4507533, -1.383308, 0, 0, 0, 1, 1,
-0.8225208, 0.1499154, -1.460359, 0, 0, 0, 1, 1,
-0.8126801, 1.090598, -1.084429, 0, 0, 0, 1, 1,
-0.8117368, 0.1764495, -1.627291, 0, 0, 0, 1, 1,
-0.8066983, -1.718835, -4.543192, 0, 0, 0, 1, 1,
-0.8043486, -0.1411311, -1.946509, 0, 0, 0, 1, 1,
-0.799837, 0.434553, -1.33612, 0, 0, 0, 1, 1,
-0.7956827, -0.5404438, -3.294596, 1, 1, 1, 1, 1,
-0.7915305, 1.351956, -0.6848379, 1, 1, 1, 1, 1,
-0.7908649, 0.2336307, -3.772351, 1, 1, 1, 1, 1,
-0.786208, 0.4539762, -0.5450107, 1, 1, 1, 1, 1,
-0.779236, -0.5044367, -0.5628725, 1, 1, 1, 1, 1,
-0.7782376, -0.840745, -1.450748, 1, 1, 1, 1, 1,
-0.7762147, -0.03348396, -1.146849, 1, 1, 1, 1, 1,
-0.7754598, 0.227937, -1.556988, 1, 1, 1, 1, 1,
-0.7726589, 1.706721, 0.1249317, 1, 1, 1, 1, 1,
-0.7660766, 1.51294, 0.1289362, 1, 1, 1, 1, 1,
-0.7652416, 2.651678, -1.582508, 1, 1, 1, 1, 1,
-0.7650905, -0.2832927, -2.018343, 1, 1, 1, 1, 1,
-0.7586237, 1.038104, -0.4218678, 1, 1, 1, 1, 1,
-0.7579669, 1.597158, -0.06286277, 1, 1, 1, 1, 1,
-0.7496877, -0.386531, -3.666629, 1, 1, 1, 1, 1,
-0.7490863, -0.593257, -2.318922, 0, 0, 1, 1, 1,
-0.7409705, -1.217623, -3.240945, 1, 0, 0, 1, 1,
-0.7351155, -0.007295221, -2.374457, 1, 0, 0, 1, 1,
-0.7335171, -1.534721, -2.299685, 1, 0, 0, 1, 1,
-0.7317871, -2.179899, -3.229039, 1, 0, 0, 1, 1,
-0.7296691, 0.9405642, -1.356109, 1, 0, 0, 1, 1,
-0.7223147, 0.1148921, -0.6020864, 0, 0, 0, 1, 1,
-0.7192745, 1.568962, -1.072994, 0, 0, 0, 1, 1,
-0.7169718, 0.1303317, -0.1482371, 0, 0, 0, 1, 1,
-0.7134472, 0.1615135, -2.626354, 0, 0, 0, 1, 1,
-0.7110932, 0.6608395, -0.2186967, 0, 0, 0, 1, 1,
-0.7063515, -0.2754094, -2.232027, 0, 0, 0, 1, 1,
-0.6944496, 0.2810552, -0.7272825, 0, 0, 0, 1, 1,
-0.6930243, -0.8392216, -1.109767, 1, 1, 1, 1, 1,
-0.6908974, 1.232486, -1.767532, 1, 1, 1, 1, 1,
-0.6890505, -1.234623, 0.02188936, 1, 1, 1, 1, 1,
-0.6867079, 0.2637713, -1.246035, 1, 1, 1, 1, 1,
-0.6783735, -2.278473, -2.751915, 1, 1, 1, 1, 1,
-0.6783677, 1.317486, 0.8287465, 1, 1, 1, 1, 1,
-0.6773129, 1.159904, -0.8820187, 1, 1, 1, 1, 1,
-0.6734854, 0.00156359, -1.487725, 1, 1, 1, 1, 1,
-0.6729231, 1.614235, -0.1722286, 1, 1, 1, 1, 1,
-0.6713677, -0.5092471, -1.574107, 1, 1, 1, 1, 1,
-0.6698927, -2.127688, -3.031455, 1, 1, 1, 1, 1,
-0.6690682, 0.1185351, -0.9050374, 1, 1, 1, 1, 1,
-0.6651946, 1.043413, -1.356432, 1, 1, 1, 1, 1,
-0.6646153, 1.363067, -1.126076, 1, 1, 1, 1, 1,
-0.6612548, 1.917329, -0.6197844, 1, 1, 1, 1, 1,
-0.6548034, 0.3254583, 0.07300601, 0, 0, 1, 1, 1,
-0.6536599, 0.8825625, -2.124457, 1, 0, 0, 1, 1,
-0.6440678, 0.8432415, -1.800075, 1, 0, 0, 1, 1,
-0.6421492, -0.9500457, -2.830025, 1, 0, 0, 1, 1,
-0.6418912, 0.004556168, -2.233519, 1, 0, 0, 1, 1,
-0.637399, -0.1634703, -1.838756, 1, 0, 0, 1, 1,
-0.6371509, -0.1872384, -1.253698, 0, 0, 0, 1, 1,
-0.6350894, -1.337709, -2.390689, 0, 0, 0, 1, 1,
-0.6297567, -1.209446, -4.485882, 0, 0, 0, 1, 1,
-0.6272908, 1.603833, 0.4720234, 0, 0, 0, 1, 1,
-0.6272737, 0.03066008, -2.272994, 0, 0, 0, 1, 1,
-0.6227881, -1.096752, -2.844701, 0, 0, 0, 1, 1,
-0.6197582, -0.07713883, -0.1405552, 0, 0, 0, 1, 1,
-0.6179978, 2.234095, 0.4317787, 1, 1, 1, 1, 1,
-0.6143581, -0.5017368, -2.720949, 1, 1, 1, 1, 1,
-0.6084739, -0.7505392, -2.200753, 1, 1, 1, 1, 1,
-0.6065114, 0.5939416, -0.980718, 1, 1, 1, 1, 1,
-0.6039345, -0.3179407, -1.297414, 1, 1, 1, 1, 1,
-0.6012095, -0.4791582, -0.9888655, 1, 1, 1, 1, 1,
-0.5998995, -0.2691342, -2.494592, 1, 1, 1, 1, 1,
-0.5992607, -0.2376645, -1.305605, 1, 1, 1, 1, 1,
-0.5991503, 1.04045, -0.7538099, 1, 1, 1, 1, 1,
-0.5981538, -0.8275478, -3.632633, 1, 1, 1, 1, 1,
-0.5957118, 1.132506, -0.2310176, 1, 1, 1, 1, 1,
-0.5953392, 0.2044452, -1.533306, 1, 1, 1, 1, 1,
-0.591556, 0.9843154, -0.2306657, 1, 1, 1, 1, 1,
-0.5911822, 0.7345312, -0.6190341, 1, 1, 1, 1, 1,
-0.5861233, 1.099696, -1.03598, 1, 1, 1, 1, 1,
-0.5853169, 1.969427, -0.4322081, 0, 0, 1, 1, 1,
-0.5811751, -1.522939, -3.574078, 1, 0, 0, 1, 1,
-0.5808827, -0.5941157, -3.702431, 1, 0, 0, 1, 1,
-0.5798194, 0.4389153, 0.967565, 1, 0, 0, 1, 1,
-0.5794871, -1.612804, -2.455638, 1, 0, 0, 1, 1,
-0.5793849, 0.8182644, -1.980453, 1, 0, 0, 1, 1,
-0.5788062, 1.953788, 0.5045803, 0, 0, 0, 1, 1,
-0.5703779, 0.3778896, -1.05096, 0, 0, 0, 1, 1,
-0.5703367, 1.072373, -0.7053727, 0, 0, 0, 1, 1,
-0.568413, 0.9239053, -0.4279015, 0, 0, 0, 1, 1,
-0.5654491, -0.2308547, -1.662301, 0, 0, 0, 1, 1,
-0.5649744, -0.6044693, -1.253997, 0, 0, 0, 1, 1,
-0.5618269, 0.6395803, -1.1825, 0, 0, 0, 1, 1,
-0.5613536, 0.3896684, 0.737138, 1, 1, 1, 1, 1,
-0.5604907, 1.009751, -0.7970472, 1, 1, 1, 1, 1,
-0.5560716, 0.7626551, -1.397871, 1, 1, 1, 1, 1,
-0.5552636, -2.027153, -1.22833, 1, 1, 1, 1, 1,
-0.5538427, 1.731016, -0.288134, 1, 1, 1, 1, 1,
-0.553537, 0.2058148, 0.1323428, 1, 1, 1, 1, 1,
-0.5517433, -0.3078887, -2.565127, 1, 1, 1, 1, 1,
-0.5466586, 1.634373, -0.880159, 1, 1, 1, 1, 1,
-0.534515, -1.649998, -1.169919, 1, 1, 1, 1, 1,
-0.5316002, -0.6928518, -3.2228, 1, 1, 1, 1, 1,
-0.5238603, 0.4017431, -0.6217692, 1, 1, 1, 1, 1,
-0.5228096, -0.2342503, -1.037291, 1, 1, 1, 1, 1,
-0.520341, 0.3820409, -2.239717, 1, 1, 1, 1, 1,
-0.5173764, -0.4363396, -2.892122, 1, 1, 1, 1, 1,
-0.5116993, 0.8824076, -0.5558057, 1, 1, 1, 1, 1,
-0.505787, -0.1479979, -0.6993457, 0, 0, 1, 1, 1,
-0.5016745, -0.1518351, -0.1189483, 1, 0, 0, 1, 1,
-0.4906193, -1.441834, -2.793813, 1, 0, 0, 1, 1,
-0.4892117, 0.4769921, -1.653113, 1, 0, 0, 1, 1,
-0.4865824, -1.332009, -2.612916, 1, 0, 0, 1, 1,
-0.4789023, -0.08743351, -3.160518, 1, 0, 0, 1, 1,
-0.4729329, 0.5331483, -2.456079, 0, 0, 0, 1, 1,
-0.4721281, -1.733368, -3.111201, 0, 0, 0, 1, 1,
-0.4720516, 0.640608, 0.2186882, 0, 0, 0, 1, 1,
-0.4649737, 0.6933137, -0.8681422, 0, 0, 0, 1, 1,
-0.458411, -0.9366243, -3.42897, 0, 0, 0, 1, 1,
-0.4583166, -0.3548734, -3.006431, 0, 0, 0, 1, 1,
-0.4549654, -1.435781, -4.244846, 0, 0, 0, 1, 1,
-0.4545985, -0.2454397, -3.070334, 1, 1, 1, 1, 1,
-0.4503745, 0.2522697, 0.7802842, 1, 1, 1, 1, 1,
-0.4488266, -0.9042299, -3.276076, 1, 1, 1, 1, 1,
-0.4413498, -0.1363111, -2.735802, 1, 1, 1, 1, 1,
-0.4406968, -0.2146307, -3.126489, 1, 1, 1, 1, 1,
-0.4406568, 0.08306177, -0.8175648, 1, 1, 1, 1, 1,
-0.4363002, -0.6992595, -2.285285, 1, 1, 1, 1, 1,
-0.4304795, 0.1902234, 0.8615876, 1, 1, 1, 1, 1,
-0.429429, -0.3399593, -1.832167, 1, 1, 1, 1, 1,
-0.4285423, 1.006883, -1.056689, 1, 1, 1, 1, 1,
-0.427883, -0.4685551, -2.363304, 1, 1, 1, 1, 1,
-0.4265341, -1.270662, -2.454035, 1, 1, 1, 1, 1,
-0.4236909, -0.9375175, -1.123337, 1, 1, 1, 1, 1,
-0.4233879, -0.269334, -3.475152, 1, 1, 1, 1, 1,
-0.4179837, 0.6256737, -2.341027, 1, 1, 1, 1, 1,
-0.4179196, -0.7386496, -1.752621, 0, 0, 1, 1, 1,
-0.4123287, -1.526536, -3.138277, 1, 0, 0, 1, 1,
-0.4106826, -1.087038, -1.946376, 1, 0, 0, 1, 1,
-0.4104495, -1.783771, -3.638721, 1, 0, 0, 1, 1,
-0.4078736, -0.8426085, -5.062387, 1, 0, 0, 1, 1,
-0.4039762, 0.4477573, 0.1893538, 1, 0, 0, 1, 1,
-0.4020316, -0.147739, -2.481489, 0, 0, 0, 1, 1,
-0.3987548, 0.0274506, -2.485092, 0, 0, 0, 1, 1,
-0.3974872, -1.628906, -2.801827, 0, 0, 0, 1, 1,
-0.3842916, -0.9535472, -1.839417, 0, 0, 0, 1, 1,
-0.3824267, 0.5362955, -0.9623735, 0, 0, 0, 1, 1,
-0.3786799, -0.7655792, -2.755305, 0, 0, 0, 1, 1,
-0.3777611, 1.225292, -0.5104018, 0, 0, 0, 1, 1,
-0.3773569, -0.3652013, -2.227704, 1, 1, 1, 1, 1,
-0.3772085, -0.9802986, -3.575528, 1, 1, 1, 1, 1,
-0.3770266, 0.3682027, -0.8277093, 1, 1, 1, 1, 1,
-0.3766781, 1.021236, -1.368098, 1, 1, 1, 1, 1,
-0.3706897, 0.5149618, -0.006336481, 1, 1, 1, 1, 1,
-0.3704561, -0.03622891, -1.390762, 1, 1, 1, 1, 1,
-0.3649055, -0.2106196, -3.098596, 1, 1, 1, 1, 1,
-0.3645403, 1.36458, 1.970914, 1, 1, 1, 1, 1,
-0.3593129, 1.335744, -0.9218968, 1, 1, 1, 1, 1,
-0.3574896, 0.9741957, -0.5547171, 1, 1, 1, 1, 1,
-0.3565702, 0.1237344, 1.190467, 1, 1, 1, 1, 1,
-0.3549732, -0.1853784, -2.437958, 1, 1, 1, 1, 1,
-0.3520131, -0.09185258, -3.827528, 1, 1, 1, 1, 1,
-0.351817, 0.8948422, -1.044773, 1, 1, 1, 1, 1,
-0.3472043, 0.475535, 0.2116763, 1, 1, 1, 1, 1,
-0.3465881, -0.6082013, -4.099619, 0, 0, 1, 1, 1,
-0.3381818, 1.081645, -0.5459163, 1, 0, 0, 1, 1,
-0.3368165, 1.505289, 0.4475863, 1, 0, 0, 1, 1,
-0.3352292, -1.937871, -2.761099, 1, 0, 0, 1, 1,
-0.3286041, -0.7677223, -2.504835, 1, 0, 0, 1, 1,
-0.32541, -2.099061, -3.842749, 1, 0, 0, 1, 1,
-0.3243306, -0.9328644, -0.07714111, 0, 0, 0, 1, 1,
-0.3218789, 1.07952, -0.7293143, 0, 0, 0, 1, 1,
-0.321287, -0.2012371, -1.413461, 0, 0, 0, 1, 1,
-0.3164532, -0.5557176, -3.11799, 0, 0, 0, 1, 1,
-0.3027864, 0.8247747, 0.7090725, 0, 0, 0, 1, 1,
-0.3013202, -0.02092821, -1.740554, 0, 0, 0, 1, 1,
-0.295684, 0.298538, -1.051886, 0, 0, 0, 1, 1,
-0.2922952, 0.3301001, -0.5801982, 1, 1, 1, 1, 1,
-0.2921386, -0.4591061, -3.439215, 1, 1, 1, 1, 1,
-0.2912253, 0.08325434, -1.405047, 1, 1, 1, 1, 1,
-0.2892174, -0.1108347, 0.07293375, 1, 1, 1, 1, 1,
-0.2888358, -0.9509199, -1.136547, 1, 1, 1, 1, 1,
-0.2877882, -0.1433696, -1.913979, 1, 1, 1, 1, 1,
-0.2863505, 1.258606, 1.106288, 1, 1, 1, 1, 1,
-0.2834411, 1.529249, -0.1550945, 1, 1, 1, 1, 1,
-0.2826233, -0.9085956, -2.630263, 1, 1, 1, 1, 1,
-0.2787823, 1.351159, 1.996467, 1, 1, 1, 1, 1,
-0.2686186, -0.2110687, -3.162618, 1, 1, 1, 1, 1,
-0.2665406, 0.878695, -0.1325755, 1, 1, 1, 1, 1,
-0.2602527, -0.2502152, -2.526511, 1, 1, 1, 1, 1,
-0.2569067, -0.507962, -2.533828, 1, 1, 1, 1, 1,
-0.2542525, 0.4346732, 0.3256448, 1, 1, 1, 1, 1,
-0.2542, -0.4829309, -2.510165, 0, 0, 1, 1, 1,
-0.2526619, -1.263508, -4.911626, 1, 0, 0, 1, 1,
-0.2513919, 0.5334635, 0.9263487, 1, 0, 0, 1, 1,
-0.2413639, -1.072427, -3.273271, 1, 0, 0, 1, 1,
-0.2348743, 1.140113, -1.269814, 1, 0, 0, 1, 1,
-0.2307469, -0.1878557, -2.3705, 1, 0, 0, 1, 1,
-0.229176, 1.488255, 1.542428, 0, 0, 0, 1, 1,
-0.22786, -1.605439, -2.140235, 0, 0, 0, 1, 1,
-0.2275849, 0.8388063, -0.8402439, 0, 0, 0, 1, 1,
-0.2216284, 0.9978486, -0.6086082, 0, 0, 0, 1, 1,
-0.2205167, -0.7852879, -0.8567843, 0, 0, 0, 1, 1,
-0.2198454, 0.1972087, -2.25308, 0, 0, 0, 1, 1,
-0.2194469, 0.01653444, -1.379718, 0, 0, 0, 1, 1,
-0.2172944, 0.397991, -0.9856984, 1, 1, 1, 1, 1,
-0.2161703, 0.477209, 0.5024362, 1, 1, 1, 1, 1,
-0.2113837, 0.8272721, -0.7154318, 1, 1, 1, 1, 1,
-0.2028558, -0.6785981, -2.153264, 1, 1, 1, 1, 1,
-0.2027393, -0.6775396, -3.906718, 1, 1, 1, 1, 1,
-0.2014849, 0.4940619, -1.253347, 1, 1, 1, 1, 1,
-0.2002717, -0.469766, -3.22599, 1, 1, 1, 1, 1,
-0.1999167, -0.1853546, -2.04823, 1, 1, 1, 1, 1,
-0.192635, -0.1087544, -1.138187, 1, 1, 1, 1, 1,
-0.188482, 1.499655, -0.584244, 1, 1, 1, 1, 1,
-0.1876458, 0.3855329, -0.0045214, 1, 1, 1, 1, 1,
-0.1822836, 0.6433094, -0.1605018, 1, 1, 1, 1, 1,
-0.1791666, -0.1407191, -1.532431, 1, 1, 1, 1, 1,
-0.1781712, -0.109614, -3.452318, 1, 1, 1, 1, 1,
-0.177026, -1.097283, -3.523903, 1, 1, 1, 1, 1,
-0.176369, -0.9530224, -2.6906, 0, 0, 1, 1, 1,
-0.1735042, 0.2240964, 0.5870202, 1, 0, 0, 1, 1,
-0.171875, -2.134243, -4.315836, 1, 0, 0, 1, 1,
-0.1693793, 0.05891852, -2.004622, 1, 0, 0, 1, 1,
-0.1682223, 0.5607815, -0.9600298, 1, 0, 0, 1, 1,
-0.1574997, -0.6823243, -2.228878, 1, 0, 0, 1, 1,
-0.1567869, 1.230096, -2.206883, 0, 0, 0, 1, 1,
-0.1541875, -1.140939, -2.032418, 0, 0, 0, 1, 1,
-0.1504337, -1.413492, -3.213344, 0, 0, 0, 1, 1,
-0.1495691, 0.1765029, -1.173612, 0, 0, 0, 1, 1,
-0.1489585, 0.7324856, -0.1557754, 0, 0, 0, 1, 1,
-0.1479707, 0.7599199, 1.284069, 0, 0, 0, 1, 1,
-0.1458075, -2.28658, -3.837883, 0, 0, 0, 1, 1,
-0.1440619, 0.5216655, -0.8843402, 1, 1, 1, 1, 1,
-0.1393255, -2.161619, -1.016621, 1, 1, 1, 1, 1,
-0.1383948, -0.9964243, -3.409405, 1, 1, 1, 1, 1,
-0.1375075, 0.742163, 0.03555747, 1, 1, 1, 1, 1,
-0.1332045, 0.09898158, -1.208195, 1, 1, 1, 1, 1,
-0.1272663, -0.03596771, -1.212816, 1, 1, 1, 1, 1,
-0.1247273, -1.011658, -3.4165, 1, 1, 1, 1, 1,
-0.1235879, 0.07654915, -1.189896, 1, 1, 1, 1, 1,
-0.1233408, 0.2221071, 0.7775273, 1, 1, 1, 1, 1,
-0.1216568, 1.430838, 1.70547, 1, 1, 1, 1, 1,
-0.1216163, -0.4662509, -1.137602, 1, 1, 1, 1, 1,
-0.1187083, 0.7237044, -0.4534684, 1, 1, 1, 1, 1,
-0.1126906, -1.752376, -3.141178, 1, 1, 1, 1, 1,
-0.1121822, 0.1128588, -1.758095, 1, 1, 1, 1, 1,
-0.1085267, 0.0390356, -0.9426356, 1, 1, 1, 1, 1,
-0.1080442, 0.9720179, 0.4182082, 0, 0, 1, 1, 1,
-0.1041451, -0.05795891, -1.691199, 1, 0, 0, 1, 1,
-0.09706227, -1.134512, -3.216593, 1, 0, 0, 1, 1,
-0.09590357, -1.392686, -1.889151, 1, 0, 0, 1, 1,
-0.09494036, -0.4171522, -3.229145, 1, 0, 0, 1, 1,
-0.08506492, -1.184713, -2.913836, 1, 0, 0, 1, 1,
-0.08111145, -0.7164738, -4.863894, 0, 0, 0, 1, 1,
-0.07119586, -2.036547, -4.361069, 0, 0, 0, 1, 1,
-0.06564236, 0.1978778, 0.07142273, 0, 0, 0, 1, 1,
-0.05389078, 0.6973234, 0.4204953, 0, 0, 0, 1, 1,
-0.05202609, 1.301324, 0.3324733, 0, 0, 0, 1, 1,
-0.05050219, 0.7408232, 1.322374, 0, 0, 0, 1, 1,
-0.05037104, 0.09549374, -1.333917, 0, 0, 0, 1, 1,
-0.05033933, 1.311358, 0.5329323, 1, 1, 1, 1, 1,
-0.04911439, 0.9802171, -1.478466, 1, 1, 1, 1, 1,
-0.04900092, -0.0637971, -3.034798, 1, 1, 1, 1, 1,
-0.04605699, -0.03035856, -0.8773893, 1, 1, 1, 1, 1,
-0.04477343, -1.221521, -4.370107, 1, 1, 1, 1, 1,
-0.04397057, -0.8528937, -3.640998, 1, 1, 1, 1, 1,
-0.04140121, -0.2732224, -2.241683, 1, 1, 1, 1, 1,
-0.04092404, 0.4632453, 1.379238, 1, 1, 1, 1, 1,
-0.03787715, -1.230134, -3.018075, 1, 1, 1, 1, 1,
-0.03768523, 0.7278137, -0.3959353, 1, 1, 1, 1, 1,
-0.02839812, 0.6637537, 0.5955026, 1, 1, 1, 1, 1,
-0.02729475, -0.2591319, -2.465248, 1, 1, 1, 1, 1,
-0.02685807, -0.2843351, -4.065454, 1, 1, 1, 1, 1,
-0.02339917, 1.073424, 1.634622, 1, 1, 1, 1, 1,
-0.02281273, 0.5102594, 3.061581, 1, 1, 1, 1, 1,
-0.02253773, 2.053334, 1.328655, 0, 0, 1, 1, 1,
-0.01847808, 1.476579, 0.2251373, 1, 0, 0, 1, 1,
-0.01701419, -0.3837025, -4.53376, 1, 0, 0, 1, 1,
-0.01422121, 0.02399786, 1.623209, 1, 0, 0, 1, 1,
-0.01042004, -0.1309011, -2.933751, 1, 0, 0, 1, 1,
-0.008261387, 0.3669026, -0.6672791, 1, 0, 0, 1, 1,
-0.004400758, -1.065882, -3.261535, 0, 0, 0, 1, 1,
0.0009828056, 0.09045505, -1.511053, 0, 0, 0, 1, 1,
0.003348666, 0.3730168, -0.2917956, 0, 0, 0, 1, 1,
0.004718435, 0.4809225, -0.520728, 0, 0, 0, 1, 1,
0.0148827, 0.6571783, -0.6634638, 0, 0, 0, 1, 1,
0.01515114, -0.460433, 3.191273, 0, 0, 0, 1, 1,
0.01628747, 0.9337432, -0.535434, 0, 0, 0, 1, 1,
0.01990195, 0.1585027, -0.4688765, 1, 1, 1, 1, 1,
0.02412579, 0.06184066, -0.2655181, 1, 1, 1, 1, 1,
0.02530396, -2.300187, 1.772055, 1, 1, 1, 1, 1,
0.02747152, -0.2449002, 4.863704, 1, 1, 1, 1, 1,
0.02918587, 1.214702, 0.8790879, 1, 1, 1, 1, 1,
0.0310897, -0.6263291, 1.867099, 1, 1, 1, 1, 1,
0.03685422, -0.2955881, 3.934628, 1, 1, 1, 1, 1,
0.03760768, 0.6859857, -0.7549723, 1, 1, 1, 1, 1,
0.03909387, 0.7154069, -1.197953, 1, 1, 1, 1, 1,
0.04217607, 0.3119733, 0.4255566, 1, 1, 1, 1, 1,
0.04486001, 0.160938, -0.7138326, 1, 1, 1, 1, 1,
0.04939713, -1.403343, 3.037035, 1, 1, 1, 1, 1,
0.05394465, 0.3161798, -0.9176918, 1, 1, 1, 1, 1,
0.05535668, 1.014045, 2.706551, 1, 1, 1, 1, 1,
0.05806411, -0.4811607, 2.645939, 1, 1, 1, 1, 1,
0.05913839, 0.8241592, -0.5765088, 0, 0, 1, 1, 1,
0.06386706, 1.523703, -0.884007, 1, 0, 0, 1, 1,
0.06891686, -0.7061374, 2.5288, 1, 0, 0, 1, 1,
0.07013129, 0.6063548, -0.7857327, 1, 0, 0, 1, 1,
0.07041822, 0.9902562, 0.1755084, 1, 0, 0, 1, 1,
0.07153414, 0.6551025, -0.4824597, 1, 0, 0, 1, 1,
0.07330509, 1.026144, 0.1569283, 0, 0, 0, 1, 1,
0.07475754, 1.33679, -0.7798449, 0, 0, 0, 1, 1,
0.07566302, 0.9372864, 0.07243501, 0, 0, 0, 1, 1,
0.07819618, 0.8587521, -1.122027, 0, 0, 0, 1, 1,
0.08215167, 0.2472925, 0.4583616, 0, 0, 0, 1, 1,
0.08326566, 0.04440439, 0.9550929, 0, 0, 0, 1, 1,
0.08353025, 0.2188206, 0.8324785, 0, 0, 0, 1, 1,
0.08948781, 0.7853374, -0.9679977, 1, 1, 1, 1, 1,
0.09401765, 0.4024629, 0.8241597, 1, 1, 1, 1, 1,
0.09427326, 0.4488128, 1.182287, 1, 1, 1, 1, 1,
0.09563624, -0.1134622, 1.154357, 1, 1, 1, 1, 1,
0.09906739, -1.361526, 3.217849, 1, 1, 1, 1, 1,
0.1039046, 0.02029383, 1.250654, 1, 1, 1, 1, 1,
0.106351, -0.248126, 3.194305, 1, 1, 1, 1, 1,
0.1068669, 0.03313518, 1.984297, 1, 1, 1, 1, 1,
0.1070289, 0.2442228, -0.1948003, 1, 1, 1, 1, 1,
0.1073995, 0.03582039, 1.671417, 1, 1, 1, 1, 1,
0.1075151, 0.7655038, -0.5379051, 1, 1, 1, 1, 1,
0.1078903, -0.3006862, 1.82446, 1, 1, 1, 1, 1,
0.1101185, -2.125943, 2.869838, 1, 1, 1, 1, 1,
0.112582, 0.3628092, -0.1459463, 1, 1, 1, 1, 1,
0.113468, -0.8632857, 1.599262, 1, 1, 1, 1, 1,
0.1135515, 2.319505, 0.5833366, 0, 0, 1, 1, 1,
0.1141454, 1.624358, 0.7293633, 1, 0, 0, 1, 1,
0.1163877, 0.2128196, 1.039581, 1, 0, 0, 1, 1,
0.116997, -0.1440506, 2.434542, 1, 0, 0, 1, 1,
0.1186489, 1.143674, 0.7545206, 1, 0, 0, 1, 1,
0.1205095, -0.7727046, 4.100954, 1, 0, 0, 1, 1,
0.1231843, -0.02818103, 1.420719, 0, 0, 0, 1, 1,
0.1260176, 1.690495, 0.6482953, 0, 0, 0, 1, 1,
0.1288643, -0.6123149, 2.888623, 0, 0, 0, 1, 1,
0.1295898, -0.2910601, 1.7568, 0, 0, 0, 1, 1,
0.1308469, 0.7935677, 2.34901, 0, 0, 0, 1, 1,
0.1314685, 1.621411, 0.3472934, 0, 0, 0, 1, 1,
0.1325486, 0.7682458, -0.4814214, 0, 0, 0, 1, 1,
0.1336271, -1.169648, 5.393994, 1, 1, 1, 1, 1,
0.1338241, 0.6312166, 0.08017665, 1, 1, 1, 1, 1,
0.1338422, 0.8408042, 0.5640402, 1, 1, 1, 1, 1,
0.1353467, 0.8692876, 1.487691, 1, 1, 1, 1, 1,
0.1365753, 1.093861, 0.0766462, 1, 1, 1, 1, 1,
0.1386251, -0.5939626, 3.779076, 1, 1, 1, 1, 1,
0.141087, -0.06202058, 1.347792, 1, 1, 1, 1, 1,
0.1474113, 0.4745275, 0.5384331, 1, 1, 1, 1, 1,
0.1499943, 2.395373, -0.5573573, 1, 1, 1, 1, 1,
0.1505054, -0.9868654, 2.124974, 1, 1, 1, 1, 1,
0.1576478, -0.2125098, 2.251832, 1, 1, 1, 1, 1,
0.1577632, 1.15617, 1.492477, 1, 1, 1, 1, 1,
0.1591258, 0.3232019, -0.9688975, 1, 1, 1, 1, 1,
0.1606353, -1.581159, 0.4630522, 1, 1, 1, 1, 1,
0.1626365, 1.41256, 1.641526, 1, 1, 1, 1, 1,
0.1746611, 1.830051, -1.456947, 0, 0, 1, 1, 1,
0.1754878, 1.142711, -0.6099979, 1, 0, 0, 1, 1,
0.1759693, 1.465885, -0.4956129, 1, 0, 0, 1, 1,
0.1778039, -1.75593, 2.370984, 1, 0, 0, 1, 1,
0.178144, 0.871007, 0.7905194, 1, 0, 0, 1, 1,
0.1819171, 0.2566802, -0.1856718, 1, 0, 0, 1, 1,
0.1823534, 1.476387, 0.1877389, 0, 0, 0, 1, 1,
0.1882039, -0.9481229, 2.272047, 0, 0, 0, 1, 1,
0.1953749, -0.8298444, 4.161879, 0, 0, 0, 1, 1,
0.1988649, -0.5598087, 2.5993, 0, 0, 0, 1, 1,
0.2007631, -1.69345, 2.410606, 0, 0, 0, 1, 1,
0.2040657, -0.1914296, 1.860863, 0, 0, 0, 1, 1,
0.2119649, 0.4790301, 1.439539, 0, 0, 0, 1, 1,
0.2137004, -0.5963266, 3.642456, 1, 1, 1, 1, 1,
0.2148059, -0.3201849, 2.031221, 1, 1, 1, 1, 1,
0.2167836, 0.234941, 1.560766, 1, 1, 1, 1, 1,
0.216823, -0.5909278, 3.148514, 1, 1, 1, 1, 1,
0.2189241, 2.289215, 0.2625051, 1, 1, 1, 1, 1,
0.2201753, 1.277537, 1.111894, 1, 1, 1, 1, 1,
0.2216575, 0.03822856, 0.9490171, 1, 1, 1, 1, 1,
0.2240627, -2.027483, 2.511908, 1, 1, 1, 1, 1,
0.2249518, 0.5982087, 0.6975926, 1, 1, 1, 1, 1,
0.228331, 0.04530878, 3.163871, 1, 1, 1, 1, 1,
0.229473, 0.8868186, 0.1460311, 1, 1, 1, 1, 1,
0.2366364, -0.4343302, 1.392295, 1, 1, 1, 1, 1,
0.2428009, -1.222969, 6.078348, 1, 1, 1, 1, 1,
0.2467362, 1.464337, 1.689933, 1, 1, 1, 1, 1,
0.2478026, -1.247849, 2.426946, 1, 1, 1, 1, 1,
0.2491994, 0.04520778, 2.616409, 0, 0, 1, 1, 1,
0.2495955, -1.413169, 2.982183, 1, 0, 0, 1, 1,
0.2497143, 0.7844002, -1.409504, 1, 0, 0, 1, 1,
0.2510523, 0.8316227, -0.4220029, 1, 0, 0, 1, 1,
0.2521862, -0.5051137, 2.451509, 1, 0, 0, 1, 1,
0.2527186, -3.118829, 3.38552, 1, 0, 0, 1, 1,
0.2539959, 0.1860241, 0.7329493, 0, 0, 0, 1, 1,
0.2544383, 0.3867346, 1.405645, 0, 0, 0, 1, 1,
0.256589, 1.200559, -0.9814224, 0, 0, 0, 1, 1,
0.2594811, -0.3981793, 1.806148, 0, 0, 0, 1, 1,
0.259977, 0.7611946, 0.9924988, 0, 0, 0, 1, 1,
0.2643856, -0.1131655, 2.242859, 0, 0, 0, 1, 1,
0.2652369, -0.3327146, 3.48065, 0, 0, 0, 1, 1,
0.2679642, -0.1582619, 1.399317, 1, 1, 1, 1, 1,
0.2753327, 0.5252387, 2.349666, 1, 1, 1, 1, 1,
0.2758409, 0.06030547, 0.8779115, 1, 1, 1, 1, 1,
0.2824542, 1.275495, 1.226112, 1, 1, 1, 1, 1,
0.2830796, 0.6286813, 0.003126793, 1, 1, 1, 1, 1,
0.2845255, 0.6818652, -1.262803, 1, 1, 1, 1, 1,
0.2877231, 0.06179185, 0.4506074, 1, 1, 1, 1, 1,
0.2892244, -1.617546, 2.634174, 1, 1, 1, 1, 1,
0.2897849, -0.6441575, 1.495411, 1, 1, 1, 1, 1,
0.2912771, -1.03784, 4.756639, 1, 1, 1, 1, 1,
0.2927506, -0.3242044, 2.855202, 1, 1, 1, 1, 1,
0.2969202, 0.3874985, -0.797621, 1, 1, 1, 1, 1,
0.2973606, 1.621721, 0.180353, 1, 1, 1, 1, 1,
0.2978403, -0.5749887, 3.5917, 1, 1, 1, 1, 1,
0.2984697, 0.574188, 0.1646422, 1, 1, 1, 1, 1,
0.2996598, 0.5019814, 0.4949341, 0, 0, 1, 1, 1,
0.3036779, -1.602817, 2.396984, 1, 0, 0, 1, 1,
0.3063557, 0.4711503, 0.7101222, 1, 0, 0, 1, 1,
0.311734, -0.2617706, 1.905631, 1, 0, 0, 1, 1,
0.3249141, -0.4749413, 2.718164, 1, 0, 0, 1, 1,
0.3258741, 0.1080665, 1.202056, 1, 0, 0, 1, 1,
0.3275054, 1.557322, 1.703602, 0, 0, 0, 1, 1,
0.3311211, 2.014456, 0.5794381, 0, 0, 0, 1, 1,
0.334292, -1.105267, 3.076017, 0, 0, 0, 1, 1,
0.3345842, -1.028511, 3.745107, 0, 0, 0, 1, 1,
0.3358311, -1.772471, 4.760838, 0, 0, 0, 1, 1,
0.3365042, -0.2703876, 2.516614, 0, 0, 0, 1, 1,
0.3381467, -0.77803, 2.891382, 0, 0, 0, 1, 1,
0.3400243, -0.53785, 1.655772, 1, 1, 1, 1, 1,
0.3426319, 1.813928, 1.347571, 1, 1, 1, 1, 1,
0.3427399, -0.3718155, 3.870137, 1, 1, 1, 1, 1,
0.3471336, 0.5105075, 2.596104, 1, 1, 1, 1, 1,
0.3559969, -0.44331, 2.160241, 1, 1, 1, 1, 1,
0.3576873, 0.8148251, 1.004058, 1, 1, 1, 1, 1,
0.3589145, -1.23054, 1.9563, 1, 1, 1, 1, 1,
0.3659472, -1.890591, 5.030209, 1, 1, 1, 1, 1,
0.3672658, -0.9749846, 3.525054, 1, 1, 1, 1, 1,
0.3683133, -0.2238326, 4.374096, 1, 1, 1, 1, 1,
0.3789228, -1.603325, 3.434779, 1, 1, 1, 1, 1,
0.3820634, -0.3107044, 3.291815, 1, 1, 1, 1, 1,
0.3888844, 1.096145, 2.22796, 1, 1, 1, 1, 1,
0.3918337, 0.6573013, -0.3274973, 1, 1, 1, 1, 1,
0.3971386, 0.483739, 0.9494296, 1, 1, 1, 1, 1,
0.4073552, 0.4341604, 2.190976, 0, 0, 1, 1, 1,
0.4176687, 0.4547031, 0.2558402, 1, 0, 0, 1, 1,
0.4184095, 0.4305536, -0.2892168, 1, 0, 0, 1, 1,
0.4215991, 0.05678614, 1.481362, 1, 0, 0, 1, 1,
0.4216742, 0.4605238, 1.028973, 1, 0, 0, 1, 1,
0.4229684, 0.5334985, 2.503964, 1, 0, 0, 1, 1,
0.4264748, 0.812659, 1.462627, 0, 0, 0, 1, 1,
0.4330287, -0.8311042, 2.468363, 0, 0, 0, 1, 1,
0.433733, -1.247186, 3.26411, 0, 0, 0, 1, 1,
0.437254, 0.9414956, 1.718171, 0, 0, 0, 1, 1,
0.437414, 0.4142924, 1.969307, 0, 0, 0, 1, 1,
0.437862, 0.949864, 0.7580769, 0, 0, 0, 1, 1,
0.4381255, -0.1704267, 1.0646, 0, 0, 0, 1, 1,
0.4404296, 0.5693258, 0.2138525, 1, 1, 1, 1, 1,
0.4409295, 0.2512743, 2.070028, 1, 1, 1, 1, 1,
0.442093, 0.5867084, 1.973107, 1, 1, 1, 1, 1,
0.4425835, -0.1298182, 3.441049, 1, 1, 1, 1, 1,
0.4441401, -0.3028278, 1.698358, 1, 1, 1, 1, 1,
0.447845, 1.23265, 1.687874, 1, 1, 1, 1, 1,
0.4537613, -1.486093, 1.442612, 1, 1, 1, 1, 1,
0.4569553, -0.4287706, 2.878809, 1, 1, 1, 1, 1,
0.4608341, -1.807457, 1.734723, 1, 1, 1, 1, 1,
0.4628369, -0.129912, 1.671106, 1, 1, 1, 1, 1,
0.4636626, 0.08966417, 2.334592, 1, 1, 1, 1, 1,
0.4649716, -0.5870552, 1.692702, 1, 1, 1, 1, 1,
0.4750377, 0.4017701, 1.69026, 1, 1, 1, 1, 1,
0.4766085, -0.5317818, 2.105842, 1, 1, 1, 1, 1,
0.4845685, 1.044131, 1.542588, 1, 1, 1, 1, 1,
0.4846733, 0.2179433, 1.652004, 0, 0, 1, 1, 1,
0.4856388, 0.4452881, 0.3153782, 1, 0, 0, 1, 1,
0.4861686, 0.6374724, 0.8760766, 1, 0, 0, 1, 1,
0.4864661, 0.2828823, -0.2987769, 1, 0, 0, 1, 1,
0.4878125, -0.0260344, 0.02544297, 1, 0, 0, 1, 1,
0.4899762, -0.1387692, 0.7614566, 1, 0, 0, 1, 1,
0.4911422, 1.071498, 1.651112, 0, 0, 0, 1, 1,
0.5023723, -0.5470332, 3.978427, 0, 0, 0, 1, 1,
0.5046054, -0.9696029, 1.281029, 0, 0, 0, 1, 1,
0.5061831, -0.7444309, 2.105666, 0, 0, 0, 1, 1,
0.5071303, 0.09513521, 0.003607135, 0, 0, 0, 1, 1,
0.5079277, 1.058955, -0.22162, 0, 0, 0, 1, 1,
0.5161017, 0.06914534, 0.6792074, 0, 0, 0, 1, 1,
0.5203975, -1.138608, 1.943058, 1, 1, 1, 1, 1,
0.5204337, 0.1686235, 0.7528562, 1, 1, 1, 1, 1,
0.5218886, -1.251199, 2.350673, 1, 1, 1, 1, 1,
0.5227731, 0.9880354, 1.271876, 1, 1, 1, 1, 1,
0.5260411, 0.1033513, 3.517493, 1, 1, 1, 1, 1,
0.5275366, -0.04982212, 1.664649, 1, 1, 1, 1, 1,
0.5324324, -0.3905909, 0.2617874, 1, 1, 1, 1, 1,
0.532474, -2.025382, 2.441445, 1, 1, 1, 1, 1,
0.532998, 1.081951, -0.02100615, 1, 1, 1, 1, 1,
0.5339602, -0.05925406, -0.512351, 1, 1, 1, 1, 1,
0.5350525, -0.3888822, 1.894536, 1, 1, 1, 1, 1,
0.5384449, 0.2503539, 0.1695614, 1, 1, 1, 1, 1,
0.550742, -0.5483877, -0.539459, 1, 1, 1, 1, 1,
0.5531074, -0.001079491, 0.1162274, 1, 1, 1, 1, 1,
0.5590886, 0.1658574, 0.5639072, 1, 1, 1, 1, 1,
0.5592027, 0.8446987, 2.305256, 0, 0, 1, 1, 1,
0.5600846, -0.0527379, 2.29133, 1, 0, 0, 1, 1,
0.5628877, 0.7650818, 0.5641022, 1, 0, 0, 1, 1,
0.5644519, 1.353189, -1.470246, 1, 0, 0, 1, 1,
0.5733882, -0.372032, 2.241787, 1, 0, 0, 1, 1,
0.5802243, 0.08297957, 1.372732, 1, 0, 0, 1, 1,
0.5856159, 0.03689026, 3.362505, 0, 0, 0, 1, 1,
0.5859255, 1.384445, 1.33031, 0, 0, 0, 1, 1,
0.5899379, -0.9227018, 1.493681, 0, 0, 0, 1, 1,
0.5905142, 1.144692, 0.0689323, 0, 0, 0, 1, 1,
0.5926618, -0.7590485, 4.804561, 0, 0, 0, 1, 1,
0.5981082, -1.411372, 0.8162517, 0, 0, 0, 1, 1,
0.6053467, -0.01308924, 1.705741, 0, 0, 0, 1, 1,
0.6100832, -0.3590118, 3.319488, 1, 1, 1, 1, 1,
0.6136286, -0.6548316, 1.219538, 1, 1, 1, 1, 1,
0.6152838, 0.915283, 0.005930009, 1, 1, 1, 1, 1,
0.6189494, 1.860581, -0.7643829, 1, 1, 1, 1, 1,
0.6243161, -1.461392, 3.015909, 1, 1, 1, 1, 1,
0.6243406, 0.9032489, 1.630161, 1, 1, 1, 1, 1,
0.6245966, -1.087117, 2.09539, 1, 1, 1, 1, 1,
0.6253377, 0.7157061, 1.239959, 1, 1, 1, 1, 1,
0.6279809, 0.1229621, 0.823211, 1, 1, 1, 1, 1,
0.6325745, -0.3929332, 5.031448, 1, 1, 1, 1, 1,
0.6333433, -0.2585931, 1.111454, 1, 1, 1, 1, 1,
0.6384157, -0.2030713, 1.05092, 1, 1, 1, 1, 1,
0.6386399, 0.2667206, -0.09488375, 1, 1, 1, 1, 1,
0.6392263, -0.9445704, 2.597409, 1, 1, 1, 1, 1,
0.6404079, -0.6981141, 2.496554, 1, 1, 1, 1, 1,
0.6457412, 0.3501911, 1.496076, 0, 0, 1, 1, 1,
0.6486137, -2.4189, 4.52578, 1, 0, 0, 1, 1,
0.6498414, 0.09049644, 2.559672, 1, 0, 0, 1, 1,
0.6505888, -1.150316, 1.98991, 1, 0, 0, 1, 1,
0.6523449, 1.16429, 0.2139695, 1, 0, 0, 1, 1,
0.6524905, 0.07260843, 0.9228287, 1, 0, 0, 1, 1,
0.661265, 0.9033727, -0.6394218, 0, 0, 0, 1, 1,
0.6640382, 0.3066128, 0.6609743, 0, 0, 0, 1, 1,
0.6681554, -0.809817, 1.871996, 0, 0, 0, 1, 1,
0.6688387, 0.4661896, 1.03353, 0, 0, 0, 1, 1,
0.6709647, -0.3522874, 3.575388, 0, 0, 0, 1, 1,
0.6719133, -0.171232, 0.7458245, 0, 0, 0, 1, 1,
0.6744984, 0.6280261, 0.1528308, 0, 0, 0, 1, 1,
0.679502, 1.018287, 1.794065, 1, 1, 1, 1, 1,
0.6820104, 0.2774415, 2.562609, 1, 1, 1, 1, 1,
0.6865267, -0.09786122, 2.28966, 1, 1, 1, 1, 1,
0.6877787, 0.00267929, 1.463327, 1, 1, 1, 1, 1,
0.6887766, -0.2039492, 0.9556314, 1, 1, 1, 1, 1,
0.6896255, 0.4961558, 1.998386, 1, 1, 1, 1, 1,
0.6907698, 1.713944, 1.289716, 1, 1, 1, 1, 1,
0.6934297, -0.170422, 2.812018, 1, 1, 1, 1, 1,
0.694277, 0.2132841, 1.9558, 1, 1, 1, 1, 1,
0.6945285, -1.06035, 2.428594, 1, 1, 1, 1, 1,
0.6971136, -1.121929, 1.639758, 1, 1, 1, 1, 1,
0.6985437, 0.2047075, 0.2666731, 1, 1, 1, 1, 1,
0.7035857, 0.1935816, 3.065178, 1, 1, 1, 1, 1,
0.705776, -0.6204063, 1.114623, 1, 1, 1, 1, 1,
0.7080308, 0.4271851, 0.8914044, 1, 1, 1, 1, 1,
0.7095671, -0.4069505, 1.312755, 0, 0, 1, 1, 1,
0.7168279, -0.4482973, 2.16581, 1, 0, 0, 1, 1,
0.7169889, 0.1215943, 3.277739, 1, 0, 0, 1, 1,
0.7186302, 0.4648605, 0.7576036, 1, 0, 0, 1, 1,
0.7231014, -1.872596, 2.213575, 1, 0, 0, 1, 1,
0.7232491, -1.333087, 2.510359, 1, 0, 0, 1, 1,
0.7243043, 0.06243188, 1.02476, 0, 0, 0, 1, 1,
0.7257067, -0.04962654, 2.319758, 0, 0, 0, 1, 1,
0.7261686, 1.083221, 1.143341, 0, 0, 0, 1, 1,
0.7348637, 1.213622, 1.808805, 0, 0, 0, 1, 1,
0.7393173, -0.2818423, 1.241052, 0, 0, 0, 1, 1,
0.745765, -1.014824, 2.116534, 0, 0, 0, 1, 1,
0.7467503, 1.128561, 0.08958553, 0, 0, 0, 1, 1,
0.7526894, 1.480242, 2.95393, 1, 1, 1, 1, 1,
0.7604653, 1.371674, 0.4457006, 1, 1, 1, 1, 1,
0.7606103, -0.7463173, 1.219379, 1, 1, 1, 1, 1,
0.7631779, 0.4020488, 1.528147, 1, 1, 1, 1, 1,
0.7641134, -1.170573, 3.092225, 1, 1, 1, 1, 1,
0.773436, 3.005578, -1.154202, 1, 1, 1, 1, 1,
0.7753481, -1.563256, 3.336889, 1, 1, 1, 1, 1,
0.7810221, 0.2216531, 3.056792, 1, 1, 1, 1, 1,
0.7842391, 0.2084873, 0.2034831, 1, 1, 1, 1, 1,
0.7899656, -1.096948, 0.9986647, 1, 1, 1, 1, 1,
0.7912211, -0.8101359, 2.599637, 1, 1, 1, 1, 1,
0.794605, -2.8329, 2.741433, 1, 1, 1, 1, 1,
0.7965581, 0.6731977, 0.3620336, 1, 1, 1, 1, 1,
0.7976174, -0.3249003, 2.337594, 1, 1, 1, 1, 1,
0.7979773, -1.079716, 3.250061, 1, 1, 1, 1, 1,
0.8061557, -2.095796, 3.606441, 0, 0, 1, 1, 1,
0.8064362, 0.9804776, -0.4025827, 1, 0, 0, 1, 1,
0.8088035, 0.3695945, -0.5019207, 1, 0, 0, 1, 1,
0.8169652, -0.4558583, 2.344029, 1, 0, 0, 1, 1,
0.8176603, 0.6134886, 0.3517137, 1, 0, 0, 1, 1,
0.8476251, 2.108088, 0.2312756, 1, 0, 0, 1, 1,
0.8491171, 0.4135081, 1.134155, 0, 0, 0, 1, 1,
0.8553378, 0.3525824, 1.202889, 0, 0, 0, 1, 1,
0.8652694, -0.8147532, 2.182416, 0, 0, 0, 1, 1,
0.8683653, -0.4010633, 1.828538, 0, 0, 0, 1, 1,
0.8702613, 0.1796909, 1.847728, 0, 0, 0, 1, 1,
0.8732013, -0.04266417, 1.886337, 0, 0, 0, 1, 1,
0.876134, -0.3195709, 0.9747338, 0, 0, 0, 1, 1,
0.8820994, -0.09563886, 0.8480141, 1, 1, 1, 1, 1,
0.8848019, -1.474827, 1.849536, 1, 1, 1, 1, 1,
0.8883349, -0.7742081, 1.810301, 1, 1, 1, 1, 1,
0.888661, -1.056989, 2.776275, 1, 1, 1, 1, 1,
0.8918632, -1.520061, 3.159372, 1, 1, 1, 1, 1,
0.8961529, 1.209076, -0.1507376, 1, 1, 1, 1, 1,
0.906535, -1.279663, 2.1752, 1, 1, 1, 1, 1,
0.9069574, -1.326751, 1.815201, 1, 1, 1, 1, 1,
0.9114398, -1.275513, 2.416606, 1, 1, 1, 1, 1,
0.9124072, 1.315828, -0.5616925, 1, 1, 1, 1, 1,
0.9148439, 0.3948022, 0.6524324, 1, 1, 1, 1, 1,
0.9163761, 0.3667592, 1.886858, 1, 1, 1, 1, 1,
0.917455, -1.186548, 3.119378, 1, 1, 1, 1, 1,
0.9200795, -0.6363966, 2.235429, 1, 1, 1, 1, 1,
0.9230967, -0.05827469, 0.743377, 1, 1, 1, 1, 1,
0.9236826, 1.312262, -1.071641, 0, 0, 1, 1, 1,
0.9303975, -0.8926579, 3.74148, 1, 0, 0, 1, 1,
0.9307849, 0.04565652, -0.1620985, 1, 0, 0, 1, 1,
0.9374918, -0.3572109, 0.1094567, 1, 0, 0, 1, 1,
0.9490211, 0.4038146, 0.9712732, 1, 0, 0, 1, 1,
0.9532282, -0.9549233, 5.816828, 1, 0, 0, 1, 1,
0.9547688, -0.8494671, 1.325974, 0, 0, 0, 1, 1,
0.9697332, 0.1102872, 1.636867, 0, 0, 0, 1, 1,
0.9740944, -0.9760622, 1.97932, 0, 0, 0, 1, 1,
0.9761885, -1.931469, 3.41663, 0, 0, 0, 1, 1,
0.9780183, -0.5506968, 2.276101, 0, 0, 0, 1, 1,
0.9810249, -0.7378068, 1.914187, 0, 0, 0, 1, 1,
0.9869274, 1.339472, -0.1982963, 0, 0, 0, 1, 1,
0.9873379, 0.7709086, 0.05513458, 1, 1, 1, 1, 1,
0.9948544, 2.902045, 1.483352, 1, 1, 1, 1, 1,
0.9951987, 0.9635393, 2.0687, 1, 1, 1, 1, 1,
1.010048, 0.8258937, 0.7081465, 1, 1, 1, 1, 1,
1.010748, 1.034555, -0.2127179, 1, 1, 1, 1, 1,
1.013603, 0.9599886, 1.299122, 1, 1, 1, 1, 1,
1.018226, -1.091065, 3.137669, 1, 1, 1, 1, 1,
1.021573, 0.0005842915, 0.6805668, 1, 1, 1, 1, 1,
1.022957, -1.976845, 1.86195, 1, 1, 1, 1, 1,
1.026511, 0.1320921, 1.806567, 1, 1, 1, 1, 1,
1.027502, -0.1612175, 2.105591, 1, 1, 1, 1, 1,
1.033133, -1.029269, 4.051174, 1, 1, 1, 1, 1,
1.041962, -1.498017, 3.351519, 1, 1, 1, 1, 1,
1.042139, 0.3547835, 1.239678, 1, 1, 1, 1, 1,
1.043346, 0.02879149, 2.057831, 1, 1, 1, 1, 1,
1.044051, -0.8287669, 2.406879, 0, 0, 1, 1, 1,
1.044131, -0.3561957, 0.8981221, 1, 0, 0, 1, 1,
1.046779, 0.8245708, 0.1975196, 1, 0, 0, 1, 1,
1.046833, 0.8934417, 1.760275, 1, 0, 0, 1, 1,
1.062997, 0.3985632, 1.112479, 1, 0, 0, 1, 1,
1.074025, -0.9605156, 2.191247, 1, 0, 0, 1, 1,
1.076694, -1.388643, 2.572906, 0, 0, 0, 1, 1,
1.078008, -0.4114217, 3.140794, 0, 0, 0, 1, 1,
1.079908, 2.240512, 0.4607975, 0, 0, 0, 1, 1,
1.084014, -1.057198, 1.039706, 0, 0, 0, 1, 1,
1.086676, -0.7620329, 3.706351, 0, 0, 0, 1, 1,
1.087357, -1.841289, 3.801564, 0, 0, 0, 1, 1,
1.090247, -0.8996297, 1.584217, 0, 0, 0, 1, 1,
1.09659, 0.7084019, 0.2658791, 1, 1, 1, 1, 1,
1.099464, -0.9094844, 3.631283, 1, 1, 1, 1, 1,
1.100176, -1.648452, 2.333211, 1, 1, 1, 1, 1,
1.101873, -0.8349934, 2.166691, 1, 1, 1, 1, 1,
1.104829, 0.7911618, 0.9879928, 1, 1, 1, 1, 1,
1.10551, 0.4746636, 0.3535844, 1, 1, 1, 1, 1,
1.115423, -1.683516, 1.736417, 1, 1, 1, 1, 1,
1.119084, 0.03181665, 2.612318, 1, 1, 1, 1, 1,
1.124111, -0.3612893, 2.590561, 1, 1, 1, 1, 1,
1.137084, -0.3986749, 1.979231, 1, 1, 1, 1, 1,
1.144494, -0.493164, 1.927896, 1, 1, 1, 1, 1,
1.145692, 0.4092523, 1.887225, 1, 1, 1, 1, 1,
1.145836, -1.79028, 2.38992, 1, 1, 1, 1, 1,
1.147651, 0.2297158, 2.241835, 1, 1, 1, 1, 1,
1.152505, 0.3345316, 4.100936, 1, 1, 1, 1, 1,
1.162987, -0.8456034, 1.470469, 0, 0, 1, 1, 1,
1.163458, 0.1050361, 1.949449, 1, 0, 0, 1, 1,
1.164973, 0.5288599, 1.750633, 1, 0, 0, 1, 1,
1.165351, 0.7812313, 1.123941, 1, 0, 0, 1, 1,
1.167333, -0.3610699, 2.974938, 1, 0, 0, 1, 1,
1.16767, -0.009797944, 1.502026, 1, 0, 0, 1, 1,
1.182187, 1.788895, 1.787173, 0, 0, 0, 1, 1,
1.189862, 0.3278292, 1.479054, 0, 0, 0, 1, 1,
1.196206, -1.202488, 1.825838, 0, 0, 0, 1, 1,
1.197611, -1.030395, 1.913228, 0, 0, 0, 1, 1,
1.210925, 1.400875, -0.5252799, 0, 0, 0, 1, 1,
1.215167, -0.3951852, 3.409512, 0, 0, 0, 1, 1,
1.216588, -2.19921, 3.245528, 0, 0, 0, 1, 1,
1.218263, -0.5325485, -0.1464685, 1, 1, 1, 1, 1,
1.223747, 0.9254579, 1.977827, 1, 1, 1, 1, 1,
1.228191, -0.5514869, 1.307815, 1, 1, 1, 1, 1,
1.23378, -0.2567156, 0.8630187, 1, 1, 1, 1, 1,
1.24593, 0.109369, -0.6263024, 1, 1, 1, 1, 1,
1.249265, -0.6906258, 1.674612, 1, 1, 1, 1, 1,
1.249538, -2.49506, 3.684624, 1, 1, 1, 1, 1,
1.257011, 1.549314, 0.9038333, 1, 1, 1, 1, 1,
1.260196, -2.191219, 2.874832, 1, 1, 1, 1, 1,
1.268469, -1.734574, 2.658944, 1, 1, 1, 1, 1,
1.271835, 0.4049097, 0.8852752, 1, 1, 1, 1, 1,
1.274456, -0.590744, 1.680153, 1, 1, 1, 1, 1,
1.279798, 0.2544762, 1.621483, 1, 1, 1, 1, 1,
1.284321, -0.928094, 2.9136, 1, 1, 1, 1, 1,
1.285837, -1.434348, 2.314673, 1, 1, 1, 1, 1,
1.287022, 0.1377556, 2.478412, 0, 0, 1, 1, 1,
1.292507, -1.011069, 0.495497, 1, 0, 0, 1, 1,
1.306902, 2.167767, 0.1101189, 1, 0, 0, 1, 1,
1.316001, 0.573127, 0.9373233, 1, 0, 0, 1, 1,
1.322855, -0.6447923, 1.467142, 1, 0, 0, 1, 1,
1.327238, 0.4829445, 1.173233, 1, 0, 0, 1, 1,
1.330613, -2.555872, 3.489438, 0, 0, 0, 1, 1,
1.334899, -0.6880768, 1.786321, 0, 0, 0, 1, 1,
1.339331, -0.5688565, 3.374537, 0, 0, 0, 1, 1,
1.343154, -1.862345, 1.414254, 0, 0, 0, 1, 1,
1.364379, 1.236224, 1.075732, 0, 0, 0, 1, 1,
1.364485, 0.04391702, 3.842973, 0, 0, 0, 1, 1,
1.384492, 1.497769, 0.2995547, 0, 0, 0, 1, 1,
1.392853, -0.6357123, 2.018554, 1, 1, 1, 1, 1,
1.397205, 0.9645048, -0.04454972, 1, 1, 1, 1, 1,
1.400749, -0.8349003, 2.541674, 1, 1, 1, 1, 1,
1.428709, -1.39598, 1.338064, 1, 1, 1, 1, 1,
1.461564, 0.2703582, 0.08590566, 1, 1, 1, 1, 1,
1.462621, 1.270638, 0.9991209, 1, 1, 1, 1, 1,
1.46272, 2.037534, 2.125957, 1, 1, 1, 1, 1,
1.48595, -1.263062, 4.223933, 1, 1, 1, 1, 1,
1.491372, 0.4199221, 2.271854, 1, 1, 1, 1, 1,
1.498688, -0.1160241, 0.7284941, 1, 1, 1, 1, 1,
1.515441, 0.1093778, 1.997615, 1, 1, 1, 1, 1,
1.533365, -2.080574, 3.82213, 1, 1, 1, 1, 1,
1.539535, 2.229792, 0.1945624, 1, 1, 1, 1, 1,
1.539659, 0.9667239, 1.999925, 1, 1, 1, 1, 1,
1.54022, 1.491601, 0.3521698, 1, 1, 1, 1, 1,
1.545715, -1.442997, 2.082222, 0, 0, 1, 1, 1,
1.549178, -0.7649459, 2.463093, 1, 0, 0, 1, 1,
1.554381, -1.763685, 2.498669, 1, 0, 0, 1, 1,
1.554679, 1.378725, -0.5431022, 1, 0, 0, 1, 1,
1.574042, 2.063644, 1.97989, 1, 0, 0, 1, 1,
1.579081, 0.03198364, 0.910059, 1, 0, 0, 1, 1,
1.590532, -0.0213135, 0.3971206, 0, 0, 0, 1, 1,
1.621799, 1.518782, 0.8668069, 0, 0, 0, 1, 1,
1.636586, -0.579816, 1.801034, 0, 0, 0, 1, 1,
1.642096, 0.1295702, 1.523642, 0, 0, 0, 1, 1,
1.657368, -1.760465, 4.508978, 0, 0, 0, 1, 1,
1.659929, 0.2560491, 3.829183, 0, 0, 0, 1, 1,
1.664178, 0.871538, 1.843757, 0, 0, 0, 1, 1,
1.667515, 0.7036315, -0.3822285, 1, 1, 1, 1, 1,
1.670969, -0.4738334, 0.7718174, 1, 1, 1, 1, 1,
1.685354, -0.3722553, 2.248357, 1, 1, 1, 1, 1,
1.696729, -1.567499, 0.8108733, 1, 1, 1, 1, 1,
1.705453, 1.404209, 1.788234, 1, 1, 1, 1, 1,
1.706287, 0.9438664, 1.339545, 1, 1, 1, 1, 1,
1.708828, -1.014912, 1.568484, 1, 1, 1, 1, 1,
1.715166, -0.8573815, 3.585101, 1, 1, 1, 1, 1,
1.734549, -0.8903847, 2.549099, 1, 1, 1, 1, 1,
1.734933, 0.6303713, -0.1628389, 1, 1, 1, 1, 1,
1.75118, -0.4925531, -0.4155326, 1, 1, 1, 1, 1,
1.764325, -0.02947701, 2.309609, 1, 1, 1, 1, 1,
1.775201, 1.361203, 0.3333562, 1, 1, 1, 1, 1,
1.790717, -0.5855671, 3.189213, 1, 1, 1, 1, 1,
1.791916, -0.2068279, 2.454553, 1, 1, 1, 1, 1,
1.802301, 1.282389, 0.9455382, 0, 0, 1, 1, 1,
1.812141, 0.7419609, 1.611905, 1, 0, 0, 1, 1,
1.812661, 0.6373793, 1.197388, 1, 0, 0, 1, 1,
1.824117, 1.725304, 1.707406, 1, 0, 0, 1, 1,
1.832065, 0.01613144, 2.312537, 1, 0, 0, 1, 1,
1.841609, -0.9158735, 1.615293, 1, 0, 0, 1, 1,
1.854218, 1.57465, 0.0542765, 0, 0, 0, 1, 1,
1.866817, 2.881403, 0.9014186, 0, 0, 0, 1, 1,
1.894967, 2.974958, 0.2145933, 0, 0, 0, 1, 1,
1.951322, -0.2911212, 0.4619946, 0, 0, 0, 1, 1,
1.955564, 0.2063966, 2.877839, 0, 0, 0, 1, 1,
1.959427, -0.5022104, 3.412741, 0, 0, 0, 1, 1,
1.96533, -0.3139235, 2.026683, 0, 0, 0, 1, 1,
1.986127, 0.2442505, 0.3653734, 1, 1, 1, 1, 1,
2.01951, 0.190177, 0.339956, 1, 1, 1, 1, 1,
2.02457, 0.81532, -0.2159219, 1, 1, 1, 1, 1,
2.050464, 0.08073883, 3.425237, 1, 1, 1, 1, 1,
2.055791, -0.2561568, -0.3882476, 1, 1, 1, 1, 1,
2.065388, -0.9739075, 3.135746, 1, 1, 1, 1, 1,
2.129827, 0.9031421, 0.8913482, 1, 1, 1, 1, 1,
2.13194, 1.94334, -0.2529879, 1, 1, 1, 1, 1,
2.148038, -0.7786335, 3.088073, 1, 1, 1, 1, 1,
2.171258, 2.223872, 0.7734725, 1, 1, 1, 1, 1,
2.174325, 0.06340148, 3.027831, 1, 1, 1, 1, 1,
2.214955, -1.108177, 3.054272, 1, 1, 1, 1, 1,
2.224157, 0.8816544, 1.716371, 1, 1, 1, 1, 1,
2.226076, 0.04877158, 1.615345, 1, 1, 1, 1, 1,
2.241695, 0.2368563, 1.410007, 1, 1, 1, 1, 1,
2.289955, 0.6862078, 0.6689497, 0, 0, 1, 1, 1,
2.296681, -1.412081, 1.667282, 1, 0, 0, 1, 1,
2.349784, 0.8613394, 1.773357, 1, 0, 0, 1, 1,
2.383294, -0.5414778, 0.2973419, 1, 0, 0, 1, 1,
2.445446, -0.3394672, 3.473742, 1, 0, 0, 1, 1,
2.484493, -0.05488726, 0.87467, 1, 0, 0, 1, 1,
2.501802, -0.5909925, 3.248576, 0, 0, 0, 1, 1,
2.62987, 0.4847151, 1.664701, 0, 0, 0, 1, 1,
2.638836, 1.877003, -0.05033617, 0, 0, 0, 1, 1,
2.645307, 0.2188876, -0.5157239, 0, 0, 0, 1, 1,
2.654564, -1.122759, 1.78829, 0, 0, 0, 1, 1,
2.785054, -0.1104783, 0.7911478, 0, 0, 0, 1, 1,
2.802552, -0.1981974, 1.200483, 0, 0, 0, 1, 1,
2.876754, -0.3484937, 0.6651771, 1, 1, 1, 1, 1,
2.920763, -0.1093665, 0.5983891, 1, 1, 1, 1, 1,
2.935101, -2.04592, 2.997726, 1, 1, 1, 1, 1,
2.940902, -0.001467202, 3.721994, 1, 1, 1, 1, 1,
2.964397, -1.02381, 2.954849, 1, 1, 1, 1, 1,
3.052723, -0.5661991, 1.047051, 1, 1, 1, 1, 1,
3.574041, 0.04479819, 2.53571, 1, 1, 1, 1, 1
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
var radius = 9.903137;
var distance = 34.78435;
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
mvMatrix.translate( 0.04982185, 0.05662584, -0.5079803 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.78435);
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
