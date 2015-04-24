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
-3.492229, 0.3798541, -1.333932, 1, 0, 0, 1,
-3.477556, -1.924468, -3.537549, 1, 0.007843138, 0, 1,
-3.073425, -0.1212377, -3.352878, 1, 0.01176471, 0, 1,
-2.927187, 0.556536, -2.108276, 1, 0.01960784, 0, 1,
-2.792312, 0.7617069, -0.1895731, 1, 0.02352941, 0, 1,
-2.638421, 1.471025, -2.095942, 1, 0.03137255, 0, 1,
-2.56977, -1.041888, -2.588559, 1, 0.03529412, 0, 1,
-2.569568, -2.124382, -2.787797, 1, 0.04313726, 0, 1,
-2.500296, 1.216769, -1.857184, 1, 0.04705882, 0, 1,
-2.476459, -1.344813, -1.277547, 1, 0.05490196, 0, 1,
-2.462839, 0.5948293, -1.154719, 1, 0.05882353, 0, 1,
-2.391622, -1.421633, -2.188835, 1, 0.06666667, 0, 1,
-2.181595, -1.436105, -0.1884288, 1, 0.07058824, 0, 1,
-2.169809, 1.857465, -2.202633, 1, 0.07843138, 0, 1,
-2.15885, 0.8109267, 0.1108155, 1, 0.08235294, 0, 1,
-2.127497, 0.0158471, -1.589864, 1, 0.09019608, 0, 1,
-2.087902, -0.390836, -2.125362, 1, 0.09411765, 0, 1,
-2.057471, -1.562077, -3.668845, 1, 0.1019608, 0, 1,
-2.022457, -0.7082503, -1.618612, 1, 0.1098039, 0, 1,
-1.932939, 0.4018558, -2.453944, 1, 0.1137255, 0, 1,
-1.916523, 0.03449934, -0.8239655, 1, 0.1215686, 0, 1,
-1.893066, 1.352632, -0.6351315, 1, 0.1254902, 0, 1,
-1.880585, -0.2134655, -0.9542937, 1, 0.1333333, 0, 1,
-1.869514, -0.9379941, -1.417368, 1, 0.1372549, 0, 1,
-1.859079, 0.04051879, -2.51403, 1, 0.145098, 0, 1,
-1.848301, 0.5150845, 0.6042425, 1, 0.1490196, 0, 1,
-1.848263, 0.3929334, -0.5345053, 1, 0.1568628, 0, 1,
-1.841893, -0.1549516, -0.6349145, 1, 0.1607843, 0, 1,
-1.838251, -0.5154085, -2.921789, 1, 0.1686275, 0, 1,
-1.807624, 0.2368491, -0.9943461, 1, 0.172549, 0, 1,
-1.788203, -0.8956496, -1.396595, 1, 0.1803922, 0, 1,
-1.732498, 0.05939586, -0.684719, 1, 0.1843137, 0, 1,
-1.70853, -0.07370427, -1.951886, 1, 0.1921569, 0, 1,
-1.696649, 0.8938555, -1.653395, 1, 0.1960784, 0, 1,
-1.695854, 0.6429503, -1.356422, 1, 0.2039216, 0, 1,
-1.680719, 0.4690542, -0.4684606, 1, 0.2117647, 0, 1,
-1.668857, 0.5360484, -1.886081, 1, 0.2156863, 0, 1,
-1.664127, -2.255522, -2.233691, 1, 0.2235294, 0, 1,
-1.651603, 0.598823, -2.296252, 1, 0.227451, 0, 1,
-1.637913, 0.1796102, -0.7459021, 1, 0.2352941, 0, 1,
-1.610496, -0.009642983, -2.698385, 1, 0.2392157, 0, 1,
-1.600948, -0.7522579, -0.1909776, 1, 0.2470588, 0, 1,
-1.600342, -0.3303288, -1.253491, 1, 0.2509804, 0, 1,
-1.587754, 1.672167, -1.261583, 1, 0.2588235, 0, 1,
-1.58387, 1.305, -0.9484419, 1, 0.2627451, 0, 1,
-1.58005, -0.5309523, -0.0007636168, 1, 0.2705882, 0, 1,
-1.561856, 1.000787, -0.8455751, 1, 0.2745098, 0, 1,
-1.560351, 2.204126, -1.578421, 1, 0.282353, 0, 1,
-1.547904, 0.8948519, -1.022041, 1, 0.2862745, 0, 1,
-1.545946, 0.3529939, -1.288916, 1, 0.2941177, 0, 1,
-1.544177, 0.01738142, -3.388887, 1, 0.3019608, 0, 1,
-1.517975, 0.9426079, -2.024732, 1, 0.3058824, 0, 1,
-1.511645, -1.083095, -2.429152, 1, 0.3137255, 0, 1,
-1.511431, -0.7017868, -1.042192, 1, 0.3176471, 0, 1,
-1.509546, -0.1046392, 0.4838975, 1, 0.3254902, 0, 1,
-1.488983, -0.7829515, -2.58835, 1, 0.3294118, 0, 1,
-1.486314, -0.08075124, -0.9071856, 1, 0.3372549, 0, 1,
-1.484994, -0.5035728, -2.965709, 1, 0.3411765, 0, 1,
-1.484496, -1.0346, -3.364992, 1, 0.3490196, 0, 1,
-1.471115, -0.1489997, -3.016373, 1, 0.3529412, 0, 1,
-1.470281, -0.06035291, -1.292043, 1, 0.3607843, 0, 1,
-1.454735, 1.289338, 0.8659202, 1, 0.3647059, 0, 1,
-1.452855, -1.470429, -3.852961, 1, 0.372549, 0, 1,
-1.450635, 0.5554282, -3.972859, 1, 0.3764706, 0, 1,
-1.44859, 0.4767425, -2.566908, 1, 0.3843137, 0, 1,
-1.44661, -1.58128, -1.087531, 1, 0.3882353, 0, 1,
-1.441262, -2.21599, -2.933921, 1, 0.3960784, 0, 1,
-1.437887, 0.6457871, 0.5827239, 1, 0.4039216, 0, 1,
-1.409123, -2.182217, -2.337997, 1, 0.4078431, 0, 1,
-1.407854, -0.6113189, -1.175693, 1, 0.4156863, 0, 1,
-1.40461, 1.040695, -0.6881741, 1, 0.4196078, 0, 1,
-1.395537, 0.3929529, -1.133834, 1, 0.427451, 0, 1,
-1.394208, -0.2871665, -1.635999, 1, 0.4313726, 0, 1,
-1.393431, 0.8414406, -1.11891, 1, 0.4392157, 0, 1,
-1.377395, -0.5962413, -3.727646, 1, 0.4431373, 0, 1,
-1.374658, -1.442699, -2.45683, 1, 0.4509804, 0, 1,
-1.365913, 0.03211189, -1.431973, 1, 0.454902, 0, 1,
-1.354568, 1.158778, 1.042524, 1, 0.4627451, 0, 1,
-1.348815, 0.7598209, 0.02103275, 1, 0.4666667, 0, 1,
-1.347457, 1.692473, -0.08511424, 1, 0.4745098, 0, 1,
-1.342376, -0.7476972, 0.4342954, 1, 0.4784314, 0, 1,
-1.338913, -1.008961, -0.9408532, 1, 0.4862745, 0, 1,
-1.335753, 0.5913318, -0.848149, 1, 0.4901961, 0, 1,
-1.332024, -1.772663, 0.8899053, 1, 0.4980392, 0, 1,
-1.33063, -0.4735847, -0.6063839, 1, 0.5058824, 0, 1,
-1.328675, 0.5624759, -1.136125, 1, 0.509804, 0, 1,
-1.328321, 0.1701295, -0.9426607, 1, 0.5176471, 0, 1,
-1.319059, -1.468238, -0.8011312, 1, 0.5215687, 0, 1,
-1.290582, -2.162798, -2.330318, 1, 0.5294118, 0, 1,
-1.287068, -0.420734, -3.393063, 1, 0.5333334, 0, 1,
-1.266551, 0.8039697, -0.6818429, 1, 0.5411765, 0, 1,
-1.261441, -2.204635, -1.698712, 1, 0.5450981, 0, 1,
-1.259425, -0.8480736, -2.968746, 1, 0.5529412, 0, 1,
-1.25489, 0.278073, -1.745358, 1, 0.5568628, 0, 1,
-1.252468, -0.1752673, -3.05109, 1, 0.5647059, 0, 1,
-1.24971, -3.079064, -1.888867, 1, 0.5686275, 0, 1,
-1.248234, -0.7217369, -4.176036, 1, 0.5764706, 0, 1,
-1.247598, 0.4906782, -0.4562477, 1, 0.5803922, 0, 1,
-1.234523, 1.858222, -1.234832, 1, 0.5882353, 0, 1,
-1.233133, 0.9650506, -0.6769503, 1, 0.5921569, 0, 1,
-1.227992, -0.4069331, -0.399678, 1, 0.6, 0, 1,
-1.222991, 1.064682, -0.4377324, 1, 0.6078432, 0, 1,
-1.219286, -1.026634, -1.671964, 1, 0.6117647, 0, 1,
-1.219209, -0.5955146, -3.177151, 1, 0.6196079, 0, 1,
-1.218362, -2.4422, -3.064661, 1, 0.6235294, 0, 1,
-1.213935, -0.4864427, -1.886651, 1, 0.6313726, 0, 1,
-1.202742, 0.512073, -1.879139, 1, 0.6352941, 0, 1,
-1.196404, 0.2713094, -0.3619878, 1, 0.6431373, 0, 1,
-1.189323, -1.513761, -1.596803, 1, 0.6470588, 0, 1,
-1.185871, 0.08335682, -2.139041, 1, 0.654902, 0, 1,
-1.182934, -0.4901795, -2.613775, 1, 0.6588235, 0, 1,
-1.182081, 0.8499984, -0.6601654, 1, 0.6666667, 0, 1,
-1.180911, 1.425779, -1.896929, 1, 0.6705883, 0, 1,
-1.177972, 0.1892728, -1.306866, 1, 0.6784314, 0, 1,
-1.175897, 0.2701379, 0.3237073, 1, 0.682353, 0, 1,
-1.167519, -0.528278, -4.197294, 1, 0.6901961, 0, 1,
-1.163229, 0.3313389, -0.4500068, 1, 0.6941177, 0, 1,
-1.163096, 0.1978749, -2.176313, 1, 0.7019608, 0, 1,
-1.161509, -0.761175, -3.206422, 1, 0.7098039, 0, 1,
-1.157579, 0.6548347, -1.113044, 1, 0.7137255, 0, 1,
-1.152469, -0.06244433, -1.078692, 1, 0.7215686, 0, 1,
-1.149892, 0.2276876, -1.124841, 1, 0.7254902, 0, 1,
-1.145779, 1.191811, -2.199856, 1, 0.7333333, 0, 1,
-1.144938, -0.5970399, -2.624658, 1, 0.7372549, 0, 1,
-1.143098, -1.452895, -2.23802, 1, 0.7450981, 0, 1,
-1.125585, -0.5685676, -2.94246, 1, 0.7490196, 0, 1,
-1.124988, 0.5335559, -2.279774, 1, 0.7568628, 0, 1,
-1.120888, 1.902992, -0.363108, 1, 0.7607843, 0, 1,
-1.114899, 1.225689, -0.6455188, 1, 0.7686275, 0, 1,
-1.113509, -0.6959227, -1.121761, 1, 0.772549, 0, 1,
-1.111199, -1.994063, -3.700682, 1, 0.7803922, 0, 1,
-1.108789, 0.3822978, -1.656568, 1, 0.7843137, 0, 1,
-1.105887, 0.0062154, -1.49953, 1, 0.7921569, 0, 1,
-1.105368, -0.5779426, -1.063159, 1, 0.7960784, 0, 1,
-1.096613, 2.950348, -2.703479, 1, 0.8039216, 0, 1,
-1.095474, 1.01275, -0.956573, 1, 0.8117647, 0, 1,
-1.089502, 1.069886, 1.221668, 1, 0.8156863, 0, 1,
-1.088184, -1.134381, -2.137854, 1, 0.8235294, 0, 1,
-1.08665, -0.02368025, -2.892184, 1, 0.827451, 0, 1,
-1.086423, -1.526181, -1.700057, 1, 0.8352941, 0, 1,
-1.085263, 0.8626522, -0.7067302, 1, 0.8392157, 0, 1,
-1.085156, 1.196588, -0.3420252, 1, 0.8470588, 0, 1,
-1.08142, 0.2180346, 0.4524153, 1, 0.8509804, 0, 1,
-1.072507, 0.01439597, -0.7987248, 1, 0.8588235, 0, 1,
-1.070441, 0.3374002, -2.352732, 1, 0.8627451, 0, 1,
-1.063586, 0.4760117, -2.086324, 1, 0.8705882, 0, 1,
-1.061061, -1.141568, -3.206524, 1, 0.8745098, 0, 1,
-1.060694, 1.116066, 0.4690911, 1, 0.8823529, 0, 1,
-1.060026, 2.175069, -0.1415438, 1, 0.8862745, 0, 1,
-1.059188, 0.8048236, -0.09720019, 1, 0.8941177, 0, 1,
-1.054863, -0.1804148, -3.993568, 1, 0.8980392, 0, 1,
-1.049624, 0.4119906, -1.309306, 1, 0.9058824, 0, 1,
-1.048645, 0.1896068, -1.977653, 1, 0.9137255, 0, 1,
-1.0458, 0.4848032, -0.9701611, 1, 0.9176471, 0, 1,
-1.045786, 0.4809131, -2.358267, 1, 0.9254902, 0, 1,
-1.040753, 1.271577, -1.223555, 1, 0.9294118, 0, 1,
-1.040439, 1.730496, -1.5744, 1, 0.9372549, 0, 1,
-1.034276, -1.637201, -4.209321, 1, 0.9411765, 0, 1,
-1.033619, -0.6331517, -2.971173, 1, 0.9490196, 0, 1,
-1.016205, 0.9033558, -0.467936, 1, 0.9529412, 0, 1,
-1.005654, -0.6302189, -3.248614, 1, 0.9607843, 0, 1,
-1.005596, 0.03980434, -0.395269, 1, 0.9647059, 0, 1,
-1.002757, -0.4668951, -3.56225, 1, 0.972549, 0, 1,
-0.9983023, -0.591133, -1.252414, 1, 0.9764706, 0, 1,
-0.9980844, 0.03797509, -0.2535756, 1, 0.9843137, 0, 1,
-0.9881454, -1.040565, -3.435181, 1, 0.9882353, 0, 1,
-0.9843466, -0.8906184, -3.340964, 1, 0.9960784, 0, 1,
-0.9803951, -0.4697966, -1.660289, 0.9960784, 1, 0, 1,
-0.9795206, -0.05507644, -3.100629, 0.9921569, 1, 0, 1,
-0.9783534, -1.55728, -2.918916, 0.9843137, 1, 0, 1,
-0.9781666, -0.1485316, -2.271071, 0.9803922, 1, 0, 1,
-0.9775173, -0.7221503, -2.63567, 0.972549, 1, 0, 1,
-0.9658277, -0.3854733, -2.835333, 0.9686275, 1, 0, 1,
-0.9638703, 1.40861, -0.7186372, 0.9607843, 1, 0, 1,
-0.9635578, -0.0727375, 0.1814125, 0.9568627, 1, 0, 1,
-0.9549659, 0.1283394, -0.6526627, 0.9490196, 1, 0, 1,
-0.9470677, 0.2912794, -2.091843, 0.945098, 1, 0, 1,
-0.940613, 0.03066407, -0.9717481, 0.9372549, 1, 0, 1,
-0.9305308, -2.104759, -2.742475, 0.9333333, 1, 0, 1,
-0.9302565, 0.3011183, -2.040419, 0.9254902, 1, 0, 1,
-0.9301599, 0.9933613, -1.428907, 0.9215686, 1, 0, 1,
-0.9258298, -0.7965477, -1.158887, 0.9137255, 1, 0, 1,
-0.9245467, -1.460336, -2.635981, 0.9098039, 1, 0, 1,
-0.9230108, -1.762101, -3.149209, 0.9019608, 1, 0, 1,
-0.9221961, 0.3893504, -0.8512172, 0.8941177, 1, 0, 1,
-0.9182838, -0.4754941, -1.801628, 0.8901961, 1, 0, 1,
-0.915024, -0.06028559, -1.215264, 0.8823529, 1, 0, 1,
-0.9134512, -0.3694869, -2.42056, 0.8784314, 1, 0, 1,
-0.911382, -0.8235909, -4.49473, 0.8705882, 1, 0, 1,
-0.910306, -0.4957852, -1.682034, 0.8666667, 1, 0, 1,
-0.9088309, -0.7144889, -2.935522, 0.8588235, 1, 0, 1,
-0.9021932, 1.617594, -1.058364, 0.854902, 1, 0, 1,
-0.8987018, -0.0815575, -1.63728, 0.8470588, 1, 0, 1,
-0.8953943, -0.7561663, -1.240732, 0.8431373, 1, 0, 1,
-0.8938445, 0.5735096, -1.227053, 0.8352941, 1, 0, 1,
-0.8896649, -0.8709419, -3.245264, 0.8313726, 1, 0, 1,
-0.8876883, 1.023222, -0.1785716, 0.8235294, 1, 0, 1,
-0.8868926, -1.490159, -2.484349, 0.8196079, 1, 0, 1,
-0.8849327, 0.8315662, -1.591006, 0.8117647, 1, 0, 1,
-0.8772765, 0.5893627, -0.9132579, 0.8078431, 1, 0, 1,
-0.8765426, -2.56452, -1.909066, 0.8, 1, 0, 1,
-0.8699346, 1.247324, 0.8017107, 0.7921569, 1, 0, 1,
-0.8665966, 0.6124067, -1.461401, 0.7882353, 1, 0, 1,
-0.8642009, -2.382224, -2.061582, 0.7803922, 1, 0, 1,
-0.8638571, -1.3147, -3.483316, 0.7764706, 1, 0, 1,
-0.8580033, -0.2092872, -2.796748, 0.7686275, 1, 0, 1,
-0.8528358, 0.2693946, -0.01680769, 0.7647059, 1, 0, 1,
-0.8525726, 0.5054799, -2.727554, 0.7568628, 1, 0, 1,
-0.8389624, -1.00247, -2.928984, 0.7529412, 1, 0, 1,
-0.8365737, -0.1684404, -1.776911, 0.7450981, 1, 0, 1,
-0.8335856, 1.21219, -0.5965841, 0.7411765, 1, 0, 1,
-0.82692, -0.003525742, -0.3311877, 0.7333333, 1, 0, 1,
-0.8250886, 0.2470298, 0.2241607, 0.7294118, 1, 0, 1,
-0.8221779, -0.5642239, -2.75304, 0.7215686, 1, 0, 1,
-0.8167876, -1.696712, -3.481183, 0.7176471, 1, 0, 1,
-0.8167228, 1.23943, -0.4250538, 0.7098039, 1, 0, 1,
-0.8123761, 2.018787, -0.2430207, 0.7058824, 1, 0, 1,
-0.8102375, -0.4389724, -3.654319, 0.6980392, 1, 0, 1,
-0.8095207, -0.03334389, -1.175056, 0.6901961, 1, 0, 1,
-0.8077778, -0.6098074, -4.16682, 0.6862745, 1, 0, 1,
-0.8071879, -1.554462, -1.841838, 0.6784314, 1, 0, 1,
-0.802157, 0.2551116, -1.539676, 0.6745098, 1, 0, 1,
-0.7868596, 2.08093, 1.869562, 0.6666667, 1, 0, 1,
-0.7851338, 0.1580836, -1.866364, 0.6627451, 1, 0, 1,
-0.7820529, 1.235867, 1.01294, 0.654902, 1, 0, 1,
-0.7817494, -0.8186557, -2.701056, 0.6509804, 1, 0, 1,
-0.781427, 1.593223, -1.015053, 0.6431373, 1, 0, 1,
-0.779816, -0.3928832, -1.192016, 0.6392157, 1, 0, 1,
-0.7774597, 0.7891822, 0.5705652, 0.6313726, 1, 0, 1,
-0.7706732, 0.9094117, 1.479221, 0.627451, 1, 0, 1,
-0.7653164, -0.9413531, -1.189414, 0.6196079, 1, 0, 1,
-0.7650945, 1.1591, -0.214722, 0.6156863, 1, 0, 1,
-0.7639286, 0.133112, -1.916161, 0.6078432, 1, 0, 1,
-0.7590946, -0.006053045, -1.79195, 0.6039216, 1, 0, 1,
-0.7581637, 0.03289563, -3.126747, 0.5960785, 1, 0, 1,
-0.7571651, -0.8396553, -3.309555, 0.5882353, 1, 0, 1,
-0.7540662, 1.569649, -1.303233, 0.5843138, 1, 0, 1,
-0.7517478, 0.3189692, -1.319384, 0.5764706, 1, 0, 1,
-0.747831, 0.8235667, -0.9872523, 0.572549, 1, 0, 1,
-0.7386891, -0.7713346, -0.2172634, 0.5647059, 1, 0, 1,
-0.7379315, 0.5499962, 0.2650728, 0.5607843, 1, 0, 1,
-0.735474, 1.433622, -1.316526, 0.5529412, 1, 0, 1,
-0.7347465, 1.355434, -2.527657, 0.5490196, 1, 0, 1,
-0.7319661, -0.5038666, -3.71242, 0.5411765, 1, 0, 1,
-0.7239323, -0.7936792, -0.7045026, 0.5372549, 1, 0, 1,
-0.7223135, 0.536771, -2.058015, 0.5294118, 1, 0, 1,
-0.7218624, -1.203941, 0.0176749, 0.5254902, 1, 0, 1,
-0.7208527, -0.3517936, -0.8835137, 0.5176471, 1, 0, 1,
-0.7199602, 0.4880217, -0.8317204, 0.5137255, 1, 0, 1,
-0.7138029, -1.008647, -2.336419, 0.5058824, 1, 0, 1,
-0.7128897, -0.7677622, -2.445028, 0.5019608, 1, 0, 1,
-0.7076387, 0.8724756, -0.4767245, 0.4941176, 1, 0, 1,
-0.699834, -0.6360996, -2.381919, 0.4862745, 1, 0, 1,
-0.6988416, -0.552106, -0.8134401, 0.4823529, 1, 0, 1,
-0.6951234, 1.311491, -2.518974, 0.4745098, 1, 0, 1,
-0.6879514, 0.5446389, -0.6323007, 0.4705882, 1, 0, 1,
-0.6876498, -1.06479, -3.280323, 0.4627451, 1, 0, 1,
-0.6849483, -1.595082, -0.6842161, 0.4588235, 1, 0, 1,
-0.6812671, -0.9646028, -1.567016, 0.4509804, 1, 0, 1,
-0.6800719, 1.127394, 1.045387, 0.4470588, 1, 0, 1,
-0.6777616, -0.6667106, -2.511736, 0.4392157, 1, 0, 1,
-0.6774473, -4.037601, -1.582113, 0.4352941, 1, 0, 1,
-0.6769826, -0.8271378, -3.842692, 0.427451, 1, 0, 1,
-0.6737427, 0.5683629, 0.2590398, 0.4235294, 1, 0, 1,
-0.6728233, 0.745237, -0.2520009, 0.4156863, 1, 0, 1,
-0.6687039, -1.028777, -2.250088, 0.4117647, 1, 0, 1,
-0.6671304, -0.1423564, -2.407145, 0.4039216, 1, 0, 1,
-0.6612973, -0.06998488, -1.129367, 0.3960784, 1, 0, 1,
-0.6591244, -0.4827567, -0.5652962, 0.3921569, 1, 0, 1,
-0.6583755, 0.3140954, 0.3115719, 0.3843137, 1, 0, 1,
-0.6534829, -1.272714, -2.653287, 0.3803922, 1, 0, 1,
-0.6531088, 0.7717452, -2.066518, 0.372549, 1, 0, 1,
-0.6528927, 1.239242, -1.163981, 0.3686275, 1, 0, 1,
-0.6501034, 2.147478, -0.9988371, 0.3607843, 1, 0, 1,
-0.6450839, 0.3275495, 0.4245695, 0.3568628, 1, 0, 1,
-0.6418409, 0.2631921, -1.866726, 0.3490196, 1, 0, 1,
-0.6361163, 0.7351902, -0.5195185, 0.345098, 1, 0, 1,
-0.6324758, 1.395098, 0.4233806, 0.3372549, 1, 0, 1,
-0.6292493, 1.369689, -2.412049, 0.3333333, 1, 0, 1,
-0.6252167, -0.9384649, -1.836041, 0.3254902, 1, 0, 1,
-0.6214624, -0.288225, -3.504162, 0.3215686, 1, 0, 1,
-0.6214148, -0.05301249, -1.471361, 0.3137255, 1, 0, 1,
-0.6201886, -0.04283356, -1.924988, 0.3098039, 1, 0, 1,
-0.6173058, -0.8920118, -3.117236, 0.3019608, 1, 0, 1,
-0.6154906, 0.928405, 1.050633, 0.2941177, 1, 0, 1,
-0.6131207, 1.512584, 0.2743076, 0.2901961, 1, 0, 1,
-0.6091626, 0.9876235, -0.9155629, 0.282353, 1, 0, 1,
-0.6067469, 0.5036106, -0.218376, 0.2784314, 1, 0, 1,
-0.6031317, -3.032937, -4.221325, 0.2705882, 1, 0, 1,
-0.6012299, -0.01860869, -1.958345, 0.2666667, 1, 0, 1,
-0.5988822, -0.002159223, -2.573527, 0.2588235, 1, 0, 1,
-0.5979161, 1.573954, -0.5515944, 0.254902, 1, 0, 1,
-0.5966066, -0.2575275, -3.365258, 0.2470588, 1, 0, 1,
-0.5932117, 0.6570318, -0.8211437, 0.2431373, 1, 0, 1,
-0.5903208, 0.8418799, -1.484921, 0.2352941, 1, 0, 1,
-0.5874504, 1.391436, -2.389264, 0.2313726, 1, 0, 1,
-0.5828676, 1.401581, -1.011294, 0.2235294, 1, 0, 1,
-0.5807433, 0.8202652, -1.800246, 0.2196078, 1, 0, 1,
-0.577597, -0.3744343, -1.540931, 0.2117647, 1, 0, 1,
-0.5744133, -1.760117, -3.679842, 0.2078431, 1, 0, 1,
-0.5729563, -0.1974212, -3.375687, 0.2, 1, 0, 1,
-0.5723714, 0.7989056, -0.9292093, 0.1921569, 1, 0, 1,
-0.5721872, 0.07345935, -1.432938, 0.1882353, 1, 0, 1,
-0.5686822, 0.1777065, -1.302233, 0.1803922, 1, 0, 1,
-0.5680974, 1.862869, 2.21801, 0.1764706, 1, 0, 1,
-0.566238, -2.593069, -2.162184, 0.1686275, 1, 0, 1,
-0.5643705, -0.1107423, -3.027272, 0.1647059, 1, 0, 1,
-0.5622853, 0.7914414, -0.2246369, 0.1568628, 1, 0, 1,
-0.5554288, 0.1989706, -1.070771, 0.1529412, 1, 0, 1,
-0.5548503, -1.774938, -3.444145, 0.145098, 1, 0, 1,
-0.5538676, 0.1622497, -2.16272, 0.1411765, 1, 0, 1,
-0.5531058, -2.281622, -2.686686, 0.1333333, 1, 0, 1,
-0.5530686, -0.5867529, -1.962997, 0.1294118, 1, 0, 1,
-0.5415804, -1.12625, -3.38384, 0.1215686, 1, 0, 1,
-0.540383, -0.9470012, -2.918787, 0.1176471, 1, 0, 1,
-0.5392474, 1.321791, -0.02234603, 0.1098039, 1, 0, 1,
-0.5388409, 0.1565014, -2.247619, 0.1058824, 1, 0, 1,
-0.5387571, -0.1974327, -2.433998, 0.09803922, 1, 0, 1,
-0.5372818, 1.062534, -0.8232661, 0.09019608, 1, 0, 1,
-0.5295609, 1.301002, 0.7741262, 0.08627451, 1, 0, 1,
-0.5274358, -0.01907775, -1.382896, 0.07843138, 1, 0, 1,
-0.5236514, 0.1437539, -2.027759, 0.07450981, 1, 0, 1,
-0.523025, -1.322939, -2.429603, 0.06666667, 1, 0, 1,
-0.5229645, -1.578642, -4.114082, 0.0627451, 1, 0, 1,
-0.5228278, 0.3730625, -0.8521965, 0.05490196, 1, 0, 1,
-0.5207576, 0.6447772, -0.2587868, 0.05098039, 1, 0, 1,
-0.5126392, 0.4814731, -0.481167, 0.04313726, 1, 0, 1,
-0.5083593, 0.2360692, -0.9751289, 0.03921569, 1, 0, 1,
-0.5059314, -0.7710603, -2.045411, 0.03137255, 1, 0, 1,
-0.5018245, -0.6154467, -2.165462, 0.02745098, 1, 0, 1,
-0.4991668, 0.1882288, -0.5178105, 0.01960784, 1, 0, 1,
-0.4980641, -2.122487, -2.256624, 0.01568628, 1, 0, 1,
-0.4960754, -0.143339, -2.078721, 0.007843138, 1, 0, 1,
-0.494141, -0.2393468, -2.558594, 0.003921569, 1, 0, 1,
-0.4933997, 0.3447499, -2.421288, 0, 1, 0.003921569, 1,
-0.4930869, 1.172005, -0.8859205, 0, 1, 0.01176471, 1,
-0.4901554, 1.688724, -0.2156093, 0, 1, 0.01568628, 1,
-0.4850415, -0.4077999, -1.902217, 0, 1, 0.02352941, 1,
-0.4807897, 1.463233, -0.3816511, 0, 1, 0.02745098, 1,
-0.4791304, -1.925114, -2.772529, 0, 1, 0.03529412, 1,
-0.4786927, 0.7058515, 1.244612, 0, 1, 0.03921569, 1,
-0.4749475, -1.133603, -1.839428, 0, 1, 0.04705882, 1,
-0.4737169, 0.4783897, 0.4243076, 0, 1, 0.05098039, 1,
-0.4712723, -0.3938711, -1.400402, 0, 1, 0.05882353, 1,
-0.4681867, 0.718729, -1.52523, 0, 1, 0.0627451, 1,
-0.4598167, 1.056383, 0.9548191, 0, 1, 0.07058824, 1,
-0.4589303, 2.778988, -1.069275, 0, 1, 0.07450981, 1,
-0.458584, -1.417492, -3.955822, 0, 1, 0.08235294, 1,
-0.4553102, 0.8995618, -1.284339, 0, 1, 0.08627451, 1,
-0.4532923, 0.8407686, -0.1551911, 0, 1, 0.09411765, 1,
-0.4521318, 1.26729, -1.309292, 0, 1, 0.1019608, 1,
-0.4500483, -2.538314, -1.088348, 0, 1, 0.1058824, 1,
-0.4463129, 0.05156001, -0.5867775, 0, 1, 0.1137255, 1,
-0.4400122, -0.9468064, -2.764305, 0, 1, 0.1176471, 1,
-0.4376163, 1.487129, 0.2545251, 0, 1, 0.1254902, 1,
-0.4279515, -1.177874, -2.541523, 0, 1, 0.1294118, 1,
-0.4256982, 0.5594289, -2.646858, 0, 1, 0.1372549, 1,
-0.4199982, 2.829828, -0.7736579, 0, 1, 0.1411765, 1,
-0.4199415, 0.2503413, -0.8232635, 0, 1, 0.1490196, 1,
-0.4177406, 0.537938, -1.977096, 0, 1, 0.1529412, 1,
-0.4132802, -0.3357974, -3.371155, 0, 1, 0.1607843, 1,
-0.4089154, -1.334413, -3.532866, 0, 1, 0.1647059, 1,
-0.4085138, -0.3332943, -1.694266, 0, 1, 0.172549, 1,
-0.4070065, -0.4548454, -1.502823, 0, 1, 0.1764706, 1,
-0.4051486, -1.271468, -4.035373, 0, 1, 0.1843137, 1,
-0.4027472, -1.094762, -2.895023, 0, 1, 0.1882353, 1,
-0.3880718, -0.688008, -1.425788, 0, 1, 0.1960784, 1,
-0.3868952, -0.3197024, -1.605639, 0, 1, 0.2039216, 1,
-0.3863111, 1.012974, -0.6318088, 0, 1, 0.2078431, 1,
-0.3857126, 0.3193057, -2.104795, 0, 1, 0.2156863, 1,
-0.3852765, 0.9128719, 0.1993352, 0, 1, 0.2196078, 1,
-0.383321, 1.268139, -1.498539, 0, 1, 0.227451, 1,
-0.3808822, 0.6541494, -0.04336843, 0, 1, 0.2313726, 1,
-0.3800445, 1.414255, -0.1723366, 0, 1, 0.2392157, 1,
-0.3748612, -0.9868832, -3.316601, 0, 1, 0.2431373, 1,
-0.3746579, -0.5446789, -1.982828, 0, 1, 0.2509804, 1,
-0.3674421, 1.596267, -1.077543, 0, 1, 0.254902, 1,
-0.3665597, 0.9666519, -1.393137, 0, 1, 0.2627451, 1,
-0.3644295, 1.743609, -0.09941723, 0, 1, 0.2666667, 1,
-0.3573359, 0.08261884, -2.307889, 0, 1, 0.2745098, 1,
-0.3538008, -1.024376, -2.649414, 0, 1, 0.2784314, 1,
-0.3536516, 0.9031938, -0.8025225, 0, 1, 0.2862745, 1,
-0.3490769, 1.972612, -0.9152574, 0, 1, 0.2901961, 1,
-0.3441424, -0.6431206, -0.6918229, 0, 1, 0.2980392, 1,
-0.3435843, -0.5246001, -5.941289, 0, 1, 0.3058824, 1,
-0.3397265, 1.057887, -1.434197, 0, 1, 0.3098039, 1,
-0.3393224, -1.586532, -2.695137, 0, 1, 0.3176471, 1,
-0.3367821, 0.02007237, -2.59162, 0, 1, 0.3215686, 1,
-0.3356419, 0.7143157, -1.337186, 0, 1, 0.3294118, 1,
-0.3354912, 1.199164, 1.208, 0, 1, 0.3333333, 1,
-0.3304744, 1.51661, 0.4750191, 0, 1, 0.3411765, 1,
-0.3273065, -0.5053901, -0.9521567, 0, 1, 0.345098, 1,
-0.3151909, -0.8364294, -3.151992, 0, 1, 0.3529412, 1,
-0.3097256, 0.849896, 0.9040242, 0, 1, 0.3568628, 1,
-0.3069874, -0.4356827, -1.93619, 0, 1, 0.3647059, 1,
-0.3064278, -0.2769211, -3.114218, 0, 1, 0.3686275, 1,
-0.3012994, 0.03348291, -1.520004, 0, 1, 0.3764706, 1,
-0.299338, 1.484817, 0.7027382, 0, 1, 0.3803922, 1,
-0.2977994, -0.3104163, -3.815181, 0, 1, 0.3882353, 1,
-0.2962434, -0.2442033, -3.12665, 0, 1, 0.3921569, 1,
-0.2936603, 0.1425206, -1.313464, 0, 1, 0.4, 1,
-0.2926258, -0.7589073, -2.602928, 0, 1, 0.4078431, 1,
-0.2877751, -1.531049, -2.361148, 0, 1, 0.4117647, 1,
-0.2856784, 1.027572, -1.632558, 0, 1, 0.4196078, 1,
-0.2840696, 0.1272885, 0.354259, 0, 1, 0.4235294, 1,
-0.2806526, 0.539198, -2.14847, 0, 1, 0.4313726, 1,
-0.2734886, 0.4829717, -1.005079, 0, 1, 0.4352941, 1,
-0.2667152, 0.6828862, -2.289011, 0, 1, 0.4431373, 1,
-0.2652178, -0.7895913, -1.296707, 0, 1, 0.4470588, 1,
-0.2623121, 1.28378, -0.3149518, 0, 1, 0.454902, 1,
-0.2618942, -1.69359, -3.716507, 0, 1, 0.4588235, 1,
-0.2618711, 0.773824, 1.448601, 0, 1, 0.4666667, 1,
-0.2573234, -0.1704435, -1.275769, 0, 1, 0.4705882, 1,
-0.2560502, 0.7524271, 1.573997, 0, 1, 0.4784314, 1,
-0.2502965, -0.3861984, -3.142419, 0, 1, 0.4823529, 1,
-0.2487393, 0.9144873, -2.373673, 0, 1, 0.4901961, 1,
-0.2422268, 0.871629, 0.3456011, 0, 1, 0.4941176, 1,
-0.2394184, 0.7221708, 2.247979, 0, 1, 0.5019608, 1,
-0.2393157, 0.8484281, 0.712844, 0, 1, 0.509804, 1,
-0.2372114, 0.6263754, -0.3371125, 0, 1, 0.5137255, 1,
-0.2371368, -0.8103365, -2.387471, 0, 1, 0.5215687, 1,
-0.2258556, -1.187151, -3.459473, 0, 1, 0.5254902, 1,
-0.224245, 1.280343, -0.4503388, 0, 1, 0.5333334, 1,
-0.2206913, 0.126193, -3.939177, 0, 1, 0.5372549, 1,
-0.2206704, 0.1042728, -1.865911, 0, 1, 0.5450981, 1,
-0.2188865, -0.2483445, -2.516132, 0, 1, 0.5490196, 1,
-0.2188163, 1.174623, 1.067618, 0, 1, 0.5568628, 1,
-0.2168437, -3.106168, -1.705217, 0, 1, 0.5607843, 1,
-0.2148575, 0.2899887, -0.7469027, 0, 1, 0.5686275, 1,
-0.2120176, 0.5518319, -1.185753, 0, 1, 0.572549, 1,
-0.2093812, 0.3445309, -0.8053003, 0, 1, 0.5803922, 1,
-0.2089489, 0.1995972, -0.7900823, 0, 1, 0.5843138, 1,
-0.2086425, -1.279795, -2.452747, 0, 1, 0.5921569, 1,
-0.2085042, -0.4786397, -0.9106082, 0, 1, 0.5960785, 1,
-0.2066864, -0.6412457, -2.786041, 0, 1, 0.6039216, 1,
-0.1993342, 0.6966323, 0.6896278, 0, 1, 0.6117647, 1,
-0.1990476, 1.243708, -0.8067977, 0, 1, 0.6156863, 1,
-0.1987366, 0.8611703, -1.08217, 0, 1, 0.6235294, 1,
-0.1978001, -0.4104338, -1.889887, 0, 1, 0.627451, 1,
-0.1954571, -0.5612642, -1.489557, 0, 1, 0.6352941, 1,
-0.1935612, 1.938477, 0.809354, 0, 1, 0.6392157, 1,
-0.1873069, 0.30335, 0.7065144, 0, 1, 0.6470588, 1,
-0.1868665, 1.400473, 0.7312249, 0, 1, 0.6509804, 1,
-0.1861724, 0.4603045, 0.2047698, 0, 1, 0.6588235, 1,
-0.184171, -0.6330567, -1.388633, 0, 1, 0.6627451, 1,
-0.181886, 1.503797, -0.9249324, 0, 1, 0.6705883, 1,
-0.1818453, -1.023364, -1.836178, 0, 1, 0.6745098, 1,
-0.1780002, 0.3456801, -1.34305, 0, 1, 0.682353, 1,
-0.1721501, 1.32386, 1.173298, 0, 1, 0.6862745, 1,
-0.171886, -0.1099742, -2.77289, 0, 1, 0.6941177, 1,
-0.165469, 0.4954808, -1.033209, 0, 1, 0.7019608, 1,
-0.1610409, 0.2369152, 0.7735173, 0, 1, 0.7058824, 1,
-0.1597913, 0.6316558, 1.206593, 0, 1, 0.7137255, 1,
-0.1596287, 1.022439, -0.02003623, 0, 1, 0.7176471, 1,
-0.1564819, 0.6618266, -0.04202036, 0, 1, 0.7254902, 1,
-0.1500736, -0.3036642, -4.6138, 0, 1, 0.7294118, 1,
-0.1493346, -0.04967729, -2.382441, 0, 1, 0.7372549, 1,
-0.1489615, -0.5385475, -2.926445, 0, 1, 0.7411765, 1,
-0.1444579, 1.099822, 0.3963524, 0, 1, 0.7490196, 1,
-0.1427177, -2.129663, -2.226481, 0, 1, 0.7529412, 1,
-0.1417551, -0.6458454, -3.400806, 0, 1, 0.7607843, 1,
-0.1395177, 0.3479379, -1.677017, 0, 1, 0.7647059, 1,
-0.1324851, -0.9203877, -2.623961, 0, 1, 0.772549, 1,
-0.1324612, -2.005862, -3.620585, 0, 1, 0.7764706, 1,
-0.1317926, 2.344599, 0.03485181, 0, 1, 0.7843137, 1,
-0.1299951, -0.4771248, -3.474154, 0, 1, 0.7882353, 1,
-0.126018, 2.222446, 0.7899759, 0, 1, 0.7960784, 1,
-0.1258123, -0.4184445, -2.505635, 0, 1, 0.8039216, 1,
-0.1237953, -0.6444792, -2.489061, 0, 1, 0.8078431, 1,
-0.1228424, -0.4421226, -2.386913, 0, 1, 0.8156863, 1,
-0.1180768, -2.135979, -4.354805, 0, 1, 0.8196079, 1,
-0.1124029, -0.3079026, -3.469277, 0, 1, 0.827451, 1,
-0.1124018, 0.3206723, -0.6346728, 0, 1, 0.8313726, 1,
-0.1107518, -1.412618, -1.903236, 0, 1, 0.8392157, 1,
-0.1102872, -0.352845, -2.425505, 0, 1, 0.8431373, 1,
-0.1099384, 0.546478, 1.149893, 0, 1, 0.8509804, 1,
-0.108581, -0.285717, -4.280494, 0, 1, 0.854902, 1,
-0.1072814, -0.7942937, -2.39479, 0, 1, 0.8627451, 1,
-0.1043288, -0.2751122, -2.719321, 0, 1, 0.8666667, 1,
-0.1042241, 0.9995931, -0.4054465, 0, 1, 0.8745098, 1,
-0.1019902, 0.5059521, 0.2319489, 0, 1, 0.8784314, 1,
-0.10171, -0.3061006, -2.809838, 0, 1, 0.8862745, 1,
-0.1011671, 0.08429227, -2.002584, 0, 1, 0.8901961, 1,
-0.1009902, 0.5136626, -1.087915, 0, 1, 0.8980392, 1,
-0.09753326, 1.025633, -1.889877, 0, 1, 0.9058824, 1,
-0.08775871, -0.1977626, -3.713677, 0, 1, 0.9098039, 1,
-0.08389998, 0.963864, 0.3166583, 0, 1, 0.9176471, 1,
-0.08389559, -1.266097, -3.916637, 0, 1, 0.9215686, 1,
-0.08371919, 0.7654989, -2.194595, 0, 1, 0.9294118, 1,
-0.0813863, 1.007268, 2.169268, 0, 1, 0.9333333, 1,
-0.08028473, -0.4962602, -3.118776, 0, 1, 0.9411765, 1,
-0.07876614, -0.2950916, -2.8831, 0, 1, 0.945098, 1,
-0.07737206, -1.095661, -3.487075, 0, 1, 0.9529412, 1,
-0.07511411, -0.3825675, -3.636957, 0, 1, 0.9568627, 1,
-0.0686244, 1.151597, -0.009763628, 0, 1, 0.9647059, 1,
-0.06393989, 0.3594575, -0.0004699378, 0, 1, 0.9686275, 1,
-0.06104536, -0.4636824, -3.309523, 0, 1, 0.9764706, 1,
-0.05662512, -1.252337, -0.5293651, 0, 1, 0.9803922, 1,
-0.0476129, 0.2069602, 0.2915364, 0, 1, 0.9882353, 1,
-0.04600948, 0.04176804, -0.6275957, 0, 1, 0.9921569, 1,
-0.04209876, -0.4942171, -3.559427, 0, 1, 1, 1,
-0.03072584, -1.458927, -3.148974, 0, 0.9921569, 1, 1,
-0.02999552, 0.1286625, 0.6218244, 0, 0.9882353, 1, 1,
-0.0293133, 0.5561407, -1.04875, 0, 0.9803922, 1, 1,
-0.02813409, 0.1044728, -0.2586815, 0, 0.9764706, 1, 1,
-0.02525742, -0.6539016, -5.260195, 0, 0.9686275, 1, 1,
-0.02434255, 1.494184, 0.2598341, 0, 0.9647059, 1, 1,
-0.02273761, -0.05088842, -4.371514, 0, 0.9568627, 1, 1,
-0.01567865, 2.330777, 0.4378794, 0, 0.9529412, 1, 1,
-0.01378254, 0.9335093, 0.6002436, 0, 0.945098, 1, 1,
-0.01159704, 0.6438254, -0.05239124, 0, 0.9411765, 1, 1,
-0.006977352, -0.925645, -3.618166, 0, 0.9333333, 1, 1,
-0.004691374, -0.3501305, -3.867932, 0, 0.9294118, 1, 1,
-0.001598195, -0.186046, -3.04453, 0, 0.9215686, 1, 1,
2.813815e-05, 1.286115, -1.442856, 0, 0.9176471, 1, 1,
0.001462055, -0.7285653, 2.778718, 0, 0.9098039, 1, 1,
0.004029946, 0.1070296, -0.003991663, 0, 0.9058824, 1, 1,
0.005519034, 0.3724917, 0.8586324, 0, 0.8980392, 1, 1,
0.005564423, -1.002586, 2.90004, 0, 0.8901961, 1, 1,
0.006047744, 0.2182367, -0.3304265, 0, 0.8862745, 1, 1,
0.009444675, -0.7105265, -0.161996, 0, 0.8784314, 1, 1,
0.01009512, 0.4469434, 0.4868432, 0, 0.8745098, 1, 1,
0.01649236, 1.257275, 0.02340701, 0, 0.8666667, 1, 1,
0.0180156, 0.7994096, -0.6607234, 0, 0.8627451, 1, 1,
0.01819489, -0.4669596, 3.811188, 0, 0.854902, 1, 1,
0.01847873, -1.319441, 2.212905, 0, 0.8509804, 1, 1,
0.01883314, 0.4391775, 1.231271, 0, 0.8431373, 1, 1,
0.0209347, -1.349804, 3.888378, 0, 0.8392157, 1, 1,
0.02566966, -0.3196528, 3.52221, 0, 0.8313726, 1, 1,
0.03164482, 0.2920808, 2.427881, 0, 0.827451, 1, 1,
0.03366955, 2.02581, -1.063777, 0, 0.8196079, 1, 1,
0.04055257, -1.46628, 3.766649, 0, 0.8156863, 1, 1,
0.04331429, 1.090664, 1.963193, 0, 0.8078431, 1, 1,
0.05049672, -0.8333887, 2.558361, 0, 0.8039216, 1, 1,
0.06375213, -0.1743881, 2.084491, 0, 0.7960784, 1, 1,
0.06725265, -0.08356488, 1.437681, 0, 0.7882353, 1, 1,
0.06753073, -1.107435, 2.441388, 0, 0.7843137, 1, 1,
0.06950778, -1.256785, 5.116058, 0, 0.7764706, 1, 1,
0.07956545, 0.9560534, -2.047718, 0, 0.772549, 1, 1,
0.08098458, -1.620826, 3.31069, 0, 0.7647059, 1, 1,
0.08132897, -0.2511292, 2.512088, 0, 0.7607843, 1, 1,
0.08239476, -0.4554382, 3.897127, 0, 0.7529412, 1, 1,
0.08496913, 0.3469348, 0.4024461, 0, 0.7490196, 1, 1,
0.0851703, -0.9371863, 2.722442, 0, 0.7411765, 1, 1,
0.08835148, -0.8559689, 4.246595, 0, 0.7372549, 1, 1,
0.08949779, -0.3972229, 2.667389, 0, 0.7294118, 1, 1,
0.09092063, 0.7324061, -0.416978, 0, 0.7254902, 1, 1,
0.09349822, -0.6691678, 1.534524, 0, 0.7176471, 1, 1,
0.09376302, -0.7208352, 2.514754, 0, 0.7137255, 1, 1,
0.09669388, -2.441342, 3.087595, 0, 0.7058824, 1, 1,
0.1047156, -0.6132352, 2.984161, 0, 0.6980392, 1, 1,
0.1129447, 0.3498667, 0.6840785, 0, 0.6941177, 1, 1,
0.1141222, -0.285112, 3.386674, 0, 0.6862745, 1, 1,
0.1195416, 0.3379309, 1.842959, 0, 0.682353, 1, 1,
0.120325, -0.3919412, 2.503771, 0, 0.6745098, 1, 1,
0.123988, 0.9548171, 0.6030259, 0, 0.6705883, 1, 1,
0.1303164, 1.003394, 0.4755544, 0, 0.6627451, 1, 1,
0.1306251, 0.8181611, 0.5828857, 0, 0.6588235, 1, 1,
0.1328757, -0.6316126, 3.470165, 0, 0.6509804, 1, 1,
0.1421346, -0.6948086, 3.528241, 0, 0.6470588, 1, 1,
0.1512025, -0.2065419, 4.659348, 0, 0.6392157, 1, 1,
0.1515726, 1.154978, -0.7004452, 0, 0.6352941, 1, 1,
0.1526337, -1.894317, 3.093636, 0, 0.627451, 1, 1,
0.1528205, 0.1301369, 1.50673, 0, 0.6235294, 1, 1,
0.1578111, 0.887699, 0.4462333, 0, 0.6156863, 1, 1,
0.1594959, 9.117712e-06, 3.139642, 0, 0.6117647, 1, 1,
0.1657632, 0.8972, 2.213875, 0, 0.6039216, 1, 1,
0.1657967, -0.5259023, 3.05166, 0, 0.5960785, 1, 1,
0.1703927, 0.6030702, 1.645513, 0, 0.5921569, 1, 1,
0.1757165, -0.2478047, 3.024067, 0, 0.5843138, 1, 1,
0.1761704, -1.666959, 5.241633, 0, 0.5803922, 1, 1,
0.176933, -0.2336872, 2.040505, 0, 0.572549, 1, 1,
0.1769509, -0.9245344, 1.609348, 0, 0.5686275, 1, 1,
0.1781698, 0.1872048, 1.187377, 0, 0.5607843, 1, 1,
0.1784347, 0.5082511, -0.6868453, 0, 0.5568628, 1, 1,
0.1791711, 2.025079, 1.753489, 0, 0.5490196, 1, 1,
0.1793442, 0.1166123, 0.7008088, 0, 0.5450981, 1, 1,
0.1827713, 0.5147026, 0.1168799, 0, 0.5372549, 1, 1,
0.1847469, 1.030211, -0.3621522, 0, 0.5333334, 1, 1,
0.1926609, -1.12271, 5.119892, 0, 0.5254902, 1, 1,
0.1977419, -0.1626903, 1.355727, 0, 0.5215687, 1, 1,
0.1994919, -1.321179, 3.178718, 0, 0.5137255, 1, 1,
0.2058654, -1.218405, 2.724925, 0, 0.509804, 1, 1,
0.2085868, 0.1599943, -1.190828, 0, 0.5019608, 1, 1,
0.2146397, 1.547865, 1.619162, 0, 0.4941176, 1, 1,
0.2167332, 0.643328, 0.08476984, 0, 0.4901961, 1, 1,
0.2172115, 0.9536955, -1.48147, 0, 0.4823529, 1, 1,
0.2179095, -1.224266, 3.568591, 0, 0.4784314, 1, 1,
0.2188298, 0.1211424, 0.1644413, 0, 0.4705882, 1, 1,
0.2261423, -1.248315, 3.776669, 0, 0.4666667, 1, 1,
0.2283566, 2.191036, 1.185154, 0, 0.4588235, 1, 1,
0.2311673, 1.106882, -0.7822032, 0, 0.454902, 1, 1,
0.2393098, -1.005356, 2.263313, 0, 0.4470588, 1, 1,
0.2393641, 0.7552068, 2.081251, 0, 0.4431373, 1, 1,
0.2417136, 0.8208002, -0.3940924, 0, 0.4352941, 1, 1,
0.2490324, 1.317113, 0.2528516, 0, 0.4313726, 1, 1,
0.2494816, -0.3896561, 2.436509, 0, 0.4235294, 1, 1,
0.2498193, -0.2621854, -0.05839149, 0, 0.4196078, 1, 1,
0.2514994, 0.2807069, 2.376796, 0, 0.4117647, 1, 1,
0.2622767, -0.3628355, 2.655283, 0, 0.4078431, 1, 1,
0.2706793, 1.147417, 0.5169144, 0, 0.4, 1, 1,
0.2715443, -2.107018, 2.454686, 0, 0.3921569, 1, 1,
0.2753176, -1.001779, 4.350722, 0, 0.3882353, 1, 1,
0.2769836, -0.9657902, 5.11817, 0, 0.3803922, 1, 1,
0.2794771, -1.202206, 3.869477, 0, 0.3764706, 1, 1,
0.2799352, 0.5214404, -0.5590958, 0, 0.3686275, 1, 1,
0.2817356, 0.3057229, 1.428125, 0, 0.3647059, 1, 1,
0.28281, 0.6780801, 0.3423833, 0, 0.3568628, 1, 1,
0.283303, -0.2662231, 1.977489, 0, 0.3529412, 1, 1,
0.2842362, 0.5783045, -0.1423401, 0, 0.345098, 1, 1,
0.2854309, -1.914079, 3.779648, 0, 0.3411765, 1, 1,
0.2856005, 0.241716, -0.1225119, 0, 0.3333333, 1, 1,
0.2888943, -0.06926876, 0.6780491, 0, 0.3294118, 1, 1,
0.2949867, -0.05134772, 1.468582, 0, 0.3215686, 1, 1,
0.3007616, 1.666458, -1.833161, 0, 0.3176471, 1, 1,
0.3049347, -0.2816984, 4.686465, 0, 0.3098039, 1, 1,
0.3121911, 0.5633023, 0.5534752, 0, 0.3058824, 1, 1,
0.3158119, 0.6702259, -1.31604, 0, 0.2980392, 1, 1,
0.3159772, -0.8466273, 4.643427, 0, 0.2901961, 1, 1,
0.3167081, 0.4577875, 0.8432985, 0, 0.2862745, 1, 1,
0.3177486, -0.5719236, 0.5650319, 0, 0.2784314, 1, 1,
0.3180702, -0.9626521, 3.177307, 0, 0.2745098, 1, 1,
0.3208066, 0.6964945, 2.19464, 0, 0.2666667, 1, 1,
0.3211919, 0.2795397, 1.524742, 0, 0.2627451, 1, 1,
0.3278405, 0.8084537, 2.37448, 0, 0.254902, 1, 1,
0.3300889, -1.014829, 2.645525, 0, 0.2509804, 1, 1,
0.3306158, -1.060184, 2.593279, 0, 0.2431373, 1, 1,
0.3478662, -1.779188, 2.693311, 0, 0.2392157, 1, 1,
0.3508234, -1.224011, 2.949111, 0, 0.2313726, 1, 1,
0.3529534, -0.195966, 1.966546, 0, 0.227451, 1, 1,
0.3540218, 0.3931564, 1.035649, 0, 0.2196078, 1, 1,
0.3552597, -1.318496, 0.3381047, 0, 0.2156863, 1, 1,
0.3669983, -0.4707128, 1.392204, 0, 0.2078431, 1, 1,
0.3767404, 0.1094698, 2.655114, 0, 0.2039216, 1, 1,
0.3931873, 0.4771409, -0.7341947, 0, 0.1960784, 1, 1,
0.3973185, -0.5609964, 1.56945, 0, 0.1882353, 1, 1,
0.3979784, -0.08798243, 3.024825, 0, 0.1843137, 1, 1,
0.3980784, 0.6728413, -0.4550775, 0, 0.1764706, 1, 1,
0.4000756, -0.2050487, 1.961071, 0, 0.172549, 1, 1,
0.4005565, -1.260707, 1.904885, 0, 0.1647059, 1, 1,
0.4054653, -0.6239491, 2.457365, 0, 0.1607843, 1, 1,
0.409601, -0.2762923, 1.559892, 0, 0.1529412, 1, 1,
0.4125549, -2.139406, 2.77127, 0, 0.1490196, 1, 1,
0.4191458, -0.2219801, 1.77421, 0, 0.1411765, 1, 1,
0.4203308, -1.133411, 3.545244, 0, 0.1372549, 1, 1,
0.421154, 0.1395247, 2.30112, 0, 0.1294118, 1, 1,
0.4212274, -0.3737814, 2.58222, 0, 0.1254902, 1, 1,
0.4214085, 0.5896379, -0.07963245, 0, 0.1176471, 1, 1,
0.4226924, 0.2207308, 2.05558, 0, 0.1137255, 1, 1,
0.4242479, -1.556059, 3.373428, 0, 0.1058824, 1, 1,
0.4260451, -0.627875, 2.552442, 0, 0.09803922, 1, 1,
0.4272223, 0.8157009, -1.407361, 0, 0.09411765, 1, 1,
0.4290048, 0.6170437, 0.3151676, 0, 0.08627451, 1, 1,
0.4294249, 0.5642586, 1.505719, 0, 0.08235294, 1, 1,
0.4310278, -1.279763, 2.264123, 0, 0.07450981, 1, 1,
0.4316324, 0.1293568, 1.849553, 0, 0.07058824, 1, 1,
0.4370551, 0.0633935, 1.339531, 0, 0.0627451, 1, 1,
0.4383231, -0.008355671, 2.406294, 0, 0.05882353, 1, 1,
0.443121, 1.245288, -0.3024918, 0, 0.05098039, 1, 1,
0.4440743, 0.0893997, 1.519931, 0, 0.04705882, 1, 1,
0.4447879, 0.9624117, 0.7926402, 0, 0.03921569, 1, 1,
0.4454867, -0.2283992, 2.486337, 0, 0.03529412, 1, 1,
0.4499631, 0.7311316, -1.345041, 0, 0.02745098, 1, 1,
0.4504965, -1.906757, 2.068314, 0, 0.02352941, 1, 1,
0.4509327, 0.9989635, -0.9377539, 0, 0.01568628, 1, 1,
0.453512, -0.7465143, 2.629923, 0, 0.01176471, 1, 1,
0.4552572, -0.3801402, 2.703761, 0, 0.003921569, 1, 1,
0.4555764, -1.473169, 2.776327, 0.003921569, 0, 1, 1,
0.45605, 1.828622, 1.12283, 0.007843138, 0, 1, 1,
0.4571294, 0.05390865, 2.031019, 0.01568628, 0, 1, 1,
0.4594395, 0.5858011, 1.559397, 0.01960784, 0, 1, 1,
0.4598881, -0.385363, 1.579844, 0.02745098, 0, 1, 1,
0.4664153, -0.3129674, 3.530723, 0.03137255, 0, 1, 1,
0.4706031, -0.6081263, 5.110587, 0.03921569, 0, 1, 1,
0.4725294, -1.280066, 2.111821, 0.04313726, 0, 1, 1,
0.4765306, -0.3544942, 1.869228, 0.05098039, 0, 1, 1,
0.481502, -0.672147, 2.250077, 0.05490196, 0, 1, 1,
0.4817618, 0.7138939, -0.2583987, 0.0627451, 0, 1, 1,
0.4855769, -0.6195954, 2.151997, 0.06666667, 0, 1, 1,
0.4859572, 0.9580641, 1.331257, 0.07450981, 0, 1, 1,
0.4868677, 2.025676, 0.991916, 0.07843138, 0, 1, 1,
0.4887678, -1.670505, 2.086334, 0.08627451, 0, 1, 1,
0.4934667, 1.528935, 0.9017228, 0.09019608, 0, 1, 1,
0.4947767, -1.857096, 1.667703, 0.09803922, 0, 1, 1,
0.5003501, -0.4070546, 2.821653, 0.1058824, 0, 1, 1,
0.5007586, -1.189018, 2.363037, 0.1098039, 0, 1, 1,
0.501055, 0.03817405, 1.026212, 0.1176471, 0, 1, 1,
0.5014092, 0.1213246, 0.6813702, 0.1215686, 0, 1, 1,
0.5028592, 0.006951831, 0.4152536, 0.1294118, 0, 1, 1,
0.5079676, -1.92132, 3.742572, 0.1333333, 0, 1, 1,
0.509875, -0.144855, 2.286095, 0.1411765, 0, 1, 1,
0.5100601, -1.908569, 3.191938, 0.145098, 0, 1, 1,
0.5102249, -0.8353484, 3.436501, 0.1529412, 0, 1, 1,
0.5172547, -0.1691141, 2.350974, 0.1568628, 0, 1, 1,
0.5198084, 0.2494821, -0.09037478, 0.1647059, 0, 1, 1,
0.5238734, -0.8112968, 0.8995852, 0.1686275, 0, 1, 1,
0.5242394, 1.56682, 0.11674, 0.1764706, 0, 1, 1,
0.5296427, 0.2632977, -0.022006, 0.1803922, 0, 1, 1,
0.5297111, 0.1325659, 1.383928, 0.1882353, 0, 1, 1,
0.5321296, 0.01923046, 1.45406, 0.1921569, 0, 1, 1,
0.5330839, 0.8177167, 0.8390846, 0.2, 0, 1, 1,
0.5360123, 1.2358, 0.8199259, 0.2078431, 0, 1, 1,
0.5363904, -0.5570824, 0.2479723, 0.2117647, 0, 1, 1,
0.5392957, -0.3307074, 3.795697, 0.2196078, 0, 1, 1,
0.5416406, -1.00964, 2.462617, 0.2235294, 0, 1, 1,
0.5507206, -0.5316306, 3.261883, 0.2313726, 0, 1, 1,
0.5535223, -0.4659229, 2.131419, 0.2352941, 0, 1, 1,
0.5540497, 0.06305092, 0.8448842, 0.2431373, 0, 1, 1,
0.5576115, 1.461926, 0.5373315, 0.2470588, 0, 1, 1,
0.5606273, 2.541478, -0.1964381, 0.254902, 0, 1, 1,
0.5626259, -0.604023, 2.745454, 0.2588235, 0, 1, 1,
0.5635574, -0.6170375, 2.310496, 0.2666667, 0, 1, 1,
0.5657565, -0.4119183, 3.59973, 0.2705882, 0, 1, 1,
0.570431, 1.136392, 2.993672, 0.2784314, 0, 1, 1,
0.5716887, 0.1479262, -0.290317, 0.282353, 0, 1, 1,
0.5741336, 1.176391, 0.3232534, 0.2901961, 0, 1, 1,
0.5860366, -0.517886, 2.546248, 0.2941177, 0, 1, 1,
0.5911496, 0.7054346, 1.12388, 0.3019608, 0, 1, 1,
0.594586, -0.6528202, 2.934574, 0.3098039, 0, 1, 1,
0.5952737, 0.7738402, 0.3813918, 0.3137255, 0, 1, 1,
0.598535, -0.2142539, 0.7619941, 0.3215686, 0, 1, 1,
0.5985738, -0.4678078, 4.569421, 0.3254902, 0, 1, 1,
0.6011116, 0.09153362, 0.1962448, 0.3333333, 0, 1, 1,
0.6083666, -0.2823981, 1.731471, 0.3372549, 0, 1, 1,
0.6094341, 0.4631575, -0.4891245, 0.345098, 0, 1, 1,
0.6097681, 0.3830151, 0.4721453, 0.3490196, 0, 1, 1,
0.6098307, 1.364749, -0.2980284, 0.3568628, 0, 1, 1,
0.6108007, 2.119334, 1.62177, 0.3607843, 0, 1, 1,
0.6178751, 0.8161066, 2.319891, 0.3686275, 0, 1, 1,
0.6181608, 0.1413153, 1.704695, 0.372549, 0, 1, 1,
0.6189231, -0.7776938, 2.601782, 0.3803922, 0, 1, 1,
0.6273255, 1.158773, -0.1646881, 0.3843137, 0, 1, 1,
0.6274328, -0.003726602, 1.66999, 0.3921569, 0, 1, 1,
0.6285432, 0.1369309, 1.920204, 0.3960784, 0, 1, 1,
0.6344591, -0.5913315, 2.172123, 0.4039216, 0, 1, 1,
0.6376033, -1.41905, 3.30847, 0.4117647, 0, 1, 1,
0.639052, 0.7749864, 1.713604, 0.4156863, 0, 1, 1,
0.6417834, 1.150013, 1.976859, 0.4235294, 0, 1, 1,
0.6464083, -2.10906, 2.606218, 0.427451, 0, 1, 1,
0.6473407, 0.1551783, 1.667951, 0.4352941, 0, 1, 1,
0.6475334, -0.6435739, 1.522762, 0.4392157, 0, 1, 1,
0.6481465, 0.7136575, 2.665075, 0.4470588, 0, 1, 1,
0.6521853, 0.1533424, 1.603434, 0.4509804, 0, 1, 1,
0.6553295, -0.4567152, 1.589845, 0.4588235, 0, 1, 1,
0.6572673, -0.4857085, 1.977044, 0.4627451, 0, 1, 1,
0.6618894, 0.1783692, 0.8004612, 0.4705882, 0, 1, 1,
0.6655839, -0.3766402, 2.217038, 0.4745098, 0, 1, 1,
0.6705416, 1.538857, -0.6881088, 0.4823529, 0, 1, 1,
0.6717097, -0.1216007, 1.722363, 0.4862745, 0, 1, 1,
0.6818339, 0.03911284, 1.910846, 0.4941176, 0, 1, 1,
0.6843332, -0.7050263, 1.541646, 0.5019608, 0, 1, 1,
0.6877618, -0.1874682, 1.450814, 0.5058824, 0, 1, 1,
0.6975252, 0.8146074, 2.862777, 0.5137255, 0, 1, 1,
0.6982459, -0.26213, 2.534718, 0.5176471, 0, 1, 1,
0.6987771, 0.1196124, 1.511477, 0.5254902, 0, 1, 1,
0.6992738, 0.006913688, 2.622898, 0.5294118, 0, 1, 1,
0.7018065, 1.078251, 0.4027377, 0.5372549, 0, 1, 1,
0.7028637, -0.8211499, 3.7758, 0.5411765, 0, 1, 1,
0.7055334, 0.9971533, 0.9190071, 0.5490196, 0, 1, 1,
0.7145553, -0.2133881, 1.634852, 0.5529412, 0, 1, 1,
0.714569, -0.2142485, 2.480562, 0.5607843, 0, 1, 1,
0.7201043, 1.142368, 1.280116, 0.5647059, 0, 1, 1,
0.721958, -0.9660757, 3.544824, 0.572549, 0, 1, 1,
0.723924, -1.12541, 4.406976, 0.5764706, 0, 1, 1,
0.7263819, 0.1375631, 1.196637, 0.5843138, 0, 1, 1,
0.7282315, -1.077809, 3.596506, 0.5882353, 0, 1, 1,
0.7492671, -0.8060051, 3.698593, 0.5960785, 0, 1, 1,
0.7530662, 0.5292158, 1.92712, 0.6039216, 0, 1, 1,
0.7531242, -0.5855215, 3.209994, 0.6078432, 0, 1, 1,
0.7555246, -2.407529, 3.24742, 0.6156863, 0, 1, 1,
0.7666258, -1.107517, 1.932227, 0.6196079, 0, 1, 1,
0.7691842, -0.2527204, 2.684363, 0.627451, 0, 1, 1,
0.7695574, 0.2302325, 0.6430974, 0.6313726, 0, 1, 1,
0.7842742, -0.7946129, 2.954528, 0.6392157, 0, 1, 1,
0.7954742, 1.401597, 1.417453, 0.6431373, 0, 1, 1,
0.7974542, 0.3754093, 2.177651, 0.6509804, 0, 1, 1,
0.799507, -0.7925088, 2.094145, 0.654902, 0, 1, 1,
0.8011667, -1.115025, 3.604854, 0.6627451, 0, 1, 1,
0.8075609, 0.9053142, 1.655694, 0.6666667, 0, 1, 1,
0.8094445, 0.1427729, 1.477545, 0.6745098, 0, 1, 1,
0.8105195, -0.2346175, 2.560082, 0.6784314, 0, 1, 1,
0.8114167, 1.346729, 1.613654, 0.6862745, 0, 1, 1,
0.8167637, 1.571906, 2.573651, 0.6901961, 0, 1, 1,
0.8203213, -0.1684728, 0.3585225, 0.6980392, 0, 1, 1,
0.8211452, -1.049352, 4.889849, 0.7058824, 0, 1, 1,
0.8267949, 1.619683, 0.8342807, 0.7098039, 0, 1, 1,
0.8303536, -0.9396806, 4.45418, 0.7176471, 0, 1, 1,
0.8307912, -0.1214798, 3.208956, 0.7215686, 0, 1, 1,
0.8325483, -3.626637, 3.728936, 0.7294118, 0, 1, 1,
0.8384481, -0.7266721, 3.610491, 0.7333333, 0, 1, 1,
0.8457099, 0.7414528, 1.488855, 0.7411765, 0, 1, 1,
0.8513011, -0.2485816, 1.597482, 0.7450981, 0, 1, 1,
0.8519678, 2.052177, 0.8971352, 0.7529412, 0, 1, 1,
0.8531456, -0.693651, 0.7390211, 0.7568628, 0, 1, 1,
0.8569335, -0.431466, 1.338425, 0.7647059, 0, 1, 1,
0.8586742, -0.1779823, 3.516039, 0.7686275, 0, 1, 1,
0.8599298, -0.2309224, 0.5457038, 0.7764706, 0, 1, 1,
0.8607367, -1.03328, 2.359961, 0.7803922, 0, 1, 1,
0.8679953, -0.7979486, 1.727945, 0.7882353, 0, 1, 1,
0.8808528, -1.199722, 3.64639, 0.7921569, 0, 1, 1,
0.887018, -0.3435953, 1.519821, 0.8, 0, 1, 1,
0.8876601, 0.2506284, 0.3207531, 0.8078431, 0, 1, 1,
0.8922105, 0.9554901, 1.275266, 0.8117647, 0, 1, 1,
0.8999225, 0.3653011, 0.3825692, 0.8196079, 0, 1, 1,
0.9055126, 0.01591504, 2.350055, 0.8235294, 0, 1, 1,
0.9152893, -0.2340547, 3.082657, 0.8313726, 0, 1, 1,
0.915876, -0.06598271, 0.118044, 0.8352941, 0, 1, 1,
0.9205968, 0.2561501, 1.807939, 0.8431373, 0, 1, 1,
0.9278157, -0.9719687, 1.775042, 0.8470588, 0, 1, 1,
0.929781, 0.46228, -0.2419265, 0.854902, 0, 1, 1,
0.9331726, -0.4096656, 0.3750951, 0.8588235, 0, 1, 1,
0.9420913, 0.3666342, 1.113665, 0.8666667, 0, 1, 1,
0.9423146, 0.7442706, 1.361729, 0.8705882, 0, 1, 1,
0.9591558, -1.190096, 2.682136, 0.8784314, 0, 1, 1,
0.9599844, -1.606623, 3.198688, 0.8823529, 0, 1, 1,
0.9617715, 0.90154, 0.6391715, 0.8901961, 0, 1, 1,
0.9662226, 0.9081523, 0.7717029, 0.8941177, 0, 1, 1,
0.968445, 0.2943275, 0.2607, 0.9019608, 0, 1, 1,
0.971709, 2.604529, -0.08409195, 0.9098039, 0, 1, 1,
0.9799351, 2.405699, 2.045091, 0.9137255, 0, 1, 1,
0.9832754, 0.18352, 1.884002, 0.9215686, 0, 1, 1,
0.9833063, -0.1893102, 1.759238, 0.9254902, 0, 1, 1,
0.9846517, 0.2673508, 1.774248, 0.9333333, 0, 1, 1,
0.9868335, 1.977322, 0.3610328, 0.9372549, 0, 1, 1,
0.9939578, -0.4808162, 3.361225, 0.945098, 0, 1, 1,
0.9983974, 0.8637103, 1.322223, 0.9490196, 0, 1, 1,
1.003665, -0.5677551, 2.779402, 0.9568627, 0, 1, 1,
1.005132, 1.304523, 1.528284, 0.9607843, 0, 1, 1,
1.007691, 0.5593839, 2.622588, 0.9686275, 0, 1, 1,
1.011923, -2.267494, 2.656684, 0.972549, 0, 1, 1,
1.012778, -1.480264, 2.427069, 0.9803922, 0, 1, 1,
1.017285, 0.2440001, 1.326205, 0.9843137, 0, 1, 1,
1.022364, -0.4187506, 2.240949, 0.9921569, 0, 1, 1,
1.030096, -0.1893514, 0.8813797, 0.9960784, 0, 1, 1,
1.031205, -2.119034, 3.23898, 1, 0, 0.9960784, 1,
1.033197, 1.785486, 1.319756, 1, 0, 0.9882353, 1,
1.036292, -0.4706005, 4.056623, 1, 0, 0.9843137, 1,
1.037712, 0.1117694, 1.00209, 1, 0, 0.9764706, 1,
1.039153, 0.5187867, 2.025728, 1, 0, 0.972549, 1,
1.041885, -0.9688696, 3.012737, 1, 0, 0.9647059, 1,
1.049458, 0.3653236, 0.3034391, 1, 0, 0.9607843, 1,
1.05, -0.9851106, 2.572098, 1, 0, 0.9529412, 1,
1.053503, -1.398063, 2.195446, 1, 0, 0.9490196, 1,
1.054154, 2.178262, -1.855766, 1, 0, 0.9411765, 1,
1.054897, 1.972229, 2.481488, 1, 0, 0.9372549, 1,
1.057143, -1.01729, 1.708961, 1, 0, 0.9294118, 1,
1.063362, 1.389758, -0.237961, 1, 0, 0.9254902, 1,
1.065448, -0.4807478, 1.703957, 1, 0, 0.9176471, 1,
1.066754, 0.2643567, 1.660319, 1, 0, 0.9137255, 1,
1.068432, 0.2426668, 0.6857522, 1, 0, 0.9058824, 1,
1.077681, -1.690336, 1.817348, 1, 0, 0.9019608, 1,
1.078398, -0.5234226, 1.124332, 1, 0, 0.8941177, 1,
1.081426, 1.266746, 1.365092, 1, 0, 0.8862745, 1,
1.082082, -0.9705752, 1.427197, 1, 0, 0.8823529, 1,
1.082118, 0.846029, -0.3551304, 1, 0, 0.8745098, 1,
1.084384, 0.6187873, 2.225223, 1, 0, 0.8705882, 1,
1.086595, 0.4225661, 0.7682686, 1, 0, 0.8627451, 1,
1.089904, 0.2645257, 2.233797, 1, 0, 0.8588235, 1,
1.095679, -0.1174753, 2.836586, 1, 0, 0.8509804, 1,
1.096501, -0.05698216, -0.3610338, 1, 0, 0.8470588, 1,
1.114739, -1.12884, 2.834675, 1, 0, 0.8392157, 1,
1.129096, -0.6752239, 1.468583, 1, 0, 0.8352941, 1,
1.137762, 1.056333, 1.054687, 1, 0, 0.827451, 1,
1.147058, 0.9145119, -0.009636225, 1, 0, 0.8235294, 1,
1.147932, -1.136746, 2.006684, 1, 0, 0.8156863, 1,
1.149601, 1.157471, 1.8094, 1, 0, 0.8117647, 1,
1.153119, -1.436377, 3.621449, 1, 0, 0.8039216, 1,
1.156607, -0.271376, 2.797768, 1, 0, 0.7960784, 1,
1.15751, 0.02418871, 1.076817, 1, 0, 0.7921569, 1,
1.15927, 0.1573397, 1.915399, 1, 0, 0.7843137, 1,
1.166261, 0.8658425, 1.458831, 1, 0, 0.7803922, 1,
1.166302, 0.8206713, 1.773809, 1, 0, 0.772549, 1,
1.169255, -0.8751679, 3.770653, 1, 0, 0.7686275, 1,
1.169314, -1.321841, 4.125232, 1, 0, 0.7607843, 1,
1.179051, 1.363749, 1.07814, 1, 0, 0.7568628, 1,
1.18016, -1.514881, 1.228465, 1, 0, 0.7490196, 1,
1.183337, 1.381019, 0.5627483, 1, 0, 0.7450981, 1,
1.189323, -0.1147249, 2.173317, 1, 0, 0.7372549, 1,
1.191099, -2.140148, 3.455562, 1, 0, 0.7333333, 1,
1.192253, 1.538054, 0.6068645, 1, 0, 0.7254902, 1,
1.193472, -0.5458533, 2.322718, 1, 0, 0.7215686, 1,
1.197309, 0.3879691, 0.9563212, 1, 0, 0.7137255, 1,
1.200258, -0.6703366, 2.434131, 1, 0, 0.7098039, 1,
1.205702, 1.736573, 0.05178445, 1, 0, 0.7019608, 1,
1.208049, 0.3844416, 1.332044, 1, 0, 0.6941177, 1,
1.214053, -0.7958738, 4.551717, 1, 0, 0.6901961, 1,
1.214439, 0.8202432, 0.126901, 1, 0, 0.682353, 1,
1.222314, -1.038142, 3.079364, 1, 0, 0.6784314, 1,
1.234535, 1.20884, 0.06931466, 1, 0, 0.6705883, 1,
1.237008, -0.4576185, 2.178131, 1, 0, 0.6666667, 1,
1.244163, 0.3434272, 1.0381, 1, 0, 0.6588235, 1,
1.245347, 0.1595087, 1.084814, 1, 0, 0.654902, 1,
1.247839, 0.4780718, 2.5615, 1, 0, 0.6470588, 1,
1.251111, 0.2274861, -0.280017, 1, 0, 0.6431373, 1,
1.252889, 1.292861, 0.6867753, 1, 0, 0.6352941, 1,
1.258606, -0.6615139, 4.785131, 1, 0, 0.6313726, 1,
1.258967, 0.2706535, 1.170572, 1, 0, 0.6235294, 1,
1.259346, -0.6146007, 2.155563, 1, 0, 0.6196079, 1,
1.267062, -1.434302, 1.357504, 1, 0, 0.6117647, 1,
1.288404, -0.2406187, 2.852068, 1, 0, 0.6078432, 1,
1.292725, 2.990105, -0.7760308, 1, 0, 0.6, 1,
1.296371, 0.6930531, 0.5449954, 1, 0, 0.5921569, 1,
1.298789, -0.807619, 2.825436, 1, 0, 0.5882353, 1,
1.309075, -0.4583942, 2.907987, 1, 0, 0.5803922, 1,
1.310063, 0.7915294, -0.3362322, 1, 0, 0.5764706, 1,
1.315047, 1.511338, 0.739607, 1, 0, 0.5686275, 1,
1.315362, 1.873512, 1.904699, 1, 0, 0.5647059, 1,
1.31873, 0.3757153, 2.01205, 1, 0, 0.5568628, 1,
1.33202, -0.3292631, -0.2951735, 1, 0, 0.5529412, 1,
1.336185, 0.07736476, 0.8516325, 1, 0, 0.5450981, 1,
1.35069, 0.2728824, 2.222658, 1, 0, 0.5411765, 1,
1.351906, 2.582394, -0.7353685, 1, 0, 0.5333334, 1,
1.358134, -1.304093, 3.33237, 1, 0, 0.5294118, 1,
1.359198, 0.405424, 2.235932, 1, 0, 0.5215687, 1,
1.367955, 0.5743461, 1.338442, 1, 0, 0.5176471, 1,
1.374277, 0.8963044, 2.725441, 1, 0, 0.509804, 1,
1.376414, -1.523853, 1.623332, 1, 0, 0.5058824, 1,
1.377324, -0.006184467, 2.391822, 1, 0, 0.4980392, 1,
1.392072, -1.424214, 1.90615, 1, 0, 0.4901961, 1,
1.397275, 0.2577758, -0.0866866, 1, 0, 0.4862745, 1,
1.40593, 0.95605, -0.4765532, 1, 0, 0.4784314, 1,
1.406816, -0.1112633, 1.380183, 1, 0, 0.4745098, 1,
1.40879, 0.5055658, 0.6462078, 1, 0, 0.4666667, 1,
1.414423, 0.7193601, 0.04653987, 1, 0, 0.4627451, 1,
1.415516, 0.4960149, 2.874204, 1, 0, 0.454902, 1,
1.419186, 0.2213447, 0.05261786, 1, 0, 0.4509804, 1,
1.431984, 0.6386861, 2.600999, 1, 0, 0.4431373, 1,
1.435084, 0.6675301, -0.02054475, 1, 0, 0.4392157, 1,
1.443956, 0.5101191, 0.6896726, 1, 0, 0.4313726, 1,
1.446954, -1.204768, 1.626092, 1, 0, 0.427451, 1,
1.448859, 1.044641, 1.280281, 1, 0, 0.4196078, 1,
1.452193, 0.6686895, 0.5419601, 1, 0, 0.4156863, 1,
1.456813, -0.8381566, 2.523712, 1, 0, 0.4078431, 1,
1.464395, 2.171856, -1.094071, 1, 0, 0.4039216, 1,
1.472868, 0.4566592, 1.157692, 1, 0, 0.3960784, 1,
1.473665, 0.5931329, 2.428536, 1, 0, 0.3882353, 1,
1.497009, -0.4684669, 0.759243, 1, 0, 0.3843137, 1,
1.513043, 0.7103928, 0.9597267, 1, 0, 0.3764706, 1,
1.517952, -0.6016783, 1.289467, 1, 0, 0.372549, 1,
1.52028, 0.1929759, 0.972567, 1, 0, 0.3647059, 1,
1.529609, 0.1078671, -0.4019195, 1, 0, 0.3607843, 1,
1.533393, 0.2164885, 2.191417, 1, 0, 0.3529412, 1,
1.536626, 1.233316, 0.04263119, 1, 0, 0.3490196, 1,
1.541921, 0.9839019, 0.8254088, 1, 0, 0.3411765, 1,
1.555037, 1.118688, 1.393064, 1, 0, 0.3372549, 1,
1.555537, 0.7103961, -0.472391, 1, 0, 0.3294118, 1,
1.556592, -0.7808632, 2.641835, 1, 0, 0.3254902, 1,
1.571263, 0.1952191, 2.569638, 1, 0, 0.3176471, 1,
1.58617, -0.2728451, -0.04618065, 1, 0, 0.3137255, 1,
1.600017, 0.4782136, 1.037434, 1, 0, 0.3058824, 1,
1.603172, 1.713908, 0.9714564, 1, 0, 0.2980392, 1,
1.603578, -1.943435, 2.719266, 1, 0, 0.2941177, 1,
1.620294, -1.394147, 2.829481, 1, 0, 0.2862745, 1,
1.65072, -1.207363, 1.921192, 1, 0, 0.282353, 1,
1.671201, -0.01311209, 0.02912207, 1, 0, 0.2745098, 1,
1.676456, 1.761624, -0.9438731, 1, 0, 0.2705882, 1,
1.698909, 0.2925678, 1.87806, 1, 0, 0.2627451, 1,
1.701983, 1.861289, 1.174491, 1, 0, 0.2588235, 1,
1.704296, -1.101084, 0.8891435, 1, 0, 0.2509804, 1,
1.705669, -0.02677425, 1.299793, 1, 0, 0.2470588, 1,
1.721026, -1.83129, 0.9311568, 1, 0, 0.2392157, 1,
1.724841, 0.2261005, 1.188576, 1, 0, 0.2352941, 1,
1.742561, 1.391945, 0.5620788, 1, 0, 0.227451, 1,
1.761445, -1.262276, 2.383291, 1, 0, 0.2235294, 1,
1.771877, 0.8039103, 1.716217, 1, 0, 0.2156863, 1,
1.804597, 0.1385873, 2.715469, 1, 0, 0.2117647, 1,
1.805236, -0.6001785, 1.21613, 1, 0, 0.2039216, 1,
1.806655, 1.38782, -1.351699, 1, 0, 0.1960784, 1,
1.83579, -0.6680237, 0.8326985, 1, 0, 0.1921569, 1,
1.839668, -0.6175344, 2.39716, 1, 0, 0.1843137, 1,
1.85955, 0.009860463, 1.652363, 1, 0, 0.1803922, 1,
1.891419, 1.295989, 1.443808, 1, 0, 0.172549, 1,
1.901533, 1.582755, -0.1084476, 1, 0, 0.1686275, 1,
1.955781, 0.6436279, 4.012246, 1, 0, 0.1607843, 1,
1.957397, -0.7229975, 2.342944, 1, 0, 0.1568628, 1,
1.964336, -0.08146863, 1.274955, 1, 0, 0.1490196, 1,
1.964552, 0.3407079, 1.162434, 1, 0, 0.145098, 1,
2.00258, 0.7360147, -0.07722167, 1, 0, 0.1372549, 1,
2.039152, -0.8506019, 1.630954, 1, 0, 0.1333333, 1,
2.060632, -0.03136837, 2.45024, 1, 0, 0.1254902, 1,
2.066963, 1.796232, 0.7082691, 1, 0, 0.1215686, 1,
2.079489, 0.227854, 0.9872755, 1, 0, 0.1137255, 1,
2.095831, -0.0322649, 0.4958608, 1, 0, 0.1098039, 1,
2.153534, -0.04261014, 2.620468, 1, 0, 0.1019608, 1,
2.168916, 0.5567257, -0.2281085, 1, 0, 0.09411765, 1,
2.171251, -0.3151746, 1.421301, 1, 0, 0.09019608, 1,
2.196314, 1.172673, 0.8539832, 1, 0, 0.08235294, 1,
2.199741, -0.6219584, 2.074063, 1, 0, 0.07843138, 1,
2.201164, 0.1294792, 1.390611, 1, 0, 0.07058824, 1,
2.226498, -0.6284705, 1.286113, 1, 0, 0.06666667, 1,
2.259682, 1.957093, 2.175569, 1, 0, 0.05882353, 1,
2.26365, -0.09815741, 2.21769, 1, 0, 0.05490196, 1,
2.282746, -0.2083725, -0.08312184, 1, 0, 0.04705882, 1,
2.350589, 1.119056, -0.3686829, 1, 0, 0.04313726, 1,
2.387736, -0.1325818, 1.03854, 1, 0, 0.03529412, 1,
2.425288, 1.137696, 0.6213163, 1, 0, 0.03137255, 1,
2.69012, 0.1417385, 1.17212, 1, 0, 0.02352941, 1,
2.727858, 1.856372, 2.235671, 1, 0, 0.01960784, 1,
2.756176, -0.2257579, 2.313959, 1, 0, 0.01176471, 1,
3.357807, 2.04452, 1.850103, 1, 0, 0.007843138, 1
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
-0.06721103, -5.228798, -7.836794, 0, -0.5, 0.5, 0.5,
-0.06721103, -5.228798, -7.836794, 1, -0.5, 0.5, 0.5,
-0.06721103, -5.228798, -7.836794, 1, 1.5, 0.5, 0.5,
-0.06721103, -5.228798, -7.836794, 0, 1.5, 0.5, 0.5
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
-4.65331, -0.5237482, -7.836794, 0, -0.5, 0.5, 0.5,
-4.65331, -0.5237482, -7.836794, 1, -0.5, 0.5, 0.5,
-4.65331, -0.5237482, -7.836794, 1, 1.5, 0.5, 0.5,
-4.65331, -0.5237482, -7.836794, 0, 1.5, 0.5, 0.5
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
-4.65331, -5.228798, -0.3498278, 0, -0.5, 0.5, 0.5,
-4.65331, -5.228798, -0.3498278, 1, -0.5, 0.5, 0.5,
-4.65331, -5.228798, -0.3498278, 1, 1.5, 0.5, 0.5,
-4.65331, -5.228798, -0.3498278, 0, 1.5, 0.5, 0.5
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
-3, -4.143017, -6.109033,
3, -4.143017, -6.109033,
-3, -4.143017, -6.109033,
-3, -4.32398, -6.396993,
-2, -4.143017, -6.109033,
-2, -4.32398, -6.396993,
-1, -4.143017, -6.109033,
-1, -4.32398, -6.396993,
0, -4.143017, -6.109033,
0, -4.32398, -6.396993,
1, -4.143017, -6.109033,
1, -4.32398, -6.396993,
2, -4.143017, -6.109033,
2, -4.32398, -6.396993,
3, -4.143017, -6.109033,
3, -4.32398, -6.396993
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
-3, -4.685907, -6.972914, 0, -0.5, 0.5, 0.5,
-3, -4.685907, -6.972914, 1, -0.5, 0.5, 0.5,
-3, -4.685907, -6.972914, 1, 1.5, 0.5, 0.5,
-3, -4.685907, -6.972914, 0, 1.5, 0.5, 0.5,
-2, -4.685907, -6.972914, 0, -0.5, 0.5, 0.5,
-2, -4.685907, -6.972914, 1, -0.5, 0.5, 0.5,
-2, -4.685907, -6.972914, 1, 1.5, 0.5, 0.5,
-2, -4.685907, -6.972914, 0, 1.5, 0.5, 0.5,
-1, -4.685907, -6.972914, 0, -0.5, 0.5, 0.5,
-1, -4.685907, -6.972914, 1, -0.5, 0.5, 0.5,
-1, -4.685907, -6.972914, 1, 1.5, 0.5, 0.5,
-1, -4.685907, -6.972914, 0, 1.5, 0.5, 0.5,
0, -4.685907, -6.972914, 0, -0.5, 0.5, 0.5,
0, -4.685907, -6.972914, 1, -0.5, 0.5, 0.5,
0, -4.685907, -6.972914, 1, 1.5, 0.5, 0.5,
0, -4.685907, -6.972914, 0, 1.5, 0.5, 0.5,
1, -4.685907, -6.972914, 0, -0.5, 0.5, 0.5,
1, -4.685907, -6.972914, 1, -0.5, 0.5, 0.5,
1, -4.685907, -6.972914, 1, 1.5, 0.5, 0.5,
1, -4.685907, -6.972914, 0, 1.5, 0.5, 0.5,
2, -4.685907, -6.972914, 0, -0.5, 0.5, 0.5,
2, -4.685907, -6.972914, 1, -0.5, 0.5, 0.5,
2, -4.685907, -6.972914, 1, 1.5, 0.5, 0.5,
2, -4.685907, -6.972914, 0, 1.5, 0.5, 0.5,
3, -4.685907, -6.972914, 0, -0.5, 0.5, 0.5,
3, -4.685907, -6.972914, 1, -0.5, 0.5, 0.5,
3, -4.685907, -6.972914, 1, 1.5, 0.5, 0.5,
3, -4.685907, -6.972914, 0, 1.5, 0.5, 0.5
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
-3.59498, -4, -6.109033,
-3.59498, 2, -6.109033,
-3.59498, -4, -6.109033,
-3.771368, -4, -6.396993,
-3.59498, -2, -6.109033,
-3.771368, -2, -6.396993,
-3.59498, 0, -6.109033,
-3.771368, 0, -6.396993,
-3.59498, 2, -6.109033,
-3.771368, 2, -6.396993
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
"-4",
"-2",
"0",
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
-4.124145, -4, -6.972914, 0, -0.5, 0.5, 0.5,
-4.124145, -4, -6.972914, 1, -0.5, 0.5, 0.5,
-4.124145, -4, -6.972914, 1, 1.5, 0.5, 0.5,
-4.124145, -4, -6.972914, 0, 1.5, 0.5, 0.5,
-4.124145, -2, -6.972914, 0, -0.5, 0.5, 0.5,
-4.124145, -2, -6.972914, 1, -0.5, 0.5, 0.5,
-4.124145, -2, -6.972914, 1, 1.5, 0.5, 0.5,
-4.124145, -2, -6.972914, 0, 1.5, 0.5, 0.5,
-4.124145, 0, -6.972914, 0, -0.5, 0.5, 0.5,
-4.124145, 0, -6.972914, 1, -0.5, 0.5, 0.5,
-4.124145, 0, -6.972914, 1, 1.5, 0.5, 0.5,
-4.124145, 0, -6.972914, 0, 1.5, 0.5, 0.5,
-4.124145, 2, -6.972914, 0, -0.5, 0.5, 0.5,
-4.124145, 2, -6.972914, 1, -0.5, 0.5, 0.5,
-4.124145, 2, -6.972914, 1, 1.5, 0.5, 0.5,
-4.124145, 2, -6.972914, 0, 1.5, 0.5, 0.5
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
-3.59498, -4.143017, -4,
-3.59498, -4.143017, 4,
-3.59498, -4.143017, -4,
-3.771368, -4.32398, -4,
-3.59498, -4.143017, -2,
-3.771368, -4.32398, -2,
-3.59498, -4.143017, 0,
-3.771368, -4.32398, 0,
-3.59498, -4.143017, 2,
-3.771368, -4.32398, 2,
-3.59498, -4.143017, 4,
-3.771368, -4.32398, 4
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
-4.124145, -4.685907, -4, 0, -0.5, 0.5, 0.5,
-4.124145, -4.685907, -4, 1, -0.5, 0.5, 0.5,
-4.124145, -4.685907, -4, 1, 1.5, 0.5, 0.5,
-4.124145, -4.685907, -4, 0, 1.5, 0.5, 0.5,
-4.124145, -4.685907, -2, 0, -0.5, 0.5, 0.5,
-4.124145, -4.685907, -2, 1, -0.5, 0.5, 0.5,
-4.124145, -4.685907, -2, 1, 1.5, 0.5, 0.5,
-4.124145, -4.685907, -2, 0, 1.5, 0.5, 0.5,
-4.124145, -4.685907, 0, 0, -0.5, 0.5, 0.5,
-4.124145, -4.685907, 0, 1, -0.5, 0.5, 0.5,
-4.124145, -4.685907, 0, 1, 1.5, 0.5, 0.5,
-4.124145, -4.685907, 0, 0, 1.5, 0.5, 0.5,
-4.124145, -4.685907, 2, 0, -0.5, 0.5, 0.5,
-4.124145, -4.685907, 2, 1, -0.5, 0.5, 0.5,
-4.124145, -4.685907, 2, 1, 1.5, 0.5, 0.5,
-4.124145, -4.685907, 2, 0, 1.5, 0.5, 0.5,
-4.124145, -4.685907, 4, 0, -0.5, 0.5, 0.5,
-4.124145, -4.685907, 4, 1, -0.5, 0.5, 0.5,
-4.124145, -4.685907, 4, 1, 1.5, 0.5, 0.5,
-4.124145, -4.685907, 4, 0, 1.5, 0.5, 0.5
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
-3.59498, -4.143017, -6.109033,
-3.59498, 3.095521, -6.109033,
-3.59498, -4.143017, 5.409377,
-3.59498, 3.095521, 5.409377,
-3.59498, -4.143017, -6.109033,
-3.59498, -4.143017, 5.409377,
-3.59498, 3.095521, -6.109033,
-3.59498, 3.095521, 5.409377,
-3.59498, -4.143017, -6.109033,
3.460558, -4.143017, -6.109033,
-3.59498, -4.143017, 5.409377,
3.460558, -4.143017, 5.409377,
-3.59498, 3.095521, -6.109033,
3.460558, 3.095521, -6.109033,
-3.59498, 3.095521, 5.409377,
3.460558, 3.095521, 5.409377,
3.460558, -4.143017, -6.109033,
3.460558, 3.095521, -6.109033,
3.460558, -4.143017, 5.409377,
3.460558, 3.095521, 5.409377,
3.460558, -4.143017, -6.109033,
3.460558, -4.143017, 5.409377,
3.460558, 3.095521, -6.109033,
3.460558, 3.095521, 5.409377
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
var radius = 8.183168;
var distance = 36.40784;
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
mvMatrix.translate( 0.06721103, 0.5237482, 0.3498278 );
mvMatrix.scale( 1.254022, 1.222319, 0.7681444 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.40784);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
methoprene<-read.table("methoprene.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-methoprene$V2
```

```
## Error in eval(expr, envir, enclos): object 'methoprene' not found
```

```r
y<-methoprene$V3
```

```
## Error in eval(expr, envir, enclos): object 'methoprene' not found
```

```r
z<-methoprene$V4
```

```
## Error in eval(expr, envir, enclos): object 'methoprene' not found
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
-3.492229, 0.3798541, -1.333932, 0, 0, 1, 1, 1,
-3.477556, -1.924468, -3.537549, 1, 0, 0, 1, 1,
-3.073425, -0.1212377, -3.352878, 1, 0, 0, 1, 1,
-2.927187, 0.556536, -2.108276, 1, 0, 0, 1, 1,
-2.792312, 0.7617069, -0.1895731, 1, 0, 0, 1, 1,
-2.638421, 1.471025, -2.095942, 1, 0, 0, 1, 1,
-2.56977, -1.041888, -2.588559, 0, 0, 0, 1, 1,
-2.569568, -2.124382, -2.787797, 0, 0, 0, 1, 1,
-2.500296, 1.216769, -1.857184, 0, 0, 0, 1, 1,
-2.476459, -1.344813, -1.277547, 0, 0, 0, 1, 1,
-2.462839, 0.5948293, -1.154719, 0, 0, 0, 1, 1,
-2.391622, -1.421633, -2.188835, 0, 0, 0, 1, 1,
-2.181595, -1.436105, -0.1884288, 0, 0, 0, 1, 1,
-2.169809, 1.857465, -2.202633, 1, 1, 1, 1, 1,
-2.15885, 0.8109267, 0.1108155, 1, 1, 1, 1, 1,
-2.127497, 0.0158471, -1.589864, 1, 1, 1, 1, 1,
-2.087902, -0.390836, -2.125362, 1, 1, 1, 1, 1,
-2.057471, -1.562077, -3.668845, 1, 1, 1, 1, 1,
-2.022457, -0.7082503, -1.618612, 1, 1, 1, 1, 1,
-1.932939, 0.4018558, -2.453944, 1, 1, 1, 1, 1,
-1.916523, 0.03449934, -0.8239655, 1, 1, 1, 1, 1,
-1.893066, 1.352632, -0.6351315, 1, 1, 1, 1, 1,
-1.880585, -0.2134655, -0.9542937, 1, 1, 1, 1, 1,
-1.869514, -0.9379941, -1.417368, 1, 1, 1, 1, 1,
-1.859079, 0.04051879, -2.51403, 1, 1, 1, 1, 1,
-1.848301, 0.5150845, 0.6042425, 1, 1, 1, 1, 1,
-1.848263, 0.3929334, -0.5345053, 1, 1, 1, 1, 1,
-1.841893, -0.1549516, -0.6349145, 1, 1, 1, 1, 1,
-1.838251, -0.5154085, -2.921789, 0, 0, 1, 1, 1,
-1.807624, 0.2368491, -0.9943461, 1, 0, 0, 1, 1,
-1.788203, -0.8956496, -1.396595, 1, 0, 0, 1, 1,
-1.732498, 0.05939586, -0.684719, 1, 0, 0, 1, 1,
-1.70853, -0.07370427, -1.951886, 1, 0, 0, 1, 1,
-1.696649, 0.8938555, -1.653395, 1, 0, 0, 1, 1,
-1.695854, 0.6429503, -1.356422, 0, 0, 0, 1, 1,
-1.680719, 0.4690542, -0.4684606, 0, 0, 0, 1, 1,
-1.668857, 0.5360484, -1.886081, 0, 0, 0, 1, 1,
-1.664127, -2.255522, -2.233691, 0, 0, 0, 1, 1,
-1.651603, 0.598823, -2.296252, 0, 0, 0, 1, 1,
-1.637913, 0.1796102, -0.7459021, 0, 0, 0, 1, 1,
-1.610496, -0.009642983, -2.698385, 0, 0, 0, 1, 1,
-1.600948, -0.7522579, -0.1909776, 1, 1, 1, 1, 1,
-1.600342, -0.3303288, -1.253491, 1, 1, 1, 1, 1,
-1.587754, 1.672167, -1.261583, 1, 1, 1, 1, 1,
-1.58387, 1.305, -0.9484419, 1, 1, 1, 1, 1,
-1.58005, -0.5309523, -0.0007636168, 1, 1, 1, 1, 1,
-1.561856, 1.000787, -0.8455751, 1, 1, 1, 1, 1,
-1.560351, 2.204126, -1.578421, 1, 1, 1, 1, 1,
-1.547904, 0.8948519, -1.022041, 1, 1, 1, 1, 1,
-1.545946, 0.3529939, -1.288916, 1, 1, 1, 1, 1,
-1.544177, 0.01738142, -3.388887, 1, 1, 1, 1, 1,
-1.517975, 0.9426079, -2.024732, 1, 1, 1, 1, 1,
-1.511645, -1.083095, -2.429152, 1, 1, 1, 1, 1,
-1.511431, -0.7017868, -1.042192, 1, 1, 1, 1, 1,
-1.509546, -0.1046392, 0.4838975, 1, 1, 1, 1, 1,
-1.488983, -0.7829515, -2.58835, 1, 1, 1, 1, 1,
-1.486314, -0.08075124, -0.9071856, 0, 0, 1, 1, 1,
-1.484994, -0.5035728, -2.965709, 1, 0, 0, 1, 1,
-1.484496, -1.0346, -3.364992, 1, 0, 0, 1, 1,
-1.471115, -0.1489997, -3.016373, 1, 0, 0, 1, 1,
-1.470281, -0.06035291, -1.292043, 1, 0, 0, 1, 1,
-1.454735, 1.289338, 0.8659202, 1, 0, 0, 1, 1,
-1.452855, -1.470429, -3.852961, 0, 0, 0, 1, 1,
-1.450635, 0.5554282, -3.972859, 0, 0, 0, 1, 1,
-1.44859, 0.4767425, -2.566908, 0, 0, 0, 1, 1,
-1.44661, -1.58128, -1.087531, 0, 0, 0, 1, 1,
-1.441262, -2.21599, -2.933921, 0, 0, 0, 1, 1,
-1.437887, 0.6457871, 0.5827239, 0, 0, 0, 1, 1,
-1.409123, -2.182217, -2.337997, 0, 0, 0, 1, 1,
-1.407854, -0.6113189, -1.175693, 1, 1, 1, 1, 1,
-1.40461, 1.040695, -0.6881741, 1, 1, 1, 1, 1,
-1.395537, 0.3929529, -1.133834, 1, 1, 1, 1, 1,
-1.394208, -0.2871665, -1.635999, 1, 1, 1, 1, 1,
-1.393431, 0.8414406, -1.11891, 1, 1, 1, 1, 1,
-1.377395, -0.5962413, -3.727646, 1, 1, 1, 1, 1,
-1.374658, -1.442699, -2.45683, 1, 1, 1, 1, 1,
-1.365913, 0.03211189, -1.431973, 1, 1, 1, 1, 1,
-1.354568, 1.158778, 1.042524, 1, 1, 1, 1, 1,
-1.348815, 0.7598209, 0.02103275, 1, 1, 1, 1, 1,
-1.347457, 1.692473, -0.08511424, 1, 1, 1, 1, 1,
-1.342376, -0.7476972, 0.4342954, 1, 1, 1, 1, 1,
-1.338913, -1.008961, -0.9408532, 1, 1, 1, 1, 1,
-1.335753, 0.5913318, -0.848149, 1, 1, 1, 1, 1,
-1.332024, -1.772663, 0.8899053, 1, 1, 1, 1, 1,
-1.33063, -0.4735847, -0.6063839, 0, 0, 1, 1, 1,
-1.328675, 0.5624759, -1.136125, 1, 0, 0, 1, 1,
-1.328321, 0.1701295, -0.9426607, 1, 0, 0, 1, 1,
-1.319059, -1.468238, -0.8011312, 1, 0, 0, 1, 1,
-1.290582, -2.162798, -2.330318, 1, 0, 0, 1, 1,
-1.287068, -0.420734, -3.393063, 1, 0, 0, 1, 1,
-1.266551, 0.8039697, -0.6818429, 0, 0, 0, 1, 1,
-1.261441, -2.204635, -1.698712, 0, 0, 0, 1, 1,
-1.259425, -0.8480736, -2.968746, 0, 0, 0, 1, 1,
-1.25489, 0.278073, -1.745358, 0, 0, 0, 1, 1,
-1.252468, -0.1752673, -3.05109, 0, 0, 0, 1, 1,
-1.24971, -3.079064, -1.888867, 0, 0, 0, 1, 1,
-1.248234, -0.7217369, -4.176036, 0, 0, 0, 1, 1,
-1.247598, 0.4906782, -0.4562477, 1, 1, 1, 1, 1,
-1.234523, 1.858222, -1.234832, 1, 1, 1, 1, 1,
-1.233133, 0.9650506, -0.6769503, 1, 1, 1, 1, 1,
-1.227992, -0.4069331, -0.399678, 1, 1, 1, 1, 1,
-1.222991, 1.064682, -0.4377324, 1, 1, 1, 1, 1,
-1.219286, -1.026634, -1.671964, 1, 1, 1, 1, 1,
-1.219209, -0.5955146, -3.177151, 1, 1, 1, 1, 1,
-1.218362, -2.4422, -3.064661, 1, 1, 1, 1, 1,
-1.213935, -0.4864427, -1.886651, 1, 1, 1, 1, 1,
-1.202742, 0.512073, -1.879139, 1, 1, 1, 1, 1,
-1.196404, 0.2713094, -0.3619878, 1, 1, 1, 1, 1,
-1.189323, -1.513761, -1.596803, 1, 1, 1, 1, 1,
-1.185871, 0.08335682, -2.139041, 1, 1, 1, 1, 1,
-1.182934, -0.4901795, -2.613775, 1, 1, 1, 1, 1,
-1.182081, 0.8499984, -0.6601654, 1, 1, 1, 1, 1,
-1.180911, 1.425779, -1.896929, 0, 0, 1, 1, 1,
-1.177972, 0.1892728, -1.306866, 1, 0, 0, 1, 1,
-1.175897, 0.2701379, 0.3237073, 1, 0, 0, 1, 1,
-1.167519, -0.528278, -4.197294, 1, 0, 0, 1, 1,
-1.163229, 0.3313389, -0.4500068, 1, 0, 0, 1, 1,
-1.163096, 0.1978749, -2.176313, 1, 0, 0, 1, 1,
-1.161509, -0.761175, -3.206422, 0, 0, 0, 1, 1,
-1.157579, 0.6548347, -1.113044, 0, 0, 0, 1, 1,
-1.152469, -0.06244433, -1.078692, 0, 0, 0, 1, 1,
-1.149892, 0.2276876, -1.124841, 0, 0, 0, 1, 1,
-1.145779, 1.191811, -2.199856, 0, 0, 0, 1, 1,
-1.144938, -0.5970399, -2.624658, 0, 0, 0, 1, 1,
-1.143098, -1.452895, -2.23802, 0, 0, 0, 1, 1,
-1.125585, -0.5685676, -2.94246, 1, 1, 1, 1, 1,
-1.124988, 0.5335559, -2.279774, 1, 1, 1, 1, 1,
-1.120888, 1.902992, -0.363108, 1, 1, 1, 1, 1,
-1.114899, 1.225689, -0.6455188, 1, 1, 1, 1, 1,
-1.113509, -0.6959227, -1.121761, 1, 1, 1, 1, 1,
-1.111199, -1.994063, -3.700682, 1, 1, 1, 1, 1,
-1.108789, 0.3822978, -1.656568, 1, 1, 1, 1, 1,
-1.105887, 0.0062154, -1.49953, 1, 1, 1, 1, 1,
-1.105368, -0.5779426, -1.063159, 1, 1, 1, 1, 1,
-1.096613, 2.950348, -2.703479, 1, 1, 1, 1, 1,
-1.095474, 1.01275, -0.956573, 1, 1, 1, 1, 1,
-1.089502, 1.069886, 1.221668, 1, 1, 1, 1, 1,
-1.088184, -1.134381, -2.137854, 1, 1, 1, 1, 1,
-1.08665, -0.02368025, -2.892184, 1, 1, 1, 1, 1,
-1.086423, -1.526181, -1.700057, 1, 1, 1, 1, 1,
-1.085263, 0.8626522, -0.7067302, 0, 0, 1, 1, 1,
-1.085156, 1.196588, -0.3420252, 1, 0, 0, 1, 1,
-1.08142, 0.2180346, 0.4524153, 1, 0, 0, 1, 1,
-1.072507, 0.01439597, -0.7987248, 1, 0, 0, 1, 1,
-1.070441, 0.3374002, -2.352732, 1, 0, 0, 1, 1,
-1.063586, 0.4760117, -2.086324, 1, 0, 0, 1, 1,
-1.061061, -1.141568, -3.206524, 0, 0, 0, 1, 1,
-1.060694, 1.116066, 0.4690911, 0, 0, 0, 1, 1,
-1.060026, 2.175069, -0.1415438, 0, 0, 0, 1, 1,
-1.059188, 0.8048236, -0.09720019, 0, 0, 0, 1, 1,
-1.054863, -0.1804148, -3.993568, 0, 0, 0, 1, 1,
-1.049624, 0.4119906, -1.309306, 0, 0, 0, 1, 1,
-1.048645, 0.1896068, -1.977653, 0, 0, 0, 1, 1,
-1.0458, 0.4848032, -0.9701611, 1, 1, 1, 1, 1,
-1.045786, 0.4809131, -2.358267, 1, 1, 1, 1, 1,
-1.040753, 1.271577, -1.223555, 1, 1, 1, 1, 1,
-1.040439, 1.730496, -1.5744, 1, 1, 1, 1, 1,
-1.034276, -1.637201, -4.209321, 1, 1, 1, 1, 1,
-1.033619, -0.6331517, -2.971173, 1, 1, 1, 1, 1,
-1.016205, 0.9033558, -0.467936, 1, 1, 1, 1, 1,
-1.005654, -0.6302189, -3.248614, 1, 1, 1, 1, 1,
-1.005596, 0.03980434, -0.395269, 1, 1, 1, 1, 1,
-1.002757, -0.4668951, -3.56225, 1, 1, 1, 1, 1,
-0.9983023, -0.591133, -1.252414, 1, 1, 1, 1, 1,
-0.9980844, 0.03797509, -0.2535756, 1, 1, 1, 1, 1,
-0.9881454, -1.040565, -3.435181, 1, 1, 1, 1, 1,
-0.9843466, -0.8906184, -3.340964, 1, 1, 1, 1, 1,
-0.9803951, -0.4697966, -1.660289, 1, 1, 1, 1, 1,
-0.9795206, -0.05507644, -3.100629, 0, 0, 1, 1, 1,
-0.9783534, -1.55728, -2.918916, 1, 0, 0, 1, 1,
-0.9781666, -0.1485316, -2.271071, 1, 0, 0, 1, 1,
-0.9775173, -0.7221503, -2.63567, 1, 0, 0, 1, 1,
-0.9658277, -0.3854733, -2.835333, 1, 0, 0, 1, 1,
-0.9638703, 1.40861, -0.7186372, 1, 0, 0, 1, 1,
-0.9635578, -0.0727375, 0.1814125, 0, 0, 0, 1, 1,
-0.9549659, 0.1283394, -0.6526627, 0, 0, 0, 1, 1,
-0.9470677, 0.2912794, -2.091843, 0, 0, 0, 1, 1,
-0.940613, 0.03066407, -0.9717481, 0, 0, 0, 1, 1,
-0.9305308, -2.104759, -2.742475, 0, 0, 0, 1, 1,
-0.9302565, 0.3011183, -2.040419, 0, 0, 0, 1, 1,
-0.9301599, 0.9933613, -1.428907, 0, 0, 0, 1, 1,
-0.9258298, -0.7965477, -1.158887, 1, 1, 1, 1, 1,
-0.9245467, -1.460336, -2.635981, 1, 1, 1, 1, 1,
-0.9230108, -1.762101, -3.149209, 1, 1, 1, 1, 1,
-0.9221961, 0.3893504, -0.8512172, 1, 1, 1, 1, 1,
-0.9182838, -0.4754941, -1.801628, 1, 1, 1, 1, 1,
-0.915024, -0.06028559, -1.215264, 1, 1, 1, 1, 1,
-0.9134512, -0.3694869, -2.42056, 1, 1, 1, 1, 1,
-0.911382, -0.8235909, -4.49473, 1, 1, 1, 1, 1,
-0.910306, -0.4957852, -1.682034, 1, 1, 1, 1, 1,
-0.9088309, -0.7144889, -2.935522, 1, 1, 1, 1, 1,
-0.9021932, 1.617594, -1.058364, 1, 1, 1, 1, 1,
-0.8987018, -0.0815575, -1.63728, 1, 1, 1, 1, 1,
-0.8953943, -0.7561663, -1.240732, 1, 1, 1, 1, 1,
-0.8938445, 0.5735096, -1.227053, 1, 1, 1, 1, 1,
-0.8896649, -0.8709419, -3.245264, 1, 1, 1, 1, 1,
-0.8876883, 1.023222, -0.1785716, 0, 0, 1, 1, 1,
-0.8868926, -1.490159, -2.484349, 1, 0, 0, 1, 1,
-0.8849327, 0.8315662, -1.591006, 1, 0, 0, 1, 1,
-0.8772765, 0.5893627, -0.9132579, 1, 0, 0, 1, 1,
-0.8765426, -2.56452, -1.909066, 1, 0, 0, 1, 1,
-0.8699346, 1.247324, 0.8017107, 1, 0, 0, 1, 1,
-0.8665966, 0.6124067, -1.461401, 0, 0, 0, 1, 1,
-0.8642009, -2.382224, -2.061582, 0, 0, 0, 1, 1,
-0.8638571, -1.3147, -3.483316, 0, 0, 0, 1, 1,
-0.8580033, -0.2092872, -2.796748, 0, 0, 0, 1, 1,
-0.8528358, 0.2693946, -0.01680769, 0, 0, 0, 1, 1,
-0.8525726, 0.5054799, -2.727554, 0, 0, 0, 1, 1,
-0.8389624, -1.00247, -2.928984, 0, 0, 0, 1, 1,
-0.8365737, -0.1684404, -1.776911, 1, 1, 1, 1, 1,
-0.8335856, 1.21219, -0.5965841, 1, 1, 1, 1, 1,
-0.82692, -0.003525742, -0.3311877, 1, 1, 1, 1, 1,
-0.8250886, 0.2470298, 0.2241607, 1, 1, 1, 1, 1,
-0.8221779, -0.5642239, -2.75304, 1, 1, 1, 1, 1,
-0.8167876, -1.696712, -3.481183, 1, 1, 1, 1, 1,
-0.8167228, 1.23943, -0.4250538, 1, 1, 1, 1, 1,
-0.8123761, 2.018787, -0.2430207, 1, 1, 1, 1, 1,
-0.8102375, -0.4389724, -3.654319, 1, 1, 1, 1, 1,
-0.8095207, -0.03334389, -1.175056, 1, 1, 1, 1, 1,
-0.8077778, -0.6098074, -4.16682, 1, 1, 1, 1, 1,
-0.8071879, -1.554462, -1.841838, 1, 1, 1, 1, 1,
-0.802157, 0.2551116, -1.539676, 1, 1, 1, 1, 1,
-0.7868596, 2.08093, 1.869562, 1, 1, 1, 1, 1,
-0.7851338, 0.1580836, -1.866364, 1, 1, 1, 1, 1,
-0.7820529, 1.235867, 1.01294, 0, 0, 1, 1, 1,
-0.7817494, -0.8186557, -2.701056, 1, 0, 0, 1, 1,
-0.781427, 1.593223, -1.015053, 1, 0, 0, 1, 1,
-0.779816, -0.3928832, -1.192016, 1, 0, 0, 1, 1,
-0.7774597, 0.7891822, 0.5705652, 1, 0, 0, 1, 1,
-0.7706732, 0.9094117, 1.479221, 1, 0, 0, 1, 1,
-0.7653164, -0.9413531, -1.189414, 0, 0, 0, 1, 1,
-0.7650945, 1.1591, -0.214722, 0, 0, 0, 1, 1,
-0.7639286, 0.133112, -1.916161, 0, 0, 0, 1, 1,
-0.7590946, -0.006053045, -1.79195, 0, 0, 0, 1, 1,
-0.7581637, 0.03289563, -3.126747, 0, 0, 0, 1, 1,
-0.7571651, -0.8396553, -3.309555, 0, 0, 0, 1, 1,
-0.7540662, 1.569649, -1.303233, 0, 0, 0, 1, 1,
-0.7517478, 0.3189692, -1.319384, 1, 1, 1, 1, 1,
-0.747831, 0.8235667, -0.9872523, 1, 1, 1, 1, 1,
-0.7386891, -0.7713346, -0.2172634, 1, 1, 1, 1, 1,
-0.7379315, 0.5499962, 0.2650728, 1, 1, 1, 1, 1,
-0.735474, 1.433622, -1.316526, 1, 1, 1, 1, 1,
-0.7347465, 1.355434, -2.527657, 1, 1, 1, 1, 1,
-0.7319661, -0.5038666, -3.71242, 1, 1, 1, 1, 1,
-0.7239323, -0.7936792, -0.7045026, 1, 1, 1, 1, 1,
-0.7223135, 0.536771, -2.058015, 1, 1, 1, 1, 1,
-0.7218624, -1.203941, 0.0176749, 1, 1, 1, 1, 1,
-0.7208527, -0.3517936, -0.8835137, 1, 1, 1, 1, 1,
-0.7199602, 0.4880217, -0.8317204, 1, 1, 1, 1, 1,
-0.7138029, -1.008647, -2.336419, 1, 1, 1, 1, 1,
-0.7128897, -0.7677622, -2.445028, 1, 1, 1, 1, 1,
-0.7076387, 0.8724756, -0.4767245, 1, 1, 1, 1, 1,
-0.699834, -0.6360996, -2.381919, 0, 0, 1, 1, 1,
-0.6988416, -0.552106, -0.8134401, 1, 0, 0, 1, 1,
-0.6951234, 1.311491, -2.518974, 1, 0, 0, 1, 1,
-0.6879514, 0.5446389, -0.6323007, 1, 0, 0, 1, 1,
-0.6876498, -1.06479, -3.280323, 1, 0, 0, 1, 1,
-0.6849483, -1.595082, -0.6842161, 1, 0, 0, 1, 1,
-0.6812671, -0.9646028, -1.567016, 0, 0, 0, 1, 1,
-0.6800719, 1.127394, 1.045387, 0, 0, 0, 1, 1,
-0.6777616, -0.6667106, -2.511736, 0, 0, 0, 1, 1,
-0.6774473, -4.037601, -1.582113, 0, 0, 0, 1, 1,
-0.6769826, -0.8271378, -3.842692, 0, 0, 0, 1, 1,
-0.6737427, 0.5683629, 0.2590398, 0, 0, 0, 1, 1,
-0.6728233, 0.745237, -0.2520009, 0, 0, 0, 1, 1,
-0.6687039, -1.028777, -2.250088, 1, 1, 1, 1, 1,
-0.6671304, -0.1423564, -2.407145, 1, 1, 1, 1, 1,
-0.6612973, -0.06998488, -1.129367, 1, 1, 1, 1, 1,
-0.6591244, -0.4827567, -0.5652962, 1, 1, 1, 1, 1,
-0.6583755, 0.3140954, 0.3115719, 1, 1, 1, 1, 1,
-0.6534829, -1.272714, -2.653287, 1, 1, 1, 1, 1,
-0.6531088, 0.7717452, -2.066518, 1, 1, 1, 1, 1,
-0.6528927, 1.239242, -1.163981, 1, 1, 1, 1, 1,
-0.6501034, 2.147478, -0.9988371, 1, 1, 1, 1, 1,
-0.6450839, 0.3275495, 0.4245695, 1, 1, 1, 1, 1,
-0.6418409, 0.2631921, -1.866726, 1, 1, 1, 1, 1,
-0.6361163, 0.7351902, -0.5195185, 1, 1, 1, 1, 1,
-0.6324758, 1.395098, 0.4233806, 1, 1, 1, 1, 1,
-0.6292493, 1.369689, -2.412049, 1, 1, 1, 1, 1,
-0.6252167, -0.9384649, -1.836041, 1, 1, 1, 1, 1,
-0.6214624, -0.288225, -3.504162, 0, 0, 1, 1, 1,
-0.6214148, -0.05301249, -1.471361, 1, 0, 0, 1, 1,
-0.6201886, -0.04283356, -1.924988, 1, 0, 0, 1, 1,
-0.6173058, -0.8920118, -3.117236, 1, 0, 0, 1, 1,
-0.6154906, 0.928405, 1.050633, 1, 0, 0, 1, 1,
-0.6131207, 1.512584, 0.2743076, 1, 0, 0, 1, 1,
-0.6091626, 0.9876235, -0.9155629, 0, 0, 0, 1, 1,
-0.6067469, 0.5036106, -0.218376, 0, 0, 0, 1, 1,
-0.6031317, -3.032937, -4.221325, 0, 0, 0, 1, 1,
-0.6012299, -0.01860869, -1.958345, 0, 0, 0, 1, 1,
-0.5988822, -0.002159223, -2.573527, 0, 0, 0, 1, 1,
-0.5979161, 1.573954, -0.5515944, 0, 0, 0, 1, 1,
-0.5966066, -0.2575275, -3.365258, 0, 0, 0, 1, 1,
-0.5932117, 0.6570318, -0.8211437, 1, 1, 1, 1, 1,
-0.5903208, 0.8418799, -1.484921, 1, 1, 1, 1, 1,
-0.5874504, 1.391436, -2.389264, 1, 1, 1, 1, 1,
-0.5828676, 1.401581, -1.011294, 1, 1, 1, 1, 1,
-0.5807433, 0.8202652, -1.800246, 1, 1, 1, 1, 1,
-0.577597, -0.3744343, -1.540931, 1, 1, 1, 1, 1,
-0.5744133, -1.760117, -3.679842, 1, 1, 1, 1, 1,
-0.5729563, -0.1974212, -3.375687, 1, 1, 1, 1, 1,
-0.5723714, 0.7989056, -0.9292093, 1, 1, 1, 1, 1,
-0.5721872, 0.07345935, -1.432938, 1, 1, 1, 1, 1,
-0.5686822, 0.1777065, -1.302233, 1, 1, 1, 1, 1,
-0.5680974, 1.862869, 2.21801, 1, 1, 1, 1, 1,
-0.566238, -2.593069, -2.162184, 1, 1, 1, 1, 1,
-0.5643705, -0.1107423, -3.027272, 1, 1, 1, 1, 1,
-0.5622853, 0.7914414, -0.2246369, 1, 1, 1, 1, 1,
-0.5554288, 0.1989706, -1.070771, 0, 0, 1, 1, 1,
-0.5548503, -1.774938, -3.444145, 1, 0, 0, 1, 1,
-0.5538676, 0.1622497, -2.16272, 1, 0, 0, 1, 1,
-0.5531058, -2.281622, -2.686686, 1, 0, 0, 1, 1,
-0.5530686, -0.5867529, -1.962997, 1, 0, 0, 1, 1,
-0.5415804, -1.12625, -3.38384, 1, 0, 0, 1, 1,
-0.540383, -0.9470012, -2.918787, 0, 0, 0, 1, 1,
-0.5392474, 1.321791, -0.02234603, 0, 0, 0, 1, 1,
-0.5388409, 0.1565014, -2.247619, 0, 0, 0, 1, 1,
-0.5387571, -0.1974327, -2.433998, 0, 0, 0, 1, 1,
-0.5372818, 1.062534, -0.8232661, 0, 0, 0, 1, 1,
-0.5295609, 1.301002, 0.7741262, 0, 0, 0, 1, 1,
-0.5274358, -0.01907775, -1.382896, 0, 0, 0, 1, 1,
-0.5236514, 0.1437539, -2.027759, 1, 1, 1, 1, 1,
-0.523025, -1.322939, -2.429603, 1, 1, 1, 1, 1,
-0.5229645, -1.578642, -4.114082, 1, 1, 1, 1, 1,
-0.5228278, 0.3730625, -0.8521965, 1, 1, 1, 1, 1,
-0.5207576, 0.6447772, -0.2587868, 1, 1, 1, 1, 1,
-0.5126392, 0.4814731, -0.481167, 1, 1, 1, 1, 1,
-0.5083593, 0.2360692, -0.9751289, 1, 1, 1, 1, 1,
-0.5059314, -0.7710603, -2.045411, 1, 1, 1, 1, 1,
-0.5018245, -0.6154467, -2.165462, 1, 1, 1, 1, 1,
-0.4991668, 0.1882288, -0.5178105, 1, 1, 1, 1, 1,
-0.4980641, -2.122487, -2.256624, 1, 1, 1, 1, 1,
-0.4960754, -0.143339, -2.078721, 1, 1, 1, 1, 1,
-0.494141, -0.2393468, -2.558594, 1, 1, 1, 1, 1,
-0.4933997, 0.3447499, -2.421288, 1, 1, 1, 1, 1,
-0.4930869, 1.172005, -0.8859205, 1, 1, 1, 1, 1,
-0.4901554, 1.688724, -0.2156093, 0, 0, 1, 1, 1,
-0.4850415, -0.4077999, -1.902217, 1, 0, 0, 1, 1,
-0.4807897, 1.463233, -0.3816511, 1, 0, 0, 1, 1,
-0.4791304, -1.925114, -2.772529, 1, 0, 0, 1, 1,
-0.4786927, 0.7058515, 1.244612, 1, 0, 0, 1, 1,
-0.4749475, -1.133603, -1.839428, 1, 0, 0, 1, 1,
-0.4737169, 0.4783897, 0.4243076, 0, 0, 0, 1, 1,
-0.4712723, -0.3938711, -1.400402, 0, 0, 0, 1, 1,
-0.4681867, 0.718729, -1.52523, 0, 0, 0, 1, 1,
-0.4598167, 1.056383, 0.9548191, 0, 0, 0, 1, 1,
-0.4589303, 2.778988, -1.069275, 0, 0, 0, 1, 1,
-0.458584, -1.417492, -3.955822, 0, 0, 0, 1, 1,
-0.4553102, 0.8995618, -1.284339, 0, 0, 0, 1, 1,
-0.4532923, 0.8407686, -0.1551911, 1, 1, 1, 1, 1,
-0.4521318, 1.26729, -1.309292, 1, 1, 1, 1, 1,
-0.4500483, -2.538314, -1.088348, 1, 1, 1, 1, 1,
-0.4463129, 0.05156001, -0.5867775, 1, 1, 1, 1, 1,
-0.4400122, -0.9468064, -2.764305, 1, 1, 1, 1, 1,
-0.4376163, 1.487129, 0.2545251, 1, 1, 1, 1, 1,
-0.4279515, -1.177874, -2.541523, 1, 1, 1, 1, 1,
-0.4256982, 0.5594289, -2.646858, 1, 1, 1, 1, 1,
-0.4199982, 2.829828, -0.7736579, 1, 1, 1, 1, 1,
-0.4199415, 0.2503413, -0.8232635, 1, 1, 1, 1, 1,
-0.4177406, 0.537938, -1.977096, 1, 1, 1, 1, 1,
-0.4132802, -0.3357974, -3.371155, 1, 1, 1, 1, 1,
-0.4089154, -1.334413, -3.532866, 1, 1, 1, 1, 1,
-0.4085138, -0.3332943, -1.694266, 1, 1, 1, 1, 1,
-0.4070065, -0.4548454, -1.502823, 1, 1, 1, 1, 1,
-0.4051486, -1.271468, -4.035373, 0, 0, 1, 1, 1,
-0.4027472, -1.094762, -2.895023, 1, 0, 0, 1, 1,
-0.3880718, -0.688008, -1.425788, 1, 0, 0, 1, 1,
-0.3868952, -0.3197024, -1.605639, 1, 0, 0, 1, 1,
-0.3863111, 1.012974, -0.6318088, 1, 0, 0, 1, 1,
-0.3857126, 0.3193057, -2.104795, 1, 0, 0, 1, 1,
-0.3852765, 0.9128719, 0.1993352, 0, 0, 0, 1, 1,
-0.383321, 1.268139, -1.498539, 0, 0, 0, 1, 1,
-0.3808822, 0.6541494, -0.04336843, 0, 0, 0, 1, 1,
-0.3800445, 1.414255, -0.1723366, 0, 0, 0, 1, 1,
-0.3748612, -0.9868832, -3.316601, 0, 0, 0, 1, 1,
-0.3746579, -0.5446789, -1.982828, 0, 0, 0, 1, 1,
-0.3674421, 1.596267, -1.077543, 0, 0, 0, 1, 1,
-0.3665597, 0.9666519, -1.393137, 1, 1, 1, 1, 1,
-0.3644295, 1.743609, -0.09941723, 1, 1, 1, 1, 1,
-0.3573359, 0.08261884, -2.307889, 1, 1, 1, 1, 1,
-0.3538008, -1.024376, -2.649414, 1, 1, 1, 1, 1,
-0.3536516, 0.9031938, -0.8025225, 1, 1, 1, 1, 1,
-0.3490769, 1.972612, -0.9152574, 1, 1, 1, 1, 1,
-0.3441424, -0.6431206, -0.6918229, 1, 1, 1, 1, 1,
-0.3435843, -0.5246001, -5.941289, 1, 1, 1, 1, 1,
-0.3397265, 1.057887, -1.434197, 1, 1, 1, 1, 1,
-0.3393224, -1.586532, -2.695137, 1, 1, 1, 1, 1,
-0.3367821, 0.02007237, -2.59162, 1, 1, 1, 1, 1,
-0.3356419, 0.7143157, -1.337186, 1, 1, 1, 1, 1,
-0.3354912, 1.199164, 1.208, 1, 1, 1, 1, 1,
-0.3304744, 1.51661, 0.4750191, 1, 1, 1, 1, 1,
-0.3273065, -0.5053901, -0.9521567, 1, 1, 1, 1, 1,
-0.3151909, -0.8364294, -3.151992, 0, 0, 1, 1, 1,
-0.3097256, 0.849896, 0.9040242, 1, 0, 0, 1, 1,
-0.3069874, -0.4356827, -1.93619, 1, 0, 0, 1, 1,
-0.3064278, -0.2769211, -3.114218, 1, 0, 0, 1, 1,
-0.3012994, 0.03348291, -1.520004, 1, 0, 0, 1, 1,
-0.299338, 1.484817, 0.7027382, 1, 0, 0, 1, 1,
-0.2977994, -0.3104163, -3.815181, 0, 0, 0, 1, 1,
-0.2962434, -0.2442033, -3.12665, 0, 0, 0, 1, 1,
-0.2936603, 0.1425206, -1.313464, 0, 0, 0, 1, 1,
-0.2926258, -0.7589073, -2.602928, 0, 0, 0, 1, 1,
-0.2877751, -1.531049, -2.361148, 0, 0, 0, 1, 1,
-0.2856784, 1.027572, -1.632558, 0, 0, 0, 1, 1,
-0.2840696, 0.1272885, 0.354259, 0, 0, 0, 1, 1,
-0.2806526, 0.539198, -2.14847, 1, 1, 1, 1, 1,
-0.2734886, 0.4829717, -1.005079, 1, 1, 1, 1, 1,
-0.2667152, 0.6828862, -2.289011, 1, 1, 1, 1, 1,
-0.2652178, -0.7895913, -1.296707, 1, 1, 1, 1, 1,
-0.2623121, 1.28378, -0.3149518, 1, 1, 1, 1, 1,
-0.2618942, -1.69359, -3.716507, 1, 1, 1, 1, 1,
-0.2618711, 0.773824, 1.448601, 1, 1, 1, 1, 1,
-0.2573234, -0.1704435, -1.275769, 1, 1, 1, 1, 1,
-0.2560502, 0.7524271, 1.573997, 1, 1, 1, 1, 1,
-0.2502965, -0.3861984, -3.142419, 1, 1, 1, 1, 1,
-0.2487393, 0.9144873, -2.373673, 1, 1, 1, 1, 1,
-0.2422268, 0.871629, 0.3456011, 1, 1, 1, 1, 1,
-0.2394184, 0.7221708, 2.247979, 1, 1, 1, 1, 1,
-0.2393157, 0.8484281, 0.712844, 1, 1, 1, 1, 1,
-0.2372114, 0.6263754, -0.3371125, 1, 1, 1, 1, 1,
-0.2371368, -0.8103365, -2.387471, 0, 0, 1, 1, 1,
-0.2258556, -1.187151, -3.459473, 1, 0, 0, 1, 1,
-0.224245, 1.280343, -0.4503388, 1, 0, 0, 1, 1,
-0.2206913, 0.126193, -3.939177, 1, 0, 0, 1, 1,
-0.2206704, 0.1042728, -1.865911, 1, 0, 0, 1, 1,
-0.2188865, -0.2483445, -2.516132, 1, 0, 0, 1, 1,
-0.2188163, 1.174623, 1.067618, 0, 0, 0, 1, 1,
-0.2168437, -3.106168, -1.705217, 0, 0, 0, 1, 1,
-0.2148575, 0.2899887, -0.7469027, 0, 0, 0, 1, 1,
-0.2120176, 0.5518319, -1.185753, 0, 0, 0, 1, 1,
-0.2093812, 0.3445309, -0.8053003, 0, 0, 0, 1, 1,
-0.2089489, 0.1995972, -0.7900823, 0, 0, 0, 1, 1,
-0.2086425, -1.279795, -2.452747, 0, 0, 0, 1, 1,
-0.2085042, -0.4786397, -0.9106082, 1, 1, 1, 1, 1,
-0.2066864, -0.6412457, -2.786041, 1, 1, 1, 1, 1,
-0.1993342, 0.6966323, 0.6896278, 1, 1, 1, 1, 1,
-0.1990476, 1.243708, -0.8067977, 1, 1, 1, 1, 1,
-0.1987366, 0.8611703, -1.08217, 1, 1, 1, 1, 1,
-0.1978001, -0.4104338, -1.889887, 1, 1, 1, 1, 1,
-0.1954571, -0.5612642, -1.489557, 1, 1, 1, 1, 1,
-0.1935612, 1.938477, 0.809354, 1, 1, 1, 1, 1,
-0.1873069, 0.30335, 0.7065144, 1, 1, 1, 1, 1,
-0.1868665, 1.400473, 0.7312249, 1, 1, 1, 1, 1,
-0.1861724, 0.4603045, 0.2047698, 1, 1, 1, 1, 1,
-0.184171, -0.6330567, -1.388633, 1, 1, 1, 1, 1,
-0.181886, 1.503797, -0.9249324, 1, 1, 1, 1, 1,
-0.1818453, -1.023364, -1.836178, 1, 1, 1, 1, 1,
-0.1780002, 0.3456801, -1.34305, 1, 1, 1, 1, 1,
-0.1721501, 1.32386, 1.173298, 0, 0, 1, 1, 1,
-0.171886, -0.1099742, -2.77289, 1, 0, 0, 1, 1,
-0.165469, 0.4954808, -1.033209, 1, 0, 0, 1, 1,
-0.1610409, 0.2369152, 0.7735173, 1, 0, 0, 1, 1,
-0.1597913, 0.6316558, 1.206593, 1, 0, 0, 1, 1,
-0.1596287, 1.022439, -0.02003623, 1, 0, 0, 1, 1,
-0.1564819, 0.6618266, -0.04202036, 0, 0, 0, 1, 1,
-0.1500736, -0.3036642, -4.6138, 0, 0, 0, 1, 1,
-0.1493346, -0.04967729, -2.382441, 0, 0, 0, 1, 1,
-0.1489615, -0.5385475, -2.926445, 0, 0, 0, 1, 1,
-0.1444579, 1.099822, 0.3963524, 0, 0, 0, 1, 1,
-0.1427177, -2.129663, -2.226481, 0, 0, 0, 1, 1,
-0.1417551, -0.6458454, -3.400806, 0, 0, 0, 1, 1,
-0.1395177, 0.3479379, -1.677017, 1, 1, 1, 1, 1,
-0.1324851, -0.9203877, -2.623961, 1, 1, 1, 1, 1,
-0.1324612, -2.005862, -3.620585, 1, 1, 1, 1, 1,
-0.1317926, 2.344599, 0.03485181, 1, 1, 1, 1, 1,
-0.1299951, -0.4771248, -3.474154, 1, 1, 1, 1, 1,
-0.126018, 2.222446, 0.7899759, 1, 1, 1, 1, 1,
-0.1258123, -0.4184445, -2.505635, 1, 1, 1, 1, 1,
-0.1237953, -0.6444792, -2.489061, 1, 1, 1, 1, 1,
-0.1228424, -0.4421226, -2.386913, 1, 1, 1, 1, 1,
-0.1180768, -2.135979, -4.354805, 1, 1, 1, 1, 1,
-0.1124029, -0.3079026, -3.469277, 1, 1, 1, 1, 1,
-0.1124018, 0.3206723, -0.6346728, 1, 1, 1, 1, 1,
-0.1107518, -1.412618, -1.903236, 1, 1, 1, 1, 1,
-0.1102872, -0.352845, -2.425505, 1, 1, 1, 1, 1,
-0.1099384, 0.546478, 1.149893, 1, 1, 1, 1, 1,
-0.108581, -0.285717, -4.280494, 0, 0, 1, 1, 1,
-0.1072814, -0.7942937, -2.39479, 1, 0, 0, 1, 1,
-0.1043288, -0.2751122, -2.719321, 1, 0, 0, 1, 1,
-0.1042241, 0.9995931, -0.4054465, 1, 0, 0, 1, 1,
-0.1019902, 0.5059521, 0.2319489, 1, 0, 0, 1, 1,
-0.10171, -0.3061006, -2.809838, 1, 0, 0, 1, 1,
-0.1011671, 0.08429227, -2.002584, 0, 0, 0, 1, 1,
-0.1009902, 0.5136626, -1.087915, 0, 0, 0, 1, 1,
-0.09753326, 1.025633, -1.889877, 0, 0, 0, 1, 1,
-0.08775871, -0.1977626, -3.713677, 0, 0, 0, 1, 1,
-0.08389998, 0.963864, 0.3166583, 0, 0, 0, 1, 1,
-0.08389559, -1.266097, -3.916637, 0, 0, 0, 1, 1,
-0.08371919, 0.7654989, -2.194595, 0, 0, 0, 1, 1,
-0.0813863, 1.007268, 2.169268, 1, 1, 1, 1, 1,
-0.08028473, -0.4962602, -3.118776, 1, 1, 1, 1, 1,
-0.07876614, -0.2950916, -2.8831, 1, 1, 1, 1, 1,
-0.07737206, -1.095661, -3.487075, 1, 1, 1, 1, 1,
-0.07511411, -0.3825675, -3.636957, 1, 1, 1, 1, 1,
-0.0686244, 1.151597, -0.009763628, 1, 1, 1, 1, 1,
-0.06393989, 0.3594575, -0.0004699378, 1, 1, 1, 1, 1,
-0.06104536, -0.4636824, -3.309523, 1, 1, 1, 1, 1,
-0.05662512, -1.252337, -0.5293651, 1, 1, 1, 1, 1,
-0.0476129, 0.2069602, 0.2915364, 1, 1, 1, 1, 1,
-0.04600948, 0.04176804, -0.6275957, 1, 1, 1, 1, 1,
-0.04209876, -0.4942171, -3.559427, 1, 1, 1, 1, 1,
-0.03072584, -1.458927, -3.148974, 1, 1, 1, 1, 1,
-0.02999552, 0.1286625, 0.6218244, 1, 1, 1, 1, 1,
-0.0293133, 0.5561407, -1.04875, 1, 1, 1, 1, 1,
-0.02813409, 0.1044728, -0.2586815, 0, 0, 1, 1, 1,
-0.02525742, -0.6539016, -5.260195, 1, 0, 0, 1, 1,
-0.02434255, 1.494184, 0.2598341, 1, 0, 0, 1, 1,
-0.02273761, -0.05088842, -4.371514, 1, 0, 0, 1, 1,
-0.01567865, 2.330777, 0.4378794, 1, 0, 0, 1, 1,
-0.01378254, 0.9335093, 0.6002436, 1, 0, 0, 1, 1,
-0.01159704, 0.6438254, -0.05239124, 0, 0, 0, 1, 1,
-0.006977352, -0.925645, -3.618166, 0, 0, 0, 1, 1,
-0.004691374, -0.3501305, -3.867932, 0, 0, 0, 1, 1,
-0.001598195, -0.186046, -3.04453, 0, 0, 0, 1, 1,
2.813815e-05, 1.286115, -1.442856, 0, 0, 0, 1, 1,
0.001462055, -0.7285653, 2.778718, 0, 0, 0, 1, 1,
0.004029946, 0.1070296, -0.003991663, 0, 0, 0, 1, 1,
0.005519034, 0.3724917, 0.8586324, 1, 1, 1, 1, 1,
0.005564423, -1.002586, 2.90004, 1, 1, 1, 1, 1,
0.006047744, 0.2182367, -0.3304265, 1, 1, 1, 1, 1,
0.009444675, -0.7105265, -0.161996, 1, 1, 1, 1, 1,
0.01009512, 0.4469434, 0.4868432, 1, 1, 1, 1, 1,
0.01649236, 1.257275, 0.02340701, 1, 1, 1, 1, 1,
0.0180156, 0.7994096, -0.6607234, 1, 1, 1, 1, 1,
0.01819489, -0.4669596, 3.811188, 1, 1, 1, 1, 1,
0.01847873, -1.319441, 2.212905, 1, 1, 1, 1, 1,
0.01883314, 0.4391775, 1.231271, 1, 1, 1, 1, 1,
0.0209347, -1.349804, 3.888378, 1, 1, 1, 1, 1,
0.02566966, -0.3196528, 3.52221, 1, 1, 1, 1, 1,
0.03164482, 0.2920808, 2.427881, 1, 1, 1, 1, 1,
0.03366955, 2.02581, -1.063777, 1, 1, 1, 1, 1,
0.04055257, -1.46628, 3.766649, 1, 1, 1, 1, 1,
0.04331429, 1.090664, 1.963193, 0, 0, 1, 1, 1,
0.05049672, -0.8333887, 2.558361, 1, 0, 0, 1, 1,
0.06375213, -0.1743881, 2.084491, 1, 0, 0, 1, 1,
0.06725265, -0.08356488, 1.437681, 1, 0, 0, 1, 1,
0.06753073, -1.107435, 2.441388, 1, 0, 0, 1, 1,
0.06950778, -1.256785, 5.116058, 1, 0, 0, 1, 1,
0.07956545, 0.9560534, -2.047718, 0, 0, 0, 1, 1,
0.08098458, -1.620826, 3.31069, 0, 0, 0, 1, 1,
0.08132897, -0.2511292, 2.512088, 0, 0, 0, 1, 1,
0.08239476, -0.4554382, 3.897127, 0, 0, 0, 1, 1,
0.08496913, 0.3469348, 0.4024461, 0, 0, 0, 1, 1,
0.0851703, -0.9371863, 2.722442, 0, 0, 0, 1, 1,
0.08835148, -0.8559689, 4.246595, 0, 0, 0, 1, 1,
0.08949779, -0.3972229, 2.667389, 1, 1, 1, 1, 1,
0.09092063, 0.7324061, -0.416978, 1, 1, 1, 1, 1,
0.09349822, -0.6691678, 1.534524, 1, 1, 1, 1, 1,
0.09376302, -0.7208352, 2.514754, 1, 1, 1, 1, 1,
0.09669388, -2.441342, 3.087595, 1, 1, 1, 1, 1,
0.1047156, -0.6132352, 2.984161, 1, 1, 1, 1, 1,
0.1129447, 0.3498667, 0.6840785, 1, 1, 1, 1, 1,
0.1141222, -0.285112, 3.386674, 1, 1, 1, 1, 1,
0.1195416, 0.3379309, 1.842959, 1, 1, 1, 1, 1,
0.120325, -0.3919412, 2.503771, 1, 1, 1, 1, 1,
0.123988, 0.9548171, 0.6030259, 1, 1, 1, 1, 1,
0.1303164, 1.003394, 0.4755544, 1, 1, 1, 1, 1,
0.1306251, 0.8181611, 0.5828857, 1, 1, 1, 1, 1,
0.1328757, -0.6316126, 3.470165, 1, 1, 1, 1, 1,
0.1421346, -0.6948086, 3.528241, 1, 1, 1, 1, 1,
0.1512025, -0.2065419, 4.659348, 0, 0, 1, 1, 1,
0.1515726, 1.154978, -0.7004452, 1, 0, 0, 1, 1,
0.1526337, -1.894317, 3.093636, 1, 0, 0, 1, 1,
0.1528205, 0.1301369, 1.50673, 1, 0, 0, 1, 1,
0.1578111, 0.887699, 0.4462333, 1, 0, 0, 1, 1,
0.1594959, 9.117712e-06, 3.139642, 1, 0, 0, 1, 1,
0.1657632, 0.8972, 2.213875, 0, 0, 0, 1, 1,
0.1657967, -0.5259023, 3.05166, 0, 0, 0, 1, 1,
0.1703927, 0.6030702, 1.645513, 0, 0, 0, 1, 1,
0.1757165, -0.2478047, 3.024067, 0, 0, 0, 1, 1,
0.1761704, -1.666959, 5.241633, 0, 0, 0, 1, 1,
0.176933, -0.2336872, 2.040505, 0, 0, 0, 1, 1,
0.1769509, -0.9245344, 1.609348, 0, 0, 0, 1, 1,
0.1781698, 0.1872048, 1.187377, 1, 1, 1, 1, 1,
0.1784347, 0.5082511, -0.6868453, 1, 1, 1, 1, 1,
0.1791711, 2.025079, 1.753489, 1, 1, 1, 1, 1,
0.1793442, 0.1166123, 0.7008088, 1, 1, 1, 1, 1,
0.1827713, 0.5147026, 0.1168799, 1, 1, 1, 1, 1,
0.1847469, 1.030211, -0.3621522, 1, 1, 1, 1, 1,
0.1926609, -1.12271, 5.119892, 1, 1, 1, 1, 1,
0.1977419, -0.1626903, 1.355727, 1, 1, 1, 1, 1,
0.1994919, -1.321179, 3.178718, 1, 1, 1, 1, 1,
0.2058654, -1.218405, 2.724925, 1, 1, 1, 1, 1,
0.2085868, 0.1599943, -1.190828, 1, 1, 1, 1, 1,
0.2146397, 1.547865, 1.619162, 1, 1, 1, 1, 1,
0.2167332, 0.643328, 0.08476984, 1, 1, 1, 1, 1,
0.2172115, 0.9536955, -1.48147, 1, 1, 1, 1, 1,
0.2179095, -1.224266, 3.568591, 1, 1, 1, 1, 1,
0.2188298, 0.1211424, 0.1644413, 0, 0, 1, 1, 1,
0.2261423, -1.248315, 3.776669, 1, 0, 0, 1, 1,
0.2283566, 2.191036, 1.185154, 1, 0, 0, 1, 1,
0.2311673, 1.106882, -0.7822032, 1, 0, 0, 1, 1,
0.2393098, -1.005356, 2.263313, 1, 0, 0, 1, 1,
0.2393641, 0.7552068, 2.081251, 1, 0, 0, 1, 1,
0.2417136, 0.8208002, -0.3940924, 0, 0, 0, 1, 1,
0.2490324, 1.317113, 0.2528516, 0, 0, 0, 1, 1,
0.2494816, -0.3896561, 2.436509, 0, 0, 0, 1, 1,
0.2498193, -0.2621854, -0.05839149, 0, 0, 0, 1, 1,
0.2514994, 0.2807069, 2.376796, 0, 0, 0, 1, 1,
0.2622767, -0.3628355, 2.655283, 0, 0, 0, 1, 1,
0.2706793, 1.147417, 0.5169144, 0, 0, 0, 1, 1,
0.2715443, -2.107018, 2.454686, 1, 1, 1, 1, 1,
0.2753176, -1.001779, 4.350722, 1, 1, 1, 1, 1,
0.2769836, -0.9657902, 5.11817, 1, 1, 1, 1, 1,
0.2794771, -1.202206, 3.869477, 1, 1, 1, 1, 1,
0.2799352, 0.5214404, -0.5590958, 1, 1, 1, 1, 1,
0.2817356, 0.3057229, 1.428125, 1, 1, 1, 1, 1,
0.28281, 0.6780801, 0.3423833, 1, 1, 1, 1, 1,
0.283303, -0.2662231, 1.977489, 1, 1, 1, 1, 1,
0.2842362, 0.5783045, -0.1423401, 1, 1, 1, 1, 1,
0.2854309, -1.914079, 3.779648, 1, 1, 1, 1, 1,
0.2856005, 0.241716, -0.1225119, 1, 1, 1, 1, 1,
0.2888943, -0.06926876, 0.6780491, 1, 1, 1, 1, 1,
0.2949867, -0.05134772, 1.468582, 1, 1, 1, 1, 1,
0.3007616, 1.666458, -1.833161, 1, 1, 1, 1, 1,
0.3049347, -0.2816984, 4.686465, 1, 1, 1, 1, 1,
0.3121911, 0.5633023, 0.5534752, 0, 0, 1, 1, 1,
0.3158119, 0.6702259, -1.31604, 1, 0, 0, 1, 1,
0.3159772, -0.8466273, 4.643427, 1, 0, 0, 1, 1,
0.3167081, 0.4577875, 0.8432985, 1, 0, 0, 1, 1,
0.3177486, -0.5719236, 0.5650319, 1, 0, 0, 1, 1,
0.3180702, -0.9626521, 3.177307, 1, 0, 0, 1, 1,
0.3208066, 0.6964945, 2.19464, 0, 0, 0, 1, 1,
0.3211919, 0.2795397, 1.524742, 0, 0, 0, 1, 1,
0.3278405, 0.8084537, 2.37448, 0, 0, 0, 1, 1,
0.3300889, -1.014829, 2.645525, 0, 0, 0, 1, 1,
0.3306158, -1.060184, 2.593279, 0, 0, 0, 1, 1,
0.3478662, -1.779188, 2.693311, 0, 0, 0, 1, 1,
0.3508234, -1.224011, 2.949111, 0, 0, 0, 1, 1,
0.3529534, -0.195966, 1.966546, 1, 1, 1, 1, 1,
0.3540218, 0.3931564, 1.035649, 1, 1, 1, 1, 1,
0.3552597, -1.318496, 0.3381047, 1, 1, 1, 1, 1,
0.3669983, -0.4707128, 1.392204, 1, 1, 1, 1, 1,
0.3767404, 0.1094698, 2.655114, 1, 1, 1, 1, 1,
0.3931873, 0.4771409, -0.7341947, 1, 1, 1, 1, 1,
0.3973185, -0.5609964, 1.56945, 1, 1, 1, 1, 1,
0.3979784, -0.08798243, 3.024825, 1, 1, 1, 1, 1,
0.3980784, 0.6728413, -0.4550775, 1, 1, 1, 1, 1,
0.4000756, -0.2050487, 1.961071, 1, 1, 1, 1, 1,
0.4005565, -1.260707, 1.904885, 1, 1, 1, 1, 1,
0.4054653, -0.6239491, 2.457365, 1, 1, 1, 1, 1,
0.409601, -0.2762923, 1.559892, 1, 1, 1, 1, 1,
0.4125549, -2.139406, 2.77127, 1, 1, 1, 1, 1,
0.4191458, -0.2219801, 1.77421, 1, 1, 1, 1, 1,
0.4203308, -1.133411, 3.545244, 0, 0, 1, 1, 1,
0.421154, 0.1395247, 2.30112, 1, 0, 0, 1, 1,
0.4212274, -0.3737814, 2.58222, 1, 0, 0, 1, 1,
0.4214085, 0.5896379, -0.07963245, 1, 0, 0, 1, 1,
0.4226924, 0.2207308, 2.05558, 1, 0, 0, 1, 1,
0.4242479, -1.556059, 3.373428, 1, 0, 0, 1, 1,
0.4260451, -0.627875, 2.552442, 0, 0, 0, 1, 1,
0.4272223, 0.8157009, -1.407361, 0, 0, 0, 1, 1,
0.4290048, 0.6170437, 0.3151676, 0, 0, 0, 1, 1,
0.4294249, 0.5642586, 1.505719, 0, 0, 0, 1, 1,
0.4310278, -1.279763, 2.264123, 0, 0, 0, 1, 1,
0.4316324, 0.1293568, 1.849553, 0, 0, 0, 1, 1,
0.4370551, 0.0633935, 1.339531, 0, 0, 0, 1, 1,
0.4383231, -0.008355671, 2.406294, 1, 1, 1, 1, 1,
0.443121, 1.245288, -0.3024918, 1, 1, 1, 1, 1,
0.4440743, 0.0893997, 1.519931, 1, 1, 1, 1, 1,
0.4447879, 0.9624117, 0.7926402, 1, 1, 1, 1, 1,
0.4454867, -0.2283992, 2.486337, 1, 1, 1, 1, 1,
0.4499631, 0.7311316, -1.345041, 1, 1, 1, 1, 1,
0.4504965, -1.906757, 2.068314, 1, 1, 1, 1, 1,
0.4509327, 0.9989635, -0.9377539, 1, 1, 1, 1, 1,
0.453512, -0.7465143, 2.629923, 1, 1, 1, 1, 1,
0.4552572, -0.3801402, 2.703761, 1, 1, 1, 1, 1,
0.4555764, -1.473169, 2.776327, 1, 1, 1, 1, 1,
0.45605, 1.828622, 1.12283, 1, 1, 1, 1, 1,
0.4571294, 0.05390865, 2.031019, 1, 1, 1, 1, 1,
0.4594395, 0.5858011, 1.559397, 1, 1, 1, 1, 1,
0.4598881, -0.385363, 1.579844, 1, 1, 1, 1, 1,
0.4664153, -0.3129674, 3.530723, 0, 0, 1, 1, 1,
0.4706031, -0.6081263, 5.110587, 1, 0, 0, 1, 1,
0.4725294, -1.280066, 2.111821, 1, 0, 0, 1, 1,
0.4765306, -0.3544942, 1.869228, 1, 0, 0, 1, 1,
0.481502, -0.672147, 2.250077, 1, 0, 0, 1, 1,
0.4817618, 0.7138939, -0.2583987, 1, 0, 0, 1, 1,
0.4855769, -0.6195954, 2.151997, 0, 0, 0, 1, 1,
0.4859572, 0.9580641, 1.331257, 0, 0, 0, 1, 1,
0.4868677, 2.025676, 0.991916, 0, 0, 0, 1, 1,
0.4887678, -1.670505, 2.086334, 0, 0, 0, 1, 1,
0.4934667, 1.528935, 0.9017228, 0, 0, 0, 1, 1,
0.4947767, -1.857096, 1.667703, 0, 0, 0, 1, 1,
0.5003501, -0.4070546, 2.821653, 0, 0, 0, 1, 1,
0.5007586, -1.189018, 2.363037, 1, 1, 1, 1, 1,
0.501055, 0.03817405, 1.026212, 1, 1, 1, 1, 1,
0.5014092, 0.1213246, 0.6813702, 1, 1, 1, 1, 1,
0.5028592, 0.006951831, 0.4152536, 1, 1, 1, 1, 1,
0.5079676, -1.92132, 3.742572, 1, 1, 1, 1, 1,
0.509875, -0.144855, 2.286095, 1, 1, 1, 1, 1,
0.5100601, -1.908569, 3.191938, 1, 1, 1, 1, 1,
0.5102249, -0.8353484, 3.436501, 1, 1, 1, 1, 1,
0.5172547, -0.1691141, 2.350974, 1, 1, 1, 1, 1,
0.5198084, 0.2494821, -0.09037478, 1, 1, 1, 1, 1,
0.5238734, -0.8112968, 0.8995852, 1, 1, 1, 1, 1,
0.5242394, 1.56682, 0.11674, 1, 1, 1, 1, 1,
0.5296427, 0.2632977, -0.022006, 1, 1, 1, 1, 1,
0.5297111, 0.1325659, 1.383928, 1, 1, 1, 1, 1,
0.5321296, 0.01923046, 1.45406, 1, 1, 1, 1, 1,
0.5330839, 0.8177167, 0.8390846, 0, 0, 1, 1, 1,
0.5360123, 1.2358, 0.8199259, 1, 0, 0, 1, 1,
0.5363904, -0.5570824, 0.2479723, 1, 0, 0, 1, 1,
0.5392957, -0.3307074, 3.795697, 1, 0, 0, 1, 1,
0.5416406, -1.00964, 2.462617, 1, 0, 0, 1, 1,
0.5507206, -0.5316306, 3.261883, 1, 0, 0, 1, 1,
0.5535223, -0.4659229, 2.131419, 0, 0, 0, 1, 1,
0.5540497, 0.06305092, 0.8448842, 0, 0, 0, 1, 1,
0.5576115, 1.461926, 0.5373315, 0, 0, 0, 1, 1,
0.5606273, 2.541478, -0.1964381, 0, 0, 0, 1, 1,
0.5626259, -0.604023, 2.745454, 0, 0, 0, 1, 1,
0.5635574, -0.6170375, 2.310496, 0, 0, 0, 1, 1,
0.5657565, -0.4119183, 3.59973, 0, 0, 0, 1, 1,
0.570431, 1.136392, 2.993672, 1, 1, 1, 1, 1,
0.5716887, 0.1479262, -0.290317, 1, 1, 1, 1, 1,
0.5741336, 1.176391, 0.3232534, 1, 1, 1, 1, 1,
0.5860366, -0.517886, 2.546248, 1, 1, 1, 1, 1,
0.5911496, 0.7054346, 1.12388, 1, 1, 1, 1, 1,
0.594586, -0.6528202, 2.934574, 1, 1, 1, 1, 1,
0.5952737, 0.7738402, 0.3813918, 1, 1, 1, 1, 1,
0.598535, -0.2142539, 0.7619941, 1, 1, 1, 1, 1,
0.5985738, -0.4678078, 4.569421, 1, 1, 1, 1, 1,
0.6011116, 0.09153362, 0.1962448, 1, 1, 1, 1, 1,
0.6083666, -0.2823981, 1.731471, 1, 1, 1, 1, 1,
0.6094341, 0.4631575, -0.4891245, 1, 1, 1, 1, 1,
0.6097681, 0.3830151, 0.4721453, 1, 1, 1, 1, 1,
0.6098307, 1.364749, -0.2980284, 1, 1, 1, 1, 1,
0.6108007, 2.119334, 1.62177, 1, 1, 1, 1, 1,
0.6178751, 0.8161066, 2.319891, 0, 0, 1, 1, 1,
0.6181608, 0.1413153, 1.704695, 1, 0, 0, 1, 1,
0.6189231, -0.7776938, 2.601782, 1, 0, 0, 1, 1,
0.6273255, 1.158773, -0.1646881, 1, 0, 0, 1, 1,
0.6274328, -0.003726602, 1.66999, 1, 0, 0, 1, 1,
0.6285432, 0.1369309, 1.920204, 1, 0, 0, 1, 1,
0.6344591, -0.5913315, 2.172123, 0, 0, 0, 1, 1,
0.6376033, -1.41905, 3.30847, 0, 0, 0, 1, 1,
0.639052, 0.7749864, 1.713604, 0, 0, 0, 1, 1,
0.6417834, 1.150013, 1.976859, 0, 0, 0, 1, 1,
0.6464083, -2.10906, 2.606218, 0, 0, 0, 1, 1,
0.6473407, 0.1551783, 1.667951, 0, 0, 0, 1, 1,
0.6475334, -0.6435739, 1.522762, 0, 0, 0, 1, 1,
0.6481465, 0.7136575, 2.665075, 1, 1, 1, 1, 1,
0.6521853, 0.1533424, 1.603434, 1, 1, 1, 1, 1,
0.6553295, -0.4567152, 1.589845, 1, 1, 1, 1, 1,
0.6572673, -0.4857085, 1.977044, 1, 1, 1, 1, 1,
0.6618894, 0.1783692, 0.8004612, 1, 1, 1, 1, 1,
0.6655839, -0.3766402, 2.217038, 1, 1, 1, 1, 1,
0.6705416, 1.538857, -0.6881088, 1, 1, 1, 1, 1,
0.6717097, -0.1216007, 1.722363, 1, 1, 1, 1, 1,
0.6818339, 0.03911284, 1.910846, 1, 1, 1, 1, 1,
0.6843332, -0.7050263, 1.541646, 1, 1, 1, 1, 1,
0.6877618, -0.1874682, 1.450814, 1, 1, 1, 1, 1,
0.6975252, 0.8146074, 2.862777, 1, 1, 1, 1, 1,
0.6982459, -0.26213, 2.534718, 1, 1, 1, 1, 1,
0.6987771, 0.1196124, 1.511477, 1, 1, 1, 1, 1,
0.6992738, 0.006913688, 2.622898, 1, 1, 1, 1, 1,
0.7018065, 1.078251, 0.4027377, 0, 0, 1, 1, 1,
0.7028637, -0.8211499, 3.7758, 1, 0, 0, 1, 1,
0.7055334, 0.9971533, 0.9190071, 1, 0, 0, 1, 1,
0.7145553, -0.2133881, 1.634852, 1, 0, 0, 1, 1,
0.714569, -0.2142485, 2.480562, 1, 0, 0, 1, 1,
0.7201043, 1.142368, 1.280116, 1, 0, 0, 1, 1,
0.721958, -0.9660757, 3.544824, 0, 0, 0, 1, 1,
0.723924, -1.12541, 4.406976, 0, 0, 0, 1, 1,
0.7263819, 0.1375631, 1.196637, 0, 0, 0, 1, 1,
0.7282315, -1.077809, 3.596506, 0, 0, 0, 1, 1,
0.7492671, -0.8060051, 3.698593, 0, 0, 0, 1, 1,
0.7530662, 0.5292158, 1.92712, 0, 0, 0, 1, 1,
0.7531242, -0.5855215, 3.209994, 0, 0, 0, 1, 1,
0.7555246, -2.407529, 3.24742, 1, 1, 1, 1, 1,
0.7666258, -1.107517, 1.932227, 1, 1, 1, 1, 1,
0.7691842, -0.2527204, 2.684363, 1, 1, 1, 1, 1,
0.7695574, 0.2302325, 0.6430974, 1, 1, 1, 1, 1,
0.7842742, -0.7946129, 2.954528, 1, 1, 1, 1, 1,
0.7954742, 1.401597, 1.417453, 1, 1, 1, 1, 1,
0.7974542, 0.3754093, 2.177651, 1, 1, 1, 1, 1,
0.799507, -0.7925088, 2.094145, 1, 1, 1, 1, 1,
0.8011667, -1.115025, 3.604854, 1, 1, 1, 1, 1,
0.8075609, 0.9053142, 1.655694, 1, 1, 1, 1, 1,
0.8094445, 0.1427729, 1.477545, 1, 1, 1, 1, 1,
0.8105195, -0.2346175, 2.560082, 1, 1, 1, 1, 1,
0.8114167, 1.346729, 1.613654, 1, 1, 1, 1, 1,
0.8167637, 1.571906, 2.573651, 1, 1, 1, 1, 1,
0.8203213, -0.1684728, 0.3585225, 1, 1, 1, 1, 1,
0.8211452, -1.049352, 4.889849, 0, 0, 1, 1, 1,
0.8267949, 1.619683, 0.8342807, 1, 0, 0, 1, 1,
0.8303536, -0.9396806, 4.45418, 1, 0, 0, 1, 1,
0.8307912, -0.1214798, 3.208956, 1, 0, 0, 1, 1,
0.8325483, -3.626637, 3.728936, 1, 0, 0, 1, 1,
0.8384481, -0.7266721, 3.610491, 1, 0, 0, 1, 1,
0.8457099, 0.7414528, 1.488855, 0, 0, 0, 1, 1,
0.8513011, -0.2485816, 1.597482, 0, 0, 0, 1, 1,
0.8519678, 2.052177, 0.8971352, 0, 0, 0, 1, 1,
0.8531456, -0.693651, 0.7390211, 0, 0, 0, 1, 1,
0.8569335, -0.431466, 1.338425, 0, 0, 0, 1, 1,
0.8586742, -0.1779823, 3.516039, 0, 0, 0, 1, 1,
0.8599298, -0.2309224, 0.5457038, 0, 0, 0, 1, 1,
0.8607367, -1.03328, 2.359961, 1, 1, 1, 1, 1,
0.8679953, -0.7979486, 1.727945, 1, 1, 1, 1, 1,
0.8808528, -1.199722, 3.64639, 1, 1, 1, 1, 1,
0.887018, -0.3435953, 1.519821, 1, 1, 1, 1, 1,
0.8876601, 0.2506284, 0.3207531, 1, 1, 1, 1, 1,
0.8922105, 0.9554901, 1.275266, 1, 1, 1, 1, 1,
0.8999225, 0.3653011, 0.3825692, 1, 1, 1, 1, 1,
0.9055126, 0.01591504, 2.350055, 1, 1, 1, 1, 1,
0.9152893, -0.2340547, 3.082657, 1, 1, 1, 1, 1,
0.915876, -0.06598271, 0.118044, 1, 1, 1, 1, 1,
0.9205968, 0.2561501, 1.807939, 1, 1, 1, 1, 1,
0.9278157, -0.9719687, 1.775042, 1, 1, 1, 1, 1,
0.929781, 0.46228, -0.2419265, 1, 1, 1, 1, 1,
0.9331726, -0.4096656, 0.3750951, 1, 1, 1, 1, 1,
0.9420913, 0.3666342, 1.113665, 1, 1, 1, 1, 1,
0.9423146, 0.7442706, 1.361729, 0, 0, 1, 1, 1,
0.9591558, -1.190096, 2.682136, 1, 0, 0, 1, 1,
0.9599844, -1.606623, 3.198688, 1, 0, 0, 1, 1,
0.9617715, 0.90154, 0.6391715, 1, 0, 0, 1, 1,
0.9662226, 0.9081523, 0.7717029, 1, 0, 0, 1, 1,
0.968445, 0.2943275, 0.2607, 1, 0, 0, 1, 1,
0.971709, 2.604529, -0.08409195, 0, 0, 0, 1, 1,
0.9799351, 2.405699, 2.045091, 0, 0, 0, 1, 1,
0.9832754, 0.18352, 1.884002, 0, 0, 0, 1, 1,
0.9833063, -0.1893102, 1.759238, 0, 0, 0, 1, 1,
0.9846517, 0.2673508, 1.774248, 0, 0, 0, 1, 1,
0.9868335, 1.977322, 0.3610328, 0, 0, 0, 1, 1,
0.9939578, -0.4808162, 3.361225, 0, 0, 0, 1, 1,
0.9983974, 0.8637103, 1.322223, 1, 1, 1, 1, 1,
1.003665, -0.5677551, 2.779402, 1, 1, 1, 1, 1,
1.005132, 1.304523, 1.528284, 1, 1, 1, 1, 1,
1.007691, 0.5593839, 2.622588, 1, 1, 1, 1, 1,
1.011923, -2.267494, 2.656684, 1, 1, 1, 1, 1,
1.012778, -1.480264, 2.427069, 1, 1, 1, 1, 1,
1.017285, 0.2440001, 1.326205, 1, 1, 1, 1, 1,
1.022364, -0.4187506, 2.240949, 1, 1, 1, 1, 1,
1.030096, -0.1893514, 0.8813797, 1, 1, 1, 1, 1,
1.031205, -2.119034, 3.23898, 1, 1, 1, 1, 1,
1.033197, 1.785486, 1.319756, 1, 1, 1, 1, 1,
1.036292, -0.4706005, 4.056623, 1, 1, 1, 1, 1,
1.037712, 0.1117694, 1.00209, 1, 1, 1, 1, 1,
1.039153, 0.5187867, 2.025728, 1, 1, 1, 1, 1,
1.041885, -0.9688696, 3.012737, 1, 1, 1, 1, 1,
1.049458, 0.3653236, 0.3034391, 0, 0, 1, 1, 1,
1.05, -0.9851106, 2.572098, 1, 0, 0, 1, 1,
1.053503, -1.398063, 2.195446, 1, 0, 0, 1, 1,
1.054154, 2.178262, -1.855766, 1, 0, 0, 1, 1,
1.054897, 1.972229, 2.481488, 1, 0, 0, 1, 1,
1.057143, -1.01729, 1.708961, 1, 0, 0, 1, 1,
1.063362, 1.389758, -0.237961, 0, 0, 0, 1, 1,
1.065448, -0.4807478, 1.703957, 0, 0, 0, 1, 1,
1.066754, 0.2643567, 1.660319, 0, 0, 0, 1, 1,
1.068432, 0.2426668, 0.6857522, 0, 0, 0, 1, 1,
1.077681, -1.690336, 1.817348, 0, 0, 0, 1, 1,
1.078398, -0.5234226, 1.124332, 0, 0, 0, 1, 1,
1.081426, 1.266746, 1.365092, 0, 0, 0, 1, 1,
1.082082, -0.9705752, 1.427197, 1, 1, 1, 1, 1,
1.082118, 0.846029, -0.3551304, 1, 1, 1, 1, 1,
1.084384, 0.6187873, 2.225223, 1, 1, 1, 1, 1,
1.086595, 0.4225661, 0.7682686, 1, 1, 1, 1, 1,
1.089904, 0.2645257, 2.233797, 1, 1, 1, 1, 1,
1.095679, -0.1174753, 2.836586, 1, 1, 1, 1, 1,
1.096501, -0.05698216, -0.3610338, 1, 1, 1, 1, 1,
1.114739, -1.12884, 2.834675, 1, 1, 1, 1, 1,
1.129096, -0.6752239, 1.468583, 1, 1, 1, 1, 1,
1.137762, 1.056333, 1.054687, 1, 1, 1, 1, 1,
1.147058, 0.9145119, -0.009636225, 1, 1, 1, 1, 1,
1.147932, -1.136746, 2.006684, 1, 1, 1, 1, 1,
1.149601, 1.157471, 1.8094, 1, 1, 1, 1, 1,
1.153119, -1.436377, 3.621449, 1, 1, 1, 1, 1,
1.156607, -0.271376, 2.797768, 1, 1, 1, 1, 1,
1.15751, 0.02418871, 1.076817, 0, 0, 1, 1, 1,
1.15927, 0.1573397, 1.915399, 1, 0, 0, 1, 1,
1.166261, 0.8658425, 1.458831, 1, 0, 0, 1, 1,
1.166302, 0.8206713, 1.773809, 1, 0, 0, 1, 1,
1.169255, -0.8751679, 3.770653, 1, 0, 0, 1, 1,
1.169314, -1.321841, 4.125232, 1, 0, 0, 1, 1,
1.179051, 1.363749, 1.07814, 0, 0, 0, 1, 1,
1.18016, -1.514881, 1.228465, 0, 0, 0, 1, 1,
1.183337, 1.381019, 0.5627483, 0, 0, 0, 1, 1,
1.189323, -0.1147249, 2.173317, 0, 0, 0, 1, 1,
1.191099, -2.140148, 3.455562, 0, 0, 0, 1, 1,
1.192253, 1.538054, 0.6068645, 0, 0, 0, 1, 1,
1.193472, -0.5458533, 2.322718, 0, 0, 0, 1, 1,
1.197309, 0.3879691, 0.9563212, 1, 1, 1, 1, 1,
1.200258, -0.6703366, 2.434131, 1, 1, 1, 1, 1,
1.205702, 1.736573, 0.05178445, 1, 1, 1, 1, 1,
1.208049, 0.3844416, 1.332044, 1, 1, 1, 1, 1,
1.214053, -0.7958738, 4.551717, 1, 1, 1, 1, 1,
1.214439, 0.8202432, 0.126901, 1, 1, 1, 1, 1,
1.222314, -1.038142, 3.079364, 1, 1, 1, 1, 1,
1.234535, 1.20884, 0.06931466, 1, 1, 1, 1, 1,
1.237008, -0.4576185, 2.178131, 1, 1, 1, 1, 1,
1.244163, 0.3434272, 1.0381, 1, 1, 1, 1, 1,
1.245347, 0.1595087, 1.084814, 1, 1, 1, 1, 1,
1.247839, 0.4780718, 2.5615, 1, 1, 1, 1, 1,
1.251111, 0.2274861, -0.280017, 1, 1, 1, 1, 1,
1.252889, 1.292861, 0.6867753, 1, 1, 1, 1, 1,
1.258606, -0.6615139, 4.785131, 1, 1, 1, 1, 1,
1.258967, 0.2706535, 1.170572, 0, 0, 1, 1, 1,
1.259346, -0.6146007, 2.155563, 1, 0, 0, 1, 1,
1.267062, -1.434302, 1.357504, 1, 0, 0, 1, 1,
1.288404, -0.2406187, 2.852068, 1, 0, 0, 1, 1,
1.292725, 2.990105, -0.7760308, 1, 0, 0, 1, 1,
1.296371, 0.6930531, 0.5449954, 1, 0, 0, 1, 1,
1.298789, -0.807619, 2.825436, 0, 0, 0, 1, 1,
1.309075, -0.4583942, 2.907987, 0, 0, 0, 1, 1,
1.310063, 0.7915294, -0.3362322, 0, 0, 0, 1, 1,
1.315047, 1.511338, 0.739607, 0, 0, 0, 1, 1,
1.315362, 1.873512, 1.904699, 0, 0, 0, 1, 1,
1.31873, 0.3757153, 2.01205, 0, 0, 0, 1, 1,
1.33202, -0.3292631, -0.2951735, 0, 0, 0, 1, 1,
1.336185, 0.07736476, 0.8516325, 1, 1, 1, 1, 1,
1.35069, 0.2728824, 2.222658, 1, 1, 1, 1, 1,
1.351906, 2.582394, -0.7353685, 1, 1, 1, 1, 1,
1.358134, -1.304093, 3.33237, 1, 1, 1, 1, 1,
1.359198, 0.405424, 2.235932, 1, 1, 1, 1, 1,
1.367955, 0.5743461, 1.338442, 1, 1, 1, 1, 1,
1.374277, 0.8963044, 2.725441, 1, 1, 1, 1, 1,
1.376414, -1.523853, 1.623332, 1, 1, 1, 1, 1,
1.377324, -0.006184467, 2.391822, 1, 1, 1, 1, 1,
1.392072, -1.424214, 1.90615, 1, 1, 1, 1, 1,
1.397275, 0.2577758, -0.0866866, 1, 1, 1, 1, 1,
1.40593, 0.95605, -0.4765532, 1, 1, 1, 1, 1,
1.406816, -0.1112633, 1.380183, 1, 1, 1, 1, 1,
1.40879, 0.5055658, 0.6462078, 1, 1, 1, 1, 1,
1.414423, 0.7193601, 0.04653987, 1, 1, 1, 1, 1,
1.415516, 0.4960149, 2.874204, 0, 0, 1, 1, 1,
1.419186, 0.2213447, 0.05261786, 1, 0, 0, 1, 1,
1.431984, 0.6386861, 2.600999, 1, 0, 0, 1, 1,
1.435084, 0.6675301, -0.02054475, 1, 0, 0, 1, 1,
1.443956, 0.5101191, 0.6896726, 1, 0, 0, 1, 1,
1.446954, -1.204768, 1.626092, 1, 0, 0, 1, 1,
1.448859, 1.044641, 1.280281, 0, 0, 0, 1, 1,
1.452193, 0.6686895, 0.5419601, 0, 0, 0, 1, 1,
1.456813, -0.8381566, 2.523712, 0, 0, 0, 1, 1,
1.464395, 2.171856, -1.094071, 0, 0, 0, 1, 1,
1.472868, 0.4566592, 1.157692, 0, 0, 0, 1, 1,
1.473665, 0.5931329, 2.428536, 0, 0, 0, 1, 1,
1.497009, -0.4684669, 0.759243, 0, 0, 0, 1, 1,
1.513043, 0.7103928, 0.9597267, 1, 1, 1, 1, 1,
1.517952, -0.6016783, 1.289467, 1, 1, 1, 1, 1,
1.52028, 0.1929759, 0.972567, 1, 1, 1, 1, 1,
1.529609, 0.1078671, -0.4019195, 1, 1, 1, 1, 1,
1.533393, 0.2164885, 2.191417, 1, 1, 1, 1, 1,
1.536626, 1.233316, 0.04263119, 1, 1, 1, 1, 1,
1.541921, 0.9839019, 0.8254088, 1, 1, 1, 1, 1,
1.555037, 1.118688, 1.393064, 1, 1, 1, 1, 1,
1.555537, 0.7103961, -0.472391, 1, 1, 1, 1, 1,
1.556592, -0.7808632, 2.641835, 1, 1, 1, 1, 1,
1.571263, 0.1952191, 2.569638, 1, 1, 1, 1, 1,
1.58617, -0.2728451, -0.04618065, 1, 1, 1, 1, 1,
1.600017, 0.4782136, 1.037434, 1, 1, 1, 1, 1,
1.603172, 1.713908, 0.9714564, 1, 1, 1, 1, 1,
1.603578, -1.943435, 2.719266, 1, 1, 1, 1, 1,
1.620294, -1.394147, 2.829481, 0, 0, 1, 1, 1,
1.65072, -1.207363, 1.921192, 1, 0, 0, 1, 1,
1.671201, -0.01311209, 0.02912207, 1, 0, 0, 1, 1,
1.676456, 1.761624, -0.9438731, 1, 0, 0, 1, 1,
1.698909, 0.2925678, 1.87806, 1, 0, 0, 1, 1,
1.701983, 1.861289, 1.174491, 1, 0, 0, 1, 1,
1.704296, -1.101084, 0.8891435, 0, 0, 0, 1, 1,
1.705669, -0.02677425, 1.299793, 0, 0, 0, 1, 1,
1.721026, -1.83129, 0.9311568, 0, 0, 0, 1, 1,
1.724841, 0.2261005, 1.188576, 0, 0, 0, 1, 1,
1.742561, 1.391945, 0.5620788, 0, 0, 0, 1, 1,
1.761445, -1.262276, 2.383291, 0, 0, 0, 1, 1,
1.771877, 0.8039103, 1.716217, 0, 0, 0, 1, 1,
1.804597, 0.1385873, 2.715469, 1, 1, 1, 1, 1,
1.805236, -0.6001785, 1.21613, 1, 1, 1, 1, 1,
1.806655, 1.38782, -1.351699, 1, 1, 1, 1, 1,
1.83579, -0.6680237, 0.8326985, 1, 1, 1, 1, 1,
1.839668, -0.6175344, 2.39716, 1, 1, 1, 1, 1,
1.85955, 0.009860463, 1.652363, 1, 1, 1, 1, 1,
1.891419, 1.295989, 1.443808, 1, 1, 1, 1, 1,
1.901533, 1.582755, -0.1084476, 1, 1, 1, 1, 1,
1.955781, 0.6436279, 4.012246, 1, 1, 1, 1, 1,
1.957397, -0.7229975, 2.342944, 1, 1, 1, 1, 1,
1.964336, -0.08146863, 1.274955, 1, 1, 1, 1, 1,
1.964552, 0.3407079, 1.162434, 1, 1, 1, 1, 1,
2.00258, 0.7360147, -0.07722167, 1, 1, 1, 1, 1,
2.039152, -0.8506019, 1.630954, 1, 1, 1, 1, 1,
2.060632, -0.03136837, 2.45024, 1, 1, 1, 1, 1,
2.066963, 1.796232, 0.7082691, 0, 0, 1, 1, 1,
2.079489, 0.227854, 0.9872755, 1, 0, 0, 1, 1,
2.095831, -0.0322649, 0.4958608, 1, 0, 0, 1, 1,
2.153534, -0.04261014, 2.620468, 1, 0, 0, 1, 1,
2.168916, 0.5567257, -0.2281085, 1, 0, 0, 1, 1,
2.171251, -0.3151746, 1.421301, 1, 0, 0, 1, 1,
2.196314, 1.172673, 0.8539832, 0, 0, 0, 1, 1,
2.199741, -0.6219584, 2.074063, 0, 0, 0, 1, 1,
2.201164, 0.1294792, 1.390611, 0, 0, 0, 1, 1,
2.226498, -0.6284705, 1.286113, 0, 0, 0, 1, 1,
2.259682, 1.957093, 2.175569, 0, 0, 0, 1, 1,
2.26365, -0.09815741, 2.21769, 0, 0, 0, 1, 1,
2.282746, -0.2083725, -0.08312184, 0, 0, 0, 1, 1,
2.350589, 1.119056, -0.3686829, 1, 1, 1, 1, 1,
2.387736, -0.1325818, 1.03854, 1, 1, 1, 1, 1,
2.425288, 1.137696, 0.6213163, 1, 1, 1, 1, 1,
2.69012, 0.1417385, 1.17212, 1, 1, 1, 1, 1,
2.727858, 1.856372, 2.235671, 1, 1, 1, 1, 1,
2.756176, -0.2257579, 2.313959, 1, 1, 1, 1, 1,
3.357807, 2.04452, 1.850103, 1, 1, 1, 1, 1
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
var radius = 10.04578;
var distance = 35.28537;
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
mvMatrix.translate( 0.06721115, 0.5237482, 0.3498278 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.28537);
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