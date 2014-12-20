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
-4.233179, 0.3388697, -1.687399, 1, 0, 0, 1,
-3.520651, -0.263065, 0.3277728, 1, 0.007843138, 0, 1,
-3.264539, 0.3816178, -2.646176, 1, 0.01176471, 0, 1,
-2.800539, 0.02452965, -2.146441, 1, 0.01960784, 0, 1,
-2.679272, -0.3473184, -4.164035, 1, 0.02352941, 0, 1,
-2.676027, -2.309724, -2.469193, 1, 0.03137255, 0, 1,
-2.396468, 1.227855, -0.7654532, 1, 0.03529412, 0, 1,
-2.310889, -0.9000165, -2.907984, 1, 0.04313726, 0, 1,
-2.30008, -0.7224135, -2.539739, 1, 0.04705882, 0, 1,
-2.268861, -1.080327, -0.6147909, 1, 0.05490196, 0, 1,
-2.191608, -1.391742, -2.274928, 1, 0.05882353, 0, 1,
-2.19107, 1.582591, -1.261645, 1, 0.06666667, 0, 1,
-2.178489, -0.4669294, -0.9921098, 1, 0.07058824, 0, 1,
-2.141235, 0.5995182, -1.44215, 1, 0.07843138, 0, 1,
-2.120439, -1.187003, -1.506425, 1, 0.08235294, 0, 1,
-2.110749, -1.181534, -0.8210992, 1, 0.09019608, 0, 1,
-2.09398, -2.282504, -1.62825, 1, 0.09411765, 0, 1,
-2.084257, 1.402493, 0.2571317, 1, 0.1019608, 0, 1,
-2.064521, -0.9076543, -2.203904, 1, 0.1098039, 0, 1,
-2.005523, 0.2859574, -2.247224, 1, 0.1137255, 0, 1,
-1.994814, -0.1700706, -1.566487, 1, 0.1215686, 0, 1,
-1.956962, 0.7559757, -1.555929, 1, 0.1254902, 0, 1,
-1.928216, 1.303934, -0.4150099, 1, 0.1333333, 0, 1,
-1.927559, 0.9478163, -2.862043, 1, 0.1372549, 0, 1,
-1.916489, 0.2919974, -2.298781, 1, 0.145098, 0, 1,
-1.912667, -0.08637553, -1.514675, 1, 0.1490196, 0, 1,
-1.905127, -0.6220182, -1.718646, 1, 0.1568628, 0, 1,
-1.879945, -0.0189924, -1.34912, 1, 0.1607843, 0, 1,
-1.873055, 1.215626, -1.645503, 1, 0.1686275, 0, 1,
-1.870353, 0.8357402, -1.133391, 1, 0.172549, 0, 1,
-1.86496, 0.4392862, -0.08756642, 1, 0.1803922, 0, 1,
-1.848186, -0.2793539, -2.516999, 1, 0.1843137, 0, 1,
-1.847719, -0.7792709, -2.374527, 1, 0.1921569, 0, 1,
-1.843148, -0.4135887, -1.563244, 1, 0.1960784, 0, 1,
-1.828578, -0.2303587, -2.824345, 1, 0.2039216, 0, 1,
-1.825126, -0.2414795, -1.472603, 1, 0.2117647, 0, 1,
-1.789888, 1.554761, -0.5195383, 1, 0.2156863, 0, 1,
-1.786094, -1.320262, -2.054711, 1, 0.2235294, 0, 1,
-1.76867, -0.768814, -1.649604, 1, 0.227451, 0, 1,
-1.747548, 0.7307241, -0.9427358, 1, 0.2352941, 0, 1,
-1.743356, 0.7955375, -0.2114455, 1, 0.2392157, 0, 1,
-1.736089, 1.395126, -2.078401, 1, 0.2470588, 0, 1,
-1.725391, -0.2754376, -2.998632, 1, 0.2509804, 0, 1,
-1.723711, -0.7320822, -1.118378, 1, 0.2588235, 0, 1,
-1.708031, 0.480611, -1.719558, 1, 0.2627451, 0, 1,
-1.70724, 1.041454, -2.325064, 1, 0.2705882, 0, 1,
-1.707199, 0.5293769, 0.568096, 1, 0.2745098, 0, 1,
-1.699069, 1.281979, -1.481364, 1, 0.282353, 0, 1,
-1.674834, 2.113112, 0.2739344, 1, 0.2862745, 0, 1,
-1.664876, 0.4545741, -1.897243, 1, 0.2941177, 0, 1,
-1.657906, -0.3422723, -0.9404221, 1, 0.3019608, 0, 1,
-1.649617, 0.9070403, -2.618208, 1, 0.3058824, 0, 1,
-1.642054, -2.551598, -4.841658, 1, 0.3137255, 0, 1,
-1.635252, 0.8241895, -0.5833811, 1, 0.3176471, 0, 1,
-1.629546, 0.09985144, -2.263319, 1, 0.3254902, 0, 1,
-1.626219, -1.451171, -1.815172, 1, 0.3294118, 0, 1,
-1.619761, 0.3712308, -1.068275, 1, 0.3372549, 0, 1,
-1.61731, 0.04269808, -1.025679, 1, 0.3411765, 0, 1,
-1.613878, -1.377887, -3.753474, 1, 0.3490196, 0, 1,
-1.593412, -0.1882975, -2.584813, 1, 0.3529412, 0, 1,
-1.577881, -0.5448182, -3.517192, 1, 0.3607843, 0, 1,
-1.577553, -0.180226, -3.154932, 1, 0.3647059, 0, 1,
-1.576075, 0.880039, -0.731833, 1, 0.372549, 0, 1,
-1.531315, 0.3595619, -0.0125714, 1, 0.3764706, 0, 1,
-1.523297, -1.647721, -3.446208, 1, 0.3843137, 0, 1,
-1.514347, -0.8155749, -2.6953, 1, 0.3882353, 0, 1,
-1.513826, 0.4296187, -2.097465, 1, 0.3960784, 0, 1,
-1.507414, 1.857134, -0.3742223, 1, 0.4039216, 0, 1,
-1.506253, -0.3380533, -2.54809, 1, 0.4078431, 0, 1,
-1.505401, -0.8789839, -3.004238, 1, 0.4156863, 0, 1,
-1.501937, -0.2432668, -0.3785651, 1, 0.4196078, 0, 1,
-1.495505, 0.129851, -1.630757, 1, 0.427451, 0, 1,
-1.492191, 0.7231002, 0.07426849, 1, 0.4313726, 0, 1,
-1.489502, 0.2240461, -1.329107, 1, 0.4392157, 0, 1,
-1.456975, -0.2654117, -2.409771, 1, 0.4431373, 0, 1,
-1.433299, -0.8283627, -0.9449362, 1, 0.4509804, 0, 1,
-1.427216, 0.4399131, -1.999858, 1, 0.454902, 0, 1,
-1.421469, -0.002358609, -3.572365, 1, 0.4627451, 0, 1,
-1.411939, -0.6556961, -4.167808, 1, 0.4666667, 0, 1,
-1.405495, 1.66156, 0.5288802, 1, 0.4745098, 0, 1,
-1.404536, 0.3705961, -1.036402, 1, 0.4784314, 0, 1,
-1.403764, 1.405493, -1.011342, 1, 0.4862745, 0, 1,
-1.402152, 0.9228097, -0.6826078, 1, 0.4901961, 0, 1,
-1.401923, -1.524614, -3.234472, 1, 0.4980392, 0, 1,
-1.396905, 1.537111, -2.030118, 1, 0.5058824, 0, 1,
-1.386783, -0.1751233, -2.887396, 1, 0.509804, 0, 1,
-1.386183, 1.634124, -1.413699, 1, 0.5176471, 0, 1,
-1.385998, 0.542179, -1.509954, 1, 0.5215687, 0, 1,
-1.384505, -0.2086897, -2.310292, 1, 0.5294118, 0, 1,
-1.380595, 3.075711, -0.4230155, 1, 0.5333334, 0, 1,
-1.376961, 1.992344, -0.4736977, 1, 0.5411765, 0, 1,
-1.373719, -2.699163, -1.848093, 1, 0.5450981, 0, 1,
-1.366112, 0.655466, -0.7637095, 1, 0.5529412, 0, 1,
-1.359985, -1.470865, -3.024368, 1, 0.5568628, 0, 1,
-1.357212, -0.2599367, -4.678928, 1, 0.5647059, 0, 1,
-1.357192, -0.1403739, -1.753282, 1, 0.5686275, 0, 1,
-1.353884, -1.748954, -3.131269, 1, 0.5764706, 0, 1,
-1.335462, -0.5444558, -1.322052, 1, 0.5803922, 0, 1,
-1.332286, -1.627645, -2.692732, 1, 0.5882353, 0, 1,
-1.317636, 0.04462678, -1.126383, 1, 0.5921569, 0, 1,
-1.31388, 0.3382868, 0.2256725, 1, 0.6, 0, 1,
-1.313576, -2.588035, -1.892516, 1, 0.6078432, 0, 1,
-1.304413, -1.171926, -1.449694, 1, 0.6117647, 0, 1,
-1.299096, -1.454362, -1.349383, 1, 0.6196079, 0, 1,
-1.255908, -1.140917, -2.909963, 1, 0.6235294, 0, 1,
-1.246895, -0.5358225, -2.262037, 1, 0.6313726, 0, 1,
-1.240916, -0.2230828, -1.673086, 1, 0.6352941, 0, 1,
-1.235905, 0.966864, 0.6622519, 1, 0.6431373, 0, 1,
-1.232163, -0.004623504, -1.362693, 1, 0.6470588, 0, 1,
-1.222974, 0.3705172, -2.164086, 1, 0.654902, 0, 1,
-1.221446, -0.6326189, -2.026268, 1, 0.6588235, 0, 1,
-1.212829, 0.495114, -1.545306, 1, 0.6666667, 0, 1,
-1.211785, -0.5792183, -0.5593324, 1, 0.6705883, 0, 1,
-1.205614, 1.945882, -0.7541106, 1, 0.6784314, 0, 1,
-1.201778, 0.552844, -0.4001125, 1, 0.682353, 0, 1,
-1.199077, 1.955288, -1.113358, 1, 0.6901961, 0, 1,
-1.185616, -0.2605368, -1.652373, 1, 0.6941177, 0, 1,
-1.183843, -2.416474, -0.7438302, 1, 0.7019608, 0, 1,
-1.182286, -1.964749, -3.502031, 1, 0.7098039, 0, 1,
-1.179033, 0.01898861, -0.9926257, 1, 0.7137255, 0, 1,
-1.169545, -0.4647458, -0.6396989, 1, 0.7215686, 0, 1,
-1.162907, 0.6755961, -0.6347478, 1, 0.7254902, 0, 1,
-1.161145, -0.2981452, -2.218552, 1, 0.7333333, 0, 1,
-1.158691, 0.727219, -0.9472071, 1, 0.7372549, 0, 1,
-1.156949, -1.872009, -4.132682, 1, 0.7450981, 0, 1,
-1.153615, 2.000951, -2.201754, 1, 0.7490196, 0, 1,
-1.146709, -0.5251422, -2.298038, 1, 0.7568628, 0, 1,
-1.146575, 0.188281, -1.623738, 1, 0.7607843, 0, 1,
-1.13969, -1.013917, -0.7481145, 1, 0.7686275, 0, 1,
-1.135403, 0.2439754, -1.737903, 1, 0.772549, 0, 1,
-1.131113, 1.113166, -2.782007, 1, 0.7803922, 0, 1,
-1.117693, -1.505469, -3.181968, 1, 0.7843137, 0, 1,
-1.115782, 0.6958361, -1.040942, 1, 0.7921569, 0, 1,
-1.114349, 0.5365943, -0.7182153, 1, 0.7960784, 0, 1,
-1.11381, 0.4291992, -0.5415536, 1, 0.8039216, 0, 1,
-1.110179, 0.6329194, -0.9381047, 1, 0.8117647, 0, 1,
-1.106331, -0.3860472, -0.6257198, 1, 0.8156863, 0, 1,
-1.09865, 1.514309, -2.072178, 1, 0.8235294, 0, 1,
-1.089222, -2.012498, -3.577366, 1, 0.827451, 0, 1,
-1.085678, 0.05261057, -1.335253, 1, 0.8352941, 0, 1,
-1.083689, 0.3522826, -0.7973652, 1, 0.8392157, 0, 1,
-1.081341, -2.758767, -1.01154, 1, 0.8470588, 0, 1,
-1.071935, -0.5936317, -3.389759, 1, 0.8509804, 0, 1,
-1.07055, 0.6935864, -1.102663, 1, 0.8588235, 0, 1,
-1.069467, 0.6609234, -0.582474, 1, 0.8627451, 0, 1,
-1.067488, 0.9272098, -1.36947, 1, 0.8705882, 0, 1,
-1.064278, 1.124367, -1.716228, 1, 0.8745098, 0, 1,
-1.052814, 0.2879773, -1.211159, 1, 0.8823529, 0, 1,
-1.047876, -1.833986, -3.566642, 1, 0.8862745, 0, 1,
-1.033854, -0.6369203, -1.691598, 1, 0.8941177, 0, 1,
-1.032935, 0.2673643, -2.637094, 1, 0.8980392, 0, 1,
-1.031458, -1.927285, -2.110643, 1, 0.9058824, 0, 1,
-1.02415, -0.6688196, -3.030864, 1, 0.9137255, 0, 1,
-1.00693, -0.1603493, -0.6667754, 1, 0.9176471, 0, 1,
-0.9937689, 1.297103, -0.639252, 1, 0.9254902, 0, 1,
-0.9919707, 1.05989, 0.002751543, 1, 0.9294118, 0, 1,
-0.9903752, 1.201503, -2.083832, 1, 0.9372549, 0, 1,
-0.9882796, -1.516176, -2.397694, 1, 0.9411765, 0, 1,
-0.9871315, 1.088059, -1.976521, 1, 0.9490196, 0, 1,
-0.9761053, 0.5844296, -0.8521374, 1, 0.9529412, 0, 1,
-0.9727516, -0.004240421, -3.332619, 1, 0.9607843, 0, 1,
-0.9679782, 0.1199793, -0.9150655, 1, 0.9647059, 0, 1,
-0.9665508, -3.184341, -3.199823, 1, 0.972549, 0, 1,
-0.9647232, -1.161588, -1.845864, 1, 0.9764706, 0, 1,
-0.9613446, 0.1150997, -1.149483, 1, 0.9843137, 0, 1,
-0.9603086, 0.2799734, 0.2554538, 1, 0.9882353, 0, 1,
-0.9539379, -0.08435883, -1.311484, 1, 0.9960784, 0, 1,
-0.949827, 1.124674, -0.868128, 0.9960784, 1, 0, 1,
-0.9317423, -0.4032591, -2.302792, 0.9921569, 1, 0, 1,
-0.9299899, -0.1918672, -3.711931, 0.9843137, 1, 0, 1,
-0.9283255, 0.2242403, -1.521423, 0.9803922, 1, 0, 1,
-0.928176, 0.128057, -1.760897, 0.972549, 1, 0, 1,
-0.9281061, 0.5826448, -1.528287, 0.9686275, 1, 0, 1,
-0.9265733, -0.9884893, -0.3811345, 0.9607843, 1, 0, 1,
-0.9210621, 1.020031, 0.5948941, 0.9568627, 1, 0, 1,
-0.9162838, 1.2226, -0.7733331, 0.9490196, 1, 0, 1,
-0.9105688, 1.581657, -1.079145, 0.945098, 1, 0, 1,
-0.9099895, 0.02528101, -1.821931, 0.9372549, 1, 0, 1,
-0.904884, -0.6855698, -1.423781, 0.9333333, 1, 0, 1,
-0.901951, -0.1938999, -1.8805, 0.9254902, 1, 0, 1,
-0.8980255, -0.9142987, -1.481158, 0.9215686, 1, 0, 1,
-0.890214, -0.303768, -2.585501, 0.9137255, 1, 0, 1,
-0.8861699, -0.4333839, -1.861115, 0.9098039, 1, 0, 1,
-0.8861291, -0.6232692, -3.976809, 0.9019608, 1, 0, 1,
-0.882172, 1.297669, -0.5181924, 0.8941177, 1, 0, 1,
-0.8692857, -0.4478287, -2.675959, 0.8901961, 1, 0, 1,
-0.8653123, 1.608271, -0.8361989, 0.8823529, 1, 0, 1,
-0.8609076, -0.6374577, -2.121264, 0.8784314, 1, 0, 1,
-0.8569356, -1.871835, -4.684904, 0.8705882, 1, 0, 1,
-0.8455676, 1.647476, -0.5946058, 0.8666667, 1, 0, 1,
-0.8433661, 1.418672, -0.4996702, 0.8588235, 1, 0, 1,
-0.8428773, 0.4895684, -0.1511892, 0.854902, 1, 0, 1,
-0.8413473, 0.4004632, -0.8642451, 0.8470588, 1, 0, 1,
-0.8386151, -0.2152778, -2.263019, 0.8431373, 1, 0, 1,
-0.8354817, -0.5109345, -3.156637, 0.8352941, 1, 0, 1,
-0.8349894, -0.0264828, -2.956859, 0.8313726, 1, 0, 1,
-0.8344588, 0.2636408, -0.8759406, 0.8235294, 1, 0, 1,
-0.8330555, 2.197284, -1.624621, 0.8196079, 1, 0, 1,
-0.8236769, -1.263186, -3.122641, 0.8117647, 1, 0, 1,
-0.8211753, -0.06186896, -0.3658632, 0.8078431, 1, 0, 1,
-0.8199782, 1.162045, -0.5900683, 0.8, 1, 0, 1,
-0.8158336, -0.3868045, -1.367667, 0.7921569, 1, 0, 1,
-0.8118305, -0.6870629, -2.804953, 0.7882353, 1, 0, 1,
-0.8110122, 1.990684, -2.450887, 0.7803922, 1, 0, 1,
-0.8093168, -1.288985, -2.716348, 0.7764706, 1, 0, 1,
-0.8071363, 0.2694769, -1.166504, 0.7686275, 1, 0, 1,
-0.8042782, 0.1340342, -0.5453143, 0.7647059, 1, 0, 1,
-0.7983826, 1.512275, -0.6090822, 0.7568628, 1, 0, 1,
-0.795077, -0.4701906, -1.912141, 0.7529412, 1, 0, 1,
-0.7948098, -1.813255, -2.608575, 0.7450981, 1, 0, 1,
-0.7757089, -0.2751386, -2.999229, 0.7411765, 1, 0, 1,
-0.7672859, -0.3846963, -1.820056, 0.7333333, 1, 0, 1,
-0.7575429, 0.1131011, -3.158171, 0.7294118, 1, 0, 1,
-0.7428864, -2.054523, -4.894127, 0.7215686, 1, 0, 1,
-0.7425971, -2.011791, -2.628313, 0.7176471, 1, 0, 1,
-0.7377809, -1.972772, -2.628086, 0.7098039, 1, 0, 1,
-0.7366626, -0.3838474, -1.090351, 0.7058824, 1, 0, 1,
-0.7295911, -0.966463, -1.087048, 0.6980392, 1, 0, 1,
-0.7265077, -0.922313, -1.302732, 0.6901961, 1, 0, 1,
-0.7239503, -0.02367548, -2.574008, 0.6862745, 1, 0, 1,
-0.7219829, -0.490252, -2.907811, 0.6784314, 1, 0, 1,
-0.7007124, -0.769366, -1.175927, 0.6745098, 1, 0, 1,
-0.6972786, -1.499766, -3.08381, 0.6666667, 1, 0, 1,
-0.6935788, 0.2380528, -0.08922125, 0.6627451, 1, 0, 1,
-0.6935542, 0.8794752, -0.4057006, 0.654902, 1, 0, 1,
-0.6912794, -1.427751, -3.6867, 0.6509804, 1, 0, 1,
-0.6906147, 0.2970507, -2.075898, 0.6431373, 1, 0, 1,
-0.6881867, -0.8236852, -3.666227, 0.6392157, 1, 0, 1,
-0.687944, 1.095771, 0.8333153, 0.6313726, 1, 0, 1,
-0.6820205, 0.4461432, -1.346568, 0.627451, 1, 0, 1,
-0.6818163, 0.05416844, -1.7118, 0.6196079, 1, 0, 1,
-0.6807078, -0.8945567, -2.654872, 0.6156863, 1, 0, 1,
-0.6766881, -0.1576377, -3.381678, 0.6078432, 1, 0, 1,
-0.67145, 2.516051, 0.5245541, 0.6039216, 1, 0, 1,
-0.6672428, -0.2156487, -2.934993, 0.5960785, 1, 0, 1,
-0.6665828, 1.020791, -0.7472645, 0.5882353, 1, 0, 1,
-0.665503, -0.4076197, -1.718439, 0.5843138, 1, 0, 1,
-0.6596454, 0.5885866, 0.2268553, 0.5764706, 1, 0, 1,
-0.659048, -0.36877, -1.269457, 0.572549, 1, 0, 1,
-0.6573668, -0.3143866, -2.22825, 0.5647059, 1, 0, 1,
-0.6561844, 0.8668656, -0.4608925, 0.5607843, 1, 0, 1,
-0.6556621, -1.414943, -3.206563, 0.5529412, 1, 0, 1,
-0.6548128, 0.498049, -0.4380105, 0.5490196, 1, 0, 1,
-0.6539807, 2.130244, 0.2693467, 0.5411765, 1, 0, 1,
-0.6533058, 0.2575562, -2.919363, 0.5372549, 1, 0, 1,
-0.6503178, 2.210156, -1.023562, 0.5294118, 1, 0, 1,
-0.6492344, 0.6440297, -1.352443, 0.5254902, 1, 0, 1,
-0.6486222, 0.0416675, -1.604077, 0.5176471, 1, 0, 1,
-0.6468325, 1.099656, 0.5474226, 0.5137255, 1, 0, 1,
-0.644314, -0.7613773, -1.932126, 0.5058824, 1, 0, 1,
-0.6441641, 0.2785039, -2.399255, 0.5019608, 1, 0, 1,
-0.63963, 2.311797, 1.197201, 0.4941176, 1, 0, 1,
-0.6380567, 2.44251, 0.7685062, 0.4862745, 1, 0, 1,
-0.6371307, 1.113137, -2.209951, 0.4823529, 1, 0, 1,
-0.6363866, 0.1922798, 0.1554151, 0.4745098, 1, 0, 1,
-0.631215, -0.07682483, -1.579206, 0.4705882, 1, 0, 1,
-0.630248, 0.5163603, -1.28142, 0.4627451, 1, 0, 1,
-0.6290524, -0.04754468, -2.100061, 0.4588235, 1, 0, 1,
-0.6287655, 0.8192965, -1.626887, 0.4509804, 1, 0, 1,
-0.6276225, 0.731421, 0.7968531, 0.4470588, 1, 0, 1,
-0.6263403, -0.20749, -3.295652, 0.4392157, 1, 0, 1,
-0.6249506, -1.396109, -2.395221, 0.4352941, 1, 0, 1,
-0.6237827, 0.03062343, -0.3777456, 0.427451, 1, 0, 1,
-0.6202998, 1.200748, -1.09822, 0.4235294, 1, 0, 1,
-0.6202039, 9.603477e-05, -2.401851, 0.4156863, 1, 0, 1,
-0.6185324, -1.255393, -2.185755, 0.4117647, 1, 0, 1,
-0.6158658, 0.7798384, -1.028899, 0.4039216, 1, 0, 1,
-0.6128042, -0.1439618, -2.217521, 0.3960784, 1, 0, 1,
-0.6125957, -0.4958946, -2.93577, 0.3921569, 1, 0, 1,
-0.6060397, 1.914063, -2.269633, 0.3843137, 1, 0, 1,
-0.6046513, -0.2020521, -1.042926, 0.3803922, 1, 0, 1,
-0.6046345, -2.312807, -3.279189, 0.372549, 1, 0, 1,
-0.6045757, -0.04071729, -2.658319, 0.3686275, 1, 0, 1,
-0.5971981, -0.1015432, -2.812639, 0.3607843, 1, 0, 1,
-0.5971583, -0.2175272, -2.467759, 0.3568628, 1, 0, 1,
-0.5903756, -0.4935623, -2.726912, 0.3490196, 1, 0, 1,
-0.5886571, 0.4772389, -2.814949, 0.345098, 1, 0, 1,
-0.5854063, 1.118743, -0.3776157, 0.3372549, 1, 0, 1,
-0.5851781, -1.997561, -2.164229, 0.3333333, 1, 0, 1,
-0.5825577, -1.244499, -1.777703, 0.3254902, 1, 0, 1,
-0.5785625, -1.626189, -4.249235, 0.3215686, 1, 0, 1,
-0.577154, -2.554432, -2.122591, 0.3137255, 1, 0, 1,
-0.5641499, 0.3946827, -1.406627, 0.3098039, 1, 0, 1,
-0.5631651, 0.1766182, -0.5426131, 0.3019608, 1, 0, 1,
-0.5626416, -1.099178, -3.70701, 0.2941177, 1, 0, 1,
-0.5604395, -1.066896, -2.962054, 0.2901961, 1, 0, 1,
-0.5462682, -0.6443059, -2.225641, 0.282353, 1, 0, 1,
-0.5397037, -1.180189, -0.6369341, 0.2784314, 1, 0, 1,
-0.5388417, -1.611606, -1.792184, 0.2705882, 1, 0, 1,
-0.5373766, 0.5439842, -0.1928789, 0.2666667, 1, 0, 1,
-0.5369987, 0.460857, -0.02180873, 0.2588235, 1, 0, 1,
-0.5347824, 1.418167, -1.218283, 0.254902, 1, 0, 1,
-0.5291853, 1.53827, -0.6556299, 0.2470588, 1, 0, 1,
-0.5281518, 0.2876299, -0.8580089, 0.2431373, 1, 0, 1,
-0.5281023, -1.237561, -1.165692, 0.2352941, 1, 0, 1,
-0.5248823, -1.328495, -2.89417, 0.2313726, 1, 0, 1,
-0.52459, -2.112576, -4.744432, 0.2235294, 1, 0, 1,
-0.5213498, -0.7976728, -2.33317, 0.2196078, 1, 0, 1,
-0.519522, -0.3795484, -2.158347, 0.2117647, 1, 0, 1,
-0.5160279, -1.591355, -2.187553, 0.2078431, 1, 0, 1,
-0.5150698, -0.3554625, -1.901101, 0.2, 1, 0, 1,
-0.5114199, -1.402686, -1.50444, 0.1921569, 1, 0, 1,
-0.5078502, 0.0375683, -0.07825647, 0.1882353, 1, 0, 1,
-0.505697, -0.4388065, -2.027133, 0.1803922, 1, 0, 1,
-0.5051377, -0.1845583, -1.010279, 0.1764706, 1, 0, 1,
-0.5044073, -1.445034, -1.985281, 0.1686275, 1, 0, 1,
-0.5014078, 0.1517565, -2.290298, 0.1647059, 1, 0, 1,
-0.5012404, -0.6849722, -2.851797, 0.1568628, 1, 0, 1,
-0.500356, 0.03908151, -2.201654, 0.1529412, 1, 0, 1,
-0.4999948, 0.9353488, -0.04525637, 0.145098, 1, 0, 1,
-0.4970463, 0.414714, 0.5300878, 0.1411765, 1, 0, 1,
-0.4923898, -0.03354793, -2.09901, 0.1333333, 1, 0, 1,
-0.4915526, -0.001397275, -1.644737, 0.1294118, 1, 0, 1,
-0.4893863, 1.161094, 1.194332, 0.1215686, 1, 0, 1,
-0.4888215, -1.551536, -3.385968, 0.1176471, 1, 0, 1,
-0.4818481, -0.1777948, -2.612324, 0.1098039, 1, 0, 1,
-0.4809719, 0.5371277, -1.756322, 0.1058824, 1, 0, 1,
-0.4790316, 1.228421, -1.197947, 0.09803922, 1, 0, 1,
-0.4738315, -1.164838, -2.729145, 0.09019608, 1, 0, 1,
-0.4706069, 2.775011, -0.2136985, 0.08627451, 1, 0, 1,
-0.4685046, 0.06155301, -2.147147, 0.07843138, 1, 0, 1,
-0.4682065, -1.600843, -3.712635, 0.07450981, 1, 0, 1,
-0.4675916, 1.456284, -1.105613, 0.06666667, 1, 0, 1,
-0.46404, -1.778955, -2.693189, 0.0627451, 1, 0, 1,
-0.4638587, 0.6381887, -1.352542, 0.05490196, 1, 0, 1,
-0.4558068, 2.797949, -0.3503153, 0.05098039, 1, 0, 1,
-0.4540227, -0.5435112, -1.759956, 0.04313726, 1, 0, 1,
-0.4539075, -0.4624186, -2.426553, 0.03921569, 1, 0, 1,
-0.4471335, -1.136639, -1.80895, 0.03137255, 1, 0, 1,
-0.4450464, -0.3474239, -3.900084, 0.02745098, 1, 0, 1,
-0.4438148, -0.8459108, -2.548018, 0.01960784, 1, 0, 1,
-0.4419637, -0.8345235, -1.876286, 0.01568628, 1, 0, 1,
-0.4414712, 0.109296, -1.084951, 0.007843138, 1, 0, 1,
-0.4375052, 1.511964, -1.048393, 0.003921569, 1, 0, 1,
-0.4346914, 0.3258143, -1.764743, 0, 1, 0.003921569, 1,
-0.4328466, -0.2925552, -1.914606, 0, 1, 0.01176471, 1,
-0.4326929, 0.486193, -0.416496, 0, 1, 0.01568628, 1,
-0.432446, 2.443848, 0.08212283, 0, 1, 0.02352941, 1,
-0.4320417, 1.978002, 0.1999849, 0, 1, 0.02745098, 1,
-0.4308334, -0.6653106, -2.127535, 0, 1, 0.03529412, 1,
-0.4301449, -1.302753, -2.735883, 0, 1, 0.03921569, 1,
-0.4167645, -0.460855, -0.9223536, 0, 1, 0.04705882, 1,
-0.4138676, 0.09381235, -1.350806, 0, 1, 0.05098039, 1,
-0.410948, -0.6486854, -1.945437, 0, 1, 0.05882353, 1,
-0.4076926, 0.07367098, -0.8260345, 0, 1, 0.0627451, 1,
-0.4063909, 1.347384, 0.2566695, 0, 1, 0.07058824, 1,
-0.4027186, -0.2196708, -1.034049, 0, 1, 0.07450981, 1,
-0.3958549, -0.3488205, -4.443089, 0, 1, 0.08235294, 1,
-0.394584, -0.005612856, -0.7690705, 0, 1, 0.08627451, 1,
-0.3943425, 0.2368692, 0.9351878, 0, 1, 0.09411765, 1,
-0.3871384, 0.5612308, 0.04896762, 0, 1, 0.1019608, 1,
-0.3840378, -0.7925871, -2.630211, 0, 1, 0.1058824, 1,
-0.3830115, -2.517751, -3.254204, 0, 1, 0.1137255, 1,
-0.3811722, -0.3024289, -1.460119, 0, 1, 0.1176471, 1,
-0.3806466, 1.803322, 0.08037822, 0, 1, 0.1254902, 1,
-0.3788812, 1.758371, -0.2321227, 0, 1, 0.1294118, 1,
-0.3782995, -0.004369225, -1.069507, 0, 1, 0.1372549, 1,
-0.3707907, 0.06063908, -1.899045, 0, 1, 0.1411765, 1,
-0.370546, 1.414395, -0.7746167, 0, 1, 0.1490196, 1,
-0.3693405, -0.1678406, -3.129341, 0, 1, 0.1529412, 1,
-0.3653927, -1.810525, -3.768188, 0, 1, 0.1607843, 1,
-0.3645421, 1.208869, -0.5426098, 0, 1, 0.1647059, 1,
-0.3591671, -0.8549973, -4.1703, 0, 1, 0.172549, 1,
-0.3525688, -0.1461171, -2.168599, 0, 1, 0.1764706, 1,
-0.3521334, -0.4257351, -1.294595, 0, 1, 0.1843137, 1,
-0.3513666, 0.4900363, -0.9854103, 0, 1, 0.1882353, 1,
-0.3499754, 1.185381, 0.2731739, 0, 1, 0.1960784, 1,
-0.3497501, 0.9409631, 0.7631022, 0, 1, 0.2039216, 1,
-0.3483638, 0.003066821, -2.964849, 0, 1, 0.2078431, 1,
-0.3480829, 1.175808, -0.3573965, 0, 1, 0.2156863, 1,
-0.3427149, -1.534146, -3.359027, 0, 1, 0.2196078, 1,
-0.3394952, 0.1452636, -1.266185, 0, 1, 0.227451, 1,
-0.3393195, 1.656584, 0.2498078, 0, 1, 0.2313726, 1,
-0.3373471, -0.1573435, -0.1939652, 0, 1, 0.2392157, 1,
-0.3369666, 0.597914, 0.01084352, 0, 1, 0.2431373, 1,
-0.3368561, -0.01772608, -2.873442, 0, 1, 0.2509804, 1,
-0.3343162, 0.7988174, 0.6442428, 0, 1, 0.254902, 1,
-0.3313563, 1.52426, -0.7733795, 0, 1, 0.2627451, 1,
-0.3296597, 0.1278362, -2.075633, 0, 1, 0.2666667, 1,
-0.3295629, 0.5512308, 0.06675944, 0, 1, 0.2745098, 1,
-0.3292493, 0.3905885, -1.459105, 0, 1, 0.2784314, 1,
-0.3255399, 1.691734, 0.4216689, 0, 1, 0.2862745, 1,
-0.3248618, 0.6065492, -0.01302614, 0, 1, 0.2901961, 1,
-0.3221811, -0.7046444, -3.319115, 0, 1, 0.2980392, 1,
-0.3150986, 0.6994745, 0.1267025, 0, 1, 0.3058824, 1,
-0.3146791, -0.155717, -2.664632, 0, 1, 0.3098039, 1,
-0.3128749, -0.6799583, -2.890415, 0, 1, 0.3176471, 1,
-0.3112294, -0.5226682, -2.258874, 0, 1, 0.3215686, 1,
-0.2989429, 0.3614771, -2.96068, 0, 1, 0.3294118, 1,
-0.2960032, 0.5835707, -1.438882, 0, 1, 0.3333333, 1,
-0.2894274, -0.6948229, -1.999871, 0, 1, 0.3411765, 1,
-0.2869325, 0.6521991, -0.3061727, 0, 1, 0.345098, 1,
-0.2827181, -0.3187361, -2.464484, 0, 1, 0.3529412, 1,
-0.2826765, -0.7199237, -2.375899, 0, 1, 0.3568628, 1,
-0.2807493, -0.6537092, -3.811965, 0, 1, 0.3647059, 1,
-0.2781631, 0.4916465, -0.2138016, 0, 1, 0.3686275, 1,
-0.2754295, -0.4122802, -3.49865, 0, 1, 0.3764706, 1,
-0.2625699, 0.1914315, -2.024429, 0, 1, 0.3803922, 1,
-0.2615586, -0.4373078, -2.909044, 0, 1, 0.3882353, 1,
-0.2608492, -1.478229, -4.969937, 0, 1, 0.3921569, 1,
-0.259774, -0.9546775, -1.149497, 0, 1, 0.4, 1,
-0.2597171, -0.1293656, -3.231701, 0, 1, 0.4078431, 1,
-0.2524901, -1.351254, -2.673203, 0, 1, 0.4117647, 1,
-0.2521713, -0.2135314, -3.700588, 0, 1, 0.4196078, 1,
-0.2515743, -0.6342894, -3.350794, 0, 1, 0.4235294, 1,
-0.2500223, -1.594419, -3.574374, 0, 1, 0.4313726, 1,
-0.2428908, -0.8853091, -2.463248, 0, 1, 0.4352941, 1,
-0.2396508, -0.8260072, -2.063513, 0, 1, 0.4431373, 1,
-0.2387291, -1.2072, -2.194658, 0, 1, 0.4470588, 1,
-0.2342473, 0.3019612, -1.264645, 0, 1, 0.454902, 1,
-0.2340557, 0.1122507, -0.8246266, 0, 1, 0.4588235, 1,
-0.2326809, 2.505331, -0.564508, 0, 1, 0.4666667, 1,
-0.2319968, 0.9571424, 0.9870442, 0, 1, 0.4705882, 1,
-0.2288301, 0.2632865, -0.7419589, 0, 1, 0.4784314, 1,
-0.2265668, -1.22751, -2.556732, 0, 1, 0.4823529, 1,
-0.2256006, 0.5335021, -0.3668877, 0, 1, 0.4901961, 1,
-0.2223304, -0.9420865, -3.10703, 0, 1, 0.4941176, 1,
-0.2168646, -1.371738, -3.998928, 0, 1, 0.5019608, 1,
-0.2143368, -1.923934, -4.320178, 0, 1, 0.509804, 1,
-0.2142925, 2.527028, 1.056658, 0, 1, 0.5137255, 1,
-0.2113667, 0.6223189, 0.5502735, 0, 1, 0.5215687, 1,
-0.208525, 0.3418517, -1.196616, 0, 1, 0.5254902, 1,
-0.2070059, 0.4473843, 0.8680692, 0, 1, 0.5333334, 1,
-0.2053912, -0.3046811, -2.801203, 0, 1, 0.5372549, 1,
-0.2045653, 1.143775, -1.224594, 0, 1, 0.5450981, 1,
-0.2028319, 0.1974415, -0.6762919, 0, 1, 0.5490196, 1,
-0.2023283, -1.296603, -3.179259, 0, 1, 0.5568628, 1,
-0.2021739, -1.862984, -2.361632, 0, 1, 0.5607843, 1,
-0.2018858, -0.3799262, -4.044462, 0, 1, 0.5686275, 1,
-0.1999787, -2.42423, -2.90503, 0, 1, 0.572549, 1,
-0.1993288, -0.01713847, -0.4306266, 0, 1, 0.5803922, 1,
-0.195849, -0.9383359, -3.364189, 0, 1, 0.5843138, 1,
-0.1918807, -0.3346038, -1.63615, 0, 1, 0.5921569, 1,
-0.1892311, -0.3124873, -2.804681, 0, 1, 0.5960785, 1,
-0.1883394, 1.29416, -2.239669, 0, 1, 0.6039216, 1,
-0.1882117, -0.5827288, -3.190165, 0, 1, 0.6117647, 1,
-0.1853189, -0.7587149, -3.875582, 0, 1, 0.6156863, 1,
-0.1821028, -0.2940616, -0.9943103, 0, 1, 0.6235294, 1,
-0.1752596, -1.263867, -3.232292, 0, 1, 0.627451, 1,
-0.1741661, 1.490226, 0.7556727, 0, 1, 0.6352941, 1,
-0.1740869, 0.9608421, 1.260409, 0, 1, 0.6392157, 1,
-0.1705911, -1.319841, -2.892867, 0, 1, 0.6470588, 1,
-0.1693453, -1.335577, -4.035798, 0, 1, 0.6509804, 1,
-0.1692162, 0.04790477, -2.739585, 0, 1, 0.6588235, 1,
-0.1683669, 0.2394761, -0.04347729, 0, 1, 0.6627451, 1,
-0.166382, -0.4951015, -2.887319, 0, 1, 0.6705883, 1,
-0.1656455, -2.65385, -4.147728, 0, 1, 0.6745098, 1,
-0.1630936, -0.7072788, -2.911264, 0, 1, 0.682353, 1,
-0.1630641, -0.7056261, -2.00449, 0, 1, 0.6862745, 1,
-0.1605171, -0.9611636, -3.832165, 0, 1, 0.6941177, 1,
-0.1596552, 0.7461334, -0.501335, 0, 1, 0.7019608, 1,
-0.1582088, 0.404697, -1.301481, 0, 1, 0.7058824, 1,
-0.1558797, 0.4163951, -1.856228, 0, 1, 0.7137255, 1,
-0.1545282, -0.4418724, -2.350806, 0, 1, 0.7176471, 1,
-0.1521406, -0.9741756, -2.423297, 0, 1, 0.7254902, 1,
-0.147755, 0.4905377, 0.088815, 0, 1, 0.7294118, 1,
-0.1472413, -0.9195246, -2.79619, 0, 1, 0.7372549, 1,
-0.1405014, -0.04810599, -1.176161, 0, 1, 0.7411765, 1,
-0.1355778, 0.269216, -1.050365, 0, 1, 0.7490196, 1,
-0.1353638, -0.1610503, -3.426897, 0, 1, 0.7529412, 1,
-0.1308243, -0.4666378, -3.533545, 0, 1, 0.7607843, 1,
-0.1279922, 0.2495584, -0.6033407, 0, 1, 0.7647059, 1,
-0.1266196, -0.6868734, -3.629458, 0, 1, 0.772549, 1,
-0.1247688, -0.6000703, -4.131043, 0, 1, 0.7764706, 1,
-0.122525, -0.07305208, -0.951425, 0, 1, 0.7843137, 1,
-0.1135952, -0.09137519, -2.846472, 0, 1, 0.7882353, 1,
-0.1033287, 0.1795435, 1.396111, 0, 1, 0.7960784, 1,
-0.09632836, 0.7369603, -0.05500918, 0, 1, 0.8039216, 1,
-0.09325118, -0.8009303, -2.903405, 0, 1, 0.8078431, 1,
-0.08908857, 0.5842404, -1.444921, 0, 1, 0.8156863, 1,
-0.08558059, 0.4804705, -0.6124262, 0, 1, 0.8196079, 1,
-0.08406027, 0.7812206, 1.265735, 0, 1, 0.827451, 1,
-0.08232516, -2.996524, -2.366635, 0, 1, 0.8313726, 1,
-0.0802343, 1.400043, -0.07437674, 0, 1, 0.8392157, 1,
-0.07250097, -2.068466, -4.892414, 0, 1, 0.8431373, 1,
-0.07214515, 0.5110661, 1.6291, 0, 1, 0.8509804, 1,
-0.06718943, 0.8972197, -0.56103, 0, 1, 0.854902, 1,
-0.06713245, 0.001581808, -2.203303, 0, 1, 0.8627451, 1,
-0.06687503, -1.509003, -2.34051, 0, 1, 0.8666667, 1,
-0.06522954, -1.001389, -4.218725, 0, 1, 0.8745098, 1,
-0.06469653, 0.3590434, -2.041867, 0, 1, 0.8784314, 1,
-0.06410278, 1.400173, 0.169024, 0, 1, 0.8862745, 1,
-0.06383832, 0.1681757, -0.7553363, 0, 1, 0.8901961, 1,
-0.06363653, 0.2581591, -1.642125, 0, 1, 0.8980392, 1,
-0.06245816, -1.492055, -3.701071, 0, 1, 0.9058824, 1,
-0.0609741, 0.3652737, 1.33666, 0, 1, 0.9098039, 1,
-0.05948304, 0.3706152, 1.110694, 0, 1, 0.9176471, 1,
-0.05693565, 0.1392605, 1.760696, 0, 1, 0.9215686, 1,
-0.05525003, 1.024941, -1.341358, 0, 1, 0.9294118, 1,
-0.0535252, -0.1193883, -2.355276, 0, 1, 0.9333333, 1,
-0.05338971, -0.06130281, -3.093236, 0, 1, 0.9411765, 1,
-0.05153609, -0.1329118, -2.888712, 0, 1, 0.945098, 1,
-0.04845968, -0.05734203, -3.504003, 0, 1, 0.9529412, 1,
-0.04478017, 1.461796, 0.06682227, 0, 1, 0.9568627, 1,
-0.03895875, 0.6003278, -0.3119549, 0, 1, 0.9647059, 1,
-0.03558811, 1.250864, 0.4134532, 0, 1, 0.9686275, 1,
-0.03395818, -1.086863, -5.57374, 0, 1, 0.9764706, 1,
-0.03357801, 0.09743961, -0.4301018, 0, 1, 0.9803922, 1,
-0.03333418, -1.012345, -4.653003, 0, 1, 0.9882353, 1,
-0.03196356, -0.6528341, -3.82294, 0, 1, 0.9921569, 1,
-0.02993511, -0.07475566, -3.33494, 0, 1, 1, 1,
-0.02843209, -0.9240893, -3.578629, 0, 0.9921569, 1, 1,
-0.02556404, 0.2047466, 0.1961192, 0, 0.9882353, 1, 1,
-0.0248995, 0.6643341, -0.5060216, 0, 0.9803922, 1, 1,
-0.02472463, -0.1143438, -2.743425, 0, 0.9764706, 1, 1,
-0.0242881, 0.4077915, 0.2717389, 0, 0.9686275, 1, 1,
-0.02419507, -1.271752, -2.352777, 0, 0.9647059, 1, 1,
-0.0236793, 1.719449, 1.566188, 0, 0.9568627, 1, 1,
-0.02329754, -0.003463378, -1.119831, 0, 0.9529412, 1, 1,
-0.02322493, 0.09363173, -0.112849, 0, 0.945098, 1, 1,
-0.0219681, 0.1309011, -0.2998616, 0, 0.9411765, 1, 1,
-0.02143599, 0.8697702, 1.546507, 0, 0.9333333, 1, 1,
-0.02117696, 0.03297967, -0.4970424, 0, 0.9294118, 1, 1,
-0.01652429, 0.1448262, -0.3575577, 0, 0.9215686, 1, 1,
-0.01638231, 2.275067, 0.07420402, 0, 0.9176471, 1, 1,
-0.01349166, -0.1459316, -3.303966, 0, 0.9098039, 1, 1,
-0.01189745, -0.1260271, -3.179513, 0, 0.9058824, 1, 1,
-0.01029816, 0.5161771, 0.2720965, 0, 0.8980392, 1, 1,
-0.005203553, -0.2176072, -3.388673, 0, 0.8901961, 1, 1,
-0.004936325, 0.2659077, 0.4607277, 0, 0.8862745, 1, 1,
-0.00417592, -2.366491, -4.056425, 0, 0.8784314, 1, 1,
0.002810296, 1.965224, -0.4465917, 0, 0.8745098, 1, 1,
0.005526698, 1.231671, 0.4234402, 0, 0.8666667, 1, 1,
0.008582599, 1.126456, -0.5536312, 0, 0.8627451, 1, 1,
0.01073283, -0.9073551, 2.900638, 0, 0.854902, 1, 1,
0.01111542, 0.976395, 2.025082, 0, 0.8509804, 1, 1,
0.01453665, 0.289221, 1.824793, 0, 0.8431373, 1, 1,
0.01574432, 0.9691591, -1.772356, 0, 0.8392157, 1, 1,
0.01652703, -0.1196379, 1.204491, 0, 0.8313726, 1, 1,
0.01736066, 0.5582114, 0.5465228, 0, 0.827451, 1, 1,
0.02022683, 0.7649717, -0.1437775, 0, 0.8196079, 1, 1,
0.02029394, -0.8217007, 3.738377, 0, 0.8156863, 1, 1,
0.0207998, -0.4536816, 2.491663, 0, 0.8078431, 1, 1,
0.02204665, -0.1493921, 1.245582, 0, 0.8039216, 1, 1,
0.0247631, -0.9607938, 1.801352, 0, 0.7960784, 1, 1,
0.02504381, -0.3451521, 3.886246, 0, 0.7882353, 1, 1,
0.02832624, 0.4168825, 0.6541808, 0, 0.7843137, 1, 1,
0.03179352, -1.534062, 2.636051, 0, 0.7764706, 1, 1,
0.03182136, -1.181193, 3.51091, 0, 0.772549, 1, 1,
0.0374472, -0.3833886, 3.680077, 0, 0.7647059, 1, 1,
0.04290189, -0.5615999, 5.932547, 0, 0.7607843, 1, 1,
0.04518862, -0.3342431, 3.551802, 0, 0.7529412, 1, 1,
0.05276817, 0.4537676, -0.6409017, 0, 0.7490196, 1, 1,
0.05358174, 0.3450772, -1.646832, 0, 0.7411765, 1, 1,
0.05695095, -0.2470967, 2.600043, 0, 0.7372549, 1, 1,
0.05935752, -2.459105, 3.193239, 0, 0.7294118, 1, 1,
0.06326715, -0.5931744, 2.962208, 0, 0.7254902, 1, 1,
0.0678592, -0.7785594, 3.517645, 0, 0.7176471, 1, 1,
0.06791335, 0.8920327, 0.8573796, 0, 0.7137255, 1, 1,
0.07320374, 0.3471672, 1.567613, 0, 0.7058824, 1, 1,
0.07446864, -0.6006272, 4.908901, 0, 0.6980392, 1, 1,
0.07469542, -0.3175334, 4.688854, 0, 0.6941177, 1, 1,
0.07778665, -0.3970922, 3.004347, 0, 0.6862745, 1, 1,
0.07908975, 0.4336277, 1.030619, 0, 0.682353, 1, 1,
0.08554932, -0.4495667, 4.614721, 0, 0.6745098, 1, 1,
0.09102987, -0.1687275, 1.754966, 0, 0.6705883, 1, 1,
0.09171066, 0.6327309, 1.390866, 0, 0.6627451, 1, 1,
0.09488469, -0.3749576, 2.453981, 0, 0.6588235, 1, 1,
0.09914705, -0.655727, 2.493977, 0, 0.6509804, 1, 1,
0.1040857, -1.108896, 4.414553, 0, 0.6470588, 1, 1,
0.1054594, 0.2393301, 1.791104, 0, 0.6392157, 1, 1,
0.1069684, -0.9827084, 3.594771, 0, 0.6352941, 1, 1,
0.1147139, 0.07786997, -0.4294487, 0, 0.627451, 1, 1,
0.1163335, 0.1347591, -0.4733894, 0, 0.6235294, 1, 1,
0.1219133, 0.1491318, 0.2665697, 0, 0.6156863, 1, 1,
0.1227611, -0.2563008, 2.391167, 0, 0.6117647, 1, 1,
0.1297532, -0.5860489, 4.138919, 0, 0.6039216, 1, 1,
0.1335438, -0.1387243, 0.4594099, 0, 0.5960785, 1, 1,
0.1367417, 1.413296, 1.483639, 0, 0.5921569, 1, 1,
0.1384179, -0.5488377, 1.716925, 0, 0.5843138, 1, 1,
0.1400202, 0.03663571, 2.894232, 0, 0.5803922, 1, 1,
0.1511589, 1.349216, -0.4588766, 0, 0.572549, 1, 1,
0.1522122, 0.8968081, -1.216975, 0, 0.5686275, 1, 1,
0.1539812, 0.8084074, 0.07400494, 0, 0.5607843, 1, 1,
0.1552885, 0.1922235, 0.1634624, 0, 0.5568628, 1, 1,
0.1565926, -0.2814927, 4.474403, 0, 0.5490196, 1, 1,
0.157453, 0.8496229, -1.168263, 0, 0.5450981, 1, 1,
0.1580006, -0.6252213, 2.00996, 0, 0.5372549, 1, 1,
0.1614618, 1.026225, -1.484738, 0, 0.5333334, 1, 1,
0.1629025, -0.1609018, 2.338154, 0, 0.5254902, 1, 1,
0.1630042, 3.498517, -0.1768632, 0, 0.5215687, 1, 1,
0.1657384, -2.431293, 3.159496, 0, 0.5137255, 1, 1,
0.166523, 0.7318265, 1.664791, 0, 0.509804, 1, 1,
0.1705073, 0.004688105, 0.6979569, 0, 0.5019608, 1, 1,
0.1712257, 2.332737, 1.2556, 0, 0.4941176, 1, 1,
0.1750439, 0.7712012, 0.09466393, 0, 0.4901961, 1, 1,
0.1793815, -0.0159175, 2.123229, 0, 0.4823529, 1, 1,
0.1796583, 1.354571, -0.4319585, 0, 0.4784314, 1, 1,
0.1796937, -0.1844376, 3.160566, 0, 0.4705882, 1, 1,
0.1832008, 0.9425138, 0.8262439, 0, 0.4666667, 1, 1,
0.1872522, 1.527749, 1.391994, 0, 0.4588235, 1, 1,
0.1891957, -0.3681971, 2.834054, 0, 0.454902, 1, 1,
0.1902026, 0.6132048, -0.51992, 0, 0.4470588, 1, 1,
0.1904536, -1.167657, 1.855875, 0, 0.4431373, 1, 1,
0.1909921, 1.009314, 1.812878, 0, 0.4352941, 1, 1,
0.1926071, -0.1060609, 1.664921, 0, 0.4313726, 1, 1,
0.1927914, -0.6296067, 2.412427, 0, 0.4235294, 1, 1,
0.193898, -1.37595, 2.199848, 0, 0.4196078, 1, 1,
0.1944803, -0.9165972, 1.587103, 0, 0.4117647, 1, 1,
0.1949709, 0.5347502, -0.05001767, 0, 0.4078431, 1, 1,
0.2019267, 0.2592866, 1.668041, 0, 0.4, 1, 1,
0.2024413, -1.013721, 3.956205, 0, 0.3921569, 1, 1,
0.2094837, -0.7644762, 2.313497, 0, 0.3882353, 1, 1,
0.2100866, -1.519468, 2.522334, 0, 0.3803922, 1, 1,
0.2110776, 0.5738323, 1.42916, 0, 0.3764706, 1, 1,
0.2119646, -0.1511717, 2.227606, 0, 0.3686275, 1, 1,
0.212793, 0.7253748, 0.01586088, 0, 0.3647059, 1, 1,
0.2144578, 0.4322527, 1.069519, 0, 0.3568628, 1, 1,
0.2196124, 0.09653927, 1.903285, 0, 0.3529412, 1, 1,
0.2211091, -0.6986474, 1.918733, 0, 0.345098, 1, 1,
0.2225664, 0.5710968, 1.986081, 0, 0.3411765, 1, 1,
0.2263096, 2.54882, 0.92207, 0, 0.3333333, 1, 1,
0.2320155, 0.04730635, 2.345204, 0, 0.3294118, 1, 1,
0.2351245, -0.779162, 4.582243, 0, 0.3215686, 1, 1,
0.2418747, -0.06531151, 3.206284, 0, 0.3176471, 1, 1,
0.2458574, -0.108582, 0.6227123, 0, 0.3098039, 1, 1,
0.2479245, -0.2920382, 2.187589, 0, 0.3058824, 1, 1,
0.2493245, -0.7883083, 3.944102, 0, 0.2980392, 1, 1,
0.2522684, -0.2362207, 2.109357, 0, 0.2901961, 1, 1,
0.25356, 0.3889668, 1.764697, 0, 0.2862745, 1, 1,
0.2559081, 0.2245973, 1.602991, 0, 0.2784314, 1, 1,
0.258675, -1.442787, 2.539234, 0, 0.2745098, 1, 1,
0.2600696, 0.8744978, 0.4052553, 0, 0.2666667, 1, 1,
0.2720763, 0.4820757, 0.7365116, 0, 0.2627451, 1, 1,
0.2757624, -0.7101768, 1.600078, 0, 0.254902, 1, 1,
0.2764389, -0.6637113, 3.941277, 0, 0.2509804, 1, 1,
0.2775756, 1.600352, -0.5582719, 0, 0.2431373, 1, 1,
0.2816875, -1.607439, 3.197689, 0, 0.2392157, 1, 1,
0.2907567, -0.846652, 3.851629, 0, 0.2313726, 1, 1,
0.2912521, 0.6901174, -0.7446849, 0, 0.227451, 1, 1,
0.2947623, 1.826414, 0.06897711, 0, 0.2196078, 1, 1,
0.2971659, -0.6545212, 2.565199, 0, 0.2156863, 1, 1,
0.2988534, -1.003626, 3.240189, 0, 0.2078431, 1, 1,
0.2995519, 0.1999931, 2.122919, 0, 0.2039216, 1, 1,
0.3013719, 1.304589, -0.5052108, 0, 0.1960784, 1, 1,
0.3013874, -0.3238125, 1.344319, 0, 0.1882353, 1, 1,
0.3042792, -0.6539792, 2.562099, 0, 0.1843137, 1, 1,
0.3061816, 0.2772336, -0.01844327, 0, 0.1764706, 1, 1,
0.3064513, -0.3714202, 1.959091, 0, 0.172549, 1, 1,
0.3118542, -0.01507133, 1.282149, 0, 0.1647059, 1, 1,
0.3134458, 0.6758868, 0.8993189, 0, 0.1607843, 1, 1,
0.3207184, 0.9910939, 0.1772708, 0, 0.1529412, 1, 1,
0.3223226, -1.182167, 1.942052, 0, 0.1490196, 1, 1,
0.323225, 2.229089, 0.2834313, 0, 0.1411765, 1, 1,
0.3250136, -0.3812858, 1.628556, 0, 0.1372549, 1, 1,
0.327222, 0.7860094, 0.1405111, 0, 0.1294118, 1, 1,
0.3281123, 0.8940135, 1.631517, 0, 0.1254902, 1, 1,
0.3303901, -0.4171057, 4.093211, 0, 0.1176471, 1, 1,
0.3309967, 0.8761234, 0.1509177, 0, 0.1137255, 1, 1,
0.3317323, 2.51123, 0.5037639, 0, 0.1058824, 1, 1,
0.3338268, -0.1063119, 0.8683023, 0, 0.09803922, 1, 1,
0.3343693, 0.6224757, -0.7758859, 0, 0.09411765, 1, 1,
0.3371913, 0.5575967, 0.9473671, 0, 0.08627451, 1, 1,
0.341734, -1.192216, 2.371144, 0, 0.08235294, 1, 1,
0.3426424, -0.06517839, -0.3142826, 0, 0.07450981, 1, 1,
0.3474827, -1.223663, 3.772903, 0, 0.07058824, 1, 1,
0.3475569, -0.1306073, 2.214145, 0, 0.0627451, 1, 1,
0.3477964, -0.6504284, 2.056191, 0, 0.05882353, 1, 1,
0.3487726, -0.8512462, 1.780329, 0, 0.05098039, 1, 1,
0.3543434, 0.7527925, -0.8965113, 0, 0.04705882, 1, 1,
0.359722, 0.4160344, 1.878587, 0, 0.03921569, 1, 1,
0.3642182, -0.2039625, 1.463482, 0, 0.03529412, 1, 1,
0.3671032, 0.7614403, -0.1181668, 0, 0.02745098, 1, 1,
0.3681434, 0.6843078, 1.178154, 0, 0.02352941, 1, 1,
0.3690073, -0.6338323, 0.4779358, 0, 0.01568628, 1, 1,
0.3765491, 0.8335814, -0.2344387, 0, 0.01176471, 1, 1,
0.3775706, -1.388868, 2.487112, 0, 0.003921569, 1, 1,
0.3789855, 0.285501, 0.5638579, 0.003921569, 0, 1, 1,
0.3821707, 0.2559354, 1.805407, 0.007843138, 0, 1, 1,
0.3834163, 0.312294, -1.165651, 0.01568628, 0, 1, 1,
0.3850521, 0.8842248, -1.145347, 0.01960784, 0, 1, 1,
0.3870637, 1.803276, 2.303761, 0.02745098, 0, 1, 1,
0.3904438, 0.4128469, 0.4493589, 0.03137255, 0, 1, 1,
0.3916323, 1.028076, -0.5534608, 0.03921569, 0, 1, 1,
0.3942521, 1.246113, 0.388119, 0.04313726, 0, 1, 1,
0.4054507, 0.3432389, 2.465521, 0.05098039, 0, 1, 1,
0.4068903, -0.3173169, 1.107396, 0.05490196, 0, 1, 1,
0.4071766, 0.381735, 1.605311, 0.0627451, 0, 1, 1,
0.4088566, 0.8045698, 1.448105, 0.06666667, 0, 1, 1,
0.410012, 0.5908552, 1.132127, 0.07450981, 0, 1, 1,
0.4101187, -0.6573073, 4.084673, 0.07843138, 0, 1, 1,
0.4114749, 0.8743299, -0.6792916, 0.08627451, 0, 1, 1,
0.4153419, 0.6074671, 1.007612, 0.09019608, 0, 1, 1,
0.4229356, -0.3482963, 2.392801, 0.09803922, 0, 1, 1,
0.4261866, 0.8586008, 0.4086837, 0.1058824, 0, 1, 1,
0.4264503, 0.4852266, 1.805069, 0.1098039, 0, 1, 1,
0.4336563, -1.48561, 2.952341, 0.1176471, 0, 1, 1,
0.4347522, -0.6709194, 2.085685, 0.1215686, 0, 1, 1,
0.4415512, -0.1525095, 1.861801, 0.1294118, 0, 1, 1,
0.4439885, -0.1754741, 3.650456, 0.1333333, 0, 1, 1,
0.4483764, -0.8320791, 2.417235, 0.1411765, 0, 1, 1,
0.4504264, 0.03647006, -0.2801784, 0.145098, 0, 1, 1,
0.4568715, -0.6043776, 2.45989, 0.1529412, 0, 1, 1,
0.4591549, -0.05917558, 1.827889, 0.1568628, 0, 1, 1,
0.4681073, -0.7608855, 1.729311, 0.1647059, 0, 1, 1,
0.4731051, 1.279453, -0.3386801, 0.1686275, 0, 1, 1,
0.4748556, 1.162803, 1.938808, 0.1764706, 0, 1, 1,
0.4786907, 0.5997002, -0.6088873, 0.1803922, 0, 1, 1,
0.4787023, -1.744169, 0.5670784, 0.1882353, 0, 1, 1,
0.4809081, 1.468515, -0.06195144, 0.1921569, 0, 1, 1,
0.4886732, 1.361403, 0.2637461, 0.2, 0, 1, 1,
0.4914662, 0.4425508, 0.1221141, 0.2078431, 0, 1, 1,
0.4963458, 0.445707, 0.2581116, 0.2117647, 0, 1, 1,
0.5012867, 0.4731385, 1.12294, 0.2196078, 0, 1, 1,
0.5046415, -0.4588231, 2.74988, 0.2235294, 0, 1, 1,
0.5054598, 1.334492, -0.3440425, 0.2313726, 0, 1, 1,
0.5082685, 0.05853349, 2.366914, 0.2352941, 0, 1, 1,
0.5149559, -1.449005, 1.028298, 0.2431373, 0, 1, 1,
0.5151533, 1.009869, 0.9584513, 0.2470588, 0, 1, 1,
0.5219544, -0.2326519, 0.7172424, 0.254902, 0, 1, 1,
0.5247861, 0.3494787, -0.02636366, 0.2588235, 0, 1, 1,
0.5261227, -0.9507221, 2.829178, 0.2666667, 0, 1, 1,
0.5263925, -0.1333912, 2.503763, 0.2705882, 0, 1, 1,
0.5287138, -1.232354, 5.444765, 0.2784314, 0, 1, 1,
0.5317355, 0.9522051, -0.3276049, 0.282353, 0, 1, 1,
0.5319747, 1.580238, 1.087908, 0.2901961, 0, 1, 1,
0.5323422, -0.8727451, 2.28004, 0.2941177, 0, 1, 1,
0.5324494, 0.5570027, 1.481676, 0.3019608, 0, 1, 1,
0.5347977, 0.1294947, 2.397281, 0.3098039, 0, 1, 1,
0.5384548, 0.57185, 0.2380862, 0.3137255, 0, 1, 1,
0.5453075, -0.5948571, 3.343325, 0.3215686, 0, 1, 1,
0.556499, -0.3051879, 2.224075, 0.3254902, 0, 1, 1,
0.5566235, 0.2717578, 1.607556, 0.3333333, 0, 1, 1,
0.5588312, 0.9455978, -1.403988, 0.3372549, 0, 1, 1,
0.5650359, 0.04234564, 2.409849, 0.345098, 0, 1, 1,
0.572963, 0.8785344, 0.008008922, 0.3490196, 0, 1, 1,
0.5741625, -0.4762779, 1.990523, 0.3568628, 0, 1, 1,
0.579416, 1.826125, 0.4682196, 0.3607843, 0, 1, 1,
0.5845853, 2.070708, 1.270036, 0.3686275, 0, 1, 1,
0.5846502, 1.803064, 0.4960715, 0.372549, 0, 1, 1,
0.5860695, 0.9777306, 0.5348194, 0.3803922, 0, 1, 1,
0.5863409, 0.2468053, 0.9214041, 0.3843137, 0, 1, 1,
0.586422, 0.4621807, -0.6996049, 0.3921569, 0, 1, 1,
0.5904958, -0.4980194, 3.75335, 0.3960784, 0, 1, 1,
0.601768, -1.084905, 3.191943, 0.4039216, 0, 1, 1,
0.6046048, -0.01684004, 2.610406, 0.4117647, 0, 1, 1,
0.6069119, -1.160677, 3.900348, 0.4156863, 0, 1, 1,
0.6093594, 0.6861072, -1.031319, 0.4235294, 0, 1, 1,
0.6150222, 3.033645, -1.290118, 0.427451, 0, 1, 1,
0.6156073, -0.1763235, 2.92878, 0.4352941, 0, 1, 1,
0.6181303, 1.969731, -0.9714099, 0.4392157, 0, 1, 1,
0.6186668, 0.7201227, 0.293447, 0.4470588, 0, 1, 1,
0.6249303, -1.347546, 2.426891, 0.4509804, 0, 1, 1,
0.6252525, 0.9545759, 1.340768, 0.4588235, 0, 1, 1,
0.6270941, -0.7758732, 3.273081, 0.4627451, 0, 1, 1,
0.6303545, 1.198497, 0.6589369, 0.4705882, 0, 1, 1,
0.6321712, 1.909916, 1.148446, 0.4745098, 0, 1, 1,
0.6345842, 0.210882, 1.239662, 0.4823529, 0, 1, 1,
0.6497192, -0.6571543, 1.528802, 0.4862745, 0, 1, 1,
0.6581986, -0.4241748, 3.823738, 0.4941176, 0, 1, 1,
0.6603935, 0.2313371, -0.02554433, 0.5019608, 0, 1, 1,
0.6624863, 0.06458128, 2.102388, 0.5058824, 0, 1, 1,
0.664888, -1.448357, 3.51027, 0.5137255, 0, 1, 1,
0.6670023, 0.2537641, 2.725051, 0.5176471, 0, 1, 1,
0.6692107, 0.8591361, 0.5891338, 0.5254902, 0, 1, 1,
0.6706467, -0.9019979, 3.790972, 0.5294118, 0, 1, 1,
0.6768273, 0.4022592, 0.06716026, 0.5372549, 0, 1, 1,
0.6772061, 0.1779884, 0.6022395, 0.5411765, 0, 1, 1,
0.6784269, -1.373945, 2.268968, 0.5490196, 0, 1, 1,
0.6803007, -0.05592278, 2.948058, 0.5529412, 0, 1, 1,
0.6806817, -1.613861, 1.878409, 0.5607843, 0, 1, 1,
0.6809202, 1.359201, -0.008661258, 0.5647059, 0, 1, 1,
0.6882913, 1.496328, 0.2282811, 0.572549, 0, 1, 1,
0.6914581, -0.8484845, 3.084465, 0.5764706, 0, 1, 1,
0.6947036, -0.1483542, 1.66114, 0.5843138, 0, 1, 1,
0.6971478, 0.3796493, 1.329278, 0.5882353, 0, 1, 1,
0.6973565, -0.1402619, 0.6396852, 0.5960785, 0, 1, 1,
0.6997827, 0.6376749, 0.8706077, 0.6039216, 0, 1, 1,
0.7015261, 1.092198, 0.6682991, 0.6078432, 0, 1, 1,
0.7214392, 0.605405, 0.651523, 0.6156863, 0, 1, 1,
0.721862, -0.8508635, 3.455149, 0.6196079, 0, 1, 1,
0.7226282, -1.769287, 2.153337, 0.627451, 0, 1, 1,
0.7233049, -1.563406, 2.389822, 0.6313726, 0, 1, 1,
0.7293611, 0.1336078, 0.5688521, 0.6392157, 0, 1, 1,
0.7304172, 0.2654257, -0.4556902, 0.6431373, 0, 1, 1,
0.7403054, -0.9346577, 2.990998, 0.6509804, 0, 1, 1,
0.741241, -0.5761644, 3.068957, 0.654902, 0, 1, 1,
0.7428938, 0.3139215, 2.309507, 0.6627451, 0, 1, 1,
0.7463028, 0.4019242, 1.70489, 0.6666667, 0, 1, 1,
0.7463602, -0.7143389, 1.850601, 0.6745098, 0, 1, 1,
0.7463827, 0.2830712, 2.594229, 0.6784314, 0, 1, 1,
0.7470706, -0.1327456, 2.176612, 0.6862745, 0, 1, 1,
0.7519133, -0.3272394, 0.5761525, 0.6901961, 0, 1, 1,
0.7527276, 1.630194, 1.958242, 0.6980392, 0, 1, 1,
0.7528952, 0.4540904, 1.105762, 0.7058824, 0, 1, 1,
0.7542765, -0.03084184, 0.5349929, 0.7098039, 0, 1, 1,
0.7573585, 0.3648904, 1.692992, 0.7176471, 0, 1, 1,
0.7656368, -1.272759, 1.642601, 0.7215686, 0, 1, 1,
0.7685518, 0.5312541, 1.726166, 0.7294118, 0, 1, 1,
0.7722086, 1.23364, -0.6263843, 0.7333333, 0, 1, 1,
0.7746203, -1.554398, 2.009609, 0.7411765, 0, 1, 1,
0.779924, 1.578185, -0.4590163, 0.7450981, 0, 1, 1,
0.7811806, 1.356527, -0.6739634, 0.7529412, 0, 1, 1,
0.7821096, 0.4123926, -0.3712966, 0.7568628, 0, 1, 1,
0.7886703, 0.05531137, 1.204657, 0.7647059, 0, 1, 1,
0.796303, 0.09968294, 1.156195, 0.7686275, 0, 1, 1,
0.7964227, -0.6966481, 2.819989, 0.7764706, 0, 1, 1,
0.8019198, 0.8452553, 1.882172, 0.7803922, 0, 1, 1,
0.8041068, 1.078915, -0.6434734, 0.7882353, 0, 1, 1,
0.8051292, -0.01911166, 2.887197, 0.7921569, 0, 1, 1,
0.8058303, 0.1145972, 2.188322, 0.8, 0, 1, 1,
0.8129616, -0.1391604, 1.899846, 0.8078431, 0, 1, 1,
0.8189522, -0.9889705, 2.198897, 0.8117647, 0, 1, 1,
0.8279725, -0.8067152, 2.319059, 0.8196079, 0, 1, 1,
0.8297356, -1.619132, 1.410382, 0.8235294, 0, 1, 1,
0.8326257, 0.516883, 1.531281, 0.8313726, 0, 1, 1,
0.8328713, -0.1708905, 1.813425, 0.8352941, 0, 1, 1,
0.8397726, -0.20162, 1.299497, 0.8431373, 0, 1, 1,
0.8461494, -0.9153498, 2.823365, 0.8470588, 0, 1, 1,
0.8512137, 1.000004, 0.3434468, 0.854902, 0, 1, 1,
0.8513254, -0.05966359, 1.4898, 0.8588235, 0, 1, 1,
0.8513943, -2.248379, 1.870024, 0.8666667, 0, 1, 1,
0.8573602, 0.5932556, 0.9275618, 0.8705882, 0, 1, 1,
0.8621552, -0.8122072, 2.67151, 0.8784314, 0, 1, 1,
0.8656098, 0.8777037, 0.9621298, 0.8823529, 0, 1, 1,
0.8977044, 1.559072, 0.5000777, 0.8901961, 0, 1, 1,
0.8993977, -1.458777, 2.008221, 0.8941177, 0, 1, 1,
0.9006373, 0.7951779, -0.2279893, 0.9019608, 0, 1, 1,
0.9065464, -0.1023208, 2.788125, 0.9098039, 0, 1, 1,
0.9100593, -0.04505124, 1.301594, 0.9137255, 0, 1, 1,
0.9111804, -2.036014, 1.958913, 0.9215686, 0, 1, 1,
0.9167945, 0.4700152, 1.50614, 0.9254902, 0, 1, 1,
0.9177161, -0.04339796, 0.8770303, 0.9333333, 0, 1, 1,
0.9236081, -0.4047147, 0.9289625, 0.9372549, 0, 1, 1,
0.9270565, -0.7254181, 1.473147, 0.945098, 0, 1, 1,
0.9275746, -0.2638014, 2.579794, 0.9490196, 0, 1, 1,
0.9368369, -1.364826, 1.438985, 0.9568627, 0, 1, 1,
0.9391067, -1.139646, 0.8059541, 0.9607843, 0, 1, 1,
0.9457803, -1.147905, 2.958057, 0.9686275, 0, 1, 1,
0.9481607, 0.2946166, 3.127911, 0.972549, 0, 1, 1,
0.9533487, -1.384493, 4.479651, 0.9803922, 0, 1, 1,
0.9598271, -0.5144411, 0.5940752, 0.9843137, 0, 1, 1,
0.9601952, -2.02552, 0.6599383, 0.9921569, 0, 1, 1,
0.9624189, 0.4381839, 1.431815, 0.9960784, 0, 1, 1,
0.9671524, 0.8168126, 0.8841597, 1, 0, 0.9960784, 1,
0.9686407, 1.563233, 0.6194355, 1, 0, 0.9882353, 1,
0.9705759, -0.1340958, 0.6871948, 1, 0, 0.9843137, 1,
0.9714815, 1.491582, -0.07205689, 1, 0, 0.9764706, 1,
0.97388, 1.538472, 0.118361, 1, 0, 0.972549, 1,
0.9786592, -1.14834, 3.029958, 1, 0, 0.9647059, 1,
0.9788433, 0.4950877, 1.847432, 1, 0, 0.9607843, 1,
0.9900838, -0.625275, 1.401997, 1, 0, 0.9529412, 1,
0.9929323, 1.317998, -0.2140442, 1, 0, 0.9490196, 1,
1.000646, 0.1465358, 1.631726, 1, 0, 0.9411765, 1,
1.00383, 0.5781126, -0.5448756, 1, 0, 0.9372549, 1,
1.01272, -0.6319531, 1.638922, 1, 0, 0.9294118, 1,
1.015033, -0.1035473, 1.929062, 1, 0, 0.9254902, 1,
1.016788, -1.44174, 2.423249, 1, 0, 0.9176471, 1,
1.017427, 0.6118529, -0.7745288, 1, 0, 0.9137255, 1,
1.022142, -0.5622526, 0.8368585, 1, 0, 0.9058824, 1,
1.034234, -1.225747, 3.110137, 1, 0, 0.9019608, 1,
1.046012, -0.9237512, 2.936753, 1, 0, 0.8941177, 1,
1.047072, 0.0326625, -0.06626771, 1, 0, 0.8862745, 1,
1.048233, 0.3405591, 2.110361, 1, 0, 0.8823529, 1,
1.049355, -1.102703, 1.439064, 1, 0, 0.8745098, 1,
1.06361, -0.6751651, 2.417728, 1, 0, 0.8705882, 1,
1.068253, 0.8288449, 2.770732, 1, 0, 0.8627451, 1,
1.083938, -1.236251, 3.386067, 1, 0, 0.8588235, 1,
1.089729, -0.2077165, 0.9064956, 1, 0, 0.8509804, 1,
1.092931, 0.4964906, -1.093013, 1, 0, 0.8470588, 1,
1.093818, -0.4646505, 2.150116, 1, 0, 0.8392157, 1,
1.100558, -2.696474, 4.82921, 1, 0, 0.8352941, 1,
1.10253, 0.2463038, 2.18935, 1, 0, 0.827451, 1,
1.103472, -0.7423436, 2.718807, 1, 0, 0.8235294, 1,
1.104957, -1.094698, 1.155003, 1, 0, 0.8156863, 1,
1.108384, 0.2988606, 0.8801602, 1, 0, 0.8117647, 1,
1.109844, 0.975691, -0.03599834, 1, 0, 0.8039216, 1,
1.111146, 1.05263, 0.5005401, 1, 0, 0.7960784, 1,
1.11474, -0.4473696, 0.8387552, 1, 0, 0.7921569, 1,
1.118289, 0.6553808, 0.9628289, 1, 0, 0.7843137, 1,
1.120367, -0.2977053, 2.960552, 1, 0, 0.7803922, 1,
1.122223, 0.6408936, -0.8543409, 1, 0, 0.772549, 1,
1.126637, -0.6236404, 0.3738185, 1, 0, 0.7686275, 1,
1.127946, 0.3232933, 0.7244542, 1, 0, 0.7607843, 1,
1.14174, 0.2459095, 2.729674, 1, 0, 0.7568628, 1,
1.143162, -0.1377361, 1.029565, 1, 0, 0.7490196, 1,
1.144525, 0.09629772, 0.2818494, 1, 0, 0.7450981, 1,
1.146034, -1.273757, 2.556166, 1, 0, 0.7372549, 1,
1.156708, 0.02160409, 2.527429, 1, 0, 0.7333333, 1,
1.159258, 0.02302208, 1.030006, 1, 0, 0.7254902, 1,
1.179664, 1.892621, -0.8123955, 1, 0, 0.7215686, 1,
1.182363, -1.119928, 2.427307, 1, 0, 0.7137255, 1,
1.194142, -0.4950838, 1.660025, 1, 0, 0.7098039, 1,
1.194175, -1.09858, 2.033474, 1, 0, 0.7019608, 1,
1.197821, -0.0932934, 2.568837, 1, 0, 0.6941177, 1,
1.202201, -0.5960002, 2.594909, 1, 0, 0.6901961, 1,
1.202541, -1.015644, 2.412568, 1, 0, 0.682353, 1,
1.207512, -0.8186638, 1.889893, 1, 0, 0.6784314, 1,
1.208124, 0.7912251, 0.4988595, 1, 0, 0.6705883, 1,
1.209288, 0.8486099, 1.327708, 1, 0, 0.6666667, 1,
1.21194, -0.2462748, 3.203853, 1, 0, 0.6588235, 1,
1.220628, -0.5418079, 0.9795176, 1, 0, 0.654902, 1,
1.223537, 0.6628044, -3.049361, 1, 0, 0.6470588, 1,
1.229547, 0.4648723, 0.3245091, 1, 0, 0.6431373, 1,
1.237935, -0.480735, 2.712568, 1, 0, 0.6352941, 1,
1.250462, 0.8392488, 1.94555, 1, 0, 0.6313726, 1,
1.268482, -0.2430702, 1.490746, 1, 0, 0.6235294, 1,
1.277562, -0.245905, 0.8547965, 1, 0, 0.6196079, 1,
1.289009, -1.148089, 3.239499, 1, 0, 0.6117647, 1,
1.292935, -1.515229, 1.819686, 1, 0, 0.6078432, 1,
1.296703, 1.008395, 1.92092, 1, 0, 0.6, 1,
1.299857, 0.7441673, 1.640028, 1, 0, 0.5921569, 1,
1.313928, 0.1212067, 2.305506, 1, 0, 0.5882353, 1,
1.314766, 0.8183846, 1.564332, 1, 0, 0.5803922, 1,
1.316549, -0.07526263, 1.494185, 1, 0, 0.5764706, 1,
1.318002, 0.7837453, 1.088392, 1, 0, 0.5686275, 1,
1.318584, -0.03497203, 2.298416, 1, 0, 0.5647059, 1,
1.322309, 0.2681116, 1.089424, 1, 0, 0.5568628, 1,
1.322512, -0.961356, 2.989125, 1, 0, 0.5529412, 1,
1.325499, 0.9070669, -0.1433333, 1, 0, 0.5450981, 1,
1.327125, -0.07807315, 3.768205, 1, 0, 0.5411765, 1,
1.327981, 1.288056, 1.914904, 1, 0, 0.5333334, 1,
1.329129, -1.05583, 1.692336, 1, 0, 0.5294118, 1,
1.329468, 0.3539103, 2.399494, 1, 0, 0.5215687, 1,
1.346911, -1.771577, 2.982313, 1, 0, 0.5176471, 1,
1.351247, -0.05047863, 2.30212, 1, 0, 0.509804, 1,
1.357728, 0.3036545, 3.303403, 1, 0, 0.5058824, 1,
1.359699, 0.8229568, 1.516468, 1, 0, 0.4980392, 1,
1.361321, 0.4811694, 0.3593121, 1, 0, 0.4901961, 1,
1.361764, -0.5936776, 2.393338, 1, 0, 0.4862745, 1,
1.369546, -0.8243284, 0.7938762, 1, 0, 0.4784314, 1,
1.370858, -0.4188218, 2.302087, 1, 0, 0.4745098, 1,
1.376678, 0.6646952, -0.3438664, 1, 0, 0.4666667, 1,
1.378282, -0.6794717, 2.960644, 1, 0, 0.4627451, 1,
1.379477, -0.6593207, 0.7966362, 1, 0, 0.454902, 1,
1.383756, 2.13489, 0.5432423, 1, 0, 0.4509804, 1,
1.38568, -0.9548066, 2.513108, 1, 0, 0.4431373, 1,
1.397821, -1.09503, 3.195224, 1, 0, 0.4392157, 1,
1.401905, -0.3902403, 3.771154, 1, 0, 0.4313726, 1,
1.411059, -0.6992241, 3.147966, 1, 0, 0.427451, 1,
1.418017, 2.0877, 0.1924393, 1, 0, 0.4196078, 1,
1.418268, 0.3380105, -0.4821182, 1, 0, 0.4156863, 1,
1.426388, -0.4338837, 1.184225, 1, 0, 0.4078431, 1,
1.426909, -0.4917433, 2.297192, 1, 0, 0.4039216, 1,
1.443218, 0.2645596, 1.08315, 1, 0, 0.3960784, 1,
1.44462, -0.1249485, 1.619422, 1, 0, 0.3882353, 1,
1.467446, -0.7336086, 1.497218, 1, 0, 0.3843137, 1,
1.483215, -1.034808, 1.777589, 1, 0, 0.3764706, 1,
1.496847, -0.7900453, 2.93584, 1, 0, 0.372549, 1,
1.502061, -0.5927534, 2.75303, 1, 0, 0.3647059, 1,
1.506878, 0.5334794, 2.334378, 1, 0, 0.3607843, 1,
1.532715, -0.7434966, 2.815075, 1, 0, 0.3529412, 1,
1.540857, -0.1729343, 0.2693662, 1, 0, 0.3490196, 1,
1.545057, 0.9971132, 1.165255, 1, 0, 0.3411765, 1,
1.546943, 0.407883, 0.655207, 1, 0, 0.3372549, 1,
1.549281, 0.09195268, 2.01123, 1, 0, 0.3294118, 1,
1.551179, -1.162067, 3.848139, 1, 0, 0.3254902, 1,
1.558418, -1.196153, 2.380829, 1, 0, 0.3176471, 1,
1.564016, -2.594195, 2.782463, 1, 0, 0.3137255, 1,
1.623895, 0.200553, 0.2808482, 1, 0, 0.3058824, 1,
1.635288, -1.072821, 1.91648, 1, 0, 0.2980392, 1,
1.644869, 0.5082356, -0.3803068, 1, 0, 0.2941177, 1,
1.661606, -0.3010835, 3.182348, 1, 0, 0.2862745, 1,
1.669753, -0.6046444, 2.651809, 1, 0, 0.282353, 1,
1.671815, -0.03608146, 2.179123, 1, 0, 0.2745098, 1,
1.677899, -0.2148172, 1.032641, 1, 0, 0.2705882, 1,
1.681332, 0.4634268, -0.3672457, 1, 0, 0.2627451, 1,
1.689508, -1.172161, 0.9860671, 1, 0, 0.2588235, 1,
1.701011, -0.4303402, 2.886341, 1, 0, 0.2509804, 1,
1.711958, -0.3898181, 0.8514976, 1, 0, 0.2470588, 1,
1.712355, 0.248315, 0.962136, 1, 0, 0.2392157, 1,
1.726111, 0.172321, 0.9439119, 1, 0, 0.2352941, 1,
1.735967, 1.084832, 0.9966637, 1, 0, 0.227451, 1,
1.736881, -0.9495612, 0.9849182, 1, 0, 0.2235294, 1,
1.763227, 0.3859014, 2.685606, 1, 0, 0.2156863, 1,
1.765924, -0.6620733, 2.380112, 1, 0, 0.2117647, 1,
1.791704, -0.1612194, 1.961215, 1, 0, 0.2039216, 1,
1.798148, -1.966106, 3.028918, 1, 0, 0.1960784, 1,
1.79966, -0.6785659, 1.297229, 1, 0, 0.1921569, 1,
1.805137, 1.354987, 0.3253882, 1, 0, 0.1843137, 1,
1.807227, -1.097171, 1.444363, 1, 0, 0.1803922, 1,
1.822339, -0.3093947, 1.658704, 1, 0, 0.172549, 1,
1.827774, -0.5614019, 1.926275, 1, 0, 0.1686275, 1,
1.857451, 0.1658586, 1.993349, 1, 0, 0.1607843, 1,
1.870429, -0.5442059, 2.765712, 1, 0, 0.1568628, 1,
1.893684, 0.7471147, 1.79134, 1, 0, 0.1490196, 1,
1.922102, -0.6388514, 1.397719, 1, 0, 0.145098, 1,
1.985407, -0.1893836, 2.154974, 1, 0, 0.1372549, 1,
1.998408, -0.511191, 0.6692855, 1, 0, 0.1333333, 1,
2.001165, 0.5457879, 0.653743, 1, 0, 0.1254902, 1,
2.010448, 0.1306616, 0.4465332, 1, 0, 0.1215686, 1,
2.060215, 0.913084, -0.3404391, 1, 0, 0.1137255, 1,
2.062307, -0.2139838, 2.859631, 1, 0, 0.1098039, 1,
2.07112, 0.5372302, 0.3204017, 1, 0, 0.1019608, 1,
2.089038, -0.9966603, 0.6951173, 1, 0, 0.09411765, 1,
2.112046, 0.9845323, 0.08735355, 1, 0, 0.09019608, 1,
2.146096, -1.092353, 1.516946, 1, 0, 0.08235294, 1,
2.296557, -0.5571204, 0.849848, 1, 0, 0.07843138, 1,
2.407124, 1.422748, 2.085778, 1, 0, 0.07058824, 1,
2.411193, -0.259803, 0.8197354, 1, 0, 0.06666667, 1,
2.411426, -0.3366688, 1.545027, 1, 0, 0.05882353, 1,
2.526241, 1.666403, 1.045828, 1, 0, 0.05490196, 1,
2.616182, -1.677317, 1.899465, 1, 0, 0.04705882, 1,
2.645135, 0.05877347, 2.386436, 1, 0, 0.04313726, 1,
2.744962, -0.01117864, 1.67885, 1, 0, 0.03529412, 1,
2.84026, -0.4305409, 0.5701932, 1, 0, 0.03137255, 1,
2.842283, 0.5208818, 2.107452, 1, 0, 0.02352941, 1,
2.890793, 0.4913242, 2.990524, 1, 0, 0.01960784, 1,
3.086594, -1.604265, 2.708919, 1, 0, 0.01176471, 1,
3.630453, 1.480303, 1.994569, 1, 0, 0.007843138, 1
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
-0.3013631, -4.317085, -7.524055, 0, -0.5, 0.5, 0.5,
-0.3013631, -4.317085, -7.524055, 1, -0.5, 0.5, 0.5,
-0.3013631, -4.317085, -7.524055, 1, 1.5, 0.5, 0.5,
-0.3013631, -4.317085, -7.524055, 0, 1.5, 0.5, 0.5
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
-5.566065, 0.1570878, -7.524055, 0, -0.5, 0.5, 0.5,
-5.566065, 0.1570878, -7.524055, 1, -0.5, 0.5, 0.5,
-5.566065, 0.1570878, -7.524055, 1, 1.5, 0.5, 0.5,
-5.566065, 0.1570878, -7.524055, 0, 1.5, 0.5, 0.5
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
-5.566065, -4.317085, 0.1794035, 0, -0.5, 0.5, 0.5,
-5.566065, -4.317085, 0.1794035, 1, -0.5, 0.5, 0.5,
-5.566065, -4.317085, 0.1794035, 1, 1.5, 0.5, 0.5,
-5.566065, -4.317085, 0.1794035, 0, 1.5, 0.5, 0.5
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
-4, -3.284584, -5.746334,
2, -3.284584, -5.746334,
-4, -3.284584, -5.746334,
-4, -3.456667, -6.042621,
-2, -3.284584, -5.746334,
-2, -3.456667, -6.042621,
0, -3.284584, -5.746334,
0, -3.456667, -6.042621,
2, -3.284584, -5.746334,
2, -3.456667, -6.042621
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
-4, -3.800835, -6.635194, 0, -0.5, 0.5, 0.5,
-4, -3.800835, -6.635194, 1, -0.5, 0.5, 0.5,
-4, -3.800835, -6.635194, 1, 1.5, 0.5, 0.5,
-4, -3.800835, -6.635194, 0, 1.5, 0.5, 0.5,
-2, -3.800835, -6.635194, 0, -0.5, 0.5, 0.5,
-2, -3.800835, -6.635194, 1, -0.5, 0.5, 0.5,
-2, -3.800835, -6.635194, 1, 1.5, 0.5, 0.5,
-2, -3.800835, -6.635194, 0, 1.5, 0.5, 0.5,
0, -3.800835, -6.635194, 0, -0.5, 0.5, 0.5,
0, -3.800835, -6.635194, 1, -0.5, 0.5, 0.5,
0, -3.800835, -6.635194, 1, 1.5, 0.5, 0.5,
0, -3.800835, -6.635194, 0, 1.5, 0.5, 0.5,
2, -3.800835, -6.635194, 0, -0.5, 0.5, 0.5,
2, -3.800835, -6.635194, 1, -0.5, 0.5, 0.5,
2, -3.800835, -6.635194, 1, 1.5, 0.5, 0.5,
2, -3.800835, -6.635194, 0, 1.5, 0.5, 0.5
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
-4.351133, -3, -5.746334,
-4.351133, 3, -5.746334,
-4.351133, -3, -5.746334,
-4.553622, -3, -6.042621,
-4.351133, -2, -5.746334,
-4.553622, -2, -6.042621,
-4.351133, -1, -5.746334,
-4.553622, -1, -6.042621,
-4.351133, 0, -5.746334,
-4.553622, 0, -6.042621,
-4.351133, 1, -5.746334,
-4.553622, 1, -6.042621,
-4.351133, 2, -5.746334,
-4.553622, 2, -6.042621,
-4.351133, 3, -5.746334,
-4.553622, 3, -6.042621
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
-4.958599, -3, -6.635194, 0, -0.5, 0.5, 0.5,
-4.958599, -3, -6.635194, 1, -0.5, 0.5, 0.5,
-4.958599, -3, -6.635194, 1, 1.5, 0.5, 0.5,
-4.958599, -3, -6.635194, 0, 1.5, 0.5, 0.5,
-4.958599, -2, -6.635194, 0, -0.5, 0.5, 0.5,
-4.958599, -2, -6.635194, 1, -0.5, 0.5, 0.5,
-4.958599, -2, -6.635194, 1, 1.5, 0.5, 0.5,
-4.958599, -2, -6.635194, 0, 1.5, 0.5, 0.5,
-4.958599, -1, -6.635194, 0, -0.5, 0.5, 0.5,
-4.958599, -1, -6.635194, 1, -0.5, 0.5, 0.5,
-4.958599, -1, -6.635194, 1, 1.5, 0.5, 0.5,
-4.958599, -1, -6.635194, 0, 1.5, 0.5, 0.5,
-4.958599, 0, -6.635194, 0, -0.5, 0.5, 0.5,
-4.958599, 0, -6.635194, 1, -0.5, 0.5, 0.5,
-4.958599, 0, -6.635194, 1, 1.5, 0.5, 0.5,
-4.958599, 0, -6.635194, 0, 1.5, 0.5, 0.5,
-4.958599, 1, -6.635194, 0, -0.5, 0.5, 0.5,
-4.958599, 1, -6.635194, 1, -0.5, 0.5, 0.5,
-4.958599, 1, -6.635194, 1, 1.5, 0.5, 0.5,
-4.958599, 1, -6.635194, 0, 1.5, 0.5, 0.5,
-4.958599, 2, -6.635194, 0, -0.5, 0.5, 0.5,
-4.958599, 2, -6.635194, 1, -0.5, 0.5, 0.5,
-4.958599, 2, -6.635194, 1, 1.5, 0.5, 0.5,
-4.958599, 2, -6.635194, 0, 1.5, 0.5, 0.5,
-4.958599, 3, -6.635194, 0, -0.5, 0.5, 0.5,
-4.958599, 3, -6.635194, 1, -0.5, 0.5, 0.5,
-4.958599, 3, -6.635194, 1, 1.5, 0.5, 0.5,
-4.958599, 3, -6.635194, 0, 1.5, 0.5, 0.5
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
-4.351133, -3.284584, -4,
-4.351133, -3.284584, 4,
-4.351133, -3.284584, -4,
-4.553622, -3.456667, -4,
-4.351133, -3.284584, -2,
-4.553622, -3.456667, -2,
-4.351133, -3.284584, 0,
-4.553622, -3.456667, 0,
-4.351133, -3.284584, 2,
-4.553622, -3.456667, 2,
-4.351133, -3.284584, 4,
-4.553622, -3.456667, 4
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
-4.958599, -3.800835, -4, 0, -0.5, 0.5, 0.5,
-4.958599, -3.800835, -4, 1, -0.5, 0.5, 0.5,
-4.958599, -3.800835, -4, 1, 1.5, 0.5, 0.5,
-4.958599, -3.800835, -4, 0, 1.5, 0.5, 0.5,
-4.958599, -3.800835, -2, 0, -0.5, 0.5, 0.5,
-4.958599, -3.800835, -2, 1, -0.5, 0.5, 0.5,
-4.958599, -3.800835, -2, 1, 1.5, 0.5, 0.5,
-4.958599, -3.800835, -2, 0, 1.5, 0.5, 0.5,
-4.958599, -3.800835, 0, 0, -0.5, 0.5, 0.5,
-4.958599, -3.800835, 0, 1, -0.5, 0.5, 0.5,
-4.958599, -3.800835, 0, 1, 1.5, 0.5, 0.5,
-4.958599, -3.800835, 0, 0, 1.5, 0.5, 0.5,
-4.958599, -3.800835, 2, 0, -0.5, 0.5, 0.5,
-4.958599, -3.800835, 2, 1, -0.5, 0.5, 0.5,
-4.958599, -3.800835, 2, 1, 1.5, 0.5, 0.5,
-4.958599, -3.800835, 2, 0, 1.5, 0.5, 0.5,
-4.958599, -3.800835, 4, 0, -0.5, 0.5, 0.5,
-4.958599, -3.800835, 4, 1, -0.5, 0.5, 0.5,
-4.958599, -3.800835, 4, 1, 1.5, 0.5, 0.5,
-4.958599, -3.800835, 4, 0, 1.5, 0.5, 0.5
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
-4.351133, -3.284584, -5.746334,
-4.351133, 3.598759, -5.746334,
-4.351133, -3.284584, 6.105141,
-4.351133, 3.598759, 6.105141,
-4.351133, -3.284584, -5.746334,
-4.351133, -3.284584, 6.105141,
-4.351133, 3.598759, -5.746334,
-4.351133, 3.598759, 6.105141,
-4.351133, -3.284584, -5.746334,
3.748407, -3.284584, -5.746334,
-4.351133, -3.284584, 6.105141,
3.748407, -3.284584, 6.105141,
-4.351133, 3.598759, -5.746334,
3.748407, 3.598759, -5.746334,
-4.351133, 3.598759, 6.105141,
3.748407, 3.598759, 6.105141,
3.748407, -3.284584, -5.746334,
3.748407, 3.598759, -5.746334,
3.748407, -3.284584, 6.105141,
3.748407, 3.598759, 6.105141,
3.748407, -3.284584, -5.746334,
3.748407, -3.284584, 6.105141,
3.748407, 3.598759, -5.746334,
3.748407, 3.598759, 6.105141
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
var radius = 8.500871;
var distance = 37.82133;
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
mvMatrix.translate( 0.3013631, -0.1570878, -0.1794035 );
mvMatrix.scale( 1.134794, 1.335297, 0.7755413 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.82133);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
furathiocarb<-read.table("furathiocarb.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-furathiocarb$V2
```

```
## Error in eval(expr, envir, enclos): object 'furathiocarb' not found
```

```r
y<-furathiocarb$V3
```

```
## Error in eval(expr, envir, enclos): object 'furathiocarb' not found
```

```r
z<-furathiocarb$V4
```

```
## Error in eval(expr, envir, enclos): object 'furathiocarb' not found
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
-4.233179, 0.3388697, -1.687399, 0, 0, 1, 1, 1,
-3.520651, -0.263065, 0.3277728, 1, 0, 0, 1, 1,
-3.264539, 0.3816178, -2.646176, 1, 0, 0, 1, 1,
-2.800539, 0.02452965, -2.146441, 1, 0, 0, 1, 1,
-2.679272, -0.3473184, -4.164035, 1, 0, 0, 1, 1,
-2.676027, -2.309724, -2.469193, 1, 0, 0, 1, 1,
-2.396468, 1.227855, -0.7654532, 0, 0, 0, 1, 1,
-2.310889, -0.9000165, -2.907984, 0, 0, 0, 1, 1,
-2.30008, -0.7224135, -2.539739, 0, 0, 0, 1, 1,
-2.268861, -1.080327, -0.6147909, 0, 0, 0, 1, 1,
-2.191608, -1.391742, -2.274928, 0, 0, 0, 1, 1,
-2.19107, 1.582591, -1.261645, 0, 0, 0, 1, 1,
-2.178489, -0.4669294, -0.9921098, 0, 0, 0, 1, 1,
-2.141235, 0.5995182, -1.44215, 1, 1, 1, 1, 1,
-2.120439, -1.187003, -1.506425, 1, 1, 1, 1, 1,
-2.110749, -1.181534, -0.8210992, 1, 1, 1, 1, 1,
-2.09398, -2.282504, -1.62825, 1, 1, 1, 1, 1,
-2.084257, 1.402493, 0.2571317, 1, 1, 1, 1, 1,
-2.064521, -0.9076543, -2.203904, 1, 1, 1, 1, 1,
-2.005523, 0.2859574, -2.247224, 1, 1, 1, 1, 1,
-1.994814, -0.1700706, -1.566487, 1, 1, 1, 1, 1,
-1.956962, 0.7559757, -1.555929, 1, 1, 1, 1, 1,
-1.928216, 1.303934, -0.4150099, 1, 1, 1, 1, 1,
-1.927559, 0.9478163, -2.862043, 1, 1, 1, 1, 1,
-1.916489, 0.2919974, -2.298781, 1, 1, 1, 1, 1,
-1.912667, -0.08637553, -1.514675, 1, 1, 1, 1, 1,
-1.905127, -0.6220182, -1.718646, 1, 1, 1, 1, 1,
-1.879945, -0.0189924, -1.34912, 1, 1, 1, 1, 1,
-1.873055, 1.215626, -1.645503, 0, 0, 1, 1, 1,
-1.870353, 0.8357402, -1.133391, 1, 0, 0, 1, 1,
-1.86496, 0.4392862, -0.08756642, 1, 0, 0, 1, 1,
-1.848186, -0.2793539, -2.516999, 1, 0, 0, 1, 1,
-1.847719, -0.7792709, -2.374527, 1, 0, 0, 1, 1,
-1.843148, -0.4135887, -1.563244, 1, 0, 0, 1, 1,
-1.828578, -0.2303587, -2.824345, 0, 0, 0, 1, 1,
-1.825126, -0.2414795, -1.472603, 0, 0, 0, 1, 1,
-1.789888, 1.554761, -0.5195383, 0, 0, 0, 1, 1,
-1.786094, -1.320262, -2.054711, 0, 0, 0, 1, 1,
-1.76867, -0.768814, -1.649604, 0, 0, 0, 1, 1,
-1.747548, 0.7307241, -0.9427358, 0, 0, 0, 1, 1,
-1.743356, 0.7955375, -0.2114455, 0, 0, 0, 1, 1,
-1.736089, 1.395126, -2.078401, 1, 1, 1, 1, 1,
-1.725391, -0.2754376, -2.998632, 1, 1, 1, 1, 1,
-1.723711, -0.7320822, -1.118378, 1, 1, 1, 1, 1,
-1.708031, 0.480611, -1.719558, 1, 1, 1, 1, 1,
-1.70724, 1.041454, -2.325064, 1, 1, 1, 1, 1,
-1.707199, 0.5293769, 0.568096, 1, 1, 1, 1, 1,
-1.699069, 1.281979, -1.481364, 1, 1, 1, 1, 1,
-1.674834, 2.113112, 0.2739344, 1, 1, 1, 1, 1,
-1.664876, 0.4545741, -1.897243, 1, 1, 1, 1, 1,
-1.657906, -0.3422723, -0.9404221, 1, 1, 1, 1, 1,
-1.649617, 0.9070403, -2.618208, 1, 1, 1, 1, 1,
-1.642054, -2.551598, -4.841658, 1, 1, 1, 1, 1,
-1.635252, 0.8241895, -0.5833811, 1, 1, 1, 1, 1,
-1.629546, 0.09985144, -2.263319, 1, 1, 1, 1, 1,
-1.626219, -1.451171, -1.815172, 1, 1, 1, 1, 1,
-1.619761, 0.3712308, -1.068275, 0, 0, 1, 1, 1,
-1.61731, 0.04269808, -1.025679, 1, 0, 0, 1, 1,
-1.613878, -1.377887, -3.753474, 1, 0, 0, 1, 1,
-1.593412, -0.1882975, -2.584813, 1, 0, 0, 1, 1,
-1.577881, -0.5448182, -3.517192, 1, 0, 0, 1, 1,
-1.577553, -0.180226, -3.154932, 1, 0, 0, 1, 1,
-1.576075, 0.880039, -0.731833, 0, 0, 0, 1, 1,
-1.531315, 0.3595619, -0.0125714, 0, 0, 0, 1, 1,
-1.523297, -1.647721, -3.446208, 0, 0, 0, 1, 1,
-1.514347, -0.8155749, -2.6953, 0, 0, 0, 1, 1,
-1.513826, 0.4296187, -2.097465, 0, 0, 0, 1, 1,
-1.507414, 1.857134, -0.3742223, 0, 0, 0, 1, 1,
-1.506253, -0.3380533, -2.54809, 0, 0, 0, 1, 1,
-1.505401, -0.8789839, -3.004238, 1, 1, 1, 1, 1,
-1.501937, -0.2432668, -0.3785651, 1, 1, 1, 1, 1,
-1.495505, 0.129851, -1.630757, 1, 1, 1, 1, 1,
-1.492191, 0.7231002, 0.07426849, 1, 1, 1, 1, 1,
-1.489502, 0.2240461, -1.329107, 1, 1, 1, 1, 1,
-1.456975, -0.2654117, -2.409771, 1, 1, 1, 1, 1,
-1.433299, -0.8283627, -0.9449362, 1, 1, 1, 1, 1,
-1.427216, 0.4399131, -1.999858, 1, 1, 1, 1, 1,
-1.421469, -0.002358609, -3.572365, 1, 1, 1, 1, 1,
-1.411939, -0.6556961, -4.167808, 1, 1, 1, 1, 1,
-1.405495, 1.66156, 0.5288802, 1, 1, 1, 1, 1,
-1.404536, 0.3705961, -1.036402, 1, 1, 1, 1, 1,
-1.403764, 1.405493, -1.011342, 1, 1, 1, 1, 1,
-1.402152, 0.9228097, -0.6826078, 1, 1, 1, 1, 1,
-1.401923, -1.524614, -3.234472, 1, 1, 1, 1, 1,
-1.396905, 1.537111, -2.030118, 0, 0, 1, 1, 1,
-1.386783, -0.1751233, -2.887396, 1, 0, 0, 1, 1,
-1.386183, 1.634124, -1.413699, 1, 0, 0, 1, 1,
-1.385998, 0.542179, -1.509954, 1, 0, 0, 1, 1,
-1.384505, -0.2086897, -2.310292, 1, 0, 0, 1, 1,
-1.380595, 3.075711, -0.4230155, 1, 0, 0, 1, 1,
-1.376961, 1.992344, -0.4736977, 0, 0, 0, 1, 1,
-1.373719, -2.699163, -1.848093, 0, 0, 0, 1, 1,
-1.366112, 0.655466, -0.7637095, 0, 0, 0, 1, 1,
-1.359985, -1.470865, -3.024368, 0, 0, 0, 1, 1,
-1.357212, -0.2599367, -4.678928, 0, 0, 0, 1, 1,
-1.357192, -0.1403739, -1.753282, 0, 0, 0, 1, 1,
-1.353884, -1.748954, -3.131269, 0, 0, 0, 1, 1,
-1.335462, -0.5444558, -1.322052, 1, 1, 1, 1, 1,
-1.332286, -1.627645, -2.692732, 1, 1, 1, 1, 1,
-1.317636, 0.04462678, -1.126383, 1, 1, 1, 1, 1,
-1.31388, 0.3382868, 0.2256725, 1, 1, 1, 1, 1,
-1.313576, -2.588035, -1.892516, 1, 1, 1, 1, 1,
-1.304413, -1.171926, -1.449694, 1, 1, 1, 1, 1,
-1.299096, -1.454362, -1.349383, 1, 1, 1, 1, 1,
-1.255908, -1.140917, -2.909963, 1, 1, 1, 1, 1,
-1.246895, -0.5358225, -2.262037, 1, 1, 1, 1, 1,
-1.240916, -0.2230828, -1.673086, 1, 1, 1, 1, 1,
-1.235905, 0.966864, 0.6622519, 1, 1, 1, 1, 1,
-1.232163, -0.004623504, -1.362693, 1, 1, 1, 1, 1,
-1.222974, 0.3705172, -2.164086, 1, 1, 1, 1, 1,
-1.221446, -0.6326189, -2.026268, 1, 1, 1, 1, 1,
-1.212829, 0.495114, -1.545306, 1, 1, 1, 1, 1,
-1.211785, -0.5792183, -0.5593324, 0, 0, 1, 1, 1,
-1.205614, 1.945882, -0.7541106, 1, 0, 0, 1, 1,
-1.201778, 0.552844, -0.4001125, 1, 0, 0, 1, 1,
-1.199077, 1.955288, -1.113358, 1, 0, 0, 1, 1,
-1.185616, -0.2605368, -1.652373, 1, 0, 0, 1, 1,
-1.183843, -2.416474, -0.7438302, 1, 0, 0, 1, 1,
-1.182286, -1.964749, -3.502031, 0, 0, 0, 1, 1,
-1.179033, 0.01898861, -0.9926257, 0, 0, 0, 1, 1,
-1.169545, -0.4647458, -0.6396989, 0, 0, 0, 1, 1,
-1.162907, 0.6755961, -0.6347478, 0, 0, 0, 1, 1,
-1.161145, -0.2981452, -2.218552, 0, 0, 0, 1, 1,
-1.158691, 0.727219, -0.9472071, 0, 0, 0, 1, 1,
-1.156949, -1.872009, -4.132682, 0, 0, 0, 1, 1,
-1.153615, 2.000951, -2.201754, 1, 1, 1, 1, 1,
-1.146709, -0.5251422, -2.298038, 1, 1, 1, 1, 1,
-1.146575, 0.188281, -1.623738, 1, 1, 1, 1, 1,
-1.13969, -1.013917, -0.7481145, 1, 1, 1, 1, 1,
-1.135403, 0.2439754, -1.737903, 1, 1, 1, 1, 1,
-1.131113, 1.113166, -2.782007, 1, 1, 1, 1, 1,
-1.117693, -1.505469, -3.181968, 1, 1, 1, 1, 1,
-1.115782, 0.6958361, -1.040942, 1, 1, 1, 1, 1,
-1.114349, 0.5365943, -0.7182153, 1, 1, 1, 1, 1,
-1.11381, 0.4291992, -0.5415536, 1, 1, 1, 1, 1,
-1.110179, 0.6329194, -0.9381047, 1, 1, 1, 1, 1,
-1.106331, -0.3860472, -0.6257198, 1, 1, 1, 1, 1,
-1.09865, 1.514309, -2.072178, 1, 1, 1, 1, 1,
-1.089222, -2.012498, -3.577366, 1, 1, 1, 1, 1,
-1.085678, 0.05261057, -1.335253, 1, 1, 1, 1, 1,
-1.083689, 0.3522826, -0.7973652, 0, 0, 1, 1, 1,
-1.081341, -2.758767, -1.01154, 1, 0, 0, 1, 1,
-1.071935, -0.5936317, -3.389759, 1, 0, 0, 1, 1,
-1.07055, 0.6935864, -1.102663, 1, 0, 0, 1, 1,
-1.069467, 0.6609234, -0.582474, 1, 0, 0, 1, 1,
-1.067488, 0.9272098, -1.36947, 1, 0, 0, 1, 1,
-1.064278, 1.124367, -1.716228, 0, 0, 0, 1, 1,
-1.052814, 0.2879773, -1.211159, 0, 0, 0, 1, 1,
-1.047876, -1.833986, -3.566642, 0, 0, 0, 1, 1,
-1.033854, -0.6369203, -1.691598, 0, 0, 0, 1, 1,
-1.032935, 0.2673643, -2.637094, 0, 0, 0, 1, 1,
-1.031458, -1.927285, -2.110643, 0, 0, 0, 1, 1,
-1.02415, -0.6688196, -3.030864, 0, 0, 0, 1, 1,
-1.00693, -0.1603493, -0.6667754, 1, 1, 1, 1, 1,
-0.9937689, 1.297103, -0.639252, 1, 1, 1, 1, 1,
-0.9919707, 1.05989, 0.002751543, 1, 1, 1, 1, 1,
-0.9903752, 1.201503, -2.083832, 1, 1, 1, 1, 1,
-0.9882796, -1.516176, -2.397694, 1, 1, 1, 1, 1,
-0.9871315, 1.088059, -1.976521, 1, 1, 1, 1, 1,
-0.9761053, 0.5844296, -0.8521374, 1, 1, 1, 1, 1,
-0.9727516, -0.004240421, -3.332619, 1, 1, 1, 1, 1,
-0.9679782, 0.1199793, -0.9150655, 1, 1, 1, 1, 1,
-0.9665508, -3.184341, -3.199823, 1, 1, 1, 1, 1,
-0.9647232, -1.161588, -1.845864, 1, 1, 1, 1, 1,
-0.9613446, 0.1150997, -1.149483, 1, 1, 1, 1, 1,
-0.9603086, 0.2799734, 0.2554538, 1, 1, 1, 1, 1,
-0.9539379, -0.08435883, -1.311484, 1, 1, 1, 1, 1,
-0.949827, 1.124674, -0.868128, 1, 1, 1, 1, 1,
-0.9317423, -0.4032591, -2.302792, 0, 0, 1, 1, 1,
-0.9299899, -0.1918672, -3.711931, 1, 0, 0, 1, 1,
-0.9283255, 0.2242403, -1.521423, 1, 0, 0, 1, 1,
-0.928176, 0.128057, -1.760897, 1, 0, 0, 1, 1,
-0.9281061, 0.5826448, -1.528287, 1, 0, 0, 1, 1,
-0.9265733, -0.9884893, -0.3811345, 1, 0, 0, 1, 1,
-0.9210621, 1.020031, 0.5948941, 0, 0, 0, 1, 1,
-0.9162838, 1.2226, -0.7733331, 0, 0, 0, 1, 1,
-0.9105688, 1.581657, -1.079145, 0, 0, 0, 1, 1,
-0.9099895, 0.02528101, -1.821931, 0, 0, 0, 1, 1,
-0.904884, -0.6855698, -1.423781, 0, 0, 0, 1, 1,
-0.901951, -0.1938999, -1.8805, 0, 0, 0, 1, 1,
-0.8980255, -0.9142987, -1.481158, 0, 0, 0, 1, 1,
-0.890214, -0.303768, -2.585501, 1, 1, 1, 1, 1,
-0.8861699, -0.4333839, -1.861115, 1, 1, 1, 1, 1,
-0.8861291, -0.6232692, -3.976809, 1, 1, 1, 1, 1,
-0.882172, 1.297669, -0.5181924, 1, 1, 1, 1, 1,
-0.8692857, -0.4478287, -2.675959, 1, 1, 1, 1, 1,
-0.8653123, 1.608271, -0.8361989, 1, 1, 1, 1, 1,
-0.8609076, -0.6374577, -2.121264, 1, 1, 1, 1, 1,
-0.8569356, -1.871835, -4.684904, 1, 1, 1, 1, 1,
-0.8455676, 1.647476, -0.5946058, 1, 1, 1, 1, 1,
-0.8433661, 1.418672, -0.4996702, 1, 1, 1, 1, 1,
-0.8428773, 0.4895684, -0.1511892, 1, 1, 1, 1, 1,
-0.8413473, 0.4004632, -0.8642451, 1, 1, 1, 1, 1,
-0.8386151, -0.2152778, -2.263019, 1, 1, 1, 1, 1,
-0.8354817, -0.5109345, -3.156637, 1, 1, 1, 1, 1,
-0.8349894, -0.0264828, -2.956859, 1, 1, 1, 1, 1,
-0.8344588, 0.2636408, -0.8759406, 0, 0, 1, 1, 1,
-0.8330555, 2.197284, -1.624621, 1, 0, 0, 1, 1,
-0.8236769, -1.263186, -3.122641, 1, 0, 0, 1, 1,
-0.8211753, -0.06186896, -0.3658632, 1, 0, 0, 1, 1,
-0.8199782, 1.162045, -0.5900683, 1, 0, 0, 1, 1,
-0.8158336, -0.3868045, -1.367667, 1, 0, 0, 1, 1,
-0.8118305, -0.6870629, -2.804953, 0, 0, 0, 1, 1,
-0.8110122, 1.990684, -2.450887, 0, 0, 0, 1, 1,
-0.8093168, -1.288985, -2.716348, 0, 0, 0, 1, 1,
-0.8071363, 0.2694769, -1.166504, 0, 0, 0, 1, 1,
-0.8042782, 0.1340342, -0.5453143, 0, 0, 0, 1, 1,
-0.7983826, 1.512275, -0.6090822, 0, 0, 0, 1, 1,
-0.795077, -0.4701906, -1.912141, 0, 0, 0, 1, 1,
-0.7948098, -1.813255, -2.608575, 1, 1, 1, 1, 1,
-0.7757089, -0.2751386, -2.999229, 1, 1, 1, 1, 1,
-0.7672859, -0.3846963, -1.820056, 1, 1, 1, 1, 1,
-0.7575429, 0.1131011, -3.158171, 1, 1, 1, 1, 1,
-0.7428864, -2.054523, -4.894127, 1, 1, 1, 1, 1,
-0.7425971, -2.011791, -2.628313, 1, 1, 1, 1, 1,
-0.7377809, -1.972772, -2.628086, 1, 1, 1, 1, 1,
-0.7366626, -0.3838474, -1.090351, 1, 1, 1, 1, 1,
-0.7295911, -0.966463, -1.087048, 1, 1, 1, 1, 1,
-0.7265077, -0.922313, -1.302732, 1, 1, 1, 1, 1,
-0.7239503, -0.02367548, -2.574008, 1, 1, 1, 1, 1,
-0.7219829, -0.490252, -2.907811, 1, 1, 1, 1, 1,
-0.7007124, -0.769366, -1.175927, 1, 1, 1, 1, 1,
-0.6972786, -1.499766, -3.08381, 1, 1, 1, 1, 1,
-0.6935788, 0.2380528, -0.08922125, 1, 1, 1, 1, 1,
-0.6935542, 0.8794752, -0.4057006, 0, 0, 1, 1, 1,
-0.6912794, -1.427751, -3.6867, 1, 0, 0, 1, 1,
-0.6906147, 0.2970507, -2.075898, 1, 0, 0, 1, 1,
-0.6881867, -0.8236852, -3.666227, 1, 0, 0, 1, 1,
-0.687944, 1.095771, 0.8333153, 1, 0, 0, 1, 1,
-0.6820205, 0.4461432, -1.346568, 1, 0, 0, 1, 1,
-0.6818163, 0.05416844, -1.7118, 0, 0, 0, 1, 1,
-0.6807078, -0.8945567, -2.654872, 0, 0, 0, 1, 1,
-0.6766881, -0.1576377, -3.381678, 0, 0, 0, 1, 1,
-0.67145, 2.516051, 0.5245541, 0, 0, 0, 1, 1,
-0.6672428, -0.2156487, -2.934993, 0, 0, 0, 1, 1,
-0.6665828, 1.020791, -0.7472645, 0, 0, 0, 1, 1,
-0.665503, -0.4076197, -1.718439, 0, 0, 0, 1, 1,
-0.6596454, 0.5885866, 0.2268553, 1, 1, 1, 1, 1,
-0.659048, -0.36877, -1.269457, 1, 1, 1, 1, 1,
-0.6573668, -0.3143866, -2.22825, 1, 1, 1, 1, 1,
-0.6561844, 0.8668656, -0.4608925, 1, 1, 1, 1, 1,
-0.6556621, -1.414943, -3.206563, 1, 1, 1, 1, 1,
-0.6548128, 0.498049, -0.4380105, 1, 1, 1, 1, 1,
-0.6539807, 2.130244, 0.2693467, 1, 1, 1, 1, 1,
-0.6533058, 0.2575562, -2.919363, 1, 1, 1, 1, 1,
-0.6503178, 2.210156, -1.023562, 1, 1, 1, 1, 1,
-0.6492344, 0.6440297, -1.352443, 1, 1, 1, 1, 1,
-0.6486222, 0.0416675, -1.604077, 1, 1, 1, 1, 1,
-0.6468325, 1.099656, 0.5474226, 1, 1, 1, 1, 1,
-0.644314, -0.7613773, -1.932126, 1, 1, 1, 1, 1,
-0.6441641, 0.2785039, -2.399255, 1, 1, 1, 1, 1,
-0.63963, 2.311797, 1.197201, 1, 1, 1, 1, 1,
-0.6380567, 2.44251, 0.7685062, 0, 0, 1, 1, 1,
-0.6371307, 1.113137, -2.209951, 1, 0, 0, 1, 1,
-0.6363866, 0.1922798, 0.1554151, 1, 0, 0, 1, 1,
-0.631215, -0.07682483, -1.579206, 1, 0, 0, 1, 1,
-0.630248, 0.5163603, -1.28142, 1, 0, 0, 1, 1,
-0.6290524, -0.04754468, -2.100061, 1, 0, 0, 1, 1,
-0.6287655, 0.8192965, -1.626887, 0, 0, 0, 1, 1,
-0.6276225, 0.731421, 0.7968531, 0, 0, 0, 1, 1,
-0.6263403, -0.20749, -3.295652, 0, 0, 0, 1, 1,
-0.6249506, -1.396109, -2.395221, 0, 0, 0, 1, 1,
-0.6237827, 0.03062343, -0.3777456, 0, 0, 0, 1, 1,
-0.6202998, 1.200748, -1.09822, 0, 0, 0, 1, 1,
-0.6202039, 9.603477e-05, -2.401851, 0, 0, 0, 1, 1,
-0.6185324, -1.255393, -2.185755, 1, 1, 1, 1, 1,
-0.6158658, 0.7798384, -1.028899, 1, 1, 1, 1, 1,
-0.6128042, -0.1439618, -2.217521, 1, 1, 1, 1, 1,
-0.6125957, -0.4958946, -2.93577, 1, 1, 1, 1, 1,
-0.6060397, 1.914063, -2.269633, 1, 1, 1, 1, 1,
-0.6046513, -0.2020521, -1.042926, 1, 1, 1, 1, 1,
-0.6046345, -2.312807, -3.279189, 1, 1, 1, 1, 1,
-0.6045757, -0.04071729, -2.658319, 1, 1, 1, 1, 1,
-0.5971981, -0.1015432, -2.812639, 1, 1, 1, 1, 1,
-0.5971583, -0.2175272, -2.467759, 1, 1, 1, 1, 1,
-0.5903756, -0.4935623, -2.726912, 1, 1, 1, 1, 1,
-0.5886571, 0.4772389, -2.814949, 1, 1, 1, 1, 1,
-0.5854063, 1.118743, -0.3776157, 1, 1, 1, 1, 1,
-0.5851781, -1.997561, -2.164229, 1, 1, 1, 1, 1,
-0.5825577, -1.244499, -1.777703, 1, 1, 1, 1, 1,
-0.5785625, -1.626189, -4.249235, 0, 0, 1, 1, 1,
-0.577154, -2.554432, -2.122591, 1, 0, 0, 1, 1,
-0.5641499, 0.3946827, -1.406627, 1, 0, 0, 1, 1,
-0.5631651, 0.1766182, -0.5426131, 1, 0, 0, 1, 1,
-0.5626416, -1.099178, -3.70701, 1, 0, 0, 1, 1,
-0.5604395, -1.066896, -2.962054, 1, 0, 0, 1, 1,
-0.5462682, -0.6443059, -2.225641, 0, 0, 0, 1, 1,
-0.5397037, -1.180189, -0.6369341, 0, 0, 0, 1, 1,
-0.5388417, -1.611606, -1.792184, 0, 0, 0, 1, 1,
-0.5373766, 0.5439842, -0.1928789, 0, 0, 0, 1, 1,
-0.5369987, 0.460857, -0.02180873, 0, 0, 0, 1, 1,
-0.5347824, 1.418167, -1.218283, 0, 0, 0, 1, 1,
-0.5291853, 1.53827, -0.6556299, 0, 0, 0, 1, 1,
-0.5281518, 0.2876299, -0.8580089, 1, 1, 1, 1, 1,
-0.5281023, -1.237561, -1.165692, 1, 1, 1, 1, 1,
-0.5248823, -1.328495, -2.89417, 1, 1, 1, 1, 1,
-0.52459, -2.112576, -4.744432, 1, 1, 1, 1, 1,
-0.5213498, -0.7976728, -2.33317, 1, 1, 1, 1, 1,
-0.519522, -0.3795484, -2.158347, 1, 1, 1, 1, 1,
-0.5160279, -1.591355, -2.187553, 1, 1, 1, 1, 1,
-0.5150698, -0.3554625, -1.901101, 1, 1, 1, 1, 1,
-0.5114199, -1.402686, -1.50444, 1, 1, 1, 1, 1,
-0.5078502, 0.0375683, -0.07825647, 1, 1, 1, 1, 1,
-0.505697, -0.4388065, -2.027133, 1, 1, 1, 1, 1,
-0.5051377, -0.1845583, -1.010279, 1, 1, 1, 1, 1,
-0.5044073, -1.445034, -1.985281, 1, 1, 1, 1, 1,
-0.5014078, 0.1517565, -2.290298, 1, 1, 1, 1, 1,
-0.5012404, -0.6849722, -2.851797, 1, 1, 1, 1, 1,
-0.500356, 0.03908151, -2.201654, 0, 0, 1, 1, 1,
-0.4999948, 0.9353488, -0.04525637, 1, 0, 0, 1, 1,
-0.4970463, 0.414714, 0.5300878, 1, 0, 0, 1, 1,
-0.4923898, -0.03354793, -2.09901, 1, 0, 0, 1, 1,
-0.4915526, -0.001397275, -1.644737, 1, 0, 0, 1, 1,
-0.4893863, 1.161094, 1.194332, 1, 0, 0, 1, 1,
-0.4888215, -1.551536, -3.385968, 0, 0, 0, 1, 1,
-0.4818481, -0.1777948, -2.612324, 0, 0, 0, 1, 1,
-0.4809719, 0.5371277, -1.756322, 0, 0, 0, 1, 1,
-0.4790316, 1.228421, -1.197947, 0, 0, 0, 1, 1,
-0.4738315, -1.164838, -2.729145, 0, 0, 0, 1, 1,
-0.4706069, 2.775011, -0.2136985, 0, 0, 0, 1, 1,
-0.4685046, 0.06155301, -2.147147, 0, 0, 0, 1, 1,
-0.4682065, -1.600843, -3.712635, 1, 1, 1, 1, 1,
-0.4675916, 1.456284, -1.105613, 1, 1, 1, 1, 1,
-0.46404, -1.778955, -2.693189, 1, 1, 1, 1, 1,
-0.4638587, 0.6381887, -1.352542, 1, 1, 1, 1, 1,
-0.4558068, 2.797949, -0.3503153, 1, 1, 1, 1, 1,
-0.4540227, -0.5435112, -1.759956, 1, 1, 1, 1, 1,
-0.4539075, -0.4624186, -2.426553, 1, 1, 1, 1, 1,
-0.4471335, -1.136639, -1.80895, 1, 1, 1, 1, 1,
-0.4450464, -0.3474239, -3.900084, 1, 1, 1, 1, 1,
-0.4438148, -0.8459108, -2.548018, 1, 1, 1, 1, 1,
-0.4419637, -0.8345235, -1.876286, 1, 1, 1, 1, 1,
-0.4414712, 0.109296, -1.084951, 1, 1, 1, 1, 1,
-0.4375052, 1.511964, -1.048393, 1, 1, 1, 1, 1,
-0.4346914, 0.3258143, -1.764743, 1, 1, 1, 1, 1,
-0.4328466, -0.2925552, -1.914606, 1, 1, 1, 1, 1,
-0.4326929, 0.486193, -0.416496, 0, 0, 1, 1, 1,
-0.432446, 2.443848, 0.08212283, 1, 0, 0, 1, 1,
-0.4320417, 1.978002, 0.1999849, 1, 0, 0, 1, 1,
-0.4308334, -0.6653106, -2.127535, 1, 0, 0, 1, 1,
-0.4301449, -1.302753, -2.735883, 1, 0, 0, 1, 1,
-0.4167645, -0.460855, -0.9223536, 1, 0, 0, 1, 1,
-0.4138676, 0.09381235, -1.350806, 0, 0, 0, 1, 1,
-0.410948, -0.6486854, -1.945437, 0, 0, 0, 1, 1,
-0.4076926, 0.07367098, -0.8260345, 0, 0, 0, 1, 1,
-0.4063909, 1.347384, 0.2566695, 0, 0, 0, 1, 1,
-0.4027186, -0.2196708, -1.034049, 0, 0, 0, 1, 1,
-0.3958549, -0.3488205, -4.443089, 0, 0, 0, 1, 1,
-0.394584, -0.005612856, -0.7690705, 0, 0, 0, 1, 1,
-0.3943425, 0.2368692, 0.9351878, 1, 1, 1, 1, 1,
-0.3871384, 0.5612308, 0.04896762, 1, 1, 1, 1, 1,
-0.3840378, -0.7925871, -2.630211, 1, 1, 1, 1, 1,
-0.3830115, -2.517751, -3.254204, 1, 1, 1, 1, 1,
-0.3811722, -0.3024289, -1.460119, 1, 1, 1, 1, 1,
-0.3806466, 1.803322, 0.08037822, 1, 1, 1, 1, 1,
-0.3788812, 1.758371, -0.2321227, 1, 1, 1, 1, 1,
-0.3782995, -0.004369225, -1.069507, 1, 1, 1, 1, 1,
-0.3707907, 0.06063908, -1.899045, 1, 1, 1, 1, 1,
-0.370546, 1.414395, -0.7746167, 1, 1, 1, 1, 1,
-0.3693405, -0.1678406, -3.129341, 1, 1, 1, 1, 1,
-0.3653927, -1.810525, -3.768188, 1, 1, 1, 1, 1,
-0.3645421, 1.208869, -0.5426098, 1, 1, 1, 1, 1,
-0.3591671, -0.8549973, -4.1703, 1, 1, 1, 1, 1,
-0.3525688, -0.1461171, -2.168599, 1, 1, 1, 1, 1,
-0.3521334, -0.4257351, -1.294595, 0, 0, 1, 1, 1,
-0.3513666, 0.4900363, -0.9854103, 1, 0, 0, 1, 1,
-0.3499754, 1.185381, 0.2731739, 1, 0, 0, 1, 1,
-0.3497501, 0.9409631, 0.7631022, 1, 0, 0, 1, 1,
-0.3483638, 0.003066821, -2.964849, 1, 0, 0, 1, 1,
-0.3480829, 1.175808, -0.3573965, 1, 0, 0, 1, 1,
-0.3427149, -1.534146, -3.359027, 0, 0, 0, 1, 1,
-0.3394952, 0.1452636, -1.266185, 0, 0, 0, 1, 1,
-0.3393195, 1.656584, 0.2498078, 0, 0, 0, 1, 1,
-0.3373471, -0.1573435, -0.1939652, 0, 0, 0, 1, 1,
-0.3369666, 0.597914, 0.01084352, 0, 0, 0, 1, 1,
-0.3368561, -0.01772608, -2.873442, 0, 0, 0, 1, 1,
-0.3343162, 0.7988174, 0.6442428, 0, 0, 0, 1, 1,
-0.3313563, 1.52426, -0.7733795, 1, 1, 1, 1, 1,
-0.3296597, 0.1278362, -2.075633, 1, 1, 1, 1, 1,
-0.3295629, 0.5512308, 0.06675944, 1, 1, 1, 1, 1,
-0.3292493, 0.3905885, -1.459105, 1, 1, 1, 1, 1,
-0.3255399, 1.691734, 0.4216689, 1, 1, 1, 1, 1,
-0.3248618, 0.6065492, -0.01302614, 1, 1, 1, 1, 1,
-0.3221811, -0.7046444, -3.319115, 1, 1, 1, 1, 1,
-0.3150986, 0.6994745, 0.1267025, 1, 1, 1, 1, 1,
-0.3146791, -0.155717, -2.664632, 1, 1, 1, 1, 1,
-0.3128749, -0.6799583, -2.890415, 1, 1, 1, 1, 1,
-0.3112294, -0.5226682, -2.258874, 1, 1, 1, 1, 1,
-0.2989429, 0.3614771, -2.96068, 1, 1, 1, 1, 1,
-0.2960032, 0.5835707, -1.438882, 1, 1, 1, 1, 1,
-0.2894274, -0.6948229, -1.999871, 1, 1, 1, 1, 1,
-0.2869325, 0.6521991, -0.3061727, 1, 1, 1, 1, 1,
-0.2827181, -0.3187361, -2.464484, 0, 0, 1, 1, 1,
-0.2826765, -0.7199237, -2.375899, 1, 0, 0, 1, 1,
-0.2807493, -0.6537092, -3.811965, 1, 0, 0, 1, 1,
-0.2781631, 0.4916465, -0.2138016, 1, 0, 0, 1, 1,
-0.2754295, -0.4122802, -3.49865, 1, 0, 0, 1, 1,
-0.2625699, 0.1914315, -2.024429, 1, 0, 0, 1, 1,
-0.2615586, -0.4373078, -2.909044, 0, 0, 0, 1, 1,
-0.2608492, -1.478229, -4.969937, 0, 0, 0, 1, 1,
-0.259774, -0.9546775, -1.149497, 0, 0, 0, 1, 1,
-0.2597171, -0.1293656, -3.231701, 0, 0, 0, 1, 1,
-0.2524901, -1.351254, -2.673203, 0, 0, 0, 1, 1,
-0.2521713, -0.2135314, -3.700588, 0, 0, 0, 1, 1,
-0.2515743, -0.6342894, -3.350794, 0, 0, 0, 1, 1,
-0.2500223, -1.594419, -3.574374, 1, 1, 1, 1, 1,
-0.2428908, -0.8853091, -2.463248, 1, 1, 1, 1, 1,
-0.2396508, -0.8260072, -2.063513, 1, 1, 1, 1, 1,
-0.2387291, -1.2072, -2.194658, 1, 1, 1, 1, 1,
-0.2342473, 0.3019612, -1.264645, 1, 1, 1, 1, 1,
-0.2340557, 0.1122507, -0.8246266, 1, 1, 1, 1, 1,
-0.2326809, 2.505331, -0.564508, 1, 1, 1, 1, 1,
-0.2319968, 0.9571424, 0.9870442, 1, 1, 1, 1, 1,
-0.2288301, 0.2632865, -0.7419589, 1, 1, 1, 1, 1,
-0.2265668, -1.22751, -2.556732, 1, 1, 1, 1, 1,
-0.2256006, 0.5335021, -0.3668877, 1, 1, 1, 1, 1,
-0.2223304, -0.9420865, -3.10703, 1, 1, 1, 1, 1,
-0.2168646, -1.371738, -3.998928, 1, 1, 1, 1, 1,
-0.2143368, -1.923934, -4.320178, 1, 1, 1, 1, 1,
-0.2142925, 2.527028, 1.056658, 1, 1, 1, 1, 1,
-0.2113667, 0.6223189, 0.5502735, 0, 0, 1, 1, 1,
-0.208525, 0.3418517, -1.196616, 1, 0, 0, 1, 1,
-0.2070059, 0.4473843, 0.8680692, 1, 0, 0, 1, 1,
-0.2053912, -0.3046811, -2.801203, 1, 0, 0, 1, 1,
-0.2045653, 1.143775, -1.224594, 1, 0, 0, 1, 1,
-0.2028319, 0.1974415, -0.6762919, 1, 0, 0, 1, 1,
-0.2023283, -1.296603, -3.179259, 0, 0, 0, 1, 1,
-0.2021739, -1.862984, -2.361632, 0, 0, 0, 1, 1,
-0.2018858, -0.3799262, -4.044462, 0, 0, 0, 1, 1,
-0.1999787, -2.42423, -2.90503, 0, 0, 0, 1, 1,
-0.1993288, -0.01713847, -0.4306266, 0, 0, 0, 1, 1,
-0.195849, -0.9383359, -3.364189, 0, 0, 0, 1, 1,
-0.1918807, -0.3346038, -1.63615, 0, 0, 0, 1, 1,
-0.1892311, -0.3124873, -2.804681, 1, 1, 1, 1, 1,
-0.1883394, 1.29416, -2.239669, 1, 1, 1, 1, 1,
-0.1882117, -0.5827288, -3.190165, 1, 1, 1, 1, 1,
-0.1853189, -0.7587149, -3.875582, 1, 1, 1, 1, 1,
-0.1821028, -0.2940616, -0.9943103, 1, 1, 1, 1, 1,
-0.1752596, -1.263867, -3.232292, 1, 1, 1, 1, 1,
-0.1741661, 1.490226, 0.7556727, 1, 1, 1, 1, 1,
-0.1740869, 0.9608421, 1.260409, 1, 1, 1, 1, 1,
-0.1705911, -1.319841, -2.892867, 1, 1, 1, 1, 1,
-0.1693453, -1.335577, -4.035798, 1, 1, 1, 1, 1,
-0.1692162, 0.04790477, -2.739585, 1, 1, 1, 1, 1,
-0.1683669, 0.2394761, -0.04347729, 1, 1, 1, 1, 1,
-0.166382, -0.4951015, -2.887319, 1, 1, 1, 1, 1,
-0.1656455, -2.65385, -4.147728, 1, 1, 1, 1, 1,
-0.1630936, -0.7072788, -2.911264, 1, 1, 1, 1, 1,
-0.1630641, -0.7056261, -2.00449, 0, 0, 1, 1, 1,
-0.1605171, -0.9611636, -3.832165, 1, 0, 0, 1, 1,
-0.1596552, 0.7461334, -0.501335, 1, 0, 0, 1, 1,
-0.1582088, 0.404697, -1.301481, 1, 0, 0, 1, 1,
-0.1558797, 0.4163951, -1.856228, 1, 0, 0, 1, 1,
-0.1545282, -0.4418724, -2.350806, 1, 0, 0, 1, 1,
-0.1521406, -0.9741756, -2.423297, 0, 0, 0, 1, 1,
-0.147755, 0.4905377, 0.088815, 0, 0, 0, 1, 1,
-0.1472413, -0.9195246, -2.79619, 0, 0, 0, 1, 1,
-0.1405014, -0.04810599, -1.176161, 0, 0, 0, 1, 1,
-0.1355778, 0.269216, -1.050365, 0, 0, 0, 1, 1,
-0.1353638, -0.1610503, -3.426897, 0, 0, 0, 1, 1,
-0.1308243, -0.4666378, -3.533545, 0, 0, 0, 1, 1,
-0.1279922, 0.2495584, -0.6033407, 1, 1, 1, 1, 1,
-0.1266196, -0.6868734, -3.629458, 1, 1, 1, 1, 1,
-0.1247688, -0.6000703, -4.131043, 1, 1, 1, 1, 1,
-0.122525, -0.07305208, -0.951425, 1, 1, 1, 1, 1,
-0.1135952, -0.09137519, -2.846472, 1, 1, 1, 1, 1,
-0.1033287, 0.1795435, 1.396111, 1, 1, 1, 1, 1,
-0.09632836, 0.7369603, -0.05500918, 1, 1, 1, 1, 1,
-0.09325118, -0.8009303, -2.903405, 1, 1, 1, 1, 1,
-0.08908857, 0.5842404, -1.444921, 1, 1, 1, 1, 1,
-0.08558059, 0.4804705, -0.6124262, 1, 1, 1, 1, 1,
-0.08406027, 0.7812206, 1.265735, 1, 1, 1, 1, 1,
-0.08232516, -2.996524, -2.366635, 1, 1, 1, 1, 1,
-0.0802343, 1.400043, -0.07437674, 1, 1, 1, 1, 1,
-0.07250097, -2.068466, -4.892414, 1, 1, 1, 1, 1,
-0.07214515, 0.5110661, 1.6291, 1, 1, 1, 1, 1,
-0.06718943, 0.8972197, -0.56103, 0, 0, 1, 1, 1,
-0.06713245, 0.001581808, -2.203303, 1, 0, 0, 1, 1,
-0.06687503, -1.509003, -2.34051, 1, 0, 0, 1, 1,
-0.06522954, -1.001389, -4.218725, 1, 0, 0, 1, 1,
-0.06469653, 0.3590434, -2.041867, 1, 0, 0, 1, 1,
-0.06410278, 1.400173, 0.169024, 1, 0, 0, 1, 1,
-0.06383832, 0.1681757, -0.7553363, 0, 0, 0, 1, 1,
-0.06363653, 0.2581591, -1.642125, 0, 0, 0, 1, 1,
-0.06245816, -1.492055, -3.701071, 0, 0, 0, 1, 1,
-0.0609741, 0.3652737, 1.33666, 0, 0, 0, 1, 1,
-0.05948304, 0.3706152, 1.110694, 0, 0, 0, 1, 1,
-0.05693565, 0.1392605, 1.760696, 0, 0, 0, 1, 1,
-0.05525003, 1.024941, -1.341358, 0, 0, 0, 1, 1,
-0.0535252, -0.1193883, -2.355276, 1, 1, 1, 1, 1,
-0.05338971, -0.06130281, -3.093236, 1, 1, 1, 1, 1,
-0.05153609, -0.1329118, -2.888712, 1, 1, 1, 1, 1,
-0.04845968, -0.05734203, -3.504003, 1, 1, 1, 1, 1,
-0.04478017, 1.461796, 0.06682227, 1, 1, 1, 1, 1,
-0.03895875, 0.6003278, -0.3119549, 1, 1, 1, 1, 1,
-0.03558811, 1.250864, 0.4134532, 1, 1, 1, 1, 1,
-0.03395818, -1.086863, -5.57374, 1, 1, 1, 1, 1,
-0.03357801, 0.09743961, -0.4301018, 1, 1, 1, 1, 1,
-0.03333418, -1.012345, -4.653003, 1, 1, 1, 1, 1,
-0.03196356, -0.6528341, -3.82294, 1, 1, 1, 1, 1,
-0.02993511, -0.07475566, -3.33494, 1, 1, 1, 1, 1,
-0.02843209, -0.9240893, -3.578629, 1, 1, 1, 1, 1,
-0.02556404, 0.2047466, 0.1961192, 1, 1, 1, 1, 1,
-0.0248995, 0.6643341, -0.5060216, 1, 1, 1, 1, 1,
-0.02472463, -0.1143438, -2.743425, 0, 0, 1, 1, 1,
-0.0242881, 0.4077915, 0.2717389, 1, 0, 0, 1, 1,
-0.02419507, -1.271752, -2.352777, 1, 0, 0, 1, 1,
-0.0236793, 1.719449, 1.566188, 1, 0, 0, 1, 1,
-0.02329754, -0.003463378, -1.119831, 1, 0, 0, 1, 1,
-0.02322493, 0.09363173, -0.112849, 1, 0, 0, 1, 1,
-0.0219681, 0.1309011, -0.2998616, 0, 0, 0, 1, 1,
-0.02143599, 0.8697702, 1.546507, 0, 0, 0, 1, 1,
-0.02117696, 0.03297967, -0.4970424, 0, 0, 0, 1, 1,
-0.01652429, 0.1448262, -0.3575577, 0, 0, 0, 1, 1,
-0.01638231, 2.275067, 0.07420402, 0, 0, 0, 1, 1,
-0.01349166, -0.1459316, -3.303966, 0, 0, 0, 1, 1,
-0.01189745, -0.1260271, -3.179513, 0, 0, 0, 1, 1,
-0.01029816, 0.5161771, 0.2720965, 1, 1, 1, 1, 1,
-0.005203553, -0.2176072, -3.388673, 1, 1, 1, 1, 1,
-0.004936325, 0.2659077, 0.4607277, 1, 1, 1, 1, 1,
-0.00417592, -2.366491, -4.056425, 1, 1, 1, 1, 1,
0.002810296, 1.965224, -0.4465917, 1, 1, 1, 1, 1,
0.005526698, 1.231671, 0.4234402, 1, 1, 1, 1, 1,
0.008582599, 1.126456, -0.5536312, 1, 1, 1, 1, 1,
0.01073283, -0.9073551, 2.900638, 1, 1, 1, 1, 1,
0.01111542, 0.976395, 2.025082, 1, 1, 1, 1, 1,
0.01453665, 0.289221, 1.824793, 1, 1, 1, 1, 1,
0.01574432, 0.9691591, -1.772356, 1, 1, 1, 1, 1,
0.01652703, -0.1196379, 1.204491, 1, 1, 1, 1, 1,
0.01736066, 0.5582114, 0.5465228, 1, 1, 1, 1, 1,
0.02022683, 0.7649717, -0.1437775, 1, 1, 1, 1, 1,
0.02029394, -0.8217007, 3.738377, 1, 1, 1, 1, 1,
0.0207998, -0.4536816, 2.491663, 0, 0, 1, 1, 1,
0.02204665, -0.1493921, 1.245582, 1, 0, 0, 1, 1,
0.0247631, -0.9607938, 1.801352, 1, 0, 0, 1, 1,
0.02504381, -0.3451521, 3.886246, 1, 0, 0, 1, 1,
0.02832624, 0.4168825, 0.6541808, 1, 0, 0, 1, 1,
0.03179352, -1.534062, 2.636051, 1, 0, 0, 1, 1,
0.03182136, -1.181193, 3.51091, 0, 0, 0, 1, 1,
0.0374472, -0.3833886, 3.680077, 0, 0, 0, 1, 1,
0.04290189, -0.5615999, 5.932547, 0, 0, 0, 1, 1,
0.04518862, -0.3342431, 3.551802, 0, 0, 0, 1, 1,
0.05276817, 0.4537676, -0.6409017, 0, 0, 0, 1, 1,
0.05358174, 0.3450772, -1.646832, 0, 0, 0, 1, 1,
0.05695095, -0.2470967, 2.600043, 0, 0, 0, 1, 1,
0.05935752, -2.459105, 3.193239, 1, 1, 1, 1, 1,
0.06326715, -0.5931744, 2.962208, 1, 1, 1, 1, 1,
0.0678592, -0.7785594, 3.517645, 1, 1, 1, 1, 1,
0.06791335, 0.8920327, 0.8573796, 1, 1, 1, 1, 1,
0.07320374, 0.3471672, 1.567613, 1, 1, 1, 1, 1,
0.07446864, -0.6006272, 4.908901, 1, 1, 1, 1, 1,
0.07469542, -0.3175334, 4.688854, 1, 1, 1, 1, 1,
0.07778665, -0.3970922, 3.004347, 1, 1, 1, 1, 1,
0.07908975, 0.4336277, 1.030619, 1, 1, 1, 1, 1,
0.08554932, -0.4495667, 4.614721, 1, 1, 1, 1, 1,
0.09102987, -0.1687275, 1.754966, 1, 1, 1, 1, 1,
0.09171066, 0.6327309, 1.390866, 1, 1, 1, 1, 1,
0.09488469, -0.3749576, 2.453981, 1, 1, 1, 1, 1,
0.09914705, -0.655727, 2.493977, 1, 1, 1, 1, 1,
0.1040857, -1.108896, 4.414553, 1, 1, 1, 1, 1,
0.1054594, 0.2393301, 1.791104, 0, 0, 1, 1, 1,
0.1069684, -0.9827084, 3.594771, 1, 0, 0, 1, 1,
0.1147139, 0.07786997, -0.4294487, 1, 0, 0, 1, 1,
0.1163335, 0.1347591, -0.4733894, 1, 0, 0, 1, 1,
0.1219133, 0.1491318, 0.2665697, 1, 0, 0, 1, 1,
0.1227611, -0.2563008, 2.391167, 1, 0, 0, 1, 1,
0.1297532, -0.5860489, 4.138919, 0, 0, 0, 1, 1,
0.1335438, -0.1387243, 0.4594099, 0, 0, 0, 1, 1,
0.1367417, 1.413296, 1.483639, 0, 0, 0, 1, 1,
0.1384179, -0.5488377, 1.716925, 0, 0, 0, 1, 1,
0.1400202, 0.03663571, 2.894232, 0, 0, 0, 1, 1,
0.1511589, 1.349216, -0.4588766, 0, 0, 0, 1, 1,
0.1522122, 0.8968081, -1.216975, 0, 0, 0, 1, 1,
0.1539812, 0.8084074, 0.07400494, 1, 1, 1, 1, 1,
0.1552885, 0.1922235, 0.1634624, 1, 1, 1, 1, 1,
0.1565926, -0.2814927, 4.474403, 1, 1, 1, 1, 1,
0.157453, 0.8496229, -1.168263, 1, 1, 1, 1, 1,
0.1580006, -0.6252213, 2.00996, 1, 1, 1, 1, 1,
0.1614618, 1.026225, -1.484738, 1, 1, 1, 1, 1,
0.1629025, -0.1609018, 2.338154, 1, 1, 1, 1, 1,
0.1630042, 3.498517, -0.1768632, 1, 1, 1, 1, 1,
0.1657384, -2.431293, 3.159496, 1, 1, 1, 1, 1,
0.166523, 0.7318265, 1.664791, 1, 1, 1, 1, 1,
0.1705073, 0.004688105, 0.6979569, 1, 1, 1, 1, 1,
0.1712257, 2.332737, 1.2556, 1, 1, 1, 1, 1,
0.1750439, 0.7712012, 0.09466393, 1, 1, 1, 1, 1,
0.1793815, -0.0159175, 2.123229, 1, 1, 1, 1, 1,
0.1796583, 1.354571, -0.4319585, 1, 1, 1, 1, 1,
0.1796937, -0.1844376, 3.160566, 0, 0, 1, 1, 1,
0.1832008, 0.9425138, 0.8262439, 1, 0, 0, 1, 1,
0.1872522, 1.527749, 1.391994, 1, 0, 0, 1, 1,
0.1891957, -0.3681971, 2.834054, 1, 0, 0, 1, 1,
0.1902026, 0.6132048, -0.51992, 1, 0, 0, 1, 1,
0.1904536, -1.167657, 1.855875, 1, 0, 0, 1, 1,
0.1909921, 1.009314, 1.812878, 0, 0, 0, 1, 1,
0.1926071, -0.1060609, 1.664921, 0, 0, 0, 1, 1,
0.1927914, -0.6296067, 2.412427, 0, 0, 0, 1, 1,
0.193898, -1.37595, 2.199848, 0, 0, 0, 1, 1,
0.1944803, -0.9165972, 1.587103, 0, 0, 0, 1, 1,
0.1949709, 0.5347502, -0.05001767, 0, 0, 0, 1, 1,
0.2019267, 0.2592866, 1.668041, 0, 0, 0, 1, 1,
0.2024413, -1.013721, 3.956205, 1, 1, 1, 1, 1,
0.2094837, -0.7644762, 2.313497, 1, 1, 1, 1, 1,
0.2100866, -1.519468, 2.522334, 1, 1, 1, 1, 1,
0.2110776, 0.5738323, 1.42916, 1, 1, 1, 1, 1,
0.2119646, -0.1511717, 2.227606, 1, 1, 1, 1, 1,
0.212793, 0.7253748, 0.01586088, 1, 1, 1, 1, 1,
0.2144578, 0.4322527, 1.069519, 1, 1, 1, 1, 1,
0.2196124, 0.09653927, 1.903285, 1, 1, 1, 1, 1,
0.2211091, -0.6986474, 1.918733, 1, 1, 1, 1, 1,
0.2225664, 0.5710968, 1.986081, 1, 1, 1, 1, 1,
0.2263096, 2.54882, 0.92207, 1, 1, 1, 1, 1,
0.2320155, 0.04730635, 2.345204, 1, 1, 1, 1, 1,
0.2351245, -0.779162, 4.582243, 1, 1, 1, 1, 1,
0.2418747, -0.06531151, 3.206284, 1, 1, 1, 1, 1,
0.2458574, -0.108582, 0.6227123, 1, 1, 1, 1, 1,
0.2479245, -0.2920382, 2.187589, 0, 0, 1, 1, 1,
0.2493245, -0.7883083, 3.944102, 1, 0, 0, 1, 1,
0.2522684, -0.2362207, 2.109357, 1, 0, 0, 1, 1,
0.25356, 0.3889668, 1.764697, 1, 0, 0, 1, 1,
0.2559081, 0.2245973, 1.602991, 1, 0, 0, 1, 1,
0.258675, -1.442787, 2.539234, 1, 0, 0, 1, 1,
0.2600696, 0.8744978, 0.4052553, 0, 0, 0, 1, 1,
0.2720763, 0.4820757, 0.7365116, 0, 0, 0, 1, 1,
0.2757624, -0.7101768, 1.600078, 0, 0, 0, 1, 1,
0.2764389, -0.6637113, 3.941277, 0, 0, 0, 1, 1,
0.2775756, 1.600352, -0.5582719, 0, 0, 0, 1, 1,
0.2816875, -1.607439, 3.197689, 0, 0, 0, 1, 1,
0.2907567, -0.846652, 3.851629, 0, 0, 0, 1, 1,
0.2912521, 0.6901174, -0.7446849, 1, 1, 1, 1, 1,
0.2947623, 1.826414, 0.06897711, 1, 1, 1, 1, 1,
0.2971659, -0.6545212, 2.565199, 1, 1, 1, 1, 1,
0.2988534, -1.003626, 3.240189, 1, 1, 1, 1, 1,
0.2995519, 0.1999931, 2.122919, 1, 1, 1, 1, 1,
0.3013719, 1.304589, -0.5052108, 1, 1, 1, 1, 1,
0.3013874, -0.3238125, 1.344319, 1, 1, 1, 1, 1,
0.3042792, -0.6539792, 2.562099, 1, 1, 1, 1, 1,
0.3061816, 0.2772336, -0.01844327, 1, 1, 1, 1, 1,
0.3064513, -0.3714202, 1.959091, 1, 1, 1, 1, 1,
0.3118542, -0.01507133, 1.282149, 1, 1, 1, 1, 1,
0.3134458, 0.6758868, 0.8993189, 1, 1, 1, 1, 1,
0.3207184, 0.9910939, 0.1772708, 1, 1, 1, 1, 1,
0.3223226, -1.182167, 1.942052, 1, 1, 1, 1, 1,
0.323225, 2.229089, 0.2834313, 1, 1, 1, 1, 1,
0.3250136, -0.3812858, 1.628556, 0, 0, 1, 1, 1,
0.327222, 0.7860094, 0.1405111, 1, 0, 0, 1, 1,
0.3281123, 0.8940135, 1.631517, 1, 0, 0, 1, 1,
0.3303901, -0.4171057, 4.093211, 1, 0, 0, 1, 1,
0.3309967, 0.8761234, 0.1509177, 1, 0, 0, 1, 1,
0.3317323, 2.51123, 0.5037639, 1, 0, 0, 1, 1,
0.3338268, -0.1063119, 0.8683023, 0, 0, 0, 1, 1,
0.3343693, 0.6224757, -0.7758859, 0, 0, 0, 1, 1,
0.3371913, 0.5575967, 0.9473671, 0, 0, 0, 1, 1,
0.341734, -1.192216, 2.371144, 0, 0, 0, 1, 1,
0.3426424, -0.06517839, -0.3142826, 0, 0, 0, 1, 1,
0.3474827, -1.223663, 3.772903, 0, 0, 0, 1, 1,
0.3475569, -0.1306073, 2.214145, 0, 0, 0, 1, 1,
0.3477964, -0.6504284, 2.056191, 1, 1, 1, 1, 1,
0.3487726, -0.8512462, 1.780329, 1, 1, 1, 1, 1,
0.3543434, 0.7527925, -0.8965113, 1, 1, 1, 1, 1,
0.359722, 0.4160344, 1.878587, 1, 1, 1, 1, 1,
0.3642182, -0.2039625, 1.463482, 1, 1, 1, 1, 1,
0.3671032, 0.7614403, -0.1181668, 1, 1, 1, 1, 1,
0.3681434, 0.6843078, 1.178154, 1, 1, 1, 1, 1,
0.3690073, -0.6338323, 0.4779358, 1, 1, 1, 1, 1,
0.3765491, 0.8335814, -0.2344387, 1, 1, 1, 1, 1,
0.3775706, -1.388868, 2.487112, 1, 1, 1, 1, 1,
0.3789855, 0.285501, 0.5638579, 1, 1, 1, 1, 1,
0.3821707, 0.2559354, 1.805407, 1, 1, 1, 1, 1,
0.3834163, 0.312294, -1.165651, 1, 1, 1, 1, 1,
0.3850521, 0.8842248, -1.145347, 1, 1, 1, 1, 1,
0.3870637, 1.803276, 2.303761, 1, 1, 1, 1, 1,
0.3904438, 0.4128469, 0.4493589, 0, 0, 1, 1, 1,
0.3916323, 1.028076, -0.5534608, 1, 0, 0, 1, 1,
0.3942521, 1.246113, 0.388119, 1, 0, 0, 1, 1,
0.4054507, 0.3432389, 2.465521, 1, 0, 0, 1, 1,
0.4068903, -0.3173169, 1.107396, 1, 0, 0, 1, 1,
0.4071766, 0.381735, 1.605311, 1, 0, 0, 1, 1,
0.4088566, 0.8045698, 1.448105, 0, 0, 0, 1, 1,
0.410012, 0.5908552, 1.132127, 0, 0, 0, 1, 1,
0.4101187, -0.6573073, 4.084673, 0, 0, 0, 1, 1,
0.4114749, 0.8743299, -0.6792916, 0, 0, 0, 1, 1,
0.4153419, 0.6074671, 1.007612, 0, 0, 0, 1, 1,
0.4229356, -0.3482963, 2.392801, 0, 0, 0, 1, 1,
0.4261866, 0.8586008, 0.4086837, 0, 0, 0, 1, 1,
0.4264503, 0.4852266, 1.805069, 1, 1, 1, 1, 1,
0.4336563, -1.48561, 2.952341, 1, 1, 1, 1, 1,
0.4347522, -0.6709194, 2.085685, 1, 1, 1, 1, 1,
0.4415512, -0.1525095, 1.861801, 1, 1, 1, 1, 1,
0.4439885, -0.1754741, 3.650456, 1, 1, 1, 1, 1,
0.4483764, -0.8320791, 2.417235, 1, 1, 1, 1, 1,
0.4504264, 0.03647006, -0.2801784, 1, 1, 1, 1, 1,
0.4568715, -0.6043776, 2.45989, 1, 1, 1, 1, 1,
0.4591549, -0.05917558, 1.827889, 1, 1, 1, 1, 1,
0.4681073, -0.7608855, 1.729311, 1, 1, 1, 1, 1,
0.4731051, 1.279453, -0.3386801, 1, 1, 1, 1, 1,
0.4748556, 1.162803, 1.938808, 1, 1, 1, 1, 1,
0.4786907, 0.5997002, -0.6088873, 1, 1, 1, 1, 1,
0.4787023, -1.744169, 0.5670784, 1, 1, 1, 1, 1,
0.4809081, 1.468515, -0.06195144, 1, 1, 1, 1, 1,
0.4886732, 1.361403, 0.2637461, 0, 0, 1, 1, 1,
0.4914662, 0.4425508, 0.1221141, 1, 0, 0, 1, 1,
0.4963458, 0.445707, 0.2581116, 1, 0, 0, 1, 1,
0.5012867, 0.4731385, 1.12294, 1, 0, 0, 1, 1,
0.5046415, -0.4588231, 2.74988, 1, 0, 0, 1, 1,
0.5054598, 1.334492, -0.3440425, 1, 0, 0, 1, 1,
0.5082685, 0.05853349, 2.366914, 0, 0, 0, 1, 1,
0.5149559, -1.449005, 1.028298, 0, 0, 0, 1, 1,
0.5151533, 1.009869, 0.9584513, 0, 0, 0, 1, 1,
0.5219544, -0.2326519, 0.7172424, 0, 0, 0, 1, 1,
0.5247861, 0.3494787, -0.02636366, 0, 0, 0, 1, 1,
0.5261227, -0.9507221, 2.829178, 0, 0, 0, 1, 1,
0.5263925, -0.1333912, 2.503763, 0, 0, 0, 1, 1,
0.5287138, -1.232354, 5.444765, 1, 1, 1, 1, 1,
0.5317355, 0.9522051, -0.3276049, 1, 1, 1, 1, 1,
0.5319747, 1.580238, 1.087908, 1, 1, 1, 1, 1,
0.5323422, -0.8727451, 2.28004, 1, 1, 1, 1, 1,
0.5324494, 0.5570027, 1.481676, 1, 1, 1, 1, 1,
0.5347977, 0.1294947, 2.397281, 1, 1, 1, 1, 1,
0.5384548, 0.57185, 0.2380862, 1, 1, 1, 1, 1,
0.5453075, -0.5948571, 3.343325, 1, 1, 1, 1, 1,
0.556499, -0.3051879, 2.224075, 1, 1, 1, 1, 1,
0.5566235, 0.2717578, 1.607556, 1, 1, 1, 1, 1,
0.5588312, 0.9455978, -1.403988, 1, 1, 1, 1, 1,
0.5650359, 0.04234564, 2.409849, 1, 1, 1, 1, 1,
0.572963, 0.8785344, 0.008008922, 1, 1, 1, 1, 1,
0.5741625, -0.4762779, 1.990523, 1, 1, 1, 1, 1,
0.579416, 1.826125, 0.4682196, 1, 1, 1, 1, 1,
0.5845853, 2.070708, 1.270036, 0, 0, 1, 1, 1,
0.5846502, 1.803064, 0.4960715, 1, 0, 0, 1, 1,
0.5860695, 0.9777306, 0.5348194, 1, 0, 0, 1, 1,
0.5863409, 0.2468053, 0.9214041, 1, 0, 0, 1, 1,
0.586422, 0.4621807, -0.6996049, 1, 0, 0, 1, 1,
0.5904958, -0.4980194, 3.75335, 1, 0, 0, 1, 1,
0.601768, -1.084905, 3.191943, 0, 0, 0, 1, 1,
0.6046048, -0.01684004, 2.610406, 0, 0, 0, 1, 1,
0.6069119, -1.160677, 3.900348, 0, 0, 0, 1, 1,
0.6093594, 0.6861072, -1.031319, 0, 0, 0, 1, 1,
0.6150222, 3.033645, -1.290118, 0, 0, 0, 1, 1,
0.6156073, -0.1763235, 2.92878, 0, 0, 0, 1, 1,
0.6181303, 1.969731, -0.9714099, 0, 0, 0, 1, 1,
0.6186668, 0.7201227, 0.293447, 1, 1, 1, 1, 1,
0.6249303, -1.347546, 2.426891, 1, 1, 1, 1, 1,
0.6252525, 0.9545759, 1.340768, 1, 1, 1, 1, 1,
0.6270941, -0.7758732, 3.273081, 1, 1, 1, 1, 1,
0.6303545, 1.198497, 0.6589369, 1, 1, 1, 1, 1,
0.6321712, 1.909916, 1.148446, 1, 1, 1, 1, 1,
0.6345842, 0.210882, 1.239662, 1, 1, 1, 1, 1,
0.6497192, -0.6571543, 1.528802, 1, 1, 1, 1, 1,
0.6581986, -0.4241748, 3.823738, 1, 1, 1, 1, 1,
0.6603935, 0.2313371, -0.02554433, 1, 1, 1, 1, 1,
0.6624863, 0.06458128, 2.102388, 1, 1, 1, 1, 1,
0.664888, -1.448357, 3.51027, 1, 1, 1, 1, 1,
0.6670023, 0.2537641, 2.725051, 1, 1, 1, 1, 1,
0.6692107, 0.8591361, 0.5891338, 1, 1, 1, 1, 1,
0.6706467, -0.9019979, 3.790972, 1, 1, 1, 1, 1,
0.6768273, 0.4022592, 0.06716026, 0, 0, 1, 1, 1,
0.6772061, 0.1779884, 0.6022395, 1, 0, 0, 1, 1,
0.6784269, -1.373945, 2.268968, 1, 0, 0, 1, 1,
0.6803007, -0.05592278, 2.948058, 1, 0, 0, 1, 1,
0.6806817, -1.613861, 1.878409, 1, 0, 0, 1, 1,
0.6809202, 1.359201, -0.008661258, 1, 0, 0, 1, 1,
0.6882913, 1.496328, 0.2282811, 0, 0, 0, 1, 1,
0.6914581, -0.8484845, 3.084465, 0, 0, 0, 1, 1,
0.6947036, -0.1483542, 1.66114, 0, 0, 0, 1, 1,
0.6971478, 0.3796493, 1.329278, 0, 0, 0, 1, 1,
0.6973565, -0.1402619, 0.6396852, 0, 0, 0, 1, 1,
0.6997827, 0.6376749, 0.8706077, 0, 0, 0, 1, 1,
0.7015261, 1.092198, 0.6682991, 0, 0, 0, 1, 1,
0.7214392, 0.605405, 0.651523, 1, 1, 1, 1, 1,
0.721862, -0.8508635, 3.455149, 1, 1, 1, 1, 1,
0.7226282, -1.769287, 2.153337, 1, 1, 1, 1, 1,
0.7233049, -1.563406, 2.389822, 1, 1, 1, 1, 1,
0.7293611, 0.1336078, 0.5688521, 1, 1, 1, 1, 1,
0.7304172, 0.2654257, -0.4556902, 1, 1, 1, 1, 1,
0.7403054, -0.9346577, 2.990998, 1, 1, 1, 1, 1,
0.741241, -0.5761644, 3.068957, 1, 1, 1, 1, 1,
0.7428938, 0.3139215, 2.309507, 1, 1, 1, 1, 1,
0.7463028, 0.4019242, 1.70489, 1, 1, 1, 1, 1,
0.7463602, -0.7143389, 1.850601, 1, 1, 1, 1, 1,
0.7463827, 0.2830712, 2.594229, 1, 1, 1, 1, 1,
0.7470706, -0.1327456, 2.176612, 1, 1, 1, 1, 1,
0.7519133, -0.3272394, 0.5761525, 1, 1, 1, 1, 1,
0.7527276, 1.630194, 1.958242, 1, 1, 1, 1, 1,
0.7528952, 0.4540904, 1.105762, 0, 0, 1, 1, 1,
0.7542765, -0.03084184, 0.5349929, 1, 0, 0, 1, 1,
0.7573585, 0.3648904, 1.692992, 1, 0, 0, 1, 1,
0.7656368, -1.272759, 1.642601, 1, 0, 0, 1, 1,
0.7685518, 0.5312541, 1.726166, 1, 0, 0, 1, 1,
0.7722086, 1.23364, -0.6263843, 1, 0, 0, 1, 1,
0.7746203, -1.554398, 2.009609, 0, 0, 0, 1, 1,
0.779924, 1.578185, -0.4590163, 0, 0, 0, 1, 1,
0.7811806, 1.356527, -0.6739634, 0, 0, 0, 1, 1,
0.7821096, 0.4123926, -0.3712966, 0, 0, 0, 1, 1,
0.7886703, 0.05531137, 1.204657, 0, 0, 0, 1, 1,
0.796303, 0.09968294, 1.156195, 0, 0, 0, 1, 1,
0.7964227, -0.6966481, 2.819989, 0, 0, 0, 1, 1,
0.8019198, 0.8452553, 1.882172, 1, 1, 1, 1, 1,
0.8041068, 1.078915, -0.6434734, 1, 1, 1, 1, 1,
0.8051292, -0.01911166, 2.887197, 1, 1, 1, 1, 1,
0.8058303, 0.1145972, 2.188322, 1, 1, 1, 1, 1,
0.8129616, -0.1391604, 1.899846, 1, 1, 1, 1, 1,
0.8189522, -0.9889705, 2.198897, 1, 1, 1, 1, 1,
0.8279725, -0.8067152, 2.319059, 1, 1, 1, 1, 1,
0.8297356, -1.619132, 1.410382, 1, 1, 1, 1, 1,
0.8326257, 0.516883, 1.531281, 1, 1, 1, 1, 1,
0.8328713, -0.1708905, 1.813425, 1, 1, 1, 1, 1,
0.8397726, -0.20162, 1.299497, 1, 1, 1, 1, 1,
0.8461494, -0.9153498, 2.823365, 1, 1, 1, 1, 1,
0.8512137, 1.000004, 0.3434468, 1, 1, 1, 1, 1,
0.8513254, -0.05966359, 1.4898, 1, 1, 1, 1, 1,
0.8513943, -2.248379, 1.870024, 1, 1, 1, 1, 1,
0.8573602, 0.5932556, 0.9275618, 0, 0, 1, 1, 1,
0.8621552, -0.8122072, 2.67151, 1, 0, 0, 1, 1,
0.8656098, 0.8777037, 0.9621298, 1, 0, 0, 1, 1,
0.8977044, 1.559072, 0.5000777, 1, 0, 0, 1, 1,
0.8993977, -1.458777, 2.008221, 1, 0, 0, 1, 1,
0.9006373, 0.7951779, -0.2279893, 1, 0, 0, 1, 1,
0.9065464, -0.1023208, 2.788125, 0, 0, 0, 1, 1,
0.9100593, -0.04505124, 1.301594, 0, 0, 0, 1, 1,
0.9111804, -2.036014, 1.958913, 0, 0, 0, 1, 1,
0.9167945, 0.4700152, 1.50614, 0, 0, 0, 1, 1,
0.9177161, -0.04339796, 0.8770303, 0, 0, 0, 1, 1,
0.9236081, -0.4047147, 0.9289625, 0, 0, 0, 1, 1,
0.9270565, -0.7254181, 1.473147, 0, 0, 0, 1, 1,
0.9275746, -0.2638014, 2.579794, 1, 1, 1, 1, 1,
0.9368369, -1.364826, 1.438985, 1, 1, 1, 1, 1,
0.9391067, -1.139646, 0.8059541, 1, 1, 1, 1, 1,
0.9457803, -1.147905, 2.958057, 1, 1, 1, 1, 1,
0.9481607, 0.2946166, 3.127911, 1, 1, 1, 1, 1,
0.9533487, -1.384493, 4.479651, 1, 1, 1, 1, 1,
0.9598271, -0.5144411, 0.5940752, 1, 1, 1, 1, 1,
0.9601952, -2.02552, 0.6599383, 1, 1, 1, 1, 1,
0.9624189, 0.4381839, 1.431815, 1, 1, 1, 1, 1,
0.9671524, 0.8168126, 0.8841597, 1, 1, 1, 1, 1,
0.9686407, 1.563233, 0.6194355, 1, 1, 1, 1, 1,
0.9705759, -0.1340958, 0.6871948, 1, 1, 1, 1, 1,
0.9714815, 1.491582, -0.07205689, 1, 1, 1, 1, 1,
0.97388, 1.538472, 0.118361, 1, 1, 1, 1, 1,
0.9786592, -1.14834, 3.029958, 1, 1, 1, 1, 1,
0.9788433, 0.4950877, 1.847432, 0, 0, 1, 1, 1,
0.9900838, -0.625275, 1.401997, 1, 0, 0, 1, 1,
0.9929323, 1.317998, -0.2140442, 1, 0, 0, 1, 1,
1.000646, 0.1465358, 1.631726, 1, 0, 0, 1, 1,
1.00383, 0.5781126, -0.5448756, 1, 0, 0, 1, 1,
1.01272, -0.6319531, 1.638922, 1, 0, 0, 1, 1,
1.015033, -0.1035473, 1.929062, 0, 0, 0, 1, 1,
1.016788, -1.44174, 2.423249, 0, 0, 0, 1, 1,
1.017427, 0.6118529, -0.7745288, 0, 0, 0, 1, 1,
1.022142, -0.5622526, 0.8368585, 0, 0, 0, 1, 1,
1.034234, -1.225747, 3.110137, 0, 0, 0, 1, 1,
1.046012, -0.9237512, 2.936753, 0, 0, 0, 1, 1,
1.047072, 0.0326625, -0.06626771, 0, 0, 0, 1, 1,
1.048233, 0.3405591, 2.110361, 1, 1, 1, 1, 1,
1.049355, -1.102703, 1.439064, 1, 1, 1, 1, 1,
1.06361, -0.6751651, 2.417728, 1, 1, 1, 1, 1,
1.068253, 0.8288449, 2.770732, 1, 1, 1, 1, 1,
1.083938, -1.236251, 3.386067, 1, 1, 1, 1, 1,
1.089729, -0.2077165, 0.9064956, 1, 1, 1, 1, 1,
1.092931, 0.4964906, -1.093013, 1, 1, 1, 1, 1,
1.093818, -0.4646505, 2.150116, 1, 1, 1, 1, 1,
1.100558, -2.696474, 4.82921, 1, 1, 1, 1, 1,
1.10253, 0.2463038, 2.18935, 1, 1, 1, 1, 1,
1.103472, -0.7423436, 2.718807, 1, 1, 1, 1, 1,
1.104957, -1.094698, 1.155003, 1, 1, 1, 1, 1,
1.108384, 0.2988606, 0.8801602, 1, 1, 1, 1, 1,
1.109844, 0.975691, -0.03599834, 1, 1, 1, 1, 1,
1.111146, 1.05263, 0.5005401, 1, 1, 1, 1, 1,
1.11474, -0.4473696, 0.8387552, 0, 0, 1, 1, 1,
1.118289, 0.6553808, 0.9628289, 1, 0, 0, 1, 1,
1.120367, -0.2977053, 2.960552, 1, 0, 0, 1, 1,
1.122223, 0.6408936, -0.8543409, 1, 0, 0, 1, 1,
1.126637, -0.6236404, 0.3738185, 1, 0, 0, 1, 1,
1.127946, 0.3232933, 0.7244542, 1, 0, 0, 1, 1,
1.14174, 0.2459095, 2.729674, 0, 0, 0, 1, 1,
1.143162, -0.1377361, 1.029565, 0, 0, 0, 1, 1,
1.144525, 0.09629772, 0.2818494, 0, 0, 0, 1, 1,
1.146034, -1.273757, 2.556166, 0, 0, 0, 1, 1,
1.156708, 0.02160409, 2.527429, 0, 0, 0, 1, 1,
1.159258, 0.02302208, 1.030006, 0, 0, 0, 1, 1,
1.179664, 1.892621, -0.8123955, 0, 0, 0, 1, 1,
1.182363, -1.119928, 2.427307, 1, 1, 1, 1, 1,
1.194142, -0.4950838, 1.660025, 1, 1, 1, 1, 1,
1.194175, -1.09858, 2.033474, 1, 1, 1, 1, 1,
1.197821, -0.0932934, 2.568837, 1, 1, 1, 1, 1,
1.202201, -0.5960002, 2.594909, 1, 1, 1, 1, 1,
1.202541, -1.015644, 2.412568, 1, 1, 1, 1, 1,
1.207512, -0.8186638, 1.889893, 1, 1, 1, 1, 1,
1.208124, 0.7912251, 0.4988595, 1, 1, 1, 1, 1,
1.209288, 0.8486099, 1.327708, 1, 1, 1, 1, 1,
1.21194, -0.2462748, 3.203853, 1, 1, 1, 1, 1,
1.220628, -0.5418079, 0.9795176, 1, 1, 1, 1, 1,
1.223537, 0.6628044, -3.049361, 1, 1, 1, 1, 1,
1.229547, 0.4648723, 0.3245091, 1, 1, 1, 1, 1,
1.237935, -0.480735, 2.712568, 1, 1, 1, 1, 1,
1.250462, 0.8392488, 1.94555, 1, 1, 1, 1, 1,
1.268482, -0.2430702, 1.490746, 0, 0, 1, 1, 1,
1.277562, -0.245905, 0.8547965, 1, 0, 0, 1, 1,
1.289009, -1.148089, 3.239499, 1, 0, 0, 1, 1,
1.292935, -1.515229, 1.819686, 1, 0, 0, 1, 1,
1.296703, 1.008395, 1.92092, 1, 0, 0, 1, 1,
1.299857, 0.7441673, 1.640028, 1, 0, 0, 1, 1,
1.313928, 0.1212067, 2.305506, 0, 0, 0, 1, 1,
1.314766, 0.8183846, 1.564332, 0, 0, 0, 1, 1,
1.316549, -0.07526263, 1.494185, 0, 0, 0, 1, 1,
1.318002, 0.7837453, 1.088392, 0, 0, 0, 1, 1,
1.318584, -0.03497203, 2.298416, 0, 0, 0, 1, 1,
1.322309, 0.2681116, 1.089424, 0, 0, 0, 1, 1,
1.322512, -0.961356, 2.989125, 0, 0, 0, 1, 1,
1.325499, 0.9070669, -0.1433333, 1, 1, 1, 1, 1,
1.327125, -0.07807315, 3.768205, 1, 1, 1, 1, 1,
1.327981, 1.288056, 1.914904, 1, 1, 1, 1, 1,
1.329129, -1.05583, 1.692336, 1, 1, 1, 1, 1,
1.329468, 0.3539103, 2.399494, 1, 1, 1, 1, 1,
1.346911, -1.771577, 2.982313, 1, 1, 1, 1, 1,
1.351247, -0.05047863, 2.30212, 1, 1, 1, 1, 1,
1.357728, 0.3036545, 3.303403, 1, 1, 1, 1, 1,
1.359699, 0.8229568, 1.516468, 1, 1, 1, 1, 1,
1.361321, 0.4811694, 0.3593121, 1, 1, 1, 1, 1,
1.361764, -0.5936776, 2.393338, 1, 1, 1, 1, 1,
1.369546, -0.8243284, 0.7938762, 1, 1, 1, 1, 1,
1.370858, -0.4188218, 2.302087, 1, 1, 1, 1, 1,
1.376678, 0.6646952, -0.3438664, 1, 1, 1, 1, 1,
1.378282, -0.6794717, 2.960644, 1, 1, 1, 1, 1,
1.379477, -0.6593207, 0.7966362, 0, 0, 1, 1, 1,
1.383756, 2.13489, 0.5432423, 1, 0, 0, 1, 1,
1.38568, -0.9548066, 2.513108, 1, 0, 0, 1, 1,
1.397821, -1.09503, 3.195224, 1, 0, 0, 1, 1,
1.401905, -0.3902403, 3.771154, 1, 0, 0, 1, 1,
1.411059, -0.6992241, 3.147966, 1, 0, 0, 1, 1,
1.418017, 2.0877, 0.1924393, 0, 0, 0, 1, 1,
1.418268, 0.3380105, -0.4821182, 0, 0, 0, 1, 1,
1.426388, -0.4338837, 1.184225, 0, 0, 0, 1, 1,
1.426909, -0.4917433, 2.297192, 0, 0, 0, 1, 1,
1.443218, 0.2645596, 1.08315, 0, 0, 0, 1, 1,
1.44462, -0.1249485, 1.619422, 0, 0, 0, 1, 1,
1.467446, -0.7336086, 1.497218, 0, 0, 0, 1, 1,
1.483215, -1.034808, 1.777589, 1, 1, 1, 1, 1,
1.496847, -0.7900453, 2.93584, 1, 1, 1, 1, 1,
1.502061, -0.5927534, 2.75303, 1, 1, 1, 1, 1,
1.506878, 0.5334794, 2.334378, 1, 1, 1, 1, 1,
1.532715, -0.7434966, 2.815075, 1, 1, 1, 1, 1,
1.540857, -0.1729343, 0.2693662, 1, 1, 1, 1, 1,
1.545057, 0.9971132, 1.165255, 1, 1, 1, 1, 1,
1.546943, 0.407883, 0.655207, 1, 1, 1, 1, 1,
1.549281, 0.09195268, 2.01123, 1, 1, 1, 1, 1,
1.551179, -1.162067, 3.848139, 1, 1, 1, 1, 1,
1.558418, -1.196153, 2.380829, 1, 1, 1, 1, 1,
1.564016, -2.594195, 2.782463, 1, 1, 1, 1, 1,
1.623895, 0.200553, 0.2808482, 1, 1, 1, 1, 1,
1.635288, -1.072821, 1.91648, 1, 1, 1, 1, 1,
1.644869, 0.5082356, -0.3803068, 1, 1, 1, 1, 1,
1.661606, -0.3010835, 3.182348, 0, 0, 1, 1, 1,
1.669753, -0.6046444, 2.651809, 1, 0, 0, 1, 1,
1.671815, -0.03608146, 2.179123, 1, 0, 0, 1, 1,
1.677899, -0.2148172, 1.032641, 1, 0, 0, 1, 1,
1.681332, 0.4634268, -0.3672457, 1, 0, 0, 1, 1,
1.689508, -1.172161, 0.9860671, 1, 0, 0, 1, 1,
1.701011, -0.4303402, 2.886341, 0, 0, 0, 1, 1,
1.711958, -0.3898181, 0.8514976, 0, 0, 0, 1, 1,
1.712355, 0.248315, 0.962136, 0, 0, 0, 1, 1,
1.726111, 0.172321, 0.9439119, 0, 0, 0, 1, 1,
1.735967, 1.084832, 0.9966637, 0, 0, 0, 1, 1,
1.736881, -0.9495612, 0.9849182, 0, 0, 0, 1, 1,
1.763227, 0.3859014, 2.685606, 0, 0, 0, 1, 1,
1.765924, -0.6620733, 2.380112, 1, 1, 1, 1, 1,
1.791704, -0.1612194, 1.961215, 1, 1, 1, 1, 1,
1.798148, -1.966106, 3.028918, 1, 1, 1, 1, 1,
1.79966, -0.6785659, 1.297229, 1, 1, 1, 1, 1,
1.805137, 1.354987, 0.3253882, 1, 1, 1, 1, 1,
1.807227, -1.097171, 1.444363, 1, 1, 1, 1, 1,
1.822339, -0.3093947, 1.658704, 1, 1, 1, 1, 1,
1.827774, -0.5614019, 1.926275, 1, 1, 1, 1, 1,
1.857451, 0.1658586, 1.993349, 1, 1, 1, 1, 1,
1.870429, -0.5442059, 2.765712, 1, 1, 1, 1, 1,
1.893684, 0.7471147, 1.79134, 1, 1, 1, 1, 1,
1.922102, -0.6388514, 1.397719, 1, 1, 1, 1, 1,
1.985407, -0.1893836, 2.154974, 1, 1, 1, 1, 1,
1.998408, -0.511191, 0.6692855, 1, 1, 1, 1, 1,
2.001165, 0.5457879, 0.653743, 1, 1, 1, 1, 1,
2.010448, 0.1306616, 0.4465332, 0, 0, 1, 1, 1,
2.060215, 0.913084, -0.3404391, 1, 0, 0, 1, 1,
2.062307, -0.2139838, 2.859631, 1, 0, 0, 1, 1,
2.07112, 0.5372302, 0.3204017, 1, 0, 0, 1, 1,
2.089038, -0.9966603, 0.6951173, 1, 0, 0, 1, 1,
2.112046, 0.9845323, 0.08735355, 1, 0, 0, 1, 1,
2.146096, -1.092353, 1.516946, 0, 0, 0, 1, 1,
2.296557, -0.5571204, 0.849848, 0, 0, 0, 1, 1,
2.407124, 1.422748, 2.085778, 0, 0, 0, 1, 1,
2.411193, -0.259803, 0.8197354, 0, 0, 0, 1, 1,
2.411426, -0.3366688, 1.545027, 0, 0, 0, 1, 1,
2.526241, 1.666403, 1.045828, 0, 0, 0, 1, 1,
2.616182, -1.677317, 1.899465, 0, 0, 0, 1, 1,
2.645135, 0.05877347, 2.386436, 1, 1, 1, 1, 1,
2.744962, -0.01117864, 1.67885, 1, 1, 1, 1, 1,
2.84026, -0.4305409, 0.5701932, 1, 1, 1, 1, 1,
2.842283, 0.5208818, 2.107452, 1, 1, 1, 1, 1,
2.890793, 0.4913242, 2.990524, 1, 1, 1, 1, 1,
3.086594, -1.604265, 2.708919, 1, 1, 1, 1, 1,
3.630453, 1.480303, 1.994569, 1, 1, 1, 1, 1
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
var radius = 10.3643;
var distance = 36.40416;
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
mvMatrix.translate( 0.301363, -0.1570878, -0.1794035 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -36.40416);
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
