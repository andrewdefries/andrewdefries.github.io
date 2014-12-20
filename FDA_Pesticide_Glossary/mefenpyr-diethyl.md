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
-3.339018, 0.115172, -1.251143, 1, 0, 0, 1,
-2.966925, 0.4773917, -1.906889, 1, 0.007843138, 0, 1,
-2.830653, 0.1499552, -4.193886, 1, 0.01176471, 0, 1,
-2.826315, -0.2986043, -1.646749, 1, 0.01960784, 0, 1,
-2.632921, -1.438744, -0.1700727, 1, 0.02352941, 0, 1,
-2.617346, -0.05806011, -3.115469, 1, 0.03137255, 0, 1,
-2.422805, 0.9413906, -0.4866843, 1, 0.03529412, 0, 1,
-2.411436, -0.8125019, -2.429702, 1, 0.04313726, 0, 1,
-2.36008, 0.3122283, -1.279402, 1, 0.04705882, 0, 1,
-2.326911, -0.3324552, 0.1076045, 1, 0.05490196, 0, 1,
-2.297322, -0.3197343, -2.183157, 1, 0.05882353, 0, 1,
-2.267136, 0.6021163, -0.9913853, 1, 0.06666667, 0, 1,
-2.259219, 1.717249, -0.2140948, 1, 0.07058824, 0, 1,
-2.186839, -1.130306, -0.7662188, 1, 0.07843138, 0, 1,
-2.154758, 0.7286851, -0.3067003, 1, 0.08235294, 0, 1,
-2.072996, -0.8711445, -2.104154, 1, 0.09019608, 0, 1,
-2.04335, -1.822379, -3.155609, 1, 0.09411765, 0, 1,
-1.984119, 0.8882006, -3.158575, 1, 0.1019608, 0, 1,
-1.980831, 0.9134797, -0.2310945, 1, 0.1098039, 0, 1,
-1.955106, 1.318491, -0.3589779, 1, 0.1137255, 0, 1,
-1.944199, -0.005646026, -1.688607, 1, 0.1215686, 0, 1,
-1.931404, 0.6441503, -2.540991, 1, 0.1254902, 0, 1,
-1.920009, 0.1064584, -1.434704, 1, 0.1333333, 0, 1,
-1.916823, -1.799421, -2.244303, 1, 0.1372549, 0, 1,
-1.874427, -0.3883592, -2.14035, 1, 0.145098, 0, 1,
-1.864973, -0.6626241, -0.6669927, 1, 0.1490196, 0, 1,
-1.858607, -1.049705, -2.107264, 1, 0.1568628, 0, 1,
-1.855464, -0.7638423, -3.193606, 1, 0.1607843, 0, 1,
-1.848834, 0.1601791, -2.274617, 1, 0.1686275, 0, 1,
-1.827757, 2.141075, -1.534419, 1, 0.172549, 0, 1,
-1.810531, 1.129775, -1.570134, 1, 0.1803922, 0, 1,
-1.803642, -0.6126506, -0.7276211, 1, 0.1843137, 0, 1,
-1.787997, -0.8614128, -0.7486904, 1, 0.1921569, 0, 1,
-1.77174, 0.7267677, -1.961715, 1, 0.1960784, 0, 1,
-1.764416, -1.635891, -1.144652, 1, 0.2039216, 0, 1,
-1.759257, -0.6392223, -0.6601171, 1, 0.2117647, 0, 1,
-1.729547, -0.1229845, -1.763385, 1, 0.2156863, 0, 1,
-1.725905, 2.096587, -2.216648, 1, 0.2235294, 0, 1,
-1.722683, -0.7966082, -0.932919, 1, 0.227451, 0, 1,
-1.720445, 1.316972, -2.597044, 1, 0.2352941, 0, 1,
-1.717943, -1.481008, -1.676406, 1, 0.2392157, 0, 1,
-1.708012, 0.8288224, -2.482727, 1, 0.2470588, 0, 1,
-1.698781, 0.4290684, -0.3375007, 1, 0.2509804, 0, 1,
-1.69616, -0.8478385, -1.884785, 1, 0.2588235, 0, 1,
-1.687539, 0.877046, -0.898854, 1, 0.2627451, 0, 1,
-1.685128, 2.046731, 0.7368098, 1, 0.2705882, 0, 1,
-1.680613, 0.1193792, -1.831072, 1, 0.2745098, 0, 1,
-1.67363, -0.2845302, -2.520909, 1, 0.282353, 0, 1,
-1.629857, 0.03185843, -1.689459, 1, 0.2862745, 0, 1,
-1.616788, -1.263447, -2.620219, 1, 0.2941177, 0, 1,
-1.609762, -1.037286, -1.837803, 1, 0.3019608, 0, 1,
-1.601637, 0.1747465, -0.5852007, 1, 0.3058824, 0, 1,
-1.597732, -0.2387073, -0.6209824, 1, 0.3137255, 0, 1,
-1.594493, -0.6067652, -2.281037, 1, 0.3176471, 0, 1,
-1.589517, 0.1290119, -2.985518, 1, 0.3254902, 0, 1,
-1.58619, 2.115891, -2.104486, 1, 0.3294118, 0, 1,
-1.576363, 0.8043477, 0.328243, 1, 0.3372549, 0, 1,
-1.575921, 1.308983, -0.1979343, 1, 0.3411765, 0, 1,
-1.574432, -2.058491, -2.403363, 1, 0.3490196, 0, 1,
-1.57179, -0.3285132, -1.482724, 1, 0.3529412, 0, 1,
-1.555365, 0.4603631, -2.127853, 1, 0.3607843, 0, 1,
-1.542872, 1.040821, -0.8449784, 1, 0.3647059, 0, 1,
-1.526163, 0.2746814, -0.2947155, 1, 0.372549, 0, 1,
-1.524737, 2.478515, -0.9970732, 1, 0.3764706, 0, 1,
-1.522128, -0.8735129, -3.075422, 1, 0.3843137, 0, 1,
-1.509207, 1.076376, -2.068573, 1, 0.3882353, 0, 1,
-1.506392, -0.00483384, -0.03074957, 1, 0.3960784, 0, 1,
-1.503799, -0.5818716, -0.7307813, 1, 0.4039216, 0, 1,
-1.487953, -0.8414618, -1.39261, 1, 0.4078431, 0, 1,
-1.48499, 0.884489, 0.4108462, 1, 0.4156863, 0, 1,
-1.483793, 0.8199294, 1.171475, 1, 0.4196078, 0, 1,
-1.481459, 0.6697969, -0.856591, 1, 0.427451, 0, 1,
-1.475878, 0.7261907, -0.9317973, 1, 0.4313726, 0, 1,
-1.47489, 0.8125965, -1.700291, 1, 0.4392157, 0, 1,
-1.461852, -1.477292, -2.133284, 1, 0.4431373, 0, 1,
-1.446977, 2.763423, -0.02253973, 1, 0.4509804, 0, 1,
-1.43812, -0.2382797, -2.091963, 1, 0.454902, 0, 1,
-1.413564, -1.439174, -1.763968, 1, 0.4627451, 0, 1,
-1.398869, -0.9635473, -2.446114, 1, 0.4666667, 0, 1,
-1.388792, -0.141144, -2.529646, 1, 0.4745098, 0, 1,
-1.387002, -0.01674439, -0.6981684, 1, 0.4784314, 0, 1,
-1.376187, 0.5678598, -2.864176, 1, 0.4862745, 0, 1,
-1.370968, 0.522779, 0.4071316, 1, 0.4901961, 0, 1,
-1.366073, 0.2959567, -1.927191, 1, 0.4980392, 0, 1,
-1.36519, -1.09512, -3.196011, 1, 0.5058824, 0, 1,
-1.352455, -0.7283899, -2.399109, 1, 0.509804, 0, 1,
-1.344233, -0.9321886, -0.7633613, 1, 0.5176471, 0, 1,
-1.343384, 0.2284682, -0.396771, 1, 0.5215687, 0, 1,
-1.32807, 1.005805, -1.278725, 1, 0.5294118, 0, 1,
-1.312056, 0.2902781, -0.8598091, 1, 0.5333334, 0, 1,
-1.309598, 0.2578669, -0.1481209, 1, 0.5411765, 0, 1,
-1.305389, -1.303704, -1.86385, 1, 0.5450981, 0, 1,
-1.304375, 1.160874, -0.1845954, 1, 0.5529412, 0, 1,
-1.304078, 0.2378616, -1.87289, 1, 0.5568628, 0, 1,
-1.302383, -1.695075, -3.594054, 1, 0.5647059, 0, 1,
-1.301431, 0.1556764, -0.9851296, 1, 0.5686275, 0, 1,
-1.300755, -0.2798584, -1.079177, 1, 0.5764706, 0, 1,
-1.29899, 1.490539, 0.1564529, 1, 0.5803922, 0, 1,
-1.296274, -0.06151911, -1.661221, 1, 0.5882353, 0, 1,
-1.28812, -0.7265873, -2.316856, 1, 0.5921569, 0, 1,
-1.283969, -0.7402064, -1.743105, 1, 0.6, 0, 1,
-1.283812, -1.664162, -2.492181, 1, 0.6078432, 0, 1,
-1.282461, -0.1636262, -2.648013, 1, 0.6117647, 0, 1,
-1.281203, -0.02984115, -0.9391699, 1, 0.6196079, 0, 1,
-1.256237, 0.9438662, -1.799599, 1, 0.6235294, 0, 1,
-1.254083, 1.462437, -0.8147625, 1, 0.6313726, 0, 1,
-1.250202, 0.7912374, -1.728287, 1, 0.6352941, 0, 1,
-1.24815, 0.3763022, 0.6467119, 1, 0.6431373, 0, 1,
-1.234902, -1.313988, -3.114461, 1, 0.6470588, 0, 1,
-1.227877, 0.04158715, -2.460756, 1, 0.654902, 0, 1,
-1.215576, 0.1915775, -1.368711, 1, 0.6588235, 0, 1,
-1.210515, 0.452142, -2.949131, 1, 0.6666667, 0, 1,
-1.202103, 0.08212502, -0.04296541, 1, 0.6705883, 0, 1,
-1.200425, 0.4014517, -1.748807, 1, 0.6784314, 0, 1,
-1.195645, -1.479302, -2.425246, 1, 0.682353, 0, 1,
-1.191148, -0.6608909, -1.809736, 1, 0.6901961, 0, 1,
-1.189803, -0.4073626, -0.6545964, 1, 0.6941177, 0, 1,
-1.181872, -0.1978599, -2.303535, 1, 0.7019608, 0, 1,
-1.179433, 0.6179848, -0.2078857, 1, 0.7098039, 0, 1,
-1.179253, -0.7517463, -2.096731, 1, 0.7137255, 0, 1,
-1.174755, 1.466534, -1.939882, 1, 0.7215686, 0, 1,
-1.167852, -0.1855378, -1.395583, 1, 0.7254902, 0, 1,
-1.1656, -0.7020008, -2.888217, 1, 0.7333333, 0, 1,
-1.163933, 1.085209, 0.4692476, 1, 0.7372549, 0, 1,
-1.159552, 0.8027375, -1.128628, 1, 0.7450981, 0, 1,
-1.159272, 1.498337, -0.9081047, 1, 0.7490196, 0, 1,
-1.151877, 1.200185, 0.5038059, 1, 0.7568628, 0, 1,
-1.142456, -0.01862374, -0.08676726, 1, 0.7607843, 0, 1,
-1.133294, 2.145347, -1.044925, 1, 0.7686275, 0, 1,
-1.130065, 1.219691, -0.9593747, 1, 0.772549, 0, 1,
-1.129679, 1.275598, -1.486519, 1, 0.7803922, 0, 1,
-1.126262, -0.8102834, -1.241448, 1, 0.7843137, 0, 1,
-1.124533, 0.02401488, -1.169712, 1, 0.7921569, 0, 1,
-1.121157, 2.86375, -0.18244, 1, 0.7960784, 0, 1,
-1.119251, -1.21712, -2.249693, 1, 0.8039216, 0, 1,
-1.117223, -0.4826548, -1.598369, 1, 0.8117647, 0, 1,
-1.115475, -0.2024516, 0.2953276, 1, 0.8156863, 0, 1,
-1.113227, -1.053029, -4.050193, 1, 0.8235294, 0, 1,
-1.098851, 1.206355, 0.001018704, 1, 0.827451, 0, 1,
-1.087293, 1.009997, -1.748395, 1, 0.8352941, 0, 1,
-1.086407, -0.9064686, -1.299001, 1, 0.8392157, 0, 1,
-1.082595, 0.8112155, -1.807221, 1, 0.8470588, 0, 1,
-1.078057, -1.009013, -4.342729, 1, 0.8509804, 0, 1,
-1.060674, -1.510054, -3.312959, 1, 0.8588235, 0, 1,
-1.058092, 0.4941018, -2.17033, 1, 0.8627451, 0, 1,
-1.057397, 0.3684224, 0.1344961, 1, 0.8705882, 0, 1,
-1.05094, 0.4046245, -1.507659, 1, 0.8745098, 0, 1,
-1.043476, -1.080817, -2.936865, 1, 0.8823529, 0, 1,
-1.042282, -1.106797, -2.824004, 1, 0.8862745, 0, 1,
-1.042118, 1.251695, -2.427359, 1, 0.8941177, 0, 1,
-1.035032, -2.261618, -2.488697, 1, 0.8980392, 0, 1,
-1.034993, -0.1846253, -2.246029, 1, 0.9058824, 0, 1,
-1.032045, 0.5040109, -1.539593, 1, 0.9137255, 0, 1,
-1.032028, -0.4301403, -1.916864, 1, 0.9176471, 0, 1,
-1.029876, 0.295343, -3.394973, 1, 0.9254902, 0, 1,
-1.020889, -0.2368771, -1.992321, 1, 0.9294118, 0, 1,
-1.019943, 0.7207632, -0.9865049, 1, 0.9372549, 0, 1,
-1.018135, -0.6368164, -2.91934, 1, 0.9411765, 0, 1,
-1.006635, -0.3395496, -1.643442, 1, 0.9490196, 0, 1,
-1.003448, 1.03527, -0.6830239, 1, 0.9529412, 0, 1,
-0.9966532, 0.4354018, -3.094405, 1, 0.9607843, 0, 1,
-0.9885192, 0.2133771, 0.0548079, 1, 0.9647059, 0, 1,
-0.9864336, -0.332985, -2.506898, 1, 0.972549, 0, 1,
-0.9856088, -0.5207136, -0.755079, 1, 0.9764706, 0, 1,
-0.9833952, 0.0748263, -1.920112, 1, 0.9843137, 0, 1,
-0.9799895, 2.21179, 0.667686, 1, 0.9882353, 0, 1,
-0.9786791, -0.1611998, -1.320737, 1, 0.9960784, 0, 1,
-0.9775054, 1.965032, 0.5318252, 0.9960784, 1, 0, 1,
-0.9766416, 1.217341, -1.795041, 0.9921569, 1, 0, 1,
-0.9762982, -1.0523, -1.980355, 0.9843137, 1, 0, 1,
-0.9694465, -1.354414, -2.945674, 0.9803922, 1, 0, 1,
-0.96939, 1.009229, -0.4590477, 0.972549, 1, 0, 1,
-0.9591594, 1.799076, 0.2359023, 0.9686275, 1, 0, 1,
-0.952736, -0.2475363, -0.130846, 0.9607843, 1, 0, 1,
-0.9439808, 0.9220051, -2.107747, 0.9568627, 1, 0, 1,
-0.9433509, 0.4496418, -2.653935, 0.9490196, 1, 0, 1,
-0.9433197, -0.1228563, -2.894834, 0.945098, 1, 0, 1,
-0.9369026, 0.6499444, -0.7306196, 0.9372549, 1, 0, 1,
-0.9356306, -0.7626016, -2.944496, 0.9333333, 1, 0, 1,
-0.9316594, -0.3738588, -2.75853, 0.9254902, 1, 0, 1,
-0.9303716, -0.6157887, -1.89624, 0.9215686, 1, 0, 1,
-0.9297817, -1.169572, -1.370656, 0.9137255, 1, 0, 1,
-0.9141976, -0.6129116, -2.205905, 0.9098039, 1, 0, 1,
-0.9129258, 1.673412, -0.06503948, 0.9019608, 1, 0, 1,
-0.9109268, -0.6440949, -3.269679, 0.8941177, 1, 0, 1,
-0.9089904, 0.009480844, -0.636642, 0.8901961, 1, 0, 1,
-0.8966807, 0.9590628, -2.31089, 0.8823529, 1, 0, 1,
-0.8939708, -1.211815, -2.141802, 0.8784314, 1, 0, 1,
-0.8906724, -0.1389354, -0.3777847, 0.8705882, 1, 0, 1,
-0.8883222, 1.690109, -1.438726, 0.8666667, 1, 0, 1,
-0.8845471, 0.2519875, -1.16178, 0.8588235, 1, 0, 1,
-0.8814023, -1.276605, -2.116588, 0.854902, 1, 0, 1,
-0.8794626, -0.08732132, 0.4961398, 0.8470588, 1, 0, 1,
-0.8768311, -0.264347, -0.2819064, 0.8431373, 1, 0, 1,
-0.8758067, 0.2404993, -1.396874, 0.8352941, 1, 0, 1,
-0.875669, -0.6544833, -4.074685, 0.8313726, 1, 0, 1,
-0.8751177, -0.7241684, -2.619124, 0.8235294, 1, 0, 1,
-0.8655313, 1.068078, -1.782612, 0.8196079, 1, 0, 1,
-0.8629592, -0.3881062, 0.7064133, 0.8117647, 1, 0, 1,
-0.8608099, -1.060219, -1.823193, 0.8078431, 1, 0, 1,
-0.8578516, 0.5019324, -2.038126, 0.8, 1, 0, 1,
-0.8558605, 1.179041, -1.301812, 0.7921569, 1, 0, 1,
-0.8553635, -0.06692801, -2.628151, 0.7882353, 1, 0, 1,
-0.8530533, -0.3903402, -1.813913, 0.7803922, 1, 0, 1,
-0.8526261, 1.885045, -0.4889107, 0.7764706, 1, 0, 1,
-0.8469098, 1.560757, -0.4848789, 0.7686275, 1, 0, 1,
-0.8439964, -0.0157244, -0.08853807, 0.7647059, 1, 0, 1,
-0.842527, -1.667344, -1.658366, 0.7568628, 1, 0, 1,
-0.8413011, 0.8614975, -0.07413131, 0.7529412, 1, 0, 1,
-0.8377991, 0.4613061, 0.008276792, 0.7450981, 1, 0, 1,
-0.8368067, -1.216723, -1.876129, 0.7411765, 1, 0, 1,
-0.8355197, 0.4243065, -1.415285, 0.7333333, 1, 0, 1,
-0.833788, 0.8842713, -2.696131, 0.7294118, 1, 0, 1,
-0.8244259, 0.8662792, -0.7184508, 0.7215686, 1, 0, 1,
-0.8239635, 1.813923, -0.4906054, 0.7176471, 1, 0, 1,
-0.8226226, 1.266988, -2.27914, 0.7098039, 1, 0, 1,
-0.8178723, -0.2335543, -1.014801, 0.7058824, 1, 0, 1,
-0.8177421, -0.1685797, -2.410562, 0.6980392, 1, 0, 1,
-0.8162371, -0.3688378, -2.010809, 0.6901961, 1, 0, 1,
-0.8141632, 0.5061808, -2.188345, 0.6862745, 1, 0, 1,
-0.8094581, 1.492371, -0.1264366, 0.6784314, 1, 0, 1,
-0.8091301, -0.8957485, -4.210906, 0.6745098, 1, 0, 1,
-0.8077632, -1.317501, -2.778253, 0.6666667, 1, 0, 1,
-0.8066937, 0.9719002, 1.21273, 0.6627451, 1, 0, 1,
-0.8053312, 1.229562, -2.144017, 0.654902, 1, 0, 1,
-0.8048527, 0.3906285, -1.438768, 0.6509804, 1, 0, 1,
-0.8032515, -0.1926684, -3.130599, 0.6431373, 1, 0, 1,
-0.8019162, -0.417014, -2.348073, 0.6392157, 1, 0, 1,
-0.7958531, 1.067162, -1.997432, 0.6313726, 1, 0, 1,
-0.7949818, 1.14964, 1.051107, 0.627451, 1, 0, 1,
-0.7902461, -0.8691458, -1.110806, 0.6196079, 1, 0, 1,
-0.7889778, 0.2459463, -0.8091206, 0.6156863, 1, 0, 1,
-0.7875295, -0.5203089, -2.316157, 0.6078432, 1, 0, 1,
-0.7857427, -0.3664103, -2.737811, 0.6039216, 1, 0, 1,
-0.784259, 1.03695, -0.4745714, 0.5960785, 1, 0, 1,
-0.7736531, 1.181113, 1.182263, 0.5882353, 1, 0, 1,
-0.7710042, 0.1703037, -1.235473, 0.5843138, 1, 0, 1,
-0.7696655, 0.169116, -0.7964471, 0.5764706, 1, 0, 1,
-0.7692345, -0.1464567, -0.2543592, 0.572549, 1, 0, 1,
-0.7679471, -1.104256, -2.282673, 0.5647059, 1, 0, 1,
-0.7653331, -1.309293, -1.452568, 0.5607843, 1, 0, 1,
-0.755946, -0.3638621, -2.195339, 0.5529412, 1, 0, 1,
-0.7530049, -1.323838, -2.875241, 0.5490196, 1, 0, 1,
-0.7518117, -0.5273274, -3.381959, 0.5411765, 1, 0, 1,
-0.7418673, 0.01928805, -2.358103, 0.5372549, 1, 0, 1,
-0.734895, -0.4922138, -0.8716908, 0.5294118, 1, 0, 1,
-0.7298432, -0.8100029, -3.375228, 0.5254902, 1, 0, 1,
-0.7243539, -0.7611232, -3.197362, 0.5176471, 1, 0, 1,
-0.7148628, -1.523977, -3.379771, 0.5137255, 1, 0, 1,
-0.714691, -0.5333686, -1.870975, 0.5058824, 1, 0, 1,
-0.7132862, 0.9698063, -1.028235, 0.5019608, 1, 0, 1,
-0.709187, -0.1812716, -1.728078, 0.4941176, 1, 0, 1,
-0.708661, -1.046168, -2.538182, 0.4862745, 1, 0, 1,
-0.7075565, 1.258714, -1.247189, 0.4823529, 1, 0, 1,
-0.7074227, 0.4591317, -2.022193, 0.4745098, 1, 0, 1,
-0.7012123, 1.028497, 1.743737, 0.4705882, 1, 0, 1,
-0.6864308, -0.1086038, -1.188766, 0.4627451, 1, 0, 1,
-0.6842723, -0.5061228, -2.67905, 0.4588235, 1, 0, 1,
-0.6801386, 0.7721103, -0.8900668, 0.4509804, 1, 0, 1,
-0.6745814, 1.90223, -0.8439719, 0.4470588, 1, 0, 1,
-0.6739646, 1.003435, -0.2133631, 0.4392157, 1, 0, 1,
-0.6670982, 0.2462034, -1.971747, 0.4352941, 1, 0, 1,
-0.6670303, -0.9230193, -2.728078, 0.427451, 1, 0, 1,
-0.6656855, 1.065275, -0.7721517, 0.4235294, 1, 0, 1,
-0.6656544, 0.7261013, 0.2593659, 0.4156863, 1, 0, 1,
-0.6648942, -1.201053, -2.701372, 0.4117647, 1, 0, 1,
-0.6645783, 0.9992656, 0.03289682, 0.4039216, 1, 0, 1,
-0.6627225, -0.8776688, -4.140688, 0.3960784, 1, 0, 1,
-0.6614225, -1.006549, -0.2633747, 0.3921569, 1, 0, 1,
-0.6607164, -1.026728, -3.025937, 0.3843137, 1, 0, 1,
-0.6487768, -1.428009, -1.4067, 0.3803922, 1, 0, 1,
-0.648503, -2.128576, -2.779418, 0.372549, 1, 0, 1,
-0.6455736, 0.8134968, -1.655105, 0.3686275, 1, 0, 1,
-0.6436712, -0.01781609, 0.1901052, 0.3607843, 1, 0, 1,
-0.643231, -0.07862702, -1.908892, 0.3568628, 1, 0, 1,
-0.6403725, 0.8691924, 0.760662, 0.3490196, 1, 0, 1,
-0.6403059, -0.2831588, -1.044382, 0.345098, 1, 0, 1,
-0.6386386, 0.6366875, -0.6655524, 0.3372549, 1, 0, 1,
-0.6380908, -2.508516, -3.440439, 0.3333333, 1, 0, 1,
-0.6372138, -0.7851661, -2.805031, 0.3254902, 1, 0, 1,
-0.634432, -0.2259855, -3.588463, 0.3215686, 1, 0, 1,
-0.6313772, -0.6572737, -3.083283, 0.3137255, 1, 0, 1,
-0.6297759, 2.804599, -1.312103, 0.3098039, 1, 0, 1,
-0.6293284, 1.547211, -0.9370109, 0.3019608, 1, 0, 1,
-0.6235737, -1.283447, -3.344046, 0.2941177, 1, 0, 1,
-0.6225492, 1.44975, 0.7557973, 0.2901961, 1, 0, 1,
-0.6216093, 0.303614, -0.3917892, 0.282353, 1, 0, 1,
-0.6149685, 0.9251679, -0.3346802, 0.2784314, 1, 0, 1,
-0.6123492, 0.02723568, 1.075197, 0.2705882, 1, 0, 1,
-0.6107762, 0.8786976, -1.657354, 0.2666667, 1, 0, 1,
-0.6070342, -0.1403505, -0.8043357, 0.2588235, 1, 0, 1,
-0.6067711, 1.674384, 0.906238, 0.254902, 1, 0, 1,
-0.6058078, 1.720781, 0.8179013, 0.2470588, 1, 0, 1,
-0.605505, 1.005192, -0.2851676, 0.2431373, 1, 0, 1,
-0.6050144, -0.5784661, -3.294573, 0.2352941, 1, 0, 1,
-0.6015025, 0.3734868, -1.082552, 0.2313726, 1, 0, 1,
-0.6010933, 0.1335093, -1.213945, 0.2235294, 1, 0, 1,
-0.5959291, 0.3137784, -1.405365, 0.2196078, 1, 0, 1,
-0.5947865, -0.8730288, -2.750876, 0.2117647, 1, 0, 1,
-0.5927565, -0.4429148, -0.2426325, 0.2078431, 1, 0, 1,
-0.5915859, -0.07142814, -0.7725384, 0.2, 1, 0, 1,
-0.5898775, 0.2505739, -0.6427323, 0.1921569, 1, 0, 1,
-0.5892318, 0.4575341, -1.720197, 0.1882353, 1, 0, 1,
-0.5866687, 0.5609962, 0.7765523, 0.1803922, 1, 0, 1,
-0.5859771, 0.555513, -0.8562305, 0.1764706, 1, 0, 1,
-0.5832317, 0.6727022, -1.318888, 0.1686275, 1, 0, 1,
-0.5821084, 0.2417903, -0.9481194, 0.1647059, 1, 0, 1,
-0.5783786, -0.5615032, -3.320153, 0.1568628, 1, 0, 1,
-0.577601, -0.9997287, -1.803445, 0.1529412, 1, 0, 1,
-0.5734253, -0.9758204, -1.298141, 0.145098, 1, 0, 1,
-0.5697454, 0.8884234, -1.657441, 0.1411765, 1, 0, 1,
-0.566959, -0.1659785, -1.620911, 0.1333333, 1, 0, 1,
-0.564404, 1.658241, -1.712953, 0.1294118, 1, 0, 1,
-0.5574106, -0.07011192, -1.404733, 0.1215686, 1, 0, 1,
-0.5573103, 0.3490849, -1.008268, 0.1176471, 1, 0, 1,
-0.5520175, 1.47622, 1.102293, 0.1098039, 1, 0, 1,
-0.5504171, -1.373824, -1.279887, 0.1058824, 1, 0, 1,
-0.5489202, -0.641084, -2.862328, 0.09803922, 1, 0, 1,
-0.548315, -2.450106, -2.932633, 0.09019608, 1, 0, 1,
-0.5462446, 0.5067114, -0.6649696, 0.08627451, 1, 0, 1,
-0.5461968, 0.2616135, -1.275926, 0.07843138, 1, 0, 1,
-0.5438734, -2.055128, -2.926353, 0.07450981, 1, 0, 1,
-0.5425779, 0.04343681, -1.916848, 0.06666667, 1, 0, 1,
-0.542357, 0.1120672, -2.593948, 0.0627451, 1, 0, 1,
-0.5419319, -1.375867, -2.732869, 0.05490196, 1, 0, 1,
-0.5404837, -0.4885697, -3.293207, 0.05098039, 1, 0, 1,
-0.5302234, 0.04649917, -0.6748065, 0.04313726, 1, 0, 1,
-0.5197379, -1.856829, -2.887225, 0.03921569, 1, 0, 1,
-0.5193804, -0.4744227, -3.068431, 0.03137255, 1, 0, 1,
-0.5169089, -0.7255422, -3.455141, 0.02745098, 1, 0, 1,
-0.5144731, 0.6392931, 0.3558181, 0.01960784, 1, 0, 1,
-0.5141758, 0.3906981, -3.020837, 0.01568628, 1, 0, 1,
-0.5134925, -1.468857, -4.002185, 0.007843138, 1, 0, 1,
-0.5125706, 0.3146883, -1.023482, 0.003921569, 1, 0, 1,
-0.5097802, 0.8167336, -2.282847, 0, 1, 0.003921569, 1,
-0.5090924, 1.037852, -1.322917, 0, 1, 0.01176471, 1,
-0.5073675, -1.582343, -1.510777, 0, 1, 0.01568628, 1,
-0.497709, -0.003150591, -2.829077, 0, 1, 0.02352941, 1,
-0.4902769, -0.3449919, -3.268353, 0, 1, 0.02745098, 1,
-0.4771625, 0.1263335, -1.712177, 0, 1, 0.03529412, 1,
-0.4743949, 0.2210671, -0.3817592, 0, 1, 0.03921569, 1,
-0.4723882, 1.377621, 0.7295955, 0, 1, 0.04705882, 1,
-0.4722216, -1.23315, -3.15005, 0, 1, 0.05098039, 1,
-0.4717988, 0.0378744, -1.627323, 0, 1, 0.05882353, 1,
-0.4716977, 0.5598042, -1.997474, 0, 1, 0.0627451, 1,
-0.4696233, -0.1388877, -2.306175, 0, 1, 0.07058824, 1,
-0.4610796, -0.9370516, -3.965423, 0, 1, 0.07450981, 1,
-0.4591653, 0.3837118, -3.399367, 0, 1, 0.08235294, 1,
-0.4570044, -0.7307975, -2.042082, 0, 1, 0.08627451, 1,
-0.4550798, -1.565796, -2.290734, 0, 1, 0.09411765, 1,
-0.4548251, -0.9840407, -1.693213, 0, 1, 0.1019608, 1,
-0.4535102, -0.545741, -1.773971, 0, 1, 0.1058824, 1,
-0.452242, -0.423741, -2.187287, 0, 1, 0.1137255, 1,
-0.45156, 0.1604382, -2.153202, 0, 1, 0.1176471, 1,
-0.4514053, 0.03978805, -2.567454, 0, 1, 0.1254902, 1,
-0.4498736, -0.9052985, -3.439083, 0, 1, 0.1294118, 1,
-0.4496363, 0.3292626, -0.002694421, 0, 1, 0.1372549, 1,
-0.4480807, -0.6224793, -2.688859, 0, 1, 0.1411765, 1,
-0.4477999, 0.2018114, -1.353269, 0, 1, 0.1490196, 1,
-0.4431989, 0.003519505, -0.7333409, 0, 1, 0.1529412, 1,
-0.4396352, -0.4586563, -2.316348, 0, 1, 0.1607843, 1,
-0.4394951, 0.7813938, 2.31954, 0, 1, 0.1647059, 1,
-0.4387844, 1.98271, -0.7206566, 0, 1, 0.172549, 1,
-0.4376493, 0.8479858, 0.4390473, 0, 1, 0.1764706, 1,
-0.4367005, 0.0321677, -1.990775, 0, 1, 0.1843137, 1,
-0.4353563, 0.4824784, -0.5854475, 0, 1, 0.1882353, 1,
-0.4336304, 0.2471749, -1.827324, 0, 1, 0.1960784, 1,
-0.4277577, 2.046349, 0.3939663, 0, 1, 0.2039216, 1,
-0.4267708, -1.436256, -2.103626, 0, 1, 0.2078431, 1,
-0.418147, -0.6598855, -4.182278, 0, 1, 0.2156863, 1,
-0.4154181, 0.7607105, 2.583361, 0, 1, 0.2196078, 1,
-0.4144037, -0.7141861, -3.208581, 0, 1, 0.227451, 1,
-0.4094677, -1.202482, -2.422675, 0, 1, 0.2313726, 1,
-0.4090932, 0.4651711, -1.314214, 0, 1, 0.2392157, 1,
-0.4066637, -1.326579, -2.491714, 0, 1, 0.2431373, 1,
-0.4022249, -0.7990198, -3.516695, 0, 1, 0.2509804, 1,
-0.4006075, -0.2046801, -1.215489, 0, 1, 0.254902, 1,
-0.40058, -0.1537621, -4.17962, 0, 1, 0.2627451, 1,
-0.3986365, -1.065549, -2.248319, 0, 1, 0.2666667, 1,
-0.3986255, -1.227098, -2.765235, 0, 1, 0.2745098, 1,
-0.3980987, -1.566813, -1.419912, 0, 1, 0.2784314, 1,
-0.3980958, -0.2452367, -3.853573, 0, 1, 0.2862745, 1,
-0.3915617, -1.469161, -2.878636, 0, 1, 0.2901961, 1,
-0.3892384, -0.9748504, -3.532327, 0, 1, 0.2980392, 1,
-0.3861387, -0.7661216, -2.906255, 0, 1, 0.3058824, 1,
-0.3787002, -2.220967, -4.170824, 0, 1, 0.3098039, 1,
-0.3772084, 0.06896003, -1.838383, 0, 1, 0.3176471, 1,
-0.3756118, -0.08743815, -1.370767, 0, 1, 0.3215686, 1,
-0.3740541, -0.7095326, -2.120184, 0, 1, 0.3294118, 1,
-0.3690286, 0.2048592, -1.004851, 0, 1, 0.3333333, 1,
-0.3646405, 0.7129302, -1.703836, 0, 1, 0.3411765, 1,
-0.3608022, 0.228161, -0.9530388, 0, 1, 0.345098, 1,
-0.3568062, 2.545056, -0.3627004, 0, 1, 0.3529412, 1,
-0.3567722, -0.4844444, -1.586816, 0, 1, 0.3568628, 1,
-0.3563808, 0.1686911, -1.051727, 0, 1, 0.3647059, 1,
-0.3551838, -0.7740447, -1.783861, 0, 1, 0.3686275, 1,
-0.3490048, 1.118764, -1.939754, 0, 1, 0.3764706, 1,
-0.3400216, 1.415135, 0.6677238, 0, 1, 0.3803922, 1,
-0.3396984, 0.3203454, -2.656827, 0, 1, 0.3882353, 1,
-0.3385672, -1.099727, -1.437299, 0, 1, 0.3921569, 1,
-0.337689, -1.096644, -3.10473, 0, 1, 0.4, 1,
-0.3331267, -0.606084, -0.6742707, 0, 1, 0.4078431, 1,
-0.333068, 0.6797013, 1.116515, 0, 1, 0.4117647, 1,
-0.3329436, -0.1794108, -1.922036, 0, 1, 0.4196078, 1,
-0.3323377, 0.4693731, -1.308461, 0, 1, 0.4235294, 1,
-0.3297189, 1.783066, -0.7218544, 0, 1, 0.4313726, 1,
-0.3287823, 1.079692, -1.861812, 0, 1, 0.4352941, 1,
-0.3246665, 1.4467, 0.5200781, 0, 1, 0.4431373, 1,
-0.324188, 0.2950905, -0.7579767, 0, 1, 0.4470588, 1,
-0.3240257, 0.5469918, -0.2875714, 0, 1, 0.454902, 1,
-0.3238403, -0.202757, -1.218332, 0, 1, 0.4588235, 1,
-0.3228468, -0.8612322, -3.67795, 0, 1, 0.4666667, 1,
-0.321612, 0.480007, -1.886173, 0, 1, 0.4705882, 1,
-0.3156378, 0.1650375, -0.4250752, 0, 1, 0.4784314, 1,
-0.3125227, -0.5123851, -1.23907, 0, 1, 0.4823529, 1,
-0.3120196, 0.6794865, -0.6941525, 0, 1, 0.4901961, 1,
-0.3108602, -0.361725, -3.082271, 0, 1, 0.4941176, 1,
-0.307296, 0.5121182, 0.9735792, 0, 1, 0.5019608, 1,
-0.2992378, -1.338718, -3.992692, 0, 1, 0.509804, 1,
-0.29853, 1.02291, -1.26344, 0, 1, 0.5137255, 1,
-0.2959767, 0.4839195, 0.2353466, 0, 1, 0.5215687, 1,
-0.2935807, 1.173409, -0.3452364, 0, 1, 0.5254902, 1,
-0.2898346, -0.5137082, -2.93078, 0, 1, 0.5333334, 1,
-0.2867994, 0.5938998, 0.2768378, 0, 1, 0.5372549, 1,
-0.2855871, -0.7755593, -3.993494, 0, 1, 0.5450981, 1,
-0.270932, -1.157248, -3.260074, 0, 1, 0.5490196, 1,
-0.268781, -1.024486, -3.60728, 0, 1, 0.5568628, 1,
-0.2526014, -1.863815, -1.864569, 0, 1, 0.5607843, 1,
-0.2514618, 1.86463, -1.84968, 0, 1, 0.5686275, 1,
-0.2498482, -0.710625, -3.467181, 0, 1, 0.572549, 1,
-0.2483696, 0.5165136, -0.8096403, 0, 1, 0.5803922, 1,
-0.2448196, -1.379223, -2.957468, 0, 1, 0.5843138, 1,
-0.2299417, -0.8340675, -3.391284, 0, 1, 0.5921569, 1,
-0.228257, 0.9083649, 0.03117738, 0, 1, 0.5960785, 1,
-0.2252578, 0.3938061, -1.484828, 0, 1, 0.6039216, 1,
-0.2231057, 1.223766, -1.32689, 0, 1, 0.6117647, 1,
-0.2225661, 0.01794784, -1.333955, 0, 1, 0.6156863, 1,
-0.2205503, 0.03276582, -3.091887, 0, 1, 0.6235294, 1,
-0.2203875, -0.5471114, -1.402895, 0, 1, 0.627451, 1,
-0.2166371, -0.05109649, -3.087544, 0, 1, 0.6352941, 1,
-0.2135305, 0.8973463, 0.6085474, 0, 1, 0.6392157, 1,
-0.2113099, -1.314556, -3.272615, 0, 1, 0.6470588, 1,
-0.2062425, 0.8747929, -0.9180291, 0, 1, 0.6509804, 1,
-0.2046816, 0.2554568, -0.375967, 0, 1, 0.6588235, 1,
-0.2045604, 0.2655443, -1.693252, 0, 1, 0.6627451, 1,
-0.2011583, -0.5603497, -2.870183, 0, 1, 0.6705883, 1,
-0.1999679, -0.6943427, -3.162732, 0, 1, 0.6745098, 1,
-0.1962332, -1.18083, -4.34459, 0, 1, 0.682353, 1,
-0.1946629, 0.4167861, 0.3043509, 0, 1, 0.6862745, 1,
-0.1938788, -2.391882, -2.144336, 0, 1, 0.6941177, 1,
-0.188441, -0.1864295, -3.292973, 0, 1, 0.7019608, 1,
-0.1837479, -0.3656587, -1.091911, 0, 1, 0.7058824, 1,
-0.1820325, 0.009260756, -1.203407, 0, 1, 0.7137255, 1,
-0.1815252, 0.6725881, -0.2530654, 0, 1, 0.7176471, 1,
-0.1783704, 0.8171068, 0.4735422, 0, 1, 0.7254902, 1,
-0.1753129, -0.4773605, -2.471007, 0, 1, 0.7294118, 1,
-0.1748185, -1.092288, -4.440183, 0, 1, 0.7372549, 1,
-0.1732582, -0.9986925, -3.49139, 0, 1, 0.7411765, 1,
-0.1728534, 1.685564, 1.892066, 0, 1, 0.7490196, 1,
-0.169123, -0.2015617, -0.3928589, 0, 1, 0.7529412, 1,
-0.1679593, 0.06599449, -0.7538844, 0, 1, 0.7607843, 1,
-0.1673599, -0.4538352, -1.401551, 0, 1, 0.7647059, 1,
-0.1669074, 0.6216449, 0.09516101, 0, 1, 0.772549, 1,
-0.1667629, 1.939918, -1.069821, 0, 1, 0.7764706, 1,
-0.1600913, 1.471165, 1.879609, 0, 1, 0.7843137, 1,
-0.1581864, -0.4712447, -2.435322, 0, 1, 0.7882353, 1,
-0.1579335, 0.2134087, -2.10149, 0, 1, 0.7960784, 1,
-0.1574066, 0.1385637, -1.495891, 0, 1, 0.8039216, 1,
-0.1548648, 0.6735788, 0.2348393, 0, 1, 0.8078431, 1,
-0.1529544, -0.9395865, -1.060864, 0, 1, 0.8156863, 1,
-0.1506695, 0.43436, -1.315597, 0, 1, 0.8196079, 1,
-0.1499177, -1.608644, -4.059036, 0, 1, 0.827451, 1,
-0.1491724, 0.7162939, 0.5844035, 0, 1, 0.8313726, 1,
-0.1443372, 1.152338, -1.479003, 0, 1, 0.8392157, 1,
-0.1393809, -0.2968017, -2.361001, 0, 1, 0.8431373, 1,
-0.1371536, 0.09937201, -2.480899, 0, 1, 0.8509804, 1,
-0.1366953, 2.266787, 1.131201, 0, 1, 0.854902, 1,
-0.1348224, -2.154434, -2.723195, 0, 1, 0.8627451, 1,
-0.1271643, 0.807332, 2.160753, 0, 1, 0.8666667, 1,
-0.1261436, -0.2479535, -2.535866, 0, 1, 0.8745098, 1,
-0.1258875, -1.72464, -3.899809, 0, 1, 0.8784314, 1,
-0.1229186, 0.2405112, -0.3311441, 0, 1, 0.8862745, 1,
-0.1222429, 2.548242, 0.2848509, 0, 1, 0.8901961, 1,
-0.12037, 0.6059384, -0.2129786, 0, 1, 0.8980392, 1,
-0.1176088, 0.2814771, -1.15866, 0, 1, 0.9058824, 1,
-0.1175251, 0.05886801, -2.236874, 0, 1, 0.9098039, 1,
-0.1152563, 1.13408, 0.07361228, 0, 1, 0.9176471, 1,
-0.1135878, 1.147771, -3.305061, 0, 1, 0.9215686, 1,
-0.1076682, 0.4204664, 1.537707, 0, 1, 0.9294118, 1,
-0.1035721, 1.157893, 1.921368, 0, 1, 0.9333333, 1,
-0.1026352, -0.9467068, -3.290006, 0, 1, 0.9411765, 1,
-0.1014652, -0.748354, -3.181943, 0, 1, 0.945098, 1,
-0.1003799, -0.292224, -1.396442, 0, 1, 0.9529412, 1,
-0.09205265, -0.5174186, -3.667973, 0, 1, 0.9568627, 1,
-0.08973211, -0.6470947, -3.703068, 0, 1, 0.9647059, 1,
-0.08587472, 0.4127739, 0.7844608, 0, 1, 0.9686275, 1,
-0.08535161, -1.49866, -4.905205, 0, 1, 0.9764706, 1,
-0.08520695, -0.4104726, -2.711288, 0, 1, 0.9803922, 1,
-0.07889578, -1.196834, -2.338339, 0, 1, 0.9882353, 1,
-0.0786911, -0.6709265, -3.266178, 0, 1, 0.9921569, 1,
-0.07760136, 0.1830039, -1.902901, 0, 1, 1, 1,
-0.0774394, 0.8769195, -0.935582, 0, 0.9921569, 1, 1,
-0.07722428, 0.401201, -0.03375522, 0, 0.9882353, 1, 1,
-0.07649936, 1.725165, 0.8153164, 0, 0.9803922, 1, 1,
-0.06917296, 1.123206, -1.360222, 0, 0.9764706, 1, 1,
-0.06410106, 0.050894, 0.6213962, 0, 0.9686275, 1, 1,
-0.06315268, 0.04461863, -0.04953043, 0, 0.9647059, 1, 1,
-0.05869251, 1.290788, 0.74518, 0, 0.9568627, 1, 1,
-0.05067124, 0.06960851, -1.312277, 0, 0.9529412, 1, 1,
-0.05038518, -0.03253413, -2.584496, 0, 0.945098, 1, 1,
-0.0468507, -1.029499, -4.420033, 0, 0.9411765, 1, 1,
-0.04353622, -0.1178261, -4.541182, 0, 0.9333333, 1, 1,
-0.04061098, 0.7508693, -0.6553665, 0, 0.9294118, 1, 1,
-0.03945787, 0.3393904, -1.310687, 0, 0.9215686, 1, 1,
-0.03784931, 1.039541, 1.682869, 0, 0.9176471, 1, 1,
-0.03573012, 2.904268, 0.1816362, 0, 0.9098039, 1, 1,
-0.0355622, 1.350477, 0.5311121, 0, 0.9058824, 1, 1,
-0.03430021, 0.7189511, 0.8910617, 0, 0.8980392, 1, 1,
-0.02487624, 0.4143788, -0.3243138, 0, 0.8901961, 1, 1,
-0.01955246, -0.3494789, -2.706772, 0, 0.8862745, 1, 1,
-0.01204062, 1.843247, 0.2909184, 0, 0.8784314, 1, 1,
-0.01173514, 1.5922, 0.3143087, 0, 0.8745098, 1, 1,
-0.009630687, -1.741398, -1.701902, 0, 0.8666667, 1, 1,
-0.004610169, -1.079116, -4.214448, 0, 0.8627451, 1, 1,
-0.003440012, -0.9363992, -3.356884, 0, 0.854902, 1, 1,
-0.003416409, 0.7769307, -0.30875, 0, 0.8509804, 1, 1,
-0.001460253, 0.7526097, 0.2908266, 0, 0.8431373, 1, 1,
-0.001035176, -0.2431248, -3.864949, 0, 0.8392157, 1, 1,
-0.0002989625, 0.6327657, 0.0487689, 0, 0.8313726, 1, 1,
0.003906517, 1.302624, 0.8239647, 0, 0.827451, 1, 1,
0.009401697, 0.1315348, -0.5323257, 0, 0.8196079, 1, 1,
0.01032215, 0.7895325, 1.673017, 0, 0.8156863, 1, 1,
0.01162272, -0.4683621, 2.039791, 0, 0.8078431, 1, 1,
0.01318708, -1.280581, 6.797053, 0, 0.8039216, 1, 1,
0.01589567, -1.201007, 4.124915, 0, 0.7960784, 1, 1,
0.0196973, -0.5082216, 4.140074, 0, 0.7882353, 1, 1,
0.02373521, 0.3849194, -0.4055826, 0, 0.7843137, 1, 1,
0.02604043, 1.122716, 0.9683785, 0, 0.7764706, 1, 1,
0.02697383, -0.4728497, 3.75057, 0, 0.772549, 1, 1,
0.03079062, -2.121513, 3.669216, 0, 0.7647059, 1, 1,
0.03479657, -1.240314, 4.061769, 0, 0.7607843, 1, 1,
0.04201903, 0.3612413, -0.4919962, 0, 0.7529412, 1, 1,
0.0432532, -1.595896, 4.09477, 0, 0.7490196, 1, 1,
0.04723907, 1.24725, -0.5484143, 0, 0.7411765, 1, 1,
0.04821821, 0.08975191, -0.5223627, 0, 0.7372549, 1, 1,
0.04857479, 0.04759091, 1.384681, 0, 0.7294118, 1, 1,
0.05202746, 0.4019379, 1.804207, 0, 0.7254902, 1, 1,
0.05233905, 0.5773978, -0.01161031, 0, 0.7176471, 1, 1,
0.05597021, -1.329205, 3.795412, 0, 0.7137255, 1, 1,
0.05628276, -1.523288, 2.80103, 0, 0.7058824, 1, 1,
0.05705345, -0.7878141, 3.628108, 0, 0.6980392, 1, 1,
0.06062445, 0.1346814, 1.516373, 0, 0.6941177, 1, 1,
0.06921996, -0.7950337, 2.08112, 0, 0.6862745, 1, 1,
0.07109532, -0.8278518, 1.441483, 0, 0.682353, 1, 1,
0.07392469, 1.359187, -1.293353, 0, 0.6745098, 1, 1,
0.07473613, 0.2656054, 1.785607, 0, 0.6705883, 1, 1,
0.07484879, 0.1983141, 0.5071213, 0, 0.6627451, 1, 1,
0.07628275, 0.5905356, -1.319057, 0, 0.6588235, 1, 1,
0.07861628, -2.324907, 3.625441, 0, 0.6509804, 1, 1,
0.07933641, 0.2121061, 1.054201, 0, 0.6470588, 1, 1,
0.08134846, -0.1615521, 2.306858, 0, 0.6392157, 1, 1,
0.08780542, 1.807153, -1.96943, 0, 0.6352941, 1, 1,
0.09053437, 0.8325968, 0.2779348, 0, 0.627451, 1, 1,
0.09381193, -0.2556343, 3.558277, 0, 0.6235294, 1, 1,
0.1005921, 0.3632247, 0.9733329, 0, 0.6156863, 1, 1,
0.1044946, 0.1585024, 0.7086734, 0, 0.6117647, 1, 1,
0.1062943, 0.4196641, -0.7764594, 0, 0.6039216, 1, 1,
0.1109676, -0.1323887, 2.589402, 0, 0.5960785, 1, 1,
0.1154549, -0.3487578, 2.054, 0, 0.5921569, 1, 1,
0.1162883, -0.3031854, 4.909119, 0, 0.5843138, 1, 1,
0.1184429, -0.2552534, 1.237561, 0, 0.5803922, 1, 1,
0.1185929, -0.4070062, 3.480457, 0, 0.572549, 1, 1,
0.1189375, 0.7875342, 1.206798, 0, 0.5686275, 1, 1,
0.1215607, 0.07694418, 0.04261975, 0, 0.5607843, 1, 1,
0.1295107, -1.885005, 1.566346, 0, 0.5568628, 1, 1,
0.1319553, -0.5853825, 3.433862, 0, 0.5490196, 1, 1,
0.1330294, -1.403147, 2.644378, 0, 0.5450981, 1, 1,
0.1435574, 0.9645109, -2.602952, 0, 0.5372549, 1, 1,
0.1557497, 0.2729771, -0.0008993704, 0, 0.5333334, 1, 1,
0.1599869, -0.8540492, 3.595793, 0, 0.5254902, 1, 1,
0.1600659, 1.207403, 0.05147128, 0, 0.5215687, 1, 1,
0.1615889, -0.1427733, 3.299445, 0, 0.5137255, 1, 1,
0.1624261, 0.6386224, 1.542201, 0, 0.509804, 1, 1,
0.1652322, 1.025277, 0.03101101, 0, 0.5019608, 1, 1,
0.1657054, 1.298809, 1.30178, 0, 0.4941176, 1, 1,
0.1664515, 0.4287118, 0.2876373, 0, 0.4901961, 1, 1,
0.1669115, -2.200266, 1.921466, 0, 0.4823529, 1, 1,
0.1726119, 0.4051594, 0.4042716, 0, 0.4784314, 1, 1,
0.1742291, 0.4994498, -0.7633183, 0, 0.4705882, 1, 1,
0.1766938, -0.4961209, 2.2597, 0, 0.4666667, 1, 1,
0.1800843, 0.8957617, -0.8770437, 0, 0.4588235, 1, 1,
0.1803051, -1.408679, 3.224782, 0, 0.454902, 1, 1,
0.1809628, 0.491499, 2.142739, 0, 0.4470588, 1, 1,
0.1844078, -0.2826165, 0.2779553, 0, 0.4431373, 1, 1,
0.1847811, -0.8199807, 4.002072, 0, 0.4352941, 1, 1,
0.1857294, 1.012503, 2.489633, 0, 0.4313726, 1, 1,
0.1865662, 0.6352032, -1.162601, 0, 0.4235294, 1, 1,
0.1877656, -0.4603541, 3.681835, 0, 0.4196078, 1, 1,
0.1880085, 0.4497581, 1.926752, 0, 0.4117647, 1, 1,
0.1890426, -0.8148816, 4.125327, 0, 0.4078431, 1, 1,
0.192755, -0.1397192, 0.5568464, 0, 0.4, 1, 1,
0.1944898, 0.2200436, 2.339674, 0, 0.3921569, 1, 1,
0.1958736, 0.0105109, 1.318044, 0, 0.3882353, 1, 1,
0.1986656, -0.533259, 0.3149411, 0, 0.3803922, 1, 1,
0.1987745, -0.62087, 1.038019, 0, 0.3764706, 1, 1,
0.2011082, -0.07320051, 2.041997, 0, 0.3686275, 1, 1,
0.2021998, 0.1516012, 1.767885, 0, 0.3647059, 1, 1,
0.2026219, -0.07701478, 2.293869, 0, 0.3568628, 1, 1,
0.2062681, 0.5734588, -0.1113305, 0, 0.3529412, 1, 1,
0.2120153, 1.391959, -0.115757, 0, 0.345098, 1, 1,
0.2164034, -0.8437333, 1.661345, 0, 0.3411765, 1, 1,
0.2170626, -0.04508958, 1.969201, 0, 0.3333333, 1, 1,
0.2174941, -0.5429435, 1.482607, 0, 0.3294118, 1, 1,
0.2203898, 0.8269772, -1.899643, 0, 0.3215686, 1, 1,
0.22519, 0.3769094, 0.9643044, 0, 0.3176471, 1, 1,
0.227546, 0.09268773, 1.793759, 0, 0.3098039, 1, 1,
0.2345654, -1.40957, 3.575507, 0, 0.3058824, 1, 1,
0.2374007, -0.3413534, 2.86291, 0, 0.2980392, 1, 1,
0.2428881, -0.6706274, 3.746032, 0, 0.2901961, 1, 1,
0.2433612, -0.7483135, 3.049823, 0, 0.2862745, 1, 1,
0.2434069, -0.3316054, 3.72068, 0, 0.2784314, 1, 1,
0.2444455, -0.2143316, 1.711444, 0, 0.2745098, 1, 1,
0.2481035, -0.08386102, 1.292049, 0, 0.2666667, 1, 1,
0.2597879, -1.743566, 1.736194, 0, 0.2627451, 1, 1,
0.2599348, -1.44392, 0.6410029, 0, 0.254902, 1, 1,
0.2609941, -0.1572556, 0.5272925, 0, 0.2509804, 1, 1,
0.26206, -0.4786308, 3.02915, 0, 0.2431373, 1, 1,
0.2624235, -1.079417, 3.268222, 0, 0.2392157, 1, 1,
0.2634935, 1.303608, -0.05172213, 0, 0.2313726, 1, 1,
0.2659837, 0.264393, 1.810326, 0, 0.227451, 1, 1,
0.2676621, -0.128816, 1.113925, 0, 0.2196078, 1, 1,
0.2718943, -0.410946, 3.142332, 0, 0.2156863, 1, 1,
0.278277, -0.4400144, 2.819366, 0, 0.2078431, 1, 1,
0.2850995, 0.8834813, -1.733296, 0, 0.2039216, 1, 1,
0.2877901, 1.002112, -0.4272222, 0, 0.1960784, 1, 1,
0.29441, -0.1415551, 2.136804, 0, 0.1882353, 1, 1,
0.2969282, -0.3882137, 2.671466, 0, 0.1843137, 1, 1,
0.3092327, -1.191299, 4.314488, 0, 0.1764706, 1, 1,
0.3092493, -0.440066, 0.8193762, 0, 0.172549, 1, 1,
0.3157682, -0.4248332, 2.020236, 0, 0.1647059, 1, 1,
0.3173315, 2.387131, 1.230412, 0, 0.1607843, 1, 1,
0.3179642, 1.040379, -1.061326, 0, 0.1529412, 1, 1,
0.3227943, 0.4211693, 0.2248524, 0, 0.1490196, 1, 1,
0.3246884, 0.6342062, -1.006498, 0, 0.1411765, 1, 1,
0.3263626, -0.3270148, 3.577498, 0, 0.1372549, 1, 1,
0.32645, 0.5713285, 0.8491336, 0, 0.1294118, 1, 1,
0.3297466, -0.1244531, 1.607029, 0, 0.1254902, 1, 1,
0.3313702, -0.8627536, 3.053584, 0, 0.1176471, 1, 1,
0.3321418, 0.7625582, 0.009899369, 0, 0.1137255, 1, 1,
0.3360038, -0.1344802, 3.188044, 0, 0.1058824, 1, 1,
0.3388861, 0.3106152, 2.083103, 0, 0.09803922, 1, 1,
0.3422229, -0.8876609, 3.499316, 0, 0.09411765, 1, 1,
0.3443034, 0.4271463, 1.532121, 0, 0.08627451, 1, 1,
0.3448467, -0.3234879, 3.889611, 0, 0.08235294, 1, 1,
0.346283, -0.4222785, 2.844846, 0, 0.07450981, 1, 1,
0.3473843, -0.07958897, 1.922351, 0, 0.07058824, 1, 1,
0.351448, -1.383586, 2.941426, 0, 0.0627451, 1, 1,
0.3528632, 0.8136978, -0.06021269, 0, 0.05882353, 1, 1,
0.3567396, 0.6867126, 0.4831714, 0, 0.05098039, 1, 1,
0.3569939, 0.3317528, 2.134541, 0, 0.04705882, 1, 1,
0.3579174, 0.2712198, -1.217562, 0, 0.03921569, 1, 1,
0.3627764, 0.6347024, 0.2729119, 0, 0.03529412, 1, 1,
0.3669865, 1.431074, -0.01455183, 0, 0.02745098, 1, 1,
0.367282, 0.7785332, 0.2681915, 0, 0.02352941, 1, 1,
0.3676316, 0.4495543, 0.7827023, 0, 0.01568628, 1, 1,
0.3690493, -0.3183596, 2.026827, 0, 0.01176471, 1, 1,
0.3696777, 0.1876046, 2.250832, 0, 0.003921569, 1, 1,
0.3840018, -0.4081788, 3.337824, 0.003921569, 0, 1, 1,
0.3867187, -0.7554274, 2.39065, 0.007843138, 0, 1, 1,
0.3901398, 1.834801, 0.5930147, 0.01568628, 0, 1, 1,
0.3903662, 0.2492892, 0.88886, 0.01960784, 0, 1, 1,
0.3929134, 2.236235, 1.481415, 0.02745098, 0, 1, 1,
0.3933313, 1.600606, 2.195966, 0.03137255, 0, 1, 1,
0.3938266, -0.5492625, 1.383488, 0.03921569, 0, 1, 1,
0.4016643, -0.7513398, 4.22972, 0.04313726, 0, 1, 1,
0.4052194, 0.5273694, 1.384818, 0.05098039, 0, 1, 1,
0.4094121, -0.7574432, 3.274113, 0.05490196, 0, 1, 1,
0.4109936, 0.5738974, 0.1892842, 0.0627451, 0, 1, 1,
0.412182, 0.4210929, -0.9163896, 0.06666667, 0, 1, 1,
0.4167486, -2.337189, 1.941085, 0.07450981, 0, 1, 1,
0.4259559, 1.609693, 1.836981, 0.07843138, 0, 1, 1,
0.4448265, 2.325145, 1.021265, 0.08627451, 0, 1, 1,
0.4466455, 0.3591357, -1.035483, 0.09019608, 0, 1, 1,
0.4482578, -0.09696384, 1.885505, 0.09803922, 0, 1, 1,
0.4506339, 0.1149317, -0.6023285, 0.1058824, 0, 1, 1,
0.4508432, -0.8141048, 3.391701, 0.1098039, 0, 1, 1,
0.4530315, -2.259695, 2.467679, 0.1176471, 0, 1, 1,
0.4555269, 1.235301, 0.4247667, 0.1215686, 0, 1, 1,
0.4582246, -1.091605, 3.192428, 0.1294118, 0, 1, 1,
0.4623578, 0.9061488, 0.841536, 0.1333333, 0, 1, 1,
0.4718925, 0.1145554, -0.07905684, 0.1411765, 0, 1, 1,
0.4733726, 1.401011, 1.597855, 0.145098, 0, 1, 1,
0.4735744, -1.421788, 3.541558, 0.1529412, 0, 1, 1,
0.4793937, -0.360324, 2.106534, 0.1568628, 0, 1, 1,
0.4824744, 0.2918591, 2.481259, 0.1647059, 0, 1, 1,
0.4935249, -1.379295, 0.1910998, 0.1686275, 0, 1, 1,
0.4960243, -0.02460643, 1.178196, 0.1764706, 0, 1, 1,
0.497236, -0.2947251, 3.115241, 0.1803922, 0, 1, 1,
0.49872, -0.2361665, 2.39327, 0.1882353, 0, 1, 1,
0.4987643, -0.4757697, 2.891932, 0.1921569, 0, 1, 1,
0.5042039, -0.5118788, 3.034863, 0.2, 0, 1, 1,
0.5121683, -0.1865856, 1.69145, 0.2078431, 0, 1, 1,
0.520829, -0.2312811, 3.522767, 0.2117647, 0, 1, 1,
0.5217158, 2.432255, 1.023353, 0.2196078, 0, 1, 1,
0.5223092, 1.172674, 0.2849286, 0.2235294, 0, 1, 1,
0.5236198, -1.90277, 4.68529, 0.2313726, 0, 1, 1,
0.5259266, 0.9284504, 0.9809259, 0.2352941, 0, 1, 1,
0.5280904, 0.06236136, 2.141709, 0.2431373, 0, 1, 1,
0.5296952, 1.125708, -0.3487626, 0.2470588, 0, 1, 1,
0.5339987, 1.80982, -1.394697, 0.254902, 0, 1, 1,
0.5368285, -0.1767459, 2.356027, 0.2588235, 0, 1, 1,
0.5396592, -0.1913108, 1.109634, 0.2666667, 0, 1, 1,
0.5408333, -1.070941, 2.858318, 0.2705882, 0, 1, 1,
0.5416782, -0.9575875, 3.546834, 0.2784314, 0, 1, 1,
0.5421654, 1.13831, 0.161296, 0.282353, 0, 1, 1,
0.5528091, 0.5120259, 2.108484, 0.2901961, 0, 1, 1,
0.5548612, 2.220293, 0.7676683, 0.2941177, 0, 1, 1,
0.5578303, 0.2662792, 2.215541, 0.3019608, 0, 1, 1,
0.5581651, -0.9537205, 2.264246, 0.3098039, 0, 1, 1,
0.5626043, 0.176026, -0.7538531, 0.3137255, 0, 1, 1,
0.5660216, -0.2336618, 2.359564, 0.3215686, 0, 1, 1,
0.56611, 0.4799211, 0.6090626, 0.3254902, 0, 1, 1,
0.5750681, -1.678548, 3.054659, 0.3333333, 0, 1, 1,
0.5769489, 2.131108, 0.1431066, 0.3372549, 0, 1, 1,
0.5785297, 1.980228, -0.4105268, 0.345098, 0, 1, 1,
0.5788618, 0.6070572, -0.3252115, 0.3490196, 0, 1, 1,
0.5877552, 0.2356214, 3.270126, 0.3568628, 0, 1, 1,
0.5878763, 1.097977, -0.4418213, 0.3607843, 0, 1, 1,
0.5892791, 1.270719, -0.1318648, 0.3686275, 0, 1, 1,
0.5916958, 1.427319, 0.1682273, 0.372549, 0, 1, 1,
0.5926551, -0.3233096, 1.614102, 0.3803922, 0, 1, 1,
0.6003574, 0.2306482, 2.40805, 0.3843137, 0, 1, 1,
0.6099287, -1.089169, 2.407822, 0.3921569, 0, 1, 1,
0.6108614, 0.8081539, 0.5176945, 0.3960784, 0, 1, 1,
0.6133073, 0.2694767, 3.284554, 0.4039216, 0, 1, 1,
0.6159154, 0.8467174, 1.035851, 0.4117647, 0, 1, 1,
0.6237649, 0.1123939, 0.9765229, 0.4156863, 0, 1, 1,
0.6297335, -0.6217023, 3.33305, 0.4235294, 0, 1, 1,
0.6302975, -0.8937873, 2.176595, 0.427451, 0, 1, 1,
0.6356689, 0.01000329, 2.265702, 0.4352941, 0, 1, 1,
0.6396804, 0.5543714, 0.4551931, 0.4392157, 0, 1, 1,
0.641573, 1.325666, -1.267943, 0.4470588, 0, 1, 1,
0.6457605, 0.8386125, 0.01737691, 0.4509804, 0, 1, 1,
0.647324, -0.2639652, 3.200794, 0.4588235, 0, 1, 1,
0.6494056, -0.4562212, 2.587456, 0.4627451, 0, 1, 1,
0.6566142, 0.8967496, -0.09455658, 0.4705882, 0, 1, 1,
0.6580287, 0.1257279, 1.666177, 0.4745098, 0, 1, 1,
0.6656262, -0.7119585, 0.4045828, 0.4823529, 0, 1, 1,
0.6662997, -0.7472128, 2.059041, 0.4862745, 0, 1, 1,
0.6674303, 0.6113806, 0.2563351, 0.4941176, 0, 1, 1,
0.6717225, -0.6894574, 2.579989, 0.5019608, 0, 1, 1,
0.6745121, -0.6918504, 3.75287, 0.5058824, 0, 1, 1,
0.6747298, -1.021495, 2.837422, 0.5137255, 0, 1, 1,
0.6796404, -1.394822, 3.609498, 0.5176471, 0, 1, 1,
0.6798251, 0.648607, -0.2457294, 0.5254902, 0, 1, 1,
0.6842186, -0.5686278, 2.371061, 0.5294118, 0, 1, 1,
0.6871647, 0.6742707, 2.302375, 0.5372549, 0, 1, 1,
0.690264, 1.690469, 0.7945932, 0.5411765, 0, 1, 1,
0.6919847, -1.427877, 4.691824, 0.5490196, 0, 1, 1,
0.6931511, 0.2136966, 2.490543, 0.5529412, 0, 1, 1,
0.6949383, -1.472142, 2.629121, 0.5607843, 0, 1, 1,
0.7149931, -0.4014423, 3.137613, 0.5647059, 0, 1, 1,
0.7157962, 0.1374319, 0.4943018, 0.572549, 0, 1, 1,
0.7180245, 0.429635, 0.6184046, 0.5764706, 0, 1, 1,
0.7232571, -0.5655791, 1.852528, 0.5843138, 0, 1, 1,
0.7248818, -2.60649, 3.346848, 0.5882353, 0, 1, 1,
0.7262304, 0.06453747, 1.423509, 0.5960785, 0, 1, 1,
0.7270126, 0.2139634, 0.6867518, 0.6039216, 0, 1, 1,
0.7317055, 0.7839555, 1.120125, 0.6078432, 0, 1, 1,
0.7356291, 0.3987051, 1.170116, 0.6156863, 0, 1, 1,
0.7377292, -0.5098878, 1.721295, 0.6196079, 0, 1, 1,
0.7392886, 0.7374915, -1.147692, 0.627451, 0, 1, 1,
0.7408113, -0.8385492, 1.792592, 0.6313726, 0, 1, 1,
0.7473773, -0.2120049, 2.89343, 0.6392157, 0, 1, 1,
0.7488938, 0.2314103, 1.557852, 0.6431373, 0, 1, 1,
0.7500778, -0.4643172, 2.504715, 0.6509804, 0, 1, 1,
0.7529646, -0.5374814, 1.406997, 0.654902, 0, 1, 1,
0.7551609, -1.048587, -0.03939056, 0.6627451, 0, 1, 1,
0.7579944, 0.3481362, -0.4350031, 0.6666667, 0, 1, 1,
0.7691533, -0.2499305, 2.834162, 0.6745098, 0, 1, 1,
0.7702993, -1.143794, 1.071091, 0.6784314, 0, 1, 1,
0.775898, 0.5433847, 2.056879, 0.6862745, 0, 1, 1,
0.7764276, 0.0633944, 0.4742418, 0.6901961, 0, 1, 1,
0.7821925, 1.648166, 0.06736182, 0.6980392, 0, 1, 1,
0.7832154, 1.304679, -0.07410918, 0.7058824, 0, 1, 1,
0.7876241, -1.00561, 0.4614711, 0.7098039, 0, 1, 1,
0.7932215, 0.7076389, 2.071116, 0.7176471, 0, 1, 1,
0.7955482, 0.4260183, 1.641288, 0.7215686, 0, 1, 1,
0.7997438, 1.004108, 0.7572919, 0.7294118, 0, 1, 1,
0.8033341, -0.9496418, 3.699382, 0.7333333, 0, 1, 1,
0.816573, 1.266541, 1.765112, 0.7411765, 0, 1, 1,
0.8222176, 0.5327273, 0.5542119, 0.7450981, 0, 1, 1,
0.8261245, -0.5462596, 2.56319, 0.7529412, 0, 1, 1,
0.8271317, -0.9837272, 2.840613, 0.7568628, 0, 1, 1,
0.8287057, 0.3550619, 1.564041, 0.7647059, 0, 1, 1,
0.8312979, -0.01196409, 2.335361, 0.7686275, 0, 1, 1,
0.8335988, 0.4412526, 2.064087, 0.7764706, 0, 1, 1,
0.840692, 1.583046, 1.340874, 0.7803922, 0, 1, 1,
0.8489342, -0.3451668, 0.7540975, 0.7882353, 0, 1, 1,
0.849439, -0.1301304, 1.201311, 0.7921569, 0, 1, 1,
0.8568571, -0.2684445, 2.576317, 0.8, 0, 1, 1,
0.8609657, -0.5566449, 2.16011, 0.8078431, 0, 1, 1,
0.8627357, -2.71137, 4.145483, 0.8117647, 0, 1, 1,
0.8708116, -0.1420247, 2.384104, 0.8196079, 0, 1, 1,
0.8733041, 0.1486089, 2.686919, 0.8235294, 0, 1, 1,
0.8803606, 0.6336042, -1.326814, 0.8313726, 0, 1, 1,
0.8831954, 0.3603273, -0.9711173, 0.8352941, 0, 1, 1,
0.8838824, -0.7107467, 1.484876, 0.8431373, 0, 1, 1,
0.8864301, -1.039006, 2.962623, 0.8470588, 0, 1, 1,
0.889163, -0.3135909, 1.615957, 0.854902, 0, 1, 1,
0.8893928, -0.8763911, 1.722363, 0.8588235, 0, 1, 1,
0.894196, -0.9796537, 2.658357, 0.8666667, 0, 1, 1,
0.8947232, -0.1816747, 1.174562, 0.8705882, 0, 1, 1,
0.8963677, 0.9438351, 1.463519, 0.8784314, 0, 1, 1,
0.9007458, -0.6644124, 2.759177, 0.8823529, 0, 1, 1,
0.9061516, -0.3476624, -0.4022626, 0.8901961, 0, 1, 1,
0.9107389, 0.4589625, 0.5097163, 0.8941177, 0, 1, 1,
0.9163426, 0.9028082, 0.1161929, 0.9019608, 0, 1, 1,
0.9182099, -0.575731, 1.277202, 0.9098039, 0, 1, 1,
0.9219293, -0.2798099, 2.121999, 0.9137255, 0, 1, 1,
0.9228169, 0.1284983, -0.5686837, 0.9215686, 0, 1, 1,
0.9312561, -0.1111265, 0.4379258, 0.9254902, 0, 1, 1,
0.9346612, -1.281211, 1.429241, 0.9333333, 0, 1, 1,
0.9359444, -0.7622838, 0.9319469, 0.9372549, 0, 1, 1,
0.9383852, -1.567303, 2.374116, 0.945098, 0, 1, 1,
0.9482312, -0.429715, 2.022371, 0.9490196, 0, 1, 1,
0.9491976, 0.1660707, 1.927947, 0.9568627, 0, 1, 1,
0.949898, -0.7127617, 1.095115, 0.9607843, 0, 1, 1,
0.9533554, 0.7117648, 1.576229, 0.9686275, 0, 1, 1,
0.9550101, 0.8024845, 0.5998821, 0.972549, 0, 1, 1,
0.9559067, 0.1550341, 0.9417465, 0.9803922, 0, 1, 1,
0.9648636, -0.3261601, 0.2895988, 0.9843137, 0, 1, 1,
0.9769835, -1.584539, 1.86112, 0.9921569, 0, 1, 1,
0.9789549, -1.401284, 2.627563, 0.9960784, 0, 1, 1,
0.9813581, -0.1472319, -0.9683307, 1, 0, 0.9960784, 1,
0.987841, 0.8598724, 1.466357, 1, 0, 0.9882353, 1,
0.9897316, -2.24259, 3.490928, 1, 0, 0.9843137, 1,
0.9939286, -0.6703444, 2.206027, 1, 0, 0.9764706, 1,
0.9995735, 0.5281355, 0.5069891, 1, 0, 0.972549, 1,
1.001911, 0.5827692, 0.5008944, 1, 0, 0.9647059, 1,
1.009215, 0.4222988, 3.183825, 1, 0, 0.9607843, 1,
1.009489, 1.503258, 1.498314, 1, 0, 0.9529412, 1,
1.010277, 0.08382384, 1.22364, 1, 0, 0.9490196, 1,
1.030173, -0.5502051, 1.883225, 1, 0, 0.9411765, 1,
1.032684, 0.2310344, 1.853443, 1, 0, 0.9372549, 1,
1.033395, -1.226468, 0.8520346, 1, 0, 0.9294118, 1,
1.035253, -2.169247, 3.101336, 1, 0, 0.9254902, 1,
1.03692, -0.2766677, 3.474828, 1, 0, 0.9176471, 1,
1.045319, -0.01610563, -0.2924001, 1, 0, 0.9137255, 1,
1.047444, -0.7489497, 2.166476, 1, 0, 0.9058824, 1,
1.051317, 0.4968989, 1.026949, 1, 0, 0.9019608, 1,
1.054849, -0.144313, 0.8371533, 1, 0, 0.8941177, 1,
1.056352, 2.262801, 0.08014618, 1, 0, 0.8862745, 1,
1.05869, -0.6758385, 2.454741, 1, 0, 0.8823529, 1,
1.06214, -0.4613458, 2.894257, 1, 0, 0.8745098, 1,
1.062833, -0.05321882, 1.507002, 1, 0, 0.8705882, 1,
1.072749, -1.173079, 1.955508, 1, 0, 0.8627451, 1,
1.07953, 0.9077207, -1.401045, 1, 0, 0.8588235, 1,
1.079545, -1.421431, 1.511696, 1, 0, 0.8509804, 1,
1.081778, -2.34223, 2.516402, 1, 0, 0.8470588, 1,
1.085587, -0.553888, 3.734102, 1, 0, 0.8392157, 1,
1.100925, 0.2628796, 1.163862, 1, 0, 0.8352941, 1,
1.101733, -1.04712, 2.119278, 1, 0, 0.827451, 1,
1.102866, -1.371304, 1.069535, 1, 0, 0.8235294, 1,
1.107679, 1.28534, 0.09237324, 1, 0, 0.8156863, 1,
1.112985, -1.205592, 2.035473, 1, 0, 0.8117647, 1,
1.114662, -1.903327, 1.362083, 1, 0, 0.8039216, 1,
1.120294, 2.042707, -0.3299725, 1, 0, 0.7960784, 1,
1.131049, -0.8408301, 2.793489, 1, 0, 0.7921569, 1,
1.140557, -2.104167, 2.200303, 1, 0, 0.7843137, 1,
1.141256, 0.6776356, 1.142899, 1, 0, 0.7803922, 1,
1.159548, -1.934314, 4.05779, 1, 0, 0.772549, 1,
1.169839, 1.318434, -0.7223191, 1, 0, 0.7686275, 1,
1.172218, 0.2615032, 1.21831, 1, 0, 0.7607843, 1,
1.175189, -1.538298, 1.519053, 1, 0, 0.7568628, 1,
1.180636, 0.1899347, 0.3901723, 1, 0, 0.7490196, 1,
1.185524, -0.8018326, 3.938893, 1, 0, 0.7450981, 1,
1.187296, 0.5573888, 0.8841396, 1, 0, 0.7372549, 1,
1.188514, 0.08653685, 1.265708, 1, 0, 0.7333333, 1,
1.189309, 0.272905, 0.3150963, 1, 0, 0.7254902, 1,
1.195457, 0.4953256, 1.505358, 1, 0, 0.7215686, 1,
1.199662, -1.300365, 3.980816, 1, 0, 0.7137255, 1,
1.207422, 0.8434493, 2.210387, 1, 0, 0.7098039, 1,
1.207666, 1.518264, 0.299884, 1, 0, 0.7019608, 1,
1.231505, 0.5118499, 2.001252, 1, 0, 0.6941177, 1,
1.233068, 0.0868836, 2.57239, 1, 0, 0.6901961, 1,
1.247458, 1.112775, -0.6722391, 1, 0, 0.682353, 1,
1.251561, 2.029133, 0.5361931, 1, 0, 0.6784314, 1,
1.254551, 0.2572193, 1.754951, 1, 0, 0.6705883, 1,
1.255998, 0.03826233, 3.134697, 1, 0, 0.6666667, 1,
1.258128, 0.218535, 1.042035, 1, 0, 0.6588235, 1,
1.261577, 0.9885176, 0.3378629, 1, 0, 0.654902, 1,
1.265114, -0.2756876, 2.093431, 1, 0, 0.6470588, 1,
1.269428, -1.94208, 2.558201, 1, 0, 0.6431373, 1,
1.275083, 1.020506, -0.2216692, 1, 0, 0.6352941, 1,
1.296023, -1.028184, 1.110887, 1, 0, 0.6313726, 1,
1.296707, 0.5892422, 1.029588, 1, 0, 0.6235294, 1,
1.299214, -0.7582756, 2.130565, 1, 0, 0.6196079, 1,
1.304793, 0.220785, 1.692454, 1, 0, 0.6117647, 1,
1.307204, -1.365201, 1.857695, 1, 0, 0.6078432, 1,
1.30788, -0.5797564, 0.3806777, 1, 0, 0.6, 1,
1.310643, -0.3939654, 1.636089, 1, 0, 0.5921569, 1,
1.314119, -0.5567312, 3.794754, 1, 0, 0.5882353, 1,
1.322936, -1.519359, 1.483088, 1, 0, 0.5803922, 1,
1.322987, -0.40724, 0.01855646, 1, 0, 0.5764706, 1,
1.356696, -0.3892271, 1.327269, 1, 0, 0.5686275, 1,
1.367579, -1.150072, 2.131407, 1, 0, 0.5647059, 1,
1.377903, -0.5498192, 1.190593, 1, 0, 0.5568628, 1,
1.381468, -0.03821764, 1.65688, 1, 0, 0.5529412, 1,
1.391896, 1.451001, -0.1280054, 1, 0, 0.5450981, 1,
1.393923, 0.9658747, -2.102172, 1, 0, 0.5411765, 1,
1.417873, 0.2201916, 2.328062, 1, 0, 0.5333334, 1,
1.418162, 1.742813, 0.7776697, 1, 0, 0.5294118, 1,
1.423069, -0.4511521, 1.418012, 1, 0, 0.5215687, 1,
1.423092, 1.552641, 0.1273948, 1, 0, 0.5176471, 1,
1.430723, 0.268362, 2.002085, 1, 0, 0.509804, 1,
1.431546, 0.1777537, 1.691415, 1, 0, 0.5058824, 1,
1.442869, -0.7320018, 1.535869, 1, 0, 0.4980392, 1,
1.454433, 0.1818625, 0.9015414, 1, 0, 0.4901961, 1,
1.461941, 2.034147, 3.036428, 1, 0, 0.4862745, 1,
1.472838, -0.6171585, 2.234926, 1, 0, 0.4784314, 1,
1.475837, -0.5004622, 0.7747675, 1, 0, 0.4745098, 1,
1.476389, 0.6971398, -1.498044, 1, 0, 0.4666667, 1,
1.4792, -1.466374, 1.455473, 1, 0, 0.4627451, 1,
1.501464, -0.8275382, 2.683896, 1, 0, 0.454902, 1,
1.506101, 0.2256163, 1.039, 1, 0, 0.4509804, 1,
1.506761, 0.4588819, 1.373423, 1, 0, 0.4431373, 1,
1.551978, 1.03379, 2.761091, 1, 0, 0.4392157, 1,
1.559826, 0.4651123, 0.1683317, 1, 0, 0.4313726, 1,
1.561749, -0.6050482, 1.023832, 1, 0, 0.427451, 1,
1.561897, 1.785912, 2.544179, 1, 0, 0.4196078, 1,
1.567847, 0.7324417, 1.283897, 1, 0, 0.4156863, 1,
1.56965, 0.6517158, 1.576793, 1, 0, 0.4078431, 1,
1.580796, -1.896365, 1.971878, 1, 0, 0.4039216, 1,
1.586925, 0.4582046, 0.9067506, 1, 0, 0.3960784, 1,
1.592696, -0.5138538, 2.265091, 1, 0, 0.3882353, 1,
1.610942, 1.094163, 3.5932, 1, 0, 0.3843137, 1,
1.637128, 0.4799236, 2.690412, 1, 0, 0.3764706, 1,
1.63899, 1.239963, 1.321893, 1, 0, 0.372549, 1,
1.652912, -0.2187206, 1.62593, 1, 0, 0.3647059, 1,
1.654683, -0.3600209, 3.267013, 1, 0, 0.3607843, 1,
1.658315, 1.063649, 1.452321, 1, 0, 0.3529412, 1,
1.661469, 0.4568186, 1.38431, 1, 0, 0.3490196, 1,
1.665305, -0.3028043, 1.291469, 1, 0, 0.3411765, 1,
1.665831, -1.759777, 0.8571289, 1, 0, 0.3372549, 1,
1.675249, -0.2440556, 1.497643, 1, 0, 0.3294118, 1,
1.684256, -0.4432391, 4.075747, 1, 0, 0.3254902, 1,
1.686096, -0.2037019, 3.041199, 1, 0, 0.3176471, 1,
1.696386, 1.787804, 3.891348, 1, 0, 0.3137255, 1,
1.699846, 1.086719, 0.7119204, 1, 0, 0.3058824, 1,
1.707677, -0.04722536, 2.340012, 1, 0, 0.2980392, 1,
1.712107, -0.8661351, 2.142168, 1, 0, 0.2941177, 1,
1.717871, 0.9821073, 0.1842587, 1, 0, 0.2862745, 1,
1.722347, 1.184877, 1.649125, 1, 0, 0.282353, 1,
1.726842, 0.07361429, 3.585256, 1, 0, 0.2745098, 1,
1.731325, -0.3372197, 2.132154, 1, 0, 0.2705882, 1,
1.74314, -0.8545231, 2.290365, 1, 0, 0.2627451, 1,
1.752696, -0.8049549, 2.038952, 1, 0, 0.2588235, 1,
1.764478, -0.6610829, 3.376234, 1, 0, 0.2509804, 1,
1.765522, 0.8244118, 2.13277, 1, 0, 0.2470588, 1,
1.775653, 0.2655592, 2.306951, 1, 0, 0.2392157, 1,
1.781514, -1.506672, 2.762707, 1, 0, 0.2352941, 1,
1.79218, -1.148832, 1.117229, 1, 0, 0.227451, 1,
1.793801, 0.08776885, 3.394298, 1, 0, 0.2235294, 1,
1.804269, 1.79921, 0.8193066, 1, 0, 0.2156863, 1,
1.805542, -0.2511702, 1.316281, 1, 0, 0.2117647, 1,
1.807223, -1.205074, 2.214817, 1, 0, 0.2039216, 1,
1.820512, 1.543295, 0.7734969, 1, 0, 0.1960784, 1,
1.823435, 2.026268, 0.7365316, 1, 0, 0.1921569, 1,
1.84336, -0.6387025, 1.600255, 1, 0, 0.1843137, 1,
1.846345, 0.7893648, 1.121752, 1, 0, 0.1803922, 1,
1.862222, 0.8709045, 0.9795175, 1, 0, 0.172549, 1,
1.868634, 0.01474936, 2.496236, 1, 0, 0.1686275, 1,
1.875754, -1.60304, 1.280775, 1, 0, 0.1607843, 1,
1.877943, -0.6810368, 2.996323, 1, 0, 0.1568628, 1,
1.94858, -0.4463278, 0.9804947, 1, 0, 0.1490196, 1,
1.950458, 2.132435, -0.07024708, 1, 0, 0.145098, 1,
1.9554, -0.4468733, 2.641275, 1, 0, 0.1372549, 1,
1.966404, -0.415723, 1.73272, 1, 0, 0.1333333, 1,
1.974409, -1.190852, 2.694192, 1, 0, 0.1254902, 1,
1.984863, 0.1379528, -0.1189489, 1, 0, 0.1215686, 1,
1.99406, 0.3353498, 1.914222, 1, 0, 0.1137255, 1,
2.044319, -0.3470826, 1.096272, 1, 0, 0.1098039, 1,
2.063079, -0.8946129, 2.734754, 1, 0, 0.1019608, 1,
2.068599, 0.4374461, 2.940094, 1, 0, 0.09411765, 1,
2.070033, 0.5094613, 2.156326, 1, 0, 0.09019608, 1,
2.143131, -1.447619, 2.610512, 1, 0, 0.08235294, 1,
2.181372, 3.660308, 1.063833, 1, 0, 0.07843138, 1,
2.206449, 0.6909516, 1.863522, 1, 0, 0.07058824, 1,
2.222345, -0.5236203, 0.2319166, 1, 0, 0.06666667, 1,
2.270393, 0.1082266, 2.047104, 1, 0, 0.05882353, 1,
2.387991, 0.2157117, 1.891025, 1, 0, 0.05490196, 1,
2.470356, 0.8682693, 3.555581, 1, 0, 0.04705882, 1,
2.474295, -1.806801, 2.045771, 1, 0, 0.04313726, 1,
2.620571, 1.054791, -1.201138, 1, 0, 0.03529412, 1,
2.632974, 0.1826561, 0.2201463, 1, 0, 0.03137255, 1,
2.946948, -1.21424, 0.6702168, 1, 0, 0.02352941, 1,
3.111231, 0.455474, -0.03184939, 1, 0, 0.01960784, 1,
3.254334, 0.9120002, 2.657817, 1, 0, 0.01176471, 1,
3.519425, -0.04142384, 1.922492, 1, 0, 0.007843138, 1
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
0.09020352, -3.791369, -6.888738, 0, -0.5, 0.5, 0.5,
0.09020352, -3.791369, -6.888738, 1, -0.5, 0.5, 0.5,
0.09020352, -3.791369, -6.888738, 1, 1.5, 0.5, 0.5,
0.09020352, -3.791369, -6.888738, 0, 1.5, 0.5, 0.5
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
-4.501523, 0.4744689, -6.888738, 0, -0.5, 0.5, 0.5,
-4.501523, 0.4744689, -6.888738, 1, -0.5, 0.5, 0.5,
-4.501523, 0.4744689, -6.888738, 1, 1.5, 0.5, 0.5,
-4.501523, 0.4744689, -6.888738, 0, 1.5, 0.5, 0.5
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
-4.501523, -3.791369, 0.945924, 0, -0.5, 0.5, 0.5,
-4.501523, -3.791369, 0.945924, 1, -0.5, 0.5, 0.5,
-4.501523, -3.791369, 0.945924, 1, 1.5, 0.5, 0.5,
-4.501523, -3.791369, 0.945924, 0, 1.5, 0.5, 0.5
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
-3, -2.806945, -5.080739,
3, -2.806945, -5.080739,
-3, -2.806945, -5.080739,
-3, -2.971016, -5.382072,
-2, -2.806945, -5.080739,
-2, -2.971016, -5.382072,
-1, -2.806945, -5.080739,
-1, -2.971016, -5.382072,
0, -2.806945, -5.080739,
0, -2.971016, -5.382072,
1, -2.806945, -5.080739,
1, -2.971016, -5.382072,
2, -2.806945, -5.080739,
2, -2.971016, -5.382072,
3, -2.806945, -5.080739,
3, -2.971016, -5.382072
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
-3, -3.299157, -5.984738, 0, -0.5, 0.5, 0.5,
-3, -3.299157, -5.984738, 1, -0.5, 0.5, 0.5,
-3, -3.299157, -5.984738, 1, 1.5, 0.5, 0.5,
-3, -3.299157, -5.984738, 0, 1.5, 0.5, 0.5,
-2, -3.299157, -5.984738, 0, -0.5, 0.5, 0.5,
-2, -3.299157, -5.984738, 1, -0.5, 0.5, 0.5,
-2, -3.299157, -5.984738, 1, 1.5, 0.5, 0.5,
-2, -3.299157, -5.984738, 0, 1.5, 0.5, 0.5,
-1, -3.299157, -5.984738, 0, -0.5, 0.5, 0.5,
-1, -3.299157, -5.984738, 1, -0.5, 0.5, 0.5,
-1, -3.299157, -5.984738, 1, 1.5, 0.5, 0.5,
-1, -3.299157, -5.984738, 0, 1.5, 0.5, 0.5,
0, -3.299157, -5.984738, 0, -0.5, 0.5, 0.5,
0, -3.299157, -5.984738, 1, -0.5, 0.5, 0.5,
0, -3.299157, -5.984738, 1, 1.5, 0.5, 0.5,
0, -3.299157, -5.984738, 0, 1.5, 0.5, 0.5,
1, -3.299157, -5.984738, 0, -0.5, 0.5, 0.5,
1, -3.299157, -5.984738, 1, -0.5, 0.5, 0.5,
1, -3.299157, -5.984738, 1, 1.5, 0.5, 0.5,
1, -3.299157, -5.984738, 0, 1.5, 0.5, 0.5,
2, -3.299157, -5.984738, 0, -0.5, 0.5, 0.5,
2, -3.299157, -5.984738, 1, -0.5, 0.5, 0.5,
2, -3.299157, -5.984738, 1, 1.5, 0.5, 0.5,
2, -3.299157, -5.984738, 0, 1.5, 0.5, 0.5,
3, -3.299157, -5.984738, 0, -0.5, 0.5, 0.5,
3, -3.299157, -5.984738, 1, -0.5, 0.5, 0.5,
3, -3.299157, -5.984738, 1, 1.5, 0.5, 0.5,
3, -3.299157, -5.984738, 0, 1.5, 0.5, 0.5
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
-3.441894, -2, -5.080739,
-3.441894, 3, -5.080739,
-3.441894, -2, -5.080739,
-3.618499, -2, -5.382072,
-3.441894, -1, -5.080739,
-3.618499, -1, -5.382072,
-3.441894, 0, -5.080739,
-3.618499, 0, -5.382072,
-3.441894, 1, -5.080739,
-3.618499, 1, -5.382072,
-3.441894, 2, -5.080739,
-3.618499, 2, -5.382072,
-3.441894, 3, -5.080739,
-3.618499, 3, -5.382072
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
-3.971709, -2, -5.984738, 0, -0.5, 0.5, 0.5,
-3.971709, -2, -5.984738, 1, -0.5, 0.5, 0.5,
-3.971709, -2, -5.984738, 1, 1.5, 0.5, 0.5,
-3.971709, -2, -5.984738, 0, 1.5, 0.5, 0.5,
-3.971709, -1, -5.984738, 0, -0.5, 0.5, 0.5,
-3.971709, -1, -5.984738, 1, -0.5, 0.5, 0.5,
-3.971709, -1, -5.984738, 1, 1.5, 0.5, 0.5,
-3.971709, -1, -5.984738, 0, 1.5, 0.5, 0.5,
-3.971709, 0, -5.984738, 0, -0.5, 0.5, 0.5,
-3.971709, 0, -5.984738, 1, -0.5, 0.5, 0.5,
-3.971709, 0, -5.984738, 1, 1.5, 0.5, 0.5,
-3.971709, 0, -5.984738, 0, 1.5, 0.5, 0.5,
-3.971709, 1, -5.984738, 0, -0.5, 0.5, 0.5,
-3.971709, 1, -5.984738, 1, -0.5, 0.5, 0.5,
-3.971709, 1, -5.984738, 1, 1.5, 0.5, 0.5,
-3.971709, 1, -5.984738, 0, 1.5, 0.5, 0.5,
-3.971709, 2, -5.984738, 0, -0.5, 0.5, 0.5,
-3.971709, 2, -5.984738, 1, -0.5, 0.5, 0.5,
-3.971709, 2, -5.984738, 1, 1.5, 0.5, 0.5,
-3.971709, 2, -5.984738, 0, 1.5, 0.5, 0.5,
-3.971709, 3, -5.984738, 0, -0.5, 0.5, 0.5,
-3.971709, 3, -5.984738, 1, -0.5, 0.5, 0.5,
-3.971709, 3, -5.984738, 1, 1.5, 0.5, 0.5,
-3.971709, 3, -5.984738, 0, 1.5, 0.5, 0.5
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
-3.441894, -2.806945, -4,
-3.441894, -2.806945, 6,
-3.441894, -2.806945, -4,
-3.618499, -2.971016, -4,
-3.441894, -2.806945, -2,
-3.618499, -2.971016, -2,
-3.441894, -2.806945, 0,
-3.618499, -2.971016, 0,
-3.441894, -2.806945, 2,
-3.618499, -2.971016, 2,
-3.441894, -2.806945, 4,
-3.618499, -2.971016, 4,
-3.441894, -2.806945, 6,
-3.618499, -2.971016, 6
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
"4",
"6"
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
-3.971709, -3.299157, -4, 0, -0.5, 0.5, 0.5,
-3.971709, -3.299157, -4, 1, -0.5, 0.5, 0.5,
-3.971709, -3.299157, -4, 1, 1.5, 0.5, 0.5,
-3.971709, -3.299157, -4, 0, 1.5, 0.5, 0.5,
-3.971709, -3.299157, -2, 0, -0.5, 0.5, 0.5,
-3.971709, -3.299157, -2, 1, -0.5, 0.5, 0.5,
-3.971709, -3.299157, -2, 1, 1.5, 0.5, 0.5,
-3.971709, -3.299157, -2, 0, 1.5, 0.5, 0.5,
-3.971709, -3.299157, 0, 0, -0.5, 0.5, 0.5,
-3.971709, -3.299157, 0, 1, -0.5, 0.5, 0.5,
-3.971709, -3.299157, 0, 1, 1.5, 0.5, 0.5,
-3.971709, -3.299157, 0, 0, 1.5, 0.5, 0.5,
-3.971709, -3.299157, 2, 0, -0.5, 0.5, 0.5,
-3.971709, -3.299157, 2, 1, -0.5, 0.5, 0.5,
-3.971709, -3.299157, 2, 1, 1.5, 0.5, 0.5,
-3.971709, -3.299157, 2, 0, 1.5, 0.5, 0.5,
-3.971709, -3.299157, 4, 0, -0.5, 0.5, 0.5,
-3.971709, -3.299157, 4, 1, -0.5, 0.5, 0.5,
-3.971709, -3.299157, 4, 1, 1.5, 0.5, 0.5,
-3.971709, -3.299157, 4, 0, 1.5, 0.5, 0.5,
-3.971709, -3.299157, 6, 0, -0.5, 0.5, 0.5,
-3.971709, -3.299157, 6, 1, -0.5, 0.5, 0.5,
-3.971709, -3.299157, 6, 1, 1.5, 0.5, 0.5,
-3.971709, -3.299157, 6, 0, 1.5, 0.5, 0.5
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
-3.441894, -2.806945, -5.080739,
-3.441894, 3.755883, -5.080739,
-3.441894, -2.806945, 6.972587,
-3.441894, 3.755883, 6.972587,
-3.441894, -2.806945, -5.080739,
-3.441894, -2.806945, 6.972587,
-3.441894, 3.755883, -5.080739,
-3.441894, 3.755883, 6.972587,
-3.441894, -2.806945, -5.080739,
3.622301, -2.806945, -5.080739,
-3.441894, -2.806945, 6.972587,
3.622301, -2.806945, 6.972587,
-3.441894, 3.755883, -5.080739,
3.622301, 3.755883, -5.080739,
-3.441894, 3.755883, 6.972587,
3.622301, 3.755883, 6.972587,
3.622301, -2.806945, -5.080739,
3.622301, 3.755883, -5.080739,
3.622301, -2.806945, 6.972587,
3.622301, 3.755883, 6.972587,
3.622301, -2.806945, -5.080739,
3.622301, -2.806945, 6.972587,
3.622301, 3.755883, -5.080739,
3.622301, 3.755883, 6.972587
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
var radius = 8.242284;
var distance = 36.67086;
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
mvMatrix.translate( -0.09020352, -0.4744689, -0.945924 );
mvMatrix.scale( 1.261533, 1.357908, 0.7393577 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.67086);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
mefenpyr-diethyl<-read.table("mefenpyr-diethyl.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-mefenpyr-diethyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'mefenpyr' not found
```

```r
y<-mefenpyr-diethyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'mefenpyr' not found
```

```r
z<-mefenpyr-diethyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'mefenpyr' not found
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
-3.339018, 0.115172, -1.251143, 0, 0, 1, 1, 1,
-2.966925, 0.4773917, -1.906889, 1, 0, 0, 1, 1,
-2.830653, 0.1499552, -4.193886, 1, 0, 0, 1, 1,
-2.826315, -0.2986043, -1.646749, 1, 0, 0, 1, 1,
-2.632921, -1.438744, -0.1700727, 1, 0, 0, 1, 1,
-2.617346, -0.05806011, -3.115469, 1, 0, 0, 1, 1,
-2.422805, 0.9413906, -0.4866843, 0, 0, 0, 1, 1,
-2.411436, -0.8125019, -2.429702, 0, 0, 0, 1, 1,
-2.36008, 0.3122283, -1.279402, 0, 0, 0, 1, 1,
-2.326911, -0.3324552, 0.1076045, 0, 0, 0, 1, 1,
-2.297322, -0.3197343, -2.183157, 0, 0, 0, 1, 1,
-2.267136, 0.6021163, -0.9913853, 0, 0, 0, 1, 1,
-2.259219, 1.717249, -0.2140948, 0, 0, 0, 1, 1,
-2.186839, -1.130306, -0.7662188, 1, 1, 1, 1, 1,
-2.154758, 0.7286851, -0.3067003, 1, 1, 1, 1, 1,
-2.072996, -0.8711445, -2.104154, 1, 1, 1, 1, 1,
-2.04335, -1.822379, -3.155609, 1, 1, 1, 1, 1,
-1.984119, 0.8882006, -3.158575, 1, 1, 1, 1, 1,
-1.980831, 0.9134797, -0.2310945, 1, 1, 1, 1, 1,
-1.955106, 1.318491, -0.3589779, 1, 1, 1, 1, 1,
-1.944199, -0.005646026, -1.688607, 1, 1, 1, 1, 1,
-1.931404, 0.6441503, -2.540991, 1, 1, 1, 1, 1,
-1.920009, 0.1064584, -1.434704, 1, 1, 1, 1, 1,
-1.916823, -1.799421, -2.244303, 1, 1, 1, 1, 1,
-1.874427, -0.3883592, -2.14035, 1, 1, 1, 1, 1,
-1.864973, -0.6626241, -0.6669927, 1, 1, 1, 1, 1,
-1.858607, -1.049705, -2.107264, 1, 1, 1, 1, 1,
-1.855464, -0.7638423, -3.193606, 1, 1, 1, 1, 1,
-1.848834, 0.1601791, -2.274617, 0, 0, 1, 1, 1,
-1.827757, 2.141075, -1.534419, 1, 0, 0, 1, 1,
-1.810531, 1.129775, -1.570134, 1, 0, 0, 1, 1,
-1.803642, -0.6126506, -0.7276211, 1, 0, 0, 1, 1,
-1.787997, -0.8614128, -0.7486904, 1, 0, 0, 1, 1,
-1.77174, 0.7267677, -1.961715, 1, 0, 0, 1, 1,
-1.764416, -1.635891, -1.144652, 0, 0, 0, 1, 1,
-1.759257, -0.6392223, -0.6601171, 0, 0, 0, 1, 1,
-1.729547, -0.1229845, -1.763385, 0, 0, 0, 1, 1,
-1.725905, 2.096587, -2.216648, 0, 0, 0, 1, 1,
-1.722683, -0.7966082, -0.932919, 0, 0, 0, 1, 1,
-1.720445, 1.316972, -2.597044, 0, 0, 0, 1, 1,
-1.717943, -1.481008, -1.676406, 0, 0, 0, 1, 1,
-1.708012, 0.8288224, -2.482727, 1, 1, 1, 1, 1,
-1.698781, 0.4290684, -0.3375007, 1, 1, 1, 1, 1,
-1.69616, -0.8478385, -1.884785, 1, 1, 1, 1, 1,
-1.687539, 0.877046, -0.898854, 1, 1, 1, 1, 1,
-1.685128, 2.046731, 0.7368098, 1, 1, 1, 1, 1,
-1.680613, 0.1193792, -1.831072, 1, 1, 1, 1, 1,
-1.67363, -0.2845302, -2.520909, 1, 1, 1, 1, 1,
-1.629857, 0.03185843, -1.689459, 1, 1, 1, 1, 1,
-1.616788, -1.263447, -2.620219, 1, 1, 1, 1, 1,
-1.609762, -1.037286, -1.837803, 1, 1, 1, 1, 1,
-1.601637, 0.1747465, -0.5852007, 1, 1, 1, 1, 1,
-1.597732, -0.2387073, -0.6209824, 1, 1, 1, 1, 1,
-1.594493, -0.6067652, -2.281037, 1, 1, 1, 1, 1,
-1.589517, 0.1290119, -2.985518, 1, 1, 1, 1, 1,
-1.58619, 2.115891, -2.104486, 1, 1, 1, 1, 1,
-1.576363, 0.8043477, 0.328243, 0, 0, 1, 1, 1,
-1.575921, 1.308983, -0.1979343, 1, 0, 0, 1, 1,
-1.574432, -2.058491, -2.403363, 1, 0, 0, 1, 1,
-1.57179, -0.3285132, -1.482724, 1, 0, 0, 1, 1,
-1.555365, 0.4603631, -2.127853, 1, 0, 0, 1, 1,
-1.542872, 1.040821, -0.8449784, 1, 0, 0, 1, 1,
-1.526163, 0.2746814, -0.2947155, 0, 0, 0, 1, 1,
-1.524737, 2.478515, -0.9970732, 0, 0, 0, 1, 1,
-1.522128, -0.8735129, -3.075422, 0, 0, 0, 1, 1,
-1.509207, 1.076376, -2.068573, 0, 0, 0, 1, 1,
-1.506392, -0.00483384, -0.03074957, 0, 0, 0, 1, 1,
-1.503799, -0.5818716, -0.7307813, 0, 0, 0, 1, 1,
-1.487953, -0.8414618, -1.39261, 0, 0, 0, 1, 1,
-1.48499, 0.884489, 0.4108462, 1, 1, 1, 1, 1,
-1.483793, 0.8199294, 1.171475, 1, 1, 1, 1, 1,
-1.481459, 0.6697969, -0.856591, 1, 1, 1, 1, 1,
-1.475878, 0.7261907, -0.9317973, 1, 1, 1, 1, 1,
-1.47489, 0.8125965, -1.700291, 1, 1, 1, 1, 1,
-1.461852, -1.477292, -2.133284, 1, 1, 1, 1, 1,
-1.446977, 2.763423, -0.02253973, 1, 1, 1, 1, 1,
-1.43812, -0.2382797, -2.091963, 1, 1, 1, 1, 1,
-1.413564, -1.439174, -1.763968, 1, 1, 1, 1, 1,
-1.398869, -0.9635473, -2.446114, 1, 1, 1, 1, 1,
-1.388792, -0.141144, -2.529646, 1, 1, 1, 1, 1,
-1.387002, -0.01674439, -0.6981684, 1, 1, 1, 1, 1,
-1.376187, 0.5678598, -2.864176, 1, 1, 1, 1, 1,
-1.370968, 0.522779, 0.4071316, 1, 1, 1, 1, 1,
-1.366073, 0.2959567, -1.927191, 1, 1, 1, 1, 1,
-1.36519, -1.09512, -3.196011, 0, 0, 1, 1, 1,
-1.352455, -0.7283899, -2.399109, 1, 0, 0, 1, 1,
-1.344233, -0.9321886, -0.7633613, 1, 0, 0, 1, 1,
-1.343384, 0.2284682, -0.396771, 1, 0, 0, 1, 1,
-1.32807, 1.005805, -1.278725, 1, 0, 0, 1, 1,
-1.312056, 0.2902781, -0.8598091, 1, 0, 0, 1, 1,
-1.309598, 0.2578669, -0.1481209, 0, 0, 0, 1, 1,
-1.305389, -1.303704, -1.86385, 0, 0, 0, 1, 1,
-1.304375, 1.160874, -0.1845954, 0, 0, 0, 1, 1,
-1.304078, 0.2378616, -1.87289, 0, 0, 0, 1, 1,
-1.302383, -1.695075, -3.594054, 0, 0, 0, 1, 1,
-1.301431, 0.1556764, -0.9851296, 0, 0, 0, 1, 1,
-1.300755, -0.2798584, -1.079177, 0, 0, 0, 1, 1,
-1.29899, 1.490539, 0.1564529, 1, 1, 1, 1, 1,
-1.296274, -0.06151911, -1.661221, 1, 1, 1, 1, 1,
-1.28812, -0.7265873, -2.316856, 1, 1, 1, 1, 1,
-1.283969, -0.7402064, -1.743105, 1, 1, 1, 1, 1,
-1.283812, -1.664162, -2.492181, 1, 1, 1, 1, 1,
-1.282461, -0.1636262, -2.648013, 1, 1, 1, 1, 1,
-1.281203, -0.02984115, -0.9391699, 1, 1, 1, 1, 1,
-1.256237, 0.9438662, -1.799599, 1, 1, 1, 1, 1,
-1.254083, 1.462437, -0.8147625, 1, 1, 1, 1, 1,
-1.250202, 0.7912374, -1.728287, 1, 1, 1, 1, 1,
-1.24815, 0.3763022, 0.6467119, 1, 1, 1, 1, 1,
-1.234902, -1.313988, -3.114461, 1, 1, 1, 1, 1,
-1.227877, 0.04158715, -2.460756, 1, 1, 1, 1, 1,
-1.215576, 0.1915775, -1.368711, 1, 1, 1, 1, 1,
-1.210515, 0.452142, -2.949131, 1, 1, 1, 1, 1,
-1.202103, 0.08212502, -0.04296541, 0, 0, 1, 1, 1,
-1.200425, 0.4014517, -1.748807, 1, 0, 0, 1, 1,
-1.195645, -1.479302, -2.425246, 1, 0, 0, 1, 1,
-1.191148, -0.6608909, -1.809736, 1, 0, 0, 1, 1,
-1.189803, -0.4073626, -0.6545964, 1, 0, 0, 1, 1,
-1.181872, -0.1978599, -2.303535, 1, 0, 0, 1, 1,
-1.179433, 0.6179848, -0.2078857, 0, 0, 0, 1, 1,
-1.179253, -0.7517463, -2.096731, 0, 0, 0, 1, 1,
-1.174755, 1.466534, -1.939882, 0, 0, 0, 1, 1,
-1.167852, -0.1855378, -1.395583, 0, 0, 0, 1, 1,
-1.1656, -0.7020008, -2.888217, 0, 0, 0, 1, 1,
-1.163933, 1.085209, 0.4692476, 0, 0, 0, 1, 1,
-1.159552, 0.8027375, -1.128628, 0, 0, 0, 1, 1,
-1.159272, 1.498337, -0.9081047, 1, 1, 1, 1, 1,
-1.151877, 1.200185, 0.5038059, 1, 1, 1, 1, 1,
-1.142456, -0.01862374, -0.08676726, 1, 1, 1, 1, 1,
-1.133294, 2.145347, -1.044925, 1, 1, 1, 1, 1,
-1.130065, 1.219691, -0.9593747, 1, 1, 1, 1, 1,
-1.129679, 1.275598, -1.486519, 1, 1, 1, 1, 1,
-1.126262, -0.8102834, -1.241448, 1, 1, 1, 1, 1,
-1.124533, 0.02401488, -1.169712, 1, 1, 1, 1, 1,
-1.121157, 2.86375, -0.18244, 1, 1, 1, 1, 1,
-1.119251, -1.21712, -2.249693, 1, 1, 1, 1, 1,
-1.117223, -0.4826548, -1.598369, 1, 1, 1, 1, 1,
-1.115475, -0.2024516, 0.2953276, 1, 1, 1, 1, 1,
-1.113227, -1.053029, -4.050193, 1, 1, 1, 1, 1,
-1.098851, 1.206355, 0.001018704, 1, 1, 1, 1, 1,
-1.087293, 1.009997, -1.748395, 1, 1, 1, 1, 1,
-1.086407, -0.9064686, -1.299001, 0, 0, 1, 1, 1,
-1.082595, 0.8112155, -1.807221, 1, 0, 0, 1, 1,
-1.078057, -1.009013, -4.342729, 1, 0, 0, 1, 1,
-1.060674, -1.510054, -3.312959, 1, 0, 0, 1, 1,
-1.058092, 0.4941018, -2.17033, 1, 0, 0, 1, 1,
-1.057397, 0.3684224, 0.1344961, 1, 0, 0, 1, 1,
-1.05094, 0.4046245, -1.507659, 0, 0, 0, 1, 1,
-1.043476, -1.080817, -2.936865, 0, 0, 0, 1, 1,
-1.042282, -1.106797, -2.824004, 0, 0, 0, 1, 1,
-1.042118, 1.251695, -2.427359, 0, 0, 0, 1, 1,
-1.035032, -2.261618, -2.488697, 0, 0, 0, 1, 1,
-1.034993, -0.1846253, -2.246029, 0, 0, 0, 1, 1,
-1.032045, 0.5040109, -1.539593, 0, 0, 0, 1, 1,
-1.032028, -0.4301403, -1.916864, 1, 1, 1, 1, 1,
-1.029876, 0.295343, -3.394973, 1, 1, 1, 1, 1,
-1.020889, -0.2368771, -1.992321, 1, 1, 1, 1, 1,
-1.019943, 0.7207632, -0.9865049, 1, 1, 1, 1, 1,
-1.018135, -0.6368164, -2.91934, 1, 1, 1, 1, 1,
-1.006635, -0.3395496, -1.643442, 1, 1, 1, 1, 1,
-1.003448, 1.03527, -0.6830239, 1, 1, 1, 1, 1,
-0.9966532, 0.4354018, -3.094405, 1, 1, 1, 1, 1,
-0.9885192, 0.2133771, 0.0548079, 1, 1, 1, 1, 1,
-0.9864336, -0.332985, -2.506898, 1, 1, 1, 1, 1,
-0.9856088, -0.5207136, -0.755079, 1, 1, 1, 1, 1,
-0.9833952, 0.0748263, -1.920112, 1, 1, 1, 1, 1,
-0.9799895, 2.21179, 0.667686, 1, 1, 1, 1, 1,
-0.9786791, -0.1611998, -1.320737, 1, 1, 1, 1, 1,
-0.9775054, 1.965032, 0.5318252, 1, 1, 1, 1, 1,
-0.9766416, 1.217341, -1.795041, 0, 0, 1, 1, 1,
-0.9762982, -1.0523, -1.980355, 1, 0, 0, 1, 1,
-0.9694465, -1.354414, -2.945674, 1, 0, 0, 1, 1,
-0.96939, 1.009229, -0.4590477, 1, 0, 0, 1, 1,
-0.9591594, 1.799076, 0.2359023, 1, 0, 0, 1, 1,
-0.952736, -0.2475363, -0.130846, 1, 0, 0, 1, 1,
-0.9439808, 0.9220051, -2.107747, 0, 0, 0, 1, 1,
-0.9433509, 0.4496418, -2.653935, 0, 0, 0, 1, 1,
-0.9433197, -0.1228563, -2.894834, 0, 0, 0, 1, 1,
-0.9369026, 0.6499444, -0.7306196, 0, 0, 0, 1, 1,
-0.9356306, -0.7626016, -2.944496, 0, 0, 0, 1, 1,
-0.9316594, -0.3738588, -2.75853, 0, 0, 0, 1, 1,
-0.9303716, -0.6157887, -1.89624, 0, 0, 0, 1, 1,
-0.9297817, -1.169572, -1.370656, 1, 1, 1, 1, 1,
-0.9141976, -0.6129116, -2.205905, 1, 1, 1, 1, 1,
-0.9129258, 1.673412, -0.06503948, 1, 1, 1, 1, 1,
-0.9109268, -0.6440949, -3.269679, 1, 1, 1, 1, 1,
-0.9089904, 0.009480844, -0.636642, 1, 1, 1, 1, 1,
-0.8966807, 0.9590628, -2.31089, 1, 1, 1, 1, 1,
-0.8939708, -1.211815, -2.141802, 1, 1, 1, 1, 1,
-0.8906724, -0.1389354, -0.3777847, 1, 1, 1, 1, 1,
-0.8883222, 1.690109, -1.438726, 1, 1, 1, 1, 1,
-0.8845471, 0.2519875, -1.16178, 1, 1, 1, 1, 1,
-0.8814023, -1.276605, -2.116588, 1, 1, 1, 1, 1,
-0.8794626, -0.08732132, 0.4961398, 1, 1, 1, 1, 1,
-0.8768311, -0.264347, -0.2819064, 1, 1, 1, 1, 1,
-0.8758067, 0.2404993, -1.396874, 1, 1, 1, 1, 1,
-0.875669, -0.6544833, -4.074685, 1, 1, 1, 1, 1,
-0.8751177, -0.7241684, -2.619124, 0, 0, 1, 1, 1,
-0.8655313, 1.068078, -1.782612, 1, 0, 0, 1, 1,
-0.8629592, -0.3881062, 0.7064133, 1, 0, 0, 1, 1,
-0.8608099, -1.060219, -1.823193, 1, 0, 0, 1, 1,
-0.8578516, 0.5019324, -2.038126, 1, 0, 0, 1, 1,
-0.8558605, 1.179041, -1.301812, 1, 0, 0, 1, 1,
-0.8553635, -0.06692801, -2.628151, 0, 0, 0, 1, 1,
-0.8530533, -0.3903402, -1.813913, 0, 0, 0, 1, 1,
-0.8526261, 1.885045, -0.4889107, 0, 0, 0, 1, 1,
-0.8469098, 1.560757, -0.4848789, 0, 0, 0, 1, 1,
-0.8439964, -0.0157244, -0.08853807, 0, 0, 0, 1, 1,
-0.842527, -1.667344, -1.658366, 0, 0, 0, 1, 1,
-0.8413011, 0.8614975, -0.07413131, 0, 0, 0, 1, 1,
-0.8377991, 0.4613061, 0.008276792, 1, 1, 1, 1, 1,
-0.8368067, -1.216723, -1.876129, 1, 1, 1, 1, 1,
-0.8355197, 0.4243065, -1.415285, 1, 1, 1, 1, 1,
-0.833788, 0.8842713, -2.696131, 1, 1, 1, 1, 1,
-0.8244259, 0.8662792, -0.7184508, 1, 1, 1, 1, 1,
-0.8239635, 1.813923, -0.4906054, 1, 1, 1, 1, 1,
-0.8226226, 1.266988, -2.27914, 1, 1, 1, 1, 1,
-0.8178723, -0.2335543, -1.014801, 1, 1, 1, 1, 1,
-0.8177421, -0.1685797, -2.410562, 1, 1, 1, 1, 1,
-0.8162371, -0.3688378, -2.010809, 1, 1, 1, 1, 1,
-0.8141632, 0.5061808, -2.188345, 1, 1, 1, 1, 1,
-0.8094581, 1.492371, -0.1264366, 1, 1, 1, 1, 1,
-0.8091301, -0.8957485, -4.210906, 1, 1, 1, 1, 1,
-0.8077632, -1.317501, -2.778253, 1, 1, 1, 1, 1,
-0.8066937, 0.9719002, 1.21273, 1, 1, 1, 1, 1,
-0.8053312, 1.229562, -2.144017, 0, 0, 1, 1, 1,
-0.8048527, 0.3906285, -1.438768, 1, 0, 0, 1, 1,
-0.8032515, -0.1926684, -3.130599, 1, 0, 0, 1, 1,
-0.8019162, -0.417014, -2.348073, 1, 0, 0, 1, 1,
-0.7958531, 1.067162, -1.997432, 1, 0, 0, 1, 1,
-0.7949818, 1.14964, 1.051107, 1, 0, 0, 1, 1,
-0.7902461, -0.8691458, -1.110806, 0, 0, 0, 1, 1,
-0.7889778, 0.2459463, -0.8091206, 0, 0, 0, 1, 1,
-0.7875295, -0.5203089, -2.316157, 0, 0, 0, 1, 1,
-0.7857427, -0.3664103, -2.737811, 0, 0, 0, 1, 1,
-0.784259, 1.03695, -0.4745714, 0, 0, 0, 1, 1,
-0.7736531, 1.181113, 1.182263, 0, 0, 0, 1, 1,
-0.7710042, 0.1703037, -1.235473, 0, 0, 0, 1, 1,
-0.7696655, 0.169116, -0.7964471, 1, 1, 1, 1, 1,
-0.7692345, -0.1464567, -0.2543592, 1, 1, 1, 1, 1,
-0.7679471, -1.104256, -2.282673, 1, 1, 1, 1, 1,
-0.7653331, -1.309293, -1.452568, 1, 1, 1, 1, 1,
-0.755946, -0.3638621, -2.195339, 1, 1, 1, 1, 1,
-0.7530049, -1.323838, -2.875241, 1, 1, 1, 1, 1,
-0.7518117, -0.5273274, -3.381959, 1, 1, 1, 1, 1,
-0.7418673, 0.01928805, -2.358103, 1, 1, 1, 1, 1,
-0.734895, -0.4922138, -0.8716908, 1, 1, 1, 1, 1,
-0.7298432, -0.8100029, -3.375228, 1, 1, 1, 1, 1,
-0.7243539, -0.7611232, -3.197362, 1, 1, 1, 1, 1,
-0.7148628, -1.523977, -3.379771, 1, 1, 1, 1, 1,
-0.714691, -0.5333686, -1.870975, 1, 1, 1, 1, 1,
-0.7132862, 0.9698063, -1.028235, 1, 1, 1, 1, 1,
-0.709187, -0.1812716, -1.728078, 1, 1, 1, 1, 1,
-0.708661, -1.046168, -2.538182, 0, 0, 1, 1, 1,
-0.7075565, 1.258714, -1.247189, 1, 0, 0, 1, 1,
-0.7074227, 0.4591317, -2.022193, 1, 0, 0, 1, 1,
-0.7012123, 1.028497, 1.743737, 1, 0, 0, 1, 1,
-0.6864308, -0.1086038, -1.188766, 1, 0, 0, 1, 1,
-0.6842723, -0.5061228, -2.67905, 1, 0, 0, 1, 1,
-0.6801386, 0.7721103, -0.8900668, 0, 0, 0, 1, 1,
-0.6745814, 1.90223, -0.8439719, 0, 0, 0, 1, 1,
-0.6739646, 1.003435, -0.2133631, 0, 0, 0, 1, 1,
-0.6670982, 0.2462034, -1.971747, 0, 0, 0, 1, 1,
-0.6670303, -0.9230193, -2.728078, 0, 0, 0, 1, 1,
-0.6656855, 1.065275, -0.7721517, 0, 0, 0, 1, 1,
-0.6656544, 0.7261013, 0.2593659, 0, 0, 0, 1, 1,
-0.6648942, -1.201053, -2.701372, 1, 1, 1, 1, 1,
-0.6645783, 0.9992656, 0.03289682, 1, 1, 1, 1, 1,
-0.6627225, -0.8776688, -4.140688, 1, 1, 1, 1, 1,
-0.6614225, -1.006549, -0.2633747, 1, 1, 1, 1, 1,
-0.6607164, -1.026728, -3.025937, 1, 1, 1, 1, 1,
-0.6487768, -1.428009, -1.4067, 1, 1, 1, 1, 1,
-0.648503, -2.128576, -2.779418, 1, 1, 1, 1, 1,
-0.6455736, 0.8134968, -1.655105, 1, 1, 1, 1, 1,
-0.6436712, -0.01781609, 0.1901052, 1, 1, 1, 1, 1,
-0.643231, -0.07862702, -1.908892, 1, 1, 1, 1, 1,
-0.6403725, 0.8691924, 0.760662, 1, 1, 1, 1, 1,
-0.6403059, -0.2831588, -1.044382, 1, 1, 1, 1, 1,
-0.6386386, 0.6366875, -0.6655524, 1, 1, 1, 1, 1,
-0.6380908, -2.508516, -3.440439, 1, 1, 1, 1, 1,
-0.6372138, -0.7851661, -2.805031, 1, 1, 1, 1, 1,
-0.634432, -0.2259855, -3.588463, 0, 0, 1, 1, 1,
-0.6313772, -0.6572737, -3.083283, 1, 0, 0, 1, 1,
-0.6297759, 2.804599, -1.312103, 1, 0, 0, 1, 1,
-0.6293284, 1.547211, -0.9370109, 1, 0, 0, 1, 1,
-0.6235737, -1.283447, -3.344046, 1, 0, 0, 1, 1,
-0.6225492, 1.44975, 0.7557973, 1, 0, 0, 1, 1,
-0.6216093, 0.303614, -0.3917892, 0, 0, 0, 1, 1,
-0.6149685, 0.9251679, -0.3346802, 0, 0, 0, 1, 1,
-0.6123492, 0.02723568, 1.075197, 0, 0, 0, 1, 1,
-0.6107762, 0.8786976, -1.657354, 0, 0, 0, 1, 1,
-0.6070342, -0.1403505, -0.8043357, 0, 0, 0, 1, 1,
-0.6067711, 1.674384, 0.906238, 0, 0, 0, 1, 1,
-0.6058078, 1.720781, 0.8179013, 0, 0, 0, 1, 1,
-0.605505, 1.005192, -0.2851676, 1, 1, 1, 1, 1,
-0.6050144, -0.5784661, -3.294573, 1, 1, 1, 1, 1,
-0.6015025, 0.3734868, -1.082552, 1, 1, 1, 1, 1,
-0.6010933, 0.1335093, -1.213945, 1, 1, 1, 1, 1,
-0.5959291, 0.3137784, -1.405365, 1, 1, 1, 1, 1,
-0.5947865, -0.8730288, -2.750876, 1, 1, 1, 1, 1,
-0.5927565, -0.4429148, -0.2426325, 1, 1, 1, 1, 1,
-0.5915859, -0.07142814, -0.7725384, 1, 1, 1, 1, 1,
-0.5898775, 0.2505739, -0.6427323, 1, 1, 1, 1, 1,
-0.5892318, 0.4575341, -1.720197, 1, 1, 1, 1, 1,
-0.5866687, 0.5609962, 0.7765523, 1, 1, 1, 1, 1,
-0.5859771, 0.555513, -0.8562305, 1, 1, 1, 1, 1,
-0.5832317, 0.6727022, -1.318888, 1, 1, 1, 1, 1,
-0.5821084, 0.2417903, -0.9481194, 1, 1, 1, 1, 1,
-0.5783786, -0.5615032, -3.320153, 1, 1, 1, 1, 1,
-0.577601, -0.9997287, -1.803445, 0, 0, 1, 1, 1,
-0.5734253, -0.9758204, -1.298141, 1, 0, 0, 1, 1,
-0.5697454, 0.8884234, -1.657441, 1, 0, 0, 1, 1,
-0.566959, -0.1659785, -1.620911, 1, 0, 0, 1, 1,
-0.564404, 1.658241, -1.712953, 1, 0, 0, 1, 1,
-0.5574106, -0.07011192, -1.404733, 1, 0, 0, 1, 1,
-0.5573103, 0.3490849, -1.008268, 0, 0, 0, 1, 1,
-0.5520175, 1.47622, 1.102293, 0, 0, 0, 1, 1,
-0.5504171, -1.373824, -1.279887, 0, 0, 0, 1, 1,
-0.5489202, -0.641084, -2.862328, 0, 0, 0, 1, 1,
-0.548315, -2.450106, -2.932633, 0, 0, 0, 1, 1,
-0.5462446, 0.5067114, -0.6649696, 0, 0, 0, 1, 1,
-0.5461968, 0.2616135, -1.275926, 0, 0, 0, 1, 1,
-0.5438734, -2.055128, -2.926353, 1, 1, 1, 1, 1,
-0.5425779, 0.04343681, -1.916848, 1, 1, 1, 1, 1,
-0.542357, 0.1120672, -2.593948, 1, 1, 1, 1, 1,
-0.5419319, -1.375867, -2.732869, 1, 1, 1, 1, 1,
-0.5404837, -0.4885697, -3.293207, 1, 1, 1, 1, 1,
-0.5302234, 0.04649917, -0.6748065, 1, 1, 1, 1, 1,
-0.5197379, -1.856829, -2.887225, 1, 1, 1, 1, 1,
-0.5193804, -0.4744227, -3.068431, 1, 1, 1, 1, 1,
-0.5169089, -0.7255422, -3.455141, 1, 1, 1, 1, 1,
-0.5144731, 0.6392931, 0.3558181, 1, 1, 1, 1, 1,
-0.5141758, 0.3906981, -3.020837, 1, 1, 1, 1, 1,
-0.5134925, -1.468857, -4.002185, 1, 1, 1, 1, 1,
-0.5125706, 0.3146883, -1.023482, 1, 1, 1, 1, 1,
-0.5097802, 0.8167336, -2.282847, 1, 1, 1, 1, 1,
-0.5090924, 1.037852, -1.322917, 1, 1, 1, 1, 1,
-0.5073675, -1.582343, -1.510777, 0, 0, 1, 1, 1,
-0.497709, -0.003150591, -2.829077, 1, 0, 0, 1, 1,
-0.4902769, -0.3449919, -3.268353, 1, 0, 0, 1, 1,
-0.4771625, 0.1263335, -1.712177, 1, 0, 0, 1, 1,
-0.4743949, 0.2210671, -0.3817592, 1, 0, 0, 1, 1,
-0.4723882, 1.377621, 0.7295955, 1, 0, 0, 1, 1,
-0.4722216, -1.23315, -3.15005, 0, 0, 0, 1, 1,
-0.4717988, 0.0378744, -1.627323, 0, 0, 0, 1, 1,
-0.4716977, 0.5598042, -1.997474, 0, 0, 0, 1, 1,
-0.4696233, -0.1388877, -2.306175, 0, 0, 0, 1, 1,
-0.4610796, -0.9370516, -3.965423, 0, 0, 0, 1, 1,
-0.4591653, 0.3837118, -3.399367, 0, 0, 0, 1, 1,
-0.4570044, -0.7307975, -2.042082, 0, 0, 0, 1, 1,
-0.4550798, -1.565796, -2.290734, 1, 1, 1, 1, 1,
-0.4548251, -0.9840407, -1.693213, 1, 1, 1, 1, 1,
-0.4535102, -0.545741, -1.773971, 1, 1, 1, 1, 1,
-0.452242, -0.423741, -2.187287, 1, 1, 1, 1, 1,
-0.45156, 0.1604382, -2.153202, 1, 1, 1, 1, 1,
-0.4514053, 0.03978805, -2.567454, 1, 1, 1, 1, 1,
-0.4498736, -0.9052985, -3.439083, 1, 1, 1, 1, 1,
-0.4496363, 0.3292626, -0.002694421, 1, 1, 1, 1, 1,
-0.4480807, -0.6224793, -2.688859, 1, 1, 1, 1, 1,
-0.4477999, 0.2018114, -1.353269, 1, 1, 1, 1, 1,
-0.4431989, 0.003519505, -0.7333409, 1, 1, 1, 1, 1,
-0.4396352, -0.4586563, -2.316348, 1, 1, 1, 1, 1,
-0.4394951, 0.7813938, 2.31954, 1, 1, 1, 1, 1,
-0.4387844, 1.98271, -0.7206566, 1, 1, 1, 1, 1,
-0.4376493, 0.8479858, 0.4390473, 1, 1, 1, 1, 1,
-0.4367005, 0.0321677, -1.990775, 0, 0, 1, 1, 1,
-0.4353563, 0.4824784, -0.5854475, 1, 0, 0, 1, 1,
-0.4336304, 0.2471749, -1.827324, 1, 0, 0, 1, 1,
-0.4277577, 2.046349, 0.3939663, 1, 0, 0, 1, 1,
-0.4267708, -1.436256, -2.103626, 1, 0, 0, 1, 1,
-0.418147, -0.6598855, -4.182278, 1, 0, 0, 1, 1,
-0.4154181, 0.7607105, 2.583361, 0, 0, 0, 1, 1,
-0.4144037, -0.7141861, -3.208581, 0, 0, 0, 1, 1,
-0.4094677, -1.202482, -2.422675, 0, 0, 0, 1, 1,
-0.4090932, 0.4651711, -1.314214, 0, 0, 0, 1, 1,
-0.4066637, -1.326579, -2.491714, 0, 0, 0, 1, 1,
-0.4022249, -0.7990198, -3.516695, 0, 0, 0, 1, 1,
-0.4006075, -0.2046801, -1.215489, 0, 0, 0, 1, 1,
-0.40058, -0.1537621, -4.17962, 1, 1, 1, 1, 1,
-0.3986365, -1.065549, -2.248319, 1, 1, 1, 1, 1,
-0.3986255, -1.227098, -2.765235, 1, 1, 1, 1, 1,
-0.3980987, -1.566813, -1.419912, 1, 1, 1, 1, 1,
-0.3980958, -0.2452367, -3.853573, 1, 1, 1, 1, 1,
-0.3915617, -1.469161, -2.878636, 1, 1, 1, 1, 1,
-0.3892384, -0.9748504, -3.532327, 1, 1, 1, 1, 1,
-0.3861387, -0.7661216, -2.906255, 1, 1, 1, 1, 1,
-0.3787002, -2.220967, -4.170824, 1, 1, 1, 1, 1,
-0.3772084, 0.06896003, -1.838383, 1, 1, 1, 1, 1,
-0.3756118, -0.08743815, -1.370767, 1, 1, 1, 1, 1,
-0.3740541, -0.7095326, -2.120184, 1, 1, 1, 1, 1,
-0.3690286, 0.2048592, -1.004851, 1, 1, 1, 1, 1,
-0.3646405, 0.7129302, -1.703836, 1, 1, 1, 1, 1,
-0.3608022, 0.228161, -0.9530388, 1, 1, 1, 1, 1,
-0.3568062, 2.545056, -0.3627004, 0, 0, 1, 1, 1,
-0.3567722, -0.4844444, -1.586816, 1, 0, 0, 1, 1,
-0.3563808, 0.1686911, -1.051727, 1, 0, 0, 1, 1,
-0.3551838, -0.7740447, -1.783861, 1, 0, 0, 1, 1,
-0.3490048, 1.118764, -1.939754, 1, 0, 0, 1, 1,
-0.3400216, 1.415135, 0.6677238, 1, 0, 0, 1, 1,
-0.3396984, 0.3203454, -2.656827, 0, 0, 0, 1, 1,
-0.3385672, -1.099727, -1.437299, 0, 0, 0, 1, 1,
-0.337689, -1.096644, -3.10473, 0, 0, 0, 1, 1,
-0.3331267, -0.606084, -0.6742707, 0, 0, 0, 1, 1,
-0.333068, 0.6797013, 1.116515, 0, 0, 0, 1, 1,
-0.3329436, -0.1794108, -1.922036, 0, 0, 0, 1, 1,
-0.3323377, 0.4693731, -1.308461, 0, 0, 0, 1, 1,
-0.3297189, 1.783066, -0.7218544, 1, 1, 1, 1, 1,
-0.3287823, 1.079692, -1.861812, 1, 1, 1, 1, 1,
-0.3246665, 1.4467, 0.5200781, 1, 1, 1, 1, 1,
-0.324188, 0.2950905, -0.7579767, 1, 1, 1, 1, 1,
-0.3240257, 0.5469918, -0.2875714, 1, 1, 1, 1, 1,
-0.3238403, -0.202757, -1.218332, 1, 1, 1, 1, 1,
-0.3228468, -0.8612322, -3.67795, 1, 1, 1, 1, 1,
-0.321612, 0.480007, -1.886173, 1, 1, 1, 1, 1,
-0.3156378, 0.1650375, -0.4250752, 1, 1, 1, 1, 1,
-0.3125227, -0.5123851, -1.23907, 1, 1, 1, 1, 1,
-0.3120196, 0.6794865, -0.6941525, 1, 1, 1, 1, 1,
-0.3108602, -0.361725, -3.082271, 1, 1, 1, 1, 1,
-0.307296, 0.5121182, 0.9735792, 1, 1, 1, 1, 1,
-0.2992378, -1.338718, -3.992692, 1, 1, 1, 1, 1,
-0.29853, 1.02291, -1.26344, 1, 1, 1, 1, 1,
-0.2959767, 0.4839195, 0.2353466, 0, 0, 1, 1, 1,
-0.2935807, 1.173409, -0.3452364, 1, 0, 0, 1, 1,
-0.2898346, -0.5137082, -2.93078, 1, 0, 0, 1, 1,
-0.2867994, 0.5938998, 0.2768378, 1, 0, 0, 1, 1,
-0.2855871, -0.7755593, -3.993494, 1, 0, 0, 1, 1,
-0.270932, -1.157248, -3.260074, 1, 0, 0, 1, 1,
-0.268781, -1.024486, -3.60728, 0, 0, 0, 1, 1,
-0.2526014, -1.863815, -1.864569, 0, 0, 0, 1, 1,
-0.2514618, 1.86463, -1.84968, 0, 0, 0, 1, 1,
-0.2498482, -0.710625, -3.467181, 0, 0, 0, 1, 1,
-0.2483696, 0.5165136, -0.8096403, 0, 0, 0, 1, 1,
-0.2448196, -1.379223, -2.957468, 0, 0, 0, 1, 1,
-0.2299417, -0.8340675, -3.391284, 0, 0, 0, 1, 1,
-0.228257, 0.9083649, 0.03117738, 1, 1, 1, 1, 1,
-0.2252578, 0.3938061, -1.484828, 1, 1, 1, 1, 1,
-0.2231057, 1.223766, -1.32689, 1, 1, 1, 1, 1,
-0.2225661, 0.01794784, -1.333955, 1, 1, 1, 1, 1,
-0.2205503, 0.03276582, -3.091887, 1, 1, 1, 1, 1,
-0.2203875, -0.5471114, -1.402895, 1, 1, 1, 1, 1,
-0.2166371, -0.05109649, -3.087544, 1, 1, 1, 1, 1,
-0.2135305, 0.8973463, 0.6085474, 1, 1, 1, 1, 1,
-0.2113099, -1.314556, -3.272615, 1, 1, 1, 1, 1,
-0.2062425, 0.8747929, -0.9180291, 1, 1, 1, 1, 1,
-0.2046816, 0.2554568, -0.375967, 1, 1, 1, 1, 1,
-0.2045604, 0.2655443, -1.693252, 1, 1, 1, 1, 1,
-0.2011583, -0.5603497, -2.870183, 1, 1, 1, 1, 1,
-0.1999679, -0.6943427, -3.162732, 1, 1, 1, 1, 1,
-0.1962332, -1.18083, -4.34459, 1, 1, 1, 1, 1,
-0.1946629, 0.4167861, 0.3043509, 0, 0, 1, 1, 1,
-0.1938788, -2.391882, -2.144336, 1, 0, 0, 1, 1,
-0.188441, -0.1864295, -3.292973, 1, 0, 0, 1, 1,
-0.1837479, -0.3656587, -1.091911, 1, 0, 0, 1, 1,
-0.1820325, 0.009260756, -1.203407, 1, 0, 0, 1, 1,
-0.1815252, 0.6725881, -0.2530654, 1, 0, 0, 1, 1,
-0.1783704, 0.8171068, 0.4735422, 0, 0, 0, 1, 1,
-0.1753129, -0.4773605, -2.471007, 0, 0, 0, 1, 1,
-0.1748185, -1.092288, -4.440183, 0, 0, 0, 1, 1,
-0.1732582, -0.9986925, -3.49139, 0, 0, 0, 1, 1,
-0.1728534, 1.685564, 1.892066, 0, 0, 0, 1, 1,
-0.169123, -0.2015617, -0.3928589, 0, 0, 0, 1, 1,
-0.1679593, 0.06599449, -0.7538844, 0, 0, 0, 1, 1,
-0.1673599, -0.4538352, -1.401551, 1, 1, 1, 1, 1,
-0.1669074, 0.6216449, 0.09516101, 1, 1, 1, 1, 1,
-0.1667629, 1.939918, -1.069821, 1, 1, 1, 1, 1,
-0.1600913, 1.471165, 1.879609, 1, 1, 1, 1, 1,
-0.1581864, -0.4712447, -2.435322, 1, 1, 1, 1, 1,
-0.1579335, 0.2134087, -2.10149, 1, 1, 1, 1, 1,
-0.1574066, 0.1385637, -1.495891, 1, 1, 1, 1, 1,
-0.1548648, 0.6735788, 0.2348393, 1, 1, 1, 1, 1,
-0.1529544, -0.9395865, -1.060864, 1, 1, 1, 1, 1,
-0.1506695, 0.43436, -1.315597, 1, 1, 1, 1, 1,
-0.1499177, -1.608644, -4.059036, 1, 1, 1, 1, 1,
-0.1491724, 0.7162939, 0.5844035, 1, 1, 1, 1, 1,
-0.1443372, 1.152338, -1.479003, 1, 1, 1, 1, 1,
-0.1393809, -0.2968017, -2.361001, 1, 1, 1, 1, 1,
-0.1371536, 0.09937201, -2.480899, 1, 1, 1, 1, 1,
-0.1366953, 2.266787, 1.131201, 0, 0, 1, 1, 1,
-0.1348224, -2.154434, -2.723195, 1, 0, 0, 1, 1,
-0.1271643, 0.807332, 2.160753, 1, 0, 0, 1, 1,
-0.1261436, -0.2479535, -2.535866, 1, 0, 0, 1, 1,
-0.1258875, -1.72464, -3.899809, 1, 0, 0, 1, 1,
-0.1229186, 0.2405112, -0.3311441, 1, 0, 0, 1, 1,
-0.1222429, 2.548242, 0.2848509, 0, 0, 0, 1, 1,
-0.12037, 0.6059384, -0.2129786, 0, 0, 0, 1, 1,
-0.1176088, 0.2814771, -1.15866, 0, 0, 0, 1, 1,
-0.1175251, 0.05886801, -2.236874, 0, 0, 0, 1, 1,
-0.1152563, 1.13408, 0.07361228, 0, 0, 0, 1, 1,
-0.1135878, 1.147771, -3.305061, 0, 0, 0, 1, 1,
-0.1076682, 0.4204664, 1.537707, 0, 0, 0, 1, 1,
-0.1035721, 1.157893, 1.921368, 1, 1, 1, 1, 1,
-0.1026352, -0.9467068, -3.290006, 1, 1, 1, 1, 1,
-0.1014652, -0.748354, -3.181943, 1, 1, 1, 1, 1,
-0.1003799, -0.292224, -1.396442, 1, 1, 1, 1, 1,
-0.09205265, -0.5174186, -3.667973, 1, 1, 1, 1, 1,
-0.08973211, -0.6470947, -3.703068, 1, 1, 1, 1, 1,
-0.08587472, 0.4127739, 0.7844608, 1, 1, 1, 1, 1,
-0.08535161, -1.49866, -4.905205, 1, 1, 1, 1, 1,
-0.08520695, -0.4104726, -2.711288, 1, 1, 1, 1, 1,
-0.07889578, -1.196834, -2.338339, 1, 1, 1, 1, 1,
-0.0786911, -0.6709265, -3.266178, 1, 1, 1, 1, 1,
-0.07760136, 0.1830039, -1.902901, 1, 1, 1, 1, 1,
-0.0774394, 0.8769195, -0.935582, 1, 1, 1, 1, 1,
-0.07722428, 0.401201, -0.03375522, 1, 1, 1, 1, 1,
-0.07649936, 1.725165, 0.8153164, 1, 1, 1, 1, 1,
-0.06917296, 1.123206, -1.360222, 0, 0, 1, 1, 1,
-0.06410106, 0.050894, 0.6213962, 1, 0, 0, 1, 1,
-0.06315268, 0.04461863, -0.04953043, 1, 0, 0, 1, 1,
-0.05869251, 1.290788, 0.74518, 1, 0, 0, 1, 1,
-0.05067124, 0.06960851, -1.312277, 1, 0, 0, 1, 1,
-0.05038518, -0.03253413, -2.584496, 1, 0, 0, 1, 1,
-0.0468507, -1.029499, -4.420033, 0, 0, 0, 1, 1,
-0.04353622, -0.1178261, -4.541182, 0, 0, 0, 1, 1,
-0.04061098, 0.7508693, -0.6553665, 0, 0, 0, 1, 1,
-0.03945787, 0.3393904, -1.310687, 0, 0, 0, 1, 1,
-0.03784931, 1.039541, 1.682869, 0, 0, 0, 1, 1,
-0.03573012, 2.904268, 0.1816362, 0, 0, 0, 1, 1,
-0.0355622, 1.350477, 0.5311121, 0, 0, 0, 1, 1,
-0.03430021, 0.7189511, 0.8910617, 1, 1, 1, 1, 1,
-0.02487624, 0.4143788, -0.3243138, 1, 1, 1, 1, 1,
-0.01955246, -0.3494789, -2.706772, 1, 1, 1, 1, 1,
-0.01204062, 1.843247, 0.2909184, 1, 1, 1, 1, 1,
-0.01173514, 1.5922, 0.3143087, 1, 1, 1, 1, 1,
-0.009630687, -1.741398, -1.701902, 1, 1, 1, 1, 1,
-0.004610169, -1.079116, -4.214448, 1, 1, 1, 1, 1,
-0.003440012, -0.9363992, -3.356884, 1, 1, 1, 1, 1,
-0.003416409, 0.7769307, -0.30875, 1, 1, 1, 1, 1,
-0.001460253, 0.7526097, 0.2908266, 1, 1, 1, 1, 1,
-0.001035176, -0.2431248, -3.864949, 1, 1, 1, 1, 1,
-0.0002989625, 0.6327657, 0.0487689, 1, 1, 1, 1, 1,
0.003906517, 1.302624, 0.8239647, 1, 1, 1, 1, 1,
0.009401697, 0.1315348, -0.5323257, 1, 1, 1, 1, 1,
0.01032215, 0.7895325, 1.673017, 1, 1, 1, 1, 1,
0.01162272, -0.4683621, 2.039791, 0, 0, 1, 1, 1,
0.01318708, -1.280581, 6.797053, 1, 0, 0, 1, 1,
0.01589567, -1.201007, 4.124915, 1, 0, 0, 1, 1,
0.0196973, -0.5082216, 4.140074, 1, 0, 0, 1, 1,
0.02373521, 0.3849194, -0.4055826, 1, 0, 0, 1, 1,
0.02604043, 1.122716, 0.9683785, 1, 0, 0, 1, 1,
0.02697383, -0.4728497, 3.75057, 0, 0, 0, 1, 1,
0.03079062, -2.121513, 3.669216, 0, 0, 0, 1, 1,
0.03479657, -1.240314, 4.061769, 0, 0, 0, 1, 1,
0.04201903, 0.3612413, -0.4919962, 0, 0, 0, 1, 1,
0.0432532, -1.595896, 4.09477, 0, 0, 0, 1, 1,
0.04723907, 1.24725, -0.5484143, 0, 0, 0, 1, 1,
0.04821821, 0.08975191, -0.5223627, 0, 0, 0, 1, 1,
0.04857479, 0.04759091, 1.384681, 1, 1, 1, 1, 1,
0.05202746, 0.4019379, 1.804207, 1, 1, 1, 1, 1,
0.05233905, 0.5773978, -0.01161031, 1, 1, 1, 1, 1,
0.05597021, -1.329205, 3.795412, 1, 1, 1, 1, 1,
0.05628276, -1.523288, 2.80103, 1, 1, 1, 1, 1,
0.05705345, -0.7878141, 3.628108, 1, 1, 1, 1, 1,
0.06062445, 0.1346814, 1.516373, 1, 1, 1, 1, 1,
0.06921996, -0.7950337, 2.08112, 1, 1, 1, 1, 1,
0.07109532, -0.8278518, 1.441483, 1, 1, 1, 1, 1,
0.07392469, 1.359187, -1.293353, 1, 1, 1, 1, 1,
0.07473613, 0.2656054, 1.785607, 1, 1, 1, 1, 1,
0.07484879, 0.1983141, 0.5071213, 1, 1, 1, 1, 1,
0.07628275, 0.5905356, -1.319057, 1, 1, 1, 1, 1,
0.07861628, -2.324907, 3.625441, 1, 1, 1, 1, 1,
0.07933641, 0.2121061, 1.054201, 1, 1, 1, 1, 1,
0.08134846, -0.1615521, 2.306858, 0, 0, 1, 1, 1,
0.08780542, 1.807153, -1.96943, 1, 0, 0, 1, 1,
0.09053437, 0.8325968, 0.2779348, 1, 0, 0, 1, 1,
0.09381193, -0.2556343, 3.558277, 1, 0, 0, 1, 1,
0.1005921, 0.3632247, 0.9733329, 1, 0, 0, 1, 1,
0.1044946, 0.1585024, 0.7086734, 1, 0, 0, 1, 1,
0.1062943, 0.4196641, -0.7764594, 0, 0, 0, 1, 1,
0.1109676, -0.1323887, 2.589402, 0, 0, 0, 1, 1,
0.1154549, -0.3487578, 2.054, 0, 0, 0, 1, 1,
0.1162883, -0.3031854, 4.909119, 0, 0, 0, 1, 1,
0.1184429, -0.2552534, 1.237561, 0, 0, 0, 1, 1,
0.1185929, -0.4070062, 3.480457, 0, 0, 0, 1, 1,
0.1189375, 0.7875342, 1.206798, 0, 0, 0, 1, 1,
0.1215607, 0.07694418, 0.04261975, 1, 1, 1, 1, 1,
0.1295107, -1.885005, 1.566346, 1, 1, 1, 1, 1,
0.1319553, -0.5853825, 3.433862, 1, 1, 1, 1, 1,
0.1330294, -1.403147, 2.644378, 1, 1, 1, 1, 1,
0.1435574, 0.9645109, -2.602952, 1, 1, 1, 1, 1,
0.1557497, 0.2729771, -0.0008993704, 1, 1, 1, 1, 1,
0.1599869, -0.8540492, 3.595793, 1, 1, 1, 1, 1,
0.1600659, 1.207403, 0.05147128, 1, 1, 1, 1, 1,
0.1615889, -0.1427733, 3.299445, 1, 1, 1, 1, 1,
0.1624261, 0.6386224, 1.542201, 1, 1, 1, 1, 1,
0.1652322, 1.025277, 0.03101101, 1, 1, 1, 1, 1,
0.1657054, 1.298809, 1.30178, 1, 1, 1, 1, 1,
0.1664515, 0.4287118, 0.2876373, 1, 1, 1, 1, 1,
0.1669115, -2.200266, 1.921466, 1, 1, 1, 1, 1,
0.1726119, 0.4051594, 0.4042716, 1, 1, 1, 1, 1,
0.1742291, 0.4994498, -0.7633183, 0, 0, 1, 1, 1,
0.1766938, -0.4961209, 2.2597, 1, 0, 0, 1, 1,
0.1800843, 0.8957617, -0.8770437, 1, 0, 0, 1, 1,
0.1803051, -1.408679, 3.224782, 1, 0, 0, 1, 1,
0.1809628, 0.491499, 2.142739, 1, 0, 0, 1, 1,
0.1844078, -0.2826165, 0.2779553, 1, 0, 0, 1, 1,
0.1847811, -0.8199807, 4.002072, 0, 0, 0, 1, 1,
0.1857294, 1.012503, 2.489633, 0, 0, 0, 1, 1,
0.1865662, 0.6352032, -1.162601, 0, 0, 0, 1, 1,
0.1877656, -0.4603541, 3.681835, 0, 0, 0, 1, 1,
0.1880085, 0.4497581, 1.926752, 0, 0, 0, 1, 1,
0.1890426, -0.8148816, 4.125327, 0, 0, 0, 1, 1,
0.192755, -0.1397192, 0.5568464, 0, 0, 0, 1, 1,
0.1944898, 0.2200436, 2.339674, 1, 1, 1, 1, 1,
0.1958736, 0.0105109, 1.318044, 1, 1, 1, 1, 1,
0.1986656, -0.533259, 0.3149411, 1, 1, 1, 1, 1,
0.1987745, -0.62087, 1.038019, 1, 1, 1, 1, 1,
0.2011082, -0.07320051, 2.041997, 1, 1, 1, 1, 1,
0.2021998, 0.1516012, 1.767885, 1, 1, 1, 1, 1,
0.2026219, -0.07701478, 2.293869, 1, 1, 1, 1, 1,
0.2062681, 0.5734588, -0.1113305, 1, 1, 1, 1, 1,
0.2120153, 1.391959, -0.115757, 1, 1, 1, 1, 1,
0.2164034, -0.8437333, 1.661345, 1, 1, 1, 1, 1,
0.2170626, -0.04508958, 1.969201, 1, 1, 1, 1, 1,
0.2174941, -0.5429435, 1.482607, 1, 1, 1, 1, 1,
0.2203898, 0.8269772, -1.899643, 1, 1, 1, 1, 1,
0.22519, 0.3769094, 0.9643044, 1, 1, 1, 1, 1,
0.227546, 0.09268773, 1.793759, 1, 1, 1, 1, 1,
0.2345654, -1.40957, 3.575507, 0, 0, 1, 1, 1,
0.2374007, -0.3413534, 2.86291, 1, 0, 0, 1, 1,
0.2428881, -0.6706274, 3.746032, 1, 0, 0, 1, 1,
0.2433612, -0.7483135, 3.049823, 1, 0, 0, 1, 1,
0.2434069, -0.3316054, 3.72068, 1, 0, 0, 1, 1,
0.2444455, -0.2143316, 1.711444, 1, 0, 0, 1, 1,
0.2481035, -0.08386102, 1.292049, 0, 0, 0, 1, 1,
0.2597879, -1.743566, 1.736194, 0, 0, 0, 1, 1,
0.2599348, -1.44392, 0.6410029, 0, 0, 0, 1, 1,
0.2609941, -0.1572556, 0.5272925, 0, 0, 0, 1, 1,
0.26206, -0.4786308, 3.02915, 0, 0, 0, 1, 1,
0.2624235, -1.079417, 3.268222, 0, 0, 0, 1, 1,
0.2634935, 1.303608, -0.05172213, 0, 0, 0, 1, 1,
0.2659837, 0.264393, 1.810326, 1, 1, 1, 1, 1,
0.2676621, -0.128816, 1.113925, 1, 1, 1, 1, 1,
0.2718943, -0.410946, 3.142332, 1, 1, 1, 1, 1,
0.278277, -0.4400144, 2.819366, 1, 1, 1, 1, 1,
0.2850995, 0.8834813, -1.733296, 1, 1, 1, 1, 1,
0.2877901, 1.002112, -0.4272222, 1, 1, 1, 1, 1,
0.29441, -0.1415551, 2.136804, 1, 1, 1, 1, 1,
0.2969282, -0.3882137, 2.671466, 1, 1, 1, 1, 1,
0.3092327, -1.191299, 4.314488, 1, 1, 1, 1, 1,
0.3092493, -0.440066, 0.8193762, 1, 1, 1, 1, 1,
0.3157682, -0.4248332, 2.020236, 1, 1, 1, 1, 1,
0.3173315, 2.387131, 1.230412, 1, 1, 1, 1, 1,
0.3179642, 1.040379, -1.061326, 1, 1, 1, 1, 1,
0.3227943, 0.4211693, 0.2248524, 1, 1, 1, 1, 1,
0.3246884, 0.6342062, -1.006498, 1, 1, 1, 1, 1,
0.3263626, -0.3270148, 3.577498, 0, 0, 1, 1, 1,
0.32645, 0.5713285, 0.8491336, 1, 0, 0, 1, 1,
0.3297466, -0.1244531, 1.607029, 1, 0, 0, 1, 1,
0.3313702, -0.8627536, 3.053584, 1, 0, 0, 1, 1,
0.3321418, 0.7625582, 0.009899369, 1, 0, 0, 1, 1,
0.3360038, -0.1344802, 3.188044, 1, 0, 0, 1, 1,
0.3388861, 0.3106152, 2.083103, 0, 0, 0, 1, 1,
0.3422229, -0.8876609, 3.499316, 0, 0, 0, 1, 1,
0.3443034, 0.4271463, 1.532121, 0, 0, 0, 1, 1,
0.3448467, -0.3234879, 3.889611, 0, 0, 0, 1, 1,
0.346283, -0.4222785, 2.844846, 0, 0, 0, 1, 1,
0.3473843, -0.07958897, 1.922351, 0, 0, 0, 1, 1,
0.351448, -1.383586, 2.941426, 0, 0, 0, 1, 1,
0.3528632, 0.8136978, -0.06021269, 1, 1, 1, 1, 1,
0.3567396, 0.6867126, 0.4831714, 1, 1, 1, 1, 1,
0.3569939, 0.3317528, 2.134541, 1, 1, 1, 1, 1,
0.3579174, 0.2712198, -1.217562, 1, 1, 1, 1, 1,
0.3627764, 0.6347024, 0.2729119, 1, 1, 1, 1, 1,
0.3669865, 1.431074, -0.01455183, 1, 1, 1, 1, 1,
0.367282, 0.7785332, 0.2681915, 1, 1, 1, 1, 1,
0.3676316, 0.4495543, 0.7827023, 1, 1, 1, 1, 1,
0.3690493, -0.3183596, 2.026827, 1, 1, 1, 1, 1,
0.3696777, 0.1876046, 2.250832, 1, 1, 1, 1, 1,
0.3840018, -0.4081788, 3.337824, 1, 1, 1, 1, 1,
0.3867187, -0.7554274, 2.39065, 1, 1, 1, 1, 1,
0.3901398, 1.834801, 0.5930147, 1, 1, 1, 1, 1,
0.3903662, 0.2492892, 0.88886, 1, 1, 1, 1, 1,
0.3929134, 2.236235, 1.481415, 1, 1, 1, 1, 1,
0.3933313, 1.600606, 2.195966, 0, 0, 1, 1, 1,
0.3938266, -0.5492625, 1.383488, 1, 0, 0, 1, 1,
0.4016643, -0.7513398, 4.22972, 1, 0, 0, 1, 1,
0.4052194, 0.5273694, 1.384818, 1, 0, 0, 1, 1,
0.4094121, -0.7574432, 3.274113, 1, 0, 0, 1, 1,
0.4109936, 0.5738974, 0.1892842, 1, 0, 0, 1, 1,
0.412182, 0.4210929, -0.9163896, 0, 0, 0, 1, 1,
0.4167486, -2.337189, 1.941085, 0, 0, 0, 1, 1,
0.4259559, 1.609693, 1.836981, 0, 0, 0, 1, 1,
0.4448265, 2.325145, 1.021265, 0, 0, 0, 1, 1,
0.4466455, 0.3591357, -1.035483, 0, 0, 0, 1, 1,
0.4482578, -0.09696384, 1.885505, 0, 0, 0, 1, 1,
0.4506339, 0.1149317, -0.6023285, 0, 0, 0, 1, 1,
0.4508432, -0.8141048, 3.391701, 1, 1, 1, 1, 1,
0.4530315, -2.259695, 2.467679, 1, 1, 1, 1, 1,
0.4555269, 1.235301, 0.4247667, 1, 1, 1, 1, 1,
0.4582246, -1.091605, 3.192428, 1, 1, 1, 1, 1,
0.4623578, 0.9061488, 0.841536, 1, 1, 1, 1, 1,
0.4718925, 0.1145554, -0.07905684, 1, 1, 1, 1, 1,
0.4733726, 1.401011, 1.597855, 1, 1, 1, 1, 1,
0.4735744, -1.421788, 3.541558, 1, 1, 1, 1, 1,
0.4793937, -0.360324, 2.106534, 1, 1, 1, 1, 1,
0.4824744, 0.2918591, 2.481259, 1, 1, 1, 1, 1,
0.4935249, -1.379295, 0.1910998, 1, 1, 1, 1, 1,
0.4960243, -0.02460643, 1.178196, 1, 1, 1, 1, 1,
0.497236, -0.2947251, 3.115241, 1, 1, 1, 1, 1,
0.49872, -0.2361665, 2.39327, 1, 1, 1, 1, 1,
0.4987643, -0.4757697, 2.891932, 1, 1, 1, 1, 1,
0.5042039, -0.5118788, 3.034863, 0, 0, 1, 1, 1,
0.5121683, -0.1865856, 1.69145, 1, 0, 0, 1, 1,
0.520829, -0.2312811, 3.522767, 1, 0, 0, 1, 1,
0.5217158, 2.432255, 1.023353, 1, 0, 0, 1, 1,
0.5223092, 1.172674, 0.2849286, 1, 0, 0, 1, 1,
0.5236198, -1.90277, 4.68529, 1, 0, 0, 1, 1,
0.5259266, 0.9284504, 0.9809259, 0, 0, 0, 1, 1,
0.5280904, 0.06236136, 2.141709, 0, 0, 0, 1, 1,
0.5296952, 1.125708, -0.3487626, 0, 0, 0, 1, 1,
0.5339987, 1.80982, -1.394697, 0, 0, 0, 1, 1,
0.5368285, -0.1767459, 2.356027, 0, 0, 0, 1, 1,
0.5396592, -0.1913108, 1.109634, 0, 0, 0, 1, 1,
0.5408333, -1.070941, 2.858318, 0, 0, 0, 1, 1,
0.5416782, -0.9575875, 3.546834, 1, 1, 1, 1, 1,
0.5421654, 1.13831, 0.161296, 1, 1, 1, 1, 1,
0.5528091, 0.5120259, 2.108484, 1, 1, 1, 1, 1,
0.5548612, 2.220293, 0.7676683, 1, 1, 1, 1, 1,
0.5578303, 0.2662792, 2.215541, 1, 1, 1, 1, 1,
0.5581651, -0.9537205, 2.264246, 1, 1, 1, 1, 1,
0.5626043, 0.176026, -0.7538531, 1, 1, 1, 1, 1,
0.5660216, -0.2336618, 2.359564, 1, 1, 1, 1, 1,
0.56611, 0.4799211, 0.6090626, 1, 1, 1, 1, 1,
0.5750681, -1.678548, 3.054659, 1, 1, 1, 1, 1,
0.5769489, 2.131108, 0.1431066, 1, 1, 1, 1, 1,
0.5785297, 1.980228, -0.4105268, 1, 1, 1, 1, 1,
0.5788618, 0.6070572, -0.3252115, 1, 1, 1, 1, 1,
0.5877552, 0.2356214, 3.270126, 1, 1, 1, 1, 1,
0.5878763, 1.097977, -0.4418213, 1, 1, 1, 1, 1,
0.5892791, 1.270719, -0.1318648, 0, 0, 1, 1, 1,
0.5916958, 1.427319, 0.1682273, 1, 0, 0, 1, 1,
0.5926551, -0.3233096, 1.614102, 1, 0, 0, 1, 1,
0.6003574, 0.2306482, 2.40805, 1, 0, 0, 1, 1,
0.6099287, -1.089169, 2.407822, 1, 0, 0, 1, 1,
0.6108614, 0.8081539, 0.5176945, 1, 0, 0, 1, 1,
0.6133073, 0.2694767, 3.284554, 0, 0, 0, 1, 1,
0.6159154, 0.8467174, 1.035851, 0, 0, 0, 1, 1,
0.6237649, 0.1123939, 0.9765229, 0, 0, 0, 1, 1,
0.6297335, -0.6217023, 3.33305, 0, 0, 0, 1, 1,
0.6302975, -0.8937873, 2.176595, 0, 0, 0, 1, 1,
0.6356689, 0.01000329, 2.265702, 0, 0, 0, 1, 1,
0.6396804, 0.5543714, 0.4551931, 0, 0, 0, 1, 1,
0.641573, 1.325666, -1.267943, 1, 1, 1, 1, 1,
0.6457605, 0.8386125, 0.01737691, 1, 1, 1, 1, 1,
0.647324, -0.2639652, 3.200794, 1, 1, 1, 1, 1,
0.6494056, -0.4562212, 2.587456, 1, 1, 1, 1, 1,
0.6566142, 0.8967496, -0.09455658, 1, 1, 1, 1, 1,
0.6580287, 0.1257279, 1.666177, 1, 1, 1, 1, 1,
0.6656262, -0.7119585, 0.4045828, 1, 1, 1, 1, 1,
0.6662997, -0.7472128, 2.059041, 1, 1, 1, 1, 1,
0.6674303, 0.6113806, 0.2563351, 1, 1, 1, 1, 1,
0.6717225, -0.6894574, 2.579989, 1, 1, 1, 1, 1,
0.6745121, -0.6918504, 3.75287, 1, 1, 1, 1, 1,
0.6747298, -1.021495, 2.837422, 1, 1, 1, 1, 1,
0.6796404, -1.394822, 3.609498, 1, 1, 1, 1, 1,
0.6798251, 0.648607, -0.2457294, 1, 1, 1, 1, 1,
0.6842186, -0.5686278, 2.371061, 1, 1, 1, 1, 1,
0.6871647, 0.6742707, 2.302375, 0, 0, 1, 1, 1,
0.690264, 1.690469, 0.7945932, 1, 0, 0, 1, 1,
0.6919847, -1.427877, 4.691824, 1, 0, 0, 1, 1,
0.6931511, 0.2136966, 2.490543, 1, 0, 0, 1, 1,
0.6949383, -1.472142, 2.629121, 1, 0, 0, 1, 1,
0.7149931, -0.4014423, 3.137613, 1, 0, 0, 1, 1,
0.7157962, 0.1374319, 0.4943018, 0, 0, 0, 1, 1,
0.7180245, 0.429635, 0.6184046, 0, 0, 0, 1, 1,
0.7232571, -0.5655791, 1.852528, 0, 0, 0, 1, 1,
0.7248818, -2.60649, 3.346848, 0, 0, 0, 1, 1,
0.7262304, 0.06453747, 1.423509, 0, 0, 0, 1, 1,
0.7270126, 0.2139634, 0.6867518, 0, 0, 0, 1, 1,
0.7317055, 0.7839555, 1.120125, 0, 0, 0, 1, 1,
0.7356291, 0.3987051, 1.170116, 1, 1, 1, 1, 1,
0.7377292, -0.5098878, 1.721295, 1, 1, 1, 1, 1,
0.7392886, 0.7374915, -1.147692, 1, 1, 1, 1, 1,
0.7408113, -0.8385492, 1.792592, 1, 1, 1, 1, 1,
0.7473773, -0.2120049, 2.89343, 1, 1, 1, 1, 1,
0.7488938, 0.2314103, 1.557852, 1, 1, 1, 1, 1,
0.7500778, -0.4643172, 2.504715, 1, 1, 1, 1, 1,
0.7529646, -0.5374814, 1.406997, 1, 1, 1, 1, 1,
0.7551609, -1.048587, -0.03939056, 1, 1, 1, 1, 1,
0.7579944, 0.3481362, -0.4350031, 1, 1, 1, 1, 1,
0.7691533, -0.2499305, 2.834162, 1, 1, 1, 1, 1,
0.7702993, -1.143794, 1.071091, 1, 1, 1, 1, 1,
0.775898, 0.5433847, 2.056879, 1, 1, 1, 1, 1,
0.7764276, 0.0633944, 0.4742418, 1, 1, 1, 1, 1,
0.7821925, 1.648166, 0.06736182, 1, 1, 1, 1, 1,
0.7832154, 1.304679, -0.07410918, 0, 0, 1, 1, 1,
0.7876241, -1.00561, 0.4614711, 1, 0, 0, 1, 1,
0.7932215, 0.7076389, 2.071116, 1, 0, 0, 1, 1,
0.7955482, 0.4260183, 1.641288, 1, 0, 0, 1, 1,
0.7997438, 1.004108, 0.7572919, 1, 0, 0, 1, 1,
0.8033341, -0.9496418, 3.699382, 1, 0, 0, 1, 1,
0.816573, 1.266541, 1.765112, 0, 0, 0, 1, 1,
0.8222176, 0.5327273, 0.5542119, 0, 0, 0, 1, 1,
0.8261245, -0.5462596, 2.56319, 0, 0, 0, 1, 1,
0.8271317, -0.9837272, 2.840613, 0, 0, 0, 1, 1,
0.8287057, 0.3550619, 1.564041, 0, 0, 0, 1, 1,
0.8312979, -0.01196409, 2.335361, 0, 0, 0, 1, 1,
0.8335988, 0.4412526, 2.064087, 0, 0, 0, 1, 1,
0.840692, 1.583046, 1.340874, 1, 1, 1, 1, 1,
0.8489342, -0.3451668, 0.7540975, 1, 1, 1, 1, 1,
0.849439, -0.1301304, 1.201311, 1, 1, 1, 1, 1,
0.8568571, -0.2684445, 2.576317, 1, 1, 1, 1, 1,
0.8609657, -0.5566449, 2.16011, 1, 1, 1, 1, 1,
0.8627357, -2.71137, 4.145483, 1, 1, 1, 1, 1,
0.8708116, -0.1420247, 2.384104, 1, 1, 1, 1, 1,
0.8733041, 0.1486089, 2.686919, 1, 1, 1, 1, 1,
0.8803606, 0.6336042, -1.326814, 1, 1, 1, 1, 1,
0.8831954, 0.3603273, -0.9711173, 1, 1, 1, 1, 1,
0.8838824, -0.7107467, 1.484876, 1, 1, 1, 1, 1,
0.8864301, -1.039006, 2.962623, 1, 1, 1, 1, 1,
0.889163, -0.3135909, 1.615957, 1, 1, 1, 1, 1,
0.8893928, -0.8763911, 1.722363, 1, 1, 1, 1, 1,
0.894196, -0.9796537, 2.658357, 1, 1, 1, 1, 1,
0.8947232, -0.1816747, 1.174562, 0, 0, 1, 1, 1,
0.8963677, 0.9438351, 1.463519, 1, 0, 0, 1, 1,
0.9007458, -0.6644124, 2.759177, 1, 0, 0, 1, 1,
0.9061516, -0.3476624, -0.4022626, 1, 0, 0, 1, 1,
0.9107389, 0.4589625, 0.5097163, 1, 0, 0, 1, 1,
0.9163426, 0.9028082, 0.1161929, 1, 0, 0, 1, 1,
0.9182099, -0.575731, 1.277202, 0, 0, 0, 1, 1,
0.9219293, -0.2798099, 2.121999, 0, 0, 0, 1, 1,
0.9228169, 0.1284983, -0.5686837, 0, 0, 0, 1, 1,
0.9312561, -0.1111265, 0.4379258, 0, 0, 0, 1, 1,
0.9346612, -1.281211, 1.429241, 0, 0, 0, 1, 1,
0.9359444, -0.7622838, 0.9319469, 0, 0, 0, 1, 1,
0.9383852, -1.567303, 2.374116, 0, 0, 0, 1, 1,
0.9482312, -0.429715, 2.022371, 1, 1, 1, 1, 1,
0.9491976, 0.1660707, 1.927947, 1, 1, 1, 1, 1,
0.949898, -0.7127617, 1.095115, 1, 1, 1, 1, 1,
0.9533554, 0.7117648, 1.576229, 1, 1, 1, 1, 1,
0.9550101, 0.8024845, 0.5998821, 1, 1, 1, 1, 1,
0.9559067, 0.1550341, 0.9417465, 1, 1, 1, 1, 1,
0.9648636, -0.3261601, 0.2895988, 1, 1, 1, 1, 1,
0.9769835, -1.584539, 1.86112, 1, 1, 1, 1, 1,
0.9789549, -1.401284, 2.627563, 1, 1, 1, 1, 1,
0.9813581, -0.1472319, -0.9683307, 1, 1, 1, 1, 1,
0.987841, 0.8598724, 1.466357, 1, 1, 1, 1, 1,
0.9897316, -2.24259, 3.490928, 1, 1, 1, 1, 1,
0.9939286, -0.6703444, 2.206027, 1, 1, 1, 1, 1,
0.9995735, 0.5281355, 0.5069891, 1, 1, 1, 1, 1,
1.001911, 0.5827692, 0.5008944, 1, 1, 1, 1, 1,
1.009215, 0.4222988, 3.183825, 0, 0, 1, 1, 1,
1.009489, 1.503258, 1.498314, 1, 0, 0, 1, 1,
1.010277, 0.08382384, 1.22364, 1, 0, 0, 1, 1,
1.030173, -0.5502051, 1.883225, 1, 0, 0, 1, 1,
1.032684, 0.2310344, 1.853443, 1, 0, 0, 1, 1,
1.033395, -1.226468, 0.8520346, 1, 0, 0, 1, 1,
1.035253, -2.169247, 3.101336, 0, 0, 0, 1, 1,
1.03692, -0.2766677, 3.474828, 0, 0, 0, 1, 1,
1.045319, -0.01610563, -0.2924001, 0, 0, 0, 1, 1,
1.047444, -0.7489497, 2.166476, 0, 0, 0, 1, 1,
1.051317, 0.4968989, 1.026949, 0, 0, 0, 1, 1,
1.054849, -0.144313, 0.8371533, 0, 0, 0, 1, 1,
1.056352, 2.262801, 0.08014618, 0, 0, 0, 1, 1,
1.05869, -0.6758385, 2.454741, 1, 1, 1, 1, 1,
1.06214, -0.4613458, 2.894257, 1, 1, 1, 1, 1,
1.062833, -0.05321882, 1.507002, 1, 1, 1, 1, 1,
1.072749, -1.173079, 1.955508, 1, 1, 1, 1, 1,
1.07953, 0.9077207, -1.401045, 1, 1, 1, 1, 1,
1.079545, -1.421431, 1.511696, 1, 1, 1, 1, 1,
1.081778, -2.34223, 2.516402, 1, 1, 1, 1, 1,
1.085587, -0.553888, 3.734102, 1, 1, 1, 1, 1,
1.100925, 0.2628796, 1.163862, 1, 1, 1, 1, 1,
1.101733, -1.04712, 2.119278, 1, 1, 1, 1, 1,
1.102866, -1.371304, 1.069535, 1, 1, 1, 1, 1,
1.107679, 1.28534, 0.09237324, 1, 1, 1, 1, 1,
1.112985, -1.205592, 2.035473, 1, 1, 1, 1, 1,
1.114662, -1.903327, 1.362083, 1, 1, 1, 1, 1,
1.120294, 2.042707, -0.3299725, 1, 1, 1, 1, 1,
1.131049, -0.8408301, 2.793489, 0, 0, 1, 1, 1,
1.140557, -2.104167, 2.200303, 1, 0, 0, 1, 1,
1.141256, 0.6776356, 1.142899, 1, 0, 0, 1, 1,
1.159548, -1.934314, 4.05779, 1, 0, 0, 1, 1,
1.169839, 1.318434, -0.7223191, 1, 0, 0, 1, 1,
1.172218, 0.2615032, 1.21831, 1, 0, 0, 1, 1,
1.175189, -1.538298, 1.519053, 0, 0, 0, 1, 1,
1.180636, 0.1899347, 0.3901723, 0, 0, 0, 1, 1,
1.185524, -0.8018326, 3.938893, 0, 0, 0, 1, 1,
1.187296, 0.5573888, 0.8841396, 0, 0, 0, 1, 1,
1.188514, 0.08653685, 1.265708, 0, 0, 0, 1, 1,
1.189309, 0.272905, 0.3150963, 0, 0, 0, 1, 1,
1.195457, 0.4953256, 1.505358, 0, 0, 0, 1, 1,
1.199662, -1.300365, 3.980816, 1, 1, 1, 1, 1,
1.207422, 0.8434493, 2.210387, 1, 1, 1, 1, 1,
1.207666, 1.518264, 0.299884, 1, 1, 1, 1, 1,
1.231505, 0.5118499, 2.001252, 1, 1, 1, 1, 1,
1.233068, 0.0868836, 2.57239, 1, 1, 1, 1, 1,
1.247458, 1.112775, -0.6722391, 1, 1, 1, 1, 1,
1.251561, 2.029133, 0.5361931, 1, 1, 1, 1, 1,
1.254551, 0.2572193, 1.754951, 1, 1, 1, 1, 1,
1.255998, 0.03826233, 3.134697, 1, 1, 1, 1, 1,
1.258128, 0.218535, 1.042035, 1, 1, 1, 1, 1,
1.261577, 0.9885176, 0.3378629, 1, 1, 1, 1, 1,
1.265114, -0.2756876, 2.093431, 1, 1, 1, 1, 1,
1.269428, -1.94208, 2.558201, 1, 1, 1, 1, 1,
1.275083, 1.020506, -0.2216692, 1, 1, 1, 1, 1,
1.296023, -1.028184, 1.110887, 1, 1, 1, 1, 1,
1.296707, 0.5892422, 1.029588, 0, 0, 1, 1, 1,
1.299214, -0.7582756, 2.130565, 1, 0, 0, 1, 1,
1.304793, 0.220785, 1.692454, 1, 0, 0, 1, 1,
1.307204, -1.365201, 1.857695, 1, 0, 0, 1, 1,
1.30788, -0.5797564, 0.3806777, 1, 0, 0, 1, 1,
1.310643, -0.3939654, 1.636089, 1, 0, 0, 1, 1,
1.314119, -0.5567312, 3.794754, 0, 0, 0, 1, 1,
1.322936, -1.519359, 1.483088, 0, 0, 0, 1, 1,
1.322987, -0.40724, 0.01855646, 0, 0, 0, 1, 1,
1.356696, -0.3892271, 1.327269, 0, 0, 0, 1, 1,
1.367579, -1.150072, 2.131407, 0, 0, 0, 1, 1,
1.377903, -0.5498192, 1.190593, 0, 0, 0, 1, 1,
1.381468, -0.03821764, 1.65688, 0, 0, 0, 1, 1,
1.391896, 1.451001, -0.1280054, 1, 1, 1, 1, 1,
1.393923, 0.9658747, -2.102172, 1, 1, 1, 1, 1,
1.417873, 0.2201916, 2.328062, 1, 1, 1, 1, 1,
1.418162, 1.742813, 0.7776697, 1, 1, 1, 1, 1,
1.423069, -0.4511521, 1.418012, 1, 1, 1, 1, 1,
1.423092, 1.552641, 0.1273948, 1, 1, 1, 1, 1,
1.430723, 0.268362, 2.002085, 1, 1, 1, 1, 1,
1.431546, 0.1777537, 1.691415, 1, 1, 1, 1, 1,
1.442869, -0.7320018, 1.535869, 1, 1, 1, 1, 1,
1.454433, 0.1818625, 0.9015414, 1, 1, 1, 1, 1,
1.461941, 2.034147, 3.036428, 1, 1, 1, 1, 1,
1.472838, -0.6171585, 2.234926, 1, 1, 1, 1, 1,
1.475837, -0.5004622, 0.7747675, 1, 1, 1, 1, 1,
1.476389, 0.6971398, -1.498044, 1, 1, 1, 1, 1,
1.4792, -1.466374, 1.455473, 1, 1, 1, 1, 1,
1.501464, -0.8275382, 2.683896, 0, 0, 1, 1, 1,
1.506101, 0.2256163, 1.039, 1, 0, 0, 1, 1,
1.506761, 0.4588819, 1.373423, 1, 0, 0, 1, 1,
1.551978, 1.03379, 2.761091, 1, 0, 0, 1, 1,
1.559826, 0.4651123, 0.1683317, 1, 0, 0, 1, 1,
1.561749, -0.6050482, 1.023832, 1, 0, 0, 1, 1,
1.561897, 1.785912, 2.544179, 0, 0, 0, 1, 1,
1.567847, 0.7324417, 1.283897, 0, 0, 0, 1, 1,
1.56965, 0.6517158, 1.576793, 0, 0, 0, 1, 1,
1.580796, -1.896365, 1.971878, 0, 0, 0, 1, 1,
1.586925, 0.4582046, 0.9067506, 0, 0, 0, 1, 1,
1.592696, -0.5138538, 2.265091, 0, 0, 0, 1, 1,
1.610942, 1.094163, 3.5932, 0, 0, 0, 1, 1,
1.637128, 0.4799236, 2.690412, 1, 1, 1, 1, 1,
1.63899, 1.239963, 1.321893, 1, 1, 1, 1, 1,
1.652912, -0.2187206, 1.62593, 1, 1, 1, 1, 1,
1.654683, -0.3600209, 3.267013, 1, 1, 1, 1, 1,
1.658315, 1.063649, 1.452321, 1, 1, 1, 1, 1,
1.661469, 0.4568186, 1.38431, 1, 1, 1, 1, 1,
1.665305, -0.3028043, 1.291469, 1, 1, 1, 1, 1,
1.665831, -1.759777, 0.8571289, 1, 1, 1, 1, 1,
1.675249, -0.2440556, 1.497643, 1, 1, 1, 1, 1,
1.684256, -0.4432391, 4.075747, 1, 1, 1, 1, 1,
1.686096, -0.2037019, 3.041199, 1, 1, 1, 1, 1,
1.696386, 1.787804, 3.891348, 1, 1, 1, 1, 1,
1.699846, 1.086719, 0.7119204, 1, 1, 1, 1, 1,
1.707677, -0.04722536, 2.340012, 1, 1, 1, 1, 1,
1.712107, -0.8661351, 2.142168, 1, 1, 1, 1, 1,
1.717871, 0.9821073, 0.1842587, 0, 0, 1, 1, 1,
1.722347, 1.184877, 1.649125, 1, 0, 0, 1, 1,
1.726842, 0.07361429, 3.585256, 1, 0, 0, 1, 1,
1.731325, -0.3372197, 2.132154, 1, 0, 0, 1, 1,
1.74314, -0.8545231, 2.290365, 1, 0, 0, 1, 1,
1.752696, -0.8049549, 2.038952, 1, 0, 0, 1, 1,
1.764478, -0.6610829, 3.376234, 0, 0, 0, 1, 1,
1.765522, 0.8244118, 2.13277, 0, 0, 0, 1, 1,
1.775653, 0.2655592, 2.306951, 0, 0, 0, 1, 1,
1.781514, -1.506672, 2.762707, 0, 0, 0, 1, 1,
1.79218, -1.148832, 1.117229, 0, 0, 0, 1, 1,
1.793801, 0.08776885, 3.394298, 0, 0, 0, 1, 1,
1.804269, 1.79921, 0.8193066, 0, 0, 0, 1, 1,
1.805542, -0.2511702, 1.316281, 1, 1, 1, 1, 1,
1.807223, -1.205074, 2.214817, 1, 1, 1, 1, 1,
1.820512, 1.543295, 0.7734969, 1, 1, 1, 1, 1,
1.823435, 2.026268, 0.7365316, 1, 1, 1, 1, 1,
1.84336, -0.6387025, 1.600255, 1, 1, 1, 1, 1,
1.846345, 0.7893648, 1.121752, 1, 1, 1, 1, 1,
1.862222, 0.8709045, 0.9795175, 1, 1, 1, 1, 1,
1.868634, 0.01474936, 2.496236, 1, 1, 1, 1, 1,
1.875754, -1.60304, 1.280775, 1, 1, 1, 1, 1,
1.877943, -0.6810368, 2.996323, 1, 1, 1, 1, 1,
1.94858, -0.4463278, 0.9804947, 1, 1, 1, 1, 1,
1.950458, 2.132435, -0.07024708, 1, 1, 1, 1, 1,
1.9554, -0.4468733, 2.641275, 1, 1, 1, 1, 1,
1.966404, -0.415723, 1.73272, 1, 1, 1, 1, 1,
1.974409, -1.190852, 2.694192, 1, 1, 1, 1, 1,
1.984863, 0.1379528, -0.1189489, 0, 0, 1, 1, 1,
1.99406, 0.3353498, 1.914222, 1, 0, 0, 1, 1,
2.044319, -0.3470826, 1.096272, 1, 0, 0, 1, 1,
2.063079, -0.8946129, 2.734754, 1, 0, 0, 1, 1,
2.068599, 0.4374461, 2.940094, 1, 0, 0, 1, 1,
2.070033, 0.5094613, 2.156326, 1, 0, 0, 1, 1,
2.143131, -1.447619, 2.610512, 0, 0, 0, 1, 1,
2.181372, 3.660308, 1.063833, 0, 0, 0, 1, 1,
2.206449, 0.6909516, 1.863522, 0, 0, 0, 1, 1,
2.222345, -0.5236203, 0.2319166, 0, 0, 0, 1, 1,
2.270393, 0.1082266, 2.047104, 0, 0, 0, 1, 1,
2.387991, 0.2157117, 1.891025, 0, 0, 0, 1, 1,
2.470356, 0.8682693, 3.555581, 0, 0, 0, 1, 1,
2.474295, -1.806801, 2.045771, 1, 1, 1, 1, 1,
2.620571, 1.054791, -1.201138, 1, 1, 1, 1, 1,
2.632974, 0.1826561, 0.2201463, 1, 1, 1, 1, 1,
2.946948, -1.21424, 0.6702168, 1, 1, 1, 1, 1,
3.111231, 0.455474, -0.03184939, 1, 1, 1, 1, 1,
3.254334, 0.9120002, 2.657817, 1, 1, 1, 1, 1,
3.519425, -0.04142384, 1.922492, 1, 1, 1, 1, 1
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
var radius = 10.0863;
var distance = 35.4277;
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
mvMatrix.translate( -0.09020329, -0.4744691, -0.945924 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.4277);
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
