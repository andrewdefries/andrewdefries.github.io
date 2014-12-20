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
-3.12363, 0.8398039, 0.122698, 1, 0, 0, 1,
-2.648355, 1.012583, -1.787793, 1, 0.007843138, 0, 1,
-2.530346, 0.4684799, -0.8220354, 1, 0.01176471, 0, 1,
-2.418622, -1.785893, -0.7327926, 1, 0.01960784, 0, 1,
-2.356061, 0.2194423, -2.534112, 1, 0.02352941, 0, 1,
-2.351324, 0.2898114, 0.2427072, 1, 0.03137255, 0, 1,
-2.341964, -0.6098459, -1.948546, 1, 0.03529412, 0, 1,
-2.325082, 0.7842469, -1.93155, 1, 0.04313726, 0, 1,
-2.306613, -0.9767691, -2.410536, 1, 0.04705882, 0, 1,
-2.241933, -1.458406, -1.506417, 1, 0.05490196, 0, 1,
-2.185569, 0.1838969, -0.9527336, 1, 0.05882353, 0, 1,
-2.136535, -0.05673551, -1.421589, 1, 0.06666667, 0, 1,
-2.132724, 1.6756, -0.302395, 1, 0.07058824, 0, 1,
-2.127485, 0.6716735, -1.128216, 1, 0.07843138, 0, 1,
-2.112215, -0.2413297, -0.9921371, 1, 0.08235294, 0, 1,
-2.055612, -0.4382112, -2.75487, 1, 0.09019608, 0, 1,
-2.041781, 1.120033, -0.9615653, 1, 0.09411765, 0, 1,
-2.039871, 0.8561326, -0.2477867, 1, 0.1019608, 0, 1,
-1.99616, -0.06102381, -2.440186, 1, 0.1098039, 0, 1,
-1.96226, 0.4358267, -2.249018, 1, 0.1137255, 0, 1,
-1.958387, -0.5162384, -0.9162443, 1, 0.1215686, 0, 1,
-1.936626, -0.9473771, -3.185807, 1, 0.1254902, 0, 1,
-1.934554, 1.236466, -2.43278, 1, 0.1333333, 0, 1,
-1.919549, 1.133472, -1.187589, 1, 0.1372549, 0, 1,
-1.892679, 0.5433335, -2.63551, 1, 0.145098, 0, 1,
-1.889813, 0.7234659, -0.5524675, 1, 0.1490196, 0, 1,
-1.802768, -0.0255919, -1.464844, 1, 0.1568628, 0, 1,
-1.79995, -1.134612, -1.776494, 1, 0.1607843, 0, 1,
-1.793621, 0.0274667, -0.9432099, 1, 0.1686275, 0, 1,
-1.771189, 2.461256, -0.3982547, 1, 0.172549, 0, 1,
-1.768114, 1.10691, -0.6964877, 1, 0.1803922, 0, 1,
-1.725751, -1.797433, -0.8495734, 1, 0.1843137, 0, 1,
-1.710436, -0.1351415, -2.7932, 1, 0.1921569, 0, 1,
-1.709823, 0.7584196, -0.5303288, 1, 0.1960784, 0, 1,
-1.707509, -0.8624653, -2.639629, 1, 0.2039216, 0, 1,
-1.680616, -1.697827, -3.003573, 1, 0.2117647, 0, 1,
-1.678448, 0.3392642, -1.319171, 1, 0.2156863, 0, 1,
-1.651761, -0.3113524, -1.16597, 1, 0.2235294, 0, 1,
-1.650906, 1.792185, -1.420703, 1, 0.227451, 0, 1,
-1.647169, -0.6796998, -3.604985, 1, 0.2352941, 0, 1,
-1.646844, -0.1172246, -2.99466, 1, 0.2392157, 0, 1,
-1.643901, 0.6499858, -0.9498342, 1, 0.2470588, 0, 1,
-1.624133, 0.6001657, -0.3860294, 1, 0.2509804, 0, 1,
-1.616655, 0.07005331, -2.433963, 1, 0.2588235, 0, 1,
-1.614822, -0.8998408, -2.479272, 1, 0.2627451, 0, 1,
-1.605236, -0.1759679, -1.327872, 1, 0.2705882, 0, 1,
-1.594911, 1.659373, -1.327058, 1, 0.2745098, 0, 1,
-1.587784, -1.456447, -2.768092, 1, 0.282353, 0, 1,
-1.587629, 0.1523946, -1.173269, 1, 0.2862745, 0, 1,
-1.586191, -1.353203, -1.895509, 1, 0.2941177, 0, 1,
-1.582144, 0.01351756, -2.03628, 1, 0.3019608, 0, 1,
-1.581978, -0.2060196, -4.149261, 1, 0.3058824, 0, 1,
-1.581545, -1.540019, -4.174159, 1, 0.3137255, 0, 1,
-1.57618, 2.319928, 0.4592599, 1, 0.3176471, 0, 1,
-1.571722, -0.7286187, -2.533111, 1, 0.3254902, 0, 1,
-1.558373, 1.820894, -0.6980213, 1, 0.3294118, 0, 1,
-1.55439, -0.1679839, -2.007153, 1, 0.3372549, 0, 1,
-1.511167, 0.4750342, -0.5066653, 1, 0.3411765, 0, 1,
-1.494333, -1.218112, -1.446647, 1, 0.3490196, 0, 1,
-1.491902, 0.211302, -0.3749323, 1, 0.3529412, 0, 1,
-1.472484, -0.8835401, -4.465247, 1, 0.3607843, 0, 1,
-1.441906, -1.218572, -1.629507, 1, 0.3647059, 0, 1,
-1.434055, 0.6004179, -1.522101, 1, 0.372549, 0, 1,
-1.424021, 0.4772966, -2.022555, 1, 0.3764706, 0, 1,
-1.421815, -1.844757, -0.517538, 1, 0.3843137, 0, 1,
-1.418561, 1.140753, -0.8720754, 1, 0.3882353, 0, 1,
-1.397678, 0.286365, -1.382177, 1, 0.3960784, 0, 1,
-1.393918, -0.3276797, -2.364282, 1, 0.4039216, 0, 1,
-1.389179, -0.02709136, -1.854518, 1, 0.4078431, 0, 1,
-1.38775, -2.344162, -4.38201, 1, 0.4156863, 0, 1,
-1.385698, -0.7546966, -2.616524, 1, 0.4196078, 0, 1,
-1.380742, -2.349532, -2.183942, 1, 0.427451, 0, 1,
-1.379994, -0.7962157, -3.557546, 1, 0.4313726, 0, 1,
-1.37666, -0.0002836756, -2.236033, 1, 0.4392157, 0, 1,
-1.372757, -1.528526, -2.613744, 1, 0.4431373, 0, 1,
-1.367681, 0.02407909, -3.503592, 1, 0.4509804, 0, 1,
-1.362783, 0.09994484, -2.306029, 1, 0.454902, 0, 1,
-1.359736, -1.24912, -2.086314, 1, 0.4627451, 0, 1,
-1.345234, 0.1159479, -2.259389, 1, 0.4666667, 0, 1,
-1.341652, 0.5836761, -0.558861, 1, 0.4745098, 0, 1,
-1.341624, 1.190567, -0.4365103, 1, 0.4784314, 0, 1,
-1.332278, -0.6226762, -1.1436, 1, 0.4862745, 0, 1,
-1.319055, -1.993827, -4.242922, 1, 0.4901961, 0, 1,
-1.317356, 1.20392, -2.589057, 1, 0.4980392, 0, 1,
-1.309307, 0.4310509, -0.3469594, 1, 0.5058824, 0, 1,
-1.309025, 0.1526963, -1.20835, 1, 0.509804, 0, 1,
-1.308267, 0.1898116, -1.907021, 1, 0.5176471, 0, 1,
-1.299493, -0.8057755, -2.903375, 1, 0.5215687, 0, 1,
-1.298613, 1.320691, 0.04431703, 1, 0.5294118, 0, 1,
-1.298351, -1.430196, -2.056229, 1, 0.5333334, 0, 1,
-1.297804, -0.2281334, -2.527835, 1, 0.5411765, 0, 1,
-1.295616, -0.7887711, -2.184855, 1, 0.5450981, 0, 1,
-1.295289, -0.2322373, -2.400976, 1, 0.5529412, 0, 1,
-1.293857, 0.1818948, -3.711083, 1, 0.5568628, 0, 1,
-1.290158, 0.6178452, -1.137993, 1, 0.5647059, 0, 1,
-1.289845, -0.2663814, -1.286244, 1, 0.5686275, 0, 1,
-1.277784, -0.5922712, -2.031826, 1, 0.5764706, 0, 1,
-1.273155, 1.74741, 0.4689138, 1, 0.5803922, 0, 1,
-1.270782, 0.9256993, -0.6901976, 1, 0.5882353, 0, 1,
-1.267368, 0.6058779, -0.159219, 1, 0.5921569, 0, 1,
-1.266075, -0.22059, -2.76799, 1, 0.6, 0, 1,
-1.258971, -0.7984722, -0.6771256, 1, 0.6078432, 0, 1,
-1.255365, -0.3838666, -2.496583, 1, 0.6117647, 0, 1,
-1.249548, -0.05052514, -3.151076, 1, 0.6196079, 0, 1,
-1.240135, -0.7908477, -3.407056, 1, 0.6235294, 0, 1,
-1.233719, -0.8351714, -2.331368, 1, 0.6313726, 0, 1,
-1.233207, 0.8293013, -1.490311, 1, 0.6352941, 0, 1,
-1.224274, 0.4428491, -0.3361005, 1, 0.6431373, 0, 1,
-1.220722, -0.6444281, -4.493472, 1, 0.6470588, 0, 1,
-1.20919, -0.7012845, -2.735815, 1, 0.654902, 0, 1,
-1.197251, 1.29428, -0.3977756, 1, 0.6588235, 0, 1,
-1.196103, -1.711529, -4.556302, 1, 0.6666667, 0, 1,
-1.194153, -1.4362, -1.895136, 1, 0.6705883, 0, 1,
-1.1872, 0.1069085, -1.979843, 1, 0.6784314, 0, 1,
-1.181109, -0.3427441, -1.063271, 1, 0.682353, 0, 1,
-1.171634, -0.1817945, -0.1499285, 1, 0.6901961, 0, 1,
-1.167014, 0.4524688, -0.6892112, 1, 0.6941177, 0, 1,
-1.153003, 1.023671, -2.00944, 1, 0.7019608, 0, 1,
-1.152103, -0.9732729, -2.026546, 1, 0.7098039, 0, 1,
-1.148056, -1.448476, -3.631494, 1, 0.7137255, 0, 1,
-1.14674, 0.8742138, 1.228984, 1, 0.7215686, 0, 1,
-1.139372, -0.02262364, -1.05346, 1, 0.7254902, 0, 1,
-1.136808, 0.9803267, 0.09487201, 1, 0.7333333, 0, 1,
-1.134664, 1.227309, -2.037405, 1, 0.7372549, 0, 1,
-1.134005, 0.3477142, -1.745406, 1, 0.7450981, 0, 1,
-1.133947, -1.038255, -3.241009, 1, 0.7490196, 0, 1,
-1.126097, 0.05196065, -2.145482, 1, 0.7568628, 0, 1,
-1.12164, -0.3457914, -2.060583, 1, 0.7607843, 0, 1,
-1.120305, -0.05726417, -2.305293, 1, 0.7686275, 0, 1,
-1.114089, 0.5224701, -0.9670588, 1, 0.772549, 0, 1,
-1.110699, 0.4206862, -3.296699, 1, 0.7803922, 0, 1,
-1.103758, -0.8140076, -1.841989, 1, 0.7843137, 0, 1,
-1.103276, 0.3460276, -1.313193, 1, 0.7921569, 0, 1,
-1.100267, 0.5278728, -1.49438, 1, 0.7960784, 0, 1,
-1.098951, 0.3337491, -1.523397, 1, 0.8039216, 0, 1,
-1.093901, -0.1153789, -0.9553593, 1, 0.8117647, 0, 1,
-1.091779, -1.432496, -3.353333, 1, 0.8156863, 0, 1,
-1.090908, -0.108747, 0.1345501, 1, 0.8235294, 0, 1,
-1.089322, -0.3540392, 0.2878197, 1, 0.827451, 0, 1,
-1.081131, 0.4304332, -1.452963, 1, 0.8352941, 0, 1,
-1.07534, 1.125288, -0.5492405, 1, 0.8392157, 0, 1,
-1.073243, 1.933298, 0.5888795, 1, 0.8470588, 0, 1,
-1.069566, 1.420033, -0.8413978, 1, 0.8509804, 0, 1,
-1.062853, -0.1917361, -2.248853, 1, 0.8588235, 0, 1,
-1.058935, 0.7120617, -0.6386262, 1, 0.8627451, 0, 1,
-1.052932, 1.199878, 0.1944542, 1, 0.8705882, 0, 1,
-1.042113, -0.3722574, -2.180285, 1, 0.8745098, 0, 1,
-1.041559, 1.056779, -1.072841, 1, 0.8823529, 0, 1,
-1.04013, 0.1703634, -3.669459, 1, 0.8862745, 0, 1,
-1.034595, -0.6717891, -3.374539, 1, 0.8941177, 0, 1,
-1.028618, -0.9611774, -0.4720377, 1, 0.8980392, 0, 1,
-1.025123, -3.009431, -2.491385, 1, 0.9058824, 0, 1,
-1.024501, -2.237751, -2.247672, 1, 0.9137255, 0, 1,
-1.022779, -1.121526, -0.8202862, 1, 0.9176471, 0, 1,
-1.021232, 1.615934, -0.420854, 1, 0.9254902, 0, 1,
-1.016581, -0.3036053, -3.626735, 1, 0.9294118, 0, 1,
-1.01535, 1.098802, 0.06828614, 1, 0.9372549, 0, 1,
-1.014301, 0.2748356, -1.449953, 1, 0.9411765, 0, 1,
-1.014167, -1.042462, -1.347142, 1, 0.9490196, 0, 1,
-1.013001, -0.8515997, -2.922094, 1, 0.9529412, 0, 1,
-1.011311, 0.08231229, -2.280535, 1, 0.9607843, 0, 1,
-0.9963632, -0.1797977, -1.212154, 1, 0.9647059, 0, 1,
-0.9926541, 0.08187844, -1.206926, 1, 0.972549, 0, 1,
-0.9903467, -0.1785081, -1.71446, 1, 0.9764706, 0, 1,
-0.9897662, -1.375731, -1.710378, 1, 0.9843137, 0, 1,
-0.9833328, 0.3524913, -1.391421, 1, 0.9882353, 0, 1,
-0.9800677, -0.4002087, -1.228725, 1, 0.9960784, 0, 1,
-0.978784, 1.099884, -1.097242, 0.9960784, 1, 0, 1,
-0.9751809, 0.9746935, -0.4378281, 0.9921569, 1, 0, 1,
-0.9711593, -0.06921038, -1.196991, 0.9843137, 1, 0, 1,
-0.9700698, -1.025969, -2.537739, 0.9803922, 1, 0, 1,
-0.9658166, -0.4175546, -0.7660075, 0.972549, 1, 0, 1,
-0.9590327, -0.9395022, -3.057887, 0.9686275, 1, 0, 1,
-0.9554405, 0.2528859, -0.06546463, 0.9607843, 1, 0, 1,
-0.9498888, 0.2177572, -1.532492, 0.9568627, 1, 0, 1,
-0.9471354, -0.8710864, -1.908981, 0.9490196, 1, 0, 1,
-0.9439924, 0.6526719, -1.46104, 0.945098, 1, 0, 1,
-0.923647, -0.9946655, -2.561093, 0.9372549, 1, 0, 1,
-0.9221736, -0.6381815, -2.208154, 0.9333333, 1, 0, 1,
-0.9193766, -0.5604823, -2.291049, 0.9254902, 1, 0, 1,
-0.9188876, 1.394087, -0.6710873, 0.9215686, 1, 0, 1,
-0.9150512, 1.231178, -1.202464, 0.9137255, 1, 0, 1,
-0.9080243, -0.2831151, -1.731112, 0.9098039, 1, 0, 1,
-0.905679, 2.534168, -0.8774281, 0.9019608, 1, 0, 1,
-0.8964149, -1.03841, -3.545179, 0.8941177, 1, 0, 1,
-0.8919066, -0.6737607, -0.3967, 0.8901961, 1, 0, 1,
-0.8888258, 1.059699, -2.928696, 0.8823529, 1, 0, 1,
-0.8818254, -1.41089, -3.789383, 0.8784314, 1, 0, 1,
-0.8811534, 0.4310261, -1.339666, 0.8705882, 1, 0, 1,
-0.8753556, 1.312491, -0.5771379, 0.8666667, 1, 0, 1,
-0.871902, -2.091627, -2.347744, 0.8588235, 1, 0, 1,
-0.8697643, 1.153508, -0.9591147, 0.854902, 1, 0, 1,
-0.8691459, 3.148773, 1.21755, 0.8470588, 1, 0, 1,
-0.8671555, -0.1032092, -1.338581, 0.8431373, 1, 0, 1,
-0.8656694, -2.400158, -2.930709, 0.8352941, 1, 0, 1,
-0.8560585, -0.6254032, -2.638804, 0.8313726, 1, 0, 1,
-0.8527597, 1.142478, -1.227354, 0.8235294, 1, 0, 1,
-0.8517129, 0.3205145, -1.208964, 0.8196079, 1, 0, 1,
-0.8488125, 0.4126743, -0.4352426, 0.8117647, 1, 0, 1,
-0.8478824, -1.307308, -2.838306, 0.8078431, 1, 0, 1,
-0.83428, -0.8311731, -2.175189, 0.8, 1, 0, 1,
-0.8327382, -0.3213479, -1.826559, 0.7921569, 1, 0, 1,
-0.8314864, 1.417302, 1.799098, 0.7882353, 1, 0, 1,
-0.8304514, 0.826, -0.6724142, 0.7803922, 1, 0, 1,
-0.8295157, -0.3422238, -2.56212, 0.7764706, 1, 0, 1,
-0.8253961, -0.1921181, -0.8652285, 0.7686275, 1, 0, 1,
-0.8247687, -0.3533632, -2.151797, 0.7647059, 1, 0, 1,
-0.821493, 0.03269117, -1.949372, 0.7568628, 1, 0, 1,
-0.819329, 1.038851, -0.5464985, 0.7529412, 1, 0, 1,
-0.8188004, 1.138885, -1.243806, 0.7450981, 1, 0, 1,
-0.8129113, 0.9802039, -0.02334622, 0.7411765, 1, 0, 1,
-0.8013647, -0.4507027, -0.8809516, 0.7333333, 1, 0, 1,
-0.7993538, 1.394814, 1.195117, 0.7294118, 1, 0, 1,
-0.7908425, -0.849568, -2.829618, 0.7215686, 1, 0, 1,
-0.7906992, -1.070621, -2.552809, 0.7176471, 1, 0, 1,
-0.7859449, -0.4997789, -2.806683, 0.7098039, 1, 0, 1,
-0.7789532, -0.5007412, -2.278841, 0.7058824, 1, 0, 1,
-0.7764102, -0.2248138, -2.971404, 0.6980392, 1, 0, 1,
-0.7691916, -0.002466561, -2.036261, 0.6901961, 1, 0, 1,
-0.7591267, -0.796811, -1.071336, 0.6862745, 1, 0, 1,
-0.7504798, 0.4378256, -1.579028, 0.6784314, 1, 0, 1,
-0.7466314, 0.280904, -0.1325191, 0.6745098, 1, 0, 1,
-0.7442455, -0.1986835, -1.95413, 0.6666667, 1, 0, 1,
-0.7428198, -0.5583913, -1.01812, 0.6627451, 1, 0, 1,
-0.7400029, 0.3105249, -0.8969007, 0.654902, 1, 0, 1,
-0.7364145, -0.5185556, -1.185224, 0.6509804, 1, 0, 1,
-0.7339136, 0.5667374, -0.2942032, 0.6431373, 1, 0, 1,
-0.7317191, -1.05701, -2.098099, 0.6392157, 1, 0, 1,
-0.7311789, -0.05554319, -3.534387, 0.6313726, 1, 0, 1,
-0.7295635, -0.7270659, -1.588208, 0.627451, 1, 0, 1,
-0.7270072, 1.30284, -2.197286, 0.6196079, 1, 0, 1,
-0.7256166, -0.3327123, -1.292865, 0.6156863, 1, 0, 1,
-0.7240171, 0.4943987, -0.5827917, 0.6078432, 1, 0, 1,
-0.7205562, -0.2491093, -0.866703, 0.6039216, 1, 0, 1,
-0.7188874, 1.008462, -2.063585, 0.5960785, 1, 0, 1,
-0.7161824, 1.247834, -0.9369571, 0.5882353, 1, 0, 1,
-0.7157305, -0.9494066, -2.343077, 0.5843138, 1, 0, 1,
-0.7121591, 0.006994196, -3.382147, 0.5764706, 1, 0, 1,
-0.708748, 1.024384, -2.543029, 0.572549, 1, 0, 1,
-0.7070732, -1.058061, -3.173015, 0.5647059, 1, 0, 1,
-0.7042931, -0.8584173, -3.054566, 0.5607843, 1, 0, 1,
-0.7025754, -2.825388, -3.135145, 0.5529412, 1, 0, 1,
-0.7017254, -0.3147373, -3.789968, 0.5490196, 1, 0, 1,
-0.7009863, -0.4717536, -1.52941, 0.5411765, 1, 0, 1,
-0.6957807, -0.3991675, -0.2427505, 0.5372549, 1, 0, 1,
-0.6931152, -0.5959854, -1.101116, 0.5294118, 1, 0, 1,
-0.6872097, 0.3085909, -2.036471, 0.5254902, 1, 0, 1,
-0.6868167, 0.03595915, -1.008656, 0.5176471, 1, 0, 1,
-0.6835567, 0.6990879, -2.249752, 0.5137255, 1, 0, 1,
-0.6835486, -0.1356862, -1.954169, 0.5058824, 1, 0, 1,
-0.6828928, 0.4375583, -1.613469, 0.5019608, 1, 0, 1,
-0.680156, 0.1113077, -1.370501, 0.4941176, 1, 0, 1,
-0.6784292, 0.235863, -0.614345, 0.4862745, 1, 0, 1,
-0.6765407, 0.01703945, -3.646299, 0.4823529, 1, 0, 1,
-0.6744941, 0.7655004, -1.797304, 0.4745098, 1, 0, 1,
-0.6731644, 0.7151958, -1.165305, 0.4705882, 1, 0, 1,
-0.6696747, -0.9304647, -3.871975, 0.4627451, 1, 0, 1,
-0.6689826, 0.3923205, -1.269013, 0.4588235, 1, 0, 1,
-0.6676928, 0.2323953, -0.1730129, 0.4509804, 1, 0, 1,
-0.6664889, 0.4420425, -0.09738147, 0.4470588, 1, 0, 1,
-0.6663885, -0.1163113, -1.368449, 0.4392157, 1, 0, 1,
-0.665578, 0.2211277, -1.488733, 0.4352941, 1, 0, 1,
-0.6615752, 0.809165, -2.498798, 0.427451, 1, 0, 1,
-0.6613404, 1.285917, 1.722123, 0.4235294, 1, 0, 1,
-0.6478655, 0.5597981, 0.1094632, 0.4156863, 1, 0, 1,
-0.6439346, -0.6655365, -2.814828, 0.4117647, 1, 0, 1,
-0.6433897, -0.03406789, -1.422604, 0.4039216, 1, 0, 1,
-0.6402437, -0.301358, -1.29277, 0.3960784, 1, 0, 1,
-0.6334033, -0.376025, -2.43941, 0.3921569, 1, 0, 1,
-0.632763, -0.182095, -0.8053483, 0.3843137, 1, 0, 1,
-0.6308932, 0.4119288, -2.541438, 0.3803922, 1, 0, 1,
-0.6279641, -2.451352, -3.616942, 0.372549, 1, 0, 1,
-0.62172, -0.3579414, -2.281154, 0.3686275, 1, 0, 1,
-0.6114885, -0.244904, -1.906036, 0.3607843, 1, 0, 1,
-0.6100346, -1.587325, -3.420752, 0.3568628, 1, 0, 1,
-0.6081639, -1.910841, -2.624579, 0.3490196, 1, 0, 1,
-0.6043327, -0.5940205, -1.200197, 0.345098, 1, 0, 1,
-0.6042054, 0.5440564, -0.3756523, 0.3372549, 1, 0, 1,
-0.602345, -1.212837, -2.763083, 0.3333333, 1, 0, 1,
-0.6011991, -0.248544, -1.953703, 0.3254902, 1, 0, 1,
-0.592161, 0.1743969, -0.08353075, 0.3215686, 1, 0, 1,
-0.5864824, 0.1244072, -0.6971809, 0.3137255, 1, 0, 1,
-0.5775698, 0.2947363, -0.9983031, 0.3098039, 1, 0, 1,
-0.5768413, 0.2084487, 0.139881, 0.3019608, 1, 0, 1,
-0.572047, 0.3597656, -0.6019716, 0.2941177, 1, 0, 1,
-0.5680364, -1.719634, -4.104811, 0.2901961, 1, 0, 1,
-0.5582538, 0.9164099, -0.3503379, 0.282353, 1, 0, 1,
-0.5566904, 1.464136, 0.863826, 0.2784314, 1, 0, 1,
-0.5559572, 0.09216505, -0.7134255, 0.2705882, 1, 0, 1,
-0.555797, 1.468644, 0.7902761, 0.2666667, 1, 0, 1,
-0.5536377, -0.9556273, -1.335885, 0.2588235, 1, 0, 1,
-0.5519217, 0.3589371, -0.9494463, 0.254902, 1, 0, 1,
-0.5497417, -0.4703217, -0.8395149, 0.2470588, 1, 0, 1,
-0.5452201, 0.6865953, -0.6281056, 0.2431373, 1, 0, 1,
-0.5381383, -0.03309542, -2.435986, 0.2352941, 1, 0, 1,
-0.5361961, -1.469638, -1.372337, 0.2313726, 1, 0, 1,
-0.5303097, -1.125797, -2.420618, 0.2235294, 1, 0, 1,
-0.5302513, -0.1208147, -2.395004, 0.2196078, 1, 0, 1,
-0.5283718, 0.6958097, 0.2812015, 0.2117647, 1, 0, 1,
-0.5236687, -0.1686185, -1.6304, 0.2078431, 1, 0, 1,
-0.5208574, 1.884798, 0.2819174, 0.2, 1, 0, 1,
-0.5188706, -0.4298724, -1.512321, 0.1921569, 1, 0, 1,
-0.5142206, 0.1497505, 0.8985642, 0.1882353, 1, 0, 1,
-0.5112873, 0.2246599, 0.01624757, 0.1803922, 1, 0, 1,
-0.509776, -1.216583, -3.248281, 0.1764706, 1, 0, 1,
-0.5085829, 0.4072827, -0.5316302, 0.1686275, 1, 0, 1,
-0.5055831, -0.0468006, -3.051709, 0.1647059, 1, 0, 1,
-0.5044956, 0.173222, -2.163593, 0.1568628, 1, 0, 1,
-0.5038974, 2.081917, -1.335341, 0.1529412, 1, 0, 1,
-0.4994934, 1.613911, -1.257149, 0.145098, 1, 0, 1,
-0.4982696, -0.7219418, -3.545106, 0.1411765, 1, 0, 1,
-0.4960423, 2.15868, 1.306793, 0.1333333, 1, 0, 1,
-0.4953522, 0.4877931, -2.131757, 0.1294118, 1, 0, 1,
-0.495122, -1.364522, -3.272589, 0.1215686, 1, 0, 1,
-0.494725, 1.372412, -0.7313889, 0.1176471, 1, 0, 1,
-0.4841728, -0.2055395, -1.930986, 0.1098039, 1, 0, 1,
-0.4831506, 0.03683234, -0.6636621, 0.1058824, 1, 0, 1,
-0.4783036, -1.025503, -3.606448, 0.09803922, 1, 0, 1,
-0.4662246, 0.1319616, 0.08672738, 0.09019608, 1, 0, 1,
-0.4656552, -0.250553, -3.26324, 0.08627451, 1, 0, 1,
-0.4644953, -0.2195509, 0.5266075, 0.07843138, 1, 0, 1,
-0.4642152, 1.421396, -0.1149382, 0.07450981, 1, 0, 1,
-0.4636672, 1.297115, 1.285798, 0.06666667, 1, 0, 1,
-0.456035, -1.92302, -2.435194, 0.0627451, 1, 0, 1,
-0.4527664, -1.28741, -2.198918, 0.05490196, 1, 0, 1,
-0.4518371, 0.8682205, 0.5946068, 0.05098039, 1, 0, 1,
-0.4476738, -0.9726021, -3.397978, 0.04313726, 1, 0, 1,
-0.4446836, -1.401244, -1.244129, 0.03921569, 1, 0, 1,
-0.4440143, 0.9758074, 0.003279651, 0.03137255, 1, 0, 1,
-0.4422757, 0.4707781, -1.620094, 0.02745098, 1, 0, 1,
-0.4382989, -1.207584, -2.408686, 0.01960784, 1, 0, 1,
-0.4382436, 1.061961, 1.461493, 0.01568628, 1, 0, 1,
-0.4352058, -0.9254727, -3.525283, 0.007843138, 1, 0, 1,
-0.4317084, -1.09895, -3.723856, 0.003921569, 1, 0, 1,
-0.4307936, -0.05781273, -2.258959, 0, 1, 0.003921569, 1,
-0.4272699, 1.01848, -1.598608, 0, 1, 0.01176471, 1,
-0.4268868, -0.03153704, -2.138235, 0, 1, 0.01568628, 1,
-0.4208964, -1.571919, -4.182001, 0, 1, 0.02352941, 1,
-0.4172048, -0.04454024, -1.608341, 0, 1, 0.02745098, 1,
-0.4126623, -1.117073, -5.122022, 0, 1, 0.03529412, 1,
-0.4122452, 1.237948, 0.9682547, 0, 1, 0.03921569, 1,
-0.4119917, 1.025104, -0.7399672, 0, 1, 0.04705882, 1,
-0.4085242, 0.2437909, -0.6100174, 0, 1, 0.05098039, 1,
-0.4041011, -0.8407261, -4.793031, 0, 1, 0.05882353, 1,
-0.4016297, -0.613595, -2.747329, 0, 1, 0.0627451, 1,
-0.3935507, 1.529139, -0.09928104, 0, 1, 0.07058824, 1,
-0.3911968, 0.1664013, -1.524907, 0, 1, 0.07450981, 1,
-0.3901723, -0.9178978, -4.394132, 0, 1, 0.08235294, 1,
-0.3884031, -2.250652, -2.848891, 0, 1, 0.08627451, 1,
-0.386777, -0.5169689, -4.59442, 0, 1, 0.09411765, 1,
-0.3797346, -0.216491, -1.093369, 0, 1, 0.1019608, 1,
-0.3793783, -0.3340838, -1.23212, 0, 1, 0.1058824, 1,
-0.3766921, -0.9959253, -3.827418, 0, 1, 0.1137255, 1,
-0.3710223, -1.406042, -1.748866, 0, 1, 0.1176471, 1,
-0.3680074, 0.9018432, -0.978098, 0, 1, 0.1254902, 1,
-0.3646147, 1.206128, 0.8277543, 0, 1, 0.1294118, 1,
-0.3555353, -1.362353, -4.694394, 0, 1, 0.1372549, 1,
-0.3538803, 0.4463428, -2.011044, 0, 1, 0.1411765, 1,
-0.3493803, 0.8933654, -0.2993464, 0, 1, 0.1490196, 1,
-0.3486972, 0.03665351, -0.2876157, 0, 1, 0.1529412, 1,
-0.3483709, -1.184156, -1.897778, 0, 1, 0.1607843, 1,
-0.3479048, 1.297634, -0.03545512, 0, 1, 0.1647059, 1,
-0.3473514, 2.25932, -0.5311942, 0, 1, 0.172549, 1,
-0.3439281, 0.008541576, -0.9011455, 0, 1, 0.1764706, 1,
-0.3415767, -1.289871, -3.026051, 0, 1, 0.1843137, 1,
-0.3382263, 1.371274, -0.4163593, 0, 1, 0.1882353, 1,
-0.3374676, 0.2604475, -1.49522, 0, 1, 0.1960784, 1,
-0.3341962, 2.118032, -0.4846028, 0, 1, 0.2039216, 1,
-0.3288525, 2.236663, 0.41353, 0, 1, 0.2078431, 1,
-0.3283077, -0.5252354, -0.7365885, 0, 1, 0.2156863, 1,
-0.3276275, -0.6293827, -2.085819, 0, 1, 0.2196078, 1,
-0.3256169, -1.582086, -1.911612, 0, 1, 0.227451, 1,
-0.3249055, 0.1001503, -1.818444, 0, 1, 0.2313726, 1,
-0.3221556, 0.9540955, -1.403923, 0, 1, 0.2392157, 1,
-0.3193517, 1.866284, 1.688051, 0, 1, 0.2431373, 1,
-0.3189168, 0.2396532, -0.4454457, 0, 1, 0.2509804, 1,
-0.3152719, 0.6133136, 0.5077187, 0, 1, 0.254902, 1,
-0.3126924, 1.302204, -0.6167088, 0, 1, 0.2627451, 1,
-0.2959689, -0.2760414, -3.829266, 0, 1, 0.2666667, 1,
-0.294199, -1.171606, -0.9871483, 0, 1, 0.2745098, 1,
-0.2893878, 0.0381196, -1.843031, 0, 1, 0.2784314, 1,
-0.2877671, 0.3452896, -2.554941, 0, 1, 0.2862745, 1,
-0.2845751, 0.8686301, 2.998611, 0, 1, 0.2901961, 1,
-0.2774451, -0.9359492, -2.926122, 0, 1, 0.2980392, 1,
-0.277087, 0.6392283, -1.698452, 0, 1, 0.3058824, 1,
-0.2753855, 0.1361551, -0.7810526, 0, 1, 0.3098039, 1,
-0.2749049, 0.6773612, -0.04152241, 0, 1, 0.3176471, 1,
-0.2729543, 0.01590374, -3.103, 0, 1, 0.3215686, 1,
-0.2682009, 1.078773, 0.7347426, 0, 1, 0.3294118, 1,
-0.2668413, 1.443909, 1.39966, 0, 1, 0.3333333, 1,
-0.2642859, -2.119657, -2.145778, 0, 1, 0.3411765, 1,
-0.2630577, -0.3076031, -3.529766, 0, 1, 0.345098, 1,
-0.2563213, -0.6505808, -1.381585, 0, 1, 0.3529412, 1,
-0.2529508, -0.0200287, -1.505597, 0, 1, 0.3568628, 1,
-0.2493597, 0.06710527, -1.978084, 0, 1, 0.3647059, 1,
-0.2467303, 0.2939022, -0.1798109, 0, 1, 0.3686275, 1,
-0.2433346, 0.07023935, 0.6607247, 0, 1, 0.3764706, 1,
-0.2430622, -0.121998, -1.359865, 0, 1, 0.3803922, 1,
-0.2393309, 0.6360948, -0.3941981, 0, 1, 0.3882353, 1,
-0.2344155, -1.074044, -2.341848, 0, 1, 0.3921569, 1,
-0.2319073, -1.037452, -3.908381, 0, 1, 0.4, 1,
-0.2301876, -0.00822767, -1.085604, 0, 1, 0.4078431, 1,
-0.226909, 1.551495, -1.880966, 0, 1, 0.4117647, 1,
-0.2263234, 0.5695967, -0.7034503, 0, 1, 0.4196078, 1,
-0.2261263, 0.6234974, -0.4487439, 0, 1, 0.4235294, 1,
-0.2221563, 1.061761, -1.039209, 0, 1, 0.4313726, 1,
-0.2175038, -0.1562304, -2.883277, 0, 1, 0.4352941, 1,
-0.2143778, 1.188627, -0.6927943, 0, 1, 0.4431373, 1,
-0.2138005, -1.391741, -2.414076, 0, 1, 0.4470588, 1,
-0.2094481, 0.8675898, 0.08512941, 0, 1, 0.454902, 1,
-0.2084651, -1.052024, -2.399749, 0, 1, 0.4588235, 1,
-0.2035851, -0.3405544, -2.818629, 0, 1, 0.4666667, 1,
-0.2032442, 0.870222, 1.173404, 0, 1, 0.4705882, 1,
-0.2029131, 0.5831742, 0.181014, 0, 1, 0.4784314, 1,
-0.1999217, -0.332534, -4.437614, 0, 1, 0.4823529, 1,
-0.1984463, -0.3526856, -2.153176, 0, 1, 0.4901961, 1,
-0.1983025, -0.5059602, -4.510387, 0, 1, 0.4941176, 1,
-0.1982887, 0.108267, -2.75273, 0, 1, 0.5019608, 1,
-0.1977354, -0.9764634, 0.05227244, 0, 1, 0.509804, 1,
-0.1876555, 0.3510647, -2.179541, 0, 1, 0.5137255, 1,
-0.1849955, -0.6044112, -1.714289, 0, 1, 0.5215687, 1,
-0.1825559, -1.135972, -4.729118, 0, 1, 0.5254902, 1,
-0.1825557, -0.09719299, -2.517614, 0, 1, 0.5333334, 1,
-0.1785113, 0.4071078, 0.7335995, 0, 1, 0.5372549, 1,
-0.1780065, 0.7092079, -0.9007932, 0, 1, 0.5450981, 1,
-0.1769079, 0.5807828, -0.7309943, 0, 1, 0.5490196, 1,
-0.1634656, -0.6338255, -1.684718, 0, 1, 0.5568628, 1,
-0.1589475, 0.5317396, 0.6811094, 0, 1, 0.5607843, 1,
-0.156137, 1.033902, -0.2418673, 0, 1, 0.5686275, 1,
-0.1555695, -0.4546459, -2.747178, 0, 1, 0.572549, 1,
-0.1536424, -0.8515532, -1.540185, 0, 1, 0.5803922, 1,
-0.1511663, 0.4149347, -0.1340781, 0, 1, 0.5843138, 1,
-0.1510114, -0.860667, -3.622491, 0, 1, 0.5921569, 1,
-0.1496232, 0.6214376, -0.5058985, 0, 1, 0.5960785, 1,
-0.1484839, -0.5725632, -1.558406, 0, 1, 0.6039216, 1,
-0.1479971, 0.1086969, -2.665607, 0, 1, 0.6117647, 1,
-0.1459871, 0.1715372, -1.153725, 0, 1, 0.6156863, 1,
-0.1456265, 0.2917336, 1.131341, 0, 1, 0.6235294, 1,
-0.1434664, 0.5364699, -0.2111603, 0, 1, 0.627451, 1,
-0.1424458, -1.03242, -3.425054, 0, 1, 0.6352941, 1,
-0.1423701, -0.6913788, -1.268841, 0, 1, 0.6392157, 1,
-0.1418813, -0.6367918, -1.200591, 0, 1, 0.6470588, 1,
-0.1350707, -1.164555, -3.578732, 0, 1, 0.6509804, 1,
-0.1299865, 0.1265305, -0.4668174, 0, 1, 0.6588235, 1,
-0.1279555, 1.677436, -0.01862523, 0, 1, 0.6627451, 1,
-0.1269375, 0.1946371, -1.763685, 0, 1, 0.6705883, 1,
-0.1252705, -0.3772659, -2.229532, 0, 1, 0.6745098, 1,
-0.1238235, 0.4187727, 0.2268838, 0, 1, 0.682353, 1,
-0.1186507, 0.8059893, 0.03418043, 0, 1, 0.6862745, 1,
-0.1146556, -0.5499071, -1.916309, 0, 1, 0.6941177, 1,
-0.1097074, 0.5780349, -0.4952416, 0, 1, 0.7019608, 1,
-0.1087516, -1.169764, -1.154254, 0, 1, 0.7058824, 1,
-0.1072958, 0.4112206, -1.440868, 0, 1, 0.7137255, 1,
-0.1059512, 1.273418, -0.05424898, 0, 1, 0.7176471, 1,
-0.1056205, 1.627646, -1.254053, 0, 1, 0.7254902, 1,
-0.1013084, 0.377519, 0.4413815, 0, 1, 0.7294118, 1,
-0.1005645, -0.752082, -1.642846, 0, 1, 0.7372549, 1,
-0.09746127, 0.01641269, -1.694262, 0, 1, 0.7411765, 1,
-0.09624945, -0.3257657, -2.55608, 0, 1, 0.7490196, 1,
-0.09503522, 0.530616, -2.134773, 0, 1, 0.7529412, 1,
-0.09332544, -0.1261754, -4.143691, 0, 1, 0.7607843, 1,
-0.08020905, -0.5864828, -5.022859, 0, 1, 0.7647059, 1,
-0.07527999, -0.4797818, -4.490138, 0, 1, 0.772549, 1,
-0.07327751, 1.612888, -1.878135, 0, 1, 0.7764706, 1,
-0.07300466, 0.3930732, -0.2592517, 0, 1, 0.7843137, 1,
-0.07241374, -3.351992, -2.373512, 0, 1, 0.7882353, 1,
-0.07128531, 0.8983455, -0.6814438, 0, 1, 0.7960784, 1,
-0.07041998, 0.3882091, -1.124116, 0, 1, 0.8039216, 1,
-0.06071973, 0.6742838, 2.812528, 0, 1, 0.8078431, 1,
-0.0553752, -0.4780235, -5.230383, 0, 1, 0.8156863, 1,
-0.05328408, -0.3699576, -4.258619, 0, 1, 0.8196079, 1,
-0.04622199, -1.426543, -3.26336, 0, 1, 0.827451, 1,
-0.04620565, 0.8552222, 0.6575693, 0, 1, 0.8313726, 1,
-0.04040382, 1.26468, -1.616094, 0, 1, 0.8392157, 1,
-0.0397859, 0.3162619, -0.9453077, 0, 1, 0.8431373, 1,
-0.03937072, -0.3518936, -5.281933, 0, 1, 0.8509804, 1,
-0.03760588, 1.493955, -1.44873, 0, 1, 0.854902, 1,
-0.03654772, -0.3323799, -4.537486, 0, 1, 0.8627451, 1,
-0.03598483, 0.9690619, 0.2320196, 0, 1, 0.8666667, 1,
-0.03589352, 0.8734865, -0.8959224, 0, 1, 0.8745098, 1,
-0.02584529, -0.3923617, -2.945385, 0, 1, 0.8784314, 1,
-0.02550194, 0.5277709, -1.720845, 0, 1, 0.8862745, 1,
-0.02199991, 0.4758095, -0.7399185, 0, 1, 0.8901961, 1,
-0.0217714, -0.7201481, -1.257723, 0, 1, 0.8980392, 1,
-0.0187872, -1.739272, -4.227947, 0, 1, 0.9058824, 1,
-0.01725226, 0.3313904, 0.6643293, 0, 1, 0.9098039, 1,
-0.01495133, 0.8458708, -1.1818, 0, 1, 0.9176471, 1,
-0.01050699, -1.53868, -2.107039, 0, 1, 0.9215686, 1,
-0.008785071, -0.1122184, -2.780789, 0, 1, 0.9294118, 1,
-0.006256584, -1.091582, -3.822165, 0, 1, 0.9333333, 1,
-0.005595119, 2.170162, 0.002722725, 0, 1, 0.9411765, 1,
-0.005587238, -0.7782654, -3.788258, 0, 1, 0.945098, 1,
-0.004786989, 0.2978689, 0.8880735, 0, 1, 0.9529412, 1,
-0.002712858, 0.3532918, 0.9128262, 0, 1, 0.9568627, 1,
-0.001123046, -0.914301, -2.581108, 0, 1, 0.9647059, 1,
-0.001015203, -0.3282929, -3.832867, 0, 1, 0.9686275, 1,
0.001529299, 0.05525514, -0.01348832, 0, 1, 0.9764706, 1,
0.001570249, -1.105082, 2.724928, 0, 1, 0.9803922, 1,
0.005306865, -0.758786, 4.686119, 0, 1, 0.9882353, 1,
0.005496594, -0.2733603, 2.938007, 0, 1, 0.9921569, 1,
0.01071131, 0.7956981, -0.1116506, 0, 1, 1, 1,
0.01671256, -0.9478952, 2.555957, 0, 0.9921569, 1, 1,
0.01729751, 0.3408806, -1.389979, 0, 0.9882353, 1, 1,
0.02099035, 0.3983416, 0.4736677, 0, 0.9803922, 1, 1,
0.02182296, 1.102826, 0.871035, 0, 0.9764706, 1, 1,
0.02243245, -1.061092, 4.012505, 0, 0.9686275, 1, 1,
0.02319715, -0.1552528, 3.887136, 0, 0.9647059, 1, 1,
0.02730713, 1.280921, 1.208727, 0, 0.9568627, 1, 1,
0.02839999, -0.2110847, 3.427289, 0, 0.9529412, 1, 1,
0.03128777, 0.1328441, -0.01444426, 0, 0.945098, 1, 1,
0.03297582, 1.271769, -0.776683, 0, 0.9411765, 1, 1,
0.03647166, -0.2974117, 3.947277, 0, 0.9333333, 1, 1,
0.04155662, -0.1492214, 3.902648, 0, 0.9294118, 1, 1,
0.04697444, 0.8252943, -0.6994568, 0, 0.9215686, 1, 1,
0.04704243, -1.36914, 1.46546, 0, 0.9176471, 1, 1,
0.05159572, -1.10091, 2.805507, 0, 0.9098039, 1, 1,
0.05286398, -0.9291552, 3.160642, 0, 0.9058824, 1, 1,
0.0533955, 0.810851, 0.3520743, 0, 0.8980392, 1, 1,
0.05425186, 1.013508, 0.5069962, 0, 0.8901961, 1, 1,
0.05516901, 1.18654, 1.117419, 0, 0.8862745, 1, 1,
0.05627762, -2.666283, 4.328932, 0, 0.8784314, 1, 1,
0.05938987, -0.2371379, 3.48816, 0, 0.8745098, 1, 1,
0.06145979, 0.3417131, 0.7310829, 0, 0.8666667, 1, 1,
0.06453472, -0.8754815, 2.42658, 0, 0.8627451, 1, 1,
0.06464062, 0.3312633, 1.700002, 0, 0.854902, 1, 1,
0.0662097, -1.440734, 3.730527, 0, 0.8509804, 1, 1,
0.06968566, 0.8112857, 0.956032, 0, 0.8431373, 1, 1,
0.07189226, -0.2724522, 1.266107, 0, 0.8392157, 1, 1,
0.07581618, 0.07848637, 1.663609, 0, 0.8313726, 1, 1,
0.07807835, -0.2526348, 3.638097, 0, 0.827451, 1, 1,
0.07875046, -0.5274959, 3.326508, 0, 0.8196079, 1, 1,
0.08024539, 1.343506, 1.143691, 0, 0.8156863, 1, 1,
0.08213231, -0.8228964, 4.051591, 0, 0.8078431, 1, 1,
0.08352275, -0.002763761, 1.265453, 0, 0.8039216, 1, 1,
0.08666308, 0.8119146, 0.775372, 0, 0.7960784, 1, 1,
0.08815736, 1.532117, 0.1761616, 0, 0.7882353, 1, 1,
0.09046632, -0.7237208, 3.547863, 0, 0.7843137, 1, 1,
0.09124377, -0.7672676, 1.931557, 0, 0.7764706, 1, 1,
0.09822243, -1.239504, 1.996628, 0, 0.772549, 1, 1,
0.1058461, 1.545519, -1.60476, 0, 0.7647059, 1, 1,
0.1084735, 0.139354, 2.265506, 0, 0.7607843, 1, 1,
0.1091628, -0.3304886, 2.842677, 0, 0.7529412, 1, 1,
0.1099762, -2.354211, 3.014697, 0, 0.7490196, 1, 1,
0.1113742, -1.0571, 3.092727, 0, 0.7411765, 1, 1,
0.1161004, 1.172958, -0.05555969, 0, 0.7372549, 1, 1,
0.116345, -2.090094, 3.541365, 0, 0.7294118, 1, 1,
0.117845, 2.327258, 0.08679201, 0, 0.7254902, 1, 1,
0.119654, 0.1986775, 0.2115476, 0, 0.7176471, 1, 1,
0.1230171, 0.5244214, 0.859535, 0, 0.7137255, 1, 1,
0.1256415, 0.3294629, -1.549467, 0, 0.7058824, 1, 1,
0.1257194, 0.1474366, 0.06208048, 0, 0.6980392, 1, 1,
0.1316452, 0.6199359, -0.5091263, 0, 0.6941177, 1, 1,
0.1360404, -0.3865371, 2.598461, 0, 0.6862745, 1, 1,
0.1360776, -0.125117, 3.722238, 0, 0.682353, 1, 1,
0.1383733, 0.9069786, 0.6731678, 0, 0.6745098, 1, 1,
0.1393915, -1.372454, 2.12603, 0, 0.6705883, 1, 1,
0.1409731, -0.1642971, 2.409777, 0, 0.6627451, 1, 1,
0.1445075, -1.35991, 3.187408, 0, 0.6588235, 1, 1,
0.144521, 1.505132, 0.3278873, 0, 0.6509804, 1, 1,
0.1453774, 1.173061, 0.4432454, 0, 0.6470588, 1, 1,
0.1456154, -0.577967, 2.841581, 0, 0.6392157, 1, 1,
0.1477771, -0.2515288, 3.438848, 0, 0.6352941, 1, 1,
0.1508085, 0.03627056, 0.6802783, 0, 0.627451, 1, 1,
0.1525417, 0.4966838, 1.732878, 0, 0.6235294, 1, 1,
0.1566885, 1.219613, -2.009614, 0, 0.6156863, 1, 1,
0.1573619, 1.05211, -0.2335976, 0, 0.6117647, 1, 1,
0.1607545, -0.9674789, 2.30471, 0, 0.6039216, 1, 1,
0.1635687, -0.4727369, 1.456935, 0, 0.5960785, 1, 1,
0.1656783, -0.9742392, 3.720777, 0, 0.5921569, 1, 1,
0.1693571, -0.4594443, 1.889501, 0, 0.5843138, 1, 1,
0.1731397, 0.695873, 1.219137, 0, 0.5803922, 1, 1,
0.1737411, 0.4595939, -1.260908, 0, 0.572549, 1, 1,
0.1766947, -0.3057095, 3.882528, 0, 0.5686275, 1, 1,
0.1814086, -2.264031, 1.533957, 0, 0.5607843, 1, 1,
0.1820123, 1.413291, -1.677365, 0, 0.5568628, 1, 1,
0.1859667, -1.792457, 3.167195, 0, 0.5490196, 1, 1,
0.1880501, -2.130859, 3.397469, 0, 0.5450981, 1, 1,
0.1910772, -0.3410702, 4.805271, 0, 0.5372549, 1, 1,
0.1942935, 0.05634856, -0.3364873, 0, 0.5333334, 1, 1,
0.1946851, -0.7119355, 3.733697, 0, 0.5254902, 1, 1,
0.1958043, -0.3357227, 3.127541, 0, 0.5215687, 1, 1,
0.1966929, 3.052296, -0.0379466, 0, 0.5137255, 1, 1,
0.201293, 0.4503232, -0.6621755, 0, 0.509804, 1, 1,
0.2078074, 1.48965, 0.9816622, 0, 0.5019608, 1, 1,
0.2080276, 1.860185, 0.3837089, 0, 0.4941176, 1, 1,
0.2094953, 1.237018, -0.6114428, 0, 0.4901961, 1, 1,
0.2122398, 0.4722343, -1.640009, 0, 0.4823529, 1, 1,
0.2136315, 1.381546, 2.391209, 0, 0.4784314, 1, 1,
0.2149015, 0.4335947, 0.9837172, 0, 0.4705882, 1, 1,
0.2166941, 1.688408, 0.1796251, 0, 0.4666667, 1, 1,
0.2168207, 0.3325132, 0.06106228, 0, 0.4588235, 1, 1,
0.2240513, 0.1961702, 1.482386, 0, 0.454902, 1, 1,
0.2243263, -0.5113792, 1.220958, 0, 0.4470588, 1, 1,
0.2244248, 0.4870604, -0.8987277, 0, 0.4431373, 1, 1,
0.2253495, -0.08696463, 3.211356, 0, 0.4352941, 1, 1,
0.2274187, 0.3121745, 0.7452378, 0, 0.4313726, 1, 1,
0.2290615, 0.4186827, 0.8883324, 0, 0.4235294, 1, 1,
0.23472, -0.3952947, 1.773496, 0, 0.4196078, 1, 1,
0.2356608, -0.4520366, 4.089429, 0, 0.4117647, 1, 1,
0.2358494, 0.3502876, -0.128932, 0, 0.4078431, 1, 1,
0.2373711, 0.9890351, 1.217364, 0, 0.4, 1, 1,
0.2410019, 0.2633578, 1.162867, 0, 0.3921569, 1, 1,
0.2418566, -0.225142, 2.817908, 0, 0.3882353, 1, 1,
0.2422105, -0.4507115, 2.326424, 0, 0.3803922, 1, 1,
0.2474463, 0.06304369, 0.1775476, 0, 0.3764706, 1, 1,
0.2558834, 0.5665323, -0.6565645, 0, 0.3686275, 1, 1,
0.2576977, -0.499137, 3.895883, 0, 0.3647059, 1, 1,
0.2646246, 1.293115, 0.08116996, 0, 0.3568628, 1, 1,
0.2696331, 1.369679, 0.4085126, 0, 0.3529412, 1, 1,
0.275738, -0.4654118, 2.391501, 0, 0.345098, 1, 1,
0.2760726, 1.041266, 0.3556319, 0, 0.3411765, 1, 1,
0.2781181, -0.9655615, 2.597383, 0, 0.3333333, 1, 1,
0.2801618, 0.4086121, 0.08756546, 0, 0.3294118, 1, 1,
0.2876813, -0.374131, 1.921322, 0, 0.3215686, 1, 1,
0.2878412, 0.01035713, 2.035556, 0, 0.3176471, 1, 1,
0.2878556, -0.3950894, 2.874004, 0, 0.3098039, 1, 1,
0.2882216, -1.737681, 2.794611, 0, 0.3058824, 1, 1,
0.2887564, 0.2817275, 0.9544442, 0, 0.2980392, 1, 1,
0.2927459, -0.5166485, 2.552677, 0, 0.2901961, 1, 1,
0.2976041, 0.7142264, 0.3391028, 0, 0.2862745, 1, 1,
0.2977539, -0.01884868, 2.816264, 0, 0.2784314, 1, 1,
0.2996457, -1.886051, 2.886116, 0, 0.2745098, 1, 1,
0.300491, 0.3101453, 1.930799, 0, 0.2666667, 1, 1,
0.3024216, -0.643782, 2.152602, 0, 0.2627451, 1, 1,
0.3029504, 1.477892, 1.162468, 0, 0.254902, 1, 1,
0.3035576, -0.325038, 1.251101, 0, 0.2509804, 1, 1,
0.3037369, -0.4806005, 2.149808, 0, 0.2431373, 1, 1,
0.3040691, 0.6162106, 0.4971605, 0, 0.2392157, 1, 1,
0.3098004, -0.5262066, 2.073568, 0, 0.2313726, 1, 1,
0.3105772, -0.2174292, 4.228981, 0, 0.227451, 1, 1,
0.3156421, 1.323426, -0.4758847, 0, 0.2196078, 1, 1,
0.3190763, 0.8424401, 0.6185783, 0, 0.2156863, 1, 1,
0.3237821, -2.567449, 3.520595, 0, 0.2078431, 1, 1,
0.3251616, -0.4021257, 3.291302, 0, 0.2039216, 1, 1,
0.3266519, -0.2520894, 2.52699, 0, 0.1960784, 1, 1,
0.3270698, 0.6823965, -0.785195, 0, 0.1882353, 1, 1,
0.3286577, 0.4921882, -0.871794, 0, 0.1843137, 1, 1,
0.3329772, 0.005159407, 2.016308, 0, 0.1764706, 1, 1,
0.3357449, 0.1140878, -0.4926012, 0, 0.172549, 1, 1,
0.3366494, -0.2202348, 1.528329, 0, 0.1647059, 1, 1,
0.3426721, 0.1689886, 0.5085539, 0, 0.1607843, 1, 1,
0.3493158, -1.601658, 2.590325, 0, 0.1529412, 1, 1,
0.3513262, -1.759243, 3.149068, 0, 0.1490196, 1, 1,
0.352378, -0.4776419, 3.350996, 0, 0.1411765, 1, 1,
0.3530833, 0.5892363, 1.164315, 0, 0.1372549, 1, 1,
0.3576255, -2.52332, 1.454913, 0, 0.1294118, 1, 1,
0.3656699, 0.8126234, 2.547576, 0, 0.1254902, 1, 1,
0.3717709, 0.05270218, 2.74399, 0, 0.1176471, 1, 1,
0.3745703, 0.8027517, 0.02492843, 0, 0.1137255, 1, 1,
0.3748769, 0.2186332, -1.427453, 0, 0.1058824, 1, 1,
0.375543, -0.1339429, 2.601212, 0, 0.09803922, 1, 1,
0.3772207, -1.215158, 3.485481, 0, 0.09411765, 1, 1,
0.3789376, -2.189653, 2.111817, 0, 0.08627451, 1, 1,
0.3810167, -1.339484, 3.164932, 0, 0.08235294, 1, 1,
0.38166, -0.06085514, 1.449079, 0, 0.07450981, 1, 1,
0.3868393, 0.709996, 0.5581851, 0, 0.07058824, 1, 1,
0.390588, -1.253609, 2.841052, 0, 0.0627451, 1, 1,
0.394041, -1.741126, 2.203535, 0, 0.05882353, 1, 1,
0.3978843, -0.4903403, 2.397847, 0, 0.05098039, 1, 1,
0.3979962, 1.829749, -0.05206892, 0, 0.04705882, 1, 1,
0.398986, 0.1943856, -0.3460718, 0, 0.03921569, 1, 1,
0.4031039, 0.5999309, 1.184029, 0, 0.03529412, 1, 1,
0.4053322, 0.3087855, 0.8267068, 0, 0.02745098, 1, 1,
0.407444, -0.1740885, 0.936646, 0, 0.02352941, 1, 1,
0.4121457, -0.1914616, 2.049899, 0, 0.01568628, 1, 1,
0.4186424, -0.2500018, 1.378728, 0, 0.01176471, 1, 1,
0.4262702, -1.506867, 4.856596, 0, 0.003921569, 1, 1,
0.4307329, -0.2798828, 2.921659, 0.003921569, 0, 1, 1,
0.4307461, 0.5059766, 0.8485083, 0.007843138, 0, 1, 1,
0.4314505, 0.7583518, 0.3166179, 0.01568628, 0, 1, 1,
0.4324813, 0.9311713, 1.100877, 0.01960784, 0, 1, 1,
0.4339474, -1.993119, 2.737708, 0.02745098, 0, 1, 1,
0.434756, -1.551655, 2.022374, 0.03137255, 0, 1, 1,
0.4374485, 1.601876, -0.9888912, 0.03921569, 0, 1, 1,
0.4399788, 0.2814438, -0.2971411, 0.04313726, 0, 1, 1,
0.4402184, 0.8252801, -0.8292773, 0.05098039, 0, 1, 1,
0.4410608, -0.8109721, 3.754268, 0.05490196, 0, 1, 1,
0.4421063, -0.7833719, 3.199284, 0.0627451, 0, 1, 1,
0.4439777, 0.8411382, 0.6960311, 0.06666667, 0, 1, 1,
0.4462852, 0.5207458, 0.540583, 0.07450981, 0, 1, 1,
0.4531413, -0.1580019, 2.548461, 0.07843138, 0, 1, 1,
0.4573652, -0.723791, 2.462058, 0.08627451, 0, 1, 1,
0.4639696, 0.1127013, 3.302779, 0.09019608, 0, 1, 1,
0.4644757, -2.708415, 1.842982, 0.09803922, 0, 1, 1,
0.4704681, -0.7012169, -0.08720445, 0.1058824, 0, 1, 1,
0.4709973, 0.01730238, 3.129112, 0.1098039, 0, 1, 1,
0.4714552, -0.680537, 2.325375, 0.1176471, 0, 1, 1,
0.478089, 1.163362, 1.234368, 0.1215686, 0, 1, 1,
0.4853941, -1.835175, 1.133064, 0.1294118, 0, 1, 1,
0.4858841, -0.1883274, 3.85343, 0.1333333, 0, 1, 1,
0.4880948, -0.5867183, 3.315447, 0.1411765, 0, 1, 1,
0.4941176, 0.246062, 0.2440232, 0.145098, 0, 1, 1,
0.4947378, 0.5529379, 1.69177, 0.1529412, 0, 1, 1,
0.4976431, 0.1982886, 1.323796, 0.1568628, 0, 1, 1,
0.4987239, 0.6105448, -0.500201, 0.1647059, 0, 1, 1,
0.5048633, -0.3113416, 2.861683, 0.1686275, 0, 1, 1,
0.5071957, -0.1300122, 1.433977, 0.1764706, 0, 1, 1,
0.5087011, 0.2871119, -0.2235022, 0.1803922, 0, 1, 1,
0.5103236, -0.6748933, 2.368616, 0.1882353, 0, 1, 1,
0.5110419, -1.218654, 2.46321, 0.1921569, 0, 1, 1,
0.511074, 0.7845408, -0.1298419, 0.2, 0, 1, 1,
0.5139201, 0.6502374, 0.3439656, 0.2078431, 0, 1, 1,
0.5186182, -0.6374171, 3.373939, 0.2117647, 0, 1, 1,
0.5195284, 0.7609076, 0.5813127, 0.2196078, 0, 1, 1,
0.5223439, 0.2603432, 2.374086, 0.2235294, 0, 1, 1,
0.5240928, 1.587124, -0.2855863, 0.2313726, 0, 1, 1,
0.5252967, -0.743969, 1.780773, 0.2352941, 0, 1, 1,
0.5256825, 0.4190627, 0.3770677, 0.2431373, 0, 1, 1,
0.526354, -0.9712714, 3.471277, 0.2470588, 0, 1, 1,
0.5279139, -0.1087488, 2.333036, 0.254902, 0, 1, 1,
0.5282231, 0.6784926, -0.5454956, 0.2588235, 0, 1, 1,
0.528784, 0.9730167, -1.023683, 0.2666667, 0, 1, 1,
0.5380082, -0.7706769, 3.44569, 0.2705882, 0, 1, 1,
0.5380403, 1.503176, -0.05652206, 0.2784314, 0, 1, 1,
0.5388323, -0.3624795, 2.796854, 0.282353, 0, 1, 1,
0.5487854, 1.378492, -0.6016843, 0.2901961, 0, 1, 1,
0.5521509, -0.7499563, 2.331516, 0.2941177, 0, 1, 1,
0.5546265, 0.8284301, -0.7826191, 0.3019608, 0, 1, 1,
0.5591301, -0.6822686, 2.777769, 0.3098039, 0, 1, 1,
0.5599711, -0.3800393, 3.435698, 0.3137255, 0, 1, 1,
0.5618156, -0.499066, 1.015981, 0.3215686, 0, 1, 1,
0.5648673, 0.7816278, 0.4099008, 0.3254902, 0, 1, 1,
0.5667406, 0.5091681, 1.24406, 0.3333333, 0, 1, 1,
0.5721025, 0.238893, 0.3243859, 0.3372549, 0, 1, 1,
0.5775504, 2.855846, -0.9986305, 0.345098, 0, 1, 1,
0.579771, 0.006559138, 2.863299, 0.3490196, 0, 1, 1,
0.5797723, 0.3249303, 0.9082136, 0.3568628, 0, 1, 1,
0.5827861, 0.02932839, 0.3669825, 0.3607843, 0, 1, 1,
0.5866916, -0.2147952, 2.2384, 0.3686275, 0, 1, 1,
0.5883306, -0.3934436, 2.695222, 0.372549, 0, 1, 1,
0.5914328, -0.3402165, 2.002886, 0.3803922, 0, 1, 1,
0.5979812, -0.8998078, 2.889579, 0.3843137, 0, 1, 1,
0.5999199, -0.04551429, 0.59041, 0.3921569, 0, 1, 1,
0.6028991, -1.021538, 3.598407, 0.3960784, 0, 1, 1,
0.6046842, 0.5542394, -0.1091947, 0.4039216, 0, 1, 1,
0.613974, 1.177805, 0.2523457, 0.4117647, 0, 1, 1,
0.6147017, 1.098436, -0.7028586, 0.4156863, 0, 1, 1,
0.623625, -0.7095346, 1.576622, 0.4235294, 0, 1, 1,
0.6243891, 1.448191, 0.02421933, 0.427451, 0, 1, 1,
0.6326357, 0.8351583, 0.194654, 0.4352941, 0, 1, 1,
0.6346025, -0.7230928, 2.305818, 0.4392157, 0, 1, 1,
0.6433581, -0.6102486, 2.187969, 0.4470588, 0, 1, 1,
0.6435818, 0.1028593, 0.1512656, 0.4509804, 0, 1, 1,
0.647058, 0.8119982, -1.491268, 0.4588235, 0, 1, 1,
0.6510863, -0.3704672, 1.115124, 0.4627451, 0, 1, 1,
0.6551413, -0.3130774, 0.9120963, 0.4705882, 0, 1, 1,
0.6579749, -1.107791, 2.649045, 0.4745098, 0, 1, 1,
0.6606505, 0.800821, 2.448895, 0.4823529, 0, 1, 1,
0.6621107, 0.8183405, 2.144052, 0.4862745, 0, 1, 1,
0.6622896, 0.2342877, 2.813929, 0.4941176, 0, 1, 1,
0.6650768, 0.8229865, 0.3438172, 0.5019608, 0, 1, 1,
0.6677792, 0.3511718, 1.710701, 0.5058824, 0, 1, 1,
0.6713431, -0.00326853, 0.4542485, 0.5137255, 0, 1, 1,
0.6756861, -1.396295, 3.087079, 0.5176471, 0, 1, 1,
0.6779882, 0.4574555, 1.388592, 0.5254902, 0, 1, 1,
0.679591, 0.8874046, 0.4621861, 0.5294118, 0, 1, 1,
0.6807712, -0.4905488, 2.858679, 0.5372549, 0, 1, 1,
0.6860406, 0.4248258, 1.137987, 0.5411765, 0, 1, 1,
0.6862156, -1.716123, 2.283693, 0.5490196, 0, 1, 1,
0.6868705, 0.3146467, 1.472016, 0.5529412, 0, 1, 1,
0.6901462, -0.5997036, 0.4264935, 0.5607843, 0, 1, 1,
0.7028813, 1.16443, 0.5714402, 0.5647059, 0, 1, 1,
0.7037044, -0.8320068, 2.081055, 0.572549, 0, 1, 1,
0.7040675, -1.815087, 3.310823, 0.5764706, 0, 1, 1,
0.7103322, -0.8677111, 2.652655, 0.5843138, 0, 1, 1,
0.7116784, 0.3420264, 1.911474, 0.5882353, 0, 1, 1,
0.7131578, 0.7890825, 1.580868, 0.5960785, 0, 1, 1,
0.7137558, 1.4455, 2.1298, 0.6039216, 0, 1, 1,
0.7344537, -0.923956, 2.807143, 0.6078432, 0, 1, 1,
0.7408453, 0.2287857, 1.10726, 0.6156863, 0, 1, 1,
0.7433192, 1.63475, 1.603849, 0.6196079, 0, 1, 1,
0.7461398, 0.09794344, 1.090226, 0.627451, 0, 1, 1,
0.7487567, -1.01583, 2.974065, 0.6313726, 0, 1, 1,
0.7488065, 0.05630872, 0.794684, 0.6392157, 0, 1, 1,
0.761095, 0.8058836, 1.605588, 0.6431373, 0, 1, 1,
0.7649434, -0.48371, 3.08381, 0.6509804, 0, 1, 1,
0.7672583, 1.069131, 0.2071542, 0.654902, 0, 1, 1,
0.7676237, 0.6888253, 1.167197, 0.6627451, 0, 1, 1,
0.7699468, 1.379138, 0.8643291, 0.6666667, 0, 1, 1,
0.772652, -0.003752826, 0.4510647, 0.6745098, 0, 1, 1,
0.7736248, -0.7775672, 2.193368, 0.6784314, 0, 1, 1,
0.7739061, -1.278466, 2.238673, 0.6862745, 0, 1, 1,
0.7797791, 2.671908, -1.464693, 0.6901961, 0, 1, 1,
0.7837097, 1.408246, 2.312128, 0.6980392, 0, 1, 1,
0.7939424, -0.3153839, 2.185024, 0.7058824, 0, 1, 1,
0.7972395, -0.599063, 2.579991, 0.7098039, 0, 1, 1,
0.8026174, -0.8344882, 3.311459, 0.7176471, 0, 1, 1,
0.8040309, 0.6679637, 1.223773, 0.7215686, 0, 1, 1,
0.8070832, -0.5749413, 3.984706, 0.7294118, 0, 1, 1,
0.8079405, 1.122862, 2.0206, 0.7333333, 0, 1, 1,
0.8083261, -0.8916914, 3.196933, 0.7411765, 0, 1, 1,
0.815205, 2.204654, 1.685327, 0.7450981, 0, 1, 1,
0.8161492, -0.3749849, 1.848408, 0.7529412, 0, 1, 1,
0.8212118, 0.6150771, 0.9312327, 0.7568628, 0, 1, 1,
0.821655, 0.7832072, 0.261106, 0.7647059, 0, 1, 1,
0.8237365, -0.9499893, 1.909634, 0.7686275, 0, 1, 1,
0.8269842, -0.1271646, -0.2921422, 0.7764706, 0, 1, 1,
0.8290474, 1.020298, 0.3593202, 0.7803922, 0, 1, 1,
0.8323392, 0.4028275, 0.7919557, 0.7882353, 0, 1, 1,
0.8336042, -1.181024, 1.673947, 0.7921569, 0, 1, 1,
0.8343552, 0.2842401, 2.304013, 0.8, 0, 1, 1,
0.8350243, 0.8027893, -0.157139, 0.8078431, 0, 1, 1,
0.8364308, 1.8896, -1.568954, 0.8117647, 0, 1, 1,
0.84092, 0.8850577, 0.5154887, 0.8196079, 0, 1, 1,
0.8427311, -1.336906, 1.684025, 0.8235294, 0, 1, 1,
0.8510164, 0.6671397, 1.274277, 0.8313726, 0, 1, 1,
0.8643596, 0.3979244, 2.849916, 0.8352941, 0, 1, 1,
0.8674678, 1.743642, 0.3995093, 0.8431373, 0, 1, 1,
0.8686854, -0.4652499, 2.177794, 0.8470588, 0, 1, 1,
0.8690187, 0.005487112, 1.924121, 0.854902, 0, 1, 1,
0.8895925, 0.7224712, 1.637105, 0.8588235, 0, 1, 1,
0.8902228, -0.755743, 2.181309, 0.8666667, 0, 1, 1,
0.9031361, -0.4517639, 1.960814, 0.8705882, 0, 1, 1,
0.9116741, 0.5496703, 1.494188, 0.8784314, 0, 1, 1,
0.9151784, 0.4897123, 0.2509879, 0.8823529, 0, 1, 1,
0.9181716, 0.4256473, -0.6177602, 0.8901961, 0, 1, 1,
0.9185333, -1.075904, 1.334959, 0.8941177, 0, 1, 1,
0.933467, -1.886914, 3.809573, 0.9019608, 0, 1, 1,
0.936922, 0.8161839, -0.4093456, 0.9098039, 0, 1, 1,
0.9394194, -1.101469, 2.178893, 0.9137255, 0, 1, 1,
0.9525316, -0.2019012, 2.814478, 0.9215686, 0, 1, 1,
0.9548036, -0.5774782, 1.028085, 0.9254902, 0, 1, 1,
0.955608, 2.014459, 0.4531385, 0.9333333, 0, 1, 1,
0.9630741, -0.4613138, 3.735187, 0.9372549, 0, 1, 1,
0.9734285, 0.1415873, -0.01334919, 0.945098, 0, 1, 1,
0.9781054, -0.4514646, 1.162569, 0.9490196, 0, 1, 1,
0.9808918, 0.2696453, 0.3400624, 0.9568627, 0, 1, 1,
0.9828786, 0.3608873, 2.543765, 0.9607843, 0, 1, 1,
0.9855694, -1.211039, 1.143263, 0.9686275, 0, 1, 1,
0.9873576, 0.6968858, 2.16229, 0.972549, 0, 1, 1,
0.9890428, 0.5924131, 0.7405229, 0.9803922, 0, 1, 1,
0.9906883, 1.057145, 2.977429, 0.9843137, 0, 1, 1,
0.9953575, -0.9800877, 2.389327, 0.9921569, 0, 1, 1,
0.9953789, -0.180046, 1.838199, 0.9960784, 0, 1, 1,
1.000612, 0.9153133, 1.235507, 1, 0, 0.9960784, 1,
1.002409, -0.1015293, 2.629101, 1, 0, 0.9882353, 1,
1.002645, 0.5206978, -0.7686224, 1, 0, 0.9843137, 1,
1.005056, 0.4328303, 0.973864, 1, 0, 0.9764706, 1,
1.006657, 0.4051798, 0.4367732, 1, 0, 0.972549, 1,
1.009781, 0.8844798, 3.081577, 1, 0, 0.9647059, 1,
1.010816, 0.9282566, 1.57783, 1, 0, 0.9607843, 1,
1.032671, -0.4211587, 2.496647, 1, 0, 0.9529412, 1,
1.035354, 0.7441688, 1.264271, 1, 0, 0.9490196, 1,
1.036243, -0.2835161, 1.533601, 1, 0, 0.9411765, 1,
1.036732, 0.1596398, 1.763935, 1, 0, 0.9372549, 1,
1.0417, 0.8770247, -0.4820153, 1, 0, 0.9294118, 1,
1.046171, -1.608331, 3.341843, 1, 0, 0.9254902, 1,
1.067409, 1.728336, 1.614642, 1, 0, 0.9176471, 1,
1.068565, 0.9050856, 0.9013769, 1, 0, 0.9137255, 1,
1.072189, -0.9396826, 2.613264, 1, 0, 0.9058824, 1,
1.07322, -0.3222383, 2.295093, 1, 0, 0.9019608, 1,
1.089019, -1.490704, 2.186394, 1, 0, 0.8941177, 1,
1.098331, -0.07010853, 1.317897, 1, 0, 0.8862745, 1,
1.110549, -0.6575911, 0.7630107, 1, 0, 0.8823529, 1,
1.112019, 0.2945296, 0.8218672, 1, 0, 0.8745098, 1,
1.113923, 0.4763517, 3.049993, 1, 0, 0.8705882, 1,
1.115401, -1.009294, 2.898932, 1, 0, 0.8627451, 1,
1.119741, 1.030364, 1.94525, 1, 0, 0.8588235, 1,
1.120563, -1.618094, 1.127354, 1, 0, 0.8509804, 1,
1.128612, -1.41822, 1.779121, 1, 0, 0.8470588, 1,
1.136815, -1.452987, 4.571051, 1, 0, 0.8392157, 1,
1.145401, -0.4473614, 2.320702, 1, 0, 0.8352941, 1,
1.145536, -1.277817, 3.789622, 1, 0, 0.827451, 1,
1.146666, -0.2524162, 1.232837, 1, 0, 0.8235294, 1,
1.149791, 1.137866, 0.5291299, 1, 0, 0.8156863, 1,
1.151737, -0.8871024, 1.473474, 1, 0, 0.8117647, 1,
1.152627, -0.4300987, 3.400756, 1, 0, 0.8039216, 1,
1.153488, 1.375194, 0.571626, 1, 0, 0.7960784, 1,
1.154521, -0.5930051, 1.422437, 1, 0, 0.7921569, 1,
1.155218, -0.3621491, 1.389234, 1, 0, 0.7843137, 1,
1.159159, -0.3383316, 1.921158, 1, 0, 0.7803922, 1,
1.160658, -0.9820254, 0.7128917, 1, 0, 0.772549, 1,
1.163567, 0.5434262, 2.127884, 1, 0, 0.7686275, 1,
1.17129, -1.382691, 3.549023, 1, 0, 0.7607843, 1,
1.173576, -1.051419, 0.9827662, 1, 0, 0.7568628, 1,
1.176831, -1.444934, 2.396835, 1, 0, 0.7490196, 1,
1.177454, -0.02708286, 0.5581543, 1, 0, 0.7450981, 1,
1.186211, -0.6071557, 1.977622, 1, 0, 0.7372549, 1,
1.190602, 0.6559625, 3.314465, 1, 0, 0.7333333, 1,
1.194641, 0.02266474, 1.251505, 1, 0, 0.7254902, 1,
1.195629, -0.2962697, 1.885581, 1, 0, 0.7215686, 1,
1.198987, -0.6705885, 3.18486, 1, 0, 0.7137255, 1,
1.200151, -0.3450386, 1.602721, 1, 0, 0.7098039, 1,
1.201959, -1.107957, 2.253516, 1, 0, 0.7019608, 1,
1.212838, 1.296393, 1.466458, 1, 0, 0.6941177, 1,
1.214818, 0.8423454, 0.1543728, 1, 0, 0.6901961, 1,
1.217681, 1.500596, 1.718803, 1, 0, 0.682353, 1,
1.219025, 1.257625, 1.778844, 1, 0, 0.6784314, 1,
1.224751, -0.2254772, 4.071325, 1, 0, 0.6705883, 1,
1.227275, -0.5708374, 2.900692, 1, 0, 0.6666667, 1,
1.238693, -0.3282253, 0.2996842, 1, 0, 0.6588235, 1,
1.242899, -1.153348, 3.242957, 1, 0, 0.654902, 1,
1.244362, -0.2148272, 0.5770994, 1, 0, 0.6470588, 1,
1.245746, 1.010198, -0.3906914, 1, 0, 0.6431373, 1,
1.245894, 1.472499, 1.366956, 1, 0, 0.6352941, 1,
1.251804, 0.9132324, 1.365441, 1, 0, 0.6313726, 1,
1.259091, -1.052284, 3.87157, 1, 0, 0.6235294, 1,
1.26612, 1.391742, 0.7790256, 1, 0, 0.6196079, 1,
1.27764, -0.7875552, 3.1101, 1, 0, 0.6117647, 1,
1.284425, 0.1138007, 1.82849, 1, 0, 0.6078432, 1,
1.286723, 0.2652391, 2.720461, 1, 0, 0.6, 1,
1.288371, 0.9905385, 1.134565, 1, 0, 0.5921569, 1,
1.293645, -0.287179, 1.824337, 1, 0, 0.5882353, 1,
1.295895, 0.03825768, 1.595824, 1, 0, 0.5803922, 1,
1.302484, -1.41193, 2.806348, 1, 0, 0.5764706, 1,
1.311314, 0.3688571, 2.607633, 1, 0, 0.5686275, 1,
1.326603, -0.1791309, 0.4039776, 1, 0, 0.5647059, 1,
1.342817, 0.2799308, 1.563278, 1, 0, 0.5568628, 1,
1.346895, -0.2333707, 3.043211, 1, 0, 0.5529412, 1,
1.348169, -0.3251573, 2.239593, 1, 0, 0.5450981, 1,
1.361593, 0.5409282, -0.2157902, 1, 0, 0.5411765, 1,
1.381582, 0.07146503, 0.6901038, 1, 0, 0.5333334, 1,
1.382303, 0.6054495, 1.324226, 1, 0, 0.5294118, 1,
1.390978, 0.03307399, 2.058368, 1, 0, 0.5215687, 1,
1.400164, -0.4195735, 2.677651, 1, 0, 0.5176471, 1,
1.413485, -0.5215899, 1.268295, 1, 0, 0.509804, 1,
1.413954, 0.1036064, 0.3343876, 1, 0, 0.5058824, 1,
1.415408, 0.4803554, 0.04643862, 1, 0, 0.4980392, 1,
1.434146, 0.2295693, 2.801747, 1, 0, 0.4901961, 1,
1.434714, 0.27584, -0.2063405, 1, 0, 0.4862745, 1,
1.437158, -0.4693011, 2.638731, 1, 0, 0.4784314, 1,
1.439571, -0.2849776, 2.328117, 1, 0, 0.4745098, 1,
1.443368, 0.2661385, 0.3677107, 1, 0, 0.4666667, 1,
1.448005, 0.841418, 2.099074, 1, 0, 0.4627451, 1,
1.449619, -0.3909988, 3.323143, 1, 0, 0.454902, 1,
1.453964, 0.06916171, 0.9598844, 1, 0, 0.4509804, 1,
1.459523, 1.612999, 1.235014, 1, 0, 0.4431373, 1,
1.461646, 1.088329, 0.6177863, 1, 0, 0.4392157, 1,
1.463151, 0.556608, -0.1215408, 1, 0, 0.4313726, 1,
1.484095, 0.1958027, 1.801528, 1, 0, 0.427451, 1,
1.514232, 0.05838861, 1.243237, 1, 0, 0.4196078, 1,
1.519293, 0.7440603, -0.02848005, 1, 0, 0.4156863, 1,
1.524535, 0.716677, 0.07547296, 1, 0, 0.4078431, 1,
1.545896, 0.08458141, 1.467348, 1, 0, 0.4039216, 1,
1.550446, -0.3376817, -0.02662106, 1, 0, 0.3960784, 1,
1.553704, 0.3180609, 1.846004, 1, 0, 0.3882353, 1,
1.55526, -0.4977283, 1.430609, 1, 0, 0.3843137, 1,
1.557977, -1.522289, 1.704004, 1, 0, 0.3764706, 1,
1.571349, -1.34057, 1.430065, 1, 0, 0.372549, 1,
1.57731, -0.02651036, 2.544509, 1, 0, 0.3647059, 1,
1.588022, 0.9248027, 0.8062894, 1, 0, 0.3607843, 1,
1.597164, -1.474691, 1.689352, 1, 0, 0.3529412, 1,
1.602379, -0.8680342, 2.552614, 1, 0, 0.3490196, 1,
1.612358, 0.06005786, 0.1920103, 1, 0, 0.3411765, 1,
1.623101, 2.073988, -1.150492, 1, 0, 0.3372549, 1,
1.625687, -0.3730141, 1.432844, 1, 0, 0.3294118, 1,
1.632606, -0.1509288, 3.766877, 1, 0, 0.3254902, 1,
1.633637, -0.5293876, 1.669869, 1, 0, 0.3176471, 1,
1.646996, -2.145676, 2.972944, 1, 0, 0.3137255, 1,
1.654351, -0.847474, 2.843169, 1, 0, 0.3058824, 1,
1.660304, -0.1096459, 0.7512039, 1, 0, 0.2980392, 1,
1.676418, -0.003825354, 1.981721, 1, 0, 0.2941177, 1,
1.688205, -1.649515, 2.982827, 1, 0, 0.2862745, 1,
1.707664, 0.3836636, 1.184137, 1, 0, 0.282353, 1,
1.710808, -0.6880228, 1.644406, 1, 0, 0.2745098, 1,
1.719731, -0.2629608, 1.346114, 1, 0, 0.2705882, 1,
1.736589, -0.3441581, 0.7964574, 1, 0, 0.2627451, 1,
1.740034, 0.6212593, 1.298552, 1, 0, 0.2588235, 1,
1.770602, -0.03979649, 1.431741, 1, 0, 0.2509804, 1,
1.774714, 0.5163641, 2.146594, 1, 0, 0.2470588, 1,
1.781277, -1.692476, 2.220345, 1, 0, 0.2392157, 1,
1.78278, 0.03238355, 2.219289, 1, 0, 0.2352941, 1,
1.808539, 0.3888258, 3.569844, 1, 0, 0.227451, 1,
1.809186, 0.5095835, 1.043431, 1, 0, 0.2235294, 1,
1.817485, 0.9213659, 1.072061, 1, 0, 0.2156863, 1,
1.8247, 0.1937456, 1.074774, 1, 0, 0.2117647, 1,
1.827546, -2.123292, 2.557463, 1, 0, 0.2039216, 1,
1.840002, -0.07519407, 1.356846, 1, 0, 0.1960784, 1,
1.876821, 1.217191, -0.0627805, 1, 0, 0.1921569, 1,
1.880499, -0.5001217, 2.003568, 1, 0, 0.1843137, 1,
1.886889, 1.260047, 0.6843576, 1, 0, 0.1803922, 1,
1.887894, -0.1540552, 0.9007343, 1, 0, 0.172549, 1,
1.89231, 1.77554, -0.4126017, 1, 0, 0.1686275, 1,
1.894649, 1.488505, 0.8456241, 1, 0, 0.1607843, 1,
1.896663, -1.441406, 2.536885, 1, 0, 0.1568628, 1,
1.899177, -1.826972, 2.697346, 1, 0, 0.1490196, 1,
1.907634, -0.4809969, 2.396381, 1, 0, 0.145098, 1,
1.939074, 0.04539969, 0.05348044, 1, 0, 0.1372549, 1,
1.939892, 0.04892541, 1.00197, 1, 0, 0.1333333, 1,
1.964568, -0.08616855, 1.056867, 1, 0, 0.1254902, 1,
2.004457, 1.528213, 1.979254, 1, 0, 0.1215686, 1,
2.013111, 1.116347, 2.30346, 1, 0, 0.1137255, 1,
2.026075, -0.8908805, 2.411363, 1, 0, 0.1098039, 1,
2.057264, -0.8368171, 2.278701, 1, 0, 0.1019608, 1,
2.10422, 1.391596, 2.608402, 1, 0, 0.09411765, 1,
2.121743, -1.60602, 2.304005, 1, 0, 0.09019608, 1,
2.140939, -1.381706, 1.401873, 1, 0, 0.08235294, 1,
2.154413, 0.1279756, 1.571565, 1, 0, 0.07843138, 1,
2.17736, -0.09888979, 0.2645273, 1, 0, 0.07058824, 1,
2.207943, 1.31043, 3.318663, 1, 0, 0.06666667, 1,
2.254814, -0.05810328, 2.127543, 1, 0, 0.05882353, 1,
2.31688, -0.5156069, 1.260435, 1, 0, 0.05490196, 1,
2.376342, 1.140091, -0.9705738, 1, 0, 0.04705882, 1,
2.382838, -0.9965312, 2.998194, 1, 0, 0.04313726, 1,
2.396132, -0.923663, 1.895629, 1, 0, 0.03529412, 1,
2.416541, 0.1734085, 1.201186, 1, 0, 0.03137255, 1,
2.421995, 0.2430963, 0.7239065, 1, 0, 0.02352941, 1,
2.441675, 2.210632, -0.5282884, 1, 0, 0.01960784, 1,
2.451167, 0.5733859, 1.958314, 1, 0, 0.01176471, 1,
2.491798, 1.908239, -1.17288, 1, 0, 0.007843138, 1
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
-0.3159158, -4.453872, -7.000414, 0, -0.5, 0.5, 0.5,
-0.3159158, -4.453872, -7.000414, 1, -0.5, 0.5, 0.5,
-0.3159158, -4.453872, -7.000414, 1, 1.5, 0.5, 0.5,
-0.3159158, -4.453872, -7.000414, 0, 1.5, 0.5, 0.5
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
-4.075445, -0.1016092, -7.000414, 0, -0.5, 0.5, 0.5,
-4.075445, -0.1016092, -7.000414, 1, -0.5, 0.5, 0.5,
-4.075445, -0.1016092, -7.000414, 1, 1.5, 0.5, 0.5,
-4.075445, -0.1016092, -7.000414, 0, 1.5, 0.5, 0.5
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
-4.075445, -4.453872, -0.2126684, 0, -0.5, 0.5, 0.5,
-4.075445, -4.453872, -0.2126684, 1, -0.5, 0.5, 0.5,
-4.075445, -4.453872, -0.2126684, 1, 1.5, 0.5, 0.5,
-4.075445, -4.453872, -0.2126684, 0, 1.5, 0.5, 0.5
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
-3, -3.449503, -5.434011,
2, -3.449503, -5.434011,
-3, -3.449503, -5.434011,
-3, -3.616898, -5.695078,
-2, -3.449503, -5.434011,
-2, -3.616898, -5.695078,
-1, -3.449503, -5.434011,
-1, -3.616898, -5.695078,
0, -3.449503, -5.434011,
0, -3.616898, -5.695078,
1, -3.449503, -5.434011,
1, -3.616898, -5.695078,
2, -3.449503, -5.434011,
2, -3.616898, -5.695078
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
-3, -3.951688, -6.217213, 0, -0.5, 0.5, 0.5,
-3, -3.951688, -6.217213, 1, -0.5, 0.5, 0.5,
-3, -3.951688, -6.217213, 1, 1.5, 0.5, 0.5,
-3, -3.951688, -6.217213, 0, 1.5, 0.5, 0.5,
-2, -3.951688, -6.217213, 0, -0.5, 0.5, 0.5,
-2, -3.951688, -6.217213, 1, -0.5, 0.5, 0.5,
-2, -3.951688, -6.217213, 1, 1.5, 0.5, 0.5,
-2, -3.951688, -6.217213, 0, 1.5, 0.5, 0.5,
-1, -3.951688, -6.217213, 0, -0.5, 0.5, 0.5,
-1, -3.951688, -6.217213, 1, -0.5, 0.5, 0.5,
-1, -3.951688, -6.217213, 1, 1.5, 0.5, 0.5,
-1, -3.951688, -6.217213, 0, 1.5, 0.5, 0.5,
0, -3.951688, -6.217213, 0, -0.5, 0.5, 0.5,
0, -3.951688, -6.217213, 1, -0.5, 0.5, 0.5,
0, -3.951688, -6.217213, 1, 1.5, 0.5, 0.5,
0, -3.951688, -6.217213, 0, 1.5, 0.5, 0.5,
1, -3.951688, -6.217213, 0, -0.5, 0.5, 0.5,
1, -3.951688, -6.217213, 1, -0.5, 0.5, 0.5,
1, -3.951688, -6.217213, 1, 1.5, 0.5, 0.5,
1, -3.951688, -6.217213, 0, 1.5, 0.5, 0.5,
2, -3.951688, -6.217213, 0, -0.5, 0.5, 0.5,
2, -3.951688, -6.217213, 1, -0.5, 0.5, 0.5,
2, -3.951688, -6.217213, 1, 1.5, 0.5, 0.5,
2, -3.951688, -6.217213, 0, 1.5, 0.5, 0.5
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
-3.207861, -3, -5.434011,
-3.207861, 3, -5.434011,
-3.207861, -3, -5.434011,
-3.352458, -3, -5.695078,
-3.207861, -2, -5.434011,
-3.352458, -2, -5.695078,
-3.207861, -1, -5.434011,
-3.352458, -1, -5.695078,
-3.207861, 0, -5.434011,
-3.352458, 0, -5.695078,
-3.207861, 1, -5.434011,
-3.352458, 1, -5.695078,
-3.207861, 2, -5.434011,
-3.352458, 2, -5.695078,
-3.207861, 3, -5.434011,
-3.352458, 3, -5.695078
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
-3.641653, -3, -6.217213, 0, -0.5, 0.5, 0.5,
-3.641653, -3, -6.217213, 1, -0.5, 0.5, 0.5,
-3.641653, -3, -6.217213, 1, 1.5, 0.5, 0.5,
-3.641653, -3, -6.217213, 0, 1.5, 0.5, 0.5,
-3.641653, -2, -6.217213, 0, -0.5, 0.5, 0.5,
-3.641653, -2, -6.217213, 1, -0.5, 0.5, 0.5,
-3.641653, -2, -6.217213, 1, 1.5, 0.5, 0.5,
-3.641653, -2, -6.217213, 0, 1.5, 0.5, 0.5,
-3.641653, -1, -6.217213, 0, -0.5, 0.5, 0.5,
-3.641653, -1, -6.217213, 1, -0.5, 0.5, 0.5,
-3.641653, -1, -6.217213, 1, 1.5, 0.5, 0.5,
-3.641653, -1, -6.217213, 0, 1.5, 0.5, 0.5,
-3.641653, 0, -6.217213, 0, -0.5, 0.5, 0.5,
-3.641653, 0, -6.217213, 1, -0.5, 0.5, 0.5,
-3.641653, 0, -6.217213, 1, 1.5, 0.5, 0.5,
-3.641653, 0, -6.217213, 0, 1.5, 0.5, 0.5,
-3.641653, 1, -6.217213, 0, -0.5, 0.5, 0.5,
-3.641653, 1, -6.217213, 1, -0.5, 0.5, 0.5,
-3.641653, 1, -6.217213, 1, 1.5, 0.5, 0.5,
-3.641653, 1, -6.217213, 0, 1.5, 0.5, 0.5,
-3.641653, 2, -6.217213, 0, -0.5, 0.5, 0.5,
-3.641653, 2, -6.217213, 1, -0.5, 0.5, 0.5,
-3.641653, 2, -6.217213, 1, 1.5, 0.5, 0.5,
-3.641653, 2, -6.217213, 0, 1.5, 0.5, 0.5,
-3.641653, 3, -6.217213, 0, -0.5, 0.5, 0.5,
-3.641653, 3, -6.217213, 1, -0.5, 0.5, 0.5,
-3.641653, 3, -6.217213, 1, 1.5, 0.5, 0.5,
-3.641653, 3, -6.217213, 0, 1.5, 0.5, 0.5
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
-3.207861, -3.449503, -4,
-3.207861, -3.449503, 4,
-3.207861, -3.449503, -4,
-3.352458, -3.616898, -4,
-3.207861, -3.449503, -2,
-3.352458, -3.616898, -2,
-3.207861, -3.449503, 0,
-3.352458, -3.616898, 0,
-3.207861, -3.449503, 2,
-3.352458, -3.616898, 2,
-3.207861, -3.449503, 4,
-3.352458, -3.616898, 4
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
-3.641653, -3.951688, -4, 0, -0.5, 0.5, 0.5,
-3.641653, -3.951688, -4, 1, -0.5, 0.5, 0.5,
-3.641653, -3.951688, -4, 1, 1.5, 0.5, 0.5,
-3.641653, -3.951688, -4, 0, 1.5, 0.5, 0.5,
-3.641653, -3.951688, -2, 0, -0.5, 0.5, 0.5,
-3.641653, -3.951688, -2, 1, -0.5, 0.5, 0.5,
-3.641653, -3.951688, -2, 1, 1.5, 0.5, 0.5,
-3.641653, -3.951688, -2, 0, 1.5, 0.5, 0.5,
-3.641653, -3.951688, 0, 0, -0.5, 0.5, 0.5,
-3.641653, -3.951688, 0, 1, -0.5, 0.5, 0.5,
-3.641653, -3.951688, 0, 1, 1.5, 0.5, 0.5,
-3.641653, -3.951688, 0, 0, 1.5, 0.5, 0.5,
-3.641653, -3.951688, 2, 0, -0.5, 0.5, 0.5,
-3.641653, -3.951688, 2, 1, -0.5, 0.5, 0.5,
-3.641653, -3.951688, 2, 1, 1.5, 0.5, 0.5,
-3.641653, -3.951688, 2, 0, 1.5, 0.5, 0.5,
-3.641653, -3.951688, 4, 0, -0.5, 0.5, 0.5,
-3.641653, -3.951688, 4, 1, -0.5, 0.5, 0.5,
-3.641653, -3.951688, 4, 1, 1.5, 0.5, 0.5,
-3.641653, -3.951688, 4, 0, 1.5, 0.5, 0.5
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
-3.207861, -3.449503, -5.434011,
-3.207861, 3.246285, -5.434011,
-3.207861, -3.449503, 5.008675,
-3.207861, 3.246285, 5.008675,
-3.207861, -3.449503, -5.434011,
-3.207861, -3.449503, 5.008675,
-3.207861, 3.246285, -5.434011,
-3.207861, 3.246285, 5.008675,
-3.207861, -3.449503, -5.434011,
2.576029, -3.449503, -5.434011,
-3.207861, -3.449503, 5.008675,
2.576029, -3.449503, 5.008675,
-3.207861, 3.246285, -5.434011,
2.576029, 3.246285, -5.434011,
-3.207861, 3.246285, 5.008675,
2.576029, 3.246285, 5.008675,
2.576029, -3.449503, -5.434011,
2.576029, 3.246285, -5.434011,
2.576029, -3.449503, 5.008675,
2.576029, 3.246285, 5.008675,
2.576029, -3.449503, -5.434011,
2.576029, -3.449503, 5.008675,
2.576029, 3.246285, -5.434011,
2.576029, 3.246285, 5.008675
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
var radius = 7.308645;
var distance = 32.51699;
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
mvMatrix.translate( 0.3159158, 0.1016092, 0.2126684 );
mvMatrix.scale( 1.366252, 1.180182, 0.7567258 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.51699);
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
pyridine_N-oxide<-read.table("pyridine_N-oxide.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-pyridine_N-oxide$V2
```

```
## Error in eval(expr, envir, enclos): object 'pyridine_N' not found
```

```r
y<-pyridine_N-oxide$V3
```

```
## Error in eval(expr, envir, enclos): object 'pyridine_N' not found
```

```r
z<-pyridine_N-oxide$V4
```

```
## Error in eval(expr, envir, enclos): object 'pyridine_N' not found
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
-3.12363, 0.8398039, 0.122698, 0, 0, 1, 1, 1,
-2.648355, 1.012583, -1.787793, 1, 0, 0, 1, 1,
-2.530346, 0.4684799, -0.8220354, 1, 0, 0, 1, 1,
-2.418622, -1.785893, -0.7327926, 1, 0, 0, 1, 1,
-2.356061, 0.2194423, -2.534112, 1, 0, 0, 1, 1,
-2.351324, 0.2898114, 0.2427072, 1, 0, 0, 1, 1,
-2.341964, -0.6098459, -1.948546, 0, 0, 0, 1, 1,
-2.325082, 0.7842469, -1.93155, 0, 0, 0, 1, 1,
-2.306613, -0.9767691, -2.410536, 0, 0, 0, 1, 1,
-2.241933, -1.458406, -1.506417, 0, 0, 0, 1, 1,
-2.185569, 0.1838969, -0.9527336, 0, 0, 0, 1, 1,
-2.136535, -0.05673551, -1.421589, 0, 0, 0, 1, 1,
-2.132724, 1.6756, -0.302395, 0, 0, 0, 1, 1,
-2.127485, 0.6716735, -1.128216, 1, 1, 1, 1, 1,
-2.112215, -0.2413297, -0.9921371, 1, 1, 1, 1, 1,
-2.055612, -0.4382112, -2.75487, 1, 1, 1, 1, 1,
-2.041781, 1.120033, -0.9615653, 1, 1, 1, 1, 1,
-2.039871, 0.8561326, -0.2477867, 1, 1, 1, 1, 1,
-1.99616, -0.06102381, -2.440186, 1, 1, 1, 1, 1,
-1.96226, 0.4358267, -2.249018, 1, 1, 1, 1, 1,
-1.958387, -0.5162384, -0.9162443, 1, 1, 1, 1, 1,
-1.936626, -0.9473771, -3.185807, 1, 1, 1, 1, 1,
-1.934554, 1.236466, -2.43278, 1, 1, 1, 1, 1,
-1.919549, 1.133472, -1.187589, 1, 1, 1, 1, 1,
-1.892679, 0.5433335, -2.63551, 1, 1, 1, 1, 1,
-1.889813, 0.7234659, -0.5524675, 1, 1, 1, 1, 1,
-1.802768, -0.0255919, -1.464844, 1, 1, 1, 1, 1,
-1.79995, -1.134612, -1.776494, 1, 1, 1, 1, 1,
-1.793621, 0.0274667, -0.9432099, 0, 0, 1, 1, 1,
-1.771189, 2.461256, -0.3982547, 1, 0, 0, 1, 1,
-1.768114, 1.10691, -0.6964877, 1, 0, 0, 1, 1,
-1.725751, -1.797433, -0.8495734, 1, 0, 0, 1, 1,
-1.710436, -0.1351415, -2.7932, 1, 0, 0, 1, 1,
-1.709823, 0.7584196, -0.5303288, 1, 0, 0, 1, 1,
-1.707509, -0.8624653, -2.639629, 0, 0, 0, 1, 1,
-1.680616, -1.697827, -3.003573, 0, 0, 0, 1, 1,
-1.678448, 0.3392642, -1.319171, 0, 0, 0, 1, 1,
-1.651761, -0.3113524, -1.16597, 0, 0, 0, 1, 1,
-1.650906, 1.792185, -1.420703, 0, 0, 0, 1, 1,
-1.647169, -0.6796998, -3.604985, 0, 0, 0, 1, 1,
-1.646844, -0.1172246, -2.99466, 0, 0, 0, 1, 1,
-1.643901, 0.6499858, -0.9498342, 1, 1, 1, 1, 1,
-1.624133, 0.6001657, -0.3860294, 1, 1, 1, 1, 1,
-1.616655, 0.07005331, -2.433963, 1, 1, 1, 1, 1,
-1.614822, -0.8998408, -2.479272, 1, 1, 1, 1, 1,
-1.605236, -0.1759679, -1.327872, 1, 1, 1, 1, 1,
-1.594911, 1.659373, -1.327058, 1, 1, 1, 1, 1,
-1.587784, -1.456447, -2.768092, 1, 1, 1, 1, 1,
-1.587629, 0.1523946, -1.173269, 1, 1, 1, 1, 1,
-1.586191, -1.353203, -1.895509, 1, 1, 1, 1, 1,
-1.582144, 0.01351756, -2.03628, 1, 1, 1, 1, 1,
-1.581978, -0.2060196, -4.149261, 1, 1, 1, 1, 1,
-1.581545, -1.540019, -4.174159, 1, 1, 1, 1, 1,
-1.57618, 2.319928, 0.4592599, 1, 1, 1, 1, 1,
-1.571722, -0.7286187, -2.533111, 1, 1, 1, 1, 1,
-1.558373, 1.820894, -0.6980213, 1, 1, 1, 1, 1,
-1.55439, -0.1679839, -2.007153, 0, 0, 1, 1, 1,
-1.511167, 0.4750342, -0.5066653, 1, 0, 0, 1, 1,
-1.494333, -1.218112, -1.446647, 1, 0, 0, 1, 1,
-1.491902, 0.211302, -0.3749323, 1, 0, 0, 1, 1,
-1.472484, -0.8835401, -4.465247, 1, 0, 0, 1, 1,
-1.441906, -1.218572, -1.629507, 1, 0, 0, 1, 1,
-1.434055, 0.6004179, -1.522101, 0, 0, 0, 1, 1,
-1.424021, 0.4772966, -2.022555, 0, 0, 0, 1, 1,
-1.421815, -1.844757, -0.517538, 0, 0, 0, 1, 1,
-1.418561, 1.140753, -0.8720754, 0, 0, 0, 1, 1,
-1.397678, 0.286365, -1.382177, 0, 0, 0, 1, 1,
-1.393918, -0.3276797, -2.364282, 0, 0, 0, 1, 1,
-1.389179, -0.02709136, -1.854518, 0, 0, 0, 1, 1,
-1.38775, -2.344162, -4.38201, 1, 1, 1, 1, 1,
-1.385698, -0.7546966, -2.616524, 1, 1, 1, 1, 1,
-1.380742, -2.349532, -2.183942, 1, 1, 1, 1, 1,
-1.379994, -0.7962157, -3.557546, 1, 1, 1, 1, 1,
-1.37666, -0.0002836756, -2.236033, 1, 1, 1, 1, 1,
-1.372757, -1.528526, -2.613744, 1, 1, 1, 1, 1,
-1.367681, 0.02407909, -3.503592, 1, 1, 1, 1, 1,
-1.362783, 0.09994484, -2.306029, 1, 1, 1, 1, 1,
-1.359736, -1.24912, -2.086314, 1, 1, 1, 1, 1,
-1.345234, 0.1159479, -2.259389, 1, 1, 1, 1, 1,
-1.341652, 0.5836761, -0.558861, 1, 1, 1, 1, 1,
-1.341624, 1.190567, -0.4365103, 1, 1, 1, 1, 1,
-1.332278, -0.6226762, -1.1436, 1, 1, 1, 1, 1,
-1.319055, -1.993827, -4.242922, 1, 1, 1, 1, 1,
-1.317356, 1.20392, -2.589057, 1, 1, 1, 1, 1,
-1.309307, 0.4310509, -0.3469594, 0, 0, 1, 1, 1,
-1.309025, 0.1526963, -1.20835, 1, 0, 0, 1, 1,
-1.308267, 0.1898116, -1.907021, 1, 0, 0, 1, 1,
-1.299493, -0.8057755, -2.903375, 1, 0, 0, 1, 1,
-1.298613, 1.320691, 0.04431703, 1, 0, 0, 1, 1,
-1.298351, -1.430196, -2.056229, 1, 0, 0, 1, 1,
-1.297804, -0.2281334, -2.527835, 0, 0, 0, 1, 1,
-1.295616, -0.7887711, -2.184855, 0, 0, 0, 1, 1,
-1.295289, -0.2322373, -2.400976, 0, 0, 0, 1, 1,
-1.293857, 0.1818948, -3.711083, 0, 0, 0, 1, 1,
-1.290158, 0.6178452, -1.137993, 0, 0, 0, 1, 1,
-1.289845, -0.2663814, -1.286244, 0, 0, 0, 1, 1,
-1.277784, -0.5922712, -2.031826, 0, 0, 0, 1, 1,
-1.273155, 1.74741, 0.4689138, 1, 1, 1, 1, 1,
-1.270782, 0.9256993, -0.6901976, 1, 1, 1, 1, 1,
-1.267368, 0.6058779, -0.159219, 1, 1, 1, 1, 1,
-1.266075, -0.22059, -2.76799, 1, 1, 1, 1, 1,
-1.258971, -0.7984722, -0.6771256, 1, 1, 1, 1, 1,
-1.255365, -0.3838666, -2.496583, 1, 1, 1, 1, 1,
-1.249548, -0.05052514, -3.151076, 1, 1, 1, 1, 1,
-1.240135, -0.7908477, -3.407056, 1, 1, 1, 1, 1,
-1.233719, -0.8351714, -2.331368, 1, 1, 1, 1, 1,
-1.233207, 0.8293013, -1.490311, 1, 1, 1, 1, 1,
-1.224274, 0.4428491, -0.3361005, 1, 1, 1, 1, 1,
-1.220722, -0.6444281, -4.493472, 1, 1, 1, 1, 1,
-1.20919, -0.7012845, -2.735815, 1, 1, 1, 1, 1,
-1.197251, 1.29428, -0.3977756, 1, 1, 1, 1, 1,
-1.196103, -1.711529, -4.556302, 1, 1, 1, 1, 1,
-1.194153, -1.4362, -1.895136, 0, 0, 1, 1, 1,
-1.1872, 0.1069085, -1.979843, 1, 0, 0, 1, 1,
-1.181109, -0.3427441, -1.063271, 1, 0, 0, 1, 1,
-1.171634, -0.1817945, -0.1499285, 1, 0, 0, 1, 1,
-1.167014, 0.4524688, -0.6892112, 1, 0, 0, 1, 1,
-1.153003, 1.023671, -2.00944, 1, 0, 0, 1, 1,
-1.152103, -0.9732729, -2.026546, 0, 0, 0, 1, 1,
-1.148056, -1.448476, -3.631494, 0, 0, 0, 1, 1,
-1.14674, 0.8742138, 1.228984, 0, 0, 0, 1, 1,
-1.139372, -0.02262364, -1.05346, 0, 0, 0, 1, 1,
-1.136808, 0.9803267, 0.09487201, 0, 0, 0, 1, 1,
-1.134664, 1.227309, -2.037405, 0, 0, 0, 1, 1,
-1.134005, 0.3477142, -1.745406, 0, 0, 0, 1, 1,
-1.133947, -1.038255, -3.241009, 1, 1, 1, 1, 1,
-1.126097, 0.05196065, -2.145482, 1, 1, 1, 1, 1,
-1.12164, -0.3457914, -2.060583, 1, 1, 1, 1, 1,
-1.120305, -0.05726417, -2.305293, 1, 1, 1, 1, 1,
-1.114089, 0.5224701, -0.9670588, 1, 1, 1, 1, 1,
-1.110699, 0.4206862, -3.296699, 1, 1, 1, 1, 1,
-1.103758, -0.8140076, -1.841989, 1, 1, 1, 1, 1,
-1.103276, 0.3460276, -1.313193, 1, 1, 1, 1, 1,
-1.100267, 0.5278728, -1.49438, 1, 1, 1, 1, 1,
-1.098951, 0.3337491, -1.523397, 1, 1, 1, 1, 1,
-1.093901, -0.1153789, -0.9553593, 1, 1, 1, 1, 1,
-1.091779, -1.432496, -3.353333, 1, 1, 1, 1, 1,
-1.090908, -0.108747, 0.1345501, 1, 1, 1, 1, 1,
-1.089322, -0.3540392, 0.2878197, 1, 1, 1, 1, 1,
-1.081131, 0.4304332, -1.452963, 1, 1, 1, 1, 1,
-1.07534, 1.125288, -0.5492405, 0, 0, 1, 1, 1,
-1.073243, 1.933298, 0.5888795, 1, 0, 0, 1, 1,
-1.069566, 1.420033, -0.8413978, 1, 0, 0, 1, 1,
-1.062853, -0.1917361, -2.248853, 1, 0, 0, 1, 1,
-1.058935, 0.7120617, -0.6386262, 1, 0, 0, 1, 1,
-1.052932, 1.199878, 0.1944542, 1, 0, 0, 1, 1,
-1.042113, -0.3722574, -2.180285, 0, 0, 0, 1, 1,
-1.041559, 1.056779, -1.072841, 0, 0, 0, 1, 1,
-1.04013, 0.1703634, -3.669459, 0, 0, 0, 1, 1,
-1.034595, -0.6717891, -3.374539, 0, 0, 0, 1, 1,
-1.028618, -0.9611774, -0.4720377, 0, 0, 0, 1, 1,
-1.025123, -3.009431, -2.491385, 0, 0, 0, 1, 1,
-1.024501, -2.237751, -2.247672, 0, 0, 0, 1, 1,
-1.022779, -1.121526, -0.8202862, 1, 1, 1, 1, 1,
-1.021232, 1.615934, -0.420854, 1, 1, 1, 1, 1,
-1.016581, -0.3036053, -3.626735, 1, 1, 1, 1, 1,
-1.01535, 1.098802, 0.06828614, 1, 1, 1, 1, 1,
-1.014301, 0.2748356, -1.449953, 1, 1, 1, 1, 1,
-1.014167, -1.042462, -1.347142, 1, 1, 1, 1, 1,
-1.013001, -0.8515997, -2.922094, 1, 1, 1, 1, 1,
-1.011311, 0.08231229, -2.280535, 1, 1, 1, 1, 1,
-0.9963632, -0.1797977, -1.212154, 1, 1, 1, 1, 1,
-0.9926541, 0.08187844, -1.206926, 1, 1, 1, 1, 1,
-0.9903467, -0.1785081, -1.71446, 1, 1, 1, 1, 1,
-0.9897662, -1.375731, -1.710378, 1, 1, 1, 1, 1,
-0.9833328, 0.3524913, -1.391421, 1, 1, 1, 1, 1,
-0.9800677, -0.4002087, -1.228725, 1, 1, 1, 1, 1,
-0.978784, 1.099884, -1.097242, 1, 1, 1, 1, 1,
-0.9751809, 0.9746935, -0.4378281, 0, 0, 1, 1, 1,
-0.9711593, -0.06921038, -1.196991, 1, 0, 0, 1, 1,
-0.9700698, -1.025969, -2.537739, 1, 0, 0, 1, 1,
-0.9658166, -0.4175546, -0.7660075, 1, 0, 0, 1, 1,
-0.9590327, -0.9395022, -3.057887, 1, 0, 0, 1, 1,
-0.9554405, 0.2528859, -0.06546463, 1, 0, 0, 1, 1,
-0.9498888, 0.2177572, -1.532492, 0, 0, 0, 1, 1,
-0.9471354, -0.8710864, -1.908981, 0, 0, 0, 1, 1,
-0.9439924, 0.6526719, -1.46104, 0, 0, 0, 1, 1,
-0.923647, -0.9946655, -2.561093, 0, 0, 0, 1, 1,
-0.9221736, -0.6381815, -2.208154, 0, 0, 0, 1, 1,
-0.9193766, -0.5604823, -2.291049, 0, 0, 0, 1, 1,
-0.9188876, 1.394087, -0.6710873, 0, 0, 0, 1, 1,
-0.9150512, 1.231178, -1.202464, 1, 1, 1, 1, 1,
-0.9080243, -0.2831151, -1.731112, 1, 1, 1, 1, 1,
-0.905679, 2.534168, -0.8774281, 1, 1, 1, 1, 1,
-0.8964149, -1.03841, -3.545179, 1, 1, 1, 1, 1,
-0.8919066, -0.6737607, -0.3967, 1, 1, 1, 1, 1,
-0.8888258, 1.059699, -2.928696, 1, 1, 1, 1, 1,
-0.8818254, -1.41089, -3.789383, 1, 1, 1, 1, 1,
-0.8811534, 0.4310261, -1.339666, 1, 1, 1, 1, 1,
-0.8753556, 1.312491, -0.5771379, 1, 1, 1, 1, 1,
-0.871902, -2.091627, -2.347744, 1, 1, 1, 1, 1,
-0.8697643, 1.153508, -0.9591147, 1, 1, 1, 1, 1,
-0.8691459, 3.148773, 1.21755, 1, 1, 1, 1, 1,
-0.8671555, -0.1032092, -1.338581, 1, 1, 1, 1, 1,
-0.8656694, -2.400158, -2.930709, 1, 1, 1, 1, 1,
-0.8560585, -0.6254032, -2.638804, 1, 1, 1, 1, 1,
-0.8527597, 1.142478, -1.227354, 0, 0, 1, 1, 1,
-0.8517129, 0.3205145, -1.208964, 1, 0, 0, 1, 1,
-0.8488125, 0.4126743, -0.4352426, 1, 0, 0, 1, 1,
-0.8478824, -1.307308, -2.838306, 1, 0, 0, 1, 1,
-0.83428, -0.8311731, -2.175189, 1, 0, 0, 1, 1,
-0.8327382, -0.3213479, -1.826559, 1, 0, 0, 1, 1,
-0.8314864, 1.417302, 1.799098, 0, 0, 0, 1, 1,
-0.8304514, 0.826, -0.6724142, 0, 0, 0, 1, 1,
-0.8295157, -0.3422238, -2.56212, 0, 0, 0, 1, 1,
-0.8253961, -0.1921181, -0.8652285, 0, 0, 0, 1, 1,
-0.8247687, -0.3533632, -2.151797, 0, 0, 0, 1, 1,
-0.821493, 0.03269117, -1.949372, 0, 0, 0, 1, 1,
-0.819329, 1.038851, -0.5464985, 0, 0, 0, 1, 1,
-0.8188004, 1.138885, -1.243806, 1, 1, 1, 1, 1,
-0.8129113, 0.9802039, -0.02334622, 1, 1, 1, 1, 1,
-0.8013647, -0.4507027, -0.8809516, 1, 1, 1, 1, 1,
-0.7993538, 1.394814, 1.195117, 1, 1, 1, 1, 1,
-0.7908425, -0.849568, -2.829618, 1, 1, 1, 1, 1,
-0.7906992, -1.070621, -2.552809, 1, 1, 1, 1, 1,
-0.7859449, -0.4997789, -2.806683, 1, 1, 1, 1, 1,
-0.7789532, -0.5007412, -2.278841, 1, 1, 1, 1, 1,
-0.7764102, -0.2248138, -2.971404, 1, 1, 1, 1, 1,
-0.7691916, -0.002466561, -2.036261, 1, 1, 1, 1, 1,
-0.7591267, -0.796811, -1.071336, 1, 1, 1, 1, 1,
-0.7504798, 0.4378256, -1.579028, 1, 1, 1, 1, 1,
-0.7466314, 0.280904, -0.1325191, 1, 1, 1, 1, 1,
-0.7442455, -0.1986835, -1.95413, 1, 1, 1, 1, 1,
-0.7428198, -0.5583913, -1.01812, 1, 1, 1, 1, 1,
-0.7400029, 0.3105249, -0.8969007, 0, 0, 1, 1, 1,
-0.7364145, -0.5185556, -1.185224, 1, 0, 0, 1, 1,
-0.7339136, 0.5667374, -0.2942032, 1, 0, 0, 1, 1,
-0.7317191, -1.05701, -2.098099, 1, 0, 0, 1, 1,
-0.7311789, -0.05554319, -3.534387, 1, 0, 0, 1, 1,
-0.7295635, -0.7270659, -1.588208, 1, 0, 0, 1, 1,
-0.7270072, 1.30284, -2.197286, 0, 0, 0, 1, 1,
-0.7256166, -0.3327123, -1.292865, 0, 0, 0, 1, 1,
-0.7240171, 0.4943987, -0.5827917, 0, 0, 0, 1, 1,
-0.7205562, -0.2491093, -0.866703, 0, 0, 0, 1, 1,
-0.7188874, 1.008462, -2.063585, 0, 0, 0, 1, 1,
-0.7161824, 1.247834, -0.9369571, 0, 0, 0, 1, 1,
-0.7157305, -0.9494066, -2.343077, 0, 0, 0, 1, 1,
-0.7121591, 0.006994196, -3.382147, 1, 1, 1, 1, 1,
-0.708748, 1.024384, -2.543029, 1, 1, 1, 1, 1,
-0.7070732, -1.058061, -3.173015, 1, 1, 1, 1, 1,
-0.7042931, -0.8584173, -3.054566, 1, 1, 1, 1, 1,
-0.7025754, -2.825388, -3.135145, 1, 1, 1, 1, 1,
-0.7017254, -0.3147373, -3.789968, 1, 1, 1, 1, 1,
-0.7009863, -0.4717536, -1.52941, 1, 1, 1, 1, 1,
-0.6957807, -0.3991675, -0.2427505, 1, 1, 1, 1, 1,
-0.6931152, -0.5959854, -1.101116, 1, 1, 1, 1, 1,
-0.6872097, 0.3085909, -2.036471, 1, 1, 1, 1, 1,
-0.6868167, 0.03595915, -1.008656, 1, 1, 1, 1, 1,
-0.6835567, 0.6990879, -2.249752, 1, 1, 1, 1, 1,
-0.6835486, -0.1356862, -1.954169, 1, 1, 1, 1, 1,
-0.6828928, 0.4375583, -1.613469, 1, 1, 1, 1, 1,
-0.680156, 0.1113077, -1.370501, 1, 1, 1, 1, 1,
-0.6784292, 0.235863, -0.614345, 0, 0, 1, 1, 1,
-0.6765407, 0.01703945, -3.646299, 1, 0, 0, 1, 1,
-0.6744941, 0.7655004, -1.797304, 1, 0, 0, 1, 1,
-0.6731644, 0.7151958, -1.165305, 1, 0, 0, 1, 1,
-0.6696747, -0.9304647, -3.871975, 1, 0, 0, 1, 1,
-0.6689826, 0.3923205, -1.269013, 1, 0, 0, 1, 1,
-0.6676928, 0.2323953, -0.1730129, 0, 0, 0, 1, 1,
-0.6664889, 0.4420425, -0.09738147, 0, 0, 0, 1, 1,
-0.6663885, -0.1163113, -1.368449, 0, 0, 0, 1, 1,
-0.665578, 0.2211277, -1.488733, 0, 0, 0, 1, 1,
-0.6615752, 0.809165, -2.498798, 0, 0, 0, 1, 1,
-0.6613404, 1.285917, 1.722123, 0, 0, 0, 1, 1,
-0.6478655, 0.5597981, 0.1094632, 0, 0, 0, 1, 1,
-0.6439346, -0.6655365, -2.814828, 1, 1, 1, 1, 1,
-0.6433897, -0.03406789, -1.422604, 1, 1, 1, 1, 1,
-0.6402437, -0.301358, -1.29277, 1, 1, 1, 1, 1,
-0.6334033, -0.376025, -2.43941, 1, 1, 1, 1, 1,
-0.632763, -0.182095, -0.8053483, 1, 1, 1, 1, 1,
-0.6308932, 0.4119288, -2.541438, 1, 1, 1, 1, 1,
-0.6279641, -2.451352, -3.616942, 1, 1, 1, 1, 1,
-0.62172, -0.3579414, -2.281154, 1, 1, 1, 1, 1,
-0.6114885, -0.244904, -1.906036, 1, 1, 1, 1, 1,
-0.6100346, -1.587325, -3.420752, 1, 1, 1, 1, 1,
-0.6081639, -1.910841, -2.624579, 1, 1, 1, 1, 1,
-0.6043327, -0.5940205, -1.200197, 1, 1, 1, 1, 1,
-0.6042054, 0.5440564, -0.3756523, 1, 1, 1, 1, 1,
-0.602345, -1.212837, -2.763083, 1, 1, 1, 1, 1,
-0.6011991, -0.248544, -1.953703, 1, 1, 1, 1, 1,
-0.592161, 0.1743969, -0.08353075, 0, 0, 1, 1, 1,
-0.5864824, 0.1244072, -0.6971809, 1, 0, 0, 1, 1,
-0.5775698, 0.2947363, -0.9983031, 1, 0, 0, 1, 1,
-0.5768413, 0.2084487, 0.139881, 1, 0, 0, 1, 1,
-0.572047, 0.3597656, -0.6019716, 1, 0, 0, 1, 1,
-0.5680364, -1.719634, -4.104811, 1, 0, 0, 1, 1,
-0.5582538, 0.9164099, -0.3503379, 0, 0, 0, 1, 1,
-0.5566904, 1.464136, 0.863826, 0, 0, 0, 1, 1,
-0.5559572, 0.09216505, -0.7134255, 0, 0, 0, 1, 1,
-0.555797, 1.468644, 0.7902761, 0, 0, 0, 1, 1,
-0.5536377, -0.9556273, -1.335885, 0, 0, 0, 1, 1,
-0.5519217, 0.3589371, -0.9494463, 0, 0, 0, 1, 1,
-0.5497417, -0.4703217, -0.8395149, 0, 0, 0, 1, 1,
-0.5452201, 0.6865953, -0.6281056, 1, 1, 1, 1, 1,
-0.5381383, -0.03309542, -2.435986, 1, 1, 1, 1, 1,
-0.5361961, -1.469638, -1.372337, 1, 1, 1, 1, 1,
-0.5303097, -1.125797, -2.420618, 1, 1, 1, 1, 1,
-0.5302513, -0.1208147, -2.395004, 1, 1, 1, 1, 1,
-0.5283718, 0.6958097, 0.2812015, 1, 1, 1, 1, 1,
-0.5236687, -0.1686185, -1.6304, 1, 1, 1, 1, 1,
-0.5208574, 1.884798, 0.2819174, 1, 1, 1, 1, 1,
-0.5188706, -0.4298724, -1.512321, 1, 1, 1, 1, 1,
-0.5142206, 0.1497505, 0.8985642, 1, 1, 1, 1, 1,
-0.5112873, 0.2246599, 0.01624757, 1, 1, 1, 1, 1,
-0.509776, -1.216583, -3.248281, 1, 1, 1, 1, 1,
-0.5085829, 0.4072827, -0.5316302, 1, 1, 1, 1, 1,
-0.5055831, -0.0468006, -3.051709, 1, 1, 1, 1, 1,
-0.5044956, 0.173222, -2.163593, 1, 1, 1, 1, 1,
-0.5038974, 2.081917, -1.335341, 0, 0, 1, 1, 1,
-0.4994934, 1.613911, -1.257149, 1, 0, 0, 1, 1,
-0.4982696, -0.7219418, -3.545106, 1, 0, 0, 1, 1,
-0.4960423, 2.15868, 1.306793, 1, 0, 0, 1, 1,
-0.4953522, 0.4877931, -2.131757, 1, 0, 0, 1, 1,
-0.495122, -1.364522, -3.272589, 1, 0, 0, 1, 1,
-0.494725, 1.372412, -0.7313889, 0, 0, 0, 1, 1,
-0.4841728, -0.2055395, -1.930986, 0, 0, 0, 1, 1,
-0.4831506, 0.03683234, -0.6636621, 0, 0, 0, 1, 1,
-0.4783036, -1.025503, -3.606448, 0, 0, 0, 1, 1,
-0.4662246, 0.1319616, 0.08672738, 0, 0, 0, 1, 1,
-0.4656552, -0.250553, -3.26324, 0, 0, 0, 1, 1,
-0.4644953, -0.2195509, 0.5266075, 0, 0, 0, 1, 1,
-0.4642152, 1.421396, -0.1149382, 1, 1, 1, 1, 1,
-0.4636672, 1.297115, 1.285798, 1, 1, 1, 1, 1,
-0.456035, -1.92302, -2.435194, 1, 1, 1, 1, 1,
-0.4527664, -1.28741, -2.198918, 1, 1, 1, 1, 1,
-0.4518371, 0.8682205, 0.5946068, 1, 1, 1, 1, 1,
-0.4476738, -0.9726021, -3.397978, 1, 1, 1, 1, 1,
-0.4446836, -1.401244, -1.244129, 1, 1, 1, 1, 1,
-0.4440143, 0.9758074, 0.003279651, 1, 1, 1, 1, 1,
-0.4422757, 0.4707781, -1.620094, 1, 1, 1, 1, 1,
-0.4382989, -1.207584, -2.408686, 1, 1, 1, 1, 1,
-0.4382436, 1.061961, 1.461493, 1, 1, 1, 1, 1,
-0.4352058, -0.9254727, -3.525283, 1, 1, 1, 1, 1,
-0.4317084, -1.09895, -3.723856, 1, 1, 1, 1, 1,
-0.4307936, -0.05781273, -2.258959, 1, 1, 1, 1, 1,
-0.4272699, 1.01848, -1.598608, 1, 1, 1, 1, 1,
-0.4268868, -0.03153704, -2.138235, 0, 0, 1, 1, 1,
-0.4208964, -1.571919, -4.182001, 1, 0, 0, 1, 1,
-0.4172048, -0.04454024, -1.608341, 1, 0, 0, 1, 1,
-0.4126623, -1.117073, -5.122022, 1, 0, 0, 1, 1,
-0.4122452, 1.237948, 0.9682547, 1, 0, 0, 1, 1,
-0.4119917, 1.025104, -0.7399672, 1, 0, 0, 1, 1,
-0.4085242, 0.2437909, -0.6100174, 0, 0, 0, 1, 1,
-0.4041011, -0.8407261, -4.793031, 0, 0, 0, 1, 1,
-0.4016297, -0.613595, -2.747329, 0, 0, 0, 1, 1,
-0.3935507, 1.529139, -0.09928104, 0, 0, 0, 1, 1,
-0.3911968, 0.1664013, -1.524907, 0, 0, 0, 1, 1,
-0.3901723, -0.9178978, -4.394132, 0, 0, 0, 1, 1,
-0.3884031, -2.250652, -2.848891, 0, 0, 0, 1, 1,
-0.386777, -0.5169689, -4.59442, 1, 1, 1, 1, 1,
-0.3797346, -0.216491, -1.093369, 1, 1, 1, 1, 1,
-0.3793783, -0.3340838, -1.23212, 1, 1, 1, 1, 1,
-0.3766921, -0.9959253, -3.827418, 1, 1, 1, 1, 1,
-0.3710223, -1.406042, -1.748866, 1, 1, 1, 1, 1,
-0.3680074, 0.9018432, -0.978098, 1, 1, 1, 1, 1,
-0.3646147, 1.206128, 0.8277543, 1, 1, 1, 1, 1,
-0.3555353, -1.362353, -4.694394, 1, 1, 1, 1, 1,
-0.3538803, 0.4463428, -2.011044, 1, 1, 1, 1, 1,
-0.3493803, 0.8933654, -0.2993464, 1, 1, 1, 1, 1,
-0.3486972, 0.03665351, -0.2876157, 1, 1, 1, 1, 1,
-0.3483709, -1.184156, -1.897778, 1, 1, 1, 1, 1,
-0.3479048, 1.297634, -0.03545512, 1, 1, 1, 1, 1,
-0.3473514, 2.25932, -0.5311942, 1, 1, 1, 1, 1,
-0.3439281, 0.008541576, -0.9011455, 1, 1, 1, 1, 1,
-0.3415767, -1.289871, -3.026051, 0, 0, 1, 1, 1,
-0.3382263, 1.371274, -0.4163593, 1, 0, 0, 1, 1,
-0.3374676, 0.2604475, -1.49522, 1, 0, 0, 1, 1,
-0.3341962, 2.118032, -0.4846028, 1, 0, 0, 1, 1,
-0.3288525, 2.236663, 0.41353, 1, 0, 0, 1, 1,
-0.3283077, -0.5252354, -0.7365885, 1, 0, 0, 1, 1,
-0.3276275, -0.6293827, -2.085819, 0, 0, 0, 1, 1,
-0.3256169, -1.582086, -1.911612, 0, 0, 0, 1, 1,
-0.3249055, 0.1001503, -1.818444, 0, 0, 0, 1, 1,
-0.3221556, 0.9540955, -1.403923, 0, 0, 0, 1, 1,
-0.3193517, 1.866284, 1.688051, 0, 0, 0, 1, 1,
-0.3189168, 0.2396532, -0.4454457, 0, 0, 0, 1, 1,
-0.3152719, 0.6133136, 0.5077187, 0, 0, 0, 1, 1,
-0.3126924, 1.302204, -0.6167088, 1, 1, 1, 1, 1,
-0.2959689, -0.2760414, -3.829266, 1, 1, 1, 1, 1,
-0.294199, -1.171606, -0.9871483, 1, 1, 1, 1, 1,
-0.2893878, 0.0381196, -1.843031, 1, 1, 1, 1, 1,
-0.2877671, 0.3452896, -2.554941, 1, 1, 1, 1, 1,
-0.2845751, 0.8686301, 2.998611, 1, 1, 1, 1, 1,
-0.2774451, -0.9359492, -2.926122, 1, 1, 1, 1, 1,
-0.277087, 0.6392283, -1.698452, 1, 1, 1, 1, 1,
-0.2753855, 0.1361551, -0.7810526, 1, 1, 1, 1, 1,
-0.2749049, 0.6773612, -0.04152241, 1, 1, 1, 1, 1,
-0.2729543, 0.01590374, -3.103, 1, 1, 1, 1, 1,
-0.2682009, 1.078773, 0.7347426, 1, 1, 1, 1, 1,
-0.2668413, 1.443909, 1.39966, 1, 1, 1, 1, 1,
-0.2642859, -2.119657, -2.145778, 1, 1, 1, 1, 1,
-0.2630577, -0.3076031, -3.529766, 1, 1, 1, 1, 1,
-0.2563213, -0.6505808, -1.381585, 0, 0, 1, 1, 1,
-0.2529508, -0.0200287, -1.505597, 1, 0, 0, 1, 1,
-0.2493597, 0.06710527, -1.978084, 1, 0, 0, 1, 1,
-0.2467303, 0.2939022, -0.1798109, 1, 0, 0, 1, 1,
-0.2433346, 0.07023935, 0.6607247, 1, 0, 0, 1, 1,
-0.2430622, -0.121998, -1.359865, 1, 0, 0, 1, 1,
-0.2393309, 0.6360948, -0.3941981, 0, 0, 0, 1, 1,
-0.2344155, -1.074044, -2.341848, 0, 0, 0, 1, 1,
-0.2319073, -1.037452, -3.908381, 0, 0, 0, 1, 1,
-0.2301876, -0.00822767, -1.085604, 0, 0, 0, 1, 1,
-0.226909, 1.551495, -1.880966, 0, 0, 0, 1, 1,
-0.2263234, 0.5695967, -0.7034503, 0, 0, 0, 1, 1,
-0.2261263, 0.6234974, -0.4487439, 0, 0, 0, 1, 1,
-0.2221563, 1.061761, -1.039209, 1, 1, 1, 1, 1,
-0.2175038, -0.1562304, -2.883277, 1, 1, 1, 1, 1,
-0.2143778, 1.188627, -0.6927943, 1, 1, 1, 1, 1,
-0.2138005, -1.391741, -2.414076, 1, 1, 1, 1, 1,
-0.2094481, 0.8675898, 0.08512941, 1, 1, 1, 1, 1,
-0.2084651, -1.052024, -2.399749, 1, 1, 1, 1, 1,
-0.2035851, -0.3405544, -2.818629, 1, 1, 1, 1, 1,
-0.2032442, 0.870222, 1.173404, 1, 1, 1, 1, 1,
-0.2029131, 0.5831742, 0.181014, 1, 1, 1, 1, 1,
-0.1999217, -0.332534, -4.437614, 1, 1, 1, 1, 1,
-0.1984463, -0.3526856, -2.153176, 1, 1, 1, 1, 1,
-0.1983025, -0.5059602, -4.510387, 1, 1, 1, 1, 1,
-0.1982887, 0.108267, -2.75273, 1, 1, 1, 1, 1,
-0.1977354, -0.9764634, 0.05227244, 1, 1, 1, 1, 1,
-0.1876555, 0.3510647, -2.179541, 1, 1, 1, 1, 1,
-0.1849955, -0.6044112, -1.714289, 0, 0, 1, 1, 1,
-0.1825559, -1.135972, -4.729118, 1, 0, 0, 1, 1,
-0.1825557, -0.09719299, -2.517614, 1, 0, 0, 1, 1,
-0.1785113, 0.4071078, 0.7335995, 1, 0, 0, 1, 1,
-0.1780065, 0.7092079, -0.9007932, 1, 0, 0, 1, 1,
-0.1769079, 0.5807828, -0.7309943, 1, 0, 0, 1, 1,
-0.1634656, -0.6338255, -1.684718, 0, 0, 0, 1, 1,
-0.1589475, 0.5317396, 0.6811094, 0, 0, 0, 1, 1,
-0.156137, 1.033902, -0.2418673, 0, 0, 0, 1, 1,
-0.1555695, -0.4546459, -2.747178, 0, 0, 0, 1, 1,
-0.1536424, -0.8515532, -1.540185, 0, 0, 0, 1, 1,
-0.1511663, 0.4149347, -0.1340781, 0, 0, 0, 1, 1,
-0.1510114, -0.860667, -3.622491, 0, 0, 0, 1, 1,
-0.1496232, 0.6214376, -0.5058985, 1, 1, 1, 1, 1,
-0.1484839, -0.5725632, -1.558406, 1, 1, 1, 1, 1,
-0.1479971, 0.1086969, -2.665607, 1, 1, 1, 1, 1,
-0.1459871, 0.1715372, -1.153725, 1, 1, 1, 1, 1,
-0.1456265, 0.2917336, 1.131341, 1, 1, 1, 1, 1,
-0.1434664, 0.5364699, -0.2111603, 1, 1, 1, 1, 1,
-0.1424458, -1.03242, -3.425054, 1, 1, 1, 1, 1,
-0.1423701, -0.6913788, -1.268841, 1, 1, 1, 1, 1,
-0.1418813, -0.6367918, -1.200591, 1, 1, 1, 1, 1,
-0.1350707, -1.164555, -3.578732, 1, 1, 1, 1, 1,
-0.1299865, 0.1265305, -0.4668174, 1, 1, 1, 1, 1,
-0.1279555, 1.677436, -0.01862523, 1, 1, 1, 1, 1,
-0.1269375, 0.1946371, -1.763685, 1, 1, 1, 1, 1,
-0.1252705, -0.3772659, -2.229532, 1, 1, 1, 1, 1,
-0.1238235, 0.4187727, 0.2268838, 1, 1, 1, 1, 1,
-0.1186507, 0.8059893, 0.03418043, 0, 0, 1, 1, 1,
-0.1146556, -0.5499071, -1.916309, 1, 0, 0, 1, 1,
-0.1097074, 0.5780349, -0.4952416, 1, 0, 0, 1, 1,
-0.1087516, -1.169764, -1.154254, 1, 0, 0, 1, 1,
-0.1072958, 0.4112206, -1.440868, 1, 0, 0, 1, 1,
-0.1059512, 1.273418, -0.05424898, 1, 0, 0, 1, 1,
-0.1056205, 1.627646, -1.254053, 0, 0, 0, 1, 1,
-0.1013084, 0.377519, 0.4413815, 0, 0, 0, 1, 1,
-0.1005645, -0.752082, -1.642846, 0, 0, 0, 1, 1,
-0.09746127, 0.01641269, -1.694262, 0, 0, 0, 1, 1,
-0.09624945, -0.3257657, -2.55608, 0, 0, 0, 1, 1,
-0.09503522, 0.530616, -2.134773, 0, 0, 0, 1, 1,
-0.09332544, -0.1261754, -4.143691, 0, 0, 0, 1, 1,
-0.08020905, -0.5864828, -5.022859, 1, 1, 1, 1, 1,
-0.07527999, -0.4797818, -4.490138, 1, 1, 1, 1, 1,
-0.07327751, 1.612888, -1.878135, 1, 1, 1, 1, 1,
-0.07300466, 0.3930732, -0.2592517, 1, 1, 1, 1, 1,
-0.07241374, -3.351992, -2.373512, 1, 1, 1, 1, 1,
-0.07128531, 0.8983455, -0.6814438, 1, 1, 1, 1, 1,
-0.07041998, 0.3882091, -1.124116, 1, 1, 1, 1, 1,
-0.06071973, 0.6742838, 2.812528, 1, 1, 1, 1, 1,
-0.0553752, -0.4780235, -5.230383, 1, 1, 1, 1, 1,
-0.05328408, -0.3699576, -4.258619, 1, 1, 1, 1, 1,
-0.04622199, -1.426543, -3.26336, 1, 1, 1, 1, 1,
-0.04620565, 0.8552222, 0.6575693, 1, 1, 1, 1, 1,
-0.04040382, 1.26468, -1.616094, 1, 1, 1, 1, 1,
-0.0397859, 0.3162619, -0.9453077, 1, 1, 1, 1, 1,
-0.03937072, -0.3518936, -5.281933, 1, 1, 1, 1, 1,
-0.03760588, 1.493955, -1.44873, 0, 0, 1, 1, 1,
-0.03654772, -0.3323799, -4.537486, 1, 0, 0, 1, 1,
-0.03598483, 0.9690619, 0.2320196, 1, 0, 0, 1, 1,
-0.03589352, 0.8734865, -0.8959224, 1, 0, 0, 1, 1,
-0.02584529, -0.3923617, -2.945385, 1, 0, 0, 1, 1,
-0.02550194, 0.5277709, -1.720845, 1, 0, 0, 1, 1,
-0.02199991, 0.4758095, -0.7399185, 0, 0, 0, 1, 1,
-0.0217714, -0.7201481, -1.257723, 0, 0, 0, 1, 1,
-0.0187872, -1.739272, -4.227947, 0, 0, 0, 1, 1,
-0.01725226, 0.3313904, 0.6643293, 0, 0, 0, 1, 1,
-0.01495133, 0.8458708, -1.1818, 0, 0, 0, 1, 1,
-0.01050699, -1.53868, -2.107039, 0, 0, 0, 1, 1,
-0.008785071, -0.1122184, -2.780789, 0, 0, 0, 1, 1,
-0.006256584, -1.091582, -3.822165, 1, 1, 1, 1, 1,
-0.005595119, 2.170162, 0.002722725, 1, 1, 1, 1, 1,
-0.005587238, -0.7782654, -3.788258, 1, 1, 1, 1, 1,
-0.004786989, 0.2978689, 0.8880735, 1, 1, 1, 1, 1,
-0.002712858, 0.3532918, 0.9128262, 1, 1, 1, 1, 1,
-0.001123046, -0.914301, -2.581108, 1, 1, 1, 1, 1,
-0.001015203, -0.3282929, -3.832867, 1, 1, 1, 1, 1,
0.001529299, 0.05525514, -0.01348832, 1, 1, 1, 1, 1,
0.001570249, -1.105082, 2.724928, 1, 1, 1, 1, 1,
0.005306865, -0.758786, 4.686119, 1, 1, 1, 1, 1,
0.005496594, -0.2733603, 2.938007, 1, 1, 1, 1, 1,
0.01071131, 0.7956981, -0.1116506, 1, 1, 1, 1, 1,
0.01671256, -0.9478952, 2.555957, 1, 1, 1, 1, 1,
0.01729751, 0.3408806, -1.389979, 1, 1, 1, 1, 1,
0.02099035, 0.3983416, 0.4736677, 1, 1, 1, 1, 1,
0.02182296, 1.102826, 0.871035, 0, 0, 1, 1, 1,
0.02243245, -1.061092, 4.012505, 1, 0, 0, 1, 1,
0.02319715, -0.1552528, 3.887136, 1, 0, 0, 1, 1,
0.02730713, 1.280921, 1.208727, 1, 0, 0, 1, 1,
0.02839999, -0.2110847, 3.427289, 1, 0, 0, 1, 1,
0.03128777, 0.1328441, -0.01444426, 1, 0, 0, 1, 1,
0.03297582, 1.271769, -0.776683, 0, 0, 0, 1, 1,
0.03647166, -0.2974117, 3.947277, 0, 0, 0, 1, 1,
0.04155662, -0.1492214, 3.902648, 0, 0, 0, 1, 1,
0.04697444, 0.8252943, -0.6994568, 0, 0, 0, 1, 1,
0.04704243, -1.36914, 1.46546, 0, 0, 0, 1, 1,
0.05159572, -1.10091, 2.805507, 0, 0, 0, 1, 1,
0.05286398, -0.9291552, 3.160642, 0, 0, 0, 1, 1,
0.0533955, 0.810851, 0.3520743, 1, 1, 1, 1, 1,
0.05425186, 1.013508, 0.5069962, 1, 1, 1, 1, 1,
0.05516901, 1.18654, 1.117419, 1, 1, 1, 1, 1,
0.05627762, -2.666283, 4.328932, 1, 1, 1, 1, 1,
0.05938987, -0.2371379, 3.48816, 1, 1, 1, 1, 1,
0.06145979, 0.3417131, 0.7310829, 1, 1, 1, 1, 1,
0.06453472, -0.8754815, 2.42658, 1, 1, 1, 1, 1,
0.06464062, 0.3312633, 1.700002, 1, 1, 1, 1, 1,
0.0662097, -1.440734, 3.730527, 1, 1, 1, 1, 1,
0.06968566, 0.8112857, 0.956032, 1, 1, 1, 1, 1,
0.07189226, -0.2724522, 1.266107, 1, 1, 1, 1, 1,
0.07581618, 0.07848637, 1.663609, 1, 1, 1, 1, 1,
0.07807835, -0.2526348, 3.638097, 1, 1, 1, 1, 1,
0.07875046, -0.5274959, 3.326508, 1, 1, 1, 1, 1,
0.08024539, 1.343506, 1.143691, 1, 1, 1, 1, 1,
0.08213231, -0.8228964, 4.051591, 0, 0, 1, 1, 1,
0.08352275, -0.002763761, 1.265453, 1, 0, 0, 1, 1,
0.08666308, 0.8119146, 0.775372, 1, 0, 0, 1, 1,
0.08815736, 1.532117, 0.1761616, 1, 0, 0, 1, 1,
0.09046632, -0.7237208, 3.547863, 1, 0, 0, 1, 1,
0.09124377, -0.7672676, 1.931557, 1, 0, 0, 1, 1,
0.09822243, -1.239504, 1.996628, 0, 0, 0, 1, 1,
0.1058461, 1.545519, -1.60476, 0, 0, 0, 1, 1,
0.1084735, 0.139354, 2.265506, 0, 0, 0, 1, 1,
0.1091628, -0.3304886, 2.842677, 0, 0, 0, 1, 1,
0.1099762, -2.354211, 3.014697, 0, 0, 0, 1, 1,
0.1113742, -1.0571, 3.092727, 0, 0, 0, 1, 1,
0.1161004, 1.172958, -0.05555969, 0, 0, 0, 1, 1,
0.116345, -2.090094, 3.541365, 1, 1, 1, 1, 1,
0.117845, 2.327258, 0.08679201, 1, 1, 1, 1, 1,
0.119654, 0.1986775, 0.2115476, 1, 1, 1, 1, 1,
0.1230171, 0.5244214, 0.859535, 1, 1, 1, 1, 1,
0.1256415, 0.3294629, -1.549467, 1, 1, 1, 1, 1,
0.1257194, 0.1474366, 0.06208048, 1, 1, 1, 1, 1,
0.1316452, 0.6199359, -0.5091263, 1, 1, 1, 1, 1,
0.1360404, -0.3865371, 2.598461, 1, 1, 1, 1, 1,
0.1360776, -0.125117, 3.722238, 1, 1, 1, 1, 1,
0.1383733, 0.9069786, 0.6731678, 1, 1, 1, 1, 1,
0.1393915, -1.372454, 2.12603, 1, 1, 1, 1, 1,
0.1409731, -0.1642971, 2.409777, 1, 1, 1, 1, 1,
0.1445075, -1.35991, 3.187408, 1, 1, 1, 1, 1,
0.144521, 1.505132, 0.3278873, 1, 1, 1, 1, 1,
0.1453774, 1.173061, 0.4432454, 1, 1, 1, 1, 1,
0.1456154, -0.577967, 2.841581, 0, 0, 1, 1, 1,
0.1477771, -0.2515288, 3.438848, 1, 0, 0, 1, 1,
0.1508085, 0.03627056, 0.6802783, 1, 0, 0, 1, 1,
0.1525417, 0.4966838, 1.732878, 1, 0, 0, 1, 1,
0.1566885, 1.219613, -2.009614, 1, 0, 0, 1, 1,
0.1573619, 1.05211, -0.2335976, 1, 0, 0, 1, 1,
0.1607545, -0.9674789, 2.30471, 0, 0, 0, 1, 1,
0.1635687, -0.4727369, 1.456935, 0, 0, 0, 1, 1,
0.1656783, -0.9742392, 3.720777, 0, 0, 0, 1, 1,
0.1693571, -0.4594443, 1.889501, 0, 0, 0, 1, 1,
0.1731397, 0.695873, 1.219137, 0, 0, 0, 1, 1,
0.1737411, 0.4595939, -1.260908, 0, 0, 0, 1, 1,
0.1766947, -0.3057095, 3.882528, 0, 0, 0, 1, 1,
0.1814086, -2.264031, 1.533957, 1, 1, 1, 1, 1,
0.1820123, 1.413291, -1.677365, 1, 1, 1, 1, 1,
0.1859667, -1.792457, 3.167195, 1, 1, 1, 1, 1,
0.1880501, -2.130859, 3.397469, 1, 1, 1, 1, 1,
0.1910772, -0.3410702, 4.805271, 1, 1, 1, 1, 1,
0.1942935, 0.05634856, -0.3364873, 1, 1, 1, 1, 1,
0.1946851, -0.7119355, 3.733697, 1, 1, 1, 1, 1,
0.1958043, -0.3357227, 3.127541, 1, 1, 1, 1, 1,
0.1966929, 3.052296, -0.0379466, 1, 1, 1, 1, 1,
0.201293, 0.4503232, -0.6621755, 1, 1, 1, 1, 1,
0.2078074, 1.48965, 0.9816622, 1, 1, 1, 1, 1,
0.2080276, 1.860185, 0.3837089, 1, 1, 1, 1, 1,
0.2094953, 1.237018, -0.6114428, 1, 1, 1, 1, 1,
0.2122398, 0.4722343, -1.640009, 1, 1, 1, 1, 1,
0.2136315, 1.381546, 2.391209, 1, 1, 1, 1, 1,
0.2149015, 0.4335947, 0.9837172, 0, 0, 1, 1, 1,
0.2166941, 1.688408, 0.1796251, 1, 0, 0, 1, 1,
0.2168207, 0.3325132, 0.06106228, 1, 0, 0, 1, 1,
0.2240513, 0.1961702, 1.482386, 1, 0, 0, 1, 1,
0.2243263, -0.5113792, 1.220958, 1, 0, 0, 1, 1,
0.2244248, 0.4870604, -0.8987277, 1, 0, 0, 1, 1,
0.2253495, -0.08696463, 3.211356, 0, 0, 0, 1, 1,
0.2274187, 0.3121745, 0.7452378, 0, 0, 0, 1, 1,
0.2290615, 0.4186827, 0.8883324, 0, 0, 0, 1, 1,
0.23472, -0.3952947, 1.773496, 0, 0, 0, 1, 1,
0.2356608, -0.4520366, 4.089429, 0, 0, 0, 1, 1,
0.2358494, 0.3502876, -0.128932, 0, 0, 0, 1, 1,
0.2373711, 0.9890351, 1.217364, 0, 0, 0, 1, 1,
0.2410019, 0.2633578, 1.162867, 1, 1, 1, 1, 1,
0.2418566, -0.225142, 2.817908, 1, 1, 1, 1, 1,
0.2422105, -0.4507115, 2.326424, 1, 1, 1, 1, 1,
0.2474463, 0.06304369, 0.1775476, 1, 1, 1, 1, 1,
0.2558834, 0.5665323, -0.6565645, 1, 1, 1, 1, 1,
0.2576977, -0.499137, 3.895883, 1, 1, 1, 1, 1,
0.2646246, 1.293115, 0.08116996, 1, 1, 1, 1, 1,
0.2696331, 1.369679, 0.4085126, 1, 1, 1, 1, 1,
0.275738, -0.4654118, 2.391501, 1, 1, 1, 1, 1,
0.2760726, 1.041266, 0.3556319, 1, 1, 1, 1, 1,
0.2781181, -0.9655615, 2.597383, 1, 1, 1, 1, 1,
0.2801618, 0.4086121, 0.08756546, 1, 1, 1, 1, 1,
0.2876813, -0.374131, 1.921322, 1, 1, 1, 1, 1,
0.2878412, 0.01035713, 2.035556, 1, 1, 1, 1, 1,
0.2878556, -0.3950894, 2.874004, 1, 1, 1, 1, 1,
0.2882216, -1.737681, 2.794611, 0, 0, 1, 1, 1,
0.2887564, 0.2817275, 0.9544442, 1, 0, 0, 1, 1,
0.2927459, -0.5166485, 2.552677, 1, 0, 0, 1, 1,
0.2976041, 0.7142264, 0.3391028, 1, 0, 0, 1, 1,
0.2977539, -0.01884868, 2.816264, 1, 0, 0, 1, 1,
0.2996457, -1.886051, 2.886116, 1, 0, 0, 1, 1,
0.300491, 0.3101453, 1.930799, 0, 0, 0, 1, 1,
0.3024216, -0.643782, 2.152602, 0, 0, 0, 1, 1,
0.3029504, 1.477892, 1.162468, 0, 0, 0, 1, 1,
0.3035576, -0.325038, 1.251101, 0, 0, 0, 1, 1,
0.3037369, -0.4806005, 2.149808, 0, 0, 0, 1, 1,
0.3040691, 0.6162106, 0.4971605, 0, 0, 0, 1, 1,
0.3098004, -0.5262066, 2.073568, 0, 0, 0, 1, 1,
0.3105772, -0.2174292, 4.228981, 1, 1, 1, 1, 1,
0.3156421, 1.323426, -0.4758847, 1, 1, 1, 1, 1,
0.3190763, 0.8424401, 0.6185783, 1, 1, 1, 1, 1,
0.3237821, -2.567449, 3.520595, 1, 1, 1, 1, 1,
0.3251616, -0.4021257, 3.291302, 1, 1, 1, 1, 1,
0.3266519, -0.2520894, 2.52699, 1, 1, 1, 1, 1,
0.3270698, 0.6823965, -0.785195, 1, 1, 1, 1, 1,
0.3286577, 0.4921882, -0.871794, 1, 1, 1, 1, 1,
0.3329772, 0.005159407, 2.016308, 1, 1, 1, 1, 1,
0.3357449, 0.1140878, -0.4926012, 1, 1, 1, 1, 1,
0.3366494, -0.2202348, 1.528329, 1, 1, 1, 1, 1,
0.3426721, 0.1689886, 0.5085539, 1, 1, 1, 1, 1,
0.3493158, -1.601658, 2.590325, 1, 1, 1, 1, 1,
0.3513262, -1.759243, 3.149068, 1, 1, 1, 1, 1,
0.352378, -0.4776419, 3.350996, 1, 1, 1, 1, 1,
0.3530833, 0.5892363, 1.164315, 0, 0, 1, 1, 1,
0.3576255, -2.52332, 1.454913, 1, 0, 0, 1, 1,
0.3656699, 0.8126234, 2.547576, 1, 0, 0, 1, 1,
0.3717709, 0.05270218, 2.74399, 1, 0, 0, 1, 1,
0.3745703, 0.8027517, 0.02492843, 1, 0, 0, 1, 1,
0.3748769, 0.2186332, -1.427453, 1, 0, 0, 1, 1,
0.375543, -0.1339429, 2.601212, 0, 0, 0, 1, 1,
0.3772207, -1.215158, 3.485481, 0, 0, 0, 1, 1,
0.3789376, -2.189653, 2.111817, 0, 0, 0, 1, 1,
0.3810167, -1.339484, 3.164932, 0, 0, 0, 1, 1,
0.38166, -0.06085514, 1.449079, 0, 0, 0, 1, 1,
0.3868393, 0.709996, 0.5581851, 0, 0, 0, 1, 1,
0.390588, -1.253609, 2.841052, 0, 0, 0, 1, 1,
0.394041, -1.741126, 2.203535, 1, 1, 1, 1, 1,
0.3978843, -0.4903403, 2.397847, 1, 1, 1, 1, 1,
0.3979962, 1.829749, -0.05206892, 1, 1, 1, 1, 1,
0.398986, 0.1943856, -0.3460718, 1, 1, 1, 1, 1,
0.4031039, 0.5999309, 1.184029, 1, 1, 1, 1, 1,
0.4053322, 0.3087855, 0.8267068, 1, 1, 1, 1, 1,
0.407444, -0.1740885, 0.936646, 1, 1, 1, 1, 1,
0.4121457, -0.1914616, 2.049899, 1, 1, 1, 1, 1,
0.4186424, -0.2500018, 1.378728, 1, 1, 1, 1, 1,
0.4262702, -1.506867, 4.856596, 1, 1, 1, 1, 1,
0.4307329, -0.2798828, 2.921659, 1, 1, 1, 1, 1,
0.4307461, 0.5059766, 0.8485083, 1, 1, 1, 1, 1,
0.4314505, 0.7583518, 0.3166179, 1, 1, 1, 1, 1,
0.4324813, 0.9311713, 1.100877, 1, 1, 1, 1, 1,
0.4339474, -1.993119, 2.737708, 1, 1, 1, 1, 1,
0.434756, -1.551655, 2.022374, 0, 0, 1, 1, 1,
0.4374485, 1.601876, -0.9888912, 1, 0, 0, 1, 1,
0.4399788, 0.2814438, -0.2971411, 1, 0, 0, 1, 1,
0.4402184, 0.8252801, -0.8292773, 1, 0, 0, 1, 1,
0.4410608, -0.8109721, 3.754268, 1, 0, 0, 1, 1,
0.4421063, -0.7833719, 3.199284, 1, 0, 0, 1, 1,
0.4439777, 0.8411382, 0.6960311, 0, 0, 0, 1, 1,
0.4462852, 0.5207458, 0.540583, 0, 0, 0, 1, 1,
0.4531413, -0.1580019, 2.548461, 0, 0, 0, 1, 1,
0.4573652, -0.723791, 2.462058, 0, 0, 0, 1, 1,
0.4639696, 0.1127013, 3.302779, 0, 0, 0, 1, 1,
0.4644757, -2.708415, 1.842982, 0, 0, 0, 1, 1,
0.4704681, -0.7012169, -0.08720445, 0, 0, 0, 1, 1,
0.4709973, 0.01730238, 3.129112, 1, 1, 1, 1, 1,
0.4714552, -0.680537, 2.325375, 1, 1, 1, 1, 1,
0.478089, 1.163362, 1.234368, 1, 1, 1, 1, 1,
0.4853941, -1.835175, 1.133064, 1, 1, 1, 1, 1,
0.4858841, -0.1883274, 3.85343, 1, 1, 1, 1, 1,
0.4880948, -0.5867183, 3.315447, 1, 1, 1, 1, 1,
0.4941176, 0.246062, 0.2440232, 1, 1, 1, 1, 1,
0.4947378, 0.5529379, 1.69177, 1, 1, 1, 1, 1,
0.4976431, 0.1982886, 1.323796, 1, 1, 1, 1, 1,
0.4987239, 0.6105448, -0.500201, 1, 1, 1, 1, 1,
0.5048633, -0.3113416, 2.861683, 1, 1, 1, 1, 1,
0.5071957, -0.1300122, 1.433977, 1, 1, 1, 1, 1,
0.5087011, 0.2871119, -0.2235022, 1, 1, 1, 1, 1,
0.5103236, -0.6748933, 2.368616, 1, 1, 1, 1, 1,
0.5110419, -1.218654, 2.46321, 1, 1, 1, 1, 1,
0.511074, 0.7845408, -0.1298419, 0, 0, 1, 1, 1,
0.5139201, 0.6502374, 0.3439656, 1, 0, 0, 1, 1,
0.5186182, -0.6374171, 3.373939, 1, 0, 0, 1, 1,
0.5195284, 0.7609076, 0.5813127, 1, 0, 0, 1, 1,
0.5223439, 0.2603432, 2.374086, 1, 0, 0, 1, 1,
0.5240928, 1.587124, -0.2855863, 1, 0, 0, 1, 1,
0.5252967, -0.743969, 1.780773, 0, 0, 0, 1, 1,
0.5256825, 0.4190627, 0.3770677, 0, 0, 0, 1, 1,
0.526354, -0.9712714, 3.471277, 0, 0, 0, 1, 1,
0.5279139, -0.1087488, 2.333036, 0, 0, 0, 1, 1,
0.5282231, 0.6784926, -0.5454956, 0, 0, 0, 1, 1,
0.528784, 0.9730167, -1.023683, 0, 0, 0, 1, 1,
0.5380082, -0.7706769, 3.44569, 0, 0, 0, 1, 1,
0.5380403, 1.503176, -0.05652206, 1, 1, 1, 1, 1,
0.5388323, -0.3624795, 2.796854, 1, 1, 1, 1, 1,
0.5487854, 1.378492, -0.6016843, 1, 1, 1, 1, 1,
0.5521509, -0.7499563, 2.331516, 1, 1, 1, 1, 1,
0.5546265, 0.8284301, -0.7826191, 1, 1, 1, 1, 1,
0.5591301, -0.6822686, 2.777769, 1, 1, 1, 1, 1,
0.5599711, -0.3800393, 3.435698, 1, 1, 1, 1, 1,
0.5618156, -0.499066, 1.015981, 1, 1, 1, 1, 1,
0.5648673, 0.7816278, 0.4099008, 1, 1, 1, 1, 1,
0.5667406, 0.5091681, 1.24406, 1, 1, 1, 1, 1,
0.5721025, 0.238893, 0.3243859, 1, 1, 1, 1, 1,
0.5775504, 2.855846, -0.9986305, 1, 1, 1, 1, 1,
0.579771, 0.006559138, 2.863299, 1, 1, 1, 1, 1,
0.5797723, 0.3249303, 0.9082136, 1, 1, 1, 1, 1,
0.5827861, 0.02932839, 0.3669825, 1, 1, 1, 1, 1,
0.5866916, -0.2147952, 2.2384, 0, 0, 1, 1, 1,
0.5883306, -0.3934436, 2.695222, 1, 0, 0, 1, 1,
0.5914328, -0.3402165, 2.002886, 1, 0, 0, 1, 1,
0.5979812, -0.8998078, 2.889579, 1, 0, 0, 1, 1,
0.5999199, -0.04551429, 0.59041, 1, 0, 0, 1, 1,
0.6028991, -1.021538, 3.598407, 1, 0, 0, 1, 1,
0.6046842, 0.5542394, -0.1091947, 0, 0, 0, 1, 1,
0.613974, 1.177805, 0.2523457, 0, 0, 0, 1, 1,
0.6147017, 1.098436, -0.7028586, 0, 0, 0, 1, 1,
0.623625, -0.7095346, 1.576622, 0, 0, 0, 1, 1,
0.6243891, 1.448191, 0.02421933, 0, 0, 0, 1, 1,
0.6326357, 0.8351583, 0.194654, 0, 0, 0, 1, 1,
0.6346025, -0.7230928, 2.305818, 0, 0, 0, 1, 1,
0.6433581, -0.6102486, 2.187969, 1, 1, 1, 1, 1,
0.6435818, 0.1028593, 0.1512656, 1, 1, 1, 1, 1,
0.647058, 0.8119982, -1.491268, 1, 1, 1, 1, 1,
0.6510863, -0.3704672, 1.115124, 1, 1, 1, 1, 1,
0.6551413, -0.3130774, 0.9120963, 1, 1, 1, 1, 1,
0.6579749, -1.107791, 2.649045, 1, 1, 1, 1, 1,
0.6606505, 0.800821, 2.448895, 1, 1, 1, 1, 1,
0.6621107, 0.8183405, 2.144052, 1, 1, 1, 1, 1,
0.6622896, 0.2342877, 2.813929, 1, 1, 1, 1, 1,
0.6650768, 0.8229865, 0.3438172, 1, 1, 1, 1, 1,
0.6677792, 0.3511718, 1.710701, 1, 1, 1, 1, 1,
0.6713431, -0.00326853, 0.4542485, 1, 1, 1, 1, 1,
0.6756861, -1.396295, 3.087079, 1, 1, 1, 1, 1,
0.6779882, 0.4574555, 1.388592, 1, 1, 1, 1, 1,
0.679591, 0.8874046, 0.4621861, 1, 1, 1, 1, 1,
0.6807712, -0.4905488, 2.858679, 0, 0, 1, 1, 1,
0.6860406, 0.4248258, 1.137987, 1, 0, 0, 1, 1,
0.6862156, -1.716123, 2.283693, 1, 0, 0, 1, 1,
0.6868705, 0.3146467, 1.472016, 1, 0, 0, 1, 1,
0.6901462, -0.5997036, 0.4264935, 1, 0, 0, 1, 1,
0.7028813, 1.16443, 0.5714402, 1, 0, 0, 1, 1,
0.7037044, -0.8320068, 2.081055, 0, 0, 0, 1, 1,
0.7040675, -1.815087, 3.310823, 0, 0, 0, 1, 1,
0.7103322, -0.8677111, 2.652655, 0, 0, 0, 1, 1,
0.7116784, 0.3420264, 1.911474, 0, 0, 0, 1, 1,
0.7131578, 0.7890825, 1.580868, 0, 0, 0, 1, 1,
0.7137558, 1.4455, 2.1298, 0, 0, 0, 1, 1,
0.7344537, -0.923956, 2.807143, 0, 0, 0, 1, 1,
0.7408453, 0.2287857, 1.10726, 1, 1, 1, 1, 1,
0.7433192, 1.63475, 1.603849, 1, 1, 1, 1, 1,
0.7461398, 0.09794344, 1.090226, 1, 1, 1, 1, 1,
0.7487567, -1.01583, 2.974065, 1, 1, 1, 1, 1,
0.7488065, 0.05630872, 0.794684, 1, 1, 1, 1, 1,
0.761095, 0.8058836, 1.605588, 1, 1, 1, 1, 1,
0.7649434, -0.48371, 3.08381, 1, 1, 1, 1, 1,
0.7672583, 1.069131, 0.2071542, 1, 1, 1, 1, 1,
0.7676237, 0.6888253, 1.167197, 1, 1, 1, 1, 1,
0.7699468, 1.379138, 0.8643291, 1, 1, 1, 1, 1,
0.772652, -0.003752826, 0.4510647, 1, 1, 1, 1, 1,
0.7736248, -0.7775672, 2.193368, 1, 1, 1, 1, 1,
0.7739061, -1.278466, 2.238673, 1, 1, 1, 1, 1,
0.7797791, 2.671908, -1.464693, 1, 1, 1, 1, 1,
0.7837097, 1.408246, 2.312128, 1, 1, 1, 1, 1,
0.7939424, -0.3153839, 2.185024, 0, 0, 1, 1, 1,
0.7972395, -0.599063, 2.579991, 1, 0, 0, 1, 1,
0.8026174, -0.8344882, 3.311459, 1, 0, 0, 1, 1,
0.8040309, 0.6679637, 1.223773, 1, 0, 0, 1, 1,
0.8070832, -0.5749413, 3.984706, 1, 0, 0, 1, 1,
0.8079405, 1.122862, 2.0206, 1, 0, 0, 1, 1,
0.8083261, -0.8916914, 3.196933, 0, 0, 0, 1, 1,
0.815205, 2.204654, 1.685327, 0, 0, 0, 1, 1,
0.8161492, -0.3749849, 1.848408, 0, 0, 0, 1, 1,
0.8212118, 0.6150771, 0.9312327, 0, 0, 0, 1, 1,
0.821655, 0.7832072, 0.261106, 0, 0, 0, 1, 1,
0.8237365, -0.9499893, 1.909634, 0, 0, 0, 1, 1,
0.8269842, -0.1271646, -0.2921422, 0, 0, 0, 1, 1,
0.8290474, 1.020298, 0.3593202, 1, 1, 1, 1, 1,
0.8323392, 0.4028275, 0.7919557, 1, 1, 1, 1, 1,
0.8336042, -1.181024, 1.673947, 1, 1, 1, 1, 1,
0.8343552, 0.2842401, 2.304013, 1, 1, 1, 1, 1,
0.8350243, 0.8027893, -0.157139, 1, 1, 1, 1, 1,
0.8364308, 1.8896, -1.568954, 1, 1, 1, 1, 1,
0.84092, 0.8850577, 0.5154887, 1, 1, 1, 1, 1,
0.8427311, -1.336906, 1.684025, 1, 1, 1, 1, 1,
0.8510164, 0.6671397, 1.274277, 1, 1, 1, 1, 1,
0.8643596, 0.3979244, 2.849916, 1, 1, 1, 1, 1,
0.8674678, 1.743642, 0.3995093, 1, 1, 1, 1, 1,
0.8686854, -0.4652499, 2.177794, 1, 1, 1, 1, 1,
0.8690187, 0.005487112, 1.924121, 1, 1, 1, 1, 1,
0.8895925, 0.7224712, 1.637105, 1, 1, 1, 1, 1,
0.8902228, -0.755743, 2.181309, 1, 1, 1, 1, 1,
0.9031361, -0.4517639, 1.960814, 0, 0, 1, 1, 1,
0.9116741, 0.5496703, 1.494188, 1, 0, 0, 1, 1,
0.9151784, 0.4897123, 0.2509879, 1, 0, 0, 1, 1,
0.9181716, 0.4256473, -0.6177602, 1, 0, 0, 1, 1,
0.9185333, -1.075904, 1.334959, 1, 0, 0, 1, 1,
0.933467, -1.886914, 3.809573, 1, 0, 0, 1, 1,
0.936922, 0.8161839, -0.4093456, 0, 0, 0, 1, 1,
0.9394194, -1.101469, 2.178893, 0, 0, 0, 1, 1,
0.9525316, -0.2019012, 2.814478, 0, 0, 0, 1, 1,
0.9548036, -0.5774782, 1.028085, 0, 0, 0, 1, 1,
0.955608, 2.014459, 0.4531385, 0, 0, 0, 1, 1,
0.9630741, -0.4613138, 3.735187, 0, 0, 0, 1, 1,
0.9734285, 0.1415873, -0.01334919, 0, 0, 0, 1, 1,
0.9781054, -0.4514646, 1.162569, 1, 1, 1, 1, 1,
0.9808918, 0.2696453, 0.3400624, 1, 1, 1, 1, 1,
0.9828786, 0.3608873, 2.543765, 1, 1, 1, 1, 1,
0.9855694, -1.211039, 1.143263, 1, 1, 1, 1, 1,
0.9873576, 0.6968858, 2.16229, 1, 1, 1, 1, 1,
0.9890428, 0.5924131, 0.7405229, 1, 1, 1, 1, 1,
0.9906883, 1.057145, 2.977429, 1, 1, 1, 1, 1,
0.9953575, -0.9800877, 2.389327, 1, 1, 1, 1, 1,
0.9953789, -0.180046, 1.838199, 1, 1, 1, 1, 1,
1.000612, 0.9153133, 1.235507, 1, 1, 1, 1, 1,
1.002409, -0.1015293, 2.629101, 1, 1, 1, 1, 1,
1.002645, 0.5206978, -0.7686224, 1, 1, 1, 1, 1,
1.005056, 0.4328303, 0.973864, 1, 1, 1, 1, 1,
1.006657, 0.4051798, 0.4367732, 1, 1, 1, 1, 1,
1.009781, 0.8844798, 3.081577, 1, 1, 1, 1, 1,
1.010816, 0.9282566, 1.57783, 0, 0, 1, 1, 1,
1.032671, -0.4211587, 2.496647, 1, 0, 0, 1, 1,
1.035354, 0.7441688, 1.264271, 1, 0, 0, 1, 1,
1.036243, -0.2835161, 1.533601, 1, 0, 0, 1, 1,
1.036732, 0.1596398, 1.763935, 1, 0, 0, 1, 1,
1.0417, 0.8770247, -0.4820153, 1, 0, 0, 1, 1,
1.046171, -1.608331, 3.341843, 0, 0, 0, 1, 1,
1.067409, 1.728336, 1.614642, 0, 0, 0, 1, 1,
1.068565, 0.9050856, 0.9013769, 0, 0, 0, 1, 1,
1.072189, -0.9396826, 2.613264, 0, 0, 0, 1, 1,
1.07322, -0.3222383, 2.295093, 0, 0, 0, 1, 1,
1.089019, -1.490704, 2.186394, 0, 0, 0, 1, 1,
1.098331, -0.07010853, 1.317897, 0, 0, 0, 1, 1,
1.110549, -0.6575911, 0.7630107, 1, 1, 1, 1, 1,
1.112019, 0.2945296, 0.8218672, 1, 1, 1, 1, 1,
1.113923, 0.4763517, 3.049993, 1, 1, 1, 1, 1,
1.115401, -1.009294, 2.898932, 1, 1, 1, 1, 1,
1.119741, 1.030364, 1.94525, 1, 1, 1, 1, 1,
1.120563, -1.618094, 1.127354, 1, 1, 1, 1, 1,
1.128612, -1.41822, 1.779121, 1, 1, 1, 1, 1,
1.136815, -1.452987, 4.571051, 1, 1, 1, 1, 1,
1.145401, -0.4473614, 2.320702, 1, 1, 1, 1, 1,
1.145536, -1.277817, 3.789622, 1, 1, 1, 1, 1,
1.146666, -0.2524162, 1.232837, 1, 1, 1, 1, 1,
1.149791, 1.137866, 0.5291299, 1, 1, 1, 1, 1,
1.151737, -0.8871024, 1.473474, 1, 1, 1, 1, 1,
1.152627, -0.4300987, 3.400756, 1, 1, 1, 1, 1,
1.153488, 1.375194, 0.571626, 1, 1, 1, 1, 1,
1.154521, -0.5930051, 1.422437, 0, 0, 1, 1, 1,
1.155218, -0.3621491, 1.389234, 1, 0, 0, 1, 1,
1.159159, -0.3383316, 1.921158, 1, 0, 0, 1, 1,
1.160658, -0.9820254, 0.7128917, 1, 0, 0, 1, 1,
1.163567, 0.5434262, 2.127884, 1, 0, 0, 1, 1,
1.17129, -1.382691, 3.549023, 1, 0, 0, 1, 1,
1.173576, -1.051419, 0.9827662, 0, 0, 0, 1, 1,
1.176831, -1.444934, 2.396835, 0, 0, 0, 1, 1,
1.177454, -0.02708286, 0.5581543, 0, 0, 0, 1, 1,
1.186211, -0.6071557, 1.977622, 0, 0, 0, 1, 1,
1.190602, 0.6559625, 3.314465, 0, 0, 0, 1, 1,
1.194641, 0.02266474, 1.251505, 0, 0, 0, 1, 1,
1.195629, -0.2962697, 1.885581, 0, 0, 0, 1, 1,
1.198987, -0.6705885, 3.18486, 1, 1, 1, 1, 1,
1.200151, -0.3450386, 1.602721, 1, 1, 1, 1, 1,
1.201959, -1.107957, 2.253516, 1, 1, 1, 1, 1,
1.212838, 1.296393, 1.466458, 1, 1, 1, 1, 1,
1.214818, 0.8423454, 0.1543728, 1, 1, 1, 1, 1,
1.217681, 1.500596, 1.718803, 1, 1, 1, 1, 1,
1.219025, 1.257625, 1.778844, 1, 1, 1, 1, 1,
1.224751, -0.2254772, 4.071325, 1, 1, 1, 1, 1,
1.227275, -0.5708374, 2.900692, 1, 1, 1, 1, 1,
1.238693, -0.3282253, 0.2996842, 1, 1, 1, 1, 1,
1.242899, -1.153348, 3.242957, 1, 1, 1, 1, 1,
1.244362, -0.2148272, 0.5770994, 1, 1, 1, 1, 1,
1.245746, 1.010198, -0.3906914, 1, 1, 1, 1, 1,
1.245894, 1.472499, 1.366956, 1, 1, 1, 1, 1,
1.251804, 0.9132324, 1.365441, 1, 1, 1, 1, 1,
1.259091, -1.052284, 3.87157, 0, 0, 1, 1, 1,
1.26612, 1.391742, 0.7790256, 1, 0, 0, 1, 1,
1.27764, -0.7875552, 3.1101, 1, 0, 0, 1, 1,
1.284425, 0.1138007, 1.82849, 1, 0, 0, 1, 1,
1.286723, 0.2652391, 2.720461, 1, 0, 0, 1, 1,
1.288371, 0.9905385, 1.134565, 1, 0, 0, 1, 1,
1.293645, -0.287179, 1.824337, 0, 0, 0, 1, 1,
1.295895, 0.03825768, 1.595824, 0, 0, 0, 1, 1,
1.302484, -1.41193, 2.806348, 0, 0, 0, 1, 1,
1.311314, 0.3688571, 2.607633, 0, 0, 0, 1, 1,
1.326603, -0.1791309, 0.4039776, 0, 0, 0, 1, 1,
1.342817, 0.2799308, 1.563278, 0, 0, 0, 1, 1,
1.346895, -0.2333707, 3.043211, 0, 0, 0, 1, 1,
1.348169, -0.3251573, 2.239593, 1, 1, 1, 1, 1,
1.361593, 0.5409282, -0.2157902, 1, 1, 1, 1, 1,
1.381582, 0.07146503, 0.6901038, 1, 1, 1, 1, 1,
1.382303, 0.6054495, 1.324226, 1, 1, 1, 1, 1,
1.390978, 0.03307399, 2.058368, 1, 1, 1, 1, 1,
1.400164, -0.4195735, 2.677651, 1, 1, 1, 1, 1,
1.413485, -0.5215899, 1.268295, 1, 1, 1, 1, 1,
1.413954, 0.1036064, 0.3343876, 1, 1, 1, 1, 1,
1.415408, 0.4803554, 0.04643862, 1, 1, 1, 1, 1,
1.434146, 0.2295693, 2.801747, 1, 1, 1, 1, 1,
1.434714, 0.27584, -0.2063405, 1, 1, 1, 1, 1,
1.437158, -0.4693011, 2.638731, 1, 1, 1, 1, 1,
1.439571, -0.2849776, 2.328117, 1, 1, 1, 1, 1,
1.443368, 0.2661385, 0.3677107, 1, 1, 1, 1, 1,
1.448005, 0.841418, 2.099074, 1, 1, 1, 1, 1,
1.449619, -0.3909988, 3.323143, 0, 0, 1, 1, 1,
1.453964, 0.06916171, 0.9598844, 1, 0, 0, 1, 1,
1.459523, 1.612999, 1.235014, 1, 0, 0, 1, 1,
1.461646, 1.088329, 0.6177863, 1, 0, 0, 1, 1,
1.463151, 0.556608, -0.1215408, 1, 0, 0, 1, 1,
1.484095, 0.1958027, 1.801528, 1, 0, 0, 1, 1,
1.514232, 0.05838861, 1.243237, 0, 0, 0, 1, 1,
1.519293, 0.7440603, -0.02848005, 0, 0, 0, 1, 1,
1.524535, 0.716677, 0.07547296, 0, 0, 0, 1, 1,
1.545896, 0.08458141, 1.467348, 0, 0, 0, 1, 1,
1.550446, -0.3376817, -0.02662106, 0, 0, 0, 1, 1,
1.553704, 0.3180609, 1.846004, 0, 0, 0, 1, 1,
1.55526, -0.4977283, 1.430609, 0, 0, 0, 1, 1,
1.557977, -1.522289, 1.704004, 1, 1, 1, 1, 1,
1.571349, -1.34057, 1.430065, 1, 1, 1, 1, 1,
1.57731, -0.02651036, 2.544509, 1, 1, 1, 1, 1,
1.588022, 0.9248027, 0.8062894, 1, 1, 1, 1, 1,
1.597164, -1.474691, 1.689352, 1, 1, 1, 1, 1,
1.602379, -0.8680342, 2.552614, 1, 1, 1, 1, 1,
1.612358, 0.06005786, 0.1920103, 1, 1, 1, 1, 1,
1.623101, 2.073988, -1.150492, 1, 1, 1, 1, 1,
1.625687, -0.3730141, 1.432844, 1, 1, 1, 1, 1,
1.632606, -0.1509288, 3.766877, 1, 1, 1, 1, 1,
1.633637, -0.5293876, 1.669869, 1, 1, 1, 1, 1,
1.646996, -2.145676, 2.972944, 1, 1, 1, 1, 1,
1.654351, -0.847474, 2.843169, 1, 1, 1, 1, 1,
1.660304, -0.1096459, 0.7512039, 1, 1, 1, 1, 1,
1.676418, -0.003825354, 1.981721, 1, 1, 1, 1, 1,
1.688205, -1.649515, 2.982827, 0, 0, 1, 1, 1,
1.707664, 0.3836636, 1.184137, 1, 0, 0, 1, 1,
1.710808, -0.6880228, 1.644406, 1, 0, 0, 1, 1,
1.719731, -0.2629608, 1.346114, 1, 0, 0, 1, 1,
1.736589, -0.3441581, 0.7964574, 1, 0, 0, 1, 1,
1.740034, 0.6212593, 1.298552, 1, 0, 0, 1, 1,
1.770602, -0.03979649, 1.431741, 0, 0, 0, 1, 1,
1.774714, 0.5163641, 2.146594, 0, 0, 0, 1, 1,
1.781277, -1.692476, 2.220345, 0, 0, 0, 1, 1,
1.78278, 0.03238355, 2.219289, 0, 0, 0, 1, 1,
1.808539, 0.3888258, 3.569844, 0, 0, 0, 1, 1,
1.809186, 0.5095835, 1.043431, 0, 0, 0, 1, 1,
1.817485, 0.9213659, 1.072061, 0, 0, 0, 1, 1,
1.8247, 0.1937456, 1.074774, 1, 1, 1, 1, 1,
1.827546, -2.123292, 2.557463, 1, 1, 1, 1, 1,
1.840002, -0.07519407, 1.356846, 1, 1, 1, 1, 1,
1.876821, 1.217191, -0.0627805, 1, 1, 1, 1, 1,
1.880499, -0.5001217, 2.003568, 1, 1, 1, 1, 1,
1.886889, 1.260047, 0.6843576, 1, 1, 1, 1, 1,
1.887894, -0.1540552, 0.9007343, 1, 1, 1, 1, 1,
1.89231, 1.77554, -0.4126017, 1, 1, 1, 1, 1,
1.894649, 1.488505, 0.8456241, 1, 1, 1, 1, 1,
1.896663, -1.441406, 2.536885, 1, 1, 1, 1, 1,
1.899177, -1.826972, 2.697346, 1, 1, 1, 1, 1,
1.907634, -0.4809969, 2.396381, 1, 1, 1, 1, 1,
1.939074, 0.04539969, 0.05348044, 1, 1, 1, 1, 1,
1.939892, 0.04892541, 1.00197, 1, 1, 1, 1, 1,
1.964568, -0.08616855, 1.056867, 1, 1, 1, 1, 1,
2.004457, 1.528213, 1.979254, 0, 0, 1, 1, 1,
2.013111, 1.116347, 2.30346, 1, 0, 0, 1, 1,
2.026075, -0.8908805, 2.411363, 1, 0, 0, 1, 1,
2.057264, -0.8368171, 2.278701, 1, 0, 0, 1, 1,
2.10422, 1.391596, 2.608402, 1, 0, 0, 1, 1,
2.121743, -1.60602, 2.304005, 1, 0, 0, 1, 1,
2.140939, -1.381706, 1.401873, 0, 0, 0, 1, 1,
2.154413, 0.1279756, 1.571565, 0, 0, 0, 1, 1,
2.17736, -0.09888979, 0.2645273, 0, 0, 0, 1, 1,
2.207943, 1.31043, 3.318663, 0, 0, 0, 1, 1,
2.254814, -0.05810328, 2.127543, 0, 0, 0, 1, 1,
2.31688, -0.5156069, 1.260435, 0, 0, 0, 1, 1,
2.376342, 1.140091, -0.9705738, 0, 0, 0, 1, 1,
2.382838, -0.9965312, 2.998194, 1, 1, 1, 1, 1,
2.396132, -0.923663, 1.895629, 1, 1, 1, 1, 1,
2.416541, 0.1734085, 1.201186, 1, 1, 1, 1, 1,
2.421995, 0.2430963, 0.7239065, 1, 1, 1, 1, 1,
2.441675, 2.210632, -0.5282884, 1, 1, 1, 1, 1,
2.451167, 0.5733859, 1.958314, 1, 1, 1, 1, 1,
2.491798, 1.908239, -1.17288, 1, 1, 1, 1, 1
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
var radius = 9.16376;
var distance = 32.18732;
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
mvMatrix.translate( 0.3159158, 0.1016092, 0.2126684 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.18732);
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
