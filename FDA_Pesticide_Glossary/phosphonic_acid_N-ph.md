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
-2.87561, 0.3435254, -1.982439, 1, 0, 0, 1,
-2.577155, -0.9046322, -1.858552, 1, 0.007843138, 0, 1,
-2.469498, 0.05081026, -2.16971, 1, 0.01176471, 0, 1,
-2.424892, -0.3207747, -0.8986331, 1, 0.01960784, 0, 1,
-2.412176, -1.433769, -1.721024, 1, 0.02352941, 0, 1,
-2.386062, -0.5651047, -3.51964, 1, 0.03137255, 0, 1,
-2.341151, -0.4477062, -1.834836, 1, 0.03529412, 0, 1,
-2.300295, -0.5675225, -2.01246, 1, 0.04313726, 0, 1,
-2.26958, 0.03264957, -1.041258, 1, 0.04705882, 0, 1,
-2.268835, -0.6681203, -0.9016792, 1, 0.05490196, 0, 1,
-2.253698, 0.8761762, -1.5663, 1, 0.05882353, 0, 1,
-2.2314, 0.9973302, -0.7367624, 1, 0.06666667, 0, 1,
-2.214302, -0.7591452, -3.177266, 1, 0.07058824, 0, 1,
-2.104126, -0.6996924, -2.931536, 1, 0.07843138, 0, 1,
-2.100856, -1.130884, -0.7778411, 1, 0.08235294, 0, 1,
-2.092294, -0.4089262, -1.661276, 1, 0.09019608, 0, 1,
-2.079556, 0.670285, -1.547259, 1, 0.09411765, 0, 1,
-2.064401, 1.450791, -0.2018153, 1, 0.1019608, 0, 1,
-1.996398, 1.259313, -1.842666, 1, 0.1098039, 0, 1,
-1.970799, -0.7238238, -1.315685, 1, 0.1137255, 0, 1,
-1.947824, -0.1517367, 0.3390182, 1, 0.1215686, 0, 1,
-1.937372, 1.511348, 1.970802, 1, 0.1254902, 0, 1,
-1.921012, -1.54944, -3.251188, 1, 0.1333333, 0, 1,
-1.914617, 0.162688, -0.9401174, 1, 0.1372549, 0, 1,
-1.913545, -0.7242693, -2.629275, 1, 0.145098, 0, 1,
-1.91026, 0.178255, -1.208682, 1, 0.1490196, 0, 1,
-1.873692, 0.3482418, -2.441149, 1, 0.1568628, 0, 1,
-1.862581, -0.5642608, -1.751365, 1, 0.1607843, 0, 1,
-1.835616, 1.105505, -0.8279392, 1, 0.1686275, 0, 1,
-1.824236, -0.6973355, -1.600033, 1, 0.172549, 0, 1,
-1.819066, -0.4835264, -2.093235, 1, 0.1803922, 0, 1,
-1.815328, -0.5127729, -1.944454, 1, 0.1843137, 0, 1,
-1.810776, -0.1121777, 0.03840486, 1, 0.1921569, 0, 1,
-1.784405, 0.02112768, -1.341635, 1, 0.1960784, 0, 1,
-1.74634, -0.7561081, -0.4559332, 1, 0.2039216, 0, 1,
-1.741252, 0.9579206, -1.38806, 1, 0.2117647, 0, 1,
-1.738347, 0.2358328, -1.264164, 1, 0.2156863, 0, 1,
-1.725036, 0.3277426, -1.393192, 1, 0.2235294, 0, 1,
-1.720781, 1.695794, -2.213918, 1, 0.227451, 0, 1,
-1.699438, 0.06633845, -1.206387, 1, 0.2352941, 0, 1,
-1.681145, 2.171876, -0.1814224, 1, 0.2392157, 0, 1,
-1.6801, -0.4491294, -1.459897, 1, 0.2470588, 0, 1,
-1.672345, 0.9126703, -0.3605644, 1, 0.2509804, 0, 1,
-1.650132, -0.7248834, -2.258348, 1, 0.2588235, 0, 1,
-1.606648, -0.6263076, -3.216114, 1, 0.2627451, 0, 1,
-1.603787, -0.2561737, -1.838896, 1, 0.2705882, 0, 1,
-1.590172, 0.8293118, 0.1966452, 1, 0.2745098, 0, 1,
-1.567334, 0.2041604, -1.175739, 1, 0.282353, 0, 1,
-1.561166, -0.519483, -1.295523, 1, 0.2862745, 0, 1,
-1.53969, -0.5244799, -2.404476, 1, 0.2941177, 0, 1,
-1.530377, 0.4031783, -1.922708, 1, 0.3019608, 0, 1,
-1.526526, -1.310298, -0.7576975, 1, 0.3058824, 0, 1,
-1.509755, -0.584713, -1.304176, 1, 0.3137255, 0, 1,
-1.502141, -0.2332397, -0.6681787, 1, 0.3176471, 0, 1,
-1.496089, 1.401348, -1.677151, 1, 0.3254902, 0, 1,
-1.490637, -0.2406363, -2.144591, 1, 0.3294118, 0, 1,
-1.487781, -0.9454204, -0.3835346, 1, 0.3372549, 0, 1,
-1.486423, 0.3273214, -2.352774, 1, 0.3411765, 0, 1,
-1.470818, 0.7518811, -1.658195, 1, 0.3490196, 0, 1,
-1.463485, 0.4946881, -1.291329, 1, 0.3529412, 0, 1,
-1.454699, 0.6985952, -1.122104, 1, 0.3607843, 0, 1,
-1.453388, -1.021167, -3.157185, 1, 0.3647059, 0, 1,
-1.444753, -0.7103099, -2.412466, 1, 0.372549, 0, 1,
-1.44338, -0.4376908, -1.863316, 1, 0.3764706, 0, 1,
-1.430662, 0.3154496, -0.9313582, 1, 0.3843137, 0, 1,
-1.430357, 1.326112, -1.558152, 1, 0.3882353, 0, 1,
-1.425415, -1.37393, -2.366909, 1, 0.3960784, 0, 1,
-1.421927, 2.256281, -2.385413, 1, 0.4039216, 0, 1,
-1.4063, -0.2918054, -0.9207166, 1, 0.4078431, 0, 1,
-1.403647, 1.065483, -0.9959469, 1, 0.4156863, 0, 1,
-1.398762, 1.549504, -0.4755635, 1, 0.4196078, 0, 1,
-1.395612, 0.5062649, -1.358573, 1, 0.427451, 0, 1,
-1.3818, -0.8777423, -2.786223, 1, 0.4313726, 0, 1,
-1.379929, -0.392354, -1.479546, 1, 0.4392157, 0, 1,
-1.350395, -1.179338, -2.036167, 1, 0.4431373, 0, 1,
-1.347982, -0.2778761, -1.452856, 1, 0.4509804, 0, 1,
-1.347365, 0.3186442, -2.847524, 1, 0.454902, 0, 1,
-1.327769, 0.1562471, -1.241376, 1, 0.4627451, 0, 1,
-1.326558, 0.8295355, -0.9233979, 1, 0.4666667, 0, 1,
-1.322051, -0.5356414, -0.7252591, 1, 0.4745098, 0, 1,
-1.318174, 0.2691146, -2.276576, 1, 0.4784314, 0, 1,
-1.303534, 0.7865807, -1.642508, 1, 0.4862745, 0, 1,
-1.298638, 0.2136153, -3.664679, 1, 0.4901961, 0, 1,
-1.297448, 0.9340093, -0.5043346, 1, 0.4980392, 0, 1,
-1.295849, -0.5691974, -2.508677, 1, 0.5058824, 0, 1,
-1.294484, 0.2762284, -0.7982984, 1, 0.509804, 0, 1,
-1.293804, 0.05880013, -2.825604, 1, 0.5176471, 0, 1,
-1.283145, 2.363811, -0.7875218, 1, 0.5215687, 0, 1,
-1.281534, -1.432807, -3.689228, 1, 0.5294118, 0, 1,
-1.265965, -1.064014, -0.3902813, 1, 0.5333334, 0, 1,
-1.262714, -0.2634556, -2.797661, 1, 0.5411765, 0, 1,
-1.259628, -1.293531, -3.112986, 1, 0.5450981, 0, 1,
-1.25916, -1.557015, -1.595117, 1, 0.5529412, 0, 1,
-1.252929, 0.8531075, -1.472728, 1, 0.5568628, 0, 1,
-1.247144, 0.5218382, -1.840766, 1, 0.5647059, 0, 1,
-1.246328, 0.3216422, -1.030912, 1, 0.5686275, 0, 1,
-1.245357, -0.3861427, -1.356885, 1, 0.5764706, 0, 1,
-1.239525, -0.5836701, -0.3593306, 1, 0.5803922, 0, 1,
-1.237246, -0.7348972, -1.355323, 1, 0.5882353, 0, 1,
-1.230278, -1.756979, -1.887048, 1, 0.5921569, 0, 1,
-1.216773, 1.274851, 0.3453982, 1, 0.6, 0, 1,
-1.214261, -0.2182765, -2.239061, 1, 0.6078432, 0, 1,
-1.199872, -1.678769, -3.396703, 1, 0.6117647, 0, 1,
-1.189425, -2.872808, -2.511487, 1, 0.6196079, 0, 1,
-1.18814, -1.887909, -3.197468, 1, 0.6235294, 0, 1,
-1.186436, 0.7314916, -2.369107, 1, 0.6313726, 0, 1,
-1.183789, 0.5652788, -0.1396065, 1, 0.6352941, 0, 1,
-1.183192, 0.3314888, -0.9105998, 1, 0.6431373, 0, 1,
-1.18265, 1.059978, -0.694566, 1, 0.6470588, 0, 1,
-1.18209, 2.512411, -1.12065, 1, 0.654902, 0, 1,
-1.17759, -0.3777262, -1.720543, 1, 0.6588235, 0, 1,
-1.166451, -0.2679842, -3.363968, 1, 0.6666667, 0, 1,
-1.15908, -0.682287, -0.6406009, 1, 0.6705883, 0, 1,
-1.15404, -0.3198643, -2.33344, 1, 0.6784314, 0, 1,
-1.145247, 0.1111986, -2.682852, 1, 0.682353, 0, 1,
-1.14148, 1.81823, -0.2173109, 1, 0.6901961, 0, 1,
-1.139576, -1.564994, -0.6925557, 1, 0.6941177, 0, 1,
-1.139453, -0.4725889, -0.6722671, 1, 0.7019608, 0, 1,
-1.131361, -0.3939633, -2.265328, 1, 0.7098039, 0, 1,
-1.127392, -0.6558881, -2.47498, 1, 0.7137255, 0, 1,
-1.124956, 0.7707373, -0.7925838, 1, 0.7215686, 0, 1,
-1.124366, 0.2367083, -2.301725, 1, 0.7254902, 0, 1,
-1.123692, 0.7059761, -1.587743, 1, 0.7333333, 0, 1,
-1.121318, 0.001045084, -0.8105041, 1, 0.7372549, 0, 1,
-1.116531, 0.3627035, -0.07205468, 1, 0.7450981, 0, 1,
-1.107534, 0.4671711, -1.254746, 1, 0.7490196, 0, 1,
-1.103189, -0.6327002, -0.5747021, 1, 0.7568628, 0, 1,
-1.100778, 0.1799836, -1.699026, 1, 0.7607843, 0, 1,
-1.082555, -1.754918, -2.96013, 1, 0.7686275, 0, 1,
-1.080856, 2.15905, -1.362504, 1, 0.772549, 0, 1,
-1.073088, -0.4573165, -3.485259, 1, 0.7803922, 0, 1,
-1.073054, 0.4830156, 1.60743, 1, 0.7843137, 0, 1,
-1.070739, -0.1587161, -0.798529, 1, 0.7921569, 0, 1,
-1.069265, -1.161244, -2.774537, 1, 0.7960784, 0, 1,
-1.064602, -1.170012, -2.691398, 1, 0.8039216, 0, 1,
-1.063792, -0.3402298, -0.4897539, 1, 0.8117647, 0, 1,
-1.063697, -0.5243549, 0.01703383, 1, 0.8156863, 0, 1,
-1.062236, -0.12156, -2.594061, 1, 0.8235294, 0, 1,
-1.060375, 1.661592, -1.262279, 1, 0.827451, 0, 1,
-1.052407, -0.5220838, -3.329152, 1, 0.8352941, 0, 1,
-1.041611, -0.4005917, -1.214544, 1, 0.8392157, 0, 1,
-1.036796, -0.6136817, -2.069043, 1, 0.8470588, 0, 1,
-1.035104, 1.122692, 0.2873318, 1, 0.8509804, 0, 1,
-1.033706, 0.002707723, -0.9099073, 1, 0.8588235, 0, 1,
-1.030087, -0.8167723, -0.8138185, 1, 0.8627451, 0, 1,
-1.029869, 0.6977191, -0.8864906, 1, 0.8705882, 0, 1,
-1.028407, 1.441717, -2.150866, 1, 0.8745098, 0, 1,
-1.02824, 3.586616, 0.8193051, 1, 0.8823529, 0, 1,
-1.017537, -0.8809751, -1.821825, 1, 0.8862745, 0, 1,
-1.005571, 0.1140197, -2.033455, 1, 0.8941177, 0, 1,
-1.003091, 2.016825, -1.415282, 1, 0.8980392, 0, 1,
-0.9957839, -1.041622, -2.375738, 1, 0.9058824, 0, 1,
-0.9949629, -0.1782652, -1.067829, 1, 0.9137255, 0, 1,
-0.9923449, 1.052923, -1.920935, 1, 0.9176471, 0, 1,
-0.9881756, -0.6608705, -2.225806, 1, 0.9254902, 0, 1,
-0.9875954, -0.6167344, -1.433161, 1, 0.9294118, 0, 1,
-0.968804, -1.478315, -1.614313, 1, 0.9372549, 0, 1,
-0.967934, 1.074958, 0.1760577, 1, 0.9411765, 0, 1,
-0.9574997, -1.755904, -2.969874, 1, 0.9490196, 0, 1,
-0.9526325, -1.46459, -2.467022, 1, 0.9529412, 0, 1,
-0.9492237, 0.1800681, -1.572284, 1, 0.9607843, 0, 1,
-0.9409695, 0.314272, -3.499015, 1, 0.9647059, 0, 1,
-0.9406106, 0.3859912, -1.298678, 1, 0.972549, 0, 1,
-0.938199, 0.7130789, -2.013883, 1, 0.9764706, 0, 1,
-0.9372979, -0.3845927, -2.801392, 1, 0.9843137, 0, 1,
-0.9288622, -0.4873994, -4.940239, 1, 0.9882353, 0, 1,
-0.9242179, 0.3168127, -2.509714, 1, 0.9960784, 0, 1,
-0.917266, -1.131375, -1.88671, 0.9960784, 1, 0, 1,
-0.9097712, -0.9635332, -3.214234, 0.9921569, 1, 0, 1,
-0.9083144, -1.333969, -2.882147, 0.9843137, 1, 0, 1,
-0.9036911, -0.5151898, -3.264088, 0.9803922, 1, 0, 1,
-0.9003028, -0.7274421, -1.082501, 0.972549, 1, 0, 1,
-0.8999626, 1.010196, 0.2987203, 0.9686275, 1, 0, 1,
-0.898151, -1.677504, -2.489594, 0.9607843, 1, 0, 1,
-0.8954143, 0.3043415, -0.7840524, 0.9568627, 1, 0, 1,
-0.8901127, 2.853616, 1.272534, 0.9490196, 1, 0, 1,
-0.8865392, -1.077004, -3.141233, 0.945098, 1, 0, 1,
-0.8758719, 1.290204, -0.5963533, 0.9372549, 1, 0, 1,
-0.8746417, -1.371185, -2.881565, 0.9333333, 1, 0, 1,
-0.8690648, 0.3467902, -1.878419, 0.9254902, 1, 0, 1,
-0.8690317, -0.1036958, -1.017631, 0.9215686, 1, 0, 1,
-0.8662584, -2.101463, -3.416135, 0.9137255, 1, 0, 1,
-0.8657892, -1.562918, -2.614515, 0.9098039, 1, 0, 1,
-0.8644491, 2.290746, -1.227673, 0.9019608, 1, 0, 1,
-0.8596423, -1.5398, -3.290257, 0.8941177, 1, 0, 1,
-0.8572599, -0.8041119, -2.211004, 0.8901961, 1, 0, 1,
-0.854441, -0.5430163, -1.026289, 0.8823529, 1, 0, 1,
-0.8539056, 0.654055, -1.069656, 0.8784314, 1, 0, 1,
-0.8502128, 0.6707557, -2.927066, 0.8705882, 1, 0, 1,
-0.8466558, -0.7033732, -1.90999, 0.8666667, 1, 0, 1,
-0.8405471, -1.570073, -1.861272, 0.8588235, 1, 0, 1,
-0.8399695, -0.7762567, -0.4576223, 0.854902, 1, 0, 1,
-0.831794, -0.7616403, -1.441723, 0.8470588, 1, 0, 1,
-0.829376, 0.1132112, -1.306827, 0.8431373, 1, 0, 1,
-0.8284723, -0.6221941, -1.218215, 0.8352941, 1, 0, 1,
-0.824117, -1.769771, -2.41276, 0.8313726, 1, 0, 1,
-0.8195223, -0.5165812, -2.681671, 0.8235294, 1, 0, 1,
-0.8193821, -1.444089, -2.659964, 0.8196079, 1, 0, 1,
-0.8141784, 2.16297, -0.05087309, 0.8117647, 1, 0, 1,
-0.7988551, 0.2849137, -1.82853, 0.8078431, 1, 0, 1,
-0.7982392, 1.804079, -0.184301, 0.8, 1, 0, 1,
-0.7971969, 0.3274799, -1.341769, 0.7921569, 1, 0, 1,
-0.7900107, -0.667573, -3.433059, 0.7882353, 1, 0, 1,
-0.7853618, -0.564081, -2.732105, 0.7803922, 1, 0, 1,
-0.7853069, -0.1738057, -2.623685, 0.7764706, 1, 0, 1,
-0.784418, 0.1501209, -3.16273, 0.7686275, 1, 0, 1,
-0.7842871, -0.9093066, -3.657231, 0.7647059, 1, 0, 1,
-0.7781974, -1.270222, -3.038632, 0.7568628, 1, 0, 1,
-0.7766767, -0.6036254, -1.124922, 0.7529412, 1, 0, 1,
-0.7722471, -1.018621, -3.135492, 0.7450981, 1, 0, 1,
-0.7703876, -0.6579352, -2.230406, 0.7411765, 1, 0, 1,
-0.7703009, -0.05029936, -1.718539, 0.7333333, 1, 0, 1,
-0.7613679, -0.9311348, -2.181909, 0.7294118, 1, 0, 1,
-0.7529477, -1.582526, -3.427346, 0.7215686, 1, 0, 1,
-0.7454001, 0.1031476, -0.3492443, 0.7176471, 1, 0, 1,
-0.7452804, 0.09308806, -0.6105778, 0.7098039, 1, 0, 1,
-0.7432863, 0.5455183, -0.4645031, 0.7058824, 1, 0, 1,
-0.7388292, 2.47121, -0.5436076, 0.6980392, 1, 0, 1,
-0.7386868, 0.4598034, -1.368356, 0.6901961, 1, 0, 1,
-0.7363091, 0.5687122, -2.2355, 0.6862745, 1, 0, 1,
-0.7342736, 1.678716, -0.01536477, 0.6784314, 1, 0, 1,
-0.7241304, 1.902995, 0.2769883, 0.6745098, 1, 0, 1,
-0.7232137, -1.443399, 0.1299738, 0.6666667, 1, 0, 1,
-0.7220004, 1.118894, -2.093321, 0.6627451, 1, 0, 1,
-0.7211942, 0.08228205, -3.352314, 0.654902, 1, 0, 1,
-0.7164745, -0.4464201, -2.802384, 0.6509804, 1, 0, 1,
-0.7108935, -0.5773345, -2.974211, 0.6431373, 1, 0, 1,
-0.6968105, -0.2625232, -1.572572, 0.6392157, 1, 0, 1,
-0.6908734, -0.4721013, -3.394209, 0.6313726, 1, 0, 1,
-0.6904324, 0.1926138, -0.5312997, 0.627451, 1, 0, 1,
-0.6889145, -1.929232, -2.967206, 0.6196079, 1, 0, 1,
-0.6860564, 0.1441771, -1.967788, 0.6156863, 1, 0, 1,
-0.6841433, 2.151716, 0.2766452, 0.6078432, 1, 0, 1,
-0.6841389, -1.432587, -1.597821, 0.6039216, 1, 0, 1,
-0.680067, -0.3787155, -0.4578855, 0.5960785, 1, 0, 1,
-0.6770319, 0.8860596, 1.189605, 0.5882353, 1, 0, 1,
-0.6706645, 0.5320516, -1.874866, 0.5843138, 1, 0, 1,
-0.664887, 0.7181161, -0.01385359, 0.5764706, 1, 0, 1,
-0.6595212, 0.3055692, -0.3368021, 0.572549, 1, 0, 1,
-0.6543251, 0.02095836, -1.144007, 0.5647059, 1, 0, 1,
-0.6522076, 0.0478696, -1.745339, 0.5607843, 1, 0, 1,
-0.6518888, -0.5066983, -3.363346, 0.5529412, 1, 0, 1,
-0.648394, 1.358588, -1.574026, 0.5490196, 1, 0, 1,
-0.6427892, -0.4795585, -1.308808, 0.5411765, 1, 0, 1,
-0.6376047, 0.07961531, -0.679798, 0.5372549, 1, 0, 1,
-0.6361952, -0.4938102, -1.579093, 0.5294118, 1, 0, 1,
-0.6348238, -0.7861091, -3.972673, 0.5254902, 1, 0, 1,
-0.6313085, 0.7536324, 0.08344129, 0.5176471, 1, 0, 1,
-0.6242974, -1.42937, -4.946493, 0.5137255, 1, 0, 1,
-0.622062, 0.4270667, -2.33973, 0.5058824, 1, 0, 1,
-0.6175334, 1.548642, -1.196511, 0.5019608, 1, 0, 1,
-0.6168127, -0.03587614, -1.673188, 0.4941176, 1, 0, 1,
-0.6155512, 0.8414364, -0.1850735, 0.4862745, 1, 0, 1,
-0.6111705, -2.377831, -1.628255, 0.4823529, 1, 0, 1,
-0.6046613, -0.1405094, -1.617056, 0.4745098, 1, 0, 1,
-0.6038203, -1.584157, -0.6347854, 0.4705882, 1, 0, 1,
-0.6031229, -0.4136854, -1.627621, 0.4627451, 1, 0, 1,
-0.6002166, -0.1424621, -1.497205, 0.4588235, 1, 0, 1,
-0.594969, 0.5353463, -0.3584657, 0.4509804, 1, 0, 1,
-0.5947474, 1.19714, -0.9552495, 0.4470588, 1, 0, 1,
-0.5915592, -0.2127459, -1.284616, 0.4392157, 1, 0, 1,
-0.5908665, 1.157731, -1.586084, 0.4352941, 1, 0, 1,
-0.5904357, 0.1112594, -1.142962, 0.427451, 1, 0, 1,
-0.5903457, 0.8957395, 0.5856121, 0.4235294, 1, 0, 1,
-0.5857782, -0.4828898, -1.879564, 0.4156863, 1, 0, 1,
-0.5852321, 0.5921339, 1.519856, 0.4117647, 1, 0, 1,
-0.5842994, -1.570752, -2.250156, 0.4039216, 1, 0, 1,
-0.5832877, -0.38179, -2.715719, 0.3960784, 1, 0, 1,
-0.5828617, 0.6981248, -0.6561108, 0.3921569, 1, 0, 1,
-0.582644, -1.325451, -2.703999, 0.3843137, 1, 0, 1,
-0.5809518, 0.1476067, -1.365509, 0.3803922, 1, 0, 1,
-0.5806652, -0.4691091, -2.662422, 0.372549, 1, 0, 1,
-0.576119, -0.4091285, -2.102968, 0.3686275, 1, 0, 1,
-0.5732231, 1.37661, -0.4048223, 0.3607843, 1, 0, 1,
-0.5606749, 1.083239, -0.2489979, 0.3568628, 1, 0, 1,
-0.5600203, 1.220827, -0.4050922, 0.3490196, 1, 0, 1,
-0.5581921, 0.2767746, -0.5415481, 0.345098, 1, 0, 1,
-0.555544, -0.4489549, -2.835962, 0.3372549, 1, 0, 1,
-0.5545776, -0.8643665, -1.596364, 0.3333333, 1, 0, 1,
-0.5540795, -0.9107145, -2.528327, 0.3254902, 1, 0, 1,
-0.5519789, -0.3677357, -1.077796, 0.3215686, 1, 0, 1,
-0.5475384, -0.8284878, -3.455825, 0.3137255, 1, 0, 1,
-0.545958, 0.6605937, -0.2446325, 0.3098039, 1, 0, 1,
-0.5446702, -0.182739, -2.650582, 0.3019608, 1, 0, 1,
-0.5441326, 0.3530979, -1.111236, 0.2941177, 1, 0, 1,
-0.537554, 0.7463986, -0.9642045, 0.2901961, 1, 0, 1,
-0.5349771, -0.213561, -0.4976297, 0.282353, 1, 0, 1,
-0.5332189, 1.791855, -0.8616819, 0.2784314, 1, 0, 1,
-0.5286629, 0.9020556, 0.5877765, 0.2705882, 1, 0, 1,
-0.5285975, 0.09265818, -0.4994665, 0.2666667, 1, 0, 1,
-0.5281915, 0.7814049, 0.08449274, 0.2588235, 1, 0, 1,
-0.5221546, -0.533435, -4.353267, 0.254902, 1, 0, 1,
-0.5210139, -0.3155619, -2.803977, 0.2470588, 1, 0, 1,
-0.5118863, 1.118646, 0.6159228, 0.2431373, 1, 0, 1,
-0.5093867, 0.4641324, -0.8712189, 0.2352941, 1, 0, 1,
-0.5081697, -1.399415, -3.05708, 0.2313726, 1, 0, 1,
-0.5062238, 1.091151, -0.9265449, 0.2235294, 1, 0, 1,
-0.5028444, -1.996483, -2.550106, 0.2196078, 1, 0, 1,
-0.5000249, -0.6156464, -3.837364, 0.2117647, 1, 0, 1,
-0.4957455, 0.6344693, -0.956526, 0.2078431, 1, 0, 1,
-0.4948804, 0.6995721, -0.9225681, 0.2, 1, 0, 1,
-0.4931011, -2.645513, -2.535312, 0.1921569, 1, 0, 1,
-0.4921572, 0.3943837, -1.326994, 0.1882353, 1, 0, 1,
-0.4844045, -0.1200193, -2.158531, 0.1803922, 1, 0, 1,
-0.4843552, -1.667076, -4.200317, 0.1764706, 1, 0, 1,
-0.4842618, 1.614847, -0.5186542, 0.1686275, 1, 0, 1,
-0.4815113, 0.6683776, -3.08569, 0.1647059, 1, 0, 1,
-0.4814577, -1.559543, -3.253901, 0.1568628, 1, 0, 1,
-0.477871, -0.750446, -5.583644, 0.1529412, 1, 0, 1,
-0.4763118, 1.017307, -1.975167, 0.145098, 1, 0, 1,
-0.4755906, 2.124451, 1.215064, 0.1411765, 1, 0, 1,
-0.4701884, 0.4846745, 0.4555151, 0.1333333, 1, 0, 1,
-0.4693098, 0.01834238, -0.6588196, 0.1294118, 1, 0, 1,
-0.4689665, -0.3646664, -1.142381, 0.1215686, 1, 0, 1,
-0.4646589, -0.4912712, -2.209315, 0.1176471, 1, 0, 1,
-0.4642457, 1.232868, -2.836641, 0.1098039, 1, 0, 1,
-0.4598814, 0.5267935, -2.242658, 0.1058824, 1, 0, 1,
-0.4570293, 0.7480328, -0.02965599, 0.09803922, 1, 0, 1,
-0.4528261, -1.131606, -2.949633, 0.09019608, 1, 0, 1,
-0.4490752, -0.583303, -3.123746, 0.08627451, 1, 0, 1,
-0.447368, 1.047682, -0.0184847, 0.07843138, 1, 0, 1,
-0.439086, -0.2363015, -1.157738, 0.07450981, 1, 0, 1,
-0.4372066, 1.345462, -0.4461557, 0.06666667, 1, 0, 1,
-0.434748, -0.05091471, -1.208587, 0.0627451, 1, 0, 1,
-0.4345307, -1.303355, -3.93874, 0.05490196, 1, 0, 1,
-0.4301015, 0.06347932, -2.057692, 0.05098039, 1, 0, 1,
-0.4288406, -0.714152, -1.095345, 0.04313726, 1, 0, 1,
-0.4242253, 3.68136, -0.4640584, 0.03921569, 1, 0, 1,
-0.4205094, -0.1252669, -1.246194, 0.03137255, 1, 0, 1,
-0.4153764, 0.6436852, -0.6248819, 0.02745098, 1, 0, 1,
-0.4089547, 0.8910266, -0.1466631, 0.01960784, 1, 0, 1,
-0.4086622, -0.2993824, -2.166607, 0.01568628, 1, 0, 1,
-0.4056848, -1.620065, -2.093222, 0.007843138, 1, 0, 1,
-0.4040581, -0.9739984, -2.694962, 0.003921569, 1, 0, 1,
-0.4034316, -0.9051224, -3.548878, 0, 1, 0.003921569, 1,
-0.4022789, 1.076411, -0.6806555, 0, 1, 0.01176471, 1,
-0.3957024, 0.551084, 0.8134637, 0, 1, 0.01568628, 1,
-0.3948269, -0.7916054, -2.037309, 0, 1, 0.02352941, 1,
-0.3939551, -1.324558, -1.231982, 0, 1, 0.02745098, 1,
-0.3900404, 0.1691921, -1.361872, 0, 1, 0.03529412, 1,
-0.389883, -0.9354045, -3.277462, 0, 1, 0.03921569, 1,
-0.3875013, 0.3295646, -0.8515195, 0, 1, 0.04705882, 1,
-0.3861758, -3.28837, -2.353391, 0, 1, 0.05098039, 1,
-0.3855199, -0.7090068, -3.214951, 0, 1, 0.05882353, 1,
-0.3834741, 1.43275, -1.364607, 0, 1, 0.0627451, 1,
-0.3801952, 1.110757, 1.003133, 0, 1, 0.07058824, 1,
-0.3762394, 0.9097927, -1.012234, 0, 1, 0.07450981, 1,
-0.3756726, 0.8524666, 0.2092302, 0, 1, 0.08235294, 1,
-0.3751509, 0.8396496, -0.21161, 0, 1, 0.08627451, 1,
-0.3749473, -0.4787083, -3.58987, 0, 1, 0.09411765, 1,
-0.3730653, 0.6892112, -0.6176684, 0, 1, 0.1019608, 1,
-0.3590781, 0.8251804, 0.6799583, 0, 1, 0.1058824, 1,
-0.3569345, -0.3323016, -2.816611, 0, 1, 0.1137255, 1,
-0.3542275, 1.374417, -0.2152716, 0, 1, 0.1176471, 1,
-0.3538307, -0.03513411, -3.017209, 0, 1, 0.1254902, 1,
-0.3537187, -0.7305167, -2.430959, 0, 1, 0.1294118, 1,
-0.3511447, 1.222534, -0.748475, 0, 1, 0.1372549, 1,
-0.3508798, 1.808198, 0.0003197131, 0, 1, 0.1411765, 1,
-0.3501494, 0.7668905, -0.3201939, 0, 1, 0.1490196, 1,
-0.3485725, -0.9055572, -2.702077, 0, 1, 0.1529412, 1,
-0.3457199, 0.5702099, -0.299803, 0, 1, 0.1607843, 1,
-0.3415446, -1.656131, -2.628031, 0, 1, 0.1647059, 1,
-0.3401676, 0.2517442, -0.4952902, 0, 1, 0.172549, 1,
-0.3393476, -1.808336, -2.164039, 0, 1, 0.1764706, 1,
-0.3357927, 0.02870885, -2.723454, 0, 1, 0.1843137, 1,
-0.3353696, -0.9321375, -2.09131, 0, 1, 0.1882353, 1,
-0.335319, -0.3516404, -1.846126, 0, 1, 0.1960784, 1,
-0.3332403, -0.809007, -3.550503, 0, 1, 0.2039216, 1,
-0.3329849, -1.377613, -2.123742, 0, 1, 0.2078431, 1,
-0.332846, 1.92184, -0.6957383, 0, 1, 0.2156863, 1,
-0.3285671, -1.42537, -1.62902, 0, 1, 0.2196078, 1,
-0.3271742, -0.5099408, -2.881157, 0, 1, 0.227451, 1,
-0.3240757, 0.5266588, 0.387996, 0, 1, 0.2313726, 1,
-0.3224129, 0.2429384, -1.743275, 0, 1, 0.2392157, 1,
-0.3199021, -1.385397, -2.315606, 0, 1, 0.2431373, 1,
-0.3196335, 1.193305, -0.5698442, 0, 1, 0.2509804, 1,
-0.3193716, 1.843942, -0.7178328, 0, 1, 0.254902, 1,
-0.3148384, -0.6246892, -0.4779581, 0, 1, 0.2627451, 1,
-0.3129469, 0.2422098, 0.05146806, 0, 1, 0.2666667, 1,
-0.3082237, -0.2824916, -3.129647, 0, 1, 0.2745098, 1,
-0.3080654, 0.5866477, -1.389697, 0, 1, 0.2784314, 1,
-0.3055107, -0.4784827, -4.267652, 0, 1, 0.2862745, 1,
-0.3032817, 0.006477704, -0.5299842, 0, 1, 0.2901961, 1,
-0.3026257, 1.579297, -0.8607721, 0, 1, 0.2980392, 1,
-0.3016247, 0.5244403, -0.3781945, 0, 1, 0.3058824, 1,
-0.2998139, -0.2094323, -2.612695, 0, 1, 0.3098039, 1,
-0.2987488, 0.2820747, -0.4375337, 0, 1, 0.3176471, 1,
-0.2971419, -0.3444673, -1.715011, 0, 1, 0.3215686, 1,
-0.2969781, -1.158572, -4.367623, 0, 1, 0.3294118, 1,
-0.2937039, -0.7216882, -2.910797, 0, 1, 0.3333333, 1,
-0.2895068, 0.2982283, -0.810625, 0, 1, 0.3411765, 1,
-0.2887176, -0.1593191, -1.746841, 0, 1, 0.345098, 1,
-0.2883864, 1.851407, 0.6025131, 0, 1, 0.3529412, 1,
-0.2883213, 1.807057, 0.522779, 0, 1, 0.3568628, 1,
-0.2879921, -1.679456, -4.340125, 0, 1, 0.3647059, 1,
-0.2869439, 0.2456592, -0.5888212, 0, 1, 0.3686275, 1,
-0.285183, 0.6405236, -1.35826, 0, 1, 0.3764706, 1,
-0.2824163, 0.09269501, -1.203633, 0, 1, 0.3803922, 1,
-0.2814941, -1.105208, -2.991554, 0, 1, 0.3882353, 1,
-0.2798809, -0.4578018, -1.164835, 0, 1, 0.3921569, 1,
-0.2779249, 1.406921, 1.161396, 0, 1, 0.4, 1,
-0.2768395, 0.05548294, -1.388095, 0, 1, 0.4078431, 1,
-0.2760719, 0.366861, 0.6248106, 0, 1, 0.4117647, 1,
-0.2662043, 0.8083152, 0.3043501, 0, 1, 0.4196078, 1,
-0.2632088, 1.43558, -1.429297, 0, 1, 0.4235294, 1,
-0.2570249, -2.474825, -3.575283, 0, 1, 0.4313726, 1,
-0.2567296, -1.381169, -2.110392, 0, 1, 0.4352941, 1,
-0.2495731, -1.388254, -2.333833, 0, 1, 0.4431373, 1,
-0.2489956, 0.2713027, 0.06821637, 0, 1, 0.4470588, 1,
-0.2475866, -0.1739068, -0.7486762, 0, 1, 0.454902, 1,
-0.2470492, -1.693203, -4.143727, 0, 1, 0.4588235, 1,
-0.2464214, 0.4827456, -1.854258, 0, 1, 0.4666667, 1,
-0.2446785, -0.7527008, -4.746318, 0, 1, 0.4705882, 1,
-0.2435235, 0.9963995, 0.9341981, 0, 1, 0.4784314, 1,
-0.2401509, -2.194575, -2.482792, 0, 1, 0.4823529, 1,
-0.2331711, 0.7670463, 0.7205094, 0, 1, 0.4901961, 1,
-0.2290589, -0.05684326, -2.604559, 0, 1, 0.4941176, 1,
-0.2285436, -1.930083, -2.744139, 0, 1, 0.5019608, 1,
-0.2276626, 0.5026841, -1.936157, 0, 1, 0.509804, 1,
-0.2267151, -1.159544, -1.257499, 0, 1, 0.5137255, 1,
-0.2264856, 0.5544561, -0.803462, 0, 1, 0.5215687, 1,
-0.2253473, 0.0372646, -3.438294, 0, 1, 0.5254902, 1,
-0.2231266, 1.745496, 1.082223, 0, 1, 0.5333334, 1,
-0.2216558, -1.392557, -3.341007, 0, 1, 0.5372549, 1,
-0.219164, -1.14349, -3.148663, 0, 1, 0.5450981, 1,
-0.2171505, -0.6598225, -2.27427, 0, 1, 0.5490196, 1,
-0.2163436, 0.2915756, -1.374101, 0, 1, 0.5568628, 1,
-0.2161319, 0.07444938, -0.875219, 0, 1, 0.5607843, 1,
-0.2136694, -0.1952635, -0.5006896, 0, 1, 0.5686275, 1,
-0.2081917, -0.09178717, -1.368678, 0, 1, 0.572549, 1,
-0.2003261, -1.183891, -2.255169, 0, 1, 0.5803922, 1,
-0.199641, -0.8346586, -1.404319, 0, 1, 0.5843138, 1,
-0.198943, -0.366199, -1.063448, 0, 1, 0.5921569, 1,
-0.1898609, -0.04297629, -1.185933, 0, 1, 0.5960785, 1,
-0.1869334, 0.731304, 1.311628, 0, 1, 0.6039216, 1,
-0.1865005, -1.189157, -3.22087, 0, 1, 0.6117647, 1,
-0.1812031, -0.3357259, -3.645083, 0, 1, 0.6156863, 1,
-0.1799633, 3.219749, -0.5841763, 0, 1, 0.6235294, 1,
-0.1750289, -0.6600465, -3.267619, 0, 1, 0.627451, 1,
-0.1734475, -1.113974, -3.66262, 0, 1, 0.6352941, 1,
-0.1720146, 0.6815304, -0.2742581, 0, 1, 0.6392157, 1,
-0.1594045, 0.4422968, -0.4876801, 0, 1, 0.6470588, 1,
-0.1571476, -0.7524163, -1.514504, 0, 1, 0.6509804, 1,
-0.1537975, -1.215542, -3.192485, 0, 1, 0.6588235, 1,
-0.1484903, 0.795584, 0.5902154, 0, 1, 0.6627451, 1,
-0.1426185, -2.022285, -4.062332, 0, 1, 0.6705883, 1,
-0.141905, -2.912514, -3.097677, 0, 1, 0.6745098, 1,
-0.1341841, -0.7306306, -4.777219, 0, 1, 0.682353, 1,
-0.1338526, 0.1092767, -0.5237395, 0, 1, 0.6862745, 1,
-0.1317105, 0.4901288, 1.015661, 0, 1, 0.6941177, 1,
-0.1304514, -0.7862335, -3.321797, 0, 1, 0.7019608, 1,
-0.1260029, 1.066116, -0.1129432, 0, 1, 0.7058824, 1,
-0.1259376, -0.472501, -2.409691, 0, 1, 0.7137255, 1,
-0.1225493, 1.050629, 0.9901104, 0, 1, 0.7176471, 1,
-0.1214119, -1.809143, -1.393255, 0, 1, 0.7254902, 1,
-0.1195086, 0.08479371, -0.1671844, 0, 1, 0.7294118, 1,
-0.1162234, -1.008877, -3.650917, 0, 1, 0.7372549, 1,
-0.1142537, 0.1833107, -1.497249, 0, 1, 0.7411765, 1,
-0.1139465, 1.785376, 0.02146246, 0, 1, 0.7490196, 1,
-0.1103445, 0.3131237, 0.4750152, 0, 1, 0.7529412, 1,
-0.1064942, -0.1680831, -3.661585, 0, 1, 0.7607843, 1,
-0.1014246, -0.1346685, -3.178389, 0, 1, 0.7647059, 1,
-0.09996872, -0.2618486, -3.560566, 0, 1, 0.772549, 1,
-0.09707277, -0.1074421, -1.627004, 0, 1, 0.7764706, 1,
-0.09559109, 0.03167916, -1.381396, 0, 1, 0.7843137, 1,
-0.09433372, -0.1011733, -2.553475, 0, 1, 0.7882353, 1,
-0.0877788, -1.475557, -1.339754, 0, 1, 0.7960784, 1,
-0.0844611, 0.6951391, -0.9262307, 0, 1, 0.8039216, 1,
-0.08444134, 0.9488742, -1.986264, 0, 1, 0.8078431, 1,
-0.07952917, 0.9972101, -1.394019, 0, 1, 0.8156863, 1,
-0.07739685, -0.8506581, -3.799951, 0, 1, 0.8196079, 1,
-0.07448885, -0.7364914, -4.498312, 0, 1, 0.827451, 1,
-0.07412609, -0.4126163, -4.684481, 0, 1, 0.8313726, 1,
-0.07403421, 0.5524983, -0.03746185, 0, 1, 0.8392157, 1,
-0.07306173, 0.6042808, -0.940563, 0, 1, 0.8431373, 1,
-0.07055669, 2.558244, -0.301484, 0, 1, 0.8509804, 1,
-0.06946478, 1.826857, -0.1684163, 0, 1, 0.854902, 1,
-0.06917324, -0.1310789, -2.228778, 0, 1, 0.8627451, 1,
-0.06591649, -0.8617238, -3.624536, 0, 1, 0.8666667, 1,
-0.06212529, -1.811281, -4.779219, 0, 1, 0.8745098, 1,
-0.05960243, 0.8934052, 0.2076239, 0, 1, 0.8784314, 1,
-0.05941429, -1.03204, -3.413942, 0, 1, 0.8862745, 1,
-0.05641713, 1.024786, 0.81717, 0, 1, 0.8901961, 1,
-0.05249291, 0.3443555, 1.097571, 0, 1, 0.8980392, 1,
-0.05122054, -1.375667, -4.686507, 0, 1, 0.9058824, 1,
-0.05115883, -1.041093, -3.137667, 0, 1, 0.9098039, 1,
-0.04805004, 1.864877, 0.06939442, 0, 1, 0.9176471, 1,
-0.03875856, 0.9472266, -0.2115109, 0, 1, 0.9215686, 1,
-0.03776584, -0.877072, -3.381397, 0, 1, 0.9294118, 1,
-0.03628527, 1.970242, -0.7955229, 0, 1, 0.9333333, 1,
-0.03625343, -0.4304094, -2.315072, 0, 1, 0.9411765, 1,
-0.0356582, 0.7878131, -0.3132833, 0, 1, 0.945098, 1,
-0.02932827, 0.87265, -0.8514643, 0, 1, 0.9529412, 1,
-0.02546515, -2.040082, -3.353883, 0, 1, 0.9568627, 1,
-0.02388937, -0.3917243, -4.108045, 0, 1, 0.9647059, 1,
-0.02097348, -0.5838512, -4.546999, 0, 1, 0.9686275, 1,
-0.02015879, -1.502504, -3.31474, 0, 1, 0.9764706, 1,
-0.01993799, 0.1747858, 1.118021, 0, 1, 0.9803922, 1,
-0.01940573, 0.02399253, -0.2699887, 0, 1, 0.9882353, 1,
-0.01763253, 1.592672, 1.282121, 0, 1, 0.9921569, 1,
-0.01733258, -0.4540477, -3.082627, 0, 1, 1, 1,
-0.01546943, -0.42491, -4.705121, 0, 0.9921569, 1, 1,
-0.01529362, -1.545619, -2.989305, 0, 0.9882353, 1, 1,
-0.01461723, -0.4958988, -2.374973, 0, 0.9803922, 1, 1,
-0.01445064, -1.240169, -2.734998, 0, 0.9764706, 1, 1,
-0.009292044, 0.4821433, -0.06388476, 0, 0.9686275, 1, 1,
-0.008759645, 0.9407052, 2.454534, 0, 0.9647059, 1, 1,
-0.005521891, -0.8399864, -3.772577, 0, 0.9568627, 1, 1,
0.0009256604, 0.1088289, -0.4556333, 0, 0.9529412, 1, 1,
0.001797697, 0.4271278, -0.8151061, 0, 0.945098, 1, 1,
0.002748916, 0.8087982, -1.160818, 0, 0.9411765, 1, 1,
0.005898056, -0.7534553, 2.314541, 0, 0.9333333, 1, 1,
0.009322654, 0.3278924, -0.6488567, 0, 0.9294118, 1, 1,
0.00957649, 0.8037819, 1.000489, 0, 0.9215686, 1, 1,
0.01043619, 0.4536033, 0.1322636, 0, 0.9176471, 1, 1,
0.01370614, -0.8411744, 4.819504, 0, 0.9098039, 1, 1,
0.02451486, -0.3449023, 0.7302076, 0, 0.9058824, 1, 1,
0.02489162, 0.0938958, 0.4024136, 0, 0.8980392, 1, 1,
0.02641868, -0.6346114, 3.586874, 0, 0.8901961, 1, 1,
0.02789903, 0.02373288, -0.1085088, 0, 0.8862745, 1, 1,
0.02965364, -0.1910693, 3.951575, 0, 0.8784314, 1, 1,
0.0297798, 0.7693416, -1.827226, 0, 0.8745098, 1, 1,
0.03045638, 1.579118, 0.8081824, 0, 0.8666667, 1, 1,
0.03231837, 1.400481, 0.7310144, 0, 0.8627451, 1, 1,
0.03413307, 0.1956491, -0.2882125, 0, 0.854902, 1, 1,
0.04003402, 0.5187725, -0.3478392, 0, 0.8509804, 1, 1,
0.04277682, 0.3302524, -0.3359784, 0, 0.8431373, 1, 1,
0.04368647, 0.1959014, 0.5993819, 0, 0.8392157, 1, 1,
0.04512096, 0.01355406, 1.380921, 0, 0.8313726, 1, 1,
0.04723682, -1.070542, 2.503443, 0, 0.827451, 1, 1,
0.04734472, -1.1843, 2.563834, 0, 0.8196079, 1, 1,
0.04823415, -0.007509304, 0.788258, 0, 0.8156863, 1, 1,
0.0517506, -1.060085, 2.842279, 0, 0.8078431, 1, 1,
0.0522803, 0.7258191, 1.340585, 0, 0.8039216, 1, 1,
0.05564526, 0.2391075, -1.284722, 0, 0.7960784, 1, 1,
0.05892754, 1.062695, 0.9966185, 0, 0.7882353, 1, 1,
0.06115246, 0.3051302, 0.8237579, 0, 0.7843137, 1, 1,
0.06289569, -0.1220821, 3.099512, 0, 0.7764706, 1, 1,
0.06316523, 0.2615749, 1.492828, 0, 0.772549, 1, 1,
0.07363761, -2.653849, 3.216206, 0, 0.7647059, 1, 1,
0.08229503, 0.06052784, 1.44889, 0, 0.7607843, 1, 1,
0.08429208, -0.185152, 2.462736, 0, 0.7529412, 1, 1,
0.08515386, 0.3907165, 0.4244095, 0, 0.7490196, 1, 1,
0.09678846, -0.3532548, 4.129478, 0, 0.7411765, 1, 1,
0.09806488, -2.20958, 3.800009, 0, 0.7372549, 1, 1,
0.1002102, -0.6001521, 3.100574, 0, 0.7294118, 1, 1,
0.1017656, 0.627426, 1.294238, 0, 0.7254902, 1, 1,
0.1032946, -0.1025485, 3.352727, 0, 0.7176471, 1, 1,
0.1058525, -1.112552, 3.575312, 0, 0.7137255, 1, 1,
0.1156823, -1.110893, 3.429479, 0, 0.7058824, 1, 1,
0.1167064, -0.6688039, 3.639409, 0, 0.6980392, 1, 1,
0.1202879, -0.07172325, 2.196521, 0, 0.6941177, 1, 1,
0.1218654, 0.8206764, -1.444273, 0, 0.6862745, 1, 1,
0.1229112, 0.4992161, -0.3042969, 0, 0.682353, 1, 1,
0.1231655, 0.9799003, 0.2427596, 0, 0.6745098, 1, 1,
0.1258464, 0.176805, 1.367664, 0, 0.6705883, 1, 1,
0.1281958, 1.122523, -0.4099965, 0, 0.6627451, 1, 1,
0.1283195, -0.3094236, 2.516118, 0, 0.6588235, 1, 1,
0.1309064, 0.05931444, 0.9101268, 0, 0.6509804, 1, 1,
0.1323964, 1.080534, 0.9098712, 0, 0.6470588, 1, 1,
0.1347586, -0.7900481, 2.375305, 0, 0.6392157, 1, 1,
0.1354989, -0.1741129, 2.516866, 0, 0.6352941, 1, 1,
0.1362447, 0.256079, -0.2473555, 0, 0.627451, 1, 1,
0.1379493, -0.7977846, 1.732408, 0, 0.6235294, 1, 1,
0.1382008, -0.08083747, 1.167961, 0, 0.6156863, 1, 1,
0.1457367, 1.437699, 0.3238463, 0, 0.6117647, 1, 1,
0.1485639, 1.250444, 0.1829924, 0, 0.6039216, 1, 1,
0.1502347, 0.1635766, 0.6368152, 0, 0.5960785, 1, 1,
0.1517925, 0.8396358, -0.232054, 0, 0.5921569, 1, 1,
0.1557658, 0.1333705, 0.7924006, 0, 0.5843138, 1, 1,
0.160995, 0.4194452, 1.896415, 0, 0.5803922, 1, 1,
0.1610103, 0.2281727, 1.103094, 0, 0.572549, 1, 1,
0.1646543, 1.000452, -3.477948, 0, 0.5686275, 1, 1,
0.1742017, -0.594466, 2.370721, 0, 0.5607843, 1, 1,
0.1790644, -0.5412286, 2.92933, 0, 0.5568628, 1, 1,
0.1797101, 0.8940186, 0.09841264, 0, 0.5490196, 1, 1,
0.1832601, 0.1650319, -0.7831327, 0, 0.5450981, 1, 1,
0.1848693, -1.296992, 2.288393, 0, 0.5372549, 1, 1,
0.1887672, 0.2120014, 0.6235279, 0, 0.5333334, 1, 1,
0.1924018, -1.244465, 2.951589, 0, 0.5254902, 1, 1,
0.1943699, 1.719494, 1.696589, 0, 0.5215687, 1, 1,
0.1978051, 1.298173, 0.2865888, 0, 0.5137255, 1, 1,
0.1981537, -1.351502, 3.675148, 0, 0.509804, 1, 1,
0.2007893, -0.2512222, 2.396054, 0, 0.5019608, 1, 1,
0.2066255, -0.3852117, 2.384442, 0, 0.4941176, 1, 1,
0.2077173, -1.984632, 1.144337, 0, 0.4901961, 1, 1,
0.2123917, -0.8473348, 3.438435, 0, 0.4823529, 1, 1,
0.2152318, -1.212078, 3.878827, 0, 0.4784314, 1, 1,
0.2155674, 1.159311, 1.349594, 0, 0.4705882, 1, 1,
0.2170338, 1.19871, -0.009056549, 0, 0.4666667, 1, 1,
0.2257339, 1.128672, -0.8555709, 0, 0.4588235, 1, 1,
0.2266181, -0.3659417, 3.546001, 0, 0.454902, 1, 1,
0.2289406, 1.468475, 0.480931, 0, 0.4470588, 1, 1,
0.2293124, -0.04954535, -0.4300496, 0, 0.4431373, 1, 1,
0.2294326, -1.999899, 3.403345, 0, 0.4352941, 1, 1,
0.2368583, -1.670825, 2.620708, 0, 0.4313726, 1, 1,
0.241892, -0.2844324, 3.665892, 0, 0.4235294, 1, 1,
0.2420431, -0.3443615, 1.459583, 0, 0.4196078, 1, 1,
0.247875, 0.4491982, 0.8573713, 0, 0.4117647, 1, 1,
0.2506799, -0.1010499, 2.540688, 0, 0.4078431, 1, 1,
0.251822, 0.1815514, 2.084996, 0, 0.4, 1, 1,
0.2522531, -0.5071843, 2.85662, 0, 0.3921569, 1, 1,
0.2522927, -0.1366965, 1.703396, 0, 0.3882353, 1, 1,
0.2541378, -0.9962965, 1.917481, 0, 0.3803922, 1, 1,
0.2547715, -1.19562, 3.217555, 0, 0.3764706, 1, 1,
0.2555974, 0.8146747, 0.2004665, 0, 0.3686275, 1, 1,
0.2579244, 1.520455, -0.3558509, 0, 0.3647059, 1, 1,
0.2649663, -0.2419753, 3.147146, 0, 0.3568628, 1, 1,
0.2716698, 1.020312, -0.4062918, 0, 0.3529412, 1, 1,
0.2804754, 0.4966352, -0.7718669, 0, 0.345098, 1, 1,
0.2845146, 0.6712353, 0.3641843, 0, 0.3411765, 1, 1,
0.2850531, -1.550303, 3.180225, 0, 0.3333333, 1, 1,
0.2883653, 0.01387284, 2.284729, 0, 0.3294118, 1, 1,
0.2895148, 0.3914161, 2.030452, 0, 0.3215686, 1, 1,
0.2949353, -0.01541846, 1.285439, 0, 0.3176471, 1, 1,
0.2954806, -0.8827081, 0.8945801, 0, 0.3098039, 1, 1,
0.3045983, 0.1591866, -0.4948369, 0, 0.3058824, 1, 1,
0.3047046, 1.007125, -0.3308256, 0, 0.2980392, 1, 1,
0.308097, 1.421207, -0.122956, 0, 0.2901961, 1, 1,
0.3082744, -0.3715983, 1.811973, 0, 0.2862745, 1, 1,
0.3103811, 0.2498701, 0.08879014, 0, 0.2784314, 1, 1,
0.3106441, 2.456132, 0.4982501, 0, 0.2745098, 1, 1,
0.3111327, -2.032289, 3.462539, 0, 0.2666667, 1, 1,
0.3119113, -0.8378486, 3.757476, 0, 0.2627451, 1, 1,
0.317108, -1.13005, 3.459226, 0, 0.254902, 1, 1,
0.3208188, 0.7429674, 0.3832973, 0, 0.2509804, 1, 1,
0.3219994, -1.351767, 3.280762, 0, 0.2431373, 1, 1,
0.3267527, 0.9302761, 1.929358, 0, 0.2392157, 1, 1,
0.3309382, -0.3256801, 3.057033, 0, 0.2313726, 1, 1,
0.3350523, 0.8280507, 0.9056078, 0, 0.227451, 1, 1,
0.3390557, 0.9047049, 1.301166, 0, 0.2196078, 1, 1,
0.3401239, 0.6173785, 0.9881821, 0, 0.2156863, 1, 1,
0.3448863, -0.5849344, 1.914475, 0, 0.2078431, 1, 1,
0.3497079, 1.717377, -2.728291, 0, 0.2039216, 1, 1,
0.3519424, -0.1508536, 1.050642, 0, 0.1960784, 1, 1,
0.3523067, 0.9969847, -2.441907, 0, 0.1882353, 1, 1,
0.3533746, -0.2804545, 4.050175, 0, 0.1843137, 1, 1,
0.3571562, 0.2129905, 0.3250527, 0, 0.1764706, 1, 1,
0.3574099, 0.1185602, 2.828847, 0, 0.172549, 1, 1,
0.3583663, 0.4296249, 0.5733256, 0, 0.1647059, 1, 1,
0.3606042, 0.8190488, 0.700584, 0, 0.1607843, 1, 1,
0.3632034, 1.589353, 2.410903, 0, 0.1529412, 1, 1,
0.3640366, 0.8416447, 0.3892452, 0, 0.1490196, 1, 1,
0.3642444, -1.962247, 2.743408, 0, 0.1411765, 1, 1,
0.3659445, -1.400427, 2.377589, 0, 0.1372549, 1, 1,
0.366041, -0.3406146, 2.188991, 0, 0.1294118, 1, 1,
0.3664949, 0.0608756, 2.505248, 0, 0.1254902, 1, 1,
0.3669091, 0.6418216, 0.7799143, 0, 0.1176471, 1, 1,
0.3680393, 2.455839, -0.8393027, 0, 0.1137255, 1, 1,
0.3712228, 1.249655, -0.6613975, 0, 0.1058824, 1, 1,
0.3720189, 0.7256108, 0.7127725, 0, 0.09803922, 1, 1,
0.3739465, -0.3045295, 1.947627, 0, 0.09411765, 1, 1,
0.3766832, -0.3962433, 2.478739, 0, 0.08627451, 1, 1,
0.3767063, 1.114488, 1.307611, 0, 0.08235294, 1, 1,
0.3796551, -0.2030415, 2.117519, 0, 0.07450981, 1, 1,
0.3849848, -0.2622675, 3.395939, 0, 0.07058824, 1, 1,
0.3878511, 0.6808978, -0.1388555, 0, 0.0627451, 1, 1,
0.3896529, -0.6231006, 1.975527, 0, 0.05882353, 1, 1,
0.3946576, -0.3147872, 2.016816, 0, 0.05098039, 1, 1,
0.3968138, -0.3377465, 2.105849, 0, 0.04705882, 1, 1,
0.3990814, 0.1338645, 0.8772385, 0, 0.03921569, 1, 1,
0.3993545, -1.428084, 4.623949, 0, 0.03529412, 1, 1,
0.4116288, -1.38586, 3.724015, 0, 0.02745098, 1, 1,
0.4202724, 0.1082609, 2.179608, 0, 0.02352941, 1, 1,
0.4205513, -0.08427686, 2.813973, 0, 0.01568628, 1, 1,
0.421114, -1.849859, 2.162514, 0, 0.01176471, 1, 1,
0.4233285, 0.924592, -0.02505884, 0, 0.003921569, 1, 1,
0.4284992, -2.119921, 3.61457, 0.003921569, 0, 1, 1,
0.4307987, 0.6613685, 1.779475, 0.007843138, 0, 1, 1,
0.4416763, 2.258737, -0.1286084, 0.01568628, 0, 1, 1,
0.4436864, -0.05930116, 1.973957, 0.01960784, 0, 1, 1,
0.4452558, -0.432143, 3.416431, 0.02745098, 0, 1, 1,
0.4491326, 0.5059316, 0.4400919, 0.03137255, 0, 1, 1,
0.4518155, 0.3775096, 2.109313, 0.03921569, 0, 1, 1,
0.4521798, 1.586253, 1.032193, 0.04313726, 0, 1, 1,
0.4522062, -0.4712618, 1.743944, 0.05098039, 0, 1, 1,
0.4573244, 1.296385, 0.9506405, 0.05490196, 0, 1, 1,
0.4600193, -0.5442404, 2.599237, 0.0627451, 0, 1, 1,
0.4655448, -0.1756483, 2.676134, 0.06666667, 0, 1, 1,
0.4688438, -1.065991, 2.408826, 0.07450981, 0, 1, 1,
0.4726817, -2.063597, 3.020853, 0.07843138, 0, 1, 1,
0.4741984, -0.3366406, 1.671093, 0.08627451, 0, 1, 1,
0.4752748, -1.108368, 2.095981, 0.09019608, 0, 1, 1,
0.4778304, 0.05060222, 2.298678, 0.09803922, 0, 1, 1,
0.4784343, -1.579922, 1.620511, 0.1058824, 0, 1, 1,
0.4809, -0.3936746, 4.176755, 0.1098039, 0, 1, 1,
0.4858021, 0.9431177, 0.1874687, 0.1176471, 0, 1, 1,
0.4873461, 0.04476038, 2.281682, 0.1215686, 0, 1, 1,
0.4877751, 0.2356202, 1.528643, 0.1294118, 0, 1, 1,
0.4914285, -0.79639, 2.075855, 0.1333333, 0, 1, 1,
0.4933894, 0.3123603, 0.4802846, 0.1411765, 0, 1, 1,
0.4958131, -2.216602, 2.166635, 0.145098, 0, 1, 1,
0.4997993, -1.337898, 0.3110996, 0.1529412, 0, 1, 1,
0.5002856, 1.200744, 0.1967077, 0.1568628, 0, 1, 1,
0.5010892, 0.2424508, 1.866153, 0.1647059, 0, 1, 1,
0.5021174, -0.06686928, 1.214196, 0.1686275, 0, 1, 1,
0.5078326, -0.4196301, 1.241212, 0.1764706, 0, 1, 1,
0.5081694, -0.8114209, 2.755931, 0.1803922, 0, 1, 1,
0.5089784, 1.730763, 0.2520916, 0.1882353, 0, 1, 1,
0.510029, 0.7969143, -0.5023845, 0.1921569, 0, 1, 1,
0.5119405, 0.3920016, 1.119164, 0.2, 0, 1, 1,
0.5122604, -1.79458, 1.74345, 0.2078431, 0, 1, 1,
0.5133573, -0.9196939, 3.394508, 0.2117647, 0, 1, 1,
0.5219044, -1.292064, 4.818063, 0.2196078, 0, 1, 1,
0.5225559, -1.326598, 3.159844, 0.2235294, 0, 1, 1,
0.5241399, -0.3488777, 3.239865, 0.2313726, 0, 1, 1,
0.5254502, -0.5590878, -0.5401777, 0.2352941, 0, 1, 1,
0.5255425, 0.3695474, -0.387551, 0.2431373, 0, 1, 1,
0.5276635, -1.185026, 2.803158, 0.2470588, 0, 1, 1,
0.5316005, -0.1229904, 0.2179013, 0.254902, 0, 1, 1,
0.5353073, -0.4431929, 2.491838, 0.2588235, 0, 1, 1,
0.537493, -0.840925, 1.605603, 0.2666667, 0, 1, 1,
0.5420364, -1.070277, 0.9955682, 0.2705882, 0, 1, 1,
0.5436818, -0.1810016, 4.254614, 0.2784314, 0, 1, 1,
0.5445184, -0.3881011, 2.809648, 0.282353, 0, 1, 1,
0.5464534, -0.3440971, 3.865877, 0.2901961, 0, 1, 1,
0.5475206, -1.0184, 1.321307, 0.2941177, 0, 1, 1,
0.5549787, 1.249605, -2.328587, 0.3019608, 0, 1, 1,
0.5584536, -1.940589, 2.197601, 0.3098039, 0, 1, 1,
0.5598147, -0.5335974, 1.331326, 0.3137255, 0, 1, 1,
0.562122, -0.4151683, 1.384607, 0.3215686, 0, 1, 1,
0.5871738, 0.4119739, -0.1615271, 0.3254902, 0, 1, 1,
0.5909275, 0.4003924, -0.6422262, 0.3333333, 0, 1, 1,
0.5931013, 0.2095832, -0.3311623, 0.3372549, 0, 1, 1,
0.5953442, 0.0757922, 1.949229, 0.345098, 0, 1, 1,
0.5991766, 0.6266137, 2.060488, 0.3490196, 0, 1, 1,
0.6029006, 0.04828871, 1.53875, 0.3568628, 0, 1, 1,
0.6080598, -0.4932828, 1.408047, 0.3607843, 0, 1, 1,
0.6096117, 0.870874, -1.02593, 0.3686275, 0, 1, 1,
0.6103901, -0.3278526, 2.672922, 0.372549, 0, 1, 1,
0.6107743, 1.023042, 1.386017, 0.3803922, 0, 1, 1,
0.6137224, 0.6897808, -0.002294873, 0.3843137, 0, 1, 1,
0.6158107, -0.1495254, 0.4974951, 0.3921569, 0, 1, 1,
0.6257615, 1.467963, -0.08389589, 0.3960784, 0, 1, 1,
0.6287205, 0.1041866, 2.14435, 0.4039216, 0, 1, 1,
0.6314886, 1.277311, 0.5060515, 0.4117647, 0, 1, 1,
0.632336, 0.9191933, 0.33741, 0.4156863, 0, 1, 1,
0.6345256, -0.3483607, 2.057481, 0.4235294, 0, 1, 1,
0.635241, 0.09893813, 1.199912, 0.427451, 0, 1, 1,
0.6367463, -0.8442565, 2.841408, 0.4352941, 0, 1, 1,
0.6387739, 0.6820623, 1.739746, 0.4392157, 0, 1, 1,
0.641162, -0.5403795, 2.404258, 0.4470588, 0, 1, 1,
0.6482009, -0.6736566, 1.039359, 0.4509804, 0, 1, 1,
0.6484029, -0.780663, -0.3994485, 0.4588235, 0, 1, 1,
0.6520079, 0.8914352, -0.8869833, 0.4627451, 0, 1, 1,
0.6582687, -0.1484426, 0.3919688, 0.4705882, 0, 1, 1,
0.6643137, -1.468922, 0.6214485, 0.4745098, 0, 1, 1,
0.6721928, 0.7837461, -0.6065642, 0.4823529, 0, 1, 1,
0.6778031, -0.1663837, 0.06653488, 0.4862745, 0, 1, 1,
0.6795338, -1.111474, 2.354276, 0.4941176, 0, 1, 1,
0.6843663, 1.24838, 1.630316, 0.5019608, 0, 1, 1,
0.6852552, 0.671827, 0.9089741, 0.5058824, 0, 1, 1,
0.686893, -1.309651, 3.6336, 0.5137255, 0, 1, 1,
0.6873763, -0.2417592, 4.098863, 0.5176471, 0, 1, 1,
0.6884219, 0.3122394, -1.123663, 0.5254902, 0, 1, 1,
0.6885503, 0.4384408, 2.393234, 0.5294118, 0, 1, 1,
0.6940961, 0.8349728, 2.085195, 0.5372549, 0, 1, 1,
0.702951, -0.4553174, 0.8056283, 0.5411765, 0, 1, 1,
0.7078741, 0.1789399, 1.328685, 0.5490196, 0, 1, 1,
0.7087259, -0.2534104, 1.494314, 0.5529412, 0, 1, 1,
0.7088703, -0.2758527, 1.776932, 0.5607843, 0, 1, 1,
0.7103847, 0.701682, 0.8498348, 0.5647059, 0, 1, 1,
0.7156326, -2.179692, 3.101651, 0.572549, 0, 1, 1,
0.7207192, 1.618737, 1.748392, 0.5764706, 0, 1, 1,
0.7208846, -0.8288159, 2.218092, 0.5843138, 0, 1, 1,
0.7211667, 0.389892, 0.6649068, 0.5882353, 0, 1, 1,
0.7261994, 1.008836, 0.3053427, 0.5960785, 0, 1, 1,
0.7275177, 0.2474813, 1.128878, 0.6039216, 0, 1, 1,
0.7295462, -0.03066757, -0.5445682, 0.6078432, 0, 1, 1,
0.7297256, 1.556589, 0.4817651, 0.6156863, 0, 1, 1,
0.7300315, 1.959829, -1.096024, 0.6196079, 0, 1, 1,
0.7343693, -1.741071, 2.120346, 0.627451, 0, 1, 1,
0.7404191, -0.417191, 1.968307, 0.6313726, 0, 1, 1,
0.7429298, -0.5229214, 1.758895, 0.6392157, 0, 1, 1,
0.7515254, 0.4713276, 2.314794, 0.6431373, 0, 1, 1,
0.7534874, 0.4334104, 3.669139, 0.6509804, 0, 1, 1,
0.7560529, 0.2801859, 0.2617229, 0.654902, 0, 1, 1,
0.7593197, -0.064885, 1.655922, 0.6627451, 0, 1, 1,
0.7610801, 1.223507, 0.5450311, 0.6666667, 0, 1, 1,
0.761875, 1.076296, 0.3706688, 0.6745098, 0, 1, 1,
0.7641196, -0.8700085, 3.929413, 0.6784314, 0, 1, 1,
0.7680445, -0.865303, 1.470059, 0.6862745, 0, 1, 1,
0.7690412, -0.7255911, 3.628301, 0.6901961, 0, 1, 1,
0.7803546, -0.5702066, 3.200995, 0.6980392, 0, 1, 1,
0.7823752, 1.240369, 1.526944, 0.7058824, 0, 1, 1,
0.7873216, 0.1427825, 0.7441442, 0.7098039, 0, 1, 1,
0.7882751, -2.638151, 5.00683, 0.7176471, 0, 1, 1,
0.7892146, -1.688959, 1.777046, 0.7215686, 0, 1, 1,
0.7901548, -1.385214, 1.866772, 0.7294118, 0, 1, 1,
0.7924177, -0.1709804, 1.091352, 0.7333333, 0, 1, 1,
0.7945133, -0.2624909, 1.926292, 0.7411765, 0, 1, 1,
0.7945904, -0.328329, 0.3074891, 0.7450981, 0, 1, 1,
0.8002952, 1.378234, -0.1458079, 0.7529412, 0, 1, 1,
0.8040412, -0.7658373, 1.776235, 0.7568628, 0, 1, 1,
0.8083884, 0.0959639, 2.161275, 0.7647059, 0, 1, 1,
0.8086441, 0.6253465, 0.3355731, 0.7686275, 0, 1, 1,
0.8200201, 1.270108, 0.3197209, 0.7764706, 0, 1, 1,
0.8244724, -0.752618, 1.575446, 0.7803922, 0, 1, 1,
0.824545, -3.889422, 2.114012, 0.7882353, 0, 1, 1,
0.8262131, 0.6371819, 1.069202, 0.7921569, 0, 1, 1,
0.8290359, 1.10252, -0.9280942, 0.8, 0, 1, 1,
0.8293601, -0.3863038, 0.6542292, 0.8078431, 0, 1, 1,
0.8428617, -0.5058308, 1.329815, 0.8117647, 0, 1, 1,
0.8474779, 0.8067788, 0.7199849, 0.8196079, 0, 1, 1,
0.8517455, 2.397953, 0.4519598, 0.8235294, 0, 1, 1,
0.8525208, -0.06559304, 3.531026, 0.8313726, 0, 1, 1,
0.8548652, 1.420348, -0.4737375, 0.8352941, 0, 1, 1,
0.8660359, 1.628097, 0.5195805, 0.8431373, 0, 1, 1,
0.8743935, 0.04617522, 1.425612, 0.8470588, 0, 1, 1,
0.876658, 0.008060099, 0.2573721, 0.854902, 0, 1, 1,
0.8770987, -0.04454105, 2.047965, 0.8588235, 0, 1, 1,
0.8777673, 0.09251184, 3.525845, 0.8666667, 0, 1, 1,
0.8886449, -1.009419, 0.5900017, 0.8705882, 0, 1, 1,
0.8946413, -1.047085, 2.079171, 0.8784314, 0, 1, 1,
0.8995606, 0.4019868, 1.439711, 0.8823529, 0, 1, 1,
0.8997729, 0.3802711, 1.297976, 0.8901961, 0, 1, 1,
0.9036261, 1.076093, 1.265786, 0.8941177, 0, 1, 1,
0.9040744, 0.1700993, 1.339441, 0.9019608, 0, 1, 1,
0.9125153, 0.5856619, 1.291538, 0.9098039, 0, 1, 1,
0.9127605, -0.6637541, 2.741388, 0.9137255, 0, 1, 1,
0.9138095, 0.5015231, 3.369925, 0.9215686, 0, 1, 1,
0.9152094, 2.864125, 0.2165633, 0.9254902, 0, 1, 1,
0.9169223, -0.5499601, 2.649286, 0.9333333, 0, 1, 1,
0.9210346, -1.24621, 3.836186, 0.9372549, 0, 1, 1,
0.9217996, 0.8810407, 0.9143418, 0.945098, 0, 1, 1,
0.9244351, 0.5160748, 0.280033, 0.9490196, 0, 1, 1,
0.9290487, 0.4148369, 0.129673, 0.9568627, 0, 1, 1,
0.9349955, 1.898041, -0.1588411, 0.9607843, 0, 1, 1,
0.9355373, -0.8495589, 0.9502062, 0.9686275, 0, 1, 1,
0.9451847, 0.335818, 1.266138, 0.972549, 0, 1, 1,
0.9464204, -0.9317399, 2.450843, 0.9803922, 0, 1, 1,
0.9475579, 1.91729, -0.5401322, 0.9843137, 0, 1, 1,
0.9570775, -0.5810449, 3.126573, 0.9921569, 0, 1, 1,
0.9669484, -1.110286, 1.981871, 0.9960784, 0, 1, 1,
0.9711013, 0.04747712, 0.3789327, 1, 0, 0.9960784, 1,
0.9714589, 0.5435647, 2.802433, 1, 0, 0.9882353, 1,
0.9755411, -0.9216912, 1.021154, 1, 0, 0.9843137, 1,
0.9765783, 0.9626744, -0.2035595, 1, 0, 0.9764706, 1,
0.981439, -1.497926, 1.892525, 1, 0, 0.972549, 1,
0.9840572, -2.524445, 2.560501, 1, 0, 0.9647059, 1,
0.9880031, -0.3005262, 0.6678438, 1, 0, 0.9607843, 1,
0.9898307, -0.838414, 2.781207, 1, 0, 0.9529412, 1,
0.9916892, 1.405183, 0.9055548, 1, 0, 0.9490196, 1,
1.008215, 0.3745769, -0.06230412, 1, 0, 0.9411765, 1,
1.011109, 0.8419241, 1.021223, 1, 0, 0.9372549, 1,
1.024496, -0.9716729, 1.995535, 1, 0, 0.9294118, 1,
1.024884, -0.2870452, 1.142206, 1, 0, 0.9254902, 1,
1.027435, 1.550126, -1.09754, 1, 0, 0.9176471, 1,
1.03605, 0.7122085, 0.7413394, 1, 0, 0.9137255, 1,
1.038036, 0.3019076, 1.235028, 1, 0, 0.9058824, 1,
1.047328, 2.73962, 0.03503426, 1, 0, 0.9019608, 1,
1.056348, 1.622766, -0.5944743, 1, 0, 0.8941177, 1,
1.058964, -0.9710237, 4.008942, 1, 0, 0.8862745, 1,
1.059445, -0.4940831, 1.539432, 1, 0, 0.8823529, 1,
1.0657, -0.0002810516, 1.266143, 1, 0, 0.8745098, 1,
1.070592, -1.421502, 1.59813, 1, 0, 0.8705882, 1,
1.072971, 1.90586, 1.373938, 1, 0, 0.8627451, 1,
1.085822, 0.7286285, 0.8462118, 1, 0, 0.8588235, 1,
1.088117, -1.432118, 3.157496, 1, 0, 0.8509804, 1,
1.091992, -0.08419173, -0.4357562, 1, 0, 0.8470588, 1,
1.106606, 0.5368282, 0.8069615, 1, 0, 0.8392157, 1,
1.107623, 1.235092, 0.1483245, 1, 0, 0.8352941, 1,
1.110698, -0.6252319, 3.902756, 1, 0, 0.827451, 1,
1.110703, 0.5613914, 2.831196, 1, 0, 0.8235294, 1,
1.116459, -0.05745467, 1.755473, 1, 0, 0.8156863, 1,
1.116799, 0.2293735, 3.108048, 1, 0, 0.8117647, 1,
1.121446, -1.451368, 2.5519, 1, 0, 0.8039216, 1,
1.124618, -0.2043464, 1.051623, 1, 0, 0.7960784, 1,
1.124759, -2.387956, 3.587602, 1, 0, 0.7921569, 1,
1.13018, 0.6576231, 1.405023, 1, 0, 0.7843137, 1,
1.135159, 0.07067643, 0.146172, 1, 0, 0.7803922, 1,
1.136525, 0.5436085, 1.103631, 1, 0, 0.772549, 1,
1.13814, 0.2818257, 0.3843934, 1, 0, 0.7686275, 1,
1.138527, 1.264808, 2.195889, 1, 0, 0.7607843, 1,
1.144917, -1.467593, 1.613332, 1, 0, 0.7568628, 1,
1.147908, -0.7791461, 2.228983, 1, 0, 0.7490196, 1,
1.148924, 0.7225956, 0.7497742, 1, 0, 0.7450981, 1,
1.153025, -1.579876, 2.204781, 1, 0, 0.7372549, 1,
1.153427, 0.5512213, 2.061434, 1, 0, 0.7333333, 1,
1.155057, -0.655623, 2.057253, 1, 0, 0.7254902, 1,
1.156176, 0.7692422, 1.411699, 1, 0, 0.7215686, 1,
1.159678, -0.09025364, 3.053286, 1, 0, 0.7137255, 1,
1.164481, 0.8771517, 0.4702414, 1, 0, 0.7098039, 1,
1.166368, -1.32152, 2.681702, 1, 0, 0.7019608, 1,
1.169558, 1.396259, 1.924697, 1, 0, 0.6941177, 1,
1.180315, 0.5573428, -0.0009395047, 1, 0, 0.6901961, 1,
1.199198, 1.552479, -1.257031, 1, 0, 0.682353, 1,
1.199558, 0.7466409, 1.418262, 1, 0, 0.6784314, 1,
1.210996, -0.1223348, 1.219733, 1, 0, 0.6705883, 1,
1.211262, 0.8375529, 0.9409958, 1, 0, 0.6666667, 1,
1.218724, -1.054794, 2.74067, 1, 0, 0.6588235, 1,
1.229632, -0.9155386, 0.7916709, 1, 0, 0.654902, 1,
1.230065, 1.081047, 1.442951, 1, 0, 0.6470588, 1,
1.238071, -0.4639498, 2.926331, 1, 0, 0.6431373, 1,
1.242012, -0.8515649, 2.863549, 1, 0, 0.6352941, 1,
1.247438, 0.2919519, 1.742371, 1, 0, 0.6313726, 1,
1.249419, 0.9596356, 1.360061, 1, 0, 0.6235294, 1,
1.250433, 1.927827, -0.4901267, 1, 0, 0.6196079, 1,
1.255525, 0.336056, -0.4535905, 1, 0, 0.6117647, 1,
1.262186, 1.413962, 0.7244958, 1, 0, 0.6078432, 1,
1.281071, 0.4365671, 0.754547, 1, 0, 0.6, 1,
1.285417, -0.5961589, 1.915425, 1, 0, 0.5921569, 1,
1.289389, 0.2419767, 0.4191089, 1, 0, 0.5882353, 1,
1.294019, 0.4287495, 2.148594, 1, 0, 0.5803922, 1,
1.299144, 1.091942, 0.9409459, 1, 0, 0.5764706, 1,
1.301734, 0.5422971, 0.819757, 1, 0, 0.5686275, 1,
1.3099, 0.004462313, 2.476077, 1, 0, 0.5647059, 1,
1.313046, 0.7796952, 1.068133, 1, 0, 0.5568628, 1,
1.33538, 0.6458452, 1.818521, 1, 0, 0.5529412, 1,
1.350123, 0.01333422, 2.25342, 1, 0, 0.5450981, 1,
1.356741, 1.864913, 1.29704, 1, 0, 0.5411765, 1,
1.361901, 1.315624, 0.5172908, 1, 0, 0.5333334, 1,
1.366871, -0.1808437, 2.014517, 1, 0, 0.5294118, 1,
1.370755, 0.4818651, 1.318806, 1, 0, 0.5215687, 1,
1.375653, -0.838033, 1.752546, 1, 0, 0.5176471, 1,
1.382406, -0.1715382, 1.277403, 1, 0, 0.509804, 1,
1.385962, 0.0710758, 0.8981344, 1, 0, 0.5058824, 1,
1.386821, -0.5102653, 3.23895, 1, 0, 0.4980392, 1,
1.394912, -0.8212118, 2.845137, 1, 0, 0.4901961, 1,
1.396028, -0.2395742, 1.209308, 1, 0, 0.4862745, 1,
1.411996, -0.0008539984, 1.229016, 1, 0, 0.4784314, 1,
1.415129, 0.6134505, 1.279494, 1, 0, 0.4745098, 1,
1.42569, -0.3002045, 2.501124, 1, 0, 0.4666667, 1,
1.426897, -0.9158701, 1.618067, 1, 0, 0.4627451, 1,
1.436219, 0.9185923, 0.1550277, 1, 0, 0.454902, 1,
1.438119, -0.3732352, 0.2632182, 1, 0, 0.4509804, 1,
1.439437, -0.8074195, 2.559792, 1, 0, 0.4431373, 1,
1.442912, 0.4380475, 2.257421, 1, 0, 0.4392157, 1,
1.445948, -1.243135, 1.552866, 1, 0, 0.4313726, 1,
1.451634, 0.3945419, 3.068452, 1, 0, 0.427451, 1,
1.461352, -0.06325268, 3.526273, 1, 0, 0.4196078, 1,
1.478279, -0.7984153, 1.729952, 1, 0, 0.4156863, 1,
1.480511, 0.784471, 0.6549067, 1, 0, 0.4078431, 1,
1.491969, -1.727618, 3.053692, 1, 0, 0.4039216, 1,
1.498795, 0.185478, 2.102035, 1, 0, 0.3960784, 1,
1.507937, -0.3031224, 1.254007, 1, 0, 0.3882353, 1,
1.509443, -0.4770598, 3.012121, 1, 0, 0.3843137, 1,
1.512363, -0.8490765, 0.2414432, 1, 0, 0.3764706, 1,
1.513075, 1.735042, -0.06498912, 1, 0, 0.372549, 1,
1.516657, 0.6986879, 1.0559, 1, 0, 0.3647059, 1,
1.533608, 0.3218558, 3.126733, 1, 0, 0.3607843, 1,
1.540231, -0.05994768, 3.375076, 1, 0, 0.3529412, 1,
1.542216, 1.377129, -0.4719579, 1, 0, 0.3490196, 1,
1.547053, -1.474051, 2.858957, 1, 0, 0.3411765, 1,
1.553524, -1.211554, 1.792564, 1, 0, 0.3372549, 1,
1.560121, -0.06547255, 1.631251, 1, 0, 0.3294118, 1,
1.565573, -0.6447542, 2.462946, 1, 0, 0.3254902, 1,
1.565741, 0.5778623, 1.806297, 1, 0, 0.3176471, 1,
1.576142, 0.2923359, 0.8627973, 1, 0, 0.3137255, 1,
1.580962, -0.7487529, 0.8524804, 1, 0, 0.3058824, 1,
1.61597, 0.8647759, 1.831, 1, 0, 0.2980392, 1,
1.650579, -0.1710533, 2.059526, 1, 0, 0.2941177, 1,
1.673654, -0.4286216, 1.821475, 1, 0, 0.2862745, 1,
1.676188, -1.619731, 2.090586, 1, 0, 0.282353, 1,
1.681651, -0.6261701, 1.526045, 1, 0, 0.2745098, 1,
1.693236, -2.874914, 2.451215, 1, 0, 0.2705882, 1,
1.694865, -0.2451413, 2.050103, 1, 0, 0.2627451, 1,
1.703136, -1.350031, 1.164957, 1, 0, 0.2588235, 1,
1.737696, 1.721029, 2.00746, 1, 0, 0.2509804, 1,
1.744711, 0.7817938, 1.075811, 1, 0, 0.2470588, 1,
1.748522, 1.911488, 1.292107, 1, 0, 0.2392157, 1,
1.749202, 1.169577, 2.646031, 1, 0, 0.2352941, 1,
1.756387, -1.309002, 1.794336, 1, 0, 0.227451, 1,
1.759027, -0.08352377, 2.347246, 1, 0, 0.2235294, 1,
1.838727, 1.205401, -0.06574892, 1, 0, 0.2156863, 1,
1.843979, 1.167691, -1.219585, 1, 0, 0.2117647, 1,
1.859651, 0.7820409, 1.422415, 1, 0, 0.2039216, 1,
1.912396, 2.161288, 0.8297499, 1, 0, 0.1960784, 1,
1.915207, -0.3544304, 1.281661, 1, 0, 0.1921569, 1,
1.925004, -0.4036255, 1.198926, 1, 0, 0.1843137, 1,
1.973641, -1.774779, 1.29856, 1, 0, 0.1803922, 1,
1.976038, -0.5595439, 2.397994, 1, 0, 0.172549, 1,
1.987463, 0.7041527, 1.738043, 1, 0, 0.1686275, 1,
1.999707, -0.198704, 2.473268, 1, 0, 0.1607843, 1,
2.01224, -0.5443711, 2.278349, 1, 0, 0.1568628, 1,
2.059166, -0.3588751, 1.826542, 1, 0, 0.1490196, 1,
2.059891, -0.09298615, 2.999145, 1, 0, 0.145098, 1,
2.069363, -1.146504, 0.3349957, 1, 0, 0.1372549, 1,
2.074385, -0.9666713, 3.068523, 1, 0, 0.1333333, 1,
2.076717, 1.165975, 1.301445, 1, 0, 0.1254902, 1,
2.084229, 0.1619137, 0.9736863, 1, 0, 0.1215686, 1,
2.09367, 0.2833567, 3.515089, 1, 0, 0.1137255, 1,
2.110285, -1.152837, 1.845467, 1, 0, 0.1098039, 1,
2.119349, -0.7730481, 1.074359, 1, 0, 0.1019608, 1,
2.120264, 2.872832, 0.7292061, 1, 0, 0.09411765, 1,
2.13971, 1.927643, 0.3568467, 1, 0, 0.09019608, 1,
2.139971, 0.4640026, 3.624966, 1, 0, 0.08235294, 1,
2.215441, -0.1236466, 2.238763, 1, 0, 0.07843138, 1,
2.241011, 0.7552808, 1.797347, 1, 0, 0.07058824, 1,
2.272549, -1.073919, 1.692963, 1, 0, 0.06666667, 1,
2.313258, -0.8044217, 2.461007, 1, 0, 0.05882353, 1,
2.32027, -0.4645975, 1.727418, 1, 0, 0.05490196, 1,
2.376168, 0.5086377, 0.4397753, 1, 0, 0.04705882, 1,
2.430387, 1.090084, 2.595578, 1, 0, 0.04313726, 1,
2.500461, -1.997106, 2.489527, 1, 0, 0.03529412, 1,
2.513302, 0.4387736, -0.3011929, 1, 0, 0.03137255, 1,
2.565626, -1.02684, 2.807192, 1, 0, 0.02352941, 1,
2.595744, 0.8333228, 2.054113, 1, 0, 0.01960784, 1,
2.750578, -2.986704, 1.667378, 1, 0, 0.01176471, 1,
3.703866, -1.494732, 1.589078, 1, 0, 0.007843138, 1
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
0.4141277, -5.17267, -7.378729, 0, -0.5, 0.5, 0.5,
0.4141277, -5.17267, -7.378729, 1, -0.5, 0.5, 0.5,
0.4141277, -5.17267, -7.378729, 1, 1.5, 0.5, 0.5,
0.4141277, -5.17267, -7.378729, 0, 1.5, 0.5, 0.5
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
-3.990832, -0.1040313, -7.378729, 0, -0.5, 0.5, 0.5,
-3.990832, -0.1040313, -7.378729, 1, -0.5, 0.5, 0.5,
-3.990832, -0.1040313, -7.378729, 1, 1.5, 0.5, 0.5,
-3.990832, -0.1040313, -7.378729, 0, 1.5, 0.5, 0.5
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
-3.990832, -5.17267, -0.2884068, 0, -0.5, 0.5, 0.5,
-3.990832, -5.17267, -0.2884068, 1, -0.5, 0.5, 0.5,
-3.990832, -5.17267, -0.2884068, 1, 1.5, 0.5, 0.5,
-3.990832, -5.17267, -0.2884068, 0, 1.5, 0.5, 0.5
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
-2, -4.002984, -5.742501,
3, -4.002984, -5.742501,
-2, -4.002984, -5.742501,
-2, -4.197932, -6.015206,
-1, -4.002984, -5.742501,
-1, -4.197932, -6.015206,
0, -4.002984, -5.742501,
0, -4.197932, -6.015206,
1, -4.002984, -5.742501,
1, -4.197932, -6.015206,
2, -4.002984, -5.742501,
2, -4.197932, -6.015206,
3, -4.002984, -5.742501,
3, -4.197932, -6.015206
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
-2, -4.587827, -6.560615, 0, -0.5, 0.5, 0.5,
-2, -4.587827, -6.560615, 1, -0.5, 0.5, 0.5,
-2, -4.587827, -6.560615, 1, 1.5, 0.5, 0.5,
-2, -4.587827, -6.560615, 0, 1.5, 0.5, 0.5,
-1, -4.587827, -6.560615, 0, -0.5, 0.5, 0.5,
-1, -4.587827, -6.560615, 1, -0.5, 0.5, 0.5,
-1, -4.587827, -6.560615, 1, 1.5, 0.5, 0.5,
-1, -4.587827, -6.560615, 0, 1.5, 0.5, 0.5,
0, -4.587827, -6.560615, 0, -0.5, 0.5, 0.5,
0, -4.587827, -6.560615, 1, -0.5, 0.5, 0.5,
0, -4.587827, -6.560615, 1, 1.5, 0.5, 0.5,
0, -4.587827, -6.560615, 0, 1.5, 0.5, 0.5,
1, -4.587827, -6.560615, 0, -0.5, 0.5, 0.5,
1, -4.587827, -6.560615, 1, -0.5, 0.5, 0.5,
1, -4.587827, -6.560615, 1, 1.5, 0.5, 0.5,
1, -4.587827, -6.560615, 0, 1.5, 0.5, 0.5,
2, -4.587827, -6.560615, 0, -0.5, 0.5, 0.5,
2, -4.587827, -6.560615, 1, -0.5, 0.5, 0.5,
2, -4.587827, -6.560615, 1, 1.5, 0.5, 0.5,
2, -4.587827, -6.560615, 0, 1.5, 0.5, 0.5,
3, -4.587827, -6.560615, 0, -0.5, 0.5, 0.5,
3, -4.587827, -6.560615, 1, -0.5, 0.5, 0.5,
3, -4.587827, -6.560615, 1, 1.5, 0.5, 0.5,
3, -4.587827, -6.560615, 0, 1.5, 0.5, 0.5
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
-2.974303, -2, -5.742501,
-2.974303, 2, -5.742501,
-2.974303, -2, -5.742501,
-3.143724, -2, -6.015206,
-2.974303, 0, -5.742501,
-3.143724, 0, -6.015206,
-2.974303, 2, -5.742501,
-3.143724, 2, -6.015206
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
-3.482567, -2, -6.560615, 0, -0.5, 0.5, 0.5,
-3.482567, -2, -6.560615, 1, -0.5, 0.5, 0.5,
-3.482567, -2, -6.560615, 1, 1.5, 0.5, 0.5,
-3.482567, -2, -6.560615, 0, 1.5, 0.5, 0.5,
-3.482567, 0, -6.560615, 0, -0.5, 0.5, 0.5,
-3.482567, 0, -6.560615, 1, -0.5, 0.5, 0.5,
-3.482567, 0, -6.560615, 1, 1.5, 0.5, 0.5,
-3.482567, 0, -6.560615, 0, 1.5, 0.5, 0.5,
-3.482567, 2, -6.560615, 0, -0.5, 0.5, 0.5,
-3.482567, 2, -6.560615, 1, -0.5, 0.5, 0.5,
-3.482567, 2, -6.560615, 1, 1.5, 0.5, 0.5,
-3.482567, 2, -6.560615, 0, 1.5, 0.5, 0.5
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
-2.974303, -4.002984, -4,
-2.974303, -4.002984, 4,
-2.974303, -4.002984, -4,
-3.143724, -4.197932, -4,
-2.974303, -4.002984, -2,
-3.143724, -4.197932, -2,
-2.974303, -4.002984, 0,
-3.143724, -4.197932, 0,
-2.974303, -4.002984, 2,
-3.143724, -4.197932, 2,
-2.974303, -4.002984, 4,
-3.143724, -4.197932, 4
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
-3.482567, -4.587827, -4, 0, -0.5, 0.5, 0.5,
-3.482567, -4.587827, -4, 1, -0.5, 0.5, 0.5,
-3.482567, -4.587827, -4, 1, 1.5, 0.5, 0.5,
-3.482567, -4.587827, -4, 0, 1.5, 0.5, 0.5,
-3.482567, -4.587827, -2, 0, -0.5, 0.5, 0.5,
-3.482567, -4.587827, -2, 1, -0.5, 0.5, 0.5,
-3.482567, -4.587827, -2, 1, 1.5, 0.5, 0.5,
-3.482567, -4.587827, -2, 0, 1.5, 0.5, 0.5,
-3.482567, -4.587827, 0, 0, -0.5, 0.5, 0.5,
-3.482567, -4.587827, 0, 1, -0.5, 0.5, 0.5,
-3.482567, -4.587827, 0, 1, 1.5, 0.5, 0.5,
-3.482567, -4.587827, 0, 0, 1.5, 0.5, 0.5,
-3.482567, -4.587827, 2, 0, -0.5, 0.5, 0.5,
-3.482567, -4.587827, 2, 1, -0.5, 0.5, 0.5,
-3.482567, -4.587827, 2, 1, 1.5, 0.5, 0.5,
-3.482567, -4.587827, 2, 0, 1.5, 0.5, 0.5,
-3.482567, -4.587827, 4, 0, -0.5, 0.5, 0.5,
-3.482567, -4.587827, 4, 1, -0.5, 0.5, 0.5,
-3.482567, -4.587827, 4, 1, 1.5, 0.5, 0.5,
-3.482567, -4.587827, 4, 0, 1.5, 0.5, 0.5
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
-2.974303, -4.002984, -5.742501,
-2.974303, 3.794921, -5.742501,
-2.974303, -4.002984, 5.165688,
-2.974303, 3.794921, 5.165688,
-2.974303, -4.002984, -5.742501,
-2.974303, -4.002984, 5.165688,
-2.974303, 3.794921, -5.742501,
-2.974303, 3.794921, 5.165688,
-2.974303, -4.002984, -5.742501,
3.802558, -4.002984, -5.742501,
-2.974303, -4.002984, 5.165688,
3.802558, -4.002984, 5.165688,
-2.974303, 3.794921, -5.742501,
3.802558, 3.794921, -5.742501,
-2.974303, 3.794921, 5.165688,
3.802558, 3.794921, 5.165688,
3.802558, -4.002984, -5.742501,
3.802558, 3.794921, -5.742501,
3.802558, -4.002984, 5.165688,
3.802558, 3.794921, 5.165688,
3.802558, -4.002984, -5.742501,
3.802558, -4.002984, 5.165688,
3.802558, 3.794921, -5.742501,
3.802558, 3.794921, 5.165688
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
var radius = 8.022545;
var distance = 35.69321;
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
mvMatrix.translate( -0.4141277, 0.1040313, 0.2884068 );
mvMatrix.scale( 1.279963, 1.112367, 0.7951946 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.69321);
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
phosphonic_acid_N-ph<-read.table("phosphonic_acid_N-ph.xyz", skip=1)
```

```
## Error in read.table("phosphonic_acid_N-ph.xyz", skip = 1): duplicate 'row.names' are not allowed
```

```r
x<-phosphonic_acid_N-ph$V2
```

```
## Error in eval(expr, envir, enclos): object 'phosphonic_acid_N' not found
```

```r
y<-phosphonic_acid_N-ph$V3
```

```
## Error in eval(expr, envir, enclos): object 'phosphonic_acid_N' not found
```

```r
z<-phosphonic_acid_N-ph$V4
```

```
## Error in eval(expr, envir, enclos): object 'phosphonic_acid_N' not found
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
-2.87561, 0.3435254, -1.982439, 0, 0, 1, 1, 1,
-2.577155, -0.9046322, -1.858552, 1, 0, 0, 1, 1,
-2.469498, 0.05081026, -2.16971, 1, 0, 0, 1, 1,
-2.424892, -0.3207747, -0.8986331, 1, 0, 0, 1, 1,
-2.412176, -1.433769, -1.721024, 1, 0, 0, 1, 1,
-2.386062, -0.5651047, -3.51964, 1, 0, 0, 1, 1,
-2.341151, -0.4477062, -1.834836, 0, 0, 0, 1, 1,
-2.300295, -0.5675225, -2.01246, 0, 0, 0, 1, 1,
-2.26958, 0.03264957, -1.041258, 0, 0, 0, 1, 1,
-2.268835, -0.6681203, -0.9016792, 0, 0, 0, 1, 1,
-2.253698, 0.8761762, -1.5663, 0, 0, 0, 1, 1,
-2.2314, 0.9973302, -0.7367624, 0, 0, 0, 1, 1,
-2.214302, -0.7591452, -3.177266, 0, 0, 0, 1, 1,
-2.104126, -0.6996924, -2.931536, 1, 1, 1, 1, 1,
-2.100856, -1.130884, -0.7778411, 1, 1, 1, 1, 1,
-2.092294, -0.4089262, -1.661276, 1, 1, 1, 1, 1,
-2.079556, 0.670285, -1.547259, 1, 1, 1, 1, 1,
-2.064401, 1.450791, -0.2018153, 1, 1, 1, 1, 1,
-1.996398, 1.259313, -1.842666, 1, 1, 1, 1, 1,
-1.970799, -0.7238238, -1.315685, 1, 1, 1, 1, 1,
-1.947824, -0.1517367, 0.3390182, 1, 1, 1, 1, 1,
-1.937372, 1.511348, 1.970802, 1, 1, 1, 1, 1,
-1.921012, -1.54944, -3.251188, 1, 1, 1, 1, 1,
-1.914617, 0.162688, -0.9401174, 1, 1, 1, 1, 1,
-1.913545, -0.7242693, -2.629275, 1, 1, 1, 1, 1,
-1.91026, 0.178255, -1.208682, 1, 1, 1, 1, 1,
-1.873692, 0.3482418, -2.441149, 1, 1, 1, 1, 1,
-1.862581, -0.5642608, -1.751365, 1, 1, 1, 1, 1,
-1.835616, 1.105505, -0.8279392, 0, 0, 1, 1, 1,
-1.824236, -0.6973355, -1.600033, 1, 0, 0, 1, 1,
-1.819066, -0.4835264, -2.093235, 1, 0, 0, 1, 1,
-1.815328, -0.5127729, -1.944454, 1, 0, 0, 1, 1,
-1.810776, -0.1121777, 0.03840486, 1, 0, 0, 1, 1,
-1.784405, 0.02112768, -1.341635, 1, 0, 0, 1, 1,
-1.74634, -0.7561081, -0.4559332, 0, 0, 0, 1, 1,
-1.741252, 0.9579206, -1.38806, 0, 0, 0, 1, 1,
-1.738347, 0.2358328, -1.264164, 0, 0, 0, 1, 1,
-1.725036, 0.3277426, -1.393192, 0, 0, 0, 1, 1,
-1.720781, 1.695794, -2.213918, 0, 0, 0, 1, 1,
-1.699438, 0.06633845, -1.206387, 0, 0, 0, 1, 1,
-1.681145, 2.171876, -0.1814224, 0, 0, 0, 1, 1,
-1.6801, -0.4491294, -1.459897, 1, 1, 1, 1, 1,
-1.672345, 0.9126703, -0.3605644, 1, 1, 1, 1, 1,
-1.650132, -0.7248834, -2.258348, 1, 1, 1, 1, 1,
-1.606648, -0.6263076, -3.216114, 1, 1, 1, 1, 1,
-1.603787, -0.2561737, -1.838896, 1, 1, 1, 1, 1,
-1.590172, 0.8293118, 0.1966452, 1, 1, 1, 1, 1,
-1.567334, 0.2041604, -1.175739, 1, 1, 1, 1, 1,
-1.561166, -0.519483, -1.295523, 1, 1, 1, 1, 1,
-1.53969, -0.5244799, -2.404476, 1, 1, 1, 1, 1,
-1.530377, 0.4031783, -1.922708, 1, 1, 1, 1, 1,
-1.526526, -1.310298, -0.7576975, 1, 1, 1, 1, 1,
-1.509755, -0.584713, -1.304176, 1, 1, 1, 1, 1,
-1.502141, -0.2332397, -0.6681787, 1, 1, 1, 1, 1,
-1.496089, 1.401348, -1.677151, 1, 1, 1, 1, 1,
-1.490637, -0.2406363, -2.144591, 1, 1, 1, 1, 1,
-1.487781, -0.9454204, -0.3835346, 0, 0, 1, 1, 1,
-1.486423, 0.3273214, -2.352774, 1, 0, 0, 1, 1,
-1.470818, 0.7518811, -1.658195, 1, 0, 0, 1, 1,
-1.463485, 0.4946881, -1.291329, 1, 0, 0, 1, 1,
-1.454699, 0.6985952, -1.122104, 1, 0, 0, 1, 1,
-1.453388, -1.021167, -3.157185, 1, 0, 0, 1, 1,
-1.444753, -0.7103099, -2.412466, 0, 0, 0, 1, 1,
-1.44338, -0.4376908, -1.863316, 0, 0, 0, 1, 1,
-1.430662, 0.3154496, -0.9313582, 0, 0, 0, 1, 1,
-1.430357, 1.326112, -1.558152, 0, 0, 0, 1, 1,
-1.425415, -1.37393, -2.366909, 0, 0, 0, 1, 1,
-1.421927, 2.256281, -2.385413, 0, 0, 0, 1, 1,
-1.4063, -0.2918054, -0.9207166, 0, 0, 0, 1, 1,
-1.403647, 1.065483, -0.9959469, 1, 1, 1, 1, 1,
-1.398762, 1.549504, -0.4755635, 1, 1, 1, 1, 1,
-1.395612, 0.5062649, -1.358573, 1, 1, 1, 1, 1,
-1.3818, -0.8777423, -2.786223, 1, 1, 1, 1, 1,
-1.379929, -0.392354, -1.479546, 1, 1, 1, 1, 1,
-1.350395, -1.179338, -2.036167, 1, 1, 1, 1, 1,
-1.347982, -0.2778761, -1.452856, 1, 1, 1, 1, 1,
-1.347365, 0.3186442, -2.847524, 1, 1, 1, 1, 1,
-1.327769, 0.1562471, -1.241376, 1, 1, 1, 1, 1,
-1.326558, 0.8295355, -0.9233979, 1, 1, 1, 1, 1,
-1.322051, -0.5356414, -0.7252591, 1, 1, 1, 1, 1,
-1.318174, 0.2691146, -2.276576, 1, 1, 1, 1, 1,
-1.303534, 0.7865807, -1.642508, 1, 1, 1, 1, 1,
-1.298638, 0.2136153, -3.664679, 1, 1, 1, 1, 1,
-1.297448, 0.9340093, -0.5043346, 1, 1, 1, 1, 1,
-1.295849, -0.5691974, -2.508677, 0, 0, 1, 1, 1,
-1.294484, 0.2762284, -0.7982984, 1, 0, 0, 1, 1,
-1.293804, 0.05880013, -2.825604, 1, 0, 0, 1, 1,
-1.283145, 2.363811, -0.7875218, 1, 0, 0, 1, 1,
-1.281534, -1.432807, -3.689228, 1, 0, 0, 1, 1,
-1.265965, -1.064014, -0.3902813, 1, 0, 0, 1, 1,
-1.262714, -0.2634556, -2.797661, 0, 0, 0, 1, 1,
-1.259628, -1.293531, -3.112986, 0, 0, 0, 1, 1,
-1.25916, -1.557015, -1.595117, 0, 0, 0, 1, 1,
-1.252929, 0.8531075, -1.472728, 0, 0, 0, 1, 1,
-1.247144, 0.5218382, -1.840766, 0, 0, 0, 1, 1,
-1.246328, 0.3216422, -1.030912, 0, 0, 0, 1, 1,
-1.245357, -0.3861427, -1.356885, 0, 0, 0, 1, 1,
-1.239525, -0.5836701, -0.3593306, 1, 1, 1, 1, 1,
-1.237246, -0.7348972, -1.355323, 1, 1, 1, 1, 1,
-1.230278, -1.756979, -1.887048, 1, 1, 1, 1, 1,
-1.216773, 1.274851, 0.3453982, 1, 1, 1, 1, 1,
-1.214261, -0.2182765, -2.239061, 1, 1, 1, 1, 1,
-1.199872, -1.678769, -3.396703, 1, 1, 1, 1, 1,
-1.189425, -2.872808, -2.511487, 1, 1, 1, 1, 1,
-1.18814, -1.887909, -3.197468, 1, 1, 1, 1, 1,
-1.186436, 0.7314916, -2.369107, 1, 1, 1, 1, 1,
-1.183789, 0.5652788, -0.1396065, 1, 1, 1, 1, 1,
-1.183192, 0.3314888, -0.9105998, 1, 1, 1, 1, 1,
-1.18265, 1.059978, -0.694566, 1, 1, 1, 1, 1,
-1.18209, 2.512411, -1.12065, 1, 1, 1, 1, 1,
-1.17759, -0.3777262, -1.720543, 1, 1, 1, 1, 1,
-1.166451, -0.2679842, -3.363968, 1, 1, 1, 1, 1,
-1.15908, -0.682287, -0.6406009, 0, 0, 1, 1, 1,
-1.15404, -0.3198643, -2.33344, 1, 0, 0, 1, 1,
-1.145247, 0.1111986, -2.682852, 1, 0, 0, 1, 1,
-1.14148, 1.81823, -0.2173109, 1, 0, 0, 1, 1,
-1.139576, -1.564994, -0.6925557, 1, 0, 0, 1, 1,
-1.139453, -0.4725889, -0.6722671, 1, 0, 0, 1, 1,
-1.131361, -0.3939633, -2.265328, 0, 0, 0, 1, 1,
-1.127392, -0.6558881, -2.47498, 0, 0, 0, 1, 1,
-1.124956, 0.7707373, -0.7925838, 0, 0, 0, 1, 1,
-1.124366, 0.2367083, -2.301725, 0, 0, 0, 1, 1,
-1.123692, 0.7059761, -1.587743, 0, 0, 0, 1, 1,
-1.121318, 0.001045084, -0.8105041, 0, 0, 0, 1, 1,
-1.116531, 0.3627035, -0.07205468, 0, 0, 0, 1, 1,
-1.107534, 0.4671711, -1.254746, 1, 1, 1, 1, 1,
-1.103189, -0.6327002, -0.5747021, 1, 1, 1, 1, 1,
-1.100778, 0.1799836, -1.699026, 1, 1, 1, 1, 1,
-1.082555, -1.754918, -2.96013, 1, 1, 1, 1, 1,
-1.080856, 2.15905, -1.362504, 1, 1, 1, 1, 1,
-1.073088, -0.4573165, -3.485259, 1, 1, 1, 1, 1,
-1.073054, 0.4830156, 1.60743, 1, 1, 1, 1, 1,
-1.070739, -0.1587161, -0.798529, 1, 1, 1, 1, 1,
-1.069265, -1.161244, -2.774537, 1, 1, 1, 1, 1,
-1.064602, -1.170012, -2.691398, 1, 1, 1, 1, 1,
-1.063792, -0.3402298, -0.4897539, 1, 1, 1, 1, 1,
-1.063697, -0.5243549, 0.01703383, 1, 1, 1, 1, 1,
-1.062236, -0.12156, -2.594061, 1, 1, 1, 1, 1,
-1.060375, 1.661592, -1.262279, 1, 1, 1, 1, 1,
-1.052407, -0.5220838, -3.329152, 1, 1, 1, 1, 1,
-1.041611, -0.4005917, -1.214544, 0, 0, 1, 1, 1,
-1.036796, -0.6136817, -2.069043, 1, 0, 0, 1, 1,
-1.035104, 1.122692, 0.2873318, 1, 0, 0, 1, 1,
-1.033706, 0.002707723, -0.9099073, 1, 0, 0, 1, 1,
-1.030087, -0.8167723, -0.8138185, 1, 0, 0, 1, 1,
-1.029869, 0.6977191, -0.8864906, 1, 0, 0, 1, 1,
-1.028407, 1.441717, -2.150866, 0, 0, 0, 1, 1,
-1.02824, 3.586616, 0.8193051, 0, 0, 0, 1, 1,
-1.017537, -0.8809751, -1.821825, 0, 0, 0, 1, 1,
-1.005571, 0.1140197, -2.033455, 0, 0, 0, 1, 1,
-1.003091, 2.016825, -1.415282, 0, 0, 0, 1, 1,
-0.9957839, -1.041622, -2.375738, 0, 0, 0, 1, 1,
-0.9949629, -0.1782652, -1.067829, 0, 0, 0, 1, 1,
-0.9923449, 1.052923, -1.920935, 1, 1, 1, 1, 1,
-0.9881756, -0.6608705, -2.225806, 1, 1, 1, 1, 1,
-0.9875954, -0.6167344, -1.433161, 1, 1, 1, 1, 1,
-0.968804, -1.478315, -1.614313, 1, 1, 1, 1, 1,
-0.967934, 1.074958, 0.1760577, 1, 1, 1, 1, 1,
-0.9574997, -1.755904, -2.969874, 1, 1, 1, 1, 1,
-0.9526325, -1.46459, -2.467022, 1, 1, 1, 1, 1,
-0.9492237, 0.1800681, -1.572284, 1, 1, 1, 1, 1,
-0.9409695, 0.314272, -3.499015, 1, 1, 1, 1, 1,
-0.9406106, 0.3859912, -1.298678, 1, 1, 1, 1, 1,
-0.938199, 0.7130789, -2.013883, 1, 1, 1, 1, 1,
-0.9372979, -0.3845927, -2.801392, 1, 1, 1, 1, 1,
-0.9288622, -0.4873994, -4.940239, 1, 1, 1, 1, 1,
-0.9242179, 0.3168127, -2.509714, 1, 1, 1, 1, 1,
-0.917266, -1.131375, -1.88671, 1, 1, 1, 1, 1,
-0.9097712, -0.9635332, -3.214234, 0, 0, 1, 1, 1,
-0.9083144, -1.333969, -2.882147, 1, 0, 0, 1, 1,
-0.9036911, -0.5151898, -3.264088, 1, 0, 0, 1, 1,
-0.9003028, -0.7274421, -1.082501, 1, 0, 0, 1, 1,
-0.8999626, 1.010196, 0.2987203, 1, 0, 0, 1, 1,
-0.898151, -1.677504, -2.489594, 1, 0, 0, 1, 1,
-0.8954143, 0.3043415, -0.7840524, 0, 0, 0, 1, 1,
-0.8901127, 2.853616, 1.272534, 0, 0, 0, 1, 1,
-0.8865392, -1.077004, -3.141233, 0, 0, 0, 1, 1,
-0.8758719, 1.290204, -0.5963533, 0, 0, 0, 1, 1,
-0.8746417, -1.371185, -2.881565, 0, 0, 0, 1, 1,
-0.8690648, 0.3467902, -1.878419, 0, 0, 0, 1, 1,
-0.8690317, -0.1036958, -1.017631, 0, 0, 0, 1, 1,
-0.8662584, -2.101463, -3.416135, 1, 1, 1, 1, 1,
-0.8657892, -1.562918, -2.614515, 1, 1, 1, 1, 1,
-0.8644491, 2.290746, -1.227673, 1, 1, 1, 1, 1,
-0.8596423, -1.5398, -3.290257, 1, 1, 1, 1, 1,
-0.8572599, -0.8041119, -2.211004, 1, 1, 1, 1, 1,
-0.854441, -0.5430163, -1.026289, 1, 1, 1, 1, 1,
-0.8539056, 0.654055, -1.069656, 1, 1, 1, 1, 1,
-0.8502128, 0.6707557, -2.927066, 1, 1, 1, 1, 1,
-0.8466558, -0.7033732, -1.90999, 1, 1, 1, 1, 1,
-0.8405471, -1.570073, -1.861272, 1, 1, 1, 1, 1,
-0.8399695, -0.7762567, -0.4576223, 1, 1, 1, 1, 1,
-0.831794, -0.7616403, -1.441723, 1, 1, 1, 1, 1,
-0.829376, 0.1132112, -1.306827, 1, 1, 1, 1, 1,
-0.8284723, -0.6221941, -1.218215, 1, 1, 1, 1, 1,
-0.824117, -1.769771, -2.41276, 1, 1, 1, 1, 1,
-0.8195223, -0.5165812, -2.681671, 0, 0, 1, 1, 1,
-0.8193821, -1.444089, -2.659964, 1, 0, 0, 1, 1,
-0.8141784, 2.16297, -0.05087309, 1, 0, 0, 1, 1,
-0.7988551, 0.2849137, -1.82853, 1, 0, 0, 1, 1,
-0.7982392, 1.804079, -0.184301, 1, 0, 0, 1, 1,
-0.7971969, 0.3274799, -1.341769, 1, 0, 0, 1, 1,
-0.7900107, -0.667573, -3.433059, 0, 0, 0, 1, 1,
-0.7853618, -0.564081, -2.732105, 0, 0, 0, 1, 1,
-0.7853069, -0.1738057, -2.623685, 0, 0, 0, 1, 1,
-0.784418, 0.1501209, -3.16273, 0, 0, 0, 1, 1,
-0.7842871, -0.9093066, -3.657231, 0, 0, 0, 1, 1,
-0.7781974, -1.270222, -3.038632, 0, 0, 0, 1, 1,
-0.7766767, -0.6036254, -1.124922, 0, 0, 0, 1, 1,
-0.7722471, -1.018621, -3.135492, 1, 1, 1, 1, 1,
-0.7703876, -0.6579352, -2.230406, 1, 1, 1, 1, 1,
-0.7703009, -0.05029936, -1.718539, 1, 1, 1, 1, 1,
-0.7613679, -0.9311348, -2.181909, 1, 1, 1, 1, 1,
-0.7529477, -1.582526, -3.427346, 1, 1, 1, 1, 1,
-0.7454001, 0.1031476, -0.3492443, 1, 1, 1, 1, 1,
-0.7452804, 0.09308806, -0.6105778, 1, 1, 1, 1, 1,
-0.7432863, 0.5455183, -0.4645031, 1, 1, 1, 1, 1,
-0.7388292, 2.47121, -0.5436076, 1, 1, 1, 1, 1,
-0.7386868, 0.4598034, -1.368356, 1, 1, 1, 1, 1,
-0.7363091, 0.5687122, -2.2355, 1, 1, 1, 1, 1,
-0.7342736, 1.678716, -0.01536477, 1, 1, 1, 1, 1,
-0.7241304, 1.902995, 0.2769883, 1, 1, 1, 1, 1,
-0.7232137, -1.443399, 0.1299738, 1, 1, 1, 1, 1,
-0.7220004, 1.118894, -2.093321, 1, 1, 1, 1, 1,
-0.7211942, 0.08228205, -3.352314, 0, 0, 1, 1, 1,
-0.7164745, -0.4464201, -2.802384, 1, 0, 0, 1, 1,
-0.7108935, -0.5773345, -2.974211, 1, 0, 0, 1, 1,
-0.6968105, -0.2625232, -1.572572, 1, 0, 0, 1, 1,
-0.6908734, -0.4721013, -3.394209, 1, 0, 0, 1, 1,
-0.6904324, 0.1926138, -0.5312997, 1, 0, 0, 1, 1,
-0.6889145, -1.929232, -2.967206, 0, 0, 0, 1, 1,
-0.6860564, 0.1441771, -1.967788, 0, 0, 0, 1, 1,
-0.6841433, 2.151716, 0.2766452, 0, 0, 0, 1, 1,
-0.6841389, -1.432587, -1.597821, 0, 0, 0, 1, 1,
-0.680067, -0.3787155, -0.4578855, 0, 0, 0, 1, 1,
-0.6770319, 0.8860596, 1.189605, 0, 0, 0, 1, 1,
-0.6706645, 0.5320516, -1.874866, 0, 0, 0, 1, 1,
-0.664887, 0.7181161, -0.01385359, 1, 1, 1, 1, 1,
-0.6595212, 0.3055692, -0.3368021, 1, 1, 1, 1, 1,
-0.6543251, 0.02095836, -1.144007, 1, 1, 1, 1, 1,
-0.6522076, 0.0478696, -1.745339, 1, 1, 1, 1, 1,
-0.6518888, -0.5066983, -3.363346, 1, 1, 1, 1, 1,
-0.648394, 1.358588, -1.574026, 1, 1, 1, 1, 1,
-0.6427892, -0.4795585, -1.308808, 1, 1, 1, 1, 1,
-0.6376047, 0.07961531, -0.679798, 1, 1, 1, 1, 1,
-0.6361952, -0.4938102, -1.579093, 1, 1, 1, 1, 1,
-0.6348238, -0.7861091, -3.972673, 1, 1, 1, 1, 1,
-0.6313085, 0.7536324, 0.08344129, 1, 1, 1, 1, 1,
-0.6242974, -1.42937, -4.946493, 1, 1, 1, 1, 1,
-0.622062, 0.4270667, -2.33973, 1, 1, 1, 1, 1,
-0.6175334, 1.548642, -1.196511, 1, 1, 1, 1, 1,
-0.6168127, -0.03587614, -1.673188, 1, 1, 1, 1, 1,
-0.6155512, 0.8414364, -0.1850735, 0, 0, 1, 1, 1,
-0.6111705, -2.377831, -1.628255, 1, 0, 0, 1, 1,
-0.6046613, -0.1405094, -1.617056, 1, 0, 0, 1, 1,
-0.6038203, -1.584157, -0.6347854, 1, 0, 0, 1, 1,
-0.6031229, -0.4136854, -1.627621, 1, 0, 0, 1, 1,
-0.6002166, -0.1424621, -1.497205, 1, 0, 0, 1, 1,
-0.594969, 0.5353463, -0.3584657, 0, 0, 0, 1, 1,
-0.5947474, 1.19714, -0.9552495, 0, 0, 0, 1, 1,
-0.5915592, -0.2127459, -1.284616, 0, 0, 0, 1, 1,
-0.5908665, 1.157731, -1.586084, 0, 0, 0, 1, 1,
-0.5904357, 0.1112594, -1.142962, 0, 0, 0, 1, 1,
-0.5903457, 0.8957395, 0.5856121, 0, 0, 0, 1, 1,
-0.5857782, -0.4828898, -1.879564, 0, 0, 0, 1, 1,
-0.5852321, 0.5921339, 1.519856, 1, 1, 1, 1, 1,
-0.5842994, -1.570752, -2.250156, 1, 1, 1, 1, 1,
-0.5832877, -0.38179, -2.715719, 1, 1, 1, 1, 1,
-0.5828617, 0.6981248, -0.6561108, 1, 1, 1, 1, 1,
-0.582644, -1.325451, -2.703999, 1, 1, 1, 1, 1,
-0.5809518, 0.1476067, -1.365509, 1, 1, 1, 1, 1,
-0.5806652, -0.4691091, -2.662422, 1, 1, 1, 1, 1,
-0.576119, -0.4091285, -2.102968, 1, 1, 1, 1, 1,
-0.5732231, 1.37661, -0.4048223, 1, 1, 1, 1, 1,
-0.5606749, 1.083239, -0.2489979, 1, 1, 1, 1, 1,
-0.5600203, 1.220827, -0.4050922, 1, 1, 1, 1, 1,
-0.5581921, 0.2767746, -0.5415481, 1, 1, 1, 1, 1,
-0.555544, -0.4489549, -2.835962, 1, 1, 1, 1, 1,
-0.5545776, -0.8643665, -1.596364, 1, 1, 1, 1, 1,
-0.5540795, -0.9107145, -2.528327, 1, 1, 1, 1, 1,
-0.5519789, -0.3677357, -1.077796, 0, 0, 1, 1, 1,
-0.5475384, -0.8284878, -3.455825, 1, 0, 0, 1, 1,
-0.545958, 0.6605937, -0.2446325, 1, 0, 0, 1, 1,
-0.5446702, -0.182739, -2.650582, 1, 0, 0, 1, 1,
-0.5441326, 0.3530979, -1.111236, 1, 0, 0, 1, 1,
-0.537554, 0.7463986, -0.9642045, 1, 0, 0, 1, 1,
-0.5349771, -0.213561, -0.4976297, 0, 0, 0, 1, 1,
-0.5332189, 1.791855, -0.8616819, 0, 0, 0, 1, 1,
-0.5286629, 0.9020556, 0.5877765, 0, 0, 0, 1, 1,
-0.5285975, 0.09265818, -0.4994665, 0, 0, 0, 1, 1,
-0.5281915, 0.7814049, 0.08449274, 0, 0, 0, 1, 1,
-0.5221546, -0.533435, -4.353267, 0, 0, 0, 1, 1,
-0.5210139, -0.3155619, -2.803977, 0, 0, 0, 1, 1,
-0.5118863, 1.118646, 0.6159228, 1, 1, 1, 1, 1,
-0.5093867, 0.4641324, -0.8712189, 1, 1, 1, 1, 1,
-0.5081697, -1.399415, -3.05708, 1, 1, 1, 1, 1,
-0.5062238, 1.091151, -0.9265449, 1, 1, 1, 1, 1,
-0.5028444, -1.996483, -2.550106, 1, 1, 1, 1, 1,
-0.5000249, -0.6156464, -3.837364, 1, 1, 1, 1, 1,
-0.4957455, 0.6344693, -0.956526, 1, 1, 1, 1, 1,
-0.4948804, 0.6995721, -0.9225681, 1, 1, 1, 1, 1,
-0.4931011, -2.645513, -2.535312, 1, 1, 1, 1, 1,
-0.4921572, 0.3943837, -1.326994, 1, 1, 1, 1, 1,
-0.4844045, -0.1200193, -2.158531, 1, 1, 1, 1, 1,
-0.4843552, -1.667076, -4.200317, 1, 1, 1, 1, 1,
-0.4842618, 1.614847, -0.5186542, 1, 1, 1, 1, 1,
-0.4815113, 0.6683776, -3.08569, 1, 1, 1, 1, 1,
-0.4814577, -1.559543, -3.253901, 1, 1, 1, 1, 1,
-0.477871, -0.750446, -5.583644, 0, 0, 1, 1, 1,
-0.4763118, 1.017307, -1.975167, 1, 0, 0, 1, 1,
-0.4755906, 2.124451, 1.215064, 1, 0, 0, 1, 1,
-0.4701884, 0.4846745, 0.4555151, 1, 0, 0, 1, 1,
-0.4693098, 0.01834238, -0.6588196, 1, 0, 0, 1, 1,
-0.4689665, -0.3646664, -1.142381, 1, 0, 0, 1, 1,
-0.4646589, -0.4912712, -2.209315, 0, 0, 0, 1, 1,
-0.4642457, 1.232868, -2.836641, 0, 0, 0, 1, 1,
-0.4598814, 0.5267935, -2.242658, 0, 0, 0, 1, 1,
-0.4570293, 0.7480328, -0.02965599, 0, 0, 0, 1, 1,
-0.4528261, -1.131606, -2.949633, 0, 0, 0, 1, 1,
-0.4490752, -0.583303, -3.123746, 0, 0, 0, 1, 1,
-0.447368, 1.047682, -0.0184847, 0, 0, 0, 1, 1,
-0.439086, -0.2363015, -1.157738, 1, 1, 1, 1, 1,
-0.4372066, 1.345462, -0.4461557, 1, 1, 1, 1, 1,
-0.434748, -0.05091471, -1.208587, 1, 1, 1, 1, 1,
-0.4345307, -1.303355, -3.93874, 1, 1, 1, 1, 1,
-0.4301015, 0.06347932, -2.057692, 1, 1, 1, 1, 1,
-0.4288406, -0.714152, -1.095345, 1, 1, 1, 1, 1,
-0.4242253, 3.68136, -0.4640584, 1, 1, 1, 1, 1,
-0.4205094, -0.1252669, -1.246194, 1, 1, 1, 1, 1,
-0.4153764, 0.6436852, -0.6248819, 1, 1, 1, 1, 1,
-0.4089547, 0.8910266, -0.1466631, 1, 1, 1, 1, 1,
-0.4086622, -0.2993824, -2.166607, 1, 1, 1, 1, 1,
-0.4056848, -1.620065, -2.093222, 1, 1, 1, 1, 1,
-0.4040581, -0.9739984, -2.694962, 1, 1, 1, 1, 1,
-0.4034316, -0.9051224, -3.548878, 1, 1, 1, 1, 1,
-0.4022789, 1.076411, -0.6806555, 1, 1, 1, 1, 1,
-0.3957024, 0.551084, 0.8134637, 0, 0, 1, 1, 1,
-0.3948269, -0.7916054, -2.037309, 1, 0, 0, 1, 1,
-0.3939551, -1.324558, -1.231982, 1, 0, 0, 1, 1,
-0.3900404, 0.1691921, -1.361872, 1, 0, 0, 1, 1,
-0.389883, -0.9354045, -3.277462, 1, 0, 0, 1, 1,
-0.3875013, 0.3295646, -0.8515195, 1, 0, 0, 1, 1,
-0.3861758, -3.28837, -2.353391, 0, 0, 0, 1, 1,
-0.3855199, -0.7090068, -3.214951, 0, 0, 0, 1, 1,
-0.3834741, 1.43275, -1.364607, 0, 0, 0, 1, 1,
-0.3801952, 1.110757, 1.003133, 0, 0, 0, 1, 1,
-0.3762394, 0.9097927, -1.012234, 0, 0, 0, 1, 1,
-0.3756726, 0.8524666, 0.2092302, 0, 0, 0, 1, 1,
-0.3751509, 0.8396496, -0.21161, 0, 0, 0, 1, 1,
-0.3749473, -0.4787083, -3.58987, 1, 1, 1, 1, 1,
-0.3730653, 0.6892112, -0.6176684, 1, 1, 1, 1, 1,
-0.3590781, 0.8251804, 0.6799583, 1, 1, 1, 1, 1,
-0.3569345, -0.3323016, -2.816611, 1, 1, 1, 1, 1,
-0.3542275, 1.374417, -0.2152716, 1, 1, 1, 1, 1,
-0.3538307, -0.03513411, -3.017209, 1, 1, 1, 1, 1,
-0.3537187, -0.7305167, -2.430959, 1, 1, 1, 1, 1,
-0.3511447, 1.222534, -0.748475, 1, 1, 1, 1, 1,
-0.3508798, 1.808198, 0.0003197131, 1, 1, 1, 1, 1,
-0.3501494, 0.7668905, -0.3201939, 1, 1, 1, 1, 1,
-0.3485725, -0.9055572, -2.702077, 1, 1, 1, 1, 1,
-0.3457199, 0.5702099, -0.299803, 1, 1, 1, 1, 1,
-0.3415446, -1.656131, -2.628031, 1, 1, 1, 1, 1,
-0.3401676, 0.2517442, -0.4952902, 1, 1, 1, 1, 1,
-0.3393476, -1.808336, -2.164039, 1, 1, 1, 1, 1,
-0.3357927, 0.02870885, -2.723454, 0, 0, 1, 1, 1,
-0.3353696, -0.9321375, -2.09131, 1, 0, 0, 1, 1,
-0.335319, -0.3516404, -1.846126, 1, 0, 0, 1, 1,
-0.3332403, -0.809007, -3.550503, 1, 0, 0, 1, 1,
-0.3329849, -1.377613, -2.123742, 1, 0, 0, 1, 1,
-0.332846, 1.92184, -0.6957383, 1, 0, 0, 1, 1,
-0.3285671, -1.42537, -1.62902, 0, 0, 0, 1, 1,
-0.3271742, -0.5099408, -2.881157, 0, 0, 0, 1, 1,
-0.3240757, 0.5266588, 0.387996, 0, 0, 0, 1, 1,
-0.3224129, 0.2429384, -1.743275, 0, 0, 0, 1, 1,
-0.3199021, -1.385397, -2.315606, 0, 0, 0, 1, 1,
-0.3196335, 1.193305, -0.5698442, 0, 0, 0, 1, 1,
-0.3193716, 1.843942, -0.7178328, 0, 0, 0, 1, 1,
-0.3148384, -0.6246892, -0.4779581, 1, 1, 1, 1, 1,
-0.3129469, 0.2422098, 0.05146806, 1, 1, 1, 1, 1,
-0.3082237, -0.2824916, -3.129647, 1, 1, 1, 1, 1,
-0.3080654, 0.5866477, -1.389697, 1, 1, 1, 1, 1,
-0.3055107, -0.4784827, -4.267652, 1, 1, 1, 1, 1,
-0.3032817, 0.006477704, -0.5299842, 1, 1, 1, 1, 1,
-0.3026257, 1.579297, -0.8607721, 1, 1, 1, 1, 1,
-0.3016247, 0.5244403, -0.3781945, 1, 1, 1, 1, 1,
-0.2998139, -0.2094323, -2.612695, 1, 1, 1, 1, 1,
-0.2987488, 0.2820747, -0.4375337, 1, 1, 1, 1, 1,
-0.2971419, -0.3444673, -1.715011, 1, 1, 1, 1, 1,
-0.2969781, -1.158572, -4.367623, 1, 1, 1, 1, 1,
-0.2937039, -0.7216882, -2.910797, 1, 1, 1, 1, 1,
-0.2895068, 0.2982283, -0.810625, 1, 1, 1, 1, 1,
-0.2887176, -0.1593191, -1.746841, 1, 1, 1, 1, 1,
-0.2883864, 1.851407, 0.6025131, 0, 0, 1, 1, 1,
-0.2883213, 1.807057, 0.522779, 1, 0, 0, 1, 1,
-0.2879921, -1.679456, -4.340125, 1, 0, 0, 1, 1,
-0.2869439, 0.2456592, -0.5888212, 1, 0, 0, 1, 1,
-0.285183, 0.6405236, -1.35826, 1, 0, 0, 1, 1,
-0.2824163, 0.09269501, -1.203633, 1, 0, 0, 1, 1,
-0.2814941, -1.105208, -2.991554, 0, 0, 0, 1, 1,
-0.2798809, -0.4578018, -1.164835, 0, 0, 0, 1, 1,
-0.2779249, 1.406921, 1.161396, 0, 0, 0, 1, 1,
-0.2768395, 0.05548294, -1.388095, 0, 0, 0, 1, 1,
-0.2760719, 0.366861, 0.6248106, 0, 0, 0, 1, 1,
-0.2662043, 0.8083152, 0.3043501, 0, 0, 0, 1, 1,
-0.2632088, 1.43558, -1.429297, 0, 0, 0, 1, 1,
-0.2570249, -2.474825, -3.575283, 1, 1, 1, 1, 1,
-0.2567296, -1.381169, -2.110392, 1, 1, 1, 1, 1,
-0.2495731, -1.388254, -2.333833, 1, 1, 1, 1, 1,
-0.2489956, 0.2713027, 0.06821637, 1, 1, 1, 1, 1,
-0.2475866, -0.1739068, -0.7486762, 1, 1, 1, 1, 1,
-0.2470492, -1.693203, -4.143727, 1, 1, 1, 1, 1,
-0.2464214, 0.4827456, -1.854258, 1, 1, 1, 1, 1,
-0.2446785, -0.7527008, -4.746318, 1, 1, 1, 1, 1,
-0.2435235, 0.9963995, 0.9341981, 1, 1, 1, 1, 1,
-0.2401509, -2.194575, -2.482792, 1, 1, 1, 1, 1,
-0.2331711, 0.7670463, 0.7205094, 1, 1, 1, 1, 1,
-0.2290589, -0.05684326, -2.604559, 1, 1, 1, 1, 1,
-0.2285436, -1.930083, -2.744139, 1, 1, 1, 1, 1,
-0.2276626, 0.5026841, -1.936157, 1, 1, 1, 1, 1,
-0.2267151, -1.159544, -1.257499, 1, 1, 1, 1, 1,
-0.2264856, 0.5544561, -0.803462, 0, 0, 1, 1, 1,
-0.2253473, 0.0372646, -3.438294, 1, 0, 0, 1, 1,
-0.2231266, 1.745496, 1.082223, 1, 0, 0, 1, 1,
-0.2216558, -1.392557, -3.341007, 1, 0, 0, 1, 1,
-0.219164, -1.14349, -3.148663, 1, 0, 0, 1, 1,
-0.2171505, -0.6598225, -2.27427, 1, 0, 0, 1, 1,
-0.2163436, 0.2915756, -1.374101, 0, 0, 0, 1, 1,
-0.2161319, 0.07444938, -0.875219, 0, 0, 0, 1, 1,
-0.2136694, -0.1952635, -0.5006896, 0, 0, 0, 1, 1,
-0.2081917, -0.09178717, -1.368678, 0, 0, 0, 1, 1,
-0.2003261, -1.183891, -2.255169, 0, 0, 0, 1, 1,
-0.199641, -0.8346586, -1.404319, 0, 0, 0, 1, 1,
-0.198943, -0.366199, -1.063448, 0, 0, 0, 1, 1,
-0.1898609, -0.04297629, -1.185933, 1, 1, 1, 1, 1,
-0.1869334, 0.731304, 1.311628, 1, 1, 1, 1, 1,
-0.1865005, -1.189157, -3.22087, 1, 1, 1, 1, 1,
-0.1812031, -0.3357259, -3.645083, 1, 1, 1, 1, 1,
-0.1799633, 3.219749, -0.5841763, 1, 1, 1, 1, 1,
-0.1750289, -0.6600465, -3.267619, 1, 1, 1, 1, 1,
-0.1734475, -1.113974, -3.66262, 1, 1, 1, 1, 1,
-0.1720146, 0.6815304, -0.2742581, 1, 1, 1, 1, 1,
-0.1594045, 0.4422968, -0.4876801, 1, 1, 1, 1, 1,
-0.1571476, -0.7524163, -1.514504, 1, 1, 1, 1, 1,
-0.1537975, -1.215542, -3.192485, 1, 1, 1, 1, 1,
-0.1484903, 0.795584, 0.5902154, 1, 1, 1, 1, 1,
-0.1426185, -2.022285, -4.062332, 1, 1, 1, 1, 1,
-0.141905, -2.912514, -3.097677, 1, 1, 1, 1, 1,
-0.1341841, -0.7306306, -4.777219, 1, 1, 1, 1, 1,
-0.1338526, 0.1092767, -0.5237395, 0, 0, 1, 1, 1,
-0.1317105, 0.4901288, 1.015661, 1, 0, 0, 1, 1,
-0.1304514, -0.7862335, -3.321797, 1, 0, 0, 1, 1,
-0.1260029, 1.066116, -0.1129432, 1, 0, 0, 1, 1,
-0.1259376, -0.472501, -2.409691, 1, 0, 0, 1, 1,
-0.1225493, 1.050629, 0.9901104, 1, 0, 0, 1, 1,
-0.1214119, -1.809143, -1.393255, 0, 0, 0, 1, 1,
-0.1195086, 0.08479371, -0.1671844, 0, 0, 0, 1, 1,
-0.1162234, -1.008877, -3.650917, 0, 0, 0, 1, 1,
-0.1142537, 0.1833107, -1.497249, 0, 0, 0, 1, 1,
-0.1139465, 1.785376, 0.02146246, 0, 0, 0, 1, 1,
-0.1103445, 0.3131237, 0.4750152, 0, 0, 0, 1, 1,
-0.1064942, -0.1680831, -3.661585, 0, 0, 0, 1, 1,
-0.1014246, -0.1346685, -3.178389, 1, 1, 1, 1, 1,
-0.09996872, -0.2618486, -3.560566, 1, 1, 1, 1, 1,
-0.09707277, -0.1074421, -1.627004, 1, 1, 1, 1, 1,
-0.09559109, 0.03167916, -1.381396, 1, 1, 1, 1, 1,
-0.09433372, -0.1011733, -2.553475, 1, 1, 1, 1, 1,
-0.0877788, -1.475557, -1.339754, 1, 1, 1, 1, 1,
-0.0844611, 0.6951391, -0.9262307, 1, 1, 1, 1, 1,
-0.08444134, 0.9488742, -1.986264, 1, 1, 1, 1, 1,
-0.07952917, 0.9972101, -1.394019, 1, 1, 1, 1, 1,
-0.07739685, -0.8506581, -3.799951, 1, 1, 1, 1, 1,
-0.07448885, -0.7364914, -4.498312, 1, 1, 1, 1, 1,
-0.07412609, -0.4126163, -4.684481, 1, 1, 1, 1, 1,
-0.07403421, 0.5524983, -0.03746185, 1, 1, 1, 1, 1,
-0.07306173, 0.6042808, -0.940563, 1, 1, 1, 1, 1,
-0.07055669, 2.558244, -0.301484, 1, 1, 1, 1, 1,
-0.06946478, 1.826857, -0.1684163, 0, 0, 1, 1, 1,
-0.06917324, -0.1310789, -2.228778, 1, 0, 0, 1, 1,
-0.06591649, -0.8617238, -3.624536, 1, 0, 0, 1, 1,
-0.06212529, -1.811281, -4.779219, 1, 0, 0, 1, 1,
-0.05960243, 0.8934052, 0.2076239, 1, 0, 0, 1, 1,
-0.05941429, -1.03204, -3.413942, 1, 0, 0, 1, 1,
-0.05641713, 1.024786, 0.81717, 0, 0, 0, 1, 1,
-0.05249291, 0.3443555, 1.097571, 0, 0, 0, 1, 1,
-0.05122054, -1.375667, -4.686507, 0, 0, 0, 1, 1,
-0.05115883, -1.041093, -3.137667, 0, 0, 0, 1, 1,
-0.04805004, 1.864877, 0.06939442, 0, 0, 0, 1, 1,
-0.03875856, 0.9472266, -0.2115109, 0, 0, 0, 1, 1,
-0.03776584, -0.877072, -3.381397, 0, 0, 0, 1, 1,
-0.03628527, 1.970242, -0.7955229, 1, 1, 1, 1, 1,
-0.03625343, -0.4304094, -2.315072, 1, 1, 1, 1, 1,
-0.0356582, 0.7878131, -0.3132833, 1, 1, 1, 1, 1,
-0.02932827, 0.87265, -0.8514643, 1, 1, 1, 1, 1,
-0.02546515, -2.040082, -3.353883, 1, 1, 1, 1, 1,
-0.02388937, -0.3917243, -4.108045, 1, 1, 1, 1, 1,
-0.02097348, -0.5838512, -4.546999, 1, 1, 1, 1, 1,
-0.02015879, -1.502504, -3.31474, 1, 1, 1, 1, 1,
-0.01993799, 0.1747858, 1.118021, 1, 1, 1, 1, 1,
-0.01940573, 0.02399253, -0.2699887, 1, 1, 1, 1, 1,
-0.01763253, 1.592672, 1.282121, 1, 1, 1, 1, 1,
-0.01733258, -0.4540477, -3.082627, 1, 1, 1, 1, 1,
-0.01546943, -0.42491, -4.705121, 1, 1, 1, 1, 1,
-0.01529362, -1.545619, -2.989305, 1, 1, 1, 1, 1,
-0.01461723, -0.4958988, -2.374973, 1, 1, 1, 1, 1,
-0.01445064, -1.240169, -2.734998, 0, 0, 1, 1, 1,
-0.009292044, 0.4821433, -0.06388476, 1, 0, 0, 1, 1,
-0.008759645, 0.9407052, 2.454534, 1, 0, 0, 1, 1,
-0.005521891, -0.8399864, -3.772577, 1, 0, 0, 1, 1,
0.0009256604, 0.1088289, -0.4556333, 1, 0, 0, 1, 1,
0.001797697, 0.4271278, -0.8151061, 1, 0, 0, 1, 1,
0.002748916, 0.8087982, -1.160818, 0, 0, 0, 1, 1,
0.005898056, -0.7534553, 2.314541, 0, 0, 0, 1, 1,
0.009322654, 0.3278924, -0.6488567, 0, 0, 0, 1, 1,
0.00957649, 0.8037819, 1.000489, 0, 0, 0, 1, 1,
0.01043619, 0.4536033, 0.1322636, 0, 0, 0, 1, 1,
0.01370614, -0.8411744, 4.819504, 0, 0, 0, 1, 1,
0.02451486, -0.3449023, 0.7302076, 0, 0, 0, 1, 1,
0.02489162, 0.0938958, 0.4024136, 1, 1, 1, 1, 1,
0.02641868, -0.6346114, 3.586874, 1, 1, 1, 1, 1,
0.02789903, 0.02373288, -0.1085088, 1, 1, 1, 1, 1,
0.02965364, -0.1910693, 3.951575, 1, 1, 1, 1, 1,
0.0297798, 0.7693416, -1.827226, 1, 1, 1, 1, 1,
0.03045638, 1.579118, 0.8081824, 1, 1, 1, 1, 1,
0.03231837, 1.400481, 0.7310144, 1, 1, 1, 1, 1,
0.03413307, 0.1956491, -0.2882125, 1, 1, 1, 1, 1,
0.04003402, 0.5187725, -0.3478392, 1, 1, 1, 1, 1,
0.04277682, 0.3302524, -0.3359784, 1, 1, 1, 1, 1,
0.04368647, 0.1959014, 0.5993819, 1, 1, 1, 1, 1,
0.04512096, 0.01355406, 1.380921, 1, 1, 1, 1, 1,
0.04723682, -1.070542, 2.503443, 1, 1, 1, 1, 1,
0.04734472, -1.1843, 2.563834, 1, 1, 1, 1, 1,
0.04823415, -0.007509304, 0.788258, 1, 1, 1, 1, 1,
0.0517506, -1.060085, 2.842279, 0, 0, 1, 1, 1,
0.0522803, 0.7258191, 1.340585, 1, 0, 0, 1, 1,
0.05564526, 0.2391075, -1.284722, 1, 0, 0, 1, 1,
0.05892754, 1.062695, 0.9966185, 1, 0, 0, 1, 1,
0.06115246, 0.3051302, 0.8237579, 1, 0, 0, 1, 1,
0.06289569, -0.1220821, 3.099512, 1, 0, 0, 1, 1,
0.06316523, 0.2615749, 1.492828, 0, 0, 0, 1, 1,
0.07363761, -2.653849, 3.216206, 0, 0, 0, 1, 1,
0.08229503, 0.06052784, 1.44889, 0, 0, 0, 1, 1,
0.08429208, -0.185152, 2.462736, 0, 0, 0, 1, 1,
0.08515386, 0.3907165, 0.4244095, 0, 0, 0, 1, 1,
0.09678846, -0.3532548, 4.129478, 0, 0, 0, 1, 1,
0.09806488, -2.20958, 3.800009, 0, 0, 0, 1, 1,
0.1002102, -0.6001521, 3.100574, 1, 1, 1, 1, 1,
0.1017656, 0.627426, 1.294238, 1, 1, 1, 1, 1,
0.1032946, -0.1025485, 3.352727, 1, 1, 1, 1, 1,
0.1058525, -1.112552, 3.575312, 1, 1, 1, 1, 1,
0.1156823, -1.110893, 3.429479, 1, 1, 1, 1, 1,
0.1167064, -0.6688039, 3.639409, 1, 1, 1, 1, 1,
0.1202879, -0.07172325, 2.196521, 1, 1, 1, 1, 1,
0.1218654, 0.8206764, -1.444273, 1, 1, 1, 1, 1,
0.1229112, 0.4992161, -0.3042969, 1, 1, 1, 1, 1,
0.1231655, 0.9799003, 0.2427596, 1, 1, 1, 1, 1,
0.1258464, 0.176805, 1.367664, 1, 1, 1, 1, 1,
0.1281958, 1.122523, -0.4099965, 1, 1, 1, 1, 1,
0.1283195, -0.3094236, 2.516118, 1, 1, 1, 1, 1,
0.1309064, 0.05931444, 0.9101268, 1, 1, 1, 1, 1,
0.1323964, 1.080534, 0.9098712, 1, 1, 1, 1, 1,
0.1347586, -0.7900481, 2.375305, 0, 0, 1, 1, 1,
0.1354989, -0.1741129, 2.516866, 1, 0, 0, 1, 1,
0.1362447, 0.256079, -0.2473555, 1, 0, 0, 1, 1,
0.1379493, -0.7977846, 1.732408, 1, 0, 0, 1, 1,
0.1382008, -0.08083747, 1.167961, 1, 0, 0, 1, 1,
0.1457367, 1.437699, 0.3238463, 1, 0, 0, 1, 1,
0.1485639, 1.250444, 0.1829924, 0, 0, 0, 1, 1,
0.1502347, 0.1635766, 0.6368152, 0, 0, 0, 1, 1,
0.1517925, 0.8396358, -0.232054, 0, 0, 0, 1, 1,
0.1557658, 0.1333705, 0.7924006, 0, 0, 0, 1, 1,
0.160995, 0.4194452, 1.896415, 0, 0, 0, 1, 1,
0.1610103, 0.2281727, 1.103094, 0, 0, 0, 1, 1,
0.1646543, 1.000452, -3.477948, 0, 0, 0, 1, 1,
0.1742017, -0.594466, 2.370721, 1, 1, 1, 1, 1,
0.1790644, -0.5412286, 2.92933, 1, 1, 1, 1, 1,
0.1797101, 0.8940186, 0.09841264, 1, 1, 1, 1, 1,
0.1832601, 0.1650319, -0.7831327, 1, 1, 1, 1, 1,
0.1848693, -1.296992, 2.288393, 1, 1, 1, 1, 1,
0.1887672, 0.2120014, 0.6235279, 1, 1, 1, 1, 1,
0.1924018, -1.244465, 2.951589, 1, 1, 1, 1, 1,
0.1943699, 1.719494, 1.696589, 1, 1, 1, 1, 1,
0.1978051, 1.298173, 0.2865888, 1, 1, 1, 1, 1,
0.1981537, -1.351502, 3.675148, 1, 1, 1, 1, 1,
0.2007893, -0.2512222, 2.396054, 1, 1, 1, 1, 1,
0.2066255, -0.3852117, 2.384442, 1, 1, 1, 1, 1,
0.2077173, -1.984632, 1.144337, 1, 1, 1, 1, 1,
0.2123917, -0.8473348, 3.438435, 1, 1, 1, 1, 1,
0.2152318, -1.212078, 3.878827, 1, 1, 1, 1, 1,
0.2155674, 1.159311, 1.349594, 0, 0, 1, 1, 1,
0.2170338, 1.19871, -0.009056549, 1, 0, 0, 1, 1,
0.2257339, 1.128672, -0.8555709, 1, 0, 0, 1, 1,
0.2266181, -0.3659417, 3.546001, 1, 0, 0, 1, 1,
0.2289406, 1.468475, 0.480931, 1, 0, 0, 1, 1,
0.2293124, -0.04954535, -0.4300496, 1, 0, 0, 1, 1,
0.2294326, -1.999899, 3.403345, 0, 0, 0, 1, 1,
0.2368583, -1.670825, 2.620708, 0, 0, 0, 1, 1,
0.241892, -0.2844324, 3.665892, 0, 0, 0, 1, 1,
0.2420431, -0.3443615, 1.459583, 0, 0, 0, 1, 1,
0.247875, 0.4491982, 0.8573713, 0, 0, 0, 1, 1,
0.2506799, -0.1010499, 2.540688, 0, 0, 0, 1, 1,
0.251822, 0.1815514, 2.084996, 0, 0, 0, 1, 1,
0.2522531, -0.5071843, 2.85662, 1, 1, 1, 1, 1,
0.2522927, -0.1366965, 1.703396, 1, 1, 1, 1, 1,
0.2541378, -0.9962965, 1.917481, 1, 1, 1, 1, 1,
0.2547715, -1.19562, 3.217555, 1, 1, 1, 1, 1,
0.2555974, 0.8146747, 0.2004665, 1, 1, 1, 1, 1,
0.2579244, 1.520455, -0.3558509, 1, 1, 1, 1, 1,
0.2649663, -0.2419753, 3.147146, 1, 1, 1, 1, 1,
0.2716698, 1.020312, -0.4062918, 1, 1, 1, 1, 1,
0.2804754, 0.4966352, -0.7718669, 1, 1, 1, 1, 1,
0.2845146, 0.6712353, 0.3641843, 1, 1, 1, 1, 1,
0.2850531, -1.550303, 3.180225, 1, 1, 1, 1, 1,
0.2883653, 0.01387284, 2.284729, 1, 1, 1, 1, 1,
0.2895148, 0.3914161, 2.030452, 1, 1, 1, 1, 1,
0.2949353, -0.01541846, 1.285439, 1, 1, 1, 1, 1,
0.2954806, -0.8827081, 0.8945801, 1, 1, 1, 1, 1,
0.3045983, 0.1591866, -0.4948369, 0, 0, 1, 1, 1,
0.3047046, 1.007125, -0.3308256, 1, 0, 0, 1, 1,
0.308097, 1.421207, -0.122956, 1, 0, 0, 1, 1,
0.3082744, -0.3715983, 1.811973, 1, 0, 0, 1, 1,
0.3103811, 0.2498701, 0.08879014, 1, 0, 0, 1, 1,
0.3106441, 2.456132, 0.4982501, 1, 0, 0, 1, 1,
0.3111327, -2.032289, 3.462539, 0, 0, 0, 1, 1,
0.3119113, -0.8378486, 3.757476, 0, 0, 0, 1, 1,
0.317108, -1.13005, 3.459226, 0, 0, 0, 1, 1,
0.3208188, 0.7429674, 0.3832973, 0, 0, 0, 1, 1,
0.3219994, -1.351767, 3.280762, 0, 0, 0, 1, 1,
0.3267527, 0.9302761, 1.929358, 0, 0, 0, 1, 1,
0.3309382, -0.3256801, 3.057033, 0, 0, 0, 1, 1,
0.3350523, 0.8280507, 0.9056078, 1, 1, 1, 1, 1,
0.3390557, 0.9047049, 1.301166, 1, 1, 1, 1, 1,
0.3401239, 0.6173785, 0.9881821, 1, 1, 1, 1, 1,
0.3448863, -0.5849344, 1.914475, 1, 1, 1, 1, 1,
0.3497079, 1.717377, -2.728291, 1, 1, 1, 1, 1,
0.3519424, -0.1508536, 1.050642, 1, 1, 1, 1, 1,
0.3523067, 0.9969847, -2.441907, 1, 1, 1, 1, 1,
0.3533746, -0.2804545, 4.050175, 1, 1, 1, 1, 1,
0.3571562, 0.2129905, 0.3250527, 1, 1, 1, 1, 1,
0.3574099, 0.1185602, 2.828847, 1, 1, 1, 1, 1,
0.3583663, 0.4296249, 0.5733256, 1, 1, 1, 1, 1,
0.3606042, 0.8190488, 0.700584, 1, 1, 1, 1, 1,
0.3632034, 1.589353, 2.410903, 1, 1, 1, 1, 1,
0.3640366, 0.8416447, 0.3892452, 1, 1, 1, 1, 1,
0.3642444, -1.962247, 2.743408, 1, 1, 1, 1, 1,
0.3659445, -1.400427, 2.377589, 0, 0, 1, 1, 1,
0.366041, -0.3406146, 2.188991, 1, 0, 0, 1, 1,
0.3664949, 0.0608756, 2.505248, 1, 0, 0, 1, 1,
0.3669091, 0.6418216, 0.7799143, 1, 0, 0, 1, 1,
0.3680393, 2.455839, -0.8393027, 1, 0, 0, 1, 1,
0.3712228, 1.249655, -0.6613975, 1, 0, 0, 1, 1,
0.3720189, 0.7256108, 0.7127725, 0, 0, 0, 1, 1,
0.3739465, -0.3045295, 1.947627, 0, 0, 0, 1, 1,
0.3766832, -0.3962433, 2.478739, 0, 0, 0, 1, 1,
0.3767063, 1.114488, 1.307611, 0, 0, 0, 1, 1,
0.3796551, -0.2030415, 2.117519, 0, 0, 0, 1, 1,
0.3849848, -0.2622675, 3.395939, 0, 0, 0, 1, 1,
0.3878511, 0.6808978, -0.1388555, 0, 0, 0, 1, 1,
0.3896529, -0.6231006, 1.975527, 1, 1, 1, 1, 1,
0.3946576, -0.3147872, 2.016816, 1, 1, 1, 1, 1,
0.3968138, -0.3377465, 2.105849, 1, 1, 1, 1, 1,
0.3990814, 0.1338645, 0.8772385, 1, 1, 1, 1, 1,
0.3993545, -1.428084, 4.623949, 1, 1, 1, 1, 1,
0.4116288, -1.38586, 3.724015, 1, 1, 1, 1, 1,
0.4202724, 0.1082609, 2.179608, 1, 1, 1, 1, 1,
0.4205513, -0.08427686, 2.813973, 1, 1, 1, 1, 1,
0.421114, -1.849859, 2.162514, 1, 1, 1, 1, 1,
0.4233285, 0.924592, -0.02505884, 1, 1, 1, 1, 1,
0.4284992, -2.119921, 3.61457, 1, 1, 1, 1, 1,
0.4307987, 0.6613685, 1.779475, 1, 1, 1, 1, 1,
0.4416763, 2.258737, -0.1286084, 1, 1, 1, 1, 1,
0.4436864, -0.05930116, 1.973957, 1, 1, 1, 1, 1,
0.4452558, -0.432143, 3.416431, 1, 1, 1, 1, 1,
0.4491326, 0.5059316, 0.4400919, 0, 0, 1, 1, 1,
0.4518155, 0.3775096, 2.109313, 1, 0, 0, 1, 1,
0.4521798, 1.586253, 1.032193, 1, 0, 0, 1, 1,
0.4522062, -0.4712618, 1.743944, 1, 0, 0, 1, 1,
0.4573244, 1.296385, 0.9506405, 1, 0, 0, 1, 1,
0.4600193, -0.5442404, 2.599237, 1, 0, 0, 1, 1,
0.4655448, -0.1756483, 2.676134, 0, 0, 0, 1, 1,
0.4688438, -1.065991, 2.408826, 0, 0, 0, 1, 1,
0.4726817, -2.063597, 3.020853, 0, 0, 0, 1, 1,
0.4741984, -0.3366406, 1.671093, 0, 0, 0, 1, 1,
0.4752748, -1.108368, 2.095981, 0, 0, 0, 1, 1,
0.4778304, 0.05060222, 2.298678, 0, 0, 0, 1, 1,
0.4784343, -1.579922, 1.620511, 0, 0, 0, 1, 1,
0.4809, -0.3936746, 4.176755, 1, 1, 1, 1, 1,
0.4858021, 0.9431177, 0.1874687, 1, 1, 1, 1, 1,
0.4873461, 0.04476038, 2.281682, 1, 1, 1, 1, 1,
0.4877751, 0.2356202, 1.528643, 1, 1, 1, 1, 1,
0.4914285, -0.79639, 2.075855, 1, 1, 1, 1, 1,
0.4933894, 0.3123603, 0.4802846, 1, 1, 1, 1, 1,
0.4958131, -2.216602, 2.166635, 1, 1, 1, 1, 1,
0.4997993, -1.337898, 0.3110996, 1, 1, 1, 1, 1,
0.5002856, 1.200744, 0.1967077, 1, 1, 1, 1, 1,
0.5010892, 0.2424508, 1.866153, 1, 1, 1, 1, 1,
0.5021174, -0.06686928, 1.214196, 1, 1, 1, 1, 1,
0.5078326, -0.4196301, 1.241212, 1, 1, 1, 1, 1,
0.5081694, -0.8114209, 2.755931, 1, 1, 1, 1, 1,
0.5089784, 1.730763, 0.2520916, 1, 1, 1, 1, 1,
0.510029, 0.7969143, -0.5023845, 1, 1, 1, 1, 1,
0.5119405, 0.3920016, 1.119164, 0, 0, 1, 1, 1,
0.5122604, -1.79458, 1.74345, 1, 0, 0, 1, 1,
0.5133573, -0.9196939, 3.394508, 1, 0, 0, 1, 1,
0.5219044, -1.292064, 4.818063, 1, 0, 0, 1, 1,
0.5225559, -1.326598, 3.159844, 1, 0, 0, 1, 1,
0.5241399, -0.3488777, 3.239865, 1, 0, 0, 1, 1,
0.5254502, -0.5590878, -0.5401777, 0, 0, 0, 1, 1,
0.5255425, 0.3695474, -0.387551, 0, 0, 0, 1, 1,
0.5276635, -1.185026, 2.803158, 0, 0, 0, 1, 1,
0.5316005, -0.1229904, 0.2179013, 0, 0, 0, 1, 1,
0.5353073, -0.4431929, 2.491838, 0, 0, 0, 1, 1,
0.537493, -0.840925, 1.605603, 0, 0, 0, 1, 1,
0.5420364, -1.070277, 0.9955682, 0, 0, 0, 1, 1,
0.5436818, -0.1810016, 4.254614, 1, 1, 1, 1, 1,
0.5445184, -0.3881011, 2.809648, 1, 1, 1, 1, 1,
0.5464534, -0.3440971, 3.865877, 1, 1, 1, 1, 1,
0.5475206, -1.0184, 1.321307, 1, 1, 1, 1, 1,
0.5549787, 1.249605, -2.328587, 1, 1, 1, 1, 1,
0.5584536, -1.940589, 2.197601, 1, 1, 1, 1, 1,
0.5598147, -0.5335974, 1.331326, 1, 1, 1, 1, 1,
0.562122, -0.4151683, 1.384607, 1, 1, 1, 1, 1,
0.5871738, 0.4119739, -0.1615271, 1, 1, 1, 1, 1,
0.5909275, 0.4003924, -0.6422262, 1, 1, 1, 1, 1,
0.5931013, 0.2095832, -0.3311623, 1, 1, 1, 1, 1,
0.5953442, 0.0757922, 1.949229, 1, 1, 1, 1, 1,
0.5991766, 0.6266137, 2.060488, 1, 1, 1, 1, 1,
0.6029006, 0.04828871, 1.53875, 1, 1, 1, 1, 1,
0.6080598, -0.4932828, 1.408047, 1, 1, 1, 1, 1,
0.6096117, 0.870874, -1.02593, 0, 0, 1, 1, 1,
0.6103901, -0.3278526, 2.672922, 1, 0, 0, 1, 1,
0.6107743, 1.023042, 1.386017, 1, 0, 0, 1, 1,
0.6137224, 0.6897808, -0.002294873, 1, 0, 0, 1, 1,
0.6158107, -0.1495254, 0.4974951, 1, 0, 0, 1, 1,
0.6257615, 1.467963, -0.08389589, 1, 0, 0, 1, 1,
0.6287205, 0.1041866, 2.14435, 0, 0, 0, 1, 1,
0.6314886, 1.277311, 0.5060515, 0, 0, 0, 1, 1,
0.632336, 0.9191933, 0.33741, 0, 0, 0, 1, 1,
0.6345256, -0.3483607, 2.057481, 0, 0, 0, 1, 1,
0.635241, 0.09893813, 1.199912, 0, 0, 0, 1, 1,
0.6367463, -0.8442565, 2.841408, 0, 0, 0, 1, 1,
0.6387739, 0.6820623, 1.739746, 0, 0, 0, 1, 1,
0.641162, -0.5403795, 2.404258, 1, 1, 1, 1, 1,
0.6482009, -0.6736566, 1.039359, 1, 1, 1, 1, 1,
0.6484029, -0.780663, -0.3994485, 1, 1, 1, 1, 1,
0.6520079, 0.8914352, -0.8869833, 1, 1, 1, 1, 1,
0.6582687, -0.1484426, 0.3919688, 1, 1, 1, 1, 1,
0.6643137, -1.468922, 0.6214485, 1, 1, 1, 1, 1,
0.6721928, 0.7837461, -0.6065642, 1, 1, 1, 1, 1,
0.6778031, -0.1663837, 0.06653488, 1, 1, 1, 1, 1,
0.6795338, -1.111474, 2.354276, 1, 1, 1, 1, 1,
0.6843663, 1.24838, 1.630316, 1, 1, 1, 1, 1,
0.6852552, 0.671827, 0.9089741, 1, 1, 1, 1, 1,
0.686893, -1.309651, 3.6336, 1, 1, 1, 1, 1,
0.6873763, -0.2417592, 4.098863, 1, 1, 1, 1, 1,
0.6884219, 0.3122394, -1.123663, 1, 1, 1, 1, 1,
0.6885503, 0.4384408, 2.393234, 1, 1, 1, 1, 1,
0.6940961, 0.8349728, 2.085195, 0, 0, 1, 1, 1,
0.702951, -0.4553174, 0.8056283, 1, 0, 0, 1, 1,
0.7078741, 0.1789399, 1.328685, 1, 0, 0, 1, 1,
0.7087259, -0.2534104, 1.494314, 1, 0, 0, 1, 1,
0.7088703, -0.2758527, 1.776932, 1, 0, 0, 1, 1,
0.7103847, 0.701682, 0.8498348, 1, 0, 0, 1, 1,
0.7156326, -2.179692, 3.101651, 0, 0, 0, 1, 1,
0.7207192, 1.618737, 1.748392, 0, 0, 0, 1, 1,
0.7208846, -0.8288159, 2.218092, 0, 0, 0, 1, 1,
0.7211667, 0.389892, 0.6649068, 0, 0, 0, 1, 1,
0.7261994, 1.008836, 0.3053427, 0, 0, 0, 1, 1,
0.7275177, 0.2474813, 1.128878, 0, 0, 0, 1, 1,
0.7295462, -0.03066757, -0.5445682, 0, 0, 0, 1, 1,
0.7297256, 1.556589, 0.4817651, 1, 1, 1, 1, 1,
0.7300315, 1.959829, -1.096024, 1, 1, 1, 1, 1,
0.7343693, -1.741071, 2.120346, 1, 1, 1, 1, 1,
0.7404191, -0.417191, 1.968307, 1, 1, 1, 1, 1,
0.7429298, -0.5229214, 1.758895, 1, 1, 1, 1, 1,
0.7515254, 0.4713276, 2.314794, 1, 1, 1, 1, 1,
0.7534874, 0.4334104, 3.669139, 1, 1, 1, 1, 1,
0.7560529, 0.2801859, 0.2617229, 1, 1, 1, 1, 1,
0.7593197, -0.064885, 1.655922, 1, 1, 1, 1, 1,
0.7610801, 1.223507, 0.5450311, 1, 1, 1, 1, 1,
0.761875, 1.076296, 0.3706688, 1, 1, 1, 1, 1,
0.7641196, -0.8700085, 3.929413, 1, 1, 1, 1, 1,
0.7680445, -0.865303, 1.470059, 1, 1, 1, 1, 1,
0.7690412, -0.7255911, 3.628301, 1, 1, 1, 1, 1,
0.7803546, -0.5702066, 3.200995, 1, 1, 1, 1, 1,
0.7823752, 1.240369, 1.526944, 0, 0, 1, 1, 1,
0.7873216, 0.1427825, 0.7441442, 1, 0, 0, 1, 1,
0.7882751, -2.638151, 5.00683, 1, 0, 0, 1, 1,
0.7892146, -1.688959, 1.777046, 1, 0, 0, 1, 1,
0.7901548, -1.385214, 1.866772, 1, 0, 0, 1, 1,
0.7924177, -0.1709804, 1.091352, 1, 0, 0, 1, 1,
0.7945133, -0.2624909, 1.926292, 0, 0, 0, 1, 1,
0.7945904, -0.328329, 0.3074891, 0, 0, 0, 1, 1,
0.8002952, 1.378234, -0.1458079, 0, 0, 0, 1, 1,
0.8040412, -0.7658373, 1.776235, 0, 0, 0, 1, 1,
0.8083884, 0.0959639, 2.161275, 0, 0, 0, 1, 1,
0.8086441, 0.6253465, 0.3355731, 0, 0, 0, 1, 1,
0.8200201, 1.270108, 0.3197209, 0, 0, 0, 1, 1,
0.8244724, -0.752618, 1.575446, 1, 1, 1, 1, 1,
0.824545, -3.889422, 2.114012, 1, 1, 1, 1, 1,
0.8262131, 0.6371819, 1.069202, 1, 1, 1, 1, 1,
0.8290359, 1.10252, -0.9280942, 1, 1, 1, 1, 1,
0.8293601, -0.3863038, 0.6542292, 1, 1, 1, 1, 1,
0.8428617, -0.5058308, 1.329815, 1, 1, 1, 1, 1,
0.8474779, 0.8067788, 0.7199849, 1, 1, 1, 1, 1,
0.8517455, 2.397953, 0.4519598, 1, 1, 1, 1, 1,
0.8525208, -0.06559304, 3.531026, 1, 1, 1, 1, 1,
0.8548652, 1.420348, -0.4737375, 1, 1, 1, 1, 1,
0.8660359, 1.628097, 0.5195805, 1, 1, 1, 1, 1,
0.8743935, 0.04617522, 1.425612, 1, 1, 1, 1, 1,
0.876658, 0.008060099, 0.2573721, 1, 1, 1, 1, 1,
0.8770987, -0.04454105, 2.047965, 1, 1, 1, 1, 1,
0.8777673, 0.09251184, 3.525845, 1, 1, 1, 1, 1,
0.8886449, -1.009419, 0.5900017, 0, 0, 1, 1, 1,
0.8946413, -1.047085, 2.079171, 1, 0, 0, 1, 1,
0.8995606, 0.4019868, 1.439711, 1, 0, 0, 1, 1,
0.8997729, 0.3802711, 1.297976, 1, 0, 0, 1, 1,
0.9036261, 1.076093, 1.265786, 1, 0, 0, 1, 1,
0.9040744, 0.1700993, 1.339441, 1, 0, 0, 1, 1,
0.9125153, 0.5856619, 1.291538, 0, 0, 0, 1, 1,
0.9127605, -0.6637541, 2.741388, 0, 0, 0, 1, 1,
0.9138095, 0.5015231, 3.369925, 0, 0, 0, 1, 1,
0.9152094, 2.864125, 0.2165633, 0, 0, 0, 1, 1,
0.9169223, -0.5499601, 2.649286, 0, 0, 0, 1, 1,
0.9210346, -1.24621, 3.836186, 0, 0, 0, 1, 1,
0.9217996, 0.8810407, 0.9143418, 0, 0, 0, 1, 1,
0.9244351, 0.5160748, 0.280033, 1, 1, 1, 1, 1,
0.9290487, 0.4148369, 0.129673, 1, 1, 1, 1, 1,
0.9349955, 1.898041, -0.1588411, 1, 1, 1, 1, 1,
0.9355373, -0.8495589, 0.9502062, 1, 1, 1, 1, 1,
0.9451847, 0.335818, 1.266138, 1, 1, 1, 1, 1,
0.9464204, -0.9317399, 2.450843, 1, 1, 1, 1, 1,
0.9475579, 1.91729, -0.5401322, 1, 1, 1, 1, 1,
0.9570775, -0.5810449, 3.126573, 1, 1, 1, 1, 1,
0.9669484, -1.110286, 1.981871, 1, 1, 1, 1, 1,
0.9711013, 0.04747712, 0.3789327, 1, 1, 1, 1, 1,
0.9714589, 0.5435647, 2.802433, 1, 1, 1, 1, 1,
0.9755411, -0.9216912, 1.021154, 1, 1, 1, 1, 1,
0.9765783, 0.9626744, -0.2035595, 1, 1, 1, 1, 1,
0.981439, -1.497926, 1.892525, 1, 1, 1, 1, 1,
0.9840572, -2.524445, 2.560501, 1, 1, 1, 1, 1,
0.9880031, -0.3005262, 0.6678438, 0, 0, 1, 1, 1,
0.9898307, -0.838414, 2.781207, 1, 0, 0, 1, 1,
0.9916892, 1.405183, 0.9055548, 1, 0, 0, 1, 1,
1.008215, 0.3745769, -0.06230412, 1, 0, 0, 1, 1,
1.011109, 0.8419241, 1.021223, 1, 0, 0, 1, 1,
1.024496, -0.9716729, 1.995535, 1, 0, 0, 1, 1,
1.024884, -0.2870452, 1.142206, 0, 0, 0, 1, 1,
1.027435, 1.550126, -1.09754, 0, 0, 0, 1, 1,
1.03605, 0.7122085, 0.7413394, 0, 0, 0, 1, 1,
1.038036, 0.3019076, 1.235028, 0, 0, 0, 1, 1,
1.047328, 2.73962, 0.03503426, 0, 0, 0, 1, 1,
1.056348, 1.622766, -0.5944743, 0, 0, 0, 1, 1,
1.058964, -0.9710237, 4.008942, 0, 0, 0, 1, 1,
1.059445, -0.4940831, 1.539432, 1, 1, 1, 1, 1,
1.0657, -0.0002810516, 1.266143, 1, 1, 1, 1, 1,
1.070592, -1.421502, 1.59813, 1, 1, 1, 1, 1,
1.072971, 1.90586, 1.373938, 1, 1, 1, 1, 1,
1.085822, 0.7286285, 0.8462118, 1, 1, 1, 1, 1,
1.088117, -1.432118, 3.157496, 1, 1, 1, 1, 1,
1.091992, -0.08419173, -0.4357562, 1, 1, 1, 1, 1,
1.106606, 0.5368282, 0.8069615, 1, 1, 1, 1, 1,
1.107623, 1.235092, 0.1483245, 1, 1, 1, 1, 1,
1.110698, -0.6252319, 3.902756, 1, 1, 1, 1, 1,
1.110703, 0.5613914, 2.831196, 1, 1, 1, 1, 1,
1.116459, -0.05745467, 1.755473, 1, 1, 1, 1, 1,
1.116799, 0.2293735, 3.108048, 1, 1, 1, 1, 1,
1.121446, -1.451368, 2.5519, 1, 1, 1, 1, 1,
1.124618, -0.2043464, 1.051623, 1, 1, 1, 1, 1,
1.124759, -2.387956, 3.587602, 0, 0, 1, 1, 1,
1.13018, 0.6576231, 1.405023, 1, 0, 0, 1, 1,
1.135159, 0.07067643, 0.146172, 1, 0, 0, 1, 1,
1.136525, 0.5436085, 1.103631, 1, 0, 0, 1, 1,
1.13814, 0.2818257, 0.3843934, 1, 0, 0, 1, 1,
1.138527, 1.264808, 2.195889, 1, 0, 0, 1, 1,
1.144917, -1.467593, 1.613332, 0, 0, 0, 1, 1,
1.147908, -0.7791461, 2.228983, 0, 0, 0, 1, 1,
1.148924, 0.7225956, 0.7497742, 0, 0, 0, 1, 1,
1.153025, -1.579876, 2.204781, 0, 0, 0, 1, 1,
1.153427, 0.5512213, 2.061434, 0, 0, 0, 1, 1,
1.155057, -0.655623, 2.057253, 0, 0, 0, 1, 1,
1.156176, 0.7692422, 1.411699, 0, 0, 0, 1, 1,
1.159678, -0.09025364, 3.053286, 1, 1, 1, 1, 1,
1.164481, 0.8771517, 0.4702414, 1, 1, 1, 1, 1,
1.166368, -1.32152, 2.681702, 1, 1, 1, 1, 1,
1.169558, 1.396259, 1.924697, 1, 1, 1, 1, 1,
1.180315, 0.5573428, -0.0009395047, 1, 1, 1, 1, 1,
1.199198, 1.552479, -1.257031, 1, 1, 1, 1, 1,
1.199558, 0.7466409, 1.418262, 1, 1, 1, 1, 1,
1.210996, -0.1223348, 1.219733, 1, 1, 1, 1, 1,
1.211262, 0.8375529, 0.9409958, 1, 1, 1, 1, 1,
1.218724, -1.054794, 2.74067, 1, 1, 1, 1, 1,
1.229632, -0.9155386, 0.7916709, 1, 1, 1, 1, 1,
1.230065, 1.081047, 1.442951, 1, 1, 1, 1, 1,
1.238071, -0.4639498, 2.926331, 1, 1, 1, 1, 1,
1.242012, -0.8515649, 2.863549, 1, 1, 1, 1, 1,
1.247438, 0.2919519, 1.742371, 1, 1, 1, 1, 1,
1.249419, 0.9596356, 1.360061, 0, 0, 1, 1, 1,
1.250433, 1.927827, -0.4901267, 1, 0, 0, 1, 1,
1.255525, 0.336056, -0.4535905, 1, 0, 0, 1, 1,
1.262186, 1.413962, 0.7244958, 1, 0, 0, 1, 1,
1.281071, 0.4365671, 0.754547, 1, 0, 0, 1, 1,
1.285417, -0.5961589, 1.915425, 1, 0, 0, 1, 1,
1.289389, 0.2419767, 0.4191089, 0, 0, 0, 1, 1,
1.294019, 0.4287495, 2.148594, 0, 0, 0, 1, 1,
1.299144, 1.091942, 0.9409459, 0, 0, 0, 1, 1,
1.301734, 0.5422971, 0.819757, 0, 0, 0, 1, 1,
1.3099, 0.004462313, 2.476077, 0, 0, 0, 1, 1,
1.313046, 0.7796952, 1.068133, 0, 0, 0, 1, 1,
1.33538, 0.6458452, 1.818521, 0, 0, 0, 1, 1,
1.350123, 0.01333422, 2.25342, 1, 1, 1, 1, 1,
1.356741, 1.864913, 1.29704, 1, 1, 1, 1, 1,
1.361901, 1.315624, 0.5172908, 1, 1, 1, 1, 1,
1.366871, -0.1808437, 2.014517, 1, 1, 1, 1, 1,
1.370755, 0.4818651, 1.318806, 1, 1, 1, 1, 1,
1.375653, -0.838033, 1.752546, 1, 1, 1, 1, 1,
1.382406, -0.1715382, 1.277403, 1, 1, 1, 1, 1,
1.385962, 0.0710758, 0.8981344, 1, 1, 1, 1, 1,
1.386821, -0.5102653, 3.23895, 1, 1, 1, 1, 1,
1.394912, -0.8212118, 2.845137, 1, 1, 1, 1, 1,
1.396028, -0.2395742, 1.209308, 1, 1, 1, 1, 1,
1.411996, -0.0008539984, 1.229016, 1, 1, 1, 1, 1,
1.415129, 0.6134505, 1.279494, 1, 1, 1, 1, 1,
1.42569, -0.3002045, 2.501124, 1, 1, 1, 1, 1,
1.426897, -0.9158701, 1.618067, 1, 1, 1, 1, 1,
1.436219, 0.9185923, 0.1550277, 0, 0, 1, 1, 1,
1.438119, -0.3732352, 0.2632182, 1, 0, 0, 1, 1,
1.439437, -0.8074195, 2.559792, 1, 0, 0, 1, 1,
1.442912, 0.4380475, 2.257421, 1, 0, 0, 1, 1,
1.445948, -1.243135, 1.552866, 1, 0, 0, 1, 1,
1.451634, 0.3945419, 3.068452, 1, 0, 0, 1, 1,
1.461352, -0.06325268, 3.526273, 0, 0, 0, 1, 1,
1.478279, -0.7984153, 1.729952, 0, 0, 0, 1, 1,
1.480511, 0.784471, 0.6549067, 0, 0, 0, 1, 1,
1.491969, -1.727618, 3.053692, 0, 0, 0, 1, 1,
1.498795, 0.185478, 2.102035, 0, 0, 0, 1, 1,
1.507937, -0.3031224, 1.254007, 0, 0, 0, 1, 1,
1.509443, -0.4770598, 3.012121, 0, 0, 0, 1, 1,
1.512363, -0.8490765, 0.2414432, 1, 1, 1, 1, 1,
1.513075, 1.735042, -0.06498912, 1, 1, 1, 1, 1,
1.516657, 0.6986879, 1.0559, 1, 1, 1, 1, 1,
1.533608, 0.3218558, 3.126733, 1, 1, 1, 1, 1,
1.540231, -0.05994768, 3.375076, 1, 1, 1, 1, 1,
1.542216, 1.377129, -0.4719579, 1, 1, 1, 1, 1,
1.547053, -1.474051, 2.858957, 1, 1, 1, 1, 1,
1.553524, -1.211554, 1.792564, 1, 1, 1, 1, 1,
1.560121, -0.06547255, 1.631251, 1, 1, 1, 1, 1,
1.565573, -0.6447542, 2.462946, 1, 1, 1, 1, 1,
1.565741, 0.5778623, 1.806297, 1, 1, 1, 1, 1,
1.576142, 0.2923359, 0.8627973, 1, 1, 1, 1, 1,
1.580962, -0.7487529, 0.8524804, 1, 1, 1, 1, 1,
1.61597, 0.8647759, 1.831, 1, 1, 1, 1, 1,
1.650579, -0.1710533, 2.059526, 1, 1, 1, 1, 1,
1.673654, -0.4286216, 1.821475, 0, 0, 1, 1, 1,
1.676188, -1.619731, 2.090586, 1, 0, 0, 1, 1,
1.681651, -0.6261701, 1.526045, 1, 0, 0, 1, 1,
1.693236, -2.874914, 2.451215, 1, 0, 0, 1, 1,
1.694865, -0.2451413, 2.050103, 1, 0, 0, 1, 1,
1.703136, -1.350031, 1.164957, 1, 0, 0, 1, 1,
1.737696, 1.721029, 2.00746, 0, 0, 0, 1, 1,
1.744711, 0.7817938, 1.075811, 0, 0, 0, 1, 1,
1.748522, 1.911488, 1.292107, 0, 0, 0, 1, 1,
1.749202, 1.169577, 2.646031, 0, 0, 0, 1, 1,
1.756387, -1.309002, 1.794336, 0, 0, 0, 1, 1,
1.759027, -0.08352377, 2.347246, 0, 0, 0, 1, 1,
1.838727, 1.205401, -0.06574892, 0, 0, 0, 1, 1,
1.843979, 1.167691, -1.219585, 1, 1, 1, 1, 1,
1.859651, 0.7820409, 1.422415, 1, 1, 1, 1, 1,
1.912396, 2.161288, 0.8297499, 1, 1, 1, 1, 1,
1.915207, -0.3544304, 1.281661, 1, 1, 1, 1, 1,
1.925004, -0.4036255, 1.198926, 1, 1, 1, 1, 1,
1.973641, -1.774779, 1.29856, 1, 1, 1, 1, 1,
1.976038, -0.5595439, 2.397994, 1, 1, 1, 1, 1,
1.987463, 0.7041527, 1.738043, 1, 1, 1, 1, 1,
1.999707, -0.198704, 2.473268, 1, 1, 1, 1, 1,
2.01224, -0.5443711, 2.278349, 1, 1, 1, 1, 1,
2.059166, -0.3588751, 1.826542, 1, 1, 1, 1, 1,
2.059891, -0.09298615, 2.999145, 1, 1, 1, 1, 1,
2.069363, -1.146504, 0.3349957, 1, 1, 1, 1, 1,
2.074385, -0.9666713, 3.068523, 1, 1, 1, 1, 1,
2.076717, 1.165975, 1.301445, 1, 1, 1, 1, 1,
2.084229, 0.1619137, 0.9736863, 0, 0, 1, 1, 1,
2.09367, 0.2833567, 3.515089, 1, 0, 0, 1, 1,
2.110285, -1.152837, 1.845467, 1, 0, 0, 1, 1,
2.119349, -0.7730481, 1.074359, 1, 0, 0, 1, 1,
2.120264, 2.872832, 0.7292061, 1, 0, 0, 1, 1,
2.13971, 1.927643, 0.3568467, 1, 0, 0, 1, 1,
2.139971, 0.4640026, 3.624966, 0, 0, 0, 1, 1,
2.215441, -0.1236466, 2.238763, 0, 0, 0, 1, 1,
2.241011, 0.7552808, 1.797347, 0, 0, 0, 1, 1,
2.272549, -1.073919, 1.692963, 0, 0, 0, 1, 1,
2.313258, -0.8044217, 2.461007, 0, 0, 0, 1, 1,
2.32027, -0.4645975, 1.727418, 0, 0, 0, 1, 1,
2.376168, 0.5086377, 0.4397753, 0, 0, 0, 1, 1,
2.430387, 1.090084, 2.595578, 1, 1, 1, 1, 1,
2.500461, -1.997106, 2.489527, 1, 1, 1, 1, 1,
2.513302, 0.4387736, -0.3011929, 1, 1, 1, 1, 1,
2.565626, -1.02684, 2.807192, 1, 1, 1, 1, 1,
2.595744, 0.8333228, 2.054113, 1, 1, 1, 1, 1,
2.750578, -2.986704, 1.667378, 1, 1, 1, 1, 1,
3.703866, -1.494732, 1.589078, 1, 1, 1, 1, 1
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
var radius = 9.895833;
var distance = 34.75869;
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
mvMatrix.translate( -0.4141278, 0.1040316, 0.2884068 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.75869);
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