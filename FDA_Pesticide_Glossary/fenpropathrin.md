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
-2.967274, 0.4262461, -1.905811, 1, 0, 0, 1,
-2.521012, -0.942706, -2.459918, 1, 0.007843138, 0, 1,
-2.491509, -0.4429432, -2.658472, 1, 0.01176471, 0, 1,
-2.429756, -1.540611, -2.812323, 1, 0.01960784, 0, 1,
-2.424772, 1.069128, -1.250718, 1, 0.02352941, 0, 1,
-2.364797, -1.917363, -0.8629241, 1, 0.03137255, 0, 1,
-2.342476, -1.651442, -3.105637, 1, 0.03529412, 0, 1,
-2.336426, -0.0002329341, -0.4376417, 1, 0.04313726, 0, 1,
-2.320804, -1.637752, -3.871492, 1, 0.04705882, 0, 1,
-2.311001, -1.462207, -1.658658, 1, 0.05490196, 0, 1,
-2.310692, 0.3556509, -1.726783, 1, 0.05882353, 0, 1,
-2.247492, -0.9718689, -1.967325, 1, 0.06666667, 0, 1,
-2.122864, -0.327426, -2.48885, 1, 0.07058824, 0, 1,
-2.113173, 2.170976, -0.7113612, 1, 0.07843138, 0, 1,
-2.067291, 0.9749276, -1.963097, 1, 0.08235294, 0, 1,
-2.05513, -0.4351281, -1.418978, 1, 0.09019608, 0, 1,
-2.029935, 0.9671565, -1.786101, 1, 0.09411765, 0, 1,
-2.023979, 0.2262585, -0.6408272, 1, 0.1019608, 0, 1,
-2.017362, 0.5937335, -1.134755, 1, 0.1098039, 0, 1,
-2.016803, -1.170355, -1.809388, 1, 0.1137255, 0, 1,
-2.015046, -1.4472, -3.060559, 1, 0.1215686, 0, 1,
-1.997443, -0.8975068, -4.82734, 1, 0.1254902, 0, 1,
-1.967379, 0.3325156, -0.4090005, 1, 0.1333333, 0, 1,
-1.957768, 0.9539633, -1.187721, 1, 0.1372549, 0, 1,
-1.934078, 0.8213035, -2.4258, 1, 0.145098, 0, 1,
-1.931124, 1.002402, -0.8118214, 1, 0.1490196, 0, 1,
-1.928706, 1.111755, -2.323567, 1, 0.1568628, 0, 1,
-1.91652, -0.4085715, -0.1452701, 1, 0.1607843, 0, 1,
-1.890052, -0.1896134, -0.879352, 1, 0.1686275, 0, 1,
-1.886965, -0.4118424, -1.201552, 1, 0.172549, 0, 1,
-1.865698, 0.9756202, -1.431459, 1, 0.1803922, 0, 1,
-1.827299, 2.054105, -2.577832, 1, 0.1843137, 0, 1,
-1.826572, -0.01328526, -0.3483709, 1, 0.1921569, 0, 1,
-1.811369, -0.5592765, -0.8839787, 1, 0.1960784, 0, 1,
-1.810508, 0.6733479, -1.737553, 1, 0.2039216, 0, 1,
-1.808626, -0.7998976, -0.9825494, 1, 0.2117647, 0, 1,
-1.787905, 0.5767782, -2.486284, 1, 0.2156863, 0, 1,
-1.783964, -0.6178994, -0.9666798, 1, 0.2235294, 0, 1,
-1.77658, -0.3902516, -2.573307, 1, 0.227451, 0, 1,
-1.771796, -0.9370933, -1.545031, 1, 0.2352941, 0, 1,
-1.769717, -0.7927797, -1.580556, 1, 0.2392157, 0, 1,
-1.766251, -1.286538, -0.3906687, 1, 0.2470588, 0, 1,
-1.765441, 1.296184, -1.172347, 1, 0.2509804, 0, 1,
-1.745517, 2.124013, -0.4765788, 1, 0.2588235, 0, 1,
-1.694382, 0.5826178, -1.687575, 1, 0.2627451, 0, 1,
-1.688017, -0.2044246, -0.9577784, 1, 0.2705882, 0, 1,
-1.68583, 0.7342734, -0.8626791, 1, 0.2745098, 0, 1,
-1.670576, -0.8999492, -3.752805, 1, 0.282353, 0, 1,
-1.668239, -0.6650097, -1.437081, 1, 0.2862745, 0, 1,
-1.660773, 0.1696195, -1.534375, 1, 0.2941177, 0, 1,
-1.650867, -1.03085, -0.9960796, 1, 0.3019608, 0, 1,
-1.647201, -0.362227, -1.003614, 1, 0.3058824, 0, 1,
-1.646528, 0.8636164, -1.823487, 1, 0.3137255, 0, 1,
-1.640238, 0.6768, -2.030567, 1, 0.3176471, 0, 1,
-1.636678, -2.938907, -2.987546, 1, 0.3254902, 0, 1,
-1.629325, -0.1148813, -2.978958, 1, 0.3294118, 0, 1,
-1.614916, -0.6590155, -2.855566, 1, 0.3372549, 0, 1,
-1.60778, 0.05271601, -0.4118782, 1, 0.3411765, 0, 1,
-1.606972, 0.02507016, -1.287424, 1, 0.3490196, 0, 1,
-1.60238, -0.4191773, 0.03574723, 1, 0.3529412, 0, 1,
-1.601618, -1.393634, -2.331009, 1, 0.3607843, 0, 1,
-1.589564, 0.6032837, -1.412778, 1, 0.3647059, 0, 1,
-1.55839, 3.108891, 0.3768232, 1, 0.372549, 0, 1,
-1.557558, -0.9939191, -2.180807, 1, 0.3764706, 0, 1,
-1.552945, 0.1432401, -2.524981, 1, 0.3843137, 0, 1,
-1.513001, -0.4508675, -0.007111642, 1, 0.3882353, 0, 1,
-1.499879, -0.7171662, -1.686813, 1, 0.3960784, 0, 1,
-1.493611, 0.3176103, -0.6536537, 1, 0.4039216, 0, 1,
-1.488549, 0.2658777, -0.9197933, 1, 0.4078431, 0, 1,
-1.484674, -0.3300176, -1.924815, 1, 0.4156863, 0, 1,
-1.483355, -0.4870101, -2.732954, 1, 0.4196078, 0, 1,
-1.483216, 1.33224, -1.232522, 1, 0.427451, 0, 1,
-1.479556, 0.3693871, -1.375522, 1, 0.4313726, 0, 1,
-1.476006, 1.479612, 0.01202756, 1, 0.4392157, 0, 1,
-1.459768, 0.009541498, -4.3147, 1, 0.4431373, 0, 1,
-1.456469, -0.5051296, -1.66286, 1, 0.4509804, 0, 1,
-1.447348, 1.175136, -0.4704156, 1, 0.454902, 0, 1,
-1.4429, 0.9760439, -1.39079, 1, 0.4627451, 0, 1,
-1.434042, -0.7384145, -0.821927, 1, 0.4666667, 0, 1,
-1.432809, 0.2891892, -2.918947, 1, 0.4745098, 0, 1,
-1.427763, 0.4798749, -0.6647668, 1, 0.4784314, 0, 1,
-1.426246, 2.756739, -0.793512, 1, 0.4862745, 0, 1,
-1.408945, -1.775366, -2.529218, 1, 0.4901961, 0, 1,
-1.405257, -1.071895, -1.788679, 1, 0.4980392, 0, 1,
-1.404857, 0.276693, 0.6658043, 1, 0.5058824, 0, 1,
-1.395507, -2.409595, -2.523746, 1, 0.509804, 0, 1,
-1.394535, 0.2662946, -1.9659, 1, 0.5176471, 0, 1,
-1.384494, 0.8300789, -1.512103, 1, 0.5215687, 0, 1,
-1.360829, 0.8333036, -0.8488528, 1, 0.5294118, 0, 1,
-1.340232, 0.6427662, -0.8267518, 1, 0.5333334, 0, 1,
-1.337022, 1.844318, -1.818325, 1, 0.5411765, 0, 1,
-1.332981, -0.3225223, 0.1970391, 1, 0.5450981, 0, 1,
-1.318437, -0.8495838, -3.012233, 1, 0.5529412, 0, 1,
-1.3168, -0.7150041, -0.6400881, 1, 0.5568628, 0, 1,
-1.314537, 1.139406, -2.338566, 1, 0.5647059, 0, 1,
-1.310233, -0.5901887, -1.867849, 1, 0.5686275, 0, 1,
-1.309886, -0.6986765, -2.989844, 1, 0.5764706, 0, 1,
-1.307976, 0.8910519, -2.631112, 1, 0.5803922, 0, 1,
-1.297475, -0.4577025, -1.946407, 1, 0.5882353, 0, 1,
-1.276431, -0.09388684, -1.871456, 1, 0.5921569, 0, 1,
-1.275024, -0.5804172, -3.415455, 1, 0.6, 0, 1,
-1.269853, 1.76604, -1.052918, 1, 0.6078432, 0, 1,
-1.239517, -1.693707, -5.85497, 1, 0.6117647, 0, 1,
-1.237893, -1.223728, -2.553149, 1, 0.6196079, 0, 1,
-1.231333, 0.7560819, -0.2390656, 1, 0.6235294, 0, 1,
-1.227473, 0.3746415, -0.1360003, 1, 0.6313726, 0, 1,
-1.222474, -1.026446, -4.333752, 1, 0.6352941, 0, 1,
-1.221545, 1.129746, -0.762059, 1, 0.6431373, 0, 1,
-1.211636, -1.819812, -0.5386279, 1, 0.6470588, 0, 1,
-1.210413, 0.9147549, -2.593183, 1, 0.654902, 0, 1,
-1.202923, -0.7669476, -1.406772, 1, 0.6588235, 0, 1,
-1.192299, -1.531531, -2.10526, 1, 0.6666667, 0, 1,
-1.174327, 2.336885, -0.07505159, 1, 0.6705883, 0, 1,
-1.170579, 0.5111627, -2.037638, 1, 0.6784314, 0, 1,
-1.167506, -0.7320736, -2.901214, 1, 0.682353, 0, 1,
-1.15008, 1.948382, -1.502186, 1, 0.6901961, 0, 1,
-1.145954, 1.718203, -0.06887801, 1, 0.6941177, 0, 1,
-1.141545, -0.2064239, -2.453469, 1, 0.7019608, 0, 1,
-1.140532, -0.06352302, -0.6667784, 1, 0.7098039, 0, 1,
-1.13306, 1.443242, -2.749288, 1, 0.7137255, 0, 1,
-1.130046, -0.6257407, -3.382715, 1, 0.7215686, 0, 1,
-1.125102, -0.4175764, -2.04756, 1, 0.7254902, 0, 1,
-1.122229, 0.9870898, 1.175376, 1, 0.7333333, 0, 1,
-1.121312, 1.139331, 0.4798445, 1, 0.7372549, 0, 1,
-1.115939, 0.3013519, -2.780998, 1, 0.7450981, 0, 1,
-1.10151, -0.1422183, -1.142848, 1, 0.7490196, 0, 1,
-1.100585, 0.5467325, -1.417194, 1, 0.7568628, 0, 1,
-1.092025, 0.3878663, 1.034832, 1, 0.7607843, 0, 1,
-1.091468, 0.1713631, -1.854371, 1, 0.7686275, 0, 1,
-1.083073, -0.9447568, -2.693112, 1, 0.772549, 0, 1,
-1.080288, 1.159356, -0.8816234, 1, 0.7803922, 0, 1,
-1.072813, 1.301718, -0.6744122, 1, 0.7843137, 0, 1,
-1.067794, 0.3556848, -2.173177, 1, 0.7921569, 0, 1,
-1.05427, -0.8905202, -3.662168, 1, 0.7960784, 0, 1,
-1.053804, -0.1951919, -0.1582185, 1, 0.8039216, 0, 1,
-1.053792, -0.5004248, -2.326637, 1, 0.8117647, 0, 1,
-1.051864, -1.798707, -4.270341, 1, 0.8156863, 0, 1,
-1.050881, -0.05928665, -1.088914, 1, 0.8235294, 0, 1,
-1.050389, -1.563414, -2.565949, 1, 0.827451, 0, 1,
-1.046416, -0.478238, -1.290334, 1, 0.8352941, 0, 1,
-1.043483, 0.8043963, -1.808343, 1, 0.8392157, 0, 1,
-1.042104, -0.404526, -1.79701, 1, 0.8470588, 0, 1,
-1.039159, -0.6631427, -2.230355, 1, 0.8509804, 0, 1,
-1.032082, -2.007888, -5.182456, 1, 0.8588235, 0, 1,
-1.024301, 0.8990982, -0.3827397, 1, 0.8627451, 0, 1,
-1.016656, 0.1454067, -0.1605302, 1, 0.8705882, 0, 1,
-1.016529, -1.139012, -2.548871, 1, 0.8745098, 0, 1,
-1.015409, 0.2911727, -0.3094648, 1, 0.8823529, 0, 1,
-1.011586, -1.922783, -2.668881, 1, 0.8862745, 0, 1,
-1.007365, 1.94743, -0.8387526, 1, 0.8941177, 0, 1,
-0.9978737, -0.1467513, 0.6513656, 1, 0.8980392, 0, 1,
-0.9967394, -0.5290475, -1.075972, 1, 0.9058824, 0, 1,
-0.9962904, 1.094953, -0.8807349, 1, 0.9137255, 0, 1,
-0.9869191, -0.4730704, -1.835155, 1, 0.9176471, 0, 1,
-0.9854159, 0.5034994, -1.301915, 1, 0.9254902, 0, 1,
-0.9825401, -0.3091283, -1.941339, 1, 0.9294118, 0, 1,
-0.9633451, -1.60066, -0.4323363, 1, 0.9372549, 0, 1,
-0.9626243, -1.051319, 0.664431, 1, 0.9411765, 0, 1,
-0.9587147, 0.0967945, -0.6823655, 1, 0.9490196, 0, 1,
-0.9518107, -2.051702, -1.447535, 1, 0.9529412, 0, 1,
-0.9505744, -1.762338, -1.303728, 1, 0.9607843, 0, 1,
-0.9472709, -2.103431, -2.635933, 1, 0.9647059, 0, 1,
-0.9461707, 1.414873, -0.5050995, 1, 0.972549, 0, 1,
-0.9438364, -0.2727539, -3.260396, 1, 0.9764706, 0, 1,
-0.9423226, 0.06397918, -0.9897319, 1, 0.9843137, 0, 1,
-0.9389324, 0.05722758, 0.9055884, 1, 0.9882353, 0, 1,
-0.9389016, 0.2942798, -0.9649392, 1, 0.9960784, 0, 1,
-0.938496, -0.9203913, -1.670354, 0.9960784, 1, 0, 1,
-0.9343902, -1.891413, -4.066803, 0.9921569, 1, 0, 1,
-0.9254546, -0.3173291, -3.680678, 0.9843137, 1, 0, 1,
-0.9232653, 1.007905, -1.119258, 0.9803922, 1, 0, 1,
-0.9198214, -0.07046169, 0.501139, 0.972549, 1, 0, 1,
-0.917799, -0.7028142, -3.147147, 0.9686275, 1, 0, 1,
-0.9162022, -0.6479851, -1.493051, 0.9607843, 1, 0, 1,
-0.915084, -1.038963, -2.898798, 0.9568627, 1, 0, 1,
-0.9131829, -0.2645089, -2.262981, 0.9490196, 1, 0, 1,
-0.9124475, 1.078566, -1.522306, 0.945098, 1, 0, 1,
-0.9116099, 0.6652819, -3.259533, 0.9372549, 1, 0, 1,
-0.9102284, 1.231233, -1.095309, 0.9333333, 1, 0, 1,
-0.9018995, -0.2450761, -3.195476, 0.9254902, 1, 0, 1,
-0.8957283, -2.129198, -2.938039, 0.9215686, 1, 0, 1,
-0.8957015, -1.560048, -3.440606, 0.9137255, 1, 0, 1,
-0.8939356, -0.6830801, -1.87594, 0.9098039, 1, 0, 1,
-0.886574, 2.0071, -1.617633, 0.9019608, 1, 0, 1,
-0.8791606, 0.7638058, -1.734535, 0.8941177, 1, 0, 1,
-0.8715656, 0.02730248, -0.616929, 0.8901961, 1, 0, 1,
-0.8715175, -0.5014862, -2.101802, 0.8823529, 1, 0, 1,
-0.8696532, 0.794939, 1.070673, 0.8784314, 1, 0, 1,
-0.8652267, 0.6023285, -1.044547, 0.8705882, 1, 0, 1,
-0.8631836, 0.53, -1.033944, 0.8666667, 1, 0, 1,
-0.8612276, 2.289214, -0.7864197, 0.8588235, 1, 0, 1,
-0.8589157, -0.9094846, -2.155899, 0.854902, 1, 0, 1,
-0.8574283, 0.1548754, -1.725306, 0.8470588, 1, 0, 1,
-0.8546162, -0.034683, -2.088094, 0.8431373, 1, 0, 1,
-0.8425671, -1.763289, -3.592604, 0.8352941, 1, 0, 1,
-0.8363777, 1.046351, -0.3828755, 0.8313726, 1, 0, 1,
-0.8297406, 1.570615, 0.2431757, 0.8235294, 1, 0, 1,
-0.824463, -0.5627552, -1.86544, 0.8196079, 1, 0, 1,
-0.8238699, -0.2969691, -1.026987, 0.8117647, 1, 0, 1,
-0.8156576, 0.313555, 0.07907975, 0.8078431, 1, 0, 1,
-0.8152264, 0.3342245, -0.2943506, 0.8, 1, 0, 1,
-0.8117125, 1.768347, 0.5255142, 0.7921569, 1, 0, 1,
-0.8106072, -0.4273319, -1.468493, 0.7882353, 1, 0, 1,
-0.808934, -0.1480089, -2.118152, 0.7803922, 1, 0, 1,
-0.8044546, 0.8252069, -1.416831, 0.7764706, 1, 0, 1,
-0.7975893, 0.8807235, -1.325486, 0.7686275, 1, 0, 1,
-0.794811, -0.02637689, -2.786766, 0.7647059, 1, 0, 1,
-0.7946894, 0.1148403, -1.661602, 0.7568628, 1, 0, 1,
-0.7892403, -0.1937873, -1.509825, 0.7529412, 1, 0, 1,
-0.7889428, -1.341449, -2.589746, 0.7450981, 1, 0, 1,
-0.788875, 0.03162156, -3.180893, 0.7411765, 1, 0, 1,
-0.786963, -2.71994, -3.099741, 0.7333333, 1, 0, 1,
-0.7858298, -0.06570297, -1.234035, 0.7294118, 1, 0, 1,
-0.7818092, -0.5207919, -1.394931, 0.7215686, 1, 0, 1,
-0.7785482, 2.334484, -0.2963666, 0.7176471, 1, 0, 1,
-0.7782753, 0.04006191, -0.290649, 0.7098039, 1, 0, 1,
-0.7642215, 0.1426355, -1.240968, 0.7058824, 1, 0, 1,
-0.762082, 0.8098224, -1.827664, 0.6980392, 1, 0, 1,
-0.7597045, 0.3288386, -2.013524, 0.6901961, 1, 0, 1,
-0.7578307, -2.170321, -3.478881, 0.6862745, 1, 0, 1,
-0.752883, -0.9772435, -2.04217, 0.6784314, 1, 0, 1,
-0.750711, 0.5896296, -1.066038, 0.6745098, 1, 0, 1,
-0.7468253, -1.251762, -2.285892, 0.6666667, 1, 0, 1,
-0.7450243, -0.4738615, -1.193139, 0.6627451, 1, 0, 1,
-0.7426496, -0.004572998, -0.5331525, 0.654902, 1, 0, 1,
-0.7399449, 1.090507, -1.11964, 0.6509804, 1, 0, 1,
-0.7356752, 1.086068, -0.348681, 0.6431373, 1, 0, 1,
-0.735225, -2.48313, -1.264028, 0.6392157, 1, 0, 1,
-0.7330308, -0.138333, -1.54243, 0.6313726, 1, 0, 1,
-0.7323694, -0.3670494, -3.411164, 0.627451, 1, 0, 1,
-0.7298741, -0.8211472, -1.837891, 0.6196079, 1, 0, 1,
-0.7272634, 0.2767017, -1.424012, 0.6156863, 1, 0, 1,
-0.7249185, -0.7314045, -1.355831, 0.6078432, 1, 0, 1,
-0.7139913, 0.5101099, -2.640424, 0.6039216, 1, 0, 1,
-0.7117365, 1.785511, -1.931999, 0.5960785, 1, 0, 1,
-0.709057, 0.1236031, -1.965566, 0.5882353, 1, 0, 1,
-0.703473, 0.8811916, -1.107723, 0.5843138, 1, 0, 1,
-0.7023896, 0.2291337, -0.9357457, 0.5764706, 1, 0, 1,
-0.6979195, -0.5559339, -2.078762, 0.572549, 1, 0, 1,
-0.6885524, -0.4068245, -2.64327, 0.5647059, 1, 0, 1,
-0.6807175, -0.3428582, -1.218474, 0.5607843, 1, 0, 1,
-0.6777565, 0.4263279, -0.6473719, 0.5529412, 1, 0, 1,
-0.6773733, 1.767206, -0.2537727, 0.5490196, 1, 0, 1,
-0.6771136, 1.581847, 1.768973, 0.5411765, 1, 0, 1,
-0.6764406, -1.262485, -4.230321, 0.5372549, 1, 0, 1,
-0.6744467, 2.346126, -1.175697, 0.5294118, 1, 0, 1,
-0.672804, -2.264102, -3.4071, 0.5254902, 1, 0, 1,
-0.6678564, -0.1965721, -3.727096, 0.5176471, 1, 0, 1,
-0.6648918, -1.708792, -0.9417344, 0.5137255, 1, 0, 1,
-0.6578841, 0.8076564, -2.245435, 0.5058824, 1, 0, 1,
-0.6488154, 0.3278701, 0.01848814, 0.5019608, 1, 0, 1,
-0.6449839, 0.01493995, -1.621537, 0.4941176, 1, 0, 1,
-0.6437045, 0.03794802, -3.254372, 0.4862745, 1, 0, 1,
-0.6430621, 0.1820911, -3.027679, 0.4823529, 1, 0, 1,
-0.6357265, 0.04980702, -0.1500428, 0.4745098, 1, 0, 1,
-0.6350173, 0.337469, -2.870898, 0.4705882, 1, 0, 1,
-0.6247913, -0.7285284, -4.044375, 0.4627451, 1, 0, 1,
-0.6237291, -0.1234345, -0.9240198, 0.4588235, 1, 0, 1,
-0.6237223, 1.270286, 0.2973571, 0.4509804, 1, 0, 1,
-0.622542, 1.959546, -1.772424, 0.4470588, 1, 0, 1,
-0.621807, -0.5599141, -3.051651, 0.4392157, 1, 0, 1,
-0.619186, -0.976842, -1.427348, 0.4352941, 1, 0, 1,
-0.6166285, -0.04747888, -1.609914, 0.427451, 1, 0, 1,
-0.6162449, -0.1428206, -1.465814, 0.4235294, 1, 0, 1,
-0.6155775, 0.9545802, -1.10547, 0.4156863, 1, 0, 1,
-0.614315, 0.2390351, -1.662918, 0.4117647, 1, 0, 1,
-0.6137485, -1.242023, -1.45377, 0.4039216, 1, 0, 1,
-0.6127198, -1.347691, -2.297231, 0.3960784, 1, 0, 1,
-0.6085674, -0.7229066, -3.08323, 0.3921569, 1, 0, 1,
-0.6047027, 1.355973, -1.302155, 0.3843137, 1, 0, 1,
-0.6025084, 0.1198996, -0.2064401, 0.3803922, 1, 0, 1,
-0.6001673, 0.8626657, -0.4712219, 0.372549, 1, 0, 1,
-0.5952516, 1.163197, 1.248653, 0.3686275, 1, 0, 1,
-0.5950512, -0.03080079, -4.261488, 0.3607843, 1, 0, 1,
-0.5841764, -0.7315664, -1.243132, 0.3568628, 1, 0, 1,
-0.5835366, 1.210494, -0.1544552, 0.3490196, 1, 0, 1,
-0.5802953, 1.149175, -0.4193647, 0.345098, 1, 0, 1,
-0.5741701, -0.3556152, -3.061532, 0.3372549, 1, 0, 1,
-0.5736249, 1.079021, -0.7734038, 0.3333333, 1, 0, 1,
-0.5711933, 0.1569068, 0.9538279, 0.3254902, 1, 0, 1,
-0.5693077, 0.06359264, -2.100647, 0.3215686, 1, 0, 1,
-0.5626687, -0.1101225, -2.702649, 0.3137255, 1, 0, 1,
-0.5559599, -0.2969248, -3.042014, 0.3098039, 1, 0, 1,
-0.5530428, 0.8138539, -0.3408079, 0.3019608, 1, 0, 1,
-0.5513133, -1.003641, -3.598377, 0.2941177, 1, 0, 1,
-0.5454164, 0.9740015, -2.567015, 0.2901961, 1, 0, 1,
-0.5452316, -0.3415593, -1.563739, 0.282353, 1, 0, 1,
-0.5450085, -0.3987621, -3.140673, 0.2784314, 1, 0, 1,
-0.5436814, 0.3092626, -0.2531864, 0.2705882, 1, 0, 1,
-0.5414282, -0.6315348, -3.665216, 0.2666667, 1, 0, 1,
-0.5362381, 0.8253102, -2.32015, 0.2588235, 1, 0, 1,
-0.5356502, -1.410417, -2.708115, 0.254902, 1, 0, 1,
-0.5348012, 0.5370011, -1.806261, 0.2470588, 1, 0, 1,
-0.5321534, -1.683137, -4.429972, 0.2431373, 1, 0, 1,
-0.5312205, -0.6749756, -1.671486, 0.2352941, 1, 0, 1,
-0.5299731, 0.6075872, -0.0474692, 0.2313726, 1, 0, 1,
-0.5235378, 0.6176543, -2.048954, 0.2235294, 1, 0, 1,
-0.5229857, -0.4518203, -1.52187, 0.2196078, 1, 0, 1,
-0.5209321, 1.069166, -1.585555, 0.2117647, 1, 0, 1,
-0.5190769, -1.228984, -2.872647, 0.2078431, 1, 0, 1,
-0.5131891, -0.205352, -2.739191, 0.2, 1, 0, 1,
-0.4997399, -1.097786, -1.841727, 0.1921569, 1, 0, 1,
-0.4962633, -0.5123582, -1.897189, 0.1882353, 1, 0, 1,
-0.4939748, 0.3757437, -1.146641, 0.1803922, 1, 0, 1,
-0.4903011, 0.4637629, 0.6801603, 0.1764706, 1, 0, 1,
-0.4866768, -0.9231913, -3.417882, 0.1686275, 1, 0, 1,
-0.4856901, -0.2504657, -2.301029, 0.1647059, 1, 0, 1,
-0.4845108, 0.7900462, 1.343513, 0.1568628, 1, 0, 1,
-0.4822074, 1.158416, -1.469306, 0.1529412, 1, 0, 1,
-0.4803646, 0.9449708, -0.5687205, 0.145098, 1, 0, 1,
-0.4770264, -1.454337, -2.329186, 0.1411765, 1, 0, 1,
-0.4766206, 0.5189459, 0.1508821, 0.1333333, 1, 0, 1,
-0.4743726, -1.061765, -2.93075, 0.1294118, 1, 0, 1,
-0.4735466, -0.08199896, -2.301252, 0.1215686, 1, 0, 1,
-0.47144, -0.01656043, 0.2672319, 0.1176471, 1, 0, 1,
-0.4698287, -0.9345464, -2.403907, 0.1098039, 1, 0, 1,
-0.4684078, 0.1783309, -0.5584466, 0.1058824, 1, 0, 1,
-0.4661271, 0.8520647, 0.04968505, 0.09803922, 1, 0, 1,
-0.4623935, 0.6522617, -2.121424, 0.09019608, 1, 0, 1,
-0.4608042, -1.370464, -2.211475, 0.08627451, 1, 0, 1,
-0.4600938, -1.240019, -4.092121, 0.07843138, 1, 0, 1,
-0.4582849, -0.5940642, -1.152771, 0.07450981, 1, 0, 1,
-0.4578366, -1.051235, -2.918724, 0.06666667, 1, 0, 1,
-0.4539548, 0.2303482, -1.320889, 0.0627451, 1, 0, 1,
-0.4519274, -0.6575475, -2.420957, 0.05490196, 1, 0, 1,
-0.4414005, -1.518326, -0.8637422, 0.05098039, 1, 0, 1,
-0.4410928, 0.3555607, 0.7976082, 0.04313726, 1, 0, 1,
-0.4388447, -0.4799515, -1.141713, 0.03921569, 1, 0, 1,
-0.4363898, -0.4730642, -0.9548761, 0.03137255, 1, 0, 1,
-0.4361311, -0.03643193, -1.17241, 0.02745098, 1, 0, 1,
-0.4347689, 0.8592274, 0.1246822, 0.01960784, 1, 0, 1,
-0.4317234, -0.6053172, -2.968774, 0.01568628, 1, 0, 1,
-0.4274641, 1.994764, 0.1595421, 0.007843138, 1, 0, 1,
-0.4229324, -0.6504184, -3.887437, 0.003921569, 1, 0, 1,
-0.4198778, -0.3263947, -2.240677, 0, 1, 0.003921569, 1,
-0.4188435, 0.6173466, -0.7410768, 0, 1, 0.01176471, 1,
-0.413376, 0.8841397, 0.5036759, 0, 1, 0.01568628, 1,
-0.4106751, 0.8608207, -2.250044, 0, 1, 0.02352941, 1,
-0.4094006, 0.6288828, 1.08112, 0, 1, 0.02745098, 1,
-0.409367, -2.302946, -1.885996, 0, 1, 0.03529412, 1,
-0.408261, 0.416486, -1.0259, 0, 1, 0.03921569, 1,
-0.4081005, -0.01554162, -2.801105, 0, 1, 0.04705882, 1,
-0.405215, 0.1671865, -1.888177, 0, 1, 0.05098039, 1,
-0.4027915, 0.7414768, -0.2785371, 0, 1, 0.05882353, 1,
-0.3984043, 0.2733363, 0.1860292, 0, 1, 0.0627451, 1,
-0.394961, 0.6473632, 0.9929218, 0, 1, 0.07058824, 1,
-0.3935943, -1.351793, -1.618919, 0, 1, 0.07450981, 1,
-0.3765591, -0.06662833, -2.39607, 0, 1, 0.08235294, 1,
-0.3751674, 0.1179085, -0.7736749, 0, 1, 0.08627451, 1,
-0.3733833, 0.1660491, 2.287446, 0, 1, 0.09411765, 1,
-0.3660483, -0.5731821, -2.884265, 0, 1, 0.1019608, 1,
-0.3660225, -0.2593128, -2.630525, 0, 1, 0.1058824, 1,
-0.3609784, -1.098626, -2.542195, 0, 1, 0.1137255, 1,
-0.3574325, 0.3577761, 0.476706, 0, 1, 0.1176471, 1,
-0.3566701, -0.0545594, -2.242562, 0, 1, 0.1254902, 1,
-0.3565747, -0.9368933, -1.270962, 0, 1, 0.1294118, 1,
-0.3561259, -0.6088458, -5.596103, 0, 1, 0.1372549, 1,
-0.3552442, -0.8817413, -4.013608, 0, 1, 0.1411765, 1,
-0.3506507, 0.3169087, 0.8453378, 0, 1, 0.1490196, 1,
-0.3496274, -0.7591194, -2.877888, 0, 1, 0.1529412, 1,
-0.346826, -0.4323886, -3.665471, 0, 1, 0.1607843, 1,
-0.3460232, -0.7347816, -5.740655, 0, 1, 0.1647059, 1,
-0.3457809, -0.4311626, -2.282914, 0, 1, 0.172549, 1,
-0.3444105, 0.00923581, -3.281522, 0, 1, 0.1764706, 1,
-0.3435993, -0.5872982, -2.455422, 0, 1, 0.1843137, 1,
-0.337658, 0.5725627, 1.337758, 0, 1, 0.1882353, 1,
-0.3294997, -0.2650428, -2.931617, 0, 1, 0.1960784, 1,
-0.3286747, 0.5758452, 0.1726948, 0, 1, 0.2039216, 1,
-0.3264766, -1.390603, -3.542567, 0, 1, 0.2078431, 1,
-0.3233048, 0.2199828, -0.1890629, 0, 1, 0.2156863, 1,
-0.3230488, -0.2794549, -1.35001, 0, 1, 0.2196078, 1,
-0.322661, 0.2494096, 0.9993253, 0, 1, 0.227451, 1,
-0.3218383, -0.37198, -0.5507268, 0, 1, 0.2313726, 1,
-0.3216405, 0.4049364, -0.1367635, 0, 1, 0.2392157, 1,
-0.3196557, -0.9523601, -4.040107, 0, 1, 0.2431373, 1,
-0.3171894, 1.887036, -0.7427609, 0, 1, 0.2509804, 1,
-0.316521, 0.6814128, -1.222125, 0, 1, 0.254902, 1,
-0.3145621, 0.4826873, -0.07061605, 0, 1, 0.2627451, 1,
-0.3131555, 0.7178203, -0.254267, 0, 1, 0.2666667, 1,
-0.3130302, -0.9798121, -1.890441, 0, 1, 0.2745098, 1,
-0.3128457, 1.44724, 0.5901831, 0, 1, 0.2784314, 1,
-0.310407, -0.007125821, -0.9595965, 0, 1, 0.2862745, 1,
-0.3034148, -0.1755038, -2.190371, 0, 1, 0.2901961, 1,
-0.3033153, -0.6707895, -2.459087, 0, 1, 0.2980392, 1,
-0.3023975, -0.7406699, -2.044565, 0, 1, 0.3058824, 1,
-0.3016805, -1.176919, -0.9868268, 0, 1, 0.3098039, 1,
-0.3004015, -0.2312426, -1.00881, 0, 1, 0.3176471, 1,
-0.2981918, -0.3966792, -0.8200308, 0, 1, 0.3215686, 1,
-0.297499, 1.004075, -1.752016, 0, 1, 0.3294118, 1,
-0.2925731, -0.01626737, -2.075119, 0, 1, 0.3333333, 1,
-0.2922163, 0.6775365, 0.1876431, 0, 1, 0.3411765, 1,
-0.2909727, 0.9625452, -2.172465, 0, 1, 0.345098, 1,
-0.2893775, -0.009961056, -1.326973, 0, 1, 0.3529412, 1,
-0.2858774, 0.6883197, -1.889849, 0, 1, 0.3568628, 1,
-0.2851055, 1.274442, 0.2466219, 0, 1, 0.3647059, 1,
-0.2812559, -1.736712, -3.554447, 0, 1, 0.3686275, 1,
-0.2776119, 0.7448061, 0.02228653, 0, 1, 0.3764706, 1,
-0.2773676, 0.1251631, -2.185715, 0, 1, 0.3803922, 1,
-0.27603, 0.2735153, -3.443155, 0, 1, 0.3882353, 1,
-0.2744925, 1.352031, 0.6344688, 0, 1, 0.3921569, 1,
-0.2737759, -1.936562, -1.285197, 0, 1, 0.4, 1,
-0.2714508, 0.762119, -1.78766, 0, 1, 0.4078431, 1,
-0.2688084, 1.559044, -0.09250256, 0, 1, 0.4117647, 1,
-0.2671721, 1.031612, -1.772599, 0, 1, 0.4196078, 1,
-0.2640911, 0.6206068, -0.3250321, 0, 1, 0.4235294, 1,
-0.2583582, 0.6828969, -0.4995161, 0, 1, 0.4313726, 1,
-0.2512487, -0.8794264, -2.528478, 0, 1, 0.4352941, 1,
-0.2512404, -2.852215, -1.412637, 0, 1, 0.4431373, 1,
-0.2504654, 0.255656, -2.076787, 0, 1, 0.4470588, 1,
-0.2498582, 2.330825, 0.4263165, 0, 1, 0.454902, 1,
-0.2492498, 1.731953, -1.780811, 0, 1, 0.4588235, 1,
-0.2480189, -0.03972489, -3.839734, 0, 1, 0.4666667, 1,
-0.2438742, 0.01157231, -2.451826, 0, 1, 0.4705882, 1,
-0.2385768, -0.4341857, -3.58397, 0, 1, 0.4784314, 1,
-0.2343685, -0.5832893, -3.318575, 0, 1, 0.4823529, 1,
-0.2311845, 0.7378784, 0.8342519, 0, 1, 0.4901961, 1,
-0.2256279, -1.550008, -2.99742, 0, 1, 0.4941176, 1,
-0.2233381, 0.03180685, -1.975983, 0, 1, 0.5019608, 1,
-0.2230741, -0.2887975, -2.952323, 0, 1, 0.509804, 1,
-0.211877, 0.7637116, -0.3042772, 0, 1, 0.5137255, 1,
-0.2116367, -0.6646424, -1.475116, 0, 1, 0.5215687, 1,
-0.2089342, -0.0285656, -1.034653, 0, 1, 0.5254902, 1,
-0.2066614, -0.2809484, -1.315327, 0, 1, 0.5333334, 1,
-0.2062205, -0.627929, -2.52151, 0, 1, 0.5372549, 1,
-0.2050766, -2.105935, -1.762473, 0, 1, 0.5450981, 1,
-0.2018222, -1.36209, -1.988756, 0, 1, 0.5490196, 1,
-0.1995228, -0.690357, -1.238264, 0, 1, 0.5568628, 1,
-0.1965498, -0.4237918, -2.706562, 0, 1, 0.5607843, 1,
-0.1965331, -0.5407254, -2.111372, 0, 1, 0.5686275, 1,
-0.1965086, -0.04381561, -2.094777, 0, 1, 0.572549, 1,
-0.1962194, -0.879467, -3.461367, 0, 1, 0.5803922, 1,
-0.1921365, -1.579807, -1.958338, 0, 1, 0.5843138, 1,
-0.1870337, 0.9198532, -0.8654012, 0, 1, 0.5921569, 1,
-0.1867631, 0.1137283, -1.598563, 0, 1, 0.5960785, 1,
-0.1850895, 0.7982574, 1.854876, 0, 1, 0.6039216, 1,
-0.182711, -1.249699, -3.971248, 0, 1, 0.6117647, 1,
-0.1700929, 0.6372647, 0.1340208, 0, 1, 0.6156863, 1,
-0.164465, 0.8878291, -0.3707015, 0, 1, 0.6235294, 1,
-0.1632739, 0.6272988, 0.5327978, 0, 1, 0.627451, 1,
-0.1615731, -0.3107834, -4.161764, 0, 1, 0.6352941, 1,
-0.1555739, -0.8501465, -3.406598, 0, 1, 0.6392157, 1,
-0.155149, 0.4943005, 0.5487189, 0, 1, 0.6470588, 1,
-0.1529944, 0.3141146, -0.6927148, 0, 1, 0.6509804, 1,
-0.1417458, 0.4775369, 0.117276, 0, 1, 0.6588235, 1,
-0.1414867, 1.180153, 0.8623012, 0, 1, 0.6627451, 1,
-0.1374634, -0.6486855, -4.384786, 0, 1, 0.6705883, 1,
-0.1360241, 0.2987303, -0.2676097, 0, 1, 0.6745098, 1,
-0.1344858, 0.8192757, 0.0245232, 0, 1, 0.682353, 1,
-0.1292904, 0.8730583, 1.000505, 0, 1, 0.6862745, 1,
-0.1277137, 0.3319878, -0.7350585, 0, 1, 0.6941177, 1,
-0.1251067, 0.2308582, -3.008846, 0, 1, 0.7019608, 1,
-0.1224859, 0.7993575, 0.09005423, 0, 1, 0.7058824, 1,
-0.1183186, -0.03361667, -1.031227, 0, 1, 0.7137255, 1,
-0.1168028, 0.2009839, -1.691886, 0, 1, 0.7176471, 1,
-0.1122703, -0.8998508, -3.75295, 0, 1, 0.7254902, 1,
-0.1119251, 0.3708414, 0.7568007, 0, 1, 0.7294118, 1,
-0.1056642, -1.766652, -2.582493, 0, 1, 0.7372549, 1,
-0.1051527, 0.3011501, -1.738451, 0, 1, 0.7411765, 1,
-0.1045565, -0.8294101, -3.608259, 0, 1, 0.7490196, 1,
-0.1029411, -0.3271961, -3.008243, 0, 1, 0.7529412, 1,
-0.1026694, 0.37714, -0.3869885, 0, 1, 0.7607843, 1,
-0.1014862, 1.239194, -0.7529044, 0, 1, 0.7647059, 1,
-0.09847362, 1.960009, -0.2996531, 0, 1, 0.772549, 1,
-0.09534369, -0.9492028, -4.434231, 0, 1, 0.7764706, 1,
-0.09397407, 0.3888888, -0.4731285, 0, 1, 0.7843137, 1,
-0.09252891, -0.967654, -2.571795, 0, 1, 0.7882353, 1,
-0.09194628, -0.1024034, -1.886797, 0, 1, 0.7960784, 1,
-0.08882362, 0.01684117, -0.4374005, 0, 1, 0.8039216, 1,
-0.08660216, -1.29194, -5.232535, 0, 1, 0.8078431, 1,
-0.08546335, 1.315242, 1.011853, 0, 1, 0.8156863, 1,
-0.08354501, -0.3304743, -3.186656, 0, 1, 0.8196079, 1,
-0.08295388, -0.2484566, -4.301754, 0, 1, 0.827451, 1,
-0.07444054, -0.4340044, -4.743287, 0, 1, 0.8313726, 1,
-0.07323699, -0.1723989, -4.339952, 0, 1, 0.8392157, 1,
-0.07317351, -1.433181, -4.299679, 0, 1, 0.8431373, 1,
-0.06763893, -1.045829, -3.73178, 0, 1, 0.8509804, 1,
-0.0675236, 1.523772, -0.3346123, 0, 1, 0.854902, 1,
-0.06609715, 1.685128, -0.9622919, 0, 1, 0.8627451, 1,
-0.06452435, -0.1181262, -3.822662, 0, 1, 0.8666667, 1,
-0.06388469, -1.018996, -2.733719, 0, 1, 0.8745098, 1,
-0.05787274, 0.1472811, -1.587319, 0, 1, 0.8784314, 1,
-0.05746829, -0.1092011, -2.657805, 0, 1, 0.8862745, 1,
-0.04954308, 0.6968356, -0.2317362, 0, 1, 0.8901961, 1,
-0.04831965, 0.706448, 1.326361, 0, 1, 0.8980392, 1,
-0.04712894, -0.5836675, -4.777643, 0, 1, 0.9058824, 1,
-0.0335191, 0.7574955, -1.325305, 0, 1, 0.9098039, 1,
-0.02195796, -0.7882, -3.298177, 0, 1, 0.9176471, 1,
-0.01787895, -0.8224097, -3.228876, 0, 1, 0.9215686, 1,
-0.01342321, -1.244693, -2.899985, 0, 1, 0.9294118, 1,
-0.007162736, 0.9305153, 0.9502664, 0, 1, 0.9333333, 1,
0.0001506811, 0.1593492, 0.4776042, 0, 1, 0.9411765, 1,
0.001194621, -1.509592, 3.40043, 0, 1, 0.945098, 1,
0.001920953, -1.032462, 2.655751, 0, 1, 0.9529412, 1,
0.004667402, 1.989725, -0.7276749, 0, 1, 0.9568627, 1,
0.006785928, 1.203711, 0.01922501, 0, 1, 0.9647059, 1,
0.01423369, 0.1703316, -1.673434, 0, 1, 0.9686275, 1,
0.02272717, 0.972514, 0.6150482, 0, 1, 0.9764706, 1,
0.02656068, -0.4081567, 3.372162, 0, 1, 0.9803922, 1,
0.02822118, -1.185397, 3.417038, 0, 1, 0.9882353, 1,
0.02886121, -0.369641, 2.727001, 0, 1, 0.9921569, 1,
0.03122204, -0.5471799, 3.000815, 0, 1, 1, 1,
0.03271786, 0.4832648, 0.3159725, 0, 0.9921569, 1, 1,
0.03372542, -0.7886277, 2.870803, 0, 0.9882353, 1, 1,
0.04143716, -1.584223, 2.980179, 0, 0.9803922, 1, 1,
0.04302634, -0.5926912, 0.9857897, 0, 0.9764706, 1, 1,
0.04868464, 1.201823, 0.469649, 0, 0.9686275, 1, 1,
0.0490812, 0.881769, -0.6781481, 0, 0.9647059, 1, 1,
0.05092221, -0.7096492, 4.780374, 0, 0.9568627, 1, 1,
0.05097147, -2.303577, 3.745859, 0, 0.9529412, 1, 1,
0.05517348, -1.100483, 2.757838, 0, 0.945098, 1, 1,
0.06006002, -1.38137, 4.355431, 0, 0.9411765, 1, 1,
0.06442893, -1.217452, 1.599662, 0, 0.9333333, 1, 1,
0.06692199, -0.5336877, 1.231106, 0, 0.9294118, 1, 1,
0.07084049, 0.1045896, -1.706783, 0, 0.9215686, 1, 1,
0.07102836, 1.902022, 0.4587572, 0, 0.9176471, 1, 1,
0.07976647, 0.07481994, 1.593621, 0, 0.9098039, 1, 1,
0.0838047, -1.874002, 3.229518, 0, 0.9058824, 1, 1,
0.08686043, 2.857873, 1.576235, 0, 0.8980392, 1, 1,
0.0887196, -0.3992841, 3.30236, 0, 0.8901961, 1, 1,
0.09293421, 0.2229331, -0.294986, 0, 0.8862745, 1, 1,
0.09829608, 1.876069, 0.2504901, 0, 0.8784314, 1, 1,
0.09873436, -0.02145175, 1.449493, 0, 0.8745098, 1, 1,
0.09896949, -0.5606307, 4.173139, 0, 0.8666667, 1, 1,
0.09960588, -0.5932037, 4.470008, 0, 0.8627451, 1, 1,
0.104415, -0.3360594, 3.603829, 0, 0.854902, 1, 1,
0.1088264, 0.2311701, 0.5310616, 0, 0.8509804, 1, 1,
0.1152442, -0.828313, 2.269138, 0, 0.8431373, 1, 1,
0.1156492, -1.970569, 4.351963, 0, 0.8392157, 1, 1,
0.1164412, 1.244296, -0.3414295, 0, 0.8313726, 1, 1,
0.1243702, 1.326597, 1.11868, 0, 0.827451, 1, 1,
0.1307352, 0.8187776, 0.4050381, 0, 0.8196079, 1, 1,
0.1316081, 0.4860027, -0.2355182, 0, 0.8156863, 1, 1,
0.1343001, -0.7648227, 2.882628, 0, 0.8078431, 1, 1,
0.1368344, 1.467024, 0.1732917, 0, 0.8039216, 1, 1,
0.1372934, -0.3350244, 2.827839, 0, 0.7960784, 1, 1,
0.1377799, 1.940228, -2.750191, 0, 0.7882353, 1, 1,
0.1434684, 1.833254, 0.2981529, 0, 0.7843137, 1, 1,
0.1435713, -1.103603, 2.594808, 0, 0.7764706, 1, 1,
0.1465643, -0.3840974, 1.818937, 0, 0.772549, 1, 1,
0.1466244, -2.593626, 3.349569, 0, 0.7647059, 1, 1,
0.1544722, -1.274638, 2.695116, 0, 0.7607843, 1, 1,
0.1596326, 0.6522516, -0.6266069, 0, 0.7529412, 1, 1,
0.1624911, 0.6940028, 2.938994, 0, 0.7490196, 1, 1,
0.162642, -1.456699, 3.836639, 0, 0.7411765, 1, 1,
0.1700237, -0.4128427, 3.338655, 0, 0.7372549, 1, 1,
0.1714884, 0.8699807, 1.244876, 0, 0.7294118, 1, 1,
0.1762404, -2.644311, 2.993141, 0, 0.7254902, 1, 1,
0.1767304, 2.153387, 0.9865944, 0, 0.7176471, 1, 1,
0.1784609, 1.428739, -0.2267861, 0, 0.7137255, 1, 1,
0.1806431, -0.2958249, 3.32403, 0, 0.7058824, 1, 1,
0.1850034, -0.2827326, 1.082585, 0, 0.6980392, 1, 1,
0.1853531, -0.5163338, 0.2409736, 0, 0.6941177, 1, 1,
0.1862968, -0.4690049, 0.9506395, 0, 0.6862745, 1, 1,
0.1894008, 1.10098, 0.6862131, 0, 0.682353, 1, 1,
0.1971855, -0.7389175, 1.695008, 0, 0.6745098, 1, 1,
0.1982139, -0.9047776, 2.027604, 0, 0.6705883, 1, 1,
0.1982495, 1.510799, -0.9030808, 0, 0.6627451, 1, 1,
0.2093803, 0.8913966, -0.3455017, 0, 0.6588235, 1, 1,
0.2100158, 0.7573334, -1.234976, 0, 0.6509804, 1, 1,
0.2118705, 0.1802841, -0.2396398, 0, 0.6470588, 1, 1,
0.2127916, 0.8557131, 1.085373, 0, 0.6392157, 1, 1,
0.2137337, -1.435876, 4.562783, 0, 0.6352941, 1, 1,
0.2156178, 0.8789951, 0.5480695, 0, 0.627451, 1, 1,
0.2183444, 0.8020333, 0.03100153, 0, 0.6235294, 1, 1,
0.2209917, 1.30197, -0.1567812, 0, 0.6156863, 1, 1,
0.2217903, -1.804874, 3.006391, 0, 0.6117647, 1, 1,
0.2229419, -1.380878, 3.728071, 0, 0.6039216, 1, 1,
0.2280959, 0.184732, -0.9399955, 0, 0.5960785, 1, 1,
0.2282083, 0.06644597, 3.092798, 0, 0.5921569, 1, 1,
0.2295708, -0.8315811, 1.961661, 0, 0.5843138, 1, 1,
0.2316856, -1.789804, 3.658275, 0, 0.5803922, 1, 1,
0.232702, -2.163604, 2.673556, 0, 0.572549, 1, 1,
0.2343491, -0.3017311, 3.762201, 0, 0.5686275, 1, 1,
0.2359641, 0.1718084, 1.569025, 0, 0.5607843, 1, 1,
0.2362712, 0.6288593, -2.893851, 0, 0.5568628, 1, 1,
0.2380513, -1.733322, 2.083733, 0, 0.5490196, 1, 1,
0.2408051, 0.8651234, 0.3174138, 0, 0.5450981, 1, 1,
0.2449353, -0.8542489, 3.895671, 0, 0.5372549, 1, 1,
0.2466227, -1.956532, 3.145844, 0, 0.5333334, 1, 1,
0.2495946, -0.8113878, 0.9548197, 0, 0.5254902, 1, 1,
0.2508985, 0.5383784, 0.4610283, 0, 0.5215687, 1, 1,
0.253453, 2.46131, -0.06014396, 0, 0.5137255, 1, 1,
0.2535023, 0.04707008, 1.018736, 0, 0.509804, 1, 1,
0.256224, 0.5383168, 0.158517, 0, 0.5019608, 1, 1,
0.2582701, -0.7610391, 1.878193, 0, 0.4941176, 1, 1,
0.2609259, 0.6904178, 2.05243, 0, 0.4901961, 1, 1,
0.264172, -0.2128487, 1.555121, 0, 0.4823529, 1, 1,
0.2655271, -1.639958, 0.3223146, 0, 0.4784314, 1, 1,
0.2668548, -0.3329204, 1.1199, 0, 0.4705882, 1, 1,
0.2724785, 0.57317, -1.507693, 0, 0.4666667, 1, 1,
0.2744135, -0.2618691, 2.516434, 0, 0.4588235, 1, 1,
0.275332, 1.637411, -0.1784778, 0, 0.454902, 1, 1,
0.2794397, 0.5423816, 1.688761, 0, 0.4470588, 1, 1,
0.2811036, -0.8215315, 2.901554, 0, 0.4431373, 1, 1,
0.2837737, 0.8226277, 0.0736551, 0, 0.4352941, 1, 1,
0.2843227, -0.6518962, 3.539983, 0, 0.4313726, 1, 1,
0.2851717, -0.1391051, 2.94162, 0, 0.4235294, 1, 1,
0.2896949, 0.3936169, -0.4523325, 0, 0.4196078, 1, 1,
0.2948053, -0.8840569, 1.203117, 0, 0.4117647, 1, 1,
0.2954349, -2.413052, 3.297902, 0, 0.4078431, 1, 1,
0.2957534, 0.01111472, 2.390463, 0, 0.4, 1, 1,
0.301312, 0.6437191, 1.27226, 0, 0.3921569, 1, 1,
0.3049232, -0.5241225, 4.805711, 0, 0.3882353, 1, 1,
0.3070706, -0.4230541, 3.426061, 0, 0.3803922, 1, 1,
0.3095528, 0.01015646, 1.700614, 0, 0.3764706, 1, 1,
0.3096475, 0.8762894, 1.262284, 0, 0.3686275, 1, 1,
0.3111397, 1.158584, 0.7236467, 0, 0.3647059, 1, 1,
0.3114535, -1.007906, 3.502193, 0, 0.3568628, 1, 1,
0.3123728, 1.605068, 0.01471039, 0, 0.3529412, 1, 1,
0.3153442, 0.6186922, -0.1450123, 0, 0.345098, 1, 1,
0.3159603, 1.161226, -0.2816695, 0, 0.3411765, 1, 1,
0.318095, -0.05872881, 0.8219929, 0, 0.3333333, 1, 1,
0.3210237, -0.03216231, 2.73389, 0, 0.3294118, 1, 1,
0.3215712, -0.4399966, 3.089839, 0, 0.3215686, 1, 1,
0.3215998, 0.2394952, 0.798426, 0, 0.3176471, 1, 1,
0.3220429, -0.7481833, 3.950737, 0, 0.3098039, 1, 1,
0.3286583, 0.6498671, 0.6383159, 0, 0.3058824, 1, 1,
0.3309413, 1.379224, -0.4325008, 0, 0.2980392, 1, 1,
0.3350483, -0.8752255, 2.060503, 0, 0.2901961, 1, 1,
0.339639, -1.547539, 4.497762, 0, 0.2862745, 1, 1,
0.3418212, -0.2104259, 1.771681, 0, 0.2784314, 1, 1,
0.3458554, -0.8015143, 2.824981, 0, 0.2745098, 1, 1,
0.3475165, -0.1539997, 2.863737, 0, 0.2666667, 1, 1,
0.3528063, 0.1546664, -0.2327712, 0, 0.2627451, 1, 1,
0.354314, -0.8048796, 1.84758, 0, 0.254902, 1, 1,
0.3560015, 0.09259371, 1.617009, 0, 0.2509804, 1, 1,
0.3578261, 0.4398943, 2.192426, 0, 0.2431373, 1, 1,
0.3583959, 0.2152081, 1.684433, 0, 0.2392157, 1, 1,
0.3589784, 1.135448, -0.2628426, 0, 0.2313726, 1, 1,
0.3590029, -0.007857082, 1.545899, 0, 0.227451, 1, 1,
0.3680246, 2.314727, -1.124922, 0, 0.2196078, 1, 1,
0.3684737, 0.6789902, 3.542033, 0, 0.2156863, 1, 1,
0.3779194, 0.9885864, 0.4541138, 0, 0.2078431, 1, 1,
0.3833966, 0.5585544, 0.01113558, 0, 0.2039216, 1, 1,
0.3870359, 0.1094247, 2.810739, 0, 0.1960784, 1, 1,
0.3884029, -2.039958, 3.992911, 0, 0.1882353, 1, 1,
0.3911536, -0.8783206, 2.582492, 0, 0.1843137, 1, 1,
0.3919871, 0.965232, 0.3568732, 0, 0.1764706, 1, 1,
0.393664, -0.3461529, 3.669644, 0, 0.172549, 1, 1,
0.3981738, 0.6093513, 0.8110031, 0, 0.1647059, 1, 1,
0.3986051, 0.4620781, -0.5254352, 0, 0.1607843, 1, 1,
0.3995652, 1.680721, 1.169298, 0, 0.1529412, 1, 1,
0.4006715, -0.7298556, 3.483802, 0, 0.1490196, 1, 1,
0.4035726, 0.05997012, 1.895617, 0, 0.1411765, 1, 1,
0.4100954, 0.1199255, 3.010978, 0, 0.1372549, 1, 1,
0.4102107, -1.438609, 1.711564, 0, 0.1294118, 1, 1,
0.4123725, -1.259896, 4.039467, 0, 0.1254902, 1, 1,
0.4129921, 0.1555886, 2.635953, 0, 0.1176471, 1, 1,
0.4138871, -1.691362, 1.105949, 0, 0.1137255, 1, 1,
0.4142312, -1.563255, 2.722682, 0, 0.1058824, 1, 1,
0.4162443, -1.428689, 2.303523, 0, 0.09803922, 1, 1,
0.4191685, 0.3376505, 0.08329146, 0, 0.09411765, 1, 1,
0.4204956, 2.138866, 1.655245, 0, 0.08627451, 1, 1,
0.4211864, 0.2548229, 0.669309, 0, 0.08235294, 1, 1,
0.425838, 0.954937, 0.3412531, 0, 0.07450981, 1, 1,
0.427544, -0.7414719, 2.253979, 0, 0.07058824, 1, 1,
0.4319087, -0.05368487, 2.099565, 0, 0.0627451, 1, 1,
0.4326545, 0.3414313, -1.312806, 0, 0.05882353, 1, 1,
0.4340166, 0.4592966, 1.235583, 0, 0.05098039, 1, 1,
0.4382434, -1.378501, 2.078416, 0, 0.04705882, 1, 1,
0.4391119, 1.179466, 0.355763, 0, 0.03921569, 1, 1,
0.4413469, -1.582271, 3.168277, 0, 0.03529412, 1, 1,
0.4447822, 1.051176, 1.284575, 0, 0.02745098, 1, 1,
0.4500489, -0.2121887, 1.038114, 0, 0.02352941, 1, 1,
0.4553088, -0.1443236, 1.417088, 0, 0.01568628, 1, 1,
0.4569011, -0.7339258, 1.687561, 0, 0.01176471, 1, 1,
0.4592505, 0.0008177518, 1.681011, 0, 0.003921569, 1, 1,
0.4594005, -1.023604, 3.58172, 0.003921569, 0, 1, 1,
0.4608573, -1.347573, 3.697123, 0.007843138, 0, 1, 1,
0.4648506, -0.4838189, 2.112763, 0.01568628, 0, 1, 1,
0.4681797, -1.759743, 3.848452, 0.01960784, 0, 1, 1,
0.4693639, -0.7268393, 1.529511, 0.02745098, 0, 1, 1,
0.4738205, -0.7126685, 2.210667, 0.03137255, 0, 1, 1,
0.4764029, -2.112424, 3.905453, 0.03921569, 0, 1, 1,
0.4809066, 0.7384115, 0.9692574, 0.04313726, 0, 1, 1,
0.4818912, 1.378914, 1.218427, 0.05098039, 0, 1, 1,
0.4831494, -0.2760529, 0.1384541, 0.05490196, 0, 1, 1,
0.4847643, -1.618817, 3.575369, 0.0627451, 0, 1, 1,
0.486839, 0.005991933, 1.743218, 0.06666667, 0, 1, 1,
0.4921978, 0.9003376, 0.2923169, 0.07450981, 0, 1, 1,
0.4934762, 0.3984444, 1.214592, 0.07843138, 0, 1, 1,
0.4937039, 1.145664, 0.03921954, 0.08627451, 0, 1, 1,
0.4945996, 0.1287041, 2.521623, 0.09019608, 0, 1, 1,
0.4974529, 1.854156, -0.1534056, 0.09803922, 0, 1, 1,
0.5087523, 0.3526808, 0.3011774, 0.1058824, 0, 1, 1,
0.5091026, 0.6328607, -0.8406265, 0.1098039, 0, 1, 1,
0.5122575, 1.081513, 1.540503, 0.1176471, 0, 1, 1,
0.5163718, 1.582551, -1.020482, 0.1215686, 0, 1, 1,
0.5186529, 3.334873, 1.200018, 0.1294118, 0, 1, 1,
0.5219892, 0.6645014, 2.811743, 0.1333333, 0, 1, 1,
0.530392, -0.8815461, 2.94038, 0.1411765, 0, 1, 1,
0.5363392, -1.105248, 3.197344, 0.145098, 0, 1, 1,
0.5387471, 0.4670503, -0.05379779, 0.1529412, 0, 1, 1,
0.5409508, -0.8566098, 3.474801, 0.1568628, 0, 1, 1,
0.5422056, -0.5921007, 1.954606, 0.1647059, 0, 1, 1,
0.542402, 2.010504, 0.05484761, 0.1686275, 0, 1, 1,
0.5435023, -0.2400983, 1.855785, 0.1764706, 0, 1, 1,
0.5444259, 0.7607247, 2.156288, 0.1803922, 0, 1, 1,
0.5505897, -0.1789846, 1.175505, 0.1882353, 0, 1, 1,
0.550626, -0.2315547, 2.641255, 0.1921569, 0, 1, 1,
0.5511035, 0.658946, -0.2330052, 0.2, 0, 1, 1,
0.5614196, 0.895551, -1.073837, 0.2078431, 0, 1, 1,
0.5632135, 0.5827363, -0.4929674, 0.2117647, 0, 1, 1,
0.5695931, 0.5111476, 0.2847724, 0.2196078, 0, 1, 1,
0.5856033, 0.1456929, 0.8327562, 0.2235294, 0, 1, 1,
0.5869921, 0.9619049, 0.8429927, 0.2313726, 0, 1, 1,
0.6026909, -0.005293088, 2.286725, 0.2352941, 0, 1, 1,
0.6036112, 0.9630708, 1.022846, 0.2431373, 0, 1, 1,
0.6207691, -0.297111, 0.6223558, 0.2470588, 0, 1, 1,
0.621263, 1.029788, 0.3612038, 0.254902, 0, 1, 1,
0.6221196, 0.2107275, 1.770714, 0.2588235, 0, 1, 1,
0.627931, -0.05573879, 1.1472, 0.2666667, 0, 1, 1,
0.6346843, -0.3245616, 1.204567, 0.2705882, 0, 1, 1,
0.6349816, -1.831339, 2.392078, 0.2784314, 0, 1, 1,
0.6366103, -1.699903, 2.760029, 0.282353, 0, 1, 1,
0.6382321, 0.1213933, 0.5266526, 0.2901961, 0, 1, 1,
0.6461228, 0.800459, 0.9016062, 0.2941177, 0, 1, 1,
0.6465655, -1.006951, 2.281047, 0.3019608, 0, 1, 1,
0.6484581, 0.2683545, -0.1199059, 0.3098039, 0, 1, 1,
0.6491148, 0.6522135, 0.8714446, 0.3137255, 0, 1, 1,
0.6504473, -1.255136, 3.999185, 0.3215686, 0, 1, 1,
0.6518916, 1.564766, -0.6243083, 0.3254902, 0, 1, 1,
0.6533271, 0.8572025, -0.24433, 0.3333333, 0, 1, 1,
0.6589322, 0.6137897, 0.5622278, 0.3372549, 0, 1, 1,
0.664796, 0.07386987, 2.569307, 0.345098, 0, 1, 1,
0.6660853, -0.06651045, 0.5304114, 0.3490196, 0, 1, 1,
0.6670432, 1.048782, -0.04851507, 0.3568628, 0, 1, 1,
0.6682502, -0.7950858, 3.560409, 0.3607843, 0, 1, 1,
0.6702294, -0.7113306, 3.200645, 0.3686275, 0, 1, 1,
0.6728647, -0.006448504, 1.895243, 0.372549, 0, 1, 1,
0.6732098, 0.1761372, 0.4837931, 0.3803922, 0, 1, 1,
0.6744728, 0.2501265, 1.723832, 0.3843137, 0, 1, 1,
0.6761613, 1.375471, -0.6756483, 0.3921569, 0, 1, 1,
0.6818353, -1.752915, 3.98713, 0.3960784, 0, 1, 1,
0.6819189, 1.604118, 0.6319255, 0.4039216, 0, 1, 1,
0.6825933, 0.1750401, 1.532262, 0.4117647, 0, 1, 1,
0.684387, -0.3724951, 0.5062363, 0.4156863, 0, 1, 1,
0.6855891, 0.9107695, 0.07237364, 0.4235294, 0, 1, 1,
0.6884753, -1.078319, 2.412096, 0.427451, 0, 1, 1,
0.6894304, -0.9014913, 1.695248, 0.4352941, 0, 1, 1,
0.6922589, -0.8816332, 2.824669, 0.4392157, 0, 1, 1,
0.6933289, 1.030262, 1.978031, 0.4470588, 0, 1, 1,
0.6947302, 0.4980457, 0.3873402, 0.4509804, 0, 1, 1,
0.6961721, -0.1626959, 1.77992, 0.4588235, 0, 1, 1,
0.6968042, -1.734917, 3.127877, 0.4627451, 0, 1, 1,
0.6971399, -0.761028, 1.833768, 0.4705882, 0, 1, 1,
0.698355, 0.8170798, 0.8893167, 0.4745098, 0, 1, 1,
0.7020817, 0.9056696, -0.4119402, 0.4823529, 0, 1, 1,
0.7030384, -1.332604, 2.994376, 0.4862745, 0, 1, 1,
0.704327, -0.8626537, 2.579589, 0.4941176, 0, 1, 1,
0.7049388, -0.9232, 4.609003, 0.5019608, 0, 1, 1,
0.705564, -2.578637, 2.033762, 0.5058824, 0, 1, 1,
0.7066534, 0.3362817, 0.7435015, 0.5137255, 0, 1, 1,
0.7123207, -0.8751566, 2.663673, 0.5176471, 0, 1, 1,
0.7130851, -2.060483, 4.64236, 0.5254902, 0, 1, 1,
0.7180327, 0.3035623, 1.259672, 0.5294118, 0, 1, 1,
0.7197503, -0.9955884, 2.486781, 0.5372549, 0, 1, 1,
0.7258936, 0.1834231, 2.118846, 0.5411765, 0, 1, 1,
0.7275496, -0.1589341, 1.078789, 0.5490196, 0, 1, 1,
0.7276844, 0.6059007, 1.00564, 0.5529412, 0, 1, 1,
0.7284366, -0.3903422, 4.0112, 0.5607843, 0, 1, 1,
0.7355691, -1.463296, 3.376042, 0.5647059, 0, 1, 1,
0.7386478, -0.6387634, 1.407189, 0.572549, 0, 1, 1,
0.7393614, 0.05495792, 2.064018, 0.5764706, 0, 1, 1,
0.7446647, -1.040297, 2.178536, 0.5843138, 0, 1, 1,
0.7560309, -0.432326, 1.877828, 0.5882353, 0, 1, 1,
0.7580332, 0.1955827, 0.9393516, 0.5960785, 0, 1, 1,
0.7584198, -0.7196107, 0.523423, 0.6039216, 0, 1, 1,
0.7586205, 0.1552379, 1.194427, 0.6078432, 0, 1, 1,
0.7621443, -0.748698, 0.4970275, 0.6156863, 0, 1, 1,
0.7626487, 0.1965505, 1.218643, 0.6196079, 0, 1, 1,
0.7681862, -0.6389849, 2.604686, 0.627451, 0, 1, 1,
0.7733573, -0.6455337, 2.745745, 0.6313726, 0, 1, 1,
0.7749335, 0.06455604, 1.013673, 0.6392157, 0, 1, 1,
0.7750415, 0.9627193, 0.5783452, 0.6431373, 0, 1, 1,
0.7756287, -0.3991036, 2.047988, 0.6509804, 0, 1, 1,
0.7785275, -0.08391761, 2.563835, 0.654902, 0, 1, 1,
0.7901623, -0.9856583, 3.217417, 0.6627451, 0, 1, 1,
0.7972089, -0.488096, 1.286268, 0.6666667, 0, 1, 1,
0.807592, 0.8668871, 0.6122385, 0.6745098, 0, 1, 1,
0.8227855, -0.06238545, 2.983364, 0.6784314, 0, 1, 1,
0.8253067, 0.3719533, -2.311923, 0.6862745, 0, 1, 1,
0.8294505, -1.151836, 2.157718, 0.6901961, 0, 1, 1,
0.8333057, -0.1753616, 2.925222, 0.6980392, 0, 1, 1,
0.8367992, 1.343334, 0.09098151, 0.7058824, 0, 1, 1,
0.8408342, 1.553601, -0.3654569, 0.7098039, 0, 1, 1,
0.8524081, -0.02607512, 0.3836592, 0.7176471, 0, 1, 1,
0.8580165, -0.5742755, 1.566039, 0.7215686, 0, 1, 1,
0.8651332, 0.4130689, 0.8025622, 0.7294118, 0, 1, 1,
0.8709448, 0.01705944, -0.7034786, 0.7333333, 0, 1, 1,
0.8774679, -0.096348, 1.91966, 0.7411765, 0, 1, 1,
0.877878, 1.571172, 0.9046147, 0.7450981, 0, 1, 1,
0.8799021, 0.1402486, 2.359264, 0.7529412, 0, 1, 1,
0.8839949, -0.3828065, 0.9919727, 0.7568628, 0, 1, 1,
0.8916144, 0.5600615, -1.086256, 0.7647059, 0, 1, 1,
0.8921193, 2.098656, 1.143972, 0.7686275, 0, 1, 1,
0.8953642, 0.1274409, 2.441798, 0.7764706, 0, 1, 1,
0.8989718, 0.1432473, 2.472453, 0.7803922, 0, 1, 1,
0.9014134, -0.04234037, 3.623545, 0.7882353, 0, 1, 1,
0.9053823, -0.6541933, 2.443593, 0.7921569, 0, 1, 1,
0.9065434, 0.387995, 0.6675038, 0.8, 0, 1, 1,
0.910228, -1.193032, 2.438083, 0.8078431, 0, 1, 1,
0.913124, 0.4621779, 1.868515, 0.8117647, 0, 1, 1,
0.9163747, -1.486438, 2.129565, 0.8196079, 0, 1, 1,
0.9178143, 2.78968, 0.2080576, 0.8235294, 0, 1, 1,
0.9195402, -1.858485, 1.961282, 0.8313726, 0, 1, 1,
0.9227347, -0.2973704, 3.309837, 0.8352941, 0, 1, 1,
0.9261239, 1.819898, 0.3179055, 0.8431373, 0, 1, 1,
0.9355059, 1.811934, 0.7504296, 0.8470588, 0, 1, 1,
0.9356379, -0.11843, 1.605899, 0.854902, 0, 1, 1,
0.9390546, -0.9901944, 2.224083, 0.8588235, 0, 1, 1,
0.9412168, -0.2582137, 3.885867, 0.8666667, 0, 1, 1,
0.9438805, 0.1527252, 0.3430389, 0.8705882, 0, 1, 1,
0.9519587, -0.2660321, 0.2685821, 0.8784314, 0, 1, 1,
0.9526967, -0.3082846, 1.59215, 0.8823529, 0, 1, 1,
0.9549431, 1.262368, 1.228424, 0.8901961, 0, 1, 1,
0.958724, -0.5320169, 0.7049764, 0.8941177, 0, 1, 1,
0.9594526, -0.3188801, 1.586832, 0.9019608, 0, 1, 1,
0.9622941, -0.01157197, 0.2599099, 0.9098039, 0, 1, 1,
0.9658595, -0.9401577, 2.20291, 0.9137255, 0, 1, 1,
0.9757189, -0.1494058, 1.94328, 0.9215686, 0, 1, 1,
0.9770179, 1.366086, 0.01275038, 0.9254902, 0, 1, 1,
0.9778843, -1.157184, 0.4611684, 0.9333333, 0, 1, 1,
0.9816068, -0.4162539, 3.021074, 0.9372549, 0, 1, 1,
0.9870983, -0.2305994, 0.7158935, 0.945098, 0, 1, 1,
0.9884517, 0.2057617, 3.607864, 0.9490196, 0, 1, 1,
0.9892942, 0.9893523, 1.10061, 0.9568627, 0, 1, 1,
0.9921893, 1.165521, 0.3729517, 0.9607843, 0, 1, 1,
0.9985815, -0.8929442, 4.337714, 0.9686275, 0, 1, 1,
1.005007, 1.376865, 0.8915326, 0.972549, 0, 1, 1,
1.008466, 0.0397181, 2.42994, 0.9803922, 0, 1, 1,
1.011873, -0.05332987, 0.9410427, 0.9843137, 0, 1, 1,
1.012223, 0.5496843, 1.364853, 0.9921569, 0, 1, 1,
1.015244, 0.04704967, 3.197727, 0.9960784, 0, 1, 1,
1.031495, 0.2882448, 0.4962147, 1, 0, 0.9960784, 1,
1.032585, -0.1348237, 0.1144037, 1, 0, 0.9882353, 1,
1.033345, 0.1940377, 2.099869, 1, 0, 0.9843137, 1,
1.041685, -0.9806464, 2.893231, 1, 0, 0.9764706, 1,
1.043002, 0.4224789, 0.2992588, 1, 0, 0.972549, 1,
1.053386, 0.6286041, 1.924544, 1, 0, 0.9647059, 1,
1.053695, -0.1191936, 2.445568, 1, 0, 0.9607843, 1,
1.056394, 1.833163, 1.499914, 1, 0, 0.9529412, 1,
1.059077, -0.8428088, 2.538357, 1, 0, 0.9490196, 1,
1.05967, -1.191542, 2.645008, 1, 0, 0.9411765, 1,
1.064889, 0.6889003, 2.215928, 1, 0, 0.9372549, 1,
1.064903, -0.3152203, 0.03996013, 1, 0, 0.9294118, 1,
1.069217, 0.1393992, 2.93519, 1, 0, 0.9254902, 1,
1.069318, -0.6003417, 1.187964, 1, 0, 0.9176471, 1,
1.074753, -0.8855886, 1.093428, 1, 0, 0.9137255, 1,
1.075302, -1.291038, 1.812103, 1, 0, 0.9058824, 1,
1.076994, -1.361794, 2.517731, 1, 0, 0.9019608, 1,
1.083599, 1.059956, -1.356076, 1, 0, 0.8941177, 1,
1.084087, 0.2429207, 0.8641679, 1, 0, 0.8862745, 1,
1.089505, -1.049083, 2.656895, 1, 0, 0.8823529, 1,
1.091959, -1.61464, 3.0366, 1, 0, 0.8745098, 1,
1.092911, -0.7495224, 3.324835, 1, 0, 0.8705882, 1,
1.093226, -2.019111, 2.487748, 1, 0, 0.8627451, 1,
1.09394, 1.716404, 0.8932735, 1, 0, 0.8588235, 1,
1.094438, 0.1080124, 1.004567, 1, 0, 0.8509804, 1,
1.099488, 0.7755521, 2.009842, 1, 0, 0.8470588, 1,
1.099902, 1.062681, 1.358319, 1, 0, 0.8392157, 1,
1.112796, -0.7497678, 1.650365, 1, 0, 0.8352941, 1,
1.116348, 0.2112121, 1.899766, 1, 0, 0.827451, 1,
1.123531, -0.2453246, 2.265215, 1, 0, 0.8235294, 1,
1.12523, 0.1052654, 0.5900748, 1, 0, 0.8156863, 1,
1.125659, 1.661102, 1.281412, 1, 0, 0.8117647, 1,
1.134329, 0.6819412, 0.3213683, 1, 0, 0.8039216, 1,
1.136848, 0.01624229, 2.587703, 1, 0, 0.7960784, 1,
1.141354, -0.2988732, 1.714725, 1, 0, 0.7921569, 1,
1.150618, 1.380787, 0.4550199, 1, 0, 0.7843137, 1,
1.155652, 2.032705, 2.480324, 1, 0, 0.7803922, 1,
1.157651, 0.9473243, 2.650192, 1, 0, 0.772549, 1,
1.165921, 0.5527407, 0.9626845, 1, 0, 0.7686275, 1,
1.166758, 0.8358306, 0.2233654, 1, 0, 0.7607843, 1,
1.168785, -0.04449511, 1.979451, 1, 0, 0.7568628, 1,
1.174666, -0.2698604, 1.788068, 1, 0, 0.7490196, 1,
1.176549, 0.1811144, 3.489372, 1, 0, 0.7450981, 1,
1.184096, 0.191692, 1.890716, 1, 0, 0.7372549, 1,
1.188269, 1.246618, 0.6195347, 1, 0, 0.7333333, 1,
1.189541, -1.973169, 5.300891, 1, 0, 0.7254902, 1,
1.192811, -1.097942, 0.5430031, 1, 0, 0.7215686, 1,
1.193003, 0.05969317, 1.497591, 1, 0, 0.7137255, 1,
1.194435, 2.020264, 1.069104, 1, 0, 0.7098039, 1,
1.199186, -0.4701307, 2.873103, 1, 0, 0.7019608, 1,
1.202227, 0.6965566, 2.609359, 1, 0, 0.6941177, 1,
1.204241, -1.666571, 1.762179, 1, 0, 0.6901961, 1,
1.20671, -0.06339435, 2.366731, 1, 0, 0.682353, 1,
1.212807, -0.5179647, 2.178894, 1, 0, 0.6784314, 1,
1.212826, 1.333775, 2.105014, 1, 0, 0.6705883, 1,
1.215822, 1.788199, -0.197576, 1, 0, 0.6666667, 1,
1.218166, -1.133075, 2.801732, 1, 0, 0.6588235, 1,
1.219074, -0.4146015, 1.747293, 1, 0, 0.654902, 1,
1.222186, -1.593443, 3.105691, 1, 0, 0.6470588, 1,
1.224547, 0.2082453, 1.779638, 1, 0, 0.6431373, 1,
1.228743, -1.436897, 3.426606, 1, 0, 0.6352941, 1,
1.232557, -1.398113, 2.046202, 1, 0, 0.6313726, 1,
1.235984, -0.0213045, -0.02310857, 1, 0, 0.6235294, 1,
1.24757, -1.23802, 1.72595, 1, 0, 0.6196079, 1,
1.249875, -2.005745, 3.205567, 1, 0, 0.6117647, 1,
1.267942, -0.9403499, 2.061171, 1, 0, 0.6078432, 1,
1.273152, -0.119884, 2.700732, 1, 0, 0.6, 1,
1.27625, -0.933056, 2.980237, 1, 0, 0.5921569, 1,
1.283824, -0.3456384, 3.325088, 1, 0, 0.5882353, 1,
1.296096, 2.616581, -0.05822188, 1, 0, 0.5803922, 1,
1.31176, -0.7698615, 2.052711, 1, 0, 0.5764706, 1,
1.320451, 1.246292, 1.192696, 1, 0, 0.5686275, 1,
1.33022, 2.344752, 0.2432142, 1, 0, 0.5647059, 1,
1.339903, -0.5150589, 1.64174, 1, 0, 0.5568628, 1,
1.346034, 1.213639, 2.280222, 1, 0, 0.5529412, 1,
1.349041, -0.5057877, 2.850728, 1, 0, 0.5450981, 1,
1.349485, -0.1316918, 1.357903, 1, 0, 0.5411765, 1,
1.351526, 0.5391875, 0.3885407, 1, 0, 0.5333334, 1,
1.352036, 1.487142, -0.7569939, 1, 0, 0.5294118, 1,
1.370323, 1.430781, -0.2172934, 1, 0, 0.5215687, 1,
1.378481, -0.3871887, 0.6555367, 1, 0, 0.5176471, 1,
1.379158, 0.9414086, 2.353371, 1, 0, 0.509804, 1,
1.383293, -0.1666608, 1.172881, 1, 0, 0.5058824, 1,
1.384809, 0.5133582, 1.372483, 1, 0, 0.4980392, 1,
1.393166, -0.7716641, 1.49979, 1, 0, 0.4901961, 1,
1.396054, 0.7522953, 2.573098, 1, 0, 0.4862745, 1,
1.404697, 0.7524626, -0.7374822, 1, 0, 0.4784314, 1,
1.405717, 0.5534374, 1.359851, 1, 0, 0.4745098, 1,
1.409053, 0.7154066, -0.3208771, 1, 0, 0.4666667, 1,
1.409292, 1.687445, -0.0526223, 1, 0, 0.4627451, 1,
1.409582, 0.2854085, 1.184678, 1, 0, 0.454902, 1,
1.419817, 0.8671547, 0.5095876, 1, 0, 0.4509804, 1,
1.422299, -0.3841691, 0.1798777, 1, 0, 0.4431373, 1,
1.425422, 0.01058915, 2.895581, 1, 0, 0.4392157, 1,
1.431306, -0.08428962, 2.947374, 1, 0, 0.4313726, 1,
1.431536, 0.8986353, 0.7318375, 1, 0, 0.427451, 1,
1.460768, -0.05904852, 1.908926, 1, 0, 0.4196078, 1,
1.468922, 0.3286105, -0.4614524, 1, 0, 0.4156863, 1,
1.478082, 0.4115674, 1.945375, 1, 0, 0.4078431, 1,
1.478377, -0.9907127, 1.996633, 1, 0, 0.4039216, 1,
1.480178, 0.4940205, 1.723879, 1, 0, 0.3960784, 1,
1.496746, 0.4946115, 0.2383412, 1, 0, 0.3882353, 1,
1.496867, 1.118131, 1.430065, 1, 0, 0.3843137, 1,
1.498191, -0.6375718, 1.466814, 1, 0, 0.3764706, 1,
1.504515, -0.1813463, 2.50585, 1, 0, 0.372549, 1,
1.509457, 0.156513, 2.243917, 1, 0, 0.3647059, 1,
1.521293, -0.1285135, 2.249935, 1, 0, 0.3607843, 1,
1.534369, 0.5166065, 3.15461, 1, 0, 0.3529412, 1,
1.581477, 0.6679539, 1.007884, 1, 0, 0.3490196, 1,
1.585444, -0.2032848, 0.2907012, 1, 0, 0.3411765, 1,
1.591316, -1.921998, 2.474711, 1, 0, 0.3372549, 1,
1.59815, 0.8802036, 1.101328, 1, 0, 0.3294118, 1,
1.60567, -1.727321, 2.511221, 1, 0, 0.3254902, 1,
1.619215, 0.5443159, -0.1059704, 1, 0, 0.3176471, 1,
1.631077, 1.996641, 1.773004, 1, 0, 0.3137255, 1,
1.644163, 0.234995, 1.093329, 1, 0, 0.3058824, 1,
1.646117, 1.82514, 1.09623, 1, 0, 0.2980392, 1,
1.671226, 0.5917944, 0.8347393, 1, 0, 0.2941177, 1,
1.680194, 0.7987227, 2.086568, 1, 0, 0.2862745, 1,
1.691397, -0.398836, 2.458672, 1, 0, 0.282353, 1,
1.697175, -1.515065, 1.396511, 1, 0, 0.2745098, 1,
1.699745, 0.7245789, 1.261518, 1, 0, 0.2705882, 1,
1.701502, 1.231024, 2.036255, 1, 0, 0.2627451, 1,
1.706243, -0.7522616, 0.8806782, 1, 0, 0.2588235, 1,
1.729229, -1.434188, 2.862097, 1, 0, 0.2509804, 1,
1.740123, -0.2162668, 1.710098, 1, 0, 0.2470588, 1,
1.743915, -1.260208, 2.22788, 1, 0, 0.2392157, 1,
1.790915, 0.7842204, 1.813097, 1, 0, 0.2352941, 1,
1.795395, 1.122224, -0.2053211, 1, 0, 0.227451, 1,
1.801563, -0.3822578, 1.252446, 1, 0, 0.2235294, 1,
1.845859, 0.7795628, 1.262042, 1, 0, 0.2156863, 1,
1.846428, 1.500929, 0.7026535, 1, 0, 0.2117647, 1,
1.849582, -0.5426679, 2.379501, 1, 0, 0.2039216, 1,
1.888452, 0.4166738, 1.134399, 1, 0, 0.1960784, 1,
1.893002, -0.5486648, 1.531597, 1, 0, 0.1921569, 1,
1.897625, -0.8604579, 1.120928, 1, 0, 0.1843137, 1,
1.900323, -0.661369, 1.692784, 1, 0, 0.1803922, 1,
1.910381, 0.3575477, 0.8779956, 1, 0, 0.172549, 1,
1.95643, 0.2777996, -0.8367021, 1, 0, 0.1686275, 1,
1.965726, -1.218299, 2.710037, 1, 0, 0.1607843, 1,
1.969755, 0.4008969, 2.316059, 1, 0, 0.1568628, 1,
2.013566, -0.4875589, 1.570156, 1, 0, 0.1490196, 1,
2.032332, 0.001657229, 1.113369, 1, 0, 0.145098, 1,
2.041119, 1.092398, 1.765523, 1, 0, 0.1372549, 1,
2.082715, -0.2144293, 0.4315498, 1, 0, 0.1333333, 1,
2.108439, 1.151861, 2.065682, 1, 0, 0.1254902, 1,
2.113936, 0.4652918, 1.998616, 1, 0, 0.1215686, 1,
2.115363, -2.691209, 2.040031, 1, 0, 0.1137255, 1,
2.123636, -0.4396469, -0.1623366, 1, 0, 0.1098039, 1,
2.149068, -0.5426364, 2.144018, 1, 0, 0.1019608, 1,
2.149603, -1.471381, 3.170379, 1, 0, 0.09411765, 1,
2.181664, 1.615759, 0.1045108, 1, 0, 0.09019608, 1,
2.202206, -0.7112753, 1.185514, 1, 0, 0.08235294, 1,
2.294559, -1.702345, 1.141994, 1, 0, 0.07843138, 1,
2.360664, -0.7878357, 1.588536, 1, 0, 0.07058824, 1,
2.462537, -1.000699, 1.12528, 1, 0, 0.06666667, 1,
2.46415, -0.8708084, 1.081439, 1, 0, 0.05882353, 1,
2.490141, 0.9397129, 0.2341595, 1, 0, 0.05490196, 1,
2.490608, 0.4582876, 1.692894, 1, 0, 0.04705882, 1,
2.540978, -0.6004503, 1.297402, 1, 0, 0.04313726, 1,
2.595904, 0.01924056, 2.628764, 1, 0, 0.03529412, 1,
2.779751, -0.1205138, 1.796659, 1, 0, 0.03137255, 1,
2.866589, -0.9700247, 2.557955, 1, 0, 0.02352941, 1,
2.934505, 0.8813461, 0.05122948, 1, 0, 0.01960784, 1,
3.002532, -0.07096858, 1.411193, 1, 0, 0.01176471, 1,
3.024367, 0.2468163, 0.8167484, 1, 0, 0.007843138, 1
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
0.02854645, -4.002313, -7.745888, 0, -0.5, 0.5, 0.5,
0.02854645, -4.002313, -7.745888, 1, -0.5, 0.5, 0.5,
0.02854645, -4.002313, -7.745888, 1, 1.5, 0.5, 0.5,
0.02854645, -4.002313, -7.745888, 0, 1.5, 0.5, 0.5
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
-3.982857, 0.1979833, -7.745888, 0, -0.5, 0.5, 0.5,
-3.982857, 0.1979833, -7.745888, 1, -0.5, 0.5, 0.5,
-3.982857, 0.1979833, -7.745888, 1, 1.5, 0.5, 0.5,
-3.982857, 0.1979833, -7.745888, 0, 1.5, 0.5, 0.5
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
-3.982857, -4.002313, -0.2770391, 0, -0.5, 0.5, 0.5,
-3.982857, -4.002313, -0.2770391, 1, -0.5, 0.5, 0.5,
-3.982857, -4.002313, -0.2770391, 1, 1.5, 0.5, 0.5,
-3.982857, -4.002313, -0.2770391, 0, 1.5, 0.5, 0.5
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
-2, -3.033014, -6.022307,
3, -3.033014, -6.022307,
-2, -3.033014, -6.022307,
-2, -3.194563, -6.309571,
-1, -3.033014, -6.022307,
-1, -3.194563, -6.309571,
0, -3.033014, -6.022307,
0, -3.194563, -6.309571,
1, -3.033014, -6.022307,
1, -3.194563, -6.309571,
2, -3.033014, -6.022307,
2, -3.194563, -6.309571,
3, -3.033014, -6.022307,
3, -3.194563, -6.309571
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
-2, -3.517663, -6.884098, 0, -0.5, 0.5, 0.5,
-2, -3.517663, -6.884098, 1, -0.5, 0.5, 0.5,
-2, -3.517663, -6.884098, 1, 1.5, 0.5, 0.5,
-2, -3.517663, -6.884098, 0, 1.5, 0.5, 0.5,
-1, -3.517663, -6.884098, 0, -0.5, 0.5, 0.5,
-1, -3.517663, -6.884098, 1, -0.5, 0.5, 0.5,
-1, -3.517663, -6.884098, 1, 1.5, 0.5, 0.5,
-1, -3.517663, -6.884098, 0, 1.5, 0.5, 0.5,
0, -3.517663, -6.884098, 0, -0.5, 0.5, 0.5,
0, -3.517663, -6.884098, 1, -0.5, 0.5, 0.5,
0, -3.517663, -6.884098, 1, 1.5, 0.5, 0.5,
0, -3.517663, -6.884098, 0, 1.5, 0.5, 0.5,
1, -3.517663, -6.884098, 0, -0.5, 0.5, 0.5,
1, -3.517663, -6.884098, 1, -0.5, 0.5, 0.5,
1, -3.517663, -6.884098, 1, 1.5, 0.5, 0.5,
1, -3.517663, -6.884098, 0, 1.5, 0.5, 0.5,
2, -3.517663, -6.884098, 0, -0.5, 0.5, 0.5,
2, -3.517663, -6.884098, 1, -0.5, 0.5, 0.5,
2, -3.517663, -6.884098, 1, 1.5, 0.5, 0.5,
2, -3.517663, -6.884098, 0, 1.5, 0.5, 0.5,
3, -3.517663, -6.884098, 0, -0.5, 0.5, 0.5,
3, -3.517663, -6.884098, 1, -0.5, 0.5, 0.5,
3, -3.517663, -6.884098, 1, 1.5, 0.5, 0.5,
3, -3.517663, -6.884098, 0, 1.5, 0.5, 0.5
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
-3.057149, -2, -6.022307,
-3.057149, 3, -6.022307,
-3.057149, -2, -6.022307,
-3.211434, -2, -6.309571,
-3.057149, -1, -6.022307,
-3.211434, -1, -6.309571,
-3.057149, 0, -6.022307,
-3.211434, 0, -6.309571,
-3.057149, 1, -6.022307,
-3.211434, 1, -6.309571,
-3.057149, 2, -6.022307,
-3.211434, 2, -6.309571,
-3.057149, 3, -6.022307,
-3.211434, 3, -6.309571
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
-3.520003, -2, -6.884098, 0, -0.5, 0.5, 0.5,
-3.520003, -2, -6.884098, 1, -0.5, 0.5, 0.5,
-3.520003, -2, -6.884098, 1, 1.5, 0.5, 0.5,
-3.520003, -2, -6.884098, 0, 1.5, 0.5, 0.5,
-3.520003, -1, -6.884098, 0, -0.5, 0.5, 0.5,
-3.520003, -1, -6.884098, 1, -0.5, 0.5, 0.5,
-3.520003, -1, -6.884098, 1, 1.5, 0.5, 0.5,
-3.520003, -1, -6.884098, 0, 1.5, 0.5, 0.5,
-3.520003, 0, -6.884098, 0, -0.5, 0.5, 0.5,
-3.520003, 0, -6.884098, 1, -0.5, 0.5, 0.5,
-3.520003, 0, -6.884098, 1, 1.5, 0.5, 0.5,
-3.520003, 0, -6.884098, 0, 1.5, 0.5, 0.5,
-3.520003, 1, -6.884098, 0, -0.5, 0.5, 0.5,
-3.520003, 1, -6.884098, 1, -0.5, 0.5, 0.5,
-3.520003, 1, -6.884098, 1, 1.5, 0.5, 0.5,
-3.520003, 1, -6.884098, 0, 1.5, 0.5, 0.5,
-3.520003, 2, -6.884098, 0, -0.5, 0.5, 0.5,
-3.520003, 2, -6.884098, 1, -0.5, 0.5, 0.5,
-3.520003, 2, -6.884098, 1, 1.5, 0.5, 0.5,
-3.520003, 2, -6.884098, 0, 1.5, 0.5, 0.5,
-3.520003, 3, -6.884098, 0, -0.5, 0.5, 0.5,
-3.520003, 3, -6.884098, 1, -0.5, 0.5, 0.5,
-3.520003, 3, -6.884098, 1, 1.5, 0.5, 0.5,
-3.520003, 3, -6.884098, 0, 1.5, 0.5, 0.5
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
-3.057149, -3.033014, -4,
-3.057149, -3.033014, 4,
-3.057149, -3.033014, -4,
-3.211434, -3.194563, -4,
-3.057149, -3.033014, -2,
-3.211434, -3.194563, -2,
-3.057149, -3.033014, 0,
-3.211434, -3.194563, 0,
-3.057149, -3.033014, 2,
-3.211434, -3.194563, 2,
-3.057149, -3.033014, 4,
-3.211434, -3.194563, 4
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
-3.520003, -3.517663, -4, 0, -0.5, 0.5, 0.5,
-3.520003, -3.517663, -4, 1, -0.5, 0.5, 0.5,
-3.520003, -3.517663, -4, 1, 1.5, 0.5, 0.5,
-3.520003, -3.517663, -4, 0, 1.5, 0.5, 0.5,
-3.520003, -3.517663, -2, 0, -0.5, 0.5, 0.5,
-3.520003, -3.517663, -2, 1, -0.5, 0.5, 0.5,
-3.520003, -3.517663, -2, 1, 1.5, 0.5, 0.5,
-3.520003, -3.517663, -2, 0, 1.5, 0.5, 0.5,
-3.520003, -3.517663, 0, 0, -0.5, 0.5, 0.5,
-3.520003, -3.517663, 0, 1, -0.5, 0.5, 0.5,
-3.520003, -3.517663, 0, 1, 1.5, 0.5, 0.5,
-3.520003, -3.517663, 0, 0, 1.5, 0.5, 0.5,
-3.520003, -3.517663, 2, 0, -0.5, 0.5, 0.5,
-3.520003, -3.517663, 2, 1, -0.5, 0.5, 0.5,
-3.520003, -3.517663, 2, 1, 1.5, 0.5, 0.5,
-3.520003, -3.517663, 2, 0, 1.5, 0.5, 0.5,
-3.520003, -3.517663, 4, 0, -0.5, 0.5, 0.5,
-3.520003, -3.517663, 4, 1, -0.5, 0.5, 0.5,
-3.520003, -3.517663, 4, 1, 1.5, 0.5, 0.5,
-3.520003, -3.517663, 4, 0, 1.5, 0.5, 0.5
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
-3.057149, -3.033014, -6.022307,
-3.057149, 3.42898, -6.022307,
-3.057149, -3.033014, 5.468229,
-3.057149, 3.42898, 5.468229,
-3.057149, -3.033014, -6.022307,
-3.057149, -3.033014, 5.468229,
-3.057149, 3.42898, -6.022307,
-3.057149, 3.42898, 5.468229,
-3.057149, -3.033014, -6.022307,
3.114242, -3.033014, -6.022307,
-3.057149, -3.033014, 5.468229,
3.114242, -3.033014, 5.468229,
-3.057149, 3.42898, -6.022307,
3.114242, 3.42898, -6.022307,
-3.057149, 3.42898, 5.468229,
3.114242, 3.42898, 5.468229,
3.114242, -3.033014, -6.022307,
3.114242, 3.42898, -6.022307,
3.114242, -3.033014, 5.468229,
3.114242, 3.42898, 5.468229,
3.114242, -3.033014, -6.022307,
3.114242, -3.033014, 5.468229,
3.114242, 3.42898, -6.022307,
3.114242, 3.42898, 5.468229
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
var radius = 7.772598;
var distance = 34.58117;
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
mvMatrix.translate( -0.02854645, -0.1979833, 0.2770391 );
mvMatrix.scale( 1.361749, 1.30051, 0.7313744 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.58117);
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
fenpropathrin<-read.table("fenpropathrin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-fenpropathrin$V2
```

```
## Error in eval(expr, envir, enclos): object 'fenpropathrin' not found
```

```r
y<-fenpropathrin$V3
```

```
## Error in eval(expr, envir, enclos): object 'fenpropathrin' not found
```

```r
z<-fenpropathrin$V4
```

```
## Error in eval(expr, envir, enclos): object 'fenpropathrin' not found
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
-2.967274, 0.4262461, -1.905811, 0, 0, 1, 1, 1,
-2.521012, -0.942706, -2.459918, 1, 0, 0, 1, 1,
-2.491509, -0.4429432, -2.658472, 1, 0, 0, 1, 1,
-2.429756, -1.540611, -2.812323, 1, 0, 0, 1, 1,
-2.424772, 1.069128, -1.250718, 1, 0, 0, 1, 1,
-2.364797, -1.917363, -0.8629241, 1, 0, 0, 1, 1,
-2.342476, -1.651442, -3.105637, 0, 0, 0, 1, 1,
-2.336426, -0.0002329341, -0.4376417, 0, 0, 0, 1, 1,
-2.320804, -1.637752, -3.871492, 0, 0, 0, 1, 1,
-2.311001, -1.462207, -1.658658, 0, 0, 0, 1, 1,
-2.310692, 0.3556509, -1.726783, 0, 0, 0, 1, 1,
-2.247492, -0.9718689, -1.967325, 0, 0, 0, 1, 1,
-2.122864, -0.327426, -2.48885, 0, 0, 0, 1, 1,
-2.113173, 2.170976, -0.7113612, 1, 1, 1, 1, 1,
-2.067291, 0.9749276, -1.963097, 1, 1, 1, 1, 1,
-2.05513, -0.4351281, -1.418978, 1, 1, 1, 1, 1,
-2.029935, 0.9671565, -1.786101, 1, 1, 1, 1, 1,
-2.023979, 0.2262585, -0.6408272, 1, 1, 1, 1, 1,
-2.017362, 0.5937335, -1.134755, 1, 1, 1, 1, 1,
-2.016803, -1.170355, -1.809388, 1, 1, 1, 1, 1,
-2.015046, -1.4472, -3.060559, 1, 1, 1, 1, 1,
-1.997443, -0.8975068, -4.82734, 1, 1, 1, 1, 1,
-1.967379, 0.3325156, -0.4090005, 1, 1, 1, 1, 1,
-1.957768, 0.9539633, -1.187721, 1, 1, 1, 1, 1,
-1.934078, 0.8213035, -2.4258, 1, 1, 1, 1, 1,
-1.931124, 1.002402, -0.8118214, 1, 1, 1, 1, 1,
-1.928706, 1.111755, -2.323567, 1, 1, 1, 1, 1,
-1.91652, -0.4085715, -0.1452701, 1, 1, 1, 1, 1,
-1.890052, -0.1896134, -0.879352, 0, 0, 1, 1, 1,
-1.886965, -0.4118424, -1.201552, 1, 0, 0, 1, 1,
-1.865698, 0.9756202, -1.431459, 1, 0, 0, 1, 1,
-1.827299, 2.054105, -2.577832, 1, 0, 0, 1, 1,
-1.826572, -0.01328526, -0.3483709, 1, 0, 0, 1, 1,
-1.811369, -0.5592765, -0.8839787, 1, 0, 0, 1, 1,
-1.810508, 0.6733479, -1.737553, 0, 0, 0, 1, 1,
-1.808626, -0.7998976, -0.9825494, 0, 0, 0, 1, 1,
-1.787905, 0.5767782, -2.486284, 0, 0, 0, 1, 1,
-1.783964, -0.6178994, -0.9666798, 0, 0, 0, 1, 1,
-1.77658, -0.3902516, -2.573307, 0, 0, 0, 1, 1,
-1.771796, -0.9370933, -1.545031, 0, 0, 0, 1, 1,
-1.769717, -0.7927797, -1.580556, 0, 0, 0, 1, 1,
-1.766251, -1.286538, -0.3906687, 1, 1, 1, 1, 1,
-1.765441, 1.296184, -1.172347, 1, 1, 1, 1, 1,
-1.745517, 2.124013, -0.4765788, 1, 1, 1, 1, 1,
-1.694382, 0.5826178, -1.687575, 1, 1, 1, 1, 1,
-1.688017, -0.2044246, -0.9577784, 1, 1, 1, 1, 1,
-1.68583, 0.7342734, -0.8626791, 1, 1, 1, 1, 1,
-1.670576, -0.8999492, -3.752805, 1, 1, 1, 1, 1,
-1.668239, -0.6650097, -1.437081, 1, 1, 1, 1, 1,
-1.660773, 0.1696195, -1.534375, 1, 1, 1, 1, 1,
-1.650867, -1.03085, -0.9960796, 1, 1, 1, 1, 1,
-1.647201, -0.362227, -1.003614, 1, 1, 1, 1, 1,
-1.646528, 0.8636164, -1.823487, 1, 1, 1, 1, 1,
-1.640238, 0.6768, -2.030567, 1, 1, 1, 1, 1,
-1.636678, -2.938907, -2.987546, 1, 1, 1, 1, 1,
-1.629325, -0.1148813, -2.978958, 1, 1, 1, 1, 1,
-1.614916, -0.6590155, -2.855566, 0, 0, 1, 1, 1,
-1.60778, 0.05271601, -0.4118782, 1, 0, 0, 1, 1,
-1.606972, 0.02507016, -1.287424, 1, 0, 0, 1, 1,
-1.60238, -0.4191773, 0.03574723, 1, 0, 0, 1, 1,
-1.601618, -1.393634, -2.331009, 1, 0, 0, 1, 1,
-1.589564, 0.6032837, -1.412778, 1, 0, 0, 1, 1,
-1.55839, 3.108891, 0.3768232, 0, 0, 0, 1, 1,
-1.557558, -0.9939191, -2.180807, 0, 0, 0, 1, 1,
-1.552945, 0.1432401, -2.524981, 0, 0, 0, 1, 1,
-1.513001, -0.4508675, -0.007111642, 0, 0, 0, 1, 1,
-1.499879, -0.7171662, -1.686813, 0, 0, 0, 1, 1,
-1.493611, 0.3176103, -0.6536537, 0, 0, 0, 1, 1,
-1.488549, 0.2658777, -0.9197933, 0, 0, 0, 1, 1,
-1.484674, -0.3300176, -1.924815, 1, 1, 1, 1, 1,
-1.483355, -0.4870101, -2.732954, 1, 1, 1, 1, 1,
-1.483216, 1.33224, -1.232522, 1, 1, 1, 1, 1,
-1.479556, 0.3693871, -1.375522, 1, 1, 1, 1, 1,
-1.476006, 1.479612, 0.01202756, 1, 1, 1, 1, 1,
-1.459768, 0.009541498, -4.3147, 1, 1, 1, 1, 1,
-1.456469, -0.5051296, -1.66286, 1, 1, 1, 1, 1,
-1.447348, 1.175136, -0.4704156, 1, 1, 1, 1, 1,
-1.4429, 0.9760439, -1.39079, 1, 1, 1, 1, 1,
-1.434042, -0.7384145, -0.821927, 1, 1, 1, 1, 1,
-1.432809, 0.2891892, -2.918947, 1, 1, 1, 1, 1,
-1.427763, 0.4798749, -0.6647668, 1, 1, 1, 1, 1,
-1.426246, 2.756739, -0.793512, 1, 1, 1, 1, 1,
-1.408945, -1.775366, -2.529218, 1, 1, 1, 1, 1,
-1.405257, -1.071895, -1.788679, 1, 1, 1, 1, 1,
-1.404857, 0.276693, 0.6658043, 0, 0, 1, 1, 1,
-1.395507, -2.409595, -2.523746, 1, 0, 0, 1, 1,
-1.394535, 0.2662946, -1.9659, 1, 0, 0, 1, 1,
-1.384494, 0.8300789, -1.512103, 1, 0, 0, 1, 1,
-1.360829, 0.8333036, -0.8488528, 1, 0, 0, 1, 1,
-1.340232, 0.6427662, -0.8267518, 1, 0, 0, 1, 1,
-1.337022, 1.844318, -1.818325, 0, 0, 0, 1, 1,
-1.332981, -0.3225223, 0.1970391, 0, 0, 0, 1, 1,
-1.318437, -0.8495838, -3.012233, 0, 0, 0, 1, 1,
-1.3168, -0.7150041, -0.6400881, 0, 0, 0, 1, 1,
-1.314537, 1.139406, -2.338566, 0, 0, 0, 1, 1,
-1.310233, -0.5901887, -1.867849, 0, 0, 0, 1, 1,
-1.309886, -0.6986765, -2.989844, 0, 0, 0, 1, 1,
-1.307976, 0.8910519, -2.631112, 1, 1, 1, 1, 1,
-1.297475, -0.4577025, -1.946407, 1, 1, 1, 1, 1,
-1.276431, -0.09388684, -1.871456, 1, 1, 1, 1, 1,
-1.275024, -0.5804172, -3.415455, 1, 1, 1, 1, 1,
-1.269853, 1.76604, -1.052918, 1, 1, 1, 1, 1,
-1.239517, -1.693707, -5.85497, 1, 1, 1, 1, 1,
-1.237893, -1.223728, -2.553149, 1, 1, 1, 1, 1,
-1.231333, 0.7560819, -0.2390656, 1, 1, 1, 1, 1,
-1.227473, 0.3746415, -0.1360003, 1, 1, 1, 1, 1,
-1.222474, -1.026446, -4.333752, 1, 1, 1, 1, 1,
-1.221545, 1.129746, -0.762059, 1, 1, 1, 1, 1,
-1.211636, -1.819812, -0.5386279, 1, 1, 1, 1, 1,
-1.210413, 0.9147549, -2.593183, 1, 1, 1, 1, 1,
-1.202923, -0.7669476, -1.406772, 1, 1, 1, 1, 1,
-1.192299, -1.531531, -2.10526, 1, 1, 1, 1, 1,
-1.174327, 2.336885, -0.07505159, 0, 0, 1, 1, 1,
-1.170579, 0.5111627, -2.037638, 1, 0, 0, 1, 1,
-1.167506, -0.7320736, -2.901214, 1, 0, 0, 1, 1,
-1.15008, 1.948382, -1.502186, 1, 0, 0, 1, 1,
-1.145954, 1.718203, -0.06887801, 1, 0, 0, 1, 1,
-1.141545, -0.2064239, -2.453469, 1, 0, 0, 1, 1,
-1.140532, -0.06352302, -0.6667784, 0, 0, 0, 1, 1,
-1.13306, 1.443242, -2.749288, 0, 0, 0, 1, 1,
-1.130046, -0.6257407, -3.382715, 0, 0, 0, 1, 1,
-1.125102, -0.4175764, -2.04756, 0, 0, 0, 1, 1,
-1.122229, 0.9870898, 1.175376, 0, 0, 0, 1, 1,
-1.121312, 1.139331, 0.4798445, 0, 0, 0, 1, 1,
-1.115939, 0.3013519, -2.780998, 0, 0, 0, 1, 1,
-1.10151, -0.1422183, -1.142848, 1, 1, 1, 1, 1,
-1.100585, 0.5467325, -1.417194, 1, 1, 1, 1, 1,
-1.092025, 0.3878663, 1.034832, 1, 1, 1, 1, 1,
-1.091468, 0.1713631, -1.854371, 1, 1, 1, 1, 1,
-1.083073, -0.9447568, -2.693112, 1, 1, 1, 1, 1,
-1.080288, 1.159356, -0.8816234, 1, 1, 1, 1, 1,
-1.072813, 1.301718, -0.6744122, 1, 1, 1, 1, 1,
-1.067794, 0.3556848, -2.173177, 1, 1, 1, 1, 1,
-1.05427, -0.8905202, -3.662168, 1, 1, 1, 1, 1,
-1.053804, -0.1951919, -0.1582185, 1, 1, 1, 1, 1,
-1.053792, -0.5004248, -2.326637, 1, 1, 1, 1, 1,
-1.051864, -1.798707, -4.270341, 1, 1, 1, 1, 1,
-1.050881, -0.05928665, -1.088914, 1, 1, 1, 1, 1,
-1.050389, -1.563414, -2.565949, 1, 1, 1, 1, 1,
-1.046416, -0.478238, -1.290334, 1, 1, 1, 1, 1,
-1.043483, 0.8043963, -1.808343, 0, 0, 1, 1, 1,
-1.042104, -0.404526, -1.79701, 1, 0, 0, 1, 1,
-1.039159, -0.6631427, -2.230355, 1, 0, 0, 1, 1,
-1.032082, -2.007888, -5.182456, 1, 0, 0, 1, 1,
-1.024301, 0.8990982, -0.3827397, 1, 0, 0, 1, 1,
-1.016656, 0.1454067, -0.1605302, 1, 0, 0, 1, 1,
-1.016529, -1.139012, -2.548871, 0, 0, 0, 1, 1,
-1.015409, 0.2911727, -0.3094648, 0, 0, 0, 1, 1,
-1.011586, -1.922783, -2.668881, 0, 0, 0, 1, 1,
-1.007365, 1.94743, -0.8387526, 0, 0, 0, 1, 1,
-0.9978737, -0.1467513, 0.6513656, 0, 0, 0, 1, 1,
-0.9967394, -0.5290475, -1.075972, 0, 0, 0, 1, 1,
-0.9962904, 1.094953, -0.8807349, 0, 0, 0, 1, 1,
-0.9869191, -0.4730704, -1.835155, 1, 1, 1, 1, 1,
-0.9854159, 0.5034994, -1.301915, 1, 1, 1, 1, 1,
-0.9825401, -0.3091283, -1.941339, 1, 1, 1, 1, 1,
-0.9633451, -1.60066, -0.4323363, 1, 1, 1, 1, 1,
-0.9626243, -1.051319, 0.664431, 1, 1, 1, 1, 1,
-0.9587147, 0.0967945, -0.6823655, 1, 1, 1, 1, 1,
-0.9518107, -2.051702, -1.447535, 1, 1, 1, 1, 1,
-0.9505744, -1.762338, -1.303728, 1, 1, 1, 1, 1,
-0.9472709, -2.103431, -2.635933, 1, 1, 1, 1, 1,
-0.9461707, 1.414873, -0.5050995, 1, 1, 1, 1, 1,
-0.9438364, -0.2727539, -3.260396, 1, 1, 1, 1, 1,
-0.9423226, 0.06397918, -0.9897319, 1, 1, 1, 1, 1,
-0.9389324, 0.05722758, 0.9055884, 1, 1, 1, 1, 1,
-0.9389016, 0.2942798, -0.9649392, 1, 1, 1, 1, 1,
-0.938496, -0.9203913, -1.670354, 1, 1, 1, 1, 1,
-0.9343902, -1.891413, -4.066803, 0, 0, 1, 1, 1,
-0.9254546, -0.3173291, -3.680678, 1, 0, 0, 1, 1,
-0.9232653, 1.007905, -1.119258, 1, 0, 0, 1, 1,
-0.9198214, -0.07046169, 0.501139, 1, 0, 0, 1, 1,
-0.917799, -0.7028142, -3.147147, 1, 0, 0, 1, 1,
-0.9162022, -0.6479851, -1.493051, 1, 0, 0, 1, 1,
-0.915084, -1.038963, -2.898798, 0, 0, 0, 1, 1,
-0.9131829, -0.2645089, -2.262981, 0, 0, 0, 1, 1,
-0.9124475, 1.078566, -1.522306, 0, 0, 0, 1, 1,
-0.9116099, 0.6652819, -3.259533, 0, 0, 0, 1, 1,
-0.9102284, 1.231233, -1.095309, 0, 0, 0, 1, 1,
-0.9018995, -0.2450761, -3.195476, 0, 0, 0, 1, 1,
-0.8957283, -2.129198, -2.938039, 0, 0, 0, 1, 1,
-0.8957015, -1.560048, -3.440606, 1, 1, 1, 1, 1,
-0.8939356, -0.6830801, -1.87594, 1, 1, 1, 1, 1,
-0.886574, 2.0071, -1.617633, 1, 1, 1, 1, 1,
-0.8791606, 0.7638058, -1.734535, 1, 1, 1, 1, 1,
-0.8715656, 0.02730248, -0.616929, 1, 1, 1, 1, 1,
-0.8715175, -0.5014862, -2.101802, 1, 1, 1, 1, 1,
-0.8696532, 0.794939, 1.070673, 1, 1, 1, 1, 1,
-0.8652267, 0.6023285, -1.044547, 1, 1, 1, 1, 1,
-0.8631836, 0.53, -1.033944, 1, 1, 1, 1, 1,
-0.8612276, 2.289214, -0.7864197, 1, 1, 1, 1, 1,
-0.8589157, -0.9094846, -2.155899, 1, 1, 1, 1, 1,
-0.8574283, 0.1548754, -1.725306, 1, 1, 1, 1, 1,
-0.8546162, -0.034683, -2.088094, 1, 1, 1, 1, 1,
-0.8425671, -1.763289, -3.592604, 1, 1, 1, 1, 1,
-0.8363777, 1.046351, -0.3828755, 1, 1, 1, 1, 1,
-0.8297406, 1.570615, 0.2431757, 0, 0, 1, 1, 1,
-0.824463, -0.5627552, -1.86544, 1, 0, 0, 1, 1,
-0.8238699, -0.2969691, -1.026987, 1, 0, 0, 1, 1,
-0.8156576, 0.313555, 0.07907975, 1, 0, 0, 1, 1,
-0.8152264, 0.3342245, -0.2943506, 1, 0, 0, 1, 1,
-0.8117125, 1.768347, 0.5255142, 1, 0, 0, 1, 1,
-0.8106072, -0.4273319, -1.468493, 0, 0, 0, 1, 1,
-0.808934, -0.1480089, -2.118152, 0, 0, 0, 1, 1,
-0.8044546, 0.8252069, -1.416831, 0, 0, 0, 1, 1,
-0.7975893, 0.8807235, -1.325486, 0, 0, 0, 1, 1,
-0.794811, -0.02637689, -2.786766, 0, 0, 0, 1, 1,
-0.7946894, 0.1148403, -1.661602, 0, 0, 0, 1, 1,
-0.7892403, -0.1937873, -1.509825, 0, 0, 0, 1, 1,
-0.7889428, -1.341449, -2.589746, 1, 1, 1, 1, 1,
-0.788875, 0.03162156, -3.180893, 1, 1, 1, 1, 1,
-0.786963, -2.71994, -3.099741, 1, 1, 1, 1, 1,
-0.7858298, -0.06570297, -1.234035, 1, 1, 1, 1, 1,
-0.7818092, -0.5207919, -1.394931, 1, 1, 1, 1, 1,
-0.7785482, 2.334484, -0.2963666, 1, 1, 1, 1, 1,
-0.7782753, 0.04006191, -0.290649, 1, 1, 1, 1, 1,
-0.7642215, 0.1426355, -1.240968, 1, 1, 1, 1, 1,
-0.762082, 0.8098224, -1.827664, 1, 1, 1, 1, 1,
-0.7597045, 0.3288386, -2.013524, 1, 1, 1, 1, 1,
-0.7578307, -2.170321, -3.478881, 1, 1, 1, 1, 1,
-0.752883, -0.9772435, -2.04217, 1, 1, 1, 1, 1,
-0.750711, 0.5896296, -1.066038, 1, 1, 1, 1, 1,
-0.7468253, -1.251762, -2.285892, 1, 1, 1, 1, 1,
-0.7450243, -0.4738615, -1.193139, 1, 1, 1, 1, 1,
-0.7426496, -0.004572998, -0.5331525, 0, 0, 1, 1, 1,
-0.7399449, 1.090507, -1.11964, 1, 0, 0, 1, 1,
-0.7356752, 1.086068, -0.348681, 1, 0, 0, 1, 1,
-0.735225, -2.48313, -1.264028, 1, 0, 0, 1, 1,
-0.7330308, -0.138333, -1.54243, 1, 0, 0, 1, 1,
-0.7323694, -0.3670494, -3.411164, 1, 0, 0, 1, 1,
-0.7298741, -0.8211472, -1.837891, 0, 0, 0, 1, 1,
-0.7272634, 0.2767017, -1.424012, 0, 0, 0, 1, 1,
-0.7249185, -0.7314045, -1.355831, 0, 0, 0, 1, 1,
-0.7139913, 0.5101099, -2.640424, 0, 0, 0, 1, 1,
-0.7117365, 1.785511, -1.931999, 0, 0, 0, 1, 1,
-0.709057, 0.1236031, -1.965566, 0, 0, 0, 1, 1,
-0.703473, 0.8811916, -1.107723, 0, 0, 0, 1, 1,
-0.7023896, 0.2291337, -0.9357457, 1, 1, 1, 1, 1,
-0.6979195, -0.5559339, -2.078762, 1, 1, 1, 1, 1,
-0.6885524, -0.4068245, -2.64327, 1, 1, 1, 1, 1,
-0.6807175, -0.3428582, -1.218474, 1, 1, 1, 1, 1,
-0.6777565, 0.4263279, -0.6473719, 1, 1, 1, 1, 1,
-0.6773733, 1.767206, -0.2537727, 1, 1, 1, 1, 1,
-0.6771136, 1.581847, 1.768973, 1, 1, 1, 1, 1,
-0.6764406, -1.262485, -4.230321, 1, 1, 1, 1, 1,
-0.6744467, 2.346126, -1.175697, 1, 1, 1, 1, 1,
-0.672804, -2.264102, -3.4071, 1, 1, 1, 1, 1,
-0.6678564, -0.1965721, -3.727096, 1, 1, 1, 1, 1,
-0.6648918, -1.708792, -0.9417344, 1, 1, 1, 1, 1,
-0.6578841, 0.8076564, -2.245435, 1, 1, 1, 1, 1,
-0.6488154, 0.3278701, 0.01848814, 1, 1, 1, 1, 1,
-0.6449839, 0.01493995, -1.621537, 1, 1, 1, 1, 1,
-0.6437045, 0.03794802, -3.254372, 0, 0, 1, 1, 1,
-0.6430621, 0.1820911, -3.027679, 1, 0, 0, 1, 1,
-0.6357265, 0.04980702, -0.1500428, 1, 0, 0, 1, 1,
-0.6350173, 0.337469, -2.870898, 1, 0, 0, 1, 1,
-0.6247913, -0.7285284, -4.044375, 1, 0, 0, 1, 1,
-0.6237291, -0.1234345, -0.9240198, 1, 0, 0, 1, 1,
-0.6237223, 1.270286, 0.2973571, 0, 0, 0, 1, 1,
-0.622542, 1.959546, -1.772424, 0, 0, 0, 1, 1,
-0.621807, -0.5599141, -3.051651, 0, 0, 0, 1, 1,
-0.619186, -0.976842, -1.427348, 0, 0, 0, 1, 1,
-0.6166285, -0.04747888, -1.609914, 0, 0, 0, 1, 1,
-0.6162449, -0.1428206, -1.465814, 0, 0, 0, 1, 1,
-0.6155775, 0.9545802, -1.10547, 0, 0, 0, 1, 1,
-0.614315, 0.2390351, -1.662918, 1, 1, 1, 1, 1,
-0.6137485, -1.242023, -1.45377, 1, 1, 1, 1, 1,
-0.6127198, -1.347691, -2.297231, 1, 1, 1, 1, 1,
-0.6085674, -0.7229066, -3.08323, 1, 1, 1, 1, 1,
-0.6047027, 1.355973, -1.302155, 1, 1, 1, 1, 1,
-0.6025084, 0.1198996, -0.2064401, 1, 1, 1, 1, 1,
-0.6001673, 0.8626657, -0.4712219, 1, 1, 1, 1, 1,
-0.5952516, 1.163197, 1.248653, 1, 1, 1, 1, 1,
-0.5950512, -0.03080079, -4.261488, 1, 1, 1, 1, 1,
-0.5841764, -0.7315664, -1.243132, 1, 1, 1, 1, 1,
-0.5835366, 1.210494, -0.1544552, 1, 1, 1, 1, 1,
-0.5802953, 1.149175, -0.4193647, 1, 1, 1, 1, 1,
-0.5741701, -0.3556152, -3.061532, 1, 1, 1, 1, 1,
-0.5736249, 1.079021, -0.7734038, 1, 1, 1, 1, 1,
-0.5711933, 0.1569068, 0.9538279, 1, 1, 1, 1, 1,
-0.5693077, 0.06359264, -2.100647, 0, 0, 1, 1, 1,
-0.5626687, -0.1101225, -2.702649, 1, 0, 0, 1, 1,
-0.5559599, -0.2969248, -3.042014, 1, 0, 0, 1, 1,
-0.5530428, 0.8138539, -0.3408079, 1, 0, 0, 1, 1,
-0.5513133, -1.003641, -3.598377, 1, 0, 0, 1, 1,
-0.5454164, 0.9740015, -2.567015, 1, 0, 0, 1, 1,
-0.5452316, -0.3415593, -1.563739, 0, 0, 0, 1, 1,
-0.5450085, -0.3987621, -3.140673, 0, 0, 0, 1, 1,
-0.5436814, 0.3092626, -0.2531864, 0, 0, 0, 1, 1,
-0.5414282, -0.6315348, -3.665216, 0, 0, 0, 1, 1,
-0.5362381, 0.8253102, -2.32015, 0, 0, 0, 1, 1,
-0.5356502, -1.410417, -2.708115, 0, 0, 0, 1, 1,
-0.5348012, 0.5370011, -1.806261, 0, 0, 0, 1, 1,
-0.5321534, -1.683137, -4.429972, 1, 1, 1, 1, 1,
-0.5312205, -0.6749756, -1.671486, 1, 1, 1, 1, 1,
-0.5299731, 0.6075872, -0.0474692, 1, 1, 1, 1, 1,
-0.5235378, 0.6176543, -2.048954, 1, 1, 1, 1, 1,
-0.5229857, -0.4518203, -1.52187, 1, 1, 1, 1, 1,
-0.5209321, 1.069166, -1.585555, 1, 1, 1, 1, 1,
-0.5190769, -1.228984, -2.872647, 1, 1, 1, 1, 1,
-0.5131891, -0.205352, -2.739191, 1, 1, 1, 1, 1,
-0.4997399, -1.097786, -1.841727, 1, 1, 1, 1, 1,
-0.4962633, -0.5123582, -1.897189, 1, 1, 1, 1, 1,
-0.4939748, 0.3757437, -1.146641, 1, 1, 1, 1, 1,
-0.4903011, 0.4637629, 0.6801603, 1, 1, 1, 1, 1,
-0.4866768, -0.9231913, -3.417882, 1, 1, 1, 1, 1,
-0.4856901, -0.2504657, -2.301029, 1, 1, 1, 1, 1,
-0.4845108, 0.7900462, 1.343513, 1, 1, 1, 1, 1,
-0.4822074, 1.158416, -1.469306, 0, 0, 1, 1, 1,
-0.4803646, 0.9449708, -0.5687205, 1, 0, 0, 1, 1,
-0.4770264, -1.454337, -2.329186, 1, 0, 0, 1, 1,
-0.4766206, 0.5189459, 0.1508821, 1, 0, 0, 1, 1,
-0.4743726, -1.061765, -2.93075, 1, 0, 0, 1, 1,
-0.4735466, -0.08199896, -2.301252, 1, 0, 0, 1, 1,
-0.47144, -0.01656043, 0.2672319, 0, 0, 0, 1, 1,
-0.4698287, -0.9345464, -2.403907, 0, 0, 0, 1, 1,
-0.4684078, 0.1783309, -0.5584466, 0, 0, 0, 1, 1,
-0.4661271, 0.8520647, 0.04968505, 0, 0, 0, 1, 1,
-0.4623935, 0.6522617, -2.121424, 0, 0, 0, 1, 1,
-0.4608042, -1.370464, -2.211475, 0, 0, 0, 1, 1,
-0.4600938, -1.240019, -4.092121, 0, 0, 0, 1, 1,
-0.4582849, -0.5940642, -1.152771, 1, 1, 1, 1, 1,
-0.4578366, -1.051235, -2.918724, 1, 1, 1, 1, 1,
-0.4539548, 0.2303482, -1.320889, 1, 1, 1, 1, 1,
-0.4519274, -0.6575475, -2.420957, 1, 1, 1, 1, 1,
-0.4414005, -1.518326, -0.8637422, 1, 1, 1, 1, 1,
-0.4410928, 0.3555607, 0.7976082, 1, 1, 1, 1, 1,
-0.4388447, -0.4799515, -1.141713, 1, 1, 1, 1, 1,
-0.4363898, -0.4730642, -0.9548761, 1, 1, 1, 1, 1,
-0.4361311, -0.03643193, -1.17241, 1, 1, 1, 1, 1,
-0.4347689, 0.8592274, 0.1246822, 1, 1, 1, 1, 1,
-0.4317234, -0.6053172, -2.968774, 1, 1, 1, 1, 1,
-0.4274641, 1.994764, 0.1595421, 1, 1, 1, 1, 1,
-0.4229324, -0.6504184, -3.887437, 1, 1, 1, 1, 1,
-0.4198778, -0.3263947, -2.240677, 1, 1, 1, 1, 1,
-0.4188435, 0.6173466, -0.7410768, 1, 1, 1, 1, 1,
-0.413376, 0.8841397, 0.5036759, 0, 0, 1, 1, 1,
-0.4106751, 0.8608207, -2.250044, 1, 0, 0, 1, 1,
-0.4094006, 0.6288828, 1.08112, 1, 0, 0, 1, 1,
-0.409367, -2.302946, -1.885996, 1, 0, 0, 1, 1,
-0.408261, 0.416486, -1.0259, 1, 0, 0, 1, 1,
-0.4081005, -0.01554162, -2.801105, 1, 0, 0, 1, 1,
-0.405215, 0.1671865, -1.888177, 0, 0, 0, 1, 1,
-0.4027915, 0.7414768, -0.2785371, 0, 0, 0, 1, 1,
-0.3984043, 0.2733363, 0.1860292, 0, 0, 0, 1, 1,
-0.394961, 0.6473632, 0.9929218, 0, 0, 0, 1, 1,
-0.3935943, -1.351793, -1.618919, 0, 0, 0, 1, 1,
-0.3765591, -0.06662833, -2.39607, 0, 0, 0, 1, 1,
-0.3751674, 0.1179085, -0.7736749, 0, 0, 0, 1, 1,
-0.3733833, 0.1660491, 2.287446, 1, 1, 1, 1, 1,
-0.3660483, -0.5731821, -2.884265, 1, 1, 1, 1, 1,
-0.3660225, -0.2593128, -2.630525, 1, 1, 1, 1, 1,
-0.3609784, -1.098626, -2.542195, 1, 1, 1, 1, 1,
-0.3574325, 0.3577761, 0.476706, 1, 1, 1, 1, 1,
-0.3566701, -0.0545594, -2.242562, 1, 1, 1, 1, 1,
-0.3565747, -0.9368933, -1.270962, 1, 1, 1, 1, 1,
-0.3561259, -0.6088458, -5.596103, 1, 1, 1, 1, 1,
-0.3552442, -0.8817413, -4.013608, 1, 1, 1, 1, 1,
-0.3506507, 0.3169087, 0.8453378, 1, 1, 1, 1, 1,
-0.3496274, -0.7591194, -2.877888, 1, 1, 1, 1, 1,
-0.346826, -0.4323886, -3.665471, 1, 1, 1, 1, 1,
-0.3460232, -0.7347816, -5.740655, 1, 1, 1, 1, 1,
-0.3457809, -0.4311626, -2.282914, 1, 1, 1, 1, 1,
-0.3444105, 0.00923581, -3.281522, 1, 1, 1, 1, 1,
-0.3435993, -0.5872982, -2.455422, 0, 0, 1, 1, 1,
-0.337658, 0.5725627, 1.337758, 1, 0, 0, 1, 1,
-0.3294997, -0.2650428, -2.931617, 1, 0, 0, 1, 1,
-0.3286747, 0.5758452, 0.1726948, 1, 0, 0, 1, 1,
-0.3264766, -1.390603, -3.542567, 1, 0, 0, 1, 1,
-0.3233048, 0.2199828, -0.1890629, 1, 0, 0, 1, 1,
-0.3230488, -0.2794549, -1.35001, 0, 0, 0, 1, 1,
-0.322661, 0.2494096, 0.9993253, 0, 0, 0, 1, 1,
-0.3218383, -0.37198, -0.5507268, 0, 0, 0, 1, 1,
-0.3216405, 0.4049364, -0.1367635, 0, 0, 0, 1, 1,
-0.3196557, -0.9523601, -4.040107, 0, 0, 0, 1, 1,
-0.3171894, 1.887036, -0.7427609, 0, 0, 0, 1, 1,
-0.316521, 0.6814128, -1.222125, 0, 0, 0, 1, 1,
-0.3145621, 0.4826873, -0.07061605, 1, 1, 1, 1, 1,
-0.3131555, 0.7178203, -0.254267, 1, 1, 1, 1, 1,
-0.3130302, -0.9798121, -1.890441, 1, 1, 1, 1, 1,
-0.3128457, 1.44724, 0.5901831, 1, 1, 1, 1, 1,
-0.310407, -0.007125821, -0.9595965, 1, 1, 1, 1, 1,
-0.3034148, -0.1755038, -2.190371, 1, 1, 1, 1, 1,
-0.3033153, -0.6707895, -2.459087, 1, 1, 1, 1, 1,
-0.3023975, -0.7406699, -2.044565, 1, 1, 1, 1, 1,
-0.3016805, -1.176919, -0.9868268, 1, 1, 1, 1, 1,
-0.3004015, -0.2312426, -1.00881, 1, 1, 1, 1, 1,
-0.2981918, -0.3966792, -0.8200308, 1, 1, 1, 1, 1,
-0.297499, 1.004075, -1.752016, 1, 1, 1, 1, 1,
-0.2925731, -0.01626737, -2.075119, 1, 1, 1, 1, 1,
-0.2922163, 0.6775365, 0.1876431, 1, 1, 1, 1, 1,
-0.2909727, 0.9625452, -2.172465, 1, 1, 1, 1, 1,
-0.2893775, -0.009961056, -1.326973, 0, 0, 1, 1, 1,
-0.2858774, 0.6883197, -1.889849, 1, 0, 0, 1, 1,
-0.2851055, 1.274442, 0.2466219, 1, 0, 0, 1, 1,
-0.2812559, -1.736712, -3.554447, 1, 0, 0, 1, 1,
-0.2776119, 0.7448061, 0.02228653, 1, 0, 0, 1, 1,
-0.2773676, 0.1251631, -2.185715, 1, 0, 0, 1, 1,
-0.27603, 0.2735153, -3.443155, 0, 0, 0, 1, 1,
-0.2744925, 1.352031, 0.6344688, 0, 0, 0, 1, 1,
-0.2737759, -1.936562, -1.285197, 0, 0, 0, 1, 1,
-0.2714508, 0.762119, -1.78766, 0, 0, 0, 1, 1,
-0.2688084, 1.559044, -0.09250256, 0, 0, 0, 1, 1,
-0.2671721, 1.031612, -1.772599, 0, 0, 0, 1, 1,
-0.2640911, 0.6206068, -0.3250321, 0, 0, 0, 1, 1,
-0.2583582, 0.6828969, -0.4995161, 1, 1, 1, 1, 1,
-0.2512487, -0.8794264, -2.528478, 1, 1, 1, 1, 1,
-0.2512404, -2.852215, -1.412637, 1, 1, 1, 1, 1,
-0.2504654, 0.255656, -2.076787, 1, 1, 1, 1, 1,
-0.2498582, 2.330825, 0.4263165, 1, 1, 1, 1, 1,
-0.2492498, 1.731953, -1.780811, 1, 1, 1, 1, 1,
-0.2480189, -0.03972489, -3.839734, 1, 1, 1, 1, 1,
-0.2438742, 0.01157231, -2.451826, 1, 1, 1, 1, 1,
-0.2385768, -0.4341857, -3.58397, 1, 1, 1, 1, 1,
-0.2343685, -0.5832893, -3.318575, 1, 1, 1, 1, 1,
-0.2311845, 0.7378784, 0.8342519, 1, 1, 1, 1, 1,
-0.2256279, -1.550008, -2.99742, 1, 1, 1, 1, 1,
-0.2233381, 0.03180685, -1.975983, 1, 1, 1, 1, 1,
-0.2230741, -0.2887975, -2.952323, 1, 1, 1, 1, 1,
-0.211877, 0.7637116, -0.3042772, 1, 1, 1, 1, 1,
-0.2116367, -0.6646424, -1.475116, 0, 0, 1, 1, 1,
-0.2089342, -0.0285656, -1.034653, 1, 0, 0, 1, 1,
-0.2066614, -0.2809484, -1.315327, 1, 0, 0, 1, 1,
-0.2062205, -0.627929, -2.52151, 1, 0, 0, 1, 1,
-0.2050766, -2.105935, -1.762473, 1, 0, 0, 1, 1,
-0.2018222, -1.36209, -1.988756, 1, 0, 0, 1, 1,
-0.1995228, -0.690357, -1.238264, 0, 0, 0, 1, 1,
-0.1965498, -0.4237918, -2.706562, 0, 0, 0, 1, 1,
-0.1965331, -0.5407254, -2.111372, 0, 0, 0, 1, 1,
-0.1965086, -0.04381561, -2.094777, 0, 0, 0, 1, 1,
-0.1962194, -0.879467, -3.461367, 0, 0, 0, 1, 1,
-0.1921365, -1.579807, -1.958338, 0, 0, 0, 1, 1,
-0.1870337, 0.9198532, -0.8654012, 0, 0, 0, 1, 1,
-0.1867631, 0.1137283, -1.598563, 1, 1, 1, 1, 1,
-0.1850895, 0.7982574, 1.854876, 1, 1, 1, 1, 1,
-0.182711, -1.249699, -3.971248, 1, 1, 1, 1, 1,
-0.1700929, 0.6372647, 0.1340208, 1, 1, 1, 1, 1,
-0.164465, 0.8878291, -0.3707015, 1, 1, 1, 1, 1,
-0.1632739, 0.6272988, 0.5327978, 1, 1, 1, 1, 1,
-0.1615731, -0.3107834, -4.161764, 1, 1, 1, 1, 1,
-0.1555739, -0.8501465, -3.406598, 1, 1, 1, 1, 1,
-0.155149, 0.4943005, 0.5487189, 1, 1, 1, 1, 1,
-0.1529944, 0.3141146, -0.6927148, 1, 1, 1, 1, 1,
-0.1417458, 0.4775369, 0.117276, 1, 1, 1, 1, 1,
-0.1414867, 1.180153, 0.8623012, 1, 1, 1, 1, 1,
-0.1374634, -0.6486855, -4.384786, 1, 1, 1, 1, 1,
-0.1360241, 0.2987303, -0.2676097, 1, 1, 1, 1, 1,
-0.1344858, 0.8192757, 0.0245232, 1, 1, 1, 1, 1,
-0.1292904, 0.8730583, 1.000505, 0, 0, 1, 1, 1,
-0.1277137, 0.3319878, -0.7350585, 1, 0, 0, 1, 1,
-0.1251067, 0.2308582, -3.008846, 1, 0, 0, 1, 1,
-0.1224859, 0.7993575, 0.09005423, 1, 0, 0, 1, 1,
-0.1183186, -0.03361667, -1.031227, 1, 0, 0, 1, 1,
-0.1168028, 0.2009839, -1.691886, 1, 0, 0, 1, 1,
-0.1122703, -0.8998508, -3.75295, 0, 0, 0, 1, 1,
-0.1119251, 0.3708414, 0.7568007, 0, 0, 0, 1, 1,
-0.1056642, -1.766652, -2.582493, 0, 0, 0, 1, 1,
-0.1051527, 0.3011501, -1.738451, 0, 0, 0, 1, 1,
-0.1045565, -0.8294101, -3.608259, 0, 0, 0, 1, 1,
-0.1029411, -0.3271961, -3.008243, 0, 0, 0, 1, 1,
-0.1026694, 0.37714, -0.3869885, 0, 0, 0, 1, 1,
-0.1014862, 1.239194, -0.7529044, 1, 1, 1, 1, 1,
-0.09847362, 1.960009, -0.2996531, 1, 1, 1, 1, 1,
-0.09534369, -0.9492028, -4.434231, 1, 1, 1, 1, 1,
-0.09397407, 0.3888888, -0.4731285, 1, 1, 1, 1, 1,
-0.09252891, -0.967654, -2.571795, 1, 1, 1, 1, 1,
-0.09194628, -0.1024034, -1.886797, 1, 1, 1, 1, 1,
-0.08882362, 0.01684117, -0.4374005, 1, 1, 1, 1, 1,
-0.08660216, -1.29194, -5.232535, 1, 1, 1, 1, 1,
-0.08546335, 1.315242, 1.011853, 1, 1, 1, 1, 1,
-0.08354501, -0.3304743, -3.186656, 1, 1, 1, 1, 1,
-0.08295388, -0.2484566, -4.301754, 1, 1, 1, 1, 1,
-0.07444054, -0.4340044, -4.743287, 1, 1, 1, 1, 1,
-0.07323699, -0.1723989, -4.339952, 1, 1, 1, 1, 1,
-0.07317351, -1.433181, -4.299679, 1, 1, 1, 1, 1,
-0.06763893, -1.045829, -3.73178, 1, 1, 1, 1, 1,
-0.0675236, 1.523772, -0.3346123, 0, 0, 1, 1, 1,
-0.06609715, 1.685128, -0.9622919, 1, 0, 0, 1, 1,
-0.06452435, -0.1181262, -3.822662, 1, 0, 0, 1, 1,
-0.06388469, -1.018996, -2.733719, 1, 0, 0, 1, 1,
-0.05787274, 0.1472811, -1.587319, 1, 0, 0, 1, 1,
-0.05746829, -0.1092011, -2.657805, 1, 0, 0, 1, 1,
-0.04954308, 0.6968356, -0.2317362, 0, 0, 0, 1, 1,
-0.04831965, 0.706448, 1.326361, 0, 0, 0, 1, 1,
-0.04712894, -0.5836675, -4.777643, 0, 0, 0, 1, 1,
-0.0335191, 0.7574955, -1.325305, 0, 0, 0, 1, 1,
-0.02195796, -0.7882, -3.298177, 0, 0, 0, 1, 1,
-0.01787895, -0.8224097, -3.228876, 0, 0, 0, 1, 1,
-0.01342321, -1.244693, -2.899985, 0, 0, 0, 1, 1,
-0.007162736, 0.9305153, 0.9502664, 1, 1, 1, 1, 1,
0.0001506811, 0.1593492, 0.4776042, 1, 1, 1, 1, 1,
0.001194621, -1.509592, 3.40043, 1, 1, 1, 1, 1,
0.001920953, -1.032462, 2.655751, 1, 1, 1, 1, 1,
0.004667402, 1.989725, -0.7276749, 1, 1, 1, 1, 1,
0.006785928, 1.203711, 0.01922501, 1, 1, 1, 1, 1,
0.01423369, 0.1703316, -1.673434, 1, 1, 1, 1, 1,
0.02272717, 0.972514, 0.6150482, 1, 1, 1, 1, 1,
0.02656068, -0.4081567, 3.372162, 1, 1, 1, 1, 1,
0.02822118, -1.185397, 3.417038, 1, 1, 1, 1, 1,
0.02886121, -0.369641, 2.727001, 1, 1, 1, 1, 1,
0.03122204, -0.5471799, 3.000815, 1, 1, 1, 1, 1,
0.03271786, 0.4832648, 0.3159725, 1, 1, 1, 1, 1,
0.03372542, -0.7886277, 2.870803, 1, 1, 1, 1, 1,
0.04143716, -1.584223, 2.980179, 1, 1, 1, 1, 1,
0.04302634, -0.5926912, 0.9857897, 0, 0, 1, 1, 1,
0.04868464, 1.201823, 0.469649, 1, 0, 0, 1, 1,
0.0490812, 0.881769, -0.6781481, 1, 0, 0, 1, 1,
0.05092221, -0.7096492, 4.780374, 1, 0, 0, 1, 1,
0.05097147, -2.303577, 3.745859, 1, 0, 0, 1, 1,
0.05517348, -1.100483, 2.757838, 1, 0, 0, 1, 1,
0.06006002, -1.38137, 4.355431, 0, 0, 0, 1, 1,
0.06442893, -1.217452, 1.599662, 0, 0, 0, 1, 1,
0.06692199, -0.5336877, 1.231106, 0, 0, 0, 1, 1,
0.07084049, 0.1045896, -1.706783, 0, 0, 0, 1, 1,
0.07102836, 1.902022, 0.4587572, 0, 0, 0, 1, 1,
0.07976647, 0.07481994, 1.593621, 0, 0, 0, 1, 1,
0.0838047, -1.874002, 3.229518, 0, 0, 0, 1, 1,
0.08686043, 2.857873, 1.576235, 1, 1, 1, 1, 1,
0.0887196, -0.3992841, 3.30236, 1, 1, 1, 1, 1,
0.09293421, 0.2229331, -0.294986, 1, 1, 1, 1, 1,
0.09829608, 1.876069, 0.2504901, 1, 1, 1, 1, 1,
0.09873436, -0.02145175, 1.449493, 1, 1, 1, 1, 1,
0.09896949, -0.5606307, 4.173139, 1, 1, 1, 1, 1,
0.09960588, -0.5932037, 4.470008, 1, 1, 1, 1, 1,
0.104415, -0.3360594, 3.603829, 1, 1, 1, 1, 1,
0.1088264, 0.2311701, 0.5310616, 1, 1, 1, 1, 1,
0.1152442, -0.828313, 2.269138, 1, 1, 1, 1, 1,
0.1156492, -1.970569, 4.351963, 1, 1, 1, 1, 1,
0.1164412, 1.244296, -0.3414295, 1, 1, 1, 1, 1,
0.1243702, 1.326597, 1.11868, 1, 1, 1, 1, 1,
0.1307352, 0.8187776, 0.4050381, 1, 1, 1, 1, 1,
0.1316081, 0.4860027, -0.2355182, 1, 1, 1, 1, 1,
0.1343001, -0.7648227, 2.882628, 0, 0, 1, 1, 1,
0.1368344, 1.467024, 0.1732917, 1, 0, 0, 1, 1,
0.1372934, -0.3350244, 2.827839, 1, 0, 0, 1, 1,
0.1377799, 1.940228, -2.750191, 1, 0, 0, 1, 1,
0.1434684, 1.833254, 0.2981529, 1, 0, 0, 1, 1,
0.1435713, -1.103603, 2.594808, 1, 0, 0, 1, 1,
0.1465643, -0.3840974, 1.818937, 0, 0, 0, 1, 1,
0.1466244, -2.593626, 3.349569, 0, 0, 0, 1, 1,
0.1544722, -1.274638, 2.695116, 0, 0, 0, 1, 1,
0.1596326, 0.6522516, -0.6266069, 0, 0, 0, 1, 1,
0.1624911, 0.6940028, 2.938994, 0, 0, 0, 1, 1,
0.162642, -1.456699, 3.836639, 0, 0, 0, 1, 1,
0.1700237, -0.4128427, 3.338655, 0, 0, 0, 1, 1,
0.1714884, 0.8699807, 1.244876, 1, 1, 1, 1, 1,
0.1762404, -2.644311, 2.993141, 1, 1, 1, 1, 1,
0.1767304, 2.153387, 0.9865944, 1, 1, 1, 1, 1,
0.1784609, 1.428739, -0.2267861, 1, 1, 1, 1, 1,
0.1806431, -0.2958249, 3.32403, 1, 1, 1, 1, 1,
0.1850034, -0.2827326, 1.082585, 1, 1, 1, 1, 1,
0.1853531, -0.5163338, 0.2409736, 1, 1, 1, 1, 1,
0.1862968, -0.4690049, 0.9506395, 1, 1, 1, 1, 1,
0.1894008, 1.10098, 0.6862131, 1, 1, 1, 1, 1,
0.1971855, -0.7389175, 1.695008, 1, 1, 1, 1, 1,
0.1982139, -0.9047776, 2.027604, 1, 1, 1, 1, 1,
0.1982495, 1.510799, -0.9030808, 1, 1, 1, 1, 1,
0.2093803, 0.8913966, -0.3455017, 1, 1, 1, 1, 1,
0.2100158, 0.7573334, -1.234976, 1, 1, 1, 1, 1,
0.2118705, 0.1802841, -0.2396398, 1, 1, 1, 1, 1,
0.2127916, 0.8557131, 1.085373, 0, 0, 1, 1, 1,
0.2137337, -1.435876, 4.562783, 1, 0, 0, 1, 1,
0.2156178, 0.8789951, 0.5480695, 1, 0, 0, 1, 1,
0.2183444, 0.8020333, 0.03100153, 1, 0, 0, 1, 1,
0.2209917, 1.30197, -0.1567812, 1, 0, 0, 1, 1,
0.2217903, -1.804874, 3.006391, 1, 0, 0, 1, 1,
0.2229419, -1.380878, 3.728071, 0, 0, 0, 1, 1,
0.2280959, 0.184732, -0.9399955, 0, 0, 0, 1, 1,
0.2282083, 0.06644597, 3.092798, 0, 0, 0, 1, 1,
0.2295708, -0.8315811, 1.961661, 0, 0, 0, 1, 1,
0.2316856, -1.789804, 3.658275, 0, 0, 0, 1, 1,
0.232702, -2.163604, 2.673556, 0, 0, 0, 1, 1,
0.2343491, -0.3017311, 3.762201, 0, 0, 0, 1, 1,
0.2359641, 0.1718084, 1.569025, 1, 1, 1, 1, 1,
0.2362712, 0.6288593, -2.893851, 1, 1, 1, 1, 1,
0.2380513, -1.733322, 2.083733, 1, 1, 1, 1, 1,
0.2408051, 0.8651234, 0.3174138, 1, 1, 1, 1, 1,
0.2449353, -0.8542489, 3.895671, 1, 1, 1, 1, 1,
0.2466227, -1.956532, 3.145844, 1, 1, 1, 1, 1,
0.2495946, -0.8113878, 0.9548197, 1, 1, 1, 1, 1,
0.2508985, 0.5383784, 0.4610283, 1, 1, 1, 1, 1,
0.253453, 2.46131, -0.06014396, 1, 1, 1, 1, 1,
0.2535023, 0.04707008, 1.018736, 1, 1, 1, 1, 1,
0.256224, 0.5383168, 0.158517, 1, 1, 1, 1, 1,
0.2582701, -0.7610391, 1.878193, 1, 1, 1, 1, 1,
0.2609259, 0.6904178, 2.05243, 1, 1, 1, 1, 1,
0.264172, -0.2128487, 1.555121, 1, 1, 1, 1, 1,
0.2655271, -1.639958, 0.3223146, 1, 1, 1, 1, 1,
0.2668548, -0.3329204, 1.1199, 0, 0, 1, 1, 1,
0.2724785, 0.57317, -1.507693, 1, 0, 0, 1, 1,
0.2744135, -0.2618691, 2.516434, 1, 0, 0, 1, 1,
0.275332, 1.637411, -0.1784778, 1, 0, 0, 1, 1,
0.2794397, 0.5423816, 1.688761, 1, 0, 0, 1, 1,
0.2811036, -0.8215315, 2.901554, 1, 0, 0, 1, 1,
0.2837737, 0.8226277, 0.0736551, 0, 0, 0, 1, 1,
0.2843227, -0.6518962, 3.539983, 0, 0, 0, 1, 1,
0.2851717, -0.1391051, 2.94162, 0, 0, 0, 1, 1,
0.2896949, 0.3936169, -0.4523325, 0, 0, 0, 1, 1,
0.2948053, -0.8840569, 1.203117, 0, 0, 0, 1, 1,
0.2954349, -2.413052, 3.297902, 0, 0, 0, 1, 1,
0.2957534, 0.01111472, 2.390463, 0, 0, 0, 1, 1,
0.301312, 0.6437191, 1.27226, 1, 1, 1, 1, 1,
0.3049232, -0.5241225, 4.805711, 1, 1, 1, 1, 1,
0.3070706, -0.4230541, 3.426061, 1, 1, 1, 1, 1,
0.3095528, 0.01015646, 1.700614, 1, 1, 1, 1, 1,
0.3096475, 0.8762894, 1.262284, 1, 1, 1, 1, 1,
0.3111397, 1.158584, 0.7236467, 1, 1, 1, 1, 1,
0.3114535, -1.007906, 3.502193, 1, 1, 1, 1, 1,
0.3123728, 1.605068, 0.01471039, 1, 1, 1, 1, 1,
0.3153442, 0.6186922, -0.1450123, 1, 1, 1, 1, 1,
0.3159603, 1.161226, -0.2816695, 1, 1, 1, 1, 1,
0.318095, -0.05872881, 0.8219929, 1, 1, 1, 1, 1,
0.3210237, -0.03216231, 2.73389, 1, 1, 1, 1, 1,
0.3215712, -0.4399966, 3.089839, 1, 1, 1, 1, 1,
0.3215998, 0.2394952, 0.798426, 1, 1, 1, 1, 1,
0.3220429, -0.7481833, 3.950737, 1, 1, 1, 1, 1,
0.3286583, 0.6498671, 0.6383159, 0, 0, 1, 1, 1,
0.3309413, 1.379224, -0.4325008, 1, 0, 0, 1, 1,
0.3350483, -0.8752255, 2.060503, 1, 0, 0, 1, 1,
0.339639, -1.547539, 4.497762, 1, 0, 0, 1, 1,
0.3418212, -0.2104259, 1.771681, 1, 0, 0, 1, 1,
0.3458554, -0.8015143, 2.824981, 1, 0, 0, 1, 1,
0.3475165, -0.1539997, 2.863737, 0, 0, 0, 1, 1,
0.3528063, 0.1546664, -0.2327712, 0, 0, 0, 1, 1,
0.354314, -0.8048796, 1.84758, 0, 0, 0, 1, 1,
0.3560015, 0.09259371, 1.617009, 0, 0, 0, 1, 1,
0.3578261, 0.4398943, 2.192426, 0, 0, 0, 1, 1,
0.3583959, 0.2152081, 1.684433, 0, 0, 0, 1, 1,
0.3589784, 1.135448, -0.2628426, 0, 0, 0, 1, 1,
0.3590029, -0.007857082, 1.545899, 1, 1, 1, 1, 1,
0.3680246, 2.314727, -1.124922, 1, 1, 1, 1, 1,
0.3684737, 0.6789902, 3.542033, 1, 1, 1, 1, 1,
0.3779194, 0.9885864, 0.4541138, 1, 1, 1, 1, 1,
0.3833966, 0.5585544, 0.01113558, 1, 1, 1, 1, 1,
0.3870359, 0.1094247, 2.810739, 1, 1, 1, 1, 1,
0.3884029, -2.039958, 3.992911, 1, 1, 1, 1, 1,
0.3911536, -0.8783206, 2.582492, 1, 1, 1, 1, 1,
0.3919871, 0.965232, 0.3568732, 1, 1, 1, 1, 1,
0.393664, -0.3461529, 3.669644, 1, 1, 1, 1, 1,
0.3981738, 0.6093513, 0.8110031, 1, 1, 1, 1, 1,
0.3986051, 0.4620781, -0.5254352, 1, 1, 1, 1, 1,
0.3995652, 1.680721, 1.169298, 1, 1, 1, 1, 1,
0.4006715, -0.7298556, 3.483802, 1, 1, 1, 1, 1,
0.4035726, 0.05997012, 1.895617, 1, 1, 1, 1, 1,
0.4100954, 0.1199255, 3.010978, 0, 0, 1, 1, 1,
0.4102107, -1.438609, 1.711564, 1, 0, 0, 1, 1,
0.4123725, -1.259896, 4.039467, 1, 0, 0, 1, 1,
0.4129921, 0.1555886, 2.635953, 1, 0, 0, 1, 1,
0.4138871, -1.691362, 1.105949, 1, 0, 0, 1, 1,
0.4142312, -1.563255, 2.722682, 1, 0, 0, 1, 1,
0.4162443, -1.428689, 2.303523, 0, 0, 0, 1, 1,
0.4191685, 0.3376505, 0.08329146, 0, 0, 0, 1, 1,
0.4204956, 2.138866, 1.655245, 0, 0, 0, 1, 1,
0.4211864, 0.2548229, 0.669309, 0, 0, 0, 1, 1,
0.425838, 0.954937, 0.3412531, 0, 0, 0, 1, 1,
0.427544, -0.7414719, 2.253979, 0, 0, 0, 1, 1,
0.4319087, -0.05368487, 2.099565, 0, 0, 0, 1, 1,
0.4326545, 0.3414313, -1.312806, 1, 1, 1, 1, 1,
0.4340166, 0.4592966, 1.235583, 1, 1, 1, 1, 1,
0.4382434, -1.378501, 2.078416, 1, 1, 1, 1, 1,
0.4391119, 1.179466, 0.355763, 1, 1, 1, 1, 1,
0.4413469, -1.582271, 3.168277, 1, 1, 1, 1, 1,
0.4447822, 1.051176, 1.284575, 1, 1, 1, 1, 1,
0.4500489, -0.2121887, 1.038114, 1, 1, 1, 1, 1,
0.4553088, -0.1443236, 1.417088, 1, 1, 1, 1, 1,
0.4569011, -0.7339258, 1.687561, 1, 1, 1, 1, 1,
0.4592505, 0.0008177518, 1.681011, 1, 1, 1, 1, 1,
0.4594005, -1.023604, 3.58172, 1, 1, 1, 1, 1,
0.4608573, -1.347573, 3.697123, 1, 1, 1, 1, 1,
0.4648506, -0.4838189, 2.112763, 1, 1, 1, 1, 1,
0.4681797, -1.759743, 3.848452, 1, 1, 1, 1, 1,
0.4693639, -0.7268393, 1.529511, 1, 1, 1, 1, 1,
0.4738205, -0.7126685, 2.210667, 0, 0, 1, 1, 1,
0.4764029, -2.112424, 3.905453, 1, 0, 0, 1, 1,
0.4809066, 0.7384115, 0.9692574, 1, 0, 0, 1, 1,
0.4818912, 1.378914, 1.218427, 1, 0, 0, 1, 1,
0.4831494, -0.2760529, 0.1384541, 1, 0, 0, 1, 1,
0.4847643, -1.618817, 3.575369, 1, 0, 0, 1, 1,
0.486839, 0.005991933, 1.743218, 0, 0, 0, 1, 1,
0.4921978, 0.9003376, 0.2923169, 0, 0, 0, 1, 1,
0.4934762, 0.3984444, 1.214592, 0, 0, 0, 1, 1,
0.4937039, 1.145664, 0.03921954, 0, 0, 0, 1, 1,
0.4945996, 0.1287041, 2.521623, 0, 0, 0, 1, 1,
0.4974529, 1.854156, -0.1534056, 0, 0, 0, 1, 1,
0.5087523, 0.3526808, 0.3011774, 0, 0, 0, 1, 1,
0.5091026, 0.6328607, -0.8406265, 1, 1, 1, 1, 1,
0.5122575, 1.081513, 1.540503, 1, 1, 1, 1, 1,
0.5163718, 1.582551, -1.020482, 1, 1, 1, 1, 1,
0.5186529, 3.334873, 1.200018, 1, 1, 1, 1, 1,
0.5219892, 0.6645014, 2.811743, 1, 1, 1, 1, 1,
0.530392, -0.8815461, 2.94038, 1, 1, 1, 1, 1,
0.5363392, -1.105248, 3.197344, 1, 1, 1, 1, 1,
0.5387471, 0.4670503, -0.05379779, 1, 1, 1, 1, 1,
0.5409508, -0.8566098, 3.474801, 1, 1, 1, 1, 1,
0.5422056, -0.5921007, 1.954606, 1, 1, 1, 1, 1,
0.542402, 2.010504, 0.05484761, 1, 1, 1, 1, 1,
0.5435023, -0.2400983, 1.855785, 1, 1, 1, 1, 1,
0.5444259, 0.7607247, 2.156288, 1, 1, 1, 1, 1,
0.5505897, -0.1789846, 1.175505, 1, 1, 1, 1, 1,
0.550626, -0.2315547, 2.641255, 1, 1, 1, 1, 1,
0.5511035, 0.658946, -0.2330052, 0, 0, 1, 1, 1,
0.5614196, 0.895551, -1.073837, 1, 0, 0, 1, 1,
0.5632135, 0.5827363, -0.4929674, 1, 0, 0, 1, 1,
0.5695931, 0.5111476, 0.2847724, 1, 0, 0, 1, 1,
0.5856033, 0.1456929, 0.8327562, 1, 0, 0, 1, 1,
0.5869921, 0.9619049, 0.8429927, 1, 0, 0, 1, 1,
0.6026909, -0.005293088, 2.286725, 0, 0, 0, 1, 1,
0.6036112, 0.9630708, 1.022846, 0, 0, 0, 1, 1,
0.6207691, -0.297111, 0.6223558, 0, 0, 0, 1, 1,
0.621263, 1.029788, 0.3612038, 0, 0, 0, 1, 1,
0.6221196, 0.2107275, 1.770714, 0, 0, 0, 1, 1,
0.627931, -0.05573879, 1.1472, 0, 0, 0, 1, 1,
0.6346843, -0.3245616, 1.204567, 0, 0, 0, 1, 1,
0.6349816, -1.831339, 2.392078, 1, 1, 1, 1, 1,
0.6366103, -1.699903, 2.760029, 1, 1, 1, 1, 1,
0.6382321, 0.1213933, 0.5266526, 1, 1, 1, 1, 1,
0.6461228, 0.800459, 0.9016062, 1, 1, 1, 1, 1,
0.6465655, -1.006951, 2.281047, 1, 1, 1, 1, 1,
0.6484581, 0.2683545, -0.1199059, 1, 1, 1, 1, 1,
0.6491148, 0.6522135, 0.8714446, 1, 1, 1, 1, 1,
0.6504473, -1.255136, 3.999185, 1, 1, 1, 1, 1,
0.6518916, 1.564766, -0.6243083, 1, 1, 1, 1, 1,
0.6533271, 0.8572025, -0.24433, 1, 1, 1, 1, 1,
0.6589322, 0.6137897, 0.5622278, 1, 1, 1, 1, 1,
0.664796, 0.07386987, 2.569307, 1, 1, 1, 1, 1,
0.6660853, -0.06651045, 0.5304114, 1, 1, 1, 1, 1,
0.6670432, 1.048782, -0.04851507, 1, 1, 1, 1, 1,
0.6682502, -0.7950858, 3.560409, 1, 1, 1, 1, 1,
0.6702294, -0.7113306, 3.200645, 0, 0, 1, 1, 1,
0.6728647, -0.006448504, 1.895243, 1, 0, 0, 1, 1,
0.6732098, 0.1761372, 0.4837931, 1, 0, 0, 1, 1,
0.6744728, 0.2501265, 1.723832, 1, 0, 0, 1, 1,
0.6761613, 1.375471, -0.6756483, 1, 0, 0, 1, 1,
0.6818353, -1.752915, 3.98713, 1, 0, 0, 1, 1,
0.6819189, 1.604118, 0.6319255, 0, 0, 0, 1, 1,
0.6825933, 0.1750401, 1.532262, 0, 0, 0, 1, 1,
0.684387, -0.3724951, 0.5062363, 0, 0, 0, 1, 1,
0.6855891, 0.9107695, 0.07237364, 0, 0, 0, 1, 1,
0.6884753, -1.078319, 2.412096, 0, 0, 0, 1, 1,
0.6894304, -0.9014913, 1.695248, 0, 0, 0, 1, 1,
0.6922589, -0.8816332, 2.824669, 0, 0, 0, 1, 1,
0.6933289, 1.030262, 1.978031, 1, 1, 1, 1, 1,
0.6947302, 0.4980457, 0.3873402, 1, 1, 1, 1, 1,
0.6961721, -0.1626959, 1.77992, 1, 1, 1, 1, 1,
0.6968042, -1.734917, 3.127877, 1, 1, 1, 1, 1,
0.6971399, -0.761028, 1.833768, 1, 1, 1, 1, 1,
0.698355, 0.8170798, 0.8893167, 1, 1, 1, 1, 1,
0.7020817, 0.9056696, -0.4119402, 1, 1, 1, 1, 1,
0.7030384, -1.332604, 2.994376, 1, 1, 1, 1, 1,
0.704327, -0.8626537, 2.579589, 1, 1, 1, 1, 1,
0.7049388, -0.9232, 4.609003, 1, 1, 1, 1, 1,
0.705564, -2.578637, 2.033762, 1, 1, 1, 1, 1,
0.7066534, 0.3362817, 0.7435015, 1, 1, 1, 1, 1,
0.7123207, -0.8751566, 2.663673, 1, 1, 1, 1, 1,
0.7130851, -2.060483, 4.64236, 1, 1, 1, 1, 1,
0.7180327, 0.3035623, 1.259672, 1, 1, 1, 1, 1,
0.7197503, -0.9955884, 2.486781, 0, 0, 1, 1, 1,
0.7258936, 0.1834231, 2.118846, 1, 0, 0, 1, 1,
0.7275496, -0.1589341, 1.078789, 1, 0, 0, 1, 1,
0.7276844, 0.6059007, 1.00564, 1, 0, 0, 1, 1,
0.7284366, -0.3903422, 4.0112, 1, 0, 0, 1, 1,
0.7355691, -1.463296, 3.376042, 1, 0, 0, 1, 1,
0.7386478, -0.6387634, 1.407189, 0, 0, 0, 1, 1,
0.7393614, 0.05495792, 2.064018, 0, 0, 0, 1, 1,
0.7446647, -1.040297, 2.178536, 0, 0, 0, 1, 1,
0.7560309, -0.432326, 1.877828, 0, 0, 0, 1, 1,
0.7580332, 0.1955827, 0.9393516, 0, 0, 0, 1, 1,
0.7584198, -0.7196107, 0.523423, 0, 0, 0, 1, 1,
0.7586205, 0.1552379, 1.194427, 0, 0, 0, 1, 1,
0.7621443, -0.748698, 0.4970275, 1, 1, 1, 1, 1,
0.7626487, 0.1965505, 1.218643, 1, 1, 1, 1, 1,
0.7681862, -0.6389849, 2.604686, 1, 1, 1, 1, 1,
0.7733573, -0.6455337, 2.745745, 1, 1, 1, 1, 1,
0.7749335, 0.06455604, 1.013673, 1, 1, 1, 1, 1,
0.7750415, 0.9627193, 0.5783452, 1, 1, 1, 1, 1,
0.7756287, -0.3991036, 2.047988, 1, 1, 1, 1, 1,
0.7785275, -0.08391761, 2.563835, 1, 1, 1, 1, 1,
0.7901623, -0.9856583, 3.217417, 1, 1, 1, 1, 1,
0.7972089, -0.488096, 1.286268, 1, 1, 1, 1, 1,
0.807592, 0.8668871, 0.6122385, 1, 1, 1, 1, 1,
0.8227855, -0.06238545, 2.983364, 1, 1, 1, 1, 1,
0.8253067, 0.3719533, -2.311923, 1, 1, 1, 1, 1,
0.8294505, -1.151836, 2.157718, 1, 1, 1, 1, 1,
0.8333057, -0.1753616, 2.925222, 1, 1, 1, 1, 1,
0.8367992, 1.343334, 0.09098151, 0, 0, 1, 1, 1,
0.8408342, 1.553601, -0.3654569, 1, 0, 0, 1, 1,
0.8524081, -0.02607512, 0.3836592, 1, 0, 0, 1, 1,
0.8580165, -0.5742755, 1.566039, 1, 0, 0, 1, 1,
0.8651332, 0.4130689, 0.8025622, 1, 0, 0, 1, 1,
0.8709448, 0.01705944, -0.7034786, 1, 0, 0, 1, 1,
0.8774679, -0.096348, 1.91966, 0, 0, 0, 1, 1,
0.877878, 1.571172, 0.9046147, 0, 0, 0, 1, 1,
0.8799021, 0.1402486, 2.359264, 0, 0, 0, 1, 1,
0.8839949, -0.3828065, 0.9919727, 0, 0, 0, 1, 1,
0.8916144, 0.5600615, -1.086256, 0, 0, 0, 1, 1,
0.8921193, 2.098656, 1.143972, 0, 0, 0, 1, 1,
0.8953642, 0.1274409, 2.441798, 0, 0, 0, 1, 1,
0.8989718, 0.1432473, 2.472453, 1, 1, 1, 1, 1,
0.9014134, -0.04234037, 3.623545, 1, 1, 1, 1, 1,
0.9053823, -0.6541933, 2.443593, 1, 1, 1, 1, 1,
0.9065434, 0.387995, 0.6675038, 1, 1, 1, 1, 1,
0.910228, -1.193032, 2.438083, 1, 1, 1, 1, 1,
0.913124, 0.4621779, 1.868515, 1, 1, 1, 1, 1,
0.9163747, -1.486438, 2.129565, 1, 1, 1, 1, 1,
0.9178143, 2.78968, 0.2080576, 1, 1, 1, 1, 1,
0.9195402, -1.858485, 1.961282, 1, 1, 1, 1, 1,
0.9227347, -0.2973704, 3.309837, 1, 1, 1, 1, 1,
0.9261239, 1.819898, 0.3179055, 1, 1, 1, 1, 1,
0.9355059, 1.811934, 0.7504296, 1, 1, 1, 1, 1,
0.9356379, -0.11843, 1.605899, 1, 1, 1, 1, 1,
0.9390546, -0.9901944, 2.224083, 1, 1, 1, 1, 1,
0.9412168, -0.2582137, 3.885867, 1, 1, 1, 1, 1,
0.9438805, 0.1527252, 0.3430389, 0, 0, 1, 1, 1,
0.9519587, -0.2660321, 0.2685821, 1, 0, 0, 1, 1,
0.9526967, -0.3082846, 1.59215, 1, 0, 0, 1, 1,
0.9549431, 1.262368, 1.228424, 1, 0, 0, 1, 1,
0.958724, -0.5320169, 0.7049764, 1, 0, 0, 1, 1,
0.9594526, -0.3188801, 1.586832, 1, 0, 0, 1, 1,
0.9622941, -0.01157197, 0.2599099, 0, 0, 0, 1, 1,
0.9658595, -0.9401577, 2.20291, 0, 0, 0, 1, 1,
0.9757189, -0.1494058, 1.94328, 0, 0, 0, 1, 1,
0.9770179, 1.366086, 0.01275038, 0, 0, 0, 1, 1,
0.9778843, -1.157184, 0.4611684, 0, 0, 0, 1, 1,
0.9816068, -0.4162539, 3.021074, 0, 0, 0, 1, 1,
0.9870983, -0.2305994, 0.7158935, 0, 0, 0, 1, 1,
0.9884517, 0.2057617, 3.607864, 1, 1, 1, 1, 1,
0.9892942, 0.9893523, 1.10061, 1, 1, 1, 1, 1,
0.9921893, 1.165521, 0.3729517, 1, 1, 1, 1, 1,
0.9985815, -0.8929442, 4.337714, 1, 1, 1, 1, 1,
1.005007, 1.376865, 0.8915326, 1, 1, 1, 1, 1,
1.008466, 0.0397181, 2.42994, 1, 1, 1, 1, 1,
1.011873, -0.05332987, 0.9410427, 1, 1, 1, 1, 1,
1.012223, 0.5496843, 1.364853, 1, 1, 1, 1, 1,
1.015244, 0.04704967, 3.197727, 1, 1, 1, 1, 1,
1.031495, 0.2882448, 0.4962147, 1, 1, 1, 1, 1,
1.032585, -0.1348237, 0.1144037, 1, 1, 1, 1, 1,
1.033345, 0.1940377, 2.099869, 1, 1, 1, 1, 1,
1.041685, -0.9806464, 2.893231, 1, 1, 1, 1, 1,
1.043002, 0.4224789, 0.2992588, 1, 1, 1, 1, 1,
1.053386, 0.6286041, 1.924544, 1, 1, 1, 1, 1,
1.053695, -0.1191936, 2.445568, 0, 0, 1, 1, 1,
1.056394, 1.833163, 1.499914, 1, 0, 0, 1, 1,
1.059077, -0.8428088, 2.538357, 1, 0, 0, 1, 1,
1.05967, -1.191542, 2.645008, 1, 0, 0, 1, 1,
1.064889, 0.6889003, 2.215928, 1, 0, 0, 1, 1,
1.064903, -0.3152203, 0.03996013, 1, 0, 0, 1, 1,
1.069217, 0.1393992, 2.93519, 0, 0, 0, 1, 1,
1.069318, -0.6003417, 1.187964, 0, 0, 0, 1, 1,
1.074753, -0.8855886, 1.093428, 0, 0, 0, 1, 1,
1.075302, -1.291038, 1.812103, 0, 0, 0, 1, 1,
1.076994, -1.361794, 2.517731, 0, 0, 0, 1, 1,
1.083599, 1.059956, -1.356076, 0, 0, 0, 1, 1,
1.084087, 0.2429207, 0.8641679, 0, 0, 0, 1, 1,
1.089505, -1.049083, 2.656895, 1, 1, 1, 1, 1,
1.091959, -1.61464, 3.0366, 1, 1, 1, 1, 1,
1.092911, -0.7495224, 3.324835, 1, 1, 1, 1, 1,
1.093226, -2.019111, 2.487748, 1, 1, 1, 1, 1,
1.09394, 1.716404, 0.8932735, 1, 1, 1, 1, 1,
1.094438, 0.1080124, 1.004567, 1, 1, 1, 1, 1,
1.099488, 0.7755521, 2.009842, 1, 1, 1, 1, 1,
1.099902, 1.062681, 1.358319, 1, 1, 1, 1, 1,
1.112796, -0.7497678, 1.650365, 1, 1, 1, 1, 1,
1.116348, 0.2112121, 1.899766, 1, 1, 1, 1, 1,
1.123531, -0.2453246, 2.265215, 1, 1, 1, 1, 1,
1.12523, 0.1052654, 0.5900748, 1, 1, 1, 1, 1,
1.125659, 1.661102, 1.281412, 1, 1, 1, 1, 1,
1.134329, 0.6819412, 0.3213683, 1, 1, 1, 1, 1,
1.136848, 0.01624229, 2.587703, 1, 1, 1, 1, 1,
1.141354, -0.2988732, 1.714725, 0, 0, 1, 1, 1,
1.150618, 1.380787, 0.4550199, 1, 0, 0, 1, 1,
1.155652, 2.032705, 2.480324, 1, 0, 0, 1, 1,
1.157651, 0.9473243, 2.650192, 1, 0, 0, 1, 1,
1.165921, 0.5527407, 0.9626845, 1, 0, 0, 1, 1,
1.166758, 0.8358306, 0.2233654, 1, 0, 0, 1, 1,
1.168785, -0.04449511, 1.979451, 0, 0, 0, 1, 1,
1.174666, -0.2698604, 1.788068, 0, 0, 0, 1, 1,
1.176549, 0.1811144, 3.489372, 0, 0, 0, 1, 1,
1.184096, 0.191692, 1.890716, 0, 0, 0, 1, 1,
1.188269, 1.246618, 0.6195347, 0, 0, 0, 1, 1,
1.189541, -1.973169, 5.300891, 0, 0, 0, 1, 1,
1.192811, -1.097942, 0.5430031, 0, 0, 0, 1, 1,
1.193003, 0.05969317, 1.497591, 1, 1, 1, 1, 1,
1.194435, 2.020264, 1.069104, 1, 1, 1, 1, 1,
1.199186, -0.4701307, 2.873103, 1, 1, 1, 1, 1,
1.202227, 0.6965566, 2.609359, 1, 1, 1, 1, 1,
1.204241, -1.666571, 1.762179, 1, 1, 1, 1, 1,
1.20671, -0.06339435, 2.366731, 1, 1, 1, 1, 1,
1.212807, -0.5179647, 2.178894, 1, 1, 1, 1, 1,
1.212826, 1.333775, 2.105014, 1, 1, 1, 1, 1,
1.215822, 1.788199, -0.197576, 1, 1, 1, 1, 1,
1.218166, -1.133075, 2.801732, 1, 1, 1, 1, 1,
1.219074, -0.4146015, 1.747293, 1, 1, 1, 1, 1,
1.222186, -1.593443, 3.105691, 1, 1, 1, 1, 1,
1.224547, 0.2082453, 1.779638, 1, 1, 1, 1, 1,
1.228743, -1.436897, 3.426606, 1, 1, 1, 1, 1,
1.232557, -1.398113, 2.046202, 1, 1, 1, 1, 1,
1.235984, -0.0213045, -0.02310857, 0, 0, 1, 1, 1,
1.24757, -1.23802, 1.72595, 1, 0, 0, 1, 1,
1.249875, -2.005745, 3.205567, 1, 0, 0, 1, 1,
1.267942, -0.9403499, 2.061171, 1, 0, 0, 1, 1,
1.273152, -0.119884, 2.700732, 1, 0, 0, 1, 1,
1.27625, -0.933056, 2.980237, 1, 0, 0, 1, 1,
1.283824, -0.3456384, 3.325088, 0, 0, 0, 1, 1,
1.296096, 2.616581, -0.05822188, 0, 0, 0, 1, 1,
1.31176, -0.7698615, 2.052711, 0, 0, 0, 1, 1,
1.320451, 1.246292, 1.192696, 0, 0, 0, 1, 1,
1.33022, 2.344752, 0.2432142, 0, 0, 0, 1, 1,
1.339903, -0.5150589, 1.64174, 0, 0, 0, 1, 1,
1.346034, 1.213639, 2.280222, 0, 0, 0, 1, 1,
1.349041, -0.5057877, 2.850728, 1, 1, 1, 1, 1,
1.349485, -0.1316918, 1.357903, 1, 1, 1, 1, 1,
1.351526, 0.5391875, 0.3885407, 1, 1, 1, 1, 1,
1.352036, 1.487142, -0.7569939, 1, 1, 1, 1, 1,
1.370323, 1.430781, -0.2172934, 1, 1, 1, 1, 1,
1.378481, -0.3871887, 0.6555367, 1, 1, 1, 1, 1,
1.379158, 0.9414086, 2.353371, 1, 1, 1, 1, 1,
1.383293, -0.1666608, 1.172881, 1, 1, 1, 1, 1,
1.384809, 0.5133582, 1.372483, 1, 1, 1, 1, 1,
1.393166, -0.7716641, 1.49979, 1, 1, 1, 1, 1,
1.396054, 0.7522953, 2.573098, 1, 1, 1, 1, 1,
1.404697, 0.7524626, -0.7374822, 1, 1, 1, 1, 1,
1.405717, 0.5534374, 1.359851, 1, 1, 1, 1, 1,
1.409053, 0.7154066, -0.3208771, 1, 1, 1, 1, 1,
1.409292, 1.687445, -0.0526223, 1, 1, 1, 1, 1,
1.409582, 0.2854085, 1.184678, 0, 0, 1, 1, 1,
1.419817, 0.8671547, 0.5095876, 1, 0, 0, 1, 1,
1.422299, -0.3841691, 0.1798777, 1, 0, 0, 1, 1,
1.425422, 0.01058915, 2.895581, 1, 0, 0, 1, 1,
1.431306, -0.08428962, 2.947374, 1, 0, 0, 1, 1,
1.431536, 0.8986353, 0.7318375, 1, 0, 0, 1, 1,
1.460768, -0.05904852, 1.908926, 0, 0, 0, 1, 1,
1.468922, 0.3286105, -0.4614524, 0, 0, 0, 1, 1,
1.478082, 0.4115674, 1.945375, 0, 0, 0, 1, 1,
1.478377, -0.9907127, 1.996633, 0, 0, 0, 1, 1,
1.480178, 0.4940205, 1.723879, 0, 0, 0, 1, 1,
1.496746, 0.4946115, 0.2383412, 0, 0, 0, 1, 1,
1.496867, 1.118131, 1.430065, 0, 0, 0, 1, 1,
1.498191, -0.6375718, 1.466814, 1, 1, 1, 1, 1,
1.504515, -0.1813463, 2.50585, 1, 1, 1, 1, 1,
1.509457, 0.156513, 2.243917, 1, 1, 1, 1, 1,
1.521293, -0.1285135, 2.249935, 1, 1, 1, 1, 1,
1.534369, 0.5166065, 3.15461, 1, 1, 1, 1, 1,
1.581477, 0.6679539, 1.007884, 1, 1, 1, 1, 1,
1.585444, -0.2032848, 0.2907012, 1, 1, 1, 1, 1,
1.591316, -1.921998, 2.474711, 1, 1, 1, 1, 1,
1.59815, 0.8802036, 1.101328, 1, 1, 1, 1, 1,
1.60567, -1.727321, 2.511221, 1, 1, 1, 1, 1,
1.619215, 0.5443159, -0.1059704, 1, 1, 1, 1, 1,
1.631077, 1.996641, 1.773004, 1, 1, 1, 1, 1,
1.644163, 0.234995, 1.093329, 1, 1, 1, 1, 1,
1.646117, 1.82514, 1.09623, 1, 1, 1, 1, 1,
1.671226, 0.5917944, 0.8347393, 1, 1, 1, 1, 1,
1.680194, 0.7987227, 2.086568, 0, 0, 1, 1, 1,
1.691397, -0.398836, 2.458672, 1, 0, 0, 1, 1,
1.697175, -1.515065, 1.396511, 1, 0, 0, 1, 1,
1.699745, 0.7245789, 1.261518, 1, 0, 0, 1, 1,
1.701502, 1.231024, 2.036255, 1, 0, 0, 1, 1,
1.706243, -0.7522616, 0.8806782, 1, 0, 0, 1, 1,
1.729229, -1.434188, 2.862097, 0, 0, 0, 1, 1,
1.740123, -0.2162668, 1.710098, 0, 0, 0, 1, 1,
1.743915, -1.260208, 2.22788, 0, 0, 0, 1, 1,
1.790915, 0.7842204, 1.813097, 0, 0, 0, 1, 1,
1.795395, 1.122224, -0.2053211, 0, 0, 0, 1, 1,
1.801563, -0.3822578, 1.252446, 0, 0, 0, 1, 1,
1.845859, 0.7795628, 1.262042, 0, 0, 0, 1, 1,
1.846428, 1.500929, 0.7026535, 1, 1, 1, 1, 1,
1.849582, -0.5426679, 2.379501, 1, 1, 1, 1, 1,
1.888452, 0.4166738, 1.134399, 1, 1, 1, 1, 1,
1.893002, -0.5486648, 1.531597, 1, 1, 1, 1, 1,
1.897625, -0.8604579, 1.120928, 1, 1, 1, 1, 1,
1.900323, -0.661369, 1.692784, 1, 1, 1, 1, 1,
1.910381, 0.3575477, 0.8779956, 1, 1, 1, 1, 1,
1.95643, 0.2777996, -0.8367021, 1, 1, 1, 1, 1,
1.965726, -1.218299, 2.710037, 1, 1, 1, 1, 1,
1.969755, 0.4008969, 2.316059, 1, 1, 1, 1, 1,
2.013566, -0.4875589, 1.570156, 1, 1, 1, 1, 1,
2.032332, 0.001657229, 1.113369, 1, 1, 1, 1, 1,
2.041119, 1.092398, 1.765523, 1, 1, 1, 1, 1,
2.082715, -0.2144293, 0.4315498, 1, 1, 1, 1, 1,
2.108439, 1.151861, 2.065682, 1, 1, 1, 1, 1,
2.113936, 0.4652918, 1.998616, 0, 0, 1, 1, 1,
2.115363, -2.691209, 2.040031, 1, 0, 0, 1, 1,
2.123636, -0.4396469, -0.1623366, 1, 0, 0, 1, 1,
2.149068, -0.5426364, 2.144018, 1, 0, 0, 1, 1,
2.149603, -1.471381, 3.170379, 1, 0, 0, 1, 1,
2.181664, 1.615759, 0.1045108, 1, 0, 0, 1, 1,
2.202206, -0.7112753, 1.185514, 0, 0, 0, 1, 1,
2.294559, -1.702345, 1.141994, 0, 0, 0, 1, 1,
2.360664, -0.7878357, 1.588536, 0, 0, 0, 1, 1,
2.462537, -1.000699, 1.12528, 0, 0, 0, 1, 1,
2.46415, -0.8708084, 1.081439, 0, 0, 0, 1, 1,
2.490141, 0.9397129, 0.2341595, 0, 0, 0, 1, 1,
2.490608, 0.4582876, 1.692894, 0, 0, 0, 1, 1,
2.540978, -0.6004503, 1.297402, 1, 1, 1, 1, 1,
2.595904, 0.01924056, 2.628764, 1, 1, 1, 1, 1,
2.779751, -0.1205138, 1.796659, 1, 1, 1, 1, 1,
2.866589, -0.9700247, 2.557955, 1, 1, 1, 1, 1,
2.934505, 0.8813461, 0.05122948, 1, 1, 1, 1, 1,
3.002532, -0.07096858, 1.411193, 1, 1, 1, 1, 1,
3.024367, 0.2468163, 0.8167484, 1, 1, 1, 1, 1
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
var radius = 9.611609;
var distance = 33.76037;
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
mvMatrix.translate( -0.02854657, -0.1979831, 0.2770391 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.76037);
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
