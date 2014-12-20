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
-3.063076, -1.581816, -2.380522, 1, 0, 0, 1,
-2.974821, 1.738287, -0.112932, 1, 0.007843138, 0, 1,
-2.9094, 0.06014797, -0.7415405, 1, 0.01176471, 0, 1,
-2.796718, -2.006676, -2.482691, 1, 0.01960784, 0, 1,
-2.693436, 1.333348, -0.8811918, 1, 0.02352941, 0, 1,
-2.682403, -0.1877281, -1.236663, 1, 0.03137255, 0, 1,
-2.634813, -0.9457895, -2.268659, 1, 0.03529412, 0, 1,
-2.543905, -0.6791745, -0.8123365, 1, 0.04313726, 0, 1,
-2.409721, 0.3741162, -1.629995, 1, 0.04705882, 0, 1,
-2.408352, 0.00920112, -0.7573971, 1, 0.05490196, 0, 1,
-2.405418, 1.114691, -3.060655, 1, 0.05882353, 0, 1,
-2.380202, -1.599527, -2.435694, 1, 0.06666667, 0, 1,
-2.366628, 0.1257809, -2.284339, 1, 0.07058824, 0, 1,
-2.332127, -0.9601395, -1.339721, 1, 0.07843138, 0, 1,
-2.2288, 0.2055525, -1.299473, 1, 0.08235294, 0, 1,
-2.07685, 0.09741689, -0.1296645, 1, 0.09019608, 0, 1,
-2.056033, -0.07196464, -2.407216, 1, 0.09411765, 0, 1,
-2.053282, 0.9372643, -1.357182, 1, 0.1019608, 0, 1,
-2.018172, 0.002786616, -1.744048, 1, 0.1098039, 0, 1,
-2.000423, -0.3720307, -4.28039, 1, 0.1137255, 0, 1,
-1.944103, -1.563621, -3.694705, 1, 0.1215686, 0, 1,
-1.917078, 0.751532, -2.427787, 1, 0.1254902, 0, 1,
-1.882077, -0.2610554, -2.657579, 1, 0.1333333, 0, 1,
-1.878869, -1.399466, -0.743496, 1, 0.1372549, 0, 1,
-1.864436, -1.547282, -2.322527, 1, 0.145098, 0, 1,
-1.856671, 1.749059, 1.31288, 1, 0.1490196, 0, 1,
-1.847524, 0.3792754, -2.125553, 1, 0.1568628, 0, 1,
-1.835786, -0.204425, -2.442504, 1, 0.1607843, 0, 1,
-1.83233, -1.434348, -3.608296, 1, 0.1686275, 0, 1,
-1.821782, 0.5162069, 0.4506713, 1, 0.172549, 0, 1,
-1.81282, 0.3480017, -1.392496, 1, 0.1803922, 0, 1,
-1.807687, 1.686124, -0.5476321, 1, 0.1843137, 0, 1,
-1.805962, 1.318039, -0.9171192, 1, 0.1921569, 0, 1,
-1.805078, -0.7178777, -2.313937, 1, 0.1960784, 0, 1,
-1.797453, -2.252304, -1.553556, 1, 0.2039216, 0, 1,
-1.796913, 0.2198327, -1.43015, 1, 0.2117647, 0, 1,
-1.795857, -1.061188, -2.539492, 1, 0.2156863, 0, 1,
-1.791049, -1.128044, -3.078617, 1, 0.2235294, 0, 1,
-1.768118, 2.496243, -0.5674087, 1, 0.227451, 0, 1,
-1.734215, 1.173345, -0.9627348, 1, 0.2352941, 0, 1,
-1.725383, -0.2735999, -1.686683, 1, 0.2392157, 0, 1,
-1.717983, -1.24771, -1.898286, 1, 0.2470588, 0, 1,
-1.715081, 0.8321995, -1.122464, 1, 0.2509804, 0, 1,
-1.702584, 0.08217422, -2.903433, 1, 0.2588235, 0, 1,
-1.690661, 0.06061823, -2.089477, 1, 0.2627451, 0, 1,
-1.687754, -0.3059273, -0.7460613, 1, 0.2705882, 0, 1,
-1.666731, -0.9621449, -1.486951, 1, 0.2745098, 0, 1,
-1.664045, -0.4498344, -0.09725949, 1, 0.282353, 0, 1,
-1.658783, 0.7444919, -1.236714, 1, 0.2862745, 0, 1,
-1.65044, -1.738947, -3.322006, 1, 0.2941177, 0, 1,
-1.638901, -1.588022, -3.233888, 1, 0.3019608, 0, 1,
-1.63432, 0.9304858, -0.4072767, 1, 0.3058824, 0, 1,
-1.62426, -0.7167892, -0.6658639, 1, 0.3137255, 0, 1,
-1.611131, -0.3369171, -2.447369, 1, 0.3176471, 0, 1,
-1.569358, -1.183967, -0.9514475, 1, 0.3254902, 0, 1,
-1.550892, -1.100276, -0.2577027, 1, 0.3294118, 0, 1,
-1.533692, 0.03186034, -2.564202, 1, 0.3372549, 0, 1,
-1.531152, -1.668839, -1.380936, 1, 0.3411765, 0, 1,
-1.527149, 0.4831214, -0.9126378, 1, 0.3490196, 0, 1,
-1.506501, -0.9130493, -1.407426, 1, 0.3529412, 0, 1,
-1.503788, -0.3942264, -3.153768, 1, 0.3607843, 0, 1,
-1.500821, -0.636176, -1.281448, 1, 0.3647059, 0, 1,
-1.493858, 0.3417583, -2.638662, 1, 0.372549, 0, 1,
-1.472841, 0.725952, -1.124352, 1, 0.3764706, 0, 1,
-1.469692, 1.019139, -0.7640156, 1, 0.3843137, 0, 1,
-1.467683, -0.9281818, -1.565485, 1, 0.3882353, 0, 1,
-1.458786, -0.02462536, -2.051885, 1, 0.3960784, 0, 1,
-1.441433, -0.7983445, -0.09424088, 1, 0.4039216, 0, 1,
-1.439294, -0.09484702, -1.708769, 1, 0.4078431, 0, 1,
-1.43738, 0.8748176, 0.8645017, 1, 0.4156863, 0, 1,
-1.437255, 0.2137896, -1.873424, 1, 0.4196078, 0, 1,
-1.419367, -0.3787184, -1.179678, 1, 0.427451, 0, 1,
-1.398909, 0.280426, -1.871687, 1, 0.4313726, 0, 1,
-1.390823, -0.1858255, -1.565581, 1, 0.4392157, 0, 1,
-1.387406, 0.4756639, -2.446507, 1, 0.4431373, 0, 1,
-1.382769, 1.179458, -1.368727, 1, 0.4509804, 0, 1,
-1.346252, 0.245986, -1.273267, 1, 0.454902, 0, 1,
-1.345536, -0.4380963, -3.047756, 1, 0.4627451, 0, 1,
-1.345214, -0.4943385, -3.414141, 1, 0.4666667, 0, 1,
-1.344514, -1.559065, -3.848562, 1, 0.4745098, 0, 1,
-1.275625, 0.7885419, -0.5428714, 1, 0.4784314, 0, 1,
-1.273597, -0.471284, -2.22851, 1, 0.4862745, 0, 1,
-1.273544, -1.954015, -2.449482, 1, 0.4901961, 0, 1,
-1.262604, 0.9862797, -1.17049, 1, 0.4980392, 0, 1,
-1.259306, -0.6294323, -1.509684, 1, 0.5058824, 0, 1,
-1.237964, -0.6551836, -3.344829, 1, 0.509804, 0, 1,
-1.230373, 0.2980806, -0.07768573, 1, 0.5176471, 0, 1,
-1.222307, 0.3473661, 0.3252123, 1, 0.5215687, 0, 1,
-1.216159, -0.9129355, -0.8140221, 1, 0.5294118, 0, 1,
-1.205833, -0.8100879, -2.831538, 1, 0.5333334, 0, 1,
-1.198551, -1.27544, -3.667917, 1, 0.5411765, 0, 1,
-1.193977, 0.7556918, -0.5264423, 1, 0.5450981, 0, 1,
-1.188956, 0.496953, -0.2678939, 1, 0.5529412, 0, 1,
-1.184976, -0.758954, -3.121389, 1, 0.5568628, 0, 1,
-1.181986, -0.3853561, -3.23783, 1, 0.5647059, 0, 1,
-1.180711, -0.541913, -2.39475, 1, 0.5686275, 0, 1,
-1.178538, -0.2842317, -2.011073, 1, 0.5764706, 0, 1,
-1.177481, 1.845511, -1.212965, 1, 0.5803922, 0, 1,
-1.168699, -1.243673, -2.041656, 1, 0.5882353, 0, 1,
-1.159135, -0.2484327, -3.153574, 1, 0.5921569, 0, 1,
-1.158031, -0.8227078, -1.850826, 1, 0.6, 0, 1,
-1.151754, -0.8000292, -2.454096, 1, 0.6078432, 0, 1,
-1.150266, 0.9581062, -2.762634, 1, 0.6117647, 0, 1,
-1.146749, -0.2330814, -0.7527468, 1, 0.6196079, 0, 1,
-1.144345, 0.5255375, -1.104503, 1, 0.6235294, 0, 1,
-1.133625, 1.564003, -0.9026848, 1, 0.6313726, 0, 1,
-1.133447, -1.072077, -2.96617, 1, 0.6352941, 0, 1,
-1.131605, 1.515631, 1.438121, 1, 0.6431373, 0, 1,
-1.127548, -1.029935, -2.556615, 1, 0.6470588, 0, 1,
-1.119226, 0.6163946, 0.0605406, 1, 0.654902, 0, 1,
-1.113024, 2.091391, -1.028047, 1, 0.6588235, 0, 1,
-1.106456, 0.508857, -2.122408, 1, 0.6666667, 0, 1,
-1.102359, 0.3171069, -2.18687, 1, 0.6705883, 0, 1,
-1.101943, 0.6066908, -1.291139, 1, 0.6784314, 0, 1,
-1.099663, 0.2908774, -2.663017, 1, 0.682353, 0, 1,
-1.099207, -1.581559, -1.023404, 1, 0.6901961, 0, 1,
-1.094269, 0.9820683, -1.770374, 1, 0.6941177, 0, 1,
-1.090441, -1.546577, -2.733265, 1, 0.7019608, 0, 1,
-1.086243, 1.851748, -0.06192049, 1, 0.7098039, 0, 1,
-1.075534, -0.6447789, -2.704989, 1, 0.7137255, 0, 1,
-1.075114, 0.7486579, -0.1863376, 1, 0.7215686, 0, 1,
-1.069834, -0.340828, -1.677252, 1, 0.7254902, 0, 1,
-1.066252, 0.942685, -1.238173, 1, 0.7333333, 0, 1,
-1.065583, 1.367188, -3.354533, 1, 0.7372549, 0, 1,
-1.065547, 0.2339953, -1.193557, 1, 0.7450981, 0, 1,
-1.056387, -1.218624, -3.141912, 1, 0.7490196, 0, 1,
-1.053831, 0.03571234, 0.1120659, 1, 0.7568628, 0, 1,
-1.045063, 0.681796, -2.121919, 1, 0.7607843, 0, 1,
-1.043997, 0.05181557, -1.209173, 1, 0.7686275, 0, 1,
-1.039743, -0.1780499, -0.6481861, 1, 0.772549, 0, 1,
-1.030278, -0.2893049, -0.5614231, 1, 0.7803922, 0, 1,
-1.024295, -2.150011, -2.644731, 1, 0.7843137, 0, 1,
-1.024172, -0.720497, -3.453253, 1, 0.7921569, 0, 1,
-1.02392, 1.20443, -1.272742, 1, 0.7960784, 0, 1,
-1.018422, 0.7373905, 0.8147771, 1, 0.8039216, 0, 1,
-1.014908, 0.6080701, -0.9565257, 1, 0.8117647, 0, 1,
-1.007291, 1.010093, 1.69337, 1, 0.8156863, 0, 1,
-1.000268, 0.1063301, -1.891992, 1, 0.8235294, 0, 1,
-0.999612, -0.1338922, -0.390368, 1, 0.827451, 0, 1,
-0.9934006, 0.0367584, -2.774448, 1, 0.8352941, 0, 1,
-0.9854105, -0.09380129, -1.678632, 1, 0.8392157, 0, 1,
-0.9823269, -1.027896, -3.121267, 1, 0.8470588, 0, 1,
-0.9814898, 1.895673, -0.4263577, 1, 0.8509804, 0, 1,
-0.97265, -0.6189208, -3.960792, 1, 0.8588235, 0, 1,
-0.9720579, -0.6416183, -1.499909, 1, 0.8627451, 0, 1,
-0.9687346, 0.3181484, -0.2038335, 1, 0.8705882, 0, 1,
-0.9615902, 0.04006422, -1.006994, 1, 0.8745098, 0, 1,
-0.96144, -0.9178757, -2.925084, 1, 0.8823529, 0, 1,
-0.9608253, -0.2901084, -1.752571, 1, 0.8862745, 0, 1,
-0.9607388, 0.2820004, -1.389587, 1, 0.8941177, 0, 1,
-0.9559774, -1.739234, -4.200674, 1, 0.8980392, 0, 1,
-0.9524143, 1.226749, -0.3492316, 1, 0.9058824, 0, 1,
-0.9459181, -0.8733063, -2.750499, 1, 0.9137255, 0, 1,
-0.9399325, 1.069039, -1.202095, 1, 0.9176471, 0, 1,
-0.9393887, -0.3320917, -2.61192, 1, 0.9254902, 0, 1,
-0.9389188, 0.07862785, 0.4851301, 1, 0.9294118, 0, 1,
-0.9370312, -0.6326262, -2.873353, 1, 0.9372549, 0, 1,
-0.9338176, 0.1574199, -2.987573, 1, 0.9411765, 0, 1,
-0.9334748, 0.8671489, -1.64747, 1, 0.9490196, 0, 1,
-0.9327354, 0.8409417, -2.469395, 1, 0.9529412, 0, 1,
-0.9219177, -1.224998, -2.566893, 1, 0.9607843, 0, 1,
-0.9150689, -1.371405, -2.073346, 1, 0.9647059, 0, 1,
-0.9128448, 1.067421, -0.7834701, 1, 0.972549, 0, 1,
-0.9059727, 0.07315587, -2.008062, 1, 0.9764706, 0, 1,
-0.895629, -0.4081054, -1.713479, 1, 0.9843137, 0, 1,
-0.8951179, -0.02633307, -2.072878, 1, 0.9882353, 0, 1,
-0.8760164, 0.3003796, -0.5033148, 1, 0.9960784, 0, 1,
-0.8729393, 0.4938031, -0.9163283, 0.9960784, 1, 0, 1,
-0.8697643, 0.08415926, -2.84848, 0.9921569, 1, 0, 1,
-0.8662855, 0.1413308, -1.601201, 0.9843137, 1, 0, 1,
-0.865144, 0.01368719, -2.026956, 0.9803922, 1, 0, 1,
-0.864071, -0.8971238, -2.675589, 0.972549, 1, 0, 1,
-0.8540192, 0.1474322, -1.805186, 0.9686275, 1, 0, 1,
-0.8482363, -0.06265847, -1.071031, 0.9607843, 1, 0, 1,
-0.8360492, 1.896269, 0.08077585, 0.9568627, 1, 0, 1,
-0.8255842, -1.357785, -2.577433, 0.9490196, 1, 0, 1,
-0.8218105, -0.724255, -3.261362, 0.945098, 1, 0, 1,
-0.8172063, 0.1101209, -1.1171, 0.9372549, 1, 0, 1,
-0.8134761, -0.1515177, -1.252183, 0.9333333, 1, 0, 1,
-0.8123779, 1.535713, -0.4112607, 0.9254902, 1, 0, 1,
-0.8113876, -1.265558, -2.00975, 0.9215686, 1, 0, 1,
-0.8074232, -0.1700679, -0.9281945, 0.9137255, 1, 0, 1,
-0.8044934, 0.3800754, -1.026664, 0.9098039, 1, 0, 1,
-0.802187, -0.5143778, -2.045781, 0.9019608, 1, 0, 1,
-0.79874, 0.7562666, -0.5521004, 0.8941177, 1, 0, 1,
-0.794163, 0.2596995, -1.582315, 0.8901961, 1, 0, 1,
-0.7875524, -0.233775, -1.393881, 0.8823529, 1, 0, 1,
-0.7872678, 2.680079, -1.949475, 0.8784314, 1, 0, 1,
-0.7816778, 0.6750258, -0.3734637, 0.8705882, 1, 0, 1,
-0.7805479, 2.244149, -1.003467, 0.8666667, 1, 0, 1,
-0.7788207, -0.4176149, -1.182719, 0.8588235, 1, 0, 1,
-0.7783117, -0.06150864, -0.6850821, 0.854902, 1, 0, 1,
-0.772548, 0.5867258, -1.446149, 0.8470588, 1, 0, 1,
-0.7717902, -1.61312, -3.293365, 0.8431373, 1, 0, 1,
-0.7711558, 0.6702181, 0.04160238, 0.8352941, 1, 0, 1,
-0.7609807, -0.549089, -1.860209, 0.8313726, 1, 0, 1,
-0.7563438, -1.682109, -3.307488, 0.8235294, 1, 0, 1,
-0.7557742, -0.431641, -1.562715, 0.8196079, 1, 0, 1,
-0.754827, 0.1080613, -2.526095, 0.8117647, 1, 0, 1,
-0.7520861, 0.5556988, -0.7366517, 0.8078431, 1, 0, 1,
-0.7467318, 1.996259, -0.6594415, 0.8, 1, 0, 1,
-0.7435677, 0.0416085, -0.5817536, 0.7921569, 1, 0, 1,
-0.7382973, 0.5782984, -2.191291, 0.7882353, 1, 0, 1,
-0.7375202, 1.160685, -0.3396434, 0.7803922, 1, 0, 1,
-0.7353413, -0.300078, -0.6633738, 0.7764706, 1, 0, 1,
-0.7336904, -0.6324241, -0.3409894, 0.7686275, 1, 0, 1,
-0.7329687, -0.2886576, -2.420337, 0.7647059, 1, 0, 1,
-0.7314193, 0.4086666, -1.659539, 0.7568628, 1, 0, 1,
-0.7254413, 1.955491, -0.6728644, 0.7529412, 1, 0, 1,
-0.7168165, 0.9024696, -1.618439, 0.7450981, 1, 0, 1,
-0.7100932, 1.254252, 0.6222879, 0.7411765, 1, 0, 1,
-0.7031142, 1.197092, 0.4010078, 0.7333333, 1, 0, 1,
-0.6938954, -0.7354575, -1.873456, 0.7294118, 1, 0, 1,
-0.6931347, -1.191897, -1.867731, 0.7215686, 1, 0, 1,
-0.6896368, 0.4658356, -2.49006, 0.7176471, 1, 0, 1,
-0.6778458, 0.2557109, -1.157001, 0.7098039, 1, 0, 1,
-0.6703001, 0.1542765, -2.904843, 0.7058824, 1, 0, 1,
-0.6687433, -0.0791899, -0.01673758, 0.6980392, 1, 0, 1,
-0.6685153, -1.95337, -4.575905, 0.6901961, 1, 0, 1,
-0.6670624, 0.1676794, -2.635964, 0.6862745, 1, 0, 1,
-0.6651168, -1.303996, -2.762659, 0.6784314, 1, 0, 1,
-0.6625245, 1.90876, 0.3511373, 0.6745098, 1, 0, 1,
-0.6617058, -0.01772851, -2.033945, 0.6666667, 1, 0, 1,
-0.6605181, -0.5040936, -1.547906, 0.6627451, 1, 0, 1,
-0.6530023, -0.07258362, -2.254222, 0.654902, 1, 0, 1,
-0.649967, 1.616799, -0.9739065, 0.6509804, 1, 0, 1,
-0.6489862, -0.4905133, -1.86958, 0.6431373, 1, 0, 1,
-0.6477872, 0.7836161, -2.033315, 0.6392157, 1, 0, 1,
-0.6452795, 0.5005393, -0.1767165, 0.6313726, 1, 0, 1,
-0.6406324, 0.6809826, -0.4444339, 0.627451, 1, 0, 1,
-0.6386325, 1.866916, -0.7621977, 0.6196079, 1, 0, 1,
-0.6334134, 0.1235426, -0.3542861, 0.6156863, 1, 0, 1,
-0.6323247, 1.235097, -2.103278, 0.6078432, 1, 0, 1,
-0.6297575, 2.700501, -2.642603, 0.6039216, 1, 0, 1,
-0.6275738, -0.01196467, -1.297249, 0.5960785, 1, 0, 1,
-0.6237954, 2.230983, -0.3588278, 0.5882353, 1, 0, 1,
-0.6230389, -0.5427392, -2.90183, 0.5843138, 1, 0, 1,
-0.6220722, -1.169207, -3.615233, 0.5764706, 1, 0, 1,
-0.6212643, -0.6287711, -2.062873, 0.572549, 1, 0, 1,
-0.61845, -0.258206, -1.555143, 0.5647059, 1, 0, 1,
-0.6181397, 0.1955976, -1.684174, 0.5607843, 1, 0, 1,
-0.6115293, 0.2954945, -1.903445, 0.5529412, 1, 0, 1,
-0.6020699, -0.5291239, -0.9747075, 0.5490196, 1, 0, 1,
-0.5968924, 0.4065589, -0.4812113, 0.5411765, 1, 0, 1,
-0.595851, 0.7807361, -1.376945, 0.5372549, 1, 0, 1,
-0.5949359, 0.6049677, -0.9701687, 0.5294118, 1, 0, 1,
-0.5925817, 1.638404, -1.747665, 0.5254902, 1, 0, 1,
-0.5922765, -0.08224056, -1.735105, 0.5176471, 1, 0, 1,
-0.5849143, 1.486025, 0.8151362, 0.5137255, 1, 0, 1,
-0.5836848, 1.824902, -0.1603785, 0.5058824, 1, 0, 1,
-0.5813751, -1.067181, -0.3612274, 0.5019608, 1, 0, 1,
-0.5803164, 0.01981802, -0.5310181, 0.4941176, 1, 0, 1,
-0.5739314, -1.502082, -3.057706, 0.4862745, 1, 0, 1,
-0.5736234, -0.7373172, -2.239231, 0.4823529, 1, 0, 1,
-0.5716076, -0.5008827, -0.7710864, 0.4745098, 1, 0, 1,
-0.5697756, 0.3958027, -1.681365, 0.4705882, 1, 0, 1,
-0.5662335, -0.5770712, -3.472145, 0.4627451, 1, 0, 1,
-0.5643919, 0.1397093, -0.8427949, 0.4588235, 1, 0, 1,
-0.5612703, -0.4701533, -0.2851118, 0.4509804, 1, 0, 1,
-0.5581951, -1.152831, -2.932659, 0.4470588, 1, 0, 1,
-0.5556023, -1.387004, -3.943296, 0.4392157, 1, 0, 1,
-0.5469326, -0.3227471, -1.589152, 0.4352941, 1, 0, 1,
-0.5468054, -0.2143811, -0.9764861, 0.427451, 1, 0, 1,
-0.542285, 0.3946474, -1.875179, 0.4235294, 1, 0, 1,
-0.5333309, 0.2313514, -2.332373, 0.4156863, 1, 0, 1,
-0.5319157, 0.2736851, -0.8696671, 0.4117647, 1, 0, 1,
-0.5272852, -0.4334423, -1.7954, 0.4039216, 1, 0, 1,
-0.5254017, -0.5473703, -4.402038, 0.3960784, 1, 0, 1,
-0.5227871, 0.3194087, -1.424044, 0.3921569, 1, 0, 1,
-0.5135738, 0.714443, -1.464908, 0.3843137, 1, 0, 1,
-0.5124556, 0.092416, -1.336402, 0.3803922, 1, 0, 1,
-0.5115741, -1.065316, -4.351423, 0.372549, 1, 0, 1,
-0.5109429, -0.7743433, -3.132113, 0.3686275, 1, 0, 1,
-0.5095463, -0.7782768, -2.097481, 0.3607843, 1, 0, 1,
-0.5077438, -0.5807885, -2.494891, 0.3568628, 1, 0, 1,
-0.5029711, 0.5242872, 0.497248, 0.3490196, 1, 0, 1,
-0.5002988, 1.447702, 1.111186, 0.345098, 1, 0, 1,
-0.4970255, 0.04049194, -3.805106, 0.3372549, 1, 0, 1,
-0.4937401, -1.41821, -3.134064, 0.3333333, 1, 0, 1,
-0.4862432, -0.7604336, -3.528838, 0.3254902, 1, 0, 1,
-0.4838281, -0.4176604, -0.4145633, 0.3215686, 1, 0, 1,
-0.4814548, -1.489461, -3.911696, 0.3137255, 1, 0, 1,
-0.4810689, 0.1868072, -1.058326, 0.3098039, 1, 0, 1,
-0.4788845, -0.9954496, -3.849745, 0.3019608, 1, 0, 1,
-0.478459, 0.7747231, 0.5150639, 0.2941177, 1, 0, 1,
-0.4709128, -0.5498115, -3.492032, 0.2901961, 1, 0, 1,
-0.4660244, -0.1221808, -2.512233, 0.282353, 1, 0, 1,
-0.4631327, 0.7653882, -1.2147, 0.2784314, 1, 0, 1,
-0.4617832, -1.276592, -2.286592, 0.2705882, 1, 0, 1,
-0.4578618, -1.051042, -4.150793, 0.2666667, 1, 0, 1,
-0.4559251, -1.619775, -2.960804, 0.2588235, 1, 0, 1,
-0.4517601, 1.599072, -0.9301162, 0.254902, 1, 0, 1,
-0.4492188, 0.4845562, -0.6055829, 0.2470588, 1, 0, 1,
-0.4478157, 0.5814928, -0.7815183, 0.2431373, 1, 0, 1,
-0.445684, -0.7026563, -2.116904, 0.2352941, 1, 0, 1,
-0.4447458, -0.1428598, -1.662733, 0.2313726, 1, 0, 1,
-0.4410225, -1.975672, -2.290245, 0.2235294, 1, 0, 1,
-0.4360947, -0.2643599, -2.049479, 0.2196078, 1, 0, 1,
-0.4315998, -0.09493238, -3.651419, 0.2117647, 1, 0, 1,
-0.4286212, -1.791529, -2.340038, 0.2078431, 1, 0, 1,
-0.4275186, 1.161563, -0.5271828, 0.2, 1, 0, 1,
-0.4264546, -0.03411241, -2.604549, 0.1921569, 1, 0, 1,
-0.4256843, 1.296943, -0.9872933, 0.1882353, 1, 0, 1,
-0.4242351, -0.8161978, -2.790121, 0.1803922, 1, 0, 1,
-0.420925, -0.7623786, -1.747027, 0.1764706, 1, 0, 1,
-0.4191758, 1.369356, -2.202001, 0.1686275, 1, 0, 1,
-0.4184122, 1.681313, -0.7171423, 0.1647059, 1, 0, 1,
-0.4172335, -0.3231159, -1.671829, 0.1568628, 1, 0, 1,
-0.415064, -1.223998, -2.330007, 0.1529412, 1, 0, 1,
-0.4131458, 1.634803, -0.2530705, 0.145098, 1, 0, 1,
-0.4130238, -0.3290196, -0.4688992, 0.1411765, 1, 0, 1,
-0.4120444, 0.09431775, 0.6351828, 0.1333333, 1, 0, 1,
-0.4085764, -0.6752707, -1.284692, 0.1294118, 1, 0, 1,
-0.4075238, 0.345562, -0.3291006, 0.1215686, 1, 0, 1,
-0.4033896, -0.04012483, -2.271562, 0.1176471, 1, 0, 1,
-0.4018224, -0.8479911, -2.868922, 0.1098039, 1, 0, 1,
-0.385603, 0.3334555, 0.8360859, 0.1058824, 1, 0, 1,
-0.3843267, -0.09082, -2.19409, 0.09803922, 1, 0, 1,
-0.3812325, -0.161372, -1.898893, 0.09019608, 1, 0, 1,
-0.3803798, -0.3272139, -1.397111, 0.08627451, 1, 0, 1,
-0.3719954, -0.09079784, -1.48766, 0.07843138, 1, 0, 1,
-0.3709887, -0.2750237, -2.909924, 0.07450981, 1, 0, 1,
-0.3691141, -0.8498649, -1.869054, 0.06666667, 1, 0, 1,
-0.367789, -0.3205431, -1.695052, 0.0627451, 1, 0, 1,
-0.3634399, 0.4066595, 0.279082, 0.05490196, 1, 0, 1,
-0.3585168, 0.2015311, -3.197953, 0.05098039, 1, 0, 1,
-0.3459596, -0.3135627, -2.978994, 0.04313726, 1, 0, 1,
-0.342797, 0.8525712, 0.8095188, 0.03921569, 1, 0, 1,
-0.3423714, 0.09470699, -0.7643324, 0.03137255, 1, 0, 1,
-0.3406846, -0.1570989, -3.059714, 0.02745098, 1, 0, 1,
-0.3377433, -0.07995325, -0.5301205, 0.01960784, 1, 0, 1,
-0.3367004, 0.6957355, 0.9756224, 0.01568628, 1, 0, 1,
-0.3324066, -0.1673304, -1.474907, 0.007843138, 1, 0, 1,
-0.3319064, -0.01696752, -1.755162, 0.003921569, 1, 0, 1,
-0.3318789, 1.480159, 1.059092, 0, 1, 0.003921569, 1,
-0.3308418, 1.059074, -0.5060132, 0, 1, 0.01176471, 1,
-0.3272235, -1.153975, -2.155211, 0, 1, 0.01568628, 1,
-0.3224736, 0.5463462, -0.9772661, 0, 1, 0.02352941, 1,
-0.3219277, 0.4292818, -0.6900445, 0, 1, 0.02745098, 1,
-0.3180128, -0.7420947, -2.195972, 0, 1, 0.03529412, 1,
-0.3158948, 1.247944, -1.206429, 0, 1, 0.03921569, 1,
-0.3156143, -0.5712532, -2.996408, 0, 1, 0.04705882, 1,
-0.3150404, 0.178462, -1.029618, 0, 1, 0.05098039, 1,
-0.3094513, -1.458317, -2.101509, 0, 1, 0.05882353, 1,
-0.3093182, -1.27433, -1.788654, 0, 1, 0.0627451, 1,
-0.30362, -1.088546, -2.537785, 0, 1, 0.07058824, 1,
-0.2996837, -2.106406, -2.275931, 0, 1, 0.07450981, 1,
-0.2973926, 0.1731786, 0.4001733, 0, 1, 0.08235294, 1,
-0.2969305, 0.7486031, 0.1156871, 0, 1, 0.08627451, 1,
-0.2919215, -0.6898128, -3.343223, 0, 1, 0.09411765, 1,
-0.2913391, 1.526748, -0.6438284, 0, 1, 0.1019608, 1,
-0.2879179, -0.9537337, -3.981265, 0, 1, 0.1058824, 1,
-0.2874567, 1.107744, -1.68077, 0, 1, 0.1137255, 1,
-0.2842175, -2.042431, -4.895891, 0, 1, 0.1176471, 1,
-0.2828261, -0.5085137, -1.024125, 0, 1, 0.1254902, 1,
-0.2804432, 1.414659, -0.7550207, 0, 1, 0.1294118, 1,
-0.2786255, 0.7241701, 1.055809, 0, 1, 0.1372549, 1,
-0.2774878, 0.258928, 0.5256081, 0, 1, 0.1411765, 1,
-0.2753004, -0.8628471, -1.996914, 0, 1, 0.1490196, 1,
-0.2742548, 0.9039984, -0.3163087, 0, 1, 0.1529412, 1,
-0.2711629, -0.8268636, -2.69233, 0, 1, 0.1607843, 1,
-0.2677168, -1.117388, -3.570843, 0, 1, 0.1647059, 1,
-0.2674397, 0.4217002, -0.7749158, 0, 1, 0.172549, 1,
-0.2657574, 0.1806097, -0.671456, 0, 1, 0.1764706, 1,
-0.2643221, -0.6802979, -3.130609, 0, 1, 0.1843137, 1,
-0.2600664, -0.3087645, -1.756565, 0, 1, 0.1882353, 1,
-0.2587578, 0.9178066, 0.3063451, 0, 1, 0.1960784, 1,
-0.257786, 1.37114, -2.437671, 0, 1, 0.2039216, 1,
-0.2565868, -0.6227341, -3.190008, 0, 1, 0.2078431, 1,
-0.2512617, -0.0337878, -1.239493, 0, 1, 0.2156863, 1,
-0.249069, -1.070038, -2.252869, 0, 1, 0.2196078, 1,
-0.2474016, -0.5998306, -1.49037, 0, 1, 0.227451, 1,
-0.2434431, 1.433706, -1.949435, 0, 1, 0.2313726, 1,
-0.2430593, -0.0663112, -3.046103, 0, 1, 0.2392157, 1,
-0.2390179, -2.466645, -4.44806, 0, 1, 0.2431373, 1,
-0.2383014, 0.3469426, 0.9287258, 0, 1, 0.2509804, 1,
-0.2368075, 0.7664218, -0.1263292, 0, 1, 0.254902, 1,
-0.2365389, 0.7856775, 2.192741, 0, 1, 0.2627451, 1,
-0.2248577, -0.5594172, -2.558804, 0, 1, 0.2666667, 1,
-0.2226034, 0.3985842, 1.039328, 0, 1, 0.2745098, 1,
-0.219424, 1.021308, 1.111238, 0, 1, 0.2784314, 1,
-0.2166573, -0.6259874, -3.342031, 0, 1, 0.2862745, 1,
-0.2163841, -0.101287, -0.9416966, 0, 1, 0.2901961, 1,
-0.2128237, 0.4116, 0.981455, 0, 1, 0.2980392, 1,
-0.207836, 0.1231674, -0.9552934, 0, 1, 0.3058824, 1,
-0.2058589, 0.07656546, 0.3569269, 0, 1, 0.3098039, 1,
-0.2024967, 0.9411534, -0.3409635, 0, 1, 0.3176471, 1,
-0.2006751, -0.552524, -2.552142, 0, 1, 0.3215686, 1,
-0.1997785, -0.282122, -2.949432, 0, 1, 0.3294118, 1,
-0.1994686, 0.07493721, -1.096231, 0, 1, 0.3333333, 1,
-0.1976705, 0.8048016, -0.9495887, 0, 1, 0.3411765, 1,
-0.1970177, 1.875954, 0.2437504, 0, 1, 0.345098, 1,
-0.1951043, -0.2064463, -3.15002, 0, 1, 0.3529412, 1,
-0.1936802, 0.6667072, -1.319434, 0, 1, 0.3568628, 1,
-0.1933026, -1.926394, -5.260131, 0, 1, 0.3647059, 1,
-0.1885654, 0.9018368, 1.368911, 0, 1, 0.3686275, 1,
-0.1879294, -0.1198855, -1.120747, 0, 1, 0.3764706, 1,
-0.1873079, 0.9630041, 0.383792, 0, 1, 0.3803922, 1,
-0.1818846, 0.7566773, -0.4759696, 0, 1, 0.3882353, 1,
-0.1773831, 1.313588, 0.6685315, 0, 1, 0.3921569, 1,
-0.17585, 0.3042153, 0.464906, 0, 1, 0.4, 1,
-0.1750396, 0.623483, -0.7103386, 0, 1, 0.4078431, 1,
-0.1734523, 2.086503, -0.4235331, 0, 1, 0.4117647, 1,
-0.1677816, 0.2494122, -0.4316405, 0, 1, 0.4196078, 1,
-0.1643369, -1.112472, -3.169032, 0, 1, 0.4235294, 1,
-0.1642764, 0.565068, -0.01693972, 0, 1, 0.4313726, 1,
-0.1538284, -1.016737, -1.681161, 0, 1, 0.4352941, 1,
-0.1529195, -0.3786039, -2.174059, 0, 1, 0.4431373, 1,
-0.1481302, 1.194891, 0.4886195, 0, 1, 0.4470588, 1,
-0.1429276, 0.4556944, -1.422214, 0, 1, 0.454902, 1,
-0.1372631, 0.1412983, -0.003347442, 0, 1, 0.4588235, 1,
-0.126337, -0.4933387, -4.066905, 0, 1, 0.4666667, 1,
-0.1247976, -0.006450504, 0.09895888, 0, 1, 0.4705882, 1,
-0.1230629, 0.1682284, -0.3919903, 0, 1, 0.4784314, 1,
-0.1228492, -0.03843293, -1.290837, 0, 1, 0.4823529, 1,
-0.122418, -0.1216996, -2.568825, 0, 1, 0.4901961, 1,
-0.1202891, -1.069882, -2.205485, 0, 1, 0.4941176, 1,
-0.120099, 1.35667, -0.3895845, 0, 1, 0.5019608, 1,
-0.1197757, -0.3353915, -3.619109, 0, 1, 0.509804, 1,
-0.1147952, 0.1623886, -1.315286, 0, 1, 0.5137255, 1,
-0.1127764, -0.4100347, -1.883006, 0, 1, 0.5215687, 1,
-0.1075138, 0.0959462, 0.6193923, 0, 1, 0.5254902, 1,
-0.1062576, -0.05480615, -2.426147, 0, 1, 0.5333334, 1,
-0.1059634, -0.5739588, -2.492946, 0, 1, 0.5372549, 1,
-0.1058535, 0.003137134, -2.858326, 0, 1, 0.5450981, 1,
-0.1053453, 0.4685338, 0.8482051, 0, 1, 0.5490196, 1,
-0.1041808, 1.585419, -0.679213, 0, 1, 0.5568628, 1,
-0.1036513, 1.184283, -1.328037, 0, 1, 0.5607843, 1,
-0.09975988, 0.5379152, 0.7623045, 0, 1, 0.5686275, 1,
-0.09896564, 1.289116, 0.2784264, 0, 1, 0.572549, 1,
-0.09795523, 0.1100221, -0.004118067, 0, 1, 0.5803922, 1,
-0.0957699, -0.1242245, -3.266589, 0, 1, 0.5843138, 1,
-0.0955516, -0.5488116, -2.741802, 0, 1, 0.5921569, 1,
-0.09265975, -0.8383216, -2.11751, 0, 1, 0.5960785, 1,
-0.08944657, -0.9041536, -3.207624, 0, 1, 0.6039216, 1,
-0.0882894, 1.444957, -0.5722858, 0, 1, 0.6117647, 1,
-0.08638409, 1.37718, 1.35784, 0, 1, 0.6156863, 1,
-0.08124831, 0.3744989, -0.8562863, 0, 1, 0.6235294, 1,
-0.08102397, -0.09046505, -1.59956, 0, 1, 0.627451, 1,
-0.07787463, -0.3919044, -2.629243, 0, 1, 0.6352941, 1,
-0.07290734, 0.93793, -1.42322, 0, 1, 0.6392157, 1,
-0.07277176, 0.04338337, -1.848675, 0, 1, 0.6470588, 1,
-0.07220253, -0.392274, -1.295015, 0, 1, 0.6509804, 1,
-0.06464417, 0.1293148, -0.4823108, 0, 1, 0.6588235, 1,
-0.06427412, -1.214698, -2.937437, 0, 1, 0.6627451, 1,
-0.06210107, 0.3465185, -0.6787832, 0, 1, 0.6705883, 1,
-0.06209585, -0.08101327, -2.40981, 0, 1, 0.6745098, 1,
-0.05706106, -0.6517047, -1.495754, 0, 1, 0.682353, 1,
-0.05610891, 1.314688, 0.979376, 0, 1, 0.6862745, 1,
-0.05602165, -1.774953, -0.9784668, 0, 1, 0.6941177, 1,
-0.05553997, 1.967348, 0.3827434, 0, 1, 0.7019608, 1,
-0.05513377, 1.868944, -0.4237326, 0, 1, 0.7058824, 1,
-0.0488859, -0.7546683, -4.397512, 0, 1, 0.7137255, 1,
-0.04831675, -0.9402932, -2.762998, 0, 1, 0.7176471, 1,
-0.04296665, -1.000068, -4.231796, 0, 1, 0.7254902, 1,
-0.03824798, -0.4706462, -3.625806, 0, 1, 0.7294118, 1,
-0.03658396, -0.4334073, -0.616471, 0, 1, 0.7372549, 1,
-0.03458282, -0.3292575, -3.569561, 0, 1, 0.7411765, 1,
-0.02819885, 0.02103295, -1.756917, 0, 1, 0.7490196, 1,
-0.02530692, 0.7147058, -0.1987164, 0, 1, 0.7529412, 1,
-0.02518009, -1.56576, -1.609374, 0, 1, 0.7607843, 1,
-0.0132358, 0.6626722, -0.2432943, 0, 1, 0.7647059, 1,
-0.008961974, 0.2145692, -0.5060577, 0, 1, 0.772549, 1,
-0.008354611, -0.8801355, -2.201212, 0, 1, 0.7764706, 1,
8.597889e-05, -0.2034038, 2.649675, 0, 1, 0.7843137, 1,
0.002351325, 1.046483, -1.54586, 0, 1, 0.7882353, 1,
0.004530706, -0.1434894, 2.364404, 0, 1, 0.7960784, 1,
0.00482826, -0.441002, 3.171032, 0, 1, 0.8039216, 1,
0.006150404, 1.321295, -0.2872106, 0, 1, 0.8078431, 1,
0.01087315, -0.1975649, 2.465904, 0, 1, 0.8156863, 1,
0.01087848, 0.5554956, -0.5336388, 0, 1, 0.8196079, 1,
0.01309406, 1.100212, 0.8614399, 0, 1, 0.827451, 1,
0.01502579, 0.2351317, 0.5680213, 0, 1, 0.8313726, 1,
0.01760361, -0.6435624, 2.023477, 0, 1, 0.8392157, 1,
0.01840304, -0.3721353, 5.634213, 0, 1, 0.8431373, 1,
0.01950481, -0.5875207, 2.633483, 0, 1, 0.8509804, 1,
0.02994799, -0.8714359, 3.407397, 0, 1, 0.854902, 1,
0.03413918, -1.289491, 3.107765, 0, 1, 0.8627451, 1,
0.03881104, -0.6376811, 2.485382, 0, 1, 0.8666667, 1,
0.04223587, 1.363227, 0.405082, 0, 1, 0.8745098, 1,
0.04329597, -1.408791, 3.418707, 0, 1, 0.8784314, 1,
0.0451672, 0.4070645, -1.565274, 0, 1, 0.8862745, 1,
0.04986275, 0.5721762, 0.6219646, 0, 1, 0.8901961, 1,
0.05340161, -1.490748, 3.349936, 0, 1, 0.8980392, 1,
0.05553605, -0.1156296, 2.487105, 0, 1, 0.9058824, 1,
0.06173475, -0.02432353, 2.249835, 0, 1, 0.9098039, 1,
0.06574307, -1.593575, 4.326001, 0, 1, 0.9176471, 1,
0.06604184, -0.0846898, 1.881212, 0, 1, 0.9215686, 1,
0.06860048, -0.3621608, 3.048242, 0, 1, 0.9294118, 1,
0.07378465, -0.02363228, 1.792779, 0, 1, 0.9333333, 1,
0.07400749, -0.003006923, 0.5414401, 0, 1, 0.9411765, 1,
0.07423846, 0.03921847, 1.390785, 0, 1, 0.945098, 1,
0.07590938, -0.6034038, 2.861869, 0, 1, 0.9529412, 1,
0.08232418, 0.9396324, 0.8162066, 0, 1, 0.9568627, 1,
0.08385652, -2.699516, 2.220735, 0, 1, 0.9647059, 1,
0.09268789, 0.3566747, 1.866611, 0, 1, 0.9686275, 1,
0.09274979, -1.00391, 3.126387, 0, 1, 0.9764706, 1,
0.09466764, 0.6499855, -0.5392224, 0, 1, 0.9803922, 1,
0.09489821, 0.1049937, 0.1626917, 0, 1, 0.9882353, 1,
0.09616046, -0.03329591, 1.605481, 0, 1, 0.9921569, 1,
0.09741917, 0.7087814, -0.9336246, 0, 1, 1, 1,
0.09956971, 0.3371953, 0.1015183, 0, 0.9921569, 1, 1,
0.1016032, 0.05587332, 1.178379, 0, 0.9882353, 1, 1,
0.1029557, -0.3578891, 3.873419, 0, 0.9803922, 1, 1,
0.1045333, 0.4548536, 0.8372384, 0, 0.9764706, 1, 1,
0.1061256, -0.9077916, 3.156677, 0, 0.9686275, 1, 1,
0.1072659, 0.5885684, -0.5119048, 0, 0.9647059, 1, 1,
0.1083527, 2.36358, -0.2441527, 0, 0.9568627, 1, 1,
0.1100215, 1.368076, -0.4154208, 0, 0.9529412, 1, 1,
0.111842, 0.01449601, 0.09772148, 0, 0.945098, 1, 1,
0.1120603, 0.07998757, 0.6106148, 0, 0.9411765, 1, 1,
0.1153827, 0.1888965, -1.664155, 0, 0.9333333, 1, 1,
0.1163262, 0.2666011, 0.5170366, 0, 0.9294118, 1, 1,
0.1163707, -0.3147858, 2.955805, 0, 0.9215686, 1, 1,
0.117615, 1.290039, 0.7225013, 0, 0.9176471, 1, 1,
0.124836, 1.036005, 0.3909695, 0, 0.9098039, 1, 1,
0.1287537, 0.2098294, 1.229571, 0, 0.9058824, 1, 1,
0.1292522, 0.1033149, 3.353651, 0, 0.8980392, 1, 1,
0.1296622, 0.8929468, 1.399459, 0, 0.8901961, 1, 1,
0.1399677, 0.1080031, 2.504381, 0, 0.8862745, 1, 1,
0.1400137, -0.3038008, 1.458047, 0, 0.8784314, 1, 1,
0.147615, -0.752748, 3.3965, 0, 0.8745098, 1, 1,
0.150984, -0.8927072, 2.404016, 0, 0.8666667, 1, 1,
0.1514632, 1.13397, -0.7117908, 0, 0.8627451, 1, 1,
0.1567414, -0.8730372, 3.022922, 0, 0.854902, 1, 1,
0.1583315, -0.1507263, 2.038017, 0, 0.8509804, 1, 1,
0.1636757, 0.1277151, 0.8396749, 0, 0.8431373, 1, 1,
0.166498, 0.4857558, -0.9211103, 0, 0.8392157, 1, 1,
0.1674515, 1.017427, -0.3405589, 0, 0.8313726, 1, 1,
0.1698045, 0.3902457, 1.604636, 0, 0.827451, 1, 1,
0.1712398, 1.131471, 1.330135, 0, 0.8196079, 1, 1,
0.1716186, -0.07510747, 2.063933, 0, 0.8156863, 1, 1,
0.1756356, -1.291824, 1.741906, 0, 0.8078431, 1, 1,
0.1758427, 0.4699435, 1.099731, 0, 0.8039216, 1, 1,
0.1796025, -0.8452334, 4.334138, 0, 0.7960784, 1, 1,
0.185706, 0.2917588, -0.284091, 0, 0.7882353, 1, 1,
0.189089, -0.4001325, 3.723378, 0, 0.7843137, 1, 1,
0.1896271, 0.05491657, 2.843138, 0, 0.7764706, 1, 1,
0.1896292, -0.009295608, 1.010383, 0, 0.772549, 1, 1,
0.1922464, 0.370158, 1.144262, 0, 0.7647059, 1, 1,
0.1935169, -0.3340739, 1.724416, 0, 0.7607843, 1, 1,
0.1938012, -0.4224199, 4.191668, 0, 0.7529412, 1, 1,
0.197888, 0.1618361, 1.950134, 0, 0.7490196, 1, 1,
0.1988904, -1.479382, 2.777656, 0, 0.7411765, 1, 1,
0.2058468, 0.4074495, 1.782495, 0, 0.7372549, 1, 1,
0.2087041, 0.9004474, 1.108116, 0, 0.7294118, 1, 1,
0.208905, 1.072758, 1.919838, 0, 0.7254902, 1, 1,
0.2100153, 1.02131, 0.1475842, 0, 0.7176471, 1, 1,
0.2202296, 2.144388, 1.191667, 0, 0.7137255, 1, 1,
0.2206581, 0.1289859, 2.803534, 0, 0.7058824, 1, 1,
0.2234501, -0.1471987, 0.8533975, 0, 0.6980392, 1, 1,
0.226526, -0.5764496, 2.924902, 0, 0.6941177, 1, 1,
0.2309197, -0.01246831, 3.82333, 0, 0.6862745, 1, 1,
0.2430705, -2.514483, 3.204624, 0, 0.682353, 1, 1,
0.2431493, 0.07852022, 2.392315, 0, 0.6745098, 1, 1,
0.2431813, -0.9171468, 2.171324, 0, 0.6705883, 1, 1,
0.2462369, -0.9978039, 2.058407, 0, 0.6627451, 1, 1,
0.2474083, -0.03442251, 2.991603, 0, 0.6588235, 1, 1,
0.248647, -3.726792, 4.300844, 0, 0.6509804, 1, 1,
0.2488054, 0.9007132, -0.9927896, 0, 0.6470588, 1, 1,
0.2518052, 1.461866, -0.3325642, 0, 0.6392157, 1, 1,
0.2546067, -0.3667139, 2.32175, 0, 0.6352941, 1, 1,
0.2551032, 2.096351, 0.3266588, 0, 0.627451, 1, 1,
0.2598982, -0.6505639, 2.079651, 0, 0.6235294, 1, 1,
0.2638786, 1.885385, 0.8089324, 0, 0.6156863, 1, 1,
0.2656904, -1.867799, 2.953768, 0, 0.6117647, 1, 1,
0.2673199, -1.224455, 0.7922946, 0, 0.6039216, 1, 1,
0.271666, 0.7951798, 1.248521, 0, 0.5960785, 1, 1,
0.2728169, -0.9936076, 3.21766, 0, 0.5921569, 1, 1,
0.277897, -0.7777954, 0.4946528, 0, 0.5843138, 1, 1,
0.2860739, -0.7963849, 2.428254, 0, 0.5803922, 1, 1,
0.2894595, 1.271756, 1.131327, 0, 0.572549, 1, 1,
0.2976904, -1.264208, 3.00615, 0, 0.5686275, 1, 1,
0.2983291, -0.9297923, 2.493216, 0, 0.5607843, 1, 1,
0.2992355, -0.3701342, 3.474674, 0, 0.5568628, 1, 1,
0.3022653, 0.6843135, 2.197536, 0, 0.5490196, 1, 1,
0.3040408, 0.7395189, -0.439956, 0, 0.5450981, 1, 1,
0.3043289, 0.6516109, -0.4000539, 0, 0.5372549, 1, 1,
0.3044422, -0.269131, 2.221087, 0, 0.5333334, 1, 1,
0.3058724, -1.103279, 4.949996, 0, 0.5254902, 1, 1,
0.3092967, 0.8358895, 0.335158, 0, 0.5215687, 1, 1,
0.3102798, 0.7854604, -0.1111753, 0, 0.5137255, 1, 1,
0.3123412, 0.06343539, 2.819402, 0, 0.509804, 1, 1,
0.3156374, -0.896973, 5.057667, 0, 0.5019608, 1, 1,
0.3177579, 1.487276, 0.5138558, 0, 0.4941176, 1, 1,
0.3267173, 0.0895729, 0.4370872, 0, 0.4901961, 1, 1,
0.3293565, 0.4128058, 1.360243, 0, 0.4823529, 1, 1,
0.3303031, -0.9272655, 2.650229, 0, 0.4784314, 1, 1,
0.3353382, 0.3342306, 0.4375515, 0, 0.4705882, 1, 1,
0.3377018, -0.9606259, 1.017577, 0, 0.4666667, 1, 1,
0.3379692, 1.33811, -1.119069, 0, 0.4588235, 1, 1,
0.3390667, -2.193018, 2.860447, 0, 0.454902, 1, 1,
0.339617, -0.9523502, 1.669217, 0, 0.4470588, 1, 1,
0.3409078, -0.1391718, 2.347214, 0, 0.4431373, 1, 1,
0.3412161, -0.4714557, 3.748815, 0, 0.4352941, 1, 1,
0.3434255, 0.7106428, 0.370304, 0, 0.4313726, 1, 1,
0.3480943, -0.4393212, 1.636678, 0, 0.4235294, 1, 1,
0.3490332, 0.7720104, 0.9579015, 0, 0.4196078, 1, 1,
0.3514372, 0.9438429, 2.208113, 0, 0.4117647, 1, 1,
0.3539079, -1.222609, 3.244736, 0, 0.4078431, 1, 1,
0.35429, 0.828192, -0.04218244, 0, 0.4, 1, 1,
0.3551552, -0.5613006, 1.204901, 0, 0.3921569, 1, 1,
0.3603879, 0.9848529, 0.3636644, 0, 0.3882353, 1, 1,
0.3618185, -1.467742, 2.547956, 0, 0.3803922, 1, 1,
0.3667394, -0.1166449, 1.54519, 0, 0.3764706, 1, 1,
0.367945, 1.478959, 0.3619857, 0, 0.3686275, 1, 1,
0.3705253, 1.315757, 1.180533, 0, 0.3647059, 1, 1,
0.3711789, -0.1638403, 0.1214507, 0, 0.3568628, 1, 1,
0.3729128, -1.990264, 3.264616, 0, 0.3529412, 1, 1,
0.3733161, 1.252287, 2.577716, 0, 0.345098, 1, 1,
0.3752377, -1.02768, 0.6899886, 0, 0.3411765, 1, 1,
0.3829402, 0.1461021, -0.1121061, 0, 0.3333333, 1, 1,
0.3859569, -0.601631, 3.35979, 0, 0.3294118, 1, 1,
0.3863853, -0.1985389, 2.093019, 0, 0.3215686, 1, 1,
0.3880011, -0.05647078, 1.572999, 0, 0.3176471, 1, 1,
0.4015221, -0.8717019, 1.960424, 0, 0.3098039, 1, 1,
0.4023737, 0.1848257, 3.929743, 0, 0.3058824, 1, 1,
0.4037899, -0.002135191, 2.17801, 0, 0.2980392, 1, 1,
0.4078439, -0.05576154, 2.460506, 0, 0.2901961, 1, 1,
0.4111636, -1.083172, 4.193724, 0, 0.2862745, 1, 1,
0.413598, -1.921572, 3.85125, 0, 0.2784314, 1, 1,
0.4170688, -2.093858, 4.141655, 0, 0.2745098, 1, 1,
0.4179607, -2.115688, 2.096244, 0, 0.2666667, 1, 1,
0.4184663, 0.5326027, 0.9844134, 0, 0.2627451, 1, 1,
0.4202408, -0.3635591, 4.143744, 0, 0.254902, 1, 1,
0.4213489, 0.8853943, -0.5195532, 0, 0.2509804, 1, 1,
0.4225878, -0.1785301, 0.7465605, 0, 0.2431373, 1, 1,
0.4262063, 1.373913, 0.1618011, 0, 0.2392157, 1, 1,
0.4275531, 0.4917558, 0.686438, 0, 0.2313726, 1, 1,
0.4358704, -2.853193, 2.148997, 0, 0.227451, 1, 1,
0.4368995, 2.014685, 0.989387, 0, 0.2196078, 1, 1,
0.4451885, -1.57436, 2.43051, 0, 0.2156863, 1, 1,
0.4482017, -0.6664441, 2.527276, 0, 0.2078431, 1, 1,
0.4487308, 1.383434, 0.4631886, 0, 0.2039216, 1, 1,
0.4494676, -0.630554, 3.208035, 0, 0.1960784, 1, 1,
0.4538701, 1.559679, -1.23779, 0, 0.1882353, 1, 1,
0.460291, 2.825906, 0.2801347, 0, 0.1843137, 1, 1,
0.4649026, 0.2528221, 1.005376, 0, 0.1764706, 1, 1,
0.4675526, 0.8649504, -1.037008, 0, 0.172549, 1, 1,
0.4686652, -0.7764983, 2.24958, 0, 0.1647059, 1, 1,
0.4707848, -0.4878235, 2.13254, 0, 0.1607843, 1, 1,
0.4773747, -0.8741947, 0.4723871, 0, 0.1529412, 1, 1,
0.4798937, 0.5868893, -0.09789783, 0, 0.1490196, 1, 1,
0.4810766, -0.08470211, 0.3876379, 0, 0.1411765, 1, 1,
0.4811694, 0.1662406, 1.868825, 0, 0.1372549, 1, 1,
0.4828921, -1.043104, 2.185344, 0, 0.1294118, 1, 1,
0.483227, 0.9056746, -0.3979731, 0, 0.1254902, 1, 1,
0.4839948, 1.83223, -1.134391, 0, 0.1176471, 1, 1,
0.4880603, -0.9589606, 2.30311, 0, 0.1137255, 1, 1,
0.4913322, -0.5782482, 2.344686, 0, 0.1058824, 1, 1,
0.4927485, 0.03267589, 2.461069, 0, 0.09803922, 1, 1,
0.5003911, 0.7160552, 0.4121341, 0, 0.09411765, 1, 1,
0.5013429, 0.1345042, 3.65652, 0, 0.08627451, 1, 1,
0.504141, 0.2781137, -0.4939974, 0, 0.08235294, 1, 1,
0.5072629, 0.04394592, 1.254163, 0, 0.07450981, 1, 1,
0.5087526, 1.007639, 0.5060976, 0, 0.07058824, 1, 1,
0.5115009, -1.023429, 2.674083, 0, 0.0627451, 1, 1,
0.5126258, 1.397402, 1.894063, 0, 0.05882353, 1, 1,
0.5156182, 0.3404756, 0.9374831, 0, 0.05098039, 1, 1,
0.5254565, -0.8967681, 2.830516, 0, 0.04705882, 1, 1,
0.5257044, 0.2869277, 2.333682, 0, 0.03921569, 1, 1,
0.5283034, 1.280701, 0.03768132, 0, 0.03529412, 1, 1,
0.5339025, 0.6988888, 1.740031, 0, 0.02745098, 1, 1,
0.5417881, -0.6493102, 1.736914, 0, 0.02352941, 1, 1,
0.5431236, -1.127337, 3.27666, 0, 0.01568628, 1, 1,
0.5434536, -0.8161585, 2.191741, 0, 0.01176471, 1, 1,
0.5435874, 1.029912, 0.8418222, 0, 0.003921569, 1, 1,
0.5459522, -0.7601967, 2.593444, 0.003921569, 0, 1, 1,
0.5470445, 0.1376232, 0.3802353, 0.007843138, 0, 1, 1,
0.5506743, -2.046544, 4.080874, 0.01568628, 0, 1, 1,
0.5507755, -0.4066669, 2.06629, 0.01960784, 0, 1, 1,
0.5521192, 1.222628, 0.4930458, 0.02745098, 0, 1, 1,
0.5539675, 3.422773, -0.455293, 0.03137255, 0, 1, 1,
0.5593393, 0.9849886, -0.4601325, 0.03921569, 0, 1, 1,
0.5646333, -1.884636, 2.274656, 0.04313726, 0, 1, 1,
0.5803062, -1.572562, 3.84484, 0.05098039, 0, 1, 1,
0.6006227, 1.067939, 0.7994272, 0.05490196, 0, 1, 1,
0.6027923, -0.6212897, 3.769409, 0.0627451, 0, 1, 1,
0.6034412, 0.8253476, 1.041407, 0.06666667, 0, 1, 1,
0.6108685, 1.705781, 1.367177, 0.07450981, 0, 1, 1,
0.6110291, -0.3926862, 2.307961, 0.07843138, 0, 1, 1,
0.6128177, 0.7094814, -0.1363087, 0.08627451, 0, 1, 1,
0.6132581, -1.675435, 4.237876, 0.09019608, 0, 1, 1,
0.6149483, -0.002021234, 1.209788, 0.09803922, 0, 1, 1,
0.6174289, -0.7780727, 3.97346, 0.1058824, 0, 1, 1,
0.6237704, 0.9103358, 1.362924, 0.1098039, 0, 1, 1,
0.6332427, 0.2465246, 1.129456, 0.1176471, 0, 1, 1,
0.6360449, 1.700475, 0.8591365, 0.1215686, 0, 1, 1,
0.6401008, 0.1470146, 1.218783, 0.1294118, 0, 1, 1,
0.6447375, -1.334272, 2.697384, 0.1333333, 0, 1, 1,
0.6532965, -1.55106, 3.340341, 0.1411765, 0, 1, 1,
0.657815, -0.876729, 2.183473, 0.145098, 0, 1, 1,
0.6584699, 0.9267942, 0.8879317, 0.1529412, 0, 1, 1,
0.6628339, 0.4433319, 1.425927, 0.1568628, 0, 1, 1,
0.6629124, 0.8474201, 1.454516, 0.1647059, 0, 1, 1,
0.6654677, 0.2893708, 1.91561, 0.1686275, 0, 1, 1,
0.6655149, -1.604077, 3.977445, 0.1764706, 0, 1, 1,
0.6661733, 0.5210816, 2.894583, 0.1803922, 0, 1, 1,
0.676297, 0.4718333, 0.7252603, 0.1882353, 0, 1, 1,
0.6852092, -0.5027141, 1.849993, 0.1921569, 0, 1, 1,
0.6901572, 0.6052319, 1.678118, 0.2, 0, 1, 1,
0.6947486, -1.824925, 2.292131, 0.2078431, 0, 1, 1,
0.6985193, -0.1649915, 2.25452, 0.2117647, 0, 1, 1,
0.7003902, -0.6923601, 2.718089, 0.2196078, 0, 1, 1,
0.7012724, 1.287485, 1.314528, 0.2235294, 0, 1, 1,
0.7036789, 0.203519, -1.08859, 0.2313726, 0, 1, 1,
0.7044085, 0.6926203, 2.906236, 0.2352941, 0, 1, 1,
0.7048317, -0.02783036, 1.926699, 0.2431373, 0, 1, 1,
0.7065611, 0.06516812, 0.0467262, 0.2470588, 0, 1, 1,
0.7074339, 0.6052452, 1.260826, 0.254902, 0, 1, 1,
0.7110338, 1.096001, 2.416048, 0.2588235, 0, 1, 1,
0.7181872, 0.5225552, 1.055818, 0.2666667, 0, 1, 1,
0.7190778, -0.8594882, 1.26596, 0.2705882, 0, 1, 1,
0.7238845, 0.8476968, 1.51332, 0.2784314, 0, 1, 1,
0.72394, -0.4429303, 2.039401, 0.282353, 0, 1, 1,
0.7242457, 1.090229, 2.9742, 0.2901961, 0, 1, 1,
0.7250957, 0.5999768, 1.870933, 0.2941177, 0, 1, 1,
0.7336391, 1.006063, 0.03666641, 0.3019608, 0, 1, 1,
0.7347905, -0.4921834, 1.458681, 0.3098039, 0, 1, 1,
0.7451689, 0.6368549, 0.604691, 0.3137255, 0, 1, 1,
0.7471184, 0.09493868, 1.812373, 0.3215686, 0, 1, 1,
0.7485615, 0.5777659, 1.592444, 0.3254902, 0, 1, 1,
0.7519733, 1.573242, 0.9595404, 0.3333333, 0, 1, 1,
0.7523851, 0.01304346, 1.497861, 0.3372549, 0, 1, 1,
0.7613195, -0.2387592, 1.44028, 0.345098, 0, 1, 1,
0.7651854, -0.1963495, 1.166414, 0.3490196, 0, 1, 1,
0.7654241, -0.04984611, 1.415087, 0.3568628, 0, 1, 1,
0.7658114, -1.351219, 2.85361, 0.3607843, 0, 1, 1,
0.7673376, 0.2115355, 2.336155, 0.3686275, 0, 1, 1,
0.773621, -0.275113, 4.555717, 0.372549, 0, 1, 1,
0.774269, -0.06486351, 3.124752, 0.3803922, 0, 1, 1,
0.7789389, 0.1834898, 0.785798, 0.3843137, 0, 1, 1,
0.7848062, -0.6506217, 4.187584, 0.3921569, 0, 1, 1,
0.7856509, -1.242968, 3.104748, 0.3960784, 0, 1, 1,
0.7965955, 0.3040576, 1.479202, 0.4039216, 0, 1, 1,
0.7992694, -1.158192, 3.409943, 0.4117647, 0, 1, 1,
0.8034708, -0.5604481, 3.403947, 0.4156863, 0, 1, 1,
0.8096554, 0.9201043, 0.735023, 0.4235294, 0, 1, 1,
0.8102381, -2.082072, 2.360744, 0.427451, 0, 1, 1,
0.8130012, -0.7436689, 1.938038, 0.4352941, 0, 1, 1,
0.8131266, 0.2564976, 2.567144, 0.4392157, 0, 1, 1,
0.8152159, 0.3348934, 1.511246, 0.4470588, 0, 1, 1,
0.8201128, -0.09626573, 2.55057, 0.4509804, 0, 1, 1,
0.8219764, 1.571832, -0.3195227, 0.4588235, 0, 1, 1,
0.8243064, -1.408692, 2.673433, 0.4627451, 0, 1, 1,
0.8248444, 0.1321623, 1.407387, 0.4705882, 0, 1, 1,
0.8259626, -0.3130741, 2.771168, 0.4745098, 0, 1, 1,
0.8332874, -1.574762, 3.042811, 0.4823529, 0, 1, 1,
0.8337389, -0.3833724, 1.49429, 0.4862745, 0, 1, 1,
0.8340966, -0.1675415, 1.095252, 0.4941176, 0, 1, 1,
0.847315, -0.07879812, 2.742594, 0.5019608, 0, 1, 1,
0.8533391, 0.1158197, 1.234599, 0.5058824, 0, 1, 1,
0.853492, -0.7371274, 0.6562198, 0.5137255, 0, 1, 1,
0.8540706, -1.338668, 1.638037, 0.5176471, 0, 1, 1,
0.8544264, -0.06416681, 0.3261154, 0.5254902, 0, 1, 1,
0.8563711, -0.3237932, 1.678607, 0.5294118, 0, 1, 1,
0.8565536, -0.3082483, 3.042591, 0.5372549, 0, 1, 1,
0.858484, 0.6680887, -0.7862965, 0.5411765, 0, 1, 1,
0.8587956, 0.846251, 0.1058458, 0.5490196, 0, 1, 1,
0.8592171, -1.585787, 0.8059029, 0.5529412, 0, 1, 1,
0.8614882, 0.08704574, 2.244577, 0.5607843, 0, 1, 1,
0.8632135, 0.1560636, 2.59981, 0.5647059, 0, 1, 1,
0.8651103, 0.6801119, -0.08019553, 0.572549, 0, 1, 1,
0.8681802, -1.564765, 0.4295585, 0.5764706, 0, 1, 1,
0.8715743, 0.6838595, 2.917984, 0.5843138, 0, 1, 1,
0.8730199, 1.185417, 1.454426, 0.5882353, 0, 1, 1,
0.8800382, -2.638217, 3.492507, 0.5960785, 0, 1, 1,
0.8809918, -0.1539056, 2.054644, 0.6039216, 0, 1, 1,
0.8814169, 1.201073, 0.2413371, 0.6078432, 0, 1, 1,
0.8874645, -0.0008812551, 2.360911, 0.6156863, 0, 1, 1,
0.890352, -1.127121, 4.8109, 0.6196079, 0, 1, 1,
0.8952941, -0.6643901, 2.100998, 0.627451, 0, 1, 1,
0.8962065, 1.158315, -0.4930243, 0.6313726, 0, 1, 1,
0.8968705, -0.5931786, 2.371659, 0.6392157, 0, 1, 1,
0.9063793, 0.5570786, -1.333442, 0.6431373, 0, 1, 1,
0.9069297, -0.7063204, 1.824383, 0.6509804, 0, 1, 1,
0.9108133, 1.60371, 0.9003127, 0.654902, 0, 1, 1,
0.9110939, 1.605697, 0.7373666, 0.6627451, 0, 1, 1,
0.9123645, 1.10533, 0.5022092, 0.6666667, 0, 1, 1,
0.9163079, 0.9393921, 0.5527801, 0.6745098, 0, 1, 1,
0.9223694, 0.4717689, 0.6431856, 0.6784314, 0, 1, 1,
0.9245381, 0.908438, 1.995208, 0.6862745, 0, 1, 1,
0.9251002, 0.08682231, 1.708923, 0.6901961, 0, 1, 1,
0.9264675, 0.9219046, 0.7470618, 0.6980392, 0, 1, 1,
0.9281977, -2.487957, 1.604881, 0.7058824, 0, 1, 1,
0.9303614, -1.676529, 2.170635, 0.7098039, 0, 1, 1,
0.9316849, 0.4181735, 1.120589, 0.7176471, 0, 1, 1,
0.9317989, 0.3670989, 1.923977, 0.7215686, 0, 1, 1,
0.932314, 0.400542, 2.146422, 0.7294118, 0, 1, 1,
0.934625, 0.09109245, 2.304775, 0.7333333, 0, 1, 1,
0.9349211, -0.08400466, 1.401712, 0.7411765, 0, 1, 1,
0.9372001, -0.3020003, 3.081946, 0.7450981, 0, 1, 1,
0.9384313, 0.1710694, 2.258829, 0.7529412, 0, 1, 1,
0.944972, 0.2115128, 2.12458, 0.7568628, 0, 1, 1,
0.9473374, 0.1896694, 2.572201, 0.7647059, 0, 1, 1,
0.9491473, -0.7816051, 2.298715, 0.7686275, 0, 1, 1,
0.9510498, 0.441183, 1.101767, 0.7764706, 0, 1, 1,
0.9589446, 1.095632, 1.418032, 0.7803922, 0, 1, 1,
0.9604465, 0.1032472, 1.369653, 0.7882353, 0, 1, 1,
0.960718, 0.4381809, 0.9815576, 0.7921569, 0, 1, 1,
0.9652507, -0.5994909, 0.5460697, 0.8, 0, 1, 1,
0.9724076, 1.199584, 0.08754306, 0.8078431, 0, 1, 1,
0.9729105, 0.8004074, 0.08168335, 0.8117647, 0, 1, 1,
0.9794269, 0.4705441, 0.574558, 0.8196079, 0, 1, 1,
0.9810734, 0.8823671, -1.27769, 0.8235294, 0, 1, 1,
0.9844451, -0.8367239, 1.792558, 0.8313726, 0, 1, 1,
0.985204, -0.6738542, 0.6205255, 0.8352941, 0, 1, 1,
0.9874255, 0.2295734, 3.541824, 0.8431373, 0, 1, 1,
0.9961643, -1.339666, 0.6767892, 0.8470588, 0, 1, 1,
1.002086, -0.6108398, 1.456732, 0.854902, 0, 1, 1,
1.008292, -0.04753944, 0.5158476, 0.8588235, 0, 1, 1,
1.010178, -0.4717424, 1.486719, 0.8666667, 0, 1, 1,
1.022967, 2.279752, -0.8027948, 0.8705882, 0, 1, 1,
1.024262, 0.2508209, 2.871157, 0.8784314, 0, 1, 1,
1.027212, 1.230568, 1.793695, 0.8823529, 0, 1, 1,
1.028966, 0.1304545, 2.404296, 0.8901961, 0, 1, 1,
1.033826, -1.692458, 2.721987, 0.8941177, 0, 1, 1,
1.034465, -0.9536428, 3.195999, 0.9019608, 0, 1, 1,
1.040791, -0.02200792, -0.2006443, 0.9098039, 0, 1, 1,
1.043138, -0.8522882, 0.8234763, 0.9137255, 0, 1, 1,
1.050697, 0.866363, 0.6092365, 0.9215686, 0, 1, 1,
1.052473, -0.8925362, 2.917054, 0.9254902, 0, 1, 1,
1.056327, -2.074143, 2.380893, 0.9333333, 0, 1, 1,
1.060109, 0.9012483, 1.756985, 0.9372549, 0, 1, 1,
1.060193, -0.4310761, 2.392797, 0.945098, 0, 1, 1,
1.061698, -0.7950255, 2.667842, 0.9490196, 0, 1, 1,
1.067066, -0.2910665, 1.092052, 0.9568627, 0, 1, 1,
1.070939, -2.341386, 3.301986, 0.9607843, 0, 1, 1,
1.072487, 0.07692502, 0.9385334, 0.9686275, 0, 1, 1,
1.088685, 0.202307, 0.9062188, 0.972549, 0, 1, 1,
1.093811, -0.2874953, 1.927672, 0.9803922, 0, 1, 1,
1.097813, 0.5990307, 1.791315, 0.9843137, 0, 1, 1,
1.103881, -2.648177, 2.110546, 0.9921569, 0, 1, 1,
1.104725, 0.8152449, 0.4349174, 0.9960784, 0, 1, 1,
1.119528, 0.3153712, 0.6901741, 1, 0, 0.9960784, 1,
1.121237, 0.9647911, 0.6049728, 1, 0, 0.9882353, 1,
1.126571, -0.6933036, 1.158925, 1, 0, 0.9843137, 1,
1.127329, 2.70661, 2.101418, 1, 0, 0.9764706, 1,
1.127882, -0.9926956, 2.490827, 1, 0, 0.972549, 1,
1.133637, 0.8412141, 1.747629, 1, 0, 0.9647059, 1,
1.139811, -0.3416423, 3.565729, 1, 0, 0.9607843, 1,
1.140873, -0.7456411, 1.312309, 1, 0, 0.9529412, 1,
1.143005, 1.052301, 1.156845, 1, 0, 0.9490196, 1,
1.145791, 0.05920997, 0.9195061, 1, 0, 0.9411765, 1,
1.149388, 0.7375326, 0.8114696, 1, 0, 0.9372549, 1,
1.150987, -1.016049, 3.284264, 1, 0, 0.9294118, 1,
1.154487, 0.1448324, 2.369215, 1, 0, 0.9254902, 1,
1.155576, -0.02730348, 2.364057, 1, 0, 0.9176471, 1,
1.160509, -1.318986, 4.771967, 1, 0, 0.9137255, 1,
1.169822, -0.01753006, 2.741218, 1, 0, 0.9058824, 1,
1.170999, -0.04428857, 0.8547659, 1, 0, 0.9019608, 1,
1.174636, 0.5610431, 1.638469, 1, 0, 0.8941177, 1,
1.175672, -2.005643, 3.799648, 1, 0, 0.8862745, 1,
1.178977, 0.5854793, 2.183632, 1, 0, 0.8823529, 1,
1.186721, -1.285235, 0.01386987, 1, 0, 0.8745098, 1,
1.193785, -2.628882, 1.309303, 1, 0, 0.8705882, 1,
1.197249, 0.4347189, 2.192029, 1, 0, 0.8627451, 1,
1.201927, 1.836107, -0.5936388, 1, 0, 0.8588235, 1,
1.202782, -1.416253, 1.028755, 1, 0, 0.8509804, 1,
1.20286, -0.9565735, 3.022289, 1, 0, 0.8470588, 1,
1.215265, -0.9383331, 1.986705, 1, 0, 0.8392157, 1,
1.236067, -1.149586, 2.208636, 1, 0, 0.8352941, 1,
1.238322, 0.2425849, 0.1455161, 1, 0, 0.827451, 1,
1.242936, 0.181974, 2.076334, 1, 0, 0.8235294, 1,
1.243204, -0.2869236, -0.2976582, 1, 0, 0.8156863, 1,
1.243522, 0.6019359, 1.04804, 1, 0, 0.8117647, 1,
1.258739, -0.08058144, 2.876981, 1, 0, 0.8039216, 1,
1.263839, -0.5318661, -0.09409834, 1, 0, 0.7960784, 1,
1.266682, 0.7921465, 0.551233, 1, 0, 0.7921569, 1,
1.267119, -0.3958761, 1.616977, 1, 0, 0.7843137, 1,
1.267269, -0.6813095, 0.7081727, 1, 0, 0.7803922, 1,
1.27088, -0.7899281, 1.867484, 1, 0, 0.772549, 1,
1.276648, 0.9789108, 2.966239, 1, 0, 0.7686275, 1,
1.284397, -1.250442, 0.9488556, 1, 0, 0.7607843, 1,
1.290873, -0.3043864, 0.8051305, 1, 0, 0.7568628, 1,
1.291104, 0.6993366, 3.28865, 1, 0, 0.7490196, 1,
1.306601, 1.343206, 0.3184866, 1, 0, 0.7450981, 1,
1.316943, 2.421855, 0.4417264, 1, 0, 0.7372549, 1,
1.32383, 0.9060312, 0.6741178, 1, 0, 0.7333333, 1,
1.323882, -0.4559335, 1.179617, 1, 0, 0.7254902, 1,
1.340141, -1.996541, 2.168735, 1, 0, 0.7215686, 1,
1.341533, -0.1969366, 1.880983, 1, 0, 0.7137255, 1,
1.341597, 0.3098088, 1.484133, 1, 0, 0.7098039, 1,
1.342769, -0.04908582, 1.157072, 1, 0, 0.7019608, 1,
1.351961, 0.7030882, 0.2495709, 1, 0, 0.6941177, 1,
1.352985, 0.03955033, 3.111622, 1, 0, 0.6901961, 1,
1.353758, 0.7086153, -0.05093062, 1, 0, 0.682353, 1,
1.353821, -1.622034, 0.4850206, 1, 0, 0.6784314, 1,
1.353902, -0.8082982, 0.8506816, 1, 0, 0.6705883, 1,
1.359273, -0.5865437, 4.358204, 1, 0, 0.6666667, 1,
1.362955, 0.2131733, 2.728393, 1, 0, 0.6588235, 1,
1.374247, 0.5740688, 1.54003, 1, 0, 0.654902, 1,
1.385189, -0.9338128, 2.060078, 1, 0, 0.6470588, 1,
1.38622, -0.3341455, 1.229811, 1, 0, 0.6431373, 1,
1.39637, 1.646389, 4.024935, 1, 0, 0.6352941, 1,
1.399347, -1.196826, 4.49137, 1, 0, 0.6313726, 1,
1.413788, -0.9188243, 0.472291, 1, 0, 0.6235294, 1,
1.424503, 0.6732492, -0.6892711, 1, 0, 0.6196079, 1,
1.42803, -1.484533, 3.310152, 1, 0, 0.6117647, 1,
1.430165, 0.4000211, 2.054988, 1, 0, 0.6078432, 1,
1.433692, 0.5955989, 0.5936744, 1, 0, 0.6, 1,
1.433905, -0.3569769, 2.708635, 1, 0, 0.5921569, 1,
1.438307, 0.2664094, 0.866524, 1, 0, 0.5882353, 1,
1.43883, 0.5323646, 2.763448, 1, 0, 0.5803922, 1,
1.442105, -0.2088493, 1.935795, 1, 0, 0.5764706, 1,
1.444792, -1.253488, 3.360261, 1, 0, 0.5686275, 1,
1.452111, 0.5264221, 1.211105, 1, 0, 0.5647059, 1,
1.460772, 0.413221, 0.04954931, 1, 0, 0.5568628, 1,
1.469, -0.05245856, 1.84494, 1, 0, 0.5529412, 1,
1.485283, -0.4960899, 2.34696, 1, 0, 0.5450981, 1,
1.49141, 1.561388, 1.289083, 1, 0, 0.5411765, 1,
1.49497, -0.02375471, 2.127, 1, 0, 0.5333334, 1,
1.495763, -0.8488714, 2.240554, 1, 0, 0.5294118, 1,
1.498725, -0.4108396, 2.085953, 1, 0, 0.5215687, 1,
1.499549, -0.9399852, 2.977315, 1, 0, 0.5176471, 1,
1.515417, 1.154234, 0.9522513, 1, 0, 0.509804, 1,
1.522749, -0.42947, 2.125394, 1, 0, 0.5058824, 1,
1.528395, 0.006036341, 1.591966, 1, 0, 0.4980392, 1,
1.530622, 0.5815667, 0.2958974, 1, 0, 0.4901961, 1,
1.537332, -0.07506958, 3.290832, 1, 0, 0.4862745, 1,
1.537568, -1.683665, 2.823654, 1, 0, 0.4784314, 1,
1.539739, -1.872035, 3.723285, 1, 0, 0.4745098, 1,
1.556434, 0.5517406, 2.156843, 1, 0, 0.4666667, 1,
1.565896, 1.08377, 1.116022, 1, 0, 0.4627451, 1,
1.568091, 0.06219518, 0.3262747, 1, 0, 0.454902, 1,
1.575994, -0.2305971, 1.42233, 1, 0, 0.4509804, 1,
1.582176, 0.3581992, 0.5902759, 1, 0, 0.4431373, 1,
1.582827, 0.7517048, 2.954532, 1, 0, 0.4392157, 1,
1.587748, 0.2078466, 3.09874, 1, 0, 0.4313726, 1,
1.598497, -0.122996, -0.2187833, 1, 0, 0.427451, 1,
1.607211, 0.1008422, 1.686999, 1, 0, 0.4196078, 1,
1.611546, -0.4935741, 1.901363, 1, 0, 0.4156863, 1,
1.638279, -0.8191656, 1.163988, 1, 0, 0.4078431, 1,
1.639917, 1.039805, -0.5813842, 1, 0, 0.4039216, 1,
1.641579, 0.5926124, 0.6369892, 1, 0, 0.3960784, 1,
1.647795, 0.6971716, 3.099064, 1, 0, 0.3882353, 1,
1.666912, -0.6672758, 2.632466, 1, 0, 0.3843137, 1,
1.67358, 0.2989063, 3.410569, 1, 0, 0.3764706, 1,
1.675734, 0.1450483, 0.6130961, 1, 0, 0.372549, 1,
1.681202, 0.1380631, 1.302558, 1, 0, 0.3647059, 1,
1.68856, -1.446689, 0.53356, 1, 0, 0.3607843, 1,
1.693536, -0.2409302, 3.002273, 1, 0, 0.3529412, 1,
1.708361, 0.4799357, 1.289108, 1, 0, 0.3490196, 1,
1.711173, -0.05525228, 1.242297, 1, 0, 0.3411765, 1,
1.712586, 0.8571968, 1.116235, 1, 0, 0.3372549, 1,
1.714235, 0.09374715, 0.3445038, 1, 0, 0.3294118, 1,
1.720126, -0.2872157, 2.410143, 1, 0, 0.3254902, 1,
1.722415, -0.2661993, 1.589862, 1, 0, 0.3176471, 1,
1.72567, 0.1687615, 2.057295, 1, 0, 0.3137255, 1,
1.74201, -0.9079427, 2.778958, 1, 0, 0.3058824, 1,
1.751333, -1.288283, 0.9986975, 1, 0, 0.2980392, 1,
1.76006, 1.216149, 1.137218, 1, 0, 0.2941177, 1,
1.76441, -1.716399, 3.469693, 1, 0, 0.2862745, 1,
1.766461, -3.876506, 2.717916, 1, 0, 0.282353, 1,
1.779108, -0.6673893, 2.551991, 1, 0, 0.2745098, 1,
1.779722, 0.8488439, 1.767139, 1, 0, 0.2705882, 1,
1.787199, -0.3012004, 0.03187139, 1, 0, 0.2627451, 1,
1.805619, 1.0537, 1.953797, 1, 0, 0.2588235, 1,
1.814909, 0.9865959, 1.601592, 1, 0, 0.2509804, 1,
1.837388, -0.9219525, 2.733392, 1, 0, 0.2470588, 1,
1.847129, -0.2290118, 0.8551145, 1, 0, 0.2392157, 1,
1.855523, 0.1489904, 0.9917923, 1, 0, 0.2352941, 1,
1.859548, 1.13877, 0.07537314, 1, 0, 0.227451, 1,
1.864727, 0.2032635, 0.9945593, 1, 0, 0.2235294, 1,
1.871378, -0.1930059, 0.5850046, 1, 0, 0.2156863, 1,
1.916558, -2.203036, 2.206989, 1, 0, 0.2117647, 1,
1.938711, 0.03908428, 0.6993966, 1, 0, 0.2039216, 1,
1.955658, 0.2033271, 2.371481, 1, 0, 0.1960784, 1,
1.961106, 0.2721674, 1.099438, 1, 0, 0.1921569, 1,
1.9717, -1.8456, 3.869562, 1, 0, 0.1843137, 1,
1.97891, -0.5534976, 4.080856, 1, 0, 0.1803922, 1,
1.986398, -0.6976992, -0.2881679, 1, 0, 0.172549, 1,
1.987319, -0.6971937, 2.395973, 1, 0, 0.1686275, 1,
1.997079, -0.6056553, -0.4593742, 1, 0, 0.1607843, 1,
2.003196, -0.1361996, 1.548946, 1, 0, 0.1568628, 1,
2.032326, -1.508516, 1.831198, 1, 0, 0.1490196, 1,
2.055419, 1.197016, -0.124717, 1, 0, 0.145098, 1,
2.08284, 0.6248803, 0.0857329, 1, 0, 0.1372549, 1,
2.092318, 1.155603, 2.394636, 1, 0, 0.1333333, 1,
2.104527, -0.5259579, 2.07165, 1, 0, 0.1254902, 1,
2.121991, 0.9247811, 0.3664909, 1, 0, 0.1215686, 1,
2.123351, -1.025154, 2.000947, 1, 0, 0.1137255, 1,
2.167911, -1.256354, 1.140662, 1, 0, 0.1098039, 1,
2.189888, -0.916145, 2.254594, 1, 0, 0.1019608, 1,
2.202282, 0.3757708, 1.691095, 1, 0, 0.09411765, 1,
2.202616, -1.791528, 1.373643, 1, 0, 0.09019608, 1,
2.293697, -2.179609, 1.671467, 1, 0, 0.08235294, 1,
2.325121, 0.7842785, 0.8095304, 1, 0, 0.07843138, 1,
2.375389, -0.06438322, 2.44756, 1, 0, 0.07058824, 1,
2.409308, 0.5458362, 1.040767, 1, 0, 0.06666667, 1,
2.432882, 0.2582077, 0.237778, 1, 0, 0.05882353, 1,
2.438231, 0.3385228, 1.318785, 1, 0, 0.05490196, 1,
2.468508, -0.6310366, 1.098634, 1, 0, 0.04705882, 1,
2.518582, -0.3225177, -0.06843038, 1, 0, 0.04313726, 1,
2.633942, -1.347813, 2.88891, 1, 0, 0.03529412, 1,
2.648546, -1.083934, 1.18376, 1, 0, 0.03137255, 1,
2.675368, -0.2636609, 2.532536, 1, 0, 0.02352941, 1,
2.698858, -0.07104035, 2.741055, 1, 0, 0.01960784, 1,
3.186157, 0.06908152, 2.779782, 1, 0, 0.01176471, 1,
3.272475, -0.6180581, 2.55157, 1, 0, 0.007843138, 1
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
0.1046991, -5.113733, -7.106723, 0, -0.5, 0.5, 0.5,
0.1046991, -5.113733, -7.106723, 1, -0.5, 0.5, 0.5,
0.1046991, -5.113733, -7.106723, 1, 1.5, 0.5, 0.5,
0.1046991, -5.113733, -7.106723, 0, 1.5, 0.5, 0.5
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
-4.136952, -0.2268664, -7.106723, 0, -0.5, 0.5, 0.5,
-4.136952, -0.2268664, -7.106723, 1, -0.5, 0.5, 0.5,
-4.136952, -0.2268664, -7.106723, 1, 1.5, 0.5, 0.5,
-4.136952, -0.2268664, -7.106723, 0, 1.5, 0.5, 0.5
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
-4.136952, -5.113733, 0.1870408, 0, -0.5, 0.5, 0.5,
-4.136952, -5.113733, 0.1870408, 1, -0.5, 0.5, 0.5,
-4.136952, -5.113733, 0.1870408, 1, 1.5, 0.5, 0.5,
-4.136952, -5.113733, 0.1870408, 0, 1.5, 0.5, 0.5
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
-3, -3.985995, -5.423546,
3, -3.985995, -5.423546,
-3, -3.985995, -5.423546,
-3, -4.173951, -5.704076,
-2, -3.985995, -5.423546,
-2, -4.173951, -5.704076,
-1, -3.985995, -5.423546,
-1, -4.173951, -5.704076,
0, -3.985995, -5.423546,
0, -4.173951, -5.704076,
1, -3.985995, -5.423546,
1, -4.173951, -5.704076,
2, -3.985995, -5.423546,
2, -4.173951, -5.704076,
3, -3.985995, -5.423546,
3, -4.173951, -5.704076
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
-3, -4.549864, -6.265135, 0, -0.5, 0.5, 0.5,
-3, -4.549864, -6.265135, 1, -0.5, 0.5, 0.5,
-3, -4.549864, -6.265135, 1, 1.5, 0.5, 0.5,
-3, -4.549864, -6.265135, 0, 1.5, 0.5, 0.5,
-2, -4.549864, -6.265135, 0, -0.5, 0.5, 0.5,
-2, -4.549864, -6.265135, 1, -0.5, 0.5, 0.5,
-2, -4.549864, -6.265135, 1, 1.5, 0.5, 0.5,
-2, -4.549864, -6.265135, 0, 1.5, 0.5, 0.5,
-1, -4.549864, -6.265135, 0, -0.5, 0.5, 0.5,
-1, -4.549864, -6.265135, 1, -0.5, 0.5, 0.5,
-1, -4.549864, -6.265135, 1, 1.5, 0.5, 0.5,
-1, -4.549864, -6.265135, 0, 1.5, 0.5, 0.5,
0, -4.549864, -6.265135, 0, -0.5, 0.5, 0.5,
0, -4.549864, -6.265135, 1, -0.5, 0.5, 0.5,
0, -4.549864, -6.265135, 1, 1.5, 0.5, 0.5,
0, -4.549864, -6.265135, 0, 1.5, 0.5, 0.5,
1, -4.549864, -6.265135, 0, -0.5, 0.5, 0.5,
1, -4.549864, -6.265135, 1, -0.5, 0.5, 0.5,
1, -4.549864, -6.265135, 1, 1.5, 0.5, 0.5,
1, -4.549864, -6.265135, 0, 1.5, 0.5, 0.5,
2, -4.549864, -6.265135, 0, -0.5, 0.5, 0.5,
2, -4.549864, -6.265135, 1, -0.5, 0.5, 0.5,
2, -4.549864, -6.265135, 1, 1.5, 0.5, 0.5,
2, -4.549864, -6.265135, 0, 1.5, 0.5, 0.5,
3, -4.549864, -6.265135, 0, -0.5, 0.5, 0.5,
3, -4.549864, -6.265135, 1, -0.5, 0.5, 0.5,
3, -4.549864, -6.265135, 1, 1.5, 0.5, 0.5,
3, -4.549864, -6.265135, 0, 1.5, 0.5, 0.5
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
-3.15811, -2, -5.423546,
-3.15811, 2, -5.423546,
-3.15811, -2, -5.423546,
-3.32125, -2, -5.704076,
-3.15811, 0, -5.423546,
-3.32125, 0, -5.704076,
-3.15811, 2, -5.423546,
-3.32125, 2, -5.704076
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
-3.647531, -2, -6.265135, 0, -0.5, 0.5, 0.5,
-3.647531, -2, -6.265135, 1, -0.5, 0.5, 0.5,
-3.647531, -2, -6.265135, 1, 1.5, 0.5, 0.5,
-3.647531, -2, -6.265135, 0, 1.5, 0.5, 0.5,
-3.647531, 0, -6.265135, 0, -0.5, 0.5, 0.5,
-3.647531, 0, -6.265135, 1, -0.5, 0.5, 0.5,
-3.647531, 0, -6.265135, 1, 1.5, 0.5, 0.5,
-3.647531, 0, -6.265135, 0, 1.5, 0.5, 0.5,
-3.647531, 2, -6.265135, 0, -0.5, 0.5, 0.5,
-3.647531, 2, -6.265135, 1, -0.5, 0.5, 0.5,
-3.647531, 2, -6.265135, 1, 1.5, 0.5, 0.5,
-3.647531, 2, -6.265135, 0, 1.5, 0.5, 0.5
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
-3.15811, -3.985995, -4,
-3.15811, -3.985995, 4,
-3.15811, -3.985995, -4,
-3.32125, -4.173951, -4,
-3.15811, -3.985995, -2,
-3.32125, -4.173951, -2,
-3.15811, -3.985995, 0,
-3.32125, -4.173951, 0,
-3.15811, -3.985995, 2,
-3.32125, -4.173951, 2,
-3.15811, -3.985995, 4,
-3.32125, -4.173951, 4
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
-3.647531, -4.549864, -4, 0, -0.5, 0.5, 0.5,
-3.647531, -4.549864, -4, 1, -0.5, 0.5, 0.5,
-3.647531, -4.549864, -4, 1, 1.5, 0.5, 0.5,
-3.647531, -4.549864, -4, 0, 1.5, 0.5, 0.5,
-3.647531, -4.549864, -2, 0, -0.5, 0.5, 0.5,
-3.647531, -4.549864, -2, 1, -0.5, 0.5, 0.5,
-3.647531, -4.549864, -2, 1, 1.5, 0.5, 0.5,
-3.647531, -4.549864, -2, 0, 1.5, 0.5, 0.5,
-3.647531, -4.549864, 0, 0, -0.5, 0.5, 0.5,
-3.647531, -4.549864, 0, 1, -0.5, 0.5, 0.5,
-3.647531, -4.549864, 0, 1, 1.5, 0.5, 0.5,
-3.647531, -4.549864, 0, 0, 1.5, 0.5, 0.5,
-3.647531, -4.549864, 2, 0, -0.5, 0.5, 0.5,
-3.647531, -4.549864, 2, 1, -0.5, 0.5, 0.5,
-3.647531, -4.549864, 2, 1, 1.5, 0.5, 0.5,
-3.647531, -4.549864, 2, 0, 1.5, 0.5, 0.5,
-3.647531, -4.549864, 4, 0, -0.5, 0.5, 0.5,
-3.647531, -4.549864, 4, 1, -0.5, 0.5, 0.5,
-3.647531, -4.549864, 4, 1, 1.5, 0.5, 0.5,
-3.647531, -4.549864, 4, 0, 1.5, 0.5, 0.5
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
-3.15811, -3.985995, -5.423546,
-3.15811, 3.532262, -5.423546,
-3.15811, -3.985995, 5.797628,
-3.15811, 3.532262, 5.797628,
-3.15811, -3.985995, -5.423546,
-3.15811, -3.985995, 5.797628,
-3.15811, 3.532262, -5.423546,
-3.15811, 3.532262, 5.797628,
-3.15811, -3.985995, -5.423546,
3.367508, -3.985995, -5.423546,
-3.15811, -3.985995, 5.797628,
3.367508, -3.985995, 5.797628,
-3.15811, 3.532262, -5.423546,
3.367508, 3.532262, -5.423546,
-3.15811, 3.532262, 5.797628,
3.367508, 3.532262, 5.797628,
3.367508, -3.985995, -5.423546,
3.367508, 3.532262, -5.423546,
3.367508, -3.985995, 5.797628,
3.367508, 3.532262, 5.797628,
3.367508, -3.985995, -5.423546,
3.367508, -3.985995, 5.797628,
3.367508, 3.532262, -5.423546,
3.367508, 3.532262, 5.797628
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
var radius = 8.010112;
var distance = 35.63789;
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
mvMatrix.translate( -0.1046991, 0.2268664, -0.1870408 );
mvMatrix.scale( 1.327183, 1.151955, 0.7718167 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.63789);
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


