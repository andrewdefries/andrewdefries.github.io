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
-3.685005, 0.3445255, -1.040983, 1, 0, 0, 1,
-3.223191, -0.9558807, -1.936485, 1, 0.007843138, 0, 1,
-3.038892, 2.921102, -2.507035, 1, 0.01176471, 0, 1,
-2.862964, 0.5734541, -2.611957, 1, 0.01960784, 0, 1,
-2.820885, -2.470549, -2.361124, 1, 0.02352941, 0, 1,
-2.815864, -0.1209, 0.6360908, 1, 0.03137255, 0, 1,
-2.578227, 0.4841086, -0.5729661, 1, 0.03529412, 0, 1,
-2.574984, 0.3151641, -1.331833, 1, 0.04313726, 0, 1,
-2.524519, -1.934096, -0.270288, 1, 0.04705882, 0, 1,
-2.347211, -0.1934176, -2.233535, 1, 0.05490196, 0, 1,
-2.330191, -1.152283, -2.452958, 1, 0.05882353, 0, 1,
-2.274329, 0.8941548, -3.476349, 1, 0.06666667, 0, 1,
-2.268881, -0.2936659, -1.579087, 1, 0.07058824, 0, 1,
-2.240214, -0.8233352, -3.609538, 1, 0.07843138, 0, 1,
-2.23579, -0.2736815, -3.055371, 1, 0.08235294, 0, 1,
-2.182178, -1.515925, -3.600393, 1, 0.09019608, 0, 1,
-2.115384, 1.051095, -0.8061187, 1, 0.09411765, 0, 1,
-2.103569, -0.01973519, -2.384016, 1, 0.1019608, 0, 1,
-2.101993, 0.8223311, -1.927197, 1, 0.1098039, 0, 1,
-2.101296, 0.1787545, -0.006546599, 1, 0.1137255, 0, 1,
-2.09473, 0.5179699, -3.910932, 1, 0.1215686, 0, 1,
-2.082067, -1.524706, -1.648009, 1, 0.1254902, 0, 1,
-2.079035, -0.02578553, -1.601992, 1, 0.1333333, 0, 1,
-2.060879, 1.473017, -1.244235, 1, 0.1372549, 0, 1,
-2.057481, 2.266088, 1.322703, 1, 0.145098, 0, 1,
-2.055917, 0.9896248, -0.2377574, 1, 0.1490196, 0, 1,
-2.02358, -0.6618141, -2.308235, 1, 0.1568628, 0, 1,
-1.997062, 1.235393, 0.7397347, 1, 0.1607843, 0, 1,
-1.963738, 0.02526674, -2.129912, 1, 0.1686275, 0, 1,
-1.949015, -1.201854, -2.100984, 1, 0.172549, 0, 1,
-1.944768, -0.8898984, -1.001377, 1, 0.1803922, 0, 1,
-1.92115, 0.8268396, -2.003399, 1, 0.1843137, 0, 1,
-1.90754, 1.30005, -0.4441376, 1, 0.1921569, 0, 1,
-1.902991, 0.7117387, 1.587334, 1, 0.1960784, 0, 1,
-1.89295, 0.3908492, -1.075918, 1, 0.2039216, 0, 1,
-1.892382, 0.02851028, -1.54334, 1, 0.2117647, 0, 1,
-1.887239, -2.085861, -2.701663, 1, 0.2156863, 0, 1,
-1.873219, -1.123147, -0.6221323, 1, 0.2235294, 0, 1,
-1.869995, 0.6700171, -1.985559, 1, 0.227451, 0, 1,
-1.852739, -0.007537223, -1.309323, 1, 0.2352941, 0, 1,
-1.850835, 0.127897, -0.6571194, 1, 0.2392157, 0, 1,
-1.839368, 0.445489, -1.123593, 1, 0.2470588, 0, 1,
-1.817593, -0.334711, -0.2575451, 1, 0.2509804, 0, 1,
-1.798183, 0.4508576, -0.8880142, 1, 0.2588235, 0, 1,
-1.793899, 0.8786305, -1.798168, 1, 0.2627451, 0, 1,
-1.790498, 1.954319, -0.4443169, 1, 0.2705882, 0, 1,
-1.785187, 0.8703795, -0.7249352, 1, 0.2745098, 0, 1,
-1.783127, -0.1927198, 0.07021619, 1, 0.282353, 0, 1,
-1.782597, 1.198501, -0.9629651, 1, 0.2862745, 0, 1,
-1.771782, 1.955019, 1.16418, 1, 0.2941177, 0, 1,
-1.748849, 1.594178, -1.626221, 1, 0.3019608, 0, 1,
-1.741958, -0.7983902, -2.431604, 1, 0.3058824, 0, 1,
-1.727591, -1.027378, -2.9201, 1, 0.3137255, 0, 1,
-1.720564, 0.2582599, -1.673016, 1, 0.3176471, 0, 1,
-1.71508, 0.3481739, -0.7007591, 1, 0.3254902, 0, 1,
-1.711871, 1.237238, -1.150247, 1, 0.3294118, 0, 1,
-1.707241, -0.06742793, -2.791564, 1, 0.3372549, 0, 1,
-1.70076, -0.1480678, -0.2888298, 1, 0.3411765, 0, 1,
-1.692868, -0.9814834, -3.962378, 1, 0.3490196, 0, 1,
-1.683417, -0.8446354, -2.712378, 1, 0.3529412, 0, 1,
-1.676904, -0.9507608, -0.842555, 1, 0.3607843, 0, 1,
-1.671435, -0.301722, -3.186669, 1, 0.3647059, 0, 1,
-1.659502, 1.202325, 1.29066, 1, 0.372549, 0, 1,
-1.658473, -0.2914782, -2.211615, 1, 0.3764706, 0, 1,
-1.655576, 1.729742, 0.8918965, 1, 0.3843137, 0, 1,
-1.654094, -0.1011581, -0.6178101, 1, 0.3882353, 0, 1,
-1.652119, 0.4329065, -0.2581214, 1, 0.3960784, 0, 1,
-1.648713, 0.3847986, -1.470452, 1, 0.4039216, 0, 1,
-1.638877, 0.817679, -1.467089, 1, 0.4078431, 0, 1,
-1.608216, -0.3311757, -2.062867, 1, 0.4156863, 0, 1,
-1.590458, -1.794067, -1.894309, 1, 0.4196078, 0, 1,
-1.57891, -0.3870814, -1.733093, 1, 0.427451, 0, 1,
-1.56935, -0.3073146, -2.97077, 1, 0.4313726, 0, 1,
-1.562971, -0.9732163, -1.565867, 1, 0.4392157, 0, 1,
-1.55542, 0.6430233, 0.9537172, 1, 0.4431373, 0, 1,
-1.547998, 2.022525, -1.488288, 1, 0.4509804, 0, 1,
-1.546364, 1.129786, -2.251232, 1, 0.454902, 0, 1,
-1.538658, -1.687827, -3.228322, 1, 0.4627451, 0, 1,
-1.527296, 0.6791185, -0.9457954, 1, 0.4666667, 0, 1,
-1.524433, 0.8584271, -1.255609, 1, 0.4745098, 0, 1,
-1.523477, -2.277498, -3.130759, 1, 0.4784314, 0, 1,
-1.518696, -0.8392346, -1.98982, 1, 0.4862745, 0, 1,
-1.507509, -0.40889, -1.290229, 1, 0.4901961, 0, 1,
-1.504916, 1.810973, -0.6416742, 1, 0.4980392, 0, 1,
-1.50472, 0.06413116, -1.938973, 1, 0.5058824, 0, 1,
-1.502054, 0.2460489, -2.699661, 1, 0.509804, 0, 1,
-1.497091, -0.3823601, -2.354486, 1, 0.5176471, 0, 1,
-1.493444, 1.087761, -0.6474353, 1, 0.5215687, 0, 1,
-1.488255, 1.282448, -0.3723906, 1, 0.5294118, 0, 1,
-1.471311, -0.1356668, -2.11499, 1, 0.5333334, 0, 1,
-1.47121, -1.203355, -1.153835, 1, 0.5411765, 0, 1,
-1.448266, 1.2118, -0.5593563, 1, 0.5450981, 0, 1,
-1.444475, 0.1478182, -0.2439771, 1, 0.5529412, 0, 1,
-1.444125, -1.747571, -2.131735, 1, 0.5568628, 0, 1,
-1.427538, -1.158896, -1.811507, 1, 0.5647059, 0, 1,
-1.422389, -1.075444, -2.071465, 1, 0.5686275, 0, 1,
-1.420346, -0.936101, -2.262588, 1, 0.5764706, 0, 1,
-1.411471, -0.3286282, -1.653942, 1, 0.5803922, 0, 1,
-1.396551, -0.7675731, -3.925733, 1, 0.5882353, 0, 1,
-1.39122, 1.320462, 0.4622621, 1, 0.5921569, 0, 1,
-1.360415, 0.357097, 1.003789, 1, 0.6, 0, 1,
-1.353087, -1.534315, -2.760395, 1, 0.6078432, 0, 1,
-1.341424, -1.016201, -4.547892, 1, 0.6117647, 0, 1,
-1.341053, 0.6854172, -0.3764901, 1, 0.6196079, 0, 1,
-1.334597, 0.1414258, -0.4996295, 1, 0.6235294, 0, 1,
-1.329303, 0.5224202, -1.838985, 1, 0.6313726, 0, 1,
-1.326912, -0.626559, -2.694541, 1, 0.6352941, 0, 1,
-1.318002, 0.1776683, -2.00648, 1, 0.6431373, 0, 1,
-1.306919, 0.4841374, -1.187716, 1, 0.6470588, 0, 1,
-1.304484, -0.3714, -2.204597, 1, 0.654902, 0, 1,
-1.301545, -0.2169283, -2.739338, 1, 0.6588235, 0, 1,
-1.292568, -0.5986191, -0.8661539, 1, 0.6666667, 0, 1,
-1.291571, 2.030493, -0.306294, 1, 0.6705883, 0, 1,
-1.288175, -1.458638, -2.526409, 1, 0.6784314, 0, 1,
-1.284995, -0.5534168, -3.193063, 1, 0.682353, 0, 1,
-1.277552, 2.013293, -1.671967, 1, 0.6901961, 0, 1,
-1.276054, -0.6349627, -1.513156, 1, 0.6941177, 0, 1,
-1.272952, 0.2586989, -0.1521668, 1, 0.7019608, 0, 1,
-1.270697, 0.02860775, -2.351682, 1, 0.7098039, 0, 1,
-1.269147, 0.1138962, -1.900455, 1, 0.7137255, 0, 1,
-1.267732, -0.9142063, -2.466416, 1, 0.7215686, 0, 1,
-1.266664, 0.8884545, -2.519796, 1, 0.7254902, 0, 1,
-1.264917, -0.03280229, -0.8220925, 1, 0.7333333, 0, 1,
-1.260206, -0.787707, -3.483122, 1, 0.7372549, 0, 1,
-1.260195, -0.8900032, -2.259092, 1, 0.7450981, 0, 1,
-1.254863, -1.553153, 0.06641878, 1, 0.7490196, 0, 1,
-1.249406, -0.1521796, -0.8508155, 1, 0.7568628, 0, 1,
-1.243312, 0.4132868, -1.945544, 1, 0.7607843, 0, 1,
-1.236647, 0.158662, -2.986925, 1, 0.7686275, 0, 1,
-1.228425, -0.6189533, -4.206004, 1, 0.772549, 0, 1,
-1.225532, -0.1847417, -2.256456, 1, 0.7803922, 0, 1,
-1.216043, 0.4876567, -1.940299, 1, 0.7843137, 0, 1,
-1.215086, -1.899794, -1.857187, 1, 0.7921569, 0, 1,
-1.193202, -0.9208876, -2.018779, 1, 0.7960784, 0, 1,
-1.187199, 2.441235, 1.053227, 1, 0.8039216, 0, 1,
-1.186454, 0.1840726, -0.5827281, 1, 0.8117647, 0, 1,
-1.185712, 0.9482343, 0.7362924, 1, 0.8156863, 0, 1,
-1.179131, 0.2651423, -0.655672, 1, 0.8235294, 0, 1,
-1.174201, 0.9537273, -1.406299, 1, 0.827451, 0, 1,
-1.165056, -0.1019432, -0.1460834, 1, 0.8352941, 0, 1,
-1.159514, 0.3699749, -1.370168, 1, 0.8392157, 0, 1,
-1.151988, 1.305119, -0.6388297, 1, 0.8470588, 0, 1,
-1.146831, 1.410215, -1.762677, 1, 0.8509804, 0, 1,
-1.146636, -0.4726573, -2.573763, 1, 0.8588235, 0, 1,
-1.136854, -0.8131724, -3.697894, 1, 0.8627451, 0, 1,
-1.12557, 0.983414, 1.153222, 1, 0.8705882, 0, 1,
-1.113759, -0.6108521, -1.232285, 1, 0.8745098, 0, 1,
-1.112185, -0.0003347568, -2.077734, 1, 0.8823529, 0, 1,
-1.105887, 0.2786792, -2.526594, 1, 0.8862745, 0, 1,
-1.105661, 0.09945258, -2.084044, 1, 0.8941177, 0, 1,
-1.105523, -1.540831, -4.913915, 1, 0.8980392, 0, 1,
-1.099541, -0.2248266, -2.342178, 1, 0.9058824, 0, 1,
-1.098727, -0.1411021, -1.798016, 1, 0.9137255, 0, 1,
-1.087639, -0.3658459, -0.03926007, 1, 0.9176471, 0, 1,
-1.084618, -0.7160782, -0.9148121, 1, 0.9254902, 0, 1,
-1.083934, 1.640458, 0.34112, 1, 0.9294118, 0, 1,
-1.078735, -1.501462, -2.685827, 1, 0.9372549, 0, 1,
-1.0784, -1.180612, -2.036664, 1, 0.9411765, 0, 1,
-1.073501, -0.7797394, -3.30687, 1, 0.9490196, 0, 1,
-1.070082, 0.2246391, -1.097702, 1, 0.9529412, 0, 1,
-1.065767, 1.898283, -0.207512, 1, 0.9607843, 0, 1,
-1.064451, 0.5611749, 0.08498745, 1, 0.9647059, 0, 1,
-1.058805, -0.02086963, -1.982329, 1, 0.972549, 0, 1,
-1.057166, -0.05916795, -1.49494, 1, 0.9764706, 0, 1,
-1.057145, 0.2062486, -1.560463, 1, 0.9843137, 0, 1,
-1.047395, 0.6879734, -0.2943518, 1, 0.9882353, 0, 1,
-1.040339, -0.770775, -1.256626, 1, 0.9960784, 0, 1,
-1.039484, -0.190366, -2.747079, 0.9960784, 1, 0, 1,
-1.030791, -2.539842, -2.50284, 0.9921569, 1, 0, 1,
-1.030228, 0.1603264, -2.347105, 0.9843137, 1, 0, 1,
-1.02985, 0.224413, -3.72729, 0.9803922, 1, 0, 1,
-1.022552, -0.8907902, -4.103279, 0.972549, 1, 0, 1,
-1.020956, 0.319193, -1.948598, 0.9686275, 1, 0, 1,
-1.01502, 2.773801, 1.019077, 0.9607843, 1, 0, 1,
-1.013426, 1.121888, -0.4401254, 0.9568627, 1, 0, 1,
-1.011405, -0.3587712, -1.715563, 0.9490196, 1, 0, 1,
-1.009443, -0.536025, -2.657276, 0.945098, 1, 0, 1,
-1.007601, -1.087889, -2.629545, 0.9372549, 1, 0, 1,
-0.9972358, 1.725735, 0.05386776, 0.9333333, 1, 0, 1,
-0.9955862, 0.5283975, 1.193627, 0.9254902, 1, 0, 1,
-0.9946378, -0.08396097, -2.094079, 0.9215686, 1, 0, 1,
-0.9910304, 0.4660094, -1.411801, 0.9137255, 1, 0, 1,
-0.9890656, 2.747941, -0.7112727, 0.9098039, 1, 0, 1,
-0.9868594, 0.8149778, -0.888778, 0.9019608, 1, 0, 1,
-0.986045, 1.034976, -1.746445, 0.8941177, 1, 0, 1,
-0.9727665, 1.609659, -2.108389, 0.8901961, 1, 0, 1,
-0.9695442, 1.077906, -1.16159, 0.8823529, 1, 0, 1,
-0.9620098, -0.4429443, -3.455847, 0.8784314, 1, 0, 1,
-0.9607479, 1.852981, -1.389503, 0.8705882, 1, 0, 1,
-0.9559752, -0.0498986, -0.6915543, 0.8666667, 1, 0, 1,
-0.9555615, -0.7710576, -2.608298, 0.8588235, 1, 0, 1,
-0.9545338, -0.7580355, -0.1005965, 0.854902, 1, 0, 1,
-0.9527165, -1.763646, -2.161465, 0.8470588, 1, 0, 1,
-0.9488825, -0.6431204, -3.418713, 0.8431373, 1, 0, 1,
-0.9469994, -0.2818721, -2.935702, 0.8352941, 1, 0, 1,
-0.9438339, -2.227408, -4.7703, 0.8313726, 1, 0, 1,
-0.9431869, 0.8563378, -0.05967242, 0.8235294, 1, 0, 1,
-0.9427916, 1.752629, 0.3693607, 0.8196079, 1, 0, 1,
-0.9413508, -0.3456891, -1.766134, 0.8117647, 1, 0, 1,
-0.9412026, -1.339957, -4.093379, 0.8078431, 1, 0, 1,
-0.9379404, 1.219265, 0.8152654, 0.8, 1, 0, 1,
-0.9364404, 1.02142, -0.5382463, 0.7921569, 1, 0, 1,
-0.9324039, 0.002875602, -0.25347, 0.7882353, 1, 0, 1,
-0.9282374, -0.7652223, -2.119847, 0.7803922, 1, 0, 1,
-0.9232508, 0.4203345, -0.1464121, 0.7764706, 1, 0, 1,
-0.9177374, 0.4286461, -1.507094, 0.7686275, 1, 0, 1,
-0.9151115, 0.2215866, -1.189838, 0.7647059, 1, 0, 1,
-0.9125834, 0.519484, -2.412286, 0.7568628, 1, 0, 1,
-0.9047635, 0.3856041, 0.334098, 0.7529412, 1, 0, 1,
-0.9025716, -1.574548, -1.794351, 0.7450981, 1, 0, 1,
-0.9021498, -1.539371, -2.045487, 0.7411765, 1, 0, 1,
-0.9012277, -1.155094, -2.873272, 0.7333333, 1, 0, 1,
-0.8963773, -0.7567909, -2.389935, 0.7294118, 1, 0, 1,
-0.8930141, 0.9739257, -2.252425, 0.7215686, 1, 0, 1,
-0.891511, 0.7543301, -0.2911175, 0.7176471, 1, 0, 1,
-0.8862039, -1.113624, -0.4669968, 0.7098039, 1, 0, 1,
-0.8824832, 0.2550075, -0.993342, 0.7058824, 1, 0, 1,
-0.8801829, -0.1936571, -3.645824, 0.6980392, 1, 0, 1,
-0.8718969, 0.05397994, -1.727459, 0.6901961, 1, 0, 1,
-0.8689245, -0.553067, -2.878711, 0.6862745, 1, 0, 1,
-0.8688573, 1.495171, 1.25724, 0.6784314, 1, 0, 1,
-0.8683966, -0.991772, -0.5794755, 0.6745098, 1, 0, 1,
-0.8683786, -0.38422, 0.1637281, 0.6666667, 1, 0, 1,
-0.8651172, -0.1894596, -1.298425, 0.6627451, 1, 0, 1,
-0.8646616, -0.4891864, -0.4621781, 0.654902, 1, 0, 1,
-0.8562471, -1.170421, -2.672934, 0.6509804, 1, 0, 1,
-0.8487786, -0.6024011, -1.774025, 0.6431373, 1, 0, 1,
-0.8481079, -0.327093, -1.281336, 0.6392157, 1, 0, 1,
-0.8463731, 0.5679341, -3.83532, 0.6313726, 1, 0, 1,
-0.8447517, 1.75948, -0.08628964, 0.627451, 1, 0, 1,
-0.8434682, -0.3524906, -2.610059, 0.6196079, 1, 0, 1,
-0.836914, 1.282757, -2.032409, 0.6156863, 1, 0, 1,
-0.8348824, 0.6833745, 0.05496222, 0.6078432, 1, 0, 1,
-0.8345087, 1.566245, 0.6076553, 0.6039216, 1, 0, 1,
-0.8319279, 0.1611767, -1.758568, 0.5960785, 1, 0, 1,
-0.8252792, 1.647831, 0.5745906, 0.5882353, 1, 0, 1,
-0.8233526, 0.6337838, -2.379305, 0.5843138, 1, 0, 1,
-0.8195878, 1.04425, 0.5237381, 0.5764706, 1, 0, 1,
-0.8177161, -0.7572591, -2.799753, 0.572549, 1, 0, 1,
-0.8165387, 1.03954, -1.043299, 0.5647059, 1, 0, 1,
-0.8163601, -0.8493216, -0.9000522, 0.5607843, 1, 0, 1,
-0.8084335, 0.5737007, -2.097125, 0.5529412, 1, 0, 1,
-0.8032205, 1.214871, -1.052618, 0.5490196, 1, 0, 1,
-0.8014205, -1.793009, -3.048936, 0.5411765, 1, 0, 1,
-0.793471, 0.5617897, -1.707714, 0.5372549, 1, 0, 1,
-0.7928998, -0.4780039, -2.760712, 0.5294118, 1, 0, 1,
-0.7910889, 0.03152343, -2.006484, 0.5254902, 1, 0, 1,
-0.7905472, 1.379988, -1.207586, 0.5176471, 1, 0, 1,
-0.7900597, 0.7658067, -2.311734, 0.5137255, 1, 0, 1,
-0.7874708, -0.478127, -2.526013, 0.5058824, 1, 0, 1,
-0.7844871, 1.912493, -0.2472493, 0.5019608, 1, 0, 1,
-0.781716, -0.5133413, -3.507731, 0.4941176, 1, 0, 1,
-0.7804764, 1.960021, -1.552222, 0.4862745, 1, 0, 1,
-0.7787946, -1.960112, -1.940301, 0.4823529, 1, 0, 1,
-0.7738682, 1.79005, -0.6590346, 0.4745098, 1, 0, 1,
-0.7654212, 1.23417, -3.372743, 0.4705882, 1, 0, 1,
-0.7646514, 2.668368, -1.308513, 0.4627451, 1, 0, 1,
-0.7622464, 0.1702288, -3.955331, 0.4588235, 1, 0, 1,
-0.7615131, 0.1158192, -2.475576, 0.4509804, 1, 0, 1,
-0.7605165, -0.8849763, -1.234535, 0.4470588, 1, 0, 1,
-0.760364, 1.073291, -0.01433073, 0.4392157, 1, 0, 1,
-0.7596694, -0.3505397, -3.002653, 0.4352941, 1, 0, 1,
-0.7596523, 1.918787, -0.1092755, 0.427451, 1, 0, 1,
-0.7559078, 1.989547, -0.8601059, 0.4235294, 1, 0, 1,
-0.7550916, 0.6784217, -1.016693, 0.4156863, 1, 0, 1,
-0.7531757, -0.6864939, -4.093228, 0.4117647, 1, 0, 1,
-0.7505811, -1.741891, -0.5092836, 0.4039216, 1, 0, 1,
-0.7473854, -0.4337848, -2.669638, 0.3960784, 1, 0, 1,
-0.7472179, 1.215681, -0.7199817, 0.3921569, 1, 0, 1,
-0.7444845, -1.280231, -2.742489, 0.3843137, 1, 0, 1,
-0.7411155, -1.119611, -2.127681, 0.3803922, 1, 0, 1,
-0.7357621, -1.425523, -3.36872, 0.372549, 1, 0, 1,
-0.7348202, -0.5048599, -1.277365, 0.3686275, 1, 0, 1,
-0.7327855, -0.5318999, -4.026876, 0.3607843, 1, 0, 1,
-0.7240142, -0.4056763, -1.70919, 0.3568628, 1, 0, 1,
-0.7236921, -1.202946, -3.809295, 0.3490196, 1, 0, 1,
-0.7228838, -0.4838948, -4.889117, 0.345098, 1, 0, 1,
-0.7221361, -0.2336546, -0.0418281, 0.3372549, 1, 0, 1,
-0.7211421, 0.869887, -1.308454, 0.3333333, 1, 0, 1,
-0.7169134, 0.006008733, -2.873126, 0.3254902, 1, 0, 1,
-0.7087093, -0.2738736, -2.587409, 0.3215686, 1, 0, 1,
-0.7051862, 0.1142175, -0.8809317, 0.3137255, 1, 0, 1,
-0.7038378, 2.329768, -0.6544942, 0.3098039, 1, 0, 1,
-0.7030354, -0.5831116, -3.034597, 0.3019608, 1, 0, 1,
-0.7028695, -2.538088, -2.205979, 0.2941177, 1, 0, 1,
-0.6995457, -0.4975651, -1.759144, 0.2901961, 1, 0, 1,
-0.6878846, -1.301409, -2.70389, 0.282353, 1, 0, 1,
-0.6877739, 0.01058355, -0.6705975, 0.2784314, 1, 0, 1,
-0.6839068, -0.815759, -4.220461, 0.2705882, 1, 0, 1,
-0.6827486, 0.2803821, -0.9876458, 0.2666667, 1, 0, 1,
-0.6809183, -0.875194, -2.131289, 0.2588235, 1, 0, 1,
-0.6809118, -0.6486205, -1.442063, 0.254902, 1, 0, 1,
-0.6801327, -0.950234, -1.855512, 0.2470588, 1, 0, 1,
-0.6741061, 0.2136965, -0.8854582, 0.2431373, 1, 0, 1,
-0.6732358, 0.5979259, 0.4550396, 0.2352941, 1, 0, 1,
-0.6702746, -0.7148936, -2.097069, 0.2313726, 1, 0, 1,
-0.6691876, -0.8507363, -3.419678, 0.2235294, 1, 0, 1,
-0.6633458, 1.030162, 0.1564256, 0.2196078, 1, 0, 1,
-0.6530721, -0.1887258, 0.2421616, 0.2117647, 1, 0, 1,
-0.6522987, 0.9375476, 0.06167517, 0.2078431, 1, 0, 1,
-0.6512306, 0.4789008, -0.2422136, 0.2, 1, 0, 1,
-0.64047, 0.9839447, -0.7393384, 0.1921569, 1, 0, 1,
-0.6396906, 0.7088658, -0.836702, 0.1882353, 1, 0, 1,
-0.6387572, -0.2518135, -2.020058, 0.1803922, 1, 0, 1,
-0.6381831, 0.2618428, -2.093182, 0.1764706, 1, 0, 1,
-0.6339005, -0.7169201, -3.392537, 0.1686275, 1, 0, 1,
-0.633022, 0.7295875, -1.553513, 0.1647059, 1, 0, 1,
-0.6296446, 1.094828, -0.7638369, 0.1568628, 1, 0, 1,
-0.6267165, -0.8773245, -3.294439, 0.1529412, 1, 0, 1,
-0.6246272, -0.08634944, -1.780085, 0.145098, 1, 0, 1,
-0.6198823, -0.2556701, -1.484406, 0.1411765, 1, 0, 1,
-0.6183439, -0.4740484, -2.405851, 0.1333333, 1, 0, 1,
-0.6066266, -1.02377, -2.363714, 0.1294118, 1, 0, 1,
-0.6011803, -1.233228, -3.194271, 0.1215686, 1, 0, 1,
-0.5999217, -0.5399827, -1.180269, 0.1176471, 1, 0, 1,
-0.5957686, 0.1791902, -1.699214, 0.1098039, 1, 0, 1,
-0.5928529, -1.591743, -1.635853, 0.1058824, 1, 0, 1,
-0.5907294, 1.258722, 0.749082, 0.09803922, 1, 0, 1,
-0.5903285, -0.7478781, -2.729655, 0.09019608, 1, 0, 1,
-0.5890888, -0.6070258, -2.849644, 0.08627451, 1, 0, 1,
-0.5877396, -0.4581337, -1.348537, 0.07843138, 1, 0, 1,
-0.5863426, 0.7081007, -0.5814564, 0.07450981, 1, 0, 1,
-0.5701143, -0.8885353, -3.291206, 0.06666667, 1, 0, 1,
-0.5627673, -0.1098274, -2.903423, 0.0627451, 1, 0, 1,
-0.5602933, 0.3230551, -0.3237528, 0.05490196, 1, 0, 1,
-0.5593092, 0.3173403, 0.04330683, 0.05098039, 1, 0, 1,
-0.5587029, 1.042084, -0.3675136, 0.04313726, 1, 0, 1,
-0.5583371, -0.7665361, -2.987634, 0.03921569, 1, 0, 1,
-0.5579669, -0.5093995, -0.3795182, 0.03137255, 1, 0, 1,
-0.556232, 1.761608, -0.9631256, 0.02745098, 1, 0, 1,
-0.5550268, -1.616564, -2.592684, 0.01960784, 1, 0, 1,
-0.5400253, 0.9917619, -0.8233365, 0.01568628, 1, 0, 1,
-0.5396046, 0.1158893, -0.3758287, 0.007843138, 1, 0, 1,
-0.5390075, 1.325824, -1.741035, 0.003921569, 1, 0, 1,
-0.5353817, 1.05315, -1.497132, 0, 1, 0.003921569, 1,
-0.5348947, -0.5024453, -2.770805, 0, 1, 0.01176471, 1,
-0.5340065, 2.449344, -1.060421, 0, 1, 0.01568628, 1,
-0.5326235, 1.028596, 0.1811688, 0, 1, 0.02352941, 1,
-0.5321753, 0.2749746, -2.613242, 0, 1, 0.02745098, 1,
-0.5296127, 1.317888, -1.493769, 0, 1, 0.03529412, 1,
-0.5272391, 2.096537, -1.258654, 0, 1, 0.03921569, 1,
-0.5250674, -0.513863, -2.369876, 0, 1, 0.04705882, 1,
-0.517676, 0.09138995, -2.966917, 0, 1, 0.05098039, 1,
-0.5175713, 1.619883, 0.2888447, 0, 1, 0.05882353, 1,
-0.5140554, 0.930424, 0.1014298, 0, 1, 0.0627451, 1,
-0.5132377, 0.2016011, -2.938351, 0, 1, 0.07058824, 1,
-0.5131792, -0.6876958, -2.84412, 0, 1, 0.07450981, 1,
-0.5129644, -2.094294, -3.863723, 0, 1, 0.08235294, 1,
-0.5123971, 0.645598, -0.6608429, 0, 1, 0.08627451, 1,
-0.5118226, -1.98391, -2.899756, 0, 1, 0.09411765, 1,
-0.511723, 0.5753311, -0.4424003, 0, 1, 0.1019608, 1,
-0.5076805, -0.8543363, -4.397391, 0, 1, 0.1058824, 1,
-0.5050253, 0.8091813, 0.2808449, 0, 1, 0.1137255, 1,
-0.5020507, 0.7312484, -1.35737, 0, 1, 0.1176471, 1,
-0.501654, -0.2871849, -0.2877404, 0, 1, 0.1254902, 1,
-0.4984969, 0.6758458, 0.2706621, 0, 1, 0.1294118, 1,
-0.4972029, -0.4526632, -2.992201, 0, 1, 0.1372549, 1,
-0.4968291, -2.199278, -3.102555, 0, 1, 0.1411765, 1,
-0.4941824, -0.1422499, -0.1147743, 0, 1, 0.1490196, 1,
-0.4919693, 1.378765, -0.3158375, 0, 1, 0.1529412, 1,
-0.4891792, 0.5956987, 0.2777281, 0, 1, 0.1607843, 1,
-0.488311, 0.6195799, -0.5667593, 0, 1, 0.1647059, 1,
-0.4877624, 0.5235927, 2.019485, 0, 1, 0.172549, 1,
-0.4874301, -1.107898, -3.027256, 0, 1, 0.1764706, 1,
-0.4854008, -0.3475192, -1.939107, 0, 1, 0.1843137, 1,
-0.4846539, -2.432323, -3.559377, 0, 1, 0.1882353, 1,
-0.482429, 0.9734302, -0.003852153, 0, 1, 0.1960784, 1,
-0.4753743, 0.3933612, -0.460758, 0, 1, 0.2039216, 1,
-0.4651813, -3.410978, -2.497743, 0, 1, 0.2078431, 1,
-0.4607758, 0.94721, -0.5399969, 0, 1, 0.2156863, 1,
-0.4606609, -1.273955, -2.434342, 0, 1, 0.2196078, 1,
-0.4587612, -0.7115796, -2.730032, 0, 1, 0.227451, 1,
-0.4574713, -1.063744, -2.656283, 0, 1, 0.2313726, 1,
-0.4569383, -0.1696278, -1.220984, 0, 1, 0.2392157, 1,
-0.4520483, -1.221128, -1.160088, 0, 1, 0.2431373, 1,
-0.4519566, 1.29726, 0.8480249, 0, 1, 0.2509804, 1,
-0.4499797, -0.8279488, -5.372333, 0, 1, 0.254902, 1,
-0.4490903, -0.1712939, -1.952917, 0, 1, 0.2627451, 1,
-0.4407095, -0.1714062, -1.708682, 0, 1, 0.2666667, 1,
-0.4404653, 0.499285, -1.801067, 0, 1, 0.2745098, 1,
-0.4335707, 1.139717, -1.946937, 0, 1, 0.2784314, 1,
-0.430507, -0.4192846, -0.8133077, 0, 1, 0.2862745, 1,
-0.4290839, -0.1319489, -3.044932, 0, 1, 0.2901961, 1,
-0.4265028, -1.541175, -3.359754, 0, 1, 0.2980392, 1,
-0.4246808, -1.043786, -4.252809, 0, 1, 0.3058824, 1,
-0.4241677, -1.650715, -2.496918, 0, 1, 0.3098039, 1,
-0.4214455, -0.3725552, -3.083692, 0, 1, 0.3176471, 1,
-0.4121749, 1.015152, -1.725587, 0, 1, 0.3215686, 1,
-0.4102543, -0.4831634, -3.218621, 0, 1, 0.3294118, 1,
-0.407076, 1.726045, 0.9179809, 0, 1, 0.3333333, 1,
-0.4017024, 1.033588, 1.090701, 0, 1, 0.3411765, 1,
-0.3985017, 0.6769716, 0.6725967, 0, 1, 0.345098, 1,
-0.3960656, 0.03713536, -0.4258744, 0, 1, 0.3529412, 1,
-0.3927428, -0.5912872, -3.201064, 0, 1, 0.3568628, 1,
-0.3803821, -1.002806, -1.805677, 0, 1, 0.3647059, 1,
-0.3802733, -0.5050111, -2.277353, 0, 1, 0.3686275, 1,
-0.3785964, 1.681725, -0.5106805, 0, 1, 0.3764706, 1,
-0.3767965, 0.7284105, -1.428954, 0, 1, 0.3803922, 1,
-0.3756528, 2.307256, 0.185151, 0, 1, 0.3882353, 1,
-0.3734932, -1.830353, -2.649996, 0, 1, 0.3921569, 1,
-0.3708061, -0.3956052, -3.332608, 0, 1, 0.4, 1,
-0.3696183, 0.1552284, -0.3802685, 0, 1, 0.4078431, 1,
-0.369507, -0.2651704, -3.425767, 0, 1, 0.4117647, 1,
-0.368649, -0.4449773, -2.794544, 0, 1, 0.4196078, 1,
-0.3681136, -0.9518325, -4.613607, 0, 1, 0.4235294, 1,
-0.3678051, 0.7687048, -0.640421, 0, 1, 0.4313726, 1,
-0.3661162, 0.9800225, -1.148362, 0, 1, 0.4352941, 1,
-0.3645113, 0.1717424, -1.078579, 0, 1, 0.4431373, 1,
-0.363288, 2.057816, -0.4272294, 0, 1, 0.4470588, 1,
-0.3572775, 1.451814, 0.3829077, 0, 1, 0.454902, 1,
-0.3512706, 0.04453857, -0.7255841, 0, 1, 0.4588235, 1,
-0.3427192, 1.400448, 0.1511768, 0, 1, 0.4666667, 1,
-0.3417954, -0.1732602, -2.644396, 0, 1, 0.4705882, 1,
-0.3356774, 1.91669, -0.1954266, 0, 1, 0.4784314, 1,
-0.3304266, -1.841858, -0.9499785, 0, 1, 0.4823529, 1,
-0.3304009, 1.042268, -2.240064, 0, 1, 0.4901961, 1,
-0.3276699, -0.02574581, -1.023618, 0, 1, 0.4941176, 1,
-0.3255717, -0.4925345, -2.668884, 0, 1, 0.5019608, 1,
-0.3145345, -2.091918, -2.182483, 0, 1, 0.509804, 1,
-0.3129742, 0.2810747, -2.211859, 0, 1, 0.5137255, 1,
-0.3119755, -0.2160908, -1.421098, 0, 1, 0.5215687, 1,
-0.3119688, 0.8196953, -0.0354143, 0, 1, 0.5254902, 1,
-0.3070418, -1.591908, -3.603266, 0, 1, 0.5333334, 1,
-0.3067822, 2.302939, 1.11387, 0, 1, 0.5372549, 1,
-0.3054927, 0.1005747, -0.9110634, 0, 1, 0.5450981, 1,
-0.3016387, 0.7668203, -1.363057, 0, 1, 0.5490196, 1,
-0.2966776, -0.5891129, -1.783995, 0, 1, 0.5568628, 1,
-0.2881874, 1.265579, 0.1845569, 0, 1, 0.5607843, 1,
-0.2843758, -0.793271, -2.079029, 0, 1, 0.5686275, 1,
-0.2786642, -0.008266347, -2.988072, 0, 1, 0.572549, 1,
-0.27197, -1.044906, -3.356744, 0, 1, 0.5803922, 1,
-0.2630441, 0.5799523, -1.22981, 0, 1, 0.5843138, 1,
-0.2629239, 1.155214, 1.481634, 0, 1, 0.5921569, 1,
-0.2609656, -1.925228, -3.066033, 0, 1, 0.5960785, 1,
-0.2609205, -0.4429461, -1.469761, 0, 1, 0.6039216, 1,
-0.2596739, 0.1767692, -0.5146405, 0, 1, 0.6117647, 1,
-0.2584487, -0.09645424, -2.100617, 0, 1, 0.6156863, 1,
-0.2541783, 0.1004569, -1.030871, 0, 1, 0.6235294, 1,
-0.2538737, -0.2436242, -3.162918, 0, 1, 0.627451, 1,
-0.2533263, 0.3393128, -1.947747, 0, 1, 0.6352941, 1,
-0.2425363, 1.64219, -1.432381, 0, 1, 0.6392157, 1,
-0.2389269, 0.5607959, 1.456089, 0, 1, 0.6470588, 1,
-0.2363188, -0.876967, -2.412175, 0, 1, 0.6509804, 1,
-0.2348194, -0.2885554, -0.7119024, 0, 1, 0.6588235, 1,
-0.232943, -1.305066, -1.646871, 0, 1, 0.6627451, 1,
-0.2313071, 0.2952417, -1.161264, 0, 1, 0.6705883, 1,
-0.2305287, 0.08357474, -2.200294, 0, 1, 0.6745098, 1,
-0.229602, -0.5657288, -2.99543, 0, 1, 0.682353, 1,
-0.2248226, -1.479559, -3.778381, 0, 1, 0.6862745, 1,
-0.2247296, 0.5137324, -0.6252361, 0, 1, 0.6941177, 1,
-0.2160055, -0.6964737, -2.120655, 0, 1, 0.7019608, 1,
-0.2154732, 2.894751, -0.2225391, 0, 1, 0.7058824, 1,
-0.2151886, 0.7299226, 0.1453719, 0, 1, 0.7137255, 1,
-0.2138404, -0.5552968, -2.478571, 0, 1, 0.7176471, 1,
-0.2111577, -2.183325, -4.060133, 0, 1, 0.7254902, 1,
-0.2087088, 1.64221, -0.9674914, 0, 1, 0.7294118, 1,
-0.2071656, -0.7867513, -2.239056, 0, 1, 0.7372549, 1,
-0.2007631, -1.207073, -2.726939, 0, 1, 0.7411765, 1,
-0.1995306, 1.961295, 1.071168, 0, 1, 0.7490196, 1,
-0.198778, -1.75345, -2.001571, 0, 1, 0.7529412, 1,
-0.1981412, 0.3628959, -0.7469552, 0, 1, 0.7607843, 1,
-0.1969132, -0.01435235, -1.680997, 0, 1, 0.7647059, 1,
-0.1957776, 2.895121, -1.724613, 0, 1, 0.772549, 1,
-0.1953314, 0.2880289, -0.8757042, 0, 1, 0.7764706, 1,
-0.194001, -2.047035, -2.754233, 0, 1, 0.7843137, 1,
-0.1935184, 1.116449, 0.2855082, 0, 1, 0.7882353, 1,
-0.1909046, -0.7570077, -2.967154, 0, 1, 0.7960784, 1,
-0.1896399, -0.7459732, -2.081457, 0, 1, 0.8039216, 1,
-0.1860923, -1.425292, -2.108413, 0, 1, 0.8078431, 1,
-0.1837021, 2.016308, 0.4766892, 0, 1, 0.8156863, 1,
-0.1812825, 0.5461187, -0.4458191, 0, 1, 0.8196079, 1,
-0.1802154, -2.776673, -3.426, 0, 1, 0.827451, 1,
-0.1790805, 0.7890683, 0.7791876, 0, 1, 0.8313726, 1,
-0.1772331, 0.9194226, -0.2777806, 0, 1, 0.8392157, 1,
-0.1761336, -2.459443, -2.500953, 0, 1, 0.8431373, 1,
-0.1740277, 1.36045, -0.4014481, 0, 1, 0.8509804, 1,
-0.1738544, -0.8059174, -2.398585, 0, 1, 0.854902, 1,
-0.1736353, 0.3251865, -0.6725041, 0, 1, 0.8627451, 1,
-0.1720477, -0.6599206, -2.724947, 0, 1, 0.8666667, 1,
-0.1704934, -0.9382417, -3.93667, 0, 1, 0.8745098, 1,
-0.1682348, -0.193126, -2.75457, 0, 1, 0.8784314, 1,
-0.1615103, -2.610193, -2.280126, 0, 1, 0.8862745, 1,
-0.1614548, -0.08876003, -2.277259, 0, 1, 0.8901961, 1,
-0.1553733, 0.6129068, 0.470277, 0, 1, 0.8980392, 1,
-0.1477114, -0.1562166, -2.4852, 0, 1, 0.9058824, 1,
-0.1459672, 0.2379248, -0.1933748, 0, 1, 0.9098039, 1,
-0.1454161, -0.7524847, -1.502498, 0, 1, 0.9176471, 1,
-0.1414116, -0.4746958, -3.205, 0, 1, 0.9215686, 1,
-0.138323, -0.74268, -3.587952, 0, 1, 0.9294118, 1,
-0.132034, 0.03309898, -0.0472792, 0, 1, 0.9333333, 1,
-0.1294998, 0.8692212, -0.2339188, 0, 1, 0.9411765, 1,
-0.1247282, -1.240247, -4.620456, 0, 1, 0.945098, 1,
-0.1245996, -1.192219, -2.616148, 0, 1, 0.9529412, 1,
-0.1239116, -1.291745, -3.531772, 0, 1, 0.9568627, 1,
-0.1179689, 0.1706828, -0.4610994, 0, 1, 0.9647059, 1,
-0.1142644, -0.6785007, -2.496217, 0, 1, 0.9686275, 1,
-0.1132671, -0.9645625, -3.466785, 0, 1, 0.9764706, 1,
-0.1103513, -1.332584, -2.380076, 0, 1, 0.9803922, 1,
-0.1062522, -0.976845, -4.277369, 0, 1, 0.9882353, 1,
-0.1027352, 0.1497383, -0.7830306, 0, 1, 0.9921569, 1,
-0.1007865, 0.5311805, -0.8446404, 0, 1, 1, 1,
-0.09669359, -1.508989, -4.518779, 0, 0.9921569, 1, 1,
-0.09342485, 0.4466342, 0.2846241, 0, 0.9882353, 1, 1,
-0.09266274, 0.1428484, 0.01768184, 0, 0.9803922, 1, 1,
-0.0912327, -0.6018357, -4.738397, 0, 0.9764706, 1, 1,
-0.09098854, -0.4657856, -2.188671, 0, 0.9686275, 1, 1,
-0.08724628, -1.347886, -2.074671, 0, 0.9647059, 1, 1,
-0.08550272, 0.5218767, 0.8355051, 0, 0.9568627, 1, 1,
-0.08453631, -1.111992, -2.556138, 0, 0.9529412, 1, 1,
-0.08375499, -1.02363, -3.005195, 0, 0.945098, 1, 1,
-0.08247387, 0.3008375, 0.6209491, 0, 0.9411765, 1, 1,
-0.08235657, 1.495364, 0.7848351, 0, 0.9333333, 1, 1,
-0.07764649, -1.117862, -4.23131, 0, 0.9294118, 1, 1,
-0.07298306, -0.6554314, -3.705757, 0, 0.9215686, 1, 1,
-0.06739936, 1.948465, -2.410598, 0, 0.9176471, 1, 1,
-0.06172198, -0.01267001, -1.594027, 0, 0.9098039, 1, 1,
-0.06156789, -0.4324926, -2.743402, 0, 0.9058824, 1, 1,
-0.05881206, -0.5313839, -1.443008, 0, 0.8980392, 1, 1,
-0.05404123, -0.7628937, -3.550118, 0, 0.8901961, 1, 1,
-0.04556325, 0.7880006, -1.441615, 0, 0.8862745, 1, 1,
-0.04229061, 1.530655, 0.4985915, 0, 0.8784314, 1, 1,
-0.04059034, -0.116802, -3.34017, 0, 0.8745098, 1, 1,
-0.04019226, 1.512989, -1.795544, 0, 0.8666667, 1, 1,
-0.0392851, -0.6319309, -3.764649, 0, 0.8627451, 1, 1,
-0.03800606, -0.2583414, -3.07954, 0, 0.854902, 1, 1,
-0.03768636, -0.3047496, -2.422283, 0, 0.8509804, 1, 1,
-0.0356184, -0.1408033, -2.080197, 0, 0.8431373, 1, 1,
-0.03283581, -0.2643211, -2.738232, 0, 0.8392157, 1, 1,
-0.03262345, 0.8010876, -0.3847068, 0, 0.8313726, 1, 1,
-0.0287899, -0.2552529, -3.447966, 0, 0.827451, 1, 1,
-0.02850926, 0.6566277, -0.2536455, 0, 0.8196079, 1, 1,
-0.02255283, 0.1421129, -0.5780138, 0, 0.8156863, 1, 1,
-0.01653538, 0.02742701, -0.9695771, 0, 0.8078431, 1, 1,
-0.01417564, -0.7702055, -3.407656, 0, 0.8039216, 1, 1,
-0.0119897, -0.05400391, -2.364871, 0, 0.7960784, 1, 1,
-0.01145222, 0.1775231, -0.2945477, 0, 0.7882353, 1, 1,
-0.002867554, -1.455663, -1.889836, 0, 0.7843137, 1, 1,
0.000181561, -1.077481, 3.267545, 0, 0.7764706, 1, 1,
0.001751071, -0.1461867, 5.586347, 0, 0.772549, 1, 1,
0.01346779, -0.09083705, 5.238547, 0, 0.7647059, 1, 1,
0.01378406, -0.5878624, 1.973684, 0, 0.7607843, 1, 1,
0.01521116, -0.2844159, 4.458077, 0, 0.7529412, 1, 1,
0.01713879, 0.1936916, -1.17725, 0, 0.7490196, 1, 1,
0.01818256, 0.1646894, -0.03638439, 0, 0.7411765, 1, 1,
0.01826958, -2.577762, 0.7035434, 0, 0.7372549, 1, 1,
0.01939364, -1.258358, 4.706129, 0, 0.7294118, 1, 1,
0.02536158, -0.2794876, 1.778523, 0, 0.7254902, 1, 1,
0.02708084, 0.8246691, 0.3691171, 0, 0.7176471, 1, 1,
0.02966573, -0.3265925, 2.391242, 0, 0.7137255, 1, 1,
0.03066434, 1.817192, -1.358752, 0, 0.7058824, 1, 1,
0.03372224, 0.3406386, 1.783374, 0, 0.6980392, 1, 1,
0.03753131, -0.2149236, 2.636709, 0, 0.6941177, 1, 1,
0.03964682, 0.1256766, -0.5657219, 0, 0.6862745, 1, 1,
0.04668379, -0.8575539, 4.173157, 0, 0.682353, 1, 1,
0.04711088, 0.2379982, -0.7616214, 0, 0.6745098, 1, 1,
0.05322919, -1.532354, 2.427395, 0, 0.6705883, 1, 1,
0.05728191, 0.222777, -0.722604, 0, 0.6627451, 1, 1,
0.05728928, -1.171571, 4.540408, 0, 0.6588235, 1, 1,
0.060484, -0.9774592, 4.025534, 0, 0.6509804, 1, 1,
0.06072498, -0.2330586, 3.060251, 0, 0.6470588, 1, 1,
0.06194651, -0.09661746, 2.568373, 0, 0.6392157, 1, 1,
0.06203153, 0.08387429, 3.000097, 0, 0.6352941, 1, 1,
0.06400283, -1.292798, 2.87423, 0, 0.627451, 1, 1,
0.06587379, -1.095853, 2.767766, 0, 0.6235294, 1, 1,
0.06638727, -0.9323595, 0.7107419, 0, 0.6156863, 1, 1,
0.06704463, 0.6193445, -0.1904092, 0, 0.6117647, 1, 1,
0.06810981, 0.7024807, 0.2472695, 0, 0.6039216, 1, 1,
0.06849057, 0.1824276, -1.331264, 0, 0.5960785, 1, 1,
0.06885095, 0.5376404, -0.006003961, 0, 0.5921569, 1, 1,
0.07397465, -0.6502953, 3.481506, 0, 0.5843138, 1, 1,
0.07824259, -0.6256472, 3.535517, 0, 0.5803922, 1, 1,
0.09201781, 1.165518, -0.9366496, 0, 0.572549, 1, 1,
0.09785371, -0.989178, 3.773264, 0, 0.5686275, 1, 1,
0.09854487, -1.450506, 4.744049, 0, 0.5607843, 1, 1,
0.1000926, 0.2489406, -0.3193247, 0, 0.5568628, 1, 1,
0.1006231, 1.205908, 2.045312, 0, 0.5490196, 1, 1,
0.1016205, -1.261371, 3.220338, 0, 0.5450981, 1, 1,
0.1024755, -0.699985, 4.201716, 0, 0.5372549, 1, 1,
0.1149456, 0.6021497, 2.429241, 0, 0.5333334, 1, 1,
0.1160537, 0.05676757, 0.5131648, 0, 0.5254902, 1, 1,
0.1197516, 0.2642454, 0.5396498, 0, 0.5215687, 1, 1,
0.1221886, 1.597783, 0.3614413, 0, 0.5137255, 1, 1,
0.1246847, -1.730842, 3.592998, 0, 0.509804, 1, 1,
0.1315821, -0.2537495, 3.979046, 0, 0.5019608, 1, 1,
0.1394362, 0.4755416, 0.001115806, 0, 0.4941176, 1, 1,
0.1410607, 0.3574385, 0.1278921, 0, 0.4901961, 1, 1,
0.1444591, -0.9848262, 3.524061, 0, 0.4823529, 1, 1,
0.1498198, -0.5886106, 4.161955, 0, 0.4784314, 1, 1,
0.1499365, 0.2335051, 0.549753, 0, 0.4705882, 1, 1,
0.1510209, 1.029554, 0.9195695, 0, 0.4666667, 1, 1,
0.1519582, 0.4053371, -0.2508309, 0, 0.4588235, 1, 1,
0.1532432, -1.073168, 3.179258, 0, 0.454902, 1, 1,
0.1542393, 0.6833495, -0.8991901, 0, 0.4470588, 1, 1,
0.1591361, -0.3317186, 2.118719, 0, 0.4431373, 1, 1,
0.1652626, 1.205422, -0.4953123, 0, 0.4352941, 1, 1,
0.1675818, 1.266486, 0.8834448, 0, 0.4313726, 1, 1,
0.1678376, 0.1837601, 0.554719, 0, 0.4235294, 1, 1,
0.1739823, -0.3637886, 1.805759, 0, 0.4196078, 1, 1,
0.1765748, -0.8733275, 3.325618, 0, 0.4117647, 1, 1,
0.1796179, 0.284519, -1.313943, 0, 0.4078431, 1, 1,
0.1868676, 0.3005395, 1.366518, 0, 0.4, 1, 1,
0.187574, 0.6845952, -0.2919745, 0, 0.3921569, 1, 1,
0.1877009, -1.531304, 4.266464, 0, 0.3882353, 1, 1,
0.1906817, 0.1618066, 2.250008, 0, 0.3803922, 1, 1,
0.1910626, 1.094535, -1.118322, 0, 0.3764706, 1, 1,
0.1924282, -0.6264358, 4.114392, 0, 0.3686275, 1, 1,
0.1946734, -1.06354, 3.012255, 0, 0.3647059, 1, 1,
0.195174, 0.7271556, -0.5536782, 0, 0.3568628, 1, 1,
0.1955698, 1.551355, -1.287047, 0, 0.3529412, 1, 1,
0.2058117, -2.406822, 2.166358, 0, 0.345098, 1, 1,
0.2085235, 1.233374, -0.9650216, 0, 0.3411765, 1, 1,
0.2089483, 2.97156, -0.5629882, 0, 0.3333333, 1, 1,
0.2089774, 1.668467, 0.6605603, 0, 0.3294118, 1, 1,
0.209235, 0.0004856226, 1.916343, 0, 0.3215686, 1, 1,
0.2111961, -2.005352, 2.798923, 0, 0.3176471, 1, 1,
0.2113738, -0.1996755, 2.268753, 0, 0.3098039, 1, 1,
0.2152646, -0.2323941, -0.04260307, 0, 0.3058824, 1, 1,
0.2162573, -1.844393, 1.741957, 0, 0.2980392, 1, 1,
0.221189, -0.1197029, 1.995978, 0, 0.2901961, 1, 1,
0.2238114, -1.528651, 3.141873, 0, 0.2862745, 1, 1,
0.2299698, 1.787144, -0.006719088, 0, 0.2784314, 1, 1,
0.2333959, -0.4788502, 1.908887, 0, 0.2745098, 1, 1,
0.2390922, -0.7659772, 1.155595, 0, 0.2666667, 1, 1,
0.2395157, -0.1202572, -0.01623164, 0, 0.2627451, 1, 1,
0.2449246, 0.02784279, 2.118993, 0, 0.254902, 1, 1,
0.2482459, 0.5693769, 1.000892, 0, 0.2509804, 1, 1,
0.2485899, 1.964541, -1.353665, 0, 0.2431373, 1, 1,
0.2594807, -1.260925, 2.565028, 0, 0.2392157, 1, 1,
0.2602646, 0.2788637, -0.7804738, 0, 0.2313726, 1, 1,
0.2612564, -1.355621, 1.990299, 0, 0.227451, 1, 1,
0.2613557, -1.025706, 3.444439, 0, 0.2196078, 1, 1,
0.2614686, 0.07189787, 1.682326, 0, 0.2156863, 1, 1,
0.2646773, -0.315112, 2.318483, 0, 0.2078431, 1, 1,
0.2727784, -0.7826691, 1.801472, 0, 0.2039216, 1, 1,
0.272914, -1.863544, 2.476273, 0, 0.1960784, 1, 1,
0.2756969, 0.8742193, 1.090361, 0, 0.1882353, 1, 1,
0.2791083, 0.754882, 0.7624857, 0, 0.1843137, 1, 1,
0.2804816, -0.4105655, 4.042418, 0, 0.1764706, 1, 1,
0.2835469, 0.5184547, -0.4212715, 0, 0.172549, 1, 1,
0.2837003, -0.7416255, 3.645652, 0, 0.1647059, 1, 1,
0.2861102, -0.9900242, 2.071651, 0, 0.1607843, 1, 1,
0.2892579, 0.1054732, 0.9147759, 0, 0.1529412, 1, 1,
0.2920783, -0.2902751, 2.109756, 0, 0.1490196, 1, 1,
0.2958614, -0.5272263, 5.090696, 0, 0.1411765, 1, 1,
0.295888, 0.9731144, -1.250165, 0, 0.1372549, 1, 1,
0.2969786, 0.6372741, 1.796632, 0, 0.1294118, 1, 1,
0.2976142, 0.908987, -0.02564805, 0, 0.1254902, 1, 1,
0.2977219, 0.237286, 1.123376, 0, 0.1176471, 1, 1,
0.3090732, 1.352638, 0.7639064, 0, 0.1137255, 1, 1,
0.314849, -0.5660077, 1.963574, 0, 0.1058824, 1, 1,
0.3156266, -0.09510189, 0.4644164, 0, 0.09803922, 1, 1,
0.316055, 1.309174, -0.7582626, 0, 0.09411765, 1, 1,
0.3177172, -0.5101569, 1.756109, 0, 0.08627451, 1, 1,
0.3202019, 0.8715631, 0.830833, 0, 0.08235294, 1, 1,
0.3223382, -0.8829686, 1.972715, 0, 0.07450981, 1, 1,
0.3226421, -0.128832, 0.7389869, 0, 0.07058824, 1, 1,
0.3231601, 0.1318459, 1.402655, 0, 0.0627451, 1, 1,
0.3279837, -0.6836592, 2.461235, 0, 0.05882353, 1, 1,
0.3327146, -1.214576, 1.325913, 0, 0.05098039, 1, 1,
0.333156, -0.4815007, 0.9567122, 0, 0.04705882, 1, 1,
0.3356475, 0.2097746, 0.5439444, 0, 0.03921569, 1, 1,
0.3359292, 1.703957, -0.2783411, 0, 0.03529412, 1, 1,
0.3371414, -0.7908794, 4.925888, 0, 0.02745098, 1, 1,
0.341915, 1.739673, 1.034466, 0, 0.02352941, 1, 1,
0.3461632, -0.673703, 3.71784, 0, 0.01568628, 1, 1,
0.346272, -0.6911854, 1.808714, 0, 0.01176471, 1, 1,
0.3466765, 0.8536983, 1.260578, 0, 0.003921569, 1, 1,
0.3480214, 0.2008616, 2.111817, 0.003921569, 0, 1, 1,
0.3483434, 1.853996, 0.211501, 0.007843138, 0, 1, 1,
0.3484997, 0.04497196, -0.5825893, 0.01568628, 0, 1, 1,
0.3510786, -0.3769536, 3.187191, 0.01960784, 0, 1, 1,
0.3552293, -0.574827, 2.355938, 0.02745098, 0, 1, 1,
0.3574366, -1.552336, 2.12248, 0.03137255, 0, 1, 1,
0.3584501, -1.027719, 3.475214, 0.03921569, 0, 1, 1,
0.3590753, 0.8648424, 1.492423, 0.04313726, 0, 1, 1,
0.3639319, 0.5431179, 0.6672989, 0.05098039, 0, 1, 1,
0.3687085, -0.7385221, 2.86206, 0.05490196, 0, 1, 1,
0.3692767, 0.4725235, 1.194704, 0.0627451, 0, 1, 1,
0.3732393, 2.228338, 1.293602, 0.06666667, 0, 1, 1,
0.3741941, 0.1355938, 0.7056129, 0.07450981, 0, 1, 1,
0.3785083, 1.67381, 0.0626982, 0.07843138, 0, 1, 1,
0.3864838, -0.8650771, 2.916727, 0.08627451, 0, 1, 1,
0.3865451, -1.846548, 2.394248, 0.09019608, 0, 1, 1,
0.3889, -0.4313016, 1.466841, 0.09803922, 0, 1, 1,
0.3922502, -0.7766188, 3.342777, 0.1058824, 0, 1, 1,
0.3934271, 0.5383759, 0.9283441, 0.1098039, 0, 1, 1,
0.3942812, -0.198768, 2.250993, 0.1176471, 0, 1, 1,
0.3943517, 0.7565597, 0.1404715, 0.1215686, 0, 1, 1,
0.3970442, -0.9472078, 3.0264, 0.1294118, 0, 1, 1,
0.3995447, 0.5306853, 2.260562, 0.1333333, 0, 1, 1,
0.4013258, 2.334414, 1.836163, 0.1411765, 0, 1, 1,
0.4045019, 0.4049913, 0.2341783, 0.145098, 0, 1, 1,
0.404556, -1.216622, 2.257643, 0.1529412, 0, 1, 1,
0.4083746, -1.029971, 1.73259, 0.1568628, 0, 1, 1,
0.4120076, 1.483223, 0.1388955, 0.1647059, 0, 1, 1,
0.4122694, -0.1485325, 2.04088, 0.1686275, 0, 1, 1,
0.4124069, 0.4869687, 0.2495977, 0.1764706, 0, 1, 1,
0.4217161, -0.004180561, 0.8459312, 0.1803922, 0, 1, 1,
0.4225459, 0.382561, 2.167517, 0.1882353, 0, 1, 1,
0.4227067, -0.1447916, 1.623352, 0.1921569, 0, 1, 1,
0.4235219, 0.2599835, 1.304284, 0.2, 0, 1, 1,
0.4286616, 0.5582476, 0.4734204, 0.2078431, 0, 1, 1,
0.4289051, 0.3237289, 2.475648, 0.2117647, 0, 1, 1,
0.4292272, -0.6211219, 3.812034, 0.2196078, 0, 1, 1,
0.4306359, 0.0730368, 1.357867, 0.2235294, 0, 1, 1,
0.433071, 0.8575926, 0.3738973, 0.2313726, 0, 1, 1,
0.4385804, 1.046597, 1.048257, 0.2352941, 0, 1, 1,
0.4404603, -1.012733, 1.290706, 0.2431373, 0, 1, 1,
0.4437975, -1.9447, 2.730979, 0.2470588, 0, 1, 1,
0.4438721, -1.846971, 2.413909, 0.254902, 0, 1, 1,
0.4452358, 1.608158, 1.236733, 0.2588235, 0, 1, 1,
0.4475867, -0.8738801, 2.857171, 0.2666667, 0, 1, 1,
0.4499906, 0.8174042, 0.7077717, 0.2705882, 0, 1, 1,
0.455195, 0.1611462, 1.210926, 0.2784314, 0, 1, 1,
0.4566863, -0.1562884, 1.715622, 0.282353, 0, 1, 1,
0.4583764, 0.354088, 1.034653, 0.2901961, 0, 1, 1,
0.4632171, -0.5667151, 2.602425, 0.2941177, 0, 1, 1,
0.4638681, -1.166757, 2.320858, 0.3019608, 0, 1, 1,
0.4641645, 0.3738642, 2.670273, 0.3098039, 0, 1, 1,
0.4687194, -1.330495, 3.305794, 0.3137255, 0, 1, 1,
0.475943, -0.980938, 2.307054, 0.3215686, 0, 1, 1,
0.4776519, 0.8708003, 0.5873549, 0.3254902, 0, 1, 1,
0.4780004, 1.097274, -0.3553931, 0.3333333, 0, 1, 1,
0.4782375, -0.3660236, 2.938971, 0.3372549, 0, 1, 1,
0.4804806, 0.04812618, -0.450798, 0.345098, 0, 1, 1,
0.483646, 0.4523938, 1.320048, 0.3490196, 0, 1, 1,
0.4839739, 1.112658, -0.1939201, 0.3568628, 0, 1, 1,
0.48403, -0.9418035, 3.15119, 0.3607843, 0, 1, 1,
0.4861439, -0.695408, 3.14514, 0.3686275, 0, 1, 1,
0.4901341, 0.5301005, 1.735476, 0.372549, 0, 1, 1,
0.4905841, -0.7998326, 1.667356, 0.3803922, 0, 1, 1,
0.4912943, 0.08619769, 2.838217, 0.3843137, 0, 1, 1,
0.4923613, -1.940851, 3.101912, 0.3921569, 0, 1, 1,
0.4925765, -0.1358523, 1.370127, 0.3960784, 0, 1, 1,
0.497925, -0.5559057, 2.292656, 0.4039216, 0, 1, 1,
0.5025241, -0.7895284, 3.623758, 0.4117647, 0, 1, 1,
0.508451, 0.4773386, -0.645382, 0.4156863, 0, 1, 1,
0.5108278, -2.053655, 1.768043, 0.4235294, 0, 1, 1,
0.5143995, 0.5361314, -0.6384294, 0.427451, 0, 1, 1,
0.5146307, -0.3794848, 3.550823, 0.4352941, 0, 1, 1,
0.5155129, -0.07611538, 1.32443, 0.4392157, 0, 1, 1,
0.5229214, -0.05364863, 1.669135, 0.4470588, 0, 1, 1,
0.5392427, 0.06511293, 1.267289, 0.4509804, 0, 1, 1,
0.5471888, 0.9328724, -0.02937693, 0.4588235, 0, 1, 1,
0.5480409, 0.7803338, 0.1889481, 0.4627451, 0, 1, 1,
0.5493417, -0.6168585, 2.430971, 0.4705882, 0, 1, 1,
0.5581326, -0.5065378, 2.230434, 0.4745098, 0, 1, 1,
0.5628879, 1.384657, -1.574825, 0.4823529, 0, 1, 1,
0.5643102, -0.5383614, 2.881858, 0.4862745, 0, 1, 1,
0.5671054, 1.463193, 0.5536556, 0.4941176, 0, 1, 1,
0.5679073, -0.1256478, 1.722317, 0.5019608, 0, 1, 1,
0.5716714, -0.6331092, 3.32819, 0.5058824, 0, 1, 1,
0.5836255, -0.2386369, 2.015812, 0.5137255, 0, 1, 1,
0.5844007, 0.681877, 1.793682, 0.5176471, 0, 1, 1,
0.5893632, -0.4594736, 2.294034, 0.5254902, 0, 1, 1,
0.5905414, 0.4691861, 0.3408469, 0.5294118, 0, 1, 1,
0.5920407, 0.729533, 2.431036, 0.5372549, 0, 1, 1,
0.5962767, 1.707015, -0.02844879, 0.5411765, 0, 1, 1,
0.5972837, -0.2900124, 1.915427, 0.5490196, 0, 1, 1,
0.6038105, 0.04705857, 1.240236, 0.5529412, 0, 1, 1,
0.6075382, -1.403354, 2.215626, 0.5607843, 0, 1, 1,
0.6081491, 2.297848, -0.8585618, 0.5647059, 0, 1, 1,
0.6106139, 0.8802655, 2.031916, 0.572549, 0, 1, 1,
0.6173394, 0.9186836, -0.9138858, 0.5764706, 0, 1, 1,
0.6204093, 2.13035, -0.274681, 0.5843138, 0, 1, 1,
0.6223593, -1.741261, 2.988581, 0.5882353, 0, 1, 1,
0.623846, -0.4646806, 1.74336, 0.5960785, 0, 1, 1,
0.6242504, -1.081524, 4.353995, 0.6039216, 0, 1, 1,
0.6242979, 0.7019604, 0.09344404, 0.6078432, 0, 1, 1,
0.631793, 0.1933983, -0.1461119, 0.6156863, 0, 1, 1,
0.6320413, -1.882983, 3.876842, 0.6196079, 0, 1, 1,
0.6434876, 0.08273987, -0.6394053, 0.627451, 0, 1, 1,
0.6500397, 1.065514, 1.135503, 0.6313726, 0, 1, 1,
0.6527423, 0.07330817, 2.602295, 0.6392157, 0, 1, 1,
0.657859, 0.02058305, 1.890436, 0.6431373, 0, 1, 1,
0.6593438, -0.4563329, 1.69614, 0.6509804, 0, 1, 1,
0.6594579, 0.8318352, 0.7754538, 0.654902, 0, 1, 1,
0.6672665, -0.3665504, 2.633923, 0.6627451, 0, 1, 1,
0.6676414, -0.7116441, 3.076553, 0.6666667, 0, 1, 1,
0.667917, 0.03910407, 1.805246, 0.6745098, 0, 1, 1,
0.6685861, -0.9795346, 2.806567, 0.6784314, 0, 1, 1,
0.6700209, 1.510965, -0.5904383, 0.6862745, 0, 1, 1,
0.6706203, -1.051011, 2.418193, 0.6901961, 0, 1, 1,
0.6725333, -0.5397205, 3.353055, 0.6980392, 0, 1, 1,
0.6779802, -1.273269, 1.529868, 0.7058824, 0, 1, 1,
0.6786135, 0.9986834, -0.4654178, 0.7098039, 0, 1, 1,
0.6858066, 0.01732286, 0.8331609, 0.7176471, 0, 1, 1,
0.6880759, -1.227639, 5.025304, 0.7215686, 0, 1, 1,
0.6943604, -0.3873294, 2.689993, 0.7294118, 0, 1, 1,
0.6954103, -0.6134157, 4.264269, 0.7333333, 0, 1, 1,
0.699295, 1.58477, 0.3626819, 0.7411765, 0, 1, 1,
0.700664, 1.943488, 1.282355, 0.7450981, 0, 1, 1,
0.703007, 1.151602, 0.2995341, 0.7529412, 0, 1, 1,
0.7060179, 2.192455, 0.286553, 0.7568628, 0, 1, 1,
0.7081136, 0.4115866, 1.417359, 0.7647059, 0, 1, 1,
0.7145303, -0.5069051, 3.651701, 0.7686275, 0, 1, 1,
0.7146111, -0.4801015, 2.104173, 0.7764706, 0, 1, 1,
0.7165901, -0.642076, 2.272846, 0.7803922, 0, 1, 1,
0.7173352, -0.08923985, 2.225359, 0.7882353, 0, 1, 1,
0.7188029, -0.9718928, 2.449789, 0.7921569, 0, 1, 1,
0.725975, 1.228928, 1.347941, 0.8, 0, 1, 1,
0.7288067, 1.000721, 1.521696, 0.8078431, 0, 1, 1,
0.7296866, 1.767969, 0.8969724, 0.8117647, 0, 1, 1,
0.7346601, -0.3908316, 1.889781, 0.8196079, 0, 1, 1,
0.7357456, 0.6593213, 0.8289197, 0.8235294, 0, 1, 1,
0.7397967, -0.4697221, 1.833151, 0.8313726, 0, 1, 1,
0.7464082, 2.093935, 0.4931853, 0.8352941, 0, 1, 1,
0.7474781, -1.311111, 2.701002, 0.8431373, 0, 1, 1,
0.7528846, 0.1517271, 0.1819181, 0.8470588, 0, 1, 1,
0.7762098, 0.4389031, 0.2115427, 0.854902, 0, 1, 1,
0.7776188, -0.3297328, 1.722415, 0.8588235, 0, 1, 1,
0.7780176, 0.4123901, 1.279386, 0.8666667, 0, 1, 1,
0.7791481, -0.6023219, 4.197521, 0.8705882, 0, 1, 1,
0.7932628, -1.51184, 1.892693, 0.8784314, 0, 1, 1,
0.795097, 1.758876, 0.1948528, 0.8823529, 0, 1, 1,
0.7991495, 0.09410186, 1.885286, 0.8901961, 0, 1, 1,
0.8012913, 2.729665, -0.6631974, 0.8941177, 0, 1, 1,
0.8025585, 1.888561, 2.168391, 0.9019608, 0, 1, 1,
0.8041492, 1.562328, 1.468942, 0.9098039, 0, 1, 1,
0.8062702, 1.122767, 0.162297, 0.9137255, 0, 1, 1,
0.8082146, 1.192926, 0.1348261, 0.9215686, 0, 1, 1,
0.8167624, 0.5817097, 0.4324453, 0.9254902, 0, 1, 1,
0.8228057, 1.495965, -0.001390879, 0.9333333, 0, 1, 1,
0.8251036, 0.4794706, 1.203423, 0.9372549, 0, 1, 1,
0.8291701, -0.1294204, 3.055272, 0.945098, 0, 1, 1,
0.8360929, 0.9618819, 0.742759, 0.9490196, 0, 1, 1,
0.8402396, 2.742445, -0.8143109, 0.9568627, 0, 1, 1,
0.8522443, -0.7480215, 3.014895, 0.9607843, 0, 1, 1,
0.8526646, 0.2469295, -1.282225, 0.9686275, 0, 1, 1,
0.8531103, 1.087004, 1.35884, 0.972549, 0, 1, 1,
0.8570048, 0.2725488, 1.801509, 0.9803922, 0, 1, 1,
0.8594427, 0.5554395, 0.1509045, 0.9843137, 0, 1, 1,
0.8609833, -0.7581675, 2.24621, 0.9921569, 0, 1, 1,
0.8660103, -0.07655569, 3.437558, 0.9960784, 0, 1, 1,
0.8707092, -0.2638175, 0.2857952, 1, 0, 0.9960784, 1,
0.8991622, 0.05594613, 0.9241287, 1, 0, 0.9882353, 1,
0.9116814, -0.2273639, 1.895449, 1, 0, 0.9843137, 1,
0.9192042, 0.8584296, 1.32701, 1, 0, 0.9764706, 1,
0.9236719, 0.3123022, 2.157226, 1, 0, 0.972549, 1,
0.9282256, -3.800292, 2.686695, 1, 0, 0.9647059, 1,
0.9420149, -1.989838, 2.717768, 1, 0, 0.9607843, 1,
0.9435917, 0.1212574, 2.296045, 1, 0, 0.9529412, 1,
0.9536378, -0.2100198, 2.442323, 1, 0, 0.9490196, 1,
0.9594026, -0.5785923, 1.98029, 1, 0, 0.9411765, 1,
0.9598933, 0.7563908, 0.1377394, 1, 0, 0.9372549, 1,
0.9605391, -1.36807, 3.45384, 1, 0, 0.9294118, 1,
0.9618, -2.108918, 2.857609, 1, 0, 0.9254902, 1,
0.9706394, -0.8875685, 4.233006, 1, 0, 0.9176471, 1,
0.9744649, 1.128569, 1.639112, 1, 0, 0.9137255, 1,
0.974847, -0.854008, 0.1334363, 1, 0, 0.9058824, 1,
0.9748953, -0.4262569, 2.761799, 1, 0, 0.9019608, 1,
0.9794242, 0.8891547, 0.6730753, 1, 0, 0.8941177, 1,
0.9802258, 1.076358, 1.31206, 1, 0, 0.8862745, 1,
0.9846156, -0.4291582, 3.880251, 1, 0, 0.8823529, 1,
0.984755, 1.905808, -2.614981, 1, 0, 0.8745098, 1,
0.9852654, 0.7619803, 1.090348, 1, 0, 0.8705882, 1,
0.9882161, 0.6551368, 0.05504428, 1, 0, 0.8627451, 1,
0.9919239, -0.4014711, 2.533588, 1, 0, 0.8588235, 1,
1.004897, -0.3357544, 1.273119, 1, 0, 0.8509804, 1,
1.008035, -0.7341452, 1.668341, 1, 0, 0.8470588, 1,
1.018802, 1.359007, 0.6664572, 1, 0, 0.8392157, 1,
1.025174, -0.8384431, 2.94188, 1, 0, 0.8352941, 1,
1.028408, -0.2173158, 1.574529, 1, 0, 0.827451, 1,
1.033078, -1.38461, 3.565717, 1, 0, 0.8235294, 1,
1.033086, -0.5524824, 1.195153, 1, 0, 0.8156863, 1,
1.035507, 0.6412509, -0.1362271, 1, 0, 0.8117647, 1,
1.039585, 0.2476063, -0.6340135, 1, 0, 0.8039216, 1,
1.040273, -0.3648686, 1.845164, 1, 0, 0.7960784, 1,
1.047333, 0.6800663, 0.7419756, 1, 0, 0.7921569, 1,
1.066664, 0.8098736, -0.475424, 1, 0, 0.7843137, 1,
1.068948, 0.6605281, -0.4792419, 1, 0, 0.7803922, 1,
1.077093, -0.1393442, 3.039457, 1, 0, 0.772549, 1,
1.07956, 1.031039, 0.7138931, 1, 0, 0.7686275, 1,
1.07973, 0.8988194, 0.1291968, 1, 0, 0.7607843, 1,
1.08455, -2.444029, 2.888572, 1, 0, 0.7568628, 1,
1.095299, -0.1353267, 1.235374, 1, 0, 0.7490196, 1,
1.097946, 0.7003462, 0.5510318, 1, 0, 0.7450981, 1,
1.102794, -0.8592535, 2.569715, 1, 0, 0.7372549, 1,
1.10303, 0.7346228, 1.945011, 1, 0, 0.7333333, 1,
1.103741, 0.02546491, 1.95425, 1, 0, 0.7254902, 1,
1.109033, -1.014759, 2.014261, 1, 0, 0.7215686, 1,
1.111153, -0.7157271, 0.6878834, 1, 0, 0.7137255, 1,
1.112909, 0.6057326, 0.3184696, 1, 0, 0.7098039, 1,
1.114797, -0.3756704, 3.786101, 1, 0, 0.7019608, 1,
1.120828, 0.1500744, 3.599003, 1, 0, 0.6941177, 1,
1.126542, -0.63393, 1.947876, 1, 0, 0.6901961, 1,
1.139706, -0.5744253, 1.226428, 1, 0, 0.682353, 1,
1.149553, -1.6483, 3.29123, 1, 0, 0.6784314, 1,
1.156507, -1.381996, 1.962951, 1, 0, 0.6705883, 1,
1.168167, 1.43062, 1.575109, 1, 0, 0.6666667, 1,
1.181185, -0.2620576, 2.591772, 1, 0, 0.6588235, 1,
1.181594, 0.4776984, -1.946764, 1, 0, 0.654902, 1,
1.18207, -0.6549331, 2.500383, 1, 0, 0.6470588, 1,
1.182356, 0.2084042, 0.4273057, 1, 0, 0.6431373, 1,
1.184687, -0.1925665, 0.1181628, 1, 0, 0.6352941, 1,
1.186474, 0.4729473, 1.460051, 1, 0, 0.6313726, 1,
1.190998, 0.1492008, 1.397463, 1, 0, 0.6235294, 1,
1.191467, 0.2132207, 1.16248, 1, 0, 0.6196079, 1,
1.195226, 1.087604, 2.377472, 1, 0, 0.6117647, 1,
1.197223, -2.382695, 1.565357, 1, 0, 0.6078432, 1,
1.20092, 0.6891725, 2.108131, 1, 0, 0.6, 1,
1.205505, -0.7031941, 1.497898, 1, 0, 0.5921569, 1,
1.205688, -0.4092798, 2.691558, 1, 0, 0.5882353, 1,
1.208239, -0.1677491, -0.08272832, 1, 0, 0.5803922, 1,
1.209283, -0.1990509, 1.967773, 1, 0, 0.5764706, 1,
1.217611, 1.203941, 1.474331, 1, 0, 0.5686275, 1,
1.222537, -0.312352, 0.6207482, 1, 0, 0.5647059, 1,
1.22395, 0.4770257, 0.6088182, 1, 0, 0.5568628, 1,
1.237656, -0.5002874, 1.172474, 1, 0, 0.5529412, 1,
1.245772, 0.6413749, 0.5764728, 1, 0, 0.5450981, 1,
1.247361, -0.0174883, 1.896014, 1, 0, 0.5411765, 1,
1.252722, -1.625233, 1.730627, 1, 0, 0.5333334, 1,
1.28702, -0.591104, 2.380865, 1, 0, 0.5294118, 1,
1.293514, -1.333692, 3.11255, 1, 0, 0.5215687, 1,
1.297402, -0.6699103, 1.337365, 1, 0, 0.5176471, 1,
1.302502, -0.4808731, 1.965388, 1, 0, 0.509804, 1,
1.310201, -0.5551817, 2.317327, 1, 0, 0.5058824, 1,
1.313779, -1.089503, 2.202601, 1, 0, 0.4980392, 1,
1.318892, -1.493948, 2.756555, 1, 0, 0.4901961, 1,
1.332193, -0.5847778, 3.087544, 1, 0, 0.4862745, 1,
1.354358, -0.1661368, 1.31176, 1, 0, 0.4784314, 1,
1.360778, 0.1514944, 0.9152709, 1, 0, 0.4745098, 1,
1.364974, 0.5031568, 0.7594526, 1, 0, 0.4666667, 1,
1.371614, -1.800591, 2.476991, 1, 0, 0.4627451, 1,
1.391492, -0.6034225, 2.085927, 1, 0, 0.454902, 1,
1.39994, 0.6726097, 0.2392522, 1, 0, 0.4509804, 1,
1.405738, 1.345605, 0.8549056, 1, 0, 0.4431373, 1,
1.407488, -0.778284, 0.1671954, 1, 0, 0.4392157, 1,
1.412177, 0.4385202, 0.866889, 1, 0, 0.4313726, 1,
1.413133, 0.1583004, 0.8807401, 1, 0, 0.427451, 1,
1.415277, 0.9629499, -0.01286951, 1, 0, 0.4196078, 1,
1.428658, -0.8011973, 1.379225, 1, 0, 0.4156863, 1,
1.431307, -0.1602644, 1.83938, 1, 0, 0.4078431, 1,
1.444637, 0.1231235, 2.691367, 1, 0, 0.4039216, 1,
1.455509, -0.8381781, 0.8485276, 1, 0, 0.3960784, 1,
1.468929, -0.2308838, 1.835509, 1, 0, 0.3882353, 1,
1.471497, -0.3083771, 0.6269842, 1, 0, 0.3843137, 1,
1.48241, 0.1980397, 1.47271, 1, 0, 0.3764706, 1,
1.507295, 0.006327001, 1.215205, 1, 0, 0.372549, 1,
1.523333, -0.8887939, 3.155083, 1, 0, 0.3647059, 1,
1.559616, -0.9522982, 0.3802584, 1, 0, 0.3607843, 1,
1.57144, -1.114816, 2.416942, 1, 0, 0.3529412, 1,
1.586675, 0.2911241, 1.3869, 1, 0, 0.3490196, 1,
1.598409, 1.249352, 0.9418052, 1, 0, 0.3411765, 1,
1.607818, -0.5774765, 2.46929, 1, 0, 0.3372549, 1,
1.614767, 0.4225625, 2.88189, 1, 0, 0.3294118, 1,
1.62578, -0.1677174, 0.3554376, 1, 0, 0.3254902, 1,
1.631974, -0.7655091, 3.154789, 1, 0, 0.3176471, 1,
1.643239, -1.951326, 1.100944, 1, 0, 0.3137255, 1,
1.672806, 0.2097368, 1.36805, 1, 0, 0.3058824, 1,
1.676712, 0.4255909, 1.701685, 1, 0, 0.2980392, 1,
1.685114, -2.431809, 3.425211, 1, 0, 0.2941177, 1,
1.685417, -0.9230651, 1.932043, 1, 0, 0.2862745, 1,
1.685896, -0.6765853, 1.799667, 1, 0, 0.282353, 1,
1.687614, 0.8880254, 1.43392, 1, 0, 0.2745098, 1,
1.691912, -0.01210744, 2.79536, 1, 0, 0.2705882, 1,
1.69752, 0.4840831, -0.2386962, 1, 0, 0.2627451, 1,
1.727176, -0.1831106, 0.7728639, 1, 0, 0.2588235, 1,
1.749665, 0.5789037, 1.899144, 1, 0, 0.2509804, 1,
1.776418, 1.625652, 1.733033, 1, 0, 0.2470588, 1,
1.779904, -0.3774675, 2.107659, 1, 0, 0.2392157, 1,
1.800717, -0.6550017, 0.03832375, 1, 0, 0.2352941, 1,
1.802721, -0.7680624, 2.011475, 1, 0, 0.227451, 1,
1.815717, 1.324641, 1.227752, 1, 0, 0.2235294, 1,
1.87679, -2.759588, 3.042844, 1, 0, 0.2156863, 1,
1.881839, -0.9970313, 3.214148, 1, 0, 0.2117647, 1,
1.915633, -0.1387352, 1.167643, 1, 0, 0.2039216, 1,
1.926831, 0.9885748, -0.2814105, 1, 0, 0.1960784, 1,
1.951064, 0.647602, 2.001336, 1, 0, 0.1921569, 1,
1.952159, -1.699932, 1.511449, 1, 0, 0.1843137, 1,
1.957347, -0.3365676, 1.798773, 1, 0, 0.1803922, 1,
1.969724, 2.151579, 0.9334676, 1, 0, 0.172549, 1,
1.97776, -1.17468, 1.392696, 1, 0, 0.1686275, 1,
1.981542, 0.1675593, 1.282998, 1, 0, 0.1607843, 1,
1.997635, -1.668548, 3.361761, 1, 0, 0.1568628, 1,
1.999889, 0.6670691, 1.250673, 1, 0, 0.1490196, 1,
2.017521, -1.104521, 1.289763, 1, 0, 0.145098, 1,
2.032807, -1.404409, 1.903532, 1, 0, 0.1372549, 1,
2.05534, -0.1494642, 1.105638, 1, 0, 0.1333333, 1,
2.061525, 2.266335, -0.7153019, 1, 0, 0.1254902, 1,
2.131159, -1.996917, 1.919209, 1, 0, 0.1215686, 1,
2.13486, -0.1782819, 0.3072664, 1, 0, 0.1137255, 1,
2.201657, 1.460155, 0.9771925, 1, 0, 0.1098039, 1,
2.2215, 1.891725, 1.85656, 1, 0, 0.1019608, 1,
2.286179, -1.736671, 1.841759, 1, 0, 0.09411765, 1,
2.298017, 1.452157, 1.258749, 1, 0, 0.09019608, 1,
2.316731, 0.1179655, 1.130872, 1, 0, 0.08235294, 1,
2.320351, 1.377488, 1.560918, 1, 0, 0.07843138, 1,
2.347101, 0.1496483, 1.568888, 1, 0, 0.07058824, 1,
2.351272, 1.361175, 0.3491274, 1, 0, 0.06666667, 1,
2.382463, 1.171548, 3.829571, 1, 0, 0.05882353, 1,
2.404806, -0.6655847, 2.846228, 1, 0, 0.05490196, 1,
2.426536, 0.2431543, 1.475897, 1, 0, 0.04705882, 1,
2.456529, 0.9719597, -0.2148594, 1, 0, 0.04313726, 1,
2.545546, -0.1550597, 1.917445, 1, 0, 0.03529412, 1,
2.560638, 1.592511, 0.5832117, 1, 0, 0.03137255, 1,
2.620774, -1.460519, 0.9685983, 1, 0, 0.02352941, 1,
2.759249, -0.09552967, -0.02402538, 1, 0, 0.01960784, 1,
2.844178, -0.8733067, 1.685498, 1, 0, 0.01176471, 1,
3.499163, 0.920655, 3.315318, 1, 0, 0.007843138, 1
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
-0.0929209, -4.948121, -7.229829, 0, -0.5, 0.5, 0.5,
-0.0929209, -4.948121, -7.229829, 1, -0.5, 0.5, 0.5,
-0.0929209, -4.948121, -7.229829, 1, 1.5, 0.5, 0.5,
-0.0929209, -4.948121, -7.229829, 0, 1.5, 0.5, 0.5
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
-4.902721, -0.4143656, -7.229829, 0, -0.5, 0.5, 0.5,
-4.902721, -0.4143656, -7.229829, 1, -0.5, 0.5, 0.5,
-4.902721, -0.4143656, -7.229829, 1, 1.5, 0.5, 0.5,
-4.902721, -0.4143656, -7.229829, 0, 1.5, 0.5, 0.5
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
-4.902721, -4.948121, 0.1070068, 0, -0.5, 0.5, 0.5,
-4.902721, -4.948121, 0.1070068, 1, -0.5, 0.5, 0.5,
-4.902721, -4.948121, 0.1070068, 1, 1.5, 0.5, 0.5,
-4.902721, -4.948121, 0.1070068, 0, 1.5, 0.5, 0.5
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
-2, -3.90187, -5.536713,
2, -3.90187, -5.536713,
-2, -3.90187, -5.536713,
-2, -4.076245, -5.818899,
0, -3.90187, -5.536713,
0, -4.076245, -5.818899,
2, -3.90187, -5.536713,
2, -4.076245, -5.818899
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
-2, -4.424995, -6.383271, 0, -0.5, 0.5, 0.5,
-2, -4.424995, -6.383271, 1, -0.5, 0.5, 0.5,
-2, -4.424995, -6.383271, 1, 1.5, 0.5, 0.5,
-2, -4.424995, -6.383271, 0, 1.5, 0.5, 0.5,
0, -4.424995, -6.383271, 0, -0.5, 0.5, 0.5,
0, -4.424995, -6.383271, 1, -0.5, 0.5, 0.5,
0, -4.424995, -6.383271, 1, 1.5, 0.5, 0.5,
0, -4.424995, -6.383271, 0, 1.5, 0.5, 0.5,
2, -4.424995, -6.383271, 0, -0.5, 0.5, 0.5,
2, -4.424995, -6.383271, 1, -0.5, 0.5, 0.5,
2, -4.424995, -6.383271, 1, 1.5, 0.5, 0.5,
2, -4.424995, -6.383271, 0, 1.5, 0.5, 0.5
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
-3.792767, -3, -5.536713,
-3.792767, 2, -5.536713,
-3.792767, -3, -5.536713,
-3.97776, -3, -5.818899,
-3.792767, -2, -5.536713,
-3.97776, -2, -5.818899,
-3.792767, -1, -5.536713,
-3.97776, -1, -5.818899,
-3.792767, 0, -5.536713,
-3.97776, 0, -5.818899,
-3.792767, 1, -5.536713,
-3.97776, 1, -5.818899,
-3.792767, 2, -5.536713,
-3.97776, 2, -5.818899
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
-4.347744, -3, -6.383271, 0, -0.5, 0.5, 0.5,
-4.347744, -3, -6.383271, 1, -0.5, 0.5, 0.5,
-4.347744, -3, -6.383271, 1, 1.5, 0.5, 0.5,
-4.347744, -3, -6.383271, 0, 1.5, 0.5, 0.5,
-4.347744, -2, -6.383271, 0, -0.5, 0.5, 0.5,
-4.347744, -2, -6.383271, 1, -0.5, 0.5, 0.5,
-4.347744, -2, -6.383271, 1, 1.5, 0.5, 0.5,
-4.347744, -2, -6.383271, 0, 1.5, 0.5, 0.5,
-4.347744, -1, -6.383271, 0, -0.5, 0.5, 0.5,
-4.347744, -1, -6.383271, 1, -0.5, 0.5, 0.5,
-4.347744, -1, -6.383271, 1, 1.5, 0.5, 0.5,
-4.347744, -1, -6.383271, 0, 1.5, 0.5, 0.5,
-4.347744, 0, -6.383271, 0, -0.5, 0.5, 0.5,
-4.347744, 0, -6.383271, 1, -0.5, 0.5, 0.5,
-4.347744, 0, -6.383271, 1, 1.5, 0.5, 0.5,
-4.347744, 0, -6.383271, 0, 1.5, 0.5, 0.5,
-4.347744, 1, -6.383271, 0, -0.5, 0.5, 0.5,
-4.347744, 1, -6.383271, 1, -0.5, 0.5, 0.5,
-4.347744, 1, -6.383271, 1, 1.5, 0.5, 0.5,
-4.347744, 1, -6.383271, 0, 1.5, 0.5, 0.5,
-4.347744, 2, -6.383271, 0, -0.5, 0.5, 0.5,
-4.347744, 2, -6.383271, 1, -0.5, 0.5, 0.5,
-4.347744, 2, -6.383271, 1, 1.5, 0.5, 0.5,
-4.347744, 2, -6.383271, 0, 1.5, 0.5, 0.5
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
-3.792767, -3.90187, -4,
-3.792767, -3.90187, 4,
-3.792767, -3.90187, -4,
-3.97776, -4.076245, -4,
-3.792767, -3.90187, -2,
-3.97776, -4.076245, -2,
-3.792767, -3.90187, 0,
-3.97776, -4.076245, 0,
-3.792767, -3.90187, 2,
-3.97776, -4.076245, 2,
-3.792767, -3.90187, 4,
-3.97776, -4.076245, 4
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
-4.347744, -4.424995, -4, 0, -0.5, 0.5, 0.5,
-4.347744, -4.424995, -4, 1, -0.5, 0.5, 0.5,
-4.347744, -4.424995, -4, 1, 1.5, 0.5, 0.5,
-4.347744, -4.424995, -4, 0, 1.5, 0.5, 0.5,
-4.347744, -4.424995, -2, 0, -0.5, 0.5, 0.5,
-4.347744, -4.424995, -2, 1, -0.5, 0.5, 0.5,
-4.347744, -4.424995, -2, 1, 1.5, 0.5, 0.5,
-4.347744, -4.424995, -2, 0, 1.5, 0.5, 0.5,
-4.347744, -4.424995, 0, 0, -0.5, 0.5, 0.5,
-4.347744, -4.424995, 0, 1, -0.5, 0.5, 0.5,
-4.347744, -4.424995, 0, 1, 1.5, 0.5, 0.5,
-4.347744, -4.424995, 0, 0, 1.5, 0.5, 0.5,
-4.347744, -4.424995, 2, 0, -0.5, 0.5, 0.5,
-4.347744, -4.424995, 2, 1, -0.5, 0.5, 0.5,
-4.347744, -4.424995, 2, 1, 1.5, 0.5, 0.5,
-4.347744, -4.424995, 2, 0, 1.5, 0.5, 0.5,
-4.347744, -4.424995, 4, 0, -0.5, 0.5, 0.5,
-4.347744, -4.424995, 4, 1, -0.5, 0.5, 0.5,
-4.347744, -4.424995, 4, 1, 1.5, 0.5, 0.5,
-4.347744, -4.424995, 4, 0, 1.5, 0.5, 0.5
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
-3.792767, -3.90187, -5.536713,
-3.792767, 3.073138, -5.536713,
-3.792767, -3.90187, 5.750727,
-3.792767, 3.073138, 5.750727,
-3.792767, -3.90187, -5.536713,
-3.792767, -3.90187, 5.750727,
-3.792767, 3.073138, -5.536713,
-3.792767, 3.073138, 5.750727,
-3.792767, -3.90187, -5.536713,
3.606925, -3.90187, -5.536713,
-3.792767, -3.90187, 5.750727,
3.606925, -3.90187, 5.750727,
-3.792767, 3.073138, -5.536713,
3.606925, 3.073138, -5.536713,
-3.792767, 3.073138, 5.750727,
3.606925, 3.073138, 5.750727,
3.606925, -3.90187, -5.536713,
3.606925, 3.073138, -5.536713,
3.606925, -3.90187, 5.750727,
3.606925, 3.073138, 5.750727,
3.606925, -3.90187, -5.536713,
3.606925, -3.90187, 5.750727,
3.606925, 3.073138, -5.536713,
3.606925, 3.073138, 5.750727
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
var radius = 8.112508;
var distance = 36.09346;
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
mvMatrix.translate( 0.0929209, 0.4143656, -0.1070068 );
mvMatrix.scale( 1.185374, 1.257547, 0.777094 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.09346);
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


