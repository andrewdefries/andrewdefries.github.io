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
-3.511466, 0.01071179, -0.9281759, 1, 0, 0, 1,
-3.031511, -0.02380253, -1.801146, 1, 0.007843138, 0, 1,
-2.989417, -0.925885, 0.2252565, 1, 0.01176471, 0, 1,
-2.872647, 2.234971, -0.1060619, 1, 0.01960784, 0, 1,
-2.658185, 0.4093038, -2.245014, 1, 0.02352941, 0, 1,
-2.601512, -0.373576, -2.532681, 1, 0.03137255, 0, 1,
-2.496484, -0.3192886, -1.159562, 1, 0.03529412, 0, 1,
-2.45197, 0.03439756, -0.2717815, 1, 0.04313726, 0, 1,
-2.410957, -0.3477861, -2.070753, 1, 0.04705882, 0, 1,
-2.397309, -1.253718, -2.337936, 1, 0.05490196, 0, 1,
-2.305242, 0.7415142, -3.27837, 1, 0.05882353, 0, 1,
-2.279894, -1.419698, -2.036236, 1, 0.06666667, 0, 1,
-2.266811, 1.668982, -0.9846755, 1, 0.07058824, 0, 1,
-2.200802, 0.1192251, -2.526294, 1, 0.07843138, 0, 1,
-2.074345, -0.6696788, -1.247309, 1, 0.08235294, 0, 1,
-2.051389, 0.2777167, -1.393308, 1, 0.09019608, 0, 1,
-2.048607, 1.606708, -2.574852, 1, 0.09411765, 0, 1,
-2.021199, -0.6753424, -1.763754, 1, 0.1019608, 0, 1,
-2.004212, 1.197031, -2.306285, 1, 0.1098039, 0, 1,
-1.995733, -0.6116731, -2.139489, 1, 0.1137255, 0, 1,
-1.993448, -0.8481399, -1.787557, 1, 0.1215686, 0, 1,
-1.988896, -0.2450711, -1.654721, 1, 0.1254902, 0, 1,
-1.963569, 1.814259, -0.105764, 1, 0.1333333, 0, 1,
-1.916603, -2.228946, -1.275949, 1, 0.1372549, 0, 1,
-1.912282, 0.01179827, -2.739318, 1, 0.145098, 0, 1,
-1.878298, -0.1165144, -1.000651, 1, 0.1490196, 0, 1,
-1.87617, 1.595685, -1.068873, 1, 0.1568628, 0, 1,
-1.854382, -0.281851, -1.30824, 1, 0.1607843, 0, 1,
-1.848967, 1.429637, -1.461207, 1, 0.1686275, 0, 1,
-1.822453, -0.5445581, -1.027648, 1, 0.172549, 0, 1,
-1.805625, -0.2507913, -2.399953, 1, 0.1803922, 0, 1,
-1.737283, 1.483096, -1.177916, 1, 0.1843137, 0, 1,
-1.725251, -0.5129788, -1.346758, 1, 0.1921569, 0, 1,
-1.719488, -1.832363, -1.650273, 1, 0.1960784, 0, 1,
-1.690974, 1.027569, -1.266369, 1, 0.2039216, 0, 1,
-1.681746, 0.0535094, -1.071047, 1, 0.2117647, 0, 1,
-1.677938, 0.4048512, -3.837823, 1, 0.2156863, 0, 1,
-1.677886, -0.304765, -0.8472993, 1, 0.2235294, 0, 1,
-1.66865, 2.197264, -0.3082818, 1, 0.227451, 0, 1,
-1.660645, 0.830144, -0.2892069, 1, 0.2352941, 0, 1,
-1.656116, -1.054332, -2.736897, 1, 0.2392157, 0, 1,
-1.654012, 1.507409, 0.6946142, 1, 0.2470588, 0, 1,
-1.643918, -0.887748, -1.229433, 1, 0.2509804, 0, 1,
-1.639143, 1.708621, -1.891333, 1, 0.2588235, 0, 1,
-1.634451, 0.4320534, -3.150568, 1, 0.2627451, 0, 1,
-1.617103, 1.154053, -1.701924, 1, 0.2705882, 0, 1,
-1.60759, 1.890173, -0.9526327, 1, 0.2745098, 0, 1,
-1.58913, -0.632237, -2.694412, 1, 0.282353, 0, 1,
-1.585542, 1.816981, -0.1113199, 1, 0.2862745, 0, 1,
-1.569289, 0.9878724, -1.039846, 1, 0.2941177, 0, 1,
-1.548762, -0.02665829, -0.4110633, 1, 0.3019608, 0, 1,
-1.525027, 0.2120463, -1.489993, 1, 0.3058824, 0, 1,
-1.51234, 1.542036, -1.963147, 1, 0.3137255, 0, 1,
-1.506655, 2.3562, -1.815998, 1, 0.3176471, 0, 1,
-1.504699, 0.8023502, -0.383269, 1, 0.3254902, 0, 1,
-1.494665, 1.303121, 0.1764252, 1, 0.3294118, 0, 1,
-1.486234, -1.205574, -1.018647, 1, 0.3372549, 0, 1,
-1.485043, 0.904832, -1.547721, 1, 0.3411765, 0, 1,
-1.4821, 2.180301, -1.700903, 1, 0.3490196, 0, 1,
-1.47252, -0.1139602, -1.573983, 1, 0.3529412, 0, 1,
-1.471095, -2.046197, -2.210928, 1, 0.3607843, 0, 1,
-1.466664, -0.1807484, -1.048344, 1, 0.3647059, 0, 1,
-1.447621, -0.4796693, -2.819684, 1, 0.372549, 0, 1,
-1.439008, -0.5288252, -1.808959, 1, 0.3764706, 0, 1,
-1.417163, 0.6667188, -1.349886, 1, 0.3843137, 0, 1,
-1.406047, -0.1455617, -0.599016, 1, 0.3882353, 0, 1,
-1.405975, 0.8094667, -1.871613, 1, 0.3960784, 0, 1,
-1.383934, 0.178054, -1.272927, 1, 0.4039216, 0, 1,
-1.379349, -2.095246, -2.775656, 1, 0.4078431, 0, 1,
-1.376462, 0.09354387, -1.218024, 1, 0.4156863, 0, 1,
-1.369097, -1.06551, -4.087741, 1, 0.4196078, 0, 1,
-1.353055, -0.8150789, -3.347142, 1, 0.427451, 0, 1,
-1.348597, 0.6171682, -0.5981948, 1, 0.4313726, 0, 1,
-1.335923, -0.3744145, -2.475693, 1, 0.4392157, 0, 1,
-1.32839, 0.4123812, -1.675395, 1, 0.4431373, 0, 1,
-1.327697, -0.8094776, -1.343868, 1, 0.4509804, 0, 1,
-1.317556, -1.827855, -3.698061, 1, 0.454902, 0, 1,
-1.316419, 0.2130287, -2.736343, 1, 0.4627451, 0, 1,
-1.31522, 1.418597, -1.412054, 1, 0.4666667, 0, 1,
-1.311581, 0.2456121, 0.6748644, 1, 0.4745098, 0, 1,
-1.30557, 1.198756, -0.7275078, 1, 0.4784314, 0, 1,
-1.303551, 0.4744217, -1.105921, 1, 0.4862745, 0, 1,
-1.301314, -0.3520973, -1.831573, 1, 0.4901961, 0, 1,
-1.29939, 1.181789, 0.5823982, 1, 0.4980392, 0, 1,
-1.292851, 0.8384274, -1.469759, 1, 0.5058824, 0, 1,
-1.292173, -0.08970769, -0.9584144, 1, 0.509804, 0, 1,
-1.284505, 1.712619, -0.8258368, 1, 0.5176471, 0, 1,
-1.276041, -0.07165316, -0.9900807, 1, 0.5215687, 0, 1,
-1.272497, -0.2865354, -2.793131, 1, 0.5294118, 0, 1,
-1.272055, -1.205203, -2.747983, 1, 0.5333334, 0, 1,
-1.270001, -0.2165031, -1.639367, 1, 0.5411765, 0, 1,
-1.26974, 0.9622867, -0.3173513, 1, 0.5450981, 0, 1,
-1.266902, -0.9507821, -1.188299, 1, 0.5529412, 0, 1,
-1.263122, -0.627192, -1.972537, 1, 0.5568628, 0, 1,
-1.223961, -0.5436723, -2.629858, 1, 0.5647059, 0, 1,
-1.22067, -1.230294, -4.724071, 1, 0.5686275, 0, 1,
-1.206738, -0.2298021, -2.79127, 1, 0.5764706, 0, 1,
-1.201309, 0.4017796, -1.833119, 1, 0.5803922, 0, 1,
-1.193885, -0.3269784, -2.317094, 1, 0.5882353, 0, 1,
-1.191615, -0.4730522, -1.751062, 1, 0.5921569, 0, 1,
-1.187153, -1.14148, -3.130907, 1, 0.6, 0, 1,
-1.177456, -1.038355, -3.153437, 1, 0.6078432, 0, 1,
-1.174634, 0.9863498, -0.09156661, 1, 0.6117647, 0, 1,
-1.159141, -0.8490024, -1.395286, 1, 0.6196079, 0, 1,
-1.154762, 0.2027878, -1.132622, 1, 0.6235294, 0, 1,
-1.15106, -1.600465, -2.074329, 1, 0.6313726, 0, 1,
-1.150727, -0.9696, -1.506058, 1, 0.6352941, 0, 1,
-1.149236, 0.4827953, -0.5297462, 1, 0.6431373, 0, 1,
-1.149102, 0.4863178, -2.259457, 1, 0.6470588, 0, 1,
-1.144706, -1.195634, -4.160784, 1, 0.654902, 0, 1,
-1.142294, -0.2245017, -2.905663, 1, 0.6588235, 0, 1,
-1.139302, 1.218266, -0.9276436, 1, 0.6666667, 0, 1,
-1.139117, -0.468884, -2.003502, 1, 0.6705883, 0, 1,
-1.137739, -1.712281, -3.230875, 1, 0.6784314, 0, 1,
-1.130903, -1.127085, -1.493936, 1, 0.682353, 0, 1,
-1.130862, 1.384392, -0.3039414, 1, 0.6901961, 0, 1,
-1.127822, 0.3718146, -1.658348, 1, 0.6941177, 0, 1,
-1.124983, 0.4052522, -2.591442, 1, 0.7019608, 0, 1,
-1.119402, 1.25695, 0.03261421, 1, 0.7098039, 0, 1,
-1.118113, 0.5936459, -1.142281, 1, 0.7137255, 0, 1,
-1.111698, -0.5149033, -2.129176, 1, 0.7215686, 0, 1,
-1.100564, -0.518402, -1.765491, 1, 0.7254902, 0, 1,
-1.099301, 1.061488, -1.757381, 1, 0.7333333, 0, 1,
-1.095201, -0.3729305, -1.841918, 1, 0.7372549, 0, 1,
-1.089937, 0.2068481, -1.120584, 1, 0.7450981, 0, 1,
-1.088899, 0.0926614, -0.677475, 1, 0.7490196, 0, 1,
-1.085331, -0.4432251, -1.922087, 1, 0.7568628, 0, 1,
-1.084437, 0.01431855, -0.7297934, 1, 0.7607843, 0, 1,
-1.075625, -0.6465412, -3.037189, 1, 0.7686275, 0, 1,
-1.073159, -0.433328, -1.866087, 1, 0.772549, 0, 1,
-1.072736, -0.656575, -2.698467, 1, 0.7803922, 0, 1,
-1.06978, 1.085123, -1.27731, 1, 0.7843137, 0, 1,
-1.066444, 0.5578032, -3.167239, 1, 0.7921569, 0, 1,
-1.062732, 1.200363, -0.1337984, 1, 0.7960784, 0, 1,
-1.051307, 1.997877, -0.95374, 1, 0.8039216, 0, 1,
-1.049506, -0.09501787, -0.2254205, 1, 0.8117647, 0, 1,
-1.044656, 0.3230428, -1.20712, 1, 0.8156863, 0, 1,
-1.043451, 0.8879957, 0.2768291, 1, 0.8235294, 0, 1,
-1.040227, -1.315624, -1.168416, 1, 0.827451, 0, 1,
-1.03239, -1.496602, -5.176344, 1, 0.8352941, 0, 1,
-1.031139, -0.5738671, -0.8367301, 1, 0.8392157, 0, 1,
-1.028137, -0.8207478, -1.962218, 1, 0.8470588, 0, 1,
-1.023867, 0.8141986, -0.980245, 1, 0.8509804, 0, 1,
-1.023359, 1.907696, -2.501652, 1, 0.8588235, 0, 1,
-1.022559, 0.2748908, -2.30013, 1, 0.8627451, 0, 1,
-1.019892, 2.162332, -0.5940456, 1, 0.8705882, 0, 1,
-1.018728, -0.5274419, -2.166442, 1, 0.8745098, 0, 1,
-1.018487, -0.2854797, -1.930021, 1, 0.8823529, 0, 1,
-1.014979, 0.9676126, 0.448925, 1, 0.8862745, 0, 1,
-1.010826, 0.8576775, 0.2054936, 1, 0.8941177, 0, 1,
-1.0101, -1.068836, -0.9939503, 1, 0.8980392, 0, 1,
-1.007514, 0.635224, -0.6109402, 1, 0.9058824, 0, 1,
-1.005005, -0.1279318, -0.5705248, 1, 0.9137255, 0, 1,
-1.003495, 1.154514, -1.218858, 1, 0.9176471, 0, 1,
-0.9898987, -0.5452319, 0.2293477, 1, 0.9254902, 0, 1,
-0.9844233, 0.9667209, -2.830937, 1, 0.9294118, 0, 1,
-0.9794616, 0.05135581, -0.8515159, 1, 0.9372549, 0, 1,
-0.9739674, -1.248757, -3.346355, 1, 0.9411765, 0, 1,
-0.9737601, 0.09501, -2.626944, 1, 0.9490196, 0, 1,
-0.970996, 0.8095822, -0.9725961, 1, 0.9529412, 0, 1,
-0.9541172, 0.7018563, -0.6403459, 1, 0.9607843, 0, 1,
-0.9520088, -2.827389, -2.965805, 1, 0.9647059, 0, 1,
-0.9468942, -2.609222, -1.762883, 1, 0.972549, 0, 1,
-0.9466506, 1.062419, -0.141424, 1, 0.9764706, 0, 1,
-0.9462925, -0.07215968, -1.962607, 1, 0.9843137, 0, 1,
-0.9406096, 0.9822194, -2.353502, 1, 0.9882353, 0, 1,
-0.9401916, -2.719589, -3.417095, 1, 0.9960784, 0, 1,
-0.9395775, -0.3658754, -1.888664, 0.9960784, 1, 0, 1,
-0.9312955, -0.3501599, -1.461765, 0.9921569, 1, 0, 1,
-0.9311618, 1.128637, -1.267893, 0.9843137, 1, 0, 1,
-0.9298306, -1.545647, -3.401567, 0.9803922, 1, 0, 1,
-0.926608, -1.697201, -1.739588, 0.972549, 1, 0, 1,
-0.9253074, -0.4611012, -2.445428, 0.9686275, 1, 0, 1,
-0.9217232, -0.8390559, -3.605014, 0.9607843, 1, 0, 1,
-0.9214709, -0.6604838, -3.072978, 0.9568627, 1, 0, 1,
-0.919082, 0.3476796, 0.4956636, 0.9490196, 1, 0, 1,
-0.9176232, 1.288249, -1.232841, 0.945098, 1, 0, 1,
-0.9172296, -0.01377789, -1.936573, 0.9372549, 1, 0, 1,
-0.9144088, 0.894097, -0.7533494, 0.9333333, 1, 0, 1,
-0.9001516, -0.7565151, -2.505907, 0.9254902, 1, 0, 1,
-0.892464, 2.243585, -1.114998, 0.9215686, 1, 0, 1,
-0.8901948, -1.162024, 0.1550595, 0.9137255, 1, 0, 1,
-0.8816966, -0.5779815, -2.84761, 0.9098039, 1, 0, 1,
-0.8782524, -0.285694, 0.4943009, 0.9019608, 1, 0, 1,
-0.8765047, -0.150314, -1.893572, 0.8941177, 1, 0, 1,
-0.8697929, 0.3458228, -1.827747, 0.8901961, 1, 0, 1,
-0.864596, -1.4059, -4.061633, 0.8823529, 1, 0, 1,
-0.8594936, 1.312336, -1.392839, 0.8784314, 1, 0, 1,
-0.85904, -0.3942229, -0.5140467, 0.8705882, 1, 0, 1,
-0.8578776, -0.8115646, -1.169115, 0.8666667, 1, 0, 1,
-0.8551477, -1.024331, -0.3849125, 0.8588235, 1, 0, 1,
-0.854458, 1.063899, 0.7936733, 0.854902, 1, 0, 1,
-0.8541672, -1.233518, -1.893345, 0.8470588, 1, 0, 1,
-0.8509643, 0.1957568, -3.321569, 0.8431373, 1, 0, 1,
-0.8502915, 0.2830457, -1.657467, 0.8352941, 1, 0, 1,
-0.844099, -0.08933715, -0.766078, 0.8313726, 1, 0, 1,
-0.8417901, -1.195195, -2.596152, 0.8235294, 1, 0, 1,
-0.8394107, -0.9222357, -3.638788, 0.8196079, 1, 0, 1,
-0.8372957, -1.238841, -1.973761, 0.8117647, 1, 0, 1,
-0.8368356, -0.2541052, -2.461106, 0.8078431, 1, 0, 1,
-0.834718, 0.1018905, -3.596176, 0.8, 1, 0, 1,
-0.8256606, -0.4324108, -2.639254, 0.7921569, 1, 0, 1,
-0.8178198, 0.09871478, -2.767417, 0.7882353, 1, 0, 1,
-0.8128501, 0.5824718, 0.2055214, 0.7803922, 1, 0, 1,
-0.8127918, 0.7667993, -0.4053712, 0.7764706, 1, 0, 1,
-0.8120437, -0.333783, -1.924886, 0.7686275, 1, 0, 1,
-0.8113187, 0.2314683, 0.4557392, 0.7647059, 1, 0, 1,
-0.8100565, 0.01625578, -0.9364545, 0.7568628, 1, 0, 1,
-0.8014811, 1.714989, -1.506433, 0.7529412, 1, 0, 1,
-0.8012614, 1.055272, -0.8023281, 0.7450981, 1, 0, 1,
-0.798301, 1.768192, 0.2668247, 0.7411765, 1, 0, 1,
-0.7982808, -0.3125306, -1.073838, 0.7333333, 1, 0, 1,
-0.7920551, 0.707489, 2.022462, 0.7294118, 1, 0, 1,
-0.7797997, -2.049593, -3.181024, 0.7215686, 1, 0, 1,
-0.7771659, -0.08591777, -1.364155, 0.7176471, 1, 0, 1,
-0.775496, 1.533633, -2.76451, 0.7098039, 1, 0, 1,
-0.7705277, -0.5423265, -1.531156, 0.7058824, 1, 0, 1,
-0.7647145, 1.241893, -2.246777, 0.6980392, 1, 0, 1,
-0.7646621, -0.6236838, -0.9782048, 0.6901961, 1, 0, 1,
-0.7641109, -0.9999761, -2.090981, 0.6862745, 1, 0, 1,
-0.7597313, -0.9123331, -1.651441, 0.6784314, 1, 0, 1,
-0.7322086, 0.6249191, -0.4793233, 0.6745098, 1, 0, 1,
-0.7300321, 0.1358316, -2.994956, 0.6666667, 1, 0, 1,
-0.729722, 0.04191174, -0.8164917, 0.6627451, 1, 0, 1,
-0.7296866, -0.06981687, -0.8165562, 0.654902, 1, 0, 1,
-0.7277775, 0.4385719, 0.140455, 0.6509804, 1, 0, 1,
-0.7264444, -0.2437836, -2.272331, 0.6431373, 1, 0, 1,
-0.7260751, -0.9285796, -1.923273, 0.6392157, 1, 0, 1,
-0.7216374, 1.245788, -0.5234417, 0.6313726, 1, 0, 1,
-0.7210234, -1.766835, -2.94956, 0.627451, 1, 0, 1,
-0.7172948, -0.2635955, -2.566252, 0.6196079, 1, 0, 1,
-0.7132028, -1.263383, -3.479433, 0.6156863, 1, 0, 1,
-0.7096368, -0.8386337, -4.663288, 0.6078432, 1, 0, 1,
-0.7049441, 0.2286995, -0.07206867, 0.6039216, 1, 0, 1,
-0.7043924, 0.4625628, 2.205848, 0.5960785, 1, 0, 1,
-0.7031977, -0.9458345, -3.765564, 0.5882353, 1, 0, 1,
-0.6979171, -0.3171245, -2.987932, 0.5843138, 1, 0, 1,
-0.6959665, -0.8089167, -1.755081, 0.5764706, 1, 0, 1,
-0.6955408, -0.1080905, -1.154269, 0.572549, 1, 0, 1,
-0.6944663, 0.6393986, 0.1853439, 0.5647059, 1, 0, 1,
-0.6920539, 0.1409502, -1.435699, 0.5607843, 1, 0, 1,
-0.6902888, -1.192779, -2.605016, 0.5529412, 1, 0, 1,
-0.6880525, -0.8122767, -4.021322, 0.5490196, 1, 0, 1,
-0.6868828, 0.4722361, -1.95182, 0.5411765, 1, 0, 1,
-0.6811581, -0.4066977, -3.303534, 0.5372549, 1, 0, 1,
-0.6752494, 0.02248264, -1.902334, 0.5294118, 1, 0, 1,
-0.6566865, -2.3006, -3.321262, 0.5254902, 1, 0, 1,
-0.6517524, -1.872749, -1.790727, 0.5176471, 1, 0, 1,
-0.6483707, -0.1726573, -1.978299, 0.5137255, 1, 0, 1,
-0.6472707, 0.6830139, 0.6511195, 0.5058824, 1, 0, 1,
-0.6428838, 0.5641485, -0.7659599, 0.5019608, 1, 0, 1,
-0.6410774, -1.156059, -2.878943, 0.4941176, 1, 0, 1,
-0.6399583, 1.059123, -0.8839107, 0.4862745, 1, 0, 1,
-0.6359907, 0.7670765, -1.988706, 0.4823529, 1, 0, 1,
-0.6284525, -1.548336, -3.270007, 0.4745098, 1, 0, 1,
-0.6240519, 0.05752093, 0.4315207, 0.4705882, 1, 0, 1,
-0.6147929, -1.917176, -2.762228, 0.4627451, 1, 0, 1,
-0.6144823, -0.9691901, -2.586182, 0.4588235, 1, 0, 1,
-0.6031504, 0.2852049, -0.08591678, 0.4509804, 1, 0, 1,
-0.6005489, -1.724154, -2.339818, 0.4470588, 1, 0, 1,
-0.6002563, -0.6668064, -3.404904, 0.4392157, 1, 0, 1,
-0.599404, 0.03708631, -2.353365, 0.4352941, 1, 0, 1,
-0.5980557, 0.5428306, -0.0341372, 0.427451, 1, 0, 1,
-0.5976887, -1.504519, -4.007799, 0.4235294, 1, 0, 1,
-0.5903266, 0.6955335, -1.051046, 0.4156863, 1, 0, 1,
-0.5862274, 0.7000052, 0.3440472, 0.4117647, 1, 0, 1,
-0.5850281, 0.6583961, 0.9639702, 0.4039216, 1, 0, 1,
-0.5835964, 0.150628, -2.685219, 0.3960784, 1, 0, 1,
-0.5815462, 0.1630494, 0.2234145, 0.3921569, 1, 0, 1,
-0.5814227, -0.8141811, -1.798249, 0.3843137, 1, 0, 1,
-0.5812297, -0.3258123, -1.910596, 0.3803922, 1, 0, 1,
-0.5775501, 2.34657, -2.035099, 0.372549, 1, 0, 1,
-0.5769963, 2.199502, 0.9808413, 0.3686275, 1, 0, 1,
-0.5741723, -1.001631, -3.751918, 0.3607843, 1, 0, 1,
-0.5638414, -0.05766482, -2.835727, 0.3568628, 1, 0, 1,
-0.5634686, 0.3570535, -0.7802222, 0.3490196, 1, 0, 1,
-0.5625482, 1.375801, 0.2649965, 0.345098, 1, 0, 1,
-0.5597593, -0.1742129, -1.799357, 0.3372549, 1, 0, 1,
-0.5590699, -0.6463493, -1.242015, 0.3333333, 1, 0, 1,
-0.5556862, 0.9992229, 0.499327, 0.3254902, 1, 0, 1,
-0.5537391, -1.235471, -3.497483, 0.3215686, 1, 0, 1,
-0.5506617, 1.953191, -1.013497, 0.3137255, 1, 0, 1,
-0.5481252, -1.972674, -1.558057, 0.3098039, 1, 0, 1,
-0.5395304, 0.3231855, -0.8444682, 0.3019608, 1, 0, 1,
-0.5347456, 1.638281, 0.6668605, 0.2941177, 1, 0, 1,
-0.5345961, 0.9997546, -1.151271, 0.2901961, 1, 0, 1,
-0.5287876, 0.134882, -2.198494, 0.282353, 1, 0, 1,
-0.528389, 0.005347401, -0.2681311, 0.2784314, 1, 0, 1,
-0.5267377, -0.2058609, -2.433813, 0.2705882, 1, 0, 1,
-0.5174704, 0.0008078276, -3.319199, 0.2666667, 1, 0, 1,
-0.5098886, 0.5549952, -2.076735, 0.2588235, 1, 0, 1,
-0.5091889, -1.13987, -1.469846, 0.254902, 1, 0, 1,
-0.5084206, 1.400588, -0.3760904, 0.2470588, 1, 0, 1,
-0.5040437, 1.615764, -0.3123198, 0.2431373, 1, 0, 1,
-0.5001621, -1.070194, -3.426526, 0.2352941, 1, 0, 1,
-0.499201, 1.239472, 0.3051982, 0.2313726, 1, 0, 1,
-0.4913076, -1.079024, -3.384935, 0.2235294, 1, 0, 1,
-0.4911158, 0.6878406, -0.2260202, 0.2196078, 1, 0, 1,
-0.4907279, -0.3476629, -2.717973, 0.2117647, 1, 0, 1,
-0.485836, 0.5134172, -0.5721055, 0.2078431, 1, 0, 1,
-0.4837269, 0.07317107, -0.6063711, 0.2, 1, 0, 1,
-0.4836093, 1.127173, -0.3894221, 0.1921569, 1, 0, 1,
-0.4786173, -0.8517992, -1.850367, 0.1882353, 1, 0, 1,
-0.4766477, 0.2419073, -2.757052, 0.1803922, 1, 0, 1,
-0.476447, 0.5164127, -0.7967189, 0.1764706, 1, 0, 1,
-0.4755341, 0.8823362, -1.01592, 0.1686275, 1, 0, 1,
-0.4754194, -0.912484, -1.3595, 0.1647059, 1, 0, 1,
-0.474929, -0.7913277, -2.518303, 0.1568628, 1, 0, 1,
-0.4749252, -0.7092013, -2.669966, 0.1529412, 1, 0, 1,
-0.4669427, 0.594058, -0.9077042, 0.145098, 1, 0, 1,
-0.4668134, 1.71755, -1.539119, 0.1411765, 1, 0, 1,
-0.4639091, 1.333477, 1.999987, 0.1333333, 1, 0, 1,
-0.4619993, -1.085605, -2.084784, 0.1294118, 1, 0, 1,
-0.4609686, -1.302934, -1.72025, 0.1215686, 1, 0, 1,
-0.4582267, -0.7352669, -1.910847, 0.1176471, 1, 0, 1,
-0.4571828, -1.338581, -2.538123, 0.1098039, 1, 0, 1,
-0.4568361, 0.5956761, 1.297483, 0.1058824, 1, 0, 1,
-0.4554788, -0.06946107, -0.8636325, 0.09803922, 1, 0, 1,
-0.4548364, -0.05916357, -0.8844341, 0.09019608, 1, 0, 1,
-0.452087, 1.242153, -0.4502667, 0.08627451, 1, 0, 1,
-0.4520498, -0.001920899, -0.9656647, 0.07843138, 1, 0, 1,
-0.4516036, 0.6087813, 0.3962135, 0.07450981, 1, 0, 1,
-0.448792, 0.7374448, 1.320993, 0.06666667, 1, 0, 1,
-0.4461048, 0.5084782, 1.486217, 0.0627451, 1, 0, 1,
-0.445059, -1.689542, -2.829047, 0.05490196, 1, 0, 1,
-0.4415146, -0.07672079, -2.737337, 0.05098039, 1, 0, 1,
-0.4404111, 0.2846966, -1.557793, 0.04313726, 1, 0, 1,
-0.4398683, -1.437477, -3.951478, 0.03921569, 1, 0, 1,
-0.4387805, 0.6921622, -1.204881, 0.03137255, 1, 0, 1,
-0.4357705, 0.0438261, -0.8030089, 0.02745098, 1, 0, 1,
-0.4337227, 1.682654, -1.722765, 0.01960784, 1, 0, 1,
-0.4296983, 0.002216268, -1.652733, 0.01568628, 1, 0, 1,
-0.4293273, -0.189342, -1.290766, 0.007843138, 1, 0, 1,
-0.4277131, -0.008820279, -1.074597, 0.003921569, 1, 0, 1,
-0.4239331, 1.109083, 0.4452892, 0, 1, 0.003921569, 1,
-0.4209344, -0.9053725, -1.571636, 0, 1, 0.01176471, 1,
-0.4176683, -0.5681817, -2.557098, 0, 1, 0.01568628, 1,
-0.4119434, 0.3540202, -0.8942354, 0, 1, 0.02352941, 1,
-0.4110365, -2.43824, -3.140153, 0, 1, 0.02745098, 1,
-0.409634, -0.5310575, -2.69846, 0, 1, 0.03529412, 1,
-0.409522, 0.3346627, -0.401236, 0, 1, 0.03921569, 1,
-0.4067276, 0.04180013, -1.834857, 0, 1, 0.04705882, 1,
-0.4038157, 2.006735, -0.4282584, 0, 1, 0.05098039, 1,
-0.4018921, -0.6154252, -2.818137, 0, 1, 0.05882353, 1,
-0.401123, 0.3132505, -1.31057, 0, 1, 0.0627451, 1,
-0.3987659, -0.8134872, -1.384524, 0, 1, 0.07058824, 1,
-0.3981027, -0.4770683, -2.207574, 0, 1, 0.07450981, 1,
-0.3959366, 0.1297635, -1.211475, 0, 1, 0.08235294, 1,
-0.3904197, 0.5443481, -1.777038, 0, 1, 0.08627451, 1,
-0.3895079, 1.338281, -0.6594149, 0, 1, 0.09411765, 1,
-0.3892552, -0.2851921, -1.818969, 0, 1, 0.1019608, 1,
-0.3883016, -0.50337, -2.012928, 0, 1, 0.1058824, 1,
-0.3873795, 0.4064547, -0.09064806, 0, 1, 0.1137255, 1,
-0.3872434, 0.5816903, -0.6287363, 0, 1, 0.1176471, 1,
-0.3826194, 0.3855225, -2.20488, 0, 1, 0.1254902, 1,
-0.3811851, 0.3170933, -1.177811, 0, 1, 0.1294118, 1,
-0.3776665, -0.8796298, -0.8477634, 0, 1, 0.1372549, 1,
-0.3752635, -0.506653, -3.606071, 0, 1, 0.1411765, 1,
-0.3712617, 0.2624586, -0.9521065, 0, 1, 0.1490196, 1,
-0.3672288, -0.5388376, -2.673906, 0, 1, 0.1529412, 1,
-0.3664976, 0.3180624, 0.6476759, 0, 1, 0.1607843, 1,
-0.3634036, -0.757565, -0.5864134, 0, 1, 0.1647059, 1,
-0.3622169, 0.8804922, 0.5388929, 0, 1, 0.172549, 1,
-0.362187, -0.155437, -1.319083, 0, 1, 0.1764706, 1,
-0.3621147, -0.9152384, -3.91945, 0, 1, 0.1843137, 1,
-0.3589888, -0.9006595, -1.895698, 0, 1, 0.1882353, 1,
-0.3586235, 1.002729, -0.6888173, 0, 1, 0.1960784, 1,
-0.3555923, -0.6562262, -1.870453, 0, 1, 0.2039216, 1,
-0.3534591, -0.5312228, -3.662126, 0, 1, 0.2078431, 1,
-0.3524817, 0.5311918, -0.8797222, 0, 1, 0.2156863, 1,
-0.3517177, -1.750759, -2.894408, 0, 1, 0.2196078, 1,
-0.3481193, 0.0434191, -0.8939868, 0, 1, 0.227451, 1,
-0.3480243, -0.01663639, -0.4774426, 0, 1, 0.2313726, 1,
-0.3473215, -1.314999, -2.76554, 0, 1, 0.2392157, 1,
-0.3444789, 0.9994648, -1.730548, 0, 1, 0.2431373, 1,
-0.337805, -0.3018926, -3.511661, 0, 1, 0.2509804, 1,
-0.3370716, 0.3697235, -1.390792, 0, 1, 0.254902, 1,
-0.3354305, 1.517644, 0.8679014, 0, 1, 0.2627451, 1,
-0.3339765, 0.1019193, -2.451891, 0, 1, 0.2666667, 1,
-0.3335206, 0.9933557, -0.6659791, 0, 1, 0.2745098, 1,
-0.3307154, 1.23113, -1.821698, 0, 1, 0.2784314, 1,
-0.3301466, 0.8138053, -0.2008107, 0, 1, 0.2862745, 1,
-0.3285412, 1.040749, 0.06028688, 0, 1, 0.2901961, 1,
-0.3279572, -0.6176881, -3.371519, 0, 1, 0.2980392, 1,
-0.3256029, -1.062621, -3.568232, 0, 1, 0.3058824, 1,
-0.3219719, -0.03565099, -2.880477, 0, 1, 0.3098039, 1,
-0.3217782, -0.2833928, -3.427212, 0, 1, 0.3176471, 1,
-0.3202119, 0.2926909, -1.403012, 0, 1, 0.3215686, 1,
-0.3161087, 0.8556835, -0.5091435, 0, 1, 0.3294118, 1,
-0.3018495, 0.2542081, -0.7714974, 0, 1, 0.3333333, 1,
-0.3013765, 0.1553709, -0.9386427, 0, 1, 0.3411765, 1,
-0.2963005, 1.46749, 0.8617549, 0, 1, 0.345098, 1,
-0.2958211, 1.364052, 0.4114483, 0, 1, 0.3529412, 1,
-0.293071, 0.5100635, -0.3069282, 0, 1, 0.3568628, 1,
-0.291065, 1.319974, 0.9182568, 0, 1, 0.3647059, 1,
-0.2839553, -0.08954719, -2.278587, 0, 1, 0.3686275, 1,
-0.2789608, 1.011087, -0.3524757, 0, 1, 0.3764706, 1,
-0.2782573, 0.1141475, -3.60186, 0, 1, 0.3803922, 1,
-0.2780517, -1.180989, -4.683066, 0, 1, 0.3882353, 1,
-0.2779557, 1.87322, -2.273003, 0, 1, 0.3921569, 1,
-0.2771153, -1.378849, -4.212711, 0, 1, 0.4, 1,
-0.2770866, 1.511153, -0.8380979, 0, 1, 0.4078431, 1,
-0.2767733, -0.08892506, -2.048873, 0, 1, 0.4117647, 1,
-0.2757564, -0.8602889, -3.548994, 0, 1, 0.4196078, 1,
-0.2651778, 0.1166272, -0.9514843, 0, 1, 0.4235294, 1,
-0.2632702, 1.355849, -0.06470311, 0, 1, 0.4313726, 1,
-0.2623143, 1.219344, 1.661278, 0, 1, 0.4352941, 1,
-0.26022, 0.5402062, 0.5840037, 0, 1, 0.4431373, 1,
-0.2597387, 0.130633, -2.293778, 0, 1, 0.4470588, 1,
-0.2590765, 0.7523278, -0.9962755, 0, 1, 0.454902, 1,
-0.2584427, -0.1830037, -2.769207, 0, 1, 0.4588235, 1,
-0.2543977, -2.29336, -2.708078, 0, 1, 0.4666667, 1,
-0.252006, 0.1351947, -2.014094, 0, 1, 0.4705882, 1,
-0.2468922, -1.80085, -3.021277, 0, 1, 0.4784314, 1,
-0.2468156, 0.588513, -1.28394, 0, 1, 0.4823529, 1,
-0.246368, 0.433394, 0.7432883, 0, 1, 0.4901961, 1,
-0.2449929, -0.6443762, -2.565467, 0, 1, 0.4941176, 1,
-0.2393703, 0.4657589, -0.8552932, 0, 1, 0.5019608, 1,
-0.2324047, 0.9881201, -1.349054, 0, 1, 0.509804, 1,
-0.2320102, -0.5040892, -2.438568, 0, 1, 0.5137255, 1,
-0.2315677, -0.3597109, -3.737017, 0, 1, 0.5215687, 1,
-0.2265542, 1.142995, 0.1729658, 0, 1, 0.5254902, 1,
-0.2228343, -0.4802835, -3.002053, 0, 1, 0.5333334, 1,
-0.2225596, 0.4638693, -1.07686, 0, 1, 0.5372549, 1,
-0.2219476, -0.3713243, -2.241393, 0, 1, 0.5450981, 1,
-0.2166556, -0.3097675, -0.6397907, 0, 1, 0.5490196, 1,
-0.2162368, 1.173483, -2.491967, 0, 1, 0.5568628, 1,
-0.2157705, -0.0396851, -1.532728, 0, 1, 0.5607843, 1,
-0.2070242, -1.216914, -1.974706, 0, 1, 0.5686275, 1,
-0.2065836, -0.9756992, -4.529744, 0, 1, 0.572549, 1,
-0.2057756, -0.774675, -1.705752, 0, 1, 0.5803922, 1,
-0.2036738, -0.8714319, -1.355206, 0, 1, 0.5843138, 1,
-0.1997026, 1.693113, 1.953126, 0, 1, 0.5921569, 1,
-0.1951749, -0.5247443, -1.6576, 0, 1, 0.5960785, 1,
-0.1928681, 1.538125, -1.088421, 0, 1, 0.6039216, 1,
-0.1895963, 0.8191312, -1.263581, 0, 1, 0.6117647, 1,
-0.1773015, -1.248979, -3.01773, 0, 1, 0.6156863, 1,
-0.1758714, -1.123736, -3.634166, 0, 1, 0.6235294, 1,
-0.1749713, -1.607383, -2.065403, 0, 1, 0.627451, 1,
-0.1746805, -1.707181, -3.977153, 0, 1, 0.6352941, 1,
-0.1710644, -0.6824195, -4.236627, 0, 1, 0.6392157, 1,
-0.1657586, -0.6816831, -3.294797, 0, 1, 0.6470588, 1,
-0.1600048, 0.2771825, -0.8771544, 0, 1, 0.6509804, 1,
-0.1588177, 1.649423, 1.142483, 0, 1, 0.6588235, 1,
-0.1579456, 0.6963519, 0.2328783, 0, 1, 0.6627451, 1,
-0.156688, 1.780163, -1.432146, 0, 1, 0.6705883, 1,
-0.1494939, 0.76903, 2.27692, 0, 1, 0.6745098, 1,
-0.1477401, 0.510151, 1.987075, 0, 1, 0.682353, 1,
-0.1426482, -0.5776109, -3.327631, 0, 1, 0.6862745, 1,
-0.1397062, 0.3989667, -1.384605, 0, 1, 0.6941177, 1,
-0.139295, 0.9996858, -1.196383, 0, 1, 0.7019608, 1,
-0.1366819, -0.3112967, -2.866986, 0, 1, 0.7058824, 1,
-0.1321824, 0.1332669, -0.1417843, 0, 1, 0.7137255, 1,
-0.1320993, 1.099089, -0.6050924, 0, 1, 0.7176471, 1,
-0.1313078, 0.4986977, -0.755916, 0, 1, 0.7254902, 1,
-0.1292021, 0.8363425, 0.03086693, 0, 1, 0.7294118, 1,
-0.1288645, 0.2025678, -0.3568649, 0, 1, 0.7372549, 1,
-0.1274984, 0.4384166, -1.619315, 0, 1, 0.7411765, 1,
-0.127037, 1.633776, -1.951658, 0, 1, 0.7490196, 1,
-0.1244025, 0.464518, 0.4300517, 0, 1, 0.7529412, 1,
-0.1202387, 1.347777, -0.6781102, 0, 1, 0.7607843, 1,
-0.1167091, 0.5197551, -0.2609853, 0, 1, 0.7647059, 1,
-0.1124805, -0.04502428, -3.133279, 0, 1, 0.772549, 1,
-0.111317, 0.5702811, -1.349559, 0, 1, 0.7764706, 1,
-0.1025017, 1.209823, 1.194429, 0, 1, 0.7843137, 1,
-0.09647525, -0.5561185, -3.485445, 0, 1, 0.7882353, 1,
-0.0960771, -0.4514913, -3.703001, 0, 1, 0.7960784, 1,
-0.09002822, -1.438237, -1.932209, 0, 1, 0.8039216, 1,
-0.08601964, 0.5888882, 0.0353689, 0, 1, 0.8078431, 1,
-0.08335558, 2.019561, 0.6556476, 0, 1, 0.8156863, 1,
-0.08097526, -0.1342368, -1.455611, 0, 1, 0.8196079, 1,
-0.0777989, 0.1969056, -0.7046259, 0, 1, 0.827451, 1,
-0.07013866, 0.6427073, -0.8104395, 0, 1, 0.8313726, 1,
-0.06971709, 0.5225849, 1.588602, 0, 1, 0.8392157, 1,
-0.06867183, -0.1071569, -1.32099, 0, 1, 0.8431373, 1,
-0.06593514, 0.3460758, -2.440956, 0, 1, 0.8509804, 1,
-0.06536032, 0.4721646, -1.802001, 0, 1, 0.854902, 1,
-0.06326995, 1.466276, 0.4898306, 0, 1, 0.8627451, 1,
-0.05225601, -0.7162579, -3.657291, 0, 1, 0.8666667, 1,
-0.05083208, -0.9062271, -4.407425, 0, 1, 0.8745098, 1,
-0.05010339, -0.06092672, -2.361753, 0, 1, 0.8784314, 1,
-0.04880793, -0.505833, -1.731016, 0, 1, 0.8862745, 1,
-0.04719254, -0.2347539, -3.177567, 0, 1, 0.8901961, 1,
-0.04398672, -0.07649329, -2.702117, 0, 1, 0.8980392, 1,
-0.042872, -0.1355923, -0.8717954, 0, 1, 0.9058824, 1,
-0.04202564, 1.081831, -0.1984099, 0, 1, 0.9098039, 1,
-0.04077319, -1.716491, -2.95215, 0, 1, 0.9176471, 1,
-0.03591905, 0.5261934, -1.313941, 0, 1, 0.9215686, 1,
-0.03554524, 0.01332088, -1.22257, 0, 1, 0.9294118, 1,
-0.03420927, -1.435983, -6.14683, 0, 1, 0.9333333, 1,
-0.03189034, 0.7382243, -0.2726796, 0, 1, 0.9411765, 1,
-0.03179413, 0.3906846, -0.5119929, 0, 1, 0.945098, 1,
-0.03111058, -1.210076, -2.548098, 0, 1, 0.9529412, 1,
-0.03089637, 0.2919696, -0.09712124, 0, 1, 0.9568627, 1,
-0.03038011, 0.8374278, 0.9522911, 0, 1, 0.9647059, 1,
-0.02982039, -0.8059128, -5.426133, 0, 1, 0.9686275, 1,
-0.0248593, -1.133812, -3.715223, 0, 1, 0.9764706, 1,
-0.02359427, -0.05009385, -2.013258, 0, 1, 0.9803922, 1,
-0.01898649, -1.252941, -2.981654, 0, 1, 0.9882353, 1,
-0.01461512, -0.2719954, -4.809165, 0, 1, 0.9921569, 1,
-0.01391388, -0.925036, -3.088772, 0, 1, 1, 1,
-0.008688186, 0.5637055, 0.2223011, 0, 0.9921569, 1, 1,
-0.008329492, -0.827463, -4.74935, 0, 0.9882353, 1, 1,
-0.002912969, -1.711889, -3.182564, 0, 0.9803922, 1, 1,
0.0001389397, -0.6658417, 3.591505, 0, 0.9764706, 1, 1,
0.006774063, 0.5055583, 0.5414866, 0, 0.9686275, 1, 1,
0.007839419, 1.153525, -0.9861082, 0, 0.9647059, 1, 1,
0.008826499, 0.4825997, -1.300735, 0, 0.9568627, 1, 1,
0.01316036, -0.6046185, 2.250087, 0, 0.9529412, 1, 1,
0.01356742, -0.2135866, 3.994001, 0, 0.945098, 1, 1,
0.01633499, 0.9918279, 0.5097719, 0, 0.9411765, 1, 1,
0.01785015, 0.3548632, -1.564145, 0, 0.9333333, 1, 1,
0.01895727, 0.3110635, -0.2746094, 0, 0.9294118, 1, 1,
0.02661477, 0.8725098, 0.01923264, 0, 0.9215686, 1, 1,
0.02704827, 0.2309152, 1.361578, 0, 0.9176471, 1, 1,
0.02792464, 2.425783, -1.052008, 0, 0.9098039, 1, 1,
0.0283006, 1.243994, -0.1738305, 0, 0.9058824, 1, 1,
0.02904001, -0.1221198, 3.963815, 0, 0.8980392, 1, 1,
0.03058487, -0.7571793, 4.940679, 0, 0.8901961, 1, 1,
0.03096256, -1.042707, 2.662171, 0, 0.8862745, 1, 1,
0.03104541, -0.2006447, 3.398613, 0, 0.8784314, 1, 1,
0.0342785, -0.3733221, 2.628494, 0, 0.8745098, 1, 1,
0.03448339, -0.9137159, 3.896892, 0, 0.8666667, 1, 1,
0.03455575, -0.1208894, 2.028102, 0, 0.8627451, 1, 1,
0.04048708, -0.5118181, 3.796343, 0, 0.854902, 1, 1,
0.04143831, 1.246941, 0.2022182, 0, 0.8509804, 1, 1,
0.04190072, 0.1592989, 0.4674324, 0, 0.8431373, 1, 1,
0.04317316, 0.169837, -0.08400571, 0, 0.8392157, 1, 1,
0.04376383, 0.160562, 0.4200316, 0, 0.8313726, 1, 1,
0.0457517, 2.135585, -1.294198, 0, 0.827451, 1, 1,
0.04968818, -1.214581, 3.969388, 0, 0.8196079, 1, 1,
0.05116044, 0.7369748, -0.1179191, 0, 0.8156863, 1, 1,
0.05293175, 1.686587, 0.4262715, 0, 0.8078431, 1, 1,
0.05307145, -0.4541375, 2.041745, 0, 0.8039216, 1, 1,
0.05533405, -0.5498168, 3.671416, 0, 0.7960784, 1, 1,
0.05713733, -0.9384801, 0.5129874, 0, 0.7882353, 1, 1,
0.05728246, -0.4441424, 2.256422, 0, 0.7843137, 1, 1,
0.05762436, -1.613424, 4.032314, 0, 0.7764706, 1, 1,
0.06019004, 0.3388513, 0.7823206, 0, 0.772549, 1, 1,
0.06287427, 0.7495716, 0.946824, 0, 0.7647059, 1, 1,
0.06795236, 0.2740005, 0.7478192, 0, 0.7607843, 1, 1,
0.0715623, 0.8759053, 1.428356, 0, 0.7529412, 1, 1,
0.07446131, -1.460176, 3.294884, 0, 0.7490196, 1, 1,
0.07592897, 0.09603053, 1.434882, 0, 0.7411765, 1, 1,
0.08377665, 0.1249112, 2.334408, 0, 0.7372549, 1, 1,
0.08572751, 0.4581935, 1.184245, 0, 0.7294118, 1, 1,
0.08712731, -0.9139456, 3.966259, 0, 0.7254902, 1, 1,
0.09080049, 2.198869, -0.5172977, 0, 0.7176471, 1, 1,
0.09234411, 0.1509589, 0.2550193, 0, 0.7137255, 1, 1,
0.1029287, 0.1006772, 1.130174, 0, 0.7058824, 1, 1,
0.1059669, 0.1299657, 1.216037, 0, 0.6980392, 1, 1,
0.1141924, -0.2574648, 2.185888, 0, 0.6941177, 1, 1,
0.1145334, -0.506187, 4.72701, 0, 0.6862745, 1, 1,
0.1152324, -1.38346, 3.133142, 0, 0.682353, 1, 1,
0.1172201, -0.3237228, 2.287704, 0, 0.6745098, 1, 1,
0.1187756, 0.8344961, -1.118038, 0, 0.6705883, 1, 1,
0.119769, -1.148597, 2.858222, 0, 0.6627451, 1, 1,
0.1209272, -0.6483772, 3.481977, 0, 0.6588235, 1, 1,
0.1245262, -0.6945257, 4.255887, 0, 0.6509804, 1, 1,
0.125059, -0.2144202, 2.889086, 0, 0.6470588, 1, 1,
0.1259884, 0.6908946, 1.081325, 0, 0.6392157, 1, 1,
0.1275472, 0.6054088, 2.723727, 0, 0.6352941, 1, 1,
0.1288128, 0.03698216, 2.239185, 0, 0.627451, 1, 1,
0.1310683, -0.9250537, 3.669341, 0, 0.6235294, 1, 1,
0.1323616, -0.368807, 3.840351, 0, 0.6156863, 1, 1,
0.1324244, -0.1852081, 3.008356, 0, 0.6117647, 1, 1,
0.1380722, -1.516233, 1.787341, 0, 0.6039216, 1, 1,
0.1393001, 2.504096, -0.05851647, 0, 0.5960785, 1, 1,
0.1393474, 0.7396447, 0.2349251, 0, 0.5921569, 1, 1,
0.1405664, -1.782648, 1.143209, 0, 0.5843138, 1, 1,
0.1459161, 1.125051, 0.4005856, 0, 0.5803922, 1, 1,
0.1467171, -0.5835658, 3.813524, 0, 0.572549, 1, 1,
0.1512368, -0.282878, 3.313068, 0, 0.5686275, 1, 1,
0.1535958, -0.2444038, 1.182621, 0, 0.5607843, 1, 1,
0.1549489, 0.9572213, 0.08086745, 0, 0.5568628, 1, 1,
0.1551817, -0.2598979, 4.171531, 0, 0.5490196, 1, 1,
0.1562996, 0.7339619, 0.6378859, 0, 0.5450981, 1, 1,
0.1566555, 0.09230534, 0.3752598, 0, 0.5372549, 1, 1,
0.1604604, 1.346638, 0.2885602, 0, 0.5333334, 1, 1,
0.1617605, -1.534392, 2.274393, 0, 0.5254902, 1, 1,
0.1625761, -1.760869, 3.826229, 0, 0.5215687, 1, 1,
0.163175, -1.205943, 3.438828, 0, 0.5137255, 1, 1,
0.1642673, 0.6307103, 0.1488067, 0, 0.509804, 1, 1,
0.1683173, -2.056895, 4.652674, 0, 0.5019608, 1, 1,
0.1691751, -0.5717865, 1.512281, 0, 0.4941176, 1, 1,
0.1731748, 0.5714751, 0.1876623, 0, 0.4901961, 1, 1,
0.1735109, -0.7751867, 4.210069, 0, 0.4823529, 1, 1,
0.1783666, 0.2318153, 2.474487, 0, 0.4784314, 1, 1,
0.1830764, -1.964533, 4.314337, 0, 0.4705882, 1, 1,
0.1848711, -1.697853, 3.272131, 0, 0.4666667, 1, 1,
0.1864256, 0.9355991, 0.8741645, 0, 0.4588235, 1, 1,
0.1867605, 0.4174517, 1.243432, 0, 0.454902, 1, 1,
0.1869111, 0.06658495, 1.669331, 0, 0.4470588, 1, 1,
0.1871233, 1.175418, 0.03536125, 0, 0.4431373, 1, 1,
0.1892578, 0.2232309, 1.200343, 0, 0.4352941, 1, 1,
0.1914819, 0.9418468, 0.764944, 0, 0.4313726, 1, 1,
0.1925963, -0.9915231, 1.122913, 0, 0.4235294, 1, 1,
0.1936415, -1.587138, 1.212349, 0, 0.4196078, 1, 1,
0.1974337, 0.7317758, 1.334635, 0, 0.4117647, 1, 1,
0.1990641, 0.4334859, 0.6687495, 0, 0.4078431, 1, 1,
0.199097, -0.2459769, 3.24328, 0, 0.4, 1, 1,
0.1996182, -0.4592201, 1.682544, 0, 0.3921569, 1, 1,
0.2016728, 1.027599, 1.202031, 0, 0.3882353, 1, 1,
0.201846, -1.095369, 3.590815, 0, 0.3803922, 1, 1,
0.2055552, 1.544299, 0.6941003, 0, 0.3764706, 1, 1,
0.2113173, 0.06749083, 1.936494, 0, 0.3686275, 1, 1,
0.2130742, 0.1694613, 1.663585, 0, 0.3647059, 1, 1,
0.2170784, 0.07681482, 2.893558, 0, 0.3568628, 1, 1,
0.2207526, 1.227188, 0.6537079, 0, 0.3529412, 1, 1,
0.2242311, -1.783473, 3.33217, 0, 0.345098, 1, 1,
0.2247838, -0.9860496, 2.144448, 0, 0.3411765, 1, 1,
0.2249564, -0.5159836, 2.572487, 0, 0.3333333, 1, 1,
0.2259233, 0.5177663, 2.155807, 0, 0.3294118, 1, 1,
0.2308244, -2.142035, 4.184744, 0, 0.3215686, 1, 1,
0.2321026, 0.4899454, 0.2611607, 0, 0.3176471, 1, 1,
0.2348855, 0.2397361, -0.4351758, 0, 0.3098039, 1, 1,
0.2358222, -0.8192407, 2.689082, 0, 0.3058824, 1, 1,
0.2418006, 0.86838, -0.3392252, 0, 0.2980392, 1, 1,
0.2426564, 0.7071142, -0.2538281, 0, 0.2901961, 1, 1,
0.2432677, -1.08131, 1.866643, 0, 0.2862745, 1, 1,
0.243798, 0.822853, 1.358059, 0, 0.2784314, 1, 1,
0.2445238, -1.961558, 2.43325, 0, 0.2745098, 1, 1,
0.2465745, -0.292496, 3.055407, 0, 0.2666667, 1, 1,
0.2535885, -0.3133613, 1.737363, 0, 0.2627451, 1, 1,
0.2556887, -0.08042171, 1.331621, 0, 0.254902, 1, 1,
0.257322, 1.520982, -1.192327, 0, 0.2509804, 1, 1,
0.2582909, -1.043137, 0.8662672, 0, 0.2431373, 1, 1,
0.2613904, -0.9208589, 3.963787, 0, 0.2392157, 1, 1,
0.2640073, 1.518918, 0.891008, 0, 0.2313726, 1, 1,
0.2657541, -0.4948016, 2.082289, 0, 0.227451, 1, 1,
0.2659158, -1.429281, 1.817521, 0, 0.2196078, 1, 1,
0.2692142, 1.699297, 0.6781041, 0, 0.2156863, 1, 1,
0.2716543, 1.657843, 0.009687738, 0, 0.2078431, 1, 1,
0.2733216, -1.764771, 4.469936, 0, 0.2039216, 1, 1,
0.2744977, -0.3966435, 4.332546, 0, 0.1960784, 1, 1,
0.2782544, 0.8559815, 0.4479452, 0, 0.1882353, 1, 1,
0.2800384, 0.2455917, 0.7950895, 0, 0.1843137, 1, 1,
0.2808252, -1.274365, 1.911124, 0, 0.1764706, 1, 1,
0.282896, -0.5265943, 2.459987, 0, 0.172549, 1, 1,
0.2840855, 0.05939493, 2.131468, 0, 0.1647059, 1, 1,
0.2876226, 0.2671082, 0.1005191, 0, 0.1607843, 1, 1,
0.2939164, -0.263375, 3.12115, 0, 0.1529412, 1, 1,
0.2992904, 1.382597, -2.343764, 0, 0.1490196, 1, 1,
0.3004022, -0.966174, 3.037074, 0, 0.1411765, 1, 1,
0.3016026, 2.539025, 0.3449736, 0, 0.1372549, 1, 1,
0.3023246, -0.2537901, 1.431695, 0, 0.1294118, 1, 1,
0.3047591, 1.579715, -0.142367, 0, 0.1254902, 1, 1,
0.3068505, 0.7022028, -0.5688018, 0, 0.1176471, 1, 1,
0.3169369, -2.1349, 3.622794, 0, 0.1137255, 1, 1,
0.3181131, -0.1818076, 2.605417, 0, 0.1058824, 1, 1,
0.3235918, -0.05222907, 2.270074, 0, 0.09803922, 1, 1,
0.3269702, 0.3382145, 0.3047951, 0, 0.09411765, 1, 1,
0.3288396, -0.05959141, 1.19546, 0, 0.08627451, 1, 1,
0.3293216, -0.7911975, 2.338274, 0, 0.08235294, 1, 1,
0.3362626, 0.5869642, 0.2484448, 0, 0.07450981, 1, 1,
0.3364412, 0.09007955, 1.317381, 0, 0.07058824, 1, 1,
0.3409368, -1.530511, 3.215059, 0, 0.0627451, 1, 1,
0.3524021, -0.6040711, 3.697332, 0, 0.05882353, 1, 1,
0.3565567, 0.3177262, 1.075144, 0, 0.05098039, 1, 1,
0.3623288, -1.463771, 2.964409, 0, 0.04705882, 1, 1,
0.3630836, 0.3567413, 0.6250011, 0, 0.03921569, 1, 1,
0.3728873, -1.586333, 2.475227, 0, 0.03529412, 1, 1,
0.376952, 0.2489129, 1.1358, 0, 0.02745098, 1, 1,
0.3773659, 0.1514172, 0.2568556, 0, 0.02352941, 1, 1,
0.3827928, -0.2428178, 2.837232, 0, 0.01568628, 1, 1,
0.391185, 0.0937148, 0.4872098, 0, 0.01176471, 1, 1,
0.3988047, 0.0778882, 0.946246, 0, 0.003921569, 1, 1,
0.4066183, -1.096096, 1.781899, 0.003921569, 0, 1, 1,
0.4077367, 1.130659, -0.1628342, 0.007843138, 0, 1, 1,
0.4146177, -0.7070317, 4.036004, 0.01568628, 0, 1, 1,
0.4178803, -1.839602, 3.399219, 0.01960784, 0, 1, 1,
0.4240828, 0.245314, -0.8680269, 0.02745098, 0, 1, 1,
0.4258242, 1.420934, -0.5342973, 0.03137255, 0, 1, 1,
0.4278397, -0.8145397, 2.96185, 0.03921569, 0, 1, 1,
0.4302627, 0.1599902, 1.129267, 0.04313726, 0, 1, 1,
0.4310578, 0.3406302, 0.7015669, 0.05098039, 0, 1, 1,
0.434481, 0.577837, -0.8872711, 0.05490196, 0, 1, 1,
0.4349656, 0.6910277, 3.082073, 0.0627451, 0, 1, 1,
0.4364021, 1.798937, 0.4866189, 0.06666667, 0, 1, 1,
0.4387362, -0.8815395, 1.800916, 0.07450981, 0, 1, 1,
0.4390631, 1.101217, 0.04984612, 0.07843138, 0, 1, 1,
0.4395251, 0.8101718, -0.2429922, 0.08627451, 0, 1, 1,
0.4421555, -2.01448, 2.219182, 0.09019608, 0, 1, 1,
0.4469075, -0.6181992, 1.904857, 0.09803922, 0, 1, 1,
0.4486646, -1.26181, 3.472667, 0.1058824, 0, 1, 1,
0.4525934, 0.5086036, -1.062417, 0.1098039, 0, 1, 1,
0.4539227, -1.557642, 2.244151, 0.1176471, 0, 1, 1,
0.4566842, -0.6999688, 3.12201, 0.1215686, 0, 1, 1,
0.4576119, 0.6216421, -0.5586701, 0.1294118, 0, 1, 1,
0.4633608, 1.253286, 0.8276139, 0.1333333, 0, 1, 1,
0.4677214, 1.012408, 1.423719, 0.1411765, 0, 1, 1,
0.4681767, -0.324418, 2.415327, 0.145098, 0, 1, 1,
0.4691157, 1.296621, 0.6657891, 0.1529412, 0, 1, 1,
0.4698245, -0.144131, 0.2727051, 0.1568628, 0, 1, 1,
0.4721834, 0.3186674, 1.110741, 0.1647059, 0, 1, 1,
0.4731644, 0.3848581, 0.06670281, 0.1686275, 0, 1, 1,
0.4768593, 0.07162456, -1.031599, 0.1764706, 0, 1, 1,
0.4776051, -0.6618303, 1.994243, 0.1803922, 0, 1, 1,
0.4815784, -0.4114282, 2.856872, 0.1882353, 0, 1, 1,
0.4819978, 1.891715, 2.122432, 0.1921569, 0, 1, 1,
0.4842975, -1.983707, 2.125622, 0.2, 0, 1, 1,
0.4853926, -1.637532, 3.424625, 0.2078431, 0, 1, 1,
0.4859562, 0.7150204, -0.1355945, 0.2117647, 0, 1, 1,
0.4882259, -1.954456, 3.400204, 0.2196078, 0, 1, 1,
0.4896278, -0.1163563, 2.656231, 0.2235294, 0, 1, 1,
0.4921558, -0.03403595, 0.6048753, 0.2313726, 0, 1, 1,
0.5042605, 1.892849, 0.02510793, 0.2352941, 0, 1, 1,
0.5086979, 0.3871682, 1.200245, 0.2431373, 0, 1, 1,
0.5092366, 0.6758416, 0.7114975, 0.2470588, 0, 1, 1,
0.5130014, 0.209326, 1.314132, 0.254902, 0, 1, 1,
0.5137433, 0.03979474, 0.2989888, 0.2588235, 0, 1, 1,
0.5182405, -1.030524, 1.977472, 0.2666667, 0, 1, 1,
0.5188372, 0.1124631, 1.043767, 0.2705882, 0, 1, 1,
0.5196868, -0.01103519, 1.757674, 0.2784314, 0, 1, 1,
0.5287908, 1.022446, 2.203204, 0.282353, 0, 1, 1,
0.5298516, -2.039707, 2.374472, 0.2901961, 0, 1, 1,
0.5335127, -0.3545631, 3.429397, 0.2941177, 0, 1, 1,
0.5341299, -0.7190526, 3.573859, 0.3019608, 0, 1, 1,
0.5360612, -0.5434282, 1.217217, 0.3098039, 0, 1, 1,
0.5382326, 0.6610776, 1.284872, 0.3137255, 0, 1, 1,
0.5416883, -0.7380728, 3.028888, 0.3215686, 0, 1, 1,
0.5429218, -1.506863, 0.6693149, 0.3254902, 0, 1, 1,
0.5485158, 0.7929839, 1.433926, 0.3333333, 0, 1, 1,
0.5485176, -1.790573, 3.522614, 0.3372549, 0, 1, 1,
0.5520716, 0.6496414, 0.5330016, 0.345098, 0, 1, 1,
0.5579457, -0.256231, 0.7702203, 0.3490196, 0, 1, 1,
0.5587861, 0.9957972, -0.1672938, 0.3568628, 0, 1, 1,
0.5617466, -0.06564122, 2.828752, 0.3607843, 0, 1, 1,
0.5674099, 0.3019052, 1.403365, 0.3686275, 0, 1, 1,
0.575264, 1.552173, 1.09654, 0.372549, 0, 1, 1,
0.5770066, -0.5962012, 3.740541, 0.3803922, 0, 1, 1,
0.5771053, -0.05420062, 1.31994, 0.3843137, 0, 1, 1,
0.5776736, 0.1801592, 1.478198, 0.3921569, 0, 1, 1,
0.5788068, 1.68497, 1.523169, 0.3960784, 0, 1, 1,
0.5845358, 0.1956606, 1.133746, 0.4039216, 0, 1, 1,
0.5876992, 0.360129, 0.8486366, 0.4117647, 0, 1, 1,
0.5885592, -0.3971646, 2.919616, 0.4156863, 0, 1, 1,
0.5938271, 0.00701653, 1.194417, 0.4235294, 0, 1, 1,
0.5992268, -0.8755644, 4.884287, 0.427451, 0, 1, 1,
0.601885, 1.138549, 0.6223647, 0.4352941, 0, 1, 1,
0.6057904, 0.7048592, 0.1031369, 0.4392157, 0, 1, 1,
0.6071265, -0.8086439, 3.545222, 0.4470588, 0, 1, 1,
0.6080176, 0.7298762, 0.00168333, 0.4509804, 0, 1, 1,
0.6105306, 0.1422575, 1.153427, 0.4588235, 0, 1, 1,
0.6126139, -0.6422381, 2.471255, 0.4627451, 0, 1, 1,
0.6142909, 0.9042181, 1.760194, 0.4705882, 0, 1, 1,
0.6156773, -0.03927136, 2.029691, 0.4745098, 0, 1, 1,
0.617237, 1.002936, 0.3387855, 0.4823529, 0, 1, 1,
0.6255761, -0.03711482, 2.961216, 0.4862745, 0, 1, 1,
0.6259883, 1.230792, -0.2578813, 0.4941176, 0, 1, 1,
0.6287629, -0.5366203, 2.983073, 0.5019608, 0, 1, 1,
0.6287791, 0.1042364, 1.812596, 0.5058824, 0, 1, 1,
0.631652, 0.130846, 0.22329, 0.5137255, 0, 1, 1,
0.6323599, 0.05941531, 0.08792581, 0.5176471, 0, 1, 1,
0.6585974, 0.008819596, 2.403343, 0.5254902, 0, 1, 1,
0.6611004, 1.128843, 0.2134052, 0.5294118, 0, 1, 1,
0.6611968, -0.4579639, 1.73762, 0.5372549, 0, 1, 1,
0.6627853, -0.2371377, 2.388954, 0.5411765, 0, 1, 1,
0.6678038, 0.197684, 2.538455, 0.5490196, 0, 1, 1,
0.6680224, -0.5347617, 3.693445, 0.5529412, 0, 1, 1,
0.6718783, 1.076545, 1.426119, 0.5607843, 0, 1, 1,
0.672977, -1.095459, 2.203614, 0.5647059, 0, 1, 1,
0.6730509, 0.3021549, -1.162433, 0.572549, 0, 1, 1,
0.674084, 0.4765094, 1.29561, 0.5764706, 0, 1, 1,
0.6832649, 1.340577, 1.221775, 0.5843138, 0, 1, 1,
0.69451, -1.591886, 3.096327, 0.5882353, 0, 1, 1,
0.7007595, -1.130557, 2.166366, 0.5960785, 0, 1, 1,
0.7025351, -1.309229, 2.53043, 0.6039216, 0, 1, 1,
0.70827, 2.681051, -0.5282192, 0.6078432, 0, 1, 1,
0.7093605, 0.575601, 2.157593, 0.6156863, 0, 1, 1,
0.709636, -1.866776, 0.5304891, 0.6196079, 0, 1, 1,
0.7129553, 2.511753, -0.03505358, 0.627451, 0, 1, 1,
0.7170807, -2.409559, 2.589579, 0.6313726, 0, 1, 1,
0.7174224, 0.7120485, 0.619379, 0.6392157, 0, 1, 1,
0.7202699, -0.6362315, 0.3897443, 0.6431373, 0, 1, 1,
0.7240443, -0.6850043, 3.827717, 0.6509804, 0, 1, 1,
0.7240641, -0.515323, 2.651295, 0.654902, 0, 1, 1,
0.7279267, -0.1715519, 3.047244, 0.6627451, 0, 1, 1,
0.7404076, 0.2265729, 1.467519, 0.6666667, 0, 1, 1,
0.7455376, 0.105786, 0.01258375, 0.6745098, 0, 1, 1,
0.7500629, 0.4942218, 0.09875232, 0.6784314, 0, 1, 1,
0.7524205, -0.7971873, 2.883235, 0.6862745, 0, 1, 1,
0.7525054, -1.834162, 2.786509, 0.6901961, 0, 1, 1,
0.7537209, 1.66976, -0.3517036, 0.6980392, 0, 1, 1,
0.7566802, 1.538957, 1.234564, 0.7058824, 0, 1, 1,
0.7634701, 0.5094703, 0.9920659, 0.7098039, 0, 1, 1,
0.764897, -0.5233648, -0.433647, 0.7176471, 0, 1, 1,
0.7674123, -0.5169759, 1.716404, 0.7215686, 0, 1, 1,
0.7718642, -0.7631266, 0.5642436, 0.7294118, 0, 1, 1,
0.7838038, -0.8115689, 2.362948, 0.7333333, 0, 1, 1,
0.7853599, 1.701402, 0.5150859, 0.7411765, 0, 1, 1,
0.7946848, 0.7772211, 1.438987, 0.7450981, 0, 1, 1,
0.7947389, 1.029946, -0.2798401, 0.7529412, 0, 1, 1,
0.7953302, 0.6990229, 0.126284, 0.7568628, 0, 1, 1,
0.797218, 0.3822505, -1.294427, 0.7647059, 0, 1, 1,
0.7994059, 0.1053408, 0.09096331, 0.7686275, 0, 1, 1,
0.8002986, -0.3811186, 2.483155, 0.7764706, 0, 1, 1,
0.8005308, 0.7065043, -0.26485, 0.7803922, 0, 1, 1,
0.8006824, 0.07287795, 1.059461, 0.7882353, 0, 1, 1,
0.8089759, -1.254595, 2.646716, 0.7921569, 0, 1, 1,
0.810141, -1.171954, 2.639706, 0.8, 0, 1, 1,
0.8138288, 0.85074, 0.251658, 0.8078431, 0, 1, 1,
0.8146175, -0.8051375, 1.946514, 0.8117647, 0, 1, 1,
0.8161764, -0.7170141, 3.692834, 0.8196079, 0, 1, 1,
0.8190525, 1.280043, -0.5380107, 0.8235294, 0, 1, 1,
0.8208432, 0.9080288, -0.4388759, 0.8313726, 0, 1, 1,
0.8209272, 1.285361, 1.275096, 0.8352941, 0, 1, 1,
0.8219565, 0.7490848, 0.488124, 0.8431373, 0, 1, 1,
0.8259951, -1.729133, 1.944407, 0.8470588, 0, 1, 1,
0.8319944, 0.02913189, 0.8387718, 0.854902, 0, 1, 1,
0.8367355, 0.2710981, 0.1638315, 0.8588235, 0, 1, 1,
0.8379891, 0.0768486, 1.754512, 0.8666667, 0, 1, 1,
0.8382821, -0.1026254, 1.247055, 0.8705882, 0, 1, 1,
0.8448923, 1.229309, 0.9192714, 0.8784314, 0, 1, 1,
0.8523482, -0.4909294, 4.5983, 0.8823529, 0, 1, 1,
0.8566983, -0.1596561, 1.63931, 0.8901961, 0, 1, 1,
0.8633569, -0.5100484, 1.21256, 0.8941177, 0, 1, 1,
0.8645516, 1.099559, -0.6275184, 0.9019608, 0, 1, 1,
0.8668621, -0.5476617, 2.472159, 0.9098039, 0, 1, 1,
0.867336, -0.3329774, 2.136351, 0.9137255, 0, 1, 1,
0.8678294, 0.8382256, -0.9725179, 0.9215686, 0, 1, 1,
0.8752468, 1.354467, 0.5717586, 0.9254902, 0, 1, 1,
0.8762404, 0.8071998, 0.1370349, 0.9333333, 0, 1, 1,
0.8789716, -0.6164226, 2.651026, 0.9372549, 0, 1, 1,
0.892527, 1.424932, 0.1841918, 0.945098, 0, 1, 1,
0.8960919, 0.7646909, 1.24765, 0.9490196, 0, 1, 1,
0.8983876, -0.4138145, 0.2536272, 0.9568627, 0, 1, 1,
0.9078576, -0.3695473, 2.987001, 0.9607843, 0, 1, 1,
0.9162524, 0.5986713, -0.2709062, 0.9686275, 0, 1, 1,
0.9197981, -0.09411415, 0.2674702, 0.972549, 0, 1, 1,
0.930554, 0.793548, 0.5993527, 0.9803922, 0, 1, 1,
0.9314229, -0.6329826, 1.239587, 0.9843137, 0, 1, 1,
0.936966, 1.773353, 2.334769, 0.9921569, 0, 1, 1,
0.9538809, 1.539135, 0.5146899, 0.9960784, 0, 1, 1,
0.9563627, -1.745023, 1.832446, 1, 0, 0.9960784, 1,
0.9585342, -0.9070528, 2.012497, 1, 0, 0.9882353, 1,
0.9696795, -0.2716873, 1.556628, 1, 0, 0.9843137, 1,
0.9799359, 0.2853709, 0.4053427, 1, 0, 0.9764706, 1,
0.9814402, 0.3957884, 1.568497, 1, 0, 0.972549, 1,
0.9863674, 0.2891807, 1.26585, 1, 0, 0.9647059, 1,
0.9875135, 0.424615, -0.5433316, 1, 0, 0.9607843, 1,
0.9961226, -0.3902595, 2.224789, 1, 0, 0.9529412, 1,
1.019835, 0.1250865, 0.3790748, 1, 0, 0.9490196, 1,
1.03921, 1.568635, 0.5418742, 1, 0, 0.9411765, 1,
1.041762, 1.972561, 0.6587316, 1, 0, 0.9372549, 1,
1.045096, -1.709408, 2.154594, 1, 0, 0.9294118, 1,
1.052413, 1.554523, -1.373118, 1, 0, 0.9254902, 1,
1.054609, -0.2477584, 2.983355, 1, 0, 0.9176471, 1,
1.057258, 1.252766, -2.05961, 1, 0, 0.9137255, 1,
1.068726, 0.1405191, 0.9570458, 1, 0, 0.9058824, 1,
1.080657, -0.4565399, 2.096479, 1, 0, 0.9019608, 1,
1.084709, -0.1990177, 2.252759, 1, 0, 0.8941177, 1,
1.085902, 0.4929377, 1.670641, 1, 0, 0.8862745, 1,
1.096153, 0.6366814, 0.3616803, 1, 0, 0.8823529, 1,
1.100683, -4.042758, 2.349626, 1, 0, 0.8745098, 1,
1.104758, 0.3129034, 0.09012692, 1, 0, 0.8705882, 1,
1.109149, 0.7139216, 1.501472, 1, 0, 0.8627451, 1,
1.111662, 0.4527817, -0.8638772, 1, 0, 0.8588235, 1,
1.111668, 0.3956606, 1.346046, 1, 0, 0.8509804, 1,
1.119351, 0.5922828, 2.090931, 1, 0, 0.8470588, 1,
1.123483, 0.4191619, 1.973495, 1, 0, 0.8392157, 1,
1.127091, 1.121474, -0.4776767, 1, 0, 0.8352941, 1,
1.140634, -0.3312644, 2.206137, 1, 0, 0.827451, 1,
1.151458, 0.4229553, 1.349911, 1, 0, 0.8235294, 1,
1.153925, 1.039939, -0.2305713, 1, 0, 0.8156863, 1,
1.1568, -1.253543, 2.94601, 1, 0, 0.8117647, 1,
1.159294, 1.317193, 1.082773, 1, 0, 0.8039216, 1,
1.163676, -0.4558619, 2.084778, 1, 0, 0.7960784, 1,
1.171752, -1.112649, 2.429581, 1, 0, 0.7921569, 1,
1.174609, -0.2943573, 1.841662, 1, 0, 0.7843137, 1,
1.177501, 0.2965623, 1.355401, 1, 0, 0.7803922, 1,
1.186066, -0.839325, 2.913102, 1, 0, 0.772549, 1,
1.193758, -0.7918763, 3.857973, 1, 0, 0.7686275, 1,
1.194208, -0.7986577, 1.786829, 1, 0, 0.7607843, 1,
1.214798, -0.9774656, 2.551867, 1, 0, 0.7568628, 1,
1.22609, 0.2115941, 2.47081, 1, 0, 0.7490196, 1,
1.241062, 1.106691, -0.08046781, 1, 0, 0.7450981, 1,
1.243406, 1.250331, 0.823325, 1, 0, 0.7372549, 1,
1.248133, 1.658579, -0.1320627, 1, 0, 0.7333333, 1,
1.258568, -1.336845, 2.510664, 1, 0, 0.7254902, 1,
1.261251, 0.9409072, 0.6434969, 1, 0, 0.7215686, 1,
1.267024, -0.783744, 1.632069, 1, 0, 0.7137255, 1,
1.272166, -1.012421, 3.167579, 1, 0, 0.7098039, 1,
1.276277, 0.6189652, 1.781493, 1, 0, 0.7019608, 1,
1.279669, 0.2386522, 2.023582, 1, 0, 0.6941177, 1,
1.283585, 0.7253006, -0.284635, 1, 0, 0.6901961, 1,
1.285411, -0.7614803, 2.370364, 1, 0, 0.682353, 1,
1.293991, -0.2955333, 3.072619, 1, 0, 0.6784314, 1,
1.297546, 0.1605385, 0.1439062, 1, 0, 0.6705883, 1,
1.302147, 0.136935, 2.317513, 1, 0, 0.6666667, 1,
1.305486, -0.5403878, 1.10844, 1, 0, 0.6588235, 1,
1.308156, 1.227067, 0.4257679, 1, 0, 0.654902, 1,
1.312778, -0.4544725, -0.01256057, 1, 0, 0.6470588, 1,
1.31444, -1.175887, 4.166281, 1, 0, 0.6431373, 1,
1.315236, -0.0564524, 0.3506788, 1, 0, 0.6352941, 1,
1.317752, -0.6755193, 1.653935, 1, 0, 0.6313726, 1,
1.322157, -0.4338088, 1.614296, 1, 0, 0.6235294, 1,
1.322529, 1.850937, 1.151734, 1, 0, 0.6196079, 1,
1.325706, -0.03564474, 0.4113991, 1, 0, 0.6117647, 1,
1.328052, -0.7053887, 2.401351, 1, 0, 0.6078432, 1,
1.329056, -0.2871653, 0.7828597, 1, 0, 0.6, 1,
1.336593, -0.3642074, 3.304596, 1, 0, 0.5921569, 1,
1.342759, -1.633041, 1.924548, 1, 0, 0.5882353, 1,
1.343259, -0.4271923, 0.9894894, 1, 0, 0.5803922, 1,
1.34516, 0.9649711, 2.282118, 1, 0, 0.5764706, 1,
1.346589, -0.4046792, 1.453916, 1, 0, 0.5686275, 1,
1.348231, -0.4344858, 1.928532, 1, 0, 0.5647059, 1,
1.349831, -0.05510367, 3.494783, 1, 0, 0.5568628, 1,
1.357763, -0.5234219, 0.4598512, 1, 0, 0.5529412, 1,
1.360431, -0.06259252, 2.318253, 1, 0, 0.5450981, 1,
1.372945, -0.1826703, 1.337956, 1, 0, 0.5411765, 1,
1.376215, 0.8396763, 0.5471662, 1, 0, 0.5333334, 1,
1.392388, 0.3133634, 2.192883, 1, 0, 0.5294118, 1,
1.394729, -0.05924346, 2.291248, 1, 0, 0.5215687, 1,
1.400159, 0.09579863, 2.448251, 1, 0, 0.5176471, 1,
1.40024, 1.015405, 0.04298972, 1, 0, 0.509804, 1,
1.407533, 1.145086, 1.301132, 1, 0, 0.5058824, 1,
1.409159, -0.318171, -0.395024, 1, 0, 0.4980392, 1,
1.410203, -1.085027, 2.174104, 1, 0, 0.4901961, 1,
1.427299, -1.270223, 2.682125, 1, 0, 0.4862745, 1,
1.436956, 0.6492377, -0.1022057, 1, 0, 0.4784314, 1,
1.451279, 0.2571132, 2.219053, 1, 0, 0.4745098, 1,
1.452975, 1.047069, 1.408649, 1, 0, 0.4666667, 1,
1.458515, -0.7777984, 2.992426, 1, 0, 0.4627451, 1,
1.464145, 1.985749, 0.7209384, 1, 0, 0.454902, 1,
1.46836, 0.7630677, 3.198115, 1, 0, 0.4509804, 1,
1.473803, -1.096292, 1.244914, 1, 0, 0.4431373, 1,
1.475475, 0.1117484, 0.5011218, 1, 0, 0.4392157, 1,
1.483992, -0.1309665, 2.418026, 1, 0, 0.4313726, 1,
1.485118, 1.492559, 1.360129, 1, 0, 0.427451, 1,
1.485968, 0.3880751, 0.2195102, 1, 0, 0.4196078, 1,
1.490825, -0.5541387, 1.596355, 1, 0, 0.4156863, 1,
1.493996, -0.2047493, 3.388229, 1, 0, 0.4078431, 1,
1.514515, -1.447706, 0.6896823, 1, 0, 0.4039216, 1,
1.514608, 0.03841282, 2.709457, 1, 0, 0.3960784, 1,
1.528154, -1.362485, 2.276446, 1, 0, 0.3882353, 1,
1.529013, 0.8682126, -0.2829585, 1, 0, 0.3843137, 1,
1.533494, -0.715174, 3.163539, 1, 0, 0.3764706, 1,
1.543778, -0.2876159, 2.408014, 1, 0, 0.372549, 1,
1.55029, -0.3301193, 3.910173, 1, 0, 0.3647059, 1,
1.559067, 0.4332546, 0.088944, 1, 0, 0.3607843, 1,
1.572167, 1.593171, 1.212318, 1, 0, 0.3529412, 1,
1.575284, -0.4511537, 3.265164, 1, 0, 0.3490196, 1,
1.592027, -1.112475, 2.598352, 1, 0, 0.3411765, 1,
1.618821, -0.1482973, 2.561351, 1, 0, 0.3372549, 1,
1.645363, -2.687965, 2.504622, 1, 0, 0.3294118, 1,
1.649683, -1.469834, 1.798268, 1, 0, 0.3254902, 1,
1.66308, -1.225183, 2.693637, 1, 0, 0.3176471, 1,
1.669383, -0.4738078, 1.892432, 1, 0, 0.3137255, 1,
1.673149, 1.534651, -1.078844, 1, 0, 0.3058824, 1,
1.675964, -0.9220448, 2.837957, 1, 0, 0.2980392, 1,
1.687454, 2.345355, -0.2044307, 1, 0, 0.2941177, 1,
1.697771, 1.277923, 0.09505212, 1, 0, 0.2862745, 1,
1.69789, -0.958716, 3.85136, 1, 0, 0.282353, 1,
1.698645, 0.2269119, 1.676203, 1, 0, 0.2745098, 1,
1.70721, 0.6146148, 1.133809, 1, 0, 0.2705882, 1,
1.70866, 0.01196194, 2.271093, 1, 0, 0.2627451, 1,
1.735446, -1.509812, 2.989354, 1, 0, 0.2588235, 1,
1.746947, 1.285518, 1.735325, 1, 0, 0.2509804, 1,
1.753378, -0.6661282, 1.322474, 1, 0, 0.2470588, 1,
1.756209, -0.4944202, 3.47216, 1, 0, 0.2392157, 1,
1.762675, 0.4824803, 1.711691, 1, 0, 0.2352941, 1,
1.774304, 0.49119, 1.160723, 1, 0, 0.227451, 1,
1.798978, -0.5866766, 2.324663, 1, 0, 0.2235294, 1,
1.799579, 1.174104, 1.345534, 1, 0, 0.2156863, 1,
1.853188, -0.2756085, 0.7341973, 1, 0, 0.2117647, 1,
1.856297, 0.2313015, 2.494802, 1, 0, 0.2039216, 1,
1.898381, 1.266277, 0.7087228, 1, 0, 0.1960784, 1,
1.905359, 0.0001103048, 1.6348, 1, 0, 0.1921569, 1,
1.914371, -0.4230427, 1.840536, 1, 0, 0.1843137, 1,
1.927089, 1.169861, 0.6479251, 1, 0, 0.1803922, 1,
1.929722, 0.3941805, -0.4050775, 1, 0, 0.172549, 1,
1.937706, 0.5631042, 1.006829, 1, 0, 0.1686275, 1,
1.947584, -0.2770019, 1.868829, 1, 0, 0.1607843, 1,
1.961143, 1.0764, 2.949239, 1, 0, 0.1568628, 1,
1.968078, -0.5485604, 2.582204, 1, 0, 0.1490196, 1,
2.012646, 0.659916, 0.903326, 1, 0, 0.145098, 1,
2.046238, 0.2053143, 0.842037, 1, 0, 0.1372549, 1,
2.067081, -0.0254539, 2.182948, 1, 0, 0.1333333, 1,
2.075841, 2.256962, 0.8976825, 1, 0, 0.1254902, 1,
2.091961, 0.2400104, 1.547243, 1, 0, 0.1215686, 1,
2.099029, 1.585468, 0.9905442, 1, 0, 0.1137255, 1,
2.132175, 0.8529744, -0.03968246, 1, 0, 0.1098039, 1,
2.221049, 0.5730682, 0.9941031, 1, 0, 0.1019608, 1,
2.264354, 0.158853, 2.322696, 1, 0, 0.09411765, 1,
2.270431, -0.2363534, 1.500175, 1, 0, 0.09019608, 1,
2.30959, 1.207256, 0.1707792, 1, 0, 0.08235294, 1,
2.357526, 1.001284, 0.3537254, 1, 0, 0.07843138, 1,
2.390103, -1.928462, 4.471861, 1, 0, 0.07058824, 1,
2.430588, -0.2728711, 1.026652, 1, 0, 0.06666667, 1,
2.484886, 0.408104, 0.9111661, 1, 0, 0.05882353, 1,
2.504598, 0.6050147, 3.35917, 1, 0, 0.05490196, 1,
2.513789, -0.7426468, 2.289271, 1, 0, 0.04705882, 1,
2.536239, 2.177105, 1.444616, 1, 0, 0.04313726, 1,
2.602803, -0.03875472, 0.5101422, 1, 0, 0.03529412, 1,
2.659909, 2.079568, 0.4291058, 1, 0, 0.03137255, 1,
2.693069, 0.403976, 0.9862589, 1, 0, 0.02352941, 1,
2.717308, -0.7078297, 0.6670132, 1, 0, 0.01960784, 1,
2.717999, -1.710722, 1.648221, 1, 0, 0.01176471, 1,
3.244863, 0.3366733, 1.790788, 1, 0, 0.007843138, 1
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
-0.1333013, -5.182444, -8.026162, 0, -0.5, 0.5, 0.5,
-0.1333013, -5.182444, -8.026162, 1, -0.5, 0.5, 0.5,
-0.1333013, -5.182444, -8.026162, 1, 1.5, 0.5, 0.5,
-0.1333013, -5.182444, -8.026162, 0, 1.5, 0.5, 0.5
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
-4.656663, -0.6808535, -8.026162, 0, -0.5, 0.5, 0.5,
-4.656663, -0.6808535, -8.026162, 1, -0.5, 0.5, 0.5,
-4.656663, -0.6808535, -8.026162, 1, 1.5, 0.5, 0.5,
-4.656663, -0.6808535, -8.026162, 0, 1.5, 0.5, 0.5
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
-4.656663, -5.182444, -0.6030755, 0, -0.5, 0.5, 0.5,
-4.656663, -5.182444, -0.6030755, 1, -0.5, 0.5, 0.5,
-4.656663, -5.182444, -0.6030755, 1, 1.5, 0.5, 0.5,
-4.656663, -5.182444, -0.6030755, 0, 1.5, 0.5, 0.5
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
-3, -4.143615, -6.313142,
3, -4.143615, -6.313142,
-3, -4.143615, -6.313142,
-3, -4.316753, -6.598646,
-2, -4.143615, -6.313142,
-2, -4.316753, -6.598646,
-1, -4.143615, -6.313142,
-1, -4.316753, -6.598646,
0, -4.143615, -6.313142,
0, -4.316753, -6.598646,
1, -4.143615, -6.313142,
1, -4.316753, -6.598646,
2, -4.143615, -6.313142,
2, -4.316753, -6.598646,
3, -4.143615, -6.313142,
3, -4.316753, -6.598646
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
-3, -4.663029, -7.169652, 0, -0.5, 0.5, 0.5,
-3, -4.663029, -7.169652, 1, -0.5, 0.5, 0.5,
-3, -4.663029, -7.169652, 1, 1.5, 0.5, 0.5,
-3, -4.663029, -7.169652, 0, 1.5, 0.5, 0.5,
-2, -4.663029, -7.169652, 0, -0.5, 0.5, 0.5,
-2, -4.663029, -7.169652, 1, -0.5, 0.5, 0.5,
-2, -4.663029, -7.169652, 1, 1.5, 0.5, 0.5,
-2, -4.663029, -7.169652, 0, 1.5, 0.5, 0.5,
-1, -4.663029, -7.169652, 0, -0.5, 0.5, 0.5,
-1, -4.663029, -7.169652, 1, -0.5, 0.5, 0.5,
-1, -4.663029, -7.169652, 1, 1.5, 0.5, 0.5,
-1, -4.663029, -7.169652, 0, 1.5, 0.5, 0.5,
0, -4.663029, -7.169652, 0, -0.5, 0.5, 0.5,
0, -4.663029, -7.169652, 1, -0.5, 0.5, 0.5,
0, -4.663029, -7.169652, 1, 1.5, 0.5, 0.5,
0, -4.663029, -7.169652, 0, 1.5, 0.5, 0.5,
1, -4.663029, -7.169652, 0, -0.5, 0.5, 0.5,
1, -4.663029, -7.169652, 1, -0.5, 0.5, 0.5,
1, -4.663029, -7.169652, 1, 1.5, 0.5, 0.5,
1, -4.663029, -7.169652, 0, 1.5, 0.5, 0.5,
2, -4.663029, -7.169652, 0, -0.5, 0.5, 0.5,
2, -4.663029, -7.169652, 1, -0.5, 0.5, 0.5,
2, -4.663029, -7.169652, 1, 1.5, 0.5, 0.5,
2, -4.663029, -7.169652, 0, 1.5, 0.5, 0.5,
3, -4.663029, -7.169652, 0, -0.5, 0.5, 0.5,
3, -4.663029, -7.169652, 1, -0.5, 0.5, 0.5,
3, -4.663029, -7.169652, 1, 1.5, 0.5, 0.5,
3, -4.663029, -7.169652, 0, 1.5, 0.5, 0.5
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
-3.612811, -4, -6.313142,
-3.612811, 2, -6.313142,
-3.612811, -4, -6.313142,
-3.786786, -4, -6.598646,
-3.612811, -3, -6.313142,
-3.786786, -3, -6.598646,
-3.612811, -2, -6.313142,
-3.786786, -2, -6.598646,
-3.612811, -1, -6.313142,
-3.786786, -1, -6.598646,
-3.612811, 0, -6.313142,
-3.786786, 0, -6.598646,
-3.612811, 1, -6.313142,
-3.786786, 1, -6.598646,
-3.612811, 2, -6.313142,
-3.786786, 2, -6.598646
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
"-4",
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
-4.134737, -4, -7.169652, 0, -0.5, 0.5, 0.5,
-4.134737, -4, -7.169652, 1, -0.5, 0.5, 0.5,
-4.134737, -4, -7.169652, 1, 1.5, 0.5, 0.5,
-4.134737, -4, -7.169652, 0, 1.5, 0.5, 0.5,
-4.134737, -3, -7.169652, 0, -0.5, 0.5, 0.5,
-4.134737, -3, -7.169652, 1, -0.5, 0.5, 0.5,
-4.134737, -3, -7.169652, 1, 1.5, 0.5, 0.5,
-4.134737, -3, -7.169652, 0, 1.5, 0.5, 0.5,
-4.134737, -2, -7.169652, 0, -0.5, 0.5, 0.5,
-4.134737, -2, -7.169652, 1, -0.5, 0.5, 0.5,
-4.134737, -2, -7.169652, 1, 1.5, 0.5, 0.5,
-4.134737, -2, -7.169652, 0, 1.5, 0.5, 0.5,
-4.134737, -1, -7.169652, 0, -0.5, 0.5, 0.5,
-4.134737, -1, -7.169652, 1, -0.5, 0.5, 0.5,
-4.134737, -1, -7.169652, 1, 1.5, 0.5, 0.5,
-4.134737, -1, -7.169652, 0, 1.5, 0.5, 0.5,
-4.134737, 0, -7.169652, 0, -0.5, 0.5, 0.5,
-4.134737, 0, -7.169652, 1, -0.5, 0.5, 0.5,
-4.134737, 0, -7.169652, 1, 1.5, 0.5, 0.5,
-4.134737, 0, -7.169652, 0, 1.5, 0.5, 0.5,
-4.134737, 1, -7.169652, 0, -0.5, 0.5, 0.5,
-4.134737, 1, -7.169652, 1, -0.5, 0.5, 0.5,
-4.134737, 1, -7.169652, 1, 1.5, 0.5, 0.5,
-4.134737, 1, -7.169652, 0, 1.5, 0.5, 0.5,
-4.134737, 2, -7.169652, 0, -0.5, 0.5, 0.5,
-4.134737, 2, -7.169652, 1, -0.5, 0.5, 0.5,
-4.134737, 2, -7.169652, 1, 1.5, 0.5, 0.5,
-4.134737, 2, -7.169652, 0, 1.5, 0.5, 0.5
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
-3.612811, -4.143615, -6,
-3.612811, -4.143615, 4,
-3.612811, -4.143615, -6,
-3.786786, -4.316753, -6,
-3.612811, -4.143615, -4,
-3.786786, -4.316753, -4,
-3.612811, -4.143615, -2,
-3.786786, -4.316753, -2,
-3.612811, -4.143615, 0,
-3.786786, -4.316753, 0,
-3.612811, -4.143615, 2,
-3.786786, -4.316753, 2,
-3.612811, -4.143615, 4,
-3.786786, -4.316753, 4
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
-4.134737, -4.663029, -6, 0, -0.5, 0.5, 0.5,
-4.134737, -4.663029, -6, 1, -0.5, 0.5, 0.5,
-4.134737, -4.663029, -6, 1, 1.5, 0.5, 0.5,
-4.134737, -4.663029, -6, 0, 1.5, 0.5, 0.5,
-4.134737, -4.663029, -4, 0, -0.5, 0.5, 0.5,
-4.134737, -4.663029, -4, 1, -0.5, 0.5, 0.5,
-4.134737, -4.663029, -4, 1, 1.5, 0.5, 0.5,
-4.134737, -4.663029, -4, 0, 1.5, 0.5, 0.5,
-4.134737, -4.663029, -2, 0, -0.5, 0.5, 0.5,
-4.134737, -4.663029, -2, 1, -0.5, 0.5, 0.5,
-4.134737, -4.663029, -2, 1, 1.5, 0.5, 0.5,
-4.134737, -4.663029, -2, 0, 1.5, 0.5, 0.5,
-4.134737, -4.663029, 0, 0, -0.5, 0.5, 0.5,
-4.134737, -4.663029, 0, 1, -0.5, 0.5, 0.5,
-4.134737, -4.663029, 0, 1, 1.5, 0.5, 0.5,
-4.134737, -4.663029, 0, 0, 1.5, 0.5, 0.5,
-4.134737, -4.663029, 2, 0, -0.5, 0.5, 0.5,
-4.134737, -4.663029, 2, 1, -0.5, 0.5, 0.5,
-4.134737, -4.663029, 2, 1, 1.5, 0.5, 0.5,
-4.134737, -4.663029, 2, 0, 1.5, 0.5, 0.5,
-4.134737, -4.663029, 4, 0, -0.5, 0.5, 0.5,
-4.134737, -4.663029, 4, 1, -0.5, 0.5, 0.5,
-4.134737, -4.663029, 4, 1, 1.5, 0.5, 0.5,
-4.134737, -4.663029, 4, 0, 1.5, 0.5, 0.5
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
-3.612811, -4.143615, -6.313142,
-3.612811, 2.781908, -6.313142,
-3.612811, -4.143615, 5.106991,
-3.612811, 2.781908, 5.106991,
-3.612811, -4.143615, -6.313142,
-3.612811, -4.143615, 5.106991,
-3.612811, 2.781908, -6.313142,
-3.612811, 2.781908, 5.106991,
-3.612811, -4.143615, -6.313142,
3.346208, -4.143615, -6.313142,
-3.612811, -4.143615, 5.106991,
3.346208, -4.143615, 5.106991,
-3.612811, 2.781908, -6.313142,
3.346208, 2.781908, -6.313142,
-3.612811, 2.781908, 5.106991,
3.346208, 2.781908, 5.106991,
3.346208, -4.143615, -6.313142,
3.346208, 2.781908, -6.313142,
3.346208, -4.143615, 5.106991,
3.346208, 2.781908, 5.106991,
3.346208, -4.143615, -6.313142,
3.346208, -4.143615, 5.106991,
3.346208, 2.781908, -6.313142,
3.346208, 2.781908, 5.106991
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
var radius = 8.041866;
var distance = 35.77917;
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
mvMatrix.translate( 0.1333013, 0.6808535, 0.6030755 );
mvMatrix.scale( 1.249461, 1.255504, 0.7613766 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.77917);
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
diofenolan<-read.table("diofenolan.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-diofenolan$V2
```

```
## Error in eval(expr, envir, enclos): object 'diofenolan' not found
```

```r
y<-diofenolan$V3
```

```
## Error in eval(expr, envir, enclos): object 'diofenolan' not found
```

```r
z<-diofenolan$V4
```

```
## Error in eval(expr, envir, enclos): object 'diofenolan' not found
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
-3.511466, 0.01071179, -0.9281759, 0, 0, 1, 1, 1,
-3.031511, -0.02380253, -1.801146, 1, 0, 0, 1, 1,
-2.989417, -0.925885, 0.2252565, 1, 0, 0, 1, 1,
-2.872647, 2.234971, -0.1060619, 1, 0, 0, 1, 1,
-2.658185, 0.4093038, -2.245014, 1, 0, 0, 1, 1,
-2.601512, -0.373576, -2.532681, 1, 0, 0, 1, 1,
-2.496484, -0.3192886, -1.159562, 0, 0, 0, 1, 1,
-2.45197, 0.03439756, -0.2717815, 0, 0, 0, 1, 1,
-2.410957, -0.3477861, -2.070753, 0, 0, 0, 1, 1,
-2.397309, -1.253718, -2.337936, 0, 0, 0, 1, 1,
-2.305242, 0.7415142, -3.27837, 0, 0, 0, 1, 1,
-2.279894, -1.419698, -2.036236, 0, 0, 0, 1, 1,
-2.266811, 1.668982, -0.9846755, 0, 0, 0, 1, 1,
-2.200802, 0.1192251, -2.526294, 1, 1, 1, 1, 1,
-2.074345, -0.6696788, -1.247309, 1, 1, 1, 1, 1,
-2.051389, 0.2777167, -1.393308, 1, 1, 1, 1, 1,
-2.048607, 1.606708, -2.574852, 1, 1, 1, 1, 1,
-2.021199, -0.6753424, -1.763754, 1, 1, 1, 1, 1,
-2.004212, 1.197031, -2.306285, 1, 1, 1, 1, 1,
-1.995733, -0.6116731, -2.139489, 1, 1, 1, 1, 1,
-1.993448, -0.8481399, -1.787557, 1, 1, 1, 1, 1,
-1.988896, -0.2450711, -1.654721, 1, 1, 1, 1, 1,
-1.963569, 1.814259, -0.105764, 1, 1, 1, 1, 1,
-1.916603, -2.228946, -1.275949, 1, 1, 1, 1, 1,
-1.912282, 0.01179827, -2.739318, 1, 1, 1, 1, 1,
-1.878298, -0.1165144, -1.000651, 1, 1, 1, 1, 1,
-1.87617, 1.595685, -1.068873, 1, 1, 1, 1, 1,
-1.854382, -0.281851, -1.30824, 1, 1, 1, 1, 1,
-1.848967, 1.429637, -1.461207, 0, 0, 1, 1, 1,
-1.822453, -0.5445581, -1.027648, 1, 0, 0, 1, 1,
-1.805625, -0.2507913, -2.399953, 1, 0, 0, 1, 1,
-1.737283, 1.483096, -1.177916, 1, 0, 0, 1, 1,
-1.725251, -0.5129788, -1.346758, 1, 0, 0, 1, 1,
-1.719488, -1.832363, -1.650273, 1, 0, 0, 1, 1,
-1.690974, 1.027569, -1.266369, 0, 0, 0, 1, 1,
-1.681746, 0.0535094, -1.071047, 0, 0, 0, 1, 1,
-1.677938, 0.4048512, -3.837823, 0, 0, 0, 1, 1,
-1.677886, -0.304765, -0.8472993, 0, 0, 0, 1, 1,
-1.66865, 2.197264, -0.3082818, 0, 0, 0, 1, 1,
-1.660645, 0.830144, -0.2892069, 0, 0, 0, 1, 1,
-1.656116, -1.054332, -2.736897, 0, 0, 0, 1, 1,
-1.654012, 1.507409, 0.6946142, 1, 1, 1, 1, 1,
-1.643918, -0.887748, -1.229433, 1, 1, 1, 1, 1,
-1.639143, 1.708621, -1.891333, 1, 1, 1, 1, 1,
-1.634451, 0.4320534, -3.150568, 1, 1, 1, 1, 1,
-1.617103, 1.154053, -1.701924, 1, 1, 1, 1, 1,
-1.60759, 1.890173, -0.9526327, 1, 1, 1, 1, 1,
-1.58913, -0.632237, -2.694412, 1, 1, 1, 1, 1,
-1.585542, 1.816981, -0.1113199, 1, 1, 1, 1, 1,
-1.569289, 0.9878724, -1.039846, 1, 1, 1, 1, 1,
-1.548762, -0.02665829, -0.4110633, 1, 1, 1, 1, 1,
-1.525027, 0.2120463, -1.489993, 1, 1, 1, 1, 1,
-1.51234, 1.542036, -1.963147, 1, 1, 1, 1, 1,
-1.506655, 2.3562, -1.815998, 1, 1, 1, 1, 1,
-1.504699, 0.8023502, -0.383269, 1, 1, 1, 1, 1,
-1.494665, 1.303121, 0.1764252, 1, 1, 1, 1, 1,
-1.486234, -1.205574, -1.018647, 0, 0, 1, 1, 1,
-1.485043, 0.904832, -1.547721, 1, 0, 0, 1, 1,
-1.4821, 2.180301, -1.700903, 1, 0, 0, 1, 1,
-1.47252, -0.1139602, -1.573983, 1, 0, 0, 1, 1,
-1.471095, -2.046197, -2.210928, 1, 0, 0, 1, 1,
-1.466664, -0.1807484, -1.048344, 1, 0, 0, 1, 1,
-1.447621, -0.4796693, -2.819684, 0, 0, 0, 1, 1,
-1.439008, -0.5288252, -1.808959, 0, 0, 0, 1, 1,
-1.417163, 0.6667188, -1.349886, 0, 0, 0, 1, 1,
-1.406047, -0.1455617, -0.599016, 0, 0, 0, 1, 1,
-1.405975, 0.8094667, -1.871613, 0, 0, 0, 1, 1,
-1.383934, 0.178054, -1.272927, 0, 0, 0, 1, 1,
-1.379349, -2.095246, -2.775656, 0, 0, 0, 1, 1,
-1.376462, 0.09354387, -1.218024, 1, 1, 1, 1, 1,
-1.369097, -1.06551, -4.087741, 1, 1, 1, 1, 1,
-1.353055, -0.8150789, -3.347142, 1, 1, 1, 1, 1,
-1.348597, 0.6171682, -0.5981948, 1, 1, 1, 1, 1,
-1.335923, -0.3744145, -2.475693, 1, 1, 1, 1, 1,
-1.32839, 0.4123812, -1.675395, 1, 1, 1, 1, 1,
-1.327697, -0.8094776, -1.343868, 1, 1, 1, 1, 1,
-1.317556, -1.827855, -3.698061, 1, 1, 1, 1, 1,
-1.316419, 0.2130287, -2.736343, 1, 1, 1, 1, 1,
-1.31522, 1.418597, -1.412054, 1, 1, 1, 1, 1,
-1.311581, 0.2456121, 0.6748644, 1, 1, 1, 1, 1,
-1.30557, 1.198756, -0.7275078, 1, 1, 1, 1, 1,
-1.303551, 0.4744217, -1.105921, 1, 1, 1, 1, 1,
-1.301314, -0.3520973, -1.831573, 1, 1, 1, 1, 1,
-1.29939, 1.181789, 0.5823982, 1, 1, 1, 1, 1,
-1.292851, 0.8384274, -1.469759, 0, 0, 1, 1, 1,
-1.292173, -0.08970769, -0.9584144, 1, 0, 0, 1, 1,
-1.284505, 1.712619, -0.8258368, 1, 0, 0, 1, 1,
-1.276041, -0.07165316, -0.9900807, 1, 0, 0, 1, 1,
-1.272497, -0.2865354, -2.793131, 1, 0, 0, 1, 1,
-1.272055, -1.205203, -2.747983, 1, 0, 0, 1, 1,
-1.270001, -0.2165031, -1.639367, 0, 0, 0, 1, 1,
-1.26974, 0.9622867, -0.3173513, 0, 0, 0, 1, 1,
-1.266902, -0.9507821, -1.188299, 0, 0, 0, 1, 1,
-1.263122, -0.627192, -1.972537, 0, 0, 0, 1, 1,
-1.223961, -0.5436723, -2.629858, 0, 0, 0, 1, 1,
-1.22067, -1.230294, -4.724071, 0, 0, 0, 1, 1,
-1.206738, -0.2298021, -2.79127, 0, 0, 0, 1, 1,
-1.201309, 0.4017796, -1.833119, 1, 1, 1, 1, 1,
-1.193885, -0.3269784, -2.317094, 1, 1, 1, 1, 1,
-1.191615, -0.4730522, -1.751062, 1, 1, 1, 1, 1,
-1.187153, -1.14148, -3.130907, 1, 1, 1, 1, 1,
-1.177456, -1.038355, -3.153437, 1, 1, 1, 1, 1,
-1.174634, 0.9863498, -0.09156661, 1, 1, 1, 1, 1,
-1.159141, -0.8490024, -1.395286, 1, 1, 1, 1, 1,
-1.154762, 0.2027878, -1.132622, 1, 1, 1, 1, 1,
-1.15106, -1.600465, -2.074329, 1, 1, 1, 1, 1,
-1.150727, -0.9696, -1.506058, 1, 1, 1, 1, 1,
-1.149236, 0.4827953, -0.5297462, 1, 1, 1, 1, 1,
-1.149102, 0.4863178, -2.259457, 1, 1, 1, 1, 1,
-1.144706, -1.195634, -4.160784, 1, 1, 1, 1, 1,
-1.142294, -0.2245017, -2.905663, 1, 1, 1, 1, 1,
-1.139302, 1.218266, -0.9276436, 1, 1, 1, 1, 1,
-1.139117, -0.468884, -2.003502, 0, 0, 1, 1, 1,
-1.137739, -1.712281, -3.230875, 1, 0, 0, 1, 1,
-1.130903, -1.127085, -1.493936, 1, 0, 0, 1, 1,
-1.130862, 1.384392, -0.3039414, 1, 0, 0, 1, 1,
-1.127822, 0.3718146, -1.658348, 1, 0, 0, 1, 1,
-1.124983, 0.4052522, -2.591442, 1, 0, 0, 1, 1,
-1.119402, 1.25695, 0.03261421, 0, 0, 0, 1, 1,
-1.118113, 0.5936459, -1.142281, 0, 0, 0, 1, 1,
-1.111698, -0.5149033, -2.129176, 0, 0, 0, 1, 1,
-1.100564, -0.518402, -1.765491, 0, 0, 0, 1, 1,
-1.099301, 1.061488, -1.757381, 0, 0, 0, 1, 1,
-1.095201, -0.3729305, -1.841918, 0, 0, 0, 1, 1,
-1.089937, 0.2068481, -1.120584, 0, 0, 0, 1, 1,
-1.088899, 0.0926614, -0.677475, 1, 1, 1, 1, 1,
-1.085331, -0.4432251, -1.922087, 1, 1, 1, 1, 1,
-1.084437, 0.01431855, -0.7297934, 1, 1, 1, 1, 1,
-1.075625, -0.6465412, -3.037189, 1, 1, 1, 1, 1,
-1.073159, -0.433328, -1.866087, 1, 1, 1, 1, 1,
-1.072736, -0.656575, -2.698467, 1, 1, 1, 1, 1,
-1.06978, 1.085123, -1.27731, 1, 1, 1, 1, 1,
-1.066444, 0.5578032, -3.167239, 1, 1, 1, 1, 1,
-1.062732, 1.200363, -0.1337984, 1, 1, 1, 1, 1,
-1.051307, 1.997877, -0.95374, 1, 1, 1, 1, 1,
-1.049506, -0.09501787, -0.2254205, 1, 1, 1, 1, 1,
-1.044656, 0.3230428, -1.20712, 1, 1, 1, 1, 1,
-1.043451, 0.8879957, 0.2768291, 1, 1, 1, 1, 1,
-1.040227, -1.315624, -1.168416, 1, 1, 1, 1, 1,
-1.03239, -1.496602, -5.176344, 1, 1, 1, 1, 1,
-1.031139, -0.5738671, -0.8367301, 0, 0, 1, 1, 1,
-1.028137, -0.8207478, -1.962218, 1, 0, 0, 1, 1,
-1.023867, 0.8141986, -0.980245, 1, 0, 0, 1, 1,
-1.023359, 1.907696, -2.501652, 1, 0, 0, 1, 1,
-1.022559, 0.2748908, -2.30013, 1, 0, 0, 1, 1,
-1.019892, 2.162332, -0.5940456, 1, 0, 0, 1, 1,
-1.018728, -0.5274419, -2.166442, 0, 0, 0, 1, 1,
-1.018487, -0.2854797, -1.930021, 0, 0, 0, 1, 1,
-1.014979, 0.9676126, 0.448925, 0, 0, 0, 1, 1,
-1.010826, 0.8576775, 0.2054936, 0, 0, 0, 1, 1,
-1.0101, -1.068836, -0.9939503, 0, 0, 0, 1, 1,
-1.007514, 0.635224, -0.6109402, 0, 0, 0, 1, 1,
-1.005005, -0.1279318, -0.5705248, 0, 0, 0, 1, 1,
-1.003495, 1.154514, -1.218858, 1, 1, 1, 1, 1,
-0.9898987, -0.5452319, 0.2293477, 1, 1, 1, 1, 1,
-0.9844233, 0.9667209, -2.830937, 1, 1, 1, 1, 1,
-0.9794616, 0.05135581, -0.8515159, 1, 1, 1, 1, 1,
-0.9739674, -1.248757, -3.346355, 1, 1, 1, 1, 1,
-0.9737601, 0.09501, -2.626944, 1, 1, 1, 1, 1,
-0.970996, 0.8095822, -0.9725961, 1, 1, 1, 1, 1,
-0.9541172, 0.7018563, -0.6403459, 1, 1, 1, 1, 1,
-0.9520088, -2.827389, -2.965805, 1, 1, 1, 1, 1,
-0.9468942, -2.609222, -1.762883, 1, 1, 1, 1, 1,
-0.9466506, 1.062419, -0.141424, 1, 1, 1, 1, 1,
-0.9462925, -0.07215968, -1.962607, 1, 1, 1, 1, 1,
-0.9406096, 0.9822194, -2.353502, 1, 1, 1, 1, 1,
-0.9401916, -2.719589, -3.417095, 1, 1, 1, 1, 1,
-0.9395775, -0.3658754, -1.888664, 1, 1, 1, 1, 1,
-0.9312955, -0.3501599, -1.461765, 0, 0, 1, 1, 1,
-0.9311618, 1.128637, -1.267893, 1, 0, 0, 1, 1,
-0.9298306, -1.545647, -3.401567, 1, 0, 0, 1, 1,
-0.926608, -1.697201, -1.739588, 1, 0, 0, 1, 1,
-0.9253074, -0.4611012, -2.445428, 1, 0, 0, 1, 1,
-0.9217232, -0.8390559, -3.605014, 1, 0, 0, 1, 1,
-0.9214709, -0.6604838, -3.072978, 0, 0, 0, 1, 1,
-0.919082, 0.3476796, 0.4956636, 0, 0, 0, 1, 1,
-0.9176232, 1.288249, -1.232841, 0, 0, 0, 1, 1,
-0.9172296, -0.01377789, -1.936573, 0, 0, 0, 1, 1,
-0.9144088, 0.894097, -0.7533494, 0, 0, 0, 1, 1,
-0.9001516, -0.7565151, -2.505907, 0, 0, 0, 1, 1,
-0.892464, 2.243585, -1.114998, 0, 0, 0, 1, 1,
-0.8901948, -1.162024, 0.1550595, 1, 1, 1, 1, 1,
-0.8816966, -0.5779815, -2.84761, 1, 1, 1, 1, 1,
-0.8782524, -0.285694, 0.4943009, 1, 1, 1, 1, 1,
-0.8765047, -0.150314, -1.893572, 1, 1, 1, 1, 1,
-0.8697929, 0.3458228, -1.827747, 1, 1, 1, 1, 1,
-0.864596, -1.4059, -4.061633, 1, 1, 1, 1, 1,
-0.8594936, 1.312336, -1.392839, 1, 1, 1, 1, 1,
-0.85904, -0.3942229, -0.5140467, 1, 1, 1, 1, 1,
-0.8578776, -0.8115646, -1.169115, 1, 1, 1, 1, 1,
-0.8551477, -1.024331, -0.3849125, 1, 1, 1, 1, 1,
-0.854458, 1.063899, 0.7936733, 1, 1, 1, 1, 1,
-0.8541672, -1.233518, -1.893345, 1, 1, 1, 1, 1,
-0.8509643, 0.1957568, -3.321569, 1, 1, 1, 1, 1,
-0.8502915, 0.2830457, -1.657467, 1, 1, 1, 1, 1,
-0.844099, -0.08933715, -0.766078, 1, 1, 1, 1, 1,
-0.8417901, -1.195195, -2.596152, 0, 0, 1, 1, 1,
-0.8394107, -0.9222357, -3.638788, 1, 0, 0, 1, 1,
-0.8372957, -1.238841, -1.973761, 1, 0, 0, 1, 1,
-0.8368356, -0.2541052, -2.461106, 1, 0, 0, 1, 1,
-0.834718, 0.1018905, -3.596176, 1, 0, 0, 1, 1,
-0.8256606, -0.4324108, -2.639254, 1, 0, 0, 1, 1,
-0.8178198, 0.09871478, -2.767417, 0, 0, 0, 1, 1,
-0.8128501, 0.5824718, 0.2055214, 0, 0, 0, 1, 1,
-0.8127918, 0.7667993, -0.4053712, 0, 0, 0, 1, 1,
-0.8120437, -0.333783, -1.924886, 0, 0, 0, 1, 1,
-0.8113187, 0.2314683, 0.4557392, 0, 0, 0, 1, 1,
-0.8100565, 0.01625578, -0.9364545, 0, 0, 0, 1, 1,
-0.8014811, 1.714989, -1.506433, 0, 0, 0, 1, 1,
-0.8012614, 1.055272, -0.8023281, 1, 1, 1, 1, 1,
-0.798301, 1.768192, 0.2668247, 1, 1, 1, 1, 1,
-0.7982808, -0.3125306, -1.073838, 1, 1, 1, 1, 1,
-0.7920551, 0.707489, 2.022462, 1, 1, 1, 1, 1,
-0.7797997, -2.049593, -3.181024, 1, 1, 1, 1, 1,
-0.7771659, -0.08591777, -1.364155, 1, 1, 1, 1, 1,
-0.775496, 1.533633, -2.76451, 1, 1, 1, 1, 1,
-0.7705277, -0.5423265, -1.531156, 1, 1, 1, 1, 1,
-0.7647145, 1.241893, -2.246777, 1, 1, 1, 1, 1,
-0.7646621, -0.6236838, -0.9782048, 1, 1, 1, 1, 1,
-0.7641109, -0.9999761, -2.090981, 1, 1, 1, 1, 1,
-0.7597313, -0.9123331, -1.651441, 1, 1, 1, 1, 1,
-0.7322086, 0.6249191, -0.4793233, 1, 1, 1, 1, 1,
-0.7300321, 0.1358316, -2.994956, 1, 1, 1, 1, 1,
-0.729722, 0.04191174, -0.8164917, 1, 1, 1, 1, 1,
-0.7296866, -0.06981687, -0.8165562, 0, 0, 1, 1, 1,
-0.7277775, 0.4385719, 0.140455, 1, 0, 0, 1, 1,
-0.7264444, -0.2437836, -2.272331, 1, 0, 0, 1, 1,
-0.7260751, -0.9285796, -1.923273, 1, 0, 0, 1, 1,
-0.7216374, 1.245788, -0.5234417, 1, 0, 0, 1, 1,
-0.7210234, -1.766835, -2.94956, 1, 0, 0, 1, 1,
-0.7172948, -0.2635955, -2.566252, 0, 0, 0, 1, 1,
-0.7132028, -1.263383, -3.479433, 0, 0, 0, 1, 1,
-0.7096368, -0.8386337, -4.663288, 0, 0, 0, 1, 1,
-0.7049441, 0.2286995, -0.07206867, 0, 0, 0, 1, 1,
-0.7043924, 0.4625628, 2.205848, 0, 0, 0, 1, 1,
-0.7031977, -0.9458345, -3.765564, 0, 0, 0, 1, 1,
-0.6979171, -0.3171245, -2.987932, 0, 0, 0, 1, 1,
-0.6959665, -0.8089167, -1.755081, 1, 1, 1, 1, 1,
-0.6955408, -0.1080905, -1.154269, 1, 1, 1, 1, 1,
-0.6944663, 0.6393986, 0.1853439, 1, 1, 1, 1, 1,
-0.6920539, 0.1409502, -1.435699, 1, 1, 1, 1, 1,
-0.6902888, -1.192779, -2.605016, 1, 1, 1, 1, 1,
-0.6880525, -0.8122767, -4.021322, 1, 1, 1, 1, 1,
-0.6868828, 0.4722361, -1.95182, 1, 1, 1, 1, 1,
-0.6811581, -0.4066977, -3.303534, 1, 1, 1, 1, 1,
-0.6752494, 0.02248264, -1.902334, 1, 1, 1, 1, 1,
-0.6566865, -2.3006, -3.321262, 1, 1, 1, 1, 1,
-0.6517524, -1.872749, -1.790727, 1, 1, 1, 1, 1,
-0.6483707, -0.1726573, -1.978299, 1, 1, 1, 1, 1,
-0.6472707, 0.6830139, 0.6511195, 1, 1, 1, 1, 1,
-0.6428838, 0.5641485, -0.7659599, 1, 1, 1, 1, 1,
-0.6410774, -1.156059, -2.878943, 1, 1, 1, 1, 1,
-0.6399583, 1.059123, -0.8839107, 0, 0, 1, 1, 1,
-0.6359907, 0.7670765, -1.988706, 1, 0, 0, 1, 1,
-0.6284525, -1.548336, -3.270007, 1, 0, 0, 1, 1,
-0.6240519, 0.05752093, 0.4315207, 1, 0, 0, 1, 1,
-0.6147929, -1.917176, -2.762228, 1, 0, 0, 1, 1,
-0.6144823, -0.9691901, -2.586182, 1, 0, 0, 1, 1,
-0.6031504, 0.2852049, -0.08591678, 0, 0, 0, 1, 1,
-0.6005489, -1.724154, -2.339818, 0, 0, 0, 1, 1,
-0.6002563, -0.6668064, -3.404904, 0, 0, 0, 1, 1,
-0.599404, 0.03708631, -2.353365, 0, 0, 0, 1, 1,
-0.5980557, 0.5428306, -0.0341372, 0, 0, 0, 1, 1,
-0.5976887, -1.504519, -4.007799, 0, 0, 0, 1, 1,
-0.5903266, 0.6955335, -1.051046, 0, 0, 0, 1, 1,
-0.5862274, 0.7000052, 0.3440472, 1, 1, 1, 1, 1,
-0.5850281, 0.6583961, 0.9639702, 1, 1, 1, 1, 1,
-0.5835964, 0.150628, -2.685219, 1, 1, 1, 1, 1,
-0.5815462, 0.1630494, 0.2234145, 1, 1, 1, 1, 1,
-0.5814227, -0.8141811, -1.798249, 1, 1, 1, 1, 1,
-0.5812297, -0.3258123, -1.910596, 1, 1, 1, 1, 1,
-0.5775501, 2.34657, -2.035099, 1, 1, 1, 1, 1,
-0.5769963, 2.199502, 0.9808413, 1, 1, 1, 1, 1,
-0.5741723, -1.001631, -3.751918, 1, 1, 1, 1, 1,
-0.5638414, -0.05766482, -2.835727, 1, 1, 1, 1, 1,
-0.5634686, 0.3570535, -0.7802222, 1, 1, 1, 1, 1,
-0.5625482, 1.375801, 0.2649965, 1, 1, 1, 1, 1,
-0.5597593, -0.1742129, -1.799357, 1, 1, 1, 1, 1,
-0.5590699, -0.6463493, -1.242015, 1, 1, 1, 1, 1,
-0.5556862, 0.9992229, 0.499327, 1, 1, 1, 1, 1,
-0.5537391, -1.235471, -3.497483, 0, 0, 1, 1, 1,
-0.5506617, 1.953191, -1.013497, 1, 0, 0, 1, 1,
-0.5481252, -1.972674, -1.558057, 1, 0, 0, 1, 1,
-0.5395304, 0.3231855, -0.8444682, 1, 0, 0, 1, 1,
-0.5347456, 1.638281, 0.6668605, 1, 0, 0, 1, 1,
-0.5345961, 0.9997546, -1.151271, 1, 0, 0, 1, 1,
-0.5287876, 0.134882, -2.198494, 0, 0, 0, 1, 1,
-0.528389, 0.005347401, -0.2681311, 0, 0, 0, 1, 1,
-0.5267377, -0.2058609, -2.433813, 0, 0, 0, 1, 1,
-0.5174704, 0.0008078276, -3.319199, 0, 0, 0, 1, 1,
-0.5098886, 0.5549952, -2.076735, 0, 0, 0, 1, 1,
-0.5091889, -1.13987, -1.469846, 0, 0, 0, 1, 1,
-0.5084206, 1.400588, -0.3760904, 0, 0, 0, 1, 1,
-0.5040437, 1.615764, -0.3123198, 1, 1, 1, 1, 1,
-0.5001621, -1.070194, -3.426526, 1, 1, 1, 1, 1,
-0.499201, 1.239472, 0.3051982, 1, 1, 1, 1, 1,
-0.4913076, -1.079024, -3.384935, 1, 1, 1, 1, 1,
-0.4911158, 0.6878406, -0.2260202, 1, 1, 1, 1, 1,
-0.4907279, -0.3476629, -2.717973, 1, 1, 1, 1, 1,
-0.485836, 0.5134172, -0.5721055, 1, 1, 1, 1, 1,
-0.4837269, 0.07317107, -0.6063711, 1, 1, 1, 1, 1,
-0.4836093, 1.127173, -0.3894221, 1, 1, 1, 1, 1,
-0.4786173, -0.8517992, -1.850367, 1, 1, 1, 1, 1,
-0.4766477, 0.2419073, -2.757052, 1, 1, 1, 1, 1,
-0.476447, 0.5164127, -0.7967189, 1, 1, 1, 1, 1,
-0.4755341, 0.8823362, -1.01592, 1, 1, 1, 1, 1,
-0.4754194, -0.912484, -1.3595, 1, 1, 1, 1, 1,
-0.474929, -0.7913277, -2.518303, 1, 1, 1, 1, 1,
-0.4749252, -0.7092013, -2.669966, 0, 0, 1, 1, 1,
-0.4669427, 0.594058, -0.9077042, 1, 0, 0, 1, 1,
-0.4668134, 1.71755, -1.539119, 1, 0, 0, 1, 1,
-0.4639091, 1.333477, 1.999987, 1, 0, 0, 1, 1,
-0.4619993, -1.085605, -2.084784, 1, 0, 0, 1, 1,
-0.4609686, -1.302934, -1.72025, 1, 0, 0, 1, 1,
-0.4582267, -0.7352669, -1.910847, 0, 0, 0, 1, 1,
-0.4571828, -1.338581, -2.538123, 0, 0, 0, 1, 1,
-0.4568361, 0.5956761, 1.297483, 0, 0, 0, 1, 1,
-0.4554788, -0.06946107, -0.8636325, 0, 0, 0, 1, 1,
-0.4548364, -0.05916357, -0.8844341, 0, 0, 0, 1, 1,
-0.452087, 1.242153, -0.4502667, 0, 0, 0, 1, 1,
-0.4520498, -0.001920899, -0.9656647, 0, 0, 0, 1, 1,
-0.4516036, 0.6087813, 0.3962135, 1, 1, 1, 1, 1,
-0.448792, 0.7374448, 1.320993, 1, 1, 1, 1, 1,
-0.4461048, 0.5084782, 1.486217, 1, 1, 1, 1, 1,
-0.445059, -1.689542, -2.829047, 1, 1, 1, 1, 1,
-0.4415146, -0.07672079, -2.737337, 1, 1, 1, 1, 1,
-0.4404111, 0.2846966, -1.557793, 1, 1, 1, 1, 1,
-0.4398683, -1.437477, -3.951478, 1, 1, 1, 1, 1,
-0.4387805, 0.6921622, -1.204881, 1, 1, 1, 1, 1,
-0.4357705, 0.0438261, -0.8030089, 1, 1, 1, 1, 1,
-0.4337227, 1.682654, -1.722765, 1, 1, 1, 1, 1,
-0.4296983, 0.002216268, -1.652733, 1, 1, 1, 1, 1,
-0.4293273, -0.189342, -1.290766, 1, 1, 1, 1, 1,
-0.4277131, -0.008820279, -1.074597, 1, 1, 1, 1, 1,
-0.4239331, 1.109083, 0.4452892, 1, 1, 1, 1, 1,
-0.4209344, -0.9053725, -1.571636, 1, 1, 1, 1, 1,
-0.4176683, -0.5681817, -2.557098, 0, 0, 1, 1, 1,
-0.4119434, 0.3540202, -0.8942354, 1, 0, 0, 1, 1,
-0.4110365, -2.43824, -3.140153, 1, 0, 0, 1, 1,
-0.409634, -0.5310575, -2.69846, 1, 0, 0, 1, 1,
-0.409522, 0.3346627, -0.401236, 1, 0, 0, 1, 1,
-0.4067276, 0.04180013, -1.834857, 1, 0, 0, 1, 1,
-0.4038157, 2.006735, -0.4282584, 0, 0, 0, 1, 1,
-0.4018921, -0.6154252, -2.818137, 0, 0, 0, 1, 1,
-0.401123, 0.3132505, -1.31057, 0, 0, 0, 1, 1,
-0.3987659, -0.8134872, -1.384524, 0, 0, 0, 1, 1,
-0.3981027, -0.4770683, -2.207574, 0, 0, 0, 1, 1,
-0.3959366, 0.1297635, -1.211475, 0, 0, 0, 1, 1,
-0.3904197, 0.5443481, -1.777038, 0, 0, 0, 1, 1,
-0.3895079, 1.338281, -0.6594149, 1, 1, 1, 1, 1,
-0.3892552, -0.2851921, -1.818969, 1, 1, 1, 1, 1,
-0.3883016, -0.50337, -2.012928, 1, 1, 1, 1, 1,
-0.3873795, 0.4064547, -0.09064806, 1, 1, 1, 1, 1,
-0.3872434, 0.5816903, -0.6287363, 1, 1, 1, 1, 1,
-0.3826194, 0.3855225, -2.20488, 1, 1, 1, 1, 1,
-0.3811851, 0.3170933, -1.177811, 1, 1, 1, 1, 1,
-0.3776665, -0.8796298, -0.8477634, 1, 1, 1, 1, 1,
-0.3752635, -0.506653, -3.606071, 1, 1, 1, 1, 1,
-0.3712617, 0.2624586, -0.9521065, 1, 1, 1, 1, 1,
-0.3672288, -0.5388376, -2.673906, 1, 1, 1, 1, 1,
-0.3664976, 0.3180624, 0.6476759, 1, 1, 1, 1, 1,
-0.3634036, -0.757565, -0.5864134, 1, 1, 1, 1, 1,
-0.3622169, 0.8804922, 0.5388929, 1, 1, 1, 1, 1,
-0.362187, -0.155437, -1.319083, 1, 1, 1, 1, 1,
-0.3621147, -0.9152384, -3.91945, 0, 0, 1, 1, 1,
-0.3589888, -0.9006595, -1.895698, 1, 0, 0, 1, 1,
-0.3586235, 1.002729, -0.6888173, 1, 0, 0, 1, 1,
-0.3555923, -0.6562262, -1.870453, 1, 0, 0, 1, 1,
-0.3534591, -0.5312228, -3.662126, 1, 0, 0, 1, 1,
-0.3524817, 0.5311918, -0.8797222, 1, 0, 0, 1, 1,
-0.3517177, -1.750759, -2.894408, 0, 0, 0, 1, 1,
-0.3481193, 0.0434191, -0.8939868, 0, 0, 0, 1, 1,
-0.3480243, -0.01663639, -0.4774426, 0, 0, 0, 1, 1,
-0.3473215, -1.314999, -2.76554, 0, 0, 0, 1, 1,
-0.3444789, 0.9994648, -1.730548, 0, 0, 0, 1, 1,
-0.337805, -0.3018926, -3.511661, 0, 0, 0, 1, 1,
-0.3370716, 0.3697235, -1.390792, 0, 0, 0, 1, 1,
-0.3354305, 1.517644, 0.8679014, 1, 1, 1, 1, 1,
-0.3339765, 0.1019193, -2.451891, 1, 1, 1, 1, 1,
-0.3335206, 0.9933557, -0.6659791, 1, 1, 1, 1, 1,
-0.3307154, 1.23113, -1.821698, 1, 1, 1, 1, 1,
-0.3301466, 0.8138053, -0.2008107, 1, 1, 1, 1, 1,
-0.3285412, 1.040749, 0.06028688, 1, 1, 1, 1, 1,
-0.3279572, -0.6176881, -3.371519, 1, 1, 1, 1, 1,
-0.3256029, -1.062621, -3.568232, 1, 1, 1, 1, 1,
-0.3219719, -0.03565099, -2.880477, 1, 1, 1, 1, 1,
-0.3217782, -0.2833928, -3.427212, 1, 1, 1, 1, 1,
-0.3202119, 0.2926909, -1.403012, 1, 1, 1, 1, 1,
-0.3161087, 0.8556835, -0.5091435, 1, 1, 1, 1, 1,
-0.3018495, 0.2542081, -0.7714974, 1, 1, 1, 1, 1,
-0.3013765, 0.1553709, -0.9386427, 1, 1, 1, 1, 1,
-0.2963005, 1.46749, 0.8617549, 1, 1, 1, 1, 1,
-0.2958211, 1.364052, 0.4114483, 0, 0, 1, 1, 1,
-0.293071, 0.5100635, -0.3069282, 1, 0, 0, 1, 1,
-0.291065, 1.319974, 0.9182568, 1, 0, 0, 1, 1,
-0.2839553, -0.08954719, -2.278587, 1, 0, 0, 1, 1,
-0.2789608, 1.011087, -0.3524757, 1, 0, 0, 1, 1,
-0.2782573, 0.1141475, -3.60186, 1, 0, 0, 1, 1,
-0.2780517, -1.180989, -4.683066, 0, 0, 0, 1, 1,
-0.2779557, 1.87322, -2.273003, 0, 0, 0, 1, 1,
-0.2771153, -1.378849, -4.212711, 0, 0, 0, 1, 1,
-0.2770866, 1.511153, -0.8380979, 0, 0, 0, 1, 1,
-0.2767733, -0.08892506, -2.048873, 0, 0, 0, 1, 1,
-0.2757564, -0.8602889, -3.548994, 0, 0, 0, 1, 1,
-0.2651778, 0.1166272, -0.9514843, 0, 0, 0, 1, 1,
-0.2632702, 1.355849, -0.06470311, 1, 1, 1, 1, 1,
-0.2623143, 1.219344, 1.661278, 1, 1, 1, 1, 1,
-0.26022, 0.5402062, 0.5840037, 1, 1, 1, 1, 1,
-0.2597387, 0.130633, -2.293778, 1, 1, 1, 1, 1,
-0.2590765, 0.7523278, -0.9962755, 1, 1, 1, 1, 1,
-0.2584427, -0.1830037, -2.769207, 1, 1, 1, 1, 1,
-0.2543977, -2.29336, -2.708078, 1, 1, 1, 1, 1,
-0.252006, 0.1351947, -2.014094, 1, 1, 1, 1, 1,
-0.2468922, -1.80085, -3.021277, 1, 1, 1, 1, 1,
-0.2468156, 0.588513, -1.28394, 1, 1, 1, 1, 1,
-0.246368, 0.433394, 0.7432883, 1, 1, 1, 1, 1,
-0.2449929, -0.6443762, -2.565467, 1, 1, 1, 1, 1,
-0.2393703, 0.4657589, -0.8552932, 1, 1, 1, 1, 1,
-0.2324047, 0.9881201, -1.349054, 1, 1, 1, 1, 1,
-0.2320102, -0.5040892, -2.438568, 1, 1, 1, 1, 1,
-0.2315677, -0.3597109, -3.737017, 0, 0, 1, 1, 1,
-0.2265542, 1.142995, 0.1729658, 1, 0, 0, 1, 1,
-0.2228343, -0.4802835, -3.002053, 1, 0, 0, 1, 1,
-0.2225596, 0.4638693, -1.07686, 1, 0, 0, 1, 1,
-0.2219476, -0.3713243, -2.241393, 1, 0, 0, 1, 1,
-0.2166556, -0.3097675, -0.6397907, 1, 0, 0, 1, 1,
-0.2162368, 1.173483, -2.491967, 0, 0, 0, 1, 1,
-0.2157705, -0.0396851, -1.532728, 0, 0, 0, 1, 1,
-0.2070242, -1.216914, -1.974706, 0, 0, 0, 1, 1,
-0.2065836, -0.9756992, -4.529744, 0, 0, 0, 1, 1,
-0.2057756, -0.774675, -1.705752, 0, 0, 0, 1, 1,
-0.2036738, -0.8714319, -1.355206, 0, 0, 0, 1, 1,
-0.1997026, 1.693113, 1.953126, 0, 0, 0, 1, 1,
-0.1951749, -0.5247443, -1.6576, 1, 1, 1, 1, 1,
-0.1928681, 1.538125, -1.088421, 1, 1, 1, 1, 1,
-0.1895963, 0.8191312, -1.263581, 1, 1, 1, 1, 1,
-0.1773015, -1.248979, -3.01773, 1, 1, 1, 1, 1,
-0.1758714, -1.123736, -3.634166, 1, 1, 1, 1, 1,
-0.1749713, -1.607383, -2.065403, 1, 1, 1, 1, 1,
-0.1746805, -1.707181, -3.977153, 1, 1, 1, 1, 1,
-0.1710644, -0.6824195, -4.236627, 1, 1, 1, 1, 1,
-0.1657586, -0.6816831, -3.294797, 1, 1, 1, 1, 1,
-0.1600048, 0.2771825, -0.8771544, 1, 1, 1, 1, 1,
-0.1588177, 1.649423, 1.142483, 1, 1, 1, 1, 1,
-0.1579456, 0.6963519, 0.2328783, 1, 1, 1, 1, 1,
-0.156688, 1.780163, -1.432146, 1, 1, 1, 1, 1,
-0.1494939, 0.76903, 2.27692, 1, 1, 1, 1, 1,
-0.1477401, 0.510151, 1.987075, 1, 1, 1, 1, 1,
-0.1426482, -0.5776109, -3.327631, 0, 0, 1, 1, 1,
-0.1397062, 0.3989667, -1.384605, 1, 0, 0, 1, 1,
-0.139295, 0.9996858, -1.196383, 1, 0, 0, 1, 1,
-0.1366819, -0.3112967, -2.866986, 1, 0, 0, 1, 1,
-0.1321824, 0.1332669, -0.1417843, 1, 0, 0, 1, 1,
-0.1320993, 1.099089, -0.6050924, 1, 0, 0, 1, 1,
-0.1313078, 0.4986977, -0.755916, 0, 0, 0, 1, 1,
-0.1292021, 0.8363425, 0.03086693, 0, 0, 0, 1, 1,
-0.1288645, 0.2025678, -0.3568649, 0, 0, 0, 1, 1,
-0.1274984, 0.4384166, -1.619315, 0, 0, 0, 1, 1,
-0.127037, 1.633776, -1.951658, 0, 0, 0, 1, 1,
-0.1244025, 0.464518, 0.4300517, 0, 0, 0, 1, 1,
-0.1202387, 1.347777, -0.6781102, 0, 0, 0, 1, 1,
-0.1167091, 0.5197551, -0.2609853, 1, 1, 1, 1, 1,
-0.1124805, -0.04502428, -3.133279, 1, 1, 1, 1, 1,
-0.111317, 0.5702811, -1.349559, 1, 1, 1, 1, 1,
-0.1025017, 1.209823, 1.194429, 1, 1, 1, 1, 1,
-0.09647525, -0.5561185, -3.485445, 1, 1, 1, 1, 1,
-0.0960771, -0.4514913, -3.703001, 1, 1, 1, 1, 1,
-0.09002822, -1.438237, -1.932209, 1, 1, 1, 1, 1,
-0.08601964, 0.5888882, 0.0353689, 1, 1, 1, 1, 1,
-0.08335558, 2.019561, 0.6556476, 1, 1, 1, 1, 1,
-0.08097526, -0.1342368, -1.455611, 1, 1, 1, 1, 1,
-0.0777989, 0.1969056, -0.7046259, 1, 1, 1, 1, 1,
-0.07013866, 0.6427073, -0.8104395, 1, 1, 1, 1, 1,
-0.06971709, 0.5225849, 1.588602, 1, 1, 1, 1, 1,
-0.06867183, -0.1071569, -1.32099, 1, 1, 1, 1, 1,
-0.06593514, 0.3460758, -2.440956, 1, 1, 1, 1, 1,
-0.06536032, 0.4721646, -1.802001, 0, 0, 1, 1, 1,
-0.06326995, 1.466276, 0.4898306, 1, 0, 0, 1, 1,
-0.05225601, -0.7162579, -3.657291, 1, 0, 0, 1, 1,
-0.05083208, -0.9062271, -4.407425, 1, 0, 0, 1, 1,
-0.05010339, -0.06092672, -2.361753, 1, 0, 0, 1, 1,
-0.04880793, -0.505833, -1.731016, 1, 0, 0, 1, 1,
-0.04719254, -0.2347539, -3.177567, 0, 0, 0, 1, 1,
-0.04398672, -0.07649329, -2.702117, 0, 0, 0, 1, 1,
-0.042872, -0.1355923, -0.8717954, 0, 0, 0, 1, 1,
-0.04202564, 1.081831, -0.1984099, 0, 0, 0, 1, 1,
-0.04077319, -1.716491, -2.95215, 0, 0, 0, 1, 1,
-0.03591905, 0.5261934, -1.313941, 0, 0, 0, 1, 1,
-0.03554524, 0.01332088, -1.22257, 0, 0, 0, 1, 1,
-0.03420927, -1.435983, -6.14683, 1, 1, 1, 1, 1,
-0.03189034, 0.7382243, -0.2726796, 1, 1, 1, 1, 1,
-0.03179413, 0.3906846, -0.5119929, 1, 1, 1, 1, 1,
-0.03111058, -1.210076, -2.548098, 1, 1, 1, 1, 1,
-0.03089637, 0.2919696, -0.09712124, 1, 1, 1, 1, 1,
-0.03038011, 0.8374278, 0.9522911, 1, 1, 1, 1, 1,
-0.02982039, -0.8059128, -5.426133, 1, 1, 1, 1, 1,
-0.0248593, -1.133812, -3.715223, 1, 1, 1, 1, 1,
-0.02359427, -0.05009385, -2.013258, 1, 1, 1, 1, 1,
-0.01898649, -1.252941, -2.981654, 1, 1, 1, 1, 1,
-0.01461512, -0.2719954, -4.809165, 1, 1, 1, 1, 1,
-0.01391388, -0.925036, -3.088772, 1, 1, 1, 1, 1,
-0.008688186, 0.5637055, 0.2223011, 1, 1, 1, 1, 1,
-0.008329492, -0.827463, -4.74935, 1, 1, 1, 1, 1,
-0.002912969, -1.711889, -3.182564, 1, 1, 1, 1, 1,
0.0001389397, -0.6658417, 3.591505, 0, 0, 1, 1, 1,
0.006774063, 0.5055583, 0.5414866, 1, 0, 0, 1, 1,
0.007839419, 1.153525, -0.9861082, 1, 0, 0, 1, 1,
0.008826499, 0.4825997, -1.300735, 1, 0, 0, 1, 1,
0.01316036, -0.6046185, 2.250087, 1, 0, 0, 1, 1,
0.01356742, -0.2135866, 3.994001, 1, 0, 0, 1, 1,
0.01633499, 0.9918279, 0.5097719, 0, 0, 0, 1, 1,
0.01785015, 0.3548632, -1.564145, 0, 0, 0, 1, 1,
0.01895727, 0.3110635, -0.2746094, 0, 0, 0, 1, 1,
0.02661477, 0.8725098, 0.01923264, 0, 0, 0, 1, 1,
0.02704827, 0.2309152, 1.361578, 0, 0, 0, 1, 1,
0.02792464, 2.425783, -1.052008, 0, 0, 0, 1, 1,
0.0283006, 1.243994, -0.1738305, 0, 0, 0, 1, 1,
0.02904001, -0.1221198, 3.963815, 1, 1, 1, 1, 1,
0.03058487, -0.7571793, 4.940679, 1, 1, 1, 1, 1,
0.03096256, -1.042707, 2.662171, 1, 1, 1, 1, 1,
0.03104541, -0.2006447, 3.398613, 1, 1, 1, 1, 1,
0.0342785, -0.3733221, 2.628494, 1, 1, 1, 1, 1,
0.03448339, -0.9137159, 3.896892, 1, 1, 1, 1, 1,
0.03455575, -0.1208894, 2.028102, 1, 1, 1, 1, 1,
0.04048708, -0.5118181, 3.796343, 1, 1, 1, 1, 1,
0.04143831, 1.246941, 0.2022182, 1, 1, 1, 1, 1,
0.04190072, 0.1592989, 0.4674324, 1, 1, 1, 1, 1,
0.04317316, 0.169837, -0.08400571, 1, 1, 1, 1, 1,
0.04376383, 0.160562, 0.4200316, 1, 1, 1, 1, 1,
0.0457517, 2.135585, -1.294198, 1, 1, 1, 1, 1,
0.04968818, -1.214581, 3.969388, 1, 1, 1, 1, 1,
0.05116044, 0.7369748, -0.1179191, 1, 1, 1, 1, 1,
0.05293175, 1.686587, 0.4262715, 0, 0, 1, 1, 1,
0.05307145, -0.4541375, 2.041745, 1, 0, 0, 1, 1,
0.05533405, -0.5498168, 3.671416, 1, 0, 0, 1, 1,
0.05713733, -0.9384801, 0.5129874, 1, 0, 0, 1, 1,
0.05728246, -0.4441424, 2.256422, 1, 0, 0, 1, 1,
0.05762436, -1.613424, 4.032314, 1, 0, 0, 1, 1,
0.06019004, 0.3388513, 0.7823206, 0, 0, 0, 1, 1,
0.06287427, 0.7495716, 0.946824, 0, 0, 0, 1, 1,
0.06795236, 0.2740005, 0.7478192, 0, 0, 0, 1, 1,
0.0715623, 0.8759053, 1.428356, 0, 0, 0, 1, 1,
0.07446131, -1.460176, 3.294884, 0, 0, 0, 1, 1,
0.07592897, 0.09603053, 1.434882, 0, 0, 0, 1, 1,
0.08377665, 0.1249112, 2.334408, 0, 0, 0, 1, 1,
0.08572751, 0.4581935, 1.184245, 1, 1, 1, 1, 1,
0.08712731, -0.9139456, 3.966259, 1, 1, 1, 1, 1,
0.09080049, 2.198869, -0.5172977, 1, 1, 1, 1, 1,
0.09234411, 0.1509589, 0.2550193, 1, 1, 1, 1, 1,
0.1029287, 0.1006772, 1.130174, 1, 1, 1, 1, 1,
0.1059669, 0.1299657, 1.216037, 1, 1, 1, 1, 1,
0.1141924, -0.2574648, 2.185888, 1, 1, 1, 1, 1,
0.1145334, -0.506187, 4.72701, 1, 1, 1, 1, 1,
0.1152324, -1.38346, 3.133142, 1, 1, 1, 1, 1,
0.1172201, -0.3237228, 2.287704, 1, 1, 1, 1, 1,
0.1187756, 0.8344961, -1.118038, 1, 1, 1, 1, 1,
0.119769, -1.148597, 2.858222, 1, 1, 1, 1, 1,
0.1209272, -0.6483772, 3.481977, 1, 1, 1, 1, 1,
0.1245262, -0.6945257, 4.255887, 1, 1, 1, 1, 1,
0.125059, -0.2144202, 2.889086, 1, 1, 1, 1, 1,
0.1259884, 0.6908946, 1.081325, 0, 0, 1, 1, 1,
0.1275472, 0.6054088, 2.723727, 1, 0, 0, 1, 1,
0.1288128, 0.03698216, 2.239185, 1, 0, 0, 1, 1,
0.1310683, -0.9250537, 3.669341, 1, 0, 0, 1, 1,
0.1323616, -0.368807, 3.840351, 1, 0, 0, 1, 1,
0.1324244, -0.1852081, 3.008356, 1, 0, 0, 1, 1,
0.1380722, -1.516233, 1.787341, 0, 0, 0, 1, 1,
0.1393001, 2.504096, -0.05851647, 0, 0, 0, 1, 1,
0.1393474, 0.7396447, 0.2349251, 0, 0, 0, 1, 1,
0.1405664, -1.782648, 1.143209, 0, 0, 0, 1, 1,
0.1459161, 1.125051, 0.4005856, 0, 0, 0, 1, 1,
0.1467171, -0.5835658, 3.813524, 0, 0, 0, 1, 1,
0.1512368, -0.282878, 3.313068, 0, 0, 0, 1, 1,
0.1535958, -0.2444038, 1.182621, 1, 1, 1, 1, 1,
0.1549489, 0.9572213, 0.08086745, 1, 1, 1, 1, 1,
0.1551817, -0.2598979, 4.171531, 1, 1, 1, 1, 1,
0.1562996, 0.7339619, 0.6378859, 1, 1, 1, 1, 1,
0.1566555, 0.09230534, 0.3752598, 1, 1, 1, 1, 1,
0.1604604, 1.346638, 0.2885602, 1, 1, 1, 1, 1,
0.1617605, -1.534392, 2.274393, 1, 1, 1, 1, 1,
0.1625761, -1.760869, 3.826229, 1, 1, 1, 1, 1,
0.163175, -1.205943, 3.438828, 1, 1, 1, 1, 1,
0.1642673, 0.6307103, 0.1488067, 1, 1, 1, 1, 1,
0.1683173, -2.056895, 4.652674, 1, 1, 1, 1, 1,
0.1691751, -0.5717865, 1.512281, 1, 1, 1, 1, 1,
0.1731748, 0.5714751, 0.1876623, 1, 1, 1, 1, 1,
0.1735109, -0.7751867, 4.210069, 1, 1, 1, 1, 1,
0.1783666, 0.2318153, 2.474487, 1, 1, 1, 1, 1,
0.1830764, -1.964533, 4.314337, 0, 0, 1, 1, 1,
0.1848711, -1.697853, 3.272131, 1, 0, 0, 1, 1,
0.1864256, 0.9355991, 0.8741645, 1, 0, 0, 1, 1,
0.1867605, 0.4174517, 1.243432, 1, 0, 0, 1, 1,
0.1869111, 0.06658495, 1.669331, 1, 0, 0, 1, 1,
0.1871233, 1.175418, 0.03536125, 1, 0, 0, 1, 1,
0.1892578, 0.2232309, 1.200343, 0, 0, 0, 1, 1,
0.1914819, 0.9418468, 0.764944, 0, 0, 0, 1, 1,
0.1925963, -0.9915231, 1.122913, 0, 0, 0, 1, 1,
0.1936415, -1.587138, 1.212349, 0, 0, 0, 1, 1,
0.1974337, 0.7317758, 1.334635, 0, 0, 0, 1, 1,
0.1990641, 0.4334859, 0.6687495, 0, 0, 0, 1, 1,
0.199097, -0.2459769, 3.24328, 0, 0, 0, 1, 1,
0.1996182, -0.4592201, 1.682544, 1, 1, 1, 1, 1,
0.2016728, 1.027599, 1.202031, 1, 1, 1, 1, 1,
0.201846, -1.095369, 3.590815, 1, 1, 1, 1, 1,
0.2055552, 1.544299, 0.6941003, 1, 1, 1, 1, 1,
0.2113173, 0.06749083, 1.936494, 1, 1, 1, 1, 1,
0.2130742, 0.1694613, 1.663585, 1, 1, 1, 1, 1,
0.2170784, 0.07681482, 2.893558, 1, 1, 1, 1, 1,
0.2207526, 1.227188, 0.6537079, 1, 1, 1, 1, 1,
0.2242311, -1.783473, 3.33217, 1, 1, 1, 1, 1,
0.2247838, -0.9860496, 2.144448, 1, 1, 1, 1, 1,
0.2249564, -0.5159836, 2.572487, 1, 1, 1, 1, 1,
0.2259233, 0.5177663, 2.155807, 1, 1, 1, 1, 1,
0.2308244, -2.142035, 4.184744, 1, 1, 1, 1, 1,
0.2321026, 0.4899454, 0.2611607, 1, 1, 1, 1, 1,
0.2348855, 0.2397361, -0.4351758, 1, 1, 1, 1, 1,
0.2358222, -0.8192407, 2.689082, 0, 0, 1, 1, 1,
0.2418006, 0.86838, -0.3392252, 1, 0, 0, 1, 1,
0.2426564, 0.7071142, -0.2538281, 1, 0, 0, 1, 1,
0.2432677, -1.08131, 1.866643, 1, 0, 0, 1, 1,
0.243798, 0.822853, 1.358059, 1, 0, 0, 1, 1,
0.2445238, -1.961558, 2.43325, 1, 0, 0, 1, 1,
0.2465745, -0.292496, 3.055407, 0, 0, 0, 1, 1,
0.2535885, -0.3133613, 1.737363, 0, 0, 0, 1, 1,
0.2556887, -0.08042171, 1.331621, 0, 0, 0, 1, 1,
0.257322, 1.520982, -1.192327, 0, 0, 0, 1, 1,
0.2582909, -1.043137, 0.8662672, 0, 0, 0, 1, 1,
0.2613904, -0.9208589, 3.963787, 0, 0, 0, 1, 1,
0.2640073, 1.518918, 0.891008, 0, 0, 0, 1, 1,
0.2657541, -0.4948016, 2.082289, 1, 1, 1, 1, 1,
0.2659158, -1.429281, 1.817521, 1, 1, 1, 1, 1,
0.2692142, 1.699297, 0.6781041, 1, 1, 1, 1, 1,
0.2716543, 1.657843, 0.009687738, 1, 1, 1, 1, 1,
0.2733216, -1.764771, 4.469936, 1, 1, 1, 1, 1,
0.2744977, -0.3966435, 4.332546, 1, 1, 1, 1, 1,
0.2782544, 0.8559815, 0.4479452, 1, 1, 1, 1, 1,
0.2800384, 0.2455917, 0.7950895, 1, 1, 1, 1, 1,
0.2808252, -1.274365, 1.911124, 1, 1, 1, 1, 1,
0.282896, -0.5265943, 2.459987, 1, 1, 1, 1, 1,
0.2840855, 0.05939493, 2.131468, 1, 1, 1, 1, 1,
0.2876226, 0.2671082, 0.1005191, 1, 1, 1, 1, 1,
0.2939164, -0.263375, 3.12115, 1, 1, 1, 1, 1,
0.2992904, 1.382597, -2.343764, 1, 1, 1, 1, 1,
0.3004022, -0.966174, 3.037074, 1, 1, 1, 1, 1,
0.3016026, 2.539025, 0.3449736, 0, 0, 1, 1, 1,
0.3023246, -0.2537901, 1.431695, 1, 0, 0, 1, 1,
0.3047591, 1.579715, -0.142367, 1, 0, 0, 1, 1,
0.3068505, 0.7022028, -0.5688018, 1, 0, 0, 1, 1,
0.3169369, -2.1349, 3.622794, 1, 0, 0, 1, 1,
0.3181131, -0.1818076, 2.605417, 1, 0, 0, 1, 1,
0.3235918, -0.05222907, 2.270074, 0, 0, 0, 1, 1,
0.3269702, 0.3382145, 0.3047951, 0, 0, 0, 1, 1,
0.3288396, -0.05959141, 1.19546, 0, 0, 0, 1, 1,
0.3293216, -0.7911975, 2.338274, 0, 0, 0, 1, 1,
0.3362626, 0.5869642, 0.2484448, 0, 0, 0, 1, 1,
0.3364412, 0.09007955, 1.317381, 0, 0, 0, 1, 1,
0.3409368, -1.530511, 3.215059, 0, 0, 0, 1, 1,
0.3524021, -0.6040711, 3.697332, 1, 1, 1, 1, 1,
0.3565567, 0.3177262, 1.075144, 1, 1, 1, 1, 1,
0.3623288, -1.463771, 2.964409, 1, 1, 1, 1, 1,
0.3630836, 0.3567413, 0.6250011, 1, 1, 1, 1, 1,
0.3728873, -1.586333, 2.475227, 1, 1, 1, 1, 1,
0.376952, 0.2489129, 1.1358, 1, 1, 1, 1, 1,
0.3773659, 0.1514172, 0.2568556, 1, 1, 1, 1, 1,
0.3827928, -0.2428178, 2.837232, 1, 1, 1, 1, 1,
0.391185, 0.0937148, 0.4872098, 1, 1, 1, 1, 1,
0.3988047, 0.0778882, 0.946246, 1, 1, 1, 1, 1,
0.4066183, -1.096096, 1.781899, 1, 1, 1, 1, 1,
0.4077367, 1.130659, -0.1628342, 1, 1, 1, 1, 1,
0.4146177, -0.7070317, 4.036004, 1, 1, 1, 1, 1,
0.4178803, -1.839602, 3.399219, 1, 1, 1, 1, 1,
0.4240828, 0.245314, -0.8680269, 1, 1, 1, 1, 1,
0.4258242, 1.420934, -0.5342973, 0, 0, 1, 1, 1,
0.4278397, -0.8145397, 2.96185, 1, 0, 0, 1, 1,
0.4302627, 0.1599902, 1.129267, 1, 0, 0, 1, 1,
0.4310578, 0.3406302, 0.7015669, 1, 0, 0, 1, 1,
0.434481, 0.577837, -0.8872711, 1, 0, 0, 1, 1,
0.4349656, 0.6910277, 3.082073, 1, 0, 0, 1, 1,
0.4364021, 1.798937, 0.4866189, 0, 0, 0, 1, 1,
0.4387362, -0.8815395, 1.800916, 0, 0, 0, 1, 1,
0.4390631, 1.101217, 0.04984612, 0, 0, 0, 1, 1,
0.4395251, 0.8101718, -0.2429922, 0, 0, 0, 1, 1,
0.4421555, -2.01448, 2.219182, 0, 0, 0, 1, 1,
0.4469075, -0.6181992, 1.904857, 0, 0, 0, 1, 1,
0.4486646, -1.26181, 3.472667, 0, 0, 0, 1, 1,
0.4525934, 0.5086036, -1.062417, 1, 1, 1, 1, 1,
0.4539227, -1.557642, 2.244151, 1, 1, 1, 1, 1,
0.4566842, -0.6999688, 3.12201, 1, 1, 1, 1, 1,
0.4576119, 0.6216421, -0.5586701, 1, 1, 1, 1, 1,
0.4633608, 1.253286, 0.8276139, 1, 1, 1, 1, 1,
0.4677214, 1.012408, 1.423719, 1, 1, 1, 1, 1,
0.4681767, -0.324418, 2.415327, 1, 1, 1, 1, 1,
0.4691157, 1.296621, 0.6657891, 1, 1, 1, 1, 1,
0.4698245, -0.144131, 0.2727051, 1, 1, 1, 1, 1,
0.4721834, 0.3186674, 1.110741, 1, 1, 1, 1, 1,
0.4731644, 0.3848581, 0.06670281, 1, 1, 1, 1, 1,
0.4768593, 0.07162456, -1.031599, 1, 1, 1, 1, 1,
0.4776051, -0.6618303, 1.994243, 1, 1, 1, 1, 1,
0.4815784, -0.4114282, 2.856872, 1, 1, 1, 1, 1,
0.4819978, 1.891715, 2.122432, 1, 1, 1, 1, 1,
0.4842975, -1.983707, 2.125622, 0, 0, 1, 1, 1,
0.4853926, -1.637532, 3.424625, 1, 0, 0, 1, 1,
0.4859562, 0.7150204, -0.1355945, 1, 0, 0, 1, 1,
0.4882259, -1.954456, 3.400204, 1, 0, 0, 1, 1,
0.4896278, -0.1163563, 2.656231, 1, 0, 0, 1, 1,
0.4921558, -0.03403595, 0.6048753, 1, 0, 0, 1, 1,
0.5042605, 1.892849, 0.02510793, 0, 0, 0, 1, 1,
0.5086979, 0.3871682, 1.200245, 0, 0, 0, 1, 1,
0.5092366, 0.6758416, 0.7114975, 0, 0, 0, 1, 1,
0.5130014, 0.209326, 1.314132, 0, 0, 0, 1, 1,
0.5137433, 0.03979474, 0.2989888, 0, 0, 0, 1, 1,
0.5182405, -1.030524, 1.977472, 0, 0, 0, 1, 1,
0.5188372, 0.1124631, 1.043767, 0, 0, 0, 1, 1,
0.5196868, -0.01103519, 1.757674, 1, 1, 1, 1, 1,
0.5287908, 1.022446, 2.203204, 1, 1, 1, 1, 1,
0.5298516, -2.039707, 2.374472, 1, 1, 1, 1, 1,
0.5335127, -0.3545631, 3.429397, 1, 1, 1, 1, 1,
0.5341299, -0.7190526, 3.573859, 1, 1, 1, 1, 1,
0.5360612, -0.5434282, 1.217217, 1, 1, 1, 1, 1,
0.5382326, 0.6610776, 1.284872, 1, 1, 1, 1, 1,
0.5416883, -0.7380728, 3.028888, 1, 1, 1, 1, 1,
0.5429218, -1.506863, 0.6693149, 1, 1, 1, 1, 1,
0.5485158, 0.7929839, 1.433926, 1, 1, 1, 1, 1,
0.5485176, -1.790573, 3.522614, 1, 1, 1, 1, 1,
0.5520716, 0.6496414, 0.5330016, 1, 1, 1, 1, 1,
0.5579457, -0.256231, 0.7702203, 1, 1, 1, 1, 1,
0.5587861, 0.9957972, -0.1672938, 1, 1, 1, 1, 1,
0.5617466, -0.06564122, 2.828752, 1, 1, 1, 1, 1,
0.5674099, 0.3019052, 1.403365, 0, 0, 1, 1, 1,
0.575264, 1.552173, 1.09654, 1, 0, 0, 1, 1,
0.5770066, -0.5962012, 3.740541, 1, 0, 0, 1, 1,
0.5771053, -0.05420062, 1.31994, 1, 0, 0, 1, 1,
0.5776736, 0.1801592, 1.478198, 1, 0, 0, 1, 1,
0.5788068, 1.68497, 1.523169, 1, 0, 0, 1, 1,
0.5845358, 0.1956606, 1.133746, 0, 0, 0, 1, 1,
0.5876992, 0.360129, 0.8486366, 0, 0, 0, 1, 1,
0.5885592, -0.3971646, 2.919616, 0, 0, 0, 1, 1,
0.5938271, 0.00701653, 1.194417, 0, 0, 0, 1, 1,
0.5992268, -0.8755644, 4.884287, 0, 0, 0, 1, 1,
0.601885, 1.138549, 0.6223647, 0, 0, 0, 1, 1,
0.6057904, 0.7048592, 0.1031369, 0, 0, 0, 1, 1,
0.6071265, -0.8086439, 3.545222, 1, 1, 1, 1, 1,
0.6080176, 0.7298762, 0.00168333, 1, 1, 1, 1, 1,
0.6105306, 0.1422575, 1.153427, 1, 1, 1, 1, 1,
0.6126139, -0.6422381, 2.471255, 1, 1, 1, 1, 1,
0.6142909, 0.9042181, 1.760194, 1, 1, 1, 1, 1,
0.6156773, -0.03927136, 2.029691, 1, 1, 1, 1, 1,
0.617237, 1.002936, 0.3387855, 1, 1, 1, 1, 1,
0.6255761, -0.03711482, 2.961216, 1, 1, 1, 1, 1,
0.6259883, 1.230792, -0.2578813, 1, 1, 1, 1, 1,
0.6287629, -0.5366203, 2.983073, 1, 1, 1, 1, 1,
0.6287791, 0.1042364, 1.812596, 1, 1, 1, 1, 1,
0.631652, 0.130846, 0.22329, 1, 1, 1, 1, 1,
0.6323599, 0.05941531, 0.08792581, 1, 1, 1, 1, 1,
0.6585974, 0.008819596, 2.403343, 1, 1, 1, 1, 1,
0.6611004, 1.128843, 0.2134052, 1, 1, 1, 1, 1,
0.6611968, -0.4579639, 1.73762, 0, 0, 1, 1, 1,
0.6627853, -0.2371377, 2.388954, 1, 0, 0, 1, 1,
0.6678038, 0.197684, 2.538455, 1, 0, 0, 1, 1,
0.6680224, -0.5347617, 3.693445, 1, 0, 0, 1, 1,
0.6718783, 1.076545, 1.426119, 1, 0, 0, 1, 1,
0.672977, -1.095459, 2.203614, 1, 0, 0, 1, 1,
0.6730509, 0.3021549, -1.162433, 0, 0, 0, 1, 1,
0.674084, 0.4765094, 1.29561, 0, 0, 0, 1, 1,
0.6832649, 1.340577, 1.221775, 0, 0, 0, 1, 1,
0.69451, -1.591886, 3.096327, 0, 0, 0, 1, 1,
0.7007595, -1.130557, 2.166366, 0, 0, 0, 1, 1,
0.7025351, -1.309229, 2.53043, 0, 0, 0, 1, 1,
0.70827, 2.681051, -0.5282192, 0, 0, 0, 1, 1,
0.7093605, 0.575601, 2.157593, 1, 1, 1, 1, 1,
0.709636, -1.866776, 0.5304891, 1, 1, 1, 1, 1,
0.7129553, 2.511753, -0.03505358, 1, 1, 1, 1, 1,
0.7170807, -2.409559, 2.589579, 1, 1, 1, 1, 1,
0.7174224, 0.7120485, 0.619379, 1, 1, 1, 1, 1,
0.7202699, -0.6362315, 0.3897443, 1, 1, 1, 1, 1,
0.7240443, -0.6850043, 3.827717, 1, 1, 1, 1, 1,
0.7240641, -0.515323, 2.651295, 1, 1, 1, 1, 1,
0.7279267, -0.1715519, 3.047244, 1, 1, 1, 1, 1,
0.7404076, 0.2265729, 1.467519, 1, 1, 1, 1, 1,
0.7455376, 0.105786, 0.01258375, 1, 1, 1, 1, 1,
0.7500629, 0.4942218, 0.09875232, 1, 1, 1, 1, 1,
0.7524205, -0.7971873, 2.883235, 1, 1, 1, 1, 1,
0.7525054, -1.834162, 2.786509, 1, 1, 1, 1, 1,
0.7537209, 1.66976, -0.3517036, 1, 1, 1, 1, 1,
0.7566802, 1.538957, 1.234564, 0, 0, 1, 1, 1,
0.7634701, 0.5094703, 0.9920659, 1, 0, 0, 1, 1,
0.764897, -0.5233648, -0.433647, 1, 0, 0, 1, 1,
0.7674123, -0.5169759, 1.716404, 1, 0, 0, 1, 1,
0.7718642, -0.7631266, 0.5642436, 1, 0, 0, 1, 1,
0.7838038, -0.8115689, 2.362948, 1, 0, 0, 1, 1,
0.7853599, 1.701402, 0.5150859, 0, 0, 0, 1, 1,
0.7946848, 0.7772211, 1.438987, 0, 0, 0, 1, 1,
0.7947389, 1.029946, -0.2798401, 0, 0, 0, 1, 1,
0.7953302, 0.6990229, 0.126284, 0, 0, 0, 1, 1,
0.797218, 0.3822505, -1.294427, 0, 0, 0, 1, 1,
0.7994059, 0.1053408, 0.09096331, 0, 0, 0, 1, 1,
0.8002986, -0.3811186, 2.483155, 0, 0, 0, 1, 1,
0.8005308, 0.7065043, -0.26485, 1, 1, 1, 1, 1,
0.8006824, 0.07287795, 1.059461, 1, 1, 1, 1, 1,
0.8089759, -1.254595, 2.646716, 1, 1, 1, 1, 1,
0.810141, -1.171954, 2.639706, 1, 1, 1, 1, 1,
0.8138288, 0.85074, 0.251658, 1, 1, 1, 1, 1,
0.8146175, -0.8051375, 1.946514, 1, 1, 1, 1, 1,
0.8161764, -0.7170141, 3.692834, 1, 1, 1, 1, 1,
0.8190525, 1.280043, -0.5380107, 1, 1, 1, 1, 1,
0.8208432, 0.9080288, -0.4388759, 1, 1, 1, 1, 1,
0.8209272, 1.285361, 1.275096, 1, 1, 1, 1, 1,
0.8219565, 0.7490848, 0.488124, 1, 1, 1, 1, 1,
0.8259951, -1.729133, 1.944407, 1, 1, 1, 1, 1,
0.8319944, 0.02913189, 0.8387718, 1, 1, 1, 1, 1,
0.8367355, 0.2710981, 0.1638315, 1, 1, 1, 1, 1,
0.8379891, 0.0768486, 1.754512, 1, 1, 1, 1, 1,
0.8382821, -0.1026254, 1.247055, 0, 0, 1, 1, 1,
0.8448923, 1.229309, 0.9192714, 1, 0, 0, 1, 1,
0.8523482, -0.4909294, 4.5983, 1, 0, 0, 1, 1,
0.8566983, -0.1596561, 1.63931, 1, 0, 0, 1, 1,
0.8633569, -0.5100484, 1.21256, 1, 0, 0, 1, 1,
0.8645516, 1.099559, -0.6275184, 1, 0, 0, 1, 1,
0.8668621, -0.5476617, 2.472159, 0, 0, 0, 1, 1,
0.867336, -0.3329774, 2.136351, 0, 0, 0, 1, 1,
0.8678294, 0.8382256, -0.9725179, 0, 0, 0, 1, 1,
0.8752468, 1.354467, 0.5717586, 0, 0, 0, 1, 1,
0.8762404, 0.8071998, 0.1370349, 0, 0, 0, 1, 1,
0.8789716, -0.6164226, 2.651026, 0, 0, 0, 1, 1,
0.892527, 1.424932, 0.1841918, 0, 0, 0, 1, 1,
0.8960919, 0.7646909, 1.24765, 1, 1, 1, 1, 1,
0.8983876, -0.4138145, 0.2536272, 1, 1, 1, 1, 1,
0.9078576, -0.3695473, 2.987001, 1, 1, 1, 1, 1,
0.9162524, 0.5986713, -0.2709062, 1, 1, 1, 1, 1,
0.9197981, -0.09411415, 0.2674702, 1, 1, 1, 1, 1,
0.930554, 0.793548, 0.5993527, 1, 1, 1, 1, 1,
0.9314229, -0.6329826, 1.239587, 1, 1, 1, 1, 1,
0.936966, 1.773353, 2.334769, 1, 1, 1, 1, 1,
0.9538809, 1.539135, 0.5146899, 1, 1, 1, 1, 1,
0.9563627, -1.745023, 1.832446, 1, 1, 1, 1, 1,
0.9585342, -0.9070528, 2.012497, 1, 1, 1, 1, 1,
0.9696795, -0.2716873, 1.556628, 1, 1, 1, 1, 1,
0.9799359, 0.2853709, 0.4053427, 1, 1, 1, 1, 1,
0.9814402, 0.3957884, 1.568497, 1, 1, 1, 1, 1,
0.9863674, 0.2891807, 1.26585, 1, 1, 1, 1, 1,
0.9875135, 0.424615, -0.5433316, 0, 0, 1, 1, 1,
0.9961226, -0.3902595, 2.224789, 1, 0, 0, 1, 1,
1.019835, 0.1250865, 0.3790748, 1, 0, 0, 1, 1,
1.03921, 1.568635, 0.5418742, 1, 0, 0, 1, 1,
1.041762, 1.972561, 0.6587316, 1, 0, 0, 1, 1,
1.045096, -1.709408, 2.154594, 1, 0, 0, 1, 1,
1.052413, 1.554523, -1.373118, 0, 0, 0, 1, 1,
1.054609, -0.2477584, 2.983355, 0, 0, 0, 1, 1,
1.057258, 1.252766, -2.05961, 0, 0, 0, 1, 1,
1.068726, 0.1405191, 0.9570458, 0, 0, 0, 1, 1,
1.080657, -0.4565399, 2.096479, 0, 0, 0, 1, 1,
1.084709, -0.1990177, 2.252759, 0, 0, 0, 1, 1,
1.085902, 0.4929377, 1.670641, 0, 0, 0, 1, 1,
1.096153, 0.6366814, 0.3616803, 1, 1, 1, 1, 1,
1.100683, -4.042758, 2.349626, 1, 1, 1, 1, 1,
1.104758, 0.3129034, 0.09012692, 1, 1, 1, 1, 1,
1.109149, 0.7139216, 1.501472, 1, 1, 1, 1, 1,
1.111662, 0.4527817, -0.8638772, 1, 1, 1, 1, 1,
1.111668, 0.3956606, 1.346046, 1, 1, 1, 1, 1,
1.119351, 0.5922828, 2.090931, 1, 1, 1, 1, 1,
1.123483, 0.4191619, 1.973495, 1, 1, 1, 1, 1,
1.127091, 1.121474, -0.4776767, 1, 1, 1, 1, 1,
1.140634, -0.3312644, 2.206137, 1, 1, 1, 1, 1,
1.151458, 0.4229553, 1.349911, 1, 1, 1, 1, 1,
1.153925, 1.039939, -0.2305713, 1, 1, 1, 1, 1,
1.1568, -1.253543, 2.94601, 1, 1, 1, 1, 1,
1.159294, 1.317193, 1.082773, 1, 1, 1, 1, 1,
1.163676, -0.4558619, 2.084778, 1, 1, 1, 1, 1,
1.171752, -1.112649, 2.429581, 0, 0, 1, 1, 1,
1.174609, -0.2943573, 1.841662, 1, 0, 0, 1, 1,
1.177501, 0.2965623, 1.355401, 1, 0, 0, 1, 1,
1.186066, -0.839325, 2.913102, 1, 0, 0, 1, 1,
1.193758, -0.7918763, 3.857973, 1, 0, 0, 1, 1,
1.194208, -0.7986577, 1.786829, 1, 0, 0, 1, 1,
1.214798, -0.9774656, 2.551867, 0, 0, 0, 1, 1,
1.22609, 0.2115941, 2.47081, 0, 0, 0, 1, 1,
1.241062, 1.106691, -0.08046781, 0, 0, 0, 1, 1,
1.243406, 1.250331, 0.823325, 0, 0, 0, 1, 1,
1.248133, 1.658579, -0.1320627, 0, 0, 0, 1, 1,
1.258568, -1.336845, 2.510664, 0, 0, 0, 1, 1,
1.261251, 0.9409072, 0.6434969, 0, 0, 0, 1, 1,
1.267024, -0.783744, 1.632069, 1, 1, 1, 1, 1,
1.272166, -1.012421, 3.167579, 1, 1, 1, 1, 1,
1.276277, 0.6189652, 1.781493, 1, 1, 1, 1, 1,
1.279669, 0.2386522, 2.023582, 1, 1, 1, 1, 1,
1.283585, 0.7253006, -0.284635, 1, 1, 1, 1, 1,
1.285411, -0.7614803, 2.370364, 1, 1, 1, 1, 1,
1.293991, -0.2955333, 3.072619, 1, 1, 1, 1, 1,
1.297546, 0.1605385, 0.1439062, 1, 1, 1, 1, 1,
1.302147, 0.136935, 2.317513, 1, 1, 1, 1, 1,
1.305486, -0.5403878, 1.10844, 1, 1, 1, 1, 1,
1.308156, 1.227067, 0.4257679, 1, 1, 1, 1, 1,
1.312778, -0.4544725, -0.01256057, 1, 1, 1, 1, 1,
1.31444, -1.175887, 4.166281, 1, 1, 1, 1, 1,
1.315236, -0.0564524, 0.3506788, 1, 1, 1, 1, 1,
1.317752, -0.6755193, 1.653935, 1, 1, 1, 1, 1,
1.322157, -0.4338088, 1.614296, 0, 0, 1, 1, 1,
1.322529, 1.850937, 1.151734, 1, 0, 0, 1, 1,
1.325706, -0.03564474, 0.4113991, 1, 0, 0, 1, 1,
1.328052, -0.7053887, 2.401351, 1, 0, 0, 1, 1,
1.329056, -0.2871653, 0.7828597, 1, 0, 0, 1, 1,
1.336593, -0.3642074, 3.304596, 1, 0, 0, 1, 1,
1.342759, -1.633041, 1.924548, 0, 0, 0, 1, 1,
1.343259, -0.4271923, 0.9894894, 0, 0, 0, 1, 1,
1.34516, 0.9649711, 2.282118, 0, 0, 0, 1, 1,
1.346589, -0.4046792, 1.453916, 0, 0, 0, 1, 1,
1.348231, -0.4344858, 1.928532, 0, 0, 0, 1, 1,
1.349831, -0.05510367, 3.494783, 0, 0, 0, 1, 1,
1.357763, -0.5234219, 0.4598512, 0, 0, 0, 1, 1,
1.360431, -0.06259252, 2.318253, 1, 1, 1, 1, 1,
1.372945, -0.1826703, 1.337956, 1, 1, 1, 1, 1,
1.376215, 0.8396763, 0.5471662, 1, 1, 1, 1, 1,
1.392388, 0.3133634, 2.192883, 1, 1, 1, 1, 1,
1.394729, -0.05924346, 2.291248, 1, 1, 1, 1, 1,
1.400159, 0.09579863, 2.448251, 1, 1, 1, 1, 1,
1.40024, 1.015405, 0.04298972, 1, 1, 1, 1, 1,
1.407533, 1.145086, 1.301132, 1, 1, 1, 1, 1,
1.409159, -0.318171, -0.395024, 1, 1, 1, 1, 1,
1.410203, -1.085027, 2.174104, 1, 1, 1, 1, 1,
1.427299, -1.270223, 2.682125, 1, 1, 1, 1, 1,
1.436956, 0.6492377, -0.1022057, 1, 1, 1, 1, 1,
1.451279, 0.2571132, 2.219053, 1, 1, 1, 1, 1,
1.452975, 1.047069, 1.408649, 1, 1, 1, 1, 1,
1.458515, -0.7777984, 2.992426, 1, 1, 1, 1, 1,
1.464145, 1.985749, 0.7209384, 0, 0, 1, 1, 1,
1.46836, 0.7630677, 3.198115, 1, 0, 0, 1, 1,
1.473803, -1.096292, 1.244914, 1, 0, 0, 1, 1,
1.475475, 0.1117484, 0.5011218, 1, 0, 0, 1, 1,
1.483992, -0.1309665, 2.418026, 1, 0, 0, 1, 1,
1.485118, 1.492559, 1.360129, 1, 0, 0, 1, 1,
1.485968, 0.3880751, 0.2195102, 0, 0, 0, 1, 1,
1.490825, -0.5541387, 1.596355, 0, 0, 0, 1, 1,
1.493996, -0.2047493, 3.388229, 0, 0, 0, 1, 1,
1.514515, -1.447706, 0.6896823, 0, 0, 0, 1, 1,
1.514608, 0.03841282, 2.709457, 0, 0, 0, 1, 1,
1.528154, -1.362485, 2.276446, 0, 0, 0, 1, 1,
1.529013, 0.8682126, -0.2829585, 0, 0, 0, 1, 1,
1.533494, -0.715174, 3.163539, 1, 1, 1, 1, 1,
1.543778, -0.2876159, 2.408014, 1, 1, 1, 1, 1,
1.55029, -0.3301193, 3.910173, 1, 1, 1, 1, 1,
1.559067, 0.4332546, 0.088944, 1, 1, 1, 1, 1,
1.572167, 1.593171, 1.212318, 1, 1, 1, 1, 1,
1.575284, -0.4511537, 3.265164, 1, 1, 1, 1, 1,
1.592027, -1.112475, 2.598352, 1, 1, 1, 1, 1,
1.618821, -0.1482973, 2.561351, 1, 1, 1, 1, 1,
1.645363, -2.687965, 2.504622, 1, 1, 1, 1, 1,
1.649683, -1.469834, 1.798268, 1, 1, 1, 1, 1,
1.66308, -1.225183, 2.693637, 1, 1, 1, 1, 1,
1.669383, -0.4738078, 1.892432, 1, 1, 1, 1, 1,
1.673149, 1.534651, -1.078844, 1, 1, 1, 1, 1,
1.675964, -0.9220448, 2.837957, 1, 1, 1, 1, 1,
1.687454, 2.345355, -0.2044307, 1, 1, 1, 1, 1,
1.697771, 1.277923, 0.09505212, 0, 0, 1, 1, 1,
1.69789, -0.958716, 3.85136, 1, 0, 0, 1, 1,
1.698645, 0.2269119, 1.676203, 1, 0, 0, 1, 1,
1.70721, 0.6146148, 1.133809, 1, 0, 0, 1, 1,
1.70866, 0.01196194, 2.271093, 1, 0, 0, 1, 1,
1.735446, -1.509812, 2.989354, 1, 0, 0, 1, 1,
1.746947, 1.285518, 1.735325, 0, 0, 0, 1, 1,
1.753378, -0.6661282, 1.322474, 0, 0, 0, 1, 1,
1.756209, -0.4944202, 3.47216, 0, 0, 0, 1, 1,
1.762675, 0.4824803, 1.711691, 0, 0, 0, 1, 1,
1.774304, 0.49119, 1.160723, 0, 0, 0, 1, 1,
1.798978, -0.5866766, 2.324663, 0, 0, 0, 1, 1,
1.799579, 1.174104, 1.345534, 0, 0, 0, 1, 1,
1.853188, -0.2756085, 0.7341973, 1, 1, 1, 1, 1,
1.856297, 0.2313015, 2.494802, 1, 1, 1, 1, 1,
1.898381, 1.266277, 0.7087228, 1, 1, 1, 1, 1,
1.905359, 0.0001103048, 1.6348, 1, 1, 1, 1, 1,
1.914371, -0.4230427, 1.840536, 1, 1, 1, 1, 1,
1.927089, 1.169861, 0.6479251, 1, 1, 1, 1, 1,
1.929722, 0.3941805, -0.4050775, 1, 1, 1, 1, 1,
1.937706, 0.5631042, 1.006829, 1, 1, 1, 1, 1,
1.947584, -0.2770019, 1.868829, 1, 1, 1, 1, 1,
1.961143, 1.0764, 2.949239, 1, 1, 1, 1, 1,
1.968078, -0.5485604, 2.582204, 1, 1, 1, 1, 1,
2.012646, 0.659916, 0.903326, 1, 1, 1, 1, 1,
2.046238, 0.2053143, 0.842037, 1, 1, 1, 1, 1,
2.067081, -0.0254539, 2.182948, 1, 1, 1, 1, 1,
2.075841, 2.256962, 0.8976825, 1, 1, 1, 1, 1,
2.091961, 0.2400104, 1.547243, 0, 0, 1, 1, 1,
2.099029, 1.585468, 0.9905442, 1, 0, 0, 1, 1,
2.132175, 0.8529744, -0.03968246, 1, 0, 0, 1, 1,
2.221049, 0.5730682, 0.9941031, 1, 0, 0, 1, 1,
2.264354, 0.158853, 2.322696, 1, 0, 0, 1, 1,
2.270431, -0.2363534, 1.500175, 1, 0, 0, 1, 1,
2.30959, 1.207256, 0.1707792, 0, 0, 0, 1, 1,
2.357526, 1.001284, 0.3537254, 0, 0, 0, 1, 1,
2.390103, -1.928462, 4.471861, 0, 0, 0, 1, 1,
2.430588, -0.2728711, 1.026652, 0, 0, 0, 1, 1,
2.484886, 0.408104, 0.9111661, 0, 0, 0, 1, 1,
2.504598, 0.6050147, 3.35917, 0, 0, 0, 1, 1,
2.513789, -0.7426468, 2.289271, 0, 0, 0, 1, 1,
2.536239, 2.177105, 1.444616, 1, 1, 1, 1, 1,
2.602803, -0.03875472, 0.5101422, 1, 1, 1, 1, 1,
2.659909, 2.079568, 0.4291058, 1, 1, 1, 1, 1,
2.693069, 0.403976, 0.9862589, 1, 1, 1, 1, 1,
2.717308, -0.7078297, 0.6670132, 1, 1, 1, 1, 1,
2.717999, -1.710722, 1.648221, 1, 1, 1, 1, 1,
3.244863, 0.3366733, 1.790788, 1, 1, 1, 1, 1
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
var radius = 9.900932;
var distance = 34.77661;
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
mvMatrix.translate( 0.1333013, 0.6808535, 0.6030755 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.77661);
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