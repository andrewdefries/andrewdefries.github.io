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
-2.826596, -0.4148731, -3.586417, 1, 0, 0, 1,
-2.664034, -1.408119, -2.076619, 1, 0.007843138, 0, 1,
-2.484406, -0.6661308, -1.314585, 1, 0.01176471, 0, 1,
-2.405901, 1.011905, -1.855142, 1, 0.01960784, 0, 1,
-2.405846, -0.5514159, -1.291143, 1, 0.02352941, 0, 1,
-2.266609, -0.05241621, -0.1135286, 1, 0.03137255, 0, 1,
-2.199386, -0.5612864, -0.9021454, 1, 0.03529412, 0, 1,
-2.114593, 0.8440127, 0.1814733, 1, 0.04313726, 0, 1,
-2.10078, 0.5514949, -1.989249, 1, 0.04705882, 0, 1,
-2.086698, -0.7802128, -2.030621, 1, 0.05490196, 0, 1,
-2.085117, -0.4071753, -1.483928, 1, 0.05882353, 0, 1,
-2.08011, 0.3567852, -1.283012, 1, 0.06666667, 0, 1,
-2.079345, -1.97133, -3.276527, 1, 0.07058824, 0, 1,
-2.040887, 1.381563, 0.001814993, 1, 0.07843138, 0, 1,
-2.010723, -0.4907277, -2.426961, 1, 0.08235294, 0, 1,
-2.00236, -2.931007, -3.444685, 1, 0.09019608, 0, 1,
-1.972129, 0.1657458, -0.4383649, 1, 0.09411765, 0, 1,
-1.92661, 1.324308, -3.536498, 1, 0.1019608, 0, 1,
-1.906979, 0.2964819, -2.368115, 1, 0.1098039, 0, 1,
-1.898967, 1.532231, -0.7106463, 1, 0.1137255, 0, 1,
-1.884883, 1.643014, -1.828465, 1, 0.1215686, 0, 1,
-1.866233, 0.9227667, -1.869199, 1, 0.1254902, 0, 1,
-1.860833, 1.214117, -2.010134, 1, 0.1333333, 0, 1,
-1.848717, -0.1894777, -2.016787, 1, 0.1372549, 0, 1,
-1.848031, -0.6159297, -1.773026, 1, 0.145098, 0, 1,
-1.842076, 0.6988675, -1.258596, 1, 0.1490196, 0, 1,
-1.839837, -0.9294208, -1.110932, 1, 0.1568628, 0, 1,
-1.836607, 0.9066414, -2.031369, 1, 0.1607843, 0, 1,
-1.831033, -0.8017663, -2.913163, 1, 0.1686275, 0, 1,
-1.823419, -0.5465084, -2.288881, 1, 0.172549, 0, 1,
-1.818314, -1.246826, -0.3429911, 1, 0.1803922, 0, 1,
-1.80516, 1.840402, -1.770129, 1, 0.1843137, 0, 1,
-1.801761, 1.213603, -0.3075034, 1, 0.1921569, 0, 1,
-1.784274, 0.4517387, -2.105266, 1, 0.1960784, 0, 1,
-1.783639, -0.9283384, -2.342713, 1, 0.2039216, 0, 1,
-1.778708, 0.1896113, -2.593957, 1, 0.2117647, 0, 1,
-1.773219, -0.1742876, -2.047341, 1, 0.2156863, 0, 1,
-1.743176, -0.2723156, -3.515519, 1, 0.2235294, 0, 1,
-1.710561, -1.354179, -3.207308, 1, 0.227451, 0, 1,
-1.692111, 1.021532, -1.858296, 1, 0.2352941, 0, 1,
-1.688207, -1.769619, -0.4603632, 1, 0.2392157, 0, 1,
-1.675512, -2.276172, -5.161541, 1, 0.2470588, 0, 1,
-1.658294, -0.472924, -3.472352, 1, 0.2509804, 0, 1,
-1.621078, -0.5787066, -1.134922, 1, 0.2588235, 0, 1,
-1.616361, -1.460783, -2.443973, 1, 0.2627451, 0, 1,
-1.603118, -0.4400428, -3.788623, 1, 0.2705882, 0, 1,
-1.595317, -0.2679422, -2.727615, 1, 0.2745098, 0, 1,
-1.593017, -1.171189, -2.917898, 1, 0.282353, 0, 1,
-1.591481, 0.8183633, -0.8914077, 1, 0.2862745, 0, 1,
-1.580694, -1.902972, -1.18772, 1, 0.2941177, 0, 1,
-1.57758, -2.23453, -1.908188, 1, 0.3019608, 0, 1,
-1.566712, -0.1438736, -1.011255, 1, 0.3058824, 0, 1,
-1.56633, 1.052465, -0.9445586, 1, 0.3137255, 0, 1,
-1.564585, 0.06155283, -1.66903, 1, 0.3176471, 0, 1,
-1.562064, 0.8814657, 0.01788776, 1, 0.3254902, 0, 1,
-1.559451, -0.1033934, -2.799702, 1, 0.3294118, 0, 1,
-1.557039, -0.9273604, -2.391284, 1, 0.3372549, 0, 1,
-1.551203, -0.6972673, -1.40377, 1, 0.3411765, 0, 1,
-1.549239, -0.3824139, -0.5620902, 1, 0.3490196, 0, 1,
-1.531458, 0.01596536, -1.295597, 1, 0.3529412, 0, 1,
-1.531072, -1.047359, -2.596838, 1, 0.3607843, 0, 1,
-1.524843, 0.0007593413, -3.590173, 1, 0.3647059, 0, 1,
-1.522359, -0.1732546, -1.173684, 1, 0.372549, 0, 1,
-1.517814, 0.148475, -1.485608, 1, 0.3764706, 0, 1,
-1.505459, -0.437831, -1.659625, 1, 0.3843137, 0, 1,
-1.498966, 1.126464, 0.6543984, 1, 0.3882353, 0, 1,
-1.483097, 0.1605678, -2.096674, 1, 0.3960784, 0, 1,
-1.471249, 0.2538349, -1.518691, 1, 0.4039216, 0, 1,
-1.467866, -0.5172565, -1.316216, 1, 0.4078431, 0, 1,
-1.466345, -1.112295, -2.244819, 1, 0.4156863, 0, 1,
-1.461177, -0.4745967, -2.944644, 1, 0.4196078, 0, 1,
-1.458991, -0.9835543, -0.7835507, 1, 0.427451, 0, 1,
-1.456182, -1.078734, -0.03070214, 1, 0.4313726, 0, 1,
-1.438985, 0.04539923, -2.11302, 1, 0.4392157, 0, 1,
-1.428058, 0.07051601, -1.217414, 1, 0.4431373, 0, 1,
-1.42111, -0.01169458, -2.273587, 1, 0.4509804, 0, 1,
-1.420699, -1.382666, -1.400061, 1, 0.454902, 0, 1,
-1.417739, 0.08584882, -1.533775, 1, 0.4627451, 0, 1,
-1.412317, 1.69593, -1.263381, 1, 0.4666667, 0, 1,
-1.407745, 0.6371108, -0.7081709, 1, 0.4745098, 0, 1,
-1.395872, 1.968513, -1.481631, 1, 0.4784314, 0, 1,
-1.384527, 0.5531405, -0.03178138, 1, 0.4862745, 0, 1,
-1.375579, -1.346698, -1.978162, 1, 0.4901961, 0, 1,
-1.344441, 0.2377547, -2.586106, 1, 0.4980392, 0, 1,
-1.344114, -1.009956, -3.632487, 1, 0.5058824, 0, 1,
-1.342397, 0.332003, -2.124871, 1, 0.509804, 0, 1,
-1.33824, -1.262198, -1.679482, 1, 0.5176471, 0, 1,
-1.332368, 0.5410635, -1.41169, 1, 0.5215687, 0, 1,
-1.331466, 1.565022, -2.871825, 1, 0.5294118, 0, 1,
-1.320714, -0.1087005, -1.871014, 1, 0.5333334, 0, 1,
-1.316405, -0.6293495, -2.124198, 1, 0.5411765, 0, 1,
-1.308715, 1.236726, -0.2516921, 1, 0.5450981, 0, 1,
-1.297136, 1.589993, -0.9875579, 1, 0.5529412, 0, 1,
-1.281964, 1.492559, -0.4110242, 1, 0.5568628, 0, 1,
-1.278486, -0.4586824, -0.2196273, 1, 0.5647059, 0, 1,
-1.276932, -0.03607671, -2.021002, 1, 0.5686275, 0, 1,
-1.259393, -0.3980354, -2.843462, 1, 0.5764706, 0, 1,
-1.245325, -1.985238, -2.82464, 1, 0.5803922, 0, 1,
-1.243166, -2.105568, -1.412168, 1, 0.5882353, 0, 1,
-1.236344, -0.5211251, -1.515171, 1, 0.5921569, 0, 1,
-1.227575, 0.9175205, -0.06671043, 1, 0.6, 0, 1,
-1.218487, 0.8001015, -0.6223229, 1, 0.6078432, 0, 1,
-1.212598, -0.4687546, -1.206005, 1, 0.6117647, 0, 1,
-1.211649, -0.1607781, -1.704074, 1, 0.6196079, 0, 1,
-1.199791, 0.8233992, -1.157483, 1, 0.6235294, 0, 1,
-1.186047, -1.611033, -1.150851, 1, 0.6313726, 0, 1,
-1.177832, -0.1315622, -2.042824, 1, 0.6352941, 0, 1,
-1.17441, -0.1869478, 0.3417762, 1, 0.6431373, 0, 1,
-1.165257, -1.206534, -1.67172, 1, 0.6470588, 0, 1,
-1.164449, 2.114469, -1.110522, 1, 0.654902, 0, 1,
-1.162971, 0.2313343, -0.1512086, 1, 0.6588235, 0, 1,
-1.159343, -1.139839, -4.647087, 1, 0.6666667, 0, 1,
-1.158826, 0.5522259, -0.4108224, 1, 0.6705883, 0, 1,
-1.156865, -0.9771422, -2.582414, 1, 0.6784314, 0, 1,
-1.154792, -0.7163932, -2.012434, 1, 0.682353, 0, 1,
-1.153562, -0.157218, -2.801282, 1, 0.6901961, 0, 1,
-1.136169, -1.208829, -2.875272, 1, 0.6941177, 0, 1,
-1.130484, 0.07097215, -0.2630825, 1, 0.7019608, 0, 1,
-1.130429, 0.7406203, -1.731675, 1, 0.7098039, 0, 1,
-1.121353, 0.3045852, -2.023023, 1, 0.7137255, 0, 1,
-1.115271, 1.347292, -0.3704255, 1, 0.7215686, 0, 1,
-1.114244, -0.2692339, -1.975525, 1, 0.7254902, 0, 1,
-1.110829, 1.077677, -1.106771, 1, 0.7333333, 0, 1,
-1.094981, 0.004273403, -1.536221, 1, 0.7372549, 0, 1,
-1.092986, -0.9613928, -2.820225, 1, 0.7450981, 0, 1,
-1.092834, -1.399275, -2.63258, 1, 0.7490196, 0, 1,
-1.091987, 0.283115, -1.222983, 1, 0.7568628, 0, 1,
-1.091741, 0.6584607, 0.7817212, 1, 0.7607843, 0, 1,
-1.081803, 0.3654387, -0.6767001, 1, 0.7686275, 0, 1,
-1.080256, 1.130464, -0.5130878, 1, 0.772549, 0, 1,
-1.079876, 0.7594284, -1.631961, 1, 0.7803922, 0, 1,
-1.078843, 0.2975855, 0.03474564, 1, 0.7843137, 0, 1,
-1.07884, -0.6985404, -4.386358, 1, 0.7921569, 0, 1,
-1.077325, -0.3648798, -1.702094, 1, 0.7960784, 0, 1,
-1.073983, -0.02545477, -3.105292, 1, 0.8039216, 0, 1,
-1.070646, 0.4758618, -3.18043, 1, 0.8117647, 0, 1,
-1.069625, 2.010612, 0.2194931, 1, 0.8156863, 0, 1,
-1.067417, -0.03340824, -0.6419212, 1, 0.8235294, 0, 1,
-1.065625, -1.202712, -4.737743, 1, 0.827451, 0, 1,
-1.065021, -0.1088738, -2.146677, 1, 0.8352941, 0, 1,
-1.061592, 0.1316285, -2.123674, 1, 0.8392157, 0, 1,
-1.057084, -0.7627031, -1.419355, 1, 0.8470588, 0, 1,
-1.055817, 1.411298, 0.1452526, 1, 0.8509804, 0, 1,
-1.054306, 1.257312, 0.5369076, 1, 0.8588235, 0, 1,
-1.05228, 1.729885, 0.1713932, 1, 0.8627451, 0, 1,
-1.052124, -1.300287, -2.833861, 1, 0.8705882, 0, 1,
-1.050645, 1.139536, 0.6272998, 1, 0.8745098, 0, 1,
-1.046699, -0.3125859, -1.90626, 1, 0.8823529, 0, 1,
-1.04598, -1.206952, -2.088756, 1, 0.8862745, 0, 1,
-1.044394, 0.2285803, -2.84047, 1, 0.8941177, 0, 1,
-1.043291, -0.3183794, -1.562468, 1, 0.8980392, 0, 1,
-1.040155, 0.206179, -2.824069, 1, 0.9058824, 0, 1,
-1.040046, -1.523912, -3.583721, 1, 0.9137255, 0, 1,
-1.033343, 0.8520024, -3.980951, 1, 0.9176471, 0, 1,
-1.033047, 0.9924732, -1.495603, 1, 0.9254902, 0, 1,
-1.028147, -0.564954, -1.863898, 1, 0.9294118, 0, 1,
-1.024963, -0.5337704, -2.77267, 1, 0.9372549, 0, 1,
-1.022113, 0.4170249, -0.8630196, 1, 0.9411765, 0, 1,
-1.018687, 0.3640214, -2.341392, 1, 0.9490196, 0, 1,
-1.013732, -0.05331202, -2.122406, 1, 0.9529412, 0, 1,
-1.009312, 1.288045, 1.060462, 1, 0.9607843, 0, 1,
-0.9982626, 0.2831796, -0.1330405, 1, 0.9647059, 0, 1,
-0.9868055, 1.128521, -0.8665853, 1, 0.972549, 0, 1,
-0.9759532, -0.817284, -4.090446, 1, 0.9764706, 0, 1,
-0.9696352, 1.389252, -0.7914801, 1, 0.9843137, 0, 1,
-0.9676072, 0.8084294, -0.4763244, 1, 0.9882353, 0, 1,
-0.9668033, 0.4816626, 0.008194827, 1, 0.9960784, 0, 1,
-0.9622484, -0.6313974, -2.514697, 0.9960784, 1, 0, 1,
-0.9576895, -0.6283257, -1.660256, 0.9921569, 1, 0, 1,
-0.954149, 0.8487028, -0.2703255, 0.9843137, 1, 0, 1,
-0.9404662, 0.613964, -1.720412, 0.9803922, 1, 0, 1,
-0.9367976, -0.9856207, 0.3444488, 0.972549, 1, 0, 1,
-0.9257225, -0.4726029, -1.300436, 0.9686275, 1, 0, 1,
-0.9193807, -0.2097852, 1.181136, 0.9607843, 1, 0, 1,
-0.9101644, 0.1188313, -0.4114638, 0.9568627, 1, 0, 1,
-0.9091934, -0.5042552, -0.5877429, 0.9490196, 1, 0, 1,
-0.9040319, -0.6641371, -3.510302, 0.945098, 1, 0, 1,
-0.8990025, -0.7746548, -1.857185, 0.9372549, 1, 0, 1,
-0.8974301, 1.074473, -1.498459, 0.9333333, 1, 0, 1,
-0.8954848, 0.4470581, -1.768523, 0.9254902, 1, 0, 1,
-0.8942284, 1.074694, -0.9951512, 0.9215686, 1, 0, 1,
-0.8912904, 0.6251833, -1.573818, 0.9137255, 1, 0, 1,
-0.8870282, 2.026034, -0.8821996, 0.9098039, 1, 0, 1,
-0.8851407, -0.6327341, -1.742687, 0.9019608, 1, 0, 1,
-0.8717899, -2.054011, -2.912021, 0.8941177, 1, 0, 1,
-0.8703733, 0.668237, -1.536708, 0.8901961, 1, 0, 1,
-0.8694587, 1.624443, -0.7827271, 0.8823529, 1, 0, 1,
-0.8679508, -1.38504, -2.115134, 0.8784314, 1, 0, 1,
-0.8650265, -0.4519552, -2.114206, 0.8705882, 1, 0, 1,
-0.8610013, -1.888734, -3.468096, 0.8666667, 1, 0, 1,
-0.8595046, -0.8619338, -0.6397219, 0.8588235, 1, 0, 1,
-0.8591042, 0.5354783, -3.131782, 0.854902, 1, 0, 1,
-0.8551831, 1.286911, -1.475669, 0.8470588, 1, 0, 1,
-0.8445777, -0.4943714, -3.191704, 0.8431373, 1, 0, 1,
-0.8369146, 0.06911872, -1.542561, 0.8352941, 1, 0, 1,
-0.8333104, 0.3275326, -2.616988, 0.8313726, 1, 0, 1,
-0.8326758, 1.100431, -0.9583216, 0.8235294, 1, 0, 1,
-0.8273708, -1.540716, -2.381708, 0.8196079, 1, 0, 1,
-0.8272038, 0.7611938, -1.611642, 0.8117647, 1, 0, 1,
-0.8224427, 0.696036, -2.444487, 0.8078431, 1, 0, 1,
-0.8205072, 0.05101041, -1.755993, 0.8, 1, 0, 1,
-0.8201405, -0.6355589, -1.96047, 0.7921569, 1, 0, 1,
-0.8149498, 0.3368882, -1.869314, 0.7882353, 1, 0, 1,
-0.8083701, -0.6166446, -1.939966, 0.7803922, 1, 0, 1,
-0.8075055, 0.2917767, -0.1454992, 0.7764706, 1, 0, 1,
-0.8058377, 1.044703, -0.1906814, 0.7686275, 1, 0, 1,
-0.8053523, 0.2199063, 1.590945, 0.7647059, 1, 0, 1,
-0.8005878, 1.660169, -1.811808, 0.7568628, 1, 0, 1,
-0.7990118, -0.7493345, 0.01142287, 0.7529412, 1, 0, 1,
-0.7978426, 0.2641845, -2.894258, 0.7450981, 1, 0, 1,
-0.7906312, 0.9700096, -1.083626, 0.7411765, 1, 0, 1,
-0.7880321, -0.94887, -2.868956, 0.7333333, 1, 0, 1,
-0.7822009, -0.7883371, -3.80545, 0.7294118, 1, 0, 1,
-0.7761535, -1.406666, -2.044274, 0.7215686, 1, 0, 1,
-0.7743418, -1.224077, -0.5016115, 0.7176471, 1, 0, 1,
-0.7736861, -1.082014, -1.914952, 0.7098039, 1, 0, 1,
-0.7705314, 2.23216, -0.4558187, 0.7058824, 1, 0, 1,
-0.7607139, 0.4121093, -1.608048, 0.6980392, 1, 0, 1,
-0.7583084, -0.08633231, -2.757894, 0.6901961, 1, 0, 1,
-0.7560971, -0.4971566, -2.181996, 0.6862745, 1, 0, 1,
-0.7527448, 0.5272714, -0.9609234, 0.6784314, 1, 0, 1,
-0.7515449, -0.5649185, -2.514802, 0.6745098, 1, 0, 1,
-0.744593, 0.7297595, 0.3994322, 0.6666667, 1, 0, 1,
-0.7426409, -1.6301, -1.689864, 0.6627451, 1, 0, 1,
-0.7255112, 0.1364196, -0.3114001, 0.654902, 1, 0, 1,
-0.7253925, 0.7233842, -1.863696, 0.6509804, 1, 0, 1,
-0.7108474, -0.45359, -1.248214, 0.6431373, 1, 0, 1,
-0.7084382, -1.125751, -3.019255, 0.6392157, 1, 0, 1,
-0.6997729, 1.469857, 0.5434775, 0.6313726, 1, 0, 1,
-0.6981281, 0.4613495, -1.096951, 0.627451, 1, 0, 1,
-0.6951972, -0.1851854, -2.329747, 0.6196079, 1, 0, 1,
-0.689912, 1.06523, 1.376418, 0.6156863, 1, 0, 1,
-0.6879638, 0.9709281, -0.8773271, 0.6078432, 1, 0, 1,
-0.6859376, -0.7810999, -1.663939, 0.6039216, 1, 0, 1,
-0.6822558, 0.03435669, -0.6959689, 0.5960785, 1, 0, 1,
-0.6772197, 0.7252811, 0.1680207, 0.5882353, 1, 0, 1,
-0.6741819, 1.987846, -1.238329, 0.5843138, 1, 0, 1,
-0.673883, 1.951267, 1.680949, 0.5764706, 1, 0, 1,
-0.6710021, -1.133023, -1.908552, 0.572549, 1, 0, 1,
-0.6679363, -1.683329, -4.189925, 0.5647059, 1, 0, 1,
-0.6659984, 0.07198954, 0.2737885, 0.5607843, 1, 0, 1,
-0.6649154, 0.02862617, -0.5209875, 0.5529412, 1, 0, 1,
-0.6641532, -0.7463812, -4.087966, 0.5490196, 1, 0, 1,
-0.6638891, 1.385582, 1.246648, 0.5411765, 1, 0, 1,
-0.6633263, 0.3583299, -1.106651, 0.5372549, 1, 0, 1,
-0.6625695, -1.191793, -2.428518, 0.5294118, 1, 0, 1,
-0.6624838, 2.438746, -0.7401016, 0.5254902, 1, 0, 1,
-0.6617374, -0.5889047, -2.428445, 0.5176471, 1, 0, 1,
-0.6586046, 0.833298, -1.658762, 0.5137255, 1, 0, 1,
-0.6504722, -0.7965733, -2.250553, 0.5058824, 1, 0, 1,
-0.6495671, -0.5824419, -3.084691, 0.5019608, 1, 0, 1,
-0.6494886, 0.4156531, -1.264115, 0.4941176, 1, 0, 1,
-0.6493412, 0.2574284, -1.208392, 0.4862745, 1, 0, 1,
-0.6480317, -0.6520812, -1.760367, 0.4823529, 1, 0, 1,
-0.6472304, 0.8068323, 1.053618, 0.4745098, 1, 0, 1,
-0.6468553, 0.1123791, -0.4628884, 0.4705882, 1, 0, 1,
-0.6427093, 0.8467959, -1.611021, 0.4627451, 1, 0, 1,
-0.6420152, -1.568781, -2.372276, 0.4588235, 1, 0, 1,
-0.6408971, 1.149734, -0.1813308, 0.4509804, 1, 0, 1,
-0.6407993, 2.19717, -3.047642, 0.4470588, 1, 0, 1,
-0.6387566, 1.304963, -1.721957, 0.4392157, 1, 0, 1,
-0.6376486, 1.885302, -1.180317, 0.4352941, 1, 0, 1,
-0.6357237, -0.7014676, -3.217983, 0.427451, 1, 0, 1,
-0.6344868, 1.308527, -0.9997944, 0.4235294, 1, 0, 1,
-0.6340898, -0.2866883, -1.267313, 0.4156863, 1, 0, 1,
-0.633996, -0.3403451, -2.49512, 0.4117647, 1, 0, 1,
-0.6293215, 0.1798836, -2.399713, 0.4039216, 1, 0, 1,
-0.6283858, -1.194322, -2.285208, 0.3960784, 1, 0, 1,
-0.6261932, -0.0446069, -2.576801, 0.3921569, 1, 0, 1,
-0.6255044, -0.960996, -3.857317, 0.3843137, 1, 0, 1,
-0.6254511, 1.207449, -0.8487054, 0.3803922, 1, 0, 1,
-0.6246703, -0.6876212, -1.333206, 0.372549, 1, 0, 1,
-0.6231055, 0.1070946, -0.1076128, 0.3686275, 1, 0, 1,
-0.622447, 1.243993, -0.7036708, 0.3607843, 1, 0, 1,
-0.6222756, 0.8832667, -0.1085895, 0.3568628, 1, 0, 1,
-0.6117265, 0.4172003, -1.04471, 0.3490196, 1, 0, 1,
-0.6088947, -0.3813201, -2.06314, 0.345098, 1, 0, 1,
-0.6065626, -0.6474956, -3.540191, 0.3372549, 1, 0, 1,
-0.5991116, 1.263593, -0.6289001, 0.3333333, 1, 0, 1,
-0.5981479, 0.04453304, -2.368972, 0.3254902, 1, 0, 1,
-0.5959711, 1.353544, -0.2808062, 0.3215686, 1, 0, 1,
-0.5943912, 0.4398782, -1.832955, 0.3137255, 1, 0, 1,
-0.5922069, 0.7898113, -1.408418, 0.3098039, 1, 0, 1,
-0.5882045, -0.551805, -2.01408, 0.3019608, 1, 0, 1,
-0.5821488, 1.477387, 0.09885681, 0.2941177, 1, 0, 1,
-0.5787445, 2.697236, -3.340961, 0.2901961, 1, 0, 1,
-0.5765456, 2.369441, -2.071517, 0.282353, 1, 0, 1,
-0.5746368, 0.8367491, -0.6878692, 0.2784314, 1, 0, 1,
-0.5691463, 0.07499003, -2.495361, 0.2705882, 1, 0, 1,
-0.5628881, -0.2952869, -2.510539, 0.2666667, 1, 0, 1,
-0.554754, 1.520731, -0.06945525, 0.2588235, 1, 0, 1,
-0.5462161, -0.6542256, -4.368824, 0.254902, 1, 0, 1,
-0.5443623, 0.6019987, 0.1259712, 0.2470588, 1, 0, 1,
-0.5439227, 0.8220347, -0.008360928, 0.2431373, 1, 0, 1,
-0.5413837, -1.284597, -2.482167, 0.2352941, 1, 0, 1,
-0.5413346, 1.800601, -1.452883, 0.2313726, 1, 0, 1,
-0.5391069, 0.4752302, -0.5858113, 0.2235294, 1, 0, 1,
-0.5389262, 0.2607281, 0.08734271, 0.2196078, 1, 0, 1,
-0.5367215, -1.589869, -2.173244, 0.2117647, 1, 0, 1,
-0.5329135, -1.172639, -3.845369, 0.2078431, 1, 0, 1,
-0.5294893, 1.235531, 0.3912059, 0.2, 1, 0, 1,
-0.5194013, 0.005532782, -2.349771, 0.1921569, 1, 0, 1,
-0.5180982, -0.9320379, -2.884417, 0.1882353, 1, 0, 1,
-0.5138035, 0.4411321, -0.9175154, 0.1803922, 1, 0, 1,
-0.508906, -1.309653, -3.13504, 0.1764706, 1, 0, 1,
-0.508808, 1.128334, 0.1414482, 0.1686275, 1, 0, 1,
-0.5056767, -0.3871419, -3.648831, 0.1647059, 1, 0, 1,
-0.501015, 0.6442515, -0.6848705, 0.1568628, 1, 0, 1,
-0.4933651, 0.1692712, -0.5825557, 0.1529412, 1, 0, 1,
-0.4891574, -0.851075, -4.152059, 0.145098, 1, 0, 1,
-0.4861925, 0.9769375, -0.731774, 0.1411765, 1, 0, 1,
-0.4814929, 0.5775623, -1.156975, 0.1333333, 1, 0, 1,
-0.4802596, -0.21357, -2.817259, 0.1294118, 1, 0, 1,
-0.4774278, -0.36234, -2.593251, 0.1215686, 1, 0, 1,
-0.4755483, -0.2340149, -1.116876, 0.1176471, 1, 0, 1,
-0.4724875, -0.4402391, -2.396499, 0.1098039, 1, 0, 1,
-0.4716071, -0.9691268, -2.407997, 0.1058824, 1, 0, 1,
-0.4658273, 0.5210421, -1.391786, 0.09803922, 1, 0, 1,
-0.4611068, 0.6551126, 0.5563866, 0.09019608, 1, 0, 1,
-0.4592601, 0.9556495, 0.0438327, 0.08627451, 1, 0, 1,
-0.4580984, 1.259232, -1.329267, 0.07843138, 1, 0, 1,
-0.457735, 0.4409783, -2.351661, 0.07450981, 1, 0, 1,
-0.4536748, 0.6188512, -0.2530299, 0.06666667, 1, 0, 1,
-0.4510404, 0.3909332, -0.5208597, 0.0627451, 1, 0, 1,
-0.4479499, 1.440766, 0.5609722, 0.05490196, 1, 0, 1,
-0.4477855, 1.921952, 0.6832868, 0.05098039, 1, 0, 1,
-0.4470384, -0.4575213, -1.000336, 0.04313726, 1, 0, 1,
-0.4462309, -1.015497, -1.885676, 0.03921569, 1, 0, 1,
-0.4425808, 0.3551684, -0.1233616, 0.03137255, 1, 0, 1,
-0.442504, 1.241267, -1.126201, 0.02745098, 1, 0, 1,
-0.4398313, 0.8721972, 0.6310225, 0.01960784, 1, 0, 1,
-0.4383866, -0.5125256, -2.077758, 0.01568628, 1, 0, 1,
-0.4356608, 1.803939, -0.03699873, 0.007843138, 1, 0, 1,
-0.431706, -1.38364, -2.929967, 0.003921569, 1, 0, 1,
-0.4284507, -0.09959983, -2.782616, 0, 1, 0.003921569, 1,
-0.4274063, 1.050814, 1.210818, 0, 1, 0.01176471, 1,
-0.4240476, -0.2529289, -3.661296, 0, 1, 0.01568628, 1,
-0.4221282, -3.462388, -4.127064, 0, 1, 0.02352941, 1,
-0.4217199, 0.7201571, -1.038042, 0, 1, 0.02745098, 1,
-0.4190586, -0.2192509, -1.846291, 0, 1, 0.03529412, 1,
-0.4172062, -0.7798874, -2.808406, 0, 1, 0.03921569, 1,
-0.4152187, -0.1021177, -0.8232468, 0, 1, 0.04705882, 1,
-0.4144791, 0.03150797, -1.395768, 0, 1, 0.05098039, 1,
-0.4143296, -1.068344, -2.542761, 0, 1, 0.05882353, 1,
-0.4122263, -1.797312, -3.578809, 0, 1, 0.0627451, 1,
-0.4100911, -1.046208, -3.472941, 0, 1, 0.07058824, 1,
-0.4037887, 0.06219783, -2.22257, 0, 1, 0.07450981, 1,
-0.3995889, -0.6477278, -2.919608, 0, 1, 0.08235294, 1,
-0.3960643, -1.015604, -3.105702, 0, 1, 0.08627451, 1,
-0.3930775, 0.8309723, -0.04891199, 0, 1, 0.09411765, 1,
-0.3920243, 0.7362775, -0.8483899, 0, 1, 0.1019608, 1,
-0.3859991, 1.507006, -2.232852, 0, 1, 0.1058824, 1,
-0.3826487, 0.5628244, -0.2439816, 0, 1, 0.1137255, 1,
-0.3773114, -0.3125056, -1.804527, 0, 1, 0.1176471, 1,
-0.3726771, 0.05199577, -0.5881746, 0, 1, 0.1254902, 1,
-0.3685237, 1.850099, -0.6913421, 0, 1, 0.1294118, 1,
-0.3663685, -0.1157748, -0.02210644, 0, 1, 0.1372549, 1,
-0.3616292, -0.7148605, -2.422267, 0, 1, 0.1411765, 1,
-0.3558344, -0.9335629, -2.248055, 0, 1, 0.1490196, 1,
-0.3521179, 0.3409701, -1.279989, 0, 1, 0.1529412, 1,
-0.3514616, -0.8704846, -2.090558, 0, 1, 0.1607843, 1,
-0.3509118, 1.231836, 0.9086393, 0, 1, 0.1647059, 1,
-0.3496694, 0.332674, -0.7835749, 0, 1, 0.172549, 1,
-0.3454679, -1.512766, -1.808927, 0, 1, 0.1764706, 1,
-0.3394794, -0.2560834, -1.278973, 0, 1, 0.1843137, 1,
-0.3311048, 0.8415743, -2.002641, 0, 1, 0.1882353, 1,
-0.3201664, 1.174014, -0.2187768, 0, 1, 0.1960784, 1,
-0.3171285, 0.4061947, 0.7003525, 0, 1, 0.2039216, 1,
-0.3158946, 0.3411939, -0.4486662, 0, 1, 0.2078431, 1,
-0.3104601, 0.3305997, -0.05501066, 0, 1, 0.2156863, 1,
-0.3080913, -0.7438025, -2.613688, 0, 1, 0.2196078, 1,
-0.3008603, -0.6694912, -2.020301, 0, 1, 0.227451, 1,
-0.3001275, 0.06848638, -0.6805338, 0, 1, 0.2313726, 1,
-0.3000298, -0.02199914, -2.567574, 0, 1, 0.2392157, 1,
-0.2966949, 1.009344, -0.2405796, 0, 1, 0.2431373, 1,
-0.2937663, -1.099726, -2.569325, 0, 1, 0.2509804, 1,
-0.2934787, 0.5895028, 0.8886495, 0, 1, 0.254902, 1,
-0.2921751, 0.3276347, -0.684049, 0, 1, 0.2627451, 1,
-0.2877541, -1.323676, -2.50371, 0, 1, 0.2666667, 1,
-0.2869328, 0.6978458, 1.379955, 0, 1, 0.2745098, 1,
-0.2787585, -0.1079288, -2.943099, 0, 1, 0.2784314, 1,
-0.2770947, -0.6485001, -2.256129, 0, 1, 0.2862745, 1,
-0.2746635, 1.133287, -0.4783901, 0, 1, 0.2901961, 1,
-0.2727309, 0.4015501, -1.138773, 0, 1, 0.2980392, 1,
-0.2691447, 0.3109726, -2.211296, 0, 1, 0.3058824, 1,
-0.2657986, 0.3091807, -0.9609714, 0, 1, 0.3098039, 1,
-0.2632494, 1.004044, -0.3523737, 0, 1, 0.3176471, 1,
-0.2607279, 0.4622434, 0.4327096, 0, 1, 0.3215686, 1,
-0.2576013, 0.3360432, 0.7655926, 0, 1, 0.3294118, 1,
-0.256502, -0.504045, -3.692927, 0, 1, 0.3333333, 1,
-0.2457451, 0.5758182, 0.5343605, 0, 1, 0.3411765, 1,
-0.2437289, 0.1569997, -0.9742905, 0, 1, 0.345098, 1,
-0.2420093, -0.7471771, -1.526606, 0, 1, 0.3529412, 1,
-0.2412642, 0.9924327, 1.108644, 0, 1, 0.3568628, 1,
-0.2411946, 0.3665912, -1.210132, 0, 1, 0.3647059, 1,
-0.238695, 0.2769912, -3.012457, 0, 1, 0.3686275, 1,
-0.2373594, 0.1147538, 0.2300729, 0, 1, 0.3764706, 1,
-0.2306224, -0.8756884, -4.720376, 0, 1, 0.3803922, 1,
-0.2289833, -0.6553083, -3.195667, 0, 1, 0.3882353, 1,
-0.2288979, -0.7257992, -2.516341, 0, 1, 0.3921569, 1,
-0.2269895, -0.3057576, -2.150799, 0, 1, 0.4, 1,
-0.2234116, -0.8730258, -2.38641, 0, 1, 0.4078431, 1,
-0.2196116, 0.7429758, 0.747539, 0, 1, 0.4117647, 1,
-0.2191532, -0.5961385, -2.485401, 0, 1, 0.4196078, 1,
-0.2135573, 0.7204494, -2.099682, 0, 1, 0.4235294, 1,
-0.2092981, -0.05210844, -3.508144, 0, 1, 0.4313726, 1,
-0.2067947, 0.8449364, -0.6561859, 0, 1, 0.4352941, 1,
-0.2054295, -1.079089, -1.260924, 0, 1, 0.4431373, 1,
-0.2027557, 0.1305744, -3.056057, 0, 1, 0.4470588, 1,
-0.2025131, 2.294867, -0.2881793, 0, 1, 0.454902, 1,
-0.1994097, 1.186277, -0.5016383, 0, 1, 0.4588235, 1,
-0.1991901, -1.745688, -3.53749, 0, 1, 0.4666667, 1,
-0.1963011, 1.50722, 1.258049, 0, 1, 0.4705882, 1,
-0.1944574, -1.625232, -3.613624, 0, 1, 0.4784314, 1,
-0.1943568, -1.179847, -2.579997, 0, 1, 0.4823529, 1,
-0.1917168, -1.230587, -1.592892, 0, 1, 0.4901961, 1,
-0.1875455, 0.08414111, -3.789493, 0, 1, 0.4941176, 1,
-0.1874131, -0.08253365, -2.576217, 0, 1, 0.5019608, 1,
-0.1849335, 1.071885, 0.218529, 0, 1, 0.509804, 1,
-0.1809291, 0.9533842, -1.410905, 0, 1, 0.5137255, 1,
-0.1799571, -1.005951, -2.086293, 0, 1, 0.5215687, 1,
-0.1743126, 1.499394, 1.396419, 0, 1, 0.5254902, 1,
-0.1740815, 1.590812, -0.299473, 0, 1, 0.5333334, 1,
-0.1682986, -0.9692331, -2.606137, 0, 1, 0.5372549, 1,
-0.1671049, -0.9368797, -1.773546, 0, 1, 0.5450981, 1,
-0.1665715, -0.3262707, -2.644084, 0, 1, 0.5490196, 1,
-0.1638145, -2.291176, -4.653918, 0, 1, 0.5568628, 1,
-0.1632161, 0.4744489, -1.42016, 0, 1, 0.5607843, 1,
-0.1618179, 0.5681887, 1.315871, 0, 1, 0.5686275, 1,
-0.1595653, 2.359645, 1.538292, 0, 1, 0.572549, 1,
-0.1566926, -0.6977344, -2.910774, 0, 1, 0.5803922, 1,
-0.1550513, -0.8831446, -4.30017, 0, 1, 0.5843138, 1,
-0.1549649, 0.1680889, -1.034636, 0, 1, 0.5921569, 1,
-0.1536815, -0.1604968, -2.480515, 0, 1, 0.5960785, 1,
-0.151684, 1.85241, -1.620104, 0, 1, 0.6039216, 1,
-0.1502136, -0.09816817, -0.392875, 0, 1, 0.6117647, 1,
-0.1482989, 0.2387825, -0.4691489, 0, 1, 0.6156863, 1,
-0.1442889, -0.6676769, -2.992077, 0, 1, 0.6235294, 1,
-0.1390918, -1.044554, -1.830186, 0, 1, 0.627451, 1,
-0.1390502, 0.3968706, -0.660771, 0, 1, 0.6352941, 1,
-0.1381523, -2.017063, -4.943543, 0, 1, 0.6392157, 1,
-0.1371048, -0.06314966, -3.667649, 0, 1, 0.6470588, 1,
-0.1302168, -1.156928, -4.618353, 0, 1, 0.6509804, 1,
-0.1296648, -0.4885908, -1.130417, 0, 1, 0.6588235, 1,
-0.1280809, -0.5874575, -2.429281, 0, 1, 0.6627451, 1,
-0.127132, -0.8434247, -3.298024, 0, 1, 0.6705883, 1,
-0.1254498, 0.4459161, 0.2654964, 0, 1, 0.6745098, 1,
-0.1250159, 1.545991, -0.4071958, 0, 1, 0.682353, 1,
-0.1182554, 0.3994192, -0.8254623, 0, 1, 0.6862745, 1,
-0.116796, -1.738116, -3.42429, 0, 1, 0.6941177, 1,
-0.1120891, 0.8042204, -0.1158394, 0, 1, 0.7019608, 1,
-0.1086958, 0.668598, -0.5953217, 0, 1, 0.7058824, 1,
-0.1010351, -0.04285857, -2.936579, 0, 1, 0.7137255, 1,
-0.1006245, -1.713412, -1.888716, 0, 1, 0.7176471, 1,
-0.09998419, 0.6602327, -0.09206682, 0, 1, 0.7254902, 1,
-0.09420568, 0.1344684, -0.3019264, 0, 1, 0.7294118, 1,
-0.09401376, -0.7830704, -3.982337, 0, 1, 0.7372549, 1,
-0.08519369, 0.04549096, 0.01137705, 0, 1, 0.7411765, 1,
-0.07899392, -0.233561, -3.581818, 0, 1, 0.7490196, 1,
-0.07898788, -0.8102498, -2.198249, 0, 1, 0.7529412, 1,
-0.07737193, -1.390543, -1.765117, 0, 1, 0.7607843, 1,
-0.07700285, 0.7295465, 0.4007906, 0, 1, 0.7647059, 1,
-0.07539143, 0.3024822, -1.089737, 0, 1, 0.772549, 1,
-0.05962472, -1.624653, -2.346043, 0, 1, 0.7764706, 1,
-0.0580456, -0.9874512, -1.685697, 0, 1, 0.7843137, 1,
-0.0568192, -0.1536784, -3.243685, 0, 1, 0.7882353, 1,
-0.05574432, -0.5578514, -0.5073658, 0, 1, 0.7960784, 1,
-0.05510847, 2.972222, 0.6877815, 0, 1, 0.8039216, 1,
-0.05412833, 0.6041331, -0.0811708, 0, 1, 0.8078431, 1,
-0.04980092, 0.1868778, 0.5228896, 0, 1, 0.8156863, 1,
-0.04907751, -0.7530805, -2.515851, 0, 1, 0.8196079, 1,
-0.04766969, -0.1530684, -2.907502, 0, 1, 0.827451, 1,
-0.0456843, 0.2984197, 0.1612746, 0, 1, 0.8313726, 1,
-0.04390631, -0.4948922, -4.33422, 0, 1, 0.8392157, 1,
-0.04353813, -0.1162329, -4.359901, 0, 1, 0.8431373, 1,
-0.0430761, -1.732941, -3.415, 0, 1, 0.8509804, 1,
-0.03903786, 1.697382, -0.5279905, 0, 1, 0.854902, 1,
-0.03366722, -1.208127, -2.684104, 0, 1, 0.8627451, 1,
-0.02862336, 0.2611742, -0.4506207, 0, 1, 0.8666667, 1,
-0.0258267, -1.518297, -3.265491, 0, 1, 0.8745098, 1,
-0.01974368, -1.519725, -2.692448, 0, 1, 0.8784314, 1,
-0.01854657, -1.613356, -2.800489, 0, 1, 0.8862745, 1,
-0.01362353, 1.098916, -0.4582434, 0, 1, 0.8901961, 1,
-0.01119298, -1.212334, -2.584892, 0, 1, 0.8980392, 1,
-0.01007063, 0.9213723, -1.050787, 0, 1, 0.9058824, 1,
-0.009891599, 0.1924439, -0.4743031, 0, 1, 0.9098039, 1,
-0.008342118, 1.157048, -0.7029347, 0, 1, 0.9176471, 1,
-0.007213144, 0.3944092, 1.507602, 0, 1, 0.9215686, 1,
-0.000107729, 0.5745451, 0.7253028, 0, 1, 0.9294118, 1,
0.000295624, -1.026625, 4.084603, 0, 1, 0.9333333, 1,
0.011422, -1.206032, 2.251646, 0, 1, 0.9411765, 1,
0.01552503, -0.1384464, 3.419276, 0, 1, 0.945098, 1,
0.01675189, 1.024965, 0.3435232, 0, 1, 0.9529412, 1,
0.0168433, 1.327483, -0.2166634, 0, 1, 0.9568627, 1,
0.01760553, 0.1109597, 1.148909, 0, 1, 0.9647059, 1,
0.01767465, 1.385566, -1.454132, 0, 1, 0.9686275, 1,
0.01886655, 0.9480254, -0.4659674, 0, 1, 0.9764706, 1,
0.02013919, 1.339967, 0.637274, 0, 1, 0.9803922, 1,
0.02035854, -0.4172101, 3.761096, 0, 1, 0.9882353, 1,
0.02339371, 0.8968502, -0.9171471, 0, 1, 0.9921569, 1,
0.02932289, 0.4267789, 0.9423668, 0, 1, 1, 1,
0.0322809, -0.5131965, 4.424495, 0, 0.9921569, 1, 1,
0.03252055, -1.53445, 2.902621, 0, 0.9882353, 1, 1,
0.03471104, 2.15665, 1.551847, 0, 0.9803922, 1, 1,
0.04198264, 0.5431476, 0.5737, 0, 0.9764706, 1, 1,
0.04563806, -1.995721, 4.105066, 0, 0.9686275, 1, 1,
0.04602348, -0.006745874, 3.508409, 0, 0.9647059, 1, 1,
0.04860955, 0.9668413, -0.5156063, 0, 0.9568627, 1, 1,
0.05207276, 0.2367009, -0.04495335, 0, 0.9529412, 1, 1,
0.05736086, 0.5951319, -0.7014869, 0, 0.945098, 1, 1,
0.0584191, 0.690048, 1.559124, 0, 0.9411765, 1, 1,
0.06316526, -0.05037782, 2.759664, 0, 0.9333333, 1, 1,
0.06525753, -0.4903355, 3.858505, 0, 0.9294118, 1, 1,
0.06940459, -0.638019, 3.635694, 0, 0.9215686, 1, 1,
0.07097061, -0.3161399, 2.268577, 0, 0.9176471, 1, 1,
0.07098877, -0.07147455, 3.461255, 0, 0.9098039, 1, 1,
0.08282137, -0.3123909, 2.861935, 0, 0.9058824, 1, 1,
0.08505441, -0.3821324, 2.579815, 0, 0.8980392, 1, 1,
0.08648922, -0.8824067, 3.832116, 0, 0.8901961, 1, 1,
0.08791599, -0.3002985, 2.475468, 0, 0.8862745, 1, 1,
0.08813279, 0.2273339, 0.5968971, 0, 0.8784314, 1, 1,
0.08970444, 0.3359203, -0.7441551, 0, 0.8745098, 1, 1,
0.09020232, 0.06603453, 1.199635, 0, 0.8666667, 1, 1,
0.09078632, 2.469856, 0.857339, 0, 0.8627451, 1, 1,
0.09584451, -0.2683301, 3.988252, 0, 0.854902, 1, 1,
0.09745199, 0.2734476, 0.4703799, 0, 0.8509804, 1, 1,
0.1024432, -0.02913701, 0.7078269, 0, 0.8431373, 1, 1,
0.1068246, 0.631613, -0.6046567, 0, 0.8392157, 1, 1,
0.1119379, -1.3553, 1.601183, 0, 0.8313726, 1, 1,
0.1124545, 0.8755277, 0.3685683, 0, 0.827451, 1, 1,
0.1151061, -0.8415061, 1.692184, 0, 0.8196079, 1, 1,
0.1210036, 1.087597, 0.1718273, 0, 0.8156863, 1, 1,
0.1212383, -2.050649, 2.354325, 0, 0.8078431, 1, 1,
0.1282427, 0.9450448, 1.348583, 0, 0.8039216, 1, 1,
0.128826, 0.03776496, 1.656698, 0, 0.7960784, 1, 1,
0.1292759, -0.1644424, 2.152847, 0, 0.7882353, 1, 1,
0.1294326, -1.001005, 3.377302, 0, 0.7843137, 1, 1,
0.1320974, -1.857754, 0.9860636, 0, 0.7764706, 1, 1,
0.1354069, -2.04505, 2.858204, 0, 0.772549, 1, 1,
0.1397133, -0.1412649, 3.717794, 0, 0.7647059, 1, 1,
0.14, 1.425082, -0.8357237, 0, 0.7607843, 1, 1,
0.1410519, -0.1184166, 2.771339, 0, 0.7529412, 1, 1,
0.1434257, 0.8645896, 0.8263533, 0, 0.7490196, 1, 1,
0.1472661, 1.109685, -1.1675, 0, 0.7411765, 1, 1,
0.1522765, -1.21949, 4.218425, 0, 0.7372549, 1, 1,
0.1575482, -0.7768472, 2.932004, 0, 0.7294118, 1, 1,
0.1585372, 0.1477538, -1.064377, 0, 0.7254902, 1, 1,
0.1593369, -0.7430571, 4.635057, 0, 0.7176471, 1, 1,
0.1637343, -0.04056538, 2.663444, 0, 0.7137255, 1, 1,
0.1641257, -0.6426963, 1.524713, 0, 0.7058824, 1, 1,
0.1653569, 1.375645, 1.033551, 0, 0.6980392, 1, 1,
0.1658748, 0.4444633, 1.813436, 0, 0.6941177, 1, 1,
0.1666541, 0.3702943, -0.193932, 0, 0.6862745, 1, 1,
0.1693729, -1.390945, 2.431597, 0, 0.682353, 1, 1,
0.1702646, -2.50379, 3.097092, 0, 0.6745098, 1, 1,
0.1713018, 0.8383127, 0.03884555, 0, 0.6705883, 1, 1,
0.1742154, -0.2874762, 0.4021943, 0, 0.6627451, 1, 1,
0.1770095, 0.6968641, 0.3805962, 0, 0.6588235, 1, 1,
0.1785066, 0.7925736, -1.096172, 0, 0.6509804, 1, 1,
0.1804173, 0.1270146, 1.902332, 0, 0.6470588, 1, 1,
0.1814881, -0.7885501, 0.6096464, 0, 0.6392157, 1, 1,
0.1817877, -0.4685112, 2.308978, 0, 0.6352941, 1, 1,
0.1838106, 0.1416786, -0.0929224, 0, 0.627451, 1, 1,
0.1868644, -0.4795601, 3.799303, 0, 0.6235294, 1, 1,
0.1872547, 0.3410974, 1.583927, 0, 0.6156863, 1, 1,
0.187367, -0.3369971, 2.241936, 0, 0.6117647, 1, 1,
0.1889212, 2.081279, -0.8022202, 0, 0.6039216, 1, 1,
0.1906894, 1.757127, 0.4437008, 0, 0.5960785, 1, 1,
0.1952787, -0.2384687, 2.034153, 0, 0.5921569, 1, 1,
0.2019366, -0.108385, 3.157522, 0, 0.5843138, 1, 1,
0.202769, 0.8401566, 0.2522607, 0, 0.5803922, 1, 1,
0.2044286, 0.09161528, 1.027849, 0, 0.572549, 1, 1,
0.210187, -0.5050553, 3.086883, 0, 0.5686275, 1, 1,
0.2172101, 0.9048175, -0.6468709, 0, 0.5607843, 1, 1,
0.2179351, 0.2519572, 1.41002, 0, 0.5568628, 1, 1,
0.2186887, -0.7856028, 3.423296, 0, 0.5490196, 1, 1,
0.2236751, 2.576767, 0.4202895, 0, 0.5450981, 1, 1,
0.225845, -0.2808427, 3.227051, 0, 0.5372549, 1, 1,
0.2304406, -1.961763, 3.439968, 0, 0.5333334, 1, 1,
0.2372705, 0.6027483, 0.6677311, 0, 0.5254902, 1, 1,
0.2382353, 0.04651921, 2.184894, 0, 0.5215687, 1, 1,
0.2444933, -0.172139, 1.222211, 0, 0.5137255, 1, 1,
0.2484706, 0.952125, -0.05210735, 0, 0.509804, 1, 1,
0.2486588, 0.8731498, 0.03846545, 0, 0.5019608, 1, 1,
0.2490023, 0.7943467, 0.8168713, 0, 0.4941176, 1, 1,
0.2515619, 0.8087896, 2.789422, 0, 0.4901961, 1, 1,
0.2544799, 2.264269, 1.456378, 0, 0.4823529, 1, 1,
0.2560483, -0.06979723, -1.542541, 0, 0.4784314, 1, 1,
0.2574779, -0.1179086, 0.8382556, 0, 0.4705882, 1, 1,
0.2575691, 0.3747393, 1.528544, 0, 0.4666667, 1, 1,
0.2589971, -0.7304564, 3.200729, 0, 0.4588235, 1, 1,
0.263311, 1.160878, 0.9359221, 0, 0.454902, 1, 1,
0.2649124, 0.2816378, -1.349609, 0, 0.4470588, 1, 1,
0.2687685, 0.5478569, 1.02721, 0, 0.4431373, 1, 1,
0.268902, -0.6104084, 3.682893, 0, 0.4352941, 1, 1,
0.2713619, -0.1230477, 2.734184, 0, 0.4313726, 1, 1,
0.2730782, -0.6866778, 3.435075, 0, 0.4235294, 1, 1,
0.2734799, -0.3753724, 2.510032, 0, 0.4196078, 1, 1,
0.2755364, 0.4316164, 0.5657186, 0, 0.4117647, 1, 1,
0.2802431, -0.5634342, 1.353947, 0, 0.4078431, 1, 1,
0.2813225, 0.8608627, -0.4389572, 0, 0.4, 1, 1,
0.2826906, -1.064145, 4.830381, 0, 0.3921569, 1, 1,
0.2836159, -1.204911, 2.276227, 0, 0.3882353, 1, 1,
0.2848007, 0.5314223, 0.1072395, 0, 0.3803922, 1, 1,
0.2880382, -0.1035478, 0.7889537, 0, 0.3764706, 1, 1,
0.2938429, 0.9665417, -1.799451, 0, 0.3686275, 1, 1,
0.2947824, -2.640423, 3.046792, 0, 0.3647059, 1, 1,
0.2958291, 0.8754494, 1.126757, 0, 0.3568628, 1, 1,
0.2961841, -0.008310627, 2.772659, 0, 0.3529412, 1, 1,
0.2982319, -0.5193875, 3.106907, 0, 0.345098, 1, 1,
0.3020965, 0.01102094, 0.05509527, 0, 0.3411765, 1, 1,
0.3027611, 1.318426, 0.1608281, 0, 0.3333333, 1, 1,
0.304217, -0.4477194, 3.605509, 0, 0.3294118, 1, 1,
0.3053444, 1.893929, -3.799773, 0, 0.3215686, 1, 1,
0.3073342, -1.332209, 1.071829, 0, 0.3176471, 1, 1,
0.3086915, -0.09860481, 1.977515, 0, 0.3098039, 1, 1,
0.313645, -1.044686, 0.3778846, 0, 0.3058824, 1, 1,
0.3172441, 1.091426, 0.0319447, 0, 0.2980392, 1, 1,
0.3218043, -1.50248, 2.33291, 0, 0.2901961, 1, 1,
0.3220897, -0.1874705, 3.602229, 0, 0.2862745, 1, 1,
0.3246181, -0.4089487, 3.60455, 0, 0.2784314, 1, 1,
0.3272583, -0.4973545, 2.905416, 0, 0.2745098, 1, 1,
0.3286294, 0.6327228, 0.4426994, 0, 0.2666667, 1, 1,
0.3344747, 0.7155764, 0.9667008, 0, 0.2627451, 1, 1,
0.3348063, 0.5919015, 2.219687, 0, 0.254902, 1, 1,
0.3355337, -0.7575862, 1.730835, 0, 0.2509804, 1, 1,
0.3367062, 0.7566735, 1.977397, 0, 0.2431373, 1, 1,
0.3386319, -0.7330945, 3.789995, 0, 0.2392157, 1, 1,
0.3457226, -0.6303301, 2.803393, 0, 0.2313726, 1, 1,
0.3511979, 1.086869, 0.1209163, 0, 0.227451, 1, 1,
0.3513636, 1.362313, -0.4605667, 0, 0.2196078, 1, 1,
0.3521022, 0.01787891, 0.8258968, 0, 0.2156863, 1, 1,
0.3539564, 0.3936065, 1.687913, 0, 0.2078431, 1, 1,
0.3561809, 0.03514848, 0.7262273, 0, 0.2039216, 1, 1,
0.3588134, 0.1684182, 0.8264716, 0, 0.1960784, 1, 1,
0.3621529, 0.3705004, 0.3551075, 0, 0.1882353, 1, 1,
0.3622313, -1.7487, 3.021639, 0, 0.1843137, 1, 1,
0.3687595, -0.3073668, 2.355392, 0, 0.1764706, 1, 1,
0.3745122, -0.9906479, 2.113549, 0, 0.172549, 1, 1,
0.3751955, -0.8290011, 0.6020924, 0, 0.1647059, 1, 1,
0.3752773, 1.715455, 0.4155981, 0, 0.1607843, 1, 1,
0.3773775, -1.147879, 3.665535, 0, 0.1529412, 1, 1,
0.3783862, 0.4226278, -0.6505685, 0, 0.1490196, 1, 1,
0.3833713, 0.312484, 2.700752, 0, 0.1411765, 1, 1,
0.38452, -1.609217, 4.628126, 0, 0.1372549, 1, 1,
0.385282, -0.9024572, 2.345431, 0, 0.1294118, 1, 1,
0.3877644, 0.3036689, 1.185187, 0, 0.1254902, 1, 1,
0.3882169, -0.9473205, 4.237595, 0, 0.1176471, 1, 1,
0.3959365, 0.04397487, 1.308351, 0, 0.1137255, 1, 1,
0.399002, -0.6195478, 2.82732, 0, 0.1058824, 1, 1,
0.3998393, -0.1979295, 2.497092, 0, 0.09803922, 1, 1,
0.404159, -1.184889, 3.987327, 0, 0.09411765, 1, 1,
0.4048274, 1.613201, 0.1256223, 0, 0.08627451, 1, 1,
0.4070052, 0.1049678, 0.8360488, 0, 0.08235294, 1, 1,
0.4094486, -1.930227, 3.499042, 0, 0.07450981, 1, 1,
0.4108764, 1.144149, -0.09402552, 0, 0.07058824, 1, 1,
0.4134873, -0.5800397, 2.13387, 0, 0.0627451, 1, 1,
0.4166797, -1.299966, 2.680937, 0, 0.05882353, 1, 1,
0.4177131, 1.186897, 0.002075891, 0, 0.05098039, 1, 1,
0.4177141, 0.06510621, 1.789702, 0, 0.04705882, 1, 1,
0.4184206, 0.962302, 0.5791798, 0, 0.03921569, 1, 1,
0.4189669, 0.2470037, 0.7499717, 0, 0.03529412, 1, 1,
0.4193012, 0.1082978, 1.909168, 0, 0.02745098, 1, 1,
0.4194081, -0.3124177, 0.9224273, 0, 0.02352941, 1, 1,
0.4241179, 1.483078, 2.045211, 0, 0.01568628, 1, 1,
0.4248686, 1.08382, -1.520716, 0, 0.01176471, 1, 1,
0.4273364, 0.6261919, -1.028006, 0, 0.003921569, 1, 1,
0.4310495, -0.7304158, 1.80937, 0.003921569, 0, 1, 1,
0.4323494, 0.01069258, 2.320245, 0.007843138, 0, 1, 1,
0.4343346, -1.087552, 2.899187, 0.01568628, 0, 1, 1,
0.4412607, 0.149385, 0.2886674, 0.01960784, 0, 1, 1,
0.4417587, -0.5901566, 3.171565, 0.02745098, 0, 1, 1,
0.4422837, -0.4439408, 0.8567234, 0.03137255, 0, 1, 1,
0.4436049, -0.9432607, 2.604587, 0.03921569, 0, 1, 1,
0.4442246, 0.1883947, 1.37913, 0.04313726, 0, 1, 1,
0.4442517, 1.329941, 1.258903, 0.05098039, 0, 1, 1,
0.4482745, 0.6341018, -0.297401, 0.05490196, 0, 1, 1,
0.4494046, 1.101715, -1.036879, 0.0627451, 0, 1, 1,
0.4507316, 0.2771306, 1.642599, 0.06666667, 0, 1, 1,
0.4510455, -2.383084, 3.678654, 0.07450981, 0, 1, 1,
0.4524666, 0.7562993, 0.007461086, 0.07843138, 0, 1, 1,
0.4553159, 0.992045, 0.4893459, 0.08627451, 0, 1, 1,
0.4625064, 0.3736417, -0.1342791, 0.09019608, 0, 1, 1,
0.4690837, -1.191983, 1.634988, 0.09803922, 0, 1, 1,
0.4761471, -0.2235082, 2.741838, 0.1058824, 0, 1, 1,
0.4794039, -0.4322659, 1.289272, 0.1098039, 0, 1, 1,
0.4800398, -0.4305844, 1.13531, 0.1176471, 0, 1, 1,
0.4831342, -2.311843, 3.408609, 0.1215686, 0, 1, 1,
0.4850909, 1.752909, 1.582071, 0.1294118, 0, 1, 1,
0.4902088, 0.3509413, 2.444278, 0.1333333, 0, 1, 1,
0.4933435, 1.167249, 0.2069029, 0.1411765, 0, 1, 1,
0.4943938, 0.4316749, 1.650224, 0.145098, 0, 1, 1,
0.496425, -0.6226726, 2.818871, 0.1529412, 0, 1, 1,
0.4976094, -0.6022871, 2.050091, 0.1568628, 0, 1, 1,
0.5011433, 0.3274817, 0.3653488, 0.1647059, 0, 1, 1,
0.5055203, 0.7506412, 0.5848063, 0.1686275, 0, 1, 1,
0.5115381, -0.9401451, 2.697151, 0.1764706, 0, 1, 1,
0.5142261, 0.4330264, 2.130426, 0.1803922, 0, 1, 1,
0.5188757, -0.1462913, 1.812777, 0.1882353, 0, 1, 1,
0.5263617, -0.0692563, 1.614866, 0.1921569, 0, 1, 1,
0.5292746, -1.513614, 2.628216, 0.2, 0, 1, 1,
0.5297467, 0.5642134, 1.928931, 0.2078431, 0, 1, 1,
0.5309848, -1.170137, 5.223919, 0.2117647, 0, 1, 1,
0.5350788, 1.317165, -0.2742218, 0.2196078, 0, 1, 1,
0.5447907, -0.009158982, 1.984479, 0.2235294, 0, 1, 1,
0.5453947, 0.2555775, 1.421637, 0.2313726, 0, 1, 1,
0.5487539, 0.9133673, -0.8595663, 0.2352941, 0, 1, 1,
0.5535506, -1.108558, 3.374299, 0.2431373, 0, 1, 1,
0.5540094, -0.8249428, 4.079845, 0.2470588, 0, 1, 1,
0.554029, 0.7380385, -0.2962418, 0.254902, 0, 1, 1,
0.5547512, 0.8503335, 0.9036533, 0.2588235, 0, 1, 1,
0.5558921, 1.319756, 0.7491806, 0.2666667, 0, 1, 1,
0.56902, 2.036907, 0.3088725, 0.2705882, 0, 1, 1,
0.573261, 0.8921067, 2.40719, 0.2784314, 0, 1, 1,
0.5769648, -0.7897707, 2.800447, 0.282353, 0, 1, 1,
0.5790069, 0.3696913, 2.637334, 0.2901961, 0, 1, 1,
0.579214, -1.007967, 2.723972, 0.2941177, 0, 1, 1,
0.5849435, -0.5260519, 1.958474, 0.3019608, 0, 1, 1,
0.5860835, 0.03534335, 2.666115, 0.3098039, 0, 1, 1,
0.5872551, -1.201372, 3.20959, 0.3137255, 0, 1, 1,
0.5886358, -1.651103, 1.206213, 0.3215686, 0, 1, 1,
0.5904905, 0.8365037, -0.7319378, 0.3254902, 0, 1, 1,
0.5953052, -0.1291461, 1.5008, 0.3333333, 0, 1, 1,
0.5965629, 0.4592846, 1.02947, 0.3372549, 0, 1, 1,
0.5979388, -0.9540927, 2.409465, 0.345098, 0, 1, 1,
0.5996161, 0.8517359, -0.7942821, 0.3490196, 0, 1, 1,
0.6116709, 0.3099489, 1.580087, 0.3568628, 0, 1, 1,
0.6176013, 0.7870116, 1.584978, 0.3607843, 0, 1, 1,
0.6224661, 1.885827, 1.224719, 0.3686275, 0, 1, 1,
0.6229947, 1.024825, 0.1301832, 0.372549, 0, 1, 1,
0.623186, 0.06869962, 3.369724, 0.3803922, 0, 1, 1,
0.6256412, 0.4792028, -0.1986506, 0.3843137, 0, 1, 1,
0.6257555, -0.08841534, 0.6382965, 0.3921569, 0, 1, 1,
0.6260964, -0.20578, 1.771685, 0.3960784, 0, 1, 1,
0.6262753, -2.11015, 4.897742, 0.4039216, 0, 1, 1,
0.6264102, -0.8095493, 2.816531, 0.4117647, 0, 1, 1,
0.6277631, 0.4368564, 0.3923672, 0.4156863, 0, 1, 1,
0.6306828, -1.402562, 1.971105, 0.4235294, 0, 1, 1,
0.6331249, 0.1592188, 3.078864, 0.427451, 0, 1, 1,
0.6336893, 0.2687748, 1.531339, 0.4352941, 0, 1, 1,
0.6387463, 0.5844184, 0.5486679, 0.4392157, 0, 1, 1,
0.6412786, -0.8502024, 1.364516, 0.4470588, 0, 1, 1,
0.6416736, -0.3488463, 3.38818, 0.4509804, 0, 1, 1,
0.6423486, 0.1295446, 1.898572, 0.4588235, 0, 1, 1,
0.6425987, -0.1557923, 0.6655465, 0.4627451, 0, 1, 1,
0.644676, 0.8642884, 0.6212705, 0.4705882, 0, 1, 1,
0.6464915, -0.2420357, 2.019488, 0.4745098, 0, 1, 1,
0.6492454, -2.355412, 0.3484751, 0.4823529, 0, 1, 1,
0.6755403, 0.07351349, 1.387565, 0.4862745, 0, 1, 1,
0.6759599, 1.204088, -0.2635905, 0.4941176, 0, 1, 1,
0.6835371, 0.4600024, 3.026781, 0.5019608, 0, 1, 1,
0.6878887, -0.04738269, 1.30027, 0.5058824, 0, 1, 1,
0.6889857, 1.061541, 1.475566, 0.5137255, 0, 1, 1,
0.6909444, -0.2754803, 1.5486, 0.5176471, 0, 1, 1,
0.6991282, -1.08987, 1.691097, 0.5254902, 0, 1, 1,
0.7031898, 0.07945817, 3.348237, 0.5294118, 0, 1, 1,
0.708683, 0.1763057, 2.331259, 0.5372549, 0, 1, 1,
0.7136592, 0.6792182, 0.02940068, 0.5411765, 0, 1, 1,
0.719539, -0.6325885, 1.271316, 0.5490196, 0, 1, 1,
0.7207697, 1.520052, 1.252063, 0.5529412, 0, 1, 1,
0.7213894, -1.863829, 0.8625502, 0.5607843, 0, 1, 1,
0.721732, -1.314759, 1.99293, 0.5647059, 0, 1, 1,
0.7301137, 0.3462622, 2.443428, 0.572549, 0, 1, 1,
0.7311165, -0.9753711, 1.657357, 0.5764706, 0, 1, 1,
0.7333449, -0.2807667, 2.30839, 0.5843138, 0, 1, 1,
0.7346839, -1.034403, 3.909008, 0.5882353, 0, 1, 1,
0.7347738, 0.8372758, 0.006918682, 0.5960785, 0, 1, 1,
0.7350891, -0.05148479, 2.334013, 0.6039216, 0, 1, 1,
0.7353498, 0.854233, 0.4365299, 0.6078432, 0, 1, 1,
0.7401097, -1.821063, 3.159178, 0.6156863, 0, 1, 1,
0.7449887, 0.7423896, 0.7549734, 0.6196079, 0, 1, 1,
0.748027, 1.777363, -0.698987, 0.627451, 0, 1, 1,
0.748158, -1.360418, 3.129773, 0.6313726, 0, 1, 1,
0.7504115, 0.8665901, 1.624364, 0.6392157, 0, 1, 1,
0.7522302, 0.3074882, 0.05756394, 0.6431373, 0, 1, 1,
0.7526174, 0.2200502, -0.01266705, 0.6509804, 0, 1, 1,
0.7607538, 1.654146, -0.8961625, 0.654902, 0, 1, 1,
0.762761, -1.608258, 3.503327, 0.6627451, 0, 1, 1,
0.7636868, 1.199654, 0.6827757, 0.6666667, 0, 1, 1,
0.7731313, -1.771134, 2.049445, 0.6745098, 0, 1, 1,
0.7752867, -0.02303897, 1.175179, 0.6784314, 0, 1, 1,
0.7820276, 0.1163544, 1.910957, 0.6862745, 0, 1, 1,
0.7896758, -0.6595465, 2.57844, 0.6901961, 0, 1, 1,
0.7935975, -0.4938872, 4.559095, 0.6980392, 0, 1, 1,
0.7936364, 0.6329569, -0.5851053, 0.7058824, 0, 1, 1,
0.7943705, -0.374743, 3.62153, 0.7098039, 0, 1, 1,
0.7945589, -1.45178, 2.795637, 0.7176471, 0, 1, 1,
0.7948524, 1.56398, -0.6673433, 0.7215686, 0, 1, 1,
0.7978716, 1.082643, 0.01718781, 0.7294118, 0, 1, 1,
0.8048637, -0.05320459, 2.157125, 0.7333333, 0, 1, 1,
0.8090503, -0.0009809997, 3.949531, 0.7411765, 0, 1, 1,
0.812168, 0.06751172, -0.7637675, 0.7450981, 0, 1, 1,
0.8166913, -0.2183929, 2.654225, 0.7529412, 0, 1, 1,
0.8213871, 0.9163936, 0.8439773, 0.7568628, 0, 1, 1,
0.8219025, -0.327511, 4.971903, 0.7647059, 0, 1, 1,
0.8226781, -0.1119957, 1.775807, 0.7686275, 0, 1, 1,
0.8242903, 0.002665625, -0.02802434, 0.7764706, 0, 1, 1,
0.8275065, 0.7060437, 0.08126419, 0.7803922, 0, 1, 1,
0.8299316, 1.610087, 0.1765982, 0.7882353, 0, 1, 1,
0.8323867, -0.7901164, 3.004991, 0.7921569, 0, 1, 1,
0.8331641, 1.62023, 0.1544479, 0.8, 0, 1, 1,
0.8376611, 1.927304, -0.687417, 0.8078431, 0, 1, 1,
0.8434768, 0.5065249, 0.8566815, 0.8117647, 0, 1, 1,
0.8441175, -2.308074, 1.528248, 0.8196079, 0, 1, 1,
0.8442725, 0.8281971, 0.02856071, 0.8235294, 0, 1, 1,
0.8495849, 0.1361562, 2.561743, 0.8313726, 0, 1, 1,
0.8521052, -0.5107107, 2.66112, 0.8352941, 0, 1, 1,
0.8530648, 0.1906275, 2.054085, 0.8431373, 0, 1, 1,
0.8554984, 1.270496, 0.0541622, 0.8470588, 0, 1, 1,
0.8560376, -1.384196, 3.540987, 0.854902, 0, 1, 1,
0.8563296, -0.08716103, 0.5976768, 0.8588235, 0, 1, 1,
0.8568578, -0.3540202, 2.120213, 0.8666667, 0, 1, 1,
0.8648883, 1.205758, 0.5015631, 0.8705882, 0, 1, 1,
0.8662297, 0.149964, 2.729606, 0.8784314, 0, 1, 1,
0.8679373, 0.6018524, 0.9516044, 0.8823529, 0, 1, 1,
0.8692277, -0.0941134, 0.9726099, 0.8901961, 0, 1, 1,
0.8700157, -0.6149727, 5.101376, 0.8941177, 0, 1, 1,
0.8753008, 0.6328037, 0.3476888, 0.9019608, 0, 1, 1,
0.8816205, 0.9778404, 1.033689, 0.9098039, 0, 1, 1,
0.8848744, 0.5812022, 1.317064, 0.9137255, 0, 1, 1,
0.9081818, -0.5477857, 2.212707, 0.9215686, 0, 1, 1,
0.9103, -1.159559, 2.583417, 0.9254902, 0, 1, 1,
0.9113391, 0.06103301, -0.1495373, 0.9333333, 0, 1, 1,
0.9118975, 0.8770175, 1.519049, 0.9372549, 0, 1, 1,
0.9148404, 0.6311317, 0.269594, 0.945098, 0, 1, 1,
0.920709, 0.9349542, 0.1337752, 0.9490196, 0, 1, 1,
0.9229367, 0.07141056, 1.340166, 0.9568627, 0, 1, 1,
0.922981, 0.1680199, 1.02297, 0.9607843, 0, 1, 1,
0.9245856, -0.2364247, 3.517815, 0.9686275, 0, 1, 1,
0.9377862, -0.6515507, 2.185479, 0.972549, 0, 1, 1,
0.9465361, -0.08885892, 3.290872, 0.9803922, 0, 1, 1,
0.9581503, 0.3883002, 1.394562, 0.9843137, 0, 1, 1,
0.9646137, 0.4679346, 0.723354, 0.9921569, 0, 1, 1,
0.9667591, -1.070303, 1.815371, 0.9960784, 0, 1, 1,
0.9667998, 2.086165, -0.8146365, 1, 0, 0.9960784, 1,
0.9690216, -0.2471353, 4.457125, 1, 0, 0.9882353, 1,
0.97069, -0.3498647, 2.219696, 1, 0, 0.9843137, 1,
0.9716889, 0.2201507, 0.7032094, 1, 0, 0.9764706, 1,
0.9717987, 0.2347486, 2.068459, 1, 0, 0.972549, 1,
0.9766999, -0.5770259, 1.639551, 1, 0, 0.9647059, 1,
0.9784831, -0.4180628, 1.546009, 1, 0, 0.9607843, 1,
0.9793013, 0.8557347, 0.765166, 1, 0, 0.9529412, 1,
0.9825673, -0.8141473, 3.459241, 1, 0, 0.9490196, 1,
0.9827005, 0.7743042, 0.05276983, 1, 0, 0.9411765, 1,
0.9836236, 0.6159734, -0.6107236, 1, 0, 0.9372549, 1,
0.9891024, 0.4287373, 2.167591, 1, 0, 0.9294118, 1,
0.9907944, -1.984197, 2.780804, 1, 0, 0.9254902, 1,
0.9941556, -0.3599027, 2.163839, 1, 0, 0.9176471, 1,
0.9970548, -1.169596, 2.618381, 1, 0, 0.9137255, 1,
0.9987489, 0.4629927, 0.3966165, 1, 0, 0.9058824, 1,
0.9992766, -1.878475, 1.636839, 1, 0, 0.9019608, 1,
1.000083, 0.401683, 2.635182, 1, 0, 0.8941177, 1,
1.001195, 1.451468, 2.668927, 1, 0, 0.8862745, 1,
1.001469, -0.009051758, 1.472108, 1, 0, 0.8823529, 1,
1.009386, 0.9958454, 1.163939, 1, 0, 0.8745098, 1,
1.009743, -1.338188, 2.020805, 1, 0, 0.8705882, 1,
1.018408, 0.740589, 2.018466, 1, 0, 0.8627451, 1,
1.024955, -0.2953142, 1.214598, 1, 0, 0.8588235, 1,
1.029471, 1.272484, -0.1474952, 1, 0, 0.8509804, 1,
1.036713, -0.5133691, 1.650669, 1, 0, 0.8470588, 1,
1.037367, 0.0446739, 2.061665, 1, 0, 0.8392157, 1,
1.038923, 0.8167409, 0.8773457, 1, 0, 0.8352941, 1,
1.040741, -0.1217294, 1.127798, 1, 0, 0.827451, 1,
1.044365, -0.523149, 3.794785, 1, 0, 0.8235294, 1,
1.047737, -1.102516, 2.659739, 1, 0, 0.8156863, 1,
1.050961, -0.7938315, 1.894583, 1, 0, 0.8117647, 1,
1.058799, -0.4313377, 2.510748, 1, 0, 0.8039216, 1,
1.063354, -0.5519112, 1.724089, 1, 0, 0.7960784, 1,
1.063504, 0.09746662, 3.049826, 1, 0, 0.7921569, 1,
1.065024, -0.5282078, 1.734867, 1, 0, 0.7843137, 1,
1.08281, -1.722056, 2.496131, 1, 0, 0.7803922, 1,
1.085023, -0.01535842, 1.98982, 1, 0, 0.772549, 1,
1.085476, 0.682068, 2.057533, 1, 0, 0.7686275, 1,
1.090002, 0.6754942, -0.5660279, 1, 0, 0.7607843, 1,
1.092304, 1.753371, 0.01082317, 1, 0, 0.7568628, 1,
1.098481, 1.093767, 0.3272912, 1, 0, 0.7490196, 1,
1.100919, -1.293585, 1.592731, 1, 0, 0.7450981, 1,
1.105089, -1.117887, 2.684068, 1, 0, 0.7372549, 1,
1.110603, 0.2809421, -0.2979939, 1, 0, 0.7333333, 1,
1.11323, -0.8959784, 1.800903, 1, 0, 0.7254902, 1,
1.119675, -0.7151931, 0.8155743, 1, 0, 0.7215686, 1,
1.122358, -0.7784385, 2.106688, 1, 0, 0.7137255, 1,
1.127592, 0.9920692, 1.666833, 1, 0, 0.7098039, 1,
1.132484, 0.2908214, -0.8517973, 1, 0, 0.7019608, 1,
1.134104, 1.090404, 0.6752031, 1, 0, 0.6941177, 1,
1.136969, -0.3925539, 1.945132, 1, 0, 0.6901961, 1,
1.146052, -0.5245036, 0.7956807, 1, 0, 0.682353, 1,
1.155771, -0.6501737, 1.466663, 1, 0, 0.6784314, 1,
1.158278, 1.400354, -0.6260356, 1, 0, 0.6705883, 1,
1.158523, 2.996663, 1.244442, 1, 0, 0.6666667, 1,
1.160393, 0.01048277, 1.129331, 1, 0, 0.6588235, 1,
1.171501, -0.657863, 2.824724, 1, 0, 0.654902, 1,
1.178037, 0.1528736, 1.416425, 1, 0, 0.6470588, 1,
1.179355, 0.6080046, 0.4158432, 1, 0, 0.6431373, 1,
1.180639, 0.02976155, 0.9319682, 1, 0, 0.6352941, 1,
1.182369, 0.2317156, 1.010433, 1, 0, 0.6313726, 1,
1.184729, -0.02669984, 2.852659, 1, 0, 0.6235294, 1,
1.193933, 0.02956979, 2.663015, 1, 0, 0.6196079, 1,
1.2078, 0.5457039, 2.39169, 1, 0, 0.6117647, 1,
1.21264, -0.5411968, 1.925151, 1, 0, 0.6078432, 1,
1.217006, 0.7202341, 0.1239386, 1, 0, 0.6, 1,
1.219756, -0.620357, 0.9470265, 1, 0, 0.5921569, 1,
1.221447, -0.4641389, 1.103612, 1, 0, 0.5882353, 1,
1.234083, 0.3853967, 0.667115, 1, 0, 0.5803922, 1,
1.249959, 0.8975548, 0.616677, 1, 0, 0.5764706, 1,
1.253597, 0.1896873, 2.641849, 1, 0, 0.5686275, 1,
1.263588, 1.382963, 1.807316, 1, 0, 0.5647059, 1,
1.269992, -0.1747692, 1.688976, 1, 0, 0.5568628, 1,
1.278339, -0.822683, 3.16217, 1, 0, 0.5529412, 1,
1.279269, -1.809016, 2.296106, 1, 0, 0.5450981, 1,
1.296521, -1.830665, 3.447703, 1, 0, 0.5411765, 1,
1.30361, 0.5875973, 1.727574, 1, 0, 0.5333334, 1,
1.304699, 1.75812, 2.564328, 1, 0, 0.5294118, 1,
1.307877, 0.6215213, 2.196116, 1, 0, 0.5215687, 1,
1.313146, 0.8457527, 1.324269, 1, 0, 0.5176471, 1,
1.319448, 0.3585933, 3.139227, 1, 0, 0.509804, 1,
1.321045, 1.100226, 0.6469815, 1, 0, 0.5058824, 1,
1.327897, -1.546603, 4.073249, 1, 0, 0.4980392, 1,
1.34245, -1.130665, 0.6885936, 1, 0, 0.4901961, 1,
1.360354, -0.1729024, 2.22088, 1, 0, 0.4862745, 1,
1.371378, 0.6915336, 1.796636, 1, 0, 0.4784314, 1,
1.372809, 0.2501698, 1.052069, 1, 0, 0.4745098, 1,
1.383885, 0.4961014, 0.9228494, 1, 0, 0.4666667, 1,
1.386734, 1.539459, -0.1921059, 1, 0, 0.4627451, 1,
1.402043, 0.3482186, 2.188201, 1, 0, 0.454902, 1,
1.409378, 0.6622276, 1.360203, 1, 0, 0.4509804, 1,
1.415462, 1.088035, 1.065931, 1, 0, 0.4431373, 1,
1.415941, 0.5128099, 0.8227206, 1, 0, 0.4392157, 1,
1.418932, -0.4793619, 1.86357, 1, 0, 0.4313726, 1,
1.426306, -0.81644, 2.914237, 1, 0, 0.427451, 1,
1.427222, -0.07948816, 1.66508, 1, 0, 0.4196078, 1,
1.429869, 0.749345, 0.3145918, 1, 0, 0.4156863, 1,
1.455625, -0.1731444, 1.506485, 1, 0, 0.4078431, 1,
1.457558, -1.290103, 2.236665, 1, 0, 0.4039216, 1,
1.481251, -0.6128349, 0.506982, 1, 0, 0.3960784, 1,
1.488199, 3.020045, 1.018155, 1, 0, 0.3882353, 1,
1.494176, 0.9003337, 1.286038, 1, 0, 0.3843137, 1,
1.494213, -0.4015482, 1.475291, 1, 0, 0.3764706, 1,
1.506861, -0.1559272, -0.01785179, 1, 0, 0.372549, 1,
1.513784, 1.691767, 1.196913, 1, 0, 0.3647059, 1,
1.515001, 0.08937883, 2.350918, 1, 0, 0.3607843, 1,
1.528382, -0.1611353, 1.995777, 1, 0, 0.3529412, 1,
1.535039, -0.4048825, 2.682403, 1, 0, 0.3490196, 1,
1.544718, -1.091388, 2.10477, 1, 0, 0.3411765, 1,
1.562157, -0.1685943, 2.258245, 1, 0, 0.3372549, 1,
1.570256, -0.7361709, 1.555317, 1, 0, 0.3294118, 1,
1.572211, -0.5140906, 1.982978, 1, 0, 0.3254902, 1,
1.574276, -0.1826401, 3.409237, 1, 0, 0.3176471, 1,
1.587197, -2.228904, 3.043826, 1, 0, 0.3137255, 1,
1.594951, -0.709505, 3.135292, 1, 0, 0.3058824, 1,
1.607256, 1.498683, 0.6092643, 1, 0, 0.2980392, 1,
1.643566, 0.8301558, -0.7850299, 1, 0, 0.2941177, 1,
1.672248, 0.4972033, 0.6979214, 1, 0, 0.2862745, 1,
1.679647, -1.394803, 1.281969, 1, 0, 0.282353, 1,
1.68783, 0.3755349, 0.7812821, 1, 0, 0.2745098, 1,
1.73539, 0.5799904, 0.8877775, 1, 0, 0.2705882, 1,
1.746868, -0.7372588, 0.3591169, 1, 0, 0.2627451, 1,
1.750987, -0.03149918, 2.286755, 1, 0, 0.2588235, 1,
1.756401, 0.4004985, 1.121834, 1, 0, 0.2509804, 1,
1.757442, -0.293725, -0.1604147, 1, 0, 0.2470588, 1,
1.773578, 0.7981964, 1.365084, 1, 0, 0.2392157, 1,
1.787588, 1.86397, 3.316993, 1, 0, 0.2352941, 1,
1.827236, -1.531939, 1.013082, 1, 0, 0.227451, 1,
1.835349, -0.3870871, 2.907024, 1, 0, 0.2235294, 1,
1.836899, 0.3057814, 2.032527, 1, 0, 0.2156863, 1,
1.86618, -1.599974, 0.2618097, 1, 0, 0.2117647, 1,
1.868286, -0.8715665, 0.5828494, 1, 0, 0.2039216, 1,
1.891053, -1.365456, 2.884886, 1, 0, 0.1960784, 1,
1.893626, 0.4273266, 2.712993, 1, 0, 0.1921569, 1,
1.896027, 0.6346225, 0.9664909, 1, 0, 0.1843137, 1,
1.904004, -0.7634732, 0.8964238, 1, 0, 0.1803922, 1,
1.910637, -1.269426, 2.107826, 1, 0, 0.172549, 1,
1.936837, -0.1437821, 1.455876, 1, 0, 0.1686275, 1,
1.957191, 1.103819, -0.4341802, 1, 0, 0.1607843, 1,
1.961845, -0.5309212, 1.888621, 1, 0, 0.1568628, 1,
1.972722, -0.4806451, 0.9583481, 1, 0, 0.1490196, 1,
2.005836, -0.7252134, 2.393201, 1, 0, 0.145098, 1,
2.02194, 1.048489, 0.8048013, 1, 0, 0.1372549, 1,
2.031466, 1.49441, 0.8552867, 1, 0, 0.1333333, 1,
2.037176, 1.134391, 2.161801, 1, 0, 0.1254902, 1,
2.047947, 0.5320596, 2.506346, 1, 0, 0.1215686, 1,
2.064803, -0.2719254, 1.561943, 1, 0, 0.1137255, 1,
2.118836, -0.1609605, 2.586186, 1, 0, 0.1098039, 1,
2.129908, 0.9616206, 2.036918, 1, 0, 0.1019608, 1,
2.145108, -0.7371678, 1.773932, 1, 0, 0.09411765, 1,
2.171887, 0.5082262, 1.424588, 1, 0, 0.09019608, 1,
2.205605, -0.01322944, 1.126862, 1, 0, 0.08235294, 1,
2.213064, -1.52044, 0.7671638, 1, 0, 0.07843138, 1,
2.22146, 1.336925, 1.88847, 1, 0, 0.07058824, 1,
2.263875, 1.777592, 1.373132, 1, 0, 0.06666667, 1,
2.338728, 3.740934, 0.976519, 1, 0, 0.05882353, 1,
2.350418, -0.6796898, 2.25703, 1, 0, 0.05490196, 1,
2.354387, -0.541836, 4.288564, 1, 0, 0.04705882, 1,
2.380825, 0.5373214, 2.853488, 1, 0, 0.04313726, 1,
2.46648, -0.5989093, 0.7388912, 1, 0, 0.03529412, 1,
2.515881, -1.112852, 0.6399417, 1, 0, 0.03137255, 1,
2.772065, 1.287699, -0.7923586, 1, 0, 0.02352941, 1,
3.070462, -2.392597, 0.8262936, 1, 0, 0.01960784, 1,
3.239788, -2.004603, 4.423572, 1, 0, 0.01176471, 1,
3.240238, 0.07382444, 1.549606, 1, 0, 0.007843138, 1
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
0.2068213, -4.683351, -6.921877, 0, -0.5, 0.5, 0.5,
0.2068213, -4.683351, -6.921877, 1, -0.5, 0.5, 0.5,
0.2068213, -4.683351, -6.921877, 1, 1.5, 0.5, 0.5,
0.2068213, -4.683351, -6.921877, 0, 1.5, 0.5, 0.5
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
-3.854924, 0.1392734, -6.921877, 0, -0.5, 0.5, 0.5,
-3.854924, 0.1392734, -6.921877, 1, -0.5, 0.5, 0.5,
-3.854924, 0.1392734, -6.921877, 1, 1.5, 0.5, 0.5,
-3.854924, 0.1392734, -6.921877, 0, 1.5, 0.5, 0.5
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
-3.854924, -4.683351, 0.03118896, 0, -0.5, 0.5, 0.5,
-3.854924, -4.683351, 0.03118896, 1, -0.5, 0.5, 0.5,
-3.854924, -4.683351, 0.03118896, 1, 1.5, 0.5, 0.5,
-3.854924, -4.683351, 0.03118896, 0, 1.5, 0.5, 0.5
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
-2, -3.570437, -5.317323,
3, -3.570437, -5.317323,
-2, -3.570437, -5.317323,
-2, -3.755923, -5.584749,
-1, -3.570437, -5.317323,
-1, -3.755923, -5.584749,
0, -3.570437, -5.317323,
0, -3.755923, -5.584749,
1, -3.570437, -5.317323,
1, -3.755923, -5.584749,
2, -3.570437, -5.317323,
2, -3.755923, -5.584749,
3, -3.570437, -5.317323,
3, -3.755923, -5.584749
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
-2, -4.126894, -6.1196, 0, -0.5, 0.5, 0.5,
-2, -4.126894, -6.1196, 1, -0.5, 0.5, 0.5,
-2, -4.126894, -6.1196, 1, 1.5, 0.5, 0.5,
-2, -4.126894, -6.1196, 0, 1.5, 0.5, 0.5,
-1, -4.126894, -6.1196, 0, -0.5, 0.5, 0.5,
-1, -4.126894, -6.1196, 1, -0.5, 0.5, 0.5,
-1, -4.126894, -6.1196, 1, 1.5, 0.5, 0.5,
-1, -4.126894, -6.1196, 0, 1.5, 0.5, 0.5,
0, -4.126894, -6.1196, 0, -0.5, 0.5, 0.5,
0, -4.126894, -6.1196, 1, -0.5, 0.5, 0.5,
0, -4.126894, -6.1196, 1, 1.5, 0.5, 0.5,
0, -4.126894, -6.1196, 0, 1.5, 0.5, 0.5,
1, -4.126894, -6.1196, 0, -0.5, 0.5, 0.5,
1, -4.126894, -6.1196, 1, -0.5, 0.5, 0.5,
1, -4.126894, -6.1196, 1, 1.5, 0.5, 0.5,
1, -4.126894, -6.1196, 0, 1.5, 0.5, 0.5,
2, -4.126894, -6.1196, 0, -0.5, 0.5, 0.5,
2, -4.126894, -6.1196, 1, -0.5, 0.5, 0.5,
2, -4.126894, -6.1196, 1, 1.5, 0.5, 0.5,
2, -4.126894, -6.1196, 0, 1.5, 0.5, 0.5,
3, -4.126894, -6.1196, 0, -0.5, 0.5, 0.5,
3, -4.126894, -6.1196, 1, -0.5, 0.5, 0.5,
3, -4.126894, -6.1196, 1, 1.5, 0.5, 0.5,
3, -4.126894, -6.1196, 0, 1.5, 0.5, 0.5
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
-2.917598, -2, -5.317323,
-2.917598, 2, -5.317323,
-2.917598, -2, -5.317323,
-3.073819, -2, -5.584749,
-2.917598, 0, -5.317323,
-3.073819, 0, -5.584749,
-2.917598, 2, -5.317323,
-3.073819, 2, -5.584749
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
-3.386261, -2, -6.1196, 0, -0.5, 0.5, 0.5,
-3.386261, -2, -6.1196, 1, -0.5, 0.5, 0.5,
-3.386261, -2, -6.1196, 1, 1.5, 0.5, 0.5,
-3.386261, -2, -6.1196, 0, 1.5, 0.5, 0.5,
-3.386261, 0, -6.1196, 0, -0.5, 0.5, 0.5,
-3.386261, 0, -6.1196, 1, -0.5, 0.5, 0.5,
-3.386261, 0, -6.1196, 1, 1.5, 0.5, 0.5,
-3.386261, 0, -6.1196, 0, 1.5, 0.5, 0.5,
-3.386261, 2, -6.1196, 0, -0.5, 0.5, 0.5,
-3.386261, 2, -6.1196, 1, -0.5, 0.5, 0.5,
-3.386261, 2, -6.1196, 1, 1.5, 0.5, 0.5,
-3.386261, 2, -6.1196, 0, 1.5, 0.5, 0.5
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
-2.917598, -3.570437, -4,
-2.917598, -3.570437, 4,
-2.917598, -3.570437, -4,
-3.073819, -3.755923, -4,
-2.917598, -3.570437, -2,
-3.073819, -3.755923, -2,
-2.917598, -3.570437, 0,
-3.073819, -3.755923, 0,
-2.917598, -3.570437, 2,
-3.073819, -3.755923, 2,
-2.917598, -3.570437, 4,
-3.073819, -3.755923, 4
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
-3.386261, -4.126894, -4, 0, -0.5, 0.5, 0.5,
-3.386261, -4.126894, -4, 1, -0.5, 0.5, 0.5,
-3.386261, -4.126894, -4, 1, 1.5, 0.5, 0.5,
-3.386261, -4.126894, -4, 0, 1.5, 0.5, 0.5,
-3.386261, -4.126894, -2, 0, -0.5, 0.5, 0.5,
-3.386261, -4.126894, -2, 1, -0.5, 0.5, 0.5,
-3.386261, -4.126894, -2, 1, 1.5, 0.5, 0.5,
-3.386261, -4.126894, -2, 0, 1.5, 0.5, 0.5,
-3.386261, -4.126894, 0, 0, -0.5, 0.5, 0.5,
-3.386261, -4.126894, 0, 1, -0.5, 0.5, 0.5,
-3.386261, -4.126894, 0, 1, 1.5, 0.5, 0.5,
-3.386261, -4.126894, 0, 0, 1.5, 0.5, 0.5,
-3.386261, -4.126894, 2, 0, -0.5, 0.5, 0.5,
-3.386261, -4.126894, 2, 1, -0.5, 0.5, 0.5,
-3.386261, -4.126894, 2, 1, 1.5, 0.5, 0.5,
-3.386261, -4.126894, 2, 0, 1.5, 0.5, 0.5,
-3.386261, -4.126894, 4, 0, -0.5, 0.5, 0.5,
-3.386261, -4.126894, 4, 1, -0.5, 0.5, 0.5,
-3.386261, -4.126894, 4, 1, 1.5, 0.5, 0.5,
-3.386261, -4.126894, 4, 0, 1.5, 0.5, 0.5
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
-2.917598, -3.570437, -5.317323,
-2.917598, 3.848984, -5.317323,
-2.917598, -3.570437, 5.379701,
-2.917598, 3.848984, 5.379701,
-2.917598, -3.570437, -5.317323,
-2.917598, -3.570437, 5.379701,
-2.917598, 3.848984, -5.317323,
-2.917598, 3.848984, 5.379701,
-2.917598, -3.570437, -5.317323,
3.331241, -3.570437, -5.317323,
-2.917598, -3.570437, 5.379701,
3.331241, -3.570437, 5.379701,
-2.917598, 3.848984, -5.317323,
3.331241, 3.848984, -5.317323,
-2.917598, 3.848984, 5.379701,
3.331241, 3.848984, 5.379701,
3.331241, -3.570437, -5.317323,
3.331241, 3.848984, -5.317323,
3.331241, -3.570437, 5.379701,
3.331241, 3.848984, 5.379701,
3.331241, -3.570437, -5.317323,
3.331241, -3.570437, 5.379701,
3.331241, 3.848984, -5.317323,
3.331241, 3.848984, 5.379701
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
var radius = 7.710838;
var distance = 34.30639;
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
mvMatrix.translate( -0.2068213, -0.1392734, -0.03118896 );
mvMatrix.scale( 1.334185, 1.123687, 0.7793857 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.30639);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
methylarsonate_ammon<-read.table("methylarsonate_ammon.xyz")
```

```
## Error in read.table("methylarsonate_ammon.xyz"): no lines available in input
```

```r
x<-methylarsonate_ammon$V2
```

```
## Error in eval(expr, envir, enclos): object 'methylarsonate_ammon' not found
```

```r
y<-methylarsonate_ammon$V3
```

```
## Error in eval(expr, envir, enclos): object 'methylarsonate_ammon' not found
```

```r
z<-methylarsonate_ammon$V4
```

```
## Error in eval(expr, envir, enclos): object 'methylarsonate_ammon' not found
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
-2.826596, -0.4148731, -3.586417, 0, 0, 1, 1, 1,
-2.664034, -1.408119, -2.076619, 1, 0, 0, 1, 1,
-2.484406, -0.6661308, -1.314585, 1, 0, 0, 1, 1,
-2.405901, 1.011905, -1.855142, 1, 0, 0, 1, 1,
-2.405846, -0.5514159, -1.291143, 1, 0, 0, 1, 1,
-2.266609, -0.05241621, -0.1135286, 1, 0, 0, 1, 1,
-2.199386, -0.5612864, -0.9021454, 0, 0, 0, 1, 1,
-2.114593, 0.8440127, 0.1814733, 0, 0, 0, 1, 1,
-2.10078, 0.5514949, -1.989249, 0, 0, 0, 1, 1,
-2.086698, -0.7802128, -2.030621, 0, 0, 0, 1, 1,
-2.085117, -0.4071753, -1.483928, 0, 0, 0, 1, 1,
-2.08011, 0.3567852, -1.283012, 0, 0, 0, 1, 1,
-2.079345, -1.97133, -3.276527, 0, 0, 0, 1, 1,
-2.040887, 1.381563, 0.001814993, 1, 1, 1, 1, 1,
-2.010723, -0.4907277, -2.426961, 1, 1, 1, 1, 1,
-2.00236, -2.931007, -3.444685, 1, 1, 1, 1, 1,
-1.972129, 0.1657458, -0.4383649, 1, 1, 1, 1, 1,
-1.92661, 1.324308, -3.536498, 1, 1, 1, 1, 1,
-1.906979, 0.2964819, -2.368115, 1, 1, 1, 1, 1,
-1.898967, 1.532231, -0.7106463, 1, 1, 1, 1, 1,
-1.884883, 1.643014, -1.828465, 1, 1, 1, 1, 1,
-1.866233, 0.9227667, -1.869199, 1, 1, 1, 1, 1,
-1.860833, 1.214117, -2.010134, 1, 1, 1, 1, 1,
-1.848717, -0.1894777, -2.016787, 1, 1, 1, 1, 1,
-1.848031, -0.6159297, -1.773026, 1, 1, 1, 1, 1,
-1.842076, 0.6988675, -1.258596, 1, 1, 1, 1, 1,
-1.839837, -0.9294208, -1.110932, 1, 1, 1, 1, 1,
-1.836607, 0.9066414, -2.031369, 1, 1, 1, 1, 1,
-1.831033, -0.8017663, -2.913163, 0, 0, 1, 1, 1,
-1.823419, -0.5465084, -2.288881, 1, 0, 0, 1, 1,
-1.818314, -1.246826, -0.3429911, 1, 0, 0, 1, 1,
-1.80516, 1.840402, -1.770129, 1, 0, 0, 1, 1,
-1.801761, 1.213603, -0.3075034, 1, 0, 0, 1, 1,
-1.784274, 0.4517387, -2.105266, 1, 0, 0, 1, 1,
-1.783639, -0.9283384, -2.342713, 0, 0, 0, 1, 1,
-1.778708, 0.1896113, -2.593957, 0, 0, 0, 1, 1,
-1.773219, -0.1742876, -2.047341, 0, 0, 0, 1, 1,
-1.743176, -0.2723156, -3.515519, 0, 0, 0, 1, 1,
-1.710561, -1.354179, -3.207308, 0, 0, 0, 1, 1,
-1.692111, 1.021532, -1.858296, 0, 0, 0, 1, 1,
-1.688207, -1.769619, -0.4603632, 0, 0, 0, 1, 1,
-1.675512, -2.276172, -5.161541, 1, 1, 1, 1, 1,
-1.658294, -0.472924, -3.472352, 1, 1, 1, 1, 1,
-1.621078, -0.5787066, -1.134922, 1, 1, 1, 1, 1,
-1.616361, -1.460783, -2.443973, 1, 1, 1, 1, 1,
-1.603118, -0.4400428, -3.788623, 1, 1, 1, 1, 1,
-1.595317, -0.2679422, -2.727615, 1, 1, 1, 1, 1,
-1.593017, -1.171189, -2.917898, 1, 1, 1, 1, 1,
-1.591481, 0.8183633, -0.8914077, 1, 1, 1, 1, 1,
-1.580694, -1.902972, -1.18772, 1, 1, 1, 1, 1,
-1.57758, -2.23453, -1.908188, 1, 1, 1, 1, 1,
-1.566712, -0.1438736, -1.011255, 1, 1, 1, 1, 1,
-1.56633, 1.052465, -0.9445586, 1, 1, 1, 1, 1,
-1.564585, 0.06155283, -1.66903, 1, 1, 1, 1, 1,
-1.562064, 0.8814657, 0.01788776, 1, 1, 1, 1, 1,
-1.559451, -0.1033934, -2.799702, 1, 1, 1, 1, 1,
-1.557039, -0.9273604, -2.391284, 0, 0, 1, 1, 1,
-1.551203, -0.6972673, -1.40377, 1, 0, 0, 1, 1,
-1.549239, -0.3824139, -0.5620902, 1, 0, 0, 1, 1,
-1.531458, 0.01596536, -1.295597, 1, 0, 0, 1, 1,
-1.531072, -1.047359, -2.596838, 1, 0, 0, 1, 1,
-1.524843, 0.0007593413, -3.590173, 1, 0, 0, 1, 1,
-1.522359, -0.1732546, -1.173684, 0, 0, 0, 1, 1,
-1.517814, 0.148475, -1.485608, 0, 0, 0, 1, 1,
-1.505459, -0.437831, -1.659625, 0, 0, 0, 1, 1,
-1.498966, 1.126464, 0.6543984, 0, 0, 0, 1, 1,
-1.483097, 0.1605678, -2.096674, 0, 0, 0, 1, 1,
-1.471249, 0.2538349, -1.518691, 0, 0, 0, 1, 1,
-1.467866, -0.5172565, -1.316216, 0, 0, 0, 1, 1,
-1.466345, -1.112295, -2.244819, 1, 1, 1, 1, 1,
-1.461177, -0.4745967, -2.944644, 1, 1, 1, 1, 1,
-1.458991, -0.9835543, -0.7835507, 1, 1, 1, 1, 1,
-1.456182, -1.078734, -0.03070214, 1, 1, 1, 1, 1,
-1.438985, 0.04539923, -2.11302, 1, 1, 1, 1, 1,
-1.428058, 0.07051601, -1.217414, 1, 1, 1, 1, 1,
-1.42111, -0.01169458, -2.273587, 1, 1, 1, 1, 1,
-1.420699, -1.382666, -1.400061, 1, 1, 1, 1, 1,
-1.417739, 0.08584882, -1.533775, 1, 1, 1, 1, 1,
-1.412317, 1.69593, -1.263381, 1, 1, 1, 1, 1,
-1.407745, 0.6371108, -0.7081709, 1, 1, 1, 1, 1,
-1.395872, 1.968513, -1.481631, 1, 1, 1, 1, 1,
-1.384527, 0.5531405, -0.03178138, 1, 1, 1, 1, 1,
-1.375579, -1.346698, -1.978162, 1, 1, 1, 1, 1,
-1.344441, 0.2377547, -2.586106, 1, 1, 1, 1, 1,
-1.344114, -1.009956, -3.632487, 0, 0, 1, 1, 1,
-1.342397, 0.332003, -2.124871, 1, 0, 0, 1, 1,
-1.33824, -1.262198, -1.679482, 1, 0, 0, 1, 1,
-1.332368, 0.5410635, -1.41169, 1, 0, 0, 1, 1,
-1.331466, 1.565022, -2.871825, 1, 0, 0, 1, 1,
-1.320714, -0.1087005, -1.871014, 1, 0, 0, 1, 1,
-1.316405, -0.6293495, -2.124198, 0, 0, 0, 1, 1,
-1.308715, 1.236726, -0.2516921, 0, 0, 0, 1, 1,
-1.297136, 1.589993, -0.9875579, 0, 0, 0, 1, 1,
-1.281964, 1.492559, -0.4110242, 0, 0, 0, 1, 1,
-1.278486, -0.4586824, -0.2196273, 0, 0, 0, 1, 1,
-1.276932, -0.03607671, -2.021002, 0, 0, 0, 1, 1,
-1.259393, -0.3980354, -2.843462, 0, 0, 0, 1, 1,
-1.245325, -1.985238, -2.82464, 1, 1, 1, 1, 1,
-1.243166, -2.105568, -1.412168, 1, 1, 1, 1, 1,
-1.236344, -0.5211251, -1.515171, 1, 1, 1, 1, 1,
-1.227575, 0.9175205, -0.06671043, 1, 1, 1, 1, 1,
-1.218487, 0.8001015, -0.6223229, 1, 1, 1, 1, 1,
-1.212598, -0.4687546, -1.206005, 1, 1, 1, 1, 1,
-1.211649, -0.1607781, -1.704074, 1, 1, 1, 1, 1,
-1.199791, 0.8233992, -1.157483, 1, 1, 1, 1, 1,
-1.186047, -1.611033, -1.150851, 1, 1, 1, 1, 1,
-1.177832, -0.1315622, -2.042824, 1, 1, 1, 1, 1,
-1.17441, -0.1869478, 0.3417762, 1, 1, 1, 1, 1,
-1.165257, -1.206534, -1.67172, 1, 1, 1, 1, 1,
-1.164449, 2.114469, -1.110522, 1, 1, 1, 1, 1,
-1.162971, 0.2313343, -0.1512086, 1, 1, 1, 1, 1,
-1.159343, -1.139839, -4.647087, 1, 1, 1, 1, 1,
-1.158826, 0.5522259, -0.4108224, 0, 0, 1, 1, 1,
-1.156865, -0.9771422, -2.582414, 1, 0, 0, 1, 1,
-1.154792, -0.7163932, -2.012434, 1, 0, 0, 1, 1,
-1.153562, -0.157218, -2.801282, 1, 0, 0, 1, 1,
-1.136169, -1.208829, -2.875272, 1, 0, 0, 1, 1,
-1.130484, 0.07097215, -0.2630825, 1, 0, 0, 1, 1,
-1.130429, 0.7406203, -1.731675, 0, 0, 0, 1, 1,
-1.121353, 0.3045852, -2.023023, 0, 0, 0, 1, 1,
-1.115271, 1.347292, -0.3704255, 0, 0, 0, 1, 1,
-1.114244, -0.2692339, -1.975525, 0, 0, 0, 1, 1,
-1.110829, 1.077677, -1.106771, 0, 0, 0, 1, 1,
-1.094981, 0.004273403, -1.536221, 0, 0, 0, 1, 1,
-1.092986, -0.9613928, -2.820225, 0, 0, 0, 1, 1,
-1.092834, -1.399275, -2.63258, 1, 1, 1, 1, 1,
-1.091987, 0.283115, -1.222983, 1, 1, 1, 1, 1,
-1.091741, 0.6584607, 0.7817212, 1, 1, 1, 1, 1,
-1.081803, 0.3654387, -0.6767001, 1, 1, 1, 1, 1,
-1.080256, 1.130464, -0.5130878, 1, 1, 1, 1, 1,
-1.079876, 0.7594284, -1.631961, 1, 1, 1, 1, 1,
-1.078843, 0.2975855, 0.03474564, 1, 1, 1, 1, 1,
-1.07884, -0.6985404, -4.386358, 1, 1, 1, 1, 1,
-1.077325, -0.3648798, -1.702094, 1, 1, 1, 1, 1,
-1.073983, -0.02545477, -3.105292, 1, 1, 1, 1, 1,
-1.070646, 0.4758618, -3.18043, 1, 1, 1, 1, 1,
-1.069625, 2.010612, 0.2194931, 1, 1, 1, 1, 1,
-1.067417, -0.03340824, -0.6419212, 1, 1, 1, 1, 1,
-1.065625, -1.202712, -4.737743, 1, 1, 1, 1, 1,
-1.065021, -0.1088738, -2.146677, 1, 1, 1, 1, 1,
-1.061592, 0.1316285, -2.123674, 0, 0, 1, 1, 1,
-1.057084, -0.7627031, -1.419355, 1, 0, 0, 1, 1,
-1.055817, 1.411298, 0.1452526, 1, 0, 0, 1, 1,
-1.054306, 1.257312, 0.5369076, 1, 0, 0, 1, 1,
-1.05228, 1.729885, 0.1713932, 1, 0, 0, 1, 1,
-1.052124, -1.300287, -2.833861, 1, 0, 0, 1, 1,
-1.050645, 1.139536, 0.6272998, 0, 0, 0, 1, 1,
-1.046699, -0.3125859, -1.90626, 0, 0, 0, 1, 1,
-1.04598, -1.206952, -2.088756, 0, 0, 0, 1, 1,
-1.044394, 0.2285803, -2.84047, 0, 0, 0, 1, 1,
-1.043291, -0.3183794, -1.562468, 0, 0, 0, 1, 1,
-1.040155, 0.206179, -2.824069, 0, 0, 0, 1, 1,
-1.040046, -1.523912, -3.583721, 0, 0, 0, 1, 1,
-1.033343, 0.8520024, -3.980951, 1, 1, 1, 1, 1,
-1.033047, 0.9924732, -1.495603, 1, 1, 1, 1, 1,
-1.028147, -0.564954, -1.863898, 1, 1, 1, 1, 1,
-1.024963, -0.5337704, -2.77267, 1, 1, 1, 1, 1,
-1.022113, 0.4170249, -0.8630196, 1, 1, 1, 1, 1,
-1.018687, 0.3640214, -2.341392, 1, 1, 1, 1, 1,
-1.013732, -0.05331202, -2.122406, 1, 1, 1, 1, 1,
-1.009312, 1.288045, 1.060462, 1, 1, 1, 1, 1,
-0.9982626, 0.2831796, -0.1330405, 1, 1, 1, 1, 1,
-0.9868055, 1.128521, -0.8665853, 1, 1, 1, 1, 1,
-0.9759532, -0.817284, -4.090446, 1, 1, 1, 1, 1,
-0.9696352, 1.389252, -0.7914801, 1, 1, 1, 1, 1,
-0.9676072, 0.8084294, -0.4763244, 1, 1, 1, 1, 1,
-0.9668033, 0.4816626, 0.008194827, 1, 1, 1, 1, 1,
-0.9622484, -0.6313974, -2.514697, 1, 1, 1, 1, 1,
-0.9576895, -0.6283257, -1.660256, 0, 0, 1, 1, 1,
-0.954149, 0.8487028, -0.2703255, 1, 0, 0, 1, 1,
-0.9404662, 0.613964, -1.720412, 1, 0, 0, 1, 1,
-0.9367976, -0.9856207, 0.3444488, 1, 0, 0, 1, 1,
-0.9257225, -0.4726029, -1.300436, 1, 0, 0, 1, 1,
-0.9193807, -0.2097852, 1.181136, 1, 0, 0, 1, 1,
-0.9101644, 0.1188313, -0.4114638, 0, 0, 0, 1, 1,
-0.9091934, -0.5042552, -0.5877429, 0, 0, 0, 1, 1,
-0.9040319, -0.6641371, -3.510302, 0, 0, 0, 1, 1,
-0.8990025, -0.7746548, -1.857185, 0, 0, 0, 1, 1,
-0.8974301, 1.074473, -1.498459, 0, 0, 0, 1, 1,
-0.8954848, 0.4470581, -1.768523, 0, 0, 0, 1, 1,
-0.8942284, 1.074694, -0.9951512, 0, 0, 0, 1, 1,
-0.8912904, 0.6251833, -1.573818, 1, 1, 1, 1, 1,
-0.8870282, 2.026034, -0.8821996, 1, 1, 1, 1, 1,
-0.8851407, -0.6327341, -1.742687, 1, 1, 1, 1, 1,
-0.8717899, -2.054011, -2.912021, 1, 1, 1, 1, 1,
-0.8703733, 0.668237, -1.536708, 1, 1, 1, 1, 1,
-0.8694587, 1.624443, -0.7827271, 1, 1, 1, 1, 1,
-0.8679508, -1.38504, -2.115134, 1, 1, 1, 1, 1,
-0.8650265, -0.4519552, -2.114206, 1, 1, 1, 1, 1,
-0.8610013, -1.888734, -3.468096, 1, 1, 1, 1, 1,
-0.8595046, -0.8619338, -0.6397219, 1, 1, 1, 1, 1,
-0.8591042, 0.5354783, -3.131782, 1, 1, 1, 1, 1,
-0.8551831, 1.286911, -1.475669, 1, 1, 1, 1, 1,
-0.8445777, -0.4943714, -3.191704, 1, 1, 1, 1, 1,
-0.8369146, 0.06911872, -1.542561, 1, 1, 1, 1, 1,
-0.8333104, 0.3275326, -2.616988, 1, 1, 1, 1, 1,
-0.8326758, 1.100431, -0.9583216, 0, 0, 1, 1, 1,
-0.8273708, -1.540716, -2.381708, 1, 0, 0, 1, 1,
-0.8272038, 0.7611938, -1.611642, 1, 0, 0, 1, 1,
-0.8224427, 0.696036, -2.444487, 1, 0, 0, 1, 1,
-0.8205072, 0.05101041, -1.755993, 1, 0, 0, 1, 1,
-0.8201405, -0.6355589, -1.96047, 1, 0, 0, 1, 1,
-0.8149498, 0.3368882, -1.869314, 0, 0, 0, 1, 1,
-0.8083701, -0.6166446, -1.939966, 0, 0, 0, 1, 1,
-0.8075055, 0.2917767, -0.1454992, 0, 0, 0, 1, 1,
-0.8058377, 1.044703, -0.1906814, 0, 0, 0, 1, 1,
-0.8053523, 0.2199063, 1.590945, 0, 0, 0, 1, 1,
-0.8005878, 1.660169, -1.811808, 0, 0, 0, 1, 1,
-0.7990118, -0.7493345, 0.01142287, 0, 0, 0, 1, 1,
-0.7978426, 0.2641845, -2.894258, 1, 1, 1, 1, 1,
-0.7906312, 0.9700096, -1.083626, 1, 1, 1, 1, 1,
-0.7880321, -0.94887, -2.868956, 1, 1, 1, 1, 1,
-0.7822009, -0.7883371, -3.80545, 1, 1, 1, 1, 1,
-0.7761535, -1.406666, -2.044274, 1, 1, 1, 1, 1,
-0.7743418, -1.224077, -0.5016115, 1, 1, 1, 1, 1,
-0.7736861, -1.082014, -1.914952, 1, 1, 1, 1, 1,
-0.7705314, 2.23216, -0.4558187, 1, 1, 1, 1, 1,
-0.7607139, 0.4121093, -1.608048, 1, 1, 1, 1, 1,
-0.7583084, -0.08633231, -2.757894, 1, 1, 1, 1, 1,
-0.7560971, -0.4971566, -2.181996, 1, 1, 1, 1, 1,
-0.7527448, 0.5272714, -0.9609234, 1, 1, 1, 1, 1,
-0.7515449, -0.5649185, -2.514802, 1, 1, 1, 1, 1,
-0.744593, 0.7297595, 0.3994322, 1, 1, 1, 1, 1,
-0.7426409, -1.6301, -1.689864, 1, 1, 1, 1, 1,
-0.7255112, 0.1364196, -0.3114001, 0, 0, 1, 1, 1,
-0.7253925, 0.7233842, -1.863696, 1, 0, 0, 1, 1,
-0.7108474, -0.45359, -1.248214, 1, 0, 0, 1, 1,
-0.7084382, -1.125751, -3.019255, 1, 0, 0, 1, 1,
-0.6997729, 1.469857, 0.5434775, 1, 0, 0, 1, 1,
-0.6981281, 0.4613495, -1.096951, 1, 0, 0, 1, 1,
-0.6951972, -0.1851854, -2.329747, 0, 0, 0, 1, 1,
-0.689912, 1.06523, 1.376418, 0, 0, 0, 1, 1,
-0.6879638, 0.9709281, -0.8773271, 0, 0, 0, 1, 1,
-0.6859376, -0.7810999, -1.663939, 0, 0, 0, 1, 1,
-0.6822558, 0.03435669, -0.6959689, 0, 0, 0, 1, 1,
-0.6772197, 0.7252811, 0.1680207, 0, 0, 0, 1, 1,
-0.6741819, 1.987846, -1.238329, 0, 0, 0, 1, 1,
-0.673883, 1.951267, 1.680949, 1, 1, 1, 1, 1,
-0.6710021, -1.133023, -1.908552, 1, 1, 1, 1, 1,
-0.6679363, -1.683329, -4.189925, 1, 1, 1, 1, 1,
-0.6659984, 0.07198954, 0.2737885, 1, 1, 1, 1, 1,
-0.6649154, 0.02862617, -0.5209875, 1, 1, 1, 1, 1,
-0.6641532, -0.7463812, -4.087966, 1, 1, 1, 1, 1,
-0.6638891, 1.385582, 1.246648, 1, 1, 1, 1, 1,
-0.6633263, 0.3583299, -1.106651, 1, 1, 1, 1, 1,
-0.6625695, -1.191793, -2.428518, 1, 1, 1, 1, 1,
-0.6624838, 2.438746, -0.7401016, 1, 1, 1, 1, 1,
-0.6617374, -0.5889047, -2.428445, 1, 1, 1, 1, 1,
-0.6586046, 0.833298, -1.658762, 1, 1, 1, 1, 1,
-0.6504722, -0.7965733, -2.250553, 1, 1, 1, 1, 1,
-0.6495671, -0.5824419, -3.084691, 1, 1, 1, 1, 1,
-0.6494886, 0.4156531, -1.264115, 1, 1, 1, 1, 1,
-0.6493412, 0.2574284, -1.208392, 0, 0, 1, 1, 1,
-0.6480317, -0.6520812, -1.760367, 1, 0, 0, 1, 1,
-0.6472304, 0.8068323, 1.053618, 1, 0, 0, 1, 1,
-0.6468553, 0.1123791, -0.4628884, 1, 0, 0, 1, 1,
-0.6427093, 0.8467959, -1.611021, 1, 0, 0, 1, 1,
-0.6420152, -1.568781, -2.372276, 1, 0, 0, 1, 1,
-0.6408971, 1.149734, -0.1813308, 0, 0, 0, 1, 1,
-0.6407993, 2.19717, -3.047642, 0, 0, 0, 1, 1,
-0.6387566, 1.304963, -1.721957, 0, 0, 0, 1, 1,
-0.6376486, 1.885302, -1.180317, 0, 0, 0, 1, 1,
-0.6357237, -0.7014676, -3.217983, 0, 0, 0, 1, 1,
-0.6344868, 1.308527, -0.9997944, 0, 0, 0, 1, 1,
-0.6340898, -0.2866883, -1.267313, 0, 0, 0, 1, 1,
-0.633996, -0.3403451, -2.49512, 1, 1, 1, 1, 1,
-0.6293215, 0.1798836, -2.399713, 1, 1, 1, 1, 1,
-0.6283858, -1.194322, -2.285208, 1, 1, 1, 1, 1,
-0.6261932, -0.0446069, -2.576801, 1, 1, 1, 1, 1,
-0.6255044, -0.960996, -3.857317, 1, 1, 1, 1, 1,
-0.6254511, 1.207449, -0.8487054, 1, 1, 1, 1, 1,
-0.6246703, -0.6876212, -1.333206, 1, 1, 1, 1, 1,
-0.6231055, 0.1070946, -0.1076128, 1, 1, 1, 1, 1,
-0.622447, 1.243993, -0.7036708, 1, 1, 1, 1, 1,
-0.6222756, 0.8832667, -0.1085895, 1, 1, 1, 1, 1,
-0.6117265, 0.4172003, -1.04471, 1, 1, 1, 1, 1,
-0.6088947, -0.3813201, -2.06314, 1, 1, 1, 1, 1,
-0.6065626, -0.6474956, -3.540191, 1, 1, 1, 1, 1,
-0.5991116, 1.263593, -0.6289001, 1, 1, 1, 1, 1,
-0.5981479, 0.04453304, -2.368972, 1, 1, 1, 1, 1,
-0.5959711, 1.353544, -0.2808062, 0, 0, 1, 1, 1,
-0.5943912, 0.4398782, -1.832955, 1, 0, 0, 1, 1,
-0.5922069, 0.7898113, -1.408418, 1, 0, 0, 1, 1,
-0.5882045, -0.551805, -2.01408, 1, 0, 0, 1, 1,
-0.5821488, 1.477387, 0.09885681, 1, 0, 0, 1, 1,
-0.5787445, 2.697236, -3.340961, 1, 0, 0, 1, 1,
-0.5765456, 2.369441, -2.071517, 0, 0, 0, 1, 1,
-0.5746368, 0.8367491, -0.6878692, 0, 0, 0, 1, 1,
-0.5691463, 0.07499003, -2.495361, 0, 0, 0, 1, 1,
-0.5628881, -0.2952869, -2.510539, 0, 0, 0, 1, 1,
-0.554754, 1.520731, -0.06945525, 0, 0, 0, 1, 1,
-0.5462161, -0.6542256, -4.368824, 0, 0, 0, 1, 1,
-0.5443623, 0.6019987, 0.1259712, 0, 0, 0, 1, 1,
-0.5439227, 0.8220347, -0.008360928, 1, 1, 1, 1, 1,
-0.5413837, -1.284597, -2.482167, 1, 1, 1, 1, 1,
-0.5413346, 1.800601, -1.452883, 1, 1, 1, 1, 1,
-0.5391069, 0.4752302, -0.5858113, 1, 1, 1, 1, 1,
-0.5389262, 0.2607281, 0.08734271, 1, 1, 1, 1, 1,
-0.5367215, -1.589869, -2.173244, 1, 1, 1, 1, 1,
-0.5329135, -1.172639, -3.845369, 1, 1, 1, 1, 1,
-0.5294893, 1.235531, 0.3912059, 1, 1, 1, 1, 1,
-0.5194013, 0.005532782, -2.349771, 1, 1, 1, 1, 1,
-0.5180982, -0.9320379, -2.884417, 1, 1, 1, 1, 1,
-0.5138035, 0.4411321, -0.9175154, 1, 1, 1, 1, 1,
-0.508906, -1.309653, -3.13504, 1, 1, 1, 1, 1,
-0.508808, 1.128334, 0.1414482, 1, 1, 1, 1, 1,
-0.5056767, -0.3871419, -3.648831, 1, 1, 1, 1, 1,
-0.501015, 0.6442515, -0.6848705, 1, 1, 1, 1, 1,
-0.4933651, 0.1692712, -0.5825557, 0, 0, 1, 1, 1,
-0.4891574, -0.851075, -4.152059, 1, 0, 0, 1, 1,
-0.4861925, 0.9769375, -0.731774, 1, 0, 0, 1, 1,
-0.4814929, 0.5775623, -1.156975, 1, 0, 0, 1, 1,
-0.4802596, -0.21357, -2.817259, 1, 0, 0, 1, 1,
-0.4774278, -0.36234, -2.593251, 1, 0, 0, 1, 1,
-0.4755483, -0.2340149, -1.116876, 0, 0, 0, 1, 1,
-0.4724875, -0.4402391, -2.396499, 0, 0, 0, 1, 1,
-0.4716071, -0.9691268, -2.407997, 0, 0, 0, 1, 1,
-0.4658273, 0.5210421, -1.391786, 0, 0, 0, 1, 1,
-0.4611068, 0.6551126, 0.5563866, 0, 0, 0, 1, 1,
-0.4592601, 0.9556495, 0.0438327, 0, 0, 0, 1, 1,
-0.4580984, 1.259232, -1.329267, 0, 0, 0, 1, 1,
-0.457735, 0.4409783, -2.351661, 1, 1, 1, 1, 1,
-0.4536748, 0.6188512, -0.2530299, 1, 1, 1, 1, 1,
-0.4510404, 0.3909332, -0.5208597, 1, 1, 1, 1, 1,
-0.4479499, 1.440766, 0.5609722, 1, 1, 1, 1, 1,
-0.4477855, 1.921952, 0.6832868, 1, 1, 1, 1, 1,
-0.4470384, -0.4575213, -1.000336, 1, 1, 1, 1, 1,
-0.4462309, -1.015497, -1.885676, 1, 1, 1, 1, 1,
-0.4425808, 0.3551684, -0.1233616, 1, 1, 1, 1, 1,
-0.442504, 1.241267, -1.126201, 1, 1, 1, 1, 1,
-0.4398313, 0.8721972, 0.6310225, 1, 1, 1, 1, 1,
-0.4383866, -0.5125256, -2.077758, 1, 1, 1, 1, 1,
-0.4356608, 1.803939, -0.03699873, 1, 1, 1, 1, 1,
-0.431706, -1.38364, -2.929967, 1, 1, 1, 1, 1,
-0.4284507, -0.09959983, -2.782616, 1, 1, 1, 1, 1,
-0.4274063, 1.050814, 1.210818, 1, 1, 1, 1, 1,
-0.4240476, -0.2529289, -3.661296, 0, 0, 1, 1, 1,
-0.4221282, -3.462388, -4.127064, 1, 0, 0, 1, 1,
-0.4217199, 0.7201571, -1.038042, 1, 0, 0, 1, 1,
-0.4190586, -0.2192509, -1.846291, 1, 0, 0, 1, 1,
-0.4172062, -0.7798874, -2.808406, 1, 0, 0, 1, 1,
-0.4152187, -0.1021177, -0.8232468, 1, 0, 0, 1, 1,
-0.4144791, 0.03150797, -1.395768, 0, 0, 0, 1, 1,
-0.4143296, -1.068344, -2.542761, 0, 0, 0, 1, 1,
-0.4122263, -1.797312, -3.578809, 0, 0, 0, 1, 1,
-0.4100911, -1.046208, -3.472941, 0, 0, 0, 1, 1,
-0.4037887, 0.06219783, -2.22257, 0, 0, 0, 1, 1,
-0.3995889, -0.6477278, -2.919608, 0, 0, 0, 1, 1,
-0.3960643, -1.015604, -3.105702, 0, 0, 0, 1, 1,
-0.3930775, 0.8309723, -0.04891199, 1, 1, 1, 1, 1,
-0.3920243, 0.7362775, -0.8483899, 1, 1, 1, 1, 1,
-0.3859991, 1.507006, -2.232852, 1, 1, 1, 1, 1,
-0.3826487, 0.5628244, -0.2439816, 1, 1, 1, 1, 1,
-0.3773114, -0.3125056, -1.804527, 1, 1, 1, 1, 1,
-0.3726771, 0.05199577, -0.5881746, 1, 1, 1, 1, 1,
-0.3685237, 1.850099, -0.6913421, 1, 1, 1, 1, 1,
-0.3663685, -0.1157748, -0.02210644, 1, 1, 1, 1, 1,
-0.3616292, -0.7148605, -2.422267, 1, 1, 1, 1, 1,
-0.3558344, -0.9335629, -2.248055, 1, 1, 1, 1, 1,
-0.3521179, 0.3409701, -1.279989, 1, 1, 1, 1, 1,
-0.3514616, -0.8704846, -2.090558, 1, 1, 1, 1, 1,
-0.3509118, 1.231836, 0.9086393, 1, 1, 1, 1, 1,
-0.3496694, 0.332674, -0.7835749, 1, 1, 1, 1, 1,
-0.3454679, -1.512766, -1.808927, 1, 1, 1, 1, 1,
-0.3394794, -0.2560834, -1.278973, 0, 0, 1, 1, 1,
-0.3311048, 0.8415743, -2.002641, 1, 0, 0, 1, 1,
-0.3201664, 1.174014, -0.2187768, 1, 0, 0, 1, 1,
-0.3171285, 0.4061947, 0.7003525, 1, 0, 0, 1, 1,
-0.3158946, 0.3411939, -0.4486662, 1, 0, 0, 1, 1,
-0.3104601, 0.3305997, -0.05501066, 1, 0, 0, 1, 1,
-0.3080913, -0.7438025, -2.613688, 0, 0, 0, 1, 1,
-0.3008603, -0.6694912, -2.020301, 0, 0, 0, 1, 1,
-0.3001275, 0.06848638, -0.6805338, 0, 0, 0, 1, 1,
-0.3000298, -0.02199914, -2.567574, 0, 0, 0, 1, 1,
-0.2966949, 1.009344, -0.2405796, 0, 0, 0, 1, 1,
-0.2937663, -1.099726, -2.569325, 0, 0, 0, 1, 1,
-0.2934787, 0.5895028, 0.8886495, 0, 0, 0, 1, 1,
-0.2921751, 0.3276347, -0.684049, 1, 1, 1, 1, 1,
-0.2877541, -1.323676, -2.50371, 1, 1, 1, 1, 1,
-0.2869328, 0.6978458, 1.379955, 1, 1, 1, 1, 1,
-0.2787585, -0.1079288, -2.943099, 1, 1, 1, 1, 1,
-0.2770947, -0.6485001, -2.256129, 1, 1, 1, 1, 1,
-0.2746635, 1.133287, -0.4783901, 1, 1, 1, 1, 1,
-0.2727309, 0.4015501, -1.138773, 1, 1, 1, 1, 1,
-0.2691447, 0.3109726, -2.211296, 1, 1, 1, 1, 1,
-0.2657986, 0.3091807, -0.9609714, 1, 1, 1, 1, 1,
-0.2632494, 1.004044, -0.3523737, 1, 1, 1, 1, 1,
-0.2607279, 0.4622434, 0.4327096, 1, 1, 1, 1, 1,
-0.2576013, 0.3360432, 0.7655926, 1, 1, 1, 1, 1,
-0.256502, -0.504045, -3.692927, 1, 1, 1, 1, 1,
-0.2457451, 0.5758182, 0.5343605, 1, 1, 1, 1, 1,
-0.2437289, 0.1569997, -0.9742905, 1, 1, 1, 1, 1,
-0.2420093, -0.7471771, -1.526606, 0, 0, 1, 1, 1,
-0.2412642, 0.9924327, 1.108644, 1, 0, 0, 1, 1,
-0.2411946, 0.3665912, -1.210132, 1, 0, 0, 1, 1,
-0.238695, 0.2769912, -3.012457, 1, 0, 0, 1, 1,
-0.2373594, 0.1147538, 0.2300729, 1, 0, 0, 1, 1,
-0.2306224, -0.8756884, -4.720376, 1, 0, 0, 1, 1,
-0.2289833, -0.6553083, -3.195667, 0, 0, 0, 1, 1,
-0.2288979, -0.7257992, -2.516341, 0, 0, 0, 1, 1,
-0.2269895, -0.3057576, -2.150799, 0, 0, 0, 1, 1,
-0.2234116, -0.8730258, -2.38641, 0, 0, 0, 1, 1,
-0.2196116, 0.7429758, 0.747539, 0, 0, 0, 1, 1,
-0.2191532, -0.5961385, -2.485401, 0, 0, 0, 1, 1,
-0.2135573, 0.7204494, -2.099682, 0, 0, 0, 1, 1,
-0.2092981, -0.05210844, -3.508144, 1, 1, 1, 1, 1,
-0.2067947, 0.8449364, -0.6561859, 1, 1, 1, 1, 1,
-0.2054295, -1.079089, -1.260924, 1, 1, 1, 1, 1,
-0.2027557, 0.1305744, -3.056057, 1, 1, 1, 1, 1,
-0.2025131, 2.294867, -0.2881793, 1, 1, 1, 1, 1,
-0.1994097, 1.186277, -0.5016383, 1, 1, 1, 1, 1,
-0.1991901, -1.745688, -3.53749, 1, 1, 1, 1, 1,
-0.1963011, 1.50722, 1.258049, 1, 1, 1, 1, 1,
-0.1944574, -1.625232, -3.613624, 1, 1, 1, 1, 1,
-0.1943568, -1.179847, -2.579997, 1, 1, 1, 1, 1,
-0.1917168, -1.230587, -1.592892, 1, 1, 1, 1, 1,
-0.1875455, 0.08414111, -3.789493, 1, 1, 1, 1, 1,
-0.1874131, -0.08253365, -2.576217, 1, 1, 1, 1, 1,
-0.1849335, 1.071885, 0.218529, 1, 1, 1, 1, 1,
-0.1809291, 0.9533842, -1.410905, 1, 1, 1, 1, 1,
-0.1799571, -1.005951, -2.086293, 0, 0, 1, 1, 1,
-0.1743126, 1.499394, 1.396419, 1, 0, 0, 1, 1,
-0.1740815, 1.590812, -0.299473, 1, 0, 0, 1, 1,
-0.1682986, -0.9692331, -2.606137, 1, 0, 0, 1, 1,
-0.1671049, -0.9368797, -1.773546, 1, 0, 0, 1, 1,
-0.1665715, -0.3262707, -2.644084, 1, 0, 0, 1, 1,
-0.1638145, -2.291176, -4.653918, 0, 0, 0, 1, 1,
-0.1632161, 0.4744489, -1.42016, 0, 0, 0, 1, 1,
-0.1618179, 0.5681887, 1.315871, 0, 0, 0, 1, 1,
-0.1595653, 2.359645, 1.538292, 0, 0, 0, 1, 1,
-0.1566926, -0.6977344, -2.910774, 0, 0, 0, 1, 1,
-0.1550513, -0.8831446, -4.30017, 0, 0, 0, 1, 1,
-0.1549649, 0.1680889, -1.034636, 0, 0, 0, 1, 1,
-0.1536815, -0.1604968, -2.480515, 1, 1, 1, 1, 1,
-0.151684, 1.85241, -1.620104, 1, 1, 1, 1, 1,
-0.1502136, -0.09816817, -0.392875, 1, 1, 1, 1, 1,
-0.1482989, 0.2387825, -0.4691489, 1, 1, 1, 1, 1,
-0.1442889, -0.6676769, -2.992077, 1, 1, 1, 1, 1,
-0.1390918, -1.044554, -1.830186, 1, 1, 1, 1, 1,
-0.1390502, 0.3968706, -0.660771, 1, 1, 1, 1, 1,
-0.1381523, -2.017063, -4.943543, 1, 1, 1, 1, 1,
-0.1371048, -0.06314966, -3.667649, 1, 1, 1, 1, 1,
-0.1302168, -1.156928, -4.618353, 1, 1, 1, 1, 1,
-0.1296648, -0.4885908, -1.130417, 1, 1, 1, 1, 1,
-0.1280809, -0.5874575, -2.429281, 1, 1, 1, 1, 1,
-0.127132, -0.8434247, -3.298024, 1, 1, 1, 1, 1,
-0.1254498, 0.4459161, 0.2654964, 1, 1, 1, 1, 1,
-0.1250159, 1.545991, -0.4071958, 1, 1, 1, 1, 1,
-0.1182554, 0.3994192, -0.8254623, 0, 0, 1, 1, 1,
-0.116796, -1.738116, -3.42429, 1, 0, 0, 1, 1,
-0.1120891, 0.8042204, -0.1158394, 1, 0, 0, 1, 1,
-0.1086958, 0.668598, -0.5953217, 1, 0, 0, 1, 1,
-0.1010351, -0.04285857, -2.936579, 1, 0, 0, 1, 1,
-0.1006245, -1.713412, -1.888716, 1, 0, 0, 1, 1,
-0.09998419, 0.6602327, -0.09206682, 0, 0, 0, 1, 1,
-0.09420568, 0.1344684, -0.3019264, 0, 0, 0, 1, 1,
-0.09401376, -0.7830704, -3.982337, 0, 0, 0, 1, 1,
-0.08519369, 0.04549096, 0.01137705, 0, 0, 0, 1, 1,
-0.07899392, -0.233561, -3.581818, 0, 0, 0, 1, 1,
-0.07898788, -0.8102498, -2.198249, 0, 0, 0, 1, 1,
-0.07737193, -1.390543, -1.765117, 0, 0, 0, 1, 1,
-0.07700285, 0.7295465, 0.4007906, 1, 1, 1, 1, 1,
-0.07539143, 0.3024822, -1.089737, 1, 1, 1, 1, 1,
-0.05962472, -1.624653, -2.346043, 1, 1, 1, 1, 1,
-0.0580456, -0.9874512, -1.685697, 1, 1, 1, 1, 1,
-0.0568192, -0.1536784, -3.243685, 1, 1, 1, 1, 1,
-0.05574432, -0.5578514, -0.5073658, 1, 1, 1, 1, 1,
-0.05510847, 2.972222, 0.6877815, 1, 1, 1, 1, 1,
-0.05412833, 0.6041331, -0.0811708, 1, 1, 1, 1, 1,
-0.04980092, 0.1868778, 0.5228896, 1, 1, 1, 1, 1,
-0.04907751, -0.7530805, -2.515851, 1, 1, 1, 1, 1,
-0.04766969, -0.1530684, -2.907502, 1, 1, 1, 1, 1,
-0.0456843, 0.2984197, 0.1612746, 1, 1, 1, 1, 1,
-0.04390631, -0.4948922, -4.33422, 1, 1, 1, 1, 1,
-0.04353813, -0.1162329, -4.359901, 1, 1, 1, 1, 1,
-0.0430761, -1.732941, -3.415, 1, 1, 1, 1, 1,
-0.03903786, 1.697382, -0.5279905, 0, 0, 1, 1, 1,
-0.03366722, -1.208127, -2.684104, 1, 0, 0, 1, 1,
-0.02862336, 0.2611742, -0.4506207, 1, 0, 0, 1, 1,
-0.0258267, -1.518297, -3.265491, 1, 0, 0, 1, 1,
-0.01974368, -1.519725, -2.692448, 1, 0, 0, 1, 1,
-0.01854657, -1.613356, -2.800489, 1, 0, 0, 1, 1,
-0.01362353, 1.098916, -0.4582434, 0, 0, 0, 1, 1,
-0.01119298, -1.212334, -2.584892, 0, 0, 0, 1, 1,
-0.01007063, 0.9213723, -1.050787, 0, 0, 0, 1, 1,
-0.009891599, 0.1924439, -0.4743031, 0, 0, 0, 1, 1,
-0.008342118, 1.157048, -0.7029347, 0, 0, 0, 1, 1,
-0.007213144, 0.3944092, 1.507602, 0, 0, 0, 1, 1,
-0.000107729, 0.5745451, 0.7253028, 0, 0, 0, 1, 1,
0.000295624, -1.026625, 4.084603, 1, 1, 1, 1, 1,
0.011422, -1.206032, 2.251646, 1, 1, 1, 1, 1,
0.01552503, -0.1384464, 3.419276, 1, 1, 1, 1, 1,
0.01675189, 1.024965, 0.3435232, 1, 1, 1, 1, 1,
0.0168433, 1.327483, -0.2166634, 1, 1, 1, 1, 1,
0.01760553, 0.1109597, 1.148909, 1, 1, 1, 1, 1,
0.01767465, 1.385566, -1.454132, 1, 1, 1, 1, 1,
0.01886655, 0.9480254, -0.4659674, 1, 1, 1, 1, 1,
0.02013919, 1.339967, 0.637274, 1, 1, 1, 1, 1,
0.02035854, -0.4172101, 3.761096, 1, 1, 1, 1, 1,
0.02339371, 0.8968502, -0.9171471, 1, 1, 1, 1, 1,
0.02932289, 0.4267789, 0.9423668, 1, 1, 1, 1, 1,
0.0322809, -0.5131965, 4.424495, 1, 1, 1, 1, 1,
0.03252055, -1.53445, 2.902621, 1, 1, 1, 1, 1,
0.03471104, 2.15665, 1.551847, 1, 1, 1, 1, 1,
0.04198264, 0.5431476, 0.5737, 0, 0, 1, 1, 1,
0.04563806, -1.995721, 4.105066, 1, 0, 0, 1, 1,
0.04602348, -0.006745874, 3.508409, 1, 0, 0, 1, 1,
0.04860955, 0.9668413, -0.5156063, 1, 0, 0, 1, 1,
0.05207276, 0.2367009, -0.04495335, 1, 0, 0, 1, 1,
0.05736086, 0.5951319, -0.7014869, 1, 0, 0, 1, 1,
0.0584191, 0.690048, 1.559124, 0, 0, 0, 1, 1,
0.06316526, -0.05037782, 2.759664, 0, 0, 0, 1, 1,
0.06525753, -0.4903355, 3.858505, 0, 0, 0, 1, 1,
0.06940459, -0.638019, 3.635694, 0, 0, 0, 1, 1,
0.07097061, -0.3161399, 2.268577, 0, 0, 0, 1, 1,
0.07098877, -0.07147455, 3.461255, 0, 0, 0, 1, 1,
0.08282137, -0.3123909, 2.861935, 0, 0, 0, 1, 1,
0.08505441, -0.3821324, 2.579815, 1, 1, 1, 1, 1,
0.08648922, -0.8824067, 3.832116, 1, 1, 1, 1, 1,
0.08791599, -0.3002985, 2.475468, 1, 1, 1, 1, 1,
0.08813279, 0.2273339, 0.5968971, 1, 1, 1, 1, 1,
0.08970444, 0.3359203, -0.7441551, 1, 1, 1, 1, 1,
0.09020232, 0.06603453, 1.199635, 1, 1, 1, 1, 1,
0.09078632, 2.469856, 0.857339, 1, 1, 1, 1, 1,
0.09584451, -0.2683301, 3.988252, 1, 1, 1, 1, 1,
0.09745199, 0.2734476, 0.4703799, 1, 1, 1, 1, 1,
0.1024432, -0.02913701, 0.7078269, 1, 1, 1, 1, 1,
0.1068246, 0.631613, -0.6046567, 1, 1, 1, 1, 1,
0.1119379, -1.3553, 1.601183, 1, 1, 1, 1, 1,
0.1124545, 0.8755277, 0.3685683, 1, 1, 1, 1, 1,
0.1151061, -0.8415061, 1.692184, 1, 1, 1, 1, 1,
0.1210036, 1.087597, 0.1718273, 1, 1, 1, 1, 1,
0.1212383, -2.050649, 2.354325, 0, 0, 1, 1, 1,
0.1282427, 0.9450448, 1.348583, 1, 0, 0, 1, 1,
0.128826, 0.03776496, 1.656698, 1, 0, 0, 1, 1,
0.1292759, -0.1644424, 2.152847, 1, 0, 0, 1, 1,
0.1294326, -1.001005, 3.377302, 1, 0, 0, 1, 1,
0.1320974, -1.857754, 0.9860636, 1, 0, 0, 1, 1,
0.1354069, -2.04505, 2.858204, 0, 0, 0, 1, 1,
0.1397133, -0.1412649, 3.717794, 0, 0, 0, 1, 1,
0.14, 1.425082, -0.8357237, 0, 0, 0, 1, 1,
0.1410519, -0.1184166, 2.771339, 0, 0, 0, 1, 1,
0.1434257, 0.8645896, 0.8263533, 0, 0, 0, 1, 1,
0.1472661, 1.109685, -1.1675, 0, 0, 0, 1, 1,
0.1522765, -1.21949, 4.218425, 0, 0, 0, 1, 1,
0.1575482, -0.7768472, 2.932004, 1, 1, 1, 1, 1,
0.1585372, 0.1477538, -1.064377, 1, 1, 1, 1, 1,
0.1593369, -0.7430571, 4.635057, 1, 1, 1, 1, 1,
0.1637343, -0.04056538, 2.663444, 1, 1, 1, 1, 1,
0.1641257, -0.6426963, 1.524713, 1, 1, 1, 1, 1,
0.1653569, 1.375645, 1.033551, 1, 1, 1, 1, 1,
0.1658748, 0.4444633, 1.813436, 1, 1, 1, 1, 1,
0.1666541, 0.3702943, -0.193932, 1, 1, 1, 1, 1,
0.1693729, -1.390945, 2.431597, 1, 1, 1, 1, 1,
0.1702646, -2.50379, 3.097092, 1, 1, 1, 1, 1,
0.1713018, 0.8383127, 0.03884555, 1, 1, 1, 1, 1,
0.1742154, -0.2874762, 0.4021943, 1, 1, 1, 1, 1,
0.1770095, 0.6968641, 0.3805962, 1, 1, 1, 1, 1,
0.1785066, 0.7925736, -1.096172, 1, 1, 1, 1, 1,
0.1804173, 0.1270146, 1.902332, 1, 1, 1, 1, 1,
0.1814881, -0.7885501, 0.6096464, 0, 0, 1, 1, 1,
0.1817877, -0.4685112, 2.308978, 1, 0, 0, 1, 1,
0.1838106, 0.1416786, -0.0929224, 1, 0, 0, 1, 1,
0.1868644, -0.4795601, 3.799303, 1, 0, 0, 1, 1,
0.1872547, 0.3410974, 1.583927, 1, 0, 0, 1, 1,
0.187367, -0.3369971, 2.241936, 1, 0, 0, 1, 1,
0.1889212, 2.081279, -0.8022202, 0, 0, 0, 1, 1,
0.1906894, 1.757127, 0.4437008, 0, 0, 0, 1, 1,
0.1952787, -0.2384687, 2.034153, 0, 0, 0, 1, 1,
0.2019366, -0.108385, 3.157522, 0, 0, 0, 1, 1,
0.202769, 0.8401566, 0.2522607, 0, 0, 0, 1, 1,
0.2044286, 0.09161528, 1.027849, 0, 0, 0, 1, 1,
0.210187, -0.5050553, 3.086883, 0, 0, 0, 1, 1,
0.2172101, 0.9048175, -0.6468709, 1, 1, 1, 1, 1,
0.2179351, 0.2519572, 1.41002, 1, 1, 1, 1, 1,
0.2186887, -0.7856028, 3.423296, 1, 1, 1, 1, 1,
0.2236751, 2.576767, 0.4202895, 1, 1, 1, 1, 1,
0.225845, -0.2808427, 3.227051, 1, 1, 1, 1, 1,
0.2304406, -1.961763, 3.439968, 1, 1, 1, 1, 1,
0.2372705, 0.6027483, 0.6677311, 1, 1, 1, 1, 1,
0.2382353, 0.04651921, 2.184894, 1, 1, 1, 1, 1,
0.2444933, -0.172139, 1.222211, 1, 1, 1, 1, 1,
0.2484706, 0.952125, -0.05210735, 1, 1, 1, 1, 1,
0.2486588, 0.8731498, 0.03846545, 1, 1, 1, 1, 1,
0.2490023, 0.7943467, 0.8168713, 1, 1, 1, 1, 1,
0.2515619, 0.8087896, 2.789422, 1, 1, 1, 1, 1,
0.2544799, 2.264269, 1.456378, 1, 1, 1, 1, 1,
0.2560483, -0.06979723, -1.542541, 1, 1, 1, 1, 1,
0.2574779, -0.1179086, 0.8382556, 0, 0, 1, 1, 1,
0.2575691, 0.3747393, 1.528544, 1, 0, 0, 1, 1,
0.2589971, -0.7304564, 3.200729, 1, 0, 0, 1, 1,
0.263311, 1.160878, 0.9359221, 1, 0, 0, 1, 1,
0.2649124, 0.2816378, -1.349609, 1, 0, 0, 1, 1,
0.2687685, 0.5478569, 1.02721, 1, 0, 0, 1, 1,
0.268902, -0.6104084, 3.682893, 0, 0, 0, 1, 1,
0.2713619, -0.1230477, 2.734184, 0, 0, 0, 1, 1,
0.2730782, -0.6866778, 3.435075, 0, 0, 0, 1, 1,
0.2734799, -0.3753724, 2.510032, 0, 0, 0, 1, 1,
0.2755364, 0.4316164, 0.5657186, 0, 0, 0, 1, 1,
0.2802431, -0.5634342, 1.353947, 0, 0, 0, 1, 1,
0.2813225, 0.8608627, -0.4389572, 0, 0, 0, 1, 1,
0.2826906, -1.064145, 4.830381, 1, 1, 1, 1, 1,
0.2836159, -1.204911, 2.276227, 1, 1, 1, 1, 1,
0.2848007, 0.5314223, 0.1072395, 1, 1, 1, 1, 1,
0.2880382, -0.1035478, 0.7889537, 1, 1, 1, 1, 1,
0.2938429, 0.9665417, -1.799451, 1, 1, 1, 1, 1,
0.2947824, -2.640423, 3.046792, 1, 1, 1, 1, 1,
0.2958291, 0.8754494, 1.126757, 1, 1, 1, 1, 1,
0.2961841, -0.008310627, 2.772659, 1, 1, 1, 1, 1,
0.2982319, -0.5193875, 3.106907, 1, 1, 1, 1, 1,
0.3020965, 0.01102094, 0.05509527, 1, 1, 1, 1, 1,
0.3027611, 1.318426, 0.1608281, 1, 1, 1, 1, 1,
0.304217, -0.4477194, 3.605509, 1, 1, 1, 1, 1,
0.3053444, 1.893929, -3.799773, 1, 1, 1, 1, 1,
0.3073342, -1.332209, 1.071829, 1, 1, 1, 1, 1,
0.3086915, -0.09860481, 1.977515, 1, 1, 1, 1, 1,
0.313645, -1.044686, 0.3778846, 0, 0, 1, 1, 1,
0.3172441, 1.091426, 0.0319447, 1, 0, 0, 1, 1,
0.3218043, -1.50248, 2.33291, 1, 0, 0, 1, 1,
0.3220897, -0.1874705, 3.602229, 1, 0, 0, 1, 1,
0.3246181, -0.4089487, 3.60455, 1, 0, 0, 1, 1,
0.3272583, -0.4973545, 2.905416, 1, 0, 0, 1, 1,
0.3286294, 0.6327228, 0.4426994, 0, 0, 0, 1, 1,
0.3344747, 0.7155764, 0.9667008, 0, 0, 0, 1, 1,
0.3348063, 0.5919015, 2.219687, 0, 0, 0, 1, 1,
0.3355337, -0.7575862, 1.730835, 0, 0, 0, 1, 1,
0.3367062, 0.7566735, 1.977397, 0, 0, 0, 1, 1,
0.3386319, -0.7330945, 3.789995, 0, 0, 0, 1, 1,
0.3457226, -0.6303301, 2.803393, 0, 0, 0, 1, 1,
0.3511979, 1.086869, 0.1209163, 1, 1, 1, 1, 1,
0.3513636, 1.362313, -0.4605667, 1, 1, 1, 1, 1,
0.3521022, 0.01787891, 0.8258968, 1, 1, 1, 1, 1,
0.3539564, 0.3936065, 1.687913, 1, 1, 1, 1, 1,
0.3561809, 0.03514848, 0.7262273, 1, 1, 1, 1, 1,
0.3588134, 0.1684182, 0.8264716, 1, 1, 1, 1, 1,
0.3621529, 0.3705004, 0.3551075, 1, 1, 1, 1, 1,
0.3622313, -1.7487, 3.021639, 1, 1, 1, 1, 1,
0.3687595, -0.3073668, 2.355392, 1, 1, 1, 1, 1,
0.3745122, -0.9906479, 2.113549, 1, 1, 1, 1, 1,
0.3751955, -0.8290011, 0.6020924, 1, 1, 1, 1, 1,
0.3752773, 1.715455, 0.4155981, 1, 1, 1, 1, 1,
0.3773775, -1.147879, 3.665535, 1, 1, 1, 1, 1,
0.3783862, 0.4226278, -0.6505685, 1, 1, 1, 1, 1,
0.3833713, 0.312484, 2.700752, 1, 1, 1, 1, 1,
0.38452, -1.609217, 4.628126, 0, 0, 1, 1, 1,
0.385282, -0.9024572, 2.345431, 1, 0, 0, 1, 1,
0.3877644, 0.3036689, 1.185187, 1, 0, 0, 1, 1,
0.3882169, -0.9473205, 4.237595, 1, 0, 0, 1, 1,
0.3959365, 0.04397487, 1.308351, 1, 0, 0, 1, 1,
0.399002, -0.6195478, 2.82732, 1, 0, 0, 1, 1,
0.3998393, -0.1979295, 2.497092, 0, 0, 0, 1, 1,
0.404159, -1.184889, 3.987327, 0, 0, 0, 1, 1,
0.4048274, 1.613201, 0.1256223, 0, 0, 0, 1, 1,
0.4070052, 0.1049678, 0.8360488, 0, 0, 0, 1, 1,
0.4094486, -1.930227, 3.499042, 0, 0, 0, 1, 1,
0.4108764, 1.144149, -0.09402552, 0, 0, 0, 1, 1,
0.4134873, -0.5800397, 2.13387, 0, 0, 0, 1, 1,
0.4166797, -1.299966, 2.680937, 1, 1, 1, 1, 1,
0.4177131, 1.186897, 0.002075891, 1, 1, 1, 1, 1,
0.4177141, 0.06510621, 1.789702, 1, 1, 1, 1, 1,
0.4184206, 0.962302, 0.5791798, 1, 1, 1, 1, 1,
0.4189669, 0.2470037, 0.7499717, 1, 1, 1, 1, 1,
0.4193012, 0.1082978, 1.909168, 1, 1, 1, 1, 1,
0.4194081, -0.3124177, 0.9224273, 1, 1, 1, 1, 1,
0.4241179, 1.483078, 2.045211, 1, 1, 1, 1, 1,
0.4248686, 1.08382, -1.520716, 1, 1, 1, 1, 1,
0.4273364, 0.6261919, -1.028006, 1, 1, 1, 1, 1,
0.4310495, -0.7304158, 1.80937, 1, 1, 1, 1, 1,
0.4323494, 0.01069258, 2.320245, 1, 1, 1, 1, 1,
0.4343346, -1.087552, 2.899187, 1, 1, 1, 1, 1,
0.4412607, 0.149385, 0.2886674, 1, 1, 1, 1, 1,
0.4417587, -0.5901566, 3.171565, 1, 1, 1, 1, 1,
0.4422837, -0.4439408, 0.8567234, 0, 0, 1, 1, 1,
0.4436049, -0.9432607, 2.604587, 1, 0, 0, 1, 1,
0.4442246, 0.1883947, 1.37913, 1, 0, 0, 1, 1,
0.4442517, 1.329941, 1.258903, 1, 0, 0, 1, 1,
0.4482745, 0.6341018, -0.297401, 1, 0, 0, 1, 1,
0.4494046, 1.101715, -1.036879, 1, 0, 0, 1, 1,
0.4507316, 0.2771306, 1.642599, 0, 0, 0, 1, 1,
0.4510455, -2.383084, 3.678654, 0, 0, 0, 1, 1,
0.4524666, 0.7562993, 0.007461086, 0, 0, 0, 1, 1,
0.4553159, 0.992045, 0.4893459, 0, 0, 0, 1, 1,
0.4625064, 0.3736417, -0.1342791, 0, 0, 0, 1, 1,
0.4690837, -1.191983, 1.634988, 0, 0, 0, 1, 1,
0.4761471, -0.2235082, 2.741838, 0, 0, 0, 1, 1,
0.4794039, -0.4322659, 1.289272, 1, 1, 1, 1, 1,
0.4800398, -0.4305844, 1.13531, 1, 1, 1, 1, 1,
0.4831342, -2.311843, 3.408609, 1, 1, 1, 1, 1,
0.4850909, 1.752909, 1.582071, 1, 1, 1, 1, 1,
0.4902088, 0.3509413, 2.444278, 1, 1, 1, 1, 1,
0.4933435, 1.167249, 0.2069029, 1, 1, 1, 1, 1,
0.4943938, 0.4316749, 1.650224, 1, 1, 1, 1, 1,
0.496425, -0.6226726, 2.818871, 1, 1, 1, 1, 1,
0.4976094, -0.6022871, 2.050091, 1, 1, 1, 1, 1,
0.5011433, 0.3274817, 0.3653488, 1, 1, 1, 1, 1,
0.5055203, 0.7506412, 0.5848063, 1, 1, 1, 1, 1,
0.5115381, -0.9401451, 2.697151, 1, 1, 1, 1, 1,
0.5142261, 0.4330264, 2.130426, 1, 1, 1, 1, 1,
0.5188757, -0.1462913, 1.812777, 1, 1, 1, 1, 1,
0.5263617, -0.0692563, 1.614866, 1, 1, 1, 1, 1,
0.5292746, -1.513614, 2.628216, 0, 0, 1, 1, 1,
0.5297467, 0.5642134, 1.928931, 1, 0, 0, 1, 1,
0.5309848, -1.170137, 5.223919, 1, 0, 0, 1, 1,
0.5350788, 1.317165, -0.2742218, 1, 0, 0, 1, 1,
0.5447907, -0.009158982, 1.984479, 1, 0, 0, 1, 1,
0.5453947, 0.2555775, 1.421637, 1, 0, 0, 1, 1,
0.5487539, 0.9133673, -0.8595663, 0, 0, 0, 1, 1,
0.5535506, -1.108558, 3.374299, 0, 0, 0, 1, 1,
0.5540094, -0.8249428, 4.079845, 0, 0, 0, 1, 1,
0.554029, 0.7380385, -0.2962418, 0, 0, 0, 1, 1,
0.5547512, 0.8503335, 0.9036533, 0, 0, 0, 1, 1,
0.5558921, 1.319756, 0.7491806, 0, 0, 0, 1, 1,
0.56902, 2.036907, 0.3088725, 0, 0, 0, 1, 1,
0.573261, 0.8921067, 2.40719, 1, 1, 1, 1, 1,
0.5769648, -0.7897707, 2.800447, 1, 1, 1, 1, 1,
0.5790069, 0.3696913, 2.637334, 1, 1, 1, 1, 1,
0.579214, -1.007967, 2.723972, 1, 1, 1, 1, 1,
0.5849435, -0.5260519, 1.958474, 1, 1, 1, 1, 1,
0.5860835, 0.03534335, 2.666115, 1, 1, 1, 1, 1,
0.5872551, -1.201372, 3.20959, 1, 1, 1, 1, 1,
0.5886358, -1.651103, 1.206213, 1, 1, 1, 1, 1,
0.5904905, 0.8365037, -0.7319378, 1, 1, 1, 1, 1,
0.5953052, -0.1291461, 1.5008, 1, 1, 1, 1, 1,
0.5965629, 0.4592846, 1.02947, 1, 1, 1, 1, 1,
0.5979388, -0.9540927, 2.409465, 1, 1, 1, 1, 1,
0.5996161, 0.8517359, -0.7942821, 1, 1, 1, 1, 1,
0.6116709, 0.3099489, 1.580087, 1, 1, 1, 1, 1,
0.6176013, 0.7870116, 1.584978, 1, 1, 1, 1, 1,
0.6224661, 1.885827, 1.224719, 0, 0, 1, 1, 1,
0.6229947, 1.024825, 0.1301832, 1, 0, 0, 1, 1,
0.623186, 0.06869962, 3.369724, 1, 0, 0, 1, 1,
0.6256412, 0.4792028, -0.1986506, 1, 0, 0, 1, 1,
0.6257555, -0.08841534, 0.6382965, 1, 0, 0, 1, 1,
0.6260964, -0.20578, 1.771685, 1, 0, 0, 1, 1,
0.6262753, -2.11015, 4.897742, 0, 0, 0, 1, 1,
0.6264102, -0.8095493, 2.816531, 0, 0, 0, 1, 1,
0.6277631, 0.4368564, 0.3923672, 0, 0, 0, 1, 1,
0.6306828, -1.402562, 1.971105, 0, 0, 0, 1, 1,
0.6331249, 0.1592188, 3.078864, 0, 0, 0, 1, 1,
0.6336893, 0.2687748, 1.531339, 0, 0, 0, 1, 1,
0.6387463, 0.5844184, 0.5486679, 0, 0, 0, 1, 1,
0.6412786, -0.8502024, 1.364516, 1, 1, 1, 1, 1,
0.6416736, -0.3488463, 3.38818, 1, 1, 1, 1, 1,
0.6423486, 0.1295446, 1.898572, 1, 1, 1, 1, 1,
0.6425987, -0.1557923, 0.6655465, 1, 1, 1, 1, 1,
0.644676, 0.8642884, 0.6212705, 1, 1, 1, 1, 1,
0.6464915, -0.2420357, 2.019488, 1, 1, 1, 1, 1,
0.6492454, -2.355412, 0.3484751, 1, 1, 1, 1, 1,
0.6755403, 0.07351349, 1.387565, 1, 1, 1, 1, 1,
0.6759599, 1.204088, -0.2635905, 1, 1, 1, 1, 1,
0.6835371, 0.4600024, 3.026781, 1, 1, 1, 1, 1,
0.6878887, -0.04738269, 1.30027, 1, 1, 1, 1, 1,
0.6889857, 1.061541, 1.475566, 1, 1, 1, 1, 1,
0.6909444, -0.2754803, 1.5486, 1, 1, 1, 1, 1,
0.6991282, -1.08987, 1.691097, 1, 1, 1, 1, 1,
0.7031898, 0.07945817, 3.348237, 1, 1, 1, 1, 1,
0.708683, 0.1763057, 2.331259, 0, 0, 1, 1, 1,
0.7136592, 0.6792182, 0.02940068, 1, 0, 0, 1, 1,
0.719539, -0.6325885, 1.271316, 1, 0, 0, 1, 1,
0.7207697, 1.520052, 1.252063, 1, 0, 0, 1, 1,
0.7213894, -1.863829, 0.8625502, 1, 0, 0, 1, 1,
0.721732, -1.314759, 1.99293, 1, 0, 0, 1, 1,
0.7301137, 0.3462622, 2.443428, 0, 0, 0, 1, 1,
0.7311165, -0.9753711, 1.657357, 0, 0, 0, 1, 1,
0.7333449, -0.2807667, 2.30839, 0, 0, 0, 1, 1,
0.7346839, -1.034403, 3.909008, 0, 0, 0, 1, 1,
0.7347738, 0.8372758, 0.006918682, 0, 0, 0, 1, 1,
0.7350891, -0.05148479, 2.334013, 0, 0, 0, 1, 1,
0.7353498, 0.854233, 0.4365299, 0, 0, 0, 1, 1,
0.7401097, -1.821063, 3.159178, 1, 1, 1, 1, 1,
0.7449887, 0.7423896, 0.7549734, 1, 1, 1, 1, 1,
0.748027, 1.777363, -0.698987, 1, 1, 1, 1, 1,
0.748158, -1.360418, 3.129773, 1, 1, 1, 1, 1,
0.7504115, 0.8665901, 1.624364, 1, 1, 1, 1, 1,
0.7522302, 0.3074882, 0.05756394, 1, 1, 1, 1, 1,
0.7526174, 0.2200502, -0.01266705, 1, 1, 1, 1, 1,
0.7607538, 1.654146, -0.8961625, 1, 1, 1, 1, 1,
0.762761, -1.608258, 3.503327, 1, 1, 1, 1, 1,
0.7636868, 1.199654, 0.6827757, 1, 1, 1, 1, 1,
0.7731313, -1.771134, 2.049445, 1, 1, 1, 1, 1,
0.7752867, -0.02303897, 1.175179, 1, 1, 1, 1, 1,
0.7820276, 0.1163544, 1.910957, 1, 1, 1, 1, 1,
0.7896758, -0.6595465, 2.57844, 1, 1, 1, 1, 1,
0.7935975, -0.4938872, 4.559095, 1, 1, 1, 1, 1,
0.7936364, 0.6329569, -0.5851053, 0, 0, 1, 1, 1,
0.7943705, -0.374743, 3.62153, 1, 0, 0, 1, 1,
0.7945589, -1.45178, 2.795637, 1, 0, 0, 1, 1,
0.7948524, 1.56398, -0.6673433, 1, 0, 0, 1, 1,
0.7978716, 1.082643, 0.01718781, 1, 0, 0, 1, 1,
0.8048637, -0.05320459, 2.157125, 1, 0, 0, 1, 1,
0.8090503, -0.0009809997, 3.949531, 0, 0, 0, 1, 1,
0.812168, 0.06751172, -0.7637675, 0, 0, 0, 1, 1,
0.8166913, -0.2183929, 2.654225, 0, 0, 0, 1, 1,
0.8213871, 0.9163936, 0.8439773, 0, 0, 0, 1, 1,
0.8219025, -0.327511, 4.971903, 0, 0, 0, 1, 1,
0.8226781, -0.1119957, 1.775807, 0, 0, 0, 1, 1,
0.8242903, 0.002665625, -0.02802434, 0, 0, 0, 1, 1,
0.8275065, 0.7060437, 0.08126419, 1, 1, 1, 1, 1,
0.8299316, 1.610087, 0.1765982, 1, 1, 1, 1, 1,
0.8323867, -0.7901164, 3.004991, 1, 1, 1, 1, 1,
0.8331641, 1.62023, 0.1544479, 1, 1, 1, 1, 1,
0.8376611, 1.927304, -0.687417, 1, 1, 1, 1, 1,
0.8434768, 0.5065249, 0.8566815, 1, 1, 1, 1, 1,
0.8441175, -2.308074, 1.528248, 1, 1, 1, 1, 1,
0.8442725, 0.8281971, 0.02856071, 1, 1, 1, 1, 1,
0.8495849, 0.1361562, 2.561743, 1, 1, 1, 1, 1,
0.8521052, -0.5107107, 2.66112, 1, 1, 1, 1, 1,
0.8530648, 0.1906275, 2.054085, 1, 1, 1, 1, 1,
0.8554984, 1.270496, 0.0541622, 1, 1, 1, 1, 1,
0.8560376, -1.384196, 3.540987, 1, 1, 1, 1, 1,
0.8563296, -0.08716103, 0.5976768, 1, 1, 1, 1, 1,
0.8568578, -0.3540202, 2.120213, 1, 1, 1, 1, 1,
0.8648883, 1.205758, 0.5015631, 0, 0, 1, 1, 1,
0.8662297, 0.149964, 2.729606, 1, 0, 0, 1, 1,
0.8679373, 0.6018524, 0.9516044, 1, 0, 0, 1, 1,
0.8692277, -0.0941134, 0.9726099, 1, 0, 0, 1, 1,
0.8700157, -0.6149727, 5.101376, 1, 0, 0, 1, 1,
0.8753008, 0.6328037, 0.3476888, 1, 0, 0, 1, 1,
0.8816205, 0.9778404, 1.033689, 0, 0, 0, 1, 1,
0.8848744, 0.5812022, 1.317064, 0, 0, 0, 1, 1,
0.9081818, -0.5477857, 2.212707, 0, 0, 0, 1, 1,
0.9103, -1.159559, 2.583417, 0, 0, 0, 1, 1,
0.9113391, 0.06103301, -0.1495373, 0, 0, 0, 1, 1,
0.9118975, 0.8770175, 1.519049, 0, 0, 0, 1, 1,
0.9148404, 0.6311317, 0.269594, 0, 0, 0, 1, 1,
0.920709, 0.9349542, 0.1337752, 1, 1, 1, 1, 1,
0.9229367, 0.07141056, 1.340166, 1, 1, 1, 1, 1,
0.922981, 0.1680199, 1.02297, 1, 1, 1, 1, 1,
0.9245856, -0.2364247, 3.517815, 1, 1, 1, 1, 1,
0.9377862, -0.6515507, 2.185479, 1, 1, 1, 1, 1,
0.9465361, -0.08885892, 3.290872, 1, 1, 1, 1, 1,
0.9581503, 0.3883002, 1.394562, 1, 1, 1, 1, 1,
0.9646137, 0.4679346, 0.723354, 1, 1, 1, 1, 1,
0.9667591, -1.070303, 1.815371, 1, 1, 1, 1, 1,
0.9667998, 2.086165, -0.8146365, 1, 1, 1, 1, 1,
0.9690216, -0.2471353, 4.457125, 1, 1, 1, 1, 1,
0.97069, -0.3498647, 2.219696, 1, 1, 1, 1, 1,
0.9716889, 0.2201507, 0.7032094, 1, 1, 1, 1, 1,
0.9717987, 0.2347486, 2.068459, 1, 1, 1, 1, 1,
0.9766999, -0.5770259, 1.639551, 1, 1, 1, 1, 1,
0.9784831, -0.4180628, 1.546009, 0, 0, 1, 1, 1,
0.9793013, 0.8557347, 0.765166, 1, 0, 0, 1, 1,
0.9825673, -0.8141473, 3.459241, 1, 0, 0, 1, 1,
0.9827005, 0.7743042, 0.05276983, 1, 0, 0, 1, 1,
0.9836236, 0.6159734, -0.6107236, 1, 0, 0, 1, 1,
0.9891024, 0.4287373, 2.167591, 1, 0, 0, 1, 1,
0.9907944, -1.984197, 2.780804, 0, 0, 0, 1, 1,
0.9941556, -0.3599027, 2.163839, 0, 0, 0, 1, 1,
0.9970548, -1.169596, 2.618381, 0, 0, 0, 1, 1,
0.9987489, 0.4629927, 0.3966165, 0, 0, 0, 1, 1,
0.9992766, -1.878475, 1.636839, 0, 0, 0, 1, 1,
1.000083, 0.401683, 2.635182, 0, 0, 0, 1, 1,
1.001195, 1.451468, 2.668927, 0, 0, 0, 1, 1,
1.001469, -0.009051758, 1.472108, 1, 1, 1, 1, 1,
1.009386, 0.9958454, 1.163939, 1, 1, 1, 1, 1,
1.009743, -1.338188, 2.020805, 1, 1, 1, 1, 1,
1.018408, 0.740589, 2.018466, 1, 1, 1, 1, 1,
1.024955, -0.2953142, 1.214598, 1, 1, 1, 1, 1,
1.029471, 1.272484, -0.1474952, 1, 1, 1, 1, 1,
1.036713, -0.5133691, 1.650669, 1, 1, 1, 1, 1,
1.037367, 0.0446739, 2.061665, 1, 1, 1, 1, 1,
1.038923, 0.8167409, 0.8773457, 1, 1, 1, 1, 1,
1.040741, -0.1217294, 1.127798, 1, 1, 1, 1, 1,
1.044365, -0.523149, 3.794785, 1, 1, 1, 1, 1,
1.047737, -1.102516, 2.659739, 1, 1, 1, 1, 1,
1.050961, -0.7938315, 1.894583, 1, 1, 1, 1, 1,
1.058799, -0.4313377, 2.510748, 1, 1, 1, 1, 1,
1.063354, -0.5519112, 1.724089, 1, 1, 1, 1, 1,
1.063504, 0.09746662, 3.049826, 0, 0, 1, 1, 1,
1.065024, -0.5282078, 1.734867, 1, 0, 0, 1, 1,
1.08281, -1.722056, 2.496131, 1, 0, 0, 1, 1,
1.085023, -0.01535842, 1.98982, 1, 0, 0, 1, 1,
1.085476, 0.682068, 2.057533, 1, 0, 0, 1, 1,
1.090002, 0.6754942, -0.5660279, 1, 0, 0, 1, 1,
1.092304, 1.753371, 0.01082317, 0, 0, 0, 1, 1,
1.098481, 1.093767, 0.3272912, 0, 0, 0, 1, 1,
1.100919, -1.293585, 1.592731, 0, 0, 0, 1, 1,
1.105089, -1.117887, 2.684068, 0, 0, 0, 1, 1,
1.110603, 0.2809421, -0.2979939, 0, 0, 0, 1, 1,
1.11323, -0.8959784, 1.800903, 0, 0, 0, 1, 1,
1.119675, -0.7151931, 0.8155743, 0, 0, 0, 1, 1,
1.122358, -0.7784385, 2.106688, 1, 1, 1, 1, 1,
1.127592, 0.9920692, 1.666833, 1, 1, 1, 1, 1,
1.132484, 0.2908214, -0.8517973, 1, 1, 1, 1, 1,
1.134104, 1.090404, 0.6752031, 1, 1, 1, 1, 1,
1.136969, -0.3925539, 1.945132, 1, 1, 1, 1, 1,
1.146052, -0.5245036, 0.7956807, 1, 1, 1, 1, 1,
1.155771, -0.6501737, 1.466663, 1, 1, 1, 1, 1,
1.158278, 1.400354, -0.6260356, 1, 1, 1, 1, 1,
1.158523, 2.996663, 1.244442, 1, 1, 1, 1, 1,
1.160393, 0.01048277, 1.129331, 1, 1, 1, 1, 1,
1.171501, -0.657863, 2.824724, 1, 1, 1, 1, 1,
1.178037, 0.1528736, 1.416425, 1, 1, 1, 1, 1,
1.179355, 0.6080046, 0.4158432, 1, 1, 1, 1, 1,
1.180639, 0.02976155, 0.9319682, 1, 1, 1, 1, 1,
1.182369, 0.2317156, 1.010433, 1, 1, 1, 1, 1,
1.184729, -0.02669984, 2.852659, 0, 0, 1, 1, 1,
1.193933, 0.02956979, 2.663015, 1, 0, 0, 1, 1,
1.2078, 0.5457039, 2.39169, 1, 0, 0, 1, 1,
1.21264, -0.5411968, 1.925151, 1, 0, 0, 1, 1,
1.217006, 0.7202341, 0.1239386, 1, 0, 0, 1, 1,
1.219756, -0.620357, 0.9470265, 1, 0, 0, 1, 1,
1.221447, -0.4641389, 1.103612, 0, 0, 0, 1, 1,
1.234083, 0.3853967, 0.667115, 0, 0, 0, 1, 1,
1.249959, 0.8975548, 0.616677, 0, 0, 0, 1, 1,
1.253597, 0.1896873, 2.641849, 0, 0, 0, 1, 1,
1.263588, 1.382963, 1.807316, 0, 0, 0, 1, 1,
1.269992, -0.1747692, 1.688976, 0, 0, 0, 1, 1,
1.278339, -0.822683, 3.16217, 0, 0, 0, 1, 1,
1.279269, -1.809016, 2.296106, 1, 1, 1, 1, 1,
1.296521, -1.830665, 3.447703, 1, 1, 1, 1, 1,
1.30361, 0.5875973, 1.727574, 1, 1, 1, 1, 1,
1.304699, 1.75812, 2.564328, 1, 1, 1, 1, 1,
1.307877, 0.6215213, 2.196116, 1, 1, 1, 1, 1,
1.313146, 0.8457527, 1.324269, 1, 1, 1, 1, 1,
1.319448, 0.3585933, 3.139227, 1, 1, 1, 1, 1,
1.321045, 1.100226, 0.6469815, 1, 1, 1, 1, 1,
1.327897, -1.546603, 4.073249, 1, 1, 1, 1, 1,
1.34245, -1.130665, 0.6885936, 1, 1, 1, 1, 1,
1.360354, -0.1729024, 2.22088, 1, 1, 1, 1, 1,
1.371378, 0.6915336, 1.796636, 1, 1, 1, 1, 1,
1.372809, 0.2501698, 1.052069, 1, 1, 1, 1, 1,
1.383885, 0.4961014, 0.9228494, 1, 1, 1, 1, 1,
1.386734, 1.539459, -0.1921059, 1, 1, 1, 1, 1,
1.402043, 0.3482186, 2.188201, 0, 0, 1, 1, 1,
1.409378, 0.6622276, 1.360203, 1, 0, 0, 1, 1,
1.415462, 1.088035, 1.065931, 1, 0, 0, 1, 1,
1.415941, 0.5128099, 0.8227206, 1, 0, 0, 1, 1,
1.418932, -0.4793619, 1.86357, 1, 0, 0, 1, 1,
1.426306, -0.81644, 2.914237, 1, 0, 0, 1, 1,
1.427222, -0.07948816, 1.66508, 0, 0, 0, 1, 1,
1.429869, 0.749345, 0.3145918, 0, 0, 0, 1, 1,
1.455625, -0.1731444, 1.506485, 0, 0, 0, 1, 1,
1.457558, -1.290103, 2.236665, 0, 0, 0, 1, 1,
1.481251, -0.6128349, 0.506982, 0, 0, 0, 1, 1,
1.488199, 3.020045, 1.018155, 0, 0, 0, 1, 1,
1.494176, 0.9003337, 1.286038, 0, 0, 0, 1, 1,
1.494213, -0.4015482, 1.475291, 1, 1, 1, 1, 1,
1.506861, -0.1559272, -0.01785179, 1, 1, 1, 1, 1,
1.513784, 1.691767, 1.196913, 1, 1, 1, 1, 1,
1.515001, 0.08937883, 2.350918, 1, 1, 1, 1, 1,
1.528382, -0.1611353, 1.995777, 1, 1, 1, 1, 1,
1.535039, -0.4048825, 2.682403, 1, 1, 1, 1, 1,
1.544718, -1.091388, 2.10477, 1, 1, 1, 1, 1,
1.562157, -0.1685943, 2.258245, 1, 1, 1, 1, 1,
1.570256, -0.7361709, 1.555317, 1, 1, 1, 1, 1,
1.572211, -0.5140906, 1.982978, 1, 1, 1, 1, 1,
1.574276, -0.1826401, 3.409237, 1, 1, 1, 1, 1,
1.587197, -2.228904, 3.043826, 1, 1, 1, 1, 1,
1.594951, -0.709505, 3.135292, 1, 1, 1, 1, 1,
1.607256, 1.498683, 0.6092643, 1, 1, 1, 1, 1,
1.643566, 0.8301558, -0.7850299, 1, 1, 1, 1, 1,
1.672248, 0.4972033, 0.6979214, 0, 0, 1, 1, 1,
1.679647, -1.394803, 1.281969, 1, 0, 0, 1, 1,
1.68783, 0.3755349, 0.7812821, 1, 0, 0, 1, 1,
1.73539, 0.5799904, 0.8877775, 1, 0, 0, 1, 1,
1.746868, -0.7372588, 0.3591169, 1, 0, 0, 1, 1,
1.750987, -0.03149918, 2.286755, 1, 0, 0, 1, 1,
1.756401, 0.4004985, 1.121834, 0, 0, 0, 1, 1,
1.757442, -0.293725, -0.1604147, 0, 0, 0, 1, 1,
1.773578, 0.7981964, 1.365084, 0, 0, 0, 1, 1,
1.787588, 1.86397, 3.316993, 0, 0, 0, 1, 1,
1.827236, -1.531939, 1.013082, 0, 0, 0, 1, 1,
1.835349, -0.3870871, 2.907024, 0, 0, 0, 1, 1,
1.836899, 0.3057814, 2.032527, 0, 0, 0, 1, 1,
1.86618, -1.599974, 0.2618097, 1, 1, 1, 1, 1,
1.868286, -0.8715665, 0.5828494, 1, 1, 1, 1, 1,
1.891053, -1.365456, 2.884886, 1, 1, 1, 1, 1,
1.893626, 0.4273266, 2.712993, 1, 1, 1, 1, 1,
1.896027, 0.6346225, 0.9664909, 1, 1, 1, 1, 1,
1.904004, -0.7634732, 0.8964238, 1, 1, 1, 1, 1,
1.910637, -1.269426, 2.107826, 1, 1, 1, 1, 1,
1.936837, -0.1437821, 1.455876, 1, 1, 1, 1, 1,
1.957191, 1.103819, -0.4341802, 1, 1, 1, 1, 1,
1.961845, -0.5309212, 1.888621, 1, 1, 1, 1, 1,
1.972722, -0.4806451, 0.9583481, 1, 1, 1, 1, 1,
2.005836, -0.7252134, 2.393201, 1, 1, 1, 1, 1,
2.02194, 1.048489, 0.8048013, 1, 1, 1, 1, 1,
2.031466, 1.49441, 0.8552867, 1, 1, 1, 1, 1,
2.037176, 1.134391, 2.161801, 1, 1, 1, 1, 1,
2.047947, 0.5320596, 2.506346, 0, 0, 1, 1, 1,
2.064803, -0.2719254, 1.561943, 1, 0, 0, 1, 1,
2.118836, -0.1609605, 2.586186, 1, 0, 0, 1, 1,
2.129908, 0.9616206, 2.036918, 1, 0, 0, 1, 1,
2.145108, -0.7371678, 1.773932, 1, 0, 0, 1, 1,
2.171887, 0.5082262, 1.424588, 1, 0, 0, 1, 1,
2.205605, -0.01322944, 1.126862, 0, 0, 0, 1, 1,
2.213064, -1.52044, 0.7671638, 0, 0, 0, 1, 1,
2.22146, 1.336925, 1.88847, 0, 0, 0, 1, 1,
2.263875, 1.777592, 1.373132, 0, 0, 0, 1, 1,
2.338728, 3.740934, 0.976519, 0, 0, 0, 1, 1,
2.350418, -0.6796898, 2.25703, 0, 0, 0, 1, 1,
2.354387, -0.541836, 4.288564, 0, 0, 0, 1, 1,
2.380825, 0.5373214, 2.853488, 1, 1, 1, 1, 1,
2.46648, -0.5989093, 0.7388912, 1, 1, 1, 1, 1,
2.515881, -1.112852, 0.6399417, 1, 1, 1, 1, 1,
2.772065, 1.287699, -0.7923586, 1, 1, 1, 1, 1,
3.070462, -2.392597, 0.8262936, 1, 1, 1, 1, 1,
3.239788, -2.004603, 4.423572, 1, 1, 1, 1, 1,
3.240238, 0.07382444, 1.549606, 1, 1, 1, 1, 1
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
var radius = 9.57655;
var distance = 33.63723;
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
mvMatrix.translate( -0.2068212, -0.1392734, -0.03118896 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.63723);
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
