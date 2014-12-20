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
-3.061218, 0.4429816, -0.4922504, 1, 0, 0, 1,
-2.939598, -0.2801632, -1.452967, 1, 0.007843138, 0, 1,
-2.668487, 1.442416, -0.2586219, 1, 0.01176471, 0, 1,
-2.660797, 0.8059062, -1.827356, 1, 0.01960784, 0, 1,
-2.574746, 0.8625517, -1.58893, 1, 0.02352941, 0, 1,
-2.506751, 1.443657, -1.721628, 1, 0.03137255, 0, 1,
-2.478743, -1.86031, -3.130177, 1, 0.03529412, 0, 1,
-2.477364, 0.2696375, -2.622653, 1, 0.04313726, 0, 1,
-2.463543, -0.90926, -1.833161, 1, 0.04705882, 0, 1,
-2.441229, -0.4721922, -1.493406, 1, 0.05490196, 0, 1,
-2.389135, 0.1664149, -2.735002, 1, 0.05882353, 0, 1,
-2.36526, -0.1335298, -3.12302, 1, 0.06666667, 0, 1,
-2.311924, -1.794564, -3.833332, 1, 0.07058824, 0, 1,
-2.294686, -0.477316, -3.390529, 1, 0.07843138, 0, 1,
-2.179199, -2.237761, -1.659998, 1, 0.08235294, 0, 1,
-2.165372, -1.309275, -1.877117, 1, 0.09019608, 0, 1,
-2.160899, -0.04685498, -2.592193, 1, 0.09411765, 0, 1,
-2.154583, -0.7939756, -2.492799, 1, 0.1019608, 0, 1,
-2.127519, 0.4454122, -0.8817855, 1, 0.1098039, 0, 1,
-2.123603, 0.8094792, -0.8023173, 1, 0.1137255, 0, 1,
-2.113413, 0.6548003, -2.718041, 1, 0.1215686, 0, 1,
-2.04042, -1.135954, -3.014174, 1, 0.1254902, 0, 1,
-2.030464, 0.04154142, -1.104684, 1, 0.1333333, 0, 1,
-2.005818, -1.51326, -0.683494, 1, 0.1372549, 0, 1,
-1.995997, -0.5291696, -1.88187, 1, 0.145098, 0, 1,
-1.987954, 0.6879401, -0.6106284, 1, 0.1490196, 0, 1,
-1.981168, -0.1468654, -1.575294, 1, 0.1568628, 0, 1,
-1.963475, 1.427166, -2.35256, 1, 0.1607843, 0, 1,
-1.960279, 0.5725796, -2.376681, 1, 0.1686275, 0, 1,
-1.914791, 0.3062876, -1.456236, 1, 0.172549, 0, 1,
-1.884839, 1.07269, -1.893476, 1, 0.1803922, 0, 1,
-1.880381, -0.532047, -4.082236, 1, 0.1843137, 0, 1,
-1.86148, -0.2297516, -2.531324, 1, 0.1921569, 0, 1,
-1.859272, -0.8570712, -3.014385, 1, 0.1960784, 0, 1,
-1.85559, 0.7010752, -1.216133, 1, 0.2039216, 0, 1,
-1.849397, 0.3358833, -1.304471, 1, 0.2117647, 0, 1,
-1.847872, 0.4135819, -2.786602, 1, 0.2156863, 0, 1,
-1.840254, -0.2065372, -1.478815, 1, 0.2235294, 0, 1,
-1.839467, 0.7258105, -0.8333729, 1, 0.227451, 0, 1,
-1.822809, -0.05034584, -0.8534539, 1, 0.2352941, 0, 1,
-1.822529, 0.8207076, -1.227388, 1, 0.2392157, 0, 1,
-1.801345, -1.895631, -4.556678, 1, 0.2470588, 0, 1,
-1.787303, 0.2834676, -1.667518, 1, 0.2509804, 0, 1,
-1.78709, -0.677352, -0.7370716, 1, 0.2588235, 0, 1,
-1.777753, -0.6681851, -0.9692858, 1, 0.2627451, 0, 1,
-1.773374, -0.1263923, -1.097089, 1, 0.2705882, 0, 1,
-1.749351, -0.2898162, -2.511784, 1, 0.2745098, 0, 1,
-1.745418, -1.679643, -2.122315, 1, 0.282353, 0, 1,
-1.743276, -0.4541389, -0.8301116, 1, 0.2862745, 0, 1,
-1.728271, 0.150675, -2.114491, 1, 0.2941177, 0, 1,
-1.709875, 2.011812, -0.8408909, 1, 0.3019608, 0, 1,
-1.694673, 0.6340002, -2.635724, 1, 0.3058824, 0, 1,
-1.673473, -0.8110968, -1.612292, 1, 0.3137255, 0, 1,
-1.616089, -0.6214856, -0.7529634, 1, 0.3176471, 0, 1,
-1.60145, -0.373118, -1.367868, 1, 0.3254902, 0, 1,
-1.571133, 0.5359561, -0.877821, 1, 0.3294118, 0, 1,
-1.566866, -0.9636819, -2.673262, 1, 0.3372549, 0, 1,
-1.560168, -1.584772, -3.383953, 1, 0.3411765, 0, 1,
-1.546712, 0.5220359, -2.147433, 1, 0.3490196, 0, 1,
-1.54021, -0.8698697, -0.9631305, 1, 0.3529412, 0, 1,
-1.536293, 0.2086727, -0.2055566, 1, 0.3607843, 0, 1,
-1.531948, -1.481013, -1.855894, 1, 0.3647059, 0, 1,
-1.520672, -0.9016435, -1.610028, 1, 0.372549, 0, 1,
-1.513672, 0.3183459, -0.9895843, 1, 0.3764706, 0, 1,
-1.512947, -0.583451, -2.030756, 1, 0.3843137, 0, 1,
-1.507065, -0.07944258, -2.155401, 1, 0.3882353, 0, 1,
-1.494846, 2.508326, -0.2873105, 1, 0.3960784, 0, 1,
-1.484403, 0.2151195, -2.001793, 1, 0.4039216, 0, 1,
-1.480025, -0.6938636, -2.371463, 1, 0.4078431, 0, 1,
-1.47877, -0.5317926, -1.267517, 1, 0.4156863, 0, 1,
-1.478737, -1.032143, -1.641411, 1, 0.4196078, 0, 1,
-1.468779, 0.9369202, -0.2619313, 1, 0.427451, 0, 1,
-1.4666, -0.795124, -2.367979, 1, 0.4313726, 0, 1,
-1.455129, -1.608092, -2.388234, 1, 0.4392157, 0, 1,
-1.447539, 1.123238, -1.974563, 1, 0.4431373, 0, 1,
-1.442944, 0.3273007, -3.916251, 1, 0.4509804, 0, 1,
-1.442149, -0.2064811, -0.6769515, 1, 0.454902, 0, 1,
-1.439328, -2.061642, -4.560307, 1, 0.4627451, 0, 1,
-1.429215, -0.2653619, -1.965619, 1, 0.4666667, 0, 1,
-1.401449, -1.153597, -3.61156, 1, 0.4745098, 0, 1,
-1.400358, 1.381062, -0.9636361, 1, 0.4784314, 0, 1,
-1.398164, 0.983921, -0.2564559, 1, 0.4862745, 0, 1,
-1.388582, 0.6884104, -1.093212, 1, 0.4901961, 0, 1,
-1.384462, 1.027364, -0.1041844, 1, 0.4980392, 0, 1,
-1.370172, -0.6653615, -0.2679194, 1, 0.5058824, 0, 1,
-1.364201, 1.179772, -0.7692064, 1, 0.509804, 0, 1,
-1.358263, -2.579444, -3.682549, 1, 0.5176471, 0, 1,
-1.35424, -1.774033, -1.071209, 1, 0.5215687, 0, 1,
-1.349467, -0.2836735, -0.6225635, 1, 0.5294118, 0, 1,
-1.348319, -0.4695802, -1.480362, 1, 0.5333334, 0, 1,
-1.344185, 0.09443311, -1.460198, 1, 0.5411765, 0, 1,
-1.331039, -0.777907, -2.757048, 1, 0.5450981, 0, 1,
-1.3264, 0.4483783, -1.565758, 1, 0.5529412, 0, 1,
-1.325546, 0.273993, -2.498619, 1, 0.5568628, 0, 1,
-1.324332, -1.056171, -1.843383, 1, 0.5647059, 0, 1,
-1.317532, 0.2998568, -2.475672, 1, 0.5686275, 0, 1,
-1.305169, 0.02140881, -2.231841, 1, 0.5764706, 0, 1,
-1.303361, -0.419807, -3.074552, 1, 0.5803922, 0, 1,
-1.301615, 0.6493399, -1.342852, 1, 0.5882353, 0, 1,
-1.299547, 1.943995, -0.9703221, 1, 0.5921569, 0, 1,
-1.294804, 0.9136906, -1.006868, 1, 0.6, 0, 1,
-1.287315, 0.4871449, 0.5482005, 1, 0.6078432, 0, 1,
-1.280694, 0.3280464, -0.9855137, 1, 0.6117647, 0, 1,
-1.277735, 0.7563908, 1.281977, 1, 0.6196079, 0, 1,
-1.276878, -0.5435413, -2.256902, 1, 0.6235294, 0, 1,
-1.267625, 1.676367, -0.5679483, 1, 0.6313726, 0, 1,
-1.266372, 0.5622424, -0.3530968, 1, 0.6352941, 0, 1,
-1.261698, -1.914335, -3.255221, 1, 0.6431373, 0, 1,
-1.25627, 0.290107, -1.132974, 1, 0.6470588, 0, 1,
-1.252676, 0.1641508, -1.907696, 1, 0.654902, 0, 1,
-1.236071, 0.2578681, -2.125728, 1, 0.6588235, 0, 1,
-1.227666, -2.848148, -3.132602, 1, 0.6666667, 0, 1,
-1.225668, -0.361486, -1.751552, 1, 0.6705883, 0, 1,
-1.221811, -0.1511187, -0.8570954, 1, 0.6784314, 0, 1,
-1.214465, 0.8299276, -2.554815, 1, 0.682353, 0, 1,
-1.208951, -0.8676043, -2.582095, 1, 0.6901961, 0, 1,
-1.207106, -0.4943543, -2.50104, 1, 0.6941177, 0, 1,
-1.202687, 1.007861, 0.4640393, 1, 0.7019608, 0, 1,
-1.199018, 0.4390467, -2.240119, 1, 0.7098039, 0, 1,
-1.196155, 0.9144133, -2.070911, 1, 0.7137255, 0, 1,
-1.195623, 0.5553663, 0.05328989, 1, 0.7215686, 0, 1,
-1.194341, -1.130954, -4.191379, 1, 0.7254902, 0, 1,
-1.191276, -1.624249, -1.624537, 1, 0.7333333, 0, 1,
-1.190435, 0.5146633, -0.3862798, 1, 0.7372549, 0, 1,
-1.183951, -0.04299656, -2.793349, 1, 0.7450981, 0, 1,
-1.176671, -0.01055256, -0.3760499, 1, 0.7490196, 0, 1,
-1.175378, -0.9174116, -4.006885, 1, 0.7568628, 0, 1,
-1.17442, 0.1554407, -0.9763008, 1, 0.7607843, 0, 1,
-1.174085, -0.5869256, -3.389154, 1, 0.7686275, 0, 1,
-1.17388, 1.19777, -2.319914, 1, 0.772549, 0, 1,
-1.17025, 0.8391015, -0.04606464, 1, 0.7803922, 0, 1,
-1.140112, 0.8885813, 1.471703, 1, 0.7843137, 0, 1,
-1.130943, -0.3206184, -3.227931, 1, 0.7921569, 0, 1,
-1.128096, -0.5075078, -5.070206, 1, 0.7960784, 0, 1,
-1.113914, -1.611249, -3.443544, 1, 0.8039216, 0, 1,
-1.110038, 2.084123, -1.923862, 1, 0.8117647, 0, 1,
-1.108131, -0.9353043, -2.7694, 1, 0.8156863, 0, 1,
-1.106726, -1.024372, -1.493678, 1, 0.8235294, 0, 1,
-1.1011, 2.222903, -0.2070127, 1, 0.827451, 0, 1,
-1.084396, -0.1942537, -1.161729, 1, 0.8352941, 0, 1,
-1.081028, -0.1410702, -1.772372, 1, 0.8392157, 0, 1,
-1.079083, -0.5275638, -0.8880662, 1, 0.8470588, 0, 1,
-1.076384, -1.160144, -1.865289, 1, 0.8509804, 0, 1,
-1.075552, -0.6357015, -1.490329, 1, 0.8588235, 0, 1,
-1.063051, 1.120157, -0.3372464, 1, 0.8627451, 0, 1,
-1.063024, -0.5190703, -1.951768, 1, 0.8705882, 0, 1,
-1.054189, -0.1403241, -1.582857, 1, 0.8745098, 0, 1,
-1.053565, -0.7765411, -0.7630334, 1, 0.8823529, 0, 1,
-1.049855, -0.0001067283, -3.489905, 1, 0.8862745, 0, 1,
-1.049312, 0.3274063, -1.828276, 1, 0.8941177, 0, 1,
-1.048669, 1.132806, -2.083231, 1, 0.8980392, 0, 1,
-1.042629, 0.4459442, 0.1950922, 1, 0.9058824, 0, 1,
-1.038737, 1.101403, 1.16107, 1, 0.9137255, 0, 1,
-1.0358, 1.198506, -1.219597, 1, 0.9176471, 0, 1,
-1.02962, -0.1507805, -2.201715, 1, 0.9254902, 0, 1,
-1.026793, -0.3511439, -2.050573, 1, 0.9294118, 0, 1,
-1.025966, -1.011676, -1.434401, 1, 0.9372549, 0, 1,
-1.016739, 1.363605, -0.8941848, 1, 0.9411765, 0, 1,
-1.015612, 1.872398, -0.9770004, 1, 0.9490196, 0, 1,
-1.015266, -0.178885, -1.678261, 1, 0.9529412, 0, 1,
-1.002014, 1.994025, 1.000969, 1, 0.9607843, 0, 1,
-0.9874586, -0.5034817, -2.391518, 1, 0.9647059, 0, 1,
-0.9814633, 0.3342791, -0.5470374, 1, 0.972549, 0, 1,
-0.9781491, 1.255323, 0.2813944, 1, 0.9764706, 0, 1,
-0.9762371, -1.109681, -2.686409, 1, 0.9843137, 0, 1,
-0.974808, 0.6117115, -0.1119028, 1, 0.9882353, 0, 1,
-0.9620058, 1.761062, -0.9283817, 1, 0.9960784, 0, 1,
-0.961316, 0.6593976, -1.239219, 0.9960784, 1, 0, 1,
-0.9589307, -0.4702407, -2.465386, 0.9921569, 1, 0, 1,
-0.9554839, -2.142765, -3.510638, 0.9843137, 1, 0, 1,
-0.95528, -0.1563994, -2.661169, 0.9803922, 1, 0, 1,
-0.9546226, -0.5724267, -2.190667, 0.972549, 1, 0, 1,
-0.9516755, -0.1234401, 0.06163371, 0.9686275, 1, 0, 1,
-0.9481257, 0.1863132, -1.902211, 0.9607843, 1, 0, 1,
-0.9460586, -1.359734, -2.962956, 0.9568627, 1, 0, 1,
-0.9410154, 0.9269367, -0.9800322, 0.9490196, 1, 0, 1,
-0.931047, 0.2031722, -0.01509869, 0.945098, 1, 0, 1,
-0.9298551, -0.2903484, -1.591291, 0.9372549, 1, 0, 1,
-0.9276769, 0.753735, -1.033986, 0.9333333, 1, 0, 1,
-0.9271789, 0.5540432, -0.6722203, 0.9254902, 1, 0, 1,
-0.9264961, 1.930382, 0.9482781, 0.9215686, 1, 0, 1,
-0.9206776, 1.233044, -0.9354678, 0.9137255, 1, 0, 1,
-0.9191074, 0.3559158, -0.7349108, 0.9098039, 1, 0, 1,
-0.9141544, 1.384729, -2.160724, 0.9019608, 1, 0, 1,
-0.9122285, -1.291069, -2.833353, 0.8941177, 1, 0, 1,
-0.9119864, 0.1378597, -2.735566, 0.8901961, 1, 0, 1,
-0.9087191, 0.0492343, -2.46749, 0.8823529, 1, 0, 1,
-0.9038682, 0.9861981, -0.133068, 0.8784314, 1, 0, 1,
-0.9003319, 1.785951, -0.4653844, 0.8705882, 1, 0, 1,
-0.8899546, -0.403194, -2.045096, 0.8666667, 1, 0, 1,
-0.8892631, 0.3230088, -0.4866841, 0.8588235, 1, 0, 1,
-0.8758745, 0.4945211, -0.3480416, 0.854902, 1, 0, 1,
-0.8738396, 0.3054058, -0.02630431, 0.8470588, 1, 0, 1,
-0.8634841, -0.0343625, -2.337719, 0.8431373, 1, 0, 1,
-0.8576001, -0.4254895, -0.8414948, 0.8352941, 1, 0, 1,
-0.8555091, -0.2336117, -1.808916, 0.8313726, 1, 0, 1,
-0.8525788, -1.164806, -2.881407, 0.8235294, 1, 0, 1,
-0.8401639, -1.037288, -3.485274, 0.8196079, 1, 0, 1,
-0.836122, 0.4027177, -0.1145815, 0.8117647, 1, 0, 1,
-0.8282933, 0.7540504, 0.4066839, 0.8078431, 1, 0, 1,
-0.8224421, 0.1757314, -1.121507, 0.8, 1, 0, 1,
-0.8160971, -0.7323632, -2.65523, 0.7921569, 1, 0, 1,
-0.8130391, -1.537204, -1.163534, 0.7882353, 1, 0, 1,
-0.8094752, 1.268843, -0.3373147, 0.7803922, 1, 0, 1,
-0.8065172, 0.6318634, 0.03355638, 0.7764706, 1, 0, 1,
-0.8029043, 0.6276578, 0.184205, 0.7686275, 1, 0, 1,
-0.7961681, 0.383001, -0.2289476, 0.7647059, 1, 0, 1,
-0.7960065, 0.008513681, 0.711641, 0.7568628, 1, 0, 1,
-0.7955986, -1.888553, -1.769086, 0.7529412, 1, 0, 1,
-0.7943722, 1.199181, -1.656151, 0.7450981, 1, 0, 1,
-0.7915623, 0.2187539, 0.2045419, 0.7411765, 1, 0, 1,
-0.7914851, 0.3692503, 0.9000338, 0.7333333, 1, 0, 1,
-0.781444, -0.3162702, -2.351719, 0.7294118, 1, 0, 1,
-0.7776613, -0.2891403, -1.692742, 0.7215686, 1, 0, 1,
-0.7773488, 0.01901743, -1.774579, 0.7176471, 1, 0, 1,
-0.7700992, 2.330253, 0.3038394, 0.7098039, 1, 0, 1,
-0.7682488, 1.596273, -0.9793747, 0.7058824, 1, 0, 1,
-0.7650246, -0.5464059, -3.17224, 0.6980392, 1, 0, 1,
-0.7618539, 0.366247, 0.3339512, 0.6901961, 1, 0, 1,
-0.758859, 1.842577, -1.624341, 0.6862745, 1, 0, 1,
-0.7508773, 0.2558566, -1.64839, 0.6784314, 1, 0, 1,
-0.7495625, 0.357087, 0.9297241, 0.6745098, 1, 0, 1,
-0.7492413, -2.295802, -3.80932, 0.6666667, 1, 0, 1,
-0.7463075, -1.206103, -3.081129, 0.6627451, 1, 0, 1,
-0.7458622, 0.5181726, -0.9669589, 0.654902, 1, 0, 1,
-0.7438562, -0.1869452, -2.402008, 0.6509804, 1, 0, 1,
-0.7406808, 1.140091, -0.06566635, 0.6431373, 1, 0, 1,
-0.7379429, -1.52248, -1.900716, 0.6392157, 1, 0, 1,
-0.7276165, -0.9761478, -2.90105, 0.6313726, 1, 0, 1,
-0.7227593, 0.5738161, -1.60752, 0.627451, 1, 0, 1,
-0.71474, -1.455929, -2.013068, 0.6196079, 1, 0, 1,
-0.707753, -0.8620136, -3.571172, 0.6156863, 1, 0, 1,
-0.7046305, 0.7382692, -1.529679, 0.6078432, 1, 0, 1,
-0.6986946, 0.5021428, 0.4203225, 0.6039216, 1, 0, 1,
-0.6959605, -1.444821, -2.188358, 0.5960785, 1, 0, 1,
-0.695249, 1.890079, -0.1765326, 0.5882353, 1, 0, 1,
-0.6832633, -0.01818386, -1.744758, 0.5843138, 1, 0, 1,
-0.6765373, 0.8672835, -0.8142977, 0.5764706, 1, 0, 1,
-0.6731818, -0.8590945, -3.553035, 0.572549, 1, 0, 1,
-0.6707564, 0.5065657, -2.215652, 0.5647059, 1, 0, 1,
-0.6686829, -0.05559714, -2.891571, 0.5607843, 1, 0, 1,
-0.6660065, -1.751966, -1.399895, 0.5529412, 1, 0, 1,
-0.6626754, 0.4026225, 0.2278304, 0.5490196, 1, 0, 1,
-0.6619535, 0.6247103, -1.164222, 0.5411765, 1, 0, 1,
-0.6535258, -0.3717113, -2.985141, 0.5372549, 1, 0, 1,
-0.6534467, 2.233298, 0.3684565, 0.5294118, 1, 0, 1,
-0.6531858, -1.179845, -2.318252, 0.5254902, 1, 0, 1,
-0.6526556, 1.299067, -1.394627, 0.5176471, 1, 0, 1,
-0.6512348, -0.6573339, -3.661089, 0.5137255, 1, 0, 1,
-0.6489576, 1.041003, 0.4490507, 0.5058824, 1, 0, 1,
-0.6480813, 0.4193486, 0.6905696, 0.5019608, 1, 0, 1,
-0.6446066, -0.4327788, -2.919886, 0.4941176, 1, 0, 1,
-0.6402704, -0.08633313, -1.193296, 0.4862745, 1, 0, 1,
-0.6380476, -0.9692025, -3.802418, 0.4823529, 1, 0, 1,
-0.6368452, -0.1221065, -1.670066, 0.4745098, 1, 0, 1,
-0.6344044, 0.3338848, -0.6961761, 0.4705882, 1, 0, 1,
-0.632487, -0.7796511, -1.969747, 0.4627451, 1, 0, 1,
-0.6305367, 0.1251274, -0.4163808, 0.4588235, 1, 0, 1,
-0.6287139, -0.4445667, -2.633327, 0.4509804, 1, 0, 1,
-0.6281148, 0.5466452, -1.451218, 0.4470588, 1, 0, 1,
-0.6215091, -0.4154769, -1.167275, 0.4392157, 1, 0, 1,
-0.6195116, 0.2171763, -1.532063, 0.4352941, 1, 0, 1,
-0.616834, -0.5244157, -1.361309, 0.427451, 1, 0, 1,
-0.6040082, -0.04377224, -1.15487, 0.4235294, 1, 0, 1,
-0.6026369, -1.191915, -2.154057, 0.4156863, 1, 0, 1,
-0.5952316, -1.065322, -2.467891, 0.4117647, 1, 0, 1,
-0.5941314, 0.754278, -1.933724, 0.4039216, 1, 0, 1,
-0.5933688, 1.134584, -0.2234803, 0.3960784, 1, 0, 1,
-0.5922984, 0.254146, -1.531775, 0.3921569, 1, 0, 1,
-0.5851711, -1.643985, -3.090526, 0.3843137, 1, 0, 1,
-0.5833352, 0.6660532, -0.9727914, 0.3803922, 1, 0, 1,
-0.5832587, 2.117363, 0.5400879, 0.372549, 1, 0, 1,
-0.5819443, 0.2376616, -2.658105, 0.3686275, 1, 0, 1,
-0.5814867, -0.206015, -1.486008, 0.3607843, 1, 0, 1,
-0.5807672, -0.9842582, -3.442082, 0.3568628, 1, 0, 1,
-0.5778075, -0.8815834, -0.4657688, 0.3490196, 1, 0, 1,
-0.5744006, -0.1540438, -3.648562, 0.345098, 1, 0, 1,
-0.5741043, 0.7834846, 0.1550387, 0.3372549, 1, 0, 1,
-0.5725049, 0.1795257, -1.202726, 0.3333333, 1, 0, 1,
-0.5700387, 1.07308, -0.4439579, 0.3254902, 1, 0, 1,
-0.5683059, 0.4948853, -2.184612, 0.3215686, 1, 0, 1,
-0.5678646, 0.8361784, -0.09972957, 0.3137255, 1, 0, 1,
-0.563545, 2.231042, 0.9717658, 0.3098039, 1, 0, 1,
-0.5611797, 0.4019712, -0.9197978, 0.3019608, 1, 0, 1,
-0.5611027, -0.3430531, -0.5084866, 0.2941177, 1, 0, 1,
-0.552864, 1.661316, 0.8344228, 0.2901961, 1, 0, 1,
-0.5494825, -0.1666867, -1.196482, 0.282353, 1, 0, 1,
-0.5435421, -0.4892556, -1.166366, 0.2784314, 1, 0, 1,
-0.5397019, -0.6959046, -4.153024, 0.2705882, 1, 0, 1,
-0.5374419, -0.9854652, -1.848703, 0.2666667, 1, 0, 1,
-0.536122, 0.2024637, -2.181043, 0.2588235, 1, 0, 1,
-0.5321047, -0.5667609, -2.342576, 0.254902, 1, 0, 1,
-0.5298663, 0.390199, -3.625618, 0.2470588, 1, 0, 1,
-0.5296918, -1.196424, -0.763714, 0.2431373, 1, 0, 1,
-0.5293255, -0.893626, -2.951276, 0.2352941, 1, 0, 1,
-0.528254, -0.04705436, -1.482854, 0.2313726, 1, 0, 1,
-0.5274225, 1.119563, 0.01378357, 0.2235294, 1, 0, 1,
-0.5271707, 0.9975131, -0.5072998, 0.2196078, 1, 0, 1,
-0.5262756, -0.345826, -3.779352, 0.2117647, 1, 0, 1,
-0.5251742, 0.001336224, -1.093859, 0.2078431, 1, 0, 1,
-0.5244852, 0.9834972, -0.1777781, 0.2, 1, 0, 1,
-0.5240352, 0.7211902, -0.1815598, 0.1921569, 1, 0, 1,
-0.5182065, -1.109568, -4.489786, 0.1882353, 1, 0, 1,
-0.5153355, -0.813446, -2.107044, 0.1803922, 1, 0, 1,
-0.5132856, -0.5439124, -2.500221, 0.1764706, 1, 0, 1,
-0.5123293, -0.5228091, -3.284296, 0.1686275, 1, 0, 1,
-0.5083783, -1.750148, -2.194701, 0.1647059, 1, 0, 1,
-0.5052891, -1.587046, -2.254668, 0.1568628, 1, 0, 1,
-0.5051317, 2.316708, -1.295692, 0.1529412, 1, 0, 1,
-0.4994575, -1.038915, -4.179403, 0.145098, 1, 0, 1,
-0.4985428, -0.4457823, -0.4333542, 0.1411765, 1, 0, 1,
-0.4901102, 0.965004, -0.823949, 0.1333333, 1, 0, 1,
-0.4898065, 0.5122201, -0.1781294, 0.1294118, 1, 0, 1,
-0.4891495, 0.7552615, -0.01066514, 0.1215686, 1, 0, 1,
-0.4862953, 0.4914566, -0.5954446, 0.1176471, 1, 0, 1,
-0.4841523, -0.3291888, -0.9904687, 0.1098039, 1, 0, 1,
-0.4841452, 1.642266, -1.110012, 0.1058824, 1, 0, 1,
-0.4836062, -1.100006, -3.420196, 0.09803922, 1, 0, 1,
-0.4774136, 0.04782623, -1.124353, 0.09019608, 1, 0, 1,
-0.4740584, -2.741425, -1.918401, 0.08627451, 1, 0, 1,
-0.4663007, -1.447091, -3.475049, 0.07843138, 1, 0, 1,
-0.4626572, -0.5644681, -1.747114, 0.07450981, 1, 0, 1,
-0.4599108, -1.674694, -3.179934, 0.06666667, 1, 0, 1,
-0.4544061, 1.087239, -0.2738126, 0.0627451, 1, 0, 1,
-0.4525504, 1.194125, -0.3522891, 0.05490196, 1, 0, 1,
-0.4496937, 0.247623, -3.159302, 0.05098039, 1, 0, 1,
-0.4488932, -2.104114, -3.914049, 0.04313726, 1, 0, 1,
-0.4480059, 0.02579909, -1.022041, 0.03921569, 1, 0, 1,
-0.4479305, -1.396023, -2.782712, 0.03137255, 1, 0, 1,
-0.4466982, -0.997771, -2.833503, 0.02745098, 1, 0, 1,
-0.4462287, -1.231476, -3.209836, 0.01960784, 1, 0, 1,
-0.4448231, 0.7128623, -0.3480513, 0.01568628, 1, 0, 1,
-0.4398907, 0.5304598, 0.01632845, 0.007843138, 1, 0, 1,
-0.4397533, -0.9512689, -1.654137, 0.003921569, 1, 0, 1,
-0.4244562, 1.041059, -1.381334, 0, 1, 0.003921569, 1,
-0.4242277, -1.315969, -1.941327, 0, 1, 0.01176471, 1,
-0.4221958, -0.1673183, -1.941693, 0, 1, 0.01568628, 1,
-0.4156284, 0.6088032, 0.6437466, 0, 1, 0.02352941, 1,
-0.4139832, -0.3991128, 0.3132914, 0, 1, 0.02745098, 1,
-0.4123554, -0.1842898, -2.993558, 0, 1, 0.03529412, 1,
-0.4105211, 0.6435674, -0.970724, 0, 1, 0.03921569, 1,
-0.4099706, -1.310062, -1.988813, 0, 1, 0.04705882, 1,
-0.40799, 0.4059234, 0.1237844, 0, 1, 0.05098039, 1,
-0.4034983, -0.7593747, -2.783021, 0, 1, 0.05882353, 1,
-0.3994366, -0.1986764, -1.951394, 0, 1, 0.0627451, 1,
-0.3960497, -0.5462236, -0.4220522, 0, 1, 0.07058824, 1,
-0.3944577, 1.28316, -1.665762, 0, 1, 0.07450981, 1,
-0.3917538, 1.441811, 0.2387311, 0, 1, 0.08235294, 1,
-0.3899071, 0.4396459, -0.6856681, 0, 1, 0.08627451, 1,
-0.3894608, 0.3721657, -1.379623, 0, 1, 0.09411765, 1,
-0.3885138, -1.101496, -2.989433, 0, 1, 0.1019608, 1,
-0.3867662, -0.6289558, -2.882712, 0, 1, 0.1058824, 1,
-0.3799993, 1.71661, -1.962435, 0, 1, 0.1137255, 1,
-0.3717217, 0.3950623, 0.2843156, 0, 1, 0.1176471, 1,
-0.3664959, -1.042445, -2.588567, 0, 1, 0.1254902, 1,
-0.3635939, 2.04961, -0.4953657, 0, 1, 0.1294118, 1,
-0.3627091, -0.9167839, -3.645768, 0, 1, 0.1372549, 1,
-0.361073, 0.6372933, 0.01990181, 0, 1, 0.1411765, 1,
-0.3555781, 2.47681, 0.4782803, 0, 1, 0.1490196, 1,
-0.3496953, -0.9793342, -2.981081, 0, 1, 0.1529412, 1,
-0.3491875, 1.064434, 0.3921808, 0, 1, 0.1607843, 1,
-0.3484155, -1.81617, -4.994774, 0, 1, 0.1647059, 1,
-0.3470895, 0.7724404, 0.451371, 0, 1, 0.172549, 1,
-0.3448785, -1.030654, -0.8032007, 0, 1, 0.1764706, 1,
-0.3446633, -0.5367382, -1.953139, 0, 1, 0.1843137, 1,
-0.3399055, -0.5331171, -2.082407, 0, 1, 0.1882353, 1,
-0.3381384, -1.342471, -2.899131, 0, 1, 0.1960784, 1,
-0.3376747, -2.319337, -0.7124996, 0, 1, 0.2039216, 1,
-0.3257479, -1.388411, -3.058885, 0, 1, 0.2078431, 1,
-0.3236288, 0.393894, -2.546903, 0, 1, 0.2156863, 1,
-0.3229302, 0.6934224, -0.7582668, 0, 1, 0.2196078, 1,
-0.3158667, -0.9013488, -2.200454, 0, 1, 0.227451, 1,
-0.3144245, 1.242992, -2.564333, 0, 1, 0.2313726, 1,
-0.3132969, 0.5811296, 0.5207626, 0, 1, 0.2392157, 1,
-0.3125221, -0.003918762, -2.603196, 0, 1, 0.2431373, 1,
-0.3119594, 0.2955252, 0.9312402, 0, 1, 0.2509804, 1,
-0.3115761, -2.215772, -4.723265, 0, 1, 0.254902, 1,
-0.3067228, 0.6700515, 1.888946, 0, 1, 0.2627451, 1,
-0.3036592, 0.01464301, -2.926948, 0, 1, 0.2666667, 1,
-0.3017604, 0.7544901, 0.3852653, 0, 1, 0.2745098, 1,
-0.3011988, -0.4632558, -2.133616, 0, 1, 0.2784314, 1,
-0.3004688, 0.2091189, 0.3583758, 0, 1, 0.2862745, 1,
-0.2949026, -0.4476155, -1.280885, 0, 1, 0.2901961, 1,
-0.2882836, 0.2110888, -1.109389, 0, 1, 0.2980392, 1,
-0.2863789, 1.138105, -0.1784049, 0, 1, 0.3058824, 1,
-0.2855349, -0.6806381, -2.246733, 0, 1, 0.3098039, 1,
-0.2843795, -1.212491, -3.084034, 0, 1, 0.3176471, 1,
-0.2798073, -0.01076469, -1.452702, 0, 1, 0.3215686, 1,
-0.2794254, 1.013835, 0.4458571, 0, 1, 0.3294118, 1,
-0.2788468, -0.05676257, -0.3859742, 0, 1, 0.3333333, 1,
-0.2779756, 0.5697669, -0.4545154, 0, 1, 0.3411765, 1,
-0.2772194, -0.546232, -2.29003, 0, 1, 0.345098, 1,
-0.2764128, 0.3483812, -1.559971, 0, 1, 0.3529412, 1,
-0.2678641, 0.07851996, -0.9119607, 0, 1, 0.3568628, 1,
-0.2635246, 0.4756569, -0.02254235, 0, 1, 0.3647059, 1,
-0.2629563, -0.8853065, -1.363634, 0, 1, 0.3686275, 1,
-0.2625326, 0.1528527, 0.6425157, 0, 1, 0.3764706, 1,
-0.2622623, 0.1649513, -1.559164, 0, 1, 0.3803922, 1,
-0.262027, -0.0194639, -2.209636, 0, 1, 0.3882353, 1,
-0.2594766, -0.07754128, -1.377367, 0, 1, 0.3921569, 1,
-0.257528, 1.222335, -0.7901693, 0, 1, 0.4, 1,
-0.2566257, -0.4594126, -3.274543, 0, 1, 0.4078431, 1,
-0.2555848, -1.429845, -2.342607, 0, 1, 0.4117647, 1,
-0.2523825, -0.4983015, -3.968681, 0, 1, 0.4196078, 1,
-0.2502723, 0.5950806, 0.6552197, 0, 1, 0.4235294, 1,
-0.2489699, 1.145391, 1.101542, 0, 1, 0.4313726, 1,
-0.2471468, -0.3161129, -3.695364, 0, 1, 0.4352941, 1,
-0.2434426, 0.3080752, -0.658864, 0, 1, 0.4431373, 1,
-0.2392324, 0.7412938, -1.36829, 0, 1, 0.4470588, 1,
-0.2391386, -0.01035628, -0.851304, 0, 1, 0.454902, 1,
-0.2379759, 0.8873705, -0.3675233, 0, 1, 0.4588235, 1,
-0.2339706, 0.9572551, 0.063467, 0, 1, 0.4666667, 1,
-0.2305456, 0.4016342, -0.7114837, 0, 1, 0.4705882, 1,
-0.2301417, -0.7031436, -2.539455, 0, 1, 0.4784314, 1,
-0.229168, 0.6178762, -0.4739227, 0, 1, 0.4823529, 1,
-0.221025, 1.943386, 0.2852947, 0, 1, 0.4901961, 1,
-0.2150385, 0.144097, -1.496368, 0, 1, 0.4941176, 1,
-0.2090333, 0.7769743, 0.4350291, 0, 1, 0.5019608, 1,
-0.2076009, -0.8268545, -4.973742, 0, 1, 0.509804, 1,
-0.201952, 1.568614, -0.329597, 0, 1, 0.5137255, 1,
-0.1982352, 0.7559813, -1.473706, 0, 1, 0.5215687, 1,
-0.1980311, -1.306003, -1.456958, 0, 1, 0.5254902, 1,
-0.1966703, -1.523508, -4.722888, 0, 1, 0.5333334, 1,
-0.1939435, -1.156767, -3.680475, 0, 1, 0.5372549, 1,
-0.1931718, -1.840774, -2.0794, 0, 1, 0.5450981, 1,
-0.1903735, 0.7715423, -0.3129217, 0, 1, 0.5490196, 1,
-0.1855946, 1.270678, -0.7221578, 0, 1, 0.5568628, 1,
-0.1805889, -0.1508135, -1.952702, 0, 1, 0.5607843, 1,
-0.1800812, 0.3182847, -0.3102331, 0, 1, 0.5686275, 1,
-0.1790641, -0.7376708, -2.328352, 0, 1, 0.572549, 1,
-0.1769993, 2.180986, -0.1818499, 0, 1, 0.5803922, 1,
-0.17677, -2.714336, -2.464381, 0, 1, 0.5843138, 1,
-0.1725888, -1.025697, -4.091995, 0, 1, 0.5921569, 1,
-0.171288, -0.06071497, -3.585953, 0, 1, 0.5960785, 1,
-0.1675476, -0.2532609, -0.9118606, 0, 1, 0.6039216, 1,
-0.1644691, -1.171532, -1.560554, 0, 1, 0.6117647, 1,
-0.1596865, 1.15577, 0.1421243, 0, 1, 0.6156863, 1,
-0.1592291, 1.299574, 0.6885081, 0, 1, 0.6235294, 1,
-0.1591558, 1.984555, 0.3690494, 0, 1, 0.627451, 1,
-0.158897, 1.000068, 0.1353807, 0, 1, 0.6352941, 1,
-0.1587555, 1.173841, 0.8705393, 0, 1, 0.6392157, 1,
-0.1563625, 0.2871315, -0.2449396, 0, 1, 0.6470588, 1,
-0.1563561, 0.4884576, -0.3309454, 0, 1, 0.6509804, 1,
-0.1521609, 0.4710813, -1.447272, 0, 1, 0.6588235, 1,
-0.1499353, 1.41012, -0.02335229, 0, 1, 0.6627451, 1,
-0.144496, -0.2040586, -3.382989, 0, 1, 0.6705883, 1,
-0.1432447, 0.5610322, -1.639375, 0, 1, 0.6745098, 1,
-0.1418603, -0.8935504, -3.674088, 0, 1, 0.682353, 1,
-0.1414277, 0.7304025, 0.9997419, 0, 1, 0.6862745, 1,
-0.1318694, -0.6058384, -3.175423, 0, 1, 0.6941177, 1,
-0.1311402, 1.489429, -0.6483567, 0, 1, 0.7019608, 1,
-0.1297268, 0.3302804, 0.3547652, 0, 1, 0.7058824, 1,
-0.1288335, -0.7268059, -3.052385, 0, 1, 0.7137255, 1,
-0.1273367, 1.369721, -1.278642, 0, 1, 0.7176471, 1,
-0.1271386, 1.409902, -0.7196712, 0, 1, 0.7254902, 1,
-0.1220133, 0.7164131, -0.6513656, 0, 1, 0.7294118, 1,
-0.1219268, -0.4808896, -1.477977, 0, 1, 0.7372549, 1,
-0.1210539, 0.2981445, -0.6134113, 0, 1, 0.7411765, 1,
-0.1193021, -0.1158456, -2.095707, 0, 1, 0.7490196, 1,
-0.117812, 1.487462, 1.130794, 0, 1, 0.7529412, 1,
-0.1169118, -0.857025, -5.022171, 0, 1, 0.7607843, 1,
-0.1160877, -0.4041601, -2.750149, 0, 1, 0.7647059, 1,
-0.1111022, 0.5051421, -0.9415277, 0, 1, 0.772549, 1,
-0.1018027, -0.2174989, -2.660502, 0, 1, 0.7764706, 1,
-0.09804703, -0.5751228, -3.819771, 0, 1, 0.7843137, 1,
-0.09498434, 0.02554421, -0.3638799, 0, 1, 0.7882353, 1,
-0.0948284, -1.183751, -2.949082, 0, 1, 0.7960784, 1,
-0.09151178, -0.0606721, -1.386101, 0, 1, 0.8039216, 1,
-0.09084994, -1.494278, -3.370368, 0, 1, 0.8078431, 1,
-0.09064969, -1.452226, -4.639222, 0, 1, 0.8156863, 1,
-0.08788796, -1.682404, -2.457819, 0, 1, 0.8196079, 1,
-0.08739692, -0.5425357, -2.535359, 0, 1, 0.827451, 1,
-0.08298297, 0.4781092, 1.194783, 0, 1, 0.8313726, 1,
-0.08188786, -0.6923232, -3.579818, 0, 1, 0.8392157, 1,
-0.08146456, 1.532951, -0.3291275, 0, 1, 0.8431373, 1,
-0.08115604, -2.368841, -1.970185, 0, 1, 0.8509804, 1,
-0.07972063, -0.01777372, -1.002501, 0, 1, 0.854902, 1,
-0.07944468, 0.6085849, -0.02649759, 0, 1, 0.8627451, 1,
-0.07661249, -0.1630789, -1.768391, 0, 1, 0.8666667, 1,
-0.07455122, -1.353101, -2.687044, 0, 1, 0.8745098, 1,
-0.07452027, 0.992125, 0.3900276, 0, 1, 0.8784314, 1,
-0.073685, 1.37798, -0.7524427, 0, 1, 0.8862745, 1,
-0.07193946, 0.5020546, 1.457321, 0, 1, 0.8901961, 1,
-0.07160395, -0.4204785, -1.67984, 0, 1, 0.8980392, 1,
-0.06949256, -0.6495702, -1.901806, 0, 1, 0.9058824, 1,
-0.06288427, 0.907344, -0.3957392, 0, 1, 0.9098039, 1,
-0.05867629, 1.244294, 1.811533, 0, 1, 0.9176471, 1,
-0.05486799, -0.8952739, -3.186874, 0, 1, 0.9215686, 1,
-0.05412602, 0.7524742, -0.4082367, 0, 1, 0.9294118, 1,
-0.05398111, -0.7230841, -2.07828, 0, 1, 0.9333333, 1,
-0.04605778, 0.1164657, 0.4113548, 0, 1, 0.9411765, 1,
-0.04592183, 1.622519, 0.3946473, 0, 1, 0.945098, 1,
-0.04335279, 0.2505483, 0.2715584, 0, 1, 0.9529412, 1,
-0.0404276, -0.08197808, -3.207669, 0, 1, 0.9568627, 1,
-0.03932189, -1.497486, -4.067575, 0, 1, 0.9647059, 1,
-0.0348574, 0.04882277, -1.290249, 0, 1, 0.9686275, 1,
-0.03135086, -2.652603, -4.414739, 0, 1, 0.9764706, 1,
-0.03074048, -0.3921539, -5.13621, 0, 1, 0.9803922, 1,
-0.02026629, 0.6015672, 0.9291708, 0, 1, 0.9882353, 1,
-0.02007228, 0.4557542, 0.03559073, 0, 1, 0.9921569, 1,
-0.01860243, -0.992718, -4.059861, 0, 1, 1, 1,
-0.01316392, -0.3117545, -1.961485, 0, 0.9921569, 1, 1,
-0.01176279, 0.1109248, 1.398611, 0, 0.9882353, 1, 1,
-0.01067637, -0.02025408, -2.500668, 0, 0.9803922, 1, 1,
-0.00799806, 1.078827, 0.565148, 0, 0.9764706, 1, 1,
-0.007009913, 1.321543, -1.863274, 0, 0.9686275, 1, 1,
-0.0004116841, 0.5392723, -1.380991, 0, 0.9647059, 1, 1,
6.813541e-05, 0.2521916, -1.518576, 0, 0.9568627, 1, 1,
0.005805148, 0.6959747, 1.576928, 0, 0.9529412, 1, 1,
0.008982676, 0.7860941, 0.05078273, 0, 0.945098, 1, 1,
0.01187285, 0.2406105, -0.2664926, 0, 0.9411765, 1, 1,
0.0126179, 0.008136803, 1.649052, 0, 0.9333333, 1, 1,
0.01283161, -1.972803, 4.027747, 0, 0.9294118, 1, 1,
0.01830257, -1.052478, 3.338462, 0, 0.9215686, 1, 1,
0.02002208, 0.3143868, 0.904588, 0, 0.9176471, 1, 1,
0.02140422, 0.3586892, -0.4779505, 0, 0.9098039, 1, 1,
0.0225637, 1.594641, -0.4408971, 0, 0.9058824, 1, 1,
0.02374032, -0.6997516, 2.493342, 0, 0.8980392, 1, 1,
0.02854812, 1.452683, -0.431015, 0, 0.8901961, 1, 1,
0.03206661, 1.684511, 0.7848371, 0, 0.8862745, 1, 1,
0.03523429, 0.4201757, 1.47087, 0, 0.8784314, 1, 1,
0.03844136, -0.2074313, 4.449333, 0, 0.8745098, 1, 1,
0.04146518, -0.1907507, 3.02918, 0, 0.8666667, 1, 1,
0.04193444, 0.2830295, -1.699414, 0, 0.8627451, 1, 1,
0.04263889, 0.6534216, 0.7965934, 0, 0.854902, 1, 1,
0.04682511, 1.782956, -1.125103, 0, 0.8509804, 1, 1,
0.05067357, 0.802568, -0.3402265, 0, 0.8431373, 1, 1,
0.05278777, -0.5411059, 1.397219, 0, 0.8392157, 1, 1,
0.05290785, -0.6194137, 3.875558, 0, 0.8313726, 1, 1,
0.05635057, -1.107846, 2.643511, 0, 0.827451, 1, 1,
0.05823537, -0.1681198, 2.768363, 0, 0.8196079, 1, 1,
0.05886349, 0.3966854, 0.4949685, 0, 0.8156863, 1, 1,
0.0603882, 0.7138282, 0.09634374, 0, 0.8078431, 1, 1,
0.06264751, -1.378972, 2.773921, 0, 0.8039216, 1, 1,
0.06509268, 0.8232494, -1.433801, 0, 0.7960784, 1, 1,
0.06799221, 0.7673605, -1.12128, 0, 0.7882353, 1, 1,
0.06964299, 1.150914, -0.279879, 0, 0.7843137, 1, 1,
0.07098528, 0.4824286, -1.531718, 0, 0.7764706, 1, 1,
0.07126208, 0.6153808, -1.433484, 0, 0.772549, 1, 1,
0.07522421, -0.1532017, 2.185582, 0, 0.7647059, 1, 1,
0.07848069, -0.1720548, 2.984261, 0, 0.7607843, 1, 1,
0.07937725, 0.05917882, 1.333992, 0, 0.7529412, 1, 1,
0.08459055, -0.1908748, 5.357409, 0, 0.7490196, 1, 1,
0.08649424, 0.6726702, 1.493357, 0, 0.7411765, 1, 1,
0.08801355, 1.210638, 0.9138633, 0, 0.7372549, 1, 1,
0.09622125, -0.4045903, 2.634058, 0, 0.7294118, 1, 1,
0.1010787, 0.2758777, -0.0256877, 0, 0.7254902, 1, 1,
0.1030698, -0.3593475, 4.659335, 0, 0.7176471, 1, 1,
0.1059724, -0.6094886, 3.614775, 0, 0.7137255, 1, 1,
0.1061789, -1.408846, 2.15926, 0, 0.7058824, 1, 1,
0.106852, -0.4801069, 4.05731, 0, 0.6980392, 1, 1,
0.1101864, -1.253636, 0.5328611, 0, 0.6941177, 1, 1,
0.1106508, -0.3870752, 3.374192, 0, 0.6862745, 1, 1,
0.1142122, 0.9599158, 0.5800753, 0, 0.682353, 1, 1,
0.1147144, -0.6730823, 4.003772, 0, 0.6745098, 1, 1,
0.1150734, 0.7208834, 0.6518012, 0, 0.6705883, 1, 1,
0.1165777, -0.4432007, 2.57242, 0, 0.6627451, 1, 1,
0.120366, -0.6971105, 3.336981, 0, 0.6588235, 1, 1,
0.1221301, 1.083742, 2.123818, 0, 0.6509804, 1, 1,
0.1231614, 0.7506474, 0.1859518, 0, 0.6470588, 1, 1,
0.1256349, -0.5503373, 2.738423, 0, 0.6392157, 1, 1,
0.1280354, 2.704908, 0.4067208, 0, 0.6352941, 1, 1,
0.1296091, 0.3760879, 1.245103, 0, 0.627451, 1, 1,
0.1342175, -1.154835, 2.410699, 0, 0.6235294, 1, 1,
0.134624, -0.6366916, 3.013231, 0, 0.6156863, 1, 1,
0.1363576, 0.2852397, 0.8182139, 0, 0.6117647, 1, 1,
0.1365297, 1.711347, -1.537479, 0, 0.6039216, 1, 1,
0.1423623, 0.5688652, -1.569138, 0, 0.5960785, 1, 1,
0.1442018, -1.388441, 3.228392, 0, 0.5921569, 1, 1,
0.1452704, -0.3466364, 2.394938, 0, 0.5843138, 1, 1,
0.1462298, 1.66307, 2.126624, 0, 0.5803922, 1, 1,
0.1510584, -0.6210733, 2.158938, 0, 0.572549, 1, 1,
0.1576655, 1.161655, -1.186306, 0, 0.5686275, 1, 1,
0.1576826, -0.8834931, 2.654327, 0, 0.5607843, 1, 1,
0.1619894, 0.3134649, 1.549541, 0, 0.5568628, 1, 1,
0.1623064, -0.9597073, 4.435481, 0, 0.5490196, 1, 1,
0.1646083, -1.297641, 1.564134, 0, 0.5450981, 1, 1,
0.1684186, 0.9170073, 1.772552, 0, 0.5372549, 1, 1,
0.1714067, 0.4537826, 0.2357385, 0, 0.5333334, 1, 1,
0.1783365, 0.7383043, 0.5475413, 0, 0.5254902, 1, 1,
0.1806011, -0.6622364, 2.925915, 0, 0.5215687, 1, 1,
0.1831046, -0.492493, 1.193742, 0, 0.5137255, 1, 1,
0.1887861, -0.1661856, 2.61204, 0, 0.509804, 1, 1,
0.196715, -0.9090887, 3.014409, 0, 0.5019608, 1, 1,
0.1979425, -2.367692, 2.187484, 0, 0.4941176, 1, 1,
0.2034233, -0.3756454, 4.866916, 0, 0.4901961, 1, 1,
0.204964, 0.1418647, 1.926838, 0, 0.4823529, 1, 1,
0.2096569, -1.172077, 3.612324, 0, 0.4784314, 1, 1,
0.2104422, 0.3134168, 0.3675812, 0, 0.4705882, 1, 1,
0.2130142, -0.8791984, 4.081271, 0, 0.4666667, 1, 1,
0.2224446, 1.0152, 0.9458371, 0, 0.4588235, 1, 1,
0.2245283, 2.036497, 1.919222, 0, 0.454902, 1, 1,
0.2253918, 0.5956632, -0.6259708, 0, 0.4470588, 1, 1,
0.2340619, 0.07984972, 0.5383825, 0, 0.4431373, 1, 1,
0.2354489, -1.173126, 2.096425, 0, 0.4352941, 1, 1,
0.2369317, -0.6558626, 0.9374459, 0, 0.4313726, 1, 1,
0.248006, 1.225317, -0.1901047, 0, 0.4235294, 1, 1,
0.2493369, -0.4698322, 2.681917, 0, 0.4196078, 1, 1,
0.2540573, 0.567063, 1.372224, 0, 0.4117647, 1, 1,
0.254403, -1.325601, 3.515154, 0, 0.4078431, 1, 1,
0.2557582, -0.1234715, 0.2265236, 0, 0.4, 1, 1,
0.2604685, 1.673278, -0.9614747, 0, 0.3921569, 1, 1,
0.2610272, -0.1518273, 1.389889, 0, 0.3882353, 1, 1,
0.2613919, -0.5304272, 2.092134, 0, 0.3803922, 1, 1,
0.2632103, 0.5764819, 0.08521737, 0, 0.3764706, 1, 1,
0.2660924, -0.7473449, 3.544043, 0, 0.3686275, 1, 1,
0.2662224, -1.961691, 1.874551, 0, 0.3647059, 1, 1,
0.2681421, 1.835463, -0.2748077, 0, 0.3568628, 1, 1,
0.2708467, 0.4318216, 0.9410794, 0, 0.3529412, 1, 1,
0.2716725, -1.314211, 3.612098, 0, 0.345098, 1, 1,
0.2727459, 0.7826666, 2.104318, 0, 0.3411765, 1, 1,
0.2740425, 0.04853753, 0.382622, 0, 0.3333333, 1, 1,
0.2756198, 1.366756, 2.596405, 0, 0.3294118, 1, 1,
0.2765607, 1.054687, -0.5081619, 0, 0.3215686, 1, 1,
0.2799609, 0.9306533, -1.644238, 0, 0.3176471, 1, 1,
0.2827593, 0.8719852, 0.1847534, 0, 0.3098039, 1, 1,
0.2856373, -0.1748931, 1.767668, 0, 0.3058824, 1, 1,
0.2881422, 1.041255, 0.4200957, 0, 0.2980392, 1, 1,
0.2894353, 0.9173909, 1.307968, 0, 0.2901961, 1, 1,
0.2900811, -0.5084378, 1.663581, 0, 0.2862745, 1, 1,
0.2916524, -0.1588687, 4.076201, 0, 0.2784314, 1, 1,
0.293756, 0.6932789, 0.4420715, 0, 0.2745098, 1, 1,
0.2959264, 1.129383, -0.4501458, 0, 0.2666667, 1, 1,
0.2986141, 0.4717028, 0.4815957, 0, 0.2627451, 1, 1,
0.2986558, 2.211454, 0.1890514, 0, 0.254902, 1, 1,
0.3036439, -0.839123, 3.96392, 0, 0.2509804, 1, 1,
0.3052798, 0.4527418, 0.5741597, 0, 0.2431373, 1, 1,
0.3065102, 0.8424484, 0.3707544, 0, 0.2392157, 1, 1,
0.307354, 1.405269, -1.17509, 0, 0.2313726, 1, 1,
0.3120722, 0.9766212, 0.6920804, 0, 0.227451, 1, 1,
0.3153238, -1.060697, 3.335854, 0, 0.2196078, 1, 1,
0.3208314, 0.8972841, 0.843888, 0, 0.2156863, 1, 1,
0.3220719, -0.01392018, 0.7189898, 0, 0.2078431, 1, 1,
0.3230281, 0.6659604, -0.09473187, 0, 0.2039216, 1, 1,
0.3296778, 0.1831116, 2.828096, 0, 0.1960784, 1, 1,
0.3321565, -0.6727833, 2.121343, 0, 0.1882353, 1, 1,
0.336091, -0.1110085, 0.8292195, 0, 0.1843137, 1, 1,
0.3370476, 0.1435142, -1.384512, 0, 0.1764706, 1, 1,
0.3387427, -0.1703301, 1.668161, 0, 0.172549, 1, 1,
0.3452652, -0.1506592, 1.356795, 0, 0.1647059, 1, 1,
0.3469658, 0.5773829, 0.7055064, 0, 0.1607843, 1, 1,
0.3514082, -0.3554918, 3.327346, 0, 0.1529412, 1, 1,
0.35472, -0.195931, 2.498247, 0, 0.1490196, 1, 1,
0.3587013, 0.8233199, -1.085311, 0, 0.1411765, 1, 1,
0.3616091, -3.911951e-05, 0.7467552, 0, 0.1372549, 1, 1,
0.3624088, 1.24918, -0.5814312, 0, 0.1294118, 1, 1,
0.3636444, -1.356065, 4.408121, 0, 0.1254902, 1, 1,
0.3659306, 1.859774, -0.3361742, 0, 0.1176471, 1, 1,
0.3674723, 0.5305586, 0.4352197, 0, 0.1137255, 1, 1,
0.3677182, 1.437444, -0.7601956, 0, 0.1058824, 1, 1,
0.370237, -0.5351234, 2.335836, 0, 0.09803922, 1, 1,
0.3746952, -0.3436019, 1.913112, 0, 0.09411765, 1, 1,
0.3812099, -0.5550293, 0.459687, 0, 0.08627451, 1, 1,
0.383288, 0.1236823, 2.793228, 0, 0.08235294, 1, 1,
0.3843462, 0.3257216, 0.3329734, 0, 0.07450981, 1, 1,
0.3866479, 0.2003672, 0.5399003, 0, 0.07058824, 1, 1,
0.390948, 0.8799639, -0.3075975, 0, 0.0627451, 1, 1,
0.4025492, -0.8805538, 1.972005, 0, 0.05882353, 1, 1,
0.4037073, -1.462059, 2.677528, 0, 0.05098039, 1, 1,
0.4072738, 2.468393, -1.539248, 0, 0.04705882, 1, 1,
0.4185115, 0.757378, 1.6693, 0, 0.03921569, 1, 1,
0.4193543, 0.9153327, -0.7728984, 0, 0.03529412, 1, 1,
0.4208539, 0.2671661, 1.444791, 0, 0.02745098, 1, 1,
0.4239583, 0.4639309, 1.433656, 0, 0.02352941, 1, 1,
0.4335317, 0.3338773, -0.5779817, 0, 0.01568628, 1, 1,
0.4426177, 1.410263, -0.7417646, 0, 0.01176471, 1, 1,
0.4448163, -0.08598072, 1.731475, 0, 0.003921569, 1, 1,
0.4449299, 0.9753752, 2.351113, 0.003921569, 0, 1, 1,
0.4459474, -0.9496529, 1.957147, 0.007843138, 0, 1, 1,
0.4465222, -0.2369701, 1.353728, 0.01568628, 0, 1, 1,
0.4472815, -0.08007737, 1.495544, 0.01960784, 0, 1, 1,
0.4484026, -0.7314802, 2.022856, 0.02745098, 0, 1, 1,
0.4537063, -0.4442516, 1.393534, 0.03137255, 0, 1, 1,
0.4560838, -0.4847643, 2.680847, 0.03921569, 0, 1, 1,
0.4586627, -0.2457248, 3.606257, 0.04313726, 0, 1, 1,
0.4625584, -0.1174593, 2.105478, 0.05098039, 0, 1, 1,
0.4689248, 0.2691383, -0.06838195, 0.05490196, 0, 1, 1,
0.4754876, 0.5546879, 1.498739, 0.0627451, 0, 1, 1,
0.4778719, -0.2743534, 1.212112, 0.06666667, 0, 1, 1,
0.4792406, -0.1680301, 2.405027, 0.07450981, 0, 1, 1,
0.4803849, 0.6675255, 0.5195884, 0.07843138, 0, 1, 1,
0.4832704, 0.3662705, -0.1907548, 0.08627451, 0, 1, 1,
0.48537, 0.3694517, 0.4172725, 0.09019608, 0, 1, 1,
0.48546, -0.3848704, 2.549021, 0.09803922, 0, 1, 1,
0.4867183, 1.422831, 1.748322, 0.1058824, 0, 1, 1,
0.4870195, -0.3877718, 3.019851, 0.1098039, 0, 1, 1,
0.4883852, -0.8811904, 2.629989, 0.1176471, 0, 1, 1,
0.4960119, 0.9888554, 0.04148925, 0.1215686, 0, 1, 1,
0.4974194, 0.4245643, 1.378873, 0.1294118, 0, 1, 1,
0.4974414, 1.639414, 1.635301, 0.1333333, 0, 1, 1,
0.4979514, 1.63293, -0.4726253, 0.1411765, 0, 1, 1,
0.5015787, 0.3689226, 2.233768, 0.145098, 0, 1, 1,
0.5028101, -0.500858, 3.09841, 0.1529412, 0, 1, 1,
0.5091541, 2.214586, -1.011538, 0.1568628, 0, 1, 1,
0.5108014, -0.9461163, -0.1439664, 0.1647059, 0, 1, 1,
0.5117356, 1.224141, 1.107911, 0.1686275, 0, 1, 1,
0.5124797, -1.271586, 1.927011, 0.1764706, 0, 1, 1,
0.5196035, -0.6984628, 3.682918, 0.1803922, 0, 1, 1,
0.5240234, -0.2528149, 1.734719, 0.1882353, 0, 1, 1,
0.526287, 0.3723264, 1.187057, 0.1921569, 0, 1, 1,
0.5284264, -2.560513, 1.706266, 0.2, 0, 1, 1,
0.5292915, -2.133012, 1.697485, 0.2078431, 0, 1, 1,
0.5313098, 1.055216, 2.186919, 0.2117647, 0, 1, 1,
0.5353016, 0.4662478, 0.6183273, 0.2196078, 0, 1, 1,
0.5377451, 0.3560844, -0.6684741, 0.2235294, 0, 1, 1,
0.5419962, -1.041563, 2.561322, 0.2313726, 0, 1, 1,
0.5424858, 1.845611, -0.4238079, 0.2352941, 0, 1, 1,
0.5443655, 0.02095444, 1.520117, 0.2431373, 0, 1, 1,
0.5506323, -1.463381, 2.309337, 0.2470588, 0, 1, 1,
0.5634758, -0.230768, 3.078712, 0.254902, 0, 1, 1,
0.5636769, -1.301708, 1.233446, 0.2588235, 0, 1, 1,
0.5705339, -0.6074452, 4.352481, 0.2666667, 0, 1, 1,
0.5722957, -0.9452871, 2.047198, 0.2705882, 0, 1, 1,
0.5745476, 1.696362, -0.977052, 0.2784314, 0, 1, 1,
0.5755059, -0.7678677, 3.287939, 0.282353, 0, 1, 1,
0.5759709, -0.1991339, 3.252851, 0.2901961, 0, 1, 1,
0.5763897, -0.1776287, 1.495714, 0.2941177, 0, 1, 1,
0.5764509, -0.07809643, 3.107371, 0.3019608, 0, 1, 1,
0.5799893, 1.510735, -0.4592522, 0.3098039, 0, 1, 1,
0.5803481, 1.756247, -0.1610032, 0.3137255, 0, 1, 1,
0.58232, 0.3842531, 0.6362418, 0.3215686, 0, 1, 1,
0.5830831, 1.223382, 0.167469, 0.3254902, 0, 1, 1,
0.5857825, 0.4034826, 1.807324, 0.3333333, 0, 1, 1,
0.5926741, -0.2775212, 2.330681, 0.3372549, 0, 1, 1,
0.5965847, 0.09216956, 2.193478, 0.345098, 0, 1, 1,
0.5975202, -2.368556, 2.983126, 0.3490196, 0, 1, 1,
0.6036078, 0.6813599, 0.6753442, 0.3568628, 0, 1, 1,
0.6072707, -0.593468, 2.313761, 0.3607843, 0, 1, 1,
0.6076677, 0.4183631, 1.230295, 0.3686275, 0, 1, 1,
0.6094289, -0.4193897, 2.76048, 0.372549, 0, 1, 1,
0.6122475, -0.3902146, 2.077104, 0.3803922, 0, 1, 1,
0.6156971, -0.1738327, 1.753319, 0.3843137, 0, 1, 1,
0.617486, -1.372603, 4.106095, 0.3921569, 0, 1, 1,
0.627429, -0.945165, 3.001687, 0.3960784, 0, 1, 1,
0.6275424, -0.4872608, 2.172328, 0.4039216, 0, 1, 1,
0.6294968, 0.314873, -0.00345712, 0.4117647, 0, 1, 1,
0.6344956, -1.401934, 2.856081, 0.4156863, 0, 1, 1,
0.6383025, -0.3877704, 1.395171, 0.4235294, 0, 1, 1,
0.6401495, 1.581275, -0.3257161, 0.427451, 0, 1, 1,
0.6403477, 0.2528408, 1.910446, 0.4352941, 0, 1, 1,
0.6413339, -0.1583185, 1.221166, 0.4392157, 0, 1, 1,
0.6432658, -1.448866, 2.683227, 0.4470588, 0, 1, 1,
0.646601, 0.6133536, 0.7010206, 0.4509804, 0, 1, 1,
0.6467237, 0.1004245, 1.008475, 0.4588235, 0, 1, 1,
0.6491453, 0.9914041, 0.2224264, 0.4627451, 0, 1, 1,
0.6506861, 0.4848252, 0.8357654, 0.4705882, 0, 1, 1,
0.6514854, -1.290697, 3.395292, 0.4745098, 0, 1, 1,
0.6518079, 0.3095871, 1.350902, 0.4823529, 0, 1, 1,
0.6527985, -0.2257773, 2.082933, 0.4862745, 0, 1, 1,
0.6620541, 0.4799516, 0.3912252, 0.4941176, 0, 1, 1,
0.6663789, 0.4414091, 2.013422, 0.5019608, 0, 1, 1,
0.6664907, -0.2007072, 1.901419, 0.5058824, 0, 1, 1,
0.6696227, -0.2993006, 1.737696, 0.5137255, 0, 1, 1,
0.670818, -0.3398841, 3.000252, 0.5176471, 0, 1, 1,
0.6767567, 0.9727995, 0.4611692, 0.5254902, 0, 1, 1,
0.6784037, 0.3064961, 1.130709, 0.5294118, 0, 1, 1,
0.6790777, 0.05668757, 0.9898138, 0.5372549, 0, 1, 1,
0.6808951, 0.923725, -0.03671244, 0.5411765, 0, 1, 1,
0.686003, -1.139942, 3.352395, 0.5490196, 0, 1, 1,
0.688347, 0.2216693, -0.7401085, 0.5529412, 0, 1, 1,
0.6921025, -0.2597374, 1.372336, 0.5607843, 0, 1, 1,
0.6933384, 0.4984163, 0.06589922, 0.5647059, 0, 1, 1,
0.6953044, 0.1226367, -0.7382655, 0.572549, 0, 1, 1,
0.701774, -0.857456, -1.528691, 0.5764706, 0, 1, 1,
0.702715, -0.5528405, 2.601728, 0.5843138, 0, 1, 1,
0.7048696, -1.728967, 2.503748, 0.5882353, 0, 1, 1,
0.7107252, 0.7807764, 1.217448, 0.5960785, 0, 1, 1,
0.7111686, -0.1338912, 0.6967209, 0.6039216, 0, 1, 1,
0.7136409, 0.7009487, -0.2792307, 0.6078432, 0, 1, 1,
0.7174531, 1.091305, 1.378011, 0.6156863, 0, 1, 1,
0.7187266, -0.4712116, 2.288752, 0.6196079, 0, 1, 1,
0.734446, -0.03314945, 0.3817689, 0.627451, 0, 1, 1,
0.7345403, 0.01186758, 1.05952, 0.6313726, 0, 1, 1,
0.7385549, -0.2821666, 2.685444, 0.6392157, 0, 1, 1,
0.7388526, -0.1129204, 2.669909, 0.6431373, 0, 1, 1,
0.741222, 0.07284672, 2.10114, 0.6509804, 0, 1, 1,
0.7423404, 0.8649932, 0.5212409, 0.654902, 0, 1, 1,
0.7482423, 1.415539, 1.59826, 0.6627451, 0, 1, 1,
0.7531807, 0.448222, 1.78443, 0.6666667, 0, 1, 1,
0.7545579, -1.460958, 2.749117, 0.6745098, 0, 1, 1,
0.7564517, -1.393671, 3.837146, 0.6784314, 0, 1, 1,
0.7570786, 0.723605, 1.626663, 0.6862745, 0, 1, 1,
0.7608157, -0.7139888, 0.8416253, 0.6901961, 0, 1, 1,
0.7613102, 0.5771714, 0.8806427, 0.6980392, 0, 1, 1,
0.7626973, -1.087304, 3.605266, 0.7058824, 0, 1, 1,
0.7627161, 1.77044, 1.381061, 0.7098039, 0, 1, 1,
0.7669439, 2.195354, 0.7483515, 0.7176471, 0, 1, 1,
0.771317, 0.976363, 2.019781, 0.7215686, 0, 1, 1,
0.7740461, 0.9037157, 1.45894, 0.7294118, 0, 1, 1,
0.7749525, -0.5812143, 1.951944, 0.7333333, 0, 1, 1,
0.779942, -0.9819062, 3.862913, 0.7411765, 0, 1, 1,
0.7836986, 0.6353768, 1.649044, 0.7450981, 0, 1, 1,
0.7857106, 0.04686573, 2.389351, 0.7529412, 0, 1, 1,
0.7862999, -1.320225, 2.229759, 0.7568628, 0, 1, 1,
0.7866054, -0.1366636, 2.298151, 0.7647059, 0, 1, 1,
0.8000611, 1.797841, 0.9079958, 0.7686275, 0, 1, 1,
0.8007888, -0.3889951, 2.079875, 0.7764706, 0, 1, 1,
0.8021912, -0.9589319, 2.188151, 0.7803922, 0, 1, 1,
0.8096919, -1.182103, 0.2026181, 0.7882353, 0, 1, 1,
0.8124821, 1.348206, -0.6776229, 0.7921569, 0, 1, 1,
0.8166784, 0.03001519, 1.260561, 0.8, 0, 1, 1,
0.8203954, -0.3907292, 2.095329, 0.8078431, 0, 1, 1,
0.8234752, -0.6663654, 3.646407, 0.8117647, 0, 1, 1,
0.8312975, 0.624097, 1.938851, 0.8196079, 0, 1, 1,
0.8327593, -2.183278, 3.178349, 0.8235294, 0, 1, 1,
0.837521, 3.238951, -2.080005, 0.8313726, 0, 1, 1,
0.8420742, 0.222641, 0.4649627, 0.8352941, 0, 1, 1,
0.852266, -0.4045199, 0.7048625, 0.8431373, 0, 1, 1,
0.8530237, -0.3338272, 2.036318, 0.8470588, 0, 1, 1,
0.8542111, 1.153892, -0.7435331, 0.854902, 0, 1, 1,
0.8563784, -0.05015402, 1.953355, 0.8588235, 0, 1, 1,
0.8650196, 0.9443796, -0.7842245, 0.8666667, 0, 1, 1,
0.8670939, -0.1005729, 2.28661, 0.8705882, 0, 1, 1,
0.8705381, 0.7289154, 0.8725536, 0.8784314, 0, 1, 1,
0.8725477, 0.4357597, 3.890131, 0.8823529, 0, 1, 1,
0.8740208, 0.3420781, 1.058409, 0.8901961, 0, 1, 1,
0.8755639, 2.035484, 2.283256, 0.8941177, 0, 1, 1,
0.8772195, 0.5720059, 2.039419, 0.9019608, 0, 1, 1,
0.8856138, 1.011027, 1.536588, 0.9098039, 0, 1, 1,
0.886559, -0.5487126, 1.498309, 0.9137255, 0, 1, 1,
0.8875852, 0.6315234, 1.214243, 0.9215686, 0, 1, 1,
0.9019463, -0.439752, 3.811663, 0.9254902, 0, 1, 1,
0.9070574, -0.5524504, 3.158944, 0.9333333, 0, 1, 1,
0.9071609, 0.3684637, 2.401537, 0.9372549, 0, 1, 1,
0.9075154, -1.985467, 3.338551, 0.945098, 0, 1, 1,
0.9080536, -0.6282247, 2.579901, 0.9490196, 0, 1, 1,
0.9173166, -1.041437, 4.190634, 0.9568627, 0, 1, 1,
0.9212195, -1.041926, 3.150743, 0.9607843, 0, 1, 1,
0.9219534, 0.1953976, 1.628659, 0.9686275, 0, 1, 1,
0.925799, 1.073611, 0.9127925, 0.972549, 0, 1, 1,
0.9353818, 0.2166952, 1.399077, 0.9803922, 0, 1, 1,
0.9414881, -0.693408, 1.882026, 0.9843137, 0, 1, 1,
0.9423231, -1.507029, 2.869558, 0.9921569, 0, 1, 1,
0.942823, 1.324346, 0.3460783, 0.9960784, 0, 1, 1,
0.9717834, -0.2505756, 1.990621, 1, 0, 0.9960784, 1,
0.9744489, -1.304685, 3.023216, 1, 0, 0.9882353, 1,
0.9772362, -0.2261787, 2.066538, 1, 0, 0.9843137, 1,
0.9799752, -0.2687077, 0.957969, 1, 0, 0.9764706, 1,
0.9805608, 0.6376463, 0.3991201, 1, 0, 0.972549, 1,
0.981065, -0.3463374, 3.062236, 1, 0, 0.9647059, 1,
0.9872358, -1.266361, 4.161351, 1, 0, 0.9607843, 1,
0.992265, 2.298412, 0.5490987, 1, 0, 0.9529412, 1,
1.000685, -1.161432, 2.089444, 1, 0, 0.9490196, 1,
1.014201, -0.2260596, 4.279624, 1, 0, 0.9411765, 1,
1.018923, -1.78729, 2.598446, 1, 0, 0.9372549, 1,
1.024115, 1.977913, 3.100346, 1, 0, 0.9294118, 1,
1.030844, 1.983665, 0.7863902, 1, 0, 0.9254902, 1,
1.038269, -0.4182855, 3.374835, 1, 0, 0.9176471, 1,
1.041835, -1.213959, 2.760821, 1, 0, 0.9137255, 1,
1.047256, -0.261729, 1.750604, 1, 0, 0.9058824, 1,
1.049736, 0.7105429, -1.305313, 1, 0, 0.9019608, 1,
1.049858, 1.568128, 1.190022, 1, 0, 0.8941177, 1,
1.053263, 0.2117127, 0.8609158, 1, 0, 0.8862745, 1,
1.056081, -0.4529476, 1.902216, 1, 0, 0.8823529, 1,
1.075943, -0.03538573, 0.3135943, 1, 0, 0.8745098, 1,
1.080404, -0.2651627, 1.319971, 1, 0, 0.8705882, 1,
1.080572, 1.744339, 2.098776, 1, 0, 0.8627451, 1,
1.082398, 0.1129145, 2.231581, 1, 0, 0.8588235, 1,
1.090764, -1.021908, 2.685455, 1, 0, 0.8509804, 1,
1.094723, 0.1540007, 0.7982939, 1, 0, 0.8470588, 1,
1.095581, 0.7420549, 1.057961, 1, 0, 0.8392157, 1,
1.109563, 0.1492982, 1.4151, 1, 0, 0.8352941, 1,
1.111673, -0.7158554, 2.628093, 1, 0, 0.827451, 1,
1.12057, -1.467012, 1.197872, 1, 0, 0.8235294, 1,
1.125794, -1.281287, 1.543425, 1, 0, 0.8156863, 1,
1.13194, -0.5878478, 3.72539, 1, 0, 0.8117647, 1,
1.132317, -0.9162039, 3.105308, 1, 0, 0.8039216, 1,
1.135051, -0.3198543, 2.877154, 1, 0, 0.7960784, 1,
1.139327, 0.1365675, 1.803868, 1, 0, 0.7921569, 1,
1.143985, 0.7732702, 0.5406286, 1, 0, 0.7843137, 1,
1.147883, 1.795718, 0.8130495, 1, 0, 0.7803922, 1,
1.148847, -0.6874404, 2.309008, 1, 0, 0.772549, 1,
1.151612, 0.2391711, 1.335283, 1, 0, 0.7686275, 1,
1.153611, -0.100569, 1.779351, 1, 0, 0.7607843, 1,
1.163817, -0.5317384, 0.6555288, 1, 0, 0.7568628, 1,
1.172862, -0.8632178, 2.391676, 1, 0, 0.7490196, 1,
1.182044, -0.9334255, 1.432354, 1, 0, 0.7450981, 1,
1.188786, 0.975512, -0.7122521, 1, 0, 0.7372549, 1,
1.197825, -1.373623, 2.806487, 1, 0, 0.7333333, 1,
1.198825, -1.460496, 2.082486, 1, 0, 0.7254902, 1,
1.205261, 0.5099459, 0.3758492, 1, 0, 0.7215686, 1,
1.206861, 0.1444449, 2.250075, 1, 0, 0.7137255, 1,
1.227608, 1.064355, 0.4705725, 1, 0, 0.7098039, 1,
1.230108, -0.1720953, 1.792212, 1, 0, 0.7019608, 1,
1.232928, -1.351685, 3.88731, 1, 0, 0.6941177, 1,
1.253818, -0.7906111, 3.098196, 1, 0, 0.6901961, 1,
1.257942, -0.958971, 2.625779, 1, 0, 0.682353, 1,
1.262115, 0.7700286, 2.603185, 1, 0, 0.6784314, 1,
1.264494, -0.6701638, 3.296731, 1, 0, 0.6705883, 1,
1.268323, -1.532454, 3.461848, 1, 0, 0.6666667, 1,
1.279982, 0.8868822, 1.468948, 1, 0, 0.6588235, 1,
1.284902, -0.6517145, 2.725297, 1, 0, 0.654902, 1,
1.28963, -0.004252453, 1.734156, 1, 0, 0.6470588, 1,
1.29543, -1.329425, 2.57407, 1, 0, 0.6431373, 1,
1.296002, -0.5651006, 3.782853, 1, 0, 0.6352941, 1,
1.297586, 1.041009, 1.250013, 1, 0, 0.6313726, 1,
1.311822, -1.11959, 1.474377, 1, 0, 0.6235294, 1,
1.312354, 0.9847992, 0.8414686, 1, 0, 0.6196079, 1,
1.313492, -0.7562461, 2.437888, 1, 0, 0.6117647, 1,
1.319771, -0.2898925, 1.232918, 1, 0, 0.6078432, 1,
1.321301, 0.3639125, 2.062274, 1, 0, 0.6, 1,
1.323832, -1.332305, 5.103686, 1, 0, 0.5921569, 1,
1.339608, 1.615623, 0.3432605, 1, 0, 0.5882353, 1,
1.346035, 0.2164703, 1.055373, 1, 0, 0.5803922, 1,
1.353893, -0.6070641, 3.447223, 1, 0, 0.5764706, 1,
1.354974, 0.002588343, 1.032796, 1, 0, 0.5686275, 1,
1.362478, 1.620253, 0.454033, 1, 0, 0.5647059, 1,
1.381653, -1.067351, 2.687727, 1, 0, 0.5568628, 1,
1.391911, 0.7624186, 1.41506, 1, 0, 0.5529412, 1,
1.410927, -2.016098, 2.44506, 1, 0, 0.5450981, 1,
1.413437, -1.159666, 2.344764, 1, 0, 0.5411765, 1,
1.419189, 0.4125427, 1.728118, 1, 0, 0.5333334, 1,
1.421076, -0.3850268, 1.016282, 1, 0, 0.5294118, 1,
1.422759, 1.015241, 2.194933, 1, 0, 0.5215687, 1,
1.424791, 0.02043333, 2.109929, 1, 0, 0.5176471, 1,
1.427996, -0.1166604, 0.8538027, 1, 0, 0.509804, 1,
1.431731, 0.4920643, 2.072232, 1, 0, 0.5058824, 1,
1.435508, 0.06929417, -0.2340311, 1, 0, 0.4980392, 1,
1.440665, 1.200062, 1.143093, 1, 0, 0.4901961, 1,
1.441976, -0.1354651, 0.5621861, 1, 0, 0.4862745, 1,
1.442234, 0.06756314, 2.350598, 1, 0, 0.4784314, 1,
1.445006, 0.9466434, 1.287053, 1, 0, 0.4745098, 1,
1.448873, -1.564916, 5.072268, 1, 0, 0.4666667, 1,
1.451643, -0.3939677, 3.354178, 1, 0, 0.4627451, 1,
1.453276, 0.5680817, 0.08069618, 1, 0, 0.454902, 1,
1.462342, -1.187407, 0.8347123, 1, 0, 0.4509804, 1,
1.46376, 0.06589828, 0.07136531, 1, 0, 0.4431373, 1,
1.467569, -0.4198875, 1.713593, 1, 0, 0.4392157, 1,
1.481658, -0.1790699, 0.5945641, 1, 0, 0.4313726, 1,
1.48595, -0.6406998, 3.322469, 1, 0, 0.427451, 1,
1.498419, -0.2434087, 1.444081, 1, 0, 0.4196078, 1,
1.502209, 0.008687429, 2.253949, 1, 0, 0.4156863, 1,
1.520633, 1.805965, 1.954378, 1, 0, 0.4078431, 1,
1.530414, -0.9416248, 3.891581, 1, 0, 0.4039216, 1,
1.545409, -1.315757, 1.420281, 1, 0, 0.3960784, 1,
1.547783, -0.4301718, 2.728776, 1, 0, 0.3882353, 1,
1.555527, 0.4175189, 0.3529272, 1, 0, 0.3843137, 1,
1.557315, 0.4106784, 0.5146782, 1, 0, 0.3764706, 1,
1.557453, -0.4606537, 1.263504, 1, 0, 0.372549, 1,
1.560761, 0.4172143, 3.044819, 1, 0, 0.3647059, 1,
1.574914, 0.8784607, 2.565231, 1, 0, 0.3607843, 1,
1.585876, 0.7517485, 0.3522019, 1, 0, 0.3529412, 1,
1.587075, 0.1718972, -0.2218631, 1, 0, 0.3490196, 1,
1.592468, 1.773687, 0.4244104, 1, 0, 0.3411765, 1,
1.596505, -1.737503, 1.951934, 1, 0, 0.3372549, 1,
1.599957, -1.048316, 3.04598, 1, 0, 0.3294118, 1,
1.600798, -0.5225003, 1.155168, 1, 0, 0.3254902, 1,
1.61228, -1.847461, 3.18621, 1, 0, 0.3176471, 1,
1.613534, 0.4005401, 3.25309, 1, 0, 0.3137255, 1,
1.615173, -0.2383154, 2.661005, 1, 0, 0.3058824, 1,
1.621212, 2.684379, 0.8395306, 1, 0, 0.2980392, 1,
1.624583, 0.7038428, 1.57522, 1, 0, 0.2941177, 1,
1.629818, 0.3820963, 1.014914, 1, 0, 0.2862745, 1,
1.630743, -0.753792, 4.13929, 1, 0, 0.282353, 1,
1.642419, -2.192597, 0.6150882, 1, 0, 0.2745098, 1,
1.651267, -0.9786596, 2.253193, 1, 0, 0.2705882, 1,
1.65223, 0.6326085, -0.05041803, 1, 0, 0.2627451, 1,
1.672994, -0.2892085, 2.666516, 1, 0, 0.2588235, 1,
1.695229, 0.479975, 0.5327802, 1, 0, 0.2509804, 1,
1.6975, 0.06909168, 0.7856767, 1, 0, 0.2470588, 1,
1.727117, -0.9463887, 0.3275686, 1, 0, 0.2392157, 1,
1.738377, -0.5607374, 4.458365, 1, 0, 0.2352941, 1,
1.741768, 0.0208556, 3.133825, 1, 0, 0.227451, 1,
1.751145, -0.06029244, 3.362061, 1, 0, 0.2235294, 1,
1.756425, 1.652416, 0.2791207, 1, 0, 0.2156863, 1,
1.768274, 1.062983, 2.097685, 1, 0, 0.2117647, 1,
1.769536, -0.4087033, 3.004364, 1, 0, 0.2039216, 1,
1.776795, 0.155729, 1.159036, 1, 0, 0.1960784, 1,
1.781326, 1.086673, 0.8977013, 1, 0, 0.1921569, 1,
1.840919, -0.2859718, 2.348178, 1, 0, 0.1843137, 1,
1.848144, 0.500851, 1.644056, 1, 0, 0.1803922, 1,
1.853272, -0.972606, 0.6089306, 1, 0, 0.172549, 1,
1.872935, 0.5027866, 1.275932, 1, 0, 0.1686275, 1,
1.873009, 0.6625149, 0.4601825, 1, 0, 0.1607843, 1,
1.874683, -0.7090402, 2.033395, 1, 0, 0.1568628, 1,
1.897804, 0.3369901, 2.254197, 1, 0, 0.1490196, 1,
1.91464, -0.9774065, 2.112629, 1, 0, 0.145098, 1,
1.917594, 0.9230642, 0.5615497, 1, 0, 0.1372549, 1,
1.928354, 2.61336, -0.7145554, 1, 0, 0.1333333, 1,
1.94294, -0.2367269, 1.293996, 1, 0, 0.1254902, 1,
1.943736, 1.913686, 0.2289308, 1, 0, 0.1215686, 1,
1.983724, -1.201164, 1.091146, 1, 0, 0.1137255, 1,
2.026573, -1.484665, 2.791925, 1, 0, 0.1098039, 1,
2.039838, -0.5552024, 3.070046, 1, 0, 0.1019608, 1,
2.041822, -0.7480448, 3.836087, 1, 0, 0.09411765, 1,
2.043846, 0.8968383, -0.5100287, 1, 0, 0.09019608, 1,
2.076327, 0.4801871, 1.394079, 1, 0, 0.08235294, 1,
2.092148, 0.5242337, 1.475147, 1, 0, 0.07843138, 1,
2.09254, -1.526295, 1.728686, 1, 0, 0.07058824, 1,
2.207147, 1.746029, 0.04890316, 1, 0, 0.06666667, 1,
2.30286, 1.404579, 0.556007, 1, 0, 0.05882353, 1,
2.359373, -0.8860282, 1.322512, 1, 0, 0.05490196, 1,
2.365417, -0.06829035, -0.3534255, 1, 0, 0.04705882, 1,
2.405629, 1.196737, 0.1956622, 1, 0, 0.04313726, 1,
2.433931, 0.8506261, -0.5689308, 1, 0, 0.03529412, 1,
2.466382, 0.3545925, 3.788194, 1, 0, 0.03137255, 1,
2.769816, -0.0123568, 0.5417118, 1, 0, 0.02352941, 1,
2.793149, -1.050636, 2.286895, 1, 0, 0.01960784, 1,
3.067666, 0.8652347, 1.686591, 1, 0, 0.01176471, 1,
3.100268, -1.213528, 2.173445, 1, 0, 0.007843138, 1
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
0.01952517, -3.879911, -6.914878, 0, -0.5, 0.5, 0.5,
0.01952517, -3.879911, -6.914878, 1, -0.5, 0.5, 0.5,
0.01952517, -3.879911, -6.914878, 1, 1.5, 0.5, 0.5,
0.01952517, -3.879911, -6.914878, 0, 1.5, 0.5, 0.5
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
-4.10559, 0.1954014, -6.914878, 0, -0.5, 0.5, 0.5,
-4.10559, 0.1954014, -6.914878, 1, -0.5, 0.5, 0.5,
-4.10559, 0.1954014, -6.914878, 1, 1.5, 0.5, 0.5,
-4.10559, 0.1954014, -6.914878, 0, 1.5, 0.5, 0.5
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
-4.10559, -3.879911, 0.1105993, 0, -0.5, 0.5, 0.5,
-4.10559, -3.879911, 0.1105993, 1, -0.5, 0.5, 0.5,
-4.10559, -3.879911, 0.1105993, 1, 1.5, 0.5, 0.5,
-4.10559, -3.879911, 0.1105993, 0, 1.5, 0.5, 0.5
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
-3, -2.939455, -5.293614,
3, -2.939455, -5.293614,
-3, -2.939455, -5.293614,
-3, -3.096197, -5.563825,
-2, -2.939455, -5.293614,
-2, -3.096197, -5.563825,
-1, -2.939455, -5.293614,
-1, -3.096197, -5.563825,
0, -2.939455, -5.293614,
0, -3.096197, -5.563825,
1, -2.939455, -5.293614,
1, -3.096197, -5.563825,
2, -2.939455, -5.293614,
2, -3.096197, -5.563825,
3, -2.939455, -5.293614,
3, -3.096197, -5.563825
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
-3, -3.409683, -6.104246, 0, -0.5, 0.5, 0.5,
-3, -3.409683, -6.104246, 1, -0.5, 0.5, 0.5,
-3, -3.409683, -6.104246, 1, 1.5, 0.5, 0.5,
-3, -3.409683, -6.104246, 0, 1.5, 0.5, 0.5,
-2, -3.409683, -6.104246, 0, -0.5, 0.5, 0.5,
-2, -3.409683, -6.104246, 1, -0.5, 0.5, 0.5,
-2, -3.409683, -6.104246, 1, 1.5, 0.5, 0.5,
-2, -3.409683, -6.104246, 0, 1.5, 0.5, 0.5,
-1, -3.409683, -6.104246, 0, -0.5, 0.5, 0.5,
-1, -3.409683, -6.104246, 1, -0.5, 0.5, 0.5,
-1, -3.409683, -6.104246, 1, 1.5, 0.5, 0.5,
-1, -3.409683, -6.104246, 0, 1.5, 0.5, 0.5,
0, -3.409683, -6.104246, 0, -0.5, 0.5, 0.5,
0, -3.409683, -6.104246, 1, -0.5, 0.5, 0.5,
0, -3.409683, -6.104246, 1, 1.5, 0.5, 0.5,
0, -3.409683, -6.104246, 0, 1.5, 0.5, 0.5,
1, -3.409683, -6.104246, 0, -0.5, 0.5, 0.5,
1, -3.409683, -6.104246, 1, -0.5, 0.5, 0.5,
1, -3.409683, -6.104246, 1, 1.5, 0.5, 0.5,
1, -3.409683, -6.104246, 0, 1.5, 0.5, 0.5,
2, -3.409683, -6.104246, 0, -0.5, 0.5, 0.5,
2, -3.409683, -6.104246, 1, -0.5, 0.5, 0.5,
2, -3.409683, -6.104246, 1, 1.5, 0.5, 0.5,
2, -3.409683, -6.104246, 0, 1.5, 0.5, 0.5,
3, -3.409683, -6.104246, 0, -0.5, 0.5, 0.5,
3, -3.409683, -6.104246, 1, -0.5, 0.5, 0.5,
3, -3.409683, -6.104246, 1, 1.5, 0.5, 0.5,
3, -3.409683, -6.104246, 0, 1.5, 0.5, 0.5
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
-3.15364, -2, -5.293614,
-3.15364, 3, -5.293614,
-3.15364, -2, -5.293614,
-3.312299, -2, -5.563825,
-3.15364, -1, -5.293614,
-3.312299, -1, -5.563825,
-3.15364, 0, -5.293614,
-3.312299, 0, -5.563825,
-3.15364, 1, -5.293614,
-3.312299, 1, -5.563825,
-3.15364, 2, -5.293614,
-3.312299, 2, -5.563825,
-3.15364, 3, -5.293614,
-3.312299, 3, -5.563825
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
-3.629615, -2, -6.104246, 0, -0.5, 0.5, 0.5,
-3.629615, -2, -6.104246, 1, -0.5, 0.5, 0.5,
-3.629615, -2, -6.104246, 1, 1.5, 0.5, 0.5,
-3.629615, -2, -6.104246, 0, 1.5, 0.5, 0.5,
-3.629615, -1, -6.104246, 0, -0.5, 0.5, 0.5,
-3.629615, -1, -6.104246, 1, -0.5, 0.5, 0.5,
-3.629615, -1, -6.104246, 1, 1.5, 0.5, 0.5,
-3.629615, -1, -6.104246, 0, 1.5, 0.5, 0.5,
-3.629615, 0, -6.104246, 0, -0.5, 0.5, 0.5,
-3.629615, 0, -6.104246, 1, -0.5, 0.5, 0.5,
-3.629615, 0, -6.104246, 1, 1.5, 0.5, 0.5,
-3.629615, 0, -6.104246, 0, 1.5, 0.5, 0.5,
-3.629615, 1, -6.104246, 0, -0.5, 0.5, 0.5,
-3.629615, 1, -6.104246, 1, -0.5, 0.5, 0.5,
-3.629615, 1, -6.104246, 1, 1.5, 0.5, 0.5,
-3.629615, 1, -6.104246, 0, 1.5, 0.5, 0.5,
-3.629615, 2, -6.104246, 0, -0.5, 0.5, 0.5,
-3.629615, 2, -6.104246, 1, -0.5, 0.5, 0.5,
-3.629615, 2, -6.104246, 1, 1.5, 0.5, 0.5,
-3.629615, 2, -6.104246, 0, 1.5, 0.5, 0.5,
-3.629615, 3, -6.104246, 0, -0.5, 0.5, 0.5,
-3.629615, 3, -6.104246, 1, -0.5, 0.5, 0.5,
-3.629615, 3, -6.104246, 1, 1.5, 0.5, 0.5,
-3.629615, 3, -6.104246, 0, 1.5, 0.5, 0.5
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
-3.15364, -2.939455, -4,
-3.15364, -2.939455, 4,
-3.15364, -2.939455, -4,
-3.312299, -3.096197, -4,
-3.15364, -2.939455, -2,
-3.312299, -3.096197, -2,
-3.15364, -2.939455, 0,
-3.312299, -3.096197, 0,
-3.15364, -2.939455, 2,
-3.312299, -3.096197, 2,
-3.15364, -2.939455, 4,
-3.312299, -3.096197, 4
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
-3.629615, -3.409683, -4, 0, -0.5, 0.5, 0.5,
-3.629615, -3.409683, -4, 1, -0.5, 0.5, 0.5,
-3.629615, -3.409683, -4, 1, 1.5, 0.5, 0.5,
-3.629615, -3.409683, -4, 0, 1.5, 0.5, 0.5,
-3.629615, -3.409683, -2, 0, -0.5, 0.5, 0.5,
-3.629615, -3.409683, -2, 1, -0.5, 0.5, 0.5,
-3.629615, -3.409683, -2, 1, 1.5, 0.5, 0.5,
-3.629615, -3.409683, -2, 0, 1.5, 0.5, 0.5,
-3.629615, -3.409683, 0, 0, -0.5, 0.5, 0.5,
-3.629615, -3.409683, 0, 1, -0.5, 0.5, 0.5,
-3.629615, -3.409683, 0, 1, 1.5, 0.5, 0.5,
-3.629615, -3.409683, 0, 0, 1.5, 0.5, 0.5,
-3.629615, -3.409683, 2, 0, -0.5, 0.5, 0.5,
-3.629615, -3.409683, 2, 1, -0.5, 0.5, 0.5,
-3.629615, -3.409683, 2, 1, 1.5, 0.5, 0.5,
-3.629615, -3.409683, 2, 0, 1.5, 0.5, 0.5,
-3.629615, -3.409683, 4, 0, -0.5, 0.5, 0.5,
-3.629615, -3.409683, 4, 1, -0.5, 0.5, 0.5,
-3.629615, -3.409683, 4, 1, 1.5, 0.5, 0.5,
-3.629615, -3.409683, 4, 0, 1.5, 0.5, 0.5
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
-3.15364, -2.939455, -5.293614,
-3.15364, 3.330257, -5.293614,
-3.15364, -2.939455, 5.514813,
-3.15364, 3.330257, 5.514813,
-3.15364, -2.939455, -5.293614,
-3.15364, -2.939455, 5.514813,
-3.15364, 3.330257, -5.293614,
-3.15364, 3.330257, 5.514813,
-3.15364, -2.939455, -5.293614,
3.192691, -2.939455, -5.293614,
-3.15364, -2.939455, 5.514813,
3.192691, -2.939455, 5.514813,
-3.15364, 3.330257, -5.293614,
3.192691, 3.330257, -5.293614,
-3.15364, 3.330257, 5.514813,
3.192691, 3.330257, 5.514813,
3.192691, -2.939455, -5.293614,
3.192691, 3.330257, -5.293614,
3.192691, -2.939455, 5.514813,
3.192691, 3.330257, 5.514813,
3.192691, -2.939455, -5.293614,
3.192691, -2.939455, 5.514813,
3.192691, 3.330257, -5.293614,
3.192691, 3.330257, 5.514813
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
var radius = 7.483492;
var distance = 33.2949;
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
mvMatrix.translate( -0.01952517, -0.1954014, -0.1105993 );
mvMatrix.scale( 1.274957, 1.290537, 0.7486101 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.2949);
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
nitrofluorfen<-read.table("nitrofluorfen.xyz")
```

```
## Error in read.table("nitrofluorfen.xyz"): no lines available in input
```

```r
x<-nitrofluorfen$V2
```

```
## Error in eval(expr, envir, enclos): object 'nitrofluorfen' not found
```

```r
y<-nitrofluorfen$V3
```

```
## Error in eval(expr, envir, enclos): object 'nitrofluorfen' not found
```

```r
z<-nitrofluorfen$V4
```

```
## Error in eval(expr, envir, enclos): object 'nitrofluorfen' not found
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
-3.061218, 0.4429816, -0.4922504, 0, 0, 1, 1, 1,
-2.939598, -0.2801632, -1.452967, 1, 0, 0, 1, 1,
-2.668487, 1.442416, -0.2586219, 1, 0, 0, 1, 1,
-2.660797, 0.8059062, -1.827356, 1, 0, 0, 1, 1,
-2.574746, 0.8625517, -1.58893, 1, 0, 0, 1, 1,
-2.506751, 1.443657, -1.721628, 1, 0, 0, 1, 1,
-2.478743, -1.86031, -3.130177, 0, 0, 0, 1, 1,
-2.477364, 0.2696375, -2.622653, 0, 0, 0, 1, 1,
-2.463543, -0.90926, -1.833161, 0, 0, 0, 1, 1,
-2.441229, -0.4721922, -1.493406, 0, 0, 0, 1, 1,
-2.389135, 0.1664149, -2.735002, 0, 0, 0, 1, 1,
-2.36526, -0.1335298, -3.12302, 0, 0, 0, 1, 1,
-2.311924, -1.794564, -3.833332, 0, 0, 0, 1, 1,
-2.294686, -0.477316, -3.390529, 1, 1, 1, 1, 1,
-2.179199, -2.237761, -1.659998, 1, 1, 1, 1, 1,
-2.165372, -1.309275, -1.877117, 1, 1, 1, 1, 1,
-2.160899, -0.04685498, -2.592193, 1, 1, 1, 1, 1,
-2.154583, -0.7939756, -2.492799, 1, 1, 1, 1, 1,
-2.127519, 0.4454122, -0.8817855, 1, 1, 1, 1, 1,
-2.123603, 0.8094792, -0.8023173, 1, 1, 1, 1, 1,
-2.113413, 0.6548003, -2.718041, 1, 1, 1, 1, 1,
-2.04042, -1.135954, -3.014174, 1, 1, 1, 1, 1,
-2.030464, 0.04154142, -1.104684, 1, 1, 1, 1, 1,
-2.005818, -1.51326, -0.683494, 1, 1, 1, 1, 1,
-1.995997, -0.5291696, -1.88187, 1, 1, 1, 1, 1,
-1.987954, 0.6879401, -0.6106284, 1, 1, 1, 1, 1,
-1.981168, -0.1468654, -1.575294, 1, 1, 1, 1, 1,
-1.963475, 1.427166, -2.35256, 1, 1, 1, 1, 1,
-1.960279, 0.5725796, -2.376681, 0, 0, 1, 1, 1,
-1.914791, 0.3062876, -1.456236, 1, 0, 0, 1, 1,
-1.884839, 1.07269, -1.893476, 1, 0, 0, 1, 1,
-1.880381, -0.532047, -4.082236, 1, 0, 0, 1, 1,
-1.86148, -0.2297516, -2.531324, 1, 0, 0, 1, 1,
-1.859272, -0.8570712, -3.014385, 1, 0, 0, 1, 1,
-1.85559, 0.7010752, -1.216133, 0, 0, 0, 1, 1,
-1.849397, 0.3358833, -1.304471, 0, 0, 0, 1, 1,
-1.847872, 0.4135819, -2.786602, 0, 0, 0, 1, 1,
-1.840254, -0.2065372, -1.478815, 0, 0, 0, 1, 1,
-1.839467, 0.7258105, -0.8333729, 0, 0, 0, 1, 1,
-1.822809, -0.05034584, -0.8534539, 0, 0, 0, 1, 1,
-1.822529, 0.8207076, -1.227388, 0, 0, 0, 1, 1,
-1.801345, -1.895631, -4.556678, 1, 1, 1, 1, 1,
-1.787303, 0.2834676, -1.667518, 1, 1, 1, 1, 1,
-1.78709, -0.677352, -0.7370716, 1, 1, 1, 1, 1,
-1.777753, -0.6681851, -0.9692858, 1, 1, 1, 1, 1,
-1.773374, -0.1263923, -1.097089, 1, 1, 1, 1, 1,
-1.749351, -0.2898162, -2.511784, 1, 1, 1, 1, 1,
-1.745418, -1.679643, -2.122315, 1, 1, 1, 1, 1,
-1.743276, -0.4541389, -0.8301116, 1, 1, 1, 1, 1,
-1.728271, 0.150675, -2.114491, 1, 1, 1, 1, 1,
-1.709875, 2.011812, -0.8408909, 1, 1, 1, 1, 1,
-1.694673, 0.6340002, -2.635724, 1, 1, 1, 1, 1,
-1.673473, -0.8110968, -1.612292, 1, 1, 1, 1, 1,
-1.616089, -0.6214856, -0.7529634, 1, 1, 1, 1, 1,
-1.60145, -0.373118, -1.367868, 1, 1, 1, 1, 1,
-1.571133, 0.5359561, -0.877821, 1, 1, 1, 1, 1,
-1.566866, -0.9636819, -2.673262, 0, 0, 1, 1, 1,
-1.560168, -1.584772, -3.383953, 1, 0, 0, 1, 1,
-1.546712, 0.5220359, -2.147433, 1, 0, 0, 1, 1,
-1.54021, -0.8698697, -0.9631305, 1, 0, 0, 1, 1,
-1.536293, 0.2086727, -0.2055566, 1, 0, 0, 1, 1,
-1.531948, -1.481013, -1.855894, 1, 0, 0, 1, 1,
-1.520672, -0.9016435, -1.610028, 0, 0, 0, 1, 1,
-1.513672, 0.3183459, -0.9895843, 0, 0, 0, 1, 1,
-1.512947, -0.583451, -2.030756, 0, 0, 0, 1, 1,
-1.507065, -0.07944258, -2.155401, 0, 0, 0, 1, 1,
-1.494846, 2.508326, -0.2873105, 0, 0, 0, 1, 1,
-1.484403, 0.2151195, -2.001793, 0, 0, 0, 1, 1,
-1.480025, -0.6938636, -2.371463, 0, 0, 0, 1, 1,
-1.47877, -0.5317926, -1.267517, 1, 1, 1, 1, 1,
-1.478737, -1.032143, -1.641411, 1, 1, 1, 1, 1,
-1.468779, 0.9369202, -0.2619313, 1, 1, 1, 1, 1,
-1.4666, -0.795124, -2.367979, 1, 1, 1, 1, 1,
-1.455129, -1.608092, -2.388234, 1, 1, 1, 1, 1,
-1.447539, 1.123238, -1.974563, 1, 1, 1, 1, 1,
-1.442944, 0.3273007, -3.916251, 1, 1, 1, 1, 1,
-1.442149, -0.2064811, -0.6769515, 1, 1, 1, 1, 1,
-1.439328, -2.061642, -4.560307, 1, 1, 1, 1, 1,
-1.429215, -0.2653619, -1.965619, 1, 1, 1, 1, 1,
-1.401449, -1.153597, -3.61156, 1, 1, 1, 1, 1,
-1.400358, 1.381062, -0.9636361, 1, 1, 1, 1, 1,
-1.398164, 0.983921, -0.2564559, 1, 1, 1, 1, 1,
-1.388582, 0.6884104, -1.093212, 1, 1, 1, 1, 1,
-1.384462, 1.027364, -0.1041844, 1, 1, 1, 1, 1,
-1.370172, -0.6653615, -0.2679194, 0, 0, 1, 1, 1,
-1.364201, 1.179772, -0.7692064, 1, 0, 0, 1, 1,
-1.358263, -2.579444, -3.682549, 1, 0, 0, 1, 1,
-1.35424, -1.774033, -1.071209, 1, 0, 0, 1, 1,
-1.349467, -0.2836735, -0.6225635, 1, 0, 0, 1, 1,
-1.348319, -0.4695802, -1.480362, 1, 0, 0, 1, 1,
-1.344185, 0.09443311, -1.460198, 0, 0, 0, 1, 1,
-1.331039, -0.777907, -2.757048, 0, 0, 0, 1, 1,
-1.3264, 0.4483783, -1.565758, 0, 0, 0, 1, 1,
-1.325546, 0.273993, -2.498619, 0, 0, 0, 1, 1,
-1.324332, -1.056171, -1.843383, 0, 0, 0, 1, 1,
-1.317532, 0.2998568, -2.475672, 0, 0, 0, 1, 1,
-1.305169, 0.02140881, -2.231841, 0, 0, 0, 1, 1,
-1.303361, -0.419807, -3.074552, 1, 1, 1, 1, 1,
-1.301615, 0.6493399, -1.342852, 1, 1, 1, 1, 1,
-1.299547, 1.943995, -0.9703221, 1, 1, 1, 1, 1,
-1.294804, 0.9136906, -1.006868, 1, 1, 1, 1, 1,
-1.287315, 0.4871449, 0.5482005, 1, 1, 1, 1, 1,
-1.280694, 0.3280464, -0.9855137, 1, 1, 1, 1, 1,
-1.277735, 0.7563908, 1.281977, 1, 1, 1, 1, 1,
-1.276878, -0.5435413, -2.256902, 1, 1, 1, 1, 1,
-1.267625, 1.676367, -0.5679483, 1, 1, 1, 1, 1,
-1.266372, 0.5622424, -0.3530968, 1, 1, 1, 1, 1,
-1.261698, -1.914335, -3.255221, 1, 1, 1, 1, 1,
-1.25627, 0.290107, -1.132974, 1, 1, 1, 1, 1,
-1.252676, 0.1641508, -1.907696, 1, 1, 1, 1, 1,
-1.236071, 0.2578681, -2.125728, 1, 1, 1, 1, 1,
-1.227666, -2.848148, -3.132602, 1, 1, 1, 1, 1,
-1.225668, -0.361486, -1.751552, 0, 0, 1, 1, 1,
-1.221811, -0.1511187, -0.8570954, 1, 0, 0, 1, 1,
-1.214465, 0.8299276, -2.554815, 1, 0, 0, 1, 1,
-1.208951, -0.8676043, -2.582095, 1, 0, 0, 1, 1,
-1.207106, -0.4943543, -2.50104, 1, 0, 0, 1, 1,
-1.202687, 1.007861, 0.4640393, 1, 0, 0, 1, 1,
-1.199018, 0.4390467, -2.240119, 0, 0, 0, 1, 1,
-1.196155, 0.9144133, -2.070911, 0, 0, 0, 1, 1,
-1.195623, 0.5553663, 0.05328989, 0, 0, 0, 1, 1,
-1.194341, -1.130954, -4.191379, 0, 0, 0, 1, 1,
-1.191276, -1.624249, -1.624537, 0, 0, 0, 1, 1,
-1.190435, 0.5146633, -0.3862798, 0, 0, 0, 1, 1,
-1.183951, -0.04299656, -2.793349, 0, 0, 0, 1, 1,
-1.176671, -0.01055256, -0.3760499, 1, 1, 1, 1, 1,
-1.175378, -0.9174116, -4.006885, 1, 1, 1, 1, 1,
-1.17442, 0.1554407, -0.9763008, 1, 1, 1, 1, 1,
-1.174085, -0.5869256, -3.389154, 1, 1, 1, 1, 1,
-1.17388, 1.19777, -2.319914, 1, 1, 1, 1, 1,
-1.17025, 0.8391015, -0.04606464, 1, 1, 1, 1, 1,
-1.140112, 0.8885813, 1.471703, 1, 1, 1, 1, 1,
-1.130943, -0.3206184, -3.227931, 1, 1, 1, 1, 1,
-1.128096, -0.5075078, -5.070206, 1, 1, 1, 1, 1,
-1.113914, -1.611249, -3.443544, 1, 1, 1, 1, 1,
-1.110038, 2.084123, -1.923862, 1, 1, 1, 1, 1,
-1.108131, -0.9353043, -2.7694, 1, 1, 1, 1, 1,
-1.106726, -1.024372, -1.493678, 1, 1, 1, 1, 1,
-1.1011, 2.222903, -0.2070127, 1, 1, 1, 1, 1,
-1.084396, -0.1942537, -1.161729, 1, 1, 1, 1, 1,
-1.081028, -0.1410702, -1.772372, 0, 0, 1, 1, 1,
-1.079083, -0.5275638, -0.8880662, 1, 0, 0, 1, 1,
-1.076384, -1.160144, -1.865289, 1, 0, 0, 1, 1,
-1.075552, -0.6357015, -1.490329, 1, 0, 0, 1, 1,
-1.063051, 1.120157, -0.3372464, 1, 0, 0, 1, 1,
-1.063024, -0.5190703, -1.951768, 1, 0, 0, 1, 1,
-1.054189, -0.1403241, -1.582857, 0, 0, 0, 1, 1,
-1.053565, -0.7765411, -0.7630334, 0, 0, 0, 1, 1,
-1.049855, -0.0001067283, -3.489905, 0, 0, 0, 1, 1,
-1.049312, 0.3274063, -1.828276, 0, 0, 0, 1, 1,
-1.048669, 1.132806, -2.083231, 0, 0, 0, 1, 1,
-1.042629, 0.4459442, 0.1950922, 0, 0, 0, 1, 1,
-1.038737, 1.101403, 1.16107, 0, 0, 0, 1, 1,
-1.0358, 1.198506, -1.219597, 1, 1, 1, 1, 1,
-1.02962, -0.1507805, -2.201715, 1, 1, 1, 1, 1,
-1.026793, -0.3511439, -2.050573, 1, 1, 1, 1, 1,
-1.025966, -1.011676, -1.434401, 1, 1, 1, 1, 1,
-1.016739, 1.363605, -0.8941848, 1, 1, 1, 1, 1,
-1.015612, 1.872398, -0.9770004, 1, 1, 1, 1, 1,
-1.015266, -0.178885, -1.678261, 1, 1, 1, 1, 1,
-1.002014, 1.994025, 1.000969, 1, 1, 1, 1, 1,
-0.9874586, -0.5034817, -2.391518, 1, 1, 1, 1, 1,
-0.9814633, 0.3342791, -0.5470374, 1, 1, 1, 1, 1,
-0.9781491, 1.255323, 0.2813944, 1, 1, 1, 1, 1,
-0.9762371, -1.109681, -2.686409, 1, 1, 1, 1, 1,
-0.974808, 0.6117115, -0.1119028, 1, 1, 1, 1, 1,
-0.9620058, 1.761062, -0.9283817, 1, 1, 1, 1, 1,
-0.961316, 0.6593976, -1.239219, 1, 1, 1, 1, 1,
-0.9589307, -0.4702407, -2.465386, 0, 0, 1, 1, 1,
-0.9554839, -2.142765, -3.510638, 1, 0, 0, 1, 1,
-0.95528, -0.1563994, -2.661169, 1, 0, 0, 1, 1,
-0.9546226, -0.5724267, -2.190667, 1, 0, 0, 1, 1,
-0.9516755, -0.1234401, 0.06163371, 1, 0, 0, 1, 1,
-0.9481257, 0.1863132, -1.902211, 1, 0, 0, 1, 1,
-0.9460586, -1.359734, -2.962956, 0, 0, 0, 1, 1,
-0.9410154, 0.9269367, -0.9800322, 0, 0, 0, 1, 1,
-0.931047, 0.2031722, -0.01509869, 0, 0, 0, 1, 1,
-0.9298551, -0.2903484, -1.591291, 0, 0, 0, 1, 1,
-0.9276769, 0.753735, -1.033986, 0, 0, 0, 1, 1,
-0.9271789, 0.5540432, -0.6722203, 0, 0, 0, 1, 1,
-0.9264961, 1.930382, 0.9482781, 0, 0, 0, 1, 1,
-0.9206776, 1.233044, -0.9354678, 1, 1, 1, 1, 1,
-0.9191074, 0.3559158, -0.7349108, 1, 1, 1, 1, 1,
-0.9141544, 1.384729, -2.160724, 1, 1, 1, 1, 1,
-0.9122285, -1.291069, -2.833353, 1, 1, 1, 1, 1,
-0.9119864, 0.1378597, -2.735566, 1, 1, 1, 1, 1,
-0.9087191, 0.0492343, -2.46749, 1, 1, 1, 1, 1,
-0.9038682, 0.9861981, -0.133068, 1, 1, 1, 1, 1,
-0.9003319, 1.785951, -0.4653844, 1, 1, 1, 1, 1,
-0.8899546, -0.403194, -2.045096, 1, 1, 1, 1, 1,
-0.8892631, 0.3230088, -0.4866841, 1, 1, 1, 1, 1,
-0.8758745, 0.4945211, -0.3480416, 1, 1, 1, 1, 1,
-0.8738396, 0.3054058, -0.02630431, 1, 1, 1, 1, 1,
-0.8634841, -0.0343625, -2.337719, 1, 1, 1, 1, 1,
-0.8576001, -0.4254895, -0.8414948, 1, 1, 1, 1, 1,
-0.8555091, -0.2336117, -1.808916, 1, 1, 1, 1, 1,
-0.8525788, -1.164806, -2.881407, 0, 0, 1, 1, 1,
-0.8401639, -1.037288, -3.485274, 1, 0, 0, 1, 1,
-0.836122, 0.4027177, -0.1145815, 1, 0, 0, 1, 1,
-0.8282933, 0.7540504, 0.4066839, 1, 0, 0, 1, 1,
-0.8224421, 0.1757314, -1.121507, 1, 0, 0, 1, 1,
-0.8160971, -0.7323632, -2.65523, 1, 0, 0, 1, 1,
-0.8130391, -1.537204, -1.163534, 0, 0, 0, 1, 1,
-0.8094752, 1.268843, -0.3373147, 0, 0, 0, 1, 1,
-0.8065172, 0.6318634, 0.03355638, 0, 0, 0, 1, 1,
-0.8029043, 0.6276578, 0.184205, 0, 0, 0, 1, 1,
-0.7961681, 0.383001, -0.2289476, 0, 0, 0, 1, 1,
-0.7960065, 0.008513681, 0.711641, 0, 0, 0, 1, 1,
-0.7955986, -1.888553, -1.769086, 0, 0, 0, 1, 1,
-0.7943722, 1.199181, -1.656151, 1, 1, 1, 1, 1,
-0.7915623, 0.2187539, 0.2045419, 1, 1, 1, 1, 1,
-0.7914851, 0.3692503, 0.9000338, 1, 1, 1, 1, 1,
-0.781444, -0.3162702, -2.351719, 1, 1, 1, 1, 1,
-0.7776613, -0.2891403, -1.692742, 1, 1, 1, 1, 1,
-0.7773488, 0.01901743, -1.774579, 1, 1, 1, 1, 1,
-0.7700992, 2.330253, 0.3038394, 1, 1, 1, 1, 1,
-0.7682488, 1.596273, -0.9793747, 1, 1, 1, 1, 1,
-0.7650246, -0.5464059, -3.17224, 1, 1, 1, 1, 1,
-0.7618539, 0.366247, 0.3339512, 1, 1, 1, 1, 1,
-0.758859, 1.842577, -1.624341, 1, 1, 1, 1, 1,
-0.7508773, 0.2558566, -1.64839, 1, 1, 1, 1, 1,
-0.7495625, 0.357087, 0.9297241, 1, 1, 1, 1, 1,
-0.7492413, -2.295802, -3.80932, 1, 1, 1, 1, 1,
-0.7463075, -1.206103, -3.081129, 1, 1, 1, 1, 1,
-0.7458622, 0.5181726, -0.9669589, 0, 0, 1, 1, 1,
-0.7438562, -0.1869452, -2.402008, 1, 0, 0, 1, 1,
-0.7406808, 1.140091, -0.06566635, 1, 0, 0, 1, 1,
-0.7379429, -1.52248, -1.900716, 1, 0, 0, 1, 1,
-0.7276165, -0.9761478, -2.90105, 1, 0, 0, 1, 1,
-0.7227593, 0.5738161, -1.60752, 1, 0, 0, 1, 1,
-0.71474, -1.455929, -2.013068, 0, 0, 0, 1, 1,
-0.707753, -0.8620136, -3.571172, 0, 0, 0, 1, 1,
-0.7046305, 0.7382692, -1.529679, 0, 0, 0, 1, 1,
-0.6986946, 0.5021428, 0.4203225, 0, 0, 0, 1, 1,
-0.6959605, -1.444821, -2.188358, 0, 0, 0, 1, 1,
-0.695249, 1.890079, -0.1765326, 0, 0, 0, 1, 1,
-0.6832633, -0.01818386, -1.744758, 0, 0, 0, 1, 1,
-0.6765373, 0.8672835, -0.8142977, 1, 1, 1, 1, 1,
-0.6731818, -0.8590945, -3.553035, 1, 1, 1, 1, 1,
-0.6707564, 0.5065657, -2.215652, 1, 1, 1, 1, 1,
-0.6686829, -0.05559714, -2.891571, 1, 1, 1, 1, 1,
-0.6660065, -1.751966, -1.399895, 1, 1, 1, 1, 1,
-0.6626754, 0.4026225, 0.2278304, 1, 1, 1, 1, 1,
-0.6619535, 0.6247103, -1.164222, 1, 1, 1, 1, 1,
-0.6535258, -0.3717113, -2.985141, 1, 1, 1, 1, 1,
-0.6534467, 2.233298, 0.3684565, 1, 1, 1, 1, 1,
-0.6531858, -1.179845, -2.318252, 1, 1, 1, 1, 1,
-0.6526556, 1.299067, -1.394627, 1, 1, 1, 1, 1,
-0.6512348, -0.6573339, -3.661089, 1, 1, 1, 1, 1,
-0.6489576, 1.041003, 0.4490507, 1, 1, 1, 1, 1,
-0.6480813, 0.4193486, 0.6905696, 1, 1, 1, 1, 1,
-0.6446066, -0.4327788, -2.919886, 1, 1, 1, 1, 1,
-0.6402704, -0.08633313, -1.193296, 0, 0, 1, 1, 1,
-0.6380476, -0.9692025, -3.802418, 1, 0, 0, 1, 1,
-0.6368452, -0.1221065, -1.670066, 1, 0, 0, 1, 1,
-0.6344044, 0.3338848, -0.6961761, 1, 0, 0, 1, 1,
-0.632487, -0.7796511, -1.969747, 1, 0, 0, 1, 1,
-0.6305367, 0.1251274, -0.4163808, 1, 0, 0, 1, 1,
-0.6287139, -0.4445667, -2.633327, 0, 0, 0, 1, 1,
-0.6281148, 0.5466452, -1.451218, 0, 0, 0, 1, 1,
-0.6215091, -0.4154769, -1.167275, 0, 0, 0, 1, 1,
-0.6195116, 0.2171763, -1.532063, 0, 0, 0, 1, 1,
-0.616834, -0.5244157, -1.361309, 0, 0, 0, 1, 1,
-0.6040082, -0.04377224, -1.15487, 0, 0, 0, 1, 1,
-0.6026369, -1.191915, -2.154057, 0, 0, 0, 1, 1,
-0.5952316, -1.065322, -2.467891, 1, 1, 1, 1, 1,
-0.5941314, 0.754278, -1.933724, 1, 1, 1, 1, 1,
-0.5933688, 1.134584, -0.2234803, 1, 1, 1, 1, 1,
-0.5922984, 0.254146, -1.531775, 1, 1, 1, 1, 1,
-0.5851711, -1.643985, -3.090526, 1, 1, 1, 1, 1,
-0.5833352, 0.6660532, -0.9727914, 1, 1, 1, 1, 1,
-0.5832587, 2.117363, 0.5400879, 1, 1, 1, 1, 1,
-0.5819443, 0.2376616, -2.658105, 1, 1, 1, 1, 1,
-0.5814867, -0.206015, -1.486008, 1, 1, 1, 1, 1,
-0.5807672, -0.9842582, -3.442082, 1, 1, 1, 1, 1,
-0.5778075, -0.8815834, -0.4657688, 1, 1, 1, 1, 1,
-0.5744006, -0.1540438, -3.648562, 1, 1, 1, 1, 1,
-0.5741043, 0.7834846, 0.1550387, 1, 1, 1, 1, 1,
-0.5725049, 0.1795257, -1.202726, 1, 1, 1, 1, 1,
-0.5700387, 1.07308, -0.4439579, 1, 1, 1, 1, 1,
-0.5683059, 0.4948853, -2.184612, 0, 0, 1, 1, 1,
-0.5678646, 0.8361784, -0.09972957, 1, 0, 0, 1, 1,
-0.563545, 2.231042, 0.9717658, 1, 0, 0, 1, 1,
-0.5611797, 0.4019712, -0.9197978, 1, 0, 0, 1, 1,
-0.5611027, -0.3430531, -0.5084866, 1, 0, 0, 1, 1,
-0.552864, 1.661316, 0.8344228, 1, 0, 0, 1, 1,
-0.5494825, -0.1666867, -1.196482, 0, 0, 0, 1, 1,
-0.5435421, -0.4892556, -1.166366, 0, 0, 0, 1, 1,
-0.5397019, -0.6959046, -4.153024, 0, 0, 0, 1, 1,
-0.5374419, -0.9854652, -1.848703, 0, 0, 0, 1, 1,
-0.536122, 0.2024637, -2.181043, 0, 0, 0, 1, 1,
-0.5321047, -0.5667609, -2.342576, 0, 0, 0, 1, 1,
-0.5298663, 0.390199, -3.625618, 0, 0, 0, 1, 1,
-0.5296918, -1.196424, -0.763714, 1, 1, 1, 1, 1,
-0.5293255, -0.893626, -2.951276, 1, 1, 1, 1, 1,
-0.528254, -0.04705436, -1.482854, 1, 1, 1, 1, 1,
-0.5274225, 1.119563, 0.01378357, 1, 1, 1, 1, 1,
-0.5271707, 0.9975131, -0.5072998, 1, 1, 1, 1, 1,
-0.5262756, -0.345826, -3.779352, 1, 1, 1, 1, 1,
-0.5251742, 0.001336224, -1.093859, 1, 1, 1, 1, 1,
-0.5244852, 0.9834972, -0.1777781, 1, 1, 1, 1, 1,
-0.5240352, 0.7211902, -0.1815598, 1, 1, 1, 1, 1,
-0.5182065, -1.109568, -4.489786, 1, 1, 1, 1, 1,
-0.5153355, -0.813446, -2.107044, 1, 1, 1, 1, 1,
-0.5132856, -0.5439124, -2.500221, 1, 1, 1, 1, 1,
-0.5123293, -0.5228091, -3.284296, 1, 1, 1, 1, 1,
-0.5083783, -1.750148, -2.194701, 1, 1, 1, 1, 1,
-0.5052891, -1.587046, -2.254668, 1, 1, 1, 1, 1,
-0.5051317, 2.316708, -1.295692, 0, 0, 1, 1, 1,
-0.4994575, -1.038915, -4.179403, 1, 0, 0, 1, 1,
-0.4985428, -0.4457823, -0.4333542, 1, 0, 0, 1, 1,
-0.4901102, 0.965004, -0.823949, 1, 0, 0, 1, 1,
-0.4898065, 0.5122201, -0.1781294, 1, 0, 0, 1, 1,
-0.4891495, 0.7552615, -0.01066514, 1, 0, 0, 1, 1,
-0.4862953, 0.4914566, -0.5954446, 0, 0, 0, 1, 1,
-0.4841523, -0.3291888, -0.9904687, 0, 0, 0, 1, 1,
-0.4841452, 1.642266, -1.110012, 0, 0, 0, 1, 1,
-0.4836062, -1.100006, -3.420196, 0, 0, 0, 1, 1,
-0.4774136, 0.04782623, -1.124353, 0, 0, 0, 1, 1,
-0.4740584, -2.741425, -1.918401, 0, 0, 0, 1, 1,
-0.4663007, -1.447091, -3.475049, 0, 0, 0, 1, 1,
-0.4626572, -0.5644681, -1.747114, 1, 1, 1, 1, 1,
-0.4599108, -1.674694, -3.179934, 1, 1, 1, 1, 1,
-0.4544061, 1.087239, -0.2738126, 1, 1, 1, 1, 1,
-0.4525504, 1.194125, -0.3522891, 1, 1, 1, 1, 1,
-0.4496937, 0.247623, -3.159302, 1, 1, 1, 1, 1,
-0.4488932, -2.104114, -3.914049, 1, 1, 1, 1, 1,
-0.4480059, 0.02579909, -1.022041, 1, 1, 1, 1, 1,
-0.4479305, -1.396023, -2.782712, 1, 1, 1, 1, 1,
-0.4466982, -0.997771, -2.833503, 1, 1, 1, 1, 1,
-0.4462287, -1.231476, -3.209836, 1, 1, 1, 1, 1,
-0.4448231, 0.7128623, -0.3480513, 1, 1, 1, 1, 1,
-0.4398907, 0.5304598, 0.01632845, 1, 1, 1, 1, 1,
-0.4397533, -0.9512689, -1.654137, 1, 1, 1, 1, 1,
-0.4244562, 1.041059, -1.381334, 1, 1, 1, 1, 1,
-0.4242277, -1.315969, -1.941327, 1, 1, 1, 1, 1,
-0.4221958, -0.1673183, -1.941693, 0, 0, 1, 1, 1,
-0.4156284, 0.6088032, 0.6437466, 1, 0, 0, 1, 1,
-0.4139832, -0.3991128, 0.3132914, 1, 0, 0, 1, 1,
-0.4123554, -0.1842898, -2.993558, 1, 0, 0, 1, 1,
-0.4105211, 0.6435674, -0.970724, 1, 0, 0, 1, 1,
-0.4099706, -1.310062, -1.988813, 1, 0, 0, 1, 1,
-0.40799, 0.4059234, 0.1237844, 0, 0, 0, 1, 1,
-0.4034983, -0.7593747, -2.783021, 0, 0, 0, 1, 1,
-0.3994366, -0.1986764, -1.951394, 0, 0, 0, 1, 1,
-0.3960497, -0.5462236, -0.4220522, 0, 0, 0, 1, 1,
-0.3944577, 1.28316, -1.665762, 0, 0, 0, 1, 1,
-0.3917538, 1.441811, 0.2387311, 0, 0, 0, 1, 1,
-0.3899071, 0.4396459, -0.6856681, 0, 0, 0, 1, 1,
-0.3894608, 0.3721657, -1.379623, 1, 1, 1, 1, 1,
-0.3885138, -1.101496, -2.989433, 1, 1, 1, 1, 1,
-0.3867662, -0.6289558, -2.882712, 1, 1, 1, 1, 1,
-0.3799993, 1.71661, -1.962435, 1, 1, 1, 1, 1,
-0.3717217, 0.3950623, 0.2843156, 1, 1, 1, 1, 1,
-0.3664959, -1.042445, -2.588567, 1, 1, 1, 1, 1,
-0.3635939, 2.04961, -0.4953657, 1, 1, 1, 1, 1,
-0.3627091, -0.9167839, -3.645768, 1, 1, 1, 1, 1,
-0.361073, 0.6372933, 0.01990181, 1, 1, 1, 1, 1,
-0.3555781, 2.47681, 0.4782803, 1, 1, 1, 1, 1,
-0.3496953, -0.9793342, -2.981081, 1, 1, 1, 1, 1,
-0.3491875, 1.064434, 0.3921808, 1, 1, 1, 1, 1,
-0.3484155, -1.81617, -4.994774, 1, 1, 1, 1, 1,
-0.3470895, 0.7724404, 0.451371, 1, 1, 1, 1, 1,
-0.3448785, -1.030654, -0.8032007, 1, 1, 1, 1, 1,
-0.3446633, -0.5367382, -1.953139, 0, 0, 1, 1, 1,
-0.3399055, -0.5331171, -2.082407, 1, 0, 0, 1, 1,
-0.3381384, -1.342471, -2.899131, 1, 0, 0, 1, 1,
-0.3376747, -2.319337, -0.7124996, 1, 0, 0, 1, 1,
-0.3257479, -1.388411, -3.058885, 1, 0, 0, 1, 1,
-0.3236288, 0.393894, -2.546903, 1, 0, 0, 1, 1,
-0.3229302, 0.6934224, -0.7582668, 0, 0, 0, 1, 1,
-0.3158667, -0.9013488, -2.200454, 0, 0, 0, 1, 1,
-0.3144245, 1.242992, -2.564333, 0, 0, 0, 1, 1,
-0.3132969, 0.5811296, 0.5207626, 0, 0, 0, 1, 1,
-0.3125221, -0.003918762, -2.603196, 0, 0, 0, 1, 1,
-0.3119594, 0.2955252, 0.9312402, 0, 0, 0, 1, 1,
-0.3115761, -2.215772, -4.723265, 0, 0, 0, 1, 1,
-0.3067228, 0.6700515, 1.888946, 1, 1, 1, 1, 1,
-0.3036592, 0.01464301, -2.926948, 1, 1, 1, 1, 1,
-0.3017604, 0.7544901, 0.3852653, 1, 1, 1, 1, 1,
-0.3011988, -0.4632558, -2.133616, 1, 1, 1, 1, 1,
-0.3004688, 0.2091189, 0.3583758, 1, 1, 1, 1, 1,
-0.2949026, -0.4476155, -1.280885, 1, 1, 1, 1, 1,
-0.2882836, 0.2110888, -1.109389, 1, 1, 1, 1, 1,
-0.2863789, 1.138105, -0.1784049, 1, 1, 1, 1, 1,
-0.2855349, -0.6806381, -2.246733, 1, 1, 1, 1, 1,
-0.2843795, -1.212491, -3.084034, 1, 1, 1, 1, 1,
-0.2798073, -0.01076469, -1.452702, 1, 1, 1, 1, 1,
-0.2794254, 1.013835, 0.4458571, 1, 1, 1, 1, 1,
-0.2788468, -0.05676257, -0.3859742, 1, 1, 1, 1, 1,
-0.2779756, 0.5697669, -0.4545154, 1, 1, 1, 1, 1,
-0.2772194, -0.546232, -2.29003, 1, 1, 1, 1, 1,
-0.2764128, 0.3483812, -1.559971, 0, 0, 1, 1, 1,
-0.2678641, 0.07851996, -0.9119607, 1, 0, 0, 1, 1,
-0.2635246, 0.4756569, -0.02254235, 1, 0, 0, 1, 1,
-0.2629563, -0.8853065, -1.363634, 1, 0, 0, 1, 1,
-0.2625326, 0.1528527, 0.6425157, 1, 0, 0, 1, 1,
-0.2622623, 0.1649513, -1.559164, 1, 0, 0, 1, 1,
-0.262027, -0.0194639, -2.209636, 0, 0, 0, 1, 1,
-0.2594766, -0.07754128, -1.377367, 0, 0, 0, 1, 1,
-0.257528, 1.222335, -0.7901693, 0, 0, 0, 1, 1,
-0.2566257, -0.4594126, -3.274543, 0, 0, 0, 1, 1,
-0.2555848, -1.429845, -2.342607, 0, 0, 0, 1, 1,
-0.2523825, -0.4983015, -3.968681, 0, 0, 0, 1, 1,
-0.2502723, 0.5950806, 0.6552197, 0, 0, 0, 1, 1,
-0.2489699, 1.145391, 1.101542, 1, 1, 1, 1, 1,
-0.2471468, -0.3161129, -3.695364, 1, 1, 1, 1, 1,
-0.2434426, 0.3080752, -0.658864, 1, 1, 1, 1, 1,
-0.2392324, 0.7412938, -1.36829, 1, 1, 1, 1, 1,
-0.2391386, -0.01035628, -0.851304, 1, 1, 1, 1, 1,
-0.2379759, 0.8873705, -0.3675233, 1, 1, 1, 1, 1,
-0.2339706, 0.9572551, 0.063467, 1, 1, 1, 1, 1,
-0.2305456, 0.4016342, -0.7114837, 1, 1, 1, 1, 1,
-0.2301417, -0.7031436, -2.539455, 1, 1, 1, 1, 1,
-0.229168, 0.6178762, -0.4739227, 1, 1, 1, 1, 1,
-0.221025, 1.943386, 0.2852947, 1, 1, 1, 1, 1,
-0.2150385, 0.144097, -1.496368, 1, 1, 1, 1, 1,
-0.2090333, 0.7769743, 0.4350291, 1, 1, 1, 1, 1,
-0.2076009, -0.8268545, -4.973742, 1, 1, 1, 1, 1,
-0.201952, 1.568614, -0.329597, 1, 1, 1, 1, 1,
-0.1982352, 0.7559813, -1.473706, 0, 0, 1, 1, 1,
-0.1980311, -1.306003, -1.456958, 1, 0, 0, 1, 1,
-0.1966703, -1.523508, -4.722888, 1, 0, 0, 1, 1,
-0.1939435, -1.156767, -3.680475, 1, 0, 0, 1, 1,
-0.1931718, -1.840774, -2.0794, 1, 0, 0, 1, 1,
-0.1903735, 0.7715423, -0.3129217, 1, 0, 0, 1, 1,
-0.1855946, 1.270678, -0.7221578, 0, 0, 0, 1, 1,
-0.1805889, -0.1508135, -1.952702, 0, 0, 0, 1, 1,
-0.1800812, 0.3182847, -0.3102331, 0, 0, 0, 1, 1,
-0.1790641, -0.7376708, -2.328352, 0, 0, 0, 1, 1,
-0.1769993, 2.180986, -0.1818499, 0, 0, 0, 1, 1,
-0.17677, -2.714336, -2.464381, 0, 0, 0, 1, 1,
-0.1725888, -1.025697, -4.091995, 0, 0, 0, 1, 1,
-0.171288, -0.06071497, -3.585953, 1, 1, 1, 1, 1,
-0.1675476, -0.2532609, -0.9118606, 1, 1, 1, 1, 1,
-0.1644691, -1.171532, -1.560554, 1, 1, 1, 1, 1,
-0.1596865, 1.15577, 0.1421243, 1, 1, 1, 1, 1,
-0.1592291, 1.299574, 0.6885081, 1, 1, 1, 1, 1,
-0.1591558, 1.984555, 0.3690494, 1, 1, 1, 1, 1,
-0.158897, 1.000068, 0.1353807, 1, 1, 1, 1, 1,
-0.1587555, 1.173841, 0.8705393, 1, 1, 1, 1, 1,
-0.1563625, 0.2871315, -0.2449396, 1, 1, 1, 1, 1,
-0.1563561, 0.4884576, -0.3309454, 1, 1, 1, 1, 1,
-0.1521609, 0.4710813, -1.447272, 1, 1, 1, 1, 1,
-0.1499353, 1.41012, -0.02335229, 1, 1, 1, 1, 1,
-0.144496, -0.2040586, -3.382989, 1, 1, 1, 1, 1,
-0.1432447, 0.5610322, -1.639375, 1, 1, 1, 1, 1,
-0.1418603, -0.8935504, -3.674088, 1, 1, 1, 1, 1,
-0.1414277, 0.7304025, 0.9997419, 0, 0, 1, 1, 1,
-0.1318694, -0.6058384, -3.175423, 1, 0, 0, 1, 1,
-0.1311402, 1.489429, -0.6483567, 1, 0, 0, 1, 1,
-0.1297268, 0.3302804, 0.3547652, 1, 0, 0, 1, 1,
-0.1288335, -0.7268059, -3.052385, 1, 0, 0, 1, 1,
-0.1273367, 1.369721, -1.278642, 1, 0, 0, 1, 1,
-0.1271386, 1.409902, -0.7196712, 0, 0, 0, 1, 1,
-0.1220133, 0.7164131, -0.6513656, 0, 0, 0, 1, 1,
-0.1219268, -0.4808896, -1.477977, 0, 0, 0, 1, 1,
-0.1210539, 0.2981445, -0.6134113, 0, 0, 0, 1, 1,
-0.1193021, -0.1158456, -2.095707, 0, 0, 0, 1, 1,
-0.117812, 1.487462, 1.130794, 0, 0, 0, 1, 1,
-0.1169118, -0.857025, -5.022171, 0, 0, 0, 1, 1,
-0.1160877, -0.4041601, -2.750149, 1, 1, 1, 1, 1,
-0.1111022, 0.5051421, -0.9415277, 1, 1, 1, 1, 1,
-0.1018027, -0.2174989, -2.660502, 1, 1, 1, 1, 1,
-0.09804703, -0.5751228, -3.819771, 1, 1, 1, 1, 1,
-0.09498434, 0.02554421, -0.3638799, 1, 1, 1, 1, 1,
-0.0948284, -1.183751, -2.949082, 1, 1, 1, 1, 1,
-0.09151178, -0.0606721, -1.386101, 1, 1, 1, 1, 1,
-0.09084994, -1.494278, -3.370368, 1, 1, 1, 1, 1,
-0.09064969, -1.452226, -4.639222, 1, 1, 1, 1, 1,
-0.08788796, -1.682404, -2.457819, 1, 1, 1, 1, 1,
-0.08739692, -0.5425357, -2.535359, 1, 1, 1, 1, 1,
-0.08298297, 0.4781092, 1.194783, 1, 1, 1, 1, 1,
-0.08188786, -0.6923232, -3.579818, 1, 1, 1, 1, 1,
-0.08146456, 1.532951, -0.3291275, 1, 1, 1, 1, 1,
-0.08115604, -2.368841, -1.970185, 1, 1, 1, 1, 1,
-0.07972063, -0.01777372, -1.002501, 0, 0, 1, 1, 1,
-0.07944468, 0.6085849, -0.02649759, 1, 0, 0, 1, 1,
-0.07661249, -0.1630789, -1.768391, 1, 0, 0, 1, 1,
-0.07455122, -1.353101, -2.687044, 1, 0, 0, 1, 1,
-0.07452027, 0.992125, 0.3900276, 1, 0, 0, 1, 1,
-0.073685, 1.37798, -0.7524427, 1, 0, 0, 1, 1,
-0.07193946, 0.5020546, 1.457321, 0, 0, 0, 1, 1,
-0.07160395, -0.4204785, -1.67984, 0, 0, 0, 1, 1,
-0.06949256, -0.6495702, -1.901806, 0, 0, 0, 1, 1,
-0.06288427, 0.907344, -0.3957392, 0, 0, 0, 1, 1,
-0.05867629, 1.244294, 1.811533, 0, 0, 0, 1, 1,
-0.05486799, -0.8952739, -3.186874, 0, 0, 0, 1, 1,
-0.05412602, 0.7524742, -0.4082367, 0, 0, 0, 1, 1,
-0.05398111, -0.7230841, -2.07828, 1, 1, 1, 1, 1,
-0.04605778, 0.1164657, 0.4113548, 1, 1, 1, 1, 1,
-0.04592183, 1.622519, 0.3946473, 1, 1, 1, 1, 1,
-0.04335279, 0.2505483, 0.2715584, 1, 1, 1, 1, 1,
-0.0404276, -0.08197808, -3.207669, 1, 1, 1, 1, 1,
-0.03932189, -1.497486, -4.067575, 1, 1, 1, 1, 1,
-0.0348574, 0.04882277, -1.290249, 1, 1, 1, 1, 1,
-0.03135086, -2.652603, -4.414739, 1, 1, 1, 1, 1,
-0.03074048, -0.3921539, -5.13621, 1, 1, 1, 1, 1,
-0.02026629, 0.6015672, 0.9291708, 1, 1, 1, 1, 1,
-0.02007228, 0.4557542, 0.03559073, 1, 1, 1, 1, 1,
-0.01860243, -0.992718, -4.059861, 1, 1, 1, 1, 1,
-0.01316392, -0.3117545, -1.961485, 1, 1, 1, 1, 1,
-0.01176279, 0.1109248, 1.398611, 1, 1, 1, 1, 1,
-0.01067637, -0.02025408, -2.500668, 1, 1, 1, 1, 1,
-0.00799806, 1.078827, 0.565148, 0, 0, 1, 1, 1,
-0.007009913, 1.321543, -1.863274, 1, 0, 0, 1, 1,
-0.0004116841, 0.5392723, -1.380991, 1, 0, 0, 1, 1,
6.813541e-05, 0.2521916, -1.518576, 1, 0, 0, 1, 1,
0.005805148, 0.6959747, 1.576928, 1, 0, 0, 1, 1,
0.008982676, 0.7860941, 0.05078273, 1, 0, 0, 1, 1,
0.01187285, 0.2406105, -0.2664926, 0, 0, 0, 1, 1,
0.0126179, 0.008136803, 1.649052, 0, 0, 0, 1, 1,
0.01283161, -1.972803, 4.027747, 0, 0, 0, 1, 1,
0.01830257, -1.052478, 3.338462, 0, 0, 0, 1, 1,
0.02002208, 0.3143868, 0.904588, 0, 0, 0, 1, 1,
0.02140422, 0.3586892, -0.4779505, 0, 0, 0, 1, 1,
0.0225637, 1.594641, -0.4408971, 0, 0, 0, 1, 1,
0.02374032, -0.6997516, 2.493342, 1, 1, 1, 1, 1,
0.02854812, 1.452683, -0.431015, 1, 1, 1, 1, 1,
0.03206661, 1.684511, 0.7848371, 1, 1, 1, 1, 1,
0.03523429, 0.4201757, 1.47087, 1, 1, 1, 1, 1,
0.03844136, -0.2074313, 4.449333, 1, 1, 1, 1, 1,
0.04146518, -0.1907507, 3.02918, 1, 1, 1, 1, 1,
0.04193444, 0.2830295, -1.699414, 1, 1, 1, 1, 1,
0.04263889, 0.6534216, 0.7965934, 1, 1, 1, 1, 1,
0.04682511, 1.782956, -1.125103, 1, 1, 1, 1, 1,
0.05067357, 0.802568, -0.3402265, 1, 1, 1, 1, 1,
0.05278777, -0.5411059, 1.397219, 1, 1, 1, 1, 1,
0.05290785, -0.6194137, 3.875558, 1, 1, 1, 1, 1,
0.05635057, -1.107846, 2.643511, 1, 1, 1, 1, 1,
0.05823537, -0.1681198, 2.768363, 1, 1, 1, 1, 1,
0.05886349, 0.3966854, 0.4949685, 1, 1, 1, 1, 1,
0.0603882, 0.7138282, 0.09634374, 0, 0, 1, 1, 1,
0.06264751, -1.378972, 2.773921, 1, 0, 0, 1, 1,
0.06509268, 0.8232494, -1.433801, 1, 0, 0, 1, 1,
0.06799221, 0.7673605, -1.12128, 1, 0, 0, 1, 1,
0.06964299, 1.150914, -0.279879, 1, 0, 0, 1, 1,
0.07098528, 0.4824286, -1.531718, 1, 0, 0, 1, 1,
0.07126208, 0.6153808, -1.433484, 0, 0, 0, 1, 1,
0.07522421, -0.1532017, 2.185582, 0, 0, 0, 1, 1,
0.07848069, -0.1720548, 2.984261, 0, 0, 0, 1, 1,
0.07937725, 0.05917882, 1.333992, 0, 0, 0, 1, 1,
0.08459055, -0.1908748, 5.357409, 0, 0, 0, 1, 1,
0.08649424, 0.6726702, 1.493357, 0, 0, 0, 1, 1,
0.08801355, 1.210638, 0.9138633, 0, 0, 0, 1, 1,
0.09622125, -0.4045903, 2.634058, 1, 1, 1, 1, 1,
0.1010787, 0.2758777, -0.0256877, 1, 1, 1, 1, 1,
0.1030698, -0.3593475, 4.659335, 1, 1, 1, 1, 1,
0.1059724, -0.6094886, 3.614775, 1, 1, 1, 1, 1,
0.1061789, -1.408846, 2.15926, 1, 1, 1, 1, 1,
0.106852, -0.4801069, 4.05731, 1, 1, 1, 1, 1,
0.1101864, -1.253636, 0.5328611, 1, 1, 1, 1, 1,
0.1106508, -0.3870752, 3.374192, 1, 1, 1, 1, 1,
0.1142122, 0.9599158, 0.5800753, 1, 1, 1, 1, 1,
0.1147144, -0.6730823, 4.003772, 1, 1, 1, 1, 1,
0.1150734, 0.7208834, 0.6518012, 1, 1, 1, 1, 1,
0.1165777, -0.4432007, 2.57242, 1, 1, 1, 1, 1,
0.120366, -0.6971105, 3.336981, 1, 1, 1, 1, 1,
0.1221301, 1.083742, 2.123818, 1, 1, 1, 1, 1,
0.1231614, 0.7506474, 0.1859518, 1, 1, 1, 1, 1,
0.1256349, -0.5503373, 2.738423, 0, 0, 1, 1, 1,
0.1280354, 2.704908, 0.4067208, 1, 0, 0, 1, 1,
0.1296091, 0.3760879, 1.245103, 1, 0, 0, 1, 1,
0.1342175, -1.154835, 2.410699, 1, 0, 0, 1, 1,
0.134624, -0.6366916, 3.013231, 1, 0, 0, 1, 1,
0.1363576, 0.2852397, 0.8182139, 1, 0, 0, 1, 1,
0.1365297, 1.711347, -1.537479, 0, 0, 0, 1, 1,
0.1423623, 0.5688652, -1.569138, 0, 0, 0, 1, 1,
0.1442018, -1.388441, 3.228392, 0, 0, 0, 1, 1,
0.1452704, -0.3466364, 2.394938, 0, 0, 0, 1, 1,
0.1462298, 1.66307, 2.126624, 0, 0, 0, 1, 1,
0.1510584, -0.6210733, 2.158938, 0, 0, 0, 1, 1,
0.1576655, 1.161655, -1.186306, 0, 0, 0, 1, 1,
0.1576826, -0.8834931, 2.654327, 1, 1, 1, 1, 1,
0.1619894, 0.3134649, 1.549541, 1, 1, 1, 1, 1,
0.1623064, -0.9597073, 4.435481, 1, 1, 1, 1, 1,
0.1646083, -1.297641, 1.564134, 1, 1, 1, 1, 1,
0.1684186, 0.9170073, 1.772552, 1, 1, 1, 1, 1,
0.1714067, 0.4537826, 0.2357385, 1, 1, 1, 1, 1,
0.1783365, 0.7383043, 0.5475413, 1, 1, 1, 1, 1,
0.1806011, -0.6622364, 2.925915, 1, 1, 1, 1, 1,
0.1831046, -0.492493, 1.193742, 1, 1, 1, 1, 1,
0.1887861, -0.1661856, 2.61204, 1, 1, 1, 1, 1,
0.196715, -0.9090887, 3.014409, 1, 1, 1, 1, 1,
0.1979425, -2.367692, 2.187484, 1, 1, 1, 1, 1,
0.2034233, -0.3756454, 4.866916, 1, 1, 1, 1, 1,
0.204964, 0.1418647, 1.926838, 1, 1, 1, 1, 1,
0.2096569, -1.172077, 3.612324, 1, 1, 1, 1, 1,
0.2104422, 0.3134168, 0.3675812, 0, 0, 1, 1, 1,
0.2130142, -0.8791984, 4.081271, 1, 0, 0, 1, 1,
0.2224446, 1.0152, 0.9458371, 1, 0, 0, 1, 1,
0.2245283, 2.036497, 1.919222, 1, 0, 0, 1, 1,
0.2253918, 0.5956632, -0.6259708, 1, 0, 0, 1, 1,
0.2340619, 0.07984972, 0.5383825, 1, 0, 0, 1, 1,
0.2354489, -1.173126, 2.096425, 0, 0, 0, 1, 1,
0.2369317, -0.6558626, 0.9374459, 0, 0, 0, 1, 1,
0.248006, 1.225317, -0.1901047, 0, 0, 0, 1, 1,
0.2493369, -0.4698322, 2.681917, 0, 0, 0, 1, 1,
0.2540573, 0.567063, 1.372224, 0, 0, 0, 1, 1,
0.254403, -1.325601, 3.515154, 0, 0, 0, 1, 1,
0.2557582, -0.1234715, 0.2265236, 0, 0, 0, 1, 1,
0.2604685, 1.673278, -0.9614747, 1, 1, 1, 1, 1,
0.2610272, -0.1518273, 1.389889, 1, 1, 1, 1, 1,
0.2613919, -0.5304272, 2.092134, 1, 1, 1, 1, 1,
0.2632103, 0.5764819, 0.08521737, 1, 1, 1, 1, 1,
0.2660924, -0.7473449, 3.544043, 1, 1, 1, 1, 1,
0.2662224, -1.961691, 1.874551, 1, 1, 1, 1, 1,
0.2681421, 1.835463, -0.2748077, 1, 1, 1, 1, 1,
0.2708467, 0.4318216, 0.9410794, 1, 1, 1, 1, 1,
0.2716725, -1.314211, 3.612098, 1, 1, 1, 1, 1,
0.2727459, 0.7826666, 2.104318, 1, 1, 1, 1, 1,
0.2740425, 0.04853753, 0.382622, 1, 1, 1, 1, 1,
0.2756198, 1.366756, 2.596405, 1, 1, 1, 1, 1,
0.2765607, 1.054687, -0.5081619, 1, 1, 1, 1, 1,
0.2799609, 0.9306533, -1.644238, 1, 1, 1, 1, 1,
0.2827593, 0.8719852, 0.1847534, 1, 1, 1, 1, 1,
0.2856373, -0.1748931, 1.767668, 0, 0, 1, 1, 1,
0.2881422, 1.041255, 0.4200957, 1, 0, 0, 1, 1,
0.2894353, 0.9173909, 1.307968, 1, 0, 0, 1, 1,
0.2900811, -0.5084378, 1.663581, 1, 0, 0, 1, 1,
0.2916524, -0.1588687, 4.076201, 1, 0, 0, 1, 1,
0.293756, 0.6932789, 0.4420715, 1, 0, 0, 1, 1,
0.2959264, 1.129383, -0.4501458, 0, 0, 0, 1, 1,
0.2986141, 0.4717028, 0.4815957, 0, 0, 0, 1, 1,
0.2986558, 2.211454, 0.1890514, 0, 0, 0, 1, 1,
0.3036439, -0.839123, 3.96392, 0, 0, 0, 1, 1,
0.3052798, 0.4527418, 0.5741597, 0, 0, 0, 1, 1,
0.3065102, 0.8424484, 0.3707544, 0, 0, 0, 1, 1,
0.307354, 1.405269, -1.17509, 0, 0, 0, 1, 1,
0.3120722, 0.9766212, 0.6920804, 1, 1, 1, 1, 1,
0.3153238, -1.060697, 3.335854, 1, 1, 1, 1, 1,
0.3208314, 0.8972841, 0.843888, 1, 1, 1, 1, 1,
0.3220719, -0.01392018, 0.7189898, 1, 1, 1, 1, 1,
0.3230281, 0.6659604, -0.09473187, 1, 1, 1, 1, 1,
0.3296778, 0.1831116, 2.828096, 1, 1, 1, 1, 1,
0.3321565, -0.6727833, 2.121343, 1, 1, 1, 1, 1,
0.336091, -0.1110085, 0.8292195, 1, 1, 1, 1, 1,
0.3370476, 0.1435142, -1.384512, 1, 1, 1, 1, 1,
0.3387427, -0.1703301, 1.668161, 1, 1, 1, 1, 1,
0.3452652, -0.1506592, 1.356795, 1, 1, 1, 1, 1,
0.3469658, 0.5773829, 0.7055064, 1, 1, 1, 1, 1,
0.3514082, -0.3554918, 3.327346, 1, 1, 1, 1, 1,
0.35472, -0.195931, 2.498247, 1, 1, 1, 1, 1,
0.3587013, 0.8233199, -1.085311, 1, 1, 1, 1, 1,
0.3616091, -3.911951e-05, 0.7467552, 0, 0, 1, 1, 1,
0.3624088, 1.24918, -0.5814312, 1, 0, 0, 1, 1,
0.3636444, -1.356065, 4.408121, 1, 0, 0, 1, 1,
0.3659306, 1.859774, -0.3361742, 1, 0, 0, 1, 1,
0.3674723, 0.5305586, 0.4352197, 1, 0, 0, 1, 1,
0.3677182, 1.437444, -0.7601956, 1, 0, 0, 1, 1,
0.370237, -0.5351234, 2.335836, 0, 0, 0, 1, 1,
0.3746952, -0.3436019, 1.913112, 0, 0, 0, 1, 1,
0.3812099, -0.5550293, 0.459687, 0, 0, 0, 1, 1,
0.383288, 0.1236823, 2.793228, 0, 0, 0, 1, 1,
0.3843462, 0.3257216, 0.3329734, 0, 0, 0, 1, 1,
0.3866479, 0.2003672, 0.5399003, 0, 0, 0, 1, 1,
0.390948, 0.8799639, -0.3075975, 0, 0, 0, 1, 1,
0.4025492, -0.8805538, 1.972005, 1, 1, 1, 1, 1,
0.4037073, -1.462059, 2.677528, 1, 1, 1, 1, 1,
0.4072738, 2.468393, -1.539248, 1, 1, 1, 1, 1,
0.4185115, 0.757378, 1.6693, 1, 1, 1, 1, 1,
0.4193543, 0.9153327, -0.7728984, 1, 1, 1, 1, 1,
0.4208539, 0.2671661, 1.444791, 1, 1, 1, 1, 1,
0.4239583, 0.4639309, 1.433656, 1, 1, 1, 1, 1,
0.4335317, 0.3338773, -0.5779817, 1, 1, 1, 1, 1,
0.4426177, 1.410263, -0.7417646, 1, 1, 1, 1, 1,
0.4448163, -0.08598072, 1.731475, 1, 1, 1, 1, 1,
0.4449299, 0.9753752, 2.351113, 1, 1, 1, 1, 1,
0.4459474, -0.9496529, 1.957147, 1, 1, 1, 1, 1,
0.4465222, -0.2369701, 1.353728, 1, 1, 1, 1, 1,
0.4472815, -0.08007737, 1.495544, 1, 1, 1, 1, 1,
0.4484026, -0.7314802, 2.022856, 1, 1, 1, 1, 1,
0.4537063, -0.4442516, 1.393534, 0, 0, 1, 1, 1,
0.4560838, -0.4847643, 2.680847, 1, 0, 0, 1, 1,
0.4586627, -0.2457248, 3.606257, 1, 0, 0, 1, 1,
0.4625584, -0.1174593, 2.105478, 1, 0, 0, 1, 1,
0.4689248, 0.2691383, -0.06838195, 1, 0, 0, 1, 1,
0.4754876, 0.5546879, 1.498739, 1, 0, 0, 1, 1,
0.4778719, -0.2743534, 1.212112, 0, 0, 0, 1, 1,
0.4792406, -0.1680301, 2.405027, 0, 0, 0, 1, 1,
0.4803849, 0.6675255, 0.5195884, 0, 0, 0, 1, 1,
0.4832704, 0.3662705, -0.1907548, 0, 0, 0, 1, 1,
0.48537, 0.3694517, 0.4172725, 0, 0, 0, 1, 1,
0.48546, -0.3848704, 2.549021, 0, 0, 0, 1, 1,
0.4867183, 1.422831, 1.748322, 0, 0, 0, 1, 1,
0.4870195, -0.3877718, 3.019851, 1, 1, 1, 1, 1,
0.4883852, -0.8811904, 2.629989, 1, 1, 1, 1, 1,
0.4960119, 0.9888554, 0.04148925, 1, 1, 1, 1, 1,
0.4974194, 0.4245643, 1.378873, 1, 1, 1, 1, 1,
0.4974414, 1.639414, 1.635301, 1, 1, 1, 1, 1,
0.4979514, 1.63293, -0.4726253, 1, 1, 1, 1, 1,
0.5015787, 0.3689226, 2.233768, 1, 1, 1, 1, 1,
0.5028101, -0.500858, 3.09841, 1, 1, 1, 1, 1,
0.5091541, 2.214586, -1.011538, 1, 1, 1, 1, 1,
0.5108014, -0.9461163, -0.1439664, 1, 1, 1, 1, 1,
0.5117356, 1.224141, 1.107911, 1, 1, 1, 1, 1,
0.5124797, -1.271586, 1.927011, 1, 1, 1, 1, 1,
0.5196035, -0.6984628, 3.682918, 1, 1, 1, 1, 1,
0.5240234, -0.2528149, 1.734719, 1, 1, 1, 1, 1,
0.526287, 0.3723264, 1.187057, 1, 1, 1, 1, 1,
0.5284264, -2.560513, 1.706266, 0, 0, 1, 1, 1,
0.5292915, -2.133012, 1.697485, 1, 0, 0, 1, 1,
0.5313098, 1.055216, 2.186919, 1, 0, 0, 1, 1,
0.5353016, 0.4662478, 0.6183273, 1, 0, 0, 1, 1,
0.5377451, 0.3560844, -0.6684741, 1, 0, 0, 1, 1,
0.5419962, -1.041563, 2.561322, 1, 0, 0, 1, 1,
0.5424858, 1.845611, -0.4238079, 0, 0, 0, 1, 1,
0.5443655, 0.02095444, 1.520117, 0, 0, 0, 1, 1,
0.5506323, -1.463381, 2.309337, 0, 0, 0, 1, 1,
0.5634758, -0.230768, 3.078712, 0, 0, 0, 1, 1,
0.5636769, -1.301708, 1.233446, 0, 0, 0, 1, 1,
0.5705339, -0.6074452, 4.352481, 0, 0, 0, 1, 1,
0.5722957, -0.9452871, 2.047198, 0, 0, 0, 1, 1,
0.5745476, 1.696362, -0.977052, 1, 1, 1, 1, 1,
0.5755059, -0.7678677, 3.287939, 1, 1, 1, 1, 1,
0.5759709, -0.1991339, 3.252851, 1, 1, 1, 1, 1,
0.5763897, -0.1776287, 1.495714, 1, 1, 1, 1, 1,
0.5764509, -0.07809643, 3.107371, 1, 1, 1, 1, 1,
0.5799893, 1.510735, -0.4592522, 1, 1, 1, 1, 1,
0.5803481, 1.756247, -0.1610032, 1, 1, 1, 1, 1,
0.58232, 0.3842531, 0.6362418, 1, 1, 1, 1, 1,
0.5830831, 1.223382, 0.167469, 1, 1, 1, 1, 1,
0.5857825, 0.4034826, 1.807324, 1, 1, 1, 1, 1,
0.5926741, -0.2775212, 2.330681, 1, 1, 1, 1, 1,
0.5965847, 0.09216956, 2.193478, 1, 1, 1, 1, 1,
0.5975202, -2.368556, 2.983126, 1, 1, 1, 1, 1,
0.6036078, 0.6813599, 0.6753442, 1, 1, 1, 1, 1,
0.6072707, -0.593468, 2.313761, 1, 1, 1, 1, 1,
0.6076677, 0.4183631, 1.230295, 0, 0, 1, 1, 1,
0.6094289, -0.4193897, 2.76048, 1, 0, 0, 1, 1,
0.6122475, -0.3902146, 2.077104, 1, 0, 0, 1, 1,
0.6156971, -0.1738327, 1.753319, 1, 0, 0, 1, 1,
0.617486, -1.372603, 4.106095, 1, 0, 0, 1, 1,
0.627429, -0.945165, 3.001687, 1, 0, 0, 1, 1,
0.6275424, -0.4872608, 2.172328, 0, 0, 0, 1, 1,
0.6294968, 0.314873, -0.00345712, 0, 0, 0, 1, 1,
0.6344956, -1.401934, 2.856081, 0, 0, 0, 1, 1,
0.6383025, -0.3877704, 1.395171, 0, 0, 0, 1, 1,
0.6401495, 1.581275, -0.3257161, 0, 0, 0, 1, 1,
0.6403477, 0.2528408, 1.910446, 0, 0, 0, 1, 1,
0.6413339, -0.1583185, 1.221166, 0, 0, 0, 1, 1,
0.6432658, -1.448866, 2.683227, 1, 1, 1, 1, 1,
0.646601, 0.6133536, 0.7010206, 1, 1, 1, 1, 1,
0.6467237, 0.1004245, 1.008475, 1, 1, 1, 1, 1,
0.6491453, 0.9914041, 0.2224264, 1, 1, 1, 1, 1,
0.6506861, 0.4848252, 0.8357654, 1, 1, 1, 1, 1,
0.6514854, -1.290697, 3.395292, 1, 1, 1, 1, 1,
0.6518079, 0.3095871, 1.350902, 1, 1, 1, 1, 1,
0.6527985, -0.2257773, 2.082933, 1, 1, 1, 1, 1,
0.6620541, 0.4799516, 0.3912252, 1, 1, 1, 1, 1,
0.6663789, 0.4414091, 2.013422, 1, 1, 1, 1, 1,
0.6664907, -0.2007072, 1.901419, 1, 1, 1, 1, 1,
0.6696227, -0.2993006, 1.737696, 1, 1, 1, 1, 1,
0.670818, -0.3398841, 3.000252, 1, 1, 1, 1, 1,
0.6767567, 0.9727995, 0.4611692, 1, 1, 1, 1, 1,
0.6784037, 0.3064961, 1.130709, 1, 1, 1, 1, 1,
0.6790777, 0.05668757, 0.9898138, 0, 0, 1, 1, 1,
0.6808951, 0.923725, -0.03671244, 1, 0, 0, 1, 1,
0.686003, -1.139942, 3.352395, 1, 0, 0, 1, 1,
0.688347, 0.2216693, -0.7401085, 1, 0, 0, 1, 1,
0.6921025, -0.2597374, 1.372336, 1, 0, 0, 1, 1,
0.6933384, 0.4984163, 0.06589922, 1, 0, 0, 1, 1,
0.6953044, 0.1226367, -0.7382655, 0, 0, 0, 1, 1,
0.701774, -0.857456, -1.528691, 0, 0, 0, 1, 1,
0.702715, -0.5528405, 2.601728, 0, 0, 0, 1, 1,
0.7048696, -1.728967, 2.503748, 0, 0, 0, 1, 1,
0.7107252, 0.7807764, 1.217448, 0, 0, 0, 1, 1,
0.7111686, -0.1338912, 0.6967209, 0, 0, 0, 1, 1,
0.7136409, 0.7009487, -0.2792307, 0, 0, 0, 1, 1,
0.7174531, 1.091305, 1.378011, 1, 1, 1, 1, 1,
0.7187266, -0.4712116, 2.288752, 1, 1, 1, 1, 1,
0.734446, -0.03314945, 0.3817689, 1, 1, 1, 1, 1,
0.7345403, 0.01186758, 1.05952, 1, 1, 1, 1, 1,
0.7385549, -0.2821666, 2.685444, 1, 1, 1, 1, 1,
0.7388526, -0.1129204, 2.669909, 1, 1, 1, 1, 1,
0.741222, 0.07284672, 2.10114, 1, 1, 1, 1, 1,
0.7423404, 0.8649932, 0.5212409, 1, 1, 1, 1, 1,
0.7482423, 1.415539, 1.59826, 1, 1, 1, 1, 1,
0.7531807, 0.448222, 1.78443, 1, 1, 1, 1, 1,
0.7545579, -1.460958, 2.749117, 1, 1, 1, 1, 1,
0.7564517, -1.393671, 3.837146, 1, 1, 1, 1, 1,
0.7570786, 0.723605, 1.626663, 1, 1, 1, 1, 1,
0.7608157, -0.7139888, 0.8416253, 1, 1, 1, 1, 1,
0.7613102, 0.5771714, 0.8806427, 1, 1, 1, 1, 1,
0.7626973, -1.087304, 3.605266, 0, 0, 1, 1, 1,
0.7627161, 1.77044, 1.381061, 1, 0, 0, 1, 1,
0.7669439, 2.195354, 0.7483515, 1, 0, 0, 1, 1,
0.771317, 0.976363, 2.019781, 1, 0, 0, 1, 1,
0.7740461, 0.9037157, 1.45894, 1, 0, 0, 1, 1,
0.7749525, -0.5812143, 1.951944, 1, 0, 0, 1, 1,
0.779942, -0.9819062, 3.862913, 0, 0, 0, 1, 1,
0.7836986, 0.6353768, 1.649044, 0, 0, 0, 1, 1,
0.7857106, 0.04686573, 2.389351, 0, 0, 0, 1, 1,
0.7862999, -1.320225, 2.229759, 0, 0, 0, 1, 1,
0.7866054, -0.1366636, 2.298151, 0, 0, 0, 1, 1,
0.8000611, 1.797841, 0.9079958, 0, 0, 0, 1, 1,
0.8007888, -0.3889951, 2.079875, 0, 0, 0, 1, 1,
0.8021912, -0.9589319, 2.188151, 1, 1, 1, 1, 1,
0.8096919, -1.182103, 0.2026181, 1, 1, 1, 1, 1,
0.8124821, 1.348206, -0.6776229, 1, 1, 1, 1, 1,
0.8166784, 0.03001519, 1.260561, 1, 1, 1, 1, 1,
0.8203954, -0.3907292, 2.095329, 1, 1, 1, 1, 1,
0.8234752, -0.6663654, 3.646407, 1, 1, 1, 1, 1,
0.8312975, 0.624097, 1.938851, 1, 1, 1, 1, 1,
0.8327593, -2.183278, 3.178349, 1, 1, 1, 1, 1,
0.837521, 3.238951, -2.080005, 1, 1, 1, 1, 1,
0.8420742, 0.222641, 0.4649627, 1, 1, 1, 1, 1,
0.852266, -0.4045199, 0.7048625, 1, 1, 1, 1, 1,
0.8530237, -0.3338272, 2.036318, 1, 1, 1, 1, 1,
0.8542111, 1.153892, -0.7435331, 1, 1, 1, 1, 1,
0.8563784, -0.05015402, 1.953355, 1, 1, 1, 1, 1,
0.8650196, 0.9443796, -0.7842245, 1, 1, 1, 1, 1,
0.8670939, -0.1005729, 2.28661, 0, 0, 1, 1, 1,
0.8705381, 0.7289154, 0.8725536, 1, 0, 0, 1, 1,
0.8725477, 0.4357597, 3.890131, 1, 0, 0, 1, 1,
0.8740208, 0.3420781, 1.058409, 1, 0, 0, 1, 1,
0.8755639, 2.035484, 2.283256, 1, 0, 0, 1, 1,
0.8772195, 0.5720059, 2.039419, 1, 0, 0, 1, 1,
0.8856138, 1.011027, 1.536588, 0, 0, 0, 1, 1,
0.886559, -0.5487126, 1.498309, 0, 0, 0, 1, 1,
0.8875852, 0.6315234, 1.214243, 0, 0, 0, 1, 1,
0.9019463, -0.439752, 3.811663, 0, 0, 0, 1, 1,
0.9070574, -0.5524504, 3.158944, 0, 0, 0, 1, 1,
0.9071609, 0.3684637, 2.401537, 0, 0, 0, 1, 1,
0.9075154, -1.985467, 3.338551, 0, 0, 0, 1, 1,
0.9080536, -0.6282247, 2.579901, 1, 1, 1, 1, 1,
0.9173166, -1.041437, 4.190634, 1, 1, 1, 1, 1,
0.9212195, -1.041926, 3.150743, 1, 1, 1, 1, 1,
0.9219534, 0.1953976, 1.628659, 1, 1, 1, 1, 1,
0.925799, 1.073611, 0.9127925, 1, 1, 1, 1, 1,
0.9353818, 0.2166952, 1.399077, 1, 1, 1, 1, 1,
0.9414881, -0.693408, 1.882026, 1, 1, 1, 1, 1,
0.9423231, -1.507029, 2.869558, 1, 1, 1, 1, 1,
0.942823, 1.324346, 0.3460783, 1, 1, 1, 1, 1,
0.9717834, -0.2505756, 1.990621, 1, 1, 1, 1, 1,
0.9744489, -1.304685, 3.023216, 1, 1, 1, 1, 1,
0.9772362, -0.2261787, 2.066538, 1, 1, 1, 1, 1,
0.9799752, -0.2687077, 0.957969, 1, 1, 1, 1, 1,
0.9805608, 0.6376463, 0.3991201, 1, 1, 1, 1, 1,
0.981065, -0.3463374, 3.062236, 1, 1, 1, 1, 1,
0.9872358, -1.266361, 4.161351, 0, 0, 1, 1, 1,
0.992265, 2.298412, 0.5490987, 1, 0, 0, 1, 1,
1.000685, -1.161432, 2.089444, 1, 0, 0, 1, 1,
1.014201, -0.2260596, 4.279624, 1, 0, 0, 1, 1,
1.018923, -1.78729, 2.598446, 1, 0, 0, 1, 1,
1.024115, 1.977913, 3.100346, 1, 0, 0, 1, 1,
1.030844, 1.983665, 0.7863902, 0, 0, 0, 1, 1,
1.038269, -0.4182855, 3.374835, 0, 0, 0, 1, 1,
1.041835, -1.213959, 2.760821, 0, 0, 0, 1, 1,
1.047256, -0.261729, 1.750604, 0, 0, 0, 1, 1,
1.049736, 0.7105429, -1.305313, 0, 0, 0, 1, 1,
1.049858, 1.568128, 1.190022, 0, 0, 0, 1, 1,
1.053263, 0.2117127, 0.8609158, 0, 0, 0, 1, 1,
1.056081, -0.4529476, 1.902216, 1, 1, 1, 1, 1,
1.075943, -0.03538573, 0.3135943, 1, 1, 1, 1, 1,
1.080404, -0.2651627, 1.319971, 1, 1, 1, 1, 1,
1.080572, 1.744339, 2.098776, 1, 1, 1, 1, 1,
1.082398, 0.1129145, 2.231581, 1, 1, 1, 1, 1,
1.090764, -1.021908, 2.685455, 1, 1, 1, 1, 1,
1.094723, 0.1540007, 0.7982939, 1, 1, 1, 1, 1,
1.095581, 0.7420549, 1.057961, 1, 1, 1, 1, 1,
1.109563, 0.1492982, 1.4151, 1, 1, 1, 1, 1,
1.111673, -0.7158554, 2.628093, 1, 1, 1, 1, 1,
1.12057, -1.467012, 1.197872, 1, 1, 1, 1, 1,
1.125794, -1.281287, 1.543425, 1, 1, 1, 1, 1,
1.13194, -0.5878478, 3.72539, 1, 1, 1, 1, 1,
1.132317, -0.9162039, 3.105308, 1, 1, 1, 1, 1,
1.135051, -0.3198543, 2.877154, 1, 1, 1, 1, 1,
1.139327, 0.1365675, 1.803868, 0, 0, 1, 1, 1,
1.143985, 0.7732702, 0.5406286, 1, 0, 0, 1, 1,
1.147883, 1.795718, 0.8130495, 1, 0, 0, 1, 1,
1.148847, -0.6874404, 2.309008, 1, 0, 0, 1, 1,
1.151612, 0.2391711, 1.335283, 1, 0, 0, 1, 1,
1.153611, -0.100569, 1.779351, 1, 0, 0, 1, 1,
1.163817, -0.5317384, 0.6555288, 0, 0, 0, 1, 1,
1.172862, -0.8632178, 2.391676, 0, 0, 0, 1, 1,
1.182044, -0.9334255, 1.432354, 0, 0, 0, 1, 1,
1.188786, 0.975512, -0.7122521, 0, 0, 0, 1, 1,
1.197825, -1.373623, 2.806487, 0, 0, 0, 1, 1,
1.198825, -1.460496, 2.082486, 0, 0, 0, 1, 1,
1.205261, 0.5099459, 0.3758492, 0, 0, 0, 1, 1,
1.206861, 0.1444449, 2.250075, 1, 1, 1, 1, 1,
1.227608, 1.064355, 0.4705725, 1, 1, 1, 1, 1,
1.230108, -0.1720953, 1.792212, 1, 1, 1, 1, 1,
1.232928, -1.351685, 3.88731, 1, 1, 1, 1, 1,
1.253818, -0.7906111, 3.098196, 1, 1, 1, 1, 1,
1.257942, -0.958971, 2.625779, 1, 1, 1, 1, 1,
1.262115, 0.7700286, 2.603185, 1, 1, 1, 1, 1,
1.264494, -0.6701638, 3.296731, 1, 1, 1, 1, 1,
1.268323, -1.532454, 3.461848, 1, 1, 1, 1, 1,
1.279982, 0.8868822, 1.468948, 1, 1, 1, 1, 1,
1.284902, -0.6517145, 2.725297, 1, 1, 1, 1, 1,
1.28963, -0.004252453, 1.734156, 1, 1, 1, 1, 1,
1.29543, -1.329425, 2.57407, 1, 1, 1, 1, 1,
1.296002, -0.5651006, 3.782853, 1, 1, 1, 1, 1,
1.297586, 1.041009, 1.250013, 1, 1, 1, 1, 1,
1.311822, -1.11959, 1.474377, 0, 0, 1, 1, 1,
1.312354, 0.9847992, 0.8414686, 1, 0, 0, 1, 1,
1.313492, -0.7562461, 2.437888, 1, 0, 0, 1, 1,
1.319771, -0.2898925, 1.232918, 1, 0, 0, 1, 1,
1.321301, 0.3639125, 2.062274, 1, 0, 0, 1, 1,
1.323832, -1.332305, 5.103686, 1, 0, 0, 1, 1,
1.339608, 1.615623, 0.3432605, 0, 0, 0, 1, 1,
1.346035, 0.2164703, 1.055373, 0, 0, 0, 1, 1,
1.353893, -0.6070641, 3.447223, 0, 0, 0, 1, 1,
1.354974, 0.002588343, 1.032796, 0, 0, 0, 1, 1,
1.362478, 1.620253, 0.454033, 0, 0, 0, 1, 1,
1.381653, -1.067351, 2.687727, 0, 0, 0, 1, 1,
1.391911, 0.7624186, 1.41506, 0, 0, 0, 1, 1,
1.410927, -2.016098, 2.44506, 1, 1, 1, 1, 1,
1.413437, -1.159666, 2.344764, 1, 1, 1, 1, 1,
1.419189, 0.4125427, 1.728118, 1, 1, 1, 1, 1,
1.421076, -0.3850268, 1.016282, 1, 1, 1, 1, 1,
1.422759, 1.015241, 2.194933, 1, 1, 1, 1, 1,
1.424791, 0.02043333, 2.109929, 1, 1, 1, 1, 1,
1.427996, -0.1166604, 0.8538027, 1, 1, 1, 1, 1,
1.431731, 0.4920643, 2.072232, 1, 1, 1, 1, 1,
1.435508, 0.06929417, -0.2340311, 1, 1, 1, 1, 1,
1.440665, 1.200062, 1.143093, 1, 1, 1, 1, 1,
1.441976, -0.1354651, 0.5621861, 1, 1, 1, 1, 1,
1.442234, 0.06756314, 2.350598, 1, 1, 1, 1, 1,
1.445006, 0.9466434, 1.287053, 1, 1, 1, 1, 1,
1.448873, -1.564916, 5.072268, 1, 1, 1, 1, 1,
1.451643, -0.3939677, 3.354178, 1, 1, 1, 1, 1,
1.453276, 0.5680817, 0.08069618, 0, 0, 1, 1, 1,
1.462342, -1.187407, 0.8347123, 1, 0, 0, 1, 1,
1.46376, 0.06589828, 0.07136531, 1, 0, 0, 1, 1,
1.467569, -0.4198875, 1.713593, 1, 0, 0, 1, 1,
1.481658, -0.1790699, 0.5945641, 1, 0, 0, 1, 1,
1.48595, -0.6406998, 3.322469, 1, 0, 0, 1, 1,
1.498419, -0.2434087, 1.444081, 0, 0, 0, 1, 1,
1.502209, 0.008687429, 2.253949, 0, 0, 0, 1, 1,
1.520633, 1.805965, 1.954378, 0, 0, 0, 1, 1,
1.530414, -0.9416248, 3.891581, 0, 0, 0, 1, 1,
1.545409, -1.315757, 1.420281, 0, 0, 0, 1, 1,
1.547783, -0.4301718, 2.728776, 0, 0, 0, 1, 1,
1.555527, 0.4175189, 0.3529272, 0, 0, 0, 1, 1,
1.557315, 0.4106784, 0.5146782, 1, 1, 1, 1, 1,
1.557453, -0.4606537, 1.263504, 1, 1, 1, 1, 1,
1.560761, 0.4172143, 3.044819, 1, 1, 1, 1, 1,
1.574914, 0.8784607, 2.565231, 1, 1, 1, 1, 1,
1.585876, 0.7517485, 0.3522019, 1, 1, 1, 1, 1,
1.587075, 0.1718972, -0.2218631, 1, 1, 1, 1, 1,
1.592468, 1.773687, 0.4244104, 1, 1, 1, 1, 1,
1.596505, -1.737503, 1.951934, 1, 1, 1, 1, 1,
1.599957, -1.048316, 3.04598, 1, 1, 1, 1, 1,
1.600798, -0.5225003, 1.155168, 1, 1, 1, 1, 1,
1.61228, -1.847461, 3.18621, 1, 1, 1, 1, 1,
1.613534, 0.4005401, 3.25309, 1, 1, 1, 1, 1,
1.615173, -0.2383154, 2.661005, 1, 1, 1, 1, 1,
1.621212, 2.684379, 0.8395306, 1, 1, 1, 1, 1,
1.624583, 0.7038428, 1.57522, 1, 1, 1, 1, 1,
1.629818, 0.3820963, 1.014914, 0, 0, 1, 1, 1,
1.630743, -0.753792, 4.13929, 1, 0, 0, 1, 1,
1.642419, -2.192597, 0.6150882, 1, 0, 0, 1, 1,
1.651267, -0.9786596, 2.253193, 1, 0, 0, 1, 1,
1.65223, 0.6326085, -0.05041803, 1, 0, 0, 1, 1,
1.672994, -0.2892085, 2.666516, 1, 0, 0, 1, 1,
1.695229, 0.479975, 0.5327802, 0, 0, 0, 1, 1,
1.6975, 0.06909168, 0.7856767, 0, 0, 0, 1, 1,
1.727117, -0.9463887, 0.3275686, 0, 0, 0, 1, 1,
1.738377, -0.5607374, 4.458365, 0, 0, 0, 1, 1,
1.741768, 0.0208556, 3.133825, 0, 0, 0, 1, 1,
1.751145, -0.06029244, 3.362061, 0, 0, 0, 1, 1,
1.756425, 1.652416, 0.2791207, 0, 0, 0, 1, 1,
1.768274, 1.062983, 2.097685, 1, 1, 1, 1, 1,
1.769536, -0.4087033, 3.004364, 1, 1, 1, 1, 1,
1.776795, 0.155729, 1.159036, 1, 1, 1, 1, 1,
1.781326, 1.086673, 0.8977013, 1, 1, 1, 1, 1,
1.840919, -0.2859718, 2.348178, 1, 1, 1, 1, 1,
1.848144, 0.500851, 1.644056, 1, 1, 1, 1, 1,
1.853272, -0.972606, 0.6089306, 1, 1, 1, 1, 1,
1.872935, 0.5027866, 1.275932, 1, 1, 1, 1, 1,
1.873009, 0.6625149, 0.4601825, 1, 1, 1, 1, 1,
1.874683, -0.7090402, 2.033395, 1, 1, 1, 1, 1,
1.897804, 0.3369901, 2.254197, 1, 1, 1, 1, 1,
1.91464, -0.9774065, 2.112629, 1, 1, 1, 1, 1,
1.917594, 0.9230642, 0.5615497, 1, 1, 1, 1, 1,
1.928354, 2.61336, -0.7145554, 1, 1, 1, 1, 1,
1.94294, -0.2367269, 1.293996, 1, 1, 1, 1, 1,
1.943736, 1.913686, 0.2289308, 0, 0, 1, 1, 1,
1.983724, -1.201164, 1.091146, 1, 0, 0, 1, 1,
2.026573, -1.484665, 2.791925, 1, 0, 0, 1, 1,
2.039838, -0.5552024, 3.070046, 1, 0, 0, 1, 1,
2.041822, -0.7480448, 3.836087, 1, 0, 0, 1, 1,
2.043846, 0.8968383, -0.5100287, 1, 0, 0, 1, 1,
2.076327, 0.4801871, 1.394079, 0, 0, 0, 1, 1,
2.092148, 0.5242337, 1.475147, 0, 0, 0, 1, 1,
2.09254, -1.526295, 1.728686, 0, 0, 0, 1, 1,
2.207147, 1.746029, 0.04890316, 0, 0, 0, 1, 1,
2.30286, 1.404579, 0.556007, 0, 0, 0, 1, 1,
2.359373, -0.8860282, 1.322512, 0, 0, 0, 1, 1,
2.365417, -0.06829035, -0.3534255, 0, 0, 0, 1, 1,
2.405629, 1.196737, 0.1956622, 1, 1, 1, 1, 1,
2.433931, 0.8506261, -0.5689308, 1, 1, 1, 1, 1,
2.466382, 0.3545925, 3.788194, 1, 1, 1, 1, 1,
2.769816, -0.0123568, 0.5417118, 1, 1, 1, 1, 1,
2.793149, -1.050636, 2.286895, 1, 1, 1, 1, 1,
3.067666, 0.8652347, 1.686591, 1, 1, 1, 1, 1,
3.100268, -1.213528, 2.173445, 1, 1, 1, 1, 1
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
var radius = 9.335455;
var distance = 32.79039;
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
mvMatrix.translate( -0.01952505, -0.1954013, -0.1105993 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.79039);
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
