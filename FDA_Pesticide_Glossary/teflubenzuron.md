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
-3.392364, 0.4312809, -1.73685, 1, 0, 0, 1,
-3.180287, 1.486406, -0.4834364, 1, 0.007843138, 0, 1,
-2.543117, 0.214049, -0.6514365, 1, 0.01176471, 0, 1,
-2.408736, 0.5694637, -1.848463, 1, 0.01960784, 0, 1,
-2.399719, 0.874296, -1.058692, 1, 0.02352941, 0, 1,
-2.382369, 0.2479506, -1.311751, 1, 0.03137255, 0, 1,
-2.322082, -0.8639565, -0.5305049, 1, 0.03529412, 0, 1,
-2.320283, 0.448658, -1.142404, 1, 0.04313726, 0, 1,
-2.294749, -1.818237, -2.554436, 1, 0.04705882, 0, 1,
-2.287122, -0.3420683, -0.4978101, 1, 0.05490196, 0, 1,
-2.287105, -0.1370866, -3.242685, 1, 0.05882353, 0, 1,
-2.282439, -0.6424169, -2.346577, 1, 0.06666667, 0, 1,
-2.212188, -0.9964385, -3.107172, 1, 0.07058824, 0, 1,
-2.19295, -0.2252014, -2.155116, 1, 0.07843138, 0, 1,
-2.126372, -1.083152, -2.793809, 1, 0.08235294, 0, 1,
-2.124198, -0.5555879, -2.111639, 1, 0.09019608, 0, 1,
-2.110638, 1.418024, -1.877199, 1, 0.09411765, 0, 1,
-2.096789, 0.8017318, -2.888829, 1, 0.1019608, 0, 1,
-2.050487, -0.9794652, -0.4264916, 1, 0.1098039, 0, 1,
-2.033081, 1.533068, 0.6807445, 1, 0.1137255, 0, 1,
-2.009589, -0.1346159, -3.811495, 1, 0.1215686, 0, 1,
-1.967027, 0.152406, -1.046139, 1, 0.1254902, 0, 1,
-1.962502, -0.3879157, -1.578139, 1, 0.1333333, 0, 1,
-1.950565, 1.999422, 0.1270198, 1, 0.1372549, 0, 1,
-1.938154, -0.6338249, -0.5912713, 1, 0.145098, 0, 1,
-1.922193, -1.155509, -2.099655, 1, 0.1490196, 0, 1,
-1.911141, -0.2598017, -0.4194582, 1, 0.1568628, 0, 1,
-1.909371, 1.116928, -0.7212892, 1, 0.1607843, 0, 1,
-1.90565, -1.204156, -1.85116, 1, 0.1686275, 0, 1,
-1.903346, 0.1099249, 0.1615837, 1, 0.172549, 0, 1,
-1.901508, 0.5519824, 0.3003417, 1, 0.1803922, 0, 1,
-1.866324, 0.2937109, -1.65737, 1, 0.1843137, 0, 1,
-1.847909, 1.574831, 0.1383578, 1, 0.1921569, 0, 1,
-1.843817, -0.6659907, -1.81307, 1, 0.1960784, 0, 1,
-1.842119, 0.5964179, -0.3748612, 1, 0.2039216, 0, 1,
-1.833006, 0.1343001, -0.9907851, 1, 0.2117647, 0, 1,
-1.832303, 0.242461, 0.7197961, 1, 0.2156863, 0, 1,
-1.825548, -1.995974, -2.291945, 1, 0.2235294, 0, 1,
-1.80473, -0.9909015, -0.4549549, 1, 0.227451, 0, 1,
-1.791728, 1.707753, 1.35876, 1, 0.2352941, 0, 1,
-1.772944, -1.21013, -1.230006, 1, 0.2392157, 0, 1,
-1.757965, 1.439882, -1.405096, 1, 0.2470588, 0, 1,
-1.711069, 0.0498043, -1.295017, 1, 0.2509804, 0, 1,
-1.69918, 1.888261, -0.4898496, 1, 0.2588235, 0, 1,
-1.698001, 0.4477942, -2.03984, 1, 0.2627451, 0, 1,
-1.695064, 1.338586, -1.1886, 1, 0.2705882, 0, 1,
-1.688331, -0.7108961, -1.891063, 1, 0.2745098, 0, 1,
-1.685991, 0.1193393, -1.001266, 1, 0.282353, 0, 1,
-1.683528, 0.2325885, 0.8082486, 1, 0.2862745, 0, 1,
-1.671493, 1.50167, 0.3799426, 1, 0.2941177, 0, 1,
-1.662794, -0.6982421, -1.87603, 1, 0.3019608, 0, 1,
-1.65915, -2.262348, -3.577356, 1, 0.3058824, 0, 1,
-1.650466, -0.3445131, -2.680634, 1, 0.3137255, 0, 1,
-1.646177, -0.4455313, -1.509208, 1, 0.3176471, 0, 1,
-1.642231, 0.1871815, 0.01646123, 1, 0.3254902, 0, 1,
-1.6375, -0.1582446, -1.550589, 1, 0.3294118, 0, 1,
-1.618076, -0.2617306, -0.3046352, 1, 0.3372549, 0, 1,
-1.61236, -1.157318, -2.114516, 1, 0.3411765, 0, 1,
-1.608183, -0.4448921, -2.291842, 1, 0.3490196, 0, 1,
-1.60544, 0.02345739, -1.55121, 1, 0.3529412, 0, 1,
-1.597484, 1.278491, -2.451247, 1, 0.3607843, 0, 1,
-1.571321, -1.446786, -2.081375, 1, 0.3647059, 0, 1,
-1.550101, 0.1170273, -1.458303, 1, 0.372549, 0, 1,
-1.547827, -0.4120188, -1.230652, 1, 0.3764706, 0, 1,
-1.533545, 1.147322, -1.384194, 1, 0.3843137, 0, 1,
-1.529439, -1.417021, -2.395089, 1, 0.3882353, 0, 1,
-1.519372, -0.9243304, -3.396437, 1, 0.3960784, 0, 1,
-1.512172, -1.896799, -1.788395, 1, 0.4039216, 0, 1,
-1.507454, -0.6489688, -2.654411, 1, 0.4078431, 0, 1,
-1.49617, 2.055707, -1.039355, 1, 0.4156863, 0, 1,
-1.486272, -1.63326, -2.157496, 1, 0.4196078, 0, 1,
-1.479206, -0.03857012, -2.91212, 1, 0.427451, 0, 1,
-1.469116, -1.115908, -2.877275, 1, 0.4313726, 0, 1,
-1.46418, 0.3690651, -0.2128612, 1, 0.4392157, 0, 1,
-1.455063, -0.4565005, -0.1010485, 1, 0.4431373, 0, 1,
-1.44083, -0.6431231, -0.4589889, 1, 0.4509804, 0, 1,
-1.440233, -1.56266, -1.284794, 1, 0.454902, 0, 1,
-1.438885, 0.9366475, 0.863003, 1, 0.4627451, 0, 1,
-1.423635, -0.7441748, -1.742099, 1, 0.4666667, 0, 1,
-1.415486, 0.7416826, -3.057837, 1, 0.4745098, 0, 1,
-1.413405, -0.1980927, -3.550022, 1, 0.4784314, 0, 1,
-1.396425, 0.01027118, -1.61575, 1, 0.4862745, 0, 1,
-1.393671, 0.662928, -1.915383, 1, 0.4901961, 0, 1,
-1.392274, -0.2821812, -1.375282, 1, 0.4980392, 0, 1,
-1.377386, -1.043657, -2.651578, 1, 0.5058824, 0, 1,
-1.374419, 1.668972, 0.11918, 1, 0.509804, 0, 1,
-1.35915, 1.149102, 0.7850733, 1, 0.5176471, 0, 1,
-1.35692, -0.6399043, -0.80837, 1, 0.5215687, 0, 1,
-1.355454, 0.281284, 0.0878462, 1, 0.5294118, 0, 1,
-1.350873, -1.820815, -3.147022, 1, 0.5333334, 0, 1,
-1.350869, -0.5070449, -3.08002, 1, 0.5411765, 0, 1,
-1.33931, -1.253328, -3.351627, 1, 0.5450981, 0, 1,
-1.328992, 1.040298, -0.8698312, 1, 0.5529412, 0, 1,
-1.31764, 0.8838788, -1.304885, 1, 0.5568628, 0, 1,
-1.316738, 1.33273, -1.374472, 1, 0.5647059, 0, 1,
-1.310993, 0.193453, -1.586131, 1, 0.5686275, 0, 1,
-1.308185, -0.07653821, -0.6182491, 1, 0.5764706, 0, 1,
-1.307124, -0.6074393, -3.212969, 1, 0.5803922, 0, 1,
-1.299151, 0.3123773, 0.4327945, 1, 0.5882353, 0, 1,
-1.27659, 0.4701727, 0.1104606, 1, 0.5921569, 0, 1,
-1.271281, 1.928868, -2.243715, 1, 0.6, 0, 1,
-1.26395, 1.772068, -1.552169, 1, 0.6078432, 0, 1,
-1.260463, -0.8566889, -1.43693, 1, 0.6117647, 0, 1,
-1.260168, 0.2958752, -1.209733, 1, 0.6196079, 0, 1,
-1.255738, -0.2831644, -1.179088, 1, 0.6235294, 0, 1,
-1.252657, -1.351669, -3.682461, 1, 0.6313726, 0, 1,
-1.252639, 1.727792, -1.188823, 1, 0.6352941, 0, 1,
-1.247298, 0.1519758, -0.2823569, 1, 0.6431373, 0, 1,
-1.244027, 0.05641519, -0.4888238, 1, 0.6470588, 0, 1,
-1.23909, 1.380435, -1.216507, 1, 0.654902, 0, 1,
-1.223849, 0.6932295, -1.144427, 1, 0.6588235, 0, 1,
-1.206532, -0.3921576, -1.131335, 1, 0.6666667, 0, 1,
-1.205895, -1.2542, -3.336921, 1, 0.6705883, 0, 1,
-1.18142, 0.5204949, -0.5078782, 1, 0.6784314, 0, 1,
-1.174839, 1.234339, -0.1041294, 1, 0.682353, 0, 1,
-1.173881, 1.314753, 1.492148, 1, 0.6901961, 0, 1,
-1.172477, -1.553796, -2.999079, 1, 0.6941177, 0, 1,
-1.160917, 1.95085, -1.479003, 1, 0.7019608, 0, 1,
-1.146473, 0.8900891, 1.411013, 1, 0.7098039, 0, 1,
-1.142034, -0.6073666, -1.246322, 1, 0.7137255, 0, 1,
-1.13642, -0.3743308, -2.133824, 1, 0.7215686, 0, 1,
-1.130429, 1.246144, -0.3424444, 1, 0.7254902, 0, 1,
-1.1172, 1.024643, -1.001297, 1, 0.7333333, 0, 1,
-1.115746, -0.5893197, -2.945457, 1, 0.7372549, 0, 1,
-1.103837, -0.7505519, -1.992477, 1, 0.7450981, 0, 1,
-1.091603, 0.6033225, -1.311928, 1, 0.7490196, 0, 1,
-1.082868, -0.4672566, -1.56476, 1, 0.7568628, 0, 1,
-1.080584, -2.057709, -3.428614, 1, 0.7607843, 0, 1,
-1.079573, 1.355801, -1.368251, 1, 0.7686275, 0, 1,
-1.069337, -0.3841444, -2.793095, 1, 0.772549, 0, 1,
-1.065383, 0.8957267, -0.4135073, 1, 0.7803922, 0, 1,
-1.062484, -0.6307304, -2.255029, 1, 0.7843137, 0, 1,
-1.04359, 1.260922, -0.9958786, 1, 0.7921569, 0, 1,
-1.041549, 0.1954872, -1.237386, 1, 0.7960784, 0, 1,
-1.037516, -0.5747479, -4.998521, 1, 0.8039216, 0, 1,
-1.029185, -1.306338, -3.511243, 1, 0.8117647, 0, 1,
-1.028344, 0.5036198, -2.203567, 1, 0.8156863, 0, 1,
-1.027146, -1.383208, -0.3034859, 1, 0.8235294, 0, 1,
-1.017355, -0.03824366, -0.3952082, 1, 0.827451, 0, 1,
-1.012193, -1.225886, -2.346428, 1, 0.8352941, 0, 1,
-1.008832, 1.033218, -0.7789157, 1, 0.8392157, 0, 1,
-0.9907507, -0.3530014, -1.584494, 1, 0.8470588, 0, 1,
-0.9863793, -0.6086142, -1.896829, 1, 0.8509804, 0, 1,
-0.9844851, -0.2916684, -0.8792386, 1, 0.8588235, 0, 1,
-0.9840494, -1.794804, -2.983497, 1, 0.8627451, 0, 1,
-0.9833828, -0.8707259, -2.528628, 1, 0.8705882, 0, 1,
-0.9816957, 0.2261273, -0.4845524, 1, 0.8745098, 0, 1,
-0.981044, -0.4661852, -1.552539, 1, 0.8823529, 0, 1,
-0.9728293, 0.4192892, -1.020765, 1, 0.8862745, 0, 1,
-0.970195, 0.8179152, -1.148916, 1, 0.8941177, 0, 1,
-0.9654149, 0.5541758, -0.8971385, 1, 0.8980392, 0, 1,
-0.9608967, -0.8921446, -2.083446, 1, 0.9058824, 0, 1,
-0.9603825, 1.190127, -0.5642173, 1, 0.9137255, 0, 1,
-0.9583019, -0.6905246, -2.661369, 1, 0.9176471, 0, 1,
-0.9558886, -0.6349413, -2.987729, 1, 0.9254902, 0, 1,
-0.9358844, -0.6849515, -1.628375, 1, 0.9294118, 0, 1,
-0.9321921, 1.274275, -2.810371, 1, 0.9372549, 0, 1,
-0.9319462, -0.1368542, -1.942706, 1, 0.9411765, 0, 1,
-0.9258829, -0.2141246, -2.193345, 1, 0.9490196, 0, 1,
-0.9181309, -0.3060834, -2.203159, 1, 0.9529412, 0, 1,
-0.9145159, 1.258329, -0.6310347, 1, 0.9607843, 0, 1,
-0.9040617, -2.109726, -3.417878, 1, 0.9647059, 0, 1,
-0.896042, -1.768502, -4.035469, 1, 0.972549, 0, 1,
-0.8949165, 0.3609478, 0.4596522, 1, 0.9764706, 0, 1,
-0.8889624, -0.6248934, -2.030644, 1, 0.9843137, 0, 1,
-0.8852908, 0.2976987, -1.091249, 1, 0.9882353, 0, 1,
-0.8790136, 0.129874, -0.8536548, 1, 0.9960784, 0, 1,
-0.875434, -0.2314888, -0.2863238, 0.9960784, 1, 0, 1,
-0.8725078, 0.9749321, -1.444391, 0.9921569, 1, 0, 1,
-0.8652686, 0.2331566, -3.122657, 0.9843137, 1, 0, 1,
-0.8613323, -0.4030769, -3.331922, 0.9803922, 1, 0, 1,
-0.8588918, -0.8310218, -3.086787, 0.972549, 1, 0, 1,
-0.8567971, 0.5892588, 0.6051402, 0.9686275, 1, 0, 1,
-0.8468136, 1.532659, -0.08219141, 0.9607843, 1, 0, 1,
-0.8412826, 1.378144, -1.36989, 0.9568627, 1, 0, 1,
-0.8384389, 0.3524884, -1.192278, 0.9490196, 1, 0, 1,
-0.833351, -0.6018989, -1.030544, 0.945098, 1, 0, 1,
-0.8319071, 1.372029, 0.8153278, 0.9372549, 1, 0, 1,
-0.827398, -0.9553996, -3.74909, 0.9333333, 1, 0, 1,
-0.8255683, 0.3930704, -1.611458, 0.9254902, 1, 0, 1,
-0.8102865, 1.412497, -1.628475, 0.9215686, 1, 0, 1,
-0.8091, -2.069986, -3.052173, 0.9137255, 1, 0, 1,
-0.7989808, 0.1612786, -2.15772, 0.9098039, 1, 0, 1,
-0.7885984, -0.9110796, -2.421642, 0.9019608, 1, 0, 1,
-0.7847441, -0.1748117, -0.9666155, 0.8941177, 1, 0, 1,
-0.783917, 1.314629, -1.908592, 0.8901961, 1, 0, 1,
-0.7823882, 0.7192439, -1.25164, 0.8823529, 1, 0, 1,
-0.7823159, 0.4601319, -2.167835, 0.8784314, 1, 0, 1,
-0.773262, 0.3215549, -0.1493262, 0.8705882, 1, 0, 1,
-0.7729838, 1.054538, -0.1138585, 0.8666667, 1, 0, 1,
-0.7724365, -0.8073366, -2.38077, 0.8588235, 1, 0, 1,
-0.7719828, -0.9909043, -2.906101, 0.854902, 1, 0, 1,
-0.7710846, 0.03145583, -3.647315, 0.8470588, 1, 0, 1,
-0.7699938, -0.5170451, -1.716424, 0.8431373, 1, 0, 1,
-0.7654596, -1.487434, -3.554704, 0.8352941, 1, 0, 1,
-0.7633675, 0.3896467, -1.720671, 0.8313726, 1, 0, 1,
-0.7522414, -0.1007861, -3.201268, 0.8235294, 1, 0, 1,
-0.7489205, -0.08441383, -1.543057, 0.8196079, 1, 0, 1,
-0.7469698, 0.2585717, -1.035204, 0.8117647, 1, 0, 1,
-0.74543, 0.6673404, -1.036342, 0.8078431, 1, 0, 1,
-0.7453022, 3.070932, -1.483261, 0.8, 1, 0, 1,
-0.7409952, -1.952448, -4.034421, 0.7921569, 1, 0, 1,
-0.7345662, -1.121086, -3.759593, 0.7882353, 1, 0, 1,
-0.727346, -0.78327, -2.404429, 0.7803922, 1, 0, 1,
-0.7169477, -0.1654887, -1.200659, 0.7764706, 1, 0, 1,
-0.7110264, 0.2580177, -1.532049, 0.7686275, 1, 0, 1,
-0.7018698, -0.06207217, -1.180227, 0.7647059, 1, 0, 1,
-0.6941255, 0.330707, -0.3212107, 0.7568628, 1, 0, 1,
-0.689128, -1.423555, -1.820916, 0.7529412, 1, 0, 1,
-0.6842499, 2.389553, 0.1294473, 0.7450981, 1, 0, 1,
-0.6837299, 0.9766585, -0.1660616, 0.7411765, 1, 0, 1,
-0.6700692, 0.5974211, -0.5696374, 0.7333333, 1, 0, 1,
-0.6697978, 0.3205694, -1.94602, 0.7294118, 1, 0, 1,
-0.6669602, 0.7110446, -0.2961509, 0.7215686, 1, 0, 1,
-0.6658326, -0.3341609, -0.5447613, 0.7176471, 1, 0, 1,
-0.6633379, -1.649968, -2.552914, 0.7098039, 1, 0, 1,
-0.6604536, -0.7696065, -1.893276, 0.7058824, 1, 0, 1,
-0.6582123, 0.8130891, -0.8670689, 0.6980392, 1, 0, 1,
-0.6550822, -1.063978, -4.01377, 0.6901961, 1, 0, 1,
-0.6516117, -1.095502, -1.637011, 0.6862745, 1, 0, 1,
-0.6514723, 0.2577193, -0.8116794, 0.6784314, 1, 0, 1,
-0.6459442, 0.4633012, 1.017774, 0.6745098, 1, 0, 1,
-0.6446337, 0.4146318, -2.380319, 0.6666667, 1, 0, 1,
-0.6439592, 0.638829, -0.4381336, 0.6627451, 1, 0, 1,
-0.6432224, 0.7339461, -0.7992988, 0.654902, 1, 0, 1,
-0.6392193, -0.5641986, -3.936011, 0.6509804, 1, 0, 1,
-0.6378158, 0.4819154, -2.263111, 0.6431373, 1, 0, 1,
-0.6370191, 1.424791, -0.3549097, 0.6392157, 1, 0, 1,
-0.632939, -1.140897, -0.8408635, 0.6313726, 1, 0, 1,
-0.6261744, 1.249607, -1.459987, 0.627451, 1, 0, 1,
-0.6261557, -0.4529341, -0.6168532, 0.6196079, 1, 0, 1,
-0.6110356, -1.467147, -5.317203, 0.6156863, 1, 0, 1,
-0.6073477, -1.182046, -2.050583, 0.6078432, 1, 0, 1,
-0.6025798, 0.03271592, -1.707755, 0.6039216, 1, 0, 1,
-0.6007192, 0.8573278, -1.183234, 0.5960785, 1, 0, 1,
-0.5988221, 0.3214015, -0.615267, 0.5882353, 1, 0, 1,
-0.5943685, 0.263848, -0.8876892, 0.5843138, 1, 0, 1,
-0.5936358, 0.3552016, -1.910812, 0.5764706, 1, 0, 1,
-0.5929666, 0.1027527, -2.709091, 0.572549, 1, 0, 1,
-0.5880432, -1.695242, -2.610662, 0.5647059, 1, 0, 1,
-0.5763892, -0.07429814, -1.539643, 0.5607843, 1, 0, 1,
-0.5722458, 0.1502794, -1.087911, 0.5529412, 1, 0, 1,
-0.5692049, -0.9807205, -2.685027, 0.5490196, 1, 0, 1,
-0.5672281, -0.3504252, -3.31724, 0.5411765, 1, 0, 1,
-0.5657986, -1.468189, -1.851588, 0.5372549, 1, 0, 1,
-0.5647736, -0.8974174, -2.733113, 0.5294118, 1, 0, 1,
-0.5641064, 0.3037235, 0.4241877, 0.5254902, 1, 0, 1,
-0.5607296, 0.4350916, 0.4678079, 0.5176471, 1, 0, 1,
-0.5605839, -2.782653, -3.947125, 0.5137255, 1, 0, 1,
-0.5600048, -0.6997846, -0.2788266, 0.5058824, 1, 0, 1,
-0.559093, -0.1863328, -2.082064, 0.5019608, 1, 0, 1,
-0.5567815, 0.8736393, 1.17915, 0.4941176, 1, 0, 1,
-0.5557625, 0.1914265, -1.523399, 0.4862745, 1, 0, 1,
-0.5546055, -0.1085829, -1.421823, 0.4823529, 1, 0, 1,
-0.5501322, -0.3070409, -1.366181, 0.4745098, 1, 0, 1,
-0.5491934, 0.8727561, -3.320825, 0.4705882, 1, 0, 1,
-0.5483702, -0.8151219, -2.822434, 0.4627451, 1, 0, 1,
-0.5472919, 2.423792, 0.5074229, 0.4588235, 1, 0, 1,
-0.5444328, -0.6352229, -3.355332, 0.4509804, 1, 0, 1,
-0.5423024, -0.7847107, -1.250392, 0.4470588, 1, 0, 1,
-0.5389775, -1.596649, -1.870032, 0.4392157, 1, 0, 1,
-0.5387365, 1.103248, 0.6202087, 0.4352941, 1, 0, 1,
-0.5374455, -0.5042505, -1.273635, 0.427451, 1, 0, 1,
-0.5366662, -0.1478584, -2.301664, 0.4235294, 1, 0, 1,
-0.5331623, 1.204126, -0.2127497, 0.4156863, 1, 0, 1,
-0.5313969, 1.352803, 0.1241593, 0.4117647, 1, 0, 1,
-0.5300546, 0.07363765, -0.9941223, 0.4039216, 1, 0, 1,
-0.528086, -0.1373227, -0.9701158, 0.3960784, 1, 0, 1,
-0.5259129, 0.9961504, -0.7060621, 0.3921569, 1, 0, 1,
-0.5247085, -0.04808835, -1.604859, 0.3843137, 1, 0, 1,
-0.5203992, 0.5363423, -0.01797833, 0.3803922, 1, 0, 1,
-0.5190934, 0.8553245, -0.02763248, 0.372549, 1, 0, 1,
-0.5182725, 1.05315, -0.6772978, 0.3686275, 1, 0, 1,
-0.5156322, 0.05984795, -2.461312, 0.3607843, 1, 0, 1,
-0.5136378, -1.226662, -3.024372, 0.3568628, 1, 0, 1,
-0.507183, 1.740602, 0.08677769, 0.3490196, 1, 0, 1,
-0.5036677, 0.2404953, -1.623194, 0.345098, 1, 0, 1,
-0.4996591, 0.4456835, 0.0386846, 0.3372549, 1, 0, 1,
-0.4995751, -0.9279585, -1.130525, 0.3333333, 1, 0, 1,
-0.4988245, 1.108156, -1.419787, 0.3254902, 1, 0, 1,
-0.4944363, -1.030358, -1.625136, 0.3215686, 1, 0, 1,
-0.4900355, -0.5166665, -3.196839, 0.3137255, 1, 0, 1,
-0.4875405, 0.503875, 0.9984229, 0.3098039, 1, 0, 1,
-0.481449, -0.06721772, -1.245146, 0.3019608, 1, 0, 1,
-0.4772494, 0.6430701, -1.593532, 0.2941177, 1, 0, 1,
-0.4747784, 0.4083329, 1.031675, 0.2901961, 1, 0, 1,
-0.4746946, 1.68658, -1.527039, 0.282353, 1, 0, 1,
-0.4708128, 0.09186023, -3.507539, 0.2784314, 1, 0, 1,
-0.4682349, 0.007347115, -2.49701, 0.2705882, 1, 0, 1,
-0.4661326, -0.6855823, -4.001334, 0.2666667, 1, 0, 1,
-0.4637291, -0.3678585, -1.535273, 0.2588235, 1, 0, 1,
-0.4630072, -0.08583667, -3.636088, 0.254902, 1, 0, 1,
-0.4630047, -1.179338, -3.429899, 0.2470588, 1, 0, 1,
-0.4628955, 1.977666, 0.1168997, 0.2431373, 1, 0, 1,
-0.456663, -0.8428953, -1.906992, 0.2352941, 1, 0, 1,
-0.4565622, -2.242444, -3.407353, 0.2313726, 1, 0, 1,
-0.4563652, 0.2002319, 0.3041263, 0.2235294, 1, 0, 1,
-0.4552973, -1.959887, -2.418443, 0.2196078, 1, 0, 1,
-0.4538742, -1.650547, -2.740829, 0.2117647, 1, 0, 1,
-0.4509595, -1.848478, -2.004059, 0.2078431, 1, 0, 1,
-0.4478053, -0.1782588, -2.353935, 0.2, 1, 0, 1,
-0.4408104, -0.04115822, -2.347047, 0.1921569, 1, 0, 1,
-0.4397207, 1.196309, -1.742677, 0.1882353, 1, 0, 1,
-0.4387104, 0.04523142, -2.958217, 0.1803922, 1, 0, 1,
-0.4380624, -0.141687, -0.7660551, 0.1764706, 1, 0, 1,
-0.4379219, 0.5291095, -1.258591, 0.1686275, 1, 0, 1,
-0.4365629, -1.207564, -1.350782, 0.1647059, 1, 0, 1,
-0.4353533, 1.038194, 0.8773999, 0.1568628, 1, 0, 1,
-0.4326668, -0.3519772, -1.937908, 0.1529412, 1, 0, 1,
-0.4315852, 0.366946, -0.5282769, 0.145098, 1, 0, 1,
-0.4299585, -0.1514123, -2.159322, 0.1411765, 1, 0, 1,
-0.4155808, 0.1144649, -1.579059, 0.1333333, 1, 0, 1,
-0.4139819, 1.411107, 0.6504987, 0.1294118, 1, 0, 1,
-0.4121412, 0.8962897, -1.147221, 0.1215686, 1, 0, 1,
-0.4107752, 0.8310652, 0.6168132, 0.1176471, 1, 0, 1,
-0.4092805, 0.3696025, -1.336528, 0.1098039, 1, 0, 1,
-0.4054241, 0.0639409, -2.152747, 0.1058824, 1, 0, 1,
-0.4047175, 0.4354911, -1.234784, 0.09803922, 1, 0, 1,
-0.4012345, -1.076112, -1.361387, 0.09019608, 1, 0, 1,
-0.4010058, 0.4624694, -2.148262, 0.08627451, 1, 0, 1,
-0.398127, -0.3711997, -2.487866, 0.07843138, 1, 0, 1,
-0.3971646, 0.9718605, -0.1204146, 0.07450981, 1, 0, 1,
-0.3948989, 0.8053663, 0.919829, 0.06666667, 1, 0, 1,
-0.3897543, 0.8041912, -1.548602, 0.0627451, 1, 0, 1,
-0.387834, -1.384963, -3.579217, 0.05490196, 1, 0, 1,
-0.3852324, 0.5055692, -0.6450807, 0.05098039, 1, 0, 1,
-0.3840008, 0.2377809, -3.519189, 0.04313726, 1, 0, 1,
-0.3808754, -0.2366886, -1.867562, 0.03921569, 1, 0, 1,
-0.3792391, 1.663629, -0.4071682, 0.03137255, 1, 0, 1,
-0.3773776, 0.04422405, -3.591483, 0.02745098, 1, 0, 1,
-0.3761453, 0.2272119, -2.358697, 0.01960784, 1, 0, 1,
-0.3750916, 0.6606747, -0.7617502, 0.01568628, 1, 0, 1,
-0.3740683, 0.5653688, -0.9636879, 0.007843138, 1, 0, 1,
-0.3706627, -0.7157979, -2.451599, 0.003921569, 1, 0, 1,
-0.3673528, 1.110142, -1.291039, 0, 1, 0.003921569, 1,
-0.3639739, -2.978353, -2.197208, 0, 1, 0.01176471, 1,
-0.3608821, -0.2629739, -3.511831, 0, 1, 0.01568628, 1,
-0.355567, 1.393741, -2.112518, 0, 1, 0.02352941, 1,
-0.3555427, 1.025259, -0.07781065, 0, 1, 0.02745098, 1,
-0.3527239, 1.053354, -0.3068586, 0, 1, 0.03529412, 1,
-0.3507804, -0.2549536, -0.8388373, 0, 1, 0.03921569, 1,
-0.3481529, -0.5069815, -3.053268, 0, 1, 0.04705882, 1,
-0.3465762, -1.521415, -3.637682, 0, 1, 0.05098039, 1,
-0.3461458, -0.1368078, -2.327013, 0, 1, 0.05882353, 1,
-0.3449186, 0.5241244, -0.6825873, 0, 1, 0.0627451, 1,
-0.3430203, -1.460486, -2.950049, 0, 1, 0.07058824, 1,
-0.3426853, 0.6578214, 0.210808, 0, 1, 0.07450981, 1,
-0.3421974, -1.068028, -1.151344, 0, 1, 0.08235294, 1,
-0.3417827, -0.7366359, -1.484823, 0, 1, 0.08627451, 1,
-0.3359804, -0.2709147, -1.910254, 0, 1, 0.09411765, 1,
-0.3277791, 0.7301151, 0.5984804, 0, 1, 0.1019608, 1,
-0.3277155, -0.6599661, -2.526144, 0, 1, 0.1058824, 1,
-0.3215464, -0.7342718, -1.921061, 0, 1, 0.1137255, 1,
-0.3205029, 1.374317, 0.3426956, 0, 1, 0.1176471, 1,
-0.320013, -2.792341, -2.880088, 0, 1, 0.1254902, 1,
-0.3116583, 0.1260568, -1.640051, 0, 1, 0.1294118, 1,
-0.3095057, -0.9767616, -2.51553, 0, 1, 0.1372549, 1,
-0.308354, 0.7445366, 0.9912626, 0, 1, 0.1411765, 1,
-0.3070224, 1.622674, 1.289181, 0, 1, 0.1490196, 1,
-0.3043095, -0.1161284, -1.912857, 0, 1, 0.1529412, 1,
-0.2982489, 1.236748, -0.3246051, 0, 1, 0.1607843, 1,
-0.297867, 0.9333754, 0.5858397, 0, 1, 0.1647059, 1,
-0.2938716, 2.845152, 0.1875196, 0, 1, 0.172549, 1,
-0.2933495, 0.7458688, -1.758578, 0, 1, 0.1764706, 1,
-0.2875217, 0.2027645, 0.2526195, 0, 1, 0.1843137, 1,
-0.2874316, -0.09159694, -2.874838, 0, 1, 0.1882353, 1,
-0.2829446, 1.936106, -1.87666, 0, 1, 0.1960784, 1,
-0.2821705, -0.7370755, -3.119004, 0, 1, 0.2039216, 1,
-0.2793403, -0.3028238, -2.337496, 0, 1, 0.2078431, 1,
-0.2737723, 1.119379, -0.2900292, 0, 1, 0.2156863, 1,
-0.2719881, 1.497177, -0.4549378, 0, 1, 0.2196078, 1,
-0.270345, -1.022515, -3.479036, 0, 1, 0.227451, 1,
-0.2695927, -1.384416, -4.711223, 0, 1, 0.2313726, 1,
-0.2683129, 0.821116, 0.7730271, 0, 1, 0.2392157, 1,
-0.2674873, 1.240246, 2.302893, 0, 1, 0.2431373, 1,
-0.2666333, 0.8984476, -1.573212, 0, 1, 0.2509804, 1,
-0.2631, -0.3330734, -1.990768, 0, 1, 0.254902, 1,
-0.262761, -1.452962, -1.843488, 0, 1, 0.2627451, 1,
-0.2584195, 0.6082223, -0.6905814, 0, 1, 0.2666667, 1,
-0.2576865, -2.801475, -3.147532, 0, 1, 0.2745098, 1,
-0.2517594, 0.441761, -1.237149, 0, 1, 0.2784314, 1,
-0.2462868, 0.8817296, 1.047445, 0, 1, 0.2862745, 1,
-0.2442482, -1.10134, -2.196988, 0, 1, 0.2901961, 1,
-0.2438326, -0.1235305, -4.050008, 0, 1, 0.2980392, 1,
-0.2436892, -0.2495917, -3.174588, 0, 1, 0.3058824, 1,
-0.2423008, 2.279046, 0.2642227, 0, 1, 0.3098039, 1,
-0.2386233, -1.147529, -3.346114, 0, 1, 0.3176471, 1,
-0.237478, 0.5780661, 0.4560005, 0, 1, 0.3215686, 1,
-0.2372661, -0.4627869, -3.0333, 0, 1, 0.3294118, 1,
-0.2352121, 0.1930124, 0.09166596, 0, 1, 0.3333333, 1,
-0.2346551, -1.675135, -2.096503, 0, 1, 0.3411765, 1,
-0.2335869, 0.2280295, -2.343497, 0, 1, 0.345098, 1,
-0.2277842, -0.8708563, -3.034738, 0, 1, 0.3529412, 1,
-0.2236535, 0.9564984, 0.874936, 0, 1, 0.3568628, 1,
-0.2230646, -0.01424384, -2.412486, 0, 1, 0.3647059, 1,
-0.2207582, 0.2920017, -0.7507925, 0, 1, 0.3686275, 1,
-0.2184569, -0.9533979, -2.471398, 0, 1, 0.3764706, 1,
-0.2135963, -0.2052529, -1.612501, 0, 1, 0.3803922, 1,
-0.2085498, 0.5148408, -1.086964, 0, 1, 0.3882353, 1,
-0.206764, 0.2247305, -0.6185834, 0, 1, 0.3921569, 1,
-0.2045989, 0.3076085, 1.04653, 0, 1, 0.4, 1,
-0.2043151, -0.1471429, -2.253443, 0, 1, 0.4078431, 1,
-0.1952362, -1.27232, -2.581039, 0, 1, 0.4117647, 1,
-0.191707, -0.0171866, -1.093057, 0, 1, 0.4196078, 1,
-0.1905229, 1.845179, -0.382824, 0, 1, 0.4235294, 1,
-0.190049, 1.480972, -0.3348902, 0, 1, 0.4313726, 1,
-0.188798, -0.863782, -5.074973, 0, 1, 0.4352941, 1,
-0.1880568, -1.598215, -3.45949, 0, 1, 0.4431373, 1,
-0.1870959, 0.3916149, -1.473944, 0, 1, 0.4470588, 1,
-0.1858036, -0.5694519, -2.786849, 0, 1, 0.454902, 1,
-0.1850183, 0.928728, -1.370192, 0, 1, 0.4588235, 1,
-0.1795495, -1.285918, -3.811181, 0, 1, 0.4666667, 1,
-0.1743892, 0.1238304, -1.178244, 0, 1, 0.4705882, 1,
-0.1735705, 2.221025, 0.7917228, 0, 1, 0.4784314, 1,
-0.168655, 2.209761, 1.124956, 0, 1, 0.4823529, 1,
-0.1683388, 0.1784753, -0.2376129, 0, 1, 0.4901961, 1,
-0.1675865, 1.473616, 0.1638858, 0, 1, 0.4941176, 1,
-0.1675387, -0.352838, -4.149603, 0, 1, 0.5019608, 1,
-0.166746, -1.511496, -2.479586, 0, 1, 0.509804, 1,
-0.1662307, 1.397084, -0.999083, 0, 1, 0.5137255, 1,
-0.1634108, 1.811686, -1.278088, 0, 1, 0.5215687, 1,
-0.1558563, 1.373565, -0.8076606, 0, 1, 0.5254902, 1,
-0.1540276, -0.8925623, -1.731767, 0, 1, 0.5333334, 1,
-0.1504036, -0.7832248, -2.229445, 0, 1, 0.5372549, 1,
-0.1475332, 1.55866, 0.4210149, 0, 1, 0.5450981, 1,
-0.1455454, -0.3723778, -1.850311, 0, 1, 0.5490196, 1,
-0.1413935, 0.8105436, 0.12505, 0, 1, 0.5568628, 1,
-0.1298181, 0.3630295, 1.212202, 0, 1, 0.5607843, 1,
-0.1287871, 0.4611341, -1.80073, 0, 1, 0.5686275, 1,
-0.1263496, -0.7835701, -2.998601, 0, 1, 0.572549, 1,
-0.1259568, -2.0397, -2.547062, 0, 1, 0.5803922, 1,
-0.1248756, -0.5735205, -2.413468, 0, 1, 0.5843138, 1,
-0.1237313, -0.2470123, -2.231278, 0, 1, 0.5921569, 1,
-0.1229995, -0.2143967, -3.52176, 0, 1, 0.5960785, 1,
-0.1224246, -0.6587319, -3.365327, 0, 1, 0.6039216, 1,
-0.1212434, 0.3648486, -0.311771, 0, 1, 0.6117647, 1,
-0.1201824, -0.2065319, -2.359373, 0, 1, 0.6156863, 1,
-0.1200332, -0.2502357, -2.871307, 0, 1, 0.6235294, 1,
-0.1168792, 0.4035643, -1.510314, 0, 1, 0.627451, 1,
-0.1152752, -0.262552, -3.605557, 0, 1, 0.6352941, 1,
-0.1134106, -0.03896705, -1.84351, 0, 1, 0.6392157, 1,
-0.1117914, -0.3129328, -5.006813, 0, 1, 0.6470588, 1,
-0.1102317, -0.9770149, -1.90763, 0, 1, 0.6509804, 1,
-0.1041483, 1.383741, -0.6422784, 0, 1, 0.6588235, 1,
-0.103952, -0.3125372, -3.239115, 0, 1, 0.6627451, 1,
-0.1007355, 0.1671305, -2.245827, 0, 1, 0.6705883, 1,
-0.09865646, -0.054683, -1.683396, 0, 1, 0.6745098, 1,
-0.09768401, -3.053552, -2.766241, 0, 1, 0.682353, 1,
-0.09582497, 0.4679827, 0.169531, 0, 1, 0.6862745, 1,
-0.09351654, 0.7015499, -0.4885337, 0, 1, 0.6941177, 1,
-0.09290113, -0.1852363, -2.404414, 0, 1, 0.7019608, 1,
-0.09234149, 0.7146447, -0.09824451, 0, 1, 0.7058824, 1,
-0.09094132, -1.344208, -1.52765, 0, 1, 0.7137255, 1,
-0.08757966, 0.9223323, 0.5798035, 0, 1, 0.7176471, 1,
-0.08618405, -1.628655, -3.188513, 0, 1, 0.7254902, 1,
-0.085605, 1.875677, 0.4702633, 0, 1, 0.7294118, 1,
-0.08540262, -1.214413, -3.132545, 0, 1, 0.7372549, 1,
-0.08539256, 0.7828226, -0.80212, 0, 1, 0.7411765, 1,
-0.08347154, -0.4821846, -4.888798, 0, 1, 0.7490196, 1,
-0.08001943, 0.3909253, 0.6815897, 0, 1, 0.7529412, 1,
-0.06945233, 1.840494, 0.918577, 0, 1, 0.7607843, 1,
-0.06884097, 0.3583333, -0.3820143, 0, 1, 0.7647059, 1,
-0.05649072, -0.6760012, -2.677305, 0, 1, 0.772549, 1,
-0.05628368, -0.3540283, -2.933011, 0, 1, 0.7764706, 1,
-0.05297501, 2.138484, 0.8213803, 0, 1, 0.7843137, 1,
-0.05197959, 0.1703089, 0.7157112, 0, 1, 0.7882353, 1,
-0.05057819, 0.218013, 0.03248717, 0, 1, 0.7960784, 1,
-0.04777675, 0.04644505, -0.1624769, 0, 1, 0.8039216, 1,
-0.0454901, -2.31769, -4.465747, 0, 1, 0.8078431, 1,
-0.04033372, -2.280301, -3.370502, 0, 1, 0.8156863, 1,
-0.03803477, -0.4955149, -4.133774, 0, 1, 0.8196079, 1,
-0.03420376, -0.7352974, -1.956425, 0, 1, 0.827451, 1,
-0.02802004, 0.2682627, 0.8563573, 0, 1, 0.8313726, 1,
-0.01580092, 1.000443, 0.823188, 0, 1, 0.8392157, 1,
-0.009241837, -0.8004624, -3.297571, 0, 1, 0.8431373, 1,
-0.008841206, -1.960938, -2.063133, 0, 1, 0.8509804, 1,
-0.007921075, 0.8090872, 1.981553, 0, 1, 0.854902, 1,
-0.007047933, 2.368116, -0.2515317, 0, 1, 0.8627451, 1,
-0.003489628, -0.9205778, -3.584692, 0, 1, 0.8666667, 1,
0.0002644945, -1.554597, 4.65061, 0, 1, 0.8745098, 1,
0.0004125721, 0.09654792, -0.04051422, 0, 1, 0.8784314, 1,
0.01665695, -0.359259, 2.828816, 0, 1, 0.8862745, 1,
0.01673779, -0.2156747, 3.415807, 0, 1, 0.8901961, 1,
0.02656928, -0.3747212, 2.085466, 0, 1, 0.8980392, 1,
0.02911746, 0.4082821, 0.8257795, 0, 1, 0.9058824, 1,
0.03362134, 0.8135124, 0.1449941, 0, 1, 0.9098039, 1,
0.03403642, -0.2798446, 3.942987, 0, 1, 0.9176471, 1,
0.03498247, -0.9144757, 2.406357, 0, 1, 0.9215686, 1,
0.03741524, -0.1426398, 1.436156, 0, 1, 0.9294118, 1,
0.03758436, -0.6559874, 2.695026, 0, 1, 0.9333333, 1,
0.04309792, -0.757126, 3.663299, 0, 1, 0.9411765, 1,
0.04502397, -0.1657303, 3.352267, 0, 1, 0.945098, 1,
0.04686001, 0.4960352, 0.5831906, 0, 1, 0.9529412, 1,
0.05239535, 0.6342639, 0.614589, 0, 1, 0.9568627, 1,
0.05993045, 0.3831099, 0.9694619, 0, 1, 0.9647059, 1,
0.06042334, 2.237631, 2.133042, 0, 1, 0.9686275, 1,
0.06746607, -0.006472894, 2.347663, 0, 1, 0.9764706, 1,
0.08346652, 0.03230137, 0.9404066, 0, 1, 0.9803922, 1,
0.08712156, -1.259881, 2.76253, 0, 1, 0.9882353, 1,
0.08769437, -0.190206, 2.658415, 0, 1, 0.9921569, 1,
0.08887754, -0.9717125, 4.308361, 0, 1, 1, 1,
0.09331655, 0.336649, 1.253048, 0, 0.9921569, 1, 1,
0.0962735, 0.5895037, -1.521827, 0, 0.9882353, 1, 1,
0.09685057, 0.3231679, -1.179115, 0, 0.9803922, 1, 1,
0.09840972, -0.8234639, 2.615286, 0, 0.9764706, 1, 1,
0.09987443, -1.447065, 0.9501257, 0, 0.9686275, 1, 1,
0.1009908, -2.641504, 2.677547, 0, 0.9647059, 1, 1,
0.1084092, -0.6783158, 1.921972, 0, 0.9568627, 1, 1,
0.108539, 0.7534186, 0.2767653, 0, 0.9529412, 1, 1,
0.1147133, -1.865777, 4.361828, 0, 0.945098, 1, 1,
0.1149343, 0.4313006, 0.4356189, 0, 0.9411765, 1, 1,
0.1151238, -2.104603, 3.278351, 0, 0.9333333, 1, 1,
0.1179087, 0.2607109, 0.563939, 0, 0.9294118, 1, 1,
0.1191113, 0.6402257, -0.810613, 0, 0.9215686, 1, 1,
0.1197108, -0.6268097, 4.119113, 0, 0.9176471, 1, 1,
0.1200404, -0.008373389, 0.9874367, 0, 0.9098039, 1, 1,
0.1205034, -0.3579618, 4.756676, 0, 0.9058824, 1, 1,
0.1212224, -1.421186, 2.64455, 0, 0.8980392, 1, 1,
0.1213154, 0.6106604, -0.9180038, 0, 0.8901961, 1, 1,
0.1216969, 0.08387235, 1.480761, 0, 0.8862745, 1, 1,
0.1267808, 0.03045074, 0.7009441, 0, 0.8784314, 1, 1,
0.1285069, -0.8470112, 2.506172, 0, 0.8745098, 1, 1,
0.1300245, -0.1428318, 1.619761, 0, 0.8666667, 1, 1,
0.1313953, -0.6813802, 4.808061, 0, 0.8627451, 1, 1,
0.1315652, -0.5114212, 3.306547, 0, 0.854902, 1, 1,
0.1320432, -0.53074, 2.666856, 0, 0.8509804, 1, 1,
0.1403394, -0.5665656, 2.632851, 0, 0.8431373, 1, 1,
0.1404937, 1.9307, 1.867159, 0, 0.8392157, 1, 1,
0.1407238, 1.509567, 0.5179967, 0, 0.8313726, 1, 1,
0.1471487, -1.292916, 2.563289, 0, 0.827451, 1, 1,
0.148211, 0.1522959, 0.05378095, 0, 0.8196079, 1, 1,
0.1489608, 0.239327, 0.1553586, 0, 0.8156863, 1, 1,
0.1490209, -0.6087734, 3.061902, 0, 0.8078431, 1, 1,
0.1524087, -0.4695528, 3.798647, 0, 0.8039216, 1, 1,
0.1558721, 0.8496761, -0.2977894, 0, 0.7960784, 1, 1,
0.1587739, -0.2182964, 2.62776, 0, 0.7882353, 1, 1,
0.1593118, 0.8441061, 0.6940715, 0, 0.7843137, 1, 1,
0.1623873, 0.2290219, 1.193671, 0, 0.7764706, 1, 1,
0.1644561, -0.9270741, 1.907, 0, 0.772549, 1, 1,
0.1705113, -0.5745947, 4.090453, 0, 0.7647059, 1, 1,
0.1711263, 2.572931, 1.289057, 0, 0.7607843, 1, 1,
0.1736097, 0.4651483, 0.6039725, 0, 0.7529412, 1, 1,
0.1741191, 0.7344423, 2.040994, 0, 0.7490196, 1, 1,
0.1788439, 0.7228525, -0.6584277, 0, 0.7411765, 1, 1,
0.1807969, 0.6287654, -1.759186, 0, 0.7372549, 1, 1,
0.1820483, -0.004875711, 0.9525254, 0, 0.7294118, 1, 1,
0.1826793, 0.5361052, 1.069808, 0, 0.7254902, 1, 1,
0.1845918, 0.855751, 0.9670078, 0, 0.7176471, 1, 1,
0.1863973, 1.363608, 0.8736914, 0, 0.7137255, 1, 1,
0.1897897, -0.4260129, 2.380831, 0, 0.7058824, 1, 1,
0.1927565, -1.20455, 4.847165, 0, 0.6980392, 1, 1,
0.1932606, 1.566119, 0.7857704, 0, 0.6941177, 1, 1,
0.1939653, -1.074692, 2.738862, 0, 0.6862745, 1, 1,
0.1943092, -0.4657217, 4.210637, 0, 0.682353, 1, 1,
0.1960373, 0.4290173, 0.570816, 0, 0.6745098, 1, 1,
0.1976471, -0.7516155, 2.314414, 0, 0.6705883, 1, 1,
0.20811, -0.6438906, 1.449697, 0, 0.6627451, 1, 1,
0.2094539, 0.1271752, 3.472162, 0, 0.6588235, 1, 1,
0.2097452, 0.2198114, 0.9368543, 0, 0.6509804, 1, 1,
0.209967, -1.374958, 4.499522, 0, 0.6470588, 1, 1,
0.2119561, 2.005268, 0.1172369, 0, 0.6392157, 1, 1,
0.2178623, -0.8005148, 2.043834, 0, 0.6352941, 1, 1,
0.2227544, 0.7885687, -0.239559, 0, 0.627451, 1, 1,
0.2229723, -0.08646936, 0.8157037, 0, 0.6235294, 1, 1,
0.2232864, -1.126242, 2.956268, 0, 0.6156863, 1, 1,
0.2239212, 0.499446, 0.04154488, 0, 0.6117647, 1, 1,
0.2241643, -1.268944, 2.349419, 0, 0.6039216, 1, 1,
0.2266014, 0.4179234, -0.1778171, 0, 0.5960785, 1, 1,
0.2268022, -1.204694, 2.849626, 0, 0.5921569, 1, 1,
0.227274, 1.564781, -1.335168, 0, 0.5843138, 1, 1,
0.2272927, -0.5917981, 2.465711, 0, 0.5803922, 1, 1,
0.2275279, -1.37573, 3.725952, 0, 0.572549, 1, 1,
0.2281688, -1.618928, 3.565565, 0, 0.5686275, 1, 1,
0.2296665, -0.2139092, 1.811523, 0, 0.5607843, 1, 1,
0.2303204, -1.143302, 2.631252, 0, 0.5568628, 1, 1,
0.2306955, 0.4899247, 1.288271, 0, 0.5490196, 1, 1,
0.2310443, -1.59997, 2.996603, 0, 0.5450981, 1, 1,
0.2313516, 0.006340805, -0.01028754, 0, 0.5372549, 1, 1,
0.231656, 3.325712, -0.3632261, 0, 0.5333334, 1, 1,
0.2317324, -0.505798, 1.577476, 0, 0.5254902, 1, 1,
0.2362483, -0.3572469, 2.961394, 0, 0.5215687, 1, 1,
0.2375993, 0.4562401, 0.9022384, 0, 0.5137255, 1, 1,
0.241087, -0.2508342, 2.876122, 0, 0.509804, 1, 1,
0.2462103, -0.04566675, 1.877148, 0, 0.5019608, 1, 1,
0.2471417, -0.2673283, 1.822851, 0, 0.4941176, 1, 1,
0.2479499, -0.7539102, 3.856135, 0, 0.4901961, 1, 1,
0.2509454, 0.2933527, -1.12424, 0, 0.4823529, 1, 1,
0.2523188, 2.095264, 0.08582033, 0, 0.4784314, 1, 1,
0.2529283, 0.3339314, -1.135456, 0, 0.4705882, 1, 1,
0.2534356, 0.3976605, 0.01196559, 0, 0.4666667, 1, 1,
0.2536696, 0.2140702, 2.353157, 0, 0.4588235, 1, 1,
0.2539821, -0.4325134, 3.390954, 0, 0.454902, 1, 1,
0.2567099, -0.9974006, 2.853426, 0, 0.4470588, 1, 1,
0.262462, 0.9528195, 0.5149769, 0, 0.4431373, 1, 1,
0.2633705, -1.499985, 3.717753, 0, 0.4352941, 1, 1,
0.2729577, -1.105577, 2.427681, 0, 0.4313726, 1, 1,
0.2740249, -0.4590088, 5.103327, 0, 0.4235294, 1, 1,
0.2793663, -0.4309229, 5.539021, 0, 0.4196078, 1, 1,
0.280402, -0.947148, 1.151653, 0, 0.4117647, 1, 1,
0.2817464, 0.456861, -0.08937299, 0, 0.4078431, 1, 1,
0.2874514, -0.6388326, 2.487653, 0, 0.4, 1, 1,
0.289133, -0.8593808, 2.112015, 0, 0.3921569, 1, 1,
0.292073, -1.023459, 4.037991, 0, 0.3882353, 1, 1,
0.2956007, -1.875438, 1.054229, 0, 0.3803922, 1, 1,
0.2957664, 0.1534504, 2.488756, 0, 0.3764706, 1, 1,
0.3007214, 2.858584, 1.067097, 0, 0.3686275, 1, 1,
0.3016266, -0.9716166, 1.827175, 0, 0.3647059, 1, 1,
0.3019553, 1.094353, 0.02909026, 0, 0.3568628, 1, 1,
0.3043227, 0.8401511, -1.180976, 0, 0.3529412, 1, 1,
0.3070682, 0.220686, 1.440735, 0, 0.345098, 1, 1,
0.3083059, 0.07841022, 0.3153426, 0, 0.3411765, 1, 1,
0.31221, 2.54285, -1.404475, 0, 0.3333333, 1, 1,
0.3142121, -1.201931, 3.628098, 0, 0.3294118, 1, 1,
0.3161473, -2.537176, 4.480094, 0, 0.3215686, 1, 1,
0.3205763, -1.681873, 3.440394, 0, 0.3176471, 1, 1,
0.3226968, 0.01864767, 0.7007737, 0, 0.3098039, 1, 1,
0.3247976, 2.365865, -1.977775, 0, 0.3058824, 1, 1,
0.3299122, 0.9286229, 0.4662965, 0, 0.2980392, 1, 1,
0.3302134, 0.9507957, -0.6147429, 0, 0.2901961, 1, 1,
0.3355446, 1.841319, 0.5191707, 0, 0.2862745, 1, 1,
0.3356176, 0.2051829, 2.394826, 0, 0.2784314, 1, 1,
0.3356727, 0.2947264, 0.4497325, 0, 0.2745098, 1, 1,
0.3372872, 1.098308, 2.359101, 0, 0.2666667, 1, 1,
0.3415949, 0.4562008, 1.199601, 0, 0.2627451, 1, 1,
0.3447525, 0.09167485, 0.4053142, 0, 0.254902, 1, 1,
0.3485987, 0.2127981, 1.099902, 0, 0.2509804, 1, 1,
0.3504655, -0.896079, 2.535964, 0, 0.2431373, 1, 1,
0.3545036, -0.1992131, 2.233641, 0, 0.2392157, 1, 1,
0.3618173, 0.1568488, -0.03129022, 0, 0.2313726, 1, 1,
0.3632442, 2.34579, 1.685577, 0, 0.227451, 1, 1,
0.3660929, -0.8154747, 3.078314, 0, 0.2196078, 1, 1,
0.3670954, -1.20439, 1.503381, 0, 0.2156863, 1, 1,
0.3678867, 0.3114953, 1.045228, 0, 0.2078431, 1, 1,
0.3691899, 0.2943173, 0.3990337, 0, 0.2039216, 1, 1,
0.3765393, 1.02805, -0.1966866, 0, 0.1960784, 1, 1,
0.3800919, -0.07770406, 2.58934, 0, 0.1882353, 1, 1,
0.3861035, 1.005188, -0.803255, 0, 0.1843137, 1, 1,
0.3878531, -0.5614392, 2.586053, 0, 0.1764706, 1, 1,
0.3904827, 1.062341, 0.8410177, 0, 0.172549, 1, 1,
0.3920847, 0.1541761, 2.254737, 0, 0.1647059, 1, 1,
0.3951328, -1.655152, 1.110078, 0, 0.1607843, 1, 1,
0.3961233, -0.7379909, 1.286541, 0, 0.1529412, 1, 1,
0.4009702, -0.5358874, 1.860544, 0, 0.1490196, 1, 1,
0.4066977, 1.07012, -0.01949212, 0, 0.1411765, 1, 1,
0.4092424, 1.225047, 0.9624129, 0, 0.1372549, 1, 1,
0.4130466, -0.3455999, 4.125165, 0, 0.1294118, 1, 1,
0.4155971, -0.9737905, 2.273669, 0, 0.1254902, 1, 1,
0.4179772, 0.7410874, 0.5711527, 0, 0.1176471, 1, 1,
0.4196859, 1.176041, 2.587231, 0, 0.1137255, 1, 1,
0.4198032, -1.259528, 3.944808, 0, 0.1058824, 1, 1,
0.42078, 1.48554, 0.872574, 0, 0.09803922, 1, 1,
0.4238985, -0.2349256, 0.7692667, 0, 0.09411765, 1, 1,
0.4257612, 0.1115773, 2.324769, 0, 0.08627451, 1, 1,
0.4292759, 0.215957, 2.688251, 0, 0.08235294, 1, 1,
0.4301281, -1.03413, 3.984757, 0, 0.07450981, 1, 1,
0.4309384, -2.470058, 2.157631, 0, 0.07058824, 1, 1,
0.4389197, 0.03646419, 0.857276, 0, 0.0627451, 1, 1,
0.440797, -1.855211, 4.036313, 0, 0.05882353, 1, 1,
0.4432044, -0.5265893, 2.04609, 0, 0.05098039, 1, 1,
0.4475039, -0.6079707, 2.252001, 0, 0.04705882, 1, 1,
0.4530118, -0.001187024, 0.1640752, 0, 0.03921569, 1, 1,
0.4621657, -0.7179502, 2.060123, 0, 0.03529412, 1, 1,
0.4622672, -1.70801, 3.400795, 0, 0.02745098, 1, 1,
0.4639976, -0.1291454, 2.217467, 0, 0.02352941, 1, 1,
0.4643397, 0.2670335, -0.6415391, 0, 0.01568628, 1, 1,
0.4653637, 0.000593611, 2.105848, 0, 0.01176471, 1, 1,
0.465443, 1.420843, 1.501353, 0, 0.003921569, 1, 1,
0.4666959, -3.046742, 3.807384, 0.003921569, 0, 1, 1,
0.4682957, 0.1191067, 0.7050855, 0.007843138, 0, 1, 1,
0.4706296, 0.09275606, 1.269845, 0.01568628, 0, 1, 1,
0.4836132, 0.5833221, 0.9952717, 0.01960784, 0, 1, 1,
0.4851674, -0.1499876, 0.8825433, 0.02745098, 0, 1, 1,
0.4863494, 2.390927, 1.750137, 0.03137255, 0, 1, 1,
0.4930803, -0.4204673, 0.2442867, 0.03921569, 0, 1, 1,
0.4944385, -0.3826014, 1.558947, 0.04313726, 0, 1, 1,
0.4952781, -0.4219168, 2.702464, 0.05098039, 0, 1, 1,
0.4964815, 1.273081, -0.06050707, 0.05490196, 0, 1, 1,
0.4966677, 1.421096, -2.028003, 0.0627451, 0, 1, 1,
0.497069, -0.6918409, 3.861087, 0.06666667, 0, 1, 1,
0.4998536, -0.6846026, 3.230078, 0.07450981, 0, 1, 1,
0.5007012, -0.6024469, 3.658054, 0.07843138, 0, 1, 1,
0.5035424, -1.427331, 1.63556, 0.08627451, 0, 1, 1,
0.5056759, 1.638966, -0.06832992, 0.09019608, 0, 1, 1,
0.506387, 0.8485023, 1.571274, 0.09803922, 0, 1, 1,
0.5077134, 0.1521676, 1.548087, 0.1058824, 0, 1, 1,
0.5083481, 0.4755099, 0.5836549, 0.1098039, 0, 1, 1,
0.5089226, -0.5278383, 1.124355, 0.1176471, 0, 1, 1,
0.5092367, -1.226409, 4.32137, 0.1215686, 0, 1, 1,
0.5108928, 0.4727711, 2.991503, 0.1294118, 0, 1, 1,
0.5111322, -1.619332, 3.966076, 0.1333333, 0, 1, 1,
0.5128691, 0.06863271, 1.085654, 0.1411765, 0, 1, 1,
0.5134196, 0.2530175, 1.369573, 0.145098, 0, 1, 1,
0.5254242, 0.9559229, 1.312013, 0.1529412, 0, 1, 1,
0.5288818, 0.4629624, 1.356675, 0.1568628, 0, 1, 1,
0.5289122, 0.9959943, -0.6879986, 0.1647059, 0, 1, 1,
0.5312043, -0.3107722, 2.407973, 0.1686275, 0, 1, 1,
0.5313691, -0.3495148, 2.254815, 0.1764706, 0, 1, 1,
0.5339005, -2.169299, 2.98487, 0.1803922, 0, 1, 1,
0.5348549, -0.1230854, 2.1959, 0.1882353, 0, 1, 1,
0.5357379, 0.2700455, 1.259441, 0.1921569, 0, 1, 1,
0.5384181, 1.775574, 0.8089117, 0.2, 0, 1, 1,
0.5391549, -1.461908, 2.302557, 0.2078431, 0, 1, 1,
0.548394, 1.40125, -1.865444, 0.2117647, 0, 1, 1,
0.5515585, -0.8912685, 3.636948, 0.2196078, 0, 1, 1,
0.5539798, -0.3972996, 2.664655, 0.2235294, 0, 1, 1,
0.5551102, 0.0583112, 1.031128, 0.2313726, 0, 1, 1,
0.5580674, 0.4067208, 1.88927, 0.2352941, 0, 1, 1,
0.5581938, 1.710586, 0.2814785, 0.2431373, 0, 1, 1,
0.5589737, -0.03019131, 0.9132631, 0.2470588, 0, 1, 1,
0.5713853, -0.475575, 2.120048, 0.254902, 0, 1, 1,
0.5763036, 1.191936, 0.8306797, 0.2588235, 0, 1, 1,
0.5771298, 0.5976078, 2.255943, 0.2666667, 0, 1, 1,
0.5781833, -0.4575433, 1.524989, 0.2705882, 0, 1, 1,
0.5793992, -2.24657, 1.162619, 0.2784314, 0, 1, 1,
0.5806612, 0.4643308, 0.7039652, 0.282353, 0, 1, 1,
0.5811563, 0.07590932, 0.3387076, 0.2901961, 0, 1, 1,
0.5825192, 0.2223993, 1.745771, 0.2941177, 0, 1, 1,
0.5826685, 1.380014, -0.2088551, 0.3019608, 0, 1, 1,
0.5834178, 1.089474, 0.1554276, 0.3098039, 0, 1, 1,
0.5850468, 1.366371, 0.2319212, 0.3137255, 0, 1, 1,
0.5856422, 0.3688308, 1.047267, 0.3215686, 0, 1, 1,
0.5862193, 0.8646457, 1.561552, 0.3254902, 0, 1, 1,
0.5864476, -0.5490683, 2.729625, 0.3333333, 0, 1, 1,
0.589817, 0.5501362, 0.2865261, 0.3372549, 0, 1, 1,
0.5901347, 0.1231504, 2.528923, 0.345098, 0, 1, 1,
0.593719, 0.1018318, 2.37034, 0.3490196, 0, 1, 1,
0.5955128, -0.759057, 1.989665, 0.3568628, 0, 1, 1,
0.5957659, -0.3499332, 3.115354, 0.3607843, 0, 1, 1,
0.5960175, -0.8497677, 3.351603, 0.3686275, 0, 1, 1,
0.5978252, 1.381007, 0.6967384, 0.372549, 0, 1, 1,
0.6057897, 0.0435301, 1.478072, 0.3803922, 0, 1, 1,
0.609665, -0.5095745, 1.803243, 0.3843137, 0, 1, 1,
0.6145699, -1.309012, 3.586971, 0.3921569, 0, 1, 1,
0.6148121, -1.199518, 2.296532, 0.3960784, 0, 1, 1,
0.6154704, -1.935148, 3.88801, 0.4039216, 0, 1, 1,
0.619513, 0.6911544, 2.204349, 0.4117647, 0, 1, 1,
0.6197076, 1.419584, 1.277255, 0.4156863, 0, 1, 1,
0.6207857, -0.9010874, 2.617269, 0.4235294, 0, 1, 1,
0.6256351, 1.577279, 1.066987, 0.427451, 0, 1, 1,
0.6304445, -1.644369, 2.087243, 0.4352941, 0, 1, 1,
0.6315787, 0.2723893, -0.585667, 0.4392157, 0, 1, 1,
0.6329944, -0.3337734, 2.457453, 0.4470588, 0, 1, 1,
0.637513, -0.4629173, 2.561786, 0.4509804, 0, 1, 1,
0.6389856, -1.137578, 2.269449, 0.4588235, 0, 1, 1,
0.6442291, -0.0554934, 3.794027, 0.4627451, 0, 1, 1,
0.6449538, -0.9174216, 1.431782, 0.4705882, 0, 1, 1,
0.6597547, 0.8463897, 1.396483, 0.4745098, 0, 1, 1,
0.6660958, -1.356887, 0.5289526, 0.4823529, 0, 1, 1,
0.6680059, -0.4096217, 2.619503, 0.4862745, 0, 1, 1,
0.6697814, -0.9712773, 2.197214, 0.4941176, 0, 1, 1,
0.6708202, -0.002867752, 1.106282, 0.5019608, 0, 1, 1,
0.6721274, -0.2690606, 1.287466, 0.5058824, 0, 1, 1,
0.6734192, -1.746481, 4.40307, 0.5137255, 0, 1, 1,
0.6753837, 1.256832, -1.37254, 0.5176471, 0, 1, 1,
0.6808434, -0.2755814, 2.963768, 0.5254902, 0, 1, 1,
0.6826417, 2.077603, 2.30309, 0.5294118, 0, 1, 1,
0.6851178, -1.39706, 2.809537, 0.5372549, 0, 1, 1,
0.6851627, 0.4142184, 0.472407, 0.5411765, 0, 1, 1,
0.6873965, 0.5325362, 0.5593835, 0.5490196, 0, 1, 1,
0.6980827, 0.4580011, 2.200969, 0.5529412, 0, 1, 1,
0.6984379, 0.08806495, 2.848124, 0.5607843, 0, 1, 1,
0.7037972, -1.248954, 2.311589, 0.5647059, 0, 1, 1,
0.7076344, -0.6326256, 0.3486217, 0.572549, 0, 1, 1,
0.711182, 0.4513808, 0.7542385, 0.5764706, 0, 1, 1,
0.7131286, -0.6660839, 2.780033, 0.5843138, 0, 1, 1,
0.7177241, 0.232844, 1.253701, 0.5882353, 0, 1, 1,
0.7202903, -0.03225303, 1.572988, 0.5960785, 0, 1, 1,
0.7263479, 0.9074385, 1.210378, 0.6039216, 0, 1, 1,
0.7300027, 0.7726575, -0.3385656, 0.6078432, 0, 1, 1,
0.7310078, 0.2555723, 0.5416113, 0.6156863, 0, 1, 1,
0.7337364, 0.1427801, 0.5257055, 0.6196079, 0, 1, 1,
0.7417809, 0.1082351, 0.8976921, 0.627451, 0, 1, 1,
0.7445585, 0.7887901, -0.6072682, 0.6313726, 0, 1, 1,
0.7449614, 2.161736, 3.102422, 0.6392157, 0, 1, 1,
0.7520393, 0.3996429, 1.556302, 0.6431373, 0, 1, 1,
0.7548018, -0.1283012, 0.07144736, 0.6509804, 0, 1, 1,
0.76237, -2.086781, 3.195103, 0.654902, 0, 1, 1,
0.7727755, -0.2299426, 2.14639, 0.6627451, 0, 1, 1,
0.7729425, 0.3588368, 1.815591, 0.6666667, 0, 1, 1,
0.7745247, -0.6836603, 2.103435, 0.6745098, 0, 1, 1,
0.7794909, -0.9924597, 3.643591, 0.6784314, 0, 1, 1,
0.7841074, -0.1004891, 0.4359666, 0.6862745, 0, 1, 1,
0.7846688, 0.3486425, 0.5032223, 0.6901961, 0, 1, 1,
0.7886592, 1.173958, -0.692666, 0.6980392, 0, 1, 1,
0.7915704, 0.6919069, -0.6534978, 0.7058824, 0, 1, 1,
0.7962098, -0.1480818, 2.328392, 0.7098039, 0, 1, 1,
0.7969806, 0.2270424, 0.7898494, 0.7176471, 0, 1, 1,
0.8008705, 2.374349, -0.3826808, 0.7215686, 0, 1, 1,
0.8190432, 0.6563852, -0.7527911, 0.7294118, 0, 1, 1,
0.8211676, -0.4469995, 0.4634689, 0.7333333, 0, 1, 1,
0.8220267, -1.203773, 1.608606, 0.7411765, 0, 1, 1,
0.8323377, -0.1530898, 2.30548, 0.7450981, 0, 1, 1,
0.8355373, 0.4399908, 0.1562385, 0.7529412, 0, 1, 1,
0.8434706, 2.210385, 0.7148961, 0.7568628, 0, 1, 1,
0.8486765, -1.600362, 2.343782, 0.7647059, 0, 1, 1,
0.8509127, 1.339967, 0.6064305, 0.7686275, 0, 1, 1,
0.8553604, 1.290264, 2.290324, 0.7764706, 0, 1, 1,
0.8571924, -1.515348, 3.002326, 0.7803922, 0, 1, 1,
0.8654384, -0.9456842, 1.614463, 0.7882353, 0, 1, 1,
0.8661684, 1.272849, -0.2194219, 0.7921569, 0, 1, 1,
0.8784443, -0.6456409, 1.208183, 0.8, 0, 1, 1,
0.8799426, -0.6676216, 0.5652198, 0.8078431, 0, 1, 1,
0.8876675, 0.03968098, 1.600398, 0.8117647, 0, 1, 1,
0.8886456, -0.06156577, 3.809552, 0.8196079, 0, 1, 1,
0.8932452, 0.5594561, 1.188514, 0.8235294, 0, 1, 1,
0.8952177, 0.3651457, 1.378975, 0.8313726, 0, 1, 1,
0.8960109, -0.4399719, 1.764308, 0.8352941, 0, 1, 1,
0.8998665, 0.3680848, 2.178039, 0.8431373, 0, 1, 1,
0.9110265, 0.07406892, 0.2664, 0.8470588, 0, 1, 1,
0.9144706, 0.7872795, 2.504196, 0.854902, 0, 1, 1,
0.9149393, 0.4537705, -0.315827, 0.8588235, 0, 1, 1,
0.9223918, 1.226461, 2.000273, 0.8666667, 0, 1, 1,
0.9267861, 0.3269455, 1.299947, 0.8705882, 0, 1, 1,
0.9290663, -1.057832, 2.064901, 0.8784314, 0, 1, 1,
0.9333924, -1.116322, 2.116297, 0.8823529, 0, 1, 1,
0.9463605, 1.827454, 1.510623, 0.8901961, 0, 1, 1,
0.9510586, -2.266662, 0.3104842, 0.8941177, 0, 1, 1,
0.9526566, -0.004532644, 0.5883319, 0.9019608, 0, 1, 1,
0.957473, -0.2870424, 1.563574, 0.9098039, 0, 1, 1,
0.9590753, -0.3230692, 2.153518, 0.9137255, 0, 1, 1,
0.9597718, 2.108021, 1.22723, 0.9215686, 0, 1, 1,
0.9619445, 0.7727391, 0.4527455, 0.9254902, 0, 1, 1,
0.9621699, -0.5257152, 1.643131, 0.9333333, 0, 1, 1,
0.9631594, 0.528352, 1.144796, 0.9372549, 0, 1, 1,
0.9635715, 0.4402251, 1.61043, 0.945098, 0, 1, 1,
0.9667215, 0.5403348, -0.009367335, 0.9490196, 0, 1, 1,
0.967919, -0.05480445, 0.1078517, 0.9568627, 0, 1, 1,
0.9709347, 0.1082217, 0.9844608, 0.9607843, 0, 1, 1,
0.9716937, -1.197217, 0.1095978, 0.9686275, 0, 1, 1,
0.9790879, -0.6074942, 2.828655, 0.972549, 0, 1, 1,
0.9829448, -0.03879857, -0.05560682, 0.9803922, 0, 1, 1,
0.9899851, -0.2433651, 2.544417, 0.9843137, 0, 1, 1,
1.00412, 1.425311, 0.4454903, 0.9921569, 0, 1, 1,
1.006785, -1.231846, 3.063645, 0.9960784, 0, 1, 1,
1.008046, 1.012246, -0.3241828, 1, 0, 0.9960784, 1,
1.008812, 1.03931, 2.780391, 1, 0, 0.9882353, 1,
1.011341, 0.533021, 1.280116, 1, 0, 0.9843137, 1,
1.016709, -0.02284285, 0.3510872, 1, 0, 0.9764706, 1,
1.017322, -0.5976503, 1.449933, 1, 0, 0.972549, 1,
1.024018, 0.2905555, 2.043845, 1, 0, 0.9647059, 1,
1.025502, -0.5636228, 2.107248, 1, 0, 0.9607843, 1,
1.029924, 1.010315, 2.418531, 1, 0, 0.9529412, 1,
1.038416, 0.2817608, 2.918547, 1, 0, 0.9490196, 1,
1.038661, -0.356626, 1.149776, 1, 0, 0.9411765, 1,
1.054938, -1.853258, 3.307274, 1, 0, 0.9372549, 1,
1.063429, 0.8883578, 0.4398226, 1, 0, 0.9294118, 1,
1.06414, -0.5088413, 1.639316, 1, 0, 0.9254902, 1,
1.065438, -0.8081234, 2.10994, 1, 0, 0.9176471, 1,
1.070001, 1.617576, -0.9044712, 1, 0, 0.9137255, 1,
1.070821, 1.0507, -1.746967, 1, 0, 0.9058824, 1,
1.07367, -0.2404177, 2.036342, 1, 0, 0.9019608, 1,
1.073951, -0.6071445, 2.209764, 1, 0, 0.8941177, 1,
1.081819, -0.09066537, 0.9596581, 1, 0, 0.8862745, 1,
1.0912, -0.2004753, 3.772036, 1, 0, 0.8823529, 1,
1.102204, -0.4709932, -0.1183613, 1, 0, 0.8745098, 1,
1.103187, 0.4137653, 0.2297369, 1, 0, 0.8705882, 1,
1.111064, -0.1627079, 1.861839, 1, 0, 0.8627451, 1,
1.115488, -0.8309894, 2.181904, 1, 0, 0.8588235, 1,
1.120553, -0.09078752, 2.895754, 1, 0, 0.8509804, 1,
1.120929, -0.6577545, 3.364666, 1, 0, 0.8470588, 1,
1.131292, 0.7879654, 0.731548, 1, 0, 0.8392157, 1,
1.133701, 0.4594612, 1.323975, 1, 0, 0.8352941, 1,
1.135628, -0.4328747, 2.696069, 1, 0, 0.827451, 1,
1.144158, 0.5044777, 1.055432, 1, 0, 0.8235294, 1,
1.156843, -0.6670904, 1.630094, 1, 0, 0.8156863, 1,
1.157388, 0.3510435, 0.5361895, 1, 0, 0.8117647, 1,
1.159159, -0.4077523, 1.231689, 1, 0, 0.8039216, 1,
1.161926, -0.5881382, 0.8180425, 1, 0, 0.7960784, 1,
1.164622, -1.030934, 3.486214, 1, 0, 0.7921569, 1,
1.168684, -0.1594393, 1.375662, 1, 0, 0.7843137, 1,
1.17015, 2.381941, 1.655498, 1, 0, 0.7803922, 1,
1.170536, -0.05158626, 1.4862, 1, 0, 0.772549, 1,
1.176525, 1.254822, -0.4863603, 1, 0, 0.7686275, 1,
1.179826, 1.204214, 0.3558811, 1, 0, 0.7607843, 1,
1.181185, 0.2021055, 0.8270506, 1, 0, 0.7568628, 1,
1.181956, -0.6234444, 0.7890993, 1, 0, 0.7490196, 1,
1.182377, -0.9622062, 3.456048, 1, 0, 0.7450981, 1,
1.183721, 1.275525, 2.548077, 1, 0, 0.7372549, 1,
1.193988, 1.606189, 0.8402669, 1, 0, 0.7333333, 1,
1.195284, -0.5986732, 2.048834, 1, 0, 0.7254902, 1,
1.198547, 0.7145701, 0.002128578, 1, 0, 0.7215686, 1,
1.202244, 0.8514013, 0.8172798, 1, 0, 0.7137255, 1,
1.210858, 0.3476734, 1.460583, 1, 0, 0.7098039, 1,
1.216332, -0.5612701, -0.5175294, 1, 0, 0.7019608, 1,
1.226779, 0.735278, 1.502373, 1, 0, 0.6941177, 1,
1.229971, 0.3290999, 1.38306, 1, 0, 0.6901961, 1,
1.233724, 0.493823, -0.3465525, 1, 0, 0.682353, 1,
1.238812, 0.6242429, 1.237074, 1, 0, 0.6784314, 1,
1.241429, -1.344641, 3.947217, 1, 0, 0.6705883, 1,
1.244697, -1.344576, 2.497586, 1, 0, 0.6666667, 1,
1.257005, 0.5592008, 2.25265, 1, 0, 0.6588235, 1,
1.257384, -0.2648844, 1.248859, 1, 0, 0.654902, 1,
1.262955, 0.1339366, 0.3436556, 1, 0, 0.6470588, 1,
1.269338, 0.2789772, -0.3122213, 1, 0, 0.6431373, 1,
1.290288, 2.070195, 0.5402259, 1, 0, 0.6352941, 1,
1.293851, 0.5630614, 1.810597, 1, 0, 0.6313726, 1,
1.297101, -1.993962, 1.525324, 1, 0, 0.6235294, 1,
1.304122, 0.9802638, 1.072848, 1, 0, 0.6196079, 1,
1.307376, 2.173288, 0.6414165, 1, 0, 0.6117647, 1,
1.308202, -1.021278, 3.544703, 1, 0, 0.6078432, 1,
1.313533, 0.3085988, 2.006413, 1, 0, 0.6, 1,
1.315068, -0.6250791, 1.213827, 1, 0, 0.5921569, 1,
1.324731, -0.07410191, 1.101922, 1, 0, 0.5882353, 1,
1.330148, 0.7933937, 0.9145776, 1, 0, 0.5803922, 1,
1.347849, 0.4366724, 3.693705, 1, 0, 0.5764706, 1,
1.348836, 0.8396265, 0.2750914, 1, 0, 0.5686275, 1,
1.355159, 0.2432469, -0.09457876, 1, 0, 0.5647059, 1,
1.372504, -1.07998, 1.708534, 1, 0, 0.5568628, 1,
1.379318, -0.3831134, 2.645888, 1, 0, 0.5529412, 1,
1.382672, 2.01602, -0.2315718, 1, 0, 0.5450981, 1,
1.390381, 0.2465122, 1.261158, 1, 0, 0.5411765, 1,
1.392743, 0.2713126, 0.8070999, 1, 0, 0.5333334, 1,
1.393883, 1.077421, 1.170037, 1, 0, 0.5294118, 1,
1.395341, -1.933482, 2.985295, 1, 0, 0.5215687, 1,
1.404302, -0.8320642, 2.299731, 1, 0, 0.5176471, 1,
1.406944, -0.4021827, 2.417637, 1, 0, 0.509804, 1,
1.411403, -0.04507547, 1.165774, 1, 0, 0.5058824, 1,
1.414664, 1.78345, 1.968404, 1, 0, 0.4980392, 1,
1.418397, 0.4947821, 2.175644, 1, 0, 0.4901961, 1,
1.421466, 0.5809692, 2.543005, 1, 0, 0.4862745, 1,
1.42465, -1.573073, 2.859884, 1, 0, 0.4784314, 1,
1.424783, -1.652744, 2.336784, 1, 0, 0.4745098, 1,
1.437769, 0.01247034, 0.1556121, 1, 0, 0.4666667, 1,
1.457698, -1.020193, 3.413345, 1, 0, 0.4627451, 1,
1.462561, 0.883112, 0.4496791, 1, 0, 0.454902, 1,
1.48224, -0.8851258, 2.31402, 1, 0, 0.4509804, 1,
1.495731, 0.1309521, 3.175751, 1, 0, 0.4431373, 1,
1.498946, -0.6820322, 2.425816, 1, 0, 0.4392157, 1,
1.525274, 1.770819, 1.212338, 1, 0, 0.4313726, 1,
1.525476, 0.7683865, 1.376709, 1, 0, 0.427451, 1,
1.528283, 1.019661, 0.8563125, 1, 0, 0.4196078, 1,
1.529228, -0.2644127, 2.421411, 1, 0, 0.4156863, 1,
1.531936, -1.205443, 2.809197, 1, 0, 0.4078431, 1,
1.541689, 1.779828, -0.6270588, 1, 0, 0.4039216, 1,
1.542899, 1.446115, 1.503521, 1, 0, 0.3960784, 1,
1.558241, 0.4554387, 0.7263208, 1, 0, 0.3882353, 1,
1.560752, 1.67532, -0.4404344, 1, 0, 0.3843137, 1,
1.561673, 1.403304, 0.6675544, 1, 0, 0.3764706, 1,
1.566977, -0.1969701, 2.950149, 1, 0, 0.372549, 1,
1.567626, -0.827575, 1.125866, 1, 0, 0.3647059, 1,
1.568076, 0.1043339, 0.7624485, 1, 0, 0.3607843, 1,
1.587382, -0.3003924, 2.856123, 1, 0, 0.3529412, 1,
1.592161, -0.5978337, 3.575183, 1, 0, 0.3490196, 1,
1.594507, -0.1485875, 1.408675, 1, 0, 0.3411765, 1,
1.595639, 0.3755078, 1.055, 1, 0, 0.3372549, 1,
1.599013, -1.701232, 3.105474, 1, 0, 0.3294118, 1,
1.60188, -1.809622, 1.480215, 1, 0, 0.3254902, 1,
1.603279, -0.6127769, 2.607517, 1, 0, 0.3176471, 1,
1.608732, -1.257352, 1.544665, 1, 0, 0.3137255, 1,
1.610857, 0.3944726, 0.9941475, 1, 0, 0.3058824, 1,
1.611497, 0.988768, 0.3378784, 1, 0, 0.2980392, 1,
1.618142, -1.413669, 4.056708, 1, 0, 0.2941177, 1,
1.623303, -0.175692, 2.291838, 1, 0, 0.2862745, 1,
1.627552, 1.225817, 2.05238, 1, 0, 0.282353, 1,
1.651231, -0.6192322, 1.706478, 1, 0, 0.2745098, 1,
1.653651, 0.05197237, -0.08455103, 1, 0, 0.2705882, 1,
1.655971, -0.1441909, 2.894225, 1, 0, 0.2627451, 1,
1.663527, -1.302941, 3.191037, 1, 0, 0.2588235, 1,
1.666691, -0.4903384, 0.1598099, 1, 0, 0.2509804, 1,
1.697028, -1.099231, 3.986495, 1, 0, 0.2470588, 1,
1.713369, 2.096552, 0.3477359, 1, 0, 0.2392157, 1,
1.758516, 0.8460606, 0.1565858, 1, 0, 0.2352941, 1,
1.779653, -0.6673243, 1.802696, 1, 0, 0.227451, 1,
1.791783, 0.720948, 1.833162, 1, 0, 0.2235294, 1,
1.803011, -1.078098, 3.338567, 1, 0, 0.2156863, 1,
1.803789, -0.7485254, 3.511674, 1, 0, 0.2117647, 1,
1.812696, 0.05465288, 1.319117, 1, 0, 0.2039216, 1,
1.819815, -1.700043, 2.048895, 1, 0, 0.1960784, 1,
1.823618, 0.723748, 3.0551, 1, 0, 0.1921569, 1,
1.835021, -0.5239307, 0.7273779, 1, 0, 0.1843137, 1,
1.849641, -1.151784, 3.536722, 1, 0, 0.1803922, 1,
1.861753, 0.2440507, 3.135692, 1, 0, 0.172549, 1,
1.868919, -0.6247607, 0.8085743, 1, 0, 0.1686275, 1,
1.885553, -2.406007, 2.83995, 1, 0, 0.1607843, 1,
1.889237, -0.2938046, 2.038631, 1, 0, 0.1568628, 1,
1.892635, 0.9503902, 0.09708233, 1, 0, 0.1490196, 1,
1.902261, -2.276891, 2.385953, 1, 0, 0.145098, 1,
1.912503, 0.4985512, 2.755451, 1, 0, 0.1372549, 1,
1.920328, -0.2768638, 3.436173, 1, 0, 0.1333333, 1,
1.927225, 1.674871, 0.8456549, 1, 0, 0.1254902, 1,
1.934258, 0.9963545, 1.369744, 1, 0, 0.1215686, 1,
1.956883, -0.3973964, 1.822514, 1, 0, 0.1137255, 1,
2.022232, -0.3370775, 2.489577, 1, 0, 0.1098039, 1,
2.024738, 0.7158068, 2.282936, 1, 0, 0.1019608, 1,
2.039837, -1.51698, 3.895333, 1, 0, 0.09411765, 1,
2.057369, -0.3237668, 2.966499, 1, 0, 0.09019608, 1,
2.066557, -2.052706, 1.272891, 1, 0, 0.08235294, 1,
2.09525, 0.03556396, 1.141252, 1, 0, 0.07843138, 1,
2.129543, -0.8085299, 1.496403, 1, 0, 0.07058824, 1,
2.143385, 0.4163697, 0.04056262, 1, 0, 0.06666667, 1,
2.316757, -0.9561732, 1.48048, 1, 0, 0.05882353, 1,
2.37886, -0.4455189, -0.2714231, 1, 0, 0.05490196, 1,
2.414185, 1.612209, 0.3096971, 1, 0, 0.04705882, 1,
2.498067, -0.7191158, -0.7991908, 1, 0, 0.04313726, 1,
2.533134, -0.3413382, 1.153616, 1, 0, 0.03529412, 1,
2.573287, 0.5132567, 3.111738, 1, 0, 0.03137255, 1,
3.009502, -1.215418, 2.38509, 1, 0, 0.02352941, 1,
3.084256, 0.9762736, -0.3527805, 1, 0, 0.01960784, 1,
3.133228, -0.25541, 0.7943795, 1, 0, 0.01176471, 1,
3.588289, 0.5973141, 1.147744, 1, 0, 0.007843138, 1
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
0.09796226, -4.134838, -7.157332, 0, -0.5, 0.5, 0.5,
0.09796226, -4.134838, -7.157332, 1, -0.5, 0.5, 0.5,
0.09796226, -4.134838, -7.157332, 1, 1.5, 0.5, 0.5,
0.09796226, -4.134838, -7.157332, 0, 1.5, 0.5, 0.5
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
-4.575584, 0.1360797, -7.157332, 0, -0.5, 0.5, 0.5,
-4.575584, 0.1360797, -7.157332, 1, -0.5, 0.5, 0.5,
-4.575584, 0.1360797, -7.157332, 1, 1.5, 0.5, 0.5,
-4.575584, 0.1360797, -7.157332, 0, 1.5, 0.5, 0.5
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
-4.575584, -4.134838, 0.1109095, 0, -0.5, 0.5, 0.5,
-4.575584, -4.134838, 0.1109095, 1, -0.5, 0.5, 0.5,
-4.575584, -4.134838, 0.1109095, 1, 1.5, 0.5, 0.5,
-4.575584, -4.134838, 0.1109095, 0, 1.5, 0.5, 0.5
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
-3, -3.149241, -5.480046,
3, -3.149241, -5.480046,
-3, -3.149241, -5.480046,
-3, -3.313507, -5.759593,
-2, -3.149241, -5.480046,
-2, -3.313507, -5.759593,
-1, -3.149241, -5.480046,
-1, -3.313507, -5.759593,
0, -3.149241, -5.480046,
0, -3.313507, -5.759593,
1, -3.149241, -5.480046,
1, -3.313507, -5.759593,
2, -3.149241, -5.480046,
2, -3.313507, -5.759593,
3, -3.149241, -5.480046,
3, -3.313507, -5.759593
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
-3, -3.64204, -6.318689, 0, -0.5, 0.5, 0.5,
-3, -3.64204, -6.318689, 1, -0.5, 0.5, 0.5,
-3, -3.64204, -6.318689, 1, 1.5, 0.5, 0.5,
-3, -3.64204, -6.318689, 0, 1.5, 0.5, 0.5,
-2, -3.64204, -6.318689, 0, -0.5, 0.5, 0.5,
-2, -3.64204, -6.318689, 1, -0.5, 0.5, 0.5,
-2, -3.64204, -6.318689, 1, 1.5, 0.5, 0.5,
-2, -3.64204, -6.318689, 0, 1.5, 0.5, 0.5,
-1, -3.64204, -6.318689, 0, -0.5, 0.5, 0.5,
-1, -3.64204, -6.318689, 1, -0.5, 0.5, 0.5,
-1, -3.64204, -6.318689, 1, 1.5, 0.5, 0.5,
-1, -3.64204, -6.318689, 0, 1.5, 0.5, 0.5,
0, -3.64204, -6.318689, 0, -0.5, 0.5, 0.5,
0, -3.64204, -6.318689, 1, -0.5, 0.5, 0.5,
0, -3.64204, -6.318689, 1, 1.5, 0.5, 0.5,
0, -3.64204, -6.318689, 0, 1.5, 0.5, 0.5,
1, -3.64204, -6.318689, 0, -0.5, 0.5, 0.5,
1, -3.64204, -6.318689, 1, -0.5, 0.5, 0.5,
1, -3.64204, -6.318689, 1, 1.5, 0.5, 0.5,
1, -3.64204, -6.318689, 0, 1.5, 0.5, 0.5,
2, -3.64204, -6.318689, 0, -0.5, 0.5, 0.5,
2, -3.64204, -6.318689, 1, -0.5, 0.5, 0.5,
2, -3.64204, -6.318689, 1, 1.5, 0.5, 0.5,
2, -3.64204, -6.318689, 0, 1.5, 0.5, 0.5,
3, -3.64204, -6.318689, 0, -0.5, 0.5, 0.5,
3, -3.64204, -6.318689, 1, -0.5, 0.5, 0.5,
3, -3.64204, -6.318689, 1, 1.5, 0.5, 0.5,
3, -3.64204, -6.318689, 0, 1.5, 0.5, 0.5
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
-3.497074, -3, -5.480046,
-3.497074, 3, -5.480046,
-3.497074, -3, -5.480046,
-3.676826, -3, -5.759593,
-3.497074, -2, -5.480046,
-3.676826, -2, -5.759593,
-3.497074, -1, -5.480046,
-3.676826, -1, -5.759593,
-3.497074, 0, -5.480046,
-3.676826, 0, -5.759593,
-3.497074, 1, -5.480046,
-3.676826, 1, -5.759593,
-3.497074, 2, -5.480046,
-3.676826, 2, -5.759593,
-3.497074, 3, -5.480046,
-3.676826, 3, -5.759593
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
-4.036329, -3, -6.318689, 0, -0.5, 0.5, 0.5,
-4.036329, -3, -6.318689, 1, -0.5, 0.5, 0.5,
-4.036329, -3, -6.318689, 1, 1.5, 0.5, 0.5,
-4.036329, -3, -6.318689, 0, 1.5, 0.5, 0.5,
-4.036329, -2, -6.318689, 0, -0.5, 0.5, 0.5,
-4.036329, -2, -6.318689, 1, -0.5, 0.5, 0.5,
-4.036329, -2, -6.318689, 1, 1.5, 0.5, 0.5,
-4.036329, -2, -6.318689, 0, 1.5, 0.5, 0.5,
-4.036329, -1, -6.318689, 0, -0.5, 0.5, 0.5,
-4.036329, -1, -6.318689, 1, -0.5, 0.5, 0.5,
-4.036329, -1, -6.318689, 1, 1.5, 0.5, 0.5,
-4.036329, -1, -6.318689, 0, 1.5, 0.5, 0.5,
-4.036329, 0, -6.318689, 0, -0.5, 0.5, 0.5,
-4.036329, 0, -6.318689, 1, -0.5, 0.5, 0.5,
-4.036329, 0, -6.318689, 1, 1.5, 0.5, 0.5,
-4.036329, 0, -6.318689, 0, 1.5, 0.5, 0.5,
-4.036329, 1, -6.318689, 0, -0.5, 0.5, 0.5,
-4.036329, 1, -6.318689, 1, -0.5, 0.5, 0.5,
-4.036329, 1, -6.318689, 1, 1.5, 0.5, 0.5,
-4.036329, 1, -6.318689, 0, 1.5, 0.5, 0.5,
-4.036329, 2, -6.318689, 0, -0.5, 0.5, 0.5,
-4.036329, 2, -6.318689, 1, -0.5, 0.5, 0.5,
-4.036329, 2, -6.318689, 1, 1.5, 0.5, 0.5,
-4.036329, 2, -6.318689, 0, 1.5, 0.5, 0.5,
-4.036329, 3, -6.318689, 0, -0.5, 0.5, 0.5,
-4.036329, 3, -6.318689, 1, -0.5, 0.5, 0.5,
-4.036329, 3, -6.318689, 1, 1.5, 0.5, 0.5,
-4.036329, 3, -6.318689, 0, 1.5, 0.5, 0.5
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
-3.497074, -3.149241, -4,
-3.497074, -3.149241, 4,
-3.497074, -3.149241, -4,
-3.676826, -3.313507, -4,
-3.497074, -3.149241, -2,
-3.676826, -3.313507, -2,
-3.497074, -3.149241, 0,
-3.676826, -3.313507, 0,
-3.497074, -3.149241, 2,
-3.676826, -3.313507, 2,
-3.497074, -3.149241, 4,
-3.676826, -3.313507, 4
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
-4.036329, -3.64204, -4, 0, -0.5, 0.5, 0.5,
-4.036329, -3.64204, -4, 1, -0.5, 0.5, 0.5,
-4.036329, -3.64204, -4, 1, 1.5, 0.5, 0.5,
-4.036329, -3.64204, -4, 0, 1.5, 0.5, 0.5,
-4.036329, -3.64204, -2, 0, -0.5, 0.5, 0.5,
-4.036329, -3.64204, -2, 1, -0.5, 0.5, 0.5,
-4.036329, -3.64204, -2, 1, 1.5, 0.5, 0.5,
-4.036329, -3.64204, -2, 0, 1.5, 0.5, 0.5,
-4.036329, -3.64204, 0, 0, -0.5, 0.5, 0.5,
-4.036329, -3.64204, 0, 1, -0.5, 0.5, 0.5,
-4.036329, -3.64204, 0, 1, 1.5, 0.5, 0.5,
-4.036329, -3.64204, 0, 0, 1.5, 0.5, 0.5,
-4.036329, -3.64204, 2, 0, -0.5, 0.5, 0.5,
-4.036329, -3.64204, 2, 1, -0.5, 0.5, 0.5,
-4.036329, -3.64204, 2, 1, 1.5, 0.5, 0.5,
-4.036329, -3.64204, 2, 0, 1.5, 0.5, 0.5,
-4.036329, -3.64204, 4, 0, -0.5, 0.5, 0.5,
-4.036329, -3.64204, 4, 1, -0.5, 0.5, 0.5,
-4.036329, -3.64204, 4, 1, 1.5, 0.5, 0.5,
-4.036329, -3.64204, 4, 0, 1.5, 0.5, 0.5
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
-3.497074, -3.149241, -5.480046,
-3.497074, 3.421401, -5.480046,
-3.497074, -3.149241, 5.701865,
-3.497074, 3.421401, 5.701865,
-3.497074, -3.149241, -5.480046,
-3.497074, -3.149241, 5.701865,
-3.497074, 3.421401, -5.480046,
-3.497074, 3.421401, 5.701865,
-3.497074, -3.149241, -5.480046,
3.692998, -3.149241, -5.480046,
-3.497074, -3.149241, 5.701865,
3.692998, -3.149241, 5.701865,
-3.497074, 3.421401, -5.480046,
3.692998, 3.421401, -5.480046,
-3.497074, 3.421401, 5.701865,
3.692998, 3.421401, 5.701865,
3.692998, -3.149241, -5.480046,
3.692998, 3.421401, -5.480046,
3.692998, -3.149241, 5.701865,
3.692998, 3.421401, 5.701865,
3.692998, -3.149241, -5.480046,
3.692998, -3.149241, 5.701865,
3.692998, 3.421401, -5.480046,
3.692998, 3.421401, 5.701865
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
var radius = 7.918513;
var distance = 35.23035;
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
mvMatrix.translate( -0.09796226, -0.1360797, -0.1109095 );
mvMatrix.scale( 1.19076, 1.303016, 0.7656698 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.23035);
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
teflubenzuron<-read.table("teflubenzuron.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-teflubenzuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'teflubenzuron' not found
```

```r
y<-teflubenzuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'teflubenzuron' not found
```

```r
z<-teflubenzuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'teflubenzuron' not found
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
-3.392364, 0.4312809, -1.73685, 0, 0, 1, 1, 1,
-3.180287, 1.486406, -0.4834364, 1, 0, 0, 1, 1,
-2.543117, 0.214049, -0.6514365, 1, 0, 0, 1, 1,
-2.408736, 0.5694637, -1.848463, 1, 0, 0, 1, 1,
-2.399719, 0.874296, -1.058692, 1, 0, 0, 1, 1,
-2.382369, 0.2479506, -1.311751, 1, 0, 0, 1, 1,
-2.322082, -0.8639565, -0.5305049, 0, 0, 0, 1, 1,
-2.320283, 0.448658, -1.142404, 0, 0, 0, 1, 1,
-2.294749, -1.818237, -2.554436, 0, 0, 0, 1, 1,
-2.287122, -0.3420683, -0.4978101, 0, 0, 0, 1, 1,
-2.287105, -0.1370866, -3.242685, 0, 0, 0, 1, 1,
-2.282439, -0.6424169, -2.346577, 0, 0, 0, 1, 1,
-2.212188, -0.9964385, -3.107172, 0, 0, 0, 1, 1,
-2.19295, -0.2252014, -2.155116, 1, 1, 1, 1, 1,
-2.126372, -1.083152, -2.793809, 1, 1, 1, 1, 1,
-2.124198, -0.5555879, -2.111639, 1, 1, 1, 1, 1,
-2.110638, 1.418024, -1.877199, 1, 1, 1, 1, 1,
-2.096789, 0.8017318, -2.888829, 1, 1, 1, 1, 1,
-2.050487, -0.9794652, -0.4264916, 1, 1, 1, 1, 1,
-2.033081, 1.533068, 0.6807445, 1, 1, 1, 1, 1,
-2.009589, -0.1346159, -3.811495, 1, 1, 1, 1, 1,
-1.967027, 0.152406, -1.046139, 1, 1, 1, 1, 1,
-1.962502, -0.3879157, -1.578139, 1, 1, 1, 1, 1,
-1.950565, 1.999422, 0.1270198, 1, 1, 1, 1, 1,
-1.938154, -0.6338249, -0.5912713, 1, 1, 1, 1, 1,
-1.922193, -1.155509, -2.099655, 1, 1, 1, 1, 1,
-1.911141, -0.2598017, -0.4194582, 1, 1, 1, 1, 1,
-1.909371, 1.116928, -0.7212892, 1, 1, 1, 1, 1,
-1.90565, -1.204156, -1.85116, 0, 0, 1, 1, 1,
-1.903346, 0.1099249, 0.1615837, 1, 0, 0, 1, 1,
-1.901508, 0.5519824, 0.3003417, 1, 0, 0, 1, 1,
-1.866324, 0.2937109, -1.65737, 1, 0, 0, 1, 1,
-1.847909, 1.574831, 0.1383578, 1, 0, 0, 1, 1,
-1.843817, -0.6659907, -1.81307, 1, 0, 0, 1, 1,
-1.842119, 0.5964179, -0.3748612, 0, 0, 0, 1, 1,
-1.833006, 0.1343001, -0.9907851, 0, 0, 0, 1, 1,
-1.832303, 0.242461, 0.7197961, 0, 0, 0, 1, 1,
-1.825548, -1.995974, -2.291945, 0, 0, 0, 1, 1,
-1.80473, -0.9909015, -0.4549549, 0, 0, 0, 1, 1,
-1.791728, 1.707753, 1.35876, 0, 0, 0, 1, 1,
-1.772944, -1.21013, -1.230006, 0, 0, 0, 1, 1,
-1.757965, 1.439882, -1.405096, 1, 1, 1, 1, 1,
-1.711069, 0.0498043, -1.295017, 1, 1, 1, 1, 1,
-1.69918, 1.888261, -0.4898496, 1, 1, 1, 1, 1,
-1.698001, 0.4477942, -2.03984, 1, 1, 1, 1, 1,
-1.695064, 1.338586, -1.1886, 1, 1, 1, 1, 1,
-1.688331, -0.7108961, -1.891063, 1, 1, 1, 1, 1,
-1.685991, 0.1193393, -1.001266, 1, 1, 1, 1, 1,
-1.683528, 0.2325885, 0.8082486, 1, 1, 1, 1, 1,
-1.671493, 1.50167, 0.3799426, 1, 1, 1, 1, 1,
-1.662794, -0.6982421, -1.87603, 1, 1, 1, 1, 1,
-1.65915, -2.262348, -3.577356, 1, 1, 1, 1, 1,
-1.650466, -0.3445131, -2.680634, 1, 1, 1, 1, 1,
-1.646177, -0.4455313, -1.509208, 1, 1, 1, 1, 1,
-1.642231, 0.1871815, 0.01646123, 1, 1, 1, 1, 1,
-1.6375, -0.1582446, -1.550589, 1, 1, 1, 1, 1,
-1.618076, -0.2617306, -0.3046352, 0, 0, 1, 1, 1,
-1.61236, -1.157318, -2.114516, 1, 0, 0, 1, 1,
-1.608183, -0.4448921, -2.291842, 1, 0, 0, 1, 1,
-1.60544, 0.02345739, -1.55121, 1, 0, 0, 1, 1,
-1.597484, 1.278491, -2.451247, 1, 0, 0, 1, 1,
-1.571321, -1.446786, -2.081375, 1, 0, 0, 1, 1,
-1.550101, 0.1170273, -1.458303, 0, 0, 0, 1, 1,
-1.547827, -0.4120188, -1.230652, 0, 0, 0, 1, 1,
-1.533545, 1.147322, -1.384194, 0, 0, 0, 1, 1,
-1.529439, -1.417021, -2.395089, 0, 0, 0, 1, 1,
-1.519372, -0.9243304, -3.396437, 0, 0, 0, 1, 1,
-1.512172, -1.896799, -1.788395, 0, 0, 0, 1, 1,
-1.507454, -0.6489688, -2.654411, 0, 0, 0, 1, 1,
-1.49617, 2.055707, -1.039355, 1, 1, 1, 1, 1,
-1.486272, -1.63326, -2.157496, 1, 1, 1, 1, 1,
-1.479206, -0.03857012, -2.91212, 1, 1, 1, 1, 1,
-1.469116, -1.115908, -2.877275, 1, 1, 1, 1, 1,
-1.46418, 0.3690651, -0.2128612, 1, 1, 1, 1, 1,
-1.455063, -0.4565005, -0.1010485, 1, 1, 1, 1, 1,
-1.44083, -0.6431231, -0.4589889, 1, 1, 1, 1, 1,
-1.440233, -1.56266, -1.284794, 1, 1, 1, 1, 1,
-1.438885, 0.9366475, 0.863003, 1, 1, 1, 1, 1,
-1.423635, -0.7441748, -1.742099, 1, 1, 1, 1, 1,
-1.415486, 0.7416826, -3.057837, 1, 1, 1, 1, 1,
-1.413405, -0.1980927, -3.550022, 1, 1, 1, 1, 1,
-1.396425, 0.01027118, -1.61575, 1, 1, 1, 1, 1,
-1.393671, 0.662928, -1.915383, 1, 1, 1, 1, 1,
-1.392274, -0.2821812, -1.375282, 1, 1, 1, 1, 1,
-1.377386, -1.043657, -2.651578, 0, 0, 1, 1, 1,
-1.374419, 1.668972, 0.11918, 1, 0, 0, 1, 1,
-1.35915, 1.149102, 0.7850733, 1, 0, 0, 1, 1,
-1.35692, -0.6399043, -0.80837, 1, 0, 0, 1, 1,
-1.355454, 0.281284, 0.0878462, 1, 0, 0, 1, 1,
-1.350873, -1.820815, -3.147022, 1, 0, 0, 1, 1,
-1.350869, -0.5070449, -3.08002, 0, 0, 0, 1, 1,
-1.33931, -1.253328, -3.351627, 0, 0, 0, 1, 1,
-1.328992, 1.040298, -0.8698312, 0, 0, 0, 1, 1,
-1.31764, 0.8838788, -1.304885, 0, 0, 0, 1, 1,
-1.316738, 1.33273, -1.374472, 0, 0, 0, 1, 1,
-1.310993, 0.193453, -1.586131, 0, 0, 0, 1, 1,
-1.308185, -0.07653821, -0.6182491, 0, 0, 0, 1, 1,
-1.307124, -0.6074393, -3.212969, 1, 1, 1, 1, 1,
-1.299151, 0.3123773, 0.4327945, 1, 1, 1, 1, 1,
-1.27659, 0.4701727, 0.1104606, 1, 1, 1, 1, 1,
-1.271281, 1.928868, -2.243715, 1, 1, 1, 1, 1,
-1.26395, 1.772068, -1.552169, 1, 1, 1, 1, 1,
-1.260463, -0.8566889, -1.43693, 1, 1, 1, 1, 1,
-1.260168, 0.2958752, -1.209733, 1, 1, 1, 1, 1,
-1.255738, -0.2831644, -1.179088, 1, 1, 1, 1, 1,
-1.252657, -1.351669, -3.682461, 1, 1, 1, 1, 1,
-1.252639, 1.727792, -1.188823, 1, 1, 1, 1, 1,
-1.247298, 0.1519758, -0.2823569, 1, 1, 1, 1, 1,
-1.244027, 0.05641519, -0.4888238, 1, 1, 1, 1, 1,
-1.23909, 1.380435, -1.216507, 1, 1, 1, 1, 1,
-1.223849, 0.6932295, -1.144427, 1, 1, 1, 1, 1,
-1.206532, -0.3921576, -1.131335, 1, 1, 1, 1, 1,
-1.205895, -1.2542, -3.336921, 0, 0, 1, 1, 1,
-1.18142, 0.5204949, -0.5078782, 1, 0, 0, 1, 1,
-1.174839, 1.234339, -0.1041294, 1, 0, 0, 1, 1,
-1.173881, 1.314753, 1.492148, 1, 0, 0, 1, 1,
-1.172477, -1.553796, -2.999079, 1, 0, 0, 1, 1,
-1.160917, 1.95085, -1.479003, 1, 0, 0, 1, 1,
-1.146473, 0.8900891, 1.411013, 0, 0, 0, 1, 1,
-1.142034, -0.6073666, -1.246322, 0, 0, 0, 1, 1,
-1.13642, -0.3743308, -2.133824, 0, 0, 0, 1, 1,
-1.130429, 1.246144, -0.3424444, 0, 0, 0, 1, 1,
-1.1172, 1.024643, -1.001297, 0, 0, 0, 1, 1,
-1.115746, -0.5893197, -2.945457, 0, 0, 0, 1, 1,
-1.103837, -0.7505519, -1.992477, 0, 0, 0, 1, 1,
-1.091603, 0.6033225, -1.311928, 1, 1, 1, 1, 1,
-1.082868, -0.4672566, -1.56476, 1, 1, 1, 1, 1,
-1.080584, -2.057709, -3.428614, 1, 1, 1, 1, 1,
-1.079573, 1.355801, -1.368251, 1, 1, 1, 1, 1,
-1.069337, -0.3841444, -2.793095, 1, 1, 1, 1, 1,
-1.065383, 0.8957267, -0.4135073, 1, 1, 1, 1, 1,
-1.062484, -0.6307304, -2.255029, 1, 1, 1, 1, 1,
-1.04359, 1.260922, -0.9958786, 1, 1, 1, 1, 1,
-1.041549, 0.1954872, -1.237386, 1, 1, 1, 1, 1,
-1.037516, -0.5747479, -4.998521, 1, 1, 1, 1, 1,
-1.029185, -1.306338, -3.511243, 1, 1, 1, 1, 1,
-1.028344, 0.5036198, -2.203567, 1, 1, 1, 1, 1,
-1.027146, -1.383208, -0.3034859, 1, 1, 1, 1, 1,
-1.017355, -0.03824366, -0.3952082, 1, 1, 1, 1, 1,
-1.012193, -1.225886, -2.346428, 1, 1, 1, 1, 1,
-1.008832, 1.033218, -0.7789157, 0, 0, 1, 1, 1,
-0.9907507, -0.3530014, -1.584494, 1, 0, 0, 1, 1,
-0.9863793, -0.6086142, -1.896829, 1, 0, 0, 1, 1,
-0.9844851, -0.2916684, -0.8792386, 1, 0, 0, 1, 1,
-0.9840494, -1.794804, -2.983497, 1, 0, 0, 1, 1,
-0.9833828, -0.8707259, -2.528628, 1, 0, 0, 1, 1,
-0.9816957, 0.2261273, -0.4845524, 0, 0, 0, 1, 1,
-0.981044, -0.4661852, -1.552539, 0, 0, 0, 1, 1,
-0.9728293, 0.4192892, -1.020765, 0, 0, 0, 1, 1,
-0.970195, 0.8179152, -1.148916, 0, 0, 0, 1, 1,
-0.9654149, 0.5541758, -0.8971385, 0, 0, 0, 1, 1,
-0.9608967, -0.8921446, -2.083446, 0, 0, 0, 1, 1,
-0.9603825, 1.190127, -0.5642173, 0, 0, 0, 1, 1,
-0.9583019, -0.6905246, -2.661369, 1, 1, 1, 1, 1,
-0.9558886, -0.6349413, -2.987729, 1, 1, 1, 1, 1,
-0.9358844, -0.6849515, -1.628375, 1, 1, 1, 1, 1,
-0.9321921, 1.274275, -2.810371, 1, 1, 1, 1, 1,
-0.9319462, -0.1368542, -1.942706, 1, 1, 1, 1, 1,
-0.9258829, -0.2141246, -2.193345, 1, 1, 1, 1, 1,
-0.9181309, -0.3060834, -2.203159, 1, 1, 1, 1, 1,
-0.9145159, 1.258329, -0.6310347, 1, 1, 1, 1, 1,
-0.9040617, -2.109726, -3.417878, 1, 1, 1, 1, 1,
-0.896042, -1.768502, -4.035469, 1, 1, 1, 1, 1,
-0.8949165, 0.3609478, 0.4596522, 1, 1, 1, 1, 1,
-0.8889624, -0.6248934, -2.030644, 1, 1, 1, 1, 1,
-0.8852908, 0.2976987, -1.091249, 1, 1, 1, 1, 1,
-0.8790136, 0.129874, -0.8536548, 1, 1, 1, 1, 1,
-0.875434, -0.2314888, -0.2863238, 1, 1, 1, 1, 1,
-0.8725078, 0.9749321, -1.444391, 0, 0, 1, 1, 1,
-0.8652686, 0.2331566, -3.122657, 1, 0, 0, 1, 1,
-0.8613323, -0.4030769, -3.331922, 1, 0, 0, 1, 1,
-0.8588918, -0.8310218, -3.086787, 1, 0, 0, 1, 1,
-0.8567971, 0.5892588, 0.6051402, 1, 0, 0, 1, 1,
-0.8468136, 1.532659, -0.08219141, 1, 0, 0, 1, 1,
-0.8412826, 1.378144, -1.36989, 0, 0, 0, 1, 1,
-0.8384389, 0.3524884, -1.192278, 0, 0, 0, 1, 1,
-0.833351, -0.6018989, -1.030544, 0, 0, 0, 1, 1,
-0.8319071, 1.372029, 0.8153278, 0, 0, 0, 1, 1,
-0.827398, -0.9553996, -3.74909, 0, 0, 0, 1, 1,
-0.8255683, 0.3930704, -1.611458, 0, 0, 0, 1, 1,
-0.8102865, 1.412497, -1.628475, 0, 0, 0, 1, 1,
-0.8091, -2.069986, -3.052173, 1, 1, 1, 1, 1,
-0.7989808, 0.1612786, -2.15772, 1, 1, 1, 1, 1,
-0.7885984, -0.9110796, -2.421642, 1, 1, 1, 1, 1,
-0.7847441, -0.1748117, -0.9666155, 1, 1, 1, 1, 1,
-0.783917, 1.314629, -1.908592, 1, 1, 1, 1, 1,
-0.7823882, 0.7192439, -1.25164, 1, 1, 1, 1, 1,
-0.7823159, 0.4601319, -2.167835, 1, 1, 1, 1, 1,
-0.773262, 0.3215549, -0.1493262, 1, 1, 1, 1, 1,
-0.7729838, 1.054538, -0.1138585, 1, 1, 1, 1, 1,
-0.7724365, -0.8073366, -2.38077, 1, 1, 1, 1, 1,
-0.7719828, -0.9909043, -2.906101, 1, 1, 1, 1, 1,
-0.7710846, 0.03145583, -3.647315, 1, 1, 1, 1, 1,
-0.7699938, -0.5170451, -1.716424, 1, 1, 1, 1, 1,
-0.7654596, -1.487434, -3.554704, 1, 1, 1, 1, 1,
-0.7633675, 0.3896467, -1.720671, 1, 1, 1, 1, 1,
-0.7522414, -0.1007861, -3.201268, 0, 0, 1, 1, 1,
-0.7489205, -0.08441383, -1.543057, 1, 0, 0, 1, 1,
-0.7469698, 0.2585717, -1.035204, 1, 0, 0, 1, 1,
-0.74543, 0.6673404, -1.036342, 1, 0, 0, 1, 1,
-0.7453022, 3.070932, -1.483261, 1, 0, 0, 1, 1,
-0.7409952, -1.952448, -4.034421, 1, 0, 0, 1, 1,
-0.7345662, -1.121086, -3.759593, 0, 0, 0, 1, 1,
-0.727346, -0.78327, -2.404429, 0, 0, 0, 1, 1,
-0.7169477, -0.1654887, -1.200659, 0, 0, 0, 1, 1,
-0.7110264, 0.2580177, -1.532049, 0, 0, 0, 1, 1,
-0.7018698, -0.06207217, -1.180227, 0, 0, 0, 1, 1,
-0.6941255, 0.330707, -0.3212107, 0, 0, 0, 1, 1,
-0.689128, -1.423555, -1.820916, 0, 0, 0, 1, 1,
-0.6842499, 2.389553, 0.1294473, 1, 1, 1, 1, 1,
-0.6837299, 0.9766585, -0.1660616, 1, 1, 1, 1, 1,
-0.6700692, 0.5974211, -0.5696374, 1, 1, 1, 1, 1,
-0.6697978, 0.3205694, -1.94602, 1, 1, 1, 1, 1,
-0.6669602, 0.7110446, -0.2961509, 1, 1, 1, 1, 1,
-0.6658326, -0.3341609, -0.5447613, 1, 1, 1, 1, 1,
-0.6633379, -1.649968, -2.552914, 1, 1, 1, 1, 1,
-0.6604536, -0.7696065, -1.893276, 1, 1, 1, 1, 1,
-0.6582123, 0.8130891, -0.8670689, 1, 1, 1, 1, 1,
-0.6550822, -1.063978, -4.01377, 1, 1, 1, 1, 1,
-0.6516117, -1.095502, -1.637011, 1, 1, 1, 1, 1,
-0.6514723, 0.2577193, -0.8116794, 1, 1, 1, 1, 1,
-0.6459442, 0.4633012, 1.017774, 1, 1, 1, 1, 1,
-0.6446337, 0.4146318, -2.380319, 1, 1, 1, 1, 1,
-0.6439592, 0.638829, -0.4381336, 1, 1, 1, 1, 1,
-0.6432224, 0.7339461, -0.7992988, 0, 0, 1, 1, 1,
-0.6392193, -0.5641986, -3.936011, 1, 0, 0, 1, 1,
-0.6378158, 0.4819154, -2.263111, 1, 0, 0, 1, 1,
-0.6370191, 1.424791, -0.3549097, 1, 0, 0, 1, 1,
-0.632939, -1.140897, -0.8408635, 1, 0, 0, 1, 1,
-0.6261744, 1.249607, -1.459987, 1, 0, 0, 1, 1,
-0.6261557, -0.4529341, -0.6168532, 0, 0, 0, 1, 1,
-0.6110356, -1.467147, -5.317203, 0, 0, 0, 1, 1,
-0.6073477, -1.182046, -2.050583, 0, 0, 0, 1, 1,
-0.6025798, 0.03271592, -1.707755, 0, 0, 0, 1, 1,
-0.6007192, 0.8573278, -1.183234, 0, 0, 0, 1, 1,
-0.5988221, 0.3214015, -0.615267, 0, 0, 0, 1, 1,
-0.5943685, 0.263848, -0.8876892, 0, 0, 0, 1, 1,
-0.5936358, 0.3552016, -1.910812, 1, 1, 1, 1, 1,
-0.5929666, 0.1027527, -2.709091, 1, 1, 1, 1, 1,
-0.5880432, -1.695242, -2.610662, 1, 1, 1, 1, 1,
-0.5763892, -0.07429814, -1.539643, 1, 1, 1, 1, 1,
-0.5722458, 0.1502794, -1.087911, 1, 1, 1, 1, 1,
-0.5692049, -0.9807205, -2.685027, 1, 1, 1, 1, 1,
-0.5672281, -0.3504252, -3.31724, 1, 1, 1, 1, 1,
-0.5657986, -1.468189, -1.851588, 1, 1, 1, 1, 1,
-0.5647736, -0.8974174, -2.733113, 1, 1, 1, 1, 1,
-0.5641064, 0.3037235, 0.4241877, 1, 1, 1, 1, 1,
-0.5607296, 0.4350916, 0.4678079, 1, 1, 1, 1, 1,
-0.5605839, -2.782653, -3.947125, 1, 1, 1, 1, 1,
-0.5600048, -0.6997846, -0.2788266, 1, 1, 1, 1, 1,
-0.559093, -0.1863328, -2.082064, 1, 1, 1, 1, 1,
-0.5567815, 0.8736393, 1.17915, 1, 1, 1, 1, 1,
-0.5557625, 0.1914265, -1.523399, 0, 0, 1, 1, 1,
-0.5546055, -0.1085829, -1.421823, 1, 0, 0, 1, 1,
-0.5501322, -0.3070409, -1.366181, 1, 0, 0, 1, 1,
-0.5491934, 0.8727561, -3.320825, 1, 0, 0, 1, 1,
-0.5483702, -0.8151219, -2.822434, 1, 0, 0, 1, 1,
-0.5472919, 2.423792, 0.5074229, 1, 0, 0, 1, 1,
-0.5444328, -0.6352229, -3.355332, 0, 0, 0, 1, 1,
-0.5423024, -0.7847107, -1.250392, 0, 0, 0, 1, 1,
-0.5389775, -1.596649, -1.870032, 0, 0, 0, 1, 1,
-0.5387365, 1.103248, 0.6202087, 0, 0, 0, 1, 1,
-0.5374455, -0.5042505, -1.273635, 0, 0, 0, 1, 1,
-0.5366662, -0.1478584, -2.301664, 0, 0, 0, 1, 1,
-0.5331623, 1.204126, -0.2127497, 0, 0, 0, 1, 1,
-0.5313969, 1.352803, 0.1241593, 1, 1, 1, 1, 1,
-0.5300546, 0.07363765, -0.9941223, 1, 1, 1, 1, 1,
-0.528086, -0.1373227, -0.9701158, 1, 1, 1, 1, 1,
-0.5259129, 0.9961504, -0.7060621, 1, 1, 1, 1, 1,
-0.5247085, -0.04808835, -1.604859, 1, 1, 1, 1, 1,
-0.5203992, 0.5363423, -0.01797833, 1, 1, 1, 1, 1,
-0.5190934, 0.8553245, -0.02763248, 1, 1, 1, 1, 1,
-0.5182725, 1.05315, -0.6772978, 1, 1, 1, 1, 1,
-0.5156322, 0.05984795, -2.461312, 1, 1, 1, 1, 1,
-0.5136378, -1.226662, -3.024372, 1, 1, 1, 1, 1,
-0.507183, 1.740602, 0.08677769, 1, 1, 1, 1, 1,
-0.5036677, 0.2404953, -1.623194, 1, 1, 1, 1, 1,
-0.4996591, 0.4456835, 0.0386846, 1, 1, 1, 1, 1,
-0.4995751, -0.9279585, -1.130525, 1, 1, 1, 1, 1,
-0.4988245, 1.108156, -1.419787, 1, 1, 1, 1, 1,
-0.4944363, -1.030358, -1.625136, 0, 0, 1, 1, 1,
-0.4900355, -0.5166665, -3.196839, 1, 0, 0, 1, 1,
-0.4875405, 0.503875, 0.9984229, 1, 0, 0, 1, 1,
-0.481449, -0.06721772, -1.245146, 1, 0, 0, 1, 1,
-0.4772494, 0.6430701, -1.593532, 1, 0, 0, 1, 1,
-0.4747784, 0.4083329, 1.031675, 1, 0, 0, 1, 1,
-0.4746946, 1.68658, -1.527039, 0, 0, 0, 1, 1,
-0.4708128, 0.09186023, -3.507539, 0, 0, 0, 1, 1,
-0.4682349, 0.007347115, -2.49701, 0, 0, 0, 1, 1,
-0.4661326, -0.6855823, -4.001334, 0, 0, 0, 1, 1,
-0.4637291, -0.3678585, -1.535273, 0, 0, 0, 1, 1,
-0.4630072, -0.08583667, -3.636088, 0, 0, 0, 1, 1,
-0.4630047, -1.179338, -3.429899, 0, 0, 0, 1, 1,
-0.4628955, 1.977666, 0.1168997, 1, 1, 1, 1, 1,
-0.456663, -0.8428953, -1.906992, 1, 1, 1, 1, 1,
-0.4565622, -2.242444, -3.407353, 1, 1, 1, 1, 1,
-0.4563652, 0.2002319, 0.3041263, 1, 1, 1, 1, 1,
-0.4552973, -1.959887, -2.418443, 1, 1, 1, 1, 1,
-0.4538742, -1.650547, -2.740829, 1, 1, 1, 1, 1,
-0.4509595, -1.848478, -2.004059, 1, 1, 1, 1, 1,
-0.4478053, -0.1782588, -2.353935, 1, 1, 1, 1, 1,
-0.4408104, -0.04115822, -2.347047, 1, 1, 1, 1, 1,
-0.4397207, 1.196309, -1.742677, 1, 1, 1, 1, 1,
-0.4387104, 0.04523142, -2.958217, 1, 1, 1, 1, 1,
-0.4380624, -0.141687, -0.7660551, 1, 1, 1, 1, 1,
-0.4379219, 0.5291095, -1.258591, 1, 1, 1, 1, 1,
-0.4365629, -1.207564, -1.350782, 1, 1, 1, 1, 1,
-0.4353533, 1.038194, 0.8773999, 1, 1, 1, 1, 1,
-0.4326668, -0.3519772, -1.937908, 0, 0, 1, 1, 1,
-0.4315852, 0.366946, -0.5282769, 1, 0, 0, 1, 1,
-0.4299585, -0.1514123, -2.159322, 1, 0, 0, 1, 1,
-0.4155808, 0.1144649, -1.579059, 1, 0, 0, 1, 1,
-0.4139819, 1.411107, 0.6504987, 1, 0, 0, 1, 1,
-0.4121412, 0.8962897, -1.147221, 1, 0, 0, 1, 1,
-0.4107752, 0.8310652, 0.6168132, 0, 0, 0, 1, 1,
-0.4092805, 0.3696025, -1.336528, 0, 0, 0, 1, 1,
-0.4054241, 0.0639409, -2.152747, 0, 0, 0, 1, 1,
-0.4047175, 0.4354911, -1.234784, 0, 0, 0, 1, 1,
-0.4012345, -1.076112, -1.361387, 0, 0, 0, 1, 1,
-0.4010058, 0.4624694, -2.148262, 0, 0, 0, 1, 1,
-0.398127, -0.3711997, -2.487866, 0, 0, 0, 1, 1,
-0.3971646, 0.9718605, -0.1204146, 1, 1, 1, 1, 1,
-0.3948989, 0.8053663, 0.919829, 1, 1, 1, 1, 1,
-0.3897543, 0.8041912, -1.548602, 1, 1, 1, 1, 1,
-0.387834, -1.384963, -3.579217, 1, 1, 1, 1, 1,
-0.3852324, 0.5055692, -0.6450807, 1, 1, 1, 1, 1,
-0.3840008, 0.2377809, -3.519189, 1, 1, 1, 1, 1,
-0.3808754, -0.2366886, -1.867562, 1, 1, 1, 1, 1,
-0.3792391, 1.663629, -0.4071682, 1, 1, 1, 1, 1,
-0.3773776, 0.04422405, -3.591483, 1, 1, 1, 1, 1,
-0.3761453, 0.2272119, -2.358697, 1, 1, 1, 1, 1,
-0.3750916, 0.6606747, -0.7617502, 1, 1, 1, 1, 1,
-0.3740683, 0.5653688, -0.9636879, 1, 1, 1, 1, 1,
-0.3706627, -0.7157979, -2.451599, 1, 1, 1, 1, 1,
-0.3673528, 1.110142, -1.291039, 1, 1, 1, 1, 1,
-0.3639739, -2.978353, -2.197208, 1, 1, 1, 1, 1,
-0.3608821, -0.2629739, -3.511831, 0, 0, 1, 1, 1,
-0.355567, 1.393741, -2.112518, 1, 0, 0, 1, 1,
-0.3555427, 1.025259, -0.07781065, 1, 0, 0, 1, 1,
-0.3527239, 1.053354, -0.3068586, 1, 0, 0, 1, 1,
-0.3507804, -0.2549536, -0.8388373, 1, 0, 0, 1, 1,
-0.3481529, -0.5069815, -3.053268, 1, 0, 0, 1, 1,
-0.3465762, -1.521415, -3.637682, 0, 0, 0, 1, 1,
-0.3461458, -0.1368078, -2.327013, 0, 0, 0, 1, 1,
-0.3449186, 0.5241244, -0.6825873, 0, 0, 0, 1, 1,
-0.3430203, -1.460486, -2.950049, 0, 0, 0, 1, 1,
-0.3426853, 0.6578214, 0.210808, 0, 0, 0, 1, 1,
-0.3421974, -1.068028, -1.151344, 0, 0, 0, 1, 1,
-0.3417827, -0.7366359, -1.484823, 0, 0, 0, 1, 1,
-0.3359804, -0.2709147, -1.910254, 1, 1, 1, 1, 1,
-0.3277791, 0.7301151, 0.5984804, 1, 1, 1, 1, 1,
-0.3277155, -0.6599661, -2.526144, 1, 1, 1, 1, 1,
-0.3215464, -0.7342718, -1.921061, 1, 1, 1, 1, 1,
-0.3205029, 1.374317, 0.3426956, 1, 1, 1, 1, 1,
-0.320013, -2.792341, -2.880088, 1, 1, 1, 1, 1,
-0.3116583, 0.1260568, -1.640051, 1, 1, 1, 1, 1,
-0.3095057, -0.9767616, -2.51553, 1, 1, 1, 1, 1,
-0.308354, 0.7445366, 0.9912626, 1, 1, 1, 1, 1,
-0.3070224, 1.622674, 1.289181, 1, 1, 1, 1, 1,
-0.3043095, -0.1161284, -1.912857, 1, 1, 1, 1, 1,
-0.2982489, 1.236748, -0.3246051, 1, 1, 1, 1, 1,
-0.297867, 0.9333754, 0.5858397, 1, 1, 1, 1, 1,
-0.2938716, 2.845152, 0.1875196, 1, 1, 1, 1, 1,
-0.2933495, 0.7458688, -1.758578, 1, 1, 1, 1, 1,
-0.2875217, 0.2027645, 0.2526195, 0, 0, 1, 1, 1,
-0.2874316, -0.09159694, -2.874838, 1, 0, 0, 1, 1,
-0.2829446, 1.936106, -1.87666, 1, 0, 0, 1, 1,
-0.2821705, -0.7370755, -3.119004, 1, 0, 0, 1, 1,
-0.2793403, -0.3028238, -2.337496, 1, 0, 0, 1, 1,
-0.2737723, 1.119379, -0.2900292, 1, 0, 0, 1, 1,
-0.2719881, 1.497177, -0.4549378, 0, 0, 0, 1, 1,
-0.270345, -1.022515, -3.479036, 0, 0, 0, 1, 1,
-0.2695927, -1.384416, -4.711223, 0, 0, 0, 1, 1,
-0.2683129, 0.821116, 0.7730271, 0, 0, 0, 1, 1,
-0.2674873, 1.240246, 2.302893, 0, 0, 0, 1, 1,
-0.2666333, 0.8984476, -1.573212, 0, 0, 0, 1, 1,
-0.2631, -0.3330734, -1.990768, 0, 0, 0, 1, 1,
-0.262761, -1.452962, -1.843488, 1, 1, 1, 1, 1,
-0.2584195, 0.6082223, -0.6905814, 1, 1, 1, 1, 1,
-0.2576865, -2.801475, -3.147532, 1, 1, 1, 1, 1,
-0.2517594, 0.441761, -1.237149, 1, 1, 1, 1, 1,
-0.2462868, 0.8817296, 1.047445, 1, 1, 1, 1, 1,
-0.2442482, -1.10134, -2.196988, 1, 1, 1, 1, 1,
-0.2438326, -0.1235305, -4.050008, 1, 1, 1, 1, 1,
-0.2436892, -0.2495917, -3.174588, 1, 1, 1, 1, 1,
-0.2423008, 2.279046, 0.2642227, 1, 1, 1, 1, 1,
-0.2386233, -1.147529, -3.346114, 1, 1, 1, 1, 1,
-0.237478, 0.5780661, 0.4560005, 1, 1, 1, 1, 1,
-0.2372661, -0.4627869, -3.0333, 1, 1, 1, 1, 1,
-0.2352121, 0.1930124, 0.09166596, 1, 1, 1, 1, 1,
-0.2346551, -1.675135, -2.096503, 1, 1, 1, 1, 1,
-0.2335869, 0.2280295, -2.343497, 1, 1, 1, 1, 1,
-0.2277842, -0.8708563, -3.034738, 0, 0, 1, 1, 1,
-0.2236535, 0.9564984, 0.874936, 1, 0, 0, 1, 1,
-0.2230646, -0.01424384, -2.412486, 1, 0, 0, 1, 1,
-0.2207582, 0.2920017, -0.7507925, 1, 0, 0, 1, 1,
-0.2184569, -0.9533979, -2.471398, 1, 0, 0, 1, 1,
-0.2135963, -0.2052529, -1.612501, 1, 0, 0, 1, 1,
-0.2085498, 0.5148408, -1.086964, 0, 0, 0, 1, 1,
-0.206764, 0.2247305, -0.6185834, 0, 0, 0, 1, 1,
-0.2045989, 0.3076085, 1.04653, 0, 0, 0, 1, 1,
-0.2043151, -0.1471429, -2.253443, 0, 0, 0, 1, 1,
-0.1952362, -1.27232, -2.581039, 0, 0, 0, 1, 1,
-0.191707, -0.0171866, -1.093057, 0, 0, 0, 1, 1,
-0.1905229, 1.845179, -0.382824, 0, 0, 0, 1, 1,
-0.190049, 1.480972, -0.3348902, 1, 1, 1, 1, 1,
-0.188798, -0.863782, -5.074973, 1, 1, 1, 1, 1,
-0.1880568, -1.598215, -3.45949, 1, 1, 1, 1, 1,
-0.1870959, 0.3916149, -1.473944, 1, 1, 1, 1, 1,
-0.1858036, -0.5694519, -2.786849, 1, 1, 1, 1, 1,
-0.1850183, 0.928728, -1.370192, 1, 1, 1, 1, 1,
-0.1795495, -1.285918, -3.811181, 1, 1, 1, 1, 1,
-0.1743892, 0.1238304, -1.178244, 1, 1, 1, 1, 1,
-0.1735705, 2.221025, 0.7917228, 1, 1, 1, 1, 1,
-0.168655, 2.209761, 1.124956, 1, 1, 1, 1, 1,
-0.1683388, 0.1784753, -0.2376129, 1, 1, 1, 1, 1,
-0.1675865, 1.473616, 0.1638858, 1, 1, 1, 1, 1,
-0.1675387, -0.352838, -4.149603, 1, 1, 1, 1, 1,
-0.166746, -1.511496, -2.479586, 1, 1, 1, 1, 1,
-0.1662307, 1.397084, -0.999083, 1, 1, 1, 1, 1,
-0.1634108, 1.811686, -1.278088, 0, 0, 1, 1, 1,
-0.1558563, 1.373565, -0.8076606, 1, 0, 0, 1, 1,
-0.1540276, -0.8925623, -1.731767, 1, 0, 0, 1, 1,
-0.1504036, -0.7832248, -2.229445, 1, 0, 0, 1, 1,
-0.1475332, 1.55866, 0.4210149, 1, 0, 0, 1, 1,
-0.1455454, -0.3723778, -1.850311, 1, 0, 0, 1, 1,
-0.1413935, 0.8105436, 0.12505, 0, 0, 0, 1, 1,
-0.1298181, 0.3630295, 1.212202, 0, 0, 0, 1, 1,
-0.1287871, 0.4611341, -1.80073, 0, 0, 0, 1, 1,
-0.1263496, -0.7835701, -2.998601, 0, 0, 0, 1, 1,
-0.1259568, -2.0397, -2.547062, 0, 0, 0, 1, 1,
-0.1248756, -0.5735205, -2.413468, 0, 0, 0, 1, 1,
-0.1237313, -0.2470123, -2.231278, 0, 0, 0, 1, 1,
-0.1229995, -0.2143967, -3.52176, 1, 1, 1, 1, 1,
-0.1224246, -0.6587319, -3.365327, 1, 1, 1, 1, 1,
-0.1212434, 0.3648486, -0.311771, 1, 1, 1, 1, 1,
-0.1201824, -0.2065319, -2.359373, 1, 1, 1, 1, 1,
-0.1200332, -0.2502357, -2.871307, 1, 1, 1, 1, 1,
-0.1168792, 0.4035643, -1.510314, 1, 1, 1, 1, 1,
-0.1152752, -0.262552, -3.605557, 1, 1, 1, 1, 1,
-0.1134106, -0.03896705, -1.84351, 1, 1, 1, 1, 1,
-0.1117914, -0.3129328, -5.006813, 1, 1, 1, 1, 1,
-0.1102317, -0.9770149, -1.90763, 1, 1, 1, 1, 1,
-0.1041483, 1.383741, -0.6422784, 1, 1, 1, 1, 1,
-0.103952, -0.3125372, -3.239115, 1, 1, 1, 1, 1,
-0.1007355, 0.1671305, -2.245827, 1, 1, 1, 1, 1,
-0.09865646, -0.054683, -1.683396, 1, 1, 1, 1, 1,
-0.09768401, -3.053552, -2.766241, 1, 1, 1, 1, 1,
-0.09582497, 0.4679827, 0.169531, 0, 0, 1, 1, 1,
-0.09351654, 0.7015499, -0.4885337, 1, 0, 0, 1, 1,
-0.09290113, -0.1852363, -2.404414, 1, 0, 0, 1, 1,
-0.09234149, 0.7146447, -0.09824451, 1, 0, 0, 1, 1,
-0.09094132, -1.344208, -1.52765, 1, 0, 0, 1, 1,
-0.08757966, 0.9223323, 0.5798035, 1, 0, 0, 1, 1,
-0.08618405, -1.628655, -3.188513, 0, 0, 0, 1, 1,
-0.085605, 1.875677, 0.4702633, 0, 0, 0, 1, 1,
-0.08540262, -1.214413, -3.132545, 0, 0, 0, 1, 1,
-0.08539256, 0.7828226, -0.80212, 0, 0, 0, 1, 1,
-0.08347154, -0.4821846, -4.888798, 0, 0, 0, 1, 1,
-0.08001943, 0.3909253, 0.6815897, 0, 0, 0, 1, 1,
-0.06945233, 1.840494, 0.918577, 0, 0, 0, 1, 1,
-0.06884097, 0.3583333, -0.3820143, 1, 1, 1, 1, 1,
-0.05649072, -0.6760012, -2.677305, 1, 1, 1, 1, 1,
-0.05628368, -0.3540283, -2.933011, 1, 1, 1, 1, 1,
-0.05297501, 2.138484, 0.8213803, 1, 1, 1, 1, 1,
-0.05197959, 0.1703089, 0.7157112, 1, 1, 1, 1, 1,
-0.05057819, 0.218013, 0.03248717, 1, 1, 1, 1, 1,
-0.04777675, 0.04644505, -0.1624769, 1, 1, 1, 1, 1,
-0.0454901, -2.31769, -4.465747, 1, 1, 1, 1, 1,
-0.04033372, -2.280301, -3.370502, 1, 1, 1, 1, 1,
-0.03803477, -0.4955149, -4.133774, 1, 1, 1, 1, 1,
-0.03420376, -0.7352974, -1.956425, 1, 1, 1, 1, 1,
-0.02802004, 0.2682627, 0.8563573, 1, 1, 1, 1, 1,
-0.01580092, 1.000443, 0.823188, 1, 1, 1, 1, 1,
-0.009241837, -0.8004624, -3.297571, 1, 1, 1, 1, 1,
-0.008841206, -1.960938, -2.063133, 1, 1, 1, 1, 1,
-0.007921075, 0.8090872, 1.981553, 0, 0, 1, 1, 1,
-0.007047933, 2.368116, -0.2515317, 1, 0, 0, 1, 1,
-0.003489628, -0.9205778, -3.584692, 1, 0, 0, 1, 1,
0.0002644945, -1.554597, 4.65061, 1, 0, 0, 1, 1,
0.0004125721, 0.09654792, -0.04051422, 1, 0, 0, 1, 1,
0.01665695, -0.359259, 2.828816, 1, 0, 0, 1, 1,
0.01673779, -0.2156747, 3.415807, 0, 0, 0, 1, 1,
0.02656928, -0.3747212, 2.085466, 0, 0, 0, 1, 1,
0.02911746, 0.4082821, 0.8257795, 0, 0, 0, 1, 1,
0.03362134, 0.8135124, 0.1449941, 0, 0, 0, 1, 1,
0.03403642, -0.2798446, 3.942987, 0, 0, 0, 1, 1,
0.03498247, -0.9144757, 2.406357, 0, 0, 0, 1, 1,
0.03741524, -0.1426398, 1.436156, 0, 0, 0, 1, 1,
0.03758436, -0.6559874, 2.695026, 1, 1, 1, 1, 1,
0.04309792, -0.757126, 3.663299, 1, 1, 1, 1, 1,
0.04502397, -0.1657303, 3.352267, 1, 1, 1, 1, 1,
0.04686001, 0.4960352, 0.5831906, 1, 1, 1, 1, 1,
0.05239535, 0.6342639, 0.614589, 1, 1, 1, 1, 1,
0.05993045, 0.3831099, 0.9694619, 1, 1, 1, 1, 1,
0.06042334, 2.237631, 2.133042, 1, 1, 1, 1, 1,
0.06746607, -0.006472894, 2.347663, 1, 1, 1, 1, 1,
0.08346652, 0.03230137, 0.9404066, 1, 1, 1, 1, 1,
0.08712156, -1.259881, 2.76253, 1, 1, 1, 1, 1,
0.08769437, -0.190206, 2.658415, 1, 1, 1, 1, 1,
0.08887754, -0.9717125, 4.308361, 1, 1, 1, 1, 1,
0.09331655, 0.336649, 1.253048, 1, 1, 1, 1, 1,
0.0962735, 0.5895037, -1.521827, 1, 1, 1, 1, 1,
0.09685057, 0.3231679, -1.179115, 1, 1, 1, 1, 1,
0.09840972, -0.8234639, 2.615286, 0, 0, 1, 1, 1,
0.09987443, -1.447065, 0.9501257, 1, 0, 0, 1, 1,
0.1009908, -2.641504, 2.677547, 1, 0, 0, 1, 1,
0.1084092, -0.6783158, 1.921972, 1, 0, 0, 1, 1,
0.108539, 0.7534186, 0.2767653, 1, 0, 0, 1, 1,
0.1147133, -1.865777, 4.361828, 1, 0, 0, 1, 1,
0.1149343, 0.4313006, 0.4356189, 0, 0, 0, 1, 1,
0.1151238, -2.104603, 3.278351, 0, 0, 0, 1, 1,
0.1179087, 0.2607109, 0.563939, 0, 0, 0, 1, 1,
0.1191113, 0.6402257, -0.810613, 0, 0, 0, 1, 1,
0.1197108, -0.6268097, 4.119113, 0, 0, 0, 1, 1,
0.1200404, -0.008373389, 0.9874367, 0, 0, 0, 1, 1,
0.1205034, -0.3579618, 4.756676, 0, 0, 0, 1, 1,
0.1212224, -1.421186, 2.64455, 1, 1, 1, 1, 1,
0.1213154, 0.6106604, -0.9180038, 1, 1, 1, 1, 1,
0.1216969, 0.08387235, 1.480761, 1, 1, 1, 1, 1,
0.1267808, 0.03045074, 0.7009441, 1, 1, 1, 1, 1,
0.1285069, -0.8470112, 2.506172, 1, 1, 1, 1, 1,
0.1300245, -0.1428318, 1.619761, 1, 1, 1, 1, 1,
0.1313953, -0.6813802, 4.808061, 1, 1, 1, 1, 1,
0.1315652, -0.5114212, 3.306547, 1, 1, 1, 1, 1,
0.1320432, -0.53074, 2.666856, 1, 1, 1, 1, 1,
0.1403394, -0.5665656, 2.632851, 1, 1, 1, 1, 1,
0.1404937, 1.9307, 1.867159, 1, 1, 1, 1, 1,
0.1407238, 1.509567, 0.5179967, 1, 1, 1, 1, 1,
0.1471487, -1.292916, 2.563289, 1, 1, 1, 1, 1,
0.148211, 0.1522959, 0.05378095, 1, 1, 1, 1, 1,
0.1489608, 0.239327, 0.1553586, 1, 1, 1, 1, 1,
0.1490209, -0.6087734, 3.061902, 0, 0, 1, 1, 1,
0.1524087, -0.4695528, 3.798647, 1, 0, 0, 1, 1,
0.1558721, 0.8496761, -0.2977894, 1, 0, 0, 1, 1,
0.1587739, -0.2182964, 2.62776, 1, 0, 0, 1, 1,
0.1593118, 0.8441061, 0.6940715, 1, 0, 0, 1, 1,
0.1623873, 0.2290219, 1.193671, 1, 0, 0, 1, 1,
0.1644561, -0.9270741, 1.907, 0, 0, 0, 1, 1,
0.1705113, -0.5745947, 4.090453, 0, 0, 0, 1, 1,
0.1711263, 2.572931, 1.289057, 0, 0, 0, 1, 1,
0.1736097, 0.4651483, 0.6039725, 0, 0, 0, 1, 1,
0.1741191, 0.7344423, 2.040994, 0, 0, 0, 1, 1,
0.1788439, 0.7228525, -0.6584277, 0, 0, 0, 1, 1,
0.1807969, 0.6287654, -1.759186, 0, 0, 0, 1, 1,
0.1820483, -0.004875711, 0.9525254, 1, 1, 1, 1, 1,
0.1826793, 0.5361052, 1.069808, 1, 1, 1, 1, 1,
0.1845918, 0.855751, 0.9670078, 1, 1, 1, 1, 1,
0.1863973, 1.363608, 0.8736914, 1, 1, 1, 1, 1,
0.1897897, -0.4260129, 2.380831, 1, 1, 1, 1, 1,
0.1927565, -1.20455, 4.847165, 1, 1, 1, 1, 1,
0.1932606, 1.566119, 0.7857704, 1, 1, 1, 1, 1,
0.1939653, -1.074692, 2.738862, 1, 1, 1, 1, 1,
0.1943092, -0.4657217, 4.210637, 1, 1, 1, 1, 1,
0.1960373, 0.4290173, 0.570816, 1, 1, 1, 1, 1,
0.1976471, -0.7516155, 2.314414, 1, 1, 1, 1, 1,
0.20811, -0.6438906, 1.449697, 1, 1, 1, 1, 1,
0.2094539, 0.1271752, 3.472162, 1, 1, 1, 1, 1,
0.2097452, 0.2198114, 0.9368543, 1, 1, 1, 1, 1,
0.209967, -1.374958, 4.499522, 1, 1, 1, 1, 1,
0.2119561, 2.005268, 0.1172369, 0, 0, 1, 1, 1,
0.2178623, -0.8005148, 2.043834, 1, 0, 0, 1, 1,
0.2227544, 0.7885687, -0.239559, 1, 0, 0, 1, 1,
0.2229723, -0.08646936, 0.8157037, 1, 0, 0, 1, 1,
0.2232864, -1.126242, 2.956268, 1, 0, 0, 1, 1,
0.2239212, 0.499446, 0.04154488, 1, 0, 0, 1, 1,
0.2241643, -1.268944, 2.349419, 0, 0, 0, 1, 1,
0.2266014, 0.4179234, -0.1778171, 0, 0, 0, 1, 1,
0.2268022, -1.204694, 2.849626, 0, 0, 0, 1, 1,
0.227274, 1.564781, -1.335168, 0, 0, 0, 1, 1,
0.2272927, -0.5917981, 2.465711, 0, 0, 0, 1, 1,
0.2275279, -1.37573, 3.725952, 0, 0, 0, 1, 1,
0.2281688, -1.618928, 3.565565, 0, 0, 0, 1, 1,
0.2296665, -0.2139092, 1.811523, 1, 1, 1, 1, 1,
0.2303204, -1.143302, 2.631252, 1, 1, 1, 1, 1,
0.2306955, 0.4899247, 1.288271, 1, 1, 1, 1, 1,
0.2310443, -1.59997, 2.996603, 1, 1, 1, 1, 1,
0.2313516, 0.006340805, -0.01028754, 1, 1, 1, 1, 1,
0.231656, 3.325712, -0.3632261, 1, 1, 1, 1, 1,
0.2317324, -0.505798, 1.577476, 1, 1, 1, 1, 1,
0.2362483, -0.3572469, 2.961394, 1, 1, 1, 1, 1,
0.2375993, 0.4562401, 0.9022384, 1, 1, 1, 1, 1,
0.241087, -0.2508342, 2.876122, 1, 1, 1, 1, 1,
0.2462103, -0.04566675, 1.877148, 1, 1, 1, 1, 1,
0.2471417, -0.2673283, 1.822851, 1, 1, 1, 1, 1,
0.2479499, -0.7539102, 3.856135, 1, 1, 1, 1, 1,
0.2509454, 0.2933527, -1.12424, 1, 1, 1, 1, 1,
0.2523188, 2.095264, 0.08582033, 1, 1, 1, 1, 1,
0.2529283, 0.3339314, -1.135456, 0, 0, 1, 1, 1,
0.2534356, 0.3976605, 0.01196559, 1, 0, 0, 1, 1,
0.2536696, 0.2140702, 2.353157, 1, 0, 0, 1, 1,
0.2539821, -0.4325134, 3.390954, 1, 0, 0, 1, 1,
0.2567099, -0.9974006, 2.853426, 1, 0, 0, 1, 1,
0.262462, 0.9528195, 0.5149769, 1, 0, 0, 1, 1,
0.2633705, -1.499985, 3.717753, 0, 0, 0, 1, 1,
0.2729577, -1.105577, 2.427681, 0, 0, 0, 1, 1,
0.2740249, -0.4590088, 5.103327, 0, 0, 0, 1, 1,
0.2793663, -0.4309229, 5.539021, 0, 0, 0, 1, 1,
0.280402, -0.947148, 1.151653, 0, 0, 0, 1, 1,
0.2817464, 0.456861, -0.08937299, 0, 0, 0, 1, 1,
0.2874514, -0.6388326, 2.487653, 0, 0, 0, 1, 1,
0.289133, -0.8593808, 2.112015, 1, 1, 1, 1, 1,
0.292073, -1.023459, 4.037991, 1, 1, 1, 1, 1,
0.2956007, -1.875438, 1.054229, 1, 1, 1, 1, 1,
0.2957664, 0.1534504, 2.488756, 1, 1, 1, 1, 1,
0.3007214, 2.858584, 1.067097, 1, 1, 1, 1, 1,
0.3016266, -0.9716166, 1.827175, 1, 1, 1, 1, 1,
0.3019553, 1.094353, 0.02909026, 1, 1, 1, 1, 1,
0.3043227, 0.8401511, -1.180976, 1, 1, 1, 1, 1,
0.3070682, 0.220686, 1.440735, 1, 1, 1, 1, 1,
0.3083059, 0.07841022, 0.3153426, 1, 1, 1, 1, 1,
0.31221, 2.54285, -1.404475, 1, 1, 1, 1, 1,
0.3142121, -1.201931, 3.628098, 1, 1, 1, 1, 1,
0.3161473, -2.537176, 4.480094, 1, 1, 1, 1, 1,
0.3205763, -1.681873, 3.440394, 1, 1, 1, 1, 1,
0.3226968, 0.01864767, 0.7007737, 1, 1, 1, 1, 1,
0.3247976, 2.365865, -1.977775, 0, 0, 1, 1, 1,
0.3299122, 0.9286229, 0.4662965, 1, 0, 0, 1, 1,
0.3302134, 0.9507957, -0.6147429, 1, 0, 0, 1, 1,
0.3355446, 1.841319, 0.5191707, 1, 0, 0, 1, 1,
0.3356176, 0.2051829, 2.394826, 1, 0, 0, 1, 1,
0.3356727, 0.2947264, 0.4497325, 1, 0, 0, 1, 1,
0.3372872, 1.098308, 2.359101, 0, 0, 0, 1, 1,
0.3415949, 0.4562008, 1.199601, 0, 0, 0, 1, 1,
0.3447525, 0.09167485, 0.4053142, 0, 0, 0, 1, 1,
0.3485987, 0.2127981, 1.099902, 0, 0, 0, 1, 1,
0.3504655, -0.896079, 2.535964, 0, 0, 0, 1, 1,
0.3545036, -0.1992131, 2.233641, 0, 0, 0, 1, 1,
0.3618173, 0.1568488, -0.03129022, 0, 0, 0, 1, 1,
0.3632442, 2.34579, 1.685577, 1, 1, 1, 1, 1,
0.3660929, -0.8154747, 3.078314, 1, 1, 1, 1, 1,
0.3670954, -1.20439, 1.503381, 1, 1, 1, 1, 1,
0.3678867, 0.3114953, 1.045228, 1, 1, 1, 1, 1,
0.3691899, 0.2943173, 0.3990337, 1, 1, 1, 1, 1,
0.3765393, 1.02805, -0.1966866, 1, 1, 1, 1, 1,
0.3800919, -0.07770406, 2.58934, 1, 1, 1, 1, 1,
0.3861035, 1.005188, -0.803255, 1, 1, 1, 1, 1,
0.3878531, -0.5614392, 2.586053, 1, 1, 1, 1, 1,
0.3904827, 1.062341, 0.8410177, 1, 1, 1, 1, 1,
0.3920847, 0.1541761, 2.254737, 1, 1, 1, 1, 1,
0.3951328, -1.655152, 1.110078, 1, 1, 1, 1, 1,
0.3961233, -0.7379909, 1.286541, 1, 1, 1, 1, 1,
0.4009702, -0.5358874, 1.860544, 1, 1, 1, 1, 1,
0.4066977, 1.07012, -0.01949212, 1, 1, 1, 1, 1,
0.4092424, 1.225047, 0.9624129, 0, 0, 1, 1, 1,
0.4130466, -0.3455999, 4.125165, 1, 0, 0, 1, 1,
0.4155971, -0.9737905, 2.273669, 1, 0, 0, 1, 1,
0.4179772, 0.7410874, 0.5711527, 1, 0, 0, 1, 1,
0.4196859, 1.176041, 2.587231, 1, 0, 0, 1, 1,
0.4198032, -1.259528, 3.944808, 1, 0, 0, 1, 1,
0.42078, 1.48554, 0.872574, 0, 0, 0, 1, 1,
0.4238985, -0.2349256, 0.7692667, 0, 0, 0, 1, 1,
0.4257612, 0.1115773, 2.324769, 0, 0, 0, 1, 1,
0.4292759, 0.215957, 2.688251, 0, 0, 0, 1, 1,
0.4301281, -1.03413, 3.984757, 0, 0, 0, 1, 1,
0.4309384, -2.470058, 2.157631, 0, 0, 0, 1, 1,
0.4389197, 0.03646419, 0.857276, 0, 0, 0, 1, 1,
0.440797, -1.855211, 4.036313, 1, 1, 1, 1, 1,
0.4432044, -0.5265893, 2.04609, 1, 1, 1, 1, 1,
0.4475039, -0.6079707, 2.252001, 1, 1, 1, 1, 1,
0.4530118, -0.001187024, 0.1640752, 1, 1, 1, 1, 1,
0.4621657, -0.7179502, 2.060123, 1, 1, 1, 1, 1,
0.4622672, -1.70801, 3.400795, 1, 1, 1, 1, 1,
0.4639976, -0.1291454, 2.217467, 1, 1, 1, 1, 1,
0.4643397, 0.2670335, -0.6415391, 1, 1, 1, 1, 1,
0.4653637, 0.000593611, 2.105848, 1, 1, 1, 1, 1,
0.465443, 1.420843, 1.501353, 1, 1, 1, 1, 1,
0.4666959, -3.046742, 3.807384, 1, 1, 1, 1, 1,
0.4682957, 0.1191067, 0.7050855, 1, 1, 1, 1, 1,
0.4706296, 0.09275606, 1.269845, 1, 1, 1, 1, 1,
0.4836132, 0.5833221, 0.9952717, 1, 1, 1, 1, 1,
0.4851674, -0.1499876, 0.8825433, 1, 1, 1, 1, 1,
0.4863494, 2.390927, 1.750137, 0, 0, 1, 1, 1,
0.4930803, -0.4204673, 0.2442867, 1, 0, 0, 1, 1,
0.4944385, -0.3826014, 1.558947, 1, 0, 0, 1, 1,
0.4952781, -0.4219168, 2.702464, 1, 0, 0, 1, 1,
0.4964815, 1.273081, -0.06050707, 1, 0, 0, 1, 1,
0.4966677, 1.421096, -2.028003, 1, 0, 0, 1, 1,
0.497069, -0.6918409, 3.861087, 0, 0, 0, 1, 1,
0.4998536, -0.6846026, 3.230078, 0, 0, 0, 1, 1,
0.5007012, -0.6024469, 3.658054, 0, 0, 0, 1, 1,
0.5035424, -1.427331, 1.63556, 0, 0, 0, 1, 1,
0.5056759, 1.638966, -0.06832992, 0, 0, 0, 1, 1,
0.506387, 0.8485023, 1.571274, 0, 0, 0, 1, 1,
0.5077134, 0.1521676, 1.548087, 0, 0, 0, 1, 1,
0.5083481, 0.4755099, 0.5836549, 1, 1, 1, 1, 1,
0.5089226, -0.5278383, 1.124355, 1, 1, 1, 1, 1,
0.5092367, -1.226409, 4.32137, 1, 1, 1, 1, 1,
0.5108928, 0.4727711, 2.991503, 1, 1, 1, 1, 1,
0.5111322, -1.619332, 3.966076, 1, 1, 1, 1, 1,
0.5128691, 0.06863271, 1.085654, 1, 1, 1, 1, 1,
0.5134196, 0.2530175, 1.369573, 1, 1, 1, 1, 1,
0.5254242, 0.9559229, 1.312013, 1, 1, 1, 1, 1,
0.5288818, 0.4629624, 1.356675, 1, 1, 1, 1, 1,
0.5289122, 0.9959943, -0.6879986, 1, 1, 1, 1, 1,
0.5312043, -0.3107722, 2.407973, 1, 1, 1, 1, 1,
0.5313691, -0.3495148, 2.254815, 1, 1, 1, 1, 1,
0.5339005, -2.169299, 2.98487, 1, 1, 1, 1, 1,
0.5348549, -0.1230854, 2.1959, 1, 1, 1, 1, 1,
0.5357379, 0.2700455, 1.259441, 1, 1, 1, 1, 1,
0.5384181, 1.775574, 0.8089117, 0, 0, 1, 1, 1,
0.5391549, -1.461908, 2.302557, 1, 0, 0, 1, 1,
0.548394, 1.40125, -1.865444, 1, 0, 0, 1, 1,
0.5515585, -0.8912685, 3.636948, 1, 0, 0, 1, 1,
0.5539798, -0.3972996, 2.664655, 1, 0, 0, 1, 1,
0.5551102, 0.0583112, 1.031128, 1, 0, 0, 1, 1,
0.5580674, 0.4067208, 1.88927, 0, 0, 0, 1, 1,
0.5581938, 1.710586, 0.2814785, 0, 0, 0, 1, 1,
0.5589737, -0.03019131, 0.9132631, 0, 0, 0, 1, 1,
0.5713853, -0.475575, 2.120048, 0, 0, 0, 1, 1,
0.5763036, 1.191936, 0.8306797, 0, 0, 0, 1, 1,
0.5771298, 0.5976078, 2.255943, 0, 0, 0, 1, 1,
0.5781833, -0.4575433, 1.524989, 0, 0, 0, 1, 1,
0.5793992, -2.24657, 1.162619, 1, 1, 1, 1, 1,
0.5806612, 0.4643308, 0.7039652, 1, 1, 1, 1, 1,
0.5811563, 0.07590932, 0.3387076, 1, 1, 1, 1, 1,
0.5825192, 0.2223993, 1.745771, 1, 1, 1, 1, 1,
0.5826685, 1.380014, -0.2088551, 1, 1, 1, 1, 1,
0.5834178, 1.089474, 0.1554276, 1, 1, 1, 1, 1,
0.5850468, 1.366371, 0.2319212, 1, 1, 1, 1, 1,
0.5856422, 0.3688308, 1.047267, 1, 1, 1, 1, 1,
0.5862193, 0.8646457, 1.561552, 1, 1, 1, 1, 1,
0.5864476, -0.5490683, 2.729625, 1, 1, 1, 1, 1,
0.589817, 0.5501362, 0.2865261, 1, 1, 1, 1, 1,
0.5901347, 0.1231504, 2.528923, 1, 1, 1, 1, 1,
0.593719, 0.1018318, 2.37034, 1, 1, 1, 1, 1,
0.5955128, -0.759057, 1.989665, 1, 1, 1, 1, 1,
0.5957659, -0.3499332, 3.115354, 1, 1, 1, 1, 1,
0.5960175, -0.8497677, 3.351603, 0, 0, 1, 1, 1,
0.5978252, 1.381007, 0.6967384, 1, 0, 0, 1, 1,
0.6057897, 0.0435301, 1.478072, 1, 0, 0, 1, 1,
0.609665, -0.5095745, 1.803243, 1, 0, 0, 1, 1,
0.6145699, -1.309012, 3.586971, 1, 0, 0, 1, 1,
0.6148121, -1.199518, 2.296532, 1, 0, 0, 1, 1,
0.6154704, -1.935148, 3.88801, 0, 0, 0, 1, 1,
0.619513, 0.6911544, 2.204349, 0, 0, 0, 1, 1,
0.6197076, 1.419584, 1.277255, 0, 0, 0, 1, 1,
0.6207857, -0.9010874, 2.617269, 0, 0, 0, 1, 1,
0.6256351, 1.577279, 1.066987, 0, 0, 0, 1, 1,
0.6304445, -1.644369, 2.087243, 0, 0, 0, 1, 1,
0.6315787, 0.2723893, -0.585667, 0, 0, 0, 1, 1,
0.6329944, -0.3337734, 2.457453, 1, 1, 1, 1, 1,
0.637513, -0.4629173, 2.561786, 1, 1, 1, 1, 1,
0.6389856, -1.137578, 2.269449, 1, 1, 1, 1, 1,
0.6442291, -0.0554934, 3.794027, 1, 1, 1, 1, 1,
0.6449538, -0.9174216, 1.431782, 1, 1, 1, 1, 1,
0.6597547, 0.8463897, 1.396483, 1, 1, 1, 1, 1,
0.6660958, -1.356887, 0.5289526, 1, 1, 1, 1, 1,
0.6680059, -0.4096217, 2.619503, 1, 1, 1, 1, 1,
0.6697814, -0.9712773, 2.197214, 1, 1, 1, 1, 1,
0.6708202, -0.002867752, 1.106282, 1, 1, 1, 1, 1,
0.6721274, -0.2690606, 1.287466, 1, 1, 1, 1, 1,
0.6734192, -1.746481, 4.40307, 1, 1, 1, 1, 1,
0.6753837, 1.256832, -1.37254, 1, 1, 1, 1, 1,
0.6808434, -0.2755814, 2.963768, 1, 1, 1, 1, 1,
0.6826417, 2.077603, 2.30309, 1, 1, 1, 1, 1,
0.6851178, -1.39706, 2.809537, 0, 0, 1, 1, 1,
0.6851627, 0.4142184, 0.472407, 1, 0, 0, 1, 1,
0.6873965, 0.5325362, 0.5593835, 1, 0, 0, 1, 1,
0.6980827, 0.4580011, 2.200969, 1, 0, 0, 1, 1,
0.6984379, 0.08806495, 2.848124, 1, 0, 0, 1, 1,
0.7037972, -1.248954, 2.311589, 1, 0, 0, 1, 1,
0.7076344, -0.6326256, 0.3486217, 0, 0, 0, 1, 1,
0.711182, 0.4513808, 0.7542385, 0, 0, 0, 1, 1,
0.7131286, -0.6660839, 2.780033, 0, 0, 0, 1, 1,
0.7177241, 0.232844, 1.253701, 0, 0, 0, 1, 1,
0.7202903, -0.03225303, 1.572988, 0, 0, 0, 1, 1,
0.7263479, 0.9074385, 1.210378, 0, 0, 0, 1, 1,
0.7300027, 0.7726575, -0.3385656, 0, 0, 0, 1, 1,
0.7310078, 0.2555723, 0.5416113, 1, 1, 1, 1, 1,
0.7337364, 0.1427801, 0.5257055, 1, 1, 1, 1, 1,
0.7417809, 0.1082351, 0.8976921, 1, 1, 1, 1, 1,
0.7445585, 0.7887901, -0.6072682, 1, 1, 1, 1, 1,
0.7449614, 2.161736, 3.102422, 1, 1, 1, 1, 1,
0.7520393, 0.3996429, 1.556302, 1, 1, 1, 1, 1,
0.7548018, -0.1283012, 0.07144736, 1, 1, 1, 1, 1,
0.76237, -2.086781, 3.195103, 1, 1, 1, 1, 1,
0.7727755, -0.2299426, 2.14639, 1, 1, 1, 1, 1,
0.7729425, 0.3588368, 1.815591, 1, 1, 1, 1, 1,
0.7745247, -0.6836603, 2.103435, 1, 1, 1, 1, 1,
0.7794909, -0.9924597, 3.643591, 1, 1, 1, 1, 1,
0.7841074, -0.1004891, 0.4359666, 1, 1, 1, 1, 1,
0.7846688, 0.3486425, 0.5032223, 1, 1, 1, 1, 1,
0.7886592, 1.173958, -0.692666, 1, 1, 1, 1, 1,
0.7915704, 0.6919069, -0.6534978, 0, 0, 1, 1, 1,
0.7962098, -0.1480818, 2.328392, 1, 0, 0, 1, 1,
0.7969806, 0.2270424, 0.7898494, 1, 0, 0, 1, 1,
0.8008705, 2.374349, -0.3826808, 1, 0, 0, 1, 1,
0.8190432, 0.6563852, -0.7527911, 1, 0, 0, 1, 1,
0.8211676, -0.4469995, 0.4634689, 1, 0, 0, 1, 1,
0.8220267, -1.203773, 1.608606, 0, 0, 0, 1, 1,
0.8323377, -0.1530898, 2.30548, 0, 0, 0, 1, 1,
0.8355373, 0.4399908, 0.1562385, 0, 0, 0, 1, 1,
0.8434706, 2.210385, 0.7148961, 0, 0, 0, 1, 1,
0.8486765, -1.600362, 2.343782, 0, 0, 0, 1, 1,
0.8509127, 1.339967, 0.6064305, 0, 0, 0, 1, 1,
0.8553604, 1.290264, 2.290324, 0, 0, 0, 1, 1,
0.8571924, -1.515348, 3.002326, 1, 1, 1, 1, 1,
0.8654384, -0.9456842, 1.614463, 1, 1, 1, 1, 1,
0.8661684, 1.272849, -0.2194219, 1, 1, 1, 1, 1,
0.8784443, -0.6456409, 1.208183, 1, 1, 1, 1, 1,
0.8799426, -0.6676216, 0.5652198, 1, 1, 1, 1, 1,
0.8876675, 0.03968098, 1.600398, 1, 1, 1, 1, 1,
0.8886456, -0.06156577, 3.809552, 1, 1, 1, 1, 1,
0.8932452, 0.5594561, 1.188514, 1, 1, 1, 1, 1,
0.8952177, 0.3651457, 1.378975, 1, 1, 1, 1, 1,
0.8960109, -0.4399719, 1.764308, 1, 1, 1, 1, 1,
0.8998665, 0.3680848, 2.178039, 1, 1, 1, 1, 1,
0.9110265, 0.07406892, 0.2664, 1, 1, 1, 1, 1,
0.9144706, 0.7872795, 2.504196, 1, 1, 1, 1, 1,
0.9149393, 0.4537705, -0.315827, 1, 1, 1, 1, 1,
0.9223918, 1.226461, 2.000273, 1, 1, 1, 1, 1,
0.9267861, 0.3269455, 1.299947, 0, 0, 1, 1, 1,
0.9290663, -1.057832, 2.064901, 1, 0, 0, 1, 1,
0.9333924, -1.116322, 2.116297, 1, 0, 0, 1, 1,
0.9463605, 1.827454, 1.510623, 1, 0, 0, 1, 1,
0.9510586, -2.266662, 0.3104842, 1, 0, 0, 1, 1,
0.9526566, -0.004532644, 0.5883319, 1, 0, 0, 1, 1,
0.957473, -0.2870424, 1.563574, 0, 0, 0, 1, 1,
0.9590753, -0.3230692, 2.153518, 0, 0, 0, 1, 1,
0.9597718, 2.108021, 1.22723, 0, 0, 0, 1, 1,
0.9619445, 0.7727391, 0.4527455, 0, 0, 0, 1, 1,
0.9621699, -0.5257152, 1.643131, 0, 0, 0, 1, 1,
0.9631594, 0.528352, 1.144796, 0, 0, 0, 1, 1,
0.9635715, 0.4402251, 1.61043, 0, 0, 0, 1, 1,
0.9667215, 0.5403348, -0.009367335, 1, 1, 1, 1, 1,
0.967919, -0.05480445, 0.1078517, 1, 1, 1, 1, 1,
0.9709347, 0.1082217, 0.9844608, 1, 1, 1, 1, 1,
0.9716937, -1.197217, 0.1095978, 1, 1, 1, 1, 1,
0.9790879, -0.6074942, 2.828655, 1, 1, 1, 1, 1,
0.9829448, -0.03879857, -0.05560682, 1, 1, 1, 1, 1,
0.9899851, -0.2433651, 2.544417, 1, 1, 1, 1, 1,
1.00412, 1.425311, 0.4454903, 1, 1, 1, 1, 1,
1.006785, -1.231846, 3.063645, 1, 1, 1, 1, 1,
1.008046, 1.012246, -0.3241828, 1, 1, 1, 1, 1,
1.008812, 1.03931, 2.780391, 1, 1, 1, 1, 1,
1.011341, 0.533021, 1.280116, 1, 1, 1, 1, 1,
1.016709, -0.02284285, 0.3510872, 1, 1, 1, 1, 1,
1.017322, -0.5976503, 1.449933, 1, 1, 1, 1, 1,
1.024018, 0.2905555, 2.043845, 1, 1, 1, 1, 1,
1.025502, -0.5636228, 2.107248, 0, 0, 1, 1, 1,
1.029924, 1.010315, 2.418531, 1, 0, 0, 1, 1,
1.038416, 0.2817608, 2.918547, 1, 0, 0, 1, 1,
1.038661, -0.356626, 1.149776, 1, 0, 0, 1, 1,
1.054938, -1.853258, 3.307274, 1, 0, 0, 1, 1,
1.063429, 0.8883578, 0.4398226, 1, 0, 0, 1, 1,
1.06414, -0.5088413, 1.639316, 0, 0, 0, 1, 1,
1.065438, -0.8081234, 2.10994, 0, 0, 0, 1, 1,
1.070001, 1.617576, -0.9044712, 0, 0, 0, 1, 1,
1.070821, 1.0507, -1.746967, 0, 0, 0, 1, 1,
1.07367, -0.2404177, 2.036342, 0, 0, 0, 1, 1,
1.073951, -0.6071445, 2.209764, 0, 0, 0, 1, 1,
1.081819, -0.09066537, 0.9596581, 0, 0, 0, 1, 1,
1.0912, -0.2004753, 3.772036, 1, 1, 1, 1, 1,
1.102204, -0.4709932, -0.1183613, 1, 1, 1, 1, 1,
1.103187, 0.4137653, 0.2297369, 1, 1, 1, 1, 1,
1.111064, -0.1627079, 1.861839, 1, 1, 1, 1, 1,
1.115488, -0.8309894, 2.181904, 1, 1, 1, 1, 1,
1.120553, -0.09078752, 2.895754, 1, 1, 1, 1, 1,
1.120929, -0.6577545, 3.364666, 1, 1, 1, 1, 1,
1.131292, 0.7879654, 0.731548, 1, 1, 1, 1, 1,
1.133701, 0.4594612, 1.323975, 1, 1, 1, 1, 1,
1.135628, -0.4328747, 2.696069, 1, 1, 1, 1, 1,
1.144158, 0.5044777, 1.055432, 1, 1, 1, 1, 1,
1.156843, -0.6670904, 1.630094, 1, 1, 1, 1, 1,
1.157388, 0.3510435, 0.5361895, 1, 1, 1, 1, 1,
1.159159, -0.4077523, 1.231689, 1, 1, 1, 1, 1,
1.161926, -0.5881382, 0.8180425, 1, 1, 1, 1, 1,
1.164622, -1.030934, 3.486214, 0, 0, 1, 1, 1,
1.168684, -0.1594393, 1.375662, 1, 0, 0, 1, 1,
1.17015, 2.381941, 1.655498, 1, 0, 0, 1, 1,
1.170536, -0.05158626, 1.4862, 1, 0, 0, 1, 1,
1.176525, 1.254822, -0.4863603, 1, 0, 0, 1, 1,
1.179826, 1.204214, 0.3558811, 1, 0, 0, 1, 1,
1.181185, 0.2021055, 0.8270506, 0, 0, 0, 1, 1,
1.181956, -0.6234444, 0.7890993, 0, 0, 0, 1, 1,
1.182377, -0.9622062, 3.456048, 0, 0, 0, 1, 1,
1.183721, 1.275525, 2.548077, 0, 0, 0, 1, 1,
1.193988, 1.606189, 0.8402669, 0, 0, 0, 1, 1,
1.195284, -0.5986732, 2.048834, 0, 0, 0, 1, 1,
1.198547, 0.7145701, 0.002128578, 0, 0, 0, 1, 1,
1.202244, 0.8514013, 0.8172798, 1, 1, 1, 1, 1,
1.210858, 0.3476734, 1.460583, 1, 1, 1, 1, 1,
1.216332, -0.5612701, -0.5175294, 1, 1, 1, 1, 1,
1.226779, 0.735278, 1.502373, 1, 1, 1, 1, 1,
1.229971, 0.3290999, 1.38306, 1, 1, 1, 1, 1,
1.233724, 0.493823, -0.3465525, 1, 1, 1, 1, 1,
1.238812, 0.6242429, 1.237074, 1, 1, 1, 1, 1,
1.241429, -1.344641, 3.947217, 1, 1, 1, 1, 1,
1.244697, -1.344576, 2.497586, 1, 1, 1, 1, 1,
1.257005, 0.5592008, 2.25265, 1, 1, 1, 1, 1,
1.257384, -0.2648844, 1.248859, 1, 1, 1, 1, 1,
1.262955, 0.1339366, 0.3436556, 1, 1, 1, 1, 1,
1.269338, 0.2789772, -0.3122213, 1, 1, 1, 1, 1,
1.290288, 2.070195, 0.5402259, 1, 1, 1, 1, 1,
1.293851, 0.5630614, 1.810597, 1, 1, 1, 1, 1,
1.297101, -1.993962, 1.525324, 0, 0, 1, 1, 1,
1.304122, 0.9802638, 1.072848, 1, 0, 0, 1, 1,
1.307376, 2.173288, 0.6414165, 1, 0, 0, 1, 1,
1.308202, -1.021278, 3.544703, 1, 0, 0, 1, 1,
1.313533, 0.3085988, 2.006413, 1, 0, 0, 1, 1,
1.315068, -0.6250791, 1.213827, 1, 0, 0, 1, 1,
1.324731, -0.07410191, 1.101922, 0, 0, 0, 1, 1,
1.330148, 0.7933937, 0.9145776, 0, 0, 0, 1, 1,
1.347849, 0.4366724, 3.693705, 0, 0, 0, 1, 1,
1.348836, 0.8396265, 0.2750914, 0, 0, 0, 1, 1,
1.355159, 0.2432469, -0.09457876, 0, 0, 0, 1, 1,
1.372504, -1.07998, 1.708534, 0, 0, 0, 1, 1,
1.379318, -0.3831134, 2.645888, 0, 0, 0, 1, 1,
1.382672, 2.01602, -0.2315718, 1, 1, 1, 1, 1,
1.390381, 0.2465122, 1.261158, 1, 1, 1, 1, 1,
1.392743, 0.2713126, 0.8070999, 1, 1, 1, 1, 1,
1.393883, 1.077421, 1.170037, 1, 1, 1, 1, 1,
1.395341, -1.933482, 2.985295, 1, 1, 1, 1, 1,
1.404302, -0.8320642, 2.299731, 1, 1, 1, 1, 1,
1.406944, -0.4021827, 2.417637, 1, 1, 1, 1, 1,
1.411403, -0.04507547, 1.165774, 1, 1, 1, 1, 1,
1.414664, 1.78345, 1.968404, 1, 1, 1, 1, 1,
1.418397, 0.4947821, 2.175644, 1, 1, 1, 1, 1,
1.421466, 0.5809692, 2.543005, 1, 1, 1, 1, 1,
1.42465, -1.573073, 2.859884, 1, 1, 1, 1, 1,
1.424783, -1.652744, 2.336784, 1, 1, 1, 1, 1,
1.437769, 0.01247034, 0.1556121, 1, 1, 1, 1, 1,
1.457698, -1.020193, 3.413345, 1, 1, 1, 1, 1,
1.462561, 0.883112, 0.4496791, 0, 0, 1, 1, 1,
1.48224, -0.8851258, 2.31402, 1, 0, 0, 1, 1,
1.495731, 0.1309521, 3.175751, 1, 0, 0, 1, 1,
1.498946, -0.6820322, 2.425816, 1, 0, 0, 1, 1,
1.525274, 1.770819, 1.212338, 1, 0, 0, 1, 1,
1.525476, 0.7683865, 1.376709, 1, 0, 0, 1, 1,
1.528283, 1.019661, 0.8563125, 0, 0, 0, 1, 1,
1.529228, -0.2644127, 2.421411, 0, 0, 0, 1, 1,
1.531936, -1.205443, 2.809197, 0, 0, 0, 1, 1,
1.541689, 1.779828, -0.6270588, 0, 0, 0, 1, 1,
1.542899, 1.446115, 1.503521, 0, 0, 0, 1, 1,
1.558241, 0.4554387, 0.7263208, 0, 0, 0, 1, 1,
1.560752, 1.67532, -0.4404344, 0, 0, 0, 1, 1,
1.561673, 1.403304, 0.6675544, 1, 1, 1, 1, 1,
1.566977, -0.1969701, 2.950149, 1, 1, 1, 1, 1,
1.567626, -0.827575, 1.125866, 1, 1, 1, 1, 1,
1.568076, 0.1043339, 0.7624485, 1, 1, 1, 1, 1,
1.587382, -0.3003924, 2.856123, 1, 1, 1, 1, 1,
1.592161, -0.5978337, 3.575183, 1, 1, 1, 1, 1,
1.594507, -0.1485875, 1.408675, 1, 1, 1, 1, 1,
1.595639, 0.3755078, 1.055, 1, 1, 1, 1, 1,
1.599013, -1.701232, 3.105474, 1, 1, 1, 1, 1,
1.60188, -1.809622, 1.480215, 1, 1, 1, 1, 1,
1.603279, -0.6127769, 2.607517, 1, 1, 1, 1, 1,
1.608732, -1.257352, 1.544665, 1, 1, 1, 1, 1,
1.610857, 0.3944726, 0.9941475, 1, 1, 1, 1, 1,
1.611497, 0.988768, 0.3378784, 1, 1, 1, 1, 1,
1.618142, -1.413669, 4.056708, 1, 1, 1, 1, 1,
1.623303, -0.175692, 2.291838, 0, 0, 1, 1, 1,
1.627552, 1.225817, 2.05238, 1, 0, 0, 1, 1,
1.651231, -0.6192322, 1.706478, 1, 0, 0, 1, 1,
1.653651, 0.05197237, -0.08455103, 1, 0, 0, 1, 1,
1.655971, -0.1441909, 2.894225, 1, 0, 0, 1, 1,
1.663527, -1.302941, 3.191037, 1, 0, 0, 1, 1,
1.666691, -0.4903384, 0.1598099, 0, 0, 0, 1, 1,
1.697028, -1.099231, 3.986495, 0, 0, 0, 1, 1,
1.713369, 2.096552, 0.3477359, 0, 0, 0, 1, 1,
1.758516, 0.8460606, 0.1565858, 0, 0, 0, 1, 1,
1.779653, -0.6673243, 1.802696, 0, 0, 0, 1, 1,
1.791783, 0.720948, 1.833162, 0, 0, 0, 1, 1,
1.803011, -1.078098, 3.338567, 0, 0, 0, 1, 1,
1.803789, -0.7485254, 3.511674, 1, 1, 1, 1, 1,
1.812696, 0.05465288, 1.319117, 1, 1, 1, 1, 1,
1.819815, -1.700043, 2.048895, 1, 1, 1, 1, 1,
1.823618, 0.723748, 3.0551, 1, 1, 1, 1, 1,
1.835021, -0.5239307, 0.7273779, 1, 1, 1, 1, 1,
1.849641, -1.151784, 3.536722, 1, 1, 1, 1, 1,
1.861753, 0.2440507, 3.135692, 1, 1, 1, 1, 1,
1.868919, -0.6247607, 0.8085743, 1, 1, 1, 1, 1,
1.885553, -2.406007, 2.83995, 1, 1, 1, 1, 1,
1.889237, -0.2938046, 2.038631, 1, 1, 1, 1, 1,
1.892635, 0.9503902, 0.09708233, 1, 1, 1, 1, 1,
1.902261, -2.276891, 2.385953, 1, 1, 1, 1, 1,
1.912503, 0.4985512, 2.755451, 1, 1, 1, 1, 1,
1.920328, -0.2768638, 3.436173, 1, 1, 1, 1, 1,
1.927225, 1.674871, 0.8456549, 1, 1, 1, 1, 1,
1.934258, 0.9963545, 1.369744, 0, 0, 1, 1, 1,
1.956883, -0.3973964, 1.822514, 1, 0, 0, 1, 1,
2.022232, -0.3370775, 2.489577, 1, 0, 0, 1, 1,
2.024738, 0.7158068, 2.282936, 1, 0, 0, 1, 1,
2.039837, -1.51698, 3.895333, 1, 0, 0, 1, 1,
2.057369, -0.3237668, 2.966499, 1, 0, 0, 1, 1,
2.066557, -2.052706, 1.272891, 0, 0, 0, 1, 1,
2.09525, 0.03556396, 1.141252, 0, 0, 0, 1, 1,
2.129543, -0.8085299, 1.496403, 0, 0, 0, 1, 1,
2.143385, 0.4163697, 0.04056262, 0, 0, 0, 1, 1,
2.316757, -0.9561732, 1.48048, 0, 0, 0, 1, 1,
2.37886, -0.4455189, -0.2714231, 0, 0, 0, 1, 1,
2.414185, 1.612209, 0.3096971, 0, 0, 0, 1, 1,
2.498067, -0.7191158, -0.7991908, 1, 1, 1, 1, 1,
2.533134, -0.3413382, 1.153616, 1, 1, 1, 1, 1,
2.573287, 0.5132567, 3.111738, 1, 1, 1, 1, 1,
3.009502, -1.215418, 2.38509, 1, 1, 1, 1, 1,
3.084256, 0.9762736, -0.3527805, 1, 1, 1, 1, 1,
3.133228, -0.25541, 0.7943795, 1, 1, 1, 1, 1,
3.588289, 0.5973141, 1.147744, 1, 1, 1, 1, 1
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
var radius = 9.779283;
var distance = 34.34932;
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
mvMatrix.translate( -0.09796214, -0.1360795, -0.1109095 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.34932);
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
