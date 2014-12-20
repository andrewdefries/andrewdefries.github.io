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
-2.684601, -0.0064665, -0.271262, 1, 0, 0, 1,
-2.671518, -2.966693, -3.130933, 1, 0.007843138, 0, 1,
-2.624124, 1.290409, -2.836644, 1, 0.01176471, 0, 1,
-2.616839, -1.118259, -1.3004, 1, 0.01960784, 0, 1,
-2.515902, 0.1742629, -2.062727, 1, 0.02352941, 0, 1,
-2.490433, 1.58895, 0.1867369, 1, 0.03137255, 0, 1,
-2.448805, 0.3294431, 1.003787, 1, 0.03529412, 0, 1,
-2.342673, -0.1778699, -2.157259, 1, 0.04313726, 0, 1,
-2.341844, -0.7540016, -0.9287768, 1, 0.04705882, 0, 1,
-2.334198, -1.271577, -1.062804, 1, 0.05490196, 0, 1,
-2.264741, -1.760375, -2.73494, 1, 0.05882353, 0, 1,
-2.172738, -0.01094482, -2.239105, 1, 0.06666667, 0, 1,
-2.141086, -0.5668094, -1.952054, 1, 0.07058824, 0, 1,
-2.083831, -0.3002515, -0.3955796, 1, 0.07843138, 0, 1,
-2.067821, -0.8443457, -3.106406, 1, 0.08235294, 0, 1,
-1.993994, -0.1751011, -1.838184, 1, 0.09019608, 0, 1,
-1.990197, 1.122903, 1.341827, 1, 0.09411765, 0, 1,
-1.980909, 0.3024815, -2.711417, 1, 0.1019608, 0, 1,
-1.9692, 0.512821, -1.294987, 1, 0.1098039, 0, 1,
-1.965577, 0.8157646, -2.20555, 1, 0.1137255, 0, 1,
-1.964313, 0.7771987, -0.07959834, 1, 0.1215686, 0, 1,
-1.939697, 0.2533301, -1.171447, 1, 0.1254902, 0, 1,
-1.909087, -0.5220953, -0.2918487, 1, 0.1333333, 0, 1,
-1.874174, 0.2198627, 0.1282168, 1, 0.1372549, 0, 1,
-1.859802, -0.7466207, -1.09972, 1, 0.145098, 0, 1,
-1.850762, 0.5824037, -1.022106, 1, 0.1490196, 0, 1,
-1.840762, -1.219216, -1.772074, 1, 0.1568628, 0, 1,
-1.839029, -0.8877746, -2.965885, 1, 0.1607843, 0, 1,
-1.829126, 0.2952963, -1.353259, 1, 0.1686275, 0, 1,
-1.827347, -1.134843, -2.156266, 1, 0.172549, 0, 1,
-1.821068, 0.3316148, -1.208492, 1, 0.1803922, 0, 1,
-1.800667, 0.5721401, -1.338971, 1, 0.1843137, 0, 1,
-1.771951, 1.585453, -1.161118, 1, 0.1921569, 0, 1,
-1.749517, 1.179665, -1.647038, 1, 0.1960784, 0, 1,
-1.735222, -0.7574773, -0.8146626, 1, 0.2039216, 0, 1,
-1.72517, -0.7383918, -3.686308, 1, 0.2117647, 0, 1,
-1.694677, 0.4392072, -1.348855, 1, 0.2156863, 0, 1,
-1.673935, -2.084296, -2.1094, 1, 0.2235294, 0, 1,
-1.665664, -1.155381, -2.100946, 1, 0.227451, 0, 1,
-1.66453, -0.04878458, -2.077668, 1, 0.2352941, 0, 1,
-1.658229, 0.1335157, -2.825527, 1, 0.2392157, 0, 1,
-1.633611, 0.8780789, -1.040887, 1, 0.2470588, 0, 1,
-1.618833, -0.5945939, -1.567588, 1, 0.2509804, 0, 1,
-1.618626, 0.07191524, -1.930686, 1, 0.2588235, 0, 1,
-1.599348, 1.111146, -0.9905178, 1, 0.2627451, 0, 1,
-1.589921, 2.1601, -1.112072, 1, 0.2705882, 0, 1,
-1.589086, 0.3788029, -2.473086, 1, 0.2745098, 0, 1,
-1.585462, -0.344725, -1.511304, 1, 0.282353, 0, 1,
-1.569784, -0.5729447, -3.004202, 1, 0.2862745, 0, 1,
-1.555034, -0.6900141, -1.394787, 1, 0.2941177, 0, 1,
-1.55455, 0.2040619, -2.097142, 1, 0.3019608, 0, 1,
-1.545343, 0.6135051, -1.621064, 1, 0.3058824, 0, 1,
-1.543541, -1.044527, -1.808328, 1, 0.3137255, 0, 1,
-1.534233, -1.084103, -2.128182, 1, 0.3176471, 0, 1,
-1.523456, -0.9568122, -2.864707, 1, 0.3254902, 0, 1,
-1.503257, -2.416022, -2.007761, 1, 0.3294118, 0, 1,
-1.490292, 0.5520727, -0.9198543, 1, 0.3372549, 0, 1,
-1.483627, -0.09451469, -3.139787, 1, 0.3411765, 0, 1,
-1.479482, -0.6729437, -0.3987796, 1, 0.3490196, 0, 1,
-1.475795, -0.7185998, -2.782746, 1, 0.3529412, 0, 1,
-1.465778, -0.1303833, -1.718802, 1, 0.3607843, 0, 1,
-1.461002, 0.0162261, -0.967777, 1, 0.3647059, 0, 1,
-1.459603, -0.54063, -2.068692, 1, 0.372549, 0, 1,
-1.457166, 0.3138419, -0.7840064, 1, 0.3764706, 0, 1,
-1.44956, -0.1327379, -0.7671394, 1, 0.3843137, 0, 1,
-1.432823, -0.2469208, -3.525039, 1, 0.3882353, 0, 1,
-1.425094, 0.1148396, -3.74865, 1, 0.3960784, 0, 1,
-1.420358, -1.105718, -0.9371721, 1, 0.4039216, 0, 1,
-1.412032, 1.586465, 1.110786, 1, 0.4078431, 0, 1,
-1.410169, 0.5895484, 0.2408843, 1, 0.4156863, 0, 1,
-1.40904, 0.1827505, -2.279622, 1, 0.4196078, 0, 1,
-1.405123, 0.1347284, -2.32618, 1, 0.427451, 0, 1,
-1.39045, 0.2186291, -2.186444, 1, 0.4313726, 0, 1,
-1.389457, -1.78104, -3.079218, 1, 0.4392157, 0, 1,
-1.381267, -1.014277, -2.466211, 1, 0.4431373, 0, 1,
-1.379715, -0.06595386, -1.45584, 1, 0.4509804, 0, 1,
-1.375626, 2.181997, -1.51237, 1, 0.454902, 0, 1,
-1.368737, -0.3851936, -2.167737, 1, 0.4627451, 0, 1,
-1.364866, 0.8010782, -0.8576115, 1, 0.4666667, 0, 1,
-1.363812, -1.440024, -1.759417, 1, 0.4745098, 0, 1,
-1.361385, 0.74554, 0.09631375, 1, 0.4784314, 0, 1,
-1.338841, 0.7659006, -2.375516, 1, 0.4862745, 0, 1,
-1.32771, 0.08516137, -1.896142, 1, 0.4901961, 0, 1,
-1.317661, -0.9599237, 0.5926161, 1, 0.4980392, 0, 1,
-1.31306, 1.186023, -1.773623, 1, 0.5058824, 0, 1,
-1.29982, 0.9468229, -1.751341, 1, 0.509804, 0, 1,
-1.285795, 1.293266, -0.5851725, 1, 0.5176471, 0, 1,
-1.280297, 0.6254313, -2.324238, 1, 0.5215687, 0, 1,
-1.272211, -0.430557, -1.353696, 1, 0.5294118, 0, 1,
-1.264597, 0.7438264, -0.9682786, 1, 0.5333334, 0, 1,
-1.264201, 0.7081149, -2.043453, 1, 0.5411765, 0, 1,
-1.245391, 0.1960675, -2.87604, 1, 0.5450981, 0, 1,
-1.237634, -0.2724119, -0.662798, 1, 0.5529412, 0, 1,
-1.236597, 0.1149465, 0.4009765, 1, 0.5568628, 0, 1,
-1.221146, -0.2296832, -0.6292089, 1, 0.5647059, 0, 1,
-1.219964, -0.3398769, -2.204264, 1, 0.5686275, 0, 1,
-1.212967, -0.01098563, -1.721354, 1, 0.5764706, 0, 1,
-1.212708, 1.818694, -0.6582577, 1, 0.5803922, 0, 1,
-1.212428, -0.3094278, -2.267921, 1, 0.5882353, 0, 1,
-1.209086, -0.009793353, -0.5331424, 1, 0.5921569, 0, 1,
-1.207608, 1.79682, -1.887531, 1, 0.6, 0, 1,
-1.203717, -0.3009678, -1.221188, 1, 0.6078432, 0, 1,
-1.202198, 1.512528, -0.6273404, 1, 0.6117647, 0, 1,
-1.190171, -2.46938, -3.534454, 1, 0.6196079, 0, 1,
-1.188242, -3.161448, -2.827256, 1, 0.6235294, 0, 1,
-1.188065, 0.8016064, -2.090962, 1, 0.6313726, 0, 1,
-1.182773, -1.398835, -2.128356, 1, 0.6352941, 0, 1,
-1.180277, -0.1064312, -0.2221174, 1, 0.6431373, 0, 1,
-1.152841, 0.5748885, -1.649472, 1, 0.6470588, 0, 1,
-1.14977, -0.303715, -1.447363, 1, 0.654902, 0, 1,
-1.142368, -0.2313361, -3.751187, 1, 0.6588235, 0, 1,
-1.138471, -0.2412013, -3.180634, 1, 0.6666667, 0, 1,
-1.133521, 0.983374, -2.319032, 1, 0.6705883, 0, 1,
-1.127514, -1.063056, -3.664746, 1, 0.6784314, 0, 1,
-1.123957, 0.9080511, 0.03680445, 1, 0.682353, 0, 1,
-1.121637, -0.6339096, -1.492405, 1, 0.6901961, 0, 1,
-1.119896, -0.3825147, -1.5672, 1, 0.6941177, 0, 1,
-1.118995, -1.549825, -2.838914, 1, 0.7019608, 0, 1,
-1.103336, 0.1487057, 0.2137506, 1, 0.7098039, 0, 1,
-1.101611, 0.5478964, -0.9962358, 1, 0.7137255, 0, 1,
-1.089928, 1.034136, -1.478894, 1, 0.7215686, 0, 1,
-1.087138, 1.342521, -0.4718595, 1, 0.7254902, 0, 1,
-1.084948, 0.2241438, -1.524523, 1, 0.7333333, 0, 1,
-1.084085, -0.3000503, -3.550688, 1, 0.7372549, 0, 1,
-1.081301, 0.2509932, -2.217815, 1, 0.7450981, 0, 1,
-1.081121, -0.2396984, -0.02706484, 1, 0.7490196, 0, 1,
-1.079401, 0.7749451, 0.0711605, 1, 0.7568628, 0, 1,
-1.079136, 2.701468, 0.7059739, 1, 0.7607843, 0, 1,
-1.078486, 0.7367055, -1.271016, 1, 0.7686275, 0, 1,
-1.078418, 1.102352, -1.589019, 1, 0.772549, 0, 1,
-1.072646, 1.465764, -1.162776, 1, 0.7803922, 0, 1,
-1.071017, -1.995065, -2.873218, 1, 0.7843137, 0, 1,
-1.069582, -1.493113, -1.299706, 1, 0.7921569, 0, 1,
-1.067255, -0.2677769, -1.898242, 1, 0.7960784, 0, 1,
-1.065695, -1.030613, -1.295513, 1, 0.8039216, 0, 1,
-1.041122, 0.524528, 0.5603918, 1, 0.8117647, 0, 1,
-1.040546, 1.224619, -0.9618216, 1, 0.8156863, 0, 1,
-1.037496, 0.364837, -0.2690079, 1, 0.8235294, 0, 1,
-1.037455, 0.5292869, -2.300279, 1, 0.827451, 0, 1,
-1.035947, -0.4564576, -3.799166, 1, 0.8352941, 0, 1,
-1.032422, -0.8658293, -1.553926, 1, 0.8392157, 0, 1,
-1.006216, 1.205348, -0.3574072, 1, 0.8470588, 0, 1,
-1.001117, 1.326439, 0.4917932, 1, 0.8509804, 0, 1,
-0.9936715, 0.7129685, -0.937064, 1, 0.8588235, 0, 1,
-0.993273, 0.7587187, -0.4408725, 1, 0.8627451, 0, 1,
-0.9925969, -0.9174536, -2.40453, 1, 0.8705882, 0, 1,
-0.9851071, 1.723285, -1.350169, 1, 0.8745098, 0, 1,
-0.9771883, 0.8785067, 0.5656842, 1, 0.8823529, 0, 1,
-0.9771288, -0.1107525, -1.127694, 1, 0.8862745, 0, 1,
-0.9637257, -1.17866, -3.028584, 1, 0.8941177, 0, 1,
-0.9575615, -0.3018823, -3.340156, 1, 0.8980392, 0, 1,
-0.9508881, -0.2892852, -0.5300147, 1, 0.9058824, 0, 1,
-0.9397053, 1.567956, 0.05851636, 1, 0.9137255, 0, 1,
-0.9396099, 0.3033794, -0.7896007, 1, 0.9176471, 0, 1,
-0.9374322, 0.4311922, -0.8267363, 1, 0.9254902, 0, 1,
-0.93111, -0.5781378, -4.292309, 1, 0.9294118, 0, 1,
-0.91658, -1.322192, -2.937335, 1, 0.9372549, 0, 1,
-0.9146582, -0.7782859, -1.684246, 1, 0.9411765, 0, 1,
-0.9145163, 1.119562, -0.3490522, 1, 0.9490196, 0, 1,
-0.9099173, 0.1406231, -1.581563, 1, 0.9529412, 0, 1,
-0.9085274, 1.499102, -0.5685946, 1, 0.9607843, 0, 1,
-0.903689, 1.070871, 0.06138147, 1, 0.9647059, 0, 1,
-0.9029368, -1.005256, -1.974664, 1, 0.972549, 0, 1,
-0.9026949, -0.368179, -0.8691097, 1, 0.9764706, 0, 1,
-0.9014526, 0.817039, -0.4535982, 1, 0.9843137, 0, 1,
-0.9009641, 1.223593, -2.011966, 1, 0.9882353, 0, 1,
-0.8989753, -1.92859, -0.9418716, 1, 0.9960784, 0, 1,
-0.8930986, -1.023013, -0.5182707, 0.9960784, 1, 0, 1,
-0.890592, -0.3437521, -2.219221, 0.9921569, 1, 0, 1,
-0.8867829, -0.03113574, -2.515674, 0.9843137, 1, 0, 1,
-0.8862309, -0.5973651, -1.125708, 0.9803922, 1, 0, 1,
-0.8853191, -0.573816, -1.306055, 0.972549, 1, 0, 1,
-0.8816426, 1.009927, -0.2246168, 0.9686275, 1, 0, 1,
-0.8752776, -0.6731229, -3.281664, 0.9607843, 1, 0, 1,
-0.8750025, 0.927506, -0.0002384535, 0.9568627, 1, 0, 1,
-0.8740715, -1.282724, -2.667355, 0.9490196, 1, 0, 1,
-0.8656058, 1.287542, 0.960422, 0.945098, 1, 0, 1,
-0.8612085, 0.6874572, -1.076643, 0.9372549, 1, 0, 1,
-0.8595948, -0.4716539, -2.560475, 0.9333333, 1, 0, 1,
-0.8576406, 2.019079, 0.2673447, 0.9254902, 1, 0, 1,
-0.8547611, -1.682056, -2.032103, 0.9215686, 1, 0, 1,
-0.850701, 0.1588245, -0.5159397, 0.9137255, 1, 0, 1,
-0.8473798, 0.1557227, -1.255204, 0.9098039, 1, 0, 1,
-0.8467432, -0.08661208, -1.004523, 0.9019608, 1, 0, 1,
-0.8450816, 1.048248, -0.7509939, 0.8941177, 1, 0, 1,
-0.8404926, 0.2628351, -0.6796605, 0.8901961, 1, 0, 1,
-0.8221674, -0.531517, -4.059091, 0.8823529, 1, 0, 1,
-0.8196688, 0.9020812, 0.2044103, 0.8784314, 1, 0, 1,
-0.8139341, -1.671402, -1.375533, 0.8705882, 1, 0, 1,
-0.8138724, 1.933607, -1.166112, 0.8666667, 1, 0, 1,
-0.8122568, -0.470412, -3.628584, 0.8588235, 1, 0, 1,
-0.8113203, 0.5630553, -1.69857, 0.854902, 1, 0, 1,
-0.8090354, 0.06646984, -1.679906, 0.8470588, 1, 0, 1,
-0.804337, 0.04845069, -2.430614, 0.8431373, 1, 0, 1,
-0.7972016, 0.6054399, -1.200361, 0.8352941, 1, 0, 1,
-0.7953469, -0.5120943, -2.363816, 0.8313726, 1, 0, 1,
-0.7933642, 0.4358504, 0.2457644, 0.8235294, 1, 0, 1,
-0.7875065, -2.346922, -2.866299, 0.8196079, 1, 0, 1,
-0.7826762, -0.6008151, -2.256044, 0.8117647, 1, 0, 1,
-0.779218, 0.3555542, -0.307628, 0.8078431, 1, 0, 1,
-0.7740017, 0.09060603, 0.6707478, 0.8, 1, 0, 1,
-0.7720916, -0.1464228, -3.363283, 0.7921569, 1, 0, 1,
-0.7593179, 0.8678753, -1.224477, 0.7882353, 1, 0, 1,
-0.7552221, 1.388987, -0.6982759, 0.7803922, 1, 0, 1,
-0.7529761, 0.3375619, -1.207603, 0.7764706, 1, 0, 1,
-0.7520798, 2.222509, -0.2365491, 0.7686275, 1, 0, 1,
-0.7484837, -0.5233446, -1.09567, 0.7647059, 1, 0, 1,
-0.7306902, -1.648099, -2.938413, 0.7568628, 1, 0, 1,
-0.726023, -0.3911771, -1.601517, 0.7529412, 1, 0, 1,
-0.7253208, 1.18206, 0.3202512, 0.7450981, 1, 0, 1,
-0.7235982, 0.4382031, -1.841283, 0.7411765, 1, 0, 1,
-0.7221754, -0.8967022, -2.058207, 0.7333333, 1, 0, 1,
-0.7205043, -1.595074, -3.254015, 0.7294118, 1, 0, 1,
-0.7186981, 0.1287278, -1.247242, 0.7215686, 1, 0, 1,
-0.7182154, 1.198481, -0.8831217, 0.7176471, 1, 0, 1,
-0.7071294, -1.461042, -2.83651, 0.7098039, 1, 0, 1,
-0.7062804, 1.53334, -1.144844, 0.7058824, 1, 0, 1,
-0.703443, -0.5035104, -2.544424, 0.6980392, 1, 0, 1,
-0.7026075, -0.7273211, -2.299223, 0.6901961, 1, 0, 1,
-0.7015771, 0.4070037, -1.808221, 0.6862745, 1, 0, 1,
-0.6960263, -0.1262545, -0.7523028, 0.6784314, 1, 0, 1,
-0.6945686, -0.8060092, -1.632154, 0.6745098, 1, 0, 1,
-0.6942654, 1.069418, -1.233967, 0.6666667, 1, 0, 1,
-0.6933209, -0.4132459, -0.7792923, 0.6627451, 1, 0, 1,
-0.6905758, 0.1342916, -1.180796, 0.654902, 1, 0, 1,
-0.6846803, 2.59963, -0.2309512, 0.6509804, 1, 0, 1,
-0.6837586, -0.9386643, -2.471811, 0.6431373, 1, 0, 1,
-0.6815362, -0.9715781, -3.361389, 0.6392157, 1, 0, 1,
-0.6757455, -1.624767, -2.263693, 0.6313726, 1, 0, 1,
-0.6732483, 0.03048422, -0.1544304, 0.627451, 1, 0, 1,
-0.6701065, 0.0938913, -1.079963, 0.6196079, 1, 0, 1,
-0.6671612, 1.195155, -0.7208185, 0.6156863, 1, 0, 1,
-0.6624686, -0.9289749, -3.314639, 0.6078432, 1, 0, 1,
-0.6611369, 0.285749, -2.086159, 0.6039216, 1, 0, 1,
-0.6548781, 0.1167784, -2.0573, 0.5960785, 1, 0, 1,
-0.6486626, -0.4994642, -2.519345, 0.5882353, 1, 0, 1,
-0.6476915, 0.5176834, -1.388695, 0.5843138, 1, 0, 1,
-0.6467508, -0.9387049, -3.613889, 0.5764706, 1, 0, 1,
-0.6467196, -1.175804, -4.560365, 0.572549, 1, 0, 1,
-0.645942, 0.267949, 0.03812955, 0.5647059, 1, 0, 1,
-0.6451882, 2.1541, 0.8574582, 0.5607843, 1, 0, 1,
-0.6448151, 0.3305889, -1.371935, 0.5529412, 1, 0, 1,
-0.640802, 0.6556603, -0.4173225, 0.5490196, 1, 0, 1,
-0.6398264, 0.9774024, -2.005119, 0.5411765, 1, 0, 1,
-0.6353916, 0.2537749, -0.1335969, 0.5372549, 1, 0, 1,
-0.6343708, 0.4175939, -0.4372692, 0.5294118, 1, 0, 1,
-0.6315353, 1.708402, -0.9027401, 0.5254902, 1, 0, 1,
-0.6269041, 1.171968, -1.611651, 0.5176471, 1, 0, 1,
-0.6255797, 0.7868921, -2.536119, 0.5137255, 1, 0, 1,
-0.6212161, 2.829062, -1.489772, 0.5058824, 1, 0, 1,
-0.6134662, 0.2821414, -1.706688, 0.5019608, 1, 0, 1,
-0.610984, 1.157174, -0.9465708, 0.4941176, 1, 0, 1,
-0.6064739, 1.506242, -0.7351184, 0.4862745, 1, 0, 1,
-0.6039085, 0.0656548, 0.2563775, 0.4823529, 1, 0, 1,
-0.6035038, -1.239312, -3.627759, 0.4745098, 1, 0, 1,
-0.5885215, 0.2334957, -2.139911, 0.4705882, 1, 0, 1,
-0.5826473, -1.481347, -2.693032, 0.4627451, 1, 0, 1,
-0.5793415, 0.4089102, -0.5936964, 0.4588235, 1, 0, 1,
-0.5765308, -0.7938238, -2.082882, 0.4509804, 1, 0, 1,
-0.5731193, 0.4958369, -0.6848203, 0.4470588, 1, 0, 1,
-0.5700633, 0.1674597, -1.324528, 0.4392157, 1, 0, 1,
-0.5680841, -1.601467, -4.121046, 0.4352941, 1, 0, 1,
-0.5629113, -1.151724, -2.647925, 0.427451, 1, 0, 1,
-0.5493278, -0.9781853, -2.546635, 0.4235294, 1, 0, 1,
-0.5483427, -0.2521029, -2.856905, 0.4156863, 1, 0, 1,
-0.5463156, 1.346555, -0.06170961, 0.4117647, 1, 0, 1,
-0.5450848, 1.062096, 0.9677062, 0.4039216, 1, 0, 1,
-0.5438562, 0.9778807, 1.164875, 0.3960784, 1, 0, 1,
-0.5419844, -0.007805702, -3.274268, 0.3921569, 1, 0, 1,
-0.5380072, -0.2635049, -0.3353656, 0.3843137, 1, 0, 1,
-0.5345092, -1.388523, -2.394727, 0.3803922, 1, 0, 1,
-0.5266685, -0.6977894, -2.614852, 0.372549, 1, 0, 1,
-0.5258862, -1.823218, -2.844929, 0.3686275, 1, 0, 1,
-0.5244147, 0.191175, -0.7875245, 0.3607843, 1, 0, 1,
-0.5236194, -0.5007494, -1.353115, 0.3568628, 1, 0, 1,
-0.519904, -0.3846819, -4.933708, 0.3490196, 1, 0, 1,
-0.5181383, -1.765258, -3.095658, 0.345098, 1, 0, 1,
-0.5085238, 0.4042573, -0.8566478, 0.3372549, 1, 0, 1,
-0.5044324, 1.111253, 0.530579, 0.3333333, 1, 0, 1,
-0.5038803, -0.9757961, -1.590873, 0.3254902, 1, 0, 1,
-0.5036324, -0.5041609, -2.202692, 0.3215686, 1, 0, 1,
-0.5027754, -1.334297, -3.458375, 0.3137255, 1, 0, 1,
-0.4998133, -0.8841897, -3.572071, 0.3098039, 1, 0, 1,
-0.4992634, -0.9766201, -1.378732, 0.3019608, 1, 0, 1,
-0.4946717, -1.196037, -3.029321, 0.2941177, 1, 0, 1,
-0.4942269, 1.725418, -1.21502, 0.2901961, 1, 0, 1,
-0.4908836, -0.4115894, -2.822411, 0.282353, 1, 0, 1,
-0.4806825, -0.8424327, -2.894398, 0.2784314, 1, 0, 1,
-0.4781266, -1.69088, -2.424589, 0.2705882, 1, 0, 1,
-0.4766612, 0.7086983, -0.9825622, 0.2666667, 1, 0, 1,
-0.4750537, 0.2304518, -0.4505418, 0.2588235, 1, 0, 1,
-0.4735917, -0.2982625, -1.918032, 0.254902, 1, 0, 1,
-0.4716788, 0.06721672, -3.139749, 0.2470588, 1, 0, 1,
-0.4706123, -1.140577, -4.316809, 0.2431373, 1, 0, 1,
-0.4705595, 0.9614694, -0.5004863, 0.2352941, 1, 0, 1,
-0.4679562, -0.356418, -1.550108, 0.2313726, 1, 0, 1,
-0.4668344, 1.559395, -0.3981292, 0.2235294, 1, 0, 1,
-0.4661185, 0.4002769, -1.141638, 0.2196078, 1, 0, 1,
-0.4578288, 1.587474, 1.074235, 0.2117647, 1, 0, 1,
-0.4527415, -1.264187, -2.898398, 0.2078431, 1, 0, 1,
-0.4489726, 0.7784475, 0.7055638, 0.2, 1, 0, 1,
-0.4478051, -0.1191972, -0.1301041, 0.1921569, 1, 0, 1,
-0.4422278, 0.2946681, -2.990789, 0.1882353, 1, 0, 1,
-0.4356274, 0.4165569, 0.04211496, 0.1803922, 1, 0, 1,
-0.4352536, -0.5127613, -2.559898, 0.1764706, 1, 0, 1,
-0.4330761, -0.06681948, -1.391428, 0.1686275, 1, 0, 1,
-0.427851, -0.3570476, -0.9798357, 0.1647059, 1, 0, 1,
-0.4254231, 0.3618838, -0.4680122, 0.1568628, 1, 0, 1,
-0.4243311, -0.6690592, -3.180812, 0.1529412, 1, 0, 1,
-0.4203924, -0.7406557, -1.928053, 0.145098, 1, 0, 1,
-0.4199491, 0.3019115, -0.3748485, 0.1411765, 1, 0, 1,
-0.4173713, -0.9678721, -2.293946, 0.1333333, 1, 0, 1,
-0.4172912, -1.219852, -2.772861, 0.1294118, 1, 0, 1,
-0.4124298, 0.9209699, -1.783973, 0.1215686, 1, 0, 1,
-0.4107455, -1.88848, -3.719297, 0.1176471, 1, 0, 1,
-0.4085774, 0.07755926, -1.498398, 0.1098039, 1, 0, 1,
-0.4045686, -0.1313307, -1.229175, 0.1058824, 1, 0, 1,
-0.3945308, -0.6766396, 0.0423099, 0.09803922, 1, 0, 1,
-0.3899063, 0.08753222, -1.276506, 0.09019608, 1, 0, 1,
-0.389258, -1.126656, -2.345311, 0.08627451, 1, 0, 1,
-0.3873536, -1.282908, -3.422478, 0.07843138, 1, 0, 1,
-0.3864205, -1.084539, -3.289319, 0.07450981, 1, 0, 1,
-0.3859051, -0.4885376, -0.02779718, 0.06666667, 1, 0, 1,
-0.385098, -0.9964828, -2.238948, 0.0627451, 1, 0, 1,
-0.3812578, 1.641186, 0.005570721, 0.05490196, 1, 0, 1,
-0.379945, -0.7997342, -2.400244, 0.05098039, 1, 0, 1,
-0.3768694, -0.02703553, -1.597868, 0.04313726, 1, 0, 1,
-0.3760295, -1.354668, -3.953617, 0.03921569, 1, 0, 1,
-0.3712676, 0.8796911, -0.5566558, 0.03137255, 1, 0, 1,
-0.3682551, 2.283703, -1.106791, 0.02745098, 1, 0, 1,
-0.3641852, 1.600249, -0.3673117, 0.01960784, 1, 0, 1,
-0.3640676, 1.68574, 0.7553905, 0.01568628, 1, 0, 1,
-0.3526669, 0.1827961, -1.334055, 0.007843138, 1, 0, 1,
-0.3482, 0.5674649, -1.018764, 0.003921569, 1, 0, 1,
-0.346648, -0.3440968, -2.578994, 0, 1, 0.003921569, 1,
-0.3464185, 1.039142, -0.2463638, 0, 1, 0.01176471, 1,
-0.3429337, 2.000257, -0.02437531, 0, 1, 0.01568628, 1,
-0.3421113, -0.6490539, -4.248148, 0, 1, 0.02352941, 1,
-0.3399377, -1.456094, -2.171883, 0, 1, 0.02745098, 1,
-0.3353288, 0.9266934, -1.037345, 0, 1, 0.03529412, 1,
-0.3326437, 0.2708639, -0.7269408, 0, 1, 0.03921569, 1,
-0.3314807, 0.02249173, -0.5755422, 0, 1, 0.04705882, 1,
-0.3304717, 0.3855027, -0.5962024, 0, 1, 0.05098039, 1,
-0.3298313, 1.237682, 0.8697304, 0, 1, 0.05882353, 1,
-0.3272527, 0.2394282, -1.403352, 0, 1, 0.0627451, 1,
-0.3237218, 2.285462, -0.2938241, 0, 1, 0.07058824, 1,
-0.3223098, -0.05763006, -1.615709, 0, 1, 0.07450981, 1,
-0.3209835, -0.01651125, -2.504733, 0, 1, 0.08235294, 1,
-0.3202983, 0.8500579, -1.940697, 0, 1, 0.08627451, 1,
-0.3199786, 1.01517, -0.8060793, 0, 1, 0.09411765, 1,
-0.3066446, 1.100129, -0.4697577, 0, 1, 0.1019608, 1,
-0.3062641, 0.6110578, -1.495496, 0, 1, 0.1058824, 1,
-0.3048063, 0.2324253, -1.694772, 0, 1, 0.1137255, 1,
-0.3031691, 0.1479464, -2.676583, 0, 1, 0.1176471, 1,
-0.2948641, -1.86756, -3.857358, 0, 1, 0.1254902, 1,
-0.2944771, -0.4991717, -1.585501, 0, 1, 0.1294118, 1,
-0.2912114, 0.3613228, -0.9937177, 0, 1, 0.1372549, 1,
-0.2852635, 1.248206, -1.694977, 0, 1, 0.1411765, 1,
-0.2833643, 0.8379728, -0.2142409, 0, 1, 0.1490196, 1,
-0.2825825, 0.4004217, -1.20964, 0, 1, 0.1529412, 1,
-0.2815033, -0.2104011, -2.320392, 0, 1, 0.1607843, 1,
-0.278675, -0.1459701, -3.437037, 0, 1, 0.1647059, 1,
-0.2780096, 1.07793, -0.05668713, 0, 1, 0.172549, 1,
-0.2734704, 0.2197128, -1.098516, 0, 1, 0.1764706, 1,
-0.2727, 0.7817822, -0.9540695, 0, 1, 0.1843137, 1,
-0.2712501, -0.7441661, -3.224342, 0, 1, 0.1882353, 1,
-0.2684844, 0.06001266, -2.398437, 0, 1, 0.1960784, 1,
-0.2632698, 0.1778087, 0.01572987, 0, 1, 0.2039216, 1,
-0.262419, -0.6019049, -1.813308, 0, 1, 0.2078431, 1,
-0.2618012, 1.327023, -0.4500206, 0, 1, 0.2156863, 1,
-0.2608132, -0.1103698, -0.7564831, 0, 1, 0.2196078, 1,
-0.2601435, -0.1729799, -2.574314, 0, 1, 0.227451, 1,
-0.2595028, 0.9481891, -2.597017, 0, 1, 0.2313726, 1,
-0.2556687, -1.385489, -1.779618, 0, 1, 0.2392157, 1,
-0.2531926, -0.7110527, -2.447751, 0, 1, 0.2431373, 1,
-0.2526185, 2.410009, 1.099937, 0, 1, 0.2509804, 1,
-0.2470447, -0.7440429, -2.664691, 0, 1, 0.254902, 1,
-0.24598, 0.1941943, 1.839247, 0, 1, 0.2627451, 1,
-0.2437813, 2.277748, -0.5490382, 0, 1, 0.2666667, 1,
-0.2431587, -0.9139786, -4.121678, 0, 1, 0.2745098, 1,
-0.2354177, 2.174678, 0.1050834, 0, 1, 0.2784314, 1,
-0.2304998, -0.3941317, -2.475017, 0, 1, 0.2862745, 1,
-0.2285829, 0.7504368, 0.064647, 0, 1, 0.2901961, 1,
-0.2274961, -0.1350086, -3.491785, 0, 1, 0.2980392, 1,
-0.2221993, 0.7316906, -0.4057038, 0, 1, 0.3058824, 1,
-0.2161355, -0.5630695, -1.189113, 0, 1, 0.3098039, 1,
-0.2160145, -0.7552549, -3.617477, 0, 1, 0.3176471, 1,
-0.2103711, 0.6053841, -0.5770849, 0, 1, 0.3215686, 1,
-0.2097306, -0.7178991, -1.796346, 0, 1, 0.3294118, 1,
-0.2064439, -0.5879505, -2.36446, 0, 1, 0.3333333, 1,
-0.2040154, 0.1319038, -0.9067007, 0, 1, 0.3411765, 1,
-0.20361, -0.9418036, -2.918433, 0, 1, 0.345098, 1,
-0.2009107, 0.2360996, -0.1092493, 0, 1, 0.3529412, 1,
-0.1958274, -1.322577, -2.340496, 0, 1, 0.3568628, 1,
-0.195547, 0.5128084, 0.7556523, 0, 1, 0.3647059, 1,
-0.1936135, 0.3440766, 0.3078104, 0, 1, 0.3686275, 1,
-0.1934957, -1.039853, -3.524146, 0, 1, 0.3764706, 1,
-0.1922667, 0.4252594, -0.7900841, 0, 1, 0.3803922, 1,
-0.190652, 2.328214, 0.8945358, 0, 1, 0.3882353, 1,
-0.1884964, 0.3965646, -0.6187708, 0, 1, 0.3921569, 1,
-0.1869907, -0.3424715, -0.6078569, 0, 1, 0.4, 1,
-0.1772402, -1.244576, -4.568466, 0, 1, 0.4078431, 1,
-0.1755795, -1.009045, -4.144324, 0, 1, 0.4117647, 1,
-0.174365, -0.3878787, -3.026428, 0, 1, 0.4196078, 1,
-0.1723818, -0.7132416, -2.460806, 0, 1, 0.4235294, 1,
-0.1708002, 1.055287, -1.86547, 0, 1, 0.4313726, 1,
-0.1677101, 0.4407997, -0.7268571, 0, 1, 0.4352941, 1,
-0.1622658, 0.3181576, -1.234658, 0, 1, 0.4431373, 1,
-0.1584875, 0.1591278, -1.976286, 0, 1, 0.4470588, 1,
-0.1500845, -1.050275, -1.909738, 0, 1, 0.454902, 1,
-0.1454567, 0.0126726, -1.755675, 0, 1, 0.4588235, 1,
-0.1448218, 0.6308411, 0.1121022, 0, 1, 0.4666667, 1,
-0.1444007, 2.002138, -0.8687857, 0, 1, 0.4705882, 1,
-0.1393882, -1.612248, -3.243657, 0, 1, 0.4784314, 1,
-0.1392345, 0.8158874, 1.407004, 0, 1, 0.4823529, 1,
-0.137028, 0.6595992, -0.6106386, 0, 1, 0.4901961, 1,
-0.1351528, -0.1031919, -2.456485, 0, 1, 0.4941176, 1,
-0.1350217, -0.05502817, -1.759259, 0, 1, 0.5019608, 1,
-0.1349143, 0.919067, 1.374905, 0, 1, 0.509804, 1,
-0.1343141, 0.4815299, -0.4235464, 0, 1, 0.5137255, 1,
-0.1299091, 1.689998, 0.2114076, 0, 1, 0.5215687, 1,
-0.1291537, 0.04178656, -1.416478, 0, 1, 0.5254902, 1,
-0.128672, 1.406962, -0.3914623, 0, 1, 0.5333334, 1,
-0.1260775, -1.212519, -2.807153, 0, 1, 0.5372549, 1,
-0.1253966, 0.1467195, 0.1516369, 0, 1, 0.5450981, 1,
-0.1246352, 0.2737772, -1.310372, 0, 1, 0.5490196, 1,
-0.1230291, 0.3334179, 0.9693318, 0, 1, 0.5568628, 1,
-0.1228348, -1.235709, -2.900874, 0, 1, 0.5607843, 1,
-0.1212694, 0.2186906, -1.105958, 0, 1, 0.5686275, 1,
-0.120351, 0.8542477, 0.6528996, 0, 1, 0.572549, 1,
-0.1126418, -0.08000849, -0.1824547, 0, 1, 0.5803922, 1,
-0.1119467, 0.8948329, -0.436166, 0, 1, 0.5843138, 1,
-0.1105096, -0.2293063, -4.269755, 0, 1, 0.5921569, 1,
-0.1091205, 0.2391552, 0.1148417, 0, 1, 0.5960785, 1,
-0.108039, 0.2021485, -0.4008822, 0, 1, 0.6039216, 1,
-0.1070565, -1.272511, -1.930479, 0, 1, 0.6117647, 1,
-0.1066072, 0.6013888, -0.4574863, 0, 1, 0.6156863, 1,
-0.1056257, -0.04875256, -1.676658, 0, 1, 0.6235294, 1,
-0.1039251, -0.1873616, -1.687424, 0, 1, 0.627451, 1,
-0.1013176, -0.3113365, -2.83581, 0, 1, 0.6352941, 1,
-0.1009269, -0.2544565, -0.9163035, 0, 1, 0.6392157, 1,
-0.09623358, 0.2676907, -0.05324765, 0, 1, 0.6470588, 1,
-0.0930085, -1.54253, -2.647144, 0, 1, 0.6509804, 1,
-0.09030338, -0.134622, -2.161548, 0, 1, 0.6588235, 1,
-0.08460953, 1.251642, -0.759744, 0, 1, 0.6627451, 1,
-0.08306759, 0.652945, -1.323093, 0, 1, 0.6705883, 1,
-0.07955962, 0.9501629, -1.031624, 0, 1, 0.6745098, 1,
-0.07765918, 0.5375178, 0.6836782, 0, 1, 0.682353, 1,
-0.07746478, 0.6693512, -0.4449826, 0, 1, 0.6862745, 1,
-0.0762466, -1.571567, -3.157837, 0, 1, 0.6941177, 1,
-0.07574058, 0.8648359, -0.9006484, 0, 1, 0.7019608, 1,
-0.06626314, 0.06875363, -0.8091936, 0, 1, 0.7058824, 1,
-0.06041298, -0.4176672, -4.217472, 0, 1, 0.7137255, 1,
-0.05948214, 0.1386772, 0.7399157, 0, 1, 0.7176471, 1,
-0.05543828, 0.5901103, -1.827839, 0, 1, 0.7254902, 1,
-0.05384116, 0.4291973, -1.094, 0, 1, 0.7294118, 1,
-0.04804234, -0.7775742, -4.477063, 0, 1, 0.7372549, 1,
-0.04695974, -0.1823086, -3.525925, 0, 1, 0.7411765, 1,
-0.04610568, 0.240969, 1.842779, 0, 1, 0.7490196, 1,
-0.04311384, -0.1357385, -4.22723, 0, 1, 0.7529412, 1,
-0.04087188, -0.5096133, -3.216451, 0, 1, 0.7607843, 1,
-0.03863159, -0.870342, -2.363973, 0, 1, 0.7647059, 1,
-0.03661733, 1.523404, -0.4767629, 0, 1, 0.772549, 1,
-0.03624292, -0.05467371, -3.284776, 0, 1, 0.7764706, 1,
-0.03554167, -0.2771976, -3.007231, 0, 1, 0.7843137, 1,
-0.03142122, -0.02062354, -3.875338, 0, 1, 0.7882353, 1,
-0.02665096, -0.866819, -2.504582, 0, 1, 0.7960784, 1,
-0.02649046, -2.727125, -3.933837, 0, 1, 0.8039216, 1,
-0.02626315, -0.5135605, -3.159794, 0, 1, 0.8078431, 1,
-0.02525739, -1.249247, -2.896782, 0, 1, 0.8156863, 1,
-0.02440785, -0.7353286, -0.6461312, 0, 1, 0.8196079, 1,
-0.02204528, -0.4980373, -2.675777, 0, 1, 0.827451, 1,
-0.02054363, -0.7469817, -3.587214, 0, 1, 0.8313726, 1,
-0.01778091, -0.1873005, -3.551231, 0, 1, 0.8392157, 1,
-0.00357097, 0.9686382, -0.3868124, 0, 1, 0.8431373, 1,
0.001515929, 0.6591212, 0.4668541, 0, 1, 0.8509804, 1,
0.002242677, 0.9441191, 0.8976319, 0, 1, 0.854902, 1,
0.002425981, -0.4929863, 2.480124, 0, 1, 0.8627451, 1,
0.002828333, 2.018744, 0.1272962, 0, 1, 0.8666667, 1,
0.003881631, -0.3406363, 2.219096, 0, 1, 0.8745098, 1,
0.006190547, -0.3194499, 3.425628, 0, 1, 0.8784314, 1,
0.006951462, -1.596828, 4.63948, 0, 1, 0.8862745, 1,
0.007428975, 0.2485838, 0.8754418, 0, 1, 0.8901961, 1,
0.01028726, -1.292586, 3.54431, 0, 1, 0.8980392, 1,
0.01844091, 2.404432, -0.7446627, 0, 1, 0.9058824, 1,
0.02266435, 0.3913794, 0.09778872, 0, 1, 0.9098039, 1,
0.02463829, 0.2019505, 2.308236, 0, 1, 0.9176471, 1,
0.02503085, 0.2165939, 0.2951923, 0, 1, 0.9215686, 1,
0.03530607, -1.481554, 3.145581, 0, 1, 0.9294118, 1,
0.03634419, 0.8021745, 2.110791, 0, 1, 0.9333333, 1,
0.03724696, -0.09937748, 2.74068, 0, 1, 0.9411765, 1,
0.03805501, -0.2760753, 2.283902, 0, 1, 0.945098, 1,
0.03818161, 0.9604557, 1.215685, 0, 1, 0.9529412, 1,
0.04354093, 0.5041955, -1.551868, 0, 1, 0.9568627, 1,
0.04469523, 1.700689, 0.2221909, 0, 1, 0.9647059, 1,
0.04564618, 0.6113645, -0.553215, 0, 1, 0.9686275, 1,
0.04659833, -0.5927479, 4.044203, 0, 1, 0.9764706, 1,
0.0471182, 0.2773048, -0.497355, 0, 1, 0.9803922, 1,
0.04822622, 0.5318366, -0.3862919, 0, 1, 0.9882353, 1,
0.05559891, 0.8753746, 0.1691623, 0, 1, 0.9921569, 1,
0.05758149, -1.479102, 3.029461, 0, 1, 1, 1,
0.06014242, 0.4977694, 0.2711033, 0, 0.9921569, 1, 1,
0.06410362, 0.2372549, 1.671057, 0, 0.9882353, 1, 1,
0.06448334, 1.544884, 0.9116989, 0, 0.9803922, 1, 1,
0.06562337, 0.2924587, -0.1696631, 0, 0.9764706, 1, 1,
0.06957756, -0.08285125, 2.415919, 0, 0.9686275, 1, 1,
0.07101186, -0.4730554, 2.836169, 0, 0.9647059, 1, 1,
0.07114659, 0.5296922, 1.826565, 0, 0.9568627, 1, 1,
0.07698965, -2.102047, 2.979596, 0, 0.9529412, 1, 1,
0.07781446, 0.5913019, 0.3899882, 0, 0.945098, 1, 1,
0.07819753, -2.013548, 1.750429, 0, 0.9411765, 1, 1,
0.07970925, 1.026378, 1.416436, 0, 0.9333333, 1, 1,
0.0818186, -2.00703, 4.625525, 0, 0.9294118, 1, 1,
0.08256381, 1.260755, -2.181045, 0, 0.9215686, 1, 1,
0.08339839, -0.02501787, 1.674617, 0, 0.9176471, 1, 1,
0.08839986, -1.010637, 1.421684, 0, 0.9098039, 1, 1,
0.08876561, 1.379336, 0.3373964, 0, 0.9058824, 1, 1,
0.09336629, -0.7721611, 2.274928, 0, 0.8980392, 1, 1,
0.09690423, -1.487699, 2.393166, 0, 0.8901961, 1, 1,
0.1072933, -0.7671241, 3.460023, 0, 0.8862745, 1, 1,
0.1096277, -0.5360748, 2.620434, 0, 0.8784314, 1, 1,
0.1118418, 0.151811, 0.7670414, 0, 0.8745098, 1, 1,
0.1123278, -1.04639, 2.335817, 0, 0.8666667, 1, 1,
0.1130705, -2.531492, 4.304348, 0, 0.8627451, 1, 1,
0.1152502, 1.41091, -0.1145463, 0, 0.854902, 1, 1,
0.1169986, 0.6563595, 0.02952347, 0, 0.8509804, 1, 1,
0.121768, -0.8386552, 3.329457, 0, 0.8431373, 1, 1,
0.1227715, -0.848727, 3.502811, 0, 0.8392157, 1, 1,
0.1257049, 0.1975192, 1.764639, 0, 0.8313726, 1, 1,
0.1258073, 0.5048904, 0.6276507, 0, 0.827451, 1, 1,
0.1265679, -1.276151, 3.641552, 0, 0.8196079, 1, 1,
0.129529, -0.3909035, 3.359021, 0, 0.8156863, 1, 1,
0.1397007, 0.5174824, -0.2246421, 0, 0.8078431, 1, 1,
0.1416113, 1.553262, -1.835672, 0, 0.8039216, 1, 1,
0.1421368, -0.4995279, 4.231891, 0, 0.7960784, 1, 1,
0.1423945, -1.751356, 0.8374571, 0, 0.7882353, 1, 1,
0.1458026, -0.4738793, 3.153662, 0, 0.7843137, 1, 1,
0.1473592, -0.822119, 3.737235, 0, 0.7764706, 1, 1,
0.1487805, 2.104208, 1.579968, 0, 0.772549, 1, 1,
0.1497966, 0.2820341, -0.04312481, 0, 0.7647059, 1, 1,
0.1532077, 0.4094767, 0.820766, 0, 0.7607843, 1, 1,
0.1534503, -2.109228, 2.662032, 0, 0.7529412, 1, 1,
0.1565563, -0.0291588, 0.4903346, 0, 0.7490196, 1, 1,
0.1571312, -1.403874, 1.472615, 0, 0.7411765, 1, 1,
0.1572317, -1.35146, 1.659925, 0, 0.7372549, 1, 1,
0.1605479, -0.7395155, 2.774437, 0, 0.7294118, 1, 1,
0.1673151, 0.3955844, -0.3191029, 0, 0.7254902, 1, 1,
0.169223, -0.6831192, 1.973168, 0, 0.7176471, 1, 1,
0.1719316, -0.420438, 4.35494, 0, 0.7137255, 1, 1,
0.1723735, -0.5529909, 4.049582, 0, 0.7058824, 1, 1,
0.1777564, -0.6519721, 2.604339, 0, 0.6980392, 1, 1,
0.1779723, 0.5321472, -0.0158105, 0, 0.6941177, 1, 1,
0.1813257, -0.2793105, 4.522271, 0, 0.6862745, 1, 1,
0.1827426, -1.611834, 3.31269, 0, 0.682353, 1, 1,
0.186802, -0.2324876, 3.067178, 0, 0.6745098, 1, 1,
0.189584, 0.6878244, 0.1866346, 0, 0.6705883, 1, 1,
0.196389, -0.606979, 1.984223, 0, 0.6627451, 1, 1,
0.1976518, -2.268188, 3.21569, 0, 0.6588235, 1, 1,
0.1995238, -1.1071, 1.843964, 0, 0.6509804, 1, 1,
0.2066478, -0.5884153, 4.173806, 0, 0.6470588, 1, 1,
0.2076621, 0.08345114, 2.498276, 0, 0.6392157, 1, 1,
0.2112504, -1.163904, 2.073708, 0, 0.6352941, 1, 1,
0.2116542, 0.02901193, 2.577987, 0, 0.627451, 1, 1,
0.2134221, 0.6655747, 2.13993, 0, 0.6235294, 1, 1,
0.2177029, -0.05996234, -0.06485452, 0, 0.6156863, 1, 1,
0.2231833, -0.2721577, 1.844496, 0, 0.6117647, 1, 1,
0.2274238, 1.668588, -0.06799372, 0, 0.6039216, 1, 1,
0.2320566, -0.6310078, 2.627028, 0, 0.5960785, 1, 1,
0.2333587, -3.547291, 3.810744, 0, 0.5921569, 1, 1,
0.2336557, 0.3678609, 2.211924, 0, 0.5843138, 1, 1,
0.2367739, -0.8082305, 1.39568, 0, 0.5803922, 1, 1,
0.2385081, -1.400501, 3.12046, 0, 0.572549, 1, 1,
0.2391513, 1.231071, -0.2058942, 0, 0.5686275, 1, 1,
0.2392406, -0.5589178, 3.694576, 0, 0.5607843, 1, 1,
0.2416058, -0.7244346, 5.163983, 0, 0.5568628, 1, 1,
0.2433595, 0.9080703, 2.230766, 0, 0.5490196, 1, 1,
0.2492138, -1.217939, 4.382174, 0, 0.5450981, 1, 1,
0.2528077, 1.455818, 0.1344485, 0, 0.5372549, 1, 1,
0.2563891, 0.50098, 1.617354, 0, 0.5333334, 1, 1,
0.2618903, -0.2332927, 0.9730758, 0, 0.5254902, 1, 1,
0.2772675, 0.380828, 0.4044318, 0, 0.5215687, 1, 1,
0.277631, 0.4350822, 2.025295, 0, 0.5137255, 1, 1,
0.2825185, -0.977705, 3.218443, 0, 0.509804, 1, 1,
0.2827899, 0.00870478, 2.210617, 0, 0.5019608, 1, 1,
0.287667, 1.355052, 1.285082, 0, 0.4941176, 1, 1,
0.2886463, 1.187298, 1.72622, 0, 0.4901961, 1, 1,
0.2905837, 2.213019, -1.089821, 0, 0.4823529, 1, 1,
0.2910483, 2.20057, -0.2323426, 0, 0.4784314, 1, 1,
0.2919607, -0.7245035, 3.79025, 0, 0.4705882, 1, 1,
0.2924508, -0.8288999, 2.922212, 0, 0.4666667, 1, 1,
0.2990109, 1.230453, 2.011811, 0, 0.4588235, 1, 1,
0.2996758, -1.154498, 2.499048, 0, 0.454902, 1, 1,
0.3051997, 2.06986, -0.1568318, 0, 0.4470588, 1, 1,
0.3056238, 0.6645995, -1.373695, 0, 0.4431373, 1, 1,
0.3073706, -1.31351, 1.6194, 0, 0.4352941, 1, 1,
0.3088679, -0.3066288, 0.8090297, 0, 0.4313726, 1, 1,
0.311094, 1.253579, -0.9375459, 0, 0.4235294, 1, 1,
0.312548, 0.7825907, -0.2588507, 0, 0.4196078, 1, 1,
0.3149297, 1.247453, -0.2703971, 0, 0.4117647, 1, 1,
0.3163655, -0.2534305, 3.059048, 0, 0.4078431, 1, 1,
0.3260244, -1.245579, 3.836411, 0, 0.4, 1, 1,
0.3278271, -0.6132526, 1.989717, 0, 0.3921569, 1, 1,
0.3311568, 0.1605054, 1.322923, 0, 0.3882353, 1, 1,
0.33226, -1.400103, 3.471375, 0, 0.3803922, 1, 1,
0.3334735, 1.078046, -0.4171863, 0, 0.3764706, 1, 1,
0.3373705, 0.892962, 0.4804473, 0, 0.3686275, 1, 1,
0.338639, 1.133773, -1.740517, 0, 0.3647059, 1, 1,
0.3418114, -1.718059, 3.024473, 0, 0.3568628, 1, 1,
0.3439145, -0.9310783, 1.863071, 0, 0.3529412, 1, 1,
0.34443, -1.168311, 2.838217, 0, 0.345098, 1, 1,
0.3469925, -0.8357197, 2.732061, 0, 0.3411765, 1, 1,
0.3482381, -0.6129737, 3.603567, 0, 0.3333333, 1, 1,
0.3503696, 0.04140287, 2.055516, 0, 0.3294118, 1, 1,
0.3527304, 0.7086336, 0.1781465, 0, 0.3215686, 1, 1,
0.3575734, -0.6404859, 1.692599, 0, 0.3176471, 1, 1,
0.3659388, -0.1189125, 1.686123, 0, 0.3098039, 1, 1,
0.3723975, 1.931706, -1.351193, 0, 0.3058824, 1, 1,
0.3740348, -1.698486, 2.798859, 0, 0.2980392, 1, 1,
0.3777348, -1.936346, 3.129814, 0, 0.2901961, 1, 1,
0.377737, -1.288803, 2.405729, 0, 0.2862745, 1, 1,
0.3821701, 0.3093804, -0.08555889, 0, 0.2784314, 1, 1,
0.3834415, -0.7039169, 1.841056, 0, 0.2745098, 1, 1,
0.3876437, 2.517259, 1.91765, 0, 0.2666667, 1, 1,
0.3892088, 0.4421273, -0.3869328, 0, 0.2627451, 1, 1,
0.3894568, 0.3991536, -0.3137876, 0, 0.254902, 1, 1,
0.3895574, 0.6128584, -1.076793, 0, 0.2509804, 1, 1,
0.3898168, -1.038036, 3.944518, 0, 0.2431373, 1, 1,
0.3904598, -1.359488, 0.4783454, 0, 0.2392157, 1, 1,
0.394392, 1.07059, 1.70138, 0, 0.2313726, 1, 1,
0.3962934, -0.2760872, 2.172186, 0, 0.227451, 1, 1,
0.3971653, -0.2078187, 2.901558, 0, 0.2196078, 1, 1,
0.3974164, -1.30768, 4.897857, 0, 0.2156863, 1, 1,
0.3997957, 0.4102153, 0.5508983, 0, 0.2078431, 1, 1,
0.4041079, -1.194664, 3.91241, 0, 0.2039216, 1, 1,
0.4096559, -0.872781, 3.103484, 0, 0.1960784, 1, 1,
0.4197651, -0.3828387, 2.594069, 0, 0.1882353, 1, 1,
0.4202043, -0.4744232, 2.848556, 0, 0.1843137, 1, 1,
0.4275679, 0.8260163, 0.734939, 0, 0.1764706, 1, 1,
0.428693, 0.2211156, 3.157695, 0, 0.172549, 1, 1,
0.4297507, 0.7427068, 0.1364384, 0, 0.1647059, 1, 1,
0.4325114, 1.309041, -0.01241725, 0, 0.1607843, 1, 1,
0.4357098, -1.103976, 3.562028, 0, 0.1529412, 1, 1,
0.4384299, 0.453274, 0.5772523, 0, 0.1490196, 1, 1,
0.4390037, 0.672987, 0.9021774, 0, 0.1411765, 1, 1,
0.439135, -1.828538, 3.806077, 0, 0.1372549, 1, 1,
0.4439826, -1.397665, 2.133486, 0, 0.1294118, 1, 1,
0.4465382, -0.7604588, 3.931247, 0, 0.1254902, 1, 1,
0.4492106, 0.4356135, 1.024926, 0, 0.1176471, 1, 1,
0.4495908, -0.8843557, 1.883965, 0, 0.1137255, 1, 1,
0.4512268, -0.8316594, 2.747734, 0, 0.1058824, 1, 1,
0.4526509, 0.5301399, 1.361361, 0, 0.09803922, 1, 1,
0.4531543, 0.08095136, 1.872147, 0, 0.09411765, 1, 1,
0.4563217, 0.4701763, 0.7317937, 0, 0.08627451, 1, 1,
0.4591173, -0.5911978, 2.11316, 0, 0.08235294, 1, 1,
0.4621347, 0.818772, 0.4854829, 0, 0.07450981, 1, 1,
0.4647762, 0.3586347, 0.9818643, 0, 0.07058824, 1, 1,
0.4663434, 0.0353211, 3.212868, 0, 0.0627451, 1, 1,
0.4693943, -1.105274, 3.345198, 0, 0.05882353, 1, 1,
0.4695463, 1.726421, 0.4365343, 0, 0.05098039, 1, 1,
0.4719026, 1.341154, 1.009139, 0, 0.04705882, 1, 1,
0.4722606, 1.155113, -0.8602826, 0, 0.03921569, 1, 1,
0.4741384, 0.1547345, 1.028593, 0, 0.03529412, 1, 1,
0.4771169, 1.204556, 1.455531, 0, 0.02745098, 1, 1,
0.4778588, -0.5148196, 3.10953, 0, 0.02352941, 1, 1,
0.4847993, 0.3126456, 0.7051373, 0, 0.01568628, 1, 1,
0.4858507, -1.028232, 3.366316, 0, 0.01176471, 1, 1,
0.4869075, -1.218302, 2.020709, 0, 0.003921569, 1, 1,
0.4917493, 0.844177, 0.4709045, 0.003921569, 0, 1, 1,
0.4918379, 0.8896715, 1.564099, 0.007843138, 0, 1, 1,
0.492444, 0.2739315, 1.361562, 0.01568628, 0, 1, 1,
0.4931186, 0.9286838, 2.094742, 0.01960784, 0, 1, 1,
0.4971809, 0.7717679, 0.04453399, 0.02745098, 0, 1, 1,
0.499573, -0.01221523, 0.08124015, 0.03137255, 0, 1, 1,
0.5047967, -2.290565, 2.293628, 0.03921569, 0, 1, 1,
0.5080656, 0.1371312, 1.552218, 0.04313726, 0, 1, 1,
0.5083741, -1.136529, 4.033844, 0.05098039, 0, 1, 1,
0.5106583, -0.8361725, 2.119094, 0.05490196, 0, 1, 1,
0.5163072, -1.621318, 1.866, 0.0627451, 0, 1, 1,
0.518497, -0.2954307, 2.896212, 0.06666667, 0, 1, 1,
0.5187375, -0.7580581, 2.21969, 0.07450981, 0, 1, 1,
0.5197546, 0.1633687, 2.310615, 0.07843138, 0, 1, 1,
0.5250547, -0.5892558, 0.8608254, 0.08627451, 0, 1, 1,
0.5256739, -0.07507382, 2.544089, 0.09019608, 0, 1, 1,
0.5284979, 2.028085, 0.3347304, 0.09803922, 0, 1, 1,
0.5366541, 0.2009682, 1.096707, 0.1058824, 0, 1, 1,
0.5412212, 0.1148477, 0.3582392, 0.1098039, 0, 1, 1,
0.5412288, -0.8525088, 4.239947, 0.1176471, 0, 1, 1,
0.5423531, -0.2341859, 2.225035, 0.1215686, 0, 1, 1,
0.5426056, -0.3675206, 2.345098, 0.1294118, 0, 1, 1,
0.5450589, -0.4534556, 2.108002, 0.1333333, 0, 1, 1,
0.5454248, -1.890097, 4.519293, 0.1411765, 0, 1, 1,
0.5454599, -0.2079823, 2.325831, 0.145098, 0, 1, 1,
0.5472713, -1.592355, 1.322409, 0.1529412, 0, 1, 1,
0.5533339, -0.06624839, 1.315902, 0.1568628, 0, 1, 1,
0.5578213, -0.7253529, 2.182037, 0.1647059, 0, 1, 1,
0.558821, 1.6602, -0.3796768, 0.1686275, 0, 1, 1,
0.5588486, -0.07735559, -0.1936932, 0.1764706, 0, 1, 1,
0.5605945, -1.672559, 1.649734, 0.1803922, 0, 1, 1,
0.5639362, 0.2837414, -1.499496, 0.1882353, 0, 1, 1,
0.5653554, -0.1841906, 1.25498, 0.1921569, 0, 1, 1,
0.5668837, 0.5915888, 0.9227384, 0.2, 0, 1, 1,
0.5675685, 1.02005, -1.831322, 0.2078431, 0, 1, 1,
0.576251, 0.2700542, -0.7793828, 0.2117647, 0, 1, 1,
0.5872665, 2.208131, 0.7217926, 0.2196078, 0, 1, 1,
0.5892434, -0.05311183, 1.002751, 0.2235294, 0, 1, 1,
0.5951795, 0.1477164, 0.7109817, 0.2313726, 0, 1, 1,
0.5955146, 0.9593317, -1.33791, 0.2352941, 0, 1, 1,
0.5980875, -0.5266076, 1.857558, 0.2431373, 0, 1, 1,
0.608889, 1.215317, 0.4877025, 0.2470588, 0, 1, 1,
0.6112944, -1.397805, 3.515256, 0.254902, 0, 1, 1,
0.6122174, -1.258503, 1.446783, 0.2588235, 0, 1, 1,
0.6197, -0.7832352, 4.286079, 0.2666667, 0, 1, 1,
0.624278, -0.6030445, 1.254105, 0.2705882, 0, 1, 1,
0.6245411, 2.835977, 0.5346511, 0.2784314, 0, 1, 1,
0.6254676, 0.3084387, 1.191699, 0.282353, 0, 1, 1,
0.6268076, 2.412968, 0.09994096, 0.2901961, 0, 1, 1,
0.6268632, 1.161277, 0.9126658, 0.2941177, 0, 1, 1,
0.6275649, -0.2978503, 2.628558, 0.3019608, 0, 1, 1,
0.6287411, 0.339711, -0.9518542, 0.3098039, 0, 1, 1,
0.6329347, -0.2142596, 1.422394, 0.3137255, 0, 1, 1,
0.6349206, -0.3647555, 3.11113, 0.3215686, 0, 1, 1,
0.6408122, 0.4058653, 0.614535, 0.3254902, 0, 1, 1,
0.6474285, -0.6905925, 1.130099, 0.3333333, 0, 1, 1,
0.6495584, 1.319561, 0.4359068, 0.3372549, 0, 1, 1,
0.6536125, 1.080208, 0.6058661, 0.345098, 0, 1, 1,
0.6549662, -0.490623, 3.385088, 0.3490196, 0, 1, 1,
0.6569543, 1.753858, -0.6570805, 0.3568628, 0, 1, 1,
0.6590275, -0.3988653, 1.517521, 0.3607843, 0, 1, 1,
0.6714194, -1.674727, 2.389947, 0.3686275, 0, 1, 1,
0.6721326, -0.4465909, 2.880392, 0.372549, 0, 1, 1,
0.6748235, 0.9648072, 0.3596233, 0.3803922, 0, 1, 1,
0.677375, 1.117875, 0.8463905, 0.3843137, 0, 1, 1,
0.6777702, 0.6945795, 0.8876942, 0.3921569, 0, 1, 1,
0.6781817, -0.9977432, 3.957328, 0.3960784, 0, 1, 1,
0.6788166, -0.03376272, 3.596242, 0.4039216, 0, 1, 1,
0.6835865, 1.061313, -0.0650465, 0.4117647, 0, 1, 1,
0.6844251, 0.8436022, -0.408014, 0.4156863, 0, 1, 1,
0.6877396, 0.1103732, 0.9226061, 0.4235294, 0, 1, 1,
0.6933728, 0.361795, 0.3506917, 0.427451, 0, 1, 1,
0.6949112, -0.4384066, 2.153055, 0.4352941, 0, 1, 1,
0.6953729, -0.4131885, 2.611032, 0.4392157, 0, 1, 1,
0.6955678, 0.5237733, 2.128537, 0.4470588, 0, 1, 1,
0.6974154, -0.3242732, 3.096884, 0.4509804, 0, 1, 1,
0.6985435, 1.091028, 1.439004, 0.4588235, 0, 1, 1,
0.6999093, -0.2004267, 1.551297, 0.4627451, 0, 1, 1,
0.7011698, -1.756528, 3.178648, 0.4705882, 0, 1, 1,
0.7040823, 1.294275, 0.08639731, 0.4745098, 0, 1, 1,
0.7057165, -1.404679, 4.167063, 0.4823529, 0, 1, 1,
0.7113162, 0.244782, 0.9242984, 0.4862745, 0, 1, 1,
0.7117899, 0.8651494, 0.2699214, 0.4941176, 0, 1, 1,
0.7200977, 1.337956, 0.9808841, 0.5019608, 0, 1, 1,
0.7247922, 1.224722, 0.8821567, 0.5058824, 0, 1, 1,
0.7281786, 0.5850931, 0.07504807, 0.5137255, 0, 1, 1,
0.7329747, -0.7401124, -0.3916998, 0.5176471, 0, 1, 1,
0.7397953, 1.89911, -0.5007613, 0.5254902, 0, 1, 1,
0.7438591, 0.1175333, 2.732761, 0.5294118, 0, 1, 1,
0.7442393, -0.4917975, 2.91157, 0.5372549, 0, 1, 1,
0.7467867, 0.5530906, 2.133146, 0.5411765, 0, 1, 1,
0.7468393, -0.4940561, 2.045182, 0.5490196, 0, 1, 1,
0.7469624, 0.9907818, 0.4465913, 0.5529412, 0, 1, 1,
0.7505195, -1.295358, 2.287108, 0.5607843, 0, 1, 1,
0.750726, -1.131327, 2.473135, 0.5647059, 0, 1, 1,
0.7522357, 0.4613388, 0.8190824, 0.572549, 0, 1, 1,
0.7560368, -0.2659023, 0.6909663, 0.5764706, 0, 1, 1,
0.7569501, -0.1578218, 0.5735289, 0.5843138, 0, 1, 1,
0.7581775, -0.02270913, 1.675708, 0.5882353, 0, 1, 1,
0.7602035, 1.039428, 0.3715249, 0.5960785, 0, 1, 1,
0.7637421, -0.03657635, 1.623939, 0.6039216, 0, 1, 1,
0.775277, 0.6180327, 1.899613, 0.6078432, 0, 1, 1,
0.7776547, -0.09413411, 1.203757, 0.6156863, 0, 1, 1,
0.7964891, 1.027988, 0.8127646, 0.6196079, 0, 1, 1,
0.7974015, 0.01603778, -0.06748543, 0.627451, 0, 1, 1,
0.7979825, 2.543698, 1.454936, 0.6313726, 0, 1, 1,
0.8015774, -1.307479, 3.480092, 0.6392157, 0, 1, 1,
0.8062348, 0.06254219, 0.236648, 0.6431373, 0, 1, 1,
0.8062909, -0.06346007, 2.290658, 0.6509804, 0, 1, 1,
0.806675, -0.4054269, 3.333405, 0.654902, 0, 1, 1,
0.8075263, -0.01870436, 2.207853, 0.6627451, 0, 1, 1,
0.8113745, -0.1664249, 2.241257, 0.6666667, 0, 1, 1,
0.8166099, -1.342094, 2.829088, 0.6745098, 0, 1, 1,
0.8178481, -0.3339703, -0.1308678, 0.6784314, 0, 1, 1,
0.8205232, -0.897158, 0.153108, 0.6862745, 0, 1, 1,
0.820833, 0.1502327, 3.577909, 0.6901961, 0, 1, 1,
0.8211975, 0.5962673, 1.556336, 0.6980392, 0, 1, 1,
0.8233105, 1.358431, 1.127064, 0.7058824, 0, 1, 1,
0.8285488, 0.5376677, 0.08272338, 0.7098039, 0, 1, 1,
0.8293889, -0.9179106, 2.990695, 0.7176471, 0, 1, 1,
0.829957, -0.8980167, 2.975191, 0.7215686, 0, 1, 1,
0.8318295, 0.6304483, 0.6557325, 0.7294118, 0, 1, 1,
0.8342843, -1.704334, 0.5728966, 0.7333333, 0, 1, 1,
0.8484148, 0.01959384, 1.373517, 0.7411765, 0, 1, 1,
0.8485376, -0.5929167, 2.062359, 0.7450981, 0, 1, 1,
0.8561538, 0.09107664, 0.196787, 0.7529412, 0, 1, 1,
0.8572291, 1.518565, 2.082642, 0.7568628, 0, 1, 1,
0.8585467, -0.3989949, 3.563529, 0.7647059, 0, 1, 1,
0.8693292, -0.3891549, 2.292492, 0.7686275, 0, 1, 1,
0.8713179, 1.255748, 2.549134, 0.7764706, 0, 1, 1,
0.8836889, 0.2736031, 1.316309, 0.7803922, 0, 1, 1,
0.889125, 1.761923, -0.1658979, 0.7882353, 0, 1, 1,
0.8945888, 0.8414743, 2.464133, 0.7921569, 0, 1, 1,
0.8960463, -1.955132, 2.399874, 0.8, 0, 1, 1,
0.8962159, -0.510359, 0.8847493, 0.8078431, 0, 1, 1,
0.8995126, -0.08599899, 0.3944669, 0.8117647, 0, 1, 1,
0.9057719, 0.09142648, 0.9035658, 0.8196079, 0, 1, 1,
0.9107678, 1.173636, 1.49602, 0.8235294, 0, 1, 1,
0.9129736, -0.523378, 2.16323, 0.8313726, 0, 1, 1,
0.9177607, -0.6268837, 0.7474865, 0.8352941, 0, 1, 1,
0.9213125, -0.5317688, 0.6520489, 0.8431373, 0, 1, 1,
0.9213685, 1.207949, 2.165429, 0.8470588, 0, 1, 1,
0.9226973, -1.208213, 2.241055, 0.854902, 0, 1, 1,
0.9237779, -0.03484944, 2.547222, 0.8588235, 0, 1, 1,
0.9383234, -2.398401, 4.316647, 0.8666667, 0, 1, 1,
0.9386583, 3.436446, -0.2733769, 0.8705882, 0, 1, 1,
0.9405506, 0.3767198, 2.371791, 0.8784314, 0, 1, 1,
0.9422145, 0.1780172, 0.3556425, 0.8823529, 0, 1, 1,
0.944474, -1.271514, 3.187497, 0.8901961, 0, 1, 1,
0.9465257, 0.692848, 2.853361, 0.8941177, 0, 1, 1,
0.9496743, 1.018983, 0.2410259, 0.9019608, 0, 1, 1,
0.955982, 0.4576049, 2.370549, 0.9098039, 0, 1, 1,
0.9565186, 0.9426421, 1.880253, 0.9137255, 0, 1, 1,
0.9587029, 0.6344398, 0.3220791, 0.9215686, 0, 1, 1,
0.9606514, -1.944286, 1.484713, 0.9254902, 0, 1, 1,
0.9613511, -0.6291512, 0.2377355, 0.9333333, 0, 1, 1,
0.9686329, 0.1055724, 1.847654, 0.9372549, 0, 1, 1,
0.9781286, 0.6174113, -0.4372989, 0.945098, 0, 1, 1,
0.9825042, 0.8861154, 0.2650936, 0.9490196, 0, 1, 1,
0.9992522, 0.1870677, 0.4006145, 0.9568627, 0, 1, 1,
1.004946, -0.4313133, 1.462956, 0.9607843, 0, 1, 1,
1.015694, 0.1027125, 1.375138, 0.9686275, 0, 1, 1,
1.020843, -1.123278, 2.365504, 0.972549, 0, 1, 1,
1.02961, -0.9826434, 1.578761, 0.9803922, 0, 1, 1,
1.039562, 1.056296, 1.808062, 0.9843137, 0, 1, 1,
1.045396, 1.003376, 1.61987, 0.9921569, 0, 1, 1,
1.046339, 0.1730651, 2.398206, 0.9960784, 0, 1, 1,
1.046374, -0.4182352, 1.457281, 1, 0, 0.9960784, 1,
1.048173, 2.000634, 0.5064179, 1, 0, 0.9882353, 1,
1.051171, -0.512756, 1.20371, 1, 0, 0.9843137, 1,
1.051186, -1.712657, 3.033069, 1, 0, 0.9764706, 1,
1.051419, -0.06558065, 3.202495, 1, 0, 0.972549, 1,
1.05265, -0.5083343, 2.40036, 1, 0, 0.9647059, 1,
1.053818, -0.1992961, 0.5085747, 1, 0, 0.9607843, 1,
1.055154, -0.4386848, 2.552335, 1, 0, 0.9529412, 1,
1.056037, 1.239249, 0.3879081, 1, 0, 0.9490196, 1,
1.058052, -1.017197, 2.397383, 1, 0, 0.9411765, 1,
1.062089, 0.1157704, -0.06289633, 1, 0, 0.9372549, 1,
1.069602, -0.1672428, 2.449926, 1, 0, 0.9294118, 1,
1.075307, 1.6956, 2.615431, 1, 0, 0.9254902, 1,
1.080969, 0.4463412, 0.7027172, 1, 0, 0.9176471, 1,
1.083067, 1.057012, -0.3207853, 1, 0, 0.9137255, 1,
1.090659, -0.07811279, 3.475608, 1, 0, 0.9058824, 1,
1.094573, 1.931839, 0.3580231, 1, 0, 0.9019608, 1,
1.095825, -1.164452, 2.444579, 1, 0, 0.8941177, 1,
1.097436, -0.3823163, 1.314748, 1, 0, 0.8862745, 1,
1.104403, -1.520407, 1.698411, 1, 0, 0.8823529, 1,
1.106833, -1.382242, 2.186555, 1, 0, 0.8745098, 1,
1.107011, -2.445988, 2.659801, 1, 0, 0.8705882, 1,
1.112679, 0.2507352, 1.379831, 1, 0, 0.8627451, 1,
1.11562, 0.4080257, 2.372167, 1, 0, 0.8588235, 1,
1.124783, 0.2519544, 0.4599342, 1, 0, 0.8509804, 1,
1.130545, 0.7388704, -0.6406361, 1, 0, 0.8470588, 1,
1.13503, 0.4089227, 1.343106, 1, 0, 0.8392157, 1,
1.13659, 1.50332, 1.313166, 1, 0, 0.8352941, 1,
1.146185, 0.8438561, 0.4408114, 1, 0, 0.827451, 1,
1.14821, -1.68908, 4.654061, 1, 0, 0.8235294, 1,
1.148833, 0.9624981, 1.371709, 1, 0, 0.8156863, 1,
1.15331, -0.2154627, 1.275868, 1, 0, 0.8117647, 1,
1.153909, -1.262648, 4.359452, 1, 0, 0.8039216, 1,
1.157036, -0.8785777, 2.421929, 1, 0, 0.7960784, 1,
1.166563, 0.1079376, 2.956817, 1, 0, 0.7921569, 1,
1.171099, 0.09557047, 0.9660099, 1, 0, 0.7843137, 1,
1.180349, -0.879572, 1.426441, 1, 0, 0.7803922, 1,
1.189277, -0.6448101, 1.696386, 1, 0, 0.772549, 1,
1.189965, -1.253422, 2.068547, 1, 0, 0.7686275, 1,
1.194714, -0.5661981, 0.8842016, 1, 0, 0.7607843, 1,
1.199143, -0.3270427, 1.911442, 1, 0, 0.7568628, 1,
1.206475, 0.6510118, 0.7313026, 1, 0, 0.7490196, 1,
1.206766, -1.823552, 2.838435, 1, 0, 0.7450981, 1,
1.207227, -0.7582548, 2.368222, 1, 0, 0.7372549, 1,
1.212307, 0.2240739, 3.632712, 1, 0, 0.7333333, 1,
1.21486, 1.47712, -0.9962612, 1, 0, 0.7254902, 1,
1.222122, -0.08925015, 1.912678, 1, 0, 0.7215686, 1,
1.223, 0.6531034, 0.4524295, 1, 0, 0.7137255, 1,
1.229523, 0.08804306, 0.5890719, 1, 0, 0.7098039, 1,
1.238201, 1.127466, 2.095901, 1, 0, 0.7019608, 1,
1.238324, -0.9702069, 0.7951788, 1, 0, 0.6941177, 1,
1.242683, 1.146245, -0.2558521, 1, 0, 0.6901961, 1,
1.24595, 1.201479, 0.8877296, 1, 0, 0.682353, 1,
1.266778, 0.9405226, -1.102426, 1, 0, 0.6784314, 1,
1.268213, -0.1269476, 0.8021816, 1, 0, 0.6705883, 1,
1.272283, 0.6950129, 1.006666, 1, 0, 0.6666667, 1,
1.272377, 0.07169941, 1.88804, 1, 0, 0.6588235, 1,
1.273049, -1.341346, 2.047828, 1, 0, 0.654902, 1,
1.276059, 0.106909, 0.9073573, 1, 0, 0.6470588, 1,
1.290569, 0.5065606, 0.02492839, 1, 0, 0.6431373, 1,
1.298147, 0.989659, 0.7802728, 1, 0, 0.6352941, 1,
1.300727, -0.1424447, 1.201719, 1, 0, 0.6313726, 1,
1.308871, 0.1617231, 2.713242, 1, 0, 0.6235294, 1,
1.309646, 0.9630696, 1.575579, 1, 0, 0.6196079, 1,
1.331419, -2.004537, 3.193444, 1, 0, 0.6117647, 1,
1.33907, 1.100019, 3.014611, 1, 0, 0.6078432, 1,
1.34678, -1.143259, 2.390392, 1, 0, 0.6, 1,
1.35093, -0.03198717, 1.192007, 1, 0, 0.5921569, 1,
1.35785, -0.8872508, 3.600324, 1, 0, 0.5882353, 1,
1.375646, 1.321286, 0.255729, 1, 0, 0.5803922, 1,
1.37838, 0.3113482, 0.07291851, 1, 0, 0.5764706, 1,
1.380953, 0.5231948, 0.4703562, 1, 0, 0.5686275, 1,
1.383715, 0.2160862, -1.181894, 1, 0, 0.5647059, 1,
1.386497, -0.1104067, -0.3035389, 1, 0, 0.5568628, 1,
1.387162, -0.176823, 1.416213, 1, 0, 0.5529412, 1,
1.394531, -0.9129474, 1.327011, 1, 0, 0.5450981, 1,
1.396632, -0.9721255, 3.189908, 1, 0, 0.5411765, 1,
1.420424, 0.8040807, 1.123269, 1, 0, 0.5333334, 1,
1.421027, -0.6524019, 3.099496, 1, 0, 0.5294118, 1,
1.423525, 1.214861, 2.571694, 1, 0, 0.5215687, 1,
1.426343, 0.08545426, 2.700107, 1, 0, 0.5176471, 1,
1.439612, -1.218292, 2.477903, 1, 0, 0.509804, 1,
1.443388, -0.6621239, 1.907812, 1, 0, 0.5058824, 1,
1.444085, 1.192675, 1.031624, 1, 0, 0.4980392, 1,
1.444541, -0.01173316, 0.3631482, 1, 0, 0.4901961, 1,
1.448119, -2.286766, 3.085674, 1, 0, 0.4862745, 1,
1.45355, 0.6607394, 1.266793, 1, 0, 0.4784314, 1,
1.457794, -0.4555718, 0.2135914, 1, 0, 0.4745098, 1,
1.465624, 0.4290731, -0.03816938, 1, 0, 0.4666667, 1,
1.466175, -0.1569225, 2.058595, 1, 0, 0.4627451, 1,
1.47854, 0.1500195, 2.26865, 1, 0, 0.454902, 1,
1.480265, -0.2471378, 1.095904, 1, 0, 0.4509804, 1,
1.482605, 0.4651912, 2.2169, 1, 0, 0.4431373, 1,
1.498234, 0.106639, 1.447465, 1, 0, 0.4392157, 1,
1.517323, -1.226502, 1.94135, 1, 0, 0.4313726, 1,
1.52574, 0.6017275, 2.680621, 1, 0, 0.427451, 1,
1.528294, 0.8146839, 0.5074987, 1, 0, 0.4196078, 1,
1.540739, 0.0642134, 1.172186, 1, 0, 0.4156863, 1,
1.542703, -0.8704532, 2.138805, 1, 0, 0.4078431, 1,
1.547064, 1.706113, 0.8231999, 1, 0, 0.4039216, 1,
1.549009, 0.3743981, 1.104033, 1, 0, 0.3960784, 1,
1.560552, 0.2126742, 0.551253, 1, 0, 0.3882353, 1,
1.574138, 0.9689971, -0.7214987, 1, 0, 0.3843137, 1,
1.575857, -1.087206, 2.577893, 1, 0, 0.3764706, 1,
1.588817, -0.08701371, 1.644218, 1, 0, 0.372549, 1,
1.589191, 0.7666676, 2.008304, 1, 0, 0.3647059, 1,
1.604573, 0.4463046, 1.565265, 1, 0, 0.3607843, 1,
1.624919, -0.8121496, 1.921532, 1, 0, 0.3529412, 1,
1.638713, 0.9369251, -0.9098766, 1, 0, 0.3490196, 1,
1.643522, 0.7483277, 2.574526, 1, 0, 0.3411765, 1,
1.660706, -1.242591, 2.26798, 1, 0, 0.3372549, 1,
1.677076, 0.6465256, 2.515528, 1, 0, 0.3294118, 1,
1.682358, -0.250875, 2.012053, 1, 0, 0.3254902, 1,
1.687231, 0.3907659, 0.1005661, 1, 0, 0.3176471, 1,
1.695865, 0.8485373, 1.877361, 1, 0, 0.3137255, 1,
1.697756, 1.297372, 0.08398118, 1, 0, 0.3058824, 1,
1.699738, 1.464695, -0.1410948, 1, 0, 0.2980392, 1,
1.705056, -0.6700599, 0.404607, 1, 0, 0.2941177, 1,
1.705526, 0.7162966, 1.278605, 1, 0, 0.2862745, 1,
1.763352, 0.9417764, -0.8217239, 1, 0, 0.282353, 1,
1.763759, -0.4861181, 1.18221, 1, 0, 0.2745098, 1,
1.766805, 0.1404227, 3.372458, 1, 0, 0.2705882, 1,
1.785498, 0.2657238, -0.0943803, 1, 0, 0.2627451, 1,
1.808969, -1.349957, 1.740874, 1, 0, 0.2588235, 1,
1.812888, 0.4103611, 2.986834, 1, 0, 0.2509804, 1,
1.820418, -0.1496924, 2.088562, 1, 0, 0.2470588, 1,
1.822084, -1.441826, 1.992489, 1, 0, 0.2392157, 1,
1.878559, 1.120531, 0.9313444, 1, 0, 0.2352941, 1,
1.887657, -1.023928, 3.349014, 1, 0, 0.227451, 1,
1.902523, -0.5409589, 1.526798, 1, 0, 0.2235294, 1,
1.903212, 1.295546, 1.160619, 1, 0, 0.2156863, 1,
1.917493, 1.030616, -0.3953419, 1, 0, 0.2117647, 1,
1.9179, 0.38245, 2.890366, 1, 0, 0.2039216, 1,
1.932556, 1.955029, 2.712761, 1, 0, 0.1960784, 1,
1.935413, 2.225407, 0.3085899, 1, 0, 0.1921569, 1,
1.96252, -1.154041, 3.337362, 1, 0, 0.1843137, 1,
1.972244, 0.5931106, 1.17965, 1, 0, 0.1803922, 1,
2.001145, 0.7836832, 1.629552, 1, 0, 0.172549, 1,
2.048121, -0.3869708, 1.316603, 1, 0, 0.1686275, 1,
2.057001, 0.2540323, 1.788926, 1, 0, 0.1607843, 1,
2.105972, 0.06873853, 1.826493, 1, 0, 0.1568628, 1,
2.117376, 1.307911, 0.5357081, 1, 0, 0.1490196, 1,
2.138194, 0.01388109, 0.5055466, 1, 0, 0.145098, 1,
2.158703, 0.952746, 0.1342544, 1, 0, 0.1372549, 1,
2.229346, 0.04286509, -0.6175641, 1, 0, 0.1333333, 1,
2.259623, 0.9354235, -0.6095181, 1, 0, 0.1254902, 1,
2.260412, -1.276106, 2.301025, 1, 0, 0.1215686, 1,
2.278236, 0.02670329, 2.059169, 1, 0, 0.1137255, 1,
2.280003, 0.184138, 1.060679, 1, 0, 0.1098039, 1,
2.29444, 0.4880358, 1.707734, 1, 0, 0.1019608, 1,
2.329228, 1.45912, -0.2902687, 1, 0, 0.09411765, 1,
2.334368, -1.800973, 2.216473, 1, 0, 0.09019608, 1,
2.386663, -0.2748679, 2.736551, 1, 0, 0.08235294, 1,
2.422435, 0.3524696, 1.206421, 1, 0, 0.07843138, 1,
2.424881, -0.1023355, 1.946584, 1, 0, 0.07058824, 1,
2.473292, 1.566941, 2.343961, 1, 0, 0.06666667, 1,
2.47813, 0.6185278, -0.1715606, 1, 0, 0.05882353, 1,
2.486123, -0.04442192, -1.105113, 1, 0, 0.05490196, 1,
2.49241, 0.562353, 1.254008, 1, 0, 0.04705882, 1,
2.523057, 0.5707642, 1.916224, 1, 0, 0.04313726, 1,
2.540813, 0.9800894, 0.5543315, 1, 0, 0.03529412, 1,
2.564, -0.8871719, 2.52623, 1, 0, 0.03137255, 1,
2.740389, -3.055138, 1.743742, 1, 0, 0.02352941, 1,
2.829131, 0.5272551, 0.2294835, 1, 0, 0.01960784, 1,
2.851895, -0.7931178, 1.898739, 1, 0, 0.01176471, 1,
2.889097, -0.5432252, -0.6080304, 1, 0, 0.007843138, 1
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
0.1022483, -4.731034, -6.645266, 0, -0.5, 0.5, 0.5,
0.1022483, -4.731034, -6.645266, 1, -0.5, 0.5, 0.5,
0.1022483, -4.731034, -6.645266, 1, 1.5, 0.5, 0.5,
0.1022483, -4.731034, -6.645266, 0, 1.5, 0.5, 0.5
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
-3.629343, -0.05542243, -6.645266, 0, -0.5, 0.5, 0.5,
-3.629343, -0.05542243, -6.645266, 1, -0.5, 0.5, 0.5,
-3.629343, -0.05542243, -6.645266, 1, 1.5, 0.5, 0.5,
-3.629343, -0.05542243, -6.645266, 0, 1.5, 0.5, 0.5
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
-3.629343, -4.731034, 0.1151376, 0, -0.5, 0.5, 0.5,
-3.629343, -4.731034, 0.1151376, 1, -0.5, 0.5, 0.5,
-3.629343, -4.731034, 0.1151376, 1, 1.5, 0.5, 0.5,
-3.629343, -4.731034, 0.1151376, 0, 1.5, 0.5, 0.5
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
-2, -3.652047, -5.085173,
2, -3.652047, -5.085173,
-2, -3.652047, -5.085173,
-2, -3.831878, -5.345189,
-1, -3.652047, -5.085173,
-1, -3.831878, -5.345189,
0, -3.652047, -5.085173,
0, -3.831878, -5.345189,
1, -3.652047, -5.085173,
1, -3.831878, -5.345189,
2, -3.652047, -5.085173,
2, -3.831878, -5.345189
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
-2, -4.191541, -5.86522, 0, -0.5, 0.5, 0.5,
-2, -4.191541, -5.86522, 1, -0.5, 0.5, 0.5,
-2, -4.191541, -5.86522, 1, 1.5, 0.5, 0.5,
-2, -4.191541, -5.86522, 0, 1.5, 0.5, 0.5,
-1, -4.191541, -5.86522, 0, -0.5, 0.5, 0.5,
-1, -4.191541, -5.86522, 1, -0.5, 0.5, 0.5,
-1, -4.191541, -5.86522, 1, 1.5, 0.5, 0.5,
-1, -4.191541, -5.86522, 0, 1.5, 0.5, 0.5,
0, -4.191541, -5.86522, 0, -0.5, 0.5, 0.5,
0, -4.191541, -5.86522, 1, -0.5, 0.5, 0.5,
0, -4.191541, -5.86522, 1, 1.5, 0.5, 0.5,
0, -4.191541, -5.86522, 0, 1.5, 0.5, 0.5,
1, -4.191541, -5.86522, 0, -0.5, 0.5, 0.5,
1, -4.191541, -5.86522, 1, -0.5, 0.5, 0.5,
1, -4.191541, -5.86522, 1, 1.5, 0.5, 0.5,
1, -4.191541, -5.86522, 0, 1.5, 0.5, 0.5,
2, -4.191541, -5.86522, 0, -0.5, 0.5, 0.5,
2, -4.191541, -5.86522, 1, -0.5, 0.5, 0.5,
2, -4.191541, -5.86522, 1, 1.5, 0.5, 0.5,
2, -4.191541, -5.86522, 0, 1.5, 0.5, 0.5
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
-2.768206, -3, -5.085173,
-2.768206, 3, -5.085173,
-2.768206, -3, -5.085173,
-2.911729, -3, -5.345189,
-2.768206, -2, -5.085173,
-2.911729, -2, -5.345189,
-2.768206, -1, -5.085173,
-2.911729, -1, -5.345189,
-2.768206, 0, -5.085173,
-2.911729, 0, -5.345189,
-2.768206, 1, -5.085173,
-2.911729, 1, -5.345189,
-2.768206, 2, -5.085173,
-2.911729, 2, -5.345189,
-2.768206, 3, -5.085173,
-2.911729, 3, -5.345189
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
-3.198775, -3, -5.86522, 0, -0.5, 0.5, 0.5,
-3.198775, -3, -5.86522, 1, -0.5, 0.5, 0.5,
-3.198775, -3, -5.86522, 1, 1.5, 0.5, 0.5,
-3.198775, -3, -5.86522, 0, 1.5, 0.5, 0.5,
-3.198775, -2, -5.86522, 0, -0.5, 0.5, 0.5,
-3.198775, -2, -5.86522, 1, -0.5, 0.5, 0.5,
-3.198775, -2, -5.86522, 1, 1.5, 0.5, 0.5,
-3.198775, -2, -5.86522, 0, 1.5, 0.5, 0.5,
-3.198775, -1, -5.86522, 0, -0.5, 0.5, 0.5,
-3.198775, -1, -5.86522, 1, -0.5, 0.5, 0.5,
-3.198775, -1, -5.86522, 1, 1.5, 0.5, 0.5,
-3.198775, -1, -5.86522, 0, 1.5, 0.5, 0.5,
-3.198775, 0, -5.86522, 0, -0.5, 0.5, 0.5,
-3.198775, 0, -5.86522, 1, -0.5, 0.5, 0.5,
-3.198775, 0, -5.86522, 1, 1.5, 0.5, 0.5,
-3.198775, 0, -5.86522, 0, 1.5, 0.5, 0.5,
-3.198775, 1, -5.86522, 0, -0.5, 0.5, 0.5,
-3.198775, 1, -5.86522, 1, -0.5, 0.5, 0.5,
-3.198775, 1, -5.86522, 1, 1.5, 0.5, 0.5,
-3.198775, 1, -5.86522, 0, 1.5, 0.5, 0.5,
-3.198775, 2, -5.86522, 0, -0.5, 0.5, 0.5,
-3.198775, 2, -5.86522, 1, -0.5, 0.5, 0.5,
-3.198775, 2, -5.86522, 1, 1.5, 0.5, 0.5,
-3.198775, 2, -5.86522, 0, 1.5, 0.5, 0.5,
-3.198775, 3, -5.86522, 0, -0.5, 0.5, 0.5,
-3.198775, 3, -5.86522, 1, -0.5, 0.5, 0.5,
-3.198775, 3, -5.86522, 1, 1.5, 0.5, 0.5,
-3.198775, 3, -5.86522, 0, 1.5, 0.5, 0.5
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
-2.768206, -3.652047, -4,
-2.768206, -3.652047, 4,
-2.768206, -3.652047, -4,
-2.911729, -3.831878, -4,
-2.768206, -3.652047, -2,
-2.911729, -3.831878, -2,
-2.768206, -3.652047, 0,
-2.911729, -3.831878, 0,
-2.768206, -3.652047, 2,
-2.911729, -3.831878, 2,
-2.768206, -3.652047, 4,
-2.911729, -3.831878, 4
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
-3.198775, -4.191541, -4, 0, -0.5, 0.5, 0.5,
-3.198775, -4.191541, -4, 1, -0.5, 0.5, 0.5,
-3.198775, -4.191541, -4, 1, 1.5, 0.5, 0.5,
-3.198775, -4.191541, -4, 0, 1.5, 0.5, 0.5,
-3.198775, -4.191541, -2, 0, -0.5, 0.5, 0.5,
-3.198775, -4.191541, -2, 1, -0.5, 0.5, 0.5,
-3.198775, -4.191541, -2, 1, 1.5, 0.5, 0.5,
-3.198775, -4.191541, -2, 0, 1.5, 0.5, 0.5,
-3.198775, -4.191541, 0, 0, -0.5, 0.5, 0.5,
-3.198775, -4.191541, 0, 1, -0.5, 0.5, 0.5,
-3.198775, -4.191541, 0, 1, 1.5, 0.5, 0.5,
-3.198775, -4.191541, 0, 0, 1.5, 0.5, 0.5,
-3.198775, -4.191541, 2, 0, -0.5, 0.5, 0.5,
-3.198775, -4.191541, 2, 1, -0.5, 0.5, 0.5,
-3.198775, -4.191541, 2, 1, 1.5, 0.5, 0.5,
-3.198775, -4.191541, 2, 0, 1.5, 0.5, 0.5,
-3.198775, -4.191541, 4, 0, -0.5, 0.5, 0.5,
-3.198775, -4.191541, 4, 1, -0.5, 0.5, 0.5,
-3.198775, -4.191541, 4, 1, 1.5, 0.5, 0.5,
-3.198775, -4.191541, 4, 0, 1.5, 0.5, 0.5
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
-2.768206, -3.652047, -5.085173,
-2.768206, 3.541202, -5.085173,
-2.768206, -3.652047, 5.315448,
-2.768206, 3.541202, 5.315448,
-2.768206, -3.652047, -5.085173,
-2.768206, -3.652047, 5.315448,
-2.768206, 3.541202, -5.085173,
-2.768206, 3.541202, 5.315448,
-2.768206, -3.652047, -5.085173,
2.972703, -3.652047, -5.085173,
-2.768206, -3.652047, 5.315448,
2.972703, -3.652047, 5.315448,
-2.768206, 3.541202, -5.085173,
2.972703, 3.541202, -5.085173,
-2.768206, 3.541202, 5.315448,
2.972703, 3.541202, 5.315448,
2.972703, -3.652047, -5.085173,
2.972703, 3.541202, -5.085173,
2.972703, -3.652047, 5.315448,
2.972703, 3.541202, 5.315448,
2.972703, -3.652047, -5.085173,
2.972703, -3.652047, 5.315448,
2.972703, 3.541202, -5.085173,
2.972703, 3.541202, 5.315448
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
var radius = 7.415869;
var distance = 32.99404;
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
mvMatrix.translate( -0.1022483, 0.05542243, -0.1151376 );
mvMatrix.scale( 1.396675, 1.114682, 0.7709331 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.99404);
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
propaphos<-read.table("propaphos.xyz")
```

```
## Error in read.table("propaphos.xyz"): no lines available in input
```

```r
x<-propaphos$V2
```

```
## Error in eval(expr, envir, enclos): object 'propaphos' not found
```

```r
y<-propaphos$V3
```

```
## Error in eval(expr, envir, enclos): object 'propaphos' not found
```

```r
z<-propaphos$V4
```

```
## Error in eval(expr, envir, enclos): object 'propaphos' not found
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
-2.684601, -0.0064665, -0.271262, 0, 0, 1, 1, 1,
-2.671518, -2.966693, -3.130933, 1, 0, 0, 1, 1,
-2.624124, 1.290409, -2.836644, 1, 0, 0, 1, 1,
-2.616839, -1.118259, -1.3004, 1, 0, 0, 1, 1,
-2.515902, 0.1742629, -2.062727, 1, 0, 0, 1, 1,
-2.490433, 1.58895, 0.1867369, 1, 0, 0, 1, 1,
-2.448805, 0.3294431, 1.003787, 0, 0, 0, 1, 1,
-2.342673, -0.1778699, -2.157259, 0, 0, 0, 1, 1,
-2.341844, -0.7540016, -0.9287768, 0, 0, 0, 1, 1,
-2.334198, -1.271577, -1.062804, 0, 0, 0, 1, 1,
-2.264741, -1.760375, -2.73494, 0, 0, 0, 1, 1,
-2.172738, -0.01094482, -2.239105, 0, 0, 0, 1, 1,
-2.141086, -0.5668094, -1.952054, 0, 0, 0, 1, 1,
-2.083831, -0.3002515, -0.3955796, 1, 1, 1, 1, 1,
-2.067821, -0.8443457, -3.106406, 1, 1, 1, 1, 1,
-1.993994, -0.1751011, -1.838184, 1, 1, 1, 1, 1,
-1.990197, 1.122903, 1.341827, 1, 1, 1, 1, 1,
-1.980909, 0.3024815, -2.711417, 1, 1, 1, 1, 1,
-1.9692, 0.512821, -1.294987, 1, 1, 1, 1, 1,
-1.965577, 0.8157646, -2.20555, 1, 1, 1, 1, 1,
-1.964313, 0.7771987, -0.07959834, 1, 1, 1, 1, 1,
-1.939697, 0.2533301, -1.171447, 1, 1, 1, 1, 1,
-1.909087, -0.5220953, -0.2918487, 1, 1, 1, 1, 1,
-1.874174, 0.2198627, 0.1282168, 1, 1, 1, 1, 1,
-1.859802, -0.7466207, -1.09972, 1, 1, 1, 1, 1,
-1.850762, 0.5824037, -1.022106, 1, 1, 1, 1, 1,
-1.840762, -1.219216, -1.772074, 1, 1, 1, 1, 1,
-1.839029, -0.8877746, -2.965885, 1, 1, 1, 1, 1,
-1.829126, 0.2952963, -1.353259, 0, 0, 1, 1, 1,
-1.827347, -1.134843, -2.156266, 1, 0, 0, 1, 1,
-1.821068, 0.3316148, -1.208492, 1, 0, 0, 1, 1,
-1.800667, 0.5721401, -1.338971, 1, 0, 0, 1, 1,
-1.771951, 1.585453, -1.161118, 1, 0, 0, 1, 1,
-1.749517, 1.179665, -1.647038, 1, 0, 0, 1, 1,
-1.735222, -0.7574773, -0.8146626, 0, 0, 0, 1, 1,
-1.72517, -0.7383918, -3.686308, 0, 0, 0, 1, 1,
-1.694677, 0.4392072, -1.348855, 0, 0, 0, 1, 1,
-1.673935, -2.084296, -2.1094, 0, 0, 0, 1, 1,
-1.665664, -1.155381, -2.100946, 0, 0, 0, 1, 1,
-1.66453, -0.04878458, -2.077668, 0, 0, 0, 1, 1,
-1.658229, 0.1335157, -2.825527, 0, 0, 0, 1, 1,
-1.633611, 0.8780789, -1.040887, 1, 1, 1, 1, 1,
-1.618833, -0.5945939, -1.567588, 1, 1, 1, 1, 1,
-1.618626, 0.07191524, -1.930686, 1, 1, 1, 1, 1,
-1.599348, 1.111146, -0.9905178, 1, 1, 1, 1, 1,
-1.589921, 2.1601, -1.112072, 1, 1, 1, 1, 1,
-1.589086, 0.3788029, -2.473086, 1, 1, 1, 1, 1,
-1.585462, -0.344725, -1.511304, 1, 1, 1, 1, 1,
-1.569784, -0.5729447, -3.004202, 1, 1, 1, 1, 1,
-1.555034, -0.6900141, -1.394787, 1, 1, 1, 1, 1,
-1.55455, 0.2040619, -2.097142, 1, 1, 1, 1, 1,
-1.545343, 0.6135051, -1.621064, 1, 1, 1, 1, 1,
-1.543541, -1.044527, -1.808328, 1, 1, 1, 1, 1,
-1.534233, -1.084103, -2.128182, 1, 1, 1, 1, 1,
-1.523456, -0.9568122, -2.864707, 1, 1, 1, 1, 1,
-1.503257, -2.416022, -2.007761, 1, 1, 1, 1, 1,
-1.490292, 0.5520727, -0.9198543, 0, 0, 1, 1, 1,
-1.483627, -0.09451469, -3.139787, 1, 0, 0, 1, 1,
-1.479482, -0.6729437, -0.3987796, 1, 0, 0, 1, 1,
-1.475795, -0.7185998, -2.782746, 1, 0, 0, 1, 1,
-1.465778, -0.1303833, -1.718802, 1, 0, 0, 1, 1,
-1.461002, 0.0162261, -0.967777, 1, 0, 0, 1, 1,
-1.459603, -0.54063, -2.068692, 0, 0, 0, 1, 1,
-1.457166, 0.3138419, -0.7840064, 0, 0, 0, 1, 1,
-1.44956, -0.1327379, -0.7671394, 0, 0, 0, 1, 1,
-1.432823, -0.2469208, -3.525039, 0, 0, 0, 1, 1,
-1.425094, 0.1148396, -3.74865, 0, 0, 0, 1, 1,
-1.420358, -1.105718, -0.9371721, 0, 0, 0, 1, 1,
-1.412032, 1.586465, 1.110786, 0, 0, 0, 1, 1,
-1.410169, 0.5895484, 0.2408843, 1, 1, 1, 1, 1,
-1.40904, 0.1827505, -2.279622, 1, 1, 1, 1, 1,
-1.405123, 0.1347284, -2.32618, 1, 1, 1, 1, 1,
-1.39045, 0.2186291, -2.186444, 1, 1, 1, 1, 1,
-1.389457, -1.78104, -3.079218, 1, 1, 1, 1, 1,
-1.381267, -1.014277, -2.466211, 1, 1, 1, 1, 1,
-1.379715, -0.06595386, -1.45584, 1, 1, 1, 1, 1,
-1.375626, 2.181997, -1.51237, 1, 1, 1, 1, 1,
-1.368737, -0.3851936, -2.167737, 1, 1, 1, 1, 1,
-1.364866, 0.8010782, -0.8576115, 1, 1, 1, 1, 1,
-1.363812, -1.440024, -1.759417, 1, 1, 1, 1, 1,
-1.361385, 0.74554, 0.09631375, 1, 1, 1, 1, 1,
-1.338841, 0.7659006, -2.375516, 1, 1, 1, 1, 1,
-1.32771, 0.08516137, -1.896142, 1, 1, 1, 1, 1,
-1.317661, -0.9599237, 0.5926161, 1, 1, 1, 1, 1,
-1.31306, 1.186023, -1.773623, 0, 0, 1, 1, 1,
-1.29982, 0.9468229, -1.751341, 1, 0, 0, 1, 1,
-1.285795, 1.293266, -0.5851725, 1, 0, 0, 1, 1,
-1.280297, 0.6254313, -2.324238, 1, 0, 0, 1, 1,
-1.272211, -0.430557, -1.353696, 1, 0, 0, 1, 1,
-1.264597, 0.7438264, -0.9682786, 1, 0, 0, 1, 1,
-1.264201, 0.7081149, -2.043453, 0, 0, 0, 1, 1,
-1.245391, 0.1960675, -2.87604, 0, 0, 0, 1, 1,
-1.237634, -0.2724119, -0.662798, 0, 0, 0, 1, 1,
-1.236597, 0.1149465, 0.4009765, 0, 0, 0, 1, 1,
-1.221146, -0.2296832, -0.6292089, 0, 0, 0, 1, 1,
-1.219964, -0.3398769, -2.204264, 0, 0, 0, 1, 1,
-1.212967, -0.01098563, -1.721354, 0, 0, 0, 1, 1,
-1.212708, 1.818694, -0.6582577, 1, 1, 1, 1, 1,
-1.212428, -0.3094278, -2.267921, 1, 1, 1, 1, 1,
-1.209086, -0.009793353, -0.5331424, 1, 1, 1, 1, 1,
-1.207608, 1.79682, -1.887531, 1, 1, 1, 1, 1,
-1.203717, -0.3009678, -1.221188, 1, 1, 1, 1, 1,
-1.202198, 1.512528, -0.6273404, 1, 1, 1, 1, 1,
-1.190171, -2.46938, -3.534454, 1, 1, 1, 1, 1,
-1.188242, -3.161448, -2.827256, 1, 1, 1, 1, 1,
-1.188065, 0.8016064, -2.090962, 1, 1, 1, 1, 1,
-1.182773, -1.398835, -2.128356, 1, 1, 1, 1, 1,
-1.180277, -0.1064312, -0.2221174, 1, 1, 1, 1, 1,
-1.152841, 0.5748885, -1.649472, 1, 1, 1, 1, 1,
-1.14977, -0.303715, -1.447363, 1, 1, 1, 1, 1,
-1.142368, -0.2313361, -3.751187, 1, 1, 1, 1, 1,
-1.138471, -0.2412013, -3.180634, 1, 1, 1, 1, 1,
-1.133521, 0.983374, -2.319032, 0, 0, 1, 1, 1,
-1.127514, -1.063056, -3.664746, 1, 0, 0, 1, 1,
-1.123957, 0.9080511, 0.03680445, 1, 0, 0, 1, 1,
-1.121637, -0.6339096, -1.492405, 1, 0, 0, 1, 1,
-1.119896, -0.3825147, -1.5672, 1, 0, 0, 1, 1,
-1.118995, -1.549825, -2.838914, 1, 0, 0, 1, 1,
-1.103336, 0.1487057, 0.2137506, 0, 0, 0, 1, 1,
-1.101611, 0.5478964, -0.9962358, 0, 0, 0, 1, 1,
-1.089928, 1.034136, -1.478894, 0, 0, 0, 1, 1,
-1.087138, 1.342521, -0.4718595, 0, 0, 0, 1, 1,
-1.084948, 0.2241438, -1.524523, 0, 0, 0, 1, 1,
-1.084085, -0.3000503, -3.550688, 0, 0, 0, 1, 1,
-1.081301, 0.2509932, -2.217815, 0, 0, 0, 1, 1,
-1.081121, -0.2396984, -0.02706484, 1, 1, 1, 1, 1,
-1.079401, 0.7749451, 0.0711605, 1, 1, 1, 1, 1,
-1.079136, 2.701468, 0.7059739, 1, 1, 1, 1, 1,
-1.078486, 0.7367055, -1.271016, 1, 1, 1, 1, 1,
-1.078418, 1.102352, -1.589019, 1, 1, 1, 1, 1,
-1.072646, 1.465764, -1.162776, 1, 1, 1, 1, 1,
-1.071017, -1.995065, -2.873218, 1, 1, 1, 1, 1,
-1.069582, -1.493113, -1.299706, 1, 1, 1, 1, 1,
-1.067255, -0.2677769, -1.898242, 1, 1, 1, 1, 1,
-1.065695, -1.030613, -1.295513, 1, 1, 1, 1, 1,
-1.041122, 0.524528, 0.5603918, 1, 1, 1, 1, 1,
-1.040546, 1.224619, -0.9618216, 1, 1, 1, 1, 1,
-1.037496, 0.364837, -0.2690079, 1, 1, 1, 1, 1,
-1.037455, 0.5292869, -2.300279, 1, 1, 1, 1, 1,
-1.035947, -0.4564576, -3.799166, 1, 1, 1, 1, 1,
-1.032422, -0.8658293, -1.553926, 0, 0, 1, 1, 1,
-1.006216, 1.205348, -0.3574072, 1, 0, 0, 1, 1,
-1.001117, 1.326439, 0.4917932, 1, 0, 0, 1, 1,
-0.9936715, 0.7129685, -0.937064, 1, 0, 0, 1, 1,
-0.993273, 0.7587187, -0.4408725, 1, 0, 0, 1, 1,
-0.9925969, -0.9174536, -2.40453, 1, 0, 0, 1, 1,
-0.9851071, 1.723285, -1.350169, 0, 0, 0, 1, 1,
-0.9771883, 0.8785067, 0.5656842, 0, 0, 0, 1, 1,
-0.9771288, -0.1107525, -1.127694, 0, 0, 0, 1, 1,
-0.9637257, -1.17866, -3.028584, 0, 0, 0, 1, 1,
-0.9575615, -0.3018823, -3.340156, 0, 0, 0, 1, 1,
-0.9508881, -0.2892852, -0.5300147, 0, 0, 0, 1, 1,
-0.9397053, 1.567956, 0.05851636, 0, 0, 0, 1, 1,
-0.9396099, 0.3033794, -0.7896007, 1, 1, 1, 1, 1,
-0.9374322, 0.4311922, -0.8267363, 1, 1, 1, 1, 1,
-0.93111, -0.5781378, -4.292309, 1, 1, 1, 1, 1,
-0.91658, -1.322192, -2.937335, 1, 1, 1, 1, 1,
-0.9146582, -0.7782859, -1.684246, 1, 1, 1, 1, 1,
-0.9145163, 1.119562, -0.3490522, 1, 1, 1, 1, 1,
-0.9099173, 0.1406231, -1.581563, 1, 1, 1, 1, 1,
-0.9085274, 1.499102, -0.5685946, 1, 1, 1, 1, 1,
-0.903689, 1.070871, 0.06138147, 1, 1, 1, 1, 1,
-0.9029368, -1.005256, -1.974664, 1, 1, 1, 1, 1,
-0.9026949, -0.368179, -0.8691097, 1, 1, 1, 1, 1,
-0.9014526, 0.817039, -0.4535982, 1, 1, 1, 1, 1,
-0.9009641, 1.223593, -2.011966, 1, 1, 1, 1, 1,
-0.8989753, -1.92859, -0.9418716, 1, 1, 1, 1, 1,
-0.8930986, -1.023013, -0.5182707, 1, 1, 1, 1, 1,
-0.890592, -0.3437521, -2.219221, 0, 0, 1, 1, 1,
-0.8867829, -0.03113574, -2.515674, 1, 0, 0, 1, 1,
-0.8862309, -0.5973651, -1.125708, 1, 0, 0, 1, 1,
-0.8853191, -0.573816, -1.306055, 1, 0, 0, 1, 1,
-0.8816426, 1.009927, -0.2246168, 1, 0, 0, 1, 1,
-0.8752776, -0.6731229, -3.281664, 1, 0, 0, 1, 1,
-0.8750025, 0.927506, -0.0002384535, 0, 0, 0, 1, 1,
-0.8740715, -1.282724, -2.667355, 0, 0, 0, 1, 1,
-0.8656058, 1.287542, 0.960422, 0, 0, 0, 1, 1,
-0.8612085, 0.6874572, -1.076643, 0, 0, 0, 1, 1,
-0.8595948, -0.4716539, -2.560475, 0, 0, 0, 1, 1,
-0.8576406, 2.019079, 0.2673447, 0, 0, 0, 1, 1,
-0.8547611, -1.682056, -2.032103, 0, 0, 0, 1, 1,
-0.850701, 0.1588245, -0.5159397, 1, 1, 1, 1, 1,
-0.8473798, 0.1557227, -1.255204, 1, 1, 1, 1, 1,
-0.8467432, -0.08661208, -1.004523, 1, 1, 1, 1, 1,
-0.8450816, 1.048248, -0.7509939, 1, 1, 1, 1, 1,
-0.8404926, 0.2628351, -0.6796605, 1, 1, 1, 1, 1,
-0.8221674, -0.531517, -4.059091, 1, 1, 1, 1, 1,
-0.8196688, 0.9020812, 0.2044103, 1, 1, 1, 1, 1,
-0.8139341, -1.671402, -1.375533, 1, 1, 1, 1, 1,
-0.8138724, 1.933607, -1.166112, 1, 1, 1, 1, 1,
-0.8122568, -0.470412, -3.628584, 1, 1, 1, 1, 1,
-0.8113203, 0.5630553, -1.69857, 1, 1, 1, 1, 1,
-0.8090354, 0.06646984, -1.679906, 1, 1, 1, 1, 1,
-0.804337, 0.04845069, -2.430614, 1, 1, 1, 1, 1,
-0.7972016, 0.6054399, -1.200361, 1, 1, 1, 1, 1,
-0.7953469, -0.5120943, -2.363816, 1, 1, 1, 1, 1,
-0.7933642, 0.4358504, 0.2457644, 0, 0, 1, 1, 1,
-0.7875065, -2.346922, -2.866299, 1, 0, 0, 1, 1,
-0.7826762, -0.6008151, -2.256044, 1, 0, 0, 1, 1,
-0.779218, 0.3555542, -0.307628, 1, 0, 0, 1, 1,
-0.7740017, 0.09060603, 0.6707478, 1, 0, 0, 1, 1,
-0.7720916, -0.1464228, -3.363283, 1, 0, 0, 1, 1,
-0.7593179, 0.8678753, -1.224477, 0, 0, 0, 1, 1,
-0.7552221, 1.388987, -0.6982759, 0, 0, 0, 1, 1,
-0.7529761, 0.3375619, -1.207603, 0, 0, 0, 1, 1,
-0.7520798, 2.222509, -0.2365491, 0, 0, 0, 1, 1,
-0.7484837, -0.5233446, -1.09567, 0, 0, 0, 1, 1,
-0.7306902, -1.648099, -2.938413, 0, 0, 0, 1, 1,
-0.726023, -0.3911771, -1.601517, 0, 0, 0, 1, 1,
-0.7253208, 1.18206, 0.3202512, 1, 1, 1, 1, 1,
-0.7235982, 0.4382031, -1.841283, 1, 1, 1, 1, 1,
-0.7221754, -0.8967022, -2.058207, 1, 1, 1, 1, 1,
-0.7205043, -1.595074, -3.254015, 1, 1, 1, 1, 1,
-0.7186981, 0.1287278, -1.247242, 1, 1, 1, 1, 1,
-0.7182154, 1.198481, -0.8831217, 1, 1, 1, 1, 1,
-0.7071294, -1.461042, -2.83651, 1, 1, 1, 1, 1,
-0.7062804, 1.53334, -1.144844, 1, 1, 1, 1, 1,
-0.703443, -0.5035104, -2.544424, 1, 1, 1, 1, 1,
-0.7026075, -0.7273211, -2.299223, 1, 1, 1, 1, 1,
-0.7015771, 0.4070037, -1.808221, 1, 1, 1, 1, 1,
-0.6960263, -0.1262545, -0.7523028, 1, 1, 1, 1, 1,
-0.6945686, -0.8060092, -1.632154, 1, 1, 1, 1, 1,
-0.6942654, 1.069418, -1.233967, 1, 1, 1, 1, 1,
-0.6933209, -0.4132459, -0.7792923, 1, 1, 1, 1, 1,
-0.6905758, 0.1342916, -1.180796, 0, 0, 1, 1, 1,
-0.6846803, 2.59963, -0.2309512, 1, 0, 0, 1, 1,
-0.6837586, -0.9386643, -2.471811, 1, 0, 0, 1, 1,
-0.6815362, -0.9715781, -3.361389, 1, 0, 0, 1, 1,
-0.6757455, -1.624767, -2.263693, 1, 0, 0, 1, 1,
-0.6732483, 0.03048422, -0.1544304, 1, 0, 0, 1, 1,
-0.6701065, 0.0938913, -1.079963, 0, 0, 0, 1, 1,
-0.6671612, 1.195155, -0.7208185, 0, 0, 0, 1, 1,
-0.6624686, -0.9289749, -3.314639, 0, 0, 0, 1, 1,
-0.6611369, 0.285749, -2.086159, 0, 0, 0, 1, 1,
-0.6548781, 0.1167784, -2.0573, 0, 0, 0, 1, 1,
-0.6486626, -0.4994642, -2.519345, 0, 0, 0, 1, 1,
-0.6476915, 0.5176834, -1.388695, 0, 0, 0, 1, 1,
-0.6467508, -0.9387049, -3.613889, 1, 1, 1, 1, 1,
-0.6467196, -1.175804, -4.560365, 1, 1, 1, 1, 1,
-0.645942, 0.267949, 0.03812955, 1, 1, 1, 1, 1,
-0.6451882, 2.1541, 0.8574582, 1, 1, 1, 1, 1,
-0.6448151, 0.3305889, -1.371935, 1, 1, 1, 1, 1,
-0.640802, 0.6556603, -0.4173225, 1, 1, 1, 1, 1,
-0.6398264, 0.9774024, -2.005119, 1, 1, 1, 1, 1,
-0.6353916, 0.2537749, -0.1335969, 1, 1, 1, 1, 1,
-0.6343708, 0.4175939, -0.4372692, 1, 1, 1, 1, 1,
-0.6315353, 1.708402, -0.9027401, 1, 1, 1, 1, 1,
-0.6269041, 1.171968, -1.611651, 1, 1, 1, 1, 1,
-0.6255797, 0.7868921, -2.536119, 1, 1, 1, 1, 1,
-0.6212161, 2.829062, -1.489772, 1, 1, 1, 1, 1,
-0.6134662, 0.2821414, -1.706688, 1, 1, 1, 1, 1,
-0.610984, 1.157174, -0.9465708, 1, 1, 1, 1, 1,
-0.6064739, 1.506242, -0.7351184, 0, 0, 1, 1, 1,
-0.6039085, 0.0656548, 0.2563775, 1, 0, 0, 1, 1,
-0.6035038, -1.239312, -3.627759, 1, 0, 0, 1, 1,
-0.5885215, 0.2334957, -2.139911, 1, 0, 0, 1, 1,
-0.5826473, -1.481347, -2.693032, 1, 0, 0, 1, 1,
-0.5793415, 0.4089102, -0.5936964, 1, 0, 0, 1, 1,
-0.5765308, -0.7938238, -2.082882, 0, 0, 0, 1, 1,
-0.5731193, 0.4958369, -0.6848203, 0, 0, 0, 1, 1,
-0.5700633, 0.1674597, -1.324528, 0, 0, 0, 1, 1,
-0.5680841, -1.601467, -4.121046, 0, 0, 0, 1, 1,
-0.5629113, -1.151724, -2.647925, 0, 0, 0, 1, 1,
-0.5493278, -0.9781853, -2.546635, 0, 0, 0, 1, 1,
-0.5483427, -0.2521029, -2.856905, 0, 0, 0, 1, 1,
-0.5463156, 1.346555, -0.06170961, 1, 1, 1, 1, 1,
-0.5450848, 1.062096, 0.9677062, 1, 1, 1, 1, 1,
-0.5438562, 0.9778807, 1.164875, 1, 1, 1, 1, 1,
-0.5419844, -0.007805702, -3.274268, 1, 1, 1, 1, 1,
-0.5380072, -0.2635049, -0.3353656, 1, 1, 1, 1, 1,
-0.5345092, -1.388523, -2.394727, 1, 1, 1, 1, 1,
-0.5266685, -0.6977894, -2.614852, 1, 1, 1, 1, 1,
-0.5258862, -1.823218, -2.844929, 1, 1, 1, 1, 1,
-0.5244147, 0.191175, -0.7875245, 1, 1, 1, 1, 1,
-0.5236194, -0.5007494, -1.353115, 1, 1, 1, 1, 1,
-0.519904, -0.3846819, -4.933708, 1, 1, 1, 1, 1,
-0.5181383, -1.765258, -3.095658, 1, 1, 1, 1, 1,
-0.5085238, 0.4042573, -0.8566478, 1, 1, 1, 1, 1,
-0.5044324, 1.111253, 0.530579, 1, 1, 1, 1, 1,
-0.5038803, -0.9757961, -1.590873, 1, 1, 1, 1, 1,
-0.5036324, -0.5041609, -2.202692, 0, 0, 1, 1, 1,
-0.5027754, -1.334297, -3.458375, 1, 0, 0, 1, 1,
-0.4998133, -0.8841897, -3.572071, 1, 0, 0, 1, 1,
-0.4992634, -0.9766201, -1.378732, 1, 0, 0, 1, 1,
-0.4946717, -1.196037, -3.029321, 1, 0, 0, 1, 1,
-0.4942269, 1.725418, -1.21502, 1, 0, 0, 1, 1,
-0.4908836, -0.4115894, -2.822411, 0, 0, 0, 1, 1,
-0.4806825, -0.8424327, -2.894398, 0, 0, 0, 1, 1,
-0.4781266, -1.69088, -2.424589, 0, 0, 0, 1, 1,
-0.4766612, 0.7086983, -0.9825622, 0, 0, 0, 1, 1,
-0.4750537, 0.2304518, -0.4505418, 0, 0, 0, 1, 1,
-0.4735917, -0.2982625, -1.918032, 0, 0, 0, 1, 1,
-0.4716788, 0.06721672, -3.139749, 0, 0, 0, 1, 1,
-0.4706123, -1.140577, -4.316809, 1, 1, 1, 1, 1,
-0.4705595, 0.9614694, -0.5004863, 1, 1, 1, 1, 1,
-0.4679562, -0.356418, -1.550108, 1, 1, 1, 1, 1,
-0.4668344, 1.559395, -0.3981292, 1, 1, 1, 1, 1,
-0.4661185, 0.4002769, -1.141638, 1, 1, 1, 1, 1,
-0.4578288, 1.587474, 1.074235, 1, 1, 1, 1, 1,
-0.4527415, -1.264187, -2.898398, 1, 1, 1, 1, 1,
-0.4489726, 0.7784475, 0.7055638, 1, 1, 1, 1, 1,
-0.4478051, -0.1191972, -0.1301041, 1, 1, 1, 1, 1,
-0.4422278, 0.2946681, -2.990789, 1, 1, 1, 1, 1,
-0.4356274, 0.4165569, 0.04211496, 1, 1, 1, 1, 1,
-0.4352536, -0.5127613, -2.559898, 1, 1, 1, 1, 1,
-0.4330761, -0.06681948, -1.391428, 1, 1, 1, 1, 1,
-0.427851, -0.3570476, -0.9798357, 1, 1, 1, 1, 1,
-0.4254231, 0.3618838, -0.4680122, 1, 1, 1, 1, 1,
-0.4243311, -0.6690592, -3.180812, 0, 0, 1, 1, 1,
-0.4203924, -0.7406557, -1.928053, 1, 0, 0, 1, 1,
-0.4199491, 0.3019115, -0.3748485, 1, 0, 0, 1, 1,
-0.4173713, -0.9678721, -2.293946, 1, 0, 0, 1, 1,
-0.4172912, -1.219852, -2.772861, 1, 0, 0, 1, 1,
-0.4124298, 0.9209699, -1.783973, 1, 0, 0, 1, 1,
-0.4107455, -1.88848, -3.719297, 0, 0, 0, 1, 1,
-0.4085774, 0.07755926, -1.498398, 0, 0, 0, 1, 1,
-0.4045686, -0.1313307, -1.229175, 0, 0, 0, 1, 1,
-0.3945308, -0.6766396, 0.0423099, 0, 0, 0, 1, 1,
-0.3899063, 0.08753222, -1.276506, 0, 0, 0, 1, 1,
-0.389258, -1.126656, -2.345311, 0, 0, 0, 1, 1,
-0.3873536, -1.282908, -3.422478, 0, 0, 0, 1, 1,
-0.3864205, -1.084539, -3.289319, 1, 1, 1, 1, 1,
-0.3859051, -0.4885376, -0.02779718, 1, 1, 1, 1, 1,
-0.385098, -0.9964828, -2.238948, 1, 1, 1, 1, 1,
-0.3812578, 1.641186, 0.005570721, 1, 1, 1, 1, 1,
-0.379945, -0.7997342, -2.400244, 1, 1, 1, 1, 1,
-0.3768694, -0.02703553, -1.597868, 1, 1, 1, 1, 1,
-0.3760295, -1.354668, -3.953617, 1, 1, 1, 1, 1,
-0.3712676, 0.8796911, -0.5566558, 1, 1, 1, 1, 1,
-0.3682551, 2.283703, -1.106791, 1, 1, 1, 1, 1,
-0.3641852, 1.600249, -0.3673117, 1, 1, 1, 1, 1,
-0.3640676, 1.68574, 0.7553905, 1, 1, 1, 1, 1,
-0.3526669, 0.1827961, -1.334055, 1, 1, 1, 1, 1,
-0.3482, 0.5674649, -1.018764, 1, 1, 1, 1, 1,
-0.346648, -0.3440968, -2.578994, 1, 1, 1, 1, 1,
-0.3464185, 1.039142, -0.2463638, 1, 1, 1, 1, 1,
-0.3429337, 2.000257, -0.02437531, 0, 0, 1, 1, 1,
-0.3421113, -0.6490539, -4.248148, 1, 0, 0, 1, 1,
-0.3399377, -1.456094, -2.171883, 1, 0, 0, 1, 1,
-0.3353288, 0.9266934, -1.037345, 1, 0, 0, 1, 1,
-0.3326437, 0.2708639, -0.7269408, 1, 0, 0, 1, 1,
-0.3314807, 0.02249173, -0.5755422, 1, 0, 0, 1, 1,
-0.3304717, 0.3855027, -0.5962024, 0, 0, 0, 1, 1,
-0.3298313, 1.237682, 0.8697304, 0, 0, 0, 1, 1,
-0.3272527, 0.2394282, -1.403352, 0, 0, 0, 1, 1,
-0.3237218, 2.285462, -0.2938241, 0, 0, 0, 1, 1,
-0.3223098, -0.05763006, -1.615709, 0, 0, 0, 1, 1,
-0.3209835, -0.01651125, -2.504733, 0, 0, 0, 1, 1,
-0.3202983, 0.8500579, -1.940697, 0, 0, 0, 1, 1,
-0.3199786, 1.01517, -0.8060793, 1, 1, 1, 1, 1,
-0.3066446, 1.100129, -0.4697577, 1, 1, 1, 1, 1,
-0.3062641, 0.6110578, -1.495496, 1, 1, 1, 1, 1,
-0.3048063, 0.2324253, -1.694772, 1, 1, 1, 1, 1,
-0.3031691, 0.1479464, -2.676583, 1, 1, 1, 1, 1,
-0.2948641, -1.86756, -3.857358, 1, 1, 1, 1, 1,
-0.2944771, -0.4991717, -1.585501, 1, 1, 1, 1, 1,
-0.2912114, 0.3613228, -0.9937177, 1, 1, 1, 1, 1,
-0.2852635, 1.248206, -1.694977, 1, 1, 1, 1, 1,
-0.2833643, 0.8379728, -0.2142409, 1, 1, 1, 1, 1,
-0.2825825, 0.4004217, -1.20964, 1, 1, 1, 1, 1,
-0.2815033, -0.2104011, -2.320392, 1, 1, 1, 1, 1,
-0.278675, -0.1459701, -3.437037, 1, 1, 1, 1, 1,
-0.2780096, 1.07793, -0.05668713, 1, 1, 1, 1, 1,
-0.2734704, 0.2197128, -1.098516, 1, 1, 1, 1, 1,
-0.2727, 0.7817822, -0.9540695, 0, 0, 1, 1, 1,
-0.2712501, -0.7441661, -3.224342, 1, 0, 0, 1, 1,
-0.2684844, 0.06001266, -2.398437, 1, 0, 0, 1, 1,
-0.2632698, 0.1778087, 0.01572987, 1, 0, 0, 1, 1,
-0.262419, -0.6019049, -1.813308, 1, 0, 0, 1, 1,
-0.2618012, 1.327023, -0.4500206, 1, 0, 0, 1, 1,
-0.2608132, -0.1103698, -0.7564831, 0, 0, 0, 1, 1,
-0.2601435, -0.1729799, -2.574314, 0, 0, 0, 1, 1,
-0.2595028, 0.9481891, -2.597017, 0, 0, 0, 1, 1,
-0.2556687, -1.385489, -1.779618, 0, 0, 0, 1, 1,
-0.2531926, -0.7110527, -2.447751, 0, 0, 0, 1, 1,
-0.2526185, 2.410009, 1.099937, 0, 0, 0, 1, 1,
-0.2470447, -0.7440429, -2.664691, 0, 0, 0, 1, 1,
-0.24598, 0.1941943, 1.839247, 1, 1, 1, 1, 1,
-0.2437813, 2.277748, -0.5490382, 1, 1, 1, 1, 1,
-0.2431587, -0.9139786, -4.121678, 1, 1, 1, 1, 1,
-0.2354177, 2.174678, 0.1050834, 1, 1, 1, 1, 1,
-0.2304998, -0.3941317, -2.475017, 1, 1, 1, 1, 1,
-0.2285829, 0.7504368, 0.064647, 1, 1, 1, 1, 1,
-0.2274961, -0.1350086, -3.491785, 1, 1, 1, 1, 1,
-0.2221993, 0.7316906, -0.4057038, 1, 1, 1, 1, 1,
-0.2161355, -0.5630695, -1.189113, 1, 1, 1, 1, 1,
-0.2160145, -0.7552549, -3.617477, 1, 1, 1, 1, 1,
-0.2103711, 0.6053841, -0.5770849, 1, 1, 1, 1, 1,
-0.2097306, -0.7178991, -1.796346, 1, 1, 1, 1, 1,
-0.2064439, -0.5879505, -2.36446, 1, 1, 1, 1, 1,
-0.2040154, 0.1319038, -0.9067007, 1, 1, 1, 1, 1,
-0.20361, -0.9418036, -2.918433, 1, 1, 1, 1, 1,
-0.2009107, 0.2360996, -0.1092493, 0, 0, 1, 1, 1,
-0.1958274, -1.322577, -2.340496, 1, 0, 0, 1, 1,
-0.195547, 0.5128084, 0.7556523, 1, 0, 0, 1, 1,
-0.1936135, 0.3440766, 0.3078104, 1, 0, 0, 1, 1,
-0.1934957, -1.039853, -3.524146, 1, 0, 0, 1, 1,
-0.1922667, 0.4252594, -0.7900841, 1, 0, 0, 1, 1,
-0.190652, 2.328214, 0.8945358, 0, 0, 0, 1, 1,
-0.1884964, 0.3965646, -0.6187708, 0, 0, 0, 1, 1,
-0.1869907, -0.3424715, -0.6078569, 0, 0, 0, 1, 1,
-0.1772402, -1.244576, -4.568466, 0, 0, 0, 1, 1,
-0.1755795, -1.009045, -4.144324, 0, 0, 0, 1, 1,
-0.174365, -0.3878787, -3.026428, 0, 0, 0, 1, 1,
-0.1723818, -0.7132416, -2.460806, 0, 0, 0, 1, 1,
-0.1708002, 1.055287, -1.86547, 1, 1, 1, 1, 1,
-0.1677101, 0.4407997, -0.7268571, 1, 1, 1, 1, 1,
-0.1622658, 0.3181576, -1.234658, 1, 1, 1, 1, 1,
-0.1584875, 0.1591278, -1.976286, 1, 1, 1, 1, 1,
-0.1500845, -1.050275, -1.909738, 1, 1, 1, 1, 1,
-0.1454567, 0.0126726, -1.755675, 1, 1, 1, 1, 1,
-0.1448218, 0.6308411, 0.1121022, 1, 1, 1, 1, 1,
-0.1444007, 2.002138, -0.8687857, 1, 1, 1, 1, 1,
-0.1393882, -1.612248, -3.243657, 1, 1, 1, 1, 1,
-0.1392345, 0.8158874, 1.407004, 1, 1, 1, 1, 1,
-0.137028, 0.6595992, -0.6106386, 1, 1, 1, 1, 1,
-0.1351528, -0.1031919, -2.456485, 1, 1, 1, 1, 1,
-0.1350217, -0.05502817, -1.759259, 1, 1, 1, 1, 1,
-0.1349143, 0.919067, 1.374905, 1, 1, 1, 1, 1,
-0.1343141, 0.4815299, -0.4235464, 1, 1, 1, 1, 1,
-0.1299091, 1.689998, 0.2114076, 0, 0, 1, 1, 1,
-0.1291537, 0.04178656, -1.416478, 1, 0, 0, 1, 1,
-0.128672, 1.406962, -0.3914623, 1, 0, 0, 1, 1,
-0.1260775, -1.212519, -2.807153, 1, 0, 0, 1, 1,
-0.1253966, 0.1467195, 0.1516369, 1, 0, 0, 1, 1,
-0.1246352, 0.2737772, -1.310372, 1, 0, 0, 1, 1,
-0.1230291, 0.3334179, 0.9693318, 0, 0, 0, 1, 1,
-0.1228348, -1.235709, -2.900874, 0, 0, 0, 1, 1,
-0.1212694, 0.2186906, -1.105958, 0, 0, 0, 1, 1,
-0.120351, 0.8542477, 0.6528996, 0, 0, 0, 1, 1,
-0.1126418, -0.08000849, -0.1824547, 0, 0, 0, 1, 1,
-0.1119467, 0.8948329, -0.436166, 0, 0, 0, 1, 1,
-0.1105096, -0.2293063, -4.269755, 0, 0, 0, 1, 1,
-0.1091205, 0.2391552, 0.1148417, 1, 1, 1, 1, 1,
-0.108039, 0.2021485, -0.4008822, 1, 1, 1, 1, 1,
-0.1070565, -1.272511, -1.930479, 1, 1, 1, 1, 1,
-0.1066072, 0.6013888, -0.4574863, 1, 1, 1, 1, 1,
-0.1056257, -0.04875256, -1.676658, 1, 1, 1, 1, 1,
-0.1039251, -0.1873616, -1.687424, 1, 1, 1, 1, 1,
-0.1013176, -0.3113365, -2.83581, 1, 1, 1, 1, 1,
-0.1009269, -0.2544565, -0.9163035, 1, 1, 1, 1, 1,
-0.09623358, 0.2676907, -0.05324765, 1, 1, 1, 1, 1,
-0.0930085, -1.54253, -2.647144, 1, 1, 1, 1, 1,
-0.09030338, -0.134622, -2.161548, 1, 1, 1, 1, 1,
-0.08460953, 1.251642, -0.759744, 1, 1, 1, 1, 1,
-0.08306759, 0.652945, -1.323093, 1, 1, 1, 1, 1,
-0.07955962, 0.9501629, -1.031624, 1, 1, 1, 1, 1,
-0.07765918, 0.5375178, 0.6836782, 1, 1, 1, 1, 1,
-0.07746478, 0.6693512, -0.4449826, 0, 0, 1, 1, 1,
-0.0762466, -1.571567, -3.157837, 1, 0, 0, 1, 1,
-0.07574058, 0.8648359, -0.9006484, 1, 0, 0, 1, 1,
-0.06626314, 0.06875363, -0.8091936, 1, 0, 0, 1, 1,
-0.06041298, -0.4176672, -4.217472, 1, 0, 0, 1, 1,
-0.05948214, 0.1386772, 0.7399157, 1, 0, 0, 1, 1,
-0.05543828, 0.5901103, -1.827839, 0, 0, 0, 1, 1,
-0.05384116, 0.4291973, -1.094, 0, 0, 0, 1, 1,
-0.04804234, -0.7775742, -4.477063, 0, 0, 0, 1, 1,
-0.04695974, -0.1823086, -3.525925, 0, 0, 0, 1, 1,
-0.04610568, 0.240969, 1.842779, 0, 0, 0, 1, 1,
-0.04311384, -0.1357385, -4.22723, 0, 0, 0, 1, 1,
-0.04087188, -0.5096133, -3.216451, 0, 0, 0, 1, 1,
-0.03863159, -0.870342, -2.363973, 1, 1, 1, 1, 1,
-0.03661733, 1.523404, -0.4767629, 1, 1, 1, 1, 1,
-0.03624292, -0.05467371, -3.284776, 1, 1, 1, 1, 1,
-0.03554167, -0.2771976, -3.007231, 1, 1, 1, 1, 1,
-0.03142122, -0.02062354, -3.875338, 1, 1, 1, 1, 1,
-0.02665096, -0.866819, -2.504582, 1, 1, 1, 1, 1,
-0.02649046, -2.727125, -3.933837, 1, 1, 1, 1, 1,
-0.02626315, -0.5135605, -3.159794, 1, 1, 1, 1, 1,
-0.02525739, -1.249247, -2.896782, 1, 1, 1, 1, 1,
-0.02440785, -0.7353286, -0.6461312, 1, 1, 1, 1, 1,
-0.02204528, -0.4980373, -2.675777, 1, 1, 1, 1, 1,
-0.02054363, -0.7469817, -3.587214, 1, 1, 1, 1, 1,
-0.01778091, -0.1873005, -3.551231, 1, 1, 1, 1, 1,
-0.00357097, 0.9686382, -0.3868124, 1, 1, 1, 1, 1,
0.001515929, 0.6591212, 0.4668541, 1, 1, 1, 1, 1,
0.002242677, 0.9441191, 0.8976319, 0, 0, 1, 1, 1,
0.002425981, -0.4929863, 2.480124, 1, 0, 0, 1, 1,
0.002828333, 2.018744, 0.1272962, 1, 0, 0, 1, 1,
0.003881631, -0.3406363, 2.219096, 1, 0, 0, 1, 1,
0.006190547, -0.3194499, 3.425628, 1, 0, 0, 1, 1,
0.006951462, -1.596828, 4.63948, 1, 0, 0, 1, 1,
0.007428975, 0.2485838, 0.8754418, 0, 0, 0, 1, 1,
0.01028726, -1.292586, 3.54431, 0, 0, 0, 1, 1,
0.01844091, 2.404432, -0.7446627, 0, 0, 0, 1, 1,
0.02266435, 0.3913794, 0.09778872, 0, 0, 0, 1, 1,
0.02463829, 0.2019505, 2.308236, 0, 0, 0, 1, 1,
0.02503085, 0.2165939, 0.2951923, 0, 0, 0, 1, 1,
0.03530607, -1.481554, 3.145581, 0, 0, 0, 1, 1,
0.03634419, 0.8021745, 2.110791, 1, 1, 1, 1, 1,
0.03724696, -0.09937748, 2.74068, 1, 1, 1, 1, 1,
0.03805501, -0.2760753, 2.283902, 1, 1, 1, 1, 1,
0.03818161, 0.9604557, 1.215685, 1, 1, 1, 1, 1,
0.04354093, 0.5041955, -1.551868, 1, 1, 1, 1, 1,
0.04469523, 1.700689, 0.2221909, 1, 1, 1, 1, 1,
0.04564618, 0.6113645, -0.553215, 1, 1, 1, 1, 1,
0.04659833, -0.5927479, 4.044203, 1, 1, 1, 1, 1,
0.0471182, 0.2773048, -0.497355, 1, 1, 1, 1, 1,
0.04822622, 0.5318366, -0.3862919, 1, 1, 1, 1, 1,
0.05559891, 0.8753746, 0.1691623, 1, 1, 1, 1, 1,
0.05758149, -1.479102, 3.029461, 1, 1, 1, 1, 1,
0.06014242, 0.4977694, 0.2711033, 1, 1, 1, 1, 1,
0.06410362, 0.2372549, 1.671057, 1, 1, 1, 1, 1,
0.06448334, 1.544884, 0.9116989, 1, 1, 1, 1, 1,
0.06562337, 0.2924587, -0.1696631, 0, 0, 1, 1, 1,
0.06957756, -0.08285125, 2.415919, 1, 0, 0, 1, 1,
0.07101186, -0.4730554, 2.836169, 1, 0, 0, 1, 1,
0.07114659, 0.5296922, 1.826565, 1, 0, 0, 1, 1,
0.07698965, -2.102047, 2.979596, 1, 0, 0, 1, 1,
0.07781446, 0.5913019, 0.3899882, 1, 0, 0, 1, 1,
0.07819753, -2.013548, 1.750429, 0, 0, 0, 1, 1,
0.07970925, 1.026378, 1.416436, 0, 0, 0, 1, 1,
0.0818186, -2.00703, 4.625525, 0, 0, 0, 1, 1,
0.08256381, 1.260755, -2.181045, 0, 0, 0, 1, 1,
0.08339839, -0.02501787, 1.674617, 0, 0, 0, 1, 1,
0.08839986, -1.010637, 1.421684, 0, 0, 0, 1, 1,
0.08876561, 1.379336, 0.3373964, 0, 0, 0, 1, 1,
0.09336629, -0.7721611, 2.274928, 1, 1, 1, 1, 1,
0.09690423, -1.487699, 2.393166, 1, 1, 1, 1, 1,
0.1072933, -0.7671241, 3.460023, 1, 1, 1, 1, 1,
0.1096277, -0.5360748, 2.620434, 1, 1, 1, 1, 1,
0.1118418, 0.151811, 0.7670414, 1, 1, 1, 1, 1,
0.1123278, -1.04639, 2.335817, 1, 1, 1, 1, 1,
0.1130705, -2.531492, 4.304348, 1, 1, 1, 1, 1,
0.1152502, 1.41091, -0.1145463, 1, 1, 1, 1, 1,
0.1169986, 0.6563595, 0.02952347, 1, 1, 1, 1, 1,
0.121768, -0.8386552, 3.329457, 1, 1, 1, 1, 1,
0.1227715, -0.848727, 3.502811, 1, 1, 1, 1, 1,
0.1257049, 0.1975192, 1.764639, 1, 1, 1, 1, 1,
0.1258073, 0.5048904, 0.6276507, 1, 1, 1, 1, 1,
0.1265679, -1.276151, 3.641552, 1, 1, 1, 1, 1,
0.129529, -0.3909035, 3.359021, 1, 1, 1, 1, 1,
0.1397007, 0.5174824, -0.2246421, 0, 0, 1, 1, 1,
0.1416113, 1.553262, -1.835672, 1, 0, 0, 1, 1,
0.1421368, -0.4995279, 4.231891, 1, 0, 0, 1, 1,
0.1423945, -1.751356, 0.8374571, 1, 0, 0, 1, 1,
0.1458026, -0.4738793, 3.153662, 1, 0, 0, 1, 1,
0.1473592, -0.822119, 3.737235, 1, 0, 0, 1, 1,
0.1487805, 2.104208, 1.579968, 0, 0, 0, 1, 1,
0.1497966, 0.2820341, -0.04312481, 0, 0, 0, 1, 1,
0.1532077, 0.4094767, 0.820766, 0, 0, 0, 1, 1,
0.1534503, -2.109228, 2.662032, 0, 0, 0, 1, 1,
0.1565563, -0.0291588, 0.4903346, 0, 0, 0, 1, 1,
0.1571312, -1.403874, 1.472615, 0, 0, 0, 1, 1,
0.1572317, -1.35146, 1.659925, 0, 0, 0, 1, 1,
0.1605479, -0.7395155, 2.774437, 1, 1, 1, 1, 1,
0.1673151, 0.3955844, -0.3191029, 1, 1, 1, 1, 1,
0.169223, -0.6831192, 1.973168, 1, 1, 1, 1, 1,
0.1719316, -0.420438, 4.35494, 1, 1, 1, 1, 1,
0.1723735, -0.5529909, 4.049582, 1, 1, 1, 1, 1,
0.1777564, -0.6519721, 2.604339, 1, 1, 1, 1, 1,
0.1779723, 0.5321472, -0.0158105, 1, 1, 1, 1, 1,
0.1813257, -0.2793105, 4.522271, 1, 1, 1, 1, 1,
0.1827426, -1.611834, 3.31269, 1, 1, 1, 1, 1,
0.186802, -0.2324876, 3.067178, 1, 1, 1, 1, 1,
0.189584, 0.6878244, 0.1866346, 1, 1, 1, 1, 1,
0.196389, -0.606979, 1.984223, 1, 1, 1, 1, 1,
0.1976518, -2.268188, 3.21569, 1, 1, 1, 1, 1,
0.1995238, -1.1071, 1.843964, 1, 1, 1, 1, 1,
0.2066478, -0.5884153, 4.173806, 1, 1, 1, 1, 1,
0.2076621, 0.08345114, 2.498276, 0, 0, 1, 1, 1,
0.2112504, -1.163904, 2.073708, 1, 0, 0, 1, 1,
0.2116542, 0.02901193, 2.577987, 1, 0, 0, 1, 1,
0.2134221, 0.6655747, 2.13993, 1, 0, 0, 1, 1,
0.2177029, -0.05996234, -0.06485452, 1, 0, 0, 1, 1,
0.2231833, -0.2721577, 1.844496, 1, 0, 0, 1, 1,
0.2274238, 1.668588, -0.06799372, 0, 0, 0, 1, 1,
0.2320566, -0.6310078, 2.627028, 0, 0, 0, 1, 1,
0.2333587, -3.547291, 3.810744, 0, 0, 0, 1, 1,
0.2336557, 0.3678609, 2.211924, 0, 0, 0, 1, 1,
0.2367739, -0.8082305, 1.39568, 0, 0, 0, 1, 1,
0.2385081, -1.400501, 3.12046, 0, 0, 0, 1, 1,
0.2391513, 1.231071, -0.2058942, 0, 0, 0, 1, 1,
0.2392406, -0.5589178, 3.694576, 1, 1, 1, 1, 1,
0.2416058, -0.7244346, 5.163983, 1, 1, 1, 1, 1,
0.2433595, 0.9080703, 2.230766, 1, 1, 1, 1, 1,
0.2492138, -1.217939, 4.382174, 1, 1, 1, 1, 1,
0.2528077, 1.455818, 0.1344485, 1, 1, 1, 1, 1,
0.2563891, 0.50098, 1.617354, 1, 1, 1, 1, 1,
0.2618903, -0.2332927, 0.9730758, 1, 1, 1, 1, 1,
0.2772675, 0.380828, 0.4044318, 1, 1, 1, 1, 1,
0.277631, 0.4350822, 2.025295, 1, 1, 1, 1, 1,
0.2825185, -0.977705, 3.218443, 1, 1, 1, 1, 1,
0.2827899, 0.00870478, 2.210617, 1, 1, 1, 1, 1,
0.287667, 1.355052, 1.285082, 1, 1, 1, 1, 1,
0.2886463, 1.187298, 1.72622, 1, 1, 1, 1, 1,
0.2905837, 2.213019, -1.089821, 1, 1, 1, 1, 1,
0.2910483, 2.20057, -0.2323426, 1, 1, 1, 1, 1,
0.2919607, -0.7245035, 3.79025, 0, 0, 1, 1, 1,
0.2924508, -0.8288999, 2.922212, 1, 0, 0, 1, 1,
0.2990109, 1.230453, 2.011811, 1, 0, 0, 1, 1,
0.2996758, -1.154498, 2.499048, 1, 0, 0, 1, 1,
0.3051997, 2.06986, -0.1568318, 1, 0, 0, 1, 1,
0.3056238, 0.6645995, -1.373695, 1, 0, 0, 1, 1,
0.3073706, -1.31351, 1.6194, 0, 0, 0, 1, 1,
0.3088679, -0.3066288, 0.8090297, 0, 0, 0, 1, 1,
0.311094, 1.253579, -0.9375459, 0, 0, 0, 1, 1,
0.312548, 0.7825907, -0.2588507, 0, 0, 0, 1, 1,
0.3149297, 1.247453, -0.2703971, 0, 0, 0, 1, 1,
0.3163655, -0.2534305, 3.059048, 0, 0, 0, 1, 1,
0.3260244, -1.245579, 3.836411, 0, 0, 0, 1, 1,
0.3278271, -0.6132526, 1.989717, 1, 1, 1, 1, 1,
0.3311568, 0.1605054, 1.322923, 1, 1, 1, 1, 1,
0.33226, -1.400103, 3.471375, 1, 1, 1, 1, 1,
0.3334735, 1.078046, -0.4171863, 1, 1, 1, 1, 1,
0.3373705, 0.892962, 0.4804473, 1, 1, 1, 1, 1,
0.338639, 1.133773, -1.740517, 1, 1, 1, 1, 1,
0.3418114, -1.718059, 3.024473, 1, 1, 1, 1, 1,
0.3439145, -0.9310783, 1.863071, 1, 1, 1, 1, 1,
0.34443, -1.168311, 2.838217, 1, 1, 1, 1, 1,
0.3469925, -0.8357197, 2.732061, 1, 1, 1, 1, 1,
0.3482381, -0.6129737, 3.603567, 1, 1, 1, 1, 1,
0.3503696, 0.04140287, 2.055516, 1, 1, 1, 1, 1,
0.3527304, 0.7086336, 0.1781465, 1, 1, 1, 1, 1,
0.3575734, -0.6404859, 1.692599, 1, 1, 1, 1, 1,
0.3659388, -0.1189125, 1.686123, 1, 1, 1, 1, 1,
0.3723975, 1.931706, -1.351193, 0, 0, 1, 1, 1,
0.3740348, -1.698486, 2.798859, 1, 0, 0, 1, 1,
0.3777348, -1.936346, 3.129814, 1, 0, 0, 1, 1,
0.377737, -1.288803, 2.405729, 1, 0, 0, 1, 1,
0.3821701, 0.3093804, -0.08555889, 1, 0, 0, 1, 1,
0.3834415, -0.7039169, 1.841056, 1, 0, 0, 1, 1,
0.3876437, 2.517259, 1.91765, 0, 0, 0, 1, 1,
0.3892088, 0.4421273, -0.3869328, 0, 0, 0, 1, 1,
0.3894568, 0.3991536, -0.3137876, 0, 0, 0, 1, 1,
0.3895574, 0.6128584, -1.076793, 0, 0, 0, 1, 1,
0.3898168, -1.038036, 3.944518, 0, 0, 0, 1, 1,
0.3904598, -1.359488, 0.4783454, 0, 0, 0, 1, 1,
0.394392, 1.07059, 1.70138, 0, 0, 0, 1, 1,
0.3962934, -0.2760872, 2.172186, 1, 1, 1, 1, 1,
0.3971653, -0.2078187, 2.901558, 1, 1, 1, 1, 1,
0.3974164, -1.30768, 4.897857, 1, 1, 1, 1, 1,
0.3997957, 0.4102153, 0.5508983, 1, 1, 1, 1, 1,
0.4041079, -1.194664, 3.91241, 1, 1, 1, 1, 1,
0.4096559, -0.872781, 3.103484, 1, 1, 1, 1, 1,
0.4197651, -0.3828387, 2.594069, 1, 1, 1, 1, 1,
0.4202043, -0.4744232, 2.848556, 1, 1, 1, 1, 1,
0.4275679, 0.8260163, 0.734939, 1, 1, 1, 1, 1,
0.428693, 0.2211156, 3.157695, 1, 1, 1, 1, 1,
0.4297507, 0.7427068, 0.1364384, 1, 1, 1, 1, 1,
0.4325114, 1.309041, -0.01241725, 1, 1, 1, 1, 1,
0.4357098, -1.103976, 3.562028, 1, 1, 1, 1, 1,
0.4384299, 0.453274, 0.5772523, 1, 1, 1, 1, 1,
0.4390037, 0.672987, 0.9021774, 1, 1, 1, 1, 1,
0.439135, -1.828538, 3.806077, 0, 0, 1, 1, 1,
0.4439826, -1.397665, 2.133486, 1, 0, 0, 1, 1,
0.4465382, -0.7604588, 3.931247, 1, 0, 0, 1, 1,
0.4492106, 0.4356135, 1.024926, 1, 0, 0, 1, 1,
0.4495908, -0.8843557, 1.883965, 1, 0, 0, 1, 1,
0.4512268, -0.8316594, 2.747734, 1, 0, 0, 1, 1,
0.4526509, 0.5301399, 1.361361, 0, 0, 0, 1, 1,
0.4531543, 0.08095136, 1.872147, 0, 0, 0, 1, 1,
0.4563217, 0.4701763, 0.7317937, 0, 0, 0, 1, 1,
0.4591173, -0.5911978, 2.11316, 0, 0, 0, 1, 1,
0.4621347, 0.818772, 0.4854829, 0, 0, 0, 1, 1,
0.4647762, 0.3586347, 0.9818643, 0, 0, 0, 1, 1,
0.4663434, 0.0353211, 3.212868, 0, 0, 0, 1, 1,
0.4693943, -1.105274, 3.345198, 1, 1, 1, 1, 1,
0.4695463, 1.726421, 0.4365343, 1, 1, 1, 1, 1,
0.4719026, 1.341154, 1.009139, 1, 1, 1, 1, 1,
0.4722606, 1.155113, -0.8602826, 1, 1, 1, 1, 1,
0.4741384, 0.1547345, 1.028593, 1, 1, 1, 1, 1,
0.4771169, 1.204556, 1.455531, 1, 1, 1, 1, 1,
0.4778588, -0.5148196, 3.10953, 1, 1, 1, 1, 1,
0.4847993, 0.3126456, 0.7051373, 1, 1, 1, 1, 1,
0.4858507, -1.028232, 3.366316, 1, 1, 1, 1, 1,
0.4869075, -1.218302, 2.020709, 1, 1, 1, 1, 1,
0.4917493, 0.844177, 0.4709045, 1, 1, 1, 1, 1,
0.4918379, 0.8896715, 1.564099, 1, 1, 1, 1, 1,
0.492444, 0.2739315, 1.361562, 1, 1, 1, 1, 1,
0.4931186, 0.9286838, 2.094742, 1, 1, 1, 1, 1,
0.4971809, 0.7717679, 0.04453399, 1, 1, 1, 1, 1,
0.499573, -0.01221523, 0.08124015, 0, 0, 1, 1, 1,
0.5047967, -2.290565, 2.293628, 1, 0, 0, 1, 1,
0.5080656, 0.1371312, 1.552218, 1, 0, 0, 1, 1,
0.5083741, -1.136529, 4.033844, 1, 0, 0, 1, 1,
0.5106583, -0.8361725, 2.119094, 1, 0, 0, 1, 1,
0.5163072, -1.621318, 1.866, 1, 0, 0, 1, 1,
0.518497, -0.2954307, 2.896212, 0, 0, 0, 1, 1,
0.5187375, -0.7580581, 2.21969, 0, 0, 0, 1, 1,
0.5197546, 0.1633687, 2.310615, 0, 0, 0, 1, 1,
0.5250547, -0.5892558, 0.8608254, 0, 0, 0, 1, 1,
0.5256739, -0.07507382, 2.544089, 0, 0, 0, 1, 1,
0.5284979, 2.028085, 0.3347304, 0, 0, 0, 1, 1,
0.5366541, 0.2009682, 1.096707, 0, 0, 0, 1, 1,
0.5412212, 0.1148477, 0.3582392, 1, 1, 1, 1, 1,
0.5412288, -0.8525088, 4.239947, 1, 1, 1, 1, 1,
0.5423531, -0.2341859, 2.225035, 1, 1, 1, 1, 1,
0.5426056, -0.3675206, 2.345098, 1, 1, 1, 1, 1,
0.5450589, -0.4534556, 2.108002, 1, 1, 1, 1, 1,
0.5454248, -1.890097, 4.519293, 1, 1, 1, 1, 1,
0.5454599, -0.2079823, 2.325831, 1, 1, 1, 1, 1,
0.5472713, -1.592355, 1.322409, 1, 1, 1, 1, 1,
0.5533339, -0.06624839, 1.315902, 1, 1, 1, 1, 1,
0.5578213, -0.7253529, 2.182037, 1, 1, 1, 1, 1,
0.558821, 1.6602, -0.3796768, 1, 1, 1, 1, 1,
0.5588486, -0.07735559, -0.1936932, 1, 1, 1, 1, 1,
0.5605945, -1.672559, 1.649734, 1, 1, 1, 1, 1,
0.5639362, 0.2837414, -1.499496, 1, 1, 1, 1, 1,
0.5653554, -0.1841906, 1.25498, 1, 1, 1, 1, 1,
0.5668837, 0.5915888, 0.9227384, 0, 0, 1, 1, 1,
0.5675685, 1.02005, -1.831322, 1, 0, 0, 1, 1,
0.576251, 0.2700542, -0.7793828, 1, 0, 0, 1, 1,
0.5872665, 2.208131, 0.7217926, 1, 0, 0, 1, 1,
0.5892434, -0.05311183, 1.002751, 1, 0, 0, 1, 1,
0.5951795, 0.1477164, 0.7109817, 1, 0, 0, 1, 1,
0.5955146, 0.9593317, -1.33791, 0, 0, 0, 1, 1,
0.5980875, -0.5266076, 1.857558, 0, 0, 0, 1, 1,
0.608889, 1.215317, 0.4877025, 0, 0, 0, 1, 1,
0.6112944, -1.397805, 3.515256, 0, 0, 0, 1, 1,
0.6122174, -1.258503, 1.446783, 0, 0, 0, 1, 1,
0.6197, -0.7832352, 4.286079, 0, 0, 0, 1, 1,
0.624278, -0.6030445, 1.254105, 0, 0, 0, 1, 1,
0.6245411, 2.835977, 0.5346511, 1, 1, 1, 1, 1,
0.6254676, 0.3084387, 1.191699, 1, 1, 1, 1, 1,
0.6268076, 2.412968, 0.09994096, 1, 1, 1, 1, 1,
0.6268632, 1.161277, 0.9126658, 1, 1, 1, 1, 1,
0.6275649, -0.2978503, 2.628558, 1, 1, 1, 1, 1,
0.6287411, 0.339711, -0.9518542, 1, 1, 1, 1, 1,
0.6329347, -0.2142596, 1.422394, 1, 1, 1, 1, 1,
0.6349206, -0.3647555, 3.11113, 1, 1, 1, 1, 1,
0.6408122, 0.4058653, 0.614535, 1, 1, 1, 1, 1,
0.6474285, -0.6905925, 1.130099, 1, 1, 1, 1, 1,
0.6495584, 1.319561, 0.4359068, 1, 1, 1, 1, 1,
0.6536125, 1.080208, 0.6058661, 1, 1, 1, 1, 1,
0.6549662, -0.490623, 3.385088, 1, 1, 1, 1, 1,
0.6569543, 1.753858, -0.6570805, 1, 1, 1, 1, 1,
0.6590275, -0.3988653, 1.517521, 1, 1, 1, 1, 1,
0.6714194, -1.674727, 2.389947, 0, 0, 1, 1, 1,
0.6721326, -0.4465909, 2.880392, 1, 0, 0, 1, 1,
0.6748235, 0.9648072, 0.3596233, 1, 0, 0, 1, 1,
0.677375, 1.117875, 0.8463905, 1, 0, 0, 1, 1,
0.6777702, 0.6945795, 0.8876942, 1, 0, 0, 1, 1,
0.6781817, -0.9977432, 3.957328, 1, 0, 0, 1, 1,
0.6788166, -0.03376272, 3.596242, 0, 0, 0, 1, 1,
0.6835865, 1.061313, -0.0650465, 0, 0, 0, 1, 1,
0.6844251, 0.8436022, -0.408014, 0, 0, 0, 1, 1,
0.6877396, 0.1103732, 0.9226061, 0, 0, 0, 1, 1,
0.6933728, 0.361795, 0.3506917, 0, 0, 0, 1, 1,
0.6949112, -0.4384066, 2.153055, 0, 0, 0, 1, 1,
0.6953729, -0.4131885, 2.611032, 0, 0, 0, 1, 1,
0.6955678, 0.5237733, 2.128537, 1, 1, 1, 1, 1,
0.6974154, -0.3242732, 3.096884, 1, 1, 1, 1, 1,
0.6985435, 1.091028, 1.439004, 1, 1, 1, 1, 1,
0.6999093, -0.2004267, 1.551297, 1, 1, 1, 1, 1,
0.7011698, -1.756528, 3.178648, 1, 1, 1, 1, 1,
0.7040823, 1.294275, 0.08639731, 1, 1, 1, 1, 1,
0.7057165, -1.404679, 4.167063, 1, 1, 1, 1, 1,
0.7113162, 0.244782, 0.9242984, 1, 1, 1, 1, 1,
0.7117899, 0.8651494, 0.2699214, 1, 1, 1, 1, 1,
0.7200977, 1.337956, 0.9808841, 1, 1, 1, 1, 1,
0.7247922, 1.224722, 0.8821567, 1, 1, 1, 1, 1,
0.7281786, 0.5850931, 0.07504807, 1, 1, 1, 1, 1,
0.7329747, -0.7401124, -0.3916998, 1, 1, 1, 1, 1,
0.7397953, 1.89911, -0.5007613, 1, 1, 1, 1, 1,
0.7438591, 0.1175333, 2.732761, 1, 1, 1, 1, 1,
0.7442393, -0.4917975, 2.91157, 0, 0, 1, 1, 1,
0.7467867, 0.5530906, 2.133146, 1, 0, 0, 1, 1,
0.7468393, -0.4940561, 2.045182, 1, 0, 0, 1, 1,
0.7469624, 0.9907818, 0.4465913, 1, 0, 0, 1, 1,
0.7505195, -1.295358, 2.287108, 1, 0, 0, 1, 1,
0.750726, -1.131327, 2.473135, 1, 0, 0, 1, 1,
0.7522357, 0.4613388, 0.8190824, 0, 0, 0, 1, 1,
0.7560368, -0.2659023, 0.6909663, 0, 0, 0, 1, 1,
0.7569501, -0.1578218, 0.5735289, 0, 0, 0, 1, 1,
0.7581775, -0.02270913, 1.675708, 0, 0, 0, 1, 1,
0.7602035, 1.039428, 0.3715249, 0, 0, 0, 1, 1,
0.7637421, -0.03657635, 1.623939, 0, 0, 0, 1, 1,
0.775277, 0.6180327, 1.899613, 0, 0, 0, 1, 1,
0.7776547, -0.09413411, 1.203757, 1, 1, 1, 1, 1,
0.7964891, 1.027988, 0.8127646, 1, 1, 1, 1, 1,
0.7974015, 0.01603778, -0.06748543, 1, 1, 1, 1, 1,
0.7979825, 2.543698, 1.454936, 1, 1, 1, 1, 1,
0.8015774, -1.307479, 3.480092, 1, 1, 1, 1, 1,
0.8062348, 0.06254219, 0.236648, 1, 1, 1, 1, 1,
0.8062909, -0.06346007, 2.290658, 1, 1, 1, 1, 1,
0.806675, -0.4054269, 3.333405, 1, 1, 1, 1, 1,
0.8075263, -0.01870436, 2.207853, 1, 1, 1, 1, 1,
0.8113745, -0.1664249, 2.241257, 1, 1, 1, 1, 1,
0.8166099, -1.342094, 2.829088, 1, 1, 1, 1, 1,
0.8178481, -0.3339703, -0.1308678, 1, 1, 1, 1, 1,
0.8205232, -0.897158, 0.153108, 1, 1, 1, 1, 1,
0.820833, 0.1502327, 3.577909, 1, 1, 1, 1, 1,
0.8211975, 0.5962673, 1.556336, 1, 1, 1, 1, 1,
0.8233105, 1.358431, 1.127064, 0, 0, 1, 1, 1,
0.8285488, 0.5376677, 0.08272338, 1, 0, 0, 1, 1,
0.8293889, -0.9179106, 2.990695, 1, 0, 0, 1, 1,
0.829957, -0.8980167, 2.975191, 1, 0, 0, 1, 1,
0.8318295, 0.6304483, 0.6557325, 1, 0, 0, 1, 1,
0.8342843, -1.704334, 0.5728966, 1, 0, 0, 1, 1,
0.8484148, 0.01959384, 1.373517, 0, 0, 0, 1, 1,
0.8485376, -0.5929167, 2.062359, 0, 0, 0, 1, 1,
0.8561538, 0.09107664, 0.196787, 0, 0, 0, 1, 1,
0.8572291, 1.518565, 2.082642, 0, 0, 0, 1, 1,
0.8585467, -0.3989949, 3.563529, 0, 0, 0, 1, 1,
0.8693292, -0.3891549, 2.292492, 0, 0, 0, 1, 1,
0.8713179, 1.255748, 2.549134, 0, 0, 0, 1, 1,
0.8836889, 0.2736031, 1.316309, 1, 1, 1, 1, 1,
0.889125, 1.761923, -0.1658979, 1, 1, 1, 1, 1,
0.8945888, 0.8414743, 2.464133, 1, 1, 1, 1, 1,
0.8960463, -1.955132, 2.399874, 1, 1, 1, 1, 1,
0.8962159, -0.510359, 0.8847493, 1, 1, 1, 1, 1,
0.8995126, -0.08599899, 0.3944669, 1, 1, 1, 1, 1,
0.9057719, 0.09142648, 0.9035658, 1, 1, 1, 1, 1,
0.9107678, 1.173636, 1.49602, 1, 1, 1, 1, 1,
0.9129736, -0.523378, 2.16323, 1, 1, 1, 1, 1,
0.9177607, -0.6268837, 0.7474865, 1, 1, 1, 1, 1,
0.9213125, -0.5317688, 0.6520489, 1, 1, 1, 1, 1,
0.9213685, 1.207949, 2.165429, 1, 1, 1, 1, 1,
0.9226973, -1.208213, 2.241055, 1, 1, 1, 1, 1,
0.9237779, -0.03484944, 2.547222, 1, 1, 1, 1, 1,
0.9383234, -2.398401, 4.316647, 1, 1, 1, 1, 1,
0.9386583, 3.436446, -0.2733769, 0, 0, 1, 1, 1,
0.9405506, 0.3767198, 2.371791, 1, 0, 0, 1, 1,
0.9422145, 0.1780172, 0.3556425, 1, 0, 0, 1, 1,
0.944474, -1.271514, 3.187497, 1, 0, 0, 1, 1,
0.9465257, 0.692848, 2.853361, 1, 0, 0, 1, 1,
0.9496743, 1.018983, 0.2410259, 1, 0, 0, 1, 1,
0.955982, 0.4576049, 2.370549, 0, 0, 0, 1, 1,
0.9565186, 0.9426421, 1.880253, 0, 0, 0, 1, 1,
0.9587029, 0.6344398, 0.3220791, 0, 0, 0, 1, 1,
0.9606514, -1.944286, 1.484713, 0, 0, 0, 1, 1,
0.9613511, -0.6291512, 0.2377355, 0, 0, 0, 1, 1,
0.9686329, 0.1055724, 1.847654, 0, 0, 0, 1, 1,
0.9781286, 0.6174113, -0.4372989, 0, 0, 0, 1, 1,
0.9825042, 0.8861154, 0.2650936, 1, 1, 1, 1, 1,
0.9992522, 0.1870677, 0.4006145, 1, 1, 1, 1, 1,
1.004946, -0.4313133, 1.462956, 1, 1, 1, 1, 1,
1.015694, 0.1027125, 1.375138, 1, 1, 1, 1, 1,
1.020843, -1.123278, 2.365504, 1, 1, 1, 1, 1,
1.02961, -0.9826434, 1.578761, 1, 1, 1, 1, 1,
1.039562, 1.056296, 1.808062, 1, 1, 1, 1, 1,
1.045396, 1.003376, 1.61987, 1, 1, 1, 1, 1,
1.046339, 0.1730651, 2.398206, 1, 1, 1, 1, 1,
1.046374, -0.4182352, 1.457281, 1, 1, 1, 1, 1,
1.048173, 2.000634, 0.5064179, 1, 1, 1, 1, 1,
1.051171, -0.512756, 1.20371, 1, 1, 1, 1, 1,
1.051186, -1.712657, 3.033069, 1, 1, 1, 1, 1,
1.051419, -0.06558065, 3.202495, 1, 1, 1, 1, 1,
1.05265, -0.5083343, 2.40036, 1, 1, 1, 1, 1,
1.053818, -0.1992961, 0.5085747, 0, 0, 1, 1, 1,
1.055154, -0.4386848, 2.552335, 1, 0, 0, 1, 1,
1.056037, 1.239249, 0.3879081, 1, 0, 0, 1, 1,
1.058052, -1.017197, 2.397383, 1, 0, 0, 1, 1,
1.062089, 0.1157704, -0.06289633, 1, 0, 0, 1, 1,
1.069602, -0.1672428, 2.449926, 1, 0, 0, 1, 1,
1.075307, 1.6956, 2.615431, 0, 0, 0, 1, 1,
1.080969, 0.4463412, 0.7027172, 0, 0, 0, 1, 1,
1.083067, 1.057012, -0.3207853, 0, 0, 0, 1, 1,
1.090659, -0.07811279, 3.475608, 0, 0, 0, 1, 1,
1.094573, 1.931839, 0.3580231, 0, 0, 0, 1, 1,
1.095825, -1.164452, 2.444579, 0, 0, 0, 1, 1,
1.097436, -0.3823163, 1.314748, 0, 0, 0, 1, 1,
1.104403, -1.520407, 1.698411, 1, 1, 1, 1, 1,
1.106833, -1.382242, 2.186555, 1, 1, 1, 1, 1,
1.107011, -2.445988, 2.659801, 1, 1, 1, 1, 1,
1.112679, 0.2507352, 1.379831, 1, 1, 1, 1, 1,
1.11562, 0.4080257, 2.372167, 1, 1, 1, 1, 1,
1.124783, 0.2519544, 0.4599342, 1, 1, 1, 1, 1,
1.130545, 0.7388704, -0.6406361, 1, 1, 1, 1, 1,
1.13503, 0.4089227, 1.343106, 1, 1, 1, 1, 1,
1.13659, 1.50332, 1.313166, 1, 1, 1, 1, 1,
1.146185, 0.8438561, 0.4408114, 1, 1, 1, 1, 1,
1.14821, -1.68908, 4.654061, 1, 1, 1, 1, 1,
1.148833, 0.9624981, 1.371709, 1, 1, 1, 1, 1,
1.15331, -0.2154627, 1.275868, 1, 1, 1, 1, 1,
1.153909, -1.262648, 4.359452, 1, 1, 1, 1, 1,
1.157036, -0.8785777, 2.421929, 1, 1, 1, 1, 1,
1.166563, 0.1079376, 2.956817, 0, 0, 1, 1, 1,
1.171099, 0.09557047, 0.9660099, 1, 0, 0, 1, 1,
1.180349, -0.879572, 1.426441, 1, 0, 0, 1, 1,
1.189277, -0.6448101, 1.696386, 1, 0, 0, 1, 1,
1.189965, -1.253422, 2.068547, 1, 0, 0, 1, 1,
1.194714, -0.5661981, 0.8842016, 1, 0, 0, 1, 1,
1.199143, -0.3270427, 1.911442, 0, 0, 0, 1, 1,
1.206475, 0.6510118, 0.7313026, 0, 0, 0, 1, 1,
1.206766, -1.823552, 2.838435, 0, 0, 0, 1, 1,
1.207227, -0.7582548, 2.368222, 0, 0, 0, 1, 1,
1.212307, 0.2240739, 3.632712, 0, 0, 0, 1, 1,
1.21486, 1.47712, -0.9962612, 0, 0, 0, 1, 1,
1.222122, -0.08925015, 1.912678, 0, 0, 0, 1, 1,
1.223, 0.6531034, 0.4524295, 1, 1, 1, 1, 1,
1.229523, 0.08804306, 0.5890719, 1, 1, 1, 1, 1,
1.238201, 1.127466, 2.095901, 1, 1, 1, 1, 1,
1.238324, -0.9702069, 0.7951788, 1, 1, 1, 1, 1,
1.242683, 1.146245, -0.2558521, 1, 1, 1, 1, 1,
1.24595, 1.201479, 0.8877296, 1, 1, 1, 1, 1,
1.266778, 0.9405226, -1.102426, 1, 1, 1, 1, 1,
1.268213, -0.1269476, 0.8021816, 1, 1, 1, 1, 1,
1.272283, 0.6950129, 1.006666, 1, 1, 1, 1, 1,
1.272377, 0.07169941, 1.88804, 1, 1, 1, 1, 1,
1.273049, -1.341346, 2.047828, 1, 1, 1, 1, 1,
1.276059, 0.106909, 0.9073573, 1, 1, 1, 1, 1,
1.290569, 0.5065606, 0.02492839, 1, 1, 1, 1, 1,
1.298147, 0.989659, 0.7802728, 1, 1, 1, 1, 1,
1.300727, -0.1424447, 1.201719, 1, 1, 1, 1, 1,
1.308871, 0.1617231, 2.713242, 0, 0, 1, 1, 1,
1.309646, 0.9630696, 1.575579, 1, 0, 0, 1, 1,
1.331419, -2.004537, 3.193444, 1, 0, 0, 1, 1,
1.33907, 1.100019, 3.014611, 1, 0, 0, 1, 1,
1.34678, -1.143259, 2.390392, 1, 0, 0, 1, 1,
1.35093, -0.03198717, 1.192007, 1, 0, 0, 1, 1,
1.35785, -0.8872508, 3.600324, 0, 0, 0, 1, 1,
1.375646, 1.321286, 0.255729, 0, 0, 0, 1, 1,
1.37838, 0.3113482, 0.07291851, 0, 0, 0, 1, 1,
1.380953, 0.5231948, 0.4703562, 0, 0, 0, 1, 1,
1.383715, 0.2160862, -1.181894, 0, 0, 0, 1, 1,
1.386497, -0.1104067, -0.3035389, 0, 0, 0, 1, 1,
1.387162, -0.176823, 1.416213, 0, 0, 0, 1, 1,
1.394531, -0.9129474, 1.327011, 1, 1, 1, 1, 1,
1.396632, -0.9721255, 3.189908, 1, 1, 1, 1, 1,
1.420424, 0.8040807, 1.123269, 1, 1, 1, 1, 1,
1.421027, -0.6524019, 3.099496, 1, 1, 1, 1, 1,
1.423525, 1.214861, 2.571694, 1, 1, 1, 1, 1,
1.426343, 0.08545426, 2.700107, 1, 1, 1, 1, 1,
1.439612, -1.218292, 2.477903, 1, 1, 1, 1, 1,
1.443388, -0.6621239, 1.907812, 1, 1, 1, 1, 1,
1.444085, 1.192675, 1.031624, 1, 1, 1, 1, 1,
1.444541, -0.01173316, 0.3631482, 1, 1, 1, 1, 1,
1.448119, -2.286766, 3.085674, 1, 1, 1, 1, 1,
1.45355, 0.6607394, 1.266793, 1, 1, 1, 1, 1,
1.457794, -0.4555718, 0.2135914, 1, 1, 1, 1, 1,
1.465624, 0.4290731, -0.03816938, 1, 1, 1, 1, 1,
1.466175, -0.1569225, 2.058595, 1, 1, 1, 1, 1,
1.47854, 0.1500195, 2.26865, 0, 0, 1, 1, 1,
1.480265, -0.2471378, 1.095904, 1, 0, 0, 1, 1,
1.482605, 0.4651912, 2.2169, 1, 0, 0, 1, 1,
1.498234, 0.106639, 1.447465, 1, 0, 0, 1, 1,
1.517323, -1.226502, 1.94135, 1, 0, 0, 1, 1,
1.52574, 0.6017275, 2.680621, 1, 0, 0, 1, 1,
1.528294, 0.8146839, 0.5074987, 0, 0, 0, 1, 1,
1.540739, 0.0642134, 1.172186, 0, 0, 0, 1, 1,
1.542703, -0.8704532, 2.138805, 0, 0, 0, 1, 1,
1.547064, 1.706113, 0.8231999, 0, 0, 0, 1, 1,
1.549009, 0.3743981, 1.104033, 0, 0, 0, 1, 1,
1.560552, 0.2126742, 0.551253, 0, 0, 0, 1, 1,
1.574138, 0.9689971, -0.7214987, 0, 0, 0, 1, 1,
1.575857, -1.087206, 2.577893, 1, 1, 1, 1, 1,
1.588817, -0.08701371, 1.644218, 1, 1, 1, 1, 1,
1.589191, 0.7666676, 2.008304, 1, 1, 1, 1, 1,
1.604573, 0.4463046, 1.565265, 1, 1, 1, 1, 1,
1.624919, -0.8121496, 1.921532, 1, 1, 1, 1, 1,
1.638713, 0.9369251, -0.9098766, 1, 1, 1, 1, 1,
1.643522, 0.7483277, 2.574526, 1, 1, 1, 1, 1,
1.660706, -1.242591, 2.26798, 1, 1, 1, 1, 1,
1.677076, 0.6465256, 2.515528, 1, 1, 1, 1, 1,
1.682358, -0.250875, 2.012053, 1, 1, 1, 1, 1,
1.687231, 0.3907659, 0.1005661, 1, 1, 1, 1, 1,
1.695865, 0.8485373, 1.877361, 1, 1, 1, 1, 1,
1.697756, 1.297372, 0.08398118, 1, 1, 1, 1, 1,
1.699738, 1.464695, -0.1410948, 1, 1, 1, 1, 1,
1.705056, -0.6700599, 0.404607, 1, 1, 1, 1, 1,
1.705526, 0.7162966, 1.278605, 0, 0, 1, 1, 1,
1.763352, 0.9417764, -0.8217239, 1, 0, 0, 1, 1,
1.763759, -0.4861181, 1.18221, 1, 0, 0, 1, 1,
1.766805, 0.1404227, 3.372458, 1, 0, 0, 1, 1,
1.785498, 0.2657238, -0.0943803, 1, 0, 0, 1, 1,
1.808969, -1.349957, 1.740874, 1, 0, 0, 1, 1,
1.812888, 0.4103611, 2.986834, 0, 0, 0, 1, 1,
1.820418, -0.1496924, 2.088562, 0, 0, 0, 1, 1,
1.822084, -1.441826, 1.992489, 0, 0, 0, 1, 1,
1.878559, 1.120531, 0.9313444, 0, 0, 0, 1, 1,
1.887657, -1.023928, 3.349014, 0, 0, 0, 1, 1,
1.902523, -0.5409589, 1.526798, 0, 0, 0, 1, 1,
1.903212, 1.295546, 1.160619, 0, 0, 0, 1, 1,
1.917493, 1.030616, -0.3953419, 1, 1, 1, 1, 1,
1.9179, 0.38245, 2.890366, 1, 1, 1, 1, 1,
1.932556, 1.955029, 2.712761, 1, 1, 1, 1, 1,
1.935413, 2.225407, 0.3085899, 1, 1, 1, 1, 1,
1.96252, -1.154041, 3.337362, 1, 1, 1, 1, 1,
1.972244, 0.5931106, 1.17965, 1, 1, 1, 1, 1,
2.001145, 0.7836832, 1.629552, 1, 1, 1, 1, 1,
2.048121, -0.3869708, 1.316603, 1, 1, 1, 1, 1,
2.057001, 0.2540323, 1.788926, 1, 1, 1, 1, 1,
2.105972, 0.06873853, 1.826493, 1, 1, 1, 1, 1,
2.117376, 1.307911, 0.5357081, 1, 1, 1, 1, 1,
2.138194, 0.01388109, 0.5055466, 1, 1, 1, 1, 1,
2.158703, 0.952746, 0.1342544, 1, 1, 1, 1, 1,
2.229346, 0.04286509, -0.6175641, 1, 1, 1, 1, 1,
2.259623, 0.9354235, -0.6095181, 1, 1, 1, 1, 1,
2.260412, -1.276106, 2.301025, 0, 0, 1, 1, 1,
2.278236, 0.02670329, 2.059169, 1, 0, 0, 1, 1,
2.280003, 0.184138, 1.060679, 1, 0, 0, 1, 1,
2.29444, 0.4880358, 1.707734, 1, 0, 0, 1, 1,
2.329228, 1.45912, -0.2902687, 1, 0, 0, 1, 1,
2.334368, -1.800973, 2.216473, 1, 0, 0, 1, 1,
2.386663, -0.2748679, 2.736551, 0, 0, 0, 1, 1,
2.422435, 0.3524696, 1.206421, 0, 0, 0, 1, 1,
2.424881, -0.1023355, 1.946584, 0, 0, 0, 1, 1,
2.473292, 1.566941, 2.343961, 0, 0, 0, 1, 1,
2.47813, 0.6185278, -0.1715606, 0, 0, 0, 1, 1,
2.486123, -0.04442192, -1.105113, 0, 0, 0, 1, 1,
2.49241, 0.562353, 1.254008, 0, 0, 0, 1, 1,
2.523057, 0.5707642, 1.916224, 1, 1, 1, 1, 1,
2.540813, 0.9800894, 0.5543315, 1, 1, 1, 1, 1,
2.564, -0.8871719, 2.52623, 1, 1, 1, 1, 1,
2.740389, -3.055138, 1.743742, 1, 1, 1, 1, 1,
2.829131, 0.5272551, 0.2294835, 1, 1, 1, 1, 1,
2.851895, -0.7931178, 1.898739, 1, 1, 1, 1, 1,
2.889097, -0.5432252, -0.6080304, 1, 1, 1, 1, 1
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
var radius = 9.275658;
var distance = 32.58035;
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
mvMatrix.translate( -0.1022483, 0.05542231, -0.1151376 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.58035);
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
