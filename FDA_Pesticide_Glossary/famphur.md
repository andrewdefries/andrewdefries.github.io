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
-3.629027, -1.400087, -1.820813, 1, 0, 0, 1,
-3.460721, 0.5708301, -0.09788316, 1, 0.007843138, 0, 1,
-2.880666, -0.2561299, -2.129997, 1, 0.01176471, 0, 1,
-2.717236, 2.290474, -1.682958, 1, 0.01960784, 0, 1,
-2.688114, 0.5699032, -2.678781, 1, 0.02352941, 0, 1,
-2.643705, -1.074522, -2.666917, 1, 0.03137255, 0, 1,
-2.469621, 1.766013, -1.87795, 1, 0.03529412, 0, 1,
-2.438888, -0.316948, -2.616736, 1, 0.04313726, 0, 1,
-2.382159, 1.889053, -1.164024, 1, 0.04705882, 0, 1,
-2.369417, 0.3334061, -2.363186, 1, 0.05490196, 0, 1,
-2.338097, -0.698935, -2.593262, 1, 0.05882353, 0, 1,
-2.329259, -0.008870993, -2.416731, 1, 0.06666667, 0, 1,
-2.193784, 1.539488, 0.1256978, 1, 0.07058824, 0, 1,
-2.184145, 1.072421, -0.60326, 1, 0.07843138, 0, 1,
-2.181551, -0.5225037, -0.9635762, 1, 0.08235294, 0, 1,
-2.171401, 1.317395, -1.945922, 1, 0.09019608, 0, 1,
-2.163848, -0.878211, -2.374158, 1, 0.09411765, 0, 1,
-2.134609, 1.106059, 0.4787833, 1, 0.1019608, 0, 1,
-2.129636, -0.0666933, -1.945467, 1, 0.1098039, 0, 1,
-2.107716, 1.059567, -2.031105, 1, 0.1137255, 0, 1,
-2.104333, 0.5064633, -0.9839603, 1, 0.1215686, 0, 1,
-2.103697, 0.4381605, -0.1796262, 1, 0.1254902, 0, 1,
-2.089223, 1.341593, -1.007253, 1, 0.1333333, 0, 1,
-2.087802, 2.628364, 0.09208824, 1, 0.1372549, 0, 1,
-2.08639, -0.6238196, -3.253778, 1, 0.145098, 0, 1,
-2.076959, 0.6030814, -2.226144, 1, 0.1490196, 0, 1,
-2.036563, 0.6873969, -0.9392708, 1, 0.1568628, 0, 1,
-2.031295, 1.374154, -0.363544, 1, 0.1607843, 0, 1,
-1.985641, -0.07825971, -0.8666625, 1, 0.1686275, 0, 1,
-1.981315, -0.7571682, -1.942922, 1, 0.172549, 0, 1,
-1.962431, -0.3324842, -2.128954, 1, 0.1803922, 0, 1,
-1.951077, 1.004323, -1.094522, 1, 0.1843137, 0, 1,
-1.933857, 0.7914925, -1.606117, 1, 0.1921569, 0, 1,
-1.924735, 1.338631, -1.183136, 1, 0.1960784, 0, 1,
-1.906565, -0.2636265, -1.12551, 1, 0.2039216, 0, 1,
-1.89907, -0.2130294, -1.173643, 1, 0.2117647, 0, 1,
-1.843632, -2.047484, -2.674243, 1, 0.2156863, 0, 1,
-1.835237, 0.1778965, -0.1509394, 1, 0.2235294, 0, 1,
-1.825625, 0.3673158, -1.568007, 1, 0.227451, 0, 1,
-1.82013, 0.5986475, -1.241749, 1, 0.2352941, 0, 1,
-1.819955, -0.5217397, -1.744116, 1, 0.2392157, 0, 1,
-1.804806, 1.369688, 0.2149644, 1, 0.2470588, 0, 1,
-1.800487, -0.09068094, -2.171352, 1, 0.2509804, 0, 1,
-1.786007, 0.6536171, -1.608822, 1, 0.2588235, 0, 1,
-1.778677, 2.757471, -1.418102, 1, 0.2627451, 0, 1,
-1.761914, 0.08672386, -1.437328, 1, 0.2705882, 0, 1,
-1.755508, -0.4155914, -2.060695, 1, 0.2745098, 0, 1,
-1.749629, -2.290114, -1.352555, 1, 0.282353, 0, 1,
-1.747714, -1.58782, -1.283096, 1, 0.2862745, 0, 1,
-1.734385, 0.7978882, -1.786249, 1, 0.2941177, 0, 1,
-1.721574, -0.1703032, -0.3008868, 1, 0.3019608, 0, 1,
-1.705752, 0.8371112, -1.008093, 1, 0.3058824, 0, 1,
-1.7052, -0.06885596, -2.884221, 1, 0.3137255, 0, 1,
-1.704476, 0.7941525, -0.04888472, 1, 0.3176471, 0, 1,
-1.703076, -0.861487, -0.683877, 1, 0.3254902, 0, 1,
-1.699128, 0.7218773, -1.778659, 1, 0.3294118, 0, 1,
-1.659091, -0.6120455, -2.656235, 1, 0.3372549, 0, 1,
-1.650518, -0.2863998, -1.534417, 1, 0.3411765, 0, 1,
-1.641235, -0.7066942, -1.47167, 1, 0.3490196, 0, 1,
-1.628364, -0.1823282, 0.02821975, 1, 0.3529412, 0, 1,
-1.628319, 0.3440883, 0.6063895, 1, 0.3607843, 0, 1,
-1.615106, 0.5332315, -2.148217, 1, 0.3647059, 0, 1,
-1.611004, 0.01249319, -1.395873, 1, 0.372549, 0, 1,
-1.601836, -0.8853317, -3.958574, 1, 0.3764706, 0, 1,
-1.597751, 0.1074773, -0.02730401, 1, 0.3843137, 0, 1,
-1.588009, 0.2628692, -0.8979132, 1, 0.3882353, 0, 1,
-1.580935, 1.330146, -1.174386, 1, 0.3960784, 0, 1,
-1.55035, -1.699222, -3.706465, 1, 0.4039216, 0, 1,
-1.54688, -0.3868876, -2.82059, 1, 0.4078431, 0, 1,
-1.540341, 0.8596097, -0.7036197, 1, 0.4156863, 0, 1,
-1.535044, -1.390727, -1.213894, 1, 0.4196078, 0, 1,
-1.524198, -1.206381, -3.283079, 1, 0.427451, 0, 1,
-1.509128, 0.7027962, -2.753496, 1, 0.4313726, 0, 1,
-1.508838, -2.237468, -2.978333, 1, 0.4392157, 0, 1,
-1.507616, 1.259233, 0.7266164, 1, 0.4431373, 0, 1,
-1.504126, 0.9836618, -0.8260762, 1, 0.4509804, 0, 1,
-1.504067, -1.45387, -1.818176, 1, 0.454902, 0, 1,
-1.497674, 0.02123649, -1.325365, 1, 0.4627451, 0, 1,
-1.478652, -0.0642071, -3.087783, 1, 0.4666667, 0, 1,
-1.464789, -1.705062, -3.058357, 1, 0.4745098, 0, 1,
-1.461353, -0.3984343, -3.567426, 1, 0.4784314, 0, 1,
-1.45627, -1.80702, -2.251881, 1, 0.4862745, 0, 1,
-1.443128, 1.835938, -0.6861158, 1, 0.4901961, 0, 1,
-1.42263, 0.5057902, -0.8030401, 1, 0.4980392, 0, 1,
-1.411923, 1.23977, -1.205097, 1, 0.5058824, 0, 1,
-1.411905, 0.3391357, -1.364574, 1, 0.509804, 0, 1,
-1.397275, 0.7105036, 0.2157546, 1, 0.5176471, 0, 1,
-1.396651, -0.2734297, -0.2872974, 1, 0.5215687, 0, 1,
-1.395363, 0.2172998, -2.005845, 1, 0.5294118, 0, 1,
-1.395265, 2.384254, -1.363342, 1, 0.5333334, 0, 1,
-1.36444, -0.5398787, -3.189322, 1, 0.5411765, 0, 1,
-1.356912, -1.099759, -2.163279, 1, 0.5450981, 0, 1,
-1.354405, 0.5220512, -1.841701, 1, 0.5529412, 0, 1,
-1.35165, 0.1506611, -1.086759, 1, 0.5568628, 0, 1,
-1.345573, -0.4759315, -0.9250845, 1, 0.5647059, 0, 1,
-1.34516, -0.4752004, -2.470096, 1, 0.5686275, 0, 1,
-1.343965, -0.143273, -2.157626, 1, 0.5764706, 0, 1,
-1.339324, -1.058619, -1.918164, 1, 0.5803922, 0, 1,
-1.336106, 0.01430447, -2.405868, 1, 0.5882353, 0, 1,
-1.332147, -0.5329524, -0.9885064, 1, 0.5921569, 0, 1,
-1.322281, -0.3827395, -2.427017, 1, 0.6, 0, 1,
-1.312881, 1.295061, -1.062322, 1, 0.6078432, 0, 1,
-1.299022, 0.4841872, -1.144026, 1, 0.6117647, 0, 1,
-1.295604, 1.179204, -2.266645, 1, 0.6196079, 0, 1,
-1.281248, 1.219103, -0.183907, 1, 0.6235294, 0, 1,
-1.276277, 0.8759968, -1.573168, 1, 0.6313726, 0, 1,
-1.266306, 1.740932, -0.26657, 1, 0.6352941, 0, 1,
-1.264495, -0.800532, -1.105609, 1, 0.6431373, 0, 1,
-1.255301, -0.966055, -3.836094, 1, 0.6470588, 0, 1,
-1.252804, 0.255961, -2.347605, 1, 0.654902, 0, 1,
-1.252048, 0.6155715, -1.454578, 1, 0.6588235, 0, 1,
-1.250328, 0.1224679, -0.1297162, 1, 0.6666667, 0, 1,
-1.24808, 0.7789982, 0.6660702, 1, 0.6705883, 0, 1,
-1.227752, -0.659371, -2.921523, 1, 0.6784314, 0, 1,
-1.222027, -1.042991, -2.021782, 1, 0.682353, 0, 1,
-1.219622, 1.159919, -1.351653, 1, 0.6901961, 0, 1,
-1.219212, 0.858146, -3.22755, 1, 0.6941177, 0, 1,
-1.218338, 0.2143733, -1.562839, 1, 0.7019608, 0, 1,
-1.204146, -1.469766, -2.027492, 1, 0.7098039, 0, 1,
-1.20158, -1.639112, -1.600027, 1, 0.7137255, 0, 1,
-1.175077, -2.066978, -4.474979, 1, 0.7215686, 0, 1,
-1.173862, 0.05351279, -2.038959, 1, 0.7254902, 0, 1,
-1.1694, -1.475292, -1.445378, 1, 0.7333333, 0, 1,
-1.169138, 1.061263, -0.4474725, 1, 0.7372549, 0, 1,
-1.164038, -0.4677033, -1.928913, 1, 0.7450981, 0, 1,
-1.162366, 0.6295108, -1.723971, 1, 0.7490196, 0, 1,
-1.159113, -0.9325339, -1.803899, 1, 0.7568628, 0, 1,
-1.1504, 0.04240182, -3.015178, 1, 0.7607843, 0, 1,
-1.13825, -0.2288256, -1.734699, 1, 0.7686275, 0, 1,
-1.130196, -0.3776518, 0.6533636, 1, 0.772549, 0, 1,
-1.11724, -0.407177, -2.380907, 1, 0.7803922, 0, 1,
-1.114963, 0.3275437, 0.2156984, 1, 0.7843137, 0, 1,
-1.109473, -1.151349, -1.405809, 1, 0.7921569, 0, 1,
-1.106044, 1.109502, -2.132095, 1, 0.7960784, 0, 1,
-1.104386, -0.9135921, -0.9215603, 1, 0.8039216, 0, 1,
-1.099377, 0.8320633, 0.6812277, 1, 0.8117647, 0, 1,
-1.098921, -0.2899179, -1.940652, 1, 0.8156863, 0, 1,
-1.084207, -1.346023, -0.02594698, 1, 0.8235294, 0, 1,
-1.076433, 0.1028566, -0.7235262, 1, 0.827451, 0, 1,
-1.068798, -0.8271987, -3.100794, 1, 0.8352941, 0, 1,
-1.06584, -0.3312331, -0.6881918, 1, 0.8392157, 0, 1,
-1.061245, 0.3328153, 0.04113566, 1, 0.8470588, 0, 1,
-1.046601, -0.03821114, -1.92707, 1, 0.8509804, 0, 1,
-1.046029, -0.2061747, -1.451395, 1, 0.8588235, 0, 1,
-1.045187, -1.998277, -3.376293, 1, 0.8627451, 0, 1,
-1.044503, 0.7275483, -0.2809013, 1, 0.8705882, 0, 1,
-1.042321, -0.8064041, -1.428898, 1, 0.8745098, 0, 1,
-1.040293, 0.508562, -2.188145, 1, 0.8823529, 0, 1,
-1.038748, -0.3222964, -3.014765, 1, 0.8862745, 0, 1,
-1.037938, -1.618035, -3.205591, 1, 0.8941177, 0, 1,
-1.037848, 0.0809764, -2.747116, 1, 0.8980392, 0, 1,
-1.034937, -1.731334, -0.6207159, 1, 0.9058824, 0, 1,
-1.034625, -0.9549295, -1.641627, 1, 0.9137255, 0, 1,
-1.033983, 0.7639291, -0.6740468, 1, 0.9176471, 0, 1,
-1.032212, 0.4678504, -1.188544, 1, 0.9254902, 0, 1,
-1.015382, 0.8412791, -0.5555275, 1, 0.9294118, 0, 1,
-1.013664, -0.9184282, -3.975754, 1, 0.9372549, 0, 1,
-1.010683, 0.5532646, 0.3872856, 1, 0.9411765, 0, 1,
-1.009241, 2.060437, -1.096119, 1, 0.9490196, 0, 1,
-1.00821, -2.053959, -2.344252, 1, 0.9529412, 0, 1,
-1.001199, -0.5958204, -0.5841531, 1, 0.9607843, 0, 1,
-1.000437, -0.3824619, -2.132463, 1, 0.9647059, 0, 1,
-0.9919308, 0.6936883, -0.1243682, 1, 0.972549, 0, 1,
-0.9865741, -0.797619, -3.104156, 1, 0.9764706, 0, 1,
-0.9855137, -1.186713, -2.266999, 1, 0.9843137, 0, 1,
-0.9833249, 0.0239076, -3.211168, 1, 0.9882353, 0, 1,
-0.9806624, -1.777235, -0.3616162, 1, 0.9960784, 0, 1,
-0.9765989, 0.6136677, -2.178549, 0.9960784, 1, 0, 1,
-0.9747097, -0.06812222, 0.007371729, 0.9921569, 1, 0, 1,
-0.9742478, 0.3082939, -0.4048063, 0.9843137, 1, 0, 1,
-0.9654764, -0.7127531, -2.693397, 0.9803922, 1, 0, 1,
-0.9565414, -0.6980584, -0.9740887, 0.972549, 1, 0, 1,
-0.955975, -0.2681412, -3.830595, 0.9686275, 1, 0, 1,
-0.9557741, 0.8331205, -0.7871543, 0.9607843, 1, 0, 1,
-0.9541427, -0.8397796, -3.231716, 0.9568627, 1, 0, 1,
-0.950155, -0.5847928, -1.676091, 0.9490196, 1, 0, 1,
-0.9434776, 0.1841168, -1.515997, 0.945098, 1, 0, 1,
-0.9393219, 1.372971, -1.367095, 0.9372549, 1, 0, 1,
-0.9368358, -1.582103, -2.657228, 0.9333333, 1, 0, 1,
-0.9338017, 0.4000049, -1.838889, 0.9254902, 1, 0, 1,
-0.9329259, 1.335207, 1.766899, 0.9215686, 1, 0, 1,
-0.9327376, -1.561032, -2.427881, 0.9137255, 1, 0, 1,
-0.9321851, -0.5224777, -2.467374, 0.9098039, 1, 0, 1,
-0.9295789, 2.069419, -0.9990978, 0.9019608, 1, 0, 1,
-0.925103, -0.9828326, -0.2887788, 0.8941177, 1, 0, 1,
-0.9236949, 1.884876, -0.01370457, 0.8901961, 1, 0, 1,
-0.9229677, 0.2048457, -1.118351, 0.8823529, 1, 0, 1,
-0.9215732, 1.764043, 0.6293397, 0.8784314, 1, 0, 1,
-0.9180707, 1.115754, -0.2179089, 0.8705882, 1, 0, 1,
-0.9170796, 0.2286533, -1.052968, 0.8666667, 1, 0, 1,
-0.916676, -0.2953165, -3.348953, 0.8588235, 1, 0, 1,
-0.9140067, 0.4690208, 0.3191161, 0.854902, 1, 0, 1,
-0.9120734, -0.8008294, -0.8678342, 0.8470588, 1, 0, 1,
-0.9089894, 1.913727, -0.2169453, 0.8431373, 1, 0, 1,
-0.9067518, -2.12184, -3.247536, 0.8352941, 1, 0, 1,
-0.9059083, 0.6234285, -2.793216, 0.8313726, 1, 0, 1,
-0.90251, -0.246666, -0.8813955, 0.8235294, 1, 0, 1,
-0.8983158, 0.06063508, 0.7391757, 0.8196079, 1, 0, 1,
-0.8923939, -0.5551375, -2.961467, 0.8117647, 1, 0, 1,
-0.8893768, 1.349595, -0.7666843, 0.8078431, 1, 0, 1,
-0.8889602, -0.4144978, -1.214757, 0.8, 1, 0, 1,
-0.8839909, -1.722506, -4.317001, 0.7921569, 1, 0, 1,
-0.882282, -0.3359917, -1.765903, 0.7882353, 1, 0, 1,
-0.8808531, 0.2750743, -1.788818, 0.7803922, 1, 0, 1,
-0.8800231, -0.4691763, -4.640785, 0.7764706, 1, 0, 1,
-0.8786694, -1.447092, -1.558055, 0.7686275, 1, 0, 1,
-0.8722876, 0.052594, -0.01860631, 0.7647059, 1, 0, 1,
-0.8666349, -0.7240077, -2.170482, 0.7568628, 1, 0, 1,
-0.8663217, -0.1439392, -0.8821222, 0.7529412, 1, 0, 1,
-0.8662844, -0.7444705, -3.665561, 0.7450981, 1, 0, 1,
-0.8622745, -1.97256, -2.851429, 0.7411765, 1, 0, 1,
-0.8611356, 1.865965, -3.56604, 0.7333333, 1, 0, 1,
-0.8603657, 0.4652334, -1.887576, 0.7294118, 1, 0, 1,
-0.8575352, 0.5133581, 1.062509, 0.7215686, 1, 0, 1,
-0.8571647, -0.3757536, -1.408375, 0.7176471, 1, 0, 1,
-0.8571427, 0.5622208, -0.3130219, 0.7098039, 1, 0, 1,
-0.8561723, -0.9517345, -3.261954, 0.7058824, 1, 0, 1,
-0.8421209, 0.3292083, -0.7815435, 0.6980392, 1, 0, 1,
-0.8395778, 0.3294095, -1.9733, 0.6901961, 1, 0, 1,
-0.8356572, 0.4456674, -2.10309, 0.6862745, 1, 0, 1,
-0.8320538, 0.8190273, -1.010103, 0.6784314, 1, 0, 1,
-0.8308845, -0.05318803, -2.481024, 0.6745098, 1, 0, 1,
-0.8285282, -0.4525666, -1.519011, 0.6666667, 1, 0, 1,
-0.8274961, -0.8890179, -3.572845, 0.6627451, 1, 0, 1,
-0.8209517, 0.7218327, -0.1537637, 0.654902, 1, 0, 1,
-0.8193825, 0.9577664, -0.3759596, 0.6509804, 1, 0, 1,
-0.8134646, 1.396901, -0.3012905, 0.6431373, 1, 0, 1,
-0.8117325, 0.1753745, -1.035798, 0.6392157, 1, 0, 1,
-0.8080605, 0.8883837, -2.042667, 0.6313726, 1, 0, 1,
-0.8079498, -0.7731155, -2.337133, 0.627451, 1, 0, 1,
-0.798315, 0.1460942, -1.292971, 0.6196079, 1, 0, 1,
-0.7959062, -0.1074288, -1.293595, 0.6156863, 1, 0, 1,
-0.7898667, -0.3037605, -2.475782, 0.6078432, 1, 0, 1,
-0.7883646, 2.479308, -0.7339911, 0.6039216, 1, 0, 1,
-0.7881948, 0.2615023, -1.065202, 0.5960785, 1, 0, 1,
-0.785847, -0.967891, -4.389572, 0.5882353, 1, 0, 1,
-0.7832962, 1.562789, -0.6994366, 0.5843138, 1, 0, 1,
-0.7831287, -0.8818485, -3.91487, 0.5764706, 1, 0, 1,
-0.7827648, 0.2067972, -0.5029192, 0.572549, 1, 0, 1,
-0.7806261, 0.2909763, -2.709021, 0.5647059, 1, 0, 1,
-0.7735151, -0.2269169, -1.575165, 0.5607843, 1, 0, 1,
-0.7705476, -1.496678, -1.571334, 0.5529412, 1, 0, 1,
-0.7696579, -1.234163, -3.953285, 0.5490196, 1, 0, 1,
-0.7686187, -0.648181, -2.733733, 0.5411765, 1, 0, 1,
-0.7668776, -1.437841, -2.943758, 0.5372549, 1, 0, 1,
-0.762039, -0.337382, -1.635732, 0.5294118, 1, 0, 1,
-0.7607339, -1.526065, -2.436048, 0.5254902, 1, 0, 1,
-0.7580123, -2.026391, -2.084591, 0.5176471, 1, 0, 1,
-0.7571003, 1.048298, -1.651789, 0.5137255, 1, 0, 1,
-0.755654, 0.5159597, -1.307089, 0.5058824, 1, 0, 1,
-0.7554954, -0.6969491, -1.828124, 0.5019608, 1, 0, 1,
-0.7503767, 0.1397192, -1.583728, 0.4941176, 1, 0, 1,
-0.7491915, -0.6962289, -3.471652, 0.4862745, 1, 0, 1,
-0.7487738, 0.3266751, -0.7898242, 0.4823529, 1, 0, 1,
-0.7434475, 0.1941826, -3.02678, 0.4745098, 1, 0, 1,
-0.7429381, -0.5171569, -2.143955, 0.4705882, 1, 0, 1,
-0.7426659, 1.040959, -1.310323, 0.4627451, 1, 0, 1,
-0.7407382, -1.626632, -4.104771, 0.4588235, 1, 0, 1,
-0.7399373, -0.21547, -4.395918, 0.4509804, 1, 0, 1,
-0.7353018, 1.51716, -1.830945, 0.4470588, 1, 0, 1,
-0.7320897, 0.1935938, -0.4775213, 0.4392157, 1, 0, 1,
-0.7259551, -0.5854949, -2.305774, 0.4352941, 1, 0, 1,
-0.7247395, 1.49606, 1.004141, 0.427451, 1, 0, 1,
-0.7233273, 0.6212786, -2.351926, 0.4235294, 1, 0, 1,
-0.7135553, 0.6622809, -2.791013, 0.4156863, 1, 0, 1,
-0.7039391, -0.5264273, -1.500528, 0.4117647, 1, 0, 1,
-0.6997032, -0.07415701, -1.646428, 0.4039216, 1, 0, 1,
-0.6972904, -0.9104431, -0.5320604, 0.3960784, 1, 0, 1,
-0.6927841, -0.2243368, -0.3899391, 0.3921569, 1, 0, 1,
-0.689522, -1.189521, -1.61975, 0.3843137, 1, 0, 1,
-0.6835257, 0.7345676, -2.411936, 0.3803922, 1, 0, 1,
-0.6833971, -0.4187984, -1.75966, 0.372549, 1, 0, 1,
-0.6807594, 1.458708, -2.43031, 0.3686275, 1, 0, 1,
-0.6764184, -0.6563637, -2.765636, 0.3607843, 1, 0, 1,
-0.6709198, 0.1028547, -1.590871, 0.3568628, 1, 0, 1,
-0.6686448, 1.202749, -0.475422, 0.3490196, 1, 0, 1,
-0.6669178, -0.3922892, -1.899845, 0.345098, 1, 0, 1,
-0.6667186, -1.603259, -2.892332, 0.3372549, 1, 0, 1,
-0.6647232, -0.4489806, -1.294707, 0.3333333, 1, 0, 1,
-0.6623429, 1.270883, -0.7349189, 0.3254902, 1, 0, 1,
-0.6601912, -1.00412, -1.86433, 0.3215686, 1, 0, 1,
-0.6592225, -1.124145, -2.969322, 0.3137255, 1, 0, 1,
-0.6545734, 0.6150861, -0.8780938, 0.3098039, 1, 0, 1,
-0.650159, -1.101898, -1.791928, 0.3019608, 1, 0, 1,
-0.6488188, 1.26364, -0.742833, 0.2941177, 1, 0, 1,
-0.6459157, -0.3109101, -4.216766, 0.2901961, 1, 0, 1,
-0.6423973, -0.4691427, -2.173823, 0.282353, 1, 0, 1,
-0.641572, 0.3693694, 0.07137241, 0.2784314, 1, 0, 1,
-0.6411357, -0.669078, -2.079801, 0.2705882, 1, 0, 1,
-0.639762, 1.12488, -0.9172216, 0.2666667, 1, 0, 1,
-0.6385981, -0.3617435, -3.591815, 0.2588235, 1, 0, 1,
-0.6297644, -0.3588862, -2.025318, 0.254902, 1, 0, 1,
-0.6285107, -2.498635, -3.103264, 0.2470588, 1, 0, 1,
-0.6284524, -0.7432297, -2.468067, 0.2431373, 1, 0, 1,
-0.626578, 0.9577802, -1.779561, 0.2352941, 1, 0, 1,
-0.6254479, 0.3451084, -1.820337, 0.2313726, 1, 0, 1,
-0.6236293, -1.547345, -2.223882, 0.2235294, 1, 0, 1,
-0.6223361, -0.09093831, -1.93669, 0.2196078, 1, 0, 1,
-0.6217264, 1.41064, -0.7732235, 0.2117647, 1, 0, 1,
-0.6178142, 1.423219, -0.6513649, 0.2078431, 1, 0, 1,
-0.614925, 0.2247691, -0.8217832, 0.2, 1, 0, 1,
-0.6148038, -0.915178, -4.296356, 0.1921569, 1, 0, 1,
-0.6118716, -0.1609819, -0.4510263, 0.1882353, 1, 0, 1,
-0.6097445, 0.8037911, 0.8646188, 0.1803922, 1, 0, 1,
-0.6095797, 1.585176, -0.4875566, 0.1764706, 1, 0, 1,
-0.6062794, -0.3998142, -1.510522, 0.1686275, 1, 0, 1,
-0.6037055, 0.3179186, -1.618378, 0.1647059, 1, 0, 1,
-0.6036842, 0.8738239, -2.589157, 0.1568628, 1, 0, 1,
-0.6014886, -0.5040461, -0.8539307, 0.1529412, 1, 0, 1,
-0.598497, 0.4683543, -0.3018227, 0.145098, 1, 0, 1,
-0.5982191, -0.7591122, -2.625036, 0.1411765, 1, 0, 1,
-0.5973448, 0.8712126, -0.975466, 0.1333333, 1, 0, 1,
-0.5951915, -1.370346, -4.166483, 0.1294118, 1, 0, 1,
-0.5919754, 0.6212348, 1.208847, 0.1215686, 1, 0, 1,
-0.5891783, 0.1855921, -1.703346, 0.1176471, 1, 0, 1,
-0.5800537, -1.173428, -3.191433, 0.1098039, 1, 0, 1,
-0.5773112, 0.3400228, -0.7264156, 0.1058824, 1, 0, 1,
-0.5710958, -0.1665846, -2.224983, 0.09803922, 1, 0, 1,
-0.5704167, 0.7170327, -0.1194772, 0.09019608, 1, 0, 1,
-0.5668358, -1.760022, -3.809984, 0.08627451, 1, 0, 1,
-0.5654298, 1.759102, -0.6902907, 0.07843138, 1, 0, 1,
-0.5556426, -0.6040018, -1.64588, 0.07450981, 1, 0, 1,
-0.5535406, -0.1925703, -0.6937616, 0.06666667, 1, 0, 1,
-0.5520405, -0.9519894, -1.541927, 0.0627451, 1, 0, 1,
-0.5510242, 0.6570261, 1.30738, 0.05490196, 1, 0, 1,
-0.5498875, 0.03423616, -2.916279, 0.05098039, 1, 0, 1,
-0.5425441, 0.5448714, -2.072096, 0.04313726, 1, 0, 1,
-0.5424881, 0.6524134, -2.07724, 0.03921569, 1, 0, 1,
-0.5400153, 1.019003, -0.05095108, 0.03137255, 1, 0, 1,
-0.5388523, 0.1620021, -2.267401, 0.02745098, 1, 0, 1,
-0.537594, -0.08670629, -1.505808, 0.01960784, 1, 0, 1,
-0.5226898, -0.2089631, -0.4495542, 0.01568628, 1, 0, 1,
-0.5209191, -1.086566, -1.655308, 0.007843138, 1, 0, 1,
-0.5180284, 1.066373, 0.8807566, 0.003921569, 1, 0, 1,
-0.5130362, -0.9131282, -1.383588, 0, 1, 0.003921569, 1,
-0.5058727, -0.8665775, -2.270903, 0, 1, 0.01176471, 1,
-0.50581, -0.4186505, -1.664422, 0, 1, 0.01568628, 1,
-0.501829, -0.6454935, -1.016503, 0, 1, 0.02352941, 1,
-0.4958653, -0.2621845, -1.912452, 0, 1, 0.02745098, 1,
-0.4957814, 1.41245, -1.474685, 0, 1, 0.03529412, 1,
-0.49331, -0.6025648, -5.618658, 0, 1, 0.03921569, 1,
-0.490958, -0.8285245, -3.457866, 0, 1, 0.04705882, 1,
-0.4818405, -1.282156, -2.144945, 0, 1, 0.05098039, 1,
-0.4774607, 0.6552399, -1.346595, 0, 1, 0.05882353, 1,
-0.4763376, -0.2131037, -1.848536, 0, 1, 0.0627451, 1,
-0.4718992, 0.2362753, -2.106798, 0, 1, 0.07058824, 1,
-0.4700696, 1.056843, 0.2624594, 0, 1, 0.07450981, 1,
-0.4694754, -1.069586, -0.2336607, 0, 1, 0.08235294, 1,
-0.4548152, 0.007507603, -2.484601, 0, 1, 0.08627451, 1,
-0.4529001, 1.500714, 0.04791239, 0, 1, 0.09411765, 1,
-0.4527447, 1.119904, -2.207364, 0, 1, 0.1019608, 1,
-0.4511614, -0.1698913, -2.23318, 0, 1, 0.1058824, 1,
-0.4488742, -0.9337659, -1.671696, 0, 1, 0.1137255, 1,
-0.4478686, -0.0607644, -2.335811, 0, 1, 0.1176471, 1,
-0.4440976, -0.4458086, -1.832027, 0, 1, 0.1254902, 1,
-0.4360273, 2.334698, -0.1024682, 0, 1, 0.1294118, 1,
-0.4351472, -0.4803644, -1.669629, 0, 1, 0.1372549, 1,
-0.4276112, 1.0288, 0.3737849, 0, 1, 0.1411765, 1,
-0.4266116, -1.471257, -3.357719, 0, 1, 0.1490196, 1,
-0.4250916, 0.5141463, -0.0794491, 0, 1, 0.1529412, 1,
-0.4246782, 1.722495, -1.467305, 0, 1, 0.1607843, 1,
-0.4194984, -0.3741836, -2.107851, 0, 1, 0.1647059, 1,
-0.4155196, 1.540394, -0.5309938, 0, 1, 0.172549, 1,
-0.4135838, 0.9717715, -1.095542, 0, 1, 0.1764706, 1,
-0.4130391, -0.8476907, -3.746437, 0, 1, 0.1843137, 1,
-0.4130292, -0.5552157, -2.846564, 0, 1, 0.1882353, 1,
-0.4126484, 0.543272, 2.054595, 0, 1, 0.1960784, 1,
-0.4093261, -2.542609, -3.190556, 0, 1, 0.2039216, 1,
-0.4075271, 0.7654944, -1.27246, 0, 1, 0.2078431, 1,
-0.4073659, 0.6465303, 0.0162633, 0, 1, 0.2156863, 1,
-0.401623, 1.460054, -0.9345941, 0, 1, 0.2196078, 1,
-0.4011566, -0.07168661, -1.198391, 0, 1, 0.227451, 1,
-0.3968914, 0.7409393, -1.140576, 0, 1, 0.2313726, 1,
-0.3891165, -1.847388, -2.808992, 0, 1, 0.2392157, 1,
-0.3881069, -0.2522724, -1.593139, 0, 1, 0.2431373, 1,
-0.3874128, 1.619537, -1.890242, 0, 1, 0.2509804, 1,
-0.3867852, -0.1549509, -2.418251, 0, 1, 0.254902, 1,
-0.3788056, -1.361298, -3.719182, 0, 1, 0.2627451, 1,
-0.3783982, -0.5708886, -1.709813, 0, 1, 0.2666667, 1,
-0.3781264, 1.786688, 0.3734657, 0, 1, 0.2745098, 1,
-0.3763918, 1.387985, 0.1368567, 0, 1, 0.2784314, 1,
-0.3741205, -0.5189837, -1.10014, 0, 1, 0.2862745, 1,
-0.3679154, 2.294697, 0.05733906, 0, 1, 0.2901961, 1,
-0.3669505, 0.5971776, 0.956434, 0, 1, 0.2980392, 1,
-0.364215, 0.2041772, -1.387103, 0, 1, 0.3058824, 1,
-0.3640524, -0.6906444, -2.29278, 0, 1, 0.3098039, 1,
-0.3612337, -0.6968863, -2.136102, 0, 1, 0.3176471, 1,
-0.357771, -1.260192, -3.678103, 0, 1, 0.3215686, 1,
-0.3577467, -0.2005722, -3.599523, 0, 1, 0.3294118, 1,
-0.3577112, 0.01930691, -1.632361, 0, 1, 0.3333333, 1,
-0.3575177, -0.9026308, -1.539892, 0, 1, 0.3411765, 1,
-0.3561473, 0.913601, 0.1945061, 0, 1, 0.345098, 1,
-0.3555072, 1.205608, 0.1051131, 0, 1, 0.3529412, 1,
-0.353145, 1.217713, 0.06695414, 0, 1, 0.3568628, 1,
-0.3468634, -1.478597, -0.7670132, 0, 1, 0.3647059, 1,
-0.3455368, -0.6412949, -4.044435, 0, 1, 0.3686275, 1,
-0.3437161, -0.264192, -2.032979, 0, 1, 0.3764706, 1,
-0.3421157, 1.110878, -0.7714057, 0, 1, 0.3803922, 1,
-0.3416473, 0.5249333, -0.001368177, 0, 1, 0.3882353, 1,
-0.341494, 0.8611066, -0.693391, 0, 1, 0.3921569, 1,
-0.3389387, -0.2388656, -0.8234265, 0, 1, 0.4, 1,
-0.335207, 1.17427, 0.03598939, 0, 1, 0.4078431, 1,
-0.3345793, 1.048896, -2.20925, 0, 1, 0.4117647, 1,
-0.3288088, 0.3409079, -1.111993, 0, 1, 0.4196078, 1,
-0.3208499, -0.9817256, -1.449294, 0, 1, 0.4235294, 1,
-0.3187623, -0.5016844, -1.709559, 0, 1, 0.4313726, 1,
-0.3186323, -0.4051107, -1.774586, 0, 1, 0.4352941, 1,
-0.3149903, -0.5941232, -2.756386, 0, 1, 0.4431373, 1,
-0.3147206, 0.8646494, 0.06245032, 0, 1, 0.4470588, 1,
-0.3135782, -0.6776711, -1.435558, 0, 1, 0.454902, 1,
-0.3110599, -0.3621633, -2.183162, 0, 1, 0.4588235, 1,
-0.3107288, -0.01678832, -2.068638, 0, 1, 0.4666667, 1,
-0.3071783, 0.8453413, -0.9618672, 0, 1, 0.4705882, 1,
-0.3066841, 0.3522433, -1.155772, 0, 1, 0.4784314, 1,
-0.3064871, -0.1849849, -1.524693, 0, 1, 0.4823529, 1,
-0.3038589, -0.3849295, -2.159823, 0, 1, 0.4901961, 1,
-0.3036259, 1.66577, 0.2095874, 0, 1, 0.4941176, 1,
-0.3027914, -0.5828037, -1.949885, 0, 1, 0.5019608, 1,
-0.301723, 0.2574718, 0.4126915, 0, 1, 0.509804, 1,
-0.3015329, 1.873805, -0.6324714, 0, 1, 0.5137255, 1,
-0.3011115, 0.1311174, -1.886654, 0, 1, 0.5215687, 1,
-0.3001963, 0.3231784, 0.3767253, 0, 1, 0.5254902, 1,
-0.2912008, 0.3057603, -1.747241, 0, 1, 0.5333334, 1,
-0.2826105, -0.3103179, -3.039729, 0, 1, 0.5372549, 1,
-0.2766749, -0.1512106, -2.712558, 0, 1, 0.5450981, 1,
-0.2711848, 0.7038462, -1.417929, 0, 1, 0.5490196, 1,
-0.2710464, -0.2139401, -2.981014, 0, 1, 0.5568628, 1,
-0.2687237, 2.310411, 1.687636, 0, 1, 0.5607843, 1,
-0.265414, -1.132934, -3.928355, 0, 1, 0.5686275, 1,
-0.2643107, -0.7799675, -3.104631, 0, 1, 0.572549, 1,
-0.2639438, 1.802348, 1.444331, 0, 1, 0.5803922, 1,
-0.2556753, 0.07545599, -1.217946, 0, 1, 0.5843138, 1,
-0.2540187, -0.2152328, -3.270041, 0, 1, 0.5921569, 1,
-0.251416, -1.387821, -4.202915, 0, 1, 0.5960785, 1,
-0.2512954, -0.189562, -2.573662, 0, 1, 0.6039216, 1,
-0.2494574, 0.3588249, -2.239537, 0, 1, 0.6117647, 1,
-0.2446227, 0.7060865, -1.519491, 0, 1, 0.6156863, 1,
-0.2440321, -0.1017698, -2.839694, 0, 1, 0.6235294, 1,
-0.2390331, 0.4659933, -1.25577, 0, 1, 0.627451, 1,
-0.2366075, -0.8981648, -1.12822, 0, 1, 0.6352941, 1,
-0.2362118, 0.5808833, -2.134883, 0, 1, 0.6392157, 1,
-0.2353185, -0.2238826, -2.915515, 0, 1, 0.6470588, 1,
-0.2325533, -1.112688, -3.029852, 0, 1, 0.6509804, 1,
-0.2316344, -1.373956, -1.860723, 0, 1, 0.6588235, 1,
-0.2263336, -0.2857684, -1.441002, 0, 1, 0.6627451, 1,
-0.2249419, 1.103312, 1.055505, 0, 1, 0.6705883, 1,
-0.2198999, -0.06359567, -0.8765082, 0, 1, 0.6745098, 1,
-0.2126432, -0.2848159, -5.183331, 0, 1, 0.682353, 1,
-0.2119762, 0.1167807, -1.690925, 0, 1, 0.6862745, 1,
-0.2103157, -1.086313, -3.114801, 0, 1, 0.6941177, 1,
-0.2101685, 0.7966201, 0.6728349, 0, 1, 0.7019608, 1,
-0.2097868, -0.3545759, -2.56682, 0, 1, 0.7058824, 1,
-0.2091356, 1.267691, -0.02627384, 0, 1, 0.7137255, 1,
-0.2072515, -0.01118145, -1.691418, 0, 1, 0.7176471, 1,
-0.2070611, 0.3587703, 0.3968438, 0, 1, 0.7254902, 1,
-0.1982755, 0.2833347, -1.534289, 0, 1, 0.7294118, 1,
-0.1961108, 0.08361945, -1.895693, 0, 1, 0.7372549, 1,
-0.1886173, -0.4142682, -2.058157, 0, 1, 0.7411765, 1,
-0.1811858, 0.6432562, -2.465947, 0, 1, 0.7490196, 1,
-0.1811128, -0.290387, -2.605545, 0, 1, 0.7529412, 1,
-0.179373, -0.516139, -3.853207, 0, 1, 0.7607843, 1,
-0.1728196, 1.059753, -1.035298, 0, 1, 0.7647059, 1,
-0.1718805, 1.768137, 1.843128, 0, 1, 0.772549, 1,
-0.1718386, -0.5195932, -2.70269, 0, 1, 0.7764706, 1,
-0.1694445, -0.195763, -1.584421, 0, 1, 0.7843137, 1,
-0.1694416, 1.265314, 0.9841548, 0, 1, 0.7882353, 1,
-0.1687334, -1.494532, -4.129794, 0, 1, 0.7960784, 1,
-0.1652546, -0.5560917, -2.174264, 0, 1, 0.8039216, 1,
-0.1623017, 1.133646, -2.311549, 0, 1, 0.8078431, 1,
-0.1607028, 0.442949, 0.6576532, 0, 1, 0.8156863, 1,
-0.1601587, 1.132338, 0.7484365, 0, 1, 0.8196079, 1,
-0.1591486, -2.127457, -2.268466, 0, 1, 0.827451, 1,
-0.1581104, -1.419222, -2.627213, 0, 1, 0.8313726, 1,
-0.1552245, 0.1651563, 0.6866883, 0, 1, 0.8392157, 1,
-0.15349, -1.988672, -3.811343, 0, 1, 0.8431373, 1,
-0.1521845, 1.345007, 0.2222436, 0, 1, 0.8509804, 1,
-0.1492079, 1.234176, -1.454368, 0, 1, 0.854902, 1,
-0.1393092, 1.329552, 0.6987395, 0, 1, 0.8627451, 1,
-0.1389715, -0.1138229, -2.277205, 0, 1, 0.8666667, 1,
-0.1388221, -0.1443063, -1.324433, 0, 1, 0.8745098, 1,
-0.1364371, -0.925688, -3.836632, 0, 1, 0.8784314, 1,
-0.1364125, 0.7630676, -0.5130765, 0, 1, 0.8862745, 1,
-0.1347578, 0.109063, -2.135174, 0, 1, 0.8901961, 1,
-0.1312993, -1.134322, -2.782881, 0, 1, 0.8980392, 1,
-0.1296143, 0.9173595, -1.093475, 0, 1, 0.9058824, 1,
-0.1272345, -1.1533, -1.980992, 0, 1, 0.9098039, 1,
-0.1183646, 1.607455, 0.379944, 0, 1, 0.9176471, 1,
-0.1147072, 1.08171, -0.1527663, 0, 1, 0.9215686, 1,
-0.1127117, 0.8906752, -0.5164338, 0, 1, 0.9294118, 1,
-0.1124748, -1.546147, -3.340545, 0, 1, 0.9333333, 1,
-0.1107043, 0.7405067, -1.178983, 0, 1, 0.9411765, 1,
-0.1089862, 1.388184, 0.4611676, 0, 1, 0.945098, 1,
-0.1040575, -0.3239786, -3.053362, 0, 1, 0.9529412, 1,
-0.1016712, -0.1551922, -2.949772, 0, 1, 0.9568627, 1,
-0.09915756, -0.8052909, -2.430262, 0, 1, 0.9647059, 1,
-0.09668079, 0.9765401, -2.664861, 0, 1, 0.9686275, 1,
-0.09564421, -0.2228048, -3.200538, 0, 1, 0.9764706, 1,
-0.09557738, -1.029943, -3.087475, 0, 1, 0.9803922, 1,
-0.09009281, 1.708264, -0.4092477, 0, 1, 0.9882353, 1,
-0.08569474, -0.2347946, -3.972796, 0, 1, 0.9921569, 1,
-0.08359471, 0.5246893, -0.05817679, 0, 1, 1, 1,
-0.08224867, 0.9578529, 1.361007, 0, 0.9921569, 1, 1,
-0.08223015, -0.6720569, -3.503738, 0, 0.9882353, 1, 1,
-0.08116794, 1.507819, -1.593925, 0, 0.9803922, 1, 1,
-0.0804754, -0.04708601, -1.479893, 0, 0.9764706, 1, 1,
-0.07593247, 0.05514731, -1.113378, 0, 0.9686275, 1, 1,
-0.07403087, 1.572965, -1.129911, 0, 0.9647059, 1, 1,
-0.07357629, -0.07726985, -2.499533, 0, 0.9568627, 1, 1,
-0.07131662, -1.799828, -3.263314, 0, 0.9529412, 1, 1,
-0.07110868, 0.7103335, -0.3448834, 0, 0.945098, 1, 1,
-0.06380221, -0.4025392, -4.251157, 0, 0.9411765, 1, 1,
-0.06378461, -0.521648, -3.588902, 0, 0.9333333, 1, 1,
-0.0556643, 0.1215576, -1.707606, 0, 0.9294118, 1, 1,
-0.05447421, -1.09971, -3.340973, 0, 0.9215686, 1, 1,
-0.05422503, -0.8843903, -1.877032, 0, 0.9176471, 1, 1,
-0.0522014, -1.805738, -2.10901, 0, 0.9098039, 1, 1,
-0.05139094, -0.542546, -1.659102, 0, 0.9058824, 1, 1,
-0.0491934, 0.01744807, -1.387996, 0, 0.8980392, 1, 1,
-0.04821925, 1.09749, -0.9451491, 0, 0.8901961, 1, 1,
-0.04578515, 1.782949, -0.2928713, 0, 0.8862745, 1, 1,
-0.04518173, -1.098874, -2.27624, 0, 0.8784314, 1, 1,
-0.04464762, 0.68613, 0.8818141, 0, 0.8745098, 1, 1,
-0.04201884, 0.3330868, -0.3053039, 0, 0.8666667, 1, 1,
-0.04035756, -1.058367, -2.240802, 0, 0.8627451, 1, 1,
-0.03856015, 0.2793853, 0.5670984, 0, 0.854902, 1, 1,
-0.03603795, -0.4154184, -3.190191, 0, 0.8509804, 1, 1,
-0.03543993, -0.8230503, -2.99396, 0, 0.8431373, 1, 1,
-0.03129824, -0.9884614, -0.5113087, 0, 0.8392157, 1, 1,
-0.02217347, -1.199035, -1.988223, 0, 0.8313726, 1, 1,
-0.02008758, 1.814716, 1.996927, 0, 0.827451, 1, 1,
-0.01636903, -0.3755061, -4.186225, 0, 0.8196079, 1, 1,
-0.01237419, 0.5097632, -0.2042988, 0, 0.8156863, 1, 1,
-0.01175353, -0.275169, -2.888403, 0, 0.8078431, 1, 1,
-0.0093586, -1.224505, -3.924182, 0, 0.8039216, 1, 1,
-0.009169475, 0.8017252, 0.1448198, 0, 0.7960784, 1, 1,
-0.005206563, 0.8250853, 0.7149771, 0, 0.7882353, 1, 1,
0.00174578, -1.364184, 4.389903, 0, 0.7843137, 1, 1,
0.004902111, -1.362805, 4.92038, 0, 0.7764706, 1, 1,
0.004950956, -1.06337, 2.912659, 0, 0.772549, 1, 1,
0.005624313, 0.3469837, -0.02654184, 0, 0.7647059, 1, 1,
0.01323149, 0.1271762, 1.287308, 0, 0.7607843, 1, 1,
0.01555863, 0.6651361, 1.903526, 0, 0.7529412, 1, 1,
0.01870825, 0.3886171, -0.3809813, 0, 0.7490196, 1, 1,
0.02071545, 0.7950533, -0.7858378, 0, 0.7411765, 1, 1,
0.02091294, 0.7823225, 0.1931705, 0, 0.7372549, 1, 1,
0.02104247, -0.1466013, 2.248552, 0, 0.7294118, 1, 1,
0.02595249, -0.6531496, 4.237373, 0, 0.7254902, 1, 1,
0.03281821, 1.055561, 1.452302, 0, 0.7176471, 1, 1,
0.03423515, 0.09297895, 0.393765, 0, 0.7137255, 1, 1,
0.03437931, 1.318214, -0.3437126, 0, 0.7058824, 1, 1,
0.04432103, 0.3039804, 0.1841429, 0, 0.6980392, 1, 1,
0.04681028, -0.09434979, 2.077358, 0, 0.6941177, 1, 1,
0.05087332, 0.6037788, -0.7573653, 0, 0.6862745, 1, 1,
0.05172445, 0.1856654, 0.3136, 0, 0.682353, 1, 1,
0.05623263, -0.6377901, 4.004456, 0, 0.6745098, 1, 1,
0.05725318, -0.700238, 4.388953, 0, 0.6705883, 1, 1,
0.0593089, 0.4795921, -0.7683628, 0, 0.6627451, 1, 1,
0.06183029, -0.8859801, 2.217584, 0, 0.6588235, 1, 1,
0.06199802, 2.59607, -1.618295, 0, 0.6509804, 1, 1,
0.06245958, -0.2382403, 3.341964, 0, 0.6470588, 1, 1,
0.0626671, 1.000634, -0.7834598, 0, 0.6392157, 1, 1,
0.06423607, -0.3928258, 3.994063, 0, 0.6352941, 1, 1,
0.06794699, -1.640364, 3.298965, 0, 0.627451, 1, 1,
0.07072288, -1.864761, 4.16173, 0, 0.6235294, 1, 1,
0.07094383, 0.485172, -0.1936436, 0, 0.6156863, 1, 1,
0.07165951, 1.961854, -0.09724662, 0, 0.6117647, 1, 1,
0.0741917, -0.2949906, 2.506193, 0, 0.6039216, 1, 1,
0.07663465, -0.2228694, 5.064014, 0, 0.5960785, 1, 1,
0.07896047, 0.01527505, -0.1829155, 0, 0.5921569, 1, 1,
0.08007651, 1.026877, -0.3705115, 0, 0.5843138, 1, 1,
0.08170542, 0.8397416, -0.757865, 0, 0.5803922, 1, 1,
0.0863949, -0.5324904, 4.1379, 0, 0.572549, 1, 1,
0.08704972, -0.9357193, 4.568516, 0, 0.5686275, 1, 1,
0.09540316, 0.4271684, 0.3024393, 0, 0.5607843, 1, 1,
0.1026222, -0.387651, 2.129066, 0, 0.5568628, 1, 1,
0.1043605, -0.7376141, 5.065739, 0, 0.5490196, 1, 1,
0.1063553, -1.391247, 2.055656, 0, 0.5450981, 1, 1,
0.1087285, 1.961864, 0.07936037, 0, 0.5372549, 1, 1,
0.1106006, 0.2151157, 0.4076439, 0, 0.5333334, 1, 1,
0.1106389, -0.0813664, 1.163777, 0, 0.5254902, 1, 1,
0.1111073, -0.06552836, 1.020564, 0, 0.5215687, 1, 1,
0.1122607, -1.126982, 2.518458, 0, 0.5137255, 1, 1,
0.1181888, 0.8750429, 0.2305864, 0, 0.509804, 1, 1,
0.1195169, -0.02138561, 1.594096, 0, 0.5019608, 1, 1,
0.1224414, -1.518734, 2.835064, 0, 0.4941176, 1, 1,
0.1258825, -0.3444281, 3.491287, 0, 0.4901961, 1, 1,
0.1258927, -0.5158473, 3.193926, 0, 0.4823529, 1, 1,
0.1329143, 0.3345946, 0.5418479, 0, 0.4784314, 1, 1,
0.1384529, 0.6568341, -0.7564384, 0, 0.4705882, 1, 1,
0.1385982, -1.38174, 4.759665, 0, 0.4666667, 1, 1,
0.1411888, -0.4395244, 0.8158685, 0, 0.4588235, 1, 1,
0.1418677, 0.5573747, 0.9683555, 0, 0.454902, 1, 1,
0.1455905, 0.7497772, 0.03570477, 0, 0.4470588, 1, 1,
0.150893, 0.2084992, 1.851804, 0, 0.4431373, 1, 1,
0.1645144, -0.1865892, 0.2739683, 0, 0.4352941, 1, 1,
0.1689301, -0.5709081, 2.329893, 0, 0.4313726, 1, 1,
0.1692652, -0.22307, 2.263703, 0, 0.4235294, 1, 1,
0.1770578, -0.5924204, 1.785476, 0, 0.4196078, 1, 1,
0.177241, 0.08219371, 0.1657684, 0, 0.4117647, 1, 1,
0.1794697, 0.4347776, -0.2479896, 0, 0.4078431, 1, 1,
0.1836712, 0.6130562, 0.3460046, 0, 0.4, 1, 1,
0.1856892, -2.095745, 4.039401, 0, 0.3921569, 1, 1,
0.186931, 0.4777909, -0.3716871, 0, 0.3882353, 1, 1,
0.1874573, 0.2425557, 0.6232435, 0, 0.3803922, 1, 1,
0.1918812, -0.6319528, 2.137901, 0, 0.3764706, 1, 1,
0.1928845, 0.005476896, 1.482187, 0, 0.3686275, 1, 1,
0.1943861, 0.2215893, 2.274858, 0, 0.3647059, 1, 1,
0.1965303, 0.9687479, 1.067026, 0, 0.3568628, 1, 1,
0.1995242, -0.1694072, 0.4613148, 0, 0.3529412, 1, 1,
0.2023962, -0.1951854, 0.8721887, 0, 0.345098, 1, 1,
0.2085684, 0.2369641, 0.285712, 0, 0.3411765, 1, 1,
0.2102858, 1.126162, -0.7525154, 0, 0.3333333, 1, 1,
0.2134797, -0.1765526, 3.48922, 0, 0.3294118, 1, 1,
0.2147951, 0.001425983, 1.837781, 0, 0.3215686, 1, 1,
0.2165645, -0.4372307, 4.035514, 0, 0.3176471, 1, 1,
0.2169946, -0.6170713, 2.499688, 0, 0.3098039, 1, 1,
0.2280307, -0.06741126, 0.9223884, 0, 0.3058824, 1, 1,
0.2328911, -1.392099, 3.014266, 0, 0.2980392, 1, 1,
0.2368943, 0.7650878, -1.371153, 0, 0.2901961, 1, 1,
0.2375336, -2.755627, 3.74817, 0, 0.2862745, 1, 1,
0.2385425, -1.593092, 4.457024, 0, 0.2784314, 1, 1,
0.2391415, 1.340487, -0.494291, 0, 0.2745098, 1, 1,
0.24765, 2.388699, 0.3372235, 0, 0.2666667, 1, 1,
0.2513872, 0.9710649, 0.156435, 0, 0.2627451, 1, 1,
0.2547998, 0.7641118, -1.253982, 0, 0.254902, 1, 1,
0.2570821, -0.8280118, 4.423096, 0, 0.2509804, 1, 1,
0.2641733, 1.052765, -1.017453, 0, 0.2431373, 1, 1,
0.2669419, -0.7700573, 3.881768, 0, 0.2392157, 1, 1,
0.2670927, 0.1964445, 0.7971123, 0, 0.2313726, 1, 1,
0.2719836, 1.77804, 1.104799, 0, 0.227451, 1, 1,
0.2751822, -0.2091807, 3.138752, 0, 0.2196078, 1, 1,
0.2772768, 1.761891, -1.274139, 0, 0.2156863, 1, 1,
0.2841923, -2.679647, 2.684804, 0, 0.2078431, 1, 1,
0.2853903, -1.149812, 3.874447, 0, 0.2039216, 1, 1,
0.2869707, -1.064025, 3.670491, 0, 0.1960784, 1, 1,
0.2888913, 1.212523, 1.315251, 0, 0.1882353, 1, 1,
0.2937709, -0.4976623, 1.082977, 0, 0.1843137, 1, 1,
0.2940174, 0.4969497, 1.081265, 0, 0.1764706, 1, 1,
0.2945974, 1.090119, 0.6962698, 0, 0.172549, 1, 1,
0.2988687, -0.5759885, 2.042724, 0, 0.1647059, 1, 1,
0.3033852, -2.198131, 3.67466, 0, 0.1607843, 1, 1,
0.305348, 0.9013345, -0.9383703, 0, 0.1529412, 1, 1,
0.3057386, 1.955483, 0.2950065, 0, 0.1490196, 1, 1,
0.3060457, 0.6920748, 0.5739172, 0, 0.1411765, 1, 1,
0.3176527, 0.06199855, 0.5644535, 0, 0.1372549, 1, 1,
0.3193749, 0.6424969, 1.128952, 0, 0.1294118, 1, 1,
0.3212729, 1.99045, 0.2770717, 0, 0.1254902, 1, 1,
0.3244214, -0.1859397, 1.746332, 0, 0.1176471, 1, 1,
0.3261246, 0.7421994, 0.9352568, 0, 0.1137255, 1, 1,
0.341245, 0.7894114, 1.404542, 0, 0.1058824, 1, 1,
0.343907, -0.9439399, 4.326331, 0, 0.09803922, 1, 1,
0.3455591, 0.8442845, -0.361677, 0, 0.09411765, 1, 1,
0.3488361, 0.6449092, 0.9042365, 0, 0.08627451, 1, 1,
0.3497712, 0.6905136, -0.6381091, 0, 0.08235294, 1, 1,
0.3505576, -2.187865, 3.786568, 0, 0.07450981, 1, 1,
0.3611861, 0.917042, -1.837592, 0, 0.07058824, 1, 1,
0.3612806, 1.000622, 0.6367384, 0, 0.0627451, 1, 1,
0.3682842, -0.8078548, 2.373664, 0, 0.05882353, 1, 1,
0.3706721, 0.3733093, 2.986389, 0, 0.05098039, 1, 1,
0.3752103, 0.9518704, 1.457653, 0, 0.04705882, 1, 1,
0.377037, -0.9265128, 4.449293, 0, 0.03921569, 1, 1,
0.3805778, -0.9400302, 2.790706, 0, 0.03529412, 1, 1,
0.3842901, 1.49644, 0.9228214, 0, 0.02745098, 1, 1,
0.3846671, 0.1383898, 1.538153, 0, 0.02352941, 1, 1,
0.3847983, 0.7457802, -0.5243762, 0, 0.01568628, 1, 1,
0.3907556, 0.9650217, 1.627726, 0, 0.01176471, 1, 1,
0.3976726, -0.02524594, 1.723045, 0, 0.003921569, 1, 1,
0.4025722, -1.59289, 2.688189, 0.003921569, 0, 1, 1,
0.4032703, -0.7457668, 2.545888, 0.007843138, 0, 1, 1,
0.4057491, 1.811579, 2.06717, 0.01568628, 0, 1, 1,
0.4070373, -0.5473349, 1.595289, 0.01960784, 0, 1, 1,
0.4085377, 0.07315808, -0.4917562, 0.02745098, 0, 1, 1,
0.4106119, -1.369162, 3.658086, 0.03137255, 0, 1, 1,
0.4183533, -0.9727693, 2.404775, 0.03921569, 0, 1, 1,
0.4189291, -0.4288701, 1.600806, 0.04313726, 0, 1, 1,
0.4195237, 0.002506721, 1.88697, 0.05098039, 0, 1, 1,
0.4207563, -0.8467504, 1.484311, 0.05490196, 0, 1, 1,
0.420976, -0.4314609, 1.749995, 0.0627451, 0, 1, 1,
0.4214722, 1.100294, 0.6377894, 0.06666667, 0, 1, 1,
0.4239108, -0.4747534, 0.5912135, 0.07450981, 0, 1, 1,
0.4246654, 0.8185171, -0.2098484, 0.07843138, 0, 1, 1,
0.4303547, 2.373449, 0.9988699, 0.08627451, 0, 1, 1,
0.4323322, -1.270758, 4.577631, 0.09019608, 0, 1, 1,
0.4328289, -0.8007114, 3.603972, 0.09803922, 0, 1, 1,
0.4420342, 0.849418, 2.248547, 0.1058824, 0, 1, 1,
0.4422626, -0.418563, 1.292749, 0.1098039, 0, 1, 1,
0.4425113, 0.1965171, 0.8682798, 0.1176471, 0, 1, 1,
0.4501246, -0.4411359, 2.794746, 0.1215686, 0, 1, 1,
0.450723, -1.232784, 5.259198, 0.1294118, 0, 1, 1,
0.4515557, -0.4879586, 3.194483, 0.1333333, 0, 1, 1,
0.4520169, -0.6998712, 2.48297, 0.1411765, 0, 1, 1,
0.4522029, 0.6929513, 0.5514187, 0.145098, 0, 1, 1,
0.4547916, 0.1012622, 1.698772, 0.1529412, 0, 1, 1,
0.4556719, -1.341043, 1.544687, 0.1568628, 0, 1, 1,
0.4560589, -0.3849297, 1.78159, 0.1647059, 0, 1, 1,
0.4571502, -0.8145815, 2.389167, 0.1686275, 0, 1, 1,
0.4671672, 0.4017596, 1.264492, 0.1764706, 0, 1, 1,
0.467413, -1.278887, 3.098938, 0.1803922, 0, 1, 1,
0.4678193, 0.633182, 2.122185, 0.1882353, 0, 1, 1,
0.4683844, -0.0872872, 1.020081, 0.1921569, 0, 1, 1,
0.4728823, 0.7750651, -0.3673598, 0.2, 0, 1, 1,
0.4809363, -0.5648333, 0.7403632, 0.2078431, 0, 1, 1,
0.4813737, 0.1743944, 0.8737397, 0.2117647, 0, 1, 1,
0.4915852, -0.2539167, 1.965221, 0.2196078, 0, 1, 1,
0.4935668, -0.7427533, 3.487468, 0.2235294, 0, 1, 1,
0.4975489, -0.8624418, 4.340853, 0.2313726, 0, 1, 1,
0.4993365, -0.5594101, 2.944522, 0.2352941, 0, 1, 1,
0.5004749, -0.4056739, 3.287486, 0.2431373, 0, 1, 1,
0.5004871, 1.262286, -0.3348176, 0.2470588, 0, 1, 1,
0.5011969, -0.225053, 1.756311, 0.254902, 0, 1, 1,
0.5027228, -0.5842886, 1.719856, 0.2588235, 0, 1, 1,
0.5053309, -1.322461, 1.221867, 0.2666667, 0, 1, 1,
0.5071706, -0.07427902, 2.272132, 0.2705882, 0, 1, 1,
0.5138672, 0.1554675, -0.9039183, 0.2784314, 0, 1, 1,
0.5140722, -0.1094891, 0.9385567, 0.282353, 0, 1, 1,
0.5242018, 0.1788443, 2.557951, 0.2901961, 0, 1, 1,
0.5282521, -1.268052, 3.053641, 0.2941177, 0, 1, 1,
0.5344132, 1.626404, 1.051933, 0.3019608, 0, 1, 1,
0.536168, 0.8315259, 0.749179, 0.3098039, 0, 1, 1,
0.542782, -0.2714319, 2.774138, 0.3137255, 0, 1, 1,
0.5457945, 1.254329, 1.202297, 0.3215686, 0, 1, 1,
0.5499605, -1.078535, 3.141038, 0.3254902, 0, 1, 1,
0.5516921, 0.4843065, 2.172165, 0.3333333, 0, 1, 1,
0.5618979, -0.05450985, 0.9682527, 0.3372549, 0, 1, 1,
0.5666162, -1.030673, 3.77145, 0.345098, 0, 1, 1,
0.5730272, 0.6149466, 0.7970508, 0.3490196, 0, 1, 1,
0.5908131, -0.3636172, 2.013003, 0.3568628, 0, 1, 1,
0.5979316, -0.09773944, 0.4706329, 0.3607843, 0, 1, 1,
0.5990577, -0.3626064, 3.418332, 0.3686275, 0, 1, 1,
0.6042848, 0.1752154, 0.3569427, 0.372549, 0, 1, 1,
0.6063014, 0.4271231, 0.876158, 0.3803922, 0, 1, 1,
0.6115056, 0.9406634, -0.9602013, 0.3843137, 0, 1, 1,
0.6138258, -0.9900131, 4.091774, 0.3921569, 0, 1, 1,
0.6232335, 0.7255232, -0.3011155, 0.3960784, 0, 1, 1,
0.6233179, -0.5434289, 2.92953, 0.4039216, 0, 1, 1,
0.6245017, -1.41948, 1.983831, 0.4117647, 0, 1, 1,
0.6282806, 1.361603, -0.1981517, 0.4156863, 0, 1, 1,
0.6307913, 0.393457, -0.1101008, 0.4235294, 0, 1, 1,
0.6318262, -2.656398, 4.142144, 0.427451, 0, 1, 1,
0.6340182, 1.457008, 0.4699045, 0.4352941, 0, 1, 1,
0.6375722, -0.7690554, 2.383236, 0.4392157, 0, 1, 1,
0.643737, -1.080215, 3.685601, 0.4470588, 0, 1, 1,
0.6486107, -0.6523818, 1.74887, 0.4509804, 0, 1, 1,
0.6499596, -0.09912678, -1.032084, 0.4588235, 0, 1, 1,
0.6560738, -1.084098, 2.600853, 0.4627451, 0, 1, 1,
0.6580728, -1.24204, 2.195578, 0.4705882, 0, 1, 1,
0.6627775, 0.2630414, -0.1966871, 0.4745098, 0, 1, 1,
0.6706788, 0.5493157, 1.719175, 0.4823529, 0, 1, 1,
0.6712816, 0.03352999, 2.014018, 0.4862745, 0, 1, 1,
0.6804477, 0.2191249, 1.508186, 0.4941176, 0, 1, 1,
0.6833561, 2.058371, 0.4200075, 0.5019608, 0, 1, 1,
0.6853287, -0.5324023, 1.545675, 0.5058824, 0, 1, 1,
0.6969035, 0.410038, 2.589351, 0.5137255, 0, 1, 1,
0.6990995, -0.3289967, 2.258554, 0.5176471, 0, 1, 1,
0.7100196, -0.6298247, 2.45664, 0.5254902, 0, 1, 1,
0.7142106, 0.9749532, 0.7017417, 0.5294118, 0, 1, 1,
0.7157823, 0.9632289, -0.5200461, 0.5372549, 0, 1, 1,
0.7168834, -0.4525972, 1.382309, 0.5411765, 0, 1, 1,
0.723476, 0.7791004, 1.623263, 0.5490196, 0, 1, 1,
0.7259285, -0.2443246, 2.488586, 0.5529412, 0, 1, 1,
0.7308953, 0.8411485, -0.8312925, 0.5607843, 0, 1, 1,
0.7329245, 0.860894, 1.796793, 0.5647059, 0, 1, 1,
0.7338928, -0.09495137, 0.7801698, 0.572549, 0, 1, 1,
0.7349954, 0.3237671, 1.079292, 0.5764706, 0, 1, 1,
0.7374187, 0.6472474, 2.179652, 0.5843138, 0, 1, 1,
0.7378837, 1.387244, 0.01773614, 0.5882353, 0, 1, 1,
0.7385201, -1.32266, 3.204995, 0.5960785, 0, 1, 1,
0.7433503, 0.8583222, 1.387532, 0.6039216, 0, 1, 1,
0.7454428, -0.891217, 2.406408, 0.6078432, 0, 1, 1,
0.7659701, 0.4191941, 1.142315, 0.6156863, 0, 1, 1,
0.7661846, 0.6392521, 1.482322, 0.6196079, 0, 1, 1,
0.7743832, 0.08280815, 1.846358, 0.627451, 0, 1, 1,
0.775916, -0.6684489, 1.500752, 0.6313726, 0, 1, 1,
0.776125, 0.5614955, 1.978518, 0.6392157, 0, 1, 1,
0.7773566, 0.2124708, 0.5216167, 0.6431373, 0, 1, 1,
0.7812245, -1.402673, 2.418757, 0.6509804, 0, 1, 1,
0.7824156, -2.473974, 4.333158, 0.654902, 0, 1, 1,
0.7826294, 1.309292, -0.2462581, 0.6627451, 0, 1, 1,
0.7876043, 0.673832, 1.011066, 0.6666667, 0, 1, 1,
0.7908251, 0.3902466, 0.3514644, 0.6745098, 0, 1, 1,
0.7924131, -0.2560122, 2.23019, 0.6784314, 0, 1, 1,
0.8033426, -0.263886, 0.9489942, 0.6862745, 0, 1, 1,
0.8090768, -0.01052228, 1.891428, 0.6901961, 0, 1, 1,
0.8155079, -0.2815491, 0.1317751, 0.6980392, 0, 1, 1,
0.8175945, -0.5206953, 3.864863, 0.7058824, 0, 1, 1,
0.8304014, 0.8807639, 1.50798, 0.7098039, 0, 1, 1,
0.834632, -0.4698226, 1.561578, 0.7176471, 0, 1, 1,
0.8386285, -0.9359732, 2.577601, 0.7215686, 0, 1, 1,
0.8409693, -2.158983, 3.561957, 0.7294118, 0, 1, 1,
0.8429898, 0.6368895, 1.286131, 0.7333333, 0, 1, 1,
0.8449402, 0.09429322, 2.121011, 0.7411765, 0, 1, 1,
0.8449792, -1.225476, 5.4057, 0.7450981, 0, 1, 1,
0.8458416, -0.02387893, 2.466321, 0.7529412, 0, 1, 1,
0.8516815, 0.5200571, -1.096242, 0.7568628, 0, 1, 1,
0.8545693, 1.730203, -0.2329147, 0.7647059, 0, 1, 1,
0.8553231, 0.7334811, 0.416161, 0.7686275, 0, 1, 1,
0.855818, 0.6355852, 3.142488, 0.7764706, 0, 1, 1,
0.86379, -2.309359, 2.781367, 0.7803922, 0, 1, 1,
0.8660151, -1.03399, 3.055119, 0.7882353, 0, 1, 1,
0.8688902, -0.398279, 2.292277, 0.7921569, 0, 1, 1,
0.869486, 0.07887693, 1.271448, 0.8, 0, 1, 1,
0.8724671, 0.786944, 3.464213, 0.8078431, 0, 1, 1,
0.8744287, 0.06102831, 1.741101, 0.8117647, 0, 1, 1,
0.8827759, -0.7580187, 2.416318, 0.8196079, 0, 1, 1,
0.8852341, 1.418813, -1.405735, 0.8235294, 0, 1, 1,
0.8881955, -1.629063, 2.93954, 0.8313726, 0, 1, 1,
0.8934175, 0.6727236, 1.649363, 0.8352941, 0, 1, 1,
0.8971252, 1.158266, 2.057152, 0.8431373, 0, 1, 1,
0.9016079, 0.5123759, -0.4094204, 0.8470588, 0, 1, 1,
0.9067094, 1.870558, 0.001331612, 0.854902, 0, 1, 1,
0.9274213, -0.7322239, 2.585984, 0.8588235, 0, 1, 1,
0.9278704, -0.6704363, 3.761976, 0.8666667, 0, 1, 1,
0.9289675, -1.536342, 0.7907407, 0.8705882, 0, 1, 1,
0.9350953, -0.7663358, -0.4310421, 0.8784314, 0, 1, 1,
0.9390281, -0.1191145, 1.30137, 0.8823529, 0, 1, 1,
0.9406282, 0.117643, 3.155689, 0.8901961, 0, 1, 1,
0.9438936, 0.9632916, 1.980285, 0.8941177, 0, 1, 1,
0.9444243, 0.3576278, 0.1855497, 0.9019608, 0, 1, 1,
0.9455904, -0.9759279, 2.658839, 0.9098039, 0, 1, 1,
0.9470171, -0.2098851, 3.010613, 0.9137255, 0, 1, 1,
0.9521008, 0.3997395, 0.4521754, 0.9215686, 0, 1, 1,
0.9535398, -0.1354538, 1.557546, 0.9254902, 0, 1, 1,
0.956578, -0.8518771, 2.378536, 0.9333333, 0, 1, 1,
0.959219, -0.8882887, 1.96398, 0.9372549, 0, 1, 1,
0.9617196, 0.4616215, 0.9493575, 0.945098, 0, 1, 1,
0.9747736, 0.9199917, -0.6400684, 0.9490196, 0, 1, 1,
0.9762051, 0.9235811, 1.606165, 0.9568627, 0, 1, 1,
0.977433, 0.6864938, 0.3585268, 0.9607843, 0, 1, 1,
0.9833205, 0.3673784, 1.92214, 0.9686275, 0, 1, 1,
0.9878267, -2.184389, 0.9291697, 0.972549, 0, 1, 1,
0.9895341, -1.568269, 2.817159, 0.9803922, 0, 1, 1,
0.9923783, 0.1944239, 1.546106, 0.9843137, 0, 1, 1,
0.9936737, -0.7530118, 1.863978, 0.9921569, 0, 1, 1,
0.994127, 0.09119848, 0.3522129, 0.9960784, 0, 1, 1,
1.004757, 0.4451019, 0.8379873, 1, 0, 0.9960784, 1,
1.005461, 0.980058, 1.724362, 1, 0, 0.9882353, 1,
1.005856, -0.06949997, 1.434506, 1, 0, 0.9843137, 1,
1.00734, -0.8538906, 2.7895, 1, 0, 0.9764706, 1,
1.01925, -1.964914, 3.213277, 1, 0, 0.972549, 1,
1.019491, 0.7716148, 2.050535, 1, 0, 0.9647059, 1,
1.0195, 2.239293, -0.5635874, 1, 0, 0.9607843, 1,
1.024176, -0.8741494, 1.98411, 1, 0, 0.9529412, 1,
1.028486, -0.4387431, 0.9462724, 1, 0, 0.9490196, 1,
1.028773, 0.4583815, 1.831985, 1, 0, 0.9411765, 1,
1.028875, 0.6344897, 1.10304, 1, 0, 0.9372549, 1,
1.029635, -0.3018767, 3.010445, 1, 0, 0.9294118, 1,
1.030889, 0.5139884, 0.6316847, 1, 0, 0.9254902, 1,
1.033554, -0.3017202, 1.648266, 1, 0, 0.9176471, 1,
1.033738, -0.5915458, 2.675591, 1, 0, 0.9137255, 1,
1.033885, -0.2303774, 3.620289, 1, 0, 0.9058824, 1,
1.038183, -0.4025869, 3.33153, 1, 0, 0.9019608, 1,
1.04416, 0.7239035, -0.2374428, 1, 0, 0.8941177, 1,
1.048934, -0.9519411, 3.50062, 1, 0, 0.8862745, 1,
1.050429, 1.040282, 0.5833802, 1, 0, 0.8823529, 1,
1.058622, -0.8435078, 1.685603, 1, 0, 0.8745098, 1,
1.066341, 0.4239356, 1.623821, 1, 0, 0.8705882, 1,
1.071328, -0.1664573, 2.514468, 1, 0, 0.8627451, 1,
1.072637, -0.1154429, 0.602133, 1, 0, 0.8588235, 1,
1.074448, 0.2764611, 0.06996023, 1, 0, 0.8509804, 1,
1.079958, -1.950692, 2.621495, 1, 0, 0.8470588, 1,
1.080359, 0.2955869, -0.07712696, 1, 0, 0.8392157, 1,
1.081743, -1.310471, 1.940007, 1, 0, 0.8352941, 1,
1.092932, -1.334376, 4.528986, 1, 0, 0.827451, 1,
1.092985, -0.4911183, 1.085073, 1, 0, 0.8235294, 1,
1.100974, -0.276567, 2.378507, 1, 0, 0.8156863, 1,
1.101649, -0.1862964, 1.362356, 1, 0, 0.8117647, 1,
1.102682, 1.248221, 2.297699, 1, 0, 0.8039216, 1,
1.107086, -0.5544577, 1.568408, 1, 0, 0.7960784, 1,
1.107977, -1.367545, 0.9828197, 1, 0, 0.7921569, 1,
1.13063, 0.8589016, 1.909336, 1, 0, 0.7843137, 1,
1.137308, -0.5113404, 2.496061, 1, 0, 0.7803922, 1,
1.139519, -0.7690895, 1.468219, 1, 0, 0.772549, 1,
1.14367, 0.6249635, -0.1809898, 1, 0, 0.7686275, 1,
1.145487, 1.745785, -0.8875149, 1, 0, 0.7607843, 1,
1.151204, -1.299111, 2.581214, 1, 0, 0.7568628, 1,
1.1535, 1.234081, -0.9056253, 1, 0, 0.7490196, 1,
1.157252, 0.3413758, 1.830927, 1, 0, 0.7450981, 1,
1.169204, 0.4439449, 2.936613, 1, 0, 0.7372549, 1,
1.169319, 0.2171492, 1.198068, 1, 0, 0.7333333, 1,
1.174705, -0.01836793, 1.075846, 1, 0, 0.7254902, 1,
1.184077, -0.04675649, 2.46604, 1, 0, 0.7215686, 1,
1.185477, 1.52285, 2.438873, 1, 0, 0.7137255, 1,
1.190828, 0.4846854, 1.960096, 1, 0, 0.7098039, 1,
1.190898, 1.361666, -1.04993, 1, 0, 0.7019608, 1,
1.195909, -0.8113732, 2.46741, 1, 0, 0.6941177, 1,
1.199541, -0.3287632, 2.780534, 1, 0, 0.6901961, 1,
1.201717, -0.8094738, 2.801682, 1, 0, 0.682353, 1,
1.210851, -0.1755394, 1.251814, 1, 0, 0.6784314, 1,
1.213783, -0.07956581, 1.127227, 1, 0, 0.6705883, 1,
1.219167, -2.294735, 2.30806, 1, 0, 0.6666667, 1,
1.23622, 0.8417088, 0.3529708, 1, 0, 0.6588235, 1,
1.240821, 0.3235524, -0.4917807, 1, 0, 0.654902, 1,
1.242287, -0.683845, 3.523926, 1, 0, 0.6470588, 1,
1.273463, -0.3518161, 2.737847, 1, 0, 0.6431373, 1,
1.278865, -0.2572429, 3.043816, 1, 0, 0.6352941, 1,
1.283853, -0.5727942, 1.120339, 1, 0, 0.6313726, 1,
1.285551, 1.443433, 2.652261, 1, 0, 0.6235294, 1,
1.290052, -0.2944565, 1.578787, 1, 0, 0.6196079, 1,
1.294497, -0.4676091, 3.994672, 1, 0, 0.6117647, 1,
1.297829, 0.3118656, 2.775197, 1, 0, 0.6078432, 1,
1.299557, 0.9534204, 0.5152573, 1, 0, 0.6, 1,
1.314968, 2.549883, 0.4135792, 1, 0, 0.5921569, 1,
1.316985, 0.5416626, 2.159179, 1, 0, 0.5882353, 1,
1.325194, -0.309456, 0.949985, 1, 0, 0.5803922, 1,
1.333087, 0.5120993, 1.186373, 1, 0, 0.5764706, 1,
1.339265, -0.7862222, 2.935801, 1, 0, 0.5686275, 1,
1.347696, 0.8712246, 1.511685, 1, 0, 0.5647059, 1,
1.347946, 0.9262518, 1.061025, 1, 0, 0.5568628, 1,
1.347999, 1.937178, 2.223969, 1, 0, 0.5529412, 1,
1.3561, 0.8560148, 2.465766, 1, 0, 0.5450981, 1,
1.35963, -1.020418, 3.950989, 1, 0, 0.5411765, 1,
1.360669, -0.9765007, 2.015687, 1, 0, 0.5333334, 1,
1.362206, -0.7804228, 0.8918933, 1, 0, 0.5294118, 1,
1.368548, 0.06347947, 2.267488, 1, 0, 0.5215687, 1,
1.372287, -0.8394386, 2.083986, 1, 0, 0.5176471, 1,
1.388263, 0.9300413, -0.8860455, 1, 0, 0.509804, 1,
1.405568, 1.182449, 1.625952, 1, 0, 0.5058824, 1,
1.406029, -0.3358868, 2.031011, 1, 0, 0.4980392, 1,
1.409106, -0.2888438, 3.0142, 1, 0, 0.4901961, 1,
1.41165, 0.8198482, -0.07426747, 1, 0, 0.4862745, 1,
1.411899, -0.0673638, 0.8931667, 1, 0, 0.4784314, 1,
1.420072, -0.9416862, 1.338063, 1, 0, 0.4745098, 1,
1.426638, 0.1967355, 0.9056281, 1, 0, 0.4666667, 1,
1.42746, 0.09611221, -0.1219942, 1, 0, 0.4627451, 1,
1.436778, -1.478243, 1.566146, 1, 0, 0.454902, 1,
1.481479, 0.018988, 2.936728, 1, 0, 0.4509804, 1,
1.49133, -0.3328301, 0.6826072, 1, 0, 0.4431373, 1,
1.5106, 1.640226, 0.4663677, 1, 0, 0.4392157, 1,
1.523111, 0.9944399, 0.7951193, 1, 0, 0.4313726, 1,
1.538227, -0.9313487, 1.916925, 1, 0, 0.427451, 1,
1.542844, -1.024647, 2.159444, 1, 0, 0.4196078, 1,
1.551922, -0.6468405, 1.27746, 1, 0, 0.4156863, 1,
1.552351, 0.687076, 1.690538, 1, 0, 0.4078431, 1,
1.554744, -1.175763, 1.870898, 1, 0, 0.4039216, 1,
1.558453, 0.7153031, 1.831492, 1, 0, 0.3960784, 1,
1.562385, 0.1358012, 0.8099378, 1, 0, 0.3882353, 1,
1.566831, 0.4401349, 0.9281436, 1, 0, 0.3843137, 1,
1.567401, -0.7012087, 1.840123, 1, 0, 0.3764706, 1,
1.572913, -0.004935462, 0.978042, 1, 0, 0.372549, 1,
1.587126, 0.2658551, 0.5209304, 1, 0, 0.3647059, 1,
1.587942, 0.4914311, 1.073912, 1, 0, 0.3607843, 1,
1.598998, -0.3821521, -0.01515022, 1, 0, 0.3529412, 1,
1.613215, 0.8372679, 0.6545871, 1, 0, 0.3490196, 1,
1.615013, 1.030727, 0.4984097, 1, 0, 0.3411765, 1,
1.626674, 0.778769, 1.677666, 1, 0, 0.3372549, 1,
1.64134, 0.869627, 2.383164, 1, 0, 0.3294118, 1,
1.645644, -0.4583618, 1.885893, 1, 0, 0.3254902, 1,
1.646641, -0.6025804, 2.396069, 1, 0, 0.3176471, 1,
1.655938, -1.191581, 0.9807525, 1, 0, 0.3137255, 1,
1.664339, 0.3443468, 2.126216, 1, 0, 0.3058824, 1,
1.688168, 1.362737, 1.315619, 1, 0, 0.2980392, 1,
1.691111, 0.6131679, 2.417145, 1, 0, 0.2941177, 1,
1.729778, 1.577613, 3.648117, 1, 0, 0.2862745, 1,
1.743201, 1.310507, 0.4200329, 1, 0, 0.282353, 1,
1.748981, -0.09816208, 0.207519, 1, 0, 0.2745098, 1,
1.76601, 0.7521799, 2.197372, 1, 0, 0.2705882, 1,
1.799937, 0.633261, 1.395681, 1, 0, 0.2627451, 1,
1.805553, 0.2164929, 0.3207711, 1, 0, 0.2588235, 1,
1.805711, -0.09256256, 2.047682, 1, 0, 0.2509804, 1,
1.810868, 0.650932, 0.7897316, 1, 0, 0.2470588, 1,
1.81464, -0.7466666, 0.7932131, 1, 0, 0.2392157, 1,
1.818935, -0.2692486, 2.399275, 1, 0, 0.2352941, 1,
1.839913, 0.1793223, 2.235752, 1, 0, 0.227451, 1,
1.845559, 0.529303, 1.057743, 1, 0, 0.2235294, 1,
1.850621, -0.6132571, 2.974753, 1, 0, 0.2156863, 1,
1.881279, -1.216995, 3.158548, 1, 0, 0.2117647, 1,
1.892108, 0.149302, 1.575068, 1, 0, 0.2039216, 1,
1.905813, 1.338297, 0.4387807, 1, 0, 0.1960784, 1,
1.922957, 1.028779, 1.227333, 1, 0, 0.1921569, 1,
1.940049, -0.7825355, 2.298339, 1, 0, 0.1843137, 1,
1.988957, -0.6029913, 2.265902, 1, 0, 0.1803922, 1,
2.020625, 0.5619482, 0.3713926, 1, 0, 0.172549, 1,
2.052052, -0.2942479, 1.965337, 1, 0, 0.1686275, 1,
2.065945, -1.137179, 2.377378, 1, 0, 0.1607843, 1,
2.073892, 0.03993142, 1.992146, 1, 0, 0.1568628, 1,
2.083978, 0.7255734, 1.303138, 1, 0, 0.1490196, 1,
2.113499, 0.3265169, 0.8442119, 1, 0, 0.145098, 1,
2.153586, -0.3163819, 2.052528, 1, 0, 0.1372549, 1,
2.154813, 0.4320911, 0.2251055, 1, 0, 0.1333333, 1,
2.161361, -0.4650804, 0.7709894, 1, 0, 0.1254902, 1,
2.183874, 0.9320771, 1.404471, 1, 0, 0.1215686, 1,
2.200668, 0.2491503, 0.5208132, 1, 0, 0.1137255, 1,
2.209608, 1.177155, 0.05291091, 1, 0, 0.1098039, 1,
2.246214, 0.0195867, 2.388182, 1, 0, 0.1019608, 1,
2.249645, -0.2312123, 0.6819156, 1, 0, 0.09411765, 1,
2.253292, -0.06735893, 1.365379, 1, 0, 0.09019608, 1,
2.281531, 0.2993718, 2.951289, 1, 0, 0.08235294, 1,
2.296409, 0.2359734, 2.100469, 1, 0, 0.07843138, 1,
2.30652, 0.735441, 0.9703274, 1, 0, 0.07058824, 1,
2.320248, 0.5833583, 1.33138, 1, 0, 0.06666667, 1,
2.351424, -0.2413128, 0.7854616, 1, 0, 0.05882353, 1,
2.40797, -1.696078, 3.339016, 1, 0, 0.05490196, 1,
2.450864, -0.2956093, 2.575647, 1, 0, 0.04705882, 1,
2.454495, 1.28283, 0.8585793, 1, 0, 0.04313726, 1,
2.455039, 1.886189, 1.317952, 1, 0, 0.03529412, 1,
2.473446, -0.3734329, 2.721764, 1, 0, 0.03137255, 1,
2.584309, 1.287917, 0.499539, 1, 0, 0.02352941, 1,
2.597723, 0.1282109, 2.863266, 1, 0, 0.01960784, 1,
2.845961, -1.046214, 1.833412, 1, 0, 0.01176471, 1,
3.067907, 0.04681613, 3.760088, 1, 0, 0.007843138, 1
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
-0.2805598, -3.690097, -7.487287, 0, -0.5, 0.5, 0.5,
-0.2805598, -3.690097, -7.487287, 1, -0.5, 0.5, 0.5,
-0.2805598, -3.690097, -7.487287, 1, 1.5, 0.5, 0.5,
-0.2805598, -3.690097, -7.487287, 0, 1.5, 0.5, 0.5
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
-4.764157, 0.0009218454, -7.487287, 0, -0.5, 0.5, 0.5,
-4.764157, 0.0009218454, -7.487287, 1, -0.5, 0.5, 0.5,
-4.764157, 0.0009218454, -7.487287, 1, 1.5, 0.5, 0.5,
-4.764157, 0.0009218454, -7.487287, 0, 1.5, 0.5, 0.5
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
-4.764157, -3.690097, -0.1064789, 0, -0.5, 0.5, 0.5,
-4.764157, -3.690097, -0.1064789, 1, -0.5, 0.5, 0.5,
-4.764157, -3.690097, -0.1064789, 1, 1.5, 0.5, 0.5,
-4.764157, -3.690097, -0.1064789, 0, 1.5, 0.5, 0.5
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
-3, -2.838323, -5.784023,
3, -2.838323, -5.784023,
-3, -2.838323, -5.784023,
-3, -2.980286, -6.067901,
-2, -2.838323, -5.784023,
-2, -2.980286, -6.067901,
-1, -2.838323, -5.784023,
-1, -2.980286, -6.067901,
0, -2.838323, -5.784023,
0, -2.980286, -6.067901,
1, -2.838323, -5.784023,
1, -2.980286, -6.067901,
2, -2.838323, -5.784023,
2, -2.980286, -6.067901,
3, -2.838323, -5.784023,
3, -2.980286, -6.067901
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
-3, -3.26421, -6.635655, 0, -0.5, 0.5, 0.5,
-3, -3.26421, -6.635655, 1, -0.5, 0.5, 0.5,
-3, -3.26421, -6.635655, 1, 1.5, 0.5, 0.5,
-3, -3.26421, -6.635655, 0, 1.5, 0.5, 0.5,
-2, -3.26421, -6.635655, 0, -0.5, 0.5, 0.5,
-2, -3.26421, -6.635655, 1, -0.5, 0.5, 0.5,
-2, -3.26421, -6.635655, 1, 1.5, 0.5, 0.5,
-2, -3.26421, -6.635655, 0, 1.5, 0.5, 0.5,
-1, -3.26421, -6.635655, 0, -0.5, 0.5, 0.5,
-1, -3.26421, -6.635655, 1, -0.5, 0.5, 0.5,
-1, -3.26421, -6.635655, 1, 1.5, 0.5, 0.5,
-1, -3.26421, -6.635655, 0, 1.5, 0.5, 0.5,
0, -3.26421, -6.635655, 0, -0.5, 0.5, 0.5,
0, -3.26421, -6.635655, 1, -0.5, 0.5, 0.5,
0, -3.26421, -6.635655, 1, 1.5, 0.5, 0.5,
0, -3.26421, -6.635655, 0, 1.5, 0.5, 0.5,
1, -3.26421, -6.635655, 0, -0.5, 0.5, 0.5,
1, -3.26421, -6.635655, 1, -0.5, 0.5, 0.5,
1, -3.26421, -6.635655, 1, 1.5, 0.5, 0.5,
1, -3.26421, -6.635655, 0, 1.5, 0.5, 0.5,
2, -3.26421, -6.635655, 0, -0.5, 0.5, 0.5,
2, -3.26421, -6.635655, 1, -0.5, 0.5, 0.5,
2, -3.26421, -6.635655, 1, 1.5, 0.5, 0.5,
2, -3.26421, -6.635655, 0, 1.5, 0.5, 0.5,
3, -3.26421, -6.635655, 0, -0.5, 0.5, 0.5,
3, -3.26421, -6.635655, 1, -0.5, 0.5, 0.5,
3, -3.26421, -6.635655, 1, 1.5, 0.5, 0.5,
3, -3.26421, -6.635655, 0, 1.5, 0.5, 0.5
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
-3.729481, -2, -5.784023,
-3.729481, 2, -5.784023,
-3.729481, -2, -5.784023,
-3.901927, -2, -6.067901,
-3.729481, -1, -5.784023,
-3.901927, -1, -6.067901,
-3.729481, 0, -5.784023,
-3.901927, 0, -6.067901,
-3.729481, 1, -5.784023,
-3.901927, 1, -6.067901,
-3.729481, 2, -5.784023,
-3.901927, 2, -6.067901
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
-4.246819, -2, -6.635655, 0, -0.5, 0.5, 0.5,
-4.246819, -2, -6.635655, 1, -0.5, 0.5, 0.5,
-4.246819, -2, -6.635655, 1, 1.5, 0.5, 0.5,
-4.246819, -2, -6.635655, 0, 1.5, 0.5, 0.5,
-4.246819, -1, -6.635655, 0, -0.5, 0.5, 0.5,
-4.246819, -1, -6.635655, 1, -0.5, 0.5, 0.5,
-4.246819, -1, -6.635655, 1, 1.5, 0.5, 0.5,
-4.246819, -1, -6.635655, 0, 1.5, 0.5, 0.5,
-4.246819, 0, -6.635655, 0, -0.5, 0.5, 0.5,
-4.246819, 0, -6.635655, 1, -0.5, 0.5, 0.5,
-4.246819, 0, -6.635655, 1, 1.5, 0.5, 0.5,
-4.246819, 0, -6.635655, 0, 1.5, 0.5, 0.5,
-4.246819, 1, -6.635655, 0, -0.5, 0.5, 0.5,
-4.246819, 1, -6.635655, 1, -0.5, 0.5, 0.5,
-4.246819, 1, -6.635655, 1, 1.5, 0.5, 0.5,
-4.246819, 1, -6.635655, 0, 1.5, 0.5, 0.5,
-4.246819, 2, -6.635655, 0, -0.5, 0.5, 0.5,
-4.246819, 2, -6.635655, 1, -0.5, 0.5, 0.5,
-4.246819, 2, -6.635655, 1, 1.5, 0.5, 0.5,
-4.246819, 2, -6.635655, 0, 1.5, 0.5, 0.5
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
-3.729481, -2.838323, -4,
-3.729481, -2.838323, 4,
-3.729481, -2.838323, -4,
-3.901927, -2.980286, -4,
-3.729481, -2.838323, -2,
-3.901927, -2.980286, -2,
-3.729481, -2.838323, 0,
-3.901927, -2.980286, 0,
-3.729481, -2.838323, 2,
-3.901927, -2.980286, 2,
-3.729481, -2.838323, 4,
-3.901927, -2.980286, 4
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
-4.246819, -3.26421, -4, 0, -0.5, 0.5, 0.5,
-4.246819, -3.26421, -4, 1, -0.5, 0.5, 0.5,
-4.246819, -3.26421, -4, 1, 1.5, 0.5, 0.5,
-4.246819, -3.26421, -4, 0, 1.5, 0.5, 0.5,
-4.246819, -3.26421, -2, 0, -0.5, 0.5, 0.5,
-4.246819, -3.26421, -2, 1, -0.5, 0.5, 0.5,
-4.246819, -3.26421, -2, 1, 1.5, 0.5, 0.5,
-4.246819, -3.26421, -2, 0, 1.5, 0.5, 0.5,
-4.246819, -3.26421, 0, 0, -0.5, 0.5, 0.5,
-4.246819, -3.26421, 0, 1, -0.5, 0.5, 0.5,
-4.246819, -3.26421, 0, 1, 1.5, 0.5, 0.5,
-4.246819, -3.26421, 0, 0, 1.5, 0.5, 0.5,
-4.246819, -3.26421, 2, 0, -0.5, 0.5, 0.5,
-4.246819, -3.26421, 2, 1, -0.5, 0.5, 0.5,
-4.246819, -3.26421, 2, 1, 1.5, 0.5, 0.5,
-4.246819, -3.26421, 2, 0, 1.5, 0.5, 0.5,
-4.246819, -3.26421, 4, 0, -0.5, 0.5, 0.5,
-4.246819, -3.26421, 4, 1, -0.5, 0.5, 0.5,
-4.246819, -3.26421, 4, 1, 1.5, 0.5, 0.5,
-4.246819, -3.26421, 4, 0, 1.5, 0.5, 0.5
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
-3.729481, -2.838323, -5.784023,
-3.729481, 2.840167, -5.784023,
-3.729481, -2.838323, 5.571065,
-3.729481, 2.840167, 5.571065,
-3.729481, -2.838323, -5.784023,
-3.729481, -2.838323, 5.571065,
-3.729481, 2.840167, -5.784023,
-3.729481, 2.840167, 5.571065,
-3.729481, -2.838323, -5.784023,
3.168361, -2.838323, -5.784023,
-3.729481, -2.838323, 5.571065,
3.168361, -2.838323, 5.571065,
-3.729481, 2.840167, -5.784023,
3.168361, 2.840167, -5.784023,
-3.729481, 2.840167, 5.571065,
3.168361, 2.840167, 5.571065,
3.168361, -2.838323, -5.784023,
3.168361, 2.840167, -5.784023,
3.168361, -2.838323, 5.571065,
3.168361, 2.840167, 5.571065,
3.168361, -2.838323, -5.784023,
3.168361, -2.838323, 5.571065,
3.168361, 2.840167, -5.784023,
3.168361, 2.840167, 5.571065
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
var radius = 7.715299;
var distance = 34.32624;
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
mvMatrix.translate( 0.2805598, -0.0009218454, 0.1064789 );
mvMatrix.scale( 1.209354, 1.469041, 0.7346427 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.32624);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
famphur<-read.table("famphur.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-famphur$V2
```

```
## Error in eval(expr, envir, enclos): object 'famphur' not found
```

```r
y<-famphur$V3
```

```
## Error in eval(expr, envir, enclos): object 'famphur' not found
```

```r
z<-famphur$V4
```

```
## Error in eval(expr, envir, enclos): object 'famphur' not found
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
-3.629027, -1.400087, -1.820813, 0, 0, 1, 1, 1,
-3.460721, 0.5708301, -0.09788316, 1, 0, 0, 1, 1,
-2.880666, -0.2561299, -2.129997, 1, 0, 0, 1, 1,
-2.717236, 2.290474, -1.682958, 1, 0, 0, 1, 1,
-2.688114, 0.5699032, -2.678781, 1, 0, 0, 1, 1,
-2.643705, -1.074522, -2.666917, 1, 0, 0, 1, 1,
-2.469621, 1.766013, -1.87795, 0, 0, 0, 1, 1,
-2.438888, -0.316948, -2.616736, 0, 0, 0, 1, 1,
-2.382159, 1.889053, -1.164024, 0, 0, 0, 1, 1,
-2.369417, 0.3334061, -2.363186, 0, 0, 0, 1, 1,
-2.338097, -0.698935, -2.593262, 0, 0, 0, 1, 1,
-2.329259, -0.008870993, -2.416731, 0, 0, 0, 1, 1,
-2.193784, 1.539488, 0.1256978, 0, 0, 0, 1, 1,
-2.184145, 1.072421, -0.60326, 1, 1, 1, 1, 1,
-2.181551, -0.5225037, -0.9635762, 1, 1, 1, 1, 1,
-2.171401, 1.317395, -1.945922, 1, 1, 1, 1, 1,
-2.163848, -0.878211, -2.374158, 1, 1, 1, 1, 1,
-2.134609, 1.106059, 0.4787833, 1, 1, 1, 1, 1,
-2.129636, -0.0666933, -1.945467, 1, 1, 1, 1, 1,
-2.107716, 1.059567, -2.031105, 1, 1, 1, 1, 1,
-2.104333, 0.5064633, -0.9839603, 1, 1, 1, 1, 1,
-2.103697, 0.4381605, -0.1796262, 1, 1, 1, 1, 1,
-2.089223, 1.341593, -1.007253, 1, 1, 1, 1, 1,
-2.087802, 2.628364, 0.09208824, 1, 1, 1, 1, 1,
-2.08639, -0.6238196, -3.253778, 1, 1, 1, 1, 1,
-2.076959, 0.6030814, -2.226144, 1, 1, 1, 1, 1,
-2.036563, 0.6873969, -0.9392708, 1, 1, 1, 1, 1,
-2.031295, 1.374154, -0.363544, 1, 1, 1, 1, 1,
-1.985641, -0.07825971, -0.8666625, 0, 0, 1, 1, 1,
-1.981315, -0.7571682, -1.942922, 1, 0, 0, 1, 1,
-1.962431, -0.3324842, -2.128954, 1, 0, 0, 1, 1,
-1.951077, 1.004323, -1.094522, 1, 0, 0, 1, 1,
-1.933857, 0.7914925, -1.606117, 1, 0, 0, 1, 1,
-1.924735, 1.338631, -1.183136, 1, 0, 0, 1, 1,
-1.906565, -0.2636265, -1.12551, 0, 0, 0, 1, 1,
-1.89907, -0.2130294, -1.173643, 0, 0, 0, 1, 1,
-1.843632, -2.047484, -2.674243, 0, 0, 0, 1, 1,
-1.835237, 0.1778965, -0.1509394, 0, 0, 0, 1, 1,
-1.825625, 0.3673158, -1.568007, 0, 0, 0, 1, 1,
-1.82013, 0.5986475, -1.241749, 0, 0, 0, 1, 1,
-1.819955, -0.5217397, -1.744116, 0, 0, 0, 1, 1,
-1.804806, 1.369688, 0.2149644, 1, 1, 1, 1, 1,
-1.800487, -0.09068094, -2.171352, 1, 1, 1, 1, 1,
-1.786007, 0.6536171, -1.608822, 1, 1, 1, 1, 1,
-1.778677, 2.757471, -1.418102, 1, 1, 1, 1, 1,
-1.761914, 0.08672386, -1.437328, 1, 1, 1, 1, 1,
-1.755508, -0.4155914, -2.060695, 1, 1, 1, 1, 1,
-1.749629, -2.290114, -1.352555, 1, 1, 1, 1, 1,
-1.747714, -1.58782, -1.283096, 1, 1, 1, 1, 1,
-1.734385, 0.7978882, -1.786249, 1, 1, 1, 1, 1,
-1.721574, -0.1703032, -0.3008868, 1, 1, 1, 1, 1,
-1.705752, 0.8371112, -1.008093, 1, 1, 1, 1, 1,
-1.7052, -0.06885596, -2.884221, 1, 1, 1, 1, 1,
-1.704476, 0.7941525, -0.04888472, 1, 1, 1, 1, 1,
-1.703076, -0.861487, -0.683877, 1, 1, 1, 1, 1,
-1.699128, 0.7218773, -1.778659, 1, 1, 1, 1, 1,
-1.659091, -0.6120455, -2.656235, 0, 0, 1, 1, 1,
-1.650518, -0.2863998, -1.534417, 1, 0, 0, 1, 1,
-1.641235, -0.7066942, -1.47167, 1, 0, 0, 1, 1,
-1.628364, -0.1823282, 0.02821975, 1, 0, 0, 1, 1,
-1.628319, 0.3440883, 0.6063895, 1, 0, 0, 1, 1,
-1.615106, 0.5332315, -2.148217, 1, 0, 0, 1, 1,
-1.611004, 0.01249319, -1.395873, 0, 0, 0, 1, 1,
-1.601836, -0.8853317, -3.958574, 0, 0, 0, 1, 1,
-1.597751, 0.1074773, -0.02730401, 0, 0, 0, 1, 1,
-1.588009, 0.2628692, -0.8979132, 0, 0, 0, 1, 1,
-1.580935, 1.330146, -1.174386, 0, 0, 0, 1, 1,
-1.55035, -1.699222, -3.706465, 0, 0, 0, 1, 1,
-1.54688, -0.3868876, -2.82059, 0, 0, 0, 1, 1,
-1.540341, 0.8596097, -0.7036197, 1, 1, 1, 1, 1,
-1.535044, -1.390727, -1.213894, 1, 1, 1, 1, 1,
-1.524198, -1.206381, -3.283079, 1, 1, 1, 1, 1,
-1.509128, 0.7027962, -2.753496, 1, 1, 1, 1, 1,
-1.508838, -2.237468, -2.978333, 1, 1, 1, 1, 1,
-1.507616, 1.259233, 0.7266164, 1, 1, 1, 1, 1,
-1.504126, 0.9836618, -0.8260762, 1, 1, 1, 1, 1,
-1.504067, -1.45387, -1.818176, 1, 1, 1, 1, 1,
-1.497674, 0.02123649, -1.325365, 1, 1, 1, 1, 1,
-1.478652, -0.0642071, -3.087783, 1, 1, 1, 1, 1,
-1.464789, -1.705062, -3.058357, 1, 1, 1, 1, 1,
-1.461353, -0.3984343, -3.567426, 1, 1, 1, 1, 1,
-1.45627, -1.80702, -2.251881, 1, 1, 1, 1, 1,
-1.443128, 1.835938, -0.6861158, 1, 1, 1, 1, 1,
-1.42263, 0.5057902, -0.8030401, 1, 1, 1, 1, 1,
-1.411923, 1.23977, -1.205097, 0, 0, 1, 1, 1,
-1.411905, 0.3391357, -1.364574, 1, 0, 0, 1, 1,
-1.397275, 0.7105036, 0.2157546, 1, 0, 0, 1, 1,
-1.396651, -0.2734297, -0.2872974, 1, 0, 0, 1, 1,
-1.395363, 0.2172998, -2.005845, 1, 0, 0, 1, 1,
-1.395265, 2.384254, -1.363342, 1, 0, 0, 1, 1,
-1.36444, -0.5398787, -3.189322, 0, 0, 0, 1, 1,
-1.356912, -1.099759, -2.163279, 0, 0, 0, 1, 1,
-1.354405, 0.5220512, -1.841701, 0, 0, 0, 1, 1,
-1.35165, 0.1506611, -1.086759, 0, 0, 0, 1, 1,
-1.345573, -0.4759315, -0.9250845, 0, 0, 0, 1, 1,
-1.34516, -0.4752004, -2.470096, 0, 0, 0, 1, 1,
-1.343965, -0.143273, -2.157626, 0, 0, 0, 1, 1,
-1.339324, -1.058619, -1.918164, 1, 1, 1, 1, 1,
-1.336106, 0.01430447, -2.405868, 1, 1, 1, 1, 1,
-1.332147, -0.5329524, -0.9885064, 1, 1, 1, 1, 1,
-1.322281, -0.3827395, -2.427017, 1, 1, 1, 1, 1,
-1.312881, 1.295061, -1.062322, 1, 1, 1, 1, 1,
-1.299022, 0.4841872, -1.144026, 1, 1, 1, 1, 1,
-1.295604, 1.179204, -2.266645, 1, 1, 1, 1, 1,
-1.281248, 1.219103, -0.183907, 1, 1, 1, 1, 1,
-1.276277, 0.8759968, -1.573168, 1, 1, 1, 1, 1,
-1.266306, 1.740932, -0.26657, 1, 1, 1, 1, 1,
-1.264495, -0.800532, -1.105609, 1, 1, 1, 1, 1,
-1.255301, -0.966055, -3.836094, 1, 1, 1, 1, 1,
-1.252804, 0.255961, -2.347605, 1, 1, 1, 1, 1,
-1.252048, 0.6155715, -1.454578, 1, 1, 1, 1, 1,
-1.250328, 0.1224679, -0.1297162, 1, 1, 1, 1, 1,
-1.24808, 0.7789982, 0.6660702, 0, 0, 1, 1, 1,
-1.227752, -0.659371, -2.921523, 1, 0, 0, 1, 1,
-1.222027, -1.042991, -2.021782, 1, 0, 0, 1, 1,
-1.219622, 1.159919, -1.351653, 1, 0, 0, 1, 1,
-1.219212, 0.858146, -3.22755, 1, 0, 0, 1, 1,
-1.218338, 0.2143733, -1.562839, 1, 0, 0, 1, 1,
-1.204146, -1.469766, -2.027492, 0, 0, 0, 1, 1,
-1.20158, -1.639112, -1.600027, 0, 0, 0, 1, 1,
-1.175077, -2.066978, -4.474979, 0, 0, 0, 1, 1,
-1.173862, 0.05351279, -2.038959, 0, 0, 0, 1, 1,
-1.1694, -1.475292, -1.445378, 0, 0, 0, 1, 1,
-1.169138, 1.061263, -0.4474725, 0, 0, 0, 1, 1,
-1.164038, -0.4677033, -1.928913, 0, 0, 0, 1, 1,
-1.162366, 0.6295108, -1.723971, 1, 1, 1, 1, 1,
-1.159113, -0.9325339, -1.803899, 1, 1, 1, 1, 1,
-1.1504, 0.04240182, -3.015178, 1, 1, 1, 1, 1,
-1.13825, -0.2288256, -1.734699, 1, 1, 1, 1, 1,
-1.130196, -0.3776518, 0.6533636, 1, 1, 1, 1, 1,
-1.11724, -0.407177, -2.380907, 1, 1, 1, 1, 1,
-1.114963, 0.3275437, 0.2156984, 1, 1, 1, 1, 1,
-1.109473, -1.151349, -1.405809, 1, 1, 1, 1, 1,
-1.106044, 1.109502, -2.132095, 1, 1, 1, 1, 1,
-1.104386, -0.9135921, -0.9215603, 1, 1, 1, 1, 1,
-1.099377, 0.8320633, 0.6812277, 1, 1, 1, 1, 1,
-1.098921, -0.2899179, -1.940652, 1, 1, 1, 1, 1,
-1.084207, -1.346023, -0.02594698, 1, 1, 1, 1, 1,
-1.076433, 0.1028566, -0.7235262, 1, 1, 1, 1, 1,
-1.068798, -0.8271987, -3.100794, 1, 1, 1, 1, 1,
-1.06584, -0.3312331, -0.6881918, 0, 0, 1, 1, 1,
-1.061245, 0.3328153, 0.04113566, 1, 0, 0, 1, 1,
-1.046601, -0.03821114, -1.92707, 1, 0, 0, 1, 1,
-1.046029, -0.2061747, -1.451395, 1, 0, 0, 1, 1,
-1.045187, -1.998277, -3.376293, 1, 0, 0, 1, 1,
-1.044503, 0.7275483, -0.2809013, 1, 0, 0, 1, 1,
-1.042321, -0.8064041, -1.428898, 0, 0, 0, 1, 1,
-1.040293, 0.508562, -2.188145, 0, 0, 0, 1, 1,
-1.038748, -0.3222964, -3.014765, 0, 0, 0, 1, 1,
-1.037938, -1.618035, -3.205591, 0, 0, 0, 1, 1,
-1.037848, 0.0809764, -2.747116, 0, 0, 0, 1, 1,
-1.034937, -1.731334, -0.6207159, 0, 0, 0, 1, 1,
-1.034625, -0.9549295, -1.641627, 0, 0, 0, 1, 1,
-1.033983, 0.7639291, -0.6740468, 1, 1, 1, 1, 1,
-1.032212, 0.4678504, -1.188544, 1, 1, 1, 1, 1,
-1.015382, 0.8412791, -0.5555275, 1, 1, 1, 1, 1,
-1.013664, -0.9184282, -3.975754, 1, 1, 1, 1, 1,
-1.010683, 0.5532646, 0.3872856, 1, 1, 1, 1, 1,
-1.009241, 2.060437, -1.096119, 1, 1, 1, 1, 1,
-1.00821, -2.053959, -2.344252, 1, 1, 1, 1, 1,
-1.001199, -0.5958204, -0.5841531, 1, 1, 1, 1, 1,
-1.000437, -0.3824619, -2.132463, 1, 1, 1, 1, 1,
-0.9919308, 0.6936883, -0.1243682, 1, 1, 1, 1, 1,
-0.9865741, -0.797619, -3.104156, 1, 1, 1, 1, 1,
-0.9855137, -1.186713, -2.266999, 1, 1, 1, 1, 1,
-0.9833249, 0.0239076, -3.211168, 1, 1, 1, 1, 1,
-0.9806624, -1.777235, -0.3616162, 1, 1, 1, 1, 1,
-0.9765989, 0.6136677, -2.178549, 1, 1, 1, 1, 1,
-0.9747097, -0.06812222, 0.007371729, 0, 0, 1, 1, 1,
-0.9742478, 0.3082939, -0.4048063, 1, 0, 0, 1, 1,
-0.9654764, -0.7127531, -2.693397, 1, 0, 0, 1, 1,
-0.9565414, -0.6980584, -0.9740887, 1, 0, 0, 1, 1,
-0.955975, -0.2681412, -3.830595, 1, 0, 0, 1, 1,
-0.9557741, 0.8331205, -0.7871543, 1, 0, 0, 1, 1,
-0.9541427, -0.8397796, -3.231716, 0, 0, 0, 1, 1,
-0.950155, -0.5847928, -1.676091, 0, 0, 0, 1, 1,
-0.9434776, 0.1841168, -1.515997, 0, 0, 0, 1, 1,
-0.9393219, 1.372971, -1.367095, 0, 0, 0, 1, 1,
-0.9368358, -1.582103, -2.657228, 0, 0, 0, 1, 1,
-0.9338017, 0.4000049, -1.838889, 0, 0, 0, 1, 1,
-0.9329259, 1.335207, 1.766899, 0, 0, 0, 1, 1,
-0.9327376, -1.561032, -2.427881, 1, 1, 1, 1, 1,
-0.9321851, -0.5224777, -2.467374, 1, 1, 1, 1, 1,
-0.9295789, 2.069419, -0.9990978, 1, 1, 1, 1, 1,
-0.925103, -0.9828326, -0.2887788, 1, 1, 1, 1, 1,
-0.9236949, 1.884876, -0.01370457, 1, 1, 1, 1, 1,
-0.9229677, 0.2048457, -1.118351, 1, 1, 1, 1, 1,
-0.9215732, 1.764043, 0.6293397, 1, 1, 1, 1, 1,
-0.9180707, 1.115754, -0.2179089, 1, 1, 1, 1, 1,
-0.9170796, 0.2286533, -1.052968, 1, 1, 1, 1, 1,
-0.916676, -0.2953165, -3.348953, 1, 1, 1, 1, 1,
-0.9140067, 0.4690208, 0.3191161, 1, 1, 1, 1, 1,
-0.9120734, -0.8008294, -0.8678342, 1, 1, 1, 1, 1,
-0.9089894, 1.913727, -0.2169453, 1, 1, 1, 1, 1,
-0.9067518, -2.12184, -3.247536, 1, 1, 1, 1, 1,
-0.9059083, 0.6234285, -2.793216, 1, 1, 1, 1, 1,
-0.90251, -0.246666, -0.8813955, 0, 0, 1, 1, 1,
-0.8983158, 0.06063508, 0.7391757, 1, 0, 0, 1, 1,
-0.8923939, -0.5551375, -2.961467, 1, 0, 0, 1, 1,
-0.8893768, 1.349595, -0.7666843, 1, 0, 0, 1, 1,
-0.8889602, -0.4144978, -1.214757, 1, 0, 0, 1, 1,
-0.8839909, -1.722506, -4.317001, 1, 0, 0, 1, 1,
-0.882282, -0.3359917, -1.765903, 0, 0, 0, 1, 1,
-0.8808531, 0.2750743, -1.788818, 0, 0, 0, 1, 1,
-0.8800231, -0.4691763, -4.640785, 0, 0, 0, 1, 1,
-0.8786694, -1.447092, -1.558055, 0, 0, 0, 1, 1,
-0.8722876, 0.052594, -0.01860631, 0, 0, 0, 1, 1,
-0.8666349, -0.7240077, -2.170482, 0, 0, 0, 1, 1,
-0.8663217, -0.1439392, -0.8821222, 0, 0, 0, 1, 1,
-0.8662844, -0.7444705, -3.665561, 1, 1, 1, 1, 1,
-0.8622745, -1.97256, -2.851429, 1, 1, 1, 1, 1,
-0.8611356, 1.865965, -3.56604, 1, 1, 1, 1, 1,
-0.8603657, 0.4652334, -1.887576, 1, 1, 1, 1, 1,
-0.8575352, 0.5133581, 1.062509, 1, 1, 1, 1, 1,
-0.8571647, -0.3757536, -1.408375, 1, 1, 1, 1, 1,
-0.8571427, 0.5622208, -0.3130219, 1, 1, 1, 1, 1,
-0.8561723, -0.9517345, -3.261954, 1, 1, 1, 1, 1,
-0.8421209, 0.3292083, -0.7815435, 1, 1, 1, 1, 1,
-0.8395778, 0.3294095, -1.9733, 1, 1, 1, 1, 1,
-0.8356572, 0.4456674, -2.10309, 1, 1, 1, 1, 1,
-0.8320538, 0.8190273, -1.010103, 1, 1, 1, 1, 1,
-0.8308845, -0.05318803, -2.481024, 1, 1, 1, 1, 1,
-0.8285282, -0.4525666, -1.519011, 1, 1, 1, 1, 1,
-0.8274961, -0.8890179, -3.572845, 1, 1, 1, 1, 1,
-0.8209517, 0.7218327, -0.1537637, 0, 0, 1, 1, 1,
-0.8193825, 0.9577664, -0.3759596, 1, 0, 0, 1, 1,
-0.8134646, 1.396901, -0.3012905, 1, 0, 0, 1, 1,
-0.8117325, 0.1753745, -1.035798, 1, 0, 0, 1, 1,
-0.8080605, 0.8883837, -2.042667, 1, 0, 0, 1, 1,
-0.8079498, -0.7731155, -2.337133, 1, 0, 0, 1, 1,
-0.798315, 0.1460942, -1.292971, 0, 0, 0, 1, 1,
-0.7959062, -0.1074288, -1.293595, 0, 0, 0, 1, 1,
-0.7898667, -0.3037605, -2.475782, 0, 0, 0, 1, 1,
-0.7883646, 2.479308, -0.7339911, 0, 0, 0, 1, 1,
-0.7881948, 0.2615023, -1.065202, 0, 0, 0, 1, 1,
-0.785847, -0.967891, -4.389572, 0, 0, 0, 1, 1,
-0.7832962, 1.562789, -0.6994366, 0, 0, 0, 1, 1,
-0.7831287, -0.8818485, -3.91487, 1, 1, 1, 1, 1,
-0.7827648, 0.2067972, -0.5029192, 1, 1, 1, 1, 1,
-0.7806261, 0.2909763, -2.709021, 1, 1, 1, 1, 1,
-0.7735151, -0.2269169, -1.575165, 1, 1, 1, 1, 1,
-0.7705476, -1.496678, -1.571334, 1, 1, 1, 1, 1,
-0.7696579, -1.234163, -3.953285, 1, 1, 1, 1, 1,
-0.7686187, -0.648181, -2.733733, 1, 1, 1, 1, 1,
-0.7668776, -1.437841, -2.943758, 1, 1, 1, 1, 1,
-0.762039, -0.337382, -1.635732, 1, 1, 1, 1, 1,
-0.7607339, -1.526065, -2.436048, 1, 1, 1, 1, 1,
-0.7580123, -2.026391, -2.084591, 1, 1, 1, 1, 1,
-0.7571003, 1.048298, -1.651789, 1, 1, 1, 1, 1,
-0.755654, 0.5159597, -1.307089, 1, 1, 1, 1, 1,
-0.7554954, -0.6969491, -1.828124, 1, 1, 1, 1, 1,
-0.7503767, 0.1397192, -1.583728, 1, 1, 1, 1, 1,
-0.7491915, -0.6962289, -3.471652, 0, 0, 1, 1, 1,
-0.7487738, 0.3266751, -0.7898242, 1, 0, 0, 1, 1,
-0.7434475, 0.1941826, -3.02678, 1, 0, 0, 1, 1,
-0.7429381, -0.5171569, -2.143955, 1, 0, 0, 1, 1,
-0.7426659, 1.040959, -1.310323, 1, 0, 0, 1, 1,
-0.7407382, -1.626632, -4.104771, 1, 0, 0, 1, 1,
-0.7399373, -0.21547, -4.395918, 0, 0, 0, 1, 1,
-0.7353018, 1.51716, -1.830945, 0, 0, 0, 1, 1,
-0.7320897, 0.1935938, -0.4775213, 0, 0, 0, 1, 1,
-0.7259551, -0.5854949, -2.305774, 0, 0, 0, 1, 1,
-0.7247395, 1.49606, 1.004141, 0, 0, 0, 1, 1,
-0.7233273, 0.6212786, -2.351926, 0, 0, 0, 1, 1,
-0.7135553, 0.6622809, -2.791013, 0, 0, 0, 1, 1,
-0.7039391, -0.5264273, -1.500528, 1, 1, 1, 1, 1,
-0.6997032, -0.07415701, -1.646428, 1, 1, 1, 1, 1,
-0.6972904, -0.9104431, -0.5320604, 1, 1, 1, 1, 1,
-0.6927841, -0.2243368, -0.3899391, 1, 1, 1, 1, 1,
-0.689522, -1.189521, -1.61975, 1, 1, 1, 1, 1,
-0.6835257, 0.7345676, -2.411936, 1, 1, 1, 1, 1,
-0.6833971, -0.4187984, -1.75966, 1, 1, 1, 1, 1,
-0.6807594, 1.458708, -2.43031, 1, 1, 1, 1, 1,
-0.6764184, -0.6563637, -2.765636, 1, 1, 1, 1, 1,
-0.6709198, 0.1028547, -1.590871, 1, 1, 1, 1, 1,
-0.6686448, 1.202749, -0.475422, 1, 1, 1, 1, 1,
-0.6669178, -0.3922892, -1.899845, 1, 1, 1, 1, 1,
-0.6667186, -1.603259, -2.892332, 1, 1, 1, 1, 1,
-0.6647232, -0.4489806, -1.294707, 1, 1, 1, 1, 1,
-0.6623429, 1.270883, -0.7349189, 1, 1, 1, 1, 1,
-0.6601912, -1.00412, -1.86433, 0, 0, 1, 1, 1,
-0.6592225, -1.124145, -2.969322, 1, 0, 0, 1, 1,
-0.6545734, 0.6150861, -0.8780938, 1, 0, 0, 1, 1,
-0.650159, -1.101898, -1.791928, 1, 0, 0, 1, 1,
-0.6488188, 1.26364, -0.742833, 1, 0, 0, 1, 1,
-0.6459157, -0.3109101, -4.216766, 1, 0, 0, 1, 1,
-0.6423973, -0.4691427, -2.173823, 0, 0, 0, 1, 1,
-0.641572, 0.3693694, 0.07137241, 0, 0, 0, 1, 1,
-0.6411357, -0.669078, -2.079801, 0, 0, 0, 1, 1,
-0.639762, 1.12488, -0.9172216, 0, 0, 0, 1, 1,
-0.6385981, -0.3617435, -3.591815, 0, 0, 0, 1, 1,
-0.6297644, -0.3588862, -2.025318, 0, 0, 0, 1, 1,
-0.6285107, -2.498635, -3.103264, 0, 0, 0, 1, 1,
-0.6284524, -0.7432297, -2.468067, 1, 1, 1, 1, 1,
-0.626578, 0.9577802, -1.779561, 1, 1, 1, 1, 1,
-0.6254479, 0.3451084, -1.820337, 1, 1, 1, 1, 1,
-0.6236293, -1.547345, -2.223882, 1, 1, 1, 1, 1,
-0.6223361, -0.09093831, -1.93669, 1, 1, 1, 1, 1,
-0.6217264, 1.41064, -0.7732235, 1, 1, 1, 1, 1,
-0.6178142, 1.423219, -0.6513649, 1, 1, 1, 1, 1,
-0.614925, 0.2247691, -0.8217832, 1, 1, 1, 1, 1,
-0.6148038, -0.915178, -4.296356, 1, 1, 1, 1, 1,
-0.6118716, -0.1609819, -0.4510263, 1, 1, 1, 1, 1,
-0.6097445, 0.8037911, 0.8646188, 1, 1, 1, 1, 1,
-0.6095797, 1.585176, -0.4875566, 1, 1, 1, 1, 1,
-0.6062794, -0.3998142, -1.510522, 1, 1, 1, 1, 1,
-0.6037055, 0.3179186, -1.618378, 1, 1, 1, 1, 1,
-0.6036842, 0.8738239, -2.589157, 1, 1, 1, 1, 1,
-0.6014886, -0.5040461, -0.8539307, 0, 0, 1, 1, 1,
-0.598497, 0.4683543, -0.3018227, 1, 0, 0, 1, 1,
-0.5982191, -0.7591122, -2.625036, 1, 0, 0, 1, 1,
-0.5973448, 0.8712126, -0.975466, 1, 0, 0, 1, 1,
-0.5951915, -1.370346, -4.166483, 1, 0, 0, 1, 1,
-0.5919754, 0.6212348, 1.208847, 1, 0, 0, 1, 1,
-0.5891783, 0.1855921, -1.703346, 0, 0, 0, 1, 1,
-0.5800537, -1.173428, -3.191433, 0, 0, 0, 1, 1,
-0.5773112, 0.3400228, -0.7264156, 0, 0, 0, 1, 1,
-0.5710958, -0.1665846, -2.224983, 0, 0, 0, 1, 1,
-0.5704167, 0.7170327, -0.1194772, 0, 0, 0, 1, 1,
-0.5668358, -1.760022, -3.809984, 0, 0, 0, 1, 1,
-0.5654298, 1.759102, -0.6902907, 0, 0, 0, 1, 1,
-0.5556426, -0.6040018, -1.64588, 1, 1, 1, 1, 1,
-0.5535406, -0.1925703, -0.6937616, 1, 1, 1, 1, 1,
-0.5520405, -0.9519894, -1.541927, 1, 1, 1, 1, 1,
-0.5510242, 0.6570261, 1.30738, 1, 1, 1, 1, 1,
-0.5498875, 0.03423616, -2.916279, 1, 1, 1, 1, 1,
-0.5425441, 0.5448714, -2.072096, 1, 1, 1, 1, 1,
-0.5424881, 0.6524134, -2.07724, 1, 1, 1, 1, 1,
-0.5400153, 1.019003, -0.05095108, 1, 1, 1, 1, 1,
-0.5388523, 0.1620021, -2.267401, 1, 1, 1, 1, 1,
-0.537594, -0.08670629, -1.505808, 1, 1, 1, 1, 1,
-0.5226898, -0.2089631, -0.4495542, 1, 1, 1, 1, 1,
-0.5209191, -1.086566, -1.655308, 1, 1, 1, 1, 1,
-0.5180284, 1.066373, 0.8807566, 1, 1, 1, 1, 1,
-0.5130362, -0.9131282, -1.383588, 1, 1, 1, 1, 1,
-0.5058727, -0.8665775, -2.270903, 1, 1, 1, 1, 1,
-0.50581, -0.4186505, -1.664422, 0, 0, 1, 1, 1,
-0.501829, -0.6454935, -1.016503, 1, 0, 0, 1, 1,
-0.4958653, -0.2621845, -1.912452, 1, 0, 0, 1, 1,
-0.4957814, 1.41245, -1.474685, 1, 0, 0, 1, 1,
-0.49331, -0.6025648, -5.618658, 1, 0, 0, 1, 1,
-0.490958, -0.8285245, -3.457866, 1, 0, 0, 1, 1,
-0.4818405, -1.282156, -2.144945, 0, 0, 0, 1, 1,
-0.4774607, 0.6552399, -1.346595, 0, 0, 0, 1, 1,
-0.4763376, -0.2131037, -1.848536, 0, 0, 0, 1, 1,
-0.4718992, 0.2362753, -2.106798, 0, 0, 0, 1, 1,
-0.4700696, 1.056843, 0.2624594, 0, 0, 0, 1, 1,
-0.4694754, -1.069586, -0.2336607, 0, 0, 0, 1, 1,
-0.4548152, 0.007507603, -2.484601, 0, 0, 0, 1, 1,
-0.4529001, 1.500714, 0.04791239, 1, 1, 1, 1, 1,
-0.4527447, 1.119904, -2.207364, 1, 1, 1, 1, 1,
-0.4511614, -0.1698913, -2.23318, 1, 1, 1, 1, 1,
-0.4488742, -0.9337659, -1.671696, 1, 1, 1, 1, 1,
-0.4478686, -0.0607644, -2.335811, 1, 1, 1, 1, 1,
-0.4440976, -0.4458086, -1.832027, 1, 1, 1, 1, 1,
-0.4360273, 2.334698, -0.1024682, 1, 1, 1, 1, 1,
-0.4351472, -0.4803644, -1.669629, 1, 1, 1, 1, 1,
-0.4276112, 1.0288, 0.3737849, 1, 1, 1, 1, 1,
-0.4266116, -1.471257, -3.357719, 1, 1, 1, 1, 1,
-0.4250916, 0.5141463, -0.0794491, 1, 1, 1, 1, 1,
-0.4246782, 1.722495, -1.467305, 1, 1, 1, 1, 1,
-0.4194984, -0.3741836, -2.107851, 1, 1, 1, 1, 1,
-0.4155196, 1.540394, -0.5309938, 1, 1, 1, 1, 1,
-0.4135838, 0.9717715, -1.095542, 1, 1, 1, 1, 1,
-0.4130391, -0.8476907, -3.746437, 0, 0, 1, 1, 1,
-0.4130292, -0.5552157, -2.846564, 1, 0, 0, 1, 1,
-0.4126484, 0.543272, 2.054595, 1, 0, 0, 1, 1,
-0.4093261, -2.542609, -3.190556, 1, 0, 0, 1, 1,
-0.4075271, 0.7654944, -1.27246, 1, 0, 0, 1, 1,
-0.4073659, 0.6465303, 0.0162633, 1, 0, 0, 1, 1,
-0.401623, 1.460054, -0.9345941, 0, 0, 0, 1, 1,
-0.4011566, -0.07168661, -1.198391, 0, 0, 0, 1, 1,
-0.3968914, 0.7409393, -1.140576, 0, 0, 0, 1, 1,
-0.3891165, -1.847388, -2.808992, 0, 0, 0, 1, 1,
-0.3881069, -0.2522724, -1.593139, 0, 0, 0, 1, 1,
-0.3874128, 1.619537, -1.890242, 0, 0, 0, 1, 1,
-0.3867852, -0.1549509, -2.418251, 0, 0, 0, 1, 1,
-0.3788056, -1.361298, -3.719182, 1, 1, 1, 1, 1,
-0.3783982, -0.5708886, -1.709813, 1, 1, 1, 1, 1,
-0.3781264, 1.786688, 0.3734657, 1, 1, 1, 1, 1,
-0.3763918, 1.387985, 0.1368567, 1, 1, 1, 1, 1,
-0.3741205, -0.5189837, -1.10014, 1, 1, 1, 1, 1,
-0.3679154, 2.294697, 0.05733906, 1, 1, 1, 1, 1,
-0.3669505, 0.5971776, 0.956434, 1, 1, 1, 1, 1,
-0.364215, 0.2041772, -1.387103, 1, 1, 1, 1, 1,
-0.3640524, -0.6906444, -2.29278, 1, 1, 1, 1, 1,
-0.3612337, -0.6968863, -2.136102, 1, 1, 1, 1, 1,
-0.357771, -1.260192, -3.678103, 1, 1, 1, 1, 1,
-0.3577467, -0.2005722, -3.599523, 1, 1, 1, 1, 1,
-0.3577112, 0.01930691, -1.632361, 1, 1, 1, 1, 1,
-0.3575177, -0.9026308, -1.539892, 1, 1, 1, 1, 1,
-0.3561473, 0.913601, 0.1945061, 1, 1, 1, 1, 1,
-0.3555072, 1.205608, 0.1051131, 0, 0, 1, 1, 1,
-0.353145, 1.217713, 0.06695414, 1, 0, 0, 1, 1,
-0.3468634, -1.478597, -0.7670132, 1, 0, 0, 1, 1,
-0.3455368, -0.6412949, -4.044435, 1, 0, 0, 1, 1,
-0.3437161, -0.264192, -2.032979, 1, 0, 0, 1, 1,
-0.3421157, 1.110878, -0.7714057, 1, 0, 0, 1, 1,
-0.3416473, 0.5249333, -0.001368177, 0, 0, 0, 1, 1,
-0.341494, 0.8611066, -0.693391, 0, 0, 0, 1, 1,
-0.3389387, -0.2388656, -0.8234265, 0, 0, 0, 1, 1,
-0.335207, 1.17427, 0.03598939, 0, 0, 0, 1, 1,
-0.3345793, 1.048896, -2.20925, 0, 0, 0, 1, 1,
-0.3288088, 0.3409079, -1.111993, 0, 0, 0, 1, 1,
-0.3208499, -0.9817256, -1.449294, 0, 0, 0, 1, 1,
-0.3187623, -0.5016844, -1.709559, 1, 1, 1, 1, 1,
-0.3186323, -0.4051107, -1.774586, 1, 1, 1, 1, 1,
-0.3149903, -0.5941232, -2.756386, 1, 1, 1, 1, 1,
-0.3147206, 0.8646494, 0.06245032, 1, 1, 1, 1, 1,
-0.3135782, -0.6776711, -1.435558, 1, 1, 1, 1, 1,
-0.3110599, -0.3621633, -2.183162, 1, 1, 1, 1, 1,
-0.3107288, -0.01678832, -2.068638, 1, 1, 1, 1, 1,
-0.3071783, 0.8453413, -0.9618672, 1, 1, 1, 1, 1,
-0.3066841, 0.3522433, -1.155772, 1, 1, 1, 1, 1,
-0.3064871, -0.1849849, -1.524693, 1, 1, 1, 1, 1,
-0.3038589, -0.3849295, -2.159823, 1, 1, 1, 1, 1,
-0.3036259, 1.66577, 0.2095874, 1, 1, 1, 1, 1,
-0.3027914, -0.5828037, -1.949885, 1, 1, 1, 1, 1,
-0.301723, 0.2574718, 0.4126915, 1, 1, 1, 1, 1,
-0.3015329, 1.873805, -0.6324714, 1, 1, 1, 1, 1,
-0.3011115, 0.1311174, -1.886654, 0, 0, 1, 1, 1,
-0.3001963, 0.3231784, 0.3767253, 1, 0, 0, 1, 1,
-0.2912008, 0.3057603, -1.747241, 1, 0, 0, 1, 1,
-0.2826105, -0.3103179, -3.039729, 1, 0, 0, 1, 1,
-0.2766749, -0.1512106, -2.712558, 1, 0, 0, 1, 1,
-0.2711848, 0.7038462, -1.417929, 1, 0, 0, 1, 1,
-0.2710464, -0.2139401, -2.981014, 0, 0, 0, 1, 1,
-0.2687237, 2.310411, 1.687636, 0, 0, 0, 1, 1,
-0.265414, -1.132934, -3.928355, 0, 0, 0, 1, 1,
-0.2643107, -0.7799675, -3.104631, 0, 0, 0, 1, 1,
-0.2639438, 1.802348, 1.444331, 0, 0, 0, 1, 1,
-0.2556753, 0.07545599, -1.217946, 0, 0, 0, 1, 1,
-0.2540187, -0.2152328, -3.270041, 0, 0, 0, 1, 1,
-0.251416, -1.387821, -4.202915, 1, 1, 1, 1, 1,
-0.2512954, -0.189562, -2.573662, 1, 1, 1, 1, 1,
-0.2494574, 0.3588249, -2.239537, 1, 1, 1, 1, 1,
-0.2446227, 0.7060865, -1.519491, 1, 1, 1, 1, 1,
-0.2440321, -0.1017698, -2.839694, 1, 1, 1, 1, 1,
-0.2390331, 0.4659933, -1.25577, 1, 1, 1, 1, 1,
-0.2366075, -0.8981648, -1.12822, 1, 1, 1, 1, 1,
-0.2362118, 0.5808833, -2.134883, 1, 1, 1, 1, 1,
-0.2353185, -0.2238826, -2.915515, 1, 1, 1, 1, 1,
-0.2325533, -1.112688, -3.029852, 1, 1, 1, 1, 1,
-0.2316344, -1.373956, -1.860723, 1, 1, 1, 1, 1,
-0.2263336, -0.2857684, -1.441002, 1, 1, 1, 1, 1,
-0.2249419, 1.103312, 1.055505, 1, 1, 1, 1, 1,
-0.2198999, -0.06359567, -0.8765082, 1, 1, 1, 1, 1,
-0.2126432, -0.2848159, -5.183331, 1, 1, 1, 1, 1,
-0.2119762, 0.1167807, -1.690925, 0, 0, 1, 1, 1,
-0.2103157, -1.086313, -3.114801, 1, 0, 0, 1, 1,
-0.2101685, 0.7966201, 0.6728349, 1, 0, 0, 1, 1,
-0.2097868, -0.3545759, -2.56682, 1, 0, 0, 1, 1,
-0.2091356, 1.267691, -0.02627384, 1, 0, 0, 1, 1,
-0.2072515, -0.01118145, -1.691418, 1, 0, 0, 1, 1,
-0.2070611, 0.3587703, 0.3968438, 0, 0, 0, 1, 1,
-0.1982755, 0.2833347, -1.534289, 0, 0, 0, 1, 1,
-0.1961108, 0.08361945, -1.895693, 0, 0, 0, 1, 1,
-0.1886173, -0.4142682, -2.058157, 0, 0, 0, 1, 1,
-0.1811858, 0.6432562, -2.465947, 0, 0, 0, 1, 1,
-0.1811128, -0.290387, -2.605545, 0, 0, 0, 1, 1,
-0.179373, -0.516139, -3.853207, 0, 0, 0, 1, 1,
-0.1728196, 1.059753, -1.035298, 1, 1, 1, 1, 1,
-0.1718805, 1.768137, 1.843128, 1, 1, 1, 1, 1,
-0.1718386, -0.5195932, -2.70269, 1, 1, 1, 1, 1,
-0.1694445, -0.195763, -1.584421, 1, 1, 1, 1, 1,
-0.1694416, 1.265314, 0.9841548, 1, 1, 1, 1, 1,
-0.1687334, -1.494532, -4.129794, 1, 1, 1, 1, 1,
-0.1652546, -0.5560917, -2.174264, 1, 1, 1, 1, 1,
-0.1623017, 1.133646, -2.311549, 1, 1, 1, 1, 1,
-0.1607028, 0.442949, 0.6576532, 1, 1, 1, 1, 1,
-0.1601587, 1.132338, 0.7484365, 1, 1, 1, 1, 1,
-0.1591486, -2.127457, -2.268466, 1, 1, 1, 1, 1,
-0.1581104, -1.419222, -2.627213, 1, 1, 1, 1, 1,
-0.1552245, 0.1651563, 0.6866883, 1, 1, 1, 1, 1,
-0.15349, -1.988672, -3.811343, 1, 1, 1, 1, 1,
-0.1521845, 1.345007, 0.2222436, 1, 1, 1, 1, 1,
-0.1492079, 1.234176, -1.454368, 0, 0, 1, 1, 1,
-0.1393092, 1.329552, 0.6987395, 1, 0, 0, 1, 1,
-0.1389715, -0.1138229, -2.277205, 1, 0, 0, 1, 1,
-0.1388221, -0.1443063, -1.324433, 1, 0, 0, 1, 1,
-0.1364371, -0.925688, -3.836632, 1, 0, 0, 1, 1,
-0.1364125, 0.7630676, -0.5130765, 1, 0, 0, 1, 1,
-0.1347578, 0.109063, -2.135174, 0, 0, 0, 1, 1,
-0.1312993, -1.134322, -2.782881, 0, 0, 0, 1, 1,
-0.1296143, 0.9173595, -1.093475, 0, 0, 0, 1, 1,
-0.1272345, -1.1533, -1.980992, 0, 0, 0, 1, 1,
-0.1183646, 1.607455, 0.379944, 0, 0, 0, 1, 1,
-0.1147072, 1.08171, -0.1527663, 0, 0, 0, 1, 1,
-0.1127117, 0.8906752, -0.5164338, 0, 0, 0, 1, 1,
-0.1124748, -1.546147, -3.340545, 1, 1, 1, 1, 1,
-0.1107043, 0.7405067, -1.178983, 1, 1, 1, 1, 1,
-0.1089862, 1.388184, 0.4611676, 1, 1, 1, 1, 1,
-0.1040575, -0.3239786, -3.053362, 1, 1, 1, 1, 1,
-0.1016712, -0.1551922, -2.949772, 1, 1, 1, 1, 1,
-0.09915756, -0.8052909, -2.430262, 1, 1, 1, 1, 1,
-0.09668079, 0.9765401, -2.664861, 1, 1, 1, 1, 1,
-0.09564421, -0.2228048, -3.200538, 1, 1, 1, 1, 1,
-0.09557738, -1.029943, -3.087475, 1, 1, 1, 1, 1,
-0.09009281, 1.708264, -0.4092477, 1, 1, 1, 1, 1,
-0.08569474, -0.2347946, -3.972796, 1, 1, 1, 1, 1,
-0.08359471, 0.5246893, -0.05817679, 1, 1, 1, 1, 1,
-0.08224867, 0.9578529, 1.361007, 1, 1, 1, 1, 1,
-0.08223015, -0.6720569, -3.503738, 1, 1, 1, 1, 1,
-0.08116794, 1.507819, -1.593925, 1, 1, 1, 1, 1,
-0.0804754, -0.04708601, -1.479893, 0, 0, 1, 1, 1,
-0.07593247, 0.05514731, -1.113378, 1, 0, 0, 1, 1,
-0.07403087, 1.572965, -1.129911, 1, 0, 0, 1, 1,
-0.07357629, -0.07726985, -2.499533, 1, 0, 0, 1, 1,
-0.07131662, -1.799828, -3.263314, 1, 0, 0, 1, 1,
-0.07110868, 0.7103335, -0.3448834, 1, 0, 0, 1, 1,
-0.06380221, -0.4025392, -4.251157, 0, 0, 0, 1, 1,
-0.06378461, -0.521648, -3.588902, 0, 0, 0, 1, 1,
-0.0556643, 0.1215576, -1.707606, 0, 0, 0, 1, 1,
-0.05447421, -1.09971, -3.340973, 0, 0, 0, 1, 1,
-0.05422503, -0.8843903, -1.877032, 0, 0, 0, 1, 1,
-0.0522014, -1.805738, -2.10901, 0, 0, 0, 1, 1,
-0.05139094, -0.542546, -1.659102, 0, 0, 0, 1, 1,
-0.0491934, 0.01744807, -1.387996, 1, 1, 1, 1, 1,
-0.04821925, 1.09749, -0.9451491, 1, 1, 1, 1, 1,
-0.04578515, 1.782949, -0.2928713, 1, 1, 1, 1, 1,
-0.04518173, -1.098874, -2.27624, 1, 1, 1, 1, 1,
-0.04464762, 0.68613, 0.8818141, 1, 1, 1, 1, 1,
-0.04201884, 0.3330868, -0.3053039, 1, 1, 1, 1, 1,
-0.04035756, -1.058367, -2.240802, 1, 1, 1, 1, 1,
-0.03856015, 0.2793853, 0.5670984, 1, 1, 1, 1, 1,
-0.03603795, -0.4154184, -3.190191, 1, 1, 1, 1, 1,
-0.03543993, -0.8230503, -2.99396, 1, 1, 1, 1, 1,
-0.03129824, -0.9884614, -0.5113087, 1, 1, 1, 1, 1,
-0.02217347, -1.199035, -1.988223, 1, 1, 1, 1, 1,
-0.02008758, 1.814716, 1.996927, 1, 1, 1, 1, 1,
-0.01636903, -0.3755061, -4.186225, 1, 1, 1, 1, 1,
-0.01237419, 0.5097632, -0.2042988, 1, 1, 1, 1, 1,
-0.01175353, -0.275169, -2.888403, 0, 0, 1, 1, 1,
-0.0093586, -1.224505, -3.924182, 1, 0, 0, 1, 1,
-0.009169475, 0.8017252, 0.1448198, 1, 0, 0, 1, 1,
-0.005206563, 0.8250853, 0.7149771, 1, 0, 0, 1, 1,
0.00174578, -1.364184, 4.389903, 1, 0, 0, 1, 1,
0.004902111, -1.362805, 4.92038, 1, 0, 0, 1, 1,
0.004950956, -1.06337, 2.912659, 0, 0, 0, 1, 1,
0.005624313, 0.3469837, -0.02654184, 0, 0, 0, 1, 1,
0.01323149, 0.1271762, 1.287308, 0, 0, 0, 1, 1,
0.01555863, 0.6651361, 1.903526, 0, 0, 0, 1, 1,
0.01870825, 0.3886171, -0.3809813, 0, 0, 0, 1, 1,
0.02071545, 0.7950533, -0.7858378, 0, 0, 0, 1, 1,
0.02091294, 0.7823225, 0.1931705, 0, 0, 0, 1, 1,
0.02104247, -0.1466013, 2.248552, 1, 1, 1, 1, 1,
0.02595249, -0.6531496, 4.237373, 1, 1, 1, 1, 1,
0.03281821, 1.055561, 1.452302, 1, 1, 1, 1, 1,
0.03423515, 0.09297895, 0.393765, 1, 1, 1, 1, 1,
0.03437931, 1.318214, -0.3437126, 1, 1, 1, 1, 1,
0.04432103, 0.3039804, 0.1841429, 1, 1, 1, 1, 1,
0.04681028, -0.09434979, 2.077358, 1, 1, 1, 1, 1,
0.05087332, 0.6037788, -0.7573653, 1, 1, 1, 1, 1,
0.05172445, 0.1856654, 0.3136, 1, 1, 1, 1, 1,
0.05623263, -0.6377901, 4.004456, 1, 1, 1, 1, 1,
0.05725318, -0.700238, 4.388953, 1, 1, 1, 1, 1,
0.0593089, 0.4795921, -0.7683628, 1, 1, 1, 1, 1,
0.06183029, -0.8859801, 2.217584, 1, 1, 1, 1, 1,
0.06199802, 2.59607, -1.618295, 1, 1, 1, 1, 1,
0.06245958, -0.2382403, 3.341964, 1, 1, 1, 1, 1,
0.0626671, 1.000634, -0.7834598, 0, 0, 1, 1, 1,
0.06423607, -0.3928258, 3.994063, 1, 0, 0, 1, 1,
0.06794699, -1.640364, 3.298965, 1, 0, 0, 1, 1,
0.07072288, -1.864761, 4.16173, 1, 0, 0, 1, 1,
0.07094383, 0.485172, -0.1936436, 1, 0, 0, 1, 1,
0.07165951, 1.961854, -0.09724662, 1, 0, 0, 1, 1,
0.0741917, -0.2949906, 2.506193, 0, 0, 0, 1, 1,
0.07663465, -0.2228694, 5.064014, 0, 0, 0, 1, 1,
0.07896047, 0.01527505, -0.1829155, 0, 0, 0, 1, 1,
0.08007651, 1.026877, -0.3705115, 0, 0, 0, 1, 1,
0.08170542, 0.8397416, -0.757865, 0, 0, 0, 1, 1,
0.0863949, -0.5324904, 4.1379, 0, 0, 0, 1, 1,
0.08704972, -0.9357193, 4.568516, 0, 0, 0, 1, 1,
0.09540316, 0.4271684, 0.3024393, 1, 1, 1, 1, 1,
0.1026222, -0.387651, 2.129066, 1, 1, 1, 1, 1,
0.1043605, -0.7376141, 5.065739, 1, 1, 1, 1, 1,
0.1063553, -1.391247, 2.055656, 1, 1, 1, 1, 1,
0.1087285, 1.961864, 0.07936037, 1, 1, 1, 1, 1,
0.1106006, 0.2151157, 0.4076439, 1, 1, 1, 1, 1,
0.1106389, -0.0813664, 1.163777, 1, 1, 1, 1, 1,
0.1111073, -0.06552836, 1.020564, 1, 1, 1, 1, 1,
0.1122607, -1.126982, 2.518458, 1, 1, 1, 1, 1,
0.1181888, 0.8750429, 0.2305864, 1, 1, 1, 1, 1,
0.1195169, -0.02138561, 1.594096, 1, 1, 1, 1, 1,
0.1224414, -1.518734, 2.835064, 1, 1, 1, 1, 1,
0.1258825, -0.3444281, 3.491287, 1, 1, 1, 1, 1,
0.1258927, -0.5158473, 3.193926, 1, 1, 1, 1, 1,
0.1329143, 0.3345946, 0.5418479, 1, 1, 1, 1, 1,
0.1384529, 0.6568341, -0.7564384, 0, 0, 1, 1, 1,
0.1385982, -1.38174, 4.759665, 1, 0, 0, 1, 1,
0.1411888, -0.4395244, 0.8158685, 1, 0, 0, 1, 1,
0.1418677, 0.5573747, 0.9683555, 1, 0, 0, 1, 1,
0.1455905, 0.7497772, 0.03570477, 1, 0, 0, 1, 1,
0.150893, 0.2084992, 1.851804, 1, 0, 0, 1, 1,
0.1645144, -0.1865892, 0.2739683, 0, 0, 0, 1, 1,
0.1689301, -0.5709081, 2.329893, 0, 0, 0, 1, 1,
0.1692652, -0.22307, 2.263703, 0, 0, 0, 1, 1,
0.1770578, -0.5924204, 1.785476, 0, 0, 0, 1, 1,
0.177241, 0.08219371, 0.1657684, 0, 0, 0, 1, 1,
0.1794697, 0.4347776, -0.2479896, 0, 0, 0, 1, 1,
0.1836712, 0.6130562, 0.3460046, 0, 0, 0, 1, 1,
0.1856892, -2.095745, 4.039401, 1, 1, 1, 1, 1,
0.186931, 0.4777909, -0.3716871, 1, 1, 1, 1, 1,
0.1874573, 0.2425557, 0.6232435, 1, 1, 1, 1, 1,
0.1918812, -0.6319528, 2.137901, 1, 1, 1, 1, 1,
0.1928845, 0.005476896, 1.482187, 1, 1, 1, 1, 1,
0.1943861, 0.2215893, 2.274858, 1, 1, 1, 1, 1,
0.1965303, 0.9687479, 1.067026, 1, 1, 1, 1, 1,
0.1995242, -0.1694072, 0.4613148, 1, 1, 1, 1, 1,
0.2023962, -0.1951854, 0.8721887, 1, 1, 1, 1, 1,
0.2085684, 0.2369641, 0.285712, 1, 1, 1, 1, 1,
0.2102858, 1.126162, -0.7525154, 1, 1, 1, 1, 1,
0.2134797, -0.1765526, 3.48922, 1, 1, 1, 1, 1,
0.2147951, 0.001425983, 1.837781, 1, 1, 1, 1, 1,
0.2165645, -0.4372307, 4.035514, 1, 1, 1, 1, 1,
0.2169946, -0.6170713, 2.499688, 1, 1, 1, 1, 1,
0.2280307, -0.06741126, 0.9223884, 0, 0, 1, 1, 1,
0.2328911, -1.392099, 3.014266, 1, 0, 0, 1, 1,
0.2368943, 0.7650878, -1.371153, 1, 0, 0, 1, 1,
0.2375336, -2.755627, 3.74817, 1, 0, 0, 1, 1,
0.2385425, -1.593092, 4.457024, 1, 0, 0, 1, 1,
0.2391415, 1.340487, -0.494291, 1, 0, 0, 1, 1,
0.24765, 2.388699, 0.3372235, 0, 0, 0, 1, 1,
0.2513872, 0.9710649, 0.156435, 0, 0, 0, 1, 1,
0.2547998, 0.7641118, -1.253982, 0, 0, 0, 1, 1,
0.2570821, -0.8280118, 4.423096, 0, 0, 0, 1, 1,
0.2641733, 1.052765, -1.017453, 0, 0, 0, 1, 1,
0.2669419, -0.7700573, 3.881768, 0, 0, 0, 1, 1,
0.2670927, 0.1964445, 0.7971123, 0, 0, 0, 1, 1,
0.2719836, 1.77804, 1.104799, 1, 1, 1, 1, 1,
0.2751822, -0.2091807, 3.138752, 1, 1, 1, 1, 1,
0.2772768, 1.761891, -1.274139, 1, 1, 1, 1, 1,
0.2841923, -2.679647, 2.684804, 1, 1, 1, 1, 1,
0.2853903, -1.149812, 3.874447, 1, 1, 1, 1, 1,
0.2869707, -1.064025, 3.670491, 1, 1, 1, 1, 1,
0.2888913, 1.212523, 1.315251, 1, 1, 1, 1, 1,
0.2937709, -0.4976623, 1.082977, 1, 1, 1, 1, 1,
0.2940174, 0.4969497, 1.081265, 1, 1, 1, 1, 1,
0.2945974, 1.090119, 0.6962698, 1, 1, 1, 1, 1,
0.2988687, -0.5759885, 2.042724, 1, 1, 1, 1, 1,
0.3033852, -2.198131, 3.67466, 1, 1, 1, 1, 1,
0.305348, 0.9013345, -0.9383703, 1, 1, 1, 1, 1,
0.3057386, 1.955483, 0.2950065, 1, 1, 1, 1, 1,
0.3060457, 0.6920748, 0.5739172, 1, 1, 1, 1, 1,
0.3176527, 0.06199855, 0.5644535, 0, 0, 1, 1, 1,
0.3193749, 0.6424969, 1.128952, 1, 0, 0, 1, 1,
0.3212729, 1.99045, 0.2770717, 1, 0, 0, 1, 1,
0.3244214, -0.1859397, 1.746332, 1, 0, 0, 1, 1,
0.3261246, 0.7421994, 0.9352568, 1, 0, 0, 1, 1,
0.341245, 0.7894114, 1.404542, 1, 0, 0, 1, 1,
0.343907, -0.9439399, 4.326331, 0, 0, 0, 1, 1,
0.3455591, 0.8442845, -0.361677, 0, 0, 0, 1, 1,
0.3488361, 0.6449092, 0.9042365, 0, 0, 0, 1, 1,
0.3497712, 0.6905136, -0.6381091, 0, 0, 0, 1, 1,
0.3505576, -2.187865, 3.786568, 0, 0, 0, 1, 1,
0.3611861, 0.917042, -1.837592, 0, 0, 0, 1, 1,
0.3612806, 1.000622, 0.6367384, 0, 0, 0, 1, 1,
0.3682842, -0.8078548, 2.373664, 1, 1, 1, 1, 1,
0.3706721, 0.3733093, 2.986389, 1, 1, 1, 1, 1,
0.3752103, 0.9518704, 1.457653, 1, 1, 1, 1, 1,
0.377037, -0.9265128, 4.449293, 1, 1, 1, 1, 1,
0.3805778, -0.9400302, 2.790706, 1, 1, 1, 1, 1,
0.3842901, 1.49644, 0.9228214, 1, 1, 1, 1, 1,
0.3846671, 0.1383898, 1.538153, 1, 1, 1, 1, 1,
0.3847983, 0.7457802, -0.5243762, 1, 1, 1, 1, 1,
0.3907556, 0.9650217, 1.627726, 1, 1, 1, 1, 1,
0.3976726, -0.02524594, 1.723045, 1, 1, 1, 1, 1,
0.4025722, -1.59289, 2.688189, 1, 1, 1, 1, 1,
0.4032703, -0.7457668, 2.545888, 1, 1, 1, 1, 1,
0.4057491, 1.811579, 2.06717, 1, 1, 1, 1, 1,
0.4070373, -0.5473349, 1.595289, 1, 1, 1, 1, 1,
0.4085377, 0.07315808, -0.4917562, 1, 1, 1, 1, 1,
0.4106119, -1.369162, 3.658086, 0, 0, 1, 1, 1,
0.4183533, -0.9727693, 2.404775, 1, 0, 0, 1, 1,
0.4189291, -0.4288701, 1.600806, 1, 0, 0, 1, 1,
0.4195237, 0.002506721, 1.88697, 1, 0, 0, 1, 1,
0.4207563, -0.8467504, 1.484311, 1, 0, 0, 1, 1,
0.420976, -0.4314609, 1.749995, 1, 0, 0, 1, 1,
0.4214722, 1.100294, 0.6377894, 0, 0, 0, 1, 1,
0.4239108, -0.4747534, 0.5912135, 0, 0, 0, 1, 1,
0.4246654, 0.8185171, -0.2098484, 0, 0, 0, 1, 1,
0.4303547, 2.373449, 0.9988699, 0, 0, 0, 1, 1,
0.4323322, -1.270758, 4.577631, 0, 0, 0, 1, 1,
0.4328289, -0.8007114, 3.603972, 0, 0, 0, 1, 1,
0.4420342, 0.849418, 2.248547, 0, 0, 0, 1, 1,
0.4422626, -0.418563, 1.292749, 1, 1, 1, 1, 1,
0.4425113, 0.1965171, 0.8682798, 1, 1, 1, 1, 1,
0.4501246, -0.4411359, 2.794746, 1, 1, 1, 1, 1,
0.450723, -1.232784, 5.259198, 1, 1, 1, 1, 1,
0.4515557, -0.4879586, 3.194483, 1, 1, 1, 1, 1,
0.4520169, -0.6998712, 2.48297, 1, 1, 1, 1, 1,
0.4522029, 0.6929513, 0.5514187, 1, 1, 1, 1, 1,
0.4547916, 0.1012622, 1.698772, 1, 1, 1, 1, 1,
0.4556719, -1.341043, 1.544687, 1, 1, 1, 1, 1,
0.4560589, -0.3849297, 1.78159, 1, 1, 1, 1, 1,
0.4571502, -0.8145815, 2.389167, 1, 1, 1, 1, 1,
0.4671672, 0.4017596, 1.264492, 1, 1, 1, 1, 1,
0.467413, -1.278887, 3.098938, 1, 1, 1, 1, 1,
0.4678193, 0.633182, 2.122185, 1, 1, 1, 1, 1,
0.4683844, -0.0872872, 1.020081, 1, 1, 1, 1, 1,
0.4728823, 0.7750651, -0.3673598, 0, 0, 1, 1, 1,
0.4809363, -0.5648333, 0.7403632, 1, 0, 0, 1, 1,
0.4813737, 0.1743944, 0.8737397, 1, 0, 0, 1, 1,
0.4915852, -0.2539167, 1.965221, 1, 0, 0, 1, 1,
0.4935668, -0.7427533, 3.487468, 1, 0, 0, 1, 1,
0.4975489, -0.8624418, 4.340853, 1, 0, 0, 1, 1,
0.4993365, -0.5594101, 2.944522, 0, 0, 0, 1, 1,
0.5004749, -0.4056739, 3.287486, 0, 0, 0, 1, 1,
0.5004871, 1.262286, -0.3348176, 0, 0, 0, 1, 1,
0.5011969, -0.225053, 1.756311, 0, 0, 0, 1, 1,
0.5027228, -0.5842886, 1.719856, 0, 0, 0, 1, 1,
0.5053309, -1.322461, 1.221867, 0, 0, 0, 1, 1,
0.5071706, -0.07427902, 2.272132, 0, 0, 0, 1, 1,
0.5138672, 0.1554675, -0.9039183, 1, 1, 1, 1, 1,
0.5140722, -0.1094891, 0.9385567, 1, 1, 1, 1, 1,
0.5242018, 0.1788443, 2.557951, 1, 1, 1, 1, 1,
0.5282521, -1.268052, 3.053641, 1, 1, 1, 1, 1,
0.5344132, 1.626404, 1.051933, 1, 1, 1, 1, 1,
0.536168, 0.8315259, 0.749179, 1, 1, 1, 1, 1,
0.542782, -0.2714319, 2.774138, 1, 1, 1, 1, 1,
0.5457945, 1.254329, 1.202297, 1, 1, 1, 1, 1,
0.5499605, -1.078535, 3.141038, 1, 1, 1, 1, 1,
0.5516921, 0.4843065, 2.172165, 1, 1, 1, 1, 1,
0.5618979, -0.05450985, 0.9682527, 1, 1, 1, 1, 1,
0.5666162, -1.030673, 3.77145, 1, 1, 1, 1, 1,
0.5730272, 0.6149466, 0.7970508, 1, 1, 1, 1, 1,
0.5908131, -0.3636172, 2.013003, 1, 1, 1, 1, 1,
0.5979316, -0.09773944, 0.4706329, 1, 1, 1, 1, 1,
0.5990577, -0.3626064, 3.418332, 0, 0, 1, 1, 1,
0.6042848, 0.1752154, 0.3569427, 1, 0, 0, 1, 1,
0.6063014, 0.4271231, 0.876158, 1, 0, 0, 1, 1,
0.6115056, 0.9406634, -0.9602013, 1, 0, 0, 1, 1,
0.6138258, -0.9900131, 4.091774, 1, 0, 0, 1, 1,
0.6232335, 0.7255232, -0.3011155, 1, 0, 0, 1, 1,
0.6233179, -0.5434289, 2.92953, 0, 0, 0, 1, 1,
0.6245017, -1.41948, 1.983831, 0, 0, 0, 1, 1,
0.6282806, 1.361603, -0.1981517, 0, 0, 0, 1, 1,
0.6307913, 0.393457, -0.1101008, 0, 0, 0, 1, 1,
0.6318262, -2.656398, 4.142144, 0, 0, 0, 1, 1,
0.6340182, 1.457008, 0.4699045, 0, 0, 0, 1, 1,
0.6375722, -0.7690554, 2.383236, 0, 0, 0, 1, 1,
0.643737, -1.080215, 3.685601, 1, 1, 1, 1, 1,
0.6486107, -0.6523818, 1.74887, 1, 1, 1, 1, 1,
0.6499596, -0.09912678, -1.032084, 1, 1, 1, 1, 1,
0.6560738, -1.084098, 2.600853, 1, 1, 1, 1, 1,
0.6580728, -1.24204, 2.195578, 1, 1, 1, 1, 1,
0.6627775, 0.2630414, -0.1966871, 1, 1, 1, 1, 1,
0.6706788, 0.5493157, 1.719175, 1, 1, 1, 1, 1,
0.6712816, 0.03352999, 2.014018, 1, 1, 1, 1, 1,
0.6804477, 0.2191249, 1.508186, 1, 1, 1, 1, 1,
0.6833561, 2.058371, 0.4200075, 1, 1, 1, 1, 1,
0.6853287, -0.5324023, 1.545675, 1, 1, 1, 1, 1,
0.6969035, 0.410038, 2.589351, 1, 1, 1, 1, 1,
0.6990995, -0.3289967, 2.258554, 1, 1, 1, 1, 1,
0.7100196, -0.6298247, 2.45664, 1, 1, 1, 1, 1,
0.7142106, 0.9749532, 0.7017417, 1, 1, 1, 1, 1,
0.7157823, 0.9632289, -0.5200461, 0, 0, 1, 1, 1,
0.7168834, -0.4525972, 1.382309, 1, 0, 0, 1, 1,
0.723476, 0.7791004, 1.623263, 1, 0, 0, 1, 1,
0.7259285, -0.2443246, 2.488586, 1, 0, 0, 1, 1,
0.7308953, 0.8411485, -0.8312925, 1, 0, 0, 1, 1,
0.7329245, 0.860894, 1.796793, 1, 0, 0, 1, 1,
0.7338928, -0.09495137, 0.7801698, 0, 0, 0, 1, 1,
0.7349954, 0.3237671, 1.079292, 0, 0, 0, 1, 1,
0.7374187, 0.6472474, 2.179652, 0, 0, 0, 1, 1,
0.7378837, 1.387244, 0.01773614, 0, 0, 0, 1, 1,
0.7385201, -1.32266, 3.204995, 0, 0, 0, 1, 1,
0.7433503, 0.8583222, 1.387532, 0, 0, 0, 1, 1,
0.7454428, -0.891217, 2.406408, 0, 0, 0, 1, 1,
0.7659701, 0.4191941, 1.142315, 1, 1, 1, 1, 1,
0.7661846, 0.6392521, 1.482322, 1, 1, 1, 1, 1,
0.7743832, 0.08280815, 1.846358, 1, 1, 1, 1, 1,
0.775916, -0.6684489, 1.500752, 1, 1, 1, 1, 1,
0.776125, 0.5614955, 1.978518, 1, 1, 1, 1, 1,
0.7773566, 0.2124708, 0.5216167, 1, 1, 1, 1, 1,
0.7812245, -1.402673, 2.418757, 1, 1, 1, 1, 1,
0.7824156, -2.473974, 4.333158, 1, 1, 1, 1, 1,
0.7826294, 1.309292, -0.2462581, 1, 1, 1, 1, 1,
0.7876043, 0.673832, 1.011066, 1, 1, 1, 1, 1,
0.7908251, 0.3902466, 0.3514644, 1, 1, 1, 1, 1,
0.7924131, -0.2560122, 2.23019, 1, 1, 1, 1, 1,
0.8033426, -0.263886, 0.9489942, 1, 1, 1, 1, 1,
0.8090768, -0.01052228, 1.891428, 1, 1, 1, 1, 1,
0.8155079, -0.2815491, 0.1317751, 1, 1, 1, 1, 1,
0.8175945, -0.5206953, 3.864863, 0, 0, 1, 1, 1,
0.8304014, 0.8807639, 1.50798, 1, 0, 0, 1, 1,
0.834632, -0.4698226, 1.561578, 1, 0, 0, 1, 1,
0.8386285, -0.9359732, 2.577601, 1, 0, 0, 1, 1,
0.8409693, -2.158983, 3.561957, 1, 0, 0, 1, 1,
0.8429898, 0.6368895, 1.286131, 1, 0, 0, 1, 1,
0.8449402, 0.09429322, 2.121011, 0, 0, 0, 1, 1,
0.8449792, -1.225476, 5.4057, 0, 0, 0, 1, 1,
0.8458416, -0.02387893, 2.466321, 0, 0, 0, 1, 1,
0.8516815, 0.5200571, -1.096242, 0, 0, 0, 1, 1,
0.8545693, 1.730203, -0.2329147, 0, 0, 0, 1, 1,
0.8553231, 0.7334811, 0.416161, 0, 0, 0, 1, 1,
0.855818, 0.6355852, 3.142488, 0, 0, 0, 1, 1,
0.86379, -2.309359, 2.781367, 1, 1, 1, 1, 1,
0.8660151, -1.03399, 3.055119, 1, 1, 1, 1, 1,
0.8688902, -0.398279, 2.292277, 1, 1, 1, 1, 1,
0.869486, 0.07887693, 1.271448, 1, 1, 1, 1, 1,
0.8724671, 0.786944, 3.464213, 1, 1, 1, 1, 1,
0.8744287, 0.06102831, 1.741101, 1, 1, 1, 1, 1,
0.8827759, -0.7580187, 2.416318, 1, 1, 1, 1, 1,
0.8852341, 1.418813, -1.405735, 1, 1, 1, 1, 1,
0.8881955, -1.629063, 2.93954, 1, 1, 1, 1, 1,
0.8934175, 0.6727236, 1.649363, 1, 1, 1, 1, 1,
0.8971252, 1.158266, 2.057152, 1, 1, 1, 1, 1,
0.9016079, 0.5123759, -0.4094204, 1, 1, 1, 1, 1,
0.9067094, 1.870558, 0.001331612, 1, 1, 1, 1, 1,
0.9274213, -0.7322239, 2.585984, 1, 1, 1, 1, 1,
0.9278704, -0.6704363, 3.761976, 1, 1, 1, 1, 1,
0.9289675, -1.536342, 0.7907407, 0, 0, 1, 1, 1,
0.9350953, -0.7663358, -0.4310421, 1, 0, 0, 1, 1,
0.9390281, -0.1191145, 1.30137, 1, 0, 0, 1, 1,
0.9406282, 0.117643, 3.155689, 1, 0, 0, 1, 1,
0.9438936, 0.9632916, 1.980285, 1, 0, 0, 1, 1,
0.9444243, 0.3576278, 0.1855497, 1, 0, 0, 1, 1,
0.9455904, -0.9759279, 2.658839, 0, 0, 0, 1, 1,
0.9470171, -0.2098851, 3.010613, 0, 0, 0, 1, 1,
0.9521008, 0.3997395, 0.4521754, 0, 0, 0, 1, 1,
0.9535398, -0.1354538, 1.557546, 0, 0, 0, 1, 1,
0.956578, -0.8518771, 2.378536, 0, 0, 0, 1, 1,
0.959219, -0.8882887, 1.96398, 0, 0, 0, 1, 1,
0.9617196, 0.4616215, 0.9493575, 0, 0, 0, 1, 1,
0.9747736, 0.9199917, -0.6400684, 1, 1, 1, 1, 1,
0.9762051, 0.9235811, 1.606165, 1, 1, 1, 1, 1,
0.977433, 0.6864938, 0.3585268, 1, 1, 1, 1, 1,
0.9833205, 0.3673784, 1.92214, 1, 1, 1, 1, 1,
0.9878267, -2.184389, 0.9291697, 1, 1, 1, 1, 1,
0.9895341, -1.568269, 2.817159, 1, 1, 1, 1, 1,
0.9923783, 0.1944239, 1.546106, 1, 1, 1, 1, 1,
0.9936737, -0.7530118, 1.863978, 1, 1, 1, 1, 1,
0.994127, 0.09119848, 0.3522129, 1, 1, 1, 1, 1,
1.004757, 0.4451019, 0.8379873, 1, 1, 1, 1, 1,
1.005461, 0.980058, 1.724362, 1, 1, 1, 1, 1,
1.005856, -0.06949997, 1.434506, 1, 1, 1, 1, 1,
1.00734, -0.8538906, 2.7895, 1, 1, 1, 1, 1,
1.01925, -1.964914, 3.213277, 1, 1, 1, 1, 1,
1.019491, 0.7716148, 2.050535, 1, 1, 1, 1, 1,
1.0195, 2.239293, -0.5635874, 0, 0, 1, 1, 1,
1.024176, -0.8741494, 1.98411, 1, 0, 0, 1, 1,
1.028486, -0.4387431, 0.9462724, 1, 0, 0, 1, 1,
1.028773, 0.4583815, 1.831985, 1, 0, 0, 1, 1,
1.028875, 0.6344897, 1.10304, 1, 0, 0, 1, 1,
1.029635, -0.3018767, 3.010445, 1, 0, 0, 1, 1,
1.030889, 0.5139884, 0.6316847, 0, 0, 0, 1, 1,
1.033554, -0.3017202, 1.648266, 0, 0, 0, 1, 1,
1.033738, -0.5915458, 2.675591, 0, 0, 0, 1, 1,
1.033885, -0.2303774, 3.620289, 0, 0, 0, 1, 1,
1.038183, -0.4025869, 3.33153, 0, 0, 0, 1, 1,
1.04416, 0.7239035, -0.2374428, 0, 0, 0, 1, 1,
1.048934, -0.9519411, 3.50062, 0, 0, 0, 1, 1,
1.050429, 1.040282, 0.5833802, 1, 1, 1, 1, 1,
1.058622, -0.8435078, 1.685603, 1, 1, 1, 1, 1,
1.066341, 0.4239356, 1.623821, 1, 1, 1, 1, 1,
1.071328, -0.1664573, 2.514468, 1, 1, 1, 1, 1,
1.072637, -0.1154429, 0.602133, 1, 1, 1, 1, 1,
1.074448, 0.2764611, 0.06996023, 1, 1, 1, 1, 1,
1.079958, -1.950692, 2.621495, 1, 1, 1, 1, 1,
1.080359, 0.2955869, -0.07712696, 1, 1, 1, 1, 1,
1.081743, -1.310471, 1.940007, 1, 1, 1, 1, 1,
1.092932, -1.334376, 4.528986, 1, 1, 1, 1, 1,
1.092985, -0.4911183, 1.085073, 1, 1, 1, 1, 1,
1.100974, -0.276567, 2.378507, 1, 1, 1, 1, 1,
1.101649, -0.1862964, 1.362356, 1, 1, 1, 1, 1,
1.102682, 1.248221, 2.297699, 1, 1, 1, 1, 1,
1.107086, -0.5544577, 1.568408, 1, 1, 1, 1, 1,
1.107977, -1.367545, 0.9828197, 0, 0, 1, 1, 1,
1.13063, 0.8589016, 1.909336, 1, 0, 0, 1, 1,
1.137308, -0.5113404, 2.496061, 1, 0, 0, 1, 1,
1.139519, -0.7690895, 1.468219, 1, 0, 0, 1, 1,
1.14367, 0.6249635, -0.1809898, 1, 0, 0, 1, 1,
1.145487, 1.745785, -0.8875149, 1, 0, 0, 1, 1,
1.151204, -1.299111, 2.581214, 0, 0, 0, 1, 1,
1.1535, 1.234081, -0.9056253, 0, 0, 0, 1, 1,
1.157252, 0.3413758, 1.830927, 0, 0, 0, 1, 1,
1.169204, 0.4439449, 2.936613, 0, 0, 0, 1, 1,
1.169319, 0.2171492, 1.198068, 0, 0, 0, 1, 1,
1.174705, -0.01836793, 1.075846, 0, 0, 0, 1, 1,
1.184077, -0.04675649, 2.46604, 0, 0, 0, 1, 1,
1.185477, 1.52285, 2.438873, 1, 1, 1, 1, 1,
1.190828, 0.4846854, 1.960096, 1, 1, 1, 1, 1,
1.190898, 1.361666, -1.04993, 1, 1, 1, 1, 1,
1.195909, -0.8113732, 2.46741, 1, 1, 1, 1, 1,
1.199541, -0.3287632, 2.780534, 1, 1, 1, 1, 1,
1.201717, -0.8094738, 2.801682, 1, 1, 1, 1, 1,
1.210851, -0.1755394, 1.251814, 1, 1, 1, 1, 1,
1.213783, -0.07956581, 1.127227, 1, 1, 1, 1, 1,
1.219167, -2.294735, 2.30806, 1, 1, 1, 1, 1,
1.23622, 0.8417088, 0.3529708, 1, 1, 1, 1, 1,
1.240821, 0.3235524, -0.4917807, 1, 1, 1, 1, 1,
1.242287, -0.683845, 3.523926, 1, 1, 1, 1, 1,
1.273463, -0.3518161, 2.737847, 1, 1, 1, 1, 1,
1.278865, -0.2572429, 3.043816, 1, 1, 1, 1, 1,
1.283853, -0.5727942, 1.120339, 1, 1, 1, 1, 1,
1.285551, 1.443433, 2.652261, 0, 0, 1, 1, 1,
1.290052, -0.2944565, 1.578787, 1, 0, 0, 1, 1,
1.294497, -0.4676091, 3.994672, 1, 0, 0, 1, 1,
1.297829, 0.3118656, 2.775197, 1, 0, 0, 1, 1,
1.299557, 0.9534204, 0.5152573, 1, 0, 0, 1, 1,
1.314968, 2.549883, 0.4135792, 1, 0, 0, 1, 1,
1.316985, 0.5416626, 2.159179, 0, 0, 0, 1, 1,
1.325194, -0.309456, 0.949985, 0, 0, 0, 1, 1,
1.333087, 0.5120993, 1.186373, 0, 0, 0, 1, 1,
1.339265, -0.7862222, 2.935801, 0, 0, 0, 1, 1,
1.347696, 0.8712246, 1.511685, 0, 0, 0, 1, 1,
1.347946, 0.9262518, 1.061025, 0, 0, 0, 1, 1,
1.347999, 1.937178, 2.223969, 0, 0, 0, 1, 1,
1.3561, 0.8560148, 2.465766, 1, 1, 1, 1, 1,
1.35963, -1.020418, 3.950989, 1, 1, 1, 1, 1,
1.360669, -0.9765007, 2.015687, 1, 1, 1, 1, 1,
1.362206, -0.7804228, 0.8918933, 1, 1, 1, 1, 1,
1.368548, 0.06347947, 2.267488, 1, 1, 1, 1, 1,
1.372287, -0.8394386, 2.083986, 1, 1, 1, 1, 1,
1.388263, 0.9300413, -0.8860455, 1, 1, 1, 1, 1,
1.405568, 1.182449, 1.625952, 1, 1, 1, 1, 1,
1.406029, -0.3358868, 2.031011, 1, 1, 1, 1, 1,
1.409106, -0.2888438, 3.0142, 1, 1, 1, 1, 1,
1.41165, 0.8198482, -0.07426747, 1, 1, 1, 1, 1,
1.411899, -0.0673638, 0.8931667, 1, 1, 1, 1, 1,
1.420072, -0.9416862, 1.338063, 1, 1, 1, 1, 1,
1.426638, 0.1967355, 0.9056281, 1, 1, 1, 1, 1,
1.42746, 0.09611221, -0.1219942, 1, 1, 1, 1, 1,
1.436778, -1.478243, 1.566146, 0, 0, 1, 1, 1,
1.481479, 0.018988, 2.936728, 1, 0, 0, 1, 1,
1.49133, -0.3328301, 0.6826072, 1, 0, 0, 1, 1,
1.5106, 1.640226, 0.4663677, 1, 0, 0, 1, 1,
1.523111, 0.9944399, 0.7951193, 1, 0, 0, 1, 1,
1.538227, -0.9313487, 1.916925, 1, 0, 0, 1, 1,
1.542844, -1.024647, 2.159444, 0, 0, 0, 1, 1,
1.551922, -0.6468405, 1.27746, 0, 0, 0, 1, 1,
1.552351, 0.687076, 1.690538, 0, 0, 0, 1, 1,
1.554744, -1.175763, 1.870898, 0, 0, 0, 1, 1,
1.558453, 0.7153031, 1.831492, 0, 0, 0, 1, 1,
1.562385, 0.1358012, 0.8099378, 0, 0, 0, 1, 1,
1.566831, 0.4401349, 0.9281436, 0, 0, 0, 1, 1,
1.567401, -0.7012087, 1.840123, 1, 1, 1, 1, 1,
1.572913, -0.004935462, 0.978042, 1, 1, 1, 1, 1,
1.587126, 0.2658551, 0.5209304, 1, 1, 1, 1, 1,
1.587942, 0.4914311, 1.073912, 1, 1, 1, 1, 1,
1.598998, -0.3821521, -0.01515022, 1, 1, 1, 1, 1,
1.613215, 0.8372679, 0.6545871, 1, 1, 1, 1, 1,
1.615013, 1.030727, 0.4984097, 1, 1, 1, 1, 1,
1.626674, 0.778769, 1.677666, 1, 1, 1, 1, 1,
1.64134, 0.869627, 2.383164, 1, 1, 1, 1, 1,
1.645644, -0.4583618, 1.885893, 1, 1, 1, 1, 1,
1.646641, -0.6025804, 2.396069, 1, 1, 1, 1, 1,
1.655938, -1.191581, 0.9807525, 1, 1, 1, 1, 1,
1.664339, 0.3443468, 2.126216, 1, 1, 1, 1, 1,
1.688168, 1.362737, 1.315619, 1, 1, 1, 1, 1,
1.691111, 0.6131679, 2.417145, 1, 1, 1, 1, 1,
1.729778, 1.577613, 3.648117, 0, 0, 1, 1, 1,
1.743201, 1.310507, 0.4200329, 1, 0, 0, 1, 1,
1.748981, -0.09816208, 0.207519, 1, 0, 0, 1, 1,
1.76601, 0.7521799, 2.197372, 1, 0, 0, 1, 1,
1.799937, 0.633261, 1.395681, 1, 0, 0, 1, 1,
1.805553, 0.2164929, 0.3207711, 1, 0, 0, 1, 1,
1.805711, -0.09256256, 2.047682, 0, 0, 0, 1, 1,
1.810868, 0.650932, 0.7897316, 0, 0, 0, 1, 1,
1.81464, -0.7466666, 0.7932131, 0, 0, 0, 1, 1,
1.818935, -0.2692486, 2.399275, 0, 0, 0, 1, 1,
1.839913, 0.1793223, 2.235752, 0, 0, 0, 1, 1,
1.845559, 0.529303, 1.057743, 0, 0, 0, 1, 1,
1.850621, -0.6132571, 2.974753, 0, 0, 0, 1, 1,
1.881279, -1.216995, 3.158548, 1, 1, 1, 1, 1,
1.892108, 0.149302, 1.575068, 1, 1, 1, 1, 1,
1.905813, 1.338297, 0.4387807, 1, 1, 1, 1, 1,
1.922957, 1.028779, 1.227333, 1, 1, 1, 1, 1,
1.940049, -0.7825355, 2.298339, 1, 1, 1, 1, 1,
1.988957, -0.6029913, 2.265902, 1, 1, 1, 1, 1,
2.020625, 0.5619482, 0.3713926, 1, 1, 1, 1, 1,
2.052052, -0.2942479, 1.965337, 1, 1, 1, 1, 1,
2.065945, -1.137179, 2.377378, 1, 1, 1, 1, 1,
2.073892, 0.03993142, 1.992146, 1, 1, 1, 1, 1,
2.083978, 0.7255734, 1.303138, 1, 1, 1, 1, 1,
2.113499, 0.3265169, 0.8442119, 1, 1, 1, 1, 1,
2.153586, -0.3163819, 2.052528, 1, 1, 1, 1, 1,
2.154813, 0.4320911, 0.2251055, 1, 1, 1, 1, 1,
2.161361, -0.4650804, 0.7709894, 1, 1, 1, 1, 1,
2.183874, 0.9320771, 1.404471, 0, 0, 1, 1, 1,
2.200668, 0.2491503, 0.5208132, 1, 0, 0, 1, 1,
2.209608, 1.177155, 0.05291091, 1, 0, 0, 1, 1,
2.246214, 0.0195867, 2.388182, 1, 0, 0, 1, 1,
2.249645, -0.2312123, 0.6819156, 1, 0, 0, 1, 1,
2.253292, -0.06735893, 1.365379, 1, 0, 0, 1, 1,
2.281531, 0.2993718, 2.951289, 0, 0, 0, 1, 1,
2.296409, 0.2359734, 2.100469, 0, 0, 0, 1, 1,
2.30652, 0.735441, 0.9703274, 0, 0, 0, 1, 1,
2.320248, 0.5833583, 1.33138, 0, 0, 0, 1, 1,
2.351424, -0.2413128, 0.7854616, 0, 0, 0, 1, 1,
2.40797, -1.696078, 3.339016, 0, 0, 0, 1, 1,
2.450864, -0.2956093, 2.575647, 0, 0, 0, 1, 1,
2.454495, 1.28283, 0.8585793, 1, 1, 1, 1, 1,
2.455039, 1.886189, 1.317952, 1, 1, 1, 1, 1,
2.473446, -0.3734329, 2.721764, 1, 1, 1, 1, 1,
2.584309, 1.287917, 0.499539, 1, 1, 1, 1, 1,
2.597723, 0.1282109, 2.863266, 1, 1, 1, 1, 1,
2.845961, -1.046214, 1.833412, 1, 1, 1, 1, 1,
3.067907, 0.04681613, 3.760088, 1, 1, 1, 1, 1
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
var radius = 9.553505;
var distance = 33.55628;
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
mvMatrix.translate( 0.2805598, -0.0009218454, 0.1064789 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.55628);
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
