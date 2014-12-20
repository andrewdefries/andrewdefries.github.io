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
-3.887571, -1.420653, -2.553164, 1, 0, 0, 1,
-2.846889, -1.156426, -3.235692, 1, 0.007843138, 0, 1,
-2.792727, 0.4160128, -0.7546216, 1, 0.01176471, 0, 1,
-2.75505, 0.651944, -3.746629, 1, 0.01960784, 0, 1,
-2.572938, -0.7571363, -0.1677978, 1, 0.02352941, 0, 1,
-2.561017, 0.5146214, -0.9933245, 1, 0.03137255, 0, 1,
-2.517164, -0.04589945, -1.3585, 1, 0.03529412, 0, 1,
-2.508831, -1.090091, -2.345338, 1, 0.04313726, 0, 1,
-2.495231, 0.6761769, -0.9093245, 1, 0.04705882, 0, 1,
-2.486767, -0.784689, -2.622583, 1, 0.05490196, 0, 1,
-2.344764, 0.4724722, -1.393393, 1, 0.05882353, 0, 1,
-2.306869, 0.3370284, -1.133773, 1, 0.06666667, 0, 1,
-2.283958, -0.5230157, -1.527655, 1, 0.07058824, 0, 1,
-2.275199, -0.5365705, -0.5205464, 1, 0.07843138, 0, 1,
-2.272096, 0.4860631, -2.069621, 1, 0.08235294, 0, 1,
-2.244125, -0.8656, -2.008646, 1, 0.09019608, 0, 1,
-2.178026, -0.8074424, -1.60348, 1, 0.09411765, 0, 1,
-2.170042, 1.389526, -0.3593006, 1, 0.1019608, 0, 1,
-2.16256, 0.2932681, -0.98321, 1, 0.1098039, 0, 1,
-2.147975, -0.8884497, -0.9768982, 1, 0.1137255, 0, 1,
-2.137136, 1.36374, -0.3462561, 1, 0.1215686, 0, 1,
-2.135185, 0.4079624, -2.178645, 1, 0.1254902, 0, 1,
-2.127275, 0.37708, -1.463445, 1, 0.1333333, 0, 1,
-2.113098, 0.9429406, -0.6435948, 1, 0.1372549, 0, 1,
-2.067895, 1.196543, -2.590964, 1, 0.145098, 0, 1,
-2.040961, -0.3795726, -3.450616, 1, 0.1490196, 0, 1,
-2.021015, -0.7587328, -1.821231, 1, 0.1568628, 0, 1,
-1.998296, 0.3060058, 0.4940291, 1, 0.1607843, 0, 1,
-1.987083, 0.7198907, 0.7095324, 1, 0.1686275, 0, 1,
-1.9747, 1.229717, 0.4458881, 1, 0.172549, 0, 1,
-1.951864, -1.640374, -2.0073, 1, 0.1803922, 0, 1,
-1.944798, -1.459196, -3.265703, 1, 0.1843137, 0, 1,
-1.938132, -0.8320243, -2.560297, 1, 0.1921569, 0, 1,
-1.913578, 0.7587165, -1.333085, 1, 0.1960784, 0, 1,
-1.893093, -0.7169176, -1.031269, 1, 0.2039216, 0, 1,
-1.862471, 0.2223219, -0.993224, 1, 0.2117647, 0, 1,
-1.858536, -0.7018066, -1.974468, 1, 0.2156863, 0, 1,
-1.808191, 0.3245896, -1.858105, 1, 0.2235294, 0, 1,
-1.769691, -2.214231, -1.497624, 1, 0.227451, 0, 1,
-1.756683, 0.5454733, -1.981558, 1, 0.2352941, 0, 1,
-1.727291, 1.337428, -1.00488, 1, 0.2392157, 0, 1,
-1.668506, 0.09519683, -1.521459, 1, 0.2470588, 0, 1,
-1.642513, 0.7067975, -1.379326, 1, 0.2509804, 0, 1,
-1.633567, 0.7726876, -1.615557, 1, 0.2588235, 0, 1,
-1.632144, 0.9951414, -2.166564, 1, 0.2627451, 0, 1,
-1.62887, -0.3881965, -2.772337, 1, 0.2705882, 0, 1,
-1.628484, -0.8302985, -2.436972, 1, 0.2745098, 0, 1,
-1.613809, -0.8213322, -2.326195, 1, 0.282353, 0, 1,
-1.613788, 0.6126313, -1.530686, 1, 0.2862745, 0, 1,
-1.606612, -0.3693206, -2.710524, 1, 0.2941177, 0, 1,
-1.605061, 0.7279028, -2.226288, 1, 0.3019608, 0, 1,
-1.60151, -0.9667795, -0.766664, 1, 0.3058824, 0, 1,
-1.598684, 1.773699, -2.875257, 1, 0.3137255, 0, 1,
-1.558755, 0.6324407, -1.776359, 1, 0.3176471, 0, 1,
-1.546093, -2.016811, -1.961646, 1, 0.3254902, 0, 1,
-1.51805, -0.04550529, -1.825459, 1, 0.3294118, 0, 1,
-1.517229, 0.0838168, -0.6817813, 1, 0.3372549, 0, 1,
-1.515537, 2.627326, -1.768894, 1, 0.3411765, 0, 1,
-1.513577, -0.6825898, -2.072998, 1, 0.3490196, 0, 1,
-1.49987, -0.1785829, -1.428099, 1, 0.3529412, 0, 1,
-1.478952, 0.2176994, -1.133474, 1, 0.3607843, 0, 1,
-1.465543, -0.08455009, -1.112855, 1, 0.3647059, 0, 1,
-1.464535, 0.02063894, -1.790331, 1, 0.372549, 0, 1,
-1.459546, -1.803722, -3.4094, 1, 0.3764706, 0, 1,
-1.455605, 0.9180092, -0.9227899, 1, 0.3843137, 0, 1,
-1.45495, -0.1966583, -0.7818761, 1, 0.3882353, 0, 1,
-1.453524, -0.1447338, -3.373018, 1, 0.3960784, 0, 1,
-1.445619, 0.1864012, -3.757136, 1, 0.4039216, 0, 1,
-1.409907, 0.8449088, -1.651847, 1, 0.4078431, 0, 1,
-1.403906, 1.268046, -1.158192, 1, 0.4156863, 0, 1,
-1.399308, 0.9759322, -0.8823264, 1, 0.4196078, 0, 1,
-1.375839, -0.2715995, -1.166794, 1, 0.427451, 0, 1,
-1.374218, 1.40407, -2.245372, 1, 0.4313726, 0, 1,
-1.370734, 1.522291, -0.06055863, 1, 0.4392157, 0, 1,
-1.365274, 0.3672827, -0.8431474, 1, 0.4431373, 0, 1,
-1.359698, -0.9097094, -0.9579211, 1, 0.4509804, 0, 1,
-1.352111, 1.810924, -1.745903, 1, 0.454902, 0, 1,
-1.351979, -1.228234, -1.898657, 1, 0.4627451, 0, 1,
-1.350386, -0.07883818, -0.138737, 1, 0.4666667, 0, 1,
-1.348591, -0.0795278, -0.2403916, 1, 0.4745098, 0, 1,
-1.347975, -0.4925925, -2.156245, 1, 0.4784314, 0, 1,
-1.34788, 0.8006502, 0.660655, 1, 0.4862745, 0, 1,
-1.347521, 0.1343973, -3.000151, 1, 0.4901961, 0, 1,
-1.342214, 0.004321129, -0.7204311, 1, 0.4980392, 0, 1,
-1.338571, 0.6420604, -2.830257, 1, 0.5058824, 0, 1,
-1.335462, 0.1167542, -0.7991088, 1, 0.509804, 0, 1,
-1.334163, -1.141807, -2.696562, 1, 0.5176471, 0, 1,
-1.330905, 1.565763, -0.6391001, 1, 0.5215687, 0, 1,
-1.328944, -0.6131046, -2.448029, 1, 0.5294118, 0, 1,
-1.322834, -0.9599102, -2.326262, 1, 0.5333334, 0, 1,
-1.299021, 0.9299557, -2.505217, 1, 0.5411765, 0, 1,
-1.285935, 1.584845, 0.4260749, 1, 0.5450981, 0, 1,
-1.275303, 0.2484311, -1.514137, 1, 0.5529412, 0, 1,
-1.266261, -0.2731342, -1.200194, 1, 0.5568628, 0, 1,
-1.264652, 1.24134, -2.301059, 1, 0.5647059, 0, 1,
-1.262808, -0.7350252, -3.719513, 1, 0.5686275, 0, 1,
-1.261953, -1.137726, -0.337194, 1, 0.5764706, 0, 1,
-1.260598, 1.185818, 0.785168, 1, 0.5803922, 0, 1,
-1.259352, -1.220418, -2.510613, 1, 0.5882353, 0, 1,
-1.254585, -0.4463623, -1.186125, 1, 0.5921569, 0, 1,
-1.251352, -1.209521, -3.305714, 1, 0.6, 0, 1,
-1.249289, 0.7940284, -0.3815829, 1, 0.6078432, 0, 1,
-1.248834, 0.6540231, -1.021039, 1, 0.6117647, 0, 1,
-1.24369, 1.991936, -0.9775934, 1, 0.6196079, 0, 1,
-1.242642, 1.312062, -0.9909986, 1, 0.6235294, 0, 1,
-1.236422, -0.238368, -0.4239992, 1, 0.6313726, 0, 1,
-1.219219, -0.1103727, -1.01186, 1, 0.6352941, 0, 1,
-1.214531, -1.229918, -2.017776, 1, 0.6431373, 0, 1,
-1.210013, 0.3404544, -1.187146, 1, 0.6470588, 0, 1,
-1.188457, 0.9770626, -0.3242591, 1, 0.654902, 0, 1,
-1.184789, 0.3546961, -1.770432, 1, 0.6588235, 0, 1,
-1.183746, 0.191941, -2.004636, 1, 0.6666667, 0, 1,
-1.183332, 0.02647268, -1.157177, 1, 0.6705883, 0, 1,
-1.174468, 0.2782244, -0.2232366, 1, 0.6784314, 0, 1,
-1.17205, 0.7486054, -0.6899309, 1, 0.682353, 0, 1,
-1.170038, 0.06837234, -3.518943, 1, 0.6901961, 0, 1,
-1.161941, -2.017241, -1.021312, 1, 0.6941177, 0, 1,
-1.158969, 0.05680989, -3.300772, 1, 0.7019608, 0, 1,
-1.151477, 0.08785256, -0.4253007, 1, 0.7098039, 0, 1,
-1.150957, -0.8349132, -1.449906, 1, 0.7137255, 0, 1,
-1.12922, -0.3144858, -1.937134, 1, 0.7215686, 0, 1,
-1.129174, -0.4583051, -2.118135, 1, 0.7254902, 0, 1,
-1.128207, -0.1414849, -2.858333, 1, 0.7333333, 0, 1,
-1.128164, 0.1997008, -1.776871, 1, 0.7372549, 0, 1,
-1.126352, -0.4418178, -4.026835, 1, 0.7450981, 0, 1,
-1.119886, -0.06383519, -1.220703, 1, 0.7490196, 0, 1,
-1.118341, -0.4694347, -1.433418, 1, 0.7568628, 0, 1,
-1.11792, -1.203484, -2.2083, 1, 0.7607843, 0, 1,
-1.117013, -0.05059666, -0.8585841, 1, 0.7686275, 0, 1,
-1.108195, 0.1960111, -3.174461, 1, 0.772549, 0, 1,
-1.106596, -0.7051603, -1.200457, 1, 0.7803922, 0, 1,
-1.096898, 2.354864, -1.06745, 1, 0.7843137, 0, 1,
-1.095331, -0.8247401, -0.5464116, 1, 0.7921569, 0, 1,
-1.088497, -0.206771, -3.055554, 1, 0.7960784, 0, 1,
-1.083743, -0.01428372, -2.30202, 1, 0.8039216, 0, 1,
-1.075123, -0.4985611, 0.5046242, 1, 0.8117647, 0, 1,
-1.069157, 0.1883823, -1.18734, 1, 0.8156863, 0, 1,
-1.062142, 0.5329666, -0.8566936, 1, 0.8235294, 0, 1,
-1.060892, 0.3500895, -1.70089, 1, 0.827451, 0, 1,
-1.060521, 0.9339795, -1.167517, 1, 0.8352941, 0, 1,
-1.055868, -1.042665, -1.729771, 1, 0.8392157, 0, 1,
-1.054815, 0.4920186, -0.9025487, 1, 0.8470588, 0, 1,
-1.054139, -0.8717977, -2.273484, 1, 0.8509804, 0, 1,
-1.053897, -1.203761, -3.643903, 1, 0.8588235, 0, 1,
-1.049256, 0.1890783, -0.6863271, 1, 0.8627451, 0, 1,
-1.048793, -0.793568, -2.73953, 1, 0.8705882, 0, 1,
-1.04499, 0.08994383, -1.095666, 1, 0.8745098, 0, 1,
-1.044506, -0.2037155, -3.010962, 1, 0.8823529, 0, 1,
-1.040167, -1.242817, -2.252154, 1, 0.8862745, 0, 1,
-1.03714, 1.268002, -0.7015017, 1, 0.8941177, 0, 1,
-1.034502, -1.582331, -3.993846, 1, 0.8980392, 0, 1,
-1.021523, 1.091368, -3.079805, 1, 0.9058824, 0, 1,
-1.012233, 0.6728131, -0.6508, 1, 0.9137255, 0, 1,
-1.011608, 0.5363911, -0.1957866, 1, 0.9176471, 0, 1,
-0.9999795, 0.1068992, -1.319446, 1, 0.9254902, 0, 1,
-0.9934654, -0.3090969, -1.08794, 1, 0.9294118, 0, 1,
-0.9928271, 0.06702507, -2.132886, 1, 0.9372549, 0, 1,
-0.9925694, 0.2259513, -2.051204, 1, 0.9411765, 0, 1,
-0.9898968, -0.3185472, -2.036495, 1, 0.9490196, 0, 1,
-0.9896873, -1.187617, -3.435695, 1, 0.9529412, 0, 1,
-0.9875205, 1.391469, 0.07525788, 1, 0.9607843, 0, 1,
-0.9872026, 0.5234755, -1.470506, 1, 0.9647059, 0, 1,
-0.9859574, 1.330774, 0.8415105, 1, 0.972549, 0, 1,
-0.9839705, -0.5386429, -3.777888, 1, 0.9764706, 0, 1,
-0.9820716, -0.6988351, -2.301537, 1, 0.9843137, 0, 1,
-0.979931, 1.637504, -0.984098, 1, 0.9882353, 0, 1,
-0.9686046, 0.5135978, -1.674757, 1, 0.9960784, 0, 1,
-0.9614211, -0.6880631, -1.026694, 0.9960784, 1, 0, 1,
-0.958061, 0.6664227, 1.024343, 0.9921569, 1, 0, 1,
-0.9525164, 0.1012051, -0.9890757, 0.9843137, 1, 0, 1,
-0.9523088, -0.4801874, -0.5124744, 0.9803922, 1, 0, 1,
-0.9513795, -0.1833979, -0.6230332, 0.972549, 1, 0, 1,
-0.9492761, 0.4621754, 0.1278819, 0.9686275, 1, 0, 1,
-0.9465663, -1.813104, -3.514707, 0.9607843, 1, 0, 1,
-0.9459358, -0.09163986, -2.091339, 0.9568627, 1, 0, 1,
-0.9420054, -0.07349924, -2.905239, 0.9490196, 1, 0, 1,
-0.9338273, 0.1045042, 1.076713, 0.945098, 1, 0, 1,
-0.9319211, 1.781044, -1.285958, 0.9372549, 1, 0, 1,
-0.9275432, -0.6876696, -1.611444, 0.9333333, 1, 0, 1,
-0.9273835, -0.1228423, -1.825545, 0.9254902, 1, 0, 1,
-0.9248704, 1.435474, -0.6930211, 0.9215686, 1, 0, 1,
-0.9242885, -0.5267012, -0.5254348, 0.9137255, 1, 0, 1,
-0.9191509, 0.1115123, 0.0533343, 0.9098039, 1, 0, 1,
-0.9144341, 0.2317924, -1.069449, 0.9019608, 1, 0, 1,
-0.9137588, 0.6057512, -2.516058, 0.8941177, 1, 0, 1,
-0.9126119, -0.7571018, -1.085532, 0.8901961, 1, 0, 1,
-0.9108122, -0.1452464, 0.03920569, 0.8823529, 1, 0, 1,
-0.9108015, -1.622182, -1.490149, 0.8784314, 1, 0, 1,
-0.905973, -0.4380667, -3.127318, 0.8705882, 1, 0, 1,
-0.9043148, 2.388079, -1.079653, 0.8666667, 1, 0, 1,
-0.9038442, 0.4725382, -0.661613, 0.8588235, 1, 0, 1,
-0.8982701, 2.700632, 0.1613601, 0.854902, 1, 0, 1,
-0.8960423, 0.4376053, -2.650149, 0.8470588, 1, 0, 1,
-0.8956504, 0.7307796, -0.651446, 0.8431373, 1, 0, 1,
-0.8953334, 0.6435987, 0.3910567, 0.8352941, 1, 0, 1,
-0.8932731, -1.727753, -2.377784, 0.8313726, 1, 0, 1,
-0.8911989, -0.6852881, -1.972428, 0.8235294, 1, 0, 1,
-0.8892041, 0.4458688, -0.330622, 0.8196079, 1, 0, 1,
-0.8878528, 1.688085, -1.558478, 0.8117647, 1, 0, 1,
-0.881859, 0.5934725, -2.101594, 0.8078431, 1, 0, 1,
-0.8817633, 2.078237, -0.7124073, 0.8, 1, 0, 1,
-0.8807645, 0.5982341, -0.9395546, 0.7921569, 1, 0, 1,
-0.8749356, 1.366494, -1.68877, 0.7882353, 1, 0, 1,
-0.8746167, -0.009685867, -0.9152283, 0.7803922, 1, 0, 1,
-0.8713303, 0.04455232, -1.41308, 0.7764706, 1, 0, 1,
-0.8669723, -0.201154, -1.446673, 0.7686275, 1, 0, 1,
-0.8660064, -1.69769, -3.275079, 0.7647059, 1, 0, 1,
-0.8646958, -1.805263, -2.079793, 0.7568628, 1, 0, 1,
-0.8580244, -0.02989437, -2.615195, 0.7529412, 1, 0, 1,
-0.856096, -1.565386, -2.123302, 0.7450981, 1, 0, 1,
-0.8557198, 2.005193, -2.120531, 0.7411765, 1, 0, 1,
-0.8479095, 0.7264823, -0.002414372, 0.7333333, 1, 0, 1,
-0.8446528, -1.414361, -0.8401729, 0.7294118, 1, 0, 1,
-0.8444328, -0.3056749, -1.711368, 0.7215686, 1, 0, 1,
-0.8378436, 0.1514536, -1.485563, 0.7176471, 1, 0, 1,
-0.834676, -0.08027838, -1.692605, 0.7098039, 1, 0, 1,
-0.8314018, -0.2112104, 0.6211968, 0.7058824, 1, 0, 1,
-0.8302232, 0.068057, -1.479594, 0.6980392, 1, 0, 1,
-0.8288866, 0.5685757, 0.30859, 0.6901961, 1, 0, 1,
-0.8275937, -0.2317844, -1.478442, 0.6862745, 1, 0, 1,
-0.8224222, 0.2370435, -1.568989, 0.6784314, 1, 0, 1,
-0.820356, -1.490726, -1.35001, 0.6745098, 1, 0, 1,
-0.8167485, -1.579426, -2.894455, 0.6666667, 1, 0, 1,
-0.8135512, -0.07296266, 0.6158267, 0.6627451, 1, 0, 1,
-0.8124955, -0.5456142, -2.432144, 0.654902, 1, 0, 1,
-0.8103433, -0.3736885, -1.832378, 0.6509804, 1, 0, 1,
-0.8094562, 1.922301, -0.4601335, 0.6431373, 1, 0, 1,
-0.8028102, 0.8103393, -1.147914, 0.6392157, 1, 0, 1,
-0.7986051, 0.6835336, -1.57965, 0.6313726, 1, 0, 1,
-0.7976795, 0.5858679, -0.8492649, 0.627451, 1, 0, 1,
-0.7926643, 0.7109377, -2.608053, 0.6196079, 1, 0, 1,
-0.7891233, 0.9936039, -0.4045946, 0.6156863, 1, 0, 1,
-0.7805242, 1.204113, -0.5335833, 0.6078432, 1, 0, 1,
-0.7802985, 1.053748, -2.559371, 0.6039216, 1, 0, 1,
-0.7729589, -0.1271891, -3.417154, 0.5960785, 1, 0, 1,
-0.766537, 0.4710224, -1.136988, 0.5882353, 1, 0, 1,
-0.7643896, 1.304134, -0.2673015, 0.5843138, 1, 0, 1,
-0.7600335, 1.048131, -0.4360621, 0.5764706, 1, 0, 1,
-0.758187, -0.6310384, -1.618441, 0.572549, 1, 0, 1,
-0.7561246, 1.071725, 0.8925053, 0.5647059, 1, 0, 1,
-0.7534482, 0.7196149, -0.5650641, 0.5607843, 1, 0, 1,
-0.7509744, 0.5867735, -0.4504035, 0.5529412, 1, 0, 1,
-0.7485948, -0.9603642, -1.968347, 0.5490196, 1, 0, 1,
-0.746761, -0.8883141, -3.040607, 0.5411765, 1, 0, 1,
-0.7436203, -0.753159, -3.200041, 0.5372549, 1, 0, 1,
-0.7383302, -0.3759677, -1.18699, 0.5294118, 1, 0, 1,
-0.7314065, -0.8180916, -3.588862, 0.5254902, 1, 0, 1,
-0.7300072, -1.110338, -2.204271, 0.5176471, 1, 0, 1,
-0.7271534, 0.5295374, -2.37806, 0.5137255, 1, 0, 1,
-0.7249456, -0.7347869, -2.771443, 0.5058824, 1, 0, 1,
-0.7225145, 1.072687, -2.744139, 0.5019608, 1, 0, 1,
-0.7195109, 0.5157174, -0.5954491, 0.4941176, 1, 0, 1,
-0.719421, 1.012777, 0.339659, 0.4862745, 1, 0, 1,
-0.7193428, 0.948324, 1.594046, 0.4823529, 1, 0, 1,
-0.7161252, -1.692428, -1.790051, 0.4745098, 1, 0, 1,
-0.7151288, 1.801636, 0.6489099, 0.4705882, 1, 0, 1,
-0.7129685, 2.017995, -2.330865, 0.4627451, 1, 0, 1,
-0.7116485, -2.373068, -3.331196, 0.4588235, 1, 0, 1,
-0.7114484, 0.3468887, -2.363623, 0.4509804, 1, 0, 1,
-0.7068771, -1.183363, -0.6262682, 0.4470588, 1, 0, 1,
-0.7039813, 0.5800257, -1.964847, 0.4392157, 1, 0, 1,
-0.7003793, 0.6679046, -1.231547, 0.4352941, 1, 0, 1,
-0.6953176, -0.1475078, -4.13518, 0.427451, 1, 0, 1,
-0.6952909, -1.49757, -2.386401, 0.4235294, 1, 0, 1,
-0.6883995, 0.6172226, -0.585342, 0.4156863, 1, 0, 1,
-0.6842543, 0.1030331, -2.6828, 0.4117647, 1, 0, 1,
-0.6796072, -0.2668156, -1.656863, 0.4039216, 1, 0, 1,
-0.6785127, -0.7132143, -1.959367, 0.3960784, 1, 0, 1,
-0.6770592, 0.3828276, -1.143286, 0.3921569, 1, 0, 1,
-0.6768833, -0.3769203, -1.987519, 0.3843137, 1, 0, 1,
-0.6717361, 1.421994, -0.09504627, 0.3803922, 1, 0, 1,
-0.666099, 0.5221621, -0.6657411, 0.372549, 1, 0, 1,
-0.6624463, 1.255117, -0.5956221, 0.3686275, 1, 0, 1,
-0.6517032, -0.6094532, -3.847144, 0.3607843, 1, 0, 1,
-0.651476, 0.5428128, -1.551535, 0.3568628, 1, 0, 1,
-0.6503466, -1.020954, -2.928932, 0.3490196, 1, 0, 1,
-0.6486456, 0.632827, -1.580764, 0.345098, 1, 0, 1,
-0.6463776, 0.2986085, -1.180509, 0.3372549, 1, 0, 1,
-0.6410821, -0.1361929, -1.056425, 0.3333333, 1, 0, 1,
-0.6403642, 0.3601522, -0.3183391, 0.3254902, 1, 0, 1,
-0.6184832, -1.202571, -3.272769, 0.3215686, 1, 0, 1,
-0.6173621, 0.4728498, -2.749552, 0.3137255, 1, 0, 1,
-0.6154105, 1.123041, -1.124235, 0.3098039, 1, 0, 1,
-0.6150183, 1.018409, -1.619573, 0.3019608, 1, 0, 1,
-0.612187, 0.7852383, -0.5907723, 0.2941177, 1, 0, 1,
-0.6119652, -0.9132294, -1.309184, 0.2901961, 1, 0, 1,
-0.61067, 0.2084161, -3.066194, 0.282353, 1, 0, 1,
-0.6049219, -1.447016, -4.35894, 0.2784314, 1, 0, 1,
-0.6027033, 0.9826958, 0.57209, 0.2705882, 1, 0, 1,
-0.6021627, 0.4009353, -1.177195, 0.2666667, 1, 0, 1,
-0.6003339, -0.7171845, -3.675867, 0.2588235, 1, 0, 1,
-0.592685, 0.04302545, -0.3748898, 0.254902, 1, 0, 1,
-0.5894122, -1.872706, -3.258794, 0.2470588, 1, 0, 1,
-0.5867625, -1.132286, -4.588218, 0.2431373, 1, 0, 1,
-0.5818169, 0.2544516, -1.180511, 0.2352941, 1, 0, 1,
-0.5779788, -0.8938371, -2.349678, 0.2313726, 1, 0, 1,
-0.5768777, 1.431805, 1.531736, 0.2235294, 1, 0, 1,
-0.5765249, 1.237211, -0.4820003, 0.2196078, 1, 0, 1,
-0.5733778, -0.403821, -3.350182, 0.2117647, 1, 0, 1,
-0.5703091, 0.966206, -0.7722078, 0.2078431, 1, 0, 1,
-0.5665833, -0.7834685, -2.586411, 0.2, 1, 0, 1,
-0.5639195, -0.3782235, -3.586372, 0.1921569, 1, 0, 1,
-0.5574525, -2.222126, -2.938573, 0.1882353, 1, 0, 1,
-0.5567845, 0.1335127, 0.02238122, 0.1803922, 1, 0, 1,
-0.5560482, -0.5816193, -1.762607, 0.1764706, 1, 0, 1,
-0.5551775, -0.2332681, -2.421177, 0.1686275, 1, 0, 1,
-0.551092, 0.07609158, -2.544148, 0.1647059, 1, 0, 1,
-0.5475046, 2.371018, 0.3740928, 0.1568628, 1, 0, 1,
-0.5455906, 1.959772, 0.1698101, 0.1529412, 1, 0, 1,
-0.5383697, -0.04990275, -2.923635, 0.145098, 1, 0, 1,
-0.5344264, -0.4598218, -2.278062, 0.1411765, 1, 0, 1,
-0.5312395, -0.2131869, -0.9274871, 0.1333333, 1, 0, 1,
-0.5310438, -0.1045997, -3.030861, 0.1294118, 1, 0, 1,
-0.5294929, 0.6821426, -1.0555, 0.1215686, 1, 0, 1,
-0.5276833, -0.9730455, -2.949687, 0.1176471, 1, 0, 1,
-0.5260233, 0.2154156, -1.453389, 0.1098039, 1, 0, 1,
-0.5242704, -0.589757, -2.789933, 0.1058824, 1, 0, 1,
-0.5199099, 0.8794418, 0.7453601, 0.09803922, 1, 0, 1,
-0.5174072, 0.2156639, -1.104137, 0.09019608, 1, 0, 1,
-0.5144466, -1.699803, -3.330364, 0.08627451, 1, 0, 1,
-0.5117853, 0.9125885, -0.9611896, 0.07843138, 1, 0, 1,
-0.511753, 0.5248842, -1.093853, 0.07450981, 1, 0, 1,
-0.5061295, -0.1268926, -3.242723, 0.06666667, 1, 0, 1,
-0.505428, 0.2607632, -1.113084, 0.0627451, 1, 0, 1,
-0.5046519, -0.3362472, -1.815662, 0.05490196, 1, 0, 1,
-0.4969751, -0.1984331, -1.448686, 0.05098039, 1, 0, 1,
-0.4936186, 0.2722268, -1.858506, 0.04313726, 1, 0, 1,
-0.4932482, 0.4604527, -0.2050038, 0.03921569, 1, 0, 1,
-0.4929923, 1.065679, -2.296256, 0.03137255, 1, 0, 1,
-0.4869356, -0.09077048, -1.502408, 0.02745098, 1, 0, 1,
-0.4860102, -0.06543312, -3.155821, 0.01960784, 1, 0, 1,
-0.4840533, -1.676765, -2.521493, 0.01568628, 1, 0, 1,
-0.4828587, 0.2693709, -2.034423, 0.007843138, 1, 0, 1,
-0.4817456, 1.376936, -1.868392, 0.003921569, 1, 0, 1,
-0.4817193, 0.1495669, -1.937111, 0, 1, 0.003921569, 1,
-0.4814685, -1.50762, -3.196326, 0, 1, 0.01176471, 1,
-0.474425, 1.789653, 0.944321, 0, 1, 0.01568628, 1,
-0.4723997, 0.493443, -1.699907, 0, 1, 0.02352941, 1,
-0.4669859, 1.223883, 0.09885184, 0, 1, 0.02745098, 1,
-0.4664336, 0.3220438, -1.73757, 0, 1, 0.03529412, 1,
-0.4661955, 0.5874299, -3.176836, 0, 1, 0.03921569, 1,
-0.4658571, -1.409353, -4.954679, 0, 1, 0.04705882, 1,
-0.4637352, 0.859479, -0.5249086, 0, 1, 0.05098039, 1,
-0.4555214, 0.9336619, -1.138123, 0, 1, 0.05882353, 1,
-0.4542086, 0.3105087, -0.899088, 0, 1, 0.0627451, 1,
-0.4529614, 0.8426726, -1.891871, 0, 1, 0.07058824, 1,
-0.4385673, 0.6249724, -0.1740746, 0, 1, 0.07450981, 1,
-0.4377797, -0.2623252, -2.045499, 0, 1, 0.08235294, 1,
-0.4333091, -0.6179856, -1.092373, 0, 1, 0.08627451, 1,
-0.4291022, -0.5826188, -3.468191, 0, 1, 0.09411765, 1,
-0.4226331, -1.819912, -2.772417, 0, 1, 0.1019608, 1,
-0.4208658, 0.3001832, -1.145096, 0, 1, 0.1058824, 1,
-0.4193737, 0.5325806, -0.9601786, 0, 1, 0.1137255, 1,
-0.4119878, 0.2760009, -1.169557, 0, 1, 0.1176471, 1,
-0.4113396, -1.328593, -3.316969, 0, 1, 0.1254902, 1,
-0.4060553, -0.2432435, -1.720388, 0, 1, 0.1294118, 1,
-0.4053012, 0.1080009, -2.074812, 0, 1, 0.1372549, 1,
-0.4024177, 0.8302237, 1.023373, 0, 1, 0.1411765, 1,
-0.3992793, -2.157743, -3.632759, 0, 1, 0.1490196, 1,
-0.3967976, -0.7480716, -0.7923901, 0, 1, 0.1529412, 1,
-0.393461, -0.3777017, -2.132075, 0, 1, 0.1607843, 1,
-0.3911137, -0.797792, -2.456545, 0, 1, 0.1647059, 1,
-0.3878586, -0.08239552, 1.15613, 0, 1, 0.172549, 1,
-0.3861125, -2.074014, -2.411236, 0, 1, 0.1764706, 1,
-0.3809448, 0.1631753, -1.445325, 0, 1, 0.1843137, 1,
-0.3774172, 0.3232706, -0.7481889, 0, 1, 0.1882353, 1,
-0.3743129, -0.2091061, -2.41743, 0, 1, 0.1960784, 1,
-0.3730939, 0.08919993, 0.1586223, 0, 1, 0.2039216, 1,
-0.3700651, -1.719707, -3.554831, 0, 1, 0.2078431, 1,
-0.365245, -0.4732826, -0.9002745, 0, 1, 0.2156863, 1,
-0.3645376, -0.9987188, -2.119864, 0, 1, 0.2196078, 1,
-0.3643519, -0.5948856, -1.543983, 0, 1, 0.227451, 1,
-0.3623574, -0.8907844, -2.574365, 0, 1, 0.2313726, 1,
-0.3616909, -0.2710417, -3.095721, 0, 1, 0.2392157, 1,
-0.3602805, -0.09021439, -3.657898, 0, 1, 0.2431373, 1,
-0.3558198, 1.020042, -0.7659814, 0, 1, 0.2509804, 1,
-0.3556097, -0.8943379, -0.525691, 0, 1, 0.254902, 1,
-0.35473, 1.27058, 0.001378742, 0, 1, 0.2627451, 1,
-0.3473536, 0.8879002, -1.883595, 0, 1, 0.2666667, 1,
-0.3449277, -0.6759367, -1.856983, 0, 1, 0.2745098, 1,
-0.3438763, -0.9299532, -2.835928, 0, 1, 0.2784314, 1,
-0.3426054, 0.9037126, 0.1484969, 0, 1, 0.2862745, 1,
-0.3418688, 1.854657, -0.2025605, 0, 1, 0.2901961, 1,
-0.3416759, 0.8264364, 0.3772501, 0, 1, 0.2980392, 1,
-0.3375493, 0.1983578, 1.515454, 0, 1, 0.3058824, 1,
-0.3336005, -1.63884, -3.010815, 0, 1, 0.3098039, 1,
-0.3310977, 0.8839876, -0.3051407, 0, 1, 0.3176471, 1,
-0.3281686, -1.18373, -3.706572, 0, 1, 0.3215686, 1,
-0.3281386, 0.4293769, -0.6531708, 0, 1, 0.3294118, 1,
-0.3219585, 0.2257069, -0.5536022, 0, 1, 0.3333333, 1,
-0.3214333, -0.9289271, -3.621131, 0, 1, 0.3411765, 1,
-0.3213318, 0.1569093, -3.448312, 0, 1, 0.345098, 1,
-0.3132536, -0.08479347, -1.023934, 0, 1, 0.3529412, 1,
-0.312178, -1.066558, -0.8358655, 0, 1, 0.3568628, 1,
-0.3078936, 0.680344, 1.205351, 0, 1, 0.3647059, 1,
-0.3056231, -1.211266, -3.547879, 0, 1, 0.3686275, 1,
-0.2957928, -0.4682444, -2.059739, 0, 1, 0.3764706, 1,
-0.2954716, -0.06089803, -4.004867, 0, 1, 0.3803922, 1,
-0.2932032, 0.1577144, -1.578502, 0, 1, 0.3882353, 1,
-0.2924649, 0.3318526, -0.5876795, 0, 1, 0.3921569, 1,
-0.2871777, -0.1735184, -2.098118, 0, 1, 0.4, 1,
-0.2853648, -0.3615725, -3.635186, 0, 1, 0.4078431, 1,
-0.2758943, 0.4943858, 0.4676838, 0, 1, 0.4117647, 1,
-0.2738593, -1.025516, -2.341421, 0, 1, 0.4196078, 1,
-0.2737802, -1.174677, -3.513729, 0, 1, 0.4235294, 1,
-0.271855, -0.5675659, -2.867895, 0, 1, 0.4313726, 1,
-0.267943, 0.1040025, -2.002694, 0, 1, 0.4352941, 1,
-0.2650963, -0.8972838, -2.877438, 0, 1, 0.4431373, 1,
-0.2647651, -0.4907122, -2.350256, 0, 1, 0.4470588, 1,
-0.2630508, -1.391107, 0.03251644, 0, 1, 0.454902, 1,
-0.262885, 0.005441711, -1.873263, 0, 1, 0.4588235, 1,
-0.2569096, 1.650435, 0.7265116, 0, 1, 0.4666667, 1,
-0.2567841, -1.459342, -2.21023, 0, 1, 0.4705882, 1,
-0.2561589, -0.5657026, -3.381817, 0, 1, 0.4784314, 1,
-0.2518316, 0.2344509, -1.048262, 0, 1, 0.4823529, 1,
-0.2496186, 0.4923306, -0.9624484, 0, 1, 0.4901961, 1,
-0.2466128, 0.009632851, -1.693377, 0, 1, 0.4941176, 1,
-0.24174, 1.305403, -0.08190599, 0, 1, 0.5019608, 1,
-0.2409361, 0.4453201, -0.1990708, 0, 1, 0.509804, 1,
-0.2391258, -1.115568, -3.011864, 0, 1, 0.5137255, 1,
-0.2360526, 1.06048, -0.7367759, 0, 1, 0.5215687, 1,
-0.230054, 0.03868223, -3.338362, 0, 1, 0.5254902, 1,
-0.2267569, 1.096548, 1.371001, 0, 1, 0.5333334, 1,
-0.2245459, -0.1597335, -2.821495, 0, 1, 0.5372549, 1,
-0.2236627, -0.9381214, -3.232734, 0, 1, 0.5450981, 1,
-0.2217888, -1.580275, -1.568116, 0, 1, 0.5490196, 1,
-0.2147083, 1.67324, 1.002124, 0, 1, 0.5568628, 1,
-0.2139158, 0.5682999, -0.1648245, 0, 1, 0.5607843, 1,
-0.2123212, 0.2875652, 1.157735, 0, 1, 0.5686275, 1,
-0.2115969, -0.9002055, -3.740889, 0, 1, 0.572549, 1,
-0.2109201, 0.1577211, -2.303564, 0, 1, 0.5803922, 1,
-0.2037604, -0.2668835, -3.679056, 0, 1, 0.5843138, 1,
-0.2029379, 1.762413, 1.512893, 0, 1, 0.5921569, 1,
-0.2005161, 1.466416, -1.368619, 0, 1, 0.5960785, 1,
-0.1981747, 1.352915, 0.3745801, 0, 1, 0.6039216, 1,
-0.1976759, 0.5150761, 0.0497141, 0, 1, 0.6117647, 1,
-0.1976319, 0.9509719, -1.061934, 0, 1, 0.6156863, 1,
-0.1959183, 1.479833, 1.905173, 0, 1, 0.6235294, 1,
-0.1957565, 1.636547, -0.03927018, 0, 1, 0.627451, 1,
-0.1943933, -0.4534345, -2.463102, 0, 1, 0.6352941, 1,
-0.1906377, -0.41328, -1.11647, 0, 1, 0.6392157, 1,
-0.1856469, 1.154633, 0.04897016, 0, 1, 0.6470588, 1,
-0.1844716, -0.6190299, -2.689315, 0, 1, 0.6509804, 1,
-0.1836522, 1.011108, -0.05085034, 0, 1, 0.6588235, 1,
-0.181458, -0.3999794, -3.759246, 0, 1, 0.6627451, 1,
-0.1764685, 0.3262207, 1.121587, 0, 1, 0.6705883, 1,
-0.175279, 0.9032484, 0.3812504, 0, 1, 0.6745098, 1,
-0.1705248, -1.77902, -1.862436, 0, 1, 0.682353, 1,
-0.1691027, -1.006849, -3.119771, 0, 1, 0.6862745, 1,
-0.1687476, 0.0343353, -1.426297, 0, 1, 0.6941177, 1,
-0.1605167, -0.9114799, -2.046238, 0, 1, 0.7019608, 1,
-0.1603711, 0.6071172, 0.3001043, 0, 1, 0.7058824, 1,
-0.1597385, -1.040556, -4.583193, 0, 1, 0.7137255, 1,
-0.1574686, 0.6943737, -1.608806, 0, 1, 0.7176471, 1,
-0.1563014, 1.320293, -0.9036362, 0, 1, 0.7254902, 1,
-0.1554926, -1.012486, -4.541678, 0, 1, 0.7294118, 1,
-0.1520423, 2.236711, 0.5026343, 0, 1, 0.7372549, 1,
-0.1510795, -0.2937702, -3.596279, 0, 1, 0.7411765, 1,
-0.1413831, -1.514871, -1.611707, 0, 1, 0.7490196, 1,
-0.1376597, 0.06353515, 0.1207747, 0, 1, 0.7529412, 1,
-0.1372253, 2.499071, -0.8356796, 0, 1, 0.7607843, 1,
-0.1314184, -0.3604957, -1.623435, 0, 1, 0.7647059, 1,
-0.1284225, 1.724721, -0.03196369, 0, 1, 0.772549, 1,
-0.1268154, 1.849376, 1.895188, 0, 1, 0.7764706, 1,
-0.1264581, 0.6368919, -1.07702, 0, 1, 0.7843137, 1,
-0.1143877, 0.763441, -1.106437, 0, 1, 0.7882353, 1,
-0.109463, 1.870714, 0.2094058, 0, 1, 0.7960784, 1,
-0.1083136, 0.8485544, -0.1733236, 0, 1, 0.8039216, 1,
-0.10581, -1.276942, -3.211329, 0, 1, 0.8078431, 1,
-0.1045567, 2.394636, 1.325449, 0, 1, 0.8156863, 1,
-0.1042355, 1.692106, 0.8572129, 0, 1, 0.8196079, 1,
-0.1011041, 0.4895266, -2.319834, 0, 1, 0.827451, 1,
-0.09980298, 0.772842, -0.4082951, 0, 1, 0.8313726, 1,
-0.09449433, -0.01796406, -2.69184, 0, 1, 0.8392157, 1,
-0.09337089, 1.399228, -0.2553505, 0, 1, 0.8431373, 1,
-0.09259822, -1.052893, -3.877469, 0, 1, 0.8509804, 1,
-0.09171508, 0.4629808, 0.2184955, 0, 1, 0.854902, 1,
-0.08595217, -0.8778551, -4.570655, 0, 1, 0.8627451, 1,
-0.08537973, -0.3086222, -2.831508, 0, 1, 0.8666667, 1,
-0.08325582, 0.0649088, -2.033044, 0, 1, 0.8745098, 1,
-0.08187599, -0.2611982, -3.603467, 0, 1, 0.8784314, 1,
-0.08085274, 1.691483, -1.965671, 0, 1, 0.8862745, 1,
-0.07567971, -0.3178648, -3.090091, 0, 1, 0.8901961, 1,
-0.07335147, 2.060796, -0.8611462, 0, 1, 0.8980392, 1,
-0.07307996, 0.8656992, -1.659122, 0, 1, 0.9058824, 1,
-0.06963263, -2.346816, -3.414809, 0, 1, 0.9098039, 1,
-0.06888749, 0.2526724, -0.2989672, 0, 1, 0.9176471, 1,
-0.06828459, 0.4688028, -0.1776862, 0, 1, 0.9215686, 1,
-0.065656, 0.8112289, -0.9854, 0, 1, 0.9294118, 1,
-0.06539818, -0.9533283, -3.540404, 0, 1, 0.9333333, 1,
-0.0612314, 1.645474, -0.3062384, 0, 1, 0.9411765, 1,
-0.05621977, -1.468359, -2.895563, 0, 1, 0.945098, 1,
-0.05600452, 0.5805906, 0.9583901, 0, 1, 0.9529412, 1,
-0.05598138, -1.056797, -3.370034, 0, 1, 0.9568627, 1,
-0.05509118, -0.2719983, -0.5597622, 0, 1, 0.9647059, 1,
-0.04838104, -1.887694, -2.652746, 0, 1, 0.9686275, 1,
-0.04591576, 1.011761, 0.5368858, 0, 1, 0.9764706, 1,
-0.04477935, -0.2715793, -4.560771, 0, 1, 0.9803922, 1,
-0.04411398, 0.4530104, -1.081938, 0, 1, 0.9882353, 1,
-0.04257881, -2.521002, -4.047762, 0, 1, 0.9921569, 1,
-0.04248066, 0.2101254, -1.271248, 0, 1, 1, 1,
-0.0410102, 0.08863637, 0.179611, 0, 0.9921569, 1, 1,
-0.04072865, 0.250383, -1.919938, 0, 0.9882353, 1, 1,
-0.04030508, 0.5727544, -0.2025408, 0, 0.9803922, 1, 1,
-0.03636715, 1.699472, 1.648514, 0, 0.9764706, 1, 1,
-0.03364046, 1.430881, -1.266003, 0, 0.9686275, 1, 1,
-0.03349571, -0.05509817, -2.37507, 0, 0.9647059, 1, 1,
-0.02897997, -0.1667881, -2.025762, 0, 0.9568627, 1, 1,
-0.02611534, 1.550622, -0.4832433, 0, 0.9529412, 1, 1,
-0.02537915, 1.492557, 0.1239984, 0, 0.945098, 1, 1,
-0.0248587, 1.307542, -0.5785593, 0, 0.9411765, 1, 1,
-0.02300104, 2.491185, -0.3583462, 0, 0.9333333, 1, 1,
-0.02131913, -0.4717481, -3.067108, 0, 0.9294118, 1, 1,
-0.02038019, 0.6342442, 0.1854176, 0, 0.9215686, 1, 1,
-0.01766378, 0.8278066, -2.117097, 0, 0.9176471, 1, 1,
-0.01429773, 0.456175, -0.05151583, 0, 0.9098039, 1, 1,
-0.01337167, -0.6583259, -2.648369, 0, 0.9058824, 1, 1,
-0.01219335, -0.3969885, -3.229939, 0, 0.8980392, 1, 1,
-0.009882797, -0.5500358, -4.917677, 0, 0.8901961, 1, 1,
-0.006931646, -2.186594, -2.692844, 0, 0.8862745, 1, 1,
-0.002155811, 1.507731, -0.4454356, 0, 0.8784314, 1, 1,
-0.001270841, 0.7501281, -1.069585, 0, 0.8745098, 1, 1,
0.004071258, 0.8065199, -1.261497, 0, 0.8666667, 1, 1,
0.006326305, -1.782581, 3.235403, 0, 0.8627451, 1, 1,
0.008761504, -0.3075401, 2.932258, 0, 0.854902, 1, 1,
0.01055832, -0.6720396, 3.282679, 0, 0.8509804, 1, 1,
0.01268657, -1.213264, 4.753181, 0, 0.8431373, 1, 1,
0.02198263, 0.08688583, 0.9080009, 0, 0.8392157, 1, 1,
0.02277638, -0.7221667, 3.192198, 0, 0.8313726, 1, 1,
0.02576774, -1.340303, 2.142104, 0, 0.827451, 1, 1,
0.02633093, 0.03080134, -0.3263822, 0, 0.8196079, 1, 1,
0.02733351, 1.517498, -1.223391, 0, 0.8156863, 1, 1,
0.03524758, 1.280407, 0.8995736, 0, 0.8078431, 1, 1,
0.03693649, 0.1945839, 1.530687, 0, 0.8039216, 1, 1,
0.04250013, 0.3155769, 0.6863462, 0, 0.7960784, 1, 1,
0.04725907, -0.8995205, 3.03206, 0, 0.7882353, 1, 1,
0.04994489, -0.7854172, 2.184205, 0, 0.7843137, 1, 1,
0.0506884, 0.9124666, -2.311357, 0, 0.7764706, 1, 1,
0.05379866, 0.8322242, 0.6834104, 0, 0.772549, 1, 1,
0.05383555, -0.06192002, 2.594461, 0, 0.7647059, 1, 1,
0.05429345, -0.2698452, 3.555974, 0, 0.7607843, 1, 1,
0.05458692, -1.490675, 1.479706, 0, 0.7529412, 1, 1,
0.06230296, -1.071117, 4.865626, 0, 0.7490196, 1, 1,
0.07480862, 1.910171, 0.6862226, 0, 0.7411765, 1, 1,
0.07496841, -0.2663379, 2.467625, 0, 0.7372549, 1, 1,
0.07762169, 0.7933093, -0.644614, 0, 0.7294118, 1, 1,
0.08267641, 1.117805, -0.6572375, 0, 0.7254902, 1, 1,
0.08310617, 1.334587, -0.2344631, 0, 0.7176471, 1, 1,
0.0858543, -0.2271609, 2.113304, 0, 0.7137255, 1, 1,
0.08961019, -0.08085999, 1.78692, 0, 0.7058824, 1, 1,
0.0897994, -1.744141, 3.136978, 0, 0.6980392, 1, 1,
0.09308523, -0.6783919, 2.136743, 0, 0.6941177, 1, 1,
0.09309828, 0.6412428, 0.8438359, 0, 0.6862745, 1, 1,
0.09731707, 0.7807255, -0.03614723, 0, 0.682353, 1, 1,
0.1021502, 0.1396971, -0.1554606, 0, 0.6745098, 1, 1,
0.1063323, 0.2441969, 0.1169127, 0, 0.6705883, 1, 1,
0.1070589, 0.5621336, -0.8016869, 0, 0.6627451, 1, 1,
0.1092385, -0.4538163, 3.121476, 0, 0.6588235, 1, 1,
0.1131453, 1.462871, 0.8335422, 0, 0.6509804, 1, 1,
0.1159515, 0.6579905, 0.6959302, 0, 0.6470588, 1, 1,
0.1202464, -0.2835205, 2.276595, 0, 0.6392157, 1, 1,
0.1206618, 0.1716949, 0.03257675, 0, 0.6352941, 1, 1,
0.1223732, -0.6143681, 5.00737, 0, 0.627451, 1, 1,
0.1253691, 1.173704, -0.8940817, 0, 0.6235294, 1, 1,
0.131331, 0.5089097, -1.355515, 0, 0.6156863, 1, 1,
0.1342671, -1.356261, 4.585611, 0, 0.6117647, 1, 1,
0.1367656, 0.1196468, 0.4335826, 0, 0.6039216, 1, 1,
0.1377262, -1.713196, 4.130652, 0, 0.5960785, 1, 1,
0.1415157, 1.878263, -1.806363, 0, 0.5921569, 1, 1,
0.1423205, -1.841953, 1.464107, 0, 0.5843138, 1, 1,
0.1522446, 0.8596815, -0.4775101, 0, 0.5803922, 1, 1,
0.1548813, 0.6030189, 2.320259, 0, 0.572549, 1, 1,
0.1569782, -0.326005, 3.518882, 0, 0.5686275, 1, 1,
0.1586197, -2.028289, 5.422093, 0, 0.5607843, 1, 1,
0.159152, 1.509381, 0.3150424, 0, 0.5568628, 1, 1,
0.1603078, -1.479391, 1.349979, 0, 0.5490196, 1, 1,
0.1611764, -0.8848059, 1.251772, 0, 0.5450981, 1, 1,
0.1621457, -0.9060534, 3.793977, 0, 0.5372549, 1, 1,
0.1660868, -1.134225, 3.384276, 0, 0.5333334, 1, 1,
0.1705836, -0.09052587, 2.219233, 0, 0.5254902, 1, 1,
0.1709387, -0.6173546, 2.623701, 0, 0.5215687, 1, 1,
0.1715227, -0.7474017, 3.338797, 0, 0.5137255, 1, 1,
0.1816556, 0.7519516, 0.7410977, 0, 0.509804, 1, 1,
0.1822566, 0.5666177, -0.1054852, 0, 0.5019608, 1, 1,
0.1840862, -0.3489779, 2.65775, 0, 0.4941176, 1, 1,
0.1928899, 0.05079432, -1.180024, 0, 0.4901961, 1, 1,
0.2017366, -1.451591, 2.113082, 0, 0.4823529, 1, 1,
0.2041618, 0.1448513, 0.5757219, 0, 0.4784314, 1, 1,
0.2066259, 1.053664, -0.01265047, 0, 0.4705882, 1, 1,
0.2081913, -0.09486925, -0.4985443, 0, 0.4666667, 1, 1,
0.2089627, 0.9376821, 0.7441886, 0, 0.4588235, 1, 1,
0.2092446, 0.532922, 1.154951, 0, 0.454902, 1, 1,
0.2105469, 1.142169, -0.81877, 0, 0.4470588, 1, 1,
0.2110054, 0.089989, 0.5288594, 0, 0.4431373, 1, 1,
0.2133259, 0.3412935, 1.942377, 0, 0.4352941, 1, 1,
0.214381, 0.3378528, -0.2518404, 0, 0.4313726, 1, 1,
0.221218, -0.8989428, 3.714476, 0, 0.4235294, 1, 1,
0.2234098, 0.2195149, -1.600622, 0, 0.4196078, 1, 1,
0.2282559, -0.2526629, 2.593203, 0, 0.4117647, 1, 1,
0.2378009, -1.667524, 3.429288, 0, 0.4078431, 1, 1,
0.239564, -1.153614, 3.893041, 0, 0.4, 1, 1,
0.2421325, 0.03455524, 0.3584633, 0, 0.3921569, 1, 1,
0.2470038, 0.1240115, 0.3018408, 0, 0.3882353, 1, 1,
0.2495535, 0.5674179, 0.8402479, 0, 0.3803922, 1, 1,
0.2499279, 0.02761882, 3.218268, 0, 0.3764706, 1, 1,
0.2515282, -0.3195854, 2.113187, 0, 0.3686275, 1, 1,
0.2554014, -1.356129, 2.286174, 0, 0.3647059, 1, 1,
0.2572453, -0.4252528, 4.238223, 0, 0.3568628, 1, 1,
0.2617315, 0.1986633, 0.6867623, 0, 0.3529412, 1, 1,
0.2628971, -0.6516133, 3.451251, 0, 0.345098, 1, 1,
0.2759406, 1.009209, -0.2184354, 0, 0.3411765, 1, 1,
0.2772185, 0.9642086, 1.122437, 0, 0.3333333, 1, 1,
0.2781563, -0.02271883, 2.085728, 0, 0.3294118, 1, 1,
0.2801454, 1.290203, -0.4776674, 0, 0.3215686, 1, 1,
0.2812541, 1.894988, -0.06532271, 0, 0.3176471, 1, 1,
0.2824788, -1.055089, 2.299159, 0, 0.3098039, 1, 1,
0.2831855, 1.62471, 0.514145, 0, 0.3058824, 1, 1,
0.2870316, 0.1292224, 2.933086, 0, 0.2980392, 1, 1,
0.2872036, -0.2045748, 2.385552, 0, 0.2901961, 1, 1,
0.2888472, 2.058517, 1.009997, 0, 0.2862745, 1, 1,
0.2913615, 0.1791826, 1.0238, 0, 0.2784314, 1, 1,
0.2962263, 0.6550804, 0.5679368, 0, 0.2745098, 1, 1,
0.2969508, 0.9173676, 0.3180058, 0, 0.2666667, 1, 1,
0.29752, -0.08979118, 0.2428554, 0, 0.2627451, 1, 1,
0.2977129, -1.456162, 1.973232, 0, 0.254902, 1, 1,
0.3015629, -0.272806, 1.837135, 0, 0.2509804, 1, 1,
0.3020079, 0.4132979, -0.3181865, 0, 0.2431373, 1, 1,
0.302224, 0.04478522, 0.6560606, 0, 0.2392157, 1, 1,
0.3026446, 0.1032119, 2.929217, 0, 0.2313726, 1, 1,
0.3150981, -1.005506, 2.601372, 0, 0.227451, 1, 1,
0.3187771, 0.1032829, 1.985927, 0, 0.2196078, 1, 1,
0.3213288, 0.1935626, 1.343134, 0, 0.2156863, 1, 1,
0.3244728, 0.8249357, -0.4990167, 0, 0.2078431, 1, 1,
0.324558, -0.4427665, 2.834643, 0, 0.2039216, 1, 1,
0.3276871, -0.2289564, 1.698674, 0, 0.1960784, 1, 1,
0.3300272, -0.3346723, 2.282557, 0, 0.1882353, 1, 1,
0.3319354, 1.638381, 1.400193, 0, 0.1843137, 1, 1,
0.3339705, -1.808031, 3.322313, 0, 0.1764706, 1, 1,
0.3366455, -1.338127, 1.738815, 0, 0.172549, 1, 1,
0.3370913, -0.3960461, 2.166306, 0, 0.1647059, 1, 1,
0.3394717, -0.3117702, 1.075125, 0, 0.1607843, 1, 1,
0.3467265, -0.3222972, 1.977522, 0, 0.1529412, 1, 1,
0.3478022, -0.4180073, 3.958025, 0, 0.1490196, 1, 1,
0.3491497, 0.7880545, -1.148687, 0, 0.1411765, 1, 1,
0.3605337, -1.529544, 1.554769, 0, 0.1372549, 1, 1,
0.3629134, -0.8010146, 5.323355, 0, 0.1294118, 1, 1,
0.3662059, -1.939642, 3.676734, 0, 0.1254902, 1, 1,
0.3666657, -0.08078364, 1.73421, 0, 0.1176471, 1, 1,
0.3760996, -0.6128049, 1.793476, 0, 0.1137255, 1, 1,
0.379243, 1.759613, 0.717263, 0, 0.1058824, 1, 1,
0.3866768, -1.688779, 2.831307, 0, 0.09803922, 1, 1,
0.3868537, -0.3188073, 2.036012, 0, 0.09411765, 1, 1,
0.3913591, 0.5628126, 1.192799, 0, 0.08627451, 1, 1,
0.3954173, 1.201876, 0.9574894, 0, 0.08235294, 1, 1,
0.3967436, 0.6362768, 0.5029934, 0, 0.07450981, 1, 1,
0.3977687, 0.748087, -0.1970768, 0, 0.07058824, 1, 1,
0.401016, 1.101811, 1.564885, 0, 0.0627451, 1, 1,
0.404131, -0.02907423, 0.007788947, 0, 0.05882353, 1, 1,
0.4048495, -0.9849387, 2.478374, 0, 0.05098039, 1, 1,
0.4125075, 0.1479478, 1.019217, 0, 0.04705882, 1, 1,
0.4129427, -0.7025369, 0.2209995, 0, 0.03921569, 1, 1,
0.4173609, 0.9395544, -1.224286, 0, 0.03529412, 1, 1,
0.4241688, -0.3256795, 1.240816, 0, 0.02745098, 1, 1,
0.4270473, 1.288137, 1.774505, 0, 0.02352941, 1, 1,
0.4283993, 1.356421, -0.9215389, 0, 0.01568628, 1, 1,
0.4289738, -1.439386, 2.644531, 0, 0.01176471, 1, 1,
0.4290564, 0.3008708, 0.6638921, 0, 0.003921569, 1, 1,
0.4291406, -0.4810906, 2.244882, 0.003921569, 0, 1, 1,
0.4323381, 0.5822942, 1.037991, 0.007843138, 0, 1, 1,
0.4361256, -0.3055503, 2.269951, 0.01568628, 0, 1, 1,
0.4364856, -1.115535, 1.893229, 0.01960784, 0, 1, 1,
0.4370425, -0.2377982, 2.266048, 0.02745098, 0, 1, 1,
0.4462955, -0.3110904, 1.817614, 0.03137255, 0, 1, 1,
0.4513449, 1.10701, -0.5164787, 0.03921569, 0, 1, 1,
0.4560457, 1.567272, 0.9465316, 0.04313726, 0, 1, 1,
0.457766, -1.351207, 3.454089, 0.05098039, 0, 1, 1,
0.4593083, -0.3479953, 0.7697763, 0.05490196, 0, 1, 1,
0.4595205, 1.698499, -0.4646693, 0.0627451, 0, 1, 1,
0.4599952, 1.522301, 1.136027, 0.06666667, 0, 1, 1,
0.4610938, 0.4355876, 1.082505, 0.07450981, 0, 1, 1,
0.463555, 0.1810486, 1.027884, 0.07843138, 0, 1, 1,
0.466196, -0.9481953, 2.40154, 0.08627451, 0, 1, 1,
0.4710875, -1.686949, 2.827865, 0.09019608, 0, 1, 1,
0.4839927, -0.202904, 1.084672, 0.09803922, 0, 1, 1,
0.4889424, -0.9857822, 3.064704, 0.1058824, 0, 1, 1,
0.4898965, 0.2244801, 0.4693108, 0.1098039, 0, 1, 1,
0.4906132, 0.1442111, 0.7643173, 0.1176471, 0, 1, 1,
0.4907562, 1.234522, -0.05148786, 0.1215686, 0, 1, 1,
0.4942501, 1.84718, 0.7228754, 0.1294118, 0, 1, 1,
0.4982653, -2.4029, 3.785082, 0.1333333, 0, 1, 1,
0.4997404, 1.215539, 0.865433, 0.1411765, 0, 1, 1,
0.5004895, 0.5385058, 1.748791, 0.145098, 0, 1, 1,
0.5030962, 0.1667683, -0.4051101, 0.1529412, 0, 1, 1,
0.5038061, -0.9758034, 1.681563, 0.1568628, 0, 1, 1,
0.5048223, -0.6096524, 2.386928, 0.1647059, 0, 1, 1,
0.5079052, 1.750791, -0.1088999, 0.1686275, 0, 1, 1,
0.5110922, -0.5726974, 1.995418, 0.1764706, 0, 1, 1,
0.514136, -1.511595, 3.050797, 0.1803922, 0, 1, 1,
0.5184637, 2.481281, 0.6420487, 0.1882353, 0, 1, 1,
0.5196127, -0.9763389, 3.085557, 0.1921569, 0, 1, 1,
0.5218424, 0.9440061, 0.3631279, 0.2, 0, 1, 1,
0.5222876, 1.713778, 1.230303, 0.2078431, 0, 1, 1,
0.5236524, 1.558017, 0.03614429, 0.2117647, 0, 1, 1,
0.525759, 1.327844, 0.3735139, 0.2196078, 0, 1, 1,
0.5274875, 0.6647563, 1.810912, 0.2235294, 0, 1, 1,
0.5285326, 2.100149, 0.721848, 0.2313726, 0, 1, 1,
0.5289032, -1.15897, 5.262853, 0.2352941, 0, 1, 1,
0.534085, 0.1077416, 2.833132, 0.2431373, 0, 1, 1,
0.5352926, 1.338626, -0.3098662, 0.2470588, 0, 1, 1,
0.5384917, -0.523801, 2.010642, 0.254902, 0, 1, 1,
0.5419661, -0.3353577, 0.6650181, 0.2588235, 0, 1, 1,
0.5479661, 2.661428, 0.1570015, 0.2666667, 0, 1, 1,
0.5513039, -1.481968, 2.627406, 0.2705882, 0, 1, 1,
0.5536106, -0.6246184, 3.126359, 0.2784314, 0, 1, 1,
0.5566499, -0.566684, 2.339931, 0.282353, 0, 1, 1,
0.5587746, -0.6751385, 2.964183, 0.2901961, 0, 1, 1,
0.5595355, 0.8709515, 2.600405, 0.2941177, 0, 1, 1,
0.5634136, -0.109055, 0.4401888, 0.3019608, 0, 1, 1,
0.565645, 0.2032537, 0.5976008, 0.3098039, 0, 1, 1,
0.5663637, -1.516837, 2.168911, 0.3137255, 0, 1, 1,
0.5691043, -1.493908, 4.069228, 0.3215686, 0, 1, 1,
0.5692868, 0.03228723, 1.95208, 0.3254902, 0, 1, 1,
0.5695601, 0.1898068, 1.943529, 0.3333333, 0, 1, 1,
0.573395, 1.927132, -0.3821302, 0.3372549, 0, 1, 1,
0.5735896, -0.686506, 1.220817, 0.345098, 0, 1, 1,
0.5765221, 0.4104614, 1.807171, 0.3490196, 0, 1, 1,
0.5796002, 0.3975807, 1.638845, 0.3568628, 0, 1, 1,
0.5843302, 0.05017601, 0.7364538, 0.3607843, 0, 1, 1,
0.5859886, 0.1394061, 2.414649, 0.3686275, 0, 1, 1,
0.5944769, 0.6391392, 0.3384776, 0.372549, 0, 1, 1,
0.5946385, -1.334227, 2.63282, 0.3803922, 0, 1, 1,
0.595334, -0.1663737, 1.954191, 0.3843137, 0, 1, 1,
0.5988842, 0.4580078, 1.195163, 0.3921569, 0, 1, 1,
0.5996251, 0.1344429, -0.1089354, 0.3960784, 0, 1, 1,
0.5997514, -0.8359193, 1.319356, 0.4039216, 0, 1, 1,
0.6015655, 0.7229533, 2.389918, 0.4117647, 0, 1, 1,
0.6050339, -0.5384091, 1.694698, 0.4156863, 0, 1, 1,
0.6065247, -0.26822, 3.222888, 0.4235294, 0, 1, 1,
0.6106257, -0.5604951, 1.049794, 0.427451, 0, 1, 1,
0.6111384, -0.3788428, 1.541411, 0.4352941, 0, 1, 1,
0.6121636, 2.064473, -0.6180796, 0.4392157, 0, 1, 1,
0.6158519, -0.3820103, 2.453128, 0.4470588, 0, 1, 1,
0.6264632, 0.503204, 1.49765, 0.4509804, 0, 1, 1,
0.6266966, 0.7810462, 1.007819, 0.4588235, 0, 1, 1,
0.6316485, 0.01651339, 1.336296, 0.4627451, 0, 1, 1,
0.6353486, 0.7214352, 0.8789042, 0.4705882, 0, 1, 1,
0.6369772, 0.5406685, 0.4677479, 0.4745098, 0, 1, 1,
0.6379271, 0.845035, 0.4823105, 0.4823529, 0, 1, 1,
0.6402342, 1.37778, 1.555823, 0.4862745, 0, 1, 1,
0.6428522, 0.558045, 2.82362, 0.4941176, 0, 1, 1,
0.6489837, 1.485035, -0.3346356, 0.5019608, 0, 1, 1,
0.6509848, 0.3142499, 0.1934898, 0.5058824, 0, 1, 1,
0.6514136, 0.6085796, -1.037119, 0.5137255, 0, 1, 1,
0.657554, 1.160672, 1.138621, 0.5176471, 0, 1, 1,
0.6576166, 0.7801849, 1.362562, 0.5254902, 0, 1, 1,
0.6721025, 0.8929235, -0.1931368, 0.5294118, 0, 1, 1,
0.6744339, -2.341805, 3.839267, 0.5372549, 0, 1, 1,
0.6816966, 0.6521764, 1.054757, 0.5411765, 0, 1, 1,
0.6820772, -0.0445812, 1.525346, 0.5490196, 0, 1, 1,
0.6861032, 0.3637743, -0.2846472, 0.5529412, 0, 1, 1,
0.6901737, -1.343895, 1.860326, 0.5607843, 0, 1, 1,
0.6923414, 0.3595135, -0.03664223, 0.5647059, 0, 1, 1,
0.6934748, -1.328098, 2.905406, 0.572549, 0, 1, 1,
0.6976556, -0.1775189, 2.164961, 0.5764706, 0, 1, 1,
0.6988454, 0.5662251, -0.978609, 0.5843138, 0, 1, 1,
0.700471, -0.3610411, 1.487292, 0.5882353, 0, 1, 1,
0.7062418, -1.965785, 2.872017, 0.5960785, 0, 1, 1,
0.709824, 2.032971, 0.754439, 0.6039216, 0, 1, 1,
0.7192018, -0.5108753, 3.706791, 0.6078432, 0, 1, 1,
0.7254196, 1.139082, 0.8271282, 0.6156863, 0, 1, 1,
0.7305171, -0.6640262, 2.01185, 0.6196079, 0, 1, 1,
0.7385525, -0.5065216, 4.088409, 0.627451, 0, 1, 1,
0.7392001, -0.7437928, 2.17389, 0.6313726, 0, 1, 1,
0.7402914, 0.05476461, 0.9120951, 0.6392157, 0, 1, 1,
0.7424191, -0.4272545, 1.837087, 0.6431373, 0, 1, 1,
0.7503355, -1.041422, 5.25269, 0.6509804, 0, 1, 1,
0.7505316, 0.3717239, 1.450337, 0.654902, 0, 1, 1,
0.7546576, -1.964753, 3.020885, 0.6627451, 0, 1, 1,
0.7603136, -0.4450116, 3.887074, 0.6666667, 0, 1, 1,
0.7645406, 0.1339234, 0.5860976, 0.6745098, 0, 1, 1,
0.7686906, 0.9173962, 0.5436864, 0.6784314, 0, 1, 1,
0.7714645, -1.548676, 3.105068, 0.6862745, 0, 1, 1,
0.7717471, -1.293438, 4.413053, 0.6901961, 0, 1, 1,
0.7718903, 0.2355417, 1.774545, 0.6980392, 0, 1, 1,
0.7723216, -1.37141, 2.518534, 0.7058824, 0, 1, 1,
0.7734082, -1.509437, 4.278373, 0.7098039, 0, 1, 1,
0.7758911, -1.208322, 4.873653, 0.7176471, 0, 1, 1,
0.7847678, -0.9908771, 3.316175, 0.7215686, 0, 1, 1,
0.7849171, 0.5349233, 2.441443, 0.7294118, 0, 1, 1,
0.7936381, -0.5936198, 0.8316445, 0.7333333, 0, 1, 1,
0.7981834, 0.4886563, 2.160808, 0.7411765, 0, 1, 1,
0.7999033, -0.1713436, 2.058947, 0.7450981, 0, 1, 1,
0.7999449, -1.448255, 2.340919, 0.7529412, 0, 1, 1,
0.8005854, 1.248659, 0.5973493, 0.7568628, 0, 1, 1,
0.8045005, -2.141937, 2.752251, 0.7647059, 0, 1, 1,
0.8144954, -1.200223, 1.095672, 0.7686275, 0, 1, 1,
0.8191202, 0.501129, 1.851511, 0.7764706, 0, 1, 1,
0.8226607, -0.8487518, 1.982321, 0.7803922, 0, 1, 1,
0.8354992, -0.4539142, 1.60335, 0.7882353, 0, 1, 1,
0.8482407, -0.6015211, 1.759014, 0.7921569, 0, 1, 1,
0.84845, 0.6837855, 1.575218, 0.8, 0, 1, 1,
0.849206, -0.5455487, 2.471711, 0.8078431, 0, 1, 1,
0.8554212, -1.725901, 2.209602, 0.8117647, 0, 1, 1,
0.8709398, -0.6471601, 2.682055, 0.8196079, 0, 1, 1,
0.874579, -0.9397983, 1.299399, 0.8235294, 0, 1, 1,
0.8749999, -0.6010703, 1.712317, 0.8313726, 0, 1, 1,
0.8778527, -1.941432, 2.479502, 0.8352941, 0, 1, 1,
0.8793412, -1.633281, 2.622253, 0.8431373, 0, 1, 1,
0.8798006, -1.908876, 3.253408, 0.8470588, 0, 1, 1,
0.8838649, -1.247781, 1.830772, 0.854902, 0, 1, 1,
0.8843062, 0.02121672, 0.9355771, 0.8588235, 0, 1, 1,
0.8902231, 0.09919701, 1.797652, 0.8666667, 0, 1, 1,
0.9026508, -0.5840988, 2.486082, 0.8705882, 0, 1, 1,
0.9071617, -1.716162, 2.855504, 0.8784314, 0, 1, 1,
0.9121559, 0.8901522, -0.5740656, 0.8823529, 0, 1, 1,
0.9129884, 0.6060308, 1.043924, 0.8901961, 0, 1, 1,
0.9130207, 0.7499772, 0.4325381, 0.8941177, 0, 1, 1,
0.9134757, -0.07331397, 0.7031764, 0.9019608, 0, 1, 1,
0.9147259, -0.921621, 2.520334, 0.9098039, 0, 1, 1,
0.9188378, 0.03769889, 1.213706, 0.9137255, 0, 1, 1,
0.9238486, 0.2517486, 1.313701, 0.9215686, 0, 1, 1,
0.9277123, 0.926654, 3.280723, 0.9254902, 0, 1, 1,
0.9280394, 0.8952181, -0.2740159, 0.9333333, 0, 1, 1,
0.9284592, 0.637221, 2.85811, 0.9372549, 0, 1, 1,
0.9325906, 0.473192, 2.448398, 0.945098, 0, 1, 1,
0.9382381, 0.4337844, 1.636961, 0.9490196, 0, 1, 1,
0.954179, -0.05737143, 3.211673, 0.9568627, 0, 1, 1,
0.9611195, -0.6240401, 3.464004, 0.9607843, 0, 1, 1,
0.9682347, 1.537895, 1.411866, 0.9686275, 0, 1, 1,
0.9682924, -0.1549401, 2.69879, 0.972549, 0, 1, 1,
0.975342, 1.548939, 2.288956, 0.9803922, 0, 1, 1,
0.9807559, -0.5041099, 1.886128, 0.9843137, 0, 1, 1,
0.9864004, 1.343171, 0.7028513, 0.9921569, 0, 1, 1,
0.9873805, 0.09331701, 1.376563, 0.9960784, 0, 1, 1,
0.9888653, -0.3483045, 2.237074, 1, 0, 0.9960784, 1,
0.9907465, -0.05798511, 0.6948122, 1, 0, 0.9882353, 1,
0.9969346, 1.183215, 1.542594, 1, 0, 0.9843137, 1,
1.002292, -0.1378544, 3.541466, 1, 0, 0.9764706, 1,
1.002842, -0.8552541, 4.085748, 1, 0, 0.972549, 1,
1.005374, -0.1636953, 3.467378, 1, 0, 0.9647059, 1,
1.005562, -0.4135643, 3.227032, 1, 0, 0.9607843, 1,
1.006301, -0.5732919, 1.460665, 1, 0, 0.9529412, 1,
1.006535, -0.2605084, 2.123298, 1, 0, 0.9490196, 1,
1.020493, 0.02712609, -0.1523319, 1, 0, 0.9411765, 1,
1.023176, 0.4991933, 1.475113, 1, 0, 0.9372549, 1,
1.026432, 0.5911775, 1.054529, 1, 0, 0.9294118, 1,
1.026558, -0.4037146, 1.075951, 1, 0, 0.9254902, 1,
1.02702, -0.930622, 3.000179, 1, 0, 0.9176471, 1,
1.029309, 0.5512248, -1.564121, 1, 0, 0.9137255, 1,
1.035242, 0.09099533, 3.128112, 1, 0, 0.9058824, 1,
1.036443, 0.8000017, -0.4745148, 1, 0, 0.9019608, 1,
1.044104, -0.9658307, 2.712856, 1, 0, 0.8941177, 1,
1.054916, -0.4532069, 3.068692, 1, 0, 0.8862745, 1,
1.055066, -1.802126, 3.169678, 1, 0, 0.8823529, 1,
1.057804, -0.2372293, 1.34856, 1, 0, 0.8745098, 1,
1.063156, -3.073302, 1.384843, 1, 0, 0.8705882, 1,
1.063454, -0.6426218, 2.049206, 1, 0, 0.8627451, 1,
1.065698, 0.006412349, 3.052804, 1, 0, 0.8588235, 1,
1.067926, -0.4898892, 3.297788, 1, 0, 0.8509804, 1,
1.068281, -1.129622, 2.8316, 1, 0, 0.8470588, 1,
1.070887, -1.408025, 0.4805498, 1, 0, 0.8392157, 1,
1.071465, -1.563495, 0.6429256, 1, 0, 0.8352941, 1,
1.080574, 0.1310831, 2.066525, 1, 0, 0.827451, 1,
1.085118, 1.199268, 1.763209, 1, 0, 0.8235294, 1,
1.086901, 0.3460954, -0.3548316, 1, 0, 0.8156863, 1,
1.088885, 0.2019691, 2.912128, 1, 0, 0.8117647, 1,
1.090033, 0.05111981, 1.12122, 1, 0, 0.8039216, 1,
1.099053, -0.8170125, 3.988661, 1, 0, 0.7960784, 1,
1.102004, 1.569779, 0.8957552, 1, 0, 0.7921569, 1,
1.104685, 0.7445962, -0.1973258, 1, 0, 0.7843137, 1,
1.105125, -0.7855534, 2.685961, 1, 0, 0.7803922, 1,
1.108345, -1.095838, 3.499022, 1, 0, 0.772549, 1,
1.111252, 0.9719782, 0.8560871, 1, 0, 0.7686275, 1,
1.125692, 1.38327, 1.059116, 1, 0, 0.7607843, 1,
1.149896, -1.018929, 1.913304, 1, 0, 0.7568628, 1,
1.153195, 0.9518797, -1.061282, 1, 0, 0.7490196, 1,
1.154106, 0.9089087, 1.200111, 1, 0, 0.7450981, 1,
1.162611, -0.01690437, 2.290018, 1, 0, 0.7372549, 1,
1.164003, 0.2370189, 1.155438, 1, 0, 0.7333333, 1,
1.167726, 0.6632124, 0.725722, 1, 0, 0.7254902, 1,
1.171882, -0.4095896, 2.71424, 1, 0, 0.7215686, 1,
1.173089, -0.5849615, 2.768261, 1, 0, 0.7137255, 1,
1.174122, -0.8173491, 2.578369, 1, 0, 0.7098039, 1,
1.178853, -1.193537, 3.635896, 1, 0, 0.7019608, 1,
1.184891, -1.845293, 3.624357, 1, 0, 0.6941177, 1,
1.19163, 0.8964198, 1.003003, 1, 0, 0.6901961, 1,
1.194187, -1.553854, 2.517601, 1, 0, 0.682353, 1,
1.197766, 0.3270863, -0.09228646, 1, 0, 0.6784314, 1,
1.205776, -0.02855196, 2.187954, 1, 0, 0.6705883, 1,
1.207307, -0.3793975, 2.316214, 1, 0, 0.6666667, 1,
1.214607, -0.5521169, 2.405644, 1, 0, 0.6588235, 1,
1.218289, -1.214271, 3.586101, 1, 0, 0.654902, 1,
1.221626, -0.5441004, 3.480344, 1, 0, 0.6470588, 1,
1.224034, 1.755992, 0.4345148, 1, 0, 0.6431373, 1,
1.224236, 1.036418, 1.654868, 1, 0, 0.6352941, 1,
1.227729, 0.5931343, -0.4220707, 1, 0, 0.6313726, 1,
1.272763, -0.09377798, 2.942502, 1, 0, 0.6235294, 1,
1.27353, 0.01156502, 0.7385129, 1, 0, 0.6196079, 1,
1.281289, -0.09156363, 0.3386513, 1, 0, 0.6117647, 1,
1.299789, -1.423715, 2.288378, 1, 0, 0.6078432, 1,
1.301754, 0.08219372, 1.183288, 1, 0, 0.6, 1,
1.303825, -1.945191, 2.257126, 1, 0, 0.5921569, 1,
1.307326, 0.3168434, 0.3565157, 1, 0, 0.5882353, 1,
1.308287, -0.4511308, 3.059783, 1, 0, 0.5803922, 1,
1.316226, 0.4834399, 0.6673853, 1, 0, 0.5764706, 1,
1.316523, 0.09384097, -0.1586249, 1, 0, 0.5686275, 1,
1.318064, -0.08641132, 1.975188, 1, 0, 0.5647059, 1,
1.320676, -1.23359, 2.459968, 1, 0, 0.5568628, 1,
1.321303, -1.070099, 1.892261, 1, 0, 0.5529412, 1,
1.325929, 0.7736808, 0.4296368, 1, 0, 0.5450981, 1,
1.329082, 0.615784, 4.194343, 1, 0, 0.5411765, 1,
1.332028, 1.209173, 0.1506867, 1, 0, 0.5333334, 1,
1.332134, -0.6302184, 1.690116, 1, 0, 0.5294118, 1,
1.354868, 0.6153574, 2.718975, 1, 0, 0.5215687, 1,
1.360473, 0.3625467, 1.658876, 1, 0, 0.5176471, 1,
1.363067, 0.9868986, 0.6126263, 1, 0, 0.509804, 1,
1.376411, 0.2952581, 1.474818, 1, 0, 0.5058824, 1,
1.378673, 0.1859188, 2.17479, 1, 0, 0.4980392, 1,
1.393113, -1.133734, 3.117508, 1, 0, 0.4901961, 1,
1.402565, -1.251908, 1.363598, 1, 0, 0.4862745, 1,
1.403427, 0.06048741, 0.6927888, 1, 0, 0.4784314, 1,
1.406126, -0.958566, 1.224235, 1, 0, 0.4745098, 1,
1.40837, 1.497696, 0.7927563, 1, 0, 0.4666667, 1,
1.420234, -1.232568, 1.007289, 1, 0, 0.4627451, 1,
1.432439, -0.3963201, 1.226025, 1, 0, 0.454902, 1,
1.435577, 0.3091154, 1.309248, 1, 0, 0.4509804, 1,
1.455535, 0.2214354, 0.9054076, 1, 0, 0.4431373, 1,
1.455795, -0.6609086, 2.270864, 1, 0, 0.4392157, 1,
1.46787, -0.2854939, 2.020602, 1, 0, 0.4313726, 1,
1.479185, -0.1351442, 1.457093, 1, 0, 0.427451, 1,
1.483516, -0.116327, -0.3620676, 1, 0, 0.4196078, 1,
1.501811, -0.5050845, -0.9389596, 1, 0, 0.4156863, 1,
1.506794, -0.6902274, 0.5845432, 1, 0, 0.4078431, 1,
1.5312, -0.1467158, 1.052756, 1, 0, 0.4039216, 1,
1.536495, -0.6564781, 1.290124, 1, 0, 0.3960784, 1,
1.538996, -1.411664, 4.382138, 1, 0, 0.3882353, 1,
1.539366, 0.5264766, 2.050497, 1, 0, 0.3843137, 1,
1.543186, -1.075314, 2.112898, 1, 0, 0.3764706, 1,
1.549208, 0.6458049, 0.9456753, 1, 0, 0.372549, 1,
1.553168, -0.9236085, 2.525721, 1, 0, 0.3647059, 1,
1.580524, 0.42789, 1.430961, 1, 0, 0.3607843, 1,
1.582955, -0.8075511, 1.641926, 1, 0, 0.3529412, 1,
1.601935, -0.3080695, 1.650449, 1, 0, 0.3490196, 1,
1.62086, 0.2501911, 2.250946, 1, 0, 0.3411765, 1,
1.653465, -0.4493042, 1.914817, 1, 0, 0.3372549, 1,
1.655146, -0.04790153, 0.8640926, 1, 0, 0.3294118, 1,
1.65832, -0.3359036, 1.395148, 1, 0, 0.3254902, 1,
1.662269, 0.9268307, 1.845011, 1, 0, 0.3176471, 1,
1.673047, 0.6594867, 3.436141, 1, 0, 0.3137255, 1,
1.682371, -1.950293, 2.276781, 1, 0, 0.3058824, 1,
1.699068, -0.05387834, 0.9835523, 1, 0, 0.2980392, 1,
1.707605, -2.361816, 3.243453, 1, 0, 0.2941177, 1,
1.72097, 0.5818925, 0.8787175, 1, 0, 0.2862745, 1,
1.724698, -1.302473, 2.262283, 1, 0, 0.282353, 1,
1.72536, 0.4509297, 1.271554, 1, 0, 0.2745098, 1,
1.736851, 0.134496, 0.6845921, 1, 0, 0.2705882, 1,
1.73895, 0.891889, 0.8250291, 1, 0, 0.2627451, 1,
1.748676, -0.5137367, 2.766667, 1, 0, 0.2588235, 1,
1.756832, -0.4689784, 0.3128603, 1, 0, 0.2509804, 1,
1.762743, -0.0292204, 2.371172, 1, 0, 0.2470588, 1,
1.763559, 0.3506641, 2.94303, 1, 0, 0.2392157, 1,
1.765677, 1.663221, -0.5451468, 1, 0, 0.2352941, 1,
1.776444, 0.5899261, 0.3104739, 1, 0, 0.227451, 1,
1.77744, 0.2175759, 2.386324, 1, 0, 0.2235294, 1,
1.78552, 0.4354958, 0.1293574, 1, 0, 0.2156863, 1,
1.797436, -0.2482302, 3.318759, 1, 0, 0.2117647, 1,
1.799205, -0.04900753, 2.306583, 1, 0, 0.2039216, 1,
1.800335, 1.294893, 1.62949, 1, 0, 0.1960784, 1,
1.822567, -0.08016762, 1.832703, 1, 0, 0.1921569, 1,
1.833994, 0.8083807, 1.292097, 1, 0, 0.1843137, 1,
1.837333, -0.4185406, 2.264126, 1, 0, 0.1803922, 1,
1.847606, 1.032043, -0.6295117, 1, 0, 0.172549, 1,
1.861685, -0.6650676, 2.115892, 1, 0, 0.1686275, 1,
1.899855, -0.8523338, 2.454471, 1, 0, 0.1607843, 1,
1.915417, -0.09707607, 2.317862, 1, 0, 0.1568628, 1,
1.936455, -0.2511342, 2.711485, 1, 0, 0.1490196, 1,
1.941233, 0.1482353, 2.253867, 1, 0, 0.145098, 1,
1.969108, 0.05738378, 0.2280044, 1, 0, 0.1372549, 1,
2.009099, 0.3558236, 2.894195, 1, 0, 0.1333333, 1,
2.013435, -1.504958, 3.071746, 1, 0, 0.1254902, 1,
2.035126, -0.06524168, 2.193057, 1, 0, 0.1215686, 1,
2.056526, 0.1289149, 1.68086, 1, 0, 0.1137255, 1,
2.058347, -0.4896038, 2.381605, 1, 0, 0.1098039, 1,
2.100917, -0.3274978, 2.743112, 1, 0, 0.1019608, 1,
2.111691, 0.9567699, 3.360852, 1, 0, 0.09411765, 1,
2.148988, 1.163768, -0.7773404, 1, 0, 0.09019608, 1,
2.18876, -0.03505509, 2.366636, 1, 0, 0.08235294, 1,
2.20112, 0.6196923, -0.004627281, 1, 0, 0.07843138, 1,
2.204852, 0.3997375, -0.1025853, 1, 0, 0.07058824, 1,
2.266121, -0.2784746, 0.04777955, 1, 0, 0.06666667, 1,
2.27997, 0.6525486, 2.167356, 1, 0, 0.05882353, 1,
2.328933, 0.6884711, 1.157299, 1, 0, 0.05490196, 1,
2.385427, -1.570442, 1.175695, 1, 0, 0.04705882, 1,
2.50607, 0.5564691, 0.2562853, 1, 0, 0.04313726, 1,
2.533665, -0.3632112, 2.452902, 1, 0, 0.03529412, 1,
2.613049, -0.2086118, -0.04594008, 1, 0, 0.03137255, 1,
2.777552, -1.799707, 1.556908, 1, 0, 0.02352941, 1,
2.799203, -0.1369122, 2.180235, 1, 0, 0.01960784, 1,
2.917702, -1.188714, 2.418019, 1, 0, 0.01176471, 1,
4.061753, 0.5484886, 1.595659, 1, 0, 0.007843138, 1
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
0.08709073, -4.051984, -6.713542, 0, -0.5, 0.5, 0.5,
0.08709073, -4.051984, -6.713542, 1, -0.5, 0.5, 0.5,
0.08709073, -4.051984, -6.713542, 1, 1.5, 0.5, 0.5,
0.08709073, -4.051984, -6.713542, 0, 1.5, 0.5, 0.5
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
-5.234982, -0.1863352, -6.713542, 0, -0.5, 0.5, 0.5,
-5.234982, -0.1863352, -6.713542, 1, -0.5, 0.5, 0.5,
-5.234982, -0.1863352, -6.713542, 1, 1.5, 0.5, 0.5,
-5.234982, -0.1863352, -6.713542, 0, 1.5, 0.5, 0.5
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
-5.234982, -4.051984, 0.233707, 0, -0.5, 0.5, 0.5,
-5.234982, -4.051984, 0.233707, 1, -0.5, 0.5, 0.5,
-5.234982, -4.051984, 0.233707, 1, 1.5, 0.5, 0.5,
-5.234982, -4.051984, 0.233707, 0, 1.5, 0.5, 0.5
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
-2, -3.159911, -5.110331,
4, -3.159911, -5.110331,
-2, -3.159911, -5.110331,
-2, -3.30859, -5.377532,
0, -3.159911, -5.110331,
0, -3.30859, -5.377532,
2, -3.159911, -5.110331,
2, -3.30859, -5.377532,
4, -3.159911, -5.110331,
4, -3.30859, -5.377532
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
"2",
"4"
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
-2, -3.605947, -5.911936, 0, -0.5, 0.5, 0.5,
-2, -3.605947, -5.911936, 1, -0.5, 0.5, 0.5,
-2, -3.605947, -5.911936, 1, 1.5, 0.5, 0.5,
-2, -3.605947, -5.911936, 0, 1.5, 0.5, 0.5,
0, -3.605947, -5.911936, 0, -0.5, 0.5, 0.5,
0, -3.605947, -5.911936, 1, -0.5, 0.5, 0.5,
0, -3.605947, -5.911936, 1, 1.5, 0.5, 0.5,
0, -3.605947, -5.911936, 0, 1.5, 0.5, 0.5,
2, -3.605947, -5.911936, 0, -0.5, 0.5, 0.5,
2, -3.605947, -5.911936, 1, -0.5, 0.5, 0.5,
2, -3.605947, -5.911936, 1, 1.5, 0.5, 0.5,
2, -3.605947, -5.911936, 0, 1.5, 0.5, 0.5,
4, -3.605947, -5.911936, 0, -0.5, 0.5, 0.5,
4, -3.605947, -5.911936, 1, -0.5, 0.5, 0.5,
4, -3.605947, -5.911936, 1, 1.5, 0.5, 0.5,
4, -3.605947, -5.911936, 0, 1.5, 0.5, 0.5
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
-4.006811, -3, -5.110331,
-4.006811, 2, -5.110331,
-4.006811, -3, -5.110331,
-4.211506, -3, -5.377532,
-4.006811, -2, -5.110331,
-4.211506, -2, -5.377532,
-4.006811, -1, -5.110331,
-4.211506, -1, -5.377532,
-4.006811, 0, -5.110331,
-4.211506, 0, -5.377532,
-4.006811, 1, -5.110331,
-4.211506, 1, -5.377532,
-4.006811, 2, -5.110331,
-4.211506, 2, -5.377532
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
-4.620896, -3, -5.911936, 0, -0.5, 0.5, 0.5,
-4.620896, -3, -5.911936, 1, -0.5, 0.5, 0.5,
-4.620896, -3, -5.911936, 1, 1.5, 0.5, 0.5,
-4.620896, -3, -5.911936, 0, 1.5, 0.5, 0.5,
-4.620896, -2, -5.911936, 0, -0.5, 0.5, 0.5,
-4.620896, -2, -5.911936, 1, -0.5, 0.5, 0.5,
-4.620896, -2, -5.911936, 1, 1.5, 0.5, 0.5,
-4.620896, -2, -5.911936, 0, 1.5, 0.5, 0.5,
-4.620896, -1, -5.911936, 0, -0.5, 0.5, 0.5,
-4.620896, -1, -5.911936, 1, -0.5, 0.5, 0.5,
-4.620896, -1, -5.911936, 1, 1.5, 0.5, 0.5,
-4.620896, -1, -5.911936, 0, 1.5, 0.5, 0.5,
-4.620896, 0, -5.911936, 0, -0.5, 0.5, 0.5,
-4.620896, 0, -5.911936, 1, -0.5, 0.5, 0.5,
-4.620896, 0, -5.911936, 1, 1.5, 0.5, 0.5,
-4.620896, 0, -5.911936, 0, 1.5, 0.5, 0.5,
-4.620896, 1, -5.911936, 0, -0.5, 0.5, 0.5,
-4.620896, 1, -5.911936, 1, -0.5, 0.5, 0.5,
-4.620896, 1, -5.911936, 1, 1.5, 0.5, 0.5,
-4.620896, 1, -5.911936, 0, 1.5, 0.5, 0.5,
-4.620896, 2, -5.911936, 0, -0.5, 0.5, 0.5,
-4.620896, 2, -5.911936, 1, -0.5, 0.5, 0.5,
-4.620896, 2, -5.911936, 1, 1.5, 0.5, 0.5,
-4.620896, 2, -5.911936, 0, 1.5, 0.5, 0.5
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
-4.006811, -3.159911, -4,
-4.006811, -3.159911, 4,
-4.006811, -3.159911, -4,
-4.211506, -3.30859, -4,
-4.006811, -3.159911, -2,
-4.211506, -3.30859, -2,
-4.006811, -3.159911, 0,
-4.211506, -3.30859, 0,
-4.006811, -3.159911, 2,
-4.211506, -3.30859, 2,
-4.006811, -3.159911, 4,
-4.211506, -3.30859, 4
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
-4.620896, -3.605947, -4, 0, -0.5, 0.5, 0.5,
-4.620896, -3.605947, -4, 1, -0.5, 0.5, 0.5,
-4.620896, -3.605947, -4, 1, 1.5, 0.5, 0.5,
-4.620896, -3.605947, -4, 0, 1.5, 0.5, 0.5,
-4.620896, -3.605947, -2, 0, -0.5, 0.5, 0.5,
-4.620896, -3.605947, -2, 1, -0.5, 0.5, 0.5,
-4.620896, -3.605947, -2, 1, 1.5, 0.5, 0.5,
-4.620896, -3.605947, -2, 0, 1.5, 0.5, 0.5,
-4.620896, -3.605947, 0, 0, -0.5, 0.5, 0.5,
-4.620896, -3.605947, 0, 1, -0.5, 0.5, 0.5,
-4.620896, -3.605947, 0, 1, 1.5, 0.5, 0.5,
-4.620896, -3.605947, 0, 0, 1.5, 0.5, 0.5,
-4.620896, -3.605947, 2, 0, -0.5, 0.5, 0.5,
-4.620896, -3.605947, 2, 1, -0.5, 0.5, 0.5,
-4.620896, -3.605947, 2, 1, 1.5, 0.5, 0.5,
-4.620896, -3.605947, 2, 0, 1.5, 0.5, 0.5,
-4.620896, -3.605947, 4, 0, -0.5, 0.5, 0.5,
-4.620896, -3.605947, 4, 1, -0.5, 0.5, 0.5,
-4.620896, -3.605947, 4, 1, 1.5, 0.5, 0.5,
-4.620896, -3.605947, 4, 0, 1.5, 0.5, 0.5
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
-4.006811, -3.159911, -5.110331,
-4.006811, 2.787241, -5.110331,
-4.006811, -3.159911, 5.577744,
-4.006811, 2.787241, 5.577744,
-4.006811, -3.159911, -5.110331,
-4.006811, -3.159911, 5.577744,
-4.006811, 2.787241, -5.110331,
-4.006811, 2.787241, 5.577744,
-4.006811, -3.159911, -5.110331,
4.180993, -3.159911, -5.110331,
-4.006811, -3.159911, 5.577744,
4.180993, -3.159911, 5.577744,
-4.006811, 2.787241, -5.110331,
4.180993, 2.787241, -5.110331,
-4.006811, 2.787241, 5.577744,
4.180993, 2.787241, 5.577744,
4.180993, -3.159911, -5.110331,
4.180993, 2.787241, -5.110331,
4.180993, -3.159911, 5.577744,
4.180993, 2.787241, 5.577744,
4.180993, -3.159911, -5.110331,
4.180993, -3.159911, 5.577744,
4.180993, 2.787241, -5.110331,
4.180993, 2.787241, 5.577744
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
var radius = 7.859565;
var distance = 34.96809;
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
mvMatrix.translate( -0.08709073, 0.1863352, -0.233707 );
mvMatrix.scale( 1.037875, 1.428905, 0.7950838 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.96809);
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
karvon<-read.table("karvon.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-karvon$V2
```

```
## Error in eval(expr, envir, enclos): object 'karvon' not found
```

```r
y<-karvon$V3
```

```
## Error in eval(expr, envir, enclos): object 'karvon' not found
```

```r
z<-karvon$V4
```

```
## Error in eval(expr, envir, enclos): object 'karvon' not found
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
-3.887571, -1.420653, -2.553164, 0, 0, 1, 1, 1,
-2.846889, -1.156426, -3.235692, 1, 0, 0, 1, 1,
-2.792727, 0.4160128, -0.7546216, 1, 0, 0, 1, 1,
-2.75505, 0.651944, -3.746629, 1, 0, 0, 1, 1,
-2.572938, -0.7571363, -0.1677978, 1, 0, 0, 1, 1,
-2.561017, 0.5146214, -0.9933245, 1, 0, 0, 1, 1,
-2.517164, -0.04589945, -1.3585, 0, 0, 0, 1, 1,
-2.508831, -1.090091, -2.345338, 0, 0, 0, 1, 1,
-2.495231, 0.6761769, -0.9093245, 0, 0, 0, 1, 1,
-2.486767, -0.784689, -2.622583, 0, 0, 0, 1, 1,
-2.344764, 0.4724722, -1.393393, 0, 0, 0, 1, 1,
-2.306869, 0.3370284, -1.133773, 0, 0, 0, 1, 1,
-2.283958, -0.5230157, -1.527655, 0, 0, 0, 1, 1,
-2.275199, -0.5365705, -0.5205464, 1, 1, 1, 1, 1,
-2.272096, 0.4860631, -2.069621, 1, 1, 1, 1, 1,
-2.244125, -0.8656, -2.008646, 1, 1, 1, 1, 1,
-2.178026, -0.8074424, -1.60348, 1, 1, 1, 1, 1,
-2.170042, 1.389526, -0.3593006, 1, 1, 1, 1, 1,
-2.16256, 0.2932681, -0.98321, 1, 1, 1, 1, 1,
-2.147975, -0.8884497, -0.9768982, 1, 1, 1, 1, 1,
-2.137136, 1.36374, -0.3462561, 1, 1, 1, 1, 1,
-2.135185, 0.4079624, -2.178645, 1, 1, 1, 1, 1,
-2.127275, 0.37708, -1.463445, 1, 1, 1, 1, 1,
-2.113098, 0.9429406, -0.6435948, 1, 1, 1, 1, 1,
-2.067895, 1.196543, -2.590964, 1, 1, 1, 1, 1,
-2.040961, -0.3795726, -3.450616, 1, 1, 1, 1, 1,
-2.021015, -0.7587328, -1.821231, 1, 1, 1, 1, 1,
-1.998296, 0.3060058, 0.4940291, 1, 1, 1, 1, 1,
-1.987083, 0.7198907, 0.7095324, 0, 0, 1, 1, 1,
-1.9747, 1.229717, 0.4458881, 1, 0, 0, 1, 1,
-1.951864, -1.640374, -2.0073, 1, 0, 0, 1, 1,
-1.944798, -1.459196, -3.265703, 1, 0, 0, 1, 1,
-1.938132, -0.8320243, -2.560297, 1, 0, 0, 1, 1,
-1.913578, 0.7587165, -1.333085, 1, 0, 0, 1, 1,
-1.893093, -0.7169176, -1.031269, 0, 0, 0, 1, 1,
-1.862471, 0.2223219, -0.993224, 0, 0, 0, 1, 1,
-1.858536, -0.7018066, -1.974468, 0, 0, 0, 1, 1,
-1.808191, 0.3245896, -1.858105, 0, 0, 0, 1, 1,
-1.769691, -2.214231, -1.497624, 0, 0, 0, 1, 1,
-1.756683, 0.5454733, -1.981558, 0, 0, 0, 1, 1,
-1.727291, 1.337428, -1.00488, 0, 0, 0, 1, 1,
-1.668506, 0.09519683, -1.521459, 1, 1, 1, 1, 1,
-1.642513, 0.7067975, -1.379326, 1, 1, 1, 1, 1,
-1.633567, 0.7726876, -1.615557, 1, 1, 1, 1, 1,
-1.632144, 0.9951414, -2.166564, 1, 1, 1, 1, 1,
-1.62887, -0.3881965, -2.772337, 1, 1, 1, 1, 1,
-1.628484, -0.8302985, -2.436972, 1, 1, 1, 1, 1,
-1.613809, -0.8213322, -2.326195, 1, 1, 1, 1, 1,
-1.613788, 0.6126313, -1.530686, 1, 1, 1, 1, 1,
-1.606612, -0.3693206, -2.710524, 1, 1, 1, 1, 1,
-1.605061, 0.7279028, -2.226288, 1, 1, 1, 1, 1,
-1.60151, -0.9667795, -0.766664, 1, 1, 1, 1, 1,
-1.598684, 1.773699, -2.875257, 1, 1, 1, 1, 1,
-1.558755, 0.6324407, -1.776359, 1, 1, 1, 1, 1,
-1.546093, -2.016811, -1.961646, 1, 1, 1, 1, 1,
-1.51805, -0.04550529, -1.825459, 1, 1, 1, 1, 1,
-1.517229, 0.0838168, -0.6817813, 0, 0, 1, 1, 1,
-1.515537, 2.627326, -1.768894, 1, 0, 0, 1, 1,
-1.513577, -0.6825898, -2.072998, 1, 0, 0, 1, 1,
-1.49987, -0.1785829, -1.428099, 1, 0, 0, 1, 1,
-1.478952, 0.2176994, -1.133474, 1, 0, 0, 1, 1,
-1.465543, -0.08455009, -1.112855, 1, 0, 0, 1, 1,
-1.464535, 0.02063894, -1.790331, 0, 0, 0, 1, 1,
-1.459546, -1.803722, -3.4094, 0, 0, 0, 1, 1,
-1.455605, 0.9180092, -0.9227899, 0, 0, 0, 1, 1,
-1.45495, -0.1966583, -0.7818761, 0, 0, 0, 1, 1,
-1.453524, -0.1447338, -3.373018, 0, 0, 0, 1, 1,
-1.445619, 0.1864012, -3.757136, 0, 0, 0, 1, 1,
-1.409907, 0.8449088, -1.651847, 0, 0, 0, 1, 1,
-1.403906, 1.268046, -1.158192, 1, 1, 1, 1, 1,
-1.399308, 0.9759322, -0.8823264, 1, 1, 1, 1, 1,
-1.375839, -0.2715995, -1.166794, 1, 1, 1, 1, 1,
-1.374218, 1.40407, -2.245372, 1, 1, 1, 1, 1,
-1.370734, 1.522291, -0.06055863, 1, 1, 1, 1, 1,
-1.365274, 0.3672827, -0.8431474, 1, 1, 1, 1, 1,
-1.359698, -0.9097094, -0.9579211, 1, 1, 1, 1, 1,
-1.352111, 1.810924, -1.745903, 1, 1, 1, 1, 1,
-1.351979, -1.228234, -1.898657, 1, 1, 1, 1, 1,
-1.350386, -0.07883818, -0.138737, 1, 1, 1, 1, 1,
-1.348591, -0.0795278, -0.2403916, 1, 1, 1, 1, 1,
-1.347975, -0.4925925, -2.156245, 1, 1, 1, 1, 1,
-1.34788, 0.8006502, 0.660655, 1, 1, 1, 1, 1,
-1.347521, 0.1343973, -3.000151, 1, 1, 1, 1, 1,
-1.342214, 0.004321129, -0.7204311, 1, 1, 1, 1, 1,
-1.338571, 0.6420604, -2.830257, 0, 0, 1, 1, 1,
-1.335462, 0.1167542, -0.7991088, 1, 0, 0, 1, 1,
-1.334163, -1.141807, -2.696562, 1, 0, 0, 1, 1,
-1.330905, 1.565763, -0.6391001, 1, 0, 0, 1, 1,
-1.328944, -0.6131046, -2.448029, 1, 0, 0, 1, 1,
-1.322834, -0.9599102, -2.326262, 1, 0, 0, 1, 1,
-1.299021, 0.9299557, -2.505217, 0, 0, 0, 1, 1,
-1.285935, 1.584845, 0.4260749, 0, 0, 0, 1, 1,
-1.275303, 0.2484311, -1.514137, 0, 0, 0, 1, 1,
-1.266261, -0.2731342, -1.200194, 0, 0, 0, 1, 1,
-1.264652, 1.24134, -2.301059, 0, 0, 0, 1, 1,
-1.262808, -0.7350252, -3.719513, 0, 0, 0, 1, 1,
-1.261953, -1.137726, -0.337194, 0, 0, 0, 1, 1,
-1.260598, 1.185818, 0.785168, 1, 1, 1, 1, 1,
-1.259352, -1.220418, -2.510613, 1, 1, 1, 1, 1,
-1.254585, -0.4463623, -1.186125, 1, 1, 1, 1, 1,
-1.251352, -1.209521, -3.305714, 1, 1, 1, 1, 1,
-1.249289, 0.7940284, -0.3815829, 1, 1, 1, 1, 1,
-1.248834, 0.6540231, -1.021039, 1, 1, 1, 1, 1,
-1.24369, 1.991936, -0.9775934, 1, 1, 1, 1, 1,
-1.242642, 1.312062, -0.9909986, 1, 1, 1, 1, 1,
-1.236422, -0.238368, -0.4239992, 1, 1, 1, 1, 1,
-1.219219, -0.1103727, -1.01186, 1, 1, 1, 1, 1,
-1.214531, -1.229918, -2.017776, 1, 1, 1, 1, 1,
-1.210013, 0.3404544, -1.187146, 1, 1, 1, 1, 1,
-1.188457, 0.9770626, -0.3242591, 1, 1, 1, 1, 1,
-1.184789, 0.3546961, -1.770432, 1, 1, 1, 1, 1,
-1.183746, 0.191941, -2.004636, 1, 1, 1, 1, 1,
-1.183332, 0.02647268, -1.157177, 0, 0, 1, 1, 1,
-1.174468, 0.2782244, -0.2232366, 1, 0, 0, 1, 1,
-1.17205, 0.7486054, -0.6899309, 1, 0, 0, 1, 1,
-1.170038, 0.06837234, -3.518943, 1, 0, 0, 1, 1,
-1.161941, -2.017241, -1.021312, 1, 0, 0, 1, 1,
-1.158969, 0.05680989, -3.300772, 1, 0, 0, 1, 1,
-1.151477, 0.08785256, -0.4253007, 0, 0, 0, 1, 1,
-1.150957, -0.8349132, -1.449906, 0, 0, 0, 1, 1,
-1.12922, -0.3144858, -1.937134, 0, 0, 0, 1, 1,
-1.129174, -0.4583051, -2.118135, 0, 0, 0, 1, 1,
-1.128207, -0.1414849, -2.858333, 0, 0, 0, 1, 1,
-1.128164, 0.1997008, -1.776871, 0, 0, 0, 1, 1,
-1.126352, -0.4418178, -4.026835, 0, 0, 0, 1, 1,
-1.119886, -0.06383519, -1.220703, 1, 1, 1, 1, 1,
-1.118341, -0.4694347, -1.433418, 1, 1, 1, 1, 1,
-1.11792, -1.203484, -2.2083, 1, 1, 1, 1, 1,
-1.117013, -0.05059666, -0.8585841, 1, 1, 1, 1, 1,
-1.108195, 0.1960111, -3.174461, 1, 1, 1, 1, 1,
-1.106596, -0.7051603, -1.200457, 1, 1, 1, 1, 1,
-1.096898, 2.354864, -1.06745, 1, 1, 1, 1, 1,
-1.095331, -0.8247401, -0.5464116, 1, 1, 1, 1, 1,
-1.088497, -0.206771, -3.055554, 1, 1, 1, 1, 1,
-1.083743, -0.01428372, -2.30202, 1, 1, 1, 1, 1,
-1.075123, -0.4985611, 0.5046242, 1, 1, 1, 1, 1,
-1.069157, 0.1883823, -1.18734, 1, 1, 1, 1, 1,
-1.062142, 0.5329666, -0.8566936, 1, 1, 1, 1, 1,
-1.060892, 0.3500895, -1.70089, 1, 1, 1, 1, 1,
-1.060521, 0.9339795, -1.167517, 1, 1, 1, 1, 1,
-1.055868, -1.042665, -1.729771, 0, 0, 1, 1, 1,
-1.054815, 0.4920186, -0.9025487, 1, 0, 0, 1, 1,
-1.054139, -0.8717977, -2.273484, 1, 0, 0, 1, 1,
-1.053897, -1.203761, -3.643903, 1, 0, 0, 1, 1,
-1.049256, 0.1890783, -0.6863271, 1, 0, 0, 1, 1,
-1.048793, -0.793568, -2.73953, 1, 0, 0, 1, 1,
-1.04499, 0.08994383, -1.095666, 0, 0, 0, 1, 1,
-1.044506, -0.2037155, -3.010962, 0, 0, 0, 1, 1,
-1.040167, -1.242817, -2.252154, 0, 0, 0, 1, 1,
-1.03714, 1.268002, -0.7015017, 0, 0, 0, 1, 1,
-1.034502, -1.582331, -3.993846, 0, 0, 0, 1, 1,
-1.021523, 1.091368, -3.079805, 0, 0, 0, 1, 1,
-1.012233, 0.6728131, -0.6508, 0, 0, 0, 1, 1,
-1.011608, 0.5363911, -0.1957866, 1, 1, 1, 1, 1,
-0.9999795, 0.1068992, -1.319446, 1, 1, 1, 1, 1,
-0.9934654, -0.3090969, -1.08794, 1, 1, 1, 1, 1,
-0.9928271, 0.06702507, -2.132886, 1, 1, 1, 1, 1,
-0.9925694, 0.2259513, -2.051204, 1, 1, 1, 1, 1,
-0.9898968, -0.3185472, -2.036495, 1, 1, 1, 1, 1,
-0.9896873, -1.187617, -3.435695, 1, 1, 1, 1, 1,
-0.9875205, 1.391469, 0.07525788, 1, 1, 1, 1, 1,
-0.9872026, 0.5234755, -1.470506, 1, 1, 1, 1, 1,
-0.9859574, 1.330774, 0.8415105, 1, 1, 1, 1, 1,
-0.9839705, -0.5386429, -3.777888, 1, 1, 1, 1, 1,
-0.9820716, -0.6988351, -2.301537, 1, 1, 1, 1, 1,
-0.979931, 1.637504, -0.984098, 1, 1, 1, 1, 1,
-0.9686046, 0.5135978, -1.674757, 1, 1, 1, 1, 1,
-0.9614211, -0.6880631, -1.026694, 1, 1, 1, 1, 1,
-0.958061, 0.6664227, 1.024343, 0, 0, 1, 1, 1,
-0.9525164, 0.1012051, -0.9890757, 1, 0, 0, 1, 1,
-0.9523088, -0.4801874, -0.5124744, 1, 0, 0, 1, 1,
-0.9513795, -0.1833979, -0.6230332, 1, 0, 0, 1, 1,
-0.9492761, 0.4621754, 0.1278819, 1, 0, 0, 1, 1,
-0.9465663, -1.813104, -3.514707, 1, 0, 0, 1, 1,
-0.9459358, -0.09163986, -2.091339, 0, 0, 0, 1, 1,
-0.9420054, -0.07349924, -2.905239, 0, 0, 0, 1, 1,
-0.9338273, 0.1045042, 1.076713, 0, 0, 0, 1, 1,
-0.9319211, 1.781044, -1.285958, 0, 0, 0, 1, 1,
-0.9275432, -0.6876696, -1.611444, 0, 0, 0, 1, 1,
-0.9273835, -0.1228423, -1.825545, 0, 0, 0, 1, 1,
-0.9248704, 1.435474, -0.6930211, 0, 0, 0, 1, 1,
-0.9242885, -0.5267012, -0.5254348, 1, 1, 1, 1, 1,
-0.9191509, 0.1115123, 0.0533343, 1, 1, 1, 1, 1,
-0.9144341, 0.2317924, -1.069449, 1, 1, 1, 1, 1,
-0.9137588, 0.6057512, -2.516058, 1, 1, 1, 1, 1,
-0.9126119, -0.7571018, -1.085532, 1, 1, 1, 1, 1,
-0.9108122, -0.1452464, 0.03920569, 1, 1, 1, 1, 1,
-0.9108015, -1.622182, -1.490149, 1, 1, 1, 1, 1,
-0.905973, -0.4380667, -3.127318, 1, 1, 1, 1, 1,
-0.9043148, 2.388079, -1.079653, 1, 1, 1, 1, 1,
-0.9038442, 0.4725382, -0.661613, 1, 1, 1, 1, 1,
-0.8982701, 2.700632, 0.1613601, 1, 1, 1, 1, 1,
-0.8960423, 0.4376053, -2.650149, 1, 1, 1, 1, 1,
-0.8956504, 0.7307796, -0.651446, 1, 1, 1, 1, 1,
-0.8953334, 0.6435987, 0.3910567, 1, 1, 1, 1, 1,
-0.8932731, -1.727753, -2.377784, 1, 1, 1, 1, 1,
-0.8911989, -0.6852881, -1.972428, 0, 0, 1, 1, 1,
-0.8892041, 0.4458688, -0.330622, 1, 0, 0, 1, 1,
-0.8878528, 1.688085, -1.558478, 1, 0, 0, 1, 1,
-0.881859, 0.5934725, -2.101594, 1, 0, 0, 1, 1,
-0.8817633, 2.078237, -0.7124073, 1, 0, 0, 1, 1,
-0.8807645, 0.5982341, -0.9395546, 1, 0, 0, 1, 1,
-0.8749356, 1.366494, -1.68877, 0, 0, 0, 1, 1,
-0.8746167, -0.009685867, -0.9152283, 0, 0, 0, 1, 1,
-0.8713303, 0.04455232, -1.41308, 0, 0, 0, 1, 1,
-0.8669723, -0.201154, -1.446673, 0, 0, 0, 1, 1,
-0.8660064, -1.69769, -3.275079, 0, 0, 0, 1, 1,
-0.8646958, -1.805263, -2.079793, 0, 0, 0, 1, 1,
-0.8580244, -0.02989437, -2.615195, 0, 0, 0, 1, 1,
-0.856096, -1.565386, -2.123302, 1, 1, 1, 1, 1,
-0.8557198, 2.005193, -2.120531, 1, 1, 1, 1, 1,
-0.8479095, 0.7264823, -0.002414372, 1, 1, 1, 1, 1,
-0.8446528, -1.414361, -0.8401729, 1, 1, 1, 1, 1,
-0.8444328, -0.3056749, -1.711368, 1, 1, 1, 1, 1,
-0.8378436, 0.1514536, -1.485563, 1, 1, 1, 1, 1,
-0.834676, -0.08027838, -1.692605, 1, 1, 1, 1, 1,
-0.8314018, -0.2112104, 0.6211968, 1, 1, 1, 1, 1,
-0.8302232, 0.068057, -1.479594, 1, 1, 1, 1, 1,
-0.8288866, 0.5685757, 0.30859, 1, 1, 1, 1, 1,
-0.8275937, -0.2317844, -1.478442, 1, 1, 1, 1, 1,
-0.8224222, 0.2370435, -1.568989, 1, 1, 1, 1, 1,
-0.820356, -1.490726, -1.35001, 1, 1, 1, 1, 1,
-0.8167485, -1.579426, -2.894455, 1, 1, 1, 1, 1,
-0.8135512, -0.07296266, 0.6158267, 1, 1, 1, 1, 1,
-0.8124955, -0.5456142, -2.432144, 0, 0, 1, 1, 1,
-0.8103433, -0.3736885, -1.832378, 1, 0, 0, 1, 1,
-0.8094562, 1.922301, -0.4601335, 1, 0, 0, 1, 1,
-0.8028102, 0.8103393, -1.147914, 1, 0, 0, 1, 1,
-0.7986051, 0.6835336, -1.57965, 1, 0, 0, 1, 1,
-0.7976795, 0.5858679, -0.8492649, 1, 0, 0, 1, 1,
-0.7926643, 0.7109377, -2.608053, 0, 0, 0, 1, 1,
-0.7891233, 0.9936039, -0.4045946, 0, 0, 0, 1, 1,
-0.7805242, 1.204113, -0.5335833, 0, 0, 0, 1, 1,
-0.7802985, 1.053748, -2.559371, 0, 0, 0, 1, 1,
-0.7729589, -0.1271891, -3.417154, 0, 0, 0, 1, 1,
-0.766537, 0.4710224, -1.136988, 0, 0, 0, 1, 1,
-0.7643896, 1.304134, -0.2673015, 0, 0, 0, 1, 1,
-0.7600335, 1.048131, -0.4360621, 1, 1, 1, 1, 1,
-0.758187, -0.6310384, -1.618441, 1, 1, 1, 1, 1,
-0.7561246, 1.071725, 0.8925053, 1, 1, 1, 1, 1,
-0.7534482, 0.7196149, -0.5650641, 1, 1, 1, 1, 1,
-0.7509744, 0.5867735, -0.4504035, 1, 1, 1, 1, 1,
-0.7485948, -0.9603642, -1.968347, 1, 1, 1, 1, 1,
-0.746761, -0.8883141, -3.040607, 1, 1, 1, 1, 1,
-0.7436203, -0.753159, -3.200041, 1, 1, 1, 1, 1,
-0.7383302, -0.3759677, -1.18699, 1, 1, 1, 1, 1,
-0.7314065, -0.8180916, -3.588862, 1, 1, 1, 1, 1,
-0.7300072, -1.110338, -2.204271, 1, 1, 1, 1, 1,
-0.7271534, 0.5295374, -2.37806, 1, 1, 1, 1, 1,
-0.7249456, -0.7347869, -2.771443, 1, 1, 1, 1, 1,
-0.7225145, 1.072687, -2.744139, 1, 1, 1, 1, 1,
-0.7195109, 0.5157174, -0.5954491, 1, 1, 1, 1, 1,
-0.719421, 1.012777, 0.339659, 0, 0, 1, 1, 1,
-0.7193428, 0.948324, 1.594046, 1, 0, 0, 1, 1,
-0.7161252, -1.692428, -1.790051, 1, 0, 0, 1, 1,
-0.7151288, 1.801636, 0.6489099, 1, 0, 0, 1, 1,
-0.7129685, 2.017995, -2.330865, 1, 0, 0, 1, 1,
-0.7116485, -2.373068, -3.331196, 1, 0, 0, 1, 1,
-0.7114484, 0.3468887, -2.363623, 0, 0, 0, 1, 1,
-0.7068771, -1.183363, -0.6262682, 0, 0, 0, 1, 1,
-0.7039813, 0.5800257, -1.964847, 0, 0, 0, 1, 1,
-0.7003793, 0.6679046, -1.231547, 0, 0, 0, 1, 1,
-0.6953176, -0.1475078, -4.13518, 0, 0, 0, 1, 1,
-0.6952909, -1.49757, -2.386401, 0, 0, 0, 1, 1,
-0.6883995, 0.6172226, -0.585342, 0, 0, 0, 1, 1,
-0.6842543, 0.1030331, -2.6828, 1, 1, 1, 1, 1,
-0.6796072, -0.2668156, -1.656863, 1, 1, 1, 1, 1,
-0.6785127, -0.7132143, -1.959367, 1, 1, 1, 1, 1,
-0.6770592, 0.3828276, -1.143286, 1, 1, 1, 1, 1,
-0.6768833, -0.3769203, -1.987519, 1, 1, 1, 1, 1,
-0.6717361, 1.421994, -0.09504627, 1, 1, 1, 1, 1,
-0.666099, 0.5221621, -0.6657411, 1, 1, 1, 1, 1,
-0.6624463, 1.255117, -0.5956221, 1, 1, 1, 1, 1,
-0.6517032, -0.6094532, -3.847144, 1, 1, 1, 1, 1,
-0.651476, 0.5428128, -1.551535, 1, 1, 1, 1, 1,
-0.6503466, -1.020954, -2.928932, 1, 1, 1, 1, 1,
-0.6486456, 0.632827, -1.580764, 1, 1, 1, 1, 1,
-0.6463776, 0.2986085, -1.180509, 1, 1, 1, 1, 1,
-0.6410821, -0.1361929, -1.056425, 1, 1, 1, 1, 1,
-0.6403642, 0.3601522, -0.3183391, 1, 1, 1, 1, 1,
-0.6184832, -1.202571, -3.272769, 0, 0, 1, 1, 1,
-0.6173621, 0.4728498, -2.749552, 1, 0, 0, 1, 1,
-0.6154105, 1.123041, -1.124235, 1, 0, 0, 1, 1,
-0.6150183, 1.018409, -1.619573, 1, 0, 0, 1, 1,
-0.612187, 0.7852383, -0.5907723, 1, 0, 0, 1, 1,
-0.6119652, -0.9132294, -1.309184, 1, 0, 0, 1, 1,
-0.61067, 0.2084161, -3.066194, 0, 0, 0, 1, 1,
-0.6049219, -1.447016, -4.35894, 0, 0, 0, 1, 1,
-0.6027033, 0.9826958, 0.57209, 0, 0, 0, 1, 1,
-0.6021627, 0.4009353, -1.177195, 0, 0, 0, 1, 1,
-0.6003339, -0.7171845, -3.675867, 0, 0, 0, 1, 1,
-0.592685, 0.04302545, -0.3748898, 0, 0, 0, 1, 1,
-0.5894122, -1.872706, -3.258794, 0, 0, 0, 1, 1,
-0.5867625, -1.132286, -4.588218, 1, 1, 1, 1, 1,
-0.5818169, 0.2544516, -1.180511, 1, 1, 1, 1, 1,
-0.5779788, -0.8938371, -2.349678, 1, 1, 1, 1, 1,
-0.5768777, 1.431805, 1.531736, 1, 1, 1, 1, 1,
-0.5765249, 1.237211, -0.4820003, 1, 1, 1, 1, 1,
-0.5733778, -0.403821, -3.350182, 1, 1, 1, 1, 1,
-0.5703091, 0.966206, -0.7722078, 1, 1, 1, 1, 1,
-0.5665833, -0.7834685, -2.586411, 1, 1, 1, 1, 1,
-0.5639195, -0.3782235, -3.586372, 1, 1, 1, 1, 1,
-0.5574525, -2.222126, -2.938573, 1, 1, 1, 1, 1,
-0.5567845, 0.1335127, 0.02238122, 1, 1, 1, 1, 1,
-0.5560482, -0.5816193, -1.762607, 1, 1, 1, 1, 1,
-0.5551775, -0.2332681, -2.421177, 1, 1, 1, 1, 1,
-0.551092, 0.07609158, -2.544148, 1, 1, 1, 1, 1,
-0.5475046, 2.371018, 0.3740928, 1, 1, 1, 1, 1,
-0.5455906, 1.959772, 0.1698101, 0, 0, 1, 1, 1,
-0.5383697, -0.04990275, -2.923635, 1, 0, 0, 1, 1,
-0.5344264, -0.4598218, -2.278062, 1, 0, 0, 1, 1,
-0.5312395, -0.2131869, -0.9274871, 1, 0, 0, 1, 1,
-0.5310438, -0.1045997, -3.030861, 1, 0, 0, 1, 1,
-0.5294929, 0.6821426, -1.0555, 1, 0, 0, 1, 1,
-0.5276833, -0.9730455, -2.949687, 0, 0, 0, 1, 1,
-0.5260233, 0.2154156, -1.453389, 0, 0, 0, 1, 1,
-0.5242704, -0.589757, -2.789933, 0, 0, 0, 1, 1,
-0.5199099, 0.8794418, 0.7453601, 0, 0, 0, 1, 1,
-0.5174072, 0.2156639, -1.104137, 0, 0, 0, 1, 1,
-0.5144466, -1.699803, -3.330364, 0, 0, 0, 1, 1,
-0.5117853, 0.9125885, -0.9611896, 0, 0, 0, 1, 1,
-0.511753, 0.5248842, -1.093853, 1, 1, 1, 1, 1,
-0.5061295, -0.1268926, -3.242723, 1, 1, 1, 1, 1,
-0.505428, 0.2607632, -1.113084, 1, 1, 1, 1, 1,
-0.5046519, -0.3362472, -1.815662, 1, 1, 1, 1, 1,
-0.4969751, -0.1984331, -1.448686, 1, 1, 1, 1, 1,
-0.4936186, 0.2722268, -1.858506, 1, 1, 1, 1, 1,
-0.4932482, 0.4604527, -0.2050038, 1, 1, 1, 1, 1,
-0.4929923, 1.065679, -2.296256, 1, 1, 1, 1, 1,
-0.4869356, -0.09077048, -1.502408, 1, 1, 1, 1, 1,
-0.4860102, -0.06543312, -3.155821, 1, 1, 1, 1, 1,
-0.4840533, -1.676765, -2.521493, 1, 1, 1, 1, 1,
-0.4828587, 0.2693709, -2.034423, 1, 1, 1, 1, 1,
-0.4817456, 1.376936, -1.868392, 1, 1, 1, 1, 1,
-0.4817193, 0.1495669, -1.937111, 1, 1, 1, 1, 1,
-0.4814685, -1.50762, -3.196326, 1, 1, 1, 1, 1,
-0.474425, 1.789653, 0.944321, 0, 0, 1, 1, 1,
-0.4723997, 0.493443, -1.699907, 1, 0, 0, 1, 1,
-0.4669859, 1.223883, 0.09885184, 1, 0, 0, 1, 1,
-0.4664336, 0.3220438, -1.73757, 1, 0, 0, 1, 1,
-0.4661955, 0.5874299, -3.176836, 1, 0, 0, 1, 1,
-0.4658571, -1.409353, -4.954679, 1, 0, 0, 1, 1,
-0.4637352, 0.859479, -0.5249086, 0, 0, 0, 1, 1,
-0.4555214, 0.9336619, -1.138123, 0, 0, 0, 1, 1,
-0.4542086, 0.3105087, -0.899088, 0, 0, 0, 1, 1,
-0.4529614, 0.8426726, -1.891871, 0, 0, 0, 1, 1,
-0.4385673, 0.6249724, -0.1740746, 0, 0, 0, 1, 1,
-0.4377797, -0.2623252, -2.045499, 0, 0, 0, 1, 1,
-0.4333091, -0.6179856, -1.092373, 0, 0, 0, 1, 1,
-0.4291022, -0.5826188, -3.468191, 1, 1, 1, 1, 1,
-0.4226331, -1.819912, -2.772417, 1, 1, 1, 1, 1,
-0.4208658, 0.3001832, -1.145096, 1, 1, 1, 1, 1,
-0.4193737, 0.5325806, -0.9601786, 1, 1, 1, 1, 1,
-0.4119878, 0.2760009, -1.169557, 1, 1, 1, 1, 1,
-0.4113396, -1.328593, -3.316969, 1, 1, 1, 1, 1,
-0.4060553, -0.2432435, -1.720388, 1, 1, 1, 1, 1,
-0.4053012, 0.1080009, -2.074812, 1, 1, 1, 1, 1,
-0.4024177, 0.8302237, 1.023373, 1, 1, 1, 1, 1,
-0.3992793, -2.157743, -3.632759, 1, 1, 1, 1, 1,
-0.3967976, -0.7480716, -0.7923901, 1, 1, 1, 1, 1,
-0.393461, -0.3777017, -2.132075, 1, 1, 1, 1, 1,
-0.3911137, -0.797792, -2.456545, 1, 1, 1, 1, 1,
-0.3878586, -0.08239552, 1.15613, 1, 1, 1, 1, 1,
-0.3861125, -2.074014, -2.411236, 1, 1, 1, 1, 1,
-0.3809448, 0.1631753, -1.445325, 0, 0, 1, 1, 1,
-0.3774172, 0.3232706, -0.7481889, 1, 0, 0, 1, 1,
-0.3743129, -0.2091061, -2.41743, 1, 0, 0, 1, 1,
-0.3730939, 0.08919993, 0.1586223, 1, 0, 0, 1, 1,
-0.3700651, -1.719707, -3.554831, 1, 0, 0, 1, 1,
-0.365245, -0.4732826, -0.9002745, 1, 0, 0, 1, 1,
-0.3645376, -0.9987188, -2.119864, 0, 0, 0, 1, 1,
-0.3643519, -0.5948856, -1.543983, 0, 0, 0, 1, 1,
-0.3623574, -0.8907844, -2.574365, 0, 0, 0, 1, 1,
-0.3616909, -0.2710417, -3.095721, 0, 0, 0, 1, 1,
-0.3602805, -0.09021439, -3.657898, 0, 0, 0, 1, 1,
-0.3558198, 1.020042, -0.7659814, 0, 0, 0, 1, 1,
-0.3556097, -0.8943379, -0.525691, 0, 0, 0, 1, 1,
-0.35473, 1.27058, 0.001378742, 1, 1, 1, 1, 1,
-0.3473536, 0.8879002, -1.883595, 1, 1, 1, 1, 1,
-0.3449277, -0.6759367, -1.856983, 1, 1, 1, 1, 1,
-0.3438763, -0.9299532, -2.835928, 1, 1, 1, 1, 1,
-0.3426054, 0.9037126, 0.1484969, 1, 1, 1, 1, 1,
-0.3418688, 1.854657, -0.2025605, 1, 1, 1, 1, 1,
-0.3416759, 0.8264364, 0.3772501, 1, 1, 1, 1, 1,
-0.3375493, 0.1983578, 1.515454, 1, 1, 1, 1, 1,
-0.3336005, -1.63884, -3.010815, 1, 1, 1, 1, 1,
-0.3310977, 0.8839876, -0.3051407, 1, 1, 1, 1, 1,
-0.3281686, -1.18373, -3.706572, 1, 1, 1, 1, 1,
-0.3281386, 0.4293769, -0.6531708, 1, 1, 1, 1, 1,
-0.3219585, 0.2257069, -0.5536022, 1, 1, 1, 1, 1,
-0.3214333, -0.9289271, -3.621131, 1, 1, 1, 1, 1,
-0.3213318, 0.1569093, -3.448312, 1, 1, 1, 1, 1,
-0.3132536, -0.08479347, -1.023934, 0, 0, 1, 1, 1,
-0.312178, -1.066558, -0.8358655, 1, 0, 0, 1, 1,
-0.3078936, 0.680344, 1.205351, 1, 0, 0, 1, 1,
-0.3056231, -1.211266, -3.547879, 1, 0, 0, 1, 1,
-0.2957928, -0.4682444, -2.059739, 1, 0, 0, 1, 1,
-0.2954716, -0.06089803, -4.004867, 1, 0, 0, 1, 1,
-0.2932032, 0.1577144, -1.578502, 0, 0, 0, 1, 1,
-0.2924649, 0.3318526, -0.5876795, 0, 0, 0, 1, 1,
-0.2871777, -0.1735184, -2.098118, 0, 0, 0, 1, 1,
-0.2853648, -0.3615725, -3.635186, 0, 0, 0, 1, 1,
-0.2758943, 0.4943858, 0.4676838, 0, 0, 0, 1, 1,
-0.2738593, -1.025516, -2.341421, 0, 0, 0, 1, 1,
-0.2737802, -1.174677, -3.513729, 0, 0, 0, 1, 1,
-0.271855, -0.5675659, -2.867895, 1, 1, 1, 1, 1,
-0.267943, 0.1040025, -2.002694, 1, 1, 1, 1, 1,
-0.2650963, -0.8972838, -2.877438, 1, 1, 1, 1, 1,
-0.2647651, -0.4907122, -2.350256, 1, 1, 1, 1, 1,
-0.2630508, -1.391107, 0.03251644, 1, 1, 1, 1, 1,
-0.262885, 0.005441711, -1.873263, 1, 1, 1, 1, 1,
-0.2569096, 1.650435, 0.7265116, 1, 1, 1, 1, 1,
-0.2567841, -1.459342, -2.21023, 1, 1, 1, 1, 1,
-0.2561589, -0.5657026, -3.381817, 1, 1, 1, 1, 1,
-0.2518316, 0.2344509, -1.048262, 1, 1, 1, 1, 1,
-0.2496186, 0.4923306, -0.9624484, 1, 1, 1, 1, 1,
-0.2466128, 0.009632851, -1.693377, 1, 1, 1, 1, 1,
-0.24174, 1.305403, -0.08190599, 1, 1, 1, 1, 1,
-0.2409361, 0.4453201, -0.1990708, 1, 1, 1, 1, 1,
-0.2391258, -1.115568, -3.011864, 1, 1, 1, 1, 1,
-0.2360526, 1.06048, -0.7367759, 0, 0, 1, 1, 1,
-0.230054, 0.03868223, -3.338362, 1, 0, 0, 1, 1,
-0.2267569, 1.096548, 1.371001, 1, 0, 0, 1, 1,
-0.2245459, -0.1597335, -2.821495, 1, 0, 0, 1, 1,
-0.2236627, -0.9381214, -3.232734, 1, 0, 0, 1, 1,
-0.2217888, -1.580275, -1.568116, 1, 0, 0, 1, 1,
-0.2147083, 1.67324, 1.002124, 0, 0, 0, 1, 1,
-0.2139158, 0.5682999, -0.1648245, 0, 0, 0, 1, 1,
-0.2123212, 0.2875652, 1.157735, 0, 0, 0, 1, 1,
-0.2115969, -0.9002055, -3.740889, 0, 0, 0, 1, 1,
-0.2109201, 0.1577211, -2.303564, 0, 0, 0, 1, 1,
-0.2037604, -0.2668835, -3.679056, 0, 0, 0, 1, 1,
-0.2029379, 1.762413, 1.512893, 0, 0, 0, 1, 1,
-0.2005161, 1.466416, -1.368619, 1, 1, 1, 1, 1,
-0.1981747, 1.352915, 0.3745801, 1, 1, 1, 1, 1,
-0.1976759, 0.5150761, 0.0497141, 1, 1, 1, 1, 1,
-0.1976319, 0.9509719, -1.061934, 1, 1, 1, 1, 1,
-0.1959183, 1.479833, 1.905173, 1, 1, 1, 1, 1,
-0.1957565, 1.636547, -0.03927018, 1, 1, 1, 1, 1,
-0.1943933, -0.4534345, -2.463102, 1, 1, 1, 1, 1,
-0.1906377, -0.41328, -1.11647, 1, 1, 1, 1, 1,
-0.1856469, 1.154633, 0.04897016, 1, 1, 1, 1, 1,
-0.1844716, -0.6190299, -2.689315, 1, 1, 1, 1, 1,
-0.1836522, 1.011108, -0.05085034, 1, 1, 1, 1, 1,
-0.181458, -0.3999794, -3.759246, 1, 1, 1, 1, 1,
-0.1764685, 0.3262207, 1.121587, 1, 1, 1, 1, 1,
-0.175279, 0.9032484, 0.3812504, 1, 1, 1, 1, 1,
-0.1705248, -1.77902, -1.862436, 1, 1, 1, 1, 1,
-0.1691027, -1.006849, -3.119771, 0, 0, 1, 1, 1,
-0.1687476, 0.0343353, -1.426297, 1, 0, 0, 1, 1,
-0.1605167, -0.9114799, -2.046238, 1, 0, 0, 1, 1,
-0.1603711, 0.6071172, 0.3001043, 1, 0, 0, 1, 1,
-0.1597385, -1.040556, -4.583193, 1, 0, 0, 1, 1,
-0.1574686, 0.6943737, -1.608806, 1, 0, 0, 1, 1,
-0.1563014, 1.320293, -0.9036362, 0, 0, 0, 1, 1,
-0.1554926, -1.012486, -4.541678, 0, 0, 0, 1, 1,
-0.1520423, 2.236711, 0.5026343, 0, 0, 0, 1, 1,
-0.1510795, -0.2937702, -3.596279, 0, 0, 0, 1, 1,
-0.1413831, -1.514871, -1.611707, 0, 0, 0, 1, 1,
-0.1376597, 0.06353515, 0.1207747, 0, 0, 0, 1, 1,
-0.1372253, 2.499071, -0.8356796, 0, 0, 0, 1, 1,
-0.1314184, -0.3604957, -1.623435, 1, 1, 1, 1, 1,
-0.1284225, 1.724721, -0.03196369, 1, 1, 1, 1, 1,
-0.1268154, 1.849376, 1.895188, 1, 1, 1, 1, 1,
-0.1264581, 0.6368919, -1.07702, 1, 1, 1, 1, 1,
-0.1143877, 0.763441, -1.106437, 1, 1, 1, 1, 1,
-0.109463, 1.870714, 0.2094058, 1, 1, 1, 1, 1,
-0.1083136, 0.8485544, -0.1733236, 1, 1, 1, 1, 1,
-0.10581, -1.276942, -3.211329, 1, 1, 1, 1, 1,
-0.1045567, 2.394636, 1.325449, 1, 1, 1, 1, 1,
-0.1042355, 1.692106, 0.8572129, 1, 1, 1, 1, 1,
-0.1011041, 0.4895266, -2.319834, 1, 1, 1, 1, 1,
-0.09980298, 0.772842, -0.4082951, 1, 1, 1, 1, 1,
-0.09449433, -0.01796406, -2.69184, 1, 1, 1, 1, 1,
-0.09337089, 1.399228, -0.2553505, 1, 1, 1, 1, 1,
-0.09259822, -1.052893, -3.877469, 1, 1, 1, 1, 1,
-0.09171508, 0.4629808, 0.2184955, 0, 0, 1, 1, 1,
-0.08595217, -0.8778551, -4.570655, 1, 0, 0, 1, 1,
-0.08537973, -0.3086222, -2.831508, 1, 0, 0, 1, 1,
-0.08325582, 0.0649088, -2.033044, 1, 0, 0, 1, 1,
-0.08187599, -0.2611982, -3.603467, 1, 0, 0, 1, 1,
-0.08085274, 1.691483, -1.965671, 1, 0, 0, 1, 1,
-0.07567971, -0.3178648, -3.090091, 0, 0, 0, 1, 1,
-0.07335147, 2.060796, -0.8611462, 0, 0, 0, 1, 1,
-0.07307996, 0.8656992, -1.659122, 0, 0, 0, 1, 1,
-0.06963263, -2.346816, -3.414809, 0, 0, 0, 1, 1,
-0.06888749, 0.2526724, -0.2989672, 0, 0, 0, 1, 1,
-0.06828459, 0.4688028, -0.1776862, 0, 0, 0, 1, 1,
-0.065656, 0.8112289, -0.9854, 0, 0, 0, 1, 1,
-0.06539818, -0.9533283, -3.540404, 1, 1, 1, 1, 1,
-0.0612314, 1.645474, -0.3062384, 1, 1, 1, 1, 1,
-0.05621977, -1.468359, -2.895563, 1, 1, 1, 1, 1,
-0.05600452, 0.5805906, 0.9583901, 1, 1, 1, 1, 1,
-0.05598138, -1.056797, -3.370034, 1, 1, 1, 1, 1,
-0.05509118, -0.2719983, -0.5597622, 1, 1, 1, 1, 1,
-0.04838104, -1.887694, -2.652746, 1, 1, 1, 1, 1,
-0.04591576, 1.011761, 0.5368858, 1, 1, 1, 1, 1,
-0.04477935, -0.2715793, -4.560771, 1, 1, 1, 1, 1,
-0.04411398, 0.4530104, -1.081938, 1, 1, 1, 1, 1,
-0.04257881, -2.521002, -4.047762, 1, 1, 1, 1, 1,
-0.04248066, 0.2101254, -1.271248, 1, 1, 1, 1, 1,
-0.0410102, 0.08863637, 0.179611, 1, 1, 1, 1, 1,
-0.04072865, 0.250383, -1.919938, 1, 1, 1, 1, 1,
-0.04030508, 0.5727544, -0.2025408, 1, 1, 1, 1, 1,
-0.03636715, 1.699472, 1.648514, 0, 0, 1, 1, 1,
-0.03364046, 1.430881, -1.266003, 1, 0, 0, 1, 1,
-0.03349571, -0.05509817, -2.37507, 1, 0, 0, 1, 1,
-0.02897997, -0.1667881, -2.025762, 1, 0, 0, 1, 1,
-0.02611534, 1.550622, -0.4832433, 1, 0, 0, 1, 1,
-0.02537915, 1.492557, 0.1239984, 1, 0, 0, 1, 1,
-0.0248587, 1.307542, -0.5785593, 0, 0, 0, 1, 1,
-0.02300104, 2.491185, -0.3583462, 0, 0, 0, 1, 1,
-0.02131913, -0.4717481, -3.067108, 0, 0, 0, 1, 1,
-0.02038019, 0.6342442, 0.1854176, 0, 0, 0, 1, 1,
-0.01766378, 0.8278066, -2.117097, 0, 0, 0, 1, 1,
-0.01429773, 0.456175, -0.05151583, 0, 0, 0, 1, 1,
-0.01337167, -0.6583259, -2.648369, 0, 0, 0, 1, 1,
-0.01219335, -0.3969885, -3.229939, 1, 1, 1, 1, 1,
-0.009882797, -0.5500358, -4.917677, 1, 1, 1, 1, 1,
-0.006931646, -2.186594, -2.692844, 1, 1, 1, 1, 1,
-0.002155811, 1.507731, -0.4454356, 1, 1, 1, 1, 1,
-0.001270841, 0.7501281, -1.069585, 1, 1, 1, 1, 1,
0.004071258, 0.8065199, -1.261497, 1, 1, 1, 1, 1,
0.006326305, -1.782581, 3.235403, 1, 1, 1, 1, 1,
0.008761504, -0.3075401, 2.932258, 1, 1, 1, 1, 1,
0.01055832, -0.6720396, 3.282679, 1, 1, 1, 1, 1,
0.01268657, -1.213264, 4.753181, 1, 1, 1, 1, 1,
0.02198263, 0.08688583, 0.9080009, 1, 1, 1, 1, 1,
0.02277638, -0.7221667, 3.192198, 1, 1, 1, 1, 1,
0.02576774, -1.340303, 2.142104, 1, 1, 1, 1, 1,
0.02633093, 0.03080134, -0.3263822, 1, 1, 1, 1, 1,
0.02733351, 1.517498, -1.223391, 1, 1, 1, 1, 1,
0.03524758, 1.280407, 0.8995736, 0, 0, 1, 1, 1,
0.03693649, 0.1945839, 1.530687, 1, 0, 0, 1, 1,
0.04250013, 0.3155769, 0.6863462, 1, 0, 0, 1, 1,
0.04725907, -0.8995205, 3.03206, 1, 0, 0, 1, 1,
0.04994489, -0.7854172, 2.184205, 1, 0, 0, 1, 1,
0.0506884, 0.9124666, -2.311357, 1, 0, 0, 1, 1,
0.05379866, 0.8322242, 0.6834104, 0, 0, 0, 1, 1,
0.05383555, -0.06192002, 2.594461, 0, 0, 0, 1, 1,
0.05429345, -0.2698452, 3.555974, 0, 0, 0, 1, 1,
0.05458692, -1.490675, 1.479706, 0, 0, 0, 1, 1,
0.06230296, -1.071117, 4.865626, 0, 0, 0, 1, 1,
0.07480862, 1.910171, 0.6862226, 0, 0, 0, 1, 1,
0.07496841, -0.2663379, 2.467625, 0, 0, 0, 1, 1,
0.07762169, 0.7933093, -0.644614, 1, 1, 1, 1, 1,
0.08267641, 1.117805, -0.6572375, 1, 1, 1, 1, 1,
0.08310617, 1.334587, -0.2344631, 1, 1, 1, 1, 1,
0.0858543, -0.2271609, 2.113304, 1, 1, 1, 1, 1,
0.08961019, -0.08085999, 1.78692, 1, 1, 1, 1, 1,
0.0897994, -1.744141, 3.136978, 1, 1, 1, 1, 1,
0.09308523, -0.6783919, 2.136743, 1, 1, 1, 1, 1,
0.09309828, 0.6412428, 0.8438359, 1, 1, 1, 1, 1,
0.09731707, 0.7807255, -0.03614723, 1, 1, 1, 1, 1,
0.1021502, 0.1396971, -0.1554606, 1, 1, 1, 1, 1,
0.1063323, 0.2441969, 0.1169127, 1, 1, 1, 1, 1,
0.1070589, 0.5621336, -0.8016869, 1, 1, 1, 1, 1,
0.1092385, -0.4538163, 3.121476, 1, 1, 1, 1, 1,
0.1131453, 1.462871, 0.8335422, 1, 1, 1, 1, 1,
0.1159515, 0.6579905, 0.6959302, 1, 1, 1, 1, 1,
0.1202464, -0.2835205, 2.276595, 0, 0, 1, 1, 1,
0.1206618, 0.1716949, 0.03257675, 1, 0, 0, 1, 1,
0.1223732, -0.6143681, 5.00737, 1, 0, 0, 1, 1,
0.1253691, 1.173704, -0.8940817, 1, 0, 0, 1, 1,
0.131331, 0.5089097, -1.355515, 1, 0, 0, 1, 1,
0.1342671, -1.356261, 4.585611, 1, 0, 0, 1, 1,
0.1367656, 0.1196468, 0.4335826, 0, 0, 0, 1, 1,
0.1377262, -1.713196, 4.130652, 0, 0, 0, 1, 1,
0.1415157, 1.878263, -1.806363, 0, 0, 0, 1, 1,
0.1423205, -1.841953, 1.464107, 0, 0, 0, 1, 1,
0.1522446, 0.8596815, -0.4775101, 0, 0, 0, 1, 1,
0.1548813, 0.6030189, 2.320259, 0, 0, 0, 1, 1,
0.1569782, -0.326005, 3.518882, 0, 0, 0, 1, 1,
0.1586197, -2.028289, 5.422093, 1, 1, 1, 1, 1,
0.159152, 1.509381, 0.3150424, 1, 1, 1, 1, 1,
0.1603078, -1.479391, 1.349979, 1, 1, 1, 1, 1,
0.1611764, -0.8848059, 1.251772, 1, 1, 1, 1, 1,
0.1621457, -0.9060534, 3.793977, 1, 1, 1, 1, 1,
0.1660868, -1.134225, 3.384276, 1, 1, 1, 1, 1,
0.1705836, -0.09052587, 2.219233, 1, 1, 1, 1, 1,
0.1709387, -0.6173546, 2.623701, 1, 1, 1, 1, 1,
0.1715227, -0.7474017, 3.338797, 1, 1, 1, 1, 1,
0.1816556, 0.7519516, 0.7410977, 1, 1, 1, 1, 1,
0.1822566, 0.5666177, -0.1054852, 1, 1, 1, 1, 1,
0.1840862, -0.3489779, 2.65775, 1, 1, 1, 1, 1,
0.1928899, 0.05079432, -1.180024, 1, 1, 1, 1, 1,
0.2017366, -1.451591, 2.113082, 1, 1, 1, 1, 1,
0.2041618, 0.1448513, 0.5757219, 1, 1, 1, 1, 1,
0.2066259, 1.053664, -0.01265047, 0, 0, 1, 1, 1,
0.2081913, -0.09486925, -0.4985443, 1, 0, 0, 1, 1,
0.2089627, 0.9376821, 0.7441886, 1, 0, 0, 1, 1,
0.2092446, 0.532922, 1.154951, 1, 0, 0, 1, 1,
0.2105469, 1.142169, -0.81877, 1, 0, 0, 1, 1,
0.2110054, 0.089989, 0.5288594, 1, 0, 0, 1, 1,
0.2133259, 0.3412935, 1.942377, 0, 0, 0, 1, 1,
0.214381, 0.3378528, -0.2518404, 0, 0, 0, 1, 1,
0.221218, -0.8989428, 3.714476, 0, 0, 0, 1, 1,
0.2234098, 0.2195149, -1.600622, 0, 0, 0, 1, 1,
0.2282559, -0.2526629, 2.593203, 0, 0, 0, 1, 1,
0.2378009, -1.667524, 3.429288, 0, 0, 0, 1, 1,
0.239564, -1.153614, 3.893041, 0, 0, 0, 1, 1,
0.2421325, 0.03455524, 0.3584633, 1, 1, 1, 1, 1,
0.2470038, 0.1240115, 0.3018408, 1, 1, 1, 1, 1,
0.2495535, 0.5674179, 0.8402479, 1, 1, 1, 1, 1,
0.2499279, 0.02761882, 3.218268, 1, 1, 1, 1, 1,
0.2515282, -0.3195854, 2.113187, 1, 1, 1, 1, 1,
0.2554014, -1.356129, 2.286174, 1, 1, 1, 1, 1,
0.2572453, -0.4252528, 4.238223, 1, 1, 1, 1, 1,
0.2617315, 0.1986633, 0.6867623, 1, 1, 1, 1, 1,
0.2628971, -0.6516133, 3.451251, 1, 1, 1, 1, 1,
0.2759406, 1.009209, -0.2184354, 1, 1, 1, 1, 1,
0.2772185, 0.9642086, 1.122437, 1, 1, 1, 1, 1,
0.2781563, -0.02271883, 2.085728, 1, 1, 1, 1, 1,
0.2801454, 1.290203, -0.4776674, 1, 1, 1, 1, 1,
0.2812541, 1.894988, -0.06532271, 1, 1, 1, 1, 1,
0.2824788, -1.055089, 2.299159, 1, 1, 1, 1, 1,
0.2831855, 1.62471, 0.514145, 0, 0, 1, 1, 1,
0.2870316, 0.1292224, 2.933086, 1, 0, 0, 1, 1,
0.2872036, -0.2045748, 2.385552, 1, 0, 0, 1, 1,
0.2888472, 2.058517, 1.009997, 1, 0, 0, 1, 1,
0.2913615, 0.1791826, 1.0238, 1, 0, 0, 1, 1,
0.2962263, 0.6550804, 0.5679368, 1, 0, 0, 1, 1,
0.2969508, 0.9173676, 0.3180058, 0, 0, 0, 1, 1,
0.29752, -0.08979118, 0.2428554, 0, 0, 0, 1, 1,
0.2977129, -1.456162, 1.973232, 0, 0, 0, 1, 1,
0.3015629, -0.272806, 1.837135, 0, 0, 0, 1, 1,
0.3020079, 0.4132979, -0.3181865, 0, 0, 0, 1, 1,
0.302224, 0.04478522, 0.6560606, 0, 0, 0, 1, 1,
0.3026446, 0.1032119, 2.929217, 0, 0, 0, 1, 1,
0.3150981, -1.005506, 2.601372, 1, 1, 1, 1, 1,
0.3187771, 0.1032829, 1.985927, 1, 1, 1, 1, 1,
0.3213288, 0.1935626, 1.343134, 1, 1, 1, 1, 1,
0.3244728, 0.8249357, -0.4990167, 1, 1, 1, 1, 1,
0.324558, -0.4427665, 2.834643, 1, 1, 1, 1, 1,
0.3276871, -0.2289564, 1.698674, 1, 1, 1, 1, 1,
0.3300272, -0.3346723, 2.282557, 1, 1, 1, 1, 1,
0.3319354, 1.638381, 1.400193, 1, 1, 1, 1, 1,
0.3339705, -1.808031, 3.322313, 1, 1, 1, 1, 1,
0.3366455, -1.338127, 1.738815, 1, 1, 1, 1, 1,
0.3370913, -0.3960461, 2.166306, 1, 1, 1, 1, 1,
0.3394717, -0.3117702, 1.075125, 1, 1, 1, 1, 1,
0.3467265, -0.3222972, 1.977522, 1, 1, 1, 1, 1,
0.3478022, -0.4180073, 3.958025, 1, 1, 1, 1, 1,
0.3491497, 0.7880545, -1.148687, 1, 1, 1, 1, 1,
0.3605337, -1.529544, 1.554769, 0, 0, 1, 1, 1,
0.3629134, -0.8010146, 5.323355, 1, 0, 0, 1, 1,
0.3662059, -1.939642, 3.676734, 1, 0, 0, 1, 1,
0.3666657, -0.08078364, 1.73421, 1, 0, 0, 1, 1,
0.3760996, -0.6128049, 1.793476, 1, 0, 0, 1, 1,
0.379243, 1.759613, 0.717263, 1, 0, 0, 1, 1,
0.3866768, -1.688779, 2.831307, 0, 0, 0, 1, 1,
0.3868537, -0.3188073, 2.036012, 0, 0, 0, 1, 1,
0.3913591, 0.5628126, 1.192799, 0, 0, 0, 1, 1,
0.3954173, 1.201876, 0.9574894, 0, 0, 0, 1, 1,
0.3967436, 0.6362768, 0.5029934, 0, 0, 0, 1, 1,
0.3977687, 0.748087, -0.1970768, 0, 0, 0, 1, 1,
0.401016, 1.101811, 1.564885, 0, 0, 0, 1, 1,
0.404131, -0.02907423, 0.007788947, 1, 1, 1, 1, 1,
0.4048495, -0.9849387, 2.478374, 1, 1, 1, 1, 1,
0.4125075, 0.1479478, 1.019217, 1, 1, 1, 1, 1,
0.4129427, -0.7025369, 0.2209995, 1, 1, 1, 1, 1,
0.4173609, 0.9395544, -1.224286, 1, 1, 1, 1, 1,
0.4241688, -0.3256795, 1.240816, 1, 1, 1, 1, 1,
0.4270473, 1.288137, 1.774505, 1, 1, 1, 1, 1,
0.4283993, 1.356421, -0.9215389, 1, 1, 1, 1, 1,
0.4289738, -1.439386, 2.644531, 1, 1, 1, 1, 1,
0.4290564, 0.3008708, 0.6638921, 1, 1, 1, 1, 1,
0.4291406, -0.4810906, 2.244882, 1, 1, 1, 1, 1,
0.4323381, 0.5822942, 1.037991, 1, 1, 1, 1, 1,
0.4361256, -0.3055503, 2.269951, 1, 1, 1, 1, 1,
0.4364856, -1.115535, 1.893229, 1, 1, 1, 1, 1,
0.4370425, -0.2377982, 2.266048, 1, 1, 1, 1, 1,
0.4462955, -0.3110904, 1.817614, 0, 0, 1, 1, 1,
0.4513449, 1.10701, -0.5164787, 1, 0, 0, 1, 1,
0.4560457, 1.567272, 0.9465316, 1, 0, 0, 1, 1,
0.457766, -1.351207, 3.454089, 1, 0, 0, 1, 1,
0.4593083, -0.3479953, 0.7697763, 1, 0, 0, 1, 1,
0.4595205, 1.698499, -0.4646693, 1, 0, 0, 1, 1,
0.4599952, 1.522301, 1.136027, 0, 0, 0, 1, 1,
0.4610938, 0.4355876, 1.082505, 0, 0, 0, 1, 1,
0.463555, 0.1810486, 1.027884, 0, 0, 0, 1, 1,
0.466196, -0.9481953, 2.40154, 0, 0, 0, 1, 1,
0.4710875, -1.686949, 2.827865, 0, 0, 0, 1, 1,
0.4839927, -0.202904, 1.084672, 0, 0, 0, 1, 1,
0.4889424, -0.9857822, 3.064704, 0, 0, 0, 1, 1,
0.4898965, 0.2244801, 0.4693108, 1, 1, 1, 1, 1,
0.4906132, 0.1442111, 0.7643173, 1, 1, 1, 1, 1,
0.4907562, 1.234522, -0.05148786, 1, 1, 1, 1, 1,
0.4942501, 1.84718, 0.7228754, 1, 1, 1, 1, 1,
0.4982653, -2.4029, 3.785082, 1, 1, 1, 1, 1,
0.4997404, 1.215539, 0.865433, 1, 1, 1, 1, 1,
0.5004895, 0.5385058, 1.748791, 1, 1, 1, 1, 1,
0.5030962, 0.1667683, -0.4051101, 1, 1, 1, 1, 1,
0.5038061, -0.9758034, 1.681563, 1, 1, 1, 1, 1,
0.5048223, -0.6096524, 2.386928, 1, 1, 1, 1, 1,
0.5079052, 1.750791, -0.1088999, 1, 1, 1, 1, 1,
0.5110922, -0.5726974, 1.995418, 1, 1, 1, 1, 1,
0.514136, -1.511595, 3.050797, 1, 1, 1, 1, 1,
0.5184637, 2.481281, 0.6420487, 1, 1, 1, 1, 1,
0.5196127, -0.9763389, 3.085557, 1, 1, 1, 1, 1,
0.5218424, 0.9440061, 0.3631279, 0, 0, 1, 1, 1,
0.5222876, 1.713778, 1.230303, 1, 0, 0, 1, 1,
0.5236524, 1.558017, 0.03614429, 1, 0, 0, 1, 1,
0.525759, 1.327844, 0.3735139, 1, 0, 0, 1, 1,
0.5274875, 0.6647563, 1.810912, 1, 0, 0, 1, 1,
0.5285326, 2.100149, 0.721848, 1, 0, 0, 1, 1,
0.5289032, -1.15897, 5.262853, 0, 0, 0, 1, 1,
0.534085, 0.1077416, 2.833132, 0, 0, 0, 1, 1,
0.5352926, 1.338626, -0.3098662, 0, 0, 0, 1, 1,
0.5384917, -0.523801, 2.010642, 0, 0, 0, 1, 1,
0.5419661, -0.3353577, 0.6650181, 0, 0, 0, 1, 1,
0.5479661, 2.661428, 0.1570015, 0, 0, 0, 1, 1,
0.5513039, -1.481968, 2.627406, 0, 0, 0, 1, 1,
0.5536106, -0.6246184, 3.126359, 1, 1, 1, 1, 1,
0.5566499, -0.566684, 2.339931, 1, 1, 1, 1, 1,
0.5587746, -0.6751385, 2.964183, 1, 1, 1, 1, 1,
0.5595355, 0.8709515, 2.600405, 1, 1, 1, 1, 1,
0.5634136, -0.109055, 0.4401888, 1, 1, 1, 1, 1,
0.565645, 0.2032537, 0.5976008, 1, 1, 1, 1, 1,
0.5663637, -1.516837, 2.168911, 1, 1, 1, 1, 1,
0.5691043, -1.493908, 4.069228, 1, 1, 1, 1, 1,
0.5692868, 0.03228723, 1.95208, 1, 1, 1, 1, 1,
0.5695601, 0.1898068, 1.943529, 1, 1, 1, 1, 1,
0.573395, 1.927132, -0.3821302, 1, 1, 1, 1, 1,
0.5735896, -0.686506, 1.220817, 1, 1, 1, 1, 1,
0.5765221, 0.4104614, 1.807171, 1, 1, 1, 1, 1,
0.5796002, 0.3975807, 1.638845, 1, 1, 1, 1, 1,
0.5843302, 0.05017601, 0.7364538, 1, 1, 1, 1, 1,
0.5859886, 0.1394061, 2.414649, 0, 0, 1, 1, 1,
0.5944769, 0.6391392, 0.3384776, 1, 0, 0, 1, 1,
0.5946385, -1.334227, 2.63282, 1, 0, 0, 1, 1,
0.595334, -0.1663737, 1.954191, 1, 0, 0, 1, 1,
0.5988842, 0.4580078, 1.195163, 1, 0, 0, 1, 1,
0.5996251, 0.1344429, -0.1089354, 1, 0, 0, 1, 1,
0.5997514, -0.8359193, 1.319356, 0, 0, 0, 1, 1,
0.6015655, 0.7229533, 2.389918, 0, 0, 0, 1, 1,
0.6050339, -0.5384091, 1.694698, 0, 0, 0, 1, 1,
0.6065247, -0.26822, 3.222888, 0, 0, 0, 1, 1,
0.6106257, -0.5604951, 1.049794, 0, 0, 0, 1, 1,
0.6111384, -0.3788428, 1.541411, 0, 0, 0, 1, 1,
0.6121636, 2.064473, -0.6180796, 0, 0, 0, 1, 1,
0.6158519, -0.3820103, 2.453128, 1, 1, 1, 1, 1,
0.6264632, 0.503204, 1.49765, 1, 1, 1, 1, 1,
0.6266966, 0.7810462, 1.007819, 1, 1, 1, 1, 1,
0.6316485, 0.01651339, 1.336296, 1, 1, 1, 1, 1,
0.6353486, 0.7214352, 0.8789042, 1, 1, 1, 1, 1,
0.6369772, 0.5406685, 0.4677479, 1, 1, 1, 1, 1,
0.6379271, 0.845035, 0.4823105, 1, 1, 1, 1, 1,
0.6402342, 1.37778, 1.555823, 1, 1, 1, 1, 1,
0.6428522, 0.558045, 2.82362, 1, 1, 1, 1, 1,
0.6489837, 1.485035, -0.3346356, 1, 1, 1, 1, 1,
0.6509848, 0.3142499, 0.1934898, 1, 1, 1, 1, 1,
0.6514136, 0.6085796, -1.037119, 1, 1, 1, 1, 1,
0.657554, 1.160672, 1.138621, 1, 1, 1, 1, 1,
0.6576166, 0.7801849, 1.362562, 1, 1, 1, 1, 1,
0.6721025, 0.8929235, -0.1931368, 1, 1, 1, 1, 1,
0.6744339, -2.341805, 3.839267, 0, 0, 1, 1, 1,
0.6816966, 0.6521764, 1.054757, 1, 0, 0, 1, 1,
0.6820772, -0.0445812, 1.525346, 1, 0, 0, 1, 1,
0.6861032, 0.3637743, -0.2846472, 1, 0, 0, 1, 1,
0.6901737, -1.343895, 1.860326, 1, 0, 0, 1, 1,
0.6923414, 0.3595135, -0.03664223, 1, 0, 0, 1, 1,
0.6934748, -1.328098, 2.905406, 0, 0, 0, 1, 1,
0.6976556, -0.1775189, 2.164961, 0, 0, 0, 1, 1,
0.6988454, 0.5662251, -0.978609, 0, 0, 0, 1, 1,
0.700471, -0.3610411, 1.487292, 0, 0, 0, 1, 1,
0.7062418, -1.965785, 2.872017, 0, 0, 0, 1, 1,
0.709824, 2.032971, 0.754439, 0, 0, 0, 1, 1,
0.7192018, -0.5108753, 3.706791, 0, 0, 0, 1, 1,
0.7254196, 1.139082, 0.8271282, 1, 1, 1, 1, 1,
0.7305171, -0.6640262, 2.01185, 1, 1, 1, 1, 1,
0.7385525, -0.5065216, 4.088409, 1, 1, 1, 1, 1,
0.7392001, -0.7437928, 2.17389, 1, 1, 1, 1, 1,
0.7402914, 0.05476461, 0.9120951, 1, 1, 1, 1, 1,
0.7424191, -0.4272545, 1.837087, 1, 1, 1, 1, 1,
0.7503355, -1.041422, 5.25269, 1, 1, 1, 1, 1,
0.7505316, 0.3717239, 1.450337, 1, 1, 1, 1, 1,
0.7546576, -1.964753, 3.020885, 1, 1, 1, 1, 1,
0.7603136, -0.4450116, 3.887074, 1, 1, 1, 1, 1,
0.7645406, 0.1339234, 0.5860976, 1, 1, 1, 1, 1,
0.7686906, 0.9173962, 0.5436864, 1, 1, 1, 1, 1,
0.7714645, -1.548676, 3.105068, 1, 1, 1, 1, 1,
0.7717471, -1.293438, 4.413053, 1, 1, 1, 1, 1,
0.7718903, 0.2355417, 1.774545, 1, 1, 1, 1, 1,
0.7723216, -1.37141, 2.518534, 0, 0, 1, 1, 1,
0.7734082, -1.509437, 4.278373, 1, 0, 0, 1, 1,
0.7758911, -1.208322, 4.873653, 1, 0, 0, 1, 1,
0.7847678, -0.9908771, 3.316175, 1, 0, 0, 1, 1,
0.7849171, 0.5349233, 2.441443, 1, 0, 0, 1, 1,
0.7936381, -0.5936198, 0.8316445, 1, 0, 0, 1, 1,
0.7981834, 0.4886563, 2.160808, 0, 0, 0, 1, 1,
0.7999033, -0.1713436, 2.058947, 0, 0, 0, 1, 1,
0.7999449, -1.448255, 2.340919, 0, 0, 0, 1, 1,
0.8005854, 1.248659, 0.5973493, 0, 0, 0, 1, 1,
0.8045005, -2.141937, 2.752251, 0, 0, 0, 1, 1,
0.8144954, -1.200223, 1.095672, 0, 0, 0, 1, 1,
0.8191202, 0.501129, 1.851511, 0, 0, 0, 1, 1,
0.8226607, -0.8487518, 1.982321, 1, 1, 1, 1, 1,
0.8354992, -0.4539142, 1.60335, 1, 1, 1, 1, 1,
0.8482407, -0.6015211, 1.759014, 1, 1, 1, 1, 1,
0.84845, 0.6837855, 1.575218, 1, 1, 1, 1, 1,
0.849206, -0.5455487, 2.471711, 1, 1, 1, 1, 1,
0.8554212, -1.725901, 2.209602, 1, 1, 1, 1, 1,
0.8709398, -0.6471601, 2.682055, 1, 1, 1, 1, 1,
0.874579, -0.9397983, 1.299399, 1, 1, 1, 1, 1,
0.8749999, -0.6010703, 1.712317, 1, 1, 1, 1, 1,
0.8778527, -1.941432, 2.479502, 1, 1, 1, 1, 1,
0.8793412, -1.633281, 2.622253, 1, 1, 1, 1, 1,
0.8798006, -1.908876, 3.253408, 1, 1, 1, 1, 1,
0.8838649, -1.247781, 1.830772, 1, 1, 1, 1, 1,
0.8843062, 0.02121672, 0.9355771, 1, 1, 1, 1, 1,
0.8902231, 0.09919701, 1.797652, 1, 1, 1, 1, 1,
0.9026508, -0.5840988, 2.486082, 0, 0, 1, 1, 1,
0.9071617, -1.716162, 2.855504, 1, 0, 0, 1, 1,
0.9121559, 0.8901522, -0.5740656, 1, 0, 0, 1, 1,
0.9129884, 0.6060308, 1.043924, 1, 0, 0, 1, 1,
0.9130207, 0.7499772, 0.4325381, 1, 0, 0, 1, 1,
0.9134757, -0.07331397, 0.7031764, 1, 0, 0, 1, 1,
0.9147259, -0.921621, 2.520334, 0, 0, 0, 1, 1,
0.9188378, 0.03769889, 1.213706, 0, 0, 0, 1, 1,
0.9238486, 0.2517486, 1.313701, 0, 0, 0, 1, 1,
0.9277123, 0.926654, 3.280723, 0, 0, 0, 1, 1,
0.9280394, 0.8952181, -0.2740159, 0, 0, 0, 1, 1,
0.9284592, 0.637221, 2.85811, 0, 0, 0, 1, 1,
0.9325906, 0.473192, 2.448398, 0, 0, 0, 1, 1,
0.9382381, 0.4337844, 1.636961, 1, 1, 1, 1, 1,
0.954179, -0.05737143, 3.211673, 1, 1, 1, 1, 1,
0.9611195, -0.6240401, 3.464004, 1, 1, 1, 1, 1,
0.9682347, 1.537895, 1.411866, 1, 1, 1, 1, 1,
0.9682924, -0.1549401, 2.69879, 1, 1, 1, 1, 1,
0.975342, 1.548939, 2.288956, 1, 1, 1, 1, 1,
0.9807559, -0.5041099, 1.886128, 1, 1, 1, 1, 1,
0.9864004, 1.343171, 0.7028513, 1, 1, 1, 1, 1,
0.9873805, 0.09331701, 1.376563, 1, 1, 1, 1, 1,
0.9888653, -0.3483045, 2.237074, 1, 1, 1, 1, 1,
0.9907465, -0.05798511, 0.6948122, 1, 1, 1, 1, 1,
0.9969346, 1.183215, 1.542594, 1, 1, 1, 1, 1,
1.002292, -0.1378544, 3.541466, 1, 1, 1, 1, 1,
1.002842, -0.8552541, 4.085748, 1, 1, 1, 1, 1,
1.005374, -0.1636953, 3.467378, 1, 1, 1, 1, 1,
1.005562, -0.4135643, 3.227032, 0, 0, 1, 1, 1,
1.006301, -0.5732919, 1.460665, 1, 0, 0, 1, 1,
1.006535, -0.2605084, 2.123298, 1, 0, 0, 1, 1,
1.020493, 0.02712609, -0.1523319, 1, 0, 0, 1, 1,
1.023176, 0.4991933, 1.475113, 1, 0, 0, 1, 1,
1.026432, 0.5911775, 1.054529, 1, 0, 0, 1, 1,
1.026558, -0.4037146, 1.075951, 0, 0, 0, 1, 1,
1.02702, -0.930622, 3.000179, 0, 0, 0, 1, 1,
1.029309, 0.5512248, -1.564121, 0, 0, 0, 1, 1,
1.035242, 0.09099533, 3.128112, 0, 0, 0, 1, 1,
1.036443, 0.8000017, -0.4745148, 0, 0, 0, 1, 1,
1.044104, -0.9658307, 2.712856, 0, 0, 0, 1, 1,
1.054916, -0.4532069, 3.068692, 0, 0, 0, 1, 1,
1.055066, -1.802126, 3.169678, 1, 1, 1, 1, 1,
1.057804, -0.2372293, 1.34856, 1, 1, 1, 1, 1,
1.063156, -3.073302, 1.384843, 1, 1, 1, 1, 1,
1.063454, -0.6426218, 2.049206, 1, 1, 1, 1, 1,
1.065698, 0.006412349, 3.052804, 1, 1, 1, 1, 1,
1.067926, -0.4898892, 3.297788, 1, 1, 1, 1, 1,
1.068281, -1.129622, 2.8316, 1, 1, 1, 1, 1,
1.070887, -1.408025, 0.4805498, 1, 1, 1, 1, 1,
1.071465, -1.563495, 0.6429256, 1, 1, 1, 1, 1,
1.080574, 0.1310831, 2.066525, 1, 1, 1, 1, 1,
1.085118, 1.199268, 1.763209, 1, 1, 1, 1, 1,
1.086901, 0.3460954, -0.3548316, 1, 1, 1, 1, 1,
1.088885, 0.2019691, 2.912128, 1, 1, 1, 1, 1,
1.090033, 0.05111981, 1.12122, 1, 1, 1, 1, 1,
1.099053, -0.8170125, 3.988661, 1, 1, 1, 1, 1,
1.102004, 1.569779, 0.8957552, 0, 0, 1, 1, 1,
1.104685, 0.7445962, -0.1973258, 1, 0, 0, 1, 1,
1.105125, -0.7855534, 2.685961, 1, 0, 0, 1, 1,
1.108345, -1.095838, 3.499022, 1, 0, 0, 1, 1,
1.111252, 0.9719782, 0.8560871, 1, 0, 0, 1, 1,
1.125692, 1.38327, 1.059116, 1, 0, 0, 1, 1,
1.149896, -1.018929, 1.913304, 0, 0, 0, 1, 1,
1.153195, 0.9518797, -1.061282, 0, 0, 0, 1, 1,
1.154106, 0.9089087, 1.200111, 0, 0, 0, 1, 1,
1.162611, -0.01690437, 2.290018, 0, 0, 0, 1, 1,
1.164003, 0.2370189, 1.155438, 0, 0, 0, 1, 1,
1.167726, 0.6632124, 0.725722, 0, 0, 0, 1, 1,
1.171882, -0.4095896, 2.71424, 0, 0, 0, 1, 1,
1.173089, -0.5849615, 2.768261, 1, 1, 1, 1, 1,
1.174122, -0.8173491, 2.578369, 1, 1, 1, 1, 1,
1.178853, -1.193537, 3.635896, 1, 1, 1, 1, 1,
1.184891, -1.845293, 3.624357, 1, 1, 1, 1, 1,
1.19163, 0.8964198, 1.003003, 1, 1, 1, 1, 1,
1.194187, -1.553854, 2.517601, 1, 1, 1, 1, 1,
1.197766, 0.3270863, -0.09228646, 1, 1, 1, 1, 1,
1.205776, -0.02855196, 2.187954, 1, 1, 1, 1, 1,
1.207307, -0.3793975, 2.316214, 1, 1, 1, 1, 1,
1.214607, -0.5521169, 2.405644, 1, 1, 1, 1, 1,
1.218289, -1.214271, 3.586101, 1, 1, 1, 1, 1,
1.221626, -0.5441004, 3.480344, 1, 1, 1, 1, 1,
1.224034, 1.755992, 0.4345148, 1, 1, 1, 1, 1,
1.224236, 1.036418, 1.654868, 1, 1, 1, 1, 1,
1.227729, 0.5931343, -0.4220707, 1, 1, 1, 1, 1,
1.272763, -0.09377798, 2.942502, 0, 0, 1, 1, 1,
1.27353, 0.01156502, 0.7385129, 1, 0, 0, 1, 1,
1.281289, -0.09156363, 0.3386513, 1, 0, 0, 1, 1,
1.299789, -1.423715, 2.288378, 1, 0, 0, 1, 1,
1.301754, 0.08219372, 1.183288, 1, 0, 0, 1, 1,
1.303825, -1.945191, 2.257126, 1, 0, 0, 1, 1,
1.307326, 0.3168434, 0.3565157, 0, 0, 0, 1, 1,
1.308287, -0.4511308, 3.059783, 0, 0, 0, 1, 1,
1.316226, 0.4834399, 0.6673853, 0, 0, 0, 1, 1,
1.316523, 0.09384097, -0.1586249, 0, 0, 0, 1, 1,
1.318064, -0.08641132, 1.975188, 0, 0, 0, 1, 1,
1.320676, -1.23359, 2.459968, 0, 0, 0, 1, 1,
1.321303, -1.070099, 1.892261, 0, 0, 0, 1, 1,
1.325929, 0.7736808, 0.4296368, 1, 1, 1, 1, 1,
1.329082, 0.615784, 4.194343, 1, 1, 1, 1, 1,
1.332028, 1.209173, 0.1506867, 1, 1, 1, 1, 1,
1.332134, -0.6302184, 1.690116, 1, 1, 1, 1, 1,
1.354868, 0.6153574, 2.718975, 1, 1, 1, 1, 1,
1.360473, 0.3625467, 1.658876, 1, 1, 1, 1, 1,
1.363067, 0.9868986, 0.6126263, 1, 1, 1, 1, 1,
1.376411, 0.2952581, 1.474818, 1, 1, 1, 1, 1,
1.378673, 0.1859188, 2.17479, 1, 1, 1, 1, 1,
1.393113, -1.133734, 3.117508, 1, 1, 1, 1, 1,
1.402565, -1.251908, 1.363598, 1, 1, 1, 1, 1,
1.403427, 0.06048741, 0.6927888, 1, 1, 1, 1, 1,
1.406126, -0.958566, 1.224235, 1, 1, 1, 1, 1,
1.40837, 1.497696, 0.7927563, 1, 1, 1, 1, 1,
1.420234, -1.232568, 1.007289, 1, 1, 1, 1, 1,
1.432439, -0.3963201, 1.226025, 0, 0, 1, 1, 1,
1.435577, 0.3091154, 1.309248, 1, 0, 0, 1, 1,
1.455535, 0.2214354, 0.9054076, 1, 0, 0, 1, 1,
1.455795, -0.6609086, 2.270864, 1, 0, 0, 1, 1,
1.46787, -0.2854939, 2.020602, 1, 0, 0, 1, 1,
1.479185, -0.1351442, 1.457093, 1, 0, 0, 1, 1,
1.483516, -0.116327, -0.3620676, 0, 0, 0, 1, 1,
1.501811, -0.5050845, -0.9389596, 0, 0, 0, 1, 1,
1.506794, -0.6902274, 0.5845432, 0, 0, 0, 1, 1,
1.5312, -0.1467158, 1.052756, 0, 0, 0, 1, 1,
1.536495, -0.6564781, 1.290124, 0, 0, 0, 1, 1,
1.538996, -1.411664, 4.382138, 0, 0, 0, 1, 1,
1.539366, 0.5264766, 2.050497, 0, 0, 0, 1, 1,
1.543186, -1.075314, 2.112898, 1, 1, 1, 1, 1,
1.549208, 0.6458049, 0.9456753, 1, 1, 1, 1, 1,
1.553168, -0.9236085, 2.525721, 1, 1, 1, 1, 1,
1.580524, 0.42789, 1.430961, 1, 1, 1, 1, 1,
1.582955, -0.8075511, 1.641926, 1, 1, 1, 1, 1,
1.601935, -0.3080695, 1.650449, 1, 1, 1, 1, 1,
1.62086, 0.2501911, 2.250946, 1, 1, 1, 1, 1,
1.653465, -0.4493042, 1.914817, 1, 1, 1, 1, 1,
1.655146, -0.04790153, 0.8640926, 1, 1, 1, 1, 1,
1.65832, -0.3359036, 1.395148, 1, 1, 1, 1, 1,
1.662269, 0.9268307, 1.845011, 1, 1, 1, 1, 1,
1.673047, 0.6594867, 3.436141, 1, 1, 1, 1, 1,
1.682371, -1.950293, 2.276781, 1, 1, 1, 1, 1,
1.699068, -0.05387834, 0.9835523, 1, 1, 1, 1, 1,
1.707605, -2.361816, 3.243453, 1, 1, 1, 1, 1,
1.72097, 0.5818925, 0.8787175, 0, 0, 1, 1, 1,
1.724698, -1.302473, 2.262283, 1, 0, 0, 1, 1,
1.72536, 0.4509297, 1.271554, 1, 0, 0, 1, 1,
1.736851, 0.134496, 0.6845921, 1, 0, 0, 1, 1,
1.73895, 0.891889, 0.8250291, 1, 0, 0, 1, 1,
1.748676, -0.5137367, 2.766667, 1, 0, 0, 1, 1,
1.756832, -0.4689784, 0.3128603, 0, 0, 0, 1, 1,
1.762743, -0.0292204, 2.371172, 0, 0, 0, 1, 1,
1.763559, 0.3506641, 2.94303, 0, 0, 0, 1, 1,
1.765677, 1.663221, -0.5451468, 0, 0, 0, 1, 1,
1.776444, 0.5899261, 0.3104739, 0, 0, 0, 1, 1,
1.77744, 0.2175759, 2.386324, 0, 0, 0, 1, 1,
1.78552, 0.4354958, 0.1293574, 0, 0, 0, 1, 1,
1.797436, -0.2482302, 3.318759, 1, 1, 1, 1, 1,
1.799205, -0.04900753, 2.306583, 1, 1, 1, 1, 1,
1.800335, 1.294893, 1.62949, 1, 1, 1, 1, 1,
1.822567, -0.08016762, 1.832703, 1, 1, 1, 1, 1,
1.833994, 0.8083807, 1.292097, 1, 1, 1, 1, 1,
1.837333, -0.4185406, 2.264126, 1, 1, 1, 1, 1,
1.847606, 1.032043, -0.6295117, 1, 1, 1, 1, 1,
1.861685, -0.6650676, 2.115892, 1, 1, 1, 1, 1,
1.899855, -0.8523338, 2.454471, 1, 1, 1, 1, 1,
1.915417, -0.09707607, 2.317862, 1, 1, 1, 1, 1,
1.936455, -0.2511342, 2.711485, 1, 1, 1, 1, 1,
1.941233, 0.1482353, 2.253867, 1, 1, 1, 1, 1,
1.969108, 0.05738378, 0.2280044, 1, 1, 1, 1, 1,
2.009099, 0.3558236, 2.894195, 1, 1, 1, 1, 1,
2.013435, -1.504958, 3.071746, 1, 1, 1, 1, 1,
2.035126, -0.06524168, 2.193057, 0, 0, 1, 1, 1,
2.056526, 0.1289149, 1.68086, 1, 0, 0, 1, 1,
2.058347, -0.4896038, 2.381605, 1, 0, 0, 1, 1,
2.100917, -0.3274978, 2.743112, 1, 0, 0, 1, 1,
2.111691, 0.9567699, 3.360852, 1, 0, 0, 1, 1,
2.148988, 1.163768, -0.7773404, 1, 0, 0, 1, 1,
2.18876, -0.03505509, 2.366636, 0, 0, 0, 1, 1,
2.20112, 0.6196923, -0.004627281, 0, 0, 0, 1, 1,
2.204852, 0.3997375, -0.1025853, 0, 0, 0, 1, 1,
2.266121, -0.2784746, 0.04777955, 0, 0, 0, 1, 1,
2.27997, 0.6525486, 2.167356, 0, 0, 0, 1, 1,
2.328933, 0.6884711, 1.157299, 0, 0, 0, 1, 1,
2.385427, -1.570442, 1.175695, 0, 0, 0, 1, 1,
2.50607, 0.5564691, 0.2562853, 1, 1, 1, 1, 1,
2.533665, -0.3632112, 2.452902, 1, 1, 1, 1, 1,
2.613049, -0.2086118, -0.04594008, 1, 1, 1, 1, 1,
2.777552, -1.799707, 1.556908, 1, 1, 1, 1, 1,
2.799203, -0.1369122, 2.180235, 1, 1, 1, 1, 1,
2.917702, -1.188714, 2.418019, 1, 1, 1, 1, 1,
4.061753, 0.5484886, 1.595659, 1, 1, 1, 1, 1
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
var radius = 9.724392;
var distance = 34.15651;
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
mvMatrix.translate( -0.08709073, 0.1863353, -0.233707 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.15651);
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
