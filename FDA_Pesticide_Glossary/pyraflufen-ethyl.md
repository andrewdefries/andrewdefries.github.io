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
-2.743605, -1.311277, -1.431131, 1, 0, 0, 1,
-2.703963, 0.7192659, -1.201901, 1, 0.007843138, 0, 1,
-2.655171, 0.06126093, -1.938775, 1, 0.01176471, 0, 1,
-2.640204, 1.55961, -0.2895637, 1, 0.01960784, 0, 1,
-2.573275, 1.030334, -0.6548042, 1, 0.02352941, 0, 1,
-2.545359, -0.67369, -0.640946, 1, 0.03137255, 0, 1,
-2.379513, 0.1575626, -2.22212, 1, 0.03529412, 0, 1,
-2.275006, 0.3788592, -1.270749, 1, 0.04313726, 0, 1,
-2.249189, -0.4269489, -1.482202, 1, 0.04705882, 0, 1,
-2.204808, 0.7058681, -2.723469, 1, 0.05490196, 0, 1,
-2.133015, -0.6393891, -2.271159, 1, 0.05882353, 0, 1,
-2.11874, -0.3226758, -3.029003, 1, 0.06666667, 0, 1,
-2.097293, 0.2380031, -0.1853902, 1, 0.07058824, 0, 1,
-2.068368, -0.07572097, -1.250451, 1, 0.07843138, 0, 1,
-2.055618, 0.9139931, 0.1703969, 1, 0.08235294, 0, 1,
-2.050502, 1.092059, 1.193357, 1, 0.09019608, 0, 1,
-2.042383, 0.3767196, -1.188533, 1, 0.09411765, 0, 1,
-2.039135, 1.322032, -0.007347849, 1, 0.1019608, 0, 1,
-2.022426, 0.08019336, -3.163131, 1, 0.1098039, 0, 1,
-2.005126, 0.9669163, -0.9242651, 1, 0.1137255, 0, 1,
-2.000691, 0.9830447, -0.9822882, 1, 0.1215686, 0, 1,
-1.980529, -0.8862513, -1.135683, 1, 0.1254902, 0, 1,
-1.962918, -0.7434085, -1.635387, 1, 0.1333333, 0, 1,
-1.944553, 1.043191, -3.664795, 1, 0.1372549, 0, 1,
-1.930855, -0.5595, -3.631943, 1, 0.145098, 0, 1,
-1.913323, 1.335691, -0.6930887, 1, 0.1490196, 0, 1,
-1.910907, 0.03715554, -0.5198214, 1, 0.1568628, 0, 1,
-1.905676, 1.23175, 1.474074, 1, 0.1607843, 0, 1,
-1.846674, 0.03543168, -2.751389, 1, 0.1686275, 0, 1,
-1.8386, -0.07476491, -3.220961, 1, 0.172549, 0, 1,
-1.811247, -0.9407529, -4.020791, 1, 0.1803922, 0, 1,
-1.810328, -1.516484, -4.176799, 1, 0.1843137, 0, 1,
-1.808439, 0.1109823, -0.7104351, 1, 0.1921569, 0, 1,
-1.795478, -0.7955339, -1.992884, 1, 0.1960784, 0, 1,
-1.794829, 0.8098965, -2.482316, 1, 0.2039216, 0, 1,
-1.79157, 1.109605, -0.6935979, 1, 0.2117647, 0, 1,
-1.790417, 0.8219965, -1.247286, 1, 0.2156863, 0, 1,
-1.75586, -0.3147562, -1.741918, 1, 0.2235294, 0, 1,
-1.745739, 1.467162, -2.130517, 1, 0.227451, 0, 1,
-1.740805, -0.02271243, -1.795499, 1, 0.2352941, 0, 1,
-1.740698, -0.5155264, -0.08992866, 1, 0.2392157, 0, 1,
-1.731702, 1.511927, -0.3526942, 1, 0.2470588, 0, 1,
-1.725666, 1.453575, -0.9813477, 1, 0.2509804, 0, 1,
-1.722353, 1.102417, -1.541813, 1, 0.2588235, 0, 1,
-1.717826, -0.07461128, -2.094581, 1, 0.2627451, 0, 1,
-1.714844, 1.337169, -2.845934, 1, 0.2705882, 0, 1,
-1.693416, -0.1845118, -1.007491, 1, 0.2745098, 0, 1,
-1.690509, 1.264297, -1.147687, 1, 0.282353, 0, 1,
-1.68318, 0.1951875, -0.7062643, 1, 0.2862745, 0, 1,
-1.680086, 0.2036628, -0.07928941, 1, 0.2941177, 0, 1,
-1.665765, -0.2942214, -0.5086789, 1, 0.3019608, 0, 1,
-1.665365, 0.3763963, -2.002526, 1, 0.3058824, 0, 1,
-1.665304, -0.2079817, -1.61839, 1, 0.3137255, 0, 1,
-1.651101, 1.754693, -1.108797, 1, 0.3176471, 0, 1,
-1.643868, -2.009991, -0.7930576, 1, 0.3254902, 0, 1,
-1.641737, -0.9076623, -1.298763, 1, 0.3294118, 0, 1,
-1.641155, 2.16046, -2.567054, 1, 0.3372549, 0, 1,
-1.631917, -0.4270341, -1.149747, 1, 0.3411765, 0, 1,
-1.617996, -1.462322, -3.07349, 1, 0.3490196, 0, 1,
-1.609338, -2.410312, -2.863754, 1, 0.3529412, 0, 1,
-1.606874, 1.614304, -0.5857666, 1, 0.3607843, 0, 1,
-1.605282, -1.955038, -1.56976, 1, 0.3647059, 0, 1,
-1.603855, -0.4889633, -2.46257, 1, 0.372549, 0, 1,
-1.584558, 1.052094, -1.259322, 1, 0.3764706, 0, 1,
-1.578339, 1.33059, -2.104709, 1, 0.3843137, 0, 1,
-1.563117, 0.3251868, -1.448678, 1, 0.3882353, 0, 1,
-1.562463, -1.325086, -2.538921, 1, 0.3960784, 0, 1,
-1.558567, -0.8059747, -1.05872, 1, 0.4039216, 0, 1,
-1.557326, -1.057538, -1.443475, 1, 0.4078431, 0, 1,
-1.552575, -0.07602429, -0.8923653, 1, 0.4156863, 0, 1,
-1.534521, -0.8739455, -2.087636, 1, 0.4196078, 0, 1,
-1.534037, -1.33068, -2.928218, 1, 0.427451, 0, 1,
-1.523799, -1.379791, -1.884525, 1, 0.4313726, 0, 1,
-1.523497, 0.1442954, -0.5229405, 1, 0.4392157, 0, 1,
-1.46831, -0.6232723, -3.124018, 1, 0.4431373, 0, 1,
-1.458241, -0.5803085, 0.4657453, 1, 0.4509804, 0, 1,
-1.454403, 0.5986483, -1.190849, 1, 0.454902, 0, 1,
-1.440332, 0.7366727, -1.375971, 1, 0.4627451, 0, 1,
-1.440242, -1.483764, -3.057513, 1, 0.4666667, 0, 1,
-1.43871, 0.0409447, -1.200525, 1, 0.4745098, 0, 1,
-1.438154, 0.8033519, -0.6583515, 1, 0.4784314, 0, 1,
-1.436513, -0.1422764, -1.167809, 1, 0.4862745, 0, 1,
-1.436125, -0.4721448, -1.88817, 1, 0.4901961, 0, 1,
-1.433273, 0.7088118, -2.169158, 1, 0.4980392, 0, 1,
-1.432117, -0.2414312, -1.260933, 1, 0.5058824, 0, 1,
-1.413327, -1.837062, -2.28943, 1, 0.509804, 0, 1,
-1.408809, -0.272756, -0.2839289, 1, 0.5176471, 0, 1,
-1.384315, -0.01634912, -1.778319, 1, 0.5215687, 0, 1,
-1.377213, 0.0683445, -1.988189, 1, 0.5294118, 0, 1,
-1.36148, 0.07815727, -1.016219, 1, 0.5333334, 0, 1,
-1.359245, -1.039172, -0.831728, 1, 0.5411765, 0, 1,
-1.344651, -0.4733208, -2.859104, 1, 0.5450981, 0, 1,
-1.343188, 0.09693236, -0.9367787, 1, 0.5529412, 0, 1,
-1.342882, -1.106011, -2.119742, 1, 0.5568628, 0, 1,
-1.336319, 1.791602, 0.08487238, 1, 0.5647059, 0, 1,
-1.334707, 0.1133811, -1.558965, 1, 0.5686275, 0, 1,
-1.333515, -0.7675591, -2.119658, 1, 0.5764706, 0, 1,
-1.319382, -1.79196, -2.610207, 1, 0.5803922, 0, 1,
-1.316059, 0.553889, -0.5229763, 1, 0.5882353, 0, 1,
-1.311371, -0.2983302, -2.415873, 1, 0.5921569, 0, 1,
-1.307034, -2.677618, -3.954796, 1, 0.6, 0, 1,
-1.306866, -0.5007189, -0.9386899, 1, 0.6078432, 0, 1,
-1.305201, -0.7700188, -2.255976, 1, 0.6117647, 0, 1,
-1.297847, -0.6278752, -0.9348799, 1, 0.6196079, 0, 1,
-1.297546, 0.1067797, -2.563951, 1, 0.6235294, 0, 1,
-1.295169, 1.435349, -0.8848222, 1, 0.6313726, 0, 1,
-1.285545, -0.6456147, -3.335061, 1, 0.6352941, 0, 1,
-1.281173, -1.927319, -1.944387, 1, 0.6431373, 0, 1,
-1.270709, 1.292611, -2.032914, 1, 0.6470588, 0, 1,
-1.255553, 1.152535, -0.2548683, 1, 0.654902, 0, 1,
-1.254246, -0.4452733, -2.09317, 1, 0.6588235, 0, 1,
-1.251701, -0.05448698, -1.1141, 1, 0.6666667, 0, 1,
-1.248659, -1.089484, -2.54175, 1, 0.6705883, 0, 1,
-1.247353, -0.06630631, -0.2408684, 1, 0.6784314, 0, 1,
-1.242208, -0.5604084, -1.610984, 1, 0.682353, 0, 1,
-1.239585, -0.3352486, -1.748811, 1, 0.6901961, 0, 1,
-1.233543, 0.1739287, -2.202955, 1, 0.6941177, 0, 1,
-1.23129, 0.4171228, 0.2126512, 1, 0.7019608, 0, 1,
-1.22274, 0.4161465, -0.6525248, 1, 0.7098039, 0, 1,
-1.221689, 0.4224587, -1.67874, 1, 0.7137255, 0, 1,
-1.218091, -0.424555, -2.894297, 1, 0.7215686, 0, 1,
-1.21256, 0.3112355, -2.634828, 1, 0.7254902, 0, 1,
-1.211094, -1.536812, -2.691977, 1, 0.7333333, 0, 1,
-1.205507, -0.0900701, -2.056796, 1, 0.7372549, 0, 1,
-1.191959, 1.09557, -0.630962, 1, 0.7450981, 0, 1,
-1.184803, 0.3419119, -0.3169335, 1, 0.7490196, 0, 1,
-1.182166, -0.5079636, -1.469389, 1, 0.7568628, 0, 1,
-1.171494, -1.499848, -1.248376, 1, 0.7607843, 0, 1,
-1.169718, -1.114171, -3.056498, 1, 0.7686275, 0, 1,
-1.158239, 0.850307, -0.8166698, 1, 0.772549, 0, 1,
-1.1571, 0.03350217, -3.633706, 1, 0.7803922, 0, 1,
-1.14494, -0.325716, -3.060826, 1, 0.7843137, 0, 1,
-1.142148, -0.3827623, -0.7957548, 1, 0.7921569, 0, 1,
-1.136725, 0.4098639, 0.7191802, 1, 0.7960784, 0, 1,
-1.135117, 1.430838, -1.018506, 1, 0.8039216, 0, 1,
-1.130932, 0.1819604, -0.105281, 1, 0.8117647, 0, 1,
-1.122367, -1.599577, -2.942637, 1, 0.8156863, 0, 1,
-1.116714, -0.1460747, -1.2836, 1, 0.8235294, 0, 1,
-1.097654, -1.752773, -2.191074, 1, 0.827451, 0, 1,
-1.096273, -0.5919691, -2.777549, 1, 0.8352941, 0, 1,
-1.093108, 0.5323027, -1.077325, 1, 0.8392157, 0, 1,
-1.092871, 1.455156, -1.812582, 1, 0.8470588, 0, 1,
-1.086981, -1.910782, -3.118469, 1, 0.8509804, 0, 1,
-1.084226, -0.03854262, -2.771406, 1, 0.8588235, 0, 1,
-1.07392, -1.515869, -0.6788857, 1, 0.8627451, 0, 1,
-1.068989, -0.7004237, -2.966134, 1, 0.8705882, 0, 1,
-1.063115, -0.1413253, -2.4, 1, 0.8745098, 0, 1,
-1.062019, -0.6728861, -3.937179, 1, 0.8823529, 0, 1,
-1.060807, 0.4151452, -0.6809337, 1, 0.8862745, 0, 1,
-1.057507, -1.707258, -3.73791, 1, 0.8941177, 0, 1,
-1.057196, 0.258399, 0.2458444, 1, 0.8980392, 0, 1,
-1.054403, -0.3240971, -1.061488, 1, 0.9058824, 0, 1,
-1.052451, -0.6137878, -2.866352, 1, 0.9137255, 0, 1,
-1.052098, -1.214603, -2.798919, 1, 0.9176471, 0, 1,
-1.051054, -0.458448, -3.96407, 1, 0.9254902, 0, 1,
-1.049348, 0.5679356, -1.178834, 1, 0.9294118, 0, 1,
-1.04501, 0.06899765, -1.11864, 1, 0.9372549, 0, 1,
-1.044024, -1.066602, -2.229718, 1, 0.9411765, 0, 1,
-1.039853, -0.04044497, -2.515761, 1, 0.9490196, 0, 1,
-1.026004, 0.3189884, -0.07993088, 1, 0.9529412, 0, 1,
-1.022466, 0.6159056, -1.093272, 1, 0.9607843, 0, 1,
-1.021688, -0.751753, -4.336781, 1, 0.9647059, 0, 1,
-1.014248, -1.378227, -2.736357, 1, 0.972549, 0, 1,
-1.010277, -1.422574, -2.50831, 1, 0.9764706, 0, 1,
-1.005347, 1.276322, 1.295634, 1, 0.9843137, 0, 1,
-1.001207, 2.043513, -0.6351658, 1, 0.9882353, 0, 1,
-1.000403, 1.127478, -0.0299777, 1, 0.9960784, 0, 1,
-0.9999724, -1.579111, -1.825218, 0.9960784, 1, 0, 1,
-0.9996821, 0.4337043, -1.888206, 0.9921569, 1, 0, 1,
-0.9979406, -0.5955544, -3.426319, 0.9843137, 1, 0, 1,
-0.9971936, 1.770255, 0.1081961, 0.9803922, 1, 0, 1,
-0.9924372, -0.3470866, -2.833814, 0.972549, 1, 0, 1,
-0.9806858, -0.6816597, -1.196056, 0.9686275, 1, 0, 1,
-0.9802653, -0.9419264, -1.783936, 0.9607843, 1, 0, 1,
-0.9799666, -0.09703609, -2.486775, 0.9568627, 1, 0, 1,
-0.9799314, 0.2366817, -1.509644, 0.9490196, 1, 0, 1,
-0.9707149, 1.393042, -1.541981, 0.945098, 1, 0, 1,
-0.9642289, -1.486995, -2.346621, 0.9372549, 1, 0, 1,
-0.9626319, 0.8946802, 0.07663103, 0.9333333, 1, 0, 1,
-0.9626287, -1.024882, -2.608947, 0.9254902, 1, 0, 1,
-0.9599271, 0.6966841, 0.5689007, 0.9215686, 1, 0, 1,
-0.9598725, 0.9935372, -1.996839, 0.9137255, 1, 0, 1,
-0.9585688, -0.3574448, -1.932995, 0.9098039, 1, 0, 1,
-0.9555492, 0.5230581, -1.7792, 0.9019608, 1, 0, 1,
-0.9537098, -0.3273902, -0.9561027, 0.8941177, 1, 0, 1,
-0.9413637, 0.1211302, -1.546133, 0.8901961, 1, 0, 1,
-0.9402775, -0.5584104, -2.408367, 0.8823529, 1, 0, 1,
-0.9395368, -0.6151975, -3.411908, 0.8784314, 1, 0, 1,
-0.9381822, -0.5397695, -2.806475, 0.8705882, 1, 0, 1,
-0.9332507, -0.6851235, -3.487446, 0.8666667, 1, 0, 1,
-0.932058, -1.07051, -2.282862, 0.8588235, 1, 0, 1,
-0.9291177, 1.735349, 1.802484, 0.854902, 1, 0, 1,
-0.9255821, -1.567528, -3.015352, 0.8470588, 1, 0, 1,
-0.9165068, 1.399476, 0.3404227, 0.8431373, 1, 0, 1,
-0.9114589, 0.7143736, -0.9734477, 0.8352941, 1, 0, 1,
-0.9091805, 1.219436, -0.403807, 0.8313726, 1, 0, 1,
-0.8974636, -0.9046888, -2.385367, 0.8235294, 1, 0, 1,
-0.8974188, -0.6410717, -1.930544, 0.8196079, 1, 0, 1,
-0.8902948, 0.6264793, -1.716817, 0.8117647, 1, 0, 1,
-0.8874846, 1.997153, 0.7333296, 0.8078431, 1, 0, 1,
-0.8832625, -0.3320275, -2.676848, 0.8, 1, 0, 1,
-0.8779811, 0.2816295, -1.045348, 0.7921569, 1, 0, 1,
-0.874301, -0.8286712, -1.175611, 0.7882353, 1, 0, 1,
-0.8658851, 0.3049352, 0.1292459, 0.7803922, 1, 0, 1,
-0.8652995, 2.201242, -2.97624, 0.7764706, 1, 0, 1,
-0.8647379, 0.4639947, 0.454925, 0.7686275, 1, 0, 1,
-0.8623686, 1.49507, -1.884224, 0.7647059, 1, 0, 1,
-0.8553417, 1.034213, -1.79529, 0.7568628, 1, 0, 1,
-0.854988, 2.338685, -0.2317893, 0.7529412, 1, 0, 1,
-0.8420455, 0.1279193, -0.8247988, 0.7450981, 1, 0, 1,
-0.8412812, 0.7486083, 0.5724803, 0.7411765, 1, 0, 1,
-0.8333079, 0.3200626, -1.445799, 0.7333333, 1, 0, 1,
-0.8230928, -0.02783856, -1.503513, 0.7294118, 1, 0, 1,
-0.8213603, -0.1050125, -3.377827, 0.7215686, 1, 0, 1,
-0.8208798, -1.507269, -1.755494, 0.7176471, 1, 0, 1,
-0.8202403, 0.546717, 0.1822731, 0.7098039, 1, 0, 1,
-0.8151698, 0.7799854, 0.5034122, 0.7058824, 1, 0, 1,
-0.8118982, -0.1887609, -1.648561, 0.6980392, 1, 0, 1,
-0.8106573, 0.05422689, -2.355221, 0.6901961, 1, 0, 1,
-0.8093492, -0.3060694, -1.342245, 0.6862745, 1, 0, 1,
-0.8063168, 0.5990021, -1.498068, 0.6784314, 1, 0, 1,
-0.8060463, -1.885329, -3.057059, 0.6745098, 1, 0, 1,
-0.8028579, -0.7986936, -3.083218, 0.6666667, 1, 0, 1,
-0.795919, -0.8955352, -4.223894, 0.6627451, 1, 0, 1,
-0.7912732, -0.5432458, -1.813904, 0.654902, 1, 0, 1,
-0.774843, -1.1534, -2.952135, 0.6509804, 1, 0, 1,
-0.7741613, -0.1163492, -1.013057, 0.6431373, 1, 0, 1,
-0.7700412, -1.966504, -2.937949, 0.6392157, 1, 0, 1,
-0.767481, 0.1662506, -2.076453, 0.6313726, 1, 0, 1,
-0.7668002, 1.156543, 0.32348, 0.627451, 1, 0, 1,
-0.7628688, -0.05201213, -2.495959, 0.6196079, 1, 0, 1,
-0.7579755, 2.072422, 0.839356, 0.6156863, 1, 0, 1,
-0.7576495, 2.038792, 1.425255, 0.6078432, 1, 0, 1,
-0.75605, -0.3933133, -4.723595, 0.6039216, 1, 0, 1,
-0.7536183, -0.3039019, -0.3712686, 0.5960785, 1, 0, 1,
-0.7532335, 1.17867, -1.04507, 0.5882353, 1, 0, 1,
-0.7511275, -2.200091, -4.29554, 0.5843138, 1, 0, 1,
-0.751038, -0.4704632, -1.877657, 0.5764706, 1, 0, 1,
-0.7495108, -0.7397171, -3.827893, 0.572549, 1, 0, 1,
-0.7462357, -0.5908328, -0.924086, 0.5647059, 1, 0, 1,
-0.7397781, -0.1360815, -1.574156, 0.5607843, 1, 0, 1,
-0.7361423, 0.7712565, -1.338709, 0.5529412, 1, 0, 1,
-0.7338658, 2.64358, -2.229514, 0.5490196, 1, 0, 1,
-0.7287726, 0.3240233, -2.512691, 0.5411765, 1, 0, 1,
-0.7264507, 1.873458, -1.334667, 0.5372549, 1, 0, 1,
-0.7260501, 0.7861637, -0.9268354, 0.5294118, 1, 0, 1,
-0.7234643, 0.2093427, -0.5788609, 0.5254902, 1, 0, 1,
-0.7214462, 1.12973, -0.783303, 0.5176471, 1, 0, 1,
-0.7178323, 1.293964, 0.1506564, 0.5137255, 1, 0, 1,
-0.7126644, -0.4644221, -2.016731, 0.5058824, 1, 0, 1,
-0.7067918, -1.575865, -2.528414, 0.5019608, 1, 0, 1,
-0.7062486, -0.2962678, -3.980568, 0.4941176, 1, 0, 1,
-0.6972865, 0.9667659, 1.74729, 0.4862745, 1, 0, 1,
-0.696319, 0.8361031, -0.2408009, 0.4823529, 1, 0, 1,
-0.6887431, -0.06242616, 0.6941923, 0.4745098, 1, 0, 1,
-0.6854367, 1.26691, 0.2373513, 0.4705882, 1, 0, 1,
-0.6808178, -0.4997307, -0.6848563, 0.4627451, 1, 0, 1,
-0.6803421, 1.418024, -0.3002091, 0.4588235, 1, 0, 1,
-0.679757, 0.1379106, -1.636553, 0.4509804, 1, 0, 1,
-0.6775175, 0.2856542, 0.1151886, 0.4470588, 1, 0, 1,
-0.6736465, 0.666279, -0.8326524, 0.4392157, 1, 0, 1,
-0.6660859, 0.3133704, -0.7878509, 0.4352941, 1, 0, 1,
-0.6649314, 1.335734, -0.3837056, 0.427451, 1, 0, 1,
-0.6622831, -0.6732172, -3.977991, 0.4235294, 1, 0, 1,
-0.6590564, 0.4296925, -1.125459, 0.4156863, 1, 0, 1,
-0.6545218, -0.2157559, -2.670268, 0.4117647, 1, 0, 1,
-0.6524872, 0.2243488, -0.2948904, 0.4039216, 1, 0, 1,
-0.6499059, -1.373789, -2.596958, 0.3960784, 1, 0, 1,
-0.6422927, 0.1227749, -2.201365, 0.3921569, 1, 0, 1,
-0.6420795, 0.6566635, -1.6654, 0.3843137, 1, 0, 1,
-0.6401693, -0.2954823, -1.088392, 0.3803922, 1, 0, 1,
-0.6388982, 0.806471, -0.2180968, 0.372549, 1, 0, 1,
-0.6371207, -0.08143671, -1.654253, 0.3686275, 1, 0, 1,
-0.6353288, 1.223517, -0.8156757, 0.3607843, 1, 0, 1,
-0.6323059, 0.4142105, 0.9213215, 0.3568628, 1, 0, 1,
-0.6319776, 0.8543073, 0.2062629, 0.3490196, 1, 0, 1,
-0.6312017, -0.511609, -0.7352225, 0.345098, 1, 0, 1,
-0.6294008, 0.6459338, -2.426573, 0.3372549, 1, 0, 1,
-0.628983, 0.1153018, -1.630446, 0.3333333, 1, 0, 1,
-0.6249343, 0.7043332, -2.169517, 0.3254902, 1, 0, 1,
-0.6236825, 0.2932056, -2.781258, 0.3215686, 1, 0, 1,
-0.6230813, 0.1061136, -0.2299065, 0.3137255, 1, 0, 1,
-0.6224624, -0.2148002, -0.5272578, 0.3098039, 1, 0, 1,
-0.6214509, 0.2668059, -1.791009, 0.3019608, 1, 0, 1,
-0.6191764, 1.222572, 0.1822522, 0.2941177, 1, 0, 1,
-0.6093603, -0.4907497, -2.713639, 0.2901961, 1, 0, 1,
-0.6038741, -0.6110759, -2.721593, 0.282353, 1, 0, 1,
-0.6028715, 0.4681852, -1.741765, 0.2784314, 1, 0, 1,
-0.5949227, 0.6090347, -0.8548691, 0.2705882, 1, 0, 1,
-0.5936698, 0.2078238, -2.953432, 0.2666667, 1, 0, 1,
-0.5902327, -1.012985, -2.627638, 0.2588235, 1, 0, 1,
-0.5891107, 0.3227428, -1.005323, 0.254902, 1, 0, 1,
-0.587105, -0.09256541, -2.335576, 0.2470588, 1, 0, 1,
-0.5838949, 0.1063521, -1.622977, 0.2431373, 1, 0, 1,
-0.5821776, 1.177428, 0.2121798, 0.2352941, 1, 0, 1,
-0.5727634, -1.152947, -3.531064, 0.2313726, 1, 0, 1,
-0.5699574, -0.03111423, -1.680042, 0.2235294, 1, 0, 1,
-0.5632687, -1.333044, -2.36251, 0.2196078, 1, 0, 1,
-0.562147, 0.2428106, -1.027251, 0.2117647, 1, 0, 1,
-0.5612558, 1.190092, -0.5799488, 0.2078431, 1, 0, 1,
-0.554751, 0.1788083, -1.663936, 0.2, 1, 0, 1,
-0.5541342, -0.4152873, -1.409971, 0.1921569, 1, 0, 1,
-0.5531238, 1.882306, 0.4338524, 0.1882353, 1, 0, 1,
-0.5488259, -1.879676, -4.017259, 0.1803922, 1, 0, 1,
-0.5478786, 2.410747, 1.109281, 0.1764706, 1, 0, 1,
-0.5477132, -1.058988, -0.9513607, 0.1686275, 1, 0, 1,
-0.5306315, -0.3186163, -2.191722, 0.1647059, 1, 0, 1,
-0.5297442, 0.3363033, -1.263143, 0.1568628, 1, 0, 1,
-0.5275468, 1.177669, 0.3237765, 0.1529412, 1, 0, 1,
-0.5250481, -0.8456425, -4.267055, 0.145098, 1, 0, 1,
-0.5231552, -0.02113664, -1.829931, 0.1411765, 1, 0, 1,
-0.5230288, 0.3415742, -1.839403, 0.1333333, 1, 0, 1,
-0.5202225, -0.2924319, -1.199326, 0.1294118, 1, 0, 1,
-0.5194367, 0.9506412, 0.2206449, 0.1215686, 1, 0, 1,
-0.5051848, -1.071885, -3.207676, 0.1176471, 1, 0, 1,
-0.5026278, 0.6061667, -0.7456686, 0.1098039, 1, 0, 1,
-0.4973192, 1.740627, -0.2088152, 0.1058824, 1, 0, 1,
-0.4969749, 0.01796308, -2.135852, 0.09803922, 1, 0, 1,
-0.496592, 0.4798055, 0.3444783, 0.09019608, 1, 0, 1,
-0.4958902, 0.7872913, -2.494545, 0.08627451, 1, 0, 1,
-0.4955424, -1.901599, -2.133717, 0.07843138, 1, 0, 1,
-0.4912438, 0.7260672, -1.662825, 0.07450981, 1, 0, 1,
-0.4899877, -1.713684, -4.538064, 0.06666667, 1, 0, 1,
-0.4876177, -0.3703335, -2.539383, 0.0627451, 1, 0, 1,
-0.4825122, 0.1195052, -1.447418, 0.05490196, 1, 0, 1,
-0.4813561, 0.3375362, -2.56596, 0.05098039, 1, 0, 1,
-0.4758147, 0.8764639, 0.158146, 0.04313726, 1, 0, 1,
-0.4751131, -0.9051084, -1.929271, 0.03921569, 1, 0, 1,
-0.471626, -0.203241, -2.566782, 0.03137255, 1, 0, 1,
-0.4711756, 0.7605209, -0.7930304, 0.02745098, 1, 0, 1,
-0.4595588, 0.6664577, 1.203324, 0.01960784, 1, 0, 1,
-0.4577743, -1.427201, -2.738722, 0.01568628, 1, 0, 1,
-0.4546558, 2.531819, -0.6987598, 0.007843138, 1, 0, 1,
-0.4528154, -0.5582763, -4.218509, 0.003921569, 1, 0, 1,
-0.4511811, 0.2334253, -1.77281, 0, 1, 0.003921569, 1,
-0.4477079, -1.335491, -2.052977, 0, 1, 0.01176471, 1,
-0.4470169, -0.9556782, -3.332026, 0, 1, 0.01568628, 1,
-0.4438799, -1.353892, -2.069315, 0, 1, 0.02352941, 1,
-0.4427705, 1.080056, -1.508262, 0, 1, 0.02745098, 1,
-0.4420157, 0.2105287, -1.984412, 0, 1, 0.03529412, 1,
-0.4416243, -0.6062363, -2.861601, 0, 1, 0.03921569, 1,
-0.4414364, 0.5679359, -0.2855721, 0, 1, 0.04705882, 1,
-0.4402351, -0.7574751, -2.078852, 0, 1, 0.05098039, 1,
-0.4379297, -0.9755217, -3.188521, 0, 1, 0.05882353, 1,
-0.4355977, 0.1500587, -2.263398, 0, 1, 0.0627451, 1,
-0.43552, -0.4526545, -3.313997, 0, 1, 0.07058824, 1,
-0.4336793, -0.4198763, -2.309072, 0, 1, 0.07450981, 1,
-0.4334952, -0.783915, -2.924314, 0, 1, 0.08235294, 1,
-0.4322128, 0.4230789, -0.9477953, 0, 1, 0.08627451, 1,
-0.4317455, -0.9296557, -1.784268, 0, 1, 0.09411765, 1,
-0.4299444, -1.084969, -3.455953, 0, 1, 0.1019608, 1,
-0.4258539, -0.3826502, -2.179216, 0, 1, 0.1058824, 1,
-0.424093, -0.04165257, -1.687057, 0, 1, 0.1137255, 1,
-0.4226443, -0.06042449, -1.81015, 0, 1, 0.1176471, 1,
-0.4219868, 0.4025811, -0.6521961, 0, 1, 0.1254902, 1,
-0.4202036, 0.5462895, 1.398338, 0, 1, 0.1294118, 1,
-0.4198213, -0.8460656, -1.676474, 0, 1, 0.1372549, 1,
-0.4192436, 0.1040411, -1.210739, 0, 1, 0.1411765, 1,
-0.4188057, -0.9063854, -2.108945, 0, 1, 0.1490196, 1,
-0.4149202, -0.4167138, -2.292859, 0, 1, 0.1529412, 1,
-0.4120193, 0.5217457, -2.030993, 0, 1, 0.1607843, 1,
-0.4113575, -1.009789, -2.858669, 0, 1, 0.1647059, 1,
-0.4082706, -0.8955143, -2.570897, 0, 1, 0.172549, 1,
-0.4037038, -1.800725, -1.79992, 0, 1, 0.1764706, 1,
-0.4030342, -0.2064471, -1.498981, 0, 1, 0.1843137, 1,
-0.4024345, 1.546122, 0.1880794, 0, 1, 0.1882353, 1,
-0.3973782, 0.8292363, 1.244987, 0, 1, 0.1960784, 1,
-0.3964124, 1.661726, -0.3470042, 0, 1, 0.2039216, 1,
-0.3953944, -1.134667, -2.499112, 0, 1, 0.2078431, 1,
-0.3928111, -0.101045, -0.4270441, 0, 1, 0.2156863, 1,
-0.3919634, -0.1560956, -1.237074, 0, 1, 0.2196078, 1,
-0.3904603, -0.5391412, -1.215342, 0, 1, 0.227451, 1,
-0.3898251, -0.5109199, -3.014565, 0, 1, 0.2313726, 1,
-0.3892343, 0.8307696, -1.560816, 0, 1, 0.2392157, 1,
-0.3891056, -0.349818, -1.827764, 0, 1, 0.2431373, 1,
-0.3868195, -0.3762235, -3.713409, 0, 1, 0.2509804, 1,
-0.3852878, 1.132659, 1.027158, 0, 1, 0.254902, 1,
-0.3840713, -1.094089, -3.760021, 0, 1, 0.2627451, 1,
-0.3829859, -0.9769766, -1.742461, 0, 1, 0.2666667, 1,
-0.3826493, -1.001177, -3.725599, 0, 1, 0.2745098, 1,
-0.3793474, -0.6403899, -2.781314, 0, 1, 0.2784314, 1,
-0.3783916, 0.6022232, -0.228563, 0, 1, 0.2862745, 1,
-0.3774564, 0.1194875, -0.02280903, 0, 1, 0.2901961, 1,
-0.3768363, -0.2967378, 0.3536702, 0, 1, 0.2980392, 1,
-0.3761894, -0.3630072, -2.959214, 0, 1, 0.3058824, 1,
-0.3760773, 0.4958256, 0.6066708, 0, 1, 0.3098039, 1,
-0.3753464, -0.5991899, -1.718464, 0, 1, 0.3176471, 1,
-0.3712029, 0.1187456, -1.078301, 0, 1, 0.3215686, 1,
-0.3699326, 0.03768522, -1.551427, 0, 1, 0.3294118, 1,
-0.3610922, 0.7314019, -1.340712, 0, 1, 0.3333333, 1,
-0.3524653, 1.049319, 3.328357, 0, 1, 0.3411765, 1,
-0.3496323, 0.1366888, -1.269239, 0, 1, 0.345098, 1,
-0.3482835, -0.413216, -2.92858, 0, 1, 0.3529412, 1,
-0.3464877, 2.468313, 0.400405, 0, 1, 0.3568628, 1,
-0.3418174, 1.038512, 0.2694591, 0, 1, 0.3647059, 1,
-0.3377393, 0.8096141, -0.7664654, 0, 1, 0.3686275, 1,
-0.3335527, 1.191725, 0.5648913, 0, 1, 0.3764706, 1,
-0.3318912, -0.07063953, -2.678224, 0, 1, 0.3803922, 1,
-0.3299659, -0.8711183, -2.37746, 0, 1, 0.3882353, 1,
-0.3298149, -0.5057564, -2.422292, 0, 1, 0.3921569, 1,
-0.3194971, 0.3823306, -0.4012363, 0, 1, 0.4, 1,
-0.3173372, 0.1531156, -1.887753, 0, 1, 0.4078431, 1,
-0.3171031, 0.5708422, -2.110576, 0, 1, 0.4117647, 1,
-0.3162263, -0.3079852, -2.810229, 0, 1, 0.4196078, 1,
-0.3158863, 0.7323397, -1.290127, 0, 1, 0.4235294, 1,
-0.3142687, 0.007752556, -2.621497, 0, 1, 0.4313726, 1,
-0.3113779, -0.4177963, -1.983046, 0, 1, 0.4352941, 1,
-0.3089584, -0.3795672, -3.229556, 0, 1, 0.4431373, 1,
-0.3064347, 0.8573412, 0.3488466, 0, 1, 0.4470588, 1,
-0.3053188, 0.4958719, 0.2611431, 0, 1, 0.454902, 1,
-0.3048342, -1.6631, -1.787971, 0, 1, 0.4588235, 1,
-0.3014663, 0.3337595, 0.2077031, 0, 1, 0.4666667, 1,
-0.2996308, -2.402424, -3.881405, 0, 1, 0.4705882, 1,
-0.2980814, -0.03486806, -0.8726746, 0, 1, 0.4784314, 1,
-0.2948507, 1.968355, 0.3200247, 0, 1, 0.4823529, 1,
-0.2932646, -0.6865627, -3.256862, 0, 1, 0.4901961, 1,
-0.2904122, 0.6243876, -0.5924542, 0, 1, 0.4941176, 1,
-0.2859816, -0.3281501, -1.337585, 0, 1, 0.5019608, 1,
-0.2841139, 1.257944, 1.558526, 0, 1, 0.509804, 1,
-0.2839792, -0.1536312, -3.610502, 0, 1, 0.5137255, 1,
-0.282524, 0.6570416, 0.6344303, 0, 1, 0.5215687, 1,
-0.2782899, -1.436261, -3.484261, 0, 1, 0.5254902, 1,
-0.2738842, -1.099804, -3.351293, 0, 1, 0.5333334, 1,
-0.265433, -1.242602, -1.50769, 0, 1, 0.5372549, 1,
-0.2652102, -0.6634032, -1.274333, 0, 1, 0.5450981, 1,
-0.2651725, 1.102517, -0.1457997, 0, 1, 0.5490196, 1,
-0.2588119, -0.1507295, -1.730519, 0, 1, 0.5568628, 1,
-0.2568201, -0.7755309, -2.866183, 0, 1, 0.5607843, 1,
-0.2565041, 0.1230562, -1.022219, 0, 1, 0.5686275, 1,
-0.2560395, -0.9928105, -2.160221, 0, 1, 0.572549, 1,
-0.2553146, -0.663277, -3.035561, 0, 1, 0.5803922, 1,
-0.2531034, 0.2455773, -0.9946142, 0, 1, 0.5843138, 1,
-0.2469334, 0.5704743, -0.1530167, 0, 1, 0.5921569, 1,
-0.2454699, -0.8829558, -2.898939, 0, 1, 0.5960785, 1,
-0.2414684, -0.328087, -1.844848, 0, 1, 0.6039216, 1,
-0.2411939, 0.7349923, 0.2982817, 0, 1, 0.6117647, 1,
-0.2385527, -1.974836, -2.267737, 0, 1, 0.6156863, 1,
-0.2314493, 1.17248, 0.7174554, 0, 1, 0.6235294, 1,
-0.2290876, 0.5022529, -0.2456681, 0, 1, 0.627451, 1,
-0.2280626, 1.325408, 0.7083144, 0, 1, 0.6352941, 1,
-0.2279169, 1.268741, -0.718523, 0, 1, 0.6392157, 1,
-0.2254534, -0.9204653, -2.103113, 0, 1, 0.6470588, 1,
-0.2146918, -1.111359, -2.025082, 0, 1, 0.6509804, 1,
-0.2140609, 0.1724267, -1.62118, 0, 1, 0.6588235, 1,
-0.2111677, 0.4760431, 0.2649636, 0, 1, 0.6627451, 1,
-0.2105599, 0.07599056, -1.632551, 0, 1, 0.6705883, 1,
-0.2091867, -1.006407, -3.384345, 0, 1, 0.6745098, 1,
-0.2027403, -1.804016, -3.426145, 0, 1, 0.682353, 1,
-0.2001466, -1.094006, -1.288415, 0, 1, 0.6862745, 1,
-0.1985061, 0.8297901, 1.475209, 0, 1, 0.6941177, 1,
-0.1972115, 0.8550427, -0.7258134, 0, 1, 0.7019608, 1,
-0.1947719, -0.3297112, -1.199628, 0, 1, 0.7058824, 1,
-0.1886561, -0.7017518, -2.824647, 0, 1, 0.7137255, 1,
-0.1862778, -0.2672716, -2.697433, 0, 1, 0.7176471, 1,
-0.1803112, -0.1310753, -2.654166, 0, 1, 0.7254902, 1,
-0.1789195, -0.4109109, -3.184029, 0, 1, 0.7294118, 1,
-0.1779332, -0.8831235, -4.2242, 0, 1, 0.7372549, 1,
-0.1776787, 0.793674, -0.4087339, 0, 1, 0.7411765, 1,
-0.173344, 0.7165486, 0.3398699, 0, 1, 0.7490196, 1,
-0.1733245, 1.931843, 1.443106, 0, 1, 0.7529412, 1,
-0.1731075, 0.2874326, 0.2751713, 0, 1, 0.7607843, 1,
-0.1726904, -0.1413327, -2.989989, 0, 1, 0.7647059, 1,
-0.1639284, -0.3935407, -4.035063, 0, 1, 0.772549, 1,
-0.1622568, -0.0379265, -2.931023, 0, 1, 0.7764706, 1,
-0.1611883, 0.6150857, -0.2992078, 0, 1, 0.7843137, 1,
-0.1579732, 2.260509, 1.943476, 0, 1, 0.7882353, 1,
-0.1568857, -1.063448, -2.571797, 0, 1, 0.7960784, 1,
-0.1552382, -0.8423398, -1.359051, 0, 1, 0.8039216, 1,
-0.1495779, -0.08734065, -0.3847573, 0, 1, 0.8078431, 1,
-0.1429366, 0.3006403, 0.3026315, 0, 1, 0.8156863, 1,
-0.1419939, -1.908933, -4.118575, 0, 1, 0.8196079, 1,
-0.1369894, -0.2740242, -3.315883, 0, 1, 0.827451, 1,
-0.1313841, -0.7918881, -3.616034, 0, 1, 0.8313726, 1,
-0.1301922, -1.617253, -2.576055, 0, 1, 0.8392157, 1,
-0.1283435, 1.515214, 0.8197276, 0, 1, 0.8431373, 1,
-0.1225582, -0.5433607, -3.418343, 0, 1, 0.8509804, 1,
-0.114677, 0.1453277, -0.6301317, 0, 1, 0.854902, 1,
-0.1063747, -0.909806, -2.716408, 0, 1, 0.8627451, 1,
-0.1015785, 1.567646, 0.6525733, 0, 1, 0.8666667, 1,
-0.09970918, 0.8458341, -0.1255919, 0, 1, 0.8745098, 1,
-0.09895309, 0.1070389, -1.444556, 0, 1, 0.8784314, 1,
-0.09729226, -0.9813212, -3.96387, 0, 1, 0.8862745, 1,
-0.09264085, 0.5436085, 0.3429626, 0, 1, 0.8901961, 1,
-0.09017884, -1.887089, -4.294126, 0, 1, 0.8980392, 1,
-0.09011021, 1.213706, 1.899596, 0, 1, 0.9058824, 1,
-0.08809467, 1.265479, 0.6204939, 0, 1, 0.9098039, 1,
-0.08785269, 0.2231248, -1.743236, 0, 1, 0.9176471, 1,
-0.08391975, -0.4846003, -2.589044, 0, 1, 0.9215686, 1,
-0.08041831, -1.928172, -2.20365, 0, 1, 0.9294118, 1,
-0.07503947, -0.1873956, -4.094634, 0, 1, 0.9333333, 1,
-0.07411041, -0.9563881, -3.263966, 0, 1, 0.9411765, 1,
-0.06999878, -0.8654758, -3.343296, 0, 1, 0.945098, 1,
-0.06332874, -0.2477422, -3.599543, 0, 1, 0.9529412, 1,
-0.06131337, 0.1474724, -1.488454, 0, 1, 0.9568627, 1,
-0.0603921, -0.8468016, -4.032288, 0, 1, 0.9647059, 1,
-0.05579373, -0.265362, -1.574611, 0, 1, 0.9686275, 1,
-0.05166538, -0.2823905, -4.050647, 0, 1, 0.9764706, 1,
-0.05065026, -0.1314983, -4.677762, 0, 1, 0.9803922, 1,
-0.04962686, 0.7844317, 0.6732841, 0, 1, 0.9882353, 1,
-0.04784933, -0.8880509, -4.518259, 0, 1, 0.9921569, 1,
-0.04779989, -1.025706, -3.902179, 0, 1, 1, 1,
-0.04256997, 1.461249, 1.536506, 0, 0.9921569, 1, 1,
-0.04119405, -2.356649, -4.439211, 0, 0.9882353, 1, 1,
-0.04026381, 0.7570515, 1.769769, 0, 0.9803922, 1, 1,
-0.03754723, 0.09106755, -3.491636, 0, 0.9764706, 1, 1,
-0.03706157, -0.1943602, -2.567469, 0, 0.9686275, 1, 1,
-0.02718971, 0.7758442, 0.423876, 0, 0.9647059, 1, 1,
-0.01923468, 0.6131601, 0.6259891, 0, 0.9568627, 1, 1,
-0.01855623, 0.4430915, -0.9199792, 0, 0.9529412, 1, 1,
-0.01749654, 0.218506, 0.03735211, 0, 0.945098, 1, 1,
-0.01741908, 0.211672, -1.226612, 0, 0.9411765, 1, 1,
-0.01379078, -0.6641623, -3.042299, 0, 0.9333333, 1, 1,
-0.01221074, -0.2307623, -3.083212, 0, 0.9294118, 1, 1,
-0.01085605, 0.8701081, -0.7622217, 0, 0.9215686, 1, 1,
-0.01037139, -0.9152954, -2.706707, 0, 0.9176471, 1, 1,
-0.008812957, 1.883466, 0.7063736, 0, 0.9098039, 1, 1,
-0.007107371, 1.068372, 0.6148457, 0, 0.9058824, 1, 1,
-0.006710002, -0.1772687, -2.439706, 0, 0.8980392, 1, 1,
-0.006545777, 1.567527, -0.3730811, 0, 0.8901961, 1, 1,
-0.0001477044, 0.03142222, 0.5262038, 0, 0.8862745, 1, 1,
0.001184793, 0.2392927, 0.7365737, 0, 0.8784314, 1, 1,
0.00436361, -0.3381417, 3.735575, 0, 0.8745098, 1, 1,
0.006502439, -1.437726, 1.615991, 0, 0.8666667, 1, 1,
0.008955707, 1.157218, 0.9485105, 0, 0.8627451, 1, 1,
0.01497544, -1.595739, 4.664494, 0, 0.854902, 1, 1,
0.015629, -0.4067402, 3.094589, 0, 0.8509804, 1, 1,
0.01696997, 0.3166575, -0.07439855, 0, 0.8431373, 1, 1,
0.02063472, 0.1729085, 1.743567, 0, 0.8392157, 1, 1,
0.02121558, 0.6368945, 0.1150089, 0, 0.8313726, 1, 1,
0.02943217, 1.746501, 0.03857833, 0, 0.827451, 1, 1,
0.04321551, 0.8033026, 0.9398915, 0, 0.8196079, 1, 1,
0.04435696, 2.100987, -1.444701, 0, 0.8156863, 1, 1,
0.04595591, 0.00557577, 2.348333, 0, 0.8078431, 1, 1,
0.04611902, 0.2598431, -0.2393624, 0, 0.8039216, 1, 1,
0.04684681, 1.039893, 0.8982996, 0, 0.7960784, 1, 1,
0.04902223, 0.9401363, -0.6754177, 0, 0.7882353, 1, 1,
0.05067789, 0.5472816, -0.08076258, 0, 0.7843137, 1, 1,
0.05527686, 0.1582364, 1.285036, 0, 0.7764706, 1, 1,
0.05589207, 0.1108139, -0.3346862, 0, 0.772549, 1, 1,
0.05849537, -0.204583, 3.612487, 0, 0.7647059, 1, 1,
0.06008043, -1.253523, 3.13669, 0, 0.7607843, 1, 1,
0.06105376, -1.53942, 4.16233, 0, 0.7529412, 1, 1,
0.06246654, 1.557418, 2.021077, 0, 0.7490196, 1, 1,
0.07292686, -0.4335238, 3.857471, 0, 0.7411765, 1, 1,
0.07548104, 0.1127795, 0.4972907, 0, 0.7372549, 1, 1,
0.0755845, 1.473864, 0.2603361, 0, 0.7294118, 1, 1,
0.07631724, -0.8683835, -0.0590639, 0, 0.7254902, 1, 1,
0.0781524, -0.2654134, 2.754925, 0, 0.7176471, 1, 1,
0.08051753, -1.792626, 2.921105, 0, 0.7137255, 1, 1,
0.08438247, -0.5892063, 0.7490296, 0, 0.7058824, 1, 1,
0.08455724, 0.967181, -1.200362, 0, 0.6980392, 1, 1,
0.08602501, 0.07409928, 0.7278402, 0, 0.6941177, 1, 1,
0.09064288, 0.6798214, 0.904842, 0, 0.6862745, 1, 1,
0.09101895, -0.6786327, 2.481948, 0, 0.682353, 1, 1,
0.09851033, -0.9641754, 1.378855, 0, 0.6745098, 1, 1,
0.100171, -1.736518, 3.158522, 0, 0.6705883, 1, 1,
0.1057022, -0.2723095, 2.788788, 0, 0.6627451, 1, 1,
0.1087254, 0.916198, 1.22914, 0, 0.6588235, 1, 1,
0.1117703, 1.31078, 0.142442, 0, 0.6509804, 1, 1,
0.1117977, -1.425824, 3.712156, 0, 0.6470588, 1, 1,
0.1124232, -0.8324242, 5.733132, 0, 0.6392157, 1, 1,
0.1145077, -0.475252, 2.841119, 0, 0.6352941, 1, 1,
0.1172381, -0.9408314, 2.695397, 0, 0.627451, 1, 1,
0.1211304, 2.353324, -1.083093, 0, 0.6235294, 1, 1,
0.1238098, -1.20957, 5.173806, 0, 0.6156863, 1, 1,
0.128399, -0.3888541, 3.445572, 0, 0.6117647, 1, 1,
0.1354977, -1.595279, 2.436666, 0, 0.6039216, 1, 1,
0.1370118, -0.0287867, 2.297998, 0, 0.5960785, 1, 1,
0.1383516, -0.5779873, 4.244781, 0, 0.5921569, 1, 1,
0.1416098, -1.449709, 3.086772, 0, 0.5843138, 1, 1,
0.1441087, -0.7502589, 3.282167, 0, 0.5803922, 1, 1,
0.1462028, -0.01301664, 3.226608, 0, 0.572549, 1, 1,
0.1466565, 0.7629819, 0.3483101, 0, 0.5686275, 1, 1,
0.1501809, 0.7382889, -0.7017319, 0, 0.5607843, 1, 1,
0.1542147, 0.9602824, 1.315125, 0, 0.5568628, 1, 1,
0.1554012, -0.560997, 3.874367, 0, 0.5490196, 1, 1,
0.1571416, -0.1807015, 1.865152, 0, 0.5450981, 1, 1,
0.1577711, 0.2650153, 1.477877, 0, 0.5372549, 1, 1,
0.1599904, 0.8462639, 0.3156535, 0, 0.5333334, 1, 1,
0.1612777, -1.64468, 1.333503, 0, 0.5254902, 1, 1,
0.1648767, -2.31879, 2.924951, 0, 0.5215687, 1, 1,
0.1654051, 0.1556876, -0.2352185, 0, 0.5137255, 1, 1,
0.1676124, 1.67128, 0.7142141, 0, 0.509804, 1, 1,
0.1680617, -0.1170609, 1.713799, 0, 0.5019608, 1, 1,
0.1697847, 0.1015104, 1.580693, 0, 0.4941176, 1, 1,
0.1740745, -0.5809841, 2.88495, 0, 0.4901961, 1, 1,
0.1788573, 0.8717233, -1.207078, 0, 0.4823529, 1, 1,
0.1887626, 2.394719, -0.2127407, 0, 0.4784314, 1, 1,
0.1893393, -0.7826015, 3.102807, 0, 0.4705882, 1, 1,
0.1909568, 0.2741907, -1.393243, 0, 0.4666667, 1, 1,
0.1997867, -0.4110021, 2.029376, 0, 0.4588235, 1, 1,
0.2000052, -0.5673842, 3.173526, 0, 0.454902, 1, 1,
0.2010967, -0.4961488, 3.126546, 0, 0.4470588, 1, 1,
0.2025266, -0.5688024, 2.405668, 0, 0.4431373, 1, 1,
0.2032987, 2.076991, 0.447966, 0, 0.4352941, 1, 1,
0.2108661, -1.04149, 5.229526, 0, 0.4313726, 1, 1,
0.2137862, -1.538704, 4.078665, 0, 0.4235294, 1, 1,
0.2146893, 2.608618, 0.2684615, 0, 0.4196078, 1, 1,
0.2152647, 0.04768981, 1.026686, 0, 0.4117647, 1, 1,
0.2212332, -0.05558115, 3.169722, 0, 0.4078431, 1, 1,
0.2235892, 0.498252, 0.8771495, 0, 0.4, 1, 1,
0.22512, -1.695499, 3.236683, 0, 0.3921569, 1, 1,
0.2253001, -1.173874, 2.679907, 0, 0.3882353, 1, 1,
0.230332, 1.127649, -0.3950172, 0, 0.3803922, 1, 1,
0.2335771, 0.2497543, 0.6370603, 0, 0.3764706, 1, 1,
0.2349587, 1.204645, 1.567736, 0, 0.3686275, 1, 1,
0.2436795, 0.2984718, 2.27096, 0, 0.3647059, 1, 1,
0.2480948, 1.274344, -0.09235057, 0, 0.3568628, 1, 1,
0.2512521, 0.7730712, 1.13123, 0, 0.3529412, 1, 1,
0.2537971, 0.5704808, -0.8213002, 0, 0.345098, 1, 1,
0.254791, -1.724622, 1.475576, 0, 0.3411765, 1, 1,
0.2564702, 0.585891, -0.9147286, 0, 0.3333333, 1, 1,
0.2654157, -0.05194947, 1.579739, 0, 0.3294118, 1, 1,
0.2665007, 0.2719244, -0.4552692, 0, 0.3215686, 1, 1,
0.2779166, 0.08365475, 1.308814, 0, 0.3176471, 1, 1,
0.2815658, -0.1609168, 2.006547, 0, 0.3098039, 1, 1,
0.2841791, -0.8743274, 2.218648, 0, 0.3058824, 1, 1,
0.2845502, -0.1712244, 1.025693, 0, 0.2980392, 1, 1,
0.2865011, -0.4993442, 2.776436, 0, 0.2901961, 1, 1,
0.2944972, -0.3506795, 1.239269, 0, 0.2862745, 1, 1,
0.3008351, -0.9692531, 2.666219, 0, 0.2784314, 1, 1,
0.3051311, -1.369772, 4.224173, 0, 0.2745098, 1, 1,
0.3061102, -0.07185119, 0.2809404, 0, 0.2666667, 1, 1,
0.3104413, 0.1530994, 0.1747489, 0, 0.2627451, 1, 1,
0.3110002, 0.5971419, 0.5584823, 0, 0.254902, 1, 1,
0.3125835, 0.1890902, 2.165642, 0, 0.2509804, 1, 1,
0.3134077, -0.4388694, 3.031932, 0, 0.2431373, 1, 1,
0.3134188, -0.3874814, 2.520815, 0, 0.2392157, 1, 1,
0.3139878, -0.04430606, 2.637269, 0, 0.2313726, 1, 1,
0.3156871, 0.3170484, -0.939869, 0, 0.227451, 1, 1,
0.3214934, 0.7915827, 0.306086, 0, 0.2196078, 1, 1,
0.3299743, 0.7126675, -0.1482588, 0, 0.2156863, 1, 1,
0.3360963, -0.398771, 2.776206, 0, 0.2078431, 1, 1,
0.3440564, 0.2596186, 2.086771, 0, 0.2039216, 1, 1,
0.3450636, 1.552936, -0.1475108, 0, 0.1960784, 1, 1,
0.3473275, -0.9086973, 3.306777, 0, 0.1882353, 1, 1,
0.3492763, 0.2166083, -0.6294163, 0, 0.1843137, 1, 1,
0.3521857, 0.2874542, 0.5482553, 0, 0.1764706, 1, 1,
0.3551038, 0.327294, 0.1715467, 0, 0.172549, 1, 1,
0.3613849, -1.140022, 4.207479, 0, 0.1647059, 1, 1,
0.362422, 0.0411876, -0.3110726, 0, 0.1607843, 1, 1,
0.3649744, -0.5115295, 1.946226, 0, 0.1529412, 1, 1,
0.366804, 0.6101801, -0.1377636, 0, 0.1490196, 1, 1,
0.3677307, 0.9878474, 0.7846746, 0, 0.1411765, 1, 1,
0.3702778, -1.28577, 3.837006, 0, 0.1372549, 1, 1,
0.3782617, 0.2940955, -0.7277405, 0, 0.1294118, 1, 1,
0.3833036, -0.9008468, 1.607976, 0, 0.1254902, 1, 1,
0.386685, 1.849546, 0.7187607, 0, 0.1176471, 1, 1,
0.3881918, 1.663495, 1.719983, 0, 0.1137255, 1, 1,
0.3882065, 0.9830892, 1.229968, 0, 0.1058824, 1, 1,
0.3896503, -0.06662758, 0.9546207, 0, 0.09803922, 1, 1,
0.3938126, -0.765049, 2.336654, 0, 0.09411765, 1, 1,
0.3944519, -0.1649577, 2.433459, 0, 0.08627451, 1, 1,
0.394554, 0.4966176, -0.04036588, 0, 0.08235294, 1, 1,
0.3955759, 0.0372833, 2.101158, 0, 0.07450981, 1, 1,
0.3966591, 0.3166802, 1.232702, 0, 0.07058824, 1, 1,
0.4117849, 0.6388004, -0.009411635, 0, 0.0627451, 1, 1,
0.4134008, -0.9262584, 1.56454, 0, 0.05882353, 1, 1,
0.4153622, 0.1762247, -0.1399187, 0, 0.05098039, 1, 1,
0.4158769, 0.1137129, 2.758122, 0, 0.04705882, 1, 1,
0.4220159, 0.6238568, 0.5685287, 0, 0.03921569, 1, 1,
0.4240683, 1.578269, -0.4424164, 0, 0.03529412, 1, 1,
0.4245614, 0.4001022, 0.5103874, 0, 0.02745098, 1, 1,
0.4251556, -0.4501044, 0.9597995, 0, 0.02352941, 1, 1,
0.4252594, 0.3977073, 0.3072807, 0, 0.01568628, 1, 1,
0.430313, 0.2929582, 1.564288, 0, 0.01176471, 1, 1,
0.4329319, 1.353833, -1.247653, 0, 0.003921569, 1, 1,
0.4339785, -1.189443, 3.34112, 0.003921569, 0, 1, 1,
0.4352869, 0.6491117, 0.8024246, 0.007843138, 0, 1, 1,
0.4353889, -1.052709, 2.580482, 0.01568628, 0, 1, 1,
0.4407346, -1.765645, 4.336695, 0.01960784, 0, 1, 1,
0.4431347, 1.243023, 1.377077, 0.02745098, 0, 1, 1,
0.4448009, 0.8875778, 2.483992, 0.03137255, 0, 1, 1,
0.4461576, 0.3111433, -0.9150009, 0.03921569, 0, 1, 1,
0.4485317, 0.834215, 0.962192, 0.04313726, 0, 1, 1,
0.4512979, -0.7925588, 3.122788, 0.05098039, 0, 1, 1,
0.4513555, -1.125283, 2.950658, 0.05490196, 0, 1, 1,
0.4521311, -1.06511, 2.867999, 0.0627451, 0, 1, 1,
0.4526125, -0.5140175, 0.9841655, 0.06666667, 0, 1, 1,
0.45283, 0.461058, 0.991142, 0.07450981, 0, 1, 1,
0.4585426, 0.8250833, 1.333384, 0.07843138, 0, 1, 1,
0.4642175, -1.547689, 1.662358, 0.08627451, 0, 1, 1,
0.4648006, 1.374146, 1.121466, 0.09019608, 0, 1, 1,
0.4689354, 0.7241277, 0.1984293, 0.09803922, 0, 1, 1,
0.4782787, 1.917188, 2.61333, 0.1058824, 0, 1, 1,
0.4797099, -0.3089835, 3.692657, 0.1098039, 0, 1, 1,
0.484083, -1.963099, 1.926789, 0.1176471, 0, 1, 1,
0.4845051, -0.3259344, 1.783688, 0.1215686, 0, 1, 1,
0.4859895, -1.029975, 3.406437, 0.1294118, 0, 1, 1,
0.4905294, 0.6199555, 1.636045, 0.1333333, 0, 1, 1,
0.4940574, -1.306713, 3.742507, 0.1411765, 0, 1, 1,
0.4962222, -1.341785, 3.008304, 0.145098, 0, 1, 1,
0.5037352, 0.01579339, 1.1058, 0.1529412, 0, 1, 1,
0.5061089, -0.6877225, 2.010845, 0.1568628, 0, 1, 1,
0.5063475, -0.4136452, 2.287379, 0.1647059, 0, 1, 1,
0.5066934, -0.9620726, 2.891216, 0.1686275, 0, 1, 1,
0.5067045, 1.648395, -0.08914118, 0.1764706, 0, 1, 1,
0.5128555, -0.4042186, 1.24388, 0.1803922, 0, 1, 1,
0.5201899, 0.3967195, 0.8378997, 0.1882353, 0, 1, 1,
0.5226769, 0.30388, 3.053326, 0.1921569, 0, 1, 1,
0.5287453, 1.511087, 0.9739489, 0.2, 0, 1, 1,
0.5292435, -0.4493562, 2.819288, 0.2078431, 0, 1, 1,
0.5296789, -2.051012, 3.275067, 0.2117647, 0, 1, 1,
0.5309877, 0.6861249, 0.8760252, 0.2196078, 0, 1, 1,
0.5309919, -0.02049307, 0.8605278, 0.2235294, 0, 1, 1,
0.5347136, 0.833567, -0.8870286, 0.2313726, 0, 1, 1,
0.5351585, 0.9149561, 0.6725101, 0.2352941, 0, 1, 1,
0.5367086, -1.200199, 2.169375, 0.2431373, 0, 1, 1,
0.5372367, 0.6236876, -0.81814, 0.2470588, 0, 1, 1,
0.538411, 1.084733, 0.261041, 0.254902, 0, 1, 1,
0.5392885, -1.867122, 2.52662, 0.2588235, 0, 1, 1,
0.5410377, 1.956039, 0.1185955, 0.2666667, 0, 1, 1,
0.54199, 0.6544903, 1.076244, 0.2705882, 0, 1, 1,
0.543014, -0.6484829, 4.166677, 0.2784314, 0, 1, 1,
0.5446651, -0.466652, 1.084038, 0.282353, 0, 1, 1,
0.544744, -1.320176, 4.011564, 0.2901961, 0, 1, 1,
0.5457832, 0.9580989, -0.1419405, 0.2941177, 0, 1, 1,
0.546868, 0.9788787, -1.408834, 0.3019608, 0, 1, 1,
0.5474597, 0.6738949, -0.1149493, 0.3098039, 0, 1, 1,
0.5494172, -0.2272152, 1.470823, 0.3137255, 0, 1, 1,
0.5496387, 0.009537452, 1.149301, 0.3215686, 0, 1, 1,
0.5503418, 0.542207, 2.196071, 0.3254902, 0, 1, 1,
0.5521849, -1.124047, 3.462535, 0.3333333, 0, 1, 1,
0.552302, -1.588607, 4.316517, 0.3372549, 0, 1, 1,
0.5541794, -0.4564556, 4.12799, 0.345098, 0, 1, 1,
0.5544093, 2.6276, -1.764729, 0.3490196, 0, 1, 1,
0.5549161, 1.535248, 0.8328279, 0.3568628, 0, 1, 1,
0.5625266, -0.4031937, 2.326315, 0.3607843, 0, 1, 1,
0.5629448, -0.8484929, 2.206017, 0.3686275, 0, 1, 1,
0.5677179, 1.234655, -0.7654088, 0.372549, 0, 1, 1,
0.5712634, 1.243039, 0.1461148, 0.3803922, 0, 1, 1,
0.5712972, 1.08595, 0.2455447, 0.3843137, 0, 1, 1,
0.5730563, 0.5267233, 1.00043, 0.3921569, 0, 1, 1,
0.5760924, 0.1392183, 0.913378, 0.3960784, 0, 1, 1,
0.5779198, -0.1361464, 2.357624, 0.4039216, 0, 1, 1,
0.5904313, -0.7970973, 3.12546, 0.4117647, 0, 1, 1,
0.593219, 1.198488, -0.2951478, 0.4156863, 0, 1, 1,
0.594696, 0.01552914, 1.242634, 0.4235294, 0, 1, 1,
0.5953768, 1.90115, 0.8931153, 0.427451, 0, 1, 1,
0.6010393, 0.08863211, 2.222196, 0.4352941, 0, 1, 1,
0.6024898, -0.2305899, 1.826537, 0.4392157, 0, 1, 1,
0.6065506, -0.8501799, 2.202175, 0.4470588, 0, 1, 1,
0.6074647, 0.2302972, 2.841235, 0.4509804, 0, 1, 1,
0.6075282, -0.2572011, 2.158203, 0.4588235, 0, 1, 1,
0.6169459, 1.310611, 1.849233, 0.4627451, 0, 1, 1,
0.6204367, 0.1100948, 0.04787542, 0.4705882, 0, 1, 1,
0.6253395, -0.3957326, 3.807473, 0.4745098, 0, 1, 1,
0.6306087, -0.2636957, -0.1961385, 0.4823529, 0, 1, 1,
0.639291, -1.313974, 1.354747, 0.4862745, 0, 1, 1,
0.6405621, 0.2350049, 3.084534, 0.4941176, 0, 1, 1,
0.6434333, 0.6865166, -0.1476803, 0.5019608, 0, 1, 1,
0.6455232, 0.07127109, 0.9774559, 0.5058824, 0, 1, 1,
0.6486068, 0.1365035, 1.543473, 0.5137255, 0, 1, 1,
0.6488417, -1.037231, 1.366488, 0.5176471, 0, 1, 1,
0.6494114, 3.026799, -0.2902334, 0.5254902, 0, 1, 1,
0.6580105, -0.3757784, 3.51988, 0.5294118, 0, 1, 1,
0.6595084, 1.732475, 0.09756452, 0.5372549, 0, 1, 1,
0.6682045, 1.190348, 1.015118, 0.5411765, 0, 1, 1,
0.6703867, -0.4607255, 2.082869, 0.5490196, 0, 1, 1,
0.6752342, 0.06068982, 1.712632, 0.5529412, 0, 1, 1,
0.6764257, 0.1866466, 1.545524, 0.5607843, 0, 1, 1,
0.6771143, 2.47544, 2.747639, 0.5647059, 0, 1, 1,
0.6831588, 1.69556, 1.468374, 0.572549, 0, 1, 1,
0.6833033, 0.2224013, 0.9130661, 0.5764706, 0, 1, 1,
0.686233, 0.6760839, 0.431059, 0.5843138, 0, 1, 1,
0.6868596, 0.1044655, 2.765918, 0.5882353, 0, 1, 1,
0.6948376, 0.2623149, 1.016271, 0.5960785, 0, 1, 1,
0.6989621, 1.211383, 1.437316, 0.6039216, 0, 1, 1,
0.7019727, -0.9976109, 3.022987, 0.6078432, 0, 1, 1,
0.7055051, -0.8098965, 2.144862, 0.6156863, 0, 1, 1,
0.7152065, 0.7904509, -0.4524662, 0.6196079, 0, 1, 1,
0.7176266, -1.442656, 4.785855, 0.627451, 0, 1, 1,
0.7202599, 0.4495059, 1.2299, 0.6313726, 0, 1, 1,
0.7216968, -0.4622563, 2.805674, 0.6392157, 0, 1, 1,
0.7265171, 0.4266625, 2.752816, 0.6431373, 0, 1, 1,
0.7309542, -0.208693, 3.932056, 0.6509804, 0, 1, 1,
0.7338182, 1.547401, 0.6872059, 0.654902, 0, 1, 1,
0.7364041, 1.61788, 0.3891718, 0.6627451, 0, 1, 1,
0.7385894, -2.01585, 1.629627, 0.6666667, 0, 1, 1,
0.7403144, 0.2750734, 2.049566, 0.6745098, 0, 1, 1,
0.7414128, -1.521991, 1.336065, 0.6784314, 0, 1, 1,
0.7446061, 0.1672206, 0.5623406, 0.6862745, 0, 1, 1,
0.7551643, -0.9242054, 0.3048378, 0.6901961, 0, 1, 1,
0.7565738, -1.44215, 1.399898, 0.6980392, 0, 1, 1,
0.7569457, 1.028259, -1.523036, 0.7058824, 0, 1, 1,
0.7607852, -0.2476331, 1.992064, 0.7098039, 0, 1, 1,
0.7649095, 0.6769493, -0.5237939, 0.7176471, 0, 1, 1,
0.7673483, -1.637426, 2.954422, 0.7215686, 0, 1, 1,
0.7700964, 1.353178, -0.4485932, 0.7294118, 0, 1, 1,
0.7705337, 0.9050813, 0.2896697, 0.7333333, 0, 1, 1,
0.7707365, 0.2225234, 1.766335, 0.7411765, 0, 1, 1,
0.7721227, -2.717648, 2.534022, 0.7450981, 0, 1, 1,
0.7754233, 0.4579181, 1.268607, 0.7529412, 0, 1, 1,
0.7795249, 1.350321, 2.058799, 0.7568628, 0, 1, 1,
0.7824476, -0.2779501, 2.18053, 0.7647059, 0, 1, 1,
0.7837611, 0.7485765, 1.710135, 0.7686275, 0, 1, 1,
0.7864065, 1.038578, 1.00175, 0.7764706, 0, 1, 1,
0.787385, -0.9291865, 1.605763, 0.7803922, 0, 1, 1,
0.7911036, 1.08203, -0.1754764, 0.7882353, 0, 1, 1,
0.7937509, 1.033934, 1.362402, 0.7921569, 0, 1, 1,
0.7941196, -0.8936409, 2.841113, 0.8, 0, 1, 1,
0.7944209, -0.1172041, 3.245985, 0.8078431, 0, 1, 1,
0.7969195, -0.8153653, 2.106474, 0.8117647, 0, 1, 1,
0.7983493, 0.4118981, 0.0590076, 0.8196079, 0, 1, 1,
0.8068135, -0.6986226, 1.137687, 0.8235294, 0, 1, 1,
0.8132861, -0.3560607, 3.569842, 0.8313726, 0, 1, 1,
0.8179314, -0.9131355, 2.881683, 0.8352941, 0, 1, 1,
0.8228321, -1.439059, 2.739508, 0.8431373, 0, 1, 1,
0.8348063, 1.273178, 1.515111, 0.8470588, 0, 1, 1,
0.8406488, -0.3018746, 2.607637, 0.854902, 0, 1, 1,
0.8521855, 1.670862, -0.7586493, 0.8588235, 0, 1, 1,
0.8564459, -0.4463805, 4.131454, 0.8666667, 0, 1, 1,
0.8682085, 0.3057838, 0.1612966, 0.8705882, 0, 1, 1,
0.8684273, -0.2087237, 2.318901, 0.8784314, 0, 1, 1,
0.8697689, -1.43943, 3.038303, 0.8823529, 0, 1, 1,
0.8699013, -1.353675, 4.177868, 0.8901961, 0, 1, 1,
0.8736982, 0.8374248, 0.352177, 0.8941177, 0, 1, 1,
0.874383, -0.2658398, 2.31638, 0.9019608, 0, 1, 1,
0.8812053, 0.3655605, 3.293363, 0.9098039, 0, 1, 1,
0.8832509, 2.981528, 0.8725836, 0.9137255, 0, 1, 1,
0.8856061, 2.599489, -0.7219507, 0.9215686, 0, 1, 1,
0.8941365, -1.201675, 1.773656, 0.9254902, 0, 1, 1,
0.9009582, 3.056494, 0.5178086, 0.9333333, 0, 1, 1,
0.9030163, -1.155131, 1.479151, 0.9372549, 0, 1, 1,
0.9030294, 0.6272565, 1.307106, 0.945098, 0, 1, 1,
0.9083752, -0.7169483, 3.858841, 0.9490196, 0, 1, 1,
0.9091253, 3.506189, -0.3862135, 0.9568627, 0, 1, 1,
0.9093309, 1.671387, -0.4188447, 0.9607843, 0, 1, 1,
0.9159213, -0.5452496, 1.208967, 0.9686275, 0, 1, 1,
0.9261594, -0.9342201, 1.521642, 0.972549, 0, 1, 1,
0.9363798, 0.9539663, 0.6404864, 0.9803922, 0, 1, 1,
0.9398927, -0.4738265, 1.560035, 0.9843137, 0, 1, 1,
0.9421641, -0.7079017, 1.468757, 0.9921569, 0, 1, 1,
0.9422454, 0.5037442, 1.840466, 0.9960784, 0, 1, 1,
0.9425499, 0.5945508, 1.101079, 1, 0, 0.9960784, 1,
0.9488378, 0.6212792, 1.29354, 1, 0, 0.9882353, 1,
0.9573562, 0.09201492, 1.602669, 1, 0, 0.9843137, 1,
0.9581657, -1.217007, 2.56786, 1, 0, 0.9764706, 1,
0.9594817, -0.6172999, 1.315979, 1, 0, 0.972549, 1,
0.9600011, 0.8599634, -0.1814506, 1, 0, 0.9647059, 1,
0.9634343, 0.2111377, 2.236428, 1, 0, 0.9607843, 1,
0.9725629, -0.08259946, -0.09187976, 1, 0, 0.9529412, 1,
0.9739323, -0.04950166, 0.5487772, 1, 0, 0.9490196, 1,
0.9767211, -0.6660475, 2.113338, 1, 0, 0.9411765, 1,
0.9778399, -0.05557601, 0.6692775, 1, 0, 0.9372549, 1,
0.9815431, 0.2700532, 1.33026, 1, 0, 0.9294118, 1,
0.9981223, -0.2334453, 2.756145, 1, 0, 0.9254902, 1,
1.002846, 0.3678622, 3.086944, 1, 0, 0.9176471, 1,
1.009508, 1.069534, 0.4409878, 1, 0, 0.9137255, 1,
1.010919, 0.7428632, 1.931714, 1, 0, 0.9058824, 1,
1.018549, 0.5510348, 0.7265607, 1, 0, 0.9019608, 1,
1.019298, 0.101923, 0.02358129, 1, 0, 0.8941177, 1,
1.019304, 0.184642, 0.9530765, 1, 0, 0.8862745, 1,
1.02456, 0.0551782, 2.812499, 1, 0, 0.8823529, 1,
1.034446, -0.5142311, 3.309464, 1, 0, 0.8745098, 1,
1.03687, -1.250389, 1.722019, 1, 0, 0.8705882, 1,
1.041402, 0.4141524, 1.439167, 1, 0, 0.8627451, 1,
1.049772, -0.02864483, 1.573466, 1, 0, 0.8588235, 1,
1.060381, -0.6796388, 3.042783, 1, 0, 0.8509804, 1,
1.060785, 1.243227, -0.7292919, 1, 0, 0.8470588, 1,
1.062933, 0.4504634, -1.897791, 1, 0, 0.8392157, 1,
1.070331, -1.087985, 1.684245, 1, 0, 0.8352941, 1,
1.08973, -1.869844, 0.6852232, 1, 0, 0.827451, 1,
1.096228, 0.01396495, 0.7254865, 1, 0, 0.8235294, 1,
1.09694, -1.090054, 3.482586, 1, 0, 0.8156863, 1,
1.099502, 0.4420821, 1.427796, 1, 0, 0.8117647, 1,
1.107285, -1.833397, 2.627532, 1, 0, 0.8039216, 1,
1.113234, -0.7617919, 2.760808, 1, 0, 0.7960784, 1,
1.115826, -0.5125598, 4.113954, 1, 0, 0.7921569, 1,
1.12413, -0.1252743, 4.391937, 1, 0, 0.7843137, 1,
1.125064, 0.4612702, 2.12777, 1, 0, 0.7803922, 1,
1.130178, 0.3398306, 1.760381, 1, 0, 0.772549, 1,
1.133673, -1.18188, 2.526333, 1, 0, 0.7686275, 1,
1.151018, 0.679104, 0.8882911, 1, 0, 0.7607843, 1,
1.155287, -2.472847, 3.471253, 1, 0, 0.7568628, 1,
1.156197, -0.1074117, 1.530718, 1, 0, 0.7490196, 1,
1.157861, 0.3915484, 1.553033, 1, 0, 0.7450981, 1,
1.158864, 0.340437, 0.7808677, 1, 0, 0.7372549, 1,
1.180056, -1.043956, 0.8263038, 1, 0, 0.7333333, 1,
1.187538, 0.7474155, -2.423271, 1, 0, 0.7254902, 1,
1.192225, -2.033305, 3.81498, 1, 0, 0.7215686, 1,
1.193879, -0.4461029, 3.815109, 1, 0, 0.7137255, 1,
1.197865, 0.2628655, 0.8766751, 1, 0, 0.7098039, 1,
1.201639, -0.8967608, 2.560169, 1, 0, 0.7019608, 1,
1.202733, -0.9607075, 1.915795, 1, 0, 0.6941177, 1,
1.205333, -0.7708968, 0.7965731, 1, 0, 0.6901961, 1,
1.206779, -0.8725052, 1.451035, 1, 0, 0.682353, 1,
1.218042, 0.710651, -0.5227318, 1, 0, 0.6784314, 1,
1.222313, -0.1398925, 1.233138, 1, 0, 0.6705883, 1,
1.226265, -0.7554487, 3.266823, 1, 0, 0.6666667, 1,
1.235034, -0.812512, 2.149448, 1, 0, 0.6588235, 1,
1.246349, -0.7814149, 1.999108, 1, 0, 0.654902, 1,
1.268644, -0.2082131, 1.055291, 1, 0, 0.6470588, 1,
1.27861, -1.370718, 3.657413, 1, 0, 0.6431373, 1,
1.280685, 0.4708178, 0.9060413, 1, 0, 0.6352941, 1,
1.280987, -0.7590233, 1.953141, 1, 0, 0.6313726, 1,
1.286842, 0.5118608, 0.9836649, 1, 0, 0.6235294, 1,
1.287995, 0.9564072, 0.2841257, 1, 0, 0.6196079, 1,
1.295863, -0.8198948, 1.805414, 1, 0, 0.6117647, 1,
1.299271, -0.3171813, -0.09786725, 1, 0, 0.6078432, 1,
1.300416, 1.061846, 0.2717361, 1, 0, 0.6, 1,
1.308446, 2.133356, 2.543255, 1, 0, 0.5921569, 1,
1.340977, 0.04687595, 1.245532, 1, 0, 0.5882353, 1,
1.344421, -0.6471654, 2.271962, 1, 0, 0.5803922, 1,
1.345914, 0.6381748, 1.241857, 1, 0, 0.5764706, 1,
1.348321, 1.526386, 1.17367, 1, 0, 0.5686275, 1,
1.352963, 0.3026921, 2.958327, 1, 0, 0.5647059, 1,
1.353873, 0.8289473, 0.4665658, 1, 0, 0.5568628, 1,
1.362433, 1.750496, -0.090705, 1, 0, 0.5529412, 1,
1.366826, 0.263615, 1.352136, 1, 0, 0.5450981, 1,
1.369156, 1.401079, 0.8126355, 1, 0, 0.5411765, 1,
1.370376, 0.8216184, -0.2913, 1, 0, 0.5333334, 1,
1.370436, -1.438888, 1.593905, 1, 0, 0.5294118, 1,
1.382814, 0.3527556, 1.177689, 1, 0, 0.5215687, 1,
1.38387, 0.1444058, 2.623813, 1, 0, 0.5176471, 1,
1.38466, 1.800978, 1.441105, 1, 0, 0.509804, 1,
1.38599, -0.08151053, 1.714312, 1, 0, 0.5058824, 1,
1.39148, -0.08614791, 1.91601, 1, 0, 0.4980392, 1,
1.39594, -1.190456, 2.650871, 1, 0, 0.4901961, 1,
1.400919, -0.6020616, 2.120846, 1, 0, 0.4862745, 1,
1.402632, 0.2667737, -0.3285795, 1, 0, 0.4784314, 1,
1.406212, 0.8332386, -0.4032725, 1, 0, 0.4745098, 1,
1.419272, 2.347052, 0.1155952, 1, 0, 0.4666667, 1,
1.430948, 0.2672239, 0.7092097, 1, 0, 0.4627451, 1,
1.431825, -0.9501079, 2.390514, 1, 0, 0.454902, 1,
1.43434, -0.005308207, 1.145111, 1, 0, 0.4509804, 1,
1.441957, -0.6767173, 2.627056, 1, 0, 0.4431373, 1,
1.449481, 0.01146551, 1.128307, 1, 0, 0.4392157, 1,
1.460799, -0.5902795, 2.189819, 1, 0, 0.4313726, 1,
1.46604, -1.234821, 0.6452187, 1, 0, 0.427451, 1,
1.479215, -1.002863, 4.090913, 1, 0, 0.4196078, 1,
1.48162, 0.1600951, 1.424967, 1, 0, 0.4156863, 1,
1.490128, -0.1595339, 1.721977, 1, 0, 0.4078431, 1,
1.495814, -3.027373, 2.843516, 1, 0, 0.4039216, 1,
1.496323, 0.6817424, 0.6094458, 1, 0, 0.3960784, 1,
1.497258, 1.043062, 0.6371894, 1, 0, 0.3882353, 1,
1.49944, -0.2116942, 3.131512, 1, 0, 0.3843137, 1,
1.499523, 1.900982, 0.6022272, 1, 0, 0.3764706, 1,
1.509057, -0.3588333, -0.2368479, 1, 0, 0.372549, 1,
1.516272, -0.2754633, 2.811041, 1, 0, 0.3647059, 1,
1.540618, -1.244254, 3.058662, 1, 0, 0.3607843, 1,
1.550146, 0.4600212, 2.186157, 1, 0, 0.3529412, 1,
1.555636, -0.6728429, 2.077527, 1, 0, 0.3490196, 1,
1.557527, 0.5838634, 1.006796, 1, 0, 0.3411765, 1,
1.558834, 0.08910836, 1.569611, 1, 0, 0.3372549, 1,
1.566869, -2.059615, 3.754848, 1, 0, 0.3294118, 1,
1.575999, 1.343567, 0.6359075, 1, 0, 0.3254902, 1,
1.57763, -2.181155, 1.809301, 1, 0, 0.3176471, 1,
1.58416, -1.308997, 2.395869, 1, 0, 0.3137255, 1,
1.590815, 0.1517646, 2.617155, 1, 0, 0.3058824, 1,
1.610342, 0.2078532, 3.880405, 1, 0, 0.2980392, 1,
1.614987, 0.1663842, 1.296642, 1, 0, 0.2941177, 1,
1.619177, -1.237253, 1.207271, 1, 0, 0.2862745, 1,
1.63671, 0.1403521, 1.617837, 1, 0, 0.282353, 1,
1.637938, -0.8405014, 1.767603, 1, 0, 0.2745098, 1,
1.649346, 0.2670929, 1.610356, 1, 0, 0.2705882, 1,
1.689713, 0.132719, 1.441344, 1, 0, 0.2627451, 1,
1.741007, 1.4766, 1.554964, 1, 0, 0.2588235, 1,
1.743377, -1.656412, 2.857738, 1, 0, 0.2509804, 1,
1.745999, 0.07189553, 0.5134055, 1, 0, 0.2470588, 1,
1.753838, 0.9424081, 1.869974, 1, 0, 0.2392157, 1,
1.776863, -0.5988248, 0.3247739, 1, 0, 0.2352941, 1,
1.787296, 1.288309, 0.2501532, 1, 0, 0.227451, 1,
1.788682, 0.4387878, 2.096294, 1, 0, 0.2235294, 1,
1.817812, -1.780111, 2.62308, 1, 0, 0.2156863, 1,
1.825379, 0.02015718, 1.119315, 1, 0, 0.2117647, 1,
1.826715, -1.083874, 3.179333, 1, 0, 0.2039216, 1,
1.841583, -1.156615, 2.960505, 1, 0, 0.1960784, 1,
1.843812, -0.5574437, 2.463505, 1, 0, 0.1921569, 1,
1.861224, -2.00579, 2.791903, 1, 0, 0.1843137, 1,
1.884509, -0.2422897, 2.379857, 1, 0, 0.1803922, 1,
1.886192, 0.3860534, 1.806626, 1, 0, 0.172549, 1,
1.887385, -0.5010523, 1.072913, 1, 0, 0.1686275, 1,
1.889447, -0.9582146, 1.364239, 1, 0, 0.1607843, 1,
1.90225, -0.198906, 1.554845, 1, 0, 0.1568628, 1,
1.914277, -2.313924, 1.448213, 1, 0, 0.1490196, 1,
1.915817, -0.7931073, 2.294139, 1, 0, 0.145098, 1,
1.916883, 0.548011, 0.2437236, 1, 0, 0.1372549, 1,
1.918973, -1.764625, 1.787399, 1, 0, 0.1333333, 1,
1.943543, 0.9684191, -0.2474057, 1, 0, 0.1254902, 1,
1.944878, -0.8681647, 2.603398, 1, 0, 0.1215686, 1,
1.945465, -0.7297199, 2.330521, 1, 0, 0.1137255, 1,
1.963243, 1.088887, 0.1606952, 1, 0, 0.1098039, 1,
1.981549, 0.3630169, 0.3972446, 1, 0, 0.1019608, 1,
1.990737, -2.375032, 0.9748332, 1, 0, 0.09411765, 1,
2.014295, 0.7286694, 0.8077426, 1, 0, 0.09019608, 1,
2.026743, -0.1945452, 1.364816, 1, 0, 0.08235294, 1,
2.037023, -1.407553, 1.771082, 1, 0, 0.07843138, 1,
2.05346, -0.5168146, 1.676959, 1, 0, 0.07058824, 1,
2.185493, -1.357882, 3.580477, 1, 0, 0.06666667, 1,
2.194285, 0.9754779, 1.274778, 1, 0, 0.05882353, 1,
2.22853, 0.7867774, 1.217798, 1, 0, 0.05490196, 1,
2.261638, -0.5129591, 1.286392, 1, 0, 0.04705882, 1,
2.41259, -0.5501972, 2.599825, 1, 0, 0.04313726, 1,
2.672499, -0.1930037, 2.532194, 1, 0, 0.03529412, 1,
2.676282, 0.01316484, 2.499832, 1, 0, 0.03137255, 1,
2.744673, -0.2954369, -0.0367519, 1, 0, 0.02352941, 1,
2.747729, -0.402139, 3.057754, 1, 0, 0.01960784, 1,
2.755941, 0.009575675, 2.672637, 1, 0, 0.01176471, 1,
3.122234, 0.5446068, 2.00787, 1, 0, 0.007843138, 1
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
0.1893141, -4.134811, -6.49601, 0, -0.5, 0.5, 0.5,
0.1893141, -4.134811, -6.49601, 1, -0.5, 0.5, 0.5,
0.1893141, -4.134811, -6.49601, 1, 1.5, 0.5, 0.5,
0.1893141, -4.134811, -6.49601, 0, 1.5, 0.5, 0.5
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
-3.737865, 0.2394083, -6.49601, 0, -0.5, 0.5, 0.5,
-3.737865, 0.2394083, -6.49601, 1, -0.5, 0.5, 0.5,
-3.737865, 0.2394083, -6.49601, 1, 1.5, 0.5, 0.5,
-3.737865, 0.2394083, -6.49601, 0, 1.5, 0.5, 0.5
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
-3.737865, -4.134811, 0.5047688, 0, -0.5, 0.5, 0.5,
-3.737865, -4.134811, 0.5047688, 1, -0.5, 0.5, 0.5,
-3.737865, -4.134811, 0.5047688, 1, 1.5, 0.5, 0.5,
-3.737865, -4.134811, 0.5047688, 0, 1.5, 0.5, 0.5
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
-2, -3.125376, -4.880445,
3, -3.125376, -4.880445,
-2, -3.125376, -4.880445,
-2, -3.293615, -5.149706,
-1, -3.125376, -4.880445,
-1, -3.293615, -5.149706,
0, -3.125376, -4.880445,
0, -3.293615, -5.149706,
1, -3.125376, -4.880445,
1, -3.293615, -5.149706,
2, -3.125376, -4.880445,
2, -3.293615, -5.149706,
3, -3.125376, -4.880445,
3, -3.293615, -5.149706
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
-2, -3.630094, -5.688228, 0, -0.5, 0.5, 0.5,
-2, -3.630094, -5.688228, 1, -0.5, 0.5, 0.5,
-2, -3.630094, -5.688228, 1, 1.5, 0.5, 0.5,
-2, -3.630094, -5.688228, 0, 1.5, 0.5, 0.5,
-1, -3.630094, -5.688228, 0, -0.5, 0.5, 0.5,
-1, -3.630094, -5.688228, 1, -0.5, 0.5, 0.5,
-1, -3.630094, -5.688228, 1, 1.5, 0.5, 0.5,
-1, -3.630094, -5.688228, 0, 1.5, 0.5, 0.5,
0, -3.630094, -5.688228, 0, -0.5, 0.5, 0.5,
0, -3.630094, -5.688228, 1, -0.5, 0.5, 0.5,
0, -3.630094, -5.688228, 1, 1.5, 0.5, 0.5,
0, -3.630094, -5.688228, 0, 1.5, 0.5, 0.5,
1, -3.630094, -5.688228, 0, -0.5, 0.5, 0.5,
1, -3.630094, -5.688228, 1, -0.5, 0.5, 0.5,
1, -3.630094, -5.688228, 1, 1.5, 0.5, 0.5,
1, -3.630094, -5.688228, 0, 1.5, 0.5, 0.5,
2, -3.630094, -5.688228, 0, -0.5, 0.5, 0.5,
2, -3.630094, -5.688228, 1, -0.5, 0.5, 0.5,
2, -3.630094, -5.688228, 1, 1.5, 0.5, 0.5,
2, -3.630094, -5.688228, 0, 1.5, 0.5, 0.5,
3, -3.630094, -5.688228, 0, -0.5, 0.5, 0.5,
3, -3.630094, -5.688228, 1, -0.5, 0.5, 0.5,
3, -3.630094, -5.688228, 1, 1.5, 0.5, 0.5,
3, -3.630094, -5.688228, 0, 1.5, 0.5, 0.5
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
-2.831593, -3, -4.880445,
-2.831593, 3, -4.880445,
-2.831593, -3, -4.880445,
-2.982638, -3, -5.149706,
-2.831593, -2, -4.880445,
-2.982638, -2, -5.149706,
-2.831593, -1, -4.880445,
-2.982638, -1, -5.149706,
-2.831593, 0, -4.880445,
-2.982638, 0, -5.149706,
-2.831593, 1, -4.880445,
-2.982638, 1, -5.149706,
-2.831593, 2, -4.880445,
-2.982638, 2, -5.149706,
-2.831593, 3, -4.880445,
-2.982638, 3, -5.149706
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
-3.284729, -3, -5.688228, 0, -0.5, 0.5, 0.5,
-3.284729, -3, -5.688228, 1, -0.5, 0.5, 0.5,
-3.284729, -3, -5.688228, 1, 1.5, 0.5, 0.5,
-3.284729, -3, -5.688228, 0, 1.5, 0.5, 0.5,
-3.284729, -2, -5.688228, 0, -0.5, 0.5, 0.5,
-3.284729, -2, -5.688228, 1, -0.5, 0.5, 0.5,
-3.284729, -2, -5.688228, 1, 1.5, 0.5, 0.5,
-3.284729, -2, -5.688228, 0, 1.5, 0.5, 0.5,
-3.284729, -1, -5.688228, 0, -0.5, 0.5, 0.5,
-3.284729, -1, -5.688228, 1, -0.5, 0.5, 0.5,
-3.284729, -1, -5.688228, 1, 1.5, 0.5, 0.5,
-3.284729, -1, -5.688228, 0, 1.5, 0.5, 0.5,
-3.284729, 0, -5.688228, 0, -0.5, 0.5, 0.5,
-3.284729, 0, -5.688228, 1, -0.5, 0.5, 0.5,
-3.284729, 0, -5.688228, 1, 1.5, 0.5, 0.5,
-3.284729, 0, -5.688228, 0, 1.5, 0.5, 0.5,
-3.284729, 1, -5.688228, 0, -0.5, 0.5, 0.5,
-3.284729, 1, -5.688228, 1, -0.5, 0.5, 0.5,
-3.284729, 1, -5.688228, 1, 1.5, 0.5, 0.5,
-3.284729, 1, -5.688228, 0, 1.5, 0.5, 0.5,
-3.284729, 2, -5.688228, 0, -0.5, 0.5, 0.5,
-3.284729, 2, -5.688228, 1, -0.5, 0.5, 0.5,
-3.284729, 2, -5.688228, 1, 1.5, 0.5, 0.5,
-3.284729, 2, -5.688228, 0, 1.5, 0.5, 0.5,
-3.284729, 3, -5.688228, 0, -0.5, 0.5, 0.5,
-3.284729, 3, -5.688228, 1, -0.5, 0.5, 0.5,
-3.284729, 3, -5.688228, 1, 1.5, 0.5, 0.5,
-3.284729, 3, -5.688228, 0, 1.5, 0.5, 0.5
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
-2.831593, -3.125376, -4,
-2.831593, -3.125376, 4,
-2.831593, -3.125376, -4,
-2.982638, -3.293615, -4,
-2.831593, -3.125376, -2,
-2.982638, -3.293615, -2,
-2.831593, -3.125376, 0,
-2.982638, -3.293615, 0,
-2.831593, -3.125376, 2,
-2.982638, -3.293615, 2,
-2.831593, -3.125376, 4,
-2.982638, -3.293615, 4
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
-3.284729, -3.630094, -4, 0, -0.5, 0.5, 0.5,
-3.284729, -3.630094, -4, 1, -0.5, 0.5, 0.5,
-3.284729, -3.630094, -4, 1, 1.5, 0.5, 0.5,
-3.284729, -3.630094, -4, 0, 1.5, 0.5, 0.5,
-3.284729, -3.630094, -2, 0, -0.5, 0.5, 0.5,
-3.284729, -3.630094, -2, 1, -0.5, 0.5, 0.5,
-3.284729, -3.630094, -2, 1, 1.5, 0.5, 0.5,
-3.284729, -3.630094, -2, 0, 1.5, 0.5, 0.5,
-3.284729, -3.630094, 0, 0, -0.5, 0.5, 0.5,
-3.284729, -3.630094, 0, 1, -0.5, 0.5, 0.5,
-3.284729, -3.630094, 0, 1, 1.5, 0.5, 0.5,
-3.284729, -3.630094, 0, 0, 1.5, 0.5, 0.5,
-3.284729, -3.630094, 2, 0, -0.5, 0.5, 0.5,
-3.284729, -3.630094, 2, 1, -0.5, 0.5, 0.5,
-3.284729, -3.630094, 2, 1, 1.5, 0.5, 0.5,
-3.284729, -3.630094, 2, 0, 1.5, 0.5, 0.5,
-3.284729, -3.630094, 4, 0, -0.5, 0.5, 0.5,
-3.284729, -3.630094, 4, 1, -0.5, 0.5, 0.5,
-3.284729, -3.630094, 4, 1, 1.5, 0.5, 0.5,
-3.284729, -3.630094, 4, 0, 1.5, 0.5, 0.5
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
-2.831593, -3.125376, -4.880445,
-2.831593, 3.604192, -4.880445,
-2.831593, -3.125376, 5.889983,
-2.831593, 3.604192, 5.889983,
-2.831593, -3.125376, -4.880445,
-2.831593, -3.125376, 5.889983,
-2.831593, 3.604192, -4.880445,
-2.831593, 3.604192, 5.889983,
-2.831593, -3.125376, -4.880445,
3.210221, -3.125376, -4.880445,
-2.831593, -3.125376, 5.889983,
3.210221, -3.125376, 5.889983,
-2.831593, 3.604192, -4.880445,
3.210221, 3.604192, -4.880445,
-2.831593, 3.604192, 5.889983,
3.210221, 3.604192, 5.889983,
3.210221, -3.125376, -4.880445,
3.210221, 3.604192, -4.880445,
3.210221, -3.125376, 5.889983,
3.210221, 3.604192, 5.889983,
3.210221, -3.125376, -4.880445,
3.210221, -3.125376, 5.889983,
3.210221, 3.604192, -4.880445,
3.210221, 3.604192, 5.889983
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
var radius = 7.509839;
var distance = 33.41212;
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
mvMatrix.translate( -0.1893141, -0.2394083, -0.5047688 );
mvMatrix.scale( 1.343932, 1.206583, 0.7538962 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.41212);
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
pyraflufen-ethyl<-read.table("pyraflufen-ethyl.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-pyraflufen-ethyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'pyraflufen' not found
```

```r
y<-pyraflufen-ethyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'pyraflufen' not found
```

```r
z<-pyraflufen-ethyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'pyraflufen' not found
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
-2.743605, -1.311277, -1.431131, 0, 0, 1, 1, 1,
-2.703963, 0.7192659, -1.201901, 1, 0, 0, 1, 1,
-2.655171, 0.06126093, -1.938775, 1, 0, 0, 1, 1,
-2.640204, 1.55961, -0.2895637, 1, 0, 0, 1, 1,
-2.573275, 1.030334, -0.6548042, 1, 0, 0, 1, 1,
-2.545359, -0.67369, -0.640946, 1, 0, 0, 1, 1,
-2.379513, 0.1575626, -2.22212, 0, 0, 0, 1, 1,
-2.275006, 0.3788592, -1.270749, 0, 0, 0, 1, 1,
-2.249189, -0.4269489, -1.482202, 0, 0, 0, 1, 1,
-2.204808, 0.7058681, -2.723469, 0, 0, 0, 1, 1,
-2.133015, -0.6393891, -2.271159, 0, 0, 0, 1, 1,
-2.11874, -0.3226758, -3.029003, 0, 0, 0, 1, 1,
-2.097293, 0.2380031, -0.1853902, 0, 0, 0, 1, 1,
-2.068368, -0.07572097, -1.250451, 1, 1, 1, 1, 1,
-2.055618, 0.9139931, 0.1703969, 1, 1, 1, 1, 1,
-2.050502, 1.092059, 1.193357, 1, 1, 1, 1, 1,
-2.042383, 0.3767196, -1.188533, 1, 1, 1, 1, 1,
-2.039135, 1.322032, -0.007347849, 1, 1, 1, 1, 1,
-2.022426, 0.08019336, -3.163131, 1, 1, 1, 1, 1,
-2.005126, 0.9669163, -0.9242651, 1, 1, 1, 1, 1,
-2.000691, 0.9830447, -0.9822882, 1, 1, 1, 1, 1,
-1.980529, -0.8862513, -1.135683, 1, 1, 1, 1, 1,
-1.962918, -0.7434085, -1.635387, 1, 1, 1, 1, 1,
-1.944553, 1.043191, -3.664795, 1, 1, 1, 1, 1,
-1.930855, -0.5595, -3.631943, 1, 1, 1, 1, 1,
-1.913323, 1.335691, -0.6930887, 1, 1, 1, 1, 1,
-1.910907, 0.03715554, -0.5198214, 1, 1, 1, 1, 1,
-1.905676, 1.23175, 1.474074, 1, 1, 1, 1, 1,
-1.846674, 0.03543168, -2.751389, 0, 0, 1, 1, 1,
-1.8386, -0.07476491, -3.220961, 1, 0, 0, 1, 1,
-1.811247, -0.9407529, -4.020791, 1, 0, 0, 1, 1,
-1.810328, -1.516484, -4.176799, 1, 0, 0, 1, 1,
-1.808439, 0.1109823, -0.7104351, 1, 0, 0, 1, 1,
-1.795478, -0.7955339, -1.992884, 1, 0, 0, 1, 1,
-1.794829, 0.8098965, -2.482316, 0, 0, 0, 1, 1,
-1.79157, 1.109605, -0.6935979, 0, 0, 0, 1, 1,
-1.790417, 0.8219965, -1.247286, 0, 0, 0, 1, 1,
-1.75586, -0.3147562, -1.741918, 0, 0, 0, 1, 1,
-1.745739, 1.467162, -2.130517, 0, 0, 0, 1, 1,
-1.740805, -0.02271243, -1.795499, 0, 0, 0, 1, 1,
-1.740698, -0.5155264, -0.08992866, 0, 0, 0, 1, 1,
-1.731702, 1.511927, -0.3526942, 1, 1, 1, 1, 1,
-1.725666, 1.453575, -0.9813477, 1, 1, 1, 1, 1,
-1.722353, 1.102417, -1.541813, 1, 1, 1, 1, 1,
-1.717826, -0.07461128, -2.094581, 1, 1, 1, 1, 1,
-1.714844, 1.337169, -2.845934, 1, 1, 1, 1, 1,
-1.693416, -0.1845118, -1.007491, 1, 1, 1, 1, 1,
-1.690509, 1.264297, -1.147687, 1, 1, 1, 1, 1,
-1.68318, 0.1951875, -0.7062643, 1, 1, 1, 1, 1,
-1.680086, 0.2036628, -0.07928941, 1, 1, 1, 1, 1,
-1.665765, -0.2942214, -0.5086789, 1, 1, 1, 1, 1,
-1.665365, 0.3763963, -2.002526, 1, 1, 1, 1, 1,
-1.665304, -0.2079817, -1.61839, 1, 1, 1, 1, 1,
-1.651101, 1.754693, -1.108797, 1, 1, 1, 1, 1,
-1.643868, -2.009991, -0.7930576, 1, 1, 1, 1, 1,
-1.641737, -0.9076623, -1.298763, 1, 1, 1, 1, 1,
-1.641155, 2.16046, -2.567054, 0, 0, 1, 1, 1,
-1.631917, -0.4270341, -1.149747, 1, 0, 0, 1, 1,
-1.617996, -1.462322, -3.07349, 1, 0, 0, 1, 1,
-1.609338, -2.410312, -2.863754, 1, 0, 0, 1, 1,
-1.606874, 1.614304, -0.5857666, 1, 0, 0, 1, 1,
-1.605282, -1.955038, -1.56976, 1, 0, 0, 1, 1,
-1.603855, -0.4889633, -2.46257, 0, 0, 0, 1, 1,
-1.584558, 1.052094, -1.259322, 0, 0, 0, 1, 1,
-1.578339, 1.33059, -2.104709, 0, 0, 0, 1, 1,
-1.563117, 0.3251868, -1.448678, 0, 0, 0, 1, 1,
-1.562463, -1.325086, -2.538921, 0, 0, 0, 1, 1,
-1.558567, -0.8059747, -1.05872, 0, 0, 0, 1, 1,
-1.557326, -1.057538, -1.443475, 0, 0, 0, 1, 1,
-1.552575, -0.07602429, -0.8923653, 1, 1, 1, 1, 1,
-1.534521, -0.8739455, -2.087636, 1, 1, 1, 1, 1,
-1.534037, -1.33068, -2.928218, 1, 1, 1, 1, 1,
-1.523799, -1.379791, -1.884525, 1, 1, 1, 1, 1,
-1.523497, 0.1442954, -0.5229405, 1, 1, 1, 1, 1,
-1.46831, -0.6232723, -3.124018, 1, 1, 1, 1, 1,
-1.458241, -0.5803085, 0.4657453, 1, 1, 1, 1, 1,
-1.454403, 0.5986483, -1.190849, 1, 1, 1, 1, 1,
-1.440332, 0.7366727, -1.375971, 1, 1, 1, 1, 1,
-1.440242, -1.483764, -3.057513, 1, 1, 1, 1, 1,
-1.43871, 0.0409447, -1.200525, 1, 1, 1, 1, 1,
-1.438154, 0.8033519, -0.6583515, 1, 1, 1, 1, 1,
-1.436513, -0.1422764, -1.167809, 1, 1, 1, 1, 1,
-1.436125, -0.4721448, -1.88817, 1, 1, 1, 1, 1,
-1.433273, 0.7088118, -2.169158, 1, 1, 1, 1, 1,
-1.432117, -0.2414312, -1.260933, 0, 0, 1, 1, 1,
-1.413327, -1.837062, -2.28943, 1, 0, 0, 1, 1,
-1.408809, -0.272756, -0.2839289, 1, 0, 0, 1, 1,
-1.384315, -0.01634912, -1.778319, 1, 0, 0, 1, 1,
-1.377213, 0.0683445, -1.988189, 1, 0, 0, 1, 1,
-1.36148, 0.07815727, -1.016219, 1, 0, 0, 1, 1,
-1.359245, -1.039172, -0.831728, 0, 0, 0, 1, 1,
-1.344651, -0.4733208, -2.859104, 0, 0, 0, 1, 1,
-1.343188, 0.09693236, -0.9367787, 0, 0, 0, 1, 1,
-1.342882, -1.106011, -2.119742, 0, 0, 0, 1, 1,
-1.336319, 1.791602, 0.08487238, 0, 0, 0, 1, 1,
-1.334707, 0.1133811, -1.558965, 0, 0, 0, 1, 1,
-1.333515, -0.7675591, -2.119658, 0, 0, 0, 1, 1,
-1.319382, -1.79196, -2.610207, 1, 1, 1, 1, 1,
-1.316059, 0.553889, -0.5229763, 1, 1, 1, 1, 1,
-1.311371, -0.2983302, -2.415873, 1, 1, 1, 1, 1,
-1.307034, -2.677618, -3.954796, 1, 1, 1, 1, 1,
-1.306866, -0.5007189, -0.9386899, 1, 1, 1, 1, 1,
-1.305201, -0.7700188, -2.255976, 1, 1, 1, 1, 1,
-1.297847, -0.6278752, -0.9348799, 1, 1, 1, 1, 1,
-1.297546, 0.1067797, -2.563951, 1, 1, 1, 1, 1,
-1.295169, 1.435349, -0.8848222, 1, 1, 1, 1, 1,
-1.285545, -0.6456147, -3.335061, 1, 1, 1, 1, 1,
-1.281173, -1.927319, -1.944387, 1, 1, 1, 1, 1,
-1.270709, 1.292611, -2.032914, 1, 1, 1, 1, 1,
-1.255553, 1.152535, -0.2548683, 1, 1, 1, 1, 1,
-1.254246, -0.4452733, -2.09317, 1, 1, 1, 1, 1,
-1.251701, -0.05448698, -1.1141, 1, 1, 1, 1, 1,
-1.248659, -1.089484, -2.54175, 0, 0, 1, 1, 1,
-1.247353, -0.06630631, -0.2408684, 1, 0, 0, 1, 1,
-1.242208, -0.5604084, -1.610984, 1, 0, 0, 1, 1,
-1.239585, -0.3352486, -1.748811, 1, 0, 0, 1, 1,
-1.233543, 0.1739287, -2.202955, 1, 0, 0, 1, 1,
-1.23129, 0.4171228, 0.2126512, 1, 0, 0, 1, 1,
-1.22274, 0.4161465, -0.6525248, 0, 0, 0, 1, 1,
-1.221689, 0.4224587, -1.67874, 0, 0, 0, 1, 1,
-1.218091, -0.424555, -2.894297, 0, 0, 0, 1, 1,
-1.21256, 0.3112355, -2.634828, 0, 0, 0, 1, 1,
-1.211094, -1.536812, -2.691977, 0, 0, 0, 1, 1,
-1.205507, -0.0900701, -2.056796, 0, 0, 0, 1, 1,
-1.191959, 1.09557, -0.630962, 0, 0, 0, 1, 1,
-1.184803, 0.3419119, -0.3169335, 1, 1, 1, 1, 1,
-1.182166, -0.5079636, -1.469389, 1, 1, 1, 1, 1,
-1.171494, -1.499848, -1.248376, 1, 1, 1, 1, 1,
-1.169718, -1.114171, -3.056498, 1, 1, 1, 1, 1,
-1.158239, 0.850307, -0.8166698, 1, 1, 1, 1, 1,
-1.1571, 0.03350217, -3.633706, 1, 1, 1, 1, 1,
-1.14494, -0.325716, -3.060826, 1, 1, 1, 1, 1,
-1.142148, -0.3827623, -0.7957548, 1, 1, 1, 1, 1,
-1.136725, 0.4098639, 0.7191802, 1, 1, 1, 1, 1,
-1.135117, 1.430838, -1.018506, 1, 1, 1, 1, 1,
-1.130932, 0.1819604, -0.105281, 1, 1, 1, 1, 1,
-1.122367, -1.599577, -2.942637, 1, 1, 1, 1, 1,
-1.116714, -0.1460747, -1.2836, 1, 1, 1, 1, 1,
-1.097654, -1.752773, -2.191074, 1, 1, 1, 1, 1,
-1.096273, -0.5919691, -2.777549, 1, 1, 1, 1, 1,
-1.093108, 0.5323027, -1.077325, 0, 0, 1, 1, 1,
-1.092871, 1.455156, -1.812582, 1, 0, 0, 1, 1,
-1.086981, -1.910782, -3.118469, 1, 0, 0, 1, 1,
-1.084226, -0.03854262, -2.771406, 1, 0, 0, 1, 1,
-1.07392, -1.515869, -0.6788857, 1, 0, 0, 1, 1,
-1.068989, -0.7004237, -2.966134, 1, 0, 0, 1, 1,
-1.063115, -0.1413253, -2.4, 0, 0, 0, 1, 1,
-1.062019, -0.6728861, -3.937179, 0, 0, 0, 1, 1,
-1.060807, 0.4151452, -0.6809337, 0, 0, 0, 1, 1,
-1.057507, -1.707258, -3.73791, 0, 0, 0, 1, 1,
-1.057196, 0.258399, 0.2458444, 0, 0, 0, 1, 1,
-1.054403, -0.3240971, -1.061488, 0, 0, 0, 1, 1,
-1.052451, -0.6137878, -2.866352, 0, 0, 0, 1, 1,
-1.052098, -1.214603, -2.798919, 1, 1, 1, 1, 1,
-1.051054, -0.458448, -3.96407, 1, 1, 1, 1, 1,
-1.049348, 0.5679356, -1.178834, 1, 1, 1, 1, 1,
-1.04501, 0.06899765, -1.11864, 1, 1, 1, 1, 1,
-1.044024, -1.066602, -2.229718, 1, 1, 1, 1, 1,
-1.039853, -0.04044497, -2.515761, 1, 1, 1, 1, 1,
-1.026004, 0.3189884, -0.07993088, 1, 1, 1, 1, 1,
-1.022466, 0.6159056, -1.093272, 1, 1, 1, 1, 1,
-1.021688, -0.751753, -4.336781, 1, 1, 1, 1, 1,
-1.014248, -1.378227, -2.736357, 1, 1, 1, 1, 1,
-1.010277, -1.422574, -2.50831, 1, 1, 1, 1, 1,
-1.005347, 1.276322, 1.295634, 1, 1, 1, 1, 1,
-1.001207, 2.043513, -0.6351658, 1, 1, 1, 1, 1,
-1.000403, 1.127478, -0.0299777, 1, 1, 1, 1, 1,
-0.9999724, -1.579111, -1.825218, 1, 1, 1, 1, 1,
-0.9996821, 0.4337043, -1.888206, 0, 0, 1, 1, 1,
-0.9979406, -0.5955544, -3.426319, 1, 0, 0, 1, 1,
-0.9971936, 1.770255, 0.1081961, 1, 0, 0, 1, 1,
-0.9924372, -0.3470866, -2.833814, 1, 0, 0, 1, 1,
-0.9806858, -0.6816597, -1.196056, 1, 0, 0, 1, 1,
-0.9802653, -0.9419264, -1.783936, 1, 0, 0, 1, 1,
-0.9799666, -0.09703609, -2.486775, 0, 0, 0, 1, 1,
-0.9799314, 0.2366817, -1.509644, 0, 0, 0, 1, 1,
-0.9707149, 1.393042, -1.541981, 0, 0, 0, 1, 1,
-0.9642289, -1.486995, -2.346621, 0, 0, 0, 1, 1,
-0.9626319, 0.8946802, 0.07663103, 0, 0, 0, 1, 1,
-0.9626287, -1.024882, -2.608947, 0, 0, 0, 1, 1,
-0.9599271, 0.6966841, 0.5689007, 0, 0, 0, 1, 1,
-0.9598725, 0.9935372, -1.996839, 1, 1, 1, 1, 1,
-0.9585688, -0.3574448, -1.932995, 1, 1, 1, 1, 1,
-0.9555492, 0.5230581, -1.7792, 1, 1, 1, 1, 1,
-0.9537098, -0.3273902, -0.9561027, 1, 1, 1, 1, 1,
-0.9413637, 0.1211302, -1.546133, 1, 1, 1, 1, 1,
-0.9402775, -0.5584104, -2.408367, 1, 1, 1, 1, 1,
-0.9395368, -0.6151975, -3.411908, 1, 1, 1, 1, 1,
-0.9381822, -0.5397695, -2.806475, 1, 1, 1, 1, 1,
-0.9332507, -0.6851235, -3.487446, 1, 1, 1, 1, 1,
-0.932058, -1.07051, -2.282862, 1, 1, 1, 1, 1,
-0.9291177, 1.735349, 1.802484, 1, 1, 1, 1, 1,
-0.9255821, -1.567528, -3.015352, 1, 1, 1, 1, 1,
-0.9165068, 1.399476, 0.3404227, 1, 1, 1, 1, 1,
-0.9114589, 0.7143736, -0.9734477, 1, 1, 1, 1, 1,
-0.9091805, 1.219436, -0.403807, 1, 1, 1, 1, 1,
-0.8974636, -0.9046888, -2.385367, 0, 0, 1, 1, 1,
-0.8974188, -0.6410717, -1.930544, 1, 0, 0, 1, 1,
-0.8902948, 0.6264793, -1.716817, 1, 0, 0, 1, 1,
-0.8874846, 1.997153, 0.7333296, 1, 0, 0, 1, 1,
-0.8832625, -0.3320275, -2.676848, 1, 0, 0, 1, 1,
-0.8779811, 0.2816295, -1.045348, 1, 0, 0, 1, 1,
-0.874301, -0.8286712, -1.175611, 0, 0, 0, 1, 1,
-0.8658851, 0.3049352, 0.1292459, 0, 0, 0, 1, 1,
-0.8652995, 2.201242, -2.97624, 0, 0, 0, 1, 1,
-0.8647379, 0.4639947, 0.454925, 0, 0, 0, 1, 1,
-0.8623686, 1.49507, -1.884224, 0, 0, 0, 1, 1,
-0.8553417, 1.034213, -1.79529, 0, 0, 0, 1, 1,
-0.854988, 2.338685, -0.2317893, 0, 0, 0, 1, 1,
-0.8420455, 0.1279193, -0.8247988, 1, 1, 1, 1, 1,
-0.8412812, 0.7486083, 0.5724803, 1, 1, 1, 1, 1,
-0.8333079, 0.3200626, -1.445799, 1, 1, 1, 1, 1,
-0.8230928, -0.02783856, -1.503513, 1, 1, 1, 1, 1,
-0.8213603, -0.1050125, -3.377827, 1, 1, 1, 1, 1,
-0.8208798, -1.507269, -1.755494, 1, 1, 1, 1, 1,
-0.8202403, 0.546717, 0.1822731, 1, 1, 1, 1, 1,
-0.8151698, 0.7799854, 0.5034122, 1, 1, 1, 1, 1,
-0.8118982, -0.1887609, -1.648561, 1, 1, 1, 1, 1,
-0.8106573, 0.05422689, -2.355221, 1, 1, 1, 1, 1,
-0.8093492, -0.3060694, -1.342245, 1, 1, 1, 1, 1,
-0.8063168, 0.5990021, -1.498068, 1, 1, 1, 1, 1,
-0.8060463, -1.885329, -3.057059, 1, 1, 1, 1, 1,
-0.8028579, -0.7986936, -3.083218, 1, 1, 1, 1, 1,
-0.795919, -0.8955352, -4.223894, 1, 1, 1, 1, 1,
-0.7912732, -0.5432458, -1.813904, 0, 0, 1, 1, 1,
-0.774843, -1.1534, -2.952135, 1, 0, 0, 1, 1,
-0.7741613, -0.1163492, -1.013057, 1, 0, 0, 1, 1,
-0.7700412, -1.966504, -2.937949, 1, 0, 0, 1, 1,
-0.767481, 0.1662506, -2.076453, 1, 0, 0, 1, 1,
-0.7668002, 1.156543, 0.32348, 1, 0, 0, 1, 1,
-0.7628688, -0.05201213, -2.495959, 0, 0, 0, 1, 1,
-0.7579755, 2.072422, 0.839356, 0, 0, 0, 1, 1,
-0.7576495, 2.038792, 1.425255, 0, 0, 0, 1, 1,
-0.75605, -0.3933133, -4.723595, 0, 0, 0, 1, 1,
-0.7536183, -0.3039019, -0.3712686, 0, 0, 0, 1, 1,
-0.7532335, 1.17867, -1.04507, 0, 0, 0, 1, 1,
-0.7511275, -2.200091, -4.29554, 0, 0, 0, 1, 1,
-0.751038, -0.4704632, -1.877657, 1, 1, 1, 1, 1,
-0.7495108, -0.7397171, -3.827893, 1, 1, 1, 1, 1,
-0.7462357, -0.5908328, -0.924086, 1, 1, 1, 1, 1,
-0.7397781, -0.1360815, -1.574156, 1, 1, 1, 1, 1,
-0.7361423, 0.7712565, -1.338709, 1, 1, 1, 1, 1,
-0.7338658, 2.64358, -2.229514, 1, 1, 1, 1, 1,
-0.7287726, 0.3240233, -2.512691, 1, 1, 1, 1, 1,
-0.7264507, 1.873458, -1.334667, 1, 1, 1, 1, 1,
-0.7260501, 0.7861637, -0.9268354, 1, 1, 1, 1, 1,
-0.7234643, 0.2093427, -0.5788609, 1, 1, 1, 1, 1,
-0.7214462, 1.12973, -0.783303, 1, 1, 1, 1, 1,
-0.7178323, 1.293964, 0.1506564, 1, 1, 1, 1, 1,
-0.7126644, -0.4644221, -2.016731, 1, 1, 1, 1, 1,
-0.7067918, -1.575865, -2.528414, 1, 1, 1, 1, 1,
-0.7062486, -0.2962678, -3.980568, 1, 1, 1, 1, 1,
-0.6972865, 0.9667659, 1.74729, 0, 0, 1, 1, 1,
-0.696319, 0.8361031, -0.2408009, 1, 0, 0, 1, 1,
-0.6887431, -0.06242616, 0.6941923, 1, 0, 0, 1, 1,
-0.6854367, 1.26691, 0.2373513, 1, 0, 0, 1, 1,
-0.6808178, -0.4997307, -0.6848563, 1, 0, 0, 1, 1,
-0.6803421, 1.418024, -0.3002091, 1, 0, 0, 1, 1,
-0.679757, 0.1379106, -1.636553, 0, 0, 0, 1, 1,
-0.6775175, 0.2856542, 0.1151886, 0, 0, 0, 1, 1,
-0.6736465, 0.666279, -0.8326524, 0, 0, 0, 1, 1,
-0.6660859, 0.3133704, -0.7878509, 0, 0, 0, 1, 1,
-0.6649314, 1.335734, -0.3837056, 0, 0, 0, 1, 1,
-0.6622831, -0.6732172, -3.977991, 0, 0, 0, 1, 1,
-0.6590564, 0.4296925, -1.125459, 0, 0, 0, 1, 1,
-0.6545218, -0.2157559, -2.670268, 1, 1, 1, 1, 1,
-0.6524872, 0.2243488, -0.2948904, 1, 1, 1, 1, 1,
-0.6499059, -1.373789, -2.596958, 1, 1, 1, 1, 1,
-0.6422927, 0.1227749, -2.201365, 1, 1, 1, 1, 1,
-0.6420795, 0.6566635, -1.6654, 1, 1, 1, 1, 1,
-0.6401693, -0.2954823, -1.088392, 1, 1, 1, 1, 1,
-0.6388982, 0.806471, -0.2180968, 1, 1, 1, 1, 1,
-0.6371207, -0.08143671, -1.654253, 1, 1, 1, 1, 1,
-0.6353288, 1.223517, -0.8156757, 1, 1, 1, 1, 1,
-0.6323059, 0.4142105, 0.9213215, 1, 1, 1, 1, 1,
-0.6319776, 0.8543073, 0.2062629, 1, 1, 1, 1, 1,
-0.6312017, -0.511609, -0.7352225, 1, 1, 1, 1, 1,
-0.6294008, 0.6459338, -2.426573, 1, 1, 1, 1, 1,
-0.628983, 0.1153018, -1.630446, 1, 1, 1, 1, 1,
-0.6249343, 0.7043332, -2.169517, 1, 1, 1, 1, 1,
-0.6236825, 0.2932056, -2.781258, 0, 0, 1, 1, 1,
-0.6230813, 0.1061136, -0.2299065, 1, 0, 0, 1, 1,
-0.6224624, -0.2148002, -0.5272578, 1, 0, 0, 1, 1,
-0.6214509, 0.2668059, -1.791009, 1, 0, 0, 1, 1,
-0.6191764, 1.222572, 0.1822522, 1, 0, 0, 1, 1,
-0.6093603, -0.4907497, -2.713639, 1, 0, 0, 1, 1,
-0.6038741, -0.6110759, -2.721593, 0, 0, 0, 1, 1,
-0.6028715, 0.4681852, -1.741765, 0, 0, 0, 1, 1,
-0.5949227, 0.6090347, -0.8548691, 0, 0, 0, 1, 1,
-0.5936698, 0.2078238, -2.953432, 0, 0, 0, 1, 1,
-0.5902327, -1.012985, -2.627638, 0, 0, 0, 1, 1,
-0.5891107, 0.3227428, -1.005323, 0, 0, 0, 1, 1,
-0.587105, -0.09256541, -2.335576, 0, 0, 0, 1, 1,
-0.5838949, 0.1063521, -1.622977, 1, 1, 1, 1, 1,
-0.5821776, 1.177428, 0.2121798, 1, 1, 1, 1, 1,
-0.5727634, -1.152947, -3.531064, 1, 1, 1, 1, 1,
-0.5699574, -0.03111423, -1.680042, 1, 1, 1, 1, 1,
-0.5632687, -1.333044, -2.36251, 1, 1, 1, 1, 1,
-0.562147, 0.2428106, -1.027251, 1, 1, 1, 1, 1,
-0.5612558, 1.190092, -0.5799488, 1, 1, 1, 1, 1,
-0.554751, 0.1788083, -1.663936, 1, 1, 1, 1, 1,
-0.5541342, -0.4152873, -1.409971, 1, 1, 1, 1, 1,
-0.5531238, 1.882306, 0.4338524, 1, 1, 1, 1, 1,
-0.5488259, -1.879676, -4.017259, 1, 1, 1, 1, 1,
-0.5478786, 2.410747, 1.109281, 1, 1, 1, 1, 1,
-0.5477132, -1.058988, -0.9513607, 1, 1, 1, 1, 1,
-0.5306315, -0.3186163, -2.191722, 1, 1, 1, 1, 1,
-0.5297442, 0.3363033, -1.263143, 1, 1, 1, 1, 1,
-0.5275468, 1.177669, 0.3237765, 0, 0, 1, 1, 1,
-0.5250481, -0.8456425, -4.267055, 1, 0, 0, 1, 1,
-0.5231552, -0.02113664, -1.829931, 1, 0, 0, 1, 1,
-0.5230288, 0.3415742, -1.839403, 1, 0, 0, 1, 1,
-0.5202225, -0.2924319, -1.199326, 1, 0, 0, 1, 1,
-0.5194367, 0.9506412, 0.2206449, 1, 0, 0, 1, 1,
-0.5051848, -1.071885, -3.207676, 0, 0, 0, 1, 1,
-0.5026278, 0.6061667, -0.7456686, 0, 0, 0, 1, 1,
-0.4973192, 1.740627, -0.2088152, 0, 0, 0, 1, 1,
-0.4969749, 0.01796308, -2.135852, 0, 0, 0, 1, 1,
-0.496592, 0.4798055, 0.3444783, 0, 0, 0, 1, 1,
-0.4958902, 0.7872913, -2.494545, 0, 0, 0, 1, 1,
-0.4955424, -1.901599, -2.133717, 0, 0, 0, 1, 1,
-0.4912438, 0.7260672, -1.662825, 1, 1, 1, 1, 1,
-0.4899877, -1.713684, -4.538064, 1, 1, 1, 1, 1,
-0.4876177, -0.3703335, -2.539383, 1, 1, 1, 1, 1,
-0.4825122, 0.1195052, -1.447418, 1, 1, 1, 1, 1,
-0.4813561, 0.3375362, -2.56596, 1, 1, 1, 1, 1,
-0.4758147, 0.8764639, 0.158146, 1, 1, 1, 1, 1,
-0.4751131, -0.9051084, -1.929271, 1, 1, 1, 1, 1,
-0.471626, -0.203241, -2.566782, 1, 1, 1, 1, 1,
-0.4711756, 0.7605209, -0.7930304, 1, 1, 1, 1, 1,
-0.4595588, 0.6664577, 1.203324, 1, 1, 1, 1, 1,
-0.4577743, -1.427201, -2.738722, 1, 1, 1, 1, 1,
-0.4546558, 2.531819, -0.6987598, 1, 1, 1, 1, 1,
-0.4528154, -0.5582763, -4.218509, 1, 1, 1, 1, 1,
-0.4511811, 0.2334253, -1.77281, 1, 1, 1, 1, 1,
-0.4477079, -1.335491, -2.052977, 1, 1, 1, 1, 1,
-0.4470169, -0.9556782, -3.332026, 0, 0, 1, 1, 1,
-0.4438799, -1.353892, -2.069315, 1, 0, 0, 1, 1,
-0.4427705, 1.080056, -1.508262, 1, 0, 0, 1, 1,
-0.4420157, 0.2105287, -1.984412, 1, 0, 0, 1, 1,
-0.4416243, -0.6062363, -2.861601, 1, 0, 0, 1, 1,
-0.4414364, 0.5679359, -0.2855721, 1, 0, 0, 1, 1,
-0.4402351, -0.7574751, -2.078852, 0, 0, 0, 1, 1,
-0.4379297, -0.9755217, -3.188521, 0, 0, 0, 1, 1,
-0.4355977, 0.1500587, -2.263398, 0, 0, 0, 1, 1,
-0.43552, -0.4526545, -3.313997, 0, 0, 0, 1, 1,
-0.4336793, -0.4198763, -2.309072, 0, 0, 0, 1, 1,
-0.4334952, -0.783915, -2.924314, 0, 0, 0, 1, 1,
-0.4322128, 0.4230789, -0.9477953, 0, 0, 0, 1, 1,
-0.4317455, -0.9296557, -1.784268, 1, 1, 1, 1, 1,
-0.4299444, -1.084969, -3.455953, 1, 1, 1, 1, 1,
-0.4258539, -0.3826502, -2.179216, 1, 1, 1, 1, 1,
-0.424093, -0.04165257, -1.687057, 1, 1, 1, 1, 1,
-0.4226443, -0.06042449, -1.81015, 1, 1, 1, 1, 1,
-0.4219868, 0.4025811, -0.6521961, 1, 1, 1, 1, 1,
-0.4202036, 0.5462895, 1.398338, 1, 1, 1, 1, 1,
-0.4198213, -0.8460656, -1.676474, 1, 1, 1, 1, 1,
-0.4192436, 0.1040411, -1.210739, 1, 1, 1, 1, 1,
-0.4188057, -0.9063854, -2.108945, 1, 1, 1, 1, 1,
-0.4149202, -0.4167138, -2.292859, 1, 1, 1, 1, 1,
-0.4120193, 0.5217457, -2.030993, 1, 1, 1, 1, 1,
-0.4113575, -1.009789, -2.858669, 1, 1, 1, 1, 1,
-0.4082706, -0.8955143, -2.570897, 1, 1, 1, 1, 1,
-0.4037038, -1.800725, -1.79992, 1, 1, 1, 1, 1,
-0.4030342, -0.2064471, -1.498981, 0, 0, 1, 1, 1,
-0.4024345, 1.546122, 0.1880794, 1, 0, 0, 1, 1,
-0.3973782, 0.8292363, 1.244987, 1, 0, 0, 1, 1,
-0.3964124, 1.661726, -0.3470042, 1, 0, 0, 1, 1,
-0.3953944, -1.134667, -2.499112, 1, 0, 0, 1, 1,
-0.3928111, -0.101045, -0.4270441, 1, 0, 0, 1, 1,
-0.3919634, -0.1560956, -1.237074, 0, 0, 0, 1, 1,
-0.3904603, -0.5391412, -1.215342, 0, 0, 0, 1, 1,
-0.3898251, -0.5109199, -3.014565, 0, 0, 0, 1, 1,
-0.3892343, 0.8307696, -1.560816, 0, 0, 0, 1, 1,
-0.3891056, -0.349818, -1.827764, 0, 0, 0, 1, 1,
-0.3868195, -0.3762235, -3.713409, 0, 0, 0, 1, 1,
-0.3852878, 1.132659, 1.027158, 0, 0, 0, 1, 1,
-0.3840713, -1.094089, -3.760021, 1, 1, 1, 1, 1,
-0.3829859, -0.9769766, -1.742461, 1, 1, 1, 1, 1,
-0.3826493, -1.001177, -3.725599, 1, 1, 1, 1, 1,
-0.3793474, -0.6403899, -2.781314, 1, 1, 1, 1, 1,
-0.3783916, 0.6022232, -0.228563, 1, 1, 1, 1, 1,
-0.3774564, 0.1194875, -0.02280903, 1, 1, 1, 1, 1,
-0.3768363, -0.2967378, 0.3536702, 1, 1, 1, 1, 1,
-0.3761894, -0.3630072, -2.959214, 1, 1, 1, 1, 1,
-0.3760773, 0.4958256, 0.6066708, 1, 1, 1, 1, 1,
-0.3753464, -0.5991899, -1.718464, 1, 1, 1, 1, 1,
-0.3712029, 0.1187456, -1.078301, 1, 1, 1, 1, 1,
-0.3699326, 0.03768522, -1.551427, 1, 1, 1, 1, 1,
-0.3610922, 0.7314019, -1.340712, 1, 1, 1, 1, 1,
-0.3524653, 1.049319, 3.328357, 1, 1, 1, 1, 1,
-0.3496323, 0.1366888, -1.269239, 1, 1, 1, 1, 1,
-0.3482835, -0.413216, -2.92858, 0, 0, 1, 1, 1,
-0.3464877, 2.468313, 0.400405, 1, 0, 0, 1, 1,
-0.3418174, 1.038512, 0.2694591, 1, 0, 0, 1, 1,
-0.3377393, 0.8096141, -0.7664654, 1, 0, 0, 1, 1,
-0.3335527, 1.191725, 0.5648913, 1, 0, 0, 1, 1,
-0.3318912, -0.07063953, -2.678224, 1, 0, 0, 1, 1,
-0.3299659, -0.8711183, -2.37746, 0, 0, 0, 1, 1,
-0.3298149, -0.5057564, -2.422292, 0, 0, 0, 1, 1,
-0.3194971, 0.3823306, -0.4012363, 0, 0, 0, 1, 1,
-0.3173372, 0.1531156, -1.887753, 0, 0, 0, 1, 1,
-0.3171031, 0.5708422, -2.110576, 0, 0, 0, 1, 1,
-0.3162263, -0.3079852, -2.810229, 0, 0, 0, 1, 1,
-0.3158863, 0.7323397, -1.290127, 0, 0, 0, 1, 1,
-0.3142687, 0.007752556, -2.621497, 1, 1, 1, 1, 1,
-0.3113779, -0.4177963, -1.983046, 1, 1, 1, 1, 1,
-0.3089584, -0.3795672, -3.229556, 1, 1, 1, 1, 1,
-0.3064347, 0.8573412, 0.3488466, 1, 1, 1, 1, 1,
-0.3053188, 0.4958719, 0.2611431, 1, 1, 1, 1, 1,
-0.3048342, -1.6631, -1.787971, 1, 1, 1, 1, 1,
-0.3014663, 0.3337595, 0.2077031, 1, 1, 1, 1, 1,
-0.2996308, -2.402424, -3.881405, 1, 1, 1, 1, 1,
-0.2980814, -0.03486806, -0.8726746, 1, 1, 1, 1, 1,
-0.2948507, 1.968355, 0.3200247, 1, 1, 1, 1, 1,
-0.2932646, -0.6865627, -3.256862, 1, 1, 1, 1, 1,
-0.2904122, 0.6243876, -0.5924542, 1, 1, 1, 1, 1,
-0.2859816, -0.3281501, -1.337585, 1, 1, 1, 1, 1,
-0.2841139, 1.257944, 1.558526, 1, 1, 1, 1, 1,
-0.2839792, -0.1536312, -3.610502, 1, 1, 1, 1, 1,
-0.282524, 0.6570416, 0.6344303, 0, 0, 1, 1, 1,
-0.2782899, -1.436261, -3.484261, 1, 0, 0, 1, 1,
-0.2738842, -1.099804, -3.351293, 1, 0, 0, 1, 1,
-0.265433, -1.242602, -1.50769, 1, 0, 0, 1, 1,
-0.2652102, -0.6634032, -1.274333, 1, 0, 0, 1, 1,
-0.2651725, 1.102517, -0.1457997, 1, 0, 0, 1, 1,
-0.2588119, -0.1507295, -1.730519, 0, 0, 0, 1, 1,
-0.2568201, -0.7755309, -2.866183, 0, 0, 0, 1, 1,
-0.2565041, 0.1230562, -1.022219, 0, 0, 0, 1, 1,
-0.2560395, -0.9928105, -2.160221, 0, 0, 0, 1, 1,
-0.2553146, -0.663277, -3.035561, 0, 0, 0, 1, 1,
-0.2531034, 0.2455773, -0.9946142, 0, 0, 0, 1, 1,
-0.2469334, 0.5704743, -0.1530167, 0, 0, 0, 1, 1,
-0.2454699, -0.8829558, -2.898939, 1, 1, 1, 1, 1,
-0.2414684, -0.328087, -1.844848, 1, 1, 1, 1, 1,
-0.2411939, 0.7349923, 0.2982817, 1, 1, 1, 1, 1,
-0.2385527, -1.974836, -2.267737, 1, 1, 1, 1, 1,
-0.2314493, 1.17248, 0.7174554, 1, 1, 1, 1, 1,
-0.2290876, 0.5022529, -0.2456681, 1, 1, 1, 1, 1,
-0.2280626, 1.325408, 0.7083144, 1, 1, 1, 1, 1,
-0.2279169, 1.268741, -0.718523, 1, 1, 1, 1, 1,
-0.2254534, -0.9204653, -2.103113, 1, 1, 1, 1, 1,
-0.2146918, -1.111359, -2.025082, 1, 1, 1, 1, 1,
-0.2140609, 0.1724267, -1.62118, 1, 1, 1, 1, 1,
-0.2111677, 0.4760431, 0.2649636, 1, 1, 1, 1, 1,
-0.2105599, 0.07599056, -1.632551, 1, 1, 1, 1, 1,
-0.2091867, -1.006407, -3.384345, 1, 1, 1, 1, 1,
-0.2027403, -1.804016, -3.426145, 1, 1, 1, 1, 1,
-0.2001466, -1.094006, -1.288415, 0, 0, 1, 1, 1,
-0.1985061, 0.8297901, 1.475209, 1, 0, 0, 1, 1,
-0.1972115, 0.8550427, -0.7258134, 1, 0, 0, 1, 1,
-0.1947719, -0.3297112, -1.199628, 1, 0, 0, 1, 1,
-0.1886561, -0.7017518, -2.824647, 1, 0, 0, 1, 1,
-0.1862778, -0.2672716, -2.697433, 1, 0, 0, 1, 1,
-0.1803112, -0.1310753, -2.654166, 0, 0, 0, 1, 1,
-0.1789195, -0.4109109, -3.184029, 0, 0, 0, 1, 1,
-0.1779332, -0.8831235, -4.2242, 0, 0, 0, 1, 1,
-0.1776787, 0.793674, -0.4087339, 0, 0, 0, 1, 1,
-0.173344, 0.7165486, 0.3398699, 0, 0, 0, 1, 1,
-0.1733245, 1.931843, 1.443106, 0, 0, 0, 1, 1,
-0.1731075, 0.2874326, 0.2751713, 0, 0, 0, 1, 1,
-0.1726904, -0.1413327, -2.989989, 1, 1, 1, 1, 1,
-0.1639284, -0.3935407, -4.035063, 1, 1, 1, 1, 1,
-0.1622568, -0.0379265, -2.931023, 1, 1, 1, 1, 1,
-0.1611883, 0.6150857, -0.2992078, 1, 1, 1, 1, 1,
-0.1579732, 2.260509, 1.943476, 1, 1, 1, 1, 1,
-0.1568857, -1.063448, -2.571797, 1, 1, 1, 1, 1,
-0.1552382, -0.8423398, -1.359051, 1, 1, 1, 1, 1,
-0.1495779, -0.08734065, -0.3847573, 1, 1, 1, 1, 1,
-0.1429366, 0.3006403, 0.3026315, 1, 1, 1, 1, 1,
-0.1419939, -1.908933, -4.118575, 1, 1, 1, 1, 1,
-0.1369894, -0.2740242, -3.315883, 1, 1, 1, 1, 1,
-0.1313841, -0.7918881, -3.616034, 1, 1, 1, 1, 1,
-0.1301922, -1.617253, -2.576055, 1, 1, 1, 1, 1,
-0.1283435, 1.515214, 0.8197276, 1, 1, 1, 1, 1,
-0.1225582, -0.5433607, -3.418343, 1, 1, 1, 1, 1,
-0.114677, 0.1453277, -0.6301317, 0, 0, 1, 1, 1,
-0.1063747, -0.909806, -2.716408, 1, 0, 0, 1, 1,
-0.1015785, 1.567646, 0.6525733, 1, 0, 0, 1, 1,
-0.09970918, 0.8458341, -0.1255919, 1, 0, 0, 1, 1,
-0.09895309, 0.1070389, -1.444556, 1, 0, 0, 1, 1,
-0.09729226, -0.9813212, -3.96387, 1, 0, 0, 1, 1,
-0.09264085, 0.5436085, 0.3429626, 0, 0, 0, 1, 1,
-0.09017884, -1.887089, -4.294126, 0, 0, 0, 1, 1,
-0.09011021, 1.213706, 1.899596, 0, 0, 0, 1, 1,
-0.08809467, 1.265479, 0.6204939, 0, 0, 0, 1, 1,
-0.08785269, 0.2231248, -1.743236, 0, 0, 0, 1, 1,
-0.08391975, -0.4846003, -2.589044, 0, 0, 0, 1, 1,
-0.08041831, -1.928172, -2.20365, 0, 0, 0, 1, 1,
-0.07503947, -0.1873956, -4.094634, 1, 1, 1, 1, 1,
-0.07411041, -0.9563881, -3.263966, 1, 1, 1, 1, 1,
-0.06999878, -0.8654758, -3.343296, 1, 1, 1, 1, 1,
-0.06332874, -0.2477422, -3.599543, 1, 1, 1, 1, 1,
-0.06131337, 0.1474724, -1.488454, 1, 1, 1, 1, 1,
-0.0603921, -0.8468016, -4.032288, 1, 1, 1, 1, 1,
-0.05579373, -0.265362, -1.574611, 1, 1, 1, 1, 1,
-0.05166538, -0.2823905, -4.050647, 1, 1, 1, 1, 1,
-0.05065026, -0.1314983, -4.677762, 1, 1, 1, 1, 1,
-0.04962686, 0.7844317, 0.6732841, 1, 1, 1, 1, 1,
-0.04784933, -0.8880509, -4.518259, 1, 1, 1, 1, 1,
-0.04779989, -1.025706, -3.902179, 1, 1, 1, 1, 1,
-0.04256997, 1.461249, 1.536506, 1, 1, 1, 1, 1,
-0.04119405, -2.356649, -4.439211, 1, 1, 1, 1, 1,
-0.04026381, 0.7570515, 1.769769, 1, 1, 1, 1, 1,
-0.03754723, 0.09106755, -3.491636, 0, 0, 1, 1, 1,
-0.03706157, -0.1943602, -2.567469, 1, 0, 0, 1, 1,
-0.02718971, 0.7758442, 0.423876, 1, 0, 0, 1, 1,
-0.01923468, 0.6131601, 0.6259891, 1, 0, 0, 1, 1,
-0.01855623, 0.4430915, -0.9199792, 1, 0, 0, 1, 1,
-0.01749654, 0.218506, 0.03735211, 1, 0, 0, 1, 1,
-0.01741908, 0.211672, -1.226612, 0, 0, 0, 1, 1,
-0.01379078, -0.6641623, -3.042299, 0, 0, 0, 1, 1,
-0.01221074, -0.2307623, -3.083212, 0, 0, 0, 1, 1,
-0.01085605, 0.8701081, -0.7622217, 0, 0, 0, 1, 1,
-0.01037139, -0.9152954, -2.706707, 0, 0, 0, 1, 1,
-0.008812957, 1.883466, 0.7063736, 0, 0, 0, 1, 1,
-0.007107371, 1.068372, 0.6148457, 0, 0, 0, 1, 1,
-0.006710002, -0.1772687, -2.439706, 1, 1, 1, 1, 1,
-0.006545777, 1.567527, -0.3730811, 1, 1, 1, 1, 1,
-0.0001477044, 0.03142222, 0.5262038, 1, 1, 1, 1, 1,
0.001184793, 0.2392927, 0.7365737, 1, 1, 1, 1, 1,
0.00436361, -0.3381417, 3.735575, 1, 1, 1, 1, 1,
0.006502439, -1.437726, 1.615991, 1, 1, 1, 1, 1,
0.008955707, 1.157218, 0.9485105, 1, 1, 1, 1, 1,
0.01497544, -1.595739, 4.664494, 1, 1, 1, 1, 1,
0.015629, -0.4067402, 3.094589, 1, 1, 1, 1, 1,
0.01696997, 0.3166575, -0.07439855, 1, 1, 1, 1, 1,
0.02063472, 0.1729085, 1.743567, 1, 1, 1, 1, 1,
0.02121558, 0.6368945, 0.1150089, 1, 1, 1, 1, 1,
0.02943217, 1.746501, 0.03857833, 1, 1, 1, 1, 1,
0.04321551, 0.8033026, 0.9398915, 1, 1, 1, 1, 1,
0.04435696, 2.100987, -1.444701, 1, 1, 1, 1, 1,
0.04595591, 0.00557577, 2.348333, 0, 0, 1, 1, 1,
0.04611902, 0.2598431, -0.2393624, 1, 0, 0, 1, 1,
0.04684681, 1.039893, 0.8982996, 1, 0, 0, 1, 1,
0.04902223, 0.9401363, -0.6754177, 1, 0, 0, 1, 1,
0.05067789, 0.5472816, -0.08076258, 1, 0, 0, 1, 1,
0.05527686, 0.1582364, 1.285036, 1, 0, 0, 1, 1,
0.05589207, 0.1108139, -0.3346862, 0, 0, 0, 1, 1,
0.05849537, -0.204583, 3.612487, 0, 0, 0, 1, 1,
0.06008043, -1.253523, 3.13669, 0, 0, 0, 1, 1,
0.06105376, -1.53942, 4.16233, 0, 0, 0, 1, 1,
0.06246654, 1.557418, 2.021077, 0, 0, 0, 1, 1,
0.07292686, -0.4335238, 3.857471, 0, 0, 0, 1, 1,
0.07548104, 0.1127795, 0.4972907, 0, 0, 0, 1, 1,
0.0755845, 1.473864, 0.2603361, 1, 1, 1, 1, 1,
0.07631724, -0.8683835, -0.0590639, 1, 1, 1, 1, 1,
0.0781524, -0.2654134, 2.754925, 1, 1, 1, 1, 1,
0.08051753, -1.792626, 2.921105, 1, 1, 1, 1, 1,
0.08438247, -0.5892063, 0.7490296, 1, 1, 1, 1, 1,
0.08455724, 0.967181, -1.200362, 1, 1, 1, 1, 1,
0.08602501, 0.07409928, 0.7278402, 1, 1, 1, 1, 1,
0.09064288, 0.6798214, 0.904842, 1, 1, 1, 1, 1,
0.09101895, -0.6786327, 2.481948, 1, 1, 1, 1, 1,
0.09851033, -0.9641754, 1.378855, 1, 1, 1, 1, 1,
0.100171, -1.736518, 3.158522, 1, 1, 1, 1, 1,
0.1057022, -0.2723095, 2.788788, 1, 1, 1, 1, 1,
0.1087254, 0.916198, 1.22914, 1, 1, 1, 1, 1,
0.1117703, 1.31078, 0.142442, 1, 1, 1, 1, 1,
0.1117977, -1.425824, 3.712156, 1, 1, 1, 1, 1,
0.1124232, -0.8324242, 5.733132, 0, 0, 1, 1, 1,
0.1145077, -0.475252, 2.841119, 1, 0, 0, 1, 1,
0.1172381, -0.9408314, 2.695397, 1, 0, 0, 1, 1,
0.1211304, 2.353324, -1.083093, 1, 0, 0, 1, 1,
0.1238098, -1.20957, 5.173806, 1, 0, 0, 1, 1,
0.128399, -0.3888541, 3.445572, 1, 0, 0, 1, 1,
0.1354977, -1.595279, 2.436666, 0, 0, 0, 1, 1,
0.1370118, -0.0287867, 2.297998, 0, 0, 0, 1, 1,
0.1383516, -0.5779873, 4.244781, 0, 0, 0, 1, 1,
0.1416098, -1.449709, 3.086772, 0, 0, 0, 1, 1,
0.1441087, -0.7502589, 3.282167, 0, 0, 0, 1, 1,
0.1462028, -0.01301664, 3.226608, 0, 0, 0, 1, 1,
0.1466565, 0.7629819, 0.3483101, 0, 0, 0, 1, 1,
0.1501809, 0.7382889, -0.7017319, 1, 1, 1, 1, 1,
0.1542147, 0.9602824, 1.315125, 1, 1, 1, 1, 1,
0.1554012, -0.560997, 3.874367, 1, 1, 1, 1, 1,
0.1571416, -0.1807015, 1.865152, 1, 1, 1, 1, 1,
0.1577711, 0.2650153, 1.477877, 1, 1, 1, 1, 1,
0.1599904, 0.8462639, 0.3156535, 1, 1, 1, 1, 1,
0.1612777, -1.64468, 1.333503, 1, 1, 1, 1, 1,
0.1648767, -2.31879, 2.924951, 1, 1, 1, 1, 1,
0.1654051, 0.1556876, -0.2352185, 1, 1, 1, 1, 1,
0.1676124, 1.67128, 0.7142141, 1, 1, 1, 1, 1,
0.1680617, -0.1170609, 1.713799, 1, 1, 1, 1, 1,
0.1697847, 0.1015104, 1.580693, 1, 1, 1, 1, 1,
0.1740745, -0.5809841, 2.88495, 1, 1, 1, 1, 1,
0.1788573, 0.8717233, -1.207078, 1, 1, 1, 1, 1,
0.1887626, 2.394719, -0.2127407, 1, 1, 1, 1, 1,
0.1893393, -0.7826015, 3.102807, 0, 0, 1, 1, 1,
0.1909568, 0.2741907, -1.393243, 1, 0, 0, 1, 1,
0.1997867, -0.4110021, 2.029376, 1, 0, 0, 1, 1,
0.2000052, -0.5673842, 3.173526, 1, 0, 0, 1, 1,
0.2010967, -0.4961488, 3.126546, 1, 0, 0, 1, 1,
0.2025266, -0.5688024, 2.405668, 1, 0, 0, 1, 1,
0.2032987, 2.076991, 0.447966, 0, 0, 0, 1, 1,
0.2108661, -1.04149, 5.229526, 0, 0, 0, 1, 1,
0.2137862, -1.538704, 4.078665, 0, 0, 0, 1, 1,
0.2146893, 2.608618, 0.2684615, 0, 0, 0, 1, 1,
0.2152647, 0.04768981, 1.026686, 0, 0, 0, 1, 1,
0.2212332, -0.05558115, 3.169722, 0, 0, 0, 1, 1,
0.2235892, 0.498252, 0.8771495, 0, 0, 0, 1, 1,
0.22512, -1.695499, 3.236683, 1, 1, 1, 1, 1,
0.2253001, -1.173874, 2.679907, 1, 1, 1, 1, 1,
0.230332, 1.127649, -0.3950172, 1, 1, 1, 1, 1,
0.2335771, 0.2497543, 0.6370603, 1, 1, 1, 1, 1,
0.2349587, 1.204645, 1.567736, 1, 1, 1, 1, 1,
0.2436795, 0.2984718, 2.27096, 1, 1, 1, 1, 1,
0.2480948, 1.274344, -0.09235057, 1, 1, 1, 1, 1,
0.2512521, 0.7730712, 1.13123, 1, 1, 1, 1, 1,
0.2537971, 0.5704808, -0.8213002, 1, 1, 1, 1, 1,
0.254791, -1.724622, 1.475576, 1, 1, 1, 1, 1,
0.2564702, 0.585891, -0.9147286, 1, 1, 1, 1, 1,
0.2654157, -0.05194947, 1.579739, 1, 1, 1, 1, 1,
0.2665007, 0.2719244, -0.4552692, 1, 1, 1, 1, 1,
0.2779166, 0.08365475, 1.308814, 1, 1, 1, 1, 1,
0.2815658, -0.1609168, 2.006547, 1, 1, 1, 1, 1,
0.2841791, -0.8743274, 2.218648, 0, 0, 1, 1, 1,
0.2845502, -0.1712244, 1.025693, 1, 0, 0, 1, 1,
0.2865011, -0.4993442, 2.776436, 1, 0, 0, 1, 1,
0.2944972, -0.3506795, 1.239269, 1, 0, 0, 1, 1,
0.3008351, -0.9692531, 2.666219, 1, 0, 0, 1, 1,
0.3051311, -1.369772, 4.224173, 1, 0, 0, 1, 1,
0.3061102, -0.07185119, 0.2809404, 0, 0, 0, 1, 1,
0.3104413, 0.1530994, 0.1747489, 0, 0, 0, 1, 1,
0.3110002, 0.5971419, 0.5584823, 0, 0, 0, 1, 1,
0.3125835, 0.1890902, 2.165642, 0, 0, 0, 1, 1,
0.3134077, -0.4388694, 3.031932, 0, 0, 0, 1, 1,
0.3134188, -0.3874814, 2.520815, 0, 0, 0, 1, 1,
0.3139878, -0.04430606, 2.637269, 0, 0, 0, 1, 1,
0.3156871, 0.3170484, -0.939869, 1, 1, 1, 1, 1,
0.3214934, 0.7915827, 0.306086, 1, 1, 1, 1, 1,
0.3299743, 0.7126675, -0.1482588, 1, 1, 1, 1, 1,
0.3360963, -0.398771, 2.776206, 1, 1, 1, 1, 1,
0.3440564, 0.2596186, 2.086771, 1, 1, 1, 1, 1,
0.3450636, 1.552936, -0.1475108, 1, 1, 1, 1, 1,
0.3473275, -0.9086973, 3.306777, 1, 1, 1, 1, 1,
0.3492763, 0.2166083, -0.6294163, 1, 1, 1, 1, 1,
0.3521857, 0.2874542, 0.5482553, 1, 1, 1, 1, 1,
0.3551038, 0.327294, 0.1715467, 1, 1, 1, 1, 1,
0.3613849, -1.140022, 4.207479, 1, 1, 1, 1, 1,
0.362422, 0.0411876, -0.3110726, 1, 1, 1, 1, 1,
0.3649744, -0.5115295, 1.946226, 1, 1, 1, 1, 1,
0.366804, 0.6101801, -0.1377636, 1, 1, 1, 1, 1,
0.3677307, 0.9878474, 0.7846746, 1, 1, 1, 1, 1,
0.3702778, -1.28577, 3.837006, 0, 0, 1, 1, 1,
0.3782617, 0.2940955, -0.7277405, 1, 0, 0, 1, 1,
0.3833036, -0.9008468, 1.607976, 1, 0, 0, 1, 1,
0.386685, 1.849546, 0.7187607, 1, 0, 0, 1, 1,
0.3881918, 1.663495, 1.719983, 1, 0, 0, 1, 1,
0.3882065, 0.9830892, 1.229968, 1, 0, 0, 1, 1,
0.3896503, -0.06662758, 0.9546207, 0, 0, 0, 1, 1,
0.3938126, -0.765049, 2.336654, 0, 0, 0, 1, 1,
0.3944519, -0.1649577, 2.433459, 0, 0, 0, 1, 1,
0.394554, 0.4966176, -0.04036588, 0, 0, 0, 1, 1,
0.3955759, 0.0372833, 2.101158, 0, 0, 0, 1, 1,
0.3966591, 0.3166802, 1.232702, 0, 0, 0, 1, 1,
0.4117849, 0.6388004, -0.009411635, 0, 0, 0, 1, 1,
0.4134008, -0.9262584, 1.56454, 1, 1, 1, 1, 1,
0.4153622, 0.1762247, -0.1399187, 1, 1, 1, 1, 1,
0.4158769, 0.1137129, 2.758122, 1, 1, 1, 1, 1,
0.4220159, 0.6238568, 0.5685287, 1, 1, 1, 1, 1,
0.4240683, 1.578269, -0.4424164, 1, 1, 1, 1, 1,
0.4245614, 0.4001022, 0.5103874, 1, 1, 1, 1, 1,
0.4251556, -0.4501044, 0.9597995, 1, 1, 1, 1, 1,
0.4252594, 0.3977073, 0.3072807, 1, 1, 1, 1, 1,
0.430313, 0.2929582, 1.564288, 1, 1, 1, 1, 1,
0.4329319, 1.353833, -1.247653, 1, 1, 1, 1, 1,
0.4339785, -1.189443, 3.34112, 1, 1, 1, 1, 1,
0.4352869, 0.6491117, 0.8024246, 1, 1, 1, 1, 1,
0.4353889, -1.052709, 2.580482, 1, 1, 1, 1, 1,
0.4407346, -1.765645, 4.336695, 1, 1, 1, 1, 1,
0.4431347, 1.243023, 1.377077, 1, 1, 1, 1, 1,
0.4448009, 0.8875778, 2.483992, 0, 0, 1, 1, 1,
0.4461576, 0.3111433, -0.9150009, 1, 0, 0, 1, 1,
0.4485317, 0.834215, 0.962192, 1, 0, 0, 1, 1,
0.4512979, -0.7925588, 3.122788, 1, 0, 0, 1, 1,
0.4513555, -1.125283, 2.950658, 1, 0, 0, 1, 1,
0.4521311, -1.06511, 2.867999, 1, 0, 0, 1, 1,
0.4526125, -0.5140175, 0.9841655, 0, 0, 0, 1, 1,
0.45283, 0.461058, 0.991142, 0, 0, 0, 1, 1,
0.4585426, 0.8250833, 1.333384, 0, 0, 0, 1, 1,
0.4642175, -1.547689, 1.662358, 0, 0, 0, 1, 1,
0.4648006, 1.374146, 1.121466, 0, 0, 0, 1, 1,
0.4689354, 0.7241277, 0.1984293, 0, 0, 0, 1, 1,
0.4782787, 1.917188, 2.61333, 0, 0, 0, 1, 1,
0.4797099, -0.3089835, 3.692657, 1, 1, 1, 1, 1,
0.484083, -1.963099, 1.926789, 1, 1, 1, 1, 1,
0.4845051, -0.3259344, 1.783688, 1, 1, 1, 1, 1,
0.4859895, -1.029975, 3.406437, 1, 1, 1, 1, 1,
0.4905294, 0.6199555, 1.636045, 1, 1, 1, 1, 1,
0.4940574, -1.306713, 3.742507, 1, 1, 1, 1, 1,
0.4962222, -1.341785, 3.008304, 1, 1, 1, 1, 1,
0.5037352, 0.01579339, 1.1058, 1, 1, 1, 1, 1,
0.5061089, -0.6877225, 2.010845, 1, 1, 1, 1, 1,
0.5063475, -0.4136452, 2.287379, 1, 1, 1, 1, 1,
0.5066934, -0.9620726, 2.891216, 1, 1, 1, 1, 1,
0.5067045, 1.648395, -0.08914118, 1, 1, 1, 1, 1,
0.5128555, -0.4042186, 1.24388, 1, 1, 1, 1, 1,
0.5201899, 0.3967195, 0.8378997, 1, 1, 1, 1, 1,
0.5226769, 0.30388, 3.053326, 1, 1, 1, 1, 1,
0.5287453, 1.511087, 0.9739489, 0, 0, 1, 1, 1,
0.5292435, -0.4493562, 2.819288, 1, 0, 0, 1, 1,
0.5296789, -2.051012, 3.275067, 1, 0, 0, 1, 1,
0.5309877, 0.6861249, 0.8760252, 1, 0, 0, 1, 1,
0.5309919, -0.02049307, 0.8605278, 1, 0, 0, 1, 1,
0.5347136, 0.833567, -0.8870286, 1, 0, 0, 1, 1,
0.5351585, 0.9149561, 0.6725101, 0, 0, 0, 1, 1,
0.5367086, -1.200199, 2.169375, 0, 0, 0, 1, 1,
0.5372367, 0.6236876, -0.81814, 0, 0, 0, 1, 1,
0.538411, 1.084733, 0.261041, 0, 0, 0, 1, 1,
0.5392885, -1.867122, 2.52662, 0, 0, 0, 1, 1,
0.5410377, 1.956039, 0.1185955, 0, 0, 0, 1, 1,
0.54199, 0.6544903, 1.076244, 0, 0, 0, 1, 1,
0.543014, -0.6484829, 4.166677, 1, 1, 1, 1, 1,
0.5446651, -0.466652, 1.084038, 1, 1, 1, 1, 1,
0.544744, -1.320176, 4.011564, 1, 1, 1, 1, 1,
0.5457832, 0.9580989, -0.1419405, 1, 1, 1, 1, 1,
0.546868, 0.9788787, -1.408834, 1, 1, 1, 1, 1,
0.5474597, 0.6738949, -0.1149493, 1, 1, 1, 1, 1,
0.5494172, -0.2272152, 1.470823, 1, 1, 1, 1, 1,
0.5496387, 0.009537452, 1.149301, 1, 1, 1, 1, 1,
0.5503418, 0.542207, 2.196071, 1, 1, 1, 1, 1,
0.5521849, -1.124047, 3.462535, 1, 1, 1, 1, 1,
0.552302, -1.588607, 4.316517, 1, 1, 1, 1, 1,
0.5541794, -0.4564556, 4.12799, 1, 1, 1, 1, 1,
0.5544093, 2.6276, -1.764729, 1, 1, 1, 1, 1,
0.5549161, 1.535248, 0.8328279, 1, 1, 1, 1, 1,
0.5625266, -0.4031937, 2.326315, 1, 1, 1, 1, 1,
0.5629448, -0.8484929, 2.206017, 0, 0, 1, 1, 1,
0.5677179, 1.234655, -0.7654088, 1, 0, 0, 1, 1,
0.5712634, 1.243039, 0.1461148, 1, 0, 0, 1, 1,
0.5712972, 1.08595, 0.2455447, 1, 0, 0, 1, 1,
0.5730563, 0.5267233, 1.00043, 1, 0, 0, 1, 1,
0.5760924, 0.1392183, 0.913378, 1, 0, 0, 1, 1,
0.5779198, -0.1361464, 2.357624, 0, 0, 0, 1, 1,
0.5904313, -0.7970973, 3.12546, 0, 0, 0, 1, 1,
0.593219, 1.198488, -0.2951478, 0, 0, 0, 1, 1,
0.594696, 0.01552914, 1.242634, 0, 0, 0, 1, 1,
0.5953768, 1.90115, 0.8931153, 0, 0, 0, 1, 1,
0.6010393, 0.08863211, 2.222196, 0, 0, 0, 1, 1,
0.6024898, -0.2305899, 1.826537, 0, 0, 0, 1, 1,
0.6065506, -0.8501799, 2.202175, 1, 1, 1, 1, 1,
0.6074647, 0.2302972, 2.841235, 1, 1, 1, 1, 1,
0.6075282, -0.2572011, 2.158203, 1, 1, 1, 1, 1,
0.6169459, 1.310611, 1.849233, 1, 1, 1, 1, 1,
0.6204367, 0.1100948, 0.04787542, 1, 1, 1, 1, 1,
0.6253395, -0.3957326, 3.807473, 1, 1, 1, 1, 1,
0.6306087, -0.2636957, -0.1961385, 1, 1, 1, 1, 1,
0.639291, -1.313974, 1.354747, 1, 1, 1, 1, 1,
0.6405621, 0.2350049, 3.084534, 1, 1, 1, 1, 1,
0.6434333, 0.6865166, -0.1476803, 1, 1, 1, 1, 1,
0.6455232, 0.07127109, 0.9774559, 1, 1, 1, 1, 1,
0.6486068, 0.1365035, 1.543473, 1, 1, 1, 1, 1,
0.6488417, -1.037231, 1.366488, 1, 1, 1, 1, 1,
0.6494114, 3.026799, -0.2902334, 1, 1, 1, 1, 1,
0.6580105, -0.3757784, 3.51988, 1, 1, 1, 1, 1,
0.6595084, 1.732475, 0.09756452, 0, 0, 1, 1, 1,
0.6682045, 1.190348, 1.015118, 1, 0, 0, 1, 1,
0.6703867, -0.4607255, 2.082869, 1, 0, 0, 1, 1,
0.6752342, 0.06068982, 1.712632, 1, 0, 0, 1, 1,
0.6764257, 0.1866466, 1.545524, 1, 0, 0, 1, 1,
0.6771143, 2.47544, 2.747639, 1, 0, 0, 1, 1,
0.6831588, 1.69556, 1.468374, 0, 0, 0, 1, 1,
0.6833033, 0.2224013, 0.9130661, 0, 0, 0, 1, 1,
0.686233, 0.6760839, 0.431059, 0, 0, 0, 1, 1,
0.6868596, 0.1044655, 2.765918, 0, 0, 0, 1, 1,
0.6948376, 0.2623149, 1.016271, 0, 0, 0, 1, 1,
0.6989621, 1.211383, 1.437316, 0, 0, 0, 1, 1,
0.7019727, -0.9976109, 3.022987, 0, 0, 0, 1, 1,
0.7055051, -0.8098965, 2.144862, 1, 1, 1, 1, 1,
0.7152065, 0.7904509, -0.4524662, 1, 1, 1, 1, 1,
0.7176266, -1.442656, 4.785855, 1, 1, 1, 1, 1,
0.7202599, 0.4495059, 1.2299, 1, 1, 1, 1, 1,
0.7216968, -0.4622563, 2.805674, 1, 1, 1, 1, 1,
0.7265171, 0.4266625, 2.752816, 1, 1, 1, 1, 1,
0.7309542, -0.208693, 3.932056, 1, 1, 1, 1, 1,
0.7338182, 1.547401, 0.6872059, 1, 1, 1, 1, 1,
0.7364041, 1.61788, 0.3891718, 1, 1, 1, 1, 1,
0.7385894, -2.01585, 1.629627, 1, 1, 1, 1, 1,
0.7403144, 0.2750734, 2.049566, 1, 1, 1, 1, 1,
0.7414128, -1.521991, 1.336065, 1, 1, 1, 1, 1,
0.7446061, 0.1672206, 0.5623406, 1, 1, 1, 1, 1,
0.7551643, -0.9242054, 0.3048378, 1, 1, 1, 1, 1,
0.7565738, -1.44215, 1.399898, 1, 1, 1, 1, 1,
0.7569457, 1.028259, -1.523036, 0, 0, 1, 1, 1,
0.7607852, -0.2476331, 1.992064, 1, 0, 0, 1, 1,
0.7649095, 0.6769493, -0.5237939, 1, 0, 0, 1, 1,
0.7673483, -1.637426, 2.954422, 1, 0, 0, 1, 1,
0.7700964, 1.353178, -0.4485932, 1, 0, 0, 1, 1,
0.7705337, 0.9050813, 0.2896697, 1, 0, 0, 1, 1,
0.7707365, 0.2225234, 1.766335, 0, 0, 0, 1, 1,
0.7721227, -2.717648, 2.534022, 0, 0, 0, 1, 1,
0.7754233, 0.4579181, 1.268607, 0, 0, 0, 1, 1,
0.7795249, 1.350321, 2.058799, 0, 0, 0, 1, 1,
0.7824476, -0.2779501, 2.18053, 0, 0, 0, 1, 1,
0.7837611, 0.7485765, 1.710135, 0, 0, 0, 1, 1,
0.7864065, 1.038578, 1.00175, 0, 0, 0, 1, 1,
0.787385, -0.9291865, 1.605763, 1, 1, 1, 1, 1,
0.7911036, 1.08203, -0.1754764, 1, 1, 1, 1, 1,
0.7937509, 1.033934, 1.362402, 1, 1, 1, 1, 1,
0.7941196, -0.8936409, 2.841113, 1, 1, 1, 1, 1,
0.7944209, -0.1172041, 3.245985, 1, 1, 1, 1, 1,
0.7969195, -0.8153653, 2.106474, 1, 1, 1, 1, 1,
0.7983493, 0.4118981, 0.0590076, 1, 1, 1, 1, 1,
0.8068135, -0.6986226, 1.137687, 1, 1, 1, 1, 1,
0.8132861, -0.3560607, 3.569842, 1, 1, 1, 1, 1,
0.8179314, -0.9131355, 2.881683, 1, 1, 1, 1, 1,
0.8228321, -1.439059, 2.739508, 1, 1, 1, 1, 1,
0.8348063, 1.273178, 1.515111, 1, 1, 1, 1, 1,
0.8406488, -0.3018746, 2.607637, 1, 1, 1, 1, 1,
0.8521855, 1.670862, -0.7586493, 1, 1, 1, 1, 1,
0.8564459, -0.4463805, 4.131454, 1, 1, 1, 1, 1,
0.8682085, 0.3057838, 0.1612966, 0, 0, 1, 1, 1,
0.8684273, -0.2087237, 2.318901, 1, 0, 0, 1, 1,
0.8697689, -1.43943, 3.038303, 1, 0, 0, 1, 1,
0.8699013, -1.353675, 4.177868, 1, 0, 0, 1, 1,
0.8736982, 0.8374248, 0.352177, 1, 0, 0, 1, 1,
0.874383, -0.2658398, 2.31638, 1, 0, 0, 1, 1,
0.8812053, 0.3655605, 3.293363, 0, 0, 0, 1, 1,
0.8832509, 2.981528, 0.8725836, 0, 0, 0, 1, 1,
0.8856061, 2.599489, -0.7219507, 0, 0, 0, 1, 1,
0.8941365, -1.201675, 1.773656, 0, 0, 0, 1, 1,
0.9009582, 3.056494, 0.5178086, 0, 0, 0, 1, 1,
0.9030163, -1.155131, 1.479151, 0, 0, 0, 1, 1,
0.9030294, 0.6272565, 1.307106, 0, 0, 0, 1, 1,
0.9083752, -0.7169483, 3.858841, 1, 1, 1, 1, 1,
0.9091253, 3.506189, -0.3862135, 1, 1, 1, 1, 1,
0.9093309, 1.671387, -0.4188447, 1, 1, 1, 1, 1,
0.9159213, -0.5452496, 1.208967, 1, 1, 1, 1, 1,
0.9261594, -0.9342201, 1.521642, 1, 1, 1, 1, 1,
0.9363798, 0.9539663, 0.6404864, 1, 1, 1, 1, 1,
0.9398927, -0.4738265, 1.560035, 1, 1, 1, 1, 1,
0.9421641, -0.7079017, 1.468757, 1, 1, 1, 1, 1,
0.9422454, 0.5037442, 1.840466, 1, 1, 1, 1, 1,
0.9425499, 0.5945508, 1.101079, 1, 1, 1, 1, 1,
0.9488378, 0.6212792, 1.29354, 1, 1, 1, 1, 1,
0.9573562, 0.09201492, 1.602669, 1, 1, 1, 1, 1,
0.9581657, -1.217007, 2.56786, 1, 1, 1, 1, 1,
0.9594817, -0.6172999, 1.315979, 1, 1, 1, 1, 1,
0.9600011, 0.8599634, -0.1814506, 1, 1, 1, 1, 1,
0.9634343, 0.2111377, 2.236428, 0, 0, 1, 1, 1,
0.9725629, -0.08259946, -0.09187976, 1, 0, 0, 1, 1,
0.9739323, -0.04950166, 0.5487772, 1, 0, 0, 1, 1,
0.9767211, -0.6660475, 2.113338, 1, 0, 0, 1, 1,
0.9778399, -0.05557601, 0.6692775, 1, 0, 0, 1, 1,
0.9815431, 0.2700532, 1.33026, 1, 0, 0, 1, 1,
0.9981223, -0.2334453, 2.756145, 0, 0, 0, 1, 1,
1.002846, 0.3678622, 3.086944, 0, 0, 0, 1, 1,
1.009508, 1.069534, 0.4409878, 0, 0, 0, 1, 1,
1.010919, 0.7428632, 1.931714, 0, 0, 0, 1, 1,
1.018549, 0.5510348, 0.7265607, 0, 0, 0, 1, 1,
1.019298, 0.101923, 0.02358129, 0, 0, 0, 1, 1,
1.019304, 0.184642, 0.9530765, 0, 0, 0, 1, 1,
1.02456, 0.0551782, 2.812499, 1, 1, 1, 1, 1,
1.034446, -0.5142311, 3.309464, 1, 1, 1, 1, 1,
1.03687, -1.250389, 1.722019, 1, 1, 1, 1, 1,
1.041402, 0.4141524, 1.439167, 1, 1, 1, 1, 1,
1.049772, -0.02864483, 1.573466, 1, 1, 1, 1, 1,
1.060381, -0.6796388, 3.042783, 1, 1, 1, 1, 1,
1.060785, 1.243227, -0.7292919, 1, 1, 1, 1, 1,
1.062933, 0.4504634, -1.897791, 1, 1, 1, 1, 1,
1.070331, -1.087985, 1.684245, 1, 1, 1, 1, 1,
1.08973, -1.869844, 0.6852232, 1, 1, 1, 1, 1,
1.096228, 0.01396495, 0.7254865, 1, 1, 1, 1, 1,
1.09694, -1.090054, 3.482586, 1, 1, 1, 1, 1,
1.099502, 0.4420821, 1.427796, 1, 1, 1, 1, 1,
1.107285, -1.833397, 2.627532, 1, 1, 1, 1, 1,
1.113234, -0.7617919, 2.760808, 1, 1, 1, 1, 1,
1.115826, -0.5125598, 4.113954, 0, 0, 1, 1, 1,
1.12413, -0.1252743, 4.391937, 1, 0, 0, 1, 1,
1.125064, 0.4612702, 2.12777, 1, 0, 0, 1, 1,
1.130178, 0.3398306, 1.760381, 1, 0, 0, 1, 1,
1.133673, -1.18188, 2.526333, 1, 0, 0, 1, 1,
1.151018, 0.679104, 0.8882911, 1, 0, 0, 1, 1,
1.155287, -2.472847, 3.471253, 0, 0, 0, 1, 1,
1.156197, -0.1074117, 1.530718, 0, 0, 0, 1, 1,
1.157861, 0.3915484, 1.553033, 0, 0, 0, 1, 1,
1.158864, 0.340437, 0.7808677, 0, 0, 0, 1, 1,
1.180056, -1.043956, 0.8263038, 0, 0, 0, 1, 1,
1.187538, 0.7474155, -2.423271, 0, 0, 0, 1, 1,
1.192225, -2.033305, 3.81498, 0, 0, 0, 1, 1,
1.193879, -0.4461029, 3.815109, 1, 1, 1, 1, 1,
1.197865, 0.2628655, 0.8766751, 1, 1, 1, 1, 1,
1.201639, -0.8967608, 2.560169, 1, 1, 1, 1, 1,
1.202733, -0.9607075, 1.915795, 1, 1, 1, 1, 1,
1.205333, -0.7708968, 0.7965731, 1, 1, 1, 1, 1,
1.206779, -0.8725052, 1.451035, 1, 1, 1, 1, 1,
1.218042, 0.710651, -0.5227318, 1, 1, 1, 1, 1,
1.222313, -0.1398925, 1.233138, 1, 1, 1, 1, 1,
1.226265, -0.7554487, 3.266823, 1, 1, 1, 1, 1,
1.235034, -0.812512, 2.149448, 1, 1, 1, 1, 1,
1.246349, -0.7814149, 1.999108, 1, 1, 1, 1, 1,
1.268644, -0.2082131, 1.055291, 1, 1, 1, 1, 1,
1.27861, -1.370718, 3.657413, 1, 1, 1, 1, 1,
1.280685, 0.4708178, 0.9060413, 1, 1, 1, 1, 1,
1.280987, -0.7590233, 1.953141, 1, 1, 1, 1, 1,
1.286842, 0.5118608, 0.9836649, 0, 0, 1, 1, 1,
1.287995, 0.9564072, 0.2841257, 1, 0, 0, 1, 1,
1.295863, -0.8198948, 1.805414, 1, 0, 0, 1, 1,
1.299271, -0.3171813, -0.09786725, 1, 0, 0, 1, 1,
1.300416, 1.061846, 0.2717361, 1, 0, 0, 1, 1,
1.308446, 2.133356, 2.543255, 1, 0, 0, 1, 1,
1.340977, 0.04687595, 1.245532, 0, 0, 0, 1, 1,
1.344421, -0.6471654, 2.271962, 0, 0, 0, 1, 1,
1.345914, 0.6381748, 1.241857, 0, 0, 0, 1, 1,
1.348321, 1.526386, 1.17367, 0, 0, 0, 1, 1,
1.352963, 0.3026921, 2.958327, 0, 0, 0, 1, 1,
1.353873, 0.8289473, 0.4665658, 0, 0, 0, 1, 1,
1.362433, 1.750496, -0.090705, 0, 0, 0, 1, 1,
1.366826, 0.263615, 1.352136, 1, 1, 1, 1, 1,
1.369156, 1.401079, 0.8126355, 1, 1, 1, 1, 1,
1.370376, 0.8216184, -0.2913, 1, 1, 1, 1, 1,
1.370436, -1.438888, 1.593905, 1, 1, 1, 1, 1,
1.382814, 0.3527556, 1.177689, 1, 1, 1, 1, 1,
1.38387, 0.1444058, 2.623813, 1, 1, 1, 1, 1,
1.38466, 1.800978, 1.441105, 1, 1, 1, 1, 1,
1.38599, -0.08151053, 1.714312, 1, 1, 1, 1, 1,
1.39148, -0.08614791, 1.91601, 1, 1, 1, 1, 1,
1.39594, -1.190456, 2.650871, 1, 1, 1, 1, 1,
1.400919, -0.6020616, 2.120846, 1, 1, 1, 1, 1,
1.402632, 0.2667737, -0.3285795, 1, 1, 1, 1, 1,
1.406212, 0.8332386, -0.4032725, 1, 1, 1, 1, 1,
1.419272, 2.347052, 0.1155952, 1, 1, 1, 1, 1,
1.430948, 0.2672239, 0.7092097, 1, 1, 1, 1, 1,
1.431825, -0.9501079, 2.390514, 0, 0, 1, 1, 1,
1.43434, -0.005308207, 1.145111, 1, 0, 0, 1, 1,
1.441957, -0.6767173, 2.627056, 1, 0, 0, 1, 1,
1.449481, 0.01146551, 1.128307, 1, 0, 0, 1, 1,
1.460799, -0.5902795, 2.189819, 1, 0, 0, 1, 1,
1.46604, -1.234821, 0.6452187, 1, 0, 0, 1, 1,
1.479215, -1.002863, 4.090913, 0, 0, 0, 1, 1,
1.48162, 0.1600951, 1.424967, 0, 0, 0, 1, 1,
1.490128, -0.1595339, 1.721977, 0, 0, 0, 1, 1,
1.495814, -3.027373, 2.843516, 0, 0, 0, 1, 1,
1.496323, 0.6817424, 0.6094458, 0, 0, 0, 1, 1,
1.497258, 1.043062, 0.6371894, 0, 0, 0, 1, 1,
1.49944, -0.2116942, 3.131512, 0, 0, 0, 1, 1,
1.499523, 1.900982, 0.6022272, 1, 1, 1, 1, 1,
1.509057, -0.3588333, -0.2368479, 1, 1, 1, 1, 1,
1.516272, -0.2754633, 2.811041, 1, 1, 1, 1, 1,
1.540618, -1.244254, 3.058662, 1, 1, 1, 1, 1,
1.550146, 0.4600212, 2.186157, 1, 1, 1, 1, 1,
1.555636, -0.6728429, 2.077527, 1, 1, 1, 1, 1,
1.557527, 0.5838634, 1.006796, 1, 1, 1, 1, 1,
1.558834, 0.08910836, 1.569611, 1, 1, 1, 1, 1,
1.566869, -2.059615, 3.754848, 1, 1, 1, 1, 1,
1.575999, 1.343567, 0.6359075, 1, 1, 1, 1, 1,
1.57763, -2.181155, 1.809301, 1, 1, 1, 1, 1,
1.58416, -1.308997, 2.395869, 1, 1, 1, 1, 1,
1.590815, 0.1517646, 2.617155, 1, 1, 1, 1, 1,
1.610342, 0.2078532, 3.880405, 1, 1, 1, 1, 1,
1.614987, 0.1663842, 1.296642, 1, 1, 1, 1, 1,
1.619177, -1.237253, 1.207271, 0, 0, 1, 1, 1,
1.63671, 0.1403521, 1.617837, 1, 0, 0, 1, 1,
1.637938, -0.8405014, 1.767603, 1, 0, 0, 1, 1,
1.649346, 0.2670929, 1.610356, 1, 0, 0, 1, 1,
1.689713, 0.132719, 1.441344, 1, 0, 0, 1, 1,
1.741007, 1.4766, 1.554964, 1, 0, 0, 1, 1,
1.743377, -1.656412, 2.857738, 0, 0, 0, 1, 1,
1.745999, 0.07189553, 0.5134055, 0, 0, 0, 1, 1,
1.753838, 0.9424081, 1.869974, 0, 0, 0, 1, 1,
1.776863, -0.5988248, 0.3247739, 0, 0, 0, 1, 1,
1.787296, 1.288309, 0.2501532, 0, 0, 0, 1, 1,
1.788682, 0.4387878, 2.096294, 0, 0, 0, 1, 1,
1.817812, -1.780111, 2.62308, 0, 0, 0, 1, 1,
1.825379, 0.02015718, 1.119315, 1, 1, 1, 1, 1,
1.826715, -1.083874, 3.179333, 1, 1, 1, 1, 1,
1.841583, -1.156615, 2.960505, 1, 1, 1, 1, 1,
1.843812, -0.5574437, 2.463505, 1, 1, 1, 1, 1,
1.861224, -2.00579, 2.791903, 1, 1, 1, 1, 1,
1.884509, -0.2422897, 2.379857, 1, 1, 1, 1, 1,
1.886192, 0.3860534, 1.806626, 1, 1, 1, 1, 1,
1.887385, -0.5010523, 1.072913, 1, 1, 1, 1, 1,
1.889447, -0.9582146, 1.364239, 1, 1, 1, 1, 1,
1.90225, -0.198906, 1.554845, 1, 1, 1, 1, 1,
1.914277, -2.313924, 1.448213, 1, 1, 1, 1, 1,
1.915817, -0.7931073, 2.294139, 1, 1, 1, 1, 1,
1.916883, 0.548011, 0.2437236, 1, 1, 1, 1, 1,
1.918973, -1.764625, 1.787399, 1, 1, 1, 1, 1,
1.943543, 0.9684191, -0.2474057, 1, 1, 1, 1, 1,
1.944878, -0.8681647, 2.603398, 0, 0, 1, 1, 1,
1.945465, -0.7297199, 2.330521, 1, 0, 0, 1, 1,
1.963243, 1.088887, 0.1606952, 1, 0, 0, 1, 1,
1.981549, 0.3630169, 0.3972446, 1, 0, 0, 1, 1,
1.990737, -2.375032, 0.9748332, 1, 0, 0, 1, 1,
2.014295, 0.7286694, 0.8077426, 1, 0, 0, 1, 1,
2.026743, -0.1945452, 1.364816, 0, 0, 0, 1, 1,
2.037023, -1.407553, 1.771082, 0, 0, 0, 1, 1,
2.05346, -0.5168146, 1.676959, 0, 0, 0, 1, 1,
2.185493, -1.357882, 3.580477, 0, 0, 0, 1, 1,
2.194285, 0.9754779, 1.274778, 0, 0, 0, 1, 1,
2.22853, 0.7867774, 1.217798, 0, 0, 0, 1, 1,
2.261638, -0.5129591, 1.286392, 0, 0, 0, 1, 1,
2.41259, -0.5501972, 2.599825, 1, 1, 1, 1, 1,
2.672499, -0.1930037, 2.532194, 1, 1, 1, 1, 1,
2.676282, 0.01316484, 2.499832, 1, 1, 1, 1, 1,
2.744673, -0.2954369, -0.0367519, 1, 1, 1, 1, 1,
2.747729, -0.402139, 3.057754, 1, 1, 1, 1, 1,
2.755941, 0.009575675, 2.672637, 1, 1, 1, 1, 1,
3.122234, 0.5446068, 2.00787, 1, 1, 1, 1, 1
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
var radius = 9.363952;
var distance = 32.89048;
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
mvMatrix.translate( -0.189314, -0.2394085, -0.5047688 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.89048);
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