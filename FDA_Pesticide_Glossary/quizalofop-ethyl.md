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
-3.134026, 1.440251, -0.6546404, 1, 0, 0, 1,
-2.971176, -0.6351885, -1.758568, 1, 0.007843138, 0, 1,
-2.851421, -2.336887, -3.922005, 1, 0.01176471, 0, 1,
-2.722406, 0.07480133, -1.417572, 1, 0.01960784, 0, 1,
-2.647637, -0.930343, -3.100081, 1, 0.02352941, 0, 1,
-2.642868, 0.9117616, -0.5315046, 1, 0.03137255, 0, 1,
-2.493954, 0.8087871, -0.7382298, 1, 0.03529412, 0, 1,
-2.477493, -0.1024147, -0.761946, 1, 0.04313726, 0, 1,
-2.455782, -1.244569, -2.406575, 1, 0.04705882, 0, 1,
-2.443763, -0.9203737, -2.455067, 1, 0.05490196, 0, 1,
-2.39613, 0.4698076, -1.039024, 1, 0.05882353, 0, 1,
-2.382226, 0.5591416, -1.428423, 1, 0.06666667, 0, 1,
-2.36883, 1.286951, -0.203924, 1, 0.07058824, 0, 1,
-2.360475, 0.2672156, -1.499126, 1, 0.07843138, 0, 1,
-2.344967, -0.9869806, -2.483646, 1, 0.08235294, 0, 1,
-2.305712, 0.7233458, -1.794307, 1, 0.09019608, 0, 1,
-2.293601, 0.4592721, -3.723873, 1, 0.09411765, 0, 1,
-2.275457, 0.3538713, -2.108954, 1, 0.1019608, 0, 1,
-2.250084, 0.7882175, -0.5998554, 1, 0.1098039, 0, 1,
-2.230177, -0.5037428, -3.453776, 1, 0.1137255, 0, 1,
-2.211092, -0.06918121, -0.5955523, 1, 0.1215686, 0, 1,
-2.194071, 1.465201, -0.5198787, 1, 0.1254902, 0, 1,
-2.094668, 2.269726, -0.368702, 1, 0.1333333, 0, 1,
-2.083887, 0.4770855, -1.72946, 1, 0.1372549, 0, 1,
-2.040311, 0.4023914, -1.222515, 1, 0.145098, 0, 1,
-2.038049, -1.171312, -3.217492, 1, 0.1490196, 0, 1,
-2.020278, 0.2268811, -0.4838636, 1, 0.1568628, 0, 1,
-1.986469, -0.004755309, -2.501462, 1, 0.1607843, 0, 1,
-1.980771, 0.6444398, -2.008134, 1, 0.1686275, 0, 1,
-1.975501, 0.7027676, -1.546905, 1, 0.172549, 0, 1,
-1.918888, -1.489714, -2.069797, 1, 0.1803922, 0, 1,
-1.918157, -0.233197, -0.9290888, 1, 0.1843137, 0, 1,
-1.910287, 0.7331023, -1.955968, 1, 0.1921569, 0, 1,
-1.904826, 0.7787843, -0.2076126, 1, 0.1960784, 0, 1,
-1.903624, 0.03189296, -2.571848, 1, 0.2039216, 0, 1,
-1.869775, 0.6945101, -1.237209, 1, 0.2117647, 0, 1,
-1.850413, -0.5904307, -1.759006, 1, 0.2156863, 0, 1,
-1.82528, -0.4018065, -1.353953, 1, 0.2235294, 0, 1,
-1.793103, 0.6624455, -0.249612, 1, 0.227451, 0, 1,
-1.79284, -0.8802261, -2.24765, 1, 0.2352941, 0, 1,
-1.791909, -0.3810292, -0.8533309, 1, 0.2392157, 0, 1,
-1.776892, 0.223377, -2.669015, 1, 0.2470588, 0, 1,
-1.77376, -0.7082788, -3.002736, 1, 0.2509804, 0, 1,
-1.766979, -1.424538, -1.529594, 1, 0.2588235, 0, 1,
-1.74311, 0.6603792, -2.257437, 1, 0.2627451, 0, 1,
-1.742196, -0.5603656, -1.117466, 1, 0.2705882, 0, 1,
-1.723041, -0.5412831, -3.007858, 1, 0.2745098, 0, 1,
-1.719426, -0.5873351, -3.757274, 1, 0.282353, 0, 1,
-1.718429, 0.1356663, -1.471958, 1, 0.2862745, 0, 1,
-1.716717, -1.826667, -1.362392, 1, 0.2941177, 0, 1,
-1.713975, -1.302483, -1.813691, 1, 0.3019608, 0, 1,
-1.713006, 3.265559, 0.9914059, 1, 0.3058824, 0, 1,
-1.705166, -0.7187148, -3.709137, 1, 0.3137255, 0, 1,
-1.704214, 0.939835, -2.619969, 1, 0.3176471, 0, 1,
-1.640917, 0.4811472, -1.410213, 1, 0.3254902, 0, 1,
-1.639663, -1.689593, -4.457337, 1, 0.3294118, 0, 1,
-1.63761, 0.9493803, -0.6410705, 1, 0.3372549, 0, 1,
-1.63232, 0.5296765, -1.43153, 1, 0.3411765, 0, 1,
-1.627993, -0.8202505, -0.818863, 1, 0.3490196, 0, 1,
-1.620498, -0.07358404, 0.4622164, 1, 0.3529412, 0, 1,
-1.618953, 0.02279296, -2.468118, 1, 0.3607843, 0, 1,
-1.608338, 0.1872603, 0.9191538, 1, 0.3647059, 0, 1,
-1.603791, -0.4762985, 0.4017205, 1, 0.372549, 0, 1,
-1.59453, 0.5930854, -1.137972, 1, 0.3764706, 0, 1,
-1.583499, -0.9480706, -3.143259, 1, 0.3843137, 0, 1,
-1.573288, -0.1556621, -2.694325, 1, 0.3882353, 0, 1,
-1.562173, 1.166501, -0.9360688, 1, 0.3960784, 0, 1,
-1.561692, -0.8325419, -0.9580057, 1, 0.4039216, 0, 1,
-1.559936, 0.122264, -0.8213369, 1, 0.4078431, 0, 1,
-1.556206, 0.6778612, 1.806804, 1, 0.4156863, 0, 1,
-1.549608, -2.029125, -1.956824, 1, 0.4196078, 0, 1,
-1.548716, -8.850361e-05, -1.426671, 1, 0.427451, 0, 1,
-1.546849, 1.281147, 0.2060694, 1, 0.4313726, 0, 1,
-1.545148, -0.6538088, -2.265962, 1, 0.4392157, 0, 1,
-1.540722, -1.641824, -2.424676, 1, 0.4431373, 0, 1,
-1.529986, -0.7420374, -2.614061, 1, 0.4509804, 0, 1,
-1.527706, -1.486156, -2.99106, 1, 0.454902, 0, 1,
-1.520444, 1.027766, -0.194994, 1, 0.4627451, 0, 1,
-1.517368, 2.126207, -1.785541, 1, 0.4666667, 0, 1,
-1.499795, 1.698473, 0.07658003, 1, 0.4745098, 0, 1,
-1.496045, 0.5302054, -1.478712, 1, 0.4784314, 0, 1,
-1.495142, -0.9954328, -2.511905, 1, 0.4862745, 0, 1,
-1.490272, 1.208367, -1.45953, 1, 0.4901961, 0, 1,
-1.48441, -0.01207403, -3.279734, 1, 0.4980392, 0, 1,
-1.476769, 0.431582, -1.316766, 1, 0.5058824, 0, 1,
-1.468391, 0.9960034, 0.09239797, 1, 0.509804, 0, 1,
-1.437961, 1.756377, -0.2566188, 1, 0.5176471, 0, 1,
-1.437446, -0.3627052, -1.921975, 1, 0.5215687, 0, 1,
-1.427352, 1.181074, -3.037695, 1, 0.5294118, 0, 1,
-1.410558, -1.239725, -3.484964, 1, 0.5333334, 0, 1,
-1.404328, 0.7882322, -1.398504, 1, 0.5411765, 0, 1,
-1.402394, -1.315598, -2.024291, 1, 0.5450981, 0, 1,
-1.390717, 0.09130096, -2.209506, 1, 0.5529412, 0, 1,
-1.390191, -0.3321767, -1.811993, 1, 0.5568628, 0, 1,
-1.388492, -1.166822, -0.6263328, 1, 0.5647059, 0, 1,
-1.384655, -0.04572362, -2.446242, 1, 0.5686275, 0, 1,
-1.381296, 1.471547, 0.2723279, 1, 0.5764706, 0, 1,
-1.375618, -0.2594765, -1.70883, 1, 0.5803922, 0, 1,
-1.36747, 0.8710113, -0.6970924, 1, 0.5882353, 0, 1,
-1.359944, -1.593641, -2.991467, 1, 0.5921569, 0, 1,
-1.351118, -1.942074, -1.802746, 1, 0.6, 0, 1,
-1.350688, 1.191891, -1.275514, 1, 0.6078432, 0, 1,
-1.349001, 1.873678, 0.2497651, 1, 0.6117647, 0, 1,
-1.347576, 0.8419055, -1.881576, 1, 0.6196079, 0, 1,
-1.34709, -0.153396, -1.21643, 1, 0.6235294, 0, 1,
-1.343308, 0.07974038, -0.2821019, 1, 0.6313726, 0, 1,
-1.343018, -1.276393, -2.173303, 1, 0.6352941, 0, 1,
-1.340048, -0.9671733, -0.5752805, 1, 0.6431373, 0, 1,
-1.334061, -1.189853, -3.907141, 1, 0.6470588, 0, 1,
-1.329175, 0.1005955, -1.47333, 1, 0.654902, 0, 1,
-1.31242, 0.5059305, -1.395082, 1, 0.6588235, 0, 1,
-1.305719, -1.158124, -3.65118, 1, 0.6666667, 0, 1,
-1.305625, -0.2798182, -1.502624, 1, 0.6705883, 0, 1,
-1.300771, 0.1603636, -1.939378, 1, 0.6784314, 0, 1,
-1.295585, -0.3650979, -2.64385, 1, 0.682353, 0, 1,
-1.2892, -1.279765, -4.014374, 1, 0.6901961, 0, 1,
-1.288791, -0.8172719, -1.450854, 1, 0.6941177, 0, 1,
-1.281973, -0.376602, -0.8051935, 1, 0.7019608, 0, 1,
-1.280276, -0.7009561, 0.2117816, 1, 0.7098039, 0, 1,
-1.271923, -1.894442, -4.103971, 1, 0.7137255, 0, 1,
-1.260992, -0.940502, -2.265821, 1, 0.7215686, 0, 1,
-1.252027, -0.07450156, -0.8027149, 1, 0.7254902, 0, 1,
-1.251829, -0.7396005, -2.972223, 1, 0.7333333, 0, 1,
-1.244333, -0.5764807, -1.723563, 1, 0.7372549, 0, 1,
-1.241836, -0.9513139, -1.785643, 1, 0.7450981, 0, 1,
-1.240681, 0.7090822, -0.04504622, 1, 0.7490196, 0, 1,
-1.240103, -2.540982, -2.849025, 1, 0.7568628, 0, 1,
-1.23921, 1.035867, 0.1721624, 1, 0.7607843, 0, 1,
-1.238672, 0.8405967, -1.310804, 1, 0.7686275, 0, 1,
-1.236181, 0.7020995, -0.4494101, 1, 0.772549, 0, 1,
-1.222904, -1.381709, -3.55092, 1, 0.7803922, 0, 1,
-1.210873, 0.310727, -3.042473, 1, 0.7843137, 0, 1,
-1.195738, 0.5855106, -1.614459, 1, 0.7921569, 0, 1,
-1.194996, -1.419092, -3.150015, 1, 0.7960784, 0, 1,
-1.184277, 1.123836, 0.1146914, 1, 0.8039216, 0, 1,
-1.184192, -1.772093, -1.742182, 1, 0.8117647, 0, 1,
-1.183297, -0.8033707, 0.2084118, 1, 0.8156863, 0, 1,
-1.180959, -1.023197, -1.482401, 1, 0.8235294, 0, 1,
-1.172037, 1.11034, 0.166981, 1, 0.827451, 0, 1,
-1.155802, -0.1752977, -2.218904, 1, 0.8352941, 0, 1,
-1.155499, -0.07315364, -3.104112, 1, 0.8392157, 0, 1,
-1.142197, -0.9916317, -0.6942461, 1, 0.8470588, 0, 1,
-1.141295, 0.8717687, 0.1268755, 1, 0.8509804, 0, 1,
-1.133364, 1.600118, -0.1420798, 1, 0.8588235, 0, 1,
-1.121107, -0.3675078, -1.890039, 1, 0.8627451, 0, 1,
-1.120738, 0.5483736, -0.2555378, 1, 0.8705882, 0, 1,
-1.111365, 1.327845, -1.766131, 1, 0.8745098, 0, 1,
-1.110969, 0.05690418, -3.183907, 1, 0.8823529, 0, 1,
-1.099149, -0.2631468, -2.066849, 1, 0.8862745, 0, 1,
-1.098736, 0.9728263, -0.364522, 1, 0.8941177, 0, 1,
-1.097432, 0.8839279, -0.0252733, 1, 0.8980392, 0, 1,
-1.096468, 1.592669, -0.2681252, 1, 0.9058824, 0, 1,
-1.08844, -0.9617519, -1.661861, 1, 0.9137255, 0, 1,
-1.087791, 0.6613433, 0.3982881, 1, 0.9176471, 0, 1,
-1.086629, 0.7766985, -1.309462, 1, 0.9254902, 0, 1,
-1.080448, 1.001073, 0.4868512, 1, 0.9294118, 0, 1,
-1.076769, 1.203248, -0.1904743, 1, 0.9372549, 0, 1,
-1.072527, -1.842933, -0.8045201, 1, 0.9411765, 0, 1,
-1.071999, 1.075952, -1.166529, 1, 0.9490196, 0, 1,
-1.070918, 1.084119, 1.426776, 1, 0.9529412, 0, 1,
-1.069997, 0.3086098, -2.019284, 1, 0.9607843, 0, 1,
-1.066321, -0.5627007, -1.488034, 1, 0.9647059, 0, 1,
-1.064237, 0.03111984, -3.227536, 1, 0.972549, 0, 1,
-1.063215, 0.5764098, -1.975107, 1, 0.9764706, 0, 1,
-1.05725, 1.829084, -1.084533, 1, 0.9843137, 0, 1,
-1.053708, 0.7159152, -2.330616, 1, 0.9882353, 0, 1,
-1.053535, -0.3576428, -2.486526, 1, 0.9960784, 0, 1,
-1.052903, 0.5153152, 0.04358226, 0.9960784, 1, 0, 1,
-1.044068, 0.7918972, -1.177087, 0.9921569, 1, 0, 1,
-1.040286, -0.7886828, -1.729628, 0.9843137, 1, 0, 1,
-1.034285, 1.598133, 1.398674, 0.9803922, 1, 0, 1,
-1.031367, -0.4062862, -1.428088, 0.972549, 1, 0, 1,
-1.028499, -1.306384, -1.27514, 0.9686275, 1, 0, 1,
-1.027213, -0.209728, -1.647456, 0.9607843, 1, 0, 1,
-1.020947, -0.2762319, -1.677389, 0.9568627, 1, 0, 1,
-1.018101, 1.402281, -1.554701, 0.9490196, 1, 0, 1,
-1.004465, -0.06424257, -1.999179, 0.945098, 1, 0, 1,
-0.9944837, -2.12043, -4.244509, 0.9372549, 1, 0, 1,
-0.9897954, 1.41455, 0.8394681, 0.9333333, 1, 0, 1,
-0.962361, 0.1743178, -2.259436, 0.9254902, 1, 0, 1,
-0.9586239, 1.29465, -1.271514, 0.9215686, 1, 0, 1,
-0.9536752, 0.2657163, -1.788235, 0.9137255, 1, 0, 1,
-0.9481124, 2.478813, -1.354313, 0.9098039, 1, 0, 1,
-0.9427775, -0.7323911, -4.091059, 0.9019608, 1, 0, 1,
-0.9349076, 0.9423462, -0.3441676, 0.8941177, 1, 0, 1,
-0.9335303, 0.5643056, -2.284736, 0.8901961, 1, 0, 1,
-0.9317611, 0.2407742, -3.689646, 0.8823529, 1, 0, 1,
-0.9214538, 0.4329616, 0.517816, 0.8784314, 1, 0, 1,
-0.9205605, 1.089817, -0.1186413, 0.8705882, 1, 0, 1,
-0.9187225, -1.386147, 0.2995763, 0.8666667, 1, 0, 1,
-0.9179518, -0.01581022, 0.07564145, 0.8588235, 1, 0, 1,
-0.9105073, -1.395593, -2.390738, 0.854902, 1, 0, 1,
-0.9014942, 2.25938, 0.56731, 0.8470588, 1, 0, 1,
-0.8991244, 0.3549519, -0.6483885, 0.8431373, 1, 0, 1,
-0.8983582, 0.2256915, -0.7601848, 0.8352941, 1, 0, 1,
-0.8951439, -1.288446, -1.704749, 0.8313726, 1, 0, 1,
-0.8858452, 0.9000502, -1.418485, 0.8235294, 1, 0, 1,
-0.8848947, 0.669465, 0.08142511, 0.8196079, 1, 0, 1,
-0.8840871, -0.05257296, -1.050407, 0.8117647, 1, 0, 1,
-0.8818606, -0.7314099, -1.31961, 0.8078431, 1, 0, 1,
-0.8782553, 1.663979, -1.441965, 0.8, 1, 0, 1,
-0.8766444, 1.160586, -0.9058589, 0.7921569, 1, 0, 1,
-0.8758426, -0.1475269, -2.372206, 0.7882353, 1, 0, 1,
-0.8741542, -2.285467, -3.548757, 0.7803922, 1, 0, 1,
-0.8736624, 0.2640524, -1.156299, 0.7764706, 1, 0, 1,
-0.8730895, 1.433196, -0.7237402, 0.7686275, 1, 0, 1,
-0.8697808, 0.8816324, -1.818558, 0.7647059, 1, 0, 1,
-0.8686422, 0.5040168, -2.247728, 0.7568628, 1, 0, 1,
-0.8588023, -0.5860795, -1.687347, 0.7529412, 1, 0, 1,
-0.8584434, -0.7431366, -1.497768, 0.7450981, 1, 0, 1,
-0.8581197, 0.2044472, 0.5779595, 0.7411765, 1, 0, 1,
-0.8568866, -0.3052979, -2.88853, 0.7333333, 1, 0, 1,
-0.8540235, -1.65174, -1.370656, 0.7294118, 1, 0, 1,
-0.8477278, -0.8566682, -1.939538, 0.7215686, 1, 0, 1,
-0.847065, 0.1143525, -2.404065, 0.7176471, 1, 0, 1,
-0.8468407, 0.6384649, -2.614108, 0.7098039, 1, 0, 1,
-0.8465459, 0.6746285, -0.5398126, 0.7058824, 1, 0, 1,
-0.8445802, -0.9226436, -3.714275, 0.6980392, 1, 0, 1,
-0.8437867, 0.3650993, -2.054316, 0.6901961, 1, 0, 1,
-0.8426502, 0.6632794, -0.4130891, 0.6862745, 1, 0, 1,
-0.8420641, -0.593176, -1.966477, 0.6784314, 1, 0, 1,
-0.8396751, 0.04280129, -1.156909, 0.6745098, 1, 0, 1,
-0.838588, 0.5791963, 1.279134, 0.6666667, 1, 0, 1,
-0.8376828, -0.07515582, -1.805094, 0.6627451, 1, 0, 1,
-0.836709, -1.634664, -2.919333, 0.654902, 1, 0, 1,
-0.8364503, 1.014427, -0.1815126, 0.6509804, 1, 0, 1,
-0.8357997, -1.055424, -2.256623, 0.6431373, 1, 0, 1,
-0.8276794, -2.285647, -2.473624, 0.6392157, 1, 0, 1,
-0.8264992, 0.7012571, -0.3896536, 0.6313726, 1, 0, 1,
-0.8253683, 0.02606332, -1.919839, 0.627451, 1, 0, 1,
-0.8238569, -0.8914824, -1.069596, 0.6196079, 1, 0, 1,
-0.8189806, 0.6386421, -0.5924286, 0.6156863, 1, 0, 1,
-0.8091753, 0.3901507, -1.550436, 0.6078432, 1, 0, 1,
-0.8080592, -1.401802, -3.601702, 0.6039216, 1, 0, 1,
-0.8080348, -0.158152, -2.1612, 0.5960785, 1, 0, 1,
-0.801899, -1.184043, -1.746915, 0.5882353, 1, 0, 1,
-0.7972367, 0.6588854, -2.091934, 0.5843138, 1, 0, 1,
-0.786329, 1.503426, -1.476246, 0.5764706, 1, 0, 1,
-0.7857462, -0.3580879, -0.7730361, 0.572549, 1, 0, 1,
-0.7731439, 0.2210884, -0.5866511, 0.5647059, 1, 0, 1,
-0.765749, -1.04656, -1.570614, 0.5607843, 1, 0, 1,
-0.750831, 0.06005192, -1.609723, 0.5529412, 1, 0, 1,
-0.7448896, -1.78966, -3.299476, 0.5490196, 1, 0, 1,
-0.7402827, -1.441375, -2.191905, 0.5411765, 1, 0, 1,
-0.7382181, 1.10958, -0.5111436, 0.5372549, 1, 0, 1,
-0.7333511, -0.3210535, -1.559734, 0.5294118, 1, 0, 1,
-0.7308776, 0.5555847, -0.2233611, 0.5254902, 1, 0, 1,
-0.7268237, -0.1802276, -2.732816, 0.5176471, 1, 0, 1,
-0.7233174, 0.3349309, 0.0800993, 0.5137255, 1, 0, 1,
-0.7174631, -1.200466, -4.329201, 0.5058824, 1, 0, 1,
-0.7163911, 0.001331642, -3.903251, 0.5019608, 1, 0, 1,
-0.7150135, -0.04264359, -1.525196, 0.4941176, 1, 0, 1,
-0.7130139, 1.136893, -0.006067882, 0.4862745, 1, 0, 1,
-0.7118296, -0.1803224, -0.9938715, 0.4823529, 1, 0, 1,
-0.7115431, 0.4244826, -1.169009, 0.4745098, 1, 0, 1,
-0.7107589, 0.846289, -1.175606, 0.4705882, 1, 0, 1,
-0.7095746, -1.449438, -0.6979008, 0.4627451, 1, 0, 1,
-0.7049357, -0.7273668, -0.0240227, 0.4588235, 1, 0, 1,
-0.7047305, 1.205365, -0.6576993, 0.4509804, 1, 0, 1,
-0.7018784, 0.5333599, -1.837914, 0.4470588, 1, 0, 1,
-0.7005157, 0.3154531, -0.9093333, 0.4392157, 1, 0, 1,
-0.6966544, 1.717387, -1.587086, 0.4352941, 1, 0, 1,
-0.6866133, -0.02576928, 0.2355978, 0.427451, 1, 0, 1,
-0.6812921, -0.3511513, -1.529571, 0.4235294, 1, 0, 1,
-0.6778983, 0.6363021, -2.133949, 0.4156863, 1, 0, 1,
-0.6775002, 0.4904367, 1.421291, 0.4117647, 1, 0, 1,
-0.6745894, -1.428889, -2.542629, 0.4039216, 1, 0, 1,
-0.6731341, -0.3441463, -2.440076, 0.3960784, 1, 0, 1,
-0.6709111, -1.22373, -1.192613, 0.3921569, 1, 0, 1,
-0.6687837, 0.3579739, -0.516125, 0.3843137, 1, 0, 1,
-0.665773, 0.1558204, -2.156099, 0.3803922, 1, 0, 1,
-0.6619771, 0.01666548, -1.068767, 0.372549, 1, 0, 1,
-0.661718, 0.9481015, -0.7440355, 0.3686275, 1, 0, 1,
-0.6591084, -0.6215392, -2.100757, 0.3607843, 1, 0, 1,
-0.6577203, -1.751167, -2.353437, 0.3568628, 1, 0, 1,
-0.6480212, -1.373364, -2.737614, 0.3490196, 1, 0, 1,
-0.6458676, -0.1082509, -1.078802, 0.345098, 1, 0, 1,
-0.6457061, -0.4167041, -1.255224, 0.3372549, 1, 0, 1,
-0.6455849, 0.2030945, -1.767578, 0.3333333, 1, 0, 1,
-0.6436717, 0.2595422, -0.8177373, 0.3254902, 1, 0, 1,
-0.6411271, 1.029187, 0.01113911, 0.3215686, 1, 0, 1,
-0.639137, 0.5120373, -0.2290157, 0.3137255, 1, 0, 1,
-0.6337787, 0.6014003, -0.268818, 0.3098039, 1, 0, 1,
-0.6289949, -0.4639786, -3.533777, 0.3019608, 1, 0, 1,
-0.6271427, 0.2187552, -1.379562, 0.2941177, 1, 0, 1,
-0.6270236, -0.5232852, -2.452769, 0.2901961, 1, 0, 1,
-0.6230179, -0.1889726, -1.242345, 0.282353, 1, 0, 1,
-0.6224018, -0.2071187, -1.936144, 0.2784314, 1, 0, 1,
-0.6154934, -0.4349337, -2.086007, 0.2705882, 1, 0, 1,
-0.6065196, 1.883766, 0.08897355, 0.2666667, 1, 0, 1,
-0.5985981, 0.298077, -1.953568, 0.2588235, 1, 0, 1,
-0.5964262, 0.4413677, -2.413049, 0.254902, 1, 0, 1,
-0.5962657, -0.4309337, -1.851562, 0.2470588, 1, 0, 1,
-0.5929545, 0.4238276, -0.9771289, 0.2431373, 1, 0, 1,
-0.5810741, 0.7113386, -1.024069, 0.2352941, 1, 0, 1,
-0.5793222, -0.01824297, -0.4329477, 0.2313726, 1, 0, 1,
-0.5788289, -0.4716557, -3.267591, 0.2235294, 1, 0, 1,
-0.5747271, 0.6230919, 0.7791148, 0.2196078, 1, 0, 1,
-0.5656278, -0.1767309, -0.4980471, 0.2117647, 1, 0, 1,
-0.563139, -1.660668, -2.851884, 0.2078431, 1, 0, 1,
-0.5617783, 0.7360781, -2.723642, 0.2, 1, 0, 1,
-0.5587958, 2.329464, -1.452517, 0.1921569, 1, 0, 1,
-0.5583214, -0.4515099, -2.969004, 0.1882353, 1, 0, 1,
-0.5579894, -0.4472797, -1.177539, 0.1803922, 1, 0, 1,
-0.5465893, 0.2464586, 1.386888, 0.1764706, 1, 0, 1,
-0.5439722, -1.743978, -2.40176, 0.1686275, 1, 0, 1,
-0.5436323, -1.96894, -2.624796, 0.1647059, 1, 0, 1,
-0.5435421, 0.3998483, -0.6322975, 0.1568628, 1, 0, 1,
-0.5392503, 3.251692, -2.458769, 0.1529412, 1, 0, 1,
-0.5390348, 0.1012351, -1.843541, 0.145098, 1, 0, 1,
-0.5332731, -0.8398182, -1.378683, 0.1411765, 1, 0, 1,
-0.5320216, -1.043773, -1.75003, 0.1333333, 1, 0, 1,
-0.5318926, -0.2301799, -1.182474, 0.1294118, 1, 0, 1,
-0.5303586, -0.555106, -1.17028, 0.1215686, 1, 0, 1,
-0.5263099, -0.7843918, -3.244462, 0.1176471, 1, 0, 1,
-0.5261012, 0.06477384, -1.914094, 0.1098039, 1, 0, 1,
-0.5245441, 0.6413904, -0.4221097, 0.1058824, 1, 0, 1,
-0.5241215, -1.175777, -3.329681, 0.09803922, 1, 0, 1,
-0.5224335, 0.4655574, -0.01357466, 0.09019608, 1, 0, 1,
-0.5206653, -0.6522951, -2.458811, 0.08627451, 1, 0, 1,
-0.5143642, 1.142213, 0.006964198, 0.07843138, 1, 0, 1,
-0.5097542, 0.1659197, -1.788301, 0.07450981, 1, 0, 1,
-0.5073975, -0.5269725, -3.351624, 0.06666667, 1, 0, 1,
-0.505872, 0.119868, -3.12214, 0.0627451, 1, 0, 1,
-0.5015844, -0.3667406, -2.368885, 0.05490196, 1, 0, 1,
-0.4988325, 0.3268542, -2.59032, 0.05098039, 1, 0, 1,
-0.497683, -1.401387, -3.286071, 0.04313726, 1, 0, 1,
-0.4966175, 2.674787, -1.50958, 0.03921569, 1, 0, 1,
-0.4956849, -0.1421474, -0.8511773, 0.03137255, 1, 0, 1,
-0.49561, -0.1134106, -0.5853599, 0.02745098, 1, 0, 1,
-0.4953641, 0.6016145, -0.9820853, 0.01960784, 1, 0, 1,
-0.4915905, 0.4572357, -0.7820476, 0.01568628, 1, 0, 1,
-0.4873935, 0.6744009, 0.9040011, 0.007843138, 1, 0, 1,
-0.4854696, -1.590347, -3.281646, 0.003921569, 1, 0, 1,
-0.4779171, 0.2384127, 1.052687, 0, 1, 0.003921569, 1,
-0.4766788, 0.6017326, -0.1485005, 0, 1, 0.01176471, 1,
-0.4759624, -1.28121, -4.721561, 0, 1, 0.01568628, 1,
-0.4752604, -0.09757578, -1.051809, 0, 1, 0.02352941, 1,
-0.4735341, 1.375198, -1.798252, 0, 1, 0.02745098, 1,
-0.4695304, 0.8595557, -0.1783291, 0, 1, 0.03529412, 1,
-0.4686737, -1.32867, -2.03551, 0, 1, 0.03921569, 1,
-0.4666007, 0.1793595, 0.5577009, 0, 1, 0.04705882, 1,
-0.4664008, 0.9233799, 1.094875, 0, 1, 0.05098039, 1,
-0.4660386, -0.08962171, -2.335397, 0, 1, 0.05882353, 1,
-0.4611206, -1.40353, -2.894409, 0, 1, 0.0627451, 1,
-0.4604234, 0.3373633, -2.164116, 0, 1, 0.07058824, 1,
-0.4601527, 1.006883, 1.243842, 0, 1, 0.07450981, 1,
-0.4587232, 0.02316037, -2.403981, 0, 1, 0.08235294, 1,
-0.4574184, 0.2038903, -0.4919877, 0, 1, 0.08627451, 1,
-0.4546658, 0.963405, -0.6470709, 0, 1, 0.09411765, 1,
-0.4516532, -0.3704704, -3.909242, 0, 1, 0.1019608, 1,
-0.4505171, 2.444854, -2.40963, 0, 1, 0.1058824, 1,
-0.4461854, 0.7903969, -0.3144338, 0, 1, 0.1137255, 1,
-0.4460526, -0.4170947, -4.015785, 0, 1, 0.1176471, 1,
-0.4445789, 0.872392, -1.035235, 0, 1, 0.1254902, 1,
-0.44115, -0.6002162, -0.9045413, 0, 1, 0.1294118, 1,
-0.4408269, 0.9944553, 1.408552, 0, 1, 0.1372549, 1,
-0.439614, 0.8657648, 0.1665527, 0, 1, 0.1411765, 1,
-0.439187, -0.560496, -2.960105, 0, 1, 0.1490196, 1,
-0.4384052, -1.044343, -3.699326, 0, 1, 0.1529412, 1,
-0.437624, 0.4156437, -0.976963, 0, 1, 0.1607843, 1,
-0.4357876, -0.1215729, -0.0641866, 0, 1, 0.1647059, 1,
-0.4331573, 0.6376113, -0.4664111, 0, 1, 0.172549, 1,
-0.4232465, 0.7518948, 0.08671597, 0, 1, 0.1764706, 1,
-0.4185072, -1.655547, -3.2264, 0, 1, 0.1843137, 1,
-0.4164432, -0.1098868, -1.474772, 0, 1, 0.1882353, 1,
-0.4161117, -1.171128, -2.266292, 0, 1, 0.1960784, 1,
-0.4055074, -2.333178, -3.869531, 0, 1, 0.2039216, 1,
-0.4014474, -2.613773, -4.114461, 0, 1, 0.2078431, 1,
-0.4005438, -2.657578, -3.861235, 0, 1, 0.2156863, 1,
-0.3974181, 1.72741, 0.2629056, 0, 1, 0.2196078, 1,
-0.3947841, -0.1669081, -2.794454, 0, 1, 0.227451, 1,
-0.3933589, 1.181024, 0.6822796, 0, 1, 0.2313726, 1,
-0.3891475, 1.645323, -0.9799818, 0, 1, 0.2392157, 1,
-0.3874384, 1.991359, -1.290429, 0, 1, 0.2431373, 1,
-0.3873793, -1.32679, -2.828017, 0, 1, 0.2509804, 1,
-0.3860447, -1.383445, -3.914418, 0, 1, 0.254902, 1,
-0.3839238, 0.4108321, -1.313118, 0, 1, 0.2627451, 1,
-0.3806387, 0.9392252, -0.0968916, 0, 1, 0.2666667, 1,
-0.3776079, -0.8024038, -4.059545, 0, 1, 0.2745098, 1,
-0.3753701, -0.1412591, -1.7181, 0, 1, 0.2784314, 1,
-0.3747233, 1.863885, -0.8078915, 0, 1, 0.2862745, 1,
-0.3657224, -0.486451, -2.969357, 0, 1, 0.2901961, 1,
-0.3633042, -0.1277997, -3.126049, 0, 1, 0.2980392, 1,
-0.3588964, -0.9918337, -3.379239, 0, 1, 0.3058824, 1,
-0.3575332, 0.9544796, 0.2340833, 0, 1, 0.3098039, 1,
-0.3564098, 0.3797585, 1.362189, 0, 1, 0.3176471, 1,
-0.3552083, 1.094753, 1.773428, 0, 1, 0.3215686, 1,
-0.3489851, -0.6706582, -2.81435, 0, 1, 0.3294118, 1,
-0.3445116, -1.128902, -3.30377, 0, 1, 0.3333333, 1,
-0.343709, 0.4084872, -1.543097, 0, 1, 0.3411765, 1,
-0.3433919, 1.502771, -2.532964, 0, 1, 0.345098, 1,
-0.3414034, 1.742685, 0.2986515, 0, 1, 0.3529412, 1,
-0.3398167, 0.1212904, -1.501361, 0, 1, 0.3568628, 1,
-0.3390526, 0.7112045, -0.3294309, 0, 1, 0.3647059, 1,
-0.3361481, -0.4556573, -2.092166, 0, 1, 0.3686275, 1,
-0.333587, -0.6081069, -3.843637, 0, 1, 0.3764706, 1,
-0.3329569, 0.4927087, 0.2654364, 0, 1, 0.3803922, 1,
-0.32643, -0.5668889, -1.887757, 0, 1, 0.3882353, 1,
-0.3249094, -1.262758, -3.24289, 0, 1, 0.3921569, 1,
-0.3202397, 0.151453, -2.067692, 0, 1, 0.4, 1,
-0.319114, -0.9812397, -2.041481, 0, 1, 0.4078431, 1,
-0.3179442, 0.757286, 0.04935265, 0, 1, 0.4117647, 1,
-0.3134845, 1.303618, 0.008852183, 0, 1, 0.4196078, 1,
-0.3125817, 0.2896158, -0.6243736, 0, 1, 0.4235294, 1,
-0.3125554, -0.7024772, -2.847262, 0, 1, 0.4313726, 1,
-0.312359, 1.114222, 0.3200986, 0, 1, 0.4352941, 1,
-0.3082203, -1.302554, -2.463835, 0, 1, 0.4431373, 1,
-0.3052877, -1.112017, -3.376283, 0, 1, 0.4470588, 1,
-0.3008049, -1.131453, -3.10995, 0, 1, 0.454902, 1,
-0.2941233, -1.719582, -2.956374, 0, 1, 0.4588235, 1,
-0.2940474, 0.3846047, -1.465019, 0, 1, 0.4666667, 1,
-0.2875344, 0.4225295, -1.047978, 0, 1, 0.4705882, 1,
-0.2812037, -0.7433314, -3.446418, 0, 1, 0.4784314, 1,
-0.2761695, -0.9924067, -3.249729, 0, 1, 0.4823529, 1,
-0.2739903, 0.4619499, -1.073107, 0, 1, 0.4901961, 1,
-0.271594, -0.7096525, -3.68849, 0, 1, 0.4941176, 1,
-0.2695118, -0.01508714, -2.408036, 0, 1, 0.5019608, 1,
-0.2688603, -0.4567694, -3.493888, 0, 1, 0.509804, 1,
-0.2688514, 0.1501775, -1.061937, 0, 1, 0.5137255, 1,
-0.263836, 0.6718214, -0.2325352, 0, 1, 0.5215687, 1,
-0.2637171, 1.801946, -0.5604263, 0, 1, 0.5254902, 1,
-0.2630439, -1.981818, -3.881794, 0, 1, 0.5333334, 1,
-0.2627604, -0.2545709, -1.415327, 0, 1, 0.5372549, 1,
-0.2626462, 1.300032, -0.3969981, 0, 1, 0.5450981, 1,
-0.2610826, -0.6819222, -1.28422, 0, 1, 0.5490196, 1,
-0.2529204, 0.3043211, -0.5418724, 0, 1, 0.5568628, 1,
-0.2511378, -0.7417667, -1.562322, 0, 1, 0.5607843, 1,
-0.247476, -1.556286, -3.444077, 0, 1, 0.5686275, 1,
-0.2411775, 0.4660209, 0.1310426, 0, 1, 0.572549, 1,
-0.2382723, -0.1223939, -1.749997, 0, 1, 0.5803922, 1,
-0.2364137, -0.6173727, -2.251755, 0, 1, 0.5843138, 1,
-0.2348724, -0.3522846, -2.311752, 0, 1, 0.5921569, 1,
-0.2311885, -1.079757, -3.194444, 0, 1, 0.5960785, 1,
-0.2250745, 0.05118507, -0.8776847, 0, 1, 0.6039216, 1,
-0.2186464, -0.3027535, -2.868566, 0, 1, 0.6117647, 1,
-0.2163386, -1.202671, -2.729402, 0, 1, 0.6156863, 1,
-0.2142922, -0.2073532, -1.177596, 0, 1, 0.6235294, 1,
-0.2124513, -1.369492, -4.040781, 0, 1, 0.627451, 1,
-0.2109689, -0.2852872, -1.389295, 0, 1, 0.6352941, 1,
-0.2056606, 1.079721, -1.332802, 0, 1, 0.6392157, 1,
-0.1923562, 0.8768178, -0.8920671, 0, 1, 0.6470588, 1,
-0.1901458, -0.6275055, -0.9674665, 0, 1, 0.6509804, 1,
-0.1885169, -0.6235026, -3.235328, 0, 1, 0.6588235, 1,
-0.1859531, 0.3972566, -0.7080703, 0, 1, 0.6627451, 1,
-0.1856395, 0.3497977, -1.414184, 0, 1, 0.6705883, 1,
-0.1823758, -2.000041, -2.724228, 0, 1, 0.6745098, 1,
-0.1813501, -0.4903111, -3.023307, 0, 1, 0.682353, 1,
-0.1777469, 0.7958178, -1.549734, 0, 1, 0.6862745, 1,
-0.1762669, -1.675542, -3.245509, 0, 1, 0.6941177, 1,
-0.1752982, 0.2691892, -1.004385, 0, 1, 0.7019608, 1,
-0.1747307, -0.3325923, -1.634894, 0, 1, 0.7058824, 1,
-0.1746665, 0.481874, 0.00967459, 0, 1, 0.7137255, 1,
-0.165924, 0.5623171, -0.1787612, 0, 1, 0.7176471, 1,
-0.162966, -0.116508, -1.866724, 0, 1, 0.7254902, 1,
-0.1626608, 0.6451112, 0.04521124, 0, 1, 0.7294118, 1,
-0.1613402, 0.05130225, -1.626745, 0, 1, 0.7372549, 1,
-0.1609396, 0.4569421, -0.9151006, 0, 1, 0.7411765, 1,
-0.1608942, 1.204235, 1.144576, 0, 1, 0.7490196, 1,
-0.1584179, -0.1995988, -3.245343, 0, 1, 0.7529412, 1,
-0.1553799, 1.497947, 0.8600247, 0, 1, 0.7607843, 1,
-0.1513404, 0.6217803, -0.854612, 0, 1, 0.7647059, 1,
-0.1504759, 0.1365167, 1.904951, 0, 1, 0.772549, 1,
-0.1490785, -0.2794308, -2.059384, 0, 1, 0.7764706, 1,
-0.149024, 0.6599777, -0.4468426, 0, 1, 0.7843137, 1,
-0.1470805, 0.4759589, 1.064404, 0, 1, 0.7882353, 1,
-0.1430505, -0.761484, -2.058675, 0, 1, 0.7960784, 1,
-0.1412354, -1.992793, -3.10535, 0, 1, 0.8039216, 1,
-0.1398741, 0.03847645, -1.439672, 0, 1, 0.8078431, 1,
-0.1358408, -0.2175504, -3.819471, 0, 1, 0.8156863, 1,
-0.1354009, 1.068804, -1.061494, 0, 1, 0.8196079, 1,
-0.1346415, -0.4572575, -5.241077, 0, 1, 0.827451, 1,
-0.1336227, -0.4819872, -0.8531668, 0, 1, 0.8313726, 1,
-0.1243609, 0.0457548, -1.557775, 0, 1, 0.8392157, 1,
-0.1229668, 0.2073055, -0.5777668, 0, 1, 0.8431373, 1,
-0.1197347, -0.5150101, -3.327922, 0, 1, 0.8509804, 1,
-0.1192463, -1.129646, -1.978831, 0, 1, 0.854902, 1,
-0.1170666, 0.2679988, -0.6791875, 0, 1, 0.8627451, 1,
-0.1169893, -1.256699, -3.325112, 0, 1, 0.8666667, 1,
-0.1165164, -0.7586316, -3.205992, 0, 1, 0.8745098, 1,
-0.1111928, -0.1604459, -3.703435, 0, 1, 0.8784314, 1,
-0.1093906, 0.1383477, -0.4965383, 0, 1, 0.8862745, 1,
-0.1067334, -0.09604869, -3.694711, 0, 1, 0.8901961, 1,
-0.1032946, 0.6695417, 1.096083, 0, 1, 0.8980392, 1,
-0.1014421, -0.8911638, -1.885085, 0, 1, 0.9058824, 1,
-0.1005801, -0.5023052, -3.009631, 0, 1, 0.9098039, 1,
-0.09643641, -0.3379336, -2.384678, 0, 1, 0.9176471, 1,
-0.09425214, -0.1556409, -2.996033, 0, 1, 0.9215686, 1,
-0.08584254, -0.4113362, -4.285275, 0, 1, 0.9294118, 1,
-0.08496111, 1.209048, -1.807684, 0, 1, 0.9333333, 1,
-0.08091132, 0.2104926, -0.3661012, 0, 1, 0.9411765, 1,
-0.08081122, -0.8438306, -2.833815, 0, 1, 0.945098, 1,
-0.07923301, 0.6522292, -0.05894514, 0, 1, 0.9529412, 1,
-0.06831897, -1.170224, -4.10096, 0, 1, 0.9568627, 1,
-0.06419621, -3.627036, -3.750898, 0, 1, 0.9647059, 1,
-0.06121405, -0.6872956, -2.244691, 0, 1, 0.9686275, 1,
-0.05940888, 0.1725066, 0.6733418, 0, 1, 0.9764706, 1,
-0.05618723, -1.966503, -2.03099, 0, 1, 0.9803922, 1,
-0.05528086, 1.226448, 0.01507824, 0, 1, 0.9882353, 1,
-0.05467284, 0.2110661, 0.3885902, 0, 1, 0.9921569, 1,
-0.05178445, -0.6662166, -3.887743, 0, 1, 1, 1,
-0.04997195, -2.162311, -2.442421, 0, 0.9921569, 1, 1,
-0.04877866, -0.5981442, -1.783957, 0, 0.9882353, 1, 1,
-0.04786004, -0.07338702, -2.929479, 0, 0.9803922, 1, 1,
-0.04784262, 1.365822, -0.3849761, 0, 0.9764706, 1, 1,
-0.04769017, -0.481, -3.127445, 0, 0.9686275, 1, 1,
-0.0460316, 1.262193, -0.7943806, 0, 0.9647059, 1, 1,
-0.04335202, 1.633747, 0.1414196, 0, 0.9568627, 1, 1,
-0.04100389, -0.1329593, -2.09628, 0, 0.9529412, 1, 1,
-0.04064339, -0.4151948, -4.652876, 0, 0.945098, 1, 1,
-0.03977675, -0.03425528, -2.826296, 0, 0.9411765, 1, 1,
-0.03928991, -0.8406534, -3.240777, 0, 0.9333333, 1, 1,
-0.03814753, 0.1136399, -0.5701054, 0, 0.9294118, 1, 1,
-0.03601044, 0.5271269, -0.7372156, 0, 0.9215686, 1, 1,
-0.03470218, 0.2853518, -0.07221919, 0, 0.9176471, 1, 1,
-0.02880806, -0.05074372, -1.922395, 0, 0.9098039, 1, 1,
-0.02539187, 2.949276, 0.2653571, 0, 0.9058824, 1, 1,
-0.02297551, 0.2033475, -0.3703589, 0, 0.8980392, 1, 1,
-0.02086015, 1.539406, 0.8087648, 0, 0.8901961, 1, 1,
-0.01816974, -0.06661425, -4.444141, 0, 0.8862745, 1, 1,
-0.01812267, -1.622604, -3.347713, 0, 0.8784314, 1, 1,
-0.01777996, 0.2154036, -0.4702152, 0, 0.8745098, 1, 1,
-0.01768452, -1.098867, -3.813041, 0, 0.8666667, 1, 1,
-0.01655624, 1.399774, 0.01333441, 0, 0.8627451, 1, 1,
-0.01491194, 0.3259703, 0.9782078, 0, 0.854902, 1, 1,
-0.01107157, 0.6907594, -1.233592, 0, 0.8509804, 1, 1,
-0.00993961, 0.4408098, -0.8742164, 0, 0.8431373, 1, 1,
-0.009746318, -0.1821422, -2.634598, 0, 0.8392157, 1, 1,
-0.005043025, 0.2988719, 0.06402297, 0, 0.8313726, 1, 1,
-0.002034973, 0.1065744, -2.037437, 0, 0.827451, 1, 1,
-0.0006113724, -0.5275456, -3.744308, 0, 0.8196079, 1, 1,
3.005483e-07, -0.4242423, 3.322814, 0, 0.8156863, 1, 1,
0.004462829, 0.502053, -0.4445956, 0, 0.8078431, 1, 1,
0.006193949, 0.1578639, -0.7136489, 0, 0.8039216, 1, 1,
0.01149318, 1.232778, 0.2084759, 0, 0.7960784, 1, 1,
0.0143081, 0.3433672, 0.8271754, 0, 0.7882353, 1, 1,
0.01507449, -1.097045, 1.01237, 0, 0.7843137, 1, 1,
0.01557227, -0.1850959, 3.144609, 0, 0.7764706, 1, 1,
0.02018907, -1.278104, 3.179456, 0, 0.772549, 1, 1,
0.02133887, 0.1793953, 0.06886692, 0, 0.7647059, 1, 1,
0.02550956, -0.9236743, 1.906273, 0, 0.7607843, 1, 1,
0.02894552, -0.9723058, 2.550514, 0, 0.7529412, 1, 1,
0.0343884, -0.2353085, 1.784252, 0, 0.7490196, 1, 1,
0.04108011, -0.1023801, 4.773404, 0, 0.7411765, 1, 1,
0.04212931, -0.6464451, 2.72878, 0, 0.7372549, 1, 1,
0.04341634, -0.3732748, 3.126216, 0, 0.7294118, 1, 1,
0.04801526, 1.247628, -0.1696378, 0, 0.7254902, 1, 1,
0.05032811, -0.3344429, 4.070501, 0, 0.7176471, 1, 1,
0.05447394, 0.671595, 0.4497864, 0, 0.7137255, 1, 1,
0.05633313, -0.8185369, 2.357162, 0, 0.7058824, 1, 1,
0.05771459, -0.5491915, 2.575416, 0, 0.6980392, 1, 1,
0.06534347, 0.6431719, 2.013307, 0, 0.6941177, 1, 1,
0.06626576, 0.3976981, 0.5387904, 0, 0.6862745, 1, 1,
0.06720231, -0.6097026, 2.08543, 0, 0.682353, 1, 1,
0.06844912, -0.4501081, 2.372698, 0, 0.6745098, 1, 1,
0.06971052, 0.3811014, -0.08400477, 0, 0.6705883, 1, 1,
0.07001016, -1.323399, 3.014631, 0, 0.6627451, 1, 1,
0.07014337, -1.811949, 2.700446, 0, 0.6588235, 1, 1,
0.07670484, 0.07149328, -0.4315712, 0, 0.6509804, 1, 1,
0.07736658, 0.01430427, 0.8460367, 0, 0.6470588, 1, 1,
0.07898118, 0.8036509, -0.9060658, 0, 0.6392157, 1, 1,
0.07953514, 1.658365, 0.5238709, 0, 0.6352941, 1, 1,
0.08100763, -0.814556, 1.714523, 0, 0.627451, 1, 1,
0.0861285, -0.1271896, 3.694525, 0, 0.6235294, 1, 1,
0.08753865, 0.4979115, 1.707531, 0, 0.6156863, 1, 1,
0.08790104, -0.2121311, 1.930781, 0, 0.6117647, 1, 1,
0.09902526, 0.1251366, 1.885248, 0, 0.6039216, 1, 1,
0.1005207, 0.600722, 1.046325, 0, 0.5960785, 1, 1,
0.1024173, 0.5039489, 0.8125045, 0, 0.5921569, 1, 1,
0.1096257, -0.4246905, 3.099724, 0, 0.5843138, 1, 1,
0.1104361, -1.60274, 3.472054, 0, 0.5803922, 1, 1,
0.1104364, 0.2545799, -0.8118693, 0, 0.572549, 1, 1,
0.113354, -0.002126432, 1.185883, 0, 0.5686275, 1, 1,
0.1172851, 0.101348, 0.7270068, 0, 0.5607843, 1, 1,
0.1173812, 0.330592, 1.72095, 0, 0.5568628, 1, 1,
0.1177516, -1.411839, 3.090987, 0, 0.5490196, 1, 1,
0.1199834, 1.370806, 0.03558034, 0, 0.5450981, 1, 1,
0.1244948, -0.02494495, 1.831082, 0, 0.5372549, 1, 1,
0.1334712, -0.6547085, 2.809072, 0, 0.5333334, 1, 1,
0.1344018, -1.131451, 2.470377, 0, 0.5254902, 1, 1,
0.1376243, 0.6280453, -0.2317099, 0, 0.5215687, 1, 1,
0.1380168, 0.6884674, 1.130572, 0, 0.5137255, 1, 1,
0.1412702, 0.8914017, 0.9408242, 0, 0.509804, 1, 1,
0.1446119, -0.6442661, 1.065282, 0, 0.5019608, 1, 1,
0.1501956, -1.987301, 1.04236, 0, 0.4941176, 1, 1,
0.1504907, 1.054943, -1.104599, 0, 0.4901961, 1, 1,
0.1526257, -1.046216, 3.773299, 0, 0.4823529, 1, 1,
0.1676495, 0.8231578, 1.490527, 0, 0.4784314, 1, 1,
0.1681201, 1.464635, -0.4026494, 0, 0.4705882, 1, 1,
0.1714738, 0.6627614, -0.3052044, 0, 0.4666667, 1, 1,
0.181208, -0.4700298, 3.229169, 0, 0.4588235, 1, 1,
0.1822353, -0.4264316, 2.010081, 0, 0.454902, 1, 1,
0.1873053, -0.4736356, 1.437791, 0, 0.4470588, 1, 1,
0.1941981, -0.1936251, 2.961392, 0, 0.4431373, 1, 1,
0.195418, 0.8353621, 1.112361, 0, 0.4352941, 1, 1,
0.1992129, 0.09508226, 0.9496939, 0, 0.4313726, 1, 1,
0.1996049, -1.205242, 3.648389, 0, 0.4235294, 1, 1,
0.2045662, 0.1469484, 0.1791883, 0, 0.4196078, 1, 1,
0.2049738, 1.147838, 0.5110635, 0, 0.4117647, 1, 1,
0.2050919, -0.3711835, 1.676372, 0, 0.4078431, 1, 1,
0.2059429, 0.6915062, -1.040814, 0, 0.4, 1, 1,
0.2061131, 1.199478, 2.107297, 0, 0.3921569, 1, 1,
0.2072395, 0.1856053, 1.862016, 0, 0.3882353, 1, 1,
0.2083322, -0.495978, 2.773057, 0, 0.3803922, 1, 1,
0.2099015, -0.5114954, 3.914966, 0, 0.3764706, 1, 1,
0.2169527, -0.008644832, 0.7536426, 0, 0.3686275, 1, 1,
0.2216387, 0.822661, -1.289806, 0, 0.3647059, 1, 1,
0.224266, -0.702262, 4.320173, 0, 0.3568628, 1, 1,
0.2248419, -0.1656774, 2.189131, 0, 0.3529412, 1, 1,
0.2268124, 1.278633, -1.162942, 0, 0.345098, 1, 1,
0.2310508, 0.7048127, -1.051459, 0, 0.3411765, 1, 1,
0.231235, -0.7428346, 1.754282, 0, 0.3333333, 1, 1,
0.2326992, -0.3895335, 2.151061, 0, 0.3294118, 1, 1,
0.2361593, -1.018558, 1.775584, 0, 0.3215686, 1, 1,
0.24291, -0.4485092, 2.32342, 0, 0.3176471, 1, 1,
0.247038, -0.506436, 3.440585, 0, 0.3098039, 1, 1,
0.2517588, 1.904903, -0.6623634, 0, 0.3058824, 1, 1,
0.2540746, -0.2955875, 4.192783, 0, 0.2980392, 1, 1,
0.2563013, 2.175594, -0.6513265, 0, 0.2901961, 1, 1,
0.2592241, 1.672311, -0.2701155, 0, 0.2862745, 1, 1,
0.2598277, -0.8205879, 2.103368, 0, 0.2784314, 1, 1,
0.2648996, -0.54122, 1.99646, 0, 0.2745098, 1, 1,
0.2695137, 0.1817163, 2.29653, 0, 0.2666667, 1, 1,
0.2705273, 0.06359886, 1.238303, 0, 0.2627451, 1, 1,
0.2713123, -0.5175528, 4.949797, 0, 0.254902, 1, 1,
0.2719482, 1.041173, 0.5746664, 0, 0.2509804, 1, 1,
0.2735071, -1.634022, 2.286443, 0, 0.2431373, 1, 1,
0.2754579, -0.2621222, 3.066526, 0, 0.2392157, 1, 1,
0.2790903, -1.971917, 4.818571, 0, 0.2313726, 1, 1,
0.2860953, 0.2674561, 1.334576, 0, 0.227451, 1, 1,
0.2867534, -0.05848637, 2.088128, 0, 0.2196078, 1, 1,
0.2901043, -0.501052, 3.026316, 0, 0.2156863, 1, 1,
0.2940576, 1.205707, -0.4754014, 0, 0.2078431, 1, 1,
0.3029201, -2.039711, 3.373536, 0, 0.2039216, 1, 1,
0.3054498, -0.4675208, 1.761667, 0, 0.1960784, 1, 1,
0.3063761, -0.1574125, 1.86555, 0, 0.1882353, 1, 1,
0.3111058, 1.243051, 0.05129099, 0, 0.1843137, 1, 1,
0.314548, 1.280116, -1.930278, 0, 0.1764706, 1, 1,
0.3148574, -0.5249527, 3.076412, 0, 0.172549, 1, 1,
0.3155741, 0.9821212, -2.038105, 0, 0.1647059, 1, 1,
0.3187537, 2.486518, 0.6616446, 0, 0.1607843, 1, 1,
0.3240231, -0.4151268, 2.74376, 0, 0.1529412, 1, 1,
0.325714, 1.664919, -0.481524, 0, 0.1490196, 1, 1,
0.3286946, -0.2014477, 2.33093, 0, 0.1411765, 1, 1,
0.332693, 0.7501453, -1.946016, 0, 0.1372549, 1, 1,
0.336872, 0.3073565, -0.6829618, 0, 0.1294118, 1, 1,
0.3378325, -0.5519572, 1.155512, 0, 0.1254902, 1, 1,
0.3379345, 1.033921, 0.2771167, 0, 0.1176471, 1, 1,
0.3391835, 1.226362, 0.06202748, 0, 0.1137255, 1, 1,
0.3394366, 0.3937136, 0.6906858, 0, 0.1058824, 1, 1,
0.3407424, 0.6535332, 0.9689133, 0, 0.09803922, 1, 1,
0.3416753, -1.856132, 0.8854695, 0, 0.09411765, 1, 1,
0.342051, -1.389566, 2.614578, 0, 0.08627451, 1, 1,
0.3449864, -1.63313, 3.275015, 0, 0.08235294, 1, 1,
0.3472795, -0.04101058, 2.200168, 0, 0.07450981, 1, 1,
0.3525942, 1.506542, -0.1502471, 0, 0.07058824, 1, 1,
0.361308, 0.297174, 0.2705076, 0, 0.0627451, 1, 1,
0.3633675, -0.2674569, 1.430547, 0, 0.05882353, 1, 1,
0.3652422, 0.2908988, -0.5685968, 0, 0.05098039, 1, 1,
0.3676201, 1.11627, 2.484195, 0, 0.04705882, 1, 1,
0.3682487, -0.05740179, 1.498942, 0, 0.03921569, 1, 1,
0.3767545, 1.896739, 0.2753848, 0, 0.03529412, 1, 1,
0.3775339, -1.59884, 3.007936, 0, 0.02745098, 1, 1,
0.3838044, -0.789223, 4.311877, 0, 0.02352941, 1, 1,
0.3842091, 0.1725163, 1.028101, 0, 0.01568628, 1, 1,
0.3857597, 1.138473, -0.186447, 0, 0.01176471, 1, 1,
0.385797, 2.736473, 1.374631, 0, 0.003921569, 1, 1,
0.3919615, 0.003817185, 1.323707, 0.003921569, 0, 1, 1,
0.4024486, 1.732145, -1.304159, 0.007843138, 0, 1, 1,
0.4070691, 1.639412, 1.141929, 0.01568628, 0, 1, 1,
0.4078574, 0.3480543, 1.897759, 0.01960784, 0, 1, 1,
0.4087089, 0.2259446, 0.3480064, 0.02745098, 0, 1, 1,
0.4114368, 1.232721, -1.370179, 0.03137255, 0, 1, 1,
0.4123842, -0.4249552, 1.978366, 0.03921569, 0, 1, 1,
0.4130287, -0.1467516, 3.103395, 0.04313726, 0, 1, 1,
0.4142704, -0.7710929, 2.519634, 0.05098039, 0, 1, 1,
0.4264598, -0.08712595, 2.219504, 0.05490196, 0, 1, 1,
0.4334358, 0.423526, 0.02580491, 0.0627451, 0, 1, 1,
0.4373586, -1.005471, 2.479944, 0.06666667, 0, 1, 1,
0.439335, -1.498982, 2.594207, 0.07450981, 0, 1, 1,
0.4422164, 0.7798372, 1.212077, 0.07843138, 0, 1, 1,
0.4428935, -0.9815013, 1.802225, 0.08627451, 0, 1, 1,
0.4451709, 0.3791965, 1.236495, 0.09019608, 0, 1, 1,
0.4463215, 0.7644054, 0.4764768, 0.09803922, 0, 1, 1,
0.4469408, -1.76955, 3.127464, 0.1058824, 0, 1, 1,
0.4475644, 0.7552469, -0.2780078, 0.1098039, 0, 1, 1,
0.4486069, 1.998585, -1.271104, 0.1176471, 0, 1, 1,
0.4525524, 1.965153, -0.5886802, 0.1215686, 0, 1, 1,
0.4540154, -1.329019, 2.88868, 0.1294118, 0, 1, 1,
0.4550723, 0.0002803829, 0.7564018, 0.1333333, 0, 1, 1,
0.4577622, 0.2988538, 2.634479, 0.1411765, 0, 1, 1,
0.4591361, 1.548033, 1.596913, 0.145098, 0, 1, 1,
0.4603095, 0.8147758, 1.854622, 0.1529412, 0, 1, 1,
0.4615233, -0.2424682, 2.408762, 0.1568628, 0, 1, 1,
0.4647469, 0.9770477, -0.3572197, 0.1647059, 0, 1, 1,
0.4664825, -0.3258926, 1.763858, 0.1686275, 0, 1, 1,
0.4708815, -0.5509514, 3.912392, 0.1764706, 0, 1, 1,
0.4716761, 0.01006587, 1.075411, 0.1803922, 0, 1, 1,
0.4753288, -3.012345, 2.344161, 0.1882353, 0, 1, 1,
0.4762684, 0.7630344, 1.41133, 0.1921569, 0, 1, 1,
0.4823591, -0.1026454, 2.564572, 0.2, 0, 1, 1,
0.4864045, -1.460466, 4.350402, 0.2078431, 0, 1, 1,
0.4879785, 1.663124, -0.1776957, 0.2117647, 0, 1, 1,
0.4929228, -0.3997757, 2.291306, 0.2196078, 0, 1, 1,
0.4935704, 0.6765452, -0.5422348, 0.2235294, 0, 1, 1,
0.4988855, 0.9971823, 0.2903318, 0.2313726, 0, 1, 1,
0.5000491, -1.591008, 3.247368, 0.2352941, 0, 1, 1,
0.5006931, 0.2509612, 1.505122, 0.2431373, 0, 1, 1,
0.5008676, -1.482756, 1.655633, 0.2470588, 0, 1, 1,
0.5029528, -0.8301438, 1.687784, 0.254902, 0, 1, 1,
0.5064747, 2.051507, 0.0202201, 0.2588235, 0, 1, 1,
0.5159919, 0.9809967, -0.6064869, 0.2666667, 0, 1, 1,
0.5204993, 0.460209, 0.538348, 0.2705882, 0, 1, 1,
0.5206079, -0.1241542, 2.068252, 0.2784314, 0, 1, 1,
0.522655, 0.2380473, 1.8135, 0.282353, 0, 1, 1,
0.5227516, -1.601943, 2.130677, 0.2901961, 0, 1, 1,
0.5235599, 1.991263, 1.867542, 0.2941177, 0, 1, 1,
0.5244337, -0.9296091, 3.417255, 0.3019608, 0, 1, 1,
0.5254685, 0.2411952, 0.6187084, 0.3098039, 0, 1, 1,
0.5256182, 0.80449, 0.4033355, 0.3137255, 0, 1, 1,
0.5302398, 0.203151, 0.8369111, 0.3215686, 0, 1, 1,
0.5312999, -0.460854, 0.05245864, 0.3254902, 0, 1, 1,
0.5333204, 1.632842, 0.1699297, 0.3333333, 0, 1, 1,
0.535334, -0.9720769, 1.472044, 0.3372549, 0, 1, 1,
0.5388049, 0.3673921, 0.4758766, 0.345098, 0, 1, 1,
0.5391566, -1.843185, 0.529416, 0.3490196, 0, 1, 1,
0.5422252, 0.5084782, -0.6943272, 0.3568628, 0, 1, 1,
0.5455918, -0.7500973, 4.124663, 0.3607843, 0, 1, 1,
0.5497634, 0.7216861, 1.042222, 0.3686275, 0, 1, 1,
0.5511612, -0.9087248, 2.84309, 0.372549, 0, 1, 1,
0.5512679, -0.5410704, 2.425844, 0.3803922, 0, 1, 1,
0.5553579, 0.07960402, 0.997206, 0.3843137, 0, 1, 1,
0.5561636, -0.586639, 3.649847, 0.3921569, 0, 1, 1,
0.5569226, 1.082428, -0.7217029, 0.3960784, 0, 1, 1,
0.5575362, -0.5307361, 2.39859, 0.4039216, 0, 1, 1,
0.5612316, -1.535677, 1.207649, 0.4117647, 0, 1, 1,
0.5662878, 0.8578842, 0.9535596, 0.4156863, 0, 1, 1,
0.5714729, 0.2116459, 0.759033, 0.4235294, 0, 1, 1,
0.5729027, 0.6544838, -0.6807889, 0.427451, 0, 1, 1,
0.5762507, -1.231598, 3.862805, 0.4352941, 0, 1, 1,
0.5774481, 0.5794895, 0.5295071, 0.4392157, 0, 1, 1,
0.5843114, -0.7074454, 2.317523, 0.4470588, 0, 1, 1,
0.5918817, -0.2338795, 2.3152, 0.4509804, 0, 1, 1,
0.5955995, 1.051794, -0.2144313, 0.4588235, 0, 1, 1,
0.5979322, -0.7707803, 2.512231, 0.4627451, 0, 1, 1,
0.5979687, -1.574824, 1.65214, 0.4705882, 0, 1, 1,
0.6014374, -0.3319852, 2.553244, 0.4745098, 0, 1, 1,
0.6019579, 0.5019158, 1.897033, 0.4823529, 0, 1, 1,
0.6029193, 0.4413444, 2.332079, 0.4862745, 0, 1, 1,
0.6044161, -0.7231383, 2.411216, 0.4941176, 0, 1, 1,
0.6125475, -0.9985415, 2.205399, 0.5019608, 0, 1, 1,
0.6272126, -0.6176111, 2.032483, 0.5058824, 0, 1, 1,
0.6339206, 0.9613159, -0.9614315, 0.5137255, 0, 1, 1,
0.6397336, 0.2114599, -0.5044543, 0.5176471, 0, 1, 1,
0.6434726, -1.630676, 3.340156, 0.5254902, 0, 1, 1,
0.6438401, -0.4038934, 2.311376, 0.5294118, 0, 1, 1,
0.6438986, 0.7795306, 3.145703, 0.5372549, 0, 1, 1,
0.6453354, -0.05612722, 1.769098, 0.5411765, 0, 1, 1,
0.6478046, -0.6642279, 1.413667, 0.5490196, 0, 1, 1,
0.6486558, -0.07770548, 0.8446788, 0.5529412, 0, 1, 1,
0.6492659, 0.09107423, 1.796688, 0.5607843, 0, 1, 1,
0.6527053, 0.2085928, 1.33484, 0.5647059, 0, 1, 1,
0.6646455, 0.4589407, 0.7065173, 0.572549, 0, 1, 1,
0.6664776, 0.6866152, 0.3233901, 0.5764706, 0, 1, 1,
0.6707293, 0.2473431, 1.973694, 0.5843138, 0, 1, 1,
0.6758966, 0.7782899, 0.8186265, 0.5882353, 0, 1, 1,
0.6810715, -0.9300519, 1.497051, 0.5960785, 0, 1, 1,
0.6814916, -0.2331622, 1.269262, 0.6039216, 0, 1, 1,
0.6850994, -1.215834, 3.027816, 0.6078432, 0, 1, 1,
0.687792, 0.8361409, 1.149975, 0.6156863, 0, 1, 1,
0.6940218, -0.1310068, 1.070403, 0.6196079, 0, 1, 1,
0.6964694, -0.6717317, 2.140001, 0.627451, 0, 1, 1,
0.6973108, -0.06372228, 1.627874, 0.6313726, 0, 1, 1,
0.7007955, -0.6233079, 2.172348, 0.6392157, 0, 1, 1,
0.706374, 1.94798, 0.7950553, 0.6431373, 0, 1, 1,
0.7071718, -0.4408161, 1.93704, 0.6509804, 0, 1, 1,
0.7080709, 0.4010762, -1.92499, 0.654902, 0, 1, 1,
0.7121534, -1.10112, 3.263612, 0.6627451, 0, 1, 1,
0.7172517, -1.56662, 1.634525, 0.6666667, 0, 1, 1,
0.7210955, 1.883899, 0.3862961, 0.6745098, 0, 1, 1,
0.7211388, 1.209682, 1.688385, 0.6784314, 0, 1, 1,
0.7258372, -0.5322248, 1.154785, 0.6862745, 0, 1, 1,
0.7259641, -1.379518, 1.577422, 0.6901961, 0, 1, 1,
0.7357439, -1.123502, 0.9953075, 0.6980392, 0, 1, 1,
0.7378148, 0.0652798, 3.04168, 0.7058824, 0, 1, 1,
0.7401732, -0.4034476, 0.7413138, 0.7098039, 0, 1, 1,
0.7407904, 0.231131, 0.9867438, 0.7176471, 0, 1, 1,
0.7412033, 1.145187, 0.4607968, 0.7215686, 0, 1, 1,
0.7433335, -2.577036, 1.834645, 0.7294118, 0, 1, 1,
0.7439134, 0.07388385, 3.498154, 0.7333333, 0, 1, 1,
0.746253, 0.114558, 1.168957, 0.7411765, 0, 1, 1,
0.7478172, -0.5982857, 2.079598, 0.7450981, 0, 1, 1,
0.7507982, -1.422483, 3.825027, 0.7529412, 0, 1, 1,
0.7516881, -0.1856558, 3.509483, 0.7568628, 0, 1, 1,
0.7541167, -0.9132363, 3.193554, 0.7647059, 0, 1, 1,
0.7609069, 1.401972, -0.01252451, 0.7686275, 0, 1, 1,
0.7617424, -2.131952, 3.351401, 0.7764706, 0, 1, 1,
0.7623695, 0.3597111, 1.590063, 0.7803922, 0, 1, 1,
0.7636407, -1.141254, 4.090034, 0.7882353, 0, 1, 1,
0.7731317, 0.8110754, -0.3104334, 0.7921569, 0, 1, 1,
0.7747802, 1.179734, 1.293017, 0.8, 0, 1, 1,
0.7762358, 0.7387734, 2.349715, 0.8078431, 0, 1, 1,
0.7772801, -0.8167821, 2.714453, 0.8117647, 0, 1, 1,
0.7820449, 1.350671, 0.764556, 0.8196079, 0, 1, 1,
0.7852526, 0.9986546, 1.110804, 0.8235294, 0, 1, 1,
0.7873834, 0.07036807, 1.633744, 0.8313726, 0, 1, 1,
0.7988867, 0.4898461, 0.9883097, 0.8352941, 0, 1, 1,
0.7996557, 2.144908, 0.7571478, 0.8431373, 0, 1, 1,
0.7999988, -1.791002, 3.396827, 0.8470588, 0, 1, 1,
0.8016049, -0.2519434, 1.085087, 0.854902, 0, 1, 1,
0.8065552, 0.8477431, -1.007487, 0.8588235, 0, 1, 1,
0.8164694, 0.7408954, 0.09720489, 0.8666667, 0, 1, 1,
0.817489, 1.447042, -0.1227142, 0.8705882, 0, 1, 1,
0.8176056, -0.6527484, 3.319363, 0.8784314, 0, 1, 1,
0.8339164, -0.4299805, 1.780973, 0.8823529, 0, 1, 1,
0.8406087, -1.056636, 1.620558, 0.8901961, 0, 1, 1,
0.8409822, -2.348915, 3.334032, 0.8941177, 0, 1, 1,
0.8432151, -0.4196303, 1.613708, 0.9019608, 0, 1, 1,
0.8513471, 0.6506881, 1.052282, 0.9098039, 0, 1, 1,
0.8707712, 0.3171186, 1.987556, 0.9137255, 0, 1, 1,
0.87319, -0.1593912, 2.600708, 0.9215686, 0, 1, 1,
0.8788111, -1.426072, 2.215573, 0.9254902, 0, 1, 1,
0.881377, -0.09974779, 0.413575, 0.9333333, 0, 1, 1,
0.8845894, 0.4102823, 2.039655, 0.9372549, 0, 1, 1,
0.8868772, 0.4054744, 1.322495, 0.945098, 0, 1, 1,
0.8979545, -0.1392787, 2.272259, 0.9490196, 0, 1, 1,
0.8989954, 0.9099997, 1.107701, 0.9568627, 0, 1, 1,
0.9006155, -1.31608, 1.634309, 0.9607843, 0, 1, 1,
0.9022369, -1.043198, 3.729588, 0.9686275, 0, 1, 1,
0.9096531, 0.2972201, -0.9136716, 0.972549, 0, 1, 1,
0.9154785, -1.091258, 2.131108, 0.9803922, 0, 1, 1,
0.9243409, 0.4432336, 0.6875725, 0.9843137, 0, 1, 1,
0.9276443, -0.22029, 0.4982572, 0.9921569, 0, 1, 1,
0.9289928, -0.5701411, 2.930758, 0.9960784, 0, 1, 1,
0.9330556, -1.601448, 3.802045, 1, 0, 0.9960784, 1,
0.946259, 0.4548339, 1.547372, 1, 0, 0.9882353, 1,
0.9477037, 1.834977, 0.7254924, 1, 0, 0.9843137, 1,
0.9535988, 0.1679658, 1.777248, 1, 0, 0.9764706, 1,
0.9769118, 1.940416, 0.001435635, 1, 0, 0.972549, 1,
0.9898176, 0.05564901, 2.501053, 1, 0, 0.9647059, 1,
0.9950816, 1.558941, 1.113136, 1, 0, 0.9607843, 1,
0.9959795, 0.7148427, 0.003993759, 1, 0, 0.9529412, 1,
1.000427, -0.801212, 1.117021, 1, 0, 0.9490196, 1,
1.00045, 0.3668508, 2.870244, 1, 0, 0.9411765, 1,
1.003188, 0.9691207, 2.268024, 1, 0, 0.9372549, 1,
1.005881, 0.2943096, 2.163233, 1, 0, 0.9294118, 1,
1.008598, 0.745188, 1.134501, 1, 0, 0.9254902, 1,
1.019642, -0.265107, 1.349503, 1, 0, 0.9176471, 1,
1.022188, 0.5515237, 1.113762, 1, 0, 0.9137255, 1,
1.030042, -2.796402, 3.360298, 1, 0, 0.9058824, 1,
1.033973, -0.09985306, 1.192978, 1, 0, 0.9019608, 1,
1.033974, -0.1549674, 2.188207, 1, 0, 0.8941177, 1,
1.034414, 0.3443432, 1.521533, 1, 0, 0.8862745, 1,
1.041363, -1.022579, 2.442597, 1, 0, 0.8823529, 1,
1.054382, 0.10197, 2.746321, 1, 0, 0.8745098, 1,
1.057915, -0.434128, 0.6893976, 1, 0, 0.8705882, 1,
1.062675, 1.075297, 2.50706, 1, 0, 0.8627451, 1,
1.064427, 0.05286645, 1.908508, 1, 0, 0.8588235, 1,
1.076281, -0.3347849, 2.104232, 1, 0, 0.8509804, 1,
1.078468, 0.5704877, 1.312176, 1, 0, 0.8470588, 1,
1.08311, -0.07843789, -0.005734351, 1, 0, 0.8392157, 1,
1.084064, 0.1799309, 1.468321, 1, 0, 0.8352941, 1,
1.084541, 0.58617, 1.707328, 1, 0, 0.827451, 1,
1.085225, -0.5313765, 3.577288, 1, 0, 0.8235294, 1,
1.08786, 0.4646124, 1.546182, 1, 0, 0.8156863, 1,
1.089593, 0.2410675, 1.729605, 1, 0, 0.8117647, 1,
1.097011, -0.6921006, 1.16634, 1, 0, 0.8039216, 1,
1.098774, 1.882053, 0.6760905, 1, 0, 0.7960784, 1,
1.099426, -0.7218652, 2.0796, 1, 0, 0.7921569, 1,
1.109985, 0.6242007, 0.5714016, 1, 0, 0.7843137, 1,
1.111635, -1.527358, 1.788729, 1, 0, 0.7803922, 1,
1.116988, -0.01031464, 1.483426, 1, 0, 0.772549, 1,
1.117269, -0.3730381, 2.206328, 1, 0, 0.7686275, 1,
1.122977, -0.5112037, 2.431968, 1, 0, 0.7607843, 1,
1.123037, 0.841373, 1.355919, 1, 0, 0.7568628, 1,
1.125512, 0.4991532, 0.4705293, 1, 0, 0.7490196, 1,
1.12967, -0.431379, 1.016989, 1, 0, 0.7450981, 1,
1.135662, -0.1347947, 2.572696, 1, 0, 0.7372549, 1,
1.148066, -0.5567895, 4.078588, 1, 0, 0.7333333, 1,
1.16795, 0.7692585, 0.840095, 1, 0, 0.7254902, 1,
1.170265, -0.9103066, 2.019234, 1, 0, 0.7215686, 1,
1.188071, -0.1363679, -0.2570919, 1, 0, 0.7137255, 1,
1.190842, 0.5414211, 2.698007, 1, 0, 0.7098039, 1,
1.198668, -0.1642526, 1.572845, 1, 0, 0.7019608, 1,
1.200664, -0.08736731, 2.768658, 1, 0, 0.6941177, 1,
1.21999, -0.04076049, 2.254091, 1, 0, 0.6901961, 1,
1.236119, -1.27821, 1.684586, 1, 0, 0.682353, 1,
1.245388, -0.4151119, 2.27773, 1, 0, 0.6784314, 1,
1.248785, -1.595186, 2.3346, 1, 0, 0.6705883, 1,
1.256742, -0.3942184, 1.621972, 1, 0, 0.6666667, 1,
1.258537, 0.4061487, 1.849491, 1, 0, 0.6588235, 1,
1.271253, -0.02713947, 3.321544, 1, 0, 0.654902, 1,
1.281597, 0.8066714, 1.931895, 1, 0, 0.6470588, 1,
1.290109, -1.958618, 2.824838, 1, 0, 0.6431373, 1,
1.300649, 0.2298692, 1.054704, 1, 0, 0.6352941, 1,
1.310835, 1.223422, 1.515309, 1, 0, 0.6313726, 1,
1.313732, 1.768262, -0.6155793, 1, 0, 0.6235294, 1,
1.327835, 1.275008, -0.1985684, 1, 0, 0.6196079, 1,
1.339125, -0.7151393, 0.7824659, 1, 0, 0.6117647, 1,
1.339865, -0.1364947, 2.066402, 1, 0, 0.6078432, 1,
1.344628, 0.3492535, -0.4389583, 1, 0, 0.6, 1,
1.356063, -0.1442043, 2.910805, 1, 0, 0.5921569, 1,
1.357181, 0.2453205, -0.377149, 1, 0, 0.5882353, 1,
1.367404, 0.5291598, 1.87351, 1, 0, 0.5803922, 1,
1.367982, 1.154205, 1.470835, 1, 0, 0.5764706, 1,
1.371482, 1.490266, -0.4212937, 1, 0, 0.5686275, 1,
1.379055, -1.015274, 2.331421, 1, 0, 0.5647059, 1,
1.381977, -1.034868, 1.155132, 1, 0, 0.5568628, 1,
1.383977, 2.909288, 1.292396, 1, 0, 0.5529412, 1,
1.386101, 0.8077294, -0.5531897, 1, 0, 0.5450981, 1,
1.390374, 0.1209886, 2.339063, 1, 0, 0.5411765, 1,
1.391917, -0.2810139, -0.2972355, 1, 0, 0.5333334, 1,
1.395988, -0.03911926, 1.296339, 1, 0, 0.5294118, 1,
1.397979, -0.5837573, 2.333234, 1, 0, 0.5215687, 1,
1.399241, 0.2822915, 2.326458, 1, 0, 0.5176471, 1,
1.413712, -0.3578219, 1.386549, 1, 0, 0.509804, 1,
1.415063, 0.5262154, 2.577447, 1, 0, 0.5058824, 1,
1.42326, 0.4013352, 1.334414, 1, 0, 0.4980392, 1,
1.426415, -1.401798, 2.211367, 1, 0, 0.4901961, 1,
1.439365, 0.4762452, 1.284155, 1, 0, 0.4862745, 1,
1.450435, 0.8461512, 2.207016, 1, 0, 0.4784314, 1,
1.452518, -0.8672197, 1.269574, 1, 0, 0.4745098, 1,
1.45568, -0.2870481, 2.090542, 1, 0, 0.4666667, 1,
1.456671, -0.2149275, 1.984108, 1, 0, 0.4627451, 1,
1.466915, -1.065106, 1.879377, 1, 0, 0.454902, 1,
1.472762, -0.16324, 2.318371, 1, 0, 0.4509804, 1,
1.478871, -1.878629, 2.10598, 1, 0, 0.4431373, 1,
1.483555, 0.04691667, 1.645926, 1, 0, 0.4392157, 1,
1.497568, 0.5514199, 2.704427, 1, 0, 0.4313726, 1,
1.500158, -0.2497937, 0.3471956, 1, 0, 0.427451, 1,
1.506318, -0.2529135, 3.0347, 1, 0, 0.4196078, 1,
1.507163, -1.595799, 2.247588, 1, 0, 0.4156863, 1,
1.513087, -0.7178465, 0.5343899, 1, 0, 0.4078431, 1,
1.51632, -2.117269, 2.324097, 1, 0, 0.4039216, 1,
1.51769, -1.939787, 2.644393, 1, 0, 0.3960784, 1,
1.519001, 0.05106816, 0.5998245, 1, 0, 0.3882353, 1,
1.531746, 0.7736756, 1.447881, 1, 0, 0.3843137, 1,
1.552986, -1.06933, 3.036726, 1, 0, 0.3764706, 1,
1.558399, 0.8416836, -1.672462, 1, 0, 0.372549, 1,
1.568153, 2.08447, -0.5864864, 1, 0, 0.3647059, 1,
1.576507, -0.08120753, 1.730078, 1, 0, 0.3607843, 1,
1.598609, 0.09496566, 2.062933, 1, 0, 0.3529412, 1,
1.616557, 0.6678652, 1.57311, 1, 0, 0.3490196, 1,
1.625914, -0.1318677, 0.9940082, 1, 0, 0.3411765, 1,
1.630319, 1.372827, 1.166004, 1, 0, 0.3372549, 1,
1.636459, -0.4279396, 1.54672, 1, 0, 0.3294118, 1,
1.65512, 0.3654986, -0.2925741, 1, 0, 0.3254902, 1,
1.670245, -1.591613, 1.472797, 1, 0, 0.3176471, 1,
1.681821, 1.154409, -0.7888912, 1, 0, 0.3137255, 1,
1.682678, 0.5890811, 2.990774, 1, 0, 0.3058824, 1,
1.687441, 0.1070917, 0.1798727, 1, 0, 0.2980392, 1,
1.699448, -1.610414, 2.769382, 1, 0, 0.2941177, 1,
1.710186, 0.07462329, 3.038157, 1, 0, 0.2862745, 1,
1.723526, -1.527683, 1.060572, 1, 0, 0.282353, 1,
1.768527, 2.868886, 1.808998, 1, 0, 0.2745098, 1,
1.773832, -1.214327, 2.248669, 1, 0, 0.2705882, 1,
1.778453, -1.636842, 2.01441, 1, 0, 0.2627451, 1,
1.780256, -0.5253644, 2.616877, 1, 0, 0.2588235, 1,
1.781852, -0.1215265, -0.4809636, 1, 0, 0.2509804, 1,
1.792313, 0.04625409, 1.270624, 1, 0, 0.2470588, 1,
1.800171, 0.4459116, 1.856391, 1, 0, 0.2392157, 1,
1.80087, 1.089554, -0.3073361, 1, 0, 0.2352941, 1,
1.805836, 0.7293271, 2.322754, 1, 0, 0.227451, 1,
1.837771, -1.130744, 1.109648, 1, 0, 0.2235294, 1,
1.84586, -0.1294462, 0.285632, 1, 0, 0.2156863, 1,
1.879437, -1.064377, 2.18226, 1, 0, 0.2117647, 1,
1.898071, -2.73803, 2.137224, 1, 0, 0.2039216, 1,
1.900098, -0.3379265, 1.788436, 1, 0, 0.1960784, 1,
1.916263, 0.08116911, 2.909515, 1, 0, 0.1921569, 1,
1.931219, 1.36306, 0.7479101, 1, 0, 0.1843137, 1,
1.931675, 0.313649, 1.967327, 1, 0, 0.1803922, 1,
1.933106, 1.893055, 0.9180223, 1, 0, 0.172549, 1,
1.933504, 0.9293365, 1.133204, 1, 0, 0.1686275, 1,
1.942103, -0.8266262, 1.699272, 1, 0, 0.1607843, 1,
1.965194, 0.8835962, 1.110725, 1, 0, 0.1568628, 1,
1.99914, -0.2279145, 1.733576, 1, 0, 0.1490196, 1,
2.007333, -0.1555141, 0.8341371, 1, 0, 0.145098, 1,
2.037061, 0.4274976, 0.7061341, 1, 0, 0.1372549, 1,
2.052257, 0.1477104, 1.720814, 1, 0, 0.1333333, 1,
2.054193, -1.59638, 2.536794, 1, 0, 0.1254902, 1,
2.065898, -0.05284349, 1.749282, 1, 0, 0.1215686, 1,
2.086018, 1.382221, -1.068795, 1, 0, 0.1137255, 1,
2.095423, 0.8321624, 0.9330686, 1, 0, 0.1098039, 1,
2.099472, 0.991689, 1.637614, 1, 0, 0.1019608, 1,
2.110114, 0.7829875, 0.5272714, 1, 0, 0.09411765, 1,
2.114637, -0.1760425, 0.1635523, 1, 0, 0.09019608, 1,
2.138755, -0.1062909, 1.434689, 1, 0, 0.08235294, 1,
2.170252, 0.1252173, 1.329954, 1, 0, 0.07843138, 1,
2.183623, 0.7933106, 0.06388652, 1, 0, 0.07058824, 1,
2.210469, 1.093946, 0.2790098, 1, 0, 0.06666667, 1,
2.216908, 0.07901052, 2.51465, 1, 0, 0.05882353, 1,
2.272236, 0.50208, 1.819743, 1, 0, 0.05490196, 1,
2.37585, 1.071211, -1.313274, 1, 0, 0.04705882, 1,
2.399065, -0.7933713, 3.048533, 1, 0, 0.04313726, 1,
2.428358, -0.8098215, 2.392725, 1, 0, 0.03529412, 1,
2.434808, 0.7138817, 0.2942063, 1, 0, 0.03137255, 1,
2.658943, -0.04920907, 0.4265498, 1, 0, 0.02352941, 1,
2.689556, -1.645405, 2.23051, 1, 0, 0.01960784, 1,
2.743187, 0.612824, -0.3802723, 1, 0, 0.01176471, 1,
3.055239, -0.6808954, 1.632766, 1, 0, 0.007843138, 1
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
-0.03939342, -4.795331, -6.96843, 0, -0.5, 0.5, 0.5,
-0.03939342, -4.795331, -6.96843, 1, -0.5, 0.5, 0.5,
-0.03939342, -4.795331, -6.96843, 1, 1.5, 0.5, 0.5,
-0.03939342, -4.795331, -6.96843, 0, 1.5, 0.5, 0.5
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
-4.183106, -0.1807383, -6.96843, 0, -0.5, 0.5, 0.5,
-4.183106, -0.1807383, -6.96843, 1, -0.5, 0.5, 0.5,
-4.183106, -0.1807383, -6.96843, 1, 1.5, 0.5, 0.5,
-4.183106, -0.1807383, -6.96843, 0, 1.5, 0.5, 0.5
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
-4.183106, -4.795331, -0.1456399, 0, -0.5, 0.5, 0.5,
-4.183106, -4.795331, -0.1456399, 1, -0.5, 0.5, 0.5,
-4.183106, -4.795331, -0.1456399, 1, 1.5, 0.5, 0.5,
-4.183106, -4.795331, -0.1456399, 0, 1.5, 0.5, 0.5
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
-3, -3.730425, -5.39394,
3, -3.730425, -5.39394,
-3, -3.730425, -5.39394,
-3, -3.907909, -5.656355,
-2, -3.730425, -5.39394,
-2, -3.907909, -5.656355,
-1, -3.730425, -5.39394,
-1, -3.907909, -5.656355,
0, -3.730425, -5.39394,
0, -3.907909, -5.656355,
1, -3.730425, -5.39394,
1, -3.907909, -5.656355,
2, -3.730425, -5.39394,
2, -3.907909, -5.656355,
3, -3.730425, -5.39394,
3, -3.907909, -5.656355
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
-3, -4.262878, -6.181185, 0, -0.5, 0.5, 0.5,
-3, -4.262878, -6.181185, 1, -0.5, 0.5, 0.5,
-3, -4.262878, -6.181185, 1, 1.5, 0.5, 0.5,
-3, -4.262878, -6.181185, 0, 1.5, 0.5, 0.5,
-2, -4.262878, -6.181185, 0, -0.5, 0.5, 0.5,
-2, -4.262878, -6.181185, 1, -0.5, 0.5, 0.5,
-2, -4.262878, -6.181185, 1, 1.5, 0.5, 0.5,
-2, -4.262878, -6.181185, 0, 1.5, 0.5, 0.5,
-1, -4.262878, -6.181185, 0, -0.5, 0.5, 0.5,
-1, -4.262878, -6.181185, 1, -0.5, 0.5, 0.5,
-1, -4.262878, -6.181185, 1, 1.5, 0.5, 0.5,
-1, -4.262878, -6.181185, 0, 1.5, 0.5, 0.5,
0, -4.262878, -6.181185, 0, -0.5, 0.5, 0.5,
0, -4.262878, -6.181185, 1, -0.5, 0.5, 0.5,
0, -4.262878, -6.181185, 1, 1.5, 0.5, 0.5,
0, -4.262878, -6.181185, 0, 1.5, 0.5, 0.5,
1, -4.262878, -6.181185, 0, -0.5, 0.5, 0.5,
1, -4.262878, -6.181185, 1, -0.5, 0.5, 0.5,
1, -4.262878, -6.181185, 1, 1.5, 0.5, 0.5,
1, -4.262878, -6.181185, 0, 1.5, 0.5, 0.5,
2, -4.262878, -6.181185, 0, -0.5, 0.5, 0.5,
2, -4.262878, -6.181185, 1, -0.5, 0.5, 0.5,
2, -4.262878, -6.181185, 1, 1.5, 0.5, 0.5,
2, -4.262878, -6.181185, 0, 1.5, 0.5, 0.5,
3, -4.262878, -6.181185, 0, -0.5, 0.5, 0.5,
3, -4.262878, -6.181185, 1, -0.5, 0.5, 0.5,
3, -4.262878, -6.181185, 1, 1.5, 0.5, 0.5,
3, -4.262878, -6.181185, 0, 1.5, 0.5, 0.5
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
-3.226865, -3, -5.39394,
-3.226865, 3, -5.39394,
-3.226865, -3, -5.39394,
-3.386238, -3, -5.656355,
-3.226865, -2, -5.39394,
-3.386238, -2, -5.656355,
-3.226865, -1, -5.39394,
-3.386238, -1, -5.656355,
-3.226865, 0, -5.39394,
-3.386238, 0, -5.656355,
-3.226865, 1, -5.39394,
-3.386238, 1, -5.656355,
-3.226865, 2, -5.39394,
-3.386238, 2, -5.656355,
-3.226865, 3, -5.39394,
-3.386238, 3, -5.656355
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
-3.704985, -3, -6.181185, 0, -0.5, 0.5, 0.5,
-3.704985, -3, -6.181185, 1, -0.5, 0.5, 0.5,
-3.704985, -3, -6.181185, 1, 1.5, 0.5, 0.5,
-3.704985, -3, -6.181185, 0, 1.5, 0.5, 0.5,
-3.704985, -2, -6.181185, 0, -0.5, 0.5, 0.5,
-3.704985, -2, -6.181185, 1, -0.5, 0.5, 0.5,
-3.704985, -2, -6.181185, 1, 1.5, 0.5, 0.5,
-3.704985, -2, -6.181185, 0, 1.5, 0.5, 0.5,
-3.704985, -1, -6.181185, 0, -0.5, 0.5, 0.5,
-3.704985, -1, -6.181185, 1, -0.5, 0.5, 0.5,
-3.704985, -1, -6.181185, 1, 1.5, 0.5, 0.5,
-3.704985, -1, -6.181185, 0, 1.5, 0.5, 0.5,
-3.704985, 0, -6.181185, 0, -0.5, 0.5, 0.5,
-3.704985, 0, -6.181185, 1, -0.5, 0.5, 0.5,
-3.704985, 0, -6.181185, 1, 1.5, 0.5, 0.5,
-3.704985, 0, -6.181185, 0, 1.5, 0.5, 0.5,
-3.704985, 1, -6.181185, 0, -0.5, 0.5, 0.5,
-3.704985, 1, -6.181185, 1, -0.5, 0.5, 0.5,
-3.704985, 1, -6.181185, 1, 1.5, 0.5, 0.5,
-3.704985, 1, -6.181185, 0, 1.5, 0.5, 0.5,
-3.704985, 2, -6.181185, 0, -0.5, 0.5, 0.5,
-3.704985, 2, -6.181185, 1, -0.5, 0.5, 0.5,
-3.704985, 2, -6.181185, 1, 1.5, 0.5, 0.5,
-3.704985, 2, -6.181185, 0, 1.5, 0.5, 0.5,
-3.704985, 3, -6.181185, 0, -0.5, 0.5, 0.5,
-3.704985, 3, -6.181185, 1, -0.5, 0.5, 0.5,
-3.704985, 3, -6.181185, 1, 1.5, 0.5, 0.5,
-3.704985, 3, -6.181185, 0, 1.5, 0.5, 0.5
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
-3.226865, -3.730425, -4,
-3.226865, -3.730425, 4,
-3.226865, -3.730425, -4,
-3.386238, -3.907909, -4,
-3.226865, -3.730425, -2,
-3.386238, -3.907909, -2,
-3.226865, -3.730425, 0,
-3.386238, -3.907909, 0,
-3.226865, -3.730425, 2,
-3.386238, -3.907909, 2,
-3.226865, -3.730425, 4,
-3.386238, -3.907909, 4
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
-3.704985, -4.262878, -4, 0, -0.5, 0.5, 0.5,
-3.704985, -4.262878, -4, 1, -0.5, 0.5, 0.5,
-3.704985, -4.262878, -4, 1, 1.5, 0.5, 0.5,
-3.704985, -4.262878, -4, 0, 1.5, 0.5, 0.5,
-3.704985, -4.262878, -2, 0, -0.5, 0.5, 0.5,
-3.704985, -4.262878, -2, 1, -0.5, 0.5, 0.5,
-3.704985, -4.262878, -2, 1, 1.5, 0.5, 0.5,
-3.704985, -4.262878, -2, 0, 1.5, 0.5, 0.5,
-3.704985, -4.262878, 0, 0, -0.5, 0.5, 0.5,
-3.704985, -4.262878, 0, 1, -0.5, 0.5, 0.5,
-3.704985, -4.262878, 0, 1, 1.5, 0.5, 0.5,
-3.704985, -4.262878, 0, 0, 1.5, 0.5, 0.5,
-3.704985, -4.262878, 2, 0, -0.5, 0.5, 0.5,
-3.704985, -4.262878, 2, 1, -0.5, 0.5, 0.5,
-3.704985, -4.262878, 2, 1, 1.5, 0.5, 0.5,
-3.704985, -4.262878, 2, 0, 1.5, 0.5, 0.5,
-3.704985, -4.262878, 4, 0, -0.5, 0.5, 0.5,
-3.704985, -4.262878, 4, 1, -0.5, 0.5, 0.5,
-3.704985, -4.262878, 4, 1, 1.5, 0.5, 0.5,
-3.704985, -4.262878, 4, 0, 1.5, 0.5, 0.5
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
-3.226865, -3.730425, -5.39394,
-3.226865, 3.368948, -5.39394,
-3.226865, -3.730425, 5.10266,
-3.226865, 3.368948, 5.10266,
-3.226865, -3.730425, -5.39394,
-3.226865, -3.730425, 5.10266,
-3.226865, 3.368948, -5.39394,
-3.226865, 3.368948, 5.10266,
-3.226865, -3.730425, -5.39394,
3.148078, -3.730425, -5.39394,
-3.226865, -3.730425, 5.10266,
3.148078, -3.730425, 5.10266,
-3.226865, 3.368948, -5.39394,
3.148078, 3.368948, -5.39394,
-3.226865, 3.368948, 5.10266,
3.148078, 3.368948, 5.10266,
3.148078, -3.730425, -5.39394,
3.148078, 3.368948, -5.39394,
3.148078, -3.730425, 5.10266,
3.148078, 3.368948, 5.10266,
3.148078, -3.730425, -5.39394,
3.148078, -3.730425, 5.10266,
3.148078, 3.368948, -5.39394,
3.148078, 3.368948, 5.10266
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
var radius = 7.574616;
var distance = 33.70032;
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
mvMatrix.translate( 0.03939342, 0.1807383, 0.1456399 );
mvMatrix.scale( 1.28469, 1.153598, 0.7802358 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.70032);
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
quizalofop-ethyl<-read.table("quizalofop-ethyl.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-quizalofop-ethyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'quizalofop' not found
```

```r
y<-quizalofop-ethyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'quizalofop' not found
```

```r
z<-quizalofop-ethyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'quizalofop' not found
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
-3.134026, 1.440251, -0.6546404, 0, 0, 1, 1, 1,
-2.971176, -0.6351885, -1.758568, 1, 0, 0, 1, 1,
-2.851421, -2.336887, -3.922005, 1, 0, 0, 1, 1,
-2.722406, 0.07480133, -1.417572, 1, 0, 0, 1, 1,
-2.647637, -0.930343, -3.100081, 1, 0, 0, 1, 1,
-2.642868, 0.9117616, -0.5315046, 1, 0, 0, 1, 1,
-2.493954, 0.8087871, -0.7382298, 0, 0, 0, 1, 1,
-2.477493, -0.1024147, -0.761946, 0, 0, 0, 1, 1,
-2.455782, -1.244569, -2.406575, 0, 0, 0, 1, 1,
-2.443763, -0.9203737, -2.455067, 0, 0, 0, 1, 1,
-2.39613, 0.4698076, -1.039024, 0, 0, 0, 1, 1,
-2.382226, 0.5591416, -1.428423, 0, 0, 0, 1, 1,
-2.36883, 1.286951, -0.203924, 0, 0, 0, 1, 1,
-2.360475, 0.2672156, -1.499126, 1, 1, 1, 1, 1,
-2.344967, -0.9869806, -2.483646, 1, 1, 1, 1, 1,
-2.305712, 0.7233458, -1.794307, 1, 1, 1, 1, 1,
-2.293601, 0.4592721, -3.723873, 1, 1, 1, 1, 1,
-2.275457, 0.3538713, -2.108954, 1, 1, 1, 1, 1,
-2.250084, 0.7882175, -0.5998554, 1, 1, 1, 1, 1,
-2.230177, -0.5037428, -3.453776, 1, 1, 1, 1, 1,
-2.211092, -0.06918121, -0.5955523, 1, 1, 1, 1, 1,
-2.194071, 1.465201, -0.5198787, 1, 1, 1, 1, 1,
-2.094668, 2.269726, -0.368702, 1, 1, 1, 1, 1,
-2.083887, 0.4770855, -1.72946, 1, 1, 1, 1, 1,
-2.040311, 0.4023914, -1.222515, 1, 1, 1, 1, 1,
-2.038049, -1.171312, -3.217492, 1, 1, 1, 1, 1,
-2.020278, 0.2268811, -0.4838636, 1, 1, 1, 1, 1,
-1.986469, -0.004755309, -2.501462, 1, 1, 1, 1, 1,
-1.980771, 0.6444398, -2.008134, 0, 0, 1, 1, 1,
-1.975501, 0.7027676, -1.546905, 1, 0, 0, 1, 1,
-1.918888, -1.489714, -2.069797, 1, 0, 0, 1, 1,
-1.918157, -0.233197, -0.9290888, 1, 0, 0, 1, 1,
-1.910287, 0.7331023, -1.955968, 1, 0, 0, 1, 1,
-1.904826, 0.7787843, -0.2076126, 1, 0, 0, 1, 1,
-1.903624, 0.03189296, -2.571848, 0, 0, 0, 1, 1,
-1.869775, 0.6945101, -1.237209, 0, 0, 0, 1, 1,
-1.850413, -0.5904307, -1.759006, 0, 0, 0, 1, 1,
-1.82528, -0.4018065, -1.353953, 0, 0, 0, 1, 1,
-1.793103, 0.6624455, -0.249612, 0, 0, 0, 1, 1,
-1.79284, -0.8802261, -2.24765, 0, 0, 0, 1, 1,
-1.791909, -0.3810292, -0.8533309, 0, 0, 0, 1, 1,
-1.776892, 0.223377, -2.669015, 1, 1, 1, 1, 1,
-1.77376, -0.7082788, -3.002736, 1, 1, 1, 1, 1,
-1.766979, -1.424538, -1.529594, 1, 1, 1, 1, 1,
-1.74311, 0.6603792, -2.257437, 1, 1, 1, 1, 1,
-1.742196, -0.5603656, -1.117466, 1, 1, 1, 1, 1,
-1.723041, -0.5412831, -3.007858, 1, 1, 1, 1, 1,
-1.719426, -0.5873351, -3.757274, 1, 1, 1, 1, 1,
-1.718429, 0.1356663, -1.471958, 1, 1, 1, 1, 1,
-1.716717, -1.826667, -1.362392, 1, 1, 1, 1, 1,
-1.713975, -1.302483, -1.813691, 1, 1, 1, 1, 1,
-1.713006, 3.265559, 0.9914059, 1, 1, 1, 1, 1,
-1.705166, -0.7187148, -3.709137, 1, 1, 1, 1, 1,
-1.704214, 0.939835, -2.619969, 1, 1, 1, 1, 1,
-1.640917, 0.4811472, -1.410213, 1, 1, 1, 1, 1,
-1.639663, -1.689593, -4.457337, 1, 1, 1, 1, 1,
-1.63761, 0.9493803, -0.6410705, 0, 0, 1, 1, 1,
-1.63232, 0.5296765, -1.43153, 1, 0, 0, 1, 1,
-1.627993, -0.8202505, -0.818863, 1, 0, 0, 1, 1,
-1.620498, -0.07358404, 0.4622164, 1, 0, 0, 1, 1,
-1.618953, 0.02279296, -2.468118, 1, 0, 0, 1, 1,
-1.608338, 0.1872603, 0.9191538, 1, 0, 0, 1, 1,
-1.603791, -0.4762985, 0.4017205, 0, 0, 0, 1, 1,
-1.59453, 0.5930854, -1.137972, 0, 0, 0, 1, 1,
-1.583499, -0.9480706, -3.143259, 0, 0, 0, 1, 1,
-1.573288, -0.1556621, -2.694325, 0, 0, 0, 1, 1,
-1.562173, 1.166501, -0.9360688, 0, 0, 0, 1, 1,
-1.561692, -0.8325419, -0.9580057, 0, 0, 0, 1, 1,
-1.559936, 0.122264, -0.8213369, 0, 0, 0, 1, 1,
-1.556206, 0.6778612, 1.806804, 1, 1, 1, 1, 1,
-1.549608, -2.029125, -1.956824, 1, 1, 1, 1, 1,
-1.548716, -8.850361e-05, -1.426671, 1, 1, 1, 1, 1,
-1.546849, 1.281147, 0.2060694, 1, 1, 1, 1, 1,
-1.545148, -0.6538088, -2.265962, 1, 1, 1, 1, 1,
-1.540722, -1.641824, -2.424676, 1, 1, 1, 1, 1,
-1.529986, -0.7420374, -2.614061, 1, 1, 1, 1, 1,
-1.527706, -1.486156, -2.99106, 1, 1, 1, 1, 1,
-1.520444, 1.027766, -0.194994, 1, 1, 1, 1, 1,
-1.517368, 2.126207, -1.785541, 1, 1, 1, 1, 1,
-1.499795, 1.698473, 0.07658003, 1, 1, 1, 1, 1,
-1.496045, 0.5302054, -1.478712, 1, 1, 1, 1, 1,
-1.495142, -0.9954328, -2.511905, 1, 1, 1, 1, 1,
-1.490272, 1.208367, -1.45953, 1, 1, 1, 1, 1,
-1.48441, -0.01207403, -3.279734, 1, 1, 1, 1, 1,
-1.476769, 0.431582, -1.316766, 0, 0, 1, 1, 1,
-1.468391, 0.9960034, 0.09239797, 1, 0, 0, 1, 1,
-1.437961, 1.756377, -0.2566188, 1, 0, 0, 1, 1,
-1.437446, -0.3627052, -1.921975, 1, 0, 0, 1, 1,
-1.427352, 1.181074, -3.037695, 1, 0, 0, 1, 1,
-1.410558, -1.239725, -3.484964, 1, 0, 0, 1, 1,
-1.404328, 0.7882322, -1.398504, 0, 0, 0, 1, 1,
-1.402394, -1.315598, -2.024291, 0, 0, 0, 1, 1,
-1.390717, 0.09130096, -2.209506, 0, 0, 0, 1, 1,
-1.390191, -0.3321767, -1.811993, 0, 0, 0, 1, 1,
-1.388492, -1.166822, -0.6263328, 0, 0, 0, 1, 1,
-1.384655, -0.04572362, -2.446242, 0, 0, 0, 1, 1,
-1.381296, 1.471547, 0.2723279, 0, 0, 0, 1, 1,
-1.375618, -0.2594765, -1.70883, 1, 1, 1, 1, 1,
-1.36747, 0.8710113, -0.6970924, 1, 1, 1, 1, 1,
-1.359944, -1.593641, -2.991467, 1, 1, 1, 1, 1,
-1.351118, -1.942074, -1.802746, 1, 1, 1, 1, 1,
-1.350688, 1.191891, -1.275514, 1, 1, 1, 1, 1,
-1.349001, 1.873678, 0.2497651, 1, 1, 1, 1, 1,
-1.347576, 0.8419055, -1.881576, 1, 1, 1, 1, 1,
-1.34709, -0.153396, -1.21643, 1, 1, 1, 1, 1,
-1.343308, 0.07974038, -0.2821019, 1, 1, 1, 1, 1,
-1.343018, -1.276393, -2.173303, 1, 1, 1, 1, 1,
-1.340048, -0.9671733, -0.5752805, 1, 1, 1, 1, 1,
-1.334061, -1.189853, -3.907141, 1, 1, 1, 1, 1,
-1.329175, 0.1005955, -1.47333, 1, 1, 1, 1, 1,
-1.31242, 0.5059305, -1.395082, 1, 1, 1, 1, 1,
-1.305719, -1.158124, -3.65118, 1, 1, 1, 1, 1,
-1.305625, -0.2798182, -1.502624, 0, 0, 1, 1, 1,
-1.300771, 0.1603636, -1.939378, 1, 0, 0, 1, 1,
-1.295585, -0.3650979, -2.64385, 1, 0, 0, 1, 1,
-1.2892, -1.279765, -4.014374, 1, 0, 0, 1, 1,
-1.288791, -0.8172719, -1.450854, 1, 0, 0, 1, 1,
-1.281973, -0.376602, -0.8051935, 1, 0, 0, 1, 1,
-1.280276, -0.7009561, 0.2117816, 0, 0, 0, 1, 1,
-1.271923, -1.894442, -4.103971, 0, 0, 0, 1, 1,
-1.260992, -0.940502, -2.265821, 0, 0, 0, 1, 1,
-1.252027, -0.07450156, -0.8027149, 0, 0, 0, 1, 1,
-1.251829, -0.7396005, -2.972223, 0, 0, 0, 1, 1,
-1.244333, -0.5764807, -1.723563, 0, 0, 0, 1, 1,
-1.241836, -0.9513139, -1.785643, 0, 0, 0, 1, 1,
-1.240681, 0.7090822, -0.04504622, 1, 1, 1, 1, 1,
-1.240103, -2.540982, -2.849025, 1, 1, 1, 1, 1,
-1.23921, 1.035867, 0.1721624, 1, 1, 1, 1, 1,
-1.238672, 0.8405967, -1.310804, 1, 1, 1, 1, 1,
-1.236181, 0.7020995, -0.4494101, 1, 1, 1, 1, 1,
-1.222904, -1.381709, -3.55092, 1, 1, 1, 1, 1,
-1.210873, 0.310727, -3.042473, 1, 1, 1, 1, 1,
-1.195738, 0.5855106, -1.614459, 1, 1, 1, 1, 1,
-1.194996, -1.419092, -3.150015, 1, 1, 1, 1, 1,
-1.184277, 1.123836, 0.1146914, 1, 1, 1, 1, 1,
-1.184192, -1.772093, -1.742182, 1, 1, 1, 1, 1,
-1.183297, -0.8033707, 0.2084118, 1, 1, 1, 1, 1,
-1.180959, -1.023197, -1.482401, 1, 1, 1, 1, 1,
-1.172037, 1.11034, 0.166981, 1, 1, 1, 1, 1,
-1.155802, -0.1752977, -2.218904, 1, 1, 1, 1, 1,
-1.155499, -0.07315364, -3.104112, 0, 0, 1, 1, 1,
-1.142197, -0.9916317, -0.6942461, 1, 0, 0, 1, 1,
-1.141295, 0.8717687, 0.1268755, 1, 0, 0, 1, 1,
-1.133364, 1.600118, -0.1420798, 1, 0, 0, 1, 1,
-1.121107, -0.3675078, -1.890039, 1, 0, 0, 1, 1,
-1.120738, 0.5483736, -0.2555378, 1, 0, 0, 1, 1,
-1.111365, 1.327845, -1.766131, 0, 0, 0, 1, 1,
-1.110969, 0.05690418, -3.183907, 0, 0, 0, 1, 1,
-1.099149, -0.2631468, -2.066849, 0, 0, 0, 1, 1,
-1.098736, 0.9728263, -0.364522, 0, 0, 0, 1, 1,
-1.097432, 0.8839279, -0.0252733, 0, 0, 0, 1, 1,
-1.096468, 1.592669, -0.2681252, 0, 0, 0, 1, 1,
-1.08844, -0.9617519, -1.661861, 0, 0, 0, 1, 1,
-1.087791, 0.6613433, 0.3982881, 1, 1, 1, 1, 1,
-1.086629, 0.7766985, -1.309462, 1, 1, 1, 1, 1,
-1.080448, 1.001073, 0.4868512, 1, 1, 1, 1, 1,
-1.076769, 1.203248, -0.1904743, 1, 1, 1, 1, 1,
-1.072527, -1.842933, -0.8045201, 1, 1, 1, 1, 1,
-1.071999, 1.075952, -1.166529, 1, 1, 1, 1, 1,
-1.070918, 1.084119, 1.426776, 1, 1, 1, 1, 1,
-1.069997, 0.3086098, -2.019284, 1, 1, 1, 1, 1,
-1.066321, -0.5627007, -1.488034, 1, 1, 1, 1, 1,
-1.064237, 0.03111984, -3.227536, 1, 1, 1, 1, 1,
-1.063215, 0.5764098, -1.975107, 1, 1, 1, 1, 1,
-1.05725, 1.829084, -1.084533, 1, 1, 1, 1, 1,
-1.053708, 0.7159152, -2.330616, 1, 1, 1, 1, 1,
-1.053535, -0.3576428, -2.486526, 1, 1, 1, 1, 1,
-1.052903, 0.5153152, 0.04358226, 1, 1, 1, 1, 1,
-1.044068, 0.7918972, -1.177087, 0, 0, 1, 1, 1,
-1.040286, -0.7886828, -1.729628, 1, 0, 0, 1, 1,
-1.034285, 1.598133, 1.398674, 1, 0, 0, 1, 1,
-1.031367, -0.4062862, -1.428088, 1, 0, 0, 1, 1,
-1.028499, -1.306384, -1.27514, 1, 0, 0, 1, 1,
-1.027213, -0.209728, -1.647456, 1, 0, 0, 1, 1,
-1.020947, -0.2762319, -1.677389, 0, 0, 0, 1, 1,
-1.018101, 1.402281, -1.554701, 0, 0, 0, 1, 1,
-1.004465, -0.06424257, -1.999179, 0, 0, 0, 1, 1,
-0.9944837, -2.12043, -4.244509, 0, 0, 0, 1, 1,
-0.9897954, 1.41455, 0.8394681, 0, 0, 0, 1, 1,
-0.962361, 0.1743178, -2.259436, 0, 0, 0, 1, 1,
-0.9586239, 1.29465, -1.271514, 0, 0, 0, 1, 1,
-0.9536752, 0.2657163, -1.788235, 1, 1, 1, 1, 1,
-0.9481124, 2.478813, -1.354313, 1, 1, 1, 1, 1,
-0.9427775, -0.7323911, -4.091059, 1, 1, 1, 1, 1,
-0.9349076, 0.9423462, -0.3441676, 1, 1, 1, 1, 1,
-0.9335303, 0.5643056, -2.284736, 1, 1, 1, 1, 1,
-0.9317611, 0.2407742, -3.689646, 1, 1, 1, 1, 1,
-0.9214538, 0.4329616, 0.517816, 1, 1, 1, 1, 1,
-0.9205605, 1.089817, -0.1186413, 1, 1, 1, 1, 1,
-0.9187225, -1.386147, 0.2995763, 1, 1, 1, 1, 1,
-0.9179518, -0.01581022, 0.07564145, 1, 1, 1, 1, 1,
-0.9105073, -1.395593, -2.390738, 1, 1, 1, 1, 1,
-0.9014942, 2.25938, 0.56731, 1, 1, 1, 1, 1,
-0.8991244, 0.3549519, -0.6483885, 1, 1, 1, 1, 1,
-0.8983582, 0.2256915, -0.7601848, 1, 1, 1, 1, 1,
-0.8951439, -1.288446, -1.704749, 1, 1, 1, 1, 1,
-0.8858452, 0.9000502, -1.418485, 0, 0, 1, 1, 1,
-0.8848947, 0.669465, 0.08142511, 1, 0, 0, 1, 1,
-0.8840871, -0.05257296, -1.050407, 1, 0, 0, 1, 1,
-0.8818606, -0.7314099, -1.31961, 1, 0, 0, 1, 1,
-0.8782553, 1.663979, -1.441965, 1, 0, 0, 1, 1,
-0.8766444, 1.160586, -0.9058589, 1, 0, 0, 1, 1,
-0.8758426, -0.1475269, -2.372206, 0, 0, 0, 1, 1,
-0.8741542, -2.285467, -3.548757, 0, 0, 0, 1, 1,
-0.8736624, 0.2640524, -1.156299, 0, 0, 0, 1, 1,
-0.8730895, 1.433196, -0.7237402, 0, 0, 0, 1, 1,
-0.8697808, 0.8816324, -1.818558, 0, 0, 0, 1, 1,
-0.8686422, 0.5040168, -2.247728, 0, 0, 0, 1, 1,
-0.8588023, -0.5860795, -1.687347, 0, 0, 0, 1, 1,
-0.8584434, -0.7431366, -1.497768, 1, 1, 1, 1, 1,
-0.8581197, 0.2044472, 0.5779595, 1, 1, 1, 1, 1,
-0.8568866, -0.3052979, -2.88853, 1, 1, 1, 1, 1,
-0.8540235, -1.65174, -1.370656, 1, 1, 1, 1, 1,
-0.8477278, -0.8566682, -1.939538, 1, 1, 1, 1, 1,
-0.847065, 0.1143525, -2.404065, 1, 1, 1, 1, 1,
-0.8468407, 0.6384649, -2.614108, 1, 1, 1, 1, 1,
-0.8465459, 0.6746285, -0.5398126, 1, 1, 1, 1, 1,
-0.8445802, -0.9226436, -3.714275, 1, 1, 1, 1, 1,
-0.8437867, 0.3650993, -2.054316, 1, 1, 1, 1, 1,
-0.8426502, 0.6632794, -0.4130891, 1, 1, 1, 1, 1,
-0.8420641, -0.593176, -1.966477, 1, 1, 1, 1, 1,
-0.8396751, 0.04280129, -1.156909, 1, 1, 1, 1, 1,
-0.838588, 0.5791963, 1.279134, 1, 1, 1, 1, 1,
-0.8376828, -0.07515582, -1.805094, 1, 1, 1, 1, 1,
-0.836709, -1.634664, -2.919333, 0, 0, 1, 1, 1,
-0.8364503, 1.014427, -0.1815126, 1, 0, 0, 1, 1,
-0.8357997, -1.055424, -2.256623, 1, 0, 0, 1, 1,
-0.8276794, -2.285647, -2.473624, 1, 0, 0, 1, 1,
-0.8264992, 0.7012571, -0.3896536, 1, 0, 0, 1, 1,
-0.8253683, 0.02606332, -1.919839, 1, 0, 0, 1, 1,
-0.8238569, -0.8914824, -1.069596, 0, 0, 0, 1, 1,
-0.8189806, 0.6386421, -0.5924286, 0, 0, 0, 1, 1,
-0.8091753, 0.3901507, -1.550436, 0, 0, 0, 1, 1,
-0.8080592, -1.401802, -3.601702, 0, 0, 0, 1, 1,
-0.8080348, -0.158152, -2.1612, 0, 0, 0, 1, 1,
-0.801899, -1.184043, -1.746915, 0, 0, 0, 1, 1,
-0.7972367, 0.6588854, -2.091934, 0, 0, 0, 1, 1,
-0.786329, 1.503426, -1.476246, 1, 1, 1, 1, 1,
-0.7857462, -0.3580879, -0.7730361, 1, 1, 1, 1, 1,
-0.7731439, 0.2210884, -0.5866511, 1, 1, 1, 1, 1,
-0.765749, -1.04656, -1.570614, 1, 1, 1, 1, 1,
-0.750831, 0.06005192, -1.609723, 1, 1, 1, 1, 1,
-0.7448896, -1.78966, -3.299476, 1, 1, 1, 1, 1,
-0.7402827, -1.441375, -2.191905, 1, 1, 1, 1, 1,
-0.7382181, 1.10958, -0.5111436, 1, 1, 1, 1, 1,
-0.7333511, -0.3210535, -1.559734, 1, 1, 1, 1, 1,
-0.7308776, 0.5555847, -0.2233611, 1, 1, 1, 1, 1,
-0.7268237, -0.1802276, -2.732816, 1, 1, 1, 1, 1,
-0.7233174, 0.3349309, 0.0800993, 1, 1, 1, 1, 1,
-0.7174631, -1.200466, -4.329201, 1, 1, 1, 1, 1,
-0.7163911, 0.001331642, -3.903251, 1, 1, 1, 1, 1,
-0.7150135, -0.04264359, -1.525196, 1, 1, 1, 1, 1,
-0.7130139, 1.136893, -0.006067882, 0, 0, 1, 1, 1,
-0.7118296, -0.1803224, -0.9938715, 1, 0, 0, 1, 1,
-0.7115431, 0.4244826, -1.169009, 1, 0, 0, 1, 1,
-0.7107589, 0.846289, -1.175606, 1, 0, 0, 1, 1,
-0.7095746, -1.449438, -0.6979008, 1, 0, 0, 1, 1,
-0.7049357, -0.7273668, -0.0240227, 1, 0, 0, 1, 1,
-0.7047305, 1.205365, -0.6576993, 0, 0, 0, 1, 1,
-0.7018784, 0.5333599, -1.837914, 0, 0, 0, 1, 1,
-0.7005157, 0.3154531, -0.9093333, 0, 0, 0, 1, 1,
-0.6966544, 1.717387, -1.587086, 0, 0, 0, 1, 1,
-0.6866133, -0.02576928, 0.2355978, 0, 0, 0, 1, 1,
-0.6812921, -0.3511513, -1.529571, 0, 0, 0, 1, 1,
-0.6778983, 0.6363021, -2.133949, 0, 0, 0, 1, 1,
-0.6775002, 0.4904367, 1.421291, 1, 1, 1, 1, 1,
-0.6745894, -1.428889, -2.542629, 1, 1, 1, 1, 1,
-0.6731341, -0.3441463, -2.440076, 1, 1, 1, 1, 1,
-0.6709111, -1.22373, -1.192613, 1, 1, 1, 1, 1,
-0.6687837, 0.3579739, -0.516125, 1, 1, 1, 1, 1,
-0.665773, 0.1558204, -2.156099, 1, 1, 1, 1, 1,
-0.6619771, 0.01666548, -1.068767, 1, 1, 1, 1, 1,
-0.661718, 0.9481015, -0.7440355, 1, 1, 1, 1, 1,
-0.6591084, -0.6215392, -2.100757, 1, 1, 1, 1, 1,
-0.6577203, -1.751167, -2.353437, 1, 1, 1, 1, 1,
-0.6480212, -1.373364, -2.737614, 1, 1, 1, 1, 1,
-0.6458676, -0.1082509, -1.078802, 1, 1, 1, 1, 1,
-0.6457061, -0.4167041, -1.255224, 1, 1, 1, 1, 1,
-0.6455849, 0.2030945, -1.767578, 1, 1, 1, 1, 1,
-0.6436717, 0.2595422, -0.8177373, 1, 1, 1, 1, 1,
-0.6411271, 1.029187, 0.01113911, 0, 0, 1, 1, 1,
-0.639137, 0.5120373, -0.2290157, 1, 0, 0, 1, 1,
-0.6337787, 0.6014003, -0.268818, 1, 0, 0, 1, 1,
-0.6289949, -0.4639786, -3.533777, 1, 0, 0, 1, 1,
-0.6271427, 0.2187552, -1.379562, 1, 0, 0, 1, 1,
-0.6270236, -0.5232852, -2.452769, 1, 0, 0, 1, 1,
-0.6230179, -0.1889726, -1.242345, 0, 0, 0, 1, 1,
-0.6224018, -0.2071187, -1.936144, 0, 0, 0, 1, 1,
-0.6154934, -0.4349337, -2.086007, 0, 0, 0, 1, 1,
-0.6065196, 1.883766, 0.08897355, 0, 0, 0, 1, 1,
-0.5985981, 0.298077, -1.953568, 0, 0, 0, 1, 1,
-0.5964262, 0.4413677, -2.413049, 0, 0, 0, 1, 1,
-0.5962657, -0.4309337, -1.851562, 0, 0, 0, 1, 1,
-0.5929545, 0.4238276, -0.9771289, 1, 1, 1, 1, 1,
-0.5810741, 0.7113386, -1.024069, 1, 1, 1, 1, 1,
-0.5793222, -0.01824297, -0.4329477, 1, 1, 1, 1, 1,
-0.5788289, -0.4716557, -3.267591, 1, 1, 1, 1, 1,
-0.5747271, 0.6230919, 0.7791148, 1, 1, 1, 1, 1,
-0.5656278, -0.1767309, -0.4980471, 1, 1, 1, 1, 1,
-0.563139, -1.660668, -2.851884, 1, 1, 1, 1, 1,
-0.5617783, 0.7360781, -2.723642, 1, 1, 1, 1, 1,
-0.5587958, 2.329464, -1.452517, 1, 1, 1, 1, 1,
-0.5583214, -0.4515099, -2.969004, 1, 1, 1, 1, 1,
-0.5579894, -0.4472797, -1.177539, 1, 1, 1, 1, 1,
-0.5465893, 0.2464586, 1.386888, 1, 1, 1, 1, 1,
-0.5439722, -1.743978, -2.40176, 1, 1, 1, 1, 1,
-0.5436323, -1.96894, -2.624796, 1, 1, 1, 1, 1,
-0.5435421, 0.3998483, -0.6322975, 1, 1, 1, 1, 1,
-0.5392503, 3.251692, -2.458769, 0, 0, 1, 1, 1,
-0.5390348, 0.1012351, -1.843541, 1, 0, 0, 1, 1,
-0.5332731, -0.8398182, -1.378683, 1, 0, 0, 1, 1,
-0.5320216, -1.043773, -1.75003, 1, 0, 0, 1, 1,
-0.5318926, -0.2301799, -1.182474, 1, 0, 0, 1, 1,
-0.5303586, -0.555106, -1.17028, 1, 0, 0, 1, 1,
-0.5263099, -0.7843918, -3.244462, 0, 0, 0, 1, 1,
-0.5261012, 0.06477384, -1.914094, 0, 0, 0, 1, 1,
-0.5245441, 0.6413904, -0.4221097, 0, 0, 0, 1, 1,
-0.5241215, -1.175777, -3.329681, 0, 0, 0, 1, 1,
-0.5224335, 0.4655574, -0.01357466, 0, 0, 0, 1, 1,
-0.5206653, -0.6522951, -2.458811, 0, 0, 0, 1, 1,
-0.5143642, 1.142213, 0.006964198, 0, 0, 0, 1, 1,
-0.5097542, 0.1659197, -1.788301, 1, 1, 1, 1, 1,
-0.5073975, -0.5269725, -3.351624, 1, 1, 1, 1, 1,
-0.505872, 0.119868, -3.12214, 1, 1, 1, 1, 1,
-0.5015844, -0.3667406, -2.368885, 1, 1, 1, 1, 1,
-0.4988325, 0.3268542, -2.59032, 1, 1, 1, 1, 1,
-0.497683, -1.401387, -3.286071, 1, 1, 1, 1, 1,
-0.4966175, 2.674787, -1.50958, 1, 1, 1, 1, 1,
-0.4956849, -0.1421474, -0.8511773, 1, 1, 1, 1, 1,
-0.49561, -0.1134106, -0.5853599, 1, 1, 1, 1, 1,
-0.4953641, 0.6016145, -0.9820853, 1, 1, 1, 1, 1,
-0.4915905, 0.4572357, -0.7820476, 1, 1, 1, 1, 1,
-0.4873935, 0.6744009, 0.9040011, 1, 1, 1, 1, 1,
-0.4854696, -1.590347, -3.281646, 1, 1, 1, 1, 1,
-0.4779171, 0.2384127, 1.052687, 1, 1, 1, 1, 1,
-0.4766788, 0.6017326, -0.1485005, 1, 1, 1, 1, 1,
-0.4759624, -1.28121, -4.721561, 0, 0, 1, 1, 1,
-0.4752604, -0.09757578, -1.051809, 1, 0, 0, 1, 1,
-0.4735341, 1.375198, -1.798252, 1, 0, 0, 1, 1,
-0.4695304, 0.8595557, -0.1783291, 1, 0, 0, 1, 1,
-0.4686737, -1.32867, -2.03551, 1, 0, 0, 1, 1,
-0.4666007, 0.1793595, 0.5577009, 1, 0, 0, 1, 1,
-0.4664008, 0.9233799, 1.094875, 0, 0, 0, 1, 1,
-0.4660386, -0.08962171, -2.335397, 0, 0, 0, 1, 1,
-0.4611206, -1.40353, -2.894409, 0, 0, 0, 1, 1,
-0.4604234, 0.3373633, -2.164116, 0, 0, 0, 1, 1,
-0.4601527, 1.006883, 1.243842, 0, 0, 0, 1, 1,
-0.4587232, 0.02316037, -2.403981, 0, 0, 0, 1, 1,
-0.4574184, 0.2038903, -0.4919877, 0, 0, 0, 1, 1,
-0.4546658, 0.963405, -0.6470709, 1, 1, 1, 1, 1,
-0.4516532, -0.3704704, -3.909242, 1, 1, 1, 1, 1,
-0.4505171, 2.444854, -2.40963, 1, 1, 1, 1, 1,
-0.4461854, 0.7903969, -0.3144338, 1, 1, 1, 1, 1,
-0.4460526, -0.4170947, -4.015785, 1, 1, 1, 1, 1,
-0.4445789, 0.872392, -1.035235, 1, 1, 1, 1, 1,
-0.44115, -0.6002162, -0.9045413, 1, 1, 1, 1, 1,
-0.4408269, 0.9944553, 1.408552, 1, 1, 1, 1, 1,
-0.439614, 0.8657648, 0.1665527, 1, 1, 1, 1, 1,
-0.439187, -0.560496, -2.960105, 1, 1, 1, 1, 1,
-0.4384052, -1.044343, -3.699326, 1, 1, 1, 1, 1,
-0.437624, 0.4156437, -0.976963, 1, 1, 1, 1, 1,
-0.4357876, -0.1215729, -0.0641866, 1, 1, 1, 1, 1,
-0.4331573, 0.6376113, -0.4664111, 1, 1, 1, 1, 1,
-0.4232465, 0.7518948, 0.08671597, 1, 1, 1, 1, 1,
-0.4185072, -1.655547, -3.2264, 0, 0, 1, 1, 1,
-0.4164432, -0.1098868, -1.474772, 1, 0, 0, 1, 1,
-0.4161117, -1.171128, -2.266292, 1, 0, 0, 1, 1,
-0.4055074, -2.333178, -3.869531, 1, 0, 0, 1, 1,
-0.4014474, -2.613773, -4.114461, 1, 0, 0, 1, 1,
-0.4005438, -2.657578, -3.861235, 1, 0, 0, 1, 1,
-0.3974181, 1.72741, 0.2629056, 0, 0, 0, 1, 1,
-0.3947841, -0.1669081, -2.794454, 0, 0, 0, 1, 1,
-0.3933589, 1.181024, 0.6822796, 0, 0, 0, 1, 1,
-0.3891475, 1.645323, -0.9799818, 0, 0, 0, 1, 1,
-0.3874384, 1.991359, -1.290429, 0, 0, 0, 1, 1,
-0.3873793, -1.32679, -2.828017, 0, 0, 0, 1, 1,
-0.3860447, -1.383445, -3.914418, 0, 0, 0, 1, 1,
-0.3839238, 0.4108321, -1.313118, 1, 1, 1, 1, 1,
-0.3806387, 0.9392252, -0.0968916, 1, 1, 1, 1, 1,
-0.3776079, -0.8024038, -4.059545, 1, 1, 1, 1, 1,
-0.3753701, -0.1412591, -1.7181, 1, 1, 1, 1, 1,
-0.3747233, 1.863885, -0.8078915, 1, 1, 1, 1, 1,
-0.3657224, -0.486451, -2.969357, 1, 1, 1, 1, 1,
-0.3633042, -0.1277997, -3.126049, 1, 1, 1, 1, 1,
-0.3588964, -0.9918337, -3.379239, 1, 1, 1, 1, 1,
-0.3575332, 0.9544796, 0.2340833, 1, 1, 1, 1, 1,
-0.3564098, 0.3797585, 1.362189, 1, 1, 1, 1, 1,
-0.3552083, 1.094753, 1.773428, 1, 1, 1, 1, 1,
-0.3489851, -0.6706582, -2.81435, 1, 1, 1, 1, 1,
-0.3445116, -1.128902, -3.30377, 1, 1, 1, 1, 1,
-0.343709, 0.4084872, -1.543097, 1, 1, 1, 1, 1,
-0.3433919, 1.502771, -2.532964, 1, 1, 1, 1, 1,
-0.3414034, 1.742685, 0.2986515, 0, 0, 1, 1, 1,
-0.3398167, 0.1212904, -1.501361, 1, 0, 0, 1, 1,
-0.3390526, 0.7112045, -0.3294309, 1, 0, 0, 1, 1,
-0.3361481, -0.4556573, -2.092166, 1, 0, 0, 1, 1,
-0.333587, -0.6081069, -3.843637, 1, 0, 0, 1, 1,
-0.3329569, 0.4927087, 0.2654364, 1, 0, 0, 1, 1,
-0.32643, -0.5668889, -1.887757, 0, 0, 0, 1, 1,
-0.3249094, -1.262758, -3.24289, 0, 0, 0, 1, 1,
-0.3202397, 0.151453, -2.067692, 0, 0, 0, 1, 1,
-0.319114, -0.9812397, -2.041481, 0, 0, 0, 1, 1,
-0.3179442, 0.757286, 0.04935265, 0, 0, 0, 1, 1,
-0.3134845, 1.303618, 0.008852183, 0, 0, 0, 1, 1,
-0.3125817, 0.2896158, -0.6243736, 0, 0, 0, 1, 1,
-0.3125554, -0.7024772, -2.847262, 1, 1, 1, 1, 1,
-0.312359, 1.114222, 0.3200986, 1, 1, 1, 1, 1,
-0.3082203, -1.302554, -2.463835, 1, 1, 1, 1, 1,
-0.3052877, -1.112017, -3.376283, 1, 1, 1, 1, 1,
-0.3008049, -1.131453, -3.10995, 1, 1, 1, 1, 1,
-0.2941233, -1.719582, -2.956374, 1, 1, 1, 1, 1,
-0.2940474, 0.3846047, -1.465019, 1, 1, 1, 1, 1,
-0.2875344, 0.4225295, -1.047978, 1, 1, 1, 1, 1,
-0.2812037, -0.7433314, -3.446418, 1, 1, 1, 1, 1,
-0.2761695, -0.9924067, -3.249729, 1, 1, 1, 1, 1,
-0.2739903, 0.4619499, -1.073107, 1, 1, 1, 1, 1,
-0.271594, -0.7096525, -3.68849, 1, 1, 1, 1, 1,
-0.2695118, -0.01508714, -2.408036, 1, 1, 1, 1, 1,
-0.2688603, -0.4567694, -3.493888, 1, 1, 1, 1, 1,
-0.2688514, 0.1501775, -1.061937, 1, 1, 1, 1, 1,
-0.263836, 0.6718214, -0.2325352, 0, 0, 1, 1, 1,
-0.2637171, 1.801946, -0.5604263, 1, 0, 0, 1, 1,
-0.2630439, -1.981818, -3.881794, 1, 0, 0, 1, 1,
-0.2627604, -0.2545709, -1.415327, 1, 0, 0, 1, 1,
-0.2626462, 1.300032, -0.3969981, 1, 0, 0, 1, 1,
-0.2610826, -0.6819222, -1.28422, 1, 0, 0, 1, 1,
-0.2529204, 0.3043211, -0.5418724, 0, 0, 0, 1, 1,
-0.2511378, -0.7417667, -1.562322, 0, 0, 0, 1, 1,
-0.247476, -1.556286, -3.444077, 0, 0, 0, 1, 1,
-0.2411775, 0.4660209, 0.1310426, 0, 0, 0, 1, 1,
-0.2382723, -0.1223939, -1.749997, 0, 0, 0, 1, 1,
-0.2364137, -0.6173727, -2.251755, 0, 0, 0, 1, 1,
-0.2348724, -0.3522846, -2.311752, 0, 0, 0, 1, 1,
-0.2311885, -1.079757, -3.194444, 1, 1, 1, 1, 1,
-0.2250745, 0.05118507, -0.8776847, 1, 1, 1, 1, 1,
-0.2186464, -0.3027535, -2.868566, 1, 1, 1, 1, 1,
-0.2163386, -1.202671, -2.729402, 1, 1, 1, 1, 1,
-0.2142922, -0.2073532, -1.177596, 1, 1, 1, 1, 1,
-0.2124513, -1.369492, -4.040781, 1, 1, 1, 1, 1,
-0.2109689, -0.2852872, -1.389295, 1, 1, 1, 1, 1,
-0.2056606, 1.079721, -1.332802, 1, 1, 1, 1, 1,
-0.1923562, 0.8768178, -0.8920671, 1, 1, 1, 1, 1,
-0.1901458, -0.6275055, -0.9674665, 1, 1, 1, 1, 1,
-0.1885169, -0.6235026, -3.235328, 1, 1, 1, 1, 1,
-0.1859531, 0.3972566, -0.7080703, 1, 1, 1, 1, 1,
-0.1856395, 0.3497977, -1.414184, 1, 1, 1, 1, 1,
-0.1823758, -2.000041, -2.724228, 1, 1, 1, 1, 1,
-0.1813501, -0.4903111, -3.023307, 1, 1, 1, 1, 1,
-0.1777469, 0.7958178, -1.549734, 0, 0, 1, 1, 1,
-0.1762669, -1.675542, -3.245509, 1, 0, 0, 1, 1,
-0.1752982, 0.2691892, -1.004385, 1, 0, 0, 1, 1,
-0.1747307, -0.3325923, -1.634894, 1, 0, 0, 1, 1,
-0.1746665, 0.481874, 0.00967459, 1, 0, 0, 1, 1,
-0.165924, 0.5623171, -0.1787612, 1, 0, 0, 1, 1,
-0.162966, -0.116508, -1.866724, 0, 0, 0, 1, 1,
-0.1626608, 0.6451112, 0.04521124, 0, 0, 0, 1, 1,
-0.1613402, 0.05130225, -1.626745, 0, 0, 0, 1, 1,
-0.1609396, 0.4569421, -0.9151006, 0, 0, 0, 1, 1,
-0.1608942, 1.204235, 1.144576, 0, 0, 0, 1, 1,
-0.1584179, -0.1995988, -3.245343, 0, 0, 0, 1, 1,
-0.1553799, 1.497947, 0.8600247, 0, 0, 0, 1, 1,
-0.1513404, 0.6217803, -0.854612, 1, 1, 1, 1, 1,
-0.1504759, 0.1365167, 1.904951, 1, 1, 1, 1, 1,
-0.1490785, -0.2794308, -2.059384, 1, 1, 1, 1, 1,
-0.149024, 0.6599777, -0.4468426, 1, 1, 1, 1, 1,
-0.1470805, 0.4759589, 1.064404, 1, 1, 1, 1, 1,
-0.1430505, -0.761484, -2.058675, 1, 1, 1, 1, 1,
-0.1412354, -1.992793, -3.10535, 1, 1, 1, 1, 1,
-0.1398741, 0.03847645, -1.439672, 1, 1, 1, 1, 1,
-0.1358408, -0.2175504, -3.819471, 1, 1, 1, 1, 1,
-0.1354009, 1.068804, -1.061494, 1, 1, 1, 1, 1,
-0.1346415, -0.4572575, -5.241077, 1, 1, 1, 1, 1,
-0.1336227, -0.4819872, -0.8531668, 1, 1, 1, 1, 1,
-0.1243609, 0.0457548, -1.557775, 1, 1, 1, 1, 1,
-0.1229668, 0.2073055, -0.5777668, 1, 1, 1, 1, 1,
-0.1197347, -0.5150101, -3.327922, 1, 1, 1, 1, 1,
-0.1192463, -1.129646, -1.978831, 0, 0, 1, 1, 1,
-0.1170666, 0.2679988, -0.6791875, 1, 0, 0, 1, 1,
-0.1169893, -1.256699, -3.325112, 1, 0, 0, 1, 1,
-0.1165164, -0.7586316, -3.205992, 1, 0, 0, 1, 1,
-0.1111928, -0.1604459, -3.703435, 1, 0, 0, 1, 1,
-0.1093906, 0.1383477, -0.4965383, 1, 0, 0, 1, 1,
-0.1067334, -0.09604869, -3.694711, 0, 0, 0, 1, 1,
-0.1032946, 0.6695417, 1.096083, 0, 0, 0, 1, 1,
-0.1014421, -0.8911638, -1.885085, 0, 0, 0, 1, 1,
-0.1005801, -0.5023052, -3.009631, 0, 0, 0, 1, 1,
-0.09643641, -0.3379336, -2.384678, 0, 0, 0, 1, 1,
-0.09425214, -0.1556409, -2.996033, 0, 0, 0, 1, 1,
-0.08584254, -0.4113362, -4.285275, 0, 0, 0, 1, 1,
-0.08496111, 1.209048, -1.807684, 1, 1, 1, 1, 1,
-0.08091132, 0.2104926, -0.3661012, 1, 1, 1, 1, 1,
-0.08081122, -0.8438306, -2.833815, 1, 1, 1, 1, 1,
-0.07923301, 0.6522292, -0.05894514, 1, 1, 1, 1, 1,
-0.06831897, -1.170224, -4.10096, 1, 1, 1, 1, 1,
-0.06419621, -3.627036, -3.750898, 1, 1, 1, 1, 1,
-0.06121405, -0.6872956, -2.244691, 1, 1, 1, 1, 1,
-0.05940888, 0.1725066, 0.6733418, 1, 1, 1, 1, 1,
-0.05618723, -1.966503, -2.03099, 1, 1, 1, 1, 1,
-0.05528086, 1.226448, 0.01507824, 1, 1, 1, 1, 1,
-0.05467284, 0.2110661, 0.3885902, 1, 1, 1, 1, 1,
-0.05178445, -0.6662166, -3.887743, 1, 1, 1, 1, 1,
-0.04997195, -2.162311, -2.442421, 1, 1, 1, 1, 1,
-0.04877866, -0.5981442, -1.783957, 1, 1, 1, 1, 1,
-0.04786004, -0.07338702, -2.929479, 1, 1, 1, 1, 1,
-0.04784262, 1.365822, -0.3849761, 0, 0, 1, 1, 1,
-0.04769017, -0.481, -3.127445, 1, 0, 0, 1, 1,
-0.0460316, 1.262193, -0.7943806, 1, 0, 0, 1, 1,
-0.04335202, 1.633747, 0.1414196, 1, 0, 0, 1, 1,
-0.04100389, -0.1329593, -2.09628, 1, 0, 0, 1, 1,
-0.04064339, -0.4151948, -4.652876, 1, 0, 0, 1, 1,
-0.03977675, -0.03425528, -2.826296, 0, 0, 0, 1, 1,
-0.03928991, -0.8406534, -3.240777, 0, 0, 0, 1, 1,
-0.03814753, 0.1136399, -0.5701054, 0, 0, 0, 1, 1,
-0.03601044, 0.5271269, -0.7372156, 0, 0, 0, 1, 1,
-0.03470218, 0.2853518, -0.07221919, 0, 0, 0, 1, 1,
-0.02880806, -0.05074372, -1.922395, 0, 0, 0, 1, 1,
-0.02539187, 2.949276, 0.2653571, 0, 0, 0, 1, 1,
-0.02297551, 0.2033475, -0.3703589, 1, 1, 1, 1, 1,
-0.02086015, 1.539406, 0.8087648, 1, 1, 1, 1, 1,
-0.01816974, -0.06661425, -4.444141, 1, 1, 1, 1, 1,
-0.01812267, -1.622604, -3.347713, 1, 1, 1, 1, 1,
-0.01777996, 0.2154036, -0.4702152, 1, 1, 1, 1, 1,
-0.01768452, -1.098867, -3.813041, 1, 1, 1, 1, 1,
-0.01655624, 1.399774, 0.01333441, 1, 1, 1, 1, 1,
-0.01491194, 0.3259703, 0.9782078, 1, 1, 1, 1, 1,
-0.01107157, 0.6907594, -1.233592, 1, 1, 1, 1, 1,
-0.00993961, 0.4408098, -0.8742164, 1, 1, 1, 1, 1,
-0.009746318, -0.1821422, -2.634598, 1, 1, 1, 1, 1,
-0.005043025, 0.2988719, 0.06402297, 1, 1, 1, 1, 1,
-0.002034973, 0.1065744, -2.037437, 1, 1, 1, 1, 1,
-0.0006113724, -0.5275456, -3.744308, 1, 1, 1, 1, 1,
3.005483e-07, -0.4242423, 3.322814, 1, 1, 1, 1, 1,
0.004462829, 0.502053, -0.4445956, 0, 0, 1, 1, 1,
0.006193949, 0.1578639, -0.7136489, 1, 0, 0, 1, 1,
0.01149318, 1.232778, 0.2084759, 1, 0, 0, 1, 1,
0.0143081, 0.3433672, 0.8271754, 1, 0, 0, 1, 1,
0.01507449, -1.097045, 1.01237, 1, 0, 0, 1, 1,
0.01557227, -0.1850959, 3.144609, 1, 0, 0, 1, 1,
0.02018907, -1.278104, 3.179456, 0, 0, 0, 1, 1,
0.02133887, 0.1793953, 0.06886692, 0, 0, 0, 1, 1,
0.02550956, -0.9236743, 1.906273, 0, 0, 0, 1, 1,
0.02894552, -0.9723058, 2.550514, 0, 0, 0, 1, 1,
0.0343884, -0.2353085, 1.784252, 0, 0, 0, 1, 1,
0.04108011, -0.1023801, 4.773404, 0, 0, 0, 1, 1,
0.04212931, -0.6464451, 2.72878, 0, 0, 0, 1, 1,
0.04341634, -0.3732748, 3.126216, 1, 1, 1, 1, 1,
0.04801526, 1.247628, -0.1696378, 1, 1, 1, 1, 1,
0.05032811, -0.3344429, 4.070501, 1, 1, 1, 1, 1,
0.05447394, 0.671595, 0.4497864, 1, 1, 1, 1, 1,
0.05633313, -0.8185369, 2.357162, 1, 1, 1, 1, 1,
0.05771459, -0.5491915, 2.575416, 1, 1, 1, 1, 1,
0.06534347, 0.6431719, 2.013307, 1, 1, 1, 1, 1,
0.06626576, 0.3976981, 0.5387904, 1, 1, 1, 1, 1,
0.06720231, -0.6097026, 2.08543, 1, 1, 1, 1, 1,
0.06844912, -0.4501081, 2.372698, 1, 1, 1, 1, 1,
0.06971052, 0.3811014, -0.08400477, 1, 1, 1, 1, 1,
0.07001016, -1.323399, 3.014631, 1, 1, 1, 1, 1,
0.07014337, -1.811949, 2.700446, 1, 1, 1, 1, 1,
0.07670484, 0.07149328, -0.4315712, 1, 1, 1, 1, 1,
0.07736658, 0.01430427, 0.8460367, 1, 1, 1, 1, 1,
0.07898118, 0.8036509, -0.9060658, 0, 0, 1, 1, 1,
0.07953514, 1.658365, 0.5238709, 1, 0, 0, 1, 1,
0.08100763, -0.814556, 1.714523, 1, 0, 0, 1, 1,
0.0861285, -0.1271896, 3.694525, 1, 0, 0, 1, 1,
0.08753865, 0.4979115, 1.707531, 1, 0, 0, 1, 1,
0.08790104, -0.2121311, 1.930781, 1, 0, 0, 1, 1,
0.09902526, 0.1251366, 1.885248, 0, 0, 0, 1, 1,
0.1005207, 0.600722, 1.046325, 0, 0, 0, 1, 1,
0.1024173, 0.5039489, 0.8125045, 0, 0, 0, 1, 1,
0.1096257, -0.4246905, 3.099724, 0, 0, 0, 1, 1,
0.1104361, -1.60274, 3.472054, 0, 0, 0, 1, 1,
0.1104364, 0.2545799, -0.8118693, 0, 0, 0, 1, 1,
0.113354, -0.002126432, 1.185883, 0, 0, 0, 1, 1,
0.1172851, 0.101348, 0.7270068, 1, 1, 1, 1, 1,
0.1173812, 0.330592, 1.72095, 1, 1, 1, 1, 1,
0.1177516, -1.411839, 3.090987, 1, 1, 1, 1, 1,
0.1199834, 1.370806, 0.03558034, 1, 1, 1, 1, 1,
0.1244948, -0.02494495, 1.831082, 1, 1, 1, 1, 1,
0.1334712, -0.6547085, 2.809072, 1, 1, 1, 1, 1,
0.1344018, -1.131451, 2.470377, 1, 1, 1, 1, 1,
0.1376243, 0.6280453, -0.2317099, 1, 1, 1, 1, 1,
0.1380168, 0.6884674, 1.130572, 1, 1, 1, 1, 1,
0.1412702, 0.8914017, 0.9408242, 1, 1, 1, 1, 1,
0.1446119, -0.6442661, 1.065282, 1, 1, 1, 1, 1,
0.1501956, -1.987301, 1.04236, 1, 1, 1, 1, 1,
0.1504907, 1.054943, -1.104599, 1, 1, 1, 1, 1,
0.1526257, -1.046216, 3.773299, 1, 1, 1, 1, 1,
0.1676495, 0.8231578, 1.490527, 1, 1, 1, 1, 1,
0.1681201, 1.464635, -0.4026494, 0, 0, 1, 1, 1,
0.1714738, 0.6627614, -0.3052044, 1, 0, 0, 1, 1,
0.181208, -0.4700298, 3.229169, 1, 0, 0, 1, 1,
0.1822353, -0.4264316, 2.010081, 1, 0, 0, 1, 1,
0.1873053, -0.4736356, 1.437791, 1, 0, 0, 1, 1,
0.1941981, -0.1936251, 2.961392, 1, 0, 0, 1, 1,
0.195418, 0.8353621, 1.112361, 0, 0, 0, 1, 1,
0.1992129, 0.09508226, 0.9496939, 0, 0, 0, 1, 1,
0.1996049, -1.205242, 3.648389, 0, 0, 0, 1, 1,
0.2045662, 0.1469484, 0.1791883, 0, 0, 0, 1, 1,
0.2049738, 1.147838, 0.5110635, 0, 0, 0, 1, 1,
0.2050919, -0.3711835, 1.676372, 0, 0, 0, 1, 1,
0.2059429, 0.6915062, -1.040814, 0, 0, 0, 1, 1,
0.2061131, 1.199478, 2.107297, 1, 1, 1, 1, 1,
0.2072395, 0.1856053, 1.862016, 1, 1, 1, 1, 1,
0.2083322, -0.495978, 2.773057, 1, 1, 1, 1, 1,
0.2099015, -0.5114954, 3.914966, 1, 1, 1, 1, 1,
0.2169527, -0.008644832, 0.7536426, 1, 1, 1, 1, 1,
0.2216387, 0.822661, -1.289806, 1, 1, 1, 1, 1,
0.224266, -0.702262, 4.320173, 1, 1, 1, 1, 1,
0.2248419, -0.1656774, 2.189131, 1, 1, 1, 1, 1,
0.2268124, 1.278633, -1.162942, 1, 1, 1, 1, 1,
0.2310508, 0.7048127, -1.051459, 1, 1, 1, 1, 1,
0.231235, -0.7428346, 1.754282, 1, 1, 1, 1, 1,
0.2326992, -0.3895335, 2.151061, 1, 1, 1, 1, 1,
0.2361593, -1.018558, 1.775584, 1, 1, 1, 1, 1,
0.24291, -0.4485092, 2.32342, 1, 1, 1, 1, 1,
0.247038, -0.506436, 3.440585, 1, 1, 1, 1, 1,
0.2517588, 1.904903, -0.6623634, 0, 0, 1, 1, 1,
0.2540746, -0.2955875, 4.192783, 1, 0, 0, 1, 1,
0.2563013, 2.175594, -0.6513265, 1, 0, 0, 1, 1,
0.2592241, 1.672311, -0.2701155, 1, 0, 0, 1, 1,
0.2598277, -0.8205879, 2.103368, 1, 0, 0, 1, 1,
0.2648996, -0.54122, 1.99646, 1, 0, 0, 1, 1,
0.2695137, 0.1817163, 2.29653, 0, 0, 0, 1, 1,
0.2705273, 0.06359886, 1.238303, 0, 0, 0, 1, 1,
0.2713123, -0.5175528, 4.949797, 0, 0, 0, 1, 1,
0.2719482, 1.041173, 0.5746664, 0, 0, 0, 1, 1,
0.2735071, -1.634022, 2.286443, 0, 0, 0, 1, 1,
0.2754579, -0.2621222, 3.066526, 0, 0, 0, 1, 1,
0.2790903, -1.971917, 4.818571, 0, 0, 0, 1, 1,
0.2860953, 0.2674561, 1.334576, 1, 1, 1, 1, 1,
0.2867534, -0.05848637, 2.088128, 1, 1, 1, 1, 1,
0.2901043, -0.501052, 3.026316, 1, 1, 1, 1, 1,
0.2940576, 1.205707, -0.4754014, 1, 1, 1, 1, 1,
0.3029201, -2.039711, 3.373536, 1, 1, 1, 1, 1,
0.3054498, -0.4675208, 1.761667, 1, 1, 1, 1, 1,
0.3063761, -0.1574125, 1.86555, 1, 1, 1, 1, 1,
0.3111058, 1.243051, 0.05129099, 1, 1, 1, 1, 1,
0.314548, 1.280116, -1.930278, 1, 1, 1, 1, 1,
0.3148574, -0.5249527, 3.076412, 1, 1, 1, 1, 1,
0.3155741, 0.9821212, -2.038105, 1, 1, 1, 1, 1,
0.3187537, 2.486518, 0.6616446, 1, 1, 1, 1, 1,
0.3240231, -0.4151268, 2.74376, 1, 1, 1, 1, 1,
0.325714, 1.664919, -0.481524, 1, 1, 1, 1, 1,
0.3286946, -0.2014477, 2.33093, 1, 1, 1, 1, 1,
0.332693, 0.7501453, -1.946016, 0, 0, 1, 1, 1,
0.336872, 0.3073565, -0.6829618, 1, 0, 0, 1, 1,
0.3378325, -0.5519572, 1.155512, 1, 0, 0, 1, 1,
0.3379345, 1.033921, 0.2771167, 1, 0, 0, 1, 1,
0.3391835, 1.226362, 0.06202748, 1, 0, 0, 1, 1,
0.3394366, 0.3937136, 0.6906858, 1, 0, 0, 1, 1,
0.3407424, 0.6535332, 0.9689133, 0, 0, 0, 1, 1,
0.3416753, -1.856132, 0.8854695, 0, 0, 0, 1, 1,
0.342051, -1.389566, 2.614578, 0, 0, 0, 1, 1,
0.3449864, -1.63313, 3.275015, 0, 0, 0, 1, 1,
0.3472795, -0.04101058, 2.200168, 0, 0, 0, 1, 1,
0.3525942, 1.506542, -0.1502471, 0, 0, 0, 1, 1,
0.361308, 0.297174, 0.2705076, 0, 0, 0, 1, 1,
0.3633675, -0.2674569, 1.430547, 1, 1, 1, 1, 1,
0.3652422, 0.2908988, -0.5685968, 1, 1, 1, 1, 1,
0.3676201, 1.11627, 2.484195, 1, 1, 1, 1, 1,
0.3682487, -0.05740179, 1.498942, 1, 1, 1, 1, 1,
0.3767545, 1.896739, 0.2753848, 1, 1, 1, 1, 1,
0.3775339, -1.59884, 3.007936, 1, 1, 1, 1, 1,
0.3838044, -0.789223, 4.311877, 1, 1, 1, 1, 1,
0.3842091, 0.1725163, 1.028101, 1, 1, 1, 1, 1,
0.3857597, 1.138473, -0.186447, 1, 1, 1, 1, 1,
0.385797, 2.736473, 1.374631, 1, 1, 1, 1, 1,
0.3919615, 0.003817185, 1.323707, 1, 1, 1, 1, 1,
0.4024486, 1.732145, -1.304159, 1, 1, 1, 1, 1,
0.4070691, 1.639412, 1.141929, 1, 1, 1, 1, 1,
0.4078574, 0.3480543, 1.897759, 1, 1, 1, 1, 1,
0.4087089, 0.2259446, 0.3480064, 1, 1, 1, 1, 1,
0.4114368, 1.232721, -1.370179, 0, 0, 1, 1, 1,
0.4123842, -0.4249552, 1.978366, 1, 0, 0, 1, 1,
0.4130287, -0.1467516, 3.103395, 1, 0, 0, 1, 1,
0.4142704, -0.7710929, 2.519634, 1, 0, 0, 1, 1,
0.4264598, -0.08712595, 2.219504, 1, 0, 0, 1, 1,
0.4334358, 0.423526, 0.02580491, 1, 0, 0, 1, 1,
0.4373586, -1.005471, 2.479944, 0, 0, 0, 1, 1,
0.439335, -1.498982, 2.594207, 0, 0, 0, 1, 1,
0.4422164, 0.7798372, 1.212077, 0, 0, 0, 1, 1,
0.4428935, -0.9815013, 1.802225, 0, 0, 0, 1, 1,
0.4451709, 0.3791965, 1.236495, 0, 0, 0, 1, 1,
0.4463215, 0.7644054, 0.4764768, 0, 0, 0, 1, 1,
0.4469408, -1.76955, 3.127464, 0, 0, 0, 1, 1,
0.4475644, 0.7552469, -0.2780078, 1, 1, 1, 1, 1,
0.4486069, 1.998585, -1.271104, 1, 1, 1, 1, 1,
0.4525524, 1.965153, -0.5886802, 1, 1, 1, 1, 1,
0.4540154, -1.329019, 2.88868, 1, 1, 1, 1, 1,
0.4550723, 0.0002803829, 0.7564018, 1, 1, 1, 1, 1,
0.4577622, 0.2988538, 2.634479, 1, 1, 1, 1, 1,
0.4591361, 1.548033, 1.596913, 1, 1, 1, 1, 1,
0.4603095, 0.8147758, 1.854622, 1, 1, 1, 1, 1,
0.4615233, -0.2424682, 2.408762, 1, 1, 1, 1, 1,
0.4647469, 0.9770477, -0.3572197, 1, 1, 1, 1, 1,
0.4664825, -0.3258926, 1.763858, 1, 1, 1, 1, 1,
0.4708815, -0.5509514, 3.912392, 1, 1, 1, 1, 1,
0.4716761, 0.01006587, 1.075411, 1, 1, 1, 1, 1,
0.4753288, -3.012345, 2.344161, 1, 1, 1, 1, 1,
0.4762684, 0.7630344, 1.41133, 1, 1, 1, 1, 1,
0.4823591, -0.1026454, 2.564572, 0, 0, 1, 1, 1,
0.4864045, -1.460466, 4.350402, 1, 0, 0, 1, 1,
0.4879785, 1.663124, -0.1776957, 1, 0, 0, 1, 1,
0.4929228, -0.3997757, 2.291306, 1, 0, 0, 1, 1,
0.4935704, 0.6765452, -0.5422348, 1, 0, 0, 1, 1,
0.4988855, 0.9971823, 0.2903318, 1, 0, 0, 1, 1,
0.5000491, -1.591008, 3.247368, 0, 0, 0, 1, 1,
0.5006931, 0.2509612, 1.505122, 0, 0, 0, 1, 1,
0.5008676, -1.482756, 1.655633, 0, 0, 0, 1, 1,
0.5029528, -0.8301438, 1.687784, 0, 0, 0, 1, 1,
0.5064747, 2.051507, 0.0202201, 0, 0, 0, 1, 1,
0.5159919, 0.9809967, -0.6064869, 0, 0, 0, 1, 1,
0.5204993, 0.460209, 0.538348, 0, 0, 0, 1, 1,
0.5206079, -0.1241542, 2.068252, 1, 1, 1, 1, 1,
0.522655, 0.2380473, 1.8135, 1, 1, 1, 1, 1,
0.5227516, -1.601943, 2.130677, 1, 1, 1, 1, 1,
0.5235599, 1.991263, 1.867542, 1, 1, 1, 1, 1,
0.5244337, -0.9296091, 3.417255, 1, 1, 1, 1, 1,
0.5254685, 0.2411952, 0.6187084, 1, 1, 1, 1, 1,
0.5256182, 0.80449, 0.4033355, 1, 1, 1, 1, 1,
0.5302398, 0.203151, 0.8369111, 1, 1, 1, 1, 1,
0.5312999, -0.460854, 0.05245864, 1, 1, 1, 1, 1,
0.5333204, 1.632842, 0.1699297, 1, 1, 1, 1, 1,
0.535334, -0.9720769, 1.472044, 1, 1, 1, 1, 1,
0.5388049, 0.3673921, 0.4758766, 1, 1, 1, 1, 1,
0.5391566, -1.843185, 0.529416, 1, 1, 1, 1, 1,
0.5422252, 0.5084782, -0.6943272, 1, 1, 1, 1, 1,
0.5455918, -0.7500973, 4.124663, 1, 1, 1, 1, 1,
0.5497634, 0.7216861, 1.042222, 0, 0, 1, 1, 1,
0.5511612, -0.9087248, 2.84309, 1, 0, 0, 1, 1,
0.5512679, -0.5410704, 2.425844, 1, 0, 0, 1, 1,
0.5553579, 0.07960402, 0.997206, 1, 0, 0, 1, 1,
0.5561636, -0.586639, 3.649847, 1, 0, 0, 1, 1,
0.5569226, 1.082428, -0.7217029, 1, 0, 0, 1, 1,
0.5575362, -0.5307361, 2.39859, 0, 0, 0, 1, 1,
0.5612316, -1.535677, 1.207649, 0, 0, 0, 1, 1,
0.5662878, 0.8578842, 0.9535596, 0, 0, 0, 1, 1,
0.5714729, 0.2116459, 0.759033, 0, 0, 0, 1, 1,
0.5729027, 0.6544838, -0.6807889, 0, 0, 0, 1, 1,
0.5762507, -1.231598, 3.862805, 0, 0, 0, 1, 1,
0.5774481, 0.5794895, 0.5295071, 0, 0, 0, 1, 1,
0.5843114, -0.7074454, 2.317523, 1, 1, 1, 1, 1,
0.5918817, -0.2338795, 2.3152, 1, 1, 1, 1, 1,
0.5955995, 1.051794, -0.2144313, 1, 1, 1, 1, 1,
0.5979322, -0.7707803, 2.512231, 1, 1, 1, 1, 1,
0.5979687, -1.574824, 1.65214, 1, 1, 1, 1, 1,
0.6014374, -0.3319852, 2.553244, 1, 1, 1, 1, 1,
0.6019579, 0.5019158, 1.897033, 1, 1, 1, 1, 1,
0.6029193, 0.4413444, 2.332079, 1, 1, 1, 1, 1,
0.6044161, -0.7231383, 2.411216, 1, 1, 1, 1, 1,
0.6125475, -0.9985415, 2.205399, 1, 1, 1, 1, 1,
0.6272126, -0.6176111, 2.032483, 1, 1, 1, 1, 1,
0.6339206, 0.9613159, -0.9614315, 1, 1, 1, 1, 1,
0.6397336, 0.2114599, -0.5044543, 1, 1, 1, 1, 1,
0.6434726, -1.630676, 3.340156, 1, 1, 1, 1, 1,
0.6438401, -0.4038934, 2.311376, 1, 1, 1, 1, 1,
0.6438986, 0.7795306, 3.145703, 0, 0, 1, 1, 1,
0.6453354, -0.05612722, 1.769098, 1, 0, 0, 1, 1,
0.6478046, -0.6642279, 1.413667, 1, 0, 0, 1, 1,
0.6486558, -0.07770548, 0.8446788, 1, 0, 0, 1, 1,
0.6492659, 0.09107423, 1.796688, 1, 0, 0, 1, 1,
0.6527053, 0.2085928, 1.33484, 1, 0, 0, 1, 1,
0.6646455, 0.4589407, 0.7065173, 0, 0, 0, 1, 1,
0.6664776, 0.6866152, 0.3233901, 0, 0, 0, 1, 1,
0.6707293, 0.2473431, 1.973694, 0, 0, 0, 1, 1,
0.6758966, 0.7782899, 0.8186265, 0, 0, 0, 1, 1,
0.6810715, -0.9300519, 1.497051, 0, 0, 0, 1, 1,
0.6814916, -0.2331622, 1.269262, 0, 0, 0, 1, 1,
0.6850994, -1.215834, 3.027816, 0, 0, 0, 1, 1,
0.687792, 0.8361409, 1.149975, 1, 1, 1, 1, 1,
0.6940218, -0.1310068, 1.070403, 1, 1, 1, 1, 1,
0.6964694, -0.6717317, 2.140001, 1, 1, 1, 1, 1,
0.6973108, -0.06372228, 1.627874, 1, 1, 1, 1, 1,
0.7007955, -0.6233079, 2.172348, 1, 1, 1, 1, 1,
0.706374, 1.94798, 0.7950553, 1, 1, 1, 1, 1,
0.7071718, -0.4408161, 1.93704, 1, 1, 1, 1, 1,
0.7080709, 0.4010762, -1.92499, 1, 1, 1, 1, 1,
0.7121534, -1.10112, 3.263612, 1, 1, 1, 1, 1,
0.7172517, -1.56662, 1.634525, 1, 1, 1, 1, 1,
0.7210955, 1.883899, 0.3862961, 1, 1, 1, 1, 1,
0.7211388, 1.209682, 1.688385, 1, 1, 1, 1, 1,
0.7258372, -0.5322248, 1.154785, 1, 1, 1, 1, 1,
0.7259641, -1.379518, 1.577422, 1, 1, 1, 1, 1,
0.7357439, -1.123502, 0.9953075, 1, 1, 1, 1, 1,
0.7378148, 0.0652798, 3.04168, 0, 0, 1, 1, 1,
0.7401732, -0.4034476, 0.7413138, 1, 0, 0, 1, 1,
0.7407904, 0.231131, 0.9867438, 1, 0, 0, 1, 1,
0.7412033, 1.145187, 0.4607968, 1, 0, 0, 1, 1,
0.7433335, -2.577036, 1.834645, 1, 0, 0, 1, 1,
0.7439134, 0.07388385, 3.498154, 1, 0, 0, 1, 1,
0.746253, 0.114558, 1.168957, 0, 0, 0, 1, 1,
0.7478172, -0.5982857, 2.079598, 0, 0, 0, 1, 1,
0.7507982, -1.422483, 3.825027, 0, 0, 0, 1, 1,
0.7516881, -0.1856558, 3.509483, 0, 0, 0, 1, 1,
0.7541167, -0.9132363, 3.193554, 0, 0, 0, 1, 1,
0.7609069, 1.401972, -0.01252451, 0, 0, 0, 1, 1,
0.7617424, -2.131952, 3.351401, 0, 0, 0, 1, 1,
0.7623695, 0.3597111, 1.590063, 1, 1, 1, 1, 1,
0.7636407, -1.141254, 4.090034, 1, 1, 1, 1, 1,
0.7731317, 0.8110754, -0.3104334, 1, 1, 1, 1, 1,
0.7747802, 1.179734, 1.293017, 1, 1, 1, 1, 1,
0.7762358, 0.7387734, 2.349715, 1, 1, 1, 1, 1,
0.7772801, -0.8167821, 2.714453, 1, 1, 1, 1, 1,
0.7820449, 1.350671, 0.764556, 1, 1, 1, 1, 1,
0.7852526, 0.9986546, 1.110804, 1, 1, 1, 1, 1,
0.7873834, 0.07036807, 1.633744, 1, 1, 1, 1, 1,
0.7988867, 0.4898461, 0.9883097, 1, 1, 1, 1, 1,
0.7996557, 2.144908, 0.7571478, 1, 1, 1, 1, 1,
0.7999988, -1.791002, 3.396827, 1, 1, 1, 1, 1,
0.8016049, -0.2519434, 1.085087, 1, 1, 1, 1, 1,
0.8065552, 0.8477431, -1.007487, 1, 1, 1, 1, 1,
0.8164694, 0.7408954, 0.09720489, 1, 1, 1, 1, 1,
0.817489, 1.447042, -0.1227142, 0, 0, 1, 1, 1,
0.8176056, -0.6527484, 3.319363, 1, 0, 0, 1, 1,
0.8339164, -0.4299805, 1.780973, 1, 0, 0, 1, 1,
0.8406087, -1.056636, 1.620558, 1, 0, 0, 1, 1,
0.8409822, -2.348915, 3.334032, 1, 0, 0, 1, 1,
0.8432151, -0.4196303, 1.613708, 1, 0, 0, 1, 1,
0.8513471, 0.6506881, 1.052282, 0, 0, 0, 1, 1,
0.8707712, 0.3171186, 1.987556, 0, 0, 0, 1, 1,
0.87319, -0.1593912, 2.600708, 0, 0, 0, 1, 1,
0.8788111, -1.426072, 2.215573, 0, 0, 0, 1, 1,
0.881377, -0.09974779, 0.413575, 0, 0, 0, 1, 1,
0.8845894, 0.4102823, 2.039655, 0, 0, 0, 1, 1,
0.8868772, 0.4054744, 1.322495, 0, 0, 0, 1, 1,
0.8979545, -0.1392787, 2.272259, 1, 1, 1, 1, 1,
0.8989954, 0.9099997, 1.107701, 1, 1, 1, 1, 1,
0.9006155, -1.31608, 1.634309, 1, 1, 1, 1, 1,
0.9022369, -1.043198, 3.729588, 1, 1, 1, 1, 1,
0.9096531, 0.2972201, -0.9136716, 1, 1, 1, 1, 1,
0.9154785, -1.091258, 2.131108, 1, 1, 1, 1, 1,
0.9243409, 0.4432336, 0.6875725, 1, 1, 1, 1, 1,
0.9276443, -0.22029, 0.4982572, 1, 1, 1, 1, 1,
0.9289928, -0.5701411, 2.930758, 1, 1, 1, 1, 1,
0.9330556, -1.601448, 3.802045, 1, 1, 1, 1, 1,
0.946259, 0.4548339, 1.547372, 1, 1, 1, 1, 1,
0.9477037, 1.834977, 0.7254924, 1, 1, 1, 1, 1,
0.9535988, 0.1679658, 1.777248, 1, 1, 1, 1, 1,
0.9769118, 1.940416, 0.001435635, 1, 1, 1, 1, 1,
0.9898176, 0.05564901, 2.501053, 1, 1, 1, 1, 1,
0.9950816, 1.558941, 1.113136, 0, 0, 1, 1, 1,
0.9959795, 0.7148427, 0.003993759, 1, 0, 0, 1, 1,
1.000427, -0.801212, 1.117021, 1, 0, 0, 1, 1,
1.00045, 0.3668508, 2.870244, 1, 0, 0, 1, 1,
1.003188, 0.9691207, 2.268024, 1, 0, 0, 1, 1,
1.005881, 0.2943096, 2.163233, 1, 0, 0, 1, 1,
1.008598, 0.745188, 1.134501, 0, 0, 0, 1, 1,
1.019642, -0.265107, 1.349503, 0, 0, 0, 1, 1,
1.022188, 0.5515237, 1.113762, 0, 0, 0, 1, 1,
1.030042, -2.796402, 3.360298, 0, 0, 0, 1, 1,
1.033973, -0.09985306, 1.192978, 0, 0, 0, 1, 1,
1.033974, -0.1549674, 2.188207, 0, 0, 0, 1, 1,
1.034414, 0.3443432, 1.521533, 0, 0, 0, 1, 1,
1.041363, -1.022579, 2.442597, 1, 1, 1, 1, 1,
1.054382, 0.10197, 2.746321, 1, 1, 1, 1, 1,
1.057915, -0.434128, 0.6893976, 1, 1, 1, 1, 1,
1.062675, 1.075297, 2.50706, 1, 1, 1, 1, 1,
1.064427, 0.05286645, 1.908508, 1, 1, 1, 1, 1,
1.076281, -0.3347849, 2.104232, 1, 1, 1, 1, 1,
1.078468, 0.5704877, 1.312176, 1, 1, 1, 1, 1,
1.08311, -0.07843789, -0.005734351, 1, 1, 1, 1, 1,
1.084064, 0.1799309, 1.468321, 1, 1, 1, 1, 1,
1.084541, 0.58617, 1.707328, 1, 1, 1, 1, 1,
1.085225, -0.5313765, 3.577288, 1, 1, 1, 1, 1,
1.08786, 0.4646124, 1.546182, 1, 1, 1, 1, 1,
1.089593, 0.2410675, 1.729605, 1, 1, 1, 1, 1,
1.097011, -0.6921006, 1.16634, 1, 1, 1, 1, 1,
1.098774, 1.882053, 0.6760905, 1, 1, 1, 1, 1,
1.099426, -0.7218652, 2.0796, 0, 0, 1, 1, 1,
1.109985, 0.6242007, 0.5714016, 1, 0, 0, 1, 1,
1.111635, -1.527358, 1.788729, 1, 0, 0, 1, 1,
1.116988, -0.01031464, 1.483426, 1, 0, 0, 1, 1,
1.117269, -0.3730381, 2.206328, 1, 0, 0, 1, 1,
1.122977, -0.5112037, 2.431968, 1, 0, 0, 1, 1,
1.123037, 0.841373, 1.355919, 0, 0, 0, 1, 1,
1.125512, 0.4991532, 0.4705293, 0, 0, 0, 1, 1,
1.12967, -0.431379, 1.016989, 0, 0, 0, 1, 1,
1.135662, -0.1347947, 2.572696, 0, 0, 0, 1, 1,
1.148066, -0.5567895, 4.078588, 0, 0, 0, 1, 1,
1.16795, 0.7692585, 0.840095, 0, 0, 0, 1, 1,
1.170265, -0.9103066, 2.019234, 0, 0, 0, 1, 1,
1.188071, -0.1363679, -0.2570919, 1, 1, 1, 1, 1,
1.190842, 0.5414211, 2.698007, 1, 1, 1, 1, 1,
1.198668, -0.1642526, 1.572845, 1, 1, 1, 1, 1,
1.200664, -0.08736731, 2.768658, 1, 1, 1, 1, 1,
1.21999, -0.04076049, 2.254091, 1, 1, 1, 1, 1,
1.236119, -1.27821, 1.684586, 1, 1, 1, 1, 1,
1.245388, -0.4151119, 2.27773, 1, 1, 1, 1, 1,
1.248785, -1.595186, 2.3346, 1, 1, 1, 1, 1,
1.256742, -0.3942184, 1.621972, 1, 1, 1, 1, 1,
1.258537, 0.4061487, 1.849491, 1, 1, 1, 1, 1,
1.271253, -0.02713947, 3.321544, 1, 1, 1, 1, 1,
1.281597, 0.8066714, 1.931895, 1, 1, 1, 1, 1,
1.290109, -1.958618, 2.824838, 1, 1, 1, 1, 1,
1.300649, 0.2298692, 1.054704, 1, 1, 1, 1, 1,
1.310835, 1.223422, 1.515309, 1, 1, 1, 1, 1,
1.313732, 1.768262, -0.6155793, 0, 0, 1, 1, 1,
1.327835, 1.275008, -0.1985684, 1, 0, 0, 1, 1,
1.339125, -0.7151393, 0.7824659, 1, 0, 0, 1, 1,
1.339865, -0.1364947, 2.066402, 1, 0, 0, 1, 1,
1.344628, 0.3492535, -0.4389583, 1, 0, 0, 1, 1,
1.356063, -0.1442043, 2.910805, 1, 0, 0, 1, 1,
1.357181, 0.2453205, -0.377149, 0, 0, 0, 1, 1,
1.367404, 0.5291598, 1.87351, 0, 0, 0, 1, 1,
1.367982, 1.154205, 1.470835, 0, 0, 0, 1, 1,
1.371482, 1.490266, -0.4212937, 0, 0, 0, 1, 1,
1.379055, -1.015274, 2.331421, 0, 0, 0, 1, 1,
1.381977, -1.034868, 1.155132, 0, 0, 0, 1, 1,
1.383977, 2.909288, 1.292396, 0, 0, 0, 1, 1,
1.386101, 0.8077294, -0.5531897, 1, 1, 1, 1, 1,
1.390374, 0.1209886, 2.339063, 1, 1, 1, 1, 1,
1.391917, -0.2810139, -0.2972355, 1, 1, 1, 1, 1,
1.395988, -0.03911926, 1.296339, 1, 1, 1, 1, 1,
1.397979, -0.5837573, 2.333234, 1, 1, 1, 1, 1,
1.399241, 0.2822915, 2.326458, 1, 1, 1, 1, 1,
1.413712, -0.3578219, 1.386549, 1, 1, 1, 1, 1,
1.415063, 0.5262154, 2.577447, 1, 1, 1, 1, 1,
1.42326, 0.4013352, 1.334414, 1, 1, 1, 1, 1,
1.426415, -1.401798, 2.211367, 1, 1, 1, 1, 1,
1.439365, 0.4762452, 1.284155, 1, 1, 1, 1, 1,
1.450435, 0.8461512, 2.207016, 1, 1, 1, 1, 1,
1.452518, -0.8672197, 1.269574, 1, 1, 1, 1, 1,
1.45568, -0.2870481, 2.090542, 1, 1, 1, 1, 1,
1.456671, -0.2149275, 1.984108, 1, 1, 1, 1, 1,
1.466915, -1.065106, 1.879377, 0, 0, 1, 1, 1,
1.472762, -0.16324, 2.318371, 1, 0, 0, 1, 1,
1.478871, -1.878629, 2.10598, 1, 0, 0, 1, 1,
1.483555, 0.04691667, 1.645926, 1, 0, 0, 1, 1,
1.497568, 0.5514199, 2.704427, 1, 0, 0, 1, 1,
1.500158, -0.2497937, 0.3471956, 1, 0, 0, 1, 1,
1.506318, -0.2529135, 3.0347, 0, 0, 0, 1, 1,
1.507163, -1.595799, 2.247588, 0, 0, 0, 1, 1,
1.513087, -0.7178465, 0.5343899, 0, 0, 0, 1, 1,
1.51632, -2.117269, 2.324097, 0, 0, 0, 1, 1,
1.51769, -1.939787, 2.644393, 0, 0, 0, 1, 1,
1.519001, 0.05106816, 0.5998245, 0, 0, 0, 1, 1,
1.531746, 0.7736756, 1.447881, 0, 0, 0, 1, 1,
1.552986, -1.06933, 3.036726, 1, 1, 1, 1, 1,
1.558399, 0.8416836, -1.672462, 1, 1, 1, 1, 1,
1.568153, 2.08447, -0.5864864, 1, 1, 1, 1, 1,
1.576507, -0.08120753, 1.730078, 1, 1, 1, 1, 1,
1.598609, 0.09496566, 2.062933, 1, 1, 1, 1, 1,
1.616557, 0.6678652, 1.57311, 1, 1, 1, 1, 1,
1.625914, -0.1318677, 0.9940082, 1, 1, 1, 1, 1,
1.630319, 1.372827, 1.166004, 1, 1, 1, 1, 1,
1.636459, -0.4279396, 1.54672, 1, 1, 1, 1, 1,
1.65512, 0.3654986, -0.2925741, 1, 1, 1, 1, 1,
1.670245, -1.591613, 1.472797, 1, 1, 1, 1, 1,
1.681821, 1.154409, -0.7888912, 1, 1, 1, 1, 1,
1.682678, 0.5890811, 2.990774, 1, 1, 1, 1, 1,
1.687441, 0.1070917, 0.1798727, 1, 1, 1, 1, 1,
1.699448, -1.610414, 2.769382, 1, 1, 1, 1, 1,
1.710186, 0.07462329, 3.038157, 0, 0, 1, 1, 1,
1.723526, -1.527683, 1.060572, 1, 0, 0, 1, 1,
1.768527, 2.868886, 1.808998, 1, 0, 0, 1, 1,
1.773832, -1.214327, 2.248669, 1, 0, 0, 1, 1,
1.778453, -1.636842, 2.01441, 1, 0, 0, 1, 1,
1.780256, -0.5253644, 2.616877, 1, 0, 0, 1, 1,
1.781852, -0.1215265, -0.4809636, 0, 0, 0, 1, 1,
1.792313, 0.04625409, 1.270624, 0, 0, 0, 1, 1,
1.800171, 0.4459116, 1.856391, 0, 0, 0, 1, 1,
1.80087, 1.089554, -0.3073361, 0, 0, 0, 1, 1,
1.805836, 0.7293271, 2.322754, 0, 0, 0, 1, 1,
1.837771, -1.130744, 1.109648, 0, 0, 0, 1, 1,
1.84586, -0.1294462, 0.285632, 0, 0, 0, 1, 1,
1.879437, -1.064377, 2.18226, 1, 1, 1, 1, 1,
1.898071, -2.73803, 2.137224, 1, 1, 1, 1, 1,
1.900098, -0.3379265, 1.788436, 1, 1, 1, 1, 1,
1.916263, 0.08116911, 2.909515, 1, 1, 1, 1, 1,
1.931219, 1.36306, 0.7479101, 1, 1, 1, 1, 1,
1.931675, 0.313649, 1.967327, 1, 1, 1, 1, 1,
1.933106, 1.893055, 0.9180223, 1, 1, 1, 1, 1,
1.933504, 0.9293365, 1.133204, 1, 1, 1, 1, 1,
1.942103, -0.8266262, 1.699272, 1, 1, 1, 1, 1,
1.965194, 0.8835962, 1.110725, 1, 1, 1, 1, 1,
1.99914, -0.2279145, 1.733576, 1, 1, 1, 1, 1,
2.007333, -0.1555141, 0.8341371, 1, 1, 1, 1, 1,
2.037061, 0.4274976, 0.7061341, 1, 1, 1, 1, 1,
2.052257, 0.1477104, 1.720814, 1, 1, 1, 1, 1,
2.054193, -1.59638, 2.536794, 1, 1, 1, 1, 1,
2.065898, -0.05284349, 1.749282, 0, 0, 1, 1, 1,
2.086018, 1.382221, -1.068795, 1, 0, 0, 1, 1,
2.095423, 0.8321624, 0.9330686, 1, 0, 0, 1, 1,
2.099472, 0.991689, 1.637614, 1, 0, 0, 1, 1,
2.110114, 0.7829875, 0.5272714, 1, 0, 0, 1, 1,
2.114637, -0.1760425, 0.1635523, 1, 0, 0, 1, 1,
2.138755, -0.1062909, 1.434689, 0, 0, 0, 1, 1,
2.170252, 0.1252173, 1.329954, 0, 0, 0, 1, 1,
2.183623, 0.7933106, 0.06388652, 0, 0, 0, 1, 1,
2.210469, 1.093946, 0.2790098, 0, 0, 0, 1, 1,
2.216908, 0.07901052, 2.51465, 0, 0, 0, 1, 1,
2.272236, 0.50208, 1.819743, 0, 0, 0, 1, 1,
2.37585, 1.071211, -1.313274, 0, 0, 0, 1, 1,
2.399065, -0.7933713, 3.048533, 1, 1, 1, 1, 1,
2.428358, -0.8098215, 2.392725, 1, 1, 1, 1, 1,
2.434808, 0.7138817, 0.2942063, 1, 1, 1, 1, 1,
2.658943, -0.04920907, 0.4265498, 1, 1, 1, 1, 1,
2.689556, -1.645405, 2.23051, 1, 1, 1, 1, 1,
2.743187, 0.612824, -0.3802723, 1, 1, 1, 1, 1,
3.055239, -0.6808954, 1.632766, 1, 1, 1, 1, 1
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
var radius = 9.442712;
var distance = 33.16713;
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
mvMatrix.translate( 0.03939342, 0.1807384, 0.1456399 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.16713);
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
