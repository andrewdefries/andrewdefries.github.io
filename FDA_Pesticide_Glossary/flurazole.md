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
-3.645062, -1.817541, -1.730662, 1, 0, 0, 1,
-3.138113, -1.579102, -1.85903, 1, 0.007843138, 0, 1,
-3.12545, 0.7480759, -0.5569475, 1, 0.01176471, 0, 1,
-2.929459, -1.699881, -1.785067, 1, 0.01960784, 0, 1,
-2.883367, 1.232588, -1.200604, 1, 0.02352941, 0, 1,
-2.861881, 0.8786498, 0.195471, 1, 0.03137255, 0, 1,
-2.795855, -0.1221839, -2.980624, 1, 0.03529412, 0, 1,
-2.686944, -0.795723, -1.199965, 1, 0.04313726, 0, 1,
-2.68104, 0.7044934, -2.761991, 1, 0.04705882, 0, 1,
-2.483189, -1.174089, -2.43473, 1, 0.05490196, 0, 1,
-2.45468, -0.8449141, -2.842423, 1, 0.05882353, 0, 1,
-2.294756, 1.287254, -1.571718, 1, 0.06666667, 0, 1,
-2.281953, -0.9361038, -2.191612, 1, 0.07058824, 0, 1,
-2.229666, 0.1451242, 0.8185554, 1, 0.07843138, 0, 1,
-2.189861, -0.6853082, -2.082824, 1, 0.08235294, 0, 1,
-2.161138, 0.8388513, -1.631716, 1, 0.09019608, 0, 1,
-2.128521, 1.000508, -1.440438, 1, 0.09411765, 0, 1,
-2.098873, -0.3115908, -1.751815, 1, 0.1019608, 0, 1,
-2.092094, 1.75805, -1.225499, 1, 0.1098039, 0, 1,
-2.052336, 1.340619, -0.03101797, 1, 0.1137255, 0, 1,
-2.031058, 0.5213602, -1.286099, 1, 0.1215686, 0, 1,
-2.017813, 0.8666388, -2.123614, 1, 0.1254902, 0, 1,
-1.987218, 0.05714909, -1.033752, 1, 0.1333333, 0, 1,
-1.93708, -0.02987897, -0.6757423, 1, 0.1372549, 0, 1,
-1.925261, 0.5844305, -1.227956, 1, 0.145098, 0, 1,
-1.842363, -0.1450339, -1.493484, 1, 0.1490196, 0, 1,
-1.838141, -0.9113896, -4.099132, 1, 0.1568628, 0, 1,
-1.834516, -0.9132451, -2.279911, 1, 0.1607843, 0, 1,
-1.819463, 0.1050968, -2.063465, 1, 0.1686275, 0, 1,
-1.815046, -1.21642, -2.12751, 1, 0.172549, 0, 1,
-1.80124, -0.4680625, -2.335595, 1, 0.1803922, 0, 1,
-1.795244, 0.9610967, -1.070803, 1, 0.1843137, 0, 1,
-1.741858, 0.5168265, -0.6367164, 1, 0.1921569, 0, 1,
-1.737295, -0.2310079, -1.808752, 1, 0.1960784, 0, 1,
-1.701141, -2.108702, -3.200115, 1, 0.2039216, 0, 1,
-1.676995, 1.181208, -1.320094, 1, 0.2117647, 0, 1,
-1.665281, -2.13127, -2.526793, 1, 0.2156863, 0, 1,
-1.661827, -0.2865663, -1.776386, 1, 0.2235294, 0, 1,
-1.659041, -0.3975319, -1.11742, 1, 0.227451, 0, 1,
-1.65351, 0.4445815, -2.248382, 1, 0.2352941, 0, 1,
-1.653083, -0.9153602, -1.119386, 1, 0.2392157, 0, 1,
-1.65142, -0.05965194, -1.799263, 1, 0.2470588, 0, 1,
-1.622387, -1.493885, -3.740882, 1, 0.2509804, 0, 1,
-1.608203, 0.3297333, -1.38597, 1, 0.2588235, 0, 1,
-1.598774, 1.554085, -0.7938882, 1, 0.2627451, 0, 1,
-1.591485, 0.7988452, -1.356727, 1, 0.2705882, 0, 1,
-1.580203, 0.4940551, -1.923817, 1, 0.2745098, 0, 1,
-1.578474, 1.192544, -0.7414396, 1, 0.282353, 0, 1,
-1.561545, -0.3519952, -3.998794, 1, 0.2862745, 0, 1,
-1.554653, 1.356128, 0.9981233, 1, 0.2941177, 0, 1,
-1.547675, 2.433637, -1.680115, 1, 0.3019608, 0, 1,
-1.543616, -0.5949436, -1.716321, 1, 0.3058824, 0, 1,
-1.535605, -0.2054032, -1.026662, 1, 0.3137255, 0, 1,
-1.518221, -1.419937, -3.523011, 1, 0.3176471, 0, 1,
-1.501591, -0.1881206, -2.424571, 1, 0.3254902, 0, 1,
-1.488108, -0.8086712, -2.638823, 1, 0.3294118, 0, 1,
-1.48245, 0.006762096, -3.246874, 1, 0.3372549, 0, 1,
-1.47969, -0.2447371, -1.922109, 1, 0.3411765, 0, 1,
-1.47716, -0.5131395, 0.1468424, 1, 0.3490196, 0, 1,
-1.469898, 0.6159402, 0.6641926, 1, 0.3529412, 0, 1,
-1.467654, 2.245543, 0.8859384, 1, 0.3607843, 0, 1,
-1.459442, -0.4236304, -3.203439, 1, 0.3647059, 0, 1,
-1.450094, 0.3697231, -1.836367, 1, 0.372549, 0, 1,
-1.448299, 0.8167464, -1.804853, 1, 0.3764706, 0, 1,
-1.446323, 1.161209, -0.6753687, 1, 0.3843137, 0, 1,
-1.441329, -2.323562, -2.301573, 1, 0.3882353, 0, 1,
-1.435519, -1.108355, -2.773287, 1, 0.3960784, 0, 1,
-1.432501, 0.2792057, 0.6449274, 1, 0.4039216, 0, 1,
-1.414043, 0.3873067, -1.773512, 1, 0.4078431, 0, 1,
-1.409002, 1.675535, -1.131116, 1, 0.4156863, 0, 1,
-1.404208, -0.6628467, -1.50919, 1, 0.4196078, 0, 1,
-1.402757, 1.017997, -1.131954, 1, 0.427451, 0, 1,
-1.401932, -0.1810819, -1.350459, 1, 0.4313726, 0, 1,
-1.396657, 0.6074338, -0.5382696, 1, 0.4392157, 0, 1,
-1.392499, 0.7612869, 0.8424733, 1, 0.4431373, 0, 1,
-1.3893, -0.2931252, -2.373997, 1, 0.4509804, 0, 1,
-1.374546, -0.4756153, -1.306337, 1, 0.454902, 0, 1,
-1.371511, -0.5088663, -1.751227, 1, 0.4627451, 0, 1,
-1.367271, -0.7296907, -0.2219156, 1, 0.4666667, 0, 1,
-1.364452, -1.686156, -1.783768, 1, 0.4745098, 0, 1,
-1.34509, 0.02495151, -0.7369719, 1, 0.4784314, 0, 1,
-1.338468, 0.4517986, -0.7351627, 1, 0.4862745, 0, 1,
-1.337273, -0.01478116, -0.8829104, 1, 0.4901961, 0, 1,
-1.328931, 2.369364, -1.009565, 1, 0.4980392, 0, 1,
-1.323166, 0.7693341, -1.998023, 1, 0.5058824, 0, 1,
-1.322494, 0.206572, -1.639782, 1, 0.509804, 0, 1,
-1.319231, 0.1402571, -1.629995, 1, 0.5176471, 0, 1,
-1.310667, -0.2153257, -1.833543, 1, 0.5215687, 0, 1,
-1.300755, -0.6099872, -3.087464, 1, 0.5294118, 0, 1,
-1.300105, 0.1196086, -2.010779, 1, 0.5333334, 0, 1,
-1.298043, 0.563538, -1.252354, 1, 0.5411765, 0, 1,
-1.296151, 0.1455816, -2.090653, 1, 0.5450981, 0, 1,
-1.288541, 1.498672, -0.6749904, 1, 0.5529412, 0, 1,
-1.281835, 0.779467, -1.175568, 1, 0.5568628, 0, 1,
-1.274874, -0.3371724, -3.29769, 1, 0.5647059, 0, 1,
-1.273555, -1.54338, -1.800328, 1, 0.5686275, 0, 1,
-1.269744, -2.186941, -1.354156, 1, 0.5764706, 0, 1,
-1.26314, 0.5053753, -2.56565, 1, 0.5803922, 0, 1,
-1.25546, 0.3632346, -0.7916985, 1, 0.5882353, 0, 1,
-1.234418, -0.04341732, -3.427003, 1, 0.5921569, 0, 1,
-1.233637, -0.4330192, -1.282753, 1, 0.6, 0, 1,
-1.23065, -0.1665664, -0.6398478, 1, 0.6078432, 0, 1,
-1.224063, -0.1408082, -1.382558, 1, 0.6117647, 0, 1,
-1.216911, 1.652704, -1.810404, 1, 0.6196079, 0, 1,
-1.215489, 1.947998, 0.4220692, 1, 0.6235294, 0, 1,
-1.212577, 0.2431522, -1.299241, 1, 0.6313726, 0, 1,
-1.205158, 0.1973756, -1.087673, 1, 0.6352941, 0, 1,
-1.203892, 1.338427, 0.1593276, 1, 0.6431373, 0, 1,
-1.200395, 0.7143011, 0.6076561, 1, 0.6470588, 0, 1,
-1.187817, 0.8615977, -2.324286, 1, 0.654902, 0, 1,
-1.18658, 0.5277649, -1.340824, 1, 0.6588235, 0, 1,
-1.174077, -0.7128221, -4.370769, 1, 0.6666667, 0, 1,
-1.171502, -0.6284658, -0.3006347, 1, 0.6705883, 0, 1,
-1.170168, -0.7074391, -1.536545, 1, 0.6784314, 0, 1,
-1.168392, -0.278644, -1.235328, 1, 0.682353, 0, 1,
-1.162272, 0.1097628, 0.04070189, 1, 0.6901961, 0, 1,
-1.154185, -0.5210809, -2.388985, 1, 0.6941177, 0, 1,
-1.152008, 0.4457582, -0.9193527, 1, 0.7019608, 0, 1,
-1.147997, 0.7902904, -0.6797575, 1, 0.7098039, 0, 1,
-1.145393, -1.293365, -2.260601, 1, 0.7137255, 0, 1,
-1.145241, 1.548077, -2.169614, 1, 0.7215686, 0, 1,
-1.138847, -0.988188, -2.073113, 1, 0.7254902, 0, 1,
-1.134361, 1.041014, -0.1833859, 1, 0.7333333, 0, 1,
-1.131198, -2.220503, -2.305504, 1, 0.7372549, 0, 1,
-1.122976, 0.6481217, -2.527105, 1, 0.7450981, 0, 1,
-1.120585, -0.2621581, -3.60823, 1, 0.7490196, 0, 1,
-1.119817, 0.02953008, -2.106102, 1, 0.7568628, 0, 1,
-1.114144, -0.2184301, -2.868436, 1, 0.7607843, 0, 1,
-1.109917, 0.5355104, 0.05315572, 1, 0.7686275, 0, 1,
-1.106127, -0.2707627, -1.224921, 1, 0.772549, 0, 1,
-1.101808, -1.182488, -3.492126, 1, 0.7803922, 0, 1,
-1.100488, -0.4006631, -2.278816, 1, 0.7843137, 0, 1,
-1.096728, 0.161069, -0.950473, 1, 0.7921569, 0, 1,
-1.085522, 1.334272, -1.35729, 1, 0.7960784, 0, 1,
-1.084913, 1.110388, -2.228168, 1, 0.8039216, 0, 1,
-1.084336, -0.1720654, -0.03807797, 1, 0.8117647, 0, 1,
-1.080356, 0.3309101, -1.42623, 1, 0.8156863, 0, 1,
-1.06635, 0.5898184, 0.0763633, 1, 0.8235294, 0, 1,
-1.061898, 0.4909821, -1.146367, 1, 0.827451, 0, 1,
-1.061188, -0.6698745, -3.051963, 1, 0.8352941, 0, 1,
-1.058352, 0.5865638, -1.249749, 1, 0.8392157, 0, 1,
-1.052537, -0.9176289, -3.024209, 1, 0.8470588, 0, 1,
-1.041571, 0.8784135, -2.382961, 1, 0.8509804, 0, 1,
-1.037101, -0.2591915, -3.972199, 1, 0.8588235, 0, 1,
-1.036337, -0.388753, -0.5983008, 1, 0.8627451, 0, 1,
-1.0357, 0.1933753, -3.488168, 1, 0.8705882, 0, 1,
-1.029383, -0.1197803, -2.104581, 1, 0.8745098, 0, 1,
-1.027312, -1.299395, -2.6099, 1, 0.8823529, 0, 1,
-1.027172, -1.466045, -3.475711, 1, 0.8862745, 0, 1,
-1.023625, 0.947393, 0.123663, 1, 0.8941177, 0, 1,
-1.019213, 2.027375, -0.3877317, 1, 0.8980392, 0, 1,
-1.008118, 0.8937997, -0.5761132, 1, 0.9058824, 0, 1,
-1.0038, 1.807856, -0.795476, 1, 0.9137255, 0, 1,
-0.9922342, 0.8495713, -0.7252981, 1, 0.9176471, 0, 1,
-0.9823544, 0.8943794, -0.4314131, 1, 0.9254902, 0, 1,
-0.9770382, 0.7205081, -0.8000563, 1, 0.9294118, 0, 1,
-0.9756296, -0.2748648, -1.336586, 1, 0.9372549, 0, 1,
-0.973055, 0.2821609, -1.132665, 1, 0.9411765, 0, 1,
-0.964906, 2.04552, 0.2579965, 1, 0.9490196, 0, 1,
-0.9603531, 0.3048123, -1.109322, 1, 0.9529412, 0, 1,
-0.9568986, 1.074868, -0.2896414, 1, 0.9607843, 0, 1,
-0.9561483, 1.005414, 0.03434512, 1, 0.9647059, 0, 1,
-0.9528206, 0.3623179, -2.558318, 1, 0.972549, 0, 1,
-0.9519222, 0.1409352, -3.548176, 1, 0.9764706, 0, 1,
-0.9458867, -1.61485, -1.273672, 1, 0.9843137, 0, 1,
-0.9447491, -0.03965791, -1.813232, 1, 0.9882353, 0, 1,
-0.9440904, 1.377375, 0.6822295, 1, 0.9960784, 0, 1,
-0.940272, 0.4099319, -2.005308, 0.9960784, 1, 0, 1,
-0.9376594, -0.7602095, -3.485639, 0.9921569, 1, 0, 1,
-0.9275785, 0.03063512, -0.6195499, 0.9843137, 1, 0, 1,
-0.9236951, 0.08504716, -1.507151, 0.9803922, 1, 0, 1,
-0.9123605, -1.629432, -1.728944, 0.972549, 1, 0, 1,
-0.9118013, -1.405671, -0.9434505, 0.9686275, 1, 0, 1,
-0.9060298, 0.3375139, 0.6186947, 0.9607843, 1, 0, 1,
-0.9038949, 0.801738, -1.102274, 0.9568627, 1, 0, 1,
-0.8992563, 1.46186, -0.09149266, 0.9490196, 1, 0, 1,
-0.8966937, -1.134647, -2.877033, 0.945098, 1, 0, 1,
-0.8952923, 1.766011, 0.1945814, 0.9372549, 1, 0, 1,
-0.8919868, -1.113546, -3.684542, 0.9333333, 1, 0, 1,
-0.8914097, 0.5651094, -0.7369996, 0.9254902, 1, 0, 1,
-0.884391, -0.3887437, -2.01258, 0.9215686, 1, 0, 1,
-0.8815556, -0.6533176, -1.70462, 0.9137255, 1, 0, 1,
-0.8806936, 0.3744095, -0.6211948, 0.9098039, 1, 0, 1,
-0.8804038, -0.6157261, -3.081301, 0.9019608, 1, 0, 1,
-0.876618, 0.1735651, -2.190727, 0.8941177, 1, 0, 1,
-0.874125, 0.1599178, -1.636413, 0.8901961, 1, 0, 1,
-0.8737648, -0.06923439, -0.4875526, 0.8823529, 1, 0, 1,
-0.8712041, -0.4024662, -1.692185, 0.8784314, 1, 0, 1,
-0.8654225, -0.3931958, -1.953898, 0.8705882, 1, 0, 1,
-0.8598186, -0.1283884, -1.625069, 0.8666667, 1, 0, 1,
-0.8560245, -1.547951, -2.422372, 0.8588235, 1, 0, 1,
-0.8514108, -1.116289, -3.204866, 0.854902, 1, 0, 1,
-0.8415071, 0.3859991, -1.794158, 0.8470588, 1, 0, 1,
-0.8385623, -0.6486018, -3.623273, 0.8431373, 1, 0, 1,
-0.8358512, -0.06804086, -2.289888, 0.8352941, 1, 0, 1,
-0.8355523, 0.4438534, -1.889271, 0.8313726, 1, 0, 1,
-0.8352574, 0.001509348, -1.069308, 0.8235294, 1, 0, 1,
-0.8327745, -1.712783, -2.17046, 0.8196079, 1, 0, 1,
-0.8306111, 1.299515, 1.380424, 0.8117647, 1, 0, 1,
-0.8302618, 1.862334, -1.313137, 0.8078431, 1, 0, 1,
-0.8274034, -0.4541714, -1.401679, 0.8, 1, 0, 1,
-0.8233747, -0.07516666, -1.406983, 0.7921569, 1, 0, 1,
-0.8217332, -1.091855, -2.866347, 0.7882353, 1, 0, 1,
-0.8175226, -0.006035316, -1.88008, 0.7803922, 1, 0, 1,
-0.8148993, -0.3996988, -1.754182, 0.7764706, 1, 0, 1,
-0.8147915, 0.8611538, -0.252313, 0.7686275, 1, 0, 1,
-0.8071197, 0.1140446, -1.811675, 0.7647059, 1, 0, 1,
-0.8067004, 1.618003, -0.6060767, 0.7568628, 1, 0, 1,
-0.8032445, -1.493915, -3.167879, 0.7529412, 1, 0, 1,
-0.8028294, -0.4460577, -1.932778, 0.7450981, 1, 0, 1,
-0.801881, -0.523533, -2.269721, 0.7411765, 1, 0, 1,
-0.8017842, 1.104202, -1.428045, 0.7333333, 1, 0, 1,
-0.8000303, 0.5706671, -0.5103138, 0.7294118, 1, 0, 1,
-0.7985219, 0.1559347, -2.316988, 0.7215686, 1, 0, 1,
-0.7931374, -0.1249675, -0.1106356, 0.7176471, 1, 0, 1,
-0.7916375, 0.0230038, -2.334712, 0.7098039, 1, 0, 1,
-0.7905831, 0.5864764, -2.344835, 0.7058824, 1, 0, 1,
-0.7879365, -0.2293088, -0.7297214, 0.6980392, 1, 0, 1,
-0.7823346, -1.802356, -4.257208, 0.6901961, 1, 0, 1,
-0.7726489, 0.8052738, -0.8960188, 0.6862745, 1, 0, 1,
-0.7708205, 0.3196661, -1.97728, 0.6784314, 1, 0, 1,
-0.7680885, -1.445755, -1.430049, 0.6745098, 1, 0, 1,
-0.76655, 2.29226, -0.3474012, 0.6666667, 1, 0, 1,
-0.7647117, 0.8990787, -1.49663, 0.6627451, 1, 0, 1,
-0.7624426, 0.8394331, -0.9078593, 0.654902, 1, 0, 1,
-0.7615996, 0.9899202, -2.251439, 0.6509804, 1, 0, 1,
-0.7545096, 0.1351728, -2.875011, 0.6431373, 1, 0, 1,
-0.7542689, -0.3223683, -0.7454674, 0.6392157, 1, 0, 1,
-0.749198, 0.02874624, -1.870137, 0.6313726, 1, 0, 1,
-0.7409256, 1.337222, 0.6643362, 0.627451, 1, 0, 1,
-0.739961, 0.5890249, 1.277168, 0.6196079, 1, 0, 1,
-0.7364293, 0.4355755, -1.544237, 0.6156863, 1, 0, 1,
-0.735229, 0.2720284, -1.7061, 0.6078432, 1, 0, 1,
-0.734715, 0.6212515, -0.4941702, 0.6039216, 1, 0, 1,
-0.7340985, 1.004957, -0.621197, 0.5960785, 1, 0, 1,
-0.7305771, -0.7231503, -2.913454, 0.5882353, 1, 0, 1,
-0.7266353, -1.452055, -2.79827, 0.5843138, 1, 0, 1,
-0.7233042, -0.04209533, -1.33394, 0.5764706, 1, 0, 1,
-0.7207499, 1.027361, -0.6709056, 0.572549, 1, 0, 1,
-0.7174489, -0.2847075, -2.228352, 0.5647059, 1, 0, 1,
-0.7139193, 0.07661418, -1.471471, 0.5607843, 1, 0, 1,
-0.712257, -0.8622317, -1.428334, 0.5529412, 1, 0, 1,
-0.7093353, -0.2045905, -2.090407, 0.5490196, 1, 0, 1,
-0.7080351, 1.060374, -0.6487991, 0.5411765, 1, 0, 1,
-0.702453, 1.415789, 0.6365358, 0.5372549, 1, 0, 1,
-0.7005929, 0.1271629, -1.095092, 0.5294118, 1, 0, 1,
-0.7004178, 0.7149735, 0.2156174, 0.5254902, 1, 0, 1,
-0.6956585, -0.05029491, -0.1576645, 0.5176471, 1, 0, 1,
-0.6920862, -1.093627, -1.70928, 0.5137255, 1, 0, 1,
-0.6919268, -0.3985645, -1.988924, 0.5058824, 1, 0, 1,
-0.6900578, -0.5743545, -0.8320491, 0.5019608, 1, 0, 1,
-0.6833993, 0.7756705, -1.85817, 0.4941176, 1, 0, 1,
-0.6826286, 0.961445, -0.3307863, 0.4862745, 1, 0, 1,
-0.670058, -0.5875721, -3.733246, 0.4823529, 1, 0, 1,
-0.6673875, -0.6716651, -1.562, 0.4745098, 1, 0, 1,
-0.6664246, -1.411972, -0.6286423, 0.4705882, 1, 0, 1,
-0.6661605, -0.4636884, -2.907927, 0.4627451, 1, 0, 1,
-0.6654602, -0.8299192, -3.205217, 0.4588235, 1, 0, 1,
-0.6652418, 0.587436, -0.9458258, 0.4509804, 1, 0, 1,
-0.6640686, -1.154239, -2.146746, 0.4470588, 1, 0, 1,
-0.6578491, 1.841494, -0.8497454, 0.4392157, 1, 0, 1,
-0.657726, 0.4381183, -1.537181, 0.4352941, 1, 0, 1,
-0.6570342, 0.4850654, -0.8493022, 0.427451, 1, 0, 1,
-0.6527589, 0.614335, -0.6484485, 0.4235294, 1, 0, 1,
-0.6525756, -1.575045, -1.077472, 0.4156863, 1, 0, 1,
-0.6523592, -0.1829356, -2.57208, 0.4117647, 1, 0, 1,
-0.6410204, -1.755046, -2.212985, 0.4039216, 1, 0, 1,
-0.6350294, 0.4072801, -0.8582935, 0.3960784, 1, 0, 1,
-0.6298758, 2.087637, -1.762354, 0.3921569, 1, 0, 1,
-0.6294264, 0.4396651, 0.3790245, 0.3843137, 1, 0, 1,
-0.6276955, 0.6839181, -2.355164, 0.3803922, 1, 0, 1,
-0.6224497, -0.6322019, -3.401179, 0.372549, 1, 0, 1,
-0.6202103, 1.645612, -0.8147053, 0.3686275, 1, 0, 1,
-0.6197746, -0.1337595, -0.01444766, 0.3607843, 1, 0, 1,
-0.6197257, 0.5629209, -1.480113, 0.3568628, 1, 0, 1,
-0.6175344, 0.2214015, -2.72478, 0.3490196, 1, 0, 1,
-0.6147935, -0.6572961, -5.048173, 0.345098, 1, 0, 1,
-0.6145651, -0.4148166, -2.480954, 0.3372549, 1, 0, 1,
-0.6143264, 0.2962926, -0.8784828, 0.3333333, 1, 0, 1,
-0.604993, 0.5260902, -2.122725, 0.3254902, 1, 0, 1,
-0.602706, -0.8711385, -2.868021, 0.3215686, 1, 0, 1,
-0.5994485, 1.308056, 0.10844, 0.3137255, 1, 0, 1,
-0.5973365, 0.4234001, -1.452714, 0.3098039, 1, 0, 1,
-0.5955828, 0.7019694, 0.4305438, 0.3019608, 1, 0, 1,
-0.5908501, -1.393038, -2.768212, 0.2941177, 1, 0, 1,
-0.5906116, -1.038389, -2.16451, 0.2901961, 1, 0, 1,
-0.5901496, -0.5925952, -1.322136, 0.282353, 1, 0, 1,
-0.589637, -2.221463, -1.966417, 0.2784314, 1, 0, 1,
-0.5892371, 0.3580254, -0.3364629, 0.2705882, 1, 0, 1,
-0.5876632, -0.193462, -1.957043, 0.2666667, 1, 0, 1,
-0.5835302, 1.237581, -0.5895073, 0.2588235, 1, 0, 1,
-0.5776597, 1.071932, -0.8232714, 0.254902, 1, 0, 1,
-0.5753363, 1.232554, -0.1954668, 0.2470588, 1, 0, 1,
-0.5714484, -1.456547, -2.356066, 0.2431373, 1, 0, 1,
-0.5686232, -0.5922862, -1.375481, 0.2352941, 1, 0, 1,
-0.5641358, 0.3354757, 0.3390478, 0.2313726, 1, 0, 1,
-0.5640332, 2.133924, 0.8113346, 0.2235294, 1, 0, 1,
-0.5607011, -0.8449506, -0.6972573, 0.2196078, 1, 0, 1,
-0.55988, -0.09590398, -1.247258, 0.2117647, 1, 0, 1,
-0.5507725, -1.032542, -2.922065, 0.2078431, 1, 0, 1,
-0.5464321, -0.9970507, -2.770126, 0.2, 1, 0, 1,
-0.5425611, -0.4323093, 0.872354, 0.1921569, 1, 0, 1,
-0.5378197, 1.872278, 0.1783202, 0.1882353, 1, 0, 1,
-0.5338522, -0.5952232, -2.070063, 0.1803922, 1, 0, 1,
-0.5231263, 0.2511097, -1.857513, 0.1764706, 1, 0, 1,
-0.5180344, 1.083233, -1.752728, 0.1686275, 1, 0, 1,
-0.5163819, 0.4788732, -2.679921, 0.1647059, 1, 0, 1,
-0.5080013, -1.462404, -3.254279, 0.1568628, 1, 0, 1,
-0.5000948, -1.082698, -0.3765906, 0.1529412, 1, 0, 1,
-0.4949996, -0.09987164, -1.60532, 0.145098, 1, 0, 1,
-0.4935198, -1.501842, -1.826653, 0.1411765, 1, 0, 1,
-0.4913014, -1.370359, -3.400184, 0.1333333, 1, 0, 1,
-0.4894006, -1.609536, -1.988818, 0.1294118, 1, 0, 1,
-0.4884284, -0.5686216, -1.889008, 0.1215686, 1, 0, 1,
-0.4842061, 0.2713461, 0.4054066, 0.1176471, 1, 0, 1,
-0.4824914, 1.375181, -0.6165163, 0.1098039, 1, 0, 1,
-0.4719251, 0.3132346, -0.3519409, 0.1058824, 1, 0, 1,
-0.4675982, -0.3661971, -0.6873702, 0.09803922, 1, 0, 1,
-0.464776, -1.538716, -2.710947, 0.09019608, 1, 0, 1,
-0.4631465, 1.033964, -0.7509534, 0.08627451, 1, 0, 1,
-0.4557335, -0.9551655, -2.962371, 0.07843138, 1, 0, 1,
-0.4545854, 2.376796, -0.2749462, 0.07450981, 1, 0, 1,
-0.4534754, 0.9548197, -0.1971936, 0.06666667, 1, 0, 1,
-0.4493062, -0.02434264, -2.407966, 0.0627451, 1, 0, 1,
-0.4491107, 0.01882731, -1.392381, 0.05490196, 1, 0, 1,
-0.4472923, 0.1239265, -0.5226527, 0.05098039, 1, 0, 1,
-0.4458112, -0.1952756, -0.005180761, 0.04313726, 1, 0, 1,
-0.4444199, 2.19436, -0.4576667, 0.03921569, 1, 0, 1,
-0.4425135, -0.9716145, -2.185372, 0.03137255, 1, 0, 1,
-0.4394475, -0.2772245, -1.52918, 0.02745098, 1, 0, 1,
-0.4350175, 0.08246052, -2.53426, 0.01960784, 1, 0, 1,
-0.4258763, 1.248756, -1.431749, 0.01568628, 1, 0, 1,
-0.4231374, 1.242373, 1.042707, 0.007843138, 1, 0, 1,
-0.4196187, 0.8111298, 0.2336292, 0.003921569, 1, 0, 1,
-0.4183089, 0.4010878, -1.139544, 0, 1, 0.003921569, 1,
-0.4146096, 0.919218, 0.4517709, 0, 1, 0.01176471, 1,
-0.4141249, 0.7623588, -0.8935068, 0, 1, 0.01568628, 1,
-0.4132088, -0.7564585, -2.672994, 0, 1, 0.02352941, 1,
-0.4131462, 0.5791861, -1.858724, 0, 1, 0.02745098, 1,
-0.4124309, -0.2938648, -2.39414, 0, 1, 0.03529412, 1,
-0.4094902, 1.19958, -2.234728, 0, 1, 0.03921569, 1,
-0.4073606, -0.08061701, -1.379025, 0, 1, 0.04705882, 1,
-0.4048137, -0.8695211, -1.930091, 0, 1, 0.05098039, 1,
-0.4037452, 1.03461, 0.7184585, 0, 1, 0.05882353, 1,
-0.403631, 0.1526422, -0.1421054, 0, 1, 0.0627451, 1,
-0.4027383, -0.2008824, -1.055687, 0, 1, 0.07058824, 1,
-0.3923331, 0.2261271, 0.4407549, 0, 1, 0.07450981, 1,
-0.391432, -1.100688, -2.455155, 0, 1, 0.08235294, 1,
-0.3888078, -0.8023915, -3.08671, 0, 1, 0.08627451, 1,
-0.3882029, 0.1304232, 0.379537, 0, 1, 0.09411765, 1,
-0.3878252, -0.05122733, -1.786566, 0, 1, 0.1019608, 1,
-0.3818253, 0.5629857, -1.778178, 0, 1, 0.1058824, 1,
-0.3778304, 0.1979497, -1.224274, 0, 1, 0.1137255, 1,
-0.3760785, 0.03173991, -1.619256, 0, 1, 0.1176471, 1,
-0.3703951, 0.2116918, 0.7780517, 0, 1, 0.1254902, 1,
-0.368109, -0.6173996, -2.472297, 0, 1, 0.1294118, 1,
-0.3677524, 1.764657, -1.732321, 0, 1, 0.1372549, 1,
-0.3646581, -1.00414, -2.669669, 0, 1, 0.1411765, 1,
-0.3567188, -1.894989, -3.372011, 0, 1, 0.1490196, 1,
-0.350408, -0.7159481, -2.397817, 0, 1, 0.1529412, 1,
-0.347472, -0.2280596, -4.223852, 0, 1, 0.1607843, 1,
-0.3472869, -1.540182, -2.726331, 0, 1, 0.1647059, 1,
-0.3420591, 0.2749442, -2.569071, 0, 1, 0.172549, 1,
-0.3417046, -0.3318994, -1.984582, 0, 1, 0.1764706, 1,
-0.3416408, 0.881096, -1.281898, 0, 1, 0.1843137, 1,
-0.3372254, 0.6980498, -0.5398116, 0, 1, 0.1882353, 1,
-0.336724, -1.064362, -2.550164, 0, 1, 0.1960784, 1,
-0.3352248, -1.205605, -1.966845, 0, 1, 0.2039216, 1,
-0.3319056, 0.6077591, 0.300566, 0, 1, 0.2078431, 1,
-0.3300573, -0.5205624, -3.404297, 0, 1, 0.2156863, 1,
-0.3283377, 0.2927907, -1.022187, 0, 1, 0.2196078, 1,
-0.3279357, -0.742021, -3.972179, 0, 1, 0.227451, 1,
-0.3265404, -0.05617401, -2.980334, 0, 1, 0.2313726, 1,
-0.3258449, 1.141998, -0.6091335, 0, 1, 0.2392157, 1,
-0.3201371, 0.2165895, -1.652286, 0, 1, 0.2431373, 1,
-0.3199916, -1.115065, -2.396362, 0, 1, 0.2509804, 1,
-0.3189343, -0.0788664, -1.109383, 0, 1, 0.254902, 1,
-0.3185787, -0.6911315, -3.736209, 0, 1, 0.2627451, 1,
-0.318436, 0.4009117, -1.168107, 0, 1, 0.2666667, 1,
-0.3151195, 1.520242, -2.037241, 0, 1, 0.2745098, 1,
-0.3145784, -0.7560542, -1.414694, 0, 1, 0.2784314, 1,
-0.3136411, 0.6289707, -0.4515916, 0, 1, 0.2862745, 1,
-0.3093705, -1.316175, -2.8078, 0, 1, 0.2901961, 1,
-0.3068367, -0.6186745, -1.56922, 0, 1, 0.2980392, 1,
-0.3063973, -1.103218, -1.845374, 0, 1, 0.3058824, 1,
-0.306389, 0.9193488, -1.652512, 0, 1, 0.3098039, 1,
-0.3053268, 0.3031024, -2.619589, 0, 1, 0.3176471, 1,
-0.3049622, -0.2368278, -1.715151, 0, 1, 0.3215686, 1,
-0.3042037, -0.4620415, -2.996083, 0, 1, 0.3294118, 1,
-0.3020915, -1.440735, -1.667965, 0, 1, 0.3333333, 1,
-0.3013301, 2.00772, 1.130746, 0, 1, 0.3411765, 1,
-0.3005048, 0.5877219, -0.6548062, 0, 1, 0.345098, 1,
-0.2996143, -1.586267, -2.703686, 0, 1, 0.3529412, 1,
-0.2980416, 0.04950869, -3.723645, 0, 1, 0.3568628, 1,
-0.2949304, 1.31667, -0.6507783, 0, 1, 0.3647059, 1,
-0.2910127, -0.7261978, -2.844545, 0, 1, 0.3686275, 1,
-0.2906463, -0.928725, -2.241583, 0, 1, 0.3764706, 1,
-0.284411, 0.3357467, -1.846659, 0, 1, 0.3803922, 1,
-0.2840129, -1.075368, -3.259737, 0, 1, 0.3882353, 1,
-0.2833363, -1.897996, -3.256991, 0, 1, 0.3921569, 1,
-0.2821387, 1.080474, 1.36642, 0, 1, 0.4, 1,
-0.2803024, 0.6721379, -0.3753529, 0, 1, 0.4078431, 1,
-0.2745171, -1.572237, -2.731712, 0, 1, 0.4117647, 1,
-0.2731142, 1.58384, -1.012296, 0, 1, 0.4196078, 1,
-0.2686229, 2.021915, -2.166198, 0, 1, 0.4235294, 1,
-0.253365, -0.769829, -4.873284, 0, 1, 0.4313726, 1,
-0.2485559, -2.447989, -3.896169, 0, 1, 0.4352941, 1,
-0.2469418, -0.2833631, -0.6859901, 0, 1, 0.4431373, 1,
-0.2434885, 0.4101503, -0.4068443, 0, 1, 0.4470588, 1,
-0.2428165, 1.311436, 0.4746847, 0, 1, 0.454902, 1,
-0.239094, 0.009190583, 0.6031097, 0, 1, 0.4588235, 1,
-0.2345839, 0.09575625, -1.0087, 0, 1, 0.4666667, 1,
-0.2343024, -1.184702, -3.11555, 0, 1, 0.4705882, 1,
-0.2304983, 0.4707506, 0.7967322, 0, 1, 0.4784314, 1,
-0.2301262, -0.9472712, -2.489043, 0, 1, 0.4823529, 1,
-0.2267801, 0.6608325, -0.0292766, 0, 1, 0.4901961, 1,
-0.2257014, 0.3453314, 0.8810266, 0, 1, 0.4941176, 1,
-0.2228097, -0.2758108, -2.546416, 0, 1, 0.5019608, 1,
-0.2223834, 0.9484738, -0.3084485, 0, 1, 0.509804, 1,
-0.2214301, 0.579738, -1.479876, 0, 1, 0.5137255, 1,
-0.2152618, 0.3890333, -0.6991625, 0, 1, 0.5215687, 1,
-0.2144143, 1.983157, -0.1096661, 0, 1, 0.5254902, 1,
-0.2096615, -0.6711403, -1.950088, 0, 1, 0.5333334, 1,
-0.208904, 1.825121, -1.079261, 0, 1, 0.5372549, 1,
-0.2084533, 2.626253, -0.6746284, 0, 1, 0.5450981, 1,
-0.2074383, 0.1584109, -1.065158, 0, 1, 0.5490196, 1,
-0.2038401, -0.4835075, -3.312167, 0, 1, 0.5568628, 1,
-0.2010618, 0.8274428, -0.2010844, 0, 1, 0.5607843, 1,
-0.1994812, -1.440195, -3.544828, 0, 1, 0.5686275, 1,
-0.1907995, -0.3070998, 0.8848041, 0, 1, 0.572549, 1,
-0.1901842, -0.1501174, -3.245466, 0, 1, 0.5803922, 1,
-0.1888672, 0.3993962, -0.7258181, 0, 1, 0.5843138, 1,
-0.1887661, -1.534597, -2.090361, 0, 1, 0.5921569, 1,
-0.1871173, 0.9490864, -0.190182, 0, 1, 0.5960785, 1,
-0.1778708, 0.9174578, 0.3630617, 0, 1, 0.6039216, 1,
-0.1705971, 1.458112, -1.859369, 0, 1, 0.6117647, 1,
-0.1702653, -0.02852215, -1.559366, 0, 1, 0.6156863, 1,
-0.1683326, -0.1609179, -3.475551, 0, 1, 0.6235294, 1,
-0.1660028, -0.6065063, -2.947006, 0, 1, 0.627451, 1,
-0.1636235, 2.30954, 1.238998, 0, 1, 0.6352941, 1,
-0.1632224, -0.7996714, -4.075144, 0, 1, 0.6392157, 1,
-0.1628156, 0.6000795, -0.4315244, 0, 1, 0.6470588, 1,
-0.1618095, 0.002094137, -0.2016208, 0, 1, 0.6509804, 1,
-0.1611288, -0.1269913, -2.058352, 0, 1, 0.6588235, 1,
-0.1601123, 0.4970609, -1.388805, 0, 1, 0.6627451, 1,
-0.1536122, 0.6852616, -0.02296477, 0, 1, 0.6705883, 1,
-0.1534062, 0.8851678, -0.4753973, 0, 1, 0.6745098, 1,
-0.1511379, 0.9449707, 0.9321815, 0, 1, 0.682353, 1,
-0.148143, 0.7196627, 0.6195838, 0, 1, 0.6862745, 1,
-0.1447265, 0.5411637, 0.1065884, 0, 1, 0.6941177, 1,
-0.1401713, 1.885051, -0.9868535, 0, 1, 0.7019608, 1,
-0.1377308, 2.021871, 0.9528943, 0, 1, 0.7058824, 1,
-0.1346402, 0.1518413, 0.06398632, 0, 1, 0.7137255, 1,
-0.1298537, 1.778801, 0.4186053, 0, 1, 0.7176471, 1,
-0.129295, -0.4516385, -2.290517, 0, 1, 0.7254902, 1,
-0.1286103, -0.1115739, -2.159509, 0, 1, 0.7294118, 1,
-0.1264918, -0.2669872, -2.279647, 0, 1, 0.7372549, 1,
-0.1253932, -0.355935, -3.096935, 0, 1, 0.7411765, 1,
-0.1231818, -0.7542638, -1.716743, 0, 1, 0.7490196, 1,
-0.122169, -0.5705696, -4.27775, 0, 1, 0.7529412, 1,
-0.1214767, 1.569711, -0.06467158, 0, 1, 0.7607843, 1,
-0.1206204, 0.002399751, -2.940453, 0, 1, 0.7647059, 1,
-0.1172395, -0.9848043, -3.203981, 0, 1, 0.772549, 1,
-0.116996, 0.7895067, -0.8207213, 0, 1, 0.7764706, 1,
-0.1144506, 0.2027392, -2.570865, 0, 1, 0.7843137, 1,
-0.1096119, -0.2087503, -4.241009, 0, 1, 0.7882353, 1,
-0.109094, -0.09121349, -2.058096, 0, 1, 0.7960784, 1,
-0.1060797, -1.286024, -2.111129, 0, 1, 0.8039216, 1,
-0.1049073, 1.750214, 1.152889, 0, 1, 0.8078431, 1,
-0.1044441, -0.03790683, 0.4339854, 0, 1, 0.8156863, 1,
-0.1039316, 0.7476968, 0.2812732, 0, 1, 0.8196079, 1,
-0.1030498, -0.4355213, -1.955252, 0, 1, 0.827451, 1,
-0.1029992, 2.144603, 1.525704, 0, 1, 0.8313726, 1,
-0.09814331, -0.2535625, -2.259065, 0, 1, 0.8392157, 1,
-0.09688761, 1.742194, -0.6398207, 0, 1, 0.8431373, 1,
-0.09674054, -0.1847233, -1.886854, 0, 1, 0.8509804, 1,
-0.09567622, -0.5087467, -2.262277, 0, 1, 0.854902, 1,
-0.09180675, 0.005024854, -0.8460204, 0, 1, 0.8627451, 1,
-0.08941333, 0.7784098, -1.04309, 0, 1, 0.8666667, 1,
-0.08649118, 0.565514, 0.8351179, 0, 1, 0.8745098, 1,
-0.08357943, -0.6586525, -4.319109, 0, 1, 0.8784314, 1,
-0.07997637, 1.318948, -0.9762742, 0, 1, 0.8862745, 1,
-0.07750082, -0.7241222, -1.939191, 0, 1, 0.8901961, 1,
-0.07545579, -0.4337009, -3.455926, 0, 1, 0.8980392, 1,
-0.07512639, -0.9598197, -1.651297, 0, 1, 0.9058824, 1,
-0.0682016, -0.894336, -3.032848, 0, 1, 0.9098039, 1,
-0.06808306, -0.2018764, -2.155574, 0, 1, 0.9176471, 1,
-0.06702836, -0.8885034, -2.844579, 0, 1, 0.9215686, 1,
-0.06369391, -0.7439501, -2.895271, 0, 1, 0.9294118, 1,
-0.06189125, -0.2894216, -2.026951, 0, 1, 0.9333333, 1,
-0.06109518, -0.05615096, -2.574636, 0, 1, 0.9411765, 1,
-0.05858508, 0.3798145, -0.4525662, 0, 1, 0.945098, 1,
-0.05733225, -0.2795394, -2.683166, 0, 1, 0.9529412, 1,
-0.05702451, -0.6132436, -2.018028, 0, 1, 0.9568627, 1,
-0.05266342, 0.04778916, -0.5407442, 0, 1, 0.9647059, 1,
-0.04447746, -0.3341904, -2.417051, 0, 1, 0.9686275, 1,
-0.04048792, 0.04851543, 0.7710807, 0, 1, 0.9764706, 1,
-0.03906349, -0.7587638, -2.865553, 0, 1, 0.9803922, 1,
-0.03715023, -0.1264907, -2.369669, 0, 1, 0.9882353, 1,
-0.03596271, 1.099999, 1.764547, 0, 1, 0.9921569, 1,
-0.0325245, 0.1667422, 0.03212763, 0, 1, 1, 1,
-0.03225021, -0.2281287, -3.056922, 0, 0.9921569, 1, 1,
-0.02946437, 0.7370446, -1.27693, 0, 0.9882353, 1, 1,
-0.02405827, 0.4777472, -1.314945, 0, 0.9803922, 1, 1,
-0.02367972, 1.612082, -0.4881594, 0, 0.9764706, 1, 1,
-0.01946825, 0.1803997, -0.2146283, 0, 0.9686275, 1, 1,
-0.01923455, -0.8668547, -4.731019, 0, 0.9647059, 1, 1,
-0.01797644, -0.4853895, -2.308974, 0, 0.9568627, 1, 1,
-0.01499308, 0.4710234, -1.269044, 0, 0.9529412, 1, 1,
-0.01404116, 0.234226, -0.3884666, 0, 0.945098, 1, 1,
-0.01271913, 0.1404931, -0.3790598, 0, 0.9411765, 1, 1,
-0.01070705, 0.2292009, 0.2264632, 0, 0.9333333, 1, 1,
-0.01062641, -1.288028, -4.324126, 0, 0.9294118, 1, 1,
-0.004636035, 0.05533558, -1.122432, 0, 0.9215686, 1, 1,
0.003175648, -1.329414, 2.490316, 0, 0.9176471, 1, 1,
0.004076936, 0.8526101, -1.402868, 0, 0.9098039, 1, 1,
0.006135146, 1.992298, -0.5044572, 0, 0.9058824, 1, 1,
0.0104309, 1.668148, 0.08173744, 0, 0.8980392, 1, 1,
0.01904608, -0.40681, 3.082338, 0, 0.8901961, 1, 1,
0.02166536, 0.8579916, 0.03181351, 0, 0.8862745, 1, 1,
0.02584894, 0.1790978, 0.008529535, 0, 0.8784314, 1, 1,
0.02774277, -0.6482991, 4.133959, 0, 0.8745098, 1, 1,
0.02803238, 2.252814, 1.306494, 0, 0.8666667, 1, 1,
0.03115005, 0.2462165, 1.271888, 0, 0.8627451, 1, 1,
0.03676119, 0.9173588, 1.523717, 0, 0.854902, 1, 1,
0.03727419, 0.9301857, -0.9399679, 0, 0.8509804, 1, 1,
0.03791157, 1.422297, -0.7555016, 0, 0.8431373, 1, 1,
0.04601623, -0.6098018, 2.8031, 0, 0.8392157, 1, 1,
0.04674465, -0.2637722, 1.710438, 0, 0.8313726, 1, 1,
0.04769289, 0.2635964, -1.690838, 0, 0.827451, 1, 1,
0.04770484, -0.1836009, 2.705014, 0, 0.8196079, 1, 1,
0.0505746, -1.093633, 2.510369, 0, 0.8156863, 1, 1,
0.05219424, -0.728661, 2.6353, 0, 0.8078431, 1, 1,
0.05493867, 2.159783, 1.318588, 0, 0.8039216, 1, 1,
0.05913115, -1.67764, 4.07644, 0, 0.7960784, 1, 1,
0.06170866, 1.162023, 0.5005986, 0, 0.7882353, 1, 1,
0.06182861, 0.2549712, -0.4691186, 0, 0.7843137, 1, 1,
0.06406607, 0.8292659, -0.7774763, 0, 0.7764706, 1, 1,
0.06696631, 0.6856647, -0.1181074, 0, 0.772549, 1, 1,
0.06865111, 0.3167059, 0.5426091, 0, 0.7647059, 1, 1,
0.07284591, 1.875149, -0.8284406, 0, 0.7607843, 1, 1,
0.07417899, -0.1150982, 2.060227, 0, 0.7529412, 1, 1,
0.07492825, -1.104787, 1.898907, 0, 0.7490196, 1, 1,
0.07784967, -1.237557, 4.184733, 0, 0.7411765, 1, 1,
0.07795645, 0.1854823, -0.02103314, 0, 0.7372549, 1, 1,
0.07964353, -0.3165713, 3.379638, 0, 0.7294118, 1, 1,
0.08446862, 0.835667, 0.5474144, 0, 0.7254902, 1, 1,
0.08914045, 1.02143, -0.7069609, 0, 0.7176471, 1, 1,
0.08947496, -1.326345, 5.065377, 0, 0.7137255, 1, 1,
0.09181841, 1.304737, -1.62218, 0, 0.7058824, 1, 1,
0.09577063, 0.4486056, 1.063997, 0, 0.6980392, 1, 1,
0.09617104, -0.3462345, 3.232464, 0, 0.6941177, 1, 1,
0.09703382, -0.05572005, 1.092876, 0, 0.6862745, 1, 1,
0.1045411, -0.07166722, 4.189577, 0, 0.682353, 1, 1,
0.104961, -0.07971174, 3.578472, 0, 0.6745098, 1, 1,
0.1161065, 1.419157, 0.3822944, 0, 0.6705883, 1, 1,
0.1171135, -0.8726565, 3.542515, 0, 0.6627451, 1, 1,
0.1180261, -0.9274528, 3.404783, 0, 0.6588235, 1, 1,
0.1183179, -1.173761, 3.50231, 0, 0.6509804, 1, 1,
0.1187856, 0.02231275, 0.8485435, 0, 0.6470588, 1, 1,
0.119079, 0.4670231, 0.5389647, 0, 0.6392157, 1, 1,
0.1206183, 0.3557597, 0.04594791, 0, 0.6352941, 1, 1,
0.1216376, -0.2868715, 3.646044, 0, 0.627451, 1, 1,
0.1287287, 2.229823, 0.1498818, 0, 0.6235294, 1, 1,
0.1288784, 2.500875, 0.2789056, 0, 0.6156863, 1, 1,
0.1302182, 0.7562086, 0.8331093, 0, 0.6117647, 1, 1,
0.1343196, -1.716481, 2.215557, 0, 0.6039216, 1, 1,
0.1352859, -1.696141, 4.088681, 0, 0.5960785, 1, 1,
0.1377134, 0.8063378, -1.086894, 0, 0.5921569, 1, 1,
0.1460883, 0.549181, -0.486554, 0, 0.5843138, 1, 1,
0.1497283, -0.00919861, 0.1535681, 0, 0.5803922, 1, 1,
0.1524852, -0.977281, 4.528215, 0, 0.572549, 1, 1,
0.1531636, -2.468345, 4.05219, 0, 0.5686275, 1, 1,
0.1542176, 1.167423, 1.127231, 0, 0.5607843, 1, 1,
0.1550518, 0.2565701, 0.406565, 0, 0.5568628, 1, 1,
0.1554302, -1.103472, 3.06155, 0, 0.5490196, 1, 1,
0.158326, 0.3079491, -0.4887797, 0, 0.5450981, 1, 1,
0.1606815, 1.448007, -0.614268, 0, 0.5372549, 1, 1,
0.1630814, 0.6101676, 0.05051092, 0, 0.5333334, 1, 1,
0.1636582, -1.069849, 2.694964, 0, 0.5254902, 1, 1,
0.1639479, 0.4648773, -0.9274176, 0, 0.5215687, 1, 1,
0.1694211, -0.2310311, 2.445554, 0, 0.5137255, 1, 1,
0.1777899, -0.927738, 2.930523, 0, 0.509804, 1, 1,
0.1805182, 0.08996532, 2.159662, 0, 0.5019608, 1, 1,
0.1838794, 1.034837, 0.1407421, 0, 0.4941176, 1, 1,
0.1883818, 0.03527691, 0.697669, 0, 0.4901961, 1, 1,
0.1925766, -1.012724, 2.544492, 0, 0.4823529, 1, 1,
0.1929509, -1.080276, 3.054713, 0, 0.4784314, 1, 1,
0.1932389, -0.2663648, 1.170575, 0, 0.4705882, 1, 1,
0.1955101, -0.3237276, 2.196935, 0, 0.4666667, 1, 1,
0.2015031, 0.4519066, 1.396639, 0, 0.4588235, 1, 1,
0.2022783, 0.9054961, 0.09221913, 0, 0.454902, 1, 1,
0.2113948, 0.3794075, 0.3810522, 0, 0.4470588, 1, 1,
0.2127549, 1.488177, 0.6305575, 0, 0.4431373, 1, 1,
0.225699, 0.806977, 1.092391, 0, 0.4352941, 1, 1,
0.2304232, 1.294219, 2.352588, 0, 0.4313726, 1, 1,
0.2326126, 0.1067788, 1.261293, 0, 0.4235294, 1, 1,
0.2330042, 0.0202148, 3.028405, 0, 0.4196078, 1, 1,
0.2455628, -1.023041, 3.307371, 0, 0.4117647, 1, 1,
0.245781, 0.351632, 0.6717306, 0, 0.4078431, 1, 1,
0.2495766, 0.6034597, 1.559289, 0, 0.4, 1, 1,
0.2505186, 0.3113446, 0.6274722, 0, 0.3921569, 1, 1,
0.2605586, 0.482207, 1.561386, 0, 0.3882353, 1, 1,
0.2659463, -0.7399896, 1.83854, 0, 0.3803922, 1, 1,
0.2675484, -0.04998693, 3.061041, 0, 0.3764706, 1, 1,
0.269533, -0.5999284, 2.63913, 0, 0.3686275, 1, 1,
0.2696119, 1.102402, -0.05109399, 0, 0.3647059, 1, 1,
0.2741294, -0.1760097, 1.366077, 0, 0.3568628, 1, 1,
0.2748562, 0.8664905, -1.550828, 0, 0.3529412, 1, 1,
0.279249, -1.058644, 4.122577, 0, 0.345098, 1, 1,
0.2798007, -1.20445, 1.878563, 0, 0.3411765, 1, 1,
0.2828644, 1.770279, 0.1447362, 0, 0.3333333, 1, 1,
0.283664, -3.060554, 3.883201, 0, 0.3294118, 1, 1,
0.2837144, 0.1727076, 1.641291, 0, 0.3215686, 1, 1,
0.2853542, 0.6179128, 0.2527006, 0, 0.3176471, 1, 1,
0.2905895, 0.3233034, 0.1993439, 0, 0.3098039, 1, 1,
0.2918117, -1.438404, 4.324262, 0, 0.3058824, 1, 1,
0.2980869, 0.5043654, 0.05779348, 0, 0.2980392, 1, 1,
0.3020935, -1.063709, 2.563656, 0, 0.2901961, 1, 1,
0.3025764, 2.160657, 1.521567, 0, 0.2862745, 1, 1,
0.302763, -1.685181, 2.791407, 0, 0.2784314, 1, 1,
0.3079529, 0.9458349, 0.582339, 0, 0.2745098, 1, 1,
0.3089611, 0.7546547, 2.568343, 0, 0.2666667, 1, 1,
0.3099385, 0.2647384, 1.005559, 0, 0.2627451, 1, 1,
0.3116914, 2.164145, 0.3818035, 0, 0.254902, 1, 1,
0.3122424, 0.407996, 0.7063463, 0, 0.2509804, 1, 1,
0.3141567, -0.7168969, 3.701391, 0, 0.2431373, 1, 1,
0.315393, -0.5576989, 2.462133, 0, 0.2392157, 1, 1,
0.3164006, 0.8310258, 1.242546, 0, 0.2313726, 1, 1,
0.3207069, -0.2065876, 2.303759, 0, 0.227451, 1, 1,
0.3218313, -0.4251242, 3.605851, 0, 0.2196078, 1, 1,
0.3222824, -1.528828, 3.575234, 0, 0.2156863, 1, 1,
0.3251705, -1.110494, 3.309414, 0, 0.2078431, 1, 1,
0.3277166, -0.4215999, 0.7007132, 0, 0.2039216, 1, 1,
0.327937, -0.07390468, 0.6603497, 0, 0.1960784, 1, 1,
0.334628, 0.7630587, 0.09499437, 0, 0.1882353, 1, 1,
0.335893, -0.3954699, 3.302737, 0, 0.1843137, 1, 1,
0.3403424, -1.520785, 2.50239, 0, 0.1764706, 1, 1,
0.3449301, -1.079829, 4.94154, 0, 0.172549, 1, 1,
0.3483902, 0.705847, -0.1957797, 0, 0.1647059, 1, 1,
0.3538277, -0.2830792, 1.995338, 0, 0.1607843, 1, 1,
0.3595185, -0.4242057, 2.15282, 0, 0.1529412, 1, 1,
0.3601428, 0.8064783, -0.7723647, 0, 0.1490196, 1, 1,
0.3704819, -0.4179569, 3.262927, 0, 0.1411765, 1, 1,
0.3710073, 0.03480572, 1.856508, 0, 0.1372549, 1, 1,
0.3810826, 0.1305174, 0.8517025, 0, 0.1294118, 1, 1,
0.3811688, -1.270467, 2.365953, 0, 0.1254902, 1, 1,
0.3815748, 0.5515908, -1.096573, 0, 0.1176471, 1, 1,
0.3831924, -0.3481763, 4.898972, 0, 0.1137255, 1, 1,
0.3845556, 1.319115, 2.037783, 0, 0.1058824, 1, 1,
0.3857892, 1.113885, 0.4830047, 0, 0.09803922, 1, 1,
0.38728, -0.3913204, 2.181885, 0, 0.09411765, 1, 1,
0.4097329, -1.421821, 2.037015, 0, 0.08627451, 1, 1,
0.4102228, -1.915622, 0.4672479, 0, 0.08235294, 1, 1,
0.4132284, -1.507505, 4.80203, 0, 0.07450981, 1, 1,
0.4163459, -2.025721, 2.021217, 0, 0.07058824, 1, 1,
0.418188, -1.075093, 1.485981, 0, 0.0627451, 1, 1,
0.4195092, 0.6970764, 1.2441, 0, 0.05882353, 1, 1,
0.4215052, -0.8490053, 2.802695, 0, 0.05098039, 1, 1,
0.4228546, -0.7015796, 3.101006, 0, 0.04705882, 1, 1,
0.4246765, 0.3166607, 1.19355, 0, 0.03921569, 1, 1,
0.4247508, -0.2686191, 3.353683, 0, 0.03529412, 1, 1,
0.4268214, 0.884232, -0.900851, 0, 0.02745098, 1, 1,
0.4291741, -1.899217, 3.837975, 0, 0.02352941, 1, 1,
0.4296906, 1.480141, 1.939417, 0, 0.01568628, 1, 1,
0.4302517, 0.4790829, 0.2934547, 0, 0.01176471, 1, 1,
0.4362254, -0.1671614, 1.857877, 0, 0.003921569, 1, 1,
0.4369978, -0.1552722, 2.510403, 0.003921569, 0, 1, 1,
0.4398713, -1.15445, 3.423546, 0.007843138, 0, 1, 1,
0.441815, -0.7181817, 2.722344, 0.01568628, 0, 1, 1,
0.444667, 1.583654, -0.2448371, 0.01960784, 0, 1, 1,
0.446126, -0.6988524, 2.708369, 0.02745098, 0, 1, 1,
0.4467482, 0.1861385, 1.019639, 0.03137255, 0, 1, 1,
0.4492436, -0.3221859, 1.758953, 0.03921569, 0, 1, 1,
0.4501382, 0.0626881, 1.327851, 0.04313726, 0, 1, 1,
0.451483, -0.5127466, 3.842105, 0.05098039, 0, 1, 1,
0.4544738, -0.06177529, -0.4038325, 0.05490196, 0, 1, 1,
0.4594362, 1.170436, -0.5131764, 0.0627451, 0, 1, 1,
0.4600111, -0.1069544, 2.212572, 0.06666667, 0, 1, 1,
0.4606872, -0.2530806, 0.3449581, 0.07450981, 0, 1, 1,
0.4636471, -1.023901, 2.123128, 0.07843138, 0, 1, 1,
0.4638116, 0.01026789, -0.1261103, 0.08627451, 0, 1, 1,
0.4666076, -0.1671825, 1.58086, 0.09019608, 0, 1, 1,
0.4674644, 0.6595686, 0.281463, 0.09803922, 0, 1, 1,
0.468523, -1.540588, 1.766672, 0.1058824, 0, 1, 1,
0.4733449, -1.31817, 5.581907, 0.1098039, 0, 1, 1,
0.4737084, 0.1597919, 0.07222013, 0.1176471, 0, 1, 1,
0.4750614, -1.487443, 3.185236, 0.1215686, 0, 1, 1,
0.4760803, 0.03248443, 2.811716, 0.1294118, 0, 1, 1,
0.4782878, 1.675477, 0.4626013, 0.1333333, 0, 1, 1,
0.4830737, 0.3551973, -0.2686589, 0.1411765, 0, 1, 1,
0.4836933, 0.4829848, 0.5715524, 0.145098, 0, 1, 1,
0.4906817, -1.809577, 2.492385, 0.1529412, 0, 1, 1,
0.4927208, -0.2056745, 2.998835, 0.1568628, 0, 1, 1,
0.4960473, -0.675809, 3.086701, 0.1647059, 0, 1, 1,
0.503836, -0.3358175, 2.253288, 0.1686275, 0, 1, 1,
0.5039398, 0.2873706, 0.7678827, 0.1764706, 0, 1, 1,
0.5163427, -1.898284, 1.483414, 0.1803922, 0, 1, 1,
0.5168403, 1.737581, -0.223222, 0.1882353, 0, 1, 1,
0.5208265, 0.3245176, 2.15396, 0.1921569, 0, 1, 1,
0.5250318, 0.4203513, 0.6801038, 0.2, 0, 1, 1,
0.5252953, -0.7121834, 3.650001, 0.2078431, 0, 1, 1,
0.5265841, 0.8389196, -1.598288, 0.2117647, 0, 1, 1,
0.5273817, -0.7250027, 2.93727, 0.2196078, 0, 1, 1,
0.5305572, 0.6103347, 0.6810674, 0.2235294, 0, 1, 1,
0.533097, -0.3332413, 1.770169, 0.2313726, 0, 1, 1,
0.5458722, -0.7874909, 2.660003, 0.2352941, 0, 1, 1,
0.5458897, -0.8727139, 2.870831, 0.2431373, 0, 1, 1,
0.5473633, 0.6861745, 1.398231, 0.2470588, 0, 1, 1,
0.5492405, 0.09480832, 1.02784, 0.254902, 0, 1, 1,
0.5504019, 0.4278528, -0.7054129, 0.2588235, 0, 1, 1,
0.551353, 0.6012452, 1.829625, 0.2666667, 0, 1, 1,
0.5543371, 1.248237, 0.4123761, 0.2705882, 0, 1, 1,
0.5585774, 0.005292577, 0.7054483, 0.2784314, 0, 1, 1,
0.5624573, -0.8734182, 3.450101, 0.282353, 0, 1, 1,
0.5647139, -1.684622, 4.458705, 0.2901961, 0, 1, 1,
0.5651679, -1.025352, 2.945137, 0.2941177, 0, 1, 1,
0.5653195, -1.23461, 3.482619, 0.3019608, 0, 1, 1,
0.5676926, 0.5278688, 1.021346, 0.3098039, 0, 1, 1,
0.5696106, -0.08703379, 2.889609, 0.3137255, 0, 1, 1,
0.5704671, -0.07929372, 2.34617, 0.3215686, 0, 1, 1,
0.5783218, -0.1415668, 1.559799, 0.3254902, 0, 1, 1,
0.5808183, -0.510419, 3.92267, 0.3333333, 0, 1, 1,
0.583766, 0.7673708, 0.2312502, 0.3372549, 0, 1, 1,
0.5855618, 0.1904232, 0.3388655, 0.345098, 0, 1, 1,
0.5857772, -0.1964146, 1.427156, 0.3490196, 0, 1, 1,
0.5916218, 1.707505, 0.07329462, 0.3568628, 0, 1, 1,
0.5917978, 1.199722, 0.1909016, 0.3607843, 0, 1, 1,
0.5939921, -1.97951, 3.312016, 0.3686275, 0, 1, 1,
0.597004, 0.625217, 0.5063794, 0.372549, 0, 1, 1,
0.5973051, -0.625241, 1.530151, 0.3803922, 0, 1, 1,
0.5999755, -0.5750008, 3.827637, 0.3843137, 0, 1, 1,
0.6018497, 1.511085, -0.2148827, 0.3921569, 0, 1, 1,
0.604672, 0.363692, 1.625919, 0.3960784, 0, 1, 1,
0.6062699, -0.005968618, 0.4609261, 0.4039216, 0, 1, 1,
0.6069914, -1.80169, 3.29112, 0.4117647, 0, 1, 1,
0.6180866, -1.313174, 3.628226, 0.4156863, 0, 1, 1,
0.6218082, 0.6946502, 1.789175, 0.4235294, 0, 1, 1,
0.6224851, 0.1008841, 1.247731, 0.427451, 0, 1, 1,
0.6308597, 0.8134692, -0.1003038, 0.4352941, 0, 1, 1,
0.6309351, -0.506664, 2.177306, 0.4392157, 0, 1, 1,
0.6318327, -0.4832469, 1.724573, 0.4470588, 0, 1, 1,
0.6332011, 0.6499758, 2.961234, 0.4509804, 0, 1, 1,
0.6333756, 1.640921, 0.2925839, 0.4588235, 0, 1, 1,
0.6357712, 0.6501377, 1.151011, 0.4627451, 0, 1, 1,
0.6384058, -0.06948839, 0.3935153, 0.4705882, 0, 1, 1,
0.638437, 1.563401, 1.51467, 0.4745098, 0, 1, 1,
0.6404779, -1.462491, 2.802629, 0.4823529, 0, 1, 1,
0.6420954, 0.9235343, -0.05645346, 0.4862745, 0, 1, 1,
0.6492775, 1.241968, -1.074729, 0.4941176, 0, 1, 1,
0.6589492, -0.9208436, 1.839618, 0.5019608, 0, 1, 1,
0.6598445, -1.613912, 3.409994, 0.5058824, 0, 1, 1,
0.6602978, 2.623335, 0.4535067, 0.5137255, 0, 1, 1,
0.6611264, -0.004805175, 4.05852, 0.5176471, 0, 1, 1,
0.6613571, -0.3434345, 2.489371, 0.5254902, 0, 1, 1,
0.6648616, 0.8569323, 0.6352049, 0.5294118, 0, 1, 1,
0.6658894, -0.9258572, 2.785719, 0.5372549, 0, 1, 1,
0.6660437, 0.8949788, 1.400268, 0.5411765, 0, 1, 1,
0.6689348, -0.5170047, 2.287609, 0.5490196, 0, 1, 1,
0.6700429, -0.8112847, 1.740342, 0.5529412, 0, 1, 1,
0.6706055, 1.197798, 1.568273, 0.5607843, 0, 1, 1,
0.6734393, -1.136904, 1.997794, 0.5647059, 0, 1, 1,
0.6739284, 1.026528, 2.446467, 0.572549, 0, 1, 1,
0.6782608, 0.3642141, 2.359194, 0.5764706, 0, 1, 1,
0.6782783, 0.463866, 1.479864, 0.5843138, 0, 1, 1,
0.6799369, 0.1922886, 2.059603, 0.5882353, 0, 1, 1,
0.6817231, -1.722983, 2.05593, 0.5960785, 0, 1, 1,
0.6890844, -0.08533277, 3.535181, 0.6039216, 0, 1, 1,
0.6907218, 0.734221, -1.185291, 0.6078432, 0, 1, 1,
0.6912904, 0.7427133, -0.400414, 0.6156863, 0, 1, 1,
0.6915045, 0.2436147, 1.066331, 0.6196079, 0, 1, 1,
0.6935205, -0.9638731, 4.488512, 0.627451, 0, 1, 1,
0.6964521, -1.627187, 3.121009, 0.6313726, 0, 1, 1,
0.6967152, -0.6668647, 1.523718, 0.6392157, 0, 1, 1,
0.6987303, 0.5310745, 0.6282765, 0.6431373, 0, 1, 1,
0.7018752, 0.02519924, 0.7028713, 0.6509804, 0, 1, 1,
0.7024444, -0.6869825, 1.211241, 0.654902, 0, 1, 1,
0.7065784, 0.01245091, 1.051641, 0.6627451, 0, 1, 1,
0.7093539, 1.072249, 2.15616, 0.6666667, 0, 1, 1,
0.7164558, -0.3057834, 2.37311, 0.6745098, 0, 1, 1,
0.7303275, 0.07222646, 2.280725, 0.6784314, 0, 1, 1,
0.7325945, -1.455211, 2.38474, 0.6862745, 0, 1, 1,
0.73493, -0.7592159, 1.416968, 0.6901961, 0, 1, 1,
0.735344, -1.130516, 2.297652, 0.6980392, 0, 1, 1,
0.7368305, -0.3223449, 2.370395, 0.7058824, 0, 1, 1,
0.7404257, 0.1913207, -0.8308724, 0.7098039, 0, 1, 1,
0.7483113, -0.2992007, 0.0311029, 0.7176471, 0, 1, 1,
0.7550943, 3.150517, 0.6638274, 0.7215686, 0, 1, 1,
0.758782, 0.1913509, 1.562374, 0.7294118, 0, 1, 1,
0.7592577, 0.106128, 1.799442, 0.7333333, 0, 1, 1,
0.7599094, 0.1401328, 2.422216, 0.7411765, 0, 1, 1,
0.7601376, 0.8060392, 1.157315, 0.7450981, 0, 1, 1,
0.7614526, -1.504794, 2.932383, 0.7529412, 0, 1, 1,
0.7617161, -0.2561476, 1.460007, 0.7568628, 0, 1, 1,
0.762122, 0.4457698, 1.199647, 0.7647059, 0, 1, 1,
0.770436, -1.331658, 3.608915, 0.7686275, 0, 1, 1,
0.7722104, 1.401733, -0.7639853, 0.7764706, 0, 1, 1,
0.7727894, -1.36623, 3.382174, 0.7803922, 0, 1, 1,
0.7756045, 0.6200029, 2.490482, 0.7882353, 0, 1, 1,
0.7790456, -1.18028, 3.124393, 0.7921569, 0, 1, 1,
0.7813715, -2.096352, 1.466159, 0.8, 0, 1, 1,
0.7817602, 0.5769456, 2.02573, 0.8078431, 0, 1, 1,
0.782191, 1.027153, 1.100081, 0.8117647, 0, 1, 1,
0.7886726, 2.29862, 0.3480632, 0.8196079, 0, 1, 1,
0.7913207, 0.2941822, 1.241273, 0.8235294, 0, 1, 1,
0.7921618, 0.7493419, -0.222927, 0.8313726, 0, 1, 1,
0.7926795, 1.203434, 0.3824998, 0.8352941, 0, 1, 1,
0.7948194, -1.849587, 2.797289, 0.8431373, 0, 1, 1,
0.7970468, -1.215171, 2.895209, 0.8470588, 0, 1, 1,
0.8012965, -0.1136342, 2.660448, 0.854902, 0, 1, 1,
0.8077466, 1.435774, 0.7761188, 0.8588235, 0, 1, 1,
0.8084493, -0.09356791, 0.9045837, 0.8666667, 0, 1, 1,
0.812596, 2.580252, 1.783216, 0.8705882, 0, 1, 1,
0.8141351, -0.05953725, 1.241707, 0.8784314, 0, 1, 1,
0.8176504, -0.4735294, 2.722928, 0.8823529, 0, 1, 1,
0.8201674, 1.316237, -0.2906645, 0.8901961, 0, 1, 1,
0.8209623, 0.08504175, 0.6830594, 0.8941177, 0, 1, 1,
0.8214307, 0.9880523, 1.015727, 0.9019608, 0, 1, 1,
0.8235748, -0.6238408, 1.345759, 0.9098039, 0, 1, 1,
0.8295214, -0.3379838, 3.109767, 0.9137255, 0, 1, 1,
0.8303541, -0.7482413, 3.489692, 0.9215686, 0, 1, 1,
0.84468, -0.3250955, 1.117939, 0.9254902, 0, 1, 1,
0.844915, 1.028231, 1.959644, 0.9333333, 0, 1, 1,
0.8451182, 0.3492351, -0.2450847, 0.9372549, 0, 1, 1,
0.8564139, 0.6467344, 1.404605, 0.945098, 0, 1, 1,
0.863237, 0.3787599, 1.438634, 0.9490196, 0, 1, 1,
0.864316, -0.7534621, 2.537743, 0.9568627, 0, 1, 1,
0.8657107, 0.9394655, 1.554136, 0.9607843, 0, 1, 1,
0.8682516, -0.6015226, 3.086577, 0.9686275, 0, 1, 1,
0.8719485, -0.2499518, 2.671055, 0.972549, 0, 1, 1,
0.8746679, 0.263312, 0.6241913, 0.9803922, 0, 1, 1,
0.8758131, -0.1132014, 1.564074, 0.9843137, 0, 1, 1,
0.8799897, -0.8603323, 3.01813, 0.9921569, 0, 1, 1,
0.8935766, 1.009742, 2.353252, 0.9960784, 0, 1, 1,
0.8990233, -0.6033341, 1.821358, 1, 0, 0.9960784, 1,
0.8992144, -0.7371543, 4.230467, 1, 0, 0.9882353, 1,
0.9123618, -0.8432724, 3.625315, 1, 0, 0.9843137, 1,
0.912373, -1.425256, 1.267798, 1, 0, 0.9764706, 1,
0.9138269, 0.947279, 1.752638, 1, 0, 0.972549, 1,
0.935341, -1.122773, 2.921045, 1, 0, 0.9647059, 1,
0.937268, -0.4108492, 1.816926, 1, 0, 0.9607843, 1,
0.9472691, 1.435787, 0.7407961, 1, 0, 0.9529412, 1,
0.947834, 0.5174348, 2.421413, 1, 0, 0.9490196, 1,
0.9545133, 0.3330872, 1.447695, 1, 0, 0.9411765, 1,
0.9567223, 0.4112939, 2.060715, 1, 0, 0.9372549, 1,
0.9568667, -0.255362, 2.86413, 1, 0, 0.9294118, 1,
0.9611537, -0.6829216, 3.103801, 1, 0, 0.9254902, 1,
0.9629948, 0.1414813, 2.201791, 1, 0, 0.9176471, 1,
0.9711803, -0.1253225, 0.4675158, 1, 0, 0.9137255, 1,
0.9829593, -0.336638, 3.733761, 1, 0, 0.9058824, 1,
0.9837664, 0.5083891, 1.684479, 1, 0, 0.9019608, 1,
0.9844922, -0.11891, 1.092672, 1, 0, 0.8941177, 1,
0.989319, -2.69664, 2.142876, 1, 0, 0.8862745, 1,
0.9914719, 0.4994151, 0.8665901, 1, 0, 0.8823529, 1,
0.9925902, -1.989357, 2.92672, 1, 0, 0.8745098, 1,
0.9937983, 0.2253783, 1.464683, 1, 0, 0.8705882, 1,
0.9939792, 0.6767335, 0.4450745, 1, 0, 0.8627451, 1,
0.9964887, -0.01819053, 1.253418, 1, 0, 0.8588235, 1,
1.002187, 0.5556001, 2.743501, 1, 0, 0.8509804, 1,
1.00305, 0.5842615, -1.451077, 1, 0, 0.8470588, 1,
1.003858, -1.64951, 2.95301, 1, 0, 0.8392157, 1,
1.004232, 1.472556, 1.042969, 1, 0, 0.8352941, 1,
1.004975, 0.2838821, -0.06558704, 1, 0, 0.827451, 1,
1.005996, 0.007059008, 4.732435, 1, 0, 0.8235294, 1,
1.0078, 0.9256716, 0.2034412, 1, 0, 0.8156863, 1,
1.013819, -0.5903533, 3.58214, 1, 0, 0.8117647, 1,
1.014943, -1.217602, 2.392917, 1, 0, 0.8039216, 1,
1.015908, 0.7393062, 2.24405, 1, 0, 0.7960784, 1,
1.024468, -1.104276, 2.915162, 1, 0, 0.7921569, 1,
1.051028, -1.147875, 4.304214, 1, 0, 0.7843137, 1,
1.051111, 0.2552272, 0.9323834, 1, 0, 0.7803922, 1,
1.053825, 1.161849, -1.127379, 1, 0, 0.772549, 1,
1.054985, -0.240167, 3.424814, 1, 0, 0.7686275, 1,
1.057972, -1.605982, 2.405126, 1, 0, 0.7607843, 1,
1.05804, -1.554223, 2.879083, 1, 0, 0.7568628, 1,
1.058551, 0.2564043, 1.288155, 1, 0, 0.7490196, 1,
1.073262, 0.4824919, 1.837928, 1, 0, 0.7450981, 1,
1.074417, -2.055345, 2.243465, 1, 0, 0.7372549, 1,
1.085106, -1.014508, 2.804355, 1, 0, 0.7333333, 1,
1.090434, -0.01918367, 1.205788, 1, 0, 0.7254902, 1,
1.09488, 0.08289596, 1.116928, 1, 0, 0.7215686, 1,
1.120863, 0.6152276, -0.7718401, 1, 0, 0.7137255, 1,
1.122165, -0.1513123, 2.702823, 1, 0, 0.7098039, 1,
1.12532, -1.753271, 2.922129, 1, 0, 0.7019608, 1,
1.134427, 0.9060795, 0.5943368, 1, 0, 0.6941177, 1,
1.150605, -0.003288454, 1.570398, 1, 0, 0.6901961, 1,
1.151682, -0.1193655, 2.286245, 1, 0, 0.682353, 1,
1.158515, -0.95055, 1.29179, 1, 0, 0.6784314, 1,
1.162751, -0.3464898, 2.367417, 1, 0, 0.6705883, 1,
1.16411, -0.7630478, 1.405718, 1, 0, 0.6666667, 1,
1.171382, 0.2441373, 1.571364, 1, 0, 0.6588235, 1,
1.175688, -0.6267853, -0.2864103, 1, 0, 0.654902, 1,
1.18024, -0.6756468, 2.057899, 1, 0, 0.6470588, 1,
1.187077, 0.1304364, 2.450202, 1, 0, 0.6431373, 1,
1.192654, 0.7884402, 1.273973, 1, 0, 0.6352941, 1,
1.196688, -1.252092, 2.309336, 1, 0, 0.6313726, 1,
1.19758, 0.5483221, 0.6618525, 1, 0, 0.6235294, 1,
1.20309, 0.6045351, 2.310307, 1, 0, 0.6196079, 1,
1.210046, 0.1108798, 1.764708, 1, 0, 0.6117647, 1,
1.211404, 1.046434, 1.825943, 1, 0, 0.6078432, 1,
1.225368, -1.649347, 3.47576, 1, 0, 0.6, 1,
1.233983, 0.2582168, 2.14151, 1, 0, 0.5921569, 1,
1.235759, -2.289342, 0.4908832, 1, 0, 0.5882353, 1,
1.242736, -3.111582, 2.812679, 1, 0, 0.5803922, 1,
1.248877, 0.7081205, 0.8296856, 1, 0, 0.5764706, 1,
1.249775, -1.248438, 0.79806, 1, 0, 0.5686275, 1,
1.252962, -0.1586078, 1.781225, 1, 0, 0.5647059, 1,
1.252997, 1.944328, -0.07791651, 1, 0, 0.5568628, 1,
1.253048, -0.8713142, 2.243579, 1, 0, 0.5529412, 1,
1.258726, -0.1870774, 2.138528, 1, 0, 0.5450981, 1,
1.271644, 0.8991842, 0.5486346, 1, 0, 0.5411765, 1,
1.274908, -0.2050826, 0.8842428, 1, 0, 0.5333334, 1,
1.288649, -0.4274581, 3.384559, 1, 0, 0.5294118, 1,
1.297291, -0.4559592, 1.344002, 1, 0, 0.5215687, 1,
1.303452, -0.2011449, 2.315424, 1, 0, 0.5176471, 1,
1.31646, 0.1050594, 1.526082, 1, 0, 0.509804, 1,
1.318643, 0.4669141, 1.171122, 1, 0, 0.5058824, 1,
1.322539, 0.4082414, 1.256291, 1, 0, 0.4980392, 1,
1.326397, -0.7765483, 2.172739, 1, 0, 0.4901961, 1,
1.328691, 1.440671, -2.404145, 1, 0, 0.4862745, 1,
1.329463, -2.430102, 2.909957, 1, 0, 0.4784314, 1,
1.339832, -0.3320341, 1.874799, 1, 0, 0.4745098, 1,
1.344536, 1.039269, 1.875645, 1, 0, 0.4666667, 1,
1.368823, 0.1440391, 1.919873, 1, 0, 0.4627451, 1,
1.379102, 0.8652972, 0.7480897, 1, 0, 0.454902, 1,
1.392634, 0.6839823, -0.1427398, 1, 0, 0.4509804, 1,
1.408878, -0.247828, 0.1325518, 1, 0, 0.4431373, 1,
1.412282, -0.6868437, 0.6270251, 1, 0, 0.4392157, 1,
1.412933, 0.3589855, 1.22747, 1, 0, 0.4313726, 1,
1.418286, 0.5532181, 0.8625734, 1, 0, 0.427451, 1,
1.419859, 1.257694, 1.308464, 1, 0, 0.4196078, 1,
1.43458, -0.5396165, 2.347651, 1, 0, 0.4156863, 1,
1.435961, -1.17593, 0.8538053, 1, 0, 0.4078431, 1,
1.440479, 0.1689295, 1.460893, 1, 0, 0.4039216, 1,
1.441642, 1.301539, -0.2480435, 1, 0, 0.3960784, 1,
1.445351, 0.7679582, -1.136287, 1, 0, 0.3882353, 1,
1.445968, -1.214244, 4.411623, 1, 0, 0.3843137, 1,
1.450338, 1.186121, -0.2537077, 1, 0, 0.3764706, 1,
1.450784, -1.240591, 2.3295, 1, 0, 0.372549, 1,
1.458679, -0.6238153, 1.453856, 1, 0, 0.3647059, 1,
1.469311, -1.126232, 1.903754, 1, 0, 0.3607843, 1,
1.491947, -0.1867394, 0.9102081, 1, 0, 0.3529412, 1,
1.539996, 0.1141776, 0.3181733, 1, 0, 0.3490196, 1,
1.547343, -3.551684, 3.466658, 1, 0, 0.3411765, 1,
1.553718, -0.7267094, 4.221202, 1, 0, 0.3372549, 1,
1.561702, -2.230827, 2.088891, 1, 0, 0.3294118, 1,
1.581621, -0.4229327, 2.126675, 1, 0, 0.3254902, 1,
1.586917, 1.413697, 1.25358, 1, 0, 0.3176471, 1,
1.591143, -0.4669256, 2.579802, 1, 0, 0.3137255, 1,
1.594218, -0.14446, 2.272155, 1, 0, 0.3058824, 1,
1.597307, -0.1187403, 1.475323, 1, 0, 0.2980392, 1,
1.608563, -0.5892245, 2.387045, 1, 0, 0.2941177, 1,
1.633284, -0.4006766, 1.150756, 1, 0, 0.2862745, 1,
1.635024, -1.702832, 2.92971, 1, 0, 0.282353, 1,
1.651326, 0.7742801, 0.7123341, 1, 0, 0.2745098, 1,
1.651975, -0.7829457, 2.569902, 1, 0, 0.2705882, 1,
1.668281, 0.5331151, 3.353189, 1, 0, 0.2627451, 1,
1.668994, 1.047149, 0.6944502, 1, 0, 0.2588235, 1,
1.684987, -0.8095371, 2.637403, 1, 0, 0.2509804, 1,
1.697838, 0.221709, 0.4157215, 1, 0, 0.2470588, 1,
1.7088, -0.1699847, 1.640331, 1, 0, 0.2392157, 1,
1.722329, 0.5605985, 1.892404, 1, 0, 0.2352941, 1,
1.727665, 1.263108, -0.1583556, 1, 0, 0.227451, 1,
1.736452, -0.01809238, 0.04802803, 1, 0, 0.2235294, 1,
1.737145, 0.6521761, 1.100298, 1, 0, 0.2156863, 1,
1.768002, 0.9682561, 0.7755964, 1, 0, 0.2117647, 1,
1.819602, 0.4655181, 2.249676, 1, 0, 0.2039216, 1,
1.82816, 0.03138411, 0.9499154, 1, 0, 0.1960784, 1,
1.833234, 0.5246164, 1.751218, 1, 0, 0.1921569, 1,
1.842629, -0.8199471, 2.894367, 1, 0, 0.1843137, 1,
1.84866, 0.9080936, 0.724977, 1, 0, 0.1803922, 1,
1.88147, -0.2456722, 2.205412, 1, 0, 0.172549, 1,
1.88897, 1.300576, 0.2426791, 1, 0, 0.1686275, 1,
1.889023, -0.3374031, 1.376482, 1, 0, 0.1607843, 1,
1.892855, 0.08212689, 1.968245, 1, 0, 0.1568628, 1,
1.894331, 0.2216466, 1.602731, 1, 0, 0.1490196, 1,
1.94, -0.02076794, 2.451705, 1, 0, 0.145098, 1,
1.957567, -0.9721771, 1.460111, 1, 0, 0.1372549, 1,
2.042918, 1.327113, 1.14764, 1, 0, 0.1333333, 1,
2.102586, -1.057823, 1.636368, 1, 0, 0.1254902, 1,
2.126606, -1.620029, 1.816184, 1, 0, 0.1215686, 1,
2.191839, -0.5720134, 1.765704, 1, 0, 0.1137255, 1,
2.219572, 0.09525252, 1.843858, 1, 0, 0.1098039, 1,
2.2602, -0.5181684, 1.928784, 1, 0, 0.1019608, 1,
2.269853, -1.533177, 2.505979, 1, 0, 0.09411765, 1,
2.271574, -0.7519737, 3.470832, 1, 0, 0.09019608, 1,
2.272782, 0.8548571, 1.273444, 1, 0, 0.08235294, 1,
2.315263, -1.374604, 1.556591, 1, 0, 0.07843138, 1,
2.379174, -0.3073367, -0.3592317, 1, 0, 0.07058824, 1,
2.379879, -0.599359, 0.6563939, 1, 0, 0.06666667, 1,
2.384561, -0.08815365, 1.511251, 1, 0, 0.05882353, 1,
2.400366, -1.080405, 1.908762, 1, 0, 0.05490196, 1,
2.436391, -0.1409024, 0.9459223, 1, 0, 0.04705882, 1,
2.515583, -0.412321, 2.93438, 1, 0, 0.04313726, 1,
2.550672, -0.7948051, 1.187785, 1, 0, 0.03529412, 1,
2.619243, -0.1524632, 2.359825, 1, 0, 0.03137255, 1,
2.690101, 1.105515, -1.328064, 1, 0, 0.02352941, 1,
2.751453, -0.1879365, 1.577149, 1, 0, 0.01960784, 1,
2.78696, -1.47586, 2.001265, 1, 0, 0.01176471, 1,
2.910254, -0.01130692, 1.403619, 1, 0, 0.007843138, 1
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
-0.367404, -4.687707, -6.849972, 0, -0.5, 0.5, 0.5,
-0.367404, -4.687707, -6.849972, 1, -0.5, 0.5, 0.5,
-0.367404, -4.687707, -6.849972, 1, 1.5, 0.5, 0.5,
-0.367404, -4.687707, -6.849972, 0, 1.5, 0.5, 0.5
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
-4.756188, -0.2005837, -6.849972, 0, -0.5, 0.5, 0.5,
-4.756188, -0.2005837, -6.849972, 1, -0.5, 0.5, 0.5,
-4.756188, -0.2005837, -6.849972, 1, 1.5, 0.5, 0.5,
-4.756188, -0.2005837, -6.849972, 0, 1.5, 0.5, 0.5
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
-4.756188, -4.687707, 0.2668672, 0, -0.5, 0.5, 0.5,
-4.756188, -4.687707, 0.2668672, 1, -0.5, 0.5, 0.5,
-4.756188, -4.687707, 0.2668672, 1, 1.5, 0.5, 0.5,
-4.756188, -4.687707, 0.2668672, 0, 1.5, 0.5, 0.5
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
-3, -3.652217, -5.207624,
2, -3.652217, -5.207624,
-3, -3.652217, -5.207624,
-3, -3.824799, -5.481349,
-2, -3.652217, -5.207624,
-2, -3.824799, -5.481349,
-1, -3.652217, -5.207624,
-1, -3.824799, -5.481349,
0, -3.652217, -5.207624,
0, -3.824799, -5.481349,
1, -3.652217, -5.207624,
1, -3.824799, -5.481349,
2, -3.652217, -5.207624,
2, -3.824799, -5.481349
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
-3, -4.169962, -6.028798, 0, -0.5, 0.5, 0.5,
-3, -4.169962, -6.028798, 1, -0.5, 0.5, 0.5,
-3, -4.169962, -6.028798, 1, 1.5, 0.5, 0.5,
-3, -4.169962, -6.028798, 0, 1.5, 0.5, 0.5,
-2, -4.169962, -6.028798, 0, -0.5, 0.5, 0.5,
-2, -4.169962, -6.028798, 1, -0.5, 0.5, 0.5,
-2, -4.169962, -6.028798, 1, 1.5, 0.5, 0.5,
-2, -4.169962, -6.028798, 0, 1.5, 0.5, 0.5,
-1, -4.169962, -6.028798, 0, -0.5, 0.5, 0.5,
-1, -4.169962, -6.028798, 1, -0.5, 0.5, 0.5,
-1, -4.169962, -6.028798, 1, 1.5, 0.5, 0.5,
-1, -4.169962, -6.028798, 0, 1.5, 0.5, 0.5,
0, -4.169962, -6.028798, 0, -0.5, 0.5, 0.5,
0, -4.169962, -6.028798, 1, -0.5, 0.5, 0.5,
0, -4.169962, -6.028798, 1, 1.5, 0.5, 0.5,
0, -4.169962, -6.028798, 0, 1.5, 0.5, 0.5,
1, -4.169962, -6.028798, 0, -0.5, 0.5, 0.5,
1, -4.169962, -6.028798, 1, -0.5, 0.5, 0.5,
1, -4.169962, -6.028798, 1, 1.5, 0.5, 0.5,
1, -4.169962, -6.028798, 0, 1.5, 0.5, 0.5,
2, -4.169962, -6.028798, 0, -0.5, 0.5, 0.5,
2, -4.169962, -6.028798, 1, -0.5, 0.5, 0.5,
2, -4.169962, -6.028798, 1, 1.5, 0.5, 0.5,
2, -4.169962, -6.028798, 0, 1.5, 0.5, 0.5
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
-3.743392, -3, -5.207624,
-3.743392, 3, -5.207624,
-3.743392, -3, -5.207624,
-3.912191, -3, -5.481349,
-3.743392, -2, -5.207624,
-3.912191, -2, -5.481349,
-3.743392, -1, -5.207624,
-3.912191, -1, -5.481349,
-3.743392, 0, -5.207624,
-3.912191, 0, -5.481349,
-3.743392, 1, -5.207624,
-3.912191, 1, -5.481349,
-3.743392, 2, -5.207624,
-3.912191, 2, -5.481349,
-3.743392, 3, -5.207624,
-3.912191, 3, -5.481349
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
-4.24979, -3, -6.028798, 0, -0.5, 0.5, 0.5,
-4.24979, -3, -6.028798, 1, -0.5, 0.5, 0.5,
-4.24979, -3, -6.028798, 1, 1.5, 0.5, 0.5,
-4.24979, -3, -6.028798, 0, 1.5, 0.5, 0.5,
-4.24979, -2, -6.028798, 0, -0.5, 0.5, 0.5,
-4.24979, -2, -6.028798, 1, -0.5, 0.5, 0.5,
-4.24979, -2, -6.028798, 1, 1.5, 0.5, 0.5,
-4.24979, -2, -6.028798, 0, 1.5, 0.5, 0.5,
-4.24979, -1, -6.028798, 0, -0.5, 0.5, 0.5,
-4.24979, -1, -6.028798, 1, -0.5, 0.5, 0.5,
-4.24979, -1, -6.028798, 1, 1.5, 0.5, 0.5,
-4.24979, -1, -6.028798, 0, 1.5, 0.5, 0.5,
-4.24979, 0, -6.028798, 0, -0.5, 0.5, 0.5,
-4.24979, 0, -6.028798, 1, -0.5, 0.5, 0.5,
-4.24979, 0, -6.028798, 1, 1.5, 0.5, 0.5,
-4.24979, 0, -6.028798, 0, 1.5, 0.5, 0.5,
-4.24979, 1, -6.028798, 0, -0.5, 0.5, 0.5,
-4.24979, 1, -6.028798, 1, -0.5, 0.5, 0.5,
-4.24979, 1, -6.028798, 1, 1.5, 0.5, 0.5,
-4.24979, 1, -6.028798, 0, 1.5, 0.5, 0.5,
-4.24979, 2, -6.028798, 0, -0.5, 0.5, 0.5,
-4.24979, 2, -6.028798, 1, -0.5, 0.5, 0.5,
-4.24979, 2, -6.028798, 1, 1.5, 0.5, 0.5,
-4.24979, 2, -6.028798, 0, 1.5, 0.5, 0.5,
-4.24979, 3, -6.028798, 0, -0.5, 0.5, 0.5,
-4.24979, 3, -6.028798, 1, -0.5, 0.5, 0.5,
-4.24979, 3, -6.028798, 1, 1.5, 0.5, 0.5,
-4.24979, 3, -6.028798, 0, 1.5, 0.5, 0.5
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
-3.743392, -3.652217, -4,
-3.743392, -3.652217, 4,
-3.743392, -3.652217, -4,
-3.912191, -3.824799, -4,
-3.743392, -3.652217, -2,
-3.912191, -3.824799, -2,
-3.743392, -3.652217, 0,
-3.912191, -3.824799, 0,
-3.743392, -3.652217, 2,
-3.912191, -3.824799, 2,
-3.743392, -3.652217, 4,
-3.912191, -3.824799, 4
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
-4.24979, -4.169962, -4, 0, -0.5, 0.5, 0.5,
-4.24979, -4.169962, -4, 1, -0.5, 0.5, 0.5,
-4.24979, -4.169962, -4, 1, 1.5, 0.5, 0.5,
-4.24979, -4.169962, -4, 0, 1.5, 0.5, 0.5,
-4.24979, -4.169962, -2, 0, -0.5, 0.5, 0.5,
-4.24979, -4.169962, -2, 1, -0.5, 0.5, 0.5,
-4.24979, -4.169962, -2, 1, 1.5, 0.5, 0.5,
-4.24979, -4.169962, -2, 0, 1.5, 0.5, 0.5,
-4.24979, -4.169962, 0, 0, -0.5, 0.5, 0.5,
-4.24979, -4.169962, 0, 1, -0.5, 0.5, 0.5,
-4.24979, -4.169962, 0, 1, 1.5, 0.5, 0.5,
-4.24979, -4.169962, 0, 0, 1.5, 0.5, 0.5,
-4.24979, -4.169962, 2, 0, -0.5, 0.5, 0.5,
-4.24979, -4.169962, 2, 1, -0.5, 0.5, 0.5,
-4.24979, -4.169962, 2, 1, 1.5, 0.5, 0.5,
-4.24979, -4.169962, 2, 0, 1.5, 0.5, 0.5,
-4.24979, -4.169962, 4, 0, -0.5, 0.5, 0.5,
-4.24979, -4.169962, 4, 1, -0.5, 0.5, 0.5,
-4.24979, -4.169962, 4, 1, 1.5, 0.5, 0.5,
-4.24979, -4.169962, 4, 0, 1.5, 0.5, 0.5
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
-3.743392, -3.652217, -5.207624,
-3.743392, 3.25105, -5.207624,
-3.743392, -3.652217, 5.741358,
-3.743392, 3.25105, 5.741358,
-3.743392, -3.652217, -5.207624,
-3.743392, -3.652217, 5.741358,
-3.743392, 3.25105, -5.207624,
-3.743392, 3.25105, 5.741358,
-3.743392, -3.652217, -5.207624,
3.008584, -3.652217, -5.207624,
-3.743392, -3.652217, 5.741358,
3.008584, -3.652217, 5.741358,
-3.743392, 3.25105, -5.207624,
3.008584, 3.25105, -5.207624,
-3.743392, 3.25105, 5.741358,
3.008584, 3.25105, 5.741358,
3.008584, -3.652217, -5.207624,
3.008584, 3.25105, -5.207624,
3.008584, -3.652217, 5.741358,
3.008584, 3.25105, 5.741358,
3.008584, -3.652217, -5.207624,
3.008584, -3.652217, 5.741358,
3.008584, 3.25105, -5.207624,
3.008584, 3.25105, 5.741358
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
var radius = 7.795467;
var distance = 34.68291;
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
mvMatrix.translate( 0.367404, 0.2005837, -0.2668672 );
mvMatrix.scale( 1.248318, 1.22096, 0.7698078 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.68291);
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
flurazole<-read.table("flurazole.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-flurazole$V2
```

```
## Error in eval(expr, envir, enclos): object 'flurazole' not found
```

```r
y<-flurazole$V3
```

```
## Error in eval(expr, envir, enclos): object 'flurazole' not found
```

```r
z<-flurazole$V4
```

```
## Error in eval(expr, envir, enclos): object 'flurazole' not found
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
-3.645062, -1.817541, -1.730662, 0, 0, 1, 1, 1,
-3.138113, -1.579102, -1.85903, 1, 0, 0, 1, 1,
-3.12545, 0.7480759, -0.5569475, 1, 0, 0, 1, 1,
-2.929459, -1.699881, -1.785067, 1, 0, 0, 1, 1,
-2.883367, 1.232588, -1.200604, 1, 0, 0, 1, 1,
-2.861881, 0.8786498, 0.195471, 1, 0, 0, 1, 1,
-2.795855, -0.1221839, -2.980624, 0, 0, 0, 1, 1,
-2.686944, -0.795723, -1.199965, 0, 0, 0, 1, 1,
-2.68104, 0.7044934, -2.761991, 0, 0, 0, 1, 1,
-2.483189, -1.174089, -2.43473, 0, 0, 0, 1, 1,
-2.45468, -0.8449141, -2.842423, 0, 0, 0, 1, 1,
-2.294756, 1.287254, -1.571718, 0, 0, 0, 1, 1,
-2.281953, -0.9361038, -2.191612, 0, 0, 0, 1, 1,
-2.229666, 0.1451242, 0.8185554, 1, 1, 1, 1, 1,
-2.189861, -0.6853082, -2.082824, 1, 1, 1, 1, 1,
-2.161138, 0.8388513, -1.631716, 1, 1, 1, 1, 1,
-2.128521, 1.000508, -1.440438, 1, 1, 1, 1, 1,
-2.098873, -0.3115908, -1.751815, 1, 1, 1, 1, 1,
-2.092094, 1.75805, -1.225499, 1, 1, 1, 1, 1,
-2.052336, 1.340619, -0.03101797, 1, 1, 1, 1, 1,
-2.031058, 0.5213602, -1.286099, 1, 1, 1, 1, 1,
-2.017813, 0.8666388, -2.123614, 1, 1, 1, 1, 1,
-1.987218, 0.05714909, -1.033752, 1, 1, 1, 1, 1,
-1.93708, -0.02987897, -0.6757423, 1, 1, 1, 1, 1,
-1.925261, 0.5844305, -1.227956, 1, 1, 1, 1, 1,
-1.842363, -0.1450339, -1.493484, 1, 1, 1, 1, 1,
-1.838141, -0.9113896, -4.099132, 1, 1, 1, 1, 1,
-1.834516, -0.9132451, -2.279911, 1, 1, 1, 1, 1,
-1.819463, 0.1050968, -2.063465, 0, 0, 1, 1, 1,
-1.815046, -1.21642, -2.12751, 1, 0, 0, 1, 1,
-1.80124, -0.4680625, -2.335595, 1, 0, 0, 1, 1,
-1.795244, 0.9610967, -1.070803, 1, 0, 0, 1, 1,
-1.741858, 0.5168265, -0.6367164, 1, 0, 0, 1, 1,
-1.737295, -0.2310079, -1.808752, 1, 0, 0, 1, 1,
-1.701141, -2.108702, -3.200115, 0, 0, 0, 1, 1,
-1.676995, 1.181208, -1.320094, 0, 0, 0, 1, 1,
-1.665281, -2.13127, -2.526793, 0, 0, 0, 1, 1,
-1.661827, -0.2865663, -1.776386, 0, 0, 0, 1, 1,
-1.659041, -0.3975319, -1.11742, 0, 0, 0, 1, 1,
-1.65351, 0.4445815, -2.248382, 0, 0, 0, 1, 1,
-1.653083, -0.9153602, -1.119386, 0, 0, 0, 1, 1,
-1.65142, -0.05965194, -1.799263, 1, 1, 1, 1, 1,
-1.622387, -1.493885, -3.740882, 1, 1, 1, 1, 1,
-1.608203, 0.3297333, -1.38597, 1, 1, 1, 1, 1,
-1.598774, 1.554085, -0.7938882, 1, 1, 1, 1, 1,
-1.591485, 0.7988452, -1.356727, 1, 1, 1, 1, 1,
-1.580203, 0.4940551, -1.923817, 1, 1, 1, 1, 1,
-1.578474, 1.192544, -0.7414396, 1, 1, 1, 1, 1,
-1.561545, -0.3519952, -3.998794, 1, 1, 1, 1, 1,
-1.554653, 1.356128, 0.9981233, 1, 1, 1, 1, 1,
-1.547675, 2.433637, -1.680115, 1, 1, 1, 1, 1,
-1.543616, -0.5949436, -1.716321, 1, 1, 1, 1, 1,
-1.535605, -0.2054032, -1.026662, 1, 1, 1, 1, 1,
-1.518221, -1.419937, -3.523011, 1, 1, 1, 1, 1,
-1.501591, -0.1881206, -2.424571, 1, 1, 1, 1, 1,
-1.488108, -0.8086712, -2.638823, 1, 1, 1, 1, 1,
-1.48245, 0.006762096, -3.246874, 0, 0, 1, 1, 1,
-1.47969, -0.2447371, -1.922109, 1, 0, 0, 1, 1,
-1.47716, -0.5131395, 0.1468424, 1, 0, 0, 1, 1,
-1.469898, 0.6159402, 0.6641926, 1, 0, 0, 1, 1,
-1.467654, 2.245543, 0.8859384, 1, 0, 0, 1, 1,
-1.459442, -0.4236304, -3.203439, 1, 0, 0, 1, 1,
-1.450094, 0.3697231, -1.836367, 0, 0, 0, 1, 1,
-1.448299, 0.8167464, -1.804853, 0, 0, 0, 1, 1,
-1.446323, 1.161209, -0.6753687, 0, 0, 0, 1, 1,
-1.441329, -2.323562, -2.301573, 0, 0, 0, 1, 1,
-1.435519, -1.108355, -2.773287, 0, 0, 0, 1, 1,
-1.432501, 0.2792057, 0.6449274, 0, 0, 0, 1, 1,
-1.414043, 0.3873067, -1.773512, 0, 0, 0, 1, 1,
-1.409002, 1.675535, -1.131116, 1, 1, 1, 1, 1,
-1.404208, -0.6628467, -1.50919, 1, 1, 1, 1, 1,
-1.402757, 1.017997, -1.131954, 1, 1, 1, 1, 1,
-1.401932, -0.1810819, -1.350459, 1, 1, 1, 1, 1,
-1.396657, 0.6074338, -0.5382696, 1, 1, 1, 1, 1,
-1.392499, 0.7612869, 0.8424733, 1, 1, 1, 1, 1,
-1.3893, -0.2931252, -2.373997, 1, 1, 1, 1, 1,
-1.374546, -0.4756153, -1.306337, 1, 1, 1, 1, 1,
-1.371511, -0.5088663, -1.751227, 1, 1, 1, 1, 1,
-1.367271, -0.7296907, -0.2219156, 1, 1, 1, 1, 1,
-1.364452, -1.686156, -1.783768, 1, 1, 1, 1, 1,
-1.34509, 0.02495151, -0.7369719, 1, 1, 1, 1, 1,
-1.338468, 0.4517986, -0.7351627, 1, 1, 1, 1, 1,
-1.337273, -0.01478116, -0.8829104, 1, 1, 1, 1, 1,
-1.328931, 2.369364, -1.009565, 1, 1, 1, 1, 1,
-1.323166, 0.7693341, -1.998023, 0, 0, 1, 1, 1,
-1.322494, 0.206572, -1.639782, 1, 0, 0, 1, 1,
-1.319231, 0.1402571, -1.629995, 1, 0, 0, 1, 1,
-1.310667, -0.2153257, -1.833543, 1, 0, 0, 1, 1,
-1.300755, -0.6099872, -3.087464, 1, 0, 0, 1, 1,
-1.300105, 0.1196086, -2.010779, 1, 0, 0, 1, 1,
-1.298043, 0.563538, -1.252354, 0, 0, 0, 1, 1,
-1.296151, 0.1455816, -2.090653, 0, 0, 0, 1, 1,
-1.288541, 1.498672, -0.6749904, 0, 0, 0, 1, 1,
-1.281835, 0.779467, -1.175568, 0, 0, 0, 1, 1,
-1.274874, -0.3371724, -3.29769, 0, 0, 0, 1, 1,
-1.273555, -1.54338, -1.800328, 0, 0, 0, 1, 1,
-1.269744, -2.186941, -1.354156, 0, 0, 0, 1, 1,
-1.26314, 0.5053753, -2.56565, 1, 1, 1, 1, 1,
-1.25546, 0.3632346, -0.7916985, 1, 1, 1, 1, 1,
-1.234418, -0.04341732, -3.427003, 1, 1, 1, 1, 1,
-1.233637, -0.4330192, -1.282753, 1, 1, 1, 1, 1,
-1.23065, -0.1665664, -0.6398478, 1, 1, 1, 1, 1,
-1.224063, -0.1408082, -1.382558, 1, 1, 1, 1, 1,
-1.216911, 1.652704, -1.810404, 1, 1, 1, 1, 1,
-1.215489, 1.947998, 0.4220692, 1, 1, 1, 1, 1,
-1.212577, 0.2431522, -1.299241, 1, 1, 1, 1, 1,
-1.205158, 0.1973756, -1.087673, 1, 1, 1, 1, 1,
-1.203892, 1.338427, 0.1593276, 1, 1, 1, 1, 1,
-1.200395, 0.7143011, 0.6076561, 1, 1, 1, 1, 1,
-1.187817, 0.8615977, -2.324286, 1, 1, 1, 1, 1,
-1.18658, 0.5277649, -1.340824, 1, 1, 1, 1, 1,
-1.174077, -0.7128221, -4.370769, 1, 1, 1, 1, 1,
-1.171502, -0.6284658, -0.3006347, 0, 0, 1, 1, 1,
-1.170168, -0.7074391, -1.536545, 1, 0, 0, 1, 1,
-1.168392, -0.278644, -1.235328, 1, 0, 0, 1, 1,
-1.162272, 0.1097628, 0.04070189, 1, 0, 0, 1, 1,
-1.154185, -0.5210809, -2.388985, 1, 0, 0, 1, 1,
-1.152008, 0.4457582, -0.9193527, 1, 0, 0, 1, 1,
-1.147997, 0.7902904, -0.6797575, 0, 0, 0, 1, 1,
-1.145393, -1.293365, -2.260601, 0, 0, 0, 1, 1,
-1.145241, 1.548077, -2.169614, 0, 0, 0, 1, 1,
-1.138847, -0.988188, -2.073113, 0, 0, 0, 1, 1,
-1.134361, 1.041014, -0.1833859, 0, 0, 0, 1, 1,
-1.131198, -2.220503, -2.305504, 0, 0, 0, 1, 1,
-1.122976, 0.6481217, -2.527105, 0, 0, 0, 1, 1,
-1.120585, -0.2621581, -3.60823, 1, 1, 1, 1, 1,
-1.119817, 0.02953008, -2.106102, 1, 1, 1, 1, 1,
-1.114144, -0.2184301, -2.868436, 1, 1, 1, 1, 1,
-1.109917, 0.5355104, 0.05315572, 1, 1, 1, 1, 1,
-1.106127, -0.2707627, -1.224921, 1, 1, 1, 1, 1,
-1.101808, -1.182488, -3.492126, 1, 1, 1, 1, 1,
-1.100488, -0.4006631, -2.278816, 1, 1, 1, 1, 1,
-1.096728, 0.161069, -0.950473, 1, 1, 1, 1, 1,
-1.085522, 1.334272, -1.35729, 1, 1, 1, 1, 1,
-1.084913, 1.110388, -2.228168, 1, 1, 1, 1, 1,
-1.084336, -0.1720654, -0.03807797, 1, 1, 1, 1, 1,
-1.080356, 0.3309101, -1.42623, 1, 1, 1, 1, 1,
-1.06635, 0.5898184, 0.0763633, 1, 1, 1, 1, 1,
-1.061898, 0.4909821, -1.146367, 1, 1, 1, 1, 1,
-1.061188, -0.6698745, -3.051963, 1, 1, 1, 1, 1,
-1.058352, 0.5865638, -1.249749, 0, 0, 1, 1, 1,
-1.052537, -0.9176289, -3.024209, 1, 0, 0, 1, 1,
-1.041571, 0.8784135, -2.382961, 1, 0, 0, 1, 1,
-1.037101, -0.2591915, -3.972199, 1, 0, 0, 1, 1,
-1.036337, -0.388753, -0.5983008, 1, 0, 0, 1, 1,
-1.0357, 0.1933753, -3.488168, 1, 0, 0, 1, 1,
-1.029383, -0.1197803, -2.104581, 0, 0, 0, 1, 1,
-1.027312, -1.299395, -2.6099, 0, 0, 0, 1, 1,
-1.027172, -1.466045, -3.475711, 0, 0, 0, 1, 1,
-1.023625, 0.947393, 0.123663, 0, 0, 0, 1, 1,
-1.019213, 2.027375, -0.3877317, 0, 0, 0, 1, 1,
-1.008118, 0.8937997, -0.5761132, 0, 0, 0, 1, 1,
-1.0038, 1.807856, -0.795476, 0, 0, 0, 1, 1,
-0.9922342, 0.8495713, -0.7252981, 1, 1, 1, 1, 1,
-0.9823544, 0.8943794, -0.4314131, 1, 1, 1, 1, 1,
-0.9770382, 0.7205081, -0.8000563, 1, 1, 1, 1, 1,
-0.9756296, -0.2748648, -1.336586, 1, 1, 1, 1, 1,
-0.973055, 0.2821609, -1.132665, 1, 1, 1, 1, 1,
-0.964906, 2.04552, 0.2579965, 1, 1, 1, 1, 1,
-0.9603531, 0.3048123, -1.109322, 1, 1, 1, 1, 1,
-0.9568986, 1.074868, -0.2896414, 1, 1, 1, 1, 1,
-0.9561483, 1.005414, 0.03434512, 1, 1, 1, 1, 1,
-0.9528206, 0.3623179, -2.558318, 1, 1, 1, 1, 1,
-0.9519222, 0.1409352, -3.548176, 1, 1, 1, 1, 1,
-0.9458867, -1.61485, -1.273672, 1, 1, 1, 1, 1,
-0.9447491, -0.03965791, -1.813232, 1, 1, 1, 1, 1,
-0.9440904, 1.377375, 0.6822295, 1, 1, 1, 1, 1,
-0.940272, 0.4099319, -2.005308, 1, 1, 1, 1, 1,
-0.9376594, -0.7602095, -3.485639, 0, 0, 1, 1, 1,
-0.9275785, 0.03063512, -0.6195499, 1, 0, 0, 1, 1,
-0.9236951, 0.08504716, -1.507151, 1, 0, 0, 1, 1,
-0.9123605, -1.629432, -1.728944, 1, 0, 0, 1, 1,
-0.9118013, -1.405671, -0.9434505, 1, 0, 0, 1, 1,
-0.9060298, 0.3375139, 0.6186947, 1, 0, 0, 1, 1,
-0.9038949, 0.801738, -1.102274, 0, 0, 0, 1, 1,
-0.8992563, 1.46186, -0.09149266, 0, 0, 0, 1, 1,
-0.8966937, -1.134647, -2.877033, 0, 0, 0, 1, 1,
-0.8952923, 1.766011, 0.1945814, 0, 0, 0, 1, 1,
-0.8919868, -1.113546, -3.684542, 0, 0, 0, 1, 1,
-0.8914097, 0.5651094, -0.7369996, 0, 0, 0, 1, 1,
-0.884391, -0.3887437, -2.01258, 0, 0, 0, 1, 1,
-0.8815556, -0.6533176, -1.70462, 1, 1, 1, 1, 1,
-0.8806936, 0.3744095, -0.6211948, 1, 1, 1, 1, 1,
-0.8804038, -0.6157261, -3.081301, 1, 1, 1, 1, 1,
-0.876618, 0.1735651, -2.190727, 1, 1, 1, 1, 1,
-0.874125, 0.1599178, -1.636413, 1, 1, 1, 1, 1,
-0.8737648, -0.06923439, -0.4875526, 1, 1, 1, 1, 1,
-0.8712041, -0.4024662, -1.692185, 1, 1, 1, 1, 1,
-0.8654225, -0.3931958, -1.953898, 1, 1, 1, 1, 1,
-0.8598186, -0.1283884, -1.625069, 1, 1, 1, 1, 1,
-0.8560245, -1.547951, -2.422372, 1, 1, 1, 1, 1,
-0.8514108, -1.116289, -3.204866, 1, 1, 1, 1, 1,
-0.8415071, 0.3859991, -1.794158, 1, 1, 1, 1, 1,
-0.8385623, -0.6486018, -3.623273, 1, 1, 1, 1, 1,
-0.8358512, -0.06804086, -2.289888, 1, 1, 1, 1, 1,
-0.8355523, 0.4438534, -1.889271, 1, 1, 1, 1, 1,
-0.8352574, 0.001509348, -1.069308, 0, 0, 1, 1, 1,
-0.8327745, -1.712783, -2.17046, 1, 0, 0, 1, 1,
-0.8306111, 1.299515, 1.380424, 1, 0, 0, 1, 1,
-0.8302618, 1.862334, -1.313137, 1, 0, 0, 1, 1,
-0.8274034, -0.4541714, -1.401679, 1, 0, 0, 1, 1,
-0.8233747, -0.07516666, -1.406983, 1, 0, 0, 1, 1,
-0.8217332, -1.091855, -2.866347, 0, 0, 0, 1, 1,
-0.8175226, -0.006035316, -1.88008, 0, 0, 0, 1, 1,
-0.8148993, -0.3996988, -1.754182, 0, 0, 0, 1, 1,
-0.8147915, 0.8611538, -0.252313, 0, 0, 0, 1, 1,
-0.8071197, 0.1140446, -1.811675, 0, 0, 0, 1, 1,
-0.8067004, 1.618003, -0.6060767, 0, 0, 0, 1, 1,
-0.8032445, -1.493915, -3.167879, 0, 0, 0, 1, 1,
-0.8028294, -0.4460577, -1.932778, 1, 1, 1, 1, 1,
-0.801881, -0.523533, -2.269721, 1, 1, 1, 1, 1,
-0.8017842, 1.104202, -1.428045, 1, 1, 1, 1, 1,
-0.8000303, 0.5706671, -0.5103138, 1, 1, 1, 1, 1,
-0.7985219, 0.1559347, -2.316988, 1, 1, 1, 1, 1,
-0.7931374, -0.1249675, -0.1106356, 1, 1, 1, 1, 1,
-0.7916375, 0.0230038, -2.334712, 1, 1, 1, 1, 1,
-0.7905831, 0.5864764, -2.344835, 1, 1, 1, 1, 1,
-0.7879365, -0.2293088, -0.7297214, 1, 1, 1, 1, 1,
-0.7823346, -1.802356, -4.257208, 1, 1, 1, 1, 1,
-0.7726489, 0.8052738, -0.8960188, 1, 1, 1, 1, 1,
-0.7708205, 0.3196661, -1.97728, 1, 1, 1, 1, 1,
-0.7680885, -1.445755, -1.430049, 1, 1, 1, 1, 1,
-0.76655, 2.29226, -0.3474012, 1, 1, 1, 1, 1,
-0.7647117, 0.8990787, -1.49663, 1, 1, 1, 1, 1,
-0.7624426, 0.8394331, -0.9078593, 0, 0, 1, 1, 1,
-0.7615996, 0.9899202, -2.251439, 1, 0, 0, 1, 1,
-0.7545096, 0.1351728, -2.875011, 1, 0, 0, 1, 1,
-0.7542689, -0.3223683, -0.7454674, 1, 0, 0, 1, 1,
-0.749198, 0.02874624, -1.870137, 1, 0, 0, 1, 1,
-0.7409256, 1.337222, 0.6643362, 1, 0, 0, 1, 1,
-0.739961, 0.5890249, 1.277168, 0, 0, 0, 1, 1,
-0.7364293, 0.4355755, -1.544237, 0, 0, 0, 1, 1,
-0.735229, 0.2720284, -1.7061, 0, 0, 0, 1, 1,
-0.734715, 0.6212515, -0.4941702, 0, 0, 0, 1, 1,
-0.7340985, 1.004957, -0.621197, 0, 0, 0, 1, 1,
-0.7305771, -0.7231503, -2.913454, 0, 0, 0, 1, 1,
-0.7266353, -1.452055, -2.79827, 0, 0, 0, 1, 1,
-0.7233042, -0.04209533, -1.33394, 1, 1, 1, 1, 1,
-0.7207499, 1.027361, -0.6709056, 1, 1, 1, 1, 1,
-0.7174489, -0.2847075, -2.228352, 1, 1, 1, 1, 1,
-0.7139193, 0.07661418, -1.471471, 1, 1, 1, 1, 1,
-0.712257, -0.8622317, -1.428334, 1, 1, 1, 1, 1,
-0.7093353, -0.2045905, -2.090407, 1, 1, 1, 1, 1,
-0.7080351, 1.060374, -0.6487991, 1, 1, 1, 1, 1,
-0.702453, 1.415789, 0.6365358, 1, 1, 1, 1, 1,
-0.7005929, 0.1271629, -1.095092, 1, 1, 1, 1, 1,
-0.7004178, 0.7149735, 0.2156174, 1, 1, 1, 1, 1,
-0.6956585, -0.05029491, -0.1576645, 1, 1, 1, 1, 1,
-0.6920862, -1.093627, -1.70928, 1, 1, 1, 1, 1,
-0.6919268, -0.3985645, -1.988924, 1, 1, 1, 1, 1,
-0.6900578, -0.5743545, -0.8320491, 1, 1, 1, 1, 1,
-0.6833993, 0.7756705, -1.85817, 1, 1, 1, 1, 1,
-0.6826286, 0.961445, -0.3307863, 0, 0, 1, 1, 1,
-0.670058, -0.5875721, -3.733246, 1, 0, 0, 1, 1,
-0.6673875, -0.6716651, -1.562, 1, 0, 0, 1, 1,
-0.6664246, -1.411972, -0.6286423, 1, 0, 0, 1, 1,
-0.6661605, -0.4636884, -2.907927, 1, 0, 0, 1, 1,
-0.6654602, -0.8299192, -3.205217, 1, 0, 0, 1, 1,
-0.6652418, 0.587436, -0.9458258, 0, 0, 0, 1, 1,
-0.6640686, -1.154239, -2.146746, 0, 0, 0, 1, 1,
-0.6578491, 1.841494, -0.8497454, 0, 0, 0, 1, 1,
-0.657726, 0.4381183, -1.537181, 0, 0, 0, 1, 1,
-0.6570342, 0.4850654, -0.8493022, 0, 0, 0, 1, 1,
-0.6527589, 0.614335, -0.6484485, 0, 0, 0, 1, 1,
-0.6525756, -1.575045, -1.077472, 0, 0, 0, 1, 1,
-0.6523592, -0.1829356, -2.57208, 1, 1, 1, 1, 1,
-0.6410204, -1.755046, -2.212985, 1, 1, 1, 1, 1,
-0.6350294, 0.4072801, -0.8582935, 1, 1, 1, 1, 1,
-0.6298758, 2.087637, -1.762354, 1, 1, 1, 1, 1,
-0.6294264, 0.4396651, 0.3790245, 1, 1, 1, 1, 1,
-0.6276955, 0.6839181, -2.355164, 1, 1, 1, 1, 1,
-0.6224497, -0.6322019, -3.401179, 1, 1, 1, 1, 1,
-0.6202103, 1.645612, -0.8147053, 1, 1, 1, 1, 1,
-0.6197746, -0.1337595, -0.01444766, 1, 1, 1, 1, 1,
-0.6197257, 0.5629209, -1.480113, 1, 1, 1, 1, 1,
-0.6175344, 0.2214015, -2.72478, 1, 1, 1, 1, 1,
-0.6147935, -0.6572961, -5.048173, 1, 1, 1, 1, 1,
-0.6145651, -0.4148166, -2.480954, 1, 1, 1, 1, 1,
-0.6143264, 0.2962926, -0.8784828, 1, 1, 1, 1, 1,
-0.604993, 0.5260902, -2.122725, 1, 1, 1, 1, 1,
-0.602706, -0.8711385, -2.868021, 0, 0, 1, 1, 1,
-0.5994485, 1.308056, 0.10844, 1, 0, 0, 1, 1,
-0.5973365, 0.4234001, -1.452714, 1, 0, 0, 1, 1,
-0.5955828, 0.7019694, 0.4305438, 1, 0, 0, 1, 1,
-0.5908501, -1.393038, -2.768212, 1, 0, 0, 1, 1,
-0.5906116, -1.038389, -2.16451, 1, 0, 0, 1, 1,
-0.5901496, -0.5925952, -1.322136, 0, 0, 0, 1, 1,
-0.589637, -2.221463, -1.966417, 0, 0, 0, 1, 1,
-0.5892371, 0.3580254, -0.3364629, 0, 0, 0, 1, 1,
-0.5876632, -0.193462, -1.957043, 0, 0, 0, 1, 1,
-0.5835302, 1.237581, -0.5895073, 0, 0, 0, 1, 1,
-0.5776597, 1.071932, -0.8232714, 0, 0, 0, 1, 1,
-0.5753363, 1.232554, -0.1954668, 0, 0, 0, 1, 1,
-0.5714484, -1.456547, -2.356066, 1, 1, 1, 1, 1,
-0.5686232, -0.5922862, -1.375481, 1, 1, 1, 1, 1,
-0.5641358, 0.3354757, 0.3390478, 1, 1, 1, 1, 1,
-0.5640332, 2.133924, 0.8113346, 1, 1, 1, 1, 1,
-0.5607011, -0.8449506, -0.6972573, 1, 1, 1, 1, 1,
-0.55988, -0.09590398, -1.247258, 1, 1, 1, 1, 1,
-0.5507725, -1.032542, -2.922065, 1, 1, 1, 1, 1,
-0.5464321, -0.9970507, -2.770126, 1, 1, 1, 1, 1,
-0.5425611, -0.4323093, 0.872354, 1, 1, 1, 1, 1,
-0.5378197, 1.872278, 0.1783202, 1, 1, 1, 1, 1,
-0.5338522, -0.5952232, -2.070063, 1, 1, 1, 1, 1,
-0.5231263, 0.2511097, -1.857513, 1, 1, 1, 1, 1,
-0.5180344, 1.083233, -1.752728, 1, 1, 1, 1, 1,
-0.5163819, 0.4788732, -2.679921, 1, 1, 1, 1, 1,
-0.5080013, -1.462404, -3.254279, 1, 1, 1, 1, 1,
-0.5000948, -1.082698, -0.3765906, 0, 0, 1, 1, 1,
-0.4949996, -0.09987164, -1.60532, 1, 0, 0, 1, 1,
-0.4935198, -1.501842, -1.826653, 1, 0, 0, 1, 1,
-0.4913014, -1.370359, -3.400184, 1, 0, 0, 1, 1,
-0.4894006, -1.609536, -1.988818, 1, 0, 0, 1, 1,
-0.4884284, -0.5686216, -1.889008, 1, 0, 0, 1, 1,
-0.4842061, 0.2713461, 0.4054066, 0, 0, 0, 1, 1,
-0.4824914, 1.375181, -0.6165163, 0, 0, 0, 1, 1,
-0.4719251, 0.3132346, -0.3519409, 0, 0, 0, 1, 1,
-0.4675982, -0.3661971, -0.6873702, 0, 0, 0, 1, 1,
-0.464776, -1.538716, -2.710947, 0, 0, 0, 1, 1,
-0.4631465, 1.033964, -0.7509534, 0, 0, 0, 1, 1,
-0.4557335, -0.9551655, -2.962371, 0, 0, 0, 1, 1,
-0.4545854, 2.376796, -0.2749462, 1, 1, 1, 1, 1,
-0.4534754, 0.9548197, -0.1971936, 1, 1, 1, 1, 1,
-0.4493062, -0.02434264, -2.407966, 1, 1, 1, 1, 1,
-0.4491107, 0.01882731, -1.392381, 1, 1, 1, 1, 1,
-0.4472923, 0.1239265, -0.5226527, 1, 1, 1, 1, 1,
-0.4458112, -0.1952756, -0.005180761, 1, 1, 1, 1, 1,
-0.4444199, 2.19436, -0.4576667, 1, 1, 1, 1, 1,
-0.4425135, -0.9716145, -2.185372, 1, 1, 1, 1, 1,
-0.4394475, -0.2772245, -1.52918, 1, 1, 1, 1, 1,
-0.4350175, 0.08246052, -2.53426, 1, 1, 1, 1, 1,
-0.4258763, 1.248756, -1.431749, 1, 1, 1, 1, 1,
-0.4231374, 1.242373, 1.042707, 1, 1, 1, 1, 1,
-0.4196187, 0.8111298, 0.2336292, 1, 1, 1, 1, 1,
-0.4183089, 0.4010878, -1.139544, 1, 1, 1, 1, 1,
-0.4146096, 0.919218, 0.4517709, 1, 1, 1, 1, 1,
-0.4141249, 0.7623588, -0.8935068, 0, 0, 1, 1, 1,
-0.4132088, -0.7564585, -2.672994, 1, 0, 0, 1, 1,
-0.4131462, 0.5791861, -1.858724, 1, 0, 0, 1, 1,
-0.4124309, -0.2938648, -2.39414, 1, 0, 0, 1, 1,
-0.4094902, 1.19958, -2.234728, 1, 0, 0, 1, 1,
-0.4073606, -0.08061701, -1.379025, 1, 0, 0, 1, 1,
-0.4048137, -0.8695211, -1.930091, 0, 0, 0, 1, 1,
-0.4037452, 1.03461, 0.7184585, 0, 0, 0, 1, 1,
-0.403631, 0.1526422, -0.1421054, 0, 0, 0, 1, 1,
-0.4027383, -0.2008824, -1.055687, 0, 0, 0, 1, 1,
-0.3923331, 0.2261271, 0.4407549, 0, 0, 0, 1, 1,
-0.391432, -1.100688, -2.455155, 0, 0, 0, 1, 1,
-0.3888078, -0.8023915, -3.08671, 0, 0, 0, 1, 1,
-0.3882029, 0.1304232, 0.379537, 1, 1, 1, 1, 1,
-0.3878252, -0.05122733, -1.786566, 1, 1, 1, 1, 1,
-0.3818253, 0.5629857, -1.778178, 1, 1, 1, 1, 1,
-0.3778304, 0.1979497, -1.224274, 1, 1, 1, 1, 1,
-0.3760785, 0.03173991, -1.619256, 1, 1, 1, 1, 1,
-0.3703951, 0.2116918, 0.7780517, 1, 1, 1, 1, 1,
-0.368109, -0.6173996, -2.472297, 1, 1, 1, 1, 1,
-0.3677524, 1.764657, -1.732321, 1, 1, 1, 1, 1,
-0.3646581, -1.00414, -2.669669, 1, 1, 1, 1, 1,
-0.3567188, -1.894989, -3.372011, 1, 1, 1, 1, 1,
-0.350408, -0.7159481, -2.397817, 1, 1, 1, 1, 1,
-0.347472, -0.2280596, -4.223852, 1, 1, 1, 1, 1,
-0.3472869, -1.540182, -2.726331, 1, 1, 1, 1, 1,
-0.3420591, 0.2749442, -2.569071, 1, 1, 1, 1, 1,
-0.3417046, -0.3318994, -1.984582, 1, 1, 1, 1, 1,
-0.3416408, 0.881096, -1.281898, 0, 0, 1, 1, 1,
-0.3372254, 0.6980498, -0.5398116, 1, 0, 0, 1, 1,
-0.336724, -1.064362, -2.550164, 1, 0, 0, 1, 1,
-0.3352248, -1.205605, -1.966845, 1, 0, 0, 1, 1,
-0.3319056, 0.6077591, 0.300566, 1, 0, 0, 1, 1,
-0.3300573, -0.5205624, -3.404297, 1, 0, 0, 1, 1,
-0.3283377, 0.2927907, -1.022187, 0, 0, 0, 1, 1,
-0.3279357, -0.742021, -3.972179, 0, 0, 0, 1, 1,
-0.3265404, -0.05617401, -2.980334, 0, 0, 0, 1, 1,
-0.3258449, 1.141998, -0.6091335, 0, 0, 0, 1, 1,
-0.3201371, 0.2165895, -1.652286, 0, 0, 0, 1, 1,
-0.3199916, -1.115065, -2.396362, 0, 0, 0, 1, 1,
-0.3189343, -0.0788664, -1.109383, 0, 0, 0, 1, 1,
-0.3185787, -0.6911315, -3.736209, 1, 1, 1, 1, 1,
-0.318436, 0.4009117, -1.168107, 1, 1, 1, 1, 1,
-0.3151195, 1.520242, -2.037241, 1, 1, 1, 1, 1,
-0.3145784, -0.7560542, -1.414694, 1, 1, 1, 1, 1,
-0.3136411, 0.6289707, -0.4515916, 1, 1, 1, 1, 1,
-0.3093705, -1.316175, -2.8078, 1, 1, 1, 1, 1,
-0.3068367, -0.6186745, -1.56922, 1, 1, 1, 1, 1,
-0.3063973, -1.103218, -1.845374, 1, 1, 1, 1, 1,
-0.306389, 0.9193488, -1.652512, 1, 1, 1, 1, 1,
-0.3053268, 0.3031024, -2.619589, 1, 1, 1, 1, 1,
-0.3049622, -0.2368278, -1.715151, 1, 1, 1, 1, 1,
-0.3042037, -0.4620415, -2.996083, 1, 1, 1, 1, 1,
-0.3020915, -1.440735, -1.667965, 1, 1, 1, 1, 1,
-0.3013301, 2.00772, 1.130746, 1, 1, 1, 1, 1,
-0.3005048, 0.5877219, -0.6548062, 1, 1, 1, 1, 1,
-0.2996143, -1.586267, -2.703686, 0, 0, 1, 1, 1,
-0.2980416, 0.04950869, -3.723645, 1, 0, 0, 1, 1,
-0.2949304, 1.31667, -0.6507783, 1, 0, 0, 1, 1,
-0.2910127, -0.7261978, -2.844545, 1, 0, 0, 1, 1,
-0.2906463, -0.928725, -2.241583, 1, 0, 0, 1, 1,
-0.284411, 0.3357467, -1.846659, 1, 0, 0, 1, 1,
-0.2840129, -1.075368, -3.259737, 0, 0, 0, 1, 1,
-0.2833363, -1.897996, -3.256991, 0, 0, 0, 1, 1,
-0.2821387, 1.080474, 1.36642, 0, 0, 0, 1, 1,
-0.2803024, 0.6721379, -0.3753529, 0, 0, 0, 1, 1,
-0.2745171, -1.572237, -2.731712, 0, 0, 0, 1, 1,
-0.2731142, 1.58384, -1.012296, 0, 0, 0, 1, 1,
-0.2686229, 2.021915, -2.166198, 0, 0, 0, 1, 1,
-0.253365, -0.769829, -4.873284, 1, 1, 1, 1, 1,
-0.2485559, -2.447989, -3.896169, 1, 1, 1, 1, 1,
-0.2469418, -0.2833631, -0.6859901, 1, 1, 1, 1, 1,
-0.2434885, 0.4101503, -0.4068443, 1, 1, 1, 1, 1,
-0.2428165, 1.311436, 0.4746847, 1, 1, 1, 1, 1,
-0.239094, 0.009190583, 0.6031097, 1, 1, 1, 1, 1,
-0.2345839, 0.09575625, -1.0087, 1, 1, 1, 1, 1,
-0.2343024, -1.184702, -3.11555, 1, 1, 1, 1, 1,
-0.2304983, 0.4707506, 0.7967322, 1, 1, 1, 1, 1,
-0.2301262, -0.9472712, -2.489043, 1, 1, 1, 1, 1,
-0.2267801, 0.6608325, -0.0292766, 1, 1, 1, 1, 1,
-0.2257014, 0.3453314, 0.8810266, 1, 1, 1, 1, 1,
-0.2228097, -0.2758108, -2.546416, 1, 1, 1, 1, 1,
-0.2223834, 0.9484738, -0.3084485, 1, 1, 1, 1, 1,
-0.2214301, 0.579738, -1.479876, 1, 1, 1, 1, 1,
-0.2152618, 0.3890333, -0.6991625, 0, 0, 1, 1, 1,
-0.2144143, 1.983157, -0.1096661, 1, 0, 0, 1, 1,
-0.2096615, -0.6711403, -1.950088, 1, 0, 0, 1, 1,
-0.208904, 1.825121, -1.079261, 1, 0, 0, 1, 1,
-0.2084533, 2.626253, -0.6746284, 1, 0, 0, 1, 1,
-0.2074383, 0.1584109, -1.065158, 1, 0, 0, 1, 1,
-0.2038401, -0.4835075, -3.312167, 0, 0, 0, 1, 1,
-0.2010618, 0.8274428, -0.2010844, 0, 0, 0, 1, 1,
-0.1994812, -1.440195, -3.544828, 0, 0, 0, 1, 1,
-0.1907995, -0.3070998, 0.8848041, 0, 0, 0, 1, 1,
-0.1901842, -0.1501174, -3.245466, 0, 0, 0, 1, 1,
-0.1888672, 0.3993962, -0.7258181, 0, 0, 0, 1, 1,
-0.1887661, -1.534597, -2.090361, 0, 0, 0, 1, 1,
-0.1871173, 0.9490864, -0.190182, 1, 1, 1, 1, 1,
-0.1778708, 0.9174578, 0.3630617, 1, 1, 1, 1, 1,
-0.1705971, 1.458112, -1.859369, 1, 1, 1, 1, 1,
-0.1702653, -0.02852215, -1.559366, 1, 1, 1, 1, 1,
-0.1683326, -0.1609179, -3.475551, 1, 1, 1, 1, 1,
-0.1660028, -0.6065063, -2.947006, 1, 1, 1, 1, 1,
-0.1636235, 2.30954, 1.238998, 1, 1, 1, 1, 1,
-0.1632224, -0.7996714, -4.075144, 1, 1, 1, 1, 1,
-0.1628156, 0.6000795, -0.4315244, 1, 1, 1, 1, 1,
-0.1618095, 0.002094137, -0.2016208, 1, 1, 1, 1, 1,
-0.1611288, -0.1269913, -2.058352, 1, 1, 1, 1, 1,
-0.1601123, 0.4970609, -1.388805, 1, 1, 1, 1, 1,
-0.1536122, 0.6852616, -0.02296477, 1, 1, 1, 1, 1,
-0.1534062, 0.8851678, -0.4753973, 1, 1, 1, 1, 1,
-0.1511379, 0.9449707, 0.9321815, 1, 1, 1, 1, 1,
-0.148143, 0.7196627, 0.6195838, 0, 0, 1, 1, 1,
-0.1447265, 0.5411637, 0.1065884, 1, 0, 0, 1, 1,
-0.1401713, 1.885051, -0.9868535, 1, 0, 0, 1, 1,
-0.1377308, 2.021871, 0.9528943, 1, 0, 0, 1, 1,
-0.1346402, 0.1518413, 0.06398632, 1, 0, 0, 1, 1,
-0.1298537, 1.778801, 0.4186053, 1, 0, 0, 1, 1,
-0.129295, -0.4516385, -2.290517, 0, 0, 0, 1, 1,
-0.1286103, -0.1115739, -2.159509, 0, 0, 0, 1, 1,
-0.1264918, -0.2669872, -2.279647, 0, 0, 0, 1, 1,
-0.1253932, -0.355935, -3.096935, 0, 0, 0, 1, 1,
-0.1231818, -0.7542638, -1.716743, 0, 0, 0, 1, 1,
-0.122169, -0.5705696, -4.27775, 0, 0, 0, 1, 1,
-0.1214767, 1.569711, -0.06467158, 0, 0, 0, 1, 1,
-0.1206204, 0.002399751, -2.940453, 1, 1, 1, 1, 1,
-0.1172395, -0.9848043, -3.203981, 1, 1, 1, 1, 1,
-0.116996, 0.7895067, -0.8207213, 1, 1, 1, 1, 1,
-0.1144506, 0.2027392, -2.570865, 1, 1, 1, 1, 1,
-0.1096119, -0.2087503, -4.241009, 1, 1, 1, 1, 1,
-0.109094, -0.09121349, -2.058096, 1, 1, 1, 1, 1,
-0.1060797, -1.286024, -2.111129, 1, 1, 1, 1, 1,
-0.1049073, 1.750214, 1.152889, 1, 1, 1, 1, 1,
-0.1044441, -0.03790683, 0.4339854, 1, 1, 1, 1, 1,
-0.1039316, 0.7476968, 0.2812732, 1, 1, 1, 1, 1,
-0.1030498, -0.4355213, -1.955252, 1, 1, 1, 1, 1,
-0.1029992, 2.144603, 1.525704, 1, 1, 1, 1, 1,
-0.09814331, -0.2535625, -2.259065, 1, 1, 1, 1, 1,
-0.09688761, 1.742194, -0.6398207, 1, 1, 1, 1, 1,
-0.09674054, -0.1847233, -1.886854, 1, 1, 1, 1, 1,
-0.09567622, -0.5087467, -2.262277, 0, 0, 1, 1, 1,
-0.09180675, 0.005024854, -0.8460204, 1, 0, 0, 1, 1,
-0.08941333, 0.7784098, -1.04309, 1, 0, 0, 1, 1,
-0.08649118, 0.565514, 0.8351179, 1, 0, 0, 1, 1,
-0.08357943, -0.6586525, -4.319109, 1, 0, 0, 1, 1,
-0.07997637, 1.318948, -0.9762742, 1, 0, 0, 1, 1,
-0.07750082, -0.7241222, -1.939191, 0, 0, 0, 1, 1,
-0.07545579, -0.4337009, -3.455926, 0, 0, 0, 1, 1,
-0.07512639, -0.9598197, -1.651297, 0, 0, 0, 1, 1,
-0.0682016, -0.894336, -3.032848, 0, 0, 0, 1, 1,
-0.06808306, -0.2018764, -2.155574, 0, 0, 0, 1, 1,
-0.06702836, -0.8885034, -2.844579, 0, 0, 0, 1, 1,
-0.06369391, -0.7439501, -2.895271, 0, 0, 0, 1, 1,
-0.06189125, -0.2894216, -2.026951, 1, 1, 1, 1, 1,
-0.06109518, -0.05615096, -2.574636, 1, 1, 1, 1, 1,
-0.05858508, 0.3798145, -0.4525662, 1, 1, 1, 1, 1,
-0.05733225, -0.2795394, -2.683166, 1, 1, 1, 1, 1,
-0.05702451, -0.6132436, -2.018028, 1, 1, 1, 1, 1,
-0.05266342, 0.04778916, -0.5407442, 1, 1, 1, 1, 1,
-0.04447746, -0.3341904, -2.417051, 1, 1, 1, 1, 1,
-0.04048792, 0.04851543, 0.7710807, 1, 1, 1, 1, 1,
-0.03906349, -0.7587638, -2.865553, 1, 1, 1, 1, 1,
-0.03715023, -0.1264907, -2.369669, 1, 1, 1, 1, 1,
-0.03596271, 1.099999, 1.764547, 1, 1, 1, 1, 1,
-0.0325245, 0.1667422, 0.03212763, 1, 1, 1, 1, 1,
-0.03225021, -0.2281287, -3.056922, 1, 1, 1, 1, 1,
-0.02946437, 0.7370446, -1.27693, 1, 1, 1, 1, 1,
-0.02405827, 0.4777472, -1.314945, 1, 1, 1, 1, 1,
-0.02367972, 1.612082, -0.4881594, 0, 0, 1, 1, 1,
-0.01946825, 0.1803997, -0.2146283, 1, 0, 0, 1, 1,
-0.01923455, -0.8668547, -4.731019, 1, 0, 0, 1, 1,
-0.01797644, -0.4853895, -2.308974, 1, 0, 0, 1, 1,
-0.01499308, 0.4710234, -1.269044, 1, 0, 0, 1, 1,
-0.01404116, 0.234226, -0.3884666, 1, 0, 0, 1, 1,
-0.01271913, 0.1404931, -0.3790598, 0, 0, 0, 1, 1,
-0.01070705, 0.2292009, 0.2264632, 0, 0, 0, 1, 1,
-0.01062641, -1.288028, -4.324126, 0, 0, 0, 1, 1,
-0.004636035, 0.05533558, -1.122432, 0, 0, 0, 1, 1,
0.003175648, -1.329414, 2.490316, 0, 0, 0, 1, 1,
0.004076936, 0.8526101, -1.402868, 0, 0, 0, 1, 1,
0.006135146, 1.992298, -0.5044572, 0, 0, 0, 1, 1,
0.0104309, 1.668148, 0.08173744, 1, 1, 1, 1, 1,
0.01904608, -0.40681, 3.082338, 1, 1, 1, 1, 1,
0.02166536, 0.8579916, 0.03181351, 1, 1, 1, 1, 1,
0.02584894, 0.1790978, 0.008529535, 1, 1, 1, 1, 1,
0.02774277, -0.6482991, 4.133959, 1, 1, 1, 1, 1,
0.02803238, 2.252814, 1.306494, 1, 1, 1, 1, 1,
0.03115005, 0.2462165, 1.271888, 1, 1, 1, 1, 1,
0.03676119, 0.9173588, 1.523717, 1, 1, 1, 1, 1,
0.03727419, 0.9301857, -0.9399679, 1, 1, 1, 1, 1,
0.03791157, 1.422297, -0.7555016, 1, 1, 1, 1, 1,
0.04601623, -0.6098018, 2.8031, 1, 1, 1, 1, 1,
0.04674465, -0.2637722, 1.710438, 1, 1, 1, 1, 1,
0.04769289, 0.2635964, -1.690838, 1, 1, 1, 1, 1,
0.04770484, -0.1836009, 2.705014, 1, 1, 1, 1, 1,
0.0505746, -1.093633, 2.510369, 1, 1, 1, 1, 1,
0.05219424, -0.728661, 2.6353, 0, 0, 1, 1, 1,
0.05493867, 2.159783, 1.318588, 1, 0, 0, 1, 1,
0.05913115, -1.67764, 4.07644, 1, 0, 0, 1, 1,
0.06170866, 1.162023, 0.5005986, 1, 0, 0, 1, 1,
0.06182861, 0.2549712, -0.4691186, 1, 0, 0, 1, 1,
0.06406607, 0.8292659, -0.7774763, 1, 0, 0, 1, 1,
0.06696631, 0.6856647, -0.1181074, 0, 0, 0, 1, 1,
0.06865111, 0.3167059, 0.5426091, 0, 0, 0, 1, 1,
0.07284591, 1.875149, -0.8284406, 0, 0, 0, 1, 1,
0.07417899, -0.1150982, 2.060227, 0, 0, 0, 1, 1,
0.07492825, -1.104787, 1.898907, 0, 0, 0, 1, 1,
0.07784967, -1.237557, 4.184733, 0, 0, 0, 1, 1,
0.07795645, 0.1854823, -0.02103314, 0, 0, 0, 1, 1,
0.07964353, -0.3165713, 3.379638, 1, 1, 1, 1, 1,
0.08446862, 0.835667, 0.5474144, 1, 1, 1, 1, 1,
0.08914045, 1.02143, -0.7069609, 1, 1, 1, 1, 1,
0.08947496, -1.326345, 5.065377, 1, 1, 1, 1, 1,
0.09181841, 1.304737, -1.62218, 1, 1, 1, 1, 1,
0.09577063, 0.4486056, 1.063997, 1, 1, 1, 1, 1,
0.09617104, -0.3462345, 3.232464, 1, 1, 1, 1, 1,
0.09703382, -0.05572005, 1.092876, 1, 1, 1, 1, 1,
0.1045411, -0.07166722, 4.189577, 1, 1, 1, 1, 1,
0.104961, -0.07971174, 3.578472, 1, 1, 1, 1, 1,
0.1161065, 1.419157, 0.3822944, 1, 1, 1, 1, 1,
0.1171135, -0.8726565, 3.542515, 1, 1, 1, 1, 1,
0.1180261, -0.9274528, 3.404783, 1, 1, 1, 1, 1,
0.1183179, -1.173761, 3.50231, 1, 1, 1, 1, 1,
0.1187856, 0.02231275, 0.8485435, 1, 1, 1, 1, 1,
0.119079, 0.4670231, 0.5389647, 0, 0, 1, 1, 1,
0.1206183, 0.3557597, 0.04594791, 1, 0, 0, 1, 1,
0.1216376, -0.2868715, 3.646044, 1, 0, 0, 1, 1,
0.1287287, 2.229823, 0.1498818, 1, 0, 0, 1, 1,
0.1288784, 2.500875, 0.2789056, 1, 0, 0, 1, 1,
0.1302182, 0.7562086, 0.8331093, 1, 0, 0, 1, 1,
0.1343196, -1.716481, 2.215557, 0, 0, 0, 1, 1,
0.1352859, -1.696141, 4.088681, 0, 0, 0, 1, 1,
0.1377134, 0.8063378, -1.086894, 0, 0, 0, 1, 1,
0.1460883, 0.549181, -0.486554, 0, 0, 0, 1, 1,
0.1497283, -0.00919861, 0.1535681, 0, 0, 0, 1, 1,
0.1524852, -0.977281, 4.528215, 0, 0, 0, 1, 1,
0.1531636, -2.468345, 4.05219, 0, 0, 0, 1, 1,
0.1542176, 1.167423, 1.127231, 1, 1, 1, 1, 1,
0.1550518, 0.2565701, 0.406565, 1, 1, 1, 1, 1,
0.1554302, -1.103472, 3.06155, 1, 1, 1, 1, 1,
0.158326, 0.3079491, -0.4887797, 1, 1, 1, 1, 1,
0.1606815, 1.448007, -0.614268, 1, 1, 1, 1, 1,
0.1630814, 0.6101676, 0.05051092, 1, 1, 1, 1, 1,
0.1636582, -1.069849, 2.694964, 1, 1, 1, 1, 1,
0.1639479, 0.4648773, -0.9274176, 1, 1, 1, 1, 1,
0.1694211, -0.2310311, 2.445554, 1, 1, 1, 1, 1,
0.1777899, -0.927738, 2.930523, 1, 1, 1, 1, 1,
0.1805182, 0.08996532, 2.159662, 1, 1, 1, 1, 1,
0.1838794, 1.034837, 0.1407421, 1, 1, 1, 1, 1,
0.1883818, 0.03527691, 0.697669, 1, 1, 1, 1, 1,
0.1925766, -1.012724, 2.544492, 1, 1, 1, 1, 1,
0.1929509, -1.080276, 3.054713, 1, 1, 1, 1, 1,
0.1932389, -0.2663648, 1.170575, 0, 0, 1, 1, 1,
0.1955101, -0.3237276, 2.196935, 1, 0, 0, 1, 1,
0.2015031, 0.4519066, 1.396639, 1, 0, 0, 1, 1,
0.2022783, 0.9054961, 0.09221913, 1, 0, 0, 1, 1,
0.2113948, 0.3794075, 0.3810522, 1, 0, 0, 1, 1,
0.2127549, 1.488177, 0.6305575, 1, 0, 0, 1, 1,
0.225699, 0.806977, 1.092391, 0, 0, 0, 1, 1,
0.2304232, 1.294219, 2.352588, 0, 0, 0, 1, 1,
0.2326126, 0.1067788, 1.261293, 0, 0, 0, 1, 1,
0.2330042, 0.0202148, 3.028405, 0, 0, 0, 1, 1,
0.2455628, -1.023041, 3.307371, 0, 0, 0, 1, 1,
0.245781, 0.351632, 0.6717306, 0, 0, 0, 1, 1,
0.2495766, 0.6034597, 1.559289, 0, 0, 0, 1, 1,
0.2505186, 0.3113446, 0.6274722, 1, 1, 1, 1, 1,
0.2605586, 0.482207, 1.561386, 1, 1, 1, 1, 1,
0.2659463, -0.7399896, 1.83854, 1, 1, 1, 1, 1,
0.2675484, -0.04998693, 3.061041, 1, 1, 1, 1, 1,
0.269533, -0.5999284, 2.63913, 1, 1, 1, 1, 1,
0.2696119, 1.102402, -0.05109399, 1, 1, 1, 1, 1,
0.2741294, -0.1760097, 1.366077, 1, 1, 1, 1, 1,
0.2748562, 0.8664905, -1.550828, 1, 1, 1, 1, 1,
0.279249, -1.058644, 4.122577, 1, 1, 1, 1, 1,
0.2798007, -1.20445, 1.878563, 1, 1, 1, 1, 1,
0.2828644, 1.770279, 0.1447362, 1, 1, 1, 1, 1,
0.283664, -3.060554, 3.883201, 1, 1, 1, 1, 1,
0.2837144, 0.1727076, 1.641291, 1, 1, 1, 1, 1,
0.2853542, 0.6179128, 0.2527006, 1, 1, 1, 1, 1,
0.2905895, 0.3233034, 0.1993439, 1, 1, 1, 1, 1,
0.2918117, -1.438404, 4.324262, 0, 0, 1, 1, 1,
0.2980869, 0.5043654, 0.05779348, 1, 0, 0, 1, 1,
0.3020935, -1.063709, 2.563656, 1, 0, 0, 1, 1,
0.3025764, 2.160657, 1.521567, 1, 0, 0, 1, 1,
0.302763, -1.685181, 2.791407, 1, 0, 0, 1, 1,
0.3079529, 0.9458349, 0.582339, 1, 0, 0, 1, 1,
0.3089611, 0.7546547, 2.568343, 0, 0, 0, 1, 1,
0.3099385, 0.2647384, 1.005559, 0, 0, 0, 1, 1,
0.3116914, 2.164145, 0.3818035, 0, 0, 0, 1, 1,
0.3122424, 0.407996, 0.7063463, 0, 0, 0, 1, 1,
0.3141567, -0.7168969, 3.701391, 0, 0, 0, 1, 1,
0.315393, -0.5576989, 2.462133, 0, 0, 0, 1, 1,
0.3164006, 0.8310258, 1.242546, 0, 0, 0, 1, 1,
0.3207069, -0.2065876, 2.303759, 1, 1, 1, 1, 1,
0.3218313, -0.4251242, 3.605851, 1, 1, 1, 1, 1,
0.3222824, -1.528828, 3.575234, 1, 1, 1, 1, 1,
0.3251705, -1.110494, 3.309414, 1, 1, 1, 1, 1,
0.3277166, -0.4215999, 0.7007132, 1, 1, 1, 1, 1,
0.327937, -0.07390468, 0.6603497, 1, 1, 1, 1, 1,
0.334628, 0.7630587, 0.09499437, 1, 1, 1, 1, 1,
0.335893, -0.3954699, 3.302737, 1, 1, 1, 1, 1,
0.3403424, -1.520785, 2.50239, 1, 1, 1, 1, 1,
0.3449301, -1.079829, 4.94154, 1, 1, 1, 1, 1,
0.3483902, 0.705847, -0.1957797, 1, 1, 1, 1, 1,
0.3538277, -0.2830792, 1.995338, 1, 1, 1, 1, 1,
0.3595185, -0.4242057, 2.15282, 1, 1, 1, 1, 1,
0.3601428, 0.8064783, -0.7723647, 1, 1, 1, 1, 1,
0.3704819, -0.4179569, 3.262927, 1, 1, 1, 1, 1,
0.3710073, 0.03480572, 1.856508, 0, 0, 1, 1, 1,
0.3810826, 0.1305174, 0.8517025, 1, 0, 0, 1, 1,
0.3811688, -1.270467, 2.365953, 1, 0, 0, 1, 1,
0.3815748, 0.5515908, -1.096573, 1, 0, 0, 1, 1,
0.3831924, -0.3481763, 4.898972, 1, 0, 0, 1, 1,
0.3845556, 1.319115, 2.037783, 1, 0, 0, 1, 1,
0.3857892, 1.113885, 0.4830047, 0, 0, 0, 1, 1,
0.38728, -0.3913204, 2.181885, 0, 0, 0, 1, 1,
0.4097329, -1.421821, 2.037015, 0, 0, 0, 1, 1,
0.4102228, -1.915622, 0.4672479, 0, 0, 0, 1, 1,
0.4132284, -1.507505, 4.80203, 0, 0, 0, 1, 1,
0.4163459, -2.025721, 2.021217, 0, 0, 0, 1, 1,
0.418188, -1.075093, 1.485981, 0, 0, 0, 1, 1,
0.4195092, 0.6970764, 1.2441, 1, 1, 1, 1, 1,
0.4215052, -0.8490053, 2.802695, 1, 1, 1, 1, 1,
0.4228546, -0.7015796, 3.101006, 1, 1, 1, 1, 1,
0.4246765, 0.3166607, 1.19355, 1, 1, 1, 1, 1,
0.4247508, -0.2686191, 3.353683, 1, 1, 1, 1, 1,
0.4268214, 0.884232, -0.900851, 1, 1, 1, 1, 1,
0.4291741, -1.899217, 3.837975, 1, 1, 1, 1, 1,
0.4296906, 1.480141, 1.939417, 1, 1, 1, 1, 1,
0.4302517, 0.4790829, 0.2934547, 1, 1, 1, 1, 1,
0.4362254, -0.1671614, 1.857877, 1, 1, 1, 1, 1,
0.4369978, -0.1552722, 2.510403, 1, 1, 1, 1, 1,
0.4398713, -1.15445, 3.423546, 1, 1, 1, 1, 1,
0.441815, -0.7181817, 2.722344, 1, 1, 1, 1, 1,
0.444667, 1.583654, -0.2448371, 1, 1, 1, 1, 1,
0.446126, -0.6988524, 2.708369, 1, 1, 1, 1, 1,
0.4467482, 0.1861385, 1.019639, 0, 0, 1, 1, 1,
0.4492436, -0.3221859, 1.758953, 1, 0, 0, 1, 1,
0.4501382, 0.0626881, 1.327851, 1, 0, 0, 1, 1,
0.451483, -0.5127466, 3.842105, 1, 0, 0, 1, 1,
0.4544738, -0.06177529, -0.4038325, 1, 0, 0, 1, 1,
0.4594362, 1.170436, -0.5131764, 1, 0, 0, 1, 1,
0.4600111, -0.1069544, 2.212572, 0, 0, 0, 1, 1,
0.4606872, -0.2530806, 0.3449581, 0, 0, 0, 1, 1,
0.4636471, -1.023901, 2.123128, 0, 0, 0, 1, 1,
0.4638116, 0.01026789, -0.1261103, 0, 0, 0, 1, 1,
0.4666076, -0.1671825, 1.58086, 0, 0, 0, 1, 1,
0.4674644, 0.6595686, 0.281463, 0, 0, 0, 1, 1,
0.468523, -1.540588, 1.766672, 0, 0, 0, 1, 1,
0.4733449, -1.31817, 5.581907, 1, 1, 1, 1, 1,
0.4737084, 0.1597919, 0.07222013, 1, 1, 1, 1, 1,
0.4750614, -1.487443, 3.185236, 1, 1, 1, 1, 1,
0.4760803, 0.03248443, 2.811716, 1, 1, 1, 1, 1,
0.4782878, 1.675477, 0.4626013, 1, 1, 1, 1, 1,
0.4830737, 0.3551973, -0.2686589, 1, 1, 1, 1, 1,
0.4836933, 0.4829848, 0.5715524, 1, 1, 1, 1, 1,
0.4906817, -1.809577, 2.492385, 1, 1, 1, 1, 1,
0.4927208, -0.2056745, 2.998835, 1, 1, 1, 1, 1,
0.4960473, -0.675809, 3.086701, 1, 1, 1, 1, 1,
0.503836, -0.3358175, 2.253288, 1, 1, 1, 1, 1,
0.5039398, 0.2873706, 0.7678827, 1, 1, 1, 1, 1,
0.5163427, -1.898284, 1.483414, 1, 1, 1, 1, 1,
0.5168403, 1.737581, -0.223222, 1, 1, 1, 1, 1,
0.5208265, 0.3245176, 2.15396, 1, 1, 1, 1, 1,
0.5250318, 0.4203513, 0.6801038, 0, 0, 1, 1, 1,
0.5252953, -0.7121834, 3.650001, 1, 0, 0, 1, 1,
0.5265841, 0.8389196, -1.598288, 1, 0, 0, 1, 1,
0.5273817, -0.7250027, 2.93727, 1, 0, 0, 1, 1,
0.5305572, 0.6103347, 0.6810674, 1, 0, 0, 1, 1,
0.533097, -0.3332413, 1.770169, 1, 0, 0, 1, 1,
0.5458722, -0.7874909, 2.660003, 0, 0, 0, 1, 1,
0.5458897, -0.8727139, 2.870831, 0, 0, 0, 1, 1,
0.5473633, 0.6861745, 1.398231, 0, 0, 0, 1, 1,
0.5492405, 0.09480832, 1.02784, 0, 0, 0, 1, 1,
0.5504019, 0.4278528, -0.7054129, 0, 0, 0, 1, 1,
0.551353, 0.6012452, 1.829625, 0, 0, 0, 1, 1,
0.5543371, 1.248237, 0.4123761, 0, 0, 0, 1, 1,
0.5585774, 0.005292577, 0.7054483, 1, 1, 1, 1, 1,
0.5624573, -0.8734182, 3.450101, 1, 1, 1, 1, 1,
0.5647139, -1.684622, 4.458705, 1, 1, 1, 1, 1,
0.5651679, -1.025352, 2.945137, 1, 1, 1, 1, 1,
0.5653195, -1.23461, 3.482619, 1, 1, 1, 1, 1,
0.5676926, 0.5278688, 1.021346, 1, 1, 1, 1, 1,
0.5696106, -0.08703379, 2.889609, 1, 1, 1, 1, 1,
0.5704671, -0.07929372, 2.34617, 1, 1, 1, 1, 1,
0.5783218, -0.1415668, 1.559799, 1, 1, 1, 1, 1,
0.5808183, -0.510419, 3.92267, 1, 1, 1, 1, 1,
0.583766, 0.7673708, 0.2312502, 1, 1, 1, 1, 1,
0.5855618, 0.1904232, 0.3388655, 1, 1, 1, 1, 1,
0.5857772, -0.1964146, 1.427156, 1, 1, 1, 1, 1,
0.5916218, 1.707505, 0.07329462, 1, 1, 1, 1, 1,
0.5917978, 1.199722, 0.1909016, 1, 1, 1, 1, 1,
0.5939921, -1.97951, 3.312016, 0, 0, 1, 1, 1,
0.597004, 0.625217, 0.5063794, 1, 0, 0, 1, 1,
0.5973051, -0.625241, 1.530151, 1, 0, 0, 1, 1,
0.5999755, -0.5750008, 3.827637, 1, 0, 0, 1, 1,
0.6018497, 1.511085, -0.2148827, 1, 0, 0, 1, 1,
0.604672, 0.363692, 1.625919, 1, 0, 0, 1, 1,
0.6062699, -0.005968618, 0.4609261, 0, 0, 0, 1, 1,
0.6069914, -1.80169, 3.29112, 0, 0, 0, 1, 1,
0.6180866, -1.313174, 3.628226, 0, 0, 0, 1, 1,
0.6218082, 0.6946502, 1.789175, 0, 0, 0, 1, 1,
0.6224851, 0.1008841, 1.247731, 0, 0, 0, 1, 1,
0.6308597, 0.8134692, -0.1003038, 0, 0, 0, 1, 1,
0.6309351, -0.506664, 2.177306, 0, 0, 0, 1, 1,
0.6318327, -0.4832469, 1.724573, 1, 1, 1, 1, 1,
0.6332011, 0.6499758, 2.961234, 1, 1, 1, 1, 1,
0.6333756, 1.640921, 0.2925839, 1, 1, 1, 1, 1,
0.6357712, 0.6501377, 1.151011, 1, 1, 1, 1, 1,
0.6384058, -0.06948839, 0.3935153, 1, 1, 1, 1, 1,
0.638437, 1.563401, 1.51467, 1, 1, 1, 1, 1,
0.6404779, -1.462491, 2.802629, 1, 1, 1, 1, 1,
0.6420954, 0.9235343, -0.05645346, 1, 1, 1, 1, 1,
0.6492775, 1.241968, -1.074729, 1, 1, 1, 1, 1,
0.6589492, -0.9208436, 1.839618, 1, 1, 1, 1, 1,
0.6598445, -1.613912, 3.409994, 1, 1, 1, 1, 1,
0.6602978, 2.623335, 0.4535067, 1, 1, 1, 1, 1,
0.6611264, -0.004805175, 4.05852, 1, 1, 1, 1, 1,
0.6613571, -0.3434345, 2.489371, 1, 1, 1, 1, 1,
0.6648616, 0.8569323, 0.6352049, 1, 1, 1, 1, 1,
0.6658894, -0.9258572, 2.785719, 0, 0, 1, 1, 1,
0.6660437, 0.8949788, 1.400268, 1, 0, 0, 1, 1,
0.6689348, -0.5170047, 2.287609, 1, 0, 0, 1, 1,
0.6700429, -0.8112847, 1.740342, 1, 0, 0, 1, 1,
0.6706055, 1.197798, 1.568273, 1, 0, 0, 1, 1,
0.6734393, -1.136904, 1.997794, 1, 0, 0, 1, 1,
0.6739284, 1.026528, 2.446467, 0, 0, 0, 1, 1,
0.6782608, 0.3642141, 2.359194, 0, 0, 0, 1, 1,
0.6782783, 0.463866, 1.479864, 0, 0, 0, 1, 1,
0.6799369, 0.1922886, 2.059603, 0, 0, 0, 1, 1,
0.6817231, -1.722983, 2.05593, 0, 0, 0, 1, 1,
0.6890844, -0.08533277, 3.535181, 0, 0, 0, 1, 1,
0.6907218, 0.734221, -1.185291, 0, 0, 0, 1, 1,
0.6912904, 0.7427133, -0.400414, 1, 1, 1, 1, 1,
0.6915045, 0.2436147, 1.066331, 1, 1, 1, 1, 1,
0.6935205, -0.9638731, 4.488512, 1, 1, 1, 1, 1,
0.6964521, -1.627187, 3.121009, 1, 1, 1, 1, 1,
0.6967152, -0.6668647, 1.523718, 1, 1, 1, 1, 1,
0.6987303, 0.5310745, 0.6282765, 1, 1, 1, 1, 1,
0.7018752, 0.02519924, 0.7028713, 1, 1, 1, 1, 1,
0.7024444, -0.6869825, 1.211241, 1, 1, 1, 1, 1,
0.7065784, 0.01245091, 1.051641, 1, 1, 1, 1, 1,
0.7093539, 1.072249, 2.15616, 1, 1, 1, 1, 1,
0.7164558, -0.3057834, 2.37311, 1, 1, 1, 1, 1,
0.7303275, 0.07222646, 2.280725, 1, 1, 1, 1, 1,
0.7325945, -1.455211, 2.38474, 1, 1, 1, 1, 1,
0.73493, -0.7592159, 1.416968, 1, 1, 1, 1, 1,
0.735344, -1.130516, 2.297652, 1, 1, 1, 1, 1,
0.7368305, -0.3223449, 2.370395, 0, 0, 1, 1, 1,
0.7404257, 0.1913207, -0.8308724, 1, 0, 0, 1, 1,
0.7483113, -0.2992007, 0.0311029, 1, 0, 0, 1, 1,
0.7550943, 3.150517, 0.6638274, 1, 0, 0, 1, 1,
0.758782, 0.1913509, 1.562374, 1, 0, 0, 1, 1,
0.7592577, 0.106128, 1.799442, 1, 0, 0, 1, 1,
0.7599094, 0.1401328, 2.422216, 0, 0, 0, 1, 1,
0.7601376, 0.8060392, 1.157315, 0, 0, 0, 1, 1,
0.7614526, -1.504794, 2.932383, 0, 0, 0, 1, 1,
0.7617161, -0.2561476, 1.460007, 0, 0, 0, 1, 1,
0.762122, 0.4457698, 1.199647, 0, 0, 0, 1, 1,
0.770436, -1.331658, 3.608915, 0, 0, 0, 1, 1,
0.7722104, 1.401733, -0.7639853, 0, 0, 0, 1, 1,
0.7727894, -1.36623, 3.382174, 1, 1, 1, 1, 1,
0.7756045, 0.6200029, 2.490482, 1, 1, 1, 1, 1,
0.7790456, -1.18028, 3.124393, 1, 1, 1, 1, 1,
0.7813715, -2.096352, 1.466159, 1, 1, 1, 1, 1,
0.7817602, 0.5769456, 2.02573, 1, 1, 1, 1, 1,
0.782191, 1.027153, 1.100081, 1, 1, 1, 1, 1,
0.7886726, 2.29862, 0.3480632, 1, 1, 1, 1, 1,
0.7913207, 0.2941822, 1.241273, 1, 1, 1, 1, 1,
0.7921618, 0.7493419, -0.222927, 1, 1, 1, 1, 1,
0.7926795, 1.203434, 0.3824998, 1, 1, 1, 1, 1,
0.7948194, -1.849587, 2.797289, 1, 1, 1, 1, 1,
0.7970468, -1.215171, 2.895209, 1, 1, 1, 1, 1,
0.8012965, -0.1136342, 2.660448, 1, 1, 1, 1, 1,
0.8077466, 1.435774, 0.7761188, 1, 1, 1, 1, 1,
0.8084493, -0.09356791, 0.9045837, 1, 1, 1, 1, 1,
0.812596, 2.580252, 1.783216, 0, 0, 1, 1, 1,
0.8141351, -0.05953725, 1.241707, 1, 0, 0, 1, 1,
0.8176504, -0.4735294, 2.722928, 1, 0, 0, 1, 1,
0.8201674, 1.316237, -0.2906645, 1, 0, 0, 1, 1,
0.8209623, 0.08504175, 0.6830594, 1, 0, 0, 1, 1,
0.8214307, 0.9880523, 1.015727, 1, 0, 0, 1, 1,
0.8235748, -0.6238408, 1.345759, 0, 0, 0, 1, 1,
0.8295214, -0.3379838, 3.109767, 0, 0, 0, 1, 1,
0.8303541, -0.7482413, 3.489692, 0, 0, 0, 1, 1,
0.84468, -0.3250955, 1.117939, 0, 0, 0, 1, 1,
0.844915, 1.028231, 1.959644, 0, 0, 0, 1, 1,
0.8451182, 0.3492351, -0.2450847, 0, 0, 0, 1, 1,
0.8564139, 0.6467344, 1.404605, 0, 0, 0, 1, 1,
0.863237, 0.3787599, 1.438634, 1, 1, 1, 1, 1,
0.864316, -0.7534621, 2.537743, 1, 1, 1, 1, 1,
0.8657107, 0.9394655, 1.554136, 1, 1, 1, 1, 1,
0.8682516, -0.6015226, 3.086577, 1, 1, 1, 1, 1,
0.8719485, -0.2499518, 2.671055, 1, 1, 1, 1, 1,
0.8746679, 0.263312, 0.6241913, 1, 1, 1, 1, 1,
0.8758131, -0.1132014, 1.564074, 1, 1, 1, 1, 1,
0.8799897, -0.8603323, 3.01813, 1, 1, 1, 1, 1,
0.8935766, 1.009742, 2.353252, 1, 1, 1, 1, 1,
0.8990233, -0.6033341, 1.821358, 1, 1, 1, 1, 1,
0.8992144, -0.7371543, 4.230467, 1, 1, 1, 1, 1,
0.9123618, -0.8432724, 3.625315, 1, 1, 1, 1, 1,
0.912373, -1.425256, 1.267798, 1, 1, 1, 1, 1,
0.9138269, 0.947279, 1.752638, 1, 1, 1, 1, 1,
0.935341, -1.122773, 2.921045, 1, 1, 1, 1, 1,
0.937268, -0.4108492, 1.816926, 0, 0, 1, 1, 1,
0.9472691, 1.435787, 0.7407961, 1, 0, 0, 1, 1,
0.947834, 0.5174348, 2.421413, 1, 0, 0, 1, 1,
0.9545133, 0.3330872, 1.447695, 1, 0, 0, 1, 1,
0.9567223, 0.4112939, 2.060715, 1, 0, 0, 1, 1,
0.9568667, -0.255362, 2.86413, 1, 0, 0, 1, 1,
0.9611537, -0.6829216, 3.103801, 0, 0, 0, 1, 1,
0.9629948, 0.1414813, 2.201791, 0, 0, 0, 1, 1,
0.9711803, -0.1253225, 0.4675158, 0, 0, 0, 1, 1,
0.9829593, -0.336638, 3.733761, 0, 0, 0, 1, 1,
0.9837664, 0.5083891, 1.684479, 0, 0, 0, 1, 1,
0.9844922, -0.11891, 1.092672, 0, 0, 0, 1, 1,
0.989319, -2.69664, 2.142876, 0, 0, 0, 1, 1,
0.9914719, 0.4994151, 0.8665901, 1, 1, 1, 1, 1,
0.9925902, -1.989357, 2.92672, 1, 1, 1, 1, 1,
0.9937983, 0.2253783, 1.464683, 1, 1, 1, 1, 1,
0.9939792, 0.6767335, 0.4450745, 1, 1, 1, 1, 1,
0.9964887, -0.01819053, 1.253418, 1, 1, 1, 1, 1,
1.002187, 0.5556001, 2.743501, 1, 1, 1, 1, 1,
1.00305, 0.5842615, -1.451077, 1, 1, 1, 1, 1,
1.003858, -1.64951, 2.95301, 1, 1, 1, 1, 1,
1.004232, 1.472556, 1.042969, 1, 1, 1, 1, 1,
1.004975, 0.2838821, -0.06558704, 1, 1, 1, 1, 1,
1.005996, 0.007059008, 4.732435, 1, 1, 1, 1, 1,
1.0078, 0.9256716, 0.2034412, 1, 1, 1, 1, 1,
1.013819, -0.5903533, 3.58214, 1, 1, 1, 1, 1,
1.014943, -1.217602, 2.392917, 1, 1, 1, 1, 1,
1.015908, 0.7393062, 2.24405, 1, 1, 1, 1, 1,
1.024468, -1.104276, 2.915162, 0, 0, 1, 1, 1,
1.051028, -1.147875, 4.304214, 1, 0, 0, 1, 1,
1.051111, 0.2552272, 0.9323834, 1, 0, 0, 1, 1,
1.053825, 1.161849, -1.127379, 1, 0, 0, 1, 1,
1.054985, -0.240167, 3.424814, 1, 0, 0, 1, 1,
1.057972, -1.605982, 2.405126, 1, 0, 0, 1, 1,
1.05804, -1.554223, 2.879083, 0, 0, 0, 1, 1,
1.058551, 0.2564043, 1.288155, 0, 0, 0, 1, 1,
1.073262, 0.4824919, 1.837928, 0, 0, 0, 1, 1,
1.074417, -2.055345, 2.243465, 0, 0, 0, 1, 1,
1.085106, -1.014508, 2.804355, 0, 0, 0, 1, 1,
1.090434, -0.01918367, 1.205788, 0, 0, 0, 1, 1,
1.09488, 0.08289596, 1.116928, 0, 0, 0, 1, 1,
1.120863, 0.6152276, -0.7718401, 1, 1, 1, 1, 1,
1.122165, -0.1513123, 2.702823, 1, 1, 1, 1, 1,
1.12532, -1.753271, 2.922129, 1, 1, 1, 1, 1,
1.134427, 0.9060795, 0.5943368, 1, 1, 1, 1, 1,
1.150605, -0.003288454, 1.570398, 1, 1, 1, 1, 1,
1.151682, -0.1193655, 2.286245, 1, 1, 1, 1, 1,
1.158515, -0.95055, 1.29179, 1, 1, 1, 1, 1,
1.162751, -0.3464898, 2.367417, 1, 1, 1, 1, 1,
1.16411, -0.7630478, 1.405718, 1, 1, 1, 1, 1,
1.171382, 0.2441373, 1.571364, 1, 1, 1, 1, 1,
1.175688, -0.6267853, -0.2864103, 1, 1, 1, 1, 1,
1.18024, -0.6756468, 2.057899, 1, 1, 1, 1, 1,
1.187077, 0.1304364, 2.450202, 1, 1, 1, 1, 1,
1.192654, 0.7884402, 1.273973, 1, 1, 1, 1, 1,
1.196688, -1.252092, 2.309336, 1, 1, 1, 1, 1,
1.19758, 0.5483221, 0.6618525, 0, 0, 1, 1, 1,
1.20309, 0.6045351, 2.310307, 1, 0, 0, 1, 1,
1.210046, 0.1108798, 1.764708, 1, 0, 0, 1, 1,
1.211404, 1.046434, 1.825943, 1, 0, 0, 1, 1,
1.225368, -1.649347, 3.47576, 1, 0, 0, 1, 1,
1.233983, 0.2582168, 2.14151, 1, 0, 0, 1, 1,
1.235759, -2.289342, 0.4908832, 0, 0, 0, 1, 1,
1.242736, -3.111582, 2.812679, 0, 0, 0, 1, 1,
1.248877, 0.7081205, 0.8296856, 0, 0, 0, 1, 1,
1.249775, -1.248438, 0.79806, 0, 0, 0, 1, 1,
1.252962, -0.1586078, 1.781225, 0, 0, 0, 1, 1,
1.252997, 1.944328, -0.07791651, 0, 0, 0, 1, 1,
1.253048, -0.8713142, 2.243579, 0, 0, 0, 1, 1,
1.258726, -0.1870774, 2.138528, 1, 1, 1, 1, 1,
1.271644, 0.8991842, 0.5486346, 1, 1, 1, 1, 1,
1.274908, -0.2050826, 0.8842428, 1, 1, 1, 1, 1,
1.288649, -0.4274581, 3.384559, 1, 1, 1, 1, 1,
1.297291, -0.4559592, 1.344002, 1, 1, 1, 1, 1,
1.303452, -0.2011449, 2.315424, 1, 1, 1, 1, 1,
1.31646, 0.1050594, 1.526082, 1, 1, 1, 1, 1,
1.318643, 0.4669141, 1.171122, 1, 1, 1, 1, 1,
1.322539, 0.4082414, 1.256291, 1, 1, 1, 1, 1,
1.326397, -0.7765483, 2.172739, 1, 1, 1, 1, 1,
1.328691, 1.440671, -2.404145, 1, 1, 1, 1, 1,
1.329463, -2.430102, 2.909957, 1, 1, 1, 1, 1,
1.339832, -0.3320341, 1.874799, 1, 1, 1, 1, 1,
1.344536, 1.039269, 1.875645, 1, 1, 1, 1, 1,
1.368823, 0.1440391, 1.919873, 1, 1, 1, 1, 1,
1.379102, 0.8652972, 0.7480897, 0, 0, 1, 1, 1,
1.392634, 0.6839823, -0.1427398, 1, 0, 0, 1, 1,
1.408878, -0.247828, 0.1325518, 1, 0, 0, 1, 1,
1.412282, -0.6868437, 0.6270251, 1, 0, 0, 1, 1,
1.412933, 0.3589855, 1.22747, 1, 0, 0, 1, 1,
1.418286, 0.5532181, 0.8625734, 1, 0, 0, 1, 1,
1.419859, 1.257694, 1.308464, 0, 0, 0, 1, 1,
1.43458, -0.5396165, 2.347651, 0, 0, 0, 1, 1,
1.435961, -1.17593, 0.8538053, 0, 0, 0, 1, 1,
1.440479, 0.1689295, 1.460893, 0, 0, 0, 1, 1,
1.441642, 1.301539, -0.2480435, 0, 0, 0, 1, 1,
1.445351, 0.7679582, -1.136287, 0, 0, 0, 1, 1,
1.445968, -1.214244, 4.411623, 0, 0, 0, 1, 1,
1.450338, 1.186121, -0.2537077, 1, 1, 1, 1, 1,
1.450784, -1.240591, 2.3295, 1, 1, 1, 1, 1,
1.458679, -0.6238153, 1.453856, 1, 1, 1, 1, 1,
1.469311, -1.126232, 1.903754, 1, 1, 1, 1, 1,
1.491947, -0.1867394, 0.9102081, 1, 1, 1, 1, 1,
1.539996, 0.1141776, 0.3181733, 1, 1, 1, 1, 1,
1.547343, -3.551684, 3.466658, 1, 1, 1, 1, 1,
1.553718, -0.7267094, 4.221202, 1, 1, 1, 1, 1,
1.561702, -2.230827, 2.088891, 1, 1, 1, 1, 1,
1.581621, -0.4229327, 2.126675, 1, 1, 1, 1, 1,
1.586917, 1.413697, 1.25358, 1, 1, 1, 1, 1,
1.591143, -0.4669256, 2.579802, 1, 1, 1, 1, 1,
1.594218, -0.14446, 2.272155, 1, 1, 1, 1, 1,
1.597307, -0.1187403, 1.475323, 1, 1, 1, 1, 1,
1.608563, -0.5892245, 2.387045, 1, 1, 1, 1, 1,
1.633284, -0.4006766, 1.150756, 0, 0, 1, 1, 1,
1.635024, -1.702832, 2.92971, 1, 0, 0, 1, 1,
1.651326, 0.7742801, 0.7123341, 1, 0, 0, 1, 1,
1.651975, -0.7829457, 2.569902, 1, 0, 0, 1, 1,
1.668281, 0.5331151, 3.353189, 1, 0, 0, 1, 1,
1.668994, 1.047149, 0.6944502, 1, 0, 0, 1, 1,
1.684987, -0.8095371, 2.637403, 0, 0, 0, 1, 1,
1.697838, 0.221709, 0.4157215, 0, 0, 0, 1, 1,
1.7088, -0.1699847, 1.640331, 0, 0, 0, 1, 1,
1.722329, 0.5605985, 1.892404, 0, 0, 0, 1, 1,
1.727665, 1.263108, -0.1583556, 0, 0, 0, 1, 1,
1.736452, -0.01809238, 0.04802803, 0, 0, 0, 1, 1,
1.737145, 0.6521761, 1.100298, 0, 0, 0, 1, 1,
1.768002, 0.9682561, 0.7755964, 1, 1, 1, 1, 1,
1.819602, 0.4655181, 2.249676, 1, 1, 1, 1, 1,
1.82816, 0.03138411, 0.9499154, 1, 1, 1, 1, 1,
1.833234, 0.5246164, 1.751218, 1, 1, 1, 1, 1,
1.842629, -0.8199471, 2.894367, 1, 1, 1, 1, 1,
1.84866, 0.9080936, 0.724977, 1, 1, 1, 1, 1,
1.88147, -0.2456722, 2.205412, 1, 1, 1, 1, 1,
1.88897, 1.300576, 0.2426791, 1, 1, 1, 1, 1,
1.889023, -0.3374031, 1.376482, 1, 1, 1, 1, 1,
1.892855, 0.08212689, 1.968245, 1, 1, 1, 1, 1,
1.894331, 0.2216466, 1.602731, 1, 1, 1, 1, 1,
1.94, -0.02076794, 2.451705, 1, 1, 1, 1, 1,
1.957567, -0.9721771, 1.460111, 1, 1, 1, 1, 1,
2.042918, 1.327113, 1.14764, 1, 1, 1, 1, 1,
2.102586, -1.057823, 1.636368, 1, 1, 1, 1, 1,
2.126606, -1.620029, 1.816184, 0, 0, 1, 1, 1,
2.191839, -0.5720134, 1.765704, 1, 0, 0, 1, 1,
2.219572, 0.09525252, 1.843858, 1, 0, 0, 1, 1,
2.2602, -0.5181684, 1.928784, 1, 0, 0, 1, 1,
2.269853, -1.533177, 2.505979, 1, 0, 0, 1, 1,
2.271574, -0.7519737, 3.470832, 1, 0, 0, 1, 1,
2.272782, 0.8548571, 1.273444, 0, 0, 0, 1, 1,
2.315263, -1.374604, 1.556591, 0, 0, 0, 1, 1,
2.379174, -0.3073367, -0.3592317, 0, 0, 0, 1, 1,
2.379879, -0.599359, 0.6563939, 0, 0, 0, 1, 1,
2.384561, -0.08815365, 1.511251, 0, 0, 0, 1, 1,
2.400366, -1.080405, 1.908762, 0, 0, 0, 1, 1,
2.436391, -0.1409024, 0.9459223, 0, 0, 0, 1, 1,
2.515583, -0.412321, 2.93438, 1, 1, 1, 1, 1,
2.550672, -0.7948051, 1.187785, 1, 1, 1, 1, 1,
2.619243, -0.1524632, 2.359825, 1, 1, 1, 1, 1,
2.690101, 1.105515, -1.328064, 1, 1, 1, 1, 1,
2.751453, -0.1879365, 1.577149, 1, 1, 1, 1, 1,
2.78696, -1.47586, 2.001265, 1, 1, 1, 1, 1,
2.910254, -0.01130692, 1.403619, 1, 1, 1, 1, 1
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
var radius = 9.659363;
var distance = 33.9281;
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
mvMatrix.translate( 0.3674041, 0.2005837, -0.2668672 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.9281);
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