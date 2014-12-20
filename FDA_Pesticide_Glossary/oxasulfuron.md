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
-2.801905, -0.5136986, -1.039166, 1, 0, 0, 1,
-2.582564, 1.288261, -0.9097994, 1, 0.007843138, 0, 1,
-2.522103, 1.224557, -1.409356, 1, 0.01176471, 0, 1,
-2.483724, 0.1893367, -1.511643, 1, 0.01960784, 0, 1,
-2.476965, -0.1068908, -1.974744, 1, 0.02352941, 0, 1,
-2.330576, -0.246951, -2.331932, 1, 0.03137255, 0, 1,
-2.233048, 0.846326, -1.01076, 1, 0.03529412, 0, 1,
-2.199999, -0.6453162, -1.834772, 1, 0.04313726, 0, 1,
-2.195006, -0.9968322, -0.9458299, 1, 0.04705882, 0, 1,
-2.170418, -0.07452419, -2.190044, 1, 0.05490196, 0, 1,
-2.157577, -1.12095, -0.5289688, 1, 0.05882353, 0, 1,
-2.128964, 0.003414756, -0.5091884, 1, 0.06666667, 0, 1,
-2.116788, -0.2725857, -0.5554544, 1, 0.07058824, 0, 1,
-2.10218, -0.7748049, -1.488645, 1, 0.07843138, 0, 1,
-2.094335, 2.075398, 0.3611266, 1, 0.08235294, 0, 1,
-2.082761, 0.1069906, -0.4827168, 1, 0.09019608, 0, 1,
-2.045729, -0.01141919, -1.664529, 1, 0.09411765, 0, 1,
-2.034701, -0.5429874, -2.012189, 1, 0.1019608, 0, 1,
-2.029366, -1.072345, -2.02119, 1, 0.1098039, 0, 1,
-2.022449, 0.171165, -0.8871722, 1, 0.1137255, 0, 1,
-1.991354, 0.2399035, -2.66701, 1, 0.1215686, 0, 1,
-1.971411, 0.6440958, -0.2891937, 1, 0.1254902, 0, 1,
-1.951518, -1.081179, -1.266985, 1, 0.1333333, 0, 1,
-1.927894, -1.629587, -1.296847, 1, 0.1372549, 0, 1,
-1.92137, -0.7500791, -1.554697, 1, 0.145098, 0, 1,
-1.920028, -1.52668, -0.8540146, 1, 0.1490196, 0, 1,
-1.892196, 0.3106233, -2.85701, 1, 0.1568628, 0, 1,
-1.888352, -2.044296, -2.441718, 1, 0.1607843, 0, 1,
-1.883581, -0.5336823, -2.132812, 1, 0.1686275, 0, 1,
-1.867601, 0.8113204, -0.02773647, 1, 0.172549, 0, 1,
-1.84921, -1.518574, -2.172156, 1, 0.1803922, 0, 1,
-1.837742, -1.106431, -2.416977, 1, 0.1843137, 0, 1,
-1.827689, 1.059319, -1.126743, 1, 0.1921569, 0, 1,
-1.815866, 0.6156223, -2.462436, 1, 0.1960784, 0, 1,
-1.800852, 1.08585, -0.902117, 1, 0.2039216, 0, 1,
-1.792696, 0.4281833, -1.161244, 1, 0.2117647, 0, 1,
-1.789494, -0.7133681, -1.696621, 1, 0.2156863, 0, 1,
-1.781737, -0.8670704, -3.755055, 1, 0.2235294, 0, 1,
-1.779965, 2.033056, -1.23926, 1, 0.227451, 0, 1,
-1.762805, 1.88696, -1.610767, 1, 0.2352941, 0, 1,
-1.754263, 0.965342, -0.710192, 1, 0.2392157, 0, 1,
-1.747462, -0.5208494, -2.102782, 1, 0.2470588, 0, 1,
-1.736921, 1.675398, 0.2752328, 1, 0.2509804, 0, 1,
-1.735764, 1.235057, -1.869751, 1, 0.2588235, 0, 1,
-1.724485, -0.8109658, -3.259479, 1, 0.2627451, 0, 1,
-1.709512, -0.3153234, -2.178185, 1, 0.2705882, 0, 1,
-1.70184, 1.172698, -1.991938, 1, 0.2745098, 0, 1,
-1.694729, 0.2555595, -2.442404, 1, 0.282353, 0, 1,
-1.675346, -1.184451, -4.931007, 1, 0.2862745, 0, 1,
-1.667274, 0.2174345, -1.18527, 1, 0.2941177, 0, 1,
-1.664183, -0.2216092, -0.9559009, 1, 0.3019608, 0, 1,
-1.659302, -0.1420721, -2.018405, 1, 0.3058824, 0, 1,
-1.646431, 0.2995796, -2.46313, 1, 0.3137255, 0, 1,
-1.634121, -0.1138238, -3.231925, 1, 0.3176471, 0, 1,
-1.613609, 0.3225659, -2.126286, 1, 0.3254902, 0, 1,
-1.607616, -0.5750115, -1.674796, 1, 0.3294118, 0, 1,
-1.588747, -0.9320241, -1.356212, 1, 0.3372549, 0, 1,
-1.560631, 0.9069926, -3.167722, 1, 0.3411765, 0, 1,
-1.560079, 1.636396, -0.9742234, 1, 0.3490196, 0, 1,
-1.55707, 0.6703297, -1.791337, 1, 0.3529412, 0, 1,
-1.547978, -0.3899819, -2.077724, 1, 0.3607843, 0, 1,
-1.543972, -0.9483578, -1.995746, 1, 0.3647059, 0, 1,
-1.525646, -0.231417, -0.8088549, 1, 0.372549, 0, 1,
-1.525337, -0.5697134, -2.45603, 1, 0.3764706, 0, 1,
-1.51119, -1.338266, -3.542215, 1, 0.3843137, 0, 1,
-1.509078, 1.818772, -1.522801, 1, 0.3882353, 0, 1,
-1.498575, 1.066815, -1.207546, 1, 0.3960784, 0, 1,
-1.495061, 2.761664, -1.180278, 1, 0.4039216, 0, 1,
-1.488907, 0.8723776, -1.66737, 1, 0.4078431, 0, 1,
-1.476909, 0.7108653, -1.828556, 1, 0.4156863, 0, 1,
-1.474154, -0.595745, -0.06132979, 1, 0.4196078, 0, 1,
-1.469322, -0.617985, -2.352731, 1, 0.427451, 0, 1,
-1.464037, 0.5113333, -1.039109, 1, 0.4313726, 0, 1,
-1.463467, -1.927288, -3.901569, 1, 0.4392157, 0, 1,
-1.459637, -0.6427304, -1.962601, 1, 0.4431373, 0, 1,
-1.426818, -0.03926315, -2.082771, 1, 0.4509804, 0, 1,
-1.425644, 0.6742201, -0.8745248, 1, 0.454902, 0, 1,
-1.416816, 0.2691917, -0.2732885, 1, 0.4627451, 0, 1,
-1.40359, -1.220711, -1.474359, 1, 0.4666667, 0, 1,
-1.394275, -0.3037326, -1.447745, 1, 0.4745098, 0, 1,
-1.392584, -0.06198262, -2.455619, 1, 0.4784314, 0, 1,
-1.390147, 0.3795392, -0.05420718, 1, 0.4862745, 0, 1,
-1.38004, -1.144566, -2.396534, 1, 0.4901961, 0, 1,
-1.37544, 0.3982511, 0.0925212, 1, 0.4980392, 0, 1,
-1.371988, 0.8086289, -0.6414357, 1, 0.5058824, 0, 1,
-1.362996, -3.866213, -2.859937, 1, 0.509804, 0, 1,
-1.359513, 0.4231753, -2.541614, 1, 0.5176471, 0, 1,
-1.358298, -1.161898, -3.031872, 1, 0.5215687, 0, 1,
-1.353544, -0.8250246, -2.554721, 1, 0.5294118, 0, 1,
-1.349519, -0.8372377, -0.8030647, 1, 0.5333334, 0, 1,
-1.348444, 0.650969, -2.094952, 1, 0.5411765, 0, 1,
-1.344354, -0.1368276, -1.751111, 1, 0.5450981, 0, 1,
-1.339909, -0.6440637, -2.822324, 1, 0.5529412, 0, 1,
-1.338951, -0.4028843, -1.577281, 1, 0.5568628, 0, 1,
-1.336746, 0.6379907, -0.4511993, 1, 0.5647059, 0, 1,
-1.332152, -2.654675, -1.766232, 1, 0.5686275, 0, 1,
-1.33188, 0.922819, -1.079149, 1, 0.5764706, 0, 1,
-1.329598, -0.03187399, 0.3580116, 1, 0.5803922, 0, 1,
-1.326384, -0.4349672, -1.772932, 1, 0.5882353, 0, 1,
-1.322969, 0.6365463, -1.5288, 1, 0.5921569, 0, 1,
-1.320925, -0.3004743, -1.19624, 1, 0.6, 0, 1,
-1.319975, -2.508243, -3.215619, 1, 0.6078432, 0, 1,
-1.316309, 1.251338, -0.2657222, 1, 0.6117647, 0, 1,
-1.303412, 0.09934027, 1.105773, 1, 0.6196079, 0, 1,
-1.287536, -1.643903, -3.956683, 1, 0.6235294, 0, 1,
-1.287192, -2.062252, -4.538788, 1, 0.6313726, 0, 1,
-1.286752, -0.532708, -2.675912, 1, 0.6352941, 0, 1,
-1.284845, 0.3770631, -2.230277, 1, 0.6431373, 0, 1,
-1.282884, -0.3168934, -1.769215, 1, 0.6470588, 0, 1,
-1.274443, -1.290611, -3.285249, 1, 0.654902, 0, 1,
-1.26412, 0.09917328, -3.051936, 1, 0.6588235, 0, 1,
-1.262481, 1.343448, -2.483857, 1, 0.6666667, 0, 1,
-1.253119, 1.128233, -1.141884, 1, 0.6705883, 0, 1,
-1.253005, -0.0131836, -0.8583513, 1, 0.6784314, 0, 1,
-1.246898, 0.1810541, -0.0783123, 1, 0.682353, 0, 1,
-1.240888, -1.654768, -2.47492, 1, 0.6901961, 0, 1,
-1.227887, -0.8160108, -1.77421, 1, 0.6941177, 0, 1,
-1.226323, -0.9919859, -3.259968, 1, 0.7019608, 0, 1,
-1.222692, 0.7684692, 0.1993227, 1, 0.7098039, 0, 1,
-1.208259, -0.6873769, -3.871699, 1, 0.7137255, 0, 1,
-1.202626, 1.563382, -0.07939693, 1, 0.7215686, 0, 1,
-1.187006, -0.6831992, -1.740423, 1, 0.7254902, 0, 1,
-1.181018, 0.394038, -2.048887, 1, 0.7333333, 0, 1,
-1.166727, -0.9513088, -2.37144, 1, 0.7372549, 0, 1,
-1.153042, -1.160359, -0.9514695, 1, 0.7450981, 0, 1,
-1.147949, -2.228664, -1.780919, 1, 0.7490196, 0, 1,
-1.141547, -0.1390702, -0.3742311, 1, 0.7568628, 0, 1,
-1.140552, 1.002749, -0.7269443, 1, 0.7607843, 0, 1,
-1.136652, -1.438926, -3.730883, 1, 0.7686275, 0, 1,
-1.131819, 0.07216109, -1.022221, 1, 0.772549, 0, 1,
-1.125629, 0.002308374, -0.9887993, 1, 0.7803922, 0, 1,
-1.121029, 0.1552342, -0.209888, 1, 0.7843137, 0, 1,
-1.120652, 0.4048551, -2.383516, 1, 0.7921569, 0, 1,
-1.11851, 1.870056, -0.1726835, 1, 0.7960784, 0, 1,
-1.111921, 2.014077, 0.2795292, 1, 0.8039216, 0, 1,
-1.108055, -1.298164, -3.033335, 1, 0.8117647, 0, 1,
-1.103694, 0.9903797, -0.5939324, 1, 0.8156863, 0, 1,
-1.090205, 0.2156187, 0.09285522, 1, 0.8235294, 0, 1,
-1.085264, 0.4779899, -1.796246, 1, 0.827451, 0, 1,
-1.071691, 0.2892511, -1.414788, 1, 0.8352941, 0, 1,
-1.068456, -0.6079041, -1.885846, 1, 0.8392157, 0, 1,
-1.068181, -1.630997, -2.674494, 1, 0.8470588, 0, 1,
-1.067809, -0.4973809, -1.567024, 1, 0.8509804, 0, 1,
-1.06617, 0.1727259, -1.664081, 1, 0.8588235, 0, 1,
-1.043396, -1.732236, -0.1738588, 1, 0.8627451, 0, 1,
-1.042143, 0.2096432, -0.2269047, 1, 0.8705882, 0, 1,
-1.033486, -1.466816, -2.603559, 1, 0.8745098, 0, 1,
-1.029665, -0.7745228, -1.593218, 1, 0.8823529, 0, 1,
-1.026569, -0.387052, -3.340078, 1, 0.8862745, 0, 1,
-1.013825, 0.400708, -2.442313, 1, 0.8941177, 0, 1,
-1.01274, 0.08119637, -0.9597178, 1, 0.8980392, 0, 1,
-1.012043, -0.3900838, -2.720495, 1, 0.9058824, 0, 1,
-1.010571, -1.543571, -2.549149, 1, 0.9137255, 0, 1,
-1.009891, 1.1727, -1.477772, 1, 0.9176471, 0, 1,
-0.999981, 0.3746679, -0.7320434, 1, 0.9254902, 0, 1,
-0.9983703, 1.211094, -1.915976, 1, 0.9294118, 0, 1,
-0.9982167, -1.472261, -1.017281, 1, 0.9372549, 0, 1,
-0.9959082, 0.8920062, 0.1160672, 1, 0.9411765, 0, 1,
-0.9949844, 0.9302716, 0.1772833, 1, 0.9490196, 0, 1,
-0.9819248, -0.3559534, -1.410211, 1, 0.9529412, 0, 1,
-0.977681, -1.592371, -3.400567, 1, 0.9607843, 0, 1,
-0.9693216, 0.07470359, -1.281014, 1, 0.9647059, 0, 1,
-0.9690608, 2.131736, -1.889821, 1, 0.972549, 0, 1,
-0.96775, 0.8130019, -0.02770436, 1, 0.9764706, 0, 1,
-0.9660932, -0.2772848, -1.554474, 1, 0.9843137, 0, 1,
-0.9652097, 0.2415318, -1.31574, 1, 0.9882353, 0, 1,
-0.9634931, 0.7787557, -0.5934482, 1, 0.9960784, 0, 1,
-0.9618387, -0.6466917, -2.177008, 0.9960784, 1, 0, 1,
-0.9585015, 1.242234, 0.2978449, 0.9921569, 1, 0, 1,
-0.9549396, -0.9395564, -1.493731, 0.9843137, 1, 0, 1,
-0.9547917, 0.3471026, -0.4582221, 0.9803922, 1, 0, 1,
-0.9506804, 0.4268337, -2.631611, 0.972549, 1, 0, 1,
-0.9479423, 1.216666, -1.060827, 0.9686275, 1, 0, 1,
-0.9352184, 0.5531737, -0.3073615, 0.9607843, 1, 0, 1,
-0.933647, 0.3963476, -1.49082, 0.9568627, 1, 0, 1,
-0.9304439, 0.6173451, -2.431923, 0.9490196, 1, 0, 1,
-0.9271542, 0.08719249, -1.793538, 0.945098, 1, 0, 1,
-0.9267783, -0.4305709, -2.537241, 0.9372549, 1, 0, 1,
-0.9265014, 1.158564, -1.030015, 0.9333333, 1, 0, 1,
-0.9227506, -0.4738836, -1.110265, 0.9254902, 1, 0, 1,
-0.9214453, -1.13199, -2.354283, 0.9215686, 1, 0, 1,
-0.917553, 1.094435, 0.5344786, 0.9137255, 1, 0, 1,
-0.9165506, -0.08188459, -1.089156, 0.9098039, 1, 0, 1,
-0.9144779, 0.1061476, -1.696172, 0.9019608, 1, 0, 1,
-0.9063635, 0.306788, -0.6969917, 0.8941177, 1, 0, 1,
-0.8996221, -0.1181158, -1.456106, 0.8901961, 1, 0, 1,
-0.8969358, 1.692795, -0.8990526, 0.8823529, 1, 0, 1,
-0.8943677, -0.625556, -3.570027, 0.8784314, 1, 0, 1,
-0.8927462, -1.152699, -4.774886, 0.8705882, 1, 0, 1,
-0.8871772, 0.03786047, -2.351647, 0.8666667, 1, 0, 1,
-0.8860532, -1.433362, -2.154709, 0.8588235, 1, 0, 1,
-0.8777202, -0.2191587, -2.18613, 0.854902, 1, 0, 1,
-0.8717769, 0.3584729, 0.01255294, 0.8470588, 1, 0, 1,
-0.8709915, -0.05117591, -2.477946, 0.8431373, 1, 0, 1,
-0.867559, 1.494725, -1.418927, 0.8352941, 1, 0, 1,
-0.8647111, 1.702689, -1.222245, 0.8313726, 1, 0, 1,
-0.8636796, 0.3343091, -1.12546, 0.8235294, 1, 0, 1,
-0.8621935, 1.867786, 1.680848, 0.8196079, 1, 0, 1,
-0.8608921, 0.1287598, -0.8363053, 0.8117647, 1, 0, 1,
-0.8597289, -1.564535, -1.778167, 0.8078431, 1, 0, 1,
-0.8592396, -1.364037, -2.227585, 0.8, 1, 0, 1,
-0.8567407, -1.657476, -1.965691, 0.7921569, 1, 0, 1,
-0.8530976, 0.5878202, -2.096027, 0.7882353, 1, 0, 1,
-0.8527117, -1.335946, -2.409781, 0.7803922, 1, 0, 1,
-0.8468608, 1.083905, -1.117888, 0.7764706, 1, 0, 1,
-0.8456708, -0.1445173, -2.363592, 0.7686275, 1, 0, 1,
-0.8435095, -0.03110505, -1.084401, 0.7647059, 1, 0, 1,
-0.8421241, 0.1384137, -0.748677, 0.7568628, 1, 0, 1,
-0.841861, -0.4000858, -3.556773, 0.7529412, 1, 0, 1,
-0.8387399, 0.901604, -0.1827149, 0.7450981, 1, 0, 1,
-0.8368441, -0.813023, -2.153107, 0.7411765, 1, 0, 1,
-0.8367884, -0.6461661, -3.023387, 0.7333333, 1, 0, 1,
-0.835279, -0.9852111, -5.245249, 0.7294118, 1, 0, 1,
-0.8293523, -1.220759, -3.02989, 0.7215686, 1, 0, 1,
-0.8042498, 0.02427146, -0.5918813, 0.7176471, 1, 0, 1,
-0.7960166, 0.3934962, -0.8925048, 0.7098039, 1, 0, 1,
-0.7912268, 1.399737, -1.648419, 0.7058824, 1, 0, 1,
-0.7900273, -1.999607, -2.240211, 0.6980392, 1, 0, 1,
-0.7828613, -1.452795, -3.075255, 0.6901961, 1, 0, 1,
-0.7825481, -1.19999, -2.857871, 0.6862745, 1, 0, 1,
-0.7791256, 1.589764, -0.5760839, 0.6784314, 1, 0, 1,
-0.7775913, -0.04765372, -1.565472, 0.6745098, 1, 0, 1,
-0.777482, -0.5445443, -0.8918118, 0.6666667, 1, 0, 1,
-0.7703664, -0.7524374, -2.525325, 0.6627451, 1, 0, 1,
-0.7647515, 0.5363725, -1.412803, 0.654902, 1, 0, 1,
-0.7637992, -1.168829, -1.634121, 0.6509804, 1, 0, 1,
-0.7600498, 0.1418238, -2.062019, 0.6431373, 1, 0, 1,
-0.7585726, -1.235286, -0.01114212, 0.6392157, 1, 0, 1,
-0.7567652, 1.324765, -1.869684, 0.6313726, 1, 0, 1,
-0.7564915, -1.504656, -3.725314, 0.627451, 1, 0, 1,
-0.7563215, -0.1552588, -1.88917, 0.6196079, 1, 0, 1,
-0.7559351, -2.314389, -2.886254, 0.6156863, 1, 0, 1,
-0.7512216, 0.2264145, -2.040818, 0.6078432, 1, 0, 1,
-0.7501089, 1.053413, -1.436204, 0.6039216, 1, 0, 1,
-0.7489018, -2.040229, -2.579403, 0.5960785, 1, 0, 1,
-0.743924, 1.035904, 0.2132301, 0.5882353, 1, 0, 1,
-0.7431793, 1.260919, -1.545028, 0.5843138, 1, 0, 1,
-0.7418656, -0.5878677, -2.234904, 0.5764706, 1, 0, 1,
-0.7416543, 0.8201705, -1.550556, 0.572549, 1, 0, 1,
-0.7414507, -0.9626852, -2.870526, 0.5647059, 1, 0, 1,
-0.7388115, -0.04412883, -1.350905, 0.5607843, 1, 0, 1,
-0.7310698, -0.9132989, -1.740965, 0.5529412, 1, 0, 1,
-0.7289668, 0.8946861, -1.270211, 0.5490196, 1, 0, 1,
-0.7182021, 1.143226, -1.658773, 0.5411765, 1, 0, 1,
-0.7178442, 0.6017764, -0.7725973, 0.5372549, 1, 0, 1,
-0.7143322, -0.02744511, -1.170816, 0.5294118, 1, 0, 1,
-0.713695, -0.7745516, -1.597187, 0.5254902, 1, 0, 1,
-0.7126323, -0.1577878, -2.001499, 0.5176471, 1, 0, 1,
-0.7114565, -0.4799935, -2.341655, 0.5137255, 1, 0, 1,
-0.7046108, -1.163899, -1.849541, 0.5058824, 1, 0, 1,
-0.6955173, 1.985029, -0.3371783, 0.5019608, 1, 0, 1,
-0.6950209, 0.1533288, -2.954357, 0.4941176, 1, 0, 1,
-0.6940203, 0.4396797, 0.2073143, 0.4862745, 1, 0, 1,
-0.6936202, 0.04539706, -1.813391, 0.4823529, 1, 0, 1,
-0.6916403, 1.118643, -1.572459, 0.4745098, 1, 0, 1,
-0.6876072, -1.63334, -4.886124, 0.4705882, 1, 0, 1,
-0.6864963, -0.1792438, -0.9137124, 0.4627451, 1, 0, 1,
-0.6861848, 0.8592244, -0.5988063, 0.4588235, 1, 0, 1,
-0.6846877, -0.1154811, -1.31723, 0.4509804, 1, 0, 1,
-0.6832377, 0.169966, -1.101192, 0.4470588, 1, 0, 1,
-0.679979, -0.9262052, -0.8295894, 0.4392157, 1, 0, 1,
-0.6779377, -3.062645, -3.266255, 0.4352941, 1, 0, 1,
-0.6758762, 0.4176797, -2.045768, 0.427451, 1, 0, 1,
-0.6705341, 0.1182705, -0.6173502, 0.4235294, 1, 0, 1,
-0.6644278, -0.78653, -2.216642, 0.4156863, 1, 0, 1,
-0.6582687, 0.2574949, -2.868376, 0.4117647, 1, 0, 1,
-0.6536088, -0.9449042, -3.910484, 0.4039216, 1, 0, 1,
-0.6533664, -0.5080651, -1.066569, 0.3960784, 1, 0, 1,
-0.6515256, 0.3818271, -1.115278, 0.3921569, 1, 0, 1,
-0.6427406, 1.011697, 0.7884324, 0.3843137, 1, 0, 1,
-0.6426816, 0.1468047, -1.068407, 0.3803922, 1, 0, 1,
-0.6423515, 0.9533014, 1.752018, 0.372549, 1, 0, 1,
-0.635333, -0.7519969, -2.335974, 0.3686275, 1, 0, 1,
-0.6334648, 0.342898, -1.290221, 0.3607843, 1, 0, 1,
-0.6331393, -1.024439, -2.49879, 0.3568628, 1, 0, 1,
-0.6239167, 0.07194193, -2.688497, 0.3490196, 1, 0, 1,
-0.6204655, -0.4795542, -2.731156, 0.345098, 1, 0, 1,
-0.6157937, -0.6429447, -2.156513, 0.3372549, 1, 0, 1,
-0.614455, -0.1831826, -3.547629, 0.3333333, 1, 0, 1,
-0.6108427, -0.08430224, -1.252241, 0.3254902, 1, 0, 1,
-0.6091508, 0.7973518, -0.9827111, 0.3215686, 1, 0, 1,
-0.6076386, 0.538381, 0.6765063, 0.3137255, 1, 0, 1,
-0.6025386, -0.0496287, -1.146787, 0.3098039, 1, 0, 1,
-0.5985729, -1.137346, -2.494621, 0.3019608, 1, 0, 1,
-0.5980074, 1.08374, -1.686327, 0.2941177, 1, 0, 1,
-0.5971166, 1.18769, -0.2584446, 0.2901961, 1, 0, 1,
-0.5968344, 0.1905157, -0.8412587, 0.282353, 1, 0, 1,
-0.5966004, -0.03816017, -2.220942, 0.2784314, 1, 0, 1,
-0.5931832, 1.444669, -0.03388543, 0.2705882, 1, 0, 1,
-0.5854736, 0.02403277, -1.591451, 0.2666667, 1, 0, 1,
-0.5805272, 0.2953446, -2.959863, 0.2588235, 1, 0, 1,
-0.5788742, 1.624033, -0.7057286, 0.254902, 1, 0, 1,
-0.5778971, 1.243039, 0.2214199, 0.2470588, 1, 0, 1,
-0.5765127, -0.6062001, -2.201539, 0.2431373, 1, 0, 1,
-0.5691349, 1.02221, -0.8772351, 0.2352941, 1, 0, 1,
-0.5674327, 1.54861, -0.1601568, 0.2313726, 1, 0, 1,
-0.5638745, -0.6081099, -1.596872, 0.2235294, 1, 0, 1,
-0.5610715, -0.5627306, -3.637279, 0.2196078, 1, 0, 1,
-0.5607442, -1.034617, -1.733973, 0.2117647, 1, 0, 1,
-0.5601175, -2.095483, -2.227415, 0.2078431, 1, 0, 1,
-0.5579818, 0.4742287, -0.4196858, 0.2, 1, 0, 1,
-0.5526268, 1.286909, -0.6798455, 0.1921569, 1, 0, 1,
-0.5465677, -0.5208356, -0.5619404, 0.1882353, 1, 0, 1,
-0.5431354, -0.333456, -0.2131611, 0.1803922, 1, 0, 1,
-0.5417755, 1.72587, -0.5196596, 0.1764706, 1, 0, 1,
-0.5391325, 0.7156237, -1.314993, 0.1686275, 1, 0, 1,
-0.5334826, 0.1993295, -0.2000798, 0.1647059, 1, 0, 1,
-0.5302979, -2.143345, -3.48554, 0.1568628, 1, 0, 1,
-0.5284111, -2.004822, -3.827209, 0.1529412, 1, 0, 1,
-0.5280139, -0.9915829, -3.146636, 0.145098, 1, 0, 1,
-0.5156477, 0.04452197, -1.04629, 0.1411765, 1, 0, 1,
-0.5084525, -0.2241305, -0.7998918, 0.1333333, 1, 0, 1,
-0.5079562, 0.2737393, -0.553256, 0.1294118, 1, 0, 1,
-0.5073913, 0.4406395, 0.0565761, 0.1215686, 1, 0, 1,
-0.5067027, -1.185961, -2.485588, 0.1176471, 1, 0, 1,
-0.504559, -1.221618, -3.73463, 0.1098039, 1, 0, 1,
-0.49327, -0.3514417, -1.67575, 0.1058824, 1, 0, 1,
-0.4925525, 0.9535421, -1.527436, 0.09803922, 1, 0, 1,
-0.4922854, 0.6377982, 1.160157, 0.09019608, 1, 0, 1,
-0.4849417, -0.1820504, -0.07099804, 0.08627451, 1, 0, 1,
-0.4783327, -0.7830122, -3.144161, 0.07843138, 1, 0, 1,
-0.4779533, -0.3673342, -2.556786, 0.07450981, 1, 0, 1,
-0.4745312, -1.309473, -0.8593218, 0.06666667, 1, 0, 1,
-0.4724391, 0.7296144, -1.421078, 0.0627451, 1, 0, 1,
-0.4693485, 1.051079, 0.3219385, 0.05490196, 1, 0, 1,
-0.4646164, -0.949156, -1.515612, 0.05098039, 1, 0, 1,
-0.4642897, -0.09861489, -2.464553, 0.04313726, 1, 0, 1,
-0.461903, -0.0173251, -0.600354, 0.03921569, 1, 0, 1,
-0.4607482, -0.3712384, -2.60704, 0.03137255, 1, 0, 1,
-0.4584028, 0.3845666, 1.708383, 0.02745098, 1, 0, 1,
-0.4579329, -1.296702, -2.210331, 0.01960784, 1, 0, 1,
-0.4560228, 0.4683709, -0.2252732, 0.01568628, 1, 0, 1,
-0.4549712, -0.916813, -3.545443, 0.007843138, 1, 0, 1,
-0.4519063, 0.4308633, -0.445271, 0.003921569, 1, 0, 1,
-0.4474575, -0.06356816, -2.163011, 0, 1, 0.003921569, 1,
-0.447394, 2.042076, -0.4550347, 0, 1, 0.01176471, 1,
-0.4426259, -0.2023731, -2.738682, 0, 1, 0.01568628, 1,
-0.441876, 0.828789, 0.03425986, 0, 1, 0.02352941, 1,
-0.440349, -0.7644274, -2.845561, 0, 1, 0.02745098, 1,
-0.4389748, 0.9189821, -2.288658, 0, 1, 0.03529412, 1,
-0.436366, 0.4169217, -0.4512245, 0, 1, 0.03921569, 1,
-0.4357411, 0.3950979, -0.3113777, 0, 1, 0.04705882, 1,
-0.4340345, -2.421278, -3.588999, 0, 1, 0.05098039, 1,
-0.4314188, -1.432172, -0.7858989, 0, 1, 0.05882353, 1,
-0.4297688, 0.02840254, -2.214706, 0, 1, 0.0627451, 1,
-0.4266095, -0.565044, -2.601525, 0, 1, 0.07058824, 1,
-0.4250646, -0.3882385, -2.572407, 0, 1, 0.07450981, 1,
-0.4250285, 0.0300512, -1.817998, 0, 1, 0.08235294, 1,
-0.4245127, 1.083173, 0.2083131, 0, 1, 0.08627451, 1,
-0.4239126, -0.3938937, -2.333011, 0, 1, 0.09411765, 1,
-0.4197543, 0.3908934, -2.140431, 0, 1, 0.1019608, 1,
-0.4173992, -0.07751008, -1.390425, 0, 1, 0.1058824, 1,
-0.417006, -1.521998, -3.788144, 0, 1, 0.1137255, 1,
-0.4157379, -0.5589376, -3.549592, 0, 1, 0.1176471, 1,
-0.4138753, 0.6095986, -1.05268, 0, 1, 0.1254902, 1,
-0.4079051, -0.2661994, -1.87511, 0, 1, 0.1294118, 1,
-0.4053825, -0.5453686, -0.5241291, 0, 1, 0.1372549, 1,
-0.4053603, 0.04565017, -1.150519, 0, 1, 0.1411765, 1,
-0.4047695, -0.6148307, -3.875304, 0, 1, 0.1490196, 1,
-0.4045598, -0.7723148, -2.118176, 0, 1, 0.1529412, 1,
-0.4036811, -0.7741927, -2.255709, 0, 1, 0.1607843, 1,
-0.4034306, -0.7785457, -2.506657, 0, 1, 0.1647059, 1,
-0.394467, 0.5887657, 0.02729984, 0, 1, 0.172549, 1,
-0.3916714, -0.2861693, -3.699098, 0, 1, 0.1764706, 1,
-0.3872219, 1.280746, -0.5813473, 0, 1, 0.1843137, 1,
-0.3858713, 0.2616642, -0.6814276, 0, 1, 0.1882353, 1,
-0.3803964, -0.1025086, -0.1796067, 0, 1, 0.1960784, 1,
-0.3778732, -0.1413263, -3.673766, 0, 1, 0.2039216, 1,
-0.3705737, -0.1344014, -2.189327, 0, 1, 0.2078431, 1,
-0.369165, -0.2423696, -1.423035, 0, 1, 0.2156863, 1,
-0.3682011, 0.7969568, 0.03145754, 0, 1, 0.2196078, 1,
-0.3667594, -2.704278, -3.215717, 0, 1, 0.227451, 1,
-0.3666261, 0.8810263, 1.410834, 0, 1, 0.2313726, 1,
-0.3659387, -0.02948081, -1.601215, 0, 1, 0.2392157, 1,
-0.3654489, -0.8873489, -3.129295, 0, 1, 0.2431373, 1,
-0.3624925, 0.3542995, -0.3207678, 0, 1, 0.2509804, 1,
-0.3607369, 1.244442, -0.5040166, 0, 1, 0.254902, 1,
-0.3578303, 0.4475656, -1.212257, 0, 1, 0.2627451, 1,
-0.3560318, -0.09311408, -0.3704998, 0, 1, 0.2666667, 1,
-0.3553827, 0.07064868, -1.252602, 0, 1, 0.2745098, 1,
-0.3482691, -0.9369848, -4.074762, 0, 1, 0.2784314, 1,
-0.34709, 1.335323, 0.9064025, 0, 1, 0.2862745, 1,
-0.3399459, 0.8608243, -0.1596358, 0, 1, 0.2901961, 1,
-0.3316357, 0.6546673, -2.772921, 0, 1, 0.2980392, 1,
-0.3306605, 0.2177263, -0.4788284, 0, 1, 0.3058824, 1,
-0.3300053, 0.7101082, 1.120545, 0, 1, 0.3098039, 1,
-0.328647, -1.266266, -1.672262, 0, 1, 0.3176471, 1,
-0.3274561, -0.1840514, -2.272804, 0, 1, 0.3215686, 1,
-0.3265391, -0.8912608, 0.01395099, 0, 1, 0.3294118, 1,
-0.3264245, 0.6964375, -0.5310498, 0, 1, 0.3333333, 1,
-0.3241902, -0.5771952, -3.699891, 0, 1, 0.3411765, 1,
-0.3239321, 0.3731901, -0.6299939, 0, 1, 0.345098, 1,
-0.3167314, 0.4305445, 0.7553135, 0, 1, 0.3529412, 1,
-0.3144531, -0.07419594, 0.7011141, 0, 1, 0.3568628, 1,
-0.3107438, -0.2440554, -1.542241, 0, 1, 0.3647059, 1,
-0.3071258, -1.652072, -3.234127, 0, 1, 0.3686275, 1,
-0.3059077, 2.910279, -1.783504, 0, 1, 0.3764706, 1,
-0.2948165, 0.2461822, 1.150744, 0, 1, 0.3803922, 1,
-0.2908506, -1.461975, -1.884311, 0, 1, 0.3882353, 1,
-0.2896845, 1.000176, -0.9603797, 0, 1, 0.3921569, 1,
-0.288695, -1.357575, -3.184516, 0, 1, 0.4, 1,
-0.2882857, -0.7543213, -2.16905, 0, 1, 0.4078431, 1,
-0.2875793, -0.8826534, -2.379149, 0, 1, 0.4117647, 1,
-0.2866696, 1.768671, 1.276425, 0, 1, 0.4196078, 1,
-0.281527, 0.2727738, 0.5912357, 0, 1, 0.4235294, 1,
-0.2804983, -0.2167723, -3.064955, 0, 1, 0.4313726, 1,
-0.2791678, -0.09002686, -1.766874, 0, 1, 0.4352941, 1,
-0.2728671, -0.3737939, -2.116772, 0, 1, 0.4431373, 1,
-0.2717885, 0.5918907, 1.301024, 0, 1, 0.4470588, 1,
-0.263256, -0.449498, -0.7341473, 0, 1, 0.454902, 1,
-0.263162, 0.5497169, 0.5938229, 0, 1, 0.4588235, 1,
-0.263002, 1.830771, 0.4633626, 0, 1, 0.4666667, 1,
-0.257777, -0.5972687, -2.661865, 0, 1, 0.4705882, 1,
-0.2553828, 0.3759522, -1.65637, 0, 1, 0.4784314, 1,
-0.2552944, -2.614664, -3.822599, 0, 1, 0.4823529, 1,
-0.2541288, -1.422944, -5.095712, 0, 1, 0.4901961, 1,
-0.2538007, 0.1525691, -1.007354, 0, 1, 0.4941176, 1,
-0.2530688, 0.605763, -0.9086876, 0, 1, 0.5019608, 1,
-0.2527572, 0.8058868, -0.190302, 0, 1, 0.509804, 1,
-0.2517362, 1.259382, 0.6789473, 0, 1, 0.5137255, 1,
-0.2504482, -0.7658813, -3.902181, 0, 1, 0.5215687, 1,
-0.249534, -0.3181059, -4.721906, 0, 1, 0.5254902, 1,
-0.2441578, -3.833691, -4.060811, 0, 1, 0.5333334, 1,
-0.2434631, 2.384668, 0.9729189, 0, 1, 0.5372549, 1,
-0.2433981, 1.594019, 0.257134, 0, 1, 0.5450981, 1,
-0.2389088, 2.52618, -0.5229748, 0, 1, 0.5490196, 1,
-0.2370651, -0.1963528, -1.139198, 0, 1, 0.5568628, 1,
-0.2318947, 0.6608804, -1.48353, 0, 1, 0.5607843, 1,
-0.2317565, -0.6625395, -2.146825, 0, 1, 0.5686275, 1,
-0.2278551, -1.297725, -2.388971, 0, 1, 0.572549, 1,
-0.2239743, -0.3375042, -3.516193, 0, 1, 0.5803922, 1,
-0.2231115, -1.166182, -3.210158, 0, 1, 0.5843138, 1,
-0.2175858, 0.4340558, -1.412531, 0, 1, 0.5921569, 1,
-0.2172906, 0.08941245, -3.512772, 0, 1, 0.5960785, 1,
-0.2166137, 1.183778, -2.268844, 0, 1, 0.6039216, 1,
-0.2092798, 0.2127306, -0.4443948, 0, 1, 0.6117647, 1,
-0.2033162, -0.4021024, -1.842165, 0, 1, 0.6156863, 1,
-0.1941694, -0.3740578, -2.167794, 0, 1, 0.6235294, 1,
-0.1931394, -0.8584387, -3.457655, 0, 1, 0.627451, 1,
-0.1925277, -0.9581654, -5.060619, 0, 1, 0.6352941, 1,
-0.1920668, -0.1298649, -2.555147, 0, 1, 0.6392157, 1,
-0.1794465, -0.862038, -4.6027, 0, 1, 0.6470588, 1,
-0.1783787, -1.772935, -2.865648, 0, 1, 0.6509804, 1,
-0.1751245, -0.08735471, -1.646396, 0, 1, 0.6588235, 1,
-0.1731093, 0.528649, 1.508227, 0, 1, 0.6627451, 1,
-0.1671697, 0.5293628, -0.2151708, 0, 1, 0.6705883, 1,
-0.1586199, 0.08658686, -2.755038, 0, 1, 0.6745098, 1,
-0.158318, 0.03856226, -1.416101, 0, 1, 0.682353, 1,
-0.1559773, -0.3033324, -2.619678, 0, 1, 0.6862745, 1,
-0.1543638, -0.4223729, -1.619857, 0, 1, 0.6941177, 1,
-0.1516535, 0.123599, -0.7082064, 0, 1, 0.7019608, 1,
-0.1487544, 0.8774903, 0.3659943, 0, 1, 0.7058824, 1,
-0.143267, 0.2098246, -2.9327, 0, 1, 0.7137255, 1,
-0.1407604, -0.4184134, -3.900205, 0, 1, 0.7176471, 1,
-0.140365, 0.04210941, -1.76202, 0, 1, 0.7254902, 1,
-0.1307057, -1.417878, -3.119373, 0, 1, 0.7294118, 1,
-0.1297742, -0.3441515, -2.269652, 0, 1, 0.7372549, 1,
-0.1268453, -0.8775194, -2.628656, 0, 1, 0.7411765, 1,
-0.1254482, 1.215864, -0.4910285, 0, 1, 0.7490196, 1,
-0.1253823, -0.4693655, -2.670533, 0, 1, 0.7529412, 1,
-0.1210312, 0.05219217, -0.167981, 0, 1, 0.7607843, 1,
-0.1186571, -0.2416378, -1.216207, 0, 1, 0.7647059, 1,
-0.1184286, -0.7804118, -4.517951, 0, 1, 0.772549, 1,
-0.1095572, 0.169593, -1.475762, 0, 1, 0.7764706, 1,
-0.109095, -0.1511999, -1.287167, 0, 1, 0.7843137, 1,
-0.1088444, 0.06671193, -0.7909738, 0, 1, 0.7882353, 1,
-0.1081245, -1.255929, -3.550683, 0, 1, 0.7960784, 1,
-0.1042815, 0.2704853, -2.228628, 0, 1, 0.8039216, 1,
-0.1032495, 0.08642634, 0.852583, 0, 1, 0.8078431, 1,
-0.1027381, -0.9108384, -2.008027, 0, 1, 0.8156863, 1,
-0.1017577, -0.9444177, -2.097366, 0, 1, 0.8196079, 1,
-0.1010819, 0.3208354, -0.07396778, 0, 1, 0.827451, 1,
-0.09765773, -0.1892988, -2.793181, 0, 1, 0.8313726, 1,
-0.09307841, 1.008911, 0.7019113, 0, 1, 0.8392157, 1,
-0.09303663, -0.59804, -2.282967, 0, 1, 0.8431373, 1,
-0.09080163, 0.1801264, -2.104519, 0, 1, 0.8509804, 1,
-0.09037638, 0.7606261, 2.547882, 0, 1, 0.854902, 1,
-0.08600925, 0.920288, 1.274235, 0, 1, 0.8627451, 1,
-0.08551021, -0.09859671, -1.374995, 0, 1, 0.8666667, 1,
-0.0818164, -0.7308474, -2.806854, 0, 1, 0.8745098, 1,
-0.07925034, -0.1401824, -1.615425, 0, 1, 0.8784314, 1,
-0.07840174, -0.08974856, -1.774575, 0, 1, 0.8862745, 1,
-0.07799668, -0.2262733, -3.533072, 0, 1, 0.8901961, 1,
-0.07672311, 0.02529818, -0.8167362, 0, 1, 0.8980392, 1,
-0.07270334, 0.9431584, -0.5526869, 0, 1, 0.9058824, 1,
-0.07134458, 1.098546, 1.362752, 0, 1, 0.9098039, 1,
-0.070247, -0.2258089, -3.269551, 0, 1, 0.9176471, 1,
-0.06933898, 1.587562, 0.01246376, 0, 1, 0.9215686, 1,
-0.06755551, -0.9652616, -2.836106, 0, 1, 0.9294118, 1,
-0.06652143, 1.961977, 0.5018669, 0, 1, 0.9333333, 1,
-0.06510302, -0.1282741, -4.992521, 0, 1, 0.9411765, 1,
-0.06504456, -0.7928922, -2.848363, 0, 1, 0.945098, 1,
-0.06053782, -0.2192961, -4.453808, 0, 1, 0.9529412, 1,
-0.05668862, 0.9349052, 0.4094262, 0, 1, 0.9568627, 1,
-0.05131116, -1.222374, -3.95318, 0, 1, 0.9647059, 1,
-0.0506219, -0.1097587, -0.7793533, 0, 1, 0.9686275, 1,
-0.04919292, -0.4480585, -1.728014, 0, 1, 0.9764706, 1,
-0.04708711, 0.9628137, 1.212296, 0, 1, 0.9803922, 1,
-0.04471565, -0.1864185, -1.78151, 0, 1, 0.9882353, 1,
-0.04185992, 0.09847122, 0.2277806, 0, 1, 0.9921569, 1,
-0.04174965, -0.459236, -2.969512, 0, 1, 1, 1,
-0.03893724, 0.3255511, 0.2276006, 0, 0.9921569, 1, 1,
-0.03333328, -0.9638201, -3.191102, 0, 0.9882353, 1, 1,
-0.03194129, 1.651792, 1.102701, 0, 0.9803922, 1, 1,
-0.03057099, -0.07930706, 0.2957429, 0, 0.9764706, 1, 1,
-0.03022418, 0.3581496, 1.499761, 0, 0.9686275, 1, 1,
-0.02875636, 1.829108, 1.12694, 0, 0.9647059, 1, 1,
-0.02829515, 1.090649, -0.1463941, 0, 0.9568627, 1, 1,
-0.02800127, 0.1958132, -1.171101, 0, 0.9529412, 1, 1,
-0.02610596, -0.4765306, -2.196949, 0, 0.945098, 1, 1,
-0.02420233, -0.3026005, -2.76089, 0, 0.9411765, 1, 1,
-0.01949522, -0.8824797, -3.806377, 0, 0.9333333, 1, 1,
-0.01592553, 0.4233226, 1.404432, 0, 0.9294118, 1, 1,
-0.009218683, 0.3172856, -1.962742, 0, 0.9215686, 1, 1,
-0.005726707, 0.2769901, 0.4694794, 0, 0.9176471, 1, 1,
0.01392468, 1.130592, 0.06076822, 0, 0.9098039, 1, 1,
0.01397308, 0.2667866, -0.9599192, 0, 0.9058824, 1, 1,
0.0150163, 0.1350273, 1.152093, 0, 0.8980392, 1, 1,
0.0151276, 0.107377, 1.443782, 0, 0.8901961, 1, 1,
0.0299872, 0.8493353, 0.3083382, 0, 0.8862745, 1, 1,
0.03098448, -2.169127, 1.887218, 0, 0.8784314, 1, 1,
0.0319383, 0.6561577, -0.00716442, 0, 0.8745098, 1, 1,
0.03236587, 0.1476063, -0.247462, 0, 0.8666667, 1, 1,
0.03649173, -0.7434891, 4.331903, 0, 0.8627451, 1, 1,
0.03890419, 0.5926899, 0.7899649, 0, 0.854902, 1, 1,
0.03897203, -0.8103617, 3.32317, 0, 0.8509804, 1, 1,
0.03947567, 0.6902416, 0.04834217, 0, 0.8431373, 1, 1,
0.04220275, 1.020685, -0.5554233, 0, 0.8392157, 1, 1,
0.04475345, -0.1331274, 3.557642, 0, 0.8313726, 1, 1,
0.05592996, -1.22894, 3.168397, 0, 0.827451, 1, 1,
0.05829642, -2.00012, 4.134238, 0, 0.8196079, 1, 1,
0.06245514, 0.3750048, -0.109591, 0, 0.8156863, 1, 1,
0.06286717, -1.079976, 1.252833, 0, 0.8078431, 1, 1,
0.06465641, 0.4435607, -0.959349, 0, 0.8039216, 1, 1,
0.06849956, -0.1091589, 2.749874, 0, 0.7960784, 1, 1,
0.06889939, 0.1066847, 1.001252, 0, 0.7882353, 1, 1,
0.07025691, -1.103791, 4.281216, 0, 0.7843137, 1, 1,
0.07075717, -0.5225559, 3.750142, 0, 0.7764706, 1, 1,
0.07323894, 3.085633, -0.1575316, 0, 0.772549, 1, 1,
0.0739115, 0.2069524, 1.61931, 0, 0.7647059, 1, 1,
0.0791295, 0.7634665, 0.0697107, 0, 0.7607843, 1, 1,
0.07957741, 0.1853774, -0.237705, 0, 0.7529412, 1, 1,
0.08359586, -0.1844566, 1.530486, 0, 0.7490196, 1, 1,
0.08733235, 1.197031, -0.04776113, 0, 0.7411765, 1, 1,
0.09237567, -1.149591, 4.292022, 0, 0.7372549, 1, 1,
0.09275422, -0.1304821, 1.684631, 0, 0.7294118, 1, 1,
0.0965071, -1.619878, 2.107301, 0, 0.7254902, 1, 1,
0.09777912, 0.1039894, -0.1794894, 0, 0.7176471, 1, 1,
0.1027712, -0.9581278, 2.057208, 0, 0.7137255, 1, 1,
0.1031549, 1.695821, 0.8451583, 0, 0.7058824, 1, 1,
0.106682, 1.02522, 0.9678049, 0, 0.6980392, 1, 1,
0.109562, -1.46665, 3.861802, 0, 0.6941177, 1, 1,
0.1124093, 0.6539325, -0.2085954, 0, 0.6862745, 1, 1,
0.112667, -2.332931, 4.335453, 0, 0.682353, 1, 1,
0.1128125, 0.06539252, 2.384416, 0, 0.6745098, 1, 1,
0.1156173, 0.7087716, 1.316164, 0, 0.6705883, 1, 1,
0.1161099, -1.016748, 3.893239, 0, 0.6627451, 1, 1,
0.1204502, -0.2437925, 3.190136, 0, 0.6588235, 1, 1,
0.1218856, -0.2250558, 1.570786, 0, 0.6509804, 1, 1,
0.1227886, -0.7056265, 2.992111, 0, 0.6470588, 1, 1,
0.1231018, 0.1271518, 2.094544, 0, 0.6392157, 1, 1,
0.1235901, 0.4401653, 0.76909, 0, 0.6352941, 1, 1,
0.1250602, 1.570849, 0.1283066, 0, 0.627451, 1, 1,
0.1258788, -1.260037, 4.548701, 0, 0.6235294, 1, 1,
0.1287618, -0.6628025, 3.97309, 0, 0.6156863, 1, 1,
0.1338478, -2.489697, 2.677484, 0, 0.6117647, 1, 1,
0.1354229, -0.149401, 2.066597, 0, 0.6039216, 1, 1,
0.1372201, -1.23788, 2.611928, 0, 0.5960785, 1, 1,
0.1410563, -0.9252244, 4.2713, 0, 0.5921569, 1, 1,
0.1412145, 0.9702922, 0.2281536, 0, 0.5843138, 1, 1,
0.1440581, 0.1861855, -0.5659574, 0, 0.5803922, 1, 1,
0.1505441, -0.06732063, 3.532318, 0, 0.572549, 1, 1,
0.1514486, 0.6437309, -0.6943656, 0, 0.5686275, 1, 1,
0.1594259, -1.101521, 2.579658, 0, 0.5607843, 1, 1,
0.1612698, -0.3583576, 2.728466, 0, 0.5568628, 1, 1,
0.1649141, -0.7900053, 3.040151, 0, 0.5490196, 1, 1,
0.1695896, -2.796667, 2.721199, 0, 0.5450981, 1, 1,
0.1708631, -0.1206619, 0.5429265, 0, 0.5372549, 1, 1,
0.1725758, -0.08537102, 2.846877, 0, 0.5333334, 1, 1,
0.1730592, -0.4060032, 1.093004, 0, 0.5254902, 1, 1,
0.1755299, -0.52437, 3.487072, 0, 0.5215687, 1, 1,
0.1756587, -0.6956953, 3.408525, 0, 0.5137255, 1, 1,
0.1782573, 1.384796, 0.7781918, 0, 0.509804, 1, 1,
0.180988, 0.2765483, 1.448764, 0, 0.5019608, 1, 1,
0.1820147, 0.3727493, 1.381909, 0, 0.4941176, 1, 1,
0.184581, 0.4651991, 2.11954, 0, 0.4901961, 1, 1,
0.1888881, 2.768826, -0.245524, 0, 0.4823529, 1, 1,
0.1894841, 0.5097691, 1.316575, 0, 0.4784314, 1, 1,
0.1933004, 0.7858178, -0.06599631, 0, 0.4705882, 1, 1,
0.1934233, -0.254813, 2.634125, 0, 0.4666667, 1, 1,
0.194556, -0.147089, 1.744917, 0, 0.4588235, 1, 1,
0.1988506, -0.8336479, 2.669086, 0, 0.454902, 1, 1,
0.1989688, -0.9817094, 2.922268, 0, 0.4470588, 1, 1,
0.2024445, -2.942351, 2.053765, 0, 0.4431373, 1, 1,
0.2035112, -0.2816985, 3.742063, 0, 0.4352941, 1, 1,
0.2043876, -1.504747, 1.609758, 0, 0.4313726, 1, 1,
0.2070035, -0.9123217, 4.118993, 0, 0.4235294, 1, 1,
0.2093083, 0.880443, -0.489127, 0, 0.4196078, 1, 1,
0.2185443, -2.053591, 2.508249, 0, 0.4117647, 1, 1,
0.2204856, -0.136359, 1.588542, 0, 0.4078431, 1, 1,
0.2219657, -1.481588, 2.225564, 0, 0.4, 1, 1,
0.2233424, -0.833227, 2.568131, 0, 0.3921569, 1, 1,
0.2253259, -0.7550905, 4.045892, 0, 0.3882353, 1, 1,
0.2330738, 0.05510725, -0.4165041, 0, 0.3803922, 1, 1,
0.2437858, -0.805793, 3.293145, 0, 0.3764706, 1, 1,
0.2474704, 2.150458, 1.397922, 0, 0.3686275, 1, 1,
0.2478244, 1.043124, 0.5984603, 0, 0.3647059, 1, 1,
0.2485595, 0.2156795, 1.408086, 0, 0.3568628, 1, 1,
0.249005, 1.268842, 1.417708, 0, 0.3529412, 1, 1,
0.2509302, -0.7286643, 3.56342, 0, 0.345098, 1, 1,
0.2513509, -1.242548, 3.732903, 0, 0.3411765, 1, 1,
0.2514132, 0.3941984, 0.5146753, 0, 0.3333333, 1, 1,
0.2527907, -0.2817234, 3.265428, 0, 0.3294118, 1, 1,
0.2537167, -0.05982543, 3.099267, 0, 0.3215686, 1, 1,
0.2581607, -0.1726351, 0.9984115, 0, 0.3176471, 1, 1,
0.2630777, -0.1116178, 2.959321, 0, 0.3098039, 1, 1,
0.263694, -0.3159969, 2.205509, 0, 0.3058824, 1, 1,
0.2673885, 1.29839, -1.191378, 0, 0.2980392, 1, 1,
0.2676758, 0.4197597, 1.862029, 0, 0.2901961, 1, 1,
0.2693484, -1.008918, 3.41386, 0, 0.2862745, 1, 1,
0.2708341, 1.781021, -0.3272133, 0, 0.2784314, 1, 1,
0.2725723, 0.6729272, -0.5953889, 0, 0.2745098, 1, 1,
0.2748002, 0.5001448, 1.789628, 0, 0.2666667, 1, 1,
0.2771353, 1.859955, -0.3546174, 0, 0.2627451, 1, 1,
0.2773124, -1.437241, 3.580242, 0, 0.254902, 1, 1,
0.2780268, 1.600535, -1.143479, 0, 0.2509804, 1, 1,
0.2861612, 0.9361246, 0.1206962, 0, 0.2431373, 1, 1,
0.2865499, -1.133347, 3.756021, 0, 0.2392157, 1, 1,
0.2874333, -0.9319155, 2.074312, 0, 0.2313726, 1, 1,
0.2882597, -1.607101, 4.554165, 0, 0.227451, 1, 1,
0.2891392, 0.3972177, -0.1732732, 0, 0.2196078, 1, 1,
0.2928405, 2.514403, 1.245926, 0, 0.2156863, 1, 1,
0.2941233, -0.3879811, 1.097791, 0, 0.2078431, 1, 1,
0.2999875, 1.817931, -0.1113407, 0, 0.2039216, 1, 1,
0.3091005, -1.139861, 2.160904, 0, 0.1960784, 1, 1,
0.3160534, 0.7804945, 0.1181689, 0, 0.1882353, 1, 1,
0.3168613, 0.9878684, -0.4991072, 0, 0.1843137, 1, 1,
0.3188744, -1.800235, 4.182648, 0, 0.1764706, 1, 1,
0.3221778, 0.9823983, -0.3535155, 0, 0.172549, 1, 1,
0.3255829, 0.5029114, -0.7434703, 0, 0.1647059, 1, 1,
0.3274736, -0.8442931, 2.860156, 0, 0.1607843, 1, 1,
0.3278244, -0.2453127, 0.8959574, 0, 0.1529412, 1, 1,
0.3357501, 0.7507995, 0.3359637, 0, 0.1490196, 1, 1,
0.3365601, 0.1256488, 1.008561, 0, 0.1411765, 1, 1,
0.3400205, -1.662395, 2.786559, 0, 0.1372549, 1, 1,
0.3455905, -1.695815, 5.094255, 0, 0.1294118, 1, 1,
0.3490568, 0.4760061, 2.999067, 0, 0.1254902, 1, 1,
0.3532766, 0.4985491, 0.9317949, 0, 0.1176471, 1, 1,
0.3612393, -0.5044668, 3.125862, 0, 0.1137255, 1, 1,
0.3614312, -0.8008472, 2.64269, 0, 0.1058824, 1, 1,
0.3615834, 0.9011007, 1.054832, 0, 0.09803922, 1, 1,
0.3617641, 0.2789051, 1.015907, 0, 0.09411765, 1, 1,
0.3623233, 0.07451003, 2.640966, 0, 0.08627451, 1, 1,
0.3625413, 0.5454383, 2.117893, 0, 0.08235294, 1, 1,
0.3638883, 0.9226249, 0.5077689, 0, 0.07450981, 1, 1,
0.3640247, 1.442221, 0.7288976, 0, 0.07058824, 1, 1,
0.3643983, -1.590011, 3.512024, 0, 0.0627451, 1, 1,
0.3744715, -0.1132048, 0.9040049, 0, 0.05882353, 1, 1,
0.3757609, 1.252259, 1.86185, 0, 0.05098039, 1, 1,
0.3761003, -0.06434524, 3.415484, 0, 0.04705882, 1, 1,
0.3855599, -0.2618081, 2.533151, 0, 0.03921569, 1, 1,
0.386085, 1.611608, -0.00475565, 0, 0.03529412, 1, 1,
0.3870562, -0.3946085, 2.534405, 0, 0.02745098, 1, 1,
0.3887597, 0.1018002, 0.5396491, 0, 0.02352941, 1, 1,
0.3908361, 2.289194, 2.43327, 0, 0.01568628, 1, 1,
0.4004221, 1.39233, 0.2402043, 0, 0.01176471, 1, 1,
0.4027144, -0.7796811, 2.76711, 0, 0.003921569, 1, 1,
0.4028637, 1.511191, 0.8022161, 0.003921569, 0, 1, 1,
0.4058608, -0.4959738, 2.05242, 0.007843138, 0, 1, 1,
0.4119644, -0.2955298, 1.048139, 0.01568628, 0, 1, 1,
0.413616, 0.3833623, 1.874954, 0.01960784, 0, 1, 1,
0.4178467, -0.8906955, 0.8771001, 0.02745098, 0, 1, 1,
0.41993, -1.047231, 2.377882, 0.03137255, 0, 1, 1,
0.4239026, -1.211264, 3.367962, 0.03921569, 0, 1, 1,
0.4261175, -2.837204, 2.119858, 0.04313726, 0, 1, 1,
0.4338117, -1.116478, 1.984212, 0.05098039, 0, 1, 1,
0.4416622, -1.061334, 2.85686, 0.05490196, 0, 1, 1,
0.4467631, -0.6503504, 1.872783, 0.0627451, 0, 1, 1,
0.4496647, -0.4689035, 2.17858, 0.06666667, 0, 1, 1,
0.4509394, -1.847012, 2.634882, 0.07450981, 0, 1, 1,
0.451232, -0.09465612, 1.974993, 0.07843138, 0, 1, 1,
0.4569589, -1.705485, 3.069088, 0.08627451, 0, 1, 1,
0.4571863, 1.589828, 0.7564315, 0.09019608, 0, 1, 1,
0.4617099, -0.2755237, 0.9379553, 0.09803922, 0, 1, 1,
0.4642814, 0.4196394, -0.04146851, 0.1058824, 0, 1, 1,
0.471439, -0.2059819, 0.2592722, 0.1098039, 0, 1, 1,
0.4739651, 0.0725329, 0.611132, 0.1176471, 0, 1, 1,
0.4780903, 0.3804593, 1.148681, 0.1215686, 0, 1, 1,
0.4812202, 0.2044362, 1.253902, 0.1294118, 0, 1, 1,
0.4889649, 0.09328607, 1.681148, 0.1333333, 0, 1, 1,
0.4932989, 0.7493246, -0.3390877, 0.1411765, 0, 1, 1,
0.4937301, 0.6673947, 0.7906014, 0.145098, 0, 1, 1,
0.4962437, -0.4846318, 2.300674, 0.1529412, 0, 1, 1,
0.5026749, 0.7729813, 1.560148, 0.1568628, 0, 1, 1,
0.5084977, 0.5958358, 2.297255, 0.1647059, 0, 1, 1,
0.50862, 3.015121, -0.1527872, 0.1686275, 0, 1, 1,
0.5131802, 0.462027, 0.7782903, 0.1764706, 0, 1, 1,
0.5154315, -0.2718407, 3.555775, 0.1803922, 0, 1, 1,
0.516744, -0.6094909, 2.579124, 0.1882353, 0, 1, 1,
0.5173583, 1.172346, -0.1289591, 0.1921569, 0, 1, 1,
0.5189683, -1.491657, 2.603563, 0.2, 0, 1, 1,
0.5255066, -1.042588, 2.695772, 0.2078431, 0, 1, 1,
0.5347802, 2.892039, -0.9195774, 0.2117647, 0, 1, 1,
0.5445582, -0.02418773, 1.154324, 0.2196078, 0, 1, 1,
0.5526955, -0.6258469, 1.577959, 0.2235294, 0, 1, 1,
0.5547847, 0.6652251, -0.2641401, 0.2313726, 0, 1, 1,
0.5559546, 0.2557667, -0.005002389, 0.2352941, 0, 1, 1,
0.5564692, 0.6655859, 0.9668353, 0.2431373, 0, 1, 1,
0.558938, 0.1227741, 1.385562, 0.2470588, 0, 1, 1,
0.5667464, -2.586205, 1.528551, 0.254902, 0, 1, 1,
0.5685851, 1.531213, 1.451592, 0.2588235, 0, 1, 1,
0.5725817, 1.23958, -0.4251824, 0.2666667, 0, 1, 1,
0.5757005, -0.2565973, 0.3911524, 0.2705882, 0, 1, 1,
0.5759193, 0.8492505, -1.40876, 0.2784314, 0, 1, 1,
0.5784658, 0.1641293, 4.332395, 0.282353, 0, 1, 1,
0.579269, -0.7663996, 3.061051, 0.2901961, 0, 1, 1,
0.5833067, -0.4796329, 0.8605006, 0.2941177, 0, 1, 1,
0.5856053, 2.681376, 0.4214449, 0.3019608, 0, 1, 1,
0.5890829, -0.3712142, 1.590823, 0.3098039, 0, 1, 1,
0.5903015, 1.113655, 0.5245939, 0.3137255, 0, 1, 1,
0.5923412, -0.8248253, 1.598086, 0.3215686, 0, 1, 1,
0.592973, -0.4568128, 2.184811, 0.3254902, 0, 1, 1,
0.5949007, -0.9304608, 1.656468, 0.3333333, 0, 1, 1,
0.5951139, 0.7010667, 0.493253, 0.3372549, 0, 1, 1,
0.5969815, -0.8332462, 2.633058, 0.345098, 0, 1, 1,
0.6055788, 0.7366661, 1.844314, 0.3490196, 0, 1, 1,
0.6094415, -0.1428847, 2.37462, 0.3568628, 0, 1, 1,
0.6100808, 0.05257977, 0.08347915, 0.3607843, 0, 1, 1,
0.6177168, 0.1102981, 0.5718073, 0.3686275, 0, 1, 1,
0.6182066, -0.06070612, 0.1578832, 0.372549, 0, 1, 1,
0.6231936, 0.1718562, 1.515995, 0.3803922, 0, 1, 1,
0.632875, 0.587091, 0.79425, 0.3843137, 0, 1, 1,
0.6399698, 0.8443865, 0.612119, 0.3921569, 0, 1, 1,
0.6419625, 1.570066, -0.01067144, 0.3960784, 0, 1, 1,
0.6463761, 1.086449, 0.1758645, 0.4039216, 0, 1, 1,
0.6464289, -2.425597, 2.448596, 0.4117647, 0, 1, 1,
0.6476858, 1.558455, 0.792893, 0.4156863, 0, 1, 1,
0.6489692, -0.5844712, 3.987376, 0.4235294, 0, 1, 1,
0.6501961, -1.655805, 4.040581, 0.427451, 0, 1, 1,
0.6514872, 0.2740801, 0.5456176, 0.4352941, 0, 1, 1,
0.6522323, 0.4294136, 1.421619, 0.4392157, 0, 1, 1,
0.6622992, -0.5836532, 1.40558, 0.4470588, 0, 1, 1,
0.663429, 1.473643, -2.392343, 0.4509804, 0, 1, 1,
0.6660137, 2.88373, 0.9095595, 0.4588235, 0, 1, 1,
0.6661698, -1.31686, 2.58555, 0.4627451, 0, 1, 1,
0.6672817, 1.504058, -0.4099014, 0.4705882, 0, 1, 1,
0.668721, 1.655102, -0.456099, 0.4745098, 0, 1, 1,
0.6702811, 0.2052637, 1.011562, 0.4823529, 0, 1, 1,
0.6715578, -0.09899975, 0.7883774, 0.4862745, 0, 1, 1,
0.6725577, 0.1885379, 2.773079, 0.4941176, 0, 1, 1,
0.673246, -0.4672654, 2.810244, 0.5019608, 0, 1, 1,
0.6801666, -0.2753157, 1.259383, 0.5058824, 0, 1, 1,
0.681613, -0.999377, 2.501142, 0.5137255, 0, 1, 1,
0.6836797, -1.984981, 3.674078, 0.5176471, 0, 1, 1,
0.6844096, -2.907821, -0.02030229, 0.5254902, 0, 1, 1,
0.6873516, 0.2573721, 1.218171, 0.5294118, 0, 1, 1,
0.6960594, 0.4730735, 1.099075, 0.5372549, 0, 1, 1,
0.7086559, -0.1523419, 2.129892, 0.5411765, 0, 1, 1,
0.7086885, -1.254962, 2.280388, 0.5490196, 0, 1, 1,
0.7094227, -0.8823482, 1.895252, 0.5529412, 0, 1, 1,
0.7261789, -1.1244, 1.3445, 0.5607843, 0, 1, 1,
0.73135, 0.1017339, 3.30936, 0.5647059, 0, 1, 1,
0.731432, -0.6574313, 4.465342, 0.572549, 0, 1, 1,
0.7337034, 0.9263616, 0.6976949, 0.5764706, 0, 1, 1,
0.7339189, -0.5254692, 2.207008, 0.5843138, 0, 1, 1,
0.7343934, 2.032878, 1.143376, 0.5882353, 0, 1, 1,
0.7349964, -0.2102225, 2.990603, 0.5960785, 0, 1, 1,
0.7358897, 0.1312207, 2.144093, 0.6039216, 0, 1, 1,
0.7403921, -1.392432, 3.715568, 0.6078432, 0, 1, 1,
0.7456406, -0.2703491, 3.14147, 0.6156863, 0, 1, 1,
0.7512152, 0.451072, 0.8724402, 0.6196079, 0, 1, 1,
0.7525367, -0.3320739, 0.7988387, 0.627451, 0, 1, 1,
0.7557921, -0.4556665, 2.505295, 0.6313726, 0, 1, 1,
0.7694993, -0.9453195, 1.957641, 0.6392157, 0, 1, 1,
0.7748808, -0.06872631, 2.912131, 0.6431373, 0, 1, 1,
0.7820852, -0.2267799, 1.135248, 0.6509804, 0, 1, 1,
0.7892008, 0.8282986, 1.217759, 0.654902, 0, 1, 1,
0.790508, -0.5576597, 4.935189, 0.6627451, 0, 1, 1,
0.803372, -0.07014487, 0.9239523, 0.6666667, 0, 1, 1,
0.8040646, 0.05791593, 1.306951, 0.6745098, 0, 1, 1,
0.8090264, -1.083474, 3.06919, 0.6784314, 0, 1, 1,
0.8147218, 0.1116078, 2.163188, 0.6862745, 0, 1, 1,
0.8170568, -0.190039, 2.742991, 0.6901961, 0, 1, 1,
0.8191926, 0.0440539, 1.213793, 0.6980392, 0, 1, 1,
0.8204011, 0.6522976, 0.3029757, 0.7058824, 0, 1, 1,
0.8225105, -1.63568, 2.976196, 0.7098039, 0, 1, 1,
0.8263369, 1.912305, -0.1026989, 0.7176471, 0, 1, 1,
0.831647, 0.6770713, -0.4647538, 0.7215686, 0, 1, 1,
0.8320377, 0.1796404, 2.01754, 0.7294118, 0, 1, 1,
0.8329566, -0.2753299, 2.235804, 0.7333333, 0, 1, 1,
0.8349589, -0.04082486, 2.20217, 0.7411765, 0, 1, 1,
0.8401662, 0.1688752, 1.260024, 0.7450981, 0, 1, 1,
0.8412102, -0.6941779, 1.769354, 0.7529412, 0, 1, 1,
0.8435524, -1.566672, 1.234324, 0.7568628, 0, 1, 1,
0.8459709, -0.1646153, 1.493447, 0.7647059, 0, 1, 1,
0.8470427, 0.7332553, -0.55248, 0.7686275, 0, 1, 1,
0.8480884, -0.6988192, -0.8447728, 0.7764706, 0, 1, 1,
0.8486667, 0.4376319, 1.240169, 0.7803922, 0, 1, 1,
0.8501085, -1.368964, 2.708633, 0.7882353, 0, 1, 1,
0.8506646, 0.7119982, 0.6207884, 0.7921569, 0, 1, 1,
0.8510256, -0.3824902, 2.160563, 0.8, 0, 1, 1,
0.851279, 0.294081, 2.701344, 0.8078431, 0, 1, 1,
0.8533465, -0.3677489, 3.709308, 0.8117647, 0, 1, 1,
0.8565569, 0.05706219, 1.286541, 0.8196079, 0, 1, 1,
0.8593568, -1.77318, 4.422702, 0.8235294, 0, 1, 1,
0.8630043, 1.121146, -1.191786, 0.8313726, 0, 1, 1,
0.8639874, 0.4324375, 0.6378579, 0.8352941, 0, 1, 1,
0.8658099, 0.9714808, 2.854076, 0.8431373, 0, 1, 1,
0.8662364, 0.9647128, 1.169539, 0.8470588, 0, 1, 1,
0.868684, 0.1550706, 1.780263, 0.854902, 0, 1, 1,
0.8717261, 0.4698651, 1.043435, 0.8588235, 0, 1, 1,
0.873689, 0.9027753, 2.69868, 0.8666667, 0, 1, 1,
0.8757906, -0.06134931, 0.1390755, 0.8705882, 0, 1, 1,
0.8759335, 0.3752228, 1.359742, 0.8784314, 0, 1, 1,
0.8764266, 0.3452717, 0.4607591, 0.8823529, 0, 1, 1,
0.8775283, -1.269463, 4.070544, 0.8901961, 0, 1, 1,
0.8835356, 1.122576, 0.3477835, 0.8941177, 0, 1, 1,
0.8859865, 0.2638724, 0.5869929, 0.9019608, 0, 1, 1,
0.888725, 0.2390384, 1.454417, 0.9098039, 0, 1, 1,
0.8891652, 0.8407822, 1.069571, 0.9137255, 0, 1, 1,
0.8909419, -2.179596, 3.565007, 0.9215686, 0, 1, 1,
0.8961576, 0.08847168, 1.296394, 0.9254902, 0, 1, 1,
0.9079422, 0.8382754, 0.3318877, 0.9333333, 0, 1, 1,
0.9132806, 1.15476, -0.4499866, 0.9372549, 0, 1, 1,
0.9174175, 0.5077708, 1.478229, 0.945098, 0, 1, 1,
0.9188436, 0.2326271, 1.961663, 0.9490196, 0, 1, 1,
0.9200837, 0.525983, -0.05989744, 0.9568627, 0, 1, 1,
0.927744, 0.7418309, 1.417217, 0.9607843, 0, 1, 1,
0.9316193, -0.8186407, -0.1631087, 0.9686275, 0, 1, 1,
0.9335763, 0.786915, 2.769242, 0.972549, 0, 1, 1,
0.9380251, -0.7995124, 1.763705, 0.9803922, 0, 1, 1,
0.9392377, -2.313997, 3.437975, 0.9843137, 0, 1, 1,
0.9412423, 0.5901204, 0.2633424, 0.9921569, 0, 1, 1,
0.9414603, 0.498279, -0.2350562, 0.9960784, 0, 1, 1,
0.9422542, 2.037949, -1.002009, 1, 0, 0.9960784, 1,
0.9432108, 0.1715457, 0.913016, 1, 0, 0.9882353, 1,
0.9442664, 1.690582, -0.291296, 1, 0, 0.9843137, 1,
0.9455913, -0.4520096, 2.778828, 1, 0, 0.9764706, 1,
0.9473227, 1.256658, 2.037239, 1, 0, 0.972549, 1,
0.9546057, -0.5030295, -0.1064613, 1, 0, 0.9647059, 1,
0.9581178, -0.2155893, 2.183037, 1, 0, 0.9607843, 1,
0.9606894, -0.4123979, 0.1108544, 1, 0, 0.9529412, 1,
0.9611992, -0.2450849, 2.272312, 1, 0, 0.9490196, 1,
0.9840236, -0.4729329, 1.821763, 1, 0, 0.9411765, 1,
0.9853758, -1.203826, 3.916677, 1, 0, 0.9372549, 1,
0.9909646, -0.4276869, 2.674471, 1, 0, 0.9294118, 1,
0.9929956, 0.9991223, 0.3279264, 1, 0, 0.9254902, 1,
0.9980726, 0.1781402, 0.5087495, 1, 0, 0.9176471, 1,
1.000486, -0.6453249, 1.357325, 1, 0, 0.9137255, 1,
1.001634, -0.4422218, 2.099485, 1, 0, 0.9058824, 1,
1.002337, 1.091709, 1.630565, 1, 0, 0.9019608, 1,
1.004739, 0.3247086, 2.192703, 1, 0, 0.8941177, 1,
1.010961, 0.3063872, 2.199856, 1, 0, 0.8862745, 1,
1.01397, 1.415699, 0.4358422, 1, 0, 0.8823529, 1,
1.017877, -1.059963, 0.09709349, 1, 0, 0.8745098, 1,
1.021368, -0.4258648, 2.624838, 1, 0, 0.8705882, 1,
1.025905, -0.5394617, 1.60129, 1, 0, 0.8627451, 1,
1.036615, 0.09308029, 3.083332, 1, 0, 0.8588235, 1,
1.038624, 1.076761, -1.44545, 1, 0, 0.8509804, 1,
1.041098, 0.5200788, 0.520339, 1, 0, 0.8470588, 1,
1.055352, 1.968563, 1.826609, 1, 0, 0.8392157, 1,
1.079232, -0.49478, 2.767415, 1, 0, 0.8352941, 1,
1.082767, 0.8868865, 0.5570915, 1, 0, 0.827451, 1,
1.084357, -1.51594, 0.8180308, 1, 0, 0.8235294, 1,
1.089701, 0.2588347, 2.225683, 1, 0, 0.8156863, 1,
1.093631, 1.72911, 0.9567857, 1, 0, 0.8117647, 1,
1.093769, -0.6529719, 0.4176885, 1, 0, 0.8039216, 1,
1.094729, -0.5972692, 2.529244, 1, 0, 0.7960784, 1,
1.097052, 0.172252, 0.8027833, 1, 0, 0.7921569, 1,
1.102276, -0.4619733, 3.155022, 1, 0, 0.7843137, 1,
1.10279, 2.153627, -1.148516, 1, 0, 0.7803922, 1,
1.107626, -0.3091673, 1.428333, 1, 0, 0.772549, 1,
1.113252, -0.5928738, 1.87795, 1, 0, 0.7686275, 1,
1.114145, -0.05239015, 0.8356116, 1, 0, 0.7607843, 1,
1.118683, 0.04326212, 1.180485, 1, 0, 0.7568628, 1,
1.123188, 0.5177146, 1.213623, 1, 0, 0.7490196, 1,
1.123362, 0.494985, 1.812527, 1, 0, 0.7450981, 1,
1.124824, 0.03276618, -0.1293253, 1, 0, 0.7372549, 1,
1.12498, -0.2408645, 1.200442, 1, 0, 0.7333333, 1,
1.127296, 1.036584, 2.601497, 1, 0, 0.7254902, 1,
1.13965, 0.474815, 3.131486, 1, 0, 0.7215686, 1,
1.141663, 0.08022101, 1.790431, 1, 0, 0.7137255, 1,
1.142676, 0.791553, -0.7184644, 1, 0, 0.7098039, 1,
1.14967, -0.4157253, 0.7520316, 1, 0, 0.7019608, 1,
1.15608, 0.4950084, 1.990895, 1, 0, 0.6941177, 1,
1.157296, -0.9789232, 1.615765, 1, 0, 0.6901961, 1,
1.158468, 0.1035807, 1.532668, 1, 0, 0.682353, 1,
1.16721, 1.297911, 2.35622, 1, 0, 0.6784314, 1,
1.171911, -0.5691072, 3.64535, 1, 0, 0.6705883, 1,
1.174391, -1.060295, 1.355847, 1, 0, 0.6666667, 1,
1.182529, -0.5117654, 3.120836, 1, 0, 0.6588235, 1,
1.18313, -0.8474584, 1.494991, 1, 0, 0.654902, 1,
1.190825, 1.146519, 2.208487, 1, 0, 0.6470588, 1,
1.200964, 1.353538, 1.15522, 1, 0, 0.6431373, 1,
1.206326, 0.9913484, 1.814535, 1, 0, 0.6352941, 1,
1.208117, -0.396867, 1.508303, 1, 0, 0.6313726, 1,
1.213259, -0.5414275, 1.399531, 1, 0, 0.6235294, 1,
1.214223, -0.1612003, 1.860445, 1, 0, 0.6196079, 1,
1.216425, 0.02193738, -0.5493302, 1, 0, 0.6117647, 1,
1.216895, -0.7736142, 2.675622, 1, 0, 0.6078432, 1,
1.229256, -0.4184926, 2.189612, 1, 0, 0.6, 1,
1.231203, 0.04936475, 2.06135, 1, 0, 0.5921569, 1,
1.245457, 0.1760205, 1.195157, 1, 0, 0.5882353, 1,
1.249718, -0.4690236, 2.440743, 1, 0, 0.5803922, 1,
1.253875, -0.5337628, 2.442327, 1, 0, 0.5764706, 1,
1.256779, -0.508931, 2.349742, 1, 0, 0.5686275, 1,
1.262597, -1.468375, 2.255188, 1, 0, 0.5647059, 1,
1.26589, -0.8468468, 3.383262, 1, 0, 0.5568628, 1,
1.276125, 1.387767, -0.5991028, 1, 0, 0.5529412, 1,
1.285442, 0.6977493, 2.454437, 1, 0, 0.5450981, 1,
1.289178, -1.723288, 2.674898, 1, 0, 0.5411765, 1,
1.298786, 1.15056, -0.4726314, 1, 0, 0.5333334, 1,
1.304453, -1.085914, 0.9107063, 1, 0, 0.5294118, 1,
1.316937, 1.290361, 0.3547747, 1, 0, 0.5215687, 1,
1.325089, -1.686592, 2.987347, 1, 0, 0.5176471, 1,
1.331489, 0.5391108, 0.1289111, 1, 0, 0.509804, 1,
1.345117, -0.2537367, 1.675533, 1, 0, 0.5058824, 1,
1.34627, -0.7058839, 1.910657, 1, 0, 0.4980392, 1,
1.357618, -0.7025069, 3.055621, 1, 0, 0.4901961, 1,
1.363693, -1.136166, 3.094419, 1, 0, 0.4862745, 1,
1.368136, -0.7998377, 4.778441, 1, 0, 0.4784314, 1,
1.37929, 0.1556828, 3.421477, 1, 0, 0.4745098, 1,
1.381766, 0.1304982, 2.114421, 1, 0, 0.4666667, 1,
1.383931, -1.210115, 2.503093, 1, 0, 0.4627451, 1,
1.385469, -0.5424385, 3.335336, 1, 0, 0.454902, 1,
1.402252, -0.8199193, 1.714853, 1, 0, 0.4509804, 1,
1.407215, -0.4554327, 1.541477, 1, 0, 0.4431373, 1,
1.413045, -1.294822, 0.9256055, 1, 0, 0.4392157, 1,
1.414039, -1.625133, 2.313234, 1, 0, 0.4313726, 1,
1.416079, 0.4928477, 1.642409, 1, 0, 0.427451, 1,
1.43574, -0.7787786, 2.144215, 1, 0, 0.4196078, 1,
1.43726, -0.4803763, 3.064847, 1, 0, 0.4156863, 1,
1.442083, 1.383263, 1.022188, 1, 0, 0.4078431, 1,
1.448417, 1.013276, 2.933542, 1, 0, 0.4039216, 1,
1.454103, -0.5001861, 4.696986, 1, 0, 0.3960784, 1,
1.455862, 0.09369502, 1.850456, 1, 0, 0.3882353, 1,
1.462261, 0.2543939, 1.329646, 1, 0, 0.3843137, 1,
1.463879, -1.989442, 0.4901926, 1, 0, 0.3764706, 1,
1.476841, 0.9106781, 0.08924606, 1, 0, 0.372549, 1,
1.480547, 1.840087, -0.5450889, 1, 0, 0.3647059, 1,
1.484849, 0.714093, 0.7403312, 1, 0, 0.3607843, 1,
1.490102, -2.034452, 4.557429, 1, 0, 0.3529412, 1,
1.499907, -1.214601, 1.918984, 1, 0, 0.3490196, 1,
1.526804, -0.6197982, 4.090312, 1, 0, 0.3411765, 1,
1.539845, 1.442771, 1.249293, 1, 0, 0.3372549, 1,
1.55134, -0.903887, 1.429255, 1, 0, 0.3294118, 1,
1.553964, -0.6144477, -0.5571471, 1, 0, 0.3254902, 1,
1.555402, 0.52125, 1.633134, 1, 0, 0.3176471, 1,
1.585273, 0.2116446, 1.044996, 1, 0, 0.3137255, 1,
1.608467, 1.275064, 0.348286, 1, 0, 0.3058824, 1,
1.620682, -0.7084442, 2.730876, 1, 0, 0.2980392, 1,
1.629977, 0.2208824, 1.033569, 1, 0, 0.2941177, 1,
1.631788, 1.559651, -0.1170531, 1, 0, 0.2862745, 1,
1.634505, -0.3071963, 2.8496, 1, 0, 0.282353, 1,
1.647293, 1.254689, 0.03073361, 1, 0, 0.2745098, 1,
1.658926, -0.2020865, 1.482267, 1, 0, 0.2705882, 1,
1.658927, -0.6242972, 2.214185, 1, 0, 0.2627451, 1,
1.695321, 0.2903394, 2.580181, 1, 0, 0.2588235, 1,
1.703499, -0.2849499, 2.471579, 1, 0, 0.2509804, 1,
1.708562, -0.3883985, 0.4450164, 1, 0, 0.2470588, 1,
1.71262, 1.163933, 1.428872, 1, 0, 0.2392157, 1,
1.7331, -0.2497318, 1.868638, 1, 0, 0.2352941, 1,
1.783402, 1.603743, 0.02068216, 1, 0, 0.227451, 1,
1.803329, 2.494902, 2.543777, 1, 0, 0.2235294, 1,
1.807167, -0.8836951, 1.048589, 1, 0, 0.2156863, 1,
1.807894, 0.355683, 1.163896, 1, 0, 0.2117647, 1,
1.820045, 0.0631808, 2.426011, 1, 0, 0.2039216, 1,
1.834397, -0.09686586, 1.409829, 1, 0, 0.1960784, 1,
1.840907, -0.4049985, 2.998922, 1, 0, 0.1921569, 1,
1.851361, 0.723802, 4.170107, 1, 0, 0.1843137, 1,
1.889198, 0.9927707, 0.1036717, 1, 0, 0.1803922, 1,
1.911229, 0.6552483, 2.676564, 1, 0, 0.172549, 1,
1.929037, -0.9387118, -0.01759742, 1, 0, 0.1686275, 1,
1.929913, 1.011748, 1.867485, 1, 0, 0.1607843, 1,
1.957552, -0.5294285, 1.115208, 1, 0, 0.1568628, 1,
2.060258, 0.5434382, 3.404742, 1, 0, 0.1490196, 1,
2.074264, 0.646871, 0.4250995, 1, 0, 0.145098, 1,
2.075047, -0.7407809, -0.03492102, 1, 0, 0.1372549, 1,
2.078103, 0.5030732, 1.827153, 1, 0, 0.1333333, 1,
2.106102, -0.3955433, 2.792207, 1, 0, 0.1254902, 1,
2.124774, 0.9643698, 1.140107, 1, 0, 0.1215686, 1,
2.136984, 2.121065, -0.2331438, 1, 0, 0.1137255, 1,
2.174759, 0.05705401, 1.40622, 1, 0, 0.1098039, 1,
2.24412, -1.36148, 2.195314, 1, 0, 0.1019608, 1,
2.25207, 0.4823343, 0.9768153, 1, 0, 0.09411765, 1,
2.256003, 2.01807, 0.9600925, 1, 0, 0.09019608, 1,
2.343559, 0.003682016, 0.7007129, 1, 0, 0.08235294, 1,
2.36217, 0.4214804, -0.436269, 1, 0, 0.07843138, 1,
2.384288, -0.567889, 2.261307, 1, 0, 0.07058824, 1,
2.385067, 1.297845, 2.973586, 1, 0, 0.06666667, 1,
2.41993, 2.3795, 0.6487215, 1, 0, 0.05882353, 1,
2.423161, -0.2317951, 1.404889, 1, 0, 0.05490196, 1,
2.539096, 0.3980113, 2.20872, 1, 0, 0.04705882, 1,
2.590676, 0.2691116, 1.208871, 1, 0, 0.04313726, 1,
2.746151, 0.8093863, 2.130089, 1, 0, 0.03529412, 1,
2.840681, -0.6090276, 1.272084, 1, 0, 0.03137255, 1,
2.88541, 1.0472, -0.05851494, 1, 0, 0.02352941, 1,
3.035596, -0.6166611, 0.8949864, 1, 0, 0.01960784, 1,
3.139496, 0.4619391, 1.888949, 1, 0, 0.01176471, 1,
3.463288, -0.3609768, 0.3227151, 1, 0, 0.007843138, 1
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
0.3306911, -5.04455, -6.997795, 0, -0.5, 0.5, 0.5,
0.3306911, -5.04455, -6.997795, 1, -0.5, 0.5, 0.5,
0.3306911, -5.04455, -6.997795, 1, 1.5, 0.5, 0.5,
0.3306911, -5.04455, -6.997795, 0, 1.5, 0.5, 0.5
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
-3.863856, -0.3902899, -6.997795, 0, -0.5, 0.5, 0.5,
-3.863856, -0.3902899, -6.997795, 1, -0.5, 0.5, 0.5,
-3.863856, -0.3902899, -6.997795, 1, 1.5, 0.5, 0.5,
-3.863856, -0.3902899, -6.997795, 0, 1.5, 0.5, 0.5
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
-3.863856, -5.04455, -0.07549667, 0, -0.5, 0.5, 0.5,
-3.863856, -5.04455, -0.07549667, 1, -0.5, 0.5, 0.5,
-3.863856, -5.04455, -0.07549667, 1, 1.5, 0.5, 0.5,
-3.863856, -5.04455, -0.07549667, 0, 1.5, 0.5, 0.5
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
-2, -3.97049, -5.400342,
3, -3.97049, -5.400342,
-2, -3.97049, -5.400342,
-2, -4.1495, -5.666584,
-1, -3.97049, -5.400342,
-1, -4.1495, -5.666584,
0, -3.97049, -5.400342,
0, -4.1495, -5.666584,
1, -3.97049, -5.400342,
1, -4.1495, -5.666584,
2, -3.97049, -5.400342,
2, -4.1495, -5.666584,
3, -3.97049, -5.400342,
3, -4.1495, -5.666584
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
-2, -4.50752, -6.199068, 0, -0.5, 0.5, 0.5,
-2, -4.50752, -6.199068, 1, -0.5, 0.5, 0.5,
-2, -4.50752, -6.199068, 1, 1.5, 0.5, 0.5,
-2, -4.50752, -6.199068, 0, 1.5, 0.5, 0.5,
-1, -4.50752, -6.199068, 0, -0.5, 0.5, 0.5,
-1, -4.50752, -6.199068, 1, -0.5, 0.5, 0.5,
-1, -4.50752, -6.199068, 1, 1.5, 0.5, 0.5,
-1, -4.50752, -6.199068, 0, 1.5, 0.5, 0.5,
0, -4.50752, -6.199068, 0, -0.5, 0.5, 0.5,
0, -4.50752, -6.199068, 1, -0.5, 0.5, 0.5,
0, -4.50752, -6.199068, 1, 1.5, 0.5, 0.5,
0, -4.50752, -6.199068, 0, 1.5, 0.5, 0.5,
1, -4.50752, -6.199068, 0, -0.5, 0.5, 0.5,
1, -4.50752, -6.199068, 1, -0.5, 0.5, 0.5,
1, -4.50752, -6.199068, 1, 1.5, 0.5, 0.5,
1, -4.50752, -6.199068, 0, 1.5, 0.5, 0.5,
2, -4.50752, -6.199068, 0, -0.5, 0.5, 0.5,
2, -4.50752, -6.199068, 1, -0.5, 0.5, 0.5,
2, -4.50752, -6.199068, 1, 1.5, 0.5, 0.5,
2, -4.50752, -6.199068, 0, 1.5, 0.5, 0.5,
3, -4.50752, -6.199068, 0, -0.5, 0.5, 0.5,
3, -4.50752, -6.199068, 1, -0.5, 0.5, 0.5,
3, -4.50752, -6.199068, 1, 1.5, 0.5, 0.5,
3, -4.50752, -6.199068, 0, 1.5, 0.5, 0.5
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
-2.895883, -3, -5.400342,
-2.895883, 3, -5.400342,
-2.895883, -3, -5.400342,
-3.057212, -3, -5.666584,
-2.895883, -2, -5.400342,
-3.057212, -2, -5.666584,
-2.895883, -1, -5.400342,
-3.057212, -1, -5.666584,
-2.895883, 0, -5.400342,
-3.057212, 0, -5.666584,
-2.895883, 1, -5.400342,
-3.057212, 1, -5.666584,
-2.895883, 2, -5.400342,
-3.057212, 2, -5.666584,
-2.895883, 3, -5.400342,
-3.057212, 3, -5.666584
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
-3.379869, -3, -6.199068, 0, -0.5, 0.5, 0.5,
-3.379869, -3, -6.199068, 1, -0.5, 0.5, 0.5,
-3.379869, -3, -6.199068, 1, 1.5, 0.5, 0.5,
-3.379869, -3, -6.199068, 0, 1.5, 0.5, 0.5,
-3.379869, -2, -6.199068, 0, -0.5, 0.5, 0.5,
-3.379869, -2, -6.199068, 1, -0.5, 0.5, 0.5,
-3.379869, -2, -6.199068, 1, 1.5, 0.5, 0.5,
-3.379869, -2, -6.199068, 0, 1.5, 0.5, 0.5,
-3.379869, -1, -6.199068, 0, -0.5, 0.5, 0.5,
-3.379869, -1, -6.199068, 1, -0.5, 0.5, 0.5,
-3.379869, -1, -6.199068, 1, 1.5, 0.5, 0.5,
-3.379869, -1, -6.199068, 0, 1.5, 0.5, 0.5,
-3.379869, 0, -6.199068, 0, -0.5, 0.5, 0.5,
-3.379869, 0, -6.199068, 1, -0.5, 0.5, 0.5,
-3.379869, 0, -6.199068, 1, 1.5, 0.5, 0.5,
-3.379869, 0, -6.199068, 0, 1.5, 0.5, 0.5,
-3.379869, 1, -6.199068, 0, -0.5, 0.5, 0.5,
-3.379869, 1, -6.199068, 1, -0.5, 0.5, 0.5,
-3.379869, 1, -6.199068, 1, 1.5, 0.5, 0.5,
-3.379869, 1, -6.199068, 0, 1.5, 0.5, 0.5,
-3.379869, 2, -6.199068, 0, -0.5, 0.5, 0.5,
-3.379869, 2, -6.199068, 1, -0.5, 0.5, 0.5,
-3.379869, 2, -6.199068, 1, 1.5, 0.5, 0.5,
-3.379869, 2, -6.199068, 0, 1.5, 0.5, 0.5,
-3.379869, 3, -6.199068, 0, -0.5, 0.5, 0.5,
-3.379869, 3, -6.199068, 1, -0.5, 0.5, 0.5,
-3.379869, 3, -6.199068, 1, 1.5, 0.5, 0.5,
-3.379869, 3, -6.199068, 0, 1.5, 0.5, 0.5
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
-2.895883, -3.97049, -4,
-2.895883, -3.97049, 4,
-2.895883, -3.97049, -4,
-3.057212, -4.1495, -4,
-2.895883, -3.97049, -2,
-3.057212, -4.1495, -2,
-2.895883, -3.97049, 0,
-3.057212, -4.1495, 0,
-2.895883, -3.97049, 2,
-3.057212, -4.1495, 2,
-2.895883, -3.97049, 4,
-3.057212, -4.1495, 4
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
-3.379869, -4.50752, -4, 0, -0.5, 0.5, 0.5,
-3.379869, -4.50752, -4, 1, -0.5, 0.5, 0.5,
-3.379869, -4.50752, -4, 1, 1.5, 0.5, 0.5,
-3.379869, -4.50752, -4, 0, 1.5, 0.5, 0.5,
-3.379869, -4.50752, -2, 0, -0.5, 0.5, 0.5,
-3.379869, -4.50752, -2, 1, -0.5, 0.5, 0.5,
-3.379869, -4.50752, -2, 1, 1.5, 0.5, 0.5,
-3.379869, -4.50752, -2, 0, 1.5, 0.5, 0.5,
-3.379869, -4.50752, 0, 0, -0.5, 0.5, 0.5,
-3.379869, -4.50752, 0, 1, -0.5, 0.5, 0.5,
-3.379869, -4.50752, 0, 1, 1.5, 0.5, 0.5,
-3.379869, -4.50752, 0, 0, 1.5, 0.5, 0.5,
-3.379869, -4.50752, 2, 0, -0.5, 0.5, 0.5,
-3.379869, -4.50752, 2, 1, -0.5, 0.5, 0.5,
-3.379869, -4.50752, 2, 1, 1.5, 0.5, 0.5,
-3.379869, -4.50752, 2, 0, 1.5, 0.5, 0.5,
-3.379869, -4.50752, 4, 0, -0.5, 0.5, 0.5,
-3.379869, -4.50752, 4, 1, -0.5, 0.5, 0.5,
-3.379869, -4.50752, 4, 1, 1.5, 0.5, 0.5,
-3.379869, -4.50752, 4, 0, 1.5, 0.5, 0.5
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
-2.895883, -3.97049, -5.400342,
-2.895883, 3.18991, -5.400342,
-2.895883, -3.97049, 5.249348,
-2.895883, 3.18991, 5.249348,
-2.895883, -3.97049, -5.400342,
-2.895883, -3.97049, 5.249348,
-2.895883, 3.18991, -5.400342,
-2.895883, 3.18991, 5.249348,
-2.895883, -3.97049, -5.400342,
3.557266, -3.97049, -5.400342,
-2.895883, -3.97049, 5.249348,
3.557266, -3.97049, 5.249348,
-2.895883, 3.18991, -5.400342,
3.557266, 3.18991, -5.400342,
-2.895883, 3.18991, 5.249348,
3.557266, 3.18991, 5.249348,
3.557266, -3.97049, -5.400342,
3.557266, 3.18991, -5.400342,
3.557266, -3.97049, 5.249348,
3.557266, 3.18991, 5.249348,
3.557266, -3.97049, -5.400342,
3.557266, -3.97049, 5.249348,
3.557266, 3.18991, -5.400342,
3.557266, 3.18991, 5.249348
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
var radius = 7.670206;
var distance = 34.12561;
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
mvMatrix.translate( -0.3306911, 0.3902899, 0.07549667 );
mvMatrix.scale( 1.285136, 1.1582, 0.7787248 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.12561);
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
oxasulfuron<-read.table("oxasulfuron.xyz")
```

```
## Error in read.table("oxasulfuron.xyz"): no lines available in input
```

```r
x<-oxasulfuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'oxasulfuron' not found
```

```r
y<-oxasulfuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'oxasulfuron' not found
```

```r
z<-oxasulfuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'oxasulfuron' not found
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
-2.801905, -0.5136986, -1.039166, 0, 0, 1, 1, 1,
-2.582564, 1.288261, -0.9097994, 1, 0, 0, 1, 1,
-2.522103, 1.224557, -1.409356, 1, 0, 0, 1, 1,
-2.483724, 0.1893367, -1.511643, 1, 0, 0, 1, 1,
-2.476965, -0.1068908, -1.974744, 1, 0, 0, 1, 1,
-2.330576, -0.246951, -2.331932, 1, 0, 0, 1, 1,
-2.233048, 0.846326, -1.01076, 0, 0, 0, 1, 1,
-2.199999, -0.6453162, -1.834772, 0, 0, 0, 1, 1,
-2.195006, -0.9968322, -0.9458299, 0, 0, 0, 1, 1,
-2.170418, -0.07452419, -2.190044, 0, 0, 0, 1, 1,
-2.157577, -1.12095, -0.5289688, 0, 0, 0, 1, 1,
-2.128964, 0.003414756, -0.5091884, 0, 0, 0, 1, 1,
-2.116788, -0.2725857, -0.5554544, 0, 0, 0, 1, 1,
-2.10218, -0.7748049, -1.488645, 1, 1, 1, 1, 1,
-2.094335, 2.075398, 0.3611266, 1, 1, 1, 1, 1,
-2.082761, 0.1069906, -0.4827168, 1, 1, 1, 1, 1,
-2.045729, -0.01141919, -1.664529, 1, 1, 1, 1, 1,
-2.034701, -0.5429874, -2.012189, 1, 1, 1, 1, 1,
-2.029366, -1.072345, -2.02119, 1, 1, 1, 1, 1,
-2.022449, 0.171165, -0.8871722, 1, 1, 1, 1, 1,
-1.991354, 0.2399035, -2.66701, 1, 1, 1, 1, 1,
-1.971411, 0.6440958, -0.2891937, 1, 1, 1, 1, 1,
-1.951518, -1.081179, -1.266985, 1, 1, 1, 1, 1,
-1.927894, -1.629587, -1.296847, 1, 1, 1, 1, 1,
-1.92137, -0.7500791, -1.554697, 1, 1, 1, 1, 1,
-1.920028, -1.52668, -0.8540146, 1, 1, 1, 1, 1,
-1.892196, 0.3106233, -2.85701, 1, 1, 1, 1, 1,
-1.888352, -2.044296, -2.441718, 1, 1, 1, 1, 1,
-1.883581, -0.5336823, -2.132812, 0, 0, 1, 1, 1,
-1.867601, 0.8113204, -0.02773647, 1, 0, 0, 1, 1,
-1.84921, -1.518574, -2.172156, 1, 0, 0, 1, 1,
-1.837742, -1.106431, -2.416977, 1, 0, 0, 1, 1,
-1.827689, 1.059319, -1.126743, 1, 0, 0, 1, 1,
-1.815866, 0.6156223, -2.462436, 1, 0, 0, 1, 1,
-1.800852, 1.08585, -0.902117, 0, 0, 0, 1, 1,
-1.792696, 0.4281833, -1.161244, 0, 0, 0, 1, 1,
-1.789494, -0.7133681, -1.696621, 0, 0, 0, 1, 1,
-1.781737, -0.8670704, -3.755055, 0, 0, 0, 1, 1,
-1.779965, 2.033056, -1.23926, 0, 0, 0, 1, 1,
-1.762805, 1.88696, -1.610767, 0, 0, 0, 1, 1,
-1.754263, 0.965342, -0.710192, 0, 0, 0, 1, 1,
-1.747462, -0.5208494, -2.102782, 1, 1, 1, 1, 1,
-1.736921, 1.675398, 0.2752328, 1, 1, 1, 1, 1,
-1.735764, 1.235057, -1.869751, 1, 1, 1, 1, 1,
-1.724485, -0.8109658, -3.259479, 1, 1, 1, 1, 1,
-1.709512, -0.3153234, -2.178185, 1, 1, 1, 1, 1,
-1.70184, 1.172698, -1.991938, 1, 1, 1, 1, 1,
-1.694729, 0.2555595, -2.442404, 1, 1, 1, 1, 1,
-1.675346, -1.184451, -4.931007, 1, 1, 1, 1, 1,
-1.667274, 0.2174345, -1.18527, 1, 1, 1, 1, 1,
-1.664183, -0.2216092, -0.9559009, 1, 1, 1, 1, 1,
-1.659302, -0.1420721, -2.018405, 1, 1, 1, 1, 1,
-1.646431, 0.2995796, -2.46313, 1, 1, 1, 1, 1,
-1.634121, -0.1138238, -3.231925, 1, 1, 1, 1, 1,
-1.613609, 0.3225659, -2.126286, 1, 1, 1, 1, 1,
-1.607616, -0.5750115, -1.674796, 1, 1, 1, 1, 1,
-1.588747, -0.9320241, -1.356212, 0, 0, 1, 1, 1,
-1.560631, 0.9069926, -3.167722, 1, 0, 0, 1, 1,
-1.560079, 1.636396, -0.9742234, 1, 0, 0, 1, 1,
-1.55707, 0.6703297, -1.791337, 1, 0, 0, 1, 1,
-1.547978, -0.3899819, -2.077724, 1, 0, 0, 1, 1,
-1.543972, -0.9483578, -1.995746, 1, 0, 0, 1, 1,
-1.525646, -0.231417, -0.8088549, 0, 0, 0, 1, 1,
-1.525337, -0.5697134, -2.45603, 0, 0, 0, 1, 1,
-1.51119, -1.338266, -3.542215, 0, 0, 0, 1, 1,
-1.509078, 1.818772, -1.522801, 0, 0, 0, 1, 1,
-1.498575, 1.066815, -1.207546, 0, 0, 0, 1, 1,
-1.495061, 2.761664, -1.180278, 0, 0, 0, 1, 1,
-1.488907, 0.8723776, -1.66737, 0, 0, 0, 1, 1,
-1.476909, 0.7108653, -1.828556, 1, 1, 1, 1, 1,
-1.474154, -0.595745, -0.06132979, 1, 1, 1, 1, 1,
-1.469322, -0.617985, -2.352731, 1, 1, 1, 1, 1,
-1.464037, 0.5113333, -1.039109, 1, 1, 1, 1, 1,
-1.463467, -1.927288, -3.901569, 1, 1, 1, 1, 1,
-1.459637, -0.6427304, -1.962601, 1, 1, 1, 1, 1,
-1.426818, -0.03926315, -2.082771, 1, 1, 1, 1, 1,
-1.425644, 0.6742201, -0.8745248, 1, 1, 1, 1, 1,
-1.416816, 0.2691917, -0.2732885, 1, 1, 1, 1, 1,
-1.40359, -1.220711, -1.474359, 1, 1, 1, 1, 1,
-1.394275, -0.3037326, -1.447745, 1, 1, 1, 1, 1,
-1.392584, -0.06198262, -2.455619, 1, 1, 1, 1, 1,
-1.390147, 0.3795392, -0.05420718, 1, 1, 1, 1, 1,
-1.38004, -1.144566, -2.396534, 1, 1, 1, 1, 1,
-1.37544, 0.3982511, 0.0925212, 1, 1, 1, 1, 1,
-1.371988, 0.8086289, -0.6414357, 0, 0, 1, 1, 1,
-1.362996, -3.866213, -2.859937, 1, 0, 0, 1, 1,
-1.359513, 0.4231753, -2.541614, 1, 0, 0, 1, 1,
-1.358298, -1.161898, -3.031872, 1, 0, 0, 1, 1,
-1.353544, -0.8250246, -2.554721, 1, 0, 0, 1, 1,
-1.349519, -0.8372377, -0.8030647, 1, 0, 0, 1, 1,
-1.348444, 0.650969, -2.094952, 0, 0, 0, 1, 1,
-1.344354, -0.1368276, -1.751111, 0, 0, 0, 1, 1,
-1.339909, -0.6440637, -2.822324, 0, 0, 0, 1, 1,
-1.338951, -0.4028843, -1.577281, 0, 0, 0, 1, 1,
-1.336746, 0.6379907, -0.4511993, 0, 0, 0, 1, 1,
-1.332152, -2.654675, -1.766232, 0, 0, 0, 1, 1,
-1.33188, 0.922819, -1.079149, 0, 0, 0, 1, 1,
-1.329598, -0.03187399, 0.3580116, 1, 1, 1, 1, 1,
-1.326384, -0.4349672, -1.772932, 1, 1, 1, 1, 1,
-1.322969, 0.6365463, -1.5288, 1, 1, 1, 1, 1,
-1.320925, -0.3004743, -1.19624, 1, 1, 1, 1, 1,
-1.319975, -2.508243, -3.215619, 1, 1, 1, 1, 1,
-1.316309, 1.251338, -0.2657222, 1, 1, 1, 1, 1,
-1.303412, 0.09934027, 1.105773, 1, 1, 1, 1, 1,
-1.287536, -1.643903, -3.956683, 1, 1, 1, 1, 1,
-1.287192, -2.062252, -4.538788, 1, 1, 1, 1, 1,
-1.286752, -0.532708, -2.675912, 1, 1, 1, 1, 1,
-1.284845, 0.3770631, -2.230277, 1, 1, 1, 1, 1,
-1.282884, -0.3168934, -1.769215, 1, 1, 1, 1, 1,
-1.274443, -1.290611, -3.285249, 1, 1, 1, 1, 1,
-1.26412, 0.09917328, -3.051936, 1, 1, 1, 1, 1,
-1.262481, 1.343448, -2.483857, 1, 1, 1, 1, 1,
-1.253119, 1.128233, -1.141884, 0, 0, 1, 1, 1,
-1.253005, -0.0131836, -0.8583513, 1, 0, 0, 1, 1,
-1.246898, 0.1810541, -0.0783123, 1, 0, 0, 1, 1,
-1.240888, -1.654768, -2.47492, 1, 0, 0, 1, 1,
-1.227887, -0.8160108, -1.77421, 1, 0, 0, 1, 1,
-1.226323, -0.9919859, -3.259968, 1, 0, 0, 1, 1,
-1.222692, 0.7684692, 0.1993227, 0, 0, 0, 1, 1,
-1.208259, -0.6873769, -3.871699, 0, 0, 0, 1, 1,
-1.202626, 1.563382, -0.07939693, 0, 0, 0, 1, 1,
-1.187006, -0.6831992, -1.740423, 0, 0, 0, 1, 1,
-1.181018, 0.394038, -2.048887, 0, 0, 0, 1, 1,
-1.166727, -0.9513088, -2.37144, 0, 0, 0, 1, 1,
-1.153042, -1.160359, -0.9514695, 0, 0, 0, 1, 1,
-1.147949, -2.228664, -1.780919, 1, 1, 1, 1, 1,
-1.141547, -0.1390702, -0.3742311, 1, 1, 1, 1, 1,
-1.140552, 1.002749, -0.7269443, 1, 1, 1, 1, 1,
-1.136652, -1.438926, -3.730883, 1, 1, 1, 1, 1,
-1.131819, 0.07216109, -1.022221, 1, 1, 1, 1, 1,
-1.125629, 0.002308374, -0.9887993, 1, 1, 1, 1, 1,
-1.121029, 0.1552342, -0.209888, 1, 1, 1, 1, 1,
-1.120652, 0.4048551, -2.383516, 1, 1, 1, 1, 1,
-1.11851, 1.870056, -0.1726835, 1, 1, 1, 1, 1,
-1.111921, 2.014077, 0.2795292, 1, 1, 1, 1, 1,
-1.108055, -1.298164, -3.033335, 1, 1, 1, 1, 1,
-1.103694, 0.9903797, -0.5939324, 1, 1, 1, 1, 1,
-1.090205, 0.2156187, 0.09285522, 1, 1, 1, 1, 1,
-1.085264, 0.4779899, -1.796246, 1, 1, 1, 1, 1,
-1.071691, 0.2892511, -1.414788, 1, 1, 1, 1, 1,
-1.068456, -0.6079041, -1.885846, 0, 0, 1, 1, 1,
-1.068181, -1.630997, -2.674494, 1, 0, 0, 1, 1,
-1.067809, -0.4973809, -1.567024, 1, 0, 0, 1, 1,
-1.06617, 0.1727259, -1.664081, 1, 0, 0, 1, 1,
-1.043396, -1.732236, -0.1738588, 1, 0, 0, 1, 1,
-1.042143, 0.2096432, -0.2269047, 1, 0, 0, 1, 1,
-1.033486, -1.466816, -2.603559, 0, 0, 0, 1, 1,
-1.029665, -0.7745228, -1.593218, 0, 0, 0, 1, 1,
-1.026569, -0.387052, -3.340078, 0, 0, 0, 1, 1,
-1.013825, 0.400708, -2.442313, 0, 0, 0, 1, 1,
-1.01274, 0.08119637, -0.9597178, 0, 0, 0, 1, 1,
-1.012043, -0.3900838, -2.720495, 0, 0, 0, 1, 1,
-1.010571, -1.543571, -2.549149, 0, 0, 0, 1, 1,
-1.009891, 1.1727, -1.477772, 1, 1, 1, 1, 1,
-0.999981, 0.3746679, -0.7320434, 1, 1, 1, 1, 1,
-0.9983703, 1.211094, -1.915976, 1, 1, 1, 1, 1,
-0.9982167, -1.472261, -1.017281, 1, 1, 1, 1, 1,
-0.9959082, 0.8920062, 0.1160672, 1, 1, 1, 1, 1,
-0.9949844, 0.9302716, 0.1772833, 1, 1, 1, 1, 1,
-0.9819248, -0.3559534, -1.410211, 1, 1, 1, 1, 1,
-0.977681, -1.592371, -3.400567, 1, 1, 1, 1, 1,
-0.9693216, 0.07470359, -1.281014, 1, 1, 1, 1, 1,
-0.9690608, 2.131736, -1.889821, 1, 1, 1, 1, 1,
-0.96775, 0.8130019, -0.02770436, 1, 1, 1, 1, 1,
-0.9660932, -0.2772848, -1.554474, 1, 1, 1, 1, 1,
-0.9652097, 0.2415318, -1.31574, 1, 1, 1, 1, 1,
-0.9634931, 0.7787557, -0.5934482, 1, 1, 1, 1, 1,
-0.9618387, -0.6466917, -2.177008, 1, 1, 1, 1, 1,
-0.9585015, 1.242234, 0.2978449, 0, 0, 1, 1, 1,
-0.9549396, -0.9395564, -1.493731, 1, 0, 0, 1, 1,
-0.9547917, 0.3471026, -0.4582221, 1, 0, 0, 1, 1,
-0.9506804, 0.4268337, -2.631611, 1, 0, 0, 1, 1,
-0.9479423, 1.216666, -1.060827, 1, 0, 0, 1, 1,
-0.9352184, 0.5531737, -0.3073615, 1, 0, 0, 1, 1,
-0.933647, 0.3963476, -1.49082, 0, 0, 0, 1, 1,
-0.9304439, 0.6173451, -2.431923, 0, 0, 0, 1, 1,
-0.9271542, 0.08719249, -1.793538, 0, 0, 0, 1, 1,
-0.9267783, -0.4305709, -2.537241, 0, 0, 0, 1, 1,
-0.9265014, 1.158564, -1.030015, 0, 0, 0, 1, 1,
-0.9227506, -0.4738836, -1.110265, 0, 0, 0, 1, 1,
-0.9214453, -1.13199, -2.354283, 0, 0, 0, 1, 1,
-0.917553, 1.094435, 0.5344786, 1, 1, 1, 1, 1,
-0.9165506, -0.08188459, -1.089156, 1, 1, 1, 1, 1,
-0.9144779, 0.1061476, -1.696172, 1, 1, 1, 1, 1,
-0.9063635, 0.306788, -0.6969917, 1, 1, 1, 1, 1,
-0.8996221, -0.1181158, -1.456106, 1, 1, 1, 1, 1,
-0.8969358, 1.692795, -0.8990526, 1, 1, 1, 1, 1,
-0.8943677, -0.625556, -3.570027, 1, 1, 1, 1, 1,
-0.8927462, -1.152699, -4.774886, 1, 1, 1, 1, 1,
-0.8871772, 0.03786047, -2.351647, 1, 1, 1, 1, 1,
-0.8860532, -1.433362, -2.154709, 1, 1, 1, 1, 1,
-0.8777202, -0.2191587, -2.18613, 1, 1, 1, 1, 1,
-0.8717769, 0.3584729, 0.01255294, 1, 1, 1, 1, 1,
-0.8709915, -0.05117591, -2.477946, 1, 1, 1, 1, 1,
-0.867559, 1.494725, -1.418927, 1, 1, 1, 1, 1,
-0.8647111, 1.702689, -1.222245, 1, 1, 1, 1, 1,
-0.8636796, 0.3343091, -1.12546, 0, 0, 1, 1, 1,
-0.8621935, 1.867786, 1.680848, 1, 0, 0, 1, 1,
-0.8608921, 0.1287598, -0.8363053, 1, 0, 0, 1, 1,
-0.8597289, -1.564535, -1.778167, 1, 0, 0, 1, 1,
-0.8592396, -1.364037, -2.227585, 1, 0, 0, 1, 1,
-0.8567407, -1.657476, -1.965691, 1, 0, 0, 1, 1,
-0.8530976, 0.5878202, -2.096027, 0, 0, 0, 1, 1,
-0.8527117, -1.335946, -2.409781, 0, 0, 0, 1, 1,
-0.8468608, 1.083905, -1.117888, 0, 0, 0, 1, 1,
-0.8456708, -0.1445173, -2.363592, 0, 0, 0, 1, 1,
-0.8435095, -0.03110505, -1.084401, 0, 0, 0, 1, 1,
-0.8421241, 0.1384137, -0.748677, 0, 0, 0, 1, 1,
-0.841861, -0.4000858, -3.556773, 0, 0, 0, 1, 1,
-0.8387399, 0.901604, -0.1827149, 1, 1, 1, 1, 1,
-0.8368441, -0.813023, -2.153107, 1, 1, 1, 1, 1,
-0.8367884, -0.6461661, -3.023387, 1, 1, 1, 1, 1,
-0.835279, -0.9852111, -5.245249, 1, 1, 1, 1, 1,
-0.8293523, -1.220759, -3.02989, 1, 1, 1, 1, 1,
-0.8042498, 0.02427146, -0.5918813, 1, 1, 1, 1, 1,
-0.7960166, 0.3934962, -0.8925048, 1, 1, 1, 1, 1,
-0.7912268, 1.399737, -1.648419, 1, 1, 1, 1, 1,
-0.7900273, -1.999607, -2.240211, 1, 1, 1, 1, 1,
-0.7828613, -1.452795, -3.075255, 1, 1, 1, 1, 1,
-0.7825481, -1.19999, -2.857871, 1, 1, 1, 1, 1,
-0.7791256, 1.589764, -0.5760839, 1, 1, 1, 1, 1,
-0.7775913, -0.04765372, -1.565472, 1, 1, 1, 1, 1,
-0.777482, -0.5445443, -0.8918118, 1, 1, 1, 1, 1,
-0.7703664, -0.7524374, -2.525325, 1, 1, 1, 1, 1,
-0.7647515, 0.5363725, -1.412803, 0, 0, 1, 1, 1,
-0.7637992, -1.168829, -1.634121, 1, 0, 0, 1, 1,
-0.7600498, 0.1418238, -2.062019, 1, 0, 0, 1, 1,
-0.7585726, -1.235286, -0.01114212, 1, 0, 0, 1, 1,
-0.7567652, 1.324765, -1.869684, 1, 0, 0, 1, 1,
-0.7564915, -1.504656, -3.725314, 1, 0, 0, 1, 1,
-0.7563215, -0.1552588, -1.88917, 0, 0, 0, 1, 1,
-0.7559351, -2.314389, -2.886254, 0, 0, 0, 1, 1,
-0.7512216, 0.2264145, -2.040818, 0, 0, 0, 1, 1,
-0.7501089, 1.053413, -1.436204, 0, 0, 0, 1, 1,
-0.7489018, -2.040229, -2.579403, 0, 0, 0, 1, 1,
-0.743924, 1.035904, 0.2132301, 0, 0, 0, 1, 1,
-0.7431793, 1.260919, -1.545028, 0, 0, 0, 1, 1,
-0.7418656, -0.5878677, -2.234904, 1, 1, 1, 1, 1,
-0.7416543, 0.8201705, -1.550556, 1, 1, 1, 1, 1,
-0.7414507, -0.9626852, -2.870526, 1, 1, 1, 1, 1,
-0.7388115, -0.04412883, -1.350905, 1, 1, 1, 1, 1,
-0.7310698, -0.9132989, -1.740965, 1, 1, 1, 1, 1,
-0.7289668, 0.8946861, -1.270211, 1, 1, 1, 1, 1,
-0.7182021, 1.143226, -1.658773, 1, 1, 1, 1, 1,
-0.7178442, 0.6017764, -0.7725973, 1, 1, 1, 1, 1,
-0.7143322, -0.02744511, -1.170816, 1, 1, 1, 1, 1,
-0.713695, -0.7745516, -1.597187, 1, 1, 1, 1, 1,
-0.7126323, -0.1577878, -2.001499, 1, 1, 1, 1, 1,
-0.7114565, -0.4799935, -2.341655, 1, 1, 1, 1, 1,
-0.7046108, -1.163899, -1.849541, 1, 1, 1, 1, 1,
-0.6955173, 1.985029, -0.3371783, 1, 1, 1, 1, 1,
-0.6950209, 0.1533288, -2.954357, 1, 1, 1, 1, 1,
-0.6940203, 0.4396797, 0.2073143, 0, 0, 1, 1, 1,
-0.6936202, 0.04539706, -1.813391, 1, 0, 0, 1, 1,
-0.6916403, 1.118643, -1.572459, 1, 0, 0, 1, 1,
-0.6876072, -1.63334, -4.886124, 1, 0, 0, 1, 1,
-0.6864963, -0.1792438, -0.9137124, 1, 0, 0, 1, 1,
-0.6861848, 0.8592244, -0.5988063, 1, 0, 0, 1, 1,
-0.6846877, -0.1154811, -1.31723, 0, 0, 0, 1, 1,
-0.6832377, 0.169966, -1.101192, 0, 0, 0, 1, 1,
-0.679979, -0.9262052, -0.8295894, 0, 0, 0, 1, 1,
-0.6779377, -3.062645, -3.266255, 0, 0, 0, 1, 1,
-0.6758762, 0.4176797, -2.045768, 0, 0, 0, 1, 1,
-0.6705341, 0.1182705, -0.6173502, 0, 0, 0, 1, 1,
-0.6644278, -0.78653, -2.216642, 0, 0, 0, 1, 1,
-0.6582687, 0.2574949, -2.868376, 1, 1, 1, 1, 1,
-0.6536088, -0.9449042, -3.910484, 1, 1, 1, 1, 1,
-0.6533664, -0.5080651, -1.066569, 1, 1, 1, 1, 1,
-0.6515256, 0.3818271, -1.115278, 1, 1, 1, 1, 1,
-0.6427406, 1.011697, 0.7884324, 1, 1, 1, 1, 1,
-0.6426816, 0.1468047, -1.068407, 1, 1, 1, 1, 1,
-0.6423515, 0.9533014, 1.752018, 1, 1, 1, 1, 1,
-0.635333, -0.7519969, -2.335974, 1, 1, 1, 1, 1,
-0.6334648, 0.342898, -1.290221, 1, 1, 1, 1, 1,
-0.6331393, -1.024439, -2.49879, 1, 1, 1, 1, 1,
-0.6239167, 0.07194193, -2.688497, 1, 1, 1, 1, 1,
-0.6204655, -0.4795542, -2.731156, 1, 1, 1, 1, 1,
-0.6157937, -0.6429447, -2.156513, 1, 1, 1, 1, 1,
-0.614455, -0.1831826, -3.547629, 1, 1, 1, 1, 1,
-0.6108427, -0.08430224, -1.252241, 1, 1, 1, 1, 1,
-0.6091508, 0.7973518, -0.9827111, 0, 0, 1, 1, 1,
-0.6076386, 0.538381, 0.6765063, 1, 0, 0, 1, 1,
-0.6025386, -0.0496287, -1.146787, 1, 0, 0, 1, 1,
-0.5985729, -1.137346, -2.494621, 1, 0, 0, 1, 1,
-0.5980074, 1.08374, -1.686327, 1, 0, 0, 1, 1,
-0.5971166, 1.18769, -0.2584446, 1, 0, 0, 1, 1,
-0.5968344, 0.1905157, -0.8412587, 0, 0, 0, 1, 1,
-0.5966004, -0.03816017, -2.220942, 0, 0, 0, 1, 1,
-0.5931832, 1.444669, -0.03388543, 0, 0, 0, 1, 1,
-0.5854736, 0.02403277, -1.591451, 0, 0, 0, 1, 1,
-0.5805272, 0.2953446, -2.959863, 0, 0, 0, 1, 1,
-0.5788742, 1.624033, -0.7057286, 0, 0, 0, 1, 1,
-0.5778971, 1.243039, 0.2214199, 0, 0, 0, 1, 1,
-0.5765127, -0.6062001, -2.201539, 1, 1, 1, 1, 1,
-0.5691349, 1.02221, -0.8772351, 1, 1, 1, 1, 1,
-0.5674327, 1.54861, -0.1601568, 1, 1, 1, 1, 1,
-0.5638745, -0.6081099, -1.596872, 1, 1, 1, 1, 1,
-0.5610715, -0.5627306, -3.637279, 1, 1, 1, 1, 1,
-0.5607442, -1.034617, -1.733973, 1, 1, 1, 1, 1,
-0.5601175, -2.095483, -2.227415, 1, 1, 1, 1, 1,
-0.5579818, 0.4742287, -0.4196858, 1, 1, 1, 1, 1,
-0.5526268, 1.286909, -0.6798455, 1, 1, 1, 1, 1,
-0.5465677, -0.5208356, -0.5619404, 1, 1, 1, 1, 1,
-0.5431354, -0.333456, -0.2131611, 1, 1, 1, 1, 1,
-0.5417755, 1.72587, -0.5196596, 1, 1, 1, 1, 1,
-0.5391325, 0.7156237, -1.314993, 1, 1, 1, 1, 1,
-0.5334826, 0.1993295, -0.2000798, 1, 1, 1, 1, 1,
-0.5302979, -2.143345, -3.48554, 1, 1, 1, 1, 1,
-0.5284111, -2.004822, -3.827209, 0, 0, 1, 1, 1,
-0.5280139, -0.9915829, -3.146636, 1, 0, 0, 1, 1,
-0.5156477, 0.04452197, -1.04629, 1, 0, 0, 1, 1,
-0.5084525, -0.2241305, -0.7998918, 1, 0, 0, 1, 1,
-0.5079562, 0.2737393, -0.553256, 1, 0, 0, 1, 1,
-0.5073913, 0.4406395, 0.0565761, 1, 0, 0, 1, 1,
-0.5067027, -1.185961, -2.485588, 0, 0, 0, 1, 1,
-0.504559, -1.221618, -3.73463, 0, 0, 0, 1, 1,
-0.49327, -0.3514417, -1.67575, 0, 0, 0, 1, 1,
-0.4925525, 0.9535421, -1.527436, 0, 0, 0, 1, 1,
-0.4922854, 0.6377982, 1.160157, 0, 0, 0, 1, 1,
-0.4849417, -0.1820504, -0.07099804, 0, 0, 0, 1, 1,
-0.4783327, -0.7830122, -3.144161, 0, 0, 0, 1, 1,
-0.4779533, -0.3673342, -2.556786, 1, 1, 1, 1, 1,
-0.4745312, -1.309473, -0.8593218, 1, 1, 1, 1, 1,
-0.4724391, 0.7296144, -1.421078, 1, 1, 1, 1, 1,
-0.4693485, 1.051079, 0.3219385, 1, 1, 1, 1, 1,
-0.4646164, -0.949156, -1.515612, 1, 1, 1, 1, 1,
-0.4642897, -0.09861489, -2.464553, 1, 1, 1, 1, 1,
-0.461903, -0.0173251, -0.600354, 1, 1, 1, 1, 1,
-0.4607482, -0.3712384, -2.60704, 1, 1, 1, 1, 1,
-0.4584028, 0.3845666, 1.708383, 1, 1, 1, 1, 1,
-0.4579329, -1.296702, -2.210331, 1, 1, 1, 1, 1,
-0.4560228, 0.4683709, -0.2252732, 1, 1, 1, 1, 1,
-0.4549712, -0.916813, -3.545443, 1, 1, 1, 1, 1,
-0.4519063, 0.4308633, -0.445271, 1, 1, 1, 1, 1,
-0.4474575, -0.06356816, -2.163011, 1, 1, 1, 1, 1,
-0.447394, 2.042076, -0.4550347, 1, 1, 1, 1, 1,
-0.4426259, -0.2023731, -2.738682, 0, 0, 1, 1, 1,
-0.441876, 0.828789, 0.03425986, 1, 0, 0, 1, 1,
-0.440349, -0.7644274, -2.845561, 1, 0, 0, 1, 1,
-0.4389748, 0.9189821, -2.288658, 1, 0, 0, 1, 1,
-0.436366, 0.4169217, -0.4512245, 1, 0, 0, 1, 1,
-0.4357411, 0.3950979, -0.3113777, 1, 0, 0, 1, 1,
-0.4340345, -2.421278, -3.588999, 0, 0, 0, 1, 1,
-0.4314188, -1.432172, -0.7858989, 0, 0, 0, 1, 1,
-0.4297688, 0.02840254, -2.214706, 0, 0, 0, 1, 1,
-0.4266095, -0.565044, -2.601525, 0, 0, 0, 1, 1,
-0.4250646, -0.3882385, -2.572407, 0, 0, 0, 1, 1,
-0.4250285, 0.0300512, -1.817998, 0, 0, 0, 1, 1,
-0.4245127, 1.083173, 0.2083131, 0, 0, 0, 1, 1,
-0.4239126, -0.3938937, -2.333011, 1, 1, 1, 1, 1,
-0.4197543, 0.3908934, -2.140431, 1, 1, 1, 1, 1,
-0.4173992, -0.07751008, -1.390425, 1, 1, 1, 1, 1,
-0.417006, -1.521998, -3.788144, 1, 1, 1, 1, 1,
-0.4157379, -0.5589376, -3.549592, 1, 1, 1, 1, 1,
-0.4138753, 0.6095986, -1.05268, 1, 1, 1, 1, 1,
-0.4079051, -0.2661994, -1.87511, 1, 1, 1, 1, 1,
-0.4053825, -0.5453686, -0.5241291, 1, 1, 1, 1, 1,
-0.4053603, 0.04565017, -1.150519, 1, 1, 1, 1, 1,
-0.4047695, -0.6148307, -3.875304, 1, 1, 1, 1, 1,
-0.4045598, -0.7723148, -2.118176, 1, 1, 1, 1, 1,
-0.4036811, -0.7741927, -2.255709, 1, 1, 1, 1, 1,
-0.4034306, -0.7785457, -2.506657, 1, 1, 1, 1, 1,
-0.394467, 0.5887657, 0.02729984, 1, 1, 1, 1, 1,
-0.3916714, -0.2861693, -3.699098, 1, 1, 1, 1, 1,
-0.3872219, 1.280746, -0.5813473, 0, 0, 1, 1, 1,
-0.3858713, 0.2616642, -0.6814276, 1, 0, 0, 1, 1,
-0.3803964, -0.1025086, -0.1796067, 1, 0, 0, 1, 1,
-0.3778732, -0.1413263, -3.673766, 1, 0, 0, 1, 1,
-0.3705737, -0.1344014, -2.189327, 1, 0, 0, 1, 1,
-0.369165, -0.2423696, -1.423035, 1, 0, 0, 1, 1,
-0.3682011, 0.7969568, 0.03145754, 0, 0, 0, 1, 1,
-0.3667594, -2.704278, -3.215717, 0, 0, 0, 1, 1,
-0.3666261, 0.8810263, 1.410834, 0, 0, 0, 1, 1,
-0.3659387, -0.02948081, -1.601215, 0, 0, 0, 1, 1,
-0.3654489, -0.8873489, -3.129295, 0, 0, 0, 1, 1,
-0.3624925, 0.3542995, -0.3207678, 0, 0, 0, 1, 1,
-0.3607369, 1.244442, -0.5040166, 0, 0, 0, 1, 1,
-0.3578303, 0.4475656, -1.212257, 1, 1, 1, 1, 1,
-0.3560318, -0.09311408, -0.3704998, 1, 1, 1, 1, 1,
-0.3553827, 0.07064868, -1.252602, 1, 1, 1, 1, 1,
-0.3482691, -0.9369848, -4.074762, 1, 1, 1, 1, 1,
-0.34709, 1.335323, 0.9064025, 1, 1, 1, 1, 1,
-0.3399459, 0.8608243, -0.1596358, 1, 1, 1, 1, 1,
-0.3316357, 0.6546673, -2.772921, 1, 1, 1, 1, 1,
-0.3306605, 0.2177263, -0.4788284, 1, 1, 1, 1, 1,
-0.3300053, 0.7101082, 1.120545, 1, 1, 1, 1, 1,
-0.328647, -1.266266, -1.672262, 1, 1, 1, 1, 1,
-0.3274561, -0.1840514, -2.272804, 1, 1, 1, 1, 1,
-0.3265391, -0.8912608, 0.01395099, 1, 1, 1, 1, 1,
-0.3264245, 0.6964375, -0.5310498, 1, 1, 1, 1, 1,
-0.3241902, -0.5771952, -3.699891, 1, 1, 1, 1, 1,
-0.3239321, 0.3731901, -0.6299939, 1, 1, 1, 1, 1,
-0.3167314, 0.4305445, 0.7553135, 0, 0, 1, 1, 1,
-0.3144531, -0.07419594, 0.7011141, 1, 0, 0, 1, 1,
-0.3107438, -0.2440554, -1.542241, 1, 0, 0, 1, 1,
-0.3071258, -1.652072, -3.234127, 1, 0, 0, 1, 1,
-0.3059077, 2.910279, -1.783504, 1, 0, 0, 1, 1,
-0.2948165, 0.2461822, 1.150744, 1, 0, 0, 1, 1,
-0.2908506, -1.461975, -1.884311, 0, 0, 0, 1, 1,
-0.2896845, 1.000176, -0.9603797, 0, 0, 0, 1, 1,
-0.288695, -1.357575, -3.184516, 0, 0, 0, 1, 1,
-0.2882857, -0.7543213, -2.16905, 0, 0, 0, 1, 1,
-0.2875793, -0.8826534, -2.379149, 0, 0, 0, 1, 1,
-0.2866696, 1.768671, 1.276425, 0, 0, 0, 1, 1,
-0.281527, 0.2727738, 0.5912357, 0, 0, 0, 1, 1,
-0.2804983, -0.2167723, -3.064955, 1, 1, 1, 1, 1,
-0.2791678, -0.09002686, -1.766874, 1, 1, 1, 1, 1,
-0.2728671, -0.3737939, -2.116772, 1, 1, 1, 1, 1,
-0.2717885, 0.5918907, 1.301024, 1, 1, 1, 1, 1,
-0.263256, -0.449498, -0.7341473, 1, 1, 1, 1, 1,
-0.263162, 0.5497169, 0.5938229, 1, 1, 1, 1, 1,
-0.263002, 1.830771, 0.4633626, 1, 1, 1, 1, 1,
-0.257777, -0.5972687, -2.661865, 1, 1, 1, 1, 1,
-0.2553828, 0.3759522, -1.65637, 1, 1, 1, 1, 1,
-0.2552944, -2.614664, -3.822599, 1, 1, 1, 1, 1,
-0.2541288, -1.422944, -5.095712, 1, 1, 1, 1, 1,
-0.2538007, 0.1525691, -1.007354, 1, 1, 1, 1, 1,
-0.2530688, 0.605763, -0.9086876, 1, 1, 1, 1, 1,
-0.2527572, 0.8058868, -0.190302, 1, 1, 1, 1, 1,
-0.2517362, 1.259382, 0.6789473, 1, 1, 1, 1, 1,
-0.2504482, -0.7658813, -3.902181, 0, 0, 1, 1, 1,
-0.249534, -0.3181059, -4.721906, 1, 0, 0, 1, 1,
-0.2441578, -3.833691, -4.060811, 1, 0, 0, 1, 1,
-0.2434631, 2.384668, 0.9729189, 1, 0, 0, 1, 1,
-0.2433981, 1.594019, 0.257134, 1, 0, 0, 1, 1,
-0.2389088, 2.52618, -0.5229748, 1, 0, 0, 1, 1,
-0.2370651, -0.1963528, -1.139198, 0, 0, 0, 1, 1,
-0.2318947, 0.6608804, -1.48353, 0, 0, 0, 1, 1,
-0.2317565, -0.6625395, -2.146825, 0, 0, 0, 1, 1,
-0.2278551, -1.297725, -2.388971, 0, 0, 0, 1, 1,
-0.2239743, -0.3375042, -3.516193, 0, 0, 0, 1, 1,
-0.2231115, -1.166182, -3.210158, 0, 0, 0, 1, 1,
-0.2175858, 0.4340558, -1.412531, 0, 0, 0, 1, 1,
-0.2172906, 0.08941245, -3.512772, 1, 1, 1, 1, 1,
-0.2166137, 1.183778, -2.268844, 1, 1, 1, 1, 1,
-0.2092798, 0.2127306, -0.4443948, 1, 1, 1, 1, 1,
-0.2033162, -0.4021024, -1.842165, 1, 1, 1, 1, 1,
-0.1941694, -0.3740578, -2.167794, 1, 1, 1, 1, 1,
-0.1931394, -0.8584387, -3.457655, 1, 1, 1, 1, 1,
-0.1925277, -0.9581654, -5.060619, 1, 1, 1, 1, 1,
-0.1920668, -0.1298649, -2.555147, 1, 1, 1, 1, 1,
-0.1794465, -0.862038, -4.6027, 1, 1, 1, 1, 1,
-0.1783787, -1.772935, -2.865648, 1, 1, 1, 1, 1,
-0.1751245, -0.08735471, -1.646396, 1, 1, 1, 1, 1,
-0.1731093, 0.528649, 1.508227, 1, 1, 1, 1, 1,
-0.1671697, 0.5293628, -0.2151708, 1, 1, 1, 1, 1,
-0.1586199, 0.08658686, -2.755038, 1, 1, 1, 1, 1,
-0.158318, 0.03856226, -1.416101, 1, 1, 1, 1, 1,
-0.1559773, -0.3033324, -2.619678, 0, 0, 1, 1, 1,
-0.1543638, -0.4223729, -1.619857, 1, 0, 0, 1, 1,
-0.1516535, 0.123599, -0.7082064, 1, 0, 0, 1, 1,
-0.1487544, 0.8774903, 0.3659943, 1, 0, 0, 1, 1,
-0.143267, 0.2098246, -2.9327, 1, 0, 0, 1, 1,
-0.1407604, -0.4184134, -3.900205, 1, 0, 0, 1, 1,
-0.140365, 0.04210941, -1.76202, 0, 0, 0, 1, 1,
-0.1307057, -1.417878, -3.119373, 0, 0, 0, 1, 1,
-0.1297742, -0.3441515, -2.269652, 0, 0, 0, 1, 1,
-0.1268453, -0.8775194, -2.628656, 0, 0, 0, 1, 1,
-0.1254482, 1.215864, -0.4910285, 0, 0, 0, 1, 1,
-0.1253823, -0.4693655, -2.670533, 0, 0, 0, 1, 1,
-0.1210312, 0.05219217, -0.167981, 0, 0, 0, 1, 1,
-0.1186571, -0.2416378, -1.216207, 1, 1, 1, 1, 1,
-0.1184286, -0.7804118, -4.517951, 1, 1, 1, 1, 1,
-0.1095572, 0.169593, -1.475762, 1, 1, 1, 1, 1,
-0.109095, -0.1511999, -1.287167, 1, 1, 1, 1, 1,
-0.1088444, 0.06671193, -0.7909738, 1, 1, 1, 1, 1,
-0.1081245, -1.255929, -3.550683, 1, 1, 1, 1, 1,
-0.1042815, 0.2704853, -2.228628, 1, 1, 1, 1, 1,
-0.1032495, 0.08642634, 0.852583, 1, 1, 1, 1, 1,
-0.1027381, -0.9108384, -2.008027, 1, 1, 1, 1, 1,
-0.1017577, -0.9444177, -2.097366, 1, 1, 1, 1, 1,
-0.1010819, 0.3208354, -0.07396778, 1, 1, 1, 1, 1,
-0.09765773, -0.1892988, -2.793181, 1, 1, 1, 1, 1,
-0.09307841, 1.008911, 0.7019113, 1, 1, 1, 1, 1,
-0.09303663, -0.59804, -2.282967, 1, 1, 1, 1, 1,
-0.09080163, 0.1801264, -2.104519, 1, 1, 1, 1, 1,
-0.09037638, 0.7606261, 2.547882, 0, 0, 1, 1, 1,
-0.08600925, 0.920288, 1.274235, 1, 0, 0, 1, 1,
-0.08551021, -0.09859671, -1.374995, 1, 0, 0, 1, 1,
-0.0818164, -0.7308474, -2.806854, 1, 0, 0, 1, 1,
-0.07925034, -0.1401824, -1.615425, 1, 0, 0, 1, 1,
-0.07840174, -0.08974856, -1.774575, 1, 0, 0, 1, 1,
-0.07799668, -0.2262733, -3.533072, 0, 0, 0, 1, 1,
-0.07672311, 0.02529818, -0.8167362, 0, 0, 0, 1, 1,
-0.07270334, 0.9431584, -0.5526869, 0, 0, 0, 1, 1,
-0.07134458, 1.098546, 1.362752, 0, 0, 0, 1, 1,
-0.070247, -0.2258089, -3.269551, 0, 0, 0, 1, 1,
-0.06933898, 1.587562, 0.01246376, 0, 0, 0, 1, 1,
-0.06755551, -0.9652616, -2.836106, 0, 0, 0, 1, 1,
-0.06652143, 1.961977, 0.5018669, 1, 1, 1, 1, 1,
-0.06510302, -0.1282741, -4.992521, 1, 1, 1, 1, 1,
-0.06504456, -0.7928922, -2.848363, 1, 1, 1, 1, 1,
-0.06053782, -0.2192961, -4.453808, 1, 1, 1, 1, 1,
-0.05668862, 0.9349052, 0.4094262, 1, 1, 1, 1, 1,
-0.05131116, -1.222374, -3.95318, 1, 1, 1, 1, 1,
-0.0506219, -0.1097587, -0.7793533, 1, 1, 1, 1, 1,
-0.04919292, -0.4480585, -1.728014, 1, 1, 1, 1, 1,
-0.04708711, 0.9628137, 1.212296, 1, 1, 1, 1, 1,
-0.04471565, -0.1864185, -1.78151, 1, 1, 1, 1, 1,
-0.04185992, 0.09847122, 0.2277806, 1, 1, 1, 1, 1,
-0.04174965, -0.459236, -2.969512, 1, 1, 1, 1, 1,
-0.03893724, 0.3255511, 0.2276006, 1, 1, 1, 1, 1,
-0.03333328, -0.9638201, -3.191102, 1, 1, 1, 1, 1,
-0.03194129, 1.651792, 1.102701, 1, 1, 1, 1, 1,
-0.03057099, -0.07930706, 0.2957429, 0, 0, 1, 1, 1,
-0.03022418, 0.3581496, 1.499761, 1, 0, 0, 1, 1,
-0.02875636, 1.829108, 1.12694, 1, 0, 0, 1, 1,
-0.02829515, 1.090649, -0.1463941, 1, 0, 0, 1, 1,
-0.02800127, 0.1958132, -1.171101, 1, 0, 0, 1, 1,
-0.02610596, -0.4765306, -2.196949, 1, 0, 0, 1, 1,
-0.02420233, -0.3026005, -2.76089, 0, 0, 0, 1, 1,
-0.01949522, -0.8824797, -3.806377, 0, 0, 0, 1, 1,
-0.01592553, 0.4233226, 1.404432, 0, 0, 0, 1, 1,
-0.009218683, 0.3172856, -1.962742, 0, 0, 0, 1, 1,
-0.005726707, 0.2769901, 0.4694794, 0, 0, 0, 1, 1,
0.01392468, 1.130592, 0.06076822, 0, 0, 0, 1, 1,
0.01397308, 0.2667866, -0.9599192, 0, 0, 0, 1, 1,
0.0150163, 0.1350273, 1.152093, 1, 1, 1, 1, 1,
0.0151276, 0.107377, 1.443782, 1, 1, 1, 1, 1,
0.0299872, 0.8493353, 0.3083382, 1, 1, 1, 1, 1,
0.03098448, -2.169127, 1.887218, 1, 1, 1, 1, 1,
0.0319383, 0.6561577, -0.00716442, 1, 1, 1, 1, 1,
0.03236587, 0.1476063, -0.247462, 1, 1, 1, 1, 1,
0.03649173, -0.7434891, 4.331903, 1, 1, 1, 1, 1,
0.03890419, 0.5926899, 0.7899649, 1, 1, 1, 1, 1,
0.03897203, -0.8103617, 3.32317, 1, 1, 1, 1, 1,
0.03947567, 0.6902416, 0.04834217, 1, 1, 1, 1, 1,
0.04220275, 1.020685, -0.5554233, 1, 1, 1, 1, 1,
0.04475345, -0.1331274, 3.557642, 1, 1, 1, 1, 1,
0.05592996, -1.22894, 3.168397, 1, 1, 1, 1, 1,
0.05829642, -2.00012, 4.134238, 1, 1, 1, 1, 1,
0.06245514, 0.3750048, -0.109591, 1, 1, 1, 1, 1,
0.06286717, -1.079976, 1.252833, 0, 0, 1, 1, 1,
0.06465641, 0.4435607, -0.959349, 1, 0, 0, 1, 1,
0.06849956, -0.1091589, 2.749874, 1, 0, 0, 1, 1,
0.06889939, 0.1066847, 1.001252, 1, 0, 0, 1, 1,
0.07025691, -1.103791, 4.281216, 1, 0, 0, 1, 1,
0.07075717, -0.5225559, 3.750142, 1, 0, 0, 1, 1,
0.07323894, 3.085633, -0.1575316, 0, 0, 0, 1, 1,
0.0739115, 0.2069524, 1.61931, 0, 0, 0, 1, 1,
0.0791295, 0.7634665, 0.0697107, 0, 0, 0, 1, 1,
0.07957741, 0.1853774, -0.237705, 0, 0, 0, 1, 1,
0.08359586, -0.1844566, 1.530486, 0, 0, 0, 1, 1,
0.08733235, 1.197031, -0.04776113, 0, 0, 0, 1, 1,
0.09237567, -1.149591, 4.292022, 0, 0, 0, 1, 1,
0.09275422, -0.1304821, 1.684631, 1, 1, 1, 1, 1,
0.0965071, -1.619878, 2.107301, 1, 1, 1, 1, 1,
0.09777912, 0.1039894, -0.1794894, 1, 1, 1, 1, 1,
0.1027712, -0.9581278, 2.057208, 1, 1, 1, 1, 1,
0.1031549, 1.695821, 0.8451583, 1, 1, 1, 1, 1,
0.106682, 1.02522, 0.9678049, 1, 1, 1, 1, 1,
0.109562, -1.46665, 3.861802, 1, 1, 1, 1, 1,
0.1124093, 0.6539325, -0.2085954, 1, 1, 1, 1, 1,
0.112667, -2.332931, 4.335453, 1, 1, 1, 1, 1,
0.1128125, 0.06539252, 2.384416, 1, 1, 1, 1, 1,
0.1156173, 0.7087716, 1.316164, 1, 1, 1, 1, 1,
0.1161099, -1.016748, 3.893239, 1, 1, 1, 1, 1,
0.1204502, -0.2437925, 3.190136, 1, 1, 1, 1, 1,
0.1218856, -0.2250558, 1.570786, 1, 1, 1, 1, 1,
0.1227886, -0.7056265, 2.992111, 1, 1, 1, 1, 1,
0.1231018, 0.1271518, 2.094544, 0, 0, 1, 1, 1,
0.1235901, 0.4401653, 0.76909, 1, 0, 0, 1, 1,
0.1250602, 1.570849, 0.1283066, 1, 0, 0, 1, 1,
0.1258788, -1.260037, 4.548701, 1, 0, 0, 1, 1,
0.1287618, -0.6628025, 3.97309, 1, 0, 0, 1, 1,
0.1338478, -2.489697, 2.677484, 1, 0, 0, 1, 1,
0.1354229, -0.149401, 2.066597, 0, 0, 0, 1, 1,
0.1372201, -1.23788, 2.611928, 0, 0, 0, 1, 1,
0.1410563, -0.9252244, 4.2713, 0, 0, 0, 1, 1,
0.1412145, 0.9702922, 0.2281536, 0, 0, 0, 1, 1,
0.1440581, 0.1861855, -0.5659574, 0, 0, 0, 1, 1,
0.1505441, -0.06732063, 3.532318, 0, 0, 0, 1, 1,
0.1514486, 0.6437309, -0.6943656, 0, 0, 0, 1, 1,
0.1594259, -1.101521, 2.579658, 1, 1, 1, 1, 1,
0.1612698, -0.3583576, 2.728466, 1, 1, 1, 1, 1,
0.1649141, -0.7900053, 3.040151, 1, 1, 1, 1, 1,
0.1695896, -2.796667, 2.721199, 1, 1, 1, 1, 1,
0.1708631, -0.1206619, 0.5429265, 1, 1, 1, 1, 1,
0.1725758, -0.08537102, 2.846877, 1, 1, 1, 1, 1,
0.1730592, -0.4060032, 1.093004, 1, 1, 1, 1, 1,
0.1755299, -0.52437, 3.487072, 1, 1, 1, 1, 1,
0.1756587, -0.6956953, 3.408525, 1, 1, 1, 1, 1,
0.1782573, 1.384796, 0.7781918, 1, 1, 1, 1, 1,
0.180988, 0.2765483, 1.448764, 1, 1, 1, 1, 1,
0.1820147, 0.3727493, 1.381909, 1, 1, 1, 1, 1,
0.184581, 0.4651991, 2.11954, 1, 1, 1, 1, 1,
0.1888881, 2.768826, -0.245524, 1, 1, 1, 1, 1,
0.1894841, 0.5097691, 1.316575, 1, 1, 1, 1, 1,
0.1933004, 0.7858178, -0.06599631, 0, 0, 1, 1, 1,
0.1934233, -0.254813, 2.634125, 1, 0, 0, 1, 1,
0.194556, -0.147089, 1.744917, 1, 0, 0, 1, 1,
0.1988506, -0.8336479, 2.669086, 1, 0, 0, 1, 1,
0.1989688, -0.9817094, 2.922268, 1, 0, 0, 1, 1,
0.2024445, -2.942351, 2.053765, 1, 0, 0, 1, 1,
0.2035112, -0.2816985, 3.742063, 0, 0, 0, 1, 1,
0.2043876, -1.504747, 1.609758, 0, 0, 0, 1, 1,
0.2070035, -0.9123217, 4.118993, 0, 0, 0, 1, 1,
0.2093083, 0.880443, -0.489127, 0, 0, 0, 1, 1,
0.2185443, -2.053591, 2.508249, 0, 0, 0, 1, 1,
0.2204856, -0.136359, 1.588542, 0, 0, 0, 1, 1,
0.2219657, -1.481588, 2.225564, 0, 0, 0, 1, 1,
0.2233424, -0.833227, 2.568131, 1, 1, 1, 1, 1,
0.2253259, -0.7550905, 4.045892, 1, 1, 1, 1, 1,
0.2330738, 0.05510725, -0.4165041, 1, 1, 1, 1, 1,
0.2437858, -0.805793, 3.293145, 1, 1, 1, 1, 1,
0.2474704, 2.150458, 1.397922, 1, 1, 1, 1, 1,
0.2478244, 1.043124, 0.5984603, 1, 1, 1, 1, 1,
0.2485595, 0.2156795, 1.408086, 1, 1, 1, 1, 1,
0.249005, 1.268842, 1.417708, 1, 1, 1, 1, 1,
0.2509302, -0.7286643, 3.56342, 1, 1, 1, 1, 1,
0.2513509, -1.242548, 3.732903, 1, 1, 1, 1, 1,
0.2514132, 0.3941984, 0.5146753, 1, 1, 1, 1, 1,
0.2527907, -0.2817234, 3.265428, 1, 1, 1, 1, 1,
0.2537167, -0.05982543, 3.099267, 1, 1, 1, 1, 1,
0.2581607, -0.1726351, 0.9984115, 1, 1, 1, 1, 1,
0.2630777, -0.1116178, 2.959321, 1, 1, 1, 1, 1,
0.263694, -0.3159969, 2.205509, 0, 0, 1, 1, 1,
0.2673885, 1.29839, -1.191378, 1, 0, 0, 1, 1,
0.2676758, 0.4197597, 1.862029, 1, 0, 0, 1, 1,
0.2693484, -1.008918, 3.41386, 1, 0, 0, 1, 1,
0.2708341, 1.781021, -0.3272133, 1, 0, 0, 1, 1,
0.2725723, 0.6729272, -0.5953889, 1, 0, 0, 1, 1,
0.2748002, 0.5001448, 1.789628, 0, 0, 0, 1, 1,
0.2771353, 1.859955, -0.3546174, 0, 0, 0, 1, 1,
0.2773124, -1.437241, 3.580242, 0, 0, 0, 1, 1,
0.2780268, 1.600535, -1.143479, 0, 0, 0, 1, 1,
0.2861612, 0.9361246, 0.1206962, 0, 0, 0, 1, 1,
0.2865499, -1.133347, 3.756021, 0, 0, 0, 1, 1,
0.2874333, -0.9319155, 2.074312, 0, 0, 0, 1, 1,
0.2882597, -1.607101, 4.554165, 1, 1, 1, 1, 1,
0.2891392, 0.3972177, -0.1732732, 1, 1, 1, 1, 1,
0.2928405, 2.514403, 1.245926, 1, 1, 1, 1, 1,
0.2941233, -0.3879811, 1.097791, 1, 1, 1, 1, 1,
0.2999875, 1.817931, -0.1113407, 1, 1, 1, 1, 1,
0.3091005, -1.139861, 2.160904, 1, 1, 1, 1, 1,
0.3160534, 0.7804945, 0.1181689, 1, 1, 1, 1, 1,
0.3168613, 0.9878684, -0.4991072, 1, 1, 1, 1, 1,
0.3188744, -1.800235, 4.182648, 1, 1, 1, 1, 1,
0.3221778, 0.9823983, -0.3535155, 1, 1, 1, 1, 1,
0.3255829, 0.5029114, -0.7434703, 1, 1, 1, 1, 1,
0.3274736, -0.8442931, 2.860156, 1, 1, 1, 1, 1,
0.3278244, -0.2453127, 0.8959574, 1, 1, 1, 1, 1,
0.3357501, 0.7507995, 0.3359637, 1, 1, 1, 1, 1,
0.3365601, 0.1256488, 1.008561, 1, 1, 1, 1, 1,
0.3400205, -1.662395, 2.786559, 0, 0, 1, 1, 1,
0.3455905, -1.695815, 5.094255, 1, 0, 0, 1, 1,
0.3490568, 0.4760061, 2.999067, 1, 0, 0, 1, 1,
0.3532766, 0.4985491, 0.9317949, 1, 0, 0, 1, 1,
0.3612393, -0.5044668, 3.125862, 1, 0, 0, 1, 1,
0.3614312, -0.8008472, 2.64269, 1, 0, 0, 1, 1,
0.3615834, 0.9011007, 1.054832, 0, 0, 0, 1, 1,
0.3617641, 0.2789051, 1.015907, 0, 0, 0, 1, 1,
0.3623233, 0.07451003, 2.640966, 0, 0, 0, 1, 1,
0.3625413, 0.5454383, 2.117893, 0, 0, 0, 1, 1,
0.3638883, 0.9226249, 0.5077689, 0, 0, 0, 1, 1,
0.3640247, 1.442221, 0.7288976, 0, 0, 0, 1, 1,
0.3643983, -1.590011, 3.512024, 0, 0, 0, 1, 1,
0.3744715, -0.1132048, 0.9040049, 1, 1, 1, 1, 1,
0.3757609, 1.252259, 1.86185, 1, 1, 1, 1, 1,
0.3761003, -0.06434524, 3.415484, 1, 1, 1, 1, 1,
0.3855599, -0.2618081, 2.533151, 1, 1, 1, 1, 1,
0.386085, 1.611608, -0.00475565, 1, 1, 1, 1, 1,
0.3870562, -0.3946085, 2.534405, 1, 1, 1, 1, 1,
0.3887597, 0.1018002, 0.5396491, 1, 1, 1, 1, 1,
0.3908361, 2.289194, 2.43327, 1, 1, 1, 1, 1,
0.4004221, 1.39233, 0.2402043, 1, 1, 1, 1, 1,
0.4027144, -0.7796811, 2.76711, 1, 1, 1, 1, 1,
0.4028637, 1.511191, 0.8022161, 1, 1, 1, 1, 1,
0.4058608, -0.4959738, 2.05242, 1, 1, 1, 1, 1,
0.4119644, -0.2955298, 1.048139, 1, 1, 1, 1, 1,
0.413616, 0.3833623, 1.874954, 1, 1, 1, 1, 1,
0.4178467, -0.8906955, 0.8771001, 1, 1, 1, 1, 1,
0.41993, -1.047231, 2.377882, 0, 0, 1, 1, 1,
0.4239026, -1.211264, 3.367962, 1, 0, 0, 1, 1,
0.4261175, -2.837204, 2.119858, 1, 0, 0, 1, 1,
0.4338117, -1.116478, 1.984212, 1, 0, 0, 1, 1,
0.4416622, -1.061334, 2.85686, 1, 0, 0, 1, 1,
0.4467631, -0.6503504, 1.872783, 1, 0, 0, 1, 1,
0.4496647, -0.4689035, 2.17858, 0, 0, 0, 1, 1,
0.4509394, -1.847012, 2.634882, 0, 0, 0, 1, 1,
0.451232, -0.09465612, 1.974993, 0, 0, 0, 1, 1,
0.4569589, -1.705485, 3.069088, 0, 0, 0, 1, 1,
0.4571863, 1.589828, 0.7564315, 0, 0, 0, 1, 1,
0.4617099, -0.2755237, 0.9379553, 0, 0, 0, 1, 1,
0.4642814, 0.4196394, -0.04146851, 0, 0, 0, 1, 1,
0.471439, -0.2059819, 0.2592722, 1, 1, 1, 1, 1,
0.4739651, 0.0725329, 0.611132, 1, 1, 1, 1, 1,
0.4780903, 0.3804593, 1.148681, 1, 1, 1, 1, 1,
0.4812202, 0.2044362, 1.253902, 1, 1, 1, 1, 1,
0.4889649, 0.09328607, 1.681148, 1, 1, 1, 1, 1,
0.4932989, 0.7493246, -0.3390877, 1, 1, 1, 1, 1,
0.4937301, 0.6673947, 0.7906014, 1, 1, 1, 1, 1,
0.4962437, -0.4846318, 2.300674, 1, 1, 1, 1, 1,
0.5026749, 0.7729813, 1.560148, 1, 1, 1, 1, 1,
0.5084977, 0.5958358, 2.297255, 1, 1, 1, 1, 1,
0.50862, 3.015121, -0.1527872, 1, 1, 1, 1, 1,
0.5131802, 0.462027, 0.7782903, 1, 1, 1, 1, 1,
0.5154315, -0.2718407, 3.555775, 1, 1, 1, 1, 1,
0.516744, -0.6094909, 2.579124, 1, 1, 1, 1, 1,
0.5173583, 1.172346, -0.1289591, 1, 1, 1, 1, 1,
0.5189683, -1.491657, 2.603563, 0, 0, 1, 1, 1,
0.5255066, -1.042588, 2.695772, 1, 0, 0, 1, 1,
0.5347802, 2.892039, -0.9195774, 1, 0, 0, 1, 1,
0.5445582, -0.02418773, 1.154324, 1, 0, 0, 1, 1,
0.5526955, -0.6258469, 1.577959, 1, 0, 0, 1, 1,
0.5547847, 0.6652251, -0.2641401, 1, 0, 0, 1, 1,
0.5559546, 0.2557667, -0.005002389, 0, 0, 0, 1, 1,
0.5564692, 0.6655859, 0.9668353, 0, 0, 0, 1, 1,
0.558938, 0.1227741, 1.385562, 0, 0, 0, 1, 1,
0.5667464, -2.586205, 1.528551, 0, 0, 0, 1, 1,
0.5685851, 1.531213, 1.451592, 0, 0, 0, 1, 1,
0.5725817, 1.23958, -0.4251824, 0, 0, 0, 1, 1,
0.5757005, -0.2565973, 0.3911524, 0, 0, 0, 1, 1,
0.5759193, 0.8492505, -1.40876, 1, 1, 1, 1, 1,
0.5784658, 0.1641293, 4.332395, 1, 1, 1, 1, 1,
0.579269, -0.7663996, 3.061051, 1, 1, 1, 1, 1,
0.5833067, -0.4796329, 0.8605006, 1, 1, 1, 1, 1,
0.5856053, 2.681376, 0.4214449, 1, 1, 1, 1, 1,
0.5890829, -0.3712142, 1.590823, 1, 1, 1, 1, 1,
0.5903015, 1.113655, 0.5245939, 1, 1, 1, 1, 1,
0.5923412, -0.8248253, 1.598086, 1, 1, 1, 1, 1,
0.592973, -0.4568128, 2.184811, 1, 1, 1, 1, 1,
0.5949007, -0.9304608, 1.656468, 1, 1, 1, 1, 1,
0.5951139, 0.7010667, 0.493253, 1, 1, 1, 1, 1,
0.5969815, -0.8332462, 2.633058, 1, 1, 1, 1, 1,
0.6055788, 0.7366661, 1.844314, 1, 1, 1, 1, 1,
0.6094415, -0.1428847, 2.37462, 1, 1, 1, 1, 1,
0.6100808, 0.05257977, 0.08347915, 1, 1, 1, 1, 1,
0.6177168, 0.1102981, 0.5718073, 0, 0, 1, 1, 1,
0.6182066, -0.06070612, 0.1578832, 1, 0, 0, 1, 1,
0.6231936, 0.1718562, 1.515995, 1, 0, 0, 1, 1,
0.632875, 0.587091, 0.79425, 1, 0, 0, 1, 1,
0.6399698, 0.8443865, 0.612119, 1, 0, 0, 1, 1,
0.6419625, 1.570066, -0.01067144, 1, 0, 0, 1, 1,
0.6463761, 1.086449, 0.1758645, 0, 0, 0, 1, 1,
0.6464289, -2.425597, 2.448596, 0, 0, 0, 1, 1,
0.6476858, 1.558455, 0.792893, 0, 0, 0, 1, 1,
0.6489692, -0.5844712, 3.987376, 0, 0, 0, 1, 1,
0.6501961, -1.655805, 4.040581, 0, 0, 0, 1, 1,
0.6514872, 0.2740801, 0.5456176, 0, 0, 0, 1, 1,
0.6522323, 0.4294136, 1.421619, 0, 0, 0, 1, 1,
0.6622992, -0.5836532, 1.40558, 1, 1, 1, 1, 1,
0.663429, 1.473643, -2.392343, 1, 1, 1, 1, 1,
0.6660137, 2.88373, 0.9095595, 1, 1, 1, 1, 1,
0.6661698, -1.31686, 2.58555, 1, 1, 1, 1, 1,
0.6672817, 1.504058, -0.4099014, 1, 1, 1, 1, 1,
0.668721, 1.655102, -0.456099, 1, 1, 1, 1, 1,
0.6702811, 0.2052637, 1.011562, 1, 1, 1, 1, 1,
0.6715578, -0.09899975, 0.7883774, 1, 1, 1, 1, 1,
0.6725577, 0.1885379, 2.773079, 1, 1, 1, 1, 1,
0.673246, -0.4672654, 2.810244, 1, 1, 1, 1, 1,
0.6801666, -0.2753157, 1.259383, 1, 1, 1, 1, 1,
0.681613, -0.999377, 2.501142, 1, 1, 1, 1, 1,
0.6836797, -1.984981, 3.674078, 1, 1, 1, 1, 1,
0.6844096, -2.907821, -0.02030229, 1, 1, 1, 1, 1,
0.6873516, 0.2573721, 1.218171, 1, 1, 1, 1, 1,
0.6960594, 0.4730735, 1.099075, 0, 0, 1, 1, 1,
0.7086559, -0.1523419, 2.129892, 1, 0, 0, 1, 1,
0.7086885, -1.254962, 2.280388, 1, 0, 0, 1, 1,
0.7094227, -0.8823482, 1.895252, 1, 0, 0, 1, 1,
0.7261789, -1.1244, 1.3445, 1, 0, 0, 1, 1,
0.73135, 0.1017339, 3.30936, 1, 0, 0, 1, 1,
0.731432, -0.6574313, 4.465342, 0, 0, 0, 1, 1,
0.7337034, 0.9263616, 0.6976949, 0, 0, 0, 1, 1,
0.7339189, -0.5254692, 2.207008, 0, 0, 0, 1, 1,
0.7343934, 2.032878, 1.143376, 0, 0, 0, 1, 1,
0.7349964, -0.2102225, 2.990603, 0, 0, 0, 1, 1,
0.7358897, 0.1312207, 2.144093, 0, 0, 0, 1, 1,
0.7403921, -1.392432, 3.715568, 0, 0, 0, 1, 1,
0.7456406, -0.2703491, 3.14147, 1, 1, 1, 1, 1,
0.7512152, 0.451072, 0.8724402, 1, 1, 1, 1, 1,
0.7525367, -0.3320739, 0.7988387, 1, 1, 1, 1, 1,
0.7557921, -0.4556665, 2.505295, 1, 1, 1, 1, 1,
0.7694993, -0.9453195, 1.957641, 1, 1, 1, 1, 1,
0.7748808, -0.06872631, 2.912131, 1, 1, 1, 1, 1,
0.7820852, -0.2267799, 1.135248, 1, 1, 1, 1, 1,
0.7892008, 0.8282986, 1.217759, 1, 1, 1, 1, 1,
0.790508, -0.5576597, 4.935189, 1, 1, 1, 1, 1,
0.803372, -0.07014487, 0.9239523, 1, 1, 1, 1, 1,
0.8040646, 0.05791593, 1.306951, 1, 1, 1, 1, 1,
0.8090264, -1.083474, 3.06919, 1, 1, 1, 1, 1,
0.8147218, 0.1116078, 2.163188, 1, 1, 1, 1, 1,
0.8170568, -0.190039, 2.742991, 1, 1, 1, 1, 1,
0.8191926, 0.0440539, 1.213793, 1, 1, 1, 1, 1,
0.8204011, 0.6522976, 0.3029757, 0, 0, 1, 1, 1,
0.8225105, -1.63568, 2.976196, 1, 0, 0, 1, 1,
0.8263369, 1.912305, -0.1026989, 1, 0, 0, 1, 1,
0.831647, 0.6770713, -0.4647538, 1, 0, 0, 1, 1,
0.8320377, 0.1796404, 2.01754, 1, 0, 0, 1, 1,
0.8329566, -0.2753299, 2.235804, 1, 0, 0, 1, 1,
0.8349589, -0.04082486, 2.20217, 0, 0, 0, 1, 1,
0.8401662, 0.1688752, 1.260024, 0, 0, 0, 1, 1,
0.8412102, -0.6941779, 1.769354, 0, 0, 0, 1, 1,
0.8435524, -1.566672, 1.234324, 0, 0, 0, 1, 1,
0.8459709, -0.1646153, 1.493447, 0, 0, 0, 1, 1,
0.8470427, 0.7332553, -0.55248, 0, 0, 0, 1, 1,
0.8480884, -0.6988192, -0.8447728, 0, 0, 0, 1, 1,
0.8486667, 0.4376319, 1.240169, 1, 1, 1, 1, 1,
0.8501085, -1.368964, 2.708633, 1, 1, 1, 1, 1,
0.8506646, 0.7119982, 0.6207884, 1, 1, 1, 1, 1,
0.8510256, -0.3824902, 2.160563, 1, 1, 1, 1, 1,
0.851279, 0.294081, 2.701344, 1, 1, 1, 1, 1,
0.8533465, -0.3677489, 3.709308, 1, 1, 1, 1, 1,
0.8565569, 0.05706219, 1.286541, 1, 1, 1, 1, 1,
0.8593568, -1.77318, 4.422702, 1, 1, 1, 1, 1,
0.8630043, 1.121146, -1.191786, 1, 1, 1, 1, 1,
0.8639874, 0.4324375, 0.6378579, 1, 1, 1, 1, 1,
0.8658099, 0.9714808, 2.854076, 1, 1, 1, 1, 1,
0.8662364, 0.9647128, 1.169539, 1, 1, 1, 1, 1,
0.868684, 0.1550706, 1.780263, 1, 1, 1, 1, 1,
0.8717261, 0.4698651, 1.043435, 1, 1, 1, 1, 1,
0.873689, 0.9027753, 2.69868, 1, 1, 1, 1, 1,
0.8757906, -0.06134931, 0.1390755, 0, 0, 1, 1, 1,
0.8759335, 0.3752228, 1.359742, 1, 0, 0, 1, 1,
0.8764266, 0.3452717, 0.4607591, 1, 0, 0, 1, 1,
0.8775283, -1.269463, 4.070544, 1, 0, 0, 1, 1,
0.8835356, 1.122576, 0.3477835, 1, 0, 0, 1, 1,
0.8859865, 0.2638724, 0.5869929, 1, 0, 0, 1, 1,
0.888725, 0.2390384, 1.454417, 0, 0, 0, 1, 1,
0.8891652, 0.8407822, 1.069571, 0, 0, 0, 1, 1,
0.8909419, -2.179596, 3.565007, 0, 0, 0, 1, 1,
0.8961576, 0.08847168, 1.296394, 0, 0, 0, 1, 1,
0.9079422, 0.8382754, 0.3318877, 0, 0, 0, 1, 1,
0.9132806, 1.15476, -0.4499866, 0, 0, 0, 1, 1,
0.9174175, 0.5077708, 1.478229, 0, 0, 0, 1, 1,
0.9188436, 0.2326271, 1.961663, 1, 1, 1, 1, 1,
0.9200837, 0.525983, -0.05989744, 1, 1, 1, 1, 1,
0.927744, 0.7418309, 1.417217, 1, 1, 1, 1, 1,
0.9316193, -0.8186407, -0.1631087, 1, 1, 1, 1, 1,
0.9335763, 0.786915, 2.769242, 1, 1, 1, 1, 1,
0.9380251, -0.7995124, 1.763705, 1, 1, 1, 1, 1,
0.9392377, -2.313997, 3.437975, 1, 1, 1, 1, 1,
0.9412423, 0.5901204, 0.2633424, 1, 1, 1, 1, 1,
0.9414603, 0.498279, -0.2350562, 1, 1, 1, 1, 1,
0.9422542, 2.037949, -1.002009, 1, 1, 1, 1, 1,
0.9432108, 0.1715457, 0.913016, 1, 1, 1, 1, 1,
0.9442664, 1.690582, -0.291296, 1, 1, 1, 1, 1,
0.9455913, -0.4520096, 2.778828, 1, 1, 1, 1, 1,
0.9473227, 1.256658, 2.037239, 1, 1, 1, 1, 1,
0.9546057, -0.5030295, -0.1064613, 1, 1, 1, 1, 1,
0.9581178, -0.2155893, 2.183037, 0, 0, 1, 1, 1,
0.9606894, -0.4123979, 0.1108544, 1, 0, 0, 1, 1,
0.9611992, -0.2450849, 2.272312, 1, 0, 0, 1, 1,
0.9840236, -0.4729329, 1.821763, 1, 0, 0, 1, 1,
0.9853758, -1.203826, 3.916677, 1, 0, 0, 1, 1,
0.9909646, -0.4276869, 2.674471, 1, 0, 0, 1, 1,
0.9929956, 0.9991223, 0.3279264, 0, 0, 0, 1, 1,
0.9980726, 0.1781402, 0.5087495, 0, 0, 0, 1, 1,
1.000486, -0.6453249, 1.357325, 0, 0, 0, 1, 1,
1.001634, -0.4422218, 2.099485, 0, 0, 0, 1, 1,
1.002337, 1.091709, 1.630565, 0, 0, 0, 1, 1,
1.004739, 0.3247086, 2.192703, 0, 0, 0, 1, 1,
1.010961, 0.3063872, 2.199856, 0, 0, 0, 1, 1,
1.01397, 1.415699, 0.4358422, 1, 1, 1, 1, 1,
1.017877, -1.059963, 0.09709349, 1, 1, 1, 1, 1,
1.021368, -0.4258648, 2.624838, 1, 1, 1, 1, 1,
1.025905, -0.5394617, 1.60129, 1, 1, 1, 1, 1,
1.036615, 0.09308029, 3.083332, 1, 1, 1, 1, 1,
1.038624, 1.076761, -1.44545, 1, 1, 1, 1, 1,
1.041098, 0.5200788, 0.520339, 1, 1, 1, 1, 1,
1.055352, 1.968563, 1.826609, 1, 1, 1, 1, 1,
1.079232, -0.49478, 2.767415, 1, 1, 1, 1, 1,
1.082767, 0.8868865, 0.5570915, 1, 1, 1, 1, 1,
1.084357, -1.51594, 0.8180308, 1, 1, 1, 1, 1,
1.089701, 0.2588347, 2.225683, 1, 1, 1, 1, 1,
1.093631, 1.72911, 0.9567857, 1, 1, 1, 1, 1,
1.093769, -0.6529719, 0.4176885, 1, 1, 1, 1, 1,
1.094729, -0.5972692, 2.529244, 1, 1, 1, 1, 1,
1.097052, 0.172252, 0.8027833, 0, 0, 1, 1, 1,
1.102276, -0.4619733, 3.155022, 1, 0, 0, 1, 1,
1.10279, 2.153627, -1.148516, 1, 0, 0, 1, 1,
1.107626, -0.3091673, 1.428333, 1, 0, 0, 1, 1,
1.113252, -0.5928738, 1.87795, 1, 0, 0, 1, 1,
1.114145, -0.05239015, 0.8356116, 1, 0, 0, 1, 1,
1.118683, 0.04326212, 1.180485, 0, 0, 0, 1, 1,
1.123188, 0.5177146, 1.213623, 0, 0, 0, 1, 1,
1.123362, 0.494985, 1.812527, 0, 0, 0, 1, 1,
1.124824, 0.03276618, -0.1293253, 0, 0, 0, 1, 1,
1.12498, -0.2408645, 1.200442, 0, 0, 0, 1, 1,
1.127296, 1.036584, 2.601497, 0, 0, 0, 1, 1,
1.13965, 0.474815, 3.131486, 0, 0, 0, 1, 1,
1.141663, 0.08022101, 1.790431, 1, 1, 1, 1, 1,
1.142676, 0.791553, -0.7184644, 1, 1, 1, 1, 1,
1.14967, -0.4157253, 0.7520316, 1, 1, 1, 1, 1,
1.15608, 0.4950084, 1.990895, 1, 1, 1, 1, 1,
1.157296, -0.9789232, 1.615765, 1, 1, 1, 1, 1,
1.158468, 0.1035807, 1.532668, 1, 1, 1, 1, 1,
1.16721, 1.297911, 2.35622, 1, 1, 1, 1, 1,
1.171911, -0.5691072, 3.64535, 1, 1, 1, 1, 1,
1.174391, -1.060295, 1.355847, 1, 1, 1, 1, 1,
1.182529, -0.5117654, 3.120836, 1, 1, 1, 1, 1,
1.18313, -0.8474584, 1.494991, 1, 1, 1, 1, 1,
1.190825, 1.146519, 2.208487, 1, 1, 1, 1, 1,
1.200964, 1.353538, 1.15522, 1, 1, 1, 1, 1,
1.206326, 0.9913484, 1.814535, 1, 1, 1, 1, 1,
1.208117, -0.396867, 1.508303, 1, 1, 1, 1, 1,
1.213259, -0.5414275, 1.399531, 0, 0, 1, 1, 1,
1.214223, -0.1612003, 1.860445, 1, 0, 0, 1, 1,
1.216425, 0.02193738, -0.5493302, 1, 0, 0, 1, 1,
1.216895, -0.7736142, 2.675622, 1, 0, 0, 1, 1,
1.229256, -0.4184926, 2.189612, 1, 0, 0, 1, 1,
1.231203, 0.04936475, 2.06135, 1, 0, 0, 1, 1,
1.245457, 0.1760205, 1.195157, 0, 0, 0, 1, 1,
1.249718, -0.4690236, 2.440743, 0, 0, 0, 1, 1,
1.253875, -0.5337628, 2.442327, 0, 0, 0, 1, 1,
1.256779, -0.508931, 2.349742, 0, 0, 0, 1, 1,
1.262597, -1.468375, 2.255188, 0, 0, 0, 1, 1,
1.26589, -0.8468468, 3.383262, 0, 0, 0, 1, 1,
1.276125, 1.387767, -0.5991028, 0, 0, 0, 1, 1,
1.285442, 0.6977493, 2.454437, 1, 1, 1, 1, 1,
1.289178, -1.723288, 2.674898, 1, 1, 1, 1, 1,
1.298786, 1.15056, -0.4726314, 1, 1, 1, 1, 1,
1.304453, -1.085914, 0.9107063, 1, 1, 1, 1, 1,
1.316937, 1.290361, 0.3547747, 1, 1, 1, 1, 1,
1.325089, -1.686592, 2.987347, 1, 1, 1, 1, 1,
1.331489, 0.5391108, 0.1289111, 1, 1, 1, 1, 1,
1.345117, -0.2537367, 1.675533, 1, 1, 1, 1, 1,
1.34627, -0.7058839, 1.910657, 1, 1, 1, 1, 1,
1.357618, -0.7025069, 3.055621, 1, 1, 1, 1, 1,
1.363693, -1.136166, 3.094419, 1, 1, 1, 1, 1,
1.368136, -0.7998377, 4.778441, 1, 1, 1, 1, 1,
1.37929, 0.1556828, 3.421477, 1, 1, 1, 1, 1,
1.381766, 0.1304982, 2.114421, 1, 1, 1, 1, 1,
1.383931, -1.210115, 2.503093, 1, 1, 1, 1, 1,
1.385469, -0.5424385, 3.335336, 0, 0, 1, 1, 1,
1.402252, -0.8199193, 1.714853, 1, 0, 0, 1, 1,
1.407215, -0.4554327, 1.541477, 1, 0, 0, 1, 1,
1.413045, -1.294822, 0.9256055, 1, 0, 0, 1, 1,
1.414039, -1.625133, 2.313234, 1, 0, 0, 1, 1,
1.416079, 0.4928477, 1.642409, 1, 0, 0, 1, 1,
1.43574, -0.7787786, 2.144215, 0, 0, 0, 1, 1,
1.43726, -0.4803763, 3.064847, 0, 0, 0, 1, 1,
1.442083, 1.383263, 1.022188, 0, 0, 0, 1, 1,
1.448417, 1.013276, 2.933542, 0, 0, 0, 1, 1,
1.454103, -0.5001861, 4.696986, 0, 0, 0, 1, 1,
1.455862, 0.09369502, 1.850456, 0, 0, 0, 1, 1,
1.462261, 0.2543939, 1.329646, 0, 0, 0, 1, 1,
1.463879, -1.989442, 0.4901926, 1, 1, 1, 1, 1,
1.476841, 0.9106781, 0.08924606, 1, 1, 1, 1, 1,
1.480547, 1.840087, -0.5450889, 1, 1, 1, 1, 1,
1.484849, 0.714093, 0.7403312, 1, 1, 1, 1, 1,
1.490102, -2.034452, 4.557429, 1, 1, 1, 1, 1,
1.499907, -1.214601, 1.918984, 1, 1, 1, 1, 1,
1.526804, -0.6197982, 4.090312, 1, 1, 1, 1, 1,
1.539845, 1.442771, 1.249293, 1, 1, 1, 1, 1,
1.55134, -0.903887, 1.429255, 1, 1, 1, 1, 1,
1.553964, -0.6144477, -0.5571471, 1, 1, 1, 1, 1,
1.555402, 0.52125, 1.633134, 1, 1, 1, 1, 1,
1.585273, 0.2116446, 1.044996, 1, 1, 1, 1, 1,
1.608467, 1.275064, 0.348286, 1, 1, 1, 1, 1,
1.620682, -0.7084442, 2.730876, 1, 1, 1, 1, 1,
1.629977, 0.2208824, 1.033569, 1, 1, 1, 1, 1,
1.631788, 1.559651, -0.1170531, 0, 0, 1, 1, 1,
1.634505, -0.3071963, 2.8496, 1, 0, 0, 1, 1,
1.647293, 1.254689, 0.03073361, 1, 0, 0, 1, 1,
1.658926, -0.2020865, 1.482267, 1, 0, 0, 1, 1,
1.658927, -0.6242972, 2.214185, 1, 0, 0, 1, 1,
1.695321, 0.2903394, 2.580181, 1, 0, 0, 1, 1,
1.703499, -0.2849499, 2.471579, 0, 0, 0, 1, 1,
1.708562, -0.3883985, 0.4450164, 0, 0, 0, 1, 1,
1.71262, 1.163933, 1.428872, 0, 0, 0, 1, 1,
1.7331, -0.2497318, 1.868638, 0, 0, 0, 1, 1,
1.783402, 1.603743, 0.02068216, 0, 0, 0, 1, 1,
1.803329, 2.494902, 2.543777, 0, 0, 0, 1, 1,
1.807167, -0.8836951, 1.048589, 0, 0, 0, 1, 1,
1.807894, 0.355683, 1.163896, 1, 1, 1, 1, 1,
1.820045, 0.0631808, 2.426011, 1, 1, 1, 1, 1,
1.834397, -0.09686586, 1.409829, 1, 1, 1, 1, 1,
1.840907, -0.4049985, 2.998922, 1, 1, 1, 1, 1,
1.851361, 0.723802, 4.170107, 1, 1, 1, 1, 1,
1.889198, 0.9927707, 0.1036717, 1, 1, 1, 1, 1,
1.911229, 0.6552483, 2.676564, 1, 1, 1, 1, 1,
1.929037, -0.9387118, -0.01759742, 1, 1, 1, 1, 1,
1.929913, 1.011748, 1.867485, 1, 1, 1, 1, 1,
1.957552, -0.5294285, 1.115208, 1, 1, 1, 1, 1,
2.060258, 0.5434382, 3.404742, 1, 1, 1, 1, 1,
2.074264, 0.646871, 0.4250995, 1, 1, 1, 1, 1,
2.075047, -0.7407809, -0.03492102, 1, 1, 1, 1, 1,
2.078103, 0.5030732, 1.827153, 1, 1, 1, 1, 1,
2.106102, -0.3955433, 2.792207, 1, 1, 1, 1, 1,
2.124774, 0.9643698, 1.140107, 0, 0, 1, 1, 1,
2.136984, 2.121065, -0.2331438, 1, 0, 0, 1, 1,
2.174759, 0.05705401, 1.40622, 1, 0, 0, 1, 1,
2.24412, -1.36148, 2.195314, 1, 0, 0, 1, 1,
2.25207, 0.4823343, 0.9768153, 1, 0, 0, 1, 1,
2.256003, 2.01807, 0.9600925, 1, 0, 0, 1, 1,
2.343559, 0.003682016, 0.7007129, 0, 0, 0, 1, 1,
2.36217, 0.4214804, -0.436269, 0, 0, 0, 1, 1,
2.384288, -0.567889, 2.261307, 0, 0, 0, 1, 1,
2.385067, 1.297845, 2.973586, 0, 0, 0, 1, 1,
2.41993, 2.3795, 0.6487215, 0, 0, 0, 1, 1,
2.423161, -0.2317951, 1.404889, 0, 0, 0, 1, 1,
2.539096, 0.3980113, 2.20872, 0, 0, 0, 1, 1,
2.590676, 0.2691116, 1.208871, 1, 1, 1, 1, 1,
2.746151, 0.8093863, 2.130089, 1, 1, 1, 1, 1,
2.840681, -0.6090276, 1.272084, 1, 1, 1, 1, 1,
2.88541, 1.0472, -0.05851494, 1, 1, 1, 1, 1,
3.035596, -0.6166611, 0.8949864, 1, 1, 1, 1, 1,
3.139496, 0.4619391, 1.888949, 1, 1, 1, 1, 1,
3.463288, -0.3609768, 0.3227151, 1, 1, 1, 1, 1
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
var radius = 9.537582;
var distance = 33.50035;
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
mvMatrix.translate( -0.330691, 0.39029, 0.07549667 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.50035);
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
