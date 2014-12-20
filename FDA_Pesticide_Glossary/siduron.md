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
-3.068305, 0.4640315, -2.533036, 1, 0, 0, 1,
-2.967925, 0.06711438, -0.5449339, 1, 0.007843138, 0, 1,
-2.717391, -0.4686432, -0.9417391, 1, 0.01176471, 0, 1,
-2.637282, -0.2222474, -0.7368175, 1, 0.01960784, 0, 1,
-2.605231, 0.3996786, -1.170741, 1, 0.02352941, 0, 1,
-2.570286, 1.104712, -1.582343, 1, 0.03137255, 0, 1,
-2.516666, -0.2048743, -1.956367, 1, 0.03529412, 0, 1,
-2.471503, -1.751948, -2.115531, 1, 0.04313726, 0, 1,
-2.393555, -2.284971, -1.5575, 1, 0.04705882, 0, 1,
-2.368115, 0.7393792, -1.53822, 1, 0.05490196, 0, 1,
-2.328875, 0.1267682, -1.056368, 1, 0.05882353, 0, 1,
-2.328694, -0.318981, -1.910737, 1, 0.06666667, 0, 1,
-2.320816, 1.315316, -0.7997523, 1, 0.07058824, 0, 1,
-2.191007, -0.06299247, -0.9479134, 1, 0.07843138, 0, 1,
-2.190293, 1.677809, -1.229092, 1, 0.08235294, 0, 1,
-2.187463, -0.2122909, -2.557605, 1, 0.09019608, 0, 1,
-2.178029, 0.2710737, -1.60704, 1, 0.09411765, 0, 1,
-2.123856, 0.6385436, -1.543428, 1, 0.1019608, 0, 1,
-2.120936, 0.8931299, -1.33673, 1, 0.1098039, 0, 1,
-2.113297, -1.572556, -3.039069, 1, 0.1137255, 0, 1,
-2.082954, -0.2496148, -0.937145, 1, 0.1215686, 0, 1,
-2.080682, -0.1176702, -2.694989, 1, 0.1254902, 0, 1,
-2.078045, 0.6541165, -0.5726678, 1, 0.1333333, 0, 1,
-2.078043, 0.1739398, -1.865185, 1, 0.1372549, 0, 1,
-2.067068, 0.06767271, -1.894235, 1, 0.145098, 0, 1,
-2.057486, -0.07243071, -0.5262111, 1, 0.1490196, 0, 1,
-1.992632, 0.6161804, -1.326048, 1, 0.1568628, 0, 1,
-1.987194, 0.5960813, -0.4754771, 1, 0.1607843, 0, 1,
-1.957434, 1.490478, -1.22024, 1, 0.1686275, 0, 1,
-1.94154, -0.1838845, -1.24017, 1, 0.172549, 0, 1,
-1.884042, -1.16974, -3.675216, 1, 0.1803922, 0, 1,
-1.840631, -1.07671, -2.675223, 1, 0.1843137, 0, 1,
-1.839381, 0.5083126, -1.369183, 1, 0.1921569, 0, 1,
-1.838016, 0.2064425, -1.478824, 1, 0.1960784, 0, 1,
-1.835768, -1.226955, -0.7970558, 1, 0.2039216, 0, 1,
-1.828487, -1.258734, -1.187125, 1, 0.2117647, 0, 1,
-1.811279, -1.495842, -2.590882, 1, 0.2156863, 0, 1,
-1.810942, 0.3593112, -0.7627912, 1, 0.2235294, 0, 1,
-1.785976, -0.2510943, -2.334862, 1, 0.227451, 0, 1,
-1.764588, -0.7072375, -1.758771, 1, 0.2352941, 0, 1,
-1.722791, 0.7679305, -0.7320783, 1, 0.2392157, 0, 1,
-1.715829, -0.7351662, -3.133696, 1, 0.2470588, 0, 1,
-1.715481, 0.7276999, -3.230303, 1, 0.2509804, 0, 1,
-1.704573, -0.9501836, -3.039418, 1, 0.2588235, 0, 1,
-1.699868, 1.197271, -1.290265, 1, 0.2627451, 0, 1,
-1.699615, -0.8206095, -1.691341, 1, 0.2705882, 0, 1,
-1.694251, -1.398548, -4.610415, 1, 0.2745098, 0, 1,
-1.664213, -0.5736704, -1.479671, 1, 0.282353, 0, 1,
-1.622412, 2.019632, -1.37367, 1, 0.2862745, 0, 1,
-1.613821, -0.8337379, -1.149558, 1, 0.2941177, 0, 1,
-1.612725, 1.778386, -0.5874411, 1, 0.3019608, 0, 1,
-1.610251, -0.6955583, -2.656677, 1, 0.3058824, 0, 1,
-1.61002, 1.197295, -0.416544, 1, 0.3137255, 0, 1,
-1.601536, -0.825967, -1.289344, 1, 0.3176471, 0, 1,
-1.59722, 1.274354, -2.584731, 1, 0.3254902, 0, 1,
-1.586119, -0.8378748, -2.010082, 1, 0.3294118, 0, 1,
-1.584108, -0.9670697, -1.511651, 1, 0.3372549, 0, 1,
-1.581712, 1.232262, -1.065731, 1, 0.3411765, 0, 1,
-1.581658, 0.7554179, -0.354209, 1, 0.3490196, 0, 1,
-1.581202, 2.92783, -1.51622, 1, 0.3529412, 0, 1,
-1.577828, 0.2536179, -0.3464884, 1, 0.3607843, 0, 1,
-1.576677, 0.1864586, -0.9910613, 1, 0.3647059, 0, 1,
-1.568889, 0.4150516, -0.6264912, 1, 0.372549, 0, 1,
-1.555534, 0.2178896, -1.661577, 1, 0.3764706, 0, 1,
-1.531484, 0.9810111, -0.9292766, 1, 0.3843137, 0, 1,
-1.52807, 1.234955, -0.5823185, 1, 0.3882353, 0, 1,
-1.522877, 0.05331041, -0.9588469, 1, 0.3960784, 0, 1,
-1.516273, 1.79486, -2.650128, 1, 0.4039216, 0, 1,
-1.510638, 0.3652216, -1.819261, 1, 0.4078431, 0, 1,
-1.469303, 0.8762198, -1.374007, 1, 0.4156863, 0, 1,
-1.44355, -0.3444525, -1.79457, 1, 0.4196078, 0, 1,
-1.441659, -1.482093, -2.882107, 1, 0.427451, 0, 1,
-1.43822, -0.8629134, -1.387271, 1, 0.4313726, 0, 1,
-1.437225, 0.3541851, -0.8924928, 1, 0.4392157, 0, 1,
-1.434435, 1.461994, -1.528627, 1, 0.4431373, 0, 1,
-1.425105, 1.691201, -3.197926, 1, 0.4509804, 0, 1,
-1.420831, -2.033147, -2.493265, 1, 0.454902, 0, 1,
-1.415641, -0.1030433, -3.186527, 1, 0.4627451, 0, 1,
-1.38831, -0.3610562, -1.91698, 1, 0.4666667, 0, 1,
-1.379844, -0.01473961, -1.152086, 1, 0.4745098, 0, 1,
-1.351604, 1.630849, -0.5403464, 1, 0.4784314, 0, 1,
-1.338842, 0.171691, -1.281299, 1, 0.4862745, 0, 1,
-1.331424, 0.4555727, 0.6256563, 1, 0.4901961, 0, 1,
-1.328684, -0.5067142, -2.366217, 1, 0.4980392, 0, 1,
-1.322966, -0.1870111, -2.645819, 1, 0.5058824, 0, 1,
-1.314527, -1.110606, -2.315199, 1, 0.509804, 0, 1,
-1.309741, 0.9491394, -1.658102, 1, 0.5176471, 0, 1,
-1.302924, -0.5418105, -2.572304, 1, 0.5215687, 0, 1,
-1.292523, 0.3928704, -0.02932389, 1, 0.5294118, 0, 1,
-1.279902, -2.563855, -3.025228, 1, 0.5333334, 0, 1,
-1.275569, -0.4462816, -1.689856, 1, 0.5411765, 0, 1,
-1.274077, -0.980691, -2.747296, 1, 0.5450981, 0, 1,
-1.272636, 0.8786814, -0.6238585, 1, 0.5529412, 0, 1,
-1.266352, -0.4591789, -1.461549, 1, 0.5568628, 0, 1,
-1.259236, -0.7729529, -1.286806, 1, 0.5647059, 0, 1,
-1.236171, 0.8209059, -1.902154, 1, 0.5686275, 0, 1,
-1.229319, 0.2001561, -1.014102, 1, 0.5764706, 0, 1,
-1.221531, -0.9309527, 0.5445654, 1, 0.5803922, 0, 1,
-1.217798, 0.7656667, 0.8863033, 1, 0.5882353, 0, 1,
-1.215634, -0.248303, -2.589637, 1, 0.5921569, 0, 1,
-1.214797, 1.826116, 0.2907088, 1, 0.6, 0, 1,
-1.214167, 1.457269, -0.4665535, 1, 0.6078432, 0, 1,
-1.214041, 0.4504803, -0.1200224, 1, 0.6117647, 0, 1,
-1.214038, -1.973379, -1.797859, 1, 0.6196079, 0, 1,
-1.213771, -1.237491, -1.385324, 1, 0.6235294, 0, 1,
-1.211174, 1.485647, 1.285453, 1, 0.6313726, 0, 1,
-1.20607, 0.8976117, -0.3579532, 1, 0.6352941, 0, 1,
-1.196467, 0.4137847, 0.3249798, 1, 0.6431373, 0, 1,
-1.19191, -1.129172, -2.333957, 1, 0.6470588, 0, 1,
-1.188678, 0.6734926, -1.235753, 1, 0.654902, 0, 1,
-1.186167, -0.4150302, -0.9057227, 1, 0.6588235, 0, 1,
-1.18, -1.549699, -0.2465931, 1, 0.6666667, 0, 1,
-1.176429, 1.210969, -0.5331106, 1, 0.6705883, 0, 1,
-1.174582, -1.185505, -3.053412, 1, 0.6784314, 0, 1,
-1.171076, 0.1568972, -1.446249, 1, 0.682353, 0, 1,
-1.170767, -0.7753286, -1.756418, 1, 0.6901961, 0, 1,
-1.150926, 0.5717305, -2.695361, 1, 0.6941177, 0, 1,
-1.133544, -0.8124785, -3.34104, 1, 0.7019608, 0, 1,
-1.133488, -1.521468, -1.588474, 1, 0.7098039, 0, 1,
-1.131204, -0.8465877, -1.489174, 1, 0.7137255, 0, 1,
-1.126881, 0.5122145, 0.1982502, 1, 0.7215686, 0, 1,
-1.120281, -0.9511533, -1.468204, 1, 0.7254902, 0, 1,
-1.099716, 0.1285624, -1.215415, 1, 0.7333333, 0, 1,
-1.099001, 0.8494833, -1.287071, 1, 0.7372549, 0, 1,
-1.098828, 0.3397566, -0.3445876, 1, 0.7450981, 0, 1,
-1.089313, 1.312702, -0.9913596, 1, 0.7490196, 0, 1,
-1.085688, 0.09555216, -1.283905, 1, 0.7568628, 0, 1,
-1.076546, 1.572198, 0.4855807, 1, 0.7607843, 0, 1,
-1.07426, 1.719556, -1.223948, 1, 0.7686275, 0, 1,
-1.06562, 0.2112813, -1.912603, 1, 0.772549, 0, 1,
-1.064489, 0.8490929, -1.270214, 1, 0.7803922, 0, 1,
-1.060267, 0.2049814, -3.019295, 1, 0.7843137, 0, 1,
-1.050059, 0.4157718, -0.8277226, 1, 0.7921569, 0, 1,
-1.045494, 0.6543136, -1.041146, 1, 0.7960784, 0, 1,
-1.035651, -1.060816, -2.938781, 1, 0.8039216, 0, 1,
-1.024901, 0.5008268, -0.1644448, 1, 0.8117647, 0, 1,
-1.02468, 0.2839424, -1.743483, 1, 0.8156863, 0, 1,
-1.024481, -0.6245669, -2.225407, 1, 0.8235294, 0, 1,
-1.014011, 2.580919, -0.4644075, 1, 0.827451, 0, 1,
-1.012824, 0.1625771, -0.9323388, 1, 0.8352941, 0, 1,
-1.010783, 0.001425341, -3.714365, 1, 0.8392157, 0, 1,
-0.9976662, 0.6628511, -0.08471403, 1, 0.8470588, 0, 1,
-0.9962485, 0.8831105, -1.728275, 1, 0.8509804, 0, 1,
-0.9868755, -1.024573, -2.347998, 1, 0.8588235, 0, 1,
-0.981263, -1.006092, -3.709117, 1, 0.8627451, 0, 1,
-0.9785386, 0.2927089, 0.6538805, 1, 0.8705882, 0, 1,
-0.9755147, -1.966351, -2.983712, 1, 0.8745098, 0, 1,
-0.9712102, -0.3102294, -3.453678, 1, 0.8823529, 0, 1,
-0.9698222, 0.3443167, -1.813061, 1, 0.8862745, 0, 1,
-0.9530377, 0.1593991, 0.005418609, 1, 0.8941177, 0, 1,
-0.9514856, -0.3724928, 0.1450293, 1, 0.8980392, 0, 1,
-0.9459822, -1.224893, -0.5117775, 1, 0.9058824, 0, 1,
-0.9425081, -0.338587, -1.753909, 1, 0.9137255, 0, 1,
-0.9391754, -1.10684, -3.196604, 1, 0.9176471, 0, 1,
-0.9356974, 0.257597, -0.1156854, 1, 0.9254902, 0, 1,
-0.9338661, -0.8192255, -2.983524, 1, 0.9294118, 0, 1,
-0.9299488, 1.445714, -0.4970714, 1, 0.9372549, 0, 1,
-0.9243063, -0.7073718, -1.794514, 1, 0.9411765, 0, 1,
-0.9237217, -0.1735469, -3.657479, 1, 0.9490196, 0, 1,
-0.9205855, -0.8065225, -3.593182, 1, 0.9529412, 0, 1,
-0.9172528, 0.1230165, -2.255393, 1, 0.9607843, 0, 1,
-0.9158416, 2.722028, -0.6997374, 1, 0.9647059, 0, 1,
-0.9090859, 2.159955, 0.09666304, 1, 0.972549, 0, 1,
-0.9074307, -0.5656755, -1.876729, 1, 0.9764706, 0, 1,
-0.9033917, 0.8531511, -0.02565327, 1, 0.9843137, 0, 1,
-0.9027652, 1.377537, 0.1735992, 1, 0.9882353, 0, 1,
-0.8991084, 0.5070969, -1.197318, 1, 0.9960784, 0, 1,
-0.8983459, 0.1750818, -2.366303, 0.9960784, 1, 0, 1,
-0.8969129, -0.3646747, -2.483018, 0.9921569, 1, 0, 1,
-0.8926308, -0.1009943, -1.102958, 0.9843137, 1, 0, 1,
-0.8898383, 0.3303806, -0.6440126, 0.9803922, 1, 0, 1,
-0.8857201, -1.371448, -1.406535, 0.972549, 1, 0, 1,
-0.8846232, 0.5253233, -1.118764, 0.9686275, 1, 0, 1,
-0.8784972, 0.856254, 1.139547, 0.9607843, 1, 0, 1,
-0.8746314, 1.573121, 0.2219377, 0.9568627, 1, 0, 1,
-0.8737969, 0.6713584, -1.971593, 0.9490196, 1, 0, 1,
-0.8728585, -2.450418, -3.2743, 0.945098, 1, 0, 1,
-0.8695555, -0.4078556, -2.750389, 0.9372549, 1, 0, 1,
-0.8692294, -0.417686, -1.209565, 0.9333333, 1, 0, 1,
-0.8692182, 1.037004, -0.362155, 0.9254902, 1, 0, 1,
-0.8687988, 1.221858, -1.618613, 0.9215686, 1, 0, 1,
-0.8660838, -1.014826, -1.08366, 0.9137255, 1, 0, 1,
-0.862657, 2.063765, 1.266492, 0.9098039, 1, 0, 1,
-0.8548974, -1.486845, -3.289996, 0.9019608, 1, 0, 1,
-0.8536479, 1.318066, 0.5978872, 0.8941177, 1, 0, 1,
-0.8517556, 2.697422, 0.7379853, 0.8901961, 1, 0, 1,
-0.8502063, 1.478497, -0.6821503, 0.8823529, 1, 0, 1,
-0.8500255, -0.5468562, -4.14636, 0.8784314, 1, 0, 1,
-0.8460019, 1.115433, -1.018119, 0.8705882, 1, 0, 1,
-0.8441698, -0.4039146, -1.151748, 0.8666667, 1, 0, 1,
-0.8352005, 0.120719, -1.143095, 0.8588235, 1, 0, 1,
-0.8345104, -0.4647241, -2.790825, 0.854902, 1, 0, 1,
-0.8337584, 0.7976128, -0.3834059, 0.8470588, 1, 0, 1,
-0.8313894, 1.705204, -1.138023, 0.8431373, 1, 0, 1,
-0.8304979, -1.303444, -1.44954, 0.8352941, 1, 0, 1,
-0.8278777, 0.2618315, 0.5978718, 0.8313726, 1, 0, 1,
-0.8265405, -1.084797, -4.032484, 0.8235294, 1, 0, 1,
-0.8219439, 1.924947, 0.8252565, 0.8196079, 1, 0, 1,
-0.8211837, 0.5031099, -2.568956, 0.8117647, 1, 0, 1,
-0.8175219, 0.3096439, -2.647994, 0.8078431, 1, 0, 1,
-0.7943439, -0.172678, -0.8974587, 0.8, 1, 0, 1,
-0.7836996, -0.3909879, -2.195994, 0.7921569, 1, 0, 1,
-0.7819433, -1.001992, -2.860574, 0.7882353, 1, 0, 1,
-0.7717733, 0.6920836, -0.2043699, 0.7803922, 1, 0, 1,
-0.7639537, 0.06825113, -2.792265, 0.7764706, 1, 0, 1,
-0.7626799, 1.062237, -0.3117463, 0.7686275, 1, 0, 1,
-0.7606766, 1.902639, -1.578334, 0.7647059, 1, 0, 1,
-0.7586797, 0.2556947, -2.815873, 0.7568628, 1, 0, 1,
-0.7511234, 1.053006, -1.711873, 0.7529412, 1, 0, 1,
-0.7443788, -0.04150446, -0.7896807, 0.7450981, 1, 0, 1,
-0.7322117, -0.8293625, -3.246154, 0.7411765, 1, 0, 1,
-0.7309107, 0.2194694, -1.418194, 0.7333333, 1, 0, 1,
-0.7290562, -0.3196185, 0.3149044, 0.7294118, 1, 0, 1,
-0.7287574, -2.187469, -3.253715, 0.7215686, 1, 0, 1,
-0.7254471, 1.54033, -0.6660593, 0.7176471, 1, 0, 1,
-0.7223268, 0.2809287, -3.438255, 0.7098039, 1, 0, 1,
-0.7189649, 0.7237614, -0.09734362, 0.7058824, 1, 0, 1,
-0.7096572, -0.3088777, -2.827389, 0.6980392, 1, 0, 1,
-0.6899398, 0.09043289, -2.153674, 0.6901961, 1, 0, 1,
-0.6895241, -0.6387768, -1.825528, 0.6862745, 1, 0, 1,
-0.6760306, 0.6657236, 0.1833434, 0.6784314, 1, 0, 1,
-0.6746852, -0.06008328, -2.945417, 0.6745098, 1, 0, 1,
-0.6606202, -1.326415, -0.2686053, 0.6666667, 1, 0, 1,
-0.6593953, 0.05221649, -2.632342, 0.6627451, 1, 0, 1,
-0.6575804, 0.1777622, -2.210745, 0.654902, 1, 0, 1,
-0.6570712, 1.192525, -1.073457, 0.6509804, 1, 0, 1,
-0.6532272, 1.409727, -0.8405839, 0.6431373, 1, 0, 1,
-0.6521057, -1.553149, -1.32852, 0.6392157, 1, 0, 1,
-0.6511884, 0.4424647, -1.046914, 0.6313726, 1, 0, 1,
-0.6417371, -0.7946871, -4.876731, 0.627451, 1, 0, 1,
-0.6357381, 1.082826, -1.279617, 0.6196079, 1, 0, 1,
-0.6347224, 2.211295, -0.2545417, 0.6156863, 1, 0, 1,
-0.6345404, -2.135237, -3.669148, 0.6078432, 1, 0, 1,
-0.6297833, 0.1708121, -0.2931168, 0.6039216, 1, 0, 1,
-0.6279813, -0.8615785, -2.439802, 0.5960785, 1, 0, 1,
-0.6225274, 0.2900097, -3.120918, 0.5882353, 1, 0, 1,
-0.6220125, 1.318771, -0.7885451, 0.5843138, 1, 0, 1,
-0.6172873, -2.03598, -3.132395, 0.5764706, 1, 0, 1,
-0.6172336, 1.555845, -1.911176, 0.572549, 1, 0, 1,
-0.6151257, 1.073799, -0.5853403, 0.5647059, 1, 0, 1,
-0.6122051, 0.9665835, -0.7820908, 0.5607843, 1, 0, 1,
-0.6105317, -1.550223, -2.701878, 0.5529412, 1, 0, 1,
-0.6092372, 1.485781, -0.6950911, 0.5490196, 1, 0, 1,
-0.6052244, -0.615336, -2.539367, 0.5411765, 1, 0, 1,
-0.6022595, 1.016479, -0.6435776, 0.5372549, 1, 0, 1,
-0.601805, 0.247209, 0.1490322, 0.5294118, 1, 0, 1,
-0.596386, 0.6195866, -1.879959, 0.5254902, 1, 0, 1,
-0.593656, -0.2685571, -2.530995, 0.5176471, 1, 0, 1,
-0.5934789, 3.066771, -1.793463, 0.5137255, 1, 0, 1,
-0.5931358, 0.003312673, -3.346343, 0.5058824, 1, 0, 1,
-0.5930857, 0.715344, -0.9313146, 0.5019608, 1, 0, 1,
-0.5927814, 0.2685083, -0.8917182, 0.4941176, 1, 0, 1,
-0.5878325, 0.1677678, -0.997816, 0.4862745, 1, 0, 1,
-0.5849625, 0.6537078, -0.7191392, 0.4823529, 1, 0, 1,
-0.5836305, -0.6042499, -2.832772, 0.4745098, 1, 0, 1,
-0.5830291, 1.448297, 0.768645, 0.4705882, 1, 0, 1,
-0.5812193, -1.387121, -3.636979, 0.4627451, 1, 0, 1,
-0.5784208, -0.6133677, -2.801533, 0.4588235, 1, 0, 1,
-0.5774909, -0.1723134, -2.523021, 0.4509804, 1, 0, 1,
-0.5757031, 0.01466494, -0.7929067, 0.4470588, 1, 0, 1,
-0.5740533, 1.331685, -1.715637, 0.4392157, 1, 0, 1,
-0.5715014, 0.3439909, -1.613844, 0.4352941, 1, 0, 1,
-0.5697885, -0.4272289, -1.483979, 0.427451, 1, 0, 1,
-0.5645055, 1.638293, -0.003809797, 0.4235294, 1, 0, 1,
-0.5538045, 1.027702, -1.059666, 0.4156863, 1, 0, 1,
-0.5532181, 1.515511, 0.4693944, 0.4117647, 1, 0, 1,
-0.5476841, -0.6657013, -2.218732, 0.4039216, 1, 0, 1,
-0.547272, -0.4053825, -2.07573, 0.3960784, 1, 0, 1,
-0.5462201, -0.531505, -3.480307, 0.3921569, 1, 0, 1,
-0.5417477, -0.93104, -2.262477, 0.3843137, 1, 0, 1,
-0.5405803, -0.5147909, -3.209689, 0.3803922, 1, 0, 1,
-0.5391179, -1.150852, -2.677284, 0.372549, 1, 0, 1,
-0.5322306, 1.615025, 0.9864812, 0.3686275, 1, 0, 1,
-0.5316736, 0.4055535, -1.0463, 0.3607843, 1, 0, 1,
-0.529593, -0.7606277, -0.7445403, 0.3568628, 1, 0, 1,
-0.5258656, -1.292651, -2.046895, 0.3490196, 1, 0, 1,
-0.5242554, -0.9803506, -3.448515, 0.345098, 1, 0, 1,
-0.5205362, 1.018578, 0.3178223, 0.3372549, 1, 0, 1,
-0.5167193, -1.342617, -1.701636, 0.3333333, 1, 0, 1,
-0.5125886, 1.221313, -0.4728741, 0.3254902, 1, 0, 1,
-0.5101754, 1.201049, -0.6511214, 0.3215686, 1, 0, 1,
-0.509442, -1.955231, -3.035907, 0.3137255, 1, 0, 1,
-0.5094051, 0.5450561, -1.375826, 0.3098039, 1, 0, 1,
-0.5081207, -1.522062, -2.353279, 0.3019608, 1, 0, 1,
-0.4977408, 0.6816212, 0.4433563, 0.2941177, 1, 0, 1,
-0.492622, -0.3682903, -2.388511, 0.2901961, 1, 0, 1,
-0.4924107, -0.05559533, -2.022021, 0.282353, 1, 0, 1,
-0.4892336, -1.203885, -1.952464, 0.2784314, 1, 0, 1,
-0.4865468, -0.2383034, -3.340829, 0.2705882, 1, 0, 1,
-0.4863017, 0.05958072, -1.402339, 0.2666667, 1, 0, 1,
-0.4853803, 0.004162486, -0.255677, 0.2588235, 1, 0, 1,
-0.4829573, 1.370619, 0.05128083, 0.254902, 1, 0, 1,
-0.4779866, -0.9327049, -2.216104, 0.2470588, 1, 0, 1,
-0.4749073, -0.8118789, -3.369985, 0.2431373, 1, 0, 1,
-0.4747817, -0.3103943, -2.717486, 0.2352941, 1, 0, 1,
-0.4708741, 1.110084, -1.462015, 0.2313726, 1, 0, 1,
-0.4705328, 0.6050073, -1.737796, 0.2235294, 1, 0, 1,
-0.4703174, -0.4053988, -1.018302, 0.2196078, 1, 0, 1,
-0.4688062, 1.363725, 0.1783703, 0.2117647, 1, 0, 1,
-0.4658512, -2.704098, -3.982108, 0.2078431, 1, 0, 1,
-0.4624596, 0.451797, 0.1806705, 0.2, 1, 0, 1,
-0.4524713, -0.1982539, -1.78157, 0.1921569, 1, 0, 1,
-0.4477556, -0.2309862, -1.821159, 0.1882353, 1, 0, 1,
-0.4459403, 1.200186, 0.3907122, 0.1803922, 1, 0, 1,
-0.4417426, -0.03758179, -1.712895, 0.1764706, 1, 0, 1,
-0.4382554, -0.7186202, -2.527679, 0.1686275, 1, 0, 1,
-0.4349867, -0.3498889, -2.502674, 0.1647059, 1, 0, 1,
-0.4315596, -1.100985, -1.558537, 0.1568628, 1, 0, 1,
-0.4304712, 2.291457, -0.9298486, 0.1529412, 1, 0, 1,
-0.4303861, -0.6762996, -2.249084, 0.145098, 1, 0, 1,
-0.4276059, -1.260781, -3.026124, 0.1411765, 1, 0, 1,
-0.4260035, -0.444538, -5.170235, 0.1333333, 1, 0, 1,
-0.4237316, 1.311484, -1.381765, 0.1294118, 1, 0, 1,
-0.4196161, 0.4575898, -0.8815464, 0.1215686, 1, 0, 1,
-0.4159655, 1.071696, 0.5885355, 0.1176471, 1, 0, 1,
-0.4141073, -0.3008578, -1.201975, 0.1098039, 1, 0, 1,
-0.4135126, 0.1983481, -1.080854, 0.1058824, 1, 0, 1,
-0.4111064, -0.003798907, -1.762053, 0.09803922, 1, 0, 1,
-0.4110541, -0.3794663, -2.054466, 0.09019608, 1, 0, 1,
-0.4013529, 0.5518184, -0.332033, 0.08627451, 1, 0, 1,
-0.3944974, 1.098636, -0.928955, 0.07843138, 1, 0, 1,
-0.3944849, -3.662471, -1.934375, 0.07450981, 1, 0, 1,
-0.3919788, -0.9854796, -2.160431, 0.06666667, 1, 0, 1,
-0.391826, -1.221093, -1.799155, 0.0627451, 1, 0, 1,
-0.3871304, -0.8028121, -3.56564, 0.05490196, 1, 0, 1,
-0.3824632, -0.07734527, -3.967807, 0.05098039, 1, 0, 1,
-0.3821555, -0.7310835, -3.653962, 0.04313726, 1, 0, 1,
-0.3819574, 0.6528695, 1.319885, 0.03921569, 1, 0, 1,
-0.3798619, 0.4804801, -1.132372, 0.03137255, 1, 0, 1,
-0.3792952, -0.3354844, -4.238446, 0.02745098, 1, 0, 1,
-0.3785864, 0.7657372, -0.6832677, 0.01960784, 1, 0, 1,
-0.3741837, 0.3976257, -1.465733, 0.01568628, 1, 0, 1,
-0.3726509, -0.8608652, -0.5494521, 0.007843138, 1, 0, 1,
-0.3717648, -0.4152768, -1.26464, 0.003921569, 1, 0, 1,
-0.3712334, -1.477198, -4.15938, 0, 1, 0.003921569, 1,
-0.3709538, -1.975346, -2.326763, 0, 1, 0.01176471, 1,
-0.3697901, 1.031393, 0.5414613, 0, 1, 0.01568628, 1,
-0.3681117, 0.009258091, -1.037326, 0, 1, 0.02352941, 1,
-0.3628707, -0.594348, -4.128683, 0, 1, 0.02745098, 1,
-0.355747, 0.1225984, -0.783143, 0, 1, 0.03529412, 1,
-0.3545419, 0.1534681, -0.7156265, 0, 1, 0.03921569, 1,
-0.3497657, -0.6427986, -2.225957, 0, 1, 0.04705882, 1,
-0.3492187, 1.174887, 0.6893163, 0, 1, 0.05098039, 1,
-0.3486685, -0.9769062, -2.333056, 0, 1, 0.05882353, 1,
-0.3482864, 1.36006, 1.007831, 0, 1, 0.0627451, 1,
-0.348121, 1.041071, -0.933898, 0, 1, 0.07058824, 1,
-0.3466585, -0.5413893, -1.183473, 0, 1, 0.07450981, 1,
-0.3457618, -0.6210615, -1.992644, 0, 1, 0.08235294, 1,
-0.3443764, 0.3988763, -0.007137723, 0, 1, 0.08627451, 1,
-0.3433916, 0.7062277, 1.328676, 0, 1, 0.09411765, 1,
-0.3423487, -0.6172749, -2.164332, 0, 1, 0.1019608, 1,
-0.3392565, 1.600561, -0.4656115, 0, 1, 0.1058824, 1,
-0.3391697, -0.9136809, -3.581909, 0, 1, 0.1137255, 1,
-0.3350466, -1.180242, -2.795769, 0, 1, 0.1176471, 1,
-0.3335727, -0.04560978, -2.420107, 0, 1, 0.1254902, 1,
-0.3333297, 0.3134812, -0.9473602, 0, 1, 0.1294118, 1,
-0.3319202, -0.02510716, -3.760429, 0, 1, 0.1372549, 1,
-0.3303712, -0.610395, -0.4593648, 0, 1, 0.1411765, 1,
-0.3274272, 1.87749, 0.505677, 0, 1, 0.1490196, 1,
-0.3220759, 0.3007015, -0.2973, 0, 1, 0.1529412, 1,
-0.3216054, -1.128054, -2.877742, 0, 1, 0.1607843, 1,
-0.320961, -0.4077092, -2.577987, 0, 1, 0.1647059, 1,
-0.3194672, 0.5011714, -1.485507, 0, 1, 0.172549, 1,
-0.3181492, 0.8790301, 0.5106523, 0, 1, 0.1764706, 1,
-0.3142076, -0.3148085, -1.91733, 0, 1, 0.1843137, 1,
-0.3136474, 1.5761, 0.3640472, 0, 1, 0.1882353, 1,
-0.3121684, -2.203128, -5.194401, 0, 1, 0.1960784, 1,
-0.3112048, 0.04586205, -3.409877, 0, 1, 0.2039216, 1,
-0.3109817, 0.8172696, -0.8084733, 0, 1, 0.2078431, 1,
-0.3093262, -0.7876719, -3.641663, 0, 1, 0.2156863, 1,
-0.3067314, -0.2091444, -1.15158, 0, 1, 0.2196078, 1,
-0.3064214, -1.008418, -2.683728, 0, 1, 0.227451, 1,
-0.3047436, -0.1988041, -0.9544611, 0, 1, 0.2313726, 1,
-0.3018567, 0.7496431, -0.7209157, 0, 1, 0.2392157, 1,
-0.3012094, 1.493341, -0.9879856, 0, 1, 0.2431373, 1,
-0.300195, -2.592332, -2.337503, 0, 1, 0.2509804, 1,
-0.297474, 0.3085892, -2.793345, 0, 1, 0.254902, 1,
-0.2962705, 0.9367791, -2.054438, 0, 1, 0.2627451, 1,
-0.2918584, 1.847326, -1.413421, 0, 1, 0.2666667, 1,
-0.2901308, 0.5038807, -1.03838, 0, 1, 0.2745098, 1,
-0.288033, -0.5432316, -1.556922, 0, 1, 0.2784314, 1,
-0.2876762, -1.287661, -0.9111627, 0, 1, 0.2862745, 1,
-0.2872559, 1.170467, -0.6657956, 0, 1, 0.2901961, 1,
-0.2851798, 1.736038, 0.0949579, 0, 1, 0.2980392, 1,
-0.2825915, 0.5414318, 0.90749, 0, 1, 0.3058824, 1,
-0.2819553, 0.7893257, 0.6398287, 0, 1, 0.3098039, 1,
-0.2775195, 0.46696, -0.4245823, 0, 1, 0.3176471, 1,
-0.2767089, -0.67593, -3.936189, 0, 1, 0.3215686, 1,
-0.276483, 1.771214, 0.7309606, 0, 1, 0.3294118, 1,
-0.2697403, 0.3258674, -0.8557664, 0, 1, 0.3333333, 1,
-0.2673004, 0.9383995, -1.286197, 0, 1, 0.3411765, 1,
-0.2643509, -1.056422, -3.633222, 0, 1, 0.345098, 1,
-0.2579792, -0.01914963, -1.561972, 0, 1, 0.3529412, 1,
-0.2529883, 0.6914565, -0.5836152, 0, 1, 0.3568628, 1,
-0.2528656, 2.033942, 0.3688437, 0, 1, 0.3647059, 1,
-0.2518938, 0.4120547, -0.8462227, 0, 1, 0.3686275, 1,
-0.248842, 0.236623, -0.3172373, 0, 1, 0.3764706, 1,
-0.2455911, -0.04458461, -1.330834, 0, 1, 0.3803922, 1,
-0.2438651, -2.158344, -1.900792, 0, 1, 0.3882353, 1,
-0.2431476, 1.217138, 0.2370896, 0, 1, 0.3921569, 1,
-0.2427234, 0.1563269, -0.7080819, 0, 1, 0.4, 1,
-0.2407045, -0.441035, -0.3838323, 0, 1, 0.4078431, 1,
-0.235767, -0.6937817, -4.869343, 0, 1, 0.4117647, 1,
-0.2299372, 1.702039, 0.8337477, 0, 1, 0.4196078, 1,
-0.228446, -0.09761364, -1.118182, 0, 1, 0.4235294, 1,
-0.2276859, -0.4606448, -1.839718, 0, 1, 0.4313726, 1,
-0.2255513, -0.07828578, -2.988121, 0, 1, 0.4352941, 1,
-0.2249535, -0.7245239, -3.619928, 0, 1, 0.4431373, 1,
-0.2216998, -1.245291, -3.369247, 0, 1, 0.4470588, 1,
-0.2213147, -0.3606893, -3.089747, 0, 1, 0.454902, 1,
-0.2192322, -0.1573138, 0.5097526, 0, 1, 0.4588235, 1,
-0.2094162, 0.4350319, -1.808178, 0, 1, 0.4666667, 1,
-0.2065489, -0.01443036, -2.144819, 0, 1, 0.4705882, 1,
-0.2044398, 1.12001, 0.8337349, 0, 1, 0.4784314, 1,
-0.2032609, 0.4670044, -0.8563545, 0, 1, 0.4823529, 1,
-0.2006149, 1.300588, -0.9322568, 0, 1, 0.4901961, 1,
-0.2006059, -0.3474139, -2.064779, 0, 1, 0.4941176, 1,
-0.198075, 2.312763, 1.577475, 0, 1, 0.5019608, 1,
-0.1973236, -1.028589, -2.344575, 0, 1, 0.509804, 1,
-0.1959438, 1.036441, 0.6978011, 0, 1, 0.5137255, 1,
-0.1951087, 1.146479, -1.186694, 0, 1, 0.5215687, 1,
-0.1865521, -1.667786, -4.384423, 0, 1, 0.5254902, 1,
-0.1798407, -0.4841945, -2.647654, 0, 1, 0.5333334, 1,
-0.178603, -1.87578, -1.694185, 0, 1, 0.5372549, 1,
-0.1781693, 0.8740034, -1.518352, 0, 1, 0.5450981, 1,
-0.1777968, -1.089737, -2.036105, 0, 1, 0.5490196, 1,
-0.1768525, -0.9082922, -3.061057, 0, 1, 0.5568628, 1,
-0.1723999, -0.7565388, -3.314123, 0, 1, 0.5607843, 1,
-0.1708542, -1.951146, -2.865601, 0, 1, 0.5686275, 1,
-0.1694682, -0.2382616, -1.945221, 0, 1, 0.572549, 1,
-0.1687262, -1.023101, -3.372285, 0, 1, 0.5803922, 1,
-0.1653197, 1.608542, -0.890372, 0, 1, 0.5843138, 1,
-0.1582988, -0.3373571, -3.121475, 0, 1, 0.5921569, 1,
-0.1571196, -1.093575, -2.137296, 0, 1, 0.5960785, 1,
-0.1569257, -0.417108, -4.409044, 0, 1, 0.6039216, 1,
-0.1543384, 1.08954, -0.4889214, 0, 1, 0.6117647, 1,
-0.1531065, -1.303303, -2.299835, 0, 1, 0.6156863, 1,
-0.1523719, -0.08721239, -2.648948, 0, 1, 0.6235294, 1,
-0.1523512, 0.4613584, -0.5246893, 0, 1, 0.627451, 1,
-0.1507404, -1.831002, -4.604787, 0, 1, 0.6352941, 1,
-0.1499523, -0.2233485, -3.18901, 0, 1, 0.6392157, 1,
-0.142552, 0.5627009, 2.448325, 0, 1, 0.6470588, 1,
-0.136498, 0.8478979, -0.7310532, 0, 1, 0.6509804, 1,
-0.1360943, 0.2545065, 0.5962793, 0, 1, 0.6588235, 1,
-0.1346935, 1.390201, 0.3212379, 0, 1, 0.6627451, 1,
-0.1285221, -1.484147, -3.680408, 0, 1, 0.6705883, 1,
-0.1276094, -1.727909, -2.293793, 0, 1, 0.6745098, 1,
-0.1273149, 0.205731, -1.961002, 0, 1, 0.682353, 1,
-0.1271011, 0.4361534, 0.9756805, 0, 1, 0.6862745, 1,
-0.1269364, 0.3447481, -1.692195, 0, 1, 0.6941177, 1,
-0.1266395, -2.279266, -3.940686, 0, 1, 0.7019608, 1,
-0.1170015, -0.797143, -3.817583, 0, 1, 0.7058824, 1,
-0.1161361, -0.1254117, -3.331132, 0, 1, 0.7137255, 1,
-0.1076458, 1.080155, 0.6950844, 0, 1, 0.7176471, 1,
-0.105882, 0.9122154, -0.3994366, 0, 1, 0.7254902, 1,
-0.09906649, 1.160439, -1.174486, 0, 1, 0.7294118, 1,
-0.0933804, -0.2061651, -0.9998282, 0, 1, 0.7372549, 1,
-0.09276092, 0.856916, 0.3593666, 0, 1, 0.7411765, 1,
-0.09178351, 0.8410689, -1.274382, 0, 1, 0.7490196, 1,
-0.08885214, 1.056051, -0.8601187, 0, 1, 0.7529412, 1,
-0.08463326, 1.317779, 0.009750114, 0, 1, 0.7607843, 1,
-0.08242551, 0.8926931, 0.7893194, 0, 1, 0.7647059, 1,
-0.08060501, 0.7555987, -1.88611, 0, 1, 0.772549, 1,
-0.08033244, 2.320989, 0.6030509, 0, 1, 0.7764706, 1,
-0.07576472, -1.370439, -5.28719, 0, 1, 0.7843137, 1,
-0.07442133, 1.645132, -0.0948116, 0, 1, 0.7882353, 1,
-0.06748425, -0.7798226, -3.184527, 0, 1, 0.7960784, 1,
-0.06653787, 0.6701066, 0.7810784, 0, 1, 0.8039216, 1,
-0.06543904, 1.128058, -0.264459, 0, 1, 0.8078431, 1,
-0.06416486, -0.2617222, -3.022793, 0, 1, 0.8156863, 1,
-0.06021686, -0.718195, -2.050785, 0, 1, 0.8196079, 1,
-0.05272643, 0.918044, 0.3955868, 0, 1, 0.827451, 1,
-0.05207857, -0.4629662, -4.541503, 0, 1, 0.8313726, 1,
-0.0496796, -0.7543976, -3.566898, 0, 1, 0.8392157, 1,
-0.04800693, -1.042674, -2.739064, 0, 1, 0.8431373, 1,
-0.04768376, 0.8637003, -1.288531, 0, 1, 0.8509804, 1,
-0.04612377, 0.5581688, -1.148148, 0, 1, 0.854902, 1,
-0.04324308, 1.082006, 0.3802183, 0, 1, 0.8627451, 1,
-0.04281532, -0.6065246, -2.919431, 0, 1, 0.8666667, 1,
-0.04242314, 0.01538649, -3.181934, 0, 1, 0.8745098, 1,
-0.03987595, -1.065795, -3.710735, 0, 1, 0.8784314, 1,
-0.03661861, -0.8382401, -2.577971, 0, 1, 0.8862745, 1,
-0.03651395, 0.1290451, 0.1505023, 0, 1, 0.8901961, 1,
-0.03309042, -0.3199303, -4.604247, 0, 1, 0.8980392, 1,
-0.02703478, 0.3735005, -2.560783, 0, 1, 0.9058824, 1,
-0.02693979, 0.02810609, 0.1321536, 0, 1, 0.9098039, 1,
-0.02386255, -1.412451, -3.666917, 0, 1, 0.9176471, 1,
-0.02259729, -0.3741029, -1.936835, 0, 1, 0.9215686, 1,
-0.01936591, 0.3127875, 0.810476, 0, 1, 0.9294118, 1,
-0.0190809, 0.285211, -1.456097, 0, 1, 0.9333333, 1,
-0.009378362, -1.170787, -2.550818, 0, 1, 0.9411765, 1,
-0.003688671, -2.476399, -3.724567, 0, 1, 0.945098, 1,
0.003416574, 0.147104, 0.649438, 0, 1, 0.9529412, 1,
0.004503022, -2.396199, 4.149743, 0, 1, 0.9568627, 1,
0.01211705, 1.105112, 1.300528, 0, 1, 0.9647059, 1,
0.01240737, -1.050104, 2.022343, 0, 1, 0.9686275, 1,
0.01428643, 0.7180983, 1.688112, 0, 1, 0.9764706, 1,
0.01966203, 0.9339713, 0.02625639, 0, 1, 0.9803922, 1,
0.02267342, -1.283237, 3.676048, 0, 1, 0.9882353, 1,
0.0226799, -0.5559675, 3.055451, 0, 1, 0.9921569, 1,
0.02456096, 0.03651861, -0.6547773, 0, 1, 1, 1,
0.02486685, 0.5794421, -0.1659592, 0, 0.9921569, 1, 1,
0.02909373, 0.1160451, 1.207835, 0, 0.9882353, 1, 1,
0.03040323, -0.8297051, 2.86736, 0, 0.9803922, 1, 1,
0.03078879, -2.117744, 3.431194, 0, 0.9764706, 1, 1,
0.03421274, 0.6699792, -0.1573472, 0, 0.9686275, 1, 1,
0.0350979, 0.7410663, -0.737553, 0, 0.9647059, 1, 1,
0.0354932, 0.4927747, -0.09048295, 0, 0.9568627, 1, 1,
0.0363442, 1.784397, -1.069471, 0, 0.9529412, 1, 1,
0.04027144, -1.216206, 3.111987, 0, 0.945098, 1, 1,
0.04049286, -0.3352028, 2.153506, 0, 0.9411765, 1, 1,
0.04133939, 0.9057275, 0.514973, 0, 0.9333333, 1, 1,
0.04248345, 1.000284, 1.293787, 0, 0.9294118, 1, 1,
0.04348123, 0.3369795, -0.06787532, 0, 0.9215686, 1, 1,
0.04478531, -0.03573561, 2.345035, 0, 0.9176471, 1, 1,
0.05314383, 1.466903, 0.9634486, 0, 0.9098039, 1, 1,
0.05427397, 0.4888852, -1.260396, 0, 0.9058824, 1, 1,
0.05664006, 0.07398889, 2.03594, 0, 0.8980392, 1, 1,
0.05775519, 0.4437443, -0.1471489, 0, 0.8901961, 1, 1,
0.05789927, -0.5617815, 3.083339, 0, 0.8862745, 1, 1,
0.06222269, 0.5104594, -0.2877844, 0, 0.8784314, 1, 1,
0.06749149, 1.235181, 1.773255, 0, 0.8745098, 1, 1,
0.07564051, -1.334355, 4.49696, 0, 0.8666667, 1, 1,
0.07757489, 0.2825013, -0.8121709, 0, 0.8627451, 1, 1,
0.07929441, -1.370757, 3.888235, 0, 0.854902, 1, 1,
0.08151074, 0.8814527, -0.7809927, 0, 0.8509804, 1, 1,
0.08274373, -0.6390458, 1.740303, 0, 0.8431373, 1, 1,
0.08402663, 0.7040687, 1.814557, 0, 0.8392157, 1, 1,
0.08771861, 0.6472716, -1.338298, 0, 0.8313726, 1, 1,
0.08809746, -0.5820053, 3.314205, 0, 0.827451, 1, 1,
0.09156986, -1.343076, 2.907058, 0, 0.8196079, 1, 1,
0.09286037, 0.2888517, 1.881938, 0, 0.8156863, 1, 1,
0.09308016, 0.239875, 0.9424281, 0, 0.8078431, 1, 1,
0.09333234, -0.6516063, 2.615098, 0, 0.8039216, 1, 1,
0.09451343, -0.2408589, 2.760707, 0, 0.7960784, 1, 1,
0.09943952, -0.9018999, 3.357115, 0, 0.7882353, 1, 1,
0.1023507, 1.753055, 2.542068, 0, 0.7843137, 1, 1,
0.1026029, -1.071557, 2.08439, 0, 0.7764706, 1, 1,
0.1039654, 0.3462156, 0.06200178, 0, 0.772549, 1, 1,
0.1075331, -0.5988039, 2.470948, 0, 0.7647059, 1, 1,
0.1089923, -0.1755757, 2.728687, 0, 0.7607843, 1, 1,
0.1112355, 0.5377731, -1.041779, 0, 0.7529412, 1, 1,
0.1118593, 0.1989321, 0.1797124, 0, 0.7490196, 1, 1,
0.1150536, -0.5115265, 3.358611, 0, 0.7411765, 1, 1,
0.1157592, 0.05688006, 0.3673455, 0, 0.7372549, 1, 1,
0.1165387, 2.18522, 0.5580809, 0, 0.7294118, 1, 1,
0.1178032, 0.2261464, 1.428554, 0, 0.7254902, 1, 1,
0.1255347, -0.1703061, 3.608924, 0, 0.7176471, 1, 1,
0.1340478, -0.9664946, 2.698299, 0, 0.7137255, 1, 1,
0.1351148, -0.3080402, 2.122786, 0, 0.7058824, 1, 1,
0.1390904, 0.3271571, 0.5348309, 0, 0.6980392, 1, 1,
0.1416861, 0.4911237, 1.334029, 0, 0.6941177, 1, 1,
0.1428562, -0.02336936, 1.413049, 0, 0.6862745, 1, 1,
0.1456049, -0.00312907, 1.699296, 0, 0.682353, 1, 1,
0.152384, -0.8054815, 5.144644, 0, 0.6745098, 1, 1,
0.1529773, 0.9708074, 0.4717171, 0, 0.6705883, 1, 1,
0.154776, -2.642484, 3.24786, 0, 0.6627451, 1, 1,
0.1556499, -0.07113979, 2.170125, 0, 0.6588235, 1, 1,
0.1559298, -0.8066289, 3.306688, 0, 0.6509804, 1, 1,
0.1561978, 0.3429944, -1.639794, 0, 0.6470588, 1, 1,
0.1592476, 0.4443898, -1.776335, 0, 0.6392157, 1, 1,
0.1597866, -0.1618478, 3.215742, 0, 0.6352941, 1, 1,
0.1613668, -0.3820326, 1.917794, 0, 0.627451, 1, 1,
0.1628414, -0.5260525, 2.297225, 0, 0.6235294, 1, 1,
0.1640432, -0.4580363, 1.611764, 0, 0.6156863, 1, 1,
0.1642257, -0.4549226, 0.8313921, 0, 0.6117647, 1, 1,
0.1649553, -0.4055588, 3.255111, 0, 0.6039216, 1, 1,
0.1665241, 1.074014, -0.4491401, 0, 0.5960785, 1, 1,
0.1675217, 0.5991339, -0.6851521, 0, 0.5921569, 1, 1,
0.1691527, -0.8342938, 2.452095, 0, 0.5843138, 1, 1,
0.1692921, 0.2287526, 1.852099, 0, 0.5803922, 1, 1,
0.1726672, -0.7465842, 4.214308, 0, 0.572549, 1, 1,
0.1745914, -0.1230221, 3.819878, 0, 0.5686275, 1, 1,
0.1774773, -0.7357711, 3.963632, 0, 0.5607843, 1, 1,
0.178666, 0.9186117, 0.3345509, 0, 0.5568628, 1, 1,
0.1851667, 0.2596015, 1.465375, 0, 0.5490196, 1, 1,
0.1928986, -0.3008853, 3.025499, 0, 0.5450981, 1, 1,
0.1936912, 2.159943, 0.2041389, 0, 0.5372549, 1, 1,
0.1964585, -0.7715512, 2.453215, 0, 0.5333334, 1, 1,
0.1970628, -1.548233, 5.040471, 0, 0.5254902, 1, 1,
0.2021658, 1.681556, 0.004205861, 0, 0.5215687, 1, 1,
0.2055067, 1.064404, -0.6452262, 0, 0.5137255, 1, 1,
0.2096741, -0.05307758, 2.109408, 0, 0.509804, 1, 1,
0.2113093, -2.076646, 3.104268, 0, 0.5019608, 1, 1,
0.2113269, -0.1917617, 1.423698, 0, 0.4941176, 1, 1,
0.2147288, -0.2435644, 1.425218, 0, 0.4901961, 1, 1,
0.2298955, 0.873509, -1.12326, 0, 0.4823529, 1, 1,
0.2317001, 1.39936, 1.174647, 0, 0.4784314, 1, 1,
0.2320094, -0.7907246, 4.028334, 0, 0.4705882, 1, 1,
0.2357141, -0.624328, 4.527673, 0, 0.4666667, 1, 1,
0.2395828, -0.1614088, 1.810098, 0, 0.4588235, 1, 1,
0.2400692, -0.2864273, 3.140705, 0, 0.454902, 1, 1,
0.2406618, 1.720465, 1.978394, 0, 0.4470588, 1, 1,
0.242325, -1.137367, 2.135783, 0, 0.4431373, 1, 1,
0.2525357, -0.3670176, 1.097718, 0, 0.4352941, 1, 1,
0.2573937, -0.0290199, 1.877449, 0, 0.4313726, 1, 1,
0.2596084, 0.1452488, 2.299599, 0, 0.4235294, 1, 1,
0.2605292, -1.880611, 3.420218, 0, 0.4196078, 1, 1,
0.2619829, -0.6441726, 1.914988, 0, 0.4117647, 1, 1,
0.2634267, 1.194457, 1.44841, 0, 0.4078431, 1, 1,
0.2649051, 0.9408225, -1.665067, 0, 0.4, 1, 1,
0.2660652, -1.458892, 3.990547, 0, 0.3921569, 1, 1,
0.2692502, -0.612891, 2.639649, 0, 0.3882353, 1, 1,
0.2709902, -0.538295, 3.432144, 0, 0.3803922, 1, 1,
0.2736811, 1.452919, 0.6420619, 0, 0.3764706, 1, 1,
0.2771685, -1.629949, 3.437338, 0, 0.3686275, 1, 1,
0.2808499, 2.007693, 0.7782317, 0, 0.3647059, 1, 1,
0.2818356, -0.102824, 2.113996, 0, 0.3568628, 1, 1,
0.2819911, -1.101256, 4.499302, 0, 0.3529412, 1, 1,
0.2830623, 1.302435, -1.115269, 0, 0.345098, 1, 1,
0.285057, 0.5186718, 0.3313106, 0, 0.3411765, 1, 1,
0.2884639, 0.8117012, -1.292474, 0, 0.3333333, 1, 1,
0.3020172, -0.4747067, 2.043629, 0, 0.3294118, 1, 1,
0.3058077, -0.29314, 2.043367, 0, 0.3215686, 1, 1,
0.3104349, 0.4010629, -0.3813486, 0, 0.3176471, 1, 1,
0.3146765, -1.202889, 3.090478, 0, 0.3098039, 1, 1,
0.3151217, -0.04287397, 2.403018, 0, 0.3058824, 1, 1,
0.3173791, -0.06697937, 2.152053, 0, 0.2980392, 1, 1,
0.3203474, 1.620325, -0.8183118, 0, 0.2901961, 1, 1,
0.3226588, -0.3787906, 0.9518683, 0, 0.2862745, 1, 1,
0.326948, 0.2197023, -0.7083761, 0, 0.2784314, 1, 1,
0.3309679, 0.8781561, 0.6745611, 0, 0.2745098, 1, 1,
0.3328528, -1.277712, 2.941914, 0, 0.2666667, 1, 1,
0.3333265, -0.1103211, 1.846391, 0, 0.2627451, 1, 1,
0.3359663, 0.5185093, 0.6713306, 0, 0.254902, 1, 1,
0.3407315, 0.4145104, 0.2671828, 0, 0.2509804, 1, 1,
0.3422026, -0.6486928, 2.801949, 0, 0.2431373, 1, 1,
0.3422419, 0.9265499, -1.330125, 0, 0.2392157, 1, 1,
0.3446625, 0.03095677, 1.731635, 0, 0.2313726, 1, 1,
0.3494363, -1.033068, 4.989613, 0, 0.227451, 1, 1,
0.349757, -0.1702095, 3.342072, 0, 0.2196078, 1, 1,
0.3498028, -0.3553831, 3.958266, 0, 0.2156863, 1, 1,
0.3518386, 0.959594, -0.05593104, 0, 0.2078431, 1, 1,
0.3528675, 0.7113882, -0.5303778, 0, 0.2039216, 1, 1,
0.354437, 0.2725403, 0.06868637, 0, 0.1960784, 1, 1,
0.3561043, -0.8869948, 1.809296, 0, 0.1882353, 1, 1,
0.3618244, -1.087093, 2.726734, 0, 0.1843137, 1, 1,
0.36208, -0.7631202, 2.28431, 0, 0.1764706, 1, 1,
0.3628777, -1.438551, 1.698005, 0, 0.172549, 1, 1,
0.365972, 1.94718, -0.270496, 0, 0.1647059, 1, 1,
0.3670278, -0.05248501, 2.183554, 0, 0.1607843, 1, 1,
0.3696479, -1.373873, 2.511255, 0, 0.1529412, 1, 1,
0.3701965, -0.5426571, 3.032395, 0, 0.1490196, 1, 1,
0.3709401, 0.2332141, 2.228357, 0, 0.1411765, 1, 1,
0.3709913, 1.61229, -0.3972784, 0, 0.1372549, 1, 1,
0.3786084, 0.1936023, 2.554232, 0, 0.1294118, 1, 1,
0.3818749, -0.04062214, 2.041425, 0, 0.1254902, 1, 1,
0.3853619, 2.590093, 1.012707, 0, 0.1176471, 1, 1,
0.3865106, -2.359415, 2.703465, 0, 0.1137255, 1, 1,
0.3909395, 0.1218269, -0.4311909, 0, 0.1058824, 1, 1,
0.3949679, -1.464194, 4.301049, 0, 0.09803922, 1, 1,
0.3970741, -0.2693157, 3.35882, 0, 0.09411765, 1, 1,
0.3999911, 2.273727, 1.977751, 0, 0.08627451, 1, 1,
0.4021569, 0.8395159, -0.3914703, 0, 0.08235294, 1, 1,
0.4100922, 1.057869, -0.5807437, 0, 0.07450981, 1, 1,
0.4107115, -1.990202, 4.710164, 0, 0.07058824, 1, 1,
0.4152054, -1.508836, 3.037668, 0, 0.0627451, 1, 1,
0.4241459, 0.4115586, 0.7029018, 0, 0.05882353, 1, 1,
0.4242453, 0.4318002, 0.5209896, 0, 0.05098039, 1, 1,
0.4249609, -0.3948825, 2.968292, 0, 0.04705882, 1, 1,
0.428914, -0.4100527, 2.213374, 0, 0.03921569, 1, 1,
0.4289868, -0.8545924, 2.207706, 0, 0.03529412, 1, 1,
0.4308906, 0.9451894, -1.503004, 0, 0.02745098, 1, 1,
0.4334717, -0.6029813, 3.254922, 0, 0.02352941, 1, 1,
0.4347196, -1.112233, 2.893211, 0, 0.01568628, 1, 1,
0.4397446, -0.3280197, 1.567102, 0, 0.01176471, 1, 1,
0.4502347, -1.216464, 0.5671349, 0, 0.003921569, 1, 1,
0.450605, 0.7061167, 2.209745, 0.003921569, 0, 1, 1,
0.4516523, -1.804325, 2.220306, 0.007843138, 0, 1, 1,
0.451754, 0.6978956, 1.555882, 0.01568628, 0, 1, 1,
0.4521341, -0.2962083, 2.059074, 0.01960784, 0, 1, 1,
0.4559988, 0.4782962, 1.088888, 0.02745098, 0, 1, 1,
0.4574395, -0.8501529, 2.976383, 0.03137255, 0, 1, 1,
0.4580598, 0.03449817, -0.405616, 0.03921569, 0, 1, 1,
0.4620588, -1.818316, 1.814596, 0.04313726, 0, 1, 1,
0.4647948, 0.8793105, -0.4093554, 0.05098039, 0, 1, 1,
0.4650923, -0.2070582, 1.978709, 0.05490196, 0, 1, 1,
0.4729711, 0.5756539, 1.092135, 0.0627451, 0, 1, 1,
0.4773632, 0.3798943, 1.335343, 0.06666667, 0, 1, 1,
0.4817654, -0.2670333, 2.027344, 0.07450981, 0, 1, 1,
0.487975, 0.5989236, 1.742073, 0.07843138, 0, 1, 1,
0.494411, -0.7242073, 1.249766, 0.08627451, 0, 1, 1,
0.4944953, -0.3949657, 2.993705, 0.09019608, 0, 1, 1,
0.4960007, 0.532366, 0.8573438, 0.09803922, 0, 1, 1,
0.5018421, 0.517422, 1.876382, 0.1058824, 0, 1, 1,
0.5023131, -1.021849, 4.51628, 0.1098039, 0, 1, 1,
0.5053211, -0.9292129, 1.968953, 0.1176471, 0, 1, 1,
0.5088179, 0.5969064, 2.257467, 0.1215686, 0, 1, 1,
0.5104707, -1.048201, 2.583412, 0.1294118, 0, 1, 1,
0.5115998, 1.812774, 0.2340236, 0.1333333, 0, 1, 1,
0.5130296, -0.3027646, 2.12279, 0.1411765, 0, 1, 1,
0.5176747, 1.340976, 0.9660981, 0.145098, 0, 1, 1,
0.5183302, 0.5761844, -0.2961535, 0.1529412, 0, 1, 1,
0.5185736, -1.271981, 1.879308, 0.1568628, 0, 1, 1,
0.5251431, -0.06210922, 1.716405, 0.1647059, 0, 1, 1,
0.529479, 0.8511336, 1.42622, 0.1686275, 0, 1, 1,
0.5324047, 1.303665, 0.8354284, 0.1764706, 0, 1, 1,
0.5450498, 0.7886615, -0.1810681, 0.1803922, 0, 1, 1,
0.5453799, 0.2297422, 0.2626004, 0.1882353, 0, 1, 1,
0.5453886, -2.074408, 2.661266, 0.1921569, 0, 1, 1,
0.5463144, 1.270153, 0.8207241, 0.2, 0, 1, 1,
0.5468922, 0.03947828, 2.246538, 0.2078431, 0, 1, 1,
0.5483168, -0.06839458, 0.1542946, 0.2117647, 0, 1, 1,
0.5607069, 0.3314599, 1.42621, 0.2196078, 0, 1, 1,
0.5702034, 0.08097895, 2.325175, 0.2235294, 0, 1, 1,
0.5706044, 0.7801257, 0.4463544, 0.2313726, 0, 1, 1,
0.5735254, -0.3022431, 2.035645, 0.2352941, 0, 1, 1,
0.5795976, -0.5986049, 0.3930483, 0.2431373, 0, 1, 1,
0.5798952, 1.117306, 1.775318, 0.2470588, 0, 1, 1,
0.5838384, -0.2627177, 4.020111, 0.254902, 0, 1, 1,
0.5852952, 1.02189, 1.938222, 0.2588235, 0, 1, 1,
0.5863204, 2.760818, 3.045141, 0.2666667, 0, 1, 1,
0.5863905, 0.1968898, 0.9608223, 0.2705882, 0, 1, 1,
0.5916837, -1.247636, 2.153454, 0.2784314, 0, 1, 1,
0.5923218, -0.1702384, 2.292381, 0.282353, 0, 1, 1,
0.5933111, -0.6337435, 1.077542, 0.2901961, 0, 1, 1,
0.5939713, -0.09626625, 0.3571249, 0.2941177, 0, 1, 1,
0.5951073, -1.756887, 2.190759, 0.3019608, 0, 1, 1,
0.5981098, 2.11833, -1.210404, 0.3098039, 0, 1, 1,
0.6010357, -0.1544519, 1.837091, 0.3137255, 0, 1, 1,
0.6013352, -0.8683774, 3.006549, 0.3215686, 0, 1, 1,
0.6081734, -0.6629667, 2.308294, 0.3254902, 0, 1, 1,
0.6168595, 1.298595, -0.1155684, 0.3333333, 0, 1, 1,
0.6170349, -0.6440199, 3.160547, 0.3372549, 0, 1, 1,
0.6174027, -0.6907287, 1.879722, 0.345098, 0, 1, 1,
0.6191964, 1.663123, 0.01790007, 0.3490196, 0, 1, 1,
0.6229675, -0.7002489, 0.8711298, 0.3568628, 0, 1, 1,
0.6245547, -0.7759008, 3.151377, 0.3607843, 0, 1, 1,
0.6257934, 0.5623732, 0.7964626, 0.3686275, 0, 1, 1,
0.6262679, 0.6437861, 1.19864, 0.372549, 0, 1, 1,
0.6263885, 0.2006702, 1.014867, 0.3803922, 0, 1, 1,
0.6283392, -1.173729, 2.571332, 0.3843137, 0, 1, 1,
0.6344492, 0.4459075, 1.535558, 0.3921569, 0, 1, 1,
0.6378862, 0.4855021, -0.4917695, 0.3960784, 0, 1, 1,
0.6390476, -0.2156726, 1.419691, 0.4039216, 0, 1, 1,
0.6402462, -0.2327377, 4.659863, 0.4117647, 0, 1, 1,
0.6413938, 0.6735462, 1.270637, 0.4156863, 0, 1, 1,
0.6419228, 1.062959, -0.3364796, 0.4235294, 0, 1, 1,
0.6433086, -0.1621084, 2.334155, 0.427451, 0, 1, 1,
0.6453729, 1.114296, 0.6139024, 0.4352941, 0, 1, 1,
0.6493799, 0.3313772, 0.9856601, 0.4392157, 0, 1, 1,
0.6526321, 0.06421214, 1.504016, 0.4470588, 0, 1, 1,
0.6534461, -0.04079582, 2.273238, 0.4509804, 0, 1, 1,
0.6571915, -1.414529, 2.366312, 0.4588235, 0, 1, 1,
0.6664611, -0.2368566, 2.826929, 0.4627451, 0, 1, 1,
0.6668962, -0.709228, 2.389035, 0.4705882, 0, 1, 1,
0.6672454, -1.311123, 3.340093, 0.4745098, 0, 1, 1,
0.6680226, 0.05879486, -0.01706894, 0.4823529, 0, 1, 1,
0.6733324, -0.6086704, 4.321155, 0.4862745, 0, 1, 1,
0.676992, 0.760344, 0.3310429, 0.4941176, 0, 1, 1,
0.6809013, -1.631999, 1.717245, 0.5019608, 0, 1, 1,
0.6846199, 2.350111, -0.7531292, 0.5058824, 0, 1, 1,
0.6868934, 0.08452531, 0.2189798, 0.5137255, 0, 1, 1,
0.6903874, -0.02575576, 0.6920387, 0.5176471, 0, 1, 1,
0.6930116, 0.06871609, 1.516754, 0.5254902, 0, 1, 1,
0.6940928, 1.246708, 0.5337011, 0.5294118, 0, 1, 1,
0.6961842, -1.151856, 2.157998, 0.5372549, 0, 1, 1,
0.696568, -1.332331, 2.930959, 0.5411765, 0, 1, 1,
0.6992398, 1.159808, -0.8049511, 0.5490196, 0, 1, 1,
0.7048872, 0.232018, 1.89637, 0.5529412, 0, 1, 1,
0.7075619, -0.5650878, 3.331043, 0.5607843, 0, 1, 1,
0.7143423, 1.144249, 2.462258, 0.5647059, 0, 1, 1,
0.7153302, -1.919458, 1.417847, 0.572549, 0, 1, 1,
0.7166051, -1.536065, 2.658132, 0.5764706, 0, 1, 1,
0.7276282, -0.9670753, 1.806846, 0.5843138, 0, 1, 1,
0.7280436, 0.4180541, 2.92199, 0.5882353, 0, 1, 1,
0.7298204, -1.970783, 1.700645, 0.5960785, 0, 1, 1,
0.7310064, 1.629611, 0.9093524, 0.6039216, 0, 1, 1,
0.7320028, -0.5362594, -0.1764615, 0.6078432, 0, 1, 1,
0.7345757, 0.171121, 0.7840668, 0.6156863, 0, 1, 1,
0.7402102, -1.673848, 2.807194, 0.6196079, 0, 1, 1,
0.7463773, 0.3574294, -0.1427483, 0.627451, 0, 1, 1,
0.7526776, 1.375953, 1.500539, 0.6313726, 0, 1, 1,
0.7543781, 0.08915509, 2.208699, 0.6392157, 0, 1, 1,
0.7546867, -0.3090919, 2.838963, 0.6431373, 0, 1, 1,
0.7555249, -1.020026, 3.370842, 0.6509804, 0, 1, 1,
0.7560191, -0.07466508, 3.041199, 0.654902, 0, 1, 1,
0.7563373, 0.7260287, 0.1169705, 0.6627451, 0, 1, 1,
0.758848, -1.013183, 1.002583, 0.6666667, 0, 1, 1,
0.7732295, 0.1479666, 0.5813169, 0.6745098, 0, 1, 1,
0.7748718, -0.203602, 2.64448, 0.6784314, 0, 1, 1,
0.7750568, -0.5619341, 3.105866, 0.6862745, 0, 1, 1,
0.7754291, -0.8067954, 2.085631, 0.6901961, 0, 1, 1,
0.7771254, 0.9209901, 1.210212, 0.6980392, 0, 1, 1,
0.7794561, 0.2279441, 1.769591, 0.7058824, 0, 1, 1,
0.7828444, 0.7688667, -0.1648995, 0.7098039, 0, 1, 1,
0.7836034, 0.224572, 0.08515793, 0.7176471, 0, 1, 1,
0.7897817, 0.5413984, -0.468523, 0.7215686, 0, 1, 1,
0.7970501, 0.6952562, 1.508924, 0.7294118, 0, 1, 1,
0.7999798, 2.294166, -0.8540121, 0.7333333, 0, 1, 1,
0.8013402, 0.3744218, 0.4449107, 0.7411765, 0, 1, 1,
0.8019648, -1.390349, 3.169781, 0.7450981, 0, 1, 1,
0.8042715, -0.02385991, 2.359024, 0.7529412, 0, 1, 1,
0.8045495, 0.4526449, 0.5410799, 0.7568628, 0, 1, 1,
0.805985, 0.5299285, 1.565807, 0.7647059, 0, 1, 1,
0.8199698, 0.4020205, 3.265815, 0.7686275, 0, 1, 1,
0.8261202, 0.4533399, 0.5866315, 0.7764706, 0, 1, 1,
0.8306015, 0.7710732, -0.2371848, 0.7803922, 0, 1, 1,
0.8363898, -0.5226888, 2.216286, 0.7882353, 0, 1, 1,
0.8515996, 0.6700877, 0.5017047, 0.7921569, 0, 1, 1,
0.8525762, 0.650995, 2.844897, 0.8, 0, 1, 1,
0.8526969, -0.6500399, 3.00965, 0.8078431, 0, 1, 1,
0.8554388, -2.141147, 3.777843, 0.8117647, 0, 1, 1,
0.8570957, -0.5607111, 1.222514, 0.8196079, 0, 1, 1,
0.8576426, -0.8618165, 3.877544, 0.8235294, 0, 1, 1,
0.858187, 0.7431109, -0.7305185, 0.8313726, 0, 1, 1,
0.8599873, -1.265915, 3.728439, 0.8352941, 0, 1, 1,
0.8630493, 0.6957748, 1.082021, 0.8431373, 0, 1, 1,
0.8643972, 1.080309, -0.2810218, 0.8470588, 0, 1, 1,
0.8657598, 0.976912, 0.4857201, 0.854902, 0, 1, 1,
0.8678018, 1.406151, -1.489015, 0.8588235, 0, 1, 1,
0.868732, 0.05096322, 2.971828, 0.8666667, 0, 1, 1,
0.8689538, 0.3193715, 0.2566404, 0.8705882, 0, 1, 1,
0.8794531, -1.749182, 2.742105, 0.8784314, 0, 1, 1,
0.8825526, -0.6090155, 3.657601, 0.8823529, 0, 1, 1,
0.882835, 0.007747209, 0.6101532, 0.8901961, 0, 1, 1,
0.885866, 1.878888, 1.362432, 0.8941177, 0, 1, 1,
0.8958003, -0.264755, 1.196901, 0.9019608, 0, 1, 1,
0.9089715, 0.0805919, 1.727592, 0.9098039, 0, 1, 1,
0.9120513, -1.181899, 2.555257, 0.9137255, 0, 1, 1,
0.9121311, -1.231053, 2.46489, 0.9215686, 0, 1, 1,
0.9124219, 0.05364959, 1.816381, 0.9254902, 0, 1, 1,
0.9126129, -1.405503, 2.350444, 0.9333333, 0, 1, 1,
0.9135295, -1.542241, 3.226685, 0.9372549, 0, 1, 1,
0.919539, -1.19247, 1.710685, 0.945098, 0, 1, 1,
0.9257415, -0.101739, 0.4036424, 0.9490196, 0, 1, 1,
0.927177, -0.131989, 3.007432, 0.9568627, 0, 1, 1,
0.9308754, -0.4429815, 2.663763, 0.9607843, 0, 1, 1,
0.932996, 0.9023437, -0.6643291, 0.9686275, 0, 1, 1,
0.9348658, 0.1148037, 0.5258275, 0.972549, 0, 1, 1,
0.9350324, 0.4256547, 0.7462292, 0.9803922, 0, 1, 1,
0.9382541, 0.4295126, 0.3399146, 0.9843137, 0, 1, 1,
0.9384096, 0.09966354, 1.02113, 0.9921569, 0, 1, 1,
0.9395745, -0.945291, 2.192547, 0.9960784, 0, 1, 1,
0.9446524, -0.8045212, 2.895476, 1, 0, 0.9960784, 1,
0.9494923, 0.2505697, 1.034306, 1, 0, 0.9882353, 1,
0.9497864, -0.2727098, 2.425599, 1, 0, 0.9843137, 1,
0.9519209, -0.9511689, 1.953392, 1, 0, 0.9764706, 1,
0.9522665, -1.029084, 0.6011284, 1, 0, 0.972549, 1,
0.9567946, 0.2496941, 2.205668, 1, 0, 0.9647059, 1,
0.9573976, -0.1275967, 3.230386, 1, 0, 0.9607843, 1,
0.9679208, 1.013679, -1.202945, 1, 0, 0.9529412, 1,
0.9691733, 0.5863628, 0.4428351, 1, 0, 0.9490196, 1,
0.9721507, 1.484503, 0.3167276, 1, 0, 0.9411765, 1,
0.9752063, -0.6919643, 3.221757, 1, 0, 0.9372549, 1,
0.9752733, -0.5421746, 3.030643, 1, 0, 0.9294118, 1,
0.9800276, 0.7907651, -1.04677, 1, 0, 0.9254902, 1,
0.9804243, 0.4061314, 0.6519367, 1, 0, 0.9176471, 1,
0.9896923, 0.1173402, 2.901735, 1, 0, 0.9137255, 1,
0.9963561, -2.060798, 2.539463, 1, 0, 0.9058824, 1,
1.003663, -0.3813089, 3.592507, 1, 0, 0.9019608, 1,
1.011346, -0.4711691, 3.470801, 1, 0, 0.8941177, 1,
1.01259, -2.512778, 1.736989, 1, 0, 0.8862745, 1,
1.020338, -1.861079, 2.68605, 1, 0, 0.8823529, 1,
1.021798, -0.347095, 0.8776969, 1, 0, 0.8745098, 1,
1.022135, -0.5128427, 2.982993, 1, 0, 0.8705882, 1,
1.023062, -1.331143, 2.429816, 1, 0, 0.8627451, 1,
1.025412, 1.720945, 0.7019417, 1, 0, 0.8588235, 1,
1.026515, 1.25185, 1.126345, 1, 0, 0.8509804, 1,
1.033477, 0.6981676, 0.3206, 1, 0, 0.8470588, 1,
1.041308, 1.088697, 0.3051562, 1, 0, 0.8392157, 1,
1.05196, 1.253511, -0.9568983, 1, 0, 0.8352941, 1,
1.052843, 1.518178, 0.3698627, 1, 0, 0.827451, 1,
1.054886, 0.1731709, 0.07621207, 1, 0, 0.8235294, 1,
1.061085, -1.650562, 3.028952, 1, 0, 0.8156863, 1,
1.065905, -1.936031, 2.979227, 1, 0, 0.8117647, 1,
1.066238, -0.4939768, 2.483596, 1, 0, 0.8039216, 1,
1.074746, -2.100245, 2.978765, 1, 0, 0.7960784, 1,
1.075164, -0.5810848, 3.320428, 1, 0, 0.7921569, 1,
1.08104, 0.6092181, 0.1927778, 1, 0, 0.7843137, 1,
1.086627, -0.3946544, 1.431712, 1, 0, 0.7803922, 1,
1.095049, -0.06278685, 0.6328263, 1, 0, 0.772549, 1,
1.097948, 0.4168792, 2.803494, 1, 0, 0.7686275, 1,
1.098354, 0.3475844, 0.9419559, 1, 0, 0.7607843, 1,
1.108085, -1.373508, 2.482691, 1, 0, 0.7568628, 1,
1.112862, 0.1214894, 1.898005, 1, 0, 0.7490196, 1,
1.114574, 0.03976385, 0.8486236, 1, 0, 0.7450981, 1,
1.118934, -0.5358353, 1.223071, 1, 0, 0.7372549, 1,
1.122327, -0.2965013, 2.242257, 1, 0, 0.7333333, 1,
1.122725, -1.22665, 3.977522, 1, 0, 0.7254902, 1,
1.130409, -0.1765589, 2.766916, 1, 0, 0.7215686, 1,
1.141051, -0.2230577, 2.95215, 1, 0, 0.7137255, 1,
1.141664, 0.0288475, 2.076998, 1, 0, 0.7098039, 1,
1.143848, 0.2841797, 0.4434099, 1, 0, 0.7019608, 1,
1.153028, -2.440468, 3.029351, 1, 0, 0.6941177, 1,
1.168261, 0.4318139, 2.011297, 1, 0, 0.6901961, 1,
1.171845, 1.885072, 0.9454985, 1, 0, 0.682353, 1,
1.173369, -0.5209928, 3.597991, 1, 0, 0.6784314, 1,
1.180691, 0.5995631, 0.4744685, 1, 0, 0.6705883, 1,
1.192646, 0.5876915, 0.9580263, 1, 0, 0.6666667, 1,
1.194073, -0.08022327, 1.451323, 1, 0, 0.6588235, 1,
1.20122, -0.7156655, 2.939507, 1, 0, 0.654902, 1,
1.202485, -1.412218, 3.953907, 1, 0, 0.6470588, 1,
1.203309, -0.3781874, 2.129484, 1, 0, 0.6431373, 1,
1.205299, -0.1963235, 0.3860693, 1, 0, 0.6352941, 1,
1.210066, 1.14375, -0.4880736, 1, 0, 0.6313726, 1,
1.211579, 1.439487, 0.4360433, 1, 0, 0.6235294, 1,
1.213457, -0.4970148, 2.282778, 1, 0, 0.6196079, 1,
1.218564, 0.8854523, 2.512779, 1, 0, 0.6117647, 1,
1.220855, -2.574756, 4.684002, 1, 0, 0.6078432, 1,
1.23389, -1.049378, 1.744262, 1, 0, 0.6, 1,
1.234947, 0.5395004, -0.1654332, 1, 0, 0.5921569, 1,
1.251051, 0.8107848, 0.5968465, 1, 0, 0.5882353, 1,
1.265729, -0.2582874, 0.6974882, 1, 0, 0.5803922, 1,
1.281185, -1.169345, 1.153505, 1, 0, 0.5764706, 1,
1.301081, 0.1006314, 3.145774, 1, 0, 0.5686275, 1,
1.301991, -1.155952, 1.78457, 1, 0, 0.5647059, 1,
1.315763, 1.506695, 0.9568698, 1, 0, 0.5568628, 1,
1.316543, -1.050503, 2.345326, 1, 0, 0.5529412, 1,
1.317338, -0.6554212, 1.309542, 1, 0, 0.5450981, 1,
1.322484, 0.9135723, 1.082157, 1, 0, 0.5411765, 1,
1.357278, 0.3811628, 2.706534, 1, 0, 0.5333334, 1,
1.359801, 0.09775434, 2.196796, 1, 0, 0.5294118, 1,
1.371791, -0.1375445, 2.450565, 1, 0, 0.5215687, 1,
1.375157, 1.092113, 1.31974, 1, 0, 0.5176471, 1,
1.391013, -0.4432693, 0.4904778, 1, 0, 0.509804, 1,
1.397651, -0.06717391, 1.232275, 1, 0, 0.5058824, 1,
1.403435, -0.6774482, 2.415447, 1, 0, 0.4980392, 1,
1.409554, -0.3816529, 2.81864, 1, 0, 0.4901961, 1,
1.421837, -2.128327, 3.674209, 1, 0, 0.4862745, 1,
1.423498, -0.1170921, 2.537401, 1, 0, 0.4784314, 1,
1.435358, 0.1726291, 0.8903145, 1, 0, 0.4745098, 1,
1.447245, 0.9961789, 2.714587, 1, 0, 0.4666667, 1,
1.447411, -0.6866032, 0.3264938, 1, 0, 0.4627451, 1,
1.461189, 0.6498131, 0.8317766, 1, 0, 0.454902, 1,
1.462859, -0.1620934, 1.29584, 1, 0, 0.4509804, 1,
1.463625, 0.08038665, -0.7242366, 1, 0, 0.4431373, 1,
1.463824, 0.5644456, 2.119453, 1, 0, 0.4392157, 1,
1.464404, 1.351764, -0.02292573, 1, 0, 0.4313726, 1,
1.46804, 1.100176, -0.05307813, 1, 0, 0.427451, 1,
1.468592, -0.3028343, -0.5502902, 1, 0, 0.4196078, 1,
1.473069, 0.1431978, -0.08897592, 1, 0, 0.4156863, 1,
1.47439, -0.08657795, 0.9462594, 1, 0, 0.4078431, 1,
1.488671, 0.1476978, 1.067897, 1, 0, 0.4039216, 1,
1.494664, -0.6473898, 1.417781, 1, 0, 0.3960784, 1,
1.496544, -0.9614586, 0.818706, 1, 0, 0.3882353, 1,
1.500228, 0.9117076, 0.3943208, 1, 0, 0.3843137, 1,
1.500732, 0.7248911, 1.287684, 1, 0, 0.3764706, 1,
1.509966, 0.6499557, 0.7782089, 1, 0, 0.372549, 1,
1.557553, -2.341364, 2.128399, 1, 0, 0.3647059, 1,
1.560811, 0.2088205, 1.175332, 1, 0, 0.3607843, 1,
1.56128, -0.2444174, 2.088487, 1, 0, 0.3529412, 1,
1.562078, 1.672861, -0.667582, 1, 0, 0.3490196, 1,
1.598175, -0.208943, 3.101905, 1, 0, 0.3411765, 1,
1.611563, 0.2770632, 1.666324, 1, 0, 0.3372549, 1,
1.62421, -0.4283704, 2.032516, 1, 0, 0.3294118, 1,
1.640641, -0.5354043, 1.53863, 1, 0, 0.3254902, 1,
1.645256, 0.4131405, 5.519151e-05, 1, 0, 0.3176471, 1,
1.645954, 0.7424777, 0.1736368, 1, 0, 0.3137255, 1,
1.661152, -0.1746352, 2.41753, 1, 0, 0.3058824, 1,
1.661825, 0.1204349, 0.9726548, 1, 0, 0.2980392, 1,
1.669055, -1.936406, 2.327594, 1, 0, 0.2941177, 1,
1.674005, -1.110649, 1.475568, 1, 0, 0.2862745, 1,
1.675279, 0.2897086, 2.766809, 1, 0, 0.282353, 1,
1.676096, 0.1712177, 1.169498, 1, 0, 0.2745098, 1,
1.677265, -0.1105901, 0.4718343, 1, 0, 0.2705882, 1,
1.683273, -0.2136401, 1.150568, 1, 0, 0.2627451, 1,
1.687078, 0.143067, 3.129382, 1, 0, 0.2588235, 1,
1.695427, -0.2332565, 3.313415, 1, 0, 0.2509804, 1,
1.71682, 0.6286352, 0.6996252, 1, 0, 0.2470588, 1,
1.755079, -1.867341, 2.008398, 1, 0, 0.2392157, 1,
1.793889, -0.7883052, 2.379129, 1, 0, 0.2352941, 1,
1.800154, 1.064279, 1.979757, 1, 0, 0.227451, 1,
1.800279, 0.8343088, 1.154823, 1, 0, 0.2235294, 1,
1.837026, -1.045609, 2.332337, 1, 0, 0.2156863, 1,
1.856146, 2.230457, 0.3705976, 1, 0, 0.2117647, 1,
1.874655, -0.8063418, 1.881144, 1, 0, 0.2039216, 1,
1.87574, 1.197005, 2.79495, 1, 0, 0.1960784, 1,
1.909041, -1.064046, 2.163891, 1, 0, 0.1921569, 1,
1.924146, -0.2608758, 2.277862, 1, 0, 0.1843137, 1,
1.940488, 1.347951, 1.115499, 1, 0, 0.1803922, 1,
1.942042, 0.3157759, 2.605483, 1, 0, 0.172549, 1,
1.946122, 1.225492, 0.3266158, 1, 0, 0.1686275, 1,
1.97171, -1.714698, 1.586065, 1, 0, 0.1607843, 1,
1.997233, -1.363571, 2.012265, 1, 0, 0.1568628, 1,
2.017615, -2.244454, 3.077373, 1, 0, 0.1490196, 1,
2.019168, -0.0662436, 0.9871555, 1, 0, 0.145098, 1,
2.077915, -0.1066368, 3.088216, 1, 0, 0.1372549, 1,
2.078281, -0.7280359, 1.124681, 1, 0, 0.1333333, 1,
2.084263, -1.296653, 2.7333, 1, 0, 0.1254902, 1,
2.110444, -0.8231147, 3.06237, 1, 0, 0.1215686, 1,
2.139106, 1.876997, 0.2104622, 1, 0, 0.1137255, 1,
2.149603, -0.1332025, 3.055818, 1, 0, 0.1098039, 1,
2.162314, 1.307009, 0.9542902, 1, 0, 0.1019608, 1,
2.171005, -1.292893, 2.119595, 1, 0, 0.09411765, 1,
2.175981, -0.003825289, 2.666579, 1, 0, 0.09019608, 1,
2.260204, -0.9407455, 2.358252, 1, 0, 0.08235294, 1,
2.380657, 1.162022, -0.1709221, 1, 0, 0.07843138, 1,
2.410094, 0.4749387, 0.8060288, 1, 0, 0.07058824, 1,
2.421639, 0.779569, 0.8326056, 1, 0, 0.06666667, 1,
2.423926, 0.3960493, 3.133544, 1, 0, 0.05882353, 1,
2.431866, 2.003219, -1.143029, 1, 0, 0.05490196, 1,
2.478772, 0.3426975, 0.7336292, 1, 0, 0.04705882, 1,
2.478882, -1.187473, 1.714867, 1, 0, 0.04313726, 1,
2.492161, 1.091101, 1.782806, 1, 0, 0.03529412, 1,
2.498893, -0.7430513, 1.902024, 1, 0, 0.03137255, 1,
2.539081, -0.4526393, 1.402519, 1, 0, 0.02352941, 1,
2.559287, 0.6707692, 2.022832, 1, 0, 0.01960784, 1,
2.666088, 0.2180408, 2.312885, 1, 0, 0.01176471, 1,
2.747401, 0.2342684, 2.933771, 1, 0, 0.007843138, 1
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
-0.1604522, -4.803078, -7.055386, 0, -0.5, 0.5, 0.5,
-0.1604522, -4.803078, -7.055386, 1, -0.5, 0.5, 0.5,
-0.1604522, -4.803078, -7.055386, 1, 1.5, 0.5, 0.5,
-0.1604522, -4.803078, -7.055386, 0, 1.5, 0.5, 0.5
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
-4.054068, -0.2978501, -7.055386, 0, -0.5, 0.5, 0.5,
-4.054068, -0.2978501, -7.055386, 1, -0.5, 0.5, 0.5,
-4.054068, -0.2978501, -7.055386, 1, 1.5, 0.5, 0.5,
-4.054068, -0.2978501, -7.055386, 0, 1.5, 0.5, 0.5
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
-4.054068, -4.803078, -0.07127285, 0, -0.5, 0.5, 0.5,
-4.054068, -4.803078, -0.07127285, 1, -0.5, 0.5, 0.5,
-4.054068, -4.803078, -0.07127285, 1, 1.5, 0.5, 0.5,
-4.054068, -4.803078, -0.07127285, 0, 1.5, 0.5, 0.5
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
-3, -3.76341, -5.443667,
2, -3.76341, -5.443667,
-3, -3.76341, -5.443667,
-3, -3.936688, -5.712287,
-2, -3.76341, -5.443667,
-2, -3.936688, -5.712287,
-1, -3.76341, -5.443667,
-1, -3.936688, -5.712287,
0, -3.76341, -5.443667,
0, -3.936688, -5.712287,
1, -3.76341, -5.443667,
1, -3.936688, -5.712287,
2, -3.76341, -5.443667,
2, -3.936688, -5.712287
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
-3, -4.283244, -6.249527, 0, -0.5, 0.5, 0.5,
-3, -4.283244, -6.249527, 1, -0.5, 0.5, 0.5,
-3, -4.283244, -6.249527, 1, 1.5, 0.5, 0.5,
-3, -4.283244, -6.249527, 0, 1.5, 0.5, 0.5,
-2, -4.283244, -6.249527, 0, -0.5, 0.5, 0.5,
-2, -4.283244, -6.249527, 1, -0.5, 0.5, 0.5,
-2, -4.283244, -6.249527, 1, 1.5, 0.5, 0.5,
-2, -4.283244, -6.249527, 0, 1.5, 0.5, 0.5,
-1, -4.283244, -6.249527, 0, -0.5, 0.5, 0.5,
-1, -4.283244, -6.249527, 1, -0.5, 0.5, 0.5,
-1, -4.283244, -6.249527, 1, 1.5, 0.5, 0.5,
-1, -4.283244, -6.249527, 0, 1.5, 0.5, 0.5,
0, -4.283244, -6.249527, 0, -0.5, 0.5, 0.5,
0, -4.283244, -6.249527, 1, -0.5, 0.5, 0.5,
0, -4.283244, -6.249527, 1, 1.5, 0.5, 0.5,
0, -4.283244, -6.249527, 0, 1.5, 0.5, 0.5,
1, -4.283244, -6.249527, 0, -0.5, 0.5, 0.5,
1, -4.283244, -6.249527, 1, -0.5, 0.5, 0.5,
1, -4.283244, -6.249527, 1, 1.5, 0.5, 0.5,
1, -4.283244, -6.249527, 0, 1.5, 0.5, 0.5,
2, -4.283244, -6.249527, 0, -0.5, 0.5, 0.5,
2, -4.283244, -6.249527, 1, -0.5, 0.5, 0.5,
2, -4.283244, -6.249527, 1, 1.5, 0.5, 0.5,
2, -4.283244, -6.249527, 0, 1.5, 0.5, 0.5
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
-3.155541, -3, -5.443667,
-3.155541, 3, -5.443667,
-3.155541, -3, -5.443667,
-3.305295, -3, -5.712287,
-3.155541, -2, -5.443667,
-3.305295, -2, -5.712287,
-3.155541, -1, -5.443667,
-3.305295, -1, -5.712287,
-3.155541, 0, -5.443667,
-3.305295, 0, -5.712287,
-3.155541, 1, -5.443667,
-3.305295, 1, -5.712287,
-3.155541, 2, -5.443667,
-3.305295, 2, -5.712287,
-3.155541, 3, -5.443667,
-3.305295, 3, -5.712287
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
-3.604804, -3, -6.249527, 0, -0.5, 0.5, 0.5,
-3.604804, -3, -6.249527, 1, -0.5, 0.5, 0.5,
-3.604804, -3, -6.249527, 1, 1.5, 0.5, 0.5,
-3.604804, -3, -6.249527, 0, 1.5, 0.5, 0.5,
-3.604804, -2, -6.249527, 0, -0.5, 0.5, 0.5,
-3.604804, -2, -6.249527, 1, -0.5, 0.5, 0.5,
-3.604804, -2, -6.249527, 1, 1.5, 0.5, 0.5,
-3.604804, -2, -6.249527, 0, 1.5, 0.5, 0.5,
-3.604804, -1, -6.249527, 0, -0.5, 0.5, 0.5,
-3.604804, -1, -6.249527, 1, -0.5, 0.5, 0.5,
-3.604804, -1, -6.249527, 1, 1.5, 0.5, 0.5,
-3.604804, -1, -6.249527, 0, 1.5, 0.5, 0.5,
-3.604804, 0, -6.249527, 0, -0.5, 0.5, 0.5,
-3.604804, 0, -6.249527, 1, -0.5, 0.5, 0.5,
-3.604804, 0, -6.249527, 1, 1.5, 0.5, 0.5,
-3.604804, 0, -6.249527, 0, 1.5, 0.5, 0.5,
-3.604804, 1, -6.249527, 0, -0.5, 0.5, 0.5,
-3.604804, 1, -6.249527, 1, -0.5, 0.5, 0.5,
-3.604804, 1, -6.249527, 1, 1.5, 0.5, 0.5,
-3.604804, 1, -6.249527, 0, 1.5, 0.5, 0.5,
-3.604804, 2, -6.249527, 0, -0.5, 0.5, 0.5,
-3.604804, 2, -6.249527, 1, -0.5, 0.5, 0.5,
-3.604804, 2, -6.249527, 1, 1.5, 0.5, 0.5,
-3.604804, 2, -6.249527, 0, 1.5, 0.5, 0.5,
-3.604804, 3, -6.249527, 0, -0.5, 0.5, 0.5,
-3.604804, 3, -6.249527, 1, -0.5, 0.5, 0.5,
-3.604804, 3, -6.249527, 1, 1.5, 0.5, 0.5,
-3.604804, 3, -6.249527, 0, 1.5, 0.5, 0.5
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
-3.155541, -3.76341, -4,
-3.155541, -3.76341, 4,
-3.155541, -3.76341, -4,
-3.305295, -3.936688, -4,
-3.155541, -3.76341, -2,
-3.305295, -3.936688, -2,
-3.155541, -3.76341, 0,
-3.305295, -3.936688, 0,
-3.155541, -3.76341, 2,
-3.305295, -3.936688, 2,
-3.155541, -3.76341, 4,
-3.305295, -3.936688, 4
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
-3.604804, -4.283244, -4, 0, -0.5, 0.5, 0.5,
-3.604804, -4.283244, -4, 1, -0.5, 0.5, 0.5,
-3.604804, -4.283244, -4, 1, 1.5, 0.5, 0.5,
-3.604804, -4.283244, -4, 0, 1.5, 0.5, 0.5,
-3.604804, -4.283244, -2, 0, -0.5, 0.5, 0.5,
-3.604804, -4.283244, -2, 1, -0.5, 0.5, 0.5,
-3.604804, -4.283244, -2, 1, 1.5, 0.5, 0.5,
-3.604804, -4.283244, -2, 0, 1.5, 0.5, 0.5,
-3.604804, -4.283244, 0, 0, -0.5, 0.5, 0.5,
-3.604804, -4.283244, 0, 1, -0.5, 0.5, 0.5,
-3.604804, -4.283244, 0, 1, 1.5, 0.5, 0.5,
-3.604804, -4.283244, 0, 0, 1.5, 0.5, 0.5,
-3.604804, -4.283244, 2, 0, -0.5, 0.5, 0.5,
-3.604804, -4.283244, 2, 1, -0.5, 0.5, 0.5,
-3.604804, -4.283244, 2, 1, 1.5, 0.5, 0.5,
-3.604804, -4.283244, 2, 0, 1.5, 0.5, 0.5,
-3.604804, -4.283244, 4, 0, -0.5, 0.5, 0.5,
-3.604804, -4.283244, 4, 1, -0.5, 0.5, 0.5,
-3.604804, -4.283244, 4, 1, 1.5, 0.5, 0.5,
-3.604804, -4.283244, 4, 0, 1.5, 0.5, 0.5
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
-3.155541, -3.76341, -5.443667,
-3.155541, 3.167709, -5.443667,
-3.155541, -3.76341, 5.301122,
-3.155541, 3.167709, 5.301122,
-3.155541, -3.76341, -5.443667,
-3.155541, -3.76341, 5.301122,
-3.155541, 3.167709, -5.443667,
-3.155541, 3.167709, 5.301122,
-3.155541, -3.76341, -5.443667,
2.834636, -3.76341, -5.443667,
-3.155541, -3.76341, 5.301122,
2.834636, -3.76341, 5.301122,
-3.155541, 3.167709, -5.443667,
2.834636, 3.167709, -5.443667,
-3.155541, 3.167709, 5.301122,
2.834636, 3.167709, 5.301122,
2.834636, -3.76341, -5.443667,
2.834636, 3.167709, -5.443667,
2.834636, -3.76341, 5.301122,
2.834636, 3.167709, 5.301122,
2.834636, -3.76341, -5.443667,
2.834636, -3.76341, 5.301122,
2.834636, 3.167709, -5.443667,
2.834636, 3.167709, 5.301122
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
var radius = 7.539782;
var distance = 33.54534;
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
mvMatrix.translate( 0.1604522, 0.2978501, 0.07127285 );
mvMatrix.scale( 1.360921, 1.176168, 0.7587082 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.54534);
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
siduron<-read.table("siduron.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-siduron$V2
```

```
## Error in eval(expr, envir, enclos): object 'siduron' not found
```

```r
y<-siduron$V3
```

```
## Error in eval(expr, envir, enclos): object 'siduron' not found
```

```r
z<-siduron$V4
```

```
## Error in eval(expr, envir, enclos): object 'siduron' not found
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
-3.068305, 0.4640315, -2.533036, 0, 0, 1, 1, 1,
-2.967925, 0.06711438, -0.5449339, 1, 0, 0, 1, 1,
-2.717391, -0.4686432, -0.9417391, 1, 0, 0, 1, 1,
-2.637282, -0.2222474, -0.7368175, 1, 0, 0, 1, 1,
-2.605231, 0.3996786, -1.170741, 1, 0, 0, 1, 1,
-2.570286, 1.104712, -1.582343, 1, 0, 0, 1, 1,
-2.516666, -0.2048743, -1.956367, 0, 0, 0, 1, 1,
-2.471503, -1.751948, -2.115531, 0, 0, 0, 1, 1,
-2.393555, -2.284971, -1.5575, 0, 0, 0, 1, 1,
-2.368115, 0.7393792, -1.53822, 0, 0, 0, 1, 1,
-2.328875, 0.1267682, -1.056368, 0, 0, 0, 1, 1,
-2.328694, -0.318981, -1.910737, 0, 0, 0, 1, 1,
-2.320816, 1.315316, -0.7997523, 0, 0, 0, 1, 1,
-2.191007, -0.06299247, -0.9479134, 1, 1, 1, 1, 1,
-2.190293, 1.677809, -1.229092, 1, 1, 1, 1, 1,
-2.187463, -0.2122909, -2.557605, 1, 1, 1, 1, 1,
-2.178029, 0.2710737, -1.60704, 1, 1, 1, 1, 1,
-2.123856, 0.6385436, -1.543428, 1, 1, 1, 1, 1,
-2.120936, 0.8931299, -1.33673, 1, 1, 1, 1, 1,
-2.113297, -1.572556, -3.039069, 1, 1, 1, 1, 1,
-2.082954, -0.2496148, -0.937145, 1, 1, 1, 1, 1,
-2.080682, -0.1176702, -2.694989, 1, 1, 1, 1, 1,
-2.078045, 0.6541165, -0.5726678, 1, 1, 1, 1, 1,
-2.078043, 0.1739398, -1.865185, 1, 1, 1, 1, 1,
-2.067068, 0.06767271, -1.894235, 1, 1, 1, 1, 1,
-2.057486, -0.07243071, -0.5262111, 1, 1, 1, 1, 1,
-1.992632, 0.6161804, -1.326048, 1, 1, 1, 1, 1,
-1.987194, 0.5960813, -0.4754771, 1, 1, 1, 1, 1,
-1.957434, 1.490478, -1.22024, 0, 0, 1, 1, 1,
-1.94154, -0.1838845, -1.24017, 1, 0, 0, 1, 1,
-1.884042, -1.16974, -3.675216, 1, 0, 0, 1, 1,
-1.840631, -1.07671, -2.675223, 1, 0, 0, 1, 1,
-1.839381, 0.5083126, -1.369183, 1, 0, 0, 1, 1,
-1.838016, 0.2064425, -1.478824, 1, 0, 0, 1, 1,
-1.835768, -1.226955, -0.7970558, 0, 0, 0, 1, 1,
-1.828487, -1.258734, -1.187125, 0, 0, 0, 1, 1,
-1.811279, -1.495842, -2.590882, 0, 0, 0, 1, 1,
-1.810942, 0.3593112, -0.7627912, 0, 0, 0, 1, 1,
-1.785976, -0.2510943, -2.334862, 0, 0, 0, 1, 1,
-1.764588, -0.7072375, -1.758771, 0, 0, 0, 1, 1,
-1.722791, 0.7679305, -0.7320783, 0, 0, 0, 1, 1,
-1.715829, -0.7351662, -3.133696, 1, 1, 1, 1, 1,
-1.715481, 0.7276999, -3.230303, 1, 1, 1, 1, 1,
-1.704573, -0.9501836, -3.039418, 1, 1, 1, 1, 1,
-1.699868, 1.197271, -1.290265, 1, 1, 1, 1, 1,
-1.699615, -0.8206095, -1.691341, 1, 1, 1, 1, 1,
-1.694251, -1.398548, -4.610415, 1, 1, 1, 1, 1,
-1.664213, -0.5736704, -1.479671, 1, 1, 1, 1, 1,
-1.622412, 2.019632, -1.37367, 1, 1, 1, 1, 1,
-1.613821, -0.8337379, -1.149558, 1, 1, 1, 1, 1,
-1.612725, 1.778386, -0.5874411, 1, 1, 1, 1, 1,
-1.610251, -0.6955583, -2.656677, 1, 1, 1, 1, 1,
-1.61002, 1.197295, -0.416544, 1, 1, 1, 1, 1,
-1.601536, -0.825967, -1.289344, 1, 1, 1, 1, 1,
-1.59722, 1.274354, -2.584731, 1, 1, 1, 1, 1,
-1.586119, -0.8378748, -2.010082, 1, 1, 1, 1, 1,
-1.584108, -0.9670697, -1.511651, 0, 0, 1, 1, 1,
-1.581712, 1.232262, -1.065731, 1, 0, 0, 1, 1,
-1.581658, 0.7554179, -0.354209, 1, 0, 0, 1, 1,
-1.581202, 2.92783, -1.51622, 1, 0, 0, 1, 1,
-1.577828, 0.2536179, -0.3464884, 1, 0, 0, 1, 1,
-1.576677, 0.1864586, -0.9910613, 1, 0, 0, 1, 1,
-1.568889, 0.4150516, -0.6264912, 0, 0, 0, 1, 1,
-1.555534, 0.2178896, -1.661577, 0, 0, 0, 1, 1,
-1.531484, 0.9810111, -0.9292766, 0, 0, 0, 1, 1,
-1.52807, 1.234955, -0.5823185, 0, 0, 0, 1, 1,
-1.522877, 0.05331041, -0.9588469, 0, 0, 0, 1, 1,
-1.516273, 1.79486, -2.650128, 0, 0, 0, 1, 1,
-1.510638, 0.3652216, -1.819261, 0, 0, 0, 1, 1,
-1.469303, 0.8762198, -1.374007, 1, 1, 1, 1, 1,
-1.44355, -0.3444525, -1.79457, 1, 1, 1, 1, 1,
-1.441659, -1.482093, -2.882107, 1, 1, 1, 1, 1,
-1.43822, -0.8629134, -1.387271, 1, 1, 1, 1, 1,
-1.437225, 0.3541851, -0.8924928, 1, 1, 1, 1, 1,
-1.434435, 1.461994, -1.528627, 1, 1, 1, 1, 1,
-1.425105, 1.691201, -3.197926, 1, 1, 1, 1, 1,
-1.420831, -2.033147, -2.493265, 1, 1, 1, 1, 1,
-1.415641, -0.1030433, -3.186527, 1, 1, 1, 1, 1,
-1.38831, -0.3610562, -1.91698, 1, 1, 1, 1, 1,
-1.379844, -0.01473961, -1.152086, 1, 1, 1, 1, 1,
-1.351604, 1.630849, -0.5403464, 1, 1, 1, 1, 1,
-1.338842, 0.171691, -1.281299, 1, 1, 1, 1, 1,
-1.331424, 0.4555727, 0.6256563, 1, 1, 1, 1, 1,
-1.328684, -0.5067142, -2.366217, 1, 1, 1, 1, 1,
-1.322966, -0.1870111, -2.645819, 0, 0, 1, 1, 1,
-1.314527, -1.110606, -2.315199, 1, 0, 0, 1, 1,
-1.309741, 0.9491394, -1.658102, 1, 0, 0, 1, 1,
-1.302924, -0.5418105, -2.572304, 1, 0, 0, 1, 1,
-1.292523, 0.3928704, -0.02932389, 1, 0, 0, 1, 1,
-1.279902, -2.563855, -3.025228, 1, 0, 0, 1, 1,
-1.275569, -0.4462816, -1.689856, 0, 0, 0, 1, 1,
-1.274077, -0.980691, -2.747296, 0, 0, 0, 1, 1,
-1.272636, 0.8786814, -0.6238585, 0, 0, 0, 1, 1,
-1.266352, -0.4591789, -1.461549, 0, 0, 0, 1, 1,
-1.259236, -0.7729529, -1.286806, 0, 0, 0, 1, 1,
-1.236171, 0.8209059, -1.902154, 0, 0, 0, 1, 1,
-1.229319, 0.2001561, -1.014102, 0, 0, 0, 1, 1,
-1.221531, -0.9309527, 0.5445654, 1, 1, 1, 1, 1,
-1.217798, 0.7656667, 0.8863033, 1, 1, 1, 1, 1,
-1.215634, -0.248303, -2.589637, 1, 1, 1, 1, 1,
-1.214797, 1.826116, 0.2907088, 1, 1, 1, 1, 1,
-1.214167, 1.457269, -0.4665535, 1, 1, 1, 1, 1,
-1.214041, 0.4504803, -0.1200224, 1, 1, 1, 1, 1,
-1.214038, -1.973379, -1.797859, 1, 1, 1, 1, 1,
-1.213771, -1.237491, -1.385324, 1, 1, 1, 1, 1,
-1.211174, 1.485647, 1.285453, 1, 1, 1, 1, 1,
-1.20607, 0.8976117, -0.3579532, 1, 1, 1, 1, 1,
-1.196467, 0.4137847, 0.3249798, 1, 1, 1, 1, 1,
-1.19191, -1.129172, -2.333957, 1, 1, 1, 1, 1,
-1.188678, 0.6734926, -1.235753, 1, 1, 1, 1, 1,
-1.186167, -0.4150302, -0.9057227, 1, 1, 1, 1, 1,
-1.18, -1.549699, -0.2465931, 1, 1, 1, 1, 1,
-1.176429, 1.210969, -0.5331106, 0, 0, 1, 1, 1,
-1.174582, -1.185505, -3.053412, 1, 0, 0, 1, 1,
-1.171076, 0.1568972, -1.446249, 1, 0, 0, 1, 1,
-1.170767, -0.7753286, -1.756418, 1, 0, 0, 1, 1,
-1.150926, 0.5717305, -2.695361, 1, 0, 0, 1, 1,
-1.133544, -0.8124785, -3.34104, 1, 0, 0, 1, 1,
-1.133488, -1.521468, -1.588474, 0, 0, 0, 1, 1,
-1.131204, -0.8465877, -1.489174, 0, 0, 0, 1, 1,
-1.126881, 0.5122145, 0.1982502, 0, 0, 0, 1, 1,
-1.120281, -0.9511533, -1.468204, 0, 0, 0, 1, 1,
-1.099716, 0.1285624, -1.215415, 0, 0, 0, 1, 1,
-1.099001, 0.8494833, -1.287071, 0, 0, 0, 1, 1,
-1.098828, 0.3397566, -0.3445876, 0, 0, 0, 1, 1,
-1.089313, 1.312702, -0.9913596, 1, 1, 1, 1, 1,
-1.085688, 0.09555216, -1.283905, 1, 1, 1, 1, 1,
-1.076546, 1.572198, 0.4855807, 1, 1, 1, 1, 1,
-1.07426, 1.719556, -1.223948, 1, 1, 1, 1, 1,
-1.06562, 0.2112813, -1.912603, 1, 1, 1, 1, 1,
-1.064489, 0.8490929, -1.270214, 1, 1, 1, 1, 1,
-1.060267, 0.2049814, -3.019295, 1, 1, 1, 1, 1,
-1.050059, 0.4157718, -0.8277226, 1, 1, 1, 1, 1,
-1.045494, 0.6543136, -1.041146, 1, 1, 1, 1, 1,
-1.035651, -1.060816, -2.938781, 1, 1, 1, 1, 1,
-1.024901, 0.5008268, -0.1644448, 1, 1, 1, 1, 1,
-1.02468, 0.2839424, -1.743483, 1, 1, 1, 1, 1,
-1.024481, -0.6245669, -2.225407, 1, 1, 1, 1, 1,
-1.014011, 2.580919, -0.4644075, 1, 1, 1, 1, 1,
-1.012824, 0.1625771, -0.9323388, 1, 1, 1, 1, 1,
-1.010783, 0.001425341, -3.714365, 0, 0, 1, 1, 1,
-0.9976662, 0.6628511, -0.08471403, 1, 0, 0, 1, 1,
-0.9962485, 0.8831105, -1.728275, 1, 0, 0, 1, 1,
-0.9868755, -1.024573, -2.347998, 1, 0, 0, 1, 1,
-0.981263, -1.006092, -3.709117, 1, 0, 0, 1, 1,
-0.9785386, 0.2927089, 0.6538805, 1, 0, 0, 1, 1,
-0.9755147, -1.966351, -2.983712, 0, 0, 0, 1, 1,
-0.9712102, -0.3102294, -3.453678, 0, 0, 0, 1, 1,
-0.9698222, 0.3443167, -1.813061, 0, 0, 0, 1, 1,
-0.9530377, 0.1593991, 0.005418609, 0, 0, 0, 1, 1,
-0.9514856, -0.3724928, 0.1450293, 0, 0, 0, 1, 1,
-0.9459822, -1.224893, -0.5117775, 0, 0, 0, 1, 1,
-0.9425081, -0.338587, -1.753909, 0, 0, 0, 1, 1,
-0.9391754, -1.10684, -3.196604, 1, 1, 1, 1, 1,
-0.9356974, 0.257597, -0.1156854, 1, 1, 1, 1, 1,
-0.9338661, -0.8192255, -2.983524, 1, 1, 1, 1, 1,
-0.9299488, 1.445714, -0.4970714, 1, 1, 1, 1, 1,
-0.9243063, -0.7073718, -1.794514, 1, 1, 1, 1, 1,
-0.9237217, -0.1735469, -3.657479, 1, 1, 1, 1, 1,
-0.9205855, -0.8065225, -3.593182, 1, 1, 1, 1, 1,
-0.9172528, 0.1230165, -2.255393, 1, 1, 1, 1, 1,
-0.9158416, 2.722028, -0.6997374, 1, 1, 1, 1, 1,
-0.9090859, 2.159955, 0.09666304, 1, 1, 1, 1, 1,
-0.9074307, -0.5656755, -1.876729, 1, 1, 1, 1, 1,
-0.9033917, 0.8531511, -0.02565327, 1, 1, 1, 1, 1,
-0.9027652, 1.377537, 0.1735992, 1, 1, 1, 1, 1,
-0.8991084, 0.5070969, -1.197318, 1, 1, 1, 1, 1,
-0.8983459, 0.1750818, -2.366303, 1, 1, 1, 1, 1,
-0.8969129, -0.3646747, -2.483018, 0, 0, 1, 1, 1,
-0.8926308, -0.1009943, -1.102958, 1, 0, 0, 1, 1,
-0.8898383, 0.3303806, -0.6440126, 1, 0, 0, 1, 1,
-0.8857201, -1.371448, -1.406535, 1, 0, 0, 1, 1,
-0.8846232, 0.5253233, -1.118764, 1, 0, 0, 1, 1,
-0.8784972, 0.856254, 1.139547, 1, 0, 0, 1, 1,
-0.8746314, 1.573121, 0.2219377, 0, 0, 0, 1, 1,
-0.8737969, 0.6713584, -1.971593, 0, 0, 0, 1, 1,
-0.8728585, -2.450418, -3.2743, 0, 0, 0, 1, 1,
-0.8695555, -0.4078556, -2.750389, 0, 0, 0, 1, 1,
-0.8692294, -0.417686, -1.209565, 0, 0, 0, 1, 1,
-0.8692182, 1.037004, -0.362155, 0, 0, 0, 1, 1,
-0.8687988, 1.221858, -1.618613, 0, 0, 0, 1, 1,
-0.8660838, -1.014826, -1.08366, 1, 1, 1, 1, 1,
-0.862657, 2.063765, 1.266492, 1, 1, 1, 1, 1,
-0.8548974, -1.486845, -3.289996, 1, 1, 1, 1, 1,
-0.8536479, 1.318066, 0.5978872, 1, 1, 1, 1, 1,
-0.8517556, 2.697422, 0.7379853, 1, 1, 1, 1, 1,
-0.8502063, 1.478497, -0.6821503, 1, 1, 1, 1, 1,
-0.8500255, -0.5468562, -4.14636, 1, 1, 1, 1, 1,
-0.8460019, 1.115433, -1.018119, 1, 1, 1, 1, 1,
-0.8441698, -0.4039146, -1.151748, 1, 1, 1, 1, 1,
-0.8352005, 0.120719, -1.143095, 1, 1, 1, 1, 1,
-0.8345104, -0.4647241, -2.790825, 1, 1, 1, 1, 1,
-0.8337584, 0.7976128, -0.3834059, 1, 1, 1, 1, 1,
-0.8313894, 1.705204, -1.138023, 1, 1, 1, 1, 1,
-0.8304979, -1.303444, -1.44954, 1, 1, 1, 1, 1,
-0.8278777, 0.2618315, 0.5978718, 1, 1, 1, 1, 1,
-0.8265405, -1.084797, -4.032484, 0, 0, 1, 1, 1,
-0.8219439, 1.924947, 0.8252565, 1, 0, 0, 1, 1,
-0.8211837, 0.5031099, -2.568956, 1, 0, 0, 1, 1,
-0.8175219, 0.3096439, -2.647994, 1, 0, 0, 1, 1,
-0.7943439, -0.172678, -0.8974587, 1, 0, 0, 1, 1,
-0.7836996, -0.3909879, -2.195994, 1, 0, 0, 1, 1,
-0.7819433, -1.001992, -2.860574, 0, 0, 0, 1, 1,
-0.7717733, 0.6920836, -0.2043699, 0, 0, 0, 1, 1,
-0.7639537, 0.06825113, -2.792265, 0, 0, 0, 1, 1,
-0.7626799, 1.062237, -0.3117463, 0, 0, 0, 1, 1,
-0.7606766, 1.902639, -1.578334, 0, 0, 0, 1, 1,
-0.7586797, 0.2556947, -2.815873, 0, 0, 0, 1, 1,
-0.7511234, 1.053006, -1.711873, 0, 0, 0, 1, 1,
-0.7443788, -0.04150446, -0.7896807, 1, 1, 1, 1, 1,
-0.7322117, -0.8293625, -3.246154, 1, 1, 1, 1, 1,
-0.7309107, 0.2194694, -1.418194, 1, 1, 1, 1, 1,
-0.7290562, -0.3196185, 0.3149044, 1, 1, 1, 1, 1,
-0.7287574, -2.187469, -3.253715, 1, 1, 1, 1, 1,
-0.7254471, 1.54033, -0.6660593, 1, 1, 1, 1, 1,
-0.7223268, 0.2809287, -3.438255, 1, 1, 1, 1, 1,
-0.7189649, 0.7237614, -0.09734362, 1, 1, 1, 1, 1,
-0.7096572, -0.3088777, -2.827389, 1, 1, 1, 1, 1,
-0.6899398, 0.09043289, -2.153674, 1, 1, 1, 1, 1,
-0.6895241, -0.6387768, -1.825528, 1, 1, 1, 1, 1,
-0.6760306, 0.6657236, 0.1833434, 1, 1, 1, 1, 1,
-0.6746852, -0.06008328, -2.945417, 1, 1, 1, 1, 1,
-0.6606202, -1.326415, -0.2686053, 1, 1, 1, 1, 1,
-0.6593953, 0.05221649, -2.632342, 1, 1, 1, 1, 1,
-0.6575804, 0.1777622, -2.210745, 0, 0, 1, 1, 1,
-0.6570712, 1.192525, -1.073457, 1, 0, 0, 1, 1,
-0.6532272, 1.409727, -0.8405839, 1, 0, 0, 1, 1,
-0.6521057, -1.553149, -1.32852, 1, 0, 0, 1, 1,
-0.6511884, 0.4424647, -1.046914, 1, 0, 0, 1, 1,
-0.6417371, -0.7946871, -4.876731, 1, 0, 0, 1, 1,
-0.6357381, 1.082826, -1.279617, 0, 0, 0, 1, 1,
-0.6347224, 2.211295, -0.2545417, 0, 0, 0, 1, 1,
-0.6345404, -2.135237, -3.669148, 0, 0, 0, 1, 1,
-0.6297833, 0.1708121, -0.2931168, 0, 0, 0, 1, 1,
-0.6279813, -0.8615785, -2.439802, 0, 0, 0, 1, 1,
-0.6225274, 0.2900097, -3.120918, 0, 0, 0, 1, 1,
-0.6220125, 1.318771, -0.7885451, 0, 0, 0, 1, 1,
-0.6172873, -2.03598, -3.132395, 1, 1, 1, 1, 1,
-0.6172336, 1.555845, -1.911176, 1, 1, 1, 1, 1,
-0.6151257, 1.073799, -0.5853403, 1, 1, 1, 1, 1,
-0.6122051, 0.9665835, -0.7820908, 1, 1, 1, 1, 1,
-0.6105317, -1.550223, -2.701878, 1, 1, 1, 1, 1,
-0.6092372, 1.485781, -0.6950911, 1, 1, 1, 1, 1,
-0.6052244, -0.615336, -2.539367, 1, 1, 1, 1, 1,
-0.6022595, 1.016479, -0.6435776, 1, 1, 1, 1, 1,
-0.601805, 0.247209, 0.1490322, 1, 1, 1, 1, 1,
-0.596386, 0.6195866, -1.879959, 1, 1, 1, 1, 1,
-0.593656, -0.2685571, -2.530995, 1, 1, 1, 1, 1,
-0.5934789, 3.066771, -1.793463, 1, 1, 1, 1, 1,
-0.5931358, 0.003312673, -3.346343, 1, 1, 1, 1, 1,
-0.5930857, 0.715344, -0.9313146, 1, 1, 1, 1, 1,
-0.5927814, 0.2685083, -0.8917182, 1, 1, 1, 1, 1,
-0.5878325, 0.1677678, -0.997816, 0, 0, 1, 1, 1,
-0.5849625, 0.6537078, -0.7191392, 1, 0, 0, 1, 1,
-0.5836305, -0.6042499, -2.832772, 1, 0, 0, 1, 1,
-0.5830291, 1.448297, 0.768645, 1, 0, 0, 1, 1,
-0.5812193, -1.387121, -3.636979, 1, 0, 0, 1, 1,
-0.5784208, -0.6133677, -2.801533, 1, 0, 0, 1, 1,
-0.5774909, -0.1723134, -2.523021, 0, 0, 0, 1, 1,
-0.5757031, 0.01466494, -0.7929067, 0, 0, 0, 1, 1,
-0.5740533, 1.331685, -1.715637, 0, 0, 0, 1, 1,
-0.5715014, 0.3439909, -1.613844, 0, 0, 0, 1, 1,
-0.5697885, -0.4272289, -1.483979, 0, 0, 0, 1, 1,
-0.5645055, 1.638293, -0.003809797, 0, 0, 0, 1, 1,
-0.5538045, 1.027702, -1.059666, 0, 0, 0, 1, 1,
-0.5532181, 1.515511, 0.4693944, 1, 1, 1, 1, 1,
-0.5476841, -0.6657013, -2.218732, 1, 1, 1, 1, 1,
-0.547272, -0.4053825, -2.07573, 1, 1, 1, 1, 1,
-0.5462201, -0.531505, -3.480307, 1, 1, 1, 1, 1,
-0.5417477, -0.93104, -2.262477, 1, 1, 1, 1, 1,
-0.5405803, -0.5147909, -3.209689, 1, 1, 1, 1, 1,
-0.5391179, -1.150852, -2.677284, 1, 1, 1, 1, 1,
-0.5322306, 1.615025, 0.9864812, 1, 1, 1, 1, 1,
-0.5316736, 0.4055535, -1.0463, 1, 1, 1, 1, 1,
-0.529593, -0.7606277, -0.7445403, 1, 1, 1, 1, 1,
-0.5258656, -1.292651, -2.046895, 1, 1, 1, 1, 1,
-0.5242554, -0.9803506, -3.448515, 1, 1, 1, 1, 1,
-0.5205362, 1.018578, 0.3178223, 1, 1, 1, 1, 1,
-0.5167193, -1.342617, -1.701636, 1, 1, 1, 1, 1,
-0.5125886, 1.221313, -0.4728741, 1, 1, 1, 1, 1,
-0.5101754, 1.201049, -0.6511214, 0, 0, 1, 1, 1,
-0.509442, -1.955231, -3.035907, 1, 0, 0, 1, 1,
-0.5094051, 0.5450561, -1.375826, 1, 0, 0, 1, 1,
-0.5081207, -1.522062, -2.353279, 1, 0, 0, 1, 1,
-0.4977408, 0.6816212, 0.4433563, 1, 0, 0, 1, 1,
-0.492622, -0.3682903, -2.388511, 1, 0, 0, 1, 1,
-0.4924107, -0.05559533, -2.022021, 0, 0, 0, 1, 1,
-0.4892336, -1.203885, -1.952464, 0, 0, 0, 1, 1,
-0.4865468, -0.2383034, -3.340829, 0, 0, 0, 1, 1,
-0.4863017, 0.05958072, -1.402339, 0, 0, 0, 1, 1,
-0.4853803, 0.004162486, -0.255677, 0, 0, 0, 1, 1,
-0.4829573, 1.370619, 0.05128083, 0, 0, 0, 1, 1,
-0.4779866, -0.9327049, -2.216104, 0, 0, 0, 1, 1,
-0.4749073, -0.8118789, -3.369985, 1, 1, 1, 1, 1,
-0.4747817, -0.3103943, -2.717486, 1, 1, 1, 1, 1,
-0.4708741, 1.110084, -1.462015, 1, 1, 1, 1, 1,
-0.4705328, 0.6050073, -1.737796, 1, 1, 1, 1, 1,
-0.4703174, -0.4053988, -1.018302, 1, 1, 1, 1, 1,
-0.4688062, 1.363725, 0.1783703, 1, 1, 1, 1, 1,
-0.4658512, -2.704098, -3.982108, 1, 1, 1, 1, 1,
-0.4624596, 0.451797, 0.1806705, 1, 1, 1, 1, 1,
-0.4524713, -0.1982539, -1.78157, 1, 1, 1, 1, 1,
-0.4477556, -0.2309862, -1.821159, 1, 1, 1, 1, 1,
-0.4459403, 1.200186, 0.3907122, 1, 1, 1, 1, 1,
-0.4417426, -0.03758179, -1.712895, 1, 1, 1, 1, 1,
-0.4382554, -0.7186202, -2.527679, 1, 1, 1, 1, 1,
-0.4349867, -0.3498889, -2.502674, 1, 1, 1, 1, 1,
-0.4315596, -1.100985, -1.558537, 1, 1, 1, 1, 1,
-0.4304712, 2.291457, -0.9298486, 0, 0, 1, 1, 1,
-0.4303861, -0.6762996, -2.249084, 1, 0, 0, 1, 1,
-0.4276059, -1.260781, -3.026124, 1, 0, 0, 1, 1,
-0.4260035, -0.444538, -5.170235, 1, 0, 0, 1, 1,
-0.4237316, 1.311484, -1.381765, 1, 0, 0, 1, 1,
-0.4196161, 0.4575898, -0.8815464, 1, 0, 0, 1, 1,
-0.4159655, 1.071696, 0.5885355, 0, 0, 0, 1, 1,
-0.4141073, -0.3008578, -1.201975, 0, 0, 0, 1, 1,
-0.4135126, 0.1983481, -1.080854, 0, 0, 0, 1, 1,
-0.4111064, -0.003798907, -1.762053, 0, 0, 0, 1, 1,
-0.4110541, -0.3794663, -2.054466, 0, 0, 0, 1, 1,
-0.4013529, 0.5518184, -0.332033, 0, 0, 0, 1, 1,
-0.3944974, 1.098636, -0.928955, 0, 0, 0, 1, 1,
-0.3944849, -3.662471, -1.934375, 1, 1, 1, 1, 1,
-0.3919788, -0.9854796, -2.160431, 1, 1, 1, 1, 1,
-0.391826, -1.221093, -1.799155, 1, 1, 1, 1, 1,
-0.3871304, -0.8028121, -3.56564, 1, 1, 1, 1, 1,
-0.3824632, -0.07734527, -3.967807, 1, 1, 1, 1, 1,
-0.3821555, -0.7310835, -3.653962, 1, 1, 1, 1, 1,
-0.3819574, 0.6528695, 1.319885, 1, 1, 1, 1, 1,
-0.3798619, 0.4804801, -1.132372, 1, 1, 1, 1, 1,
-0.3792952, -0.3354844, -4.238446, 1, 1, 1, 1, 1,
-0.3785864, 0.7657372, -0.6832677, 1, 1, 1, 1, 1,
-0.3741837, 0.3976257, -1.465733, 1, 1, 1, 1, 1,
-0.3726509, -0.8608652, -0.5494521, 1, 1, 1, 1, 1,
-0.3717648, -0.4152768, -1.26464, 1, 1, 1, 1, 1,
-0.3712334, -1.477198, -4.15938, 1, 1, 1, 1, 1,
-0.3709538, -1.975346, -2.326763, 1, 1, 1, 1, 1,
-0.3697901, 1.031393, 0.5414613, 0, 0, 1, 1, 1,
-0.3681117, 0.009258091, -1.037326, 1, 0, 0, 1, 1,
-0.3628707, -0.594348, -4.128683, 1, 0, 0, 1, 1,
-0.355747, 0.1225984, -0.783143, 1, 0, 0, 1, 1,
-0.3545419, 0.1534681, -0.7156265, 1, 0, 0, 1, 1,
-0.3497657, -0.6427986, -2.225957, 1, 0, 0, 1, 1,
-0.3492187, 1.174887, 0.6893163, 0, 0, 0, 1, 1,
-0.3486685, -0.9769062, -2.333056, 0, 0, 0, 1, 1,
-0.3482864, 1.36006, 1.007831, 0, 0, 0, 1, 1,
-0.348121, 1.041071, -0.933898, 0, 0, 0, 1, 1,
-0.3466585, -0.5413893, -1.183473, 0, 0, 0, 1, 1,
-0.3457618, -0.6210615, -1.992644, 0, 0, 0, 1, 1,
-0.3443764, 0.3988763, -0.007137723, 0, 0, 0, 1, 1,
-0.3433916, 0.7062277, 1.328676, 1, 1, 1, 1, 1,
-0.3423487, -0.6172749, -2.164332, 1, 1, 1, 1, 1,
-0.3392565, 1.600561, -0.4656115, 1, 1, 1, 1, 1,
-0.3391697, -0.9136809, -3.581909, 1, 1, 1, 1, 1,
-0.3350466, -1.180242, -2.795769, 1, 1, 1, 1, 1,
-0.3335727, -0.04560978, -2.420107, 1, 1, 1, 1, 1,
-0.3333297, 0.3134812, -0.9473602, 1, 1, 1, 1, 1,
-0.3319202, -0.02510716, -3.760429, 1, 1, 1, 1, 1,
-0.3303712, -0.610395, -0.4593648, 1, 1, 1, 1, 1,
-0.3274272, 1.87749, 0.505677, 1, 1, 1, 1, 1,
-0.3220759, 0.3007015, -0.2973, 1, 1, 1, 1, 1,
-0.3216054, -1.128054, -2.877742, 1, 1, 1, 1, 1,
-0.320961, -0.4077092, -2.577987, 1, 1, 1, 1, 1,
-0.3194672, 0.5011714, -1.485507, 1, 1, 1, 1, 1,
-0.3181492, 0.8790301, 0.5106523, 1, 1, 1, 1, 1,
-0.3142076, -0.3148085, -1.91733, 0, 0, 1, 1, 1,
-0.3136474, 1.5761, 0.3640472, 1, 0, 0, 1, 1,
-0.3121684, -2.203128, -5.194401, 1, 0, 0, 1, 1,
-0.3112048, 0.04586205, -3.409877, 1, 0, 0, 1, 1,
-0.3109817, 0.8172696, -0.8084733, 1, 0, 0, 1, 1,
-0.3093262, -0.7876719, -3.641663, 1, 0, 0, 1, 1,
-0.3067314, -0.2091444, -1.15158, 0, 0, 0, 1, 1,
-0.3064214, -1.008418, -2.683728, 0, 0, 0, 1, 1,
-0.3047436, -0.1988041, -0.9544611, 0, 0, 0, 1, 1,
-0.3018567, 0.7496431, -0.7209157, 0, 0, 0, 1, 1,
-0.3012094, 1.493341, -0.9879856, 0, 0, 0, 1, 1,
-0.300195, -2.592332, -2.337503, 0, 0, 0, 1, 1,
-0.297474, 0.3085892, -2.793345, 0, 0, 0, 1, 1,
-0.2962705, 0.9367791, -2.054438, 1, 1, 1, 1, 1,
-0.2918584, 1.847326, -1.413421, 1, 1, 1, 1, 1,
-0.2901308, 0.5038807, -1.03838, 1, 1, 1, 1, 1,
-0.288033, -0.5432316, -1.556922, 1, 1, 1, 1, 1,
-0.2876762, -1.287661, -0.9111627, 1, 1, 1, 1, 1,
-0.2872559, 1.170467, -0.6657956, 1, 1, 1, 1, 1,
-0.2851798, 1.736038, 0.0949579, 1, 1, 1, 1, 1,
-0.2825915, 0.5414318, 0.90749, 1, 1, 1, 1, 1,
-0.2819553, 0.7893257, 0.6398287, 1, 1, 1, 1, 1,
-0.2775195, 0.46696, -0.4245823, 1, 1, 1, 1, 1,
-0.2767089, -0.67593, -3.936189, 1, 1, 1, 1, 1,
-0.276483, 1.771214, 0.7309606, 1, 1, 1, 1, 1,
-0.2697403, 0.3258674, -0.8557664, 1, 1, 1, 1, 1,
-0.2673004, 0.9383995, -1.286197, 1, 1, 1, 1, 1,
-0.2643509, -1.056422, -3.633222, 1, 1, 1, 1, 1,
-0.2579792, -0.01914963, -1.561972, 0, 0, 1, 1, 1,
-0.2529883, 0.6914565, -0.5836152, 1, 0, 0, 1, 1,
-0.2528656, 2.033942, 0.3688437, 1, 0, 0, 1, 1,
-0.2518938, 0.4120547, -0.8462227, 1, 0, 0, 1, 1,
-0.248842, 0.236623, -0.3172373, 1, 0, 0, 1, 1,
-0.2455911, -0.04458461, -1.330834, 1, 0, 0, 1, 1,
-0.2438651, -2.158344, -1.900792, 0, 0, 0, 1, 1,
-0.2431476, 1.217138, 0.2370896, 0, 0, 0, 1, 1,
-0.2427234, 0.1563269, -0.7080819, 0, 0, 0, 1, 1,
-0.2407045, -0.441035, -0.3838323, 0, 0, 0, 1, 1,
-0.235767, -0.6937817, -4.869343, 0, 0, 0, 1, 1,
-0.2299372, 1.702039, 0.8337477, 0, 0, 0, 1, 1,
-0.228446, -0.09761364, -1.118182, 0, 0, 0, 1, 1,
-0.2276859, -0.4606448, -1.839718, 1, 1, 1, 1, 1,
-0.2255513, -0.07828578, -2.988121, 1, 1, 1, 1, 1,
-0.2249535, -0.7245239, -3.619928, 1, 1, 1, 1, 1,
-0.2216998, -1.245291, -3.369247, 1, 1, 1, 1, 1,
-0.2213147, -0.3606893, -3.089747, 1, 1, 1, 1, 1,
-0.2192322, -0.1573138, 0.5097526, 1, 1, 1, 1, 1,
-0.2094162, 0.4350319, -1.808178, 1, 1, 1, 1, 1,
-0.2065489, -0.01443036, -2.144819, 1, 1, 1, 1, 1,
-0.2044398, 1.12001, 0.8337349, 1, 1, 1, 1, 1,
-0.2032609, 0.4670044, -0.8563545, 1, 1, 1, 1, 1,
-0.2006149, 1.300588, -0.9322568, 1, 1, 1, 1, 1,
-0.2006059, -0.3474139, -2.064779, 1, 1, 1, 1, 1,
-0.198075, 2.312763, 1.577475, 1, 1, 1, 1, 1,
-0.1973236, -1.028589, -2.344575, 1, 1, 1, 1, 1,
-0.1959438, 1.036441, 0.6978011, 1, 1, 1, 1, 1,
-0.1951087, 1.146479, -1.186694, 0, 0, 1, 1, 1,
-0.1865521, -1.667786, -4.384423, 1, 0, 0, 1, 1,
-0.1798407, -0.4841945, -2.647654, 1, 0, 0, 1, 1,
-0.178603, -1.87578, -1.694185, 1, 0, 0, 1, 1,
-0.1781693, 0.8740034, -1.518352, 1, 0, 0, 1, 1,
-0.1777968, -1.089737, -2.036105, 1, 0, 0, 1, 1,
-0.1768525, -0.9082922, -3.061057, 0, 0, 0, 1, 1,
-0.1723999, -0.7565388, -3.314123, 0, 0, 0, 1, 1,
-0.1708542, -1.951146, -2.865601, 0, 0, 0, 1, 1,
-0.1694682, -0.2382616, -1.945221, 0, 0, 0, 1, 1,
-0.1687262, -1.023101, -3.372285, 0, 0, 0, 1, 1,
-0.1653197, 1.608542, -0.890372, 0, 0, 0, 1, 1,
-0.1582988, -0.3373571, -3.121475, 0, 0, 0, 1, 1,
-0.1571196, -1.093575, -2.137296, 1, 1, 1, 1, 1,
-0.1569257, -0.417108, -4.409044, 1, 1, 1, 1, 1,
-0.1543384, 1.08954, -0.4889214, 1, 1, 1, 1, 1,
-0.1531065, -1.303303, -2.299835, 1, 1, 1, 1, 1,
-0.1523719, -0.08721239, -2.648948, 1, 1, 1, 1, 1,
-0.1523512, 0.4613584, -0.5246893, 1, 1, 1, 1, 1,
-0.1507404, -1.831002, -4.604787, 1, 1, 1, 1, 1,
-0.1499523, -0.2233485, -3.18901, 1, 1, 1, 1, 1,
-0.142552, 0.5627009, 2.448325, 1, 1, 1, 1, 1,
-0.136498, 0.8478979, -0.7310532, 1, 1, 1, 1, 1,
-0.1360943, 0.2545065, 0.5962793, 1, 1, 1, 1, 1,
-0.1346935, 1.390201, 0.3212379, 1, 1, 1, 1, 1,
-0.1285221, -1.484147, -3.680408, 1, 1, 1, 1, 1,
-0.1276094, -1.727909, -2.293793, 1, 1, 1, 1, 1,
-0.1273149, 0.205731, -1.961002, 1, 1, 1, 1, 1,
-0.1271011, 0.4361534, 0.9756805, 0, 0, 1, 1, 1,
-0.1269364, 0.3447481, -1.692195, 1, 0, 0, 1, 1,
-0.1266395, -2.279266, -3.940686, 1, 0, 0, 1, 1,
-0.1170015, -0.797143, -3.817583, 1, 0, 0, 1, 1,
-0.1161361, -0.1254117, -3.331132, 1, 0, 0, 1, 1,
-0.1076458, 1.080155, 0.6950844, 1, 0, 0, 1, 1,
-0.105882, 0.9122154, -0.3994366, 0, 0, 0, 1, 1,
-0.09906649, 1.160439, -1.174486, 0, 0, 0, 1, 1,
-0.0933804, -0.2061651, -0.9998282, 0, 0, 0, 1, 1,
-0.09276092, 0.856916, 0.3593666, 0, 0, 0, 1, 1,
-0.09178351, 0.8410689, -1.274382, 0, 0, 0, 1, 1,
-0.08885214, 1.056051, -0.8601187, 0, 0, 0, 1, 1,
-0.08463326, 1.317779, 0.009750114, 0, 0, 0, 1, 1,
-0.08242551, 0.8926931, 0.7893194, 1, 1, 1, 1, 1,
-0.08060501, 0.7555987, -1.88611, 1, 1, 1, 1, 1,
-0.08033244, 2.320989, 0.6030509, 1, 1, 1, 1, 1,
-0.07576472, -1.370439, -5.28719, 1, 1, 1, 1, 1,
-0.07442133, 1.645132, -0.0948116, 1, 1, 1, 1, 1,
-0.06748425, -0.7798226, -3.184527, 1, 1, 1, 1, 1,
-0.06653787, 0.6701066, 0.7810784, 1, 1, 1, 1, 1,
-0.06543904, 1.128058, -0.264459, 1, 1, 1, 1, 1,
-0.06416486, -0.2617222, -3.022793, 1, 1, 1, 1, 1,
-0.06021686, -0.718195, -2.050785, 1, 1, 1, 1, 1,
-0.05272643, 0.918044, 0.3955868, 1, 1, 1, 1, 1,
-0.05207857, -0.4629662, -4.541503, 1, 1, 1, 1, 1,
-0.0496796, -0.7543976, -3.566898, 1, 1, 1, 1, 1,
-0.04800693, -1.042674, -2.739064, 1, 1, 1, 1, 1,
-0.04768376, 0.8637003, -1.288531, 1, 1, 1, 1, 1,
-0.04612377, 0.5581688, -1.148148, 0, 0, 1, 1, 1,
-0.04324308, 1.082006, 0.3802183, 1, 0, 0, 1, 1,
-0.04281532, -0.6065246, -2.919431, 1, 0, 0, 1, 1,
-0.04242314, 0.01538649, -3.181934, 1, 0, 0, 1, 1,
-0.03987595, -1.065795, -3.710735, 1, 0, 0, 1, 1,
-0.03661861, -0.8382401, -2.577971, 1, 0, 0, 1, 1,
-0.03651395, 0.1290451, 0.1505023, 0, 0, 0, 1, 1,
-0.03309042, -0.3199303, -4.604247, 0, 0, 0, 1, 1,
-0.02703478, 0.3735005, -2.560783, 0, 0, 0, 1, 1,
-0.02693979, 0.02810609, 0.1321536, 0, 0, 0, 1, 1,
-0.02386255, -1.412451, -3.666917, 0, 0, 0, 1, 1,
-0.02259729, -0.3741029, -1.936835, 0, 0, 0, 1, 1,
-0.01936591, 0.3127875, 0.810476, 0, 0, 0, 1, 1,
-0.0190809, 0.285211, -1.456097, 1, 1, 1, 1, 1,
-0.009378362, -1.170787, -2.550818, 1, 1, 1, 1, 1,
-0.003688671, -2.476399, -3.724567, 1, 1, 1, 1, 1,
0.003416574, 0.147104, 0.649438, 1, 1, 1, 1, 1,
0.004503022, -2.396199, 4.149743, 1, 1, 1, 1, 1,
0.01211705, 1.105112, 1.300528, 1, 1, 1, 1, 1,
0.01240737, -1.050104, 2.022343, 1, 1, 1, 1, 1,
0.01428643, 0.7180983, 1.688112, 1, 1, 1, 1, 1,
0.01966203, 0.9339713, 0.02625639, 1, 1, 1, 1, 1,
0.02267342, -1.283237, 3.676048, 1, 1, 1, 1, 1,
0.0226799, -0.5559675, 3.055451, 1, 1, 1, 1, 1,
0.02456096, 0.03651861, -0.6547773, 1, 1, 1, 1, 1,
0.02486685, 0.5794421, -0.1659592, 1, 1, 1, 1, 1,
0.02909373, 0.1160451, 1.207835, 1, 1, 1, 1, 1,
0.03040323, -0.8297051, 2.86736, 1, 1, 1, 1, 1,
0.03078879, -2.117744, 3.431194, 0, 0, 1, 1, 1,
0.03421274, 0.6699792, -0.1573472, 1, 0, 0, 1, 1,
0.0350979, 0.7410663, -0.737553, 1, 0, 0, 1, 1,
0.0354932, 0.4927747, -0.09048295, 1, 0, 0, 1, 1,
0.0363442, 1.784397, -1.069471, 1, 0, 0, 1, 1,
0.04027144, -1.216206, 3.111987, 1, 0, 0, 1, 1,
0.04049286, -0.3352028, 2.153506, 0, 0, 0, 1, 1,
0.04133939, 0.9057275, 0.514973, 0, 0, 0, 1, 1,
0.04248345, 1.000284, 1.293787, 0, 0, 0, 1, 1,
0.04348123, 0.3369795, -0.06787532, 0, 0, 0, 1, 1,
0.04478531, -0.03573561, 2.345035, 0, 0, 0, 1, 1,
0.05314383, 1.466903, 0.9634486, 0, 0, 0, 1, 1,
0.05427397, 0.4888852, -1.260396, 0, 0, 0, 1, 1,
0.05664006, 0.07398889, 2.03594, 1, 1, 1, 1, 1,
0.05775519, 0.4437443, -0.1471489, 1, 1, 1, 1, 1,
0.05789927, -0.5617815, 3.083339, 1, 1, 1, 1, 1,
0.06222269, 0.5104594, -0.2877844, 1, 1, 1, 1, 1,
0.06749149, 1.235181, 1.773255, 1, 1, 1, 1, 1,
0.07564051, -1.334355, 4.49696, 1, 1, 1, 1, 1,
0.07757489, 0.2825013, -0.8121709, 1, 1, 1, 1, 1,
0.07929441, -1.370757, 3.888235, 1, 1, 1, 1, 1,
0.08151074, 0.8814527, -0.7809927, 1, 1, 1, 1, 1,
0.08274373, -0.6390458, 1.740303, 1, 1, 1, 1, 1,
0.08402663, 0.7040687, 1.814557, 1, 1, 1, 1, 1,
0.08771861, 0.6472716, -1.338298, 1, 1, 1, 1, 1,
0.08809746, -0.5820053, 3.314205, 1, 1, 1, 1, 1,
0.09156986, -1.343076, 2.907058, 1, 1, 1, 1, 1,
0.09286037, 0.2888517, 1.881938, 1, 1, 1, 1, 1,
0.09308016, 0.239875, 0.9424281, 0, 0, 1, 1, 1,
0.09333234, -0.6516063, 2.615098, 1, 0, 0, 1, 1,
0.09451343, -0.2408589, 2.760707, 1, 0, 0, 1, 1,
0.09943952, -0.9018999, 3.357115, 1, 0, 0, 1, 1,
0.1023507, 1.753055, 2.542068, 1, 0, 0, 1, 1,
0.1026029, -1.071557, 2.08439, 1, 0, 0, 1, 1,
0.1039654, 0.3462156, 0.06200178, 0, 0, 0, 1, 1,
0.1075331, -0.5988039, 2.470948, 0, 0, 0, 1, 1,
0.1089923, -0.1755757, 2.728687, 0, 0, 0, 1, 1,
0.1112355, 0.5377731, -1.041779, 0, 0, 0, 1, 1,
0.1118593, 0.1989321, 0.1797124, 0, 0, 0, 1, 1,
0.1150536, -0.5115265, 3.358611, 0, 0, 0, 1, 1,
0.1157592, 0.05688006, 0.3673455, 0, 0, 0, 1, 1,
0.1165387, 2.18522, 0.5580809, 1, 1, 1, 1, 1,
0.1178032, 0.2261464, 1.428554, 1, 1, 1, 1, 1,
0.1255347, -0.1703061, 3.608924, 1, 1, 1, 1, 1,
0.1340478, -0.9664946, 2.698299, 1, 1, 1, 1, 1,
0.1351148, -0.3080402, 2.122786, 1, 1, 1, 1, 1,
0.1390904, 0.3271571, 0.5348309, 1, 1, 1, 1, 1,
0.1416861, 0.4911237, 1.334029, 1, 1, 1, 1, 1,
0.1428562, -0.02336936, 1.413049, 1, 1, 1, 1, 1,
0.1456049, -0.00312907, 1.699296, 1, 1, 1, 1, 1,
0.152384, -0.8054815, 5.144644, 1, 1, 1, 1, 1,
0.1529773, 0.9708074, 0.4717171, 1, 1, 1, 1, 1,
0.154776, -2.642484, 3.24786, 1, 1, 1, 1, 1,
0.1556499, -0.07113979, 2.170125, 1, 1, 1, 1, 1,
0.1559298, -0.8066289, 3.306688, 1, 1, 1, 1, 1,
0.1561978, 0.3429944, -1.639794, 1, 1, 1, 1, 1,
0.1592476, 0.4443898, -1.776335, 0, 0, 1, 1, 1,
0.1597866, -0.1618478, 3.215742, 1, 0, 0, 1, 1,
0.1613668, -0.3820326, 1.917794, 1, 0, 0, 1, 1,
0.1628414, -0.5260525, 2.297225, 1, 0, 0, 1, 1,
0.1640432, -0.4580363, 1.611764, 1, 0, 0, 1, 1,
0.1642257, -0.4549226, 0.8313921, 1, 0, 0, 1, 1,
0.1649553, -0.4055588, 3.255111, 0, 0, 0, 1, 1,
0.1665241, 1.074014, -0.4491401, 0, 0, 0, 1, 1,
0.1675217, 0.5991339, -0.6851521, 0, 0, 0, 1, 1,
0.1691527, -0.8342938, 2.452095, 0, 0, 0, 1, 1,
0.1692921, 0.2287526, 1.852099, 0, 0, 0, 1, 1,
0.1726672, -0.7465842, 4.214308, 0, 0, 0, 1, 1,
0.1745914, -0.1230221, 3.819878, 0, 0, 0, 1, 1,
0.1774773, -0.7357711, 3.963632, 1, 1, 1, 1, 1,
0.178666, 0.9186117, 0.3345509, 1, 1, 1, 1, 1,
0.1851667, 0.2596015, 1.465375, 1, 1, 1, 1, 1,
0.1928986, -0.3008853, 3.025499, 1, 1, 1, 1, 1,
0.1936912, 2.159943, 0.2041389, 1, 1, 1, 1, 1,
0.1964585, -0.7715512, 2.453215, 1, 1, 1, 1, 1,
0.1970628, -1.548233, 5.040471, 1, 1, 1, 1, 1,
0.2021658, 1.681556, 0.004205861, 1, 1, 1, 1, 1,
0.2055067, 1.064404, -0.6452262, 1, 1, 1, 1, 1,
0.2096741, -0.05307758, 2.109408, 1, 1, 1, 1, 1,
0.2113093, -2.076646, 3.104268, 1, 1, 1, 1, 1,
0.2113269, -0.1917617, 1.423698, 1, 1, 1, 1, 1,
0.2147288, -0.2435644, 1.425218, 1, 1, 1, 1, 1,
0.2298955, 0.873509, -1.12326, 1, 1, 1, 1, 1,
0.2317001, 1.39936, 1.174647, 1, 1, 1, 1, 1,
0.2320094, -0.7907246, 4.028334, 0, 0, 1, 1, 1,
0.2357141, -0.624328, 4.527673, 1, 0, 0, 1, 1,
0.2395828, -0.1614088, 1.810098, 1, 0, 0, 1, 1,
0.2400692, -0.2864273, 3.140705, 1, 0, 0, 1, 1,
0.2406618, 1.720465, 1.978394, 1, 0, 0, 1, 1,
0.242325, -1.137367, 2.135783, 1, 0, 0, 1, 1,
0.2525357, -0.3670176, 1.097718, 0, 0, 0, 1, 1,
0.2573937, -0.0290199, 1.877449, 0, 0, 0, 1, 1,
0.2596084, 0.1452488, 2.299599, 0, 0, 0, 1, 1,
0.2605292, -1.880611, 3.420218, 0, 0, 0, 1, 1,
0.2619829, -0.6441726, 1.914988, 0, 0, 0, 1, 1,
0.2634267, 1.194457, 1.44841, 0, 0, 0, 1, 1,
0.2649051, 0.9408225, -1.665067, 0, 0, 0, 1, 1,
0.2660652, -1.458892, 3.990547, 1, 1, 1, 1, 1,
0.2692502, -0.612891, 2.639649, 1, 1, 1, 1, 1,
0.2709902, -0.538295, 3.432144, 1, 1, 1, 1, 1,
0.2736811, 1.452919, 0.6420619, 1, 1, 1, 1, 1,
0.2771685, -1.629949, 3.437338, 1, 1, 1, 1, 1,
0.2808499, 2.007693, 0.7782317, 1, 1, 1, 1, 1,
0.2818356, -0.102824, 2.113996, 1, 1, 1, 1, 1,
0.2819911, -1.101256, 4.499302, 1, 1, 1, 1, 1,
0.2830623, 1.302435, -1.115269, 1, 1, 1, 1, 1,
0.285057, 0.5186718, 0.3313106, 1, 1, 1, 1, 1,
0.2884639, 0.8117012, -1.292474, 1, 1, 1, 1, 1,
0.3020172, -0.4747067, 2.043629, 1, 1, 1, 1, 1,
0.3058077, -0.29314, 2.043367, 1, 1, 1, 1, 1,
0.3104349, 0.4010629, -0.3813486, 1, 1, 1, 1, 1,
0.3146765, -1.202889, 3.090478, 1, 1, 1, 1, 1,
0.3151217, -0.04287397, 2.403018, 0, 0, 1, 1, 1,
0.3173791, -0.06697937, 2.152053, 1, 0, 0, 1, 1,
0.3203474, 1.620325, -0.8183118, 1, 0, 0, 1, 1,
0.3226588, -0.3787906, 0.9518683, 1, 0, 0, 1, 1,
0.326948, 0.2197023, -0.7083761, 1, 0, 0, 1, 1,
0.3309679, 0.8781561, 0.6745611, 1, 0, 0, 1, 1,
0.3328528, -1.277712, 2.941914, 0, 0, 0, 1, 1,
0.3333265, -0.1103211, 1.846391, 0, 0, 0, 1, 1,
0.3359663, 0.5185093, 0.6713306, 0, 0, 0, 1, 1,
0.3407315, 0.4145104, 0.2671828, 0, 0, 0, 1, 1,
0.3422026, -0.6486928, 2.801949, 0, 0, 0, 1, 1,
0.3422419, 0.9265499, -1.330125, 0, 0, 0, 1, 1,
0.3446625, 0.03095677, 1.731635, 0, 0, 0, 1, 1,
0.3494363, -1.033068, 4.989613, 1, 1, 1, 1, 1,
0.349757, -0.1702095, 3.342072, 1, 1, 1, 1, 1,
0.3498028, -0.3553831, 3.958266, 1, 1, 1, 1, 1,
0.3518386, 0.959594, -0.05593104, 1, 1, 1, 1, 1,
0.3528675, 0.7113882, -0.5303778, 1, 1, 1, 1, 1,
0.354437, 0.2725403, 0.06868637, 1, 1, 1, 1, 1,
0.3561043, -0.8869948, 1.809296, 1, 1, 1, 1, 1,
0.3618244, -1.087093, 2.726734, 1, 1, 1, 1, 1,
0.36208, -0.7631202, 2.28431, 1, 1, 1, 1, 1,
0.3628777, -1.438551, 1.698005, 1, 1, 1, 1, 1,
0.365972, 1.94718, -0.270496, 1, 1, 1, 1, 1,
0.3670278, -0.05248501, 2.183554, 1, 1, 1, 1, 1,
0.3696479, -1.373873, 2.511255, 1, 1, 1, 1, 1,
0.3701965, -0.5426571, 3.032395, 1, 1, 1, 1, 1,
0.3709401, 0.2332141, 2.228357, 1, 1, 1, 1, 1,
0.3709913, 1.61229, -0.3972784, 0, 0, 1, 1, 1,
0.3786084, 0.1936023, 2.554232, 1, 0, 0, 1, 1,
0.3818749, -0.04062214, 2.041425, 1, 0, 0, 1, 1,
0.3853619, 2.590093, 1.012707, 1, 0, 0, 1, 1,
0.3865106, -2.359415, 2.703465, 1, 0, 0, 1, 1,
0.3909395, 0.1218269, -0.4311909, 1, 0, 0, 1, 1,
0.3949679, -1.464194, 4.301049, 0, 0, 0, 1, 1,
0.3970741, -0.2693157, 3.35882, 0, 0, 0, 1, 1,
0.3999911, 2.273727, 1.977751, 0, 0, 0, 1, 1,
0.4021569, 0.8395159, -0.3914703, 0, 0, 0, 1, 1,
0.4100922, 1.057869, -0.5807437, 0, 0, 0, 1, 1,
0.4107115, -1.990202, 4.710164, 0, 0, 0, 1, 1,
0.4152054, -1.508836, 3.037668, 0, 0, 0, 1, 1,
0.4241459, 0.4115586, 0.7029018, 1, 1, 1, 1, 1,
0.4242453, 0.4318002, 0.5209896, 1, 1, 1, 1, 1,
0.4249609, -0.3948825, 2.968292, 1, 1, 1, 1, 1,
0.428914, -0.4100527, 2.213374, 1, 1, 1, 1, 1,
0.4289868, -0.8545924, 2.207706, 1, 1, 1, 1, 1,
0.4308906, 0.9451894, -1.503004, 1, 1, 1, 1, 1,
0.4334717, -0.6029813, 3.254922, 1, 1, 1, 1, 1,
0.4347196, -1.112233, 2.893211, 1, 1, 1, 1, 1,
0.4397446, -0.3280197, 1.567102, 1, 1, 1, 1, 1,
0.4502347, -1.216464, 0.5671349, 1, 1, 1, 1, 1,
0.450605, 0.7061167, 2.209745, 1, 1, 1, 1, 1,
0.4516523, -1.804325, 2.220306, 1, 1, 1, 1, 1,
0.451754, 0.6978956, 1.555882, 1, 1, 1, 1, 1,
0.4521341, -0.2962083, 2.059074, 1, 1, 1, 1, 1,
0.4559988, 0.4782962, 1.088888, 1, 1, 1, 1, 1,
0.4574395, -0.8501529, 2.976383, 0, 0, 1, 1, 1,
0.4580598, 0.03449817, -0.405616, 1, 0, 0, 1, 1,
0.4620588, -1.818316, 1.814596, 1, 0, 0, 1, 1,
0.4647948, 0.8793105, -0.4093554, 1, 0, 0, 1, 1,
0.4650923, -0.2070582, 1.978709, 1, 0, 0, 1, 1,
0.4729711, 0.5756539, 1.092135, 1, 0, 0, 1, 1,
0.4773632, 0.3798943, 1.335343, 0, 0, 0, 1, 1,
0.4817654, -0.2670333, 2.027344, 0, 0, 0, 1, 1,
0.487975, 0.5989236, 1.742073, 0, 0, 0, 1, 1,
0.494411, -0.7242073, 1.249766, 0, 0, 0, 1, 1,
0.4944953, -0.3949657, 2.993705, 0, 0, 0, 1, 1,
0.4960007, 0.532366, 0.8573438, 0, 0, 0, 1, 1,
0.5018421, 0.517422, 1.876382, 0, 0, 0, 1, 1,
0.5023131, -1.021849, 4.51628, 1, 1, 1, 1, 1,
0.5053211, -0.9292129, 1.968953, 1, 1, 1, 1, 1,
0.5088179, 0.5969064, 2.257467, 1, 1, 1, 1, 1,
0.5104707, -1.048201, 2.583412, 1, 1, 1, 1, 1,
0.5115998, 1.812774, 0.2340236, 1, 1, 1, 1, 1,
0.5130296, -0.3027646, 2.12279, 1, 1, 1, 1, 1,
0.5176747, 1.340976, 0.9660981, 1, 1, 1, 1, 1,
0.5183302, 0.5761844, -0.2961535, 1, 1, 1, 1, 1,
0.5185736, -1.271981, 1.879308, 1, 1, 1, 1, 1,
0.5251431, -0.06210922, 1.716405, 1, 1, 1, 1, 1,
0.529479, 0.8511336, 1.42622, 1, 1, 1, 1, 1,
0.5324047, 1.303665, 0.8354284, 1, 1, 1, 1, 1,
0.5450498, 0.7886615, -0.1810681, 1, 1, 1, 1, 1,
0.5453799, 0.2297422, 0.2626004, 1, 1, 1, 1, 1,
0.5453886, -2.074408, 2.661266, 1, 1, 1, 1, 1,
0.5463144, 1.270153, 0.8207241, 0, 0, 1, 1, 1,
0.5468922, 0.03947828, 2.246538, 1, 0, 0, 1, 1,
0.5483168, -0.06839458, 0.1542946, 1, 0, 0, 1, 1,
0.5607069, 0.3314599, 1.42621, 1, 0, 0, 1, 1,
0.5702034, 0.08097895, 2.325175, 1, 0, 0, 1, 1,
0.5706044, 0.7801257, 0.4463544, 1, 0, 0, 1, 1,
0.5735254, -0.3022431, 2.035645, 0, 0, 0, 1, 1,
0.5795976, -0.5986049, 0.3930483, 0, 0, 0, 1, 1,
0.5798952, 1.117306, 1.775318, 0, 0, 0, 1, 1,
0.5838384, -0.2627177, 4.020111, 0, 0, 0, 1, 1,
0.5852952, 1.02189, 1.938222, 0, 0, 0, 1, 1,
0.5863204, 2.760818, 3.045141, 0, 0, 0, 1, 1,
0.5863905, 0.1968898, 0.9608223, 0, 0, 0, 1, 1,
0.5916837, -1.247636, 2.153454, 1, 1, 1, 1, 1,
0.5923218, -0.1702384, 2.292381, 1, 1, 1, 1, 1,
0.5933111, -0.6337435, 1.077542, 1, 1, 1, 1, 1,
0.5939713, -0.09626625, 0.3571249, 1, 1, 1, 1, 1,
0.5951073, -1.756887, 2.190759, 1, 1, 1, 1, 1,
0.5981098, 2.11833, -1.210404, 1, 1, 1, 1, 1,
0.6010357, -0.1544519, 1.837091, 1, 1, 1, 1, 1,
0.6013352, -0.8683774, 3.006549, 1, 1, 1, 1, 1,
0.6081734, -0.6629667, 2.308294, 1, 1, 1, 1, 1,
0.6168595, 1.298595, -0.1155684, 1, 1, 1, 1, 1,
0.6170349, -0.6440199, 3.160547, 1, 1, 1, 1, 1,
0.6174027, -0.6907287, 1.879722, 1, 1, 1, 1, 1,
0.6191964, 1.663123, 0.01790007, 1, 1, 1, 1, 1,
0.6229675, -0.7002489, 0.8711298, 1, 1, 1, 1, 1,
0.6245547, -0.7759008, 3.151377, 1, 1, 1, 1, 1,
0.6257934, 0.5623732, 0.7964626, 0, 0, 1, 1, 1,
0.6262679, 0.6437861, 1.19864, 1, 0, 0, 1, 1,
0.6263885, 0.2006702, 1.014867, 1, 0, 0, 1, 1,
0.6283392, -1.173729, 2.571332, 1, 0, 0, 1, 1,
0.6344492, 0.4459075, 1.535558, 1, 0, 0, 1, 1,
0.6378862, 0.4855021, -0.4917695, 1, 0, 0, 1, 1,
0.6390476, -0.2156726, 1.419691, 0, 0, 0, 1, 1,
0.6402462, -0.2327377, 4.659863, 0, 0, 0, 1, 1,
0.6413938, 0.6735462, 1.270637, 0, 0, 0, 1, 1,
0.6419228, 1.062959, -0.3364796, 0, 0, 0, 1, 1,
0.6433086, -0.1621084, 2.334155, 0, 0, 0, 1, 1,
0.6453729, 1.114296, 0.6139024, 0, 0, 0, 1, 1,
0.6493799, 0.3313772, 0.9856601, 0, 0, 0, 1, 1,
0.6526321, 0.06421214, 1.504016, 1, 1, 1, 1, 1,
0.6534461, -0.04079582, 2.273238, 1, 1, 1, 1, 1,
0.6571915, -1.414529, 2.366312, 1, 1, 1, 1, 1,
0.6664611, -0.2368566, 2.826929, 1, 1, 1, 1, 1,
0.6668962, -0.709228, 2.389035, 1, 1, 1, 1, 1,
0.6672454, -1.311123, 3.340093, 1, 1, 1, 1, 1,
0.6680226, 0.05879486, -0.01706894, 1, 1, 1, 1, 1,
0.6733324, -0.6086704, 4.321155, 1, 1, 1, 1, 1,
0.676992, 0.760344, 0.3310429, 1, 1, 1, 1, 1,
0.6809013, -1.631999, 1.717245, 1, 1, 1, 1, 1,
0.6846199, 2.350111, -0.7531292, 1, 1, 1, 1, 1,
0.6868934, 0.08452531, 0.2189798, 1, 1, 1, 1, 1,
0.6903874, -0.02575576, 0.6920387, 1, 1, 1, 1, 1,
0.6930116, 0.06871609, 1.516754, 1, 1, 1, 1, 1,
0.6940928, 1.246708, 0.5337011, 1, 1, 1, 1, 1,
0.6961842, -1.151856, 2.157998, 0, 0, 1, 1, 1,
0.696568, -1.332331, 2.930959, 1, 0, 0, 1, 1,
0.6992398, 1.159808, -0.8049511, 1, 0, 0, 1, 1,
0.7048872, 0.232018, 1.89637, 1, 0, 0, 1, 1,
0.7075619, -0.5650878, 3.331043, 1, 0, 0, 1, 1,
0.7143423, 1.144249, 2.462258, 1, 0, 0, 1, 1,
0.7153302, -1.919458, 1.417847, 0, 0, 0, 1, 1,
0.7166051, -1.536065, 2.658132, 0, 0, 0, 1, 1,
0.7276282, -0.9670753, 1.806846, 0, 0, 0, 1, 1,
0.7280436, 0.4180541, 2.92199, 0, 0, 0, 1, 1,
0.7298204, -1.970783, 1.700645, 0, 0, 0, 1, 1,
0.7310064, 1.629611, 0.9093524, 0, 0, 0, 1, 1,
0.7320028, -0.5362594, -0.1764615, 0, 0, 0, 1, 1,
0.7345757, 0.171121, 0.7840668, 1, 1, 1, 1, 1,
0.7402102, -1.673848, 2.807194, 1, 1, 1, 1, 1,
0.7463773, 0.3574294, -0.1427483, 1, 1, 1, 1, 1,
0.7526776, 1.375953, 1.500539, 1, 1, 1, 1, 1,
0.7543781, 0.08915509, 2.208699, 1, 1, 1, 1, 1,
0.7546867, -0.3090919, 2.838963, 1, 1, 1, 1, 1,
0.7555249, -1.020026, 3.370842, 1, 1, 1, 1, 1,
0.7560191, -0.07466508, 3.041199, 1, 1, 1, 1, 1,
0.7563373, 0.7260287, 0.1169705, 1, 1, 1, 1, 1,
0.758848, -1.013183, 1.002583, 1, 1, 1, 1, 1,
0.7732295, 0.1479666, 0.5813169, 1, 1, 1, 1, 1,
0.7748718, -0.203602, 2.64448, 1, 1, 1, 1, 1,
0.7750568, -0.5619341, 3.105866, 1, 1, 1, 1, 1,
0.7754291, -0.8067954, 2.085631, 1, 1, 1, 1, 1,
0.7771254, 0.9209901, 1.210212, 1, 1, 1, 1, 1,
0.7794561, 0.2279441, 1.769591, 0, 0, 1, 1, 1,
0.7828444, 0.7688667, -0.1648995, 1, 0, 0, 1, 1,
0.7836034, 0.224572, 0.08515793, 1, 0, 0, 1, 1,
0.7897817, 0.5413984, -0.468523, 1, 0, 0, 1, 1,
0.7970501, 0.6952562, 1.508924, 1, 0, 0, 1, 1,
0.7999798, 2.294166, -0.8540121, 1, 0, 0, 1, 1,
0.8013402, 0.3744218, 0.4449107, 0, 0, 0, 1, 1,
0.8019648, -1.390349, 3.169781, 0, 0, 0, 1, 1,
0.8042715, -0.02385991, 2.359024, 0, 0, 0, 1, 1,
0.8045495, 0.4526449, 0.5410799, 0, 0, 0, 1, 1,
0.805985, 0.5299285, 1.565807, 0, 0, 0, 1, 1,
0.8199698, 0.4020205, 3.265815, 0, 0, 0, 1, 1,
0.8261202, 0.4533399, 0.5866315, 0, 0, 0, 1, 1,
0.8306015, 0.7710732, -0.2371848, 1, 1, 1, 1, 1,
0.8363898, -0.5226888, 2.216286, 1, 1, 1, 1, 1,
0.8515996, 0.6700877, 0.5017047, 1, 1, 1, 1, 1,
0.8525762, 0.650995, 2.844897, 1, 1, 1, 1, 1,
0.8526969, -0.6500399, 3.00965, 1, 1, 1, 1, 1,
0.8554388, -2.141147, 3.777843, 1, 1, 1, 1, 1,
0.8570957, -0.5607111, 1.222514, 1, 1, 1, 1, 1,
0.8576426, -0.8618165, 3.877544, 1, 1, 1, 1, 1,
0.858187, 0.7431109, -0.7305185, 1, 1, 1, 1, 1,
0.8599873, -1.265915, 3.728439, 1, 1, 1, 1, 1,
0.8630493, 0.6957748, 1.082021, 1, 1, 1, 1, 1,
0.8643972, 1.080309, -0.2810218, 1, 1, 1, 1, 1,
0.8657598, 0.976912, 0.4857201, 1, 1, 1, 1, 1,
0.8678018, 1.406151, -1.489015, 1, 1, 1, 1, 1,
0.868732, 0.05096322, 2.971828, 1, 1, 1, 1, 1,
0.8689538, 0.3193715, 0.2566404, 0, 0, 1, 1, 1,
0.8794531, -1.749182, 2.742105, 1, 0, 0, 1, 1,
0.8825526, -0.6090155, 3.657601, 1, 0, 0, 1, 1,
0.882835, 0.007747209, 0.6101532, 1, 0, 0, 1, 1,
0.885866, 1.878888, 1.362432, 1, 0, 0, 1, 1,
0.8958003, -0.264755, 1.196901, 1, 0, 0, 1, 1,
0.9089715, 0.0805919, 1.727592, 0, 0, 0, 1, 1,
0.9120513, -1.181899, 2.555257, 0, 0, 0, 1, 1,
0.9121311, -1.231053, 2.46489, 0, 0, 0, 1, 1,
0.9124219, 0.05364959, 1.816381, 0, 0, 0, 1, 1,
0.9126129, -1.405503, 2.350444, 0, 0, 0, 1, 1,
0.9135295, -1.542241, 3.226685, 0, 0, 0, 1, 1,
0.919539, -1.19247, 1.710685, 0, 0, 0, 1, 1,
0.9257415, -0.101739, 0.4036424, 1, 1, 1, 1, 1,
0.927177, -0.131989, 3.007432, 1, 1, 1, 1, 1,
0.9308754, -0.4429815, 2.663763, 1, 1, 1, 1, 1,
0.932996, 0.9023437, -0.6643291, 1, 1, 1, 1, 1,
0.9348658, 0.1148037, 0.5258275, 1, 1, 1, 1, 1,
0.9350324, 0.4256547, 0.7462292, 1, 1, 1, 1, 1,
0.9382541, 0.4295126, 0.3399146, 1, 1, 1, 1, 1,
0.9384096, 0.09966354, 1.02113, 1, 1, 1, 1, 1,
0.9395745, -0.945291, 2.192547, 1, 1, 1, 1, 1,
0.9446524, -0.8045212, 2.895476, 1, 1, 1, 1, 1,
0.9494923, 0.2505697, 1.034306, 1, 1, 1, 1, 1,
0.9497864, -0.2727098, 2.425599, 1, 1, 1, 1, 1,
0.9519209, -0.9511689, 1.953392, 1, 1, 1, 1, 1,
0.9522665, -1.029084, 0.6011284, 1, 1, 1, 1, 1,
0.9567946, 0.2496941, 2.205668, 1, 1, 1, 1, 1,
0.9573976, -0.1275967, 3.230386, 0, 0, 1, 1, 1,
0.9679208, 1.013679, -1.202945, 1, 0, 0, 1, 1,
0.9691733, 0.5863628, 0.4428351, 1, 0, 0, 1, 1,
0.9721507, 1.484503, 0.3167276, 1, 0, 0, 1, 1,
0.9752063, -0.6919643, 3.221757, 1, 0, 0, 1, 1,
0.9752733, -0.5421746, 3.030643, 1, 0, 0, 1, 1,
0.9800276, 0.7907651, -1.04677, 0, 0, 0, 1, 1,
0.9804243, 0.4061314, 0.6519367, 0, 0, 0, 1, 1,
0.9896923, 0.1173402, 2.901735, 0, 0, 0, 1, 1,
0.9963561, -2.060798, 2.539463, 0, 0, 0, 1, 1,
1.003663, -0.3813089, 3.592507, 0, 0, 0, 1, 1,
1.011346, -0.4711691, 3.470801, 0, 0, 0, 1, 1,
1.01259, -2.512778, 1.736989, 0, 0, 0, 1, 1,
1.020338, -1.861079, 2.68605, 1, 1, 1, 1, 1,
1.021798, -0.347095, 0.8776969, 1, 1, 1, 1, 1,
1.022135, -0.5128427, 2.982993, 1, 1, 1, 1, 1,
1.023062, -1.331143, 2.429816, 1, 1, 1, 1, 1,
1.025412, 1.720945, 0.7019417, 1, 1, 1, 1, 1,
1.026515, 1.25185, 1.126345, 1, 1, 1, 1, 1,
1.033477, 0.6981676, 0.3206, 1, 1, 1, 1, 1,
1.041308, 1.088697, 0.3051562, 1, 1, 1, 1, 1,
1.05196, 1.253511, -0.9568983, 1, 1, 1, 1, 1,
1.052843, 1.518178, 0.3698627, 1, 1, 1, 1, 1,
1.054886, 0.1731709, 0.07621207, 1, 1, 1, 1, 1,
1.061085, -1.650562, 3.028952, 1, 1, 1, 1, 1,
1.065905, -1.936031, 2.979227, 1, 1, 1, 1, 1,
1.066238, -0.4939768, 2.483596, 1, 1, 1, 1, 1,
1.074746, -2.100245, 2.978765, 1, 1, 1, 1, 1,
1.075164, -0.5810848, 3.320428, 0, 0, 1, 1, 1,
1.08104, 0.6092181, 0.1927778, 1, 0, 0, 1, 1,
1.086627, -0.3946544, 1.431712, 1, 0, 0, 1, 1,
1.095049, -0.06278685, 0.6328263, 1, 0, 0, 1, 1,
1.097948, 0.4168792, 2.803494, 1, 0, 0, 1, 1,
1.098354, 0.3475844, 0.9419559, 1, 0, 0, 1, 1,
1.108085, -1.373508, 2.482691, 0, 0, 0, 1, 1,
1.112862, 0.1214894, 1.898005, 0, 0, 0, 1, 1,
1.114574, 0.03976385, 0.8486236, 0, 0, 0, 1, 1,
1.118934, -0.5358353, 1.223071, 0, 0, 0, 1, 1,
1.122327, -0.2965013, 2.242257, 0, 0, 0, 1, 1,
1.122725, -1.22665, 3.977522, 0, 0, 0, 1, 1,
1.130409, -0.1765589, 2.766916, 0, 0, 0, 1, 1,
1.141051, -0.2230577, 2.95215, 1, 1, 1, 1, 1,
1.141664, 0.0288475, 2.076998, 1, 1, 1, 1, 1,
1.143848, 0.2841797, 0.4434099, 1, 1, 1, 1, 1,
1.153028, -2.440468, 3.029351, 1, 1, 1, 1, 1,
1.168261, 0.4318139, 2.011297, 1, 1, 1, 1, 1,
1.171845, 1.885072, 0.9454985, 1, 1, 1, 1, 1,
1.173369, -0.5209928, 3.597991, 1, 1, 1, 1, 1,
1.180691, 0.5995631, 0.4744685, 1, 1, 1, 1, 1,
1.192646, 0.5876915, 0.9580263, 1, 1, 1, 1, 1,
1.194073, -0.08022327, 1.451323, 1, 1, 1, 1, 1,
1.20122, -0.7156655, 2.939507, 1, 1, 1, 1, 1,
1.202485, -1.412218, 3.953907, 1, 1, 1, 1, 1,
1.203309, -0.3781874, 2.129484, 1, 1, 1, 1, 1,
1.205299, -0.1963235, 0.3860693, 1, 1, 1, 1, 1,
1.210066, 1.14375, -0.4880736, 1, 1, 1, 1, 1,
1.211579, 1.439487, 0.4360433, 0, 0, 1, 1, 1,
1.213457, -0.4970148, 2.282778, 1, 0, 0, 1, 1,
1.218564, 0.8854523, 2.512779, 1, 0, 0, 1, 1,
1.220855, -2.574756, 4.684002, 1, 0, 0, 1, 1,
1.23389, -1.049378, 1.744262, 1, 0, 0, 1, 1,
1.234947, 0.5395004, -0.1654332, 1, 0, 0, 1, 1,
1.251051, 0.8107848, 0.5968465, 0, 0, 0, 1, 1,
1.265729, -0.2582874, 0.6974882, 0, 0, 0, 1, 1,
1.281185, -1.169345, 1.153505, 0, 0, 0, 1, 1,
1.301081, 0.1006314, 3.145774, 0, 0, 0, 1, 1,
1.301991, -1.155952, 1.78457, 0, 0, 0, 1, 1,
1.315763, 1.506695, 0.9568698, 0, 0, 0, 1, 1,
1.316543, -1.050503, 2.345326, 0, 0, 0, 1, 1,
1.317338, -0.6554212, 1.309542, 1, 1, 1, 1, 1,
1.322484, 0.9135723, 1.082157, 1, 1, 1, 1, 1,
1.357278, 0.3811628, 2.706534, 1, 1, 1, 1, 1,
1.359801, 0.09775434, 2.196796, 1, 1, 1, 1, 1,
1.371791, -0.1375445, 2.450565, 1, 1, 1, 1, 1,
1.375157, 1.092113, 1.31974, 1, 1, 1, 1, 1,
1.391013, -0.4432693, 0.4904778, 1, 1, 1, 1, 1,
1.397651, -0.06717391, 1.232275, 1, 1, 1, 1, 1,
1.403435, -0.6774482, 2.415447, 1, 1, 1, 1, 1,
1.409554, -0.3816529, 2.81864, 1, 1, 1, 1, 1,
1.421837, -2.128327, 3.674209, 1, 1, 1, 1, 1,
1.423498, -0.1170921, 2.537401, 1, 1, 1, 1, 1,
1.435358, 0.1726291, 0.8903145, 1, 1, 1, 1, 1,
1.447245, 0.9961789, 2.714587, 1, 1, 1, 1, 1,
1.447411, -0.6866032, 0.3264938, 1, 1, 1, 1, 1,
1.461189, 0.6498131, 0.8317766, 0, 0, 1, 1, 1,
1.462859, -0.1620934, 1.29584, 1, 0, 0, 1, 1,
1.463625, 0.08038665, -0.7242366, 1, 0, 0, 1, 1,
1.463824, 0.5644456, 2.119453, 1, 0, 0, 1, 1,
1.464404, 1.351764, -0.02292573, 1, 0, 0, 1, 1,
1.46804, 1.100176, -0.05307813, 1, 0, 0, 1, 1,
1.468592, -0.3028343, -0.5502902, 0, 0, 0, 1, 1,
1.473069, 0.1431978, -0.08897592, 0, 0, 0, 1, 1,
1.47439, -0.08657795, 0.9462594, 0, 0, 0, 1, 1,
1.488671, 0.1476978, 1.067897, 0, 0, 0, 1, 1,
1.494664, -0.6473898, 1.417781, 0, 0, 0, 1, 1,
1.496544, -0.9614586, 0.818706, 0, 0, 0, 1, 1,
1.500228, 0.9117076, 0.3943208, 0, 0, 0, 1, 1,
1.500732, 0.7248911, 1.287684, 1, 1, 1, 1, 1,
1.509966, 0.6499557, 0.7782089, 1, 1, 1, 1, 1,
1.557553, -2.341364, 2.128399, 1, 1, 1, 1, 1,
1.560811, 0.2088205, 1.175332, 1, 1, 1, 1, 1,
1.56128, -0.2444174, 2.088487, 1, 1, 1, 1, 1,
1.562078, 1.672861, -0.667582, 1, 1, 1, 1, 1,
1.598175, -0.208943, 3.101905, 1, 1, 1, 1, 1,
1.611563, 0.2770632, 1.666324, 1, 1, 1, 1, 1,
1.62421, -0.4283704, 2.032516, 1, 1, 1, 1, 1,
1.640641, -0.5354043, 1.53863, 1, 1, 1, 1, 1,
1.645256, 0.4131405, 5.519151e-05, 1, 1, 1, 1, 1,
1.645954, 0.7424777, 0.1736368, 1, 1, 1, 1, 1,
1.661152, -0.1746352, 2.41753, 1, 1, 1, 1, 1,
1.661825, 0.1204349, 0.9726548, 1, 1, 1, 1, 1,
1.669055, -1.936406, 2.327594, 1, 1, 1, 1, 1,
1.674005, -1.110649, 1.475568, 0, 0, 1, 1, 1,
1.675279, 0.2897086, 2.766809, 1, 0, 0, 1, 1,
1.676096, 0.1712177, 1.169498, 1, 0, 0, 1, 1,
1.677265, -0.1105901, 0.4718343, 1, 0, 0, 1, 1,
1.683273, -0.2136401, 1.150568, 1, 0, 0, 1, 1,
1.687078, 0.143067, 3.129382, 1, 0, 0, 1, 1,
1.695427, -0.2332565, 3.313415, 0, 0, 0, 1, 1,
1.71682, 0.6286352, 0.6996252, 0, 0, 0, 1, 1,
1.755079, -1.867341, 2.008398, 0, 0, 0, 1, 1,
1.793889, -0.7883052, 2.379129, 0, 0, 0, 1, 1,
1.800154, 1.064279, 1.979757, 0, 0, 0, 1, 1,
1.800279, 0.8343088, 1.154823, 0, 0, 0, 1, 1,
1.837026, -1.045609, 2.332337, 0, 0, 0, 1, 1,
1.856146, 2.230457, 0.3705976, 1, 1, 1, 1, 1,
1.874655, -0.8063418, 1.881144, 1, 1, 1, 1, 1,
1.87574, 1.197005, 2.79495, 1, 1, 1, 1, 1,
1.909041, -1.064046, 2.163891, 1, 1, 1, 1, 1,
1.924146, -0.2608758, 2.277862, 1, 1, 1, 1, 1,
1.940488, 1.347951, 1.115499, 1, 1, 1, 1, 1,
1.942042, 0.3157759, 2.605483, 1, 1, 1, 1, 1,
1.946122, 1.225492, 0.3266158, 1, 1, 1, 1, 1,
1.97171, -1.714698, 1.586065, 1, 1, 1, 1, 1,
1.997233, -1.363571, 2.012265, 1, 1, 1, 1, 1,
2.017615, -2.244454, 3.077373, 1, 1, 1, 1, 1,
2.019168, -0.0662436, 0.9871555, 1, 1, 1, 1, 1,
2.077915, -0.1066368, 3.088216, 1, 1, 1, 1, 1,
2.078281, -0.7280359, 1.124681, 1, 1, 1, 1, 1,
2.084263, -1.296653, 2.7333, 1, 1, 1, 1, 1,
2.110444, -0.8231147, 3.06237, 0, 0, 1, 1, 1,
2.139106, 1.876997, 0.2104622, 1, 0, 0, 1, 1,
2.149603, -0.1332025, 3.055818, 1, 0, 0, 1, 1,
2.162314, 1.307009, 0.9542902, 1, 0, 0, 1, 1,
2.171005, -1.292893, 2.119595, 1, 0, 0, 1, 1,
2.175981, -0.003825289, 2.666579, 1, 0, 0, 1, 1,
2.260204, -0.9407455, 2.358252, 0, 0, 0, 1, 1,
2.380657, 1.162022, -0.1709221, 0, 0, 0, 1, 1,
2.410094, 0.4749387, 0.8060288, 0, 0, 0, 1, 1,
2.421639, 0.779569, 0.8326056, 0, 0, 0, 1, 1,
2.423926, 0.3960493, 3.133544, 0, 0, 0, 1, 1,
2.431866, 2.003219, -1.143029, 0, 0, 0, 1, 1,
2.478772, 0.3426975, 0.7336292, 0, 0, 0, 1, 1,
2.478882, -1.187473, 1.714867, 1, 1, 1, 1, 1,
2.492161, 1.091101, 1.782806, 1, 1, 1, 1, 1,
2.498893, -0.7430513, 1.902024, 1, 1, 1, 1, 1,
2.539081, -0.4526393, 1.402519, 1, 1, 1, 1, 1,
2.559287, 0.6707692, 2.022832, 1, 1, 1, 1, 1,
2.666088, 0.2180408, 2.312885, 1, 1, 1, 1, 1,
2.747401, 0.2342684, 2.933771, 1, 1, 1, 1, 1
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
var radius = 9.395755;
var distance = 33.00219;
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
mvMatrix.translate( 0.1604521, 0.2978501, 0.07127285 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.00219);
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
