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
-3.302613, 0.4202099, -1.545787, 1, 0, 0, 1,
-2.996873, -1.392148, -1.869938, 1, 0.007843138, 0, 1,
-2.511087, 0.3436562, -0.7260631, 1, 0.01176471, 0, 1,
-2.510003, 0.5712045, -2.54204, 1, 0.01960784, 0, 1,
-2.484957, 0.7095963, -2.404181, 1, 0.02352941, 0, 1,
-2.473641, -0.4440593, -1.187698, 1, 0.03137255, 0, 1,
-2.469069, -0.4405096, -1.802658, 1, 0.03529412, 0, 1,
-2.460369, 1.138904, 0.08676977, 1, 0.04313726, 0, 1,
-2.280104, 0.7477549, -1.510532, 1, 0.04705882, 0, 1,
-2.267949, -1.247809, -1.686392, 1, 0.05490196, 0, 1,
-2.226781, 0.5597029, -1.696136, 1, 0.05882353, 0, 1,
-2.216455, 0.1054541, -2.276816, 1, 0.06666667, 0, 1,
-2.183403, 0.6415472, -0.4835869, 1, 0.07058824, 0, 1,
-2.169464, 1.731741, 0.01413394, 1, 0.07843138, 0, 1,
-2.134301, 2.23709, -0.9119917, 1, 0.08235294, 0, 1,
-2.131536, 0.4785541, -1.4818, 1, 0.09019608, 0, 1,
-2.124749, 0.1765544, -0.1829669, 1, 0.09411765, 0, 1,
-2.062892, 0.4442925, 0.07871324, 1, 0.1019608, 0, 1,
-2.047995, -1.415887, -2.111495, 1, 0.1098039, 0, 1,
-2.037435, -1.78534, -2.005678, 1, 0.1137255, 0, 1,
-1.985564, -1.397299, -2.698926, 1, 0.1215686, 0, 1,
-1.970394, 0.2901804, -0.2519659, 1, 0.1254902, 0, 1,
-1.965417, -0.7847368, -1.136086, 1, 0.1333333, 0, 1,
-1.939745, -0.8975651, -0.3111475, 1, 0.1372549, 0, 1,
-1.938883, -0.02651823, -1.102504, 1, 0.145098, 0, 1,
-1.913264, 0.4857562, -0.6678278, 1, 0.1490196, 0, 1,
-1.905946, 1.925802, 0.6673496, 1, 0.1568628, 0, 1,
-1.890745, -0.4869905, -2.515988, 1, 0.1607843, 0, 1,
-1.886879, 0.3272493, 0.04542026, 1, 0.1686275, 0, 1,
-1.86399, -0.4504516, -0.2058629, 1, 0.172549, 0, 1,
-1.852125, -0.5018316, -3.001173, 1, 0.1803922, 0, 1,
-1.823832, -0.6543707, -2.572746, 1, 0.1843137, 0, 1,
-1.820949, -0.6158212, -1.121579, 1, 0.1921569, 0, 1,
-1.813514, 0.2911912, -2.199016, 1, 0.1960784, 0, 1,
-1.794146, 2.438252, -0.01629543, 1, 0.2039216, 0, 1,
-1.791724, 0.8852291, 0.4683915, 1, 0.2117647, 0, 1,
-1.784079, -0.1355891, -1.609287, 1, 0.2156863, 0, 1,
-1.755161, 0.6779873, -2.859664, 1, 0.2235294, 0, 1,
-1.749657, -0.7087197, -1.366282, 1, 0.227451, 0, 1,
-1.720079, 0.714519, -1.374382, 1, 0.2352941, 0, 1,
-1.692285, -0.7005661, -1.95492, 1, 0.2392157, 0, 1,
-1.685776, -0.3292318, 0.386352, 1, 0.2470588, 0, 1,
-1.674494, 1.15875, -1.916758, 1, 0.2509804, 0, 1,
-1.66835, -0.2740468, -2.983613, 1, 0.2588235, 0, 1,
-1.66578, -0.147225, -0.9594725, 1, 0.2627451, 0, 1,
-1.661995, 0.08637919, -1.757772, 1, 0.2705882, 0, 1,
-1.659151, -0.5088295, -3.959048, 1, 0.2745098, 0, 1,
-1.658153, -0.1221528, -0.5565701, 1, 0.282353, 0, 1,
-1.652358, 0.8066238, -1.058304, 1, 0.2862745, 0, 1,
-1.639637, 0.4416497, -0.1614025, 1, 0.2941177, 0, 1,
-1.637833, 0.9992232, -3.886389, 1, 0.3019608, 0, 1,
-1.628985, 0.744054, -1.235673, 1, 0.3058824, 0, 1,
-1.624089, -1.028019, -2.425729, 1, 0.3137255, 0, 1,
-1.598692, 0.4675602, -1.401714, 1, 0.3176471, 0, 1,
-1.58747, -1.315453, -2.341141, 1, 0.3254902, 0, 1,
-1.563736, -0.7327833, -2.654771, 1, 0.3294118, 0, 1,
-1.54195, 0.05051944, -0.6488111, 1, 0.3372549, 0, 1,
-1.521516, -0.9080055, -1.494153, 1, 0.3411765, 0, 1,
-1.511972, -0.03472814, -0.5676523, 1, 0.3490196, 0, 1,
-1.502301, -0.7498863, -3.170766, 1, 0.3529412, 0, 1,
-1.482942, 0.6365792, 0.6975285, 1, 0.3607843, 0, 1,
-1.480286, 1.62996, -1.651823, 1, 0.3647059, 0, 1,
-1.478783, -0.5447605, -2.005527, 1, 0.372549, 0, 1,
-1.471512, 0.0190818, -2.336999, 1, 0.3764706, 0, 1,
-1.471436, 2.047573, -1.417879, 1, 0.3843137, 0, 1,
-1.470737, -1.177275, -2.100285, 1, 0.3882353, 0, 1,
-1.470376, 1.673001, -1.14659, 1, 0.3960784, 0, 1,
-1.465595, 0.4555228, -1.20259, 1, 0.4039216, 0, 1,
-1.462092, 1.158971, 0.07301652, 1, 0.4078431, 0, 1,
-1.461319, 1.3469, -1.404679, 1, 0.4156863, 0, 1,
-1.456803, 1.534814, -1.684826, 1, 0.4196078, 0, 1,
-1.452524, 0.05069072, 0.0293653, 1, 0.427451, 0, 1,
-1.447847, 0.3128411, -1.338185, 1, 0.4313726, 0, 1,
-1.446143, 0.7862385, -2.036786, 1, 0.4392157, 0, 1,
-1.442738, -1.605682, -3.562282, 1, 0.4431373, 0, 1,
-1.440447, 0.3373033, -0.8145062, 1, 0.4509804, 0, 1,
-1.428211, 0.5115178, -0.9160078, 1, 0.454902, 0, 1,
-1.427971, 1.075562, -2.187094, 1, 0.4627451, 0, 1,
-1.419415, 0.1650683, -4.095889, 1, 0.4666667, 0, 1,
-1.391302, -1.162376, -4.043239, 1, 0.4745098, 0, 1,
-1.38993, 0.9261939, -0.9739035, 1, 0.4784314, 0, 1,
-1.379368, -0.1742426, -4.782627, 1, 0.4862745, 0, 1,
-1.375243, -0.6318131, -1.551942, 1, 0.4901961, 0, 1,
-1.375036, -1.230963, -0.8452542, 1, 0.4980392, 0, 1,
-1.364822, 0.026733, -1.564044, 1, 0.5058824, 0, 1,
-1.361621, 0.09027924, -1.136999, 1, 0.509804, 0, 1,
-1.358555, -1.576803, -1.023822, 1, 0.5176471, 0, 1,
-1.329816, -1.142049, -2.465904, 1, 0.5215687, 0, 1,
-1.310715, -0.1068104, -0.1473874, 1, 0.5294118, 0, 1,
-1.304321, 0.09867493, -2.451306, 1, 0.5333334, 0, 1,
-1.297895, -1.700147, -2.764756, 1, 0.5411765, 0, 1,
-1.291236, 2.411445, -1.270003, 1, 0.5450981, 0, 1,
-1.283163, -0.7718481, -1.742121, 1, 0.5529412, 0, 1,
-1.268219, -0.4076278, -2.992828, 1, 0.5568628, 0, 1,
-1.259904, -0.7383198, -3.240395, 1, 0.5647059, 0, 1,
-1.257241, -1.32895, -4.013857, 1, 0.5686275, 0, 1,
-1.249877, 0.9948261, -0.4436051, 1, 0.5764706, 0, 1,
-1.246129, -0.4453427, -1.968733, 1, 0.5803922, 0, 1,
-1.245449, 0.00773638, 0.4544772, 1, 0.5882353, 0, 1,
-1.244776, 0.9479509, -3.662309, 1, 0.5921569, 0, 1,
-1.228871, 0.9488947, -0.876567, 1, 0.6, 0, 1,
-1.2284, 0.8119399, -1.319735, 1, 0.6078432, 0, 1,
-1.224244, 0.009638615, -1.5962, 1, 0.6117647, 0, 1,
-1.223922, -0.4845013, -0.6715275, 1, 0.6196079, 0, 1,
-1.223769, -0.1400632, -1.284261, 1, 0.6235294, 0, 1,
-1.213121, -0.7602151, -0.5964197, 1, 0.6313726, 0, 1,
-1.204461, 0.9126324, -0.307687, 1, 0.6352941, 0, 1,
-1.20041, 0.1200983, -2.834134, 1, 0.6431373, 0, 1,
-1.199468, 1.199187, -0.4201691, 1, 0.6470588, 0, 1,
-1.186966, 0.1375865, -1.556894, 1, 0.654902, 0, 1,
-1.181254, -1.473226, -2.615391, 1, 0.6588235, 0, 1,
-1.1807, 0.7359322, -0.1032936, 1, 0.6666667, 0, 1,
-1.180695, -0.5819355, -0.185619, 1, 0.6705883, 0, 1,
-1.172362, -0.8168589, -1.45691, 1, 0.6784314, 0, 1,
-1.170859, 0.2059929, -1.853959, 1, 0.682353, 0, 1,
-1.170801, 0.06893833, -1.47672, 1, 0.6901961, 0, 1,
-1.150412, -0.8870043, -0.2902217, 1, 0.6941177, 0, 1,
-1.146458, 0.824977, -0.1217308, 1, 0.7019608, 0, 1,
-1.146055, 1.128422, -0.1083323, 1, 0.7098039, 0, 1,
-1.143477, -0.5464782, -2.380206, 1, 0.7137255, 0, 1,
-1.142234, 0.159991, -0.9947386, 1, 0.7215686, 0, 1,
-1.140606, 0.7243352, -0.5181907, 1, 0.7254902, 0, 1,
-1.138016, 0.5362672, -2.370322, 1, 0.7333333, 0, 1,
-1.137495, 0.5401845, 0.04716561, 1, 0.7372549, 0, 1,
-1.136446, -0.3673053, -3.64621, 1, 0.7450981, 0, 1,
-1.132415, 0.9979048, -0.5231189, 1, 0.7490196, 0, 1,
-1.125546, 0.4131475, -1.280924, 1, 0.7568628, 0, 1,
-1.123534, -0.0369412, -1.251848, 1, 0.7607843, 0, 1,
-1.120517, 0.4206921, -2.363938, 1, 0.7686275, 0, 1,
-1.119427, 1.091683, -0.9664091, 1, 0.772549, 0, 1,
-1.109808, 2.031908, 0.1918211, 1, 0.7803922, 0, 1,
-1.109599, 0.9279421, -1.946366, 1, 0.7843137, 0, 1,
-1.108406, -0.5320616, -1.525365, 1, 0.7921569, 0, 1,
-1.104005, 0.7998748, -0.4492308, 1, 0.7960784, 0, 1,
-1.098745, -0.3725369, -1.438316, 1, 0.8039216, 0, 1,
-1.095648, 0.4341002, -1.196539, 1, 0.8117647, 0, 1,
-1.093781, 0.4512117, -0.3044842, 1, 0.8156863, 0, 1,
-1.087709, 0.374349, -1.183617, 1, 0.8235294, 0, 1,
-1.086775, -0.5233996, -2.158485, 1, 0.827451, 0, 1,
-1.080689, -0.4967893, -1.501895, 1, 0.8352941, 0, 1,
-1.07857, 1.100428, -3.098298, 1, 0.8392157, 0, 1,
-1.075896, -1.048674, -3.451439, 1, 0.8470588, 0, 1,
-1.070671, 0.6616891, -0.9887363, 1, 0.8509804, 0, 1,
-1.07049, -0.4438067, -1.687955, 1, 0.8588235, 0, 1,
-1.06719, 0.0948877, 0.2968026, 1, 0.8627451, 0, 1,
-1.064807, 0.002477005, -1.804202, 1, 0.8705882, 0, 1,
-1.055955, 0.3159726, -0.8292416, 1, 0.8745098, 0, 1,
-1.055895, 1.003901, -1.512605, 1, 0.8823529, 0, 1,
-1.048118, -1.235412, -2.169091, 1, 0.8862745, 0, 1,
-1.044429, -0.6301039, -2.023499, 1, 0.8941177, 0, 1,
-1.041014, -1.600174, -0.9612927, 1, 0.8980392, 0, 1,
-1.026473, -1.227599, -1.62345, 1, 0.9058824, 0, 1,
-1.022704, 0.3014464, -3.027696, 1, 0.9137255, 0, 1,
-0.9983014, -0.001614126, -0.2332005, 1, 0.9176471, 0, 1,
-0.9952511, 1.173906, -2.410516, 1, 0.9254902, 0, 1,
-0.9892259, -0.1297466, -0.9784012, 1, 0.9294118, 0, 1,
-0.9773719, 1.127966, -1.590491, 1, 0.9372549, 0, 1,
-0.9738229, -0.9699392, -1.970599, 1, 0.9411765, 0, 1,
-0.9713619, 1.347528, -0.9928339, 1, 0.9490196, 0, 1,
-0.9557627, -0.5437665, -1.562561, 1, 0.9529412, 0, 1,
-0.9547033, 0.8740435, -0.6869603, 1, 0.9607843, 0, 1,
-0.9482698, 0.3223774, -1.858339, 1, 0.9647059, 0, 1,
-0.9479113, 0.1504286, -1.15108, 1, 0.972549, 0, 1,
-0.9404935, -0.8544078, -2.093017, 1, 0.9764706, 0, 1,
-0.9383856, 1.446335, 1.173418, 1, 0.9843137, 0, 1,
-0.936093, -0.4459561, -1.74824, 1, 0.9882353, 0, 1,
-0.9350622, 0.3212052, -0.5689409, 1, 0.9960784, 0, 1,
-0.9284092, -0.06792778, -0.617422, 0.9960784, 1, 0, 1,
-0.9228446, 0.6943235, -1.181906, 0.9921569, 1, 0, 1,
-0.9220043, 1.847233, 1.035834, 0.9843137, 1, 0, 1,
-0.9136561, 0.7151413, -0.6777584, 0.9803922, 1, 0, 1,
-0.9112594, -0.7463225, -1.408797, 0.972549, 1, 0, 1,
-0.9103916, -0.1277314, -1.37109, 0.9686275, 1, 0, 1,
-0.9066632, -1.361722, -2.472777, 0.9607843, 1, 0, 1,
-0.9064625, -0.7558916, -2.971811, 0.9568627, 1, 0, 1,
-0.8924165, 1.574152, -1.099863, 0.9490196, 1, 0, 1,
-0.8918567, 1.379222, -1.049209, 0.945098, 1, 0, 1,
-0.8912175, -0.9467483, -2.625576, 0.9372549, 1, 0, 1,
-0.8858672, 1.196968, -0.290927, 0.9333333, 1, 0, 1,
-0.8813078, 0.09373371, -1.956378, 0.9254902, 1, 0, 1,
-0.8808244, -0.00465035, -0.7218351, 0.9215686, 1, 0, 1,
-0.8664252, 0.05276109, -1.810635, 0.9137255, 1, 0, 1,
-0.861946, 0.9096869, -0.7907401, 0.9098039, 1, 0, 1,
-0.8597541, -1.418826, -2.084332, 0.9019608, 1, 0, 1,
-0.859529, 1.060791, -0.1070707, 0.8941177, 1, 0, 1,
-0.8569174, 1.914875, 0.8874171, 0.8901961, 1, 0, 1,
-0.8502613, 0.8116725, 0.3938179, 0.8823529, 1, 0, 1,
-0.8482825, -0.08458383, -1.532004, 0.8784314, 1, 0, 1,
-0.8413379, 0.7696688, -1.33032, 0.8705882, 1, 0, 1,
-0.840995, 0.9171177, -0.4045708, 0.8666667, 1, 0, 1,
-0.8402217, -0.6197164, -1.869549, 0.8588235, 1, 0, 1,
-0.8394641, -0.05051119, -2.536506, 0.854902, 1, 0, 1,
-0.8355123, -0.8802099, -2.211529, 0.8470588, 1, 0, 1,
-0.8344796, 1.644475, -0.6171833, 0.8431373, 1, 0, 1,
-0.8276632, 0.4282998, -0.5928946, 0.8352941, 1, 0, 1,
-0.8266011, 3.437904, 0.7950954, 0.8313726, 1, 0, 1,
-0.8212813, 2.120434, 1.757554, 0.8235294, 1, 0, 1,
-0.8149208, 0.3448009, 0.06048653, 0.8196079, 1, 0, 1,
-0.8090886, -0.6132785, -3.397558, 0.8117647, 1, 0, 1,
-0.8078489, 0.4813548, -0.4632388, 0.8078431, 1, 0, 1,
-0.8040789, -0.10295, -1.516819, 0.8, 1, 0, 1,
-0.8000728, -0.4862071, -3.116058, 0.7921569, 1, 0, 1,
-0.7989516, 0.2030119, -0.7933118, 0.7882353, 1, 0, 1,
-0.798728, -0.4693429, -2.514146, 0.7803922, 1, 0, 1,
-0.7945362, -0.8117688, -3.149232, 0.7764706, 1, 0, 1,
-0.7940339, -0.7889228, -4.395296, 0.7686275, 1, 0, 1,
-0.7931374, -0.8281115, -2.165449, 0.7647059, 1, 0, 1,
-0.7914216, -0.5119122, -1.33646, 0.7568628, 1, 0, 1,
-0.7902834, -0.1307836, -0.7335031, 0.7529412, 1, 0, 1,
-0.7896292, -2.195719, -0.8103273, 0.7450981, 1, 0, 1,
-0.7893487, 0.2510526, 0.352302, 0.7411765, 1, 0, 1,
-0.7881414, 0.2447967, -0.9903956, 0.7333333, 1, 0, 1,
-0.7848045, -0.6490104, -1.892179, 0.7294118, 1, 0, 1,
-0.7818547, 0.06745033, -1.40575, 0.7215686, 1, 0, 1,
-0.781699, 1.7156, -0.6705341, 0.7176471, 1, 0, 1,
-0.7678597, -0.4217545, -1.344986, 0.7098039, 1, 0, 1,
-0.7666847, -0.7218423, -2.163069, 0.7058824, 1, 0, 1,
-0.7618195, -0.6092296, -2.902853, 0.6980392, 1, 0, 1,
-0.7617218, 0.4470963, -1.644881, 0.6901961, 1, 0, 1,
-0.7604711, 0.4838227, 0.7597057, 0.6862745, 1, 0, 1,
-0.7529124, -0.06538744, 0.01554, 0.6784314, 1, 0, 1,
-0.7511165, -0.3624518, -2.172562, 0.6745098, 1, 0, 1,
-0.7502619, -0.8240888, -2.92087, 0.6666667, 1, 0, 1,
-0.749898, 0.05183338, -1.231629, 0.6627451, 1, 0, 1,
-0.7426636, 0.4559221, -1.200443, 0.654902, 1, 0, 1,
-0.7402795, 0.7094986, 0.09311846, 0.6509804, 1, 0, 1,
-0.7373548, 0.598881, -2.740031, 0.6431373, 1, 0, 1,
-0.7337806, 0.2496562, -1.905987, 0.6392157, 1, 0, 1,
-0.724939, -0.1074591, -0.856767, 0.6313726, 1, 0, 1,
-0.7244495, 0.2766611, -1.388488, 0.627451, 1, 0, 1,
-0.7239894, 0.1578269, -1.620025, 0.6196079, 1, 0, 1,
-0.7232486, -0.3778166, -3.048663, 0.6156863, 1, 0, 1,
-0.7228092, 0.5930465, -1.071801, 0.6078432, 1, 0, 1,
-0.7217005, -0.8233419, -3.253964, 0.6039216, 1, 0, 1,
-0.7216222, 0.3900703, -1.124802, 0.5960785, 1, 0, 1,
-0.7203795, -0.6375906, -3.552454, 0.5882353, 1, 0, 1,
-0.7201048, 0.6618063, -3.224739, 0.5843138, 1, 0, 1,
-0.7196797, -0.108225, -2.87412, 0.5764706, 1, 0, 1,
-0.7178128, -0.3732118, -2.594208, 0.572549, 1, 0, 1,
-0.7169131, 0.2306319, -2.774205, 0.5647059, 1, 0, 1,
-0.7156465, -0.812634, -4.138382, 0.5607843, 1, 0, 1,
-0.7133314, -0.9699932, -2.215873, 0.5529412, 1, 0, 1,
-0.7119356, -0.3763861, -2.266761, 0.5490196, 1, 0, 1,
-0.7092301, 1.101017, -0.8474429, 0.5411765, 1, 0, 1,
-0.7070534, -0.3124868, -1.813308, 0.5372549, 1, 0, 1,
-0.7064696, 0.4183444, -1.157141, 0.5294118, 1, 0, 1,
-0.7030924, 0.2362482, -0.6700635, 0.5254902, 1, 0, 1,
-0.694948, 1.351728, 1.895832, 0.5176471, 1, 0, 1,
-0.6887379, -0.7271575, -2.796071, 0.5137255, 1, 0, 1,
-0.6854794, 0.4970236, -2.351008, 0.5058824, 1, 0, 1,
-0.6846904, -0.5662684, -1.508457, 0.5019608, 1, 0, 1,
-0.6806793, 1.243652, -1.414122, 0.4941176, 1, 0, 1,
-0.6801991, 0.1976297, -2.29447, 0.4862745, 1, 0, 1,
-0.6707456, 0.4739048, -1.006198, 0.4823529, 1, 0, 1,
-0.6700996, -1.473867, -2.469055, 0.4745098, 1, 0, 1,
-0.6660101, -0.106471, -3.471511, 0.4705882, 1, 0, 1,
-0.6656633, -0.5574606, -1.679251, 0.4627451, 1, 0, 1,
-0.6625172, -0.2423529, -3.365335, 0.4588235, 1, 0, 1,
-0.6554667, 1.888936, -0.4883226, 0.4509804, 1, 0, 1,
-0.6493251, 1.308572, -0.4139079, 0.4470588, 1, 0, 1,
-0.6443177, 0.2428373, -1.503304, 0.4392157, 1, 0, 1,
-0.6416063, -0.7155505, -1.370413, 0.4352941, 1, 0, 1,
-0.6412892, 1.021379, -0.9492152, 0.427451, 1, 0, 1,
-0.6402317, -0.004888064, -1.353583, 0.4235294, 1, 0, 1,
-0.638572, -0.2811387, -0.4369975, 0.4156863, 1, 0, 1,
-0.6335313, -0.4057166, -1.88951, 0.4117647, 1, 0, 1,
-0.6305543, 0.7110422, 0.1608426, 0.4039216, 1, 0, 1,
-0.6278381, -1.552778, -1.984412, 0.3960784, 1, 0, 1,
-0.6249478, -0.2014909, -0.9084744, 0.3921569, 1, 0, 1,
-0.6230133, -1.059355, -2.257072, 0.3843137, 1, 0, 1,
-0.6151797, -0.04844853, -1.762417, 0.3803922, 1, 0, 1,
-0.6100807, 1.3002, 0.5553455, 0.372549, 1, 0, 1,
-0.6089573, -0.8073148, -4.000714, 0.3686275, 1, 0, 1,
-0.6045651, 1.500516, -0.9403496, 0.3607843, 1, 0, 1,
-0.6032501, -0.210015, -1.80508, 0.3568628, 1, 0, 1,
-0.6023914, 0.6905634, 1.158141, 0.3490196, 1, 0, 1,
-0.5974346, 1.844261, 2.226112, 0.345098, 1, 0, 1,
-0.5924321, 1.190087, -0.4319062, 0.3372549, 1, 0, 1,
-0.5896735, 1.915595, 0.4700738, 0.3333333, 1, 0, 1,
-0.5829746, -0.6994398, -4.230886, 0.3254902, 1, 0, 1,
-0.5812243, 0.8615731, -0.8338055, 0.3215686, 1, 0, 1,
-0.5757604, -0.141386, 1.189462, 0.3137255, 1, 0, 1,
-0.5697764, 0.2286245, 0.6996622, 0.3098039, 1, 0, 1,
-0.5677805, -0.5569531, -1.558665, 0.3019608, 1, 0, 1,
-0.5637944, -0.3370587, -1.982546, 0.2941177, 1, 0, 1,
-0.5597096, -1.208943, -3.014091, 0.2901961, 1, 0, 1,
-0.5565794, 0.3228278, -2.442626, 0.282353, 1, 0, 1,
-0.5527983, 1.28028, -1.033754, 0.2784314, 1, 0, 1,
-0.5517788, -1.31166, -2.524941, 0.2705882, 1, 0, 1,
-0.5488566, -2.1818, -2.353017, 0.2666667, 1, 0, 1,
-0.5455179, -0.7827908, -4.671603, 0.2588235, 1, 0, 1,
-0.5453678, -0.7985618, -3.920037, 0.254902, 1, 0, 1,
-0.5443181, 0.3005049, -2.311001, 0.2470588, 1, 0, 1,
-0.5421917, -0.0619324, -1.620806, 0.2431373, 1, 0, 1,
-0.5396796, -0.6620966, -2.479845, 0.2352941, 1, 0, 1,
-0.5388536, 0.2104593, -2.846545, 0.2313726, 1, 0, 1,
-0.5381192, -0.2295771, -1.57339, 0.2235294, 1, 0, 1,
-0.5360589, 0.4000161, 0.3921039, 0.2196078, 1, 0, 1,
-0.5333806, 1.023088, -1.694503, 0.2117647, 1, 0, 1,
-0.5318041, -0.1354855, -3.61806, 0.2078431, 1, 0, 1,
-0.5312981, -1.150512, -2.202291, 0.2, 1, 0, 1,
-0.5230836, 0.4675037, -1.374897, 0.1921569, 1, 0, 1,
-0.5207524, -0.5033974, -2.953726, 0.1882353, 1, 0, 1,
-0.5179405, 0.9989719, -0.9815366, 0.1803922, 1, 0, 1,
-0.5101, 1.212881, -0.3055687, 0.1764706, 1, 0, 1,
-0.5032752, 0.3319905, -1.790676, 0.1686275, 1, 0, 1,
-0.4961117, -0.5362781, -1.845388, 0.1647059, 1, 0, 1,
-0.495329, 1.812564, -0.2132651, 0.1568628, 1, 0, 1,
-0.4946471, 0.8670608, 0.3269977, 0.1529412, 1, 0, 1,
-0.4904738, -0.3930742, -1.887358, 0.145098, 1, 0, 1,
-0.4888509, -0.3440787, -1.338402, 0.1411765, 1, 0, 1,
-0.4875844, -0.6596541, -2.524882, 0.1333333, 1, 0, 1,
-0.4817174, -0.8085994, -2.18305, 0.1294118, 1, 0, 1,
-0.4784662, 1.609558, 0.168851, 0.1215686, 1, 0, 1,
-0.4769893, 1.403542, 0.6330577, 0.1176471, 1, 0, 1,
-0.4729616, -1.281429, -3.071384, 0.1098039, 1, 0, 1,
-0.4708872, 0.1844533, -0.9056466, 0.1058824, 1, 0, 1,
-0.4698881, 0.6606781, -0.844176, 0.09803922, 1, 0, 1,
-0.4638271, -1.694356, -2.739594, 0.09019608, 1, 0, 1,
-0.4605754, -1.511216, -3.027008, 0.08627451, 1, 0, 1,
-0.4596114, -0.08744486, -0.9909744, 0.07843138, 1, 0, 1,
-0.4564516, -0.1528457, -0.8969359, 0.07450981, 1, 0, 1,
-0.4563784, -0.1746636, -3.013474, 0.06666667, 1, 0, 1,
-0.4549368, -0.7721725, -3.202447, 0.0627451, 1, 0, 1,
-0.4540634, 0.4782624, 0.1636545, 0.05490196, 1, 0, 1,
-0.4519394, 0.1629972, -1.513866, 0.05098039, 1, 0, 1,
-0.4513367, 0.1119001, -1.49568, 0.04313726, 1, 0, 1,
-0.4499429, -0.7952076, -3.11334, 0.03921569, 1, 0, 1,
-0.4461243, 2.525442, -2.530641, 0.03137255, 1, 0, 1,
-0.4420387, -1.360637, -2.511848, 0.02745098, 1, 0, 1,
-0.4416765, -2.795179, -2.695055, 0.01960784, 1, 0, 1,
-0.4416368, -0.9012117, -2.731577, 0.01568628, 1, 0, 1,
-0.4404369, -0.50766, -1.691312, 0.007843138, 1, 0, 1,
-0.4371763, 0.807422, -0.1928779, 0.003921569, 1, 0, 1,
-0.4369158, -1.055388, -1.689872, 0, 1, 0.003921569, 1,
-0.4303169, -1.762153, -1.249741, 0, 1, 0.01176471, 1,
-0.4285672, -0.03850244, -2.994444, 0, 1, 0.01568628, 1,
-0.4283581, 0.2184508, 0.5357404, 0, 1, 0.02352941, 1,
-0.426378, 0.6522636, 1.600059, 0, 1, 0.02745098, 1,
-0.4258401, -0.3886107, -1.429589, 0, 1, 0.03529412, 1,
-0.4178338, -0.6797352, -1.954123, 0, 1, 0.03921569, 1,
-0.4171195, -0.2550107, -1.542859, 0, 1, 0.04705882, 1,
-0.4171177, 1.861215, 1.13213, 0, 1, 0.05098039, 1,
-0.4147255, -0.03730819, -3.75964, 0, 1, 0.05882353, 1,
-0.4138694, 0.863813, 1.14999, 0, 1, 0.0627451, 1,
-0.4086429, -0.3017171, -3.155926, 0, 1, 0.07058824, 1,
-0.4005464, 0.1826102, -1.019345, 0, 1, 0.07450981, 1,
-0.38903, 0.2799668, -0.742602, 0, 1, 0.08235294, 1,
-0.3878574, 0.1668944, -1.147444, 0, 1, 0.08627451, 1,
-0.3842372, 0.8621792, -1.204762, 0, 1, 0.09411765, 1,
-0.3830044, -0.2489143, -2.370702, 0, 1, 0.1019608, 1,
-0.3764438, -0.2660958, -3.307748, 0, 1, 0.1058824, 1,
-0.3657701, -1.448046, -3.178804, 0, 1, 0.1137255, 1,
-0.3657594, -1.646429, -0.9304827, 0, 1, 0.1176471, 1,
-0.3592243, 0.2786134, -2.02655, 0, 1, 0.1254902, 1,
-0.3582158, -0.9275459, -2.886643, 0, 1, 0.1294118, 1,
-0.3566942, 1.104534, 0.4570998, 0, 1, 0.1372549, 1,
-0.3513445, -0.2654037, -2.340649, 0, 1, 0.1411765, 1,
-0.3495583, -0.08358701, -1.195644, 0, 1, 0.1490196, 1,
-0.3489819, -1.075364, -2.09595, 0, 1, 0.1529412, 1,
-0.3424257, -0.5191, -2.353894, 0, 1, 0.1607843, 1,
-0.3386282, -0.0637999, -1.959008, 0, 1, 0.1647059, 1,
-0.336509, -0.8679529, -3.945773, 0, 1, 0.172549, 1,
-0.3358285, 1.083224, -1.394871, 0, 1, 0.1764706, 1,
-0.3333412, -0.3606215, -0.5541919, 0, 1, 0.1843137, 1,
-0.3297811, -0.0935223, -1.14193, 0, 1, 0.1882353, 1,
-0.3297448, -1.069821, -3.732923, 0, 1, 0.1960784, 1,
-0.3291996, 0.6820876, 0.01239168, 0, 1, 0.2039216, 1,
-0.3290718, -0.8220579, -2.227174, 0, 1, 0.2078431, 1,
-0.3278484, -1.233837, -1.290289, 0, 1, 0.2156863, 1,
-0.3247905, -0.2444193, -2.231575, 0, 1, 0.2196078, 1,
-0.3245253, -0.3936872, -1.819961, 0, 1, 0.227451, 1,
-0.3209464, 0.8743027, -0.9580815, 0, 1, 0.2313726, 1,
-0.3157815, -0.5069407, -2.825343, 0, 1, 0.2392157, 1,
-0.3143825, 0.3721031, -1.178466, 0, 1, 0.2431373, 1,
-0.3123926, 1.202046, 0.1369877, 0, 1, 0.2509804, 1,
-0.3112164, 0.854102, -1.266627, 0, 1, 0.254902, 1,
-0.3069889, -0.6403829, -3.478097, 0, 1, 0.2627451, 1,
-0.3034809, 0.009125423, -2.813407, 0, 1, 0.2666667, 1,
-0.2991407, 0.6243404, -0.324324, 0, 1, 0.2745098, 1,
-0.2981515, -0.7011442, -3.513229, 0, 1, 0.2784314, 1,
-0.2973287, 0.04288404, -0.4110657, 0, 1, 0.2862745, 1,
-0.2947163, -2.532635, -3.699636, 0, 1, 0.2901961, 1,
-0.2920647, 2.357836, -0.7597929, 0, 1, 0.2980392, 1,
-0.279518, 1.752515, 0.6949399, 0, 1, 0.3058824, 1,
-0.2756405, -0.7983103, -3.32417, 0, 1, 0.3098039, 1,
-0.2739779, -0.7533344, -3.13431, 0, 1, 0.3176471, 1,
-0.2618996, 0.05105777, -1.152027, 0, 1, 0.3215686, 1,
-0.2570926, 0.4546638, 0.527486, 0, 1, 0.3294118, 1,
-0.2548135, -0.6798062, -3.176424, 0, 1, 0.3333333, 1,
-0.2539664, -0.1820071, -2.699552, 0, 1, 0.3411765, 1,
-0.2512384, 0.7808412, 1.052511, 0, 1, 0.345098, 1,
-0.2501769, -0.5928749, -1.817819, 0, 1, 0.3529412, 1,
-0.2467818, -0.6732376, -3.631406, 0, 1, 0.3568628, 1,
-0.2459617, -1.864761, -2.989458, 0, 1, 0.3647059, 1,
-0.2371997, -0.6827844, -3.72168, 0, 1, 0.3686275, 1,
-0.2368589, -1.693755, -1.353832, 0, 1, 0.3764706, 1,
-0.2356895, -1.202194, -2.346019, 0, 1, 0.3803922, 1,
-0.2349738, -2.070032, -1.812027, 0, 1, 0.3882353, 1,
-0.2335053, 2.972592, 0.16835, 0, 1, 0.3921569, 1,
-0.2291483, -1.916091, -1.750544, 0, 1, 0.4, 1,
-0.225348, -1.298352, -2.028806, 0, 1, 0.4078431, 1,
-0.2252382, -0.3183079, -3.707065, 0, 1, 0.4117647, 1,
-0.224763, 0.0337965, -3.345327, 0, 1, 0.4196078, 1,
-0.2172451, -1.356022, -3.320568, 0, 1, 0.4235294, 1,
-0.21342, 2.155298, -0.01557391, 0, 1, 0.4313726, 1,
-0.2129844, -0.7399575, -1.277451, 0, 1, 0.4352941, 1,
-0.2121781, -1.8735, -2.332366, 0, 1, 0.4431373, 1,
-0.2099768, 0.02936479, -2.821037, 0, 1, 0.4470588, 1,
-0.209249, -0.7970728, -1.506494, 0, 1, 0.454902, 1,
-0.2071255, 0.4427253, -0.2894956, 0, 1, 0.4588235, 1,
-0.1974294, -0.845026, -2.362818, 0, 1, 0.4666667, 1,
-0.196515, 1.601107, 0.07429536, 0, 1, 0.4705882, 1,
-0.1955949, -0.09565827, -2.27768, 0, 1, 0.4784314, 1,
-0.1870981, 1.001193, -0.217965, 0, 1, 0.4823529, 1,
-0.1804149, -0.9560837, -1.6981, 0, 1, 0.4901961, 1,
-0.1747895, -0.7412037, -3.000318, 0, 1, 0.4941176, 1,
-0.1736956, 0.1909484, -1.286267, 0, 1, 0.5019608, 1,
-0.1733618, 1.757223, 0.8845126, 0, 1, 0.509804, 1,
-0.1709302, 0.1423453, -0.1401068, 0, 1, 0.5137255, 1,
-0.1671642, 0.2533705, -0.3166423, 0, 1, 0.5215687, 1,
-0.1661639, -0.502777, -2.266013, 0, 1, 0.5254902, 1,
-0.1618972, -0.1564874, -1.782554, 0, 1, 0.5333334, 1,
-0.155769, 0.1664479, 0.3712227, 0, 1, 0.5372549, 1,
-0.1537226, 0.9155633, 1.40223, 0, 1, 0.5450981, 1,
-0.1483925, -1.889867, -1.660056, 0, 1, 0.5490196, 1,
-0.1435616, -1.119362, -1.650058, 0, 1, 0.5568628, 1,
-0.1429153, 0.4269729, -0.2024965, 0, 1, 0.5607843, 1,
-0.1428247, 1.683291, 0.1718367, 0, 1, 0.5686275, 1,
-0.1380167, -1.740638, -3.774805, 0, 1, 0.572549, 1,
-0.1364842, -0.2612992, -1.79577, 0, 1, 0.5803922, 1,
-0.1350726, 0.6531264, -0.2460741, 0, 1, 0.5843138, 1,
-0.1321156, -1.767223, -3.670489, 0, 1, 0.5921569, 1,
-0.1279052, -0.674142, -2.723915, 0, 1, 0.5960785, 1,
-0.1251422, -0.2589864, -1.328685, 0, 1, 0.6039216, 1,
-0.1197351, 1.003938, -2.123741, 0, 1, 0.6117647, 1,
-0.1183281, -1.146792, -5.740633, 0, 1, 0.6156863, 1,
-0.1169191, 0.06758785, -1.706113, 0, 1, 0.6235294, 1,
-0.1137913, -0.3124019, -2.667196, 0, 1, 0.627451, 1,
-0.1097522, -0.1113444, -1.265298, 0, 1, 0.6352941, 1,
-0.1094402, 1.974833, 1.575461, 0, 1, 0.6392157, 1,
-0.10279, 1.567971, -0.4073964, 0, 1, 0.6470588, 1,
-0.09835292, -0.9853852, -2.493557, 0, 1, 0.6509804, 1,
-0.09811804, 0.4073588, -0.4107342, 0, 1, 0.6588235, 1,
-0.09710523, 0.8479072, -0.3003286, 0, 1, 0.6627451, 1,
-0.09642501, 1.445743, 0.6594962, 0, 1, 0.6705883, 1,
-0.08724871, 0.3046902, -1.531574, 0, 1, 0.6745098, 1,
-0.08678503, -0.7054309, -4.20379, 0, 1, 0.682353, 1,
-0.08560392, -1.417811, -3.295713, 0, 1, 0.6862745, 1,
-0.08370744, -0.5811625, -3.421384, 0, 1, 0.6941177, 1,
-0.08092913, -0.1982847, -3.856569, 0, 1, 0.7019608, 1,
-0.0769234, 0.8607132, -0.329579, 0, 1, 0.7058824, 1,
-0.0754205, 0.6443288, -0.5940329, 0, 1, 0.7137255, 1,
-0.07410972, -0.4695491, -2.33004, 0, 1, 0.7176471, 1,
-0.07266063, -0.6439183, -3.375836, 0, 1, 0.7254902, 1,
-0.06853162, -0.8714081, -3.537801, 0, 1, 0.7294118, 1,
-0.06720383, 1.041189, 0.7018905, 0, 1, 0.7372549, 1,
-0.06483993, 1.291705, -0.5407611, 0, 1, 0.7411765, 1,
-0.06212879, 1.27173, -0.3101685, 0, 1, 0.7490196, 1,
-0.06188661, -1.892318, -1.847213, 0, 1, 0.7529412, 1,
-0.05790084, 0.6851016, 0.4646026, 0, 1, 0.7607843, 1,
-0.05783193, -2.170702, -3.753825, 0, 1, 0.7647059, 1,
-0.05608903, -0.8405685, -2.755467, 0, 1, 0.772549, 1,
-0.05265735, 1.096307, -1.425082, 0, 1, 0.7764706, 1,
-0.04478761, -0.5964012, -0.862125, 0, 1, 0.7843137, 1,
-0.04200691, -0.728441, -2.847887, 0, 1, 0.7882353, 1,
-0.03535771, 1.167067, -1.140787, 0, 1, 0.7960784, 1,
-0.03430866, -0.3848433, -4.001508, 0, 1, 0.8039216, 1,
-0.0338932, 0.28519, 0.8921312, 0, 1, 0.8078431, 1,
-0.03357479, 1.34081, -0.1951431, 0, 1, 0.8156863, 1,
-0.02833285, 1.512308, -2.03257, 0, 1, 0.8196079, 1,
-0.02581825, -0.3639516, -2.917313, 0, 1, 0.827451, 1,
-0.0236937, -0.4394838, -4.274388, 0, 1, 0.8313726, 1,
-0.01704733, 0.3154911, 0.2108112, 0, 1, 0.8392157, 1,
-0.01450201, -1.209182, -3.779901, 0, 1, 0.8431373, 1,
-0.01043333, 0.7369767, 0.8521074, 0, 1, 0.8509804, 1,
-0.008613783, 0.07093709, 0.784363, 0, 1, 0.854902, 1,
-2.890098e-05, 0.197417, -0.200392, 0, 1, 0.8627451, 1,
0.002456554, -1.449125, 5.194419, 0, 1, 0.8666667, 1,
0.004760737, 0.518298, -0.6856838, 0, 1, 0.8745098, 1,
0.006783572, -0.769878, 2.187773, 0, 1, 0.8784314, 1,
0.008311265, -1.057553, 3.668991, 0, 1, 0.8862745, 1,
0.008687955, -0.4353047, 3.52509, 0, 1, 0.8901961, 1,
0.01146145, -0.9847069, 2.419768, 0, 1, 0.8980392, 1,
0.01149908, 0.4097482, -0.936751, 0, 1, 0.9058824, 1,
0.01150871, 0.8620879, -0.05561335, 0, 1, 0.9098039, 1,
0.01218577, 0.5072502, 0.2022732, 0, 1, 0.9176471, 1,
0.01844168, 0.3043498, 0.437841, 0, 1, 0.9215686, 1,
0.02396526, -0.6170091, 2.999596, 0, 1, 0.9294118, 1,
0.02554513, 0.7528249, 1.343221, 0, 1, 0.9333333, 1,
0.02629183, -0.5321695, 4.23198, 0, 1, 0.9411765, 1,
0.03412127, -2.347394, 2.981442, 0, 1, 0.945098, 1,
0.03504832, 1.733202, -0.3993966, 0, 1, 0.9529412, 1,
0.03525992, -0.06971179, 3.286679, 0, 1, 0.9568627, 1,
0.03875224, 0.3175743, 2.347749, 0, 1, 0.9647059, 1,
0.04430278, -0.3272301, 3.000332, 0, 1, 0.9686275, 1,
0.04980182, 0.04392895, 0.1720946, 0, 1, 0.9764706, 1,
0.05610908, 0.08500473, 0.8029636, 0, 1, 0.9803922, 1,
0.05654077, -0.3791375, 2.617568, 0, 1, 0.9882353, 1,
0.06042127, 0.1894032, 0.04008769, 0, 1, 0.9921569, 1,
0.06150692, -1.340928, 3.738297, 0, 1, 1, 1,
0.06301818, -0.3260117, 2.933446, 0, 0.9921569, 1, 1,
0.06318561, 0.768693, 1.266671, 0, 0.9882353, 1, 1,
0.06616405, 0.256779, -0.8790403, 0, 0.9803922, 1, 1,
0.06635801, -0.3103464, 2.376358, 0, 0.9764706, 1, 1,
0.06869034, -1.148645, 2.445024, 0, 0.9686275, 1, 1,
0.07018895, -2.027915, 4.201275, 0, 0.9647059, 1, 1,
0.07022583, 1.004441, 0.0752791, 0, 0.9568627, 1, 1,
0.07119636, -0.2040365, 3.535774, 0, 0.9529412, 1, 1,
0.07528684, 1.06013, -0.5200123, 0, 0.945098, 1, 1,
0.0771868, -0.8693625, 2.876642, 0, 0.9411765, 1, 1,
0.08123111, 0.344018, -0.4483647, 0, 0.9333333, 1, 1,
0.08200379, 1.889614, -2.031112, 0, 0.9294118, 1, 1,
0.08307695, 0.2034196, -0.05286632, 0, 0.9215686, 1, 1,
0.08317222, -0.3071408, 3.389477, 0, 0.9176471, 1, 1,
0.08651792, 1.720834, -0.1631899, 0, 0.9098039, 1, 1,
0.08712911, 0.2474756, -0.452938, 0, 0.9058824, 1, 1,
0.08940971, -0.7625329, 3.665556, 0, 0.8980392, 1, 1,
0.0909736, -0.1406325, 1.645016, 0, 0.8901961, 1, 1,
0.09221083, -0.1997568, 2.159159, 0, 0.8862745, 1, 1,
0.09310291, 1.110789, 0.7944232, 0, 0.8784314, 1, 1,
0.0984616, -0.5348812, 3.022753, 0, 0.8745098, 1, 1,
0.1014766, 0.946076, -2.065048, 0, 0.8666667, 1, 1,
0.102298, 0.4886688, 1.097436, 0, 0.8627451, 1, 1,
0.1055755, 1.07282, -0.5043255, 0, 0.854902, 1, 1,
0.1063968, 1.148938, 0.8293372, 0, 0.8509804, 1, 1,
0.110394, 0.494469, 0.3206872, 0, 0.8431373, 1, 1,
0.1127184, -0.7072676, 3.940796, 0, 0.8392157, 1, 1,
0.1190383, -0.3654116, 3.628406, 0, 0.8313726, 1, 1,
0.1221366, 1.156687, -0.2858531, 0, 0.827451, 1, 1,
0.1237756, -0.575833, 2.601785, 0, 0.8196079, 1, 1,
0.1259934, -0.05910398, 0.7309167, 0, 0.8156863, 1, 1,
0.1272094, 1.340698, 1.083097, 0, 0.8078431, 1, 1,
0.1293192, 0.6762195, -0.458107, 0, 0.8039216, 1, 1,
0.1324213, 1.221762, 1.56004, 0, 0.7960784, 1, 1,
0.1333968, -0.1608928, 1.517194, 0, 0.7882353, 1, 1,
0.1353475, 0.3852174, -0.1204883, 0, 0.7843137, 1, 1,
0.1357386, -1.034761, 4.302691, 0, 0.7764706, 1, 1,
0.1409178, 1.037917, 0.7912132, 0, 0.772549, 1, 1,
0.1436304, 0.5474823, 0.1167464, 0, 0.7647059, 1, 1,
0.1472083, 0.1294838, -0.7239766, 0, 0.7607843, 1, 1,
0.1516606, 0.5886174, 0.4445123, 0, 0.7529412, 1, 1,
0.1538038, -0.7907642, 1.640385, 0, 0.7490196, 1, 1,
0.156114, -0.751061, 2.824805, 0, 0.7411765, 1, 1,
0.1597578, -1.060116, 3.280429, 0, 0.7372549, 1, 1,
0.1597834, 1.723631, -0.1808686, 0, 0.7294118, 1, 1,
0.1621488, -0.8983322, 1.954331, 0, 0.7254902, 1, 1,
0.1624284, -1.852183, 2.395355, 0, 0.7176471, 1, 1,
0.1628985, -0.953703, 2.539087, 0, 0.7137255, 1, 1,
0.1647568, 0.7891005, 0.2370673, 0, 0.7058824, 1, 1,
0.164918, 1.72997, 2.216278, 0, 0.6980392, 1, 1,
0.1700689, 1.03513, -1.791915, 0, 0.6941177, 1, 1,
0.1701519, -0.489806, 2.462637, 0, 0.6862745, 1, 1,
0.1714632, -0.4657445, 2.395326, 0, 0.682353, 1, 1,
0.1731047, -0.4345032, 3.830077, 0, 0.6745098, 1, 1,
0.173901, -0.4328579, 1.158499, 0, 0.6705883, 1, 1,
0.1740735, -0.1072445, 1.373017, 0, 0.6627451, 1, 1,
0.1741039, 1.792769, 0.441701, 0, 0.6588235, 1, 1,
0.1773613, 0.7950293, 0.6436748, 0, 0.6509804, 1, 1,
0.185396, 1.128244, 1.42063, 0, 0.6470588, 1, 1,
0.1865722, -1.380863, 2.24454, 0, 0.6392157, 1, 1,
0.186725, 0.6503755, -1.488306, 0, 0.6352941, 1, 1,
0.1873752, -1.206055, 0.2725113, 0, 0.627451, 1, 1,
0.1883772, 0.7787596, 1.273187, 0, 0.6235294, 1, 1,
0.195471, 1.879904, 0.3375365, 0, 0.6156863, 1, 1,
0.1960096, -0.1112574, 3.861498, 0, 0.6117647, 1, 1,
0.1995084, -0.5092198, 2.92249, 0, 0.6039216, 1, 1,
0.1995556, -0.4520525, 1.959554, 0, 0.5960785, 1, 1,
0.1998435, -1.155352, 2.724123, 0, 0.5921569, 1, 1,
0.2117058, -0.03937913, 1.613439, 0, 0.5843138, 1, 1,
0.2166255, 1.312413, -0.4613738, 0, 0.5803922, 1, 1,
0.2234783, -1.151521, 3.605375, 0, 0.572549, 1, 1,
0.2267663, -0.2587903, 2.038835, 0, 0.5686275, 1, 1,
0.2272754, -0.02427315, 2.377504, 0, 0.5607843, 1, 1,
0.2292632, 0.3295137, -1.416614, 0, 0.5568628, 1, 1,
0.2375671, -0.4864087, 4.990866, 0, 0.5490196, 1, 1,
0.238083, -0.5727739, 3.065775, 0, 0.5450981, 1, 1,
0.2398454, 0.8477736, -0.4616083, 0, 0.5372549, 1, 1,
0.2406639, -0.3807165, 2.319734, 0, 0.5333334, 1, 1,
0.2416987, 0.6427563, -1.113385, 0, 0.5254902, 1, 1,
0.2448429, -0.2590077, 2.001513, 0, 0.5215687, 1, 1,
0.2459429, 1.551893, 0.4708453, 0, 0.5137255, 1, 1,
0.2477144, -0.4324355, 2.304283, 0, 0.509804, 1, 1,
0.2499507, -0.2093746, 2.966389, 0, 0.5019608, 1, 1,
0.251848, -0.9590294, 2.102881, 0, 0.4941176, 1, 1,
0.2540148, -1.973548, 4.39842, 0, 0.4901961, 1, 1,
0.2576599, -0.8714525, 2.978616, 0, 0.4823529, 1, 1,
0.2585208, -0.02955632, 0.3186206, 0, 0.4784314, 1, 1,
0.2619601, -0.1581039, 2.785532, 0, 0.4705882, 1, 1,
0.2675356, -1.151483, 4.092667, 0, 0.4666667, 1, 1,
0.27435, 0.08347843, -0.2159417, 0, 0.4588235, 1, 1,
0.2752261, 0.5952015, -0.6959827, 0, 0.454902, 1, 1,
0.2817578, 0.198299, 1.269259, 0, 0.4470588, 1, 1,
0.2908929, 0.367812, 0.9294635, 0, 0.4431373, 1, 1,
0.2919846, -1.37913, 3.552262, 0, 0.4352941, 1, 1,
0.2927357, -0.2167394, 2.489075, 0, 0.4313726, 1, 1,
0.2954283, 1.174436, 1.24526, 0, 0.4235294, 1, 1,
0.2978118, -1.179625, 4.450864, 0, 0.4196078, 1, 1,
0.2986291, 2.015583, 0.4042324, 0, 0.4117647, 1, 1,
0.2995234, 0.6200593, -0.2809079, 0, 0.4078431, 1, 1,
0.3018509, -0.7694746, 1.981636, 0, 0.4, 1, 1,
0.3029231, 0.2509581, 1.056105, 0, 0.3921569, 1, 1,
0.3052665, 0.7643462, -0.1940985, 0, 0.3882353, 1, 1,
0.3091818, -0.340897, 3.685809, 0, 0.3803922, 1, 1,
0.3098757, -0.6609766, 1.685641, 0, 0.3764706, 1, 1,
0.3099426, 0.7108158, 1.001174, 0, 0.3686275, 1, 1,
0.3107865, -2.044816, 2.115574, 0, 0.3647059, 1, 1,
0.3117404, -0.2147933, 1.978109, 0, 0.3568628, 1, 1,
0.3123443, -0.793558, 3.468685, 0, 0.3529412, 1, 1,
0.3154618, -0.07428518, 2.086784, 0, 0.345098, 1, 1,
0.3174707, -1.435339, 2.83631, 0, 0.3411765, 1, 1,
0.327874, 1.284225, 1.940566, 0, 0.3333333, 1, 1,
0.3355654, -0.1145766, 2.666066, 0, 0.3294118, 1, 1,
0.3385437, -0.4424958, 1.576723, 0, 0.3215686, 1, 1,
0.3404121, 0.759391, 0.8788358, 0, 0.3176471, 1, 1,
0.3438815, 0.7891812, 0.6139718, 0, 0.3098039, 1, 1,
0.3448934, -0.9853598, 2.31688, 0, 0.3058824, 1, 1,
0.3450803, 0.8190663, 0.7565839, 0, 0.2980392, 1, 1,
0.3581544, -1.020647, 2.225926, 0, 0.2901961, 1, 1,
0.3604289, -0.2326785, 2.345388, 0, 0.2862745, 1, 1,
0.3610068, 1.482743, -0.1204738, 0, 0.2784314, 1, 1,
0.3635002, -2.080258, 3.108272, 0, 0.2745098, 1, 1,
0.3698733, -0.5929255, 0.7227805, 0, 0.2666667, 1, 1,
0.3700736, -0.8010962, 2.184179, 0, 0.2627451, 1, 1,
0.3702242, -0.2238516, 2.722394, 0, 0.254902, 1, 1,
0.376382, -1.755077, 2.779084, 0, 0.2509804, 1, 1,
0.3803964, 1.069851, 1.885184, 0, 0.2431373, 1, 1,
0.384401, 1.541436, -1.599432, 0, 0.2392157, 1, 1,
0.3891097, 2.02023, 1.704088, 0, 0.2313726, 1, 1,
0.3892323, 0.309036, 2.30021, 0, 0.227451, 1, 1,
0.3935263, -1.214283, 2.557059, 0, 0.2196078, 1, 1,
0.3948638, 1.138173, -1.599221, 0, 0.2156863, 1, 1,
0.3959805, 0.4306661, -1.591881, 0, 0.2078431, 1, 1,
0.4009659, 0.7911701, -0.4100617, 0, 0.2039216, 1, 1,
0.4025873, 0.05416586, 1.103237, 0, 0.1960784, 1, 1,
0.4058565, 0.9021934, 0.3132885, 0, 0.1882353, 1, 1,
0.407158, 1.101126, 0.4595166, 0, 0.1843137, 1, 1,
0.4092257, -0.5017009, 2.503774, 0, 0.1764706, 1, 1,
0.4106159, 0.8541383, -0.5813133, 0, 0.172549, 1, 1,
0.4154671, 1.322899, 1.069069, 0, 0.1647059, 1, 1,
0.4196367, -1.0039, 4.062435, 0, 0.1607843, 1, 1,
0.4197198, 0.5670416, -1.457289, 0, 0.1529412, 1, 1,
0.4197794, -0.09728823, 1.485533, 0, 0.1490196, 1, 1,
0.4263847, -1.377779, 2.763701, 0, 0.1411765, 1, 1,
0.4311126, 0.1447494, -0.2052386, 0, 0.1372549, 1, 1,
0.4336703, -1.174208, 3.109768, 0, 0.1294118, 1, 1,
0.4349815, -0.4546615, 1.552641, 0, 0.1254902, 1, 1,
0.4396726, -0.595315, 2.569269, 0, 0.1176471, 1, 1,
0.441363, -2.674963, 2.309501, 0, 0.1137255, 1, 1,
0.4438111, 0.6724135, -2.73606, 0, 0.1058824, 1, 1,
0.4439656, 0.6630361, 0.4905339, 0, 0.09803922, 1, 1,
0.4493167, -0.0275931, 2.115508, 0, 0.09411765, 1, 1,
0.4497762, -0.0213658, 1.124629, 0, 0.08627451, 1, 1,
0.4520853, -0.6886341, 2.052585, 0, 0.08235294, 1, 1,
0.4588022, 0.3077739, 1.899885, 0, 0.07450981, 1, 1,
0.4609841, 2.438343, 0.06623945, 0, 0.07058824, 1, 1,
0.4645457, -1.770302, 4.4051, 0, 0.0627451, 1, 1,
0.466654, 0.08208515, 2.233757, 0, 0.05882353, 1, 1,
0.4696833, 0.7947082, 1.159963, 0, 0.05098039, 1, 1,
0.4710889, 0.4539802, 1.869615, 0, 0.04705882, 1, 1,
0.4716885, 0.2434391, 0.6563569, 0, 0.03921569, 1, 1,
0.4784164, -0.03183853, 2.342061, 0, 0.03529412, 1, 1,
0.4810389, -0.747494, 2.843966, 0, 0.02745098, 1, 1,
0.4881084, 1.407513, -0.3438496, 0, 0.02352941, 1, 1,
0.4883936, -1.300815, 1.500485, 0, 0.01568628, 1, 1,
0.4891362, 0.4544984, 2.102048, 0, 0.01176471, 1, 1,
0.4905038, -1.492697, 1.763881, 0, 0.003921569, 1, 1,
0.4917288, -1.195885, 3.876767, 0.003921569, 0, 1, 1,
0.4931099, 1.287954, 0.8438696, 0.007843138, 0, 1, 1,
0.494667, 0.286835, 1.727355, 0.01568628, 0, 1, 1,
0.4968771, -0.2605406, 1.683208, 0.01960784, 0, 1, 1,
0.5007473, -1.023929, 2.388677, 0.02745098, 0, 1, 1,
0.502219, -1.092286, 2.396542, 0.03137255, 0, 1, 1,
0.5025684, 1.075424, 1.065353, 0.03921569, 0, 1, 1,
0.5047961, -1.425425, 2.775808, 0.04313726, 0, 1, 1,
0.5052263, -0.4191063, 2.62397, 0.05098039, 0, 1, 1,
0.5066572, 0.283822, -0.08434562, 0.05490196, 0, 1, 1,
0.5068487, 0.1606587, 0.322399, 0.0627451, 0, 1, 1,
0.5099051, 1.359746, 0.2261991, 0.06666667, 0, 1, 1,
0.5140525, 0.1989717, 1.331105, 0.07450981, 0, 1, 1,
0.5175085, -1.814538, 1.345548, 0.07843138, 0, 1, 1,
0.5220487, -0.4007179, 2.30229, 0.08627451, 0, 1, 1,
0.5273691, -2.483482, 3.361767, 0.09019608, 0, 1, 1,
0.5300586, -0.1310719, 3.702533, 0.09803922, 0, 1, 1,
0.532122, -0.2064054, 2.26176, 0.1058824, 0, 1, 1,
0.5449373, -0.6099482, 2.799405, 0.1098039, 0, 1, 1,
0.5459449, 1.884579, -0.5888492, 0.1176471, 0, 1, 1,
0.5494046, -0.1752392, 3.223184, 0.1215686, 0, 1, 1,
0.5495845, -0.5202779, 2.984599, 0.1294118, 0, 1, 1,
0.5596741, 0.002033911, 0.9599369, 0.1333333, 0, 1, 1,
0.5615633, 0.3224232, 3.729529, 0.1411765, 0, 1, 1,
0.5635456, -0.8769727, 2.831302, 0.145098, 0, 1, 1,
0.5636832, 0.3086306, 0.1150102, 0.1529412, 0, 1, 1,
0.5648101, -2.511586, 3.768721, 0.1568628, 0, 1, 1,
0.566728, -0.8972536, 2.626872, 0.1647059, 0, 1, 1,
0.5741934, 0.4083145, 0.6851001, 0.1686275, 0, 1, 1,
0.5802315, 2.438019, 2.080436, 0.1764706, 0, 1, 1,
0.5863483, 1.129836, 0.7072699, 0.1803922, 0, 1, 1,
0.5889056, 0.8987463, 2.179675, 0.1882353, 0, 1, 1,
0.58981, -1.297336, 4.516244, 0.1921569, 0, 1, 1,
0.5907244, -0.8304374, 2.067767, 0.2, 0, 1, 1,
0.5930408, 0.1257357, 0.3098527, 0.2078431, 0, 1, 1,
0.5958791, 0.264194, -0.4003568, 0.2117647, 0, 1, 1,
0.5997804, -0.7868385, 2.73014, 0.2196078, 0, 1, 1,
0.6031686, 1.010606, 0.5501009, 0.2235294, 0, 1, 1,
0.60428, 1.171527, 0.1909615, 0.2313726, 0, 1, 1,
0.6043714, 0.818324, 0.4428659, 0.2352941, 0, 1, 1,
0.6060282, -1.781552, 4.205276, 0.2431373, 0, 1, 1,
0.6092133, 1.295026, 0.5951282, 0.2470588, 0, 1, 1,
0.6109808, -0.8082075, 2.377467, 0.254902, 0, 1, 1,
0.6125519, -1.988917, 2.369616, 0.2588235, 0, 1, 1,
0.6141287, 0.8236958, 3.346893, 0.2666667, 0, 1, 1,
0.617664, 0.5955933, 1.86168, 0.2705882, 0, 1, 1,
0.6255028, 2.568523, 0.6433619, 0.2784314, 0, 1, 1,
0.6257093, 0.08844234, 0.4533549, 0.282353, 0, 1, 1,
0.6263907, 1.632548, -0.05538034, 0.2901961, 0, 1, 1,
0.6329001, -1.198463, 4.06953, 0.2941177, 0, 1, 1,
0.633125, 1.592243, 0.2617989, 0.3019608, 0, 1, 1,
0.6331735, 2.936239, -3.589139, 0.3098039, 0, 1, 1,
0.6401528, 1.186148, 2.774429, 0.3137255, 0, 1, 1,
0.6433791, -0.3955394, 0.03924747, 0.3215686, 0, 1, 1,
0.6439283, -0.6432603, 2.841449, 0.3254902, 0, 1, 1,
0.6466954, -0.8696576, 1.966897, 0.3333333, 0, 1, 1,
0.650877, -0.8434139, 1.431682, 0.3372549, 0, 1, 1,
0.6516326, -0.1767533, 1.275952, 0.345098, 0, 1, 1,
0.6554638, 1.776778, 0.09216938, 0.3490196, 0, 1, 1,
0.6583974, -0.4824847, 2.186136, 0.3568628, 0, 1, 1,
0.6608137, -2.401296, 2.668781, 0.3607843, 0, 1, 1,
0.6638957, -0.6079242, 2.699504, 0.3686275, 0, 1, 1,
0.666555, 0.3527563, 0.01494326, 0.372549, 0, 1, 1,
0.6727082, 0.6256293, 2.209063, 0.3803922, 0, 1, 1,
0.6741445, 0.5870945, 1.937512, 0.3843137, 0, 1, 1,
0.676273, 1.747681, -0.6688498, 0.3921569, 0, 1, 1,
0.6771789, -0.5401602, 1.02272, 0.3960784, 0, 1, 1,
0.6776941, 0.5859777, 0.2497642, 0.4039216, 0, 1, 1,
0.6818212, -1.63558, 0.6346321, 0.4117647, 0, 1, 1,
0.6837609, 2.664456, -1.412658, 0.4156863, 0, 1, 1,
0.6882586, 1.256299, 0.1982285, 0.4235294, 0, 1, 1,
0.6888564, 1.228855, 0.09668747, 0.427451, 0, 1, 1,
0.690327, 1.259026, -2.372927, 0.4352941, 0, 1, 1,
0.6903273, -0.7040124, 0.9177368, 0.4392157, 0, 1, 1,
0.6908199, -0.3050448, 2.403662, 0.4470588, 0, 1, 1,
0.6953268, 1.102965, 2.507114, 0.4509804, 0, 1, 1,
0.6956607, -1.156861, 1.357121, 0.4588235, 0, 1, 1,
0.7003717, -0.4911436, 2.853908, 0.4627451, 0, 1, 1,
0.7009816, 0.9695229, 1.06554, 0.4705882, 0, 1, 1,
0.7038204, -0.7321514, 3.30638, 0.4745098, 0, 1, 1,
0.7045809, -0.1485675, 1.016343, 0.4823529, 0, 1, 1,
0.7072037, 0.1177031, 1.918444, 0.4862745, 0, 1, 1,
0.7095885, -0.1786906, 2.90346, 0.4941176, 0, 1, 1,
0.714096, 0.320724, 1.045523, 0.5019608, 0, 1, 1,
0.7144294, 0.9524043, -0.5243029, 0.5058824, 0, 1, 1,
0.7190274, 0.151516, 1.682385, 0.5137255, 0, 1, 1,
0.7204998, -0.6221809, 1.927477, 0.5176471, 0, 1, 1,
0.7229099, -0.6515314, 2.083728, 0.5254902, 0, 1, 1,
0.723802, -1.061633, 1.797506, 0.5294118, 0, 1, 1,
0.7257667, 0.4561837, 1.442023, 0.5372549, 0, 1, 1,
0.7269302, -0.2666603, 1.212889, 0.5411765, 0, 1, 1,
0.730305, 1.176659, -1.277478, 0.5490196, 0, 1, 1,
0.7319424, 1.155, -0.1065297, 0.5529412, 0, 1, 1,
0.7340379, -0.2802849, 1.446366, 0.5607843, 0, 1, 1,
0.750159, 2.066361, 1.618401, 0.5647059, 0, 1, 1,
0.7566971, -1.120953, 5.264729, 0.572549, 0, 1, 1,
0.7569612, -0.06615955, 1.235862, 0.5764706, 0, 1, 1,
0.7608867, -0.1626446, 1.727277, 0.5843138, 0, 1, 1,
0.7624791, -1.188505, 1.558442, 0.5882353, 0, 1, 1,
0.768155, 0.2118549, 0.2969711, 0.5960785, 0, 1, 1,
0.7684975, -0.8499268, 1.528446, 0.6039216, 0, 1, 1,
0.769116, 0.9203234, 1.326856, 0.6078432, 0, 1, 1,
0.7700567, -0.3264818, 0.6813703, 0.6156863, 0, 1, 1,
0.7703845, 1.219024, -0.06494849, 0.6196079, 0, 1, 1,
0.7738046, 1.044385, 0.1020588, 0.627451, 0, 1, 1,
0.7756707, -0.1873012, -0.2831933, 0.6313726, 0, 1, 1,
0.7760977, 1.06408, 0.5546831, 0.6392157, 0, 1, 1,
0.7872797, 0.9987895, 0.292493, 0.6431373, 0, 1, 1,
0.7887847, 0.2107227, 0.2071522, 0.6509804, 0, 1, 1,
0.7952877, 0.3686698, 1.873002, 0.654902, 0, 1, 1,
0.7954194, 1.010937, 1.522076, 0.6627451, 0, 1, 1,
0.7981333, -0.92462, 2.45738, 0.6666667, 0, 1, 1,
0.8045384, 0.9143701, 1.585518, 0.6745098, 0, 1, 1,
0.8138773, 1.057851, 1.141048, 0.6784314, 0, 1, 1,
0.823625, -0.2201212, 3.11993, 0.6862745, 0, 1, 1,
0.8331626, -1.843004, 1.616529, 0.6901961, 0, 1, 1,
0.8353822, -0.5587023, 1.555986, 0.6980392, 0, 1, 1,
0.8390558, -2.717904, 4.052196, 0.7058824, 0, 1, 1,
0.8449722, 1.203008, 2.995366, 0.7098039, 0, 1, 1,
0.8577322, 0.8290285, 1.366995, 0.7176471, 0, 1, 1,
0.8615783, -0.6173073, 0.9929923, 0.7215686, 0, 1, 1,
0.8620512, -0.6401232, 1.730834, 0.7294118, 0, 1, 1,
0.8671762, -0.9564345, 2.237685, 0.7333333, 0, 1, 1,
0.8710605, 0.3031723, 1.91527, 0.7411765, 0, 1, 1,
0.8745496, -0.514976, 3.006055, 0.7450981, 0, 1, 1,
0.8806227, -2.240677, 1.717273, 0.7529412, 0, 1, 1,
0.8829147, 2.420956, 0.02203193, 0.7568628, 0, 1, 1,
0.8847932, -1.69258, 2.82681, 0.7647059, 0, 1, 1,
0.8865958, -0.8413439, 3.438632, 0.7686275, 0, 1, 1,
0.8869655, 0.6106809, 0.850916, 0.7764706, 0, 1, 1,
0.8919131, 1.133983, 0.4466793, 0.7803922, 0, 1, 1,
0.8949338, 0.8835501, 0.7607322, 0.7882353, 0, 1, 1,
0.9027101, 0.4634448, 0.08651645, 0.7921569, 0, 1, 1,
0.9039009, 0.2826289, 1.721849, 0.8, 0, 1, 1,
0.9040229, 1.141286, 1.857636, 0.8078431, 0, 1, 1,
0.9098547, -0.2321351, 2.521028, 0.8117647, 0, 1, 1,
0.9099354, 0.08891678, -0.4023011, 0.8196079, 0, 1, 1,
0.9131073, 1.950264, 0.03972664, 0.8235294, 0, 1, 1,
0.9208985, -0.5824935, 2.382316, 0.8313726, 0, 1, 1,
0.9235138, -0.2436733, 1.064384, 0.8352941, 0, 1, 1,
0.9253449, -0.5315267, 1.783708, 0.8431373, 0, 1, 1,
0.9277506, -0.4003542, 1.026747, 0.8470588, 0, 1, 1,
0.9284942, 0.2542747, 0.4582209, 0.854902, 0, 1, 1,
0.935271, 0.8563427, 0.5787775, 0.8588235, 0, 1, 1,
0.9376087, -0.8195093, 0.839516, 0.8666667, 0, 1, 1,
0.9376937, 1.742807, 3.517418, 0.8705882, 0, 1, 1,
0.9404327, 0.688032, 1.267471, 0.8784314, 0, 1, 1,
0.9430524, 0.5049307, 1.034309, 0.8823529, 0, 1, 1,
0.9465317, 0.4378586, 2.344187, 0.8901961, 0, 1, 1,
0.9511282, -0.6814407, 3.318264, 0.8941177, 0, 1, 1,
0.9567561, -2.366739, 1.690115, 0.9019608, 0, 1, 1,
0.9632066, 0.8478851, 0.1081556, 0.9098039, 0, 1, 1,
0.9663851, 0.4622524, 1.103842, 0.9137255, 0, 1, 1,
0.9667146, -0.3541979, 3.778605, 0.9215686, 0, 1, 1,
0.9671817, -0.5882304, 0.7688826, 0.9254902, 0, 1, 1,
0.9722006, -0.02822145, 0.4603592, 0.9333333, 0, 1, 1,
0.9751624, 1.411708, 1.985766, 0.9372549, 0, 1, 1,
0.9784642, -1.895063, 3.08938, 0.945098, 0, 1, 1,
0.9787532, -0.2663846, 1.601192, 0.9490196, 0, 1, 1,
0.9835648, 0.05037213, -0.02380511, 0.9568627, 0, 1, 1,
0.9869423, -0.4622327, 3.704767, 0.9607843, 0, 1, 1,
0.9892895, -0.5894325, 2.655553, 0.9686275, 0, 1, 1,
0.9910775, 0.3680304, -0.04957553, 0.972549, 0, 1, 1,
0.9917886, 1.911642, -0.7177148, 0.9803922, 0, 1, 1,
0.9919145, 0.3447983, 2.244227, 0.9843137, 0, 1, 1,
0.993574, -0.5519316, 2.471356, 0.9921569, 0, 1, 1,
0.9960204, -0.2630407, 3.435266, 0.9960784, 0, 1, 1,
1.001902, -0.09785202, 1.545574, 1, 0, 0.9960784, 1,
1.004562, 1.545021, -0.1485347, 1, 0, 0.9882353, 1,
1.00674, 0.7578752, 1.289878, 1, 0, 0.9843137, 1,
1.008549, -0.1912948, 1.471708, 1, 0, 0.9764706, 1,
1.013745, 0.7363616, 2.979403, 1, 0, 0.972549, 1,
1.014705, -0.1901582, 2.211303, 1, 0, 0.9647059, 1,
1.020934, -0.5356452, 3.018666, 1, 0, 0.9607843, 1,
1.035127, -0.2049122, 0.9178333, 1, 0, 0.9529412, 1,
1.037289, -2.17251, 3.184634, 1, 0, 0.9490196, 1,
1.041338, 0.4112, 1.910061, 1, 0, 0.9411765, 1,
1.049587, 0.6991004, 2.449688, 1, 0, 0.9372549, 1,
1.054984, 0.3786236, 1.251047, 1, 0, 0.9294118, 1,
1.058677, -1.823409, 2.938577, 1, 0, 0.9254902, 1,
1.060594, 0.5644444, 3.647047, 1, 0, 0.9176471, 1,
1.066747, -0.5396554, 1.080761, 1, 0, 0.9137255, 1,
1.077229, 0.6167831, 2.392954, 1, 0, 0.9058824, 1,
1.08069, -2.126735, 1.285544, 1, 0, 0.9019608, 1,
1.081182, 2.728308, -0.1622213, 1, 0, 0.8941177, 1,
1.081199, 0.3941178, 2.541769, 1, 0, 0.8862745, 1,
1.085553, 0.5569058, 0.3821324, 1, 0, 0.8823529, 1,
1.091411, 0.2437731, -0.0042097, 1, 0, 0.8745098, 1,
1.093087, -1.129503, 3.611681, 1, 0, 0.8705882, 1,
1.102423, 0.1766932, 0.6844992, 1, 0, 0.8627451, 1,
1.126007, -2.57443, 2.839035, 1, 0, 0.8588235, 1,
1.131966, 1.137707, 0.560176, 1, 0, 0.8509804, 1,
1.133312, 1.933801, 1.626362, 1, 0, 0.8470588, 1,
1.133759, 2.398793, -0.8051137, 1, 0, 0.8392157, 1,
1.135052, 1.119034, -0.524357, 1, 0, 0.8352941, 1,
1.140159, -1.407485, 2.149514, 1, 0, 0.827451, 1,
1.141796, 0.5048596, 0.2822973, 1, 0, 0.8235294, 1,
1.156356, -0.5135754, 5.16463, 1, 0, 0.8156863, 1,
1.158221, -1.075317, 3.847505, 1, 0, 0.8117647, 1,
1.161871, 0.2522628, 2.544717, 1, 0, 0.8039216, 1,
1.162501, 0.6816425, 0.8820203, 1, 0, 0.7960784, 1,
1.162886, 0.4888622, 0.7449698, 1, 0, 0.7921569, 1,
1.164861, 2.088989, 1.943667, 1, 0, 0.7843137, 1,
1.170792, -0.7786029, 3.710084, 1, 0, 0.7803922, 1,
1.175944, -0.3609643, 2.794192, 1, 0, 0.772549, 1,
1.177107, 0.05403665, 1.087714, 1, 0, 0.7686275, 1,
1.180016, -0.678666, 0.9583551, 1, 0, 0.7607843, 1,
1.1893, -0.6215633, 3.822989, 1, 0, 0.7568628, 1,
1.19283, -1.478378, 2.278986, 1, 0, 0.7490196, 1,
1.197861, -1.26885, 2.928432, 1, 0, 0.7450981, 1,
1.202059, -0.7198136, 3.646548, 1, 0, 0.7372549, 1,
1.204544, 1.448034, -0.0523157, 1, 0, 0.7333333, 1,
1.204791, -1.381786, 2.050988, 1, 0, 0.7254902, 1,
1.216997, -0.4276896, 1.731735, 1, 0, 0.7215686, 1,
1.22777, 0.4938757, 0.9681306, 1, 0, 0.7137255, 1,
1.237686, 0.6429242, 0.2489423, 1, 0, 0.7098039, 1,
1.250554, 0.3959081, 3.0771, 1, 0, 0.7019608, 1,
1.252541, 0.4656541, 1.546995, 1, 0, 0.6941177, 1,
1.253664, 0.5480757, 0.965349, 1, 0, 0.6901961, 1,
1.264167, 0.6339896, 0.1813659, 1, 0, 0.682353, 1,
1.267869, -0.6218198, 3.604542, 1, 0, 0.6784314, 1,
1.270944, 3.234417, 0.07360003, 1, 0, 0.6705883, 1,
1.274468, -1.283986, 4.684281, 1, 0, 0.6666667, 1,
1.279472, -1.359425, 1.31348, 1, 0, 0.6588235, 1,
1.285655, -1.44255, 2.076807, 1, 0, 0.654902, 1,
1.287788, -0.3752889, 1.154946, 1, 0, 0.6470588, 1,
1.297475, 1.619404, 0.4567482, 1, 0, 0.6431373, 1,
1.301413, -2.177846, 3.805909, 1, 0, 0.6352941, 1,
1.301779, -0.5443813, 2.326783, 1, 0, 0.6313726, 1,
1.301902, -1.20421, 4.022144, 1, 0, 0.6235294, 1,
1.305506, 0.207302, 0.3961885, 1, 0, 0.6196079, 1,
1.311198, 0.4758857, 2.311367, 1, 0, 0.6117647, 1,
1.324438, -0.006901268, 1.887726, 1, 0, 0.6078432, 1,
1.334872, -0.3090849, 1.694751, 1, 0, 0.6, 1,
1.33817, -0.7282145, 1.571003, 1, 0, 0.5921569, 1,
1.340147, 0.2664369, -0.313259, 1, 0, 0.5882353, 1,
1.353568, 1.228508, 0.6029175, 1, 0, 0.5803922, 1,
1.362936, 1.890388, -1.322757, 1, 0, 0.5764706, 1,
1.36572, -0.1686723, 1.28189, 1, 0, 0.5686275, 1,
1.367428, -0.3753659, 2.955661, 1, 0, 0.5647059, 1,
1.367757, 0.0608959, 1.897377, 1, 0, 0.5568628, 1,
1.379147, 0.2500097, 0.2539707, 1, 0, 0.5529412, 1,
1.390863, -2.441141, 2.849195, 1, 0, 0.5450981, 1,
1.391203, 0.3126379, 0.7634684, 1, 0, 0.5411765, 1,
1.397965, 0.04096723, 0.6379105, 1, 0, 0.5333334, 1,
1.400221, 0.7340692, 0.7486496, 1, 0, 0.5294118, 1,
1.415739, -2.205127, 0.9498045, 1, 0, 0.5215687, 1,
1.420111, -0.9049353, 1.91423, 1, 0, 0.5176471, 1,
1.421757, -0.8362321, 2.331092, 1, 0, 0.509804, 1,
1.423601, -0.08172552, 3.785574, 1, 0, 0.5058824, 1,
1.427976, -0.4811276, 0.4264066, 1, 0, 0.4980392, 1,
1.430321, -0.419687, 1.04303, 1, 0, 0.4901961, 1,
1.431672, 0.7753309, 2.235988, 1, 0, 0.4862745, 1,
1.433341, -0.3478703, 1.360005, 1, 0, 0.4784314, 1,
1.436732, 0.5303552, 0.3600182, 1, 0, 0.4745098, 1,
1.448562, -1.234773, 1.944319, 1, 0, 0.4666667, 1,
1.453017, 0.9945481, -1.099643, 1, 0, 0.4627451, 1,
1.461741, -0.8167571, 2.728444, 1, 0, 0.454902, 1,
1.466574, 0.232346, -0.1686752, 1, 0, 0.4509804, 1,
1.47546, -0.9352313, 1.04861, 1, 0, 0.4431373, 1,
1.476364, -0.08136556, 2.527717, 1, 0, 0.4392157, 1,
1.487092, 0.7573905, 3.122161, 1, 0, 0.4313726, 1,
1.493986, 0.5327744, -0.08818371, 1, 0, 0.427451, 1,
1.530724, -1.030431, 3.28425, 1, 0, 0.4196078, 1,
1.55481, 1.067442, 1.15952, 1, 0, 0.4156863, 1,
1.555082, -0.06195697, 1.131187, 1, 0, 0.4078431, 1,
1.561794, -0.03838665, 2.239972, 1, 0, 0.4039216, 1,
1.56331, 0.2519825, 0.01024571, 1, 0, 0.3960784, 1,
1.586814, 0.6054701, 1.008658, 1, 0, 0.3882353, 1,
1.593379, 1.018837, 0.661225, 1, 0, 0.3843137, 1,
1.601454, 0.1346427, 0.3124563, 1, 0, 0.3764706, 1,
1.609675, 1.018267, -0.8669854, 1, 0, 0.372549, 1,
1.615476, -0.1095776, 1.542569, 1, 0, 0.3647059, 1,
1.618806, 0.5980803, 0.5840803, 1, 0, 0.3607843, 1,
1.630679, -0.4592996, 3.72384, 1, 0, 0.3529412, 1,
1.650704, 0.3151942, 1.620605, 1, 0, 0.3490196, 1,
1.651311, 0.2098789, 0.003783135, 1, 0, 0.3411765, 1,
1.657753, -0.2188779, 2.401309, 1, 0, 0.3372549, 1,
1.664588, 0.4400145, 1.863572, 1, 0, 0.3294118, 1,
1.671203, 0.5750667, 1.606264, 1, 0, 0.3254902, 1,
1.676383, 0.157017, 2.200499, 1, 0, 0.3176471, 1,
1.677046, -1.595993, 1.822368, 1, 0, 0.3137255, 1,
1.678012, 0.5674528, -0.1735169, 1, 0, 0.3058824, 1,
1.68314, 1.192089, 0.6420062, 1, 0, 0.2980392, 1,
1.696534, -1.443968, 2.853272, 1, 0, 0.2941177, 1,
1.703953, -0.5081282, 1.001889, 1, 0, 0.2862745, 1,
1.703973, 1.288672, -0.5027213, 1, 0, 0.282353, 1,
1.706873, -1.410618, 1.218691, 1, 0, 0.2745098, 1,
1.715596, -1.273995, 0.5455561, 1, 0, 0.2705882, 1,
1.717485, -1.019307, 0.9332026, 1, 0, 0.2627451, 1,
1.727559, 0.2528244, 2.333184, 1, 0, 0.2588235, 1,
1.734546, 1.733133, 1.590679, 1, 0, 0.2509804, 1,
1.735064, 0.2954613, 1.485004, 1, 0, 0.2470588, 1,
1.740981, -0.8035482, 2.528646, 1, 0, 0.2392157, 1,
1.756362, -0.5123019, 0.8888773, 1, 0, 0.2352941, 1,
1.7824, 1.313976, 1.117162, 1, 0, 0.227451, 1,
1.802041, 0.1974649, 1.171803, 1, 0, 0.2235294, 1,
1.826857, -0.3160141, 1.79168, 1, 0, 0.2156863, 1,
1.837898, 0.08419247, 1.16056, 1, 0, 0.2117647, 1,
1.843209, -0.8244877, 2.196264, 1, 0, 0.2039216, 1,
1.84619, 0.2852898, 0.8160205, 1, 0, 0.1960784, 1,
1.889569, 1.225599, 0.4122085, 1, 0, 0.1921569, 1,
1.892625, 2.015938, -0.01959921, 1, 0, 0.1843137, 1,
1.916926, -2.111339, 4.595251, 1, 0, 0.1803922, 1,
1.919838, -1.32708, 1.88075, 1, 0, 0.172549, 1,
1.931561, 0.04513083, 1.760643, 1, 0, 0.1686275, 1,
1.936787, 0.4014213, 0.6674097, 1, 0, 0.1607843, 1,
1.958228, 0.07176853, 2.202778, 1, 0, 0.1568628, 1,
1.971146, -0.02502267, 2.087057, 1, 0, 0.1490196, 1,
1.976725, -1.25678, 3.854079, 1, 0, 0.145098, 1,
2.006216, 1.08438, 1.532489, 1, 0, 0.1372549, 1,
2.024553, -2.27461, 2.839863, 1, 0, 0.1333333, 1,
2.032646, -0.2154416, 1.901176, 1, 0, 0.1254902, 1,
2.034721, -0.7014223, 1.555346, 1, 0, 0.1215686, 1,
2.055051, -0.3074678, 3.740633, 1, 0, 0.1137255, 1,
2.066844, 0.9975582, 1.125227, 1, 0, 0.1098039, 1,
2.120845, 0.3427909, 0.395313, 1, 0, 0.1019608, 1,
2.130059, 0.1370025, 2.225135, 1, 0, 0.09411765, 1,
2.145291, -2.347424, 1.957265, 1, 0, 0.09019608, 1,
2.148599, -1.446635, 1.765441, 1, 0, 0.08235294, 1,
2.189645, 0.6657202, 2.134804, 1, 0, 0.07843138, 1,
2.347533, -1.133376, 1.810439, 1, 0, 0.07058824, 1,
2.363764, -0.5694339, 1.174001, 1, 0, 0.06666667, 1,
2.366438, -0.7297124, -0.2762246, 1, 0, 0.05882353, 1,
2.452282, 2.521789, 1.307195, 1, 0, 0.05490196, 1,
2.507587, -0.7403036, 2.188628, 1, 0, 0.04705882, 1,
2.609889, 0.6559685, 0.5571402, 1, 0, 0.04313726, 1,
2.701607, -0.6612393, 1.586618, 1, 0, 0.03529412, 1,
2.796527, 1.638314, 0.5559832, 1, 0, 0.03137255, 1,
2.821224, 0.05566937, 0.9739462, 1, 0, 0.02352941, 1,
2.889251, 2.201823, 0.359187, 1, 0, 0.01960784, 1,
3.083223, -1.870364, 0.8404675, 1, 0, 0.01176471, 1,
3.474083, -1.362459, 2.010304, 1, 0, 0.007843138, 1
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
0.08573496, -3.851686, -7.606042, 0, -0.5, 0.5, 0.5,
0.08573496, -3.851686, -7.606042, 1, -0.5, 0.5, 0.5,
0.08573496, -3.851686, -7.606042, 1, 1.5, 0.5, 0.5,
0.08573496, -3.851686, -7.606042, 0, 1.5, 0.5, 0.5
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
-4.451263, 0.3213625, -7.606042, 0, -0.5, 0.5, 0.5,
-4.451263, 0.3213625, -7.606042, 1, -0.5, 0.5, 0.5,
-4.451263, 0.3213625, -7.606042, 1, 1.5, 0.5, 0.5,
-4.451263, 0.3213625, -7.606042, 0, 1.5, 0.5, 0.5
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
-4.451263, -3.851686, -0.237952, 0, -0.5, 0.5, 0.5,
-4.451263, -3.851686, -0.237952, 1, -0.5, 0.5, 0.5,
-4.451263, -3.851686, -0.237952, 1, 1.5, 0.5, 0.5,
-4.451263, -3.851686, -0.237952, 0, 1.5, 0.5, 0.5
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
-3, -2.888675, -5.905714,
3, -2.888675, -5.905714,
-3, -2.888675, -5.905714,
-3, -3.049177, -6.189102,
-2, -2.888675, -5.905714,
-2, -3.049177, -6.189102,
-1, -2.888675, -5.905714,
-1, -3.049177, -6.189102,
0, -2.888675, -5.905714,
0, -3.049177, -6.189102,
1, -2.888675, -5.905714,
1, -3.049177, -6.189102,
2, -2.888675, -5.905714,
2, -3.049177, -6.189102,
3, -2.888675, -5.905714,
3, -3.049177, -6.189102
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
-3, -3.370181, -6.755877, 0, -0.5, 0.5, 0.5,
-3, -3.370181, -6.755877, 1, -0.5, 0.5, 0.5,
-3, -3.370181, -6.755877, 1, 1.5, 0.5, 0.5,
-3, -3.370181, -6.755877, 0, 1.5, 0.5, 0.5,
-2, -3.370181, -6.755877, 0, -0.5, 0.5, 0.5,
-2, -3.370181, -6.755877, 1, -0.5, 0.5, 0.5,
-2, -3.370181, -6.755877, 1, 1.5, 0.5, 0.5,
-2, -3.370181, -6.755877, 0, 1.5, 0.5, 0.5,
-1, -3.370181, -6.755877, 0, -0.5, 0.5, 0.5,
-1, -3.370181, -6.755877, 1, -0.5, 0.5, 0.5,
-1, -3.370181, -6.755877, 1, 1.5, 0.5, 0.5,
-1, -3.370181, -6.755877, 0, 1.5, 0.5, 0.5,
0, -3.370181, -6.755877, 0, -0.5, 0.5, 0.5,
0, -3.370181, -6.755877, 1, -0.5, 0.5, 0.5,
0, -3.370181, -6.755877, 1, 1.5, 0.5, 0.5,
0, -3.370181, -6.755877, 0, 1.5, 0.5, 0.5,
1, -3.370181, -6.755877, 0, -0.5, 0.5, 0.5,
1, -3.370181, -6.755877, 1, -0.5, 0.5, 0.5,
1, -3.370181, -6.755877, 1, 1.5, 0.5, 0.5,
1, -3.370181, -6.755877, 0, 1.5, 0.5, 0.5,
2, -3.370181, -6.755877, 0, -0.5, 0.5, 0.5,
2, -3.370181, -6.755877, 1, -0.5, 0.5, 0.5,
2, -3.370181, -6.755877, 1, 1.5, 0.5, 0.5,
2, -3.370181, -6.755877, 0, 1.5, 0.5, 0.5,
3, -3.370181, -6.755877, 0, -0.5, 0.5, 0.5,
3, -3.370181, -6.755877, 1, -0.5, 0.5, 0.5,
3, -3.370181, -6.755877, 1, 1.5, 0.5, 0.5,
3, -3.370181, -6.755877, 0, 1.5, 0.5, 0.5
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
-3.404264, -2, -5.905714,
-3.404264, 3, -5.905714,
-3.404264, -2, -5.905714,
-3.578764, -2, -6.189102,
-3.404264, -1, -5.905714,
-3.578764, -1, -6.189102,
-3.404264, 0, -5.905714,
-3.578764, 0, -6.189102,
-3.404264, 1, -5.905714,
-3.578764, 1, -6.189102,
-3.404264, 2, -5.905714,
-3.578764, 2, -6.189102,
-3.404264, 3, -5.905714,
-3.578764, 3, -6.189102
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
-3.927764, -2, -6.755877, 0, -0.5, 0.5, 0.5,
-3.927764, -2, -6.755877, 1, -0.5, 0.5, 0.5,
-3.927764, -2, -6.755877, 1, 1.5, 0.5, 0.5,
-3.927764, -2, -6.755877, 0, 1.5, 0.5, 0.5,
-3.927764, -1, -6.755877, 0, -0.5, 0.5, 0.5,
-3.927764, -1, -6.755877, 1, -0.5, 0.5, 0.5,
-3.927764, -1, -6.755877, 1, 1.5, 0.5, 0.5,
-3.927764, -1, -6.755877, 0, 1.5, 0.5, 0.5,
-3.927764, 0, -6.755877, 0, -0.5, 0.5, 0.5,
-3.927764, 0, -6.755877, 1, -0.5, 0.5, 0.5,
-3.927764, 0, -6.755877, 1, 1.5, 0.5, 0.5,
-3.927764, 0, -6.755877, 0, 1.5, 0.5, 0.5,
-3.927764, 1, -6.755877, 0, -0.5, 0.5, 0.5,
-3.927764, 1, -6.755877, 1, -0.5, 0.5, 0.5,
-3.927764, 1, -6.755877, 1, 1.5, 0.5, 0.5,
-3.927764, 1, -6.755877, 0, 1.5, 0.5, 0.5,
-3.927764, 2, -6.755877, 0, -0.5, 0.5, 0.5,
-3.927764, 2, -6.755877, 1, -0.5, 0.5, 0.5,
-3.927764, 2, -6.755877, 1, 1.5, 0.5, 0.5,
-3.927764, 2, -6.755877, 0, 1.5, 0.5, 0.5,
-3.927764, 3, -6.755877, 0, -0.5, 0.5, 0.5,
-3.927764, 3, -6.755877, 1, -0.5, 0.5, 0.5,
-3.927764, 3, -6.755877, 1, 1.5, 0.5, 0.5,
-3.927764, 3, -6.755877, 0, 1.5, 0.5, 0.5
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
-3.404264, -2.888675, -4,
-3.404264, -2.888675, 4,
-3.404264, -2.888675, -4,
-3.578764, -3.049177, -4,
-3.404264, -2.888675, -2,
-3.578764, -3.049177, -2,
-3.404264, -2.888675, 0,
-3.578764, -3.049177, 0,
-3.404264, -2.888675, 2,
-3.578764, -3.049177, 2,
-3.404264, -2.888675, 4,
-3.578764, -3.049177, 4
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
-3.927764, -3.370181, -4, 0, -0.5, 0.5, 0.5,
-3.927764, -3.370181, -4, 1, -0.5, 0.5, 0.5,
-3.927764, -3.370181, -4, 1, 1.5, 0.5, 0.5,
-3.927764, -3.370181, -4, 0, 1.5, 0.5, 0.5,
-3.927764, -3.370181, -2, 0, -0.5, 0.5, 0.5,
-3.927764, -3.370181, -2, 1, -0.5, 0.5, 0.5,
-3.927764, -3.370181, -2, 1, 1.5, 0.5, 0.5,
-3.927764, -3.370181, -2, 0, 1.5, 0.5, 0.5,
-3.927764, -3.370181, 0, 0, -0.5, 0.5, 0.5,
-3.927764, -3.370181, 0, 1, -0.5, 0.5, 0.5,
-3.927764, -3.370181, 0, 1, 1.5, 0.5, 0.5,
-3.927764, -3.370181, 0, 0, 1.5, 0.5, 0.5,
-3.927764, -3.370181, 2, 0, -0.5, 0.5, 0.5,
-3.927764, -3.370181, 2, 1, -0.5, 0.5, 0.5,
-3.927764, -3.370181, 2, 1, 1.5, 0.5, 0.5,
-3.927764, -3.370181, 2, 0, 1.5, 0.5, 0.5,
-3.927764, -3.370181, 4, 0, -0.5, 0.5, 0.5,
-3.927764, -3.370181, 4, 1, -0.5, 0.5, 0.5,
-3.927764, -3.370181, 4, 1, 1.5, 0.5, 0.5,
-3.927764, -3.370181, 4, 0, 1.5, 0.5, 0.5
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
-3.404264, -2.888675, -5.905714,
-3.404264, 3.5314, -5.905714,
-3.404264, -2.888675, 5.42981,
-3.404264, 3.5314, 5.42981,
-3.404264, -2.888675, -5.905714,
-3.404264, -2.888675, 5.42981,
-3.404264, 3.5314, -5.905714,
-3.404264, 3.5314, 5.42981,
-3.404264, -2.888675, -5.905714,
3.575734, -2.888675, -5.905714,
-3.404264, -2.888675, 5.42981,
3.575734, -2.888675, 5.42981,
-3.404264, 3.5314, -5.905714,
3.575734, 3.5314, -5.905714,
-3.404264, 3.5314, 5.42981,
3.575734, 3.5314, 5.42981,
3.575734, -2.888675, -5.905714,
3.575734, 3.5314, -5.905714,
3.575734, -2.888675, 5.42981,
3.575734, 3.5314, 5.42981,
3.575734, -2.888675, -5.905714,
3.575734, -2.888675, 5.42981,
3.575734, 3.5314, -5.905714,
3.575734, 3.5314, 5.42981
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
var radius = 7.891933;
var distance = 35.1121;
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
mvMatrix.translate( -0.08573496, -0.3213625, 0.237952 );
mvMatrix.scale( 1.222481, 1.329099, 0.7527586 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.1121);
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
fluazuron<-read.table("fluazuron.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-fluazuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'fluazuron' not found
```

```r
y<-fluazuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'fluazuron' not found
```

```r
z<-fluazuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'fluazuron' not found
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
-3.302613, 0.4202099, -1.545787, 0, 0, 1, 1, 1,
-2.996873, -1.392148, -1.869938, 1, 0, 0, 1, 1,
-2.511087, 0.3436562, -0.7260631, 1, 0, 0, 1, 1,
-2.510003, 0.5712045, -2.54204, 1, 0, 0, 1, 1,
-2.484957, 0.7095963, -2.404181, 1, 0, 0, 1, 1,
-2.473641, -0.4440593, -1.187698, 1, 0, 0, 1, 1,
-2.469069, -0.4405096, -1.802658, 0, 0, 0, 1, 1,
-2.460369, 1.138904, 0.08676977, 0, 0, 0, 1, 1,
-2.280104, 0.7477549, -1.510532, 0, 0, 0, 1, 1,
-2.267949, -1.247809, -1.686392, 0, 0, 0, 1, 1,
-2.226781, 0.5597029, -1.696136, 0, 0, 0, 1, 1,
-2.216455, 0.1054541, -2.276816, 0, 0, 0, 1, 1,
-2.183403, 0.6415472, -0.4835869, 0, 0, 0, 1, 1,
-2.169464, 1.731741, 0.01413394, 1, 1, 1, 1, 1,
-2.134301, 2.23709, -0.9119917, 1, 1, 1, 1, 1,
-2.131536, 0.4785541, -1.4818, 1, 1, 1, 1, 1,
-2.124749, 0.1765544, -0.1829669, 1, 1, 1, 1, 1,
-2.062892, 0.4442925, 0.07871324, 1, 1, 1, 1, 1,
-2.047995, -1.415887, -2.111495, 1, 1, 1, 1, 1,
-2.037435, -1.78534, -2.005678, 1, 1, 1, 1, 1,
-1.985564, -1.397299, -2.698926, 1, 1, 1, 1, 1,
-1.970394, 0.2901804, -0.2519659, 1, 1, 1, 1, 1,
-1.965417, -0.7847368, -1.136086, 1, 1, 1, 1, 1,
-1.939745, -0.8975651, -0.3111475, 1, 1, 1, 1, 1,
-1.938883, -0.02651823, -1.102504, 1, 1, 1, 1, 1,
-1.913264, 0.4857562, -0.6678278, 1, 1, 1, 1, 1,
-1.905946, 1.925802, 0.6673496, 1, 1, 1, 1, 1,
-1.890745, -0.4869905, -2.515988, 1, 1, 1, 1, 1,
-1.886879, 0.3272493, 0.04542026, 0, 0, 1, 1, 1,
-1.86399, -0.4504516, -0.2058629, 1, 0, 0, 1, 1,
-1.852125, -0.5018316, -3.001173, 1, 0, 0, 1, 1,
-1.823832, -0.6543707, -2.572746, 1, 0, 0, 1, 1,
-1.820949, -0.6158212, -1.121579, 1, 0, 0, 1, 1,
-1.813514, 0.2911912, -2.199016, 1, 0, 0, 1, 1,
-1.794146, 2.438252, -0.01629543, 0, 0, 0, 1, 1,
-1.791724, 0.8852291, 0.4683915, 0, 0, 0, 1, 1,
-1.784079, -0.1355891, -1.609287, 0, 0, 0, 1, 1,
-1.755161, 0.6779873, -2.859664, 0, 0, 0, 1, 1,
-1.749657, -0.7087197, -1.366282, 0, 0, 0, 1, 1,
-1.720079, 0.714519, -1.374382, 0, 0, 0, 1, 1,
-1.692285, -0.7005661, -1.95492, 0, 0, 0, 1, 1,
-1.685776, -0.3292318, 0.386352, 1, 1, 1, 1, 1,
-1.674494, 1.15875, -1.916758, 1, 1, 1, 1, 1,
-1.66835, -0.2740468, -2.983613, 1, 1, 1, 1, 1,
-1.66578, -0.147225, -0.9594725, 1, 1, 1, 1, 1,
-1.661995, 0.08637919, -1.757772, 1, 1, 1, 1, 1,
-1.659151, -0.5088295, -3.959048, 1, 1, 1, 1, 1,
-1.658153, -0.1221528, -0.5565701, 1, 1, 1, 1, 1,
-1.652358, 0.8066238, -1.058304, 1, 1, 1, 1, 1,
-1.639637, 0.4416497, -0.1614025, 1, 1, 1, 1, 1,
-1.637833, 0.9992232, -3.886389, 1, 1, 1, 1, 1,
-1.628985, 0.744054, -1.235673, 1, 1, 1, 1, 1,
-1.624089, -1.028019, -2.425729, 1, 1, 1, 1, 1,
-1.598692, 0.4675602, -1.401714, 1, 1, 1, 1, 1,
-1.58747, -1.315453, -2.341141, 1, 1, 1, 1, 1,
-1.563736, -0.7327833, -2.654771, 1, 1, 1, 1, 1,
-1.54195, 0.05051944, -0.6488111, 0, 0, 1, 1, 1,
-1.521516, -0.9080055, -1.494153, 1, 0, 0, 1, 1,
-1.511972, -0.03472814, -0.5676523, 1, 0, 0, 1, 1,
-1.502301, -0.7498863, -3.170766, 1, 0, 0, 1, 1,
-1.482942, 0.6365792, 0.6975285, 1, 0, 0, 1, 1,
-1.480286, 1.62996, -1.651823, 1, 0, 0, 1, 1,
-1.478783, -0.5447605, -2.005527, 0, 0, 0, 1, 1,
-1.471512, 0.0190818, -2.336999, 0, 0, 0, 1, 1,
-1.471436, 2.047573, -1.417879, 0, 0, 0, 1, 1,
-1.470737, -1.177275, -2.100285, 0, 0, 0, 1, 1,
-1.470376, 1.673001, -1.14659, 0, 0, 0, 1, 1,
-1.465595, 0.4555228, -1.20259, 0, 0, 0, 1, 1,
-1.462092, 1.158971, 0.07301652, 0, 0, 0, 1, 1,
-1.461319, 1.3469, -1.404679, 1, 1, 1, 1, 1,
-1.456803, 1.534814, -1.684826, 1, 1, 1, 1, 1,
-1.452524, 0.05069072, 0.0293653, 1, 1, 1, 1, 1,
-1.447847, 0.3128411, -1.338185, 1, 1, 1, 1, 1,
-1.446143, 0.7862385, -2.036786, 1, 1, 1, 1, 1,
-1.442738, -1.605682, -3.562282, 1, 1, 1, 1, 1,
-1.440447, 0.3373033, -0.8145062, 1, 1, 1, 1, 1,
-1.428211, 0.5115178, -0.9160078, 1, 1, 1, 1, 1,
-1.427971, 1.075562, -2.187094, 1, 1, 1, 1, 1,
-1.419415, 0.1650683, -4.095889, 1, 1, 1, 1, 1,
-1.391302, -1.162376, -4.043239, 1, 1, 1, 1, 1,
-1.38993, 0.9261939, -0.9739035, 1, 1, 1, 1, 1,
-1.379368, -0.1742426, -4.782627, 1, 1, 1, 1, 1,
-1.375243, -0.6318131, -1.551942, 1, 1, 1, 1, 1,
-1.375036, -1.230963, -0.8452542, 1, 1, 1, 1, 1,
-1.364822, 0.026733, -1.564044, 0, 0, 1, 1, 1,
-1.361621, 0.09027924, -1.136999, 1, 0, 0, 1, 1,
-1.358555, -1.576803, -1.023822, 1, 0, 0, 1, 1,
-1.329816, -1.142049, -2.465904, 1, 0, 0, 1, 1,
-1.310715, -0.1068104, -0.1473874, 1, 0, 0, 1, 1,
-1.304321, 0.09867493, -2.451306, 1, 0, 0, 1, 1,
-1.297895, -1.700147, -2.764756, 0, 0, 0, 1, 1,
-1.291236, 2.411445, -1.270003, 0, 0, 0, 1, 1,
-1.283163, -0.7718481, -1.742121, 0, 0, 0, 1, 1,
-1.268219, -0.4076278, -2.992828, 0, 0, 0, 1, 1,
-1.259904, -0.7383198, -3.240395, 0, 0, 0, 1, 1,
-1.257241, -1.32895, -4.013857, 0, 0, 0, 1, 1,
-1.249877, 0.9948261, -0.4436051, 0, 0, 0, 1, 1,
-1.246129, -0.4453427, -1.968733, 1, 1, 1, 1, 1,
-1.245449, 0.00773638, 0.4544772, 1, 1, 1, 1, 1,
-1.244776, 0.9479509, -3.662309, 1, 1, 1, 1, 1,
-1.228871, 0.9488947, -0.876567, 1, 1, 1, 1, 1,
-1.2284, 0.8119399, -1.319735, 1, 1, 1, 1, 1,
-1.224244, 0.009638615, -1.5962, 1, 1, 1, 1, 1,
-1.223922, -0.4845013, -0.6715275, 1, 1, 1, 1, 1,
-1.223769, -0.1400632, -1.284261, 1, 1, 1, 1, 1,
-1.213121, -0.7602151, -0.5964197, 1, 1, 1, 1, 1,
-1.204461, 0.9126324, -0.307687, 1, 1, 1, 1, 1,
-1.20041, 0.1200983, -2.834134, 1, 1, 1, 1, 1,
-1.199468, 1.199187, -0.4201691, 1, 1, 1, 1, 1,
-1.186966, 0.1375865, -1.556894, 1, 1, 1, 1, 1,
-1.181254, -1.473226, -2.615391, 1, 1, 1, 1, 1,
-1.1807, 0.7359322, -0.1032936, 1, 1, 1, 1, 1,
-1.180695, -0.5819355, -0.185619, 0, 0, 1, 1, 1,
-1.172362, -0.8168589, -1.45691, 1, 0, 0, 1, 1,
-1.170859, 0.2059929, -1.853959, 1, 0, 0, 1, 1,
-1.170801, 0.06893833, -1.47672, 1, 0, 0, 1, 1,
-1.150412, -0.8870043, -0.2902217, 1, 0, 0, 1, 1,
-1.146458, 0.824977, -0.1217308, 1, 0, 0, 1, 1,
-1.146055, 1.128422, -0.1083323, 0, 0, 0, 1, 1,
-1.143477, -0.5464782, -2.380206, 0, 0, 0, 1, 1,
-1.142234, 0.159991, -0.9947386, 0, 0, 0, 1, 1,
-1.140606, 0.7243352, -0.5181907, 0, 0, 0, 1, 1,
-1.138016, 0.5362672, -2.370322, 0, 0, 0, 1, 1,
-1.137495, 0.5401845, 0.04716561, 0, 0, 0, 1, 1,
-1.136446, -0.3673053, -3.64621, 0, 0, 0, 1, 1,
-1.132415, 0.9979048, -0.5231189, 1, 1, 1, 1, 1,
-1.125546, 0.4131475, -1.280924, 1, 1, 1, 1, 1,
-1.123534, -0.0369412, -1.251848, 1, 1, 1, 1, 1,
-1.120517, 0.4206921, -2.363938, 1, 1, 1, 1, 1,
-1.119427, 1.091683, -0.9664091, 1, 1, 1, 1, 1,
-1.109808, 2.031908, 0.1918211, 1, 1, 1, 1, 1,
-1.109599, 0.9279421, -1.946366, 1, 1, 1, 1, 1,
-1.108406, -0.5320616, -1.525365, 1, 1, 1, 1, 1,
-1.104005, 0.7998748, -0.4492308, 1, 1, 1, 1, 1,
-1.098745, -0.3725369, -1.438316, 1, 1, 1, 1, 1,
-1.095648, 0.4341002, -1.196539, 1, 1, 1, 1, 1,
-1.093781, 0.4512117, -0.3044842, 1, 1, 1, 1, 1,
-1.087709, 0.374349, -1.183617, 1, 1, 1, 1, 1,
-1.086775, -0.5233996, -2.158485, 1, 1, 1, 1, 1,
-1.080689, -0.4967893, -1.501895, 1, 1, 1, 1, 1,
-1.07857, 1.100428, -3.098298, 0, 0, 1, 1, 1,
-1.075896, -1.048674, -3.451439, 1, 0, 0, 1, 1,
-1.070671, 0.6616891, -0.9887363, 1, 0, 0, 1, 1,
-1.07049, -0.4438067, -1.687955, 1, 0, 0, 1, 1,
-1.06719, 0.0948877, 0.2968026, 1, 0, 0, 1, 1,
-1.064807, 0.002477005, -1.804202, 1, 0, 0, 1, 1,
-1.055955, 0.3159726, -0.8292416, 0, 0, 0, 1, 1,
-1.055895, 1.003901, -1.512605, 0, 0, 0, 1, 1,
-1.048118, -1.235412, -2.169091, 0, 0, 0, 1, 1,
-1.044429, -0.6301039, -2.023499, 0, 0, 0, 1, 1,
-1.041014, -1.600174, -0.9612927, 0, 0, 0, 1, 1,
-1.026473, -1.227599, -1.62345, 0, 0, 0, 1, 1,
-1.022704, 0.3014464, -3.027696, 0, 0, 0, 1, 1,
-0.9983014, -0.001614126, -0.2332005, 1, 1, 1, 1, 1,
-0.9952511, 1.173906, -2.410516, 1, 1, 1, 1, 1,
-0.9892259, -0.1297466, -0.9784012, 1, 1, 1, 1, 1,
-0.9773719, 1.127966, -1.590491, 1, 1, 1, 1, 1,
-0.9738229, -0.9699392, -1.970599, 1, 1, 1, 1, 1,
-0.9713619, 1.347528, -0.9928339, 1, 1, 1, 1, 1,
-0.9557627, -0.5437665, -1.562561, 1, 1, 1, 1, 1,
-0.9547033, 0.8740435, -0.6869603, 1, 1, 1, 1, 1,
-0.9482698, 0.3223774, -1.858339, 1, 1, 1, 1, 1,
-0.9479113, 0.1504286, -1.15108, 1, 1, 1, 1, 1,
-0.9404935, -0.8544078, -2.093017, 1, 1, 1, 1, 1,
-0.9383856, 1.446335, 1.173418, 1, 1, 1, 1, 1,
-0.936093, -0.4459561, -1.74824, 1, 1, 1, 1, 1,
-0.9350622, 0.3212052, -0.5689409, 1, 1, 1, 1, 1,
-0.9284092, -0.06792778, -0.617422, 1, 1, 1, 1, 1,
-0.9228446, 0.6943235, -1.181906, 0, 0, 1, 1, 1,
-0.9220043, 1.847233, 1.035834, 1, 0, 0, 1, 1,
-0.9136561, 0.7151413, -0.6777584, 1, 0, 0, 1, 1,
-0.9112594, -0.7463225, -1.408797, 1, 0, 0, 1, 1,
-0.9103916, -0.1277314, -1.37109, 1, 0, 0, 1, 1,
-0.9066632, -1.361722, -2.472777, 1, 0, 0, 1, 1,
-0.9064625, -0.7558916, -2.971811, 0, 0, 0, 1, 1,
-0.8924165, 1.574152, -1.099863, 0, 0, 0, 1, 1,
-0.8918567, 1.379222, -1.049209, 0, 0, 0, 1, 1,
-0.8912175, -0.9467483, -2.625576, 0, 0, 0, 1, 1,
-0.8858672, 1.196968, -0.290927, 0, 0, 0, 1, 1,
-0.8813078, 0.09373371, -1.956378, 0, 0, 0, 1, 1,
-0.8808244, -0.00465035, -0.7218351, 0, 0, 0, 1, 1,
-0.8664252, 0.05276109, -1.810635, 1, 1, 1, 1, 1,
-0.861946, 0.9096869, -0.7907401, 1, 1, 1, 1, 1,
-0.8597541, -1.418826, -2.084332, 1, 1, 1, 1, 1,
-0.859529, 1.060791, -0.1070707, 1, 1, 1, 1, 1,
-0.8569174, 1.914875, 0.8874171, 1, 1, 1, 1, 1,
-0.8502613, 0.8116725, 0.3938179, 1, 1, 1, 1, 1,
-0.8482825, -0.08458383, -1.532004, 1, 1, 1, 1, 1,
-0.8413379, 0.7696688, -1.33032, 1, 1, 1, 1, 1,
-0.840995, 0.9171177, -0.4045708, 1, 1, 1, 1, 1,
-0.8402217, -0.6197164, -1.869549, 1, 1, 1, 1, 1,
-0.8394641, -0.05051119, -2.536506, 1, 1, 1, 1, 1,
-0.8355123, -0.8802099, -2.211529, 1, 1, 1, 1, 1,
-0.8344796, 1.644475, -0.6171833, 1, 1, 1, 1, 1,
-0.8276632, 0.4282998, -0.5928946, 1, 1, 1, 1, 1,
-0.8266011, 3.437904, 0.7950954, 1, 1, 1, 1, 1,
-0.8212813, 2.120434, 1.757554, 0, 0, 1, 1, 1,
-0.8149208, 0.3448009, 0.06048653, 1, 0, 0, 1, 1,
-0.8090886, -0.6132785, -3.397558, 1, 0, 0, 1, 1,
-0.8078489, 0.4813548, -0.4632388, 1, 0, 0, 1, 1,
-0.8040789, -0.10295, -1.516819, 1, 0, 0, 1, 1,
-0.8000728, -0.4862071, -3.116058, 1, 0, 0, 1, 1,
-0.7989516, 0.2030119, -0.7933118, 0, 0, 0, 1, 1,
-0.798728, -0.4693429, -2.514146, 0, 0, 0, 1, 1,
-0.7945362, -0.8117688, -3.149232, 0, 0, 0, 1, 1,
-0.7940339, -0.7889228, -4.395296, 0, 0, 0, 1, 1,
-0.7931374, -0.8281115, -2.165449, 0, 0, 0, 1, 1,
-0.7914216, -0.5119122, -1.33646, 0, 0, 0, 1, 1,
-0.7902834, -0.1307836, -0.7335031, 0, 0, 0, 1, 1,
-0.7896292, -2.195719, -0.8103273, 1, 1, 1, 1, 1,
-0.7893487, 0.2510526, 0.352302, 1, 1, 1, 1, 1,
-0.7881414, 0.2447967, -0.9903956, 1, 1, 1, 1, 1,
-0.7848045, -0.6490104, -1.892179, 1, 1, 1, 1, 1,
-0.7818547, 0.06745033, -1.40575, 1, 1, 1, 1, 1,
-0.781699, 1.7156, -0.6705341, 1, 1, 1, 1, 1,
-0.7678597, -0.4217545, -1.344986, 1, 1, 1, 1, 1,
-0.7666847, -0.7218423, -2.163069, 1, 1, 1, 1, 1,
-0.7618195, -0.6092296, -2.902853, 1, 1, 1, 1, 1,
-0.7617218, 0.4470963, -1.644881, 1, 1, 1, 1, 1,
-0.7604711, 0.4838227, 0.7597057, 1, 1, 1, 1, 1,
-0.7529124, -0.06538744, 0.01554, 1, 1, 1, 1, 1,
-0.7511165, -0.3624518, -2.172562, 1, 1, 1, 1, 1,
-0.7502619, -0.8240888, -2.92087, 1, 1, 1, 1, 1,
-0.749898, 0.05183338, -1.231629, 1, 1, 1, 1, 1,
-0.7426636, 0.4559221, -1.200443, 0, 0, 1, 1, 1,
-0.7402795, 0.7094986, 0.09311846, 1, 0, 0, 1, 1,
-0.7373548, 0.598881, -2.740031, 1, 0, 0, 1, 1,
-0.7337806, 0.2496562, -1.905987, 1, 0, 0, 1, 1,
-0.724939, -0.1074591, -0.856767, 1, 0, 0, 1, 1,
-0.7244495, 0.2766611, -1.388488, 1, 0, 0, 1, 1,
-0.7239894, 0.1578269, -1.620025, 0, 0, 0, 1, 1,
-0.7232486, -0.3778166, -3.048663, 0, 0, 0, 1, 1,
-0.7228092, 0.5930465, -1.071801, 0, 0, 0, 1, 1,
-0.7217005, -0.8233419, -3.253964, 0, 0, 0, 1, 1,
-0.7216222, 0.3900703, -1.124802, 0, 0, 0, 1, 1,
-0.7203795, -0.6375906, -3.552454, 0, 0, 0, 1, 1,
-0.7201048, 0.6618063, -3.224739, 0, 0, 0, 1, 1,
-0.7196797, -0.108225, -2.87412, 1, 1, 1, 1, 1,
-0.7178128, -0.3732118, -2.594208, 1, 1, 1, 1, 1,
-0.7169131, 0.2306319, -2.774205, 1, 1, 1, 1, 1,
-0.7156465, -0.812634, -4.138382, 1, 1, 1, 1, 1,
-0.7133314, -0.9699932, -2.215873, 1, 1, 1, 1, 1,
-0.7119356, -0.3763861, -2.266761, 1, 1, 1, 1, 1,
-0.7092301, 1.101017, -0.8474429, 1, 1, 1, 1, 1,
-0.7070534, -0.3124868, -1.813308, 1, 1, 1, 1, 1,
-0.7064696, 0.4183444, -1.157141, 1, 1, 1, 1, 1,
-0.7030924, 0.2362482, -0.6700635, 1, 1, 1, 1, 1,
-0.694948, 1.351728, 1.895832, 1, 1, 1, 1, 1,
-0.6887379, -0.7271575, -2.796071, 1, 1, 1, 1, 1,
-0.6854794, 0.4970236, -2.351008, 1, 1, 1, 1, 1,
-0.6846904, -0.5662684, -1.508457, 1, 1, 1, 1, 1,
-0.6806793, 1.243652, -1.414122, 1, 1, 1, 1, 1,
-0.6801991, 0.1976297, -2.29447, 0, 0, 1, 1, 1,
-0.6707456, 0.4739048, -1.006198, 1, 0, 0, 1, 1,
-0.6700996, -1.473867, -2.469055, 1, 0, 0, 1, 1,
-0.6660101, -0.106471, -3.471511, 1, 0, 0, 1, 1,
-0.6656633, -0.5574606, -1.679251, 1, 0, 0, 1, 1,
-0.6625172, -0.2423529, -3.365335, 1, 0, 0, 1, 1,
-0.6554667, 1.888936, -0.4883226, 0, 0, 0, 1, 1,
-0.6493251, 1.308572, -0.4139079, 0, 0, 0, 1, 1,
-0.6443177, 0.2428373, -1.503304, 0, 0, 0, 1, 1,
-0.6416063, -0.7155505, -1.370413, 0, 0, 0, 1, 1,
-0.6412892, 1.021379, -0.9492152, 0, 0, 0, 1, 1,
-0.6402317, -0.004888064, -1.353583, 0, 0, 0, 1, 1,
-0.638572, -0.2811387, -0.4369975, 0, 0, 0, 1, 1,
-0.6335313, -0.4057166, -1.88951, 1, 1, 1, 1, 1,
-0.6305543, 0.7110422, 0.1608426, 1, 1, 1, 1, 1,
-0.6278381, -1.552778, -1.984412, 1, 1, 1, 1, 1,
-0.6249478, -0.2014909, -0.9084744, 1, 1, 1, 1, 1,
-0.6230133, -1.059355, -2.257072, 1, 1, 1, 1, 1,
-0.6151797, -0.04844853, -1.762417, 1, 1, 1, 1, 1,
-0.6100807, 1.3002, 0.5553455, 1, 1, 1, 1, 1,
-0.6089573, -0.8073148, -4.000714, 1, 1, 1, 1, 1,
-0.6045651, 1.500516, -0.9403496, 1, 1, 1, 1, 1,
-0.6032501, -0.210015, -1.80508, 1, 1, 1, 1, 1,
-0.6023914, 0.6905634, 1.158141, 1, 1, 1, 1, 1,
-0.5974346, 1.844261, 2.226112, 1, 1, 1, 1, 1,
-0.5924321, 1.190087, -0.4319062, 1, 1, 1, 1, 1,
-0.5896735, 1.915595, 0.4700738, 1, 1, 1, 1, 1,
-0.5829746, -0.6994398, -4.230886, 1, 1, 1, 1, 1,
-0.5812243, 0.8615731, -0.8338055, 0, 0, 1, 1, 1,
-0.5757604, -0.141386, 1.189462, 1, 0, 0, 1, 1,
-0.5697764, 0.2286245, 0.6996622, 1, 0, 0, 1, 1,
-0.5677805, -0.5569531, -1.558665, 1, 0, 0, 1, 1,
-0.5637944, -0.3370587, -1.982546, 1, 0, 0, 1, 1,
-0.5597096, -1.208943, -3.014091, 1, 0, 0, 1, 1,
-0.5565794, 0.3228278, -2.442626, 0, 0, 0, 1, 1,
-0.5527983, 1.28028, -1.033754, 0, 0, 0, 1, 1,
-0.5517788, -1.31166, -2.524941, 0, 0, 0, 1, 1,
-0.5488566, -2.1818, -2.353017, 0, 0, 0, 1, 1,
-0.5455179, -0.7827908, -4.671603, 0, 0, 0, 1, 1,
-0.5453678, -0.7985618, -3.920037, 0, 0, 0, 1, 1,
-0.5443181, 0.3005049, -2.311001, 0, 0, 0, 1, 1,
-0.5421917, -0.0619324, -1.620806, 1, 1, 1, 1, 1,
-0.5396796, -0.6620966, -2.479845, 1, 1, 1, 1, 1,
-0.5388536, 0.2104593, -2.846545, 1, 1, 1, 1, 1,
-0.5381192, -0.2295771, -1.57339, 1, 1, 1, 1, 1,
-0.5360589, 0.4000161, 0.3921039, 1, 1, 1, 1, 1,
-0.5333806, 1.023088, -1.694503, 1, 1, 1, 1, 1,
-0.5318041, -0.1354855, -3.61806, 1, 1, 1, 1, 1,
-0.5312981, -1.150512, -2.202291, 1, 1, 1, 1, 1,
-0.5230836, 0.4675037, -1.374897, 1, 1, 1, 1, 1,
-0.5207524, -0.5033974, -2.953726, 1, 1, 1, 1, 1,
-0.5179405, 0.9989719, -0.9815366, 1, 1, 1, 1, 1,
-0.5101, 1.212881, -0.3055687, 1, 1, 1, 1, 1,
-0.5032752, 0.3319905, -1.790676, 1, 1, 1, 1, 1,
-0.4961117, -0.5362781, -1.845388, 1, 1, 1, 1, 1,
-0.495329, 1.812564, -0.2132651, 1, 1, 1, 1, 1,
-0.4946471, 0.8670608, 0.3269977, 0, 0, 1, 1, 1,
-0.4904738, -0.3930742, -1.887358, 1, 0, 0, 1, 1,
-0.4888509, -0.3440787, -1.338402, 1, 0, 0, 1, 1,
-0.4875844, -0.6596541, -2.524882, 1, 0, 0, 1, 1,
-0.4817174, -0.8085994, -2.18305, 1, 0, 0, 1, 1,
-0.4784662, 1.609558, 0.168851, 1, 0, 0, 1, 1,
-0.4769893, 1.403542, 0.6330577, 0, 0, 0, 1, 1,
-0.4729616, -1.281429, -3.071384, 0, 0, 0, 1, 1,
-0.4708872, 0.1844533, -0.9056466, 0, 0, 0, 1, 1,
-0.4698881, 0.6606781, -0.844176, 0, 0, 0, 1, 1,
-0.4638271, -1.694356, -2.739594, 0, 0, 0, 1, 1,
-0.4605754, -1.511216, -3.027008, 0, 0, 0, 1, 1,
-0.4596114, -0.08744486, -0.9909744, 0, 0, 0, 1, 1,
-0.4564516, -0.1528457, -0.8969359, 1, 1, 1, 1, 1,
-0.4563784, -0.1746636, -3.013474, 1, 1, 1, 1, 1,
-0.4549368, -0.7721725, -3.202447, 1, 1, 1, 1, 1,
-0.4540634, 0.4782624, 0.1636545, 1, 1, 1, 1, 1,
-0.4519394, 0.1629972, -1.513866, 1, 1, 1, 1, 1,
-0.4513367, 0.1119001, -1.49568, 1, 1, 1, 1, 1,
-0.4499429, -0.7952076, -3.11334, 1, 1, 1, 1, 1,
-0.4461243, 2.525442, -2.530641, 1, 1, 1, 1, 1,
-0.4420387, -1.360637, -2.511848, 1, 1, 1, 1, 1,
-0.4416765, -2.795179, -2.695055, 1, 1, 1, 1, 1,
-0.4416368, -0.9012117, -2.731577, 1, 1, 1, 1, 1,
-0.4404369, -0.50766, -1.691312, 1, 1, 1, 1, 1,
-0.4371763, 0.807422, -0.1928779, 1, 1, 1, 1, 1,
-0.4369158, -1.055388, -1.689872, 1, 1, 1, 1, 1,
-0.4303169, -1.762153, -1.249741, 1, 1, 1, 1, 1,
-0.4285672, -0.03850244, -2.994444, 0, 0, 1, 1, 1,
-0.4283581, 0.2184508, 0.5357404, 1, 0, 0, 1, 1,
-0.426378, 0.6522636, 1.600059, 1, 0, 0, 1, 1,
-0.4258401, -0.3886107, -1.429589, 1, 0, 0, 1, 1,
-0.4178338, -0.6797352, -1.954123, 1, 0, 0, 1, 1,
-0.4171195, -0.2550107, -1.542859, 1, 0, 0, 1, 1,
-0.4171177, 1.861215, 1.13213, 0, 0, 0, 1, 1,
-0.4147255, -0.03730819, -3.75964, 0, 0, 0, 1, 1,
-0.4138694, 0.863813, 1.14999, 0, 0, 0, 1, 1,
-0.4086429, -0.3017171, -3.155926, 0, 0, 0, 1, 1,
-0.4005464, 0.1826102, -1.019345, 0, 0, 0, 1, 1,
-0.38903, 0.2799668, -0.742602, 0, 0, 0, 1, 1,
-0.3878574, 0.1668944, -1.147444, 0, 0, 0, 1, 1,
-0.3842372, 0.8621792, -1.204762, 1, 1, 1, 1, 1,
-0.3830044, -0.2489143, -2.370702, 1, 1, 1, 1, 1,
-0.3764438, -0.2660958, -3.307748, 1, 1, 1, 1, 1,
-0.3657701, -1.448046, -3.178804, 1, 1, 1, 1, 1,
-0.3657594, -1.646429, -0.9304827, 1, 1, 1, 1, 1,
-0.3592243, 0.2786134, -2.02655, 1, 1, 1, 1, 1,
-0.3582158, -0.9275459, -2.886643, 1, 1, 1, 1, 1,
-0.3566942, 1.104534, 0.4570998, 1, 1, 1, 1, 1,
-0.3513445, -0.2654037, -2.340649, 1, 1, 1, 1, 1,
-0.3495583, -0.08358701, -1.195644, 1, 1, 1, 1, 1,
-0.3489819, -1.075364, -2.09595, 1, 1, 1, 1, 1,
-0.3424257, -0.5191, -2.353894, 1, 1, 1, 1, 1,
-0.3386282, -0.0637999, -1.959008, 1, 1, 1, 1, 1,
-0.336509, -0.8679529, -3.945773, 1, 1, 1, 1, 1,
-0.3358285, 1.083224, -1.394871, 1, 1, 1, 1, 1,
-0.3333412, -0.3606215, -0.5541919, 0, 0, 1, 1, 1,
-0.3297811, -0.0935223, -1.14193, 1, 0, 0, 1, 1,
-0.3297448, -1.069821, -3.732923, 1, 0, 0, 1, 1,
-0.3291996, 0.6820876, 0.01239168, 1, 0, 0, 1, 1,
-0.3290718, -0.8220579, -2.227174, 1, 0, 0, 1, 1,
-0.3278484, -1.233837, -1.290289, 1, 0, 0, 1, 1,
-0.3247905, -0.2444193, -2.231575, 0, 0, 0, 1, 1,
-0.3245253, -0.3936872, -1.819961, 0, 0, 0, 1, 1,
-0.3209464, 0.8743027, -0.9580815, 0, 0, 0, 1, 1,
-0.3157815, -0.5069407, -2.825343, 0, 0, 0, 1, 1,
-0.3143825, 0.3721031, -1.178466, 0, 0, 0, 1, 1,
-0.3123926, 1.202046, 0.1369877, 0, 0, 0, 1, 1,
-0.3112164, 0.854102, -1.266627, 0, 0, 0, 1, 1,
-0.3069889, -0.6403829, -3.478097, 1, 1, 1, 1, 1,
-0.3034809, 0.009125423, -2.813407, 1, 1, 1, 1, 1,
-0.2991407, 0.6243404, -0.324324, 1, 1, 1, 1, 1,
-0.2981515, -0.7011442, -3.513229, 1, 1, 1, 1, 1,
-0.2973287, 0.04288404, -0.4110657, 1, 1, 1, 1, 1,
-0.2947163, -2.532635, -3.699636, 1, 1, 1, 1, 1,
-0.2920647, 2.357836, -0.7597929, 1, 1, 1, 1, 1,
-0.279518, 1.752515, 0.6949399, 1, 1, 1, 1, 1,
-0.2756405, -0.7983103, -3.32417, 1, 1, 1, 1, 1,
-0.2739779, -0.7533344, -3.13431, 1, 1, 1, 1, 1,
-0.2618996, 0.05105777, -1.152027, 1, 1, 1, 1, 1,
-0.2570926, 0.4546638, 0.527486, 1, 1, 1, 1, 1,
-0.2548135, -0.6798062, -3.176424, 1, 1, 1, 1, 1,
-0.2539664, -0.1820071, -2.699552, 1, 1, 1, 1, 1,
-0.2512384, 0.7808412, 1.052511, 1, 1, 1, 1, 1,
-0.2501769, -0.5928749, -1.817819, 0, 0, 1, 1, 1,
-0.2467818, -0.6732376, -3.631406, 1, 0, 0, 1, 1,
-0.2459617, -1.864761, -2.989458, 1, 0, 0, 1, 1,
-0.2371997, -0.6827844, -3.72168, 1, 0, 0, 1, 1,
-0.2368589, -1.693755, -1.353832, 1, 0, 0, 1, 1,
-0.2356895, -1.202194, -2.346019, 1, 0, 0, 1, 1,
-0.2349738, -2.070032, -1.812027, 0, 0, 0, 1, 1,
-0.2335053, 2.972592, 0.16835, 0, 0, 0, 1, 1,
-0.2291483, -1.916091, -1.750544, 0, 0, 0, 1, 1,
-0.225348, -1.298352, -2.028806, 0, 0, 0, 1, 1,
-0.2252382, -0.3183079, -3.707065, 0, 0, 0, 1, 1,
-0.224763, 0.0337965, -3.345327, 0, 0, 0, 1, 1,
-0.2172451, -1.356022, -3.320568, 0, 0, 0, 1, 1,
-0.21342, 2.155298, -0.01557391, 1, 1, 1, 1, 1,
-0.2129844, -0.7399575, -1.277451, 1, 1, 1, 1, 1,
-0.2121781, -1.8735, -2.332366, 1, 1, 1, 1, 1,
-0.2099768, 0.02936479, -2.821037, 1, 1, 1, 1, 1,
-0.209249, -0.7970728, -1.506494, 1, 1, 1, 1, 1,
-0.2071255, 0.4427253, -0.2894956, 1, 1, 1, 1, 1,
-0.1974294, -0.845026, -2.362818, 1, 1, 1, 1, 1,
-0.196515, 1.601107, 0.07429536, 1, 1, 1, 1, 1,
-0.1955949, -0.09565827, -2.27768, 1, 1, 1, 1, 1,
-0.1870981, 1.001193, -0.217965, 1, 1, 1, 1, 1,
-0.1804149, -0.9560837, -1.6981, 1, 1, 1, 1, 1,
-0.1747895, -0.7412037, -3.000318, 1, 1, 1, 1, 1,
-0.1736956, 0.1909484, -1.286267, 1, 1, 1, 1, 1,
-0.1733618, 1.757223, 0.8845126, 1, 1, 1, 1, 1,
-0.1709302, 0.1423453, -0.1401068, 1, 1, 1, 1, 1,
-0.1671642, 0.2533705, -0.3166423, 0, 0, 1, 1, 1,
-0.1661639, -0.502777, -2.266013, 1, 0, 0, 1, 1,
-0.1618972, -0.1564874, -1.782554, 1, 0, 0, 1, 1,
-0.155769, 0.1664479, 0.3712227, 1, 0, 0, 1, 1,
-0.1537226, 0.9155633, 1.40223, 1, 0, 0, 1, 1,
-0.1483925, -1.889867, -1.660056, 1, 0, 0, 1, 1,
-0.1435616, -1.119362, -1.650058, 0, 0, 0, 1, 1,
-0.1429153, 0.4269729, -0.2024965, 0, 0, 0, 1, 1,
-0.1428247, 1.683291, 0.1718367, 0, 0, 0, 1, 1,
-0.1380167, -1.740638, -3.774805, 0, 0, 0, 1, 1,
-0.1364842, -0.2612992, -1.79577, 0, 0, 0, 1, 1,
-0.1350726, 0.6531264, -0.2460741, 0, 0, 0, 1, 1,
-0.1321156, -1.767223, -3.670489, 0, 0, 0, 1, 1,
-0.1279052, -0.674142, -2.723915, 1, 1, 1, 1, 1,
-0.1251422, -0.2589864, -1.328685, 1, 1, 1, 1, 1,
-0.1197351, 1.003938, -2.123741, 1, 1, 1, 1, 1,
-0.1183281, -1.146792, -5.740633, 1, 1, 1, 1, 1,
-0.1169191, 0.06758785, -1.706113, 1, 1, 1, 1, 1,
-0.1137913, -0.3124019, -2.667196, 1, 1, 1, 1, 1,
-0.1097522, -0.1113444, -1.265298, 1, 1, 1, 1, 1,
-0.1094402, 1.974833, 1.575461, 1, 1, 1, 1, 1,
-0.10279, 1.567971, -0.4073964, 1, 1, 1, 1, 1,
-0.09835292, -0.9853852, -2.493557, 1, 1, 1, 1, 1,
-0.09811804, 0.4073588, -0.4107342, 1, 1, 1, 1, 1,
-0.09710523, 0.8479072, -0.3003286, 1, 1, 1, 1, 1,
-0.09642501, 1.445743, 0.6594962, 1, 1, 1, 1, 1,
-0.08724871, 0.3046902, -1.531574, 1, 1, 1, 1, 1,
-0.08678503, -0.7054309, -4.20379, 1, 1, 1, 1, 1,
-0.08560392, -1.417811, -3.295713, 0, 0, 1, 1, 1,
-0.08370744, -0.5811625, -3.421384, 1, 0, 0, 1, 1,
-0.08092913, -0.1982847, -3.856569, 1, 0, 0, 1, 1,
-0.0769234, 0.8607132, -0.329579, 1, 0, 0, 1, 1,
-0.0754205, 0.6443288, -0.5940329, 1, 0, 0, 1, 1,
-0.07410972, -0.4695491, -2.33004, 1, 0, 0, 1, 1,
-0.07266063, -0.6439183, -3.375836, 0, 0, 0, 1, 1,
-0.06853162, -0.8714081, -3.537801, 0, 0, 0, 1, 1,
-0.06720383, 1.041189, 0.7018905, 0, 0, 0, 1, 1,
-0.06483993, 1.291705, -0.5407611, 0, 0, 0, 1, 1,
-0.06212879, 1.27173, -0.3101685, 0, 0, 0, 1, 1,
-0.06188661, -1.892318, -1.847213, 0, 0, 0, 1, 1,
-0.05790084, 0.6851016, 0.4646026, 0, 0, 0, 1, 1,
-0.05783193, -2.170702, -3.753825, 1, 1, 1, 1, 1,
-0.05608903, -0.8405685, -2.755467, 1, 1, 1, 1, 1,
-0.05265735, 1.096307, -1.425082, 1, 1, 1, 1, 1,
-0.04478761, -0.5964012, -0.862125, 1, 1, 1, 1, 1,
-0.04200691, -0.728441, -2.847887, 1, 1, 1, 1, 1,
-0.03535771, 1.167067, -1.140787, 1, 1, 1, 1, 1,
-0.03430866, -0.3848433, -4.001508, 1, 1, 1, 1, 1,
-0.0338932, 0.28519, 0.8921312, 1, 1, 1, 1, 1,
-0.03357479, 1.34081, -0.1951431, 1, 1, 1, 1, 1,
-0.02833285, 1.512308, -2.03257, 1, 1, 1, 1, 1,
-0.02581825, -0.3639516, -2.917313, 1, 1, 1, 1, 1,
-0.0236937, -0.4394838, -4.274388, 1, 1, 1, 1, 1,
-0.01704733, 0.3154911, 0.2108112, 1, 1, 1, 1, 1,
-0.01450201, -1.209182, -3.779901, 1, 1, 1, 1, 1,
-0.01043333, 0.7369767, 0.8521074, 1, 1, 1, 1, 1,
-0.008613783, 0.07093709, 0.784363, 0, 0, 1, 1, 1,
-2.890098e-05, 0.197417, -0.200392, 1, 0, 0, 1, 1,
0.002456554, -1.449125, 5.194419, 1, 0, 0, 1, 1,
0.004760737, 0.518298, -0.6856838, 1, 0, 0, 1, 1,
0.006783572, -0.769878, 2.187773, 1, 0, 0, 1, 1,
0.008311265, -1.057553, 3.668991, 1, 0, 0, 1, 1,
0.008687955, -0.4353047, 3.52509, 0, 0, 0, 1, 1,
0.01146145, -0.9847069, 2.419768, 0, 0, 0, 1, 1,
0.01149908, 0.4097482, -0.936751, 0, 0, 0, 1, 1,
0.01150871, 0.8620879, -0.05561335, 0, 0, 0, 1, 1,
0.01218577, 0.5072502, 0.2022732, 0, 0, 0, 1, 1,
0.01844168, 0.3043498, 0.437841, 0, 0, 0, 1, 1,
0.02396526, -0.6170091, 2.999596, 0, 0, 0, 1, 1,
0.02554513, 0.7528249, 1.343221, 1, 1, 1, 1, 1,
0.02629183, -0.5321695, 4.23198, 1, 1, 1, 1, 1,
0.03412127, -2.347394, 2.981442, 1, 1, 1, 1, 1,
0.03504832, 1.733202, -0.3993966, 1, 1, 1, 1, 1,
0.03525992, -0.06971179, 3.286679, 1, 1, 1, 1, 1,
0.03875224, 0.3175743, 2.347749, 1, 1, 1, 1, 1,
0.04430278, -0.3272301, 3.000332, 1, 1, 1, 1, 1,
0.04980182, 0.04392895, 0.1720946, 1, 1, 1, 1, 1,
0.05610908, 0.08500473, 0.8029636, 1, 1, 1, 1, 1,
0.05654077, -0.3791375, 2.617568, 1, 1, 1, 1, 1,
0.06042127, 0.1894032, 0.04008769, 1, 1, 1, 1, 1,
0.06150692, -1.340928, 3.738297, 1, 1, 1, 1, 1,
0.06301818, -0.3260117, 2.933446, 1, 1, 1, 1, 1,
0.06318561, 0.768693, 1.266671, 1, 1, 1, 1, 1,
0.06616405, 0.256779, -0.8790403, 1, 1, 1, 1, 1,
0.06635801, -0.3103464, 2.376358, 0, 0, 1, 1, 1,
0.06869034, -1.148645, 2.445024, 1, 0, 0, 1, 1,
0.07018895, -2.027915, 4.201275, 1, 0, 0, 1, 1,
0.07022583, 1.004441, 0.0752791, 1, 0, 0, 1, 1,
0.07119636, -0.2040365, 3.535774, 1, 0, 0, 1, 1,
0.07528684, 1.06013, -0.5200123, 1, 0, 0, 1, 1,
0.0771868, -0.8693625, 2.876642, 0, 0, 0, 1, 1,
0.08123111, 0.344018, -0.4483647, 0, 0, 0, 1, 1,
0.08200379, 1.889614, -2.031112, 0, 0, 0, 1, 1,
0.08307695, 0.2034196, -0.05286632, 0, 0, 0, 1, 1,
0.08317222, -0.3071408, 3.389477, 0, 0, 0, 1, 1,
0.08651792, 1.720834, -0.1631899, 0, 0, 0, 1, 1,
0.08712911, 0.2474756, -0.452938, 0, 0, 0, 1, 1,
0.08940971, -0.7625329, 3.665556, 1, 1, 1, 1, 1,
0.0909736, -0.1406325, 1.645016, 1, 1, 1, 1, 1,
0.09221083, -0.1997568, 2.159159, 1, 1, 1, 1, 1,
0.09310291, 1.110789, 0.7944232, 1, 1, 1, 1, 1,
0.0984616, -0.5348812, 3.022753, 1, 1, 1, 1, 1,
0.1014766, 0.946076, -2.065048, 1, 1, 1, 1, 1,
0.102298, 0.4886688, 1.097436, 1, 1, 1, 1, 1,
0.1055755, 1.07282, -0.5043255, 1, 1, 1, 1, 1,
0.1063968, 1.148938, 0.8293372, 1, 1, 1, 1, 1,
0.110394, 0.494469, 0.3206872, 1, 1, 1, 1, 1,
0.1127184, -0.7072676, 3.940796, 1, 1, 1, 1, 1,
0.1190383, -0.3654116, 3.628406, 1, 1, 1, 1, 1,
0.1221366, 1.156687, -0.2858531, 1, 1, 1, 1, 1,
0.1237756, -0.575833, 2.601785, 1, 1, 1, 1, 1,
0.1259934, -0.05910398, 0.7309167, 1, 1, 1, 1, 1,
0.1272094, 1.340698, 1.083097, 0, 0, 1, 1, 1,
0.1293192, 0.6762195, -0.458107, 1, 0, 0, 1, 1,
0.1324213, 1.221762, 1.56004, 1, 0, 0, 1, 1,
0.1333968, -0.1608928, 1.517194, 1, 0, 0, 1, 1,
0.1353475, 0.3852174, -0.1204883, 1, 0, 0, 1, 1,
0.1357386, -1.034761, 4.302691, 1, 0, 0, 1, 1,
0.1409178, 1.037917, 0.7912132, 0, 0, 0, 1, 1,
0.1436304, 0.5474823, 0.1167464, 0, 0, 0, 1, 1,
0.1472083, 0.1294838, -0.7239766, 0, 0, 0, 1, 1,
0.1516606, 0.5886174, 0.4445123, 0, 0, 0, 1, 1,
0.1538038, -0.7907642, 1.640385, 0, 0, 0, 1, 1,
0.156114, -0.751061, 2.824805, 0, 0, 0, 1, 1,
0.1597578, -1.060116, 3.280429, 0, 0, 0, 1, 1,
0.1597834, 1.723631, -0.1808686, 1, 1, 1, 1, 1,
0.1621488, -0.8983322, 1.954331, 1, 1, 1, 1, 1,
0.1624284, -1.852183, 2.395355, 1, 1, 1, 1, 1,
0.1628985, -0.953703, 2.539087, 1, 1, 1, 1, 1,
0.1647568, 0.7891005, 0.2370673, 1, 1, 1, 1, 1,
0.164918, 1.72997, 2.216278, 1, 1, 1, 1, 1,
0.1700689, 1.03513, -1.791915, 1, 1, 1, 1, 1,
0.1701519, -0.489806, 2.462637, 1, 1, 1, 1, 1,
0.1714632, -0.4657445, 2.395326, 1, 1, 1, 1, 1,
0.1731047, -0.4345032, 3.830077, 1, 1, 1, 1, 1,
0.173901, -0.4328579, 1.158499, 1, 1, 1, 1, 1,
0.1740735, -0.1072445, 1.373017, 1, 1, 1, 1, 1,
0.1741039, 1.792769, 0.441701, 1, 1, 1, 1, 1,
0.1773613, 0.7950293, 0.6436748, 1, 1, 1, 1, 1,
0.185396, 1.128244, 1.42063, 1, 1, 1, 1, 1,
0.1865722, -1.380863, 2.24454, 0, 0, 1, 1, 1,
0.186725, 0.6503755, -1.488306, 1, 0, 0, 1, 1,
0.1873752, -1.206055, 0.2725113, 1, 0, 0, 1, 1,
0.1883772, 0.7787596, 1.273187, 1, 0, 0, 1, 1,
0.195471, 1.879904, 0.3375365, 1, 0, 0, 1, 1,
0.1960096, -0.1112574, 3.861498, 1, 0, 0, 1, 1,
0.1995084, -0.5092198, 2.92249, 0, 0, 0, 1, 1,
0.1995556, -0.4520525, 1.959554, 0, 0, 0, 1, 1,
0.1998435, -1.155352, 2.724123, 0, 0, 0, 1, 1,
0.2117058, -0.03937913, 1.613439, 0, 0, 0, 1, 1,
0.2166255, 1.312413, -0.4613738, 0, 0, 0, 1, 1,
0.2234783, -1.151521, 3.605375, 0, 0, 0, 1, 1,
0.2267663, -0.2587903, 2.038835, 0, 0, 0, 1, 1,
0.2272754, -0.02427315, 2.377504, 1, 1, 1, 1, 1,
0.2292632, 0.3295137, -1.416614, 1, 1, 1, 1, 1,
0.2375671, -0.4864087, 4.990866, 1, 1, 1, 1, 1,
0.238083, -0.5727739, 3.065775, 1, 1, 1, 1, 1,
0.2398454, 0.8477736, -0.4616083, 1, 1, 1, 1, 1,
0.2406639, -0.3807165, 2.319734, 1, 1, 1, 1, 1,
0.2416987, 0.6427563, -1.113385, 1, 1, 1, 1, 1,
0.2448429, -0.2590077, 2.001513, 1, 1, 1, 1, 1,
0.2459429, 1.551893, 0.4708453, 1, 1, 1, 1, 1,
0.2477144, -0.4324355, 2.304283, 1, 1, 1, 1, 1,
0.2499507, -0.2093746, 2.966389, 1, 1, 1, 1, 1,
0.251848, -0.9590294, 2.102881, 1, 1, 1, 1, 1,
0.2540148, -1.973548, 4.39842, 1, 1, 1, 1, 1,
0.2576599, -0.8714525, 2.978616, 1, 1, 1, 1, 1,
0.2585208, -0.02955632, 0.3186206, 1, 1, 1, 1, 1,
0.2619601, -0.1581039, 2.785532, 0, 0, 1, 1, 1,
0.2675356, -1.151483, 4.092667, 1, 0, 0, 1, 1,
0.27435, 0.08347843, -0.2159417, 1, 0, 0, 1, 1,
0.2752261, 0.5952015, -0.6959827, 1, 0, 0, 1, 1,
0.2817578, 0.198299, 1.269259, 1, 0, 0, 1, 1,
0.2908929, 0.367812, 0.9294635, 1, 0, 0, 1, 1,
0.2919846, -1.37913, 3.552262, 0, 0, 0, 1, 1,
0.2927357, -0.2167394, 2.489075, 0, 0, 0, 1, 1,
0.2954283, 1.174436, 1.24526, 0, 0, 0, 1, 1,
0.2978118, -1.179625, 4.450864, 0, 0, 0, 1, 1,
0.2986291, 2.015583, 0.4042324, 0, 0, 0, 1, 1,
0.2995234, 0.6200593, -0.2809079, 0, 0, 0, 1, 1,
0.3018509, -0.7694746, 1.981636, 0, 0, 0, 1, 1,
0.3029231, 0.2509581, 1.056105, 1, 1, 1, 1, 1,
0.3052665, 0.7643462, -0.1940985, 1, 1, 1, 1, 1,
0.3091818, -0.340897, 3.685809, 1, 1, 1, 1, 1,
0.3098757, -0.6609766, 1.685641, 1, 1, 1, 1, 1,
0.3099426, 0.7108158, 1.001174, 1, 1, 1, 1, 1,
0.3107865, -2.044816, 2.115574, 1, 1, 1, 1, 1,
0.3117404, -0.2147933, 1.978109, 1, 1, 1, 1, 1,
0.3123443, -0.793558, 3.468685, 1, 1, 1, 1, 1,
0.3154618, -0.07428518, 2.086784, 1, 1, 1, 1, 1,
0.3174707, -1.435339, 2.83631, 1, 1, 1, 1, 1,
0.327874, 1.284225, 1.940566, 1, 1, 1, 1, 1,
0.3355654, -0.1145766, 2.666066, 1, 1, 1, 1, 1,
0.3385437, -0.4424958, 1.576723, 1, 1, 1, 1, 1,
0.3404121, 0.759391, 0.8788358, 1, 1, 1, 1, 1,
0.3438815, 0.7891812, 0.6139718, 1, 1, 1, 1, 1,
0.3448934, -0.9853598, 2.31688, 0, 0, 1, 1, 1,
0.3450803, 0.8190663, 0.7565839, 1, 0, 0, 1, 1,
0.3581544, -1.020647, 2.225926, 1, 0, 0, 1, 1,
0.3604289, -0.2326785, 2.345388, 1, 0, 0, 1, 1,
0.3610068, 1.482743, -0.1204738, 1, 0, 0, 1, 1,
0.3635002, -2.080258, 3.108272, 1, 0, 0, 1, 1,
0.3698733, -0.5929255, 0.7227805, 0, 0, 0, 1, 1,
0.3700736, -0.8010962, 2.184179, 0, 0, 0, 1, 1,
0.3702242, -0.2238516, 2.722394, 0, 0, 0, 1, 1,
0.376382, -1.755077, 2.779084, 0, 0, 0, 1, 1,
0.3803964, 1.069851, 1.885184, 0, 0, 0, 1, 1,
0.384401, 1.541436, -1.599432, 0, 0, 0, 1, 1,
0.3891097, 2.02023, 1.704088, 0, 0, 0, 1, 1,
0.3892323, 0.309036, 2.30021, 1, 1, 1, 1, 1,
0.3935263, -1.214283, 2.557059, 1, 1, 1, 1, 1,
0.3948638, 1.138173, -1.599221, 1, 1, 1, 1, 1,
0.3959805, 0.4306661, -1.591881, 1, 1, 1, 1, 1,
0.4009659, 0.7911701, -0.4100617, 1, 1, 1, 1, 1,
0.4025873, 0.05416586, 1.103237, 1, 1, 1, 1, 1,
0.4058565, 0.9021934, 0.3132885, 1, 1, 1, 1, 1,
0.407158, 1.101126, 0.4595166, 1, 1, 1, 1, 1,
0.4092257, -0.5017009, 2.503774, 1, 1, 1, 1, 1,
0.4106159, 0.8541383, -0.5813133, 1, 1, 1, 1, 1,
0.4154671, 1.322899, 1.069069, 1, 1, 1, 1, 1,
0.4196367, -1.0039, 4.062435, 1, 1, 1, 1, 1,
0.4197198, 0.5670416, -1.457289, 1, 1, 1, 1, 1,
0.4197794, -0.09728823, 1.485533, 1, 1, 1, 1, 1,
0.4263847, -1.377779, 2.763701, 1, 1, 1, 1, 1,
0.4311126, 0.1447494, -0.2052386, 0, 0, 1, 1, 1,
0.4336703, -1.174208, 3.109768, 1, 0, 0, 1, 1,
0.4349815, -0.4546615, 1.552641, 1, 0, 0, 1, 1,
0.4396726, -0.595315, 2.569269, 1, 0, 0, 1, 1,
0.441363, -2.674963, 2.309501, 1, 0, 0, 1, 1,
0.4438111, 0.6724135, -2.73606, 1, 0, 0, 1, 1,
0.4439656, 0.6630361, 0.4905339, 0, 0, 0, 1, 1,
0.4493167, -0.0275931, 2.115508, 0, 0, 0, 1, 1,
0.4497762, -0.0213658, 1.124629, 0, 0, 0, 1, 1,
0.4520853, -0.6886341, 2.052585, 0, 0, 0, 1, 1,
0.4588022, 0.3077739, 1.899885, 0, 0, 0, 1, 1,
0.4609841, 2.438343, 0.06623945, 0, 0, 0, 1, 1,
0.4645457, -1.770302, 4.4051, 0, 0, 0, 1, 1,
0.466654, 0.08208515, 2.233757, 1, 1, 1, 1, 1,
0.4696833, 0.7947082, 1.159963, 1, 1, 1, 1, 1,
0.4710889, 0.4539802, 1.869615, 1, 1, 1, 1, 1,
0.4716885, 0.2434391, 0.6563569, 1, 1, 1, 1, 1,
0.4784164, -0.03183853, 2.342061, 1, 1, 1, 1, 1,
0.4810389, -0.747494, 2.843966, 1, 1, 1, 1, 1,
0.4881084, 1.407513, -0.3438496, 1, 1, 1, 1, 1,
0.4883936, -1.300815, 1.500485, 1, 1, 1, 1, 1,
0.4891362, 0.4544984, 2.102048, 1, 1, 1, 1, 1,
0.4905038, -1.492697, 1.763881, 1, 1, 1, 1, 1,
0.4917288, -1.195885, 3.876767, 1, 1, 1, 1, 1,
0.4931099, 1.287954, 0.8438696, 1, 1, 1, 1, 1,
0.494667, 0.286835, 1.727355, 1, 1, 1, 1, 1,
0.4968771, -0.2605406, 1.683208, 1, 1, 1, 1, 1,
0.5007473, -1.023929, 2.388677, 1, 1, 1, 1, 1,
0.502219, -1.092286, 2.396542, 0, 0, 1, 1, 1,
0.5025684, 1.075424, 1.065353, 1, 0, 0, 1, 1,
0.5047961, -1.425425, 2.775808, 1, 0, 0, 1, 1,
0.5052263, -0.4191063, 2.62397, 1, 0, 0, 1, 1,
0.5066572, 0.283822, -0.08434562, 1, 0, 0, 1, 1,
0.5068487, 0.1606587, 0.322399, 1, 0, 0, 1, 1,
0.5099051, 1.359746, 0.2261991, 0, 0, 0, 1, 1,
0.5140525, 0.1989717, 1.331105, 0, 0, 0, 1, 1,
0.5175085, -1.814538, 1.345548, 0, 0, 0, 1, 1,
0.5220487, -0.4007179, 2.30229, 0, 0, 0, 1, 1,
0.5273691, -2.483482, 3.361767, 0, 0, 0, 1, 1,
0.5300586, -0.1310719, 3.702533, 0, 0, 0, 1, 1,
0.532122, -0.2064054, 2.26176, 0, 0, 0, 1, 1,
0.5449373, -0.6099482, 2.799405, 1, 1, 1, 1, 1,
0.5459449, 1.884579, -0.5888492, 1, 1, 1, 1, 1,
0.5494046, -0.1752392, 3.223184, 1, 1, 1, 1, 1,
0.5495845, -0.5202779, 2.984599, 1, 1, 1, 1, 1,
0.5596741, 0.002033911, 0.9599369, 1, 1, 1, 1, 1,
0.5615633, 0.3224232, 3.729529, 1, 1, 1, 1, 1,
0.5635456, -0.8769727, 2.831302, 1, 1, 1, 1, 1,
0.5636832, 0.3086306, 0.1150102, 1, 1, 1, 1, 1,
0.5648101, -2.511586, 3.768721, 1, 1, 1, 1, 1,
0.566728, -0.8972536, 2.626872, 1, 1, 1, 1, 1,
0.5741934, 0.4083145, 0.6851001, 1, 1, 1, 1, 1,
0.5802315, 2.438019, 2.080436, 1, 1, 1, 1, 1,
0.5863483, 1.129836, 0.7072699, 1, 1, 1, 1, 1,
0.5889056, 0.8987463, 2.179675, 1, 1, 1, 1, 1,
0.58981, -1.297336, 4.516244, 1, 1, 1, 1, 1,
0.5907244, -0.8304374, 2.067767, 0, 0, 1, 1, 1,
0.5930408, 0.1257357, 0.3098527, 1, 0, 0, 1, 1,
0.5958791, 0.264194, -0.4003568, 1, 0, 0, 1, 1,
0.5997804, -0.7868385, 2.73014, 1, 0, 0, 1, 1,
0.6031686, 1.010606, 0.5501009, 1, 0, 0, 1, 1,
0.60428, 1.171527, 0.1909615, 1, 0, 0, 1, 1,
0.6043714, 0.818324, 0.4428659, 0, 0, 0, 1, 1,
0.6060282, -1.781552, 4.205276, 0, 0, 0, 1, 1,
0.6092133, 1.295026, 0.5951282, 0, 0, 0, 1, 1,
0.6109808, -0.8082075, 2.377467, 0, 0, 0, 1, 1,
0.6125519, -1.988917, 2.369616, 0, 0, 0, 1, 1,
0.6141287, 0.8236958, 3.346893, 0, 0, 0, 1, 1,
0.617664, 0.5955933, 1.86168, 0, 0, 0, 1, 1,
0.6255028, 2.568523, 0.6433619, 1, 1, 1, 1, 1,
0.6257093, 0.08844234, 0.4533549, 1, 1, 1, 1, 1,
0.6263907, 1.632548, -0.05538034, 1, 1, 1, 1, 1,
0.6329001, -1.198463, 4.06953, 1, 1, 1, 1, 1,
0.633125, 1.592243, 0.2617989, 1, 1, 1, 1, 1,
0.6331735, 2.936239, -3.589139, 1, 1, 1, 1, 1,
0.6401528, 1.186148, 2.774429, 1, 1, 1, 1, 1,
0.6433791, -0.3955394, 0.03924747, 1, 1, 1, 1, 1,
0.6439283, -0.6432603, 2.841449, 1, 1, 1, 1, 1,
0.6466954, -0.8696576, 1.966897, 1, 1, 1, 1, 1,
0.650877, -0.8434139, 1.431682, 1, 1, 1, 1, 1,
0.6516326, -0.1767533, 1.275952, 1, 1, 1, 1, 1,
0.6554638, 1.776778, 0.09216938, 1, 1, 1, 1, 1,
0.6583974, -0.4824847, 2.186136, 1, 1, 1, 1, 1,
0.6608137, -2.401296, 2.668781, 1, 1, 1, 1, 1,
0.6638957, -0.6079242, 2.699504, 0, 0, 1, 1, 1,
0.666555, 0.3527563, 0.01494326, 1, 0, 0, 1, 1,
0.6727082, 0.6256293, 2.209063, 1, 0, 0, 1, 1,
0.6741445, 0.5870945, 1.937512, 1, 0, 0, 1, 1,
0.676273, 1.747681, -0.6688498, 1, 0, 0, 1, 1,
0.6771789, -0.5401602, 1.02272, 1, 0, 0, 1, 1,
0.6776941, 0.5859777, 0.2497642, 0, 0, 0, 1, 1,
0.6818212, -1.63558, 0.6346321, 0, 0, 0, 1, 1,
0.6837609, 2.664456, -1.412658, 0, 0, 0, 1, 1,
0.6882586, 1.256299, 0.1982285, 0, 0, 0, 1, 1,
0.6888564, 1.228855, 0.09668747, 0, 0, 0, 1, 1,
0.690327, 1.259026, -2.372927, 0, 0, 0, 1, 1,
0.6903273, -0.7040124, 0.9177368, 0, 0, 0, 1, 1,
0.6908199, -0.3050448, 2.403662, 1, 1, 1, 1, 1,
0.6953268, 1.102965, 2.507114, 1, 1, 1, 1, 1,
0.6956607, -1.156861, 1.357121, 1, 1, 1, 1, 1,
0.7003717, -0.4911436, 2.853908, 1, 1, 1, 1, 1,
0.7009816, 0.9695229, 1.06554, 1, 1, 1, 1, 1,
0.7038204, -0.7321514, 3.30638, 1, 1, 1, 1, 1,
0.7045809, -0.1485675, 1.016343, 1, 1, 1, 1, 1,
0.7072037, 0.1177031, 1.918444, 1, 1, 1, 1, 1,
0.7095885, -0.1786906, 2.90346, 1, 1, 1, 1, 1,
0.714096, 0.320724, 1.045523, 1, 1, 1, 1, 1,
0.7144294, 0.9524043, -0.5243029, 1, 1, 1, 1, 1,
0.7190274, 0.151516, 1.682385, 1, 1, 1, 1, 1,
0.7204998, -0.6221809, 1.927477, 1, 1, 1, 1, 1,
0.7229099, -0.6515314, 2.083728, 1, 1, 1, 1, 1,
0.723802, -1.061633, 1.797506, 1, 1, 1, 1, 1,
0.7257667, 0.4561837, 1.442023, 0, 0, 1, 1, 1,
0.7269302, -0.2666603, 1.212889, 1, 0, 0, 1, 1,
0.730305, 1.176659, -1.277478, 1, 0, 0, 1, 1,
0.7319424, 1.155, -0.1065297, 1, 0, 0, 1, 1,
0.7340379, -0.2802849, 1.446366, 1, 0, 0, 1, 1,
0.750159, 2.066361, 1.618401, 1, 0, 0, 1, 1,
0.7566971, -1.120953, 5.264729, 0, 0, 0, 1, 1,
0.7569612, -0.06615955, 1.235862, 0, 0, 0, 1, 1,
0.7608867, -0.1626446, 1.727277, 0, 0, 0, 1, 1,
0.7624791, -1.188505, 1.558442, 0, 0, 0, 1, 1,
0.768155, 0.2118549, 0.2969711, 0, 0, 0, 1, 1,
0.7684975, -0.8499268, 1.528446, 0, 0, 0, 1, 1,
0.769116, 0.9203234, 1.326856, 0, 0, 0, 1, 1,
0.7700567, -0.3264818, 0.6813703, 1, 1, 1, 1, 1,
0.7703845, 1.219024, -0.06494849, 1, 1, 1, 1, 1,
0.7738046, 1.044385, 0.1020588, 1, 1, 1, 1, 1,
0.7756707, -0.1873012, -0.2831933, 1, 1, 1, 1, 1,
0.7760977, 1.06408, 0.5546831, 1, 1, 1, 1, 1,
0.7872797, 0.9987895, 0.292493, 1, 1, 1, 1, 1,
0.7887847, 0.2107227, 0.2071522, 1, 1, 1, 1, 1,
0.7952877, 0.3686698, 1.873002, 1, 1, 1, 1, 1,
0.7954194, 1.010937, 1.522076, 1, 1, 1, 1, 1,
0.7981333, -0.92462, 2.45738, 1, 1, 1, 1, 1,
0.8045384, 0.9143701, 1.585518, 1, 1, 1, 1, 1,
0.8138773, 1.057851, 1.141048, 1, 1, 1, 1, 1,
0.823625, -0.2201212, 3.11993, 1, 1, 1, 1, 1,
0.8331626, -1.843004, 1.616529, 1, 1, 1, 1, 1,
0.8353822, -0.5587023, 1.555986, 1, 1, 1, 1, 1,
0.8390558, -2.717904, 4.052196, 0, 0, 1, 1, 1,
0.8449722, 1.203008, 2.995366, 1, 0, 0, 1, 1,
0.8577322, 0.8290285, 1.366995, 1, 0, 0, 1, 1,
0.8615783, -0.6173073, 0.9929923, 1, 0, 0, 1, 1,
0.8620512, -0.6401232, 1.730834, 1, 0, 0, 1, 1,
0.8671762, -0.9564345, 2.237685, 1, 0, 0, 1, 1,
0.8710605, 0.3031723, 1.91527, 0, 0, 0, 1, 1,
0.8745496, -0.514976, 3.006055, 0, 0, 0, 1, 1,
0.8806227, -2.240677, 1.717273, 0, 0, 0, 1, 1,
0.8829147, 2.420956, 0.02203193, 0, 0, 0, 1, 1,
0.8847932, -1.69258, 2.82681, 0, 0, 0, 1, 1,
0.8865958, -0.8413439, 3.438632, 0, 0, 0, 1, 1,
0.8869655, 0.6106809, 0.850916, 0, 0, 0, 1, 1,
0.8919131, 1.133983, 0.4466793, 1, 1, 1, 1, 1,
0.8949338, 0.8835501, 0.7607322, 1, 1, 1, 1, 1,
0.9027101, 0.4634448, 0.08651645, 1, 1, 1, 1, 1,
0.9039009, 0.2826289, 1.721849, 1, 1, 1, 1, 1,
0.9040229, 1.141286, 1.857636, 1, 1, 1, 1, 1,
0.9098547, -0.2321351, 2.521028, 1, 1, 1, 1, 1,
0.9099354, 0.08891678, -0.4023011, 1, 1, 1, 1, 1,
0.9131073, 1.950264, 0.03972664, 1, 1, 1, 1, 1,
0.9208985, -0.5824935, 2.382316, 1, 1, 1, 1, 1,
0.9235138, -0.2436733, 1.064384, 1, 1, 1, 1, 1,
0.9253449, -0.5315267, 1.783708, 1, 1, 1, 1, 1,
0.9277506, -0.4003542, 1.026747, 1, 1, 1, 1, 1,
0.9284942, 0.2542747, 0.4582209, 1, 1, 1, 1, 1,
0.935271, 0.8563427, 0.5787775, 1, 1, 1, 1, 1,
0.9376087, -0.8195093, 0.839516, 1, 1, 1, 1, 1,
0.9376937, 1.742807, 3.517418, 0, 0, 1, 1, 1,
0.9404327, 0.688032, 1.267471, 1, 0, 0, 1, 1,
0.9430524, 0.5049307, 1.034309, 1, 0, 0, 1, 1,
0.9465317, 0.4378586, 2.344187, 1, 0, 0, 1, 1,
0.9511282, -0.6814407, 3.318264, 1, 0, 0, 1, 1,
0.9567561, -2.366739, 1.690115, 1, 0, 0, 1, 1,
0.9632066, 0.8478851, 0.1081556, 0, 0, 0, 1, 1,
0.9663851, 0.4622524, 1.103842, 0, 0, 0, 1, 1,
0.9667146, -0.3541979, 3.778605, 0, 0, 0, 1, 1,
0.9671817, -0.5882304, 0.7688826, 0, 0, 0, 1, 1,
0.9722006, -0.02822145, 0.4603592, 0, 0, 0, 1, 1,
0.9751624, 1.411708, 1.985766, 0, 0, 0, 1, 1,
0.9784642, -1.895063, 3.08938, 0, 0, 0, 1, 1,
0.9787532, -0.2663846, 1.601192, 1, 1, 1, 1, 1,
0.9835648, 0.05037213, -0.02380511, 1, 1, 1, 1, 1,
0.9869423, -0.4622327, 3.704767, 1, 1, 1, 1, 1,
0.9892895, -0.5894325, 2.655553, 1, 1, 1, 1, 1,
0.9910775, 0.3680304, -0.04957553, 1, 1, 1, 1, 1,
0.9917886, 1.911642, -0.7177148, 1, 1, 1, 1, 1,
0.9919145, 0.3447983, 2.244227, 1, 1, 1, 1, 1,
0.993574, -0.5519316, 2.471356, 1, 1, 1, 1, 1,
0.9960204, -0.2630407, 3.435266, 1, 1, 1, 1, 1,
1.001902, -0.09785202, 1.545574, 1, 1, 1, 1, 1,
1.004562, 1.545021, -0.1485347, 1, 1, 1, 1, 1,
1.00674, 0.7578752, 1.289878, 1, 1, 1, 1, 1,
1.008549, -0.1912948, 1.471708, 1, 1, 1, 1, 1,
1.013745, 0.7363616, 2.979403, 1, 1, 1, 1, 1,
1.014705, -0.1901582, 2.211303, 1, 1, 1, 1, 1,
1.020934, -0.5356452, 3.018666, 0, 0, 1, 1, 1,
1.035127, -0.2049122, 0.9178333, 1, 0, 0, 1, 1,
1.037289, -2.17251, 3.184634, 1, 0, 0, 1, 1,
1.041338, 0.4112, 1.910061, 1, 0, 0, 1, 1,
1.049587, 0.6991004, 2.449688, 1, 0, 0, 1, 1,
1.054984, 0.3786236, 1.251047, 1, 0, 0, 1, 1,
1.058677, -1.823409, 2.938577, 0, 0, 0, 1, 1,
1.060594, 0.5644444, 3.647047, 0, 0, 0, 1, 1,
1.066747, -0.5396554, 1.080761, 0, 0, 0, 1, 1,
1.077229, 0.6167831, 2.392954, 0, 0, 0, 1, 1,
1.08069, -2.126735, 1.285544, 0, 0, 0, 1, 1,
1.081182, 2.728308, -0.1622213, 0, 0, 0, 1, 1,
1.081199, 0.3941178, 2.541769, 0, 0, 0, 1, 1,
1.085553, 0.5569058, 0.3821324, 1, 1, 1, 1, 1,
1.091411, 0.2437731, -0.0042097, 1, 1, 1, 1, 1,
1.093087, -1.129503, 3.611681, 1, 1, 1, 1, 1,
1.102423, 0.1766932, 0.6844992, 1, 1, 1, 1, 1,
1.126007, -2.57443, 2.839035, 1, 1, 1, 1, 1,
1.131966, 1.137707, 0.560176, 1, 1, 1, 1, 1,
1.133312, 1.933801, 1.626362, 1, 1, 1, 1, 1,
1.133759, 2.398793, -0.8051137, 1, 1, 1, 1, 1,
1.135052, 1.119034, -0.524357, 1, 1, 1, 1, 1,
1.140159, -1.407485, 2.149514, 1, 1, 1, 1, 1,
1.141796, 0.5048596, 0.2822973, 1, 1, 1, 1, 1,
1.156356, -0.5135754, 5.16463, 1, 1, 1, 1, 1,
1.158221, -1.075317, 3.847505, 1, 1, 1, 1, 1,
1.161871, 0.2522628, 2.544717, 1, 1, 1, 1, 1,
1.162501, 0.6816425, 0.8820203, 1, 1, 1, 1, 1,
1.162886, 0.4888622, 0.7449698, 0, 0, 1, 1, 1,
1.164861, 2.088989, 1.943667, 1, 0, 0, 1, 1,
1.170792, -0.7786029, 3.710084, 1, 0, 0, 1, 1,
1.175944, -0.3609643, 2.794192, 1, 0, 0, 1, 1,
1.177107, 0.05403665, 1.087714, 1, 0, 0, 1, 1,
1.180016, -0.678666, 0.9583551, 1, 0, 0, 1, 1,
1.1893, -0.6215633, 3.822989, 0, 0, 0, 1, 1,
1.19283, -1.478378, 2.278986, 0, 0, 0, 1, 1,
1.197861, -1.26885, 2.928432, 0, 0, 0, 1, 1,
1.202059, -0.7198136, 3.646548, 0, 0, 0, 1, 1,
1.204544, 1.448034, -0.0523157, 0, 0, 0, 1, 1,
1.204791, -1.381786, 2.050988, 0, 0, 0, 1, 1,
1.216997, -0.4276896, 1.731735, 0, 0, 0, 1, 1,
1.22777, 0.4938757, 0.9681306, 1, 1, 1, 1, 1,
1.237686, 0.6429242, 0.2489423, 1, 1, 1, 1, 1,
1.250554, 0.3959081, 3.0771, 1, 1, 1, 1, 1,
1.252541, 0.4656541, 1.546995, 1, 1, 1, 1, 1,
1.253664, 0.5480757, 0.965349, 1, 1, 1, 1, 1,
1.264167, 0.6339896, 0.1813659, 1, 1, 1, 1, 1,
1.267869, -0.6218198, 3.604542, 1, 1, 1, 1, 1,
1.270944, 3.234417, 0.07360003, 1, 1, 1, 1, 1,
1.274468, -1.283986, 4.684281, 1, 1, 1, 1, 1,
1.279472, -1.359425, 1.31348, 1, 1, 1, 1, 1,
1.285655, -1.44255, 2.076807, 1, 1, 1, 1, 1,
1.287788, -0.3752889, 1.154946, 1, 1, 1, 1, 1,
1.297475, 1.619404, 0.4567482, 1, 1, 1, 1, 1,
1.301413, -2.177846, 3.805909, 1, 1, 1, 1, 1,
1.301779, -0.5443813, 2.326783, 1, 1, 1, 1, 1,
1.301902, -1.20421, 4.022144, 0, 0, 1, 1, 1,
1.305506, 0.207302, 0.3961885, 1, 0, 0, 1, 1,
1.311198, 0.4758857, 2.311367, 1, 0, 0, 1, 1,
1.324438, -0.006901268, 1.887726, 1, 0, 0, 1, 1,
1.334872, -0.3090849, 1.694751, 1, 0, 0, 1, 1,
1.33817, -0.7282145, 1.571003, 1, 0, 0, 1, 1,
1.340147, 0.2664369, -0.313259, 0, 0, 0, 1, 1,
1.353568, 1.228508, 0.6029175, 0, 0, 0, 1, 1,
1.362936, 1.890388, -1.322757, 0, 0, 0, 1, 1,
1.36572, -0.1686723, 1.28189, 0, 0, 0, 1, 1,
1.367428, -0.3753659, 2.955661, 0, 0, 0, 1, 1,
1.367757, 0.0608959, 1.897377, 0, 0, 0, 1, 1,
1.379147, 0.2500097, 0.2539707, 0, 0, 0, 1, 1,
1.390863, -2.441141, 2.849195, 1, 1, 1, 1, 1,
1.391203, 0.3126379, 0.7634684, 1, 1, 1, 1, 1,
1.397965, 0.04096723, 0.6379105, 1, 1, 1, 1, 1,
1.400221, 0.7340692, 0.7486496, 1, 1, 1, 1, 1,
1.415739, -2.205127, 0.9498045, 1, 1, 1, 1, 1,
1.420111, -0.9049353, 1.91423, 1, 1, 1, 1, 1,
1.421757, -0.8362321, 2.331092, 1, 1, 1, 1, 1,
1.423601, -0.08172552, 3.785574, 1, 1, 1, 1, 1,
1.427976, -0.4811276, 0.4264066, 1, 1, 1, 1, 1,
1.430321, -0.419687, 1.04303, 1, 1, 1, 1, 1,
1.431672, 0.7753309, 2.235988, 1, 1, 1, 1, 1,
1.433341, -0.3478703, 1.360005, 1, 1, 1, 1, 1,
1.436732, 0.5303552, 0.3600182, 1, 1, 1, 1, 1,
1.448562, -1.234773, 1.944319, 1, 1, 1, 1, 1,
1.453017, 0.9945481, -1.099643, 1, 1, 1, 1, 1,
1.461741, -0.8167571, 2.728444, 0, 0, 1, 1, 1,
1.466574, 0.232346, -0.1686752, 1, 0, 0, 1, 1,
1.47546, -0.9352313, 1.04861, 1, 0, 0, 1, 1,
1.476364, -0.08136556, 2.527717, 1, 0, 0, 1, 1,
1.487092, 0.7573905, 3.122161, 1, 0, 0, 1, 1,
1.493986, 0.5327744, -0.08818371, 1, 0, 0, 1, 1,
1.530724, -1.030431, 3.28425, 0, 0, 0, 1, 1,
1.55481, 1.067442, 1.15952, 0, 0, 0, 1, 1,
1.555082, -0.06195697, 1.131187, 0, 0, 0, 1, 1,
1.561794, -0.03838665, 2.239972, 0, 0, 0, 1, 1,
1.56331, 0.2519825, 0.01024571, 0, 0, 0, 1, 1,
1.586814, 0.6054701, 1.008658, 0, 0, 0, 1, 1,
1.593379, 1.018837, 0.661225, 0, 0, 0, 1, 1,
1.601454, 0.1346427, 0.3124563, 1, 1, 1, 1, 1,
1.609675, 1.018267, -0.8669854, 1, 1, 1, 1, 1,
1.615476, -0.1095776, 1.542569, 1, 1, 1, 1, 1,
1.618806, 0.5980803, 0.5840803, 1, 1, 1, 1, 1,
1.630679, -0.4592996, 3.72384, 1, 1, 1, 1, 1,
1.650704, 0.3151942, 1.620605, 1, 1, 1, 1, 1,
1.651311, 0.2098789, 0.003783135, 1, 1, 1, 1, 1,
1.657753, -0.2188779, 2.401309, 1, 1, 1, 1, 1,
1.664588, 0.4400145, 1.863572, 1, 1, 1, 1, 1,
1.671203, 0.5750667, 1.606264, 1, 1, 1, 1, 1,
1.676383, 0.157017, 2.200499, 1, 1, 1, 1, 1,
1.677046, -1.595993, 1.822368, 1, 1, 1, 1, 1,
1.678012, 0.5674528, -0.1735169, 1, 1, 1, 1, 1,
1.68314, 1.192089, 0.6420062, 1, 1, 1, 1, 1,
1.696534, -1.443968, 2.853272, 1, 1, 1, 1, 1,
1.703953, -0.5081282, 1.001889, 0, 0, 1, 1, 1,
1.703973, 1.288672, -0.5027213, 1, 0, 0, 1, 1,
1.706873, -1.410618, 1.218691, 1, 0, 0, 1, 1,
1.715596, -1.273995, 0.5455561, 1, 0, 0, 1, 1,
1.717485, -1.019307, 0.9332026, 1, 0, 0, 1, 1,
1.727559, 0.2528244, 2.333184, 1, 0, 0, 1, 1,
1.734546, 1.733133, 1.590679, 0, 0, 0, 1, 1,
1.735064, 0.2954613, 1.485004, 0, 0, 0, 1, 1,
1.740981, -0.8035482, 2.528646, 0, 0, 0, 1, 1,
1.756362, -0.5123019, 0.8888773, 0, 0, 0, 1, 1,
1.7824, 1.313976, 1.117162, 0, 0, 0, 1, 1,
1.802041, 0.1974649, 1.171803, 0, 0, 0, 1, 1,
1.826857, -0.3160141, 1.79168, 0, 0, 0, 1, 1,
1.837898, 0.08419247, 1.16056, 1, 1, 1, 1, 1,
1.843209, -0.8244877, 2.196264, 1, 1, 1, 1, 1,
1.84619, 0.2852898, 0.8160205, 1, 1, 1, 1, 1,
1.889569, 1.225599, 0.4122085, 1, 1, 1, 1, 1,
1.892625, 2.015938, -0.01959921, 1, 1, 1, 1, 1,
1.916926, -2.111339, 4.595251, 1, 1, 1, 1, 1,
1.919838, -1.32708, 1.88075, 1, 1, 1, 1, 1,
1.931561, 0.04513083, 1.760643, 1, 1, 1, 1, 1,
1.936787, 0.4014213, 0.6674097, 1, 1, 1, 1, 1,
1.958228, 0.07176853, 2.202778, 1, 1, 1, 1, 1,
1.971146, -0.02502267, 2.087057, 1, 1, 1, 1, 1,
1.976725, -1.25678, 3.854079, 1, 1, 1, 1, 1,
2.006216, 1.08438, 1.532489, 1, 1, 1, 1, 1,
2.024553, -2.27461, 2.839863, 1, 1, 1, 1, 1,
2.032646, -0.2154416, 1.901176, 1, 1, 1, 1, 1,
2.034721, -0.7014223, 1.555346, 0, 0, 1, 1, 1,
2.055051, -0.3074678, 3.740633, 1, 0, 0, 1, 1,
2.066844, 0.9975582, 1.125227, 1, 0, 0, 1, 1,
2.120845, 0.3427909, 0.395313, 1, 0, 0, 1, 1,
2.130059, 0.1370025, 2.225135, 1, 0, 0, 1, 1,
2.145291, -2.347424, 1.957265, 1, 0, 0, 1, 1,
2.148599, -1.446635, 1.765441, 0, 0, 0, 1, 1,
2.189645, 0.6657202, 2.134804, 0, 0, 0, 1, 1,
2.347533, -1.133376, 1.810439, 0, 0, 0, 1, 1,
2.363764, -0.5694339, 1.174001, 0, 0, 0, 1, 1,
2.366438, -0.7297124, -0.2762246, 0, 0, 0, 1, 1,
2.452282, 2.521789, 1.307195, 0, 0, 0, 1, 1,
2.507587, -0.7403036, 2.188628, 0, 0, 0, 1, 1,
2.609889, 0.6559685, 0.5571402, 1, 1, 1, 1, 1,
2.701607, -0.6612393, 1.586618, 1, 1, 1, 1, 1,
2.796527, 1.638314, 0.5559832, 1, 1, 1, 1, 1,
2.821224, 0.05566937, 0.9739462, 1, 1, 1, 1, 1,
2.889251, 2.201823, 0.359187, 1, 1, 1, 1, 1,
3.083223, -1.870364, 0.8404675, 1, 1, 1, 1, 1,
3.474083, -1.362459, 2.010304, 1, 1, 1, 1, 1
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
var radius = 9.745303;
var distance = 34.22997;
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
mvMatrix.translate( -0.08573508, -0.3213624, 0.237952 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.22997);
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
