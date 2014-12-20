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
-2.804681, -0.5555632, -1.58943, 1, 0, 0, 1,
-2.792799, 0.7433299, -1.041692, 1, 0.007843138, 0, 1,
-2.671454, -1.876531, -0.6332467, 1, 0.01176471, 0, 1,
-2.62131, -1.323614, -1.441808, 1, 0.01960784, 0, 1,
-2.614406, 2.037379, -2.742841, 1, 0.02352941, 0, 1,
-2.48091, -1.46846, -2.045796, 1, 0.03137255, 0, 1,
-2.424164, 0.2597821, -0.8257563, 1, 0.03529412, 0, 1,
-2.3886, 0.5215766, -0.791418, 1, 0.04313726, 0, 1,
-2.321311, -1.032393, -0.6930825, 1, 0.04705882, 0, 1,
-2.308957, 2.010723, 0.007074493, 1, 0.05490196, 0, 1,
-2.289165, -1.651268, -2.191609, 1, 0.05882353, 0, 1,
-2.289151, -1.198939, -2.588747, 1, 0.06666667, 0, 1,
-2.275625, -2.872555, -1.032058, 1, 0.07058824, 0, 1,
-2.261555, -1.183495, -2.919039, 1, 0.07843138, 0, 1,
-2.250623, 1.45201, -0.4746488, 1, 0.08235294, 0, 1,
-2.161516, 1.173492, -2.319242, 1, 0.09019608, 0, 1,
-2.159421, 0.4820527, -2.534128, 1, 0.09411765, 0, 1,
-2.150264, -1.068271, -3.053208, 1, 0.1019608, 0, 1,
-2.13264, 0.2206931, 0.8544144, 1, 0.1098039, 0, 1,
-2.122294, -1.029852, -1.804316, 1, 0.1137255, 0, 1,
-2.105181, -0.1450994, -1.081964, 1, 0.1215686, 0, 1,
-2.100869, 0.47203, -2.069814, 1, 0.1254902, 0, 1,
-2.068077, 1.765633, -0.649619, 1, 0.1333333, 0, 1,
-2.057529, -1.043472, -3.316339, 1, 0.1372549, 0, 1,
-2.039803, -0.2558075, -0.8297573, 1, 0.145098, 0, 1,
-2.023528, 0.08813833, -3.182416, 1, 0.1490196, 0, 1,
-2.019955, 0.3604498, -0.9578932, 1, 0.1568628, 0, 1,
-2.006053, -0.2594479, -2.927056, 1, 0.1607843, 0, 1,
-1.9644, -2.054646, -2.251403, 1, 0.1686275, 0, 1,
-1.963549, 0.4907266, -1.886328, 1, 0.172549, 0, 1,
-1.957031, -0.9094291, -2.635172, 1, 0.1803922, 0, 1,
-1.954489, 0.5179113, 0.8958233, 1, 0.1843137, 0, 1,
-1.926914, -0.2828519, -1.511423, 1, 0.1921569, 0, 1,
-1.854105, -0.2334174, -1.514536, 1, 0.1960784, 0, 1,
-1.843468, 0.07776593, -2.415183, 1, 0.2039216, 0, 1,
-1.840221, -0.1354034, -1.642251, 1, 0.2117647, 0, 1,
-1.839988, -2.578965, -1.727578, 1, 0.2156863, 0, 1,
-1.838415, -1.472266, 0.3310828, 1, 0.2235294, 0, 1,
-1.838338, -0.1033691, -2.654749, 1, 0.227451, 0, 1,
-1.82715, -0.2191629, -0.7299369, 1, 0.2352941, 0, 1,
-1.824491, -0.6041445, -1.887022, 1, 0.2392157, 0, 1,
-1.79072, 1.35729, -0.2101295, 1, 0.2470588, 0, 1,
-1.741429, 1.623885, 0.03678468, 1, 0.2509804, 0, 1,
-1.739892, -0.1483242, -3.041973, 1, 0.2588235, 0, 1,
-1.735774, -0.7516948, -2.164072, 1, 0.2627451, 0, 1,
-1.734233, 0.8826038, -0.01716808, 1, 0.2705882, 0, 1,
-1.705845, 1.554205, 1.313041, 1, 0.2745098, 0, 1,
-1.694657, -0.6920413, -2.983352, 1, 0.282353, 0, 1,
-1.689118, 0.470174, -0.9102939, 1, 0.2862745, 0, 1,
-1.684688, 0.2182312, -3.398508, 1, 0.2941177, 0, 1,
-1.671445, -0.1324827, -2.318553, 1, 0.3019608, 0, 1,
-1.670929, -0.09014648, -1.611241, 1, 0.3058824, 0, 1,
-1.668248, -1.671267, -2.242743, 1, 0.3137255, 0, 1,
-1.664238, 0.3664758, -0.8583947, 1, 0.3176471, 0, 1,
-1.662518, 1.086606, -1.991195, 1, 0.3254902, 0, 1,
-1.661001, -0.898341, -0.7132232, 1, 0.3294118, 0, 1,
-1.648662, 1.295013, 0.1099705, 1, 0.3372549, 0, 1,
-1.624987, 0.7938083, -1.930942, 1, 0.3411765, 0, 1,
-1.619095, 0.4001683, -0.1641207, 1, 0.3490196, 0, 1,
-1.61908, 0.8237399, -1.171369, 1, 0.3529412, 0, 1,
-1.618317, -0.2222449, -1.935238, 1, 0.3607843, 0, 1,
-1.614526, -0.9131604, -2.770868, 1, 0.3647059, 0, 1,
-1.613604, -0.8621342, -0.2689279, 1, 0.372549, 0, 1,
-1.574058, 0.8540087, -1.547835, 1, 0.3764706, 0, 1,
-1.572815, 0.8858572, 0.2294465, 1, 0.3843137, 0, 1,
-1.56877, -2.575149, -4.019182, 1, 0.3882353, 0, 1,
-1.563705, -0.8266574, -2.591416, 1, 0.3960784, 0, 1,
-1.555295, 0.6763843, -1.281786, 1, 0.4039216, 0, 1,
-1.553792, -1.570665, -1.821298, 1, 0.4078431, 0, 1,
-1.552459, 0.09478193, 0.1323305, 1, 0.4156863, 0, 1,
-1.545045, -1.329946, -1.183512, 1, 0.4196078, 0, 1,
-1.542884, 1.080824, -1.72381, 1, 0.427451, 0, 1,
-1.53159, -0.1788993, -2.078454, 1, 0.4313726, 0, 1,
-1.529065, 1.897403, 0.8012895, 1, 0.4392157, 0, 1,
-1.508426, -2.721629, -2.926656, 1, 0.4431373, 0, 1,
-1.501783, -0.01303178, -0.1953856, 1, 0.4509804, 0, 1,
-1.49527, -0.3986143, -1.031894, 1, 0.454902, 0, 1,
-1.492953, -0.2892379, -2.241479, 1, 0.4627451, 0, 1,
-1.491964, 0.2435654, 0.183821, 1, 0.4666667, 0, 1,
-1.472554, 1.639807, -0.9027576, 1, 0.4745098, 0, 1,
-1.465293, 1.247013, -2.245013, 1, 0.4784314, 0, 1,
-1.464354, -0.2005148, -1.132443, 1, 0.4862745, 0, 1,
-1.457021, 1.028412, -0.5834352, 1, 0.4901961, 0, 1,
-1.447628, -0.3533363, -4.672496, 1, 0.4980392, 0, 1,
-1.440723, -0.7647958, -0.9188683, 1, 0.5058824, 0, 1,
-1.433709, 0.5771898, 0.2856617, 1, 0.509804, 0, 1,
-1.431386, -1.116176, -2.86219, 1, 0.5176471, 0, 1,
-1.430986, -0.5925159, 0.3479242, 1, 0.5215687, 0, 1,
-1.427885, 0.1261108, -0.8256293, 1, 0.5294118, 0, 1,
-1.423229, -0.5899719, -2.993136, 1, 0.5333334, 0, 1,
-1.422701, -0.999065, -0.1713154, 1, 0.5411765, 0, 1,
-1.416882, 0.4244241, -1.503648, 1, 0.5450981, 0, 1,
-1.410273, -1.559295, -2.560784, 1, 0.5529412, 0, 1,
-1.393108, -0.1313941, -1.666123, 1, 0.5568628, 0, 1,
-1.384625, -1.415282, -2.797218, 1, 0.5647059, 0, 1,
-1.378359, -1.284293, -2.220746, 1, 0.5686275, 0, 1,
-1.356577, -0.509363, -2.019623, 1, 0.5764706, 0, 1,
-1.354428, 0.9264045, -0.3471707, 1, 0.5803922, 0, 1,
-1.35132, 1.222556, -0.2807065, 1, 0.5882353, 0, 1,
-1.343529, -0.1250933, -2.015288, 1, 0.5921569, 0, 1,
-1.334855, -1.988095, -3.017962, 1, 0.6, 0, 1,
-1.334796, 1.175922, -0.2975738, 1, 0.6078432, 0, 1,
-1.334369, 0.7397556, -0.05820321, 1, 0.6117647, 0, 1,
-1.332684, -0.1232081, -1.818051, 1, 0.6196079, 0, 1,
-1.331837, -0.3943412, -2.044495, 1, 0.6235294, 0, 1,
-1.330128, 1.871951, -0.8363123, 1, 0.6313726, 0, 1,
-1.324027, -0.05646592, -0.9916159, 1, 0.6352941, 0, 1,
-1.321601, -2.607226, -1.568776, 1, 0.6431373, 0, 1,
-1.297338, -0.555069, -3.56798, 1, 0.6470588, 0, 1,
-1.291875, -0.6853245, -0.4246581, 1, 0.654902, 0, 1,
-1.290706, -0.7045161, -2.525003, 1, 0.6588235, 0, 1,
-1.290423, -1.620625, -3.064756, 1, 0.6666667, 0, 1,
-1.2717, 2.378378, 0.3729872, 1, 0.6705883, 0, 1,
-1.265929, -0.7287726, -1.5778, 1, 0.6784314, 0, 1,
-1.263458, 1.550457, -1.938316, 1, 0.682353, 0, 1,
-1.257807, -2.013524, -3.288425, 1, 0.6901961, 0, 1,
-1.254606, -2.67212, -3.615688, 1, 0.6941177, 0, 1,
-1.252868, -1.225384, -2.494151, 1, 0.7019608, 0, 1,
-1.251392, 0.01540167, -2.029422, 1, 0.7098039, 0, 1,
-1.245994, 0.6851531, -0.4295847, 1, 0.7137255, 0, 1,
-1.236319, 0.2672597, -1.863345, 1, 0.7215686, 0, 1,
-1.235388, 1.287765, -0.3910174, 1, 0.7254902, 0, 1,
-1.234236, 0.2607574, -0.7905404, 1, 0.7333333, 0, 1,
-1.230119, -0.9424639, -2.840835, 1, 0.7372549, 0, 1,
-1.211452, 1.942583, -2.297536, 1, 0.7450981, 0, 1,
-1.21131, -1.33394, -1.210797, 1, 0.7490196, 0, 1,
-1.202432, 0.7136932, -2.36172, 1, 0.7568628, 0, 1,
-1.197085, 1.48387, -1.746093, 1, 0.7607843, 0, 1,
-1.197016, 0.7925626, 0.05093024, 1, 0.7686275, 0, 1,
-1.195982, -1.239686, -0.9442311, 1, 0.772549, 0, 1,
-1.194713, -0.7709771, -0.812076, 1, 0.7803922, 0, 1,
-1.190072, -1.104596, -2.985665, 1, 0.7843137, 0, 1,
-1.189175, 0.4479539, -0.9629028, 1, 0.7921569, 0, 1,
-1.18571, -1.320644, -3.465068, 1, 0.7960784, 0, 1,
-1.183745, 0.4082927, -1.039821, 1, 0.8039216, 0, 1,
-1.178763, -0.5470407, -0.5765332, 1, 0.8117647, 0, 1,
-1.178577, -0.8938018, -0.4276197, 1, 0.8156863, 0, 1,
-1.177584, 0.1572468, -3.181799, 1, 0.8235294, 0, 1,
-1.176904, -1.919001, -2.594816, 1, 0.827451, 0, 1,
-1.176847, -0.6526328, -1.952536, 1, 0.8352941, 0, 1,
-1.174201, -1.571819, -1.367264, 1, 0.8392157, 0, 1,
-1.171688, -0.5766543, -2.427543, 1, 0.8470588, 0, 1,
-1.16799, 1.690344, -0.8198096, 1, 0.8509804, 0, 1,
-1.161442, -1.142478, -1.660711, 1, 0.8588235, 0, 1,
-1.160291, 1.117377, -0.8134727, 1, 0.8627451, 0, 1,
-1.157797, 1.579555, -0.09216958, 1, 0.8705882, 0, 1,
-1.157749, 0.2572724, 0.8827168, 1, 0.8745098, 0, 1,
-1.154718, 0.8778016, -0.7662942, 1, 0.8823529, 0, 1,
-1.150139, 0.5163826, -1.521684, 1, 0.8862745, 0, 1,
-1.147271, 0.4846492, -2.093266, 1, 0.8941177, 0, 1,
-1.144263, -1.164758, -2.213382, 1, 0.8980392, 0, 1,
-1.131543, 2.278244, 0.5670196, 1, 0.9058824, 0, 1,
-1.128896, 0.05102921, -1.260658, 1, 0.9137255, 0, 1,
-1.124574, -0.7430384, -3.681408, 1, 0.9176471, 0, 1,
-1.11845, -0.1784841, -2.639892, 1, 0.9254902, 0, 1,
-1.116029, -1.040685, -1.141204, 1, 0.9294118, 0, 1,
-1.115542, -0.138024, -0.4424842, 1, 0.9372549, 0, 1,
-1.114096, -0.4623803, -1.552548, 1, 0.9411765, 0, 1,
-1.112439, -0.6150679, -2.959193, 1, 0.9490196, 0, 1,
-1.104234, -0.03391279, -1.275211, 1, 0.9529412, 0, 1,
-1.096517, 0.8606559, -0.4436502, 1, 0.9607843, 0, 1,
-1.093235, -0.5740168, -1.06624, 1, 0.9647059, 0, 1,
-1.092096, 0.089633, -1.349, 1, 0.972549, 0, 1,
-1.090136, 1.535282, -0.788197, 1, 0.9764706, 0, 1,
-1.088045, -0.1099761, -0.6521119, 1, 0.9843137, 0, 1,
-1.087838, -0.03655022, -1.522711, 1, 0.9882353, 0, 1,
-1.084295, -0.1659699, -2.001705, 1, 0.9960784, 0, 1,
-1.083316, 1.335647, -0.04490069, 0.9960784, 1, 0, 1,
-1.075525, 1.00537, -0.07186598, 0.9921569, 1, 0, 1,
-1.058386, -0.2669936, -3.265366, 0.9843137, 1, 0, 1,
-1.058029, -0.49843, -1.837455, 0.9803922, 1, 0, 1,
-1.056694, -0.5775816, -3.118004, 0.972549, 1, 0, 1,
-1.056629, 0.5407694, -0.8724481, 0.9686275, 1, 0, 1,
-1.055207, -0.6788709, -2.071236, 0.9607843, 1, 0, 1,
-1.051935, 0.05209443, -2.806984, 0.9568627, 1, 0, 1,
-1.046284, 0.144746, 0.382951, 0.9490196, 1, 0, 1,
-1.040543, -1.462376, -3.942868, 0.945098, 1, 0, 1,
-1.033461, 0.4346674, -2.202407, 0.9372549, 1, 0, 1,
-1.021302, -0.8892514, -2.12347, 0.9333333, 1, 0, 1,
-1.020249, -2.453475, -2.617662, 0.9254902, 1, 0, 1,
-1.019203, 1.059116, 0.1776794, 0.9215686, 1, 0, 1,
-1.015044, 0.9276987, -0.08549941, 0.9137255, 1, 0, 1,
-1.014736, 0.6985582, -0.7811163, 0.9098039, 1, 0, 1,
-1.01449, -0.827888, -2.902431, 0.9019608, 1, 0, 1,
-1.010369, 0.8144264, 0.1799356, 0.8941177, 1, 0, 1,
-1.009602, -1.033294, -1.939063, 0.8901961, 1, 0, 1,
-1.007655, -1.360012, -2.472811, 0.8823529, 1, 0, 1,
-0.9913282, 0.7734488, 0.01062351, 0.8784314, 1, 0, 1,
-0.9870492, -2.112523, -2.121284, 0.8705882, 1, 0, 1,
-0.9861318, -0.8389665, -1.538553, 0.8666667, 1, 0, 1,
-0.9776694, -0.624591, -3.343745, 0.8588235, 1, 0, 1,
-0.9765112, 0.7954025, -2.70247, 0.854902, 1, 0, 1,
-0.9752072, 0.7140923, -2.501355, 0.8470588, 1, 0, 1,
-0.9646305, 0.2450152, -1.677758, 0.8431373, 1, 0, 1,
-0.962726, 0.70724, -0.7396095, 0.8352941, 1, 0, 1,
-0.9570293, -0.9125926, -1.290728, 0.8313726, 1, 0, 1,
-0.9549314, -0.1839307, -2.085114, 0.8235294, 1, 0, 1,
-0.9494776, 1.282393, -0.6143016, 0.8196079, 1, 0, 1,
-0.9403, -0.8152121, -3.166953, 0.8117647, 1, 0, 1,
-0.9348081, 0.8603886, -0.8010633, 0.8078431, 1, 0, 1,
-0.9342591, -0.03287796, -0.2023226, 0.8, 1, 0, 1,
-0.9312642, 2.03302, 1.570373, 0.7921569, 1, 0, 1,
-0.930381, 0.3442378, 0.162405, 0.7882353, 1, 0, 1,
-0.9303386, -0.8662039, -3.274761, 0.7803922, 1, 0, 1,
-0.911418, 0.8397158, 0.154813, 0.7764706, 1, 0, 1,
-0.9018591, 0.6969377, -0.9356463, 0.7686275, 1, 0, 1,
-0.8999937, 1.354714, -0.1716329, 0.7647059, 1, 0, 1,
-0.8973106, -0.5302264, -2.055283, 0.7568628, 1, 0, 1,
-0.8865203, -0.1714302, -2.340194, 0.7529412, 1, 0, 1,
-0.8861913, 1.521387, -0.41496, 0.7450981, 1, 0, 1,
-0.8823582, 0.5522653, -1.420208, 0.7411765, 1, 0, 1,
-0.882034, -1.444905, -2.57203, 0.7333333, 1, 0, 1,
-0.8724629, 0.3678621, -2.876861, 0.7294118, 1, 0, 1,
-0.8705819, 0.4071535, -0.2600801, 0.7215686, 1, 0, 1,
-0.8693995, 0.05349609, -1.537024, 0.7176471, 1, 0, 1,
-0.8693827, 0.7057605, -0.8295245, 0.7098039, 1, 0, 1,
-0.864035, 0.5530723, -1.320765, 0.7058824, 1, 0, 1,
-0.8630376, -1.127574, -2.450222, 0.6980392, 1, 0, 1,
-0.8617382, 0.1956901, -1.859402, 0.6901961, 1, 0, 1,
-0.8610426, 0.951166, -1.852466, 0.6862745, 1, 0, 1,
-0.8574167, 1.274922, -1.786505, 0.6784314, 1, 0, 1,
-0.8543419, 0.1527829, -2.258681, 0.6745098, 1, 0, 1,
-0.8536404, -1.065393, -1.484203, 0.6666667, 1, 0, 1,
-0.8487581, -1.36443, -2.700465, 0.6627451, 1, 0, 1,
-0.8467916, 1.619108, 0.9485268, 0.654902, 1, 0, 1,
-0.8444009, 0.7242376, -0.1812423, 0.6509804, 1, 0, 1,
-0.843917, 1.059391, -1.694902, 0.6431373, 1, 0, 1,
-0.8412856, 0.03380703, -1.282505, 0.6392157, 1, 0, 1,
-0.8335925, 0.1426035, -2.042615, 0.6313726, 1, 0, 1,
-0.8223959, 0.5333388, -0.3695506, 0.627451, 1, 0, 1,
-0.8197861, 0.2238856, -2.816291, 0.6196079, 1, 0, 1,
-0.8171996, -1.06506, -3.96252, 0.6156863, 1, 0, 1,
-0.8165224, 0.1825566, 0.5823975, 0.6078432, 1, 0, 1,
-0.8131139, -0.6003127, -3.489399, 0.6039216, 1, 0, 1,
-0.8109351, 1.839404, -0.8885379, 0.5960785, 1, 0, 1,
-0.8018581, 0.7854847, -0.641965, 0.5882353, 1, 0, 1,
-0.8010932, 0.8229324, -1.083401, 0.5843138, 1, 0, 1,
-0.7986665, 0.07660891, -0.5500889, 0.5764706, 1, 0, 1,
-0.7929361, 0.1649882, -1.290627, 0.572549, 1, 0, 1,
-0.7882567, 1.031718, -1.942336, 0.5647059, 1, 0, 1,
-0.7882528, 1.822072, -1.185791, 0.5607843, 1, 0, 1,
-0.7836459, 0.8112155, 0.6614292, 0.5529412, 1, 0, 1,
-0.7824274, 0.3295782, -1.454848, 0.5490196, 1, 0, 1,
-0.7819118, -0.4029822, -2.486504, 0.5411765, 1, 0, 1,
-0.7793676, 0.3460753, -0.3779536, 0.5372549, 1, 0, 1,
-0.7764191, -0.841662, -1.772491, 0.5294118, 1, 0, 1,
-0.7739769, 1.330948, -1.871524, 0.5254902, 1, 0, 1,
-0.7718742, -2.143396, -3.145621, 0.5176471, 1, 0, 1,
-0.7717213, 0.6057551, -0.3414304, 0.5137255, 1, 0, 1,
-0.7716914, 1.783983, -0.4465488, 0.5058824, 1, 0, 1,
-0.7597089, -0.1682817, -1.100826, 0.5019608, 1, 0, 1,
-0.7591815, -0.5082996, -2.397349, 0.4941176, 1, 0, 1,
-0.758472, -0.02828703, -1.825803, 0.4862745, 1, 0, 1,
-0.7541856, -0.2850176, -1.7843, 0.4823529, 1, 0, 1,
-0.747936, 1.06656, -0.1570542, 0.4745098, 1, 0, 1,
-0.7408408, 0.5596088, -0.8090354, 0.4705882, 1, 0, 1,
-0.7295526, 0.5682269, 0.2034342, 0.4627451, 1, 0, 1,
-0.7290906, -0.5189704, -1.536242, 0.4588235, 1, 0, 1,
-0.7270849, 0.09715949, -0.7487925, 0.4509804, 1, 0, 1,
-0.7262579, -2.118334, -2.68022, 0.4470588, 1, 0, 1,
-0.7252567, -0.5908329, -2.845775, 0.4392157, 1, 0, 1,
-0.7225087, 0.2116046, -0.6892536, 0.4352941, 1, 0, 1,
-0.7163329, -1.411257, -2.62787, 0.427451, 1, 0, 1,
-0.7120291, -1.518421, -2.122102, 0.4235294, 1, 0, 1,
-0.7101392, -0.9548085, -2.533598, 0.4156863, 1, 0, 1,
-0.7054521, 0.3742106, -1.393922, 0.4117647, 1, 0, 1,
-0.7051554, 0.9210204, -2.25432, 0.4039216, 1, 0, 1,
-0.7051291, -0.4814327, -1.167177, 0.3960784, 1, 0, 1,
-0.7049662, 0.3092735, -0.1764075, 0.3921569, 1, 0, 1,
-0.693465, 3.035589, 0.2750576, 0.3843137, 1, 0, 1,
-0.6931211, -0.05648346, -1.480504, 0.3803922, 1, 0, 1,
-0.6905771, 2.168403, -0.7292563, 0.372549, 1, 0, 1,
-0.6876114, -0.2850589, -1.116754, 0.3686275, 1, 0, 1,
-0.686731, 0.8164428, 0.6741014, 0.3607843, 1, 0, 1,
-0.6865867, -0.3220897, -1.888677, 0.3568628, 1, 0, 1,
-0.6852266, 0.7324632, -1.611163, 0.3490196, 1, 0, 1,
-0.6842659, 0.4963295, -1.418751, 0.345098, 1, 0, 1,
-0.6828238, -0.5373768, -1.352339, 0.3372549, 1, 0, 1,
-0.6820285, 1.032123, -2.088611, 0.3333333, 1, 0, 1,
-0.6769304, 1.403007, 0.723428, 0.3254902, 1, 0, 1,
-0.6752306, 0.493397, -0.474047, 0.3215686, 1, 0, 1,
-0.673606, -0.2228003, -2.61437, 0.3137255, 1, 0, 1,
-0.6732465, 0.8327069, -2.57566, 0.3098039, 1, 0, 1,
-0.6719518, 0.7869731, -0.7843865, 0.3019608, 1, 0, 1,
-0.6711098, 0.4264832, -0.5660003, 0.2941177, 1, 0, 1,
-0.6698873, -1.381383, -2.748031, 0.2901961, 1, 0, 1,
-0.6692339, -1.225489, -3.760242, 0.282353, 1, 0, 1,
-0.6688836, 0.0173551, -3.076028, 0.2784314, 1, 0, 1,
-0.6637717, 0.7035576, -2.649311, 0.2705882, 1, 0, 1,
-0.6627682, -0.7685168, -1.175236, 0.2666667, 1, 0, 1,
-0.6603173, 0.08273242, -2.953003, 0.2588235, 1, 0, 1,
-0.6560512, -2.327956, -4.629016, 0.254902, 1, 0, 1,
-0.6553352, -1.220971, -2.587368, 0.2470588, 1, 0, 1,
-0.6544023, 0.2208318, -1.428029, 0.2431373, 1, 0, 1,
-0.6520474, 0.2716334, -1.047406, 0.2352941, 1, 0, 1,
-0.6503078, -0.7365171, -2.785172, 0.2313726, 1, 0, 1,
-0.6460776, -1.563284, -4.306643, 0.2235294, 1, 0, 1,
-0.6428578, 0.1136468, -2.451074, 0.2196078, 1, 0, 1,
-0.6414794, -0.1528787, -2.049573, 0.2117647, 1, 0, 1,
-0.6401492, -0.3355597, -3.042514, 0.2078431, 1, 0, 1,
-0.6385711, 1.547344, -0.3319424, 0.2, 1, 0, 1,
-0.6368513, -0.3385233, -3.131768, 0.1921569, 1, 0, 1,
-0.6280818, -0.1575411, -3.590742, 0.1882353, 1, 0, 1,
-0.6276312, 0.07569773, -2.351752, 0.1803922, 1, 0, 1,
-0.6190531, 0.4271181, -2.089907, 0.1764706, 1, 0, 1,
-0.6026682, -0.5945465, -2.956754, 0.1686275, 1, 0, 1,
-0.600262, 0.7587573, 0.9213574, 0.1647059, 1, 0, 1,
-0.596732, 1.699593, -0.3584314, 0.1568628, 1, 0, 1,
-0.5964798, 2.767153, -1.67219, 0.1529412, 1, 0, 1,
-0.5952024, 0.02494672, -1.162978, 0.145098, 1, 0, 1,
-0.5950493, -0.1597823, -1.967848, 0.1411765, 1, 0, 1,
-0.5949065, 3.035661, 0.1711437, 0.1333333, 1, 0, 1,
-0.5909711, -0.7057997, -1.841025, 0.1294118, 1, 0, 1,
-0.5852016, -0.2410925, -2.398169, 0.1215686, 1, 0, 1,
-0.5813066, -0.7059967, -1.930439, 0.1176471, 1, 0, 1,
-0.5808613, -1.416981, -2.89887, 0.1098039, 1, 0, 1,
-0.5786358, 0.7279463, -1.270424, 0.1058824, 1, 0, 1,
-0.5780558, -0.1527114, -0.9233463, 0.09803922, 1, 0, 1,
-0.5735651, -0.3195934, -3.184319, 0.09019608, 1, 0, 1,
-0.5731215, -0.785194, -3.506682, 0.08627451, 1, 0, 1,
-0.5709488, 2.057721, -0.9560345, 0.07843138, 1, 0, 1,
-0.5619406, 1.219467, -0.8531117, 0.07450981, 1, 0, 1,
-0.5617299, -0.6966542, -2.822181, 0.06666667, 1, 0, 1,
-0.5597986, -0.4805348, -2.33207, 0.0627451, 1, 0, 1,
-0.5581188, 0.1083246, -2.668113, 0.05490196, 1, 0, 1,
-0.5570485, 0.1341427, -2.285491, 0.05098039, 1, 0, 1,
-0.5518568, 0.7071835, 0.9746925, 0.04313726, 1, 0, 1,
-0.5507955, -0.03971968, -1.59347, 0.03921569, 1, 0, 1,
-0.5447327, -1.463853, -4.149164, 0.03137255, 1, 0, 1,
-0.5414636, -0.3797046, -2.466184, 0.02745098, 1, 0, 1,
-0.5400376, 0.9820836, 1.638647, 0.01960784, 1, 0, 1,
-0.5296893, -1.055518, -3.024525, 0.01568628, 1, 0, 1,
-0.5237249, 1.187414, -0.8117515, 0.007843138, 1, 0, 1,
-0.5103987, 0.5996033, 0.3760438, 0.003921569, 1, 0, 1,
-0.5050202, -1.062222, -3.97133, 0, 1, 0.003921569, 1,
-0.5027733, 0.8800542, 0.8862638, 0, 1, 0.01176471, 1,
-0.5003475, 2.029067, -0.6643154, 0, 1, 0.01568628, 1,
-0.4972829, -0.1124935, -1.315043, 0, 1, 0.02352941, 1,
-0.495556, -1.784906, -2.90533, 0, 1, 0.02745098, 1,
-0.4923033, -0.1833087, -1.638534, 0, 1, 0.03529412, 1,
-0.4901215, -0.5664605, -3.550615, 0, 1, 0.03921569, 1,
-0.4832335, 0.5858006, -0.891012, 0, 1, 0.04705882, 1,
-0.4758669, 0.4234539, -2.087943, 0, 1, 0.05098039, 1,
-0.475527, 1.766961, 1.361286, 0, 1, 0.05882353, 1,
-0.4728309, -1.529298, -2.88786, 0, 1, 0.0627451, 1,
-0.4686854, -0.09802975, -2.705423, 0, 1, 0.07058824, 1,
-0.4670816, -0.6695659, -2.850024, 0, 1, 0.07450981, 1,
-0.465992, -0.05560827, -2.844367, 0, 1, 0.08235294, 1,
-0.4652981, 1.572682, 0.02218782, 0, 1, 0.08627451, 1,
-0.4635333, 0.4610998, -1.143265, 0, 1, 0.09411765, 1,
-0.4571012, -1.758315, -3.460127, 0, 1, 0.1019608, 1,
-0.4512503, -0.7194822, -2.356896, 0, 1, 0.1058824, 1,
-0.4495189, -0.0391685, -1.140199, 0, 1, 0.1137255, 1,
-0.4482145, -0.9527083, -3.595624, 0, 1, 0.1176471, 1,
-0.4465314, -2.562663, -2.869913, 0, 1, 0.1254902, 1,
-0.44628, -0.2443591, -0.08985495, 0, 1, 0.1294118, 1,
-0.4449479, -0.9400089, -2.220439, 0, 1, 0.1372549, 1,
-0.4420911, -0.912064, -1.95686, 0, 1, 0.1411765, 1,
-0.4395491, 0.3753022, -0.6674895, 0, 1, 0.1490196, 1,
-0.4374736, -1.155706, -2.218304, 0, 1, 0.1529412, 1,
-0.4359563, -0.6999509, -2.087945, 0, 1, 0.1607843, 1,
-0.4309458, -0.4917893, -1.525432, 0, 1, 0.1647059, 1,
-0.4222704, -0.2436481, -2.515795, 0, 1, 0.172549, 1,
-0.4212818, -0.110217, -3.303316, 0, 1, 0.1764706, 1,
-0.4187135, -0.2032979, -2.603688, 0, 1, 0.1843137, 1,
-0.4183376, -0.07969263, -4.34479, 0, 1, 0.1882353, 1,
-0.4176594, -1.006388, -2.56654, 0, 1, 0.1960784, 1,
-0.4143427, 1.32799, -1.372875, 0, 1, 0.2039216, 1,
-0.4036734, 1.654881, 0.1928849, 0, 1, 0.2078431, 1,
-0.403477, 0.9902543, -1.330167, 0, 1, 0.2156863, 1,
-0.4034112, 0.2666671, 0.4329744, 0, 1, 0.2196078, 1,
-0.3981923, 0.4472051, -2.524339, 0, 1, 0.227451, 1,
-0.3966285, 0.8844767, -2.067739, 0, 1, 0.2313726, 1,
-0.3961551, 2.37425, -1.047111, 0, 1, 0.2392157, 1,
-0.3938714, 0.003443963, -2.342173, 0, 1, 0.2431373, 1,
-0.3889029, 0.587489, -0.3994904, 0, 1, 0.2509804, 1,
-0.3884838, 0.5905806, -0.8187775, 0, 1, 0.254902, 1,
-0.3884769, 0.03567128, 0.4664091, 0, 1, 0.2627451, 1,
-0.3879005, -2.788028, -2.802864, 0, 1, 0.2666667, 1,
-0.3870536, 0.5018282, 0.7985665, 0, 1, 0.2745098, 1,
-0.384391, 0.05987961, -0.1085809, 0, 1, 0.2784314, 1,
-0.3788615, -0.3576102, -3.57993, 0, 1, 0.2862745, 1,
-0.3771779, -0.555823, -2.634961, 0, 1, 0.2901961, 1,
-0.3679709, 1.637684, 0.8369747, 0, 1, 0.2980392, 1,
-0.3632256, 0.4425821, 1.250721, 0, 1, 0.3058824, 1,
-0.3606093, -1.620219, -2.018025, 0, 1, 0.3098039, 1,
-0.3533164, 0.115883, -0.6021903, 0, 1, 0.3176471, 1,
-0.3480967, 0.551885, -1.752678, 0, 1, 0.3215686, 1,
-0.3459704, -0.4458177, -3.432021, 0, 1, 0.3294118, 1,
-0.3457215, 0.4323457, 0.006832689, 0, 1, 0.3333333, 1,
-0.3336903, 0.3025025, -0.972967, 0, 1, 0.3411765, 1,
-0.3321869, 0.5623165, -1.543124, 0, 1, 0.345098, 1,
-0.3286556, 1.01232, -1.467386, 0, 1, 0.3529412, 1,
-0.3266138, -1.412408, -0.7335902, 0, 1, 0.3568628, 1,
-0.3264054, 0.6735231, 0.4927432, 0, 1, 0.3647059, 1,
-0.3263169, -1.94737, -2.667336, 0, 1, 0.3686275, 1,
-0.3253487, -0.5790637, -2.860048, 0, 1, 0.3764706, 1,
-0.3237811, -0.8795094, -2.13923, 0, 1, 0.3803922, 1,
-0.3200564, 2.790139, -0.797977, 0, 1, 0.3882353, 1,
-0.3199731, 0.9881318, -0.8413994, 0, 1, 0.3921569, 1,
-0.3156071, -0.3237192, -2.065382, 0, 1, 0.4, 1,
-0.3150642, 1.886147, -0.3665153, 0, 1, 0.4078431, 1,
-0.311901, 0.2045535, -1.901591, 0, 1, 0.4117647, 1,
-0.3084749, -1.070094, -3.936898, 0, 1, 0.4196078, 1,
-0.3054412, 1.260046, -1.312711, 0, 1, 0.4235294, 1,
-0.3052756, -1.112386, -2.443377, 0, 1, 0.4313726, 1,
-0.3003862, 0.1352531, -1.346068, 0, 1, 0.4352941, 1,
-0.2992462, 0.0184429, -0.7944384, 0, 1, 0.4431373, 1,
-0.2989619, 0.1602523, -0.9017849, 0, 1, 0.4470588, 1,
-0.2973921, -0.6352523, -4.034345, 0, 1, 0.454902, 1,
-0.294362, 0.809557, -1.699585, 0, 1, 0.4588235, 1,
-0.2939707, -0.3472823, -2.109494, 0, 1, 0.4666667, 1,
-0.2919691, 0.5473128, -0.2388221, 0, 1, 0.4705882, 1,
-0.2908292, -1.065233, -3.316078, 0, 1, 0.4784314, 1,
-0.2907781, 1.237252, 1.396652, 0, 1, 0.4823529, 1,
-0.2870423, -1.137032, -3.029734, 0, 1, 0.4901961, 1,
-0.286551, -0.9340984, -3.766469, 0, 1, 0.4941176, 1,
-0.2863969, -0.1671826, -1.264201, 0, 1, 0.5019608, 1,
-0.2842239, -0.2044347, -2.672683, 0, 1, 0.509804, 1,
-0.2774134, 0.235876, -1.477372, 0, 1, 0.5137255, 1,
-0.276592, 0.4195946, -1.105005, 0, 1, 0.5215687, 1,
-0.2730476, 0.9695247, -1.458633, 0, 1, 0.5254902, 1,
-0.2659489, -1.369018, -3.241588, 0, 1, 0.5333334, 1,
-0.2634175, 1.468006, 0.5516412, 0, 1, 0.5372549, 1,
-0.2615609, 2.079326, -0.9983487, 0, 1, 0.5450981, 1,
-0.2609739, -1.160744, -3.548772, 0, 1, 0.5490196, 1,
-0.2524627, 0.1716958, 0.1951296, 0, 1, 0.5568628, 1,
-0.2524475, 0.1378674, -2.427667, 0, 1, 0.5607843, 1,
-0.2468591, -1.200602, -2.483033, 0, 1, 0.5686275, 1,
-0.2444464, 0.6272601, -0.03229083, 0, 1, 0.572549, 1,
-0.2401641, -0.4205738, -3.059054, 0, 1, 0.5803922, 1,
-0.2379398, -0.720039, -3.753193, 0, 1, 0.5843138, 1,
-0.2330659, 0.9997713, -0.05685896, 0, 1, 0.5921569, 1,
-0.2324994, 0.9122248, 0.6904734, 0, 1, 0.5960785, 1,
-0.2301602, 1.327217, -1.826691, 0, 1, 0.6039216, 1,
-0.2259147, -0.7041852, -1.045754, 0, 1, 0.6117647, 1,
-0.2140083, 1.562329, 0.5230076, 0, 1, 0.6156863, 1,
-0.2136834, -1.345132, -2.381357, 0, 1, 0.6235294, 1,
-0.2135651, 1.455024, 0.7937005, 0, 1, 0.627451, 1,
-0.2132566, 1.23229, 1.135494, 0, 1, 0.6352941, 1,
-0.2118572, 2.379736, -1.032502, 0, 1, 0.6392157, 1,
-0.2093052, 1.068026, 0.5281941, 0, 1, 0.6470588, 1,
-0.2061978, -2.151457, -2.713067, 0, 1, 0.6509804, 1,
-0.2061857, -0.06045311, -1.541261, 0, 1, 0.6588235, 1,
-0.2034864, 0.8495041, -0.8478214, 0, 1, 0.6627451, 1,
-0.2034557, -0.565104, -4.16989, 0, 1, 0.6705883, 1,
-0.2021564, 0.0920564, 0.9830239, 0, 1, 0.6745098, 1,
-0.2017335, -0.7790067, -2.564014, 0, 1, 0.682353, 1,
-0.2006924, 0.2839206, -1.362393, 0, 1, 0.6862745, 1,
-0.1945041, -1.873076, -2.174166, 0, 1, 0.6941177, 1,
-0.194337, -0.06543616, -1.887351, 0, 1, 0.7019608, 1,
-0.1930709, -0.8783845, -4.070971, 0, 1, 0.7058824, 1,
-0.1930233, 0.7235904, -0.399976, 0, 1, 0.7137255, 1,
-0.1901049, 0.1051165, -0.6491897, 0, 1, 0.7176471, 1,
-0.1874738, 1.044253, -0.9174783, 0, 1, 0.7254902, 1,
-0.1833629, 0.8325401, 0.6615428, 0, 1, 0.7294118, 1,
-0.1822511, -0.1282011, -1.874686, 0, 1, 0.7372549, 1,
-0.1804948, 0.3705158, 0.06951761, 0, 1, 0.7411765, 1,
-0.1787659, -1.273225, -3.432905, 0, 1, 0.7490196, 1,
-0.1783545, -1.845157, -3.853862, 0, 1, 0.7529412, 1,
-0.1757063, 1.524816, -1.063788, 0, 1, 0.7607843, 1,
-0.1693371, -1.902676, -1.535241, 0, 1, 0.7647059, 1,
-0.168941, -1.429229, -2.497502, 0, 1, 0.772549, 1,
-0.1645077, -0.4869265, -4.321838, 0, 1, 0.7764706, 1,
-0.1515623, -0.7770991, -2.586563, 0, 1, 0.7843137, 1,
-0.1515303, 0.2154198, 1.422136, 0, 1, 0.7882353, 1,
-0.1501045, 1.63353, -1.960359, 0, 1, 0.7960784, 1,
-0.14962, -0.5017004, -2.650424, 0, 1, 0.8039216, 1,
-0.146724, 1.226342, 0.6930998, 0, 1, 0.8078431, 1,
-0.1455294, 0.2971818, -1.861245, 0, 1, 0.8156863, 1,
-0.1438049, 0.2899588, -1.109789, 0, 1, 0.8196079, 1,
-0.1431073, 0.3479313, -0.9938642, 0, 1, 0.827451, 1,
-0.1419785, 0.1355833, -1.337518, 0, 1, 0.8313726, 1,
-0.139381, 0.8096756, 0.3837143, 0, 1, 0.8392157, 1,
-0.1393359, 1.073969, 0.06178544, 0, 1, 0.8431373, 1,
-0.1376948, -1.842516, -3.274816, 0, 1, 0.8509804, 1,
-0.1283207, -0.9029155, -3.74321, 0, 1, 0.854902, 1,
-0.1264396, -0.1508234, -4.168389, 0, 1, 0.8627451, 1,
-0.1237792, 0.9321938, 1.260759, 0, 1, 0.8666667, 1,
-0.1153482, -0.3966902, -2.337957, 0, 1, 0.8745098, 1,
-0.1105145, 1.181901, 0.838729, 0, 1, 0.8784314, 1,
-0.1100755, 1.290595, 1.766932, 0, 1, 0.8862745, 1,
-0.1030865, 0.6292071, 0.06174593, 0, 1, 0.8901961, 1,
-0.1006456, -1.05166, -2.551641, 0, 1, 0.8980392, 1,
-0.09987134, -0.3916596, -1.354944, 0, 1, 0.9058824, 1,
-0.09948322, -0.4834118, -3.093271, 0, 1, 0.9098039, 1,
-0.0960241, 0.1442928, -0.495877, 0, 1, 0.9176471, 1,
-0.09226479, -0.2683207, -2.881232, 0, 1, 0.9215686, 1,
-0.08194076, -1.104768, -3.429976, 0, 1, 0.9294118, 1,
-0.07874984, 0.310212, 0.8622527, 0, 1, 0.9333333, 1,
-0.06640057, 0.4127372, -0.1505606, 0, 1, 0.9411765, 1,
-0.0658581, -2.078503, -3.403349, 0, 1, 0.945098, 1,
-0.06306925, 0.794222, 1.663804, 0, 1, 0.9529412, 1,
-0.0581274, 1.891157, -0.7554785, 0, 1, 0.9568627, 1,
-0.05780326, 0.2217595, -1.808901, 0, 1, 0.9647059, 1,
-0.05667, 1.461372, 1.725397, 0, 1, 0.9686275, 1,
-0.05232901, -0.1749574, -1.723092, 0, 1, 0.9764706, 1,
-0.04914699, -0.7427506, -2.687362, 0, 1, 0.9803922, 1,
-0.04525054, 0.6358718, 1.13224, 0, 1, 0.9882353, 1,
-0.04477851, -0.2688856, -3.754649, 0, 1, 0.9921569, 1,
-0.04420865, 0.2842537, -0.4229923, 0, 1, 1, 1,
-0.0399419, -1.125268, -4.841275, 0, 0.9921569, 1, 1,
-0.03757019, 1.024606, 1.484225, 0, 0.9882353, 1, 1,
-0.03379968, -0.1503064, -2.213303, 0, 0.9803922, 1, 1,
-0.03356988, 1.867844, -0.07564288, 0, 0.9764706, 1, 1,
-0.03353506, 0.227363, -0.609211, 0, 0.9686275, 1, 1,
-0.03126579, -0.8625196, -4.202299, 0, 0.9647059, 1, 1,
-0.02763437, 0.3735698, -0.1604765, 0, 0.9568627, 1, 1,
-0.02598106, -0.7695999, -0.9918551, 0, 0.9529412, 1, 1,
-0.02290762, 1.340105, 1.977493, 0, 0.945098, 1, 1,
-0.02031311, -0.1023966, -1.34589, 0, 0.9411765, 1, 1,
-0.009812478, -0.07569521, -3.136937, 0, 0.9333333, 1, 1,
-0.008287106, 0.01877197, 1.268227, 0, 0.9294118, 1, 1,
-0.005162244, -0.887822, -2.276458, 0, 0.9215686, 1, 1,
-0.003897948, -0.9552515, -2.562718, 0, 0.9176471, 1, 1,
0.0004237825, -0.1446154, 1.859799, 0, 0.9098039, 1, 1,
0.002835753, 0.8292528, -0.790038, 0, 0.9058824, 1, 1,
0.003067503, -0.05487099, 3.40252, 0, 0.8980392, 1, 1,
0.003834965, -0.7469115, 3.85747, 0, 0.8901961, 1, 1,
0.005652283, 0.7481554, 0.1910638, 0, 0.8862745, 1, 1,
0.008355227, -1.925026, 2.669996, 0, 0.8784314, 1, 1,
0.01313531, -0.9927027, 3.138245, 0, 0.8745098, 1, 1,
0.01650839, 1.507683, 0.4978361, 0, 0.8666667, 1, 1,
0.02734656, -0.7409326, 2.806638, 0, 0.8627451, 1, 1,
0.03356373, -0.3284522, 2.709082, 0, 0.854902, 1, 1,
0.03700051, -1.150857, 3.79742, 0, 0.8509804, 1, 1,
0.03818512, -1.201694, 3.101439, 0, 0.8431373, 1, 1,
0.040197, -1.661049, 3.810152, 0, 0.8392157, 1, 1,
0.04090246, 0.02284551, 1.598876, 0, 0.8313726, 1, 1,
0.04785855, -0.3110564, 4.177247, 0, 0.827451, 1, 1,
0.05080392, 0.7646834, -0.774337, 0, 0.8196079, 1, 1,
0.05231296, 1.794345, -0.5218477, 0, 0.8156863, 1, 1,
0.0574204, -0.139734, 2.159851, 0, 0.8078431, 1, 1,
0.06656721, 0.3590805, -0.07947744, 0, 0.8039216, 1, 1,
0.06797976, 0.8670425, -1.355168, 0, 0.7960784, 1, 1,
0.07138474, -1.639664, 3.605828, 0, 0.7882353, 1, 1,
0.07266677, 1.409181, 0.7932798, 0, 0.7843137, 1, 1,
0.07342283, 1.256537, 0.6206257, 0, 0.7764706, 1, 1,
0.07636746, -1.792941, 4.374689, 0, 0.772549, 1, 1,
0.07693711, -1.653615, 2.951774, 0, 0.7647059, 1, 1,
0.07868616, 0.7119886, 1.159401, 0, 0.7607843, 1, 1,
0.07906608, -1.985732, 3.679706, 0, 0.7529412, 1, 1,
0.07968339, 0.2834237, -0.2456415, 0, 0.7490196, 1, 1,
0.08090729, 0.2857757, -0.7889891, 0, 0.7411765, 1, 1,
0.08317962, -0.4669002, 2.278173, 0, 0.7372549, 1, 1,
0.08823409, 2.273047, 0.3199158, 0, 0.7294118, 1, 1,
0.09012723, 0.02774414, 0.9883128, 0, 0.7254902, 1, 1,
0.09387279, -1.126552, 4.135141, 0, 0.7176471, 1, 1,
0.0962198, -0.2647145, 2.813349, 0, 0.7137255, 1, 1,
0.09850255, -0.8977283, 2.848328, 0, 0.7058824, 1, 1,
0.1004418, 0.8877378, -0.4566117, 0, 0.6980392, 1, 1,
0.103157, -0.7879138, 1.340215, 0, 0.6941177, 1, 1,
0.106523, 0.08132751, 0.591363, 0, 0.6862745, 1, 1,
0.1068087, -0.1148895, 2.90367, 0, 0.682353, 1, 1,
0.1090493, -0.1556424, 3.095003, 0, 0.6745098, 1, 1,
0.1137557, 1.321261, -0.97973, 0, 0.6705883, 1, 1,
0.1167556, 0.1720234, -0.154988, 0, 0.6627451, 1, 1,
0.1171182, 0.02697481, 0.5778275, 0, 0.6588235, 1, 1,
0.1208618, 0.3616782, -2.304525, 0, 0.6509804, 1, 1,
0.1244389, -0.4434854, 2.19758, 0, 0.6470588, 1, 1,
0.1245668, -1.361423, 4.551253, 0, 0.6392157, 1, 1,
0.1316747, 0.2279103, -0.2185957, 0, 0.6352941, 1, 1,
0.1374712, 1.095292, 0.8711238, 0, 0.627451, 1, 1,
0.140574, 0.1799751, 1.221565, 0, 0.6235294, 1, 1,
0.1454073, 0.432221, 0.7125801, 0, 0.6156863, 1, 1,
0.1470634, 0.222566, 1.574457, 0, 0.6117647, 1, 1,
0.1473573, 0.971926, -0.3450823, 0, 0.6039216, 1, 1,
0.14922, -0.5130999, 3.715684, 0, 0.5960785, 1, 1,
0.1500207, 0.3276753, -1.668421, 0, 0.5921569, 1, 1,
0.1529797, 0.02193011, 0.8135431, 0, 0.5843138, 1, 1,
0.1542171, 0.09901237, 0.2371024, 0, 0.5803922, 1, 1,
0.1557057, -0.351796, 4.079989, 0, 0.572549, 1, 1,
0.1557083, -0.5739869, 3.010616, 0, 0.5686275, 1, 1,
0.1580342, -1.436444, 2.991354, 0, 0.5607843, 1, 1,
0.1626556, -0.03322407, 1.008459, 0, 0.5568628, 1, 1,
0.1645148, -2.43744, 3.396116, 0, 0.5490196, 1, 1,
0.1691256, -0.3810126, 3.006287, 0, 0.5450981, 1, 1,
0.1701248, 1.073279, -0.7832313, 0, 0.5372549, 1, 1,
0.1715614, 0.03594983, 1.279281, 0, 0.5333334, 1, 1,
0.1725444, -1.622157, 2.648558, 0, 0.5254902, 1, 1,
0.1738992, 1.284966, 0.6291553, 0, 0.5215687, 1, 1,
0.1751032, 0.6848159, 1.111796, 0, 0.5137255, 1, 1,
0.176739, -1.131602, 2.84554, 0, 0.509804, 1, 1,
0.1778602, 0.7034049, 0.4438946, 0, 0.5019608, 1, 1,
0.1815527, 0.0508462, 2.23346, 0, 0.4941176, 1, 1,
0.1816354, -0.7830942, 4.119209, 0, 0.4901961, 1, 1,
0.1857383, -0.4908268, 1.388526, 0, 0.4823529, 1, 1,
0.1871114, 0.9350084, -1.147779, 0, 0.4784314, 1, 1,
0.1898996, -0.1220302, 3.003096, 0, 0.4705882, 1, 1,
0.1925789, 0.1556566, 2.412281, 0, 0.4666667, 1, 1,
0.1930686, 0.6396263, -0.8892991, 0, 0.4588235, 1, 1,
0.1957783, 0.8810793, 0.4916607, 0, 0.454902, 1, 1,
0.1987548, 0.5033924, 0.8505481, 0, 0.4470588, 1, 1,
0.198837, -2.210588, 2.393723, 0, 0.4431373, 1, 1,
0.2031011, 0.3008166, -0.6973337, 0, 0.4352941, 1, 1,
0.2110587, 1.102941, 0.6782321, 0, 0.4313726, 1, 1,
0.2116474, 1.320766, -1.073465, 0, 0.4235294, 1, 1,
0.2150811, -0.9724593, 3.718341, 0, 0.4196078, 1, 1,
0.2179036, 2.82378, 2.814852, 0, 0.4117647, 1, 1,
0.2191125, -0.311667, 0.7656639, 0, 0.4078431, 1, 1,
0.2274318, 0.1300014, 1.27761, 0, 0.4, 1, 1,
0.2298369, 0.6194834, 0.1547808, 0, 0.3921569, 1, 1,
0.2313736, -0.5663914, 1.807178, 0, 0.3882353, 1, 1,
0.2344014, 2.089313, -0.1263373, 0, 0.3803922, 1, 1,
0.2366888, 0.3769194, 0.5601572, 0, 0.3764706, 1, 1,
0.236801, -0.5754063, 3.105681, 0, 0.3686275, 1, 1,
0.2381893, -0.1261916, 2.507682, 0, 0.3647059, 1, 1,
0.2386504, 0.4497717, 0.5047751, 0, 0.3568628, 1, 1,
0.2408544, -0.3017388, 3.125726, 0, 0.3529412, 1, 1,
0.2418277, -0.0693326, 2.126409, 0, 0.345098, 1, 1,
0.248382, -1.546544, 2.71069, 0, 0.3411765, 1, 1,
0.2541749, -0.1116348, -0.2027551, 0, 0.3333333, 1, 1,
0.2569201, -0.9107949, 2.785933, 0, 0.3294118, 1, 1,
0.2634656, 0.4928068, 2.11632, 0, 0.3215686, 1, 1,
0.2668674, -0.7742795, 1.842475, 0, 0.3176471, 1, 1,
0.2675346, 0.03568026, -0.5042223, 0, 0.3098039, 1, 1,
0.2691158, 1.828761, -0.4736315, 0, 0.3058824, 1, 1,
0.2812572, 0.5357651, 0.5261639, 0, 0.2980392, 1, 1,
0.2813308, 0.8633195, 0.00168326, 0, 0.2901961, 1, 1,
0.2862403, -1.626374, 3.599337, 0, 0.2862745, 1, 1,
0.2895574, -1.13801, 3.781134, 0, 0.2784314, 1, 1,
0.290632, 0.07496632, 0.6649697, 0, 0.2745098, 1, 1,
0.2927015, -1.10119, 2.505612, 0, 0.2666667, 1, 1,
0.2939608, 0.1177838, 0.3997366, 0, 0.2627451, 1, 1,
0.3090297, -1.08358, 3.643224, 0, 0.254902, 1, 1,
0.3090487, -3.049359, 2.667999, 0, 0.2509804, 1, 1,
0.3116852, -0.1974765, 2.08079, 0, 0.2431373, 1, 1,
0.3138524, -0.8148671, 2.87748, 0, 0.2392157, 1, 1,
0.3243645, -1.010989, 1.551669, 0, 0.2313726, 1, 1,
0.3245002, -0.04126268, 1.379287, 0, 0.227451, 1, 1,
0.3251807, 0.1730927, 0.5606031, 0, 0.2196078, 1, 1,
0.3261103, 0.09736725, 2.238495, 0, 0.2156863, 1, 1,
0.3276838, -0.5217218, 2.188093, 0, 0.2078431, 1, 1,
0.3300387, 0.1525438, 1.347104, 0, 0.2039216, 1, 1,
0.3312747, -0.3620524, 1.313495, 0, 0.1960784, 1, 1,
0.3339968, -0.3588545, 2.7289, 0, 0.1882353, 1, 1,
0.3340017, -0.6173021, 3.035161, 0, 0.1843137, 1, 1,
0.3359304, -0.06596831, 0.3161715, 0, 0.1764706, 1, 1,
0.337619, -1.138677, 3.443073, 0, 0.172549, 1, 1,
0.3405436, 0.7808582, 0.2096679, 0, 0.1647059, 1, 1,
0.3412975, -0.1948841, 2.947182, 0, 0.1607843, 1, 1,
0.3436381, -1.089621, 1.935795, 0, 0.1529412, 1, 1,
0.3478145, -1.430184, 2.785998, 0, 0.1490196, 1, 1,
0.3496596, -0.4003535, 2.117801, 0, 0.1411765, 1, 1,
0.3499793, 1.276431, -1.688948, 0, 0.1372549, 1, 1,
0.3622486, -0.7779769, 4.945732, 0, 0.1294118, 1, 1,
0.3650946, 0.1825562, 1.441871, 0, 0.1254902, 1, 1,
0.3724661, -0.4987912, 1.751384, 0, 0.1176471, 1, 1,
0.3798644, 0.2448405, 2.979192, 0, 0.1137255, 1, 1,
0.3805339, -0.6428817, 3.179084, 0, 0.1058824, 1, 1,
0.3808152, 0.9860788, 2.384152, 0, 0.09803922, 1, 1,
0.3810941, 0.7396004, 0.8565664, 0, 0.09411765, 1, 1,
0.3813556, -0.08983079, 3.002048, 0, 0.08627451, 1, 1,
0.3815297, -1.888877, 4.841903, 0, 0.08235294, 1, 1,
0.3867913, -0.9887778, 2.523921, 0, 0.07450981, 1, 1,
0.3928084, 0.7077057, -1.250577, 0, 0.07058824, 1, 1,
0.3934395, 1.766876, -1.135206, 0, 0.0627451, 1, 1,
0.3988523, 0.8383203, -0.8792602, 0, 0.05882353, 1, 1,
0.3991882, 1.022603, 0.7869841, 0, 0.05098039, 1, 1,
0.4029567, 0.06938092, 0.9815315, 0, 0.04705882, 1, 1,
0.4052144, 1.288993, 0.03025648, 0, 0.03921569, 1, 1,
0.4056531, -0.8833855, 1.32703, 0, 0.03529412, 1, 1,
0.4087297, -1.085052, 3.08829, 0, 0.02745098, 1, 1,
0.41142, 1.21136, -0.1753165, 0, 0.02352941, 1, 1,
0.4140691, -0.3920116, 1.492844, 0, 0.01568628, 1, 1,
0.415283, -1.122712, 2.71871, 0, 0.01176471, 1, 1,
0.415554, 0.280916, 0.6143585, 0, 0.003921569, 1, 1,
0.4182627, 0.416574, -1.738035, 0.003921569, 0, 1, 1,
0.4187405, 0.2561189, 0.8378739, 0.007843138, 0, 1, 1,
0.4189689, 1.352141, -0.1154923, 0.01568628, 0, 1, 1,
0.4224273, -0.2243859, 1.574021, 0.01960784, 0, 1, 1,
0.4235548, 0.00342251, 0.5869144, 0.02745098, 0, 1, 1,
0.4251707, -0.8967336, 2.031956, 0.03137255, 0, 1, 1,
0.4279488, -0.8847781, 2.625799, 0.03921569, 0, 1, 1,
0.4305929, 0.6178906, 0.9414652, 0.04313726, 0, 1, 1,
0.4310986, -2.276841, 1.987656, 0.05098039, 0, 1, 1,
0.4315192, 0.1482781, 0.07508624, 0.05490196, 0, 1, 1,
0.4377137, 0.3693525, 2.159469, 0.0627451, 0, 1, 1,
0.4380835, -0.4962681, 1.723489, 0.06666667, 0, 1, 1,
0.4412972, -0.347843, 1.115228, 0.07450981, 0, 1, 1,
0.4420627, -1.03003, 1.599497, 0.07843138, 0, 1, 1,
0.4436873, 0.7133458, 1.726542, 0.08627451, 0, 1, 1,
0.4477051, -1.010392, 2.224337, 0.09019608, 0, 1, 1,
0.4497552, 0.3659665, -0.2564791, 0.09803922, 0, 1, 1,
0.45286, 0.9766102, 0.4584147, 0.1058824, 0, 1, 1,
0.4605714, -0.3968485, 3.432575, 0.1098039, 0, 1, 1,
0.4736731, 0.5973517, 0.3607205, 0.1176471, 0, 1, 1,
0.4769739, -1.276834, 2.401875, 0.1215686, 0, 1, 1,
0.4769967, -2.943776, 2.939167, 0.1294118, 0, 1, 1,
0.4807107, -0.2850133, 0.7339101, 0.1333333, 0, 1, 1,
0.4807654, 0.3328364, -0.1644221, 0.1411765, 0, 1, 1,
0.4841499, 0.03166449, 2.372508, 0.145098, 0, 1, 1,
0.5029033, -1.032895, 4.729272, 0.1529412, 0, 1, 1,
0.5036399, 0.4368009, 1.385717, 0.1568628, 0, 1, 1,
0.5068059, -1.941714, 3.707205, 0.1647059, 0, 1, 1,
0.5125357, 0.5170296, 0.9651041, 0.1686275, 0, 1, 1,
0.5144451, 2.10518, -0.119315, 0.1764706, 0, 1, 1,
0.5195776, -0.3445824, 1.927014, 0.1803922, 0, 1, 1,
0.5225189, 0.4010762, 0.05702327, 0.1882353, 0, 1, 1,
0.5283452, -1.164115, 2.963065, 0.1921569, 0, 1, 1,
0.5392461, -0.6804679, 3.738586, 0.2, 0, 1, 1,
0.54391, 0.04602715, 0.8649294, 0.2078431, 0, 1, 1,
0.5444573, -1.080477, 3.787361, 0.2117647, 0, 1, 1,
0.5479442, -1.843595, 3.972235, 0.2196078, 0, 1, 1,
0.5537508, 0.06960669, 4.155491, 0.2235294, 0, 1, 1,
0.5639197, -0.824724, 3.249021, 0.2313726, 0, 1, 1,
0.5664893, -0.4345507, 2.591797, 0.2352941, 0, 1, 1,
0.569115, -0.0636729, 2.262155, 0.2431373, 0, 1, 1,
0.5793929, -0.4575515, 0.8720962, 0.2470588, 0, 1, 1,
0.5800769, -0.8211493, 2.907348, 0.254902, 0, 1, 1,
0.5823473, -0.2331089, 0.231317, 0.2588235, 0, 1, 1,
0.5876405, -0.4178237, 2.24039, 0.2666667, 0, 1, 1,
0.5877283, -0.9896292, 4.634339, 0.2705882, 0, 1, 1,
0.5886881, -0.2508424, 1.085565, 0.2784314, 0, 1, 1,
0.5902953, 1.198109, 1.048079, 0.282353, 0, 1, 1,
0.590899, -0.2974052, 0.8670672, 0.2901961, 0, 1, 1,
0.5940291, 0.3696033, 0.9875809, 0.2941177, 0, 1, 1,
0.5943874, 1.042753, -0.4802994, 0.3019608, 0, 1, 1,
0.594741, 0.2438665, 2.049056, 0.3098039, 0, 1, 1,
0.5982893, -0.6138274, 2.132978, 0.3137255, 0, 1, 1,
0.5984057, 0.7606519, 1.062079, 0.3215686, 0, 1, 1,
0.5988321, -1.309793, 4.036045, 0.3254902, 0, 1, 1,
0.5999923, -0.1593261, 0.9829329, 0.3333333, 0, 1, 1,
0.6033503, -1.233779, 2.48773, 0.3372549, 0, 1, 1,
0.6053495, 2.255361, 0.01333578, 0.345098, 0, 1, 1,
0.6085424, 0.5001796, 0.8998638, 0.3490196, 0, 1, 1,
0.6098412, 0.9663351, 0.3397113, 0.3568628, 0, 1, 1,
0.6109236, -2.38476, 3.161416, 0.3607843, 0, 1, 1,
0.6152819, -0.9669415, 2.941045, 0.3686275, 0, 1, 1,
0.6178201, -0.4058225, 3.36629, 0.372549, 0, 1, 1,
0.629272, -0.07052141, 3.065835, 0.3803922, 0, 1, 1,
0.6346421, 1.37445, 0.1804655, 0.3843137, 0, 1, 1,
0.6350445, 0.9371169, -1.370953, 0.3921569, 0, 1, 1,
0.6368016, 0.1772089, -0.2094796, 0.3960784, 0, 1, 1,
0.6368495, -0.07742027, 1.375792, 0.4039216, 0, 1, 1,
0.6388248, 0.3851993, -0.1317365, 0.4117647, 0, 1, 1,
0.6478156, -0.4283481, 2.918225, 0.4156863, 0, 1, 1,
0.6489161, -0.9032163, 0.7161412, 0.4235294, 0, 1, 1,
0.6498742, 0.9237717, -1.236041, 0.427451, 0, 1, 1,
0.6513388, -0.9905764, 1.962351, 0.4352941, 0, 1, 1,
0.6537248, -0.5376683, 1.655337, 0.4392157, 0, 1, 1,
0.6546054, 0.03601846, 2.049959, 0.4470588, 0, 1, 1,
0.664157, -2.166333, 2.817683, 0.4509804, 0, 1, 1,
0.6645993, 1.194077, 1.178002, 0.4588235, 0, 1, 1,
0.669071, 0.6061805, 0.680958, 0.4627451, 0, 1, 1,
0.6838506, -0.5792547, 4.969391, 0.4705882, 0, 1, 1,
0.684988, 0.09145878, 1.107733, 0.4745098, 0, 1, 1,
0.6886047, -1.179825, 3.940925, 0.4823529, 0, 1, 1,
0.6911772, 0.1373741, 2.513825, 0.4862745, 0, 1, 1,
0.6912633, 0.6972564, -0.07490466, 0.4941176, 0, 1, 1,
0.6914595, 0.6550337, 0.1210659, 0.5019608, 0, 1, 1,
0.6951632, -0.120493, 2.382839, 0.5058824, 0, 1, 1,
0.6968345, -0.1079106, 0.9725934, 0.5137255, 0, 1, 1,
0.7015884, -0.8330103, 0.3158911, 0.5176471, 0, 1, 1,
0.7051088, -0.6082872, 0.5515328, 0.5254902, 0, 1, 1,
0.707798, 0.3856973, -0.7931876, 0.5294118, 0, 1, 1,
0.7089337, -1.664525, 4.197694, 0.5372549, 0, 1, 1,
0.7116275, 1.473423, 1.05674, 0.5411765, 0, 1, 1,
0.721359, -1.323323, 4.55981, 0.5490196, 0, 1, 1,
0.7234457, -0.9401557, 0.9439845, 0.5529412, 0, 1, 1,
0.7240148, 0.3005849, 2.295819, 0.5607843, 0, 1, 1,
0.7250636, 0.7522315, 0.7070661, 0.5647059, 0, 1, 1,
0.7299771, 1.686924, -1.062822, 0.572549, 0, 1, 1,
0.7396874, 0.1107593, 0.1499444, 0.5764706, 0, 1, 1,
0.7414261, 2.51136, 0.7844819, 0.5843138, 0, 1, 1,
0.7428312, 0.4329807, 1.873979, 0.5882353, 0, 1, 1,
0.7452664, -0.3587674, 1.775117, 0.5960785, 0, 1, 1,
0.7465014, 2.214506, 0.5046251, 0.6039216, 0, 1, 1,
0.7553282, 1.401499, 0.6609998, 0.6078432, 0, 1, 1,
0.7569943, -0.4599134, 2.160522, 0.6156863, 0, 1, 1,
0.758679, -2.560132, 2.910553, 0.6196079, 0, 1, 1,
0.7610436, 0.2633622, 1.800029, 0.627451, 0, 1, 1,
0.7654642, 0.02872086, 1.460256, 0.6313726, 0, 1, 1,
0.7684842, 1.449828, 0.6698881, 0.6392157, 0, 1, 1,
0.7744369, -0.4508049, 1.485581, 0.6431373, 0, 1, 1,
0.7748879, 0.04080296, -0.08988407, 0.6509804, 0, 1, 1,
0.7756285, -1.019681, 2.438231, 0.654902, 0, 1, 1,
0.7777261, 0.4793768, 1.158775, 0.6627451, 0, 1, 1,
0.7787499, -0.269242, 2.838348, 0.6666667, 0, 1, 1,
0.7825767, -2.579057, 2.160029, 0.6745098, 0, 1, 1,
0.7840567, -0.2508834, 2.416575, 0.6784314, 0, 1, 1,
0.7853684, 1.096594, 2.223459, 0.6862745, 0, 1, 1,
0.786746, 0.5973876, 2.196506, 0.6901961, 0, 1, 1,
0.7886658, -0.1795974, 2.992159, 0.6980392, 0, 1, 1,
0.7893725, 0.4163485, 2.008231, 0.7058824, 0, 1, 1,
0.7902631, -0.3347537, 2.400906, 0.7098039, 0, 1, 1,
0.7959692, 0.808584, 0.3883734, 0.7176471, 0, 1, 1,
0.7966948, -1.243455, 2.610469, 0.7215686, 0, 1, 1,
0.8016796, 0.5170411, 2.140345, 0.7294118, 0, 1, 1,
0.8037853, 2.328521, 1.266447, 0.7333333, 0, 1, 1,
0.8042673, -0.4862659, 1.554989, 0.7411765, 0, 1, 1,
0.8106084, -1.139374, 4.005927, 0.7450981, 0, 1, 1,
0.8130287, 0.4565738, 1.285532, 0.7529412, 0, 1, 1,
0.8134194, 1.696075, 1.689355, 0.7568628, 0, 1, 1,
0.8153925, -0.5498522, 0.8293242, 0.7647059, 0, 1, 1,
0.8158002, -1.656173, 3.256735, 0.7686275, 0, 1, 1,
0.8166436, -1.986253, 2.015852, 0.7764706, 0, 1, 1,
0.8191668, 0.5695801, 0.008795883, 0.7803922, 0, 1, 1,
0.8201951, -0.05863525, 1.929761, 0.7882353, 0, 1, 1,
0.8247135, 0.8297796, 1.327812, 0.7921569, 0, 1, 1,
0.8258465, 0.5660577, 2.191323, 0.8, 0, 1, 1,
0.8356658, 0.7447699, 1.323354, 0.8078431, 0, 1, 1,
0.8385364, -0.3044538, 2.138331, 0.8117647, 0, 1, 1,
0.8401945, -0.7007335, 2.475887, 0.8196079, 0, 1, 1,
0.8446571, 0.2563223, 0.346756, 0.8235294, 0, 1, 1,
0.8530722, 1.454806, 2.130831, 0.8313726, 0, 1, 1,
0.853431, -0.3589792, 3.447762, 0.8352941, 0, 1, 1,
0.8587437, -1.202544, 3.512177, 0.8431373, 0, 1, 1,
0.8606941, -0.614987, 2.013206, 0.8470588, 0, 1, 1,
0.8610089, -0.6104911, 1.10358, 0.854902, 0, 1, 1,
0.8616182, 0.3673529, 2.00295, 0.8588235, 0, 1, 1,
0.8655452, -0.8504128, 0.760806, 0.8666667, 0, 1, 1,
0.8658014, 0.9748226, 0.2549056, 0.8705882, 0, 1, 1,
0.8674979, -0.6269635, 2.102612, 0.8784314, 0, 1, 1,
0.8699159, -0.8360234, 2.431236, 0.8823529, 0, 1, 1,
0.8705175, 2.525767, 0.1696859, 0.8901961, 0, 1, 1,
0.8731069, -0.970112, 0.7790355, 0.8941177, 0, 1, 1,
0.8773377, 1.800759, -2.791457, 0.9019608, 0, 1, 1,
0.8823415, 1.439819, 3.083612, 0.9098039, 0, 1, 1,
0.8868563, 0.1723034, 2.208979, 0.9137255, 0, 1, 1,
0.8908195, -0.1062213, 0.7562663, 0.9215686, 0, 1, 1,
0.8943853, -0.5682568, 2.081695, 0.9254902, 0, 1, 1,
0.8978603, -2.727495, 2.851845, 0.9333333, 0, 1, 1,
0.8997276, -1.693936, 1.812626, 0.9372549, 0, 1, 1,
0.9025992, 0.308586, 2.291066, 0.945098, 0, 1, 1,
0.9037699, 0.6763102, 2.54098, 0.9490196, 0, 1, 1,
0.9042447, -0.6804169, 1.908177, 0.9568627, 0, 1, 1,
0.909748, 0.1835893, 1.041173, 0.9607843, 0, 1, 1,
0.9098285, 2.460791, 0.7292618, 0.9686275, 0, 1, 1,
0.9106939, -0.4053511, 1.547791, 0.972549, 0, 1, 1,
0.9168183, 0.0983052, 3.94844, 0.9803922, 0, 1, 1,
0.9217014, -0.9357348, 1.847099, 0.9843137, 0, 1, 1,
0.9263902, 0.9309799, 1.576349, 0.9921569, 0, 1, 1,
0.9322734, -2.018942, 1.463657, 0.9960784, 0, 1, 1,
0.9423558, 0.6659191, 1.487332, 1, 0, 0.9960784, 1,
0.9602, 1.442596, 0.5102665, 1, 0, 0.9882353, 1,
0.9606903, 0.4392788, 1.844674, 1, 0, 0.9843137, 1,
0.9652179, -0.7284662, 3.164805, 1, 0, 0.9764706, 1,
0.9703476, 0.9596707, 0.6401318, 1, 0, 0.972549, 1,
0.9783923, 0.3618119, 0.3288668, 1, 0, 0.9647059, 1,
0.9793671, 1.165539, 0.9901191, 1, 0, 0.9607843, 1,
0.981227, -0.5539927, 2.311907, 1, 0, 0.9529412, 1,
0.9909654, 1.647825, 0.9287236, 1, 0, 0.9490196, 1,
0.9938172, 0.1051258, 1.502257, 1, 0, 0.9411765, 1,
0.9972305, -0.4753285, 4.108016, 1, 0, 0.9372549, 1,
1.003664, 0.7086633, 1.117244, 1, 0, 0.9294118, 1,
1.006087, -0.1316068, 0.6075987, 1, 0, 0.9254902, 1,
1.007055, -0.8207272, 1.254502, 1, 0, 0.9176471, 1,
1.008386, -0.4127599, 0.326691, 1, 0, 0.9137255, 1,
1.008476, 0.4328678, 1.428193, 1, 0, 0.9058824, 1,
1.009214, -1.24021, 1.205343, 1, 0, 0.9019608, 1,
1.010869, 0.06411092, 3.739856, 1, 0, 0.8941177, 1,
1.011887, -0.235915, 1.025991, 1, 0, 0.8862745, 1,
1.021528, 1.12919, 1.111946, 1, 0, 0.8823529, 1,
1.024517, 0.4536, 2.166609, 1, 0, 0.8745098, 1,
1.030158, 1.795819, 1.075492, 1, 0, 0.8705882, 1,
1.031139, 0.354754, 0.3998305, 1, 0, 0.8627451, 1,
1.033607, 0.5567444, 0.2258422, 1, 0, 0.8588235, 1,
1.038744, -0.3704958, 1.310318, 1, 0, 0.8509804, 1,
1.041969, 0.427766, 1.842966, 1, 0, 0.8470588, 1,
1.044351, -0.5218359, 3.069062, 1, 0, 0.8392157, 1,
1.054844, 0.682265, 0.9221582, 1, 0, 0.8352941, 1,
1.060271, -1.080968, 4.123695, 1, 0, 0.827451, 1,
1.061748, -1.119077, 1.681679, 1, 0, 0.8235294, 1,
1.062307, -0.4239129, 2.31669, 1, 0, 0.8156863, 1,
1.062454, 1.075001, 1.587309, 1, 0, 0.8117647, 1,
1.066347, 1.447976, 1.592514, 1, 0, 0.8039216, 1,
1.067902, 1.161434, 0.1081714, 1, 0, 0.7960784, 1,
1.074006, 0.07768952, 0.2827071, 1, 0, 0.7921569, 1,
1.080715, -0.8259074, 1.16655, 1, 0, 0.7843137, 1,
1.083594, -0.2242923, -0.6687595, 1, 0, 0.7803922, 1,
1.097221, 0.629526, 1.174814, 1, 0, 0.772549, 1,
1.100567, 1.317561, -0.212143, 1, 0, 0.7686275, 1,
1.103207, 0.1440566, 2.753268, 1, 0, 0.7607843, 1,
1.10355, 0.331868, 1.153105, 1, 0, 0.7568628, 1,
1.112574, 0.004183053, 1.264062, 1, 0, 0.7490196, 1,
1.11315, 0.5722002, 1.145061, 1, 0, 0.7450981, 1,
1.118061, 1.687528, 1.22434, 1, 0, 0.7372549, 1,
1.119661, -0.08970186, 3.117437, 1, 0, 0.7333333, 1,
1.136298, 2.200054, 0.6826007, 1, 0, 0.7254902, 1,
1.138957, -1.451737, 3.104995, 1, 0, 0.7215686, 1,
1.140446, 0.93172, -0.3378806, 1, 0, 0.7137255, 1,
1.147319, -1.7285, 2.01923, 1, 0, 0.7098039, 1,
1.148042, 0.8056114, -0.4294533, 1, 0, 0.7019608, 1,
1.155174, -0.1909782, 1.857516, 1, 0, 0.6941177, 1,
1.162038, -1.091261, 1.172781, 1, 0, 0.6901961, 1,
1.16554, 0.9145505, 0.9721572, 1, 0, 0.682353, 1,
1.168853, 0.3854936, 1.594777, 1, 0, 0.6784314, 1,
1.171475, -2.757764, 3.074778, 1, 0, 0.6705883, 1,
1.173775, 0.5660975, 0.4958065, 1, 0, 0.6666667, 1,
1.174753, -1.544353, 3.483759, 1, 0, 0.6588235, 1,
1.180513, 0.1571621, 2.876612, 1, 0, 0.654902, 1,
1.184285, 0.5240901, -0.357415, 1, 0, 0.6470588, 1,
1.185349, 2.37768, -0.05132683, 1, 0, 0.6431373, 1,
1.203855, -1.373905, 4.127847, 1, 0, 0.6352941, 1,
1.211378, 0.4481138, 1.848025, 1, 0, 0.6313726, 1,
1.212297, 0.8328697, 1.466195, 1, 0, 0.6235294, 1,
1.21615, 1.704932, 1.539832, 1, 0, 0.6196079, 1,
1.217334, -0.3517432, 1.98036, 1, 0, 0.6117647, 1,
1.223487, 0.8766956, -0.6295859, 1, 0, 0.6078432, 1,
1.235439, 0.5130327, 0.3152281, 1, 0, 0.6, 1,
1.238711, 0.9657909, -0.5676613, 1, 0, 0.5921569, 1,
1.26795, 0.7158955, 0.8675463, 1, 0, 0.5882353, 1,
1.26967, 0.3088209, 1.014344, 1, 0, 0.5803922, 1,
1.270138, 0.1641846, 1.887465, 1, 0, 0.5764706, 1,
1.282604, -0.9864071, 3.759399, 1, 0, 0.5686275, 1,
1.285555, 0.5855257, 1.935809, 1, 0, 0.5647059, 1,
1.296355, 2.661381, -0.6323777, 1, 0, 0.5568628, 1,
1.304081, -0.6803727, 3.315224, 1, 0, 0.5529412, 1,
1.313272, -0.08837052, 0.05923555, 1, 0, 0.5450981, 1,
1.316431, 0.1226882, -0.2538456, 1, 0, 0.5411765, 1,
1.318843, 1.806167, 0.8898628, 1, 0, 0.5333334, 1,
1.327452, -1.822987, 1.946056, 1, 0, 0.5294118, 1,
1.3353, 0.4637824, 2.57525, 1, 0, 0.5215687, 1,
1.339757, 0.1760538, 0.9448892, 1, 0, 0.5176471, 1,
1.357141, -1.816672, 3.595071, 1, 0, 0.509804, 1,
1.367656, 1.07937, 0.3725795, 1, 0, 0.5058824, 1,
1.374368, -0.3645228, 1.540601, 1, 0, 0.4980392, 1,
1.375227, -1.702806, 3.436316, 1, 0, 0.4901961, 1,
1.376319, 1.536314, 1.424104, 1, 0, 0.4862745, 1,
1.381546, 2.263178, 1.231422, 1, 0, 0.4784314, 1,
1.384413, 0.7066017, 2.245737, 1, 0, 0.4745098, 1,
1.388138, -0.7071851, 2.134807, 1, 0, 0.4666667, 1,
1.388495, -0.8173734, 2.106554, 1, 0, 0.4627451, 1,
1.410716, -1.446949, 3.348821, 1, 0, 0.454902, 1,
1.417508, -0.4697263, 1.935843, 1, 0, 0.4509804, 1,
1.421643, 0.1536895, 2.322792, 1, 0, 0.4431373, 1,
1.428012, -1.371896, 3.061008, 1, 0, 0.4392157, 1,
1.441469, -0.1668367, 1.469638, 1, 0, 0.4313726, 1,
1.442916, -0.0550004, 1.199516, 1, 0, 0.427451, 1,
1.469525, 0.7290157, 1.842345, 1, 0, 0.4196078, 1,
1.474126, -1.116742, 1.930928, 1, 0, 0.4156863, 1,
1.488469, 0.6615574, 2.162395, 1, 0, 0.4078431, 1,
1.492711, -0.9567983, 2.878402, 1, 0, 0.4039216, 1,
1.500732, 1.059225, 0.5595079, 1, 0, 0.3960784, 1,
1.502984, -0.3461449, 2.1012, 1, 0, 0.3882353, 1,
1.506177, -0.4397578, 1.994009, 1, 0, 0.3843137, 1,
1.513485, -0.06004947, 1.453644, 1, 0, 0.3764706, 1,
1.514451, -0.5180583, 0.9545627, 1, 0, 0.372549, 1,
1.517308, -0.4901005, 1.668904, 1, 0, 0.3647059, 1,
1.538812, 0.06607731, 0.5017801, 1, 0, 0.3607843, 1,
1.542661, 0.6655199, 2.127071, 1, 0, 0.3529412, 1,
1.54675, 0.2530851, 0.4453693, 1, 0, 0.3490196, 1,
1.547407, -0.1538506, 2.496544, 1, 0, 0.3411765, 1,
1.548244, 1.391907, 0.3269465, 1, 0, 0.3372549, 1,
1.549962, -0.872555, 0.8621878, 1, 0, 0.3294118, 1,
1.568419, 0.02820926, 1.200882, 1, 0, 0.3254902, 1,
1.57893, 0.5552563, 1.490303, 1, 0, 0.3176471, 1,
1.584162, -1.866624, 2.536271, 1, 0, 0.3137255, 1,
1.601323, 1.796922, 1.685922, 1, 0, 0.3058824, 1,
1.609144, 2.301574, 0.216271, 1, 0, 0.2980392, 1,
1.613164, -0.3058877, 2.007049, 1, 0, 0.2941177, 1,
1.628449, 0.1848391, 0.2213816, 1, 0, 0.2862745, 1,
1.656052, -1.897604, 3.390972, 1, 0, 0.282353, 1,
1.67653, 0.7568456, 0.3189181, 1, 0, 0.2745098, 1,
1.680845, -0.5301001, 3.459249, 1, 0, 0.2705882, 1,
1.686395, 0.1467271, 1.439975, 1, 0, 0.2627451, 1,
1.708541, -0.1347306, 0.6950611, 1, 0, 0.2588235, 1,
1.73511, 1.136232, 1.476299, 1, 0, 0.2509804, 1,
1.741731, -0.9781227, 2.003177, 1, 0, 0.2470588, 1,
1.753468, 0.9598171, 1.948882, 1, 0, 0.2392157, 1,
1.779407, 1.359288, 1.410869, 1, 0, 0.2352941, 1,
1.797456, -0.579704, 3.602073, 1, 0, 0.227451, 1,
1.801437, 1.787035, 1.10994, 1, 0, 0.2235294, 1,
1.807137, -2.685836, 2.399874, 1, 0, 0.2156863, 1,
1.83316, -0.2949354, 2.843158, 1, 0, 0.2117647, 1,
1.893906, -1.600758, 2.730323, 1, 0, 0.2039216, 1,
1.909674, 1.090332, 2.959907, 1, 0, 0.1960784, 1,
1.915528, 0.06106291, 2.47999, 1, 0, 0.1921569, 1,
1.929299, -0.1127216, -0.1763299, 1, 0, 0.1843137, 1,
1.935748, -0.4461259, 1.710128, 1, 0, 0.1803922, 1,
1.93769, 0.6234484, 0.7006947, 1, 0, 0.172549, 1,
1.946286, 0.6651559, 0.7601528, 1, 0, 0.1686275, 1,
1.947991, -0.1445138, 0.4655466, 1, 0, 0.1607843, 1,
1.952742, -1.953965, 3.185558, 1, 0, 0.1568628, 1,
1.979406, -0.9520723, 1.805425, 1, 0, 0.1490196, 1,
1.980946, -0.7720045, 1.908662, 1, 0, 0.145098, 1,
1.982926, 1.302324, 1.298209, 1, 0, 0.1372549, 1,
1.986649, -0.3199955, 2.273132, 1, 0, 0.1333333, 1,
2.010512, -0.07801376, 2.219404, 1, 0, 0.1254902, 1,
2.054024, 0.6394357, 3.456355, 1, 0, 0.1215686, 1,
2.055631, -0.9484108, 1.724815, 1, 0, 0.1137255, 1,
2.079465, 0.1480867, -0.06332903, 1, 0, 0.1098039, 1,
2.082386, -0.2071754, 0.2551575, 1, 0, 0.1019608, 1,
2.116545, -0.1523305, 2.51124, 1, 0, 0.09411765, 1,
2.12772, 0.1328376, 1.820887, 1, 0, 0.09019608, 1,
2.187685, 0.4313813, 1.42214, 1, 0, 0.08235294, 1,
2.191542, 1.553196, 0.8285455, 1, 0, 0.07843138, 1,
2.211392, -0.188068, 0.5641865, 1, 0, 0.07058824, 1,
2.229605, 1.649149, 1.616942, 1, 0, 0.06666667, 1,
2.246327, -0.6920732, 0.2895107, 1, 0, 0.05882353, 1,
2.381959, 1.424663, 1.013655, 1, 0, 0.05490196, 1,
2.42417, 0.6071919, 3.405728, 1, 0, 0.04705882, 1,
2.44439, -1.293698, 2.281937, 1, 0, 0.04313726, 1,
2.460436, 0.5291783, 0.762141, 1, 0, 0.03529412, 1,
2.564269, -0.310222, 2.000068, 1, 0, 0.03137255, 1,
2.593688, 0.8209544, 0.8466464, 1, 0, 0.02352941, 1,
2.70644, -2.378701, 0.8621565, 1, 0, 0.01960784, 1,
3.53179, -1.330747, 2.007243, 1, 0, 0.01176471, 1,
3.766486, 0.09592981, 3.59512, 1, 0, 0.007843138, 1
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
0.4809028, -4.08077, -6.504183, 0, -0.5, 0.5, 0.5,
0.4809028, -4.08077, -6.504183, 1, -0.5, 0.5, 0.5,
0.4809028, -4.08077, -6.504183, 1, 1.5, 0.5, 0.5,
0.4809028, -4.08077, -6.504183, 0, 1.5, 0.5, 0.5
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
-3.918494, -0.006848931, -6.504183, 0, -0.5, 0.5, 0.5,
-3.918494, -0.006848931, -6.504183, 1, -0.5, 0.5, 0.5,
-3.918494, -0.006848931, -6.504183, 1, 1.5, 0.5, 0.5,
-3.918494, -0.006848931, -6.504183, 0, 1.5, 0.5, 0.5
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
-3.918494, -4.08077, 0.06405807, 0, -0.5, 0.5, 0.5,
-3.918494, -4.08077, 0.06405807, 1, -0.5, 0.5, 0.5,
-3.918494, -4.08077, 0.06405807, 1, 1.5, 0.5, 0.5,
-3.918494, -4.08077, 0.06405807, 0, 1.5, 0.5, 0.5
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
-2, -3.140634, -4.988435,
3, -3.140634, -4.988435,
-2, -3.140634, -4.988435,
-2, -3.297323, -5.24106,
-1, -3.140634, -4.988435,
-1, -3.297323, -5.24106,
0, -3.140634, -4.988435,
0, -3.297323, -5.24106,
1, -3.140634, -4.988435,
1, -3.297323, -5.24106,
2, -3.140634, -4.988435,
2, -3.297323, -5.24106,
3, -3.140634, -4.988435,
3, -3.297323, -5.24106
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
-2, -3.610702, -5.746309, 0, -0.5, 0.5, 0.5,
-2, -3.610702, -5.746309, 1, -0.5, 0.5, 0.5,
-2, -3.610702, -5.746309, 1, 1.5, 0.5, 0.5,
-2, -3.610702, -5.746309, 0, 1.5, 0.5, 0.5,
-1, -3.610702, -5.746309, 0, -0.5, 0.5, 0.5,
-1, -3.610702, -5.746309, 1, -0.5, 0.5, 0.5,
-1, -3.610702, -5.746309, 1, 1.5, 0.5, 0.5,
-1, -3.610702, -5.746309, 0, 1.5, 0.5, 0.5,
0, -3.610702, -5.746309, 0, -0.5, 0.5, 0.5,
0, -3.610702, -5.746309, 1, -0.5, 0.5, 0.5,
0, -3.610702, -5.746309, 1, 1.5, 0.5, 0.5,
0, -3.610702, -5.746309, 0, 1.5, 0.5, 0.5,
1, -3.610702, -5.746309, 0, -0.5, 0.5, 0.5,
1, -3.610702, -5.746309, 1, -0.5, 0.5, 0.5,
1, -3.610702, -5.746309, 1, 1.5, 0.5, 0.5,
1, -3.610702, -5.746309, 0, 1.5, 0.5, 0.5,
2, -3.610702, -5.746309, 0, -0.5, 0.5, 0.5,
2, -3.610702, -5.746309, 1, -0.5, 0.5, 0.5,
2, -3.610702, -5.746309, 1, 1.5, 0.5, 0.5,
2, -3.610702, -5.746309, 0, 1.5, 0.5, 0.5,
3, -3.610702, -5.746309, 0, -0.5, 0.5, 0.5,
3, -3.610702, -5.746309, 1, -0.5, 0.5, 0.5,
3, -3.610702, -5.746309, 1, 1.5, 0.5, 0.5,
3, -3.610702, -5.746309, 0, 1.5, 0.5, 0.5
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
-2.903248, -3, -4.988435,
-2.903248, 3, -4.988435,
-2.903248, -3, -4.988435,
-3.072456, -3, -5.24106,
-2.903248, -2, -4.988435,
-3.072456, -2, -5.24106,
-2.903248, -1, -4.988435,
-3.072456, -1, -5.24106,
-2.903248, 0, -4.988435,
-3.072456, 0, -5.24106,
-2.903248, 1, -4.988435,
-3.072456, 1, -5.24106,
-2.903248, 2, -4.988435,
-3.072456, 2, -5.24106,
-2.903248, 3, -4.988435,
-3.072456, 3, -5.24106
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
-3.410871, -3, -5.746309, 0, -0.5, 0.5, 0.5,
-3.410871, -3, -5.746309, 1, -0.5, 0.5, 0.5,
-3.410871, -3, -5.746309, 1, 1.5, 0.5, 0.5,
-3.410871, -3, -5.746309, 0, 1.5, 0.5, 0.5,
-3.410871, -2, -5.746309, 0, -0.5, 0.5, 0.5,
-3.410871, -2, -5.746309, 1, -0.5, 0.5, 0.5,
-3.410871, -2, -5.746309, 1, 1.5, 0.5, 0.5,
-3.410871, -2, -5.746309, 0, 1.5, 0.5, 0.5,
-3.410871, -1, -5.746309, 0, -0.5, 0.5, 0.5,
-3.410871, -1, -5.746309, 1, -0.5, 0.5, 0.5,
-3.410871, -1, -5.746309, 1, 1.5, 0.5, 0.5,
-3.410871, -1, -5.746309, 0, 1.5, 0.5, 0.5,
-3.410871, 0, -5.746309, 0, -0.5, 0.5, 0.5,
-3.410871, 0, -5.746309, 1, -0.5, 0.5, 0.5,
-3.410871, 0, -5.746309, 1, 1.5, 0.5, 0.5,
-3.410871, 0, -5.746309, 0, 1.5, 0.5, 0.5,
-3.410871, 1, -5.746309, 0, -0.5, 0.5, 0.5,
-3.410871, 1, -5.746309, 1, -0.5, 0.5, 0.5,
-3.410871, 1, -5.746309, 1, 1.5, 0.5, 0.5,
-3.410871, 1, -5.746309, 0, 1.5, 0.5, 0.5,
-3.410871, 2, -5.746309, 0, -0.5, 0.5, 0.5,
-3.410871, 2, -5.746309, 1, -0.5, 0.5, 0.5,
-3.410871, 2, -5.746309, 1, 1.5, 0.5, 0.5,
-3.410871, 2, -5.746309, 0, 1.5, 0.5, 0.5,
-3.410871, 3, -5.746309, 0, -0.5, 0.5, 0.5,
-3.410871, 3, -5.746309, 1, -0.5, 0.5, 0.5,
-3.410871, 3, -5.746309, 1, 1.5, 0.5, 0.5,
-3.410871, 3, -5.746309, 0, 1.5, 0.5, 0.5
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
-2.903248, -3.140634, -4,
-2.903248, -3.140634, 4,
-2.903248, -3.140634, -4,
-3.072456, -3.297323, -4,
-2.903248, -3.140634, -2,
-3.072456, -3.297323, -2,
-2.903248, -3.140634, 0,
-3.072456, -3.297323, 0,
-2.903248, -3.140634, 2,
-3.072456, -3.297323, 2,
-2.903248, -3.140634, 4,
-3.072456, -3.297323, 4
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
-3.410871, -3.610702, -4, 0, -0.5, 0.5, 0.5,
-3.410871, -3.610702, -4, 1, -0.5, 0.5, 0.5,
-3.410871, -3.610702, -4, 1, 1.5, 0.5, 0.5,
-3.410871, -3.610702, -4, 0, 1.5, 0.5, 0.5,
-3.410871, -3.610702, -2, 0, -0.5, 0.5, 0.5,
-3.410871, -3.610702, -2, 1, -0.5, 0.5, 0.5,
-3.410871, -3.610702, -2, 1, 1.5, 0.5, 0.5,
-3.410871, -3.610702, -2, 0, 1.5, 0.5, 0.5,
-3.410871, -3.610702, 0, 0, -0.5, 0.5, 0.5,
-3.410871, -3.610702, 0, 1, -0.5, 0.5, 0.5,
-3.410871, -3.610702, 0, 1, 1.5, 0.5, 0.5,
-3.410871, -3.610702, 0, 0, 1.5, 0.5, 0.5,
-3.410871, -3.610702, 2, 0, -0.5, 0.5, 0.5,
-3.410871, -3.610702, 2, 1, -0.5, 0.5, 0.5,
-3.410871, -3.610702, 2, 1, 1.5, 0.5, 0.5,
-3.410871, -3.610702, 2, 0, 1.5, 0.5, 0.5,
-3.410871, -3.610702, 4, 0, -0.5, 0.5, 0.5,
-3.410871, -3.610702, 4, 1, -0.5, 0.5, 0.5,
-3.410871, -3.610702, 4, 1, 1.5, 0.5, 0.5,
-3.410871, -3.610702, 4, 0, 1.5, 0.5, 0.5
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
-2.903248, -3.140634, -4.988435,
-2.903248, 3.126936, -4.988435,
-2.903248, -3.140634, 5.116551,
-2.903248, 3.126936, 5.116551,
-2.903248, -3.140634, -4.988435,
-2.903248, -3.140634, 5.116551,
-2.903248, 3.126936, -4.988435,
-2.903248, 3.126936, 5.116551,
-2.903248, -3.140634, -4.988435,
3.865054, -3.140634, -4.988435,
-2.903248, -3.140634, 5.116551,
3.865054, -3.140634, 5.116551,
-2.903248, 3.126936, -4.988435,
3.865054, 3.126936, -4.988435,
-2.903248, 3.126936, 5.116551,
3.865054, 3.126936, 5.116551,
3.865054, -3.140634, -4.988435,
3.865054, 3.126936, -4.988435,
3.865054, -3.140634, 5.116551,
3.865054, 3.126936, 5.116551,
3.865054, -3.140634, -4.988435,
3.865054, -3.140634, 5.116551,
3.865054, 3.126936, -4.988435,
3.865054, 3.126936, 5.116551
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
var radius = 7.306039;
var distance = 32.50539;
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
mvMatrix.translate( -0.4809028, 0.006848931, -0.06405807 );
mvMatrix.scale( 1.167122, 1.260366, 0.7817361 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.50539);
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
heptachlor_epoxide<-read.table("heptachlor_epoxide.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-heptachlor_epoxide$V2
```

```
## Error in eval(expr, envir, enclos): object 'heptachlor_epoxide' not found
```

```r
y<-heptachlor_epoxide$V3
```

```
## Error in eval(expr, envir, enclos): object 'heptachlor_epoxide' not found
```

```r
z<-heptachlor_epoxide$V4
```

```
## Error in eval(expr, envir, enclos): object 'heptachlor_epoxide' not found
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
-2.804681, -0.5555632, -1.58943, 0, 0, 1, 1, 1,
-2.792799, 0.7433299, -1.041692, 1, 0, 0, 1, 1,
-2.671454, -1.876531, -0.6332467, 1, 0, 0, 1, 1,
-2.62131, -1.323614, -1.441808, 1, 0, 0, 1, 1,
-2.614406, 2.037379, -2.742841, 1, 0, 0, 1, 1,
-2.48091, -1.46846, -2.045796, 1, 0, 0, 1, 1,
-2.424164, 0.2597821, -0.8257563, 0, 0, 0, 1, 1,
-2.3886, 0.5215766, -0.791418, 0, 0, 0, 1, 1,
-2.321311, -1.032393, -0.6930825, 0, 0, 0, 1, 1,
-2.308957, 2.010723, 0.007074493, 0, 0, 0, 1, 1,
-2.289165, -1.651268, -2.191609, 0, 0, 0, 1, 1,
-2.289151, -1.198939, -2.588747, 0, 0, 0, 1, 1,
-2.275625, -2.872555, -1.032058, 0, 0, 0, 1, 1,
-2.261555, -1.183495, -2.919039, 1, 1, 1, 1, 1,
-2.250623, 1.45201, -0.4746488, 1, 1, 1, 1, 1,
-2.161516, 1.173492, -2.319242, 1, 1, 1, 1, 1,
-2.159421, 0.4820527, -2.534128, 1, 1, 1, 1, 1,
-2.150264, -1.068271, -3.053208, 1, 1, 1, 1, 1,
-2.13264, 0.2206931, 0.8544144, 1, 1, 1, 1, 1,
-2.122294, -1.029852, -1.804316, 1, 1, 1, 1, 1,
-2.105181, -0.1450994, -1.081964, 1, 1, 1, 1, 1,
-2.100869, 0.47203, -2.069814, 1, 1, 1, 1, 1,
-2.068077, 1.765633, -0.649619, 1, 1, 1, 1, 1,
-2.057529, -1.043472, -3.316339, 1, 1, 1, 1, 1,
-2.039803, -0.2558075, -0.8297573, 1, 1, 1, 1, 1,
-2.023528, 0.08813833, -3.182416, 1, 1, 1, 1, 1,
-2.019955, 0.3604498, -0.9578932, 1, 1, 1, 1, 1,
-2.006053, -0.2594479, -2.927056, 1, 1, 1, 1, 1,
-1.9644, -2.054646, -2.251403, 0, 0, 1, 1, 1,
-1.963549, 0.4907266, -1.886328, 1, 0, 0, 1, 1,
-1.957031, -0.9094291, -2.635172, 1, 0, 0, 1, 1,
-1.954489, 0.5179113, 0.8958233, 1, 0, 0, 1, 1,
-1.926914, -0.2828519, -1.511423, 1, 0, 0, 1, 1,
-1.854105, -0.2334174, -1.514536, 1, 0, 0, 1, 1,
-1.843468, 0.07776593, -2.415183, 0, 0, 0, 1, 1,
-1.840221, -0.1354034, -1.642251, 0, 0, 0, 1, 1,
-1.839988, -2.578965, -1.727578, 0, 0, 0, 1, 1,
-1.838415, -1.472266, 0.3310828, 0, 0, 0, 1, 1,
-1.838338, -0.1033691, -2.654749, 0, 0, 0, 1, 1,
-1.82715, -0.2191629, -0.7299369, 0, 0, 0, 1, 1,
-1.824491, -0.6041445, -1.887022, 0, 0, 0, 1, 1,
-1.79072, 1.35729, -0.2101295, 1, 1, 1, 1, 1,
-1.741429, 1.623885, 0.03678468, 1, 1, 1, 1, 1,
-1.739892, -0.1483242, -3.041973, 1, 1, 1, 1, 1,
-1.735774, -0.7516948, -2.164072, 1, 1, 1, 1, 1,
-1.734233, 0.8826038, -0.01716808, 1, 1, 1, 1, 1,
-1.705845, 1.554205, 1.313041, 1, 1, 1, 1, 1,
-1.694657, -0.6920413, -2.983352, 1, 1, 1, 1, 1,
-1.689118, 0.470174, -0.9102939, 1, 1, 1, 1, 1,
-1.684688, 0.2182312, -3.398508, 1, 1, 1, 1, 1,
-1.671445, -0.1324827, -2.318553, 1, 1, 1, 1, 1,
-1.670929, -0.09014648, -1.611241, 1, 1, 1, 1, 1,
-1.668248, -1.671267, -2.242743, 1, 1, 1, 1, 1,
-1.664238, 0.3664758, -0.8583947, 1, 1, 1, 1, 1,
-1.662518, 1.086606, -1.991195, 1, 1, 1, 1, 1,
-1.661001, -0.898341, -0.7132232, 1, 1, 1, 1, 1,
-1.648662, 1.295013, 0.1099705, 0, 0, 1, 1, 1,
-1.624987, 0.7938083, -1.930942, 1, 0, 0, 1, 1,
-1.619095, 0.4001683, -0.1641207, 1, 0, 0, 1, 1,
-1.61908, 0.8237399, -1.171369, 1, 0, 0, 1, 1,
-1.618317, -0.2222449, -1.935238, 1, 0, 0, 1, 1,
-1.614526, -0.9131604, -2.770868, 1, 0, 0, 1, 1,
-1.613604, -0.8621342, -0.2689279, 0, 0, 0, 1, 1,
-1.574058, 0.8540087, -1.547835, 0, 0, 0, 1, 1,
-1.572815, 0.8858572, 0.2294465, 0, 0, 0, 1, 1,
-1.56877, -2.575149, -4.019182, 0, 0, 0, 1, 1,
-1.563705, -0.8266574, -2.591416, 0, 0, 0, 1, 1,
-1.555295, 0.6763843, -1.281786, 0, 0, 0, 1, 1,
-1.553792, -1.570665, -1.821298, 0, 0, 0, 1, 1,
-1.552459, 0.09478193, 0.1323305, 1, 1, 1, 1, 1,
-1.545045, -1.329946, -1.183512, 1, 1, 1, 1, 1,
-1.542884, 1.080824, -1.72381, 1, 1, 1, 1, 1,
-1.53159, -0.1788993, -2.078454, 1, 1, 1, 1, 1,
-1.529065, 1.897403, 0.8012895, 1, 1, 1, 1, 1,
-1.508426, -2.721629, -2.926656, 1, 1, 1, 1, 1,
-1.501783, -0.01303178, -0.1953856, 1, 1, 1, 1, 1,
-1.49527, -0.3986143, -1.031894, 1, 1, 1, 1, 1,
-1.492953, -0.2892379, -2.241479, 1, 1, 1, 1, 1,
-1.491964, 0.2435654, 0.183821, 1, 1, 1, 1, 1,
-1.472554, 1.639807, -0.9027576, 1, 1, 1, 1, 1,
-1.465293, 1.247013, -2.245013, 1, 1, 1, 1, 1,
-1.464354, -0.2005148, -1.132443, 1, 1, 1, 1, 1,
-1.457021, 1.028412, -0.5834352, 1, 1, 1, 1, 1,
-1.447628, -0.3533363, -4.672496, 1, 1, 1, 1, 1,
-1.440723, -0.7647958, -0.9188683, 0, 0, 1, 1, 1,
-1.433709, 0.5771898, 0.2856617, 1, 0, 0, 1, 1,
-1.431386, -1.116176, -2.86219, 1, 0, 0, 1, 1,
-1.430986, -0.5925159, 0.3479242, 1, 0, 0, 1, 1,
-1.427885, 0.1261108, -0.8256293, 1, 0, 0, 1, 1,
-1.423229, -0.5899719, -2.993136, 1, 0, 0, 1, 1,
-1.422701, -0.999065, -0.1713154, 0, 0, 0, 1, 1,
-1.416882, 0.4244241, -1.503648, 0, 0, 0, 1, 1,
-1.410273, -1.559295, -2.560784, 0, 0, 0, 1, 1,
-1.393108, -0.1313941, -1.666123, 0, 0, 0, 1, 1,
-1.384625, -1.415282, -2.797218, 0, 0, 0, 1, 1,
-1.378359, -1.284293, -2.220746, 0, 0, 0, 1, 1,
-1.356577, -0.509363, -2.019623, 0, 0, 0, 1, 1,
-1.354428, 0.9264045, -0.3471707, 1, 1, 1, 1, 1,
-1.35132, 1.222556, -0.2807065, 1, 1, 1, 1, 1,
-1.343529, -0.1250933, -2.015288, 1, 1, 1, 1, 1,
-1.334855, -1.988095, -3.017962, 1, 1, 1, 1, 1,
-1.334796, 1.175922, -0.2975738, 1, 1, 1, 1, 1,
-1.334369, 0.7397556, -0.05820321, 1, 1, 1, 1, 1,
-1.332684, -0.1232081, -1.818051, 1, 1, 1, 1, 1,
-1.331837, -0.3943412, -2.044495, 1, 1, 1, 1, 1,
-1.330128, 1.871951, -0.8363123, 1, 1, 1, 1, 1,
-1.324027, -0.05646592, -0.9916159, 1, 1, 1, 1, 1,
-1.321601, -2.607226, -1.568776, 1, 1, 1, 1, 1,
-1.297338, -0.555069, -3.56798, 1, 1, 1, 1, 1,
-1.291875, -0.6853245, -0.4246581, 1, 1, 1, 1, 1,
-1.290706, -0.7045161, -2.525003, 1, 1, 1, 1, 1,
-1.290423, -1.620625, -3.064756, 1, 1, 1, 1, 1,
-1.2717, 2.378378, 0.3729872, 0, 0, 1, 1, 1,
-1.265929, -0.7287726, -1.5778, 1, 0, 0, 1, 1,
-1.263458, 1.550457, -1.938316, 1, 0, 0, 1, 1,
-1.257807, -2.013524, -3.288425, 1, 0, 0, 1, 1,
-1.254606, -2.67212, -3.615688, 1, 0, 0, 1, 1,
-1.252868, -1.225384, -2.494151, 1, 0, 0, 1, 1,
-1.251392, 0.01540167, -2.029422, 0, 0, 0, 1, 1,
-1.245994, 0.6851531, -0.4295847, 0, 0, 0, 1, 1,
-1.236319, 0.2672597, -1.863345, 0, 0, 0, 1, 1,
-1.235388, 1.287765, -0.3910174, 0, 0, 0, 1, 1,
-1.234236, 0.2607574, -0.7905404, 0, 0, 0, 1, 1,
-1.230119, -0.9424639, -2.840835, 0, 0, 0, 1, 1,
-1.211452, 1.942583, -2.297536, 0, 0, 0, 1, 1,
-1.21131, -1.33394, -1.210797, 1, 1, 1, 1, 1,
-1.202432, 0.7136932, -2.36172, 1, 1, 1, 1, 1,
-1.197085, 1.48387, -1.746093, 1, 1, 1, 1, 1,
-1.197016, 0.7925626, 0.05093024, 1, 1, 1, 1, 1,
-1.195982, -1.239686, -0.9442311, 1, 1, 1, 1, 1,
-1.194713, -0.7709771, -0.812076, 1, 1, 1, 1, 1,
-1.190072, -1.104596, -2.985665, 1, 1, 1, 1, 1,
-1.189175, 0.4479539, -0.9629028, 1, 1, 1, 1, 1,
-1.18571, -1.320644, -3.465068, 1, 1, 1, 1, 1,
-1.183745, 0.4082927, -1.039821, 1, 1, 1, 1, 1,
-1.178763, -0.5470407, -0.5765332, 1, 1, 1, 1, 1,
-1.178577, -0.8938018, -0.4276197, 1, 1, 1, 1, 1,
-1.177584, 0.1572468, -3.181799, 1, 1, 1, 1, 1,
-1.176904, -1.919001, -2.594816, 1, 1, 1, 1, 1,
-1.176847, -0.6526328, -1.952536, 1, 1, 1, 1, 1,
-1.174201, -1.571819, -1.367264, 0, 0, 1, 1, 1,
-1.171688, -0.5766543, -2.427543, 1, 0, 0, 1, 1,
-1.16799, 1.690344, -0.8198096, 1, 0, 0, 1, 1,
-1.161442, -1.142478, -1.660711, 1, 0, 0, 1, 1,
-1.160291, 1.117377, -0.8134727, 1, 0, 0, 1, 1,
-1.157797, 1.579555, -0.09216958, 1, 0, 0, 1, 1,
-1.157749, 0.2572724, 0.8827168, 0, 0, 0, 1, 1,
-1.154718, 0.8778016, -0.7662942, 0, 0, 0, 1, 1,
-1.150139, 0.5163826, -1.521684, 0, 0, 0, 1, 1,
-1.147271, 0.4846492, -2.093266, 0, 0, 0, 1, 1,
-1.144263, -1.164758, -2.213382, 0, 0, 0, 1, 1,
-1.131543, 2.278244, 0.5670196, 0, 0, 0, 1, 1,
-1.128896, 0.05102921, -1.260658, 0, 0, 0, 1, 1,
-1.124574, -0.7430384, -3.681408, 1, 1, 1, 1, 1,
-1.11845, -0.1784841, -2.639892, 1, 1, 1, 1, 1,
-1.116029, -1.040685, -1.141204, 1, 1, 1, 1, 1,
-1.115542, -0.138024, -0.4424842, 1, 1, 1, 1, 1,
-1.114096, -0.4623803, -1.552548, 1, 1, 1, 1, 1,
-1.112439, -0.6150679, -2.959193, 1, 1, 1, 1, 1,
-1.104234, -0.03391279, -1.275211, 1, 1, 1, 1, 1,
-1.096517, 0.8606559, -0.4436502, 1, 1, 1, 1, 1,
-1.093235, -0.5740168, -1.06624, 1, 1, 1, 1, 1,
-1.092096, 0.089633, -1.349, 1, 1, 1, 1, 1,
-1.090136, 1.535282, -0.788197, 1, 1, 1, 1, 1,
-1.088045, -0.1099761, -0.6521119, 1, 1, 1, 1, 1,
-1.087838, -0.03655022, -1.522711, 1, 1, 1, 1, 1,
-1.084295, -0.1659699, -2.001705, 1, 1, 1, 1, 1,
-1.083316, 1.335647, -0.04490069, 1, 1, 1, 1, 1,
-1.075525, 1.00537, -0.07186598, 0, 0, 1, 1, 1,
-1.058386, -0.2669936, -3.265366, 1, 0, 0, 1, 1,
-1.058029, -0.49843, -1.837455, 1, 0, 0, 1, 1,
-1.056694, -0.5775816, -3.118004, 1, 0, 0, 1, 1,
-1.056629, 0.5407694, -0.8724481, 1, 0, 0, 1, 1,
-1.055207, -0.6788709, -2.071236, 1, 0, 0, 1, 1,
-1.051935, 0.05209443, -2.806984, 0, 0, 0, 1, 1,
-1.046284, 0.144746, 0.382951, 0, 0, 0, 1, 1,
-1.040543, -1.462376, -3.942868, 0, 0, 0, 1, 1,
-1.033461, 0.4346674, -2.202407, 0, 0, 0, 1, 1,
-1.021302, -0.8892514, -2.12347, 0, 0, 0, 1, 1,
-1.020249, -2.453475, -2.617662, 0, 0, 0, 1, 1,
-1.019203, 1.059116, 0.1776794, 0, 0, 0, 1, 1,
-1.015044, 0.9276987, -0.08549941, 1, 1, 1, 1, 1,
-1.014736, 0.6985582, -0.7811163, 1, 1, 1, 1, 1,
-1.01449, -0.827888, -2.902431, 1, 1, 1, 1, 1,
-1.010369, 0.8144264, 0.1799356, 1, 1, 1, 1, 1,
-1.009602, -1.033294, -1.939063, 1, 1, 1, 1, 1,
-1.007655, -1.360012, -2.472811, 1, 1, 1, 1, 1,
-0.9913282, 0.7734488, 0.01062351, 1, 1, 1, 1, 1,
-0.9870492, -2.112523, -2.121284, 1, 1, 1, 1, 1,
-0.9861318, -0.8389665, -1.538553, 1, 1, 1, 1, 1,
-0.9776694, -0.624591, -3.343745, 1, 1, 1, 1, 1,
-0.9765112, 0.7954025, -2.70247, 1, 1, 1, 1, 1,
-0.9752072, 0.7140923, -2.501355, 1, 1, 1, 1, 1,
-0.9646305, 0.2450152, -1.677758, 1, 1, 1, 1, 1,
-0.962726, 0.70724, -0.7396095, 1, 1, 1, 1, 1,
-0.9570293, -0.9125926, -1.290728, 1, 1, 1, 1, 1,
-0.9549314, -0.1839307, -2.085114, 0, 0, 1, 1, 1,
-0.9494776, 1.282393, -0.6143016, 1, 0, 0, 1, 1,
-0.9403, -0.8152121, -3.166953, 1, 0, 0, 1, 1,
-0.9348081, 0.8603886, -0.8010633, 1, 0, 0, 1, 1,
-0.9342591, -0.03287796, -0.2023226, 1, 0, 0, 1, 1,
-0.9312642, 2.03302, 1.570373, 1, 0, 0, 1, 1,
-0.930381, 0.3442378, 0.162405, 0, 0, 0, 1, 1,
-0.9303386, -0.8662039, -3.274761, 0, 0, 0, 1, 1,
-0.911418, 0.8397158, 0.154813, 0, 0, 0, 1, 1,
-0.9018591, 0.6969377, -0.9356463, 0, 0, 0, 1, 1,
-0.8999937, 1.354714, -0.1716329, 0, 0, 0, 1, 1,
-0.8973106, -0.5302264, -2.055283, 0, 0, 0, 1, 1,
-0.8865203, -0.1714302, -2.340194, 0, 0, 0, 1, 1,
-0.8861913, 1.521387, -0.41496, 1, 1, 1, 1, 1,
-0.8823582, 0.5522653, -1.420208, 1, 1, 1, 1, 1,
-0.882034, -1.444905, -2.57203, 1, 1, 1, 1, 1,
-0.8724629, 0.3678621, -2.876861, 1, 1, 1, 1, 1,
-0.8705819, 0.4071535, -0.2600801, 1, 1, 1, 1, 1,
-0.8693995, 0.05349609, -1.537024, 1, 1, 1, 1, 1,
-0.8693827, 0.7057605, -0.8295245, 1, 1, 1, 1, 1,
-0.864035, 0.5530723, -1.320765, 1, 1, 1, 1, 1,
-0.8630376, -1.127574, -2.450222, 1, 1, 1, 1, 1,
-0.8617382, 0.1956901, -1.859402, 1, 1, 1, 1, 1,
-0.8610426, 0.951166, -1.852466, 1, 1, 1, 1, 1,
-0.8574167, 1.274922, -1.786505, 1, 1, 1, 1, 1,
-0.8543419, 0.1527829, -2.258681, 1, 1, 1, 1, 1,
-0.8536404, -1.065393, -1.484203, 1, 1, 1, 1, 1,
-0.8487581, -1.36443, -2.700465, 1, 1, 1, 1, 1,
-0.8467916, 1.619108, 0.9485268, 0, 0, 1, 1, 1,
-0.8444009, 0.7242376, -0.1812423, 1, 0, 0, 1, 1,
-0.843917, 1.059391, -1.694902, 1, 0, 0, 1, 1,
-0.8412856, 0.03380703, -1.282505, 1, 0, 0, 1, 1,
-0.8335925, 0.1426035, -2.042615, 1, 0, 0, 1, 1,
-0.8223959, 0.5333388, -0.3695506, 1, 0, 0, 1, 1,
-0.8197861, 0.2238856, -2.816291, 0, 0, 0, 1, 1,
-0.8171996, -1.06506, -3.96252, 0, 0, 0, 1, 1,
-0.8165224, 0.1825566, 0.5823975, 0, 0, 0, 1, 1,
-0.8131139, -0.6003127, -3.489399, 0, 0, 0, 1, 1,
-0.8109351, 1.839404, -0.8885379, 0, 0, 0, 1, 1,
-0.8018581, 0.7854847, -0.641965, 0, 0, 0, 1, 1,
-0.8010932, 0.8229324, -1.083401, 0, 0, 0, 1, 1,
-0.7986665, 0.07660891, -0.5500889, 1, 1, 1, 1, 1,
-0.7929361, 0.1649882, -1.290627, 1, 1, 1, 1, 1,
-0.7882567, 1.031718, -1.942336, 1, 1, 1, 1, 1,
-0.7882528, 1.822072, -1.185791, 1, 1, 1, 1, 1,
-0.7836459, 0.8112155, 0.6614292, 1, 1, 1, 1, 1,
-0.7824274, 0.3295782, -1.454848, 1, 1, 1, 1, 1,
-0.7819118, -0.4029822, -2.486504, 1, 1, 1, 1, 1,
-0.7793676, 0.3460753, -0.3779536, 1, 1, 1, 1, 1,
-0.7764191, -0.841662, -1.772491, 1, 1, 1, 1, 1,
-0.7739769, 1.330948, -1.871524, 1, 1, 1, 1, 1,
-0.7718742, -2.143396, -3.145621, 1, 1, 1, 1, 1,
-0.7717213, 0.6057551, -0.3414304, 1, 1, 1, 1, 1,
-0.7716914, 1.783983, -0.4465488, 1, 1, 1, 1, 1,
-0.7597089, -0.1682817, -1.100826, 1, 1, 1, 1, 1,
-0.7591815, -0.5082996, -2.397349, 1, 1, 1, 1, 1,
-0.758472, -0.02828703, -1.825803, 0, 0, 1, 1, 1,
-0.7541856, -0.2850176, -1.7843, 1, 0, 0, 1, 1,
-0.747936, 1.06656, -0.1570542, 1, 0, 0, 1, 1,
-0.7408408, 0.5596088, -0.8090354, 1, 0, 0, 1, 1,
-0.7295526, 0.5682269, 0.2034342, 1, 0, 0, 1, 1,
-0.7290906, -0.5189704, -1.536242, 1, 0, 0, 1, 1,
-0.7270849, 0.09715949, -0.7487925, 0, 0, 0, 1, 1,
-0.7262579, -2.118334, -2.68022, 0, 0, 0, 1, 1,
-0.7252567, -0.5908329, -2.845775, 0, 0, 0, 1, 1,
-0.7225087, 0.2116046, -0.6892536, 0, 0, 0, 1, 1,
-0.7163329, -1.411257, -2.62787, 0, 0, 0, 1, 1,
-0.7120291, -1.518421, -2.122102, 0, 0, 0, 1, 1,
-0.7101392, -0.9548085, -2.533598, 0, 0, 0, 1, 1,
-0.7054521, 0.3742106, -1.393922, 1, 1, 1, 1, 1,
-0.7051554, 0.9210204, -2.25432, 1, 1, 1, 1, 1,
-0.7051291, -0.4814327, -1.167177, 1, 1, 1, 1, 1,
-0.7049662, 0.3092735, -0.1764075, 1, 1, 1, 1, 1,
-0.693465, 3.035589, 0.2750576, 1, 1, 1, 1, 1,
-0.6931211, -0.05648346, -1.480504, 1, 1, 1, 1, 1,
-0.6905771, 2.168403, -0.7292563, 1, 1, 1, 1, 1,
-0.6876114, -0.2850589, -1.116754, 1, 1, 1, 1, 1,
-0.686731, 0.8164428, 0.6741014, 1, 1, 1, 1, 1,
-0.6865867, -0.3220897, -1.888677, 1, 1, 1, 1, 1,
-0.6852266, 0.7324632, -1.611163, 1, 1, 1, 1, 1,
-0.6842659, 0.4963295, -1.418751, 1, 1, 1, 1, 1,
-0.6828238, -0.5373768, -1.352339, 1, 1, 1, 1, 1,
-0.6820285, 1.032123, -2.088611, 1, 1, 1, 1, 1,
-0.6769304, 1.403007, 0.723428, 1, 1, 1, 1, 1,
-0.6752306, 0.493397, -0.474047, 0, 0, 1, 1, 1,
-0.673606, -0.2228003, -2.61437, 1, 0, 0, 1, 1,
-0.6732465, 0.8327069, -2.57566, 1, 0, 0, 1, 1,
-0.6719518, 0.7869731, -0.7843865, 1, 0, 0, 1, 1,
-0.6711098, 0.4264832, -0.5660003, 1, 0, 0, 1, 1,
-0.6698873, -1.381383, -2.748031, 1, 0, 0, 1, 1,
-0.6692339, -1.225489, -3.760242, 0, 0, 0, 1, 1,
-0.6688836, 0.0173551, -3.076028, 0, 0, 0, 1, 1,
-0.6637717, 0.7035576, -2.649311, 0, 0, 0, 1, 1,
-0.6627682, -0.7685168, -1.175236, 0, 0, 0, 1, 1,
-0.6603173, 0.08273242, -2.953003, 0, 0, 0, 1, 1,
-0.6560512, -2.327956, -4.629016, 0, 0, 0, 1, 1,
-0.6553352, -1.220971, -2.587368, 0, 0, 0, 1, 1,
-0.6544023, 0.2208318, -1.428029, 1, 1, 1, 1, 1,
-0.6520474, 0.2716334, -1.047406, 1, 1, 1, 1, 1,
-0.6503078, -0.7365171, -2.785172, 1, 1, 1, 1, 1,
-0.6460776, -1.563284, -4.306643, 1, 1, 1, 1, 1,
-0.6428578, 0.1136468, -2.451074, 1, 1, 1, 1, 1,
-0.6414794, -0.1528787, -2.049573, 1, 1, 1, 1, 1,
-0.6401492, -0.3355597, -3.042514, 1, 1, 1, 1, 1,
-0.6385711, 1.547344, -0.3319424, 1, 1, 1, 1, 1,
-0.6368513, -0.3385233, -3.131768, 1, 1, 1, 1, 1,
-0.6280818, -0.1575411, -3.590742, 1, 1, 1, 1, 1,
-0.6276312, 0.07569773, -2.351752, 1, 1, 1, 1, 1,
-0.6190531, 0.4271181, -2.089907, 1, 1, 1, 1, 1,
-0.6026682, -0.5945465, -2.956754, 1, 1, 1, 1, 1,
-0.600262, 0.7587573, 0.9213574, 1, 1, 1, 1, 1,
-0.596732, 1.699593, -0.3584314, 1, 1, 1, 1, 1,
-0.5964798, 2.767153, -1.67219, 0, 0, 1, 1, 1,
-0.5952024, 0.02494672, -1.162978, 1, 0, 0, 1, 1,
-0.5950493, -0.1597823, -1.967848, 1, 0, 0, 1, 1,
-0.5949065, 3.035661, 0.1711437, 1, 0, 0, 1, 1,
-0.5909711, -0.7057997, -1.841025, 1, 0, 0, 1, 1,
-0.5852016, -0.2410925, -2.398169, 1, 0, 0, 1, 1,
-0.5813066, -0.7059967, -1.930439, 0, 0, 0, 1, 1,
-0.5808613, -1.416981, -2.89887, 0, 0, 0, 1, 1,
-0.5786358, 0.7279463, -1.270424, 0, 0, 0, 1, 1,
-0.5780558, -0.1527114, -0.9233463, 0, 0, 0, 1, 1,
-0.5735651, -0.3195934, -3.184319, 0, 0, 0, 1, 1,
-0.5731215, -0.785194, -3.506682, 0, 0, 0, 1, 1,
-0.5709488, 2.057721, -0.9560345, 0, 0, 0, 1, 1,
-0.5619406, 1.219467, -0.8531117, 1, 1, 1, 1, 1,
-0.5617299, -0.6966542, -2.822181, 1, 1, 1, 1, 1,
-0.5597986, -0.4805348, -2.33207, 1, 1, 1, 1, 1,
-0.5581188, 0.1083246, -2.668113, 1, 1, 1, 1, 1,
-0.5570485, 0.1341427, -2.285491, 1, 1, 1, 1, 1,
-0.5518568, 0.7071835, 0.9746925, 1, 1, 1, 1, 1,
-0.5507955, -0.03971968, -1.59347, 1, 1, 1, 1, 1,
-0.5447327, -1.463853, -4.149164, 1, 1, 1, 1, 1,
-0.5414636, -0.3797046, -2.466184, 1, 1, 1, 1, 1,
-0.5400376, 0.9820836, 1.638647, 1, 1, 1, 1, 1,
-0.5296893, -1.055518, -3.024525, 1, 1, 1, 1, 1,
-0.5237249, 1.187414, -0.8117515, 1, 1, 1, 1, 1,
-0.5103987, 0.5996033, 0.3760438, 1, 1, 1, 1, 1,
-0.5050202, -1.062222, -3.97133, 1, 1, 1, 1, 1,
-0.5027733, 0.8800542, 0.8862638, 1, 1, 1, 1, 1,
-0.5003475, 2.029067, -0.6643154, 0, 0, 1, 1, 1,
-0.4972829, -0.1124935, -1.315043, 1, 0, 0, 1, 1,
-0.495556, -1.784906, -2.90533, 1, 0, 0, 1, 1,
-0.4923033, -0.1833087, -1.638534, 1, 0, 0, 1, 1,
-0.4901215, -0.5664605, -3.550615, 1, 0, 0, 1, 1,
-0.4832335, 0.5858006, -0.891012, 1, 0, 0, 1, 1,
-0.4758669, 0.4234539, -2.087943, 0, 0, 0, 1, 1,
-0.475527, 1.766961, 1.361286, 0, 0, 0, 1, 1,
-0.4728309, -1.529298, -2.88786, 0, 0, 0, 1, 1,
-0.4686854, -0.09802975, -2.705423, 0, 0, 0, 1, 1,
-0.4670816, -0.6695659, -2.850024, 0, 0, 0, 1, 1,
-0.465992, -0.05560827, -2.844367, 0, 0, 0, 1, 1,
-0.4652981, 1.572682, 0.02218782, 0, 0, 0, 1, 1,
-0.4635333, 0.4610998, -1.143265, 1, 1, 1, 1, 1,
-0.4571012, -1.758315, -3.460127, 1, 1, 1, 1, 1,
-0.4512503, -0.7194822, -2.356896, 1, 1, 1, 1, 1,
-0.4495189, -0.0391685, -1.140199, 1, 1, 1, 1, 1,
-0.4482145, -0.9527083, -3.595624, 1, 1, 1, 1, 1,
-0.4465314, -2.562663, -2.869913, 1, 1, 1, 1, 1,
-0.44628, -0.2443591, -0.08985495, 1, 1, 1, 1, 1,
-0.4449479, -0.9400089, -2.220439, 1, 1, 1, 1, 1,
-0.4420911, -0.912064, -1.95686, 1, 1, 1, 1, 1,
-0.4395491, 0.3753022, -0.6674895, 1, 1, 1, 1, 1,
-0.4374736, -1.155706, -2.218304, 1, 1, 1, 1, 1,
-0.4359563, -0.6999509, -2.087945, 1, 1, 1, 1, 1,
-0.4309458, -0.4917893, -1.525432, 1, 1, 1, 1, 1,
-0.4222704, -0.2436481, -2.515795, 1, 1, 1, 1, 1,
-0.4212818, -0.110217, -3.303316, 1, 1, 1, 1, 1,
-0.4187135, -0.2032979, -2.603688, 0, 0, 1, 1, 1,
-0.4183376, -0.07969263, -4.34479, 1, 0, 0, 1, 1,
-0.4176594, -1.006388, -2.56654, 1, 0, 0, 1, 1,
-0.4143427, 1.32799, -1.372875, 1, 0, 0, 1, 1,
-0.4036734, 1.654881, 0.1928849, 1, 0, 0, 1, 1,
-0.403477, 0.9902543, -1.330167, 1, 0, 0, 1, 1,
-0.4034112, 0.2666671, 0.4329744, 0, 0, 0, 1, 1,
-0.3981923, 0.4472051, -2.524339, 0, 0, 0, 1, 1,
-0.3966285, 0.8844767, -2.067739, 0, 0, 0, 1, 1,
-0.3961551, 2.37425, -1.047111, 0, 0, 0, 1, 1,
-0.3938714, 0.003443963, -2.342173, 0, 0, 0, 1, 1,
-0.3889029, 0.587489, -0.3994904, 0, 0, 0, 1, 1,
-0.3884838, 0.5905806, -0.8187775, 0, 0, 0, 1, 1,
-0.3884769, 0.03567128, 0.4664091, 1, 1, 1, 1, 1,
-0.3879005, -2.788028, -2.802864, 1, 1, 1, 1, 1,
-0.3870536, 0.5018282, 0.7985665, 1, 1, 1, 1, 1,
-0.384391, 0.05987961, -0.1085809, 1, 1, 1, 1, 1,
-0.3788615, -0.3576102, -3.57993, 1, 1, 1, 1, 1,
-0.3771779, -0.555823, -2.634961, 1, 1, 1, 1, 1,
-0.3679709, 1.637684, 0.8369747, 1, 1, 1, 1, 1,
-0.3632256, 0.4425821, 1.250721, 1, 1, 1, 1, 1,
-0.3606093, -1.620219, -2.018025, 1, 1, 1, 1, 1,
-0.3533164, 0.115883, -0.6021903, 1, 1, 1, 1, 1,
-0.3480967, 0.551885, -1.752678, 1, 1, 1, 1, 1,
-0.3459704, -0.4458177, -3.432021, 1, 1, 1, 1, 1,
-0.3457215, 0.4323457, 0.006832689, 1, 1, 1, 1, 1,
-0.3336903, 0.3025025, -0.972967, 1, 1, 1, 1, 1,
-0.3321869, 0.5623165, -1.543124, 1, 1, 1, 1, 1,
-0.3286556, 1.01232, -1.467386, 0, 0, 1, 1, 1,
-0.3266138, -1.412408, -0.7335902, 1, 0, 0, 1, 1,
-0.3264054, 0.6735231, 0.4927432, 1, 0, 0, 1, 1,
-0.3263169, -1.94737, -2.667336, 1, 0, 0, 1, 1,
-0.3253487, -0.5790637, -2.860048, 1, 0, 0, 1, 1,
-0.3237811, -0.8795094, -2.13923, 1, 0, 0, 1, 1,
-0.3200564, 2.790139, -0.797977, 0, 0, 0, 1, 1,
-0.3199731, 0.9881318, -0.8413994, 0, 0, 0, 1, 1,
-0.3156071, -0.3237192, -2.065382, 0, 0, 0, 1, 1,
-0.3150642, 1.886147, -0.3665153, 0, 0, 0, 1, 1,
-0.311901, 0.2045535, -1.901591, 0, 0, 0, 1, 1,
-0.3084749, -1.070094, -3.936898, 0, 0, 0, 1, 1,
-0.3054412, 1.260046, -1.312711, 0, 0, 0, 1, 1,
-0.3052756, -1.112386, -2.443377, 1, 1, 1, 1, 1,
-0.3003862, 0.1352531, -1.346068, 1, 1, 1, 1, 1,
-0.2992462, 0.0184429, -0.7944384, 1, 1, 1, 1, 1,
-0.2989619, 0.1602523, -0.9017849, 1, 1, 1, 1, 1,
-0.2973921, -0.6352523, -4.034345, 1, 1, 1, 1, 1,
-0.294362, 0.809557, -1.699585, 1, 1, 1, 1, 1,
-0.2939707, -0.3472823, -2.109494, 1, 1, 1, 1, 1,
-0.2919691, 0.5473128, -0.2388221, 1, 1, 1, 1, 1,
-0.2908292, -1.065233, -3.316078, 1, 1, 1, 1, 1,
-0.2907781, 1.237252, 1.396652, 1, 1, 1, 1, 1,
-0.2870423, -1.137032, -3.029734, 1, 1, 1, 1, 1,
-0.286551, -0.9340984, -3.766469, 1, 1, 1, 1, 1,
-0.2863969, -0.1671826, -1.264201, 1, 1, 1, 1, 1,
-0.2842239, -0.2044347, -2.672683, 1, 1, 1, 1, 1,
-0.2774134, 0.235876, -1.477372, 1, 1, 1, 1, 1,
-0.276592, 0.4195946, -1.105005, 0, 0, 1, 1, 1,
-0.2730476, 0.9695247, -1.458633, 1, 0, 0, 1, 1,
-0.2659489, -1.369018, -3.241588, 1, 0, 0, 1, 1,
-0.2634175, 1.468006, 0.5516412, 1, 0, 0, 1, 1,
-0.2615609, 2.079326, -0.9983487, 1, 0, 0, 1, 1,
-0.2609739, -1.160744, -3.548772, 1, 0, 0, 1, 1,
-0.2524627, 0.1716958, 0.1951296, 0, 0, 0, 1, 1,
-0.2524475, 0.1378674, -2.427667, 0, 0, 0, 1, 1,
-0.2468591, -1.200602, -2.483033, 0, 0, 0, 1, 1,
-0.2444464, 0.6272601, -0.03229083, 0, 0, 0, 1, 1,
-0.2401641, -0.4205738, -3.059054, 0, 0, 0, 1, 1,
-0.2379398, -0.720039, -3.753193, 0, 0, 0, 1, 1,
-0.2330659, 0.9997713, -0.05685896, 0, 0, 0, 1, 1,
-0.2324994, 0.9122248, 0.6904734, 1, 1, 1, 1, 1,
-0.2301602, 1.327217, -1.826691, 1, 1, 1, 1, 1,
-0.2259147, -0.7041852, -1.045754, 1, 1, 1, 1, 1,
-0.2140083, 1.562329, 0.5230076, 1, 1, 1, 1, 1,
-0.2136834, -1.345132, -2.381357, 1, 1, 1, 1, 1,
-0.2135651, 1.455024, 0.7937005, 1, 1, 1, 1, 1,
-0.2132566, 1.23229, 1.135494, 1, 1, 1, 1, 1,
-0.2118572, 2.379736, -1.032502, 1, 1, 1, 1, 1,
-0.2093052, 1.068026, 0.5281941, 1, 1, 1, 1, 1,
-0.2061978, -2.151457, -2.713067, 1, 1, 1, 1, 1,
-0.2061857, -0.06045311, -1.541261, 1, 1, 1, 1, 1,
-0.2034864, 0.8495041, -0.8478214, 1, 1, 1, 1, 1,
-0.2034557, -0.565104, -4.16989, 1, 1, 1, 1, 1,
-0.2021564, 0.0920564, 0.9830239, 1, 1, 1, 1, 1,
-0.2017335, -0.7790067, -2.564014, 1, 1, 1, 1, 1,
-0.2006924, 0.2839206, -1.362393, 0, 0, 1, 1, 1,
-0.1945041, -1.873076, -2.174166, 1, 0, 0, 1, 1,
-0.194337, -0.06543616, -1.887351, 1, 0, 0, 1, 1,
-0.1930709, -0.8783845, -4.070971, 1, 0, 0, 1, 1,
-0.1930233, 0.7235904, -0.399976, 1, 0, 0, 1, 1,
-0.1901049, 0.1051165, -0.6491897, 1, 0, 0, 1, 1,
-0.1874738, 1.044253, -0.9174783, 0, 0, 0, 1, 1,
-0.1833629, 0.8325401, 0.6615428, 0, 0, 0, 1, 1,
-0.1822511, -0.1282011, -1.874686, 0, 0, 0, 1, 1,
-0.1804948, 0.3705158, 0.06951761, 0, 0, 0, 1, 1,
-0.1787659, -1.273225, -3.432905, 0, 0, 0, 1, 1,
-0.1783545, -1.845157, -3.853862, 0, 0, 0, 1, 1,
-0.1757063, 1.524816, -1.063788, 0, 0, 0, 1, 1,
-0.1693371, -1.902676, -1.535241, 1, 1, 1, 1, 1,
-0.168941, -1.429229, -2.497502, 1, 1, 1, 1, 1,
-0.1645077, -0.4869265, -4.321838, 1, 1, 1, 1, 1,
-0.1515623, -0.7770991, -2.586563, 1, 1, 1, 1, 1,
-0.1515303, 0.2154198, 1.422136, 1, 1, 1, 1, 1,
-0.1501045, 1.63353, -1.960359, 1, 1, 1, 1, 1,
-0.14962, -0.5017004, -2.650424, 1, 1, 1, 1, 1,
-0.146724, 1.226342, 0.6930998, 1, 1, 1, 1, 1,
-0.1455294, 0.2971818, -1.861245, 1, 1, 1, 1, 1,
-0.1438049, 0.2899588, -1.109789, 1, 1, 1, 1, 1,
-0.1431073, 0.3479313, -0.9938642, 1, 1, 1, 1, 1,
-0.1419785, 0.1355833, -1.337518, 1, 1, 1, 1, 1,
-0.139381, 0.8096756, 0.3837143, 1, 1, 1, 1, 1,
-0.1393359, 1.073969, 0.06178544, 1, 1, 1, 1, 1,
-0.1376948, -1.842516, -3.274816, 1, 1, 1, 1, 1,
-0.1283207, -0.9029155, -3.74321, 0, 0, 1, 1, 1,
-0.1264396, -0.1508234, -4.168389, 1, 0, 0, 1, 1,
-0.1237792, 0.9321938, 1.260759, 1, 0, 0, 1, 1,
-0.1153482, -0.3966902, -2.337957, 1, 0, 0, 1, 1,
-0.1105145, 1.181901, 0.838729, 1, 0, 0, 1, 1,
-0.1100755, 1.290595, 1.766932, 1, 0, 0, 1, 1,
-0.1030865, 0.6292071, 0.06174593, 0, 0, 0, 1, 1,
-0.1006456, -1.05166, -2.551641, 0, 0, 0, 1, 1,
-0.09987134, -0.3916596, -1.354944, 0, 0, 0, 1, 1,
-0.09948322, -0.4834118, -3.093271, 0, 0, 0, 1, 1,
-0.0960241, 0.1442928, -0.495877, 0, 0, 0, 1, 1,
-0.09226479, -0.2683207, -2.881232, 0, 0, 0, 1, 1,
-0.08194076, -1.104768, -3.429976, 0, 0, 0, 1, 1,
-0.07874984, 0.310212, 0.8622527, 1, 1, 1, 1, 1,
-0.06640057, 0.4127372, -0.1505606, 1, 1, 1, 1, 1,
-0.0658581, -2.078503, -3.403349, 1, 1, 1, 1, 1,
-0.06306925, 0.794222, 1.663804, 1, 1, 1, 1, 1,
-0.0581274, 1.891157, -0.7554785, 1, 1, 1, 1, 1,
-0.05780326, 0.2217595, -1.808901, 1, 1, 1, 1, 1,
-0.05667, 1.461372, 1.725397, 1, 1, 1, 1, 1,
-0.05232901, -0.1749574, -1.723092, 1, 1, 1, 1, 1,
-0.04914699, -0.7427506, -2.687362, 1, 1, 1, 1, 1,
-0.04525054, 0.6358718, 1.13224, 1, 1, 1, 1, 1,
-0.04477851, -0.2688856, -3.754649, 1, 1, 1, 1, 1,
-0.04420865, 0.2842537, -0.4229923, 1, 1, 1, 1, 1,
-0.0399419, -1.125268, -4.841275, 1, 1, 1, 1, 1,
-0.03757019, 1.024606, 1.484225, 1, 1, 1, 1, 1,
-0.03379968, -0.1503064, -2.213303, 1, 1, 1, 1, 1,
-0.03356988, 1.867844, -0.07564288, 0, 0, 1, 1, 1,
-0.03353506, 0.227363, -0.609211, 1, 0, 0, 1, 1,
-0.03126579, -0.8625196, -4.202299, 1, 0, 0, 1, 1,
-0.02763437, 0.3735698, -0.1604765, 1, 0, 0, 1, 1,
-0.02598106, -0.7695999, -0.9918551, 1, 0, 0, 1, 1,
-0.02290762, 1.340105, 1.977493, 1, 0, 0, 1, 1,
-0.02031311, -0.1023966, -1.34589, 0, 0, 0, 1, 1,
-0.009812478, -0.07569521, -3.136937, 0, 0, 0, 1, 1,
-0.008287106, 0.01877197, 1.268227, 0, 0, 0, 1, 1,
-0.005162244, -0.887822, -2.276458, 0, 0, 0, 1, 1,
-0.003897948, -0.9552515, -2.562718, 0, 0, 0, 1, 1,
0.0004237825, -0.1446154, 1.859799, 0, 0, 0, 1, 1,
0.002835753, 0.8292528, -0.790038, 0, 0, 0, 1, 1,
0.003067503, -0.05487099, 3.40252, 1, 1, 1, 1, 1,
0.003834965, -0.7469115, 3.85747, 1, 1, 1, 1, 1,
0.005652283, 0.7481554, 0.1910638, 1, 1, 1, 1, 1,
0.008355227, -1.925026, 2.669996, 1, 1, 1, 1, 1,
0.01313531, -0.9927027, 3.138245, 1, 1, 1, 1, 1,
0.01650839, 1.507683, 0.4978361, 1, 1, 1, 1, 1,
0.02734656, -0.7409326, 2.806638, 1, 1, 1, 1, 1,
0.03356373, -0.3284522, 2.709082, 1, 1, 1, 1, 1,
0.03700051, -1.150857, 3.79742, 1, 1, 1, 1, 1,
0.03818512, -1.201694, 3.101439, 1, 1, 1, 1, 1,
0.040197, -1.661049, 3.810152, 1, 1, 1, 1, 1,
0.04090246, 0.02284551, 1.598876, 1, 1, 1, 1, 1,
0.04785855, -0.3110564, 4.177247, 1, 1, 1, 1, 1,
0.05080392, 0.7646834, -0.774337, 1, 1, 1, 1, 1,
0.05231296, 1.794345, -0.5218477, 1, 1, 1, 1, 1,
0.0574204, -0.139734, 2.159851, 0, 0, 1, 1, 1,
0.06656721, 0.3590805, -0.07947744, 1, 0, 0, 1, 1,
0.06797976, 0.8670425, -1.355168, 1, 0, 0, 1, 1,
0.07138474, -1.639664, 3.605828, 1, 0, 0, 1, 1,
0.07266677, 1.409181, 0.7932798, 1, 0, 0, 1, 1,
0.07342283, 1.256537, 0.6206257, 1, 0, 0, 1, 1,
0.07636746, -1.792941, 4.374689, 0, 0, 0, 1, 1,
0.07693711, -1.653615, 2.951774, 0, 0, 0, 1, 1,
0.07868616, 0.7119886, 1.159401, 0, 0, 0, 1, 1,
0.07906608, -1.985732, 3.679706, 0, 0, 0, 1, 1,
0.07968339, 0.2834237, -0.2456415, 0, 0, 0, 1, 1,
0.08090729, 0.2857757, -0.7889891, 0, 0, 0, 1, 1,
0.08317962, -0.4669002, 2.278173, 0, 0, 0, 1, 1,
0.08823409, 2.273047, 0.3199158, 1, 1, 1, 1, 1,
0.09012723, 0.02774414, 0.9883128, 1, 1, 1, 1, 1,
0.09387279, -1.126552, 4.135141, 1, 1, 1, 1, 1,
0.0962198, -0.2647145, 2.813349, 1, 1, 1, 1, 1,
0.09850255, -0.8977283, 2.848328, 1, 1, 1, 1, 1,
0.1004418, 0.8877378, -0.4566117, 1, 1, 1, 1, 1,
0.103157, -0.7879138, 1.340215, 1, 1, 1, 1, 1,
0.106523, 0.08132751, 0.591363, 1, 1, 1, 1, 1,
0.1068087, -0.1148895, 2.90367, 1, 1, 1, 1, 1,
0.1090493, -0.1556424, 3.095003, 1, 1, 1, 1, 1,
0.1137557, 1.321261, -0.97973, 1, 1, 1, 1, 1,
0.1167556, 0.1720234, -0.154988, 1, 1, 1, 1, 1,
0.1171182, 0.02697481, 0.5778275, 1, 1, 1, 1, 1,
0.1208618, 0.3616782, -2.304525, 1, 1, 1, 1, 1,
0.1244389, -0.4434854, 2.19758, 1, 1, 1, 1, 1,
0.1245668, -1.361423, 4.551253, 0, 0, 1, 1, 1,
0.1316747, 0.2279103, -0.2185957, 1, 0, 0, 1, 1,
0.1374712, 1.095292, 0.8711238, 1, 0, 0, 1, 1,
0.140574, 0.1799751, 1.221565, 1, 0, 0, 1, 1,
0.1454073, 0.432221, 0.7125801, 1, 0, 0, 1, 1,
0.1470634, 0.222566, 1.574457, 1, 0, 0, 1, 1,
0.1473573, 0.971926, -0.3450823, 0, 0, 0, 1, 1,
0.14922, -0.5130999, 3.715684, 0, 0, 0, 1, 1,
0.1500207, 0.3276753, -1.668421, 0, 0, 0, 1, 1,
0.1529797, 0.02193011, 0.8135431, 0, 0, 0, 1, 1,
0.1542171, 0.09901237, 0.2371024, 0, 0, 0, 1, 1,
0.1557057, -0.351796, 4.079989, 0, 0, 0, 1, 1,
0.1557083, -0.5739869, 3.010616, 0, 0, 0, 1, 1,
0.1580342, -1.436444, 2.991354, 1, 1, 1, 1, 1,
0.1626556, -0.03322407, 1.008459, 1, 1, 1, 1, 1,
0.1645148, -2.43744, 3.396116, 1, 1, 1, 1, 1,
0.1691256, -0.3810126, 3.006287, 1, 1, 1, 1, 1,
0.1701248, 1.073279, -0.7832313, 1, 1, 1, 1, 1,
0.1715614, 0.03594983, 1.279281, 1, 1, 1, 1, 1,
0.1725444, -1.622157, 2.648558, 1, 1, 1, 1, 1,
0.1738992, 1.284966, 0.6291553, 1, 1, 1, 1, 1,
0.1751032, 0.6848159, 1.111796, 1, 1, 1, 1, 1,
0.176739, -1.131602, 2.84554, 1, 1, 1, 1, 1,
0.1778602, 0.7034049, 0.4438946, 1, 1, 1, 1, 1,
0.1815527, 0.0508462, 2.23346, 1, 1, 1, 1, 1,
0.1816354, -0.7830942, 4.119209, 1, 1, 1, 1, 1,
0.1857383, -0.4908268, 1.388526, 1, 1, 1, 1, 1,
0.1871114, 0.9350084, -1.147779, 1, 1, 1, 1, 1,
0.1898996, -0.1220302, 3.003096, 0, 0, 1, 1, 1,
0.1925789, 0.1556566, 2.412281, 1, 0, 0, 1, 1,
0.1930686, 0.6396263, -0.8892991, 1, 0, 0, 1, 1,
0.1957783, 0.8810793, 0.4916607, 1, 0, 0, 1, 1,
0.1987548, 0.5033924, 0.8505481, 1, 0, 0, 1, 1,
0.198837, -2.210588, 2.393723, 1, 0, 0, 1, 1,
0.2031011, 0.3008166, -0.6973337, 0, 0, 0, 1, 1,
0.2110587, 1.102941, 0.6782321, 0, 0, 0, 1, 1,
0.2116474, 1.320766, -1.073465, 0, 0, 0, 1, 1,
0.2150811, -0.9724593, 3.718341, 0, 0, 0, 1, 1,
0.2179036, 2.82378, 2.814852, 0, 0, 0, 1, 1,
0.2191125, -0.311667, 0.7656639, 0, 0, 0, 1, 1,
0.2274318, 0.1300014, 1.27761, 0, 0, 0, 1, 1,
0.2298369, 0.6194834, 0.1547808, 1, 1, 1, 1, 1,
0.2313736, -0.5663914, 1.807178, 1, 1, 1, 1, 1,
0.2344014, 2.089313, -0.1263373, 1, 1, 1, 1, 1,
0.2366888, 0.3769194, 0.5601572, 1, 1, 1, 1, 1,
0.236801, -0.5754063, 3.105681, 1, 1, 1, 1, 1,
0.2381893, -0.1261916, 2.507682, 1, 1, 1, 1, 1,
0.2386504, 0.4497717, 0.5047751, 1, 1, 1, 1, 1,
0.2408544, -0.3017388, 3.125726, 1, 1, 1, 1, 1,
0.2418277, -0.0693326, 2.126409, 1, 1, 1, 1, 1,
0.248382, -1.546544, 2.71069, 1, 1, 1, 1, 1,
0.2541749, -0.1116348, -0.2027551, 1, 1, 1, 1, 1,
0.2569201, -0.9107949, 2.785933, 1, 1, 1, 1, 1,
0.2634656, 0.4928068, 2.11632, 1, 1, 1, 1, 1,
0.2668674, -0.7742795, 1.842475, 1, 1, 1, 1, 1,
0.2675346, 0.03568026, -0.5042223, 1, 1, 1, 1, 1,
0.2691158, 1.828761, -0.4736315, 0, 0, 1, 1, 1,
0.2812572, 0.5357651, 0.5261639, 1, 0, 0, 1, 1,
0.2813308, 0.8633195, 0.00168326, 1, 0, 0, 1, 1,
0.2862403, -1.626374, 3.599337, 1, 0, 0, 1, 1,
0.2895574, -1.13801, 3.781134, 1, 0, 0, 1, 1,
0.290632, 0.07496632, 0.6649697, 1, 0, 0, 1, 1,
0.2927015, -1.10119, 2.505612, 0, 0, 0, 1, 1,
0.2939608, 0.1177838, 0.3997366, 0, 0, 0, 1, 1,
0.3090297, -1.08358, 3.643224, 0, 0, 0, 1, 1,
0.3090487, -3.049359, 2.667999, 0, 0, 0, 1, 1,
0.3116852, -0.1974765, 2.08079, 0, 0, 0, 1, 1,
0.3138524, -0.8148671, 2.87748, 0, 0, 0, 1, 1,
0.3243645, -1.010989, 1.551669, 0, 0, 0, 1, 1,
0.3245002, -0.04126268, 1.379287, 1, 1, 1, 1, 1,
0.3251807, 0.1730927, 0.5606031, 1, 1, 1, 1, 1,
0.3261103, 0.09736725, 2.238495, 1, 1, 1, 1, 1,
0.3276838, -0.5217218, 2.188093, 1, 1, 1, 1, 1,
0.3300387, 0.1525438, 1.347104, 1, 1, 1, 1, 1,
0.3312747, -0.3620524, 1.313495, 1, 1, 1, 1, 1,
0.3339968, -0.3588545, 2.7289, 1, 1, 1, 1, 1,
0.3340017, -0.6173021, 3.035161, 1, 1, 1, 1, 1,
0.3359304, -0.06596831, 0.3161715, 1, 1, 1, 1, 1,
0.337619, -1.138677, 3.443073, 1, 1, 1, 1, 1,
0.3405436, 0.7808582, 0.2096679, 1, 1, 1, 1, 1,
0.3412975, -0.1948841, 2.947182, 1, 1, 1, 1, 1,
0.3436381, -1.089621, 1.935795, 1, 1, 1, 1, 1,
0.3478145, -1.430184, 2.785998, 1, 1, 1, 1, 1,
0.3496596, -0.4003535, 2.117801, 1, 1, 1, 1, 1,
0.3499793, 1.276431, -1.688948, 0, 0, 1, 1, 1,
0.3622486, -0.7779769, 4.945732, 1, 0, 0, 1, 1,
0.3650946, 0.1825562, 1.441871, 1, 0, 0, 1, 1,
0.3724661, -0.4987912, 1.751384, 1, 0, 0, 1, 1,
0.3798644, 0.2448405, 2.979192, 1, 0, 0, 1, 1,
0.3805339, -0.6428817, 3.179084, 1, 0, 0, 1, 1,
0.3808152, 0.9860788, 2.384152, 0, 0, 0, 1, 1,
0.3810941, 0.7396004, 0.8565664, 0, 0, 0, 1, 1,
0.3813556, -0.08983079, 3.002048, 0, 0, 0, 1, 1,
0.3815297, -1.888877, 4.841903, 0, 0, 0, 1, 1,
0.3867913, -0.9887778, 2.523921, 0, 0, 0, 1, 1,
0.3928084, 0.7077057, -1.250577, 0, 0, 0, 1, 1,
0.3934395, 1.766876, -1.135206, 0, 0, 0, 1, 1,
0.3988523, 0.8383203, -0.8792602, 1, 1, 1, 1, 1,
0.3991882, 1.022603, 0.7869841, 1, 1, 1, 1, 1,
0.4029567, 0.06938092, 0.9815315, 1, 1, 1, 1, 1,
0.4052144, 1.288993, 0.03025648, 1, 1, 1, 1, 1,
0.4056531, -0.8833855, 1.32703, 1, 1, 1, 1, 1,
0.4087297, -1.085052, 3.08829, 1, 1, 1, 1, 1,
0.41142, 1.21136, -0.1753165, 1, 1, 1, 1, 1,
0.4140691, -0.3920116, 1.492844, 1, 1, 1, 1, 1,
0.415283, -1.122712, 2.71871, 1, 1, 1, 1, 1,
0.415554, 0.280916, 0.6143585, 1, 1, 1, 1, 1,
0.4182627, 0.416574, -1.738035, 1, 1, 1, 1, 1,
0.4187405, 0.2561189, 0.8378739, 1, 1, 1, 1, 1,
0.4189689, 1.352141, -0.1154923, 1, 1, 1, 1, 1,
0.4224273, -0.2243859, 1.574021, 1, 1, 1, 1, 1,
0.4235548, 0.00342251, 0.5869144, 1, 1, 1, 1, 1,
0.4251707, -0.8967336, 2.031956, 0, 0, 1, 1, 1,
0.4279488, -0.8847781, 2.625799, 1, 0, 0, 1, 1,
0.4305929, 0.6178906, 0.9414652, 1, 0, 0, 1, 1,
0.4310986, -2.276841, 1.987656, 1, 0, 0, 1, 1,
0.4315192, 0.1482781, 0.07508624, 1, 0, 0, 1, 1,
0.4377137, 0.3693525, 2.159469, 1, 0, 0, 1, 1,
0.4380835, -0.4962681, 1.723489, 0, 0, 0, 1, 1,
0.4412972, -0.347843, 1.115228, 0, 0, 0, 1, 1,
0.4420627, -1.03003, 1.599497, 0, 0, 0, 1, 1,
0.4436873, 0.7133458, 1.726542, 0, 0, 0, 1, 1,
0.4477051, -1.010392, 2.224337, 0, 0, 0, 1, 1,
0.4497552, 0.3659665, -0.2564791, 0, 0, 0, 1, 1,
0.45286, 0.9766102, 0.4584147, 0, 0, 0, 1, 1,
0.4605714, -0.3968485, 3.432575, 1, 1, 1, 1, 1,
0.4736731, 0.5973517, 0.3607205, 1, 1, 1, 1, 1,
0.4769739, -1.276834, 2.401875, 1, 1, 1, 1, 1,
0.4769967, -2.943776, 2.939167, 1, 1, 1, 1, 1,
0.4807107, -0.2850133, 0.7339101, 1, 1, 1, 1, 1,
0.4807654, 0.3328364, -0.1644221, 1, 1, 1, 1, 1,
0.4841499, 0.03166449, 2.372508, 1, 1, 1, 1, 1,
0.5029033, -1.032895, 4.729272, 1, 1, 1, 1, 1,
0.5036399, 0.4368009, 1.385717, 1, 1, 1, 1, 1,
0.5068059, -1.941714, 3.707205, 1, 1, 1, 1, 1,
0.5125357, 0.5170296, 0.9651041, 1, 1, 1, 1, 1,
0.5144451, 2.10518, -0.119315, 1, 1, 1, 1, 1,
0.5195776, -0.3445824, 1.927014, 1, 1, 1, 1, 1,
0.5225189, 0.4010762, 0.05702327, 1, 1, 1, 1, 1,
0.5283452, -1.164115, 2.963065, 1, 1, 1, 1, 1,
0.5392461, -0.6804679, 3.738586, 0, 0, 1, 1, 1,
0.54391, 0.04602715, 0.8649294, 1, 0, 0, 1, 1,
0.5444573, -1.080477, 3.787361, 1, 0, 0, 1, 1,
0.5479442, -1.843595, 3.972235, 1, 0, 0, 1, 1,
0.5537508, 0.06960669, 4.155491, 1, 0, 0, 1, 1,
0.5639197, -0.824724, 3.249021, 1, 0, 0, 1, 1,
0.5664893, -0.4345507, 2.591797, 0, 0, 0, 1, 1,
0.569115, -0.0636729, 2.262155, 0, 0, 0, 1, 1,
0.5793929, -0.4575515, 0.8720962, 0, 0, 0, 1, 1,
0.5800769, -0.8211493, 2.907348, 0, 0, 0, 1, 1,
0.5823473, -0.2331089, 0.231317, 0, 0, 0, 1, 1,
0.5876405, -0.4178237, 2.24039, 0, 0, 0, 1, 1,
0.5877283, -0.9896292, 4.634339, 0, 0, 0, 1, 1,
0.5886881, -0.2508424, 1.085565, 1, 1, 1, 1, 1,
0.5902953, 1.198109, 1.048079, 1, 1, 1, 1, 1,
0.590899, -0.2974052, 0.8670672, 1, 1, 1, 1, 1,
0.5940291, 0.3696033, 0.9875809, 1, 1, 1, 1, 1,
0.5943874, 1.042753, -0.4802994, 1, 1, 1, 1, 1,
0.594741, 0.2438665, 2.049056, 1, 1, 1, 1, 1,
0.5982893, -0.6138274, 2.132978, 1, 1, 1, 1, 1,
0.5984057, 0.7606519, 1.062079, 1, 1, 1, 1, 1,
0.5988321, -1.309793, 4.036045, 1, 1, 1, 1, 1,
0.5999923, -0.1593261, 0.9829329, 1, 1, 1, 1, 1,
0.6033503, -1.233779, 2.48773, 1, 1, 1, 1, 1,
0.6053495, 2.255361, 0.01333578, 1, 1, 1, 1, 1,
0.6085424, 0.5001796, 0.8998638, 1, 1, 1, 1, 1,
0.6098412, 0.9663351, 0.3397113, 1, 1, 1, 1, 1,
0.6109236, -2.38476, 3.161416, 1, 1, 1, 1, 1,
0.6152819, -0.9669415, 2.941045, 0, 0, 1, 1, 1,
0.6178201, -0.4058225, 3.36629, 1, 0, 0, 1, 1,
0.629272, -0.07052141, 3.065835, 1, 0, 0, 1, 1,
0.6346421, 1.37445, 0.1804655, 1, 0, 0, 1, 1,
0.6350445, 0.9371169, -1.370953, 1, 0, 0, 1, 1,
0.6368016, 0.1772089, -0.2094796, 1, 0, 0, 1, 1,
0.6368495, -0.07742027, 1.375792, 0, 0, 0, 1, 1,
0.6388248, 0.3851993, -0.1317365, 0, 0, 0, 1, 1,
0.6478156, -0.4283481, 2.918225, 0, 0, 0, 1, 1,
0.6489161, -0.9032163, 0.7161412, 0, 0, 0, 1, 1,
0.6498742, 0.9237717, -1.236041, 0, 0, 0, 1, 1,
0.6513388, -0.9905764, 1.962351, 0, 0, 0, 1, 1,
0.6537248, -0.5376683, 1.655337, 0, 0, 0, 1, 1,
0.6546054, 0.03601846, 2.049959, 1, 1, 1, 1, 1,
0.664157, -2.166333, 2.817683, 1, 1, 1, 1, 1,
0.6645993, 1.194077, 1.178002, 1, 1, 1, 1, 1,
0.669071, 0.6061805, 0.680958, 1, 1, 1, 1, 1,
0.6838506, -0.5792547, 4.969391, 1, 1, 1, 1, 1,
0.684988, 0.09145878, 1.107733, 1, 1, 1, 1, 1,
0.6886047, -1.179825, 3.940925, 1, 1, 1, 1, 1,
0.6911772, 0.1373741, 2.513825, 1, 1, 1, 1, 1,
0.6912633, 0.6972564, -0.07490466, 1, 1, 1, 1, 1,
0.6914595, 0.6550337, 0.1210659, 1, 1, 1, 1, 1,
0.6951632, -0.120493, 2.382839, 1, 1, 1, 1, 1,
0.6968345, -0.1079106, 0.9725934, 1, 1, 1, 1, 1,
0.7015884, -0.8330103, 0.3158911, 1, 1, 1, 1, 1,
0.7051088, -0.6082872, 0.5515328, 1, 1, 1, 1, 1,
0.707798, 0.3856973, -0.7931876, 1, 1, 1, 1, 1,
0.7089337, -1.664525, 4.197694, 0, 0, 1, 1, 1,
0.7116275, 1.473423, 1.05674, 1, 0, 0, 1, 1,
0.721359, -1.323323, 4.55981, 1, 0, 0, 1, 1,
0.7234457, -0.9401557, 0.9439845, 1, 0, 0, 1, 1,
0.7240148, 0.3005849, 2.295819, 1, 0, 0, 1, 1,
0.7250636, 0.7522315, 0.7070661, 1, 0, 0, 1, 1,
0.7299771, 1.686924, -1.062822, 0, 0, 0, 1, 1,
0.7396874, 0.1107593, 0.1499444, 0, 0, 0, 1, 1,
0.7414261, 2.51136, 0.7844819, 0, 0, 0, 1, 1,
0.7428312, 0.4329807, 1.873979, 0, 0, 0, 1, 1,
0.7452664, -0.3587674, 1.775117, 0, 0, 0, 1, 1,
0.7465014, 2.214506, 0.5046251, 0, 0, 0, 1, 1,
0.7553282, 1.401499, 0.6609998, 0, 0, 0, 1, 1,
0.7569943, -0.4599134, 2.160522, 1, 1, 1, 1, 1,
0.758679, -2.560132, 2.910553, 1, 1, 1, 1, 1,
0.7610436, 0.2633622, 1.800029, 1, 1, 1, 1, 1,
0.7654642, 0.02872086, 1.460256, 1, 1, 1, 1, 1,
0.7684842, 1.449828, 0.6698881, 1, 1, 1, 1, 1,
0.7744369, -0.4508049, 1.485581, 1, 1, 1, 1, 1,
0.7748879, 0.04080296, -0.08988407, 1, 1, 1, 1, 1,
0.7756285, -1.019681, 2.438231, 1, 1, 1, 1, 1,
0.7777261, 0.4793768, 1.158775, 1, 1, 1, 1, 1,
0.7787499, -0.269242, 2.838348, 1, 1, 1, 1, 1,
0.7825767, -2.579057, 2.160029, 1, 1, 1, 1, 1,
0.7840567, -0.2508834, 2.416575, 1, 1, 1, 1, 1,
0.7853684, 1.096594, 2.223459, 1, 1, 1, 1, 1,
0.786746, 0.5973876, 2.196506, 1, 1, 1, 1, 1,
0.7886658, -0.1795974, 2.992159, 1, 1, 1, 1, 1,
0.7893725, 0.4163485, 2.008231, 0, 0, 1, 1, 1,
0.7902631, -0.3347537, 2.400906, 1, 0, 0, 1, 1,
0.7959692, 0.808584, 0.3883734, 1, 0, 0, 1, 1,
0.7966948, -1.243455, 2.610469, 1, 0, 0, 1, 1,
0.8016796, 0.5170411, 2.140345, 1, 0, 0, 1, 1,
0.8037853, 2.328521, 1.266447, 1, 0, 0, 1, 1,
0.8042673, -0.4862659, 1.554989, 0, 0, 0, 1, 1,
0.8106084, -1.139374, 4.005927, 0, 0, 0, 1, 1,
0.8130287, 0.4565738, 1.285532, 0, 0, 0, 1, 1,
0.8134194, 1.696075, 1.689355, 0, 0, 0, 1, 1,
0.8153925, -0.5498522, 0.8293242, 0, 0, 0, 1, 1,
0.8158002, -1.656173, 3.256735, 0, 0, 0, 1, 1,
0.8166436, -1.986253, 2.015852, 0, 0, 0, 1, 1,
0.8191668, 0.5695801, 0.008795883, 1, 1, 1, 1, 1,
0.8201951, -0.05863525, 1.929761, 1, 1, 1, 1, 1,
0.8247135, 0.8297796, 1.327812, 1, 1, 1, 1, 1,
0.8258465, 0.5660577, 2.191323, 1, 1, 1, 1, 1,
0.8356658, 0.7447699, 1.323354, 1, 1, 1, 1, 1,
0.8385364, -0.3044538, 2.138331, 1, 1, 1, 1, 1,
0.8401945, -0.7007335, 2.475887, 1, 1, 1, 1, 1,
0.8446571, 0.2563223, 0.346756, 1, 1, 1, 1, 1,
0.8530722, 1.454806, 2.130831, 1, 1, 1, 1, 1,
0.853431, -0.3589792, 3.447762, 1, 1, 1, 1, 1,
0.8587437, -1.202544, 3.512177, 1, 1, 1, 1, 1,
0.8606941, -0.614987, 2.013206, 1, 1, 1, 1, 1,
0.8610089, -0.6104911, 1.10358, 1, 1, 1, 1, 1,
0.8616182, 0.3673529, 2.00295, 1, 1, 1, 1, 1,
0.8655452, -0.8504128, 0.760806, 1, 1, 1, 1, 1,
0.8658014, 0.9748226, 0.2549056, 0, 0, 1, 1, 1,
0.8674979, -0.6269635, 2.102612, 1, 0, 0, 1, 1,
0.8699159, -0.8360234, 2.431236, 1, 0, 0, 1, 1,
0.8705175, 2.525767, 0.1696859, 1, 0, 0, 1, 1,
0.8731069, -0.970112, 0.7790355, 1, 0, 0, 1, 1,
0.8773377, 1.800759, -2.791457, 1, 0, 0, 1, 1,
0.8823415, 1.439819, 3.083612, 0, 0, 0, 1, 1,
0.8868563, 0.1723034, 2.208979, 0, 0, 0, 1, 1,
0.8908195, -0.1062213, 0.7562663, 0, 0, 0, 1, 1,
0.8943853, -0.5682568, 2.081695, 0, 0, 0, 1, 1,
0.8978603, -2.727495, 2.851845, 0, 0, 0, 1, 1,
0.8997276, -1.693936, 1.812626, 0, 0, 0, 1, 1,
0.9025992, 0.308586, 2.291066, 0, 0, 0, 1, 1,
0.9037699, 0.6763102, 2.54098, 1, 1, 1, 1, 1,
0.9042447, -0.6804169, 1.908177, 1, 1, 1, 1, 1,
0.909748, 0.1835893, 1.041173, 1, 1, 1, 1, 1,
0.9098285, 2.460791, 0.7292618, 1, 1, 1, 1, 1,
0.9106939, -0.4053511, 1.547791, 1, 1, 1, 1, 1,
0.9168183, 0.0983052, 3.94844, 1, 1, 1, 1, 1,
0.9217014, -0.9357348, 1.847099, 1, 1, 1, 1, 1,
0.9263902, 0.9309799, 1.576349, 1, 1, 1, 1, 1,
0.9322734, -2.018942, 1.463657, 1, 1, 1, 1, 1,
0.9423558, 0.6659191, 1.487332, 1, 1, 1, 1, 1,
0.9602, 1.442596, 0.5102665, 1, 1, 1, 1, 1,
0.9606903, 0.4392788, 1.844674, 1, 1, 1, 1, 1,
0.9652179, -0.7284662, 3.164805, 1, 1, 1, 1, 1,
0.9703476, 0.9596707, 0.6401318, 1, 1, 1, 1, 1,
0.9783923, 0.3618119, 0.3288668, 1, 1, 1, 1, 1,
0.9793671, 1.165539, 0.9901191, 0, 0, 1, 1, 1,
0.981227, -0.5539927, 2.311907, 1, 0, 0, 1, 1,
0.9909654, 1.647825, 0.9287236, 1, 0, 0, 1, 1,
0.9938172, 0.1051258, 1.502257, 1, 0, 0, 1, 1,
0.9972305, -0.4753285, 4.108016, 1, 0, 0, 1, 1,
1.003664, 0.7086633, 1.117244, 1, 0, 0, 1, 1,
1.006087, -0.1316068, 0.6075987, 0, 0, 0, 1, 1,
1.007055, -0.8207272, 1.254502, 0, 0, 0, 1, 1,
1.008386, -0.4127599, 0.326691, 0, 0, 0, 1, 1,
1.008476, 0.4328678, 1.428193, 0, 0, 0, 1, 1,
1.009214, -1.24021, 1.205343, 0, 0, 0, 1, 1,
1.010869, 0.06411092, 3.739856, 0, 0, 0, 1, 1,
1.011887, -0.235915, 1.025991, 0, 0, 0, 1, 1,
1.021528, 1.12919, 1.111946, 1, 1, 1, 1, 1,
1.024517, 0.4536, 2.166609, 1, 1, 1, 1, 1,
1.030158, 1.795819, 1.075492, 1, 1, 1, 1, 1,
1.031139, 0.354754, 0.3998305, 1, 1, 1, 1, 1,
1.033607, 0.5567444, 0.2258422, 1, 1, 1, 1, 1,
1.038744, -0.3704958, 1.310318, 1, 1, 1, 1, 1,
1.041969, 0.427766, 1.842966, 1, 1, 1, 1, 1,
1.044351, -0.5218359, 3.069062, 1, 1, 1, 1, 1,
1.054844, 0.682265, 0.9221582, 1, 1, 1, 1, 1,
1.060271, -1.080968, 4.123695, 1, 1, 1, 1, 1,
1.061748, -1.119077, 1.681679, 1, 1, 1, 1, 1,
1.062307, -0.4239129, 2.31669, 1, 1, 1, 1, 1,
1.062454, 1.075001, 1.587309, 1, 1, 1, 1, 1,
1.066347, 1.447976, 1.592514, 1, 1, 1, 1, 1,
1.067902, 1.161434, 0.1081714, 1, 1, 1, 1, 1,
1.074006, 0.07768952, 0.2827071, 0, 0, 1, 1, 1,
1.080715, -0.8259074, 1.16655, 1, 0, 0, 1, 1,
1.083594, -0.2242923, -0.6687595, 1, 0, 0, 1, 1,
1.097221, 0.629526, 1.174814, 1, 0, 0, 1, 1,
1.100567, 1.317561, -0.212143, 1, 0, 0, 1, 1,
1.103207, 0.1440566, 2.753268, 1, 0, 0, 1, 1,
1.10355, 0.331868, 1.153105, 0, 0, 0, 1, 1,
1.112574, 0.004183053, 1.264062, 0, 0, 0, 1, 1,
1.11315, 0.5722002, 1.145061, 0, 0, 0, 1, 1,
1.118061, 1.687528, 1.22434, 0, 0, 0, 1, 1,
1.119661, -0.08970186, 3.117437, 0, 0, 0, 1, 1,
1.136298, 2.200054, 0.6826007, 0, 0, 0, 1, 1,
1.138957, -1.451737, 3.104995, 0, 0, 0, 1, 1,
1.140446, 0.93172, -0.3378806, 1, 1, 1, 1, 1,
1.147319, -1.7285, 2.01923, 1, 1, 1, 1, 1,
1.148042, 0.8056114, -0.4294533, 1, 1, 1, 1, 1,
1.155174, -0.1909782, 1.857516, 1, 1, 1, 1, 1,
1.162038, -1.091261, 1.172781, 1, 1, 1, 1, 1,
1.16554, 0.9145505, 0.9721572, 1, 1, 1, 1, 1,
1.168853, 0.3854936, 1.594777, 1, 1, 1, 1, 1,
1.171475, -2.757764, 3.074778, 1, 1, 1, 1, 1,
1.173775, 0.5660975, 0.4958065, 1, 1, 1, 1, 1,
1.174753, -1.544353, 3.483759, 1, 1, 1, 1, 1,
1.180513, 0.1571621, 2.876612, 1, 1, 1, 1, 1,
1.184285, 0.5240901, -0.357415, 1, 1, 1, 1, 1,
1.185349, 2.37768, -0.05132683, 1, 1, 1, 1, 1,
1.203855, -1.373905, 4.127847, 1, 1, 1, 1, 1,
1.211378, 0.4481138, 1.848025, 1, 1, 1, 1, 1,
1.212297, 0.8328697, 1.466195, 0, 0, 1, 1, 1,
1.21615, 1.704932, 1.539832, 1, 0, 0, 1, 1,
1.217334, -0.3517432, 1.98036, 1, 0, 0, 1, 1,
1.223487, 0.8766956, -0.6295859, 1, 0, 0, 1, 1,
1.235439, 0.5130327, 0.3152281, 1, 0, 0, 1, 1,
1.238711, 0.9657909, -0.5676613, 1, 0, 0, 1, 1,
1.26795, 0.7158955, 0.8675463, 0, 0, 0, 1, 1,
1.26967, 0.3088209, 1.014344, 0, 0, 0, 1, 1,
1.270138, 0.1641846, 1.887465, 0, 0, 0, 1, 1,
1.282604, -0.9864071, 3.759399, 0, 0, 0, 1, 1,
1.285555, 0.5855257, 1.935809, 0, 0, 0, 1, 1,
1.296355, 2.661381, -0.6323777, 0, 0, 0, 1, 1,
1.304081, -0.6803727, 3.315224, 0, 0, 0, 1, 1,
1.313272, -0.08837052, 0.05923555, 1, 1, 1, 1, 1,
1.316431, 0.1226882, -0.2538456, 1, 1, 1, 1, 1,
1.318843, 1.806167, 0.8898628, 1, 1, 1, 1, 1,
1.327452, -1.822987, 1.946056, 1, 1, 1, 1, 1,
1.3353, 0.4637824, 2.57525, 1, 1, 1, 1, 1,
1.339757, 0.1760538, 0.9448892, 1, 1, 1, 1, 1,
1.357141, -1.816672, 3.595071, 1, 1, 1, 1, 1,
1.367656, 1.07937, 0.3725795, 1, 1, 1, 1, 1,
1.374368, -0.3645228, 1.540601, 1, 1, 1, 1, 1,
1.375227, -1.702806, 3.436316, 1, 1, 1, 1, 1,
1.376319, 1.536314, 1.424104, 1, 1, 1, 1, 1,
1.381546, 2.263178, 1.231422, 1, 1, 1, 1, 1,
1.384413, 0.7066017, 2.245737, 1, 1, 1, 1, 1,
1.388138, -0.7071851, 2.134807, 1, 1, 1, 1, 1,
1.388495, -0.8173734, 2.106554, 1, 1, 1, 1, 1,
1.410716, -1.446949, 3.348821, 0, 0, 1, 1, 1,
1.417508, -0.4697263, 1.935843, 1, 0, 0, 1, 1,
1.421643, 0.1536895, 2.322792, 1, 0, 0, 1, 1,
1.428012, -1.371896, 3.061008, 1, 0, 0, 1, 1,
1.441469, -0.1668367, 1.469638, 1, 0, 0, 1, 1,
1.442916, -0.0550004, 1.199516, 1, 0, 0, 1, 1,
1.469525, 0.7290157, 1.842345, 0, 0, 0, 1, 1,
1.474126, -1.116742, 1.930928, 0, 0, 0, 1, 1,
1.488469, 0.6615574, 2.162395, 0, 0, 0, 1, 1,
1.492711, -0.9567983, 2.878402, 0, 0, 0, 1, 1,
1.500732, 1.059225, 0.5595079, 0, 0, 0, 1, 1,
1.502984, -0.3461449, 2.1012, 0, 0, 0, 1, 1,
1.506177, -0.4397578, 1.994009, 0, 0, 0, 1, 1,
1.513485, -0.06004947, 1.453644, 1, 1, 1, 1, 1,
1.514451, -0.5180583, 0.9545627, 1, 1, 1, 1, 1,
1.517308, -0.4901005, 1.668904, 1, 1, 1, 1, 1,
1.538812, 0.06607731, 0.5017801, 1, 1, 1, 1, 1,
1.542661, 0.6655199, 2.127071, 1, 1, 1, 1, 1,
1.54675, 0.2530851, 0.4453693, 1, 1, 1, 1, 1,
1.547407, -0.1538506, 2.496544, 1, 1, 1, 1, 1,
1.548244, 1.391907, 0.3269465, 1, 1, 1, 1, 1,
1.549962, -0.872555, 0.8621878, 1, 1, 1, 1, 1,
1.568419, 0.02820926, 1.200882, 1, 1, 1, 1, 1,
1.57893, 0.5552563, 1.490303, 1, 1, 1, 1, 1,
1.584162, -1.866624, 2.536271, 1, 1, 1, 1, 1,
1.601323, 1.796922, 1.685922, 1, 1, 1, 1, 1,
1.609144, 2.301574, 0.216271, 1, 1, 1, 1, 1,
1.613164, -0.3058877, 2.007049, 1, 1, 1, 1, 1,
1.628449, 0.1848391, 0.2213816, 0, 0, 1, 1, 1,
1.656052, -1.897604, 3.390972, 1, 0, 0, 1, 1,
1.67653, 0.7568456, 0.3189181, 1, 0, 0, 1, 1,
1.680845, -0.5301001, 3.459249, 1, 0, 0, 1, 1,
1.686395, 0.1467271, 1.439975, 1, 0, 0, 1, 1,
1.708541, -0.1347306, 0.6950611, 1, 0, 0, 1, 1,
1.73511, 1.136232, 1.476299, 0, 0, 0, 1, 1,
1.741731, -0.9781227, 2.003177, 0, 0, 0, 1, 1,
1.753468, 0.9598171, 1.948882, 0, 0, 0, 1, 1,
1.779407, 1.359288, 1.410869, 0, 0, 0, 1, 1,
1.797456, -0.579704, 3.602073, 0, 0, 0, 1, 1,
1.801437, 1.787035, 1.10994, 0, 0, 0, 1, 1,
1.807137, -2.685836, 2.399874, 0, 0, 0, 1, 1,
1.83316, -0.2949354, 2.843158, 1, 1, 1, 1, 1,
1.893906, -1.600758, 2.730323, 1, 1, 1, 1, 1,
1.909674, 1.090332, 2.959907, 1, 1, 1, 1, 1,
1.915528, 0.06106291, 2.47999, 1, 1, 1, 1, 1,
1.929299, -0.1127216, -0.1763299, 1, 1, 1, 1, 1,
1.935748, -0.4461259, 1.710128, 1, 1, 1, 1, 1,
1.93769, 0.6234484, 0.7006947, 1, 1, 1, 1, 1,
1.946286, 0.6651559, 0.7601528, 1, 1, 1, 1, 1,
1.947991, -0.1445138, 0.4655466, 1, 1, 1, 1, 1,
1.952742, -1.953965, 3.185558, 1, 1, 1, 1, 1,
1.979406, -0.9520723, 1.805425, 1, 1, 1, 1, 1,
1.980946, -0.7720045, 1.908662, 1, 1, 1, 1, 1,
1.982926, 1.302324, 1.298209, 1, 1, 1, 1, 1,
1.986649, -0.3199955, 2.273132, 1, 1, 1, 1, 1,
2.010512, -0.07801376, 2.219404, 1, 1, 1, 1, 1,
2.054024, 0.6394357, 3.456355, 0, 0, 1, 1, 1,
2.055631, -0.9484108, 1.724815, 1, 0, 0, 1, 1,
2.079465, 0.1480867, -0.06332903, 1, 0, 0, 1, 1,
2.082386, -0.2071754, 0.2551575, 1, 0, 0, 1, 1,
2.116545, -0.1523305, 2.51124, 1, 0, 0, 1, 1,
2.12772, 0.1328376, 1.820887, 1, 0, 0, 1, 1,
2.187685, 0.4313813, 1.42214, 0, 0, 0, 1, 1,
2.191542, 1.553196, 0.8285455, 0, 0, 0, 1, 1,
2.211392, -0.188068, 0.5641865, 0, 0, 0, 1, 1,
2.229605, 1.649149, 1.616942, 0, 0, 0, 1, 1,
2.246327, -0.6920732, 0.2895107, 0, 0, 0, 1, 1,
2.381959, 1.424663, 1.013655, 0, 0, 0, 1, 1,
2.42417, 0.6071919, 3.405728, 0, 0, 0, 1, 1,
2.44439, -1.293698, 2.281937, 1, 1, 1, 1, 1,
2.460436, 0.5291783, 0.762141, 1, 1, 1, 1, 1,
2.564269, -0.310222, 2.000068, 1, 1, 1, 1, 1,
2.593688, 0.8209544, 0.8466464, 1, 1, 1, 1, 1,
2.70644, -2.378701, 0.8621565, 1, 1, 1, 1, 1,
3.53179, -1.330747, 2.007243, 1, 1, 1, 1, 1,
3.766486, 0.09592981, 3.59512, 1, 1, 1, 1, 1
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
var radius = 9.17568;
var distance = 32.22919;
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
mvMatrix.translate( -0.4809027, 0.006848812, -0.06405807 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.22919);
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
