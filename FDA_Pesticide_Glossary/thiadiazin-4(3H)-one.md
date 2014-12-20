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
-2.728854, -1.880296, -2.434113, 1, 0, 0, 1,
-2.688166, -0.2180434, -2.78592, 1, 0.007843138, 0, 1,
-2.521821, 0.8722579, -0.7184331, 1, 0.01176471, 0, 1,
-2.519293, -0.183697, -2.427023, 1, 0.01960784, 0, 1,
-2.469956, -0.5463064, -1.633374, 1, 0.02352941, 0, 1,
-2.418069, 0.8716739, -1.018444, 1, 0.03137255, 0, 1,
-2.324561, -0.2815095, -1.797728, 1, 0.03529412, 0, 1,
-2.32122, -1.626786, -1.466456, 1, 0.04313726, 0, 1,
-2.30357, -0.01475435, -0.9242551, 1, 0.04705882, 0, 1,
-2.301802, -0.1266633, -2.101347, 1, 0.05490196, 0, 1,
-2.299497, 1.768622, 0.4625789, 1, 0.05882353, 0, 1,
-2.276581, -0.2558087, -1.306061, 1, 0.06666667, 0, 1,
-2.256513, 0.453563, -0.1971996, 1, 0.07058824, 0, 1,
-2.251325, -0.9720262, -1.774627, 1, 0.07843138, 0, 1,
-2.19032, 0.5371298, -1.619553, 1, 0.08235294, 0, 1,
-2.133033, 1.560582, -0.833805, 1, 0.09019608, 0, 1,
-2.132692, 0.3893972, -0.1445799, 1, 0.09411765, 0, 1,
-2.124223, 1.564065, -1.67151, 1, 0.1019608, 0, 1,
-2.123586, 0.2092804, -1.475057, 1, 0.1098039, 0, 1,
-2.104568, -1.53666, -1.513842, 1, 0.1137255, 0, 1,
-2.089981, -0.07996152, -2.986122, 1, 0.1215686, 0, 1,
-2.064552, 1.124751, -0.7771207, 1, 0.1254902, 0, 1,
-2.055272, 0.1273966, -1.96426, 1, 0.1333333, 0, 1,
-2.03112, -0.1628482, -1.629186, 1, 0.1372549, 0, 1,
-2.015763, -0.4104041, -1.459608, 1, 0.145098, 0, 1,
-2.006242, -1.285246, -2.746837, 1, 0.1490196, 0, 1,
-2.000162, -0.4842445, -3.606391, 1, 0.1568628, 0, 1,
-1.992792, -0.7322431, -2.691138, 1, 0.1607843, 0, 1,
-1.977272, 0.6556472, 0.004075579, 1, 0.1686275, 0, 1,
-1.95796, -0.4233211, -3.19954, 1, 0.172549, 0, 1,
-1.938613, -0.4249617, -2.093343, 1, 0.1803922, 0, 1,
-1.928195, 0.5448368, 0.6752607, 1, 0.1843137, 0, 1,
-1.925183, -0.08316157, -2.459775, 1, 0.1921569, 0, 1,
-1.862614, -1.440898, -2.908187, 1, 0.1960784, 0, 1,
-1.847148, -1.170646, -1.671993, 1, 0.2039216, 0, 1,
-1.823514, -1.521987, -2.995343, 1, 0.2117647, 0, 1,
-1.80188, -0.8627311, -1.848495, 1, 0.2156863, 0, 1,
-1.799961, -0.3373933, -0.4246043, 1, 0.2235294, 0, 1,
-1.795088, 2.211186, 0.09643593, 1, 0.227451, 0, 1,
-1.788978, -0.6335492, -1.856313, 1, 0.2352941, 0, 1,
-1.778625, 0.6016507, -0.316353, 1, 0.2392157, 0, 1,
-1.761927, -1.065372, -3.023131, 1, 0.2470588, 0, 1,
-1.750759, -0.5949032, -1.392881, 1, 0.2509804, 0, 1,
-1.744324, 1.13524, -1.135782, 1, 0.2588235, 0, 1,
-1.729296, -0.3960498, -2.488267, 1, 0.2627451, 0, 1,
-1.704024, 0.1103747, -1.077369, 1, 0.2705882, 0, 1,
-1.696786, 0.4854435, -1.382199, 1, 0.2745098, 0, 1,
-1.693722, 1.685197, -0.8620203, 1, 0.282353, 0, 1,
-1.693582, 0.6719041, -1.20027, 1, 0.2862745, 0, 1,
-1.69252, -0.7610894, -1.1719, 1, 0.2941177, 0, 1,
-1.685354, 1.224247, -2.799872, 1, 0.3019608, 0, 1,
-1.659902, -0.1726078, -1.141966, 1, 0.3058824, 0, 1,
-1.650557, -0.3323642, -3.058395, 1, 0.3137255, 0, 1,
-1.642979, -0.009208549, -1.898153, 1, 0.3176471, 0, 1,
-1.630959, -0.3017246, -1.99355, 1, 0.3254902, 0, 1,
-1.629845, -0.08824637, -3.600551, 1, 0.3294118, 0, 1,
-1.624756, -0.8990056, -0.9436163, 1, 0.3372549, 0, 1,
-1.618375, -0.6412118, -3.323127, 1, 0.3411765, 0, 1,
-1.606816, 0.5108528, -1.683607, 1, 0.3490196, 0, 1,
-1.593214, -0.4846166, -2.814348, 1, 0.3529412, 0, 1,
-1.585136, -2.53064, -2.028455, 1, 0.3607843, 0, 1,
-1.584418, -2.437637, -2.86028, 1, 0.3647059, 0, 1,
-1.574063, -0.8344598, -2.004939, 1, 0.372549, 0, 1,
-1.572692, -0.22963, -2.569151, 1, 0.3764706, 0, 1,
-1.572248, -1.183477, -2.722692, 1, 0.3843137, 0, 1,
-1.563076, -0.7601582, -0.7368983, 1, 0.3882353, 0, 1,
-1.562402, 0.04298612, -3.556045, 1, 0.3960784, 0, 1,
-1.554148, 0.9108729, -1.746712, 1, 0.4039216, 0, 1,
-1.531116, -1.242053, -0.777175, 1, 0.4078431, 0, 1,
-1.527775, -0.2158134, -1.183705, 1, 0.4156863, 0, 1,
-1.515487, -0.2301665, -3.280598, 1, 0.4196078, 0, 1,
-1.511484, -1.360926, -2.039855, 1, 0.427451, 0, 1,
-1.510431, -2.287433, -1.567894, 1, 0.4313726, 0, 1,
-1.493094, -1.758883, -2.654536, 1, 0.4392157, 0, 1,
-1.49214, 1.22, -0.9628954, 1, 0.4431373, 0, 1,
-1.487383, 0.2045881, -0.919049, 1, 0.4509804, 0, 1,
-1.484599, 0.9385986, -1.642897, 1, 0.454902, 0, 1,
-1.471244, -0.4397076, -2.537849, 1, 0.4627451, 0, 1,
-1.46934, -0.9897804, -1.653785, 1, 0.4666667, 0, 1,
-1.468145, 0.07910479, -2.685203, 1, 0.4745098, 0, 1,
-1.456417, 1.136119, -0.8326828, 1, 0.4784314, 0, 1,
-1.450745, 0.07179449, -1.455128, 1, 0.4862745, 0, 1,
-1.444458, 0.6771589, -1.895397, 1, 0.4901961, 0, 1,
-1.435644, -0.371212, -3.696185, 1, 0.4980392, 0, 1,
-1.435274, 1.325031, -0.3910424, 1, 0.5058824, 0, 1,
-1.418066, -1.735242, -1.682207, 1, 0.509804, 0, 1,
-1.413097, -0.6154494, -2.149067, 1, 0.5176471, 0, 1,
-1.402467, 0.07102308, -1.952831, 1, 0.5215687, 0, 1,
-1.400598, 0.5224025, -4.019918, 1, 0.5294118, 0, 1,
-1.399219, 1.58742, -0.5751063, 1, 0.5333334, 0, 1,
-1.390037, -0.85816, -1.264038, 1, 0.5411765, 0, 1,
-1.381039, 1.080826, -1.45501, 1, 0.5450981, 0, 1,
-1.365252, -0.4514659, -1.882741, 1, 0.5529412, 0, 1,
-1.362965, 0.2838303, -1.07443, 1, 0.5568628, 0, 1,
-1.358202, -0.01498222, 0.7147191, 1, 0.5647059, 0, 1,
-1.356205, 0.5842517, 0.1797584, 1, 0.5686275, 0, 1,
-1.353494, -0.9812001, -1.146137, 1, 0.5764706, 0, 1,
-1.33383, 0.4536675, -2.089037, 1, 0.5803922, 0, 1,
-1.329041, -0.2295823, -1.11434, 1, 0.5882353, 0, 1,
-1.32428, 0.4337977, -0.4843646, 1, 0.5921569, 0, 1,
-1.307796, -1.369495, -1.154353, 1, 0.6, 0, 1,
-1.305067, 0.3587905, -0.3449445, 1, 0.6078432, 0, 1,
-1.297839, -0.8710637, -1.271611, 1, 0.6117647, 0, 1,
-1.277976, -0.3983325, -0.4108487, 1, 0.6196079, 0, 1,
-1.27544, -0.1483348, -1.537438, 1, 0.6235294, 0, 1,
-1.274423, 0.8377123, -2.120875, 1, 0.6313726, 0, 1,
-1.272652, 0.3157873, -1.858409, 1, 0.6352941, 0, 1,
-1.267846, -0.8032135, -1.626295, 1, 0.6431373, 0, 1,
-1.261384, -0.4373392, -0.4880393, 1, 0.6470588, 0, 1,
-1.261297, 0.2425414, -2.34863, 1, 0.654902, 0, 1,
-1.255472, -0.4039521, -2.248929, 1, 0.6588235, 0, 1,
-1.252962, -0.561475, -0.9468576, 1, 0.6666667, 0, 1,
-1.25069, 0.4149744, -1.661382, 1, 0.6705883, 0, 1,
-1.246629, 0.5705293, -0.3875722, 1, 0.6784314, 0, 1,
-1.214758, 0.2699708, -2.748613, 1, 0.682353, 0, 1,
-1.21418, -0.07746053, -1.304145, 1, 0.6901961, 0, 1,
-1.202895, 0.5764928, -1.437699, 1, 0.6941177, 0, 1,
-1.196933, -0.01510991, -1.054728, 1, 0.7019608, 0, 1,
-1.193641, -2.071482, -1.006357, 1, 0.7098039, 0, 1,
-1.186972, -0.4553392, -2.231176, 1, 0.7137255, 0, 1,
-1.181473, 0.4914888, -1.404671, 1, 0.7215686, 0, 1,
-1.17353, -1.719573, -1.38996, 1, 0.7254902, 0, 1,
-1.153927, 1.105649, -1.355691, 1, 0.7333333, 0, 1,
-1.150445, -1.367461, -2.504739, 1, 0.7372549, 0, 1,
-1.148898, 0.5545993, -0.7785931, 1, 0.7450981, 0, 1,
-1.145933, 0.7599326, -1.453778, 1, 0.7490196, 0, 1,
-1.14525, 0.2561521, -1.490051, 1, 0.7568628, 0, 1,
-1.134996, 1.317631, 0.9057532, 1, 0.7607843, 0, 1,
-1.131786, 2.020575, -0.3796083, 1, 0.7686275, 0, 1,
-1.129297, 1.73336, -1.748285, 1, 0.772549, 0, 1,
-1.126352, 0.5667552, -0.8118915, 1, 0.7803922, 0, 1,
-1.126305, 0.3406376, -2.05412, 1, 0.7843137, 0, 1,
-1.122809, -0.3558178, -1.885833, 1, 0.7921569, 0, 1,
-1.118688, 0.01725235, -3.435349, 1, 0.7960784, 0, 1,
-1.108945, 0.4172775, -0.7145216, 1, 0.8039216, 0, 1,
-1.10894, 1.570591, -1.116494, 1, 0.8117647, 0, 1,
-1.108591, -0.8348323, -3.158222, 1, 0.8156863, 0, 1,
-1.100862, 0.344054, -0.8182943, 1, 0.8235294, 0, 1,
-1.097079, 0.2272851, -0.3284112, 1, 0.827451, 0, 1,
-1.096825, 0.3326846, -1.862824, 1, 0.8352941, 0, 1,
-1.089878, 1.070286, 0.3891027, 1, 0.8392157, 0, 1,
-1.076787, 2.306978, -0.119069, 1, 0.8470588, 0, 1,
-1.075526, 0.5944515, -0.8470219, 1, 0.8509804, 0, 1,
-1.073053, 0.3258911, -2.042238, 1, 0.8588235, 0, 1,
-1.072743, 1.082255, -1.886987, 1, 0.8627451, 0, 1,
-1.071632, 0.2023969, -0.9500437, 1, 0.8705882, 0, 1,
-1.065417, -0.566668, -0.7101015, 1, 0.8745098, 0, 1,
-1.064831, -1.720103, -4.942464, 1, 0.8823529, 0, 1,
-1.057431, 2.195903, -0.3195077, 1, 0.8862745, 0, 1,
-1.05461, 0.1113405, -1.129743, 1, 0.8941177, 0, 1,
-1.048269, 0.8968632, -1.363057, 1, 0.8980392, 0, 1,
-1.046796, 0.2707722, -2.759302, 1, 0.9058824, 0, 1,
-1.046038, -2.148612, -2.596714, 1, 0.9137255, 0, 1,
-1.0428, 2.199222, -0.2388811, 1, 0.9176471, 0, 1,
-1.041933, 0.6786761, -1.083248, 1, 0.9254902, 0, 1,
-1.039891, -0.125588, -3.174781, 1, 0.9294118, 0, 1,
-1.035763, 0.7198741, -0.4660715, 1, 0.9372549, 0, 1,
-1.034972, 0.7086135, 0.6641409, 1, 0.9411765, 0, 1,
-1.032424, -0.3151057, -1.820576, 1, 0.9490196, 0, 1,
-1.03231, -1.750613, -1.108833, 1, 0.9529412, 0, 1,
-1.027635, -0.8794339, -1.055761, 1, 0.9607843, 0, 1,
-1.026019, 1.039032, -0.691045, 1, 0.9647059, 0, 1,
-1.023562, 0.06159068, -1.35012, 1, 0.972549, 0, 1,
-1.020466, 0.7098868, -0.2792653, 1, 0.9764706, 0, 1,
-1.013377, 0.2919756, -3.722956, 1, 0.9843137, 0, 1,
-1.011427, -0.4115588, -1.510164, 1, 0.9882353, 0, 1,
-1.011078, -0.2304885, -1.672982, 1, 0.9960784, 0, 1,
-1.010448, -0.2798691, -2.535858, 0.9960784, 1, 0, 1,
-1.009824, 0.07940122, -2.842257, 0.9921569, 1, 0, 1,
-1.007254, -0.8895301, -2.134494, 0.9843137, 1, 0, 1,
-1.006656, 0.197377, -1.913959, 0.9803922, 1, 0, 1,
-1.003074, 0.4614677, -0.499056, 0.972549, 1, 0, 1,
-0.9977336, -0.5425026, -1.941319, 0.9686275, 1, 0, 1,
-0.9935381, -0.3842586, -2.028764, 0.9607843, 1, 0, 1,
-0.9797198, 0.143044, -1.30814, 0.9568627, 1, 0, 1,
-0.9782799, -0.5552031, -1.545389, 0.9490196, 1, 0, 1,
-0.9774985, -0.4953299, -2.680549, 0.945098, 1, 0, 1,
-0.97404, -1.843875, -2.729916, 0.9372549, 1, 0, 1,
-0.9724288, 1.034954, -1.85769, 0.9333333, 1, 0, 1,
-0.9658611, 0.1014624, -1.99651, 0.9254902, 1, 0, 1,
-0.965674, 0.01974479, -0.8126981, 0.9215686, 1, 0, 1,
-0.964933, 0.8572094, -0.9522145, 0.9137255, 1, 0, 1,
-0.9646348, -1.875751, -2.248784, 0.9098039, 1, 0, 1,
-0.9643134, 1.274436, -2.659415, 0.9019608, 1, 0, 1,
-0.9553502, 1.671973, 1.700183, 0.8941177, 1, 0, 1,
-0.9391012, -0.5385201, -1.260313, 0.8901961, 1, 0, 1,
-0.9324768, -0.8029891, -2.578992, 0.8823529, 1, 0, 1,
-0.9323256, 1.150233, 0.4852941, 0.8784314, 1, 0, 1,
-0.9299575, -0.9238988, -4.710544, 0.8705882, 1, 0, 1,
-0.9260167, 0.8533727, -1.13639, 0.8666667, 1, 0, 1,
-0.9246097, 0.01471997, -3.809118, 0.8588235, 1, 0, 1,
-0.9221648, 1.171594, 0.3066942, 0.854902, 1, 0, 1,
-0.9210519, -0.5408992, -3.418197, 0.8470588, 1, 0, 1,
-0.9205114, -0.2817788, -2.561646, 0.8431373, 1, 0, 1,
-0.9165567, 1.129772, -0.5759867, 0.8352941, 1, 0, 1,
-0.9072145, -0.1095, -1.457225, 0.8313726, 1, 0, 1,
-0.9050613, -1.227562, -1.375158, 0.8235294, 1, 0, 1,
-0.9028943, 1.869036, -1.377357, 0.8196079, 1, 0, 1,
-0.8990917, 0.28299, -2.780358, 0.8117647, 1, 0, 1,
-0.8927597, 0.2006631, 0.3815746, 0.8078431, 1, 0, 1,
-0.8924944, -1.193177, -4.509097, 0.8, 1, 0, 1,
-0.8920276, -0.4632327, -1.463399, 0.7921569, 1, 0, 1,
-0.8889529, -0.4414004, -2.729499, 0.7882353, 1, 0, 1,
-0.8861573, -0.1090372, -2.702245, 0.7803922, 1, 0, 1,
-0.8857732, -0.5788267, -2.287081, 0.7764706, 1, 0, 1,
-0.8845479, -0.1342181, -1.963818, 0.7686275, 1, 0, 1,
-0.8812845, 0.257526, -1.780803, 0.7647059, 1, 0, 1,
-0.8637917, 0.3821507, -1.543137, 0.7568628, 1, 0, 1,
-0.8633941, 0.2210551, -1.67035, 0.7529412, 1, 0, 1,
-0.8618675, 0.9555579, 0.5346637, 0.7450981, 1, 0, 1,
-0.8569366, 0.4526419, -1.319923, 0.7411765, 1, 0, 1,
-0.8554263, 1.092633, -0.3179998, 0.7333333, 1, 0, 1,
-0.8547685, 0.52508, -2.664542, 0.7294118, 1, 0, 1,
-0.852461, 0.6998597, -1.131814, 0.7215686, 1, 0, 1,
-0.8460805, 1.3306, -0.8616599, 0.7176471, 1, 0, 1,
-0.8446437, 0.435422, 0.4280204, 0.7098039, 1, 0, 1,
-0.8412114, -1.511325, -3.351663, 0.7058824, 1, 0, 1,
-0.8376008, 0.4629301, -1.339524, 0.6980392, 1, 0, 1,
-0.8347067, -2.298545, -3.326488, 0.6901961, 1, 0, 1,
-0.8325739, 1.753358, 0.04041441, 0.6862745, 1, 0, 1,
-0.8283498, -0.5123491, -2.309234, 0.6784314, 1, 0, 1,
-0.8280258, -0.327749, -1.746687, 0.6745098, 1, 0, 1,
-0.825129, 0.2639681, -1.619742, 0.6666667, 1, 0, 1,
-0.8122926, 0.7908937, 0.4907826, 0.6627451, 1, 0, 1,
-0.8114361, -1.153083, -3.49114, 0.654902, 1, 0, 1,
-0.8107564, -0.5222645, -3.032769, 0.6509804, 1, 0, 1,
-0.7996431, 0.4106308, -0.944554, 0.6431373, 1, 0, 1,
-0.7979649, -0.3281781, -3.453214, 0.6392157, 1, 0, 1,
-0.790526, 1.23531, -0.5613205, 0.6313726, 1, 0, 1,
-0.7882502, -0.7311469, -2.28009, 0.627451, 1, 0, 1,
-0.7874541, -1.15848, -1.94293, 0.6196079, 1, 0, 1,
-0.7771355, -0.4809149, -2.519445, 0.6156863, 1, 0, 1,
-0.7721048, -1.017261, -2.817279, 0.6078432, 1, 0, 1,
-0.7673603, -0.4474822, -3.206725, 0.6039216, 1, 0, 1,
-0.7671943, -0.1558256, -2.473211, 0.5960785, 1, 0, 1,
-0.7660197, -0.3260336, -1.706236, 0.5882353, 1, 0, 1,
-0.7624381, 0.610904, -1.717277, 0.5843138, 1, 0, 1,
-0.7610525, -1.940636, -1.808139, 0.5764706, 1, 0, 1,
-0.7606055, -1.180648, -2.274236, 0.572549, 1, 0, 1,
-0.7528942, 0.1516336, -0.2961128, 0.5647059, 1, 0, 1,
-0.7517263, 1.325189, -0.5201427, 0.5607843, 1, 0, 1,
-0.7399853, 0.2502556, -1.253384, 0.5529412, 1, 0, 1,
-0.7382572, 0.9327124, -0.3001023, 0.5490196, 1, 0, 1,
-0.7352418, 2.278, -0.3458591, 0.5411765, 1, 0, 1,
-0.7348522, -1.078568, -2.313884, 0.5372549, 1, 0, 1,
-0.7287943, -1.536661, -2.239029, 0.5294118, 1, 0, 1,
-0.7230352, 0.8792434, -0.9062324, 0.5254902, 1, 0, 1,
-0.7226208, 0.9298222, -0.8713655, 0.5176471, 1, 0, 1,
-0.718403, -0.971517, -2.378588, 0.5137255, 1, 0, 1,
-0.7179123, -0.1800457, -1.89965, 0.5058824, 1, 0, 1,
-0.717559, -0.9682004, -1.823547, 0.5019608, 1, 0, 1,
-0.7095926, 0.4079225, -1.735375, 0.4941176, 1, 0, 1,
-0.7074027, -2.634772, -2.812717, 0.4862745, 1, 0, 1,
-0.7062249, -0.08762653, -1.350951, 0.4823529, 1, 0, 1,
-0.7054885, -0.8669646, -0.02682753, 0.4745098, 1, 0, 1,
-0.7040481, 0.4229074, 0.04274227, 0.4705882, 1, 0, 1,
-0.693555, -0.7062256, -2.926423, 0.4627451, 1, 0, 1,
-0.6917402, -0.190349, -0.5340668, 0.4588235, 1, 0, 1,
-0.6900254, -0.4436921, -2.000273, 0.4509804, 1, 0, 1,
-0.689391, -0.9603286, -3.697937, 0.4470588, 1, 0, 1,
-0.6856822, -0.66742, -2.986032, 0.4392157, 1, 0, 1,
-0.6837506, 0.2455483, -2.932151, 0.4352941, 1, 0, 1,
-0.6816948, 0.4812809, -1.421725, 0.427451, 1, 0, 1,
-0.6708212, -1.052235, -3.338757, 0.4235294, 1, 0, 1,
-0.669672, 1.011719, -0.4187816, 0.4156863, 1, 0, 1,
-0.6565547, 0.9947947, 0.7683561, 0.4117647, 1, 0, 1,
-0.6527632, -1.529979, -2.836125, 0.4039216, 1, 0, 1,
-0.6512128, -0.3322746, -3.383099, 0.3960784, 1, 0, 1,
-0.6474681, 1.942297, -0.4837722, 0.3921569, 1, 0, 1,
-0.643357, -1.315623, -1.572599, 0.3843137, 1, 0, 1,
-0.6375337, -0.2874351, -1.508007, 0.3803922, 1, 0, 1,
-0.6373745, -0.2452633, -2.533914, 0.372549, 1, 0, 1,
-0.6317831, -0.7474632, -1.56601, 0.3686275, 1, 0, 1,
-0.625037, -1.080771, -3.026939, 0.3607843, 1, 0, 1,
-0.6245876, -0.7228332, -3.484407, 0.3568628, 1, 0, 1,
-0.6241232, 1.131038, -1.59399, 0.3490196, 1, 0, 1,
-0.6227874, -0.03574799, -2.550828, 0.345098, 1, 0, 1,
-0.6098159, 0.4032949, -1.218212, 0.3372549, 1, 0, 1,
-0.6033438, -0.3487019, -2.436231, 0.3333333, 1, 0, 1,
-0.6011634, -0.5051964, -2.316389, 0.3254902, 1, 0, 1,
-0.5939744, 0.7825146, -2.330472, 0.3215686, 1, 0, 1,
-0.5932717, -0.02414439, -0.7130452, 0.3137255, 1, 0, 1,
-0.5899765, 1.234586, 1.228406, 0.3098039, 1, 0, 1,
-0.5862229, -0.9635305, -3.584382, 0.3019608, 1, 0, 1,
-0.5844961, -0.5741, -2.177972, 0.2941177, 1, 0, 1,
-0.583132, 0.779255, 2.01796, 0.2901961, 1, 0, 1,
-0.5795728, 0.08028451, -0.9148357, 0.282353, 1, 0, 1,
-0.575725, 0.306177, -0.1758247, 0.2784314, 1, 0, 1,
-0.5756544, 0.4555627, -0.4193484, 0.2705882, 1, 0, 1,
-0.5720465, 0.2336873, -1.911133, 0.2666667, 1, 0, 1,
-0.5689958, -0.8733059, -2.596425, 0.2588235, 1, 0, 1,
-0.5636977, 0.1300338, -2.504369, 0.254902, 1, 0, 1,
-0.5623339, -0.4521534, -1.491533, 0.2470588, 1, 0, 1,
-0.5542143, -0.4603883, -3.940496, 0.2431373, 1, 0, 1,
-0.5486628, -1.476996, -1.902103, 0.2352941, 1, 0, 1,
-0.5437893, 0.2781256, -1.300006, 0.2313726, 1, 0, 1,
-0.5427698, -0.9900797, -3.846428, 0.2235294, 1, 0, 1,
-0.5393049, -1.148612, -2.334612, 0.2196078, 1, 0, 1,
-0.5392272, -0.6877472, -2.29597, 0.2117647, 1, 0, 1,
-0.5383917, -0.1489083, -2.541424, 0.2078431, 1, 0, 1,
-0.5319458, -0.2264162, -3.109818, 0.2, 1, 0, 1,
-0.531704, 1.850285, -0.007388021, 0.1921569, 1, 0, 1,
-0.5302122, 0.7156079, -0.2403681, 0.1882353, 1, 0, 1,
-0.5272341, 1.335553, 0.8837726, 0.1803922, 1, 0, 1,
-0.5236275, 1.147525, -0.9355081, 0.1764706, 1, 0, 1,
-0.522544, 0.4477009, 0.03047032, 0.1686275, 1, 0, 1,
-0.5139828, 0.1271946, -0.7708403, 0.1647059, 1, 0, 1,
-0.5132152, 2.13712, -0.149829, 0.1568628, 1, 0, 1,
-0.5130374, 0.5847011, -0.875157, 0.1529412, 1, 0, 1,
-0.5103207, -0.7580082, -2.458785, 0.145098, 1, 0, 1,
-0.5074776, 1.013868, -0.1972044, 0.1411765, 1, 0, 1,
-0.5064849, 1.941312, -0.5377983, 0.1333333, 1, 0, 1,
-0.5046655, 1.139139, 1.209483, 0.1294118, 1, 0, 1,
-0.5046189, 0.03248883, -1.626421, 0.1215686, 1, 0, 1,
-0.5033126, 0.8530984, -0.3494418, 0.1176471, 1, 0, 1,
-0.5028691, 1.438848, 1.50761, 0.1098039, 1, 0, 1,
-0.5006186, 0.638317, -2.288376, 0.1058824, 1, 0, 1,
-0.4980673, 1.355284, -0.713788, 0.09803922, 1, 0, 1,
-0.4944423, 1.548657, -0.4741606, 0.09019608, 1, 0, 1,
-0.4940966, 1.304314, -0.4224278, 0.08627451, 1, 0, 1,
-0.4916995, 0.2452722, -1.976203, 0.07843138, 1, 0, 1,
-0.4906007, -0.9474421, -2.630546, 0.07450981, 1, 0, 1,
-0.4874312, -1.351206, -3.160299, 0.06666667, 1, 0, 1,
-0.4862618, -0.589373, -2.552011, 0.0627451, 1, 0, 1,
-0.4824269, -1.063377, -2.879882, 0.05490196, 1, 0, 1,
-0.4725972, -0.2753086, -2.812708, 0.05098039, 1, 0, 1,
-0.472497, -0.2008611, -2.872895, 0.04313726, 1, 0, 1,
-0.4682805, 1.868883, 0.504935, 0.03921569, 1, 0, 1,
-0.4677601, -0.9109185, -2.841932, 0.03137255, 1, 0, 1,
-0.4672556, -1.29605, -3.144448, 0.02745098, 1, 0, 1,
-0.4661509, -0.7838696, -3.39263, 0.01960784, 1, 0, 1,
-0.4636202, 0.6388461, -1.318883, 0.01568628, 1, 0, 1,
-0.45396, 1.01858, -0.5913057, 0.007843138, 1, 0, 1,
-0.4497245, -0.5104625, -2.707501, 0.003921569, 1, 0, 1,
-0.4475944, -0.6118562, -1.875398, 0, 1, 0.003921569, 1,
-0.4470977, 0.3460664, -1.170536, 0, 1, 0.01176471, 1,
-0.4442152, 0.49474, 0.1525136, 0, 1, 0.01568628, 1,
-0.4423787, -3.200773, -2.991129, 0, 1, 0.02352941, 1,
-0.441591, -0.2602728, -0.07528637, 0, 1, 0.02745098, 1,
-0.4401978, -0.7804528, -3.077165, 0, 1, 0.03529412, 1,
-0.4357767, -1.629416, -1.9432, 0, 1, 0.03921569, 1,
-0.4351566, -0.485199, -1.31264, 0, 1, 0.04705882, 1,
-0.4322352, -0.8918409, -1.603345, 0, 1, 0.05098039, 1,
-0.4320461, -0.1990244, -1.698939, 0, 1, 0.05882353, 1,
-0.4306901, 1.324005, -0.2991066, 0, 1, 0.0627451, 1,
-0.4279675, -0.4114055, -1.901236, 0, 1, 0.07058824, 1,
-0.4263343, -1.821822, -2.650289, 0, 1, 0.07450981, 1,
-0.4219618, -1.434997, -2.359505, 0, 1, 0.08235294, 1,
-0.4194512, 0.04645642, -1.553608, 0, 1, 0.08627451, 1,
-0.4187101, -1.496641, -3.309513, 0, 1, 0.09411765, 1,
-0.4169948, -0.6574243, -3.538231, 0, 1, 0.1019608, 1,
-0.4149199, -0.3453663, -1.149264, 0, 1, 0.1058824, 1,
-0.4141316, -1.892903, -5.005792, 0, 1, 0.1137255, 1,
-0.4106868, 1.81344, -1.037243, 0, 1, 0.1176471, 1,
-0.41004, 1.096664, 0.4711846, 0, 1, 0.1254902, 1,
-0.4023866, -0.04858611, -2.044786, 0, 1, 0.1294118, 1,
-0.3993604, 0.1546858, 0.4171014, 0, 1, 0.1372549, 1,
-0.3990763, 1.491262, 0.2961727, 0, 1, 0.1411765, 1,
-0.3916081, 0.1707775, -0.1132222, 0, 1, 0.1490196, 1,
-0.3893698, 0.0639724, -2.276975, 0, 1, 0.1529412, 1,
-0.3888327, -0.2356551, -3.717295, 0, 1, 0.1607843, 1,
-0.3820035, 1.140221, -0.2072615, 0, 1, 0.1647059, 1,
-0.3639779, -1.62304, -4.172077, 0, 1, 0.172549, 1,
-0.3539906, -0.7743998, -2.991739, 0, 1, 0.1764706, 1,
-0.3489875, 1.035261, -1.723549, 0, 1, 0.1843137, 1,
-0.3486186, -1.18095, -3.057213, 0, 1, 0.1882353, 1,
-0.3468398, 0.6750141, -0.5467851, 0, 1, 0.1960784, 1,
-0.3456801, 0.5119197, 1.98552, 0, 1, 0.2039216, 1,
-0.3453724, -0.741612, -2.842956, 0, 1, 0.2078431, 1,
-0.3451685, 0.2425711, 0.2059222, 0, 1, 0.2156863, 1,
-0.3396896, 0.2627731, 1.2758, 0, 1, 0.2196078, 1,
-0.336966, 0.4350965, -0.03563129, 0, 1, 0.227451, 1,
-0.3342194, -0.4291023, -1.782344, 0, 1, 0.2313726, 1,
-0.333451, 0.6334693, -0.8814322, 0, 1, 0.2392157, 1,
-0.3236641, 1.871429, -1.037423, 0, 1, 0.2431373, 1,
-0.3189086, 0.4233656, 0.07852637, 0, 1, 0.2509804, 1,
-0.313828, -0.01540551, -1.81728, 0, 1, 0.254902, 1,
-0.3137471, -0.5714129, -3.521345, 0, 1, 0.2627451, 1,
-0.313026, -1.047084, -2.225486, 0, 1, 0.2666667, 1,
-0.3057145, -0.8987889, -1.723901, 0, 1, 0.2745098, 1,
-0.3030743, -1.269377, -3.70854, 0, 1, 0.2784314, 1,
-0.2874449, 0.4944482, -0.9427184, 0, 1, 0.2862745, 1,
-0.2797948, 1.198375, -0.5617604, 0, 1, 0.2901961, 1,
-0.2744297, 0.2604876, -0.7365448, 0, 1, 0.2980392, 1,
-0.2717852, -0.6027738, -3.900199, 0, 1, 0.3058824, 1,
-0.2649302, -0.6415146, -2.943092, 0, 1, 0.3098039, 1,
-0.2641585, 1.339385, -0.4620787, 0, 1, 0.3176471, 1,
-0.2636293, 0.0526332, -1.249261, 0, 1, 0.3215686, 1,
-0.2610984, -0.8251204, -1.585772, 0, 1, 0.3294118, 1,
-0.2597751, -0.1535486, -0.7646531, 0, 1, 0.3333333, 1,
-0.2579818, -0.9087621, -1.593477, 0, 1, 0.3411765, 1,
-0.2544002, 1.051731, -1.189979, 0, 1, 0.345098, 1,
-0.253491, -1.951725, -3.144309, 0, 1, 0.3529412, 1,
-0.2534472, 0.7461624, 0.1330141, 0, 1, 0.3568628, 1,
-0.2524655, -0.5172388, -2.688132, 0, 1, 0.3647059, 1,
-0.2500202, 0.3965636, 0.1209802, 0, 1, 0.3686275, 1,
-0.2428795, 1.354411, 0.4016082, 0, 1, 0.3764706, 1,
-0.2426292, 0.2204313, -2.752666, 0, 1, 0.3803922, 1,
-0.2410699, 1.925567, 0.7837381, 0, 1, 0.3882353, 1,
-0.2404674, -1.356871, -2.937964, 0, 1, 0.3921569, 1,
-0.2392132, -1.369004, -2.196824, 0, 1, 0.4, 1,
-0.2371493, 1.247512, 0.3454532, 0, 1, 0.4078431, 1,
-0.2344587, 0.5233225, -0.1697147, 0, 1, 0.4117647, 1,
-0.232536, -0.1853106, -3.038302, 0, 1, 0.4196078, 1,
-0.2297638, -0.2409637, -2.696054, 0, 1, 0.4235294, 1,
-0.2236119, -0.7604094, -2.951838, 0, 1, 0.4313726, 1,
-0.2174652, -0.4471035, -3.548349, 0, 1, 0.4352941, 1,
-0.2153215, 0.3243144, 1.18778, 0, 1, 0.4431373, 1,
-0.2151666, -0.08468629, -1.56905, 0, 1, 0.4470588, 1,
-0.2135504, -0.9392678, -2.542998, 0, 1, 0.454902, 1,
-0.2134564, 1.14283, 0.2744757, 0, 1, 0.4588235, 1,
-0.2112698, 0.4939027, 0.4490341, 0, 1, 0.4666667, 1,
-0.2080821, 0.4032805, -0.612427, 0, 1, 0.4705882, 1,
-0.2067598, 0.2162659, 0.9574618, 0, 1, 0.4784314, 1,
-0.2029129, 0.9795119, -0.4994345, 0, 1, 0.4823529, 1,
-0.198395, 1.30735, 0.2418291, 0, 1, 0.4901961, 1,
-0.1981151, 1.291766, 0.2099694, 0, 1, 0.4941176, 1,
-0.1950971, 1.269313, -2.443726, 0, 1, 0.5019608, 1,
-0.1921443, -0.7312477, -2.932914, 0, 1, 0.509804, 1,
-0.1907273, 0.3143866, -1.212532, 0, 1, 0.5137255, 1,
-0.186889, -0.4127632, -3.467962, 0, 1, 0.5215687, 1,
-0.1863445, -0.4928934, -2.588929, 0, 1, 0.5254902, 1,
-0.1855385, -1.036023, -2.764781, 0, 1, 0.5333334, 1,
-0.1849623, -0.6555836, -2.31473, 0, 1, 0.5372549, 1,
-0.1824434, 0.1447213, -0.8227456, 0, 1, 0.5450981, 1,
-0.1820804, 0.585654, -0.3912251, 0, 1, 0.5490196, 1,
-0.1806796, 0.7283362, 0.5913454, 0, 1, 0.5568628, 1,
-0.1758286, 0.7003261, -0.3223038, 0, 1, 0.5607843, 1,
-0.1718987, -0.1143819, -3.929791, 0, 1, 0.5686275, 1,
-0.1691968, -0.8752027, -2.552761, 0, 1, 0.572549, 1,
-0.1675698, -1.345153, -2.969192, 0, 1, 0.5803922, 1,
-0.1660366, 1.366541, -0.9120154, 0, 1, 0.5843138, 1,
-0.1657475, -1.421456, -3.936309, 0, 1, 0.5921569, 1,
-0.1657153, -1.394417, -2.501818, 0, 1, 0.5960785, 1,
-0.1626464, -0.2586112, -1.636826, 0, 1, 0.6039216, 1,
-0.1624194, 1.09173, 0.4104987, 0, 1, 0.6117647, 1,
-0.1623701, 0.5581599, 0.8710059, 0, 1, 0.6156863, 1,
-0.1606519, -1.380105, -4.487978, 0, 1, 0.6235294, 1,
-0.1602418, -0.1401867, -1.905272, 0, 1, 0.627451, 1,
-0.1570739, -0.304763, -3.772797, 0, 1, 0.6352941, 1,
-0.1569006, 0.3349312, 0.3527801, 0, 1, 0.6392157, 1,
-0.1563326, 1.506209, -0.9217322, 0, 1, 0.6470588, 1,
-0.1516587, 0.4664575, -1.052874, 0, 1, 0.6509804, 1,
-0.1486977, 0.4919258, -0.7040492, 0, 1, 0.6588235, 1,
-0.1485212, 0.2563649, -0.6821907, 0, 1, 0.6627451, 1,
-0.146684, 0.3466734, -0.7692209, 0, 1, 0.6705883, 1,
-0.1412231, -0.9826087, -2.402271, 0, 1, 0.6745098, 1,
-0.136231, -0.3032037, -3.913916, 0, 1, 0.682353, 1,
-0.1349863, 0.9092519, 0.7119773, 0, 1, 0.6862745, 1,
-0.1305035, -0.1248362, -2.371205, 0, 1, 0.6941177, 1,
-0.1284637, -1.550565, -4.306302, 0, 1, 0.7019608, 1,
-0.1231887, 0.2780035, -2.797295, 0, 1, 0.7058824, 1,
-0.1224786, -1.108117, -2.411207, 0, 1, 0.7137255, 1,
-0.1220652, 0.5638867, -0.7521783, 0, 1, 0.7176471, 1,
-0.1216418, -0.1285751, -4.094317, 0, 1, 0.7254902, 1,
-0.1203984, -0.1577002, -0.9062098, 0, 1, 0.7294118, 1,
-0.1146418, 1.749057, -0.3644581, 0, 1, 0.7372549, 1,
-0.1119152, 0.9630709, -0.9606895, 0, 1, 0.7411765, 1,
-0.1118326, 0.3056223, -0.5760712, 0, 1, 0.7490196, 1,
-0.1111673, -0.2035704, -1.888646, 0, 1, 0.7529412, 1,
-0.1092101, -0.9359031, -3.207618, 0, 1, 0.7607843, 1,
-0.1066024, 1.107589, 0.3569902, 0, 1, 0.7647059, 1,
-0.1029641, 0.1326786, 0.5281096, 0, 1, 0.772549, 1,
-0.09714202, -1.296407, -2.234247, 0, 1, 0.7764706, 1,
-0.09657322, -1.400562, -2.741981, 0, 1, 0.7843137, 1,
-0.09253812, 0.5397323, -0.217306, 0, 1, 0.7882353, 1,
-0.0921222, -1.538386, -2.20719, 0, 1, 0.7960784, 1,
-0.09179248, -1.677231, -3.434765, 0, 1, 0.8039216, 1,
-0.09154712, 1.155047, -1.399492, 0, 1, 0.8078431, 1,
-0.09080454, -0.3906895, -3.742676, 0, 1, 0.8156863, 1,
-0.08973932, -0.7593026, -3.923466, 0, 1, 0.8196079, 1,
-0.08868301, 0.850933, 2.216114, 0, 1, 0.827451, 1,
-0.08780923, -0.7819512, -4.43976, 0, 1, 0.8313726, 1,
-0.08626367, -0.6972482, -4.91998, 0, 1, 0.8392157, 1,
-0.0800305, 0.1271019, -0.848339, 0, 1, 0.8431373, 1,
-0.07974944, -0.4970249, -1.586962, 0, 1, 0.8509804, 1,
-0.07910921, 1.617357, 0.2536306, 0, 1, 0.854902, 1,
-0.07840917, 0.3048229, 0.08416199, 0, 1, 0.8627451, 1,
-0.07500585, -0.5087942, -3.504008, 0, 1, 0.8666667, 1,
-0.06934649, -1.347013, -2.117398, 0, 1, 0.8745098, 1,
-0.06353071, 0.5430505, 0.789005, 0, 1, 0.8784314, 1,
-0.06217954, 0.6351575, 0.4320832, 0, 1, 0.8862745, 1,
-0.05741797, -0.1983606, -1.617442, 0, 1, 0.8901961, 1,
-0.0565139, 0.3126358, 0.7108263, 0, 1, 0.8980392, 1,
-0.05637121, -2.188755, -2.578957, 0, 1, 0.9058824, 1,
-0.055687, -1.681732, -2.572741, 0, 1, 0.9098039, 1,
-0.05378374, 0.04237908, -1.103577, 0, 1, 0.9176471, 1,
-0.05085599, -0.07421893, -1.753973, 0, 1, 0.9215686, 1,
-0.04900207, 1.737847, -1.884568, 0, 1, 0.9294118, 1,
-0.04720275, 0.9731024, 0.7010397, 0, 1, 0.9333333, 1,
-0.04602567, 0.3291836, -0.5360918, 0, 1, 0.9411765, 1,
-0.04339591, -1.537496, -3.475812, 0, 1, 0.945098, 1,
-0.04338705, -1.088905, -2.858093, 0, 1, 0.9529412, 1,
-0.04089779, -0.567462, -0.9683978, 0, 1, 0.9568627, 1,
-0.037935, -2.188401, -2.153904, 0, 1, 0.9647059, 1,
-0.03745923, -1.323813, -4.307341, 0, 1, 0.9686275, 1,
-0.03545053, 2.064245, -1.364233, 0, 1, 0.9764706, 1,
-0.03255149, 1.754659, -0.9830161, 0, 1, 0.9803922, 1,
-0.02668957, 0.02495532, -1.037663, 0, 1, 0.9882353, 1,
-0.02598707, 0.05519032, -0.3411596, 0, 1, 0.9921569, 1,
-0.02357452, -1.657614, -3.255111, 0, 1, 1, 1,
-0.02176166, 0.8443013, -0.3842109, 0, 0.9921569, 1, 1,
-0.0213289, -0.8158827, -2.541488, 0, 0.9882353, 1, 1,
-0.01972993, -1.755763, -4.285166, 0, 0.9803922, 1, 1,
-0.01632597, -0.2904662, -0.9741495, 0, 0.9764706, 1, 1,
-0.007590282, -0.883256, -3.974884, 0, 0.9686275, 1, 1,
-0.00667062, -0.294857, 0.5682687, 0, 0.9647059, 1, 1,
0.001283875, 0.4746335, -0.2003513, 0, 0.9568627, 1, 1,
0.001486132, -0.1089657, 3.356247, 0, 0.9529412, 1, 1,
0.004237042, -0.4797625, 3.621759, 0, 0.945098, 1, 1,
0.005739176, -0.7628964, 2.571009, 0, 0.9411765, 1, 1,
0.006121184, 1.365442, 1.513552, 0, 0.9333333, 1, 1,
0.01091194, 0.371812, -0.5341977, 0, 0.9294118, 1, 1,
0.01177143, 0.1934288, 0.5485777, 0, 0.9215686, 1, 1,
0.01672146, -1.797272, 2.74324, 0, 0.9176471, 1, 1,
0.01677897, -1.068706, 3.86265, 0, 0.9098039, 1, 1,
0.01871614, 0.2892537, -0.2843059, 0, 0.9058824, 1, 1,
0.02494979, 0.4855823, 0.8725557, 0, 0.8980392, 1, 1,
0.02531314, 1.233291, -0.7259479, 0, 0.8901961, 1, 1,
0.02850955, 0.3781083, -0.7800518, 0, 0.8862745, 1, 1,
0.03154646, -0.3874297, 1.931717, 0, 0.8784314, 1, 1,
0.03383149, -0.6462423, 3.215355, 0, 0.8745098, 1, 1,
0.03497155, 0.7634367, 1.859887, 0, 0.8666667, 1, 1,
0.03682902, 0.2712511, -1.716024, 0, 0.8627451, 1, 1,
0.03767511, 0.320687, -1.151462, 0, 0.854902, 1, 1,
0.03889732, 1.036276, -0.4586287, 0, 0.8509804, 1, 1,
0.0398538, -0.5986754, 2.431967, 0, 0.8431373, 1, 1,
0.04313638, -0.2514635, 2.13939, 0, 0.8392157, 1, 1,
0.0431527, 0.06808668, 0.7143088, 0, 0.8313726, 1, 1,
0.04423014, 0.3064052, 2.008803, 0, 0.827451, 1, 1,
0.04754353, 0.8875974, 0.4968917, 0, 0.8196079, 1, 1,
0.04850362, 0.1172814, 1.474644, 0, 0.8156863, 1, 1,
0.0597564, 0.03308083, 1.336705, 0, 0.8078431, 1, 1,
0.05995214, -1.014947, 3.374238, 0, 0.8039216, 1, 1,
0.0599659, -0.3647627, 4.62148, 0, 0.7960784, 1, 1,
0.06081631, -0.0861899, 4.561722, 0, 0.7882353, 1, 1,
0.06142696, -0.6541128, 2.960763, 0, 0.7843137, 1, 1,
0.06521253, 0.265586, 0.4562356, 0, 0.7764706, 1, 1,
0.06604794, -0.05523069, 1.816954, 0, 0.772549, 1, 1,
0.07052904, 0.7523277, -0.3710821, 0, 0.7647059, 1, 1,
0.07484183, -0.03229987, 2.09925, 0, 0.7607843, 1, 1,
0.07489715, 1.201532, -2.098908, 0, 0.7529412, 1, 1,
0.07743327, -0.8497223, 4.313529, 0, 0.7490196, 1, 1,
0.07950105, 1.225389, 1.313286, 0, 0.7411765, 1, 1,
0.08111943, -0.9281649, 4.80929, 0, 0.7372549, 1, 1,
0.0845201, 0.7460753, 1.03164, 0, 0.7294118, 1, 1,
0.08692188, -1.003533, 3.909823, 0, 0.7254902, 1, 1,
0.09078255, 1.96842, -0.5733266, 0, 0.7176471, 1, 1,
0.09133378, -1.206595, 2.972013, 0, 0.7137255, 1, 1,
0.09220546, -2.604174, 3.004385, 0, 0.7058824, 1, 1,
0.09267504, -2.04153, 3.029099, 0, 0.6980392, 1, 1,
0.09441046, -0.2924852, 1.504503, 0, 0.6941177, 1, 1,
0.09798721, -0.1888732, 1.546646, 0, 0.6862745, 1, 1,
0.1005718, -0.4932216, 4.138205, 0, 0.682353, 1, 1,
0.108809, -0.09496613, 1.688182, 0, 0.6745098, 1, 1,
0.1095903, 0.4337636, -0.8632028, 0, 0.6705883, 1, 1,
0.1118762, -0.378311, 1.472893, 0, 0.6627451, 1, 1,
0.1262797, 0.664916, 0.06264692, 0, 0.6588235, 1, 1,
0.1266073, -0.4861448, 2.907062, 0, 0.6509804, 1, 1,
0.1328564, -1.827023, 3.275423, 0, 0.6470588, 1, 1,
0.1364458, -0.9106253, 2.634892, 0, 0.6392157, 1, 1,
0.1388385, -1.443729, 3.814311, 0, 0.6352941, 1, 1,
0.1395302, -0.08394926, 0.5283329, 0, 0.627451, 1, 1,
0.1397666, 0.01396399, 1.654136, 0, 0.6235294, 1, 1,
0.1398837, -3.140406, 2.461819, 0, 0.6156863, 1, 1,
0.1410704, 0.08127213, 0.3169371, 0, 0.6117647, 1, 1,
0.1430071, 0.6426546, 0.6791703, 0, 0.6039216, 1, 1,
0.1449953, 0.4728495, 1.048827, 0, 0.5960785, 1, 1,
0.1481784, -1.262581, 1.751701, 0, 0.5921569, 1, 1,
0.1521626, 0.7419949, 0.1678532, 0, 0.5843138, 1, 1,
0.157159, -0.7937837, 3.702635, 0, 0.5803922, 1, 1,
0.1598584, 0.6644759, 2.050994, 0, 0.572549, 1, 1,
0.1606936, -0.0970953, 3.679942, 0, 0.5686275, 1, 1,
0.1631376, -1.716692, 3.098961, 0, 0.5607843, 1, 1,
0.166602, -0.3099805, 3.391375, 0, 0.5568628, 1, 1,
0.1684851, -0.4941944, 0.7296556, 0, 0.5490196, 1, 1,
0.168731, 0.5687978, 0.2861375, 0, 0.5450981, 1, 1,
0.1732769, -0.6478729, 2.961434, 0, 0.5372549, 1, 1,
0.1764436, 1.039403, -2.421663, 0, 0.5333334, 1, 1,
0.1770008, -0.09280951, 1.878662, 0, 0.5254902, 1, 1,
0.1797209, -0.4423311, 1.966544, 0, 0.5215687, 1, 1,
0.1855478, 0.6209134, 0.1330708, 0, 0.5137255, 1, 1,
0.1858478, -1.582596, 2.17101, 0, 0.509804, 1, 1,
0.1890897, -0.3094619, 1.370343, 0, 0.5019608, 1, 1,
0.1899887, -0.4964373, 1.009725, 0, 0.4941176, 1, 1,
0.1909662, -1.714375, 2.55772, 0, 0.4901961, 1, 1,
0.1937678, 1.255875, -1.498536, 0, 0.4823529, 1, 1,
0.197979, -1.932509, 3.226733, 0, 0.4784314, 1, 1,
0.2006176, -0.149679, 4.852025, 0, 0.4705882, 1, 1,
0.202108, -1.52349, 2.335152, 0, 0.4666667, 1, 1,
0.2038363, -0.4118478, 3.725957, 0, 0.4588235, 1, 1,
0.2100759, 1.092848, -1.366182, 0, 0.454902, 1, 1,
0.2108747, -1.253321, 2.585138, 0, 0.4470588, 1, 1,
0.214592, -0.161834, 2.895983, 0, 0.4431373, 1, 1,
0.2157909, -0.1459159, 2.056001, 0, 0.4352941, 1, 1,
0.2163653, -0.5750023, 3.420131, 0, 0.4313726, 1, 1,
0.2174822, 0.7396529, -0.7084267, 0, 0.4235294, 1, 1,
0.2239454, 0.1792677, 0.6198736, 0, 0.4196078, 1, 1,
0.2246369, 1.4831, 0.7589518, 0, 0.4117647, 1, 1,
0.2255995, 0.7510424, -1.097783, 0, 0.4078431, 1, 1,
0.2270731, 1.098793, 1.324587, 0, 0.4, 1, 1,
0.2271792, 1.159878, -0.928463, 0, 0.3921569, 1, 1,
0.227341, 1.075789, 0.3924135, 0, 0.3882353, 1, 1,
0.2275009, -0.7326918, 4.0699, 0, 0.3803922, 1, 1,
0.228004, 0.9152934, 0.4419389, 0, 0.3764706, 1, 1,
0.2348481, -1.044514, 3.153569, 0, 0.3686275, 1, 1,
0.2355924, 0.2541481, 0.8036614, 0, 0.3647059, 1, 1,
0.2364281, -2.156194, 4.160714, 0, 0.3568628, 1, 1,
0.2396491, -1.104815, 2.910868, 0, 0.3529412, 1, 1,
0.2434352, 1.20685, -0.04262457, 0, 0.345098, 1, 1,
0.2435836, -0.4156871, 2.305168, 0, 0.3411765, 1, 1,
0.2444706, -1.00967, 2.46775, 0, 0.3333333, 1, 1,
0.2471076, -1.158741, 4.468645, 0, 0.3294118, 1, 1,
0.2482793, 0.01095078, -0.03924847, 0, 0.3215686, 1, 1,
0.2487362, 2.956624, 0.08054654, 0, 0.3176471, 1, 1,
0.2491046, 0.4939237, -0.187583, 0, 0.3098039, 1, 1,
0.2587964, -0.1945646, 3.987526, 0, 0.3058824, 1, 1,
0.2659464, -0.5344738, 3.082122, 0, 0.2980392, 1, 1,
0.2730502, 0.4660283, -0.351243, 0, 0.2901961, 1, 1,
0.2764785, -2.831417, 1.414211, 0, 0.2862745, 1, 1,
0.2815411, 0.456752, 0.7602592, 0, 0.2784314, 1, 1,
0.2846922, 0.2237449, 4.952057, 0, 0.2745098, 1, 1,
0.2851115, -0.5452604, 2.855638, 0, 0.2666667, 1, 1,
0.2852766, -0.6002318, 0.2657434, 0, 0.2627451, 1, 1,
0.2885801, 0.05079623, 0.4011536, 0, 0.254902, 1, 1,
0.303853, -0.8459426, 2.962101, 0, 0.2509804, 1, 1,
0.307578, -1.631493, 3.419566, 0, 0.2431373, 1, 1,
0.3099509, 0.7437729, -1.173729, 0, 0.2392157, 1, 1,
0.3105823, -1.076324, 3.062464, 0, 0.2313726, 1, 1,
0.3117274, 0.9304602, -0.4875662, 0, 0.227451, 1, 1,
0.3122256, 0.979084, 0.3892606, 0, 0.2196078, 1, 1,
0.3150638, 0.03916057, 2.082145, 0, 0.2156863, 1, 1,
0.3157997, 0.1803428, -0.6890255, 0, 0.2078431, 1, 1,
0.3165721, 0.8024104, 1.212197, 0, 0.2039216, 1, 1,
0.3304134, -0.3153293, 1.121217, 0, 0.1960784, 1, 1,
0.3311332, -0.8044527, 4.729032, 0, 0.1882353, 1, 1,
0.3391339, -0.3060202, 0.02703724, 0, 0.1843137, 1, 1,
0.3392344, -0.9272844, 2.9858, 0, 0.1764706, 1, 1,
0.3409624, -0.2720598, 3.002017, 0, 0.172549, 1, 1,
0.3428135, -2.08636, 2.144588, 0, 0.1647059, 1, 1,
0.3475706, -1.129309, 3.220343, 0, 0.1607843, 1, 1,
0.3484296, 1.299309, 0.1514899, 0, 0.1529412, 1, 1,
0.3492874, -0.5014123, 3.295861, 0, 0.1490196, 1, 1,
0.3494376, 1.448495, 0.1956505, 0, 0.1411765, 1, 1,
0.3523429, 1.127011, -0.7415007, 0, 0.1372549, 1, 1,
0.3532778, -0.5892452, 2.198102, 0, 0.1294118, 1, 1,
0.3571564, 1.241696, 0.01339742, 0, 0.1254902, 1, 1,
0.3592532, 1.662884, 1.757374, 0, 0.1176471, 1, 1,
0.3611197, 0.6877294, -0.3926384, 0, 0.1137255, 1, 1,
0.362358, -1.391438, 0.6720865, 0, 0.1058824, 1, 1,
0.3631053, 1.800786, -0.3466256, 0, 0.09803922, 1, 1,
0.364398, -0.5371751, 5.260182, 0, 0.09411765, 1, 1,
0.3696552, -0.9711572, 1.782716, 0, 0.08627451, 1, 1,
0.3700845, -1.498211, 0.4818808, 0, 0.08235294, 1, 1,
0.3709541, 0.320381, 2.485633, 0, 0.07450981, 1, 1,
0.3720266, -0.7992736, 3.500505, 0, 0.07058824, 1, 1,
0.3730749, -0.9306384, 3.634178, 0, 0.0627451, 1, 1,
0.3815928, -0.6565768, 2.988351, 0, 0.05882353, 1, 1,
0.3895996, -0.08981273, 0.2706281, 0, 0.05098039, 1, 1,
0.389603, -0.8217925, 1.567171, 0, 0.04705882, 1, 1,
0.394282, -1.374182, 3.744977, 0, 0.03921569, 1, 1,
0.3943892, 0.3923971, 1.752465, 0, 0.03529412, 1, 1,
0.4019758, -0.7982131, 0.5600086, 0, 0.02745098, 1, 1,
0.4034912, 0.56751, 0.3781691, 0, 0.02352941, 1, 1,
0.4119527, 0.01987713, 1.984552, 0, 0.01568628, 1, 1,
0.4185743, 1.45933, 1.136195, 0, 0.01176471, 1, 1,
0.4196753, -0.2082843, 2.404825, 0, 0.003921569, 1, 1,
0.4199117, 1.34809, 1.050026, 0.003921569, 0, 1, 1,
0.4213803, -0.08449555, 2.176422, 0.007843138, 0, 1, 1,
0.4215531, 1.134892, -0.3470412, 0.01568628, 0, 1, 1,
0.4231729, -1.378879, 2.455552, 0.01960784, 0, 1, 1,
0.4346722, -0.7139851, 3.542536, 0.02745098, 0, 1, 1,
0.4404746, 1.116621, 0.6500723, 0.03137255, 0, 1, 1,
0.4408085, 0.05624505, 1.961038, 0.03921569, 0, 1, 1,
0.4428215, -2.477442, 2.339409, 0.04313726, 0, 1, 1,
0.4434593, 0.05073707, 0.775171, 0.05098039, 0, 1, 1,
0.4445536, 1.221378, -0.3757346, 0.05490196, 0, 1, 1,
0.4483704, -2.19777, 3.926876, 0.0627451, 0, 1, 1,
0.4511068, 0.8459076, 1.029984, 0.06666667, 0, 1, 1,
0.4512594, -0.297092, 1.283808, 0.07450981, 0, 1, 1,
0.4560551, -0.3589263, 2.122923, 0.07843138, 0, 1, 1,
0.4580643, -1.152354, 0.8481294, 0.08627451, 0, 1, 1,
0.4602439, -1.904298, 3.446874, 0.09019608, 0, 1, 1,
0.4603493, 1.99182, -1.582485, 0.09803922, 0, 1, 1,
0.4603913, 0.09914484, 0.03537799, 0.1058824, 0, 1, 1,
0.4615546, 1.635199, -1.011426, 0.1098039, 0, 1, 1,
0.4768909, 1.485114, -0.6401123, 0.1176471, 0, 1, 1,
0.4793853, 0.1923272, 0.9218704, 0.1215686, 0, 1, 1,
0.4798983, -0.582033, 2.267488, 0.1294118, 0, 1, 1,
0.4818121, 0.766485, -0.3657225, 0.1333333, 0, 1, 1,
0.4844922, 0.05293986, 1.455269, 0.1411765, 0, 1, 1,
0.4871549, 0.03554212, 1.619936, 0.145098, 0, 1, 1,
0.4923273, 0.1195277, 1.249661, 0.1529412, 0, 1, 1,
0.4925264, 0.5512102, 1.777506, 0.1568628, 0, 1, 1,
0.4925283, 0.885292, -0.4325313, 0.1647059, 0, 1, 1,
0.4952021, -1.354167, 2.541789, 0.1686275, 0, 1, 1,
0.4970936, 1.14498, 0.2724542, 0.1764706, 0, 1, 1,
0.5013812, -0.3734042, 0.1688793, 0.1803922, 0, 1, 1,
0.5016579, 1.108134, -1.412438, 0.1882353, 0, 1, 1,
0.5022826, 0.519089, -0.5100504, 0.1921569, 0, 1, 1,
0.503925, -0.6836152, 2.095176, 0.2, 0, 1, 1,
0.5040599, 0.4210278, 0.2749309, 0.2078431, 0, 1, 1,
0.5056465, 0.4657865, -0.4109635, 0.2117647, 0, 1, 1,
0.51473, -0.388378, 1.876817, 0.2196078, 0, 1, 1,
0.5173119, -0.5757944, 2.843936, 0.2235294, 0, 1, 1,
0.5191211, 1.552048, 0.3422996, 0.2313726, 0, 1, 1,
0.5255759, -0.7992252, 1.824184, 0.2352941, 0, 1, 1,
0.5261638, 0.7962028, 0.3771914, 0.2431373, 0, 1, 1,
0.5269672, 0.6991387, -0.07596458, 0.2470588, 0, 1, 1,
0.531184, 0.2172432, 2.054498, 0.254902, 0, 1, 1,
0.5320499, 0.3703711, 0.8342927, 0.2588235, 0, 1, 1,
0.5333316, -0.9045958, 1.597445, 0.2666667, 0, 1, 1,
0.5338366, 0.1517153, 1.735281, 0.2705882, 0, 1, 1,
0.5399387, 1.0278, 0.4636293, 0.2784314, 0, 1, 1,
0.547211, -0.2778693, 2.597979, 0.282353, 0, 1, 1,
0.5495085, 0.3649053, -0.07721527, 0.2901961, 0, 1, 1,
0.5504368, -1.290835, 3.084246, 0.2941177, 0, 1, 1,
0.5516742, 0.5090936, -0.6589487, 0.3019608, 0, 1, 1,
0.5562765, 0.59216, -0.06079686, 0.3098039, 0, 1, 1,
0.5579083, -0.1188864, 2.666234, 0.3137255, 0, 1, 1,
0.5641246, 0.930173, 0.1813678, 0.3215686, 0, 1, 1,
0.5675797, -0.4723834, 2.385242, 0.3254902, 0, 1, 1,
0.5696157, 1.181119, 0.6967329, 0.3333333, 0, 1, 1,
0.5700588, -1.118773, 3.444332, 0.3372549, 0, 1, 1,
0.5719192, -0.8651352, 2.183975, 0.345098, 0, 1, 1,
0.5728465, -0.5729591, 1.457962, 0.3490196, 0, 1, 1,
0.5765772, 1.4172, -1.559644, 0.3568628, 0, 1, 1,
0.5773177, 0.4198443, 1.664519, 0.3607843, 0, 1, 1,
0.5795141, -0.2917026, 3.402085, 0.3686275, 0, 1, 1,
0.5864699, 1.814611, 1.622783, 0.372549, 0, 1, 1,
0.5968261, 0.6450267, 0.6439768, 0.3803922, 0, 1, 1,
0.5970982, 0.307687, 0.2136575, 0.3843137, 0, 1, 1,
0.6014252, 1.06635, 0.8296539, 0.3921569, 0, 1, 1,
0.6083139, 0.8038551, 2.688943, 0.3960784, 0, 1, 1,
0.6157928, -0.3917561, 3.234963, 0.4039216, 0, 1, 1,
0.6164472, 0.6382354, -0.608843, 0.4117647, 0, 1, 1,
0.6177931, -0.3017201, 1.219013, 0.4156863, 0, 1, 1,
0.6260674, 0.5145189, 1.57264, 0.4235294, 0, 1, 1,
0.6282355, -0.7533526, 4.463766, 0.427451, 0, 1, 1,
0.6329717, 0.2815036, 1.365487, 0.4352941, 0, 1, 1,
0.6336533, -2.780099, 4.415543, 0.4392157, 0, 1, 1,
0.6383529, -2.395637, 2.508039, 0.4470588, 0, 1, 1,
0.6398265, 1.092674, 0.6286311, 0.4509804, 0, 1, 1,
0.6399574, 1.051552, -0.533015, 0.4588235, 0, 1, 1,
0.6454188, -0.2834849, 1.775385, 0.4627451, 0, 1, 1,
0.6464297, -0.2124908, 0.534384, 0.4705882, 0, 1, 1,
0.6506202, -0.07207701, 3.17928, 0.4745098, 0, 1, 1,
0.651481, 1.502943, 0.3031394, 0.4823529, 0, 1, 1,
0.6546609, -0.8153719, 3.371356, 0.4862745, 0, 1, 1,
0.6619775, 1.35858, 0.6846175, 0.4941176, 0, 1, 1,
0.6665108, -0.1560903, 3.779971, 0.5019608, 0, 1, 1,
0.6752772, 0.7457514, 1.621066, 0.5058824, 0, 1, 1,
0.6797968, -2.044828, 2.759096, 0.5137255, 0, 1, 1,
0.6909046, -1.993831, 0.9224533, 0.5176471, 0, 1, 1,
0.693121, 2.550083, -0.03125152, 0.5254902, 0, 1, 1,
0.6943611, -0.07463046, 1.631699, 0.5294118, 0, 1, 1,
0.6992853, 0.1562543, 2.008716, 0.5372549, 0, 1, 1,
0.7012004, 1.14648, 1.059793, 0.5411765, 0, 1, 1,
0.7017791, -1.603276, 2.874437, 0.5490196, 0, 1, 1,
0.7105427, -0.2370506, 2.512235, 0.5529412, 0, 1, 1,
0.7139392, 0.8426507, 1.983674, 0.5607843, 0, 1, 1,
0.7150027, 0.08960215, 1.601675, 0.5647059, 0, 1, 1,
0.7186542, 0.04065858, 1.128352, 0.572549, 0, 1, 1,
0.7333013, -0.2137502, 1.22386, 0.5764706, 0, 1, 1,
0.7339476, 1.420198, -0.4032727, 0.5843138, 0, 1, 1,
0.7373485, -0.5402048, 1.185179, 0.5882353, 0, 1, 1,
0.7392476, -0.4345601, 3.131915, 0.5960785, 0, 1, 1,
0.7507092, 1.083469, 2.739679, 0.6039216, 0, 1, 1,
0.7543398, -1.772738, 3.221449, 0.6078432, 0, 1, 1,
0.7560423, 0.8856331, 0.9527799, 0.6156863, 0, 1, 1,
0.7604899, -0.3590221, 2.441599, 0.6196079, 0, 1, 1,
0.7638671, -0.08380561, 0.9207146, 0.627451, 0, 1, 1,
0.7661972, 0.5293338, 3.112103, 0.6313726, 0, 1, 1,
0.7663601, -1.500962, 3.575521, 0.6392157, 0, 1, 1,
0.7673878, -0.5199551, 3.189779, 0.6431373, 0, 1, 1,
0.7723941, -0.9067973, 1.859372, 0.6509804, 0, 1, 1,
0.7737464, 0.01561539, 1.54346, 0.654902, 0, 1, 1,
0.7792186, -0.6439549, 3.171123, 0.6627451, 0, 1, 1,
0.7960479, 1.732105, 0.3699332, 0.6666667, 0, 1, 1,
0.798977, -0.5604952, 3.342867, 0.6745098, 0, 1, 1,
0.7995467, -1.368895, 2.449738, 0.6784314, 0, 1, 1,
0.8042409, -1.157726, 1.458192, 0.6862745, 0, 1, 1,
0.8056767, 0.2234985, 1.4455, 0.6901961, 0, 1, 1,
0.808745, 0.640915, 2.246124, 0.6980392, 0, 1, 1,
0.8103488, -0.4396856, 2.116248, 0.7058824, 0, 1, 1,
0.8121969, -0.1339512, 2.579177, 0.7098039, 0, 1, 1,
0.8308173, -0.6355576, 2.75593, 0.7176471, 0, 1, 1,
0.8318287, -0.1486896, 2.246168, 0.7215686, 0, 1, 1,
0.8348237, -0.9132864, 1.606247, 0.7294118, 0, 1, 1,
0.8351349, 1.211144, -1.322548, 0.7333333, 0, 1, 1,
0.8478819, 0.105773, -0.08567085, 0.7411765, 0, 1, 1,
0.8481759, -0.09340476, 1.344331, 0.7450981, 0, 1, 1,
0.8523799, -1.326139, 1.464905, 0.7529412, 0, 1, 1,
0.8540918, 0.09567598, 2.388316, 0.7568628, 0, 1, 1,
0.8596907, 1.942113, -0.5772879, 0.7647059, 0, 1, 1,
0.8604823, 0.430167, 1.120856, 0.7686275, 0, 1, 1,
0.8622075, -0.02309527, 4.379543, 0.7764706, 0, 1, 1,
0.8650847, -0.8138761, 0.8612507, 0.7803922, 0, 1, 1,
0.8667082, 2.99137, 0.9987655, 0.7882353, 0, 1, 1,
0.8684718, -1.640049, 1.762705, 0.7921569, 0, 1, 1,
0.8697814, 0.2727028, 1.717031, 0.8, 0, 1, 1,
0.8774568, 0.4294505, 2.732137, 0.8078431, 0, 1, 1,
0.8780853, 0.3845026, 1.686409, 0.8117647, 0, 1, 1,
0.8848358, 0.3036895, 2.327169, 0.8196079, 0, 1, 1,
0.8898627, 0.6555412, 0.001510577, 0.8235294, 0, 1, 1,
0.8932328, -0.1377685, 0.8608237, 0.8313726, 0, 1, 1,
0.8965358, -0.09244733, 1.908438, 0.8352941, 0, 1, 1,
0.8999535, -1.492025, 2.863914, 0.8431373, 0, 1, 1,
0.9025822, 0.8355612, 2.315034, 0.8470588, 0, 1, 1,
0.9036253, 0.9591268, 1.839555, 0.854902, 0, 1, 1,
0.9048547, -0.1498148, 2.405326, 0.8588235, 0, 1, 1,
0.9074576, -0.8723475, 2.90214, 0.8666667, 0, 1, 1,
0.9111895, -0.3604312, 2.229742, 0.8705882, 0, 1, 1,
0.9114624, -0.9544008, 1.815869, 0.8784314, 0, 1, 1,
0.9114874, 1.017379, -0.04487655, 0.8823529, 0, 1, 1,
0.9154398, -0.6347112, 2.337028, 0.8901961, 0, 1, 1,
0.9239958, 0.1759699, 0.9004106, 0.8941177, 0, 1, 1,
0.9334369, 0.8393677, 0.2330215, 0.9019608, 0, 1, 1,
0.9423106, -0.483622, 1.1873, 0.9098039, 0, 1, 1,
0.9520321, 0.2127244, 0.1470419, 0.9137255, 0, 1, 1,
0.9531795, 0.8890719, -0.07622164, 0.9215686, 0, 1, 1,
0.9571208, 0.2101297, 1.308522, 0.9254902, 0, 1, 1,
0.9622066, 1.099092, 1.356699, 0.9333333, 0, 1, 1,
0.9645962, 1.706976, 1.643355, 0.9372549, 0, 1, 1,
0.9662906, 1.152181, -0.2971849, 0.945098, 0, 1, 1,
0.9703596, -0.1847921, 1.073153, 0.9490196, 0, 1, 1,
0.9716718, -0.02471046, 0.9166507, 0.9568627, 0, 1, 1,
0.9901475, 0.4501914, 1.440819, 0.9607843, 0, 1, 1,
0.9954641, 1.585333, 0.2192347, 0.9686275, 0, 1, 1,
0.9963213, -0.00826803, 1.526941, 0.972549, 0, 1, 1,
0.9983404, -0.2266897, 0.5570511, 0.9803922, 0, 1, 1,
0.9985041, -0.3722109, 1.930817, 0.9843137, 0, 1, 1,
1.002771, 2.206126, 0.9338222, 0.9921569, 0, 1, 1,
1.009155, 0.7134439, 0.5662525, 0.9960784, 0, 1, 1,
1.010291, 0.09936865, 2.438591, 1, 0, 0.9960784, 1,
1.011793, 0.347627, 0.7974466, 1, 0, 0.9882353, 1,
1.021213, -1.525702, 3.047058, 1, 0, 0.9843137, 1,
1.021264, 0.891027, 1.831953, 1, 0, 0.9764706, 1,
1.024742, 0.5562212, 1.647057, 1, 0, 0.972549, 1,
1.026947, 1.203047, 1.549047, 1, 0, 0.9647059, 1,
1.027488, -0.6061971, 1.067031, 1, 0, 0.9607843, 1,
1.030976, 0.481676, 1.885426, 1, 0, 0.9529412, 1,
1.031392, -0.2088706, 1.78188, 1, 0, 0.9490196, 1,
1.036848, 1.10421, 1.062986, 1, 0, 0.9411765, 1,
1.038353, -0.07687192, 1.470437, 1, 0, 0.9372549, 1,
1.042039, 0.0972876, 0.3675649, 1, 0, 0.9294118, 1,
1.044615, -0.8853874, 2.379349, 1, 0, 0.9254902, 1,
1.04557, 2.10368, -0.08543239, 1, 0, 0.9176471, 1,
1.046072, 0.07943635, 1.498341, 1, 0, 0.9137255, 1,
1.047331, -1.466539, 3.967083, 1, 0, 0.9058824, 1,
1.047763, -0.3386648, 2.703063, 1, 0, 0.9019608, 1,
1.051784, 1.499909, 0.1928399, 1, 0, 0.8941177, 1,
1.057041, -0.08270482, -0.2686376, 1, 0, 0.8862745, 1,
1.057739, 1.778112, 2.137968, 1, 0, 0.8823529, 1,
1.060959, 0.6480592, 0.5532846, 1, 0, 0.8745098, 1,
1.062932, 0.5491756, 0.2013297, 1, 0, 0.8705882, 1,
1.063778, -2.789809, 1.321204, 1, 0, 0.8627451, 1,
1.082888, -2.545039, 3.125251, 1, 0, 0.8588235, 1,
1.083446, 0.8942742, -0.1131102, 1, 0, 0.8509804, 1,
1.087883, 1.390686, 0.6068093, 1, 0, 0.8470588, 1,
1.098989, 0.4029517, 0.8647819, 1, 0, 0.8392157, 1,
1.099075, 0.5630456, 0.4078375, 1, 0, 0.8352941, 1,
1.107379, -0.1296009, 2.072514, 1, 0, 0.827451, 1,
1.110886, 0.5818299, 0.5236883, 1, 0, 0.8235294, 1,
1.114988, -0.1267997, -0.1815841, 1, 0, 0.8156863, 1,
1.123232, -0.7912678, 0.6625578, 1, 0, 0.8117647, 1,
1.132118, 0.8287497, 1.027977, 1, 0, 0.8039216, 1,
1.133355, 0.5695049, 0.3126477, 1, 0, 0.7960784, 1,
1.142381, 0.1654547, 0.4777988, 1, 0, 0.7921569, 1,
1.144508, -0.3554141, 1.119732, 1, 0, 0.7843137, 1,
1.154665, -0.6150253, 2.750388, 1, 0, 0.7803922, 1,
1.167251, -0.5454346, 1.385031, 1, 0, 0.772549, 1,
1.175048, 0.2203202, 2.752358, 1, 0, 0.7686275, 1,
1.179856, 0.5410252, 2.664446, 1, 0, 0.7607843, 1,
1.185436, -0.0194781, 3.700059, 1, 0, 0.7568628, 1,
1.188626, 2.495661, 0.6647093, 1, 0, 0.7490196, 1,
1.190584, 0.8592991, 2.008265, 1, 0, 0.7450981, 1,
1.192075, -1.149634, 2.707823, 1, 0, 0.7372549, 1,
1.19372, 1.30131, 0.5009047, 1, 0, 0.7333333, 1,
1.197909, 0.1471534, 2.701983, 1, 0, 0.7254902, 1,
1.202679, 0.5319337, 0.7890313, 1, 0, 0.7215686, 1,
1.22012, -2.571684, 3.857322, 1, 0, 0.7137255, 1,
1.22611, -0.2766514, 1.538214, 1, 0, 0.7098039, 1,
1.229444, -1.726985, 2.03841, 1, 0, 0.7019608, 1,
1.229518, -0.07967868, 1.272566, 1, 0, 0.6941177, 1,
1.229537, -0.9780909, 2.511968, 1, 0, 0.6901961, 1,
1.232707, 0.4923514, 0.1091964, 1, 0, 0.682353, 1,
1.234831, -0.4500893, 2.13499, 1, 0, 0.6784314, 1,
1.236112, -0.6882076, 2.121608, 1, 0, 0.6705883, 1,
1.236678, -0.1008356, 1.242963, 1, 0, 0.6666667, 1,
1.242399, 2.044784, 0.1369866, 1, 0, 0.6588235, 1,
1.243128, 0.6786301, 0.09621178, 1, 0, 0.654902, 1,
1.245601, 0.06832115, 1.452572, 1, 0, 0.6470588, 1,
1.256953, 0.04196678, 0.6398268, 1, 0, 0.6431373, 1,
1.276732, 1.112713, -0.3375366, 1, 0, 0.6352941, 1,
1.300106, -0.3088866, 2.489325, 1, 0, 0.6313726, 1,
1.303678, -0.3424683, 0.5789782, 1, 0, 0.6235294, 1,
1.309407, -0.3237977, 1.456139, 1, 0, 0.6196079, 1,
1.314981, -0.00792123, 0.9391124, 1, 0, 0.6117647, 1,
1.318356, -0.5908919, 2.014709, 1, 0, 0.6078432, 1,
1.321682, 1.643987, 2.203485, 1, 0, 0.6, 1,
1.328894, 0.1646052, 0.3928676, 1, 0, 0.5921569, 1,
1.330022, -0.01617317, 0.9033869, 1, 0, 0.5882353, 1,
1.336381, 1.106579, 1.156425, 1, 0, 0.5803922, 1,
1.336587, 0.8601072, -0.2772954, 1, 0, 0.5764706, 1,
1.339184, -0.6146768, 0.5565884, 1, 0, 0.5686275, 1,
1.345845, 0.3683004, 0.8273943, 1, 0, 0.5647059, 1,
1.350006, 0.07381141, 1.788803, 1, 0, 0.5568628, 1,
1.352156, 1.649687, -0.3555851, 1, 0, 0.5529412, 1,
1.363986, -0.7309448, 1.404994, 1, 0, 0.5450981, 1,
1.378725, -0.01334662, 3.116911, 1, 0, 0.5411765, 1,
1.379593, -0.2115958, 1.41039, 1, 0, 0.5333334, 1,
1.384906, -0.5187719, 2.433344, 1, 0, 0.5294118, 1,
1.393467, 1.606759, -0.7820346, 1, 0, 0.5215687, 1,
1.394151, -0.5935313, 0.7881948, 1, 0, 0.5176471, 1,
1.399917, 1.129499, -0.6614256, 1, 0, 0.509804, 1,
1.412326, 0.6910783, -0.4622994, 1, 0, 0.5058824, 1,
1.412655, -1.251061, 2.82496, 1, 0, 0.4980392, 1,
1.41435, -0.3355725, 2.241601, 1, 0, 0.4901961, 1,
1.415931, 0.1347358, 2.166217, 1, 0, 0.4862745, 1,
1.420939, -0.1115666, 1.721544, 1, 0, 0.4784314, 1,
1.429615, 0.6458839, 2.240248, 1, 0, 0.4745098, 1,
1.440479, -1.910597, 3.392789, 1, 0, 0.4666667, 1,
1.446957, -0.5928305, 1.652245, 1, 0, 0.4627451, 1,
1.453562, 0.3478251, 2.278881, 1, 0, 0.454902, 1,
1.46484, -1.315512, 3.087973, 1, 0, 0.4509804, 1,
1.468858, -0.4124221, 1.662802, 1, 0, 0.4431373, 1,
1.470522, 0.5206775, 1.178868, 1, 0, 0.4392157, 1,
1.471121, 0.2708879, 0.1360594, 1, 0, 0.4313726, 1,
1.480009, -2.146488, 1.683231, 1, 0, 0.427451, 1,
1.484481, -0.4323614, 2.762995, 1, 0, 0.4196078, 1,
1.484956, 0.3537441, 0.5218427, 1, 0, 0.4156863, 1,
1.492986, 1.031512, 0.6895462, 1, 0, 0.4078431, 1,
1.503647, -0.3986257, 0.451665, 1, 0, 0.4039216, 1,
1.50884, -1.474013, 1.711341, 1, 0, 0.3960784, 1,
1.519263, 0.8905523, 0.3405322, 1, 0, 0.3882353, 1,
1.521465, 1.498143, 2.557813, 1, 0, 0.3843137, 1,
1.523485, 0.5025028, 1.482422, 1, 0, 0.3764706, 1,
1.537657, -0.3653871, 1.317501, 1, 0, 0.372549, 1,
1.546791, -1.377551, 1.482635, 1, 0, 0.3647059, 1,
1.546967, 0.8222854, 1.549818, 1, 0, 0.3607843, 1,
1.550734, -0.6269764, 1.084178, 1, 0, 0.3529412, 1,
1.555877, 0.4109535, -0.4406795, 1, 0, 0.3490196, 1,
1.564151, -1.12275, 1.202675, 1, 0, 0.3411765, 1,
1.569808, -2.101885, 1.447789, 1, 0, 0.3372549, 1,
1.577282, -0.006189252, 0.1125556, 1, 0, 0.3294118, 1,
1.585621, -0.9224315, 1.451125, 1, 0, 0.3254902, 1,
1.587834, 0.8414371, 2.37053, 1, 0, 0.3176471, 1,
1.58784, 0.8845202, 0.5242538, 1, 0, 0.3137255, 1,
1.590358, 0.4773632, -0.3095984, 1, 0, 0.3058824, 1,
1.603172, -1.888201, 0.9263275, 1, 0, 0.2980392, 1,
1.607227, 0.4878269, 3.131256, 1, 0, 0.2941177, 1,
1.629599, -0.5856145, 1.129852, 1, 0, 0.2862745, 1,
1.631487, 0.3366106, 2.003873, 1, 0, 0.282353, 1,
1.635808, 0.1699408, 2.312881, 1, 0, 0.2745098, 1,
1.694624, -0.4405027, 2.367963, 1, 0, 0.2705882, 1,
1.722923, -1.180833, 3.799406, 1, 0, 0.2627451, 1,
1.733312, 0.8846556, 2.773341, 1, 0, 0.2588235, 1,
1.750834, 0.6076114, 1.777089, 1, 0, 0.2509804, 1,
1.75123, 0.4214929, 2.177539, 1, 0, 0.2470588, 1,
1.758357, 1.560918, 1.694477, 1, 0, 0.2392157, 1,
1.782251, -0.04127051, 0.7706993, 1, 0, 0.2352941, 1,
1.805921, 2.101253, 1.088042, 1, 0, 0.227451, 1,
1.819725, -1.230081, 1.686306, 1, 0, 0.2235294, 1,
1.846239, -1.860242, 1.56346, 1, 0, 0.2156863, 1,
1.860343, -2.200421, 1.01412, 1, 0, 0.2117647, 1,
1.944314, -2.503237, 3.69439, 1, 0, 0.2039216, 1,
1.948295, 1.353425, 1.256187, 1, 0, 0.1960784, 1,
1.97634, 1.989217, 1.287861, 1, 0, 0.1921569, 1,
1.990111, -0.1787919, 0.4273699, 1, 0, 0.1843137, 1,
1.996632, -1.388058, 0.8494687, 1, 0, 0.1803922, 1,
2.020468, -1.019799, 0.1338352, 1, 0, 0.172549, 1,
2.039715, -0.753942, 3.178069, 1, 0, 0.1686275, 1,
2.046425, -0.05355753, 1.711331, 1, 0, 0.1607843, 1,
2.075934, -0.4058834, 1.690377, 1, 0, 0.1568628, 1,
2.087317, 0.7064713, -0.6755887, 1, 0, 0.1490196, 1,
2.095521, -1.474494, 1.557775, 1, 0, 0.145098, 1,
2.104676, 0.837724, -0.5911691, 1, 0, 0.1372549, 1,
2.112479, -0.8307433, 0.6164913, 1, 0, 0.1333333, 1,
2.140864, 0.2116747, 0.9784454, 1, 0, 0.1254902, 1,
2.150468, 0.6506599, 0.7174864, 1, 0, 0.1215686, 1,
2.164041, -1.774139, 2.933676, 1, 0, 0.1137255, 1,
2.16595, -0.967409, 1.551272, 1, 0, 0.1098039, 1,
2.198697, -0.01883494, 1.438911, 1, 0, 0.1019608, 1,
2.201346, -1.258157, -0.2666436, 1, 0, 0.09411765, 1,
2.247919, 0.0424882, 3.354779, 1, 0, 0.09019608, 1,
2.28519, 2.851545, 2.31226, 1, 0, 0.08235294, 1,
2.291576, -0.01150755, 1.310767, 1, 0, 0.07843138, 1,
2.335649, -1.111069, 2.028183, 1, 0, 0.07058824, 1,
2.366089, 0.9241558, -0.5584409, 1, 0, 0.06666667, 1,
2.376859, -0.2870542, 1.089932, 1, 0, 0.05882353, 1,
2.402257, -0.5369937, 1.896081, 1, 0, 0.05490196, 1,
2.405394, -0.2372031, 4.348923, 1, 0, 0.04705882, 1,
2.426507, 0.2265675, 0.7341887, 1, 0, 0.04313726, 1,
2.456819, -2.469902, 3.353158, 1, 0, 0.03529412, 1,
2.680865, -0.3797478, 1.416974, 1, 0, 0.03137255, 1,
2.828013, 0.3930436, 2.478019, 1, 0, 0.02352941, 1,
2.974691, -0.6582368, 1.390367, 1, 0, 0.01960784, 1,
3.137048, -0.08658341, 0.6896186, 1, 0, 0.01176471, 1,
3.575657, -1.761154, 1.087311, 1, 0, 0.007843138, 1
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
0.4234012, -4.250341, -6.745874, 0, -0.5, 0.5, 0.5,
0.4234012, -4.250341, -6.745874, 1, -0.5, 0.5, 0.5,
0.4234012, -4.250341, -6.745874, 1, 1.5, 0.5, 0.5,
0.4234012, -4.250341, -6.745874, 0, 1.5, 0.5, 0.5
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
-3.797469, -0.1047013, -6.745874, 0, -0.5, 0.5, 0.5,
-3.797469, -0.1047013, -6.745874, 1, -0.5, 0.5, 0.5,
-3.797469, -0.1047013, -6.745874, 1, 1.5, 0.5, 0.5,
-3.797469, -0.1047013, -6.745874, 0, 1.5, 0.5, 0.5
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
-3.797469, -4.250341, 0.1271954, 0, -0.5, 0.5, 0.5,
-3.797469, -4.250341, 0.1271954, 1, -0.5, 0.5, 0.5,
-3.797469, -4.250341, 0.1271954, 1, 1.5, 0.5, 0.5,
-3.797469, -4.250341, 0.1271954, 0, 1.5, 0.5, 0.5
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
-2, -3.293655, -5.159781,
3, -3.293655, -5.159781,
-2, -3.293655, -5.159781,
-2, -3.453103, -5.42413,
-1, -3.293655, -5.159781,
-1, -3.453103, -5.42413,
0, -3.293655, -5.159781,
0, -3.453103, -5.42413,
1, -3.293655, -5.159781,
1, -3.453103, -5.42413,
2, -3.293655, -5.159781,
2, -3.453103, -5.42413,
3, -3.293655, -5.159781,
3, -3.453103, -5.42413
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
-2, -3.771998, -5.952828, 0, -0.5, 0.5, 0.5,
-2, -3.771998, -5.952828, 1, -0.5, 0.5, 0.5,
-2, -3.771998, -5.952828, 1, 1.5, 0.5, 0.5,
-2, -3.771998, -5.952828, 0, 1.5, 0.5, 0.5,
-1, -3.771998, -5.952828, 0, -0.5, 0.5, 0.5,
-1, -3.771998, -5.952828, 1, -0.5, 0.5, 0.5,
-1, -3.771998, -5.952828, 1, 1.5, 0.5, 0.5,
-1, -3.771998, -5.952828, 0, 1.5, 0.5, 0.5,
0, -3.771998, -5.952828, 0, -0.5, 0.5, 0.5,
0, -3.771998, -5.952828, 1, -0.5, 0.5, 0.5,
0, -3.771998, -5.952828, 1, 1.5, 0.5, 0.5,
0, -3.771998, -5.952828, 0, 1.5, 0.5, 0.5,
1, -3.771998, -5.952828, 0, -0.5, 0.5, 0.5,
1, -3.771998, -5.952828, 1, -0.5, 0.5, 0.5,
1, -3.771998, -5.952828, 1, 1.5, 0.5, 0.5,
1, -3.771998, -5.952828, 0, 1.5, 0.5, 0.5,
2, -3.771998, -5.952828, 0, -0.5, 0.5, 0.5,
2, -3.771998, -5.952828, 1, -0.5, 0.5, 0.5,
2, -3.771998, -5.952828, 1, 1.5, 0.5, 0.5,
2, -3.771998, -5.952828, 0, 1.5, 0.5, 0.5,
3, -3.771998, -5.952828, 0, -0.5, 0.5, 0.5,
3, -3.771998, -5.952828, 1, -0.5, 0.5, 0.5,
3, -3.771998, -5.952828, 1, 1.5, 0.5, 0.5,
3, -3.771998, -5.952828, 0, 1.5, 0.5, 0.5
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
-2.823422, -3, -5.159781,
-2.823422, 2, -5.159781,
-2.823422, -3, -5.159781,
-2.985763, -3, -5.42413,
-2.823422, -2, -5.159781,
-2.985763, -2, -5.42413,
-2.823422, -1, -5.159781,
-2.985763, -1, -5.42413,
-2.823422, 0, -5.159781,
-2.985763, 0, -5.42413,
-2.823422, 1, -5.159781,
-2.985763, 1, -5.42413,
-2.823422, 2, -5.159781,
-2.985763, 2, -5.42413
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
-3.310445, -3, -5.952828, 0, -0.5, 0.5, 0.5,
-3.310445, -3, -5.952828, 1, -0.5, 0.5, 0.5,
-3.310445, -3, -5.952828, 1, 1.5, 0.5, 0.5,
-3.310445, -3, -5.952828, 0, 1.5, 0.5, 0.5,
-3.310445, -2, -5.952828, 0, -0.5, 0.5, 0.5,
-3.310445, -2, -5.952828, 1, -0.5, 0.5, 0.5,
-3.310445, -2, -5.952828, 1, 1.5, 0.5, 0.5,
-3.310445, -2, -5.952828, 0, 1.5, 0.5, 0.5,
-3.310445, -1, -5.952828, 0, -0.5, 0.5, 0.5,
-3.310445, -1, -5.952828, 1, -0.5, 0.5, 0.5,
-3.310445, -1, -5.952828, 1, 1.5, 0.5, 0.5,
-3.310445, -1, -5.952828, 0, 1.5, 0.5, 0.5,
-3.310445, 0, -5.952828, 0, -0.5, 0.5, 0.5,
-3.310445, 0, -5.952828, 1, -0.5, 0.5, 0.5,
-3.310445, 0, -5.952828, 1, 1.5, 0.5, 0.5,
-3.310445, 0, -5.952828, 0, 1.5, 0.5, 0.5,
-3.310445, 1, -5.952828, 0, -0.5, 0.5, 0.5,
-3.310445, 1, -5.952828, 1, -0.5, 0.5, 0.5,
-3.310445, 1, -5.952828, 1, 1.5, 0.5, 0.5,
-3.310445, 1, -5.952828, 0, 1.5, 0.5, 0.5,
-3.310445, 2, -5.952828, 0, -0.5, 0.5, 0.5,
-3.310445, 2, -5.952828, 1, -0.5, 0.5, 0.5,
-3.310445, 2, -5.952828, 1, 1.5, 0.5, 0.5,
-3.310445, 2, -5.952828, 0, 1.5, 0.5, 0.5
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
-2.823422, -3.293655, -4,
-2.823422, -3.293655, 4,
-2.823422, -3.293655, -4,
-2.985763, -3.453103, -4,
-2.823422, -3.293655, -2,
-2.985763, -3.453103, -2,
-2.823422, -3.293655, 0,
-2.985763, -3.453103, 0,
-2.823422, -3.293655, 2,
-2.985763, -3.453103, 2,
-2.823422, -3.293655, 4,
-2.985763, -3.453103, 4
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
-3.310445, -3.771998, -4, 0, -0.5, 0.5, 0.5,
-3.310445, -3.771998, -4, 1, -0.5, 0.5, 0.5,
-3.310445, -3.771998, -4, 1, 1.5, 0.5, 0.5,
-3.310445, -3.771998, -4, 0, 1.5, 0.5, 0.5,
-3.310445, -3.771998, -2, 0, -0.5, 0.5, 0.5,
-3.310445, -3.771998, -2, 1, -0.5, 0.5, 0.5,
-3.310445, -3.771998, -2, 1, 1.5, 0.5, 0.5,
-3.310445, -3.771998, -2, 0, 1.5, 0.5, 0.5,
-3.310445, -3.771998, 0, 0, -0.5, 0.5, 0.5,
-3.310445, -3.771998, 0, 1, -0.5, 0.5, 0.5,
-3.310445, -3.771998, 0, 1, 1.5, 0.5, 0.5,
-3.310445, -3.771998, 0, 0, 1.5, 0.5, 0.5,
-3.310445, -3.771998, 2, 0, -0.5, 0.5, 0.5,
-3.310445, -3.771998, 2, 1, -0.5, 0.5, 0.5,
-3.310445, -3.771998, 2, 1, 1.5, 0.5, 0.5,
-3.310445, -3.771998, 2, 0, 1.5, 0.5, 0.5,
-3.310445, -3.771998, 4, 0, -0.5, 0.5, 0.5,
-3.310445, -3.771998, 4, 1, -0.5, 0.5, 0.5,
-3.310445, -3.771998, 4, 1, 1.5, 0.5, 0.5,
-3.310445, -3.771998, 4, 0, 1.5, 0.5, 0.5
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
-2.823422, -3.293655, -5.159781,
-2.823422, 3.084252, -5.159781,
-2.823422, -3.293655, 5.414172,
-2.823422, 3.084252, 5.414172,
-2.823422, -3.293655, -5.159781,
-2.823422, -3.293655, 5.414172,
-2.823422, 3.084252, -5.159781,
-2.823422, 3.084252, 5.414172,
-2.823422, -3.293655, -5.159781,
3.670224, -3.293655, -5.159781,
-2.823422, -3.293655, 5.414172,
3.670224, -3.293655, 5.414172,
-2.823422, 3.084252, -5.159781,
3.670224, 3.084252, -5.159781,
-2.823422, 3.084252, 5.414172,
3.670224, 3.084252, 5.414172,
3.670224, -3.293655, -5.159781,
3.670224, 3.084252, -5.159781,
3.670224, -3.293655, 5.414172,
3.670224, 3.084252, 5.414172,
3.670224, -3.293655, -5.159781,
3.670224, -3.293655, 5.414172,
3.670224, 3.084252, -5.159781,
3.670224, 3.084252, 5.414172
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
var radius = 7.450007;
var distance = 33.14592;
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
mvMatrix.translate( -0.4234012, 0.1047013, -0.1271954 );
mvMatrix.scale( 1.240458, 1.262968, 0.7617865 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.14592);
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


