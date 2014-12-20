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
-3.090602, -0.8245023, -0.6569229, 1, 0, 0, 1,
-3.048853, -0.3029304, -0.2419719, 1, 0.007843138, 0, 1,
-2.587638, -0.2643092, -1.265686, 1, 0.01176471, 0, 1,
-2.353565, -0.3187191, -1.52866, 1, 0.01960784, 0, 1,
-2.323024, -0.2139349, -3.465549, 1, 0.02352941, 0, 1,
-2.307294, -2.055673, -3.845954, 1, 0.03137255, 0, 1,
-2.290881, 0.1386087, 0.1942028, 1, 0.03529412, 0, 1,
-2.266297, 0.2386286, -0.5589349, 1, 0.04313726, 0, 1,
-2.226424, -0.5455674, -0.1809238, 1, 0.04705882, 0, 1,
-2.216071, -0.1743246, -1.176952, 1, 0.05490196, 0, 1,
-2.134509, 0.2915436, 1.25042, 1, 0.05882353, 0, 1,
-2.026134, 0.2688709, 0.4502067, 1, 0.06666667, 0, 1,
-2.015563, -0.7292647, -2.071746, 1, 0.07058824, 0, 1,
-1.989311, -1.821212, -3.796766, 1, 0.07843138, 0, 1,
-1.986549, -0.8718546, -2.006995, 1, 0.08235294, 0, 1,
-1.983443, -0.8507781, -2.478053, 1, 0.09019608, 0, 1,
-1.942492, -0.6623413, -3.485888, 1, 0.09411765, 0, 1,
-1.925881, -0.5878574, -1.863733, 1, 0.1019608, 0, 1,
-1.901793, 0.6459513, 0.1139062, 1, 0.1098039, 0, 1,
-1.900577, 1.565749, -0.175097, 1, 0.1137255, 0, 1,
-1.869052, 0.4138656, 0.2412678, 1, 0.1215686, 0, 1,
-1.861097, -1.490156, -2.354124, 1, 0.1254902, 0, 1,
-1.841573, 0.8983375, -0.493463, 1, 0.1333333, 0, 1,
-1.84038, 0.5784205, -0.7219754, 1, 0.1372549, 0, 1,
-1.837534, -0.6425083, -0.9325238, 1, 0.145098, 0, 1,
-1.796636, 0.1281869, -1.955884, 1, 0.1490196, 0, 1,
-1.795667, -0.0923055, -1.055451, 1, 0.1568628, 0, 1,
-1.794523, -0.3916835, -2.204931, 1, 0.1607843, 0, 1,
-1.792857, -0.1162292, -0.6885713, 1, 0.1686275, 0, 1,
-1.776598, 0.2970552, -2.025657, 1, 0.172549, 0, 1,
-1.771641, -0.8427123, -2.444299, 1, 0.1803922, 0, 1,
-1.768847, 0.01844217, -2.526688, 1, 0.1843137, 0, 1,
-1.728653, -1.170645, -3.18366, 1, 0.1921569, 0, 1,
-1.717675, 0.3148994, -1.391832, 1, 0.1960784, 0, 1,
-1.714451, 0.6074836, -1.13325, 1, 0.2039216, 0, 1,
-1.704098, -0.7479737, -0.3664253, 1, 0.2117647, 0, 1,
-1.691726, -0.449939, -3.376966, 1, 0.2156863, 0, 1,
-1.691131, -0.6669154, -1.754095, 1, 0.2235294, 0, 1,
-1.680427, -0.3359356, -1.762792, 1, 0.227451, 0, 1,
-1.652514, 0.1260553, -2.416892, 1, 0.2352941, 0, 1,
-1.646562, -1.251973, -4.269515, 1, 0.2392157, 0, 1,
-1.639921, -1.683659, -2.374446, 1, 0.2470588, 0, 1,
-1.635706, 0.2931885, -1.859389, 1, 0.2509804, 0, 1,
-1.629909, 1.480696, -1.865004, 1, 0.2588235, 0, 1,
-1.626684, 1.103396, -0.3907944, 1, 0.2627451, 0, 1,
-1.625564, 0.3785667, -1.26461, 1, 0.2705882, 0, 1,
-1.621005, 0.4798419, -0.295486, 1, 0.2745098, 0, 1,
-1.611863, -0.3068897, -0.9676039, 1, 0.282353, 0, 1,
-1.611655, -1.076534, -2.285567, 1, 0.2862745, 0, 1,
-1.60674, 1.299368, -0.4789901, 1, 0.2941177, 0, 1,
-1.60671, 0.1054785, -0.7118586, 1, 0.3019608, 0, 1,
-1.602048, 1.257731, -2.206467, 1, 0.3058824, 0, 1,
-1.600042, -0.09981994, -3.187226, 1, 0.3137255, 0, 1,
-1.588066, 1.730786, -1.139323, 1, 0.3176471, 0, 1,
-1.569728, -0.7626107, -1.900959, 1, 0.3254902, 0, 1,
-1.566085, 0.2854214, -1.619896, 1, 0.3294118, 0, 1,
-1.565774, -0.3168201, -2.157062, 1, 0.3372549, 0, 1,
-1.555072, -1.158926, -2.633264, 1, 0.3411765, 0, 1,
-1.554034, 0.4607673, -1.041805, 1, 0.3490196, 0, 1,
-1.547671, 0.523003, -0.8178467, 1, 0.3529412, 0, 1,
-1.541082, 0.761552, 0.2814353, 1, 0.3607843, 0, 1,
-1.533772, -1.756292, -2.432738, 1, 0.3647059, 0, 1,
-1.527551, 0.8779549, -1.460833, 1, 0.372549, 0, 1,
-1.520858, 0.596639, -1.65726, 1, 0.3764706, 0, 1,
-1.515368, 0.1637673, -2.074894, 1, 0.3843137, 0, 1,
-1.469795, 0.502726, -1.111064, 1, 0.3882353, 0, 1,
-1.443407, 0.8540944, 1.204255, 1, 0.3960784, 0, 1,
-1.428871, 0.6827533, -2.068005, 1, 0.4039216, 0, 1,
-1.428164, 0.2889757, -2.379832, 1, 0.4078431, 0, 1,
-1.423974, -0.3264652, -0.4359833, 1, 0.4156863, 0, 1,
-1.417697, 0.006641339, -0.02915664, 1, 0.4196078, 0, 1,
-1.413322, -0.4315833, -1.454027, 1, 0.427451, 0, 1,
-1.403084, 0.2532844, -2.669609, 1, 0.4313726, 0, 1,
-1.399023, -2.059439, -1.092674, 1, 0.4392157, 0, 1,
-1.390296, 0.3032076, -1.585532, 1, 0.4431373, 0, 1,
-1.387361, 1.098611, -1.332403, 1, 0.4509804, 0, 1,
-1.386707, 0.8068064, -0.3888272, 1, 0.454902, 0, 1,
-1.384208, -2.129122, -1.30319, 1, 0.4627451, 0, 1,
-1.379305, -0.3471083, -2.554667, 1, 0.4666667, 0, 1,
-1.377295, 0.1827909, -1.643776, 1, 0.4745098, 0, 1,
-1.360776, -0.2337344, -2.227577, 1, 0.4784314, 0, 1,
-1.334555, 0.1478802, -1.448437, 1, 0.4862745, 0, 1,
-1.322567, 0.3596714, -1.497494, 1, 0.4901961, 0, 1,
-1.302624, -1.593758, -2.980667, 1, 0.4980392, 0, 1,
-1.30249, -0.2603563, -2.582601, 1, 0.5058824, 0, 1,
-1.296986, 0.9607905, -0.05704855, 1, 0.509804, 0, 1,
-1.273641, -0.4590828, -3.186058, 1, 0.5176471, 0, 1,
-1.272988, -1.062518, -3.927701, 1, 0.5215687, 0, 1,
-1.269447, 1.623975, -1.638333, 1, 0.5294118, 0, 1,
-1.255273, 0.004889379, 0.6790126, 1, 0.5333334, 0, 1,
-1.254349, -0.1050533, -4.550643, 1, 0.5411765, 0, 1,
-1.240027, 0.03715067, -1.206597, 1, 0.5450981, 0, 1,
-1.228026, 1.146183, -0.8611425, 1, 0.5529412, 0, 1,
-1.225188, -0.7726668, -0.7645397, 1, 0.5568628, 0, 1,
-1.22514, 1.545545, -0.1806181, 1, 0.5647059, 0, 1,
-1.22431, -0.2443717, -2.431179, 1, 0.5686275, 0, 1,
-1.218152, 0.05458703, -1.595346, 1, 0.5764706, 0, 1,
-1.214485, -2.420503, -3.37108, 1, 0.5803922, 0, 1,
-1.21282, 0.5643334, -3.151308, 1, 0.5882353, 0, 1,
-1.197598, -0.1670368, -1.7465, 1, 0.5921569, 0, 1,
-1.194805, 0.5940197, 0.02996886, 1, 0.6, 0, 1,
-1.194037, -1.665384, -1.355981, 1, 0.6078432, 0, 1,
-1.190687, -0.717231, -1.316541, 1, 0.6117647, 0, 1,
-1.189486, -1.02836, -1.685988, 1, 0.6196079, 0, 1,
-1.181736, 0.0775312, -1.005937, 1, 0.6235294, 0, 1,
-1.169216, 0.4227934, -1.518507, 1, 0.6313726, 0, 1,
-1.154565, 0.7510895, -0.552101, 1, 0.6352941, 0, 1,
-1.154475, 0.1769455, -1.139928, 1, 0.6431373, 0, 1,
-1.148348, -2.155849, -3.133355, 1, 0.6470588, 0, 1,
-1.147913, 0.1261168, -2.054705, 1, 0.654902, 0, 1,
-1.140956, 0.3039517, -0.6994356, 1, 0.6588235, 0, 1,
-1.139701, 1.363802, -0.4919506, 1, 0.6666667, 0, 1,
-1.138057, -2.179852, -3.611954, 1, 0.6705883, 0, 1,
-1.129, -0.9955012, -2.235856, 1, 0.6784314, 0, 1,
-1.123247, 0.6353701, -2.193108, 1, 0.682353, 0, 1,
-1.113954, -0.7095736, -0.8021617, 1, 0.6901961, 0, 1,
-1.106533, -0.4173188, -1.391403, 1, 0.6941177, 0, 1,
-1.097915, -2.276727, -1.710289, 1, 0.7019608, 0, 1,
-1.093475, 0.5181031, -0.4038595, 1, 0.7098039, 0, 1,
-1.093407, 0.6514058, -1.664415, 1, 0.7137255, 0, 1,
-1.088858, 0.2755626, -1.916442, 1, 0.7215686, 0, 1,
-1.088189, -1.781059, -1.621043, 1, 0.7254902, 0, 1,
-1.085153, -0.8275563, -1.297157, 1, 0.7333333, 0, 1,
-1.083094, 0.3529682, -0.9022231, 1, 0.7372549, 0, 1,
-1.0658, -1.22335, -4.00279, 1, 0.7450981, 0, 1,
-1.063924, -0.4531661, -1.439535, 1, 0.7490196, 0, 1,
-1.063904, 0.7447612, 0.1037062, 1, 0.7568628, 0, 1,
-1.061661, 0.7663705, -1.934122, 1, 0.7607843, 0, 1,
-1.059392, 0.6174193, 0.0442869, 1, 0.7686275, 0, 1,
-1.058238, 0.06173826, -2.213048, 1, 0.772549, 0, 1,
-1.056414, 1.179046, -0.482159, 1, 0.7803922, 0, 1,
-1.051833, -1.018107, -4.842493, 1, 0.7843137, 0, 1,
-1.05116, 0.3880161, -1.934011, 1, 0.7921569, 0, 1,
-1.050812, 0.09363756, -2.101866, 1, 0.7960784, 0, 1,
-1.050455, -0.5088981, -1.69266, 1, 0.8039216, 0, 1,
-1.049141, -1.84089, -3.273736, 1, 0.8117647, 0, 1,
-1.039799, 0.8833692, -1.580844, 1, 0.8156863, 0, 1,
-1.036284, 0.2144887, -1.597097, 1, 0.8235294, 0, 1,
-1.033973, 1.608018, -0.390236, 1, 0.827451, 0, 1,
-1.02135, 0.3587604, -1.11827, 1, 0.8352941, 0, 1,
-1.020594, 0.4368521, -1.569375, 1, 0.8392157, 0, 1,
-1.012275, -0.2476628, -0.1345706, 1, 0.8470588, 0, 1,
-1.010006, -0.5860136, -0.420658, 1, 0.8509804, 0, 1,
-1.008473, -0.2065542, -2.260756, 1, 0.8588235, 0, 1,
-1.006202, -0.3573335, -2.343859, 1, 0.8627451, 0, 1,
-1.004953, -1.239486, -3.489627, 1, 0.8705882, 0, 1,
-1.003881, -1.400428, -1.846426, 1, 0.8745098, 0, 1,
-1.000528, -1.891575, -2.263941, 1, 0.8823529, 0, 1,
-1.000392, 1.403568, -1.480348, 1, 0.8862745, 0, 1,
-0.9915929, 1.085619, 0.09422692, 1, 0.8941177, 0, 1,
-0.9905612, 0.9968732, -2.114271, 1, 0.8980392, 0, 1,
-0.9889992, 1.239528, -1.082417, 1, 0.9058824, 0, 1,
-0.9874691, 0.5382126, -0.560684, 1, 0.9137255, 0, 1,
-0.9820889, -0.6519482, -1.180586, 1, 0.9176471, 0, 1,
-0.9778209, -1.13472, -2.565422, 1, 0.9254902, 0, 1,
-0.9746644, -2.274865, -1.395676, 1, 0.9294118, 0, 1,
-0.974584, 2.028911, -0.9131027, 1, 0.9372549, 0, 1,
-0.9732829, 1.74578, 0.1516963, 1, 0.9411765, 0, 1,
-0.9681106, 0.2307, -0.1846401, 1, 0.9490196, 0, 1,
-0.9677565, -0.4070816, -1.66951, 1, 0.9529412, 0, 1,
-0.960888, -1.888652, -1.03985, 1, 0.9607843, 0, 1,
-0.958459, 0.9360039, -1.597312, 1, 0.9647059, 0, 1,
-0.9572545, -0.8645805, -1.20029, 1, 0.972549, 0, 1,
-0.9534101, 0.667024, -0.361948, 1, 0.9764706, 0, 1,
-0.9473953, 0.6812652, -2.806282, 1, 0.9843137, 0, 1,
-0.9455618, -0.488322, -1.767112, 1, 0.9882353, 0, 1,
-0.9403469, 1.826277, -0.6036737, 1, 0.9960784, 0, 1,
-0.9373497, -0.08012009, -2.109225, 0.9960784, 1, 0, 1,
-0.9310487, -0.3948736, -2.221672, 0.9921569, 1, 0, 1,
-0.9300883, -0.7704765, -3.903405, 0.9843137, 1, 0, 1,
-0.9206235, 0.3829855, -1.948875, 0.9803922, 1, 0, 1,
-0.9153344, 0.6863068, -0.9040359, 0.972549, 1, 0, 1,
-0.9067345, 1.358315, -1.357492, 0.9686275, 1, 0, 1,
-0.9029858, 0.1829407, -1.94932, 0.9607843, 1, 0, 1,
-0.901097, 1.646957, -0.03139335, 0.9568627, 1, 0, 1,
-0.8971332, 0.2206765, -0.6294476, 0.9490196, 1, 0, 1,
-0.8848671, -0.9106483, -1.437243, 0.945098, 1, 0, 1,
-0.8817161, -0.6349075, -2.030769, 0.9372549, 1, 0, 1,
-0.8781145, -0.780136, -2.804636, 0.9333333, 1, 0, 1,
-0.8773094, -0.02541791, -2.521633, 0.9254902, 1, 0, 1,
-0.8763989, 0.1841569, -1.555115, 0.9215686, 1, 0, 1,
-0.8761951, -1.402249, -2.987792, 0.9137255, 1, 0, 1,
-0.8746049, 0.3154187, -1.151777, 0.9098039, 1, 0, 1,
-0.8737613, -2.396335, -2.147447, 0.9019608, 1, 0, 1,
-0.8632507, -1.262103, -2.372996, 0.8941177, 1, 0, 1,
-0.8603534, 0.4128457, -0.8445694, 0.8901961, 1, 0, 1,
-0.8506695, 0.442432, -0.05833074, 0.8823529, 1, 0, 1,
-0.8498634, 0.3994035, -0.8137802, 0.8784314, 1, 0, 1,
-0.8496968, -0.7138079, -1.3776, 0.8705882, 1, 0, 1,
-0.8494367, 1.38805, 0.01678076, 0.8666667, 1, 0, 1,
-0.8458441, 0.8128533, -0.3299457, 0.8588235, 1, 0, 1,
-0.8445722, -0.9629567, -2.779155, 0.854902, 1, 0, 1,
-0.8431317, 1.967295, 0.9509676, 0.8470588, 1, 0, 1,
-0.8315082, -1.775238, -1.600137, 0.8431373, 1, 0, 1,
-0.8305492, 0.7965105, -1.772734, 0.8352941, 1, 0, 1,
-0.8287675, -1.149649, -5.133164, 0.8313726, 1, 0, 1,
-0.8243585, 2.019536, 0.8356782, 0.8235294, 1, 0, 1,
-0.8222789, -0.0270598, -1.211384, 0.8196079, 1, 0, 1,
-0.8200622, 0.388093, -2.154144, 0.8117647, 1, 0, 1,
-0.813755, 0.1306464, -0.7545694, 0.8078431, 1, 0, 1,
-0.8088627, -0.06933093, -1.379253, 0.8, 1, 0, 1,
-0.7943722, 0.2472564, -0.8429698, 0.7921569, 1, 0, 1,
-0.7941739, 0.6949579, -0.9585925, 0.7882353, 1, 0, 1,
-0.788296, 0.5260064, 0.7191, 0.7803922, 1, 0, 1,
-0.7872579, 1.146907, 1.308078, 0.7764706, 1, 0, 1,
-0.7866505, 0.1397415, -0.6323731, 0.7686275, 1, 0, 1,
-0.7836627, -1.062596, -2.875145, 0.7647059, 1, 0, 1,
-0.7759562, -0.3806277, -1.732353, 0.7568628, 1, 0, 1,
-0.7737893, 0.3871699, -2.892939, 0.7529412, 1, 0, 1,
-0.7723954, -0.922731, -3.011097, 0.7450981, 1, 0, 1,
-0.7710051, 1.544266, -2.27082, 0.7411765, 1, 0, 1,
-0.7621743, -1.115141, -3.516141, 0.7333333, 1, 0, 1,
-0.7591402, -1.457376, -3.123286, 0.7294118, 1, 0, 1,
-0.7508376, 0.876886, -1.25842, 0.7215686, 1, 0, 1,
-0.7478104, 0.5302951, -1.955115, 0.7176471, 1, 0, 1,
-0.7461569, -0.08538016, -1.583431, 0.7098039, 1, 0, 1,
-0.7422829, 1.218237, -0.5448459, 0.7058824, 1, 0, 1,
-0.741168, -0.4672029, -3.263596, 0.6980392, 1, 0, 1,
-0.7393115, 0.004118493, -1.52524, 0.6901961, 1, 0, 1,
-0.7392229, 0.08972605, -1.660968, 0.6862745, 1, 0, 1,
-0.7390775, -0.3767717, -2.336158, 0.6784314, 1, 0, 1,
-0.738676, 0.1027603, -1.231735, 0.6745098, 1, 0, 1,
-0.7359411, -1.371434, -2.753853, 0.6666667, 1, 0, 1,
-0.7357909, 0.2658123, -1.407175, 0.6627451, 1, 0, 1,
-0.7302772, 0.3524745, -2.893221, 0.654902, 1, 0, 1,
-0.7298359, -0.2174254, -1.012809, 0.6509804, 1, 0, 1,
-0.7244376, -1.368754, -2.081054, 0.6431373, 1, 0, 1,
-0.7233001, 1.458435, -1.119344, 0.6392157, 1, 0, 1,
-0.7090265, -0.6184415, -3.38918, 0.6313726, 1, 0, 1,
-0.7044506, 0.234649, -1.060293, 0.627451, 1, 0, 1,
-0.7043716, 0.811507, 0.3014929, 0.6196079, 1, 0, 1,
-0.6907569, -0.8430295, -3.123688, 0.6156863, 1, 0, 1,
-0.6857884, -0.5118351, -1.608873, 0.6078432, 1, 0, 1,
-0.6779177, 0.1419726, -2.259795, 0.6039216, 1, 0, 1,
-0.6737831, 0.7947925, 0.2335449, 0.5960785, 1, 0, 1,
-0.665075, 0.2403997, -2.327322, 0.5882353, 1, 0, 1,
-0.6605226, -0.4553261, -0.7197777, 0.5843138, 1, 0, 1,
-0.6601634, -0.8225294, -3.03372, 0.5764706, 1, 0, 1,
-0.6590499, 0.5824351, -2.853947, 0.572549, 1, 0, 1,
-0.6483247, 1.544653, -0.511243, 0.5647059, 1, 0, 1,
-0.6457417, -2.199916, -1.488506, 0.5607843, 1, 0, 1,
-0.6453071, 0.2214279, -1.078904, 0.5529412, 1, 0, 1,
-0.6427928, -0.4573649, -2.67688, 0.5490196, 1, 0, 1,
-0.6386973, -0.5827914, -2.398765, 0.5411765, 1, 0, 1,
-0.6361614, 1.043613, -0.8485947, 0.5372549, 1, 0, 1,
-0.6359224, 0.1748049, -1.430049, 0.5294118, 1, 0, 1,
-0.633949, -0.7442983, -2.415823, 0.5254902, 1, 0, 1,
-0.6296201, 1.021683, -0.5432948, 0.5176471, 1, 0, 1,
-0.6295946, 0.1366716, -1.741978, 0.5137255, 1, 0, 1,
-0.6261007, 0.8457708, -0.6301793, 0.5058824, 1, 0, 1,
-0.6100622, 2.080838, -1.103271, 0.5019608, 1, 0, 1,
-0.6085132, 1.835034, 0.05329039, 0.4941176, 1, 0, 1,
-0.6058129, 0.04611003, -1.99035, 0.4862745, 1, 0, 1,
-0.6047387, -0.4369672, -2.666433, 0.4823529, 1, 0, 1,
-0.6046463, 0.6589727, -2.557461, 0.4745098, 1, 0, 1,
-0.6046378, -0.08245717, -1.099306, 0.4705882, 1, 0, 1,
-0.6038156, 1.753318, -0.1047303, 0.4627451, 1, 0, 1,
-0.5985292, -1.92521, -0.9900144, 0.4588235, 1, 0, 1,
-0.5983241, 1.075045, -1.630275, 0.4509804, 1, 0, 1,
-0.5981987, -0.1125278, -2.268157, 0.4470588, 1, 0, 1,
-0.5938043, -1.335845, -1.594625, 0.4392157, 1, 0, 1,
-0.5931081, -1.229365, -2.766186, 0.4352941, 1, 0, 1,
-0.5929683, 0.01081875, -1.222711, 0.427451, 1, 0, 1,
-0.5923695, -1.072257, -2.030861, 0.4235294, 1, 0, 1,
-0.5834095, 2.693152, 0.3633783, 0.4156863, 1, 0, 1,
-0.5800227, -0.04027574, -1.706066, 0.4117647, 1, 0, 1,
-0.5705673, 0.360619, -1.468677, 0.4039216, 1, 0, 1,
-0.566085, -2.377628, -3.57027, 0.3960784, 1, 0, 1,
-0.5632377, -0.1490712, -3.029638, 0.3921569, 1, 0, 1,
-0.5577686, -1.416705, -4.790176, 0.3843137, 1, 0, 1,
-0.5536203, 0.8047736, -1.91419, 0.3803922, 1, 0, 1,
-0.5496633, 0.2131992, -1.128671, 0.372549, 1, 0, 1,
-0.5491837, -0.4130875, -1.333974, 0.3686275, 1, 0, 1,
-0.5454251, -0.668768, -3.321627, 0.3607843, 1, 0, 1,
-0.5338165, -1.947537, -2.734968, 0.3568628, 1, 0, 1,
-0.5298589, 0.8859534, -1.341649, 0.3490196, 1, 0, 1,
-0.529406, 0.7850274, 0.5706726, 0.345098, 1, 0, 1,
-0.5279397, 0.2978506, -0.521031, 0.3372549, 1, 0, 1,
-0.522969, -2.101494, -1.829311, 0.3333333, 1, 0, 1,
-0.5213501, 0.2361054, -0.8198608, 0.3254902, 1, 0, 1,
-0.5188797, 2.690584, 0.3065799, 0.3215686, 1, 0, 1,
-0.5178171, -0.4152291, -2.854108, 0.3137255, 1, 0, 1,
-0.5175787, 0.580358, -0.1279858, 0.3098039, 1, 0, 1,
-0.5167688, -1.232894, -2.815305, 0.3019608, 1, 0, 1,
-0.5120699, -0.4641047, -1.927642, 0.2941177, 1, 0, 1,
-0.5118159, -0.7291547, -2.556674, 0.2901961, 1, 0, 1,
-0.5115723, -0.2160767, 0.1757474, 0.282353, 1, 0, 1,
-0.5098575, -0.03477893, -1.103696, 0.2784314, 1, 0, 1,
-0.507827, 0.1970303, -2.163513, 0.2705882, 1, 0, 1,
-0.503861, -0.7680219, -1.378523, 0.2666667, 1, 0, 1,
-0.4983951, 1.170421, -1.656872, 0.2588235, 1, 0, 1,
-0.498185, 0.5783529, -1.554894, 0.254902, 1, 0, 1,
-0.4978092, 0.545117, -1.268201, 0.2470588, 1, 0, 1,
-0.4954253, -2.403245, -4.448724, 0.2431373, 1, 0, 1,
-0.4949618, 0.6181127, -0.3595326, 0.2352941, 1, 0, 1,
-0.4938107, -0.06547613, -2.567552, 0.2313726, 1, 0, 1,
-0.4917671, -0.1303924, -0.7613086, 0.2235294, 1, 0, 1,
-0.4901089, -1.204672, -1.522671, 0.2196078, 1, 0, 1,
-0.4900551, 0.8075184, -1.164033, 0.2117647, 1, 0, 1,
-0.4863701, -0.3342357, -2.759562, 0.2078431, 1, 0, 1,
-0.4855309, 1.014154, -0.5891875, 0.2, 1, 0, 1,
-0.485133, 0.04084232, -2.546393, 0.1921569, 1, 0, 1,
-0.482678, 0.381114, -0.5084903, 0.1882353, 1, 0, 1,
-0.4737639, 1.685392, 0.2769184, 0.1803922, 1, 0, 1,
-0.4675637, -0.2679732, -3.447551, 0.1764706, 1, 0, 1,
-0.4666288, -0.9737545, -2.500649, 0.1686275, 1, 0, 1,
-0.4643388, -0.111596, -0.7312854, 0.1647059, 1, 0, 1,
-0.4629321, 1.058675, 0.09543908, 0.1568628, 1, 0, 1,
-0.4624677, 0.1581604, -0.02811207, 0.1529412, 1, 0, 1,
-0.4617743, -0.01766761, -1.152956, 0.145098, 1, 0, 1,
-0.459212, -0.7308229, -1.55749, 0.1411765, 1, 0, 1,
-0.4588561, -1.236636, -2.633996, 0.1333333, 1, 0, 1,
-0.4572781, 1.719518, -1.085922, 0.1294118, 1, 0, 1,
-0.4566636, 0.08290164, -2.554109, 0.1215686, 1, 0, 1,
-0.4517526, 1.126886, 1.088802, 0.1176471, 1, 0, 1,
-0.4477895, -0.1509081, -3.079318, 0.1098039, 1, 0, 1,
-0.4467694, 0.2062872, -1.088314, 0.1058824, 1, 0, 1,
-0.4447306, -1.529305, -0.8520557, 0.09803922, 1, 0, 1,
-0.4431321, -0.08078283, -0.2652643, 0.09019608, 1, 0, 1,
-0.4389351, 0.2063209, -0.804938, 0.08627451, 1, 0, 1,
-0.4361572, 0.7122246, -1.093736, 0.07843138, 1, 0, 1,
-0.4353071, -1.664903, -3.532143, 0.07450981, 1, 0, 1,
-0.4351598, 1.13641, 0.8741706, 0.06666667, 1, 0, 1,
-0.4327736, 1.952036, 0.1409266, 0.0627451, 1, 0, 1,
-0.4263731, 0.4262822, -0.5145068, 0.05490196, 1, 0, 1,
-0.4245293, -0.8085558, -2.990831, 0.05098039, 1, 0, 1,
-0.4213331, -1.629788, -5.946476, 0.04313726, 1, 0, 1,
-0.415773, -0.9084673, -2.610167, 0.03921569, 1, 0, 1,
-0.4142796, 0.01530833, -1.932309, 0.03137255, 1, 0, 1,
-0.4140898, -1.031153, -2.109274, 0.02745098, 1, 0, 1,
-0.4130799, 0.3937591, -0.2107301, 0.01960784, 1, 0, 1,
-0.412546, 1.322729, 0.6554997, 0.01568628, 1, 0, 1,
-0.4063019, -0.9204308, -2.903067, 0.007843138, 1, 0, 1,
-0.3971874, -0.485545, -2.200418, 0.003921569, 1, 0, 1,
-0.3961302, -0.4398111, -2.866911, 0, 1, 0.003921569, 1,
-0.3951452, -0.7650799, -4.095271, 0, 1, 0.01176471, 1,
-0.3943679, -0.926809, -2.010833, 0, 1, 0.01568628, 1,
-0.391291, -0.3619168, -2.04514, 0, 1, 0.02352941, 1,
-0.3868481, -0.4653481, -0.5448909, 0, 1, 0.02745098, 1,
-0.3863288, 0.5425703, -0.7089159, 0, 1, 0.03529412, 1,
-0.3859664, -2.249886, -2.730379, 0, 1, 0.03921569, 1,
-0.3834437, -0.998558, -3.334563, 0, 1, 0.04705882, 1,
-0.3834176, 2.517644, -1.450534, 0, 1, 0.05098039, 1,
-0.3820989, 0.1357594, -1.238053, 0, 1, 0.05882353, 1,
-0.3817507, -0.6026255, -2.599848, 0, 1, 0.0627451, 1,
-0.3800055, 1.417509, -1.657372, 0, 1, 0.07058824, 1,
-0.3799168, 1.170976, -0.7686933, 0, 1, 0.07450981, 1,
-0.3794853, 0.5385991, -1.644431, 0, 1, 0.08235294, 1,
-0.3785435, 1.680696, 0.5383471, 0, 1, 0.08627451, 1,
-0.3773304, -1.662634, -2.790773, 0, 1, 0.09411765, 1,
-0.3739173, -0.3918671, -3.337671, 0, 1, 0.1019608, 1,
-0.3733752, 0.1504314, -1.604082, 0, 1, 0.1058824, 1,
-0.3719274, -1.352897, -3.358954, 0, 1, 0.1137255, 1,
-0.3664977, -1.397354, -2.515694, 0, 1, 0.1176471, 1,
-0.3641343, -0.4905952, -2.940299, 0, 1, 0.1254902, 1,
-0.3567862, 0.3722146, 0.05510108, 0, 1, 0.1294118, 1,
-0.3495981, 1.797447, 0.08546054, 0, 1, 0.1372549, 1,
-0.3456927, 0.9047334, -0.4520811, 0, 1, 0.1411765, 1,
-0.3441822, 1.256101, 0.6591632, 0, 1, 0.1490196, 1,
-0.3437507, 1.804292, -0.3751851, 0, 1, 0.1529412, 1,
-0.3426348, -0.5093512, -2.825574, 0, 1, 0.1607843, 1,
-0.3393931, -0.3211273, -1.168764, 0, 1, 0.1647059, 1,
-0.3355241, -1.176558, -3.229466, 0, 1, 0.172549, 1,
-0.3316276, -0.6317759, -2.87879, 0, 1, 0.1764706, 1,
-0.3216001, -0.2570704, -3.821749, 0, 1, 0.1843137, 1,
-0.3187752, 0.9038803, -0.7957551, 0, 1, 0.1882353, 1,
-0.3181888, -1.394364, -2.02861, 0, 1, 0.1960784, 1,
-0.3170597, 0.4249544, 0.7562158, 0, 1, 0.2039216, 1,
-0.3169186, 1.422417, -0.3399343, 0, 1, 0.2078431, 1,
-0.3161322, -1.359877, -2.623828, 0, 1, 0.2156863, 1,
-0.3130534, -0.7395145, -3.536321, 0, 1, 0.2196078, 1,
-0.3115995, 0.08282527, -2.467229, 0, 1, 0.227451, 1,
-0.3104302, -0.6117672, -3.130296, 0, 1, 0.2313726, 1,
-0.2985539, 0.6208414, -1.977869, 0, 1, 0.2392157, 1,
-0.29746, 0.9044632, -0.4585137, 0, 1, 0.2431373, 1,
-0.2971106, 1.026534, 0.6475747, 0, 1, 0.2509804, 1,
-0.2958041, 0.1848537, -0.6380026, 0, 1, 0.254902, 1,
-0.2914658, 1.090629, 0.03537149, 0, 1, 0.2627451, 1,
-0.2909184, -1.393854, -2.003795, 0, 1, 0.2666667, 1,
-0.2906601, -1.39532, -4.105021, 0, 1, 0.2745098, 1,
-0.2878253, -0.7838038, -2.195631, 0, 1, 0.2784314, 1,
-0.2876863, -0.42123, -2.167615, 0, 1, 0.2862745, 1,
-0.2867979, -0.8041593, -2.236436, 0, 1, 0.2901961, 1,
-0.2851251, -1.930889, -2.887974, 0, 1, 0.2980392, 1,
-0.2846143, 0.6674223, 0.9727585, 0, 1, 0.3058824, 1,
-0.2825451, 1.148703, 1.067273, 0, 1, 0.3098039, 1,
-0.2815737, 0.06631161, -1.597059, 0, 1, 0.3176471, 1,
-0.2795347, -0.0212849, -3.912457, 0, 1, 0.3215686, 1,
-0.2786985, -0.5735178, -1.913046, 0, 1, 0.3294118, 1,
-0.2784581, 1.419828, -0.9371479, 0, 1, 0.3333333, 1,
-0.27146, -0.06532142, -2.738842, 0, 1, 0.3411765, 1,
-0.2692638, 1.062754, -0.2120623, 0, 1, 0.345098, 1,
-0.2683245, -0.2746848, -1.839058, 0, 1, 0.3529412, 1,
-0.2658499, 0.1150283, -1.822922, 0, 1, 0.3568628, 1,
-0.2570125, -1.987004, -1.786599, 0, 1, 0.3647059, 1,
-0.2566263, 0.4333802, 0.7777935, 0, 1, 0.3686275, 1,
-0.2555733, -0.8826104, -1.601759, 0, 1, 0.3764706, 1,
-0.2546405, -0.7708197, -3.173062, 0, 1, 0.3803922, 1,
-0.2531502, -1.193201, -3.902407, 0, 1, 0.3882353, 1,
-0.2514824, 0.2876083, -0.6685858, 0, 1, 0.3921569, 1,
-0.2509267, 0.7130478, -0.9947059, 0, 1, 0.4, 1,
-0.2502992, 0.8398226, 0.3442173, 0, 1, 0.4078431, 1,
-0.2496281, -1.30654, -2.24686, 0, 1, 0.4117647, 1,
-0.2493133, 0.08425386, 1.3066, 0, 1, 0.4196078, 1,
-0.2390402, -1.079328, -3.187844, 0, 1, 0.4235294, 1,
-0.232926, -1.17313, -3.250656, 0, 1, 0.4313726, 1,
-0.2315869, 0.5800323, 0.8195147, 0, 1, 0.4352941, 1,
-0.2300518, 0.03092171, -0.7468402, 0, 1, 0.4431373, 1,
-0.2276762, 0.1942849, 1.14137, 0, 1, 0.4470588, 1,
-0.2266846, -1.714063, -3.810715, 0, 1, 0.454902, 1,
-0.2258767, -0.30508, -2.559739, 0, 1, 0.4588235, 1,
-0.223297, -1.189902, -3.874409, 0, 1, 0.4666667, 1,
-0.2223464, -2.570249, -3.269643, 0, 1, 0.4705882, 1,
-0.2218976, -0.05927803, -2.96819, 0, 1, 0.4784314, 1,
-0.2217005, -0.9770105, -3.406465, 0, 1, 0.4823529, 1,
-0.2156151, -0.0466998, -1.952333, 0, 1, 0.4901961, 1,
-0.2132182, -1.097302, -2.365931, 0, 1, 0.4941176, 1,
-0.2089972, -0.1060932, -2.66141, 0, 1, 0.5019608, 1,
-0.199744, -0.450869, -1.70051, 0, 1, 0.509804, 1,
-0.1928124, 0.3422909, -1.387359, 0, 1, 0.5137255, 1,
-0.1841445, 1.322043, 1.356062, 0, 1, 0.5215687, 1,
-0.182936, 0.9818686, 0.8418745, 0, 1, 0.5254902, 1,
-0.1806776, 1.006183, -0.2025447, 0, 1, 0.5333334, 1,
-0.1787706, -1.24469, -3.999916, 0, 1, 0.5372549, 1,
-0.1780547, 1.683305, -1.745451, 0, 1, 0.5450981, 1,
-0.176608, -1.017156, -4.370197, 0, 1, 0.5490196, 1,
-0.1693643, -1.189683, -3.502072, 0, 1, 0.5568628, 1,
-0.1677939, 0.2836163, -1.100163, 0, 1, 0.5607843, 1,
-0.1677352, -0.8233942, -2.320386, 0, 1, 0.5686275, 1,
-0.1671464, -1.829119, -3.84169, 0, 1, 0.572549, 1,
-0.1627099, 1.426834, 0.07761731, 0, 1, 0.5803922, 1,
-0.1595442, -0.9059498, -2.485462, 0, 1, 0.5843138, 1,
-0.1553008, 1.717339, 0.2658372, 0, 1, 0.5921569, 1,
-0.1545267, -0.3252057, -1.609752, 0, 1, 0.5960785, 1,
-0.1539498, 1.47664, -1.396739, 0, 1, 0.6039216, 1,
-0.1516143, -0.7941858, -2.661406, 0, 1, 0.6117647, 1,
-0.1503028, -1.061864, -2.368052, 0, 1, 0.6156863, 1,
-0.1463926, 0.6980117, 0.4514801, 0, 1, 0.6235294, 1,
-0.1461762, -0.09059329, -1.466338, 0, 1, 0.627451, 1,
-0.1432618, -0.5941531, -2.640629, 0, 1, 0.6352941, 1,
-0.1411708, 1.11557, 0.203393, 0, 1, 0.6392157, 1,
-0.1368328, -0.592221, -5.093414, 0, 1, 0.6470588, 1,
-0.1361323, 0.2959208, 0.7056733, 0, 1, 0.6509804, 1,
-0.122924, -0.4387988, -2.760152, 0, 1, 0.6588235, 1,
-0.1226619, -0.03450873, -0.9412672, 0, 1, 0.6627451, 1,
-0.1220143, 0.5008025, -0.8964763, 0, 1, 0.6705883, 1,
-0.1197864, -0.5803132, -1.833658, 0, 1, 0.6745098, 1,
-0.1183712, 2.967147, 0.9118995, 0, 1, 0.682353, 1,
-0.1079685, 0.466329, -0.6545249, 0, 1, 0.6862745, 1,
-0.1072076, 0.5532506, 1.267889, 0, 1, 0.6941177, 1,
-0.1024199, -0.7637003, -1.91536, 0, 1, 0.7019608, 1,
-0.09517197, -0.3893726, -5.15772, 0, 1, 0.7058824, 1,
-0.0934481, -0.5124473, -3.054944, 0, 1, 0.7137255, 1,
-0.0819693, 1.090889, 0.2792767, 0, 1, 0.7176471, 1,
-0.07876156, 0.6419025, -1.185952, 0, 1, 0.7254902, 1,
-0.07350421, 0.2397337, 0.05468407, 0, 1, 0.7294118, 1,
-0.06862833, 0.1363081, -0.7372715, 0, 1, 0.7372549, 1,
-0.06646571, 1.201051, 0.2066016, 0, 1, 0.7411765, 1,
-0.06639373, 1.019775, 0.3574743, 0, 1, 0.7490196, 1,
-0.06577421, -1.042284, -3.766812, 0, 1, 0.7529412, 1,
-0.06113918, 2.620682, 0.2504764, 0, 1, 0.7607843, 1,
-0.05829927, -1.364139, -4.00376, 0, 1, 0.7647059, 1,
-0.0564202, -1.178953, -3.387775, 0, 1, 0.772549, 1,
-0.0520641, -0.6556609, -3.597977, 0, 1, 0.7764706, 1,
-0.05009213, -0.08195053, -1.844466, 0, 1, 0.7843137, 1,
-0.04840732, -1.134445, -4.016347, 0, 1, 0.7882353, 1,
-0.04774673, -0.1979627, -3.871095, 0, 1, 0.7960784, 1,
-0.04690912, -1.110547, -3.575959, 0, 1, 0.8039216, 1,
-0.04316969, 0.3086842, -0.486196, 0, 1, 0.8078431, 1,
-0.04249966, 0.188672, -0.3275947, 0, 1, 0.8156863, 1,
-0.04125717, 0.8378064, -0.1969198, 0, 1, 0.8196079, 1,
-0.04099193, 1.21651, -0.2064958, 0, 1, 0.827451, 1,
-0.03548307, -1.265954, -4.068504, 0, 1, 0.8313726, 1,
-0.03333202, 0.5104052, 1.038965, 0, 1, 0.8392157, 1,
-0.03322867, 0.7713595, 1.0587, 0, 1, 0.8431373, 1,
-0.02746677, 1.643249, 0.4990525, 0, 1, 0.8509804, 1,
-0.02656591, -0.998598, -4.036655, 0, 1, 0.854902, 1,
-0.02076269, 0.4373594, -1.004885, 0, 1, 0.8627451, 1,
-0.01773303, -1.105805, -2.952736, 0, 1, 0.8666667, 1,
-0.01685422, 0.3050818, 1.432227, 0, 1, 0.8745098, 1,
-0.01591064, -0.8681929, -2.310473, 0, 1, 0.8784314, 1,
-0.01133189, -0.8147378, -3.957527, 0, 1, 0.8862745, 1,
-0.007670444, -0.2845397, -3.43423, 0, 1, 0.8901961, 1,
-0.005351535, 0.4712394, -0.05145421, 0, 1, 0.8980392, 1,
-0.002694385, 1.606965, -0.562423, 0, 1, 0.9058824, 1,
0.01130697, 1.509739, -0.8098516, 0, 1, 0.9098039, 1,
0.01835937, -0.318124, 4.546972, 0, 1, 0.9176471, 1,
0.02467333, -1.850985, 3.435615, 0, 1, 0.9215686, 1,
0.02728865, 0.7238529, -0.3414692, 0, 1, 0.9294118, 1,
0.02761733, -0.1386874, 3.598317, 0, 1, 0.9333333, 1,
0.02852467, -1.109836, 3.697059, 0, 1, 0.9411765, 1,
0.02941338, 0.8709525, 1.640865, 0, 1, 0.945098, 1,
0.0294875, 0.8949993, -0.3813043, 0, 1, 0.9529412, 1,
0.03386143, 0.8044983, -0.1186935, 0, 1, 0.9568627, 1,
0.03519482, 1.01739, -0.8788821, 0, 1, 0.9647059, 1,
0.03528703, 0.1744413, 1.804469, 0, 1, 0.9686275, 1,
0.03608218, 0.6404055, 0.7976776, 0, 1, 0.9764706, 1,
0.03716112, -1.433855, 3.32396, 0, 1, 0.9803922, 1,
0.03774166, -0.2739428, 3.379188, 0, 1, 0.9882353, 1,
0.04020299, -0.7769662, 5.044553, 0, 1, 0.9921569, 1,
0.04048392, -1.102413, 3.087172, 0, 1, 1, 1,
0.04525126, 2.107942, -0.4267965, 0, 0.9921569, 1, 1,
0.04592716, -1.013867, 2.389294, 0, 0.9882353, 1, 1,
0.05287249, -0.5794879, 3.572152, 0, 0.9803922, 1, 1,
0.05326441, -0.3309717, 3.730088, 0, 0.9764706, 1, 1,
0.05545927, -0.6163286, 3.222288, 0, 0.9686275, 1, 1,
0.05699607, 1.011296, 1.457155, 0, 0.9647059, 1, 1,
0.05884487, -0.06449911, 0.8225601, 0, 0.9568627, 1, 1,
0.06092342, -0.6059406, 2.880935, 0, 0.9529412, 1, 1,
0.06418394, -0.7155443, 3.323232, 0, 0.945098, 1, 1,
0.06624295, 1.294489, -0.143061, 0, 0.9411765, 1, 1,
0.06660924, 1.277564, 0.9093292, 0, 0.9333333, 1, 1,
0.06787075, 0.419586, 1.051584, 0, 0.9294118, 1, 1,
0.07509566, 0.6956249, 0.5993853, 0, 0.9215686, 1, 1,
0.09125286, 2.388425, -1.241322, 0, 0.9176471, 1, 1,
0.0925934, 0.3560796, 0.1148272, 0, 0.9098039, 1, 1,
0.09541179, 2.192212, 0.1022839, 0, 0.9058824, 1, 1,
0.09921409, -0.3500585, 2.571633, 0, 0.8980392, 1, 1,
0.09953276, -1.833572, 3.887527, 0, 0.8901961, 1, 1,
0.1114646, -0.6352971, 2.714127, 0, 0.8862745, 1, 1,
0.114613, -0.5399601, 5.407911, 0, 0.8784314, 1, 1,
0.1160495, 0.08397273, 1.504369, 0, 0.8745098, 1, 1,
0.1172122, 1.024445, -0.246665, 0, 0.8666667, 1, 1,
0.1221108, -0.05893486, 1.284005, 0, 0.8627451, 1, 1,
0.124077, 0.7757977, 0.5000606, 0, 0.854902, 1, 1,
0.1245832, -1.075392, 3.11067, 0, 0.8509804, 1, 1,
0.126631, -1.326885, 3.719099, 0, 0.8431373, 1, 1,
0.1321867, 0.2596517, 0.6506957, 0, 0.8392157, 1, 1,
0.1344886, 1.13796, -0.8038025, 0, 0.8313726, 1, 1,
0.1377614, 0.2512963, 0.3834788, 0, 0.827451, 1, 1,
0.1389061, 0.02016869, 2.858076, 0, 0.8196079, 1, 1,
0.1391475, -1.000349, 4.381061, 0, 0.8156863, 1, 1,
0.1421165, -0.5397717, 2.629, 0, 0.8078431, 1, 1,
0.1433045, -1.074502, 3.124838, 0, 0.8039216, 1, 1,
0.1534707, 0.5385532, -0.3130202, 0, 0.7960784, 1, 1,
0.1566575, -0.4487779, 3.307521, 0, 0.7882353, 1, 1,
0.1627413, -0.09922773, 0.548941, 0, 0.7843137, 1, 1,
0.1657589, -0.03304018, 1.202949, 0, 0.7764706, 1, 1,
0.165867, 1.318689, -0.5917732, 0, 0.772549, 1, 1,
0.1666053, -0.4860966, 2.643082, 0, 0.7647059, 1, 1,
0.167682, -1.485823, 2.467188, 0, 0.7607843, 1, 1,
0.1685412, -1.499959, 1.940145, 0, 0.7529412, 1, 1,
0.1743023, -0.8480047, 3.557508, 0, 0.7490196, 1, 1,
0.1766115, -0.269648, 2.834975, 0, 0.7411765, 1, 1,
0.1780402, -0.3011634, 1.742588, 0, 0.7372549, 1, 1,
0.183434, -0.2164878, 3.188576, 0, 0.7294118, 1, 1,
0.1864002, -0.6463901, 4.118781, 0, 0.7254902, 1, 1,
0.1981079, -1.872397, 4.84849, 0, 0.7176471, 1, 1,
0.1988491, -0.02424628, 1.74991, 0, 0.7137255, 1, 1,
0.2004761, 0.914919, 0.7329161, 0, 0.7058824, 1, 1,
0.2015174, 0.26605, 0.6360103, 0, 0.6980392, 1, 1,
0.2030988, -0.02066553, 3.114454, 0, 0.6941177, 1, 1,
0.2037839, -0.9507327, 2.384303, 0, 0.6862745, 1, 1,
0.2085638, -0.004673158, -1.05944, 0, 0.682353, 1, 1,
0.2131448, -1.866431, 4.028847, 0, 0.6745098, 1, 1,
0.2203239, -0.5793458, 2.861643, 0, 0.6705883, 1, 1,
0.2226488, 0.6758357, -0.9265556, 0, 0.6627451, 1, 1,
0.2250176, 0.3282014, 1.323441, 0, 0.6588235, 1, 1,
0.2251249, -2.308049, 3.089793, 0, 0.6509804, 1, 1,
0.225603, 0.6816014, -0.3021859, 0, 0.6470588, 1, 1,
0.2291647, 0.39576, -0.5162347, 0, 0.6392157, 1, 1,
0.2299462, 1.87585, 0.6233076, 0, 0.6352941, 1, 1,
0.2301638, 0.7202765, -0.5144135, 0, 0.627451, 1, 1,
0.2325184, 1.480255, 0.3765061, 0, 0.6235294, 1, 1,
0.2334695, 0.5480106, -1.130666, 0, 0.6156863, 1, 1,
0.2337885, 1.188141, 0.3259229, 0, 0.6117647, 1, 1,
0.2339831, -0.7331019, 2.207497, 0, 0.6039216, 1, 1,
0.2405095, -0.415766, 3.682148, 0, 0.5960785, 1, 1,
0.2441895, 2.18788, -2.372448, 0, 0.5921569, 1, 1,
0.2477497, -0.009611459, 2.377284, 0, 0.5843138, 1, 1,
0.2512426, -0.7191441, 2.77381, 0, 0.5803922, 1, 1,
0.2514641, -0.8532054, 3.779839, 0, 0.572549, 1, 1,
0.2553704, 1.047517, -0.9658964, 0, 0.5686275, 1, 1,
0.2582425, 0.4895421, -2.4596, 0, 0.5607843, 1, 1,
0.2584631, 1.15667, -0.4894341, 0, 0.5568628, 1, 1,
0.2587762, 0.01201643, 1.511475, 0, 0.5490196, 1, 1,
0.2644781, 0.7932467, 0.09180457, 0, 0.5450981, 1, 1,
0.2667845, 0.456775, 0.902355, 0, 0.5372549, 1, 1,
0.267399, 0.3334028, 0.8072906, 0, 0.5333334, 1, 1,
0.2710987, 0.2815072, 1.032755, 0, 0.5254902, 1, 1,
0.2734437, 0.3427903, 1.114166, 0, 0.5215687, 1, 1,
0.278176, -0.06633658, 1.886472, 0, 0.5137255, 1, 1,
0.2784912, -1.241661, 2.049706, 0, 0.509804, 1, 1,
0.2817269, -0.8212075, 1.875394, 0, 0.5019608, 1, 1,
0.2820444, 1.458446, -1.021539, 0, 0.4941176, 1, 1,
0.2828779, 0.07932823, 2.214932, 0, 0.4901961, 1, 1,
0.2845839, 0.303597, -0.3597851, 0, 0.4823529, 1, 1,
0.2851445, 0.3140984, -0.9155445, 0, 0.4784314, 1, 1,
0.2890609, -0.344096, 1.449381, 0, 0.4705882, 1, 1,
0.2966346, 1.446108, -0.7612405, 0, 0.4666667, 1, 1,
0.2976024, 0.2203069, -0.5267848, 0, 0.4588235, 1, 1,
0.2988372, -2.028152, 4.494911, 0, 0.454902, 1, 1,
0.2994569, 0.8058702, 0.6417833, 0, 0.4470588, 1, 1,
0.3041613, 0.9566065, -0.5770254, 0, 0.4431373, 1, 1,
0.3043813, -0.0196106, 3.953465, 0, 0.4352941, 1, 1,
0.3059835, -1.613208, 1.238182, 0, 0.4313726, 1, 1,
0.3061196, -0.01876924, 2.14035, 0, 0.4235294, 1, 1,
0.308993, 1.618166, -0.1032231, 0, 0.4196078, 1, 1,
0.3094247, 1.060612, -0.5796723, 0, 0.4117647, 1, 1,
0.3123466, 1.058384, 1.712169, 0, 0.4078431, 1, 1,
0.312537, -0.101149, 0.6181805, 0, 0.4, 1, 1,
0.3147126, 1.943, -1.617992, 0, 0.3921569, 1, 1,
0.3149599, -1.385255, 0.3368392, 0, 0.3882353, 1, 1,
0.3152546, -0.733423, 0.146035, 0, 0.3803922, 1, 1,
0.3171513, -1.298488, 3.294086, 0, 0.3764706, 1, 1,
0.3209507, 1.066205, -0.1215108, 0, 0.3686275, 1, 1,
0.3236393, 0.1488444, 2.693997, 0, 0.3647059, 1, 1,
0.3238794, -0.6077615, 3.278693, 0, 0.3568628, 1, 1,
0.3243467, 0.7690115, -0.4426769, 0, 0.3529412, 1, 1,
0.3256987, -0.8289686, 3.150941, 0, 0.345098, 1, 1,
0.332339, -0.6709604, 1.698352, 0, 0.3411765, 1, 1,
0.3329246, -0.4490137, 1.860804, 0, 0.3333333, 1, 1,
0.3368073, 0.2312455, 2.206275, 0, 0.3294118, 1, 1,
0.3371591, -1.008983, 4.437459, 0, 0.3215686, 1, 1,
0.3383628, 1.188705, 1.206627, 0, 0.3176471, 1, 1,
0.3395064, -1.111675, 3.057919, 0, 0.3098039, 1, 1,
0.3405217, -0.218778, 3.965072, 0, 0.3058824, 1, 1,
0.3421023, -2.482256, 1.656504, 0, 0.2980392, 1, 1,
0.3426898, 0.2072495, 1.738155, 0, 0.2901961, 1, 1,
0.3455962, 0.680791, -0.8880173, 0, 0.2862745, 1, 1,
0.3458623, -0.3204345, 3.615683, 0, 0.2784314, 1, 1,
0.3522702, -0.4040643, 2.82011, 0, 0.2745098, 1, 1,
0.3570301, -0.7285697, 1.543641, 0, 0.2666667, 1, 1,
0.3592606, -0.5849305, 2.927763, 0, 0.2627451, 1, 1,
0.3666809, 0.8282965, -1.027915, 0, 0.254902, 1, 1,
0.3697592, 0.08404098, 1.626912, 0, 0.2509804, 1, 1,
0.370135, 1.059855, 1.060379, 0, 0.2431373, 1, 1,
0.3724653, 1.278304, 0.574487, 0, 0.2392157, 1, 1,
0.3749413, -1.512209, 3.216365, 0, 0.2313726, 1, 1,
0.375511, -0.5390914, 1.882781, 0, 0.227451, 1, 1,
0.3755196, 0.5111496, 0.0530031, 0, 0.2196078, 1, 1,
0.375536, -0.2949435, 3.43603, 0, 0.2156863, 1, 1,
0.3771183, 1.247787, 1.321065, 0, 0.2078431, 1, 1,
0.3773266, 0.1900198, 0.3461386, 0, 0.2039216, 1, 1,
0.3801092, 0.5312911, 1.024833, 0, 0.1960784, 1, 1,
0.3808136, -0.7652083, 2.013604, 0, 0.1882353, 1, 1,
0.3877546, -1.359913, 3.872939, 0, 0.1843137, 1, 1,
0.3882111, 2.34872, 1.405598, 0, 0.1764706, 1, 1,
0.391764, -0.0946992, 1.572447, 0, 0.172549, 1, 1,
0.3967081, 1.038451, 0.4295031, 0, 0.1647059, 1, 1,
0.4002881, -0.07654672, 1.088221, 0, 0.1607843, 1, 1,
0.4006602, 0.06655109, 1.847214, 0, 0.1529412, 1, 1,
0.4011061, 1.761472, -0.3463628, 0, 0.1490196, 1, 1,
0.4017524, 1.789926, 1.100475, 0, 0.1411765, 1, 1,
0.4046517, 1.367989, -1.08738, 0, 0.1372549, 1, 1,
0.4048187, 0.04500575, 1.898921, 0, 0.1294118, 1, 1,
0.40985, 1.88465, 0.2069659, 0, 0.1254902, 1, 1,
0.4111282, 1.364607, 0.9893591, 0, 0.1176471, 1, 1,
0.4117782, -1.350257, 3.916337, 0, 0.1137255, 1, 1,
0.4157385, 0.6547669, 0.2394352, 0, 0.1058824, 1, 1,
0.41691, -1.997133, 2.72373, 0, 0.09803922, 1, 1,
0.4170296, -0.2307996, 1.692631, 0, 0.09411765, 1, 1,
0.4174625, -0.551027, 2.253988, 0, 0.08627451, 1, 1,
0.4213648, -1.338773, 4.007312, 0, 0.08235294, 1, 1,
0.423453, 0.2014653, 0.8078178, 0, 0.07450981, 1, 1,
0.4261107, -1.296085, 1.907065, 0, 0.07058824, 1, 1,
0.4263272, -0.08912182, 2.583961, 0, 0.0627451, 1, 1,
0.4278731, -0.1592227, 2.091989, 0, 0.05882353, 1, 1,
0.4280844, 0.06236484, 2.297444, 0, 0.05098039, 1, 1,
0.4323905, 1.454335, 0.5670516, 0, 0.04705882, 1, 1,
0.4324622, -0.09266682, 1.971961, 0, 0.03921569, 1, 1,
0.4363685, 0.5536129, 0.9172804, 0, 0.03529412, 1, 1,
0.4364252, -1.17278, 2.718078, 0, 0.02745098, 1, 1,
0.4369384, 1.246038, 1.451611, 0, 0.02352941, 1, 1,
0.4430981, 0.2033961, 1.498061, 0, 0.01568628, 1, 1,
0.4480076, -1.236305, 4.14291, 0, 0.01176471, 1, 1,
0.4482851, -0.2469554, 1.461244, 0, 0.003921569, 1, 1,
0.4527327, -1.035785, 2.236944, 0.003921569, 0, 1, 1,
0.4600532, -1.085916, 2.544968, 0.007843138, 0, 1, 1,
0.46326, 1.703596, -0.1261092, 0.01568628, 0, 1, 1,
0.4745326, -0.7166466, 1.342424, 0.01960784, 0, 1, 1,
0.4816129, -0.561517, 2.942922, 0.02745098, 0, 1, 1,
0.4850847, -1.296019, 2.692296, 0.03137255, 0, 1, 1,
0.4863253, 1.483896, 1.077612, 0.03921569, 0, 1, 1,
0.4883969, -0.7049889, -0.1822944, 0.04313726, 0, 1, 1,
0.4896843, 1.286155, 1.21634, 0.05098039, 0, 1, 1,
0.4925517, 0.1648391, 0.06239671, 0.05490196, 0, 1, 1,
0.4955932, -0.3689025, 3.111277, 0.0627451, 0, 1, 1,
0.4984697, -0.2392279, 3.490664, 0.06666667, 0, 1, 1,
0.5018844, -0.003402257, 0.811107, 0.07450981, 0, 1, 1,
0.504364, 2.253061, 0.4807125, 0.07843138, 0, 1, 1,
0.5045457, 1.077708, 0.8438161, 0.08627451, 0, 1, 1,
0.5079229, 3.089614, -0.5307495, 0.09019608, 0, 1, 1,
0.5118678, 1.507645, 0.127853, 0.09803922, 0, 1, 1,
0.5142689, 0.7035193, 1.344638, 0.1058824, 0, 1, 1,
0.5145326, -1.238798, 3.263025, 0.1098039, 0, 1, 1,
0.5150999, -0.7836365, 2.554238, 0.1176471, 0, 1, 1,
0.5178661, -0.3439558, 2.938334, 0.1215686, 0, 1, 1,
0.5229295, -2.884684, 3.740439, 0.1294118, 0, 1, 1,
0.5265769, -0.0377519, 0.9623249, 0.1333333, 0, 1, 1,
0.5283086, 0.414174, -1.267477, 0.1411765, 0, 1, 1,
0.5286313, 2.43832, -1.09429, 0.145098, 0, 1, 1,
0.5293667, 1.171933, 0.9010254, 0.1529412, 0, 1, 1,
0.529769, -0.3034064, 3.296385, 0.1568628, 0, 1, 1,
0.5314076, 0.1247849, 0.6962923, 0.1647059, 0, 1, 1,
0.5483663, -0.01301957, 2.860246, 0.1686275, 0, 1, 1,
0.5499874, 0.322829, -0.49302, 0.1764706, 0, 1, 1,
0.5519218, -0.1622608, 1.841721, 0.1803922, 0, 1, 1,
0.5557669, -0.3596228, 1.614384, 0.1882353, 0, 1, 1,
0.5564625, 0.5941594, 1.496258, 0.1921569, 0, 1, 1,
0.5565798, 0.5347756, -0.6117024, 0.2, 0, 1, 1,
0.5622187, 0.665945, 1.618905, 0.2078431, 0, 1, 1,
0.5748937, 1.085248, -0.3151031, 0.2117647, 0, 1, 1,
0.5778451, -0.4078659, 2.167604, 0.2196078, 0, 1, 1,
0.5800595, 0.06456541, 0.3348897, 0.2235294, 0, 1, 1,
0.581133, -0.9502407, 1.675568, 0.2313726, 0, 1, 1,
0.5845743, 0.6550713, 0.7744054, 0.2352941, 0, 1, 1,
0.5865201, -1.094382, 0.6247704, 0.2431373, 0, 1, 1,
0.5878556, 0.8297089, -0.7524794, 0.2470588, 0, 1, 1,
0.5880272, 0.3678687, 2.155057, 0.254902, 0, 1, 1,
0.5915684, 0.8948067, 1.945042, 0.2588235, 0, 1, 1,
0.5985289, 0.05734298, 2.519387, 0.2666667, 0, 1, 1,
0.6024446, 0.3318864, 2.744266, 0.2705882, 0, 1, 1,
0.6084049, 0.839249, 1.498246, 0.2784314, 0, 1, 1,
0.6120197, 0.177402, 1.907105, 0.282353, 0, 1, 1,
0.6232242, 1.61291, -0.6393918, 0.2901961, 0, 1, 1,
0.6253774, -0.4508942, 3.709936, 0.2941177, 0, 1, 1,
0.6362858, 0.3806909, 1.083457, 0.3019608, 0, 1, 1,
0.6377186, 1.806749, 0.7024788, 0.3098039, 0, 1, 1,
0.639307, -1.935795, 2.360454, 0.3137255, 0, 1, 1,
0.6398863, 1.414451, 1.456752, 0.3215686, 0, 1, 1,
0.6451052, 0.4438594, 0.7621585, 0.3254902, 0, 1, 1,
0.6453755, -1.365573, 2.531325, 0.3333333, 0, 1, 1,
0.6457838, -1.285475, 2.567952, 0.3372549, 0, 1, 1,
0.6463596, 1.825593, 0.1712152, 0.345098, 0, 1, 1,
0.6471362, -0.05066467, 1.653822, 0.3490196, 0, 1, 1,
0.6543443, 0.8028957, 0.8960441, 0.3568628, 0, 1, 1,
0.6544858, 0.04271413, 2.172492, 0.3607843, 0, 1, 1,
0.6556495, 0.4571007, 0.7174199, 0.3686275, 0, 1, 1,
0.6600852, -0.5337713, 0.3312018, 0.372549, 0, 1, 1,
0.6691805, -0.6735179, 1.439882, 0.3803922, 0, 1, 1,
0.6702582, -0.0121623, -0.195507, 0.3843137, 0, 1, 1,
0.6741798, 0.5770192, 1.666838, 0.3921569, 0, 1, 1,
0.675463, -0.1801201, 1.967871, 0.3960784, 0, 1, 1,
0.6844392, 0.6171312, 0.3382528, 0.4039216, 0, 1, 1,
0.6864883, -0.2972134, -0.2348027, 0.4117647, 0, 1, 1,
0.6872867, 1.435822, -0.6245316, 0.4156863, 0, 1, 1,
0.6902811, 1.124391, 0.6862633, 0.4235294, 0, 1, 1,
0.691039, -0.1446974, 1.842573, 0.427451, 0, 1, 1,
0.692648, -0.2968413, 3.201713, 0.4352941, 0, 1, 1,
0.6927109, 0.005512469, 0.5197551, 0.4392157, 0, 1, 1,
0.693783, 1.448669, -0.3440102, 0.4470588, 0, 1, 1,
0.7051504, 0.6841041, -0.1526148, 0.4509804, 0, 1, 1,
0.7075766, -0.001588204, 0.7206148, 0.4588235, 0, 1, 1,
0.7080862, -2.462817, 1.62336, 0.4627451, 0, 1, 1,
0.7092301, 0.4931983, 1.758412, 0.4705882, 0, 1, 1,
0.7122135, -0.501827, 2.606539, 0.4745098, 0, 1, 1,
0.7171031, -0.4616429, 1.721284, 0.4823529, 0, 1, 1,
0.7190146, 0.5665784, 1.740399, 0.4862745, 0, 1, 1,
0.7217285, -0.2870759, 2.498677, 0.4941176, 0, 1, 1,
0.7217626, 1.298307, 0.7663783, 0.5019608, 0, 1, 1,
0.7219009, 1.934494, 0.3256324, 0.5058824, 0, 1, 1,
0.7225884, 0.7212828, 2.833125, 0.5137255, 0, 1, 1,
0.7230455, 0.7425564, 0.2688996, 0.5176471, 0, 1, 1,
0.7282412, 0.8975179, 1.690211, 0.5254902, 0, 1, 1,
0.7397513, -0.7206835, 2.383924, 0.5294118, 0, 1, 1,
0.7473057, 1.665711, 1.351231, 0.5372549, 0, 1, 1,
0.7485236, 1.774835, -0.2018477, 0.5411765, 0, 1, 1,
0.7565465, -1.029566, 3.451318, 0.5490196, 0, 1, 1,
0.762183, 1.389527, -1.232787, 0.5529412, 0, 1, 1,
0.7632481, -0.1614958, 0.5919943, 0.5607843, 0, 1, 1,
0.76516, -0.1863404, 1.911214, 0.5647059, 0, 1, 1,
0.7661956, 1.031469, 2.625417, 0.572549, 0, 1, 1,
0.7696618, -1.466884, 2.791497, 0.5764706, 0, 1, 1,
0.7751628, -0.1410335, -0.1296093, 0.5843138, 0, 1, 1,
0.7831512, -0.6145966, 1.893535, 0.5882353, 0, 1, 1,
0.7861223, -0.3433638, -0.7910224, 0.5960785, 0, 1, 1,
0.7884195, 1.484687, 0.9394329, 0.6039216, 0, 1, 1,
0.7998725, 0.8735121, 0.1597064, 0.6078432, 0, 1, 1,
0.8021527, 1.091728, -0.008011999, 0.6156863, 0, 1, 1,
0.8026525, -0.8983923, 3.851488, 0.6196079, 0, 1, 1,
0.8070312, -0.8944443, 3.002749, 0.627451, 0, 1, 1,
0.8091106, -1.168335, 3.628888, 0.6313726, 0, 1, 1,
0.8099427, -1.458644, 4.356617, 0.6392157, 0, 1, 1,
0.8101733, -0.3321137, 1.935167, 0.6431373, 0, 1, 1,
0.8126714, -0.3006382, 1.225964, 0.6509804, 0, 1, 1,
0.8144736, -0.1113013, 2.36398, 0.654902, 0, 1, 1,
0.8149031, 0.9052813, 0.98984, 0.6627451, 0, 1, 1,
0.8176218, 1.485279, 1.161668, 0.6666667, 0, 1, 1,
0.8210733, -0.1316764, 2.001309, 0.6745098, 0, 1, 1,
0.8238295, -0.6698301, 3.001253, 0.6784314, 0, 1, 1,
0.8250921, -0.02941518, 1.576592, 0.6862745, 0, 1, 1,
0.8355644, 1.665905, -0.7357365, 0.6901961, 0, 1, 1,
0.8356392, 2.169206, -0.1256298, 0.6980392, 0, 1, 1,
0.8390468, 0.723029, 2.110741, 0.7058824, 0, 1, 1,
0.8397902, 1.697311, -0.6508355, 0.7098039, 0, 1, 1,
0.842549, -1.505679, 4.573181, 0.7176471, 0, 1, 1,
0.8448956, -0.1625014, 3.58167, 0.7215686, 0, 1, 1,
0.8472902, -0.004012982, 2.798599, 0.7294118, 0, 1, 1,
0.8513103, -1.093606, 1.35127, 0.7333333, 0, 1, 1,
0.8592358, 0.1010785, 0.6240522, 0.7411765, 0, 1, 1,
0.8603978, 0.2159553, 3.039944, 0.7450981, 0, 1, 1,
0.8631561, 0.9666566, 0.7097441, 0.7529412, 0, 1, 1,
0.8633351, -0.386214, 2.179124, 0.7568628, 0, 1, 1,
0.8655435, -0.5285135, 1.601265, 0.7647059, 0, 1, 1,
0.8658525, 0.1828095, 0.1615155, 0.7686275, 0, 1, 1,
0.8719526, 0.2409904, 2.598283, 0.7764706, 0, 1, 1,
0.880046, -1.427276, 2.508399, 0.7803922, 0, 1, 1,
0.8825033, -2.212994, 3.573356, 0.7882353, 0, 1, 1,
0.8836638, -1.967921, 1.147177, 0.7921569, 0, 1, 1,
0.884173, -0.9991304, 2.760817, 0.8, 0, 1, 1,
0.8872547, 0.3510306, 2.374504, 0.8078431, 0, 1, 1,
0.8885989, -0.3005034, 1.669325, 0.8117647, 0, 1, 1,
0.892881, -1.276961, 3.273125, 0.8196079, 0, 1, 1,
0.8937163, 0.7204698, 0.09594516, 0.8235294, 0, 1, 1,
0.8951908, 0.3671986, 1.776038, 0.8313726, 0, 1, 1,
0.8953263, -0.4872412, 0.6057232, 0.8352941, 0, 1, 1,
0.9032103, 0.866157, -0.3132862, 0.8431373, 0, 1, 1,
0.916544, -0.2904695, 2.173117, 0.8470588, 0, 1, 1,
0.9267919, -1.700546, 1.847619, 0.854902, 0, 1, 1,
0.9331639, 1.731319, 0.519297, 0.8588235, 0, 1, 1,
0.9351652, -0.7400506, 0.0872852, 0.8666667, 0, 1, 1,
0.9361501, 0.1954155, 1.852275, 0.8705882, 0, 1, 1,
0.9410785, 1.095737, 0.799261, 0.8784314, 0, 1, 1,
0.9419793, -1.179327, 2.674007, 0.8823529, 0, 1, 1,
0.9429205, -0.8111151, 1.794027, 0.8901961, 0, 1, 1,
0.9545204, -0.9032449, 3.22299, 0.8941177, 0, 1, 1,
0.9570286, 1.327277, 1.39954, 0.9019608, 0, 1, 1,
0.9596903, 2.041588, 0.8082705, 0.9098039, 0, 1, 1,
0.9609463, -0.9363674, 1.954654, 0.9137255, 0, 1, 1,
0.9626976, 0.06222838, 1.146632, 0.9215686, 0, 1, 1,
0.9636989, 1.319429, 0.6960865, 0.9254902, 0, 1, 1,
0.9646319, 1.393049, 0.02725628, 0.9333333, 0, 1, 1,
0.9759818, 1.382089, 0.2375948, 0.9372549, 0, 1, 1,
0.9766837, -0.7024021, 2.48572, 0.945098, 0, 1, 1,
0.9785615, -0.7337927, 2.910091, 0.9490196, 0, 1, 1,
0.9789304, -1.422997, 3.05566, 0.9568627, 0, 1, 1,
0.9814912, 1.177501, -0.2629789, 0.9607843, 0, 1, 1,
0.9815235, 0.030708, 0.3302768, 0.9686275, 0, 1, 1,
0.9863888, -0.7892053, 1.857277, 0.972549, 0, 1, 1,
0.9961398, 1.743706, 0.7361147, 0.9803922, 0, 1, 1,
0.9980071, 0.8202692, -1.269657, 0.9843137, 0, 1, 1,
1.002261, -1.012339, 3.240957, 0.9921569, 0, 1, 1,
1.009902, 0.2309983, 2.054006, 0.9960784, 0, 1, 1,
1.015162, 0.6206297, 3.478057, 1, 0, 0.9960784, 1,
1.017678, -2.624808, 3.14537, 1, 0, 0.9882353, 1,
1.043731, 0.7599537, 1.987769, 1, 0, 0.9843137, 1,
1.046501, 0.3425619, 1.19276, 1, 0, 0.9764706, 1,
1.047373, 0.7336637, 0.770687, 1, 0, 0.972549, 1,
1.047537, 0.6846526, 2.172861, 1, 0, 0.9647059, 1,
1.061516, 0.5899978, 2.521174, 1, 0, 0.9607843, 1,
1.066389, 0.6909253, 0.9667188, 1, 0, 0.9529412, 1,
1.066524, 1.705966, 1.918457, 1, 0, 0.9490196, 1,
1.066947, -0.5566356, 3.945612, 1, 0, 0.9411765, 1,
1.066947, -0.4377303, -0.06630034, 1, 0, 0.9372549, 1,
1.071303, 0.9642655, 2.339931, 1, 0, 0.9294118, 1,
1.076897, -0.5733765, 1.471471, 1, 0, 0.9254902, 1,
1.079702, 0.2907574, 2.3133, 1, 0, 0.9176471, 1,
1.089422, -0.714038, 2.319205, 1, 0, 0.9137255, 1,
1.096155, 0.8917078, 1.961532, 1, 0, 0.9058824, 1,
1.100274, -2.194113, 3.464059, 1, 0, 0.9019608, 1,
1.111095, 0.6874516, 3.461368, 1, 0, 0.8941177, 1,
1.113662, 1.85689, 0.491048, 1, 0, 0.8862745, 1,
1.126356, 1.053138, 1.897085, 1, 0, 0.8823529, 1,
1.133425, 0.379262, 1.75297, 1, 0, 0.8745098, 1,
1.149389, -0.7580273, 1.547423, 1, 0, 0.8705882, 1,
1.151512, 0.3204964, 0.6282358, 1, 0, 0.8627451, 1,
1.15225, -0.7405459, 2.956084, 1, 0, 0.8588235, 1,
1.161837, 0.555186, 1.255571, 1, 0, 0.8509804, 1,
1.164588, -0.4805188, 1.74802, 1, 0, 0.8470588, 1,
1.166179, -2.501956, 1.811046, 1, 0, 0.8392157, 1,
1.168535, -0.3728733, 1.70294, 1, 0, 0.8352941, 1,
1.181874, 1.123304, 0.4721057, 1, 0, 0.827451, 1,
1.188447, 1.238505, 1.45007, 1, 0, 0.8235294, 1,
1.197989, -0.8953061, 0.4181931, 1, 0, 0.8156863, 1,
1.198248, 2.213356, 0.4003827, 1, 0, 0.8117647, 1,
1.200559, -1.374827, 0.8595608, 1, 0, 0.8039216, 1,
1.20618, 0.2246895, 1.260661, 1, 0, 0.7960784, 1,
1.206981, -0.5169672, 1.527614, 1, 0, 0.7921569, 1,
1.210293, 1.015287, 1.662662, 1, 0, 0.7843137, 1,
1.221035, 0.1954022, 1.708432, 1, 0, 0.7803922, 1,
1.223868, 0.6743713, 1.233351, 1, 0, 0.772549, 1,
1.225898, 1.268856, 0.7305092, 1, 0, 0.7686275, 1,
1.228491, -0.1234687, 2.946694, 1, 0, 0.7607843, 1,
1.2362, -1.151164, 1.431726, 1, 0, 0.7568628, 1,
1.245726, -1.822671, 1.185454, 1, 0, 0.7490196, 1,
1.251136, 0.1854485, 0.9400148, 1, 0, 0.7450981, 1,
1.253135, 0.4380808, 2.295099, 1, 0, 0.7372549, 1,
1.254574, 0.05075968, 0.4063421, 1, 0, 0.7333333, 1,
1.273255, 0.4148666, 1.865556, 1, 0, 0.7254902, 1,
1.282143, -0.5729766, 2.197797, 1, 0, 0.7215686, 1,
1.287668, 0.1335294, 2.33843, 1, 0, 0.7137255, 1,
1.297758, 1.201263, -1.064585, 1, 0, 0.7098039, 1,
1.30066, -0.3278945, 1.361707, 1, 0, 0.7019608, 1,
1.30652, -1.173474, 2.654701, 1, 0, 0.6941177, 1,
1.316851, -1.511533, 3.294024, 1, 0, 0.6901961, 1,
1.320382, -0.468722, 2.051757, 1, 0, 0.682353, 1,
1.324189, -0.6415079, 0.5718758, 1, 0, 0.6784314, 1,
1.327896, -0.3584943, 2.06862, 1, 0, 0.6705883, 1,
1.335685, -0.4425543, 3.21168, 1, 0, 0.6666667, 1,
1.335829, 1.447767, 0.0378747, 1, 0, 0.6588235, 1,
1.336065, -0.402187, 1.473882, 1, 0, 0.654902, 1,
1.339423, -0.6391857, 0.5038757, 1, 0, 0.6470588, 1,
1.340141, 0.2272802, 1.628582, 1, 0, 0.6431373, 1,
1.340961, 0.8917435, 0.2515256, 1, 0, 0.6352941, 1,
1.342658, 0.516601, -0.2948152, 1, 0, 0.6313726, 1,
1.347094, 0.446098, 1.139661, 1, 0, 0.6235294, 1,
1.350647, -0.9132106, 1.253288, 1, 0, 0.6196079, 1,
1.353617, 1.22971, 0.9289306, 1, 0, 0.6117647, 1,
1.367693, 0.03951957, 2.292412, 1, 0, 0.6078432, 1,
1.372271, 0.8779886, 2.640471, 1, 0, 0.6, 1,
1.377667, -1.093673, 3.756363, 1, 0, 0.5921569, 1,
1.379466, 0.7561671, 0.3128709, 1, 0, 0.5882353, 1,
1.383641, 1.72769, 2.387495, 1, 0, 0.5803922, 1,
1.392003, 0.3312556, 1.711895, 1, 0, 0.5764706, 1,
1.397726, -1.141347, 1.138977, 1, 0, 0.5686275, 1,
1.402071, -0.4457653, 2.222037, 1, 0, 0.5647059, 1,
1.407016, -0.04612895, 0.9747289, 1, 0, 0.5568628, 1,
1.407073, -2.386061, 2.307916, 1, 0, 0.5529412, 1,
1.421442, -1.453666, 1.430902, 1, 0, 0.5450981, 1,
1.422413, -1.857194, 2.082016, 1, 0, 0.5411765, 1,
1.422572, 0.4347859, 0.6316473, 1, 0, 0.5333334, 1,
1.433262, -0.7149974, 1.680592, 1, 0, 0.5294118, 1,
1.440536, -0.4258506, 3.293061, 1, 0, 0.5215687, 1,
1.444797, -1.233224, 2.446648, 1, 0, 0.5176471, 1,
1.448567, -0.4618086, 0.6020109, 1, 0, 0.509804, 1,
1.452361, -0.3417757, 2.24044, 1, 0, 0.5058824, 1,
1.459762, 1.143314, -0.6821588, 1, 0, 0.4980392, 1,
1.462912, 0.9636923, 1.67306, 1, 0, 0.4901961, 1,
1.467126, -0.9166391, 1.147537, 1, 0, 0.4862745, 1,
1.468754, 1.511019, 1.059817, 1, 0, 0.4784314, 1,
1.475572, 0.457973, 0.2933356, 1, 0, 0.4745098, 1,
1.482007, -0.5759346, 1.56112, 1, 0, 0.4666667, 1,
1.48287, 1.296419, 1.223909, 1, 0, 0.4627451, 1,
1.495944, 2.036161, 0.8492787, 1, 0, 0.454902, 1,
1.499024, 0.3957929, 1.928611, 1, 0, 0.4509804, 1,
1.518423, 1.592388, 2.994015, 1, 0, 0.4431373, 1,
1.53321, 1.455199, 1.554138, 1, 0, 0.4392157, 1,
1.537903, 1.352959, 0.8842477, 1, 0, 0.4313726, 1,
1.551287, 0.2539729, 2.133019, 1, 0, 0.427451, 1,
1.569619, 0.1528952, 0.5452229, 1, 0, 0.4196078, 1,
1.596061, 0.7641776, -0.5843269, 1, 0, 0.4156863, 1,
1.606937, 1.377785, 1.157604, 1, 0, 0.4078431, 1,
1.620854, 0.9036899, 0.6634292, 1, 0, 0.4039216, 1,
1.62981, 1.045023, 1.723465, 1, 0, 0.3960784, 1,
1.676438, -0.2764224, 2.896387, 1, 0, 0.3882353, 1,
1.677776, 1.639802, -0.1046299, 1, 0, 0.3843137, 1,
1.683464, 0.3461864, 1.432065, 1, 0, 0.3764706, 1,
1.688567, 0.02591124, 1.704595, 1, 0, 0.372549, 1,
1.695912, -1.064259, 1.362924, 1, 0, 0.3647059, 1,
1.696065, 0.6717219, 2.880791, 1, 0, 0.3607843, 1,
1.696846, -2.172295, 4.14799, 1, 0, 0.3529412, 1,
1.710293, -1.096088, 0.2928984, 1, 0, 0.3490196, 1,
1.721515, 0.6532435, -0.4265473, 1, 0, 0.3411765, 1,
1.732275, 0.02555665, 2.50914, 1, 0, 0.3372549, 1,
1.739262, -1.417736, 2.180274, 1, 0, 0.3294118, 1,
1.741072, -1.737416, 1.420524, 1, 0, 0.3254902, 1,
1.747638, 1.156961, -0.8377321, 1, 0, 0.3176471, 1,
1.753504, -0.8216943, 0.5114797, 1, 0, 0.3137255, 1,
1.753686, 1.687692, 1.538957, 1, 0, 0.3058824, 1,
1.77858, -0.1761866, 1.599094, 1, 0, 0.2980392, 1,
1.790016, 1.653574, 0.01846192, 1, 0, 0.2941177, 1,
1.798066, -2.497895, 3.223828, 1, 0, 0.2862745, 1,
1.8036, 0.4262725, 2.008804, 1, 0, 0.282353, 1,
1.839084, 2.128994, 0.4281757, 1, 0, 0.2745098, 1,
1.843379, -0.5570087, 2.544698, 1, 0, 0.2705882, 1,
1.863055, -0.4205738, 1.680326, 1, 0, 0.2627451, 1,
1.896119, 0.7399476, 1.162102, 1, 0, 0.2588235, 1,
1.899171, -0.06880423, 2.480266, 1, 0, 0.2509804, 1,
1.907268, -1.130433, 1.959331, 1, 0, 0.2470588, 1,
1.918685, 0.08202504, 1.149727, 1, 0, 0.2392157, 1,
1.919626, 2.012105, 1.583807, 1, 0, 0.2352941, 1,
1.923076, -0.03209913, 1.079345, 1, 0, 0.227451, 1,
1.937408, 0.480627, 2.925544, 1, 0, 0.2235294, 1,
1.957899, -0.4837069, 1.102362, 1, 0, 0.2156863, 1,
1.966014, 1.056403, -0.05997755, 1, 0, 0.2117647, 1,
1.974465, 1.75921, -1.468482, 1, 0, 0.2039216, 1,
1.982716, 0.109294, 3.696195, 1, 0, 0.1960784, 1,
2.010128, 0.5621337, 1.728363, 1, 0, 0.1921569, 1,
2.011967, -1.727797, 3.618742, 1, 0, 0.1843137, 1,
2.012677, -0.3061156, 2.376778, 1, 0, 0.1803922, 1,
2.076966, 0.5852272, 0.6523414, 1, 0, 0.172549, 1,
2.078249, -0.4350957, 0.9019858, 1, 0, 0.1686275, 1,
2.0817, 0.3228973, -1.139278, 1, 0, 0.1607843, 1,
2.092329, -0.3927095, 0.6022031, 1, 0, 0.1568628, 1,
2.095288, 0.8249569, 1.980306, 1, 0, 0.1490196, 1,
2.114072, -0.09963951, 1.275305, 1, 0, 0.145098, 1,
2.135659, 0.05541926, 1.704089, 1, 0, 0.1372549, 1,
2.155721, 2.269733, 1.31951, 1, 0, 0.1333333, 1,
2.157706, -1.12647, 3.049151, 1, 0, 0.1254902, 1,
2.169916, 0.9880843, 0.8425164, 1, 0, 0.1215686, 1,
2.172701, 0.1519356, 1.203209, 1, 0, 0.1137255, 1,
2.176572, -0.4662535, 2.58032, 1, 0, 0.1098039, 1,
2.180884, -1.297749, 2.94479, 1, 0, 0.1019608, 1,
2.198192, 0.05688701, 1.619474, 1, 0, 0.09411765, 1,
2.228574, -0.5254299, 0.8361071, 1, 0, 0.09019608, 1,
2.273316, -0.58237, 1.214342, 1, 0, 0.08235294, 1,
2.28806, -0.3897925, 2.39854, 1, 0, 0.07843138, 1,
2.305202, -1.550633, 2.759475, 1, 0, 0.07058824, 1,
2.315154, -0.5573053, 0.9821188, 1, 0, 0.06666667, 1,
2.370044, -1.468553, 2.50981, 1, 0, 0.05882353, 1,
2.425804, 2.283202, 3.120396, 1, 0, 0.05490196, 1,
2.441787, -1.586466, 1.300468, 1, 0, 0.04705882, 1,
2.465404, -0.04612616, 2.575992, 1, 0, 0.04313726, 1,
2.535035, -0.2415477, 0.4636523, 1, 0, 0.03529412, 1,
2.547448, 0.3521061, 2.048667, 1, 0, 0.03137255, 1,
2.56279, 1.145408, 0.1808122, 1, 0, 0.02352941, 1,
2.607039, 1.186931, 1.756118, 1, 0, 0.01960784, 1,
2.626599, 0.9112138, 1.774195, 1, 0, 0.01176471, 1,
2.746086, -0.3596755, 3.07657, 1, 0, 0.007843138, 1
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
-0.1722583, -3.897328, -7.871045, 0, -0.5, 0.5, 0.5,
-0.1722583, -3.897328, -7.871045, 1, -0.5, 0.5, 0.5,
-0.1722583, -3.897328, -7.871045, 1, 1.5, 0.5, 0.5,
-0.1722583, -3.897328, -7.871045, 0, 1.5, 0.5, 0.5
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
-4.079921, 0.102465, -7.871045, 0, -0.5, 0.5, 0.5,
-4.079921, 0.102465, -7.871045, 1, -0.5, 0.5, 0.5,
-4.079921, 0.102465, -7.871045, 1, 1.5, 0.5, 0.5,
-4.079921, 0.102465, -7.871045, 0, 1.5, 0.5, 0.5
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
-4.079921, -3.897328, -0.2692828, 0, -0.5, 0.5, 0.5,
-4.079921, -3.897328, -0.2692828, 1, -0.5, 0.5, 0.5,
-4.079921, -3.897328, -0.2692828, 1, 1.5, 0.5, 0.5,
-4.079921, -3.897328, -0.2692828, 0, 1.5, 0.5, 0.5
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
-3, -2.974298, -6.116792,
2, -2.974298, -6.116792,
-3, -2.974298, -6.116792,
-3, -3.128137, -6.409168,
-2, -2.974298, -6.116792,
-2, -3.128137, -6.409168,
-1, -2.974298, -6.116792,
-1, -3.128137, -6.409168,
0, -2.974298, -6.116792,
0, -3.128137, -6.409168,
1, -2.974298, -6.116792,
1, -3.128137, -6.409168,
2, -2.974298, -6.116792,
2, -3.128137, -6.409168
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
-3, -3.435813, -6.993919, 0, -0.5, 0.5, 0.5,
-3, -3.435813, -6.993919, 1, -0.5, 0.5, 0.5,
-3, -3.435813, -6.993919, 1, 1.5, 0.5, 0.5,
-3, -3.435813, -6.993919, 0, 1.5, 0.5, 0.5,
-2, -3.435813, -6.993919, 0, -0.5, 0.5, 0.5,
-2, -3.435813, -6.993919, 1, -0.5, 0.5, 0.5,
-2, -3.435813, -6.993919, 1, 1.5, 0.5, 0.5,
-2, -3.435813, -6.993919, 0, 1.5, 0.5, 0.5,
-1, -3.435813, -6.993919, 0, -0.5, 0.5, 0.5,
-1, -3.435813, -6.993919, 1, -0.5, 0.5, 0.5,
-1, -3.435813, -6.993919, 1, 1.5, 0.5, 0.5,
-1, -3.435813, -6.993919, 0, 1.5, 0.5, 0.5,
0, -3.435813, -6.993919, 0, -0.5, 0.5, 0.5,
0, -3.435813, -6.993919, 1, -0.5, 0.5, 0.5,
0, -3.435813, -6.993919, 1, 1.5, 0.5, 0.5,
0, -3.435813, -6.993919, 0, 1.5, 0.5, 0.5,
1, -3.435813, -6.993919, 0, -0.5, 0.5, 0.5,
1, -3.435813, -6.993919, 1, -0.5, 0.5, 0.5,
1, -3.435813, -6.993919, 1, 1.5, 0.5, 0.5,
1, -3.435813, -6.993919, 0, 1.5, 0.5, 0.5,
2, -3.435813, -6.993919, 0, -0.5, 0.5, 0.5,
2, -3.435813, -6.993919, 1, -0.5, 0.5, 0.5,
2, -3.435813, -6.993919, 1, 1.5, 0.5, 0.5,
2, -3.435813, -6.993919, 0, 1.5, 0.5, 0.5
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
-3.178153, -2, -6.116792,
-3.178153, 3, -6.116792,
-3.178153, -2, -6.116792,
-3.328447, -2, -6.409168,
-3.178153, -1, -6.116792,
-3.328447, -1, -6.409168,
-3.178153, 0, -6.116792,
-3.328447, 0, -6.409168,
-3.178153, 1, -6.116792,
-3.328447, 1, -6.409168,
-3.178153, 2, -6.116792,
-3.328447, 2, -6.409168,
-3.178153, 3, -6.116792,
-3.328447, 3, -6.409168
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
-3.629037, -2, -6.993919, 0, -0.5, 0.5, 0.5,
-3.629037, -2, -6.993919, 1, -0.5, 0.5, 0.5,
-3.629037, -2, -6.993919, 1, 1.5, 0.5, 0.5,
-3.629037, -2, -6.993919, 0, 1.5, 0.5, 0.5,
-3.629037, -1, -6.993919, 0, -0.5, 0.5, 0.5,
-3.629037, -1, -6.993919, 1, -0.5, 0.5, 0.5,
-3.629037, -1, -6.993919, 1, 1.5, 0.5, 0.5,
-3.629037, -1, -6.993919, 0, 1.5, 0.5, 0.5,
-3.629037, 0, -6.993919, 0, -0.5, 0.5, 0.5,
-3.629037, 0, -6.993919, 1, -0.5, 0.5, 0.5,
-3.629037, 0, -6.993919, 1, 1.5, 0.5, 0.5,
-3.629037, 0, -6.993919, 0, 1.5, 0.5, 0.5,
-3.629037, 1, -6.993919, 0, -0.5, 0.5, 0.5,
-3.629037, 1, -6.993919, 1, -0.5, 0.5, 0.5,
-3.629037, 1, -6.993919, 1, 1.5, 0.5, 0.5,
-3.629037, 1, -6.993919, 0, 1.5, 0.5, 0.5,
-3.629037, 2, -6.993919, 0, -0.5, 0.5, 0.5,
-3.629037, 2, -6.993919, 1, -0.5, 0.5, 0.5,
-3.629037, 2, -6.993919, 1, 1.5, 0.5, 0.5,
-3.629037, 2, -6.993919, 0, 1.5, 0.5, 0.5,
-3.629037, 3, -6.993919, 0, -0.5, 0.5, 0.5,
-3.629037, 3, -6.993919, 1, -0.5, 0.5, 0.5,
-3.629037, 3, -6.993919, 1, 1.5, 0.5, 0.5,
-3.629037, 3, -6.993919, 0, 1.5, 0.5, 0.5
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
-3.178153, -2.974298, -4,
-3.178153, -2.974298, 4,
-3.178153, -2.974298, -4,
-3.328447, -3.128137, -4,
-3.178153, -2.974298, -2,
-3.328447, -3.128137, -2,
-3.178153, -2.974298, 0,
-3.328447, -3.128137, 0,
-3.178153, -2.974298, 2,
-3.328447, -3.128137, 2,
-3.178153, -2.974298, 4,
-3.328447, -3.128137, 4
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
-3.629037, -3.435813, -4, 0, -0.5, 0.5, 0.5,
-3.629037, -3.435813, -4, 1, -0.5, 0.5, 0.5,
-3.629037, -3.435813, -4, 1, 1.5, 0.5, 0.5,
-3.629037, -3.435813, -4, 0, 1.5, 0.5, 0.5,
-3.629037, -3.435813, -2, 0, -0.5, 0.5, 0.5,
-3.629037, -3.435813, -2, 1, -0.5, 0.5, 0.5,
-3.629037, -3.435813, -2, 1, 1.5, 0.5, 0.5,
-3.629037, -3.435813, -2, 0, 1.5, 0.5, 0.5,
-3.629037, -3.435813, 0, 0, -0.5, 0.5, 0.5,
-3.629037, -3.435813, 0, 1, -0.5, 0.5, 0.5,
-3.629037, -3.435813, 0, 1, 1.5, 0.5, 0.5,
-3.629037, -3.435813, 0, 0, 1.5, 0.5, 0.5,
-3.629037, -3.435813, 2, 0, -0.5, 0.5, 0.5,
-3.629037, -3.435813, 2, 1, -0.5, 0.5, 0.5,
-3.629037, -3.435813, 2, 1, 1.5, 0.5, 0.5,
-3.629037, -3.435813, 2, 0, 1.5, 0.5, 0.5,
-3.629037, -3.435813, 4, 0, -0.5, 0.5, 0.5,
-3.629037, -3.435813, 4, 1, -0.5, 0.5, 0.5,
-3.629037, -3.435813, 4, 1, 1.5, 0.5, 0.5,
-3.629037, -3.435813, 4, 0, 1.5, 0.5, 0.5
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
-3.178153, -2.974298, -6.116792,
-3.178153, 3.179229, -6.116792,
-3.178153, -2.974298, 5.578227,
-3.178153, 3.179229, 5.578227,
-3.178153, -2.974298, -6.116792,
-3.178153, -2.974298, 5.578227,
-3.178153, 3.179229, -6.116792,
-3.178153, 3.179229, 5.578227,
-3.178153, -2.974298, -6.116792,
2.833636, -2.974298, -6.116792,
-3.178153, -2.974298, 5.578227,
2.833636, -2.974298, 5.578227,
-3.178153, 3.179229, -6.116792,
2.833636, 3.179229, -6.116792,
-3.178153, 3.179229, 5.578227,
2.833636, 3.179229, 5.578227,
2.833636, -2.974298, -6.116792,
2.833636, 3.179229, -6.116792,
2.833636, -2.974298, 5.578227,
2.833636, 3.179229, 5.578227,
2.833636, -2.974298, -6.116792,
2.833636, -2.974298, 5.578227,
2.833636, 3.179229, -6.116792,
2.833636, 3.179229, 5.578227
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
var radius = 7.752489;
var distance = 34.4917;
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
mvMatrix.translate( 0.1722583, -0.102465, 0.2692828 );
mvMatrix.scale( 1.394284, 1.362169, 0.7167276 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.4917);
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
streptomycin<-read.table("streptomycin.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-streptomycin$V2
```

```
## Error in eval(expr, envir, enclos): object 'streptomycin' not found
```

```r
y<-streptomycin$V3
```

```
## Error in eval(expr, envir, enclos): object 'streptomycin' not found
```

```r
z<-streptomycin$V4
```

```
## Error in eval(expr, envir, enclos): object 'streptomycin' not found
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
-3.090602, -0.8245023, -0.6569229, 0, 0, 1, 1, 1,
-3.048853, -0.3029304, -0.2419719, 1, 0, 0, 1, 1,
-2.587638, -0.2643092, -1.265686, 1, 0, 0, 1, 1,
-2.353565, -0.3187191, -1.52866, 1, 0, 0, 1, 1,
-2.323024, -0.2139349, -3.465549, 1, 0, 0, 1, 1,
-2.307294, -2.055673, -3.845954, 1, 0, 0, 1, 1,
-2.290881, 0.1386087, 0.1942028, 0, 0, 0, 1, 1,
-2.266297, 0.2386286, -0.5589349, 0, 0, 0, 1, 1,
-2.226424, -0.5455674, -0.1809238, 0, 0, 0, 1, 1,
-2.216071, -0.1743246, -1.176952, 0, 0, 0, 1, 1,
-2.134509, 0.2915436, 1.25042, 0, 0, 0, 1, 1,
-2.026134, 0.2688709, 0.4502067, 0, 0, 0, 1, 1,
-2.015563, -0.7292647, -2.071746, 0, 0, 0, 1, 1,
-1.989311, -1.821212, -3.796766, 1, 1, 1, 1, 1,
-1.986549, -0.8718546, -2.006995, 1, 1, 1, 1, 1,
-1.983443, -0.8507781, -2.478053, 1, 1, 1, 1, 1,
-1.942492, -0.6623413, -3.485888, 1, 1, 1, 1, 1,
-1.925881, -0.5878574, -1.863733, 1, 1, 1, 1, 1,
-1.901793, 0.6459513, 0.1139062, 1, 1, 1, 1, 1,
-1.900577, 1.565749, -0.175097, 1, 1, 1, 1, 1,
-1.869052, 0.4138656, 0.2412678, 1, 1, 1, 1, 1,
-1.861097, -1.490156, -2.354124, 1, 1, 1, 1, 1,
-1.841573, 0.8983375, -0.493463, 1, 1, 1, 1, 1,
-1.84038, 0.5784205, -0.7219754, 1, 1, 1, 1, 1,
-1.837534, -0.6425083, -0.9325238, 1, 1, 1, 1, 1,
-1.796636, 0.1281869, -1.955884, 1, 1, 1, 1, 1,
-1.795667, -0.0923055, -1.055451, 1, 1, 1, 1, 1,
-1.794523, -0.3916835, -2.204931, 1, 1, 1, 1, 1,
-1.792857, -0.1162292, -0.6885713, 0, 0, 1, 1, 1,
-1.776598, 0.2970552, -2.025657, 1, 0, 0, 1, 1,
-1.771641, -0.8427123, -2.444299, 1, 0, 0, 1, 1,
-1.768847, 0.01844217, -2.526688, 1, 0, 0, 1, 1,
-1.728653, -1.170645, -3.18366, 1, 0, 0, 1, 1,
-1.717675, 0.3148994, -1.391832, 1, 0, 0, 1, 1,
-1.714451, 0.6074836, -1.13325, 0, 0, 0, 1, 1,
-1.704098, -0.7479737, -0.3664253, 0, 0, 0, 1, 1,
-1.691726, -0.449939, -3.376966, 0, 0, 0, 1, 1,
-1.691131, -0.6669154, -1.754095, 0, 0, 0, 1, 1,
-1.680427, -0.3359356, -1.762792, 0, 0, 0, 1, 1,
-1.652514, 0.1260553, -2.416892, 0, 0, 0, 1, 1,
-1.646562, -1.251973, -4.269515, 0, 0, 0, 1, 1,
-1.639921, -1.683659, -2.374446, 1, 1, 1, 1, 1,
-1.635706, 0.2931885, -1.859389, 1, 1, 1, 1, 1,
-1.629909, 1.480696, -1.865004, 1, 1, 1, 1, 1,
-1.626684, 1.103396, -0.3907944, 1, 1, 1, 1, 1,
-1.625564, 0.3785667, -1.26461, 1, 1, 1, 1, 1,
-1.621005, 0.4798419, -0.295486, 1, 1, 1, 1, 1,
-1.611863, -0.3068897, -0.9676039, 1, 1, 1, 1, 1,
-1.611655, -1.076534, -2.285567, 1, 1, 1, 1, 1,
-1.60674, 1.299368, -0.4789901, 1, 1, 1, 1, 1,
-1.60671, 0.1054785, -0.7118586, 1, 1, 1, 1, 1,
-1.602048, 1.257731, -2.206467, 1, 1, 1, 1, 1,
-1.600042, -0.09981994, -3.187226, 1, 1, 1, 1, 1,
-1.588066, 1.730786, -1.139323, 1, 1, 1, 1, 1,
-1.569728, -0.7626107, -1.900959, 1, 1, 1, 1, 1,
-1.566085, 0.2854214, -1.619896, 1, 1, 1, 1, 1,
-1.565774, -0.3168201, -2.157062, 0, 0, 1, 1, 1,
-1.555072, -1.158926, -2.633264, 1, 0, 0, 1, 1,
-1.554034, 0.4607673, -1.041805, 1, 0, 0, 1, 1,
-1.547671, 0.523003, -0.8178467, 1, 0, 0, 1, 1,
-1.541082, 0.761552, 0.2814353, 1, 0, 0, 1, 1,
-1.533772, -1.756292, -2.432738, 1, 0, 0, 1, 1,
-1.527551, 0.8779549, -1.460833, 0, 0, 0, 1, 1,
-1.520858, 0.596639, -1.65726, 0, 0, 0, 1, 1,
-1.515368, 0.1637673, -2.074894, 0, 0, 0, 1, 1,
-1.469795, 0.502726, -1.111064, 0, 0, 0, 1, 1,
-1.443407, 0.8540944, 1.204255, 0, 0, 0, 1, 1,
-1.428871, 0.6827533, -2.068005, 0, 0, 0, 1, 1,
-1.428164, 0.2889757, -2.379832, 0, 0, 0, 1, 1,
-1.423974, -0.3264652, -0.4359833, 1, 1, 1, 1, 1,
-1.417697, 0.006641339, -0.02915664, 1, 1, 1, 1, 1,
-1.413322, -0.4315833, -1.454027, 1, 1, 1, 1, 1,
-1.403084, 0.2532844, -2.669609, 1, 1, 1, 1, 1,
-1.399023, -2.059439, -1.092674, 1, 1, 1, 1, 1,
-1.390296, 0.3032076, -1.585532, 1, 1, 1, 1, 1,
-1.387361, 1.098611, -1.332403, 1, 1, 1, 1, 1,
-1.386707, 0.8068064, -0.3888272, 1, 1, 1, 1, 1,
-1.384208, -2.129122, -1.30319, 1, 1, 1, 1, 1,
-1.379305, -0.3471083, -2.554667, 1, 1, 1, 1, 1,
-1.377295, 0.1827909, -1.643776, 1, 1, 1, 1, 1,
-1.360776, -0.2337344, -2.227577, 1, 1, 1, 1, 1,
-1.334555, 0.1478802, -1.448437, 1, 1, 1, 1, 1,
-1.322567, 0.3596714, -1.497494, 1, 1, 1, 1, 1,
-1.302624, -1.593758, -2.980667, 1, 1, 1, 1, 1,
-1.30249, -0.2603563, -2.582601, 0, 0, 1, 1, 1,
-1.296986, 0.9607905, -0.05704855, 1, 0, 0, 1, 1,
-1.273641, -0.4590828, -3.186058, 1, 0, 0, 1, 1,
-1.272988, -1.062518, -3.927701, 1, 0, 0, 1, 1,
-1.269447, 1.623975, -1.638333, 1, 0, 0, 1, 1,
-1.255273, 0.004889379, 0.6790126, 1, 0, 0, 1, 1,
-1.254349, -0.1050533, -4.550643, 0, 0, 0, 1, 1,
-1.240027, 0.03715067, -1.206597, 0, 0, 0, 1, 1,
-1.228026, 1.146183, -0.8611425, 0, 0, 0, 1, 1,
-1.225188, -0.7726668, -0.7645397, 0, 0, 0, 1, 1,
-1.22514, 1.545545, -0.1806181, 0, 0, 0, 1, 1,
-1.22431, -0.2443717, -2.431179, 0, 0, 0, 1, 1,
-1.218152, 0.05458703, -1.595346, 0, 0, 0, 1, 1,
-1.214485, -2.420503, -3.37108, 1, 1, 1, 1, 1,
-1.21282, 0.5643334, -3.151308, 1, 1, 1, 1, 1,
-1.197598, -0.1670368, -1.7465, 1, 1, 1, 1, 1,
-1.194805, 0.5940197, 0.02996886, 1, 1, 1, 1, 1,
-1.194037, -1.665384, -1.355981, 1, 1, 1, 1, 1,
-1.190687, -0.717231, -1.316541, 1, 1, 1, 1, 1,
-1.189486, -1.02836, -1.685988, 1, 1, 1, 1, 1,
-1.181736, 0.0775312, -1.005937, 1, 1, 1, 1, 1,
-1.169216, 0.4227934, -1.518507, 1, 1, 1, 1, 1,
-1.154565, 0.7510895, -0.552101, 1, 1, 1, 1, 1,
-1.154475, 0.1769455, -1.139928, 1, 1, 1, 1, 1,
-1.148348, -2.155849, -3.133355, 1, 1, 1, 1, 1,
-1.147913, 0.1261168, -2.054705, 1, 1, 1, 1, 1,
-1.140956, 0.3039517, -0.6994356, 1, 1, 1, 1, 1,
-1.139701, 1.363802, -0.4919506, 1, 1, 1, 1, 1,
-1.138057, -2.179852, -3.611954, 0, 0, 1, 1, 1,
-1.129, -0.9955012, -2.235856, 1, 0, 0, 1, 1,
-1.123247, 0.6353701, -2.193108, 1, 0, 0, 1, 1,
-1.113954, -0.7095736, -0.8021617, 1, 0, 0, 1, 1,
-1.106533, -0.4173188, -1.391403, 1, 0, 0, 1, 1,
-1.097915, -2.276727, -1.710289, 1, 0, 0, 1, 1,
-1.093475, 0.5181031, -0.4038595, 0, 0, 0, 1, 1,
-1.093407, 0.6514058, -1.664415, 0, 0, 0, 1, 1,
-1.088858, 0.2755626, -1.916442, 0, 0, 0, 1, 1,
-1.088189, -1.781059, -1.621043, 0, 0, 0, 1, 1,
-1.085153, -0.8275563, -1.297157, 0, 0, 0, 1, 1,
-1.083094, 0.3529682, -0.9022231, 0, 0, 0, 1, 1,
-1.0658, -1.22335, -4.00279, 0, 0, 0, 1, 1,
-1.063924, -0.4531661, -1.439535, 1, 1, 1, 1, 1,
-1.063904, 0.7447612, 0.1037062, 1, 1, 1, 1, 1,
-1.061661, 0.7663705, -1.934122, 1, 1, 1, 1, 1,
-1.059392, 0.6174193, 0.0442869, 1, 1, 1, 1, 1,
-1.058238, 0.06173826, -2.213048, 1, 1, 1, 1, 1,
-1.056414, 1.179046, -0.482159, 1, 1, 1, 1, 1,
-1.051833, -1.018107, -4.842493, 1, 1, 1, 1, 1,
-1.05116, 0.3880161, -1.934011, 1, 1, 1, 1, 1,
-1.050812, 0.09363756, -2.101866, 1, 1, 1, 1, 1,
-1.050455, -0.5088981, -1.69266, 1, 1, 1, 1, 1,
-1.049141, -1.84089, -3.273736, 1, 1, 1, 1, 1,
-1.039799, 0.8833692, -1.580844, 1, 1, 1, 1, 1,
-1.036284, 0.2144887, -1.597097, 1, 1, 1, 1, 1,
-1.033973, 1.608018, -0.390236, 1, 1, 1, 1, 1,
-1.02135, 0.3587604, -1.11827, 1, 1, 1, 1, 1,
-1.020594, 0.4368521, -1.569375, 0, 0, 1, 1, 1,
-1.012275, -0.2476628, -0.1345706, 1, 0, 0, 1, 1,
-1.010006, -0.5860136, -0.420658, 1, 0, 0, 1, 1,
-1.008473, -0.2065542, -2.260756, 1, 0, 0, 1, 1,
-1.006202, -0.3573335, -2.343859, 1, 0, 0, 1, 1,
-1.004953, -1.239486, -3.489627, 1, 0, 0, 1, 1,
-1.003881, -1.400428, -1.846426, 0, 0, 0, 1, 1,
-1.000528, -1.891575, -2.263941, 0, 0, 0, 1, 1,
-1.000392, 1.403568, -1.480348, 0, 0, 0, 1, 1,
-0.9915929, 1.085619, 0.09422692, 0, 0, 0, 1, 1,
-0.9905612, 0.9968732, -2.114271, 0, 0, 0, 1, 1,
-0.9889992, 1.239528, -1.082417, 0, 0, 0, 1, 1,
-0.9874691, 0.5382126, -0.560684, 0, 0, 0, 1, 1,
-0.9820889, -0.6519482, -1.180586, 1, 1, 1, 1, 1,
-0.9778209, -1.13472, -2.565422, 1, 1, 1, 1, 1,
-0.9746644, -2.274865, -1.395676, 1, 1, 1, 1, 1,
-0.974584, 2.028911, -0.9131027, 1, 1, 1, 1, 1,
-0.9732829, 1.74578, 0.1516963, 1, 1, 1, 1, 1,
-0.9681106, 0.2307, -0.1846401, 1, 1, 1, 1, 1,
-0.9677565, -0.4070816, -1.66951, 1, 1, 1, 1, 1,
-0.960888, -1.888652, -1.03985, 1, 1, 1, 1, 1,
-0.958459, 0.9360039, -1.597312, 1, 1, 1, 1, 1,
-0.9572545, -0.8645805, -1.20029, 1, 1, 1, 1, 1,
-0.9534101, 0.667024, -0.361948, 1, 1, 1, 1, 1,
-0.9473953, 0.6812652, -2.806282, 1, 1, 1, 1, 1,
-0.9455618, -0.488322, -1.767112, 1, 1, 1, 1, 1,
-0.9403469, 1.826277, -0.6036737, 1, 1, 1, 1, 1,
-0.9373497, -0.08012009, -2.109225, 1, 1, 1, 1, 1,
-0.9310487, -0.3948736, -2.221672, 0, 0, 1, 1, 1,
-0.9300883, -0.7704765, -3.903405, 1, 0, 0, 1, 1,
-0.9206235, 0.3829855, -1.948875, 1, 0, 0, 1, 1,
-0.9153344, 0.6863068, -0.9040359, 1, 0, 0, 1, 1,
-0.9067345, 1.358315, -1.357492, 1, 0, 0, 1, 1,
-0.9029858, 0.1829407, -1.94932, 1, 0, 0, 1, 1,
-0.901097, 1.646957, -0.03139335, 0, 0, 0, 1, 1,
-0.8971332, 0.2206765, -0.6294476, 0, 0, 0, 1, 1,
-0.8848671, -0.9106483, -1.437243, 0, 0, 0, 1, 1,
-0.8817161, -0.6349075, -2.030769, 0, 0, 0, 1, 1,
-0.8781145, -0.780136, -2.804636, 0, 0, 0, 1, 1,
-0.8773094, -0.02541791, -2.521633, 0, 0, 0, 1, 1,
-0.8763989, 0.1841569, -1.555115, 0, 0, 0, 1, 1,
-0.8761951, -1.402249, -2.987792, 1, 1, 1, 1, 1,
-0.8746049, 0.3154187, -1.151777, 1, 1, 1, 1, 1,
-0.8737613, -2.396335, -2.147447, 1, 1, 1, 1, 1,
-0.8632507, -1.262103, -2.372996, 1, 1, 1, 1, 1,
-0.8603534, 0.4128457, -0.8445694, 1, 1, 1, 1, 1,
-0.8506695, 0.442432, -0.05833074, 1, 1, 1, 1, 1,
-0.8498634, 0.3994035, -0.8137802, 1, 1, 1, 1, 1,
-0.8496968, -0.7138079, -1.3776, 1, 1, 1, 1, 1,
-0.8494367, 1.38805, 0.01678076, 1, 1, 1, 1, 1,
-0.8458441, 0.8128533, -0.3299457, 1, 1, 1, 1, 1,
-0.8445722, -0.9629567, -2.779155, 1, 1, 1, 1, 1,
-0.8431317, 1.967295, 0.9509676, 1, 1, 1, 1, 1,
-0.8315082, -1.775238, -1.600137, 1, 1, 1, 1, 1,
-0.8305492, 0.7965105, -1.772734, 1, 1, 1, 1, 1,
-0.8287675, -1.149649, -5.133164, 1, 1, 1, 1, 1,
-0.8243585, 2.019536, 0.8356782, 0, 0, 1, 1, 1,
-0.8222789, -0.0270598, -1.211384, 1, 0, 0, 1, 1,
-0.8200622, 0.388093, -2.154144, 1, 0, 0, 1, 1,
-0.813755, 0.1306464, -0.7545694, 1, 0, 0, 1, 1,
-0.8088627, -0.06933093, -1.379253, 1, 0, 0, 1, 1,
-0.7943722, 0.2472564, -0.8429698, 1, 0, 0, 1, 1,
-0.7941739, 0.6949579, -0.9585925, 0, 0, 0, 1, 1,
-0.788296, 0.5260064, 0.7191, 0, 0, 0, 1, 1,
-0.7872579, 1.146907, 1.308078, 0, 0, 0, 1, 1,
-0.7866505, 0.1397415, -0.6323731, 0, 0, 0, 1, 1,
-0.7836627, -1.062596, -2.875145, 0, 0, 0, 1, 1,
-0.7759562, -0.3806277, -1.732353, 0, 0, 0, 1, 1,
-0.7737893, 0.3871699, -2.892939, 0, 0, 0, 1, 1,
-0.7723954, -0.922731, -3.011097, 1, 1, 1, 1, 1,
-0.7710051, 1.544266, -2.27082, 1, 1, 1, 1, 1,
-0.7621743, -1.115141, -3.516141, 1, 1, 1, 1, 1,
-0.7591402, -1.457376, -3.123286, 1, 1, 1, 1, 1,
-0.7508376, 0.876886, -1.25842, 1, 1, 1, 1, 1,
-0.7478104, 0.5302951, -1.955115, 1, 1, 1, 1, 1,
-0.7461569, -0.08538016, -1.583431, 1, 1, 1, 1, 1,
-0.7422829, 1.218237, -0.5448459, 1, 1, 1, 1, 1,
-0.741168, -0.4672029, -3.263596, 1, 1, 1, 1, 1,
-0.7393115, 0.004118493, -1.52524, 1, 1, 1, 1, 1,
-0.7392229, 0.08972605, -1.660968, 1, 1, 1, 1, 1,
-0.7390775, -0.3767717, -2.336158, 1, 1, 1, 1, 1,
-0.738676, 0.1027603, -1.231735, 1, 1, 1, 1, 1,
-0.7359411, -1.371434, -2.753853, 1, 1, 1, 1, 1,
-0.7357909, 0.2658123, -1.407175, 1, 1, 1, 1, 1,
-0.7302772, 0.3524745, -2.893221, 0, 0, 1, 1, 1,
-0.7298359, -0.2174254, -1.012809, 1, 0, 0, 1, 1,
-0.7244376, -1.368754, -2.081054, 1, 0, 0, 1, 1,
-0.7233001, 1.458435, -1.119344, 1, 0, 0, 1, 1,
-0.7090265, -0.6184415, -3.38918, 1, 0, 0, 1, 1,
-0.7044506, 0.234649, -1.060293, 1, 0, 0, 1, 1,
-0.7043716, 0.811507, 0.3014929, 0, 0, 0, 1, 1,
-0.6907569, -0.8430295, -3.123688, 0, 0, 0, 1, 1,
-0.6857884, -0.5118351, -1.608873, 0, 0, 0, 1, 1,
-0.6779177, 0.1419726, -2.259795, 0, 0, 0, 1, 1,
-0.6737831, 0.7947925, 0.2335449, 0, 0, 0, 1, 1,
-0.665075, 0.2403997, -2.327322, 0, 0, 0, 1, 1,
-0.6605226, -0.4553261, -0.7197777, 0, 0, 0, 1, 1,
-0.6601634, -0.8225294, -3.03372, 1, 1, 1, 1, 1,
-0.6590499, 0.5824351, -2.853947, 1, 1, 1, 1, 1,
-0.6483247, 1.544653, -0.511243, 1, 1, 1, 1, 1,
-0.6457417, -2.199916, -1.488506, 1, 1, 1, 1, 1,
-0.6453071, 0.2214279, -1.078904, 1, 1, 1, 1, 1,
-0.6427928, -0.4573649, -2.67688, 1, 1, 1, 1, 1,
-0.6386973, -0.5827914, -2.398765, 1, 1, 1, 1, 1,
-0.6361614, 1.043613, -0.8485947, 1, 1, 1, 1, 1,
-0.6359224, 0.1748049, -1.430049, 1, 1, 1, 1, 1,
-0.633949, -0.7442983, -2.415823, 1, 1, 1, 1, 1,
-0.6296201, 1.021683, -0.5432948, 1, 1, 1, 1, 1,
-0.6295946, 0.1366716, -1.741978, 1, 1, 1, 1, 1,
-0.6261007, 0.8457708, -0.6301793, 1, 1, 1, 1, 1,
-0.6100622, 2.080838, -1.103271, 1, 1, 1, 1, 1,
-0.6085132, 1.835034, 0.05329039, 1, 1, 1, 1, 1,
-0.6058129, 0.04611003, -1.99035, 0, 0, 1, 1, 1,
-0.6047387, -0.4369672, -2.666433, 1, 0, 0, 1, 1,
-0.6046463, 0.6589727, -2.557461, 1, 0, 0, 1, 1,
-0.6046378, -0.08245717, -1.099306, 1, 0, 0, 1, 1,
-0.6038156, 1.753318, -0.1047303, 1, 0, 0, 1, 1,
-0.5985292, -1.92521, -0.9900144, 1, 0, 0, 1, 1,
-0.5983241, 1.075045, -1.630275, 0, 0, 0, 1, 1,
-0.5981987, -0.1125278, -2.268157, 0, 0, 0, 1, 1,
-0.5938043, -1.335845, -1.594625, 0, 0, 0, 1, 1,
-0.5931081, -1.229365, -2.766186, 0, 0, 0, 1, 1,
-0.5929683, 0.01081875, -1.222711, 0, 0, 0, 1, 1,
-0.5923695, -1.072257, -2.030861, 0, 0, 0, 1, 1,
-0.5834095, 2.693152, 0.3633783, 0, 0, 0, 1, 1,
-0.5800227, -0.04027574, -1.706066, 1, 1, 1, 1, 1,
-0.5705673, 0.360619, -1.468677, 1, 1, 1, 1, 1,
-0.566085, -2.377628, -3.57027, 1, 1, 1, 1, 1,
-0.5632377, -0.1490712, -3.029638, 1, 1, 1, 1, 1,
-0.5577686, -1.416705, -4.790176, 1, 1, 1, 1, 1,
-0.5536203, 0.8047736, -1.91419, 1, 1, 1, 1, 1,
-0.5496633, 0.2131992, -1.128671, 1, 1, 1, 1, 1,
-0.5491837, -0.4130875, -1.333974, 1, 1, 1, 1, 1,
-0.5454251, -0.668768, -3.321627, 1, 1, 1, 1, 1,
-0.5338165, -1.947537, -2.734968, 1, 1, 1, 1, 1,
-0.5298589, 0.8859534, -1.341649, 1, 1, 1, 1, 1,
-0.529406, 0.7850274, 0.5706726, 1, 1, 1, 1, 1,
-0.5279397, 0.2978506, -0.521031, 1, 1, 1, 1, 1,
-0.522969, -2.101494, -1.829311, 1, 1, 1, 1, 1,
-0.5213501, 0.2361054, -0.8198608, 1, 1, 1, 1, 1,
-0.5188797, 2.690584, 0.3065799, 0, 0, 1, 1, 1,
-0.5178171, -0.4152291, -2.854108, 1, 0, 0, 1, 1,
-0.5175787, 0.580358, -0.1279858, 1, 0, 0, 1, 1,
-0.5167688, -1.232894, -2.815305, 1, 0, 0, 1, 1,
-0.5120699, -0.4641047, -1.927642, 1, 0, 0, 1, 1,
-0.5118159, -0.7291547, -2.556674, 1, 0, 0, 1, 1,
-0.5115723, -0.2160767, 0.1757474, 0, 0, 0, 1, 1,
-0.5098575, -0.03477893, -1.103696, 0, 0, 0, 1, 1,
-0.507827, 0.1970303, -2.163513, 0, 0, 0, 1, 1,
-0.503861, -0.7680219, -1.378523, 0, 0, 0, 1, 1,
-0.4983951, 1.170421, -1.656872, 0, 0, 0, 1, 1,
-0.498185, 0.5783529, -1.554894, 0, 0, 0, 1, 1,
-0.4978092, 0.545117, -1.268201, 0, 0, 0, 1, 1,
-0.4954253, -2.403245, -4.448724, 1, 1, 1, 1, 1,
-0.4949618, 0.6181127, -0.3595326, 1, 1, 1, 1, 1,
-0.4938107, -0.06547613, -2.567552, 1, 1, 1, 1, 1,
-0.4917671, -0.1303924, -0.7613086, 1, 1, 1, 1, 1,
-0.4901089, -1.204672, -1.522671, 1, 1, 1, 1, 1,
-0.4900551, 0.8075184, -1.164033, 1, 1, 1, 1, 1,
-0.4863701, -0.3342357, -2.759562, 1, 1, 1, 1, 1,
-0.4855309, 1.014154, -0.5891875, 1, 1, 1, 1, 1,
-0.485133, 0.04084232, -2.546393, 1, 1, 1, 1, 1,
-0.482678, 0.381114, -0.5084903, 1, 1, 1, 1, 1,
-0.4737639, 1.685392, 0.2769184, 1, 1, 1, 1, 1,
-0.4675637, -0.2679732, -3.447551, 1, 1, 1, 1, 1,
-0.4666288, -0.9737545, -2.500649, 1, 1, 1, 1, 1,
-0.4643388, -0.111596, -0.7312854, 1, 1, 1, 1, 1,
-0.4629321, 1.058675, 0.09543908, 1, 1, 1, 1, 1,
-0.4624677, 0.1581604, -0.02811207, 0, 0, 1, 1, 1,
-0.4617743, -0.01766761, -1.152956, 1, 0, 0, 1, 1,
-0.459212, -0.7308229, -1.55749, 1, 0, 0, 1, 1,
-0.4588561, -1.236636, -2.633996, 1, 0, 0, 1, 1,
-0.4572781, 1.719518, -1.085922, 1, 0, 0, 1, 1,
-0.4566636, 0.08290164, -2.554109, 1, 0, 0, 1, 1,
-0.4517526, 1.126886, 1.088802, 0, 0, 0, 1, 1,
-0.4477895, -0.1509081, -3.079318, 0, 0, 0, 1, 1,
-0.4467694, 0.2062872, -1.088314, 0, 0, 0, 1, 1,
-0.4447306, -1.529305, -0.8520557, 0, 0, 0, 1, 1,
-0.4431321, -0.08078283, -0.2652643, 0, 0, 0, 1, 1,
-0.4389351, 0.2063209, -0.804938, 0, 0, 0, 1, 1,
-0.4361572, 0.7122246, -1.093736, 0, 0, 0, 1, 1,
-0.4353071, -1.664903, -3.532143, 1, 1, 1, 1, 1,
-0.4351598, 1.13641, 0.8741706, 1, 1, 1, 1, 1,
-0.4327736, 1.952036, 0.1409266, 1, 1, 1, 1, 1,
-0.4263731, 0.4262822, -0.5145068, 1, 1, 1, 1, 1,
-0.4245293, -0.8085558, -2.990831, 1, 1, 1, 1, 1,
-0.4213331, -1.629788, -5.946476, 1, 1, 1, 1, 1,
-0.415773, -0.9084673, -2.610167, 1, 1, 1, 1, 1,
-0.4142796, 0.01530833, -1.932309, 1, 1, 1, 1, 1,
-0.4140898, -1.031153, -2.109274, 1, 1, 1, 1, 1,
-0.4130799, 0.3937591, -0.2107301, 1, 1, 1, 1, 1,
-0.412546, 1.322729, 0.6554997, 1, 1, 1, 1, 1,
-0.4063019, -0.9204308, -2.903067, 1, 1, 1, 1, 1,
-0.3971874, -0.485545, -2.200418, 1, 1, 1, 1, 1,
-0.3961302, -0.4398111, -2.866911, 1, 1, 1, 1, 1,
-0.3951452, -0.7650799, -4.095271, 1, 1, 1, 1, 1,
-0.3943679, -0.926809, -2.010833, 0, 0, 1, 1, 1,
-0.391291, -0.3619168, -2.04514, 1, 0, 0, 1, 1,
-0.3868481, -0.4653481, -0.5448909, 1, 0, 0, 1, 1,
-0.3863288, 0.5425703, -0.7089159, 1, 0, 0, 1, 1,
-0.3859664, -2.249886, -2.730379, 1, 0, 0, 1, 1,
-0.3834437, -0.998558, -3.334563, 1, 0, 0, 1, 1,
-0.3834176, 2.517644, -1.450534, 0, 0, 0, 1, 1,
-0.3820989, 0.1357594, -1.238053, 0, 0, 0, 1, 1,
-0.3817507, -0.6026255, -2.599848, 0, 0, 0, 1, 1,
-0.3800055, 1.417509, -1.657372, 0, 0, 0, 1, 1,
-0.3799168, 1.170976, -0.7686933, 0, 0, 0, 1, 1,
-0.3794853, 0.5385991, -1.644431, 0, 0, 0, 1, 1,
-0.3785435, 1.680696, 0.5383471, 0, 0, 0, 1, 1,
-0.3773304, -1.662634, -2.790773, 1, 1, 1, 1, 1,
-0.3739173, -0.3918671, -3.337671, 1, 1, 1, 1, 1,
-0.3733752, 0.1504314, -1.604082, 1, 1, 1, 1, 1,
-0.3719274, -1.352897, -3.358954, 1, 1, 1, 1, 1,
-0.3664977, -1.397354, -2.515694, 1, 1, 1, 1, 1,
-0.3641343, -0.4905952, -2.940299, 1, 1, 1, 1, 1,
-0.3567862, 0.3722146, 0.05510108, 1, 1, 1, 1, 1,
-0.3495981, 1.797447, 0.08546054, 1, 1, 1, 1, 1,
-0.3456927, 0.9047334, -0.4520811, 1, 1, 1, 1, 1,
-0.3441822, 1.256101, 0.6591632, 1, 1, 1, 1, 1,
-0.3437507, 1.804292, -0.3751851, 1, 1, 1, 1, 1,
-0.3426348, -0.5093512, -2.825574, 1, 1, 1, 1, 1,
-0.3393931, -0.3211273, -1.168764, 1, 1, 1, 1, 1,
-0.3355241, -1.176558, -3.229466, 1, 1, 1, 1, 1,
-0.3316276, -0.6317759, -2.87879, 1, 1, 1, 1, 1,
-0.3216001, -0.2570704, -3.821749, 0, 0, 1, 1, 1,
-0.3187752, 0.9038803, -0.7957551, 1, 0, 0, 1, 1,
-0.3181888, -1.394364, -2.02861, 1, 0, 0, 1, 1,
-0.3170597, 0.4249544, 0.7562158, 1, 0, 0, 1, 1,
-0.3169186, 1.422417, -0.3399343, 1, 0, 0, 1, 1,
-0.3161322, -1.359877, -2.623828, 1, 0, 0, 1, 1,
-0.3130534, -0.7395145, -3.536321, 0, 0, 0, 1, 1,
-0.3115995, 0.08282527, -2.467229, 0, 0, 0, 1, 1,
-0.3104302, -0.6117672, -3.130296, 0, 0, 0, 1, 1,
-0.2985539, 0.6208414, -1.977869, 0, 0, 0, 1, 1,
-0.29746, 0.9044632, -0.4585137, 0, 0, 0, 1, 1,
-0.2971106, 1.026534, 0.6475747, 0, 0, 0, 1, 1,
-0.2958041, 0.1848537, -0.6380026, 0, 0, 0, 1, 1,
-0.2914658, 1.090629, 0.03537149, 1, 1, 1, 1, 1,
-0.2909184, -1.393854, -2.003795, 1, 1, 1, 1, 1,
-0.2906601, -1.39532, -4.105021, 1, 1, 1, 1, 1,
-0.2878253, -0.7838038, -2.195631, 1, 1, 1, 1, 1,
-0.2876863, -0.42123, -2.167615, 1, 1, 1, 1, 1,
-0.2867979, -0.8041593, -2.236436, 1, 1, 1, 1, 1,
-0.2851251, -1.930889, -2.887974, 1, 1, 1, 1, 1,
-0.2846143, 0.6674223, 0.9727585, 1, 1, 1, 1, 1,
-0.2825451, 1.148703, 1.067273, 1, 1, 1, 1, 1,
-0.2815737, 0.06631161, -1.597059, 1, 1, 1, 1, 1,
-0.2795347, -0.0212849, -3.912457, 1, 1, 1, 1, 1,
-0.2786985, -0.5735178, -1.913046, 1, 1, 1, 1, 1,
-0.2784581, 1.419828, -0.9371479, 1, 1, 1, 1, 1,
-0.27146, -0.06532142, -2.738842, 1, 1, 1, 1, 1,
-0.2692638, 1.062754, -0.2120623, 1, 1, 1, 1, 1,
-0.2683245, -0.2746848, -1.839058, 0, 0, 1, 1, 1,
-0.2658499, 0.1150283, -1.822922, 1, 0, 0, 1, 1,
-0.2570125, -1.987004, -1.786599, 1, 0, 0, 1, 1,
-0.2566263, 0.4333802, 0.7777935, 1, 0, 0, 1, 1,
-0.2555733, -0.8826104, -1.601759, 1, 0, 0, 1, 1,
-0.2546405, -0.7708197, -3.173062, 1, 0, 0, 1, 1,
-0.2531502, -1.193201, -3.902407, 0, 0, 0, 1, 1,
-0.2514824, 0.2876083, -0.6685858, 0, 0, 0, 1, 1,
-0.2509267, 0.7130478, -0.9947059, 0, 0, 0, 1, 1,
-0.2502992, 0.8398226, 0.3442173, 0, 0, 0, 1, 1,
-0.2496281, -1.30654, -2.24686, 0, 0, 0, 1, 1,
-0.2493133, 0.08425386, 1.3066, 0, 0, 0, 1, 1,
-0.2390402, -1.079328, -3.187844, 0, 0, 0, 1, 1,
-0.232926, -1.17313, -3.250656, 1, 1, 1, 1, 1,
-0.2315869, 0.5800323, 0.8195147, 1, 1, 1, 1, 1,
-0.2300518, 0.03092171, -0.7468402, 1, 1, 1, 1, 1,
-0.2276762, 0.1942849, 1.14137, 1, 1, 1, 1, 1,
-0.2266846, -1.714063, -3.810715, 1, 1, 1, 1, 1,
-0.2258767, -0.30508, -2.559739, 1, 1, 1, 1, 1,
-0.223297, -1.189902, -3.874409, 1, 1, 1, 1, 1,
-0.2223464, -2.570249, -3.269643, 1, 1, 1, 1, 1,
-0.2218976, -0.05927803, -2.96819, 1, 1, 1, 1, 1,
-0.2217005, -0.9770105, -3.406465, 1, 1, 1, 1, 1,
-0.2156151, -0.0466998, -1.952333, 1, 1, 1, 1, 1,
-0.2132182, -1.097302, -2.365931, 1, 1, 1, 1, 1,
-0.2089972, -0.1060932, -2.66141, 1, 1, 1, 1, 1,
-0.199744, -0.450869, -1.70051, 1, 1, 1, 1, 1,
-0.1928124, 0.3422909, -1.387359, 1, 1, 1, 1, 1,
-0.1841445, 1.322043, 1.356062, 0, 0, 1, 1, 1,
-0.182936, 0.9818686, 0.8418745, 1, 0, 0, 1, 1,
-0.1806776, 1.006183, -0.2025447, 1, 0, 0, 1, 1,
-0.1787706, -1.24469, -3.999916, 1, 0, 0, 1, 1,
-0.1780547, 1.683305, -1.745451, 1, 0, 0, 1, 1,
-0.176608, -1.017156, -4.370197, 1, 0, 0, 1, 1,
-0.1693643, -1.189683, -3.502072, 0, 0, 0, 1, 1,
-0.1677939, 0.2836163, -1.100163, 0, 0, 0, 1, 1,
-0.1677352, -0.8233942, -2.320386, 0, 0, 0, 1, 1,
-0.1671464, -1.829119, -3.84169, 0, 0, 0, 1, 1,
-0.1627099, 1.426834, 0.07761731, 0, 0, 0, 1, 1,
-0.1595442, -0.9059498, -2.485462, 0, 0, 0, 1, 1,
-0.1553008, 1.717339, 0.2658372, 0, 0, 0, 1, 1,
-0.1545267, -0.3252057, -1.609752, 1, 1, 1, 1, 1,
-0.1539498, 1.47664, -1.396739, 1, 1, 1, 1, 1,
-0.1516143, -0.7941858, -2.661406, 1, 1, 1, 1, 1,
-0.1503028, -1.061864, -2.368052, 1, 1, 1, 1, 1,
-0.1463926, 0.6980117, 0.4514801, 1, 1, 1, 1, 1,
-0.1461762, -0.09059329, -1.466338, 1, 1, 1, 1, 1,
-0.1432618, -0.5941531, -2.640629, 1, 1, 1, 1, 1,
-0.1411708, 1.11557, 0.203393, 1, 1, 1, 1, 1,
-0.1368328, -0.592221, -5.093414, 1, 1, 1, 1, 1,
-0.1361323, 0.2959208, 0.7056733, 1, 1, 1, 1, 1,
-0.122924, -0.4387988, -2.760152, 1, 1, 1, 1, 1,
-0.1226619, -0.03450873, -0.9412672, 1, 1, 1, 1, 1,
-0.1220143, 0.5008025, -0.8964763, 1, 1, 1, 1, 1,
-0.1197864, -0.5803132, -1.833658, 1, 1, 1, 1, 1,
-0.1183712, 2.967147, 0.9118995, 1, 1, 1, 1, 1,
-0.1079685, 0.466329, -0.6545249, 0, 0, 1, 1, 1,
-0.1072076, 0.5532506, 1.267889, 1, 0, 0, 1, 1,
-0.1024199, -0.7637003, -1.91536, 1, 0, 0, 1, 1,
-0.09517197, -0.3893726, -5.15772, 1, 0, 0, 1, 1,
-0.0934481, -0.5124473, -3.054944, 1, 0, 0, 1, 1,
-0.0819693, 1.090889, 0.2792767, 1, 0, 0, 1, 1,
-0.07876156, 0.6419025, -1.185952, 0, 0, 0, 1, 1,
-0.07350421, 0.2397337, 0.05468407, 0, 0, 0, 1, 1,
-0.06862833, 0.1363081, -0.7372715, 0, 0, 0, 1, 1,
-0.06646571, 1.201051, 0.2066016, 0, 0, 0, 1, 1,
-0.06639373, 1.019775, 0.3574743, 0, 0, 0, 1, 1,
-0.06577421, -1.042284, -3.766812, 0, 0, 0, 1, 1,
-0.06113918, 2.620682, 0.2504764, 0, 0, 0, 1, 1,
-0.05829927, -1.364139, -4.00376, 1, 1, 1, 1, 1,
-0.0564202, -1.178953, -3.387775, 1, 1, 1, 1, 1,
-0.0520641, -0.6556609, -3.597977, 1, 1, 1, 1, 1,
-0.05009213, -0.08195053, -1.844466, 1, 1, 1, 1, 1,
-0.04840732, -1.134445, -4.016347, 1, 1, 1, 1, 1,
-0.04774673, -0.1979627, -3.871095, 1, 1, 1, 1, 1,
-0.04690912, -1.110547, -3.575959, 1, 1, 1, 1, 1,
-0.04316969, 0.3086842, -0.486196, 1, 1, 1, 1, 1,
-0.04249966, 0.188672, -0.3275947, 1, 1, 1, 1, 1,
-0.04125717, 0.8378064, -0.1969198, 1, 1, 1, 1, 1,
-0.04099193, 1.21651, -0.2064958, 1, 1, 1, 1, 1,
-0.03548307, -1.265954, -4.068504, 1, 1, 1, 1, 1,
-0.03333202, 0.5104052, 1.038965, 1, 1, 1, 1, 1,
-0.03322867, 0.7713595, 1.0587, 1, 1, 1, 1, 1,
-0.02746677, 1.643249, 0.4990525, 1, 1, 1, 1, 1,
-0.02656591, -0.998598, -4.036655, 0, 0, 1, 1, 1,
-0.02076269, 0.4373594, -1.004885, 1, 0, 0, 1, 1,
-0.01773303, -1.105805, -2.952736, 1, 0, 0, 1, 1,
-0.01685422, 0.3050818, 1.432227, 1, 0, 0, 1, 1,
-0.01591064, -0.8681929, -2.310473, 1, 0, 0, 1, 1,
-0.01133189, -0.8147378, -3.957527, 1, 0, 0, 1, 1,
-0.007670444, -0.2845397, -3.43423, 0, 0, 0, 1, 1,
-0.005351535, 0.4712394, -0.05145421, 0, 0, 0, 1, 1,
-0.002694385, 1.606965, -0.562423, 0, 0, 0, 1, 1,
0.01130697, 1.509739, -0.8098516, 0, 0, 0, 1, 1,
0.01835937, -0.318124, 4.546972, 0, 0, 0, 1, 1,
0.02467333, -1.850985, 3.435615, 0, 0, 0, 1, 1,
0.02728865, 0.7238529, -0.3414692, 0, 0, 0, 1, 1,
0.02761733, -0.1386874, 3.598317, 1, 1, 1, 1, 1,
0.02852467, -1.109836, 3.697059, 1, 1, 1, 1, 1,
0.02941338, 0.8709525, 1.640865, 1, 1, 1, 1, 1,
0.0294875, 0.8949993, -0.3813043, 1, 1, 1, 1, 1,
0.03386143, 0.8044983, -0.1186935, 1, 1, 1, 1, 1,
0.03519482, 1.01739, -0.8788821, 1, 1, 1, 1, 1,
0.03528703, 0.1744413, 1.804469, 1, 1, 1, 1, 1,
0.03608218, 0.6404055, 0.7976776, 1, 1, 1, 1, 1,
0.03716112, -1.433855, 3.32396, 1, 1, 1, 1, 1,
0.03774166, -0.2739428, 3.379188, 1, 1, 1, 1, 1,
0.04020299, -0.7769662, 5.044553, 1, 1, 1, 1, 1,
0.04048392, -1.102413, 3.087172, 1, 1, 1, 1, 1,
0.04525126, 2.107942, -0.4267965, 1, 1, 1, 1, 1,
0.04592716, -1.013867, 2.389294, 1, 1, 1, 1, 1,
0.05287249, -0.5794879, 3.572152, 1, 1, 1, 1, 1,
0.05326441, -0.3309717, 3.730088, 0, 0, 1, 1, 1,
0.05545927, -0.6163286, 3.222288, 1, 0, 0, 1, 1,
0.05699607, 1.011296, 1.457155, 1, 0, 0, 1, 1,
0.05884487, -0.06449911, 0.8225601, 1, 0, 0, 1, 1,
0.06092342, -0.6059406, 2.880935, 1, 0, 0, 1, 1,
0.06418394, -0.7155443, 3.323232, 1, 0, 0, 1, 1,
0.06624295, 1.294489, -0.143061, 0, 0, 0, 1, 1,
0.06660924, 1.277564, 0.9093292, 0, 0, 0, 1, 1,
0.06787075, 0.419586, 1.051584, 0, 0, 0, 1, 1,
0.07509566, 0.6956249, 0.5993853, 0, 0, 0, 1, 1,
0.09125286, 2.388425, -1.241322, 0, 0, 0, 1, 1,
0.0925934, 0.3560796, 0.1148272, 0, 0, 0, 1, 1,
0.09541179, 2.192212, 0.1022839, 0, 0, 0, 1, 1,
0.09921409, -0.3500585, 2.571633, 1, 1, 1, 1, 1,
0.09953276, -1.833572, 3.887527, 1, 1, 1, 1, 1,
0.1114646, -0.6352971, 2.714127, 1, 1, 1, 1, 1,
0.114613, -0.5399601, 5.407911, 1, 1, 1, 1, 1,
0.1160495, 0.08397273, 1.504369, 1, 1, 1, 1, 1,
0.1172122, 1.024445, -0.246665, 1, 1, 1, 1, 1,
0.1221108, -0.05893486, 1.284005, 1, 1, 1, 1, 1,
0.124077, 0.7757977, 0.5000606, 1, 1, 1, 1, 1,
0.1245832, -1.075392, 3.11067, 1, 1, 1, 1, 1,
0.126631, -1.326885, 3.719099, 1, 1, 1, 1, 1,
0.1321867, 0.2596517, 0.6506957, 1, 1, 1, 1, 1,
0.1344886, 1.13796, -0.8038025, 1, 1, 1, 1, 1,
0.1377614, 0.2512963, 0.3834788, 1, 1, 1, 1, 1,
0.1389061, 0.02016869, 2.858076, 1, 1, 1, 1, 1,
0.1391475, -1.000349, 4.381061, 1, 1, 1, 1, 1,
0.1421165, -0.5397717, 2.629, 0, 0, 1, 1, 1,
0.1433045, -1.074502, 3.124838, 1, 0, 0, 1, 1,
0.1534707, 0.5385532, -0.3130202, 1, 0, 0, 1, 1,
0.1566575, -0.4487779, 3.307521, 1, 0, 0, 1, 1,
0.1627413, -0.09922773, 0.548941, 1, 0, 0, 1, 1,
0.1657589, -0.03304018, 1.202949, 1, 0, 0, 1, 1,
0.165867, 1.318689, -0.5917732, 0, 0, 0, 1, 1,
0.1666053, -0.4860966, 2.643082, 0, 0, 0, 1, 1,
0.167682, -1.485823, 2.467188, 0, 0, 0, 1, 1,
0.1685412, -1.499959, 1.940145, 0, 0, 0, 1, 1,
0.1743023, -0.8480047, 3.557508, 0, 0, 0, 1, 1,
0.1766115, -0.269648, 2.834975, 0, 0, 0, 1, 1,
0.1780402, -0.3011634, 1.742588, 0, 0, 0, 1, 1,
0.183434, -0.2164878, 3.188576, 1, 1, 1, 1, 1,
0.1864002, -0.6463901, 4.118781, 1, 1, 1, 1, 1,
0.1981079, -1.872397, 4.84849, 1, 1, 1, 1, 1,
0.1988491, -0.02424628, 1.74991, 1, 1, 1, 1, 1,
0.2004761, 0.914919, 0.7329161, 1, 1, 1, 1, 1,
0.2015174, 0.26605, 0.6360103, 1, 1, 1, 1, 1,
0.2030988, -0.02066553, 3.114454, 1, 1, 1, 1, 1,
0.2037839, -0.9507327, 2.384303, 1, 1, 1, 1, 1,
0.2085638, -0.004673158, -1.05944, 1, 1, 1, 1, 1,
0.2131448, -1.866431, 4.028847, 1, 1, 1, 1, 1,
0.2203239, -0.5793458, 2.861643, 1, 1, 1, 1, 1,
0.2226488, 0.6758357, -0.9265556, 1, 1, 1, 1, 1,
0.2250176, 0.3282014, 1.323441, 1, 1, 1, 1, 1,
0.2251249, -2.308049, 3.089793, 1, 1, 1, 1, 1,
0.225603, 0.6816014, -0.3021859, 1, 1, 1, 1, 1,
0.2291647, 0.39576, -0.5162347, 0, 0, 1, 1, 1,
0.2299462, 1.87585, 0.6233076, 1, 0, 0, 1, 1,
0.2301638, 0.7202765, -0.5144135, 1, 0, 0, 1, 1,
0.2325184, 1.480255, 0.3765061, 1, 0, 0, 1, 1,
0.2334695, 0.5480106, -1.130666, 1, 0, 0, 1, 1,
0.2337885, 1.188141, 0.3259229, 1, 0, 0, 1, 1,
0.2339831, -0.7331019, 2.207497, 0, 0, 0, 1, 1,
0.2405095, -0.415766, 3.682148, 0, 0, 0, 1, 1,
0.2441895, 2.18788, -2.372448, 0, 0, 0, 1, 1,
0.2477497, -0.009611459, 2.377284, 0, 0, 0, 1, 1,
0.2512426, -0.7191441, 2.77381, 0, 0, 0, 1, 1,
0.2514641, -0.8532054, 3.779839, 0, 0, 0, 1, 1,
0.2553704, 1.047517, -0.9658964, 0, 0, 0, 1, 1,
0.2582425, 0.4895421, -2.4596, 1, 1, 1, 1, 1,
0.2584631, 1.15667, -0.4894341, 1, 1, 1, 1, 1,
0.2587762, 0.01201643, 1.511475, 1, 1, 1, 1, 1,
0.2644781, 0.7932467, 0.09180457, 1, 1, 1, 1, 1,
0.2667845, 0.456775, 0.902355, 1, 1, 1, 1, 1,
0.267399, 0.3334028, 0.8072906, 1, 1, 1, 1, 1,
0.2710987, 0.2815072, 1.032755, 1, 1, 1, 1, 1,
0.2734437, 0.3427903, 1.114166, 1, 1, 1, 1, 1,
0.278176, -0.06633658, 1.886472, 1, 1, 1, 1, 1,
0.2784912, -1.241661, 2.049706, 1, 1, 1, 1, 1,
0.2817269, -0.8212075, 1.875394, 1, 1, 1, 1, 1,
0.2820444, 1.458446, -1.021539, 1, 1, 1, 1, 1,
0.2828779, 0.07932823, 2.214932, 1, 1, 1, 1, 1,
0.2845839, 0.303597, -0.3597851, 1, 1, 1, 1, 1,
0.2851445, 0.3140984, -0.9155445, 1, 1, 1, 1, 1,
0.2890609, -0.344096, 1.449381, 0, 0, 1, 1, 1,
0.2966346, 1.446108, -0.7612405, 1, 0, 0, 1, 1,
0.2976024, 0.2203069, -0.5267848, 1, 0, 0, 1, 1,
0.2988372, -2.028152, 4.494911, 1, 0, 0, 1, 1,
0.2994569, 0.8058702, 0.6417833, 1, 0, 0, 1, 1,
0.3041613, 0.9566065, -0.5770254, 1, 0, 0, 1, 1,
0.3043813, -0.0196106, 3.953465, 0, 0, 0, 1, 1,
0.3059835, -1.613208, 1.238182, 0, 0, 0, 1, 1,
0.3061196, -0.01876924, 2.14035, 0, 0, 0, 1, 1,
0.308993, 1.618166, -0.1032231, 0, 0, 0, 1, 1,
0.3094247, 1.060612, -0.5796723, 0, 0, 0, 1, 1,
0.3123466, 1.058384, 1.712169, 0, 0, 0, 1, 1,
0.312537, -0.101149, 0.6181805, 0, 0, 0, 1, 1,
0.3147126, 1.943, -1.617992, 1, 1, 1, 1, 1,
0.3149599, -1.385255, 0.3368392, 1, 1, 1, 1, 1,
0.3152546, -0.733423, 0.146035, 1, 1, 1, 1, 1,
0.3171513, -1.298488, 3.294086, 1, 1, 1, 1, 1,
0.3209507, 1.066205, -0.1215108, 1, 1, 1, 1, 1,
0.3236393, 0.1488444, 2.693997, 1, 1, 1, 1, 1,
0.3238794, -0.6077615, 3.278693, 1, 1, 1, 1, 1,
0.3243467, 0.7690115, -0.4426769, 1, 1, 1, 1, 1,
0.3256987, -0.8289686, 3.150941, 1, 1, 1, 1, 1,
0.332339, -0.6709604, 1.698352, 1, 1, 1, 1, 1,
0.3329246, -0.4490137, 1.860804, 1, 1, 1, 1, 1,
0.3368073, 0.2312455, 2.206275, 1, 1, 1, 1, 1,
0.3371591, -1.008983, 4.437459, 1, 1, 1, 1, 1,
0.3383628, 1.188705, 1.206627, 1, 1, 1, 1, 1,
0.3395064, -1.111675, 3.057919, 1, 1, 1, 1, 1,
0.3405217, -0.218778, 3.965072, 0, 0, 1, 1, 1,
0.3421023, -2.482256, 1.656504, 1, 0, 0, 1, 1,
0.3426898, 0.2072495, 1.738155, 1, 0, 0, 1, 1,
0.3455962, 0.680791, -0.8880173, 1, 0, 0, 1, 1,
0.3458623, -0.3204345, 3.615683, 1, 0, 0, 1, 1,
0.3522702, -0.4040643, 2.82011, 1, 0, 0, 1, 1,
0.3570301, -0.7285697, 1.543641, 0, 0, 0, 1, 1,
0.3592606, -0.5849305, 2.927763, 0, 0, 0, 1, 1,
0.3666809, 0.8282965, -1.027915, 0, 0, 0, 1, 1,
0.3697592, 0.08404098, 1.626912, 0, 0, 0, 1, 1,
0.370135, 1.059855, 1.060379, 0, 0, 0, 1, 1,
0.3724653, 1.278304, 0.574487, 0, 0, 0, 1, 1,
0.3749413, -1.512209, 3.216365, 0, 0, 0, 1, 1,
0.375511, -0.5390914, 1.882781, 1, 1, 1, 1, 1,
0.3755196, 0.5111496, 0.0530031, 1, 1, 1, 1, 1,
0.375536, -0.2949435, 3.43603, 1, 1, 1, 1, 1,
0.3771183, 1.247787, 1.321065, 1, 1, 1, 1, 1,
0.3773266, 0.1900198, 0.3461386, 1, 1, 1, 1, 1,
0.3801092, 0.5312911, 1.024833, 1, 1, 1, 1, 1,
0.3808136, -0.7652083, 2.013604, 1, 1, 1, 1, 1,
0.3877546, -1.359913, 3.872939, 1, 1, 1, 1, 1,
0.3882111, 2.34872, 1.405598, 1, 1, 1, 1, 1,
0.391764, -0.0946992, 1.572447, 1, 1, 1, 1, 1,
0.3967081, 1.038451, 0.4295031, 1, 1, 1, 1, 1,
0.4002881, -0.07654672, 1.088221, 1, 1, 1, 1, 1,
0.4006602, 0.06655109, 1.847214, 1, 1, 1, 1, 1,
0.4011061, 1.761472, -0.3463628, 1, 1, 1, 1, 1,
0.4017524, 1.789926, 1.100475, 1, 1, 1, 1, 1,
0.4046517, 1.367989, -1.08738, 0, 0, 1, 1, 1,
0.4048187, 0.04500575, 1.898921, 1, 0, 0, 1, 1,
0.40985, 1.88465, 0.2069659, 1, 0, 0, 1, 1,
0.4111282, 1.364607, 0.9893591, 1, 0, 0, 1, 1,
0.4117782, -1.350257, 3.916337, 1, 0, 0, 1, 1,
0.4157385, 0.6547669, 0.2394352, 1, 0, 0, 1, 1,
0.41691, -1.997133, 2.72373, 0, 0, 0, 1, 1,
0.4170296, -0.2307996, 1.692631, 0, 0, 0, 1, 1,
0.4174625, -0.551027, 2.253988, 0, 0, 0, 1, 1,
0.4213648, -1.338773, 4.007312, 0, 0, 0, 1, 1,
0.423453, 0.2014653, 0.8078178, 0, 0, 0, 1, 1,
0.4261107, -1.296085, 1.907065, 0, 0, 0, 1, 1,
0.4263272, -0.08912182, 2.583961, 0, 0, 0, 1, 1,
0.4278731, -0.1592227, 2.091989, 1, 1, 1, 1, 1,
0.4280844, 0.06236484, 2.297444, 1, 1, 1, 1, 1,
0.4323905, 1.454335, 0.5670516, 1, 1, 1, 1, 1,
0.4324622, -0.09266682, 1.971961, 1, 1, 1, 1, 1,
0.4363685, 0.5536129, 0.9172804, 1, 1, 1, 1, 1,
0.4364252, -1.17278, 2.718078, 1, 1, 1, 1, 1,
0.4369384, 1.246038, 1.451611, 1, 1, 1, 1, 1,
0.4430981, 0.2033961, 1.498061, 1, 1, 1, 1, 1,
0.4480076, -1.236305, 4.14291, 1, 1, 1, 1, 1,
0.4482851, -0.2469554, 1.461244, 1, 1, 1, 1, 1,
0.4527327, -1.035785, 2.236944, 1, 1, 1, 1, 1,
0.4600532, -1.085916, 2.544968, 1, 1, 1, 1, 1,
0.46326, 1.703596, -0.1261092, 1, 1, 1, 1, 1,
0.4745326, -0.7166466, 1.342424, 1, 1, 1, 1, 1,
0.4816129, -0.561517, 2.942922, 1, 1, 1, 1, 1,
0.4850847, -1.296019, 2.692296, 0, 0, 1, 1, 1,
0.4863253, 1.483896, 1.077612, 1, 0, 0, 1, 1,
0.4883969, -0.7049889, -0.1822944, 1, 0, 0, 1, 1,
0.4896843, 1.286155, 1.21634, 1, 0, 0, 1, 1,
0.4925517, 0.1648391, 0.06239671, 1, 0, 0, 1, 1,
0.4955932, -0.3689025, 3.111277, 1, 0, 0, 1, 1,
0.4984697, -0.2392279, 3.490664, 0, 0, 0, 1, 1,
0.5018844, -0.003402257, 0.811107, 0, 0, 0, 1, 1,
0.504364, 2.253061, 0.4807125, 0, 0, 0, 1, 1,
0.5045457, 1.077708, 0.8438161, 0, 0, 0, 1, 1,
0.5079229, 3.089614, -0.5307495, 0, 0, 0, 1, 1,
0.5118678, 1.507645, 0.127853, 0, 0, 0, 1, 1,
0.5142689, 0.7035193, 1.344638, 0, 0, 0, 1, 1,
0.5145326, -1.238798, 3.263025, 1, 1, 1, 1, 1,
0.5150999, -0.7836365, 2.554238, 1, 1, 1, 1, 1,
0.5178661, -0.3439558, 2.938334, 1, 1, 1, 1, 1,
0.5229295, -2.884684, 3.740439, 1, 1, 1, 1, 1,
0.5265769, -0.0377519, 0.9623249, 1, 1, 1, 1, 1,
0.5283086, 0.414174, -1.267477, 1, 1, 1, 1, 1,
0.5286313, 2.43832, -1.09429, 1, 1, 1, 1, 1,
0.5293667, 1.171933, 0.9010254, 1, 1, 1, 1, 1,
0.529769, -0.3034064, 3.296385, 1, 1, 1, 1, 1,
0.5314076, 0.1247849, 0.6962923, 1, 1, 1, 1, 1,
0.5483663, -0.01301957, 2.860246, 1, 1, 1, 1, 1,
0.5499874, 0.322829, -0.49302, 1, 1, 1, 1, 1,
0.5519218, -0.1622608, 1.841721, 1, 1, 1, 1, 1,
0.5557669, -0.3596228, 1.614384, 1, 1, 1, 1, 1,
0.5564625, 0.5941594, 1.496258, 1, 1, 1, 1, 1,
0.5565798, 0.5347756, -0.6117024, 0, 0, 1, 1, 1,
0.5622187, 0.665945, 1.618905, 1, 0, 0, 1, 1,
0.5748937, 1.085248, -0.3151031, 1, 0, 0, 1, 1,
0.5778451, -0.4078659, 2.167604, 1, 0, 0, 1, 1,
0.5800595, 0.06456541, 0.3348897, 1, 0, 0, 1, 1,
0.581133, -0.9502407, 1.675568, 1, 0, 0, 1, 1,
0.5845743, 0.6550713, 0.7744054, 0, 0, 0, 1, 1,
0.5865201, -1.094382, 0.6247704, 0, 0, 0, 1, 1,
0.5878556, 0.8297089, -0.7524794, 0, 0, 0, 1, 1,
0.5880272, 0.3678687, 2.155057, 0, 0, 0, 1, 1,
0.5915684, 0.8948067, 1.945042, 0, 0, 0, 1, 1,
0.5985289, 0.05734298, 2.519387, 0, 0, 0, 1, 1,
0.6024446, 0.3318864, 2.744266, 0, 0, 0, 1, 1,
0.6084049, 0.839249, 1.498246, 1, 1, 1, 1, 1,
0.6120197, 0.177402, 1.907105, 1, 1, 1, 1, 1,
0.6232242, 1.61291, -0.6393918, 1, 1, 1, 1, 1,
0.6253774, -0.4508942, 3.709936, 1, 1, 1, 1, 1,
0.6362858, 0.3806909, 1.083457, 1, 1, 1, 1, 1,
0.6377186, 1.806749, 0.7024788, 1, 1, 1, 1, 1,
0.639307, -1.935795, 2.360454, 1, 1, 1, 1, 1,
0.6398863, 1.414451, 1.456752, 1, 1, 1, 1, 1,
0.6451052, 0.4438594, 0.7621585, 1, 1, 1, 1, 1,
0.6453755, -1.365573, 2.531325, 1, 1, 1, 1, 1,
0.6457838, -1.285475, 2.567952, 1, 1, 1, 1, 1,
0.6463596, 1.825593, 0.1712152, 1, 1, 1, 1, 1,
0.6471362, -0.05066467, 1.653822, 1, 1, 1, 1, 1,
0.6543443, 0.8028957, 0.8960441, 1, 1, 1, 1, 1,
0.6544858, 0.04271413, 2.172492, 1, 1, 1, 1, 1,
0.6556495, 0.4571007, 0.7174199, 0, 0, 1, 1, 1,
0.6600852, -0.5337713, 0.3312018, 1, 0, 0, 1, 1,
0.6691805, -0.6735179, 1.439882, 1, 0, 0, 1, 1,
0.6702582, -0.0121623, -0.195507, 1, 0, 0, 1, 1,
0.6741798, 0.5770192, 1.666838, 1, 0, 0, 1, 1,
0.675463, -0.1801201, 1.967871, 1, 0, 0, 1, 1,
0.6844392, 0.6171312, 0.3382528, 0, 0, 0, 1, 1,
0.6864883, -0.2972134, -0.2348027, 0, 0, 0, 1, 1,
0.6872867, 1.435822, -0.6245316, 0, 0, 0, 1, 1,
0.6902811, 1.124391, 0.6862633, 0, 0, 0, 1, 1,
0.691039, -0.1446974, 1.842573, 0, 0, 0, 1, 1,
0.692648, -0.2968413, 3.201713, 0, 0, 0, 1, 1,
0.6927109, 0.005512469, 0.5197551, 0, 0, 0, 1, 1,
0.693783, 1.448669, -0.3440102, 1, 1, 1, 1, 1,
0.7051504, 0.6841041, -0.1526148, 1, 1, 1, 1, 1,
0.7075766, -0.001588204, 0.7206148, 1, 1, 1, 1, 1,
0.7080862, -2.462817, 1.62336, 1, 1, 1, 1, 1,
0.7092301, 0.4931983, 1.758412, 1, 1, 1, 1, 1,
0.7122135, -0.501827, 2.606539, 1, 1, 1, 1, 1,
0.7171031, -0.4616429, 1.721284, 1, 1, 1, 1, 1,
0.7190146, 0.5665784, 1.740399, 1, 1, 1, 1, 1,
0.7217285, -0.2870759, 2.498677, 1, 1, 1, 1, 1,
0.7217626, 1.298307, 0.7663783, 1, 1, 1, 1, 1,
0.7219009, 1.934494, 0.3256324, 1, 1, 1, 1, 1,
0.7225884, 0.7212828, 2.833125, 1, 1, 1, 1, 1,
0.7230455, 0.7425564, 0.2688996, 1, 1, 1, 1, 1,
0.7282412, 0.8975179, 1.690211, 1, 1, 1, 1, 1,
0.7397513, -0.7206835, 2.383924, 1, 1, 1, 1, 1,
0.7473057, 1.665711, 1.351231, 0, 0, 1, 1, 1,
0.7485236, 1.774835, -0.2018477, 1, 0, 0, 1, 1,
0.7565465, -1.029566, 3.451318, 1, 0, 0, 1, 1,
0.762183, 1.389527, -1.232787, 1, 0, 0, 1, 1,
0.7632481, -0.1614958, 0.5919943, 1, 0, 0, 1, 1,
0.76516, -0.1863404, 1.911214, 1, 0, 0, 1, 1,
0.7661956, 1.031469, 2.625417, 0, 0, 0, 1, 1,
0.7696618, -1.466884, 2.791497, 0, 0, 0, 1, 1,
0.7751628, -0.1410335, -0.1296093, 0, 0, 0, 1, 1,
0.7831512, -0.6145966, 1.893535, 0, 0, 0, 1, 1,
0.7861223, -0.3433638, -0.7910224, 0, 0, 0, 1, 1,
0.7884195, 1.484687, 0.9394329, 0, 0, 0, 1, 1,
0.7998725, 0.8735121, 0.1597064, 0, 0, 0, 1, 1,
0.8021527, 1.091728, -0.008011999, 1, 1, 1, 1, 1,
0.8026525, -0.8983923, 3.851488, 1, 1, 1, 1, 1,
0.8070312, -0.8944443, 3.002749, 1, 1, 1, 1, 1,
0.8091106, -1.168335, 3.628888, 1, 1, 1, 1, 1,
0.8099427, -1.458644, 4.356617, 1, 1, 1, 1, 1,
0.8101733, -0.3321137, 1.935167, 1, 1, 1, 1, 1,
0.8126714, -0.3006382, 1.225964, 1, 1, 1, 1, 1,
0.8144736, -0.1113013, 2.36398, 1, 1, 1, 1, 1,
0.8149031, 0.9052813, 0.98984, 1, 1, 1, 1, 1,
0.8176218, 1.485279, 1.161668, 1, 1, 1, 1, 1,
0.8210733, -0.1316764, 2.001309, 1, 1, 1, 1, 1,
0.8238295, -0.6698301, 3.001253, 1, 1, 1, 1, 1,
0.8250921, -0.02941518, 1.576592, 1, 1, 1, 1, 1,
0.8355644, 1.665905, -0.7357365, 1, 1, 1, 1, 1,
0.8356392, 2.169206, -0.1256298, 1, 1, 1, 1, 1,
0.8390468, 0.723029, 2.110741, 0, 0, 1, 1, 1,
0.8397902, 1.697311, -0.6508355, 1, 0, 0, 1, 1,
0.842549, -1.505679, 4.573181, 1, 0, 0, 1, 1,
0.8448956, -0.1625014, 3.58167, 1, 0, 0, 1, 1,
0.8472902, -0.004012982, 2.798599, 1, 0, 0, 1, 1,
0.8513103, -1.093606, 1.35127, 1, 0, 0, 1, 1,
0.8592358, 0.1010785, 0.6240522, 0, 0, 0, 1, 1,
0.8603978, 0.2159553, 3.039944, 0, 0, 0, 1, 1,
0.8631561, 0.9666566, 0.7097441, 0, 0, 0, 1, 1,
0.8633351, -0.386214, 2.179124, 0, 0, 0, 1, 1,
0.8655435, -0.5285135, 1.601265, 0, 0, 0, 1, 1,
0.8658525, 0.1828095, 0.1615155, 0, 0, 0, 1, 1,
0.8719526, 0.2409904, 2.598283, 0, 0, 0, 1, 1,
0.880046, -1.427276, 2.508399, 1, 1, 1, 1, 1,
0.8825033, -2.212994, 3.573356, 1, 1, 1, 1, 1,
0.8836638, -1.967921, 1.147177, 1, 1, 1, 1, 1,
0.884173, -0.9991304, 2.760817, 1, 1, 1, 1, 1,
0.8872547, 0.3510306, 2.374504, 1, 1, 1, 1, 1,
0.8885989, -0.3005034, 1.669325, 1, 1, 1, 1, 1,
0.892881, -1.276961, 3.273125, 1, 1, 1, 1, 1,
0.8937163, 0.7204698, 0.09594516, 1, 1, 1, 1, 1,
0.8951908, 0.3671986, 1.776038, 1, 1, 1, 1, 1,
0.8953263, -0.4872412, 0.6057232, 1, 1, 1, 1, 1,
0.9032103, 0.866157, -0.3132862, 1, 1, 1, 1, 1,
0.916544, -0.2904695, 2.173117, 1, 1, 1, 1, 1,
0.9267919, -1.700546, 1.847619, 1, 1, 1, 1, 1,
0.9331639, 1.731319, 0.519297, 1, 1, 1, 1, 1,
0.9351652, -0.7400506, 0.0872852, 1, 1, 1, 1, 1,
0.9361501, 0.1954155, 1.852275, 0, 0, 1, 1, 1,
0.9410785, 1.095737, 0.799261, 1, 0, 0, 1, 1,
0.9419793, -1.179327, 2.674007, 1, 0, 0, 1, 1,
0.9429205, -0.8111151, 1.794027, 1, 0, 0, 1, 1,
0.9545204, -0.9032449, 3.22299, 1, 0, 0, 1, 1,
0.9570286, 1.327277, 1.39954, 1, 0, 0, 1, 1,
0.9596903, 2.041588, 0.8082705, 0, 0, 0, 1, 1,
0.9609463, -0.9363674, 1.954654, 0, 0, 0, 1, 1,
0.9626976, 0.06222838, 1.146632, 0, 0, 0, 1, 1,
0.9636989, 1.319429, 0.6960865, 0, 0, 0, 1, 1,
0.9646319, 1.393049, 0.02725628, 0, 0, 0, 1, 1,
0.9759818, 1.382089, 0.2375948, 0, 0, 0, 1, 1,
0.9766837, -0.7024021, 2.48572, 0, 0, 0, 1, 1,
0.9785615, -0.7337927, 2.910091, 1, 1, 1, 1, 1,
0.9789304, -1.422997, 3.05566, 1, 1, 1, 1, 1,
0.9814912, 1.177501, -0.2629789, 1, 1, 1, 1, 1,
0.9815235, 0.030708, 0.3302768, 1, 1, 1, 1, 1,
0.9863888, -0.7892053, 1.857277, 1, 1, 1, 1, 1,
0.9961398, 1.743706, 0.7361147, 1, 1, 1, 1, 1,
0.9980071, 0.8202692, -1.269657, 1, 1, 1, 1, 1,
1.002261, -1.012339, 3.240957, 1, 1, 1, 1, 1,
1.009902, 0.2309983, 2.054006, 1, 1, 1, 1, 1,
1.015162, 0.6206297, 3.478057, 1, 1, 1, 1, 1,
1.017678, -2.624808, 3.14537, 1, 1, 1, 1, 1,
1.043731, 0.7599537, 1.987769, 1, 1, 1, 1, 1,
1.046501, 0.3425619, 1.19276, 1, 1, 1, 1, 1,
1.047373, 0.7336637, 0.770687, 1, 1, 1, 1, 1,
1.047537, 0.6846526, 2.172861, 1, 1, 1, 1, 1,
1.061516, 0.5899978, 2.521174, 0, 0, 1, 1, 1,
1.066389, 0.6909253, 0.9667188, 1, 0, 0, 1, 1,
1.066524, 1.705966, 1.918457, 1, 0, 0, 1, 1,
1.066947, -0.5566356, 3.945612, 1, 0, 0, 1, 1,
1.066947, -0.4377303, -0.06630034, 1, 0, 0, 1, 1,
1.071303, 0.9642655, 2.339931, 1, 0, 0, 1, 1,
1.076897, -0.5733765, 1.471471, 0, 0, 0, 1, 1,
1.079702, 0.2907574, 2.3133, 0, 0, 0, 1, 1,
1.089422, -0.714038, 2.319205, 0, 0, 0, 1, 1,
1.096155, 0.8917078, 1.961532, 0, 0, 0, 1, 1,
1.100274, -2.194113, 3.464059, 0, 0, 0, 1, 1,
1.111095, 0.6874516, 3.461368, 0, 0, 0, 1, 1,
1.113662, 1.85689, 0.491048, 0, 0, 0, 1, 1,
1.126356, 1.053138, 1.897085, 1, 1, 1, 1, 1,
1.133425, 0.379262, 1.75297, 1, 1, 1, 1, 1,
1.149389, -0.7580273, 1.547423, 1, 1, 1, 1, 1,
1.151512, 0.3204964, 0.6282358, 1, 1, 1, 1, 1,
1.15225, -0.7405459, 2.956084, 1, 1, 1, 1, 1,
1.161837, 0.555186, 1.255571, 1, 1, 1, 1, 1,
1.164588, -0.4805188, 1.74802, 1, 1, 1, 1, 1,
1.166179, -2.501956, 1.811046, 1, 1, 1, 1, 1,
1.168535, -0.3728733, 1.70294, 1, 1, 1, 1, 1,
1.181874, 1.123304, 0.4721057, 1, 1, 1, 1, 1,
1.188447, 1.238505, 1.45007, 1, 1, 1, 1, 1,
1.197989, -0.8953061, 0.4181931, 1, 1, 1, 1, 1,
1.198248, 2.213356, 0.4003827, 1, 1, 1, 1, 1,
1.200559, -1.374827, 0.8595608, 1, 1, 1, 1, 1,
1.20618, 0.2246895, 1.260661, 1, 1, 1, 1, 1,
1.206981, -0.5169672, 1.527614, 0, 0, 1, 1, 1,
1.210293, 1.015287, 1.662662, 1, 0, 0, 1, 1,
1.221035, 0.1954022, 1.708432, 1, 0, 0, 1, 1,
1.223868, 0.6743713, 1.233351, 1, 0, 0, 1, 1,
1.225898, 1.268856, 0.7305092, 1, 0, 0, 1, 1,
1.228491, -0.1234687, 2.946694, 1, 0, 0, 1, 1,
1.2362, -1.151164, 1.431726, 0, 0, 0, 1, 1,
1.245726, -1.822671, 1.185454, 0, 0, 0, 1, 1,
1.251136, 0.1854485, 0.9400148, 0, 0, 0, 1, 1,
1.253135, 0.4380808, 2.295099, 0, 0, 0, 1, 1,
1.254574, 0.05075968, 0.4063421, 0, 0, 0, 1, 1,
1.273255, 0.4148666, 1.865556, 0, 0, 0, 1, 1,
1.282143, -0.5729766, 2.197797, 0, 0, 0, 1, 1,
1.287668, 0.1335294, 2.33843, 1, 1, 1, 1, 1,
1.297758, 1.201263, -1.064585, 1, 1, 1, 1, 1,
1.30066, -0.3278945, 1.361707, 1, 1, 1, 1, 1,
1.30652, -1.173474, 2.654701, 1, 1, 1, 1, 1,
1.316851, -1.511533, 3.294024, 1, 1, 1, 1, 1,
1.320382, -0.468722, 2.051757, 1, 1, 1, 1, 1,
1.324189, -0.6415079, 0.5718758, 1, 1, 1, 1, 1,
1.327896, -0.3584943, 2.06862, 1, 1, 1, 1, 1,
1.335685, -0.4425543, 3.21168, 1, 1, 1, 1, 1,
1.335829, 1.447767, 0.0378747, 1, 1, 1, 1, 1,
1.336065, -0.402187, 1.473882, 1, 1, 1, 1, 1,
1.339423, -0.6391857, 0.5038757, 1, 1, 1, 1, 1,
1.340141, 0.2272802, 1.628582, 1, 1, 1, 1, 1,
1.340961, 0.8917435, 0.2515256, 1, 1, 1, 1, 1,
1.342658, 0.516601, -0.2948152, 1, 1, 1, 1, 1,
1.347094, 0.446098, 1.139661, 0, 0, 1, 1, 1,
1.350647, -0.9132106, 1.253288, 1, 0, 0, 1, 1,
1.353617, 1.22971, 0.9289306, 1, 0, 0, 1, 1,
1.367693, 0.03951957, 2.292412, 1, 0, 0, 1, 1,
1.372271, 0.8779886, 2.640471, 1, 0, 0, 1, 1,
1.377667, -1.093673, 3.756363, 1, 0, 0, 1, 1,
1.379466, 0.7561671, 0.3128709, 0, 0, 0, 1, 1,
1.383641, 1.72769, 2.387495, 0, 0, 0, 1, 1,
1.392003, 0.3312556, 1.711895, 0, 0, 0, 1, 1,
1.397726, -1.141347, 1.138977, 0, 0, 0, 1, 1,
1.402071, -0.4457653, 2.222037, 0, 0, 0, 1, 1,
1.407016, -0.04612895, 0.9747289, 0, 0, 0, 1, 1,
1.407073, -2.386061, 2.307916, 0, 0, 0, 1, 1,
1.421442, -1.453666, 1.430902, 1, 1, 1, 1, 1,
1.422413, -1.857194, 2.082016, 1, 1, 1, 1, 1,
1.422572, 0.4347859, 0.6316473, 1, 1, 1, 1, 1,
1.433262, -0.7149974, 1.680592, 1, 1, 1, 1, 1,
1.440536, -0.4258506, 3.293061, 1, 1, 1, 1, 1,
1.444797, -1.233224, 2.446648, 1, 1, 1, 1, 1,
1.448567, -0.4618086, 0.6020109, 1, 1, 1, 1, 1,
1.452361, -0.3417757, 2.24044, 1, 1, 1, 1, 1,
1.459762, 1.143314, -0.6821588, 1, 1, 1, 1, 1,
1.462912, 0.9636923, 1.67306, 1, 1, 1, 1, 1,
1.467126, -0.9166391, 1.147537, 1, 1, 1, 1, 1,
1.468754, 1.511019, 1.059817, 1, 1, 1, 1, 1,
1.475572, 0.457973, 0.2933356, 1, 1, 1, 1, 1,
1.482007, -0.5759346, 1.56112, 1, 1, 1, 1, 1,
1.48287, 1.296419, 1.223909, 1, 1, 1, 1, 1,
1.495944, 2.036161, 0.8492787, 0, 0, 1, 1, 1,
1.499024, 0.3957929, 1.928611, 1, 0, 0, 1, 1,
1.518423, 1.592388, 2.994015, 1, 0, 0, 1, 1,
1.53321, 1.455199, 1.554138, 1, 0, 0, 1, 1,
1.537903, 1.352959, 0.8842477, 1, 0, 0, 1, 1,
1.551287, 0.2539729, 2.133019, 1, 0, 0, 1, 1,
1.569619, 0.1528952, 0.5452229, 0, 0, 0, 1, 1,
1.596061, 0.7641776, -0.5843269, 0, 0, 0, 1, 1,
1.606937, 1.377785, 1.157604, 0, 0, 0, 1, 1,
1.620854, 0.9036899, 0.6634292, 0, 0, 0, 1, 1,
1.62981, 1.045023, 1.723465, 0, 0, 0, 1, 1,
1.676438, -0.2764224, 2.896387, 0, 0, 0, 1, 1,
1.677776, 1.639802, -0.1046299, 0, 0, 0, 1, 1,
1.683464, 0.3461864, 1.432065, 1, 1, 1, 1, 1,
1.688567, 0.02591124, 1.704595, 1, 1, 1, 1, 1,
1.695912, -1.064259, 1.362924, 1, 1, 1, 1, 1,
1.696065, 0.6717219, 2.880791, 1, 1, 1, 1, 1,
1.696846, -2.172295, 4.14799, 1, 1, 1, 1, 1,
1.710293, -1.096088, 0.2928984, 1, 1, 1, 1, 1,
1.721515, 0.6532435, -0.4265473, 1, 1, 1, 1, 1,
1.732275, 0.02555665, 2.50914, 1, 1, 1, 1, 1,
1.739262, -1.417736, 2.180274, 1, 1, 1, 1, 1,
1.741072, -1.737416, 1.420524, 1, 1, 1, 1, 1,
1.747638, 1.156961, -0.8377321, 1, 1, 1, 1, 1,
1.753504, -0.8216943, 0.5114797, 1, 1, 1, 1, 1,
1.753686, 1.687692, 1.538957, 1, 1, 1, 1, 1,
1.77858, -0.1761866, 1.599094, 1, 1, 1, 1, 1,
1.790016, 1.653574, 0.01846192, 1, 1, 1, 1, 1,
1.798066, -2.497895, 3.223828, 0, 0, 1, 1, 1,
1.8036, 0.4262725, 2.008804, 1, 0, 0, 1, 1,
1.839084, 2.128994, 0.4281757, 1, 0, 0, 1, 1,
1.843379, -0.5570087, 2.544698, 1, 0, 0, 1, 1,
1.863055, -0.4205738, 1.680326, 1, 0, 0, 1, 1,
1.896119, 0.7399476, 1.162102, 1, 0, 0, 1, 1,
1.899171, -0.06880423, 2.480266, 0, 0, 0, 1, 1,
1.907268, -1.130433, 1.959331, 0, 0, 0, 1, 1,
1.918685, 0.08202504, 1.149727, 0, 0, 0, 1, 1,
1.919626, 2.012105, 1.583807, 0, 0, 0, 1, 1,
1.923076, -0.03209913, 1.079345, 0, 0, 0, 1, 1,
1.937408, 0.480627, 2.925544, 0, 0, 0, 1, 1,
1.957899, -0.4837069, 1.102362, 0, 0, 0, 1, 1,
1.966014, 1.056403, -0.05997755, 1, 1, 1, 1, 1,
1.974465, 1.75921, -1.468482, 1, 1, 1, 1, 1,
1.982716, 0.109294, 3.696195, 1, 1, 1, 1, 1,
2.010128, 0.5621337, 1.728363, 1, 1, 1, 1, 1,
2.011967, -1.727797, 3.618742, 1, 1, 1, 1, 1,
2.012677, -0.3061156, 2.376778, 1, 1, 1, 1, 1,
2.076966, 0.5852272, 0.6523414, 1, 1, 1, 1, 1,
2.078249, -0.4350957, 0.9019858, 1, 1, 1, 1, 1,
2.0817, 0.3228973, -1.139278, 1, 1, 1, 1, 1,
2.092329, -0.3927095, 0.6022031, 1, 1, 1, 1, 1,
2.095288, 0.8249569, 1.980306, 1, 1, 1, 1, 1,
2.114072, -0.09963951, 1.275305, 1, 1, 1, 1, 1,
2.135659, 0.05541926, 1.704089, 1, 1, 1, 1, 1,
2.155721, 2.269733, 1.31951, 1, 1, 1, 1, 1,
2.157706, -1.12647, 3.049151, 1, 1, 1, 1, 1,
2.169916, 0.9880843, 0.8425164, 0, 0, 1, 1, 1,
2.172701, 0.1519356, 1.203209, 1, 0, 0, 1, 1,
2.176572, -0.4662535, 2.58032, 1, 0, 0, 1, 1,
2.180884, -1.297749, 2.94479, 1, 0, 0, 1, 1,
2.198192, 0.05688701, 1.619474, 1, 0, 0, 1, 1,
2.228574, -0.5254299, 0.8361071, 1, 0, 0, 1, 1,
2.273316, -0.58237, 1.214342, 0, 0, 0, 1, 1,
2.28806, -0.3897925, 2.39854, 0, 0, 0, 1, 1,
2.305202, -1.550633, 2.759475, 0, 0, 0, 1, 1,
2.315154, -0.5573053, 0.9821188, 0, 0, 0, 1, 1,
2.370044, -1.468553, 2.50981, 0, 0, 0, 1, 1,
2.425804, 2.283202, 3.120396, 0, 0, 0, 1, 1,
2.441787, -1.586466, 1.300468, 0, 0, 0, 1, 1,
2.465404, -0.04612616, 2.575992, 1, 1, 1, 1, 1,
2.535035, -0.2415477, 0.4636523, 1, 1, 1, 1, 1,
2.547448, 0.3521061, 2.048667, 1, 1, 1, 1, 1,
2.56279, 1.145408, 0.1808122, 1, 1, 1, 1, 1,
2.607039, 1.186931, 1.756118, 1, 1, 1, 1, 1,
2.626599, 0.9112138, 1.774195, 1, 1, 1, 1, 1,
2.746086, -0.3596755, 3.07657, 1, 1, 1, 1, 1
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
var radius = 9.579206;
var distance = 33.64656;
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
mvMatrix.translate( 0.1722583, -0.1024649, 0.2692828 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.64656);
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
