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
-3.467422, 0.5707796, -1.882689, 1, 0, 0, 1,
-2.88174, 1.012375, -1.05368, 1, 0.007843138, 0, 1,
-2.783715, 0.4061977, -1.818189, 1, 0.01176471, 0, 1,
-2.638592, -1.066868, -2.91256, 1, 0.01960784, 0, 1,
-2.607381, -0.002120913, -0.655551, 1, 0.02352941, 0, 1,
-2.607059, 2.27426, -0.7376003, 1, 0.03137255, 0, 1,
-2.54396, 0.579675, -0.428047, 1, 0.03529412, 0, 1,
-2.537225, -0.3500412, -1.774464, 1, 0.04313726, 0, 1,
-2.431179, 1.070338, -0.599815, 1, 0.04705882, 0, 1,
-2.425776, 1.173054, -1.863874, 1, 0.05490196, 0, 1,
-2.402953, 1.886919, -1.072471, 1, 0.05882353, 0, 1,
-2.360768, 1.186689, 0.3674606, 1, 0.06666667, 0, 1,
-2.323405, 0.6639102, 0.4177636, 1, 0.07058824, 0, 1,
-2.248819, -0.3667012, -3.313339, 1, 0.07843138, 0, 1,
-2.24833, -0.6324146, -2.749573, 1, 0.08235294, 0, 1,
-2.197678, -0.4212107, -1.175246, 1, 0.09019608, 0, 1,
-2.182456, 0.4138733, -0.1233746, 1, 0.09411765, 0, 1,
-2.182385, 1.337093, -2.760174, 1, 0.1019608, 0, 1,
-2.139669, 0.2247324, -1.319405, 1, 0.1098039, 0, 1,
-2.119974, 0.06653889, -1.076188, 1, 0.1137255, 0, 1,
-2.117812, -0.3183355, -2.071414, 1, 0.1215686, 0, 1,
-2.087555, -1.669916, -1.483959, 1, 0.1254902, 0, 1,
-2.077796, -0.0736789, -0.4805692, 1, 0.1333333, 0, 1,
-2.075794, 0.5517836, -0.1128787, 1, 0.1372549, 0, 1,
-2.068811, 1.277261, -0.2590703, 1, 0.145098, 0, 1,
-2.025094, -0.9284367, 0.8373932, 1, 0.1490196, 0, 1,
-2.006463, 0.1916829, -2.152474, 1, 0.1568628, 0, 1,
-1.981597, 0.1011566, -1.367235, 1, 0.1607843, 0, 1,
-1.975112, -0.5682324, -1.381264, 1, 0.1686275, 0, 1,
-1.968787, 1.510535, -2.448834, 1, 0.172549, 0, 1,
-1.963266, 1.322708, -3.726168, 1, 0.1803922, 0, 1,
-1.960076, 1.41864, -1.638755, 1, 0.1843137, 0, 1,
-1.942439, -0.4956785, -0.2146733, 1, 0.1921569, 0, 1,
-1.937311, 0.06392693, -2.191721, 1, 0.1960784, 0, 1,
-1.93311, 1.709081, 0.8227478, 1, 0.2039216, 0, 1,
-1.931111, 1.420744, 0.8565115, 1, 0.2117647, 0, 1,
-1.928632, 0.06600272, -1.09831, 1, 0.2156863, 0, 1,
-1.917754, 0.1214544, -0.3493888, 1, 0.2235294, 0, 1,
-1.91238, -0.1712932, -2.171513, 1, 0.227451, 0, 1,
-1.904757, -0.7836516, -1.595062, 1, 0.2352941, 0, 1,
-1.89882, 1.970676, -0.2582883, 1, 0.2392157, 0, 1,
-1.898634, -0.319117, -0.8657753, 1, 0.2470588, 0, 1,
-1.884821, 1.419732, -1.686902, 1, 0.2509804, 0, 1,
-1.851433, -0.7203811, -2.199584, 1, 0.2588235, 0, 1,
-1.849385, 1.408181, -1.624291, 1, 0.2627451, 0, 1,
-1.844611, 0.4737399, -1.528473, 1, 0.2705882, 0, 1,
-1.836565, -0.4271355, -1.930909, 1, 0.2745098, 0, 1,
-1.830241, -0.1795941, -2.990462, 1, 0.282353, 0, 1,
-1.821855, -1.868783, -1.881872, 1, 0.2862745, 0, 1,
-1.818823, 0.1090008, -2.37669, 1, 0.2941177, 0, 1,
-1.816484, -0.2165767, 0.08128089, 1, 0.3019608, 0, 1,
-1.809013, -1.134073, -3.720395, 1, 0.3058824, 0, 1,
-1.768347, -0.3673032, -0.2472668, 1, 0.3137255, 0, 1,
-1.745536, -1.396451, -2.935654, 1, 0.3176471, 0, 1,
-1.736114, 0.1460839, -0.5647512, 1, 0.3254902, 0, 1,
-1.73287, 0.02881726, -0.8883203, 1, 0.3294118, 0, 1,
-1.715533, 1.796101, -0.356191, 1, 0.3372549, 0, 1,
-1.712949, -0.6446869, -1.314155, 1, 0.3411765, 0, 1,
-1.712565, -0.6965573, -1.281193, 1, 0.3490196, 0, 1,
-1.705279, 0.723444, -2.213549, 1, 0.3529412, 0, 1,
-1.700964, 2.138924, -0.1655894, 1, 0.3607843, 0, 1,
-1.680403, 1.000489, -3.695057, 1, 0.3647059, 0, 1,
-1.679727, -0.5498242, -0.1370958, 1, 0.372549, 0, 1,
-1.678569, 0.2264956, -0.8109763, 1, 0.3764706, 0, 1,
-1.651923, 0.7633389, -2.058256, 1, 0.3843137, 0, 1,
-1.628763, -0.3178378, -1.687246, 1, 0.3882353, 0, 1,
-1.609743, -1.271634, -2.485338, 1, 0.3960784, 0, 1,
-1.556957, 0.7171005, -0.8693678, 1, 0.4039216, 0, 1,
-1.556292, 1.622135, -1.045295, 1, 0.4078431, 0, 1,
-1.535804, -2.036808, -2.402342, 1, 0.4156863, 0, 1,
-1.520303, 1.121443, -2.667357, 1, 0.4196078, 0, 1,
-1.517426, -0.8431478, -3.037572, 1, 0.427451, 0, 1,
-1.516075, 0.3711345, -1.124501, 1, 0.4313726, 0, 1,
-1.504978, 2.258242, -0.9227113, 1, 0.4392157, 0, 1,
-1.500227, 0.544866, -3.633396, 1, 0.4431373, 0, 1,
-1.499927, -2.403236, -2.905385, 1, 0.4509804, 0, 1,
-1.499926, 0.8085784, -1.58909, 1, 0.454902, 0, 1,
-1.489941, 1.357523, -1.50438, 1, 0.4627451, 0, 1,
-1.484956, -0.2176351, -1.860229, 1, 0.4666667, 0, 1,
-1.477112, -1.132829, -3.829024, 1, 0.4745098, 0, 1,
-1.470374, 1.787778, -2.437226, 1, 0.4784314, 0, 1,
-1.438685, 1.201016, -2.565663, 1, 0.4862745, 0, 1,
-1.438059, -1.281269, -0.4002962, 1, 0.4901961, 0, 1,
-1.435711, -0.8245869, -1.204116, 1, 0.4980392, 0, 1,
-1.435543, -1.206527, -4.989696, 1, 0.5058824, 0, 1,
-1.433904, -0.1599485, -2.722528, 1, 0.509804, 0, 1,
-1.431803, -0.972576, -1.371727, 1, 0.5176471, 0, 1,
-1.422325, 0.4273082, 0.04980876, 1, 0.5215687, 0, 1,
-1.414816, 0.8953118, -1.696022, 1, 0.5294118, 0, 1,
-1.411965, -1.589164, -3.867321, 1, 0.5333334, 0, 1,
-1.397444, -0.7480028, -1.664457, 1, 0.5411765, 0, 1,
-1.396058, 0.285542, -1.876841, 1, 0.5450981, 0, 1,
-1.382809, -0.1709424, -0.4036138, 1, 0.5529412, 0, 1,
-1.364633, -0.6890731, -1.901636, 1, 0.5568628, 0, 1,
-1.363813, -1.191694, -1.947447, 1, 0.5647059, 0, 1,
-1.357574, 1.801865, -1.811828, 1, 0.5686275, 0, 1,
-1.35678, 0.06663482, -0.7235987, 1, 0.5764706, 0, 1,
-1.342041, -0.4655522, -1.616678, 1, 0.5803922, 0, 1,
-1.340442, -0.4975848, -1.423518, 1, 0.5882353, 0, 1,
-1.338037, -0.6392093, -0.4931063, 1, 0.5921569, 0, 1,
-1.326504, -0.6558492, -2.216123, 1, 0.6, 0, 1,
-1.325378, 0.5950553, -1.748405, 1, 0.6078432, 0, 1,
-1.323368, 0.7459359, -0.2342941, 1, 0.6117647, 0, 1,
-1.308529, -0.7946787, -2.954125, 1, 0.6196079, 0, 1,
-1.304438, -0.3531124, -0.6279893, 1, 0.6235294, 0, 1,
-1.299643, 0.5954223, -2.163918, 1, 0.6313726, 0, 1,
-1.296752, 0.318554, -1.848064, 1, 0.6352941, 0, 1,
-1.290251, 0.532375, -1.720255, 1, 0.6431373, 0, 1,
-1.288613, 1.259802, -0.3200757, 1, 0.6470588, 0, 1,
-1.286937, -0.5829502, -1.447021, 1, 0.654902, 0, 1,
-1.280537, -0.7933615, -2.939957, 1, 0.6588235, 0, 1,
-1.277578, 0.02677557, -2.390446, 1, 0.6666667, 0, 1,
-1.270698, -2.217189, -2.790964, 1, 0.6705883, 0, 1,
-1.268332, -1.51131, -3.296032, 1, 0.6784314, 0, 1,
-1.268308, -0.4786665, -2.375283, 1, 0.682353, 0, 1,
-1.266884, 1.740844, 0.8083414, 1, 0.6901961, 0, 1,
-1.24918, 0.9605759, -0.9319677, 1, 0.6941177, 0, 1,
-1.247531, 1.488585, -1.459405, 1, 0.7019608, 0, 1,
-1.246156, 0.2961267, -0.2230087, 1, 0.7098039, 0, 1,
-1.245987, 0.6991813, -1.42563, 1, 0.7137255, 0, 1,
-1.245063, 0.4906697, -1.368904, 1, 0.7215686, 0, 1,
-1.227209, 0.4290658, -1.188673, 1, 0.7254902, 0, 1,
-1.225552, -0.6239949, 0.4238649, 1, 0.7333333, 0, 1,
-1.222499, -0.8325497, -1.490161, 1, 0.7372549, 0, 1,
-1.217764, 0.2513983, 0.2185365, 1, 0.7450981, 0, 1,
-1.216259, -0.7819509, -2.031251, 1, 0.7490196, 0, 1,
-1.212443, -0.2476984, -2.010806, 1, 0.7568628, 0, 1,
-1.197097, -0.01421218, -1.906668, 1, 0.7607843, 0, 1,
-1.191168, 0.2196871, -1.747752, 1, 0.7686275, 0, 1,
-1.185048, 0.1151915, -1.853076, 1, 0.772549, 0, 1,
-1.180591, -0.7607929, -1.819641, 1, 0.7803922, 0, 1,
-1.180115, -0.7272534, -1.437876, 1, 0.7843137, 0, 1,
-1.177814, 0.2768355, -3.804039, 1, 0.7921569, 0, 1,
-1.176188, -0.4060498, -2.220977, 1, 0.7960784, 0, 1,
-1.173002, 2.074266, -0.7174001, 1, 0.8039216, 0, 1,
-1.168728, 0.3446127, -1.646786, 1, 0.8117647, 0, 1,
-1.16603, 0.08398691, -1.479644, 1, 0.8156863, 0, 1,
-1.162211, 0.6367236, -1.249289, 1, 0.8235294, 0, 1,
-1.149711, 0.2282115, -1.825534, 1, 0.827451, 0, 1,
-1.148424, -1.72639, -4.568745, 1, 0.8352941, 0, 1,
-1.134379, -0.9256136, -1.951245, 1, 0.8392157, 0, 1,
-1.13214, -0.6892474, -1.279066, 1, 0.8470588, 0, 1,
-1.117058, -0.4573596, -2.385164, 1, 0.8509804, 0, 1,
-1.102209, -0.5309311, -1.67275, 1, 0.8588235, 0, 1,
-1.100382, -1.627182, -1.191649, 1, 0.8627451, 0, 1,
-1.095015, 1.285944, 0.2918462, 1, 0.8705882, 0, 1,
-1.094172, -1.204495, -0.214583, 1, 0.8745098, 0, 1,
-1.090608, -1.452468, -2.231462, 1, 0.8823529, 0, 1,
-1.086107, 0.7526016, -1.693562, 1, 0.8862745, 0, 1,
-1.081279, -2.459878, -0.4598536, 1, 0.8941177, 0, 1,
-1.077896, -0.8775731, -4.256456, 1, 0.8980392, 0, 1,
-1.075448, 2.48648, 0.0335887, 1, 0.9058824, 0, 1,
-1.073456, 0.769447, -2.24194, 1, 0.9137255, 0, 1,
-1.065162, 0.05306003, -1.727703, 1, 0.9176471, 0, 1,
-1.054581, -0.1544388, -3.188221, 1, 0.9254902, 0, 1,
-1.050633, 0.03193046, -1.601181, 1, 0.9294118, 0, 1,
-1.041124, 0.5630766, -0.9443349, 1, 0.9372549, 0, 1,
-1.03696, -0.5913717, -0.9004034, 1, 0.9411765, 0, 1,
-1.025733, -1.955507, -1.695747, 1, 0.9490196, 0, 1,
-1.010153, 0.03347375, -2.063469, 1, 0.9529412, 0, 1,
-0.9995568, -1.137871, -2.561189, 1, 0.9607843, 0, 1,
-0.999227, -0.04623374, -0.4755087, 1, 0.9647059, 0, 1,
-0.9931313, -0.4031385, -2.618539, 1, 0.972549, 0, 1,
-0.9837341, -0.3937789, -1.651168, 1, 0.9764706, 0, 1,
-0.9829645, -2.098259, -3.782047, 1, 0.9843137, 0, 1,
-0.9797007, -1.426256, -1.78447, 1, 0.9882353, 0, 1,
-0.9775675, 0.08410015, 0.004639978, 1, 0.9960784, 0, 1,
-0.9732357, -0.3822986, -1.63255, 0.9960784, 1, 0, 1,
-0.9685694, -1.178823, -2.457621, 0.9921569, 1, 0, 1,
-0.9673238, 0.3540637, -0.08212715, 0.9843137, 1, 0, 1,
-0.9659025, -0.9640119, -2.626263, 0.9803922, 1, 0, 1,
-0.9647097, 2.355941, 0.1739446, 0.972549, 1, 0, 1,
-0.9599934, 0.3721813, -0.9186562, 0.9686275, 1, 0, 1,
-0.9572111, -0.3401839, -2.181087, 0.9607843, 1, 0, 1,
-0.9533448, -1.033021, -2.219277, 0.9568627, 1, 0, 1,
-0.9530311, 0.6951374, -1.071501, 0.9490196, 1, 0, 1,
-0.9482808, -0.8544524, -2.60924, 0.945098, 1, 0, 1,
-0.9444807, -0.04872669, -1.665657, 0.9372549, 1, 0, 1,
-0.9434798, -0.03298672, -1.417856, 0.9333333, 1, 0, 1,
-0.9389558, 0.5897334, -0.1165892, 0.9254902, 1, 0, 1,
-0.9342871, -0.3727087, -2.658711, 0.9215686, 1, 0, 1,
-0.9332363, 2.610711, -0.1509484, 0.9137255, 1, 0, 1,
-0.9259246, -0.3983326, 0.204429, 0.9098039, 1, 0, 1,
-0.9239492, 1.409601, -1.034419, 0.9019608, 1, 0, 1,
-0.9216473, 0.06285573, -2.700751, 0.8941177, 1, 0, 1,
-0.9165738, -0.4515173, -3.011867, 0.8901961, 1, 0, 1,
-0.9014442, -1.145015, -1.33518, 0.8823529, 1, 0, 1,
-0.9011962, 0.2754729, -2.561903, 0.8784314, 1, 0, 1,
-0.9010137, -2.235886, -2.466255, 0.8705882, 1, 0, 1,
-0.9000167, 0.3729088, -1.662006, 0.8666667, 1, 0, 1,
-0.8954051, -1.331488, -2.61985, 0.8588235, 1, 0, 1,
-0.8905653, 1.430891, -0.6614571, 0.854902, 1, 0, 1,
-0.8819981, 0.8672926, -1.814506, 0.8470588, 1, 0, 1,
-0.8757796, 0.1668283, -0.861204, 0.8431373, 1, 0, 1,
-0.872423, -0.8176951, -1.743566, 0.8352941, 1, 0, 1,
-0.8691714, 0.638298, -1.194692, 0.8313726, 1, 0, 1,
-0.8592834, -1.005286, -1.010372, 0.8235294, 1, 0, 1,
-0.8567907, 0.1752237, 0.3456672, 0.8196079, 1, 0, 1,
-0.8545755, -1.873172, -3.6046, 0.8117647, 1, 0, 1,
-0.8528157, 2.192108, -0.9796818, 0.8078431, 1, 0, 1,
-0.8520094, 0.7251747, -1.114276, 0.8, 1, 0, 1,
-0.8515054, -0.3427411, -2.710352, 0.7921569, 1, 0, 1,
-0.8482119, -1.396574, -1.950587, 0.7882353, 1, 0, 1,
-0.8474249, 0.6271971, 1.279844, 0.7803922, 1, 0, 1,
-0.8453083, -0.7479963, -3.33633, 0.7764706, 1, 0, 1,
-0.8431168, 0.7197445, -1.645664, 0.7686275, 1, 0, 1,
-0.8394139, -1.728952, -2.269978, 0.7647059, 1, 0, 1,
-0.8335755, -0.849376, -1.415126, 0.7568628, 1, 0, 1,
-0.8308432, -2.324646, -2.483739, 0.7529412, 1, 0, 1,
-0.8231966, 1.567385, -0.9115634, 0.7450981, 1, 0, 1,
-0.8227678, 0.08394936, -1.577006, 0.7411765, 1, 0, 1,
-0.8199949, -0.0686779, -2.027259, 0.7333333, 1, 0, 1,
-0.818683, -0.6494533, -0.6406145, 0.7294118, 1, 0, 1,
-0.817964, 0.626289, 0.4878392, 0.7215686, 1, 0, 1,
-0.8145062, 0.639934, -1.769919, 0.7176471, 1, 0, 1,
-0.8098537, 1.87615, 0.4245515, 0.7098039, 1, 0, 1,
-0.8090202, -0.445139, -1.744761, 0.7058824, 1, 0, 1,
-0.8048319, -1.154528, -5.354823, 0.6980392, 1, 0, 1,
-0.8046591, 0.5908595, -0.6037249, 0.6901961, 1, 0, 1,
-0.8042173, -0.7727392, -2.084391, 0.6862745, 1, 0, 1,
-0.8036464, -0.1338031, -1.217545, 0.6784314, 1, 0, 1,
-0.7999297, -0.674339, -0.772483, 0.6745098, 1, 0, 1,
-0.7997366, -1.622939, -4.032428, 0.6666667, 1, 0, 1,
-0.7969028, -0.7802721, -2.598987, 0.6627451, 1, 0, 1,
-0.7955655, 0.008757034, -2.200053, 0.654902, 1, 0, 1,
-0.7843295, 1.020724, -0.04482438, 0.6509804, 1, 0, 1,
-0.7832205, 0.7801012, -1.172652, 0.6431373, 1, 0, 1,
-0.780144, -0.3212745, -1.385934, 0.6392157, 1, 0, 1,
-0.7772666, -0.6004587, -2.563894, 0.6313726, 1, 0, 1,
-0.7766676, 1.078232, -1.900878, 0.627451, 1, 0, 1,
-0.7579342, -0.07992122, -1.645197, 0.6196079, 1, 0, 1,
-0.752764, -0.9994055, -2.272186, 0.6156863, 1, 0, 1,
-0.7425369, -0.5293291, -2.138574, 0.6078432, 1, 0, 1,
-0.7384356, -1.944149, -2.613492, 0.6039216, 1, 0, 1,
-0.7365289, 0.8459967, -0.5247663, 0.5960785, 1, 0, 1,
-0.7352611, -0.8838993, -2.61929, 0.5882353, 1, 0, 1,
-0.7307148, -0.5327862, -2.729094, 0.5843138, 1, 0, 1,
-0.7244087, 0.6184383, -1.533005, 0.5764706, 1, 0, 1,
-0.7238652, 0.8042352, -0.2725084, 0.572549, 1, 0, 1,
-0.7224244, 0.3338678, -2.389847, 0.5647059, 1, 0, 1,
-0.717521, 0.5281304, -1.789357, 0.5607843, 1, 0, 1,
-0.717126, 0.7131019, -3.932911, 0.5529412, 1, 0, 1,
-0.714217, 0.3459122, -2.378788, 0.5490196, 1, 0, 1,
-0.7127607, -0.4229551, -2.206045, 0.5411765, 1, 0, 1,
-0.7091379, 0.9915773, -0.0120527, 0.5372549, 1, 0, 1,
-0.7054273, 0.5149638, -2.91263, 0.5294118, 1, 0, 1,
-0.7049183, 0.1783575, -1.098992, 0.5254902, 1, 0, 1,
-0.7040457, -1.071148, -3.293082, 0.5176471, 1, 0, 1,
-0.7010291, -1.469184, -2.189328, 0.5137255, 1, 0, 1,
-0.6995398, -0.5494899, -3.653201, 0.5058824, 1, 0, 1,
-0.6968956, 2.162532, 0.6567502, 0.5019608, 1, 0, 1,
-0.6953365, -0.9448269, -2.352957, 0.4941176, 1, 0, 1,
-0.6897742, 0.7881956, -0.2421486, 0.4862745, 1, 0, 1,
-0.6891449, 1.328666, 0.9467904, 0.4823529, 1, 0, 1,
-0.6869913, -1.242756, -2.297089, 0.4745098, 1, 0, 1,
-0.6785149, 0.7519162, -1.208662, 0.4705882, 1, 0, 1,
-0.6761602, 0.2352715, -1.706392, 0.4627451, 1, 0, 1,
-0.672314, -1.354413, -0.5813849, 0.4588235, 1, 0, 1,
-0.6625789, -1.236838, -2.748291, 0.4509804, 1, 0, 1,
-0.6610593, 0.5514758, -1.113948, 0.4470588, 1, 0, 1,
-0.6561741, 0.1646049, -1.049667, 0.4392157, 1, 0, 1,
-0.6523415, 1.029708, 0.3568133, 0.4352941, 1, 0, 1,
-0.6506954, -0.5147964, -0.1885549, 0.427451, 1, 0, 1,
-0.6478428, 0.1696647, -1.160611, 0.4235294, 1, 0, 1,
-0.646686, -1.131296, -0.07596657, 0.4156863, 1, 0, 1,
-0.6464774, -1.079448, -0.7670487, 0.4117647, 1, 0, 1,
-0.6456045, 1.764499, 0.1569168, 0.4039216, 1, 0, 1,
-0.6439697, -0.146056, -1.029239, 0.3960784, 1, 0, 1,
-0.6401213, 0.9185717, 0.2484297, 0.3921569, 1, 0, 1,
-0.6236577, -1.336505, -2.321503, 0.3843137, 1, 0, 1,
-0.6188684, -1.572225, -1.713275, 0.3803922, 1, 0, 1,
-0.6112011, -0.6476763, -2.520199, 0.372549, 1, 0, 1,
-0.6087734, -2.530094, -1.20193, 0.3686275, 1, 0, 1,
-0.608536, 0.6901606, -0.2391346, 0.3607843, 1, 0, 1,
-0.5987099, -0.3445617, -1.824124, 0.3568628, 1, 0, 1,
-0.5973649, -1.277817, -3.075171, 0.3490196, 1, 0, 1,
-0.5910935, 0.3451014, -2.264183, 0.345098, 1, 0, 1,
-0.5795712, 0.6460187, -1.20006, 0.3372549, 1, 0, 1,
-0.578589, -1.052288, -1.055244, 0.3333333, 1, 0, 1,
-0.5708083, -0.4000734, -2.440468, 0.3254902, 1, 0, 1,
-0.569649, 0.9243156, -0.7662561, 0.3215686, 1, 0, 1,
-0.5649768, -1.489309, -2.758341, 0.3137255, 1, 0, 1,
-0.5555664, -0.389435, -0.5652805, 0.3098039, 1, 0, 1,
-0.5533129, -0.8143932, -3.651983, 0.3019608, 1, 0, 1,
-0.551756, -0.3214807, -1.309251, 0.2941177, 1, 0, 1,
-0.5472519, 0.9701295, 0.1435762, 0.2901961, 1, 0, 1,
-0.5431472, 1.184934, 0.3107832, 0.282353, 1, 0, 1,
-0.5392863, 0.8142623, -0.8349738, 0.2784314, 1, 0, 1,
-0.539158, -0.5321234, -1.31458, 0.2705882, 1, 0, 1,
-0.5389667, -0.1797475, -1.887164, 0.2666667, 1, 0, 1,
-0.5374632, -1.056772, -2.557769, 0.2588235, 1, 0, 1,
-0.5366482, 1.098733, -1.888255, 0.254902, 1, 0, 1,
-0.5358499, -0.4707602, -4.685978, 0.2470588, 1, 0, 1,
-0.5230327, -0.7220936, -1.623788, 0.2431373, 1, 0, 1,
-0.5220907, -1.25077, -4.447576, 0.2352941, 1, 0, 1,
-0.5174842, -0.5104407, -2.754869, 0.2313726, 1, 0, 1,
-0.5155548, 0.02056652, -1.471735, 0.2235294, 1, 0, 1,
-0.513058, -0.8291721, -2.348644, 0.2196078, 1, 0, 1,
-0.5113466, 1.992517, -0.2657279, 0.2117647, 1, 0, 1,
-0.5102786, 1.065972, -2.563857, 0.2078431, 1, 0, 1,
-0.504521, 1.087048, -1.747434, 0.2, 1, 0, 1,
-0.5033584, -0.6124169, -2.397902, 0.1921569, 1, 0, 1,
-0.4994734, -0.7115629, -1.336996, 0.1882353, 1, 0, 1,
-0.4970527, 0.2981865, -1.735905, 0.1803922, 1, 0, 1,
-0.4938415, 0.4741927, -1.213594, 0.1764706, 1, 0, 1,
-0.4910852, -1.085056, -1.974968, 0.1686275, 1, 0, 1,
-0.4892868, 0.6967786, -1.918091, 0.1647059, 1, 0, 1,
-0.4851084, 0.7183337, 0.3894429, 0.1568628, 1, 0, 1,
-0.4779194, -0.03347373, -2.328473, 0.1529412, 1, 0, 1,
-0.4757222, 0.1862622, -0.3258609, 0.145098, 1, 0, 1,
-0.4745663, -0.003594081, 0.7313327, 0.1411765, 1, 0, 1,
-0.4727785, 0.5849296, 0.1436646, 0.1333333, 1, 0, 1,
-0.472354, 1.411876, -0.4570222, 0.1294118, 1, 0, 1,
-0.4720301, -0.6338972, -2.475676, 0.1215686, 1, 0, 1,
-0.4701489, -0.8500943, -1.473828, 0.1176471, 1, 0, 1,
-0.4692503, 0.9700356, 0.01946685, 0.1098039, 1, 0, 1,
-0.4684865, 0.3498442, -0.9540548, 0.1058824, 1, 0, 1,
-0.4681503, 0.7487007, -0.1894182, 0.09803922, 1, 0, 1,
-0.4680105, 0.2261546, -1.19445, 0.09019608, 1, 0, 1,
-0.4604586, -0.05426606, -2.687835, 0.08627451, 1, 0, 1,
-0.4536341, 0.3269687, -0.2551589, 0.07843138, 1, 0, 1,
-0.4493215, -0.4658097, -2.385849, 0.07450981, 1, 0, 1,
-0.447797, 1.373321, -0.8084378, 0.06666667, 1, 0, 1,
-0.4467021, 0.5870611, -1.396409, 0.0627451, 1, 0, 1,
-0.4451876, -0.3275166, -1.412837, 0.05490196, 1, 0, 1,
-0.4439808, -0.7064093, -2.099643, 0.05098039, 1, 0, 1,
-0.442424, -1.469792, -1.414919, 0.04313726, 1, 0, 1,
-0.4267999, -0.8154089, -2.416889, 0.03921569, 1, 0, 1,
-0.4254451, 0.02339696, -0.8009248, 0.03137255, 1, 0, 1,
-0.4244719, 0.566999, 0.1774537, 0.02745098, 1, 0, 1,
-0.4210683, -0.1250852, -2.572595, 0.01960784, 1, 0, 1,
-0.4193181, -0.6506258, -2.044091, 0.01568628, 1, 0, 1,
-0.4192599, -1.502735, -0.8860274, 0.007843138, 1, 0, 1,
-0.4142434, -2.306175, -4.879376, 0.003921569, 1, 0, 1,
-0.4126321, 0.334828, 0.1917953, 0, 1, 0.003921569, 1,
-0.4091956, 0.1352911, -2.210761, 0, 1, 0.01176471, 1,
-0.4060259, -0.2624317, -4.279903, 0, 1, 0.01568628, 1,
-0.4024923, -0.7846091, -2.414957, 0, 1, 0.02352941, 1,
-0.4019762, 0.06273109, -0.6579421, 0, 1, 0.02745098, 1,
-0.4014785, -0.6412019, -2.423782, 0, 1, 0.03529412, 1,
-0.4013866, -0.06509599, -2.550538, 0, 1, 0.03921569, 1,
-0.3959475, 0.4843502, -0.8521736, 0, 1, 0.04705882, 1,
-0.3950966, -0.8045583, -2.762133, 0, 1, 0.05098039, 1,
-0.3930829, -0.08872769, -2.127281, 0, 1, 0.05882353, 1,
-0.390016, 0.1605977, -2.161807, 0, 1, 0.0627451, 1,
-0.3891617, 0.5945713, 0.4817718, 0, 1, 0.07058824, 1,
-0.3861279, 0.1577215, -1.87108, 0, 1, 0.07450981, 1,
-0.385907, -0.6636001, -1.973241, 0, 1, 0.08235294, 1,
-0.381292, 0.3165624, 0.02382188, 0, 1, 0.08627451, 1,
-0.3775019, -1.233203, -2.097862, 0, 1, 0.09411765, 1,
-0.3764296, 1.087036, -0.6847664, 0, 1, 0.1019608, 1,
-0.3736075, 0.904359, 1.539774, 0, 1, 0.1058824, 1,
-0.3724146, -0.08183755, -3.19557, 0, 1, 0.1137255, 1,
-0.3712077, 1.236541, 1.240751, 0, 1, 0.1176471, 1,
-0.3709838, 0.4998547, 0.1595806, 0, 1, 0.1254902, 1,
-0.3705921, -0.2430655, -0.3801032, 0, 1, 0.1294118, 1,
-0.3632009, 0.1923199, -0.8076261, 0, 1, 0.1372549, 1,
-0.3619674, 1.160547, 0.6506197, 0, 1, 0.1411765, 1,
-0.360079, 0.2675602, -1.563376, 0, 1, 0.1490196, 1,
-0.3538651, -0.3876168, -3.105383, 0, 1, 0.1529412, 1,
-0.3492508, 0.8900443, -1.528547, 0, 1, 0.1607843, 1,
-0.3484063, 0.2037141, 0.4543678, 0, 1, 0.1647059, 1,
-0.3482884, -0.805126, -3.909575, 0, 1, 0.172549, 1,
-0.3456595, 0.7549485, -0.8829134, 0, 1, 0.1764706, 1,
-0.3424479, -0.7411365, -3.219764, 0, 1, 0.1843137, 1,
-0.3409162, 2.176346, -1.491125, 0, 1, 0.1882353, 1,
-0.3394371, 0.4553577, 0.2349303, 0, 1, 0.1960784, 1,
-0.3390326, 0.309172, -1.572322, 0, 1, 0.2039216, 1,
-0.3346141, -0.0660323, -2.180219, 0, 1, 0.2078431, 1,
-0.3342807, 1.248626, 0.3578953, 0, 1, 0.2156863, 1,
-0.3270776, 0.9381899, 0.2172104, 0, 1, 0.2196078, 1,
-0.3262448, 0.1580864, -0.5843174, 0, 1, 0.227451, 1,
-0.3261406, -0.02395303, -0.8603445, 0, 1, 0.2313726, 1,
-0.3182928, -1.512725, -1.684256, 0, 1, 0.2392157, 1,
-0.3167164, 1.989244, 0.008092456, 0, 1, 0.2431373, 1,
-0.3159452, 0.7026424, -1.025711, 0, 1, 0.2509804, 1,
-0.3152638, -0.5727454, -3.016506, 0, 1, 0.254902, 1,
-0.3142439, -1.771783, -1.995841, 0, 1, 0.2627451, 1,
-0.3127407, 0.05571558, -1.725344, 0, 1, 0.2666667, 1,
-0.3109133, -0.4500576, -2.689821, 0, 1, 0.2745098, 1,
-0.3078474, 0.9453802, 0.2731744, 0, 1, 0.2784314, 1,
-0.3064091, 0.06953488, -1.337009, 0, 1, 0.2862745, 1,
-0.3041356, 3.018277, 0.6457804, 0, 1, 0.2901961, 1,
-0.3020497, 0.3341058, -2.480239, 0, 1, 0.2980392, 1,
-0.2980953, 0.04170924, -1.295599, 0, 1, 0.3058824, 1,
-0.2948903, 0.555959, 0.8984295, 0, 1, 0.3098039, 1,
-0.2943084, -0.3046187, -1.582972, 0, 1, 0.3176471, 1,
-0.2921475, 0.04792217, -2.486452, 0, 1, 0.3215686, 1,
-0.2884843, -1.816285, -1.465961, 0, 1, 0.3294118, 1,
-0.2882134, 0.589237, -2.049129, 0, 1, 0.3333333, 1,
-0.287787, 0.1782538, -2.273713, 0, 1, 0.3411765, 1,
-0.2866975, -0.3596478, -3.674968, 0, 1, 0.345098, 1,
-0.2864147, 1.012224, -0.03020111, 0, 1, 0.3529412, 1,
-0.2843285, -0.2738883, -4.214096, 0, 1, 0.3568628, 1,
-0.2840575, -0.2231409, -3.025456, 0, 1, 0.3647059, 1,
-0.2777779, 1.501041, -0.6980848, 0, 1, 0.3686275, 1,
-0.2687929, 0.5294407, -1.099648, 0, 1, 0.3764706, 1,
-0.2687914, -1.484243, -2.508252, 0, 1, 0.3803922, 1,
-0.2685473, 0.5710661, -0.7399967, 0, 1, 0.3882353, 1,
-0.2682027, -0.326232, -2.595726, 0, 1, 0.3921569, 1,
-0.2657875, 0.953889, 1.749215, 0, 1, 0.4, 1,
-0.2641706, 1.419273, -2.054241, 0, 1, 0.4078431, 1,
-0.2638954, 1.031362, -0.1342964, 0, 1, 0.4117647, 1,
-0.2636017, -0.6167895, -3.431423, 0, 1, 0.4196078, 1,
-0.2633229, 1.742565, -0.9131994, 0, 1, 0.4235294, 1,
-0.2608646, -0.148075, -1.020916, 0, 1, 0.4313726, 1,
-0.2576285, 0.1818556, -1.744899, 0, 1, 0.4352941, 1,
-0.2564958, 0.8848557, -0.9148213, 0, 1, 0.4431373, 1,
-0.2560278, -1.626988, -2.819076, 0, 1, 0.4470588, 1,
-0.2419586, -0.1728678, -3.31917, 0, 1, 0.454902, 1,
-0.2358315, 0.9837143, -0.4125881, 0, 1, 0.4588235, 1,
-0.2339042, -0.2324482, -4.122114, 0, 1, 0.4666667, 1,
-0.2297803, 2.543874, -0.7026855, 0, 1, 0.4705882, 1,
-0.2291746, 1.610545, 0.1488037, 0, 1, 0.4784314, 1,
-0.229135, -1.017906, -4.271981, 0, 1, 0.4823529, 1,
-0.2250066, 0.3539808, 0.4800211, 0, 1, 0.4901961, 1,
-0.223348, -0.4412247, -2.690666, 0, 1, 0.4941176, 1,
-0.2156991, -0.3090492, -2.624483, 0, 1, 0.5019608, 1,
-0.2118697, -0.05771004, -1.160717, 0, 1, 0.509804, 1,
-0.2097876, 0.4799522, -0.3696333, 0, 1, 0.5137255, 1,
-0.2087128, 0.3718033, 1.384532, 0, 1, 0.5215687, 1,
-0.2065202, -0.1638065, -1.545545, 0, 1, 0.5254902, 1,
-0.2024952, -0.4767742, -4.058294, 0, 1, 0.5333334, 1,
-0.2006766, 0.6168354, -0.06711457, 0, 1, 0.5372549, 1,
-0.1992137, 1.436554, -1.602695, 0, 1, 0.5450981, 1,
-0.1986947, 0.6426785, 0.7913576, 0, 1, 0.5490196, 1,
-0.1975356, 1.101021, 0.1724301, 0, 1, 0.5568628, 1,
-0.1963365, 0.264194, 0.4063139, 0, 1, 0.5607843, 1,
-0.1962108, 0.544454, -0.3065853, 0, 1, 0.5686275, 1,
-0.1945081, 1.157057, -1.630957, 0, 1, 0.572549, 1,
-0.1937685, 0.434211, 0.1563512, 0, 1, 0.5803922, 1,
-0.1936467, -0.2200561, -2.959526, 0, 1, 0.5843138, 1,
-0.1927753, 0.3858873, -0.8809425, 0, 1, 0.5921569, 1,
-0.1920083, 1.170812, -1.121104, 0, 1, 0.5960785, 1,
-0.1885885, -0.1174465, -3.794821, 0, 1, 0.6039216, 1,
-0.1830757, -0.1877932, -2.242383, 0, 1, 0.6117647, 1,
-0.1823063, 0.4519223, -0.483578, 0, 1, 0.6156863, 1,
-0.1771516, -0.2982329, -3.283037, 0, 1, 0.6235294, 1,
-0.1738133, -0.4361227, -1.818488, 0, 1, 0.627451, 1,
-0.1730269, -1.010441, -1.302415, 0, 1, 0.6352941, 1,
-0.1696214, 0.5377039, 0.3183565, 0, 1, 0.6392157, 1,
-0.1689305, -1.625635, -3.307705, 0, 1, 0.6470588, 1,
-0.1623071, -0.9525739, -2.158147, 0, 1, 0.6509804, 1,
-0.1622349, -0.8595983, -1.669802, 0, 1, 0.6588235, 1,
-0.1597483, 0.1636122, -1.33279, 0, 1, 0.6627451, 1,
-0.1582406, -2.104229, -3.570013, 0, 1, 0.6705883, 1,
-0.1573666, 1.716892, 0.02767758, 0, 1, 0.6745098, 1,
-0.1557333, -0.8709004, -2.6187, 0, 1, 0.682353, 1,
-0.1526567, 0.6255197, -0.372607, 0, 1, 0.6862745, 1,
-0.1526171, -1.703573, -3.463329, 0, 1, 0.6941177, 1,
-0.1523347, -1.360393, -2.630037, 0, 1, 0.7019608, 1,
-0.1459462, -2.054686, -2.297299, 0, 1, 0.7058824, 1,
-0.1455429, -0.2126323, -2.598716, 0, 1, 0.7137255, 1,
-0.1431964, -0.9565367, -2.792992, 0, 1, 0.7176471, 1,
-0.1413699, -0.8709404, -0.6781657, 0, 1, 0.7254902, 1,
-0.1387241, 0.6549708, -1.02374, 0, 1, 0.7294118, 1,
-0.1345538, 1.060885, -0.5087982, 0, 1, 0.7372549, 1,
-0.1318822, -0.5417013, -2.478635, 0, 1, 0.7411765, 1,
-0.1317572, 0.2119934, -0.5123803, 0, 1, 0.7490196, 1,
-0.129763, 0.07283478, -1.06576, 0, 1, 0.7529412, 1,
-0.1293265, 0.3035199, 0.5185856, 0, 1, 0.7607843, 1,
-0.1268515, 0.5190971, -0.2934698, 0, 1, 0.7647059, 1,
-0.1218533, -1.281524, -1.62792, 0, 1, 0.772549, 1,
-0.1210077, -0.07243488, -2.518692, 0, 1, 0.7764706, 1,
-0.1185555, 2.190238, -0.455196, 0, 1, 0.7843137, 1,
-0.1181128, 0.3134382, -1.020782, 0, 1, 0.7882353, 1,
-0.1150435, 0.2490501, 0.05737228, 0, 1, 0.7960784, 1,
-0.1141794, -1.08122, -0.8315602, 0, 1, 0.8039216, 1,
-0.09896441, -2.141712, -3.365364, 0, 1, 0.8078431, 1,
-0.09235363, -1.003118, -2.95517, 0, 1, 0.8156863, 1,
-0.09230687, 0.2102909, -0.2476829, 0, 1, 0.8196079, 1,
-0.08931121, 1.000516, -1.73007, 0, 1, 0.827451, 1,
-0.07879873, 0.2500889, 1.103117, 0, 1, 0.8313726, 1,
-0.07786577, -0.9344667, -2.057969, 0, 1, 0.8392157, 1,
-0.0777824, 1.024358, -0.1587267, 0, 1, 0.8431373, 1,
-0.07684939, 0.08326974, -1.30985, 0, 1, 0.8509804, 1,
-0.06945419, -0.595663, -1.80295, 0, 1, 0.854902, 1,
-0.06397433, 1.070831, -2.225828, 0, 1, 0.8627451, 1,
-0.0615727, 0.02666779, 1.138552, 0, 1, 0.8666667, 1,
-0.05681238, -0.3115409, -3.47822, 0, 1, 0.8745098, 1,
-0.05020131, -0.728106, -1.691414, 0, 1, 0.8784314, 1,
-0.0404432, -1.70461, -2.502873, 0, 1, 0.8862745, 1,
-0.03830153, -1.14371, -2.138075, 0, 1, 0.8901961, 1,
-0.03817288, 1.063352, -1.926815, 0, 1, 0.8980392, 1,
-0.03713112, 1.508733, -1.003523, 0, 1, 0.9058824, 1,
-0.03610738, -0.9169648, -3.850143, 0, 1, 0.9098039, 1,
-0.03411555, 0.9239238, 0.02995983, 0, 1, 0.9176471, 1,
-0.02648549, -1.053503, -5.474487, 0, 1, 0.9215686, 1,
-0.02440137, -0.2420784, -4.060309, 0, 1, 0.9294118, 1,
-0.0147249, 0.3282745, -0.1635779, 0, 1, 0.9333333, 1,
-0.01318021, -1.073084, -2.938468, 0, 1, 0.9411765, 1,
-0.01163407, 0.06519721, -0.8234778, 0, 1, 0.945098, 1,
-0.006161838, 0.1442872, -0.2637157, 0, 1, 0.9529412, 1,
-0.0009470008, -3.805643, -2.433926, 0, 1, 0.9568627, 1,
0.001106783, 1.847128, -1.29899, 0, 1, 0.9647059, 1,
0.002241967, 0.523317, -0.2196506, 0, 1, 0.9686275, 1,
0.002401897, -0.04586902, 0.967652, 0, 1, 0.9764706, 1,
0.004025132, -1.791364, 3.68468, 0, 1, 0.9803922, 1,
0.007482933, -1.148936, 1.107248, 0, 1, 0.9882353, 1,
0.008299734, 1.496011, 0.7193965, 0, 1, 0.9921569, 1,
0.008303272, -0.873767, 4.695565, 0, 1, 1, 1,
0.009711153, -0.01158681, 2.478938, 0, 0.9921569, 1, 1,
0.01154075, 1.444957, 1.211951, 0, 0.9882353, 1, 1,
0.01155205, 0.1491004, -2.317389, 0, 0.9803922, 1, 1,
0.01403552, 1.874625, -0.5723345, 0, 0.9764706, 1, 1,
0.01667423, 1.094269, -0.1272521, 0, 0.9686275, 1, 1,
0.02087019, -0.8562668, 4.232582, 0, 0.9647059, 1, 1,
0.02098475, -0.7167808, 3.70852, 0, 0.9568627, 1, 1,
0.02107409, -2.16295, 1.682075, 0, 0.9529412, 1, 1,
0.023723, 0.5489315, -1.117253, 0, 0.945098, 1, 1,
0.02602787, -0.2553145, 3.122532, 0, 0.9411765, 1, 1,
0.03019819, 1.889825, -0.2172007, 0, 0.9333333, 1, 1,
0.03118372, -1.000522, 2.502498, 0, 0.9294118, 1, 1,
0.03213024, 0.5337997, -0.8609017, 0, 0.9215686, 1, 1,
0.03599132, -3.044613, 1.91259, 0, 0.9176471, 1, 1,
0.03810335, 0.9656677, -0.490141, 0, 0.9098039, 1, 1,
0.03841482, -0.5279814, 2.99882, 0, 0.9058824, 1, 1,
0.03997867, 0.6121957, 0.2103179, 0, 0.8980392, 1, 1,
0.04083917, -1.111753, 3.653951, 0, 0.8901961, 1, 1,
0.04706182, 0.09299207, 0.08198573, 0, 0.8862745, 1, 1,
0.05070307, -1.948365, 2.658414, 0, 0.8784314, 1, 1,
0.05600244, -0.7337738, 5.139742, 0, 0.8745098, 1, 1,
0.0561068, 1.147021, 0.2287366, 0, 0.8666667, 1, 1,
0.05955543, -0.3433485, 3.900529, 0, 0.8627451, 1, 1,
0.06004667, 0.2329121, -1.800032, 0, 0.854902, 1, 1,
0.06596351, 1.888851, -0.2907575, 0, 0.8509804, 1, 1,
0.06720285, 0.4247476, -0.511947, 0, 0.8431373, 1, 1,
0.06975552, 0.1747951, -0.8022041, 0, 0.8392157, 1, 1,
0.07101425, 0.766795, 1.254702, 0, 0.8313726, 1, 1,
0.07170311, -0.1110037, 4.343715, 0, 0.827451, 1, 1,
0.07378186, -0.6376365, 3.258753, 0, 0.8196079, 1, 1,
0.07605895, -0.05379934, 1.543387, 0, 0.8156863, 1, 1,
0.07673571, 0.5648544, -1.125765, 0, 0.8078431, 1, 1,
0.07737806, -1.754528, 3.281695, 0, 0.8039216, 1, 1,
0.07872073, -0.1102686, 2.718836, 0, 0.7960784, 1, 1,
0.07908152, 0.8517849, 1.579672, 0, 0.7882353, 1, 1,
0.07985431, -2.48379, 3.166207, 0, 0.7843137, 1, 1,
0.08048429, -0.5616167, 3.630023, 0, 0.7764706, 1, 1,
0.08143955, -0.5289567, 3.847594, 0, 0.772549, 1, 1,
0.08358017, 1.685601, -0.006018529, 0, 0.7647059, 1, 1,
0.08694895, 0.05766683, 1.556535, 0, 0.7607843, 1, 1,
0.08769727, 0.05060202, 1.589374, 0, 0.7529412, 1, 1,
0.09030242, -0.05869177, 2.167512, 0, 0.7490196, 1, 1,
0.09802232, 0.2112337, -0.8011902, 0, 0.7411765, 1, 1,
0.09834808, -1.117756, 3.21737, 0, 0.7372549, 1, 1,
0.09883556, 0.08756608, 1.113885, 0, 0.7294118, 1, 1,
0.1001389, -1.213062, -0.422081, 0, 0.7254902, 1, 1,
0.1035252, 0.2534577, 0.1226429, 0, 0.7176471, 1, 1,
0.1054937, 0.4300844, 1.392252, 0, 0.7137255, 1, 1,
0.1093247, 0.7886042, 1.604448, 0, 0.7058824, 1, 1,
0.1143919, -0.8061081, 3.166506, 0, 0.6980392, 1, 1,
0.1158563, 0.5804167, -2.068101, 0, 0.6941177, 1, 1,
0.1189332, 0.1345788, -0.4256091, 0, 0.6862745, 1, 1,
0.1191935, 0.02247224, 1.353894, 0, 0.682353, 1, 1,
0.1213113, 1.276892, 1.034322, 0, 0.6745098, 1, 1,
0.1217438, 0.0150563, 2.257224, 0, 0.6705883, 1, 1,
0.1245356, -0.6429681, 0.9402057, 0, 0.6627451, 1, 1,
0.1252338, -2.660942, 1.181089, 0, 0.6588235, 1, 1,
0.1255796, 0.2111594, -0.274292, 0, 0.6509804, 1, 1,
0.1276278, -0.364241, 2.577559, 0, 0.6470588, 1, 1,
0.128166, -0.5384274, 2.922698, 0, 0.6392157, 1, 1,
0.1286437, -0.5604843, 2.836169, 0, 0.6352941, 1, 1,
0.1311085, -1.318795, 3.842243, 0, 0.627451, 1, 1,
0.1340516, -1.324878, 3.769843, 0, 0.6235294, 1, 1,
0.1370337, 0.8654482, -0.3147478, 0, 0.6156863, 1, 1,
0.1374661, -0.1667969, 2.161977, 0, 0.6117647, 1, 1,
0.1401266, -1.399624, 2.83731, 0, 0.6039216, 1, 1,
0.1454466, -1.299925, 3.798757, 0, 0.5960785, 1, 1,
0.1536165, 0.3774926, 0.1140572, 0, 0.5921569, 1, 1,
0.1656735, -0.2742785, 4.261788, 0, 0.5843138, 1, 1,
0.1696412, 0.6304541, 0.4719089, 0, 0.5803922, 1, 1,
0.1715565, 0.6716052, 0.3570311, 0, 0.572549, 1, 1,
0.1773024, -0.1113276, 1.119094, 0, 0.5686275, 1, 1,
0.1774971, -0.1425569, 1.453609, 0, 0.5607843, 1, 1,
0.1798235, -1.552414, 2.134659, 0, 0.5568628, 1, 1,
0.181396, -0.2207414, 0.5133698, 0, 0.5490196, 1, 1,
0.1850898, 0.007508523, 2.771167, 0, 0.5450981, 1, 1,
0.1862975, 0.7823903, 0.4072143, 0, 0.5372549, 1, 1,
0.1872111, -1.021101, 0.804841, 0, 0.5333334, 1, 1,
0.1886843, 2.589124, 0.5858892, 0, 0.5254902, 1, 1,
0.191443, -0.02261131, 2.234096, 0, 0.5215687, 1, 1,
0.1951322, -0.2016085, 0.2420902, 0, 0.5137255, 1, 1,
0.1962203, -0.08946291, -0.1185098, 0, 0.509804, 1, 1,
0.2018367, 0.4292897, 0.7863142, 0, 0.5019608, 1, 1,
0.2038679, -0.05012372, 1.724249, 0, 0.4941176, 1, 1,
0.204097, 0.5737869, 0.4329281, 0, 0.4901961, 1, 1,
0.2075406, -0.7597867, 3.638576, 0, 0.4823529, 1, 1,
0.2098662, -1.379927, 3.516302, 0, 0.4784314, 1, 1,
0.2124291, -1.269554, 1.911903, 0, 0.4705882, 1, 1,
0.2141613, 0.192541, 0.5811592, 0, 0.4666667, 1, 1,
0.2179923, -0.8524235, 3.629734, 0, 0.4588235, 1, 1,
0.2213097, 0.5914842, 0.5816123, 0, 0.454902, 1, 1,
0.2229567, -1.081957, 1.070843, 0, 0.4470588, 1, 1,
0.2243681, 0.1702437, -0.9599029, 0, 0.4431373, 1, 1,
0.2286551, -1.169134, 3.039637, 0, 0.4352941, 1, 1,
0.2320018, -0.6245275, 1.722742, 0, 0.4313726, 1, 1,
0.234265, 0.2516316, 0.5364085, 0, 0.4235294, 1, 1,
0.236856, 1.277986, -0.4558507, 0, 0.4196078, 1, 1,
0.2414722, -0.3652577, 4.415822, 0, 0.4117647, 1, 1,
0.2452049, 0.3693833, 0.6753966, 0, 0.4078431, 1, 1,
0.245605, 1.192928, -0.5178469, 0, 0.4, 1, 1,
0.2456725, 0.7750368, -0.03298119, 0, 0.3921569, 1, 1,
0.2474719, 1.038754, 0.06901531, 0, 0.3882353, 1, 1,
0.2476359, -0.8421531, 2.046813, 0, 0.3803922, 1, 1,
0.250041, 1.303572, 2.213658, 0, 0.3764706, 1, 1,
0.2515695, 0.9857724, 0.1871673, 0, 0.3686275, 1, 1,
0.251814, -1.92032, 3.372021, 0, 0.3647059, 1, 1,
0.2518902, -0.9242227, 2.684681, 0, 0.3568628, 1, 1,
0.2609718, 0.6360613, 1.021132, 0, 0.3529412, 1, 1,
0.262664, 1.734015, -0.2835184, 0, 0.345098, 1, 1,
0.2639683, 0.8433912, 0.3601339, 0, 0.3411765, 1, 1,
0.2657683, 1.528663, 1.957996, 0, 0.3333333, 1, 1,
0.2722886, -1.351631, 4.17605, 0, 0.3294118, 1, 1,
0.2750984, -0.8095181, 4.733593, 0, 0.3215686, 1, 1,
0.2764469, 0.6739188, -0.7077618, 0, 0.3176471, 1, 1,
0.2766369, -0.2144171, 3.581007, 0, 0.3098039, 1, 1,
0.284749, -0.2795894, 2.12703, 0, 0.3058824, 1, 1,
0.2849464, 0.1507446, 1.056501, 0, 0.2980392, 1, 1,
0.2979674, 0.8851555, 0.2161855, 0, 0.2901961, 1, 1,
0.2986303, -0.3002776, 3.85251, 0, 0.2862745, 1, 1,
0.2998643, 2.393514, 0.2842236, 0, 0.2784314, 1, 1,
0.3009879, 0.6085583, 0.5204652, 0, 0.2745098, 1, 1,
0.3029714, -0.5611727, 2.4878, 0, 0.2666667, 1, 1,
0.3057281, -0.05109716, 1.994916, 0, 0.2627451, 1, 1,
0.3071955, -0.3449958, 3.197113, 0, 0.254902, 1, 1,
0.3145633, -0.2478616, 2.892483, 0, 0.2509804, 1, 1,
0.3155476, -0.976375, 5.324695, 0, 0.2431373, 1, 1,
0.3156442, -0.00991597, 2.150151, 0, 0.2392157, 1, 1,
0.3172382, -0.09293117, 2.169273, 0, 0.2313726, 1, 1,
0.3211986, -2.934649, 2.361717, 0, 0.227451, 1, 1,
0.3237331, 0.03191878, 0.3881565, 0, 0.2196078, 1, 1,
0.3253365, -0.3019919, 3.967487, 0, 0.2156863, 1, 1,
0.3266927, -0.9182235, 3.871694, 0, 0.2078431, 1, 1,
0.3277933, 0.1026882, 1.379502, 0, 0.2039216, 1, 1,
0.3303405, -0.06734962, 2.964347, 0, 0.1960784, 1, 1,
0.3395206, -0.3601843, 2.700769, 0, 0.1882353, 1, 1,
0.3396867, 1.097775, 0.5018913, 0, 0.1843137, 1, 1,
0.3428902, -0.7782158, 1.040735, 0, 0.1764706, 1, 1,
0.3445214, 1.140014, -0.3253934, 0, 0.172549, 1, 1,
0.3474008, 0.1742037, 1.244758, 0, 0.1647059, 1, 1,
0.3477589, 1.363441, 1.123756, 0, 0.1607843, 1, 1,
0.3487324, 0.903937, -0.1760729, 0, 0.1529412, 1, 1,
0.3504476, 2.084208, -0.4028519, 0, 0.1490196, 1, 1,
0.3512608, 0.9340767, -0.2746212, 0, 0.1411765, 1, 1,
0.351498, 2.578127, -1.008638, 0, 0.1372549, 1, 1,
0.3534762, -0.3468836, 0.4005909, 0, 0.1294118, 1, 1,
0.3547198, 0.4925267, -1.38013, 0, 0.1254902, 1, 1,
0.3549594, -0.1589793, 2.278233, 0, 0.1176471, 1, 1,
0.3630212, 0.8727897, 1.645465, 0, 0.1137255, 1, 1,
0.3631215, -0.7563485, 2.472544, 0, 0.1058824, 1, 1,
0.3632641, -0.4180099, 0.807422, 0, 0.09803922, 1, 1,
0.3722357, -1.71989, 2.603837, 0, 0.09411765, 1, 1,
0.3739142, -0.3192408, 2.291883, 0, 0.08627451, 1, 1,
0.377516, 0.2540782, 1.704608, 0, 0.08235294, 1, 1,
0.3776967, 0.0335826, 5.229548, 0, 0.07450981, 1, 1,
0.3856934, 0.1363923, 1.733468, 0, 0.07058824, 1, 1,
0.3865445, 0.3128477, -1.228402, 0, 0.0627451, 1, 1,
0.3878752, 0.09483217, 1.749026, 0, 0.05882353, 1, 1,
0.3915367, -0.4967239, 2.365597, 0, 0.05098039, 1, 1,
0.3920178, -0.3237422, 1.989548, 0, 0.04705882, 1, 1,
0.3933905, -0.3847885, 2.011337, 0, 0.03921569, 1, 1,
0.3936855, -1.603645, -0.05367612, 0, 0.03529412, 1, 1,
0.4039963, -0.1635304, 3.058786, 0, 0.02745098, 1, 1,
0.4044524, -1.059825, 2.354372, 0, 0.02352941, 1, 1,
0.4065602, -0.608542, 1.547504, 0, 0.01568628, 1, 1,
0.4100575, -0.4958921, 2.430156, 0, 0.01176471, 1, 1,
0.4124275, -1.472849, 4.125205, 0, 0.003921569, 1, 1,
0.4136201, 1.651045, 0.368544, 0.003921569, 0, 1, 1,
0.4233577, -1.255467, 3.507394, 0.007843138, 0, 1, 1,
0.4244763, 1.083488, -0.4611309, 0.01568628, 0, 1, 1,
0.4265811, 0.08840197, 2.646878, 0.01960784, 0, 1, 1,
0.4276912, -1.87562, 3.583217, 0.02745098, 0, 1, 1,
0.4328811, -1.289436, 1.565851, 0.03137255, 0, 1, 1,
0.4440103, 1.662235, -1.45813, 0.03921569, 0, 1, 1,
0.444499, 0.27703, 1.398985, 0.04313726, 0, 1, 1,
0.4522777, -1.260331, 3.113534, 0.05098039, 0, 1, 1,
0.4531553, -0.4188961, 2.53748, 0.05490196, 0, 1, 1,
0.4564028, 1.789539, -0.5599977, 0.0627451, 0, 1, 1,
0.457707, 0.5812206, 2.464467, 0.06666667, 0, 1, 1,
0.4585714, 0.2052714, 1.154826, 0.07450981, 0, 1, 1,
0.4609684, 0.3983057, 1.044754, 0.07843138, 0, 1, 1,
0.4617979, -0.6793917, 1.469045, 0.08627451, 0, 1, 1,
0.465794, 0.1055434, 0.9487572, 0.09019608, 0, 1, 1,
0.4696288, -0.6364313, 2.470862, 0.09803922, 0, 1, 1,
0.4754141, -1.716655, 1.374316, 0.1058824, 0, 1, 1,
0.4837575, -2.054235, 4.251026, 0.1098039, 0, 1, 1,
0.4852006, 0.3189065, -0.377774, 0.1176471, 0, 1, 1,
0.4934919, -1.809807, 3.364647, 0.1215686, 0, 1, 1,
0.4946072, -0.2734109, 2.405863, 0.1294118, 0, 1, 1,
0.5004924, 0.4543975, -0.301991, 0.1333333, 0, 1, 1,
0.5024853, -0.4407232, 2.04874, 0.1411765, 0, 1, 1,
0.5032386, 0.9773585, 0.9708464, 0.145098, 0, 1, 1,
0.5054339, -0.4275198, 2.015809, 0.1529412, 0, 1, 1,
0.5068743, -0.9050375, 3.772624, 0.1568628, 0, 1, 1,
0.5071273, 0.3862736, 1.345145, 0.1647059, 0, 1, 1,
0.5076973, 0.3827728, 0.8732125, 0.1686275, 0, 1, 1,
0.5142995, -0.08407509, 1.674212, 0.1764706, 0, 1, 1,
0.5152264, -0.4191076, 3.015057, 0.1803922, 0, 1, 1,
0.5160681, 0.0125036, 1.642391, 0.1882353, 0, 1, 1,
0.5163025, 0.5103913, 0.733929, 0.1921569, 0, 1, 1,
0.5224673, -0.9433703, 3.334314, 0.2, 0, 1, 1,
0.5264474, -0.6309232, 3.957536, 0.2078431, 0, 1, 1,
0.5275235, 0.6326008, -0.1467119, 0.2117647, 0, 1, 1,
0.5304729, -0.8723423, 4.002738, 0.2196078, 0, 1, 1,
0.5307741, 1.753811, -0.07181149, 0.2235294, 0, 1, 1,
0.5326852, 0.1415414, 3.417613, 0.2313726, 0, 1, 1,
0.5366933, 0.9661216, 2.225694, 0.2352941, 0, 1, 1,
0.5372207, 0.07035711, 2.573501, 0.2431373, 0, 1, 1,
0.5484362, 0.3144195, 2.10404, 0.2470588, 0, 1, 1,
0.5494447, 1.672222, 0.3021842, 0.254902, 0, 1, 1,
0.5502809, 1.430577, 1.315842, 0.2588235, 0, 1, 1,
0.5522392, 1.144383, 2.267608, 0.2666667, 0, 1, 1,
0.559894, -1.061283, 2.176609, 0.2705882, 0, 1, 1,
0.5676993, 2.568659, -0.9550642, 0.2784314, 0, 1, 1,
0.5699317, -0.1653202, 1.10811, 0.282353, 0, 1, 1,
0.5788798, 0.4415392, -1.134085, 0.2901961, 0, 1, 1,
0.5790666, 1.288173, 0.6122033, 0.2941177, 0, 1, 1,
0.5802323, 2.07922, 1.666204, 0.3019608, 0, 1, 1,
0.5803181, 0.44031, -0.599496, 0.3098039, 0, 1, 1,
0.5824214, 0.3392799, 2.319493, 0.3137255, 0, 1, 1,
0.5845883, 1.192869, -1.426197, 0.3215686, 0, 1, 1,
0.5906149, 1.557738, -0.4205832, 0.3254902, 0, 1, 1,
0.599476, -0.6203082, 0.9674654, 0.3333333, 0, 1, 1,
0.600997, 0.9380135, 1.63853, 0.3372549, 0, 1, 1,
0.6047984, 1.511428, -0.05974729, 0.345098, 0, 1, 1,
0.6053722, -0.9315319, 2.401931, 0.3490196, 0, 1, 1,
0.6057275, 1.605714, 1.383074, 0.3568628, 0, 1, 1,
0.6118885, 1.662356, -0.5898827, 0.3607843, 0, 1, 1,
0.6133932, -0.8400331, 2.365331, 0.3686275, 0, 1, 1,
0.6153526, 0.1077824, 1.002158, 0.372549, 0, 1, 1,
0.6171637, 0.4558671, 2.2965, 0.3803922, 0, 1, 1,
0.6174895, 0.2358621, 0.4011068, 0.3843137, 0, 1, 1,
0.6220355, 0.4843121, 1.240823, 0.3921569, 0, 1, 1,
0.6238798, -0.02189524, 1.347008, 0.3960784, 0, 1, 1,
0.6250948, 1.933457, 1.704808, 0.4039216, 0, 1, 1,
0.6291441, 1.603168, 0.2710112, 0.4117647, 0, 1, 1,
0.6364389, -0.9482379, 0.5412942, 0.4156863, 0, 1, 1,
0.6368766, 0.8289725, 2.296264, 0.4235294, 0, 1, 1,
0.6379427, 0.8382368, 0.1096433, 0.427451, 0, 1, 1,
0.6393411, 0.1209594, 0.9272045, 0.4352941, 0, 1, 1,
0.6411178, 1.146387, 0.2371246, 0.4392157, 0, 1, 1,
0.6481619, -1.488041, 3.670424, 0.4470588, 0, 1, 1,
0.6484408, -1.34916, 2.567618, 0.4509804, 0, 1, 1,
0.651675, 1.003348, 0.9240361, 0.4588235, 0, 1, 1,
0.6528655, 0.2855199, 0.01440693, 0.4627451, 0, 1, 1,
0.657688, 1.227006, -1.148388, 0.4705882, 0, 1, 1,
0.6597904, -2.418482, 2.134599, 0.4745098, 0, 1, 1,
0.6622603, -0.3951885, 1.345705, 0.4823529, 0, 1, 1,
0.6628965, 0.3320621, 1.829032, 0.4862745, 0, 1, 1,
0.6686523, -0.5386065, 2.700886, 0.4941176, 0, 1, 1,
0.6691716, 2.425454, 1.483119, 0.5019608, 0, 1, 1,
0.6745882, 0.4631753, 0.4041927, 0.5058824, 0, 1, 1,
0.6772608, -1.381089, 3.608199, 0.5137255, 0, 1, 1,
0.6840576, -0.547107, 1.345196, 0.5176471, 0, 1, 1,
0.6879753, -0.4268787, 3.090926, 0.5254902, 0, 1, 1,
0.694188, -1.241393, 5.085278, 0.5294118, 0, 1, 1,
0.6973819, -0.9782714, 2.621749, 0.5372549, 0, 1, 1,
0.7011678, -0.398076, 1.934479, 0.5411765, 0, 1, 1,
0.7055491, -1.015404, 2.210655, 0.5490196, 0, 1, 1,
0.7125353, -1.217633, 3.497882, 0.5529412, 0, 1, 1,
0.7220219, -0.6822531, 2.809568, 0.5607843, 0, 1, 1,
0.7223622, 0.5030492, 0.264299, 0.5647059, 0, 1, 1,
0.7288512, -0.1817963, 1.878298, 0.572549, 0, 1, 1,
0.7327174, 1.099656, 0.4835929, 0.5764706, 0, 1, 1,
0.7351121, 0.7670267, 1.743625, 0.5843138, 0, 1, 1,
0.7370057, 2.183181, 0.2686116, 0.5882353, 0, 1, 1,
0.7400541, 0.09077463, 2.99469, 0.5960785, 0, 1, 1,
0.7497307, -0.5844531, 2.533455, 0.6039216, 0, 1, 1,
0.7509151, 1.016384, 1.758284, 0.6078432, 0, 1, 1,
0.7514715, 1.050243, 1.454511, 0.6156863, 0, 1, 1,
0.7529468, 2.070163, -1.061441, 0.6196079, 0, 1, 1,
0.7560133, 0.2880249, 0.6663867, 0.627451, 0, 1, 1,
0.7618199, 0.5035682, 1.057945, 0.6313726, 0, 1, 1,
0.764711, 1.084103, 1.385611, 0.6392157, 0, 1, 1,
0.7686611, 0.1908016, 2.001222, 0.6431373, 0, 1, 1,
0.7697053, -0.7150185, 4.38304, 0.6509804, 0, 1, 1,
0.7748738, -0.5893843, 2.721086, 0.654902, 0, 1, 1,
0.783344, -0.76286, 1.926736, 0.6627451, 0, 1, 1,
0.7906308, -0.3645643, 2.419868, 0.6666667, 0, 1, 1,
0.7926831, 1.143998, -0.5887908, 0.6745098, 0, 1, 1,
0.7982559, 0.4109951, 0.01424806, 0.6784314, 0, 1, 1,
0.7990759, -0.2879348, 1.622622, 0.6862745, 0, 1, 1,
0.8007482, 0.5223158, 0.6910275, 0.6901961, 0, 1, 1,
0.802734, 0.5619121, 0.1241541, 0.6980392, 0, 1, 1,
0.8057173, -0.3774186, 0.0138728, 0.7058824, 0, 1, 1,
0.8070154, -1.170292, 2.274769, 0.7098039, 0, 1, 1,
0.807186, -1.642649, 2.893955, 0.7176471, 0, 1, 1,
0.8162115, -1.915162, 0.9968894, 0.7215686, 0, 1, 1,
0.8213373, -0.1458364, 2.272579, 0.7294118, 0, 1, 1,
0.8246681, 0.5656185, 0.5781732, 0.7333333, 0, 1, 1,
0.8285472, 1.56047, 0.6393421, 0.7411765, 0, 1, 1,
0.8308348, -0.8914245, 2.702854, 0.7450981, 0, 1, 1,
0.8346168, 0.7551578, 0.1975879, 0.7529412, 0, 1, 1,
0.8422412, 0.1947081, 1.777344, 0.7568628, 0, 1, 1,
0.8486972, -0.2455125, -0.7703143, 0.7647059, 0, 1, 1,
0.8643543, -2.382787, 3.603267, 0.7686275, 0, 1, 1,
0.8672226, 0.944339, 0.6152094, 0.7764706, 0, 1, 1,
0.8676558, -0.6365713, 2.344105, 0.7803922, 0, 1, 1,
0.8713883, 1.531425, -0.2336079, 0.7882353, 0, 1, 1,
0.887105, 1.665269, 0.7506284, 0.7921569, 0, 1, 1,
0.8878461, -0.08666244, 1.157861, 0.8, 0, 1, 1,
0.8889949, 1.412825, 1.088606, 0.8078431, 0, 1, 1,
0.8893156, 0.4087589, 2.109043, 0.8117647, 0, 1, 1,
0.8893653, 0.5321318, 0.7938119, 0.8196079, 0, 1, 1,
0.8918197, 0.110677, 1.383531, 0.8235294, 0, 1, 1,
0.8981134, 0.1327195, 2.447623, 0.8313726, 0, 1, 1,
0.9130616, 0.5083366, 0.9691011, 0.8352941, 0, 1, 1,
0.9179609, -0.3837931, 1.898588, 0.8431373, 0, 1, 1,
0.9265867, -0.06431232, 0.5957075, 0.8470588, 0, 1, 1,
0.9347752, -0.056243, 0.7601614, 0.854902, 0, 1, 1,
0.9382053, 0.5487407, 1.809142, 0.8588235, 0, 1, 1,
0.9386821, 1.324125, 1.194456, 0.8666667, 0, 1, 1,
0.9401444, -0.2228372, 2.181726, 0.8705882, 0, 1, 1,
0.9417585, -0.7195477, 1.476482, 0.8784314, 0, 1, 1,
0.941862, 1.634353, -0.9090074, 0.8823529, 0, 1, 1,
0.947978, 0.3250502, -0.3014715, 0.8901961, 0, 1, 1,
0.9494574, 0.1887566, 0.4470102, 0.8941177, 0, 1, 1,
0.9505817, -0.3140821, 1.922069, 0.9019608, 0, 1, 1,
0.9581428, -0.617262, 2.069903, 0.9098039, 0, 1, 1,
0.9629954, -0.5394836, 0.6917012, 0.9137255, 0, 1, 1,
0.9641305, -0.09542448, 1.755634, 0.9215686, 0, 1, 1,
0.9660584, 0.3365148, 0.8779172, 0.9254902, 0, 1, 1,
0.9692302, 0.1502544, 2.748191, 0.9333333, 0, 1, 1,
0.9692322, 0.5501176, 1.144896, 0.9372549, 0, 1, 1,
0.9739931, 0.2042338, 2.585175, 0.945098, 0, 1, 1,
0.9811244, 0.1709277, 2.008141, 0.9490196, 0, 1, 1,
0.9815841, 1.504461, 0.3355602, 0.9568627, 0, 1, 1,
0.9819444, -2.410021, 3.160429, 0.9607843, 0, 1, 1,
0.989341, -0.002576014, 1.518674, 0.9686275, 0, 1, 1,
0.991242, -0.516606, 1.188483, 0.972549, 0, 1, 1,
1.0006, -2.305105, 3.149351, 0.9803922, 0, 1, 1,
1.003379, -0.1150296, 0.9624308, 0.9843137, 0, 1, 1,
1.014246, -0.1443508, 2.625381, 0.9921569, 0, 1, 1,
1.015254, 0.8762826, 1.502223, 0.9960784, 0, 1, 1,
1.018924, 2.240017, -1.376263, 1, 0, 0.9960784, 1,
1.022782, -0.1699677, 1.173766, 1, 0, 0.9882353, 1,
1.025524, 0.6832703, 2.424932, 1, 0, 0.9843137, 1,
1.025542, -0.740756, 0.9486486, 1, 0, 0.9764706, 1,
1.031477, 1.09296, 2.921735, 1, 0, 0.972549, 1,
1.036445, -0.9195747, 1.881892, 1, 0, 0.9647059, 1,
1.052235, -1.194609, 3.166815, 1, 0, 0.9607843, 1,
1.054173, -0.7786213, 2.216206, 1, 0, 0.9529412, 1,
1.057268, 1.572736, -1.378317, 1, 0, 0.9490196, 1,
1.062245, -0.02621424, 0.6185141, 1, 0, 0.9411765, 1,
1.062867, -0.3944893, 1.165629, 1, 0, 0.9372549, 1,
1.065476, 1.227551, 1.021993, 1, 0, 0.9294118, 1,
1.074077, 0.1979321, 1.042214, 1, 0, 0.9254902, 1,
1.076332, -0.3305471, 1.675433, 1, 0, 0.9176471, 1,
1.088135, 0.7462102, -1.216721, 1, 0, 0.9137255, 1,
1.095523, 0.2369913, -0.1894488, 1, 0, 0.9058824, 1,
1.09788, -0.328926, 1.602822, 1, 0, 0.9019608, 1,
1.101983, -1.356053, 3.176121, 1, 0, 0.8941177, 1,
1.102017, 1.548306, 1.035359, 1, 0, 0.8862745, 1,
1.102638, 0.2344881, 2.447806, 1, 0, 0.8823529, 1,
1.102946, -0.3468249, 3.879763, 1, 0, 0.8745098, 1,
1.108768, -0.4369649, 3.631293, 1, 0, 0.8705882, 1,
1.109352, -0.01231247, 3.110338, 1, 0, 0.8627451, 1,
1.109532, -0.8564691, 2.143318, 1, 0, 0.8588235, 1,
1.111542, 0.2493943, 1.854056, 1, 0, 0.8509804, 1,
1.111805, 0.7680392, 0.9188161, 1, 0, 0.8470588, 1,
1.117147, 0.03997712, 2.28203, 1, 0, 0.8392157, 1,
1.119431, -1.20404, 3.262375, 1, 0, 0.8352941, 1,
1.121132, -0.6518403, 2.226395, 1, 0, 0.827451, 1,
1.122007, 0.4788088, -0.5087799, 1, 0, 0.8235294, 1,
1.136575, 1.055967, -0.3078949, 1, 0, 0.8156863, 1,
1.138205, -0.6088616, 2.13984, 1, 0, 0.8117647, 1,
1.139312, 0.09739189, 3.569527, 1, 0, 0.8039216, 1,
1.140835, 0.7212415, 0.8065989, 1, 0, 0.7960784, 1,
1.144038, 0.8937181, 0.6757081, 1, 0, 0.7921569, 1,
1.149618, 1.35939, 2.261659, 1, 0, 0.7843137, 1,
1.153152, -0.195472, 0.7282318, 1, 0, 0.7803922, 1,
1.155994, 1.066344, 1.056962, 1, 0, 0.772549, 1,
1.158955, -0.9997262, 0.7245849, 1, 0, 0.7686275, 1,
1.160842, -0.3293581, 2.788806, 1, 0, 0.7607843, 1,
1.16451, -0.3444898, 1.107546, 1, 0, 0.7568628, 1,
1.167755, -0.09597268, 2.246783, 1, 0, 0.7490196, 1,
1.17004, -1.362731, 2.668931, 1, 0, 0.7450981, 1,
1.171818, 0.4931862, 1.67383, 1, 0, 0.7372549, 1,
1.176065, 0.920718, 0.1466273, 1, 0, 0.7333333, 1,
1.185227, -0.8339369, 1.154763, 1, 0, 0.7254902, 1,
1.198988, 0.5616189, 1.921173, 1, 0, 0.7215686, 1,
1.202384, -0.4789191, 3.596089, 1, 0, 0.7137255, 1,
1.204825, 2.147725, -0.7213457, 1, 0, 0.7098039, 1,
1.210084, 1.047397, 0.5092677, 1, 0, 0.7019608, 1,
1.2174, -0.5895893, 3.415993, 1, 0, 0.6941177, 1,
1.220129, 0.1903872, 0.9386726, 1, 0, 0.6901961, 1,
1.220419, 0.3504079, 1.433748, 1, 0, 0.682353, 1,
1.223652, -0.5194755, 2.688943, 1, 0, 0.6784314, 1,
1.232309, 0.3217561, 2.056759, 1, 0, 0.6705883, 1,
1.233094, -1.553477, 3.171362, 1, 0, 0.6666667, 1,
1.235441, -0.3583886, 1.453867, 1, 0, 0.6588235, 1,
1.243588, -1.058803, 2.83464, 1, 0, 0.654902, 1,
1.250043, 1.249145, 0.8042271, 1, 0, 0.6470588, 1,
1.263119, -0.7282948, 3.100538, 1, 0, 0.6431373, 1,
1.264578, 0.219566, 2.220033, 1, 0, 0.6352941, 1,
1.26533, -1.463852, 1.139365, 1, 0, 0.6313726, 1,
1.270531, 0.702715, 2.659431, 1, 0, 0.6235294, 1,
1.27854, 0.2118783, 1.214697, 1, 0, 0.6196079, 1,
1.279685, -0.7700268, 2.219387, 1, 0, 0.6117647, 1,
1.280084, -0.01081183, 1.359437, 1, 0, 0.6078432, 1,
1.282868, -0.8307428, 2.516177, 1, 0, 0.6, 1,
1.292888, 1.256949, 0.5033649, 1, 0, 0.5921569, 1,
1.294041, -0.05676761, 1.199286, 1, 0, 0.5882353, 1,
1.297871, -0.7521784, 2.614608, 1, 0, 0.5803922, 1,
1.298401, -0.3769063, 2.691778, 1, 0, 0.5764706, 1,
1.298532, 1.61305, 2.004069, 1, 0, 0.5686275, 1,
1.301283, 0.1443495, 1.752275, 1, 0, 0.5647059, 1,
1.308724, 1.225209, 1.041358, 1, 0, 0.5568628, 1,
1.312015, 0.03433735, 1.516166, 1, 0, 0.5529412, 1,
1.315266, 0.1189549, 0.9909197, 1, 0, 0.5450981, 1,
1.322264, 0.07596818, 0.641327, 1, 0, 0.5411765, 1,
1.323339, 1.556921, -0.8110826, 1, 0, 0.5333334, 1,
1.336527, 0.5396674, 1.263534, 1, 0, 0.5294118, 1,
1.352575, -0.8365609, 1.704774, 1, 0, 0.5215687, 1,
1.363672, -0.01457021, 2.319026, 1, 0, 0.5176471, 1,
1.371754, 1.935077, -0.3448554, 1, 0, 0.509804, 1,
1.384827, 1.376215, 1.671327, 1, 0, 0.5058824, 1,
1.384853, 1.97481, 3.570668, 1, 0, 0.4980392, 1,
1.396794, 0.7848411, 2.073429, 1, 0, 0.4901961, 1,
1.398331, -1.222339, 1.836, 1, 0, 0.4862745, 1,
1.403908, 0.7908362, -1.073343, 1, 0, 0.4784314, 1,
1.412193, 1.126444, 0.2895156, 1, 0, 0.4745098, 1,
1.424527, -0.6930605, 2.687144, 1, 0, 0.4666667, 1,
1.426061, 0.2089163, 0.9172213, 1, 0, 0.4627451, 1,
1.428454, -0.4843527, -0.2863434, 1, 0, 0.454902, 1,
1.434793, -1.261183, 3.184855, 1, 0, 0.4509804, 1,
1.44161, 0.6014443, 1.632686, 1, 0, 0.4431373, 1,
1.467816, 1.163794, 0.7417557, 1, 0, 0.4392157, 1,
1.491511, -0.294081, 1.454092, 1, 0, 0.4313726, 1,
1.506233, 1.267173, 1.422838, 1, 0, 0.427451, 1,
1.508141, 1.895706, 1.173452, 1, 0, 0.4196078, 1,
1.509062, 1.858743, 1.921863, 1, 0, 0.4156863, 1,
1.512868, 1.519242, 1.352938, 1, 0, 0.4078431, 1,
1.533167, -0.3953489, 1.343805, 1, 0, 0.4039216, 1,
1.545147, 2.085673, 1.0754, 1, 0, 0.3960784, 1,
1.549643, -0.3862943, 1.21463, 1, 0, 0.3882353, 1,
1.554541, -0.7632628, 2.373435, 1, 0, 0.3843137, 1,
1.554963, -0.2041976, 2.880861, 1, 0, 0.3764706, 1,
1.559389, -1.122875, 2.605725, 1, 0, 0.372549, 1,
1.561997, -1.761602, 2.521576, 1, 0, 0.3647059, 1,
1.563332, 1.105866, -0.4535837, 1, 0, 0.3607843, 1,
1.564321, 0.647995, 1.285977, 1, 0, 0.3529412, 1,
1.571633, 0.6033474, 0.284447, 1, 0, 0.3490196, 1,
1.592028, -0.4858847, 1.580525, 1, 0, 0.3411765, 1,
1.594132, 0.5435678, 1.095935, 1, 0, 0.3372549, 1,
1.607185, -0.757261, 4.112315, 1, 0, 0.3294118, 1,
1.612762, -0.7198996, 2.989908, 1, 0, 0.3254902, 1,
1.615141, 0.5128234, 0.2867813, 1, 0, 0.3176471, 1,
1.633253, 0.1921953, 1.240605, 1, 0, 0.3137255, 1,
1.650744, -0.959386, 2.573332, 1, 0, 0.3058824, 1,
1.654668, 0.8886741, -0.7204634, 1, 0, 0.2980392, 1,
1.672425, -0.2366647, 0.2567322, 1, 0, 0.2941177, 1,
1.6906, 1.063717, 0.9641495, 1, 0, 0.2862745, 1,
1.705949, -0.05122092, 0.7322238, 1, 0, 0.282353, 1,
1.711395, 0.03834352, 1.579458, 1, 0, 0.2745098, 1,
1.713192, 0.700707, 1.605455, 1, 0, 0.2705882, 1,
1.725744, -0.3919491, 2.628349, 1, 0, 0.2627451, 1,
1.726472, 0.4672264, 2.293304, 1, 0, 0.2588235, 1,
1.74434, -0.6789498, 1.537813, 1, 0, 0.2509804, 1,
1.751593, -0.8136575, 2.879982, 1, 0, 0.2470588, 1,
1.766761, -1.055224, 2.264504, 1, 0, 0.2392157, 1,
1.780199, -0.3372638, 0.9321574, 1, 0, 0.2352941, 1,
1.781178, 0.33473, 1.532061, 1, 0, 0.227451, 1,
1.789478, 1.427426, 1.915428, 1, 0, 0.2235294, 1,
1.805871, 1.356541, 1.15179, 1, 0, 0.2156863, 1,
1.84376, -0.05390623, 1.399719, 1, 0, 0.2117647, 1,
1.902466, -0.289766, 1.117374, 1, 0, 0.2039216, 1,
1.942437, -0.3414829, 1.818515, 1, 0, 0.1960784, 1,
1.967209, -1.37599, 0.5463465, 1, 0, 0.1921569, 1,
1.980256, 1.330193, 0.1590306, 1, 0, 0.1843137, 1,
1.994284, 0.7446001, 1.437211, 1, 0, 0.1803922, 1,
2.010436, 1.25895, 0.8242828, 1, 0, 0.172549, 1,
2.026813, -0.5585459, 1.764187, 1, 0, 0.1686275, 1,
2.050383, -1.077612, 1.276712, 1, 0, 0.1607843, 1,
2.053194, -0.748111, 1.279283, 1, 0, 0.1568628, 1,
2.07259, 0.1893909, 2.022576, 1, 0, 0.1490196, 1,
2.075647, 1.584692, 0.7451189, 1, 0, 0.145098, 1,
2.106677, 0.7604557, 0.6344922, 1, 0, 0.1372549, 1,
2.126019, 0.4609522, 1.244069, 1, 0, 0.1333333, 1,
2.182953, 2.138323, 0.9252816, 1, 0, 0.1254902, 1,
2.202878, 0.2135748, 0.4875513, 1, 0, 0.1215686, 1,
2.20469, 0.4670176, 0.6256089, 1, 0, 0.1137255, 1,
2.213995, -0.412314, 1.386155, 1, 0, 0.1098039, 1,
2.303732, 0.0869327, 0.7509203, 1, 0, 0.1019608, 1,
2.306544, -0.65775, 0.7719346, 1, 0, 0.09411765, 1,
2.32623, 1.715067, 0.742375, 1, 0, 0.09019608, 1,
2.351158, 0.5577053, 0.9426565, 1, 0, 0.08235294, 1,
2.375979, 0.878728, 2.150555, 1, 0, 0.07843138, 1,
2.422508, 0.9442334, -0.0663114, 1, 0, 0.07058824, 1,
2.464038, -0.8792993, 5.408498, 1, 0, 0.06666667, 1,
2.559923, 0.3452643, 2.58506, 1, 0, 0.05882353, 1,
2.611659, -0.1463667, 2.659642, 1, 0, 0.05490196, 1,
2.618289, -0.7092621, 1.052492, 1, 0, 0.04705882, 1,
2.619272, 0.7848337, 2.793476, 1, 0, 0.04313726, 1,
2.667346, 2.280779, 0.009898025, 1, 0, 0.03529412, 1,
2.704429, -0.4112608, 2.748029, 1, 0, 0.03137255, 1,
2.823098, 1.660637, 1.300851, 1, 0, 0.02352941, 1,
2.963172, 1.261246, 0.9721085, 1, 0, 0.01960784, 1,
3.282245, -1.242707, -0.01382443, 1, 0, 0.01176471, 1,
3.913195, -0.7921558, 2.887971, 1, 0, 0.007843138, 1
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
0.2228862, -4.962297, -7.319153, 0, -0.5, 0.5, 0.5,
0.2228862, -4.962297, -7.319153, 1, -0.5, 0.5, 0.5,
0.2228862, -4.962297, -7.319153, 1, 1.5, 0.5, 0.5,
0.2228862, -4.962297, -7.319153, 0, 1.5, 0.5, 0.5
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
-4.718437, -0.393683, -7.319153, 0, -0.5, 0.5, 0.5,
-4.718437, -0.393683, -7.319153, 1, -0.5, 0.5, 0.5,
-4.718437, -0.393683, -7.319153, 1, 1.5, 0.5, 0.5,
-4.718437, -0.393683, -7.319153, 0, 1.5, 0.5, 0.5
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
-4.718437, -4.962297, -0.03299427, 0, -0.5, 0.5, 0.5,
-4.718437, -4.962297, -0.03299427, 1, -0.5, 0.5, 0.5,
-4.718437, -4.962297, -0.03299427, 1, 1.5, 0.5, 0.5,
-4.718437, -4.962297, -0.03299427, 0, 1.5, 0.5, 0.5
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
-2, -3.908002, -5.637732,
2, -3.908002, -5.637732,
-2, -3.908002, -5.637732,
-2, -4.083718, -5.917968,
0, -3.908002, -5.637732,
0, -4.083718, -5.917968,
2, -3.908002, -5.637732,
2, -4.083718, -5.917968
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
-2, -4.43515, -6.478442, 0, -0.5, 0.5, 0.5,
-2, -4.43515, -6.478442, 1, -0.5, 0.5, 0.5,
-2, -4.43515, -6.478442, 1, 1.5, 0.5, 0.5,
-2, -4.43515, -6.478442, 0, 1.5, 0.5, 0.5,
0, -4.43515, -6.478442, 0, -0.5, 0.5, 0.5,
0, -4.43515, -6.478442, 1, -0.5, 0.5, 0.5,
0, -4.43515, -6.478442, 1, 1.5, 0.5, 0.5,
0, -4.43515, -6.478442, 0, 1.5, 0.5, 0.5,
2, -4.43515, -6.478442, 0, -0.5, 0.5, 0.5,
2, -4.43515, -6.478442, 1, -0.5, 0.5, 0.5,
2, -4.43515, -6.478442, 1, 1.5, 0.5, 0.5,
2, -4.43515, -6.478442, 0, 1.5, 0.5, 0.5
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
-3.578132, -3, -5.637732,
-3.578132, 3, -5.637732,
-3.578132, -3, -5.637732,
-3.768183, -3, -5.917968,
-3.578132, -2, -5.637732,
-3.768183, -2, -5.917968,
-3.578132, -1, -5.637732,
-3.768183, -1, -5.917968,
-3.578132, 0, -5.637732,
-3.768183, 0, -5.917968,
-3.578132, 1, -5.637732,
-3.768183, 1, -5.917968,
-3.578132, 2, -5.637732,
-3.768183, 2, -5.917968,
-3.578132, 3, -5.637732,
-3.768183, 3, -5.917968
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
-4.148284, -3, -6.478442, 0, -0.5, 0.5, 0.5,
-4.148284, -3, -6.478442, 1, -0.5, 0.5, 0.5,
-4.148284, -3, -6.478442, 1, 1.5, 0.5, 0.5,
-4.148284, -3, -6.478442, 0, 1.5, 0.5, 0.5,
-4.148284, -2, -6.478442, 0, -0.5, 0.5, 0.5,
-4.148284, -2, -6.478442, 1, -0.5, 0.5, 0.5,
-4.148284, -2, -6.478442, 1, 1.5, 0.5, 0.5,
-4.148284, -2, -6.478442, 0, 1.5, 0.5, 0.5,
-4.148284, -1, -6.478442, 0, -0.5, 0.5, 0.5,
-4.148284, -1, -6.478442, 1, -0.5, 0.5, 0.5,
-4.148284, -1, -6.478442, 1, 1.5, 0.5, 0.5,
-4.148284, -1, -6.478442, 0, 1.5, 0.5, 0.5,
-4.148284, 0, -6.478442, 0, -0.5, 0.5, 0.5,
-4.148284, 0, -6.478442, 1, -0.5, 0.5, 0.5,
-4.148284, 0, -6.478442, 1, 1.5, 0.5, 0.5,
-4.148284, 0, -6.478442, 0, 1.5, 0.5, 0.5,
-4.148284, 1, -6.478442, 0, -0.5, 0.5, 0.5,
-4.148284, 1, -6.478442, 1, -0.5, 0.5, 0.5,
-4.148284, 1, -6.478442, 1, 1.5, 0.5, 0.5,
-4.148284, 1, -6.478442, 0, 1.5, 0.5, 0.5,
-4.148284, 2, -6.478442, 0, -0.5, 0.5, 0.5,
-4.148284, 2, -6.478442, 1, -0.5, 0.5, 0.5,
-4.148284, 2, -6.478442, 1, 1.5, 0.5, 0.5,
-4.148284, 2, -6.478442, 0, 1.5, 0.5, 0.5,
-4.148284, 3, -6.478442, 0, -0.5, 0.5, 0.5,
-4.148284, 3, -6.478442, 1, -0.5, 0.5, 0.5,
-4.148284, 3, -6.478442, 1, 1.5, 0.5, 0.5,
-4.148284, 3, -6.478442, 0, 1.5, 0.5, 0.5
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
-3.578132, -3.908002, -4,
-3.578132, -3.908002, 4,
-3.578132, -3.908002, -4,
-3.768183, -4.083718, -4,
-3.578132, -3.908002, -2,
-3.768183, -4.083718, -2,
-3.578132, -3.908002, 0,
-3.768183, -4.083718, 0,
-3.578132, -3.908002, 2,
-3.768183, -4.083718, 2,
-3.578132, -3.908002, 4,
-3.768183, -4.083718, 4
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
-4.148284, -4.43515, -4, 0, -0.5, 0.5, 0.5,
-4.148284, -4.43515, -4, 1, -0.5, 0.5, 0.5,
-4.148284, -4.43515, -4, 1, 1.5, 0.5, 0.5,
-4.148284, -4.43515, -4, 0, 1.5, 0.5, 0.5,
-4.148284, -4.43515, -2, 0, -0.5, 0.5, 0.5,
-4.148284, -4.43515, -2, 1, -0.5, 0.5, 0.5,
-4.148284, -4.43515, -2, 1, 1.5, 0.5, 0.5,
-4.148284, -4.43515, -2, 0, 1.5, 0.5, 0.5,
-4.148284, -4.43515, 0, 0, -0.5, 0.5, 0.5,
-4.148284, -4.43515, 0, 1, -0.5, 0.5, 0.5,
-4.148284, -4.43515, 0, 1, 1.5, 0.5, 0.5,
-4.148284, -4.43515, 0, 0, 1.5, 0.5, 0.5,
-4.148284, -4.43515, 2, 0, -0.5, 0.5, 0.5,
-4.148284, -4.43515, 2, 1, -0.5, 0.5, 0.5,
-4.148284, -4.43515, 2, 1, 1.5, 0.5, 0.5,
-4.148284, -4.43515, 2, 0, 1.5, 0.5, 0.5,
-4.148284, -4.43515, 4, 0, -0.5, 0.5, 0.5,
-4.148284, -4.43515, 4, 1, -0.5, 0.5, 0.5,
-4.148284, -4.43515, 4, 1, 1.5, 0.5, 0.5,
-4.148284, -4.43515, 4, 0, 1.5, 0.5, 0.5
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
-3.578132, -3.908002, -5.637732,
-3.578132, 3.120636, -5.637732,
-3.578132, -3.908002, 5.571743,
-3.578132, 3.120636, 5.571743,
-3.578132, -3.908002, -5.637732,
-3.578132, -3.908002, 5.571743,
-3.578132, 3.120636, -5.637732,
-3.578132, 3.120636, 5.571743,
-3.578132, -3.908002, -5.637732,
4.023904, -3.908002, -5.637732,
-3.578132, -3.908002, 5.571743,
4.023904, -3.908002, 5.571743,
-3.578132, 3.120636, -5.637732,
4.023904, 3.120636, -5.637732,
-3.578132, 3.120636, 5.571743,
4.023904, 3.120636, 5.571743,
4.023904, -3.908002, -5.637732,
4.023904, 3.120636, -5.637732,
4.023904, -3.908002, 5.571743,
4.023904, 3.120636, 5.571743,
4.023904, -3.908002, -5.637732,
4.023904, -3.908002, 5.571743,
4.023904, 3.120636, -5.637732,
4.023904, 3.120636, 5.571743
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
var radius = 8.148149;
var distance = 36.25203;
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
mvMatrix.translate( -0.2228862, 0.393683, 0.03299427 );
mvMatrix.scale( 1.158892, 1.253435, 0.7859367 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.25203);
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
imidacloprid<-read.table("imidacloprid.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-imidacloprid$V2
```

```
## Error in eval(expr, envir, enclos): object 'imidacloprid' not found
```

```r
y<-imidacloprid$V3
```

```
## Error in eval(expr, envir, enclos): object 'imidacloprid' not found
```

```r
z<-imidacloprid$V4
```

```
## Error in eval(expr, envir, enclos): object 'imidacloprid' not found
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
-3.467422, 0.5707796, -1.882689, 0, 0, 1, 1, 1,
-2.88174, 1.012375, -1.05368, 1, 0, 0, 1, 1,
-2.783715, 0.4061977, -1.818189, 1, 0, 0, 1, 1,
-2.638592, -1.066868, -2.91256, 1, 0, 0, 1, 1,
-2.607381, -0.002120913, -0.655551, 1, 0, 0, 1, 1,
-2.607059, 2.27426, -0.7376003, 1, 0, 0, 1, 1,
-2.54396, 0.579675, -0.428047, 0, 0, 0, 1, 1,
-2.537225, -0.3500412, -1.774464, 0, 0, 0, 1, 1,
-2.431179, 1.070338, -0.599815, 0, 0, 0, 1, 1,
-2.425776, 1.173054, -1.863874, 0, 0, 0, 1, 1,
-2.402953, 1.886919, -1.072471, 0, 0, 0, 1, 1,
-2.360768, 1.186689, 0.3674606, 0, 0, 0, 1, 1,
-2.323405, 0.6639102, 0.4177636, 0, 0, 0, 1, 1,
-2.248819, -0.3667012, -3.313339, 1, 1, 1, 1, 1,
-2.24833, -0.6324146, -2.749573, 1, 1, 1, 1, 1,
-2.197678, -0.4212107, -1.175246, 1, 1, 1, 1, 1,
-2.182456, 0.4138733, -0.1233746, 1, 1, 1, 1, 1,
-2.182385, 1.337093, -2.760174, 1, 1, 1, 1, 1,
-2.139669, 0.2247324, -1.319405, 1, 1, 1, 1, 1,
-2.119974, 0.06653889, -1.076188, 1, 1, 1, 1, 1,
-2.117812, -0.3183355, -2.071414, 1, 1, 1, 1, 1,
-2.087555, -1.669916, -1.483959, 1, 1, 1, 1, 1,
-2.077796, -0.0736789, -0.4805692, 1, 1, 1, 1, 1,
-2.075794, 0.5517836, -0.1128787, 1, 1, 1, 1, 1,
-2.068811, 1.277261, -0.2590703, 1, 1, 1, 1, 1,
-2.025094, -0.9284367, 0.8373932, 1, 1, 1, 1, 1,
-2.006463, 0.1916829, -2.152474, 1, 1, 1, 1, 1,
-1.981597, 0.1011566, -1.367235, 1, 1, 1, 1, 1,
-1.975112, -0.5682324, -1.381264, 0, 0, 1, 1, 1,
-1.968787, 1.510535, -2.448834, 1, 0, 0, 1, 1,
-1.963266, 1.322708, -3.726168, 1, 0, 0, 1, 1,
-1.960076, 1.41864, -1.638755, 1, 0, 0, 1, 1,
-1.942439, -0.4956785, -0.2146733, 1, 0, 0, 1, 1,
-1.937311, 0.06392693, -2.191721, 1, 0, 0, 1, 1,
-1.93311, 1.709081, 0.8227478, 0, 0, 0, 1, 1,
-1.931111, 1.420744, 0.8565115, 0, 0, 0, 1, 1,
-1.928632, 0.06600272, -1.09831, 0, 0, 0, 1, 1,
-1.917754, 0.1214544, -0.3493888, 0, 0, 0, 1, 1,
-1.91238, -0.1712932, -2.171513, 0, 0, 0, 1, 1,
-1.904757, -0.7836516, -1.595062, 0, 0, 0, 1, 1,
-1.89882, 1.970676, -0.2582883, 0, 0, 0, 1, 1,
-1.898634, -0.319117, -0.8657753, 1, 1, 1, 1, 1,
-1.884821, 1.419732, -1.686902, 1, 1, 1, 1, 1,
-1.851433, -0.7203811, -2.199584, 1, 1, 1, 1, 1,
-1.849385, 1.408181, -1.624291, 1, 1, 1, 1, 1,
-1.844611, 0.4737399, -1.528473, 1, 1, 1, 1, 1,
-1.836565, -0.4271355, -1.930909, 1, 1, 1, 1, 1,
-1.830241, -0.1795941, -2.990462, 1, 1, 1, 1, 1,
-1.821855, -1.868783, -1.881872, 1, 1, 1, 1, 1,
-1.818823, 0.1090008, -2.37669, 1, 1, 1, 1, 1,
-1.816484, -0.2165767, 0.08128089, 1, 1, 1, 1, 1,
-1.809013, -1.134073, -3.720395, 1, 1, 1, 1, 1,
-1.768347, -0.3673032, -0.2472668, 1, 1, 1, 1, 1,
-1.745536, -1.396451, -2.935654, 1, 1, 1, 1, 1,
-1.736114, 0.1460839, -0.5647512, 1, 1, 1, 1, 1,
-1.73287, 0.02881726, -0.8883203, 1, 1, 1, 1, 1,
-1.715533, 1.796101, -0.356191, 0, 0, 1, 1, 1,
-1.712949, -0.6446869, -1.314155, 1, 0, 0, 1, 1,
-1.712565, -0.6965573, -1.281193, 1, 0, 0, 1, 1,
-1.705279, 0.723444, -2.213549, 1, 0, 0, 1, 1,
-1.700964, 2.138924, -0.1655894, 1, 0, 0, 1, 1,
-1.680403, 1.000489, -3.695057, 1, 0, 0, 1, 1,
-1.679727, -0.5498242, -0.1370958, 0, 0, 0, 1, 1,
-1.678569, 0.2264956, -0.8109763, 0, 0, 0, 1, 1,
-1.651923, 0.7633389, -2.058256, 0, 0, 0, 1, 1,
-1.628763, -0.3178378, -1.687246, 0, 0, 0, 1, 1,
-1.609743, -1.271634, -2.485338, 0, 0, 0, 1, 1,
-1.556957, 0.7171005, -0.8693678, 0, 0, 0, 1, 1,
-1.556292, 1.622135, -1.045295, 0, 0, 0, 1, 1,
-1.535804, -2.036808, -2.402342, 1, 1, 1, 1, 1,
-1.520303, 1.121443, -2.667357, 1, 1, 1, 1, 1,
-1.517426, -0.8431478, -3.037572, 1, 1, 1, 1, 1,
-1.516075, 0.3711345, -1.124501, 1, 1, 1, 1, 1,
-1.504978, 2.258242, -0.9227113, 1, 1, 1, 1, 1,
-1.500227, 0.544866, -3.633396, 1, 1, 1, 1, 1,
-1.499927, -2.403236, -2.905385, 1, 1, 1, 1, 1,
-1.499926, 0.8085784, -1.58909, 1, 1, 1, 1, 1,
-1.489941, 1.357523, -1.50438, 1, 1, 1, 1, 1,
-1.484956, -0.2176351, -1.860229, 1, 1, 1, 1, 1,
-1.477112, -1.132829, -3.829024, 1, 1, 1, 1, 1,
-1.470374, 1.787778, -2.437226, 1, 1, 1, 1, 1,
-1.438685, 1.201016, -2.565663, 1, 1, 1, 1, 1,
-1.438059, -1.281269, -0.4002962, 1, 1, 1, 1, 1,
-1.435711, -0.8245869, -1.204116, 1, 1, 1, 1, 1,
-1.435543, -1.206527, -4.989696, 0, 0, 1, 1, 1,
-1.433904, -0.1599485, -2.722528, 1, 0, 0, 1, 1,
-1.431803, -0.972576, -1.371727, 1, 0, 0, 1, 1,
-1.422325, 0.4273082, 0.04980876, 1, 0, 0, 1, 1,
-1.414816, 0.8953118, -1.696022, 1, 0, 0, 1, 1,
-1.411965, -1.589164, -3.867321, 1, 0, 0, 1, 1,
-1.397444, -0.7480028, -1.664457, 0, 0, 0, 1, 1,
-1.396058, 0.285542, -1.876841, 0, 0, 0, 1, 1,
-1.382809, -0.1709424, -0.4036138, 0, 0, 0, 1, 1,
-1.364633, -0.6890731, -1.901636, 0, 0, 0, 1, 1,
-1.363813, -1.191694, -1.947447, 0, 0, 0, 1, 1,
-1.357574, 1.801865, -1.811828, 0, 0, 0, 1, 1,
-1.35678, 0.06663482, -0.7235987, 0, 0, 0, 1, 1,
-1.342041, -0.4655522, -1.616678, 1, 1, 1, 1, 1,
-1.340442, -0.4975848, -1.423518, 1, 1, 1, 1, 1,
-1.338037, -0.6392093, -0.4931063, 1, 1, 1, 1, 1,
-1.326504, -0.6558492, -2.216123, 1, 1, 1, 1, 1,
-1.325378, 0.5950553, -1.748405, 1, 1, 1, 1, 1,
-1.323368, 0.7459359, -0.2342941, 1, 1, 1, 1, 1,
-1.308529, -0.7946787, -2.954125, 1, 1, 1, 1, 1,
-1.304438, -0.3531124, -0.6279893, 1, 1, 1, 1, 1,
-1.299643, 0.5954223, -2.163918, 1, 1, 1, 1, 1,
-1.296752, 0.318554, -1.848064, 1, 1, 1, 1, 1,
-1.290251, 0.532375, -1.720255, 1, 1, 1, 1, 1,
-1.288613, 1.259802, -0.3200757, 1, 1, 1, 1, 1,
-1.286937, -0.5829502, -1.447021, 1, 1, 1, 1, 1,
-1.280537, -0.7933615, -2.939957, 1, 1, 1, 1, 1,
-1.277578, 0.02677557, -2.390446, 1, 1, 1, 1, 1,
-1.270698, -2.217189, -2.790964, 0, 0, 1, 1, 1,
-1.268332, -1.51131, -3.296032, 1, 0, 0, 1, 1,
-1.268308, -0.4786665, -2.375283, 1, 0, 0, 1, 1,
-1.266884, 1.740844, 0.8083414, 1, 0, 0, 1, 1,
-1.24918, 0.9605759, -0.9319677, 1, 0, 0, 1, 1,
-1.247531, 1.488585, -1.459405, 1, 0, 0, 1, 1,
-1.246156, 0.2961267, -0.2230087, 0, 0, 0, 1, 1,
-1.245987, 0.6991813, -1.42563, 0, 0, 0, 1, 1,
-1.245063, 0.4906697, -1.368904, 0, 0, 0, 1, 1,
-1.227209, 0.4290658, -1.188673, 0, 0, 0, 1, 1,
-1.225552, -0.6239949, 0.4238649, 0, 0, 0, 1, 1,
-1.222499, -0.8325497, -1.490161, 0, 0, 0, 1, 1,
-1.217764, 0.2513983, 0.2185365, 0, 0, 0, 1, 1,
-1.216259, -0.7819509, -2.031251, 1, 1, 1, 1, 1,
-1.212443, -0.2476984, -2.010806, 1, 1, 1, 1, 1,
-1.197097, -0.01421218, -1.906668, 1, 1, 1, 1, 1,
-1.191168, 0.2196871, -1.747752, 1, 1, 1, 1, 1,
-1.185048, 0.1151915, -1.853076, 1, 1, 1, 1, 1,
-1.180591, -0.7607929, -1.819641, 1, 1, 1, 1, 1,
-1.180115, -0.7272534, -1.437876, 1, 1, 1, 1, 1,
-1.177814, 0.2768355, -3.804039, 1, 1, 1, 1, 1,
-1.176188, -0.4060498, -2.220977, 1, 1, 1, 1, 1,
-1.173002, 2.074266, -0.7174001, 1, 1, 1, 1, 1,
-1.168728, 0.3446127, -1.646786, 1, 1, 1, 1, 1,
-1.16603, 0.08398691, -1.479644, 1, 1, 1, 1, 1,
-1.162211, 0.6367236, -1.249289, 1, 1, 1, 1, 1,
-1.149711, 0.2282115, -1.825534, 1, 1, 1, 1, 1,
-1.148424, -1.72639, -4.568745, 1, 1, 1, 1, 1,
-1.134379, -0.9256136, -1.951245, 0, 0, 1, 1, 1,
-1.13214, -0.6892474, -1.279066, 1, 0, 0, 1, 1,
-1.117058, -0.4573596, -2.385164, 1, 0, 0, 1, 1,
-1.102209, -0.5309311, -1.67275, 1, 0, 0, 1, 1,
-1.100382, -1.627182, -1.191649, 1, 0, 0, 1, 1,
-1.095015, 1.285944, 0.2918462, 1, 0, 0, 1, 1,
-1.094172, -1.204495, -0.214583, 0, 0, 0, 1, 1,
-1.090608, -1.452468, -2.231462, 0, 0, 0, 1, 1,
-1.086107, 0.7526016, -1.693562, 0, 0, 0, 1, 1,
-1.081279, -2.459878, -0.4598536, 0, 0, 0, 1, 1,
-1.077896, -0.8775731, -4.256456, 0, 0, 0, 1, 1,
-1.075448, 2.48648, 0.0335887, 0, 0, 0, 1, 1,
-1.073456, 0.769447, -2.24194, 0, 0, 0, 1, 1,
-1.065162, 0.05306003, -1.727703, 1, 1, 1, 1, 1,
-1.054581, -0.1544388, -3.188221, 1, 1, 1, 1, 1,
-1.050633, 0.03193046, -1.601181, 1, 1, 1, 1, 1,
-1.041124, 0.5630766, -0.9443349, 1, 1, 1, 1, 1,
-1.03696, -0.5913717, -0.9004034, 1, 1, 1, 1, 1,
-1.025733, -1.955507, -1.695747, 1, 1, 1, 1, 1,
-1.010153, 0.03347375, -2.063469, 1, 1, 1, 1, 1,
-0.9995568, -1.137871, -2.561189, 1, 1, 1, 1, 1,
-0.999227, -0.04623374, -0.4755087, 1, 1, 1, 1, 1,
-0.9931313, -0.4031385, -2.618539, 1, 1, 1, 1, 1,
-0.9837341, -0.3937789, -1.651168, 1, 1, 1, 1, 1,
-0.9829645, -2.098259, -3.782047, 1, 1, 1, 1, 1,
-0.9797007, -1.426256, -1.78447, 1, 1, 1, 1, 1,
-0.9775675, 0.08410015, 0.004639978, 1, 1, 1, 1, 1,
-0.9732357, -0.3822986, -1.63255, 1, 1, 1, 1, 1,
-0.9685694, -1.178823, -2.457621, 0, 0, 1, 1, 1,
-0.9673238, 0.3540637, -0.08212715, 1, 0, 0, 1, 1,
-0.9659025, -0.9640119, -2.626263, 1, 0, 0, 1, 1,
-0.9647097, 2.355941, 0.1739446, 1, 0, 0, 1, 1,
-0.9599934, 0.3721813, -0.9186562, 1, 0, 0, 1, 1,
-0.9572111, -0.3401839, -2.181087, 1, 0, 0, 1, 1,
-0.9533448, -1.033021, -2.219277, 0, 0, 0, 1, 1,
-0.9530311, 0.6951374, -1.071501, 0, 0, 0, 1, 1,
-0.9482808, -0.8544524, -2.60924, 0, 0, 0, 1, 1,
-0.9444807, -0.04872669, -1.665657, 0, 0, 0, 1, 1,
-0.9434798, -0.03298672, -1.417856, 0, 0, 0, 1, 1,
-0.9389558, 0.5897334, -0.1165892, 0, 0, 0, 1, 1,
-0.9342871, -0.3727087, -2.658711, 0, 0, 0, 1, 1,
-0.9332363, 2.610711, -0.1509484, 1, 1, 1, 1, 1,
-0.9259246, -0.3983326, 0.204429, 1, 1, 1, 1, 1,
-0.9239492, 1.409601, -1.034419, 1, 1, 1, 1, 1,
-0.9216473, 0.06285573, -2.700751, 1, 1, 1, 1, 1,
-0.9165738, -0.4515173, -3.011867, 1, 1, 1, 1, 1,
-0.9014442, -1.145015, -1.33518, 1, 1, 1, 1, 1,
-0.9011962, 0.2754729, -2.561903, 1, 1, 1, 1, 1,
-0.9010137, -2.235886, -2.466255, 1, 1, 1, 1, 1,
-0.9000167, 0.3729088, -1.662006, 1, 1, 1, 1, 1,
-0.8954051, -1.331488, -2.61985, 1, 1, 1, 1, 1,
-0.8905653, 1.430891, -0.6614571, 1, 1, 1, 1, 1,
-0.8819981, 0.8672926, -1.814506, 1, 1, 1, 1, 1,
-0.8757796, 0.1668283, -0.861204, 1, 1, 1, 1, 1,
-0.872423, -0.8176951, -1.743566, 1, 1, 1, 1, 1,
-0.8691714, 0.638298, -1.194692, 1, 1, 1, 1, 1,
-0.8592834, -1.005286, -1.010372, 0, 0, 1, 1, 1,
-0.8567907, 0.1752237, 0.3456672, 1, 0, 0, 1, 1,
-0.8545755, -1.873172, -3.6046, 1, 0, 0, 1, 1,
-0.8528157, 2.192108, -0.9796818, 1, 0, 0, 1, 1,
-0.8520094, 0.7251747, -1.114276, 1, 0, 0, 1, 1,
-0.8515054, -0.3427411, -2.710352, 1, 0, 0, 1, 1,
-0.8482119, -1.396574, -1.950587, 0, 0, 0, 1, 1,
-0.8474249, 0.6271971, 1.279844, 0, 0, 0, 1, 1,
-0.8453083, -0.7479963, -3.33633, 0, 0, 0, 1, 1,
-0.8431168, 0.7197445, -1.645664, 0, 0, 0, 1, 1,
-0.8394139, -1.728952, -2.269978, 0, 0, 0, 1, 1,
-0.8335755, -0.849376, -1.415126, 0, 0, 0, 1, 1,
-0.8308432, -2.324646, -2.483739, 0, 0, 0, 1, 1,
-0.8231966, 1.567385, -0.9115634, 1, 1, 1, 1, 1,
-0.8227678, 0.08394936, -1.577006, 1, 1, 1, 1, 1,
-0.8199949, -0.0686779, -2.027259, 1, 1, 1, 1, 1,
-0.818683, -0.6494533, -0.6406145, 1, 1, 1, 1, 1,
-0.817964, 0.626289, 0.4878392, 1, 1, 1, 1, 1,
-0.8145062, 0.639934, -1.769919, 1, 1, 1, 1, 1,
-0.8098537, 1.87615, 0.4245515, 1, 1, 1, 1, 1,
-0.8090202, -0.445139, -1.744761, 1, 1, 1, 1, 1,
-0.8048319, -1.154528, -5.354823, 1, 1, 1, 1, 1,
-0.8046591, 0.5908595, -0.6037249, 1, 1, 1, 1, 1,
-0.8042173, -0.7727392, -2.084391, 1, 1, 1, 1, 1,
-0.8036464, -0.1338031, -1.217545, 1, 1, 1, 1, 1,
-0.7999297, -0.674339, -0.772483, 1, 1, 1, 1, 1,
-0.7997366, -1.622939, -4.032428, 1, 1, 1, 1, 1,
-0.7969028, -0.7802721, -2.598987, 1, 1, 1, 1, 1,
-0.7955655, 0.008757034, -2.200053, 0, 0, 1, 1, 1,
-0.7843295, 1.020724, -0.04482438, 1, 0, 0, 1, 1,
-0.7832205, 0.7801012, -1.172652, 1, 0, 0, 1, 1,
-0.780144, -0.3212745, -1.385934, 1, 0, 0, 1, 1,
-0.7772666, -0.6004587, -2.563894, 1, 0, 0, 1, 1,
-0.7766676, 1.078232, -1.900878, 1, 0, 0, 1, 1,
-0.7579342, -0.07992122, -1.645197, 0, 0, 0, 1, 1,
-0.752764, -0.9994055, -2.272186, 0, 0, 0, 1, 1,
-0.7425369, -0.5293291, -2.138574, 0, 0, 0, 1, 1,
-0.7384356, -1.944149, -2.613492, 0, 0, 0, 1, 1,
-0.7365289, 0.8459967, -0.5247663, 0, 0, 0, 1, 1,
-0.7352611, -0.8838993, -2.61929, 0, 0, 0, 1, 1,
-0.7307148, -0.5327862, -2.729094, 0, 0, 0, 1, 1,
-0.7244087, 0.6184383, -1.533005, 1, 1, 1, 1, 1,
-0.7238652, 0.8042352, -0.2725084, 1, 1, 1, 1, 1,
-0.7224244, 0.3338678, -2.389847, 1, 1, 1, 1, 1,
-0.717521, 0.5281304, -1.789357, 1, 1, 1, 1, 1,
-0.717126, 0.7131019, -3.932911, 1, 1, 1, 1, 1,
-0.714217, 0.3459122, -2.378788, 1, 1, 1, 1, 1,
-0.7127607, -0.4229551, -2.206045, 1, 1, 1, 1, 1,
-0.7091379, 0.9915773, -0.0120527, 1, 1, 1, 1, 1,
-0.7054273, 0.5149638, -2.91263, 1, 1, 1, 1, 1,
-0.7049183, 0.1783575, -1.098992, 1, 1, 1, 1, 1,
-0.7040457, -1.071148, -3.293082, 1, 1, 1, 1, 1,
-0.7010291, -1.469184, -2.189328, 1, 1, 1, 1, 1,
-0.6995398, -0.5494899, -3.653201, 1, 1, 1, 1, 1,
-0.6968956, 2.162532, 0.6567502, 1, 1, 1, 1, 1,
-0.6953365, -0.9448269, -2.352957, 1, 1, 1, 1, 1,
-0.6897742, 0.7881956, -0.2421486, 0, 0, 1, 1, 1,
-0.6891449, 1.328666, 0.9467904, 1, 0, 0, 1, 1,
-0.6869913, -1.242756, -2.297089, 1, 0, 0, 1, 1,
-0.6785149, 0.7519162, -1.208662, 1, 0, 0, 1, 1,
-0.6761602, 0.2352715, -1.706392, 1, 0, 0, 1, 1,
-0.672314, -1.354413, -0.5813849, 1, 0, 0, 1, 1,
-0.6625789, -1.236838, -2.748291, 0, 0, 0, 1, 1,
-0.6610593, 0.5514758, -1.113948, 0, 0, 0, 1, 1,
-0.6561741, 0.1646049, -1.049667, 0, 0, 0, 1, 1,
-0.6523415, 1.029708, 0.3568133, 0, 0, 0, 1, 1,
-0.6506954, -0.5147964, -0.1885549, 0, 0, 0, 1, 1,
-0.6478428, 0.1696647, -1.160611, 0, 0, 0, 1, 1,
-0.646686, -1.131296, -0.07596657, 0, 0, 0, 1, 1,
-0.6464774, -1.079448, -0.7670487, 1, 1, 1, 1, 1,
-0.6456045, 1.764499, 0.1569168, 1, 1, 1, 1, 1,
-0.6439697, -0.146056, -1.029239, 1, 1, 1, 1, 1,
-0.6401213, 0.9185717, 0.2484297, 1, 1, 1, 1, 1,
-0.6236577, -1.336505, -2.321503, 1, 1, 1, 1, 1,
-0.6188684, -1.572225, -1.713275, 1, 1, 1, 1, 1,
-0.6112011, -0.6476763, -2.520199, 1, 1, 1, 1, 1,
-0.6087734, -2.530094, -1.20193, 1, 1, 1, 1, 1,
-0.608536, 0.6901606, -0.2391346, 1, 1, 1, 1, 1,
-0.5987099, -0.3445617, -1.824124, 1, 1, 1, 1, 1,
-0.5973649, -1.277817, -3.075171, 1, 1, 1, 1, 1,
-0.5910935, 0.3451014, -2.264183, 1, 1, 1, 1, 1,
-0.5795712, 0.6460187, -1.20006, 1, 1, 1, 1, 1,
-0.578589, -1.052288, -1.055244, 1, 1, 1, 1, 1,
-0.5708083, -0.4000734, -2.440468, 1, 1, 1, 1, 1,
-0.569649, 0.9243156, -0.7662561, 0, 0, 1, 1, 1,
-0.5649768, -1.489309, -2.758341, 1, 0, 0, 1, 1,
-0.5555664, -0.389435, -0.5652805, 1, 0, 0, 1, 1,
-0.5533129, -0.8143932, -3.651983, 1, 0, 0, 1, 1,
-0.551756, -0.3214807, -1.309251, 1, 0, 0, 1, 1,
-0.5472519, 0.9701295, 0.1435762, 1, 0, 0, 1, 1,
-0.5431472, 1.184934, 0.3107832, 0, 0, 0, 1, 1,
-0.5392863, 0.8142623, -0.8349738, 0, 0, 0, 1, 1,
-0.539158, -0.5321234, -1.31458, 0, 0, 0, 1, 1,
-0.5389667, -0.1797475, -1.887164, 0, 0, 0, 1, 1,
-0.5374632, -1.056772, -2.557769, 0, 0, 0, 1, 1,
-0.5366482, 1.098733, -1.888255, 0, 0, 0, 1, 1,
-0.5358499, -0.4707602, -4.685978, 0, 0, 0, 1, 1,
-0.5230327, -0.7220936, -1.623788, 1, 1, 1, 1, 1,
-0.5220907, -1.25077, -4.447576, 1, 1, 1, 1, 1,
-0.5174842, -0.5104407, -2.754869, 1, 1, 1, 1, 1,
-0.5155548, 0.02056652, -1.471735, 1, 1, 1, 1, 1,
-0.513058, -0.8291721, -2.348644, 1, 1, 1, 1, 1,
-0.5113466, 1.992517, -0.2657279, 1, 1, 1, 1, 1,
-0.5102786, 1.065972, -2.563857, 1, 1, 1, 1, 1,
-0.504521, 1.087048, -1.747434, 1, 1, 1, 1, 1,
-0.5033584, -0.6124169, -2.397902, 1, 1, 1, 1, 1,
-0.4994734, -0.7115629, -1.336996, 1, 1, 1, 1, 1,
-0.4970527, 0.2981865, -1.735905, 1, 1, 1, 1, 1,
-0.4938415, 0.4741927, -1.213594, 1, 1, 1, 1, 1,
-0.4910852, -1.085056, -1.974968, 1, 1, 1, 1, 1,
-0.4892868, 0.6967786, -1.918091, 1, 1, 1, 1, 1,
-0.4851084, 0.7183337, 0.3894429, 1, 1, 1, 1, 1,
-0.4779194, -0.03347373, -2.328473, 0, 0, 1, 1, 1,
-0.4757222, 0.1862622, -0.3258609, 1, 0, 0, 1, 1,
-0.4745663, -0.003594081, 0.7313327, 1, 0, 0, 1, 1,
-0.4727785, 0.5849296, 0.1436646, 1, 0, 0, 1, 1,
-0.472354, 1.411876, -0.4570222, 1, 0, 0, 1, 1,
-0.4720301, -0.6338972, -2.475676, 1, 0, 0, 1, 1,
-0.4701489, -0.8500943, -1.473828, 0, 0, 0, 1, 1,
-0.4692503, 0.9700356, 0.01946685, 0, 0, 0, 1, 1,
-0.4684865, 0.3498442, -0.9540548, 0, 0, 0, 1, 1,
-0.4681503, 0.7487007, -0.1894182, 0, 0, 0, 1, 1,
-0.4680105, 0.2261546, -1.19445, 0, 0, 0, 1, 1,
-0.4604586, -0.05426606, -2.687835, 0, 0, 0, 1, 1,
-0.4536341, 0.3269687, -0.2551589, 0, 0, 0, 1, 1,
-0.4493215, -0.4658097, -2.385849, 1, 1, 1, 1, 1,
-0.447797, 1.373321, -0.8084378, 1, 1, 1, 1, 1,
-0.4467021, 0.5870611, -1.396409, 1, 1, 1, 1, 1,
-0.4451876, -0.3275166, -1.412837, 1, 1, 1, 1, 1,
-0.4439808, -0.7064093, -2.099643, 1, 1, 1, 1, 1,
-0.442424, -1.469792, -1.414919, 1, 1, 1, 1, 1,
-0.4267999, -0.8154089, -2.416889, 1, 1, 1, 1, 1,
-0.4254451, 0.02339696, -0.8009248, 1, 1, 1, 1, 1,
-0.4244719, 0.566999, 0.1774537, 1, 1, 1, 1, 1,
-0.4210683, -0.1250852, -2.572595, 1, 1, 1, 1, 1,
-0.4193181, -0.6506258, -2.044091, 1, 1, 1, 1, 1,
-0.4192599, -1.502735, -0.8860274, 1, 1, 1, 1, 1,
-0.4142434, -2.306175, -4.879376, 1, 1, 1, 1, 1,
-0.4126321, 0.334828, 0.1917953, 1, 1, 1, 1, 1,
-0.4091956, 0.1352911, -2.210761, 1, 1, 1, 1, 1,
-0.4060259, -0.2624317, -4.279903, 0, 0, 1, 1, 1,
-0.4024923, -0.7846091, -2.414957, 1, 0, 0, 1, 1,
-0.4019762, 0.06273109, -0.6579421, 1, 0, 0, 1, 1,
-0.4014785, -0.6412019, -2.423782, 1, 0, 0, 1, 1,
-0.4013866, -0.06509599, -2.550538, 1, 0, 0, 1, 1,
-0.3959475, 0.4843502, -0.8521736, 1, 0, 0, 1, 1,
-0.3950966, -0.8045583, -2.762133, 0, 0, 0, 1, 1,
-0.3930829, -0.08872769, -2.127281, 0, 0, 0, 1, 1,
-0.390016, 0.1605977, -2.161807, 0, 0, 0, 1, 1,
-0.3891617, 0.5945713, 0.4817718, 0, 0, 0, 1, 1,
-0.3861279, 0.1577215, -1.87108, 0, 0, 0, 1, 1,
-0.385907, -0.6636001, -1.973241, 0, 0, 0, 1, 1,
-0.381292, 0.3165624, 0.02382188, 0, 0, 0, 1, 1,
-0.3775019, -1.233203, -2.097862, 1, 1, 1, 1, 1,
-0.3764296, 1.087036, -0.6847664, 1, 1, 1, 1, 1,
-0.3736075, 0.904359, 1.539774, 1, 1, 1, 1, 1,
-0.3724146, -0.08183755, -3.19557, 1, 1, 1, 1, 1,
-0.3712077, 1.236541, 1.240751, 1, 1, 1, 1, 1,
-0.3709838, 0.4998547, 0.1595806, 1, 1, 1, 1, 1,
-0.3705921, -0.2430655, -0.3801032, 1, 1, 1, 1, 1,
-0.3632009, 0.1923199, -0.8076261, 1, 1, 1, 1, 1,
-0.3619674, 1.160547, 0.6506197, 1, 1, 1, 1, 1,
-0.360079, 0.2675602, -1.563376, 1, 1, 1, 1, 1,
-0.3538651, -0.3876168, -3.105383, 1, 1, 1, 1, 1,
-0.3492508, 0.8900443, -1.528547, 1, 1, 1, 1, 1,
-0.3484063, 0.2037141, 0.4543678, 1, 1, 1, 1, 1,
-0.3482884, -0.805126, -3.909575, 1, 1, 1, 1, 1,
-0.3456595, 0.7549485, -0.8829134, 1, 1, 1, 1, 1,
-0.3424479, -0.7411365, -3.219764, 0, 0, 1, 1, 1,
-0.3409162, 2.176346, -1.491125, 1, 0, 0, 1, 1,
-0.3394371, 0.4553577, 0.2349303, 1, 0, 0, 1, 1,
-0.3390326, 0.309172, -1.572322, 1, 0, 0, 1, 1,
-0.3346141, -0.0660323, -2.180219, 1, 0, 0, 1, 1,
-0.3342807, 1.248626, 0.3578953, 1, 0, 0, 1, 1,
-0.3270776, 0.9381899, 0.2172104, 0, 0, 0, 1, 1,
-0.3262448, 0.1580864, -0.5843174, 0, 0, 0, 1, 1,
-0.3261406, -0.02395303, -0.8603445, 0, 0, 0, 1, 1,
-0.3182928, -1.512725, -1.684256, 0, 0, 0, 1, 1,
-0.3167164, 1.989244, 0.008092456, 0, 0, 0, 1, 1,
-0.3159452, 0.7026424, -1.025711, 0, 0, 0, 1, 1,
-0.3152638, -0.5727454, -3.016506, 0, 0, 0, 1, 1,
-0.3142439, -1.771783, -1.995841, 1, 1, 1, 1, 1,
-0.3127407, 0.05571558, -1.725344, 1, 1, 1, 1, 1,
-0.3109133, -0.4500576, -2.689821, 1, 1, 1, 1, 1,
-0.3078474, 0.9453802, 0.2731744, 1, 1, 1, 1, 1,
-0.3064091, 0.06953488, -1.337009, 1, 1, 1, 1, 1,
-0.3041356, 3.018277, 0.6457804, 1, 1, 1, 1, 1,
-0.3020497, 0.3341058, -2.480239, 1, 1, 1, 1, 1,
-0.2980953, 0.04170924, -1.295599, 1, 1, 1, 1, 1,
-0.2948903, 0.555959, 0.8984295, 1, 1, 1, 1, 1,
-0.2943084, -0.3046187, -1.582972, 1, 1, 1, 1, 1,
-0.2921475, 0.04792217, -2.486452, 1, 1, 1, 1, 1,
-0.2884843, -1.816285, -1.465961, 1, 1, 1, 1, 1,
-0.2882134, 0.589237, -2.049129, 1, 1, 1, 1, 1,
-0.287787, 0.1782538, -2.273713, 1, 1, 1, 1, 1,
-0.2866975, -0.3596478, -3.674968, 1, 1, 1, 1, 1,
-0.2864147, 1.012224, -0.03020111, 0, 0, 1, 1, 1,
-0.2843285, -0.2738883, -4.214096, 1, 0, 0, 1, 1,
-0.2840575, -0.2231409, -3.025456, 1, 0, 0, 1, 1,
-0.2777779, 1.501041, -0.6980848, 1, 0, 0, 1, 1,
-0.2687929, 0.5294407, -1.099648, 1, 0, 0, 1, 1,
-0.2687914, -1.484243, -2.508252, 1, 0, 0, 1, 1,
-0.2685473, 0.5710661, -0.7399967, 0, 0, 0, 1, 1,
-0.2682027, -0.326232, -2.595726, 0, 0, 0, 1, 1,
-0.2657875, 0.953889, 1.749215, 0, 0, 0, 1, 1,
-0.2641706, 1.419273, -2.054241, 0, 0, 0, 1, 1,
-0.2638954, 1.031362, -0.1342964, 0, 0, 0, 1, 1,
-0.2636017, -0.6167895, -3.431423, 0, 0, 0, 1, 1,
-0.2633229, 1.742565, -0.9131994, 0, 0, 0, 1, 1,
-0.2608646, -0.148075, -1.020916, 1, 1, 1, 1, 1,
-0.2576285, 0.1818556, -1.744899, 1, 1, 1, 1, 1,
-0.2564958, 0.8848557, -0.9148213, 1, 1, 1, 1, 1,
-0.2560278, -1.626988, -2.819076, 1, 1, 1, 1, 1,
-0.2419586, -0.1728678, -3.31917, 1, 1, 1, 1, 1,
-0.2358315, 0.9837143, -0.4125881, 1, 1, 1, 1, 1,
-0.2339042, -0.2324482, -4.122114, 1, 1, 1, 1, 1,
-0.2297803, 2.543874, -0.7026855, 1, 1, 1, 1, 1,
-0.2291746, 1.610545, 0.1488037, 1, 1, 1, 1, 1,
-0.229135, -1.017906, -4.271981, 1, 1, 1, 1, 1,
-0.2250066, 0.3539808, 0.4800211, 1, 1, 1, 1, 1,
-0.223348, -0.4412247, -2.690666, 1, 1, 1, 1, 1,
-0.2156991, -0.3090492, -2.624483, 1, 1, 1, 1, 1,
-0.2118697, -0.05771004, -1.160717, 1, 1, 1, 1, 1,
-0.2097876, 0.4799522, -0.3696333, 1, 1, 1, 1, 1,
-0.2087128, 0.3718033, 1.384532, 0, 0, 1, 1, 1,
-0.2065202, -0.1638065, -1.545545, 1, 0, 0, 1, 1,
-0.2024952, -0.4767742, -4.058294, 1, 0, 0, 1, 1,
-0.2006766, 0.6168354, -0.06711457, 1, 0, 0, 1, 1,
-0.1992137, 1.436554, -1.602695, 1, 0, 0, 1, 1,
-0.1986947, 0.6426785, 0.7913576, 1, 0, 0, 1, 1,
-0.1975356, 1.101021, 0.1724301, 0, 0, 0, 1, 1,
-0.1963365, 0.264194, 0.4063139, 0, 0, 0, 1, 1,
-0.1962108, 0.544454, -0.3065853, 0, 0, 0, 1, 1,
-0.1945081, 1.157057, -1.630957, 0, 0, 0, 1, 1,
-0.1937685, 0.434211, 0.1563512, 0, 0, 0, 1, 1,
-0.1936467, -0.2200561, -2.959526, 0, 0, 0, 1, 1,
-0.1927753, 0.3858873, -0.8809425, 0, 0, 0, 1, 1,
-0.1920083, 1.170812, -1.121104, 1, 1, 1, 1, 1,
-0.1885885, -0.1174465, -3.794821, 1, 1, 1, 1, 1,
-0.1830757, -0.1877932, -2.242383, 1, 1, 1, 1, 1,
-0.1823063, 0.4519223, -0.483578, 1, 1, 1, 1, 1,
-0.1771516, -0.2982329, -3.283037, 1, 1, 1, 1, 1,
-0.1738133, -0.4361227, -1.818488, 1, 1, 1, 1, 1,
-0.1730269, -1.010441, -1.302415, 1, 1, 1, 1, 1,
-0.1696214, 0.5377039, 0.3183565, 1, 1, 1, 1, 1,
-0.1689305, -1.625635, -3.307705, 1, 1, 1, 1, 1,
-0.1623071, -0.9525739, -2.158147, 1, 1, 1, 1, 1,
-0.1622349, -0.8595983, -1.669802, 1, 1, 1, 1, 1,
-0.1597483, 0.1636122, -1.33279, 1, 1, 1, 1, 1,
-0.1582406, -2.104229, -3.570013, 1, 1, 1, 1, 1,
-0.1573666, 1.716892, 0.02767758, 1, 1, 1, 1, 1,
-0.1557333, -0.8709004, -2.6187, 1, 1, 1, 1, 1,
-0.1526567, 0.6255197, -0.372607, 0, 0, 1, 1, 1,
-0.1526171, -1.703573, -3.463329, 1, 0, 0, 1, 1,
-0.1523347, -1.360393, -2.630037, 1, 0, 0, 1, 1,
-0.1459462, -2.054686, -2.297299, 1, 0, 0, 1, 1,
-0.1455429, -0.2126323, -2.598716, 1, 0, 0, 1, 1,
-0.1431964, -0.9565367, -2.792992, 1, 0, 0, 1, 1,
-0.1413699, -0.8709404, -0.6781657, 0, 0, 0, 1, 1,
-0.1387241, 0.6549708, -1.02374, 0, 0, 0, 1, 1,
-0.1345538, 1.060885, -0.5087982, 0, 0, 0, 1, 1,
-0.1318822, -0.5417013, -2.478635, 0, 0, 0, 1, 1,
-0.1317572, 0.2119934, -0.5123803, 0, 0, 0, 1, 1,
-0.129763, 0.07283478, -1.06576, 0, 0, 0, 1, 1,
-0.1293265, 0.3035199, 0.5185856, 0, 0, 0, 1, 1,
-0.1268515, 0.5190971, -0.2934698, 1, 1, 1, 1, 1,
-0.1218533, -1.281524, -1.62792, 1, 1, 1, 1, 1,
-0.1210077, -0.07243488, -2.518692, 1, 1, 1, 1, 1,
-0.1185555, 2.190238, -0.455196, 1, 1, 1, 1, 1,
-0.1181128, 0.3134382, -1.020782, 1, 1, 1, 1, 1,
-0.1150435, 0.2490501, 0.05737228, 1, 1, 1, 1, 1,
-0.1141794, -1.08122, -0.8315602, 1, 1, 1, 1, 1,
-0.09896441, -2.141712, -3.365364, 1, 1, 1, 1, 1,
-0.09235363, -1.003118, -2.95517, 1, 1, 1, 1, 1,
-0.09230687, 0.2102909, -0.2476829, 1, 1, 1, 1, 1,
-0.08931121, 1.000516, -1.73007, 1, 1, 1, 1, 1,
-0.07879873, 0.2500889, 1.103117, 1, 1, 1, 1, 1,
-0.07786577, -0.9344667, -2.057969, 1, 1, 1, 1, 1,
-0.0777824, 1.024358, -0.1587267, 1, 1, 1, 1, 1,
-0.07684939, 0.08326974, -1.30985, 1, 1, 1, 1, 1,
-0.06945419, -0.595663, -1.80295, 0, 0, 1, 1, 1,
-0.06397433, 1.070831, -2.225828, 1, 0, 0, 1, 1,
-0.0615727, 0.02666779, 1.138552, 1, 0, 0, 1, 1,
-0.05681238, -0.3115409, -3.47822, 1, 0, 0, 1, 1,
-0.05020131, -0.728106, -1.691414, 1, 0, 0, 1, 1,
-0.0404432, -1.70461, -2.502873, 1, 0, 0, 1, 1,
-0.03830153, -1.14371, -2.138075, 0, 0, 0, 1, 1,
-0.03817288, 1.063352, -1.926815, 0, 0, 0, 1, 1,
-0.03713112, 1.508733, -1.003523, 0, 0, 0, 1, 1,
-0.03610738, -0.9169648, -3.850143, 0, 0, 0, 1, 1,
-0.03411555, 0.9239238, 0.02995983, 0, 0, 0, 1, 1,
-0.02648549, -1.053503, -5.474487, 0, 0, 0, 1, 1,
-0.02440137, -0.2420784, -4.060309, 0, 0, 0, 1, 1,
-0.0147249, 0.3282745, -0.1635779, 1, 1, 1, 1, 1,
-0.01318021, -1.073084, -2.938468, 1, 1, 1, 1, 1,
-0.01163407, 0.06519721, -0.8234778, 1, 1, 1, 1, 1,
-0.006161838, 0.1442872, -0.2637157, 1, 1, 1, 1, 1,
-0.0009470008, -3.805643, -2.433926, 1, 1, 1, 1, 1,
0.001106783, 1.847128, -1.29899, 1, 1, 1, 1, 1,
0.002241967, 0.523317, -0.2196506, 1, 1, 1, 1, 1,
0.002401897, -0.04586902, 0.967652, 1, 1, 1, 1, 1,
0.004025132, -1.791364, 3.68468, 1, 1, 1, 1, 1,
0.007482933, -1.148936, 1.107248, 1, 1, 1, 1, 1,
0.008299734, 1.496011, 0.7193965, 1, 1, 1, 1, 1,
0.008303272, -0.873767, 4.695565, 1, 1, 1, 1, 1,
0.009711153, -0.01158681, 2.478938, 1, 1, 1, 1, 1,
0.01154075, 1.444957, 1.211951, 1, 1, 1, 1, 1,
0.01155205, 0.1491004, -2.317389, 1, 1, 1, 1, 1,
0.01403552, 1.874625, -0.5723345, 0, 0, 1, 1, 1,
0.01667423, 1.094269, -0.1272521, 1, 0, 0, 1, 1,
0.02087019, -0.8562668, 4.232582, 1, 0, 0, 1, 1,
0.02098475, -0.7167808, 3.70852, 1, 0, 0, 1, 1,
0.02107409, -2.16295, 1.682075, 1, 0, 0, 1, 1,
0.023723, 0.5489315, -1.117253, 1, 0, 0, 1, 1,
0.02602787, -0.2553145, 3.122532, 0, 0, 0, 1, 1,
0.03019819, 1.889825, -0.2172007, 0, 0, 0, 1, 1,
0.03118372, -1.000522, 2.502498, 0, 0, 0, 1, 1,
0.03213024, 0.5337997, -0.8609017, 0, 0, 0, 1, 1,
0.03599132, -3.044613, 1.91259, 0, 0, 0, 1, 1,
0.03810335, 0.9656677, -0.490141, 0, 0, 0, 1, 1,
0.03841482, -0.5279814, 2.99882, 0, 0, 0, 1, 1,
0.03997867, 0.6121957, 0.2103179, 1, 1, 1, 1, 1,
0.04083917, -1.111753, 3.653951, 1, 1, 1, 1, 1,
0.04706182, 0.09299207, 0.08198573, 1, 1, 1, 1, 1,
0.05070307, -1.948365, 2.658414, 1, 1, 1, 1, 1,
0.05600244, -0.7337738, 5.139742, 1, 1, 1, 1, 1,
0.0561068, 1.147021, 0.2287366, 1, 1, 1, 1, 1,
0.05955543, -0.3433485, 3.900529, 1, 1, 1, 1, 1,
0.06004667, 0.2329121, -1.800032, 1, 1, 1, 1, 1,
0.06596351, 1.888851, -0.2907575, 1, 1, 1, 1, 1,
0.06720285, 0.4247476, -0.511947, 1, 1, 1, 1, 1,
0.06975552, 0.1747951, -0.8022041, 1, 1, 1, 1, 1,
0.07101425, 0.766795, 1.254702, 1, 1, 1, 1, 1,
0.07170311, -0.1110037, 4.343715, 1, 1, 1, 1, 1,
0.07378186, -0.6376365, 3.258753, 1, 1, 1, 1, 1,
0.07605895, -0.05379934, 1.543387, 1, 1, 1, 1, 1,
0.07673571, 0.5648544, -1.125765, 0, 0, 1, 1, 1,
0.07737806, -1.754528, 3.281695, 1, 0, 0, 1, 1,
0.07872073, -0.1102686, 2.718836, 1, 0, 0, 1, 1,
0.07908152, 0.8517849, 1.579672, 1, 0, 0, 1, 1,
0.07985431, -2.48379, 3.166207, 1, 0, 0, 1, 1,
0.08048429, -0.5616167, 3.630023, 1, 0, 0, 1, 1,
0.08143955, -0.5289567, 3.847594, 0, 0, 0, 1, 1,
0.08358017, 1.685601, -0.006018529, 0, 0, 0, 1, 1,
0.08694895, 0.05766683, 1.556535, 0, 0, 0, 1, 1,
0.08769727, 0.05060202, 1.589374, 0, 0, 0, 1, 1,
0.09030242, -0.05869177, 2.167512, 0, 0, 0, 1, 1,
0.09802232, 0.2112337, -0.8011902, 0, 0, 0, 1, 1,
0.09834808, -1.117756, 3.21737, 0, 0, 0, 1, 1,
0.09883556, 0.08756608, 1.113885, 1, 1, 1, 1, 1,
0.1001389, -1.213062, -0.422081, 1, 1, 1, 1, 1,
0.1035252, 0.2534577, 0.1226429, 1, 1, 1, 1, 1,
0.1054937, 0.4300844, 1.392252, 1, 1, 1, 1, 1,
0.1093247, 0.7886042, 1.604448, 1, 1, 1, 1, 1,
0.1143919, -0.8061081, 3.166506, 1, 1, 1, 1, 1,
0.1158563, 0.5804167, -2.068101, 1, 1, 1, 1, 1,
0.1189332, 0.1345788, -0.4256091, 1, 1, 1, 1, 1,
0.1191935, 0.02247224, 1.353894, 1, 1, 1, 1, 1,
0.1213113, 1.276892, 1.034322, 1, 1, 1, 1, 1,
0.1217438, 0.0150563, 2.257224, 1, 1, 1, 1, 1,
0.1245356, -0.6429681, 0.9402057, 1, 1, 1, 1, 1,
0.1252338, -2.660942, 1.181089, 1, 1, 1, 1, 1,
0.1255796, 0.2111594, -0.274292, 1, 1, 1, 1, 1,
0.1276278, -0.364241, 2.577559, 1, 1, 1, 1, 1,
0.128166, -0.5384274, 2.922698, 0, 0, 1, 1, 1,
0.1286437, -0.5604843, 2.836169, 1, 0, 0, 1, 1,
0.1311085, -1.318795, 3.842243, 1, 0, 0, 1, 1,
0.1340516, -1.324878, 3.769843, 1, 0, 0, 1, 1,
0.1370337, 0.8654482, -0.3147478, 1, 0, 0, 1, 1,
0.1374661, -0.1667969, 2.161977, 1, 0, 0, 1, 1,
0.1401266, -1.399624, 2.83731, 0, 0, 0, 1, 1,
0.1454466, -1.299925, 3.798757, 0, 0, 0, 1, 1,
0.1536165, 0.3774926, 0.1140572, 0, 0, 0, 1, 1,
0.1656735, -0.2742785, 4.261788, 0, 0, 0, 1, 1,
0.1696412, 0.6304541, 0.4719089, 0, 0, 0, 1, 1,
0.1715565, 0.6716052, 0.3570311, 0, 0, 0, 1, 1,
0.1773024, -0.1113276, 1.119094, 0, 0, 0, 1, 1,
0.1774971, -0.1425569, 1.453609, 1, 1, 1, 1, 1,
0.1798235, -1.552414, 2.134659, 1, 1, 1, 1, 1,
0.181396, -0.2207414, 0.5133698, 1, 1, 1, 1, 1,
0.1850898, 0.007508523, 2.771167, 1, 1, 1, 1, 1,
0.1862975, 0.7823903, 0.4072143, 1, 1, 1, 1, 1,
0.1872111, -1.021101, 0.804841, 1, 1, 1, 1, 1,
0.1886843, 2.589124, 0.5858892, 1, 1, 1, 1, 1,
0.191443, -0.02261131, 2.234096, 1, 1, 1, 1, 1,
0.1951322, -0.2016085, 0.2420902, 1, 1, 1, 1, 1,
0.1962203, -0.08946291, -0.1185098, 1, 1, 1, 1, 1,
0.2018367, 0.4292897, 0.7863142, 1, 1, 1, 1, 1,
0.2038679, -0.05012372, 1.724249, 1, 1, 1, 1, 1,
0.204097, 0.5737869, 0.4329281, 1, 1, 1, 1, 1,
0.2075406, -0.7597867, 3.638576, 1, 1, 1, 1, 1,
0.2098662, -1.379927, 3.516302, 1, 1, 1, 1, 1,
0.2124291, -1.269554, 1.911903, 0, 0, 1, 1, 1,
0.2141613, 0.192541, 0.5811592, 1, 0, 0, 1, 1,
0.2179923, -0.8524235, 3.629734, 1, 0, 0, 1, 1,
0.2213097, 0.5914842, 0.5816123, 1, 0, 0, 1, 1,
0.2229567, -1.081957, 1.070843, 1, 0, 0, 1, 1,
0.2243681, 0.1702437, -0.9599029, 1, 0, 0, 1, 1,
0.2286551, -1.169134, 3.039637, 0, 0, 0, 1, 1,
0.2320018, -0.6245275, 1.722742, 0, 0, 0, 1, 1,
0.234265, 0.2516316, 0.5364085, 0, 0, 0, 1, 1,
0.236856, 1.277986, -0.4558507, 0, 0, 0, 1, 1,
0.2414722, -0.3652577, 4.415822, 0, 0, 0, 1, 1,
0.2452049, 0.3693833, 0.6753966, 0, 0, 0, 1, 1,
0.245605, 1.192928, -0.5178469, 0, 0, 0, 1, 1,
0.2456725, 0.7750368, -0.03298119, 1, 1, 1, 1, 1,
0.2474719, 1.038754, 0.06901531, 1, 1, 1, 1, 1,
0.2476359, -0.8421531, 2.046813, 1, 1, 1, 1, 1,
0.250041, 1.303572, 2.213658, 1, 1, 1, 1, 1,
0.2515695, 0.9857724, 0.1871673, 1, 1, 1, 1, 1,
0.251814, -1.92032, 3.372021, 1, 1, 1, 1, 1,
0.2518902, -0.9242227, 2.684681, 1, 1, 1, 1, 1,
0.2609718, 0.6360613, 1.021132, 1, 1, 1, 1, 1,
0.262664, 1.734015, -0.2835184, 1, 1, 1, 1, 1,
0.2639683, 0.8433912, 0.3601339, 1, 1, 1, 1, 1,
0.2657683, 1.528663, 1.957996, 1, 1, 1, 1, 1,
0.2722886, -1.351631, 4.17605, 1, 1, 1, 1, 1,
0.2750984, -0.8095181, 4.733593, 1, 1, 1, 1, 1,
0.2764469, 0.6739188, -0.7077618, 1, 1, 1, 1, 1,
0.2766369, -0.2144171, 3.581007, 1, 1, 1, 1, 1,
0.284749, -0.2795894, 2.12703, 0, 0, 1, 1, 1,
0.2849464, 0.1507446, 1.056501, 1, 0, 0, 1, 1,
0.2979674, 0.8851555, 0.2161855, 1, 0, 0, 1, 1,
0.2986303, -0.3002776, 3.85251, 1, 0, 0, 1, 1,
0.2998643, 2.393514, 0.2842236, 1, 0, 0, 1, 1,
0.3009879, 0.6085583, 0.5204652, 1, 0, 0, 1, 1,
0.3029714, -0.5611727, 2.4878, 0, 0, 0, 1, 1,
0.3057281, -0.05109716, 1.994916, 0, 0, 0, 1, 1,
0.3071955, -0.3449958, 3.197113, 0, 0, 0, 1, 1,
0.3145633, -0.2478616, 2.892483, 0, 0, 0, 1, 1,
0.3155476, -0.976375, 5.324695, 0, 0, 0, 1, 1,
0.3156442, -0.00991597, 2.150151, 0, 0, 0, 1, 1,
0.3172382, -0.09293117, 2.169273, 0, 0, 0, 1, 1,
0.3211986, -2.934649, 2.361717, 1, 1, 1, 1, 1,
0.3237331, 0.03191878, 0.3881565, 1, 1, 1, 1, 1,
0.3253365, -0.3019919, 3.967487, 1, 1, 1, 1, 1,
0.3266927, -0.9182235, 3.871694, 1, 1, 1, 1, 1,
0.3277933, 0.1026882, 1.379502, 1, 1, 1, 1, 1,
0.3303405, -0.06734962, 2.964347, 1, 1, 1, 1, 1,
0.3395206, -0.3601843, 2.700769, 1, 1, 1, 1, 1,
0.3396867, 1.097775, 0.5018913, 1, 1, 1, 1, 1,
0.3428902, -0.7782158, 1.040735, 1, 1, 1, 1, 1,
0.3445214, 1.140014, -0.3253934, 1, 1, 1, 1, 1,
0.3474008, 0.1742037, 1.244758, 1, 1, 1, 1, 1,
0.3477589, 1.363441, 1.123756, 1, 1, 1, 1, 1,
0.3487324, 0.903937, -0.1760729, 1, 1, 1, 1, 1,
0.3504476, 2.084208, -0.4028519, 1, 1, 1, 1, 1,
0.3512608, 0.9340767, -0.2746212, 1, 1, 1, 1, 1,
0.351498, 2.578127, -1.008638, 0, 0, 1, 1, 1,
0.3534762, -0.3468836, 0.4005909, 1, 0, 0, 1, 1,
0.3547198, 0.4925267, -1.38013, 1, 0, 0, 1, 1,
0.3549594, -0.1589793, 2.278233, 1, 0, 0, 1, 1,
0.3630212, 0.8727897, 1.645465, 1, 0, 0, 1, 1,
0.3631215, -0.7563485, 2.472544, 1, 0, 0, 1, 1,
0.3632641, -0.4180099, 0.807422, 0, 0, 0, 1, 1,
0.3722357, -1.71989, 2.603837, 0, 0, 0, 1, 1,
0.3739142, -0.3192408, 2.291883, 0, 0, 0, 1, 1,
0.377516, 0.2540782, 1.704608, 0, 0, 0, 1, 1,
0.3776967, 0.0335826, 5.229548, 0, 0, 0, 1, 1,
0.3856934, 0.1363923, 1.733468, 0, 0, 0, 1, 1,
0.3865445, 0.3128477, -1.228402, 0, 0, 0, 1, 1,
0.3878752, 0.09483217, 1.749026, 1, 1, 1, 1, 1,
0.3915367, -0.4967239, 2.365597, 1, 1, 1, 1, 1,
0.3920178, -0.3237422, 1.989548, 1, 1, 1, 1, 1,
0.3933905, -0.3847885, 2.011337, 1, 1, 1, 1, 1,
0.3936855, -1.603645, -0.05367612, 1, 1, 1, 1, 1,
0.4039963, -0.1635304, 3.058786, 1, 1, 1, 1, 1,
0.4044524, -1.059825, 2.354372, 1, 1, 1, 1, 1,
0.4065602, -0.608542, 1.547504, 1, 1, 1, 1, 1,
0.4100575, -0.4958921, 2.430156, 1, 1, 1, 1, 1,
0.4124275, -1.472849, 4.125205, 1, 1, 1, 1, 1,
0.4136201, 1.651045, 0.368544, 1, 1, 1, 1, 1,
0.4233577, -1.255467, 3.507394, 1, 1, 1, 1, 1,
0.4244763, 1.083488, -0.4611309, 1, 1, 1, 1, 1,
0.4265811, 0.08840197, 2.646878, 1, 1, 1, 1, 1,
0.4276912, -1.87562, 3.583217, 1, 1, 1, 1, 1,
0.4328811, -1.289436, 1.565851, 0, 0, 1, 1, 1,
0.4440103, 1.662235, -1.45813, 1, 0, 0, 1, 1,
0.444499, 0.27703, 1.398985, 1, 0, 0, 1, 1,
0.4522777, -1.260331, 3.113534, 1, 0, 0, 1, 1,
0.4531553, -0.4188961, 2.53748, 1, 0, 0, 1, 1,
0.4564028, 1.789539, -0.5599977, 1, 0, 0, 1, 1,
0.457707, 0.5812206, 2.464467, 0, 0, 0, 1, 1,
0.4585714, 0.2052714, 1.154826, 0, 0, 0, 1, 1,
0.4609684, 0.3983057, 1.044754, 0, 0, 0, 1, 1,
0.4617979, -0.6793917, 1.469045, 0, 0, 0, 1, 1,
0.465794, 0.1055434, 0.9487572, 0, 0, 0, 1, 1,
0.4696288, -0.6364313, 2.470862, 0, 0, 0, 1, 1,
0.4754141, -1.716655, 1.374316, 0, 0, 0, 1, 1,
0.4837575, -2.054235, 4.251026, 1, 1, 1, 1, 1,
0.4852006, 0.3189065, -0.377774, 1, 1, 1, 1, 1,
0.4934919, -1.809807, 3.364647, 1, 1, 1, 1, 1,
0.4946072, -0.2734109, 2.405863, 1, 1, 1, 1, 1,
0.5004924, 0.4543975, -0.301991, 1, 1, 1, 1, 1,
0.5024853, -0.4407232, 2.04874, 1, 1, 1, 1, 1,
0.5032386, 0.9773585, 0.9708464, 1, 1, 1, 1, 1,
0.5054339, -0.4275198, 2.015809, 1, 1, 1, 1, 1,
0.5068743, -0.9050375, 3.772624, 1, 1, 1, 1, 1,
0.5071273, 0.3862736, 1.345145, 1, 1, 1, 1, 1,
0.5076973, 0.3827728, 0.8732125, 1, 1, 1, 1, 1,
0.5142995, -0.08407509, 1.674212, 1, 1, 1, 1, 1,
0.5152264, -0.4191076, 3.015057, 1, 1, 1, 1, 1,
0.5160681, 0.0125036, 1.642391, 1, 1, 1, 1, 1,
0.5163025, 0.5103913, 0.733929, 1, 1, 1, 1, 1,
0.5224673, -0.9433703, 3.334314, 0, 0, 1, 1, 1,
0.5264474, -0.6309232, 3.957536, 1, 0, 0, 1, 1,
0.5275235, 0.6326008, -0.1467119, 1, 0, 0, 1, 1,
0.5304729, -0.8723423, 4.002738, 1, 0, 0, 1, 1,
0.5307741, 1.753811, -0.07181149, 1, 0, 0, 1, 1,
0.5326852, 0.1415414, 3.417613, 1, 0, 0, 1, 1,
0.5366933, 0.9661216, 2.225694, 0, 0, 0, 1, 1,
0.5372207, 0.07035711, 2.573501, 0, 0, 0, 1, 1,
0.5484362, 0.3144195, 2.10404, 0, 0, 0, 1, 1,
0.5494447, 1.672222, 0.3021842, 0, 0, 0, 1, 1,
0.5502809, 1.430577, 1.315842, 0, 0, 0, 1, 1,
0.5522392, 1.144383, 2.267608, 0, 0, 0, 1, 1,
0.559894, -1.061283, 2.176609, 0, 0, 0, 1, 1,
0.5676993, 2.568659, -0.9550642, 1, 1, 1, 1, 1,
0.5699317, -0.1653202, 1.10811, 1, 1, 1, 1, 1,
0.5788798, 0.4415392, -1.134085, 1, 1, 1, 1, 1,
0.5790666, 1.288173, 0.6122033, 1, 1, 1, 1, 1,
0.5802323, 2.07922, 1.666204, 1, 1, 1, 1, 1,
0.5803181, 0.44031, -0.599496, 1, 1, 1, 1, 1,
0.5824214, 0.3392799, 2.319493, 1, 1, 1, 1, 1,
0.5845883, 1.192869, -1.426197, 1, 1, 1, 1, 1,
0.5906149, 1.557738, -0.4205832, 1, 1, 1, 1, 1,
0.599476, -0.6203082, 0.9674654, 1, 1, 1, 1, 1,
0.600997, 0.9380135, 1.63853, 1, 1, 1, 1, 1,
0.6047984, 1.511428, -0.05974729, 1, 1, 1, 1, 1,
0.6053722, -0.9315319, 2.401931, 1, 1, 1, 1, 1,
0.6057275, 1.605714, 1.383074, 1, 1, 1, 1, 1,
0.6118885, 1.662356, -0.5898827, 1, 1, 1, 1, 1,
0.6133932, -0.8400331, 2.365331, 0, 0, 1, 1, 1,
0.6153526, 0.1077824, 1.002158, 1, 0, 0, 1, 1,
0.6171637, 0.4558671, 2.2965, 1, 0, 0, 1, 1,
0.6174895, 0.2358621, 0.4011068, 1, 0, 0, 1, 1,
0.6220355, 0.4843121, 1.240823, 1, 0, 0, 1, 1,
0.6238798, -0.02189524, 1.347008, 1, 0, 0, 1, 1,
0.6250948, 1.933457, 1.704808, 0, 0, 0, 1, 1,
0.6291441, 1.603168, 0.2710112, 0, 0, 0, 1, 1,
0.6364389, -0.9482379, 0.5412942, 0, 0, 0, 1, 1,
0.6368766, 0.8289725, 2.296264, 0, 0, 0, 1, 1,
0.6379427, 0.8382368, 0.1096433, 0, 0, 0, 1, 1,
0.6393411, 0.1209594, 0.9272045, 0, 0, 0, 1, 1,
0.6411178, 1.146387, 0.2371246, 0, 0, 0, 1, 1,
0.6481619, -1.488041, 3.670424, 1, 1, 1, 1, 1,
0.6484408, -1.34916, 2.567618, 1, 1, 1, 1, 1,
0.651675, 1.003348, 0.9240361, 1, 1, 1, 1, 1,
0.6528655, 0.2855199, 0.01440693, 1, 1, 1, 1, 1,
0.657688, 1.227006, -1.148388, 1, 1, 1, 1, 1,
0.6597904, -2.418482, 2.134599, 1, 1, 1, 1, 1,
0.6622603, -0.3951885, 1.345705, 1, 1, 1, 1, 1,
0.6628965, 0.3320621, 1.829032, 1, 1, 1, 1, 1,
0.6686523, -0.5386065, 2.700886, 1, 1, 1, 1, 1,
0.6691716, 2.425454, 1.483119, 1, 1, 1, 1, 1,
0.6745882, 0.4631753, 0.4041927, 1, 1, 1, 1, 1,
0.6772608, -1.381089, 3.608199, 1, 1, 1, 1, 1,
0.6840576, -0.547107, 1.345196, 1, 1, 1, 1, 1,
0.6879753, -0.4268787, 3.090926, 1, 1, 1, 1, 1,
0.694188, -1.241393, 5.085278, 1, 1, 1, 1, 1,
0.6973819, -0.9782714, 2.621749, 0, 0, 1, 1, 1,
0.7011678, -0.398076, 1.934479, 1, 0, 0, 1, 1,
0.7055491, -1.015404, 2.210655, 1, 0, 0, 1, 1,
0.7125353, -1.217633, 3.497882, 1, 0, 0, 1, 1,
0.7220219, -0.6822531, 2.809568, 1, 0, 0, 1, 1,
0.7223622, 0.5030492, 0.264299, 1, 0, 0, 1, 1,
0.7288512, -0.1817963, 1.878298, 0, 0, 0, 1, 1,
0.7327174, 1.099656, 0.4835929, 0, 0, 0, 1, 1,
0.7351121, 0.7670267, 1.743625, 0, 0, 0, 1, 1,
0.7370057, 2.183181, 0.2686116, 0, 0, 0, 1, 1,
0.7400541, 0.09077463, 2.99469, 0, 0, 0, 1, 1,
0.7497307, -0.5844531, 2.533455, 0, 0, 0, 1, 1,
0.7509151, 1.016384, 1.758284, 0, 0, 0, 1, 1,
0.7514715, 1.050243, 1.454511, 1, 1, 1, 1, 1,
0.7529468, 2.070163, -1.061441, 1, 1, 1, 1, 1,
0.7560133, 0.2880249, 0.6663867, 1, 1, 1, 1, 1,
0.7618199, 0.5035682, 1.057945, 1, 1, 1, 1, 1,
0.764711, 1.084103, 1.385611, 1, 1, 1, 1, 1,
0.7686611, 0.1908016, 2.001222, 1, 1, 1, 1, 1,
0.7697053, -0.7150185, 4.38304, 1, 1, 1, 1, 1,
0.7748738, -0.5893843, 2.721086, 1, 1, 1, 1, 1,
0.783344, -0.76286, 1.926736, 1, 1, 1, 1, 1,
0.7906308, -0.3645643, 2.419868, 1, 1, 1, 1, 1,
0.7926831, 1.143998, -0.5887908, 1, 1, 1, 1, 1,
0.7982559, 0.4109951, 0.01424806, 1, 1, 1, 1, 1,
0.7990759, -0.2879348, 1.622622, 1, 1, 1, 1, 1,
0.8007482, 0.5223158, 0.6910275, 1, 1, 1, 1, 1,
0.802734, 0.5619121, 0.1241541, 1, 1, 1, 1, 1,
0.8057173, -0.3774186, 0.0138728, 0, 0, 1, 1, 1,
0.8070154, -1.170292, 2.274769, 1, 0, 0, 1, 1,
0.807186, -1.642649, 2.893955, 1, 0, 0, 1, 1,
0.8162115, -1.915162, 0.9968894, 1, 0, 0, 1, 1,
0.8213373, -0.1458364, 2.272579, 1, 0, 0, 1, 1,
0.8246681, 0.5656185, 0.5781732, 1, 0, 0, 1, 1,
0.8285472, 1.56047, 0.6393421, 0, 0, 0, 1, 1,
0.8308348, -0.8914245, 2.702854, 0, 0, 0, 1, 1,
0.8346168, 0.7551578, 0.1975879, 0, 0, 0, 1, 1,
0.8422412, 0.1947081, 1.777344, 0, 0, 0, 1, 1,
0.8486972, -0.2455125, -0.7703143, 0, 0, 0, 1, 1,
0.8643543, -2.382787, 3.603267, 0, 0, 0, 1, 1,
0.8672226, 0.944339, 0.6152094, 0, 0, 0, 1, 1,
0.8676558, -0.6365713, 2.344105, 1, 1, 1, 1, 1,
0.8713883, 1.531425, -0.2336079, 1, 1, 1, 1, 1,
0.887105, 1.665269, 0.7506284, 1, 1, 1, 1, 1,
0.8878461, -0.08666244, 1.157861, 1, 1, 1, 1, 1,
0.8889949, 1.412825, 1.088606, 1, 1, 1, 1, 1,
0.8893156, 0.4087589, 2.109043, 1, 1, 1, 1, 1,
0.8893653, 0.5321318, 0.7938119, 1, 1, 1, 1, 1,
0.8918197, 0.110677, 1.383531, 1, 1, 1, 1, 1,
0.8981134, 0.1327195, 2.447623, 1, 1, 1, 1, 1,
0.9130616, 0.5083366, 0.9691011, 1, 1, 1, 1, 1,
0.9179609, -0.3837931, 1.898588, 1, 1, 1, 1, 1,
0.9265867, -0.06431232, 0.5957075, 1, 1, 1, 1, 1,
0.9347752, -0.056243, 0.7601614, 1, 1, 1, 1, 1,
0.9382053, 0.5487407, 1.809142, 1, 1, 1, 1, 1,
0.9386821, 1.324125, 1.194456, 1, 1, 1, 1, 1,
0.9401444, -0.2228372, 2.181726, 0, 0, 1, 1, 1,
0.9417585, -0.7195477, 1.476482, 1, 0, 0, 1, 1,
0.941862, 1.634353, -0.9090074, 1, 0, 0, 1, 1,
0.947978, 0.3250502, -0.3014715, 1, 0, 0, 1, 1,
0.9494574, 0.1887566, 0.4470102, 1, 0, 0, 1, 1,
0.9505817, -0.3140821, 1.922069, 1, 0, 0, 1, 1,
0.9581428, -0.617262, 2.069903, 0, 0, 0, 1, 1,
0.9629954, -0.5394836, 0.6917012, 0, 0, 0, 1, 1,
0.9641305, -0.09542448, 1.755634, 0, 0, 0, 1, 1,
0.9660584, 0.3365148, 0.8779172, 0, 0, 0, 1, 1,
0.9692302, 0.1502544, 2.748191, 0, 0, 0, 1, 1,
0.9692322, 0.5501176, 1.144896, 0, 0, 0, 1, 1,
0.9739931, 0.2042338, 2.585175, 0, 0, 0, 1, 1,
0.9811244, 0.1709277, 2.008141, 1, 1, 1, 1, 1,
0.9815841, 1.504461, 0.3355602, 1, 1, 1, 1, 1,
0.9819444, -2.410021, 3.160429, 1, 1, 1, 1, 1,
0.989341, -0.002576014, 1.518674, 1, 1, 1, 1, 1,
0.991242, -0.516606, 1.188483, 1, 1, 1, 1, 1,
1.0006, -2.305105, 3.149351, 1, 1, 1, 1, 1,
1.003379, -0.1150296, 0.9624308, 1, 1, 1, 1, 1,
1.014246, -0.1443508, 2.625381, 1, 1, 1, 1, 1,
1.015254, 0.8762826, 1.502223, 1, 1, 1, 1, 1,
1.018924, 2.240017, -1.376263, 1, 1, 1, 1, 1,
1.022782, -0.1699677, 1.173766, 1, 1, 1, 1, 1,
1.025524, 0.6832703, 2.424932, 1, 1, 1, 1, 1,
1.025542, -0.740756, 0.9486486, 1, 1, 1, 1, 1,
1.031477, 1.09296, 2.921735, 1, 1, 1, 1, 1,
1.036445, -0.9195747, 1.881892, 1, 1, 1, 1, 1,
1.052235, -1.194609, 3.166815, 0, 0, 1, 1, 1,
1.054173, -0.7786213, 2.216206, 1, 0, 0, 1, 1,
1.057268, 1.572736, -1.378317, 1, 0, 0, 1, 1,
1.062245, -0.02621424, 0.6185141, 1, 0, 0, 1, 1,
1.062867, -0.3944893, 1.165629, 1, 0, 0, 1, 1,
1.065476, 1.227551, 1.021993, 1, 0, 0, 1, 1,
1.074077, 0.1979321, 1.042214, 0, 0, 0, 1, 1,
1.076332, -0.3305471, 1.675433, 0, 0, 0, 1, 1,
1.088135, 0.7462102, -1.216721, 0, 0, 0, 1, 1,
1.095523, 0.2369913, -0.1894488, 0, 0, 0, 1, 1,
1.09788, -0.328926, 1.602822, 0, 0, 0, 1, 1,
1.101983, -1.356053, 3.176121, 0, 0, 0, 1, 1,
1.102017, 1.548306, 1.035359, 0, 0, 0, 1, 1,
1.102638, 0.2344881, 2.447806, 1, 1, 1, 1, 1,
1.102946, -0.3468249, 3.879763, 1, 1, 1, 1, 1,
1.108768, -0.4369649, 3.631293, 1, 1, 1, 1, 1,
1.109352, -0.01231247, 3.110338, 1, 1, 1, 1, 1,
1.109532, -0.8564691, 2.143318, 1, 1, 1, 1, 1,
1.111542, 0.2493943, 1.854056, 1, 1, 1, 1, 1,
1.111805, 0.7680392, 0.9188161, 1, 1, 1, 1, 1,
1.117147, 0.03997712, 2.28203, 1, 1, 1, 1, 1,
1.119431, -1.20404, 3.262375, 1, 1, 1, 1, 1,
1.121132, -0.6518403, 2.226395, 1, 1, 1, 1, 1,
1.122007, 0.4788088, -0.5087799, 1, 1, 1, 1, 1,
1.136575, 1.055967, -0.3078949, 1, 1, 1, 1, 1,
1.138205, -0.6088616, 2.13984, 1, 1, 1, 1, 1,
1.139312, 0.09739189, 3.569527, 1, 1, 1, 1, 1,
1.140835, 0.7212415, 0.8065989, 1, 1, 1, 1, 1,
1.144038, 0.8937181, 0.6757081, 0, 0, 1, 1, 1,
1.149618, 1.35939, 2.261659, 1, 0, 0, 1, 1,
1.153152, -0.195472, 0.7282318, 1, 0, 0, 1, 1,
1.155994, 1.066344, 1.056962, 1, 0, 0, 1, 1,
1.158955, -0.9997262, 0.7245849, 1, 0, 0, 1, 1,
1.160842, -0.3293581, 2.788806, 1, 0, 0, 1, 1,
1.16451, -0.3444898, 1.107546, 0, 0, 0, 1, 1,
1.167755, -0.09597268, 2.246783, 0, 0, 0, 1, 1,
1.17004, -1.362731, 2.668931, 0, 0, 0, 1, 1,
1.171818, 0.4931862, 1.67383, 0, 0, 0, 1, 1,
1.176065, 0.920718, 0.1466273, 0, 0, 0, 1, 1,
1.185227, -0.8339369, 1.154763, 0, 0, 0, 1, 1,
1.198988, 0.5616189, 1.921173, 0, 0, 0, 1, 1,
1.202384, -0.4789191, 3.596089, 1, 1, 1, 1, 1,
1.204825, 2.147725, -0.7213457, 1, 1, 1, 1, 1,
1.210084, 1.047397, 0.5092677, 1, 1, 1, 1, 1,
1.2174, -0.5895893, 3.415993, 1, 1, 1, 1, 1,
1.220129, 0.1903872, 0.9386726, 1, 1, 1, 1, 1,
1.220419, 0.3504079, 1.433748, 1, 1, 1, 1, 1,
1.223652, -0.5194755, 2.688943, 1, 1, 1, 1, 1,
1.232309, 0.3217561, 2.056759, 1, 1, 1, 1, 1,
1.233094, -1.553477, 3.171362, 1, 1, 1, 1, 1,
1.235441, -0.3583886, 1.453867, 1, 1, 1, 1, 1,
1.243588, -1.058803, 2.83464, 1, 1, 1, 1, 1,
1.250043, 1.249145, 0.8042271, 1, 1, 1, 1, 1,
1.263119, -0.7282948, 3.100538, 1, 1, 1, 1, 1,
1.264578, 0.219566, 2.220033, 1, 1, 1, 1, 1,
1.26533, -1.463852, 1.139365, 1, 1, 1, 1, 1,
1.270531, 0.702715, 2.659431, 0, 0, 1, 1, 1,
1.27854, 0.2118783, 1.214697, 1, 0, 0, 1, 1,
1.279685, -0.7700268, 2.219387, 1, 0, 0, 1, 1,
1.280084, -0.01081183, 1.359437, 1, 0, 0, 1, 1,
1.282868, -0.8307428, 2.516177, 1, 0, 0, 1, 1,
1.292888, 1.256949, 0.5033649, 1, 0, 0, 1, 1,
1.294041, -0.05676761, 1.199286, 0, 0, 0, 1, 1,
1.297871, -0.7521784, 2.614608, 0, 0, 0, 1, 1,
1.298401, -0.3769063, 2.691778, 0, 0, 0, 1, 1,
1.298532, 1.61305, 2.004069, 0, 0, 0, 1, 1,
1.301283, 0.1443495, 1.752275, 0, 0, 0, 1, 1,
1.308724, 1.225209, 1.041358, 0, 0, 0, 1, 1,
1.312015, 0.03433735, 1.516166, 0, 0, 0, 1, 1,
1.315266, 0.1189549, 0.9909197, 1, 1, 1, 1, 1,
1.322264, 0.07596818, 0.641327, 1, 1, 1, 1, 1,
1.323339, 1.556921, -0.8110826, 1, 1, 1, 1, 1,
1.336527, 0.5396674, 1.263534, 1, 1, 1, 1, 1,
1.352575, -0.8365609, 1.704774, 1, 1, 1, 1, 1,
1.363672, -0.01457021, 2.319026, 1, 1, 1, 1, 1,
1.371754, 1.935077, -0.3448554, 1, 1, 1, 1, 1,
1.384827, 1.376215, 1.671327, 1, 1, 1, 1, 1,
1.384853, 1.97481, 3.570668, 1, 1, 1, 1, 1,
1.396794, 0.7848411, 2.073429, 1, 1, 1, 1, 1,
1.398331, -1.222339, 1.836, 1, 1, 1, 1, 1,
1.403908, 0.7908362, -1.073343, 1, 1, 1, 1, 1,
1.412193, 1.126444, 0.2895156, 1, 1, 1, 1, 1,
1.424527, -0.6930605, 2.687144, 1, 1, 1, 1, 1,
1.426061, 0.2089163, 0.9172213, 1, 1, 1, 1, 1,
1.428454, -0.4843527, -0.2863434, 0, 0, 1, 1, 1,
1.434793, -1.261183, 3.184855, 1, 0, 0, 1, 1,
1.44161, 0.6014443, 1.632686, 1, 0, 0, 1, 1,
1.467816, 1.163794, 0.7417557, 1, 0, 0, 1, 1,
1.491511, -0.294081, 1.454092, 1, 0, 0, 1, 1,
1.506233, 1.267173, 1.422838, 1, 0, 0, 1, 1,
1.508141, 1.895706, 1.173452, 0, 0, 0, 1, 1,
1.509062, 1.858743, 1.921863, 0, 0, 0, 1, 1,
1.512868, 1.519242, 1.352938, 0, 0, 0, 1, 1,
1.533167, -0.3953489, 1.343805, 0, 0, 0, 1, 1,
1.545147, 2.085673, 1.0754, 0, 0, 0, 1, 1,
1.549643, -0.3862943, 1.21463, 0, 0, 0, 1, 1,
1.554541, -0.7632628, 2.373435, 0, 0, 0, 1, 1,
1.554963, -0.2041976, 2.880861, 1, 1, 1, 1, 1,
1.559389, -1.122875, 2.605725, 1, 1, 1, 1, 1,
1.561997, -1.761602, 2.521576, 1, 1, 1, 1, 1,
1.563332, 1.105866, -0.4535837, 1, 1, 1, 1, 1,
1.564321, 0.647995, 1.285977, 1, 1, 1, 1, 1,
1.571633, 0.6033474, 0.284447, 1, 1, 1, 1, 1,
1.592028, -0.4858847, 1.580525, 1, 1, 1, 1, 1,
1.594132, 0.5435678, 1.095935, 1, 1, 1, 1, 1,
1.607185, -0.757261, 4.112315, 1, 1, 1, 1, 1,
1.612762, -0.7198996, 2.989908, 1, 1, 1, 1, 1,
1.615141, 0.5128234, 0.2867813, 1, 1, 1, 1, 1,
1.633253, 0.1921953, 1.240605, 1, 1, 1, 1, 1,
1.650744, -0.959386, 2.573332, 1, 1, 1, 1, 1,
1.654668, 0.8886741, -0.7204634, 1, 1, 1, 1, 1,
1.672425, -0.2366647, 0.2567322, 1, 1, 1, 1, 1,
1.6906, 1.063717, 0.9641495, 0, 0, 1, 1, 1,
1.705949, -0.05122092, 0.7322238, 1, 0, 0, 1, 1,
1.711395, 0.03834352, 1.579458, 1, 0, 0, 1, 1,
1.713192, 0.700707, 1.605455, 1, 0, 0, 1, 1,
1.725744, -0.3919491, 2.628349, 1, 0, 0, 1, 1,
1.726472, 0.4672264, 2.293304, 1, 0, 0, 1, 1,
1.74434, -0.6789498, 1.537813, 0, 0, 0, 1, 1,
1.751593, -0.8136575, 2.879982, 0, 0, 0, 1, 1,
1.766761, -1.055224, 2.264504, 0, 0, 0, 1, 1,
1.780199, -0.3372638, 0.9321574, 0, 0, 0, 1, 1,
1.781178, 0.33473, 1.532061, 0, 0, 0, 1, 1,
1.789478, 1.427426, 1.915428, 0, 0, 0, 1, 1,
1.805871, 1.356541, 1.15179, 0, 0, 0, 1, 1,
1.84376, -0.05390623, 1.399719, 1, 1, 1, 1, 1,
1.902466, -0.289766, 1.117374, 1, 1, 1, 1, 1,
1.942437, -0.3414829, 1.818515, 1, 1, 1, 1, 1,
1.967209, -1.37599, 0.5463465, 1, 1, 1, 1, 1,
1.980256, 1.330193, 0.1590306, 1, 1, 1, 1, 1,
1.994284, 0.7446001, 1.437211, 1, 1, 1, 1, 1,
2.010436, 1.25895, 0.8242828, 1, 1, 1, 1, 1,
2.026813, -0.5585459, 1.764187, 1, 1, 1, 1, 1,
2.050383, -1.077612, 1.276712, 1, 1, 1, 1, 1,
2.053194, -0.748111, 1.279283, 1, 1, 1, 1, 1,
2.07259, 0.1893909, 2.022576, 1, 1, 1, 1, 1,
2.075647, 1.584692, 0.7451189, 1, 1, 1, 1, 1,
2.106677, 0.7604557, 0.6344922, 1, 1, 1, 1, 1,
2.126019, 0.4609522, 1.244069, 1, 1, 1, 1, 1,
2.182953, 2.138323, 0.9252816, 1, 1, 1, 1, 1,
2.202878, 0.2135748, 0.4875513, 0, 0, 1, 1, 1,
2.20469, 0.4670176, 0.6256089, 1, 0, 0, 1, 1,
2.213995, -0.412314, 1.386155, 1, 0, 0, 1, 1,
2.303732, 0.0869327, 0.7509203, 1, 0, 0, 1, 1,
2.306544, -0.65775, 0.7719346, 1, 0, 0, 1, 1,
2.32623, 1.715067, 0.742375, 1, 0, 0, 1, 1,
2.351158, 0.5577053, 0.9426565, 0, 0, 0, 1, 1,
2.375979, 0.878728, 2.150555, 0, 0, 0, 1, 1,
2.422508, 0.9442334, -0.0663114, 0, 0, 0, 1, 1,
2.464038, -0.8792993, 5.408498, 0, 0, 0, 1, 1,
2.559923, 0.3452643, 2.58506, 0, 0, 0, 1, 1,
2.611659, -0.1463667, 2.659642, 0, 0, 0, 1, 1,
2.618289, -0.7092621, 1.052492, 0, 0, 0, 1, 1,
2.619272, 0.7848337, 2.793476, 1, 1, 1, 1, 1,
2.667346, 2.280779, 0.009898025, 1, 1, 1, 1, 1,
2.704429, -0.4112608, 2.748029, 1, 1, 1, 1, 1,
2.823098, 1.660637, 1.300851, 1, 1, 1, 1, 1,
2.963172, 1.261246, 0.9721085, 1, 1, 1, 1, 1,
3.282245, -1.242707, -0.01382443, 1, 1, 1, 1, 1,
3.913195, -0.7921558, 2.887971, 1, 1, 1, 1, 1
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
var radius = 10.01889;
var distance = 35.19094;
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
mvMatrix.translate( -0.2228861, 0.393683, 0.03299427 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.19094);
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
