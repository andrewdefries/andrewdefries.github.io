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
-2.757424, -1.757814, -1.258242, 1, 0, 0, 1,
-2.629696, -0.6250881, -3.249728, 1, 0.007843138, 0, 1,
-2.618207, 0.4476182, -1.898285, 1, 0.01176471, 0, 1,
-2.524547, 1.274057, -0.3325758, 1, 0.01960784, 0, 1,
-2.469918, -2.633079, -2.342739, 1, 0.02352941, 0, 1,
-2.465554, 0.8782555, -1.003582, 1, 0.03137255, 0, 1,
-2.463448, 0.8380728, -2.456604, 1, 0.03529412, 0, 1,
-2.395561, -1.105813, -2.141047, 1, 0.04313726, 0, 1,
-2.374907, 0.2463999, -0.9693018, 1, 0.04705882, 0, 1,
-2.362901, -0.5277486, -0.8257174, 1, 0.05490196, 0, 1,
-2.266444, -0.456468, -2.729988, 1, 0.05882353, 0, 1,
-2.249451, -1.64418, -1.611699, 1, 0.06666667, 0, 1,
-2.225073, -0.2135163, -2.548422, 1, 0.07058824, 0, 1,
-2.215983, -1.017836, -3.244673, 1, 0.07843138, 0, 1,
-2.175378, 1.442214, -1.242205, 1, 0.08235294, 0, 1,
-2.167557, 1.160186, 0.3924828, 1, 0.09019608, 0, 1,
-2.165352, 0.08823751, -0.889526, 1, 0.09411765, 0, 1,
-2.115376, 0.124463, -1.677296, 1, 0.1019608, 0, 1,
-2.084419, -0.4989068, 0.08749069, 1, 0.1098039, 0, 1,
-2.064277, -1.194614, -2.870704, 1, 0.1137255, 0, 1,
-2.049146, -2.069679, -3.771014, 1, 0.1215686, 0, 1,
-2.037367, 0.5927163, -1.522573, 1, 0.1254902, 0, 1,
-2.015502, -0.006177288, -1.411751, 1, 0.1333333, 0, 1,
-2.012938, 2.157673, -0.2499055, 1, 0.1372549, 0, 1,
-1.977682, -0.5641739, -2.091729, 1, 0.145098, 0, 1,
-1.956581, -1.111212, -2.747396, 1, 0.1490196, 0, 1,
-1.942728, 0.5037524, -0.7902255, 1, 0.1568628, 0, 1,
-1.922699, 0.04090161, -0.745087, 1, 0.1607843, 0, 1,
-1.914729, 0.6987512, -1.552495, 1, 0.1686275, 0, 1,
-1.914577, 0.173326, -1.45631, 1, 0.172549, 0, 1,
-1.91324, -1.517385, -4.069345, 1, 0.1803922, 0, 1,
-1.901206, 0.1681732, -0.7189537, 1, 0.1843137, 0, 1,
-1.868323, -0.8450483, -1.561206, 1, 0.1921569, 0, 1,
-1.832425, 1.75287, -1.08552, 1, 0.1960784, 0, 1,
-1.825188, 0.8457577, -0.6811412, 1, 0.2039216, 0, 1,
-1.824578, -0.4655289, -1.635248, 1, 0.2117647, 0, 1,
-1.812725, 1.922947, -0.1655771, 1, 0.2156863, 0, 1,
-1.804716, -0.7556956, -1.78608, 1, 0.2235294, 0, 1,
-1.799834, -0.5724848, -2.523151, 1, 0.227451, 0, 1,
-1.789788, 0.9188674, 0.7819722, 1, 0.2352941, 0, 1,
-1.768451, -0.9571488, -2.569647, 1, 0.2392157, 0, 1,
-1.767498, 1.031601, -1.121136, 1, 0.2470588, 0, 1,
-1.759827, -0.02280543, -2.154327, 1, 0.2509804, 0, 1,
-1.759258, 0.6223401, -2.093769, 1, 0.2588235, 0, 1,
-1.758355, 1.17184, -0.4550267, 1, 0.2627451, 0, 1,
-1.750797, 0.1697206, -3.954816, 1, 0.2705882, 0, 1,
-1.750671, -1.247673, -2.570535, 1, 0.2745098, 0, 1,
-1.748356, -1.563587, -1.082762, 1, 0.282353, 0, 1,
-1.730307, -0.8581681, -2.139964, 1, 0.2862745, 0, 1,
-1.729574, -0.4695089, 0.5056328, 1, 0.2941177, 0, 1,
-1.708707, 0.7100157, -1.068076, 1, 0.3019608, 0, 1,
-1.702364, 1.350407, 0.168029, 1, 0.3058824, 0, 1,
-1.696565, 1.780346, -1.46755, 1, 0.3137255, 0, 1,
-1.69566, -0.02858581, -1.651719, 1, 0.3176471, 0, 1,
-1.686994, 0.3658236, -2.591497, 1, 0.3254902, 0, 1,
-1.665224, -0.3215494, -2.821908, 1, 0.3294118, 0, 1,
-1.639928, -1.246237, -3.441383, 1, 0.3372549, 0, 1,
-1.63141, 0.5980799, -0.2457405, 1, 0.3411765, 0, 1,
-1.627891, 1.080401, -0.879256, 1, 0.3490196, 0, 1,
-1.608204, 1.022283, -0.05810123, 1, 0.3529412, 0, 1,
-1.604753, 2.249727, -0.5606568, 1, 0.3607843, 0, 1,
-1.570603, 2.035005, 0.1802977, 1, 0.3647059, 0, 1,
-1.567104, -0.7306737, -1.664695, 1, 0.372549, 0, 1,
-1.561932, -1.290697, -1.198235, 1, 0.3764706, 0, 1,
-1.516229, 1.077675, -0.8020914, 1, 0.3843137, 0, 1,
-1.499441, -1.495438, -0.9816642, 1, 0.3882353, 0, 1,
-1.495942, 1.417405, -0.3753503, 1, 0.3960784, 0, 1,
-1.494008, -0.871696, -0.8510597, 1, 0.4039216, 0, 1,
-1.483507, -0.5848523, -1.164305, 1, 0.4078431, 0, 1,
-1.477863, -0.7420677, -2.348915, 1, 0.4156863, 0, 1,
-1.469053, 0.3881654, -2.766774, 1, 0.4196078, 0, 1,
-1.465079, -1.342283, -3.759155, 1, 0.427451, 0, 1,
-1.464951, -0.900238, -0.4126849, 1, 0.4313726, 0, 1,
-1.459734, -0.06319745, -2.004297, 1, 0.4392157, 0, 1,
-1.452689, -1.20054, -3.078738, 1, 0.4431373, 0, 1,
-1.450238, -1.055356, -2.324953, 1, 0.4509804, 0, 1,
-1.434438, 0.02033255, 0.1505755, 1, 0.454902, 0, 1,
-1.409074, 0.0623399, -1.591892, 1, 0.4627451, 0, 1,
-1.399556, -1.049405, -4.552651, 1, 0.4666667, 0, 1,
-1.395228, 0.8420401, -2.267573, 1, 0.4745098, 0, 1,
-1.395115, -0.3532845, -1.641797, 1, 0.4784314, 0, 1,
-1.392346, 0.5165656, -0.9109167, 1, 0.4862745, 0, 1,
-1.383822, -1.266178, -3.620156, 1, 0.4901961, 0, 1,
-1.374635, 0.2244505, -1.184948, 1, 0.4980392, 0, 1,
-1.367179, -0.6976246, -2.141621, 1, 0.5058824, 0, 1,
-1.362237, 1.596633, -0.1729015, 1, 0.509804, 0, 1,
-1.360601, 0.5226644, -1.518089, 1, 0.5176471, 0, 1,
-1.3443, 1.14035, 0.7636133, 1, 0.5215687, 0, 1,
-1.338312, -0.6854044, -3.178244, 1, 0.5294118, 0, 1,
-1.327237, -1.814343, -3.321587, 1, 0.5333334, 0, 1,
-1.323093, -0.400724, -2.444208, 1, 0.5411765, 0, 1,
-1.316038, -1.818438, 0.2822499, 1, 0.5450981, 0, 1,
-1.308731, 0.09479772, -0.9359284, 1, 0.5529412, 0, 1,
-1.304659, -1.804435, -4.628287, 1, 0.5568628, 0, 1,
-1.297739, 0.3651352, -0.3265046, 1, 0.5647059, 0, 1,
-1.295191, -0.3370841, -1.819851, 1, 0.5686275, 0, 1,
-1.290748, -0.2592515, -1.700266, 1, 0.5764706, 0, 1,
-1.281686, -1.002244, -2.880541, 1, 0.5803922, 0, 1,
-1.274487, 0.02618846, -3.099778, 1, 0.5882353, 0, 1,
-1.270161, 1.325374, -1.241256, 1, 0.5921569, 0, 1,
-1.264416, 0.6279992, -3.252707, 1, 0.6, 0, 1,
-1.258822, -1.749776, -2.820696, 1, 0.6078432, 0, 1,
-1.255424, -0.2256545, -0.9269926, 1, 0.6117647, 0, 1,
-1.255409, -1.692249, -1.983361, 1, 0.6196079, 0, 1,
-1.25444, -0.048152, -1.076401, 1, 0.6235294, 0, 1,
-1.251523, -0.6449615, -1.707341, 1, 0.6313726, 0, 1,
-1.248402, 0.3814033, -1.846673, 1, 0.6352941, 0, 1,
-1.246144, -0.6632432, -1.893702, 1, 0.6431373, 0, 1,
-1.237317, -0.9034411, -0.8853234, 1, 0.6470588, 0, 1,
-1.231016, -1.251345, -0.6223761, 1, 0.654902, 0, 1,
-1.220765, -2.007018, -3.062578, 1, 0.6588235, 0, 1,
-1.215456, 0.5553493, -1.547428, 1, 0.6666667, 0, 1,
-1.212705, -0.7263763, -2.010778, 1, 0.6705883, 0, 1,
-1.203356, -0.8293682, -1.91981, 1, 0.6784314, 0, 1,
-1.196564, -1.061145, -0.5147778, 1, 0.682353, 0, 1,
-1.192094, -1.144558, -3.55917, 1, 0.6901961, 0, 1,
-1.190811, 0.9170583, -0.4956312, 1, 0.6941177, 0, 1,
-1.182198, -0.8645074, -2.642665, 1, 0.7019608, 0, 1,
-1.169431, 0.03981623, -0.7037055, 1, 0.7098039, 0, 1,
-1.159492, 1.780937, -0.1109718, 1, 0.7137255, 0, 1,
-1.150834, -0.9060966, -3.11769, 1, 0.7215686, 0, 1,
-1.135001, -0.4282727, -1.454962, 1, 0.7254902, 0, 1,
-1.123694, -1.469599, -2.468668, 1, 0.7333333, 0, 1,
-1.119549, 2.018817, -1.028058, 1, 0.7372549, 0, 1,
-1.112758, -1.019604, -4.085524, 1, 0.7450981, 0, 1,
-1.110418, 0.3493737, -0.9150857, 1, 0.7490196, 0, 1,
-1.109218, 0.07248345, -3.23221, 1, 0.7568628, 0, 1,
-1.103923, 0.2792845, -1.829355, 1, 0.7607843, 0, 1,
-1.099334, 0.9246498, -0.7560954, 1, 0.7686275, 0, 1,
-1.097674, 1.682696, -0.7213151, 1, 0.772549, 0, 1,
-1.097566, 0.1069592, -3.318565, 1, 0.7803922, 0, 1,
-1.094096, 0.1817714, 0.1381721, 1, 0.7843137, 0, 1,
-1.091493, -1.201483, -1.687227, 1, 0.7921569, 0, 1,
-1.08943, 0.1872953, -0.930823, 1, 0.7960784, 0, 1,
-1.088267, -1.638794, -2.506854, 1, 0.8039216, 0, 1,
-1.087741, 0.000239596, -1.50999, 1, 0.8117647, 0, 1,
-1.085364, -0.243589, -3.321546, 1, 0.8156863, 0, 1,
-1.082217, 0.1496226, -1.901087, 1, 0.8235294, 0, 1,
-1.071954, 2.112211, -2.0679, 1, 0.827451, 0, 1,
-1.069414, 0.1218092, -1.470311, 1, 0.8352941, 0, 1,
-1.067562, 0.4861065, -0.9155359, 1, 0.8392157, 0, 1,
-1.067028, -0.7154381, -2.37907, 1, 0.8470588, 0, 1,
-1.066782, 1.21898, -2.317269, 1, 0.8509804, 0, 1,
-1.058547, -0.4326383, -2.172093, 1, 0.8588235, 0, 1,
-1.05721, 1.920327, -0.03860937, 1, 0.8627451, 0, 1,
-1.054314, 1.806401, -0.3966267, 1, 0.8705882, 0, 1,
-1.0533, -0.5603123, -1.37859, 1, 0.8745098, 0, 1,
-1.050049, -0.08684637, 0.7340548, 1, 0.8823529, 0, 1,
-1.038868, -0.8302571, -1.303681, 1, 0.8862745, 0, 1,
-1.02952, 0.6336433, -2.231841, 1, 0.8941177, 0, 1,
-1.029045, -0.3506053, -1.694635, 1, 0.8980392, 0, 1,
-1.027702, 2.9579, 1.187569, 1, 0.9058824, 0, 1,
-1.024632, 0.3645374, -0.8779607, 1, 0.9137255, 0, 1,
-1.018769, -0.8511424, -2.850914, 1, 0.9176471, 0, 1,
-1.012927, 0.1622129, -1.774143, 1, 0.9254902, 0, 1,
-1.012634, 1.251459, -0.1091882, 1, 0.9294118, 0, 1,
-1.011367, -0.1055741, -1.378696, 1, 0.9372549, 0, 1,
-1.010859, -0.1173707, -1.432762, 1, 0.9411765, 0, 1,
-1.006745, 1.146034, -0.268168, 1, 0.9490196, 0, 1,
-1.000207, 1.975023, 2.036714, 1, 0.9529412, 0, 1,
-0.9884604, 0.2328359, -0.4366098, 1, 0.9607843, 0, 1,
-0.987057, -0.7499429, -3.193113, 1, 0.9647059, 0, 1,
-0.9795129, 0.9847926, -0.7586757, 1, 0.972549, 0, 1,
-0.9754949, 1.225871, -1.256218, 1, 0.9764706, 0, 1,
-0.9731341, -1.452375, -3.469808, 1, 0.9843137, 0, 1,
-0.9721457, 0.3885825, -0.9615123, 1, 0.9882353, 0, 1,
-0.9712503, -0.5945749, -4.330154, 1, 0.9960784, 0, 1,
-0.9671287, 0.2778636, -0.9232713, 0.9960784, 1, 0, 1,
-0.9647633, 0.2070743, -2.233873, 0.9921569, 1, 0, 1,
-0.9578432, 0.8975353, -0.3512526, 0.9843137, 1, 0, 1,
-0.953136, -0.1061809, -1.840847, 0.9803922, 1, 0, 1,
-0.9486716, 2.574556, -2.049316, 0.972549, 1, 0, 1,
-0.9426802, 0.04142025, -1.20158, 0.9686275, 1, 0, 1,
-0.9407508, -0.1306563, -3.317405, 0.9607843, 1, 0, 1,
-0.9393126, -0.05185632, -2.742576, 0.9568627, 1, 0, 1,
-0.934898, 1.731104, 0.3449421, 0.9490196, 1, 0, 1,
-0.9336478, 0.5588292, -2.063766, 0.945098, 1, 0, 1,
-0.927817, 1.848516, -0.3437034, 0.9372549, 1, 0, 1,
-0.9254537, -0.02835185, -1.988358, 0.9333333, 1, 0, 1,
-0.9207869, -0.2727159, -2.009376, 0.9254902, 1, 0, 1,
-0.9165631, 0.4529177, -2.576778, 0.9215686, 1, 0, 1,
-0.915662, -1.31998, -1.1851, 0.9137255, 1, 0, 1,
-0.9150946, 0.3548441, -1.187658, 0.9098039, 1, 0, 1,
-0.9039695, 1.456915, 0.6452526, 0.9019608, 1, 0, 1,
-0.9007714, 0.318577, -0.792886, 0.8941177, 1, 0, 1,
-0.9003776, -0.7047777, -1.346477, 0.8901961, 1, 0, 1,
-0.8937093, -0.3824414, -3.17751, 0.8823529, 1, 0, 1,
-0.8934561, -0.41464, -4.112648, 0.8784314, 1, 0, 1,
-0.8908252, 0.05298123, -2.516704, 0.8705882, 1, 0, 1,
-0.8777894, -0.7708917, -1.633708, 0.8666667, 1, 0, 1,
-0.8751408, -0.2007539, -0.7711178, 0.8588235, 1, 0, 1,
-0.869638, 0.657326, -1.785205, 0.854902, 1, 0, 1,
-0.8668787, -0.9954345, -0.1740409, 0.8470588, 1, 0, 1,
-0.8657734, 1.127324, -0.8357663, 0.8431373, 1, 0, 1,
-0.8604692, -0.05929437, -3.571253, 0.8352941, 1, 0, 1,
-0.8585808, 1.640601, -0.4847969, 0.8313726, 1, 0, 1,
-0.8576885, 0.4223066, -1.085594, 0.8235294, 1, 0, 1,
-0.8558612, -0.02109859, -0.9561858, 0.8196079, 1, 0, 1,
-0.8516815, -0.1953475, -1.625266, 0.8117647, 1, 0, 1,
-0.8468184, -0.5462783, -0.8026408, 0.8078431, 1, 0, 1,
-0.8389855, -0.7998488, -3.564091, 0.8, 1, 0, 1,
-0.8379516, -0.5799987, -2.23995, 0.7921569, 1, 0, 1,
-0.8319401, 0.4519153, -0.2994664, 0.7882353, 1, 0, 1,
-0.8274573, 2.269591, -1.252075, 0.7803922, 1, 0, 1,
-0.8269502, 0.2675725, -2.799442, 0.7764706, 1, 0, 1,
-0.8259168, 0.7340273, -1.697535, 0.7686275, 1, 0, 1,
-0.8164095, -0.8164657, -0.7901415, 0.7647059, 1, 0, 1,
-0.8125288, -0.474612, -0.1439915, 0.7568628, 1, 0, 1,
-0.8078721, 0.8169612, 0.4613164, 0.7529412, 1, 0, 1,
-0.8075353, 2.178161, 0.01283905, 0.7450981, 1, 0, 1,
-0.8071104, -1.402491, -5.154159, 0.7411765, 1, 0, 1,
-0.8005421, 0.8450824, -0.01945525, 0.7333333, 1, 0, 1,
-0.7942608, -0.5627869, -2.909867, 0.7294118, 1, 0, 1,
-0.7930908, 0.3462057, -2.250093, 0.7215686, 1, 0, 1,
-0.789931, -1.603477, -2.147321, 0.7176471, 1, 0, 1,
-0.7806209, -1.518672, -2.134219, 0.7098039, 1, 0, 1,
-0.780553, 0.9531764, -0.9401981, 0.7058824, 1, 0, 1,
-0.7791725, 1.740364, 1.074379, 0.6980392, 1, 0, 1,
-0.7678958, 0.4930489, -2.055691, 0.6901961, 1, 0, 1,
-0.7659829, -1.363178, -2.900029, 0.6862745, 1, 0, 1,
-0.7502643, -0.3247432, -1.110695, 0.6784314, 1, 0, 1,
-0.7479522, 1.291058, 0.07783184, 0.6745098, 1, 0, 1,
-0.7478303, 0.1868816, -0.5271804, 0.6666667, 1, 0, 1,
-0.7430933, 0.3567091, 0.1423412, 0.6627451, 1, 0, 1,
-0.7380344, -0.4111972, -1.636685, 0.654902, 1, 0, 1,
-0.7376197, 2.603175, -1.253091, 0.6509804, 1, 0, 1,
-0.7371807, -1.904611, -3.772599, 0.6431373, 1, 0, 1,
-0.7363873, 0.7570127, -0.4366729, 0.6392157, 1, 0, 1,
-0.7361156, -0.9168868, -2.670429, 0.6313726, 1, 0, 1,
-0.729197, 0.7843557, -1.503317, 0.627451, 1, 0, 1,
-0.728637, -0.6319226, -4.211126, 0.6196079, 1, 0, 1,
-0.7195333, -0.9604599, -1.965668, 0.6156863, 1, 0, 1,
-0.7176312, 0.2918329, -1.739899, 0.6078432, 1, 0, 1,
-0.7161249, 0.3104491, -1.248089, 0.6039216, 1, 0, 1,
-0.7149458, 1.261754, -3.044477, 0.5960785, 1, 0, 1,
-0.7124085, -0.5106506, -2.937082, 0.5882353, 1, 0, 1,
-0.7110503, -0.000340337, -0.749668, 0.5843138, 1, 0, 1,
-0.7076941, 0.2327798, -1.233379, 0.5764706, 1, 0, 1,
-0.7033783, -0.1154203, -0.5494043, 0.572549, 1, 0, 1,
-0.6952981, 1.546411, 0.02481452, 0.5647059, 1, 0, 1,
-0.6885176, 0.6829714, -0.3954384, 0.5607843, 1, 0, 1,
-0.687424, -1.727062, -4.136986, 0.5529412, 1, 0, 1,
-0.6860769, 0.4452449, 0.8918046, 0.5490196, 1, 0, 1,
-0.6854193, -0.6980535, -1.436866, 0.5411765, 1, 0, 1,
-0.6840348, -1.715276, -3.592332, 0.5372549, 1, 0, 1,
-0.6834248, -1.36593, -2.456239, 0.5294118, 1, 0, 1,
-0.6822109, 0.05192961, -1.512433, 0.5254902, 1, 0, 1,
-0.6820775, 2.315182, -1.522712, 0.5176471, 1, 0, 1,
-0.6792736, -0.5102152, -0.2002261, 0.5137255, 1, 0, 1,
-0.6792446, -0.1213314, -1.895811, 0.5058824, 1, 0, 1,
-0.6788101, -1.265728, -4.948832, 0.5019608, 1, 0, 1,
-0.6780415, 1.056306, 0.143391, 0.4941176, 1, 0, 1,
-0.6774017, -0.5441334, -2.707988, 0.4862745, 1, 0, 1,
-0.6710234, -0.703165, -1.697023, 0.4823529, 1, 0, 1,
-0.6692868, 0.3288984, -2.679577, 0.4745098, 1, 0, 1,
-0.6669759, -0.2896091, -2.171376, 0.4705882, 1, 0, 1,
-0.6669493, 0.282308, -0.1564015, 0.4627451, 1, 0, 1,
-0.6663607, 0.9224375, -2.157952, 0.4588235, 1, 0, 1,
-0.6574749, 1.787544, 0.9749349, 0.4509804, 1, 0, 1,
-0.6550837, -1.416232, -2.772766, 0.4470588, 1, 0, 1,
-0.6433515, -0.7299479, -2.06772, 0.4392157, 1, 0, 1,
-0.6430138, -0.04817146, -2.456242, 0.4352941, 1, 0, 1,
-0.6374577, -0.8840129, -4.667304, 0.427451, 1, 0, 1,
-0.6370544, -1.075307, -2.259833, 0.4235294, 1, 0, 1,
-0.6295314, 1.295756, -2.330935, 0.4156863, 1, 0, 1,
-0.6283129, 1.108992, -0.5080777, 0.4117647, 1, 0, 1,
-0.6212319, -0.5905305, -3.155804, 0.4039216, 1, 0, 1,
-0.6207633, 0.2585905, -1.339803, 0.3960784, 1, 0, 1,
-0.6152835, 0.0920035, -0.9508197, 0.3921569, 1, 0, 1,
-0.6151056, 0.4523766, -0.2674269, 0.3843137, 1, 0, 1,
-0.6137382, 2.209049, -0.1541561, 0.3803922, 1, 0, 1,
-0.6127293, 0.6730583, 1.00301, 0.372549, 1, 0, 1,
-0.6114928, -0.04203053, -2.224526, 0.3686275, 1, 0, 1,
-0.6109188, 0.3020032, 0.6815201, 0.3607843, 1, 0, 1,
-0.6065087, 0.520059, -0.9372557, 0.3568628, 1, 0, 1,
-0.6060876, -0.1513508, 0.09919119, 0.3490196, 1, 0, 1,
-0.6034752, -0.1390912, -2.130868, 0.345098, 1, 0, 1,
-0.6031976, 0.06722985, -1.432076, 0.3372549, 1, 0, 1,
-0.5991608, -1.280517, -0.7828557, 0.3333333, 1, 0, 1,
-0.5972827, -0.2566907, -0.7208579, 0.3254902, 1, 0, 1,
-0.5969893, 0.0892489, -1.755525, 0.3215686, 1, 0, 1,
-0.5836153, -0.05130365, -2.123795, 0.3137255, 1, 0, 1,
-0.5798779, 1.140386, -0.885352, 0.3098039, 1, 0, 1,
-0.5719986, -1.60762, -3.123734, 0.3019608, 1, 0, 1,
-0.5675755, 1.460268, -1.277766, 0.2941177, 1, 0, 1,
-0.5656209, -0.6491895, -3.009871, 0.2901961, 1, 0, 1,
-0.5642306, 2.548887, -1.20244, 0.282353, 1, 0, 1,
-0.5630887, -0.7378263, -3.552094, 0.2784314, 1, 0, 1,
-0.5598555, -0.8518593, -1.827534, 0.2705882, 1, 0, 1,
-0.5579841, 1.564894, -0.3798829, 0.2666667, 1, 0, 1,
-0.5579082, -2.208869, -4.328876, 0.2588235, 1, 0, 1,
-0.5509998, -0.3503294, -2.385525, 0.254902, 1, 0, 1,
-0.547726, 0.9566491, -0.2322461, 0.2470588, 1, 0, 1,
-0.5436727, -0.8045924, -2.904386, 0.2431373, 1, 0, 1,
-0.5419338, 0.6563062, -1.210521, 0.2352941, 1, 0, 1,
-0.5405536, -0.1400345, -2.172321, 0.2313726, 1, 0, 1,
-0.5359769, 0.8865045, -1.072839, 0.2235294, 1, 0, 1,
-0.5295888, 1.190379, -0.6711881, 0.2196078, 1, 0, 1,
-0.5224416, 0.209233, -0.7879435, 0.2117647, 1, 0, 1,
-0.5222257, 0.3042801, 0.2008569, 0.2078431, 1, 0, 1,
-0.5186606, -1.063152, -2.484324, 0.2, 1, 0, 1,
-0.5180346, 0.5730471, -1.637479, 0.1921569, 1, 0, 1,
-0.514288, 0.544973, 0.4279227, 0.1882353, 1, 0, 1,
-0.5139627, 1.076296, -1.475265, 0.1803922, 1, 0, 1,
-0.5138565, 0.2599167, -0.9193021, 0.1764706, 1, 0, 1,
-0.5080645, -0.5795369, -1.277607, 0.1686275, 1, 0, 1,
-0.5078689, -0.1364138, -1.961947, 0.1647059, 1, 0, 1,
-0.5075252, 0.1810162, -0.9155995, 0.1568628, 1, 0, 1,
-0.5010762, -0.06804099, -3.620459, 0.1529412, 1, 0, 1,
-0.5006061, -0.155698, -1.55275, 0.145098, 1, 0, 1,
-0.4983675, 1.284144, 0.5189807, 0.1411765, 1, 0, 1,
-0.4974723, 0.191317, -2.550181, 0.1333333, 1, 0, 1,
-0.4965146, 0.416888, -2.706725, 0.1294118, 1, 0, 1,
-0.4937378, 0.4962644, -0.7137691, 0.1215686, 1, 0, 1,
-0.4906837, -0.3285576, 0.1917509, 0.1176471, 1, 0, 1,
-0.4876211, 0.6355385, -1.355677, 0.1098039, 1, 0, 1,
-0.4842817, -0.4813187, -3.757244, 0.1058824, 1, 0, 1,
-0.4820939, 0.1546526, -1.067323, 0.09803922, 1, 0, 1,
-0.4778955, 1.736003, -0.08371497, 0.09019608, 1, 0, 1,
-0.4775602, 0.1614163, -1.406524, 0.08627451, 1, 0, 1,
-0.4654918, 0.4806428, -0.8635261, 0.07843138, 1, 0, 1,
-0.4602217, 0.5370278, -1.033515, 0.07450981, 1, 0, 1,
-0.4570768, -0.1110867, -2.714376, 0.06666667, 1, 0, 1,
-0.4562246, 0.0959412, -2.243736, 0.0627451, 1, 0, 1,
-0.4549149, 0.9039454, -0.6932376, 0.05490196, 1, 0, 1,
-0.4511879, 1.82765, -1.681743, 0.05098039, 1, 0, 1,
-0.4507616, 0.5507834, -0.6021214, 0.04313726, 1, 0, 1,
-0.4448909, -0.1101713, 0.4175431, 0.03921569, 1, 0, 1,
-0.4373074, -0.07957113, -3.744977, 0.03137255, 1, 0, 1,
-0.4336659, 0.09344691, -1.496653, 0.02745098, 1, 0, 1,
-0.4336374, 1.650736, 0.04006521, 0.01960784, 1, 0, 1,
-0.4320655, -0.8269866, -2.411585, 0.01568628, 1, 0, 1,
-0.4311635, 1.093285, 0.06153344, 0.007843138, 1, 0, 1,
-0.4297896, 1.583876, -3.396647, 0.003921569, 1, 0, 1,
-0.4295404, -0.1429486, -0.5376524, 0, 1, 0.003921569, 1,
-0.4253578, 1.035457, -2.665064, 0, 1, 0.01176471, 1,
-0.4250955, -0.9749833, -1.995116, 0, 1, 0.01568628, 1,
-0.4220021, -0.1754961, -3.205643, 0, 1, 0.02352941, 1,
-0.4208852, -0.4728368, -1.910823, 0, 1, 0.02745098, 1,
-0.4199822, -0.6926225, -3.43, 0, 1, 0.03529412, 1,
-0.4103156, 0.939409, 0.04345438, 0, 1, 0.03921569, 1,
-0.4088046, -1.911929, -3.851233, 0, 1, 0.04705882, 1,
-0.4087834, -1.396716, -3.711422, 0, 1, 0.05098039, 1,
-0.4073693, 0.1824335, 0.3281401, 0, 1, 0.05882353, 1,
-0.4026729, -1.894768, -2.12512, 0, 1, 0.0627451, 1,
-0.3994252, -1.025021, -2.468201, 0, 1, 0.07058824, 1,
-0.3979577, -0.09538365, -1.363873, 0, 1, 0.07450981, 1,
-0.3966241, -0.01626123, -3.228842, 0, 1, 0.08235294, 1,
-0.3905103, 0.7696165, 0.3653178, 0, 1, 0.08627451, 1,
-0.386556, -1.353944, -2.574213, 0, 1, 0.09411765, 1,
-0.3862777, 0.9510747, -2.702006, 0, 1, 0.1019608, 1,
-0.3797565, 0.5946236, -0.2313547, 0, 1, 0.1058824, 1,
-0.3767591, 0.4015778, -2.420483, 0, 1, 0.1137255, 1,
-0.3766089, -0.4955216, -1.881139, 0, 1, 0.1176471, 1,
-0.3737668, 0.333482, -0.392552, 0, 1, 0.1254902, 1,
-0.3727731, -0.005035922, -2.349452, 0, 1, 0.1294118, 1,
-0.3709487, 0.5920475, -2.767878, 0, 1, 0.1372549, 1,
-0.3704278, -0.1955106, 0.4414856, 0, 1, 0.1411765, 1,
-0.369981, 1.193797, 0.3974897, 0, 1, 0.1490196, 1,
-0.3697373, 0.3387209, -0.1547562, 0, 1, 0.1529412, 1,
-0.3676509, -0.2622454, -1.174554, 0, 1, 0.1607843, 1,
-0.3657905, -1.244563, -3.395638, 0, 1, 0.1647059, 1,
-0.3621507, 0.5044699, -0.5646077, 0, 1, 0.172549, 1,
-0.3521604, 0.4869792, -2.417062, 0, 1, 0.1764706, 1,
-0.3478024, -1.695003, -3.607415, 0, 1, 0.1843137, 1,
-0.3468914, 1.327123, -0.9677115, 0, 1, 0.1882353, 1,
-0.3465512, -0.4596387, -1.292582, 0, 1, 0.1960784, 1,
-0.3463856, 0.9319017, -2.68016, 0, 1, 0.2039216, 1,
-0.3434232, 0.2305598, -1.508117, 0, 1, 0.2078431, 1,
-0.3428367, -0.6735531, -2.055726, 0, 1, 0.2156863, 1,
-0.3403868, 1.627293, 0.6184019, 0, 1, 0.2196078, 1,
-0.3349233, 1.002693, -1.532919, 0, 1, 0.227451, 1,
-0.334212, -1.584864, -1.732191, 0, 1, 0.2313726, 1,
-0.3340575, 0.9570587, 1.317975, 0, 1, 0.2392157, 1,
-0.3326579, 0.1344852, 0.5164551, 0, 1, 0.2431373, 1,
-0.3301851, -0.2980764, -1.659128, 0, 1, 0.2509804, 1,
-0.3291257, 0.2468502, -1.141928, 0, 1, 0.254902, 1,
-0.323888, 0.4705205, -0.4197816, 0, 1, 0.2627451, 1,
-0.3228894, -0.9728716, -4.063705, 0, 1, 0.2666667, 1,
-0.322443, 1.427515, -0.7344452, 0, 1, 0.2745098, 1,
-0.3188084, -0.496061, -2.424576, 0, 1, 0.2784314, 1,
-0.3146707, -1.448527, -2.008049, 0, 1, 0.2862745, 1,
-0.31425, 1.062773, -1.218274, 0, 1, 0.2901961, 1,
-0.3133847, -0.3221294, -1.560709, 0, 1, 0.2980392, 1,
-0.3082282, 0.2998933, -1.892714, 0, 1, 0.3058824, 1,
-0.3054186, 0.3509356, -1.504927, 0, 1, 0.3098039, 1,
-0.3053758, 1.852853, 2.199766, 0, 1, 0.3176471, 1,
-0.3037321, -1.46705, -2.41379, 0, 1, 0.3215686, 1,
-0.3030907, 0.5575989, -0.9193298, 0, 1, 0.3294118, 1,
-0.3029007, -0.7570396, -5.7266, 0, 1, 0.3333333, 1,
-0.3021059, 0.4441766, -2.172189, 0, 1, 0.3411765, 1,
-0.3019025, -0.09999911, -3.141546, 0, 1, 0.345098, 1,
-0.3012002, -0.5178551, -2.69699, 0, 1, 0.3529412, 1,
-0.2943287, -0.0662906, -2.59666, 0, 1, 0.3568628, 1,
-0.2906778, -0.6035032, -2.735744, 0, 1, 0.3647059, 1,
-0.2905876, -0.8487957, -3.105848, 0, 1, 0.3686275, 1,
-0.2897822, -1.550139, -3.65631, 0, 1, 0.3764706, 1,
-0.2897594, 0.01241811, -2.224273, 0, 1, 0.3803922, 1,
-0.2857066, 0.8624162, 1.95051, 0, 1, 0.3882353, 1,
-0.2808899, -1.763791, -4.321288, 0, 1, 0.3921569, 1,
-0.2807375, -1.45845, -3.740094, 0, 1, 0.4, 1,
-0.2791422, 0.1375282, -1.423013, 0, 1, 0.4078431, 1,
-0.2777008, -0.1367074, -0.9947135, 0, 1, 0.4117647, 1,
-0.2760077, 2.037237, 0.4241782, 0, 1, 0.4196078, 1,
-0.2735052, 0.1497359, -0.265205, 0, 1, 0.4235294, 1,
-0.2718285, -0.308019, -2.072124, 0, 1, 0.4313726, 1,
-0.2680658, -1.325026, -3.183705, 0, 1, 0.4352941, 1,
-0.2663239, -1.694436, -2.769369, 0, 1, 0.4431373, 1,
-0.2627929, 0.2286197, -0.07287663, 0, 1, 0.4470588, 1,
-0.2614973, -0.1164962, -1.482277, 0, 1, 0.454902, 1,
-0.2608159, -0.7204275, -2.130358, 0, 1, 0.4588235, 1,
-0.2510473, 0.6985397, -0.1784586, 0, 1, 0.4666667, 1,
-0.2490656, -0.8334579, -1.274223, 0, 1, 0.4705882, 1,
-0.2474824, -0.1136433, 0.06320763, 0, 1, 0.4784314, 1,
-0.2439796, 0.8665444, -0.6405055, 0, 1, 0.4823529, 1,
-0.242483, 0.5651143, -0.8825433, 0, 1, 0.4901961, 1,
-0.2359421, -0.06721597, -1.863773, 0, 1, 0.4941176, 1,
-0.2356118, -0.1351167, -1.795736, 0, 1, 0.5019608, 1,
-0.233677, -0.1570767, -1.349844, 0, 1, 0.509804, 1,
-0.2303004, -0.1316322, -1.182091, 0, 1, 0.5137255, 1,
-0.2262567, -2.131491, -2.73533, 0, 1, 0.5215687, 1,
-0.2261447, -0.5241647, -2.171514, 0, 1, 0.5254902, 1,
-0.2240071, 1.413449, -0.711279, 0, 1, 0.5333334, 1,
-0.2218876, -0.4061886, -3.910721, 0, 1, 0.5372549, 1,
-0.2210723, -0.05529602, -1.671516, 0, 1, 0.5450981, 1,
-0.2184324, -1.070247, -2.779327, 0, 1, 0.5490196, 1,
-0.2168511, 0.0676007, -0.2742582, 0, 1, 0.5568628, 1,
-0.2166656, 0.5382182, 0.1657752, 0, 1, 0.5607843, 1,
-0.2165971, 0.4385762, -1.480081, 0, 1, 0.5686275, 1,
-0.2129752, -0.3677424, -4.668572, 0, 1, 0.572549, 1,
-0.2107509, -0.7308771, -2.774634, 0, 1, 0.5803922, 1,
-0.2103438, 1.375326, -1.337578, 0, 1, 0.5843138, 1,
-0.2087754, 0.4326517, -1.486263, 0, 1, 0.5921569, 1,
-0.2084675, 0.7916002, -0.9727216, 0, 1, 0.5960785, 1,
-0.20761, 0.07001837, -0.6227136, 0, 1, 0.6039216, 1,
-0.206946, 0.7461344, -0.8344582, 0, 1, 0.6117647, 1,
-0.1989208, 1.381207, -0.06794801, 0, 1, 0.6156863, 1,
-0.1963293, 0.6762705, 0.9981024, 0, 1, 0.6235294, 1,
-0.1954181, 0.433898, 1.256415, 0, 1, 0.627451, 1,
-0.1916263, 0.6770861, 0.863164, 0, 1, 0.6352941, 1,
-0.1869131, 0.7576693, -0.3388562, 0, 1, 0.6392157, 1,
-0.180369, -1.813537, -0.5075917, 0, 1, 0.6470588, 1,
-0.1797511, -0.4757657, -3.308284, 0, 1, 0.6509804, 1,
-0.1776955, -0.3450795, -2.81538, 0, 1, 0.6588235, 1,
-0.1763318, 0.1370978, 1.044395, 0, 1, 0.6627451, 1,
-0.1737139, -0.7527096, -1.454549, 0, 1, 0.6705883, 1,
-0.1723586, 0.7265776, 1.286202, 0, 1, 0.6745098, 1,
-0.1700638, -0.9319146, -4.380583, 0, 1, 0.682353, 1,
-0.1672723, 1.439867, -0.5860705, 0, 1, 0.6862745, 1,
-0.1672529, -0.922217, -2.09371, 0, 1, 0.6941177, 1,
-0.1632112, 0.834722, 0.30371, 0, 1, 0.7019608, 1,
-0.1616829, -0.1836681, -0.6829199, 0, 1, 0.7058824, 1,
-0.1554702, 0.04134139, -2.105118, 0, 1, 0.7137255, 1,
-0.1540601, 0.5560729, -0.7240984, 0, 1, 0.7176471, 1,
-0.1510459, -0.7856096, -3.326579, 0, 1, 0.7254902, 1,
-0.1489477, 0.01680133, -0.7156001, 0, 1, 0.7294118, 1,
-0.1452376, 0.3227203, -2.028828, 0, 1, 0.7372549, 1,
-0.1448685, -2.489459, -4.183373, 0, 1, 0.7411765, 1,
-0.1438258, 0.9050215, -1.095313, 0, 1, 0.7490196, 1,
-0.1428372, -1.780184, -4.19446, 0, 1, 0.7529412, 1,
-0.133054, 0.3937525, 0.8457764, 0, 1, 0.7607843, 1,
-0.1325348, -0.7610007, -2.796865, 0, 1, 0.7647059, 1,
-0.1295409, -0.3581483, -2.558438, 0, 1, 0.772549, 1,
-0.1264443, -1.615948, -2.268272, 0, 1, 0.7764706, 1,
-0.1263933, 0.2597789, -2.102848, 0, 1, 0.7843137, 1,
-0.1240285, 0.4587524, 1.04541, 0, 1, 0.7882353, 1,
-0.1198144, -1.462676, -4.437091, 0, 1, 0.7960784, 1,
-0.1138645, -0.5315365, -4.444561, 0, 1, 0.8039216, 1,
-0.1114892, -0.3030962, -4.886075, 0, 1, 0.8078431, 1,
-0.1094693, -0.1246642, -2.148161, 0, 1, 0.8156863, 1,
-0.1067005, 0.5489117, 0.1313057, 0, 1, 0.8196079, 1,
-0.1034423, 0.6034722, -1.306674, 0, 1, 0.827451, 1,
-0.1032178, -1.065843, -5.081729, 0, 1, 0.8313726, 1,
-0.09733059, 0.217826, -0.4832214, 0, 1, 0.8392157, 1,
-0.09525194, 2.271232, 1.006528, 0, 1, 0.8431373, 1,
-0.09374374, -0.2300713, -3.57786, 0, 1, 0.8509804, 1,
-0.09214261, -1.744826, -3.108644, 0, 1, 0.854902, 1,
-0.09134692, 0.5537187, -1.853985, 0, 1, 0.8627451, 1,
-0.09040289, 0.5289404, -0.1315947, 0, 1, 0.8666667, 1,
-0.08712348, 2.568418, -0.1691106, 0, 1, 0.8745098, 1,
-0.08128529, -2.151897, -1.977004, 0, 1, 0.8784314, 1,
-0.08117739, -0.4900561, -2.844533, 0, 1, 0.8862745, 1,
-0.07818228, 0.132142, -0.9382878, 0, 1, 0.8901961, 1,
-0.07733668, -0.3863502, -1.218878, 0, 1, 0.8980392, 1,
-0.07697897, 0.8086912, 2.082687, 0, 1, 0.9058824, 1,
-0.07575855, -0.02003375, -3.069491, 0, 1, 0.9098039, 1,
-0.07534928, 1.220029, 1.106967, 0, 1, 0.9176471, 1,
-0.07534736, -0.6667657, -2.474561, 0, 1, 0.9215686, 1,
-0.07478433, -0.2025338, -1.888945, 0, 1, 0.9294118, 1,
-0.07099915, -0.4757049, -0.8055185, 0, 1, 0.9333333, 1,
-0.06886759, -0.6387467, -3.043391, 0, 1, 0.9411765, 1,
-0.06831829, 0.6529692, 0.8654099, 0, 1, 0.945098, 1,
-0.06359442, -1.640473, -1.403891, 0, 1, 0.9529412, 1,
-0.06053991, 0.1578175, -0.4688896, 0, 1, 0.9568627, 1,
-0.05842383, -0.9968439, -1.75678, 0, 1, 0.9647059, 1,
-0.05820227, 1.241154, 0.9564166, 0, 1, 0.9686275, 1,
-0.05722119, -0.3443388, -0.6895977, 0, 1, 0.9764706, 1,
-0.05602802, -0.6078624, -2.642972, 0, 1, 0.9803922, 1,
-0.03691163, -0.6223528, -3.257412, 0, 1, 0.9882353, 1,
-0.03622571, -1.539555, -2.231293, 0, 1, 0.9921569, 1,
-0.03485494, -0.03615332, -1.296879, 0, 1, 1, 1,
-0.03317593, -0.3480625, -3.718851, 0, 0.9921569, 1, 1,
-0.02013807, 1.177884, -0.3536714, 0, 0.9882353, 1, 1,
-0.01999219, 2.325702, -0.4452966, 0, 0.9803922, 1, 1,
-0.01821923, 1.278135, -0.7008022, 0, 0.9764706, 1, 1,
-0.008174641, 0.7776524, -0.1072311, 0, 0.9686275, 1, 1,
-0.0066347, -0.8232803, -3.064894, 0, 0.9647059, 1, 1,
-0.00552174, -0.8027095, -3.284942, 0, 0.9568627, 1, 1,
-0.005020678, -1.839673, -1.820821, 0, 0.9529412, 1, 1,
-0.004561584, 1.053639, 0.7877049, 0, 0.945098, 1, 1,
-0.002052172, -0.5133553, -4.45133, 0, 0.9411765, 1, 1,
-0.001504873, 0.1066756, 1.992099, 0, 0.9333333, 1, 1,
0.001740543, -0.333465, 2.946589, 0, 0.9294118, 1, 1,
0.001828124, 0.6788579, -0.2532275, 0, 0.9215686, 1, 1,
0.00288747, -1.291137, 3.735999, 0, 0.9176471, 1, 1,
0.006443892, -0.4673118, 5.787386, 0, 0.9098039, 1, 1,
0.01107255, 0.08305891, 1.083027, 0, 0.9058824, 1, 1,
0.01171264, -1.113202, 4.48683, 0, 0.8980392, 1, 1,
0.01426031, 0.5822497, -0.4553842, 0, 0.8901961, 1, 1,
0.01657306, 0.3954306, -1.408423, 0, 0.8862745, 1, 1,
0.01990387, 0.4683172, -1.30148, 0, 0.8784314, 1, 1,
0.02146828, 1.820197, 0.3190878, 0, 0.8745098, 1, 1,
0.02178979, -0.4297157, 3.660043, 0, 0.8666667, 1, 1,
0.02312632, 0.1284245, 0.4874451, 0, 0.8627451, 1, 1,
0.02474845, -0.4192336, 3.45981, 0, 0.854902, 1, 1,
0.02678757, 1.166653, -0.5746583, 0, 0.8509804, 1, 1,
0.0295612, -0.1170379, 1.290962, 0, 0.8431373, 1, 1,
0.03408807, 0.3840076, -1.273517, 0, 0.8392157, 1, 1,
0.03515592, 1.130438, 1.060748, 0, 0.8313726, 1, 1,
0.0381912, -2.135039, 1.585418, 0, 0.827451, 1, 1,
0.04038789, -0.05638162, 0.4219398, 0, 0.8196079, 1, 1,
0.04206623, -2.204234, 2.373277, 0, 0.8156863, 1, 1,
0.04436524, 0.8550262, 0.5094736, 0, 0.8078431, 1, 1,
0.04600544, 0.1681841, -0.8848177, 0, 0.8039216, 1, 1,
0.04735735, -0.7222294, 4.179266, 0, 0.7960784, 1, 1,
0.04808661, 1.039491, -0.8331015, 0, 0.7882353, 1, 1,
0.0512503, 0.3801145, 1.168422, 0, 0.7843137, 1, 1,
0.05158202, -1.6318, 4.813764, 0, 0.7764706, 1, 1,
0.05191081, -0.8645772, 2.707991, 0, 0.772549, 1, 1,
0.05260893, 0.1553134, -0.09667774, 0, 0.7647059, 1, 1,
0.05327008, 0.4697165, -0.3467446, 0, 0.7607843, 1, 1,
0.0549472, 1.767516, 0.7398738, 0, 0.7529412, 1, 1,
0.05499288, 1.155689, -1.743843, 0, 0.7490196, 1, 1,
0.05543035, -1.10307, 2.544171, 0, 0.7411765, 1, 1,
0.0557831, -0.08542009, 2.094826, 0, 0.7372549, 1, 1,
0.05609335, 1.78821, 2.375144, 0, 0.7294118, 1, 1,
0.05729753, -0.584827, 3.812391, 0, 0.7254902, 1, 1,
0.0601899, -1.631896, 4.737105, 0, 0.7176471, 1, 1,
0.06180211, 0.3846689, 0.7635642, 0, 0.7137255, 1, 1,
0.06693871, 0.4917157, -0.1589235, 0, 0.7058824, 1, 1,
0.06784748, 1.510507, -1.114809, 0, 0.6980392, 1, 1,
0.07049277, 0.5894699, 0.1047971, 0, 0.6941177, 1, 1,
0.07083725, -1.39765, 2.338582, 0, 0.6862745, 1, 1,
0.07369879, -1.433058, 1.536436, 0, 0.682353, 1, 1,
0.07566741, -0.4825804, 0.5732319, 0, 0.6745098, 1, 1,
0.08571377, -0.8401427, 3.15602, 0, 0.6705883, 1, 1,
0.09576729, -0.3669859, 3.318534, 0, 0.6627451, 1, 1,
0.1006425, -0.7751437, 4.547152, 0, 0.6588235, 1, 1,
0.100716, -0.1039149, 2.751193, 0, 0.6509804, 1, 1,
0.1008478, -0.4774405, 3.143292, 0, 0.6470588, 1, 1,
0.101031, 1.83972, 1.436105, 0, 0.6392157, 1, 1,
0.1014407, -1.859573, 4.217349, 0, 0.6352941, 1, 1,
0.1043317, 1.40561, -1.648233, 0, 0.627451, 1, 1,
0.1073294, 1.925824, 0.5420499, 0, 0.6235294, 1, 1,
0.1113572, 0.276116, -0.6174192, 0, 0.6156863, 1, 1,
0.1139935, -0.6051591, 2.171897, 0, 0.6117647, 1, 1,
0.1200734, 0.06441264, 2.982998, 0, 0.6039216, 1, 1,
0.1214177, -1.17617, 3.533654, 0, 0.5960785, 1, 1,
0.1299838, 0.06308699, 0.7104619, 0, 0.5921569, 1, 1,
0.1383594, -1.401198, 2.744675, 0, 0.5843138, 1, 1,
0.1391231, 0.4698601, 0.6138853, 0, 0.5803922, 1, 1,
0.143952, 1.952889, 0.8668878, 0, 0.572549, 1, 1,
0.1477678, 0.1508551, -0.6398743, 0, 0.5686275, 1, 1,
0.1531967, -0.6504734, 3.295059, 0, 0.5607843, 1, 1,
0.153202, 0.2840535, 1.799109, 0, 0.5568628, 1, 1,
0.1585698, 1.248812, 1.871539, 0, 0.5490196, 1, 1,
0.159869, 1.238856, -0.5072352, 0, 0.5450981, 1, 1,
0.1623504, -0.2288295, 2.723321, 0, 0.5372549, 1, 1,
0.1630548, 0.5345836, 1.333055, 0, 0.5333334, 1, 1,
0.1647458, -0.03492585, 2.050563, 0, 0.5254902, 1, 1,
0.1667178, 0.9641885, 2.111817, 0, 0.5215687, 1, 1,
0.1686809, -0.6614161, 4.169094, 0, 0.5137255, 1, 1,
0.17387, -1.226223, 2.594991, 0, 0.509804, 1, 1,
0.1749513, -1.259368, 3.552435, 0, 0.5019608, 1, 1,
0.1787666, 1.479411, 2.072242, 0, 0.4941176, 1, 1,
0.1800455, 0.3442558, -1.721158, 0, 0.4901961, 1, 1,
0.1808644, 0.7091619, -0.3332508, 0, 0.4823529, 1, 1,
0.1818482, -0.7510722, 3.315186, 0, 0.4784314, 1, 1,
0.1821935, 0.448662, 1.529706, 0, 0.4705882, 1, 1,
0.1825796, 1.090724, -0.4137624, 0, 0.4666667, 1, 1,
0.1855998, 0.05839496, 1.338272, 0, 0.4588235, 1, 1,
0.1883481, -0.2112076, 3.997118, 0, 0.454902, 1, 1,
0.1900049, -0.8577928, 1.409258, 0, 0.4470588, 1, 1,
0.193358, 0.07642458, 0.02473404, 0, 0.4431373, 1, 1,
0.1943207, -0.9528514, 2.070532, 0, 0.4352941, 1, 1,
0.2002481, 0.8735229, 2.074746, 0, 0.4313726, 1, 1,
0.2062924, 1.723949, 0.5188502, 0, 0.4235294, 1, 1,
0.2065412, -0.4628303, 3.385847, 0, 0.4196078, 1, 1,
0.2080801, 0.3443204, 0.4156823, 0, 0.4117647, 1, 1,
0.21151, -1.259392, 2.804056, 0, 0.4078431, 1, 1,
0.2134617, -1.895812, 1.164484, 0, 0.4, 1, 1,
0.2186883, 0.7539454, 1.741503, 0, 0.3921569, 1, 1,
0.2187405, -0.7624709, 2.522561, 0, 0.3882353, 1, 1,
0.2226843, -0.2053431, 3.231527, 0, 0.3803922, 1, 1,
0.2255453, 0.01535178, 3.360674, 0, 0.3764706, 1, 1,
0.2257188, 0.7334285, 1.433044, 0, 0.3686275, 1, 1,
0.2284224, -0.5781261, 1.601995, 0, 0.3647059, 1, 1,
0.2300683, -0.2100924, -0.1254175, 0, 0.3568628, 1, 1,
0.2317491, 1.734345, -0.8669905, 0, 0.3529412, 1, 1,
0.2320375, -0.4045955, 1.279477, 0, 0.345098, 1, 1,
0.232718, 0.7973961, 0.6072145, 0, 0.3411765, 1, 1,
0.2336532, 0.9440202, 0.91614, 0, 0.3333333, 1, 1,
0.2411396, -0.2381467, 1.464387, 0, 0.3294118, 1, 1,
0.2436279, -1.589865, 2.271013, 0, 0.3215686, 1, 1,
0.2451854, 1.098507, 1.087627, 0, 0.3176471, 1, 1,
0.256016, -0.1743976, 2.860354, 0, 0.3098039, 1, 1,
0.2572158, -0.2821076, 2.942554, 0, 0.3058824, 1, 1,
0.2575599, 0.3522889, 1.082016, 0, 0.2980392, 1, 1,
0.2598456, -1.422439, 3.896139, 0, 0.2901961, 1, 1,
0.2599449, 0.4845112, 0.0193752, 0, 0.2862745, 1, 1,
0.2650181, -1.270265, 2.779487, 0, 0.2784314, 1, 1,
0.2665085, 0.1820955, 1.469383, 0, 0.2745098, 1, 1,
0.269909, -0.08130358, 4.0179, 0, 0.2666667, 1, 1,
0.2710328, -0.4564566, 1.617457, 0, 0.2627451, 1, 1,
0.2799725, -1.691211, 3.197458, 0, 0.254902, 1, 1,
0.2829786, 1.238069, -0.9000896, 0, 0.2509804, 1, 1,
0.2834356, 1.336866, 2.119404, 0, 0.2431373, 1, 1,
0.2852899, -0.572548, 4.449991, 0, 0.2392157, 1, 1,
0.2869284, -1.218856, 3.826266, 0, 0.2313726, 1, 1,
0.2874429, 1.244408, -1.80794, 0, 0.227451, 1, 1,
0.2900093, 1.06345, 1.746962, 0, 0.2196078, 1, 1,
0.2925921, -0.3129285, 2.791469, 0, 0.2156863, 1, 1,
0.2980163, 0.09146512, 1.293068, 0, 0.2078431, 1, 1,
0.2990272, 1.213948, 1.172682, 0, 0.2039216, 1, 1,
0.301106, 2.363406, -0.2825698, 0, 0.1960784, 1, 1,
0.3013221, -0.7372727, 3.850993, 0, 0.1882353, 1, 1,
0.3022814, 0.1441271, 1.837264, 0, 0.1843137, 1, 1,
0.3026793, -0.6876369, 3.740227, 0, 0.1764706, 1, 1,
0.303157, 0.3699299, 0.6647535, 0, 0.172549, 1, 1,
0.3067839, 0.4472254, 1.123188, 0, 0.1647059, 1, 1,
0.3106245, 1.300742, 1.699846, 0, 0.1607843, 1, 1,
0.3127826, 0.4328144, 0.9693285, 0, 0.1529412, 1, 1,
0.3132641, -0.2593495, 3.030427, 0, 0.1490196, 1, 1,
0.3196093, 0.3456451, 1.090183, 0, 0.1411765, 1, 1,
0.3202987, 0.09190355, 3.189946, 0, 0.1372549, 1, 1,
0.3206115, -1.55395, 1.72851, 0, 0.1294118, 1, 1,
0.3223968, 1.142582, -0.3500136, 0, 0.1254902, 1, 1,
0.3235359, -0.8066101, 3.10202, 0, 0.1176471, 1, 1,
0.3246561, 0.7317678, 0.8255171, 0, 0.1137255, 1, 1,
0.3275488, 1.231756, -0.11874, 0, 0.1058824, 1, 1,
0.3349068, -1.057265, 3.924395, 0, 0.09803922, 1, 1,
0.3412719, 0.2925759, 2.397742, 0, 0.09411765, 1, 1,
0.3429724, -0.009815987, 0.9445633, 0, 0.08627451, 1, 1,
0.343163, 0.2707876, 1.238497, 0, 0.08235294, 1, 1,
0.3447122, -0.8982674, 3.485168, 0, 0.07450981, 1, 1,
0.3474443, 0.8420261, 0.5428486, 0, 0.07058824, 1, 1,
0.3510728, 0.5087862, 1.601344, 0, 0.0627451, 1, 1,
0.3541605, 0.1782025, -0.4892179, 0, 0.05882353, 1, 1,
0.3541947, 1.576577, 1.439693, 0, 0.05098039, 1, 1,
0.3620347, 1.263531, 1.136496, 0, 0.04705882, 1, 1,
0.3630058, 0.1752577, 0.3432159, 0, 0.03921569, 1, 1,
0.3658164, -1.407206, 3.676406, 0, 0.03529412, 1, 1,
0.3701274, 0.7284483, 1.510107, 0, 0.02745098, 1, 1,
0.370425, 1.527315, 0.6533706, 0, 0.02352941, 1, 1,
0.3715029, -0.8183932, 2.204473, 0, 0.01568628, 1, 1,
0.37152, -0.9576634, 2.784781, 0, 0.01176471, 1, 1,
0.376225, 2.141348, -0.2746217, 0, 0.003921569, 1, 1,
0.3771287, -0.009157578, 0.9184444, 0.003921569, 0, 1, 1,
0.3788014, -0.6086934, 3.436631, 0.007843138, 0, 1, 1,
0.3798116, -0.9804178, 4.054292, 0.01568628, 0, 1, 1,
0.3860295, 0.3204741, 1.157383, 0.01960784, 0, 1, 1,
0.3926983, 1.005879, 0.4968182, 0.02745098, 0, 1, 1,
0.3938788, 0.9426863, -1.462278, 0.03137255, 0, 1, 1,
0.3970493, -1.268119, 2.124961, 0.03921569, 0, 1, 1,
0.3982027, -1.069559, 1.878936, 0.04313726, 0, 1, 1,
0.4030039, -0.5283021, 3.387962, 0.05098039, 0, 1, 1,
0.4041223, -0.6249028, 2.846694, 0.05490196, 0, 1, 1,
0.4079429, 1.6333, -0.2171356, 0.0627451, 0, 1, 1,
0.4122303, -0.8844994, 1.711262, 0.06666667, 0, 1, 1,
0.4139611, -0.5172529, 2.807559, 0.07450981, 0, 1, 1,
0.4150526, 0.8892003, 0.3446307, 0.07843138, 0, 1, 1,
0.4169115, 0.3983487, 1.987781, 0.08627451, 0, 1, 1,
0.4200188, 0.8272282, 0.9633243, 0.09019608, 0, 1, 1,
0.4245458, 0.5584511, 0.9171684, 0.09803922, 0, 1, 1,
0.4262778, -1.680536, 3.486028, 0.1058824, 0, 1, 1,
0.4273821, -0.3973418, 2.876833, 0.1098039, 0, 1, 1,
0.4302361, 0.3017409, 1.198725, 0.1176471, 0, 1, 1,
0.4425396, 0.8100135, -0.5265195, 0.1215686, 0, 1, 1,
0.4481086, 0.03385146, 0.9456678, 0.1294118, 0, 1, 1,
0.4507209, -0.0301533, -0.0844568, 0.1333333, 0, 1, 1,
0.4536466, 2.227547, 0.2329298, 0.1411765, 0, 1, 1,
0.4549842, 0.6150026, 0.8759333, 0.145098, 0, 1, 1,
0.4599561, 0.5324981, 0.5254925, 0.1529412, 0, 1, 1,
0.4607373, -0.5371819, 4.308371, 0.1568628, 0, 1, 1,
0.4631909, 0.2910233, -0.7826382, 0.1647059, 0, 1, 1,
0.4644697, -0.5375396, 2.65396, 0.1686275, 0, 1, 1,
0.4651258, -0.172123, 1.979889, 0.1764706, 0, 1, 1,
0.4697699, 0.2741175, 1.997423, 0.1803922, 0, 1, 1,
0.4766808, -1.518587, 2.126796, 0.1882353, 0, 1, 1,
0.4847399, -0.4975592, 3.343794, 0.1921569, 0, 1, 1,
0.4959481, -0.08119104, 2.68918, 0.2, 0, 1, 1,
0.4974149, -1.272894, 2.782524, 0.2078431, 0, 1, 1,
0.5009378, 0.8425359, -0.3699181, 0.2117647, 0, 1, 1,
0.5015521, 1.220211, 0.8511546, 0.2196078, 0, 1, 1,
0.5037887, 0.6415331, 0.2784782, 0.2235294, 0, 1, 1,
0.5056227, 1.033196, 0.2816896, 0.2313726, 0, 1, 1,
0.5083613, 0.4272254, 2.733991, 0.2352941, 0, 1, 1,
0.5100053, -0.8157655, 3.55262, 0.2431373, 0, 1, 1,
0.5110269, -1.227858, 3.200253, 0.2470588, 0, 1, 1,
0.516745, -1.168395, 2.224694, 0.254902, 0, 1, 1,
0.5195744, 1.68353, 1.091149, 0.2588235, 0, 1, 1,
0.5199119, -0.2138643, 3.372344, 0.2666667, 0, 1, 1,
0.5222008, -0.4339709, 1.920532, 0.2705882, 0, 1, 1,
0.5222313, -1.969587, 3.311439, 0.2784314, 0, 1, 1,
0.5225003, -0.06491748, 2.73751, 0.282353, 0, 1, 1,
0.5242156, -0.3936345, 2.532806, 0.2901961, 0, 1, 1,
0.5253007, -0.05359808, 1.404127, 0.2941177, 0, 1, 1,
0.5287012, 0.06860738, -0.04728666, 0.3019608, 0, 1, 1,
0.5298544, 0.404823, 0.9522335, 0.3098039, 0, 1, 1,
0.5311272, 0.2239159, 0.2916657, 0.3137255, 0, 1, 1,
0.5391352, -0.741543, 3.655653, 0.3215686, 0, 1, 1,
0.5409132, 1.418531, 0.3432663, 0.3254902, 0, 1, 1,
0.5429854, -0.2743511, 1.728788, 0.3333333, 0, 1, 1,
0.5455674, 0.8454435, 2.185852, 0.3372549, 0, 1, 1,
0.5455834, -1.334732, 3.407991, 0.345098, 0, 1, 1,
0.5486095, -0.750979, 2.587029, 0.3490196, 0, 1, 1,
0.54913, 1.543524, -1.48586, 0.3568628, 0, 1, 1,
0.5496771, 0.3880757, -0.5229282, 0.3607843, 0, 1, 1,
0.5550525, 1.81477, 1.163039, 0.3686275, 0, 1, 1,
0.5611247, 1.325304, 0.6975105, 0.372549, 0, 1, 1,
0.5640088, 0.3478056, 0.4746868, 0.3803922, 0, 1, 1,
0.5700477, 0.1544699, 1.756226, 0.3843137, 0, 1, 1,
0.574458, 1.652825, -0.3658382, 0.3921569, 0, 1, 1,
0.580304, -0.2024726, 1.44957, 0.3960784, 0, 1, 1,
0.5843351, 0.6102653, 1.068626, 0.4039216, 0, 1, 1,
0.5902133, -0.8598536, 1.508808, 0.4117647, 0, 1, 1,
0.5920544, -0.3418409, 1.20051, 0.4156863, 0, 1, 1,
0.5977762, 0.5059262, 1.1519, 0.4235294, 0, 1, 1,
0.6026513, 1.113911, 0.179359, 0.427451, 0, 1, 1,
0.6050733, 0.1999526, 1.577866, 0.4352941, 0, 1, 1,
0.6160189, -0.8647243, 1.64665, 0.4392157, 0, 1, 1,
0.6219531, -0.545755, 2.495273, 0.4470588, 0, 1, 1,
0.6303383, -0.5224295, 4.763191, 0.4509804, 0, 1, 1,
0.6308067, -1.767055, 2.975167, 0.4588235, 0, 1, 1,
0.6368857, 0.89025, 1.427936, 0.4627451, 0, 1, 1,
0.641708, 1.206272, 0.3457867, 0.4705882, 0, 1, 1,
0.6422497, -0.4541452, 1.779135, 0.4745098, 0, 1, 1,
0.6434255, 1.838229, -0.2156655, 0.4823529, 0, 1, 1,
0.6434791, 0.2431397, 2.48542, 0.4862745, 0, 1, 1,
0.6438746, 0.2146724, 1.188528, 0.4941176, 0, 1, 1,
0.6485957, 1.083032, -1.21856, 0.5019608, 0, 1, 1,
0.6499769, 0.9171515, 0.363316, 0.5058824, 0, 1, 1,
0.6505688, 1.741662, 1.607362, 0.5137255, 0, 1, 1,
0.6544443, -2.198736, 3.71093, 0.5176471, 0, 1, 1,
0.6547379, -0.5765917, 3.008631, 0.5254902, 0, 1, 1,
0.6553634, -0.7890497, 1.32032, 0.5294118, 0, 1, 1,
0.6574872, -1.11162, 3.208939, 0.5372549, 0, 1, 1,
0.6599918, 0.5496941, 2.816229, 0.5411765, 0, 1, 1,
0.6638981, -0.3628071, 0.7088397, 0.5490196, 0, 1, 1,
0.6642011, 0.580206, 0.9411933, 0.5529412, 0, 1, 1,
0.6648638, -1.127513, 2.7866, 0.5607843, 0, 1, 1,
0.6741651, -0.3460812, -1.852636, 0.5647059, 0, 1, 1,
0.6753329, 1.357224, 0.6458978, 0.572549, 0, 1, 1,
0.6762622, 0.1351852, 1.659698, 0.5764706, 0, 1, 1,
0.6811665, 0.6165593, -0.8500597, 0.5843138, 0, 1, 1,
0.6856092, 1.722939, 0.48137, 0.5882353, 0, 1, 1,
0.693092, -0.9258971, 3.033261, 0.5960785, 0, 1, 1,
0.6960645, -0.4175905, 1.661987, 0.6039216, 0, 1, 1,
0.7042035, -0.9091104, 3.708117, 0.6078432, 0, 1, 1,
0.70471, 2.316666, 0.008754619, 0.6156863, 0, 1, 1,
0.7056047, -0.822692, 2.873259, 0.6196079, 0, 1, 1,
0.7058181, -0.906444, 2.840112, 0.627451, 0, 1, 1,
0.7183807, 0.2440881, 1.030308, 0.6313726, 0, 1, 1,
0.7320572, 0.09309798, 0.4556032, 0.6392157, 0, 1, 1,
0.734964, -0.6586698, 3.305927, 0.6431373, 0, 1, 1,
0.7355831, 0.3734732, 1.23296, 0.6509804, 0, 1, 1,
0.7370106, -0.5867549, 1.672171, 0.654902, 0, 1, 1,
0.7378779, -2.390756, 0.07540032, 0.6627451, 0, 1, 1,
0.7397194, -0.9283463, 3.00235, 0.6666667, 0, 1, 1,
0.7409388, -0.7905406, 1.010728, 0.6745098, 0, 1, 1,
0.7478398, -0.2094938, 0.6605439, 0.6784314, 0, 1, 1,
0.7481109, 0.3773943, 0.9680339, 0.6862745, 0, 1, 1,
0.7482134, -0.641657, 1.335002, 0.6901961, 0, 1, 1,
0.751119, 0.302804, 0.06063139, 0.6980392, 0, 1, 1,
0.7656623, -1.834821, 0.9733838, 0.7058824, 0, 1, 1,
0.770318, 0.3699208, 1.804603, 0.7098039, 0, 1, 1,
0.7791533, 0.8522791, -0.9177, 0.7176471, 0, 1, 1,
0.7845418, 0.05372671, 2.496127, 0.7215686, 0, 1, 1,
0.7859609, 0.8584743, -0.4207211, 0.7294118, 0, 1, 1,
0.7983284, 1.249931, 2.003735, 0.7333333, 0, 1, 1,
0.8017263, 1.209589, 2.359953, 0.7411765, 0, 1, 1,
0.8069842, -0.4893071, 1.575497, 0.7450981, 0, 1, 1,
0.8115474, -0.8952413, 1.747578, 0.7529412, 0, 1, 1,
0.8144064, -0.4046662, 2.78205, 0.7568628, 0, 1, 1,
0.816133, -1.194449, 3.989663, 0.7647059, 0, 1, 1,
0.8167092, 0.7259512, 0.6052973, 0.7686275, 0, 1, 1,
0.8286512, -0.8820241, 5.283764, 0.7764706, 0, 1, 1,
0.8405177, 0.3581476, 0.9182509, 0.7803922, 0, 1, 1,
0.8420463, 1.111729, 0.5390522, 0.7882353, 0, 1, 1,
0.8443366, 1.289297, 0.4311934, 0.7921569, 0, 1, 1,
0.8443404, 1.011899, 0.4821915, 0.8, 0, 1, 1,
0.8454272, -1.253135, 1.997607, 0.8078431, 0, 1, 1,
0.8459445, 0.3405038, 0.9677173, 0.8117647, 0, 1, 1,
0.8471078, 1.027094, 1.4831, 0.8196079, 0, 1, 1,
0.8518639, -1.785531, 3.489641, 0.8235294, 0, 1, 1,
0.8671927, -0.488132, 1.610925, 0.8313726, 0, 1, 1,
0.8691288, 0.705804, 0.2009271, 0.8352941, 0, 1, 1,
0.8694583, -1.112738, 3.846467, 0.8431373, 0, 1, 1,
0.8721947, 0.1371271, 1.716008, 0.8470588, 0, 1, 1,
0.8749598, -0.9295976, 2.570362, 0.854902, 0, 1, 1,
0.8789639, 0.6603985, -0.2127799, 0.8588235, 0, 1, 1,
0.8819726, -0.1060887, 0.7999398, 0.8666667, 0, 1, 1,
0.8821547, -1.230103, 2.451216, 0.8705882, 0, 1, 1,
0.8845178, 0.5346673, 0.6493782, 0.8784314, 0, 1, 1,
0.8894782, 0.247985, 2.147151, 0.8823529, 0, 1, 1,
0.8971574, -0.6351072, 4.245415, 0.8901961, 0, 1, 1,
0.8979046, 0.2236435, 2.058256, 0.8941177, 0, 1, 1,
0.9032392, 0.250736, 1.385508, 0.9019608, 0, 1, 1,
0.9083192, -0.7416956, 2.469979, 0.9098039, 0, 1, 1,
0.9108229, -1.566431, 3.812118, 0.9137255, 0, 1, 1,
0.9121521, 1.997859, -0.5140592, 0.9215686, 0, 1, 1,
0.9127357, 0.5160598, 3.164498, 0.9254902, 0, 1, 1,
0.913379, -0.8069538, 3.192359, 0.9333333, 0, 1, 1,
0.921778, -1.478721, 3.145069, 0.9372549, 0, 1, 1,
0.9234413, 0.01464803, 0.8803944, 0.945098, 0, 1, 1,
0.9241147, -0.1688811, 1.82719, 0.9490196, 0, 1, 1,
0.9286152, -0.1902441, 1.227139, 0.9568627, 0, 1, 1,
0.928802, 0.4689159, -1.295378, 0.9607843, 0, 1, 1,
0.9369649, -1.265597, 2.285507, 0.9686275, 0, 1, 1,
0.9412518, -0.7280381, 3.485325, 0.972549, 0, 1, 1,
0.9415326, -0.2368583, -0.3485377, 0.9803922, 0, 1, 1,
0.9468818, 2.252339, -1.526259, 0.9843137, 0, 1, 1,
0.9500837, -0.1172315, 1.807124, 0.9921569, 0, 1, 1,
0.9634524, -0.09679565, 1.52656, 0.9960784, 0, 1, 1,
0.9636278, 0.5227413, 1.15434, 1, 0, 0.9960784, 1,
0.9673147, 0.5221976, 2.152938, 1, 0, 0.9882353, 1,
0.9710766, 0.004779395, 0.6855913, 1, 0, 0.9843137, 1,
0.9729016, -0.5520567, 2.136291, 1, 0, 0.9764706, 1,
0.9797565, 0.5174145, 1.122069, 1, 0, 0.972549, 1,
0.9844024, -0.3603487, 0.6197611, 1, 0, 0.9647059, 1,
0.9872885, 1.352026, 2.003318, 1, 0, 0.9607843, 1,
0.9917231, -0.03344321, 2.870013, 1, 0, 0.9529412, 1,
0.9928054, 1.715128, 0.1542317, 1, 0, 0.9490196, 1,
0.9931539, 0.05839289, 0.8160018, 1, 0, 0.9411765, 1,
0.9957781, 0.6648701, 1.00672, 1, 0, 0.9372549, 1,
1.000913, 0.4496176, 2.083249, 1, 0, 0.9294118, 1,
1.00645, 0.7815112, 1.258837, 1, 0, 0.9254902, 1,
1.007292, 0.3280226, 0.6184418, 1, 0, 0.9176471, 1,
1.008335, 0.5886227, 1.285363, 1, 0, 0.9137255, 1,
1.010577, 2.015427, 0.09777389, 1, 0, 0.9058824, 1,
1.012828, 0.1807411, 1.028109, 1, 0, 0.9019608, 1,
1.014827, -0.2056205, 1.314293, 1, 0, 0.8941177, 1,
1.017915, -1.07965, 4.288719, 1, 0, 0.8862745, 1,
1.01896, -0.3859134, 2.742316, 1, 0, 0.8823529, 1,
1.026074, -1.152328, 2.904786, 1, 0, 0.8745098, 1,
1.029759, 0.6553968, 2.178162, 1, 0, 0.8705882, 1,
1.030987, 0.1205315, 1.124986, 1, 0, 0.8627451, 1,
1.035953, 0.1753357, 1.495056, 1, 0, 0.8588235, 1,
1.040285, 0.9431772, 1.727776, 1, 0, 0.8509804, 1,
1.046886, -0.1405563, 2.341884, 1, 0, 0.8470588, 1,
1.048022, -1.452379, 2.071356, 1, 0, 0.8392157, 1,
1.049357, -0.6425236, 1.249501, 1, 0, 0.8352941, 1,
1.052656, -1.941969, 1.86004, 1, 0, 0.827451, 1,
1.055016, 0.105665, 0.9191175, 1, 0, 0.8235294, 1,
1.080578, -0.1219679, 1.151992, 1, 0, 0.8156863, 1,
1.082769, 0.6579681, 1.024915, 1, 0, 0.8117647, 1,
1.087787, -0.4295843, 3.301258, 1, 0, 0.8039216, 1,
1.08892, 0.9264259, 1.442856, 1, 0, 0.7960784, 1,
1.090627, -0.3723526, 1.067962, 1, 0, 0.7921569, 1,
1.091181, 1.868811, -0.06744183, 1, 0, 0.7843137, 1,
1.105066, -0.4985559, 2.587125, 1, 0, 0.7803922, 1,
1.106711, 0.2827618, 0.511879, 1, 0, 0.772549, 1,
1.109428, -1.256638, 3.599016, 1, 0, 0.7686275, 1,
1.111258, -0.1483415, 1.306885, 1, 0, 0.7607843, 1,
1.120883, -2.193378, 0.8071928, 1, 0, 0.7568628, 1,
1.123076, -1.445595, 2.167206, 1, 0, 0.7490196, 1,
1.128509, -0.2495882, 1.003918, 1, 0, 0.7450981, 1,
1.129123, -1.020657, 1.180975, 1, 0, 0.7372549, 1,
1.133716, -1.577979, 2.400749, 1, 0, 0.7333333, 1,
1.136972, -1.296193, 1.710468, 1, 0, 0.7254902, 1,
1.137896, -0.0649154, 1.328754, 1, 0, 0.7215686, 1,
1.139957, -0.5305646, 1.239367, 1, 0, 0.7137255, 1,
1.14176, -0.5662555, 1.421637, 1, 0, 0.7098039, 1,
1.144518, -0.02319107, 1.332736, 1, 0, 0.7019608, 1,
1.149005, 1.284943, 0.3713338, 1, 0, 0.6941177, 1,
1.159015, -0.1892342, 0.02086544, 1, 0, 0.6901961, 1,
1.162224, 0.5069918, 1.871773, 1, 0, 0.682353, 1,
1.165794, -0.8135293, 3.293194, 1, 0, 0.6784314, 1,
1.186265, 0.2109266, 1.617531, 1, 0, 0.6705883, 1,
1.200063, -0.3158986, 3.090759, 1, 0, 0.6666667, 1,
1.200246, 0.12785, 2.095694, 1, 0, 0.6588235, 1,
1.201698, 0.2359597, 0.3677519, 1, 0, 0.654902, 1,
1.204781, 0.752349, -1.036098, 1, 0, 0.6470588, 1,
1.205473, 0.7307159, 2.432292, 1, 0, 0.6431373, 1,
1.21039, 0.7580766, 0.5671268, 1, 0, 0.6352941, 1,
1.212228, -1.359223, 3.500245, 1, 0, 0.6313726, 1,
1.230255, 0.9703416, 0.5983841, 1, 0, 0.6235294, 1,
1.233162, 1.731233, -0.07148402, 1, 0, 0.6196079, 1,
1.233374, 0.8148038, 1.057873, 1, 0, 0.6117647, 1,
1.237514, 0.487393, 0.740339, 1, 0, 0.6078432, 1,
1.23923, 0.6319997, 0.5897228, 1, 0, 0.6, 1,
1.256843, -0.8116637, 2.620795, 1, 0, 0.5921569, 1,
1.267269, 0.5206074, 2.83925, 1, 0, 0.5882353, 1,
1.270668, -0.8899562, 0.3202705, 1, 0, 0.5803922, 1,
1.279984, 0.7678436, 0.7192557, 1, 0, 0.5764706, 1,
1.283321, -0.373525, 2.844412, 1, 0, 0.5686275, 1,
1.288202, 0.285664, 1.893407, 1, 0, 0.5647059, 1,
1.290839, 1.62786, 1.810539, 1, 0, 0.5568628, 1,
1.298281, 0.5349355, -0.2372643, 1, 0, 0.5529412, 1,
1.300582, -2.365987, 3.258252, 1, 0, 0.5450981, 1,
1.306536, 0.4542955, -0.9734464, 1, 0, 0.5411765, 1,
1.306926, 1.170482, 1.633683, 1, 0, 0.5333334, 1,
1.309266, -0.08347146, 0.8726325, 1, 0, 0.5294118, 1,
1.315918, -0.1554626, 1.029845, 1, 0, 0.5215687, 1,
1.317915, -0.405011, 2.142536, 1, 0, 0.5176471, 1,
1.32515, -0.5658157, 3.734367, 1, 0, 0.509804, 1,
1.325738, 0.5783945, 0.5921136, 1, 0, 0.5058824, 1,
1.335889, 0.1871892, 1.602722, 1, 0, 0.4980392, 1,
1.341211, -0.6295499, 1.579021, 1, 0, 0.4901961, 1,
1.343418, 0.1099601, 1.340432, 1, 0, 0.4862745, 1,
1.347731, 1.497801, 0.9573137, 1, 0, 0.4784314, 1,
1.351401, 0.7764943, 3.077406, 1, 0, 0.4745098, 1,
1.35717, 2.303307, 0.6981463, 1, 0, 0.4666667, 1,
1.358254, -0.7683021, 3.35773, 1, 0, 0.4627451, 1,
1.36105, -0.2122282, 1.78531, 1, 0, 0.454902, 1,
1.389519, 0.2901882, 0.05889315, 1, 0, 0.4509804, 1,
1.39143, 1.185258, 0.9847114, 1, 0, 0.4431373, 1,
1.392609, 0.1094369, 0.2400085, 1, 0, 0.4392157, 1,
1.407792, -1.644239, 2.273101, 1, 0, 0.4313726, 1,
1.408704, -0.2353661, 1.129228, 1, 0, 0.427451, 1,
1.416862, -1.18018, 3.4823, 1, 0, 0.4196078, 1,
1.417837, -0.559046, 0.9686096, 1, 0, 0.4156863, 1,
1.425281, -1.905659, 3.602673, 1, 0, 0.4078431, 1,
1.430882, 0.1657942, 0.2135469, 1, 0, 0.4039216, 1,
1.437533, -0.7999136, 2.050429, 1, 0, 0.3960784, 1,
1.44282, -2.600112, -0.05164479, 1, 0, 0.3882353, 1,
1.449497, 2.583462, 1.19255, 1, 0, 0.3843137, 1,
1.457633, -0.06355488, 3.018854, 1, 0, 0.3764706, 1,
1.468586, 0.9464481, 1.769818, 1, 0, 0.372549, 1,
1.469001, -0.1222945, 0.5830691, 1, 0, 0.3647059, 1,
1.471486, 0.8149559, 0.4891391, 1, 0, 0.3607843, 1,
1.476008, 0.7690943, 1.238751, 1, 0, 0.3529412, 1,
1.476936, -0.5280197, 3.116657, 1, 0, 0.3490196, 1,
1.478031, -0.4789671, 0.2244231, 1, 0, 0.3411765, 1,
1.492462, 1.003253, 1.668308, 1, 0, 0.3372549, 1,
1.494682, 0.4795288, 0.2762913, 1, 0, 0.3294118, 1,
1.494695, -0.702981, 3.161934, 1, 0, 0.3254902, 1,
1.49813, -2.056192, 3.292344, 1, 0, 0.3176471, 1,
1.513724, -1.672014, 2.235752, 1, 0, 0.3137255, 1,
1.531518, 0.4394522, 0.7837914, 1, 0, 0.3058824, 1,
1.566901, 1.766808, 0.4517629, 1, 0, 0.2980392, 1,
1.581624, -0.7917926, 3.407106, 1, 0, 0.2941177, 1,
1.582657, 0.01025754, 1.437373, 1, 0, 0.2862745, 1,
1.586081, -0.6100113, 0.3722773, 1, 0, 0.282353, 1,
1.587976, 1.050217, 0.03963887, 1, 0, 0.2745098, 1,
1.634633, 0.4864859, 1.640846, 1, 0, 0.2705882, 1,
1.640744, -2.807034, 4.186318, 1, 0, 0.2627451, 1,
1.64705, -0.3069852, 0.5718353, 1, 0, 0.2588235, 1,
1.648737, -0.5110543, 1.201823, 1, 0, 0.2509804, 1,
1.652452, -1.47046, 3.502089, 1, 0, 0.2470588, 1,
1.661335, -0.4387804, 1.514375, 1, 0, 0.2392157, 1,
1.668206, -1.104657, 2.071674, 1, 0, 0.2352941, 1,
1.681986, -1.795719, 2.693333, 1, 0, 0.227451, 1,
1.687785, 0.8713681, 1.117913, 1, 0, 0.2235294, 1,
1.693447, 1.078677, 0.9338886, 1, 0, 0.2156863, 1,
1.698437, 0.003346164, 0.8518764, 1, 0, 0.2117647, 1,
1.711991, -0.9493247, 0.2475766, 1, 0, 0.2039216, 1,
1.71265, 0.4845975, 1.693901, 1, 0, 0.1960784, 1,
1.716313, -1.672439, 2.051195, 1, 0, 0.1921569, 1,
1.740382, 0.02924038, 1.101271, 1, 0, 0.1843137, 1,
1.751993, -0.1747839, 2.519403, 1, 0, 0.1803922, 1,
1.758879, -0.5076302, 1.685108, 1, 0, 0.172549, 1,
1.779441, 0.4839144, -0.0267544, 1, 0, 0.1686275, 1,
1.790536, 1.036045, 1.093206, 1, 0, 0.1607843, 1,
1.796461, 0.3896948, 0.2499261, 1, 0, 0.1568628, 1,
1.801692, -0.5942804, 2.634906, 1, 0, 0.1490196, 1,
1.804651, -0.9779677, 3.226787, 1, 0, 0.145098, 1,
1.806721, -0.8481015, 1.954715, 1, 0, 0.1372549, 1,
1.810121, 0.3220905, 1.007013, 1, 0, 0.1333333, 1,
1.842892, -0.7767444, 1.570607, 1, 0, 0.1254902, 1,
1.842915, -0.1270286, 0.95555, 1, 0, 0.1215686, 1,
1.844326, 1.771405, 1.115463, 1, 0, 0.1137255, 1,
1.868511, -1.646467, 4.789337, 1, 0, 0.1098039, 1,
1.898973, -0.06129744, 2.236691, 1, 0, 0.1019608, 1,
1.908018, -0.3500357, 0.3574124, 1, 0, 0.09411765, 1,
1.959286, 0.09072097, 1.47278, 1, 0, 0.09019608, 1,
2.048532, -0.2704494, 2.377561, 1, 0, 0.08235294, 1,
2.095026, -0.697399, 1.962825, 1, 0, 0.07843138, 1,
2.132501, -0.5741736, 4.454458, 1, 0, 0.07058824, 1,
2.132759, -0.5413941, 2.086805, 1, 0, 0.06666667, 1,
2.229855, -0.890614, 2.901839, 1, 0, 0.05882353, 1,
2.252116, -0.1626208, 0.603471, 1, 0, 0.05490196, 1,
2.339015, -0.2521347, 1.188301, 1, 0, 0.04705882, 1,
2.36365, 0.5016698, 1.877971, 1, 0, 0.04313726, 1,
2.393042, 0.3107862, 1.025793, 1, 0, 0.03529412, 1,
2.484501, 0.2961071, 0.4610332, 1, 0, 0.03137255, 1,
2.675632, -1.042576, 3.898513, 1, 0, 0.02352941, 1,
2.719518, 0.6247442, 2.214748, 1, 0, 0.01960784, 1,
2.856826, -0.9584681, 2.480415, 1, 0, 0.01176471, 1,
2.934667, -0.1355736, 1.938336, 1, 0, 0.007843138, 1
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
0.08862126, -3.784191, -7.67822, 0, -0.5, 0.5, 0.5,
0.08862126, -3.784191, -7.67822, 1, -0.5, 0.5, 0.5,
0.08862126, -3.784191, -7.67822, 1, 1.5, 0.5, 0.5,
0.08862126, -3.784191, -7.67822, 0, 1.5, 0.5, 0.5
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
-3.722234, 0.07543278, -7.67822, 0, -0.5, 0.5, 0.5,
-3.722234, 0.07543278, -7.67822, 1, -0.5, 0.5, 0.5,
-3.722234, 0.07543278, -7.67822, 1, 1.5, 0.5, 0.5,
-3.722234, 0.07543278, -7.67822, 0, 1.5, 0.5, 0.5
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
-3.722234, -3.784191, 0.03039312, 0, -0.5, 0.5, 0.5,
-3.722234, -3.784191, 0.03039312, 1, -0.5, 0.5, 0.5,
-3.722234, -3.784191, 0.03039312, 1, 1.5, 0.5, 0.5,
-3.722234, -3.784191, 0.03039312, 0, 1.5, 0.5, 0.5
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
-2, -2.893508, -5.89931,
2, -2.893508, -5.89931,
-2, -2.893508, -5.89931,
-2, -3.041955, -6.195795,
-1, -2.893508, -5.89931,
-1, -3.041955, -6.195795,
0, -2.893508, -5.89931,
0, -3.041955, -6.195795,
1, -2.893508, -5.89931,
1, -3.041955, -6.195795,
2, -2.893508, -5.89931,
2, -3.041955, -6.195795
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
-2, -3.33885, -6.788765, 0, -0.5, 0.5, 0.5,
-2, -3.33885, -6.788765, 1, -0.5, 0.5, 0.5,
-2, -3.33885, -6.788765, 1, 1.5, 0.5, 0.5,
-2, -3.33885, -6.788765, 0, 1.5, 0.5, 0.5,
-1, -3.33885, -6.788765, 0, -0.5, 0.5, 0.5,
-1, -3.33885, -6.788765, 1, -0.5, 0.5, 0.5,
-1, -3.33885, -6.788765, 1, 1.5, 0.5, 0.5,
-1, -3.33885, -6.788765, 0, 1.5, 0.5, 0.5,
0, -3.33885, -6.788765, 0, -0.5, 0.5, 0.5,
0, -3.33885, -6.788765, 1, -0.5, 0.5, 0.5,
0, -3.33885, -6.788765, 1, 1.5, 0.5, 0.5,
0, -3.33885, -6.788765, 0, 1.5, 0.5, 0.5,
1, -3.33885, -6.788765, 0, -0.5, 0.5, 0.5,
1, -3.33885, -6.788765, 1, -0.5, 0.5, 0.5,
1, -3.33885, -6.788765, 1, 1.5, 0.5, 0.5,
1, -3.33885, -6.788765, 0, 1.5, 0.5, 0.5,
2, -3.33885, -6.788765, 0, -0.5, 0.5, 0.5,
2, -3.33885, -6.788765, 1, -0.5, 0.5, 0.5,
2, -3.33885, -6.788765, 1, 1.5, 0.5, 0.5,
2, -3.33885, -6.788765, 0, 1.5, 0.5, 0.5
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
-2.842805, -2, -5.89931,
-2.842805, 2, -5.89931,
-2.842805, -2, -5.89931,
-2.989377, -2, -6.195795,
-2.842805, -1, -5.89931,
-2.989377, -1, -6.195795,
-2.842805, 0, -5.89931,
-2.989377, 0, -6.195795,
-2.842805, 1, -5.89931,
-2.989377, 1, -6.195795,
-2.842805, 2, -5.89931,
-2.989377, 2, -6.195795
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
-3.28252, -2, -6.788765, 0, -0.5, 0.5, 0.5,
-3.28252, -2, -6.788765, 1, -0.5, 0.5, 0.5,
-3.28252, -2, -6.788765, 1, 1.5, 0.5, 0.5,
-3.28252, -2, -6.788765, 0, 1.5, 0.5, 0.5,
-3.28252, -1, -6.788765, 0, -0.5, 0.5, 0.5,
-3.28252, -1, -6.788765, 1, -0.5, 0.5, 0.5,
-3.28252, -1, -6.788765, 1, 1.5, 0.5, 0.5,
-3.28252, -1, -6.788765, 0, 1.5, 0.5, 0.5,
-3.28252, 0, -6.788765, 0, -0.5, 0.5, 0.5,
-3.28252, 0, -6.788765, 1, -0.5, 0.5, 0.5,
-3.28252, 0, -6.788765, 1, 1.5, 0.5, 0.5,
-3.28252, 0, -6.788765, 0, 1.5, 0.5, 0.5,
-3.28252, 1, -6.788765, 0, -0.5, 0.5, 0.5,
-3.28252, 1, -6.788765, 1, -0.5, 0.5, 0.5,
-3.28252, 1, -6.788765, 1, 1.5, 0.5, 0.5,
-3.28252, 1, -6.788765, 0, 1.5, 0.5, 0.5,
-3.28252, 2, -6.788765, 0, -0.5, 0.5, 0.5,
-3.28252, 2, -6.788765, 1, -0.5, 0.5, 0.5,
-3.28252, 2, -6.788765, 1, 1.5, 0.5, 0.5,
-3.28252, 2, -6.788765, 0, 1.5, 0.5, 0.5
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
-2.842805, -2.893508, -4,
-2.842805, -2.893508, 4,
-2.842805, -2.893508, -4,
-2.989377, -3.041955, -4,
-2.842805, -2.893508, -2,
-2.989377, -3.041955, -2,
-2.842805, -2.893508, 0,
-2.989377, -3.041955, 0,
-2.842805, -2.893508, 2,
-2.989377, -3.041955, 2,
-2.842805, -2.893508, 4,
-2.989377, -3.041955, 4
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
-3.28252, -3.33885, -4, 0, -0.5, 0.5, 0.5,
-3.28252, -3.33885, -4, 1, -0.5, 0.5, 0.5,
-3.28252, -3.33885, -4, 1, 1.5, 0.5, 0.5,
-3.28252, -3.33885, -4, 0, 1.5, 0.5, 0.5,
-3.28252, -3.33885, -2, 0, -0.5, 0.5, 0.5,
-3.28252, -3.33885, -2, 1, -0.5, 0.5, 0.5,
-3.28252, -3.33885, -2, 1, 1.5, 0.5, 0.5,
-3.28252, -3.33885, -2, 0, 1.5, 0.5, 0.5,
-3.28252, -3.33885, 0, 0, -0.5, 0.5, 0.5,
-3.28252, -3.33885, 0, 1, -0.5, 0.5, 0.5,
-3.28252, -3.33885, 0, 1, 1.5, 0.5, 0.5,
-3.28252, -3.33885, 0, 0, 1.5, 0.5, 0.5,
-3.28252, -3.33885, 2, 0, -0.5, 0.5, 0.5,
-3.28252, -3.33885, 2, 1, -0.5, 0.5, 0.5,
-3.28252, -3.33885, 2, 1, 1.5, 0.5, 0.5,
-3.28252, -3.33885, 2, 0, 1.5, 0.5, 0.5,
-3.28252, -3.33885, 4, 0, -0.5, 0.5, 0.5,
-3.28252, -3.33885, 4, 1, -0.5, 0.5, 0.5,
-3.28252, -3.33885, 4, 1, 1.5, 0.5, 0.5,
-3.28252, -3.33885, 4, 0, 1.5, 0.5, 0.5
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
-2.842805, -2.893508, -5.89931,
-2.842805, 3.044374, -5.89931,
-2.842805, -2.893508, 5.960096,
-2.842805, 3.044374, 5.960096,
-2.842805, -2.893508, -5.89931,
-2.842805, -2.893508, 5.960096,
-2.842805, 3.044374, -5.89931,
-2.842805, 3.044374, 5.960096,
-2.842805, -2.893508, -5.89931,
3.020048, -2.893508, -5.89931,
-2.842805, -2.893508, 5.960096,
3.020048, -2.893508, 5.960096,
-2.842805, 3.044374, -5.89931,
3.020048, 3.044374, -5.89931,
-2.842805, 3.044374, 5.960096,
3.020048, 3.044374, 5.960096,
3.020048, -2.893508, -5.89931,
3.020048, 3.044374, -5.89931,
3.020048, -2.893508, 5.960096,
3.020048, 3.044374, 5.960096,
3.020048, -2.893508, -5.89931,
3.020048, -2.893508, 5.960096,
3.020048, 3.044374, -5.89931,
3.020048, 3.044374, 5.960096
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
var radius = 7.743215;
var distance = 34.45044;
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
mvMatrix.translate( -0.08862126, -0.07543278, -0.03039312 );
mvMatrix.scale( 1.427993, 1.40995, 0.7059474 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.45044);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
pendimethalin<-read.table("pendimethalin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-pendimethalin$V2
```

```
## Error in eval(expr, envir, enclos): object 'pendimethalin' not found
```

```r
y<-pendimethalin$V3
```

```
## Error in eval(expr, envir, enclos): object 'pendimethalin' not found
```

```r
z<-pendimethalin$V4
```

```
## Error in eval(expr, envir, enclos): object 'pendimethalin' not found
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
-2.757424, -1.757814, -1.258242, 0, 0, 1, 1, 1,
-2.629696, -0.6250881, -3.249728, 1, 0, 0, 1, 1,
-2.618207, 0.4476182, -1.898285, 1, 0, 0, 1, 1,
-2.524547, 1.274057, -0.3325758, 1, 0, 0, 1, 1,
-2.469918, -2.633079, -2.342739, 1, 0, 0, 1, 1,
-2.465554, 0.8782555, -1.003582, 1, 0, 0, 1, 1,
-2.463448, 0.8380728, -2.456604, 0, 0, 0, 1, 1,
-2.395561, -1.105813, -2.141047, 0, 0, 0, 1, 1,
-2.374907, 0.2463999, -0.9693018, 0, 0, 0, 1, 1,
-2.362901, -0.5277486, -0.8257174, 0, 0, 0, 1, 1,
-2.266444, -0.456468, -2.729988, 0, 0, 0, 1, 1,
-2.249451, -1.64418, -1.611699, 0, 0, 0, 1, 1,
-2.225073, -0.2135163, -2.548422, 0, 0, 0, 1, 1,
-2.215983, -1.017836, -3.244673, 1, 1, 1, 1, 1,
-2.175378, 1.442214, -1.242205, 1, 1, 1, 1, 1,
-2.167557, 1.160186, 0.3924828, 1, 1, 1, 1, 1,
-2.165352, 0.08823751, -0.889526, 1, 1, 1, 1, 1,
-2.115376, 0.124463, -1.677296, 1, 1, 1, 1, 1,
-2.084419, -0.4989068, 0.08749069, 1, 1, 1, 1, 1,
-2.064277, -1.194614, -2.870704, 1, 1, 1, 1, 1,
-2.049146, -2.069679, -3.771014, 1, 1, 1, 1, 1,
-2.037367, 0.5927163, -1.522573, 1, 1, 1, 1, 1,
-2.015502, -0.006177288, -1.411751, 1, 1, 1, 1, 1,
-2.012938, 2.157673, -0.2499055, 1, 1, 1, 1, 1,
-1.977682, -0.5641739, -2.091729, 1, 1, 1, 1, 1,
-1.956581, -1.111212, -2.747396, 1, 1, 1, 1, 1,
-1.942728, 0.5037524, -0.7902255, 1, 1, 1, 1, 1,
-1.922699, 0.04090161, -0.745087, 1, 1, 1, 1, 1,
-1.914729, 0.6987512, -1.552495, 0, 0, 1, 1, 1,
-1.914577, 0.173326, -1.45631, 1, 0, 0, 1, 1,
-1.91324, -1.517385, -4.069345, 1, 0, 0, 1, 1,
-1.901206, 0.1681732, -0.7189537, 1, 0, 0, 1, 1,
-1.868323, -0.8450483, -1.561206, 1, 0, 0, 1, 1,
-1.832425, 1.75287, -1.08552, 1, 0, 0, 1, 1,
-1.825188, 0.8457577, -0.6811412, 0, 0, 0, 1, 1,
-1.824578, -0.4655289, -1.635248, 0, 0, 0, 1, 1,
-1.812725, 1.922947, -0.1655771, 0, 0, 0, 1, 1,
-1.804716, -0.7556956, -1.78608, 0, 0, 0, 1, 1,
-1.799834, -0.5724848, -2.523151, 0, 0, 0, 1, 1,
-1.789788, 0.9188674, 0.7819722, 0, 0, 0, 1, 1,
-1.768451, -0.9571488, -2.569647, 0, 0, 0, 1, 1,
-1.767498, 1.031601, -1.121136, 1, 1, 1, 1, 1,
-1.759827, -0.02280543, -2.154327, 1, 1, 1, 1, 1,
-1.759258, 0.6223401, -2.093769, 1, 1, 1, 1, 1,
-1.758355, 1.17184, -0.4550267, 1, 1, 1, 1, 1,
-1.750797, 0.1697206, -3.954816, 1, 1, 1, 1, 1,
-1.750671, -1.247673, -2.570535, 1, 1, 1, 1, 1,
-1.748356, -1.563587, -1.082762, 1, 1, 1, 1, 1,
-1.730307, -0.8581681, -2.139964, 1, 1, 1, 1, 1,
-1.729574, -0.4695089, 0.5056328, 1, 1, 1, 1, 1,
-1.708707, 0.7100157, -1.068076, 1, 1, 1, 1, 1,
-1.702364, 1.350407, 0.168029, 1, 1, 1, 1, 1,
-1.696565, 1.780346, -1.46755, 1, 1, 1, 1, 1,
-1.69566, -0.02858581, -1.651719, 1, 1, 1, 1, 1,
-1.686994, 0.3658236, -2.591497, 1, 1, 1, 1, 1,
-1.665224, -0.3215494, -2.821908, 1, 1, 1, 1, 1,
-1.639928, -1.246237, -3.441383, 0, 0, 1, 1, 1,
-1.63141, 0.5980799, -0.2457405, 1, 0, 0, 1, 1,
-1.627891, 1.080401, -0.879256, 1, 0, 0, 1, 1,
-1.608204, 1.022283, -0.05810123, 1, 0, 0, 1, 1,
-1.604753, 2.249727, -0.5606568, 1, 0, 0, 1, 1,
-1.570603, 2.035005, 0.1802977, 1, 0, 0, 1, 1,
-1.567104, -0.7306737, -1.664695, 0, 0, 0, 1, 1,
-1.561932, -1.290697, -1.198235, 0, 0, 0, 1, 1,
-1.516229, 1.077675, -0.8020914, 0, 0, 0, 1, 1,
-1.499441, -1.495438, -0.9816642, 0, 0, 0, 1, 1,
-1.495942, 1.417405, -0.3753503, 0, 0, 0, 1, 1,
-1.494008, -0.871696, -0.8510597, 0, 0, 0, 1, 1,
-1.483507, -0.5848523, -1.164305, 0, 0, 0, 1, 1,
-1.477863, -0.7420677, -2.348915, 1, 1, 1, 1, 1,
-1.469053, 0.3881654, -2.766774, 1, 1, 1, 1, 1,
-1.465079, -1.342283, -3.759155, 1, 1, 1, 1, 1,
-1.464951, -0.900238, -0.4126849, 1, 1, 1, 1, 1,
-1.459734, -0.06319745, -2.004297, 1, 1, 1, 1, 1,
-1.452689, -1.20054, -3.078738, 1, 1, 1, 1, 1,
-1.450238, -1.055356, -2.324953, 1, 1, 1, 1, 1,
-1.434438, 0.02033255, 0.1505755, 1, 1, 1, 1, 1,
-1.409074, 0.0623399, -1.591892, 1, 1, 1, 1, 1,
-1.399556, -1.049405, -4.552651, 1, 1, 1, 1, 1,
-1.395228, 0.8420401, -2.267573, 1, 1, 1, 1, 1,
-1.395115, -0.3532845, -1.641797, 1, 1, 1, 1, 1,
-1.392346, 0.5165656, -0.9109167, 1, 1, 1, 1, 1,
-1.383822, -1.266178, -3.620156, 1, 1, 1, 1, 1,
-1.374635, 0.2244505, -1.184948, 1, 1, 1, 1, 1,
-1.367179, -0.6976246, -2.141621, 0, 0, 1, 1, 1,
-1.362237, 1.596633, -0.1729015, 1, 0, 0, 1, 1,
-1.360601, 0.5226644, -1.518089, 1, 0, 0, 1, 1,
-1.3443, 1.14035, 0.7636133, 1, 0, 0, 1, 1,
-1.338312, -0.6854044, -3.178244, 1, 0, 0, 1, 1,
-1.327237, -1.814343, -3.321587, 1, 0, 0, 1, 1,
-1.323093, -0.400724, -2.444208, 0, 0, 0, 1, 1,
-1.316038, -1.818438, 0.2822499, 0, 0, 0, 1, 1,
-1.308731, 0.09479772, -0.9359284, 0, 0, 0, 1, 1,
-1.304659, -1.804435, -4.628287, 0, 0, 0, 1, 1,
-1.297739, 0.3651352, -0.3265046, 0, 0, 0, 1, 1,
-1.295191, -0.3370841, -1.819851, 0, 0, 0, 1, 1,
-1.290748, -0.2592515, -1.700266, 0, 0, 0, 1, 1,
-1.281686, -1.002244, -2.880541, 1, 1, 1, 1, 1,
-1.274487, 0.02618846, -3.099778, 1, 1, 1, 1, 1,
-1.270161, 1.325374, -1.241256, 1, 1, 1, 1, 1,
-1.264416, 0.6279992, -3.252707, 1, 1, 1, 1, 1,
-1.258822, -1.749776, -2.820696, 1, 1, 1, 1, 1,
-1.255424, -0.2256545, -0.9269926, 1, 1, 1, 1, 1,
-1.255409, -1.692249, -1.983361, 1, 1, 1, 1, 1,
-1.25444, -0.048152, -1.076401, 1, 1, 1, 1, 1,
-1.251523, -0.6449615, -1.707341, 1, 1, 1, 1, 1,
-1.248402, 0.3814033, -1.846673, 1, 1, 1, 1, 1,
-1.246144, -0.6632432, -1.893702, 1, 1, 1, 1, 1,
-1.237317, -0.9034411, -0.8853234, 1, 1, 1, 1, 1,
-1.231016, -1.251345, -0.6223761, 1, 1, 1, 1, 1,
-1.220765, -2.007018, -3.062578, 1, 1, 1, 1, 1,
-1.215456, 0.5553493, -1.547428, 1, 1, 1, 1, 1,
-1.212705, -0.7263763, -2.010778, 0, 0, 1, 1, 1,
-1.203356, -0.8293682, -1.91981, 1, 0, 0, 1, 1,
-1.196564, -1.061145, -0.5147778, 1, 0, 0, 1, 1,
-1.192094, -1.144558, -3.55917, 1, 0, 0, 1, 1,
-1.190811, 0.9170583, -0.4956312, 1, 0, 0, 1, 1,
-1.182198, -0.8645074, -2.642665, 1, 0, 0, 1, 1,
-1.169431, 0.03981623, -0.7037055, 0, 0, 0, 1, 1,
-1.159492, 1.780937, -0.1109718, 0, 0, 0, 1, 1,
-1.150834, -0.9060966, -3.11769, 0, 0, 0, 1, 1,
-1.135001, -0.4282727, -1.454962, 0, 0, 0, 1, 1,
-1.123694, -1.469599, -2.468668, 0, 0, 0, 1, 1,
-1.119549, 2.018817, -1.028058, 0, 0, 0, 1, 1,
-1.112758, -1.019604, -4.085524, 0, 0, 0, 1, 1,
-1.110418, 0.3493737, -0.9150857, 1, 1, 1, 1, 1,
-1.109218, 0.07248345, -3.23221, 1, 1, 1, 1, 1,
-1.103923, 0.2792845, -1.829355, 1, 1, 1, 1, 1,
-1.099334, 0.9246498, -0.7560954, 1, 1, 1, 1, 1,
-1.097674, 1.682696, -0.7213151, 1, 1, 1, 1, 1,
-1.097566, 0.1069592, -3.318565, 1, 1, 1, 1, 1,
-1.094096, 0.1817714, 0.1381721, 1, 1, 1, 1, 1,
-1.091493, -1.201483, -1.687227, 1, 1, 1, 1, 1,
-1.08943, 0.1872953, -0.930823, 1, 1, 1, 1, 1,
-1.088267, -1.638794, -2.506854, 1, 1, 1, 1, 1,
-1.087741, 0.000239596, -1.50999, 1, 1, 1, 1, 1,
-1.085364, -0.243589, -3.321546, 1, 1, 1, 1, 1,
-1.082217, 0.1496226, -1.901087, 1, 1, 1, 1, 1,
-1.071954, 2.112211, -2.0679, 1, 1, 1, 1, 1,
-1.069414, 0.1218092, -1.470311, 1, 1, 1, 1, 1,
-1.067562, 0.4861065, -0.9155359, 0, 0, 1, 1, 1,
-1.067028, -0.7154381, -2.37907, 1, 0, 0, 1, 1,
-1.066782, 1.21898, -2.317269, 1, 0, 0, 1, 1,
-1.058547, -0.4326383, -2.172093, 1, 0, 0, 1, 1,
-1.05721, 1.920327, -0.03860937, 1, 0, 0, 1, 1,
-1.054314, 1.806401, -0.3966267, 1, 0, 0, 1, 1,
-1.0533, -0.5603123, -1.37859, 0, 0, 0, 1, 1,
-1.050049, -0.08684637, 0.7340548, 0, 0, 0, 1, 1,
-1.038868, -0.8302571, -1.303681, 0, 0, 0, 1, 1,
-1.02952, 0.6336433, -2.231841, 0, 0, 0, 1, 1,
-1.029045, -0.3506053, -1.694635, 0, 0, 0, 1, 1,
-1.027702, 2.9579, 1.187569, 0, 0, 0, 1, 1,
-1.024632, 0.3645374, -0.8779607, 0, 0, 0, 1, 1,
-1.018769, -0.8511424, -2.850914, 1, 1, 1, 1, 1,
-1.012927, 0.1622129, -1.774143, 1, 1, 1, 1, 1,
-1.012634, 1.251459, -0.1091882, 1, 1, 1, 1, 1,
-1.011367, -0.1055741, -1.378696, 1, 1, 1, 1, 1,
-1.010859, -0.1173707, -1.432762, 1, 1, 1, 1, 1,
-1.006745, 1.146034, -0.268168, 1, 1, 1, 1, 1,
-1.000207, 1.975023, 2.036714, 1, 1, 1, 1, 1,
-0.9884604, 0.2328359, -0.4366098, 1, 1, 1, 1, 1,
-0.987057, -0.7499429, -3.193113, 1, 1, 1, 1, 1,
-0.9795129, 0.9847926, -0.7586757, 1, 1, 1, 1, 1,
-0.9754949, 1.225871, -1.256218, 1, 1, 1, 1, 1,
-0.9731341, -1.452375, -3.469808, 1, 1, 1, 1, 1,
-0.9721457, 0.3885825, -0.9615123, 1, 1, 1, 1, 1,
-0.9712503, -0.5945749, -4.330154, 1, 1, 1, 1, 1,
-0.9671287, 0.2778636, -0.9232713, 1, 1, 1, 1, 1,
-0.9647633, 0.2070743, -2.233873, 0, 0, 1, 1, 1,
-0.9578432, 0.8975353, -0.3512526, 1, 0, 0, 1, 1,
-0.953136, -0.1061809, -1.840847, 1, 0, 0, 1, 1,
-0.9486716, 2.574556, -2.049316, 1, 0, 0, 1, 1,
-0.9426802, 0.04142025, -1.20158, 1, 0, 0, 1, 1,
-0.9407508, -0.1306563, -3.317405, 1, 0, 0, 1, 1,
-0.9393126, -0.05185632, -2.742576, 0, 0, 0, 1, 1,
-0.934898, 1.731104, 0.3449421, 0, 0, 0, 1, 1,
-0.9336478, 0.5588292, -2.063766, 0, 0, 0, 1, 1,
-0.927817, 1.848516, -0.3437034, 0, 0, 0, 1, 1,
-0.9254537, -0.02835185, -1.988358, 0, 0, 0, 1, 1,
-0.9207869, -0.2727159, -2.009376, 0, 0, 0, 1, 1,
-0.9165631, 0.4529177, -2.576778, 0, 0, 0, 1, 1,
-0.915662, -1.31998, -1.1851, 1, 1, 1, 1, 1,
-0.9150946, 0.3548441, -1.187658, 1, 1, 1, 1, 1,
-0.9039695, 1.456915, 0.6452526, 1, 1, 1, 1, 1,
-0.9007714, 0.318577, -0.792886, 1, 1, 1, 1, 1,
-0.9003776, -0.7047777, -1.346477, 1, 1, 1, 1, 1,
-0.8937093, -0.3824414, -3.17751, 1, 1, 1, 1, 1,
-0.8934561, -0.41464, -4.112648, 1, 1, 1, 1, 1,
-0.8908252, 0.05298123, -2.516704, 1, 1, 1, 1, 1,
-0.8777894, -0.7708917, -1.633708, 1, 1, 1, 1, 1,
-0.8751408, -0.2007539, -0.7711178, 1, 1, 1, 1, 1,
-0.869638, 0.657326, -1.785205, 1, 1, 1, 1, 1,
-0.8668787, -0.9954345, -0.1740409, 1, 1, 1, 1, 1,
-0.8657734, 1.127324, -0.8357663, 1, 1, 1, 1, 1,
-0.8604692, -0.05929437, -3.571253, 1, 1, 1, 1, 1,
-0.8585808, 1.640601, -0.4847969, 1, 1, 1, 1, 1,
-0.8576885, 0.4223066, -1.085594, 0, 0, 1, 1, 1,
-0.8558612, -0.02109859, -0.9561858, 1, 0, 0, 1, 1,
-0.8516815, -0.1953475, -1.625266, 1, 0, 0, 1, 1,
-0.8468184, -0.5462783, -0.8026408, 1, 0, 0, 1, 1,
-0.8389855, -0.7998488, -3.564091, 1, 0, 0, 1, 1,
-0.8379516, -0.5799987, -2.23995, 1, 0, 0, 1, 1,
-0.8319401, 0.4519153, -0.2994664, 0, 0, 0, 1, 1,
-0.8274573, 2.269591, -1.252075, 0, 0, 0, 1, 1,
-0.8269502, 0.2675725, -2.799442, 0, 0, 0, 1, 1,
-0.8259168, 0.7340273, -1.697535, 0, 0, 0, 1, 1,
-0.8164095, -0.8164657, -0.7901415, 0, 0, 0, 1, 1,
-0.8125288, -0.474612, -0.1439915, 0, 0, 0, 1, 1,
-0.8078721, 0.8169612, 0.4613164, 0, 0, 0, 1, 1,
-0.8075353, 2.178161, 0.01283905, 1, 1, 1, 1, 1,
-0.8071104, -1.402491, -5.154159, 1, 1, 1, 1, 1,
-0.8005421, 0.8450824, -0.01945525, 1, 1, 1, 1, 1,
-0.7942608, -0.5627869, -2.909867, 1, 1, 1, 1, 1,
-0.7930908, 0.3462057, -2.250093, 1, 1, 1, 1, 1,
-0.789931, -1.603477, -2.147321, 1, 1, 1, 1, 1,
-0.7806209, -1.518672, -2.134219, 1, 1, 1, 1, 1,
-0.780553, 0.9531764, -0.9401981, 1, 1, 1, 1, 1,
-0.7791725, 1.740364, 1.074379, 1, 1, 1, 1, 1,
-0.7678958, 0.4930489, -2.055691, 1, 1, 1, 1, 1,
-0.7659829, -1.363178, -2.900029, 1, 1, 1, 1, 1,
-0.7502643, -0.3247432, -1.110695, 1, 1, 1, 1, 1,
-0.7479522, 1.291058, 0.07783184, 1, 1, 1, 1, 1,
-0.7478303, 0.1868816, -0.5271804, 1, 1, 1, 1, 1,
-0.7430933, 0.3567091, 0.1423412, 1, 1, 1, 1, 1,
-0.7380344, -0.4111972, -1.636685, 0, 0, 1, 1, 1,
-0.7376197, 2.603175, -1.253091, 1, 0, 0, 1, 1,
-0.7371807, -1.904611, -3.772599, 1, 0, 0, 1, 1,
-0.7363873, 0.7570127, -0.4366729, 1, 0, 0, 1, 1,
-0.7361156, -0.9168868, -2.670429, 1, 0, 0, 1, 1,
-0.729197, 0.7843557, -1.503317, 1, 0, 0, 1, 1,
-0.728637, -0.6319226, -4.211126, 0, 0, 0, 1, 1,
-0.7195333, -0.9604599, -1.965668, 0, 0, 0, 1, 1,
-0.7176312, 0.2918329, -1.739899, 0, 0, 0, 1, 1,
-0.7161249, 0.3104491, -1.248089, 0, 0, 0, 1, 1,
-0.7149458, 1.261754, -3.044477, 0, 0, 0, 1, 1,
-0.7124085, -0.5106506, -2.937082, 0, 0, 0, 1, 1,
-0.7110503, -0.000340337, -0.749668, 0, 0, 0, 1, 1,
-0.7076941, 0.2327798, -1.233379, 1, 1, 1, 1, 1,
-0.7033783, -0.1154203, -0.5494043, 1, 1, 1, 1, 1,
-0.6952981, 1.546411, 0.02481452, 1, 1, 1, 1, 1,
-0.6885176, 0.6829714, -0.3954384, 1, 1, 1, 1, 1,
-0.687424, -1.727062, -4.136986, 1, 1, 1, 1, 1,
-0.6860769, 0.4452449, 0.8918046, 1, 1, 1, 1, 1,
-0.6854193, -0.6980535, -1.436866, 1, 1, 1, 1, 1,
-0.6840348, -1.715276, -3.592332, 1, 1, 1, 1, 1,
-0.6834248, -1.36593, -2.456239, 1, 1, 1, 1, 1,
-0.6822109, 0.05192961, -1.512433, 1, 1, 1, 1, 1,
-0.6820775, 2.315182, -1.522712, 1, 1, 1, 1, 1,
-0.6792736, -0.5102152, -0.2002261, 1, 1, 1, 1, 1,
-0.6792446, -0.1213314, -1.895811, 1, 1, 1, 1, 1,
-0.6788101, -1.265728, -4.948832, 1, 1, 1, 1, 1,
-0.6780415, 1.056306, 0.143391, 1, 1, 1, 1, 1,
-0.6774017, -0.5441334, -2.707988, 0, 0, 1, 1, 1,
-0.6710234, -0.703165, -1.697023, 1, 0, 0, 1, 1,
-0.6692868, 0.3288984, -2.679577, 1, 0, 0, 1, 1,
-0.6669759, -0.2896091, -2.171376, 1, 0, 0, 1, 1,
-0.6669493, 0.282308, -0.1564015, 1, 0, 0, 1, 1,
-0.6663607, 0.9224375, -2.157952, 1, 0, 0, 1, 1,
-0.6574749, 1.787544, 0.9749349, 0, 0, 0, 1, 1,
-0.6550837, -1.416232, -2.772766, 0, 0, 0, 1, 1,
-0.6433515, -0.7299479, -2.06772, 0, 0, 0, 1, 1,
-0.6430138, -0.04817146, -2.456242, 0, 0, 0, 1, 1,
-0.6374577, -0.8840129, -4.667304, 0, 0, 0, 1, 1,
-0.6370544, -1.075307, -2.259833, 0, 0, 0, 1, 1,
-0.6295314, 1.295756, -2.330935, 0, 0, 0, 1, 1,
-0.6283129, 1.108992, -0.5080777, 1, 1, 1, 1, 1,
-0.6212319, -0.5905305, -3.155804, 1, 1, 1, 1, 1,
-0.6207633, 0.2585905, -1.339803, 1, 1, 1, 1, 1,
-0.6152835, 0.0920035, -0.9508197, 1, 1, 1, 1, 1,
-0.6151056, 0.4523766, -0.2674269, 1, 1, 1, 1, 1,
-0.6137382, 2.209049, -0.1541561, 1, 1, 1, 1, 1,
-0.6127293, 0.6730583, 1.00301, 1, 1, 1, 1, 1,
-0.6114928, -0.04203053, -2.224526, 1, 1, 1, 1, 1,
-0.6109188, 0.3020032, 0.6815201, 1, 1, 1, 1, 1,
-0.6065087, 0.520059, -0.9372557, 1, 1, 1, 1, 1,
-0.6060876, -0.1513508, 0.09919119, 1, 1, 1, 1, 1,
-0.6034752, -0.1390912, -2.130868, 1, 1, 1, 1, 1,
-0.6031976, 0.06722985, -1.432076, 1, 1, 1, 1, 1,
-0.5991608, -1.280517, -0.7828557, 1, 1, 1, 1, 1,
-0.5972827, -0.2566907, -0.7208579, 1, 1, 1, 1, 1,
-0.5969893, 0.0892489, -1.755525, 0, 0, 1, 1, 1,
-0.5836153, -0.05130365, -2.123795, 1, 0, 0, 1, 1,
-0.5798779, 1.140386, -0.885352, 1, 0, 0, 1, 1,
-0.5719986, -1.60762, -3.123734, 1, 0, 0, 1, 1,
-0.5675755, 1.460268, -1.277766, 1, 0, 0, 1, 1,
-0.5656209, -0.6491895, -3.009871, 1, 0, 0, 1, 1,
-0.5642306, 2.548887, -1.20244, 0, 0, 0, 1, 1,
-0.5630887, -0.7378263, -3.552094, 0, 0, 0, 1, 1,
-0.5598555, -0.8518593, -1.827534, 0, 0, 0, 1, 1,
-0.5579841, 1.564894, -0.3798829, 0, 0, 0, 1, 1,
-0.5579082, -2.208869, -4.328876, 0, 0, 0, 1, 1,
-0.5509998, -0.3503294, -2.385525, 0, 0, 0, 1, 1,
-0.547726, 0.9566491, -0.2322461, 0, 0, 0, 1, 1,
-0.5436727, -0.8045924, -2.904386, 1, 1, 1, 1, 1,
-0.5419338, 0.6563062, -1.210521, 1, 1, 1, 1, 1,
-0.5405536, -0.1400345, -2.172321, 1, 1, 1, 1, 1,
-0.5359769, 0.8865045, -1.072839, 1, 1, 1, 1, 1,
-0.5295888, 1.190379, -0.6711881, 1, 1, 1, 1, 1,
-0.5224416, 0.209233, -0.7879435, 1, 1, 1, 1, 1,
-0.5222257, 0.3042801, 0.2008569, 1, 1, 1, 1, 1,
-0.5186606, -1.063152, -2.484324, 1, 1, 1, 1, 1,
-0.5180346, 0.5730471, -1.637479, 1, 1, 1, 1, 1,
-0.514288, 0.544973, 0.4279227, 1, 1, 1, 1, 1,
-0.5139627, 1.076296, -1.475265, 1, 1, 1, 1, 1,
-0.5138565, 0.2599167, -0.9193021, 1, 1, 1, 1, 1,
-0.5080645, -0.5795369, -1.277607, 1, 1, 1, 1, 1,
-0.5078689, -0.1364138, -1.961947, 1, 1, 1, 1, 1,
-0.5075252, 0.1810162, -0.9155995, 1, 1, 1, 1, 1,
-0.5010762, -0.06804099, -3.620459, 0, 0, 1, 1, 1,
-0.5006061, -0.155698, -1.55275, 1, 0, 0, 1, 1,
-0.4983675, 1.284144, 0.5189807, 1, 0, 0, 1, 1,
-0.4974723, 0.191317, -2.550181, 1, 0, 0, 1, 1,
-0.4965146, 0.416888, -2.706725, 1, 0, 0, 1, 1,
-0.4937378, 0.4962644, -0.7137691, 1, 0, 0, 1, 1,
-0.4906837, -0.3285576, 0.1917509, 0, 0, 0, 1, 1,
-0.4876211, 0.6355385, -1.355677, 0, 0, 0, 1, 1,
-0.4842817, -0.4813187, -3.757244, 0, 0, 0, 1, 1,
-0.4820939, 0.1546526, -1.067323, 0, 0, 0, 1, 1,
-0.4778955, 1.736003, -0.08371497, 0, 0, 0, 1, 1,
-0.4775602, 0.1614163, -1.406524, 0, 0, 0, 1, 1,
-0.4654918, 0.4806428, -0.8635261, 0, 0, 0, 1, 1,
-0.4602217, 0.5370278, -1.033515, 1, 1, 1, 1, 1,
-0.4570768, -0.1110867, -2.714376, 1, 1, 1, 1, 1,
-0.4562246, 0.0959412, -2.243736, 1, 1, 1, 1, 1,
-0.4549149, 0.9039454, -0.6932376, 1, 1, 1, 1, 1,
-0.4511879, 1.82765, -1.681743, 1, 1, 1, 1, 1,
-0.4507616, 0.5507834, -0.6021214, 1, 1, 1, 1, 1,
-0.4448909, -0.1101713, 0.4175431, 1, 1, 1, 1, 1,
-0.4373074, -0.07957113, -3.744977, 1, 1, 1, 1, 1,
-0.4336659, 0.09344691, -1.496653, 1, 1, 1, 1, 1,
-0.4336374, 1.650736, 0.04006521, 1, 1, 1, 1, 1,
-0.4320655, -0.8269866, -2.411585, 1, 1, 1, 1, 1,
-0.4311635, 1.093285, 0.06153344, 1, 1, 1, 1, 1,
-0.4297896, 1.583876, -3.396647, 1, 1, 1, 1, 1,
-0.4295404, -0.1429486, -0.5376524, 1, 1, 1, 1, 1,
-0.4253578, 1.035457, -2.665064, 1, 1, 1, 1, 1,
-0.4250955, -0.9749833, -1.995116, 0, 0, 1, 1, 1,
-0.4220021, -0.1754961, -3.205643, 1, 0, 0, 1, 1,
-0.4208852, -0.4728368, -1.910823, 1, 0, 0, 1, 1,
-0.4199822, -0.6926225, -3.43, 1, 0, 0, 1, 1,
-0.4103156, 0.939409, 0.04345438, 1, 0, 0, 1, 1,
-0.4088046, -1.911929, -3.851233, 1, 0, 0, 1, 1,
-0.4087834, -1.396716, -3.711422, 0, 0, 0, 1, 1,
-0.4073693, 0.1824335, 0.3281401, 0, 0, 0, 1, 1,
-0.4026729, -1.894768, -2.12512, 0, 0, 0, 1, 1,
-0.3994252, -1.025021, -2.468201, 0, 0, 0, 1, 1,
-0.3979577, -0.09538365, -1.363873, 0, 0, 0, 1, 1,
-0.3966241, -0.01626123, -3.228842, 0, 0, 0, 1, 1,
-0.3905103, 0.7696165, 0.3653178, 0, 0, 0, 1, 1,
-0.386556, -1.353944, -2.574213, 1, 1, 1, 1, 1,
-0.3862777, 0.9510747, -2.702006, 1, 1, 1, 1, 1,
-0.3797565, 0.5946236, -0.2313547, 1, 1, 1, 1, 1,
-0.3767591, 0.4015778, -2.420483, 1, 1, 1, 1, 1,
-0.3766089, -0.4955216, -1.881139, 1, 1, 1, 1, 1,
-0.3737668, 0.333482, -0.392552, 1, 1, 1, 1, 1,
-0.3727731, -0.005035922, -2.349452, 1, 1, 1, 1, 1,
-0.3709487, 0.5920475, -2.767878, 1, 1, 1, 1, 1,
-0.3704278, -0.1955106, 0.4414856, 1, 1, 1, 1, 1,
-0.369981, 1.193797, 0.3974897, 1, 1, 1, 1, 1,
-0.3697373, 0.3387209, -0.1547562, 1, 1, 1, 1, 1,
-0.3676509, -0.2622454, -1.174554, 1, 1, 1, 1, 1,
-0.3657905, -1.244563, -3.395638, 1, 1, 1, 1, 1,
-0.3621507, 0.5044699, -0.5646077, 1, 1, 1, 1, 1,
-0.3521604, 0.4869792, -2.417062, 1, 1, 1, 1, 1,
-0.3478024, -1.695003, -3.607415, 0, 0, 1, 1, 1,
-0.3468914, 1.327123, -0.9677115, 1, 0, 0, 1, 1,
-0.3465512, -0.4596387, -1.292582, 1, 0, 0, 1, 1,
-0.3463856, 0.9319017, -2.68016, 1, 0, 0, 1, 1,
-0.3434232, 0.2305598, -1.508117, 1, 0, 0, 1, 1,
-0.3428367, -0.6735531, -2.055726, 1, 0, 0, 1, 1,
-0.3403868, 1.627293, 0.6184019, 0, 0, 0, 1, 1,
-0.3349233, 1.002693, -1.532919, 0, 0, 0, 1, 1,
-0.334212, -1.584864, -1.732191, 0, 0, 0, 1, 1,
-0.3340575, 0.9570587, 1.317975, 0, 0, 0, 1, 1,
-0.3326579, 0.1344852, 0.5164551, 0, 0, 0, 1, 1,
-0.3301851, -0.2980764, -1.659128, 0, 0, 0, 1, 1,
-0.3291257, 0.2468502, -1.141928, 0, 0, 0, 1, 1,
-0.323888, 0.4705205, -0.4197816, 1, 1, 1, 1, 1,
-0.3228894, -0.9728716, -4.063705, 1, 1, 1, 1, 1,
-0.322443, 1.427515, -0.7344452, 1, 1, 1, 1, 1,
-0.3188084, -0.496061, -2.424576, 1, 1, 1, 1, 1,
-0.3146707, -1.448527, -2.008049, 1, 1, 1, 1, 1,
-0.31425, 1.062773, -1.218274, 1, 1, 1, 1, 1,
-0.3133847, -0.3221294, -1.560709, 1, 1, 1, 1, 1,
-0.3082282, 0.2998933, -1.892714, 1, 1, 1, 1, 1,
-0.3054186, 0.3509356, -1.504927, 1, 1, 1, 1, 1,
-0.3053758, 1.852853, 2.199766, 1, 1, 1, 1, 1,
-0.3037321, -1.46705, -2.41379, 1, 1, 1, 1, 1,
-0.3030907, 0.5575989, -0.9193298, 1, 1, 1, 1, 1,
-0.3029007, -0.7570396, -5.7266, 1, 1, 1, 1, 1,
-0.3021059, 0.4441766, -2.172189, 1, 1, 1, 1, 1,
-0.3019025, -0.09999911, -3.141546, 1, 1, 1, 1, 1,
-0.3012002, -0.5178551, -2.69699, 0, 0, 1, 1, 1,
-0.2943287, -0.0662906, -2.59666, 1, 0, 0, 1, 1,
-0.2906778, -0.6035032, -2.735744, 1, 0, 0, 1, 1,
-0.2905876, -0.8487957, -3.105848, 1, 0, 0, 1, 1,
-0.2897822, -1.550139, -3.65631, 1, 0, 0, 1, 1,
-0.2897594, 0.01241811, -2.224273, 1, 0, 0, 1, 1,
-0.2857066, 0.8624162, 1.95051, 0, 0, 0, 1, 1,
-0.2808899, -1.763791, -4.321288, 0, 0, 0, 1, 1,
-0.2807375, -1.45845, -3.740094, 0, 0, 0, 1, 1,
-0.2791422, 0.1375282, -1.423013, 0, 0, 0, 1, 1,
-0.2777008, -0.1367074, -0.9947135, 0, 0, 0, 1, 1,
-0.2760077, 2.037237, 0.4241782, 0, 0, 0, 1, 1,
-0.2735052, 0.1497359, -0.265205, 0, 0, 0, 1, 1,
-0.2718285, -0.308019, -2.072124, 1, 1, 1, 1, 1,
-0.2680658, -1.325026, -3.183705, 1, 1, 1, 1, 1,
-0.2663239, -1.694436, -2.769369, 1, 1, 1, 1, 1,
-0.2627929, 0.2286197, -0.07287663, 1, 1, 1, 1, 1,
-0.2614973, -0.1164962, -1.482277, 1, 1, 1, 1, 1,
-0.2608159, -0.7204275, -2.130358, 1, 1, 1, 1, 1,
-0.2510473, 0.6985397, -0.1784586, 1, 1, 1, 1, 1,
-0.2490656, -0.8334579, -1.274223, 1, 1, 1, 1, 1,
-0.2474824, -0.1136433, 0.06320763, 1, 1, 1, 1, 1,
-0.2439796, 0.8665444, -0.6405055, 1, 1, 1, 1, 1,
-0.242483, 0.5651143, -0.8825433, 1, 1, 1, 1, 1,
-0.2359421, -0.06721597, -1.863773, 1, 1, 1, 1, 1,
-0.2356118, -0.1351167, -1.795736, 1, 1, 1, 1, 1,
-0.233677, -0.1570767, -1.349844, 1, 1, 1, 1, 1,
-0.2303004, -0.1316322, -1.182091, 1, 1, 1, 1, 1,
-0.2262567, -2.131491, -2.73533, 0, 0, 1, 1, 1,
-0.2261447, -0.5241647, -2.171514, 1, 0, 0, 1, 1,
-0.2240071, 1.413449, -0.711279, 1, 0, 0, 1, 1,
-0.2218876, -0.4061886, -3.910721, 1, 0, 0, 1, 1,
-0.2210723, -0.05529602, -1.671516, 1, 0, 0, 1, 1,
-0.2184324, -1.070247, -2.779327, 1, 0, 0, 1, 1,
-0.2168511, 0.0676007, -0.2742582, 0, 0, 0, 1, 1,
-0.2166656, 0.5382182, 0.1657752, 0, 0, 0, 1, 1,
-0.2165971, 0.4385762, -1.480081, 0, 0, 0, 1, 1,
-0.2129752, -0.3677424, -4.668572, 0, 0, 0, 1, 1,
-0.2107509, -0.7308771, -2.774634, 0, 0, 0, 1, 1,
-0.2103438, 1.375326, -1.337578, 0, 0, 0, 1, 1,
-0.2087754, 0.4326517, -1.486263, 0, 0, 0, 1, 1,
-0.2084675, 0.7916002, -0.9727216, 1, 1, 1, 1, 1,
-0.20761, 0.07001837, -0.6227136, 1, 1, 1, 1, 1,
-0.206946, 0.7461344, -0.8344582, 1, 1, 1, 1, 1,
-0.1989208, 1.381207, -0.06794801, 1, 1, 1, 1, 1,
-0.1963293, 0.6762705, 0.9981024, 1, 1, 1, 1, 1,
-0.1954181, 0.433898, 1.256415, 1, 1, 1, 1, 1,
-0.1916263, 0.6770861, 0.863164, 1, 1, 1, 1, 1,
-0.1869131, 0.7576693, -0.3388562, 1, 1, 1, 1, 1,
-0.180369, -1.813537, -0.5075917, 1, 1, 1, 1, 1,
-0.1797511, -0.4757657, -3.308284, 1, 1, 1, 1, 1,
-0.1776955, -0.3450795, -2.81538, 1, 1, 1, 1, 1,
-0.1763318, 0.1370978, 1.044395, 1, 1, 1, 1, 1,
-0.1737139, -0.7527096, -1.454549, 1, 1, 1, 1, 1,
-0.1723586, 0.7265776, 1.286202, 1, 1, 1, 1, 1,
-0.1700638, -0.9319146, -4.380583, 1, 1, 1, 1, 1,
-0.1672723, 1.439867, -0.5860705, 0, 0, 1, 1, 1,
-0.1672529, -0.922217, -2.09371, 1, 0, 0, 1, 1,
-0.1632112, 0.834722, 0.30371, 1, 0, 0, 1, 1,
-0.1616829, -0.1836681, -0.6829199, 1, 0, 0, 1, 1,
-0.1554702, 0.04134139, -2.105118, 1, 0, 0, 1, 1,
-0.1540601, 0.5560729, -0.7240984, 1, 0, 0, 1, 1,
-0.1510459, -0.7856096, -3.326579, 0, 0, 0, 1, 1,
-0.1489477, 0.01680133, -0.7156001, 0, 0, 0, 1, 1,
-0.1452376, 0.3227203, -2.028828, 0, 0, 0, 1, 1,
-0.1448685, -2.489459, -4.183373, 0, 0, 0, 1, 1,
-0.1438258, 0.9050215, -1.095313, 0, 0, 0, 1, 1,
-0.1428372, -1.780184, -4.19446, 0, 0, 0, 1, 1,
-0.133054, 0.3937525, 0.8457764, 0, 0, 0, 1, 1,
-0.1325348, -0.7610007, -2.796865, 1, 1, 1, 1, 1,
-0.1295409, -0.3581483, -2.558438, 1, 1, 1, 1, 1,
-0.1264443, -1.615948, -2.268272, 1, 1, 1, 1, 1,
-0.1263933, 0.2597789, -2.102848, 1, 1, 1, 1, 1,
-0.1240285, 0.4587524, 1.04541, 1, 1, 1, 1, 1,
-0.1198144, -1.462676, -4.437091, 1, 1, 1, 1, 1,
-0.1138645, -0.5315365, -4.444561, 1, 1, 1, 1, 1,
-0.1114892, -0.3030962, -4.886075, 1, 1, 1, 1, 1,
-0.1094693, -0.1246642, -2.148161, 1, 1, 1, 1, 1,
-0.1067005, 0.5489117, 0.1313057, 1, 1, 1, 1, 1,
-0.1034423, 0.6034722, -1.306674, 1, 1, 1, 1, 1,
-0.1032178, -1.065843, -5.081729, 1, 1, 1, 1, 1,
-0.09733059, 0.217826, -0.4832214, 1, 1, 1, 1, 1,
-0.09525194, 2.271232, 1.006528, 1, 1, 1, 1, 1,
-0.09374374, -0.2300713, -3.57786, 1, 1, 1, 1, 1,
-0.09214261, -1.744826, -3.108644, 0, 0, 1, 1, 1,
-0.09134692, 0.5537187, -1.853985, 1, 0, 0, 1, 1,
-0.09040289, 0.5289404, -0.1315947, 1, 0, 0, 1, 1,
-0.08712348, 2.568418, -0.1691106, 1, 0, 0, 1, 1,
-0.08128529, -2.151897, -1.977004, 1, 0, 0, 1, 1,
-0.08117739, -0.4900561, -2.844533, 1, 0, 0, 1, 1,
-0.07818228, 0.132142, -0.9382878, 0, 0, 0, 1, 1,
-0.07733668, -0.3863502, -1.218878, 0, 0, 0, 1, 1,
-0.07697897, 0.8086912, 2.082687, 0, 0, 0, 1, 1,
-0.07575855, -0.02003375, -3.069491, 0, 0, 0, 1, 1,
-0.07534928, 1.220029, 1.106967, 0, 0, 0, 1, 1,
-0.07534736, -0.6667657, -2.474561, 0, 0, 0, 1, 1,
-0.07478433, -0.2025338, -1.888945, 0, 0, 0, 1, 1,
-0.07099915, -0.4757049, -0.8055185, 1, 1, 1, 1, 1,
-0.06886759, -0.6387467, -3.043391, 1, 1, 1, 1, 1,
-0.06831829, 0.6529692, 0.8654099, 1, 1, 1, 1, 1,
-0.06359442, -1.640473, -1.403891, 1, 1, 1, 1, 1,
-0.06053991, 0.1578175, -0.4688896, 1, 1, 1, 1, 1,
-0.05842383, -0.9968439, -1.75678, 1, 1, 1, 1, 1,
-0.05820227, 1.241154, 0.9564166, 1, 1, 1, 1, 1,
-0.05722119, -0.3443388, -0.6895977, 1, 1, 1, 1, 1,
-0.05602802, -0.6078624, -2.642972, 1, 1, 1, 1, 1,
-0.03691163, -0.6223528, -3.257412, 1, 1, 1, 1, 1,
-0.03622571, -1.539555, -2.231293, 1, 1, 1, 1, 1,
-0.03485494, -0.03615332, -1.296879, 1, 1, 1, 1, 1,
-0.03317593, -0.3480625, -3.718851, 1, 1, 1, 1, 1,
-0.02013807, 1.177884, -0.3536714, 1, 1, 1, 1, 1,
-0.01999219, 2.325702, -0.4452966, 1, 1, 1, 1, 1,
-0.01821923, 1.278135, -0.7008022, 0, 0, 1, 1, 1,
-0.008174641, 0.7776524, -0.1072311, 1, 0, 0, 1, 1,
-0.0066347, -0.8232803, -3.064894, 1, 0, 0, 1, 1,
-0.00552174, -0.8027095, -3.284942, 1, 0, 0, 1, 1,
-0.005020678, -1.839673, -1.820821, 1, 0, 0, 1, 1,
-0.004561584, 1.053639, 0.7877049, 1, 0, 0, 1, 1,
-0.002052172, -0.5133553, -4.45133, 0, 0, 0, 1, 1,
-0.001504873, 0.1066756, 1.992099, 0, 0, 0, 1, 1,
0.001740543, -0.333465, 2.946589, 0, 0, 0, 1, 1,
0.001828124, 0.6788579, -0.2532275, 0, 0, 0, 1, 1,
0.00288747, -1.291137, 3.735999, 0, 0, 0, 1, 1,
0.006443892, -0.4673118, 5.787386, 0, 0, 0, 1, 1,
0.01107255, 0.08305891, 1.083027, 0, 0, 0, 1, 1,
0.01171264, -1.113202, 4.48683, 1, 1, 1, 1, 1,
0.01426031, 0.5822497, -0.4553842, 1, 1, 1, 1, 1,
0.01657306, 0.3954306, -1.408423, 1, 1, 1, 1, 1,
0.01990387, 0.4683172, -1.30148, 1, 1, 1, 1, 1,
0.02146828, 1.820197, 0.3190878, 1, 1, 1, 1, 1,
0.02178979, -0.4297157, 3.660043, 1, 1, 1, 1, 1,
0.02312632, 0.1284245, 0.4874451, 1, 1, 1, 1, 1,
0.02474845, -0.4192336, 3.45981, 1, 1, 1, 1, 1,
0.02678757, 1.166653, -0.5746583, 1, 1, 1, 1, 1,
0.0295612, -0.1170379, 1.290962, 1, 1, 1, 1, 1,
0.03408807, 0.3840076, -1.273517, 1, 1, 1, 1, 1,
0.03515592, 1.130438, 1.060748, 1, 1, 1, 1, 1,
0.0381912, -2.135039, 1.585418, 1, 1, 1, 1, 1,
0.04038789, -0.05638162, 0.4219398, 1, 1, 1, 1, 1,
0.04206623, -2.204234, 2.373277, 1, 1, 1, 1, 1,
0.04436524, 0.8550262, 0.5094736, 0, 0, 1, 1, 1,
0.04600544, 0.1681841, -0.8848177, 1, 0, 0, 1, 1,
0.04735735, -0.7222294, 4.179266, 1, 0, 0, 1, 1,
0.04808661, 1.039491, -0.8331015, 1, 0, 0, 1, 1,
0.0512503, 0.3801145, 1.168422, 1, 0, 0, 1, 1,
0.05158202, -1.6318, 4.813764, 1, 0, 0, 1, 1,
0.05191081, -0.8645772, 2.707991, 0, 0, 0, 1, 1,
0.05260893, 0.1553134, -0.09667774, 0, 0, 0, 1, 1,
0.05327008, 0.4697165, -0.3467446, 0, 0, 0, 1, 1,
0.0549472, 1.767516, 0.7398738, 0, 0, 0, 1, 1,
0.05499288, 1.155689, -1.743843, 0, 0, 0, 1, 1,
0.05543035, -1.10307, 2.544171, 0, 0, 0, 1, 1,
0.0557831, -0.08542009, 2.094826, 0, 0, 0, 1, 1,
0.05609335, 1.78821, 2.375144, 1, 1, 1, 1, 1,
0.05729753, -0.584827, 3.812391, 1, 1, 1, 1, 1,
0.0601899, -1.631896, 4.737105, 1, 1, 1, 1, 1,
0.06180211, 0.3846689, 0.7635642, 1, 1, 1, 1, 1,
0.06693871, 0.4917157, -0.1589235, 1, 1, 1, 1, 1,
0.06784748, 1.510507, -1.114809, 1, 1, 1, 1, 1,
0.07049277, 0.5894699, 0.1047971, 1, 1, 1, 1, 1,
0.07083725, -1.39765, 2.338582, 1, 1, 1, 1, 1,
0.07369879, -1.433058, 1.536436, 1, 1, 1, 1, 1,
0.07566741, -0.4825804, 0.5732319, 1, 1, 1, 1, 1,
0.08571377, -0.8401427, 3.15602, 1, 1, 1, 1, 1,
0.09576729, -0.3669859, 3.318534, 1, 1, 1, 1, 1,
0.1006425, -0.7751437, 4.547152, 1, 1, 1, 1, 1,
0.100716, -0.1039149, 2.751193, 1, 1, 1, 1, 1,
0.1008478, -0.4774405, 3.143292, 1, 1, 1, 1, 1,
0.101031, 1.83972, 1.436105, 0, 0, 1, 1, 1,
0.1014407, -1.859573, 4.217349, 1, 0, 0, 1, 1,
0.1043317, 1.40561, -1.648233, 1, 0, 0, 1, 1,
0.1073294, 1.925824, 0.5420499, 1, 0, 0, 1, 1,
0.1113572, 0.276116, -0.6174192, 1, 0, 0, 1, 1,
0.1139935, -0.6051591, 2.171897, 1, 0, 0, 1, 1,
0.1200734, 0.06441264, 2.982998, 0, 0, 0, 1, 1,
0.1214177, -1.17617, 3.533654, 0, 0, 0, 1, 1,
0.1299838, 0.06308699, 0.7104619, 0, 0, 0, 1, 1,
0.1383594, -1.401198, 2.744675, 0, 0, 0, 1, 1,
0.1391231, 0.4698601, 0.6138853, 0, 0, 0, 1, 1,
0.143952, 1.952889, 0.8668878, 0, 0, 0, 1, 1,
0.1477678, 0.1508551, -0.6398743, 0, 0, 0, 1, 1,
0.1531967, -0.6504734, 3.295059, 1, 1, 1, 1, 1,
0.153202, 0.2840535, 1.799109, 1, 1, 1, 1, 1,
0.1585698, 1.248812, 1.871539, 1, 1, 1, 1, 1,
0.159869, 1.238856, -0.5072352, 1, 1, 1, 1, 1,
0.1623504, -0.2288295, 2.723321, 1, 1, 1, 1, 1,
0.1630548, 0.5345836, 1.333055, 1, 1, 1, 1, 1,
0.1647458, -0.03492585, 2.050563, 1, 1, 1, 1, 1,
0.1667178, 0.9641885, 2.111817, 1, 1, 1, 1, 1,
0.1686809, -0.6614161, 4.169094, 1, 1, 1, 1, 1,
0.17387, -1.226223, 2.594991, 1, 1, 1, 1, 1,
0.1749513, -1.259368, 3.552435, 1, 1, 1, 1, 1,
0.1787666, 1.479411, 2.072242, 1, 1, 1, 1, 1,
0.1800455, 0.3442558, -1.721158, 1, 1, 1, 1, 1,
0.1808644, 0.7091619, -0.3332508, 1, 1, 1, 1, 1,
0.1818482, -0.7510722, 3.315186, 1, 1, 1, 1, 1,
0.1821935, 0.448662, 1.529706, 0, 0, 1, 1, 1,
0.1825796, 1.090724, -0.4137624, 1, 0, 0, 1, 1,
0.1855998, 0.05839496, 1.338272, 1, 0, 0, 1, 1,
0.1883481, -0.2112076, 3.997118, 1, 0, 0, 1, 1,
0.1900049, -0.8577928, 1.409258, 1, 0, 0, 1, 1,
0.193358, 0.07642458, 0.02473404, 1, 0, 0, 1, 1,
0.1943207, -0.9528514, 2.070532, 0, 0, 0, 1, 1,
0.2002481, 0.8735229, 2.074746, 0, 0, 0, 1, 1,
0.2062924, 1.723949, 0.5188502, 0, 0, 0, 1, 1,
0.2065412, -0.4628303, 3.385847, 0, 0, 0, 1, 1,
0.2080801, 0.3443204, 0.4156823, 0, 0, 0, 1, 1,
0.21151, -1.259392, 2.804056, 0, 0, 0, 1, 1,
0.2134617, -1.895812, 1.164484, 0, 0, 0, 1, 1,
0.2186883, 0.7539454, 1.741503, 1, 1, 1, 1, 1,
0.2187405, -0.7624709, 2.522561, 1, 1, 1, 1, 1,
0.2226843, -0.2053431, 3.231527, 1, 1, 1, 1, 1,
0.2255453, 0.01535178, 3.360674, 1, 1, 1, 1, 1,
0.2257188, 0.7334285, 1.433044, 1, 1, 1, 1, 1,
0.2284224, -0.5781261, 1.601995, 1, 1, 1, 1, 1,
0.2300683, -0.2100924, -0.1254175, 1, 1, 1, 1, 1,
0.2317491, 1.734345, -0.8669905, 1, 1, 1, 1, 1,
0.2320375, -0.4045955, 1.279477, 1, 1, 1, 1, 1,
0.232718, 0.7973961, 0.6072145, 1, 1, 1, 1, 1,
0.2336532, 0.9440202, 0.91614, 1, 1, 1, 1, 1,
0.2411396, -0.2381467, 1.464387, 1, 1, 1, 1, 1,
0.2436279, -1.589865, 2.271013, 1, 1, 1, 1, 1,
0.2451854, 1.098507, 1.087627, 1, 1, 1, 1, 1,
0.256016, -0.1743976, 2.860354, 1, 1, 1, 1, 1,
0.2572158, -0.2821076, 2.942554, 0, 0, 1, 1, 1,
0.2575599, 0.3522889, 1.082016, 1, 0, 0, 1, 1,
0.2598456, -1.422439, 3.896139, 1, 0, 0, 1, 1,
0.2599449, 0.4845112, 0.0193752, 1, 0, 0, 1, 1,
0.2650181, -1.270265, 2.779487, 1, 0, 0, 1, 1,
0.2665085, 0.1820955, 1.469383, 1, 0, 0, 1, 1,
0.269909, -0.08130358, 4.0179, 0, 0, 0, 1, 1,
0.2710328, -0.4564566, 1.617457, 0, 0, 0, 1, 1,
0.2799725, -1.691211, 3.197458, 0, 0, 0, 1, 1,
0.2829786, 1.238069, -0.9000896, 0, 0, 0, 1, 1,
0.2834356, 1.336866, 2.119404, 0, 0, 0, 1, 1,
0.2852899, -0.572548, 4.449991, 0, 0, 0, 1, 1,
0.2869284, -1.218856, 3.826266, 0, 0, 0, 1, 1,
0.2874429, 1.244408, -1.80794, 1, 1, 1, 1, 1,
0.2900093, 1.06345, 1.746962, 1, 1, 1, 1, 1,
0.2925921, -0.3129285, 2.791469, 1, 1, 1, 1, 1,
0.2980163, 0.09146512, 1.293068, 1, 1, 1, 1, 1,
0.2990272, 1.213948, 1.172682, 1, 1, 1, 1, 1,
0.301106, 2.363406, -0.2825698, 1, 1, 1, 1, 1,
0.3013221, -0.7372727, 3.850993, 1, 1, 1, 1, 1,
0.3022814, 0.1441271, 1.837264, 1, 1, 1, 1, 1,
0.3026793, -0.6876369, 3.740227, 1, 1, 1, 1, 1,
0.303157, 0.3699299, 0.6647535, 1, 1, 1, 1, 1,
0.3067839, 0.4472254, 1.123188, 1, 1, 1, 1, 1,
0.3106245, 1.300742, 1.699846, 1, 1, 1, 1, 1,
0.3127826, 0.4328144, 0.9693285, 1, 1, 1, 1, 1,
0.3132641, -0.2593495, 3.030427, 1, 1, 1, 1, 1,
0.3196093, 0.3456451, 1.090183, 1, 1, 1, 1, 1,
0.3202987, 0.09190355, 3.189946, 0, 0, 1, 1, 1,
0.3206115, -1.55395, 1.72851, 1, 0, 0, 1, 1,
0.3223968, 1.142582, -0.3500136, 1, 0, 0, 1, 1,
0.3235359, -0.8066101, 3.10202, 1, 0, 0, 1, 1,
0.3246561, 0.7317678, 0.8255171, 1, 0, 0, 1, 1,
0.3275488, 1.231756, -0.11874, 1, 0, 0, 1, 1,
0.3349068, -1.057265, 3.924395, 0, 0, 0, 1, 1,
0.3412719, 0.2925759, 2.397742, 0, 0, 0, 1, 1,
0.3429724, -0.009815987, 0.9445633, 0, 0, 0, 1, 1,
0.343163, 0.2707876, 1.238497, 0, 0, 0, 1, 1,
0.3447122, -0.8982674, 3.485168, 0, 0, 0, 1, 1,
0.3474443, 0.8420261, 0.5428486, 0, 0, 0, 1, 1,
0.3510728, 0.5087862, 1.601344, 0, 0, 0, 1, 1,
0.3541605, 0.1782025, -0.4892179, 1, 1, 1, 1, 1,
0.3541947, 1.576577, 1.439693, 1, 1, 1, 1, 1,
0.3620347, 1.263531, 1.136496, 1, 1, 1, 1, 1,
0.3630058, 0.1752577, 0.3432159, 1, 1, 1, 1, 1,
0.3658164, -1.407206, 3.676406, 1, 1, 1, 1, 1,
0.3701274, 0.7284483, 1.510107, 1, 1, 1, 1, 1,
0.370425, 1.527315, 0.6533706, 1, 1, 1, 1, 1,
0.3715029, -0.8183932, 2.204473, 1, 1, 1, 1, 1,
0.37152, -0.9576634, 2.784781, 1, 1, 1, 1, 1,
0.376225, 2.141348, -0.2746217, 1, 1, 1, 1, 1,
0.3771287, -0.009157578, 0.9184444, 1, 1, 1, 1, 1,
0.3788014, -0.6086934, 3.436631, 1, 1, 1, 1, 1,
0.3798116, -0.9804178, 4.054292, 1, 1, 1, 1, 1,
0.3860295, 0.3204741, 1.157383, 1, 1, 1, 1, 1,
0.3926983, 1.005879, 0.4968182, 1, 1, 1, 1, 1,
0.3938788, 0.9426863, -1.462278, 0, 0, 1, 1, 1,
0.3970493, -1.268119, 2.124961, 1, 0, 0, 1, 1,
0.3982027, -1.069559, 1.878936, 1, 0, 0, 1, 1,
0.4030039, -0.5283021, 3.387962, 1, 0, 0, 1, 1,
0.4041223, -0.6249028, 2.846694, 1, 0, 0, 1, 1,
0.4079429, 1.6333, -0.2171356, 1, 0, 0, 1, 1,
0.4122303, -0.8844994, 1.711262, 0, 0, 0, 1, 1,
0.4139611, -0.5172529, 2.807559, 0, 0, 0, 1, 1,
0.4150526, 0.8892003, 0.3446307, 0, 0, 0, 1, 1,
0.4169115, 0.3983487, 1.987781, 0, 0, 0, 1, 1,
0.4200188, 0.8272282, 0.9633243, 0, 0, 0, 1, 1,
0.4245458, 0.5584511, 0.9171684, 0, 0, 0, 1, 1,
0.4262778, -1.680536, 3.486028, 0, 0, 0, 1, 1,
0.4273821, -0.3973418, 2.876833, 1, 1, 1, 1, 1,
0.4302361, 0.3017409, 1.198725, 1, 1, 1, 1, 1,
0.4425396, 0.8100135, -0.5265195, 1, 1, 1, 1, 1,
0.4481086, 0.03385146, 0.9456678, 1, 1, 1, 1, 1,
0.4507209, -0.0301533, -0.0844568, 1, 1, 1, 1, 1,
0.4536466, 2.227547, 0.2329298, 1, 1, 1, 1, 1,
0.4549842, 0.6150026, 0.8759333, 1, 1, 1, 1, 1,
0.4599561, 0.5324981, 0.5254925, 1, 1, 1, 1, 1,
0.4607373, -0.5371819, 4.308371, 1, 1, 1, 1, 1,
0.4631909, 0.2910233, -0.7826382, 1, 1, 1, 1, 1,
0.4644697, -0.5375396, 2.65396, 1, 1, 1, 1, 1,
0.4651258, -0.172123, 1.979889, 1, 1, 1, 1, 1,
0.4697699, 0.2741175, 1.997423, 1, 1, 1, 1, 1,
0.4766808, -1.518587, 2.126796, 1, 1, 1, 1, 1,
0.4847399, -0.4975592, 3.343794, 1, 1, 1, 1, 1,
0.4959481, -0.08119104, 2.68918, 0, 0, 1, 1, 1,
0.4974149, -1.272894, 2.782524, 1, 0, 0, 1, 1,
0.5009378, 0.8425359, -0.3699181, 1, 0, 0, 1, 1,
0.5015521, 1.220211, 0.8511546, 1, 0, 0, 1, 1,
0.5037887, 0.6415331, 0.2784782, 1, 0, 0, 1, 1,
0.5056227, 1.033196, 0.2816896, 1, 0, 0, 1, 1,
0.5083613, 0.4272254, 2.733991, 0, 0, 0, 1, 1,
0.5100053, -0.8157655, 3.55262, 0, 0, 0, 1, 1,
0.5110269, -1.227858, 3.200253, 0, 0, 0, 1, 1,
0.516745, -1.168395, 2.224694, 0, 0, 0, 1, 1,
0.5195744, 1.68353, 1.091149, 0, 0, 0, 1, 1,
0.5199119, -0.2138643, 3.372344, 0, 0, 0, 1, 1,
0.5222008, -0.4339709, 1.920532, 0, 0, 0, 1, 1,
0.5222313, -1.969587, 3.311439, 1, 1, 1, 1, 1,
0.5225003, -0.06491748, 2.73751, 1, 1, 1, 1, 1,
0.5242156, -0.3936345, 2.532806, 1, 1, 1, 1, 1,
0.5253007, -0.05359808, 1.404127, 1, 1, 1, 1, 1,
0.5287012, 0.06860738, -0.04728666, 1, 1, 1, 1, 1,
0.5298544, 0.404823, 0.9522335, 1, 1, 1, 1, 1,
0.5311272, 0.2239159, 0.2916657, 1, 1, 1, 1, 1,
0.5391352, -0.741543, 3.655653, 1, 1, 1, 1, 1,
0.5409132, 1.418531, 0.3432663, 1, 1, 1, 1, 1,
0.5429854, -0.2743511, 1.728788, 1, 1, 1, 1, 1,
0.5455674, 0.8454435, 2.185852, 1, 1, 1, 1, 1,
0.5455834, -1.334732, 3.407991, 1, 1, 1, 1, 1,
0.5486095, -0.750979, 2.587029, 1, 1, 1, 1, 1,
0.54913, 1.543524, -1.48586, 1, 1, 1, 1, 1,
0.5496771, 0.3880757, -0.5229282, 1, 1, 1, 1, 1,
0.5550525, 1.81477, 1.163039, 0, 0, 1, 1, 1,
0.5611247, 1.325304, 0.6975105, 1, 0, 0, 1, 1,
0.5640088, 0.3478056, 0.4746868, 1, 0, 0, 1, 1,
0.5700477, 0.1544699, 1.756226, 1, 0, 0, 1, 1,
0.574458, 1.652825, -0.3658382, 1, 0, 0, 1, 1,
0.580304, -0.2024726, 1.44957, 1, 0, 0, 1, 1,
0.5843351, 0.6102653, 1.068626, 0, 0, 0, 1, 1,
0.5902133, -0.8598536, 1.508808, 0, 0, 0, 1, 1,
0.5920544, -0.3418409, 1.20051, 0, 0, 0, 1, 1,
0.5977762, 0.5059262, 1.1519, 0, 0, 0, 1, 1,
0.6026513, 1.113911, 0.179359, 0, 0, 0, 1, 1,
0.6050733, 0.1999526, 1.577866, 0, 0, 0, 1, 1,
0.6160189, -0.8647243, 1.64665, 0, 0, 0, 1, 1,
0.6219531, -0.545755, 2.495273, 1, 1, 1, 1, 1,
0.6303383, -0.5224295, 4.763191, 1, 1, 1, 1, 1,
0.6308067, -1.767055, 2.975167, 1, 1, 1, 1, 1,
0.6368857, 0.89025, 1.427936, 1, 1, 1, 1, 1,
0.641708, 1.206272, 0.3457867, 1, 1, 1, 1, 1,
0.6422497, -0.4541452, 1.779135, 1, 1, 1, 1, 1,
0.6434255, 1.838229, -0.2156655, 1, 1, 1, 1, 1,
0.6434791, 0.2431397, 2.48542, 1, 1, 1, 1, 1,
0.6438746, 0.2146724, 1.188528, 1, 1, 1, 1, 1,
0.6485957, 1.083032, -1.21856, 1, 1, 1, 1, 1,
0.6499769, 0.9171515, 0.363316, 1, 1, 1, 1, 1,
0.6505688, 1.741662, 1.607362, 1, 1, 1, 1, 1,
0.6544443, -2.198736, 3.71093, 1, 1, 1, 1, 1,
0.6547379, -0.5765917, 3.008631, 1, 1, 1, 1, 1,
0.6553634, -0.7890497, 1.32032, 1, 1, 1, 1, 1,
0.6574872, -1.11162, 3.208939, 0, 0, 1, 1, 1,
0.6599918, 0.5496941, 2.816229, 1, 0, 0, 1, 1,
0.6638981, -0.3628071, 0.7088397, 1, 0, 0, 1, 1,
0.6642011, 0.580206, 0.9411933, 1, 0, 0, 1, 1,
0.6648638, -1.127513, 2.7866, 1, 0, 0, 1, 1,
0.6741651, -0.3460812, -1.852636, 1, 0, 0, 1, 1,
0.6753329, 1.357224, 0.6458978, 0, 0, 0, 1, 1,
0.6762622, 0.1351852, 1.659698, 0, 0, 0, 1, 1,
0.6811665, 0.6165593, -0.8500597, 0, 0, 0, 1, 1,
0.6856092, 1.722939, 0.48137, 0, 0, 0, 1, 1,
0.693092, -0.9258971, 3.033261, 0, 0, 0, 1, 1,
0.6960645, -0.4175905, 1.661987, 0, 0, 0, 1, 1,
0.7042035, -0.9091104, 3.708117, 0, 0, 0, 1, 1,
0.70471, 2.316666, 0.008754619, 1, 1, 1, 1, 1,
0.7056047, -0.822692, 2.873259, 1, 1, 1, 1, 1,
0.7058181, -0.906444, 2.840112, 1, 1, 1, 1, 1,
0.7183807, 0.2440881, 1.030308, 1, 1, 1, 1, 1,
0.7320572, 0.09309798, 0.4556032, 1, 1, 1, 1, 1,
0.734964, -0.6586698, 3.305927, 1, 1, 1, 1, 1,
0.7355831, 0.3734732, 1.23296, 1, 1, 1, 1, 1,
0.7370106, -0.5867549, 1.672171, 1, 1, 1, 1, 1,
0.7378779, -2.390756, 0.07540032, 1, 1, 1, 1, 1,
0.7397194, -0.9283463, 3.00235, 1, 1, 1, 1, 1,
0.7409388, -0.7905406, 1.010728, 1, 1, 1, 1, 1,
0.7478398, -0.2094938, 0.6605439, 1, 1, 1, 1, 1,
0.7481109, 0.3773943, 0.9680339, 1, 1, 1, 1, 1,
0.7482134, -0.641657, 1.335002, 1, 1, 1, 1, 1,
0.751119, 0.302804, 0.06063139, 1, 1, 1, 1, 1,
0.7656623, -1.834821, 0.9733838, 0, 0, 1, 1, 1,
0.770318, 0.3699208, 1.804603, 1, 0, 0, 1, 1,
0.7791533, 0.8522791, -0.9177, 1, 0, 0, 1, 1,
0.7845418, 0.05372671, 2.496127, 1, 0, 0, 1, 1,
0.7859609, 0.8584743, -0.4207211, 1, 0, 0, 1, 1,
0.7983284, 1.249931, 2.003735, 1, 0, 0, 1, 1,
0.8017263, 1.209589, 2.359953, 0, 0, 0, 1, 1,
0.8069842, -0.4893071, 1.575497, 0, 0, 0, 1, 1,
0.8115474, -0.8952413, 1.747578, 0, 0, 0, 1, 1,
0.8144064, -0.4046662, 2.78205, 0, 0, 0, 1, 1,
0.816133, -1.194449, 3.989663, 0, 0, 0, 1, 1,
0.8167092, 0.7259512, 0.6052973, 0, 0, 0, 1, 1,
0.8286512, -0.8820241, 5.283764, 0, 0, 0, 1, 1,
0.8405177, 0.3581476, 0.9182509, 1, 1, 1, 1, 1,
0.8420463, 1.111729, 0.5390522, 1, 1, 1, 1, 1,
0.8443366, 1.289297, 0.4311934, 1, 1, 1, 1, 1,
0.8443404, 1.011899, 0.4821915, 1, 1, 1, 1, 1,
0.8454272, -1.253135, 1.997607, 1, 1, 1, 1, 1,
0.8459445, 0.3405038, 0.9677173, 1, 1, 1, 1, 1,
0.8471078, 1.027094, 1.4831, 1, 1, 1, 1, 1,
0.8518639, -1.785531, 3.489641, 1, 1, 1, 1, 1,
0.8671927, -0.488132, 1.610925, 1, 1, 1, 1, 1,
0.8691288, 0.705804, 0.2009271, 1, 1, 1, 1, 1,
0.8694583, -1.112738, 3.846467, 1, 1, 1, 1, 1,
0.8721947, 0.1371271, 1.716008, 1, 1, 1, 1, 1,
0.8749598, -0.9295976, 2.570362, 1, 1, 1, 1, 1,
0.8789639, 0.6603985, -0.2127799, 1, 1, 1, 1, 1,
0.8819726, -0.1060887, 0.7999398, 1, 1, 1, 1, 1,
0.8821547, -1.230103, 2.451216, 0, 0, 1, 1, 1,
0.8845178, 0.5346673, 0.6493782, 1, 0, 0, 1, 1,
0.8894782, 0.247985, 2.147151, 1, 0, 0, 1, 1,
0.8971574, -0.6351072, 4.245415, 1, 0, 0, 1, 1,
0.8979046, 0.2236435, 2.058256, 1, 0, 0, 1, 1,
0.9032392, 0.250736, 1.385508, 1, 0, 0, 1, 1,
0.9083192, -0.7416956, 2.469979, 0, 0, 0, 1, 1,
0.9108229, -1.566431, 3.812118, 0, 0, 0, 1, 1,
0.9121521, 1.997859, -0.5140592, 0, 0, 0, 1, 1,
0.9127357, 0.5160598, 3.164498, 0, 0, 0, 1, 1,
0.913379, -0.8069538, 3.192359, 0, 0, 0, 1, 1,
0.921778, -1.478721, 3.145069, 0, 0, 0, 1, 1,
0.9234413, 0.01464803, 0.8803944, 0, 0, 0, 1, 1,
0.9241147, -0.1688811, 1.82719, 1, 1, 1, 1, 1,
0.9286152, -0.1902441, 1.227139, 1, 1, 1, 1, 1,
0.928802, 0.4689159, -1.295378, 1, 1, 1, 1, 1,
0.9369649, -1.265597, 2.285507, 1, 1, 1, 1, 1,
0.9412518, -0.7280381, 3.485325, 1, 1, 1, 1, 1,
0.9415326, -0.2368583, -0.3485377, 1, 1, 1, 1, 1,
0.9468818, 2.252339, -1.526259, 1, 1, 1, 1, 1,
0.9500837, -0.1172315, 1.807124, 1, 1, 1, 1, 1,
0.9634524, -0.09679565, 1.52656, 1, 1, 1, 1, 1,
0.9636278, 0.5227413, 1.15434, 1, 1, 1, 1, 1,
0.9673147, 0.5221976, 2.152938, 1, 1, 1, 1, 1,
0.9710766, 0.004779395, 0.6855913, 1, 1, 1, 1, 1,
0.9729016, -0.5520567, 2.136291, 1, 1, 1, 1, 1,
0.9797565, 0.5174145, 1.122069, 1, 1, 1, 1, 1,
0.9844024, -0.3603487, 0.6197611, 1, 1, 1, 1, 1,
0.9872885, 1.352026, 2.003318, 0, 0, 1, 1, 1,
0.9917231, -0.03344321, 2.870013, 1, 0, 0, 1, 1,
0.9928054, 1.715128, 0.1542317, 1, 0, 0, 1, 1,
0.9931539, 0.05839289, 0.8160018, 1, 0, 0, 1, 1,
0.9957781, 0.6648701, 1.00672, 1, 0, 0, 1, 1,
1.000913, 0.4496176, 2.083249, 1, 0, 0, 1, 1,
1.00645, 0.7815112, 1.258837, 0, 0, 0, 1, 1,
1.007292, 0.3280226, 0.6184418, 0, 0, 0, 1, 1,
1.008335, 0.5886227, 1.285363, 0, 0, 0, 1, 1,
1.010577, 2.015427, 0.09777389, 0, 0, 0, 1, 1,
1.012828, 0.1807411, 1.028109, 0, 0, 0, 1, 1,
1.014827, -0.2056205, 1.314293, 0, 0, 0, 1, 1,
1.017915, -1.07965, 4.288719, 0, 0, 0, 1, 1,
1.01896, -0.3859134, 2.742316, 1, 1, 1, 1, 1,
1.026074, -1.152328, 2.904786, 1, 1, 1, 1, 1,
1.029759, 0.6553968, 2.178162, 1, 1, 1, 1, 1,
1.030987, 0.1205315, 1.124986, 1, 1, 1, 1, 1,
1.035953, 0.1753357, 1.495056, 1, 1, 1, 1, 1,
1.040285, 0.9431772, 1.727776, 1, 1, 1, 1, 1,
1.046886, -0.1405563, 2.341884, 1, 1, 1, 1, 1,
1.048022, -1.452379, 2.071356, 1, 1, 1, 1, 1,
1.049357, -0.6425236, 1.249501, 1, 1, 1, 1, 1,
1.052656, -1.941969, 1.86004, 1, 1, 1, 1, 1,
1.055016, 0.105665, 0.9191175, 1, 1, 1, 1, 1,
1.080578, -0.1219679, 1.151992, 1, 1, 1, 1, 1,
1.082769, 0.6579681, 1.024915, 1, 1, 1, 1, 1,
1.087787, -0.4295843, 3.301258, 1, 1, 1, 1, 1,
1.08892, 0.9264259, 1.442856, 1, 1, 1, 1, 1,
1.090627, -0.3723526, 1.067962, 0, 0, 1, 1, 1,
1.091181, 1.868811, -0.06744183, 1, 0, 0, 1, 1,
1.105066, -0.4985559, 2.587125, 1, 0, 0, 1, 1,
1.106711, 0.2827618, 0.511879, 1, 0, 0, 1, 1,
1.109428, -1.256638, 3.599016, 1, 0, 0, 1, 1,
1.111258, -0.1483415, 1.306885, 1, 0, 0, 1, 1,
1.120883, -2.193378, 0.8071928, 0, 0, 0, 1, 1,
1.123076, -1.445595, 2.167206, 0, 0, 0, 1, 1,
1.128509, -0.2495882, 1.003918, 0, 0, 0, 1, 1,
1.129123, -1.020657, 1.180975, 0, 0, 0, 1, 1,
1.133716, -1.577979, 2.400749, 0, 0, 0, 1, 1,
1.136972, -1.296193, 1.710468, 0, 0, 0, 1, 1,
1.137896, -0.0649154, 1.328754, 0, 0, 0, 1, 1,
1.139957, -0.5305646, 1.239367, 1, 1, 1, 1, 1,
1.14176, -0.5662555, 1.421637, 1, 1, 1, 1, 1,
1.144518, -0.02319107, 1.332736, 1, 1, 1, 1, 1,
1.149005, 1.284943, 0.3713338, 1, 1, 1, 1, 1,
1.159015, -0.1892342, 0.02086544, 1, 1, 1, 1, 1,
1.162224, 0.5069918, 1.871773, 1, 1, 1, 1, 1,
1.165794, -0.8135293, 3.293194, 1, 1, 1, 1, 1,
1.186265, 0.2109266, 1.617531, 1, 1, 1, 1, 1,
1.200063, -0.3158986, 3.090759, 1, 1, 1, 1, 1,
1.200246, 0.12785, 2.095694, 1, 1, 1, 1, 1,
1.201698, 0.2359597, 0.3677519, 1, 1, 1, 1, 1,
1.204781, 0.752349, -1.036098, 1, 1, 1, 1, 1,
1.205473, 0.7307159, 2.432292, 1, 1, 1, 1, 1,
1.21039, 0.7580766, 0.5671268, 1, 1, 1, 1, 1,
1.212228, -1.359223, 3.500245, 1, 1, 1, 1, 1,
1.230255, 0.9703416, 0.5983841, 0, 0, 1, 1, 1,
1.233162, 1.731233, -0.07148402, 1, 0, 0, 1, 1,
1.233374, 0.8148038, 1.057873, 1, 0, 0, 1, 1,
1.237514, 0.487393, 0.740339, 1, 0, 0, 1, 1,
1.23923, 0.6319997, 0.5897228, 1, 0, 0, 1, 1,
1.256843, -0.8116637, 2.620795, 1, 0, 0, 1, 1,
1.267269, 0.5206074, 2.83925, 0, 0, 0, 1, 1,
1.270668, -0.8899562, 0.3202705, 0, 0, 0, 1, 1,
1.279984, 0.7678436, 0.7192557, 0, 0, 0, 1, 1,
1.283321, -0.373525, 2.844412, 0, 0, 0, 1, 1,
1.288202, 0.285664, 1.893407, 0, 0, 0, 1, 1,
1.290839, 1.62786, 1.810539, 0, 0, 0, 1, 1,
1.298281, 0.5349355, -0.2372643, 0, 0, 0, 1, 1,
1.300582, -2.365987, 3.258252, 1, 1, 1, 1, 1,
1.306536, 0.4542955, -0.9734464, 1, 1, 1, 1, 1,
1.306926, 1.170482, 1.633683, 1, 1, 1, 1, 1,
1.309266, -0.08347146, 0.8726325, 1, 1, 1, 1, 1,
1.315918, -0.1554626, 1.029845, 1, 1, 1, 1, 1,
1.317915, -0.405011, 2.142536, 1, 1, 1, 1, 1,
1.32515, -0.5658157, 3.734367, 1, 1, 1, 1, 1,
1.325738, 0.5783945, 0.5921136, 1, 1, 1, 1, 1,
1.335889, 0.1871892, 1.602722, 1, 1, 1, 1, 1,
1.341211, -0.6295499, 1.579021, 1, 1, 1, 1, 1,
1.343418, 0.1099601, 1.340432, 1, 1, 1, 1, 1,
1.347731, 1.497801, 0.9573137, 1, 1, 1, 1, 1,
1.351401, 0.7764943, 3.077406, 1, 1, 1, 1, 1,
1.35717, 2.303307, 0.6981463, 1, 1, 1, 1, 1,
1.358254, -0.7683021, 3.35773, 1, 1, 1, 1, 1,
1.36105, -0.2122282, 1.78531, 0, 0, 1, 1, 1,
1.389519, 0.2901882, 0.05889315, 1, 0, 0, 1, 1,
1.39143, 1.185258, 0.9847114, 1, 0, 0, 1, 1,
1.392609, 0.1094369, 0.2400085, 1, 0, 0, 1, 1,
1.407792, -1.644239, 2.273101, 1, 0, 0, 1, 1,
1.408704, -0.2353661, 1.129228, 1, 0, 0, 1, 1,
1.416862, -1.18018, 3.4823, 0, 0, 0, 1, 1,
1.417837, -0.559046, 0.9686096, 0, 0, 0, 1, 1,
1.425281, -1.905659, 3.602673, 0, 0, 0, 1, 1,
1.430882, 0.1657942, 0.2135469, 0, 0, 0, 1, 1,
1.437533, -0.7999136, 2.050429, 0, 0, 0, 1, 1,
1.44282, -2.600112, -0.05164479, 0, 0, 0, 1, 1,
1.449497, 2.583462, 1.19255, 0, 0, 0, 1, 1,
1.457633, -0.06355488, 3.018854, 1, 1, 1, 1, 1,
1.468586, 0.9464481, 1.769818, 1, 1, 1, 1, 1,
1.469001, -0.1222945, 0.5830691, 1, 1, 1, 1, 1,
1.471486, 0.8149559, 0.4891391, 1, 1, 1, 1, 1,
1.476008, 0.7690943, 1.238751, 1, 1, 1, 1, 1,
1.476936, -0.5280197, 3.116657, 1, 1, 1, 1, 1,
1.478031, -0.4789671, 0.2244231, 1, 1, 1, 1, 1,
1.492462, 1.003253, 1.668308, 1, 1, 1, 1, 1,
1.494682, 0.4795288, 0.2762913, 1, 1, 1, 1, 1,
1.494695, -0.702981, 3.161934, 1, 1, 1, 1, 1,
1.49813, -2.056192, 3.292344, 1, 1, 1, 1, 1,
1.513724, -1.672014, 2.235752, 1, 1, 1, 1, 1,
1.531518, 0.4394522, 0.7837914, 1, 1, 1, 1, 1,
1.566901, 1.766808, 0.4517629, 1, 1, 1, 1, 1,
1.581624, -0.7917926, 3.407106, 1, 1, 1, 1, 1,
1.582657, 0.01025754, 1.437373, 0, 0, 1, 1, 1,
1.586081, -0.6100113, 0.3722773, 1, 0, 0, 1, 1,
1.587976, 1.050217, 0.03963887, 1, 0, 0, 1, 1,
1.634633, 0.4864859, 1.640846, 1, 0, 0, 1, 1,
1.640744, -2.807034, 4.186318, 1, 0, 0, 1, 1,
1.64705, -0.3069852, 0.5718353, 1, 0, 0, 1, 1,
1.648737, -0.5110543, 1.201823, 0, 0, 0, 1, 1,
1.652452, -1.47046, 3.502089, 0, 0, 0, 1, 1,
1.661335, -0.4387804, 1.514375, 0, 0, 0, 1, 1,
1.668206, -1.104657, 2.071674, 0, 0, 0, 1, 1,
1.681986, -1.795719, 2.693333, 0, 0, 0, 1, 1,
1.687785, 0.8713681, 1.117913, 0, 0, 0, 1, 1,
1.693447, 1.078677, 0.9338886, 0, 0, 0, 1, 1,
1.698437, 0.003346164, 0.8518764, 1, 1, 1, 1, 1,
1.711991, -0.9493247, 0.2475766, 1, 1, 1, 1, 1,
1.71265, 0.4845975, 1.693901, 1, 1, 1, 1, 1,
1.716313, -1.672439, 2.051195, 1, 1, 1, 1, 1,
1.740382, 0.02924038, 1.101271, 1, 1, 1, 1, 1,
1.751993, -0.1747839, 2.519403, 1, 1, 1, 1, 1,
1.758879, -0.5076302, 1.685108, 1, 1, 1, 1, 1,
1.779441, 0.4839144, -0.0267544, 1, 1, 1, 1, 1,
1.790536, 1.036045, 1.093206, 1, 1, 1, 1, 1,
1.796461, 0.3896948, 0.2499261, 1, 1, 1, 1, 1,
1.801692, -0.5942804, 2.634906, 1, 1, 1, 1, 1,
1.804651, -0.9779677, 3.226787, 1, 1, 1, 1, 1,
1.806721, -0.8481015, 1.954715, 1, 1, 1, 1, 1,
1.810121, 0.3220905, 1.007013, 1, 1, 1, 1, 1,
1.842892, -0.7767444, 1.570607, 1, 1, 1, 1, 1,
1.842915, -0.1270286, 0.95555, 0, 0, 1, 1, 1,
1.844326, 1.771405, 1.115463, 1, 0, 0, 1, 1,
1.868511, -1.646467, 4.789337, 1, 0, 0, 1, 1,
1.898973, -0.06129744, 2.236691, 1, 0, 0, 1, 1,
1.908018, -0.3500357, 0.3574124, 1, 0, 0, 1, 1,
1.959286, 0.09072097, 1.47278, 1, 0, 0, 1, 1,
2.048532, -0.2704494, 2.377561, 0, 0, 0, 1, 1,
2.095026, -0.697399, 1.962825, 0, 0, 0, 1, 1,
2.132501, -0.5741736, 4.454458, 0, 0, 0, 1, 1,
2.132759, -0.5413941, 2.086805, 0, 0, 0, 1, 1,
2.229855, -0.890614, 2.901839, 0, 0, 0, 1, 1,
2.252116, -0.1626208, 0.603471, 0, 0, 0, 1, 1,
2.339015, -0.2521347, 1.188301, 0, 0, 0, 1, 1,
2.36365, 0.5016698, 1.877971, 1, 1, 1, 1, 1,
2.393042, 0.3107862, 1.025793, 1, 1, 1, 1, 1,
2.484501, 0.2961071, 0.4610332, 1, 1, 1, 1, 1,
2.675632, -1.042576, 3.898513, 1, 1, 1, 1, 1,
2.719518, 0.6247442, 2.214748, 1, 1, 1, 1, 1,
2.856826, -0.9584681, 2.480415, 1, 1, 1, 1, 1,
2.934667, -0.1355736, 1.938336, 1, 1, 1, 1, 1
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
var radius = 9.559409;
var distance = 33.57702;
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
mvMatrix.translate( -0.08862126, -0.07543278, -0.03039312 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.57702);
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
