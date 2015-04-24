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
-3.91689, 1.739813, 0.01952445, 1, 0, 0, 1,
-2.93469, -0.03270145, -0.736757, 1, 0.007843138, 0, 1,
-2.798392, -1.40119, -1.583711, 1, 0.01176471, 0, 1,
-2.751317, 0.2599115, -2.477709, 1, 0.01960784, 0, 1,
-2.664065, 0.4499847, -2.161855, 1, 0.02352941, 0, 1,
-2.629871, -2.448808, -3.604889, 1, 0.03137255, 0, 1,
-2.522803, -1.104089, -1.442149, 1, 0.03529412, 0, 1,
-2.477386, 1.862, 0.5599152, 1, 0.04313726, 0, 1,
-2.373883, -1.237737, -1.929619, 1, 0.04705882, 0, 1,
-2.357154, -0.2404604, -1.212008, 1, 0.05490196, 0, 1,
-2.353632, 0.04785899, -1.835155, 1, 0.05882353, 0, 1,
-2.31551, 2.020945, -0.4766496, 1, 0.06666667, 0, 1,
-2.203911, -1.231989, -2.772746, 1, 0.07058824, 0, 1,
-2.096313, -0.7297384, -2.109957, 1, 0.07843138, 0, 1,
-2.089721, 0.320915, -1.300126, 1, 0.08235294, 0, 1,
-2.086586, -0.06503563, -1.514222, 1, 0.09019608, 0, 1,
-2.082124, -0.0832869, -1.103697, 1, 0.09411765, 0, 1,
-2.030717, 0.9178059, -0.7260947, 1, 0.1019608, 0, 1,
-2.01249, -0.5382435, -0.6029937, 1, 0.1098039, 0, 1,
-2.002318, 0.138077, 1.283799, 1, 0.1137255, 0, 1,
-1.952326, 1.372241, -1.31606, 1, 0.1215686, 0, 1,
-1.951007, 3.221862, -0.5725754, 1, 0.1254902, 0, 1,
-1.932942, -1.056707, 0.3837257, 1, 0.1333333, 0, 1,
-1.922422, -0.8294401, -0.8269355, 1, 0.1372549, 0, 1,
-1.905689, -0.2949069, -1.307196, 1, 0.145098, 0, 1,
-1.900346, -0.4278069, -2.402889, 1, 0.1490196, 0, 1,
-1.898816, 0.1330314, -2.14149, 1, 0.1568628, 0, 1,
-1.854018, 0.3919754, -1.209984, 1, 0.1607843, 0, 1,
-1.833757, 1.674092, -1.493661, 1, 0.1686275, 0, 1,
-1.826641, 0.2017835, -1.046133, 1, 0.172549, 0, 1,
-1.813093, -1.258667, -3.087879, 1, 0.1803922, 0, 1,
-1.81288, -1.697816, -0.986799, 1, 0.1843137, 0, 1,
-1.800416, 0.5191485, -1.551508, 1, 0.1921569, 0, 1,
-1.798195, 0.1662728, -2.565507, 1, 0.1960784, 0, 1,
-1.776064, 0.6686592, -1.332405, 1, 0.2039216, 0, 1,
-1.760363, 0.0419336, -1.480491, 1, 0.2117647, 0, 1,
-1.759978, -0.5184141, -1.597407, 1, 0.2156863, 0, 1,
-1.73876, 1.030971, -1.584527, 1, 0.2235294, 0, 1,
-1.731956, -0.748848, -0.9133881, 1, 0.227451, 0, 1,
-1.730853, -0.2177604, -2.119386, 1, 0.2352941, 0, 1,
-1.723417, 0.8916286, -0.6815791, 1, 0.2392157, 0, 1,
-1.711044, 0.3663082, -1.709689, 1, 0.2470588, 0, 1,
-1.703449, -1.893101, -1.871851, 1, 0.2509804, 0, 1,
-1.702935, 0.05391556, -0.4352158, 1, 0.2588235, 0, 1,
-1.697273, -1.861547, -3.158655, 1, 0.2627451, 0, 1,
-1.690834, -1.7103, -2.232188, 1, 0.2705882, 0, 1,
-1.687101, 0.5106282, -1.068682, 1, 0.2745098, 0, 1,
-1.685684, 1.578938, -0.8032472, 1, 0.282353, 0, 1,
-1.662985, -0.5398616, -1.373925, 1, 0.2862745, 0, 1,
-1.660243, 1.354808, -1.03481, 1, 0.2941177, 0, 1,
-1.656535, 0.2036697, -1.911895, 1, 0.3019608, 0, 1,
-1.641725, 0.2444117, -0.4613758, 1, 0.3058824, 0, 1,
-1.634864, -1.112656, -1.880381, 1, 0.3137255, 0, 1,
-1.613365, 1.222476, -1.958915, 1, 0.3176471, 0, 1,
-1.609309, -2.198042, -4.067302, 1, 0.3254902, 0, 1,
-1.599798, 0.6648615, -0.9478434, 1, 0.3294118, 0, 1,
-1.599422, -0.5374945, -2.037489, 1, 0.3372549, 0, 1,
-1.566734, 1.778783, 0.09566999, 1, 0.3411765, 0, 1,
-1.560971, 0.5690602, 0.3003211, 1, 0.3490196, 0, 1,
-1.557687, 1.441749, -1.438267, 1, 0.3529412, 0, 1,
-1.546347, -0.6445196, -1.431108, 1, 0.3607843, 0, 1,
-1.542963, -0.07901218, -0.9026607, 1, 0.3647059, 0, 1,
-1.535327, 0.1726744, -3.714476, 1, 0.372549, 0, 1,
-1.534492, -0.0937266, -3.057944, 1, 0.3764706, 0, 1,
-1.530319, -0.2342775, -1.903124, 1, 0.3843137, 0, 1,
-1.52899, -0.4232248, -1.753134, 1, 0.3882353, 0, 1,
-1.527393, 0.04532724, -2.405173, 1, 0.3960784, 0, 1,
-1.524429, -0.774213, -1.247914, 1, 0.4039216, 0, 1,
-1.518491, 0.2771285, -2.248061, 1, 0.4078431, 0, 1,
-1.514636, -0.2652335, -2.65928, 1, 0.4156863, 0, 1,
-1.507875, 0.4316943, -1.784474, 1, 0.4196078, 0, 1,
-1.503558, 1.216343, -0.4368034, 1, 0.427451, 0, 1,
-1.495524, 0.9681608, -1.56754, 1, 0.4313726, 0, 1,
-1.495355, 1.899072, -0.9985119, 1, 0.4392157, 0, 1,
-1.494327, 0.6155924, -3.877799, 1, 0.4431373, 0, 1,
-1.483486, -0.5533905, -4.211653, 1, 0.4509804, 0, 1,
-1.466877, -1.107466, -0.8801083, 1, 0.454902, 0, 1,
-1.455085, -3.35081, -3.179755, 1, 0.4627451, 0, 1,
-1.433243, -0.03146545, -1.181305, 1, 0.4666667, 0, 1,
-1.422496, -1.309431, -2.404705, 1, 0.4745098, 0, 1,
-1.416994, 0.1076239, -2.116075, 1, 0.4784314, 0, 1,
-1.413785, -0.697361, -3.05329, 1, 0.4862745, 0, 1,
-1.410721, 0.2787675, -1.165882, 1, 0.4901961, 0, 1,
-1.398637, 1.610104, -0.7215466, 1, 0.4980392, 0, 1,
-1.395296, 0.3412533, -1.834547, 1, 0.5058824, 0, 1,
-1.375342, -2.102214, -2.898003, 1, 0.509804, 0, 1,
-1.361014, 1.550721, -0.02792417, 1, 0.5176471, 0, 1,
-1.360752, 0.3302724, -2.700833, 1, 0.5215687, 0, 1,
-1.348562, 0.4353934, -1.203417, 1, 0.5294118, 0, 1,
-1.341603, -0.03569108, -1.069194, 1, 0.5333334, 0, 1,
-1.332075, 0.6206399, -1.040962, 1, 0.5411765, 0, 1,
-1.30864, 0.9843636, -2.679413, 1, 0.5450981, 0, 1,
-1.306429, 0.3716184, -2.292098, 1, 0.5529412, 0, 1,
-1.305017, -0.6532057, -2.16988, 1, 0.5568628, 0, 1,
-1.304347, -0.08190258, -1.466858, 1, 0.5647059, 0, 1,
-1.303649, 0.1789581, -3.594807, 1, 0.5686275, 0, 1,
-1.288463, 1.43427, -0.1316825, 1, 0.5764706, 0, 1,
-1.283815, -0.6913357, 0.3776327, 1, 0.5803922, 0, 1,
-1.266968, -0.2539856, -2.368224, 1, 0.5882353, 0, 1,
-1.265119, -0.7236374, -2.429559, 1, 0.5921569, 0, 1,
-1.261663, 0.06828009, 0.4898246, 1, 0.6, 0, 1,
-1.256533, -0.7420135, -2.878099, 1, 0.6078432, 0, 1,
-1.254696, -0.7346103, -3.448473, 1, 0.6117647, 0, 1,
-1.251544, -0.6205624, -1.325781, 1, 0.6196079, 0, 1,
-1.239741, -1.562621, -1.907343, 1, 0.6235294, 0, 1,
-1.234251, -2.271065, -2.052156, 1, 0.6313726, 0, 1,
-1.233215, -1.376611, -3.087639, 1, 0.6352941, 0, 1,
-1.228464, 1.264729, -0.1271987, 1, 0.6431373, 0, 1,
-1.216097, 0.2041947, -0.7730877, 1, 0.6470588, 0, 1,
-1.212338, -0.07456376, -2.585615, 1, 0.654902, 0, 1,
-1.21125, 1.442814, 0.8422833, 1, 0.6588235, 0, 1,
-1.210376, -1.003886, -2.347037, 1, 0.6666667, 0, 1,
-1.192735, -0.9139158, -2.292448, 1, 0.6705883, 0, 1,
-1.188731, -1.657723, -3.484359, 1, 0.6784314, 0, 1,
-1.188544, -0.6579546, -1.241722, 1, 0.682353, 0, 1,
-1.1827, 0.9857594, -0.3948168, 1, 0.6901961, 0, 1,
-1.182304, 0.9629964, -1.085127, 1, 0.6941177, 0, 1,
-1.180046, 0.04117082, -2.356506, 1, 0.7019608, 0, 1,
-1.176006, 0.6737415, -1.203585, 1, 0.7098039, 0, 1,
-1.17463, -0.4995385, -2.82155, 1, 0.7137255, 0, 1,
-1.170594, 0.3689929, -1.909094, 1, 0.7215686, 0, 1,
-1.170037, -0.4299071, -2.603303, 1, 0.7254902, 0, 1,
-1.161198, -0.5217197, -2.607313, 1, 0.7333333, 0, 1,
-1.156655, -1.626162, -3.451412, 1, 0.7372549, 0, 1,
-1.156621, -2.282221, -4.418212, 1, 0.7450981, 0, 1,
-1.155786, -1.414902, -3.358504, 1, 0.7490196, 0, 1,
-1.153889, 1.480525, -0.9324518, 1, 0.7568628, 0, 1,
-1.153558, -0.9463561, -1.767373, 1, 0.7607843, 0, 1,
-1.151751, -1.729852, -3.590155, 1, 0.7686275, 0, 1,
-1.151688, 0.1059932, -1.124751, 1, 0.772549, 0, 1,
-1.148554, -2.199592, -3.422807, 1, 0.7803922, 0, 1,
-1.146113, 0.3330698, -1.132406, 1, 0.7843137, 0, 1,
-1.144824, 0.6295351, 0.6675285, 1, 0.7921569, 0, 1,
-1.140163, 1.406108, 1.189237, 1, 0.7960784, 0, 1,
-1.13431, 0.1186238, -0.7684357, 1, 0.8039216, 0, 1,
-1.130609, 0.7769374, -0.3186632, 1, 0.8117647, 0, 1,
-1.127914, -0.7714525, -0.9657049, 1, 0.8156863, 0, 1,
-1.116655, 0.3225811, -2.450891, 1, 0.8235294, 0, 1,
-1.110108, -0.808068, -3.114236, 1, 0.827451, 0, 1,
-1.106332, -1.998146, -2.77866, 1, 0.8352941, 0, 1,
-1.090951, 0.31829, -1.169274, 1, 0.8392157, 0, 1,
-1.07369, -0.4216218, -1.784967, 1, 0.8470588, 0, 1,
-1.073235, 1.144524, -1.928063, 1, 0.8509804, 0, 1,
-1.064787, -0.1697286, -2.043566, 1, 0.8588235, 0, 1,
-1.045175, 0.8611549, -3.520186, 1, 0.8627451, 0, 1,
-1.044107, 1.299242, 1.34465, 1, 0.8705882, 0, 1,
-1.04187, 0.4629225, -1.020145, 1, 0.8745098, 0, 1,
-1.028615, -0.8461868, -2.601173, 1, 0.8823529, 0, 1,
-1.027826, -0.3676986, -0.9265919, 1, 0.8862745, 0, 1,
-1.021774, 0.5909079, -1.129813, 1, 0.8941177, 0, 1,
-1.016731, 0.2934439, -1.061146, 1, 0.8980392, 0, 1,
-1.016283, -0.284235, -2.543973, 1, 0.9058824, 0, 1,
-1.009093, -1.71223, -1.696561, 1, 0.9137255, 0, 1,
-1.003629, -0.6856039, -2.887178, 1, 0.9176471, 0, 1,
-1.003503, 0.02168003, -0.4708855, 1, 0.9254902, 0, 1,
-0.9926344, -0.3897138, -2.335215, 1, 0.9294118, 0, 1,
-0.9859116, 0.9589111, -1.140022, 1, 0.9372549, 0, 1,
-0.9813331, 0.1364687, -2.353422, 1, 0.9411765, 0, 1,
-0.9794822, 1.80635, -0.7045476, 1, 0.9490196, 0, 1,
-0.9707429, 1.967636, 0.1018452, 1, 0.9529412, 0, 1,
-0.9680095, 0.005087934, -2.478279, 1, 0.9607843, 0, 1,
-0.9651198, -0.1872246, -2.740671, 1, 0.9647059, 0, 1,
-0.9635128, -0.2350416, -1.59963, 1, 0.972549, 0, 1,
-0.9605069, -1.534232, -0.4665389, 1, 0.9764706, 0, 1,
-0.9600917, 0.5438403, -1.424642, 1, 0.9843137, 0, 1,
-0.9445487, 1.094813, -0.3498253, 1, 0.9882353, 0, 1,
-0.9354513, -2.206706, -2.130246, 1, 0.9960784, 0, 1,
-0.922555, 1.458628, 0.8198965, 0.9960784, 1, 0, 1,
-0.9193063, -0.3683103, -0.8644904, 0.9921569, 1, 0, 1,
-0.9141973, -1.068745, -1.932632, 0.9843137, 1, 0, 1,
-0.9102817, 0.2599085, -1.01914, 0.9803922, 1, 0, 1,
-0.9098184, 1.133635, -1.079285, 0.972549, 1, 0, 1,
-0.9049585, 0.05911658, -0.8081427, 0.9686275, 1, 0, 1,
-0.904492, -0.4531761, -0.5103206, 0.9607843, 1, 0, 1,
-0.8989188, 0.7130492, -2.013048, 0.9568627, 1, 0, 1,
-0.8754504, 0.03971494, -0.9432364, 0.9490196, 1, 0, 1,
-0.8666998, -1.130943, -2.848809, 0.945098, 1, 0, 1,
-0.8621106, 1.125857, -0.2287293, 0.9372549, 1, 0, 1,
-0.8591089, 0.9054139, -1.693253, 0.9333333, 1, 0, 1,
-0.854413, -1.328851, -1.078872, 0.9254902, 1, 0, 1,
-0.8519068, -0.7521994, -1.842088, 0.9215686, 1, 0, 1,
-0.8508101, 0.1701675, 0.9905613, 0.9137255, 1, 0, 1,
-0.8477505, -1.432025, -2.635962, 0.9098039, 1, 0, 1,
-0.8460112, -1.448433, -2.574307, 0.9019608, 1, 0, 1,
-0.8440111, 0.8313753, -0.1598259, 0.8941177, 1, 0, 1,
-0.841455, 1.076782, 0.4167836, 0.8901961, 1, 0, 1,
-0.8400789, 0.2288846, -0.666347, 0.8823529, 1, 0, 1,
-0.8388039, -0.8133419, -4.365179, 0.8784314, 1, 0, 1,
-0.8387519, 0.7575533, -0.3986664, 0.8705882, 1, 0, 1,
-0.8290541, -1.037609, -1.653794, 0.8666667, 1, 0, 1,
-0.8276439, -0.8888921, -2.381514, 0.8588235, 1, 0, 1,
-0.8182586, -1.388563, -1.514305, 0.854902, 1, 0, 1,
-0.8167298, -1.108141, -3.310164, 0.8470588, 1, 0, 1,
-0.8085911, 1.018508, 0.4042414, 0.8431373, 1, 0, 1,
-0.8080561, -1.022298, -2.434366, 0.8352941, 1, 0, 1,
-0.8066158, -0.5475892, -3.276014, 0.8313726, 1, 0, 1,
-0.8057394, -0.8533942, -0.7762788, 0.8235294, 1, 0, 1,
-0.8027916, -0.1287336, -1.99265, 0.8196079, 1, 0, 1,
-0.8018747, 0.3173011, 0.3590664, 0.8117647, 1, 0, 1,
-0.7975238, 0.2691245, -2.287566, 0.8078431, 1, 0, 1,
-0.7975106, 1.521352, -1.437745, 0.8, 1, 0, 1,
-0.794592, -0.5903323, -1.368306, 0.7921569, 1, 0, 1,
-0.794008, -0.4295547, -1.549079, 0.7882353, 1, 0, 1,
-0.7914494, 0.7492079, -2.571688, 0.7803922, 1, 0, 1,
-0.7899616, -0.2391927, -1.964524, 0.7764706, 1, 0, 1,
-0.7887381, -0.02110301, -0.7222462, 0.7686275, 1, 0, 1,
-0.7816449, -2.325669, -3.652957, 0.7647059, 1, 0, 1,
-0.7791745, -0.7733359, -0.476181, 0.7568628, 1, 0, 1,
-0.7787591, -0.1964277, -2.476809, 0.7529412, 1, 0, 1,
-0.7771932, -1.647993, -2.38207, 0.7450981, 1, 0, 1,
-0.7746258, 1.188124, -1.368543, 0.7411765, 1, 0, 1,
-0.7742899, 0.7129312, -0.7019864, 0.7333333, 1, 0, 1,
-0.7711991, -0.5658301, 2.036067, 0.7294118, 1, 0, 1,
-0.7700627, -0.4818193, -2.60932, 0.7215686, 1, 0, 1,
-0.7647183, 0.1050623, -1.740541, 0.7176471, 1, 0, 1,
-0.7622371, -1.298356, -3.227786, 0.7098039, 1, 0, 1,
-0.7599891, 0.1314492, 0.09258572, 0.7058824, 1, 0, 1,
-0.7563489, 1.153699, -1.066879, 0.6980392, 1, 0, 1,
-0.7552325, 0.4407302, -0.6620975, 0.6901961, 1, 0, 1,
-0.7536885, 0.7445202, -0.5329475, 0.6862745, 1, 0, 1,
-0.7522368, -0.2786153, -3.468648, 0.6784314, 1, 0, 1,
-0.7515444, -0.0942625, -1.931951, 0.6745098, 1, 0, 1,
-0.7512925, 0.1708064, -0.918543, 0.6666667, 1, 0, 1,
-0.7486684, 0.3018083, -0.7882923, 0.6627451, 1, 0, 1,
-0.7463755, -0.31564, -3.169165, 0.654902, 1, 0, 1,
-0.7460794, -1.42827, -1.661709, 0.6509804, 1, 0, 1,
-0.7442469, -0.9111951, -3.035487, 0.6431373, 1, 0, 1,
-0.743913, -0.6237444, -2.585362, 0.6392157, 1, 0, 1,
-0.7427652, 1.987949, -0.1096824, 0.6313726, 1, 0, 1,
-0.7329203, 0.6093745, 0.2496581, 0.627451, 1, 0, 1,
-0.7291636, -1.105724, -1.991658, 0.6196079, 1, 0, 1,
-0.7289371, 0.772251, -0.6727582, 0.6156863, 1, 0, 1,
-0.7285262, 1.161623, -2.283911, 0.6078432, 1, 0, 1,
-0.7270311, 0.2974525, -1.586123, 0.6039216, 1, 0, 1,
-0.7249668, -0.5557215, -0.3626639, 0.5960785, 1, 0, 1,
-0.7237163, -0.6806133, -2.921606, 0.5882353, 1, 0, 1,
-0.7189739, -1.308121, -1.629615, 0.5843138, 1, 0, 1,
-0.7177245, -1.714813, -2.602183, 0.5764706, 1, 0, 1,
-0.7149346, 1.234266, -0.614458, 0.572549, 1, 0, 1,
-0.7139273, 0.6345521, -2.691569, 0.5647059, 1, 0, 1,
-0.7093244, 2.426913, -0.8945704, 0.5607843, 1, 0, 1,
-0.709092, 0.2240655, -3.220078, 0.5529412, 1, 0, 1,
-0.7070609, 1.412843, -2.314883, 0.5490196, 1, 0, 1,
-0.7038382, 0.1045141, -0.3118668, 0.5411765, 1, 0, 1,
-0.6902115, 0.3885368, -1.757952, 0.5372549, 1, 0, 1,
-0.6877958, 0.06382075, -0.8248172, 0.5294118, 1, 0, 1,
-0.6866702, -0.6467498, -2.202372, 0.5254902, 1, 0, 1,
-0.6847422, 0.4955783, -2.608083, 0.5176471, 1, 0, 1,
-0.6834526, -0.7924353, -1.855777, 0.5137255, 1, 0, 1,
-0.6812356, -0.8648872, -2.090065, 0.5058824, 1, 0, 1,
-0.6731544, 0.2321098, -1.779336, 0.5019608, 1, 0, 1,
-0.6529006, -0.2599131, -1.773758, 0.4941176, 1, 0, 1,
-0.6517249, -0.2613813, -2.078058, 0.4862745, 1, 0, 1,
-0.6492251, 1.142496, 0.356347, 0.4823529, 1, 0, 1,
-0.6485193, -0.5339211, -1.466805, 0.4745098, 1, 0, 1,
-0.645658, 1.447127, 0.569796, 0.4705882, 1, 0, 1,
-0.6410831, -0.1211763, -1.738466, 0.4627451, 1, 0, 1,
-0.6404952, -0.4538473, -2.640573, 0.4588235, 1, 0, 1,
-0.6352087, 1.78913, 0.6740956, 0.4509804, 1, 0, 1,
-0.6292496, 0.2465335, -0.5995352, 0.4470588, 1, 0, 1,
-0.628378, -0.3619528, -0.1533547, 0.4392157, 1, 0, 1,
-0.6260238, -0.6844523, -2.145772, 0.4352941, 1, 0, 1,
-0.62383, -0.3966019, -3.072612, 0.427451, 1, 0, 1,
-0.6176432, 0.9814562, -0.3165092, 0.4235294, 1, 0, 1,
-0.6151915, 0.01512078, -0.7875163, 0.4156863, 1, 0, 1,
-0.6147015, -0.2633494, -3.509089, 0.4117647, 1, 0, 1,
-0.6138758, 0.374169, -2.085817, 0.4039216, 1, 0, 1,
-0.6137302, 0.1423374, -1.753792, 0.3960784, 1, 0, 1,
-0.6126921, 1.321426, -1.276803, 0.3921569, 1, 0, 1,
-0.6071703, 0.6036122, -0.9679481, 0.3843137, 1, 0, 1,
-0.6067783, 0.3170759, 0.093422, 0.3803922, 1, 0, 1,
-0.6061574, 0.9627311, -1.028636, 0.372549, 1, 0, 1,
-0.6035746, 0.6758824, -3.239113, 0.3686275, 1, 0, 1,
-0.6026774, -0.8896063, -4.191372, 0.3607843, 1, 0, 1,
-0.6020738, -0.1256773, -0.9123684, 0.3568628, 1, 0, 1,
-0.6020032, -2.066597, -4.243544, 0.3490196, 1, 0, 1,
-0.6018823, -1.755823, -2.402739, 0.345098, 1, 0, 1,
-0.601334, -2.176635, -3.225796, 0.3372549, 1, 0, 1,
-0.5939745, -1.787688, -3.032828, 0.3333333, 1, 0, 1,
-0.5922258, -0.762948, -3.027606, 0.3254902, 1, 0, 1,
-0.5920829, -0.04409587, -2.546561, 0.3215686, 1, 0, 1,
-0.5913632, -1.42784, -2.808864, 0.3137255, 1, 0, 1,
-0.5900729, -0.7984809, -2.101146, 0.3098039, 1, 0, 1,
-0.5819777, -0.3693496, -2.429265, 0.3019608, 1, 0, 1,
-0.5735145, -0.1189217, 0.4099732, 0.2941177, 1, 0, 1,
-0.5727448, 1.111284, -1.692014, 0.2901961, 1, 0, 1,
-0.5716868, 0.3375049, -0.5560098, 0.282353, 1, 0, 1,
-0.5697395, 0.5219667, -1.050393, 0.2784314, 1, 0, 1,
-0.5665547, -0.1003965, -1.146063, 0.2705882, 1, 0, 1,
-0.5659889, 0.6008127, -2.00967, 0.2666667, 1, 0, 1,
-0.5543517, 0.07180785, -1.782936, 0.2588235, 1, 0, 1,
-0.5539847, 0.6856344, 0.07739437, 0.254902, 1, 0, 1,
-0.5506266, -0.6986278, -4.531702, 0.2470588, 1, 0, 1,
-0.5484387, 1.029978, -0.8530933, 0.2431373, 1, 0, 1,
-0.5479549, -0.1327478, -2.574943, 0.2352941, 1, 0, 1,
-0.5429825, -0.4528596, -3.816216, 0.2313726, 1, 0, 1,
-0.534852, -1.514874, -3.01037, 0.2235294, 1, 0, 1,
-0.534046, -0.1442527, -1.771627, 0.2196078, 1, 0, 1,
-0.5316867, -1.068611, -2.661926, 0.2117647, 1, 0, 1,
-0.5303931, 0.6236789, 1.304349, 0.2078431, 1, 0, 1,
-0.5276366, -1.078641, -1.789541, 0.2, 1, 0, 1,
-0.5219713, 0.1360735, -2.893214, 0.1921569, 1, 0, 1,
-0.5214013, 1.517465, 1.079182, 0.1882353, 1, 0, 1,
-0.5191684, -0.4353572, -3.266002, 0.1803922, 1, 0, 1,
-0.5077423, -1.02305, -4.673161, 0.1764706, 1, 0, 1,
-0.5051914, 0.7581072, -1.586421, 0.1686275, 1, 0, 1,
-0.5044231, 0.4933226, -3.173062, 0.1647059, 1, 0, 1,
-0.5002036, 0.9017754, -0.2325176, 0.1568628, 1, 0, 1,
-0.4985099, 1.161202, -0.3393681, 0.1529412, 1, 0, 1,
-0.4981339, 1.928686, -1.32317, 0.145098, 1, 0, 1,
-0.4950793, 1.19218, -0.1889362, 0.1411765, 1, 0, 1,
-0.4940037, 0.4347807, -2.352596, 0.1333333, 1, 0, 1,
-0.4936486, -0.8529361, -2.198635, 0.1294118, 1, 0, 1,
-0.4847711, 1.452567, -0.1580853, 0.1215686, 1, 0, 1,
-0.4799908, 1.047132, 0.6565705, 0.1176471, 1, 0, 1,
-0.4758333, -1.865587, -2.166274, 0.1098039, 1, 0, 1,
-0.4756266, -0.2094114, -1.801024, 0.1058824, 1, 0, 1,
-0.4726267, 1.114819, -1.538014, 0.09803922, 1, 0, 1,
-0.4701439, -0.6232561, -4.006059, 0.09019608, 1, 0, 1,
-0.4685264, -0.04558888, -2.611329, 0.08627451, 1, 0, 1,
-0.4678083, 0.419288, -0.2100819, 0.07843138, 1, 0, 1,
-0.4591198, -0.4813139, -0.4085663, 0.07450981, 1, 0, 1,
-0.4580934, -0.6182369, -3.766368, 0.06666667, 1, 0, 1,
-0.447064, 1.48702, -0.1917709, 0.0627451, 1, 0, 1,
-0.4453525, 1.543474, -0.3165359, 0.05490196, 1, 0, 1,
-0.4452783, 0.8461245, -1.591285, 0.05098039, 1, 0, 1,
-0.4446421, 1.04351, -0.6433638, 0.04313726, 1, 0, 1,
-0.4429506, -0.1466596, -2.520802, 0.03921569, 1, 0, 1,
-0.4348317, 0.8023357, 0.08409298, 0.03137255, 1, 0, 1,
-0.4323791, 0.2416244, -0.7555848, 0.02745098, 1, 0, 1,
-0.4302323, 0.5608108, -0.5244926, 0.01960784, 1, 0, 1,
-0.4301552, 0.6834998, -1.826659, 0.01568628, 1, 0, 1,
-0.4285978, 0.202417, -1.313074, 0.007843138, 1, 0, 1,
-0.4262874, -0.7755084, -2.014953, 0.003921569, 1, 0, 1,
-0.4238155, -1.368492, -4.437467, 0, 1, 0.003921569, 1,
-0.4198133, -0.3690685, -1.817099, 0, 1, 0.01176471, 1,
-0.417746, -1.596114, -3.89929, 0, 1, 0.01568628, 1,
-0.4168472, 0.5087575, -0.124672, 0, 1, 0.02352941, 1,
-0.4165616, -2.278069, -0.9484257, 0, 1, 0.02745098, 1,
-0.414167, 1.410558, -1.121632, 0, 1, 0.03529412, 1,
-0.4122962, -0.2987095, -2.153566, 0, 1, 0.03921569, 1,
-0.4105788, 1.00937, -1.669976, 0, 1, 0.04705882, 1,
-0.403726, 0.9467539, -2.02614, 0, 1, 0.05098039, 1,
-0.4024402, -0.1203794, -0.5703593, 0, 1, 0.05882353, 1,
-0.4005785, 0.9805978, 0.6129752, 0, 1, 0.0627451, 1,
-0.3945936, -2.09267, -3.166138, 0, 1, 0.07058824, 1,
-0.3897532, -0.3569295, -2.252424, 0, 1, 0.07450981, 1,
-0.3860637, -0.5477155, -3.403867, 0, 1, 0.08235294, 1,
-0.3808178, -0.5217903, -3.228253, 0, 1, 0.08627451, 1,
-0.3797244, 1.27217, -0.4574486, 0, 1, 0.09411765, 1,
-0.3706501, -1.468836, -2.627258, 0, 1, 0.1019608, 1,
-0.3591465, 1.215242, 0.8023584, 0, 1, 0.1058824, 1,
-0.3526302, -1.567598, -2.746852, 0, 1, 0.1137255, 1,
-0.3500681, 1.725482, -0.3640872, 0, 1, 0.1176471, 1,
-0.3495328, 2.127383, 0.7852702, 0, 1, 0.1254902, 1,
-0.3485633, -0.397375, 0.8672628, 0, 1, 0.1294118, 1,
-0.3473412, -0.4512241, -2.509839, 0, 1, 0.1372549, 1,
-0.3464358, 0.3089592, 1.590363, 0, 1, 0.1411765, 1,
-0.3436911, -0.6079538, 0.3637572, 0, 1, 0.1490196, 1,
-0.3418956, -0.6374965, -3.250655, 0, 1, 0.1529412, 1,
-0.3398215, 1.455381, -0.2047212, 0, 1, 0.1607843, 1,
-0.3354003, -0.1962575, -2.623635, 0, 1, 0.1647059, 1,
-0.3342297, -0.1779007, 1.38897, 0, 1, 0.172549, 1,
-0.3283915, -1.156724, -4.26512, 0, 1, 0.1764706, 1,
-0.3280315, 1.323078, -0.001976157, 0, 1, 0.1843137, 1,
-0.3248337, -0.8865798, -3.088799, 0, 1, 0.1882353, 1,
-0.3209293, -0.005947115, -0.8257296, 0, 1, 0.1960784, 1,
-0.3195763, -1.393691, -3.388224, 0, 1, 0.2039216, 1,
-0.3187911, 1.700315, 1.178105, 0, 1, 0.2078431, 1,
-0.3172635, -0.7698387, -3.169196, 0, 1, 0.2156863, 1,
-0.3133937, -1.031827, -4.30559, 0, 1, 0.2196078, 1,
-0.3123367, 0.2813898, -0.8506842, 0, 1, 0.227451, 1,
-0.3065661, -2.556453, -4.030018, 0, 1, 0.2313726, 1,
-0.3062719, -0.2885872, -2.461214, 0, 1, 0.2392157, 1,
-0.2996811, 0.09491766, -1.228426, 0, 1, 0.2431373, 1,
-0.2982554, -0.1893809, -2.289935, 0, 1, 0.2509804, 1,
-0.2921834, 1.852728, 1.425153, 0, 1, 0.254902, 1,
-0.2898629, -0.1940687, -2.391389, 0, 1, 0.2627451, 1,
-0.2874203, -0.6403908, -3.454669, 0, 1, 0.2666667, 1,
-0.2832448, 0.5683976, 0.8731387, 0, 1, 0.2745098, 1,
-0.2829064, -1.515538, -2.591691, 0, 1, 0.2784314, 1,
-0.2808884, -0.5181329, -1.789172, 0, 1, 0.2862745, 1,
-0.2805477, 0.9096664, 0.5258942, 0, 1, 0.2901961, 1,
-0.2762501, 1.313635, -0.1560581, 0, 1, 0.2980392, 1,
-0.2704164, -1.223555, -1.408355, 0, 1, 0.3058824, 1,
-0.2670556, 1.350037, -0.00603569, 0, 1, 0.3098039, 1,
-0.2601465, 0.1252885, -1.021149, 0, 1, 0.3176471, 1,
-0.2570194, 0.01826414, -1.117204, 0, 1, 0.3215686, 1,
-0.2508623, 0.7718122, 0.7469466, 0, 1, 0.3294118, 1,
-0.2498129, -0.3054348, -2.103588, 0, 1, 0.3333333, 1,
-0.2409482, 0.2105018, -1.675918, 0, 1, 0.3411765, 1,
-0.2395431, -1.509346, -4.744948, 0, 1, 0.345098, 1,
-0.2365336, 0.500892, -1.103649, 0, 1, 0.3529412, 1,
-0.231352, -0.2173149, -2.412983, 0, 1, 0.3568628, 1,
-0.2302372, 0.2723647, -1.072909, 0, 1, 0.3647059, 1,
-0.2293707, 2.223474, 1.821816, 0, 1, 0.3686275, 1,
-0.2248271, 1.382712, 1.346664, 0, 1, 0.3764706, 1,
-0.2238724, -0.3139744, -2.314767, 0, 1, 0.3803922, 1,
-0.2223373, 1.560575, 0.5882004, 0, 1, 0.3882353, 1,
-0.2213879, 0.006909018, -2.724688, 0, 1, 0.3921569, 1,
-0.2210943, -0.9170215, -0.8489363, 0, 1, 0.4, 1,
-0.2202381, 0.05255322, -2.884746, 0, 1, 0.4078431, 1,
-0.2198207, 0.5176523, 1.200548, 0, 1, 0.4117647, 1,
-0.2185642, 0.06810885, -1.3707, 0, 1, 0.4196078, 1,
-0.2163743, -1.22703, -2.587874, 0, 1, 0.4235294, 1,
-0.2150826, 0.1391048, -1.273077, 0, 1, 0.4313726, 1,
-0.2126637, -0.04084446, -2.175591, 0, 1, 0.4352941, 1,
-0.2115978, 1.665744, -2.059163, 0, 1, 0.4431373, 1,
-0.2094286, 1.255868, 1.956832, 0, 1, 0.4470588, 1,
-0.2071913, -0.01183943, -0.8561568, 0, 1, 0.454902, 1,
-0.2003106, 0.2146091, -1.112647, 0, 1, 0.4588235, 1,
-0.1995649, 0.8429776, -1.549109, 0, 1, 0.4666667, 1,
-0.1991023, -1.512362, -3.934611, 0, 1, 0.4705882, 1,
-0.1986366, 0.41592, -0.8489718, 0, 1, 0.4784314, 1,
-0.19706, -0.2383258, -3.479189, 0, 1, 0.4823529, 1,
-0.1960687, 0.4921294, -0.4165376, 0, 1, 0.4901961, 1,
-0.1946543, -0.4510772, -2.484521, 0, 1, 0.4941176, 1,
-0.1899538, -0.5379627, -2.496268, 0, 1, 0.5019608, 1,
-0.1887846, 0.8307828, 0.07630926, 0, 1, 0.509804, 1,
-0.1801645, -0.4682836, -2.522322, 0, 1, 0.5137255, 1,
-0.17375, -0.1335138, -2.893431, 0, 1, 0.5215687, 1,
-0.1730536, 0.6936216, -0.1598295, 0, 1, 0.5254902, 1,
-0.1725762, -0.3550129, -2.861781, 0, 1, 0.5333334, 1,
-0.1724835, 0.3704622, 0.8046027, 0, 1, 0.5372549, 1,
-0.1688558, -0.2039862, -2.771979, 0, 1, 0.5450981, 1,
-0.1638463, 1.114259, -1.490101, 0, 1, 0.5490196, 1,
-0.1575806, -0.5608237, -2.024635, 0, 1, 0.5568628, 1,
-0.1530832, -0.4646978, -2.724533, 0, 1, 0.5607843, 1,
-0.1514599, -0.4270804, -2.07653, 0, 1, 0.5686275, 1,
-0.1484735, -0.09067915, -3.034522, 0, 1, 0.572549, 1,
-0.1464702, -1.510402, -2.666109, 0, 1, 0.5803922, 1,
-0.1464248, 0.6853431, -1.334737, 0, 1, 0.5843138, 1,
-0.141213, 0.9985399, -0.05841927, 0, 1, 0.5921569, 1,
-0.138298, 0.2117283, -0.2209401, 0, 1, 0.5960785, 1,
-0.1360132, -0.3813335, -2.694203, 0, 1, 0.6039216, 1,
-0.131084, 0.862075, -0.2437999, 0, 1, 0.6117647, 1,
-0.1298242, 0.2851306, -3.068142, 0, 1, 0.6156863, 1,
-0.1277868, -0.4040759, -2.833891, 0, 1, 0.6235294, 1,
-0.1264779, -0.5068935, -2.148025, 0, 1, 0.627451, 1,
-0.1263068, -1.138467, -2.909041, 0, 1, 0.6352941, 1,
-0.1247068, -0.02729811, -3.041311, 0, 1, 0.6392157, 1,
-0.1220874, 0.3968951, 1.157806, 0, 1, 0.6470588, 1,
-0.1205341, -1.385994, -3.969846, 0, 1, 0.6509804, 1,
-0.1190162, -0.07464024, -1.923, 0, 1, 0.6588235, 1,
-0.1142474, 0.7024719, -0.3333253, 0, 1, 0.6627451, 1,
-0.1142358, 1.213973, -0.07277677, 0, 1, 0.6705883, 1,
-0.1119178, 0.5283055, -0.5020021, 0, 1, 0.6745098, 1,
-0.1068353, 1.015897, -0.6411698, 0, 1, 0.682353, 1,
-0.1066938, -0.07443163, -3.28807, 0, 1, 0.6862745, 1,
-0.1060209, 0.638132, 1.190969, 0, 1, 0.6941177, 1,
-0.1036481, -0.9037458, -1.178424, 0, 1, 0.7019608, 1,
-0.1007323, -0.6163493, -3.133588, 0, 1, 0.7058824, 1,
-0.09833298, 0.9274359, -0.4412045, 0, 1, 0.7137255, 1,
-0.09691039, -0.7679067, -2.671065, 0, 1, 0.7176471, 1,
-0.09180569, 0.4884233, 0.1386322, 0, 1, 0.7254902, 1,
-0.09027984, -0.9796315, -2.940859, 0, 1, 0.7294118, 1,
-0.08729127, 0.6623721, 1.483889, 0, 1, 0.7372549, 1,
-0.06799936, 0.2227705, -0.00854092, 0, 1, 0.7411765, 1,
-0.06777295, -0.8865071, -3.138868, 0, 1, 0.7490196, 1,
-0.0656081, -1.396966, -1.786246, 0, 1, 0.7529412, 1,
-0.06526116, -1.356603, -4.796498, 0, 1, 0.7607843, 1,
-0.06277721, -1.005755, -2.776723, 0, 1, 0.7647059, 1,
-0.05298301, -0.4560075, -4.133706, 0, 1, 0.772549, 1,
-0.05014299, 1.440612, 0.6686763, 0, 1, 0.7764706, 1,
-0.04886445, -2.673219, -2.76855, 0, 1, 0.7843137, 1,
-0.04836611, -0.4289847, -1.894639, 0, 1, 0.7882353, 1,
-0.04666904, 0.9823679, -0.1795788, 0, 1, 0.7960784, 1,
-0.04608328, 1.839838, 0.3533129, 0, 1, 0.8039216, 1,
-0.04363199, -1.544549, -4.893353, 0, 1, 0.8078431, 1,
-0.0396634, -0.6833354, -3.239628, 0, 1, 0.8156863, 1,
-0.03656381, 0.226732, -0.09785863, 0, 1, 0.8196079, 1,
-0.02743635, 0.6231868, 0.2913534, 0, 1, 0.827451, 1,
-0.02679656, -0.4695366, -3.048986, 0, 1, 0.8313726, 1,
-0.01884428, -0.9623459, -3.844462, 0, 1, 0.8392157, 1,
-0.01222033, -1.336615, -3.637541, 0, 1, 0.8431373, 1,
-0.007449723, 0.5202711, -0.7500376, 0, 1, 0.8509804, 1,
-0.005711854, -1.760332, -3.47559, 0, 1, 0.854902, 1,
-0.005330398, 1.198133, 2.601958, 0, 1, 0.8627451, 1,
-0.005202502, 0.9242707, -0.6210346, 0, 1, 0.8666667, 1,
0.001309964, 0.1298432, -0.4985543, 0, 1, 0.8745098, 1,
0.001670194, 0.4643484, -1.251121, 0, 1, 0.8784314, 1,
0.004235049, -0.5313475, 1.948498, 0, 1, 0.8862745, 1,
0.004344095, -0.7169889, 2.782902, 0, 1, 0.8901961, 1,
0.005151365, -1.699342, 2.281611, 0, 1, 0.8980392, 1,
0.005592482, 0.84613, 0.1707403, 0, 1, 0.9058824, 1,
0.006849417, -0.3205897, 2.561485, 0, 1, 0.9098039, 1,
0.006921287, 0.4071184, -0.6390858, 0, 1, 0.9176471, 1,
0.007265458, 0.5264067, -0.2700737, 0, 1, 0.9215686, 1,
0.01027559, -0.2592444, 4.268629, 0, 1, 0.9294118, 1,
0.0117133, 0.9497149, -0.4773174, 0, 1, 0.9333333, 1,
0.01295767, -0.5662932, 4.03663, 0, 1, 0.9411765, 1,
0.01579771, -1.219153, 2.629927, 0, 1, 0.945098, 1,
0.02852611, -1.14624, 3.484553, 0, 1, 0.9529412, 1,
0.03026803, 0.1214139, 2.496371, 0, 1, 0.9568627, 1,
0.03243169, -1.006657, 2.663435, 0, 1, 0.9647059, 1,
0.0325646, -0.8882487, 2.732359, 0, 1, 0.9686275, 1,
0.03321731, -1.619753, 2.890299, 0, 1, 0.9764706, 1,
0.03406578, -0.4594212, 3.805409, 0, 1, 0.9803922, 1,
0.03574549, -1.060489, 3.900443, 0, 1, 0.9882353, 1,
0.03716728, 0.7058942, 1.689267, 0, 1, 0.9921569, 1,
0.037669, 1.318746, 1.433906, 0, 1, 1, 1,
0.03962622, 1.151112, -0.11701, 0, 0.9921569, 1, 1,
0.03997635, 0.2578241, 0.1401757, 0, 0.9882353, 1, 1,
0.04074131, -0.2065372, 3.852264, 0, 0.9803922, 1, 1,
0.04661533, 0.03956125, 1.391529, 0, 0.9764706, 1, 1,
0.04749519, -1.323995, 2.178892, 0, 0.9686275, 1, 1,
0.04815912, -1.510258, 1.785834, 0, 0.9647059, 1, 1,
0.04846022, 0.9090797, -1.577274, 0, 0.9568627, 1, 1,
0.05189883, -1.178536, 3.252304, 0, 0.9529412, 1, 1,
0.05323714, -1.042118, 2.290361, 0, 0.945098, 1, 1,
0.05327956, 1.11913, 0.9125984, 0, 0.9411765, 1, 1,
0.05335522, -0.1457257, 2.558923, 0, 0.9333333, 1, 1,
0.05645802, -0.9005043, 2.817497, 0, 0.9294118, 1, 1,
0.05938001, -0.8214437, 3.266515, 0, 0.9215686, 1, 1,
0.06092783, 0.6406272, 1.119415, 0, 0.9176471, 1, 1,
0.0620156, 0.7403604, -0.0324591, 0, 0.9098039, 1, 1,
0.06571954, -0.393236, 3.720775, 0, 0.9058824, 1, 1,
0.08103593, 1.481917, 0.8113852, 0, 0.8980392, 1, 1,
0.08137887, 0.5221909, -0.1883355, 0, 0.8901961, 1, 1,
0.08177723, -0.5857511, 3.688027, 0, 0.8862745, 1, 1,
0.08258205, 0.6083535, 1.927968, 0, 0.8784314, 1, 1,
0.08354218, -1.079011, 3.193049, 0, 0.8745098, 1, 1,
0.09652107, -0.1875675, 3.038724, 0, 0.8666667, 1, 1,
0.09790608, -0.3437313, 1.016259, 0, 0.8627451, 1, 1,
0.1003326, 0.7516015, -0.2519499, 0, 0.854902, 1, 1,
0.1013052, 0.1248864, 1.183628, 0, 0.8509804, 1, 1,
0.1036405, 0.5943851, -0.9744567, 0, 0.8431373, 1, 1,
0.1043835, 1.230257, 0.9661757, 0, 0.8392157, 1, 1,
0.1062005, -0.2541836, 3.077149, 0, 0.8313726, 1, 1,
0.1088055, -0.116425, 1.870465, 0, 0.827451, 1, 1,
0.1104142, 1.204364, 0.245327, 0, 0.8196079, 1, 1,
0.1108068, 0.1630635, 0.9312647, 0, 0.8156863, 1, 1,
0.1142337, 2.249066, 2.377253, 0, 0.8078431, 1, 1,
0.12171, -0.3702038, 3.927985, 0, 0.8039216, 1, 1,
0.1237401, -0.262915, 1.693938, 0, 0.7960784, 1, 1,
0.1252428, -0.2913051, 2.800756, 0, 0.7882353, 1, 1,
0.128612, -1.382401, 2.084744, 0, 0.7843137, 1, 1,
0.1355742, -0.8081136, 3.350318, 0, 0.7764706, 1, 1,
0.1393628, -0.8799722, 3.424543, 0, 0.772549, 1, 1,
0.1399453, -0.1927583, 1.529375, 0, 0.7647059, 1, 1,
0.1409498, -0.6315216, 3.245828, 0, 0.7607843, 1, 1,
0.1443467, 0.5135364, 1.340494, 0, 0.7529412, 1, 1,
0.1476192, -0.7431508, 1.367905, 0, 0.7490196, 1, 1,
0.1490334, 0.8405216, -1.912975, 0, 0.7411765, 1, 1,
0.1501435, 1.183742, -1.086295, 0, 0.7372549, 1, 1,
0.1544712, 0.6080535, -0.9147478, 0, 0.7294118, 1, 1,
0.1546456, 0.5791416, 0.2992689, 0, 0.7254902, 1, 1,
0.1620389, 0.05309931, 0.5609505, 0, 0.7176471, 1, 1,
0.1623854, 0.6734908, -0.6074321, 0, 0.7137255, 1, 1,
0.1626271, -1.812351, 3.913377, 0, 0.7058824, 1, 1,
0.1628983, -0.09997751, 3.479239, 0, 0.6980392, 1, 1,
0.1629553, 0.1313098, 0.7954508, 0, 0.6941177, 1, 1,
0.1652589, 0.8073736, 2.147491, 0, 0.6862745, 1, 1,
0.1767079, 1.175781, 1.546217, 0, 0.682353, 1, 1,
0.1863438, -0.8428642, 4.315277, 0, 0.6745098, 1, 1,
0.1874631, 1.47315, -0.5198961, 0, 0.6705883, 1, 1,
0.1885113, 0.9499839, 0.3467084, 0, 0.6627451, 1, 1,
0.1895803, 1.02754, 0.3512997, 0, 0.6588235, 1, 1,
0.1897781, -0.3693116, 3.610471, 0, 0.6509804, 1, 1,
0.1970914, 2.769929, -1.201227, 0, 0.6470588, 1, 1,
0.1972315, -0.188946, 3.111976, 0, 0.6392157, 1, 1,
0.2004158, 0.7288433, 0.4792606, 0, 0.6352941, 1, 1,
0.20078, 0.4878885, 0.5393308, 0, 0.627451, 1, 1,
0.2025803, -0.288845, 2.982446, 0, 0.6235294, 1, 1,
0.2068776, 2.012093, -1.195711, 0, 0.6156863, 1, 1,
0.2081468, 0.6347559, 0.5329111, 0, 0.6117647, 1, 1,
0.208238, -1.260481, 2.682192, 0, 0.6039216, 1, 1,
0.2122068, 2.091265, -0.04427573, 0, 0.5960785, 1, 1,
0.2138801, 0.8008292, -0.5536608, 0, 0.5921569, 1, 1,
0.2171333, -1.136495, 2.099416, 0, 0.5843138, 1, 1,
0.2201647, -0.1405493, 1.327732, 0, 0.5803922, 1, 1,
0.2238439, -1.38641, 1.130221, 0, 0.572549, 1, 1,
0.2249662, -0.48982, 1.915914, 0, 0.5686275, 1, 1,
0.2257116, -1.878559, 2.628755, 0, 0.5607843, 1, 1,
0.2295965, 0.1294292, 0.1120505, 0, 0.5568628, 1, 1,
0.2316582, 0.7103833, -0.1555097, 0, 0.5490196, 1, 1,
0.2346398, -0.07219581, 2.816239, 0, 0.5450981, 1, 1,
0.2361014, -0.5691945, 1.235856, 0, 0.5372549, 1, 1,
0.2381107, -0.08420491, 1.407675, 0, 0.5333334, 1, 1,
0.2395522, 1.223795, -1.25026, 0, 0.5254902, 1, 1,
0.2405906, 1.176622, -0.2120784, 0, 0.5215687, 1, 1,
0.2428762, -1.140073, 2.236498, 0, 0.5137255, 1, 1,
0.2435779, -0.3325886, 2.6138, 0, 0.509804, 1, 1,
0.2435918, -1.833078, 4.24999, 0, 0.5019608, 1, 1,
0.2469538, 1.346959, 0.04682295, 0, 0.4941176, 1, 1,
0.2487989, 1.871718, 1.381931, 0, 0.4901961, 1, 1,
0.2498856, 0.9299224, -1.126254, 0, 0.4823529, 1, 1,
0.2517213, -0.366718, 2.103209, 0, 0.4784314, 1, 1,
0.2551836, 1.329455, -0.2220805, 0, 0.4705882, 1, 1,
0.2554545, -0.5541849, 2.375051, 0, 0.4666667, 1, 1,
0.2562491, -0.5252256, 3.004048, 0, 0.4588235, 1, 1,
0.2574193, 0.193706, 1.81336, 0, 0.454902, 1, 1,
0.2592484, 0.4863047, 0.6457703, 0, 0.4470588, 1, 1,
0.2622411, -0.6258274, 0.7179187, 0, 0.4431373, 1, 1,
0.2663951, -1.25774, 1.173043, 0, 0.4352941, 1, 1,
0.271753, 0.0127442, 0.5911887, 0, 0.4313726, 1, 1,
0.2717563, -1.929245, 2.629764, 0, 0.4235294, 1, 1,
0.272112, 2.037326, -0.6609704, 0, 0.4196078, 1, 1,
0.2732787, 0.2075103, 1.24983, 0, 0.4117647, 1, 1,
0.2738273, -0.5153098, 2.803773, 0, 0.4078431, 1, 1,
0.2860284, 0.1775315, 1.505877, 0, 0.4, 1, 1,
0.2901646, 0.6822774, -0.4001976, 0, 0.3921569, 1, 1,
0.2914588, -1.821101, 1.952698, 0, 0.3882353, 1, 1,
0.2964914, 0.5460622, 0.9178004, 0, 0.3803922, 1, 1,
0.3039567, -1.3312, 3.5928, 0, 0.3764706, 1, 1,
0.3041818, 0.1119305, -0.4239093, 0, 0.3686275, 1, 1,
0.3047333, -1.3838, 3.669794, 0, 0.3647059, 1, 1,
0.3057012, 0.3036951, 1.514422, 0, 0.3568628, 1, 1,
0.3060069, -0.04786066, 2.456152, 0, 0.3529412, 1, 1,
0.3090235, 0.2471378, -0.8994116, 0, 0.345098, 1, 1,
0.3111815, -1.122159, 1.757689, 0, 0.3411765, 1, 1,
0.3218381, -0.3750508, 0.4347011, 0, 0.3333333, 1, 1,
0.3244555, -0.2508031, 1.266731, 0, 0.3294118, 1, 1,
0.3318834, -1.408829, 3.521312, 0, 0.3215686, 1, 1,
0.3319291, -0.3944844, 0.3891299, 0, 0.3176471, 1, 1,
0.3322789, -0.7257425, 4.494739, 0, 0.3098039, 1, 1,
0.3333762, 1.42758, -0.005288508, 0, 0.3058824, 1, 1,
0.3338436, -0.4912952, 2.839797, 0, 0.2980392, 1, 1,
0.3343191, 0.03325975, 1.591253, 0, 0.2901961, 1, 1,
0.3345799, -1.469119, 4.209263, 0, 0.2862745, 1, 1,
0.3367644, 1.266788, 0.5381279, 0, 0.2784314, 1, 1,
0.3375619, 0.4589536, 1.843587, 0, 0.2745098, 1, 1,
0.3411168, 1.066555, 0.9405988, 0, 0.2666667, 1, 1,
0.3443515, -1.278602, 3.602215, 0, 0.2627451, 1, 1,
0.3458206, -1.110029, 2.604276, 0, 0.254902, 1, 1,
0.3461499, 0.9102474, -0.2617932, 0, 0.2509804, 1, 1,
0.3462482, -0.4411954, 2.580725, 0, 0.2431373, 1, 1,
0.3507583, -1.973447, 3.206306, 0, 0.2392157, 1, 1,
0.3535916, -0.4629201, 2.254631, 0, 0.2313726, 1, 1,
0.353975, -1.686124, 2.820245, 0, 0.227451, 1, 1,
0.3569902, 0.6260596, 2.123673, 0, 0.2196078, 1, 1,
0.3596876, 1.395665, 1.565932, 0, 0.2156863, 1, 1,
0.3664542, -1.328697, 3.745302, 0, 0.2078431, 1, 1,
0.369454, 0.1971088, 0.00928528, 0, 0.2039216, 1, 1,
0.3713165, -0.4031152, 2.32957, 0, 0.1960784, 1, 1,
0.3715133, -1.144108, 2.355569, 0, 0.1882353, 1, 1,
0.373789, 2.060278, 1.103339, 0, 0.1843137, 1, 1,
0.3769607, -1.432104, 4.154924, 0, 0.1764706, 1, 1,
0.3779662, -0.4663049, 1.787243, 0, 0.172549, 1, 1,
0.3842112, 0.02745654, 1.832788, 0, 0.1647059, 1, 1,
0.3914381, 1.348735, 0.5299805, 0, 0.1607843, 1, 1,
0.3918385, 0.4944274, 0.6931877, 0, 0.1529412, 1, 1,
0.3939571, -0.9248312, 3.132136, 0, 0.1490196, 1, 1,
0.3988843, 1.457714, 0.311441, 0, 0.1411765, 1, 1,
0.4046836, -1.777853, 3.866824, 0, 0.1372549, 1, 1,
0.4057416, -2.535583, 3.825544, 0, 0.1294118, 1, 1,
0.4070757, 1.00659, 1.431939, 0, 0.1254902, 1, 1,
0.4122717, 0.075539, 0.8599474, 0, 0.1176471, 1, 1,
0.4127527, -0.7928899, 3.453333, 0, 0.1137255, 1, 1,
0.4153006, 1.026053, -1.42016, 0, 0.1058824, 1, 1,
0.4195372, -0.6152286, 1.440423, 0, 0.09803922, 1, 1,
0.4200214, 0.4381775, 1.679179, 0, 0.09411765, 1, 1,
0.420411, 0.2489407, 0.6203053, 0, 0.08627451, 1, 1,
0.4216323, 0.7858346, 0.08951907, 0, 0.08235294, 1, 1,
0.4233533, 0.09593322, 1.276281, 0, 0.07450981, 1, 1,
0.4256214, 0.9719912, 1.793777, 0, 0.07058824, 1, 1,
0.4349831, 0.2887729, 2.392789, 0, 0.0627451, 1, 1,
0.4358012, -0.171579, 0.07278809, 0, 0.05882353, 1, 1,
0.4358427, -0.4084874, 1.16097, 0, 0.05098039, 1, 1,
0.4361956, 0.2456372, 1.040724, 0, 0.04705882, 1, 1,
0.4387061, 0.5855846, 1.746199, 0, 0.03921569, 1, 1,
0.4388049, -0.6752694, 2.895097, 0, 0.03529412, 1, 1,
0.4392974, -0.7344853, 4.203794, 0, 0.02745098, 1, 1,
0.4437566, -0.2763921, 2.047676, 0, 0.02352941, 1, 1,
0.4443808, -0.1569465, 0.9490702, 0, 0.01568628, 1, 1,
0.4483292, 0.03088469, 3.158267, 0, 0.01176471, 1, 1,
0.449023, 0.5142208, 1.316072, 0, 0.003921569, 1, 1,
0.449316, 0.5505872, 0.3921891, 0.003921569, 0, 1, 1,
0.4501517, 2.557283, 0.8626191, 0.007843138, 0, 1, 1,
0.4540123, 0.4257081, -0.04194624, 0.01568628, 0, 1, 1,
0.4590027, 0.06742517, 0.2134439, 0.01960784, 0, 1, 1,
0.4624491, -0.03694689, 3.095223, 0.02745098, 0, 1, 1,
0.4630504, 0.2873347, 0.5837504, 0.03137255, 0, 1, 1,
0.4665033, -0.9944161, 1.902796, 0.03921569, 0, 1, 1,
0.4682169, 0.3837773, 0.6032295, 0.04313726, 0, 1, 1,
0.4749223, -1.323393, 3.229352, 0.05098039, 0, 1, 1,
0.4806594, 0.1889864, 1.400196, 0.05490196, 0, 1, 1,
0.486564, 1.521561, 0.3348574, 0.0627451, 0, 1, 1,
0.4923266, -0.06055085, 0.9836477, 0.06666667, 0, 1, 1,
0.495403, -0.2318545, 2.486555, 0.07450981, 0, 1, 1,
0.5001677, -0.7043353, 2.17534, 0.07843138, 0, 1, 1,
0.5032668, 2.047832, 0.9811116, 0.08627451, 0, 1, 1,
0.50443, -0.6467085, 2.310259, 0.09019608, 0, 1, 1,
0.5049638, 0.997667, -0.4911342, 0.09803922, 0, 1, 1,
0.5058697, -0.8321594, 2.846204, 0.1058824, 0, 1, 1,
0.5065287, 0.9261158, 1.217251, 0.1098039, 0, 1, 1,
0.5079429, 0.06472052, 2.569307, 0.1176471, 0, 1, 1,
0.5101507, -0.333551, 2.454402, 0.1215686, 0, 1, 1,
0.5105102, 0.1010421, 1.073277, 0.1294118, 0, 1, 1,
0.5159281, 0.6736748, 1.748767, 0.1333333, 0, 1, 1,
0.5180936, 0.4482409, 1.13304, 0.1411765, 0, 1, 1,
0.5208365, -0.1717771, 0.1204135, 0.145098, 0, 1, 1,
0.5241084, 0.681327, 2.600814, 0.1529412, 0, 1, 1,
0.5255452, 0.4336377, -1.554014, 0.1568628, 0, 1, 1,
0.5319443, -0.7394271, 1.357369, 0.1647059, 0, 1, 1,
0.5405372, 0.1769161, 1.127326, 0.1686275, 0, 1, 1,
0.5464445, 0.2200309, 1.8577, 0.1764706, 0, 1, 1,
0.5490552, 0.7392652, 0.6517531, 0.1803922, 0, 1, 1,
0.5495089, -1.848617, 3.130376, 0.1882353, 0, 1, 1,
0.5501643, -1.761157, 2.667227, 0.1921569, 0, 1, 1,
0.5520768, 0.3399127, -0.9196688, 0.2, 0, 1, 1,
0.5534249, 0.322939, 2.267942, 0.2078431, 0, 1, 1,
0.5565638, -0.3952048, 2.513207, 0.2117647, 0, 1, 1,
0.5588508, 0.4414803, 1.400695, 0.2196078, 0, 1, 1,
0.5612625, -0.1445286, 0.5890477, 0.2235294, 0, 1, 1,
0.5650256, -0.1777045, 2.751431, 0.2313726, 0, 1, 1,
0.5691994, -0.1646185, 2.305578, 0.2352941, 0, 1, 1,
0.569959, 0.5227149, 0.003896866, 0.2431373, 0, 1, 1,
0.5721216, -0.3910018, 3.175102, 0.2470588, 0, 1, 1,
0.5804019, -1.820123, 2.736236, 0.254902, 0, 1, 1,
0.5817747, 0.033593, 0.9927407, 0.2588235, 0, 1, 1,
0.5847746, -0.286751, 1.216676, 0.2666667, 0, 1, 1,
0.5889832, -1.406594, 3.069414, 0.2705882, 0, 1, 1,
0.5939957, 0.7213006, 0.7123702, 0.2784314, 0, 1, 1,
0.5950499, -2.480776, 1.962868, 0.282353, 0, 1, 1,
0.5964475, -1.046375, 1.490316, 0.2901961, 0, 1, 1,
0.5980893, -0.8789279, 2.537915, 0.2941177, 0, 1, 1,
0.5989768, -1.548454, 2.784171, 0.3019608, 0, 1, 1,
0.6023186, -0.6292397, 2.168446, 0.3098039, 0, 1, 1,
0.6025349, 0.03821224, -0.2620081, 0.3137255, 0, 1, 1,
0.603218, 0.7864055, 0.9955752, 0.3215686, 0, 1, 1,
0.6045739, 1.261286, 1.411772, 0.3254902, 0, 1, 1,
0.6049815, 0.7027477, 1.760807, 0.3333333, 0, 1, 1,
0.6052155, -1.400881, 2.066037, 0.3372549, 0, 1, 1,
0.6084939, 0.3077045, 0.9842775, 0.345098, 0, 1, 1,
0.6102208, -0.1722729, 1.97326, 0.3490196, 0, 1, 1,
0.6107289, -0.7469786, 3.622525, 0.3568628, 0, 1, 1,
0.6128994, 1.023285, 0.935618, 0.3607843, 0, 1, 1,
0.6137868, 1.000454, 0.06108287, 0.3686275, 0, 1, 1,
0.6144261, 0.9791202, 0.0975538, 0.372549, 0, 1, 1,
0.6201942, 0.5144288, 1.399248, 0.3803922, 0, 1, 1,
0.6246521, -0.2483574, 0.1324848, 0.3843137, 0, 1, 1,
0.6262159, -0.3370827, 2.113346, 0.3921569, 0, 1, 1,
0.6320731, -0.3454707, 1.000855, 0.3960784, 0, 1, 1,
0.6396974, 1.607223, 0.9014007, 0.4039216, 0, 1, 1,
0.6419443, -0.07510401, 0.9517922, 0.4117647, 0, 1, 1,
0.6437405, -0.3154365, 1.862845, 0.4156863, 0, 1, 1,
0.650447, 0.4830683, 0.9913063, 0.4235294, 0, 1, 1,
0.6559387, -0.7735552, 2.786977, 0.427451, 0, 1, 1,
0.6560078, 1.245851, 0.5675721, 0.4352941, 0, 1, 1,
0.6608956, 0.07635655, 1.933297, 0.4392157, 0, 1, 1,
0.6621683, -1.670795, 2.471781, 0.4470588, 0, 1, 1,
0.6659986, -1.537403, 0.2890826, 0.4509804, 0, 1, 1,
0.6699206, -0.7257655, 3.489754, 0.4588235, 0, 1, 1,
0.6706181, 0.1082246, 2.394141, 0.4627451, 0, 1, 1,
0.671252, 0.5819924, 1.694282, 0.4705882, 0, 1, 1,
0.6782048, 1.630287, 0.581463, 0.4745098, 0, 1, 1,
0.6798407, -1.66471, 3.018336, 0.4823529, 0, 1, 1,
0.6818447, 0.231135, 0.3970032, 0.4862745, 0, 1, 1,
0.6868511, -0.04729777, 2.055436, 0.4941176, 0, 1, 1,
0.6869593, -1.306296, 2.099355, 0.5019608, 0, 1, 1,
0.6878285, 0.7723961, -0.543157, 0.5058824, 0, 1, 1,
0.6904733, -0.1398772, 2.002178, 0.5137255, 0, 1, 1,
0.6946239, 1.058872, 0.06331964, 0.5176471, 0, 1, 1,
0.7025266, -0.9621841, 2.377486, 0.5254902, 0, 1, 1,
0.7089052, 0.6765412, 2.131705, 0.5294118, 0, 1, 1,
0.7094093, 2.496967, -1.393199, 0.5372549, 0, 1, 1,
0.7129453, 1.676173, 0.1430511, 0.5411765, 0, 1, 1,
0.7158887, 0.0009478078, 3.354628, 0.5490196, 0, 1, 1,
0.7163573, 0.3862078, 1.408956, 0.5529412, 0, 1, 1,
0.7166947, 0.5834173, 2.591025, 0.5607843, 0, 1, 1,
0.7232311, -0.9244648, 2.158779, 0.5647059, 0, 1, 1,
0.7255102, 1.285023, -0.6254628, 0.572549, 0, 1, 1,
0.7261716, 1.118411, -0.2709154, 0.5764706, 0, 1, 1,
0.7293221, 2.071414, 0.910745, 0.5843138, 0, 1, 1,
0.7319504, 0.4573587, -0.4343608, 0.5882353, 0, 1, 1,
0.7360306, 0.6422973, 0.547284, 0.5960785, 0, 1, 1,
0.7379549, -0.4881673, 0.7411274, 0.6039216, 0, 1, 1,
0.748768, 0.006420867, 3.846212, 0.6078432, 0, 1, 1,
0.7491433, -0.2859861, 1.409517, 0.6156863, 0, 1, 1,
0.7495121, 3.132502, -0.2593073, 0.6196079, 0, 1, 1,
0.7501893, -0.5178181, 1.17616, 0.627451, 0, 1, 1,
0.750888, -1.636067, 3.289206, 0.6313726, 0, 1, 1,
0.7561789, 1.245004, 1.647565, 0.6392157, 0, 1, 1,
0.7630249, 0.1190436, 1.021758, 0.6431373, 0, 1, 1,
0.7636357, 0.7614468, 1.09485, 0.6509804, 0, 1, 1,
0.7694538, -0.1671148, 0.2614053, 0.654902, 0, 1, 1,
0.7710855, -0.1382238, 2.504383, 0.6627451, 0, 1, 1,
0.7713155, 0.3458045, -0.05361571, 0.6666667, 0, 1, 1,
0.7725214, 1.855714, 1.655773, 0.6745098, 0, 1, 1,
0.7732326, -0.4494803, 3.124524, 0.6784314, 0, 1, 1,
0.7754904, 1.657606, 1.257883, 0.6862745, 0, 1, 1,
0.7795582, -0.4779554, 3.029655, 0.6901961, 0, 1, 1,
0.7830625, -1.255599, 1.580725, 0.6980392, 0, 1, 1,
0.7878377, -0.5037163, 1.994361, 0.7058824, 0, 1, 1,
0.7939634, -0.611528, 2.969583, 0.7098039, 0, 1, 1,
0.7956612, 0.5670779, 0.14165, 0.7176471, 0, 1, 1,
0.805649, -0.8835459, 0.7796877, 0.7215686, 0, 1, 1,
0.8087222, -1.111846, 1.810854, 0.7294118, 0, 1, 1,
0.8093277, -0.6247777, 1.960846, 0.7333333, 0, 1, 1,
0.812941, 1.684107, 0.2412581, 0.7411765, 0, 1, 1,
0.8201172, -0.2569179, 0.9313434, 0.7450981, 0, 1, 1,
0.8217805, 0.8220432, 0.8894784, 0.7529412, 0, 1, 1,
0.8286395, 0.5776851, 2.147471, 0.7568628, 0, 1, 1,
0.8296543, -0.7380956, 0.1128125, 0.7647059, 0, 1, 1,
0.8333251, -0.9743396, 0.5980013, 0.7686275, 0, 1, 1,
0.835861, -0.308858, 3.237543, 0.7764706, 0, 1, 1,
0.8369671, 1.336631, 0.05050642, 0.7803922, 0, 1, 1,
0.8378426, 1.229471, 0.7577989, 0.7882353, 0, 1, 1,
0.8410897, -1.105946, 0.7742578, 0.7921569, 0, 1, 1,
0.8453251, 0.7463111, 3.117167, 0.8, 0, 1, 1,
0.8477932, 2.445851, 0.6208035, 0.8078431, 0, 1, 1,
0.8494172, -0.2687383, 3.362388, 0.8117647, 0, 1, 1,
0.8512918, 1.365359, -0.3949382, 0.8196079, 0, 1, 1,
0.8524982, -0.4678514, 2.672971, 0.8235294, 0, 1, 1,
0.8590949, 0.1359653, -0.01847045, 0.8313726, 0, 1, 1,
0.8610235, -0.7517114, 2.087629, 0.8352941, 0, 1, 1,
0.861025, -0.05696646, 1.570961, 0.8431373, 0, 1, 1,
0.8631902, -0.1508181, 3.435264, 0.8470588, 0, 1, 1,
0.8642459, -0.9972266, 0.6924084, 0.854902, 0, 1, 1,
0.8653677, -0.6112536, 2.177867, 0.8588235, 0, 1, 1,
0.8744227, 0.3815381, 1.73884, 0.8666667, 0, 1, 1,
0.8757666, 0.1773356, 1.2466, 0.8705882, 0, 1, 1,
0.8781916, -0.6248843, 0.8285246, 0.8784314, 0, 1, 1,
0.8811584, -1.356481, 1.840618, 0.8823529, 0, 1, 1,
0.884773, 0.723873, 0.009358523, 0.8901961, 0, 1, 1,
0.8872236, -0.2754573, 1.178052, 0.8941177, 0, 1, 1,
0.8886718, 1.417902, 2.024313, 0.9019608, 0, 1, 1,
0.895524, 0.7188488, 0.5198719, 0.9098039, 0, 1, 1,
0.8955843, 1.092505, 0.3701864, 0.9137255, 0, 1, 1,
0.8964073, 1.1464, -0.3069732, 0.9215686, 0, 1, 1,
0.9060694, -1.408764, 2.961007, 0.9254902, 0, 1, 1,
0.9139879, -0.1710706, 2.225247, 0.9333333, 0, 1, 1,
0.91407, -0.9587864, 2.54911, 0.9372549, 0, 1, 1,
0.9140798, -0.4402906, 1.710994, 0.945098, 0, 1, 1,
0.9148162, 1.147752, 1.608951, 0.9490196, 0, 1, 1,
0.9198391, 0.2380506, 0.03610496, 0.9568627, 0, 1, 1,
0.920004, 0.9978102, 0.3277693, 0.9607843, 0, 1, 1,
0.9210098, 0.2766195, 3.45026, 0.9686275, 0, 1, 1,
0.9220741, 1.120945, -0.5890638, 0.972549, 0, 1, 1,
0.9268586, -0.255882, -0.08918833, 0.9803922, 0, 1, 1,
0.9281165, 0.1664739, 3.126153, 0.9843137, 0, 1, 1,
0.9307438, -0.06121393, 1.914235, 0.9921569, 0, 1, 1,
0.931883, 0.02159062, 2.404277, 0.9960784, 0, 1, 1,
0.9401792, 0.5357047, -0.8686959, 1, 0, 0.9960784, 1,
0.9510735, -1.07945, 2.803282, 1, 0, 0.9882353, 1,
0.9563081, -0.9883555, 2.801926, 1, 0, 0.9843137, 1,
0.9580558, -0.2975477, 1.511338, 1, 0, 0.9764706, 1,
0.9584365, 0.9983763, 1.293922, 1, 0, 0.972549, 1,
0.9648138, -0.6682519, 3.752876, 1, 0, 0.9647059, 1,
0.9695271, -2.536093, 1.3283, 1, 0, 0.9607843, 1,
0.9736349, -1.908201, 2.840157, 1, 0, 0.9529412, 1,
0.9769045, 1.56649, 0.4905125, 1, 0, 0.9490196, 1,
0.9786904, 2.254468, -0.1738723, 1, 0, 0.9411765, 1,
0.9794009, -1.390874, 4.065412, 1, 0, 0.9372549, 1,
0.9796405, -0.1887682, 2.528147, 1, 0, 0.9294118, 1,
0.9818865, -2.96046, 2.734905, 1, 0, 0.9254902, 1,
0.9841886, 0.0853883, 1.33747, 1, 0, 0.9176471, 1,
0.9894775, -0.9407316, 2.128317, 1, 0, 0.9137255, 1,
0.9945742, 0.3691402, 2.244177, 1, 0, 0.9058824, 1,
1.0044, -0.1571478, -0.3857384, 1, 0, 0.9019608, 1,
1.004807, 1.120247, 0.6395354, 1, 0, 0.8941177, 1,
1.0128, 0.3947642, 1.902914, 1, 0, 0.8862745, 1,
1.0298, 0.1896818, -0.01262259, 1, 0, 0.8823529, 1,
1.045078, -0.5102837, 3.021291, 1, 0, 0.8745098, 1,
1.059043, 1.182002, 2.539068, 1, 0, 0.8705882, 1,
1.06111, 0.7704985, -0.1265976, 1, 0, 0.8627451, 1,
1.0661, 0.3589855, 1.299379, 1, 0, 0.8588235, 1,
1.070367, 0.2483586, 0.09835039, 1, 0, 0.8509804, 1,
1.07063, 0.3816486, 2.570501, 1, 0, 0.8470588, 1,
1.075397, -1.184554, 4.514555, 1, 0, 0.8392157, 1,
1.07904, 0.03377669, 2.116887, 1, 0, 0.8352941, 1,
1.082324, -1.008836, 3.156067, 1, 0, 0.827451, 1,
1.083744, 0.9369656, 2.932782, 1, 0, 0.8235294, 1,
1.084092, 1.163642, 0.4559777, 1, 0, 0.8156863, 1,
1.085303, 0.9066796, 1.041644, 1, 0, 0.8117647, 1,
1.089231, 1.837665, -0.7687877, 1, 0, 0.8039216, 1,
1.091412, 1.145463, 0.2510116, 1, 0, 0.7960784, 1,
1.092007, -1.637463, 3.359435, 1, 0, 0.7921569, 1,
1.093737, -0.3091784, 1.769821, 1, 0, 0.7843137, 1,
1.094709, 0.1616847, 1.635313, 1, 0, 0.7803922, 1,
1.09475, 1.490497, 1.128996, 1, 0, 0.772549, 1,
1.095114, 0.5345482, 0.822022, 1, 0, 0.7686275, 1,
1.096488, -0.6374869, 0.8939782, 1, 0, 0.7607843, 1,
1.096637, 0.06140005, 0.7258647, 1, 0, 0.7568628, 1,
1.097712, 0.2365999, 0.04780115, 1, 0, 0.7490196, 1,
1.103957, -0.8009754, 2.775208, 1, 0, 0.7450981, 1,
1.113985, 0.1761794, 0.9614351, 1, 0, 0.7372549, 1,
1.119481, -1.554228, 2.617756, 1, 0, 0.7333333, 1,
1.14287, 2.103168, -0.3736973, 1, 0, 0.7254902, 1,
1.14477, -0.247222, 0.9605483, 1, 0, 0.7215686, 1,
1.152279, -0.6870055, 2.234099, 1, 0, 0.7137255, 1,
1.152611, 2.400522, 1.278285, 1, 0, 0.7098039, 1,
1.155472, -1.576501, 3.390218, 1, 0, 0.7019608, 1,
1.168527, 0.05056848, 2.625914, 1, 0, 0.6941177, 1,
1.179377, 2.545074, 0.7860828, 1, 0, 0.6901961, 1,
1.180333, 0.2557159, 1.432582, 1, 0, 0.682353, 1,
1.180905, 0.8655934, 0.04191813, 1, 0, 0.6784314, 1,
1.199931, 0.8332387, 1.056077, 1, 0, 0.6705883, 1,
1.2034, 0.3153029, 0.6096739, 1, 0, 0.6666667, 1,
1.207907, -0.897139, 1.960928, 1, 0, 0.6588235, 1,
1.210761, -1.134302, 3.223228, 1, 0, 0.654902, 1,
1.213958, -0.2131572, 0.8884041, 1, 0, 0.6470588, 1,
1.215199, -0.2429772, 0.8770415, 1, 0, 0.6431373, 1,
1.219303, 0.3134576, 1.854873, 1, 0, 0.6352941, 1,
1.225233, -0.7767258, 1.634894, 1, 0, 0.6313726, 1,
1.231797, 1.00512, 2.135643, 1, 0, 0.6235294, 1,
1.235107, 1.401847, 1.734408, 1, 0, 0.6196079, 1,
1.23905, -0.2196257, 1.141057, 1, 0, 0.6117647, 1,
1.252612, -1.995552, 1.190304, 1, 0, 0.6078432, 1,
1.253133, -0.4012416, 1.542789, 1, 0, 0.6, 1,
1.253977, 1.546477, 0.5605203, 1, 0, 0.5921569, 1,
1.257546, -1.402389, 0.4253866, 1, 0, 0.5882353, 1,
1.26394, 1.621506, 0.6460977, 1, 0, 0.5803922, 1,
1.27051, -0.4986545, 1.516337, 1, 0, 0.5764706, 1,
1.273081, -2.006002, 2.824435, 1, 0, 0.5686275, 1,
1.286294, 0.1554018, 1.879169, 1, 0, 0.5647059, 1,
1.287348, 0.8781172, -0.1017489, 1, 0, 0.5568628, 1,
1.293053, 0.04145199, 2.06786, 1, 0, 0.5529412, 1,
1.295271, 0.8639467, 1.834543, 1, 0, 0.5450981, 1,
1.300234, -0.9224932, 2.001538, 1, 0, 0.5411765, 1,
1.309131, -0.345432, 1.903379, 1, 0, 0.5333334, 1,
1.312044, -0.4923635, 3.042735, 1, 0, 0.5294118, 1,
1.31308, 0.4741135, 1.289204, 1, 0, 0.5215687, 1,
1.313121, 0.0007535823, 1.336122, 1, 0, 0.5176471, 1,
1.319117, 0.1701558, 2.181051, 1, 0, 0.509804, 1,
1.31993, -0.2718676, 0.6529078, 1, 0, 0.5058824, 1,
1.327554, 1.075159, 1.781151, 1, 0, 0.4980392, 1,
1.341087, -0.9971894, 1.738163, 1, 0, 0.4901961, 1,
1.343633, 0.1251131, 1.307472, 1, 0, 0.4862745, 1,
1.385403, -1.338105, 4.119175, 1, 0, 0.4784314, 1,
1.39357, 0.5500828, 1.056209, 1, 0, 0.4745098, 1,
1.402099, -1.466151, 1.989714, 1, 0, 0.4666667, 1,
1.416251, 0.2604797, -0.817625, 1, 0, 0.4627451, 1,
1.419618, 0.02217422, 1.994171, 1, 0, 0.454902, 1,
1.434947, 0.5352101, 0.4112865, 1, 0, 0.4509804, 1,
1.44778, -0.5135919, 1.886753, 1, 0, 0.4431373, 1,
1.460717, -0.126647, 0.05322922, 1, 0, 0.4392157, 1,
1.469622, 0.4540806, 1.479343, 1, 0, 0.4313726, 1,
1.474819, -0.6105577, 0.1963243, 1, 0, 0.427451, 1,
1.479871, -0.524364, 2.945042, 1, 0, 0.4196078, 1,
1.490644, 0.1990296, 2.143146, 1, 0, 0.4156863, 1,
1.500256, 1.772905, 1.227081, 1, 0, 0.4078431, 1,
1.51395, 0.1637483, 2.846057, 1, 0, 0.4039216, 1,
1.5217, -0.4037365, 4.182587, 1, 0, 0.3960784, 1,
1.534539, 0.2732939, 2.212117, 1, 0, 0.3882353, 1,
1.538816, -0.7717751, 2.439241, 1, 0, 0.3843137, 1,
1.539511, -0.9045113, 3.243642, 1, 0, 0.3764706, 1,
1.541743, 1.376465, -1.067543, 1, 0, 0.372549, 1,
1.550668, -0.7662382, 2.197498, 1, 0, 0.3647059, 1,
1.559435, 1.623062, 1.276299, 1, 0, 0.3607843, 1,
1.560655, 1.469707, 2.13112, 1, 0, 0.3529412, 1,
1.564478, -1.385591, 2.513584, 1, 0, 0.3490196, 1,
1.576261, 0.9842347, 2.509694, 1, 0, 0.3411765, 1,
1.588655, 1.214324, 0.4477524, 1, 0, 0.3372549, 1,
1.61645, 1.771131, 0.7135225, 1, 0, 0.3294118, 1,
1.620583, -0.3862567, 2.9021, 1, 0, 0.3254902, 1,
1.624434, 2.164781, 0.5477825, 1, 0, 0.3176471, 1,
1.629502, -0.5770893, 2.280091, 1, 0, 0.3137255, 1,
1.642221, 0.3501426, 1.061904, 1, 0, 0.3058824, 1,
1.653321, -0.1095969, 2.700447, 1, 0, 0.2980392, 1,
1.657522, 0.1487403, 0.1614585, 1, 0, 0.2941177, 1,
1.674044, -0.4257304, 2.970956, 1, 0, 0.2862745, 1,
1.679815, -1.173544, 2.860606, 1, 0, 0.282353, 1,
1.698551, -0.04848224, 2.19863, 1, 0, 0.2745098, 1,
1.72499, -1.791995, 3.304807, 1, 0, 0.2705882, 1,
1.732605, -1.320929, 0.1896344, 1, 0, 0.2627451, 1,
1.752652, 0.8250216, 1.227461, 1, 0, 0.2588235, 1,
1.762064, -0.06266198, 2.389641, 1, 0, 0.2509804, 1,
1.799909, 0.3484941, -0.3729404, 1, 0, 0.2470588, 1,
1.808411, -1.011637, 2.577525, 1, 0, 0.2392157, 1,
1.830173, -1.59749, 3.791998, 1, 0, 0.2352941, 1,
1.83109, 0.2525738, 1.993295, 1, 0, 0.227451, 1,
1.849422, -0.4908746, 2.210555, 1, 0, 0.2235294, 1,
1.860539, -1.616305, 1.717842, 1, 0, 0.2156863, 1,
1.866318, 0.707872, 0.6348971, 1, 0, 0.2117647, 1,
1.874002, -0.73983, 0.8124291, 1, 0, 0.2039216, 1,
1.883834, -0.9708642, 2.655868, 1, 0, 0.1960784, 1,
1.894265, -0.9288287, 2.418261, 1, 0, 0.1921569, 1,
1.902813, 0.4252501, 2.117231, 1, 0, 0.1843137, 1,
1.933793, 1.801061, 1.075603, 1, 0, 0.1803922, 1,
1.937465, 2.400204, 0.516778, 1, 0, 0.172549, 1,
1.978152, 0.01545478, 2.176718, 1, 0, 0.1686275, 1,
1.998155, -1.978368, 1.831787, 1, 0, 0.1607843, 1,
2.004431, 0.3425479, 0.6721936, 1, 0, 0.1568628, 1,
2.023014, 0.7375886, 0.0665765, 1, 0, 0.1490196, 1,
2.02603, -0.7344066, 3.93199, 1, 0, 0.145098, 1,
2.029434, -1.858025, 2.001582, 1, 0, 0.1372549, 1,
2.06554, 0.6551068, 0.8841573, 1, 0, 0.1333333, 1,
2.069228, -0.5964493, 1.794298, 1, 0, 0.1254902, 1,
2.078151, -0.7275998, -0.05009856, 1, 0, 0.1215686, 1,
2.082346, -0.656769, 2.025043, 1, 0, 0.1137255, 1,
2.17331, 1.315401, 0.128066, 1, 0, 0.1098039, 1,
2.190409, -1.140533, 1.136719, 1, 0, 0.1019608, 1,
2.191463, 0.7223338, 0.827082, 1, 0, 0.09411765, 1,
2.21164, -0.6076078, 1.775061, 1, 0, 0.09019608, 1,
2.218166, 1.166468, 0.9341081, 1, 0, 0.08235294, 1,
2.254455, -0.3570733, 1.467299, 1, 0, 0.07843138, 1,
2.306111, -1.235057, 2.79578, 1, 0, 0.07058824, 1,
2.320068, -0.5215877, 2.759712, 1, 0, 0.06666667, 1,
2.483095, 1.332741, 1.208567, 1, 0, 0.05882353, 1,
2.511677, -0.5656993, -0.4050735, 1, 0, 0.05490196, 1,
2.535781, 0.9687538, 1.47244, 1, 0, 0.04705882, 1,
2.582018, 0.9100939, 0.6862684, 1, 0, 0.04313726, 1,
2.748892, -0.5382276, 2.698954, 1, 0, 0.03529412, 1,
2.762174, -0.356689, 1.042106, 1, 0, 0.03137255, 1,
2.842535, -0.3522743, 1.543303, 1, 0, 0.02352941, 1,
2.904403, -0.1055891, 0.4884604, 1, 0, 0.01960784, 1,
3.005843, -1.399734, 3.611633, 1, 0, 0.01176471, 1,
3.083532, 0.7490091, 3.892662, 1, 0, 0.007843138, 1
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
-0.4166793, -4.464878, -6.487993, 0, -0.5, 0.5, 0.5,
-0.4166793, -4.464878, -6.487993, 1, -0.5, 0.5, 0.5,
-0.4166793, -4.464878, -6.487993, 1, 1.5, 0.5, 0.5,
-0.4166793, -4.464878, -6.487993, 0, 1.5, 0.5, 0.5
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
-5.103462, -0.06447375, -6.487993, 0, -0.5, 0.5, 0.5,
-5.103462, -0.06447375, -6.487993, 1, -0.5, 0.5, 0.5,
-5.103462, -0.06447375, -6.487993, 1, 1.5, 0.5, 0.5,
-5.103462, -0.06447375, -6.487993, 0, 1.5, 0.5, 0.5
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
-5.103462, -4.464878, -0.1893992, 0, -0.5, 0.5, 0.5,
-5.103462, -4.464878, -0.1893992, 1, -0.5, 0.5, 0.5,
-5.103462, -4.464878, -0.1893992, 1, 1.5, 0.5, 0.5,
-5.103462, -4.464878, -0.1893992, 0, 1.5, 0.5, 0.5
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
-2, -3.4494, -5.034472,
2, -3.4494, -5.034472,
-2, -3.4494, -5.034472,
-2, -3.618646, -5.276725,
0, -3.4494, -5.034472,
0, -3.618646, -5.276725,
2, -3.4494, -5.034472,
2, -3.618646, -5.276725
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
-2, -3.957139, -5.761232, 0, -0.5, 0.5, 0.5,
-2, -3.957139, -5.761232, 1, -0.5, 0.5, 0.5,
-2, -3.957139, -5.761232, 1, 1.5, 0.5, 0.5,
-2, -3.957139, -5.761232, 0, 1.5, 0.5, 0.5,
0, -3.957139, -5.761232, 0, -0.5, 0.5, 0.5,
0, -3.957139, -5.761232, 1, -0.5, 0.5, 0.5,
0, -3.957139, -5.761232, 1, 1.5, 0.5, 0.5,
0, -3.957139, -5.761232, 0, 1.5, 0.5, 0.5,
2, -3.957139, -5.761232, 0, -0.5, 0.5, 0.5,
2, -3.957139, -5.761232, 1, -0.5, 0.5, 0.5,
2, -3.957139, -5.761232, 1, 1.5, 0.5, 0.5,
2, -3.957139, -5.761232, 0, 1.5, 0.5, 0.5
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
-4.021896, -3, -5.034472,
-4.021896, 3, -5.034472,
-4.021896, -3, -5.034472,
-4.202157, -3, -5.276725,
-4.021896, -2, -5.034472,
-4.202157, -2, -5.276725,
-4.021896, -1, -5.034472,
-4.202157, -1, -5.276725,
-4.021896, 0, -5.034472,
-4.202157, 0, -5.276725,
-4.021896, 1, -5.034472,
-4.202157, 1, -5.276725,
-4.021896, 2, -5.034472,
-4.202157, 2, -5.276725,
-4.021896, 3, -5.034472,
-4.202157, 3, -5.276725
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
-4.562679, -3, -5.761232, 0, -0.5, 0.5, 0.5,
-4.562679, -3, -5.761232, 1, -0.5, 0.5, 0.5,
-4.562679, -3, -5.761232, 1, 1.5, 0.5, 0.5,
-4.562679, -3, -5.761232, 0, 1.5, 0.5, 0.5,
-4.562679, -2, -5.761232, 0, -0.5, 0.5, 0.5,
-4.562679, -2, -5.761232, 1, -0.5, 0.5, 0.5,
-4.562679, -2, -5.761232, 1, 1.5, 0.5, 0.5,
-4.562679, -2, -5.761232, 0, 1.5, 0.5, 0.5,
-4.562679, -1, -5.761232, 0, -0.5, 0.5, 0.5,
-4.562679, -1, -5.761232, 1, -0.5, 0.5, 0.5,
-4.562679, -1, -5.761232, 1, 1.5, 0.5, 0.5,
-4.562679, -1, -5.761232, 0, 1.5, 0.5, 0.5,
-4.562679, 0, -5.761232, 0, -0.5, 0.5, 0.5,
-4.562679, 0, -5.761232, 1, -0.5, 0.5, 0.5,
-4.562679, 0, -5.761232, 1, 1.5, 0.5, 0.5,
-4.562679, 0, -5.761232, 0, 1.5, 0.5, 0.5,
-4.562679, 1, -5.761232, 0, -0.5, 0.5, 0.5,
-4.562679, 1, -5.761232, 1, -0.5, 0.5, 0.5,
-4.562679, 1, -5.761232, 1, 1.5, 0.5, 0.5,
-4.562679, 1, -5.761232, 0, 1.5, 0.5, 0.5,
-4.562679, 2, -5.761232, 0, -0.5, 0.5, 0.5,
-4.562679, 2, -5.761232, 1, -0.5, 0.5, 0.5,
-4.562679, 2, -5.761232, 1, 1.5, 0.5, 0.5,
-4.562679, 2, -5.761232, 0, 1.5, 0.5, 0.5,
-4.562679, 3, -5.761232, 0, -0.5, 0.5, 0.5,
-4.562679, 3, -5.761232, 1, -0.5, 0.5, 0.5,
-4.562679, 3, -5.761232, 1, 1.5, 0.5, 0.5,
-4.562679, 3, -5.761232, 0, 1.5, 0.5, 0.5
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
-4.021896, -3.4494, -4,
-4.021896, -3.4494, 4,
-4.021896, -3.4494, -4,
-4.202157, -3.618646, -4,
-4.021896, -3.4494, -2,
-4.202157, -3.618646, -2,
-4.021896, -3.4494, 0,
-4.202157, -3.618646, 0,
-4.021896, -3.4494, 2,
-4.202157, -3.618646, 2,
-4.021896, -3.4494, 4,
-4.202157, -3.618646, 4
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
-4.562679, -3.957139, -4, 0, -0.5, 0.5, 0.5,
-4.562679, -3.957139, -4, 1, -0.5, 0.5, 0.5,
-4.562679, -3.957139, -4, 1, 1.5, 0.5, 0.5,
-4.562679, -3.957139, -4, 0, 1.5, 0.5, 0.5,
-4.562679, -3.957139, -2, 0, -0.5, 0.5, 0.5,
-4.562679, -3.957139, -2, 1, -0.5, 0.5, 0.5,
-4.562679, -3.957139, -2, 1, 1.5, 0.5, 0.5,
-4.562679, -3.957139, -2, 0, 1.5, 0.5, 0.5,
-4.562679, -3.957139, 0, 0, -0.5, 0.5, 0.5,
-4.562679, -3.957139, 0, 1, -0.5, 0.5, 0.5,
-4.562679, -3.957139, 0, 1, 1.5, 0.5, 0.5,
-4.562679, -3.957139, 0, 0, 1.5, 0.5, 0.5,
-4.562679, -3.957139, 2, 0, -0.5, 0.5, 0.5,
-4.562679, -3.957139, 2, 1, -0.5, 0.5, 0.5,
-4.562679, -3.957139, 2, 1, 1.5, 0.5, 0.5,
-4.562679, -3.957139, 2, 0, 1.5, 0.5, 0.5,
-4.562679, -3.957139, 4, 0, -0.5, 0.5, 0.5,
-4.562679, -3.957139, 4, 1, -0.5, 0.5, 0.5,
-4.562679, -3.957139, 4, 1, 1.5, 0.5, 0.5,
-4.562679, -3.957139, 4, 0, 1.5, 0.5, 0.5
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
-4.021896, -3.4494, -5.034472,
-4.021896, 3.320452, -5.034472,
-4.021896, -3.4494, 4.655673,
-4.021896, 3.320452, 4.655673,
-4.021896, -3.4494, -5.034472,
-4.021896, -3.4494, 4.655673,
-4.021896, 3.320452, -5.034472,
-4.021896, 3.320452, 4.655673,
-4.021896, -3.4494, -5.034472,
3.188538, -3.4494, -5.034472,
-4.021896, -3.4494, 4.655673,
3.188538, -3.4494, 4.655673,
-4.021896, 3.320452, -5.034472,
3.188538, 3.320452, -5.034472,
-4.021896, 3.320452, 4.655673,
3.188538, 3.320452, 4.655673,
3.188538, -3.4494, -5.034472,
3.188538, 3.320452, -5.034472,
3.188538, -3.4494, 4.655673,
3.188538, 3.320452, 4.655673,
3.188538, -3.4494, -5.034472,
3.188538, -3.4494, 4.655673,
3.188538, 3.320452, -5.034472,
3.188538, 3.320452, 4.655673
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
var radius = 7.393658;
var distance = 32.89522;
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
mvMatrix.translate( 0.4166793, 0.06447375, 0.1893992 );
mvMatrix.scale( 1.108694, 1.180848, 0.8249792 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.89522);
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
isoprocarb<-read.table("isoprocarb.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-isoprocarb$V2
```

```
## Error in eval(expr, envir, enclos): object 'isoprocarb' not found
```

```r
y<-isoprocarb$V3
```

```
## Error in eval(expr, envir, enclos): object 'isoprocarb' not found
```

```r
z<-isoprocarb$V4
```

```
## Error in eval(expr, envir, enclos): object 'isoprocarb' not found
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
-3.91689, 1.739813, 0.01952445, 0, 0, 1, 1, 1,
-2.93469, -0.03270145, -0.736757, 1, 0, 0, 1, 1,
-2.798392, -1.40119, -1.583711, 1, 0, 0, 1, 1,
-2.751317, 0.2599115, -2.477709, 1, 0, 0, 1, 1,
-2.664065, 0.4499847, -2.161855, 1, 0, 0, 1, 1,
-2.629871, -2.448808, -3.604889, 1, 0, 0, 1, 1,
-2.522803, -1.104089, -1.442149, 0, 0, 0, 1, 1,
-2.477386, 1.862, 0.5599152, 0, 0, 0, 1, 1,
-2.373883, -1.237737, -1.929619, 0, 0, 0, 1, 1,
-2.357154, -0.2404604, -1.212008, 0, 0, 0, 1, 1,
-2.353632, 0.04785899, -1.835155, 0, 0, 0, 1, 1,
-2.31551, 2.020945, -0.4766496, 0, 0, 0, 1, 1,
-2.203911, -1.231989, -2.772746, 0, 0, 0, 1, 1,
-2.096313, -0.7297384, -2.109957, 1, 1, 1, 1, 1,
-2.089721, 0.320915, -1.300126, 1, 1, 1, 1, 1,
-2.086586, -0.06503563, -1.514222, 1, 1, 1, 1, 1,
-2.082124, -0.0832869, -1.103697, 1, 1, 1, 1, 1,
-2.030717, 0.9178059, -0.7260947, 1, 1, 1, 1, 1,
-2.01249, -0.5382435, -0.6029937, 1, 1, 1, 1, 1,
-2.002318, 0.138077, 1.283799, 1, 1, 1, 1, 1,
-1.952326, 1.372241, -1.31606, 1, 1, 1, 1, 1,
-1.951007, 3.221862, -0.5725754, 1, 1, 1, 1, 1,
-1.932942, -1.056707, 0.3837257, 1, 1, 1, 1, 1,
-1.922422, -0.8294401, -0.8269355, 1, 1, 1, 1, 1,
-1.905689, -0.2949069, -1.307196, 1, 1, 1, 1, 1,
-1.900346, -0.4278069, -2.402889, 1, 1, 1, 1, 1,
-1.898816, 0.1330314, -2.14149, 1, 1, 1, 1, 1,
-1.854018, 0.3919754, -1.209984, 1, 1, 1, 1, 1,
-1.833757, 1.674092, -1.493661, 0, 0, 1, 1, 1,
-1.826641, 0.2017835, -1.046133, 1, 0, 0, 1, 1,
-1.813093, -1.258667, -3.087879, 1, 0, 0, 1, 1,
-1.81288, -1.697816, -0.986799, 1, 0, 0, 1, 1,
-1.800416, 0.5191485, -1.551508, 1, 0, 0, 1, 1,
-1.798195, 0.1662728, -2.565507, 1, 0, 0, 1, 1,
-1.776064, 0.6686592, -1.332405, 0, 0, 0, 1, 1,
-1.760363, 0.0419336, -1.480491, 0, 0, 0, 1, 1,
-1.759978, -0.5184141, -1.597407, 0, 0, 0, 1, 1,
-1.73876, 1.030971, -1.584527, 0, 0, 0, 1, 1,
-1.731956, -0.748848, -0.9133881, 0, 0, 0, 1, 1,
-1.730853, -0.2177604, -2.119386, 0, 0, 0, 1, 1,
-1.723417, 0.8916286, -0.6815791, 0, 0, 0, 1, 1,
-1.711044, 0.3663082, -1.709689, 1, 1, 1, 1, 1,
-1.703449, -1.893101, -1.871851, 1, 1, 1, 1, 1,
-1.702935, 0.05391556, -0.4352158, 1, 1, 1, 1, 1,
-1.697273, -1.861547, -3.158655, 1, 1, 1, 1, 1,
-1.690834, -1.7103, -2.232188, 1, 1, 1, 1, 1,
-1.687101, 0.5106282, -1.068682, 1, 1, 1, 1, 1,
-1.685684, 1.578938, -0.8032472, 1, 1, 1, 1, 1,
-1.662985, -0.5398616, -1.373925, 1, 1, 1, 1, 1,
-1.660243, 1.354808, -1.03481, 1, 1, 1, 1, 1,
-1.656535, 0.2036697, -1.911895, 1, 1, 1, 1, 1,
-1.641725, 0.2444117, -0.4613758, 1, 1, 1, 1, 1,
-1.634864, -1.112656, -1.880381, 1, 1, 1, 1, 1,
-1.613365, 1.222476, -1.958915, 1, 1, 1, 1, 1,
-1.609309, -2.198042, -4.067302, 1, 1, 1, 1, 1,
-1.599798, 0.6648615, -0.9478434, 1, 1, 1, 1, 1,
-1.599422, -0.5374945, -2.037489, 0, 0, 1, 1, 1,
-1.566734, 1.778783, 0.09566999, 1, 0, 0, 1, 1,
-1.560971, 0.5690602, 0.3003211, 1, 0, 0, 1, 1,
-1.557687, 1.441749, -1.438267, 1, 0, 0, 1, 1,
-1.546347, -0.6445196, -1.431108, 1, 0, 0, 1, 1,
-1.542963, -0.07901218, -0.9026607, 1, 0, 0, 1, 1,
-1.535327, 0.1726744, -3.714476, 0, 0, 0, 1, 1,
-1.534492, -0.0937266, -3.057944, 0, 0, 0, 1, 1,
-1.530319, -0.2342775, -1.903124, 0, 0, 0, 1, 1,
-1.52899, -0.4232248, -1.753134, 0, 0, 0, 1, 1,
-1.527393, 0.04532724, -2.405173, 0, 0, 0, 1, 1,
-1.524429, -0.774213, -1.247914, 0, 0, 0, 1, 1,
-1.518491, 0.2771285, -2.248061, 0, 0, 0, 1, 1,
-1.514636, -0.2652335, -2.65928, 1, 1, 1, 1, 1,
-1.507875, 0.4316943, -1.784474, 1, 1, 1, 1, 1,
-1.503558, 1.216343, -0.4368034, 1, 1, 1, 1, 1,
-1.495524, 0.9681608, -1.56754, 1, 1, 1, 1, 1,
-1.495355, 1.899072, -0.9985119, 1, 1, 1, 1, 1,
-1.494327, 0.6155924, -3.877799, 1, 1, 1, 1, 1,
-1.483486, -0.5533905, -4.211653, 1, 1, 1, 1, 1,
-1.466877, -1.107466, -0.8801083, 1, 1, 1, 1, 1,
-1.455085, -3.35081, -3.179755, 1, 1, 1, 1, 1,
-1.433243, -0.03146545, -1.181305, 1, 1, 1, 1, 1,
-1.422496, -1.309431, -2.404705, 1, 1, 1, 1, 1,
-1.416994, 0.1076239, -2.116075, 1, 1, 1, 1, 1,
-1.413785, -0.697361, -3.05329, 1, 1, 1, 1, 1,
-1.410721, 0.2787675, -1.165882, 1, 1, 1, 1, 1,
-1.398637, 1.610104, -0.7215466, 1, 1, 1, 1, 1,
-1.395296, 0.3412533, -1.834547, 0, 0, 1, 1, 1,
-1.375342, -2.102214, -2.898003, 1, 0, 0, 1, 1,
-1.361014, 1.550721, -0.02792417, 1, 0, 0, 1, 1,
-1.360752, 0.3302724, -2.700833, 1, 0, 0, 1, 1,
-1.348562, 0.4353934, -1.203417, 1, 0, 0, 1, 1,
-1.341603, -0.03569108, -1.069194, 1, 0, 0, 1, 1,
-1.332075, 0.6206399, -1.040962, 0, 0, 0, 1, 1,
-1.30864, 0.9843636, -2.679413, 0, 0, 0, 1, 1,
-1.306429, 0.3716184, -2.292098, 0, 0, 0, 1, 1,
-1.305017, -0.6532057, -2.16988, 0, 0, 0, 1, 1,
-1.304347, -0.08190258, -1.466858, 0, 0, 0, 1, 1,
-1.303649, 0.1789581, -3.594807, 0, 0, 0, 1, 1,
-1.288463, 1.43427, -0.1316825, 0, 0, 0, 1, 1,
-1.283815, -0.6913357, 0.3776327, 1, 1, 1, 1, 1,
-1.266968, -0.2539856, -2.368224, 1, 1, 1, 1, 1,
-1.265119, -0.7236374, -2.429559, 1, 1, 1, 1, 1,
-1.261663, 0.06828009, 0.4898246, 1, 1, 1, 1, 1,
-1.256533, -0.7420135, -2.878099, 1, 1, 1, 1, 1,
-1.254696, -0.7346103, -3.448473, 1, 1, 1, 1, 1,
-1.251544, -0.6205624, -1.325781, 1, 1, 1, 1, 1,
-1.239741, -1.562621, -1.907343, 1, 1, 1, 1, 1,
-1.234251, -2.271065, -2.052156, 1, 1, 1, 1, 1,
-1.233215, -1.376611, -3.087639, 1, 1, 1, 1, 1,
-1.228464, 1.264729, -0.1271987, 1, 1, 1, 1, 1,
-1.216097, 0.2041947, -0.7730877, 1, 1, 1, 1, 1,
-1.212338, -0.07456376, -2.585615, 1, 1, 1, 1, 1,
-1.21125, 1.442814, 0.8422833, 1, 1, 1, 1, 1,
-1.210376, -1.003886, -2.347037, 1, 1, 1, 1, 1,
-1.192735, -0.9139158, -2.292448, 0, 0, 1, 1, 1,
-1.188731, -1.657723, -3.484359, 1, 0, 0, 1, 1,
-1.188544, -0.6579546, -1.241722, 1, 0, 0, 1, 1,
-1.1827, 0.9857594, -0.3948168, 1, 0, 0, 1, 1,
-1.182304, 0.9629964, -1.085127, 1, 0, 0, 1, 1,
-1.180046, 0.04117082, -2.356506, 1, 0, 0, 1, 1,
-1.176006, 0.6737415, -1.203585, 0, 0, 0, 1, 1,
-1.17463, -0.4995385, -2.82155, 0, 0, 0, 1, 1,
-1.170594, 0.3689929, -1.909094, 0, 0, 0, 1, 1,
-1.170037, -0.4299071, -2.603303, 0, 0, 0, 1, 1,
-1.161198, -0.5217197, -2.607313, 0, 0, 0, 1, 1,
-1.156655, -1.626162, -3.451412, 0, 0, 0, 1, 1,
-1.156621, -2.282221, -4.418212, 0, 0, 0, 1, 1,
-1.155786, -1.414902, -3.358504, 1, 1, 1, 1, 1,
-1.153889, 1.480525, -0.9324518, 1, 1, 1, 1, 1,
-1.153558, -0.9463561, -1.767373, 1, 1, 1, 1, 1,
-1.151751, -1.729852, -3.590155, 1, 1, 1, 1, 1,
-1.151688, 0.1059932, -1.124751, 1, 1, 1, 1, 1,
-1.148554, -2.199592, -3.422807, 1, 1, 1, 1, 1,
-1.146113, 0.3330698, -1.132406, 1, 1, 1, 1, 1,
-1.144824, 0.6295351, 0.6675285, 1, 1, 1, 1, 1,
-1.140163, 1.406108, 1.189237, 1, 1, 1, 1, 1,
-1.13431, 0.1186238, -0.7684357, 1, 1, 1, 1, 1,
-1.130609, 0.7769374, -0.3186632, 1, 1, 1, 1, 1,
-1.127914, -0.7714525, -0.9657049, 1, 1, 1, 1, 1,
-1.116655, 0.3225811, -2.450891, 1, 1, 1, 1, 1,
-1.110108, -0.808068, -3.114236, 1, 1, 1, 1, 1,
-1.106332, -1.998146, -2.77866, 1, 1, 1, 1, 1,
-1.090951, 0.31829, -1.169274, 0, 0, 1, 1, 1,
-1.07369, -0.4216218, -1.784967, 1, 0, 0, 1, 1,
-1.073235, 1.144524, -1.928063, 1, 0, 0, 1, 1,
-1.064787, -0.1697286, -2.043566, 1, 0, 0, 1, 1,
-1.045175, 0.8611549, -3.520186, 1, 0, 0, 1, 1,
-1.044107, 1.299242, 1.34465, 1, 0, 0, 1, 1,
-1.04187, 0.4629225, -1.020145, 0, 0, 0, 1, 1,
-1.028615, -0.8461868, -2.601173, 0, 0, 0, 1, 1,
-1.027826, -0.3676986, -0.9265919, 0, 0, 0, 1, 1,
-1.021774, 0.5909079, -1.129813, 0, 0, 0, 1, 1,
-1.016731, 0.2934439, -1.061146, 0, 0, 0, 1, 1,
-1.016283, -0.284235, -2.543973, 0, 0, 0, 1, 1,
-1.009093, -1.71223, -1.696561, 0, 0, 0, 1, 1,
-1.003629, -0.6856039, -2.887178, 1, 1, 1, 1, 1,
-1.003503, 0.02168003, -0.4708855, 1, 1, 1, 1, 1,
-0.9926344, -0.3897138, -2.335215, 1, 1, 1, 1, 1,
-0.9859116, 0.9589111, -1.140022, 1, 1, 1, 1, 1,
-0.9813331, 0.1364687, -2.353422, 1, 1, 1, 1, 1,
-0.9794822, 1.80635, -0.7045476, 1, 1, 1, 1, 1,
-0.9707429, 1.967636, 0.1018452, 1, 1, 1, 1, 1,
-0.9680095, 0.005087934, -2.478279, 1, 1, 1, 1, 1,
-0.9651198, -0.1872246, -2.740671, 1, 1, 1, 1, 1,
-0.9635128, -0.2350416, -1.59963, 1, 1, 1, 1, 1,
-0.9605069, -1.534232, -0.4665389, 1, 1, 1, 1, 1,
-0.9600917, 0.5438403, -1.424642, 1, 1, 1, 1, 1,
-0.9445487, 1.094813, -0.3498253, 1, 1, 1, 1, 1,
-0.9354513, -2.206706, -2.130246, 1, 1, 1, 1, 1,
-0.922555, 1.458628, 0.8198965, 1, 1, 1, 1, 1,
-0.9193063, -0.3683103, -0.8644904, 0, 0, 1, 1, 1,
-0.9141973, -1.068745, -1.932632, 1, 0, 0, 1, 1,
-0.9102817, 0.2599085, -1.01914, 1, 0, 0, 1, 1,
-0.9098184, 1.133635, -1.079285, 1, 0, 0, 1, 1,
-0.9049585, 0.05911658, -0.8081427, 1, 0, 0, 1, 1,
-0.904492, -0.4531761, -0.5103206, 1, 0, 0, 1, 1,
-0.8989188, 0.7130492, -2.013048, 0, 0, 0, 1, 1,
-0.8754504, 0.03971494, -0.9432364, 0, 0, 0, 1, 1,
-0.8666998, -1.130943, -2.848809, 0, 0, 0, 1, 1,
-0.8621106, 1.125857, -0.2287293, 0, 0, 0, 1, 1,
-0.8591089, 0.9054139, -1.693253, 0, 0, 0, 1, 1,
-0.854413, -1.328851, -1.078872, 0, 0, 0, 1, 1,
-0.8519068, -0.7521994, -1.842088, 0, 0, 0, 1, 1,
-0.8508101, 0.1701675, 0.9905613, 1, 1, 1, 1, 1,
-0.8477505, -1.432025, -2.635962, 1, 1, 1, 1, 1,
-0.8460112, -1.448433, -2.574307, 1, 1, 1, 1, 1,
-0.8440111, 0.8313753, -0.1598259, 1, 1, 1, 1, 1,
-0.841455, 1.076782, 0.4167836, 1, 1, 1, 1, 1,
-0.8400789, 0.2288846, -0.666347, 1, 1, 1, 1, 1,
-0.8388039, -0.8133419, -4.365179, 1, 1, 1, 1, 1,
-0.8387519, 0.7575533, -0.3986664, 1, 1, 1, 1, 1,
-0.8290541, -1.037609, -1.653794, 1, 1, 1, 1, 1,
-0.8276439, -0.8888921, -2.381514, 1, 1, 1, 1, 1,
-0.8182586, -1.388563, -1.514305, 1, 1, 1, 1, 1,
-0.8167298, -1.108141, -3.310164, 1, 1, 1, 1, 1,
-0.8085911, 1.018508, 0.4042414, 1, 1, 1, 1, 1,
-0.8080561, -1.022298, -2.434366, 1, 1, 1, 1, 1,
-0.8066158, -0.5475892, -3.276014, 1, 1, 1, 1, 1,
-0.8057394, -0.8533942, -0.7762788, 0, 0, 1, 1, 1,
-0.8027916, -0.1287336, -1.99265, 1, 0, 0, 1, 1,
-0.8018747, 0.3173011, 0.3590664, 1, 0, 0, 1, 1,
-0.7975238, 0.2691245, -2.287566, 1, 0, 0, 1, 1,
-0.7975106, 1.521352, -1.437745, 1, 0, 0, 1, 1,
-0.794592, -0.5903323, -1.368306, 1, 0, 0, 1, 1,
-0.794008, -0.4295547, -1.549079, 0, 0, 0, 1, 1,
-0.7914494, 0.7492079, -2.571688, 0, 0, 0, 1, 1,
-0.7899616, -0.2391927, -1.964524, 0, 0, 0, 1, 1,
-0.7887381, -0.02110301, -0.7222462, 0, 0, 0, 1, 1,
-0.7816449, -2.325669, -3.652957, 0, 0, 0, 1, 1,
-0.7791745, -0.7733359, -0.476181, 0, 0, 0, 1, 1,
-0.7787591, -0.1964277, -2.476809, 0, 0, 0, 1, 1,
-0.7771932, -1.647993, -2.38207, 1, 1, 1, 1, 1,
-0.7746258, 1.188124, -1.368543, 1, 1, 1, 1, 1,
-0.7742899, 0.7129312, -0.7019864, 1, 1, 1, 1, 1,
-0.7711991, -0.5658301, 2.036067, 1, 1, 1, 1, 1,
-0.7700627, -0.4818193, -2.60932, 1, 1, 1, 1, 1,
-0.7647183, 0.1050623, -1.740541, 1, 1, 1, 1, 1,
-0.7622371, -1.298356, -3.227786, 1, 1, 1, 1, 1,
-0.7599891, 0.1314492, 0.09258572, 1, 1, 1, 1, 1,
-0.7563489, 1.153699, -1.066879, 1, 1, 1, 1, 1,
-0.7552325, 0.4407302, -0.6620975, 1, 1, 1, 1, 1,
-0.7536885, 0.7445202, -0.5329475, 1, 1, 1, 1, 1,
-0.7522368, -0.2786153, -3.468648, 1, 1, 1, 1, 1,
-0.7515444, -0.0942625, -1.931951, 1, 1, 1, 1, 1,
-0.7512925, 0.1708064, -0.918543, 1, 1, 1, 1, 1,
-0.7486684, 0.3018083, -0.7882923, 1, 1, 1, 1, 1,
-0.7463755, -0.31564, -3.169165, 0, 0, 1, 1, 1,
-0.7460794, -1.42827, -1.661709, 1, 0, 0, 1, 1,
-0.7442469, -0.9111951, -3.035487, 1, 0, 0, 1, 1,
-0.743913, -0.6237444, -2.585362, 1, 0, 0, 1, 1,
-0.7427652, 1.987949, -0.1096824, 1, 0, 0, 1, 1,
-0.7329203, 0.6093745, 0.2496581, 1, 0, 0, 1, 1,
-0.7291636, -1.105724, -1.991658, 0, 0, 0, 1, 1,
-0.7289371, 0.772251, -0.6727582, 0, 0, 0, 1, 1,
-0.7285262, 1.161623, -2.283911, 0, 0, 0, 1, 1,
-0.7270311, 0.2974525, -1.586123, 0, 0, 0, 1, 1,
-0.7249668, -0.5557215, -0.3626639, 0, 0, 0, 1, 1,
-0.7237163, -0.6806133, -2.921606, 0, 0, 0, 1, 1,
-0.7189739, -1.308121, -1.629615, 0, 0, 0, 1, 1,
-0.7177245, -1.714813, -2.602183, 1, 1, 1, 1, 1,
-0.7149346, 1.234266, -0.614458, 1, 1, 1, 1, 1,
-0.7139273, 0.6345521, -2.691569, 1, 1, 1, 1, 1,
-0.7093244, 2.426913, -0.8945704, 1, 1, 1, 1, 1,
-0.709092, 0.2240655, -3.220078, 1, 1, 1, 1, 1,
-0.7070609, 1.412843, -2.314883, 1, 1, 1, 1, 1,
-0.7038382, 0.1045141, -0.3118668, 1, 1, 1, 1, 1,
-0.6902115, 0.3885368, -1.757952, 1, 1, 1, 1, 1,
-0.6877958, 0.06382075, -0.8248172, 1, 1, 1, 1, 1,
-0.6866702, -0.6467498, -2.202372, 1, 1, 1, 1, 1,
-0.6847422, 0.4955783, -2.608083, 1, 1, 1, 1, 1,
-0.6834526, -0.7924353, -1.855777, 1, 1, 1, 1, 1,
-0.6812356, -0.8648872, -2.090065, 1, 1, 1, 1, 1,
-0.6731544, 0.2321098, -1.779336, 1, 1, 1, 1, 1,
-0.6529006, -0.2599131, -1.773758, 1, 1, 1, 1, 1,
-0.6517249, -0.2613813, -2.078058, 0, 0, 1, 1, 1,
-0.6492251, 1.142496, 0.356347, 1, 0, 0, 1, 1,
-0.6485193, -0.5339211, -1.466805, 1, 0, 0, 1, 1,
-0.645658, 1.447127, 0.569796, 1, 0, 0, 1, 1,
-0.6410831, -0.1211763, -1.738466, 1, 0, 0, 1, 1,
-0.6404952, -0.4538473, -2.640573, 1, 0, 0, 1, 1,
-0.6352087, 1.78913, 0.6740956, 0, 0, 0, 1, 1,
-0.6292496, 0.2465335, -0.5995352, 0, 0, 0, 1, 1,
-0.628378, -0.3619528, -0.1533547, 0, 0, 0, 1, 1,
-0.6260238, -0.6844523, -2.145772, 0, 0, 0, 1, 1,
-0.62383, -0.3966019, -3.072612, 0, 0, 0, 1, 1,
-0.6176432, 0.9814562, -0.3165092, 0, 0, 0, 1, 1,
-0.6151915, 0.01512078, -0.7875163, 0, 0, 0, 1, 1,
-0.6147015, -0.2633494, -3.509089, 1, 1, 1, 1, 1,
-0.6138758, 0.374169, -2.085817, 1, 1, 1, 1, 1,
-0.6137302, 0.1423374, -1.753792, 1, 1, 1, 1, 1,
-0.6126921, 1.321426, -1.276803, 1, 1, 1, 1, 1,
-0.6071703, 0.6036122, -0.9679481, 1, 1, 1, 1, 1,
-0.6067783, 0.3170759, 0.093422, 1, 1, 1, 1, 1,
-0.6061574, 0.9627311, -1.028636, 1, 1, 1, 1, 1,
-0.6035746, 0.6758824, -3.239113, 1, 1, 1, 1, 1,
-0.6026774, -0.8896063, -4.191372, 1, 1, 1, 1, 1,
-0.6020738, -0.1256773, -0.9123684, 1, 1, 1, 1, 1,
-0.6020032, -2.066597, -4.243544, 1, 1, 1, 1, 1,
-0.6018823, -1.755823, -2.402739, 1, 1, 1, 1, 1,
-0.601334, -2.176635, -3.225796, 1, 1, 1, 1, 1,
-0.5939745, -1.787688, -3.032828, 1, 1, 1, 1, 1,
-0.5922258, -0.762948, -3.027606, 1, 1, 1, 1, 1,
-0.5920829, -0.04409587, -2.546561, 0, 0, 1, 1, 1,
-0.5913632, -1.42784, -2.808864, 1, 0, 0, 1, 1,
-0.5900729, -0.7984809, -2.101146, 1, 0, 0, 1, 1,
-0.5819777, -0.3693496, -2.429265, 1, 0, 0, 1, 1,
-0.5735145, -0.1189217, 0.4099732, 1, 0, 0, 1, 1,
-0.5727448, 1.111284, -1.692014, 1, 0, 0, 1, 1,
-0.5716868, 0.3375049, -0.5560098, 0, 0, 0, 1, 1,
-0.5697395, 0.5219667, -1.050393, 0, 0, 0, 1, 1,
-0.5665547, -0.1003965, -1.146063, 0, 0, 0, 1, 1,
-0.5659889, 0.6008127, -2.00967, 0, 0, 0, 1, 1,
-0.5543517, 0.07180785, -1.782936, 0, 0, 0, 1, 1,
-0.5539847, 0.6856344, 0.07739437, 0, 0, 0, 1, 1,
-0.5506266, -0.6986278, -4.531702, 0, 0, 0, 1, 1,
-0.5484387, 1.029978, -0.8530933, 1, 1, 1, 1, 1,
-0.5479549, -0.1327478, -2.574943, 1, 1, 1, 1, 1,
-0.5429825, -0.4528596, -3.816216, 1, 1, 1, 1, 1,
-0.534852, -1.514874, -3.01037, 1, 1, 1, 1, 1,
-0.534046, -0.1442527, -1.771627, 1, 1, 1, 1, 1,
-0.5316867, -1.068611, -2.661926, 1, 1, 1, 1, 1,
-0.5303931, 0.6236789, 1.304349, 1, 1, 1, 1, 1,
-0.5276366, -1.078641, -1.789541, 1, 1, 1, 1, 1,
-0.5219713, 0.1360735, -2.893214, 1, 1, 1, 1, 1,
-0.5214013, 1.517465, 1.079182, 1, 1, 1, 1, 1,
-0.5191684, -0.4353572, -3.266002, 1, 1, 1, 1, 1,
-0.5077423, -1.02305, -4.673161, 1, 1, 1, 1, 1,
-0.5051914, 0.7581072, -1.586421, 1, 1, 1, 1, 1,
-0.5044231, 0.4933226, -3.173062, 1, 1, 1, 1, 1,
-0.5002036, 0.9017754, -0.2325176, 1, 1, 1, 1, 1,
-0.4985099, 1.161202, -0.3393681, 0, 0, 1, 1, 1,
-0.4981339, 1.928686, -1.32317, 1, 0, 0, 1, 1,
-0.4950793, 1.19218, -0.1889362, 1, 0, 0, 1, 1,
-0.4940037, 0.4347807, -2.352596, 1, 0, 0, 1, 1,
-0.4936486, -0.8529361, -2.198635, 1, 0, 0, 1, 1,
-0.4847711, 1.452567, -0.1580853, 1, 0, 0, 1, 1,
-0.4799908, 1.047132, 0.6565705, 0, 0, 0, 1, 1,
-0.4758333, -1.865587, -2.166274, 0, 0, 0, 1, 1,
-0.4756266, -0.2094114, -1.801024, 0, 0, 0, 1, 1,
-0.4726267, 1.114819, -1.538014, 0, 0, 0, 1, 1,
-0.4701439, -0.6232561, -4.006059, 0, 0, 0, 1, 1,
-0.4685264, -0.04558888, -2.611329, 0, 0, 0, 1, 1,
-0.4678083, 0.419288, -0.2100819, 0, 0, 0, 1, 1,
-0.4591198, -0.4813139, -0.4085663, 1, 1, 1, 1, 1,
-0.4580934, -0.6182369, -3.766368, 1, 1, 1, 1, 1,
-0.447064, 1.48702, -0.1917709, 1, 1, 1, 1, 1,
-0.4453525, 1.543474, -0.3165359, 1, 1, 1, 1, 1,
-0.4452783, 0.8461245, -1.591285, 1, 1, 1, 1, 1,
-0.4446421, 1.04351, -0.6433638, 1, 1, 1, 1, 1,
-0.4429506, -0.1466596, -2.520802, 1, 1, 1, 1, 1,
-0.4348317, 0.8023357, 0.08409298, 1, 1, 1, 1, 1,
-0.4323791, 0.2416244, -0.7555848, 1, 1, 1, 1, 1,
-0.4302323, 0.5608108, -0.5244926, 1, 1, 1, 1, 1,
-0.4301552, 0.6834998, -1.826659, 1, 1, 1, 1, 1,
-0.4285978, 0.202417, -1.313074, 1, 1, 1, 1, 1,
-0.4262874, -0.7755084, -2.014953, 1, 1, 1, 1, 1,
-0.4238155, -1.368492, -4.437467, 1, 1, 1, 1, 1,
-0.4198133, -0.3690685, -1.817099, 1, 1, 1, 1, 1,
-0.417746, -1.596114, -3.89929, 0, 0, 1, 1, 1,
-0.4168472, 0.5087575, -0.124672, 1, 0, 0, 1, 1,
-0.4165616, -2.278069, -0.9484257, 1, 0, 0, 1, 1,
-0.414167, 1.410558, -1.121632, 1, 0, 0, 1, 1,
-0.4122962, -0.2987095, -2.153566, 1, 0, 0, 1, 1,
-0.4105788, 1.00937, -1.669976, 1, 0, 0, 1, 1,
-0.403726, 0.9467539, -2.02614, 0, 0, 0, 1, 1,
-0.4024402, -0.1203794, -0.5703593, 0, 0, 0, 1, 1,
-0.4005785, 0.9805978, 0.6129752, 0, 0, 0, 1, 1,
-0.3945936, -2.09267, -3.166138, 0, 0, 0, 1, 1,
-0.3897532, -0.3569295, -2.252424, 0, 0, 0, 1, 1,
-0.3860637, -0.5477155, -3.403867, 0, 0, 0, 1, 1,
-0.3808178, -0.5217903, -3.228253, 0, 0, 0, 1, 1,
-0.3797244, 1.27217, -0.4574486, 1, 1, 1, 1, 1,
-0.3706501, -1.468836, -2.627258, 1, 1, 1, 1, 1,
-0.3591465, 1.215242, 0.8023584, 1, 1, 1, 1, 1,
-0.3526302, -1.567598, -2.746852, 1, 1, 1, 1, 1,
-0.3500681, 1.725482, -0.3640872, 1, 1, 1, 1, 1,
-0.3495328, 2.127383, 0.7852702, 1, 1, 1, 1, 1,
-0.3485633, -0.397375, 0.8672628, 1, 1, 1, 1, 1,
-0.3473412, -0.4512241, -2.509839, 1, 1, 1, 1, 1,
-0.3464358, 0.3089592, 1.590363, 1, 1, 1, 1, 1,
-0.3436911, -0.6079538, 0.3637572, 1, 1, 1, 1, 1,
-0.3418956, -0.6374965, -3.250655, 1, 1, 1, 1, 1,
-0.3398215, 1.455381, -0.2047212, 1, 1, 1, 1, 1,
-0.3354003, -0.1962575, -2.623635, 1, 1, 1, 1, 1,
-0.3342297, -0.1779007, 1.38897, 1, 1, 1, 1, 1,
-0.3283915, -1.156724, -4.26512, 1, 1, 1, 1, 1,
-0.3280315, 1.323078, -0.001976157, 0, 0, 1, 1, 1,
-0.3248337, -0.8865798, -3.088799, 1, 0, 0, 1, 1,
-0.3209293, -0.005947115, -0.8257296, 1, 0, 0, 1, 1,
-0.3195763, -1.393691, -3.388224, 1, 0, 0, 1, 1,
-0.3187911, 1.700315, 1.178105, 1, 0, 0, 1, 1,
-0.3172635, -0.7698387, -3.169196, 1, 0, 0, 1, 1,
-0.3133937, -1.031827, -4.30559, 0, 0, 0, 1, 1,
-0.3123367, 0.2813898, -0.8506842, 0, 0, 0, 1, 1,
-0.3065661, -2.556453, -4.030018, 0, 0, 0, 1, 1,
-0.3062719, -0.2885872, -2.461214, 0, 0, 0, 1, 1,
-0.2996811, 0.09491766, -1.228426, 0, 0, 0, 1, 1,
-0.2982554, -0.1893809, -2.289935, 0, 0, 0, 1, 1,
-0.2921834, 1.852728, 1.425153, 0, 0, 0, 1, 1,
-0.2898629, -0.1940687, -2.391389, 1, 1, 1, 1, 1,
-0.2874203, -0.6403908, -3.454669, 1, 1, 1, 1, 1,
-0.2832448, 0.5683976, 0.8731387, 1, 1, 1, 1, 1,
-0.2829064, -1.515538, -2.591691, 1, 1, 1, 1, 1,
-0.2808884, -0.5181329, -1.789172, 1, 1, 1, 1, 1,
-0.2805477, 0.9096664, 0.5258942, 1, 1, 1, 1, 1,
-0.2762501, 1.313635, -0.1560581, 1, 1, 1, 1, 1,
-0.2704164, -1.223555, -1.408355, 1, 1, 1, 1, 1,
-0.2670556, 1.350037, -0.00603569, 1, 1, 1, 1, 1,
-0.2601465, 0.1252885, -1.021149, 1, 1, 1, 1, 1,
-0.2570194, 0.01826414, -1.117204, 1, 1, 1, 1, 1,
-0.2508623, 0.7718122, 0.7469466, 1, 1, 1, 1, 1,
-0.2498129, -0.3054348, -2.103588, 1, 1, 1, 1, 1,
-0.2409482, 0.2105018, -1.675918, 1, 1, 1, 1, 1,
-0.2395431, -1.509346, -4.744948, 1, 1, 1, 1, 1,
-0.2365336, 0.500892, -1.103649, 0, 0, 1, 1, 1,
-0.231352, -0.2173149, -2.412983, 1, 0, 0, 1, 1,
-0.2302372, 0.2723647, -1.072909, 1, 0, 0, 1, 1,
-0.2293707, 2.223474, 1.821816, 1, 0, 0, 1, 1,
-0.2248271, 1.382712, 1.346664, 1, 0, 0, 1, 1,
-0.2238724, -0.3139744, -2.314767, 1, 0, 0, 1, 1,
-0.2223373, 1.560575, 0.5882004, 0, 0, 0, 1, 1,
-0.2213879, 0.006909018, -2.724688, 0, 0, 0, 1, 1,
-0.2210943, -0.9170215, -0.8489363, 0, 0, 0, 1, 1,
-0.2202381, 0.05255322, -2.884746, 0, 0, 0, 1, 1,
-0.2198207, 0.5176523, 1.200548, 0, 0, 0, 1, 1,
-0.2185642, 0.06810885, -1.3707, 0, 0, 0, 1, 1,
-0.2163743, -1.22703, -2.587874, 0, 0, 0, 1, 1,
-0.2150826, 0.1391048, -1.273077, 1, 1, 1, 1, 1,
-0.2126637, -0.04084446, -2.175591, 1, 1, 1, 1, 1,
-0.2115978, 1.665744, -2.059163, 1, 1, 1, 1, 1,
-0.2094286, 1.255868, 1.956832, 1, 1, 1, 1, 1,
-0.2071913, -0.01183943, -0.8561568, 1, 1, 1, 1, 1,
-0.2003106, 0.2146091, -1.112647, 1, 1, 1, 1, 1,
-0.1995649, 0.8429776, -1.549109, 1, 1, 1, 1, 1,
-0.1991023, -1.512362, -3.934611, 1, 1, 1, 1, 1,
-0.1986366, 0.41592, -0.8489718, 1, 1, 1, 1, 1,
-0.19706, -0.2383258, -3.479189, 1, 1, 1, 1, 1,
-0.1960687, 0.4921294, -0.4165376, 1, 1, 1, 1, 1,
-0.1946543, -0.4510772, -2.484521, 1, 1, 1, 1, 1,
-0.1899538, -0.5379627, -2.496268, 1, 1, 1, 1, 1,
-0.1887846, 0.8307828, 0.07630926, 1, 1, 1, 1, 1,
-0.1801645, -0.4682836, -2.522322, 1, 1, 1, 1, 1,
-0.17375, -0.1335138, -2.893431, 0, 0, 1, 1, 1,
-0.1730536, 0.6936216, -0.1598295, 1, 0, 0, 1, 1,
-0.1725762, -0.3550129, -2.861781, 1, 0, 0, 1, 1,
-0.1724835, 0.3704622, 0.8046027, 1, 0, 0, 1, 1,
-0.1688558, -0.2039862, -2.771979, 1, 0, 0, 1, 1,
-0.1638463, 1.114259, -1.490101, 1, 0, 0, 1, 1,
-0.1575806, -0.5608237, -2.024635, 0, 0, 0, 1, 1,
-0.1530832, -0.4646978, -2.724533, 0, 0, 0, 1, 1,
-0.1514599, -0.4270804, -2.07653, 0, 0, 0, 1, 1,
-0.1484735, -0.09067915, -3.034522, 0, 0, 0, 1, 1,
-0.1464702, -1.510402, -2.666109, 0, 0, 0, 1, 1,
-0.1464248, 0.6853431, -1.334737, 0, 0, 0, 1, 1,
-0.141213, 0.9985399, -0.05841927, 0, 0, 0, 1, 1,
-0.138298, 0.2117283, -0.2209401, 1, 1, 1, 1, 1,
-0.1360132, -0.3813335, -2.694203, 1, 1, 1, 1, 1,
-0.131084, 0.862075, -0.2437999, 1, 1, 1, 1, 1,
-0.1298242, 0.2851306, -3.068142, 1, 1, 1, 1, 1,
-0.1277868, -0.4040759, -2.833891, 1, 1, 1, 1, 1,
-0.1264779, -0.5068935, -2.148025, 1, 1, 1, 1, 1,
-0.1263068, -1.138467, -2.909041, 1, 1, 1, 1, 1,
-0.1247068, -0.02729811, -3.041311, 1, 1, 1, 1, 1,
-0.1220874, 0.3968951, 1.157806, 1, 1, 1, 1, 1,
-0.1205341, -1.385994, -3.969846, 1, 1, 1, 1, 1,
-0.1190162, -0.07464024, -1.923, 1, 1, 1, 1, 1,
-0.1142474, 0.7024719, -0.3333253, 1, 1, 1, 1, 1,
-0.1142358, 1.213973, -0.07277677, 1, 1, 1, 1, 1,
-0.1119178, 0.5283055, -0.5020021, 1, 1, 1, 1, 1,
-0.1068353, 1.015897, -0.6411698, 1, 1, 1, 1, 1,
-0.1066938, -0.07443163, -3.28807, 0, 0, 1, 1, 1,
-0.1060209, 0.638132, 1.190969, 1, 0, 0, 1, 1,
-0.1036481, -0.9037458, -1.178424, 1, 0, 0, 1, 1,
-0.1007323, -0.6163493, -3.133588, 1, 0, 0, 1, 1,
-0.09833298, 0.9274359, -0.4412045, 1, 0, 0, 1, 1,
-0.09691039, -0.7679067, -2.671065, 1, 0, 0, 1, 1,
-0.09180569, 0.4884233, 0.1386322, 0, 0, 0, 1, 1,
-0.09027984, -0.9796315, -2.940859, 0, 0, 0, 1, 1,
-0.08729127, 0.6623721, 1.483889, 0, 0, 0, 1, 1,
-0.06799936, 0.2227705, -0.00854092, 0, 0, 0, 1, 1,
-0.06777295, -0.8865071, -3.138868, 0, 0, 0, 1, 1,
-0.0656081, -1.396966, -1.786246, 0, 0, 0, 1, 1,
-0.06526116, -1.356603, -4.796498, 0, 0, 0, 1, 1,
-0.06277721, -1.005755, -2.776723, 1, 1, 1, 1, 1,
-0.05298301, -0.4560075, -4.133706, 1, 1, 1, 1, 1,
-0.05014299, 1.440612, 0.6686763, 1, 1, 1, 1, 1,
-0.04886445, -2.673219, -2.76855, 1, 1, 1, 1, 1,
-0.04836611, -0.4289847, -1.894639, 1, 1, 1, 1, 1,
-0.04666904, 0.9823679, -0.1795788, 1, 1, 1, 1, 1,
-0.04608328, 1.839838, 0.3533129, 1, 1, 1, 1, 1,
-0.04363199, -1.544549, -4.893353, 1, 1, 1, 1, 1,
-0.0396634, -0.6833354, -3.239628, 1, 1, 1, 1, 1,
-0.03656381, 0.226732, -0.09785863, 1, 1, 1, 1, 1,
-0.02743635, 0.6231868, 0.2913534, 1, 1, 1, 1, 1,
-0.02679656, -0.4695366, -3.048986, 1, 1, 1, 1, 1,
-0.01884428, -0.9623459, -3.844462, 1, 1, 1, 1, 1,
-0.01222033, -1.336615, -3.637541, 1, 1, 1, 1, 1,
-0.007449723, 0.5202711, -0.7500376, 1, 1, 1, 1, 1,
-0.005711854, -1.760332, -3.47559, 0, 0, 1, 1, 1,
-0.005330398, 1.198133, 2.601958, 1, 0, 0, 1, 1,
-0.005202502, 0.9242707, -0.6210346, 1, 0, 0, 1, 1,
0.001309964, 0.1298432, -0.4985543, 1, 0, 0, 1, 1,
0.001670194, 0.4643484, -1.251121, 1, 0, 0, 1, 1,
0.004235049, -0.5313475, 1.948498, 1, 0, 0, 1, 1,
0.004344095, -0.7169889, 2.782902, 0, 0, 0, 1, 1,
0.005151365, -1.699342, 2.281611, 0, 0, 0, 1, 1,
0.005592482, 0.84613, 0.1707403, 0, 0, 0, 1, 1,
0.006849417, -0.3205897, 2.561485, 0, 0, 0, 1, 1,
0.006921287, 0.4071184, -0.6390858, 0, 0, 0, 1, 1,
0.007265458, 0.5264067, -0.2700737, 0, 0, 0, 1, 1,
0.01027559, -0.2592444, 4.268629, 0, 0, 0, 1, 1,
0.0117133, 0.9497149, -0.4773174, 1, 1, 1, 1, 1,
0.01295767, -0.5662932, 4.03663, 1, 1, 1, 1, 1,
0.01579771, -1.219153, 2.629927, 1, 1, 1, 1, 1,
0.02852611, -1.14624, 3.484553, 1, 1, 1, 1, 1,
0.03026803, 0.1214139, 2.496371, 1, 1, 1, 1, 1,
0.03243169, -1.006657, 2.663435, 1, 1, 1, 1, 1,
0.0325646, -0.8882487, 2.732359, 1, 1, 1, 1, 1,
0.03321731, -1.619753, 2.890299, 1, 1, 1, 1, 1,
0.03406578, -0.4594212, 3.805409, 1, 1, 1, 1, 1,
0.03574549, -1.060489, 3.900443, 1, 1, 1, 1, 1,
0.03716728, 0.7058942, 1.689267, 1, 1, 1, 1, 1,
0.037669, 1.318746, 1.433906, 1, 1, 1, 1, 1,
0.03962622, 1.151112, -0.11701, 1, 1, 1, 1, 1,
0.03997635, 0.2578241, 0.1401757, 1, 1, 1, 1, 1,
0.04074131, -0.2065372, 3.852264, 1, 1, 1, 1, 1,
0.04661533, 0.03956125, 1.391529, 0, 0, 1, 1, 1,
0.04749519, -1.323995, 2.178892, 1, 0, 0, 1, 1,
0.04815912, -1.510258, 1.785834, 1, 0, 0, 1, 1,
0.04846022, 0.9090797, -1.577274, 1, 0, 0, 1, 1,
0.05189883, -1.178536, 3.252304, 1, 0, 0, 1, 1,
0.05323714, -1.042118, 2.290361, 1, 0, 0, 1, 1,
0.05327956, 1.11913, 0.9125984, 0, 0, 0, 1, 1,
0.05335522, -0.1457257, 2.558923, 0, 0, 0, 1, 1,
0.05645802, -0.9005043, 2.817497, 0, 0, 0, 1, 1,
0.05938001, -0.8214437, 3.266515, 0, 0, 0, 1, 1,
0.06092783, 0.6406272, 1.119415, 0, 0, 0, 1, 1,
0.0620156, 0.7403604, -0.0324591, 0, 0, 0, 1, 1,
0.06571954, -0.393236, 3.720775, 0, 0, 0, 1, 1,
0.08103593, 1.481917, 0.8113852, 1, 1, 1, 1, 1,
0.08137887, 0.5221909, -0.1883355, 1, 1, 1, 1, 1,
0.08177723, -0.5857511, 3.688027, 1, 1, 1, 1, 1,
0.08258205, 0.6083535, 1.927968, 1, 1, 1, 1, 1,
0.08354218, -1.079011, 3.193049, 1, 1, 1, 1, 1,
0.09652107, -0.1875675, 3.038724, 1, 1, 1, 1, 1,
0.09790608, -0.3437313, 1.016259, 1, 1, 1, 1, 1,
0.1003326, 0.7516015, -0.2519499, 1, 1, 1, 1, 1,
0.1013052, 0.1248864, 1.183628, 1, 1, 1, 1, 1,
0.1036405, 0.5943851, -0.9744567, 1, 1, 1, 1, 1,
0.1043835, 1.230257, 0.9661757, 1, 1, 1, 1, 1,
0.1062005, -0.2541836, 3.077149, 1, 1, 1, 1, 1,
0.1088055, -0.116425, 1.870465, 1, 1, 1, 1, 1,
0.1104142, 1.204364, 0.245327, 1, 1, 1, 1, 1,
0.1108068, 0.1630635, 0.9312647, 1, 1, 1, 1, 1,
0.1142337, 2.249066, 2.377253, 0, 0, 1, 1, 1,
0.12171, -0.3702038, 3.927985, 1, 0, 0, 1, 1,
0.1237401, -0.262915, 1.693938, 1, 0, 0, 1, 1,
0.1252428, -0.2913051, 2.800756, 1, 0, 0, 1, 1,
0.128612, -1.382401, 2.084744, 1, 0, 0, 1, 1,
0.1355742, -0.8081136, 3.350318, 1, 0, 0, 1, 1,
0.1393628, -0.8799722, 3.424543, 0, 0, 0, 1, 1,
0.1399453, -0.1927583, 1.529375, 0, 0, 0, 1, 1,
0.1409498, -0.6315216, 3.245828, 0, 0, 0, 1, 1,
0.1443467, 0.5135364, 1.340494, 0, 0, 0, 1, 1,
0.1476192, -0.7431508, 1.367905, 0, 0, 0, 1, 1,
0.1490334, 0.8405216, -1.912975, 0, 0, 0, 1, 1,
0.1501435, 1.183742, -1.086295, 0, 0, 0, 1, 1,
0.1544712, 0.6080535, -0.9147478, 1, 1, 1, 1, 1,
0.1546456, 0.5791416, 0.2992689, 1, 1, 1, 1, 1,
0.1620389, 0.05309931, 0.5609505, 1, 1, 1, 1, 1,
0.1623854, 0.6734908, -0.6074321, 1, 1, 1, 1, 1,
0.1626271, -1.812351, 3.913377, 1, 1, 1, 1, 1,
0.1628983, -0.09997751, 3.479239, 1, 1, 1, 1, 1,
0.1629553, 0.1313098, 0.7954508, 1, 1, 1, 1, 1,
0.1652589, 0.8073736, 2.147491, 1, 1, 1, 1, 1,
0.1767079, 1.175781, 1.546217, 1, 1, 1, 1, 1,
0.1863438, -0.8428642, 4.315277, 1, 1, 1, 1, 1,
0.1874631, 1.47315, -0.5198961, 1, 1, 1, 1, 1,
0.1885113, 0.9499839, 0.3467084, 1, 1, 1, 1, 1,
0.1895803, 1.02754, 0.3512997, 1, 1, 1, 1, 1,
0.1897781, -0.3693116, 3.610471, 1, 1, 1, 1, 1,
0.1970914, 2.769929, -1.201227, 1, 1, 1, 1, 1,
0.1972315, -0.188946, 3.111976, 0, 0, 1, 1, 1,
0.2004158, 0.7288433, 0.4792606, 1, 0, 0, 1, 1,
0.20078, 0.4878885, 0.5393308, 1, 0, 0, 1, 1,
0.2025803, -0.288845, 2.982446, 1, 0, 0, 1, 1,
0.2068776, 2.012093, -1.195711, 1, 0, 0, 1, 1,
0.2081468, 0.6347559, 0.5329111, 1, 0, 0, 1, 1,
0.208238, -1.260481, 2.682192, 0, 0, 0, 1, 1,
0.2122068, 2.091265, -0.04427573, 0, 0, 0, 1, 1,
0.2138801, 0.8008292, -0.5536608, 0, 0, 0, 1, 1,
0.2171333, -1.136495, 2.099416, 0, 0, 0, 1, 1,
0.2201647, -0.1405493, 1.327732, 0, 0, 0, 1, 1,
0.2238439, -1.38641, 1.130221, 0, 0, 0, 1, 1,
0.2249662, -0.48982, 1.915914, 0, 0, 0, 1, 1,
0.2257116, -1.878559, 2.628755, 1, 1, 1, 1, 1,
0.2295965, 0.1294292, 0.1120505, 1, 1, 1, 1, 1,
0.2316582, 0.7103833, -0.1555097, 1, 1, 1, 1, 1,
0.2346398, -0.07219581, 2.816239, 1, 1, 1, 1, 1,
0.2361014, -0.5691945, 1.235856, 1, 1, 1, 1, 1,
0.2381107, -0.08420491, 1.407675, 1, 1, 1, 1, 1,
0.2395522, 1.223795, -1.25026, 1, 1, 1, 1, 1,
0.2405906, 1.176622, -0.2120784, 1, 1, 1, 1, 1,
0.2428762, -1.140073, 2.236498, 1, 1, 1, 1, 1,
0.2435779, -0.3325886, 2.6138, 1, 1, 1, 1, 1,
0.2435918, -1.833078, 4.24999, 1, 1, 1, 1, 1,
0.2469538, 1.346959, 0.04682295, 1, 1, 1, 1, 1,
0.2487989, 1.871718, 1.381931, 1, 1, 1, 1, 1,
0.2498856, 0.9299224, -1.126254, 1, 1, 1, 1, 1,
0.2517213, -0.366718, 2.103209, 1, 1, 1, 1, 1,
0.2551836, 1.329455, -0.2220805, 0, 0, 1, 1, 1,
0.2554545, -0.5541849, 2.375051, 1, 0, 0, 1, 1,
0.2562491, -0.5252256, 3.004048, 1, 0, 0, 1, 1,
0.2574193, 0.193706, 1.81336, 1, 0, 0, 1, 1,
0.2592484, 0.4863047, 0.6457703, 1, 0, 0, 1, 1,
0.2622411, -0.6258274, 0.7179187, 1, 0, 0, 1, 1,
0.2663951, -1.25774, 1.173043, 0, 0, 0, 1, 1,
0.271753, 0.0127442, 0.5911887, 0, 0, 0, 1, 1,
0.2717563, -1.929245, 2.629764, 0, 0, 0, 1, 1,
0.272112, 2.037326, -0.6609704, 0, 0, 0, 1, 1,
0.2732787, 0.2075103, 1.24983, 0, 0, 0, 1, 1,
0.2738273, -0.5153098, 2.803773, 0, 0, 0, 1, 1,
0.2860284, 0.1775315, 1.505877, 0, 0, 0, 1, 1,
0.2901646, 0.6822774, -0.4001976, 1, 1, 1, 1, 1,
0.2914588, -1.821101, 1.952698, 1, 1, 1, 1, 1,
0.2964914, 0.5460622, 0.9178004, 1, 1, 1, 1, 1,
0.3039567, -1.3312, 3.5928, 1, 1, 1, 1, 1,
0.3041818, 0.1119305, -0.4239093, 1, 1, 1, 1, 1,
0.3047333, -1.3838, 3.669794, 1, 1, 1, 1, 1,
0.3057012, 0.3036951, 1.514422, 1, 1, 1, 1, 1,
0.3060069, -0.04786066, 2.456152, 1, 1, 1, 1, 1,
0.3090235, 0.2471378, -0.8994116, 1, 1, 1, 1, 1,
0.3111815, -1.122159, 1.757689, 1, 1, 1, 1, 1,
0.3218381, -0.3750508, 0.4347011, 1, 1, 1, 1, 1,
0.3244555, -0.2508031, 1.266731, 1, 1, 1, 1, 1,
0.3318834, -1.408829, 3.521312, 1, 1, 1, 1, 1,
0.3319291, -0.3944844, 0.3891299, 1, 1, 1, 1, 1,
0.3322789, -0.7257425, 4.494739, 1, 1, 1, 1, 1,
0.3333762, 1.42758, -0.005288508, 0, 0, 1, 1, 1,
0.3338436, -0.4912952, 2.839797, 1, 0, 0, 1, 1,
0.3343191, 0.03325975, 1.591253, 1, 0, 0, 1, 1,
0.3345799, -1.469119, 4.209263, 1, 0, 0, 1, 1,
0.3367644, 1.266788, 0.5381279, 1, 0, 0, 1, 1,
0.3375619, 0.4589536, 1.843587, 1, 0, 0, 1, 1,
0.3411168, 1.066555, 0.9405988, 0, 0, 0, 1, 1,
0.3443515, -1.278602, 3.602215, 0, 0, 0, 1, 1,
0.3458206, -1.110029, 2.604276, 0, 0, 0, 1, 1,
0.3461499, 0.9102474, -0.2617932, 0, 0, 0, 1, 1,
0.3462482, -0.4411954, 2.580725, 0, 0, 0, 1, 1,
0.3507583, -1.973447, 3.206306, 0, 0, 0, 1, 1,
0.3535916, -0.4629201, 2.254631, 0, 0, 0, 1, 1,
0.353975, -1.686124, 2.820245, 1, 1, 1, 1, 1,
0.3569902, 0.6260596, 2.123673, 1, 1, 1, 1, 1,
0.3596876, 1.395665, 1.565932, 1, 1, 1, 1, 1,
0.3664542, -1.328697, 3.745302, 1, 1, 1, 1, 1,
0.369454, 0.1971088, 0.00928528, 1, 1, 1, 1, 1,
0.3713165, -0.4031152, 2.32957, 1, 1, 1, 1, 1,
0.3715133, -1.144108, 2.355569, 1, 1, 1, 1, 1,
0.373789, 2.060278, 1.103339, 1, 1, 1, 1, 1,
0.3769607, -1.432104, 4.154924, 1, 1, 1, 1, 1,
0.3779662, -0.4663049, 1.787243, 1, 1, 1, 1, 1,
0.3842112, 0.02745654, 1.832788, 1, 1, 1, 1, 1,
0.3914381, 1.348735, 0.5299805, 1, 1, 1, 1, 1,
0.3918385, 0.4944274, 0.6931877, 1, 1, 1, 1, 1,
0.3939571, -0.9248312, 3.132136, 1, 1, 1, 1, 1,
0.3988843, 1.457714, 0.311441, 1, 1, 1, 1, 1,
0.4046836, -1.777853, 3.866824, 0, 0, 1, 1, 1,
0.4057416, -2.535583, 3.825544, 1, 0, 0, 1, 1,
0.4070757, 1.00659, 1.431939, 1, 0, 0, 1, 1,
0.4122717, 0.075539, 0.8599474, 1, 0, 0, 1, 1,
0.4127527, -0.7928899, 3.453333, 1, 0, 0, 1, 1,
0.4153006, 1.026053, -1.42016, 1, 0, 0, 1, 1,
0.4195372, -0.6152286, 1.440423, 0, 0, 0, 1, 1,
0.4200214, 0.4381775, 1.679179, 0, 0, 0, 1, 1,
0.420411, 0.2489407, 0.6203053, 0, 0, 0, 1, 1,
0.4216323, 0.7858346, 0.08951907, 0, 0, 0, 1, 1,
0.4233533, 0.09593322, 1.276281, 0, 0, 0, 1, 1,
0.4256214, 0.9719912, 1.793777, 0, 0, 0, 1, 1,
0.4349831, 0.2887729, 2.392789, 0, 0, 0, 1, 1,
0.4358012, -0.171579, 0.07278809, 1, 1, 1, 1, 1,
0.4358427, -0.4084874, 1.16097, 1, 1, 1, 1, 1,
0.4361956, 0.2456372, 1.040724, 1, 1, 1, 1, 1,
0.4387061, 0.5855846, 1.746199, 1, 1, 1, 1, 1,
0.4388049, -0.6752694, 2.895097, 1, 1, 1, 1, 1,
0.4392974, -0.7344853, 4.203794, 1, 1, 1, 1, 1,
0.4437566, -0.2763921, 2.047676, 1, 1, 1, 1, 1,
0.4443808, -0.1569465, 0.9490702, 1, 1, 1, 1, 1,
0.4483292, 0.03088469, 3.158267, 1, 1, 1, 1, 1,
0.449023, 0.5142208, 1.316072, 1, 1, 1, 1, 1,
0.449316, 0.5505872, 0.3921891, 1, 1, 1, 1, 1,
0.4501517, 2.557283, 0.8626191, 1, 1, 1, 1, 1,
0.4540123, 0.4257081, -0.04194624, 1, 1, 1, 1, 1,
0.4590027, 0.06742517, 0.2134439, 1, 1, 1, 1, 1,
0.4624491, -0.03694689, 3.095223, 1, 1, 1, 1, 1,
0.4630504, 0.2873347, 0.5837504, 0, 0, 1, 1, 1,
0.4665033, -0.9944161, 1.902796, 1, 0, 0, 1, 1,
0.4682169, 0.3837773, 0.6032295, 1, 0, 0, 1, 1,
0.4749223, -1.323393, 3.229352, 1, 0, 0, 1, 1,
0.4806594, 0.1889864, 1.400196, 1, 0, 0, 1, 1,
0.486564, 1.521561, 0.3348574, 1, 0, 0, 1, 1,
0.4923266, -0.06055085, 0.9836477, 0, 0, 0, 1, 1,
0.495403, -0.2318545, 2.486555, 0, 0, 0, 1, 1,
0.5001677, -0.7043353, 2.17534, 0, 0, 0, 1, 1,
0.5032668, 2.047832, 0.9811116, 0, 0, 0, 1, 1,
0.50443, -0.6467085, 2.310259, 0, 0, 0, 1, 1,
0.5049638, 0.997667, -0.4911342, 0, 0, 0, 1, 1,
0.5058697, -0.8321594, 2.846204, 0, 0, 0, 1, 1,
0.5065287, 0.9261158, 1.217251, 1, 1, 1, 1, 1,
0.5079429, 0.06472052, 2.569307, 1, 1, 1, 1, 1,
0.5101507, -0.333551, 2.454402, 1, 1, 1, 1, 1,
0.5105102, 0.1010421, 1.073277, 1, 1, 1, 1, 1,
0.5159281, 0.6736748, 1.748767, 1, 1, 1, 1, 1,
0.5180936, 0.4482409, 1.13304, 1, 1, 1, 1, 1,
0.5208365, -0.1717771, 0.1204135, 1, 1, 1, 1, 1,
0.5241084, 0.681327, 2.600814, 1, 1, 1, 1, 1,
0.5255452, 0.4336377, -1.554014, 1, 1, 1, 1, 1,
0.5319443, -0.7394271, 1.357369, 1, 1, 1, 1, 1,
0.5405372, 0.1769161, 1.127326, 1, 1, 1, 1, 1,
0.5464445, 0.2200309, 1.8577, 1, 1, 1, 1, 1,
0.5490552, 0.7392652, 0.6517531, 1, 1, 1, 1, 1,
0.5495089, -1.848617, 3.130376, 1, 1, 1, 1, 1,
0.5501643, -1.761157, 2.667227, 1, 1, 1, 1, 1,
0.5520768, 0.3399127, -0.9196688, 0, 0, 1, 1, 1,
0.5534249, 0.322939, 2.267942, 1, 0, 0, 1, 1,
0.5565638, -0.3952048, 2.513207, 1, 0, 0, 1, 1,
0.5588508, 0.4414803, 1.400695, 1, 0, 0, 1, 1,
0.5612625, -0.1445286, 0.5890477, 1, 0, 0, 1, 1,
0.5650256, -0.1777045, 2.751431, 1, 0, 0, 1, 1,
0.5691994, -0.1646185, 2.305578, 0, 0, 0, 1, 1,
0.569959, 0.5227149, 0.003896866, 0, 0, 0, 1, 1,
0.5721216, -0.3910018, 3.175102, 0, 0, 0, 1, 1,
0.5804019, -1.820123, 2.736236, 0, 0, 0, 1, 1,
0.5817747, 0.033593, 0.9927407, 0, 0, 0, 1, 1,
0.5847746, -0.286751, 1.216676, 0, 0, 0, 1, 1,
0.5889832, -1.406594, 3.069414, 0, 0, 0, 1, 1,
0.5939957, 0.7213006, 0.7123702, 1, 1, 1, 1, 1,
0.5950499, -2.480776, 1.962868, 1, 1, 1, 1, 1,
0.5964475, -1.046375, 1.490316, 1, 1, 1, 1, 1,
0.5980893, -0.8789279, 2.537915, 1, 1, 1, 1, 1,
0.5989768, -1.548454, 2.784171, 1, 1, 1, 1, 1,
0.6023186, -0.6292397, 2.168446, 1, 1, 1, 1, 1,
0.6025349, 0.03821224, -0.2620081, 1, 1, 1, 1, 1,
0.603218, 0.7864055, 0.9955752, 1, 1, 1, 1, 1,
0.6045739, 1.261286, 1.411772, 1, 1, 1, 1, 1,
0.6049815, 0.7027477, 1.760807, 1, 1, 1, 1, 1,
0.6052155, -1.400881, 2.066037, 1, 1, 1, 1, 1,
0.6084939, 0.3077045, 0.9842775, 1, 1, 1, 1, 1,
0.6102208, -0.1722729, 1.97326, 1, 1, 1, 1, 1,
0.6107289, -0.7469786, 3.622525, 1, 1, 1, 1, 1,
0.6128994, 1.023285, 0.935618, 1, 1, 1, 1, 1,
0.6137868, 1.000454, 0.06108287, 0, 0, 1, 1, 1,
0.6144261, 0.9791202, 0.0975538, 1, 0, 0, 1, 1,
0.6201942, 0.5144288, 1.399248, 1, 0, 0, 1, 1,
0.6246521, -0.2483574, 0.1324848, 1, 0, 0, 1, 1,
0.6262159, -0.3370827, 2.113346, 1, 0, 0, 1, 1,
0.6320731, -0.3454707, 1.000855, 1, 0, 0, 1, 1,
0.6396974, 1.607223, 0.9014007, 0, 0, 0, 1, 1,
0.6419443, -0.07510401, 0.9517922, 0, 0, 0, 1, 1,
0.6437405, -0.3154365, 1.862845, 0, 0, 0, 1, 1,
0.650447, 0.4830683, 0.9913063, 0, 0, 0, 1, 1,
0.6559387, -0.7735552, 2.786977, 0, 0, 0, 1, 1,
0.6560078, 1.245851, 0.5675721, 0, 0, 0, 1, 1,
0.6608956, 0.07635655, 1.933297, 0, 0, 0, 1, 1,
0.6621683, -1.670795, 2.471781, 1, 1, 1, 1, 1,
0.6659986, -1.537403, 0.2890826, 1, 1, 1, 1, 1,
0.6699206, -0.7257655, 3.489754, 1, 1, 1, 1, 1,
0.6706181, 0.1082246, 2.394141, 1, 1, 1, 1, 1,
0.671252, 0.5819924, 1.694282, 1, 1, 1, 1, 1,
0.6782048, 1.630287, 0.581463, 1, 1, 1, 1, 1,
0.6798407, -1.66471, 3.018336, 1, 1, 1, 1, 1,
0.6818447, 0.231135, 0.3970032, 1, 1, 1, 1, 1,
0.6868511, -0.04729777, 2.055436, 1, 1, 1, 1, 1,
0.6869593, -1.306296, 2.099355, 1, 1, 1, 1, 1,
0.6878285, 0.7723961, -0.543157, 1, 1, 1, 1, 1,
0.6904733, -0.1398772, 2.002178, 1, 1, 1, 1, 1,
0.6946239, 1.058872, 0.06331964, 1, 1, 1, 1, 1,
0.7025266, -0.9621841, 2.377486, 1, 1, 1, 1, 1,
0.7089052, 0.6765412, 2.131705, 1, 1, 1, 1, 1,
0.7094093, 2.496967, -1.393199, 0, 0, 1, 1, 1,
0.7129453, 1.676173, 0.1430511, 1, 0, 0, 1, 1,
0.7158887, 0.0009478078, 3.354628, 1, 0, 0, 1, 1,
0.7163573, 0.3862078, 1.408956, 1, 0, 0, 1, 1,
0.7166947, 0.5834173, 2.591025, 1, 0, 0, 1, 1,
0.7232311, -0.9244648, 2.158779, 1, 0, 0, 1, 1,
0.7255102, 1.285023, -0.6254628, 0, 0, 0, 1, 1,
0.7261716, 1.118411, -0.2709154, 0, 0, 0, 1, 1,
0.7293221, 2.071414, 0.910745, 0, 0, 0, 1, 1,
0.7319504, 0.4573587, -0.4343608, 0, 0, 0, 1, 1,
0.7360306, 0.6422973, 0.547284, 0, 0, 0, 1, 1,
0.7379549, -0.4881673, 0.7411274, 0, 0, 0, 1, 1,
0.748768, 0.006420867, 3.846212, 0, 0, 0, 1, 1,
0.7491433, -0.2859861, 1.409517, 1, 1, 1, 1, 1,
0.7495121, 3.132502, -0.2593073, 1, 1, 1, 1, 1,
0.7501893, -0.5178181, 1.17616, 1, 1, 1, 1, 1,
0.750888, -1.636067, 3.289206, 1, 1, 1, 1, 1,
0.7561789, 1.245004, 1.647565, 1, 1, 1, 1, 1,
0.7630249, 0.1190436, 1.021758, 1, 1, 1, 1, 1,
0.7636357, 0.7614468, 1.09485, 1, 1, 1, 1, 1,
0.7694538, -0.1671148, 0.2614053, 1, 1, 1, 1, 1,
0.7710855, -0.1382238, 2.504383, 1, 1, 1, 1, 1,
0.7713155, 0.3458045, -0.05361571, 1, 1, 1, 1, 1,
0.7725214, 1.855714, 1.655773, 1, 1, 1, 1, 1,
0.7732326, -0.4494803, 3.124524, 1, 1, 1, 1, 1,
0.7754904, 1.657606, 1.257883, 1, 1, 1, 1, 1,
0.7795582, -0.4779554, 3.029655, 1, 1, 1, 1, 1,
0.7830625, -1.255599, 1.580725, 1, 1, 1, 1, 1,
0.7878377, -0.5037163, 1.994361, 0, 0, 1, 1, 1,
0.7939634, -0.611528, 2.969583, 1, 0, 0, 1, 1,
0.7956612, 0.5670779, 0.14165, 1, 0, 0, 1, 1,
0.805649, -0.8835459, 0.7796877, 1, 0, 0, 1, 1,
0.8087222, -1.111846, 1.810854, 1, 0, 0, 1, 1,
0.8093277, -0.6247777, 1.960846, 1, 0, 0, 1, 1,
0.812941, 1.684107, 0.2412581, 0, 0, 0, 1, 1,
0.8201172, -0.2569179, 0.9313434, 0, 0, 0, 1, 1,
0.8217805, 0.8220432, 0.8894784, 0, 0, 0, 1, 1,
0.8286395, 0.5776851, 2.147471, 0, 0, 0, 1, 1,
0.8296543, -0.7380956, 0.1128125, 0, 0, 0, 1, 1,
0.8333251, -0.9743396, 0.5980013, 0, 0, 0, 1, 1,
0.835861, -0.308858, 3.237543, 0, 0, 0, 1, 1,
0.8369671, 1.336631, 0.05050642, 1, 1, 1, 1, 1,
0.8378426, 1.229471, 0.7577989, 1, 1, 1, 1, 1,
0.8410897, -1.105946, 0.7742578, 1, 1, 1, 1, 1,
0.8453251, 0.7463111, 3.117167, 1, 1, 1, 1, 1,
0.8477932, 2.445851, 0.6208035, 1, 1, 1, 1, 1,
0.8494172, -0.2687383, 3.362388, 1, 1, 1, 1, 1,
0.8512918, 1.365359, -0.3949382, 1, 1, 1, 1, 1,
0.8524982, -0.4678514, 2.672971, 1, 1, 1, 1, 1,
0.8590949, 0.1359653, -0.01847045, 1, 1, 1, 1, 1,
0.8610235, -0.7517114, 2.087629, 1, 1, 1, 1, 1,
0.861025, -0.05696646, 1.570961, 1, 1, 1, 1, 1,
0.8631902, -0.1508181, 3.435264, 1, 1, 1, 1, 1,
0.8642459, -0.9972266, 0.6924084, 1, 1, 1, 1, 1,
0.8653677, -0.6112536, 2.177867, 1, 1, 1, 1, 1,
0.8744227, 0.3815381, 1.73884, 1, 1, 1, 1, 1,
0.8757666, 0.1773356, 1.2466, 0, 0, 1, 1, 1,
0.8781916, -0.6248843, 0.8285246, 1, 0, 0, 1, 1,
0.8811584, -1.356481, 1.840618, 1, 0, 0, 1, 1,
0.884773, 0.723873, 0.009358523, 1, 0, 0, 1, 1,
0.8872236, -0.2754573, 1.178052, 1, 0, 0, 1, 1,
0.8886718, 1.417902, 2.024313, 1, 0, 0, 1, 1,
0.895524, 0.7188488, 0.5198719, 0, 0, 0, 1, 1,
0.8955843, 1.092505, 0.3701864, 0, 0, 0, 1, 1,
0.8964073, 1.1464, -0.3069732, 0, 0, 0, 1, 1,
0.9060694, -1.408764, 2.961007, 0, 0, 0, 1, 1,
0.9139879, -0.1710706, 2.225247, 0, 0, 0, 1, 1,
0.91407, -0.9587864, 2.54911, 0, 0, 0, 1, 1,
0.9140798, -0.4402906, 1.710994, 0, 0, 0, 1, 1,
0.9148162, 1.147752, 1.608951, 1, 1, 1, 1, 1,
0.9198391, 0.2380506, 0.03610496, 1, 1, 1, 1, 1,
0.920004, 0.9978102, 0.3277693, 1, 1, 1, 1, 1,
0.9210098, 0.2766195, 3.45026, 1, 1, 1, 1, 1,
0.9220741, 1.120945, -0.5890638, 1, 1, 1, 1, 1,
0.9268586, -0.255882, -0.08918833, 1, 1, 1, 1, 1,
0.9281165, 0.1664739, 3.126153, 1, 1, 1, 1, 1,
0.9307438, -0.06121393, 1.914235, 1, 1, 1, 1, 1,
0.931883, 0.02159062, 2.404277, 1, 1, 1, 1, 1,
0.9401792, 0.5357047, -0.8686959, 1, 1, 1, 1, 1,
0.9510735, -1.07945, 2.803282, 1, 1, 1, 1, 1,
0.9563081, -0.9883555, 2.801926, 1, 1, 1, 1, 1,
0.9580558, -0.2975477, 1.511338, 1, 1, 1, 1, 1,
0.9584365, 0.9983763, 1.293922, 1, 1, 1, 1, 1,
0.9648138, -0.6682519, 3.752876, 1, 1, 1, 1, 1,
0.9695271, -2.536093, 1.3283, 0, 0, 1, 1, 1,
0.9736349, -1.908201, 2.840157, 1, 0, 0, 1, 1,
0.9769045, 1.56649, 0.4905125, 1, 0, 0, 1, 1,
0.9786904, 2.254468, -0.1738723, 1, 0, 0, 1, 1,
0.9794009, -1.390874, 4.065412, 1, 0, 0, 1, 1,
0.9796405, -0.1887682, 2.528147, 1, 0, 0, 1, 1,
0.9818865, -2.96046, 2.734905, 0, 0, 0, 1, 1,
0.9841886, 0.0853883, 1.33747, 0, 0, 0, 1, 1,
0.9894775, -0.9407316, 2.128317, 0, 0, 0, 1, 1,
0.9945742, 0.3691402, 2.244177, 0, 0, 0, 1, 1,
1.0044, -0.1571478, -0.3857384, 0, 0, 0, 1, 1,
1.004807, 1.120247, 0.6395354, 0, 0, 0, 1, 1,
1.0128, 0.3947642, 1.902914, 0, 0, 0, 1, 1,
1.0298, 0.1896818, -0.01262259, 1, 1, 1, 1, 1,
1.045078, -0.5102837, 3.021291, 1, 1, 1, 1, 1,
1.059043, 1.182002, 2.539068, 1, 1, 1, 1, 1,
1.06111, 0.7704985, -0.1265976, 1, 1, 1, 1, 1,
1.0661, 0.3589855, 1.299379, 1, 1, 1, 1, 1,
1.070367, 0.2483586, 0.09835039, 1, 1, 1, 1, 1,
1.07063, 0.3816486, 2.570501, 1, 1, 1, 1, 1,
1.075397, -1.184554, 4.514555, 1, 1, 1, 1, 1,
1.07904, 0.03377669, 2.116887, 1, 1, 1, 1, 1,
1.082324, -1.008836, 3.156067, 1, 1, 1, 1, 1,
1.083744, 0.9369656, 2.932782, 1, 1, 1, 1, 1,
1.084092, 1.163642, 0.4559777, 1, 1, 1, 1, 1,
1.085303, 0.9066796, 1.041644, 1, 1, 1, 1, 1,
1.089231, 1.837665, -0.7687877, 1, 1, 1, 1, 1,
1.091412, 1.145463, 0.2510116, 1, 1, 1, 1, 1,
1.092007, -1.637463, 3.359435, 0, 0, 1, 1, 1,
1.093737, -0.3091784, 1.769821, 1, 0, 0, 1, 1,
1.094709, 0.1616847, 1.635313, 1, 0, 0, 1, 1,
1.09475, 1.490497, 1.128996, 1, 0, 0, 1, 1,
1.095114, 0.5345482, 0.822022, 1, 0, 0, 1, 1,
1.096488, -0.6374869, 0.8939782, 1, 0, 0, 1, 1,
1.096637, 0.06140005, 0.7258647, 0, 0, 0, 1, 1,
1.097712, 0.2365999, 0.04780115, 0, 0, 0, 1, 1,
1.103957, -0.8009754, 2.775208, 0, 0, 0, 1, 1,
1.113985, 0.1761794, 0.9614351, 0, 0, 0, 1, 1,
1.119481, -1.554228, 2.617756, 0, 0, 0, 1, 1,
1.14287, 2.103168, -0.3736973, 0, 0, 0, 1, 1,
1.14477, -0.247222, 0.9605483, 0, 0, 0, 1, 1,
1.152279, -0.6870055, 2.234099, 1, 1, 1, 1, 1,
1.152611, 2.400522, 1.278285, 1, 1, 1, 1, 1,
1.155472, -1.576501, 3.390218, 1, 1, 1, 1, 1,
1.168527, 0.05056848, 2.625914, 1, 1, 1, 1, 1,
1.179377, 2.545074, 0.7860828, 1, 1, 1, 1, 1,
1.180333, 0.2557159, 1.432582, 1, 1, 1, 1, 1,
1.180905, 0.8655934, 0.04191813, 1, 1, 1, 1, 1,
1.199931, 0.8332387, 1.056077, 1, 1, 1, 1, 1,
1.2034, 0.3153029, 0.6096739, 1, 1, 1, 1, 1,
1.207907, -0.897139, 1.960928, 1, 1, 1, 1, 1,
1.210761, -1.134302, 3.223228, 1, 1, 1, 1, 1,
1.213958, -0.2131572, 0.8884041, 1, 1, 1, 1, 1,
1.215199, -0.2429772, 0.8770415, 1, 1, 1, 1, 1,
1.219303, 0.3134576, 1.854873, 1, 1, 1, 1, 1,
1.225233, -0.7767258, 1.634894, 1, 1, 1, 1, 1,
1.231797, 1.00512, 2.135643, 0, 0, 1, 1, 1,
1.235107, 1.401847, 1.734408, 1, 0, 0, 1, 1,
1.23905, -0.2196257, 1.141057, 1, 0, 0, 1, 1,
1.252612, -1.995552, 1.190304, 1, 0, 0, 1, 1,
1.253133, -0.4012416, 1.542789, 1, 0, 0, 1, 1,
1.253977, 1.546477, 0.5605203, 1, 0, 0, 1, 1,
1.257546, -1.402389, 0.4253866, 0, 0, 0, 1, 1,
1.26394, 1.621506, 0.6460977, 0, 0, 0, 1, 1,
1.27051, -0.4986545, 1.516337, 0, 0, 0, 1, 1,
1.273081, -2.006002, 2.824435, 0, 0, 0, 1, 1,
1.286294, 0.1554018, 1.879169, 0, 0, 0, 1, 1,
1.287348, 0.8781172, -0.1017489, 0, 0, 0, 1, 1,
1.293053, 0.04145199, 2.06786, 0, 0, 0, 1, 1,
1.295271, 0.8639467, 1.834543, 1, 1, 1, 1, 1,
1.300234, -0.9224932, 2.001538, 1, 1, 1, 1, 1,
1.309131, -0.345432, 1.903379, 1, 1, 1, 1, 1,
1.312044, -0.4923635, 3.042735, 1, 1, 1, 1, 1,
1.31308, 0.4741135, 1.289204, 1, 1, 1, 1, 1,
1.313121, 0.0007535823, 1.336122, 1, 1, 1, 1, 1,
1.319117, 0.1701558, 2.181051, 1, 1, 1, 1, 1,
1.31993, -0.2718676, 0.6529078, 1, 1, 1, 1, 1,
1.327554, 1.075159, 1.781151, 1, 1, 1, 1, 1,
1.341087, -0.9971894, 1.738163, 1, 1, 1, 1, 1,
1.343633, 0.1251131, 1.307472, 1, 1, 1, 1, 1,
1.385403, -1.338105, 4.119175, 1, 1, 1, 1, 1,
1.39357, 0.5500828, 1.056209, 1, 1, 1, 1, 1,
1.402099, -1.466151, 1.989714, 1, 1, 1, 1, 1,
1.416251, 0.2604797, -0.817625, 1, 1, 1, 1, 1,
1.419618, 0.02217422, 1.994171, 0, 0, 1, 1, 1,
1.434947, 0.5352101, 0.4112865, 1, 0, 0, 1, 1,
1.44778, -0.5135919, 1.886753, 1, 0, 0, 1, 1,
1.460717, -0.126647, 0.05322922, 1, 0, 0, 1, 1,
1.469622, 0.4540806, 1.479343, 1, 0, 0, 1, 1,
1.474819, -0.6105577, 0.1963243, 1, 0, 0, 1, 1,
1.479871, -0.524364, 2.945042, 0, 0, 0, 1, 1,
1.490644, 0.1990296, 2.143146, 0, 0, 0, 1, 1,
1.500256, 1.772905, 1.227081, 0, 0, 0, 1, 1,
1.51395, 0.1637483, 2.846057, 0, 0, 0, 1, 1,
1.5217, -0.4037365, 4.182587, 0, 0, 0, 1, 1,
1.534539, 0.2732939, 2.212117, 0, 0, 0, 1, 1,
1.538816, -0.7717751, 2.439241, 0, 0, 0, 1, 1,
1.539511, -0.9045113, 3.243642, 1, 1, 1, 1, 1,
1.541743, 1.376465, -1.067543, 1, 1, 1, 1, 1,
1.550668, -0.7662382, 2.197498, 1, 1, 1, 1, 1,
1.559435, 1.623062, 1.276299, 1, 1, 1, 1, 1,
1.560655, 1.469707, 2.13112, 1, 1, 1, 1, 1,
1.564478, -1.385591, 2.513584, 1, 1, 1, 1, 1,
1.576261, 0.9842347, 2.509694, 1, 1, 1, 1, 1,
1.588655, 1.214324, 0.4477524, 1, 1, 1, 1, 1,
1.61645, 1.771131, 0.7135225, 1, 1, 1, 1, 1,
1.620583, -0.3862567, 2.9021, 1, 1, 1, 1, 1,
1.624434, 2.164781, 0.5477825, 1, 1, 1, 1, 1,
1.629502, -0.5770893, 2.280091, 1, 1, 1, 1, 1,
1.642221, 0.3501426, 1.061904, 1, 1, 1, 1, 1,
1.653321, -0.1095969, 2.700447, 1, 1, 1, 1, 1,
1.657522, 0.1487403, 0.1614585, 1, 1, 1, 1, 1,
1.674044, -0.4257304, 2.970956, 0, 0, 1, 1, 1,
1.679815, -1.173544, 2.860606, 1, 0, 0, 1, 1,
1.698551, -0.04848224, 2.19863, 1, 0, 0, 1, 1,
1.72499, -1.791995, 3.304807, 1, 0, 0, 1, 1,
1.732605, -1.320929, 0.1896344, 1, 0, 0, 1, 1,
1.752652, 0.8250216, 1.227461, 1, 0, 0, 1, 1,
1.762064, -0.06266198, 2.389641, 0, 0, 0, 1, 1,
1.799909, 0.3484941, -0.3729404, 0, 0, 0, 1, 1,
1.808411, -1.011637, 2.577525, 0, 0, 0, 1, 1,
1.830173, -1.59749, 3.791998, 0, 0, 0, 1, 1,
1.83109, 0.2525738, 1.993295, 0, 0, 0, 1, 1,
1.849422, -0.4908746, 2.210555, 0, 0, 0, 1, 1,
1.860539, -1.616305, 1.717842, 0, 0, 0, 1, 1,
1.866318, 0.707872, 0.6348971, 1, 1, 1, 1, 1,
1.874002, -0.73983, 0.8124291, 1, 1, 1, 1, 1,
1.883834, -0.9708642, 2.655868, 1, 1, 1, 1, 1,
1.894265, -0.9288287, 2.418261, 1, 1, 1, 1, 1,
1.902813, 0.4252501, 2.117231, 1, 1, 1, 1, 1,
1.933793, 1.801061, 1.075603, 1, 1, 1, 1, 1,
1.937465, 2.400204, 0.516778, 1, 1, 1, 1, 1,
1.978152, 0.01545478, 2.176718, 1, 1, 1, 1, 1,
1.998155, -1.978368, 1.831787, 1, 1, 1, 1, 1,
2.004431, 0.3425479, 0.6721936, 1, 1, 1, 1, 1,
2.023014, 0.7375886, 0.0665765, 1, 1, 1, 1, 1,
2.02603, -0.7344066, 3.93199, 1, 1, 1, 1, 1,
2.029434, -1.858025, 2.001582, 1, 1, 1, 1, 1,
2.06554, 0.6551068, 0.8841573, 1, 1, 1, 1, 1,
2.069228, -0.5964493, 1.794298, 1, 1, 1, 1, 1,
2.078151, -0.7275998, -0.05009856, 0, 0, 1, 1, 1,
2.082346, -0.656769, 2.025043, 1, 0, 0, 1, 1,
2.17331, 1.315401, 0.128066, 1, 0, 0, 1, 1,
2.190409, -1.140533, 1.136719, 1, 0, 0, 1, 1,
2.191463, 0.7223338, 0.827082, 1, 0, 0, 1, 1,
2.21164, -0.6076078, 1.775061, 1, 0, 0, 1, 1,
2.218166, 1.166468, 0.9341081, 0, 0, 0, 1, 1,
2.254455, -0.3570733, 1.467299, 0, 0, 0, 1, 1,
2.306111, -1.235057, 2.79578, 0, 0, 0, 1, 1,
2.320068, -0.5215877, 2.759712, 0, 0, 0, 1, 1,
2.483095, 1.332741, 1.208567, 0, 0, 0, 1, 1,
2.511677, -0.5656993, -0.4050735, 0, 0, 0, 1, 1,
2.535781, 0.9687538, 1.47244, 0, 0, 0, 1, 1,
2.582018, 0.9100939, 0.6862684, 1, 1, 1, 1, 1,
2.748892, -0.5382276, 2.698954, 1, 1, 1, 1, 1,
2.762174, -0.356689, 1.042106, 1, 1, 1, 1, 1,
2.842535, -0.3522743, 1.543303, 1, 1, 1, 1, 1,
2.904403, -0.1055891, 0.4884604, 1, 1, 1, 1, 1,
3.005843, -1.399734, 3.611633, 1, 1, 1, 1, 1,
3.083532, 0.7490091, 3.892662, 1, 1, 1, 1, 1
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
var radius = 9.279181;
var distance = 32.59273;
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
mvMatrix.translate( 0.4166794, 0.06447387, 0.1893992 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.59273);
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