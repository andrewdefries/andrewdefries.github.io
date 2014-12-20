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
-4.064413, 1.609659, -0.7874317, 1, 0, 0, 1,
-3.777641, 0.2064745, 0.0118249, 1, 0.007843138, 0, 1,
-2.997544, 0.4856058, -0.4462216, 1, 0.01176471, 0, 1,
-2.868644, -0.8459873, -1.9663, 1, 0.01960784, 0, 1,
-2.597667, -0.3112084, -0.8823793, 1, 0.02352941, 0, 1,
-2.588858, 0.07598115, -0.0481137, 1, 0.03137255, 0, 1,
-2.536095, -0.4479199, -2.458778, 1, 0.03529412, 0, 1,
-2.530771, -1.952786, -3.280468, 1, 0.04313726, 0, 1,
-2.510393, -0.6427026, -0.6828772, 1, 0.04705882, 0, 1,
-2.463692, 0.9667929, -1.902799, 1, 0.05490196, 0, 1,
-2.430977, 2.066958, -0.96721, 1, 0.05882353, 0, 1,
-2.396422, -0.4696708, -0.8090301, 1, 0.06666667, 0, 1,
-2.364714, 0.8177156, -1.688002, 1, 0.07058824, 0, 1,
-2.334484, -0.8384615, -1.909003, 1, 0.07843138, 0, 1,
-2.325886, -1.269359, -3.711828, 1, 0.08235294, 0, 1,
-2.283211, -1.538555, -0.5949785, 1, 0.09019608, 0, 1,
-2.248935, 2.111098, -0.860772, 1, 0.09411765, 0, 1,
-2.236627, -1.877725, -2.592581, 1, 0.1019608, 0, 1,
-2.187196, -0.3647838, -4.037925, 1, 0.1098039, 0, 1,
-2.186713, 1.730846, -0.6800667, 1, 0.1137255, 0, 1,
-2.179998, -1.615194, -1.168665, 1, 0.1215686, 0, 1,
-2.16257, 0.2928694, -1.641253, 1, 0.1254902, 0, 1,
-2.159549, -0.4449126, -2.069826, 1, 0.1333333, 0, 1,
-2.141116, 0.7170534, -0.02448035, 1, 0.1372549, 0, 1,
-2.128128, 0.2582132, -1.475778, 1, 0.145098, 0, 1,
-2.09578, 0.3419021, 0.4163761, 1, 0.1490196, 0, 1,
-2.087322, -1.020579, -5.165102, 1, 0.1568628, 0, 1,
-2.084286, -1.186869, -2.803266, 1, 0.1607843, 0, 1,
-2.052702, -0.1520644, -2.888831, 1, 0.1686275, 0, 1,
-2.051011, -0.4806421, -1.908557, 1, 0.172549, 0, 1,
-2.016575, 0.4274022, -1.761597, 1, 0.1803922, 0, 1,
-2.011371, 0.004515489, -1.079147, 1, 0.1843137, 0, 1,
-1.946662, -0.4180774, -2.00142, 1, 0.1921569, 0, 1,
-1.939003, 1.004215, -1.022318, 1, 0.1960784, 0, 1,
-1.892539, 0.09656189, -1.919656, 1, 0.2039216, 0, 1,
-1.876284, 0.3482037, -2.36391, 1, 0.2117647, 0, 1,
-1.873086, -0.4748875, -0.3989287, 1, 0.2156863, 0, 1,
-1.843824, 0.8377051, -0.9800187, 1, 0.2235294, 0, 1,
-1.843607, -0.2493401, -0.7418601, 1, 0.227451, 0, 1,
-1.842565, 0.5595883, -0.9732661, 1, 0.2352941, 0, 1,
-1.827647, -1.801837, -3.031362, 1, 0.2392157, 0, 1,
-1.826525, -0.4311859, -1.741729, 1, 0.2470588, 0, 1,
-1.822494, 0.08995815, -0.3423863, 1, 0.2509804, 0, 1,
-1.819927, -0.7327108, -1.933944, 1, 0.2588235, 0, 1,
-1.789668, 0.6872193, -0.5318962, 1, 0.2627451, 0, 1,
-1.783624, 0.9890655, -2.276001, 1, 0.2705882, 0, 1,
-1.780676, 0.2008132, -3.228667, 1, 0.2745098, 0, 1,
-1.77682, -0.9077164, -3.881122, 1, 0.282353, 0, 1,
-1.768785, 1.053232, 0.7725893, 1, 0.2862745, 0, 1,
-1.764661, -0.6504388, -0.8256827, 1, 0.2941177, 0, 1,
-1.74733, -1.264564, -1.885985, 1, 0.3019608, 0, 1,
-1.742578, 1.101423, 0.9804476, 1, 0.3058824, 0, 1,
-1.73553, 1.652859, 0.6532177, 1, 0.3137255, 0, 1,
-1.730507, 0.270005, -1.094417, 1, 0.3176471, 0, 1,
-1.697671, -0.5138237, -2.824119, 1, 0.3254902, 0, 1,
-1.669874, -0.6397208, -1.133337, 1, 0.3294118, 0, 1,
-1.646488, 1.660346, -1.306443, 1, 0.3372549, 0, 1,
-1.640599, 0.4836842, -1.419737, 1, 0.3411765, 0, 1,
-1.610804, -0.1628145, -0.7598684, 1, 0.3490196, 0, 1,
-1.606987, -0.8100461, -1.138776, 1, 0.3529412, 0, 1,
-1.605363, 0.2183151, -2.885771, 1, 0.3607843, 0, 1,
-1.604468, 1.108743, -1.592735, 1, 0.3647059, 0, 1,
-1.603511, -0.4312136, -3.67056, 1, 0.372549, 0, 1,
-1.589894, 2.077087, -0.02365364, 1, 0.3764706, 0, 1,
-1.583965, -2.635651, -1.12405, 1, 0.3843137, 0, 1,
-1.580686, -0.3010159, -1.643638, 1, 0.3882353, 0, 1,
-1.57469, -1.184749, -4.133953, 1, 0.3960784, 0, 1,
-1.561771, -1.392942, -3.198145, 1, 0.4039216, 0, 1,
-1.555197, -0.7224159, -2.020943, 1, 0.4078431, 0, 1,
-1.546469, -0.5198883, -2.012509, 1, 0.4156863, 0, 1,
-1.541384, 0.9506404, -0.5372264, 1, 0.4196078, 0, 1,
-1.534991, 0.7237887, -1.029903, 1, 0.427451, 0, 1,
-1.528458, -1.691545, -3.200584, 1, 0.4313726, 0, 1,
-1.521604, 1.750048, -0.7159878, 1, 0.4392157, 0, 1,
-1.521365, 1.220567, -2.796209, 1, 0.4431373, 0, 1,
-1.518703, -0.3051562, -1.169495, 1, 0.4509804, 0, 1,
-1.505459, -1.3262, -2.099361, 1, 0.454902, 0, 1,
-1.504764, -0.7862407, -2.607625, 1, 0.4627451, 0, 1,
-1.503688, 0.1328919, -2.324158, 1, 0.4666667, 0, 1,
-1.488781, 0.06212443, -1.709317, 1, 0.4745098, 0, 1,
-1.480319, 1.284467, -1.606436, 1, 0.4784314, 0, 1,
-1.479222, 0.6441801, -1.23441, 1, 0.4862745, 0, 1,
-1.476544, 0.1807469, -3.322011, 1, 0.4901961, 0, 1,
-1.47376, -0.1243891, -2.013243, 1, 0.4980392, 0, 1,
-1.464337, -1.408014, -3.475005, 1, 0.5058824, 0, 1,
-1.461634, 0.9411817, -3.449591, 1, 0.509804, 0, 1,
-1.458232, -2.374768, -3.936213, 1, 0.5176471, 0, 1,
-1.417824, 0.5667037, -1.309789, 1, 0.5215687, 0, 1,
-1.411356, -1.438491, -2.423254, 1, 0.5294118, 0, 1,
-1.400764, 0.6225722, -0.7532741, 1, 0.5333334, 0, 1,
-1.395701, 0.3054261, -0.07863876, 1, 0.5411765, 0, 1,
-1.393366, 0.9140056, -2.560138, 1, 0.5450981, 0, 1,
-1.393092, 0.4835283, -2.481816, 1, 0.5529412, 0, 1,
-1.392657, -1.191241, -2.950914, 1, 0.5568628, 0, 1,
-1.390227, 0.5670577, -1.727972, 1, 0.5647059, 0, 1,
-1.388783, -0.1190841, -1.28514, 1, 0.5686275, 0, 1,
-1.381575, -1.44864, -1.900005, 1, 0.5764706, 0, 1,
-1.375928, 0.5766954, -0.8583702, 1, 0.5803922, 0, 1,
-1.372425, -0.5208337, -3.761673, 1, 0.5882353, 0, 1,
-1.360284, -0.1271898, 0.04081687, 1, 0.5921569, 0, 1,
-1.360079, 1.171188, -0.1384232, 1, 0.6, 0, 1,
-1.352537, 0.9792123, -1.119521, 1, 0.6078432, 0, 1,
-1.345788, 0.1044193, -0.6159639, 1, 0.6117647, 0, 1,
-1.342978, -0.9840764, -3.170762, 1, 0.6196079, 0, 1,
-1.336699, -0.5815445, -2.294318, 1, 0.6235294, 0, 1,
-1.332412, -0.6211295, -3.697698, 1, 0.6313726, 0, 1,
-1.332091, -2.826075, -3.289641, 1, 0.6352941, 0, 1,
-1.328791, 0.9532259, -2.068496, 1, 0.6431373, 0, 1,
-1.316372, -0.6022104, -0.4207423, 1, 0.6470588, 0, 1,
-1.314534, 0.2011139, -2.092521, 1, 0.654902, 0, 1,
-1.313124, 1.41773, -0.2566454, 1, 0.6588235, 0, 1,
-1.313048, -2.363396, -4.127493, 1, 0.6666667, 0, 1,
-1.309155, -1.295642, -1.575733, 1, 0.6705883, 0, 1,
-1.298366, 2.869277, -1.391088, 1, 0.6784314, 0, 1,
-1.295107, -1.368459, -4.184637, 1, 0.682353, 0, 1,
-1.290983, -1.566866, -1.695813, 1, 0.6901961, 0, 1,
-1.279617, -0.1241818, -0.8211961, 1, 0.6941177, 0, 1,
-1.273057, -0.6077458, -1.384073, 1, 0.7019608, 0, 1,
-1.270515, -0.02741378, -1.202509, 1, 0.7098039, 0, 1,
-1.267043, -0.2959156, -3.452672, 1, 0.7137255, 0, 1,
-1.266894, 0.7538086, -1.406063, 1, 0.7215686, 0, 1,
-1.265662, -1.194033, -3.618059, 1, 0.7254902, 0, 1,
-1.24779, 0.2095148, -4.435991, 1, 0.7333333, 0, 1,
-1.246657, 0.04794866, 0.09513496, 1, 0.7372549, 0, 1,
-1.245296, -0.02582471, -0.7666107, 1, 0.7450981, 0, 1,
-1.238791, 0.6580284, -2.300596, 1, 0.7490196, 0, 1,
-1.230942, -0.1766657, -0.5279324, 1, 0.7568628, 0, 1,
-1.22681, 0.4717959, -0.3679654, 1, 0.7607843, 0, 1,
-1.221024, -0.1222661, -2.060061, 1, 0.7686275, 0, 1,
-1.217651, -0.8219699, -3.81581, 1, 0.772549, 0, 1,
-1.188991, 0.1513179, -1.585741, 1, 0.7803922, 0, 1,
-1.185765, 1.494139, -0.7198838, 1, 0.7843137, 0, 1,
-1.167625, 1.6368, 0.0328656, 1, 0.7921569, 0, 1,
-1.165063, 0.7647749, -0.4743588, 1, 0.7960784, 0, 1,
-1.157075, 0.07640544, -2.812924, 1, 0.8039216, 0, 1,
-1.151657, -1.456275, -2.592484, 1, 0.8117647, 0, 1,
-1.14811, 1.590921, 0.7354543, 1, 0.8156863, 0, 1,
-1.146696, -0.9979396, -2.679814, 1, 0.8235294, 0, 1,
-1.143686, -1.28916, -3.463027, 1, 0.827451, 0, 1,
-1.136374, 0.6273466, -0.1568603, 1, 0.8352941, 0, 1,
-1.129706, -0.8960661, -3.592958, 1, 0.8392157, 0, 1,
-1.118307, -0.5865851, -3.043276, 1, 0.8470588, 0, 1,
-1.112257, 0.7978101, -0.4386755, 1, 0.8509804, 0, 1,
-1.111522, 0.2973017, -1.56816, 1, 0.8588235, 0, 1,
-1.10587, -1.249459, -2.507235, 1, 0.8627451, 0, 1,
-1.094625, 0.9917362, -0.08547159, 1, 0.8705882, 0, 1,
-1.092008, 0.4976122, -2.284009, 1, 0.8745098, 0, 1,
-1.090698, 2.015795, 0.3214945, 1, 0.8823529, 0, 1,
-1.089857, 1.064297, -1.276904, 1, 0.8862745, 0, 1,
-1.0885, 0.935765, -2.021821, 1, 0.8941177, 0, 1,
-1.086812, 0.7458292, 1.774293, 1, 0.8980392, 0, 1,
-1.084535, -0.3281867, -1.712637, 1, 0.9058824, 0, 1,
-1.08319, -0.3738888, -0.6145045, 1, 0.9137255, 0, 1,
-1.082968, -0.3351612, -2.324153, 1, 0.9176471, 0, 1,
-1.078065, -0.2693081, -3.258828, 1, 0.9254902, 0, 1,
-1.070339, 0.07608749, -2.007405, 1, 0.9294118, 0, 1,
-1.064391, -0.8316143, -1.030466, 1, 0.9372549, 0, 1,
-1.063275, -0.8109807, -1.72985, 1, 0.9411765, 0, 1,
-1.062979, -0.1162656, -1.933164, 1, 0.9490196, 0, 1,
-1.052666, 0.2270544, 0.2031764, 1, 0.9529412, 0, 1,
-1.052071, -1.720391, -2.920511, 1, 0.9607843, 0, 1,
-1.050732, -0.2180441, -2.634027, 1, 0.9647059, 0, 1,
-1.047185, 0.7368646, -1.210015, 1, 0.972549, 0, 1,
-1.046409, 1.563372, -0.8518925, 1, 0.9764706, 0, 1,
-1.045156, 0.04315904, -2.861171, 1, 0.9843137, 0, 1,
-1.042029, 1.909311, -1.514377, 1, 0.9882353, 0, 1,
-1.029542, -0.6840435, -1.429126, 1, 0.9960784, 0, 1,
-1.025262, 0.2928726, -2.764141, 0.9960784, 1, 0, 1,
-1.023677, 1.059659, -1.280902, 0.9921569, 1, 0, 1,
-1.01926, 0.08004271, -0.8103931, 0.9843137, 1, 0, 1,
-1.019163, -0.8464262, -1.942673, 0.9803922, 1, 0, 1,
-1.016998, -0.3535119, -2.021769, 0.972549, 1, 0, 1,
-1.016188, 0.4010828, -2.336209, 0.9686275, 1, 0, 1,
-1.015036, 1.770105, -0.9092349, 0.9607843, 1, 0, 1,
-1.01487, -2.325842, -2.749665, 0.9568627, 1, 0, 1,
-1.009732, -1.696101, -2.774547, 0.9490196, 1, 0, 1,
-1.000625, 0.8397622, -2.007416, 0.945098, 1, 0, 1,
-0.9984827, 1.428355, -0.5581495, 0.9372549, 1, 0, 1,
-0.9925487, 0.835243, -0.5171216, 0.9333333, 1, 0, 1,
-0.9869067, 1.343132, 0.1757166, 0.9254902, 1, 0, 1,
-0.9837292, -0.3376069, -1.785688, 0.9215686, 1, 0, 1,
-0.9825581, -1.545167, -2.995449, 0.9137255, 1, 0, 1,
-0.9769388, 0.8062579, -1.862434, 0.9098039, 1, 0, 1,
-0.9721624, -0.198368, -0.7573014, 0.9019608, 1, 0, 1,
-0.9675316, -1.639833, -2.314449, 0.8941177, 1, 0, 1,
-0.9671531, 1.876237, 0.8171293, 0.8901961, 1, 0, 1,
-0.9657191, 1.809822, -1.147288, 0.8823529, 1, 0, 1,
-0.9602281, 3.135281, -0.1148898, 0.8784314, 1, 0, 1,
-0.9560955, -0.09143721, -4.044546, 0.8705882, 1, 0, 1,
-0.9481575, -1.914666, -2.578908, 0.8666667, 1, 0, 1,
-0.9378291, 1.544426, -0.9260327, 0.8588235, 1, 0, 1,
-0.931747, -0.301845, -0.6169793, 0.854902, 1, 0, 1,
-0.9287363, -0.7878014, -3.496322, 0.8470588, 1, 0, 1,
-0.9256324, -0.04393992, -1.937404, 0.8431373, 1, 0, 1,
-0.9246042, 0.2799697, -2.464163, 0.8352941, 1, 0, 1,
-0.9239924, -0.8136046, -1.09296, 0.8313726, 1, 0, 1,
-0.9130214, -0.4191335, -2.570401, 0.8235294, 1, 0, 1,
-0.9127969, -1.328313, -3.828829, 0.8196079, 1, 0, 1,
-0.9123889, 0.4183072, -1.258908, 0.8117647, 1, 0, 1,
-0.9116872, -0.3969291, -2.796706, 0.8078431, 1, 0, 1,
-0.9115154, 0.7270563, -0.2689579, 0.8, 1, 0, 1,
-0.9085799, -1.485351, -3.198015, 0.7921569, 1, 0, 1,
-0.9057744, -0.2215482, -2.173705, 0.7882353, 1, 0, 1,
-0.905194, 2.036082, -0.5727724, 0.7803922, 1, 0, 1,
-0.9007493, 1.493773, -1.286034, 0.7764706, 1, 0, 1,
-0.8971065, 0.933893, -2.40888, 0.7686275, 1, 0, 1,
-0.8913994, -0.0556978, -0.8416095, 0.7647059, 1, 0, 1,
-0.8883782, -0.09233771, -1.928585, 0.7568628, 1, 0, 1,
-0.8866966, 0.1627548, -2.734026, 0.7529412, 1, 0, 1,
-0.8814077, -0.5152689, -1.837147, 0.7450981, 1, 0, 1,
-0.8730159, -1.391818, -3.225275, 0.7411765, 1, 0, 1,
-0.8702304, -1.446557, -3.433814, 0.7333333, 1, 0, 1,
-0.8647768, 0.5658894, -1.232408, 0.7294118, 1, 0, 1,
-0.8645691, 1.103178, -0.982116, 0.7215686, 1, 0, 1,
-0.8614932, 0.7777153, 0.7721113, 0.7176471, 1, 0, 1,
-0.8598728, 0.5084177, -1.186844, 0.7098039, 1, 0, 1,
-0.8560414, -0.0841497, -1.856148, 0.7058824, 1, 0, 1,
-0.8550234, 1.65721, 0.3327545, 0.6980392, 1, 0, 1,
-0.8546385, -0.2995713, -1.951971, 0.6901961, 1, 0, 1,
-0.845121, -0.3315923, -2.11642, 0.6862745, 1, 0, 1,
-0.8415098, 0.6380572, -0.487118, 0.6784314, 1, 0, 1,
-0.8409562, -1.16739, -2.89781, 0.6745098, 1, 0, 1,
-0.838568, 0.2175635, -2.481319, 0.6666667, 1, 0, 1,
-0.8368005, 1.671977, -2.402495, 0.6627451, 1, 0, 1,
-0.8330597, -0.830633, -4.352722, 0.654902, 1, 0, 1,
-0.8324174, -0.7991655, -2.105569, 0.6509804, 1, 0, 1,
-0.824709, 0.1525648, 0.1328472, 0.6431373, 1, 0, 1,
-0.8239653, -1.370117, -3.739404, 0.6392157, 1, 0, 1,
-0.8202553, -0.3284985, -3.167604, 0.6313726, 1, 0, 1,
-0.8195553, -0.9429066, -3.662699, 0.627451, 1, 0, 1,
-0.816263, 0.8381826, 0.0185817, 0.6196079, 1, 0, 1,
-0.8128101, -0.8663653, -2.32703, 0.6156863, 1, 0, 1,
-0.8031255, 0.1595553, -0.9973405, 0.6078432, 1, 0, 1,
-0.8026823, 0.8003766, -2.401399, 0.6039216, 1, 0, 1,
-0.7995058, 0.6646113, -0.5637121, 0.5960785, 1, 0, 1,
-0.7979726, 0.07357787, -1.148012, 0.5882353, 1, 0, 1,
-0.7960683, 1.334938, -0.2492, 0.5843138, 1, 0, 1,
-0.7947277, -0.2795031, -1.188309, 0.5764706, 1, 0, 1,
-0.7897421, 0.9695694, -0.04664221, 0.572549, 1, 0, 1,
-0.7894822, 1.187015, 0.411287, 0.5647059, 1, 0, 1,
-0.7869749, -0.5612676, -4.002992, 0.5607843, 1, 0, 1,
-0.7863138, -0.6290989, -2.081516, 0.5529412, 1, 0, 1,
-0.7842349, -1.902644, -1.049078, 0.5490196, 1, 0, 1,
-0.7840759, 0.9578026, 0.5462908, 0.5411765, 1, 0, 1,
-0.7832729, -0.006850169, -2.799729, 0.5372549, 1, 0, 1,
-0.7831996, 1.480074, -1.810032, 0.5294118, 1, 0, 1,
-0.7794104, 0.3866003, -0.3821002, 0.5254902, 1, 0, 1,
-0.7693084, 0.1492581, 0.02200328, 0.5176471, 1, 0, 1,
-0.7620264, 0.1076152, -0.5572272, 0.5137255, 1, 0, 1,
-0.7609305, 0.0360857, -1.885358, 0.5058824, 1, 0, 1,
-0.7607284, 0.7686488, 0.5607614, 0.5019608, 1, 0, 1,
-0.7590051, 1.230847, 0.3177215, 0.4941176, 1, 0, 1,
-0.7586522, 0.6372136, -1.983037, 0.4862745, 1, 0, 1,
-0.7521821, -0.9071211, -0.9455777, 0.4823529, 1, 0, 1,
-0.7407205, 0.5024985, 0.364609, 0.4745098, 1, 0, 1,
-0.7330616, -0.9951404, -2.565954, 0.4705882, 1, 0, 1,
-0.7272992, -1.786635, -2.681047, 0.4627451, 1, 0, 1,
-0.7230496, -0.4084238, -1.634664, 0.4588235, 1, 0, 1,
-0.7219233, -0.9305359, -1.442732, 0.4509804, 1, 0, 1,
-0.7030329, 0.5797322, 0.6654322, 0.4470588, 1, 0, 1,
-0.7021621, -0.5955208, -2.141964, 0.4392157, 1, 0, 1,
-0.6999207, 0.2295929, -3.333008, 0.4352941, 1, 0, 1,
-0.6991056, 0.6310195, -1.208763, 0.427451, 1, 0, 1,
-0.6971968, 1.477162, -0.315486, 0.4235294, 1, 0, 1,
-0.6971604, -0.8019443, -2.247789, 0.4156863, 1, 0, 1,
-0.6964732, -0.6013258, -1.099755, 0.4117647, 1, 0, 1,
-0.6958113, 0.9271127, -0.3065504, 0.4039216, 1, 0, 1,
-0.6951286, -0.5319872, -1.366959, 0.3960784, 1, 0, 1,
-0.6917785, 0.9987198, -0.9793418, 0.3921569, 1, 0, 1,
-0.6917472, -0.4239321, -0.835755, 0.3843137, 1, 0, 1,
-0.6875117, -0.05718805, -2.131569, 0.3803922, 1, 0, 1,
-0.6854982, -0.4445727, -1.398823, 0.372549, 1, 0, 1,
-0.6831156, -0.6642313, -2.19963, 0.3686275, 1, 0, 1,
-0.6810375, -0.7322336, -1.406829, 0.3607843, 1, 0, 1,
-0.6740869, -0.7884253, -4.01323, 0.3568628, 1, 0, 1,
-0.673672, -0.3458992, -1.864645, 0.3490196, 1, 0, 1,
-0.6680298, -1.169639, -1.250593, 0.345098, 1, 0, 1,
-0.667482, 0.4885368, -1.086162, 0.3372549, 1, 0, 1,
-0.6649674, -0.7717887, -3.490622, 0.3333333, 1, 0, 1,
-0.6635014, -0.4474593, -1.474938, 0.3254902, 1, 0, 1,
-0.6633313, -0.0009958381, -2.533076, 0.3215686, 1, 0, 1,
-0.6589941, -0.3877083, -1.656571, 0.3137255, 1, 0, 1,
-0.6522645, -0.9537101, -2.319171, 0.3098039, 1, 0, 1,
-0.6469737, 2.05989, -0.2053477, 0.3019608, 1, 0, 1,
-0.6449974, 0.7547282, -1.432315, 0.2941177, 1, 0, 1,
-0.6438901, 1.103301, -2.343424, 0.2901961, 1, 0, 1,
-0.6397967, -0.2153538, -1.146314, 0.282353, 1, 0, 1,
-0.6357266, -1.023973, -1.060556, 0.2784314, 1, 0, 1,
-0.6335557, 0.4404767, -1.664147, 0.2705882, 1, 0, 1,
-0.6307181, -1.364115, -2.586143, 0.2666667, 1, 0, 1,
-0.6273784, -0.7864975, -3.175067, 0.2588235, 1, 0, 1,
-0.619038, -0.2386961, -1.764551, 0.254902, 1, 0, 1,
-0.6189607, -0.604293, -3.162142, 0.2470588, 1, 0, 1,
-0.6149058, 2.100494, -0.6310167, 0.2431373, 1, 0, 1,
-0.6126771, -0.3539649, -1.313435, 0.2352941, 1, 0, 1,
-0.6114584, -1.908732, -1.23597, 0.2313726, 1, 0, 1,
-0.6041378, 2.104128, -1.251059, 0.2235294, 1, 0, 1,
-0.6037412, -0.567879, -2.585177, 0.2196078, 1, 0, 1,
-0.6033807, -1.41707, -3.165043, 0.2117647, 1, 0, 1,
-0.6019703, -1.225877, -3.251178, 0.2078431, 1, 0, 1,
-0.5908834, 0.3970171, -2.341738, 0.2, 1, 0, 1,
-0.589354, -2.103819, -0.6061627, 0.1921569, 1, 0, 1,
-0.5849655, 1.548366, -2.739506, 0.1882353, 1, 0, 1,
-0.5779946, 0.1966798, 0.377613, 0.1803922, 1, 0, 1,
-0.5676261, 1.346705, 0.4917847, 0.1764706, 1, 0, 1,
-0.5668603, -0.7459703, -3.195017, 0.1686275, 1, 0, 1,
-0.5651505, 0.6331675, 0.07224368, 0.1647059, 1, 0, 1,
-0.5638672, -0.4000135, -2.097869, 0.1568628, 1, 0, 1,
-0.5616693, 1.355475, -2.043031, 0.1529412, 1, 0, 1,
-0.5597206, 0.7793136, -0.414529, 0.145098, 1, 0, 1,
-0.5544248, -0.6421145, -0.5320645, 0.1411765, 1, 0, 1,
-0.5532396, -0.5980406, -3.47418, 0.1333333, 1, 0, 1,
-0.5514643, 0.6407884, -0.8250731, 0.1294118, 1, 0, 1,
-0.5505363, 0.6443981, 0.4404044, 0.1215686, 1, 0, 1,
-0.5482531, -0.5653976, -1.090029, 0.1176471, 1, 0, 1,
-0.5416596, -1.482787, -2.977515, 0.1098039, 1, 0, 1,
-0.5380917, -1.830797, -2.973752, 0.1058824, 1, 0, 1,
-0.52829, 0.4265041, -2.430564, 0.09803922, 1, 0, 1,
-0.5252379, 0.2186293, -1.514781, 0.09019608, 1, 0, 1,
-0.5224771, 0.6494367, -0.2072627, 0.08627451, 1, 0, 1,
-0.5219842, 0.1882903, -0.3373009, 0.07843138, 1, 0, 1,
-0.5152494, -0.7174401, -2.011933, 0.07450981, 1, 0, 1,
-0.5144813, 1.114731, -0.04476604, 0.06666667, 1, 0, 1,
-0.5118302, 0.3103507, -1.172319, 0.0627451, 1, 0, 1,
-0.5074474, 0.8146253, 0.2503342, 0.05490196, 1, 0, 1,
-0.5037034, 0.6745448, 0.4545199, 0.05098039, 1, 0, 1,
-0.4969136, -0.5923523, -1.653069, 0.04313726, 1, 0, 1,
-0.4933521, -0.8255427, -1.499638, 0.03921569, 1, 0, 1,
-0.4928575, 1.019107, -1.515443, 0.03137255, 1, 0, 1,
-0.4924427, 1.846578, -0.4256204, 0.02745098, 1, 0, 1,
-0.4891399, 1.435652, -0.9189529, 0.01960784, 1, 0, 1,
-0.4882135, -0.645327, -1.068028, 0.01568628, 1, 0, 1,
-0.488109, -0.3997898, -1.868037, 0.007843138, 1, 0, 1,
-0.4832345, -0.6214528, -1.805135, 0.003921569, 1, 0, 1,
-0.4831398, -0.03624156, -2.008863, 0, 1, 0.003921569, 1,
-0.4730847, -1.195794, -0.2507738, 0, 1, 0.01176471, 1,
-0.4699916, 0.5896745, -2.255336, 0, 1, 0.01568628, 1,
-0.4597843, 0.07425085, -2.313468, 0, 1, 0.02352941, 1,
-0.4528092, -0.6874844, -2.406976, 0, 1, 0.02745098, 1,
-0.449098, 0.07675786, 0.2837785, 0, 1, 0.03529412, 1,
-0.4460894, -0.6417038, -3.053961, 0, 1, 0.03921569, 1,
-0.4425632, 0.5658655, -2.495404, 0, 1, 0.04705882, 1,
-0.4423504, 1.01267, -1.491334, 0, 1, 0.05098039, 1,
-0.4383255, 0.3475074, -1.127646, 0, 1, 0.05882353, 1,
-0.4379123, 0.2505277, -1.428548, 0, 1, 0.0627451, 1,
-0.4373176, 0.1320319, -0.9367406, 0, 1, 0.07058824, 1,
-0.4356673, -1.612637, -3.834259, 0, 1, 0.07450981, 1,
-0.4345104, 0.1727164, -0.03212786, 0, 1, 0.08235294, 1,
-0.4342907, 1.545085, -0.009558712, 0, 1, 0.08627451, 1,
-0.4339898, 1.079039, 1.385032, 0, 1, 0.09411765, 1,
-0.4315865, -0.5976464, -2.291787, 0, 1, 0.1019608, 1,
-0.4311106, -0.6904331, -2.7279, 0, 1, 0.1058824, 1,
-0.4301077, -1.470657, -1.830954, 0, 1, 0.1137255, 1,
-0.4297536, 1.790651, -0.7966059, 0, 1, 0.1176471, 1,
-0.427803, -1.221656, -2.324602, 0, 1, 0.1254902, 1,
-0.4266633, -0.34826, -1.436397, 0, 1, 0.1294118, 1,
-0.4264169, 0.85978, -1.039204, 0, 1, 0.1372549, 1,
-0.4244364, 0.332033, -0.5763193, 0, 1, 0.1411765, 1,
-0.4237196, 0.1827835, -1.744055, 0, 1, 0.1490196, 1,
-0.422771, -0.1360378, -2.080536, 0, 1, 0.1529412, 1,
-0.4221537, 1.911054, -0.5884997, 0, 1, 0.1607843, 1,
-0.4215556, -2.023979, -1.864418, 0, 1, 0.1647059, 1,
-0.4128696, 0.5845089, -1.227922, 0, 1, 0.172549, 1,
-0.4087372, -1.931711, -1.047121, 0, 1, 0.1764706, 1,
-0.4072765, 1.771944, -1.063197, 0, 1, 0.1843137, 1,
-0.4072497, 0.686282, 0.04383301, 0, 1, 0.1882353, 1,
-0.4067551, 0.3575049, -1.283941, 0, 1, 0.1960784, 1,
-0.405672, 0.6598177, -0.4243556, 0, 1, 0.2039216, 1,
-0.4033451, 0.6863816, 0.02923662, 0, 1, 0.2078431, 1,
-0.4014023, 0.6119206, -1.114277, 0, 1, 0.2156863, 1,
-0.3975226, -0.4842277, -2.679761, 0, 1, 0.2196078, 1,
-0.3956197, 0.5817546, 0.05080594, 0, 1, 0.227451, 1,
-0.3929892, -1.783063, -3.204257, 0, 1, 0.2313726, 1,
-0.388649, -1.271512, -2.952534, 0, 1, 0.2392157, 1,
-0.384845, 1.100479, -1.683105, 0, 1, 0.2431373, 1,
-0.381942, -1.535069, -3.852847, 0, 1, 0.2509804, 1,
-0.378087, -1.822356, -2.167478, 0, 1, 0.254902, 1,
-0.3756754, -1.020213, -0.9867305, 0, 1, 0.2627451, 1,
-0.3703023, -0.7306063, -1.183901, 0, 1, 0.2666667, 1,
-0.3668658, 0.9132956, 1.136446, 0, 1, 0.2745098, 1,
-0.3646796, 1.390535, 0.114762, 0, 1, 0.2784314, 1,
-0.3635025, 0.0004992056, -0.9191231, 0, 1, 0.2862745, 1,
-0.3629284, -0.230535, -2.67753, 0, 1, 0.2901961, 1,
-0.3602484, -0.4747748, -1.696946, 0, 1, 0.2980392, 1,
-0.3601463, -0.04379801, -2.418715, 0, 1, 0.3058824, 1,
-0.3583477, -0.5669785, -3.17028, 0, 1, 0.3098039, 1,
-0.3554527, -0.1438802, -1.391261, 0, 1, 0.3176471, 1,
-0.3512631, -0.6873225, -1.236938, 0, 1, 0.3215686, 1,
-0.3503517, 0.6526642, -1.735689, 0, 1, 0.3294118, 1,
-0.3482022, 0.7593127, -0.02237382, 0, 1, 0.3333333, 1,
-0.3458482, -1.307541, -3.395806, 0, 1, 0.3411765, 1,
-0.3351713, 0.3446679, -1.364002, 0, 1, 0.345098, 1,
-0.3342523, -0.5679024, -3.253986, 0, 1, 0.3529412, 1,
-0.3340136, -2.457411, -3.081526, 0, 1, 0.3568628, 1,
-0.3322896, 0.8238566, 1.569728, 0, 1, 0.3647059, 1,
-0.3239159, -1.286258, -4.359263, 0, 1, 0.3686275, 1,
-0.31963, -0.4093979, -0.5389379, 0, 1, 0.3764706, 1,
-0.317932, 0.1160538, -0.9801279, 0, 1, 0.3803922, 1,
-0.3164064, -0.3524954, -3.286375, 0, 1, 0.3882353, 1,
-0.315587, -0.5036883, -1.228011, 0, 1, 0.3921569, 1,
-0.3142947, -0.4555705, -1.8215, 0, 1, 0.4, 1,
-0.31324, 1.768879, -0.6884609, 0, 1, 0.4078431, 1,
-0.308927, -0.8958842, -3.072161, 0, 1, 0.4117647, 1,
-0.3007434, -1.177087, -2.056799, 0, 1, 0.4196078, 1,
-0.300281, -0.5344716, -5.382551, 0, 1, 0.4235294, 1,
-0.2982789, 0.3836374, -0.65146, 0, 1, 0.4313726, 1,
-0.2926455, 1.459309, -1.005866, 0, 1, 0.4352941, 1,
-0.2920297, -0.2131142, -3.424944, 0, 1, 0.4431373, 1,
-0.2909836, -1.139342, -3.355853, 0, 1, 0.4470588, 1,
-0.2818138, 0.668576, 0.3627992, 0, 1, 0.454902, 1,
-0.2813419, -0.6312153, -4.040206, 0, 1, 0.4588235, 1,
-0.2746736, 0.2008419, -1.261576, 0, 1, 0.4666667, 1,
-0.2606728, -0.4298438, -1.109324, 0, 1, 0.4705882, 1,
-0.2595149, -1.510566, -3.169499, 0, 1, 0.4784314, 1,
-0.2471817, 1.083696, -1.515307, 0, 1, 0.4823529, 1,
-0.2451245, -1.481591, -4.357554, 0, 1, 0.4901961, 1,
-0.2411093, -0.8443136, -1.230973, 0, 1, 0.4941176, 1,
-0.2391715, 1.118243, -0.05428406, 0, 1, 0.5019608, 1,
-0.2374731, -0.430431, -2.819157, 0, 1, 0.509804, 1,
-0.2364998, 1.083141, 0.299203, 0, 1, 0.5137255, 1,
-0.236479, -1.231066, -2.555557, 0, 1, 0.5215687, 1,
-0.2317564, 1.377161, 0.2547478, 0, 1, 0.5254902, 1,
-0.2290275, -0.4400426, -3.295395, 0, 1, 0.5333334, 1,
-0.2258126, -0.153361, -1.966408, 0, 1, 0.5372549, 1,
-0.2255494, -2.871717, -4.153951, 0, 1, 0.5450981, 1,
-0.2221451, 1.55137, -1.571143, 0, 1, 0.5490196, 1,
-0.2215977, -1.216162, -3.498918, 0, 1, 0.5568628, 1,
-0.2212032, 0.2780927, -1.228754, 0, 1, 0.5607843, 1,
-0.2199787, -0.4182495, -3.189333, 0, 1, 0.5686275, 1,
-0.217215, -0.1365289, -3.421649, 0, 1, 0.572549, 1,
-0.2105226, -0.1291788, -4.823413, 0, 1, 0.5803922, 1,
-0.2102573, 0.843829, -0.3972946, 0, 1, 0.5843138, 1,
-0.2095072, 0.5197974, 0.2647714, 0, 1, 0.5921569, 1,
-0.2094676, 0.252632, -0.5579801, 0, 1, 0.5960785, 1,
-0.2062513, -0.1148566, -2.695825, 0, 1, 0.6039216, 1,
-0.2018822, 0.4082508, -0.3673983, 0, 1, 0.6117647, 1,
-0.2013804, -0.8589762, -2.18668, 0, 1, 0.6156863, 1,
-0.2000276, 0.2036953, -1.313617, 0, 1, 0.6235294, 1,
-0.1982744, 0.5917611, 0.1077754, 0, 1, 0.627451, 1,
-0.1946905, -0.3290531, -2.224453, 0, 1, 0.6352941, 1,
-0.1930884, 1.036205, -1.32009, 0, 1, 0.6392157, 1,
-0.1878872, 0.4791888, -0.4827058, 0, 1, 0.6470588, 1,
-0.1872803, -0.4208405, -2.931158, 0, 1, 0.6509804, 1,
-0.1860789, -0.861535, -4.178161, 0, 1, 0.6588235, 1,
-0.1836237, 0.271404, -0.2829933, 0, 1, 0.6627451, 1,
-0.1800676, -1.64914, -2.186224, 0, 1, 0.6705883, 1,
-0.1791272, -1.563258, -1.780421, 0, 1, 0.6745098, 1,
-0.1685086, -1.057535, -3.68433, 0, 1, 0.682353, 1,
-0.1679892, -0.8787388, -3.090467, 0, 1, 0.6862745, 1,
-0.1634411, -0.885723, -2.610417, 0, 1, 0.6941177, 1,
-0.1621382, 0.3600339, -1.252882, 0, 1, 0.7019608, 1,
-0.1582949, 0.2614608, -0.3328227, 0, 1, 0.7058824, 1,
-0.1560515, -1.438181, -2.324907, 0, 1, 0.7137255, 1,
-0.1496936, -0.3219618, -1.103837, 0, 1, 0.7176471, 1,
-0.1481603, 0.7300571, 0.9863619, 0, 1, 0.7254902, 1,
-0.147337, 0.3393079, -1.443015, 0, 1, 0.7294118, 1,
-0.1458324, -1.589642, -0.007048782, 0, 1, 0.7372549, 1,
-0.1430698, -0.4121393, -1.94838, 0, 1, 0.7411765, 1,
-0.1397204, -0.9664154, -2.885142, 0, 1, 0.7490196, 1,
-0.1370421, -0.1487284, -3.992553, 0, 1, 0.7529412, 1,
-0.128975, -3.208279, -1.905653, 0, 1, 0.7607843, 1,
-0.1245968, 0.6311697, 0.5659507, 0, 1, 0.7647059, 1,
-0.1241226, 0.1069526, -0.4577511, 0, 1, 0.772549, 1,
-0.1211967, 0.5951543, 1.027353, 0, 1, 0.7764706, 1,
-0.1209629, 0.6853809, -0.1144356, 0, 1, 0.7843137, 1,
-0.1196712, -2.040132, -2.778478, 0, 1, 0.7882353, 1,
-0.1180328, -0.02801495, -1.536927, 0, 1, 0.7960784, 1,
-0.1162458, 0.2287998, -1.221564, 0, 1, 0.8039216, 1,
-0.1161883, -1.330668, -4.954997, 0, 1, 0.8078431, 1,
-0.1158866, 0.6768501, -1.794803, 0, 1, 0.8156863, 1,
-0.1143246, -0.04232939, -1.850063, 0, 1, 0.8196079, 1,
-0.1139635, 1.128754, -0.02551254, 0, 1, 0.827451, 1,
-0.1094735, 3.018595, 0.2822812, 0, 1, 0.8313726, 1,
-0.1077362, 0.3301414, -0.495772, 0, 1, 0.8392157, 1,
-0.1068825, 0.2791252, -1.841518, 0, 1, 0.8431373, 1,
-0.09616234, -2.303527, -1.03444, 0, 1, 0.8509804, 1,
-0.09457377, -0.6367795, -2.021613, 0, 1, 0.854902, 1,
-0.09336327, 0.9695796, -0.2570305, 0, 1, 0.8627451, 1,
-0.09330666, 0.7738343, -0.7795484, 0, 1, 0.8666667, 1,
-0.08789127, -0.1489691, -2.720071, 0, 1, 0.8745098, 1,
-0.08248382, -1.358103, -3.890215, 0, 1, 0.8784314, 1,
-0.08101248, -0.7790293, -4.494386, 0, 1, 0.8862745, 1,
-0.07831749, 0.5527083, -1.900748, 0, 1, 0.8901961, 1,
-0.07810913, 0.3447659, 0.244163, 0, 1, 0.8980392, 1,
-0.07659481, 0.7284986, -0.413558, 0, 1, 0.9058824, 1,
-0.07096356, 1.942918, 1.533708, 0, 1, 0.9098039, 1,
-0.07082777, 2.272433, 1.642335, 0, 1, 0.9176471, 1,
-0.06599869, -1.104569, -2.296508, 0, 1, 0.9215686, 1,
-0.06432462, 0.7572227, -1.625622, 0, 1, 0.9294118, 1,
-0.06378555, -1.306725, -1.60815, 0, 1, 0.9333333, 1,
-0.06139258, 1.477604, -1.152196, 0, 1, 0.9411765, 1,
-0.0537351, -1.036143, -2.836946, 0, 1, 0.945098, 1,
-0.05121501, -0.4400233, -3.387837, 0, 1, 0.9529412, 1,
-0.047388, 0.1078919, -1.243052, 0, 1, 0.9568627, 1,
-0.04662823, -1.234512, -2.380477, 0, 1, 0.9647059, 1,
-0.04654562, -0.816064, -2.399443, 0, 1, 0.9686275, 1,
-0.04645906, -1.243015, -1.821745, 0, 1, 0.9764706, 1,
-0.04452252, -1.751412, -2.4326, 0, 1, 0.9803922, 1,
-0.04312097, -0.3142025, -2.159208, 0, 1, 0.9882353, 1,
-0.04103981, 1.369918, 0.5816432, 0, 1, 0.9921569, 1,
-0.0357656, 0.05218542, -0.5569886, 0, 1, 1, 1,
-0.03546193, -2.230099, -3.837512, 0, 0.9921569, 1, 1,
-0.03073151, 1.514518, 0.248419, 0, 0.9882353, 1, 1,
-0.02955347, -0.1600884, -1.830928, 0, 0.9803922, 1, 1,
-0.02595844, 0.3281401, -0.4491237, 0, 0.9764706, 1, 1,
-0.02443165, -0.1186838, -4.359264, 0, 0.9686275, 1, 1,
-0.02337857, 0.5153472, 2.123178, 0, 0.9647059, 1, 1,
-0.01825281, 1.309589, -0.2648821, 0, 0.9568627, 1, 1,
-0.01673025, -0.09069762, -3.821203, 0, 0.9529412, 1, 1,
-0.01082289, -0.5015964, -2.135326, 0, 0.945098, 1, 1,
-0.008452173, -0.8827842, -3.288386, 0, 0.9411765, 1, 1,
-0.007157428, 1.498586, 0.7187279, 0, 0.9333333, 1, 1,
-0.005813322, 0.3743207, 1.823568, 0, 0.9294118, 1, 1,
-0.001094577, -0.417092, -2.810374, 0, 0.9215686, 1, 1,
0.005651744, -0.4221496, 1.838196, 0, 0.9176471, 1, 1,
0.005905459, 0.001970504, 1.792624, 0, 0.9098039, 1, 1,
0.01069715, 0.8436554, 0.09906983, 0, 0.9058824, 1, 1,
0.01159959, -1.265084, 1.987361, 0, 0.8980392, 1, 1,
0.01289307, -2.302985, 3.169339, 0, 0.8901961, 1, 1,
0.01661088, 0.9935671, -0.2256348, 0, 0.8862745, 1, 1,
0.021815, 0.6050385, 0.2614632, 0, 0.8784314, 1, 1,
0.02388508, -0.03144411, 1.039617, 0, 0.8745098, 1, 1,
0.02880115, 1.19302, 1.948487, 0, 0.8666667, 1, 1,
0.02936437, 0.6129125, -1.110838, 0, 0.8627451, 1, 1,
0.02951354, -2.469158, 2.948598, 0, 0.854902, 1, 1,
0.03138972, 0.3878672, 0.9133953, 0, 0.8509804, 1, 1,
0.03276819, 0.2516349, 0.8226668, 0, 0.8431373, 1, 1,
0.04046025, 0.3514035, -0.6860255, 0, 0.8392157, 1, 1,
0.04641789, 0.09336376, -0.2311202, 0, 0.8313726, 1, 1,
0.05240017, 1.423409, 0.1132796, 0, 0.827451, 1, 1,
0.05486339, -0.4820259, 2.34335, 0, 0.8196079, 1, 1,
0.05835641, 0.259533, -0.6591784, 0, 0.8156863, 1, 1,
0.06333182, 0.4423223, -0.2132582, 0, 0.8078431, 1, 1,
0.06371525, -0.7845548, 1.85584, 0, 0.8039216, 1, 1,
0.06641701, 1.470529, -1.682526, 0, 0.7960784, 1, 1,
0.069326, 2.344896, -1.080108, 0, 0.7882353, 1, 1,
0.07353357, -0.09467276, 2.145818, 0, 0.7843137, 1, 1,
0.07435489, 1.029649, 0.6529393, 0, 0.7764706, 1, 1,
0.07499196, -1.217214, 2.053002, 0, 0.772549, 1, 1,
0.07508523, -1.276499, 3.215275, 0, 0.7647059, 1, 1,
0.07742211, -0.3503928, 1.771809, 0, 0.7607843, 1, 1,
0.08224884, 0.5917972, -0.6425825, 0, 0.7529412, 1, 1,
0.08401639, 0.2958022, -0.3901477, 0, 0.7490196, 1, 1,
0.09284317, -0.7463024, 2.920372, 0, 0.7411765, 1, 1,
0.09757892, 1.215538, 0.5131747, 0, 0.7372549, 1, 1,
0.1025506, -0.06387722, 2.136595, 0, 0.7294118, 1, 1,
0.1034414, 1.633808, -0.7899445, 0, 0.7254902, 1, 1,
0.1041295, 0.5397443, 0.003218193, 0, 0.7176471, 1, 1,
0.1088036, 0.4344544, 0.3839692, 0, 0.7137255, 1, 1,
0.1091599, -0.3844469, 2.319189, 0, 0.7058824, 1, 1,
0.1106681, -2.986289, 4.078074, 0, 0.6980392, 1, 1,
0.1169683, -0.6302933, 3.367104, 0, 0.6941177, 1, 1,
0.122912, 0.4272527, -1.522192, 0, 0.6862745, 1, 1,
0.1285469, -0.4617485, 3.340841, 0, 0.682353, 1, 1,
0.1285549, 0.9309068, 1.077206, 0, 0.6745098, 1, 1,
0.1336251, 0.248902, 0.2965248, 0, 0.6705883, 1, 1,
0.1352243, 1.520533, -2.229238, 0, 0.6627451, 1, 1,
0.1370332, 1.077513, 1.296574, 0, 0.6588235, 1, 1,
0.138466, -0.01513661, 1.638391, 0, 0.6509804, 1, 1,
0.1405183, -0.2044494, 2.482903, 0, 0.6470588, 1, 1,
0.1433051, -0.3055153, 2.172383, 0, 0.6392157, 1, 1,
0.1451563, 1.227398, -0.7453541, 0, 0.6352941, 1, 1,
0.1463288, -0.5978184, 1.526195, 0, 0.627451, 1, 1,
0.1478746, 2.167287, -1.844873, 0, 0.6235294, 1, 1,
0.1550933, 1.945663, -0.7388985, 0, 0.6156863, 1, 1,
0.1563497, 0.1797036, -0.2449028, 0, 0.6117647, 1, 1,
0.1567374, 2.263176, 0.9561093, 0, 0.6039216, 1, 1,
0.1589047, -1.059461, 4.004087, 0, 0.5960785, 1, 1,
0.1592622, -0.553438, 1.530394, 0, 0.5921569, 1, 1,
0.1614017, 1.917388, -0.006930341, 0, 0.5843138, 1, 1,
0.1728323, -0.273961, 1.995413, 0, 0.5803922, 1, 1,
0.1734526, 0.6040892, -0.3182451, 0, 0.572549, 1, 1,
0.1735921, -0.9220434, 3.399745, 0, 0.5686275, 1, 1,
0.1767143, -0.6601411, 1.043635, 0, 0.5607843, 1, 1,
0.1787018, 1.446188, -0.7343542, 0, 0.5568628, 1, 1,
0.1807367, 0.03330972, -0.825029, 0, 0.5490196, 1, 1,
0.1812638, -0.6071394, 2.072209, 0, 0.5450981, 1, 1,
0.1826645, 1.510778, -0.06514806, 0, 0.5372549, 1, 1,
0.182689, -0.2835599, 1.993522, 0, 0.5333334, 1, 1,
0.1902932, -0.6422722, 2.364838, 0, 0.5254902, 1, 1,
0.191093, 0.6630355, -0.03583837, 0, 0.5215687, 1, 1,
0.1921587, -0.8208393, 3.463654, 0, 0.5137255, 1, 1,
0.1955019, 0.7888805, -0.03438112, 0, 0.509804, 1, 1,
0.1997691, -1.167208, 2.155055, 0, 0.5019608, 1, 1,
0.2016609, 1.607277, -1.168614, 0, 0.4941176, 1, 1,
0.2016794, -1.231176, 2.423181, 0, 0.4901961, 1, 1,
0.2064352, -0.5189338, 2.624669, 0, 0.4823529, 1, 1,
0.2076203, -0.05428572, 2.252578, 0, 0.4784314, 1, 1,
0.2079258, -0.7310413, 3.40226, 0, 0.4705882, 1, 1,
0.2094369, 0.004466812, 0.9029438, 0, 0.4666667, 1, 1,
0.2096739, 0.7898879, 0.4582637, 0, 0.4588235, 1, 1,
0.2113553, 2.312016, 0.289559, 0, 0.454902, 1, 1,
0.2149756, -1.186194, 0.7985945, 0, 0.4470588, 1, 1,
0.2206524, -0.5706245, 3.591205, 0, 0.4431373, 1, 1,
0.2268582, 0.07504537, 0.6185174, 0, 0.4352941, 1, 1,
0.2295414, 0.4978334, 1.433494, 0, 0.4313726, 1, 1,
0.2325819, 0.08259571, 2.413351, 0, 0.4235294, 1, 1,
0.2333234, -0.165911, 3.055048, 0, 0.4196078, 1, 1,
0.2384256, 1.277229, -0.2618481, 0, 0.4117647, 1, 1,
0.2402014, 1.436889, 0.9554213, 0, 0.4078431, 1, 1,
0.2404438, -1.112605, 2.946533, 0, 0.4, 1, 1,
0.2450981, -0.03700499, 0.02263317, 0, 0.3921569, 1, 1,
0.2476761, -0.5981001, 1.913515, 0, 0.3882353, 1, 1,
0.248319, -0.5928928, 3.010921, 0, 0.3803922, 1, 1,
0.249469, 0.692371, 0.9423987, 0, 0.3764706, 1, 1,
0.2507683, -0.3635867, 0.8581017, 0, 0.3686275, 1, 1,
0.251766, 0.1704024, -0.5202959, 0, 0.3647059, 1, 1,
0.2554914, 0.7846134, -0.7051642, 0, 0.3568628, 1, 1,
0.2562742, 0.601522, -0.01592024, 0, 0.3529412, 1, 1,
0.2592016, -0.9524047, 3.298244, 0, 0.345098, 1, 1,
0.2612033, -1.058685, 1.936502, 0, 0.3411765, 1, 1,
0.2647383, 0.1914104, 1.369905, 0, 0.3333333, 1, 1,
0.2666788, -1.594232, 2.443247, 0, 0.3294118, 1, 1,
0.2677985, 0.2825228, 1.080344, 0, 0.3215686, 1, 1,
0.2683235, 0.3097712, 1.42642, 0, 0.3176471, 1, 1,
0.2700481, 1.286617, -1.250207, 0, 0.3098039, 1, 1,
0.2749146, -0.4188881, 2.209938, 0, 0.3058824, 1, 1,
0.2766841, -0.4182642, 1.804788, 0, 0.2980392, 1, 1,
0.2784826, -0.2085342, 2.048481, 0, 0.2901961, 1, 1,
0.279956, -0.7602556, 3.008039, 0, 0.2862745, 1, 1,
0.2808945, -1.677105, 0.6756176, 0, 0.2784314, 1, 1,
0.2830379, -1.123873, 3.901034, 0, 0.2745098, 1, 1,
0.2885238, 1.542212, 0.06984817, 0, 0.2666667, 1, 1,
0.2931614, -1.390007, 2.296302, 0, 0.2627451, 1, 1,
0.293456, -0.682879, 2.356222, 0, 0.254902, 1, 1,
0.2935353, -0.9868817, 2.196666, 0, 0.2509804, 1, 1,
0.294398, -0.1976127, 1.531415, 0, 0.2431373, 1, 1,
0.2959791, 1.003531, 0.1575367, 0, 0.2392157, 1, 1,
0.2972866, 1.114975, -1.015721, 0, 0.2313726, 1, 1,
0.2974502, -0.3850487, 2.697619, 0, 0.227451, 1, 1,
0.2975236, -0.4302557, 2.406816, 0, 0.2196078, 1, 1,
0.2980692, 0.9482228, -0.297695, 0, 0.2156863, 1, 1,
0.29942, 0.0436956, 0.8806699, 0, 0.2078431, 1, 1,
0.3004773, -0.3657409, 1.277182, 0, 0.2039216, 1, 1,
0.3051923, -0.6276795, 2.763521, 0, 0.1960784, 1, 1,
0.3069579, -0.04010213, 1.556445, 0, 0.1882353, 1, 1,
0.3072169, -0.1988689, 1.792941, 0, 0.1843137, 1, 1,
0.3083265, -0.8522928, 0.4181986, 0, 0.1764706, 1, 1,
0.3094674, -0.7983339, 3.152938, 0, 0.172549, 1, 1,
0.3107564, 0.232039, 1.269449, 0, 0.1647059, 1, 1,
0.3107929, 0.334192, 0.04216889, 0, 0.1607843, 1, 1,
0.315274, -1.204361, 3.381204, 0, 0.1529412, 1, 1,
0.318405, -0.4417476, 1.760471, 0, 0.1490196, 1, 1,
0.329111, -1.533925, 2.504661, 0, 0.1411765, 1, 1,
0.3316662, -0.2094202, 2.094241, 0, 0.1372549, 1, 1,
0.3344097, -0.05621954, 0.1646522, 0, 0.1294118, 1, 1,
0.3344287, -0.1737419, 2.030953, 0, 0.1254902, 1, 1,
0.3359278, 1.724495, 0.315235, 0, 0.1176471, 1, 1,
0.3423472, 0.7956917, -0.7756121, 0, 0.1137255, 1, 1,
0.3431058, -0.363152, 1.644129, 0, 0.1058824, 1, 1,
0.3477523, -0.1533455, 1.771896, 0, 0.09803922, 1, 1,
0.3500146, -0.8278294, 3.899012, 0, 0.09411765, 1, 1,
0.3510033, -0.1715365, 3.039406, 0, 0.08627451, 1, 1,
0.3532258, 1.220562, -0.08101608, 0, 0.08235294, 1, 1,
0.3534316, -0.04147538, 0.6686254, 0, 0.07450981, 1, 1,
0.3555098, 0.9311607, -2.596358, 0, 0.07058824, 1, 1,
0.3588022, -1.203747, 2.032518, 0, 0.0627451, 1, 1,
0.3624888, -0.5432007, 4.489753, 0, 0.05882353, 1, 1,
0.371823, -0.8678839, 2.922513, 0, 0.05098039, 1, 1,
0.3804088, 1.6612, 1.38251, 0, 0.04705882, 1, 1,
0.3813948, 0.9829589, -0.8278676, 0, 0.03921569, 1, 1,
0.3836933, -0.7305509, 2.07317, 0, 0.03529412, 1, 1,
0.3857198, 1.306391, 0.9535514, 0, 0.02745098, 1, 1,
0.3859786, -1.399356, 0.3166835, 0, 0.02352941, 1, 1,
0.3872776, 0.6724557, -1.20921, 0, 0.01568628, 1, 1,
0.3882059, -0.693229, 2.27663, 0, 0.01176471, 1, 1,
0.388298, 0.7400797, 0.3412512, 0, 0.003921569, 1, 1,
0.3915336, -1.92829, 4.366472, 0.003921569, 0, 1, 1,
0.3982948, -0.2002731, 1.376574, 0.007843138, 0, 1, 1,
0.3987984, 0.4705218, -0.6083146, 0.01568628, 0, 1, 1,
0.4006211, -2.193825, 4.798124, 0.01960784, 0, 1, 1,
0.4013519, -0.7658111, 2.241642, 0.02745098, 0, 1, 1,
0.4034519, 1.171945, 2.107895, 0.03137255, 0, 1, 1,
0.4043611, -0.1616355, 1.409745, 0.03921569, 0, 1, 1,
0.4063198, 3.06641, 1.690704, 0.04313726, 0, 1, 1,
0.4129927, 1.108538, -0.8486842, 0.05098039, 0, 1, 1,
0.4174485, -0.3768322, 2.535475, 0.05490196, 0, 1, 1,
0.4179411, -1.205763, 3.003164, 0.0627451, 0, 1, 1,
0.4215361, 1.166571, -1.014018, 0.06666667, 0, 1, 1,
0.4239368, -0.3735982, 3.564658, 0.07450981, 0, 1, 1,
0.4280279, -0.3360505, 4.40493, 0.07843138, 0, 1, 1,
0.43543, 0.4430318, -1.289548, 0.08627451, 0, 1, 1,
0.4410026, 0.7962583, 0.4715559, 0.09019608, 0, 1, 1,
0.4437378, -0.5452706, 2.660997, 0.09803922, 0, 1, 1,
0.447249, 0.4414343, 0.2306846, 0.1058824, 0, 1, 1,
0.4476429, -0.3306424, 2.062963, 0.1098039, 0, 1, 1,
0.4519243, 0.2558819, 1.765879, 0.1176471, 0, 1, 1,
0.4548349, -0.7140583, 2.322697, 0.1215686, 0, 1, 1,
0.4557572, -1.202476, 3.321002, 0.1294118, 0, 1, 1,
0.4562585, -1.963521, 3.889117, 0.1333333, 0, 1, 1,
0.4598731, -0.2341179, 2.344941, 0.1411765, 0, 1, 1,
0.4619328, 0.5374774, -0.5962483, 0.145098, 0, 1, 1,
0.4626212, 0.3839806, 1.405004, 0.1529412, 0, 1, 1,
0.4635984, -0.3232107, 2.178864, 0.1568628, 0, 1, 1,
0.4643078, 0.005236218, 0.933379, 0.1647059, 0, 1, 1,
0.4645766, 1.244653, 1.240239, 0.1686275, 0, 1, 1,
0.4652583, 1.021941, -0.3486456, 0.1764706, 0, 1, 1,
0.4663394, -0.5606526, 0.376698, 0.1803922, 0, 1, 1,
0.4782116, 0.6308588, 0.0577892, 0.1882353, 0, 1, 1,
0.4792966, 0.3219864, 2.189329, 0.1921569, 0, 1, 1,
0.4797261, 1.325473, -0.2229155, 0.2, 0, 1, 1,
0.4808992, 0.1190936, 2.692198, 0.2078431, 0, 1, 1,
0.4872943, 0.2105306, -0.2996382, 0.2117647, 0, 1, 1,
0.4895746, -1.513059, 2.438755, 0.2196078, 0, 1, 1,
0.4915733, 0.1532326, 2.278653, 0.2235294, 0, 1, 1,
0.4941467, -1.525308, 2.546196, 0.2313726, 0, 1, 1,
0.4942798, -0.4889456, 2.811702, 0.2352941, 0, 1, 1,
0.4962532, 1.665131, 0.02664369, 0.2431373, 0, 1, 1,
0.5068873, 1.977597, 0.2108406, 0.2470588, 0, 1, 1,
0.5073382, -2.182323, 1.987365, 0.254902, 0, 1, 1,
0.5121225, -0.3310231, 2.003504, 0.2588235, 0, 1, 1,
0.512509, 0.1994285, 1.246822, 0.2666667, 0, 1, 1,
0.5155008, 1.260754, 0.9501728, 0.2705882, 0, 1, 1,
0.5195751, -1.41789, 3.231263, 0.2784314, 0, 1, 1,
0.5203729, -1.047671, 1.571378, 0.282353, 0, 1, 1,
0.5204229, -0.7482101, 1.527944, 0.2901961, 0, 1, 1,
0.5230243, 1.49818, -0.5412501, 0.2941177, 0, 1, 1,
0.5258549, -0.5029845, 2.751641, 0.3019608, 0, 1, 1,
0.5276095, -0.2256566, 2.163784, 0.3098039, 0, 1, 1,
0.5417136, -0.004680966, 1.654715, 0.3137255, 0, 1, 1,
0.5441428, -0.1069594, 0.4738083, 0.3215686, 0, 1, 1,
0.5478787, -1.058186, 4.371405, 0.3254902, 0, 1, 1,
0.548113, 0.4673438, 0.8522294, 0.3333333, 0, 1, 1,
0.5494206, -0.3555841, 0.652456, 0.3372549, 0, 1, 1,
0.5591853, -1.301143, 2.007871, 0.345098, 0, 1, 1,
0.561962, -0.9964026, 2.376193, 0.3490196, 0, 1, 1,
0.5628878, -0.1725779, 2.031936, 0.3568628, 0, 1, 1,
0.5669442, -0.3609531, 0.7781653, 0.3607843, 0, 1, 1,
0.569079, 0.6978141, -0.1214455, 0.3686275, 0, 1, 1,
0.5721545, -1.639426, 2.56025, 0.372549, 0, 1, 1,
0.5779483, -2.619543, 2.827453, 0.3803922, 0, 1, 1,
0.5790052, 5.942725e-06, 1.192995, 0.3843137, 0, 1, 1,
0.580321, 0.4583673, 0.3729785, 0.3921569, 0, 1, 1,
0.5805167, 1.037894, 1.602146, 0.3960784, 0, 1, 1,
0.5807249, 1.287789, 1.705674, 0.4039216, 0, 1, 1,
0.5846077, -0.3195494, 2.099646, 0.4117647, 0, 1, 1,
0.5849876, -2.357624, 2.986985, 0.4156863, 0, 1, 1,
0.5907268, 0.2085008, 1.469132, 0.4235294, 0, 1, 1,
0.5926839, -0.4436231, 2.358214, 0.427451, 0, 1, 1,
0.5982144, -1.147529, 2.232872, 0.4352941, 0, 1, 1,
0.6009755, 1.098334, 0.8899708, 0.4392157, 0, 1, 1,
0.6022589, 0.4077919, 1.613721, 0.4470588, 0, 1, 1,
0.6024443, 1.487452, -0.9832576, 0.4509804, 0, 1, 1,
0.6045849, 1.015111, 1.718382, 0.4588235, 0, 1, 1,
0.6049733, 0.2211994, 1.902991, 0.4627451, 0, 1, 1,
0.6063304, 0.5926545, -0.1713763, 0.4705882, 0, 1, 1,
0.6095077, 0.6814849, -0.364489, 0.4745098, 0, 1, 1,
0.6152794, 0.03397107, 0.2973384, 0.4823529, 0, 1, 1,
0.6160016, -1.36295, 2.655179, 0.4862745, 0, 1, 1,
0.6166692, 2.54353, -0.6683098, 0.4941176, 0, 1, 1,
0.6197575, -1.723095, 2.430068, 0.5019608, 0, 1, 1,
0.6219833, 1.17697, 1.062712, 0.5058824, 0, 1, 1,
0.631192, -0.9637339, 2.32481, 0.5137255, 0, 1, 1,
0.6319338, 0.07829659, 0.3520362, 0.5176471, 0, 1, 1,
0.6320343, 2.000197, -0.04742058, 0.5254902, 0, 1, 1,
0.6330341, 1.320928, -1.216668, 0.5294118, 0, 1, 1,
0.6351579, 0.5465534, 0.2857726, 0.5372549, 0, 1, 1,
0.6415071, -0.903129, 1.517014, 0.5411765, 0, 1, 1,
0.644017, -0.5889942, 2.573787, 0.5490196, 0, 1, 1,
0.6523473, 1.278135, 0.4698037, 0.5529412, 0, 1, 1,
0.6533188, 0.2104389, 1.003507, 0.5607843, 0, 1, 1,
0.6542509, 0.626209, 1.160077, 0.5647059, 0, 1, 1,
0.6568466, -0.6754445, 1.880641, 0.572549, 0, 1, 1,
0.6612433, 0.678037, 0.9661352, 0.5764706, 0, 1, 1,
0.6684582, 2.702484, 0.3165714, 0.5843138, 0, 1, 1,
0.6691095, -1.046382, 3.060968, 0.5882353, 0, 1, 1,
0.6772624, 0.1295339, 0.8835913, 0.5960785, 0, 1, 1,
0.6788923, -0.3298422, 0.9034841, 0.6039216, 0, 1, 1,
0.6793728, -0.6762964, 3.09363, 0.6078432, 0, 1, 1,
0.6808086, 0.9060323, 0.4958459, 0.6156863, 0, 1, 1,
0.6837931, -1.227433, 3.088464, 0.6196079, 0, 1, 1,
0.6886978, 2.106363, -0.08468761, 0.627451, 0, 1, 1,
0.6970283, -0.02012941, 1.605937, 0.6313726, 0, 1, 1,
0.7115433, -0.4531579, 4.069215, 0.6392157, 0, 1, 1,
0.7135543, -0.1637991, 2.521031, 0.6431373, 0, 1, 1,
0.7137684, -1.733039, 2.168256, 0.6509804, 0, 1, 1,
0.7142087, -1.346235, 1.539763, 0.654902, 0, 1, 1,
0.7154413, 1.064248, 2.845471, 0.6627451, 0, 1, 1,
0.7208774, 0.08565801, 2.694307, 0.6666667, 0, 1, 1,
0.7217996, 0.5217356, 0.4264208, 0.6745098, 0, 1, 1,
0.7250275, 0.07951301, 2.744723, 0.6784314, 0, 1, 1,
0.726949, 0.71196, 1.444835, 0.6862745, 0, 1, 1,
0.7279082, -0.2269404, 1.110083, 0.6901961, 0, 1, 1,
0.7292202, -2.814342, 3.641448, 0.6980392, 0, 1, 1,
0.7301517, 0.76919, -1.467065, 0.7058824, 0, 1, 1,
0.7310578, 1.823627, 0.8788964, 0.7098039, 0, 1, 1,
0.7349179, -0.1014335, 1.510053, 0.7176471, 0, 1, 1,
0.750416, -0.3203193, 4.068212, 0.7215686, 0, 1, 1,
0.7541234, 0.5315197, 0.9402184, 0.7294118, 0, 1, 1,
0.761015, -0.450992, 2.120496, 0.7333333, 0, 1, 1,
0.7640048, 0.4682729, -0.1913965, 0.7411765, 0, 1, 1,
0.7647678, 0.4778711, 1.066277, 0.7450981, 0, 1, 1,
0.7678143, 0.9395897, -0.464896, 0.7529412, 0, 1, 1,
0.7679271, -0.2691388, 1.358927, 0.7568628, 0, 1, 1,
0.775878, -0.0651561, 3.246364, 0.7647059, 0, 1, 1,
0.78065, -0.3647545, 2.627592, 0.7686275, 0, 1, 1,
0.7808786, 0.468181, 2.262105, 0.7764706, 0, 1, 1,
0.7821777, 0.2641376, 2.306032, 0.7803922, 0, 1, 1,
0.7838767, -0.9796315, 4.281322, 0.7882353, 0, 1, 1,
0.7885725, 1.779118, 1.065601, 0.7921569, 0, 1, 1,
0.7886281, -0.6443729, 1.983435, 0.8, 0, 1, 1,
0.7889998, 0.2692633, 1.743629, 0.8078431, 0, 1, 1,
0.796317, -0.5785613, 0.8620833, 0.8117647, 0, 1, 1,
0.7995632, 1.037798, 1.057854, 0.8196079, 0, 1, 1,
0.8044861, 1.1466, 1.039433, 0.8235294, 0, 1, 1,
0.805263, -1.461768, 1.334047, 0.8313726, 0, 1, 1,
0.8085899, 0.8435197, 2.235926, 0.8352941, 0, 1, 1,
0.8106606, -1.602936, 4.204773, 0.8431373, 0, 1, 1,
0.814836, -0.07753246, 1.089878, 0.8470588, 0, 1, 1,
0.8240969, -0.3396252, 3.767308, 0.854902, 0, 1, 1,
0.8261065, 0.1815252, 0.666335, 0.8588235, 0, 1, 1,
0.8282026, 0.5109313, 2.466357, 0.8666667, 0, 1, 1,
0.8300092, 1.418198, -0.7211874, 0.8705882, 0, 1, 1,
0.8430914, -0.8108883, 1.520588, 0.8784314, 0, 1, 1,
0.8441374, -0.266857, 0.6018722, 0.8823529, 0, 1, 1,
0.8468774, 0.7319871, 0.1071826, 0.8901961, 0, 1, 1,
0.847155, 1.268303, 0.3025987, 0.8941177, 0, 1, 1,
0.8535274, -0.01677565, 1.597954, 0.9019608, 0, 1, 1,
0.8637535, 1.660734, 0.3053514, 0.9098039, 0, 1, 1,
0.8729565, -0.4572985, 2.056215, 0.9137255, 0, 1, 1,
0.8733753, 0.9416782, 1.003168, 0.9215686, 0, 1, 1,
0.8738636, 2.554971, 3.273472, 0.9254902, 0, 1, 1,
0.8799968, -1.308378, 2.155021, 0.9333333, 0, 1, 1,
0.8812668, 0.9388636, -1.362888, 0.9372549, 0, 1, 1,
0.8824202, 0.8570118, 0.5461032, 0.945098, 0, 1, 1,
0.8852215, -0.3934925, 1.70687, 0.9490196, 0, 1, 1,
0.8985924, 1.342277, 1.242345, 0.9568627, 0, 1, 1,
0.9007957, -0.2377163, 2.291185, 0.9607843, 0, 1, 1,
0.901518, 0.1556212, 1.137872, 0.9686275, 0, 1, 1,
0.9073446, -0.2607234, 2.570565, 0.972549, 0, 1, 1,
0.9133386, -1.328572, -0.3587325, 0.9803922, 0, 1, 1,
0.9142978, -1.17435, 2.312436, 0.9843137, 0, 1, 1,
0.9151585, -0.5746666, 2.192381, 0.9921569, 0, 1, 1,
0.9165076, -0.8608495, 1.763386, 0.9960784, 0, 1, 1,
0.9201093, 0.4943525, 1.574621, 1, 0, 0.9960784, 1,
0.9254937, -1.232901, 1.889583, 1, 0, 0.9882353, 1,
0.9358385, 0.4065145, 0.2606601, 1, 0, 0.9843137, 1,
0.9465433, 1.360362, -0.1296008, 1, 0, 0.9764706, 1,
0.9502085, 0.03265132, 1.56872, 1, 0, 0.972549, 1,
0.9553824, 0.4021297, 2.144163, 1, 0, 0.9647059, 1,
0.9586664, 1.100741, -1.501204, 1, 0, 0.9607843, 1,
0.9613359, 0.3733164, 1.692705, 1, 0, 0.9529412, 1,
0.9658418, 0.8423473, -0.00992092, 1, 0, 0.9490196, 1,
0.9666924, 0.7439092, 0.5647343, 1, 0, 0.9411765, 1,
0.9709799, 1.641209, 1.66935, 1, 0, 0.9372549, 1,
0.9729295, -0.9492285, 0.6316214, 1, 0, 0.9294118, 1,
0.9832944, 0.9308023, 1.026047, 1, 0, 0.9254902, 1,
0.986301, 0.4709898, 0.9232998, 1, 0, 0.9176471, 1,
0.9889532, 0.103555, 1.731367, 1, 0, 0.9137255, 1,
0.9900982, -2.061543, 0.6069472, 1, 0, 0.9058824, 1,
0.9928882, -0.1785379, 0.9452193, 1, 0, 0.9019608, 1,
1.000718, 0.2785943, 2.549331, 1, 0, 0.8941177, 1,
1.002876, -0.5475875, 2.390636, 1, 0, 0.8862745, 1,
1.003622, 0.09678558, 0.9945302, 1, 0, 0.8823529, 1,
1.004429, 0.191125, 1.400771, 1, 0, 0.8745098, 1,
1.010546, 0.4529815, 1.000593, 1, 0, 0.8705882, 1,
1.012576, -0.5996608, 1.304659, 1, 0, 0.8627451, 1,
1.013369, -0.7285278, 2.682402, 1, 0, 0.8588235, 1,
1.030353, 0.7022876, 0.6490366, 1, 0, 0.8509804, 1,
1.032203, 1.642824, 0.5700471, 1, 0, 0.8470588, 1,
1.038145, -0.01922129, 0.5072123, 1, 0, 0.8392157, 1,
1.046115, 1.198463, -0.737031, 1, 0, 0.8352941, 1,
1.050874, -1.532848, 2.214503, 1, 0, 0.827451, 1,
1.054178, -0.08293909, 2.704899, 1, 0, 0.8235294, 1,
1.054188, 1.166625, 1.735917, 1, 0, 0.8156863, 1,
1.06138, 0.8451299, 1.771239, 1, 0, 0.8117647, 1,
1.068789, 0.4601371, 2.517089, 1, 0, 0.8039216, 1,
1.070223, 0.5528673, 2.050128, 1, 0, 0.7960784, 1,
1.079273, 0.9388443, 0.3541532, 1, 0, 0.7921569, 1,
1.101017, -0.4657974, 1.298049, 1, 0, 0.7843137, 1,
1.102308, 0.5211723, 0.6207426, 1, 0, 0.7803922, 1,
1.102607, -0.7563897, 2.479001, 1, 0, 0.772549, 1,
1.102697, -0.02320939, 2.291579, 1, 0, 0.7686275, 1,
1.103094, 1.265763, 1.188501, 1, 0, 0.7607843, 1,
1.104931, 0.9833541, -0.004459021, 1, 0, 0.7568628, 1,
1.112595, -0.3583017, 1.440808, 1, 0, 0.7490196, 1,
1.113101, -1.232406, 1.64461, 1, 0, 0.7450981, 1,
1.118246, -2.338957, 4.064155, 1, 0, 0.7372549, 1,
1.122787, -1.293605, 2.805553, 1, 0, 0.7333333, 1,
1.127902, 1.579984, -0.5619538, 1, 0, 0.7254902, 1,
1.137524, -0.3630387, 1.79764, 1, 0, 0.7215686, 1,
1.158414, -0.7136199, 2.439029, 1, 0, 0.7137255, 1,
1.159212, -1.128351, 1.126258, 1, 0, 0.7098039, 1,
1.172526, -1.577716, 1.290375, 1, 0, 0.7019608, 1,
1.172696, -2.717069, 5.590577, 1, 0, 0.6941177, 1,
1.177642, 0.1394995, 1.168294, 1, 0, 0.6901961, 1,
1.181072, 0.08840205, 1.08186, 1, 0, 0.682353, 1,
1.191065, -0.9663677, 2.038337, 1, 0, 0.6784314, 1,
1.192879, -1.855685, 2.668606, 1, 0, 0.6705883, 1,
1.20383, 0.1450967, 0.9713206, 1, 0, 0.6666667, 1,
1.204471, 0.3837264, 1.708142, 1, 0, 0.6588235, 1,
1.205789, 0.01861032, 2.729144, 1, 0, 0.654902, 1,
1.21227, -2.219764, 1.975649, 1, 0, 0.6470588, 1,
1.214615, -0.8130746, 4.702353, 1, 0, 0.6431373, 1,
1.22279, 1.265764, -0.9053969, 1, 0, 0.6352941, 1,
1.226894, -0.9996167, 3.947786, 1, 0, 0.6313726, 1,
1.226939, -1.073307, 3.637306, 1, 0, 0.6235294, 1,
1.237211, -0.2049223, 1.157209, 1, 0, 0.6196079, 1,
1.2375, 1.317197, 1.039968, 1, 0, 0.6117647, 1,
1.239716, -1.157178, 1.780989, 1, 0, 0.6078432, 1,
1.24411, -1.727284, 2.881635, 1, 0, 0.6, 1,
1.253703, -2.043416, 4.04388, 1, 0, 0.5921569, 1,
1.260399, -0.7617844, 1.079763, 1, 0, 0.5882353, 1,
1.275806, -0.02007894, -0.5638641, 1, 0, 0.5803922, 1,
1.276222, 0.09452099, 1.06661, 1, 0, 0.5764706, 1,
1.277813, 0.3256683, 0.1125361, 1, 0, 0.5686275, 1,
1.286204, 1.561952, 0.7571598, 1, 0, 0.5647059, 1,
1.286306, 1.707712, -0.6810406, 1, 0, 0.5568628, 1,
1.288341, -1.342407, -0.04807111, 1, 0, 0.5529412, 1,
1.288794, -0.7755967, 1.603544, 1, 0, 0.5450981, 1,
1.291441, 0.6895214, 0.2734514, 1, 0, 0.5411765, 1,
1.295441, -0.3734348, 1.667813, 1, 0, 0.5333334, 1,
1.29767, -1.199534, 1.957074, 1, 0, 0.5294118, 1,
1.314855, 0.7887149, 0.05686164, 1, 0, 0.5215687, 1,
1.325628, -0.7448124, 0.09889023, 1, 0, 0.5176471, 1,
1.327505, -0.9806438, 2.1676, 1, 0, 0.509804, 1,
1.329443, 1.284065, 1.32619, 1, 0, 0.5058824, 1,
1.334662, -0.8361725, 4.898177, 1, 0, 0.4980392, 1,
1.33583, -1.711701, 2.532823, 1, 0, 0.4901961, 1,
1.346927, -0.7594766, 1.717652, 1, 0, 0.4862745, 1,
1.347414, -1.639762, 2.994928, 1, 0, 0.4784314, 1,
1.351835, 1.206865, 0.6773465, 1, 0, 0.4745098, 1,
1.353741, -0.3610702, 1.21476, 1, 0, 0.4666667, 1,
1.357354, 0.3847602, -0.2089768, 1, 0, 0.4627451, 1,
1.36795, -0.3397854, 0.7618747, 1, 0, 0.454902, 1,
1.370142, -1.735047, 2.8809, 1, 0, 0.4509804, 1,
1.370289, 0.8238012, 1.541258, 1, 0, 0.4431373, 1,
1.380729, -0.4316585, 1.282697, 1, 0, 0.4392157, 1,
1.389486, 0.4473013, 0.3277436, 1, 0, 0.4313726, 1,
1.391561, 1.087691, 0.4230975, 1, 0, 0.427451, 1,
1.394907, -0.2938299, 1.319666, 1, 0, 0.4196078, 1,
1.397273, 0.9218445, 0.4865936, 1, 0, 0.4156863, 1,
1.399124, 1.490765, 0.9868985, 1, 0, 0.4078431, 1,
1.400477, -0.1508777, -0.1917429, 1, 0, 0.4039216, 1,
1.400601, 0.05110184, -0.008073634, 1, 0, 0.3960784, 1,
1.419435, 0.8288777, -0.02384023, 1, 0, 0.3882353, 1,
1.425399, 0.3281277, 2.446719, 1, 0, 0.3843137, 1,
1.428924, -0.2765689, 0.6858076, 1, 0, 0.3764706, 1,
1.450587, 0.6892648, 1.525148, 1, 0, 0.372549, 1,
1.463494, -0.6336815, 0.7105086, 1, 0, 0.3647059, 1,
1.472654, 1.267563, 2.247393, 1, 0, 0.3607843, 1,
1.481766, 1.854705, 0.730018, 1, 0, 0.3529412, 1,
1.494013, 0.2610955, 1.190506, 1, 0, 0.3490196, 1,
1.50073, -0.1523153, 0.4187832, 1, 0, 0.3411765, 1,
1.502005, -0.4494839, 1.306037, 1, 0, 0.3372549, 1,
1.504611, 0.3885782, 1.483664, 1, 0, 0.3294118, 1,
1.506641, -1.029176, 2.911585, 1, 0, 0.3254902, 1,
1.509895, 1.022754, 0.7876392, 1, 0, 0.3176471, 1,
1.526844, -2.045277, 4.137909, 1, 0, 0.3137255, 1,
1.534045, -1.064997, 0.8484628, 1, 0, 0.3058824, 1,
1.535066, -0.5183895, 1.861069, 1, 0, 0.2980392, 1,
1.540682, 0.6574181, -0.8963241, 1, 0, 0.2941177, 1,
1.551507, 0.5121857, 2.266683, 1, 0, 0.2862745, 1,
1.554278, -0.7048357, 2.444332, 1, 0, 0.282353, 1,
1.57631, -0.3323105, 1.143473, 1, 0, 0.2745098, 1,
1.61879, 1.571848, -0.9089072, 1, 0, 0.2705882, 1,
1.623644, 0.7930467, 0.5953774, 1, 0, 0.2627451, 1,
1.627144, 0.3955041, 2.315338, 1, 0, 0.2588235, 1,
1.630314, 0.7640646, 0.6963339, 1, 0, 0.2509804, 1,
1.641849, 1.665801, 1.06689, 1, 0, 0.2470588, 1,
1.641928, -1.324006, 4.069706, 1, 0, 0.2392157, 1,
1.657892, -1.324258, 2.11643, 1, 0, 0.2352941, 1,
1.669559, 1.932474, -0.06764816, 1, 0, 0.227451, 1,
1.670003, -2.006391, 3.658988, 1, 0, 0.2235294, 1,
1.710188, 0.8620839, 1.068748, 1, 0, 0.2156863, 1,
1.711646, -0.1964578, 1.026695, 1, 0, 0.2117647, 1,
1.728057, 1.570371, 1.941715, 1, 0, 0.2039216, 1,
1.80693, 1.915601, 1.433984, 1, 0, 0.1960784, 1,
1.817522, -2.359488, 3.040097, 1, 0, 0.1921569, 1,
1.822239, 2.602118, 0.7278253, 1, 0, 0.1843137, 1,
1.823929, -0.07651889, 1.785211, 1, 0, 0.1803922, 1,
1.847531, -1.613574, 2.567637, 1, 0, 0.172549, 1,
1.857845, -0.9758949, 2.112776, 1, 0, 0.1686275, 1,
1.879422, 1.263819, 0.7003722, 1, 0, 0.1607843, 1,
1.879526, 0.009921629, 0.2859298, 1, 0, 0.1568628, 1,
1.887004, 0.3064647, 2.527894, 1, 0, 0.1490196, 1,
1.889079, -2.44662, 1.962999, 1, 0, 0.145098, 1,
1.904788, 1.513477, 0.3686094, 1, 0, 0.1372549, 1,
1.92499, 0.7187418, 0.8621234, 1, 0, 0.1333333, 1,
1.930867, -0.5304161, 0.5938174, 1, 0, 0.1254902, 1,
2.007484, 1.929016, 0.3500653, 1, 0, 0.1215686, 1,
2.030142, 0.3457288, 1.396302, 1, 0, 0.1137255, 1,
2.031333, 0.7195745, 2.32639, 1, 0, 0.1098039, 1,
2.033746, 0.6638443, 1.276746, 1, 0, 0.1019608, 1,
2.061451, -1.363282, 2.378441, 1, 0, 0.09411765, 1,
2.06419, 0.1994121, 0.08032662, 1, 0, 0.09019608, 1,
2.065204, 2.473346, -1.762372, 1, 0, 0.08235294, 1,
2.076452, -1.723161, 1.650563, 1, 0, 0.07843138, 1,
2.087281, 1.229687, 0.3157358, 1, 0, 0.07058824, 1,
2.12776, 0.3282113, 0.7673039, 1, 0, 0.06666667, 1,
2.210696, -1.03317, 1.692732, 1, 0, 0.05882353, 1,
2.256354, -0.139599, -0.182217, 1, 0, 0.05490196, 1,
2.335763, 0.456452, 0.4491361, 1, 0, 0.04705882, 1,
2.636574, -1.580844, 2.424103, 1, 0, 0.04313726, 1,
2.730586, 0.1590568, 1.82019, 1, 0, 0.03529412, 1,
2.809629, 0.6090963, 1.015699, 1, 0, 0.03137255, 1,
2.81288, 0.2796945, 1.063677, 1, 0, 0.02352941, 1,
2.81303, 1.521592, 1.149615, 1, 0, 0.01960784, 1,
3.051049, -0.436998, 2.590635, 1, 0, 0.01176471, 1,
3.260631, -0.2161169, 0.8209438, 1, 0, 0.007843138, 1
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
-0.4018906, -4.283513, -7.242496, 0, -0.5, 0.5, 0.5,
-0.4018906, -4.283513, -7.242496, 1, -0.5, 0.5, 0.5,
-0.4018906, -4.283513, -7.242496, 1, 1.5, 0.5, 0.5,
-0.4018906, -4.283513, -7.242496, 0, 1.5, 0.5, 0.5
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
-5.306007, -0.03649926, -7.242496, 0, -0.5, 0.5, 0.5,
-5.306007, -0.03649926, -7.242496, 1, -0.5, 0.5, 0.5,
-5.306007, -0.03649926, -7.242496, 1, 1.5, 0.5, 0.5,
-5.306007, -0.03649926, -7.242496, 0, 1.5, 0.5, 0.5
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
-5.306007, -4.283513, 0.104013, 0, -0.5, 0.5, 0.5,
-5.306007, -4.283513, 0.104013, 1, -0.5, 0.5, 0.5,
-5.306007, -4.283513, 0.104013, 1, 1.5, 0.5, 0.5,
-5.306007, -4.283513, 0.104013, 0, 1.5, 0.5, 0.5
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
-4, -3.303433, -5.547148,
2, -3.303433, -5.547148,
-4, -3.303433, -5.547148,
-4, -3.466779, -5.829706,
-2, -3.303433, -5.547148,
-2, -3.466779, -5.829706,
0, -3.303433, -5.547148,
0, -3.466779, -5.829706,
2, -3.303433, -5.547148,
2, -3.466779, -5.829706
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
"-4",
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
-4, -3.793473, -6.394822, 0, -0.5, 0.5, 0.5,
-4, -3.793473, -6.394822, 1, -0.5, 0.5, 0.5,
-4, -3.793473, -6.394822, 1, 1.5, 0.5, 0.5,
-4, -3.793473, -6.394822, 0, 1.5, 0.5, 0.5,
-2, -3.793473, -6.394822, 0, -0.5, 0.5, 0.5,
-2, -3.793473, -6.394822, 1, -0.5, 0.5, 0.5,
-2, -3.793473, -6.394822, 1, 1.5, 0.5, 0.5,
-2, -3.793473, -6.394822, 0, 1.5, 0.5, 0.5,
0, -3.793473, -6.394822, 0, -0.5, 0.5, 0.5,
0, -3.793473, -6.394822, 1, -0.5, 0.5, 0.5,
0, -3.793473, -6.394822, 1, 1.5, 0.5, 0.5,
0, -3.793473, -6.394822, 0, 1.5, 0.5, 0.5,
2, -3.793473, -6.394822, 0, -0.5, 0.5, 0.5,
2, -3.793473, -6.394822, 1, -0.5, 0.5, 0.5,
2, -3.793473, -6.394822, 1, 1.5, 0.5, 0.5,
2, -3.793473, -6.394822, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-4.174288, -3, -5.547148,
-4.174288, 3, -5.547148,
-4.174288, -3, -5.547148,
-4.362908, -3, -5.829706,
-4.174288, -2, -5.547148,
-4.362908, -2, -5.829706,
-4.174288, -1, -5.547148,
-4.362908, -1, -5.829706,
-4.174288, 0, -5.547148,
-4.362908, 0, -5.829706,
-4.174288, 1, -5.547148,
-4.362908, 1, -5.829706,
-4.174288, 2, -5.547148,
-4.362908, 2, -5.829706,
-4.174288, 3, -5.547148,
-4.362908, 3, -5.829706
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
-4.740148, -3, -6.394822, 0, -0.5, 0.5, 0.5,
-4.740148, -3, -6.394822, 1, -0.5, 0.5, 0.5,
-4.740148, -3, -6.394822, 1, 1.5, 0.5, 0.5,
-4.740148, -3, -6.394822, 0, 1.5, 0.5, 0.5,
-4.740148, -2, -6.394822, 0, -0.5, 0.5, 0.5,
-4.740148, -2, -6.394822, 1, -0.5, 0.5, 0.5,
-4.740148, -2, -6.394822, 1, 1.5, 0.5, 0.5,
-4.740148, -2, -6.394822, 0, 1.5, 0.5, 0.5,
-4.740148, -1, -6.394822, 0, -0.5, 0.5, 0.5,
-4.740148, -1, -6.394822, 1, -0.5, 0.5, 0.5,
-4.740148, -1, -6.394822, 1, 1.5, 0.5, 0.5,
-4.740148, -1, -6.394822, 0, 1.5, 0.5, 0.5,
-4.740148, 0, -6.394822, 0, -0.5, 0.5, 0.5,
-4.740148, 0, -6.394822, 1, -0.5, 0.5, 0.5,
-4.740148, 0, -6.394822, 1, 1.5, 0.5, 0.5,
-4.740148, 0, -6.394822, 0, 1.5, 0.5, 0.5,
-4.740148, 1, -6.394822, 0, -0.5, 0.5, 0.5,
-4.740148, 1, -6.394822, 1, -0.5, 0.5, 0.5,
-4.740148, 1, -6.394822, 1, 1.5, 0.5, 0.5,
-4.740148, 1, -6.394822, 0, 1.5, 0.5, 0.5,
-4.740148, 2, -6.394822, 0, -0.5, 0.5, 0.5,
-4.740148, 2, -6.394822, 1, -0.5, 0.5, 0.5,
-4.740148, 2, -6.394822, 1, 1.5, 0.5, 0.5,
-4.740148, 2, -6.394822, 0, 1.5, 0.5, 0.5,
-4.740148, 3, -6.394822, 0, -0.5, 0.5, 0.5,
-4.740148, 3, -6.394822, 1, -0.5, 0.5, 0.5,
-4.740148, 3, -6.394822, 1, 1.5, 0.5, 0.5,
-4.740148, 3, -6.394822, 0, 1.5, 0.5, 0.5
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
-4.174288, -3.303433, -4,
-4.174288, -3.303433, 4,
-4.174288, -3.303433, -4,
-4.362908, -3.466779, -4,
-4.174288, -3.303433, -2,
-4.362908, -3.466779, -2,
-4.174288, -3.303433, 0,
-4.362908, -3.466779, 0,
-4.174288, -3.303433, 2,
-4.362908, -3.466779, 2,
-4.174288, -3.303433, 4,
-4.362908, -3.466779, 4
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
-4.740148, -3.793473, -4, 0, -0.5, 0.5, 0.5,
-4.740148, -3.793473, -4, 1, -0.5, 0.5, 0.5,
-4.740148, -3.793473, -4, 1, 1.5, 0.5, 0.5,
-4.740148, -3.793473, -4, 0, 1.5, 0.5, 0.5,
-4.740148, -3.793473, -2, 0, -0.5, 0.5, 0.5,
-4.740148, -3.793473, -2, 1, -0.5, 0.5, 0.5,
-4.740148, -3.793473, -2, 1, 1.5, 0.5, 0.5,
-4.740148, -3.793473, -2, 0, 1.5, 0.5, 0.5,
-4.740148, -3.793473, 0, 0, -0.5, 0.5, 0.5,
-4.740148, -3.793473, 0, 1, -0.5, 0.5, 0.5,
-4.740148, -3.793473, 0, 1, 1.5, 0.5, 0.5,
-4.740148, -3.793473, 0, 0, 1.5, 0.5, 0.5,
-4.740148, -3.793473, 2, 0, -0.5, 0.5, 0.5,
-4.740148, -3.793473, 2, 1, -0.5, 0.5, 0.5,
-4.740148, -3.793473, 2, 1, 1.5, 0.5, 0.5,
-4.740148, -3.793473, 2, 0, 1.5, 0.5, 0.5,
-4.740148, -3.793473, 4, 0, -0.5, 0.5, 0.5,
-4.740148, -3.793473, 4, 1, -0.5, 0.5, 0.5,
-4.740148, -3.793473, 4, 1, 1.5, 0.5, 0.5,
-4.740148, -3.793473, 4, 0, 1.5, 0.5, 0.5
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
-4.174288, -3.303433, -5.547148,
-4.174288, 3.230434, -5.547148,
-4.174288, -3.303433, 5.755174,
-4.174288, 3.230434, 5.755174,
-4.174288, -3.303433, -5.547148,
-4.174288, -3.303433, 5.755174,
-4.174288, 3.230434, -5.547148,
-4.174288, 3.230434, 5.755174,
-4.174288, -3.303433, -5.547148,
3.370507, -3.303433, -5.547148,
-4.174288, -3.303433, 5.755174,
3.370507, -3.303433, 5.755174,
-4.174288, 3.230434, -5.547148,
3.370507, 3.230434, -5.547148,
-4.174288, 3.230434, 5.755174,
3.370507, 3.230434, 5.755174,
3.370507, -3.303433, -5.547148,
3.370507, 3.230434, -5.547148,
3.370507, -3.303433, 5.755174,
3.370507, 3.230434, 5.755174,
3.370507, -3.303433, -5.547148,
3.370507, -3.303433, 5.755174,
3.370507, 3.230434, -5.547148,
3.370507, 3.230434, 5.755174
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
var radius = 8.051567;
var distance = 35.82233;
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
mvMatrix.translate( 0.4018906, 0.03649926, -0.104013 );
mvMatrix.scale( 1.153843, 1.332368, 0.7702411 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.82233);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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


