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
-3.537272, 0.4666135, -0.1516443, 1, 0, 0, 1,
-3.363928, 1.651988, -2.932934, 1, 0.007843138, 0, 1,
-2.959189, 0.4914104, -0.8101854, 1, 0.01176471, 0, 1,
-2.95918, 0.9590098, 1.633495, 1, 0.01960784, 0, 1,
-2.946233, 0.7521272, 0.1969145, 1, 0.02352941, 0, 1,
-2.887035, -1.147763, -2.248462, 1, 0.03137255, 0, 1,
-2.864191, -0.2479707, -0.125803, 1, 0.03529412, 0, 1,
-2.652952, 0.1749938, -1.312168, 1, 0.04313726, 0, 1,
-2.455567, 1.284318, -0.2675813, 1, 0.04705882, 0, 1,
-2.425251, -1.195159, -0.960942, 1, 0.05490196, 0, 1,
-2.41114, 0.5714183, 0.8096466, 1, 0.05882353, 0, 1,
-2.387514, 0.09931094, -1.067036, 1, 0.06666667, 0, 1,
-2.324015, -2.597609, -1.13369, 1, 0.07058824, 0, 1,
-2.319403, -0.1608133, -2.215159, 1, 0.07843138, 0, 1,
-2.294558, -0.09478731, -1.266304, 1, 0.08235294, 0, 1,
-2.284403, 0.4334915, -1.759338, 1, 0.09019608, 0, 1,
-2.220461, -0.2901527, -1.31056, 1, 0.09411765, 0, 1,
-2.184324, 0.6453155, -1.183145, 1, 0.1019608, 0, 1,
-2.134216, -2.20208, -2.964596, 1, 0.1098039, 0, 1,
-2.12954, -0.8234779, -2.585164, 1, 0.1137255, 0, 1,
-2.099562, -0.5194813, -2.065552, 1, 0.1215686, 0, 1,
-2.077705, -0.2297862, -0.535135, 1, 0.1254902, 0, 1,
-2.063588, 0.4062138, -2.355596, 1, 0.1333333, 0, 1,
-2.001327, 0.764726, -0.9710563, 1, 0.1372549, 0, 1,
-1.991529, -0.3290298, -0.130271, 1, 0.145098, 0, 1,
-1.982386, -1.275975, -2.17292, 1, 0.1490196, 0, 1,
-1.952564, 0.1277896, -2.609923, 1, 0.1568628, 0, 1,
-1.941597, -0.7606238, -3.015423, 1, 0.1607843, 0, 1,
-1.885355, -0.6451516, -3.281291, 1, 0.1686275, 0, 1,
-1.874919, 1.250745, -0.828703, 1, 0.172549, 0, 1,
-1.871118, 0.752199, -2.615515, 1, 0.1803922, 0, 1,
-1.854478, 2.219037, -0.3132305, 1, 0.1843137, 0, 1,
-1.784051, -0.9658001, -1.486502, 1, 0.1921569, 0, 1,
-1.777307, 0.07714935, -1.401546, 1, 0.1960784, 0, 1,
-1.771472, -1.512632, -1.120925, 1, 0.2039216, 0, 1,
-1.760775, -0.04589107, -1.327237, 1, 0.2117647, 0, 1,
-1.760467, -0.4079549, -2.248529, 1, 0.2156863, 0, 1,
-1.748317, -0.299468, -2.447399, 1, 0.2235294, 0, 1,
-1.728835, -0.7825834, -4.363968, 1, 0.227451, 0, 1,
-1.714167, 0.1579371, -1.371602, 1, 0.2352941, 0, 1,
-1.695261, 0.6878434, -1.731926, 1, 0.2392157, 0, 1,
-1.68451, 1.392687, -1.653809, 1, 0.2470588, 0, 1,
-1.676145, 1.570829, -1.743966, 1, 0.2509804, 0, 1,
-1.675385, 0.01256496, 0.08118209, 1, 0.2588235, 0, 1,
-1.666651, 0.3261729, -1.553698, 1, 0.2627451, 0, 1,
-1.655701, 1.93442, -0.3933534, 1, 0.2705882, 0, 1,
-1.651468, -1.704639, -2.210984, 1, 0.2745098, 0, 1,
-1.645463, 1.714122, -0.9260716, 1, 0.282353, 0, 1,
-1.639496, -0.06856132, -0.6454847, 1, 0.2862745, 0, 1,
-1.638259, -0.45585, -1.933888, 1, 0.2941177, 0, 1,
-1.630951, -0.957039, -0.9370924, 1, 0.3019608, 0, 1,
-1.624049, 0.6175479, -1.85523, 1, 0.3058824, 0, 1,
-1.619858, 0.2631814, -0.9643657, 1, 0.3137255, 0, 1,
-1.613011, 0.2276799, -3.392417, 1, 0.3176471, 0, 1,
-1.600769, -0.5255054, -3.038527, 1, 0.3254902, 0, 1,
-1.59733, 1.295146, 0.1004634, 1, 0.3294118, 0, 1,
-1.593902, -0.09314005, -2.491873, 1, 0.3372549, 0, 1,
-1.570676, -0.09767253, -2.212917, 1, 0.3411765, 0, 1,
-1.563611, 0.1842722, -0.6635679, 1, 0.3490196, 0, 1,
-1.562201, 1.83959, -0.7244968, 1, 0.3529412, 0, 1,
-1.559768, -0.6414977, -1.846025, 1, 0.3607843, 0, 1,
-1.557348, 2.526335, -0.4450797, 1, 0.3647059, 0, 1,
-1.553517, 1.581262, -1.487841, 1, 0.372549, 0, 1,
-1.534255, 0.5163028, 1.363774, 1, 0.3764706, 0, 1,
-1.51719, -0.2133088, -0.7357185, 1, 0.3843137, 0, 1,
-1.51571, -1.191082, -2.552104, 1, 0.3882353, 0, 1,
-1.515361, -0.9174397, -2.498615, 1, 0.3960784, 0, 1,
-1.514592, 0.008591178, -3.10223, 1, 0.4039216, 0, 1,
-1.514276, -0.7492104, -1.660295, 1, 0.4078431, 0, 1,
-1.5068, -0.2552015, -2.133222, 1, 0.4156863, 0, 1,
-1.496961, -1.707548, -2.453278, 1, 0.4196078, 0, 1,
-1.494617, 1.235037, 0.5412046, 1, 0.427451, 0, 1,
-1.47229, 1.961129, -0.3656543, 1, 0.4313726, 0, 1,
-1.470958, -0.1046972, -1.560403, 1, 0.4392157, 0, 1,
-1.469555, -0.2467932, -0.8082141, 1, 0.4431373, 0, 1,
-1.468712, -2.315147, -2.24589, 1, 0.4509804, 0, 1,
-1.467263, 1.498619, -0.05678973, 1, 0.454902, 0, 1,
-1.466237, -1.224384, -2.908454, 1, 0.4627451, 0, 1,
-1.459008, -0.03955499, -3.474381, 1, 0.4666667, 0, 1,
-1.444228, 0.1415664, -3.524525, 1, 0.4745098, 0, 1,
-1.412617, -1.160952, -2.428378, 1, 0.4784314, 0, 1,
-1.411009, 0.06554226, -1.862309, 1, 0.4862745, 0, 1,
-1.409707, 0.07262507, -2.315486, 1, 0.4901961, 0, 1,
-1.404644, -1.279051, -1.626827, 1, 0.4980392, 0, 1,
-1.398117, -2.019152, -3.079906, 1, 0.5058824, 0, 1,
-1.396176, -1.280334, -0.9707242, 1, 0.509804, 0, 1,
-1.393327, -0.3314138, -1.855202, 1, 0.5176471, 0, 1,
-1.391184, 0.282344, -1.836508, 1, 0.5215687, 0, 1,
-1.381864, -0.5744815, -2.380152, 1, 0.5294118, 0, 1,
-1.378474, -1.448984, -1.971683, 1, 0.5333334, 0, 1,
-1.369837, -1.158053, -2.291099, 1, 0.5411765, 0, 1,
-1.352041, 2.056436, 0.6377248, 1, 0.5450981, 0, 1,
-1.351751, 2.652018, -1.574591, 1, 0.5529412, 0, 1,
-1.337808, -0.2641576, -3.638039, 1, 0.5568628, 0, 1,
-1.337567, -0.8909079, -2.060011, 1, 0.5647059, 0, 1,
-1.336615, -1.272262, -3.326529, 1, 0.5686275, 0, 1,
-1.334702, 1.617548, 0.8942701, 1, 0.5764706, 0, 1,
-1.303807, 0.05114903, -1.010516, 1, 0.5803922, 0, 1,
-1.291233, -0.2966401, -3.011387, 1, 0.5882353, 0, 1,
-1.285652, -0.8539194, -2.048549, 1, 0.5921569, 0, 1,
-1.25677, 0.5813914, -0.8770734, 1, 0.6, 0, 1,
-1.252562, -1.135074, -4.369683, 1, 0.6078432, 0, 1,
-1.251383, 1.343741, -0.823077, 1, 0.6117647, 0, 1,
-1.245568, 1.330112, -0.2388728, 1, 0.6196079, 0, 1,
-1.225222, -1.08335, -3.132503, 1, 0.6235294, 0, 1,
-1.221446, 0.4100886, -1.904848, 1, 0.6313726, 0, 1,
-1.216031, 0.1747681, -0.4718003, 1, 0.6352941, 0, 1,
-1.21267, -0.8979568, -1.754815, 1, 0.6431373, 0, 1,
-1.209538, 0.4451108, -1.921112, 1, 0.6470588, 0, 1,
-1.1993, 0.01754338, -1.038136, 1, 0.654902, 0, 1,
-1.194096, 0.1417722, -0.307045, 1, 0.6588235, 0, 1,
-1.183579, 0.7633417, -0.5560781, 1, 0.6666667, 0, 1,
-1.182775, 0.9051113, -1.68862, 1, 0.6705883, 0, 1,
-1.160732, -0.6104703, -4.31315, 1, 0.6784314, 0, 1,
-1.152736, 0.4412925, -2.617468, 1, 0.682353, 0, 1,
-1.143217, -0.513359, -2.233978, 1, 0.6901961, 0, 1,
-1.120597, -0.2519991, -1.033164, 1, 0.6941177, 0, 1,
-1.119291, -0.9316197, -2.723649, 1, 0.7019608, 0, 1,
-1.118837, -0.5193058, -2.396118, 1, 0.7098039, 0, 1,
-1.117495, 1.869438, -1.032659, 1, 0.7137255, 0, 1,
-1.117012, 0.1984269, -1.239302, 1, 0.7215686, 0, 1,
-1.116749, -0.05393699, -0.1483998, 1, 0.7254902, 0, 1,
-1.116384, -0.3278097, -3.034136, 1, 0.7333333, 0, 1,
-1.115317, 0.5579183, -1.563309, 1, 0.7372549, 0, 1,
-1.112604, -0.05525235, -1.826369, 1, 0.7450981, 0, 1,
-1.106486, 1.059058, -1.079453, 1, 0.7490196, 0, 1,
-1.104605, 0.6977444, -1.355925, 1, 0.7568628, 0, 1,
-1.104242, -2.852765, -1.886027, 1, 0.7607843, 0, 1,
-1.103815, -1.20675, -1.735385, 1, 0.7686275, 0, 1,
-1.099334, -1.380338, -1.62602, 1, 0.772549, 0, 1,
-1.098543, 1.00186, -1.640649, 1, 0.7803922, 0, 1,
-1.094912, 1.427311, 0.3167777, 1, 0.7843137, 0, 1,
-1.090411, -0.986852, -2.292806, 1, 0.7921569, 0, 1,
-1.087199, 2.638665, -0.06082363, 1, 0.7960784, 0, 1,
-1.079952, 0.6973335, 0.3775706, 1, 0.8039216, 0, 1,
-1.048221, 0.5613842, -2.659693, 1, 0.8117647, 0, 1,
-1.042185, -0.5342541, -0.8088424, 1, 0.8156863, 0, 1,
-1.037234, -1.044868, -1.784193, 1, 0.8235294, 0, 1,
-1.022192, -1.072924, -1.963382, 1, 0.827451, 0, 1,
-1.01593, 0.6674815, -0.6510361, 1, 0.8352941, 0, 1,
-1.006547, -0.7860887, -2.750272, 1, 0.8392157, 0, 1,
-1.00225, 0.1123464, -0.9766403, 1, 0.8470588, 0, 1,
-1.001847, -0.33904, -3.581436, 1, 0.8509804, 0, 1,
-0.9996262, 1.091503, 0.2316034, 1, 0.8588235, 0, 1,
-0.9864832, -1.01078, -3.729302, 1, 0.8627451, 0, 1,
-0.9843388, -0.8242519, -1.910786, 1, 0.8705882, 0, 1,
-0.9837721, 0.9740653, -0.6028791, 1, 0.8745098, 0, 1,
-0.9724098, -0.9559331, -1.645477, 1, 0.8823529, 0, 1,
-0.9692755, 0.2453535, -1.034016, 1, 0.8862745, 0, 1,
-0.9670545, -0.01983016, -2.007982, 1, 0.8941177, 0, 1,
-0.9521159, -1.150656, -2.932094, 1, 0.8980392, 0, 1,
-0.9498564, -2.058948, -1.979674, 1, 0.9058824, 0, 1,
-0.9456673, 1.218706, -0.6419098, 1, 0.9137255, 0, 1,
-0.9448861, 0.3274958, -0.07147104, 1, 0.9176471, 0, 1,
-0.9388532, 0.7193052, -0.5537278, 1, 0.9254902, 0, 1,
-0.9380048, 0.7940586, -1.529559, 1, 0.9294118, 0, 1,
-0.9329926, 1.952725, 0.5907347, 1, 0.9372549, 0, 1,
-0.9289513, 0.2438297, -0.8729017, 1, 0.9411765, 0, 1,
-0.9261742, 0.1225176, -2.383562, 1, 0.9490196, 0, 1,
-0.9253821, -1.395499, -2.3431, 1, 0.9529412, 0, 1,
-0.9218729, -0.5431335, -2.71346, 1, 0.9607843, 0, 1,
-0.9173046, -0.432371, -2.794919, 1, 0.9647059, 0, 1,
-0.9140327, -1.079206, -2.116861, 1, 0.972549, 0, 1,
-0.9099366, -1.068165, -3.081562, 1, 0.9764706, 0, 1,
-0.901351, 0.1844166, -2.389881, 1, 0.9843137, 0, 1,
-0.8992015, 0.4688561, -0.6069923, 1, 0.9882353, 0, 1,
-0.8979326, 0.273699, -1.822061, 1, 0.9960784, 0, 1,
-0.8836934, 1.398167, -1.406258, 0.9960784, 1, 0, 1,
-0.8800547, 0.2374702, -1.287176, 0.9921569, 1, 0, 1,
-0.8776242, -1.042628, -1.208841, 0.9843137, 1, 0, 1,
-0.8766361, 1.40787, -0.9022676, 0.9803922, 1, 0, 1,
-0.8745273, 1.055515, 0.3749195, 0.972549, 1, 0, 1,
-0.864199, 1.207287, -1.810804, 0.9686275, 1, 0, 1,
-0.8615152, -0.8309311, -1.037776, 0.9607843, 1, 0, 1,
-0.8603583, -1.114531, -0.7639123, 0.9568627, 1, 0, 1,
-0.8599296, -0.002831334, -2.318137, 0.9490196, 1, 0, 1,
-0.8571155, -0.3718405, -2.973027, 0.945098, 1, 0, 1,
-0.8538204, -0.04268467, -1.271096, 0.9372549, 1, 0, 1,
-0.8468163, -0.08583378, -1.422457, 0.9333333, 1, 0, 1,
-0.8447535, -0.3187691, 0.2631665, 0.9254902, 1, 0, 1,
-0.8397082, -0.8291646, -1.567885, 0.9215686, 1, 0, 1,
-0.8331312, -2.191108, -4.616797, 0.9137255, 1, 0, 1,
-0.8250332, -1.588236, -2.355001, 0.9098039, 1, 0, 1,
-0.8229133, -0.6001221, -0.9314361, 0.9019608, 1, 0, 1,
-0.8174436, 0.1003336, -2.03213, 0.8941177, 1, 0, 1,
-0.8173042, 0.1505028, -0.4563568, 0.8901961, 1, 0, 1,
-0.8121471, -0.2872555, -2.493834, 0.8823529, 1, 0, 1,
-0.7968648, -0.797573, -1.772834, 0.8784314, 1, 0, 1,
-0.7961112, 0.5450616, -1.420833, 0.8705882, 1, 0, 1,
-0.7951708, -0.6540455, -0.6238944, 0.8666667, 1, 0, 1,
-0.7934126, 0.02982032, -1.271734, 0.8588235, 1, 0, 1,
-0.7928283, -0.9793968, -2.154145, 0.854902, 1, 0, 1,
-0.7881511, 0.5151457, -0.3747157, 0.8470588, 1, 0, 1,
-0.7878219, -0.8215035, -3.75954, 0.8431373, 1, 0, 1,
-0.7876713, -0.2812473, -2.219735, 0.8352941, 1, 0, 1,
-0.7800448, -0.2454259, -0.777225, 0.8313726, 1, 0, 1,
-0.7799391, -2.448499, -3.574512, 0.8235294, 1, 0, 1,
-0.7777119, 0.1815899, -0.8303163, 0.8196079, 1, 0, 1,
-0.7761704, -0.2660868, -2.422461, 0.8117647, 1, 0, 1,
-0.7735369, -0.4849609, -2.783896, 0.8078431, 1, 0, 1,
-0.7666562, 0.4320322, -0.6704613, 0.8, 1, 0, 1,
-0.7665156, 0.3087569, -2.065978, 0.7921569, 1, 0, 1,
-0.7530481, -0.51068, -1.529387, 0.7882353, 1, 0, 1,
-0.744643, 0.6219441, -0.3896762, 0.7803922, 1, 0, 1,
-0.7443609, -0.8551702, -3.931453, 0.7764706, 1, 0, 1,
-0.7440913, 0.35097, 0.4205652, 0.7686275, 1, 0, 1,
-0.7418836, -0.372956, -0.890972, 0.7647059, 1, 0, 1,
-0.7381384, 1.203626, 0.8891803, 0.7568628, 1, 0, 1,
-0.7367227, 0.6448985, -1.567701, 0.7529412, 1, 0, 1,
-0.7267039, 0.774739, -0.9815465, 0.7450981, 1, 0, 1,
-0.723996, -0.8568186, -1.972244, 0.7411765, 1, 0, 1,
-0.710939, 2.027778, -0.3187604, 0.7333333, 1, 0, 1,
-0.7063634, -0.4433688, -2.841665, 0.7294118, 1, 0, 1,
-0.7014287, -0.04999101, -0.4541542, 0.7215686, 1, 0, 1,
-0.6996306, 0.4997671, 1.070821, 0.7176471, 1, 0, 1,
-0.6996188, -0.03539439, -2.136626, 0.7098039, 1, 0, 1,
-0.6938915, 0.2262687, -0.8634695, 0.7058824, 1, 0, 1,
-0.6916443, 1.572471, -0.5712821, 0.6980392, 1, 0, 1,
-0.6901404, -1.904427, -3.11656, 0.6901961, 1, 0, 1,
-0.6874222, -0.4810362, -0.3420517, 0.6862745, 1, 0, 1,
-0.6834498, -0.6475847, -3.7321, 0.6784314, 1, 0, 1,
-0.6824381, 0.4857763, -1.575354, 0.6745098, 1, 0, 1,
-0.67919, 0.2053089, 0.3449091, 0.6666667, 1, 0, 1,
-0.6774231, 1.341747, 0.2768408, 0.6627451, 1, 0, 1,
-0.6766166, 0.1586701, -1.210324, 0.654902, 1, 0, 1,
-0.6758719, 0.03826552, -0.1900665, 0.6509804, 1, 0, 1,
-0.6723172, 1.385521, -1.678771, 0.6431373, 1, 0, 1,
-0.6609582, -1.667401, -3.040522, 0.6392157, 1, 0, 1,
-0.6606628, -0.94397, -2.245037, 0.6313726, 1, 0, 1,
-0.6600478, -0.3305545, -1.891005, 0.627451, 1, 0, 1,
-0.6571655, 0.3131736, -1.75955, 0.6196079, 1, 0, 1,
-0.6540524, 1.520851, -0.7585536, 0.6156863, 1, 0, 1,
-0.6472701, 0.5892447, -0.6911898, 0.6078432, 1, 0, 1,
-0.642611, 0.07136969, -1.301661, 0.6039216, 1, 0, 1,
-0.6399062, -1.397065, -3.473478, 0.5960785, 1, 0, 1,
-0.6368221, -0.1726312, -2.689176, 0.5882353, 1, 0, 1,
-0.6338536, -0.4321232, -2.76779, 0.5843138, 1, 0, 1,
-0.6314275, 2.592045, -0.6257626, 0.5764706, 1, 0, 1,
-0.6310633, 0.6436066, -0.2372437, 0.572549, 1, 0, 1,
-0.6148275, -3.0065, -3.854925, 0.5647059, 1, 0, 1,
-0.6140259, 0.4178255, -1.622085, 0.5607843, 1, 0, 1,
-0.6076291, 0.6923217, -0.5829697, 0.5529412, 1, 0, 1,
-0.6063622, 0.7592096, 1.191901, 0.5490196, 1, 0, 1,
-0.6058563, 1.302111, -0.1136252, 0.5411765, 1, 0, 1,
-0.6043123, -0.004424929, -1.065143, 0.5372549, 1, 0, 1,
-0.6005856, 0.04665124, 0.995285, 0.5294118, 1, 0, 1,
-0.5948824, 1.178438, -2.433112, 0.5254902, 1, 0, 1,
-0.5941139, -1.191851, -1.298185, 0.5176471, 1, 0, 1,
-0.5938459, 0.2098584, -1.211002, 0.5137255, 1, 0, 1,
-0.5902342, 0.3726339, 0.09144206, 0.5058824, 1, 0, 1,
-0.5799826, -0.3499923, -0.9135644, 0.5019608, 1, 0, 1,
-0.5689031, 1.125072, 0.3372455, 0.4941176, 1, 0, 1,
-0.5683187, -1.070183, -2.831117, 0.4862745, 1, 0, 1,
-0.5676706, 0.6211528, -0.556622, 0.4823529, 1, 0, 1,
-0.5670491, 0.7144606, -0.9761853, 0.4745098, 1, 0, 1,
-0.5669066, 0.7197114, -2.579825, 0.4705882, 1, 0, 1,
-0.5645541, 1.484017, -1.048726, 0.4627451, 1, 0, 1,
-0.5589224, -0.1039997, -2.42075, 0.4588235, 1, 0, 1,
-0.5531992, -0.9655998, -2.814885, 0.4509804, 1, 0, 1,
-0.5529599, -0.3729469, -1.475141, 0.4470588, 1, 0, 1,
-0.5525993, -0.5716212, -3.381434, 0.4392157, 1, 0, 1,
-0.551375, -2.211892, -3.133206, 0.4352941, 1, 0, 1,
-0.549038, 0.8686336, -3.073908, 0.427451, 1, 0, 1,
-0.5488186, -1.047856, -2.425196, 0.4235294, 1, 0, 1,
-0.5467275, 2.201772, -0.1410006, 0.4156863, 1, 0, 1,
-0.5458558, 0.3953702, 0.2941802, 0.4117647, 1, 0, 1,
-0.5436541, -2.240263, -2.575323, 0.4039216, 1, 0, 1,
-0.5403607, 1.418279, -1.431288, 0.3960784, 1, 0, 1,
-0.5390776, -0.1417152, -0.9587312, 0.3921569, 1, 0, 1,
-0.5387756, 0.2454371, -2.508564, 0.3843137, 1, 0, 1,
-0.538057, -0.1977143, -2.363436, 0.3803922, 1, 0, 1,
-0.5320832, 1.047046, -0.9888417, 0.372549, 1, 0, 1,
-0.5305141, 1.347365, -1.602817, 0.3686275, 1, 0, 1,
-0.5300998, -2.204238, -1.926015, 0.3607843, 1, 0, 1,
-0.5266996, -0.1308881, -1.571079, 0.3568628, 1, 0, 1,
-0.5247411, -0.6597798, -3.975658, 0.3490196, 1, 0, 1,
-0.522931, -1.247153, -1.849015, 0.345098, 1, 0, 1,
-0.5217934, 0.3805245, -2.512562, 0.3372549, 1, 0, 1,
-0.5213839, -0.558991, -3.527081, 0.3333333, 1, 0, 1,
-0.5174194, 1.001848, -1.123549, 0.3254902, 1, 0, 1,
-0.5164837, -0.1288063, -0.5478666, 0.3215686, 1, 0, 1,
-0.515379, -0.8268903, -2.896981, 0.3137255, 1, 0, 1,
-0.5147851, 1.613342, -0.9896742, 0.3098039, 1, 0, 1,
-0.5097566, 0.6650808, -0.4786309, 0.3019608, 1, 0, 1,
-0.5077931, 0.6337108, -1.305089, 0.2941177, 1, 0, 1,
-0.501526, 0.3043976, -0.9442232, 0.2901961, 1, 0, 1,
-0.491677, -0.8591228, -3.066566, 0.282353, 1, 0, 1,
-0.4864823, 1.35974, -1.653594, 0.2784314, 1, 0, 1,
-0.4863079, 0.6325595, -0.4635995, 0.2705882, 1, 0, 1,
-0.4820212, 0.6784286, -1.195444, 0.2666667, 1, 0, 1,
-0.4812751, -1.124948, -1.704688, 0.2588235, 1, 0, 1,
-0.47463, 0.2105509, -2.131673, 0.254902, 1, 0, 1,
-0.4684072, -0.7763443, -2.578977, 0.2470588, 1, 0, 1,
-0.4683995, -0.9419342, -0.8764997, 0.2431373, 1, 0, 1,
-0.4673211, 0.4711247, -0.7797567, 0.2352941, 1, 0, 1,
-0.4604637, 0.2533398, -0.8516064, 0.2313726, 1, 0, 1,
-0.4570299, 0.2031565, -0.3827895, 0.2235294, 1, 0, 1,
-0.4552048, -1.259857, -2.629732, 0.2196078, 1, 0, 1,
-0.4510719, -1.215411, -2.284273, 0.2117647, 1, 0, 1,
-0.4489566, 1.100244, -0.8269767, 0.2078431, 1, 0, 1,
-0.4488112, 0.6902563, -0.1293763, 0.2, 1, 0, 1,
-0.4482617, -0.1686635, -1.136738, 0.1921569, 1, 0, 1,
-0.4431016, -1.175462, -2.971116, 0.1882353, 1, 0, 1,
-0.4415281, 0.3222629, -0.7437159, 0.1803922, 1, 0, 1,
-0.4405295, -1.039182, -1.126876, 0.1764706, 1, 0, 1,
-0.4402459, -0.1621931, 0.3882289, 0.1686275, 1, 0, 1,
-0.4361931, -1.193114, -3.345165, 0.1647059, 1, 0, 1,
-0.4314799, -0.06541795, -1.637174, 0.1568628, 1, 0, 1,
-0.4304768, -0.4038644, -5.086648, 0.1529412, 1, 0, 1,
-0.4266887, -1.864922, -3.014269, 0.145098, 1, 0, 1,
-0.4266541, 1.003266, 0.6049359, 0.1411765, 1, 0, 1,
-0.4228695, -1.486199, -1.844614, 0.1333333, 1, 0, 1,
-0.4206646, 2.329011, -0.3926796, 0.1294118, 1, 0, 1,
-0.4083027, -0.6486434, -3.266426, 0.1215686, 1, 0, 1,
-0.4052204, 0.1824213, 0.1674912, 0.1176471, 1, 0, 1,
-0.3983703, 0.5298411, -0.8317966, 0.1098039, 1, 0, 1,
-0.3973997, -0.6059046, -2.607616, 0.1058824, 1, 0, 1,
-0.3950529, -0.3105437, -4.043959, 0.09803922, 1, 0, 1,
-0.3921809, -0.07326122, -2.394317, 0.09019608, 1, 0, 1,
-0.3919856, -0.03398795, -0.7288643, 0.08627451, 1, 0, 1,
-0.3905235, 0.06516536, -1.338239, 0.07843138, 1, 0, 1,
-0.3870586, -1.894731, -4.090906, 0.07450981, 1, 0, 1,
-0.387055, -0.608052, -2.092651, 0.06666667, 1, 0, 1,
-0.3867555, -0.9245284, -2.276263, 0.0627451, 1, 0, 1,
-0.3859849, -0.08164386, -1.948089, 0.05490196, 1, 0, 1,
-0.3793247, -1.902405, -2.505428, 0.05098039, 1, 0, 1,
-0.3739888, 0.7980887, -0.3242413, 0.04313726, 1, 0, 1,
-0.3734319, 1.453621, -0.07869368, 0.03921569, 1, 0, 1,
-0.3710342, -0.8349095, -4.339614, 0.03137255, 1, 0, 1,
-0.3620054, -0.3385877, -2.526373, 0.02745098, 1, 0, 1,
-0.3607449, 0.8073737, -0.6056518, 0.01960784, 1, 0, 1,
-0.3570939, -0.9281389, -3.358246, 0.01568628, 1, 0, 1,
-0.3554078, -0.6803769, -2.110471, 0.007843138, 1, 0, 1,
-0.3549242, -0.02844585, -0.7252296, 0.003921569, 1, 0, 1,
-0.3508331, 0.3301268, -0.6396171, 0, 1, 0.003921569, 1,
-0.349531, -2.31093, -3.868283, 0, 1, 0.01176471, 1,
-0.3400967, 0.8543716, 0.6828911, 0, 1, 0.01568628, 1,
-0.339729, 0.9239347, -1.160487, 0, 1, 0.02352941, 1,
-0.3337719, -0.8330322, -2.753059, 0, 1, 0.02745098, 1,
-0.330308, 0.2239584, -0.9222736, 0, 1, 0.03529412, 1,
-0.3288341, 0.7435421, -1.330413, 0, 1, 0.03921569, 1,
-0.3217407, -0.8619952, -2.449234, 0, 1, 0.04705882, 1,
-0.3205259, -0.212235, -2.842939, 0, 1, 0.05098039, 1,
-0.316294, -1.804527, -3.647971, 0, 1, 0.05882353, 1,
-0.3143171, 0.06934106, -0.6598608, 0, 1, 0.0627451, 1,
-0.3015188, 0.2278104, -1.575694, 0, 1, 0.07058824, 1,
-0.2967364, 1.793138, 1.410623, 0, 1, 0.07450981, 1,
-0.296205, -1.069391, -2.737732, 0, 1, 0.08235294, 1,
-0.2936093, 0.03364422, -2.355926, 0, 1, 0.08627451, 1,
-0.2925951, -0.7567356, -2.327408, 0, 1, 0.09411765, 1,
-0.2905311, 0.4044658, -0.1892847, 0, 1, 0.1019608, 1,
-0.2893115, 1.072775, -0.169633, 0, 1, 0.1058824, 1,
-0.287455, -1.374512, -0.7413795, 0, 1, 0.1137255, 1,
-0.2839929, 1.941637, 0.5923406, 0, 1, 0.1176471, 1,
-0.2824005, -0.6439914, -5.053793, 0, 1, 0.1254902, 1,
-0.2785696, -0.241818, -1.813344, 0, 1, 0.1294118, 1,
-0.2778208, -0.3948917, -3.56635, 0, 1, 0.1372549, 1,
-0.2759117, 0.003233928, -4.033923, 0, 1, 0.1411765, 1,
-0.2758889, -0.08499149, -2.465096, 0, 1, 0.1490196, 1,
-0.2739229, -0.3084773, -3.373483, 0, 1, 0.1529412, 1,
-0.2722817, 0.7528228, 1.362344, 0, 1, 0.1607843, 1,
-0.2719121, 0.5029155, -0.8195734, 0, 1, 0.1647059, 1,
-0.2647415, 0.5149351, -0.6490483, 0, 1, 0.172549, 1,
-0.2645822, 0.01102742, -2.133303, 0, 1, 0.1764706, 1,
-0.2556181, 0.2004456, -0.748054, 0, 1, 0.1843137, 1,
-0.2538996, -0.1067369, -1.973409, 0, 1, 0.1882353, 1,
-0.2529094, 1.430931, 0.6054987, 0, 1, 0.1960784, 1,
-0.2514699, 0.4256695, -0.2162598, 0, 1, 0.2039216, 1,
-0.2440503, -0.5006577, -1.613351, 0, 1, 0.2078431, 1,
-0.2401264, 0.8837609, -0.3334982, 0, 1, 0.2156863, 1,
-0.2383448, -0.4631968, -1.850035, 0, 1, 0.2196078, 1,
-0.2320719, 0.9712224, 1.245324, 0, 1, 0.227451, 1,
-0.2233751, 0.1320137, -1.24829, 0, 1, 0.2313726, 1,
-0.2139174, 0.3265125, 0.5448784, 0, 1, 0.2392157, 1,
-0.2131643, -0.3557265, -3.142282, 0, 1, 0.2431373, 1,
-0.2113718, 0.04075349, -0.9826636, 0, 1, 0.2509804, 1,
-0.2071579, 0.09738357, -0.2033821, 0, 1, 0.254902, 1,
-0.2069967, -1.336223, -4.443894, 0, 1, 0.2627451, 1,
-0.203206, 1.104269, 0.8243173, 0, 1, 0.2666667, 1,
-0.202975, 1.48725, 0.106536, 0, 1, 0.2745098, 1,
-0.2026821, 1.096758, -0.6012794, 0, 1, 0.2784314, 1,
-0.2003963, -0.7127661, -5.399276, 0, 1, 0.2862745, 1,
-0.199546, 0.3110246, -1.077064, 0, 1, 0.2901961, 1,
-0.1976195, 0.2359441, -2.417264, 0, 1, 0.2980392, 1,
-0.1944995, -0.625605, -3.249087, 0, 1, 0.3058824, 1,
-0.1932231, -0.8778956, -3.304882, 0, 1, 0.3098039, 1,
-0.1912718, 0.7830186, 1.054617, 0, 1, 0.3176471, 1,
-0.1910166, -0.8978425, -2.627485, 0, 1, 0.3215686, 1,
-0.188932, 0.009076732, -2.253394, 0, 1, 0.3294118, 1,
-0.1803642, 1.269664, 1.376976, 0, 1, 0.3333333, 1,
-0.175829, 0.07577761, -0.4353914, 0, 1, 0.3411765, 1,
-0.1746925, -1.052366, -1.295189, 0, 1, 0.345098, 1,
-0.1737903, 0.003261769, -2.624471, 0, 1, 0.3529412, 1,
-0.1726312, -1.256166, -2.763361, 0, 1, 0.3568628, 1,
-0.1669832, 0.3580792, -0.7792217, 0, 1, 0.3647059, 1,
-0.1665985, -1.594469, -2.258277, 0, 1, 0.3686275, 1,
-0.1652831, -0.8208213, -2.434967, 0, 1, 0.3764706, 1,
-0.1648253, 0.002157741, -2.54845, 0, 1, 0.3803922, 1,
-0.1629966, 0.006260345, -1.575779, 0, 1, 0.3882353, 1,
-0.1629704, -0.218468, -2.440165, 0, 1, 0.3921569, 1,
-0.1628579, 0.8693049, -1.378921, 0, 1, 0.4, 1,
-0.1627306, 1.039597, 1.27656, 0, 1, 0.4078431, 1,
-0.1620489, 0.7530156, 0.2730871, 0, 1, 0.4117647, 1,
-0.1601878, -0.5949295, -2.048656, 0, 1, 0.4196078, 1,
-0.1506371, -1.089439, -3.257676, 0, 1, 0.4235294, 1,
-0.1503413, 0.4653473, -0.4968241, 0, 1, 0.4313726, 1,
-0.1501995, 0.05938132, 0.5933483, 0, 1, 0.4352941, 1,
-0.1489554, 1.136568, 0.07753358, 0, 1, 0.4431373, 1,
-0.1480145, -0.2156115, -3.277433, 0, 1, 0.4470588, 1,
-0.1479382, 1.85667, -0.2656782, 0, 1, 0.454902, 1,
-0.1408154, 0.2877374, -0.1243828, 0, 1, 0.4588235, 1,
-0.1400346, -1.594787, -2.92845, 0, 1, 0.4666667, 1,
-0.1379793, 1.641984, 1.153275, 0, 1, 0.4705882, 1,
-0.133678, 0.03166441, -1.845719, 0, 1, 0.4784314, 1,
-0.1316779, 2.05549, -0.3512746, 0, 1, 0.4823529, 1,
-0.1287138, -1.749779, -4.150193, 0, 1, 0.4901961, 1,
-0.1286487, -0.9826895, -4.245594, 0, 1, 0.4941176, 1,
-0.1276476, -2.122731, -2.131325, 0, 1, 0.5019608, 1,
-0.1269172, 0.1106281, 0.9111466, 0, 1, 0.509804, 1,
-0.1231861, 1.158961, -0.9750187, 0, 1, 0.5137255, 1,
-0.1166017, -0.2975968, -2.288707, 0, 1, 0.5215687, 1,
-0.1045087, -1.302523, -3.584267, 0, 1, 0.5254902, 1,
-0.1042159, 0.6994745, 0.3270073, 0, 1, 0.5333334, 1,
-0.1030035, -0.8393012, -3.518271, 0, 1, 0.5372549, 1,
-0.09888701, -1.017679, -3.051373, 0, 1, 0.5450981, 1,
-0.08993768, 0.4448772, 0.5477659, 0, 1, 0.5490196, 1,
-0.08865581, -0.4502678, -3.55108, 0, 1, 0.5568628, 1,
-0.08806001, 0.665384, -1.003197, 0, 1, 0.5607843, 1,
-0.08773184, -0.8056679, -3.26623, 0, 1, 0.5686275, 1,
-0.08503034, -0.826972, -3.194237, 0, 1, 0.572549, 1,
-0.08147938, 0.8631192, 0.205983, 0, 1, 0.5803922, 1,
-0.0787295, 1.445002, 1.519524, 0, 1, 0.5843138, 1,
-0.07814103, 0.3652362, 0.4650322, 0, 1, 0.5921569, 1,
-0.07684553, -1.137623, -3.205518, 0, 1, 0.5960785, 1,
-0.07369038, 0.08509601, 0.09246369, 0, 1, 0.6039216, 1,
-0.07360312, -0.31089, -2.779803, 0, 1, 0.6117647, 1,
-0.07298604, 1.027064, -0.3764504, 0, 1, 0.6156863, 1,
-0.07156779, 0.6731231, 0.2701989, 0, 1, 0.6235294, 1,
-0.07144641, -0.1942421, -1.975846, 0, 1, 0.627451, 1,
-0.07076543, 0.7018399, 0.808556, 0, 1, 0.6352941, 1,
-0.06907624, -0.4164652, -2.475132, 0, 1, 0.6392157, 1,
-0.0671468, -0.2335332, -2.711953, 0, 1, 0.6470588, 1,
-0.05787972, 2.18263, -1.466969, 0, 1, 0.6509804, 1,
-0.05755128, -1.119762, -2.446453, 0, 1, 0.6588235, 1,
-0.05597821, -0.6046386, -3.301742, 0, 1, 0.6627451, 1,
-0.05518377, 0.4063235, 0.7123806, 0, 1, 0.6705883, 1,
-0.053596, 1.127048, 0.5370554, 0, 1, 0.6745098, 1,
-0.0365385, 1.166706, -0.390225, 0, 1, 0.682353, 1,
-0.0359372, 0.2338181, 0.9101357, 0, 1, 0.6862745, 1,
-0.03483832, -0.5178028, -2.542468, 0, 1, 0.6941177, 1,
-0.03317611, 0.804414, -0.002644992, 0, 1, 0.7019608, 1,
-0.03070853, -0.4220078, -2.213267, 0, 1, 0.7058824, 1,
-0.02532906, 1.974748, 0.6843657, 0, 1, 0.7137255, 1,
-0.02129314, -1.349292, -4.64759, 0, 1, 0.7176471, 1,
-0.020756, 0.1593724, 1.326606, 0, 1, 0.7254902, 1,
-0.01843265, 0.3485186, 0.6841168, 0, 1, 0.7294118, 1,
-0.01786449, -0.05307414, -4.388094, 0, 1, 0.7372549, 1,
-0.01664569, -0.8296615, -1.9122, 0, 1, 0.7411765, 1,
-0.01596269, 0.5253872, -0.361041, 0, 1, 0.7490196, 1,
-0.0116109, 0.490134, -0.5912436, 0, 1, 0.7529412, 1,
-0.009375536, 0.6866989, 1.209526, 0, 1, 0.7607843, 1,
-0.005974873, -0.6723725, -3.982283, 0, 1, 0.7647059, 1,
-0.003426561, 0.09271552, -1.331423, 0, 1, 0.772549, 1,
0.0009007534, -1.078448, 1.87679, 0, 1, 0.7764706, 1,
0.004305809, -0.8185274, 2.448092, 0, 1, 0.7843137, 1,
0.005853024, -1.517071, 4.325119, 0, 1, 0.7882353, 1,
0.00919605, 0.04069405, -0.5785043, 0, 1, 0.7960784, 1,
0.01282536, -0.4697212, 3.286817, 0, 1, 0.8039216, 1,
0.01432394, 0.2335115, -0.6023977, 0, 1, 0.8078431, 1,
0.01491266, -0.326287, 3.180238, 0, 1, 0.8156863, 1,
0.01817194, -2.065388, 3.443849, 0, 1, 0.8196079, 1,
0.01986263, 0.8121258, 0.6733604, 0, 1, 0.827451, 1,
0.02425387, 0.1372982, -1.000738, 0, 1, 0.8313726, 1,
0.02806808, -1.083288, 2.909733, 0, 1, 0.8392157, 1,
0.02856807, -0.5124335, 3.754963, 0, 1, 0.8431373, 1,
0.03546018, 0.2581508, -0.7920783, 0, 1, 0.8509804, 1,
0.03558034, 0.5360446, 1.22647, 0, 1, 0.854902, 1,
0.04140471, -1.441517, 2.151538, 0, 1, 0.8627451, 1,
0.04658497, 0.02752277, -1.22631, 0, 1, 0.8666667, 1,
0.0498099, 0.6278766, 0.4177855, 0, 1, 0.8745098, 1,
0.05182732, -0.3725942, 2.549568, 0, 1, 0.8784314, 1,
0.05254447, -0.8224913, 2.372365, 0, 1, 0.8862745, 1,
0.05320697, -0.2847499, 2.046994, 0, 1, 0.8901961, 1,
0.05680556, -0.02293042, 1.752018, 0, 1, 0.8980392, 1,
0.05990138, 0.7450839, 0.1180191, 0, 1, 0.9058824, 1,
0.06018146, 1.780447, 0.4478356, 0, 1, 0.9098039, 1,
0.06125436, -1.818133, 2.845541, 0, 1, 0.9176471, 1,
0.06352204, -0.4450204, 3.804029, 0, 1, 0.9215686, 1,
0.06504986, 0.2858814, 1.044997, 0, 1, 0.9294118, 1,
0.07063131, -1.592773, 1.85465, 0, 1, 0.9333333, 1,
0.07131067, 0.5047309, 0.5613425, 0, 1, 0.9411765, 1,
0.07727093, -1.012538, 4.579044, 0, 1, 0.945098, 1,
0.07906364, 0.925992, 0.6729432, 0, 1, 0.9529412, 1,
0.07957589, 0.02838055, 0.295789, 0, 1, 0.9568627, 1,
0.08679388, 0.4949442, -2.562426, 0, 1, 0.9647059, 1,
0.09251558, 1.581556, -0.1333771, 0, 1, 0.9686275, 1,
0.09266315, -0.7931213, 4.00582, 0, 1, 0.9764706, 1,
0.09496288, -1.727357, 3.407759, 0, 1, 0.9803922, 1,
0.09519538, -1.602134, 3.015108, 0, 1, 0.9882353, 1,
0.1003168, -0.4826892, 1.307506, 0, 1, 0.9921569, 1,
0.1006979, 0.7079753, -0.506231, 0, 1, 1, 1,
0.1065168, 0.9265398, -0.0831584, 0, 0.9921569, 1, 1,
0.1076519, -2.042385, 0.905183, 0, 0.9882353, 1, 1,
0.1139798, -0.275841, 0.363702, 0, 0.9803922, 1, 1,
0.1194274, -0.2474649, 3.631651, 0, 0.9764706, 1, 1,
0.1220583, 2.233378, -1.688003, 0, 0.9686275, 1, 1,
0.1264075, -1.059649, 2.929353, 0, 0.9647059, 1, 1,
0.1276785, -0.5631754, 1.815811, 0, 0.9568627, 1, 1,
0.1318643, 1.084139, 1.23029, 0, 0.9529412, 1, 1,
0.1318702, -1.691836, 3.110223, 0, 0.945098, 1, 1,
0.1334493, -0.9051406, 2.731797, 0, 0.9411765, 1, 1,
0.1344248, 0.04619868, 1.180059, 0, 0.9333333, 1, 1,
0.137742, -0.949168, 3.536251, 0, 0.9294118, 1, 1,
0.1381836, 1.036329, 1.034216, 0, 0.9215686, 1, 1,
0.1383767, 1.046548, 0.6038985, 0, 0.9176471, 1, 1,
0.1405592, 1.159959, -0.8785931, 0, 0.9098039, 1, 1,
0.1452889, 1.360932, 0.6644474, 0, 0.9058824, 1, 1,
0.1485, 0.2794548, 1.042137, 0, 0.8980392, 1, 1,
0.1493303, -0.1932456, 1.400343, 0, 0.8901961, 1, 1,
0.1535404, 0.8222826, -0.5259057, 0, 0.8862745, 1, 1,
0.1567921, 0.5198089, 1.271641, 0, 0.8784314, 1, 1,
0.1587538, 0.5718213, 0.1947124, 0, 0.8745098, 1, 1,
0.1596637, 0.3984447, 0.8114299, 0, 0.8666667, 1, 1,
0.1622539, 1.265625, -0.6015747, 0, 0.8627451, 1, 1,
0.1646393, 0.4621472, -0.3514724, 0, 0.854902, 1, 1,
0.1669892, 0.9895149, 0.1970914, 0, 0.8509804, 1, 1,
0.1674545, -0.219989, 2.741696, 0, 0.8431373, 1, 1,
0.1698025, 0.09429673, -0.03584107, 0, 0.8392157, 1, 1,
0.1698397, -0.7289004, 2.483271, 0, 0.8313726, 1, 1,
0.1700089, -0.3359627, 4.058273, 0, 0.827451, 1, 1,
0.1726495, 0.1911699, 0.3718511, 0, 0.8196079, 1, 1,
0.1731344, -0.9183152, 3.748819, 0, 0.8156863, 1, 1,
0.1740787, 1.375502, 0.3910902, 0, 0.8078431, 1, 1,
0.175478, 0.6936073, 1.581491, 0, 0.8039216, 1, 1,
0.1767756, -0.00655289, 0.2775101, 0, 0.7960784, 1, 1,
0.1770891, 1.160701, -0.2124212, 0, 0.7882353, 1, 1,
0.1776791, -0.9114401, 2.068245, 0, 0.7843137, 1, 1,
0.1799131, -1.321639, 3.049198, 0, 0.7764706, 1, 1,
0.1802107, -1.57266, 3.442483, 0, 0.772549, 1, 1,
0.1802317, -0.2863535, 0.5169809, 0, 0.7647059, 1, 1,
0.1911353, 1.131189, -0.3563821, 0, 0.7607843, 1, 1,
0.1912531, 0.04312891, 0.7157096, 0, 0.7529412, 1, 1,
0.1934308, 1.081858, -0.3169935, 0, 0.7490196, 1, 1,
0.1960396, -0.8682971, 2.897898, 0, 0.7411765, 1, 1,
0.1970704, -0.8845051, 3.69059, 0, 0.7372549, 1, 1,
0.1978043, -0.655081, 2.016879, 0, 0.7294118, 1, 1,
0.1986223, 2.206782, 0.4852597, 0, 0.7254902, 1, 1,
0.1996391, -0.5015511, 2.903778, 0, 0.7176471, 1, 1,
0.2047199, 0.3855781, 1.072002, 0, 0.7137255, 1, 1,
0.2069692, 0.3341914, 1.613363, 0, 0.7058824, 1, 1,
0.2073578, 0.6730638, -0.1387961, 0, 0.6980392, 1, 1,
0.2103521, 0.2454861, 2.514759, 0, 0.6941177, 1, 1,
0.2104291, -0.02226685, 3.250446, 0, 0.6862745, 1, 1,
0.2121038, 0.4954911, 0.5228255, 0, 0.682353, 1, 1,
0.2157692, 0.7964851, 1.226789, 0, 0.6745098, 1, 1,
0.2172123, 0.5546888, 0.4586999, 0, 0.6705883, 1, 1,
0.2248867, -0.3560281, 3.858591, 0, 0.6627451, 1, 1,
0.2268224, 1.130683, 0.529987, 0, 0.6588235, 1, 1,
0.2325562, 0.6735553, -0.1865414, 0, 0.6509804, 1, 1,
0.2336722, -0.07292825, 0.743692, 0, 0.6470588, 1, 1,
0.2380716, 0.3041293, 1.081197, 0, 0.6392157, 1, 1,
0.2395211, -0.4993367, 2.708594, 0, 0.6352941, 1, 1,
0.244073, 0.053444, 1.50939, 0, 0.627451, 1, 1,
0.2446515, -1.310331, 2.097725, 0, 0.6235294, 1, 1,
0.2467677, -0.1609698, 2.249636, 0, 0.6156863, 1, 1,
0.2607683, -2.393992, 3.038139, 0, 0.6117647, 1, 1,
0.262982, -0.6640208, 3.457715, 0, 0.6039216, 1, 1,
0.2639863, 1.47112, 2.342657, 0, 0.5960785, 1, 1,
0.2659938, 1.834626, 0.2066128, 0, 0.5921569, 1, 1,
0.2686785, 0.2922612, -0.02175558, 0, 0.5843138, 1, 1,
0.2711796, -0.3331862, 1.277113, 0, 0.5803922, 1, 1,
0.2727911, 1.026027, 1.542658, 0, 0.572549, 1, 1,
0.2747949, -0.0355017, 0.9413294, 0, 0.5686275, 1, 1,
0.2767272, 0.14031, -0.1453796, 0, 0.5607843, 1, 1,
0.2767675, 0.2392168, 1.08368, 0, 0.5568628, 1, 1,
0.2803285, -1.590748, 2.25675, 0, 0.5490196, 1, 1,
0.2815657, -1.431758, 1.479774, 0, 0.5450981, 1, 1,
0.2816764, 1.04537, 1.792227, 0, 0.5372549, 1, 1,
0.2830895, -0.6990975, 2.416549, 0, 0.5333334, 1, 1,
0.2838374, 0.3536897, 0.5136144, 0, 0.5254902, 1, 1,
0.287818, -1.641915, 3.150785, 0, 0.5215687, 1, 1,
0.2878765, -0.5178999, 2.241532, 0, 0.5137255, 1, 1,
0.2887706, 0.3570454, 0.8495296, 0, 0.509804, 1, 1,
0.2899456, 0.8717349, 0.5235432, 0, 0.5019608, 1, 1,
0.2915181, 0.4739344, -0.7275558, 0, 0.4941176, 1, 1,
0.2958081, -0.2614658, -0.7891641, 0, 0.4901961, 1, 1,
0.2959942, 0.964292, 0.9070781, 0, 0.4823529, 1, 1,
0.2990014, 0.337571, -0.1206056, 0, 0.4784314, 1, 1,
0.2992635, 1.757617, 0.4564994, 0, 0.4705882, 1, 1,
0.3037066, 0.4656214, 2.030785, 0, 0.4666667, 1, 1,
0.3048863, -1.826238, 4.122595, 0, 0.4588235, 1, 1,
0.3075066, -1.124678, 2.995571, 0, 0.454902, 1, 1,
0.3179669, 0.08379108, 1.022403, 0, 0.4470588, 1, 1,
0.3197997, 1.104784, 1.554389, 0, 0.4431373, 1, 1,
0.3271055, -1.759124, 3.187952, 0, 0.4352941, 1, 1,
0.330094, 2.218215, 1.113232, 0, 0.4313726, 1, 1,
0.330503, 2.589405, 0.8246093, 0, 0.4235294, 1, 1,
0.333989, 0.565003, 0.463475, 0, 0.4196078, 1, 1,
0.3390035, -0.6211625, 1.389288, 0, 0.4117647, 1, 1,
0.3476083, 1.036546, 0.08369062, 0, 0.4078431, 1, 1,
0.3553202, 0.5183871, 1.414553, 0, 0.4, 1, 1,
0.3556249, -1.510695, 1.243868, 0, 0.3921569, 1, 1,
0.3593855, -0.001488765, 1.575891, 0, 0.3882353, 1, 1,
0.3607484, 0.5770618, 1.297249, 0, 0.3803922, 1, 1,
0.3625638, -0.2538627, 3.244328, 0, 0.3764706, 1, 1,
0.3626581, -0.735491, 1.603415, 0, 0.3686275, 1, 1,
0.3649204, -0.2734988, 1.804211, 0, 0.3647059, 1, 1,
0.3666737, -0.9603623, 1.69417, 0, 0.3568628, 1, 1,
0.3692763, -0.3929636, 2.161907, 0, 0.3529412, 1, 1,
0.3713469, 0.005571843, 2.550807, 0, 0.345098, 1, 1,
0.3721365, -0.3255617, 2.768129, 0, 0.3411765, 1, 1,
0.3768786, 1.005774, 0.4359041, 0, 0.3333333, 1, 1,
0.377297, -0.7376136, 1.379963, 0, 0.3294118, 1, 1,
0.3794996, 0.2914126, 1.212974, 0, 0.3215686, 1, 1,
0.3814616, 0.1534021, 0.6345518, 0, 0.3176471, 1, 1,
0.3853618, 0.2311401, 2.080731, 0, 0.3098039, 1, 1,
0.3862547, 1.275671, -0.365061, 0, 0.3058824, 1, 1,
0.3884158, -0.9512182, 2.974451, 0, 0.2980392, 1, 1,
0.3949958, -0.2639371, 0.7267545, 0, 0.2901961, 1, 1,
0.3966977, 1.619539, -0.2909616, 0, 0.2862745, 1, 1,
0.398435, 0.9500734, 1.198687, 0, 0.2784314, 1, 1,
0.4026732, -0.3262127, 4.956871, 0, 0.2745098, 1, 1,
0.4032522, -1.116817, 3.706702, 0, 0.2666667, 1, 1,
0.4033559, 0.4166878, -0.1011378, 0, 0.2627451, 1, 1,
0.4041111, 0.3068972, 0.6681744, 0, 0.254902, 1, 1,
0.4041912, 2.157158, 2.056782, 0, 0.2509804, 1, 1,
0.404962, -0.1912159, 0.8724759, 0, 0.2431373, 1, 1,
0.4063617, -1.789165, 2.104957, 0, 0.2392157, 1, 1,
0.4078426, 1.036426, 0.6817706, 0, 0.2313726, 1, 1,
0.4085517, -0.88915, 2.313798, 0, 0.227451, 1, 1,
0.4112897, -0.7791026, 2.458281, 0, 0.2196078, 1, 1,
0.4114397, -0.01495922, 1.301467, 0, 0.2156863, 1, 1,
0.4116736, -0.4408854, 3.858235, 0, 0.2078431, 1, 1,
0.4138793, -0.3767311, 1.682532, 0, 0.2039216, 1, 1,
0.4176067, -0.2688798, 3.860671, 0, 0.1960784, 1, 1,
0.4181471, -0.3818355, 2.519172, 0, 0.1882353, 1, 1,
0.4201311, -2.842008, 3.105857, 0, 0.1843137, 1, 1,
0.4244054, -0.5091437, 3.246533, 0, 0.1764706, 1, 1,
0.4249218, -0.5975422, 3.051975, 0, 0.172549, 1, 1,
0.4263559, 0.2787669, 1.114203, 0, 0.1647059, 1, 1,
0.4273094, 0.100116, 0.2884153, 0, 0.1607843, 1, 1,
0.4276324, 1.200476, 0.210905, 0, 0.1529412, 1, 1,
0.4295922, -0.5905573, 2.049387, 0, 0.1490196, 1, 1,
0.4336175, 0.2900029, 1.730357, 0, 0.1411765, 1, 1,
0.434732, -0.8097272, 4.573915, 0, 0.1372549, 1, 1,
0.4382365, -0.5210853, 1.869831, 0, 0.1294118, 1, 1,
0.4446568, 0.8278387, -0.9555306, 0, 0.1254902, 1, 1,
0.4454952, 0.4569222, -1.800838, 0, 0.1176471, 1, 1,
0.4469663, -0.2523592, 2.155731, 0, 0.1137255, 1, 1,
0.4478883, 0.16355, 0.7097386, 0, 0.1058824, 1, 1,
0.4495697, -1.119451, 1.877968, 0, 0.09803922, 1, 1,
0.4521296, 0.1102453, 1.838802, 0, 0.09411765, 1, 1,
0.4546453, -0.825841, 2.955616, 0, 0.08627451, 1, 1,
0.4558692, -0.7793006, 1.724316, 0, 0.08235294, 1, 1,
0.4602339, -0.105217, 1.728984, 0, 0.07450981, 1, 1,
0.4639288, 1.293314, 0.1347854, 0, 0.07058824, 1, 1,
0.4674415, -0.1394092, 1.591332, 0, 0.0627451, 1, 1,
0.4679717, 1.307209, 0.6486356, 0, 0.05882353, 1, 1,
0.4701805, 1.181319, 0.1310275, 0, 0.05098039, 1, 1,
0.4725032, -1.25897, 2.609296, 0, 0.04705882, 1, 1,
0.4775924, 0.7690302, 0.8315594, 0, 0.03921569, 1, 1,
0.4778311, -0.191035, 2.605575, 0, 0.03529412, 1, 1,
0.479661, -0.5783825, 2.29288, 0, 0.02745098, 1, 1,
0.4798189, 2.299504, 0.5007246, 0, 0.02352941, 1, 1,
0.4811928, -1.942258, 2.658787, 0, 0.01568628, 1, 1,
0.4823601, 0.413922, 1.265212, 0, 0.01176471, 1, 1,
0.482913, -0.8376408, 3.980232, 0, 0.003921569, 1, 1,
0.4851542, 0.135156, 1.824219, 0.003921569, 0, 1, 1,
0.48731, 0.8121653, 0.5994746, 0.007843138, 0, 1, 1,
0.4887031, 1.965108, -0.01846578, 0.01568628, 0, 1, 1,
0.4917922, -2.380068, 3.26272, 0.01960784, 0, 1, 1,
0.4918253, -0.03460302, 2.525285, 0.02745098, 0, 1, 1,
0.4974456, -0.01438197, 1.493012, 0.03137255, 0, 1, 1,
0.5005915, 1.414318, -0.6908124, 0.03921569, 0, 1, 1,
0.5101112, -0.144486, 2.015445, 0.04313726, 0, 1, 1,
0.5128102, 0.762301, -0.5230503, 0.05098039, 0, 1, 1,
0.5180922, 1.392643, -0.01012319, 0.05490196, 0, 1, 1,
0.5218799, -0.7992745, 1.616646, 0.0627451, 0, 1, 1,
0.5219281, 1.357534, 0.4731072, 0.06666667, 0, 1, 1,
0.5225249, -0.6730696, 2.251313, 0.07450981, 0, 1, 1,
0.5245317, -1.744163, 1.902647, 0.07843138, 0, 1, 1,
0.5246903, -1.005406, 3.498829, 0.08627451, 0, 1, 1,
0.5345333, -0.5063236, 1.088081, 0.09019608, 0, 1, 1,
0.5354768, -0.8896203, 3.58043, 0.09803922, 0, 1, 1,
0.5481298, 1.318932, 1.130215, 0.1058824, 0, 1, 1,
0.5483887, 0.7830657, 0.6065159, 0.1098039, 0, 1, 1,
0.5499081, -1.458978, 2.934202, 0.1176471, 0, 1, 1,
0.5597444, 0.553444, 2.116878, 0.1215686, 0, 1, 1,
0.5616685, 0.2901234, 1.172485, 0.1294118, 0, 1, 1,
0.5631115, 0.2805235, 1.175602, 0.1333333, 0, 1, 1,
0.5670142, 0.2689005, 0.6049618, 0.1411765, 0, 1, 1,
0.5675496, -0.1310598, 1.480888, 0.145098, 0, 1, 1,
0.5680826, 1.953473, 0.02450446, 0.1529412, 0, 1, 1,
0.5704076, 0.7342308, -0.3094662, 0.1568628, 0, 1, 1,
0.5751634, -0.9167048, 1.836438, 0.1647059, 0, 1, 1,
0.5773832, -0.2332366, 1.801449, 0.1686275, 0, 1, 1,
0.5782019, -0.6408107, 1.968449, 0.1764706, 0, 1, 1,
0.5790959, 0.01523309, 1.450875, 0.1803922, 0, 1, 1,
0.5814496, 1.327526, -0.7746295, 0.1882353, 0, 1, 1,
0.5820327, -1.570397, 3.679497, 0.1921569, 0, 1, 1,
0.5822953, 0.04676534, 3.163584, 0.2, 0, 1, 1,
0.5833977, -0.3401712, 0.9222593, 0.2078431, 0, 1, 1,
0.5835963, 1.026142, 0.83711, 0.2117647, 0, 1, 1,
0.584634, -0.5118422, 2.853148, 0.2196078, 0, 1, 1,
0.5851187, 2.050501, 1.299226, 0.2235294, 0, 1, 1,
0.5852755, -0.3243234, 0.6476129, 0.2313726, 0, 1, 1,
0.5870398, -0.240308, -0.3731902, 0.2352941, 0, 1, 1,
0.5943634, -1.486239, 3.031668, 0.2431373, 0, 1, 1,
0.596199, 0.7005908, 1.026801, 0.2470588, 0, 1, 1,
0.6040946, -1.498237, 1.569589, 0.254902, 0, 1, 1,
0.606183, 0.2342949, 2.566921, 0.2588235, 0, 1, 1,
0.6097122, 0.6336147, 1.271142, 0.2666667, 0, 1, 1,
0.6118345, -0.2289417, 1.733285, 0.2705882, 0, 1, 1,
0.6175621, 0.6936479, 1.451506, 0.2784314, 0, 1, 1,
0.6186612, 0.1402951, 0.6837732, 0.282353, 0, 1, 1,
0.6207218, 0.07259053, 1.262482, 0.2901961, 0, 1, 1,
0.6223939, 0.4483129, -1.079732, 0.2941177, 0, 1, 1,
0.6236708, 0.2302783, 1.391201, 0.3019608, 0, 1, 1,
0.6239105, -1.906768, 3.227074, 0.3098039, 0, 1, 1,
0.6257404, -0.1379476, 2.021056, 0.3137255, 0, 1, 1,
0.6294348, -0.04588883, 2.165108, 0.3215686, 0, 1, 1,
0.6322986, 0.5372941, 0.7121554, 0.3254902, 0, 1, 1,
0.6388996, 0.4894621, 1.233391, 0.3333333, 0, 1, 1,
0.6397376, -1.926219, 3.434602, 0.3372549, 0, 1, 1,
0.6400298, -1.87594, 4.488656, 0.345098, 0, 1, 1,
0.6456014, -0.3259869, 0.8871239, 0.3490196, 0, 1, 1,
0.6477536, -0.9973931, 1.63257, 0.3568628, 0, 1, 1,
0.6500624, 1.140497, -0.6696405, 0.3607843, 0, 1, 1,
0.6503468, -0.6164204, 2.403161, 0.3686275, 0, 1, 1,
0.6520364, -1.150332, 2.70711, 0.372549, 0, 1, 1,
0.6521756, 0.2693278, 0.1011869, 0.3803922, 0, 1, 1,
0.653877, 1.204713, 0.9806997, 0.3843137, 0, 1, 1,
0.6612382, 0.8721104, 1.222804, 0.3921569, 0, 1, 1,
0.6671663, -0.5100211, 2.775307, 0.3960784, 0, 1, 1,
0.6687353, -0.6928723, 0.482938, 0.4039216, 0, 1, 1,
0.6694159, 0.03012868, 1.319846, 0.4117647, 0, 1, 1,
0.6705769, -0.7445047, 1.934495, 0.4156863, 0, 1, 1,
0.67398, 0.690465, 0.7214467, 0.4235294, 0, 1, 1,
0.6755196, -1.405187, 4.706157, 0.427451, 0, 1, 1,
0.6757883, -0.8307775, 1.414499, 0.4352941, 0, 1, 1,
0.6817621, 1.357223, -0.4244667, 0.4392157, 0, 1, 1,
0.6833715, -0.2771758, 1.320498, 0.4470588, 0, 1, 1,
0.6838949, 0.2539886, 1.940634, 0.4509804, 0, 1, 1,
0.6855025, 0.4536647, 0.9808336, 0.4588235, 0, 1, 1,
0.6865771, -0.2049554, 0.5631486, 0.4627451, 0, 1, 1,
0.687528, 1.208444, -0.02333843, 0.4705882, 0, 1, 1,
0.6899055, 0.8558642, 2.472108, 0.4745098, 0, 1, 1,
0.6957229, -0.104383, 1.773335, 0.4823529, 0, 1, 1,
0.6965215, -0.7784026, 2.037365, 0.4862745, 0, 1, 1,
0.7027497, 0.5607846, 0.7019281, 0.4941176, 0, 1, 1,
0.7071878, 0.6305628, 0.3771452, 0.5019608, 0, 1, 1,
0.7080465, -0.8063899, 2.622965, 0.5058824, 0, 1, 1,
0.7086749, 1.198752, -0.3081895, 0.5137255, 0, 1, 1,
0.709193, 0.3118542, 0.7510542, 0.5176471, 0, 1, 1,
0.7107744, 0.5173134, 1.771106, 0.5254902, 0, 1, 1,
0.715343, -0.6079423, 2.071171, 0.5294118, 0, 1, 1,
0.7187054, 1.776866, -0.110578, 0.5372549, 0, 1, 1,
0.7207008, 0.5152826, -1.027602, 0.5411765, 0, 1, 1,
0.724538, 0.364217, 1.408543, 0.5490196, 0, 1, 1,
0.729862, -1.786877, 2.221511, 0.5529412, 0, 1, 1,
0.732406, -0.1340994, 1.603745, 0.5607843, 0, 1, 1,
0.7391987, -0.4479937, 2.16273, 0.5647059, 0, 1, 1,
0.7426301, -0.9365579, 4.389263, 0.572549, 0, 1, 1,
0.7432302, 0.1289769, 0.05807675, 0.5764706, 0, 1, 1,
0.7435676, -0.02638386, 1.689776, 0.5843138, 0, 1, 1,
0.7523214, -0.5509715, 2.342727, 0.5882353, 0, 1, 1,
0.7565758, -0.2963505, 0.6930904, 0.5960785, 0, 1, 1,
0.7586142, 0.8609264, -0.7641388, 0.6039216, 0, 1, 1,
0.7602726, 2.156652, -1.069092, 0.6078432, 0, 1, 1,
0.7626602, 0.3053928, 0.5097638, 0.6156863, 0, 1, 1,
0.76537, 0.4027689, 1.923949, 0.6196079, 0, 1, 1,
0.7683633, 2.023797, -0.6523765, 0.627451, 0, 1, 1,
0.7687311, 0.837257, 0.4577933, 0.6313726, 0, 1, 1,
0.7785666, 1.186382, 0.06710445, 0.6392157, 0, 1, 1,
0.7809234, -0.1613173, 3.446914, 0.6431373, 0, 1, 1,
0.7840075, -1.122618, 3.792911, 0.6509804, 0, 1, 1,
0.7905266, -1.635666, 1.755301, 0.654902, 0, 1, 1,
0.790845, -1.715077, 4.741663, 0.6627451, 0, 1, 1,
0.7957164, 1.149915, -0.3113385, 0.6666667, 0, 1, 1,
0.7975788, 1.38634, 0.5300389, 0.6745098, 0, 1, 1,
0.7986109, -0.8172123, 2.252425, 0.6784314, 0, 1, 1,
0.7997699, 0.3530098, 2.255502, 0.6862745, 0, 1, 1,
0.8027046, -0.2440316, 1.154921, 0.6901961, 0, 1, 1,
0.8032181, -0.2032114, 1.92705, 0.6980392, 0, 1, 1,
0.8148608, 0.3029906, 0.2818064, 0.7058824, 0, 1, 1,
0.815047, -1.610383, 3.669382, 0.7098039, 0, 1, 1,
0.8158083, -0.1333481, 0.7393541, 0.7176471, 0, 1, 1,
0.8210645, 2.291116, -0.1100776, 0.7215686, 0, 1, 1,
0.8221489, -0.6981492, 3.235663, 0.7294118, 0, 1, 1,
0.824517, -0.03039575, 1.358778, 0.7333333, 0, 1, 1,
0.8254966, 0.6565293, -0.4136425, 0.7411765, 0, 1, 1,
0.8294926, -0.7195811, 3.713701, 0.7450981, 0, 1, 1,
0.8298275, -0.03287715, 0.7726188, 0.7529412, 0, 1, 1,
0.8333007, 0.0161581, 0.5425819, 0.7568628, 0, 1, 1,
0.8339587, 0.890592, 1.557394, 0.7647059, 0, 1, 1,
0.8452337, 0.4691041, 0.9415092, 0.7686275, 0, 1, 1,
0.8483193, 0.2890007, 1.904939, 0.7764706, 0, 1, 1,
0.8515678, -1.689236, 3.261981, 0.7803922, 0, 1, 1,
0.862254, 0.3771506, 1.691961, 0.7882353, 0, 1, 1,
0.8665417, 0.3288603, 3.299077, 0.7921569, 0, 1, 1,
0.8774975, -0.4059911, 2.269633, 0.8, 0, 1, 1,
0.8812901, 0.04368422, 1.166499, 0.8078431, 0, 1, 1,
0.8914262, -1.930915, 2.533669, 0.8117647, 0, 1, 1,
0.8936077, -2.433868, 1.657273, 0.8196079, 0, 1, 1,
0.9005623, 0.2742468, 2.029392, 0.8235294, 0, 1, 1,
0.9009649, -0.6893345, 1.673806, 0.8313726, 0, 1, 1,
0.9037911, -0.1311325, 1.387564, 0.8352941, 0, 1, 1,
0.90471, -0.9660401, 3.3149, 0.8431373, 0, 1, 1,
0.9058399, 1.393137, 3.166604, 0.8470588, 0, 1, 1,
0.9080225, -0.7408255, 2.252749, 0.854902, 0, 1, 1,
0.9087577, 0.0577397, 2.174877, 0.8588235, 0, 1, 1,
0.9093241, 2.125179, 1.669093, 0.8666667, 0, 1, 1,
0.9126939, -0.5215999, 3.381197, 0.8705882, 0, 1, 1,
0.9218141, 0.5241828, 0.01911538, 0.8784314, 0, 1, 1,
0.9271628, 0.04560612, 0.7357541, 0.8823529, 0, 1, 1,
0.9302951, 0.162215, 1.339598, 0.8901961, 0, 1, 1,
0.9322263, -1.038855, 2.099246, 0.8941177, 0, 1, 1,
0.9370334, 1.486382, 1.661149, 0.9019608, 0, 1, 1,
0.9370707, 0.7796884, 0.03802622, 0.9098039, 0, 1, 1,
0.9423641, -1.233855, 3.104908, 0.9137255, 0, 1, 1,
0.9439142, 0.09592949, 0.991781, 0.9215686, 0, 1, 1,
0.9520635, 0.3590833, 0.08791716, 0.9254902, 0, 1, 1,
0.9594159, -0.4296907, 1.44865, 0.9333333, 0, 1, 1,
0.961262, 2.372046, 1.095864, 0.9372549, 0, 1, 1,
0.9618083, 0.3868599, -0.381109, 0.945098, 0, 1, 1,
0.9637204, -1.375586, 2.292338, 0.9490196, 0, 1, 1,
0.9662348, -2.079043, 4.425877, 0.9568627, 0, 1, 1,
0.9823073, -0.0105267, 1.632351, 0.9607843, 0, 1, 1,
0.9851406, -1.922104, 2.433813, 0.9686275, 0, 1, 1,
0.995838, 0.1189526, 1.455177, 0.972549, 0, 1, 1,
0.999946, 1.209364, 1.937867, 0.9803922, 0, 1, 1,
1.00273, 0.434041, 1.190636, 0.9843137, 0, 1, 1,
1.012317, -2.728483, 2.49894, 0.9921569, 0, 1, 1,
1.014388, -0.8993241, 3.452781, 0.9960784, 0, 1, 1,
1.016087, 0.1487674, 0.4636575, 1, 0, 0.9960784, 1,
1.018973, 0.7581962, -0.8206294, 1, 0, 0.9882353, 1,
1.022161, -1.135287, 3.450788, 1, 0, 0.9843137, 1,
1.022728, 0.5938978, 0.1338553, 1, 0, 0.9764706, 1,
1.027811, -0.03433637, 1.155555, 1, 0, 0.972549, 1,
1.029643, 0.145766, 1.549987, 1, 0, 0.9647059, 1,
1.031, -0.6029021, 2.077438, 1, 0, 0.9607843, 1,
1.03298, -0.1544077, 2.370261, 1, 0, 0.9529412, 1,
1.041979, 0.7268106, 2.014706, 1, 0, 0.9490196, 1,
1.043289, -1.471727, 1.063767, 1, 0, 0.9411765, 1,
1.052806, -0.9851823, 2.961406, 1, 0, 0.9372549, 1,
1.05344, 0.8843631, 3.032087, 1, 0, 0.9294118, 1,
1.056653, 2.597115, 1.379184, 1, 0, 0.9254902, 1,
1.058897, 0.9559636, -1.263974, 1, 0, 0.9176471, 1,
1.058951, 1.385615, 0.7165038, 1, 0, 0.9137255, 1,
1.060114, -2.184055, 2.300415, 1, 0, 0.9058824, 1,
1.063063, -0.9670197, 2.556392, 1, 0, 0.9019608, 1,
1.06445, 0.3916242, 0.9982783, 1, 0, 0.8941177, 1,
1.067706, -0.6278647, 1.842286, 1, 0, 0.8862745, 1,
1.070454, -2.137354, 2.960155, 1, 0, 0.8823529, 1,
1.072598, -0.7855935, 1.367894, 1, 0, 0.8745098, 1,
1.081951, -0.1707639, 0.6347136, 1, 0, 0.8705882, 1,
1.087297, 0.6889685, 0.1232121, 1, 0, 0.8627451, 1,
1.090171, -0.292551, 1.482277, 1, 0, 0.8588235, 1,
1.09224, -0.9478688, 1.937376, 1, 0, 0.8509804, 1,
1.092354, 0.7474812, 0.9294442, 1, 0, 0.8470588, 1,
1.092595, 1.338645, -0.08949346, 1, 0, 0.8392157, 1,
1.100597, -0.3746472, 2.063201, 1, 0, 0.8352941, 1,
1.106503, 0.1461703, 2.496886, 1, 0, 0.827451, 1,
1.117586, -0.5226373, 2.102509, 1, 0, 0.8235294, 1,
1.137358, -0.6324245, 2.085167, 1, 0, 0.8156863, 1,
1.137903, 0.4581798, 1.678439, 1, 0, 0.8117647, 1,
1.138772, -0.1096356, 1.066934, 1, 0, 0.8039216, 1,
1.147689, -0.1967965, 0.226442, 1, 0, 0.7960784, 1,
1.15571, 0.1134094, 2.184517, 1, 0, 0.7921569, 1,
1.161001, 0.1564545, 2.252458, 1, 0, 0.7843137, 1,
1.161017, -0.4626682, 1.736873, 1, 0, 0.7803922, 1,
1.173487, -0.6745963, 1.625136, 1, 0, 0.772549, 1,
1.177953, 1.15445, 2.025853, 1, 0, 0.7686275, 1,
1.180201, 0.1010835, 1.133369, 1, 0, 0.7607843, 1,
1.185127, 1.27907, 0.7432135, 1, 0, 0.7568628, 1,
1.185423, -1.190266, 2.00952, 1, 0, 0.7490196, 1,
1.189575, -0.4713707, 1.30781, 1, 0, 0.7450981, 1,
1.191644, -0.6528228, 3.532965, 1, 0, 0.7372549, 1,
1.193372, 0.1652464, 0.8339255, 1, 0, 0.7333333, 1,
1.19417, 0.4034148, 0.2592335, 1, 0, 0.7254902, 1,
1.203658, -0.2780636, 2.593488, 1, 0, 0.7215686, 1,
1.207464, -2.224225, 4.193961, 1, 0, 0.7137255, 1,
1.213115, 1.798078, 1.70407, 1, 0, 0.7098039, 1,
1.213772, -0.9374265, 2.305832, 1, 0, 0.7019608, 1,
1.218325, -0.04544925, 3.810822, 1, 0, 0.6941177, 1,
1.224562, -0.6075836, 0.4572467, 1, 0, 0.6901961, 1,
1.238262, 0.5013849, 1.905789, 1, 0, 0.682353, 1,
1.239102, -0.242156, 2.113542, 1, 0, 0.6784314, 1,
1.241767, 1.027267, 0.9443891, 1, 0, 0.6705883, 1,
1.254298, -2.813241, 4.238892, 1, 0, 0.6666667, 1,
1.255132, -0.3104973, 2.530992, 1, 0, 0.6588235, 1,
1.265674, 1.415381, -0.6281152, 1, 0, 0.654902, 1,
1.272113, 0.1065247, 0.8382367, 1, 0, 0.6470588, 1,
1.274572, 0.3155073, 1.767806, 1, 0, 0.6431373, 1,
1.275504, 0.9292239, 1.274352, 1, 0, 0.6352941, 1,
1.275513, -1.66625, 3.695052, 1, 0, 0.6313726, 1,
1.276997, -1.808021, 1.913055, 1, 0, 0.6235294, 1,
1.282178, -0.9845917, 2.343741, 1, 0, 0.6196079, 1,
1.285438, 0.05661373, 1.773049, 1, 0, 0.6117647, 1,
1.289284, -0.2398892, 1.366108, 1, 0, 0.6078432, 1,
1.290764, 0.3012094, 2.268447, 1, 0, 0.6, 1,
1.292061, 1.072749, 2.032838, 1, 0, 0.5921569, 1,
1.293102, -0.1578045, 2.554215, 1, 0, 0.5882353, 1,
1.297728, 0.6994066, -0.09874378, 1, 0, 0.5803922, 1,
1.304036, -0.06566602, 1.432502, 1, 0, 0.5764706, 1,
1.30555, -0.819435, 1.934839, 1, 0, 0.5686275, 1,
1.305724, -0.02005023, 1.862554, 1, 0, 0.5647059, 1,
1.305935, -1.32344, 2.960367, 1, 0, 0.5568628, 1,
1.306417, -0.3574722, 2.931846, 1, 0, 0.5529412, 1,
1.308888, -0.266153, 1.732184, 1, 0, 0.5450981, 1,
1.312516, 0.1804584, 1.352476, 1, 0, 0.5411765, 1,
1.317638, 0.4531629, 1.623341, 1, 0, 0.5333334, 1,
1.318421, -1.156789, 3.62415, 1, 0, 0.5294118, 1,
1.32958, 0.7515976, 0.7647998, 1, 0, 0.5215687, 1,
1.336078, 1.353757, -0.3085578, 1, 0, 0.5176471, 1,
1.336876, -0.3952284, 3.679087, 1, 0, 0.509804, 1,
1.339089, -1.057333, 0.6749829, 1, 0, 0.5058824, 1,
1.351167, -0.0637894, 2.826706, 1, 0, 0.4980392, 1,
1.35664, -1.284682, 1.408017, 1, 0, 0.4901961, 1,
1.374285, -0.3583159, 1.556143, 1, 0, 0.4862745, 1,
1.376151, -0.4460625, 1.988747, 1, 0, 0.4784314, 1,
1.385055, 0.6301261, 0.1219719, 1, 0, 0.4745098, 1,
1.397485, 0.1096825, 1.714711, 1, 0, 0.4666667, 1,
1.400585, -0.01774129, 2.729083, 1, 0, 0.4627451, 1,
1.4157, -0.8766972, 0.4994924, 1, 0, 0.454902, 1,
1.434159, -0.3062646, 2.50712, 1, 0, 0.4509804, 1,
1.434612, -1.757617, 3.251744, 1, 0, 0.4431373, 1,
1.44195, -0.01567771, 2.440855, 1, 0, 0.4392157, 1,
1.451018, 0.1164648, 0.6897469, 1, 0, 0.4313726, 1,
1.461934, 0.3329929, 1.605414, 1, 0, 0.427451, 1,
1.464831, 0.3707086, 0.7996929, 1, 0, 0.4196078, 1,
1.469117, -0.4516602, 1.141425, 1, 0, 0.4156863, 1,
1.4791, -0.3450235, -0.2425541, 1, 0, 0.4078431, 1,
1.4802, 1.355366, 2.888522, 1, 0, 0.4039216, 1,
1.494819, -0.7529047, 2.128139, 1, 0, 0.3960784, 1,
1.497406, -1.430536, 2.548672, 1, 0, 0.3882353, 1,
1.49849, 0.03816191, 1.864536, 1, 0, 0.3843137, 1,
1.500346, -1.176584, 2.90271, 1, 0, 0.3764706, 1,
1.502969, 0.4919716, 0.3450224, 1, 0, 0.372549, 1,
1.50585, 0.9204021, 0.7296602, 1, 0, 0.3647059, 1,
1.512148, -0.1771462, 1.310269, 1, 0, 0.3607843, 1,
1.51235, 1.457493, 1.112651, 1, 0, 0.3529412, 1,
1.517069, -0.550325, 1.145717, 1, 0, 0.3490196, 1,
1.543765, -0.4863713, 3.252227, 1, 0, 0.3411765, 1,
1.558841, -0.2408968, 0.9205969, 1, 0, 0.3372549, 1,
1.574427, -0.2562244, 1.323252, 1, 0, 0.3294118, 1,
1.582324, -0.5014489, 0.3797668, 1, 0, 0.3254902, 1,
1.596063, 0.9896083, 0.9467383, 1, 0, 0.3176471, 1,
1.616825, 1.948932, 1.312934, 1, 0, 0.3137255, 1,
1.617164, 1.033902, -0.5946167, 1, 0, 0.3058824, 1,
1.617637, -0.8661695, 0.4558276, 1, 0, 0.2980392, 1,
1.618001, 1.731059, 2.002598, 1, 0, 0.2941177, 1,
1.629202, 1.700563, 0.9028617, 1, 0, 0.2862745, 1,
1.630374, -2.046685, 2.375079, 1, 0, 0.282353, 1,
1.662058, 1.460436, 0.394616, 1, 0, 0.2745098, 1,
1.665293, 1.677531, 0.8045619, 1, 0, 0.2705882, 1,
1.687196, -0.1582795, 2.852956, 1, 0, 0.2627451, 1,
1.702306, -1.174543, 2.661158, 1, 0, 0.2588235, 1,
1.722545, 0.02120792, 1.216236, 1, 0, 0.2509804, 1,
1.725856, 0.2110145, 2.37916, 1, 0, 0.2470588, 1,
1.729173, 1.835892, 0.9316493, 1, 0, 0.2392157, 1,
1.730643, 0.467676, 1.694741, 1, 0, 0.2352941, 1,
1.758175, -0.2790412, 0.523914, 1, 0, 0.227451, 1,
1.766539, 1.175407, 2.452988, 1, 0, 0.2235294, 1,
1.771118, -0.8960988, 3.683636, 1, 0, 0.2156863, 1,
1.78252, -0.4885487, 1.517335, 1, 0, 0.2117647, 1,
1.815234, -0.3207397, 1.888918, 1, 0, 0.2039216, 1,
1.833058, -0.4791453, 2.22167, 1, 0, 0.1960784, 1,
1.8443, -2.013178, 1.675655, 1, 0, 0.1921569, 1,
1.866479, -1.624131, 1.544565, 1, 0, 0.1843137, 1,
1.897745, -0.3396985, 1.250218, 1, 0, 0.1803922, 1,
1.900311, -0.6121542, 0.7496485, 1, 0, 0.172549, 1,
1.914073, -0.2249677, 0.6544859, 1, 0, 0.1686275, 1,
1.927116, -0.4289526, 3.138804, 1, 0, 0.1607843, 1,
1.931591, 0.2093965, -0.6933389, 1, 0, 0.1568628, 1,
1.935032, 1.289082, 2.660619, 1, 0, 0.1490196, 1,
1.944544, -1.127842, 2.293445, 1, 0, 0.145098, 1,
1.950588, -0.5057306, 1.530203, 1, 0, 0.1372549, 1,
1.968479, 0.9559357, 0.08255336, 1, 0, 0.1333333, 1,
1.993775, -0.4335982, 0.7954865, 1, 0, 0.1254902, 1,
2.032816, -0.9005213, 2.615883, 1, 0, 0.1215686, 1,
2.05323, -0.5691116, 0.5885434, 1, 0, 0.1137255, 1,
2.103018, 2.302285, 2.480955, 1, 0, 0.1098039, 1,
2.110285, 0.246146, 0.2954887, 1, 0, 0.1019608, 1,
2.126312, -0.3689332, 0.778047, 1, 0, 0.09411765, 1,
2.161859, -2.715623, 1.072075, 1, 0, 0.09019608, 1,
2.173922, 0.008637789, 1.588235, 1, 0, 0.08235294, 1,
2.182868, 0.4769874, 1.308979, 1, 0, 0.07843138, 1,
2.20573, 0.580523, 1.468339, 1, 0, 0.07058824, 1,
2.213373, -1.020061, 2.628658, 1, 0, 0.06666667, 1,
2.214029, 0.7572928, -0.4061814, 1, 0, 0.05882353, 1,
2.228196, 0.9635716, 0.2916649, 1, 0, 0.05490196, 1,
2.344702, -0.3856128, 0.651875, 1, 0, 0.04705882, 1,
2.369673, 0.9509486, 1.509275, 1, 0, 0.04313726, 1,
2.390148, 0.5984895, 2.826099, 1, 0, 0.03529412, 1,
2.396462, 0.8205981, 0.6631365, 1, 0, 0.03137255, 1,
2.726683, 0.07055133, 1.954005, 1, 0, 0.02352941, 1,
2.802763, -0.1981021, 2.251534, 1, 0, 0.01960784, 1,
2.961491, -0.6125052, 1.666289, 1, 0, 0.01176471, 1,
3.569926, -1.306456, 1.177085, 1, 0, 0.007843138, 1
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
0.01632702, -3.965619, -7.154643, 0, -0.5, 0.5, 0.5,
0.01632702, -3.965619, -7.154643, 1, -0.5, 0.5, 0.5,
0.01632702, -3.965619, -7.154643, 1, 1.5, 0.5, 0.5,
0.01632702, -3.965619, -7.154643, 0, 1.5, 0.5, 0.5
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
-4.741942, -0.1772413, -7.154643, 0, -0.5, 0.5, 0.5,
-4.741942, -0.1772413, -7.154643, 1, -0.5, 0.5, 0.5,
-4.741942, -0.1772413, -7.154643, 1, 1.5, 0.5, 0.5,
-4.741942, -0.1772413, -7.154643, 0, 1.5, 0.5, 0.5
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
-4.741942, -3.965619, -0.2212026, 0, -0.5, 0.5, 0.5,
-4.741942, -3.965619, -0.2212026, 1, -0.5, 0.5, 0.5,
-4.741942, -3.965619, -0.2212026, 1, 1.5, 0.5, 0.5,
-4.741942, -3.965619, -0.2212026, 0, 1.5, 0.5, 0.5
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
-2, -3.091378, -5.554618,
2, -3.091378, -5.554618,
-2, -3.091378, -5.554618,
-2, -3.237085, -5.821289,
0, -3.091378, -5.554618,
0, -3.237085, -5.821289,
2, -3.091378, -5.554618,
2, -3.237085, -5.821289
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
-2, -3.528498, -6.354631, 0, -0.5, 0.5, 0.5,
-2, -3.528498, -6.354631, 1, -0.5, 0.5, 0.5,
-2, -3.528498, -6.354631, 1, 1.5, 0.5, 0.5,
-2, -3.528498, -6.354631, 0, 1.5, 0.5, 0.5,
0, -3.528498, -6.354631, 0, -0.5, 0.5, 0.5,
0, -3.528498, -6.354631, 1, -0.5, 0.5, 0.5,
0, -3.528498, -6.354631, 1, 1.5, 0.5, 0.5,
0, -3.528498, -6.354631, 0, 1.5, 0.5, 0.5,
2, -3.528498, -6.354631, 0, -0.5, 0.5, 0.5,
2, -3.528498, -6.354631, 1, -0.5, 0.5, 0.5,
2, -3.528498, -6.354631, 1, 1.5, 0.5, 0.5,
2, -3.528498, -6.354631, 0, 1.5, 0.5, 0.5
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
-3.64388, -3, -5.554618,
-3.64388, 2, -5.554618,
-3.64388, -3, -5.554618,
-3.82689, -3, -5.821289,
-3.64388, -2, -5.554618,
-3.82689, -2, -5.821289,
-3.64388, -1, -5.554618,
-3.82689, -1, -5.821289,
-3.64388, 0, -5.554618,
-3.82689, 0, -5.821289,
-3.64388, 1, -5.554618,
-3.82689, 1, -5.821289,
-3.64388, 2, -5.554618,
-3.82689, 2, -5.821289
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
-4.192911, -3, -6.354631, 0, -0.5, 0.5, 0.5,
-4.192911, -3, -6.354631, 1, -0.5, 0.5, 0.5,
-4.192911, -3, -6.354631, 1, 1.5, 0.5, 0.5,
-4.192911, -3, -6.354631, 0, 1.5, 0.5, 0.5,
-4.192911, -2, -6.354631, 0, -0.5, 0.5, 0.5,
-4.192911, -2, -6.354631, 1, -0.5, 0.5, 0.5,
-4.192911, -2, -6.354631, 1, 1.5, 0.5, 0.5,
-4.192911, -2, -6.354631, 0, 1.5, 0.5, 0.5,
-4.192911, -1, -6.354631, 0, -0.5, 0.5, 0.5,
-4.192911, -1, -6.354631, 1, -0.5, 0.5, 0.5,
-4.192911, -1, -6.354631, 1, 1.5, 0.5, 0.5,
-4.192911, -1, -6.354631, 0, 1.5, 0.5, 0.5,
-4.192911, 0, -6.354631, 0, -0.5, 0.5, 0.5,
-4.192911, 0, -6.354631, 1, -0.5, 0.5, 0.5,
-4.192911, 0, -6.354631, 1, 1.5, 0.5, 0.5,
-4.192911, 0, -6.354631, 0, 1.5, 0.5, 0.5,
-4.192911, 1, -6.354631, 0, -0.5, 0.5, 0.5,
-4.192911, 1, -6.354631, 1, -0.5, 0.5, 0.5,
-4.192911, 1, -6.354631, 1, 1.5, 0.5, 0.5,
-4.192911, 1, -6.354631, 0, 1.5, 0.5, 0.5,
-4.192911, 2, -6.354631, 0, -0.5, 0.5, 0.5,
-4.192911, 2, -6.354631, 1, -0.5, 0.5, 0.5,
-4.192911, 2, -6.354631, 1, 1.5, 0.5, 0.5,
-4.192911, 2, -6.354631, 0, 1.5, 0.5, 0.5
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
-3.64388, -3.091378, -4,
-3.64388, -3.091378, 4,
-3.64388, -3.091378, -4,
-3.82689, -3.237085, -4,
-3.64388, -3.091378, -2,
-3.82689, -3.237085, -2,
-3.64388, -3.091378, 0,
-3.82689, -3.237085, 0,
-3.64388, -3.091378, 2,
-3.82689, -3.237085, 2,
-3.64388, -3.091378, 4,
-3.82689, -3.237085, 4
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
-4.192911, -3.528498, -4, 0, -0.5, 0.5, 0.5,
-4.192911, -3.528498, -4, 1, -0.5, 0.5, 0.5,
-4.192911, -3.528498, -4, 1, 1.5, 0.5, 0.5,
-4.192911, -3.528498, -4, 0, 1.5, 0.5, 0.5,
-4.192911, -3.528498, -2, 0, -0.5, 0.5, 0.5,
-4.192911, -3.528498, -2, 1, -0.5, 0.5, 0.5,
-4.192911, -3.528498, -2, 1, 1.5, 0.5, 0.5,
-4.192911, -3.528498, -2, 0, 1.5, 0.5, 0.5,
-4.192911, -3.528498, 0, 0, -0.5, 0.5, 0.5,
-4.192911, -3.528498, 0, 1, -0.5, 0.5, 0.5,
-4.192911, -3.528498, 0, 1, 1.5, 0.5, 0.5,
-4.192911, -3.528498, 0, 0, 1.5, 0.5, 0.5,
-4.192911, -3.528498, 2, 0, -0.5, 0.5, 0.5,
-4.192911, -3.528498, 2, 1, -0.5, 0.5, 0.5,
-4.192911, -3.528498, 2, 1, 1.5, 0.5, 0.5,
-4.192911, -3.528498, 2, 0, 1.5, 0.5, 0.5,
-4.192911, -3.528498, 4, 0, -0.5, 0.5, 0.5,
-4.192911, -3.528498, 4, 1, -0.5, 0.5, 0.5,
-4.192911, -3.528498, 4, 1, 1.5, 0.5, 0.5,
-4.192911, -3.528498, 4, 0, 1.5, 0.5, 0.5
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
-3.64388, -3.091378, -5.554618,
-3.64388, 2.736895, -5.554618,
-3.64388, -3.091378, 5.112213,
-3.64388, 2.736895, 5.112213,
-3.64388, -3.091378, -5.554618,
-3.64388, -3.091378, 5.112213,
-3.64388, 2.736895, -5.554618,
-3.64388, 2.736895, 5.112213,
-3.64388, -3.091378, -5.554618,
3.676534, -3.091378, -5.554618,
-3.64388, -3.091378, 5.112213,
3.676534, -3.091378, 5.112213,
-3.64388, 2.736895, -5.554618,
3.676534, 2.736895, -5.554618,
-3.64388, 2.736895, 5.112213,
3.676534, 2.736895, 5.112213,
3.676534, -3.091378, -5.554618,
3.676534, 2.736895, -5.554618,
3.676534, -3.091378, 5.112213,
3.676534, 2.736895, 5.112213,
3.676534, -3.091378, -5.554618,
3.676534, -3.091378, 5.112213,
3.676534, 2.736895, -5.554618,
3.676534, 2.736895, 5.112213
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
var radius = 7.576854;
var distance = 33.71028;
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
mvMatrix.translate( -0.01632702, 0.1772413, 0.2212026 );
mvMatrix.scale( 1.119096, 1.405604, 0.7680109 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.71028);
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
esprocarb<-read.table("esprocarb.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-esprocarb$V2
```

```
## Error in eval(expr, envir, enclos): object 'esprocarb' not found
```

```r
y<-esprocarb$V3
```

```
## Error in eval(expr, envir, enclos): object 'esprocarb' not found
```

```r
z<-esprocarb$V4
```

```
## Error in eval(expr, envir, enclos): object 'esprocarb' not found
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
-3.537272, 0.4666135, -0.1516443, 0, 0, 1, 1, 1,
-3.363928, 1.651988, -2.932934, 1, 0, 0, 1, 1,
-2.959189, 0.4914104, -0.8101854, 1, 0, 0, 1, 1,
-2.95918, 0.9590098, 1.633495, 1, 0, 0, 1, 1,
-2.946233, 0.7521272, 0.1969145, 1, 0, 0, 1, 1,
-2.887035, -1.147763, -2.248462, 1, 0, 0, 1, 1,
-2.864191, -0.2479707, -0.125803, 0, 0, 0, 1, 1,
-2.652952, 0.1749938, -1.312168, 0, 0, 0, 1, 1,
-2.455567, 1.284318, -0.2675813, 0, 0, 0, 1, 1,
-2.425251, -1.195159, -0.960942, 0, 0, 0, 1, 1,
-2.41114, 0.5714183, 0.8096466, 0, 0, 0, 1, 1,
-2.387514, 0.09931094, -1.067036, 0, 0, 0, 1, 1,
-2.324015, -2.597609, -1.13369, 0, 0, 0, 1, 1,
-2.319403, -0.1608133, -2.215159, 1, 1, 1, 1, 1,
-2.294558, -0.09478731, -1.266304, 1, 1, 1, 1, 1,
-2.284403, 0.4334915, -1.759338, 1, 1, 1, 1, 1,
-2.220461, -0.2901527, -1.31056, 1, 1, 1, 1, 1,
-2.184324, 0.6453155, -1.183145, 1, 1, 1, 1, 1,
-2.134216, -2.20208, -2.964596, 1, 1, 1, 1, 1,
-2.12954, -0.8234779, -2.585164, 1, 1, 1, 1, 1,
-2.099562, -0.5194813, -2.065552, 1, 1, 1, 1, 1,
-2.077705, -0.2297862, -0.535135, 1, 1, 1, 1, 1,
-2.063588, 0.4062138, -2.355596, 1, 1, 1, 1, 1,
-2.001327, 0.764726, -0.9710563, 1, 1, 1, 1, 1,
-1.991529, -0.3290298, -0.130271, 1, 1, 1, 1, 1,
-1.982386, -1.275975, -2.17292, 1, 1, 1, 1, 1,
-1.952564, 0.1277896, -2.609923, 1, 1, 1, 1, 1,
-1.941597, -0.7606238, -3.015423, 1, 1, 1, 1, 1,
-1.885355, -0.6451516, -3.281291, 0, 0, 1, 1, 1,
-1.874919, 1.250745, -0.828703, 1, 0, 0, 1, 1,
-1.871118, 0.752199, -2.615515, 1, 0, 0, 1, 1,
-1.854478, 2.219037, -0.3132305, 1, 0, 0, 1, 1,
-1.784051, -0.9658001, -1.486502, 1, 0, 0, 1, 1,
-1.777307, 0.07714935, -1.401546, 1, 0, 0, 1, 1,
-1.771472, -1.512632, -1.120925, 0, 0, 0, 1, 1,
-1.760775, -0.04589107, -1.327237, 0, 0, 0, 1, 1,
-1.760467, -0.4079549, -2.248529, 0, 0, 0, 1, 1,
-1.748317, -0.299468, -2.447399, 0, 0, 0, 1, 1,
-1.728835, -0.7825834, -4.363968, 0, 0, 0, 1, 1,
-1.714167, 0.1579371, -1.371602, 0, 0, 0, 1, 1,
-1.695261, 0.6878434, -1.731926, 0, 0, 0, 1, 1,
-1.68451, 1.392687, -1.653809, 1, 1, 1, 1, 1,
-1.676145, 1.570829, -1.743966, 1, 1, 1, 1, 1,
-1.675385, 0.01256496, 0.08118209, 1, 1, 1, 1, 1,
-1.666651, 0.3261729, -1.553698, 1, 1, 1, 1, 1,
-1.655701, 1.93442, -0.3933534, 1, 1, 1, 1, 1,
-1.651468, -1.704639, -2.210984, 1, 1, 1, 1, 1,
-1.645463, 1.714122, -0.9260716, 1, 1, 1, 1, 1,
-1.639496, -0.06856132, -0.6454847, 1, 1, 1, 1, 1,
-1.638259, -0.45585, -1.933888, 1, 1, 1, 1, 1,
-1.630951, -0.957039, -0.9370924, 1, 1, 1, 1, 1,
-1.624049, 0.6175479, -1.85523, 1, 1, 1, 1, 1,
-1.619858, 0.2631814, -0.9643657, 1, 1, 1, 1, 1,
-1.613011, 0.2276799, -3.392417, 1, 1, 1, 1, 1,
-1.600769, -0.5255054, -3.038527, 1, 1, 1, 1, 1,
-1.59733, 1.295146, 0.1004634, 1, 1, 1, 1, 1,
-1.593902, -0.09314005, -2.491873, 0, 0, 1, 1, 1,
-1.570676, -0.09767253, -2.212917, 1, 0, 0, 1, 1,
-1.563611, 0.1842722, -0.6635679, 1, 0, 0, 1, 1,
-1.562201, 1.83959, -0.7244968, 1, 0, 0, 1, 1,
-1.559768, -0.6414977, -1.846025, 1, 0, 0, 1, 1,
-1.557348, 2.526335, -0.4450797, 1, 0, 0, 1, 1,
-1.553517, 1.581262, -1.487841, 0, 0, 0, 1, 1,
-1.534255, 0.5163028, 1.363774, 0, 0, 0, 1, 1,
-1.51719, -0.2133088, -0.7357185, 0, 0, 0, 1, 1,
-1.51571, -1.191082, -2.552104, 0, 0, 0, 1, 1,
-1.515361, -0.9174397, -2.498615, 0, 0, 0, 1, 1,
-1.514592, 0.008591178, -3.10223, 0, 0, 0, 1, 1,
-1.514276, -0.7492104, -1.660295, 0, 0, 0, 1, 1,
-1.5068, -0.2552015, -2.133222, 1, 1, 1, 1, 1,
-1.496961, -1.707548, -2.453278, 1, 1, 1, 1, 1,
-1.494617, 1.235037, 0.5412046, 1, 1, 1, 1, 1,
-1.47229, 1.961129, -0.3656543, 1, 1, 1, 1, 1,
-1.470958, -0.1046972, -1.560403, 1, 1, 1, 1, 1,
-1.469555, -0.2467932, -0.8082141, 1, 1, 1, 1, 1,
-1.468712, -2.315147, -2.24589, 1, 1, 1, 1, 1,
-1.467263, 1.498619, -0.05678973, 1, 1, 1, 1, 1,
-1.466237, -1.224384, -2.908454, 1, 1, 1, 1, 1,
-1.459008, -0.03955499, -3.474381, 1, 1, 1, 1, 1,
-1.444228, 0.1415664, -3.524525, 1, 1, 1, 1, 1,
-1.412617, -1.160952, -2.428378, 1, 1, 1, 1, 1,
-1.411009, 0.06554226, -1.862309, 1, 1, 1, 1, 1,
-1.409707, 0.07262507, -2.315486, 1, 1, 1, 1, 1,
-1.404644, -1.279051, -1.626827, 1, 1, 1, 1, 1,
-1.398117, -2.019152, -3.079906, 0, 0, 1, 1, 1,
-1.396176, -1.280334, -0.9707242, 1, 0, 0, 1, 1,
-1.393327, -0.3314138, -1.855202, 1, 0, 0, 1, 1,
-1.391184, 0.282344, -1.836508, 1, 0, 0, 1, 1,
-1.381864, -0.5744815, -2.380152, 1, 0, 0, 1, 1,
-1.378474, -1.448984, -1.971683, 1, 0, 0, 1, 1,
-1.369837, -1.158053, -2.291099, 0, 0, 0, 1, 1,
-1.352041, 2.056436, 0.6377248, 0, 0, 0, 1, 1,
-1.351751, 2.652018, -1.574591, 0, 0, 0, 1, 1,
-1.337808, -0.2641576, -3.638039, 0, 0, 0, 1, 1,
-1.337567, -0.8909079, -2.060011, 0, 0, 0, 1, 1,
-1.336615, -1.272262, -3.326529, 0, 0, 0, 1, 1,
-1.334702, 1.617548, 0.8942701, 0, 0, 0, 1, 1,
-1.303807, 0.05114903, -1.010516, 1, 1, 1, 1, 1,
-1.291233, -0.2966401, -3.011387, 1, 1, 1, 1, 1,
-1.285652, -0.8539194, -2.048549, 1, 1, 1, 1, 1,
-1.25677, 0.5813914, -0.8770734, 1, 1, 1, 1, 1,
-1.252562, -1.135074, -4.369683, 1, 1, 1, 1, 1,
-1.251383, 1.343741, -0.823077, 1, 1, 1, 1, 1,
-1.245568, 1.330112, -0.2388728, 1, 1, 1, 1, 1,
-1.225222, -1.08335, -3.132503, 1, 1, 1, 1, 1,
-1.221446, 0.4100886, -1.904848, 1, 1, 1, 1, 1,
-1.216031, 0.1747681, -0.4718003, 1, 1, 1, 1, 1,
-1.21267, -0.8979568, -1.754815, 1, 1, 1, 1, 1,
-1.209538, 0.4451108, -1.921112, 1, 1, 1, 1, 1,
-1.1993, 0.01754338, -1.038136, 1, 1, 1, 1, 1,
-1.194096, 0.1417722, -0.307045, 1, 1, 1, 1, 1,
-1.183579, 0.7633417, -0.5560781, 1, 1, 1, 1, 1,
-1.182775, 0.9051113, -1.68862, 0, 0, 1, 1, 1,
-1.160732, -0.6104703, -4.31315, 1, 0, 0, 1, 1,
-1.152736, 0.4412925, -2.617468, 1, 0, 0, 1, 1,
-1.143217, -0.513359, -2.233978, 1, 0, 0, 1, 1,
-1.120597, -0.2519991, -1.033164, 1, 0, 0, 1, 1,
-1.119291, -0.9316197, -2.723649, 1, 0, 0, 1, 1,
-1.118837, -0.5193058, -2.396118, 0, 0, 0, 1, 1,
-1.117495, 1.869438, -1.032659, 0, 0, 0, 1, 1,
-1.117012, 0.1984269, -1.239302, 0, 0, 0, 1, 1,
-1.116749, -0.05393699, -0.1483998, 0, 0, 0, 1, 1,
-1.116384, -0.3278097, -3.034136, 0, 0, 0, 1, 1,
-1.115317, 0.5579183, -1.563309, 0, 0, 0, 1, 1,
-1.112604, -0.05525235, -1.826369, 0, 0, 0, 1, 1,
-1.106486, 1.059058, -1.079453, 1, 1, 1, 1, 1,
-1.104605, 0.6977444, -1.355925, 1, 1, 1, 1, 1,
-1.104242, -2.852765, -1.886027, 1, 1, 1, 1, 1,
-1.103815, -1.20675, -1.735385, 1, 1, 1, 1, 1,
-1.099334, -1.380338, -1.62602, 1, 1, 1, 1, 1,
-1.098543, 1.00186, -1.640649, 1, 1, 1, 1, 1,
-1.094912, 1.427311, 0.3167777, 1, 1, 1, 1, 1,
-1.090411, -0.986852, -2.292806, 1, 1, 1, 1, 1,
-1.087199, 2.638665, -0.06082363, 1, 1, 1, 1, 1,
-1.079952, 0.6973335, 0.3775706, 1, 1, 1, 1, 1,
-1.048221, 0.5613842, -2.659693, 1, 1, 1, 1, 1,
-1.042185, -0.5342541, -0.8088424, 1, 1, 1, 1, 1,
-1.037234, -1.044868, -1.784193, 1, 1, 1, 1, 1,
-1.022192, -1.072924, -1.963382, 1, 1, 1, 1, 1,
-1.01593, 0.6674815, -0.6510361, 1, 1, 1, 1, 1,
-1.006547, -0.7860887, -2.750272, 0, 0, 1, 1, 1,
-1.00225, 0.1123464, -0.9766403, 1, 0, 0, 1, 1,
-1.001847, -0.33904, -3.581436, 1, 0, 0, 1, 1,
-0.9996262, 1.091503, 0.2316034, 1, 0, 0, 1, 1,
-0.9864832, -1.01078, -3.729302, 1, 0, 0, 1, 1,
-0.9843388, -0.8242519, -1.910786, 1, 0, 0, 1, 1,
-0.9837721, 0.9740653, -0.6028791, 0, 0, 0, 1, 1,
-0.9724098, -0.9559331, -1.645477, 0, 0, 0, 1, 1,
-0.9692755, 0.2453535, -1.034016, 0, 0, 0, 1, 1,
-0.9670545, -0.01983016, -2.007982, 0, 0, 0, 1, 1,
-0.9521159, -1.150656, -2.932094, 0, 0, 0, 1, 1,
-0.9498564, -2.058948, -1.979674, 0, 0, 0, 1, 1,
-0.9456673, 1.218706, -0.6419098, 0, 0, 0, 1, 1,
-0.9448861, 0.3274958, -0.07147104, 1, 1, 1, 1, 1,
-0.9388532, 0.7193052, -0.5537278, 1, 1, 1, 1, 1,
-0.9380048, 0.7940586, -1.529559, 1, 1, 1, 1, 1,
-0.9329926, 1.952725, 0.5907347, 1, 1, 1, 1, 1,
-0.9289513, 0.2438297, -0.8729017, 1, 1, 1, 1, 1,
-0.9261742, 0.1225176, -2.383562, 1, 1, 1, 1, 1,
-0.9253821, -1.395499, -2.3431, 1, 1, 1, 1, 1,
-0.9218729, -0.5431335, -2.71346, 1, 1, 1, 1, 1,
-0.9173046, -0.432371, -2.794919, 1, 1, 1, 1, 1,
-0.9140327, -1.079206, -2.116861, 1, 1, 1, 1, 1,
-0.9099366, -1.068165, -3.081562, 1, 1, 1, 1, 1,
-0.901351, 0.1844166, -2.389881, 1, 1, 1, 1, 1,
-0.8992015, 0.4688561, -0.6069923, 1, 1, 1, 1, 1,
-0.8979326, 0.273699, -1.822061, 1, 1, 1, 1, 1,
-0.8836934, 1.398167, -1.406258, 1, 1, 1, 1, 1,
-0.8800547, 0.2374702, -1.287176, 0, 0, 1, 1, 1,
-0.8776242, -1.042628, -1.208841, 1, 0, 0, 1, 1,
-0.8766361, 1.40787, -0.9022676, 1, 0, 0, 1, 1,
-0.8745273, 1.055515, 0.3749195, 1, 0, 0, 1, 1,
-0.864199, 1.207287, -1.810804, 1, 0, 0, 1, 1,
-0.8615152, -0.8309311, -1.037776, 1, 0, 0, 1, 1,
-0.8603583, -1.114531, -0.7639123, 0, 0, 0, 1, 1,
-0.8599296, -0.002831334, -2.318137, 0, 0, 0, 1, 1,
-0.8571155, -0.3718405, -2.973027, 0, 0, 0, 1, 1,
-0.8538204, -0.04268467, -1.271096, 0, 0, 0, 1, 1,
-0.8468163, -0.08583378, -1.422457, 0, 0, 0, 1, 1,
-0.8447535, -0.3187691, 0.2631665, 0, 0, 0, 1, 1,
-0.8397082, -0.8291646, -1.567885, 0, 0, 0, 1, 1,
-0.8331312, -2.191108, -4.616797, 1, 1, 1, 1, 1,
-0.8250332, -1.588236, -2.355001, 1, 1, 1, 1, 1,
-0.8229133, -0.6001221, -0.9314361, 1, 1, 1, 1, 1,
-0.8174436, 0.1003336, -2.03213, 1, 1, 1, 1, 1,
-0.8173042, 0.1505028, -0.4563568, 1, 1, 1, 1, 1,
-0.8121471, -0.2872555, -2.493834, 1, 1, 1, 1, 1,
-0.7968648, -0.797573, -1.772834, 1, 1, 1, 1, 1,
-0.7961112, 0.5450616, -1.420833, 1, 1, 1, 1, 1,
-0.7951708, -0.6540455, -0.6238944, 1, 1, 1, 1, 1,
-0.7934126, 0.02982032, -1.271734, 1, 1, 1, 1, 1,
-0.7928283, -0.9793968, -2.154145, 1, 1, 1, 1, 1,
-0.7881511, 0.5151457, -0.3747157, 1, 1, 1, 1, 1,
-0.7878219, -0.8215035, -3.75954, 1, 1, 1, 1, 1,
-0.7876713, -0.2812473, -2.219735, 1, 1, 1, 1, 1,
-0.7800448, -0.2454259, -0.777225, 1, 1, 1, 1, 1,
-0.7799391, -2.448499, -3.574512, 0, 0, 1, 1, 1,
-0.7777119, 0.1815899, -0.8303163, 1, 0, 0, 1, 1,
-0.7761704, -0.2660868, -2.422461, 1, 0, 0, 1, 1,
-0.7735369, -0.4849609, -2.783896, 1, 0, 0, 1, 1,
-0.7666562, 0.4320322, -0.6704613, 1, 0, 0, 1, 1,
-0.7665156, 0.3087569, -2.065978, 1, 0, 0, 1, 1,
-0.7530481, -0.51068, -1.529387, 0, 0, 0, 1, 1,
-0.744643, 0.6219441, -0.3896762, 0, 0, 0, 1, 1,
-0.7443609, -0.8551702, -3.931453, 0, 0, 0, 1, 1,
-0.7440913, 0.35097, 0.4205652, 0, 0, 0, 1, 1,
-0.7418836, -0.372956, -0.890972, 0, 0, 0, 1, 1,
-0.7381384, 1.203626, 0.8891803, 0, 0, 0, 1, 1,
-0.7367227, 0.6448985, -1.567701, 0, 0, 0, 1, 1,
-0.7267039, 0.774739, -0.9815465, 1, 1, 1, 1, 1,
-0.723996, -0.8568186, -1.972244, 1, 1, 1, 1, 1,
-0.710939, 2.027778, -0.3187604, 1, 1, 1, 1, 1,
-0.7063634, -0.4433688, -2.841665, 1, 1, 1, 1, 1,
-0.7014287, -0.04999101, -0.4541542, 1, 1, 1, 1, 1,
-0.6996306, 0.4997671, 1.070821, 1, 1, 1, 1, 1,
-0.6996188, -0.03539439, -2.136626, 1, 1, 1, 1, 1,
-0.6938915, 0.2262687, -0.8634695, 1, 1, 1, 1, 1,
-0.6916443, 1.572471, -0.5712821, 1, 1, 1, 1, 1,
-0.6901404, -1.904427, -3.11656, 1, 1, 1, 1, 1,
-0.6874222, -0.4810362, -0.3420517, 1, 1, 1, 1, 1,
-0.6834498, -0.6475847, -3.7321, 1, 1, 1, 1, 1,
-0.6824381, 0.4857763, -1.575354, 1, 1, 1, 1, 1,
-0.67919, 0.2053089, 0.3449091, 1, 1, 1, 1, 1,
-0.6774231, 1.341747, 0.2768408, 1, 1, 1, 1, 1,
-0.6766166, 0.1586701, -1.210324, 0, 0, 1, 1, 1,
-0.6758719, 0.03826552, -0.1900665, 1, 0, 0, 1, 1,
-0.6723172, 1.385521, -1.678771, 1, 0, 0, 1, 1,
-0.6609582, -1.667401, -3.040522, 1, 0, 0, 1, 1,
-0.6606628, -0.94397, -2.245037, 1, 0, 0, 1, 1,
-0.6600478, -0.3305545, -1.891005, 1, 0, 0, 1, 1,
-0.6571655, 0.3131736, -1.75955, 0, 0, 0, 1, 1,
-0.6540524, 1.520851, -0.7585536, 0, 0, 0, 1, 1,
-0.6472701, 0.5892447, -0.6911898, 0, 0, 0, 1, 1,
-0.642611, 0.07136969, -1.301661, 0, 0, 0, 1, 1,
-0.6399062, -1.397065, -3.473478, 0, 0, 0, 1, 1,
-0.6368221, -0.1726312, -2.689176, 0, 0, 0, 1, 1,
-0.6338536, -0.4321232, -2.76779, 0, 0, 0, 1, 1,
-0.6314275, 2.592045, -0.6257626, 1, 1, 1, 1, 1,
-0.6310633, 0.6436066, -0.2372437, 1, 1, 1, 1, 1,
-0.6148275, -3.0065, -3.854925, 1, 1, 1, 1, 1,
-0.6140259, 0.4178255, -1.622085, 1, 1, 1, 1, 1,
-0.6076291, 0.6923217, -0.5829697, 1, 1, 1, 1, 1,
-0.6063622, 0.7592096, 1.191901, 1, 1, 1, 1, 1,
-0.6058563, 1.302111, -0.1136252, 1, 1, 1, 1, 1,
-0.6043123, -0.004424929, -1.065143, 1, 1, 1, 1, 1,
-0.6005856, 0.04665124, 0.995285, 1, 1, 1, 1, 1,
-0.5948824, 1.178438, -2.433112, 1, 1, 1, 1, 1,
-0.5941139, -1.191851, -1.298185, 1, 1, 1, 1, 1,
-0.5938459, 0.2098584, -1.211002, 1, 1, 1, 1, 1,
-0.5902342, 0.3726339, 0.09144206, 1, 1, 1, 1, 1,
-0.5799826, -0.3499923, -0.9135644, 1, 1, 1, 1, 1,
-0.5689031, 1.125072, 0.3372455, 1, 1, 1, 1, 1,
-0.5683187, -1.070183, -2.831117, 0, 0, 1, 1, 1,
-0.5676706, 0.6211528, -0.556622, 1, 0, 0, 1, 1,
-0.5670491, 0.7144606, -0.9761853, 1, 0, 0, 1, 1,
-0.5669066, 0.7197114, -2.579825, 1, 0, 0, 1, 1,
-0.5645541, 1.484017, -1.048726, 1, 0, 0, 1, 1,
-0.5589224, -0.1039997, -2.42075, 1, 0, 0, 1, 1,
-0.5531992, -0.9655998, -2.814885, 0, 0, 0, 1, 1,
-0.5529599, -0.3729469, -1.475141, 0, 0, 0, 1, 1,
-0.5525993, -0.5716212, -3.381434, 0, 0, 0, 1, 1,
-0.551375, -2.211892, -3.133206, 0, 0, 0, 1, 1,
-0.549038, 0.8686336, -3.073908, 0, 0, 0, 1, 1,
-0.5488186, -1.047856, -2.425196, 0, 0, 0, 1, 1,
-0.5467275, 2.201772, -0.1410006, 0, 0, 0, 1, 1,
-0.5458558, 0.3953702, 0.2941802, 1, 1, 1, 1, 1,
-0.5436541, -2.240263, -2.575323, 1, 1, 1, 1, 1,
-0.5403607, 1.418279, -1.431288, 1, 1, 1, 1, 1,
-0.5390776, -0.1417152, -0.9587312, 1, 1, 1, 1, 1,
-0.5387756, 0.2454371, -2.508564, 1, 1, 1, 1, 1,
-0.538057, -0.1977143, -2.363436, 1, 1, 1, 1, 1,
-0.5320832, 1.047046, -0.9888417, 1, 1, 1, 1, 1,
-0.5305141, 1.347365, -1.602817, 1, 1, 1, 1, 1,
-0.5300998, -2.204238, -1.926015, 1, 1, 1, 1, 1,
-0.5266996, -0.1308881, -1.571079, 1, 1, 1, 1, 1,
-0.5247411, -0.6597798, -3.975658, 1, 1, 1, 1, 1,
-0.522931, -1.247153, -1.849015, 1, 1, 1, 1, 1,
-0.5217934, 0.3805245, -2.512562, 1, 1, 1, 1, 1,
-0.5213839, -0.558991, -3.527081, 1, 1, 1, 1, 1,
-0.5174194, 1.001848, -1.123549, 1, 1, 1, 1, 1,
-0.5164837, -0.1288063, -0.5478666, 0, 0, 1, 1, 1,
-0.515379, -0.8268903, -2.896981, 1, 0, 0, 1, 1,
-0.5147851, 1.613342, -0.9896742, 1, 0, 0, 1, 1,
-0.5097566, 0.6650808, -0.4786309, 1, 0, 0, 1, 1,
-0.5077931, 0.6337108, -1.305089, 1, 0, 0, 1, 1,
-0.501526, 0.3043976, -0.9442232, 1, 0, 0, 1, 1,
-0.491677, -0.8591228, -3.066566, 0, 0, 0, 1, 1,
-0.4864823, 1.35974, -1.653594, 0, 0, 0, 1, 1,
-0.4863079, 0.6325595, -0.4635995, 0, 0, 0, 1, 1,
-0.4820212, 0.6784286, -1.195444, 0, 0, 0, 1, 1,
-0.4812751, -1.124948, -1.704688, 0, 0, 0, 1, 1,
-0.47463, 0.2105509, -2.131673, 0, 0, 0, 1, 1,
-0.4684072, -0.7763443, -2.578977, 0, 0, 0, 1, 1,
-0.4683995, -0.9419342, -0.8764997, 1, 1, 1, 1, 1,
-0.4673211, 0.4711247, -0.7797567, 1, 1, 1, 1, 1,
-0.4604637, 0.2533398, -0.8516064, 1, 1, 1, 1, 1,
-0.4570299, 0.2031565, -0.3827895, 1, 1, 1, 1, 1,
-0.4552048, -1.259857, -2.629732, 1, 1, 1, 1, 1,
-0.4510719, -1.215411, -2.284273, 1, 1, 1, 1, 1,
-0.4489566, 1.100244, -0.8269767, 1, 1, 1, 1, 1,
-0.4488112, 0.6902563, -0.1293763, 1, 1, 1, 1, 1,
-0.4482617, -0.1686635, -1.136738, 1, 1, 1, 1, 1,
-0.4431016, -1.175462, -2.971116, 1, 1, 1, 1, 1,
-0.4415281, 0.3222629, -0.7437159, 1, 1, 1, 1, 1,
-0.4405295, -1.039182, -1.126876, 1, 1, 1, 1, 1,
-0.4402459, -0.1621931, 0.3882289, 1, 1, 1, 1, 1,
-0.4361931, -1.193114, -3.345165, 1, 1, 1, 1, 1,
-0.4314799, -0.06541795, -1.637174, 1, 1, 1, 1, 1,
-0.4304768, -0.4038644, -5.086648, 0, 0, 1, 1, 1,
-0.4266887, -1.864922, -3.014269, 1, 0, 0, 1, 1,
-0.4266541, 1.003266, 0.6049359, 1, 0, 0, 1, 1,
-0.4228695, -1.486199, -1.844614, 1, 0, 0, 1, 1,
-0.4206646, 2.329011, -0.3926796, 1, 0, 0, 1, 1,
-0.4083027, -0.6486434, -3.266426, 1, 0, 0, 1, 1,
-0.4052204, 0.1824213, 0.1674912, 0, 0, 0, 1, 1,
-0.3983703, 0.5298411, -0.8317966, 0, 0, 0, 1, 1,
-0.3973997, -0.6059046, -2.607616, 0, 0, 0, 1, 1,
-0.3950529, -0.3105437, -4.043959, 0, 0, 0, 1, 1,
-0.3921809, -0.07326122, -2.394317, 0, 0, 0, 1, 1,
-0.3919856, -0.03398795, -0.7288643, 0, 0, 0, 1, 1,
-0.3905235, 0.06516536, -1.338239, 0, 0, 0, 1, 1,
-0.3870586, -1.894731, -4.090906, 1, 1, 1, 1, 1,
-0.387055, -0.608052, -2.092651, 1, 1, 1, 1, 1,
-0.3867555, -0.9245284, -2.276263, 1, 1, 1, 1, 1,
-0.3859849, -0.08164386, -1.948089, 1, 1, 1, 1, 1,
-0.3793247, -1.902405, -2.505428, 1, 1, 1, 1, 1,
-0.3739888, 0.7980887, -0.3242413, 1, 1, 1, 1, 1,
-0.3734319, 1.453621, -0.07869368, 1, 1, 1, 1, 1,
-0.3710342, -0.8349095, -4.339614, 1, 1, 1, 1, 1,
-0.3620054, -0.3385877, -2.526373, 1, 1, 1, 1, 1,
-0.3607449, 0.8073737, -0.6056518, 1, 1, 1, 1, 1,
-0.3570939, -0.9281389, -3.358246, 1, 1, 1, 1, 1,
-0.3554078, -0.6803769, -2.110471, 1, 1, 1, 1, 1,
-0.3549242, -0.02844585, -0.7252296, 1, 1, 1, 1, 1,
-0.3508331, 0.3301268, -0.6396171, 1, 1, 1, 1, 1,
-0.349531, -2.31093, -3.868283, 1, 1, 1, 1, 1,
-0.3400967, 0.8543716, 0.6828911, 0, 0, 1, 1, 1,
-0.339729, 0.9239347, -1.160487, 1, 0, 0, 1, 1,
-0.3337719, -0.8330322, -2.753059, 1, 0, 0, 1, 1,
-0.330308, 0.2239584, -0.9222736, 1, 0, 0, 1, 1,
-0.3288341, 0.7435421, -1.330413, 1, 0, 0, 1, 1,
-0.3217407, -0.8619952, -2.449234, 1, 0, 0, 1, 1,
-0.3205259, -0.212235, -2.842939, 0, 0, 0, 1, 1,
-0.316294, -1.804527, -3.647971, 0, 0, 0, 1, 1,
-0.3143171, 0.06934106, -0.6598608, 0, 0, 0, 1, 1,
-0.3015188, 0.2278104, -1.575694, 0, 0, 0, 1, 1,
-0.2967364, 1.793138, 1.410623, 0, 0, 0, 1, 1,
-0.296205, -1.069391, -2.737732, 0, 0, 0, 1, 1,
-0.2936093, 0.03364422, -2.355926, 0, 0, 0, 1, 1,
-0.2925951, -0.7567356, -2.327408, 1, 1, 1, 1, 1,
-0.2905311, 0.4044658, -0.1892847, 1, 1, 1, 1, 1,
-0.2893115, 1.072775, -0.169633, 1, 1, 1, 1, 1,
-0.287455, -1.374512, -0.7413795, 1, 1, 1, 1, 1,
-0.2839929, 1.941637, 0.5923406, 1, 1, 1, 1, 1,
-0.2824005, -0.6439914, -5.053793, 1, 1, 1, 1, 1,
-0.2785696, -0.241818, -1.813344, 1, 1, 1, 1, 1,
-0.2778208, -0.3948917, -3.56635, 1, 1, 1, 1, 1,
-0.2759117, 0.003233928, -4.033923, 1, 1, 1, 1, 1,
-0.2758889, -0.08499149, -2.465096, 1, 1, 1, 1, 1,
-0.2739229, -0.3084773, -3.373483, 1, 1, 1, 1, 1,
-0.2722817, 0.7528228, 1.362344, 1, 1, 1, 1, 1,
-0.2719121, 0.5029155, -0.8195734, 1, 1, 1, 1, 1,
-0.2647415, 0.5149351, -0.6490483, 1, 1, 1, 1, 1,
-0.2645822, 0.01102742, -2.133303, 1, 1, 1, 1, 1,
-0.2556181, 0.2004456, -0.748054, 0, 0, 1, 1, 1,
-0.2538996, -0.1067369, -1.973409, 1, 0, 0, 1, 1,
-0.2529094, 1.430931, 0.6054987, 1, 0, 0, 1, 1,
-0.2514699, 0.4256695, -0.2162598, 1, 0, 0, 1, 1,
-0.2440503, -0.5006577, -1.613351, 1, 0, 0, 1, 1,
-0.2401264, 0.8837609, -0.3334982, 1, 0, 0, 1, 1,
-0.2383448, -0.4631968, -1.850035, 0, 0, 0, 1, 1,
-0.2320719, 0.9712224, 1.245324, 0, 0, 0, 1, 1,
-0.2233751, 0.1320137, -1.24829, 0, 0, 0, 1, 1,
-0.2139174, 0.3265125, 0.5448784, 0, 0, 0, 1, 1,
-0.2131643, -0.3557265, -3.142282, 0, 0, 0, 1, 1,
-0.2113718, 0.04075349, -0.9826636, 0, 0, 0, 1, 1,
-0.2071579, 0.09738357, -0.2033821, 0, 0, 0, 1, 1,
-0.2069967, -1.336223, -4.443894, 1, 1, 1, 1, 1,
-0.203206, 1.104269, 0.8243173, 1, 1, 1, 1, 1,
-0.202975, 1.48725, 0.106536, 1, 1, 1, 1, 1,
-0.2026821, 1.096758, -0.6012794, 1, 1, 1, 1, 1,
-0.2003963, -0.7127661, -5.399276, 1, 1, 1, 1, 1,
-0.199546, 0.3110246, -1.077064, 1, 1, 1, 1, 1,
-0.1976195, 0.2359441, -2.417264, 1, 1, 1, 1, 1,
-0.1944995, -0.625605, -3.249087, 1, 1, 1, 1, 1,
-0.1932231, -0.8778956, -3.304882, 1, 1, 1, 1, 1,
-0.1912718, 0.7830186, 1.054617, 1, 1, 1, 1, 1,
-0.1910166, -0.8978425, -2.627485, 1, 1, 1, 1, 1,
-0.188932, 0.009076732, -2.253394, 1, 1, 1, 1, 1,
-0.1803642, 1.269664, 1.376976, 1, 1, 1, 1, 1,
-0.175829, 0.07577761, -0.4353914, 1, 1, 1, 1, 1,
-0.1746925, -1.052366, -1.295189, 1, 1, 1, 1, 1,
-0.1737903, 0.003261769, -2.624471, 0, 0, 1, 1, 1,
-0.1726312, -1.256166, -2.763361, 1, 0, 0, 1, 1,
-0.1669832, 0.3580792, -0.7792217, 1, 0, 0, 1, 1,
-0.1665985, -1.594469, -2.258277, 1, 0, 0, 1, 1,
-0.1652831, -0.8208213, -2.434967, 1, 0, 0, 1, 1,
-0.1648253, 0.002157741, -2.54845, 1, 0, 0, 1, 1,
-0.1629966, 0.006260345, -1.575779, 0, 0, 0, 1, 1,
-0.1629704, -0.218468, -2.440165, 0, 0, 0, 1, 1,
-0.1628579, 0.8693049, -1.378921, 0, 0, 0, 1, 1,
-0.1627306, 1.039597, 1.27656, 0, 0, 0, 1, 1,
-0.1620489, 0.7530156, 0.2730871, 0, 0, 0, 1, 1,
-0.1601878, -0.5949295, -2.048656, 0, 0, 0, 1, 1,
-0.1506371, -1.089439, -3.257676, 0, 0, 0, 1, 1,
-0.1503413, 0.4653473, -0.4968241, 1, 1, 1, 1, 1,
-0.1501995, 0.05938132, 0.5933483, 1, 1, 1, 1, 1,
-0.1489554, 1.136568, 0.07753358, 1, 1, 1, 1, 1,
-0.1480145, -0.2156115, -3.277433, 1, 1, 1, 1, 1,
-0.1479382, 1.85667, -0.2656782, 1, 1, 1, 1, 1,
-0.1408154, 0.2877374, -0.1243828, 1, 1, 1, 1, 1,
-0.1400346, -1.594787, -2.92845, 1, 1, 1, 1, 1,
-0.1379793, 1.641984, 1.153275, 1, 1, 1, 1, 1,
-0.133678, 0.03166441, -1.845719, 1, 1, 1, 1, 1,
-0.1316779, 2.05549, -0.3512746, 1, 1, 1, 1, 1,
-0.1287138, -1.749779, -4.150193, 1, 1, 1, 1, 1,
-0.1286487, -0.9826895, -4.245594, 1, 1, 1, 1, 1,
-0.1276476, -2.122731, -2.131325, 1, 1, 1, 1, 1,
-0.1269172, 0.1106281, 0.9111466, 1, 1, 1, 1, 1,
-0.1231861, 1.158961, -0.9750187, 1, 1, 1, 1, 1,
-0.1166017, -0.2975968, -2.288707, 0, 0, 1, 1, 1,
-0.1045087, -1.302523, -3.584267, 1, 0, 0, 1, 1,
-0.1042159, 0.6994745, 0.3270073, 1, 0, 0, 1, 1,
-0.1030035, -0.8393012, -3.518271, 1, 0, 0, 1, 1,
-0.09888701, -1.017679, -3.051373, 1, 0, 0, 1, 1,
-0.08993768, 0.4448772, 0.5477659, 1, 0, 0, 1, 1,
-0.08865581, -0.4502678, -3.55108, 0, 0, 0, 1, 1,
-0.08806001, 0.665384, -1.003197, 0, 0, 0, 1, 1,
-0.08773184, -0.8056679, -3.26623, 0, 0, 0, 1, 1,
-0.08503034, -0.826972, -3.194237, 0, 0, 0, 1, 1,
-0.08147938, 0.8631192, 0.205983, 0, 0, 0, 1, 1,
-0.0787295, 1.445002, 1.519524, 0, 0, 0, 1, 1,
-0.07814103, 0.3652362, 0.4650322, 0, 0, 0, 1, 1,
-0.07684553, -1.137623, -3.205518, 1, 1, 1, 1, 1,
-0.07369038, 0.08509601, 0.09246369, 1, 1, 1, 1, 1,
-0.07360312, -0.31089, -2.779803, 1, 1, 1, 1, 1,
-0.07298604, 1.027064, -0.3764504, 1, 1, 1, 1, 1,
-0.07156779, 0.6731231, 0.2701989, 1, 1, 1, 1, 1,
-0.07144641, -0.1942421, -1.975846, 1, 1, 1, 1, 1,
-0.07076543, 0.7018399, 0.808556, 1, 1, 1, 1, 1,
-0.06907624, -0.4164652, -2.475132, 1, 1, 1, 1, 1,
-0.0671468, -0.2335332, -2.711953, 1, 1, 1, 1, 1,
-0.05787972, 2.18263, -1.466969, 1, 1, 1, 1, 1,
-0.05755128, -1.119762, -2.446453, 1, 1, 1, 1, 1,
-0.05597821, -0.6046386, -3.301742, 1, 1, 1, 1, 1,
-0.05518377, 0.4063235, 0.7123806, 1, 1, 1, 1, 1,
-0.053596, 1.127048, 0.5370554, 1, 1, 1, 1, 1,
-0.0365385, 1.166706, -0.390225, 1, 1, 1, 1, 1,
-0.0359372, 0.2338181, 0.9101357, 0, 0, 1, 1, 1,
-0.03483832, -0.5178028, -2.542468, 1, 0, 0, 1, 1,
-0.03317611, 0.804414, -0.002644992, 1, 0, 0, 1, 1,
-0.03070853, -0.4220078, -2.213267, 1, 0, 0, 1, 1,
-0.02532906, 1.974748, 0.6843657, 1, 0, 0, 1, 1,
-0.02129314, -1.349292, -4.64759, 1, 0, 0, 1, 1,
-0.020756, 0.1593724, 1.326606, 0, 0, 0, 1, 1,
-0.01843265, 0.3485186, 0.6841168, 0, 0, 0, 1, 1,
-0.01786449, -0.05307414, -4.388094, 0, 0, 0, 1, 1,
-0.01664569, -0.8296615, -1.9122, 0, 0, 0, 1, 1,
-0.01596269, 0.5253872, -0.361041, 0, 0, 0, 1, 1,
-0.0116109, 0.490134, -0.5912436, 0, 0, 0, 1, 1,
-0.009375536, 0.6866989, 1.209526, 0, 0, 0, 1, 1,
-0.005974873, -0.6723725, -3.982283, 1, 1, 1, 1, 1,
-0.003426561, 0.09271552, -1.331423, 1, 1, 1, 1, 1,
0.0009007534, -1.078448, 1.87679, 1, 1, 1, 1, 1,
0.004305809, -0.8185274, 2.448092, 1, 1, 1, 1, 1,
0.005853024, -1.517071, 4.325119, 1, 1, 1, 1, 1,
0.00919605, 0.04069405, -0.5785043, 1, 1, 1, 1, 1,
0.01282536, -0.4697212, 3.286817, 1, 1, 1, 1, 1,
0.01432394, 0.2335115, -0.6023977, 1, 1, 1, 1, 1,
0.01491266, -0.326287, 3.180238, 1, 1, 1, 1, 1,
0.01817194, -2.065388, 3.443849, 1, 1, 1, 1, 1,
0.01986263, 0.8121258, 0.6733604, 1, 1, 1, 1, 1,
0.02425387, 0.1372982, -1.000738, 1, 1, 1, 1, 1,
0.02806808, -1.083288, 2.909733, 1, 1, 1, 1, 1,
0.02856807, -0.5124335, 3.754963, 1, 1, 1, 1, 1,
0.03546018, 0.2581508, -0.7920783, 1, 1, 1, 1, 1,
0.03558034, 0.5360446, 1.22647, 0, 0, 1, 1, 1,
0.04140471, -1.441517, 2.151538, 1, 0, 0, 1, 1,
0.04658497, 0.02752277, -1.22631, 1, 0, 0, 1, 1,
0.0498099, 0.6278766, 0.4177855, 1, 0, 0, 1, 1,
0.05182732, -0.3725942, 2.549568, 1, 0, 0, 1, 1,
0.05254447, -0.8224913, 2.372365, 1, 0, 0, 1, 1,
0.05320697, -0.2847499, 2.046994, 0, 0, 0, 1, 1,
0.05680556, -0.02293042, 1.752018, 0, 0, 0, 1, 1,
0.05990138, 0.7450839, 0.1180191, 0, 0, 0, 1, 1,
0.06018146, 1.780447, 0.4478356, 0, 0, 0, 1, 1,
0.06125436, -1.818133, 2.845541, 0, 0, 0, 1, 1,
0.06352204, -0.4450204, 3.804029, 0, 0, 0, 1, 1,
0.06504986, 0.2858814, 1.044997, 0, 0, 0, 1, 1,
0.07063131, -1.592773, 1.85465, 1, 1, 1, 1, 1,
0.07131067, 0.5047309, 0.5613425, 1, 1, 1, 1, 1,
0.07727093, -1.012538, 4.579044, 1, 1, 1, 1, 1,
0.07906364, 0.925992, 0.6729432, 1, 1, 1, 1, 1,
0.07957589, 0.02838055, 0.295789, 1, 1, 1, 1, 1,
0.08679388, 0.4949442, -2.562426, 1, 1, 1, 1, 1,
0.09251558, 1.581556, -0.1333771, 1, 1, 1, 1, 1,
0.09266315, -0.7931213, 4.00582, 1, 1, 1, 1, 1,
0.09496288, -1.727357, 3.407759, 1, 1, 1, 1, 1,
0.09519538, -1.602134, 3.015108, 1, 1, 1, 1, 1,
0.1003168, -0.4826892, 1.307506, 1, 1, 1, 1, 1,
0.1006979, 0.7079753, -0.506231, 1, 1, 1, 1, 1,
0.1065168, 0.9265398, -0.0831584, 1, 1, 1, 1, 1,
0.1076519, -2.042385, 0.905183, 1, 1, 1, 1, 1,
0.1139798, -0.275841, 0.363702, 1, 1, 1, 1, 1,
0.1194274, -0.2474649, 3.631651, 0, 0, 1, 1, 1,
0.1220583, 2.233378, -1.688003, 1, 0, 0, 1, 1,
0.1264075, -1.059649, 2.929353, 1, 0, 0, 1, 1,
0.1276785, -0.5631754, 1.815811, 1, 0, 0, 1, 1,
0.1318643, 1.084139, 1.23029, 1, 0, 0, 1, 1,
0.1318702, -1.691836, 3.110223, 1, 0, 0, 1, 1,
0.1334493, -0.9051406, 2.731797, 0, 0, 0, 1, 1,
0.1344248, 0.04619868, 1.180059, 0, 0, 0, 1, 1,
0.137742, -0.949168, 3.536251, 0, 0, 0, 1, 1,
0.1381836, 1.036329, 1.034216, 0, 0, 0, 1, 1,
0.1383767, 1.046548, 0.6038985, 0, 0, 0, 1, 1,
0.1405592, 1.159959, -0.8785931, 0, 0, 0, 1, 1,
0.1452889, 1.360932, 0.6644474, 0, 0, 0, 1, 1,
0.1485, 0.2794548, 1.042137, 1, 1, 1, 1, 1,
0.1493303, -0.1932456, 1.400343, 1, 1, 1, 1, 1,
0.1535404, 0.8222826, -0.5259057, 1, 1, 1, 1, 1,
0.1567921, 0.5198089, 1.271641, 1, 1, 1, 1, 1,
0.1587538, 0.5718213, 0.1947124, 1, 1, 1, 1, 1,
0.1596637, 0.3984447, 0.8114299, 1, 1, 1, 1, 1,
0.1622539, 1.265625, -0.6015747, 1, 1, 1, 1, 1,
0.1646393, 0.4621472, -0.3514724, 1, 1, 1, 1, 1,
0.1669892, 0.9895149, 0.1970914, 1, 1, 1, 1, 1,
0.1674545, -0.219989, 2.741696, 1, 1, 1, 1, 1,
0.1698025, 0.09429673, -0.03584107, 1, 1, 1, 1, 1,
0.1698397, -0.7289004, 2.483271, 1, 1, 1, 1, 1,
0.1700089, -0.3359627, 4.058273, 1, 1, 1, 1, 1,
0.1726495, 0.1911699, 0.3718511, 1, 1, 1, 1, 1,
0.1731344, -0.9183152, 3.748819, 1, 1, 1, 1, 1,
0.1740787, 1.375502, 0.3910902, 0, 0, 1, 1, 1,
0.175478, 0.6936073, 1.581491, 1, 0, 0, 1, 1,
0.1767756, -0.00655289, 0.2775101, 1, 0, 0, 1, 1,
0.1770891, 1.160701, -0.2124212, 1, 0, 0, 1, 1,
0.1776791, -0.9114401, 2.068245, 1, 0, 0, 1, 1,
0.1799131, -1.321639, 3.049198, 1, 0, 0, 1, 1,
0.1802107, -1.57266, 3.442483, 0, 0, 0, 1, 1,
0.1802317, -0.2863535, 0.5169809, 0, 0, 0, 1, 1,
0.1911353, 1.131189, -0.3563821, 0, 0, 0, 1, 1,
0.1912531, 0.04312891, 0.7157096, 0, 0, 0, 1, 1,
0.1934308, 1.081858, -0.3169935, 0, 0, 0, 1, 1,
0.1960396, -0.8682971, 2.897898, 0, 0, 0, 1, 1,
0.1970704, -0.8845051, 3.69059, 0, 0, 0, 1, 1,
0.1978043, -0.655081, 2.016879, 1, 1, 1, 1, 1,
0.1986223, 2.206782, 0.4852597, 1, 1, 1, 1, 1,
0.1996391, -0.5015511, 2.903778, 1, 1, 1, 1, 1,
0.2047199, 0.3855781, 1.072002, 1, 1, 1, 1, 1,
0.2069692, 0.3341914, 1.613363, 1, 1, 1, 1, 1,
0.2073578, 0.6730638, -0.1387961, 1, 1, 1, 1, 1,
0.2103521, 0.2454861, 2.514759, 1, 1, 1, 1, 1,
0.2104291, -0.02226685, 3.250446, 1, 1, 1, 1, 1,
0.2121038, 0.4954911, 0.5228255, 1, 1, 1, 1, 1,
0.2157692, 0.7964851, 1.226789, 1, 1, 1, 1, 1,
0.2172123, 0.5546888, 0.4586999, 1, 1, 1, 1, 1,
0.2248867, -0.3560281, 3.858591, 1, 1, 1, 1, 1,
0.2268224, 1.130683, 0.529987, 1, 1, 1, 1, 1,
0.2325562, 0.6735553, -0.1865414, 1, 1, 1, 1, 1,
0.2336722, -0.07292825, 0.743692, 1, 1, 1, 1, 1,
0.2380716, 0.3041293, 1.081197, 0, 0, 1, 1, 1,
0.2395211, -0.4993367, 2.708594, 1, 0, 0, 1, 1,
0.244073, 0.053444, 1.50939, 1, 0, 0, 1, 1,
0.2446515, -1.310331, 2.097725, 1, 0, 0, 1, 1,
0.2467677, -0.1609698, 2.249636, 1, 0, 0, 1, 1,
0.2607683, -2.393992, 3.038139, 1, 0, 0, 1, 1,
0.262982, -0.6640208, 3.457715, 0, 0, 0, 1, 1,
0.2639863, 1.47112, 2.342657, 0, 0, 0, 1, 1,
0.2659938, 1.834626, 0.2066128, 0, 0, 0, 1, 1,
0.2686785, 0.2922612, -0.02175558, 0, 0, 0, 1, 1,
0.2711796, -0.3331862, 1.277113, 0, 0, 0, 1, 1,
0.2727911, 1.026027, 1.542658, 0, 0, 0, 1, 1,
0.2747949, -0.0355017, 0.9413294, 0, 0, 0, 1, 1,
0.2767272, 0.14031, -0.1453796, 1, 1, 1, 1, 1,
0.2767675, 0.2392168, 1.08368, 1, 1, 1, 1, 1,
0.2803285, -1.590748, 2.25675, 1, 1, 1, 1, 1,
0.2815657, -1.431758, 1.479774, 1, 1, 1, 1, 1,
0.2816764, 1.04537, 1.792227, 1, 1, 1, 1, 1,
0.2830895, -0.6990975, 2.416549, 1, 1, 1, 1, 1,
0.2838374, 0.3536897, 0.5136144, 1, 1, 1, 1, 1,
0.287818, -1.641915, 3.150785, 1, 1, 1, 1, 1,
0.2878765, -0.5178999, 2.241532, 1, 1, 1, 1, 1,
0.2887706, 0.3570454, 0.8495296, 1, 1, 1, 1, 1,
0.2899456, 0.8717349, 0.5235432, 1, 1, 1, 1, 1,
0.2915181, 0.4739344, -0.7275558, 1, 1, 1, 1, 1,
0.2958081, -0.2614658, -0.7891641, 1, 1, 1, 1, 1,
0.2959942, 0.964292, 0.9070781, 1, 1, 1, 1, 1,
0.2990014, 0.337571, -0.1206056, 1, 1, 1, 1, 1,
0.2992635, 1.757617, 0.4564994, 0, 0, 1, 1, 1,
0.3037066, 0.4656214, 2.030785, 1, 0, 0, 1, 1,
0.3048863, -1.826238, 4.122595, 1, 0, 0, 1, 1,
0.3075066, -1.124678, 2.995571, 1, 0, 0, 1, 1,
0.3179669, 0.08379108, 1.022403, 1, 0, 0, 1, 1,
0.3197997, 1.104784, 1.554389, 1, 0, 0, 1, 1,
0.3271055, -1.759124, 3.187952, 0, 0, 0, 1, 1,
0.330094, 2.218215, 1.113232, 0, 0, 0, 1, 1,
0.330503, 2.589405, 0.8246093, 0, 0, 0, 1, 1,
0.333989, 0.565003, 0.463475, 0, 0, 0, 1, 1,
0.3390035, -0.6211625, 1.389288, 0, 0, 0, 1, 1,
0.3476083, 1.036546, 0.08369062, 0, 0, 0, 1, 1,
0.3553202, 0.5183871, 1.414553, 0, 0, 0, 1, 1,
0.3556249, -1.510695, 1.243868, 1, 1, 1, 1, 1,
0.3593855, -0.001488765, 1.575891, 1, 1, 1, 1, 1,
0.3607484, 0.5770618, 1.297249, 1, 1, 1, 1, 1,
0.3625638, -0.2538627, 3.244328, 1, 1, 1, 1, 1,
0.3626581, -0.735491, 1.603415, 1, 1, 1, 1, 1,
0.3649204, -0.2734988, 1.804211, 1, 1, 1, 1, 1,
0.3666737, -0.9603623, 1.69417, 1, 1, 1, 1, 1,
0.3692763, -0.3929636, 2.161907, 1, 1, 1, 1, 1,
0.3713469, 0.005571843, 2.550807, 1, 1, 1, 1, 1,
0.3721365, -0.3255617, 2.768129, 1, 1, 1, 1, 1,
0.3768786, 1.005774, 0.4359041, 1, 1, 1, 1, 1,
0.377297, -0.7376136, 1.379963, 1, 1, 1, 1, 1,
0.3794996, 0.2914126, 1.212974, 1, 1, 1, 1, 1,
0.3814616, 0.1534021, 0.6345518, 1, 1, 1, 1, 1,
0.3853618, 0.2311401, 2.080731, 1, 1, 1, 1, 1,
0.3862547, 1.275671, -0.365061, 0, 0, 1, 1, 1,
0.3884158, -0.9512182, 2.974451, 1, 0, 0, 1, 1,
0.3949958, -0.2639371, 0.7267545, 1, 0, 0, 1, 1,
0.3966977, 1.619539, -0.2909616, 1, 0, 0, 1, 1,
0.398435, 0.9500734, 1.198687, 1, 0, 0, 1, 1,
0.4026732, -0.3262127, 4.956871, 1, 0, 0, 1, 1,
0.4032522, -1.116817, 3.706702, 0, 0, 0, 1, 1,
0.4033559, 0.4166878, -0.1011378, 0, 0, 0, 1, 1,
0.4041111, 0.3068972, 0.6681744, 0, 0, 0, 1, 1,
0.4041912, 2.157158, 2.056782, 0, 0, 0, 1, 1,
0.404962, -0.1912159, 0.8724759, 0, 0, 0, 1, 1,
0.4063617, -1.789165, 2.104957, 0, 0, 0, 1, 1,
0.4078426, 1.036426, 0.6817706, 0, 0, 0, 1, 1,
0.4085517, -0.88915, 2.313798, 1, 1, 1, 1, 1,
0.4112897, -0.7791026, 2.458281, 1, 1, 1, 1, 1,
0.4114397, -0.01495922, 1.301467, 1, 1, 1, 1, 1,
0.4116736, -0.4408854, 3.858235, 1, 1, 1, 1, 1,
0.4138793, -0.3767311, 1.682532, 1, 1, 1, 1, 1,
0.4176067, -0.2688798, 3.860671, 1, 1, 1, 1, 1,
0.4181471, -0.3818355, 2.519172, 1, 1, 1, 1, 1,
0.4201311, -2.842008, 3.105857, 1, 1, 1, 1, 1,
0.4244054, -0.5091437, 3.246533, 1, 1, 1, 1, 1,
0.4249218, -0.5975422, 3.051975, 1, 1, 1, 1, 1,
0.4263559, 0.2787669, 1.114203, 1, 1, 1, 1, 1,
0.4273094, 0.100116, 0.2884153, 1, 1, 1, 1, 1,
0.4276324, 1.200476, 0.210905, 1, 1, 1, 1, 1,
0.4295922, -0.5905573, 2.049387, 1, 1, 1, 1, 1,
0.4336175, 0.2900029, 1.730357, 1, 1, 1, 1, 1,
0.434732, -0.8097272, 4.573915, 0, 0, 1, 1, 1,
0.4382365, -0.5210853, 1.869831, 1, 0, 0, 1, 1,
0.4446568, 0.8278387, -0.9555306, 1, 0, 0, 1, 1,
0.4454952, 0.4569222, -1.800838, 1, 0, 0, 1, 1,
0.4469663, -0.2523592, 2.155731, 1, 0, 0, 1, 1,
0.4478883, 0.16355, 0.7097386, 1, 0, 0, 1, 1,
0.4495697, -1.119451, 1.877968, 0, 0, 0, 1, 1,
0.4521296, 0.1102453, 1.838802, 0, 0, 0, 1, 1,
0.4546453, -0.825841, 2.955616, 0, 0, 0, 1, 1,
0.4558692, -0.7793006, 1.724316, 0, 0, 0, 1, 1,
0.4602339, -0.105217, 1.728984, 0, 0, 0, 1, 1,
0.4639288, 1.293314, 0.1347854, 0, 0, 0, 1, 1,
0.4674415, -0.1394092, 1.591332, 0, 0, 0, 1, 1,
0.4679717, 1.307209, 0.6486356, 1, 1, 1, 1, 1,
0.4701805, 1.181319, 0.1310275, 1, 1, 1, 1, 1,
0.4725032, -1.25897, 2.609296, 1, 1, 1, 1, 1,
0.4775924, 0.7690302, 0.8315594, 1, 1, 1, 1, 1,
0.4778311, -0.191035, 2.605575, 1, 1, 1, 1, 1,
0.479661, -0.5783825, 2.29288, 1, 1, 1, 1, 1,
0.4798189, 2.299504, 0.5007246, 1, 1, 1, 1, 1,
0.4811928, -1.942258, 2.658787, 1, 1, 1, 1, 1,
0.4823601, 0.413922, 1.265212, 1, 1, 1, 1, 1,
0.482913, -0.8376408, 3.980232, 1, 1, 1, 1, 1,
0.4851542, 0.135156, 1.824219, 1, 1, 1, 1, 1,
0.48731, 0.8121653, 0.5994746, 1, 1, 1, 1, 1,
0.4887031, 1.965108, -0.01846578, 1, 1, 1, 1, 1,
0.4917922, -2.380068, 3.26272, 1, 1, 1, 1, 1,
0.4918253, -0.03460302, 2.525285, 1, 1, 1, 1, 1,
0.4974456, -0.01438197, 1.493012, 0, 0, 1, 1, 1,
0.5005915, 1.414318, -0.6908124, 1, 0, 0, 1, 1,
0.5101112, -0.144486, 2.015445, 1, 0, 0, 1, 1,
0.5128102, 0.762301, -0.5230503, 1, 0, 0, 1, 1,
0.5180922, 1.392643, -0.01012319, 1, 0, 0, 1, 1,
0.5218799, -0.7992745, 1.616646, 1, 0, 0, 1, 1,
0.5219281, 1.357534, 0.4731072, 0, 0, 0, 1, 1,
0.5225249, -0.6730696, 2.251313, 0, 0, 0, 1, 1,
0.5245317, -1.744163, 1.902647, 0, 0, 0, 1, 1,
0.5246903, -1.005406, 3.498829, 0, 0, 0, 1, 1,
0.5345333, -0.5063236, 1.088081, 0, 0, 0, 1, 1,
0.5354768, -0.8896203, 3.58043, 0, 0, 0, 1, 1,
0.5481298, 1.318932, 1.130215, 0, 0, 0, 1, 1,
0.5483887, 0.7830657, 0.6065159, 1, 1, 1, 1, 1,
0.5499081, -1.458978, 2.934202, 1, 1, 1, 1, 1,
0.5597444, 0.553444, 2.116878, 1, 1, 1, 1, 1,
0.5616685, 0.2901234, 1.172485, 1, 1, 1, 1, 1,
0.5631115, 0.2805235, 1.175602, 1, 1, 1, 1, 1,
0.5670142, 0.2689005, 0.6049618, 1, 1, 1, 1, 1,
0.5675496, -0.1310598, 1.480888, 1, 1, 1, 1, 1,
0.5680826, 1.953473, 0.02450446, 1, 1, 1, 1, 1,
0.5704076, 0.7342308, -0.3094662, 1, 1, 1, 1, 1,
0.5751634, -0.9167048, 1.836438, 1, 1, 1, 1, 1,
0.5773832, -0.2332366, 1.801449, 1, 1, 1, 1, 1,
0.5782019, -0.6408107, 1.968449, 1, 1, 1, 1, 1,
0.5790959, 0.01523309, 1.450875, 1, 1, 1, 1, 1,
0.5814496, 1.327526, -0.7746295, 1, 1, 1, 1, 1,
0.5820327, -1.570397, 3.679497, 1, 1, 1, 1, 1,
0.5822953, 0.04676534, 3.163584, 0, 0, 1, 1, 1,
0.5833977, -0.3401712, 0.9222593, 1, 0, 0, 1, 1,
0.5835963, 1.026142, 0.83711, 1, 0, 0, 1, 1,
0.584634, -0.5118422, 2.853148, 1, 0, 0, 1, 1,
0.5851187, 2.050501, 1.299226, 1, 0, 0, 1, 1,
0.5852755, -0.3243234, 0.6476129, 1, 0, 0, 1, 1,
0.5870398, -0.240308, -0.3731902, 0, 0, 0, 1, 1,
0.5943634, -1.486239, 3.031668, 0, 0, 0, 1, 1,
0.596199, 0.7005908, 1.026801, 0, 0, 0, 1, 1,
0.6040946, -1.498237, 1.569589, 0, 0, 0, 1, 1,
0.606183, 0.2342949, 2.566921, 0, 0, 0, 1, 1,
0.6097122, 0.6336147, 1.271142, 0, 0, 0, 1, 1,
0.6118345, -0.2289417, 1.733285, 0, 0, 0, 1, 1,
0.6175621, 0.6936479, 1.451506, 1, 1, 1, 1, 1,
0.6186612, 0.1402951, 0.6837732, 1, 1, 1, 1, 1,
0.6207218, 0.07259053, 1.262482, 1, 1, 1, 1, 1,
0.6223939, 0.4483129, -1.079732, 1, 1, 1, 1, 1,
0.6236708, 0.2302783, 1.391201, 1, 1, 1, 1, 1,
0.6239105, -1.906768, 3.227074, 1, 1, 1, 1, 1,
0.6257404, -0.1379476, 2.021056, 1, 1, 1, 1, 1,
0.6294348, -0.04588883, 2.165108, 1, 1, 1, 1, 1,
0.6322986, 0.5372941, 0.7121554, 1, 1, 1, 1, 1,
0.6388996, 0.4894621, 1.233391, 1, 1, 1, 1, 1,
0.6397376, -1.926219, 3.434602, 1, 1, 1, 1, 1,
0.6400298, -1.87594, 4.488656, 1, 1, 1, 1, 1,
0.6456014, -0.3259869, 0.8871239, 1, 1, 1, 1, 1,
0.6477536, -0.9973931, 1.63257, 1, 1, 1, 1, 1,
0.6500624, 1.140497, -0.6696405, 1, 1, 1, 1, 1,
0.6503468, -0.6164204, 2.403161, 0, 0, 1, 1, 1,
0.6520364, -1.150332, 2.70711, 1, 0, 0, 1, 1,
0.6521756, 0.2693278, 0.1011869, 1, 0, 0, 1, 1,
0.653877, 1.204713, 0.9806997, 1, 0, 0, 1, 1,
0.6612382, 0.8721104, 1.222804, 1, 0, 0, 1, 1,
0.6671663, -0.5100211, 2.775307, 1, 0, 0, 1, 1,
0.6687353, -0.6928723, 0.482938, 0, 0, 0, 1, 1,
0.6694159, 0.03012868, 1.319846, 0, 0, 0, 1, 1,
0.6705769, -0.7445047, 1.934495, 0, 0, 0, 1, 1,
0.67398, 0.690465, 0.7214467, 0, 0, 0, 1, 1,
0.6755196, -1.405187, 4.706157, 0, 0, 0, 1, 1,
0.6757883, -0.8307775, 1.414499, 0, 0, 0, 1, 1,
0.6817621, 1.357223, -0.4244667, 0, 0, 0, 1, 1,
0.6833715, -0.2771758, 1.320498, 1, 1, 1, 1, 1,
0.6838949, 0.2539886, 1.940634, 1, 1, 1, 1, 1,
0.6855025, 0.4536647, 0.9808336, 1, 1, 1, 1, 1,
0.6865771, -0.2049554, 0.5631486, 1, 1, 1, 1, 1,
0.687528, 1.208444, -0.02333843, 1, 1, 1, 1, 1,
0.6899055, 0.8558642, 2.472108, 1, 1, 1, 1, 1,
0.6957229, -0.104383, 1.773335, 1, 1, 1, 1, 1,
0.6965215, -0.7784026, 2.037365, 1, 1, 1, 1, 1,
0.7027497, 0.5607846, 0.7019281, 1, 1, 1, 1, 1,
0.7071878, 0.6305628, 0.3771452, 1, 1, 1, 1, 1,
0.7080465, -0.8063899, 2.622965, 1, 1, 1, 1, 1,
0.7086749, 1.198752, -0.3081895, 1, 1, 1, 1, 1,
0.709193, 0.3118542, 0.7510542, 1, 1, 1, 1, 1,
0.7107744, 0.5173134, 1.771106, 1, 1, 1, 1, 1,
0.715343, -0.6079423, 2.071171, 1, 1, 1, 1, 1,
0.7187054, 1.776866, -0.110578, 0, 0, 1, 1, 1,
0.7207008, 0.5152826, -1.027602, 1, 0, 0, 1, 1,
0.724538, 0.364217, 1.408543, 1, 0, 0, 1, 1,
0.729862, -1.786877, 2.221511, 1, 0, 0, 1, 1,
0.732406, -0.1340994, 1.603745, 1, 0, 0, 1, 1,
0.7391987, -0.4479937, 2.16273, 1, 0, 0, 1, 1,
0.7426301, -0.9365579, 4.389263, 0, 0, 0, 1, 1,
0.7432302, 0.1289769, 0.05807675, 0, 0, 0, 1, 1,
0.7435676, -0.02638386, 1.689776, 0, 0, 0, 1, 1,
0.7523214, -0.5509715, 2.342727, 0, 0, 0, 1, 1,
0.7565758, -0.2963505, 0.6930904, 0, 0, 0, 1, 1,
0.7586142, 0.8609264, -0.7641388, 0, 0, 0, 1, 1,
0.7602726, 2.156652, -1.069092, 0, 0, 0, 1, 1,
0.7626602, 0.3053928, 0.5097638, 1, 1, 1, 1, 1,
0.76537, 0.4027689, 1.923949, 1, 1, 1, 1, 1,
0.7683633, 2.023797, -0.6523765, 1, 1, 1, 1, 1,
0.7687311, 0.837257, 0.4577933, 1, 1, 1, 1, 1,
0.7785666, 1.186382, 0.06710445, 1, 1, 1, 1, 1,
0.7809234, -0.1613173, 3.446914, 1, 1, 1, 1, 1,
0.7840075, -1.122618, 3.792911, 1, 1, 1, 1, 1,
0.7905266, -1.635666, 1.755301, 1, 1, 1, 1, 1,
0.790845, -1.715077, 4.741663, 1, 1, 1, 1, 1,
0.7957164, 1.149915, -0.3113385, 1, 1, 1, 1, 1,
0.7975788, 1.38634, 0.5300389, 1, 1, 1, 1, 1,
0.7986109, -0.8172123, 2.252425, 1, 1, 1, 1, 1,
0.7997699, 0.3530098, 2.255502, 1, 1, 1, 1, 1,
0.8027046, -0.2440316, 1.154921, 1, 1, 1, 1, 1,
0.8032181, -0.2032114, 1.92705, 1, 1, 1, 1, 1,
0.8148608, 0.3029906, 0.2818064, 0, 0, 1, 1, 1,
0.815047, -1.610383, 3.669382, 1, 0, 0, 1, 1,
0.8158083, -0.1333481, 0.7393541, 1, 0, 0, 1, 1,
0.8210645, 2.291116, -0.1100776, 1, 0, 0, 1, 1,
0.8221489, -0.6981492, 3.235663, 1, 0, 0, 1, 1,
0.824517, -0.03039575, 1.358778, 1, 0, 0, 1, 1,
0.8254966, 0.6565293, -0.4136425, 0, 0, 0, 1, 1,
0.8294926, -0.7195811, 3.713701, 0, 0, 0, 1, 1,
0.8298275, -0.03287715, 0.7726188, 0, 0, 0, 1, 1,
0.8333007, 0.0161581, 0.5425819, 0, 0, 0, 1, 1,
0.8339587, 0.890592, 1.557394, 0, 0, 0, 1, 1,
0.8452337, 0.4691041, 0.9415092, 0, 0, 0, 1, 1,
0.8483193, 0.2890007, 1.904939, 0, 0, 0, 1, 1,
0.8515678, -1.689236, 3.261981, 1, 1, 1, 1, 1,
0.862254, 0.3771506, 1.691961, 1, 1, 1, 1, 1,
0.8665417, 0.3288603, 3.299077, 1, 1, 1, 1, 1,
0.8774975, -0.4059911, 2.269633, 1, 1, 1, 1, 1,
0.8812901, 0.04368422, 1.166499, 1, 1, 1, 1, 1,
0.8914262, -1.930915, 2.533669, 1, 1, 1, 1, 1,
0.8936077, -2.433868, 1.657273, 1, 1, 1, 1, 1,
0.9005623, 0.2742468, 2.029392, 1, 1, 1, 1, 1,
0.9009649, -0.6893345, 1.673806, 1, 1, 1, 1, 1,
0.9037911, -0.1311325, 1.387564, 1, 1, 1, 1, 1,
0.90471, -0.9660401, 3.3149, 1, 1, 1, 1, 1,
0.9058399, 1.393137, 3.166604, 1, 1, 1, 1, 1,
0.9080225, -0.7408255, 2.252749, 1, 1, 1, 1, 1,
0.9087577, 0.0577397, 2.174877, 1, 1, 1, 1, 1,
0.9093241, 2.125179, 1.669093, 1, 1, 1, 1, 1,
0.9126939, -0.5215999, 3.381197, 0, 0, 1, 1, 1,
0.9218141, 0.5241828, 0.01911538, 1, 0, 0, 1, 1,
0.9271628, 0.04560612, 0.7357541, 1, 0, 0, 1, 1,
0.9302951, 0.162215, 1.339598, 1, 0, 0, 1, 1,
0.9322263, -1.038855, 2.099246, 1, 0, 0, 1, 1,
0.9370334, 1.486382, 1.661149, 1, 0, 0, 1, 1,
0.9370707, 0.7796884, 0.03802622, 0, 0, 0, 1, 1,
0.9423641, -1.233855, 3.104908, 0, 0, 0, 1, 1,
0.9439142, 0.09592949, 0.991781, 0, 0, 0, 1, 1,
0.9520635, 0.3590833, 0.08791716, 0, 0, 0, 1, 1,
0.9594159, -0.4296907, 1.44865, 0, 0, 0, 1, 1,
0.961262, 2.372046, 1.095864, 0, 0, 0, 1, 1,
0.9618083, 0.3868599, -0.381109, 0, 0, 0, 1, 1,
0.9637204, -1.375586, 2.292338, 1, 1, 1, 1, 1,
0.9662348, -2.079043, 4.425877, 1, 1, 1, 1, 1,
0.9823073, -0.0105267, 1.632351, 1, 1, 1, 1, 1,
0.9851406, -1.922104, 2.433813, 1, 1, 1, 1, 1,
0.995838, 0.1189526, 1.455177, 1, 1, 1, 1, 1,
0.999946, 1.209364, 1.937867, 1, 1, 1, 1, 1,
1.00273, 0.434041, 1.190636, 1, 1, 1, 1, 1,
1.012317, -2.728483, 2.49894, 1, 1, 1, 1, 1,
1.014388, -0.8993241, 3.452781, 1, 1, 1, 1, 1,
1.016087, 0.1487674, 0.4636575, 1, 1, 1, 1, 1,
1.018973, 0.7581962, -0.8206294, 1, 1, 1, 1, 1,
1.022161, -1.135287, 3.450788, 1, 1, 1, 1, 1,
1.022728, 0.5938978, 0.1338553, 1, 1, 1, 1, 1,
1.027811, -0.03433637, 1.155555, 1, 1, 1, 1, 1,
1.029643, 0.145766, 1.549987, 1, 1, 1, 1, 1,
1.031, -0.6029021, 2.077438, 0, 0, 1, 1, 1,
1.03298, -0.1544077, 2.370261, 1, 0, 0, 1, 1,
1.041979, 0.7268106, 2.014706, 1, 0, 0, 1, 1,
1.043289, -1.471727, 1.063767, 1, 0, 0, 1, 1,
1.052806, -0.9851823, 2.961406, 1, 0, 0, 1, 1,
1.05344, 0.8843631, 3.032087, 1, 0, 0, 1, 1,
1.056653, 2.597115, 1.379184, 0, 0, 0, 1, 1,
1.058897, 0.9559636, -1.263974, 0, 0, 0, 1, 1,
1.058951, 1.385615, 0.7165038, 0, 0, 0, 1, 1,
1.060114, -2.184055, 2.300415, 0, 0, 0, 1, 1,
1.063063, -0.9670197, 2.556392, 0, 0, 0, 1, 1,
1.06445, 0.3916242, 0.9982783, 0, 0, 0, 1, 1,
1.067706, -0.6278647, 1.842286, 0, 0, 0, 1, 1,
1.070454, -2.137354, 2.960155, 1, 1, 1, 1, 1,
1.072598, -0.7855935, 1.367894, 1, 1, 1, 1, 1,
1.081951, -0.1707639, 0.6347136, 1, 1, 1, 1, 1,
1.087297, 0.6889685, 0.1232121, 1, 1, 1, 1, 1,
1.090171, -0.292551, 1.482277, 1, 1, 1, 1, 1,
1.09224, -0.9478688, 1.937376, 1, 1, 1, 1, 1,
1.092354, 0.7474812, 0.9294442, 1, 1, 1, 1, 1,
1.092595, 1.338645, -0.08949346, 1, 1, 1, 1, 1,
1.100597, -0.3746472, 2.063201, 1, 1, 1, 1, 1,
1.106503, 0.1461703, 2.496886, 1, 1, 1, 1, 1,
1.117586, -0.5226373, 2.102509, 1, 1, 1, 1, 1,
1.137358, -0.6324245, 2.085167, 1, 1, 1, 1, 1,
1.137903, 0.4581798, 1.678439, 1, 1, 1, 1, 1,
1.138772, -0.1096356, 1.066934, 1, 1, 1, 1, 1,
1.147689, -0.1967965, 0.226442, 1, 1, 1, 1, 1,
1.15571, 0.1134094, 2.184517, 0, 0, 1, 1, 1,
1.161001, 0.1564545, 2.252458, 1, 0, 0, 1, 1,
1.161017, -0.4626682, 1.736873, 1, 0, 0, 1, 1,
1.173487, -0.6745963, 1.625136, 1, 0, 0, 1, 1,
1.177953, 1.15445, 2.025853, 1, 0, 0, 1, 1,
1.180201, 0.1010835, 1.133369, 1, 0, 0, 1, 1,
1.185127, 1.27907, 0.7432135, 0, 0, 0, 1, 1,
1.185423, -1.190266, 2.00952, 0, 0, 0, 1, 1,
1.189575, -0.4713707, 1.30781, 0, 0, 0, 1, 1,
1.191644, -0.6528228, 3.532965, 0, 0, 0, 1, 1,
1.193372, 0.1652464, 0.8339255, 0, 0, 0, 1, 1,
1.19417, 0.4034148, 0.2592335, 0, 0, 0, 1, 1,
1.203658, -0.2780636, 2.593488, 0, 0, 0, 1, 1,
1.207464, -2.224225, 4.193961, 1, 1, 1, 1, 1,
1.213115, 1.798078, 1.70407, 1, 1, 1, 1, 1,
1.213772, -0.9374265, 2.305832, 1, 1, 1, 1, 1,
1.218325, -0.04544925, 3.810822, 1, 1, 1, 1, 1,
1.224562, -0.6075836, 0.4572467, 1, 1, 1, 1, 1,
1.238262, 0.5013849, 1.905789, 1, 1, 1, 1, 1,
1.239102, -0.242156, 2.113542, 1, 1, 1, 1, 1,
1.241767, 1.027267, 0.9443891, 1, 1, 1, 1, 1,
1.254298, -2.813241, 4.238892, 1, 1, 1, 1, 1,
1.255132, -0.3104973, 2.530992, 1, 1, 1, 1, 1,
1.265674, 1.415381, -0.6281152, 1, 1, 1, 1, 1,
1.272113, 0.1065247, 0.8382367, 1, 1, 1, 1, 1,
1.274572, 0.3155073, 1.767806, 1, 1, 1, 1, 1,
1.275504, 0.9292239, 1.274352, 1, 1, 1, 1, 1,
1.275513, -1.66625, 3.695052, 1, 1, 1, 1, 1,
1.276997, -1.808021, 1.913055, 0, 0, 1, 1, 1,
1.282178, -0.9845917, 2.343741, 1, 0, 0, 1, 1,
1.285438, 0.05661373, 1.773049, 1, 0, 0, 1, 1,
1.289284, -0.2398892, 1.366108, 1, 0, 0, 1, 1,
1.290764, 0.3012094, 2.268447, 1, 0, 0, 1, 1,
1.292061, 1.072749, 2.032838, 1, 0, 0, 1, 1,
1.293102, -0.1578045, 2.554215, 0, 0, 0, 1, 1,
1.297728, 0.6994066, -0.09874378, 0, 0, 0, 1, 1,
1.304036, -0.06566602, 1.432502, 0, 0, 0, 1, 1,
1.30555, -0.819435, 1.934839, 0, 0, 0, 1, 1,
1.305724, -0.02005023, 1.862554, 0, 0, 0, 1, 1,
1.305935, -1.32344, 2.960367, 0, 0, 0, 1, 1,
1.306417, -0.3574722, 2.931846, 0, 0, 0, 1, 1,
1.308888, -0.266153, 1.732184, 1, 1, 1, 1, 1,
1.312516, 0.1804584, 1.352476, 1, 1, 1, 1, 1,
1.317638, 0.4531629, 1.623341, 1, 1, 1, 1, 1,
1.318421, -1.156789, 3.62415, 1, 1, 1, 1, 1,
1.32958, 0.7515976, 0.7647998, 1, 1, 1, 1, 1,
1.336078, 1.353757, -0.3085578, 1, 1, 1, 1, 1,
1.336876, -0.3952284, 3.679087, 1, 1, 1, 1, 1,
1.339089, -1.057333, 0.6749829, 1, 1, 1, 1, 1,
1.351167, -0.0637894, 2.826706, 1, 1, 1, 1, 1,
1.35664, -1.284682, 1.408017, 1, 1, 1, 1, 1,
1.374285, -0.3583159, 1.556143, 1, 1, 1, 1, 1,
1.376151, -0.4460625, 1.988747, 1, 1, 1, 1, 1,
1.385055, 0.6301261, 0.1219719, 1, 1, 1, 1, 1,
1.397485, 0.1096825, 1.714711, 1, 1, 1, 1, 1,
1.400585, -0.01774129, 2.729083, 1, 1, 1, 1, 1,
1.4157, -0.8766972, 0.4994924, 0, 0, 1, 1, 1,
1.434159, -0.3062646, 2.50712, 1, 0, 0, 1, 1,
1.434612, -1.757617, 3.251744, 1, 0, 0, 1, 1,
1.44195, -0.01567771, 2.440855, 1, 0, 0, 1, 1,
1.451018, 0.1164648, 0.6897469, 1, 0, 0, 1, 1,
1.461934, 0.3329929, 1.605414, 1, 0, 0, 1, 1,
1.464831, 0.3707086, 0.7996929, 0, 0, 0, 1, 1,
1.469117, -0.4516602, 1.141425, 0, 0, 0, 1, 1,
1.4791, -0.3450235, -0.2425541, 0, 0, 0, 1, 1,
1.4802, 1.355366, 2.888522, 0, 0, 0, 1, 1,
1.494819, -0.7529047, 2.128139, 0, 0, 0, 1, 1,
1.497406, -1.430536, 2.548672, 0, 0, 0, 1, 1,
1.49849, 0.03816191, 1.864536, 0, 0, 0, 1, 1,
1.500346, -1.176584, 2.90271, 1, 1, 1, 1, 1,
1.502969, 0.4919716, 0.3450224, 1, 1, 1, 1, 1,
1.50585, 0.9204021, 0.7296602, 1, 1, 1, 1, 1,
1.512148, -0.1771462, 1.310269, 1, 1, 1, 1, 1,
1.51235, 1.457493, 1.112651, 1, 1, 1, 1, 1,
1.517069, -0.550325, 1.145717, 1, 1, 1, 1, 1,
1.543765, -0.4863713, 3.252227, 1, 1, 1, 1, 1,
1.558841, -0.2408968, 0.9205969, 1, 1, 1, 1, 1,
1.574427, -0.2562244, 1.323252, 1, 1, 1, 1, 1,
1.582324, -0.5014489, 0.3797668, 1, 1, 1, 1, 1,
1.596063, 0.9896083, 0.9467383, 1, 1, 1, 1, 1,
1.616825, 1.948932, 1.312934, 1, 1, 1, 1, 1,
1.617164, 1.033902, -0.5946167, 1, 1, 1, 1, 1,
1.617637, -0.8661695, 0.4558276, 1, 1, 1, 1, 1,
1.618001, 1.731059, 2.002598, 1, 1, 1, 1, 1,
1.629202, 1.700563, 0.9028617, 0, 0, 1, 1, 1,
1.630374, -2.046685, 2.375079, 1, 0, 0, 1, 1,
1.662058, 1.460436, 0.394616, 1, 0, 0, 1, 1,
1.665293, 1.677531, 0.8045619, 1, 0, 0, 1, 1,
1.687196, -0.1582795, 2.852956, 1, 0, 0, 1, 1,
1.702306, -1.174543, 2.661158, 1, 0, 0, 1, 1,
1.722545, 0.02120792, 1.216236, 0, 0, 0, 1, 1,
1.725856, 0.2110145, 2.37916, 0, 0, 0, 1, 1,
1.729173, 1.835892, 0.9316493, 0, 0, 0, 1, 1,
1.730643, 0.467676, 1.694741, 0, 0, 0, 1, 1,
1.758175, -0.2790412, 0.523914, 0, 0, 0, 1, 1,
1.766539, 1.175407, 2.452988, 0, 0, 0, 1, 1,
1.771118, -0.8960988, 3.683636, 0, 0, 0, 1, 1,
1.78252, -0.4885487, 1.517335, 1, 1, 1, 1, 1,
1.815234, -0.3207397, 1.888918, 1, 1, 1, 1, 1,
1.833058, -0.4791453, 2.22167, 1, 1, 1, 1, 1,
1.8443, -2.013178, 1.675655, 1, 1, 1, 1, 1,
1.866479, -1.624131, 1.544565, 1, 1, 1, 1, 1,
1.897745, -0.3396985, 1.250218, 1, 1, 1, 1, 1,
1.900311, -0.6121542, 0.7496485, 1, 1, 1, 1, 1,
1.914073, -0.2249677, 0.6544859, 1, 1, 1, 1, 1,
1.927116, -0.4289526, 3.138804, 1, 1, 1, 1, 1,
1.931591, 0.2093965, -0.6933389, 1, 1, 1, 1, 1,
1.935032, 1.289082, 2.660619, 1, 1, 1, 1, 1,
1.944544, -1.127842, 2.293445, 1, 1, 1, 1, 1,
1.950588, -0.5057306, 1.530203, 1, 1, 1, 1, 1,
1.968479, 0.9559357, 0.08255336, 1, 1, 1, 1, 1,
1.993775, -0.4335982, 0.7954865, 1, 1, 1, 1, 1,
2.032816, -0.9005213, 2.615883, 0, 0, 1, 1, 1,
2.05323, -0.5691116, 0.5885434, 1, 0, 0, 1, 1,
2.103018, 2.302285, 2.480955, 1, 0, 0, 1, 1,
2.110285, 0.246146, 0.2954887, 1, 0, 0, 1, 1,
2.126312, -0.3689332, 0.778047, 1, 0, 0, 1, 1,
2.161859, -2.715623, 1.072075, 1, 0, 0, 1, 1,
2.173922, 0.008637789, 1.588235, 0, 0, 0, 1, 1,
2.182868, 0.4769874, 1.308979, 0, 0, 0, 1, 1,
2.20573, 0.580523, 1.468339, 0, 0, 0, 1, 1,
2.213373, -1.020061, 2.628658, 0, 0, 0, 1, 1,
2.214029, 0.7572928, -0.4061814, 0, 0, 0, 1, 1,
2.228196, 0.9635716, 0.2916649, 0, 0, 0, 1, 1,
2.344702, -0.3856128, 0.651875, 0, 0, 0, 1, 1,
2.369673, 0.9509486, 1.509275, 1, 1, 1, 1, 1,
2.390148, 0.5984895, 2.826099, 1, 1, 1, 1, 1,
2.396462, 0.8205981, 0.6631365, 1, 1, 1, 1, 1,
2.726683, 0.07055133, 1.954005, 1, 1, 1, 1, 1,
2.802763, -0.1981021, 2.251534, 1, 1, 1, 1, 1,
2.961491, -0.6125052, 1.666289, 1, 1, 1, 1, 1,
3.569926, -1.306456, 1.177085, 1, 1, 1, 1, 1
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
var radius = 9.434838;
var distance = 33.13947;
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
mvMatrix.translate( -0.01632714, 0.1772413, 0.2212026 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.13947);
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