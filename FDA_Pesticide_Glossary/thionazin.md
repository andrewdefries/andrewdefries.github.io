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
-3.170333, -1.045432, -1.788934, 1, 0, 0, 1,
-2.779501, -0.07602047, -2.4481, 1, 0.007843138, 0, 1,
-2.76498, 1.318823, 0.05273829, 1, 0.01176471, 0, 1,
-2.655514, -0.4895348, -2.756181, 1, 0.01960784, 0, 1,
-2.597797, 0.8699391, -2.589439, 1, 0.02352941, 0, 1,
-2.510784, 1.626635, -1.365609, 1, 0.03137255, 0, 1,
-2.417768, 1.112405, -0.02257357, 1, 0.03529412, 0, 1,
-2.391174, 0.9410763, -1.741193, 1, 0.04313726, 0, 1,
-2.30209, 0.3700684, -0.7466933, 1, 0.04705882, 0, 1,
-2.245239, -1.142356, -2.334406, 1, 0.05490196, 0, 1,
-2.238662, 0.7123039, -0.06240591, 1, 0.05882353, 0, 1,
-2.216956, -1.70807, -0.05847079, 1, 0.06666667, 0, 1,
-2.202534, -0.6528092, -1.587222, 1, 0.07058824, 0, 1,
-2.187432, -1.779299, -2.18109, 1, 0.07843138, 0, 1,
-2.142092, 0.3824341, -2.816588, 1, 0.08235294, 0, 1,
-2.070652, 1.419196, -1.349371, 1, 0.09019608, 0, 1,
-2.061937, -0.3158743, -1.980914, 1, 0.09411765, 0, 1,
-2.044144, -0.5145996, -1.187631, 1, 0.1019608, 0, 1,
-2.038245, -0.07723938, -1.527074, 1, 0.1098039, 0, 1,
-2.034006, 0.4645793, -0.8209885, 1, 0.1137255, 0, 1,
-2.020073, 1.286932, -1.868425, 1, 0.1215686, 0, 1,
-2.020012, 1.239172, -1.761935, 1, 0.1254902, 0, 1,
-2.006694, -1.276883, -4.004478, 1, 0.1333333, 0, 1,
-2.005978, 0.6739987, -3.276603, 1, 0.1372549, 0, 1,
-1.980982, 0.6161126, 0.7621861, 1, 0.145098, 0, 1,
-1.976951, 1.025554, -1.559818, 1, 0.1490196, 0, 1,
-1.948166, -0.3641077, -3.29011, 1, 0.1568628, 0, 1,
-1.918964, -0.6656661, -1.512097, 1, 0.1607843, 0, 1,
-1.914107, 0.60687, -2.383186, 1, 0.1686275, 0, 1,
-1.904485, 0.3913095, -2.298787, 1, 0.172549, 0, 1,
-1.898338, 1.361796, -1.778851, 1, 0.1803922, 0, 1,
-1.888237, -0.03839589, -1.269474, 1, 0.1843137, 0, 1,
-1.865413, -0.678683, -2.447819, 1, 0.1921569, 0, 1,
-1.854944, 1.685008, 0.1211136, 1, 0.1960784, 0, 1,
-1.852465, -0.9061175, -2.112848, 1, 0.2039216, 0, 1,
-1.818796, -0.7051978, -1.094737, 1, 0.2117647, 0, 1,
-1.805041, 0.1077495, 0.09227692, 1, 0.2156863, 0, 1,
-1.787924, 0.5045781, -1.58205, 1, 0.2235294, 0, 1,
-1.777893, -1.808244, -2.48929, 1, 0.227451, 0, 1,
-1.775652, -2.124327, -1.418753, 1, 0.2352941, 0, 1,
-1.771266, 0.8066264, -2.973662, 1, 0.2392157, 0, 1,
-1.769504, 1.361612, 0.1265253, 1, 0.2470588, 0, 1,
-1.731842, 0.5060156, -1.203591, 1, 0.2509804, 0, 1,
-1.726276, 0.7932059, -0.8610618, 1, 0.2588235, 0, 1,
-1.724936, 1.197174, -1.44664, 1, 0.2627451, 0, 1,
-1.723222, -0.2601503, -0.9928446, 1, 0.2705882, 0, 1,
-1.719959, 0.5540586, -1.982659, 1, 0.2745098, 0, 1,
-1.709062, 0.04944555, -0.969879, 1, 0.282353, 0, 1,
-1.703092, 0.5443019, -0.2952505, 1, 0.2862745, 0, 1,
-1.67363, 2.526414, -1.224004, 1, 0.2941177, 0, 1,
-1.666801, -1.644145, -1.765759, 1, 0.3019608, 0, 1,
-1.664651, 0.4171923, -0.735553, 1, 0.3058824, 0, 1,
-1.657088, -0.8291149, -2.605941, 1, 0.3137255, 0, 1,
-1.647592, 1.132856, -1.251076, 1, 0.3176471, 0, 1,
-1.643336, 0.1012372, -0.2902222, 1, 0.3254902, 0, 1,
-1.626785, -0.1627577, -0.7509397, 1, 0.3294118, 0, 1,
-1.626602, -1.007341, -3.913767, 1, 0.3372549, 0, 1,
-1.612374, -0.6005037, -1.875934, 1, 0.3411765, 0, 1,
-1.605333, 1.501256, 1.727712, 1, 0.3490196, 0, 1,
-1.603597, -0.3944143, -2.33712, 1, 0.3529412, 0, 1,
-1.591942, 0.04741452, -1.585602, 1, 0.3607843, 0, 1,
-1.591129, 0.5314103, -1.324197, 1, 0.3647059, 0, 1,
-1.590068, -1.618217, -2.383454, 1, 0.372549, 0, 1,
-1.566852, 1.24564, -1.187431, 1, 0.3764706, 0, 1,
-1.552153, 1.221329, -1.146076, 1, 0.3843137, 0, 1,
-1.55065, -2.775236, -2.151592, 1, 0.3882353, 0, 1,
-1.550578, 0.1807676, -0.95825, 1, 0.3960784, 0, 1,
-1.540212, -0.4791181, -1.55027, 1, 0.4039216, 0, 1,
-1.53578, 1.993733, -0.6814545, 1, 0.4078431, 0, 1,
-1.534204, 0.4249118, -1.836808, 1, 0.4156863, 0, 1,
-1.493924, -0.244839, -2.064036, 1, 0.4196078, 0, 1,
-1.486414, 0.5547189, 0.8843769, 1, 0.427451, 0, 1,
-1.482506, -0.8877098, -1.576709, 1, 0.4313726, 0, 1,
-1.481336, 1.190301, -0.1639073, 1, 0.4392157, 0, 1,
-1.476522, 0.2820101, -1.157822, 1, 0.4431373, 0, 1,
-1.47327, 0.04570483, -2.412184, 1, 0.4509804, 0, 1,
-1.468361, 0.7783089, -1.082155, 1, 0.454902, 0, 1,
-1.456511, -0.3383929, -1.81891, 1, 0.4627451, 0, 1,
-1.441087, 0.6800174, -1.006389, 1, 0.4666667, 0, 1,
-1.418326, 2.640545, -0.1621301, 1, 0.4745098, 0, 1,
-1.411176, 0.2038448, -2.154931, 1, 0.4784314, 0, 1,
-1.391731, 0.7074177, -2.211236, 1, 0.4862745, 0, 1,
-1.385666, 0.5248168, -1.619813, 1, 0.4901961, 0, 1,
-1.384669, 0.6338729, -0.3221492, 1, 0.4980392, 0, 1,
-1.378835, 0.4834207, -1.302022, 1, 0.5058824, 0, 1,
-1.375681, 0.6691737, -0.04378339, 1, 0.509804, 0, 1,
-1.359994, -0.5052214, -2.214798, 1, 0.5176471, 0, 1,
-1.356981, -0.5200599, -0.4893426, 1, 0.5215687, 0, 1,
-1.354673, -1.316104, -4.910861, 1, 0.5294118, 0, 1,
-1.353094, -0.5559292, 0.01115745, 1, 0.5333334, 0, 1,
-1.346211, -0.2256323, -3.09443, 1, 0.5411765, 0, 1,
-1.340663, 0.2025243, 0.2016838, 1, 0.5450981, 0, 1,
-1.335986, -1.509488, -2.337828, 1, 0.5529412, 0, 1,
-1.320566, -1.011562, -2.145065, 1, 0.5568628, 0, 1,
-1.316099, 0.03664508, 0.2100091, 1, 0.5647059, 0, 1,
-1.315383, 0.650853, -0.2963205, 1, 0.5686275, 0, 1,
-1.314488, 2.059168, -0.9518689, 1, 0.5764706, 0, 1,
-1.311806, -1.5014, -3.912252, 1, 0.5803922, 0, 1,
-1.307451, 0.8247638, -2.003323, 1, 0.5882353, 0, 1,
-1.305309, -0.7124686, -0.4161141, 1, 0.5921569, 0, 1,
-1.305285, -1.458959, -4.125247, 1, 0.6, 0, 1,
-1.304559, 0.3761101, -1.753532, 1, 0.6078432, 0, 1,
-1.299454, -0.5732329, -2.059575, 1, 0.6117647, 0, 1,
-1.292984, -1.140486, -1.350229, 1, 0.6196079, 0, 1,
-1.288979, 0.5438687, -1.563024, 1, 0.6235294, 0, 1,
-1.288652, 0.7496989, 1.031134, 1, 0.6313726, 0, 1,
-1.270372, 0.9005331, -1.469951, 1, 0.6352941, 0, 1,
-1.268639, -0.4029738, -1.157312, 1, 0.6431373, 0, 1,
-1.263601, 0.1857165, -3.219912, 1, 0.6470588, 0, 1,
-1.260377, -1.318707, -0.4139613, 1, 0.654902, 0, 1,
-1.259513, 0.7086049, 0.3779543, 1, 0.6588235, 0, 1,
-1.258177, 0.7092228, -2.461803, 1, 0.6666667, 0, 1,
-1.247377, -0.2879863, 0.2477026, 1, 0.6705883, 0, 1,
-1.24671, 0.935063, 1.742007, 1, 0.6784314, 0, 1,
-1.24118, 1.219421, -2.902712, 1, 0.682353, 0, 1,
-1.229694, 1.496651, -1.276272, 1, 0.6901961, 0, 1,
-1.227692, -0.8196994, -3.951101, 1, 0.6941177, 0, 1,
-1.214185, -0.3183823, -1.694568, 1, 0.7019608, 0, 1,
-1.211805, -0.2185002, 0.4188237, 1, 0.7098039, 0, 1,
-1.201517, -0.3632911, -1.9981, 1, 0.7137255, 0, 1,
-1.197106, -1.763929, -2.725399, 1, 0.7215686, 0, 1,
-1.196045, 1.791083, -0.9629709, 1, 0.7254902, 0, 1,
-1.194643, 0.2358469, -1.597231, 1, 0.7333333, 0, 1,
-1.191599, -0.1971671, -0.4643077, 1, 0.7372549, 0, 1,
-1.188608, -1.173409, -2.699824, 1, 0.7450981, 0, 1,
-1.177379, -0.2150153, -0.5762488, 1, 0.7490196, 0, 1,
-1.169003, 0.7935076, -1.846873, 1, 0.7568628, 0, 1,
-1.166448, 0.4003836, -1.596658, 1, 0.7607843, 0, 1,
-1.157258, 2.164361, -1.299185, 1, 0.7686275, 0, 1,
-1.155472, -0.9872425, -2.655438, 1, 0.772549, 0, 1,
-1.153583, -1.301345, 0.2219771, 1, 0.7803922, 0, 1,
-1.150133, 0.0457939, -1.566406, 1, 0.7843137, 0, 1,
-1.149897, -0.7496659, -2.501182, 1, 0.7921569, 0, 1,
-1.12893, 0.7880915, 0.5624571, 1, 0.7960784, 0, 1,
-1.127708, 1.151978, -0.5433403, 1, 0.8039216, 0, 1,
-1.125025, 0.9559311, -2.216965, 1, 0.8117647, 0, 1,
-1.117687, -0.08792946, -1.852271, 1, 0.8156863, 0, 1,
-1.115964, 0.2334009, -1.685388, 1, 0.8235294, 0, 1,
-1.110795, 0.5748007, -2.302169, 1, 0.827451, 0, 1,
-1.10897, -0.6442201, -1.927136, 1, 0.8352941, 0, 1,
-1.108097, 0.2636724, -1.224253, 1, 0.8392157, 0, 1,
-1.106222, -0.1135316, -1.303457, 1, 0.8470588, 0, 1,
-1.103166, -1.585533, -0.2822654, 1, 0.8509804, 0, 1,
-1.101907, -0.6325834, 0.286775, 1, 0.8588235, 0, 1,
-1.099175, -0.06662785, -1.182968, 1, 0.8627451, 0, 1,
-1.096872, 1.114816, -1.067392, 1, 0.8705882, 0, 1,
-1.096627, 1.387941, -0.813198, 1, 0.8745098, 0, 1,
-1.09318, -1.752681, -1.007423, 1, 0.8823529, 0, 1,
-1.091756, 0.2409723, -1.050629, 1, 0.8862745, 0, 1,
-1.090666, 0.3632405, -0.5444511, 1, 0.8941177, 0, 1,
-1.09012, -0.06030718, -1.990245, 1, 0.8980392, 0, 1,
-1.089006, -1.524403, -1.875591, 1, 0.9058824, 0, 1,
-1.080833, 2.907137, -0.82177, 1, 0.9137255, 0, 1,
-1.077621, 0.4040831, -1.683319, 1, 0.9176471, 0, 1,
-1.074635, 0.04925063, -1.831205, 1, 0.9254902, 0, 1,
-1.074441, -1.493411, -1.85584, 1, 0.9294118, 0, 1,
-1.073923, -0.08990183, -2.696322, 1, 0.9372549, 0, 1,
-1.070158, 1.098025, -0.883855, 1, 0.9411765, 0, 1,
-1.067176, -0.3104567, -2.006686, 1, 0.9490196, 0, 1,
-1.066655, 0.1343072, -1.214909, 1, 0.9529412, 0, 1,
-1.065218, 0.2788881, 1.120335, 1, 0.9607843, 0, 1,
-1.062923, 0.4289935, -0.7161355, 1, 0.9647059, 0, 1,
-1.056709, -0.1036474, -0.2472455, 1, 0.972549, 0, 1,
-1.052444, -0.9004328, -2.079105, 1, 0.9764706, 0, 1,
-1.052247, 1.190027, -0.8258384, 1, 0.9843137, 0, 1,
-1.048364, -0.2798304, -2.240635, 1, 0.9882353, 0, 1,
-1.037197, -0.9781474, -2.130468, 1, 0.9960784, 0, 1,
-1.034119, 1.458156, 0.1417134, 0.9960784, 1, 0, 1,
-1.028144, 0.3889606, -0.9244487, 0.9921569, 1, 0, 1,
-1.027706, 0.04876361, -1.329376, 0.9843137, 1, 0, 1,
-1.026028, -0.17904, -0.8271091, 0.9803922, 1, 0, 1,
-1.016213, 1.168339, -0.2764915, 0.972549, 1, 0, 1,
-1.016087, -0.4891644, -1.71999, 0.9686275, 1, 0, 1,
-1.015382, 0.2601242, 0.0008507799, 0.9607843, 1, 0, 1,
-1.011974, 0.299229, -0.962827, 0.9568627, 1, 0, 1,
-1.011243, -1.208546, -0.5266041, 0.9490196, 1, 0, 1,
-0.9946021, -1.146798, -3.399789, 0.945098, 1, 0, 1,
-0.9926935, -0.7108796, -2.171309, 0.9372549, 1, 0, 1,
-0.9865683, -0.4900735, -0.6313122, 0.9333333, 1, 0, 1,
-0.9832916, -0.3608952, -3.273527, 0.9254902, 1, 0, 1,
-0.9768835, -0.5107633, -2.846138, 0.9215686, 1, 0, 1,
-0.976025, -0.8625264, -2.88834, 0.9137255, 1, 0, 1,
-0.9706333, -0.6560984, -1.851159, 0.9098039, 1, 0, 1,
-0.9705061, 0.4407242, -0.7235788, 0.9019608, 1, 0, 1,
-0.9518484, 1.018608, -0.6119474, 0.8941177, 1, 0, 1,
-0.9453031, -0.2014515, -2.06136, 0.8901961, 1, 0, 1,
-0.9402607, 0.4892728, -1.396986, 0.8823529, 1, 0, 1,
-0.9377494, 2.692823, -0.9258116, 0.8784314, 1, 0, 1,
-0.937456, -0.2368235, -4.449053, 0.8705882, 1, 0, 1,
-0.9366932, 0.856132, -2.2411, 0.8666667, 1, 0, 1,
-0.9162518, -0.6036785, -2.742843, 0.8588235, 1, 0, 1,
-0.914149, 0.4583551, -1.100289, 0.854902, 1, 0, 1,
-0.9104804, 0.4621051, -1.514513, 0.8470588, 1, 0, 1,
-0.9098931, -0.3775854, -1.573519, 0.8431373, 1, 0, 1,
-0.9091424, 0.489479, -2.794021, 0.8352941, 1, 0, 1,
-0.8978683, 1.246085, 0.5880942, 0.8313726, 1, 0, 1,
-0.8933759, 1.500523, -0.2064551, 0.8235294, 1, 0, 1,
-0.8885715, 0.3952426, 0.1572664, 0.8196079, 1, 0, 1,
-0.8813074, 0.3514352, -0.6094999, 0.8117647, 1, 0, 1,
-0.8761486, 1.091726, -1.963606, 0.8078431, 1, 0, 1,
-0.875719, -0.8414968, -2.096529, 0.8, 1, 0, 1,
-0.8709342, -2.148719, 0.1361893, 0.7921569, 1, 0, 1,
-0.8698776, -0.5138891, -1.944876, 0.7882353, 1, 0, 1,
-0.8692119, -0.103705, -2.402429, 0.7803922, 1, 0, 1,
-0.8648043, -0.3033324, -0.9923264, 0.7764706, 1, 0, 1,
-0.8604538, -1.683228, -2.16229, 0.7686275, 1, 0, 1,
-0.8590275, 1.273184, -0.5562608, 0.7647059, 1, 0, 1,
-0.8525634, 1.83065, -1.361787, 0.7568628, 1, 0, 1,
-0.84426, 0.8097284, -1.263571, 0.7529412, 1, 0, 1,
-0.8442037, 1.115471, -1.565232, 0.7450981, 1, 0, 1,
-0.8424924, 0.8044464, 2.413407, 0.7411765, 1, 0, 1,
-0.8424739, 0.6799333, 0.23221, 0.7333333, 1, 0, 1,
-0.8413967, -0.8996512, -1.623787, 0.7294118, 1, 0, 1,
-0.839206, -1.131975, -2.410414, 0.7215686, 1, 0, 1,
-0.8322577, 0.9556886, -1.741172, 0.7176471, 1, 0, 1,
-0.8307768, 0.7142468, -1.463182, 0.7098039, 1, 0, 1,
-0.8221007, -0.5986148, -2.087881, 0.7058824, 1, 0, 1,
-0.8198526, -0.367716, -2.847789, 0.6980392, 1, 0, 1,
-0.8126258, 0.05578973, -1.36654, 0.6901961, 1, 0, 1,
-0.8024065, -0.3374054, -1.072788, 0.6862745, 1, 0, 1,
-0.8022211, -0.08785247, 0.8917328, 0.6784314, 1, 0, 1,
-0.7992504, 0.1796262, -3.63183, 0.6745098, 1, 0, 1,
-0.7966912, -0.3148447, -2.697701, 0.6666667, 1, 0, 1,
-0.7899085, 0.6382811, -0.4682167, 0.6627451, 1, 0, 1,
-0.7862189, -0.08770897, 0.4851694, 0.654902, 1, 0, 1,
-0.7857887, 0.7194444, -0.08100224, 0.6509804, 1, 0, 1,
-0.7851697, -0.7879522, -4.02721, 0.6431373, 1, 0, 1,
-0.7814485, -0.5777681, -0.6532047, 0.6392157, 1, 0, 1,
-0.778459, 0.3219688, -1.718326, 0.6313726, 1, 0, 1,
-0.7754516, -0.08731616, -0.557704, 0.627451, 1, 0, 1,
-0.7692357, -0.9954585, -3.694496, 0.6196079, 1, 0, 1,
-0.7662087, 0.7656596, -0.8842102, 0.6156863, 1, 0, 1,
-0.7639502, -1.042631, -2.278844, 0.6078432, 1, 0, 1,
-0.7622625, 0.08952226, -0.06111646, 0.6039216, 1, 0, 1,
-0.759045, 0.6861844, -2.003205, 0.5960785, 1, 0, 1,
-0.7544582, 1.307437, -0.9373472, 0.5882353, 1, 0, 1,
-0.7506913, 0.006197639, -0.3175152, 0.5843138, 1, 0, 1,
-0.7434511, 0.4385497, -0.03639695, 0.5764706, 1, 0, 1,
-0.7425847, 0.7069932, -1.03121, 0.572549, 1, 0, 1,
-0.7397105, 0.9938467, -1.556955, 0.5647059, 1, 0, 1,
-0.7381693, 0.9774308, 1.022984, 0.5607843, 1, 0, 1,
-0.7313331, 1.633333, -1.552779, 0.5529412, 1, 0, 1,
-0.7283105, -0.7478518, -2.952926, 0.5490196, 1, 0, 1,
-0.7258943, -0.01418809, -1.664092, 0.5411765, 1, 0, 1,
-0.7249363, -1.120993, -2.847823, 0.5372549, 1, 0, 1,
-0.7236259, 0.968103, -1.286075, 0.5294118, 1, 0, 1,
-0.7188814, 0.5987878, -0.7682534, 0.5254902, 1, 0, 1,
-0.7057469, 0.211597, -2.417792, 0.5176471, 1, 0, 1,
-0.7053471, -1.181226, -2.134645, 0.5137255, 1, 0, 1,
-0.7041309, 1.187223, -1.843174, 0.5058824, 1, 0, 1,
-0.6983023, 0.1726247, -0.6756213, 0.5019608, 1, 0, 1,
-0.6970794, 0.2320342, -0.2195599, 0.4941176, 1, 0, 1,
-0.6956981, 1.54915, -0.1056835, 0.4862745, 1, 0, 1,
-0.6955525, 1.400845, -2.661216, 0.4823529, 1, 0, 1,
-0.6916703, 1.205405, -1.13996, 0.4745098, 1, 0, 1,
-0.691132, -0.3324645, -2.02374, 0.4705882, 1, 0, 1,
-0.6900911, 2.107676, 0.5714205, 0.4627451, 1, 0, 1,
-0.690011, 0.2540512, -2.710382, 0.4588235, 1, 0, 1,
-0.6895143, 0.2781536, -1.195174, 0.4509804, 1, 0, 1,
-0.6881334, -1.422501, -2.635775, 0.4470588, 1, 0, 1,
-0.6868917, -1.155681, -4.101884, 0.4392157, 1, 0, 1,
-0.6829628, -0.5108049, -1.850421, 0.4352941, 1, 0, 1,
-0.6827292, -0.6505909, -1.478255, 0.427451, 1, 0, 1,
-0.6827175, 0.5133879, -1.356776, 0.4235294, 1, 0, 1,
-0.6750547, -0.4063295, -3.347422, 0.4156863, 1, 0, 1,
-0.6743396, 1.37204, 1.529744, 0.4117647, 1, 0, 1,
-0.6738082, -0.6478819, -4.390344, 0.4039216, 1, 0, 1,
-0.6730841, -1.420362, -1.884854, 0.3960784, 1, 0, 1,
-0.6692573, -0.6824146, -0.9069422, 0.3921569, 1, 0, 1,
-0.6661077, -1.18992, -4.584764, 0.3843137, 1, 0, 1,
-0.6620597, -1.101456, -3.843518, 0.3803922, 1, 0, 1,
-0.6578825, -0.1463427, -1.045585, 0.372549, 1, 0, 1,
-0.6577385, -0.5457532, -0.7282636, 0.3686275, 1, 0, 1,
-0.6553833, -0.1853697, -1.627469, 0.3607843, 1, 0, 1,
-0.6541803, 1.210565, 2.665814, 0.3568628, 1, 0, 1,
-0.6539356, -0.8549193, -1.45979, 0.3490196, 1, 0, 1,
-0.6534763, -0.664075, -2.47209, 0.345098, 1, 0, 1,
-0.653396, 1.779812, 0.9769006, 0.3372549, 1, 0, 1,
-0.6533434, 0.5487707, -2.646477, 0.3333333, 1, 0, 1,
-0.651028, 0.6313252, -0.06903227, 0.3254902, 1, 0, 1,
-0.6508156, 0.9913841, 0.9545339, 0.3215686, 1, 0, 1,
-0.6498508, 0.4400337, -1.534996, 0.3137255, 1, 0, 1,
-0.6490039, -0.6329033, -0.9158783, 0.3098039, 1, 0, 1,
-0.6399978, -0.2468133, -3.272312, 0.3019608, 1, 0, 1,
-0.6397706, 0.07022592, -2.441835, 0.2941177, 1, 0, 1,
-0.6374937, -0.3985038, -0.3374181, 0.2901961, 1, 0, 1,
-0.6324592, 0.05979576, -0.5691531, 0.282353, 1, 0, 1,
-0.6323751, -0.1873284, -0.517193, 0.2784314, 1, 0, 1,
-0.6167839, 0.2940555, -1.601931, 0.2705882, 1, 0, 1,
-0.6139657, 1.283043, -1.554281, 0.2666667, 1, 0, 1,
-0.6137849, -0.11316, -2.78112, 0.2588235, 1, 0, 1,
-0.6084654, -1.948596, -3.847261, 0.254902, 1, 0, 1,
-0.6064519, -1.914179, -3.409553, 0.2470588, 1, 0, 1,
-0.597195, -0.9484754, -0.8687844, 0.2431373, 1, 0, 1,
-0.5971164, 0.4778063, -0.009650333, 0.2352941, 1, 0, 1,
-0.5936688, -0.4354726, -1.142413, 0.2313726, 1, 0, 1,
-0.5899594, -0.435687, -1.723075, 0.2235294, 1, 0, 1,
-0.588833, 1.38748, -0.5248688, 0.2196078, 1, 0, 1,
-0.5870509, 0.2201569, -1.353837, 0.2117647, 1, 0, 1,
-0.5856209, 1.3645, 0.5704741, 0.2078431, 1, 0, 1,
-0.5798765, -0.9940357, -3.726913, 0.2, 1, 0, 1,
-0.5779307, 0.02146622, -2.157708, 0.1921569, 1, 0, 1,
-0.575504, 0.9925704, -0.4179198, 0.1882353, 1, 0, 1,
-0.5746704, 1.712057, -0.3483592, 0.1803922, 1, 0, 1,
-0.5670086, -0.725206, -1.685026, 0.1764706, 1, 0, 1,
-0.5637195, 0.2689702, -1.673443, 0.1686275, 1, 0, 1,
-0.5617747, -1.01798, -3.360516, 0.1647059, 1, 0, 1,
-0.5613609, -0.6361573, -2.846012, 0.1568628, 1, 0, 1,
-0.5549301, -0.215024, -2.428931, 0.1529412, 1, 0, 1,
-0.5538806, 0.07522923, 1.951727, 0.145098, 1, 0, 1,
-0.5515929, -0.7249067, -4.021666, 0.1411765, 1, 0, 1,
-0.551002, 0.4780419, -0.1169306, 0.1333333, 1, 0, 1,
-0.5477353, -0.6046753, -2.854562, 0.1294118, 1, 0, 1,
-0.5454992, 1.323545, 0.5434382, 0.1215686, 1, 0, 1,
-0.5454274, 0.6482021, -3.057222, 0.1176471, 1, 0, 1,
-0.5452582, -0.2522298, -1.498954, 0.1098039, 1, 0, 1,
-0.5451277, 0.04130515, -2.389265, 0.1058824, 1, 0, 1,
-0.5437529, 0.692263, -1.418619, 0.09803922, 1, 0, 1,
-0.5403888, -1.133549, -2.283679, 0.09019608, 1, 0, 1,
-0.5393983, 1.503885, -1.202435, 0.08627451, 1, 0, 1,
-0.5391542, 0.2194804, -2.552031, 0.07843138, 1, 0, 1,
-0.5358485, 0.5966847, -0.7766274, 0.07450981, 1, 0, 1,
-0.5353045, 1.046471, -1.040425, 0.06666667, 1, 0, 1,
-0.5324283, -0.07379185, -1.397678, 0.0627451, 1, 0, 1,
-0.53136, -0.7268261, -1.332145, 0.05490196, 1, 0, 1,
-0.5305567, 1.573808, -0.4173798, 0.05098039, 1, 0, 1,
-0.5188949, -0.05126676, -1.822444, 0.04313726, 1, 0, 1,
-0.5175682, -0.7538009, -1.271121, 0.03921569, 1, 0, 1,
-0.5151528, 1.162859, -0.4805216, 0.03137255, 1, 0, 1,
-0.5114535, 1.28601, 0.001485115, 0.02745098, 1, 0, 1,
-0.5090603, -0.8381677, -1.610651, 0.01960784, 1, 0, 1,
-0.5064118, -1.418952, -3.280649, 0.01568628, 1, 0, 1,
-0.5044973, -1.32821, -2.869523, 0.007843138, 1, 0, 1,
-0.5023458, -1.639244, -2.393596, 0.003921569, 1, 0, 1,
-0.4961913, 1.681471, -1.75109, 0, 1, 0.003921569, 1,
-0.4956212, 1.794017, -1.241808, 0, 1, 0.01176471, 1,
-0.4924586, -0.5663697, -2.805582, 0, 1, 0.01568628, 1,
-0.4897676, 0.3042752, -1.168775, 0, 1, 0.02352941, 1,
-0.4878478, 0.9597104, -3.120253, 0, 1, 0.02745098, 1,
-0.4860356, 0.1942178, -0.3981436, 0, 1, 0.03529412, 1,
-0.4847492, 1.576217, -1.694612, 0, 1, 0.03921569, 1,
-0.4833021, -0.1247649, -2.25128, 0, 1, 0.04705882, 1,
-0.4832546, 1.206061, -0.3158616, 0, 1, 0.05098039, 1,
-0.4758233, 0.3712451, -1.182038, 0, 1, 0.05882353, 1,
-0.4756505, 0.4222212, -2.762855, 0, 1, 0.0627451, 1,
-0.474628, 0.7226341, -1.74063, 0, 1, 0.07058824, 1,
-0.4704844, 0.2430491, -0.8332186, 0, 1, 0.07450981, 1,
-0.4688981, 0.4097434, -1.025592, 0, 1, 0.08235294, 1,
-0.4639915, 1.847965, -2.112119, 0, 1, 0.08627451, 1,
-0.4627866, 0.9462817, -1.34529, 0, 1, 0.09411765, 1,
-0.4623013, 1.499001, -1.59633, 0, 1, 0.1019608, 1,
-0.4561821, 0.7987322, 0.7646195, 0, 1, 0.1058824, 1,
-0.4519027, -0.9874107, -1.256676, 0, 1, 0.1137255, 1,
-0.4482293, -0.6921367, -0.231129, 0, 1, 0.1176471, 1,
-0.4476531, 1.050644, -1.443557, 0, 1, 0.1254902, 1,
-0.4449348, 0.9805561, -0.1148545, 0, 1, 0.1294118, 1,
-0.4432428, -0.7945893, -3.869929, 0, 1, 0.1372549, 1,
-0.4402272, 1.918834, -2.337332, 0, 1, 0.1411765, 1,
-0.440039, -0.04421972, -0.5463812, 0, 1, 0.1490196, 1,
-0.439395, 1.809078, -0.227429, 0, 1, 0.1529412, 1,
-0.4381507, -0.738118, -0.3043645, 0, 1, 0.1607843, 1,
-0.4367993, -0.2082529, -3.035403, 0, 1, 0.1647059, 1,
-0.4365511, 0.7548273, -1.96797, 0, 1, 0.172549, 1,
-0.4346895, -1.651973, -3.50044, 0, 1, 0.1764706, 1,
-0.4334998, 0.3603999, -2.187436, 0, 1, 0.1843137, 1,
-0.4289057, -0.1786565, -2.09373, 0, 1, 0.1882353, 1,
-0.4217398, 0.4856274, -3.245659, 0, 1, 0.1960784, 1,
-0.4211366, 0.05769743, -2.03433, 0, 1, 0.2039216, 1,
-0.4193397, 1.037696, 0.9460889, 0, 1, 0.2078431, 1,
-0.4096146, -0.5721263, -2.737981, 0, 1, 0.2156863, 1,
-0.4089861, 1.469567, 0.343508, 0, 1, 0.2196078, 1,
-0.398664, -0.4966487, -2.825216, 0, 1, 0.227451, 1,
-0.3982407, 0.8538802, -0.8633006, 0, 1, 0.2313726, 1,
-0.3944981, 1.987872, 0.1949333, 0, 1, 0.2392157, 1,
-0.3925637, -0.5965131, -3.123791, 0, 1, 0.2431373, 1,
-0.3907496, -0.6449703, -3.665062, 0, 1, 0.2509804, 1,
-0.3907117, 2.422533, 0.2434001, 0, 1, 0.254902, 1,
-0.3863538, 0.2291012, -0.3626033, 0, 1, 0.2627451, 1,
-0.3827782, -0.382477, -1.874233, 0, 1, 0.2666667, 1,
-0.3788635, 0.9077473, -1.19627, 0, 1, 0.2745098, 1,
-0.3775143, -1.474421, -3.847936, 0, 1, 0.2784314, 1,
-0.3690064, 0.4782813, -1.491284, 0, 1, 0.2862745, 1,
-0.3673847, 1.507301, 1.865013, 0, 1, 0.2901961, 1,
-0.3644487, 1.30547, -0.3108999, 0, 1, 0.2980392, 1,
-0.3643138, -2.000184, -1.514031, 0, 1, 0.3058824, 1,
-0.3602167, -1.474392, -3.070578, 0, 1, 0.3098039, 1,
-0.3588994, -0.6354204, -3.092037, 0, 1, 0.3176471, 1,
-0.3548712, -0.8564252, -1.9925, 0, 1, 0.3215686, 1,
-0.354328, -0.05786775, -2.337906, 0, 1, 0.3294118, 1,
-0.3531503, 1.095497, -0.4736528, 0, 1, 0.3333333, 1,
-0.3524149, -1.952541, -2.25282, 0, 1, 0.3411765, 1,
-0.3492396, -2.470059, -1.506291, 0, 1, 0.345098, 1,
-0.3449846, 0.4732134, -0.4200256, 0, 1, 0.3529412, 1,
-0.3412408, 0.8437075, -0.3039623, 0, 1, 0.3568628, 1,
-0.3405534, 0.1148419, -0.4776154, 0, 1, 0.3647059, 1,
-0.340017, -0.1588765, -1.68461, 0, 1, 0.3686275, 1,
-0.3395177, -0.427728, -2.541747, 0, 1, 0.3764706, 1,
-0.3395065, 0.04794214, -0.07791268, 0, 1, 0.3803922, 1,
-0.3391548, -1.874294, -3.154589, 0, 1, 0.3882353, 1,
-0.338661, -0.1358698, -3.443142, 0, 1, 0.3921569, 1,
-0.3373238, -1.073591, -2.298892, 0, 1, 0.4, 1,
-0.3331194, -1.900982, -2.295718, 0, 1, 0.4078431, 1,
-0.3290215, 0.874843, 0.4677404, 0, 1, 0.4117647, 1,
-0.3234055, 0.1326539, 0.07471189, 0, 1, 0.4196078, 1,
-0.3227625, 1.814401, -0.01313393, 0, 1, 0.4235294, 1,
-0.3217317, -0.6775976, -2.362155, 0, 1, 0.4313726, 1,
-0.3189087, -0.7021391, -1.320693, 0, 1, 0.4352941, 1,
-0.3172776, -0.1005646, -1.390667, 0, 1, 0.4431373, 1,
-0.3157131, -0.6679901, -3.338763, 0, 1, 0.4470588, 1,
-0.3137149, -0.2142544, -3.977689, 0, 1, 0.454902, 1,
-0.3114918, -0.04978681, -0.8539333, 0, 1, 0.4588235, 1,
-0.3098737, -1.727336, -4.081567, 0, 1, 0.4666667, 1,
-0.3088399, -0.3352067, -1.811454, 0, 1, 0.4705882, 1,
-0.2998745, -0.402708, -2.289377, 0, 1, 0.4784314, 1,
-0.2992484, 2.169877, -1.143999, 0, 1, 0.4823529, 1,
-0.2982178, 0.3091201, -1.344563, 0, 1, 0.4901961, 1,
-0.2981392, -1.389626, -4.204489, 0, 1, 0.4941176, 1,
-0.298138, -0.8863736, -2.473908, 0, 1, 0.5019608, 1,
-0.2961337, -0.7488903, -0.9942163, 0, 1, 0.509804, 1,
-0.2913229, 0.2010057, -1.98885, 0, 1, 0.5137255, 1,
-0.2833094, -0.5136271, -4.485287, 0, 1, 0.5215687, 1,
-0.2775224, -0.2635527, -1.826089, 0, 1, 0.5254902, 1,
-0.2729699, 1.17966, -1.446782, 0, 1, 0.5333334, 1,
-0.2695519, 1.21104, -1.255015, 0, 1, 0.5372549, 1,
-0.2676446, 0.3923729, -3.255786, 0, 1, 0.5450981, 1,
-0.2657198, -0.7871613, -2.943964, 0, 1, 0.5490196, 1,
-0.2615485, 0.91048, -1.249053, 0, 1, 0.5568628, 1,
-0.2496967, 0.7406273, -0.3046207, 0, 1, 0.5607843, 1,
-0.2466168, -1.186557, -2.561758, 0, 1, 0.5686275, 1,
-0.242137, 0.8424223, -0.2070958, 0, 1, 0.572549, 1,
-0.241763, -0.05499283, -1.855572, 0, 1, 0.5803922, 1,
-0.2380179, -0.1999287, -2.489559, 0, 1, 0.5843138, 1,
-0.2348881, -1.592806, -3.068631, 0, 1, 0.5921569, 1,
-0.2247281, 2.017695, -0.4323529, 0, 1, 0.5960785, 1,
-0.2172582, -0.9411921, -1.270401, 0, 1, 0.6039216, 1,
-0.2136208, 0.8571991, 0.2340388, 0, 1, 0.6117647, 1,
-0.2109385, 1.172389, 0.7433298, 0, 1, 0.6156863, 1,
-0.2103822, 2.406076, -0.7985557, 0, 1, 0.6235294, 1,
-0.2060618, -0.9123088, -2.542575, 0, 1, 0.627451, 1,
-0.2058256, 1.678937, -1.699903, 0, 1, 0.6352941, 1,
-0.2043044, -0.6968988, -1.488342, 0, 1, 0.6392157, 1,
-0.2038252, 0.2139322, -2.461072, 0, 1, 0.6470588, 1,
-0.2032729, -0.5178367, -3.2909, 0, 1, 0.6509804, 1,
-0.2006948, -2.65201, -3.761757, 0, 1, 0.6588235, 1,
-0.2004451, -0.3133031, -4.078602, 0, 1, 0.6627451, 1,
-0.1965813, 1.011418, 0.6543592, 0, 1, 0.6705883, 1,
-0.1913633, 0.3090431, 0.2954026, 0, 1, 0.6745098, 1,
-0.1880706, -0.1554797, -2.032845, 0, 1, 0.682353, 1,
-0.1873938, -1.401, -1.543909, 0, 1, 0.6862745, 1,
-0.1849088, 0.06443105, -0.5304328, 0, 1, 0.6941177, 1,
-0.1777355, -1.658969, -3.509723, 0, 1, 0.7019608, 1,
-0.1753798, -0.753203, -3.63224, 0, 1, 0.7058824, 1,
-0.1746869, 0.9508871, -0.8376213, 0, 1, 0.7137255, 1,
-0.1702734, 0.1535808, -1.151631, 0, 1, 0.7176471, 1,
-0.1692835, 0.9020724, -2.224959, 0, 1, 0.7254902, 1,
-0.1590378, 0.236717, 1.702834, 0, 1, 0.7294118, 1,
-0.1582188, 0.03673086, -0.8309194, 0, 1, 0.7372549, 1,
-0.1581076, -1.160487, -1.252657, 0, 1, 0.7411765, 1,
-0.1551948, -0.03436671, -2.785973, 0, 1, 0.7490196, 1,
-0.1502392, -1.074611, -3.046403, 0, 1, 0.7529412, 1,
-0.1466332, 0.5299471, -0.2002499, 0, 1, 0.7607843, 1,
-0.1413382, 0.791907, -1.120047, 0, 1, 0.7647059, 1,
-0.1412463, -0.3165469, -2.696928, 0, 1, 0.772549, 1,
-0.136846, -0.3487357, -3.074938, 0, 1, 0.7764706, 1,
-0.1308989, -0.3332027, -2.032664, 0, 1, 0.7843137, 1,
-0.1273663, 1.892578, -0.6373826, 0, 1, 0.7882353, 1,
-0.1273044, -0.2100335, -1.453675, 0, 1, 0.7960784, 1,
-0.1248375, 0.2563212, -1.423213, 0, 1, 0.8039216, 1,
-0.1209933, -0.460451, -1.4987, 0, 1, 0.8078431, 1,
-0.1128095, 0.493209, 0.9212813, 0, 1, 0.8156863, 1,
-0.112155, 0.3827114, 0.07535929, 0, 1, 0.8196079, 1,
-0.1089493, 0.2487831, 0.552981, 0, 1, 0.827451, 1,
-0.1080542, -0.5041699, -2.471715, 0, 1, 0.8313726, 1,
-0.1032417, 1.47409, -0.2495489, 0, 1, 0.8392157, 1,
-0.1002995, -0.1239074, -2.067902, 0, 1, 0.8431373, 1,
-0.09964038, -0.6153476, -1.818085, 0, 1, 0.8509804, 1,
-0.09766416, 1.142685, -2.918932, 0, 1, 0.854902, 1,
-0.09665005, 1.573686, 0.2363771, 0, 1, 0.8627451, 1,
-0.09421062, -1.570481, -2.741, 0, 1, 0.8666667, 1,
-0.09234385, 0.2696369, -1.005284, 0, 1, 0.8745098, 1,
-0.09207267, 2.297351, -0.1302654, 0, 1, 0.8784314, 1,
-0.09035988, 0.4103136, 0.783329, 0, 1, 0.8862745, 1,
-0.08642658, -0.8592585, -2.761787, 0, 1, 0.8901961, 1,
-0.08476052, -0.799958, -2.914917, 0, 1, 0.8980392, 1,
-0.07948209, 1.460567, -1.206819, 0, 1, 0.9058824, 1,
-0.07690633, 0.3173224, 0.1719373, 0, 1, 0.9098039, 1,
-0.07518772, 1.852693, -0.5317843, 0, 1, 0.9176471, 1,
-0.06685393, -0.4190508, -0.5089471, 0, 1, 0.9215686, 1,
-0.06159489, 0.6956581, 0.8655142, 0, 1, 0.9294118, 1,
-0.0604222, 1.095526, 0.6501291, 0, 1, 0.9333333, 1,
-0.05643798, 1.096915, -0.4702069, 0, 1, 0.9411765, 1,
-0.05488805, 0.5625406, 0.40603, 0, 1, 0.945098, 1,
-0.05474574, 0.9527353, -1.766309, 0, 1, 0.9529412, 1,
-0.05125359, -0.7222972, -2.843086, 0, 1, 0.9568627, 1,
-0.05118384, -0.8937499, -4.3387, 0, 1, 0.9647059, 1,
-0.04350003, -0.4562939, -1.772256, 0, 1, 0.9686275, 1,
-0.04165825, 0.2539401, 1.464703, 0, 1, 0.9764706, 1,
-0.03734432, 0.1198218, -2.239206, 0, 1, 0.9803922, 1,
-0.03674688, 1.318667, -1.441132, 0, 1, 0.9882353, 1,
-0.03657492, 1.710479, -0.5332409, 0, 1, 0.9921569, 1,
-0.02131465, 1.373964, -1.345776, 0, 1, 1, 1,
-0.01962498, 2.650833, -1.156075, 0, 0.9921569, 1, 1,
-0.01821101, 0.3102874, 0.7019904, 0, 0.9882353, 1, 1,
-0.01676216, 0.4907875, -0.3850183, 0, 0.9803922, 1, 1,
-0.01559525, 0.3821184, -0.7914959, 0, 0.9764706, 1, 1,
-0.01408436, 0.9383884, 0.7480783, 0, 0.9686275, 1, 1,
-0.01112303, -2.027411, -4.063838, 0, 0.9647059, 1, 1,
-0.007547829, 0.710315, -1.492466, 0, 0.9568627, 1, 1,
-0.001610685, -0.8732648, -1.988168, 0, 0.9529412, 1, 1,
0.001334094, 0.1846856, 0.906665, 0, 0.945098, 1, 1,
0.00353073, -0.9965298, 3.206038, 0, 0.9411765, 1, 1,
0.004170027, 1.035802, 0.0682137, 0, 0.9333333, 1, 1,
0.004916153, 0.3251604, 0.9279929, 0, 0.9294118, 1, 1,
0.01436821, -0.5860705, 3.486601, 0, 0.9215686, 1, 1,
0.01457943, 0.9894865, 0.9931865, 0, 0.9176471, 1, 1,
0.0149187, -0.6371045, 2.512581, 0, 0.9098039, 1, 1,
0.01997307, -0.891663, 1.589196, 0, 0.9058824, 1, 1,
0.02091519, 1.349198, -1.123102, 0, 0.8980392, 1, 1,
0.02274842, 0.1197674, -0.7894948, 0, 0.8901961, 1, 1,
0.02834084, -2.298835, 3.915944, 0, 0.8862745, 1, 1,
0.0284858, 2.597564, 0.6733363, 0, 0.8784314, 1, 1,
0.02959891, 0.2103108, 0.4699841, 0, 0.8745098, 1, 1,
0.02963516, 0.4361435, 0.5573317, 0, 0.8666667, 1, 1,
0.03164232, 0.09739264, 0.8377366, 0, 0.8627451, 1, 1,
0.03240867, -0.5959305, 2.994078, 0, 0.854902, 1, 1,
0.03430593, -1.571776, 3.422987, 0, 0.8509804, 1, 1,
0.03546046, 0.9862121, 0.3176204, 0, 0.8431373, 1, 1,
0.03801997, -1.603563, 2.959448, 0, 0.8392157, 1, 1,
0.03936454, -1.144217, 3.293248, 0, 0.8313726, 1, 1,
0.04908953, -0.4247582, 2.624433, 0, 0.827451, 1, 1,
0.04968388, -1.371272, 2.49076, 0, 0.8196079, 1, 1,
0.05019149, 2.213037, 0.02892783, 0, 0.8156863, 1, 1,
0.05664179, 0.7007008, -0.3520004, 0, 0.8078431, 1, 1,
0.05906244, -0.7151952, 3.836935, 0, 0.8039216, 1, 1,
0.06088188, 0.7542949, -0.2771153, 0, 0.7960784, 1, 1,
0.06525725, 0.6217084, 1.134675, 0, 0.7882353, 1, 1,
0.06727403, -0.7114329, 4.965266, 0, 0.7843137, 1, 1,
0.06934947, -0.4466535, 2.461339, 0, 0.7764706, 1, 1,
0.06995156, 1.467804, 1.930303, 0, 0.772549, 1, 1,
0.07191805, 1.392421, 0.486356, 0, 0.7647059, 1, 1,
0.0758072, -0.7925916, 2.64964, 0, 0.7607843, 1, 1,
0.07905255, -0.004684751, 0.823405, 0, 0.7529412, 1, 1,
0.08103085, -0.009290008, 2.637498, 0, 0.7490196, 1, 1,
0.08829857, -1.163234, 0.9740359, 0, 0.7411765, 1, 1,
0.09319948, 0.2590425, -0.8029543, 0, 0.7372549, 1, 1,
0.101694, -0.3214457, 4.249401, 0, 0.7294118, 1, 1,
0.1026467, -0.2157144, 2.833157, 0, 0.7254902, 1, 1,
0.1031307, -0.02657866, 3.448578, 0, 0.7176471, 1, 1,
0.1057604, -0.1151167, 3.139246, 0, 0.7137255, 1, 1,
0.1081493, 1.146937, -0.1354169, 0, 0.7058824, 1, 1,
0.116566, -1.426822, 2.686853, 0, 0.6980392, 1, 1,
0.1176232, 1.132611, 0.09942953, 0, 0.6941177, 1, 1,
0.1177211, 0.1576192, 1.308352, 0, 0.6862745, 1, 1,
0.1198242, -0.1484121, 1.837021, 0, 0.682353, 1, 1,
0.123262, -0.3860424, 4.403598, 0, 0.6745098, 1, 1,
0.1283711, -2.369653, 3.656751, 0, 0.6705883, 1, 1,
0.1317206, -0.01459529, 1.264325, 0, 0.6627451, 1, 1,
0.132176, -0.3703244, 3.554102, 0, 0.6588235, 1, 1,
0.1391203, 0.5734246, -0.3901911, 0, 0.6509804, 1, 1,
0.1397965, -0.1941757, 2.901886, 0, 0.6470588, 1, 1,
0.1402327, -0.9419681, 2.242913, 0, 0.6392157, 1, 1,
0.1426004, 0.5247477, -1.047539, 0, 0.6352941, 1, 1,
0.1441548, -0.03245593, 2.471726, 0, 0.627451, 1, 1,
0.1444825, 0.3057558, 0.9997278, 0, 0.6235294, 1, 1,
0.1467278, 2.139617, 0.03384397, 0, 0.6156863, 1, 1,
0.1503756, 1.484349, -0.7748982, 0, 0.6117647, 1, 1,
0.1514451, -0.3755524, 3.036838, 0, 0.6039216, 1, 1,
0.1521181, 0.2061017, 0.8063274, 0, 0.5960785, 1, 1,
0.1537087, -1.009622, 3.371484, 0, 0.5921569, 1, 1,
0.1559103, -0.3599769, 1.912395, 0, 0.5843138, 1, 1,
0.1560738, 0.08083285, 1.566744, 0, 0.5803922, 1, 1,
0.1583122, -0.01269934, -0.000696941, 0, 0.572549, 1, 1,
0.160653, 0.1890618, 0.4660915, 0, 0.5686275, 1, 1,
0.1615221, 1.199135, 0.2751566, 0, 0.5607843, 1, 1,
0.1625149, 1.297106, -1.303446, 0, 0.5568628, 1, 1,
0.1667825, -1.000512, 2.304139, 0, 0.5490196, 1, 1,
0.1685439, -1.770949, 2.820703, 0, 0.5450981, 1, 1,
0.1716129, -0.1766361, 2.247274, 0, 0.5372549, 1, 1,
0.1772737, 0.08719121, 1.810739, 0, 0.5333334, 1, 1,
0.1821788, -1.672974, 3.867376, 0, 0.5254902, 1, 1,
0.1842378, -0.7047949, 1.705168, 0, 0.5215687, 1, 1,
0.1880519, -1.018188, 2.632565, 0, 0.5137255, 1, 1,
0.1919648, 0.2445744, 0.999225, 0, 0.509804, 1, 1,
0.193228, 0.1299824, 0.6857201, 0, 0.5019608, 1, 1,
0.1962946, -0.9935771, 3.483005, 0, 0.4941176, 1, 1,
0.1992874, 2.986904, 1.205639, 0, 0.4901961, 1, 1,
0.2001642, -1.001174, 3.617459, 0, 0.4823529, 1, 1,
0.2036276, 0.5559813, 0.8345325, 0, 0.4784314, 1, 1,
0.2054717, 0.8884844, -0.7376872, 0, 0.4705882, 1, 1,
0.2187038, 1.130072, -0.1006102, 0, 0.4666667, 1, 1,
0.2244093, -0.8842372, 2.737713, 0, 0.4588235, 1, 1,
0.2280305, -1.225091, 3.508824, 0, 0.454902, 1, 1,
0.22988, -0.5228386, 0.4339286, 0, 0.4470588, 1, 1,
0.2311888, 0.2099225, 2.016856, 0, 0.4431373, 1, 1,
0.2312671, -2.79674, 2.460446, 0, 0.4352941, 1, 1,
0.232716, -0.4776581, 3.014549, 0, 0.4313726, 1, 1,
0.2428551, -0.4244308, 1.272323, 0, 0.4235294, 1, 1,
0.2502748, -1.196054, 4.418222, 0, 0.4196078, 1, 1,
0.2506616, 0.6399094, 1.062546, 0, 0.4117647, 1, 1,
0.2572415, 1.976077, 0.01058297, 0, 0.4078431, 1, 1,
0.2583097, -0.7730995, 2.852041, 0, 0.4, 1, 1,
0.2637649, 1.754, -2.1937, 0, 0.3921569, 1, 1,
0.2671252, 0.6774952, 0.799413, 0, 0.3882353, 1, 1,
0.2685028, -0.8881543, 3.379217, 0, 0.3803922, 1, 1,
0.2722878, -0.3102829, 0.8860856, 0, 0.3764706, 1, 1,
0.2774743, -0.2168781, 1.910417, 0, 0.3686275, 1, 1,
0.2790357, 0.05361428, 1.390695, 0, 0.3647059, 1, 1,
0.279459, -0.3591883, 1.241578, 0, 0.3568628, 1, 1,
0.2863986, -0.5125629, 0.8741015, 0, 0.3529412, 1, 1,
0.2894854, -0.7164072, 3.754893, 0, 0.345098, 1, 1,
0.2897053, -0.8934366, 3.158447, 0, 0.3411765, 1, 1,
0.2899889, -0.5308455, 2.477891, 0, 0.3333333, 1, 1,
0.2901613, -1.168527, 4.027645, 0, 0.3294118, 1, 1,
0.2914253, -0.3157269, 2.718678, 0, 0.3215686, 1, 1,
0.2916954, -0.003935051, 3.233048, 0, 0.3176471, 1, 1,
0.2949394, 1.35471, -0.7087985, 0, 0.3098039, 1, 1,
0.2962882, -0.09258578, 1.696727, 0, 0.3058824, 1, 1,
0.2978292, 1.872524, 1.626523, 0, 0.2980392, 1, 1,
0.3020394, -0.5771962, 2.361969, 0, 0.2901961, 1, 1,
0.3037792, -0.6366723, 4.015809, 0, 0.2862745, 1, 1,
0.303983, 0.8907467, 1.169879, 0, 0.2784314, 1, 1,
0.3041158, -1.328434, 2.51234, 0, 0.2745098, 1, 1,
0.3050869, 2.53423, 0.4154412, 0, 0.2666667, 1, 1,
0.3061664, -0.1673109, 1.766842, 0, 0.2627451, 1, 1,
0.3071529, 1.062376, 0.4932064, 0, 0.254902, 1, 1,
0.3122348, 0.1549353, 2.127539, 0, 0.2509804, 1, 1,
0.31599, -0.6600939, 1.347215, 0, 0.2431373, 1, 1,
0.3164457, -0.4402192, 4.03628, 0, 0.2392157, 1, 1,
0.3174416, 0.7424737, -0.03952704, 0, 0.2313726, 1, 1,
0.3179377, 1.422276, 0.2406653, 0, 0.227451, 1, 1,
0.3201039, 0.1541853, 1.556525, 0, 0.2196078, 1, 1,
0.3245738, -0.6424502, 2.985351, 0, 0.2156863, 1, 1,
0.3248431, -0.860956, 2.335025, 0, 0.2078431, 1, 1,
0.3259323, -1.139607, 1.395478, 0, 0.2039216, 1, 1,
0.3330269, -0.7130038, 2.755938, 0, 0.1960784, 1, 1,
0.3364178, 1.123605, 0.8597774, 0, 0.1882353, 1, 1,
0.3369296, -1.352147, 1.971885, 0, 0.1843137, 1, 1,
0.3383466, 1.850296, -0.09313882, 0, 0.1764706, 1, 1,
0.3389772, 0.2662173, 0.2341301, 0, 0.172549, 1, 1,
0.3412039, 1.156199, -0.8603354, 0, 0.1647059, 1, 1,
0.341397, -1.245087, 2.169146, 0, 0.1607843, 1, 1,
0.3448115, 0.5137586, 1.053068, 0, 0.1529412, 1, 1,
0.3480181, -1.524002, 3.752771, 0, 0.1490196, 1, 1,
0.3496587, 0.7879377, -0.916837, 0, 0.1411765, 1, 1,
0.3544375, -0.810546, 2.880701, 0, 0.1372549, 1, 1,
0.35574, 0.5949939, 1.159569, 0, 0.1294118, 1, 1,
0.3586507, 0.5995419, -0.6188923, 0, 0.1254902, 1, 1,
0.3628168, -0.9701972, 3.370017, 0, 0.1176471, 1, 1,
0.3653667, 1.403108, -0.1004526, 0, 0.1137255, 1, 1,
0.3683461, -3.050467, 2.733492, 0, 0.1058824, 1, 1,
0.3687973, -0.6610341, 2.945334, 0, 0.09803922, 1, 1,
0.3690315, 0.4463228, -0.6602946, 0, 0.09411765, 1, 1,
0.371268, -1.147143, 2.501596, 0, 0.08627451, 1, 1,
0.3717229, -0.450368, 2.205842, 0, 0.08235294, 1, 1,
0.3722394, 0.5203884, 0.5518353, 0, 0.07450981, 1, 1,
0.373605, 0.4788282, 1.453186, 0, 0.07058824, 1, 1,
0.3737216, 0.7767882, 0.9488897, 0, 0.0627451, 1, 1,
0.3748354, 1.052917, 0.1221155, 0, 0.05882353, 1, 1,
0.3760364, 0.6731708, 0.3909098, 0, 0.05098039, 1, 1,
0.3813936, -0.2301228, 1.340159, 0, 0.04705882, 1, 1,
0.3885074, -1.584929, 1.01502, 0, 0.03921569, 1, 1,
0.3888713, -0.1752454, 3.203122, 0, 0.03529412, 1, 1,
0.3892654, 0.2167415, -0.3006641, 0, 0.02745098, 1, 1,
0.3919989, -2.617506, 4.615379, 0, 0.02352941, 1, 1,
0.3953937, -0.4059802, 3.77221, 0, 0.01568628, 1, 1,
0.3959886, -0.1625096, 0.5809515, 0, 0.01176471, 1, 1,
0.398953, 0.7532504, 1.541313, 0, 0.003921569, 1, 1,
0.3990208, 0.5123542, 1.147248, 0.003921569, 0, 1, 1,
0.3997542, -1.835516, 5.311728, 0.007843138, 0, 1, 1,
0.4024583, 0.5323232, 1.236477, 0.01568628, 0, 1, 1,
0.4027362, 0.3090077, 0.135335, 0.01960784, 0, 1, 1,
0.4066374, -0.9231406, 2.968701, 0.02745098, 0, 1, 1,
0.4071107, 0.273022, 1.374237, 0.03137255, 0, 1, 1,
0.4075551, -0.4554463, 3.799912, 0.03921569, 0, 1, 1,
0.4086222, 0.1092219, 0.8842227, 0.04313726, 0, 1, 1,
0.4092301, 0.7645798, -3.0358, 0.05098039, 0, 1, 1,
0.4108295, 1.351055, 0.227741, 0.05490196, 0, 1, 1,
0.4166699, 2.182404, -0.04323557, 0.0627451, 0, 1, 1,
0.4172479, -0.287293, 3.709983, 0.06666667, 0, 1, 1,
0.4174335, 0.1930679, 0.426726, 0.07450981, 0, 1, 1,
0.4178898, 0.7213587, 1.105625, 0.07843138, 0, 1, 1,
0.4232826, -0.6533847, 1.438885, 0.08627451, 0, 1, 1,
0.4272522, 0.1892324, 1.815386, 0.09019608, 0, 1, 1,
0.427857, -0.3841628, 1.503378, 0.09803922, 0, 1, 1,
0.4310228, 1.372848, -0.4146766, 0.1058824, 0, 1, 1,
0.4321966, 0.6921089, 2.559994, 0.1098039, 0, 1, 1,
0.4352256, -0.2511124, 3.247296, 0.1176471, 0, 1, 1,
0.4354433, -0.8442417, 3.85544, 0.1215686, 0, 1, 1,
0.4354592, -0.2960659, 2.032633, 0.1294118, 0, 1, 1,
0.4376436, 0.8032788, 1.191371, 0.1333333, 0, 1, 1,
0.4390745, 0.3267489, 1.537531, 0.1411765, 0, 1, 1,
0.441501, 1.171902, 1.211793, 0.145098, 0, 1, 1,
0.4424422, 1.172029, 0.660826, 0.1529412, 0, 1, 1,
0.4447721, 0.2626427, 2.700773, 0.1568628, 0, 1, 1,
0.4518442, -0.3459176, 2.855965, 0.1647059, 0, 1, 1,
0.4567651, 0.8096069, 0.9251286, 0.1686275, 0, 1, 1,
0.4590294, 0.8190946, 0.2329199, 0.1764706, 0, 1, 1,
0.4654899, -1.739478, 2.854003, 0.1803922, 0, 1, 1,
0.4660054, -0.1202642, 2.207566, 0.1882353, 0, 1, 1,
0.4681064, -1.80457, 3.615313, 0.1921569, 0, 1, 1,
0.4701467, 1.492656, 1.246487, 0.2, 0, 1, 1,
0.4736584, -0.4639121, 2.677356, 0.2078431, 0, 1, 1,
0.4745297, -0.3903259, 2.683302, 0.2117647, 0, 1, 1,
0.4770344, -0.8508658, 2.446847, 0.2196078, 0, 1, 1,
0.4780189, 0.5922581, -0.5218849, 0.2235294, 0, 1, 1,
0.4805256, 0.4721356, 0.4087744, 0.2313726, 0, 1, 1,
0.4807904, 0.6622853, 1.015, 0.2352941, 0, 1, 1,
0.4836036, 0.5193402, 1.358573, 0.2431373, 0, 1, 1,
0.4873913, 1.910926, 0.003965918, 0.2470588, 0, 1, 1,
0.4984588, -0.4819748, 1.692535, 0.254902, 0, 1, 1,
0.5047249, -0.2398443, 2.419829, 0.2588235, 0, 1, 1,
0.5068913, 1.041227, -0.5719166, 0.2666667, 0, 1, 1,
0.5069016, 0.6136702, 0.695192, 0.2705882, 0, 1, 1,
0.50809, -0.3471782, 2.295712, 0.2784314, 0, 1, 1,
0.5103392, 0.1198292, 4.414279, 0.282353, 0, 1, 1,
0.5119409, -1.342224, 2.980113, 0.2901961, 0, 1, 1,
0.5136459, -0.7655321, 0.8569537, 0.2941177, 0, 1, 1,
0.5202448, -1.384585, 3.559939, 0.3019608, 0, 1, 1,
0.5222561, 0.2461618, 2.043216, 0.3098039, 0, 1, 1,
0.5266978, -0.1329663, 2.263074, 0.3137255, 0, 1, 1,
0.5309851, -0.6687505, 0.8270975, 0.3215686, 0, 1, 1,
0.5324988, 0.4524547, 2.673417, 0.3254902, 0, 1, 1,
0.5384342, 0.2606623, 2.244076, 0.3333333, 0, 1, 1,
0.5396155, 0.7032824, 0.6034223, 0.3372549, 0, 1, 1,
0.5466823, -0.003079417, 0.993253, 0.345098, 0, 1, 1,
0.5503119, 0.858876, -0.4956874, 0.3490196, 0, 1, 1,
0.5580068, 1.513959, 0.06887523, 0.3568628, 0, 1, 1,
0.5591301, -0.04572, 2.813541, 0.3607843, 0, 1, 1,
0.5621415, 1.315696, 0.323132, 0.3686275, 0, 1, 1,
0.5634614, -0.902517, 3.639135, 0.372549, 0, 1, 1,
0.5711752, 1.225014, 1.467481, 0.3803922, 0, 1, 1,
0.5758504, -0.6205125, 2.938762, 0.3843137, 0, 1, 1,
0.5766831, -1.099862, 2.169245, 0.3921569, 0, 1, 1,
0.577301, 0.5540926, 2.2892, 0.3960784, 0, 1, 1,
0.5835887, 0.0237859, 0.5685135, 0.4039216, 0, 1, 1,
0.5865431, -0.1784582, 0.4280066, 0.4117647, 0, 1, 1,
0.5921484, 0.3539866, 0.6846693, 0.4156863, 0, 1, 1,
0.594865, 0.6961196, 0.8117735, 0.4235294, 0, 1, 1,
0.5960972, -1.420063, 2.456733, 0.427451, 0, 1, 1,
0.5991952, 0.1492018, 2.051451, 0.4352941, 0, 1, 1,
0.601658, 0.06340478, 1.079176, 0.4392157, 0, 1, 1,
0.6023242, -0.1485882, -0.2545563, 0.4470588, 0, 1, 1,
0.6023521, 0.1056216, -0.6352579, 0.4509804, 0, 1, 1,
0.6040293, 0.6742083, -0.1319291, 0.4588235, 0, 1, 1,
0.6144845, 0.0200815, 2.476523, 0.4627451, 0, 1, 1,
0.6154705, 0.4368437, 1.942284, 0.4705882, 0, 1, 1,
0.6156365, -0.405253, 1.838433, 0.4745098, 0, 1, 1,
0.6166083, 0.6806031, 0.4222876, 0.4823529, 0, 1, 1,
0.6201524, 1.046743, -0.1267022, 0.4862745, 0, 1, 1,
0.6204851, 1.544818, 0.7214823, 0.4941176, 0, 1, 1,
0.6206591, 0.8666523, 1.849257, 0.5019608, 0, 1, 1,
0.6213731, -0.8392607, 2.930242, 0.5058824, 0, 1, 1,
0.6225975, -0.5259529, 2.043696, 0.5137255, 0, 1, 1,
0.6244594, -0.2383545, 0.8564076, 0.5176471, 0, 1, 1,
0.6276953, 0.6769926, 0.481381, 0.5254902, 0, 1, 1,
0.6299639, 0.4044225, 0.04698905, 0.5294118, 0, 1, 1,
0.6303552, -1.057773, 1.124936, 0.5372549, 0, 1, 1,
0.6312959, 1.790322, 1.155896, 0.5411765, 0, 1, 1,
0.631429, -0.4411497, 1.145891, 0.5490196, 0, 1, 1,
0.632286, 0.1860858, 1.075309, 0.5529412, 0, 1, 1,
0.6334922, 0.01523039, 2.10584, 0.5607843, 0, 1, 1,
0.6359733, -1.894963, 2.884191, 0.5647059, 0, 1, 1,
0.6392844, 1.77227, -1.188722, 0.572549, 0, 1, 1,
0.6395048, 1.1346, 1.023508, 0.5764706, 0, 1, 1,
0.6401871, 3.543363, 1.196002, 0.5843138, 0, 1, 1,
0.6414514, 1.51851, 0.7361377, 0.5882353, 0, 1, 1,
0.6535605, 0.736535, -0.1613313, 0.5960785, 0, 1, 1,
0.6541504, -1.761267, 3.869804, 0.6039216, 0, 1, 1,
0.6559094, 2.52106, -0.7122624, 0.6078432, 0, 1, 1,
0.6563873, 0.3962312, 1.80788, 0.6156863, 0, 1, 1,
0.6587236, 0.2711113, 1.982196, 0.6196079, 0, 1, 1,
0.6588537, 1.814195, -0.9909385, 0.627451, 0, 1, 1,
0.6659965, -0.5686091, 2.118707, 0.6313726, 0, 1, 1,
0.6691154, -0.1532335, 3.271514, 0.6392157, 0, 1, 1,
0.6705226, 0.4102415, 2.140495, 0.6431373, 0, 1, 1,
0.6744389, 0.6000122, 0.02387731, 0.6509804, 0, 1, 1,
0.6749212, -0.7174637, 4.746117, 0.654902, 0, 1, 1,
0.6778422, 0.02728578, -0.03948047, 0.6627451, 0, 1, 1,
0.6797013, -0.507936, 2.864429, 0.6666667, 0, 1, 1,
0.6819718, 0.3966718, 1.24269, 0.6745098, 0, 1, 1,
0.6883774, 1.517273, 0.3405308, 0.6784314, 0, 1, 1,
0.7034903, 1.406275, 0.7506669, 0.6862745, 0, 1, 1,
0.7168549, 1.433165, 1.661021, 0.6901961, 0, 1, 1,
0.7202864, -0.09253379, 1.343992, 0.6980392, 0, 1, 1,
0.7288107, -0.08660838, 2.091164, 0.7058824, 0, 1, 1,
0.7362791, -0.4115947, 3.803697, 0.7098039, 0, 1, 1,
0.7384974, -0.5086468, 1.772499, 0.7176471, 0, 1, 1,
0.7397932, -0.4398861, 3.287795, 0.7215686, 0, 1, 1,
0.7408012, -0.4799317, 2.557992, 0.7294118, 0, 1, 1,
0.7458193, -0.4074516, 1.872418, 0.7333333, 0, 1, 1,
0.7460164, -0.3163024, 5.367791, 0.7411765, 0, 1, 1,
0.749004, 0.340475, 2.029249, 0.7450981, 0, 1, 1,
0.7513572, -0.3186499, 2.45612, 0.7529412, 0, 1, 1,
0.7540779, 2.459026, 1.562091, 0.7568628, 0, 1, 1,
0.7647128, -0.1169391, 3.726409, 0.7647059, 0, 1, 1,
0.7661486, -0.5911036, 2.206186, 0.7686275, 0, 1, 1,
0.7694314, -0.7770852, 0.08674997, 0.7764706, 0, 1, 1,
0.7694799, -0.6796986, 1.274301, 0.7803922, 0, 1, 1,
0.7696438, 1.231003, 0.6967504, 0.7882353, 0, 1, 1,
0.7746017, 1.576219, 0.9536301, 0.7921569, 0, 1, 1,
0.7760013, -1.958215, 2.669464, 0.8, 0, 1, 1,
0.7760138, 1.064989, 2.701297, 0.8078431, 0, 1, 1,
0.7800472, -0.9430839, 1.797784, 0.8117647, 0, 1, 1,
0.7839862, 0.4238481, -0.3917223, 0.8196079, 0, 1, 1,
0.7863338, 0.7825159, -0.08473445, 0.8235294, 0, 1, 1,
0.7894425, -0.3111293, 1.847614, 0.8313726, 0, 1, 1,
0.7937528, -0.1877854, 0.8010042, 0.8352941, 0, 1, 1,
0.794189, 0.2592641, -0.09558932, 0.8431373, 0, 1, 1,
0.7947076, -0.2236977, 2.109333, 0.8470588, 0, 1, 1,
0.7996129, -0.6237057, 1.371698, 0.854902, 0, 1, 1,
0.8134727, 0.9008911, -1.077531, 0.8588235, 0, 1, 1,
0.831967, -0.3460978, 3.077655, 0.8666667, 0, 1, 1,
0.8368377, 0.927761, 0.05211907, 0.8705882, 0, 1, 1,
0.8385329, -0.6829833, 0.1078573, 0.8784314, 0, 1, 1,
0.8394455, -0.8262964, 2.92551, 0.8823529, 0, 1, 1,
0.8454232, 1.286907, 1.585474, 0.8901961, 0, 1, 1,
0.8457572, -1.618714, 2.732619, 0.8941177, 0, 1, 1,
0.8478891, -0.2724912, 2.440126, 0.9019608, 0, 1, 1,
0.8480213, -1.630978, 2.217447, 0.9098039, 0, 1, 1,
0.8510554, 0.2600059, 1.132646, 0.9137255, 0, 1, 1,
0.8517784, -0.6820621, 4.278923, 0.9215686, 0, 1, 1,
0.8536346, -1.018317, 2.347324, 0.9254902, 0, 1, 1,
0.859155, 0.4920489, 1.343781, 0.9333333, 0, 1, 1,
0.861066, 0.8158802, -0.7164521, 0.9372549, 0, 1, 1,
0.862879, -0.5866743, 2.760609, 0.945098, 0, 1, 1,
0.8678309, 0.1658619, 1.795477, 0.9490196, 0, 1, 1,
0.8683684, -1.143653, 2.444979, 0.9568627, 0, 1, 1,
0.8726382, 0.7698284, 2.527978, 0.9607843, 0, 1, 1,
0.8735933, 0.8733843, 2.042232, 0.9686275, 0, 1, 1,
0.8737718, -0.2309699, 1.87894, 0.972549, 0, 1, 1,
0.8765225, -0.9567787, 3.471103, 0.9803922, 0, 1, 1,
0.8766381, -0.2636536, 2.647186, 0.9843137, 0, 1, 1,
0.8821344, -2.251196, 3.554713, 0.9921569, 0, 1, 1,
0.8829486, -0.6371588, 1.14031, 0.9960784, 0, 1, 1,
0.8937168, -1.516519, 2.394297, 1, 0, 0.9960784, 1,
0.9021374, -1.771099, 3.159479, 1, 0, 0.9882353, 1,
0.9065778, -1.286781, 1.801777, 1, 0, 0.9843137, 1,
0.9107625, 0.2480519, 0.3331022, 1, 0, 0.9764706, 1,
0.9190592, -2.790725, 2.980708, 1, 0, 0.972549, 1,
0.9190932, -0.3429942, 0.9483253, 1, 0, 0.9647059, 1,
0.9223711, -1.440795, 2.951068, 1, 0, 0.9607843, 1,
0.9266776, 0.373602, 1.754316, 1, 0, 0.9529412, 1,
0.9277148, 1.507374, -0.00419955, 1, 0, 0.9490196, 1,
0.9297081, -0.662863, 4.352426, 1, 0, 0.9411765, 1,
0.9305668, 0.03649123, 1.799831, 1, 0, 0.9372549, 1,
0.9313794, -1.882937, 3.919502, 1, 0, 0.9294118, 1,
0.9319512, 0.7088537, -1.619226, 1, 0, 0.9254902, 1,
0.9508373, 0.2125471, 1.205967, 1, 0, 0.9176471, 1,
0.9553836, -0.5813572, 2.609863, 1, 0, 0.9137255, 1,
0.9555935, 0.7907124, -0.6994231, 1, 0, 0.9058824, 1,
0.9558803, 0.9628616, -0.1475084, 1, 0, 0.9019608, 1,
0.9565899, -0.5278863, 1.779457, 1, 0, 0.8941177, 1,
0.9582657, 1.337813, 1.826967, 1, 0, 0.8862745, 1,
0.9708127, -0.7036496, 0.4437684, 1, 0, 0.8823529, 1,
0.9845536, 0.1257595, 3.470794, 1, 0, 0.8745098, 1,
0.9851055, 0.2019758, 0.3718869, 1, 0, 0.8705882, 1,
0.9870152, 0.9989035, 0.742448, 1, 0, 0.8627451, 1,
1.002234, -0.4941482, 3.053724, 1, 0, 0.8588235, 1,
1.013974, 1.241706, 0.7974699, 1, 0, 0.8509804, 1,
1.026808, 0.9502419, -0.7464864, 1, 0, 0.8470588, 1,
1.0323, 0.7327377, -0.3459634, 1, 0, 0.8392157, 1,
1.037263, 1.095466, 1.226258, 1, 0, 0.8352941, 1,
1.039833, 0.9722368, 0.7079281, 1, 0, 0.827451, 1,
1.043239, -0.7469051, 2.62739, 1, 0, 0.8235294, 1,
1.069067, -0.365094, 1.607427, 1, 0, 0.8156863, 1,
1.071148, 0.1808747, 1.419986, 1, 0, 0.8117647, 1,
1.074143, -0.576981, 1.687023, 1, 0, 0.8039216, 1,
1.074801, -0.3343359, 0.4685025, 1, 0, 0.7960784, 1,
1.079455, 1.34756, 0.5622477, 1, 0, 0.7921569, 1,
1.083706, 0.7390762, 0.29932, 1, 0, 0.7843137, 1,
1.085438, -1.138182, 2.189604, 1, 0, 0.7803922, 1,
1.089839, 0.4051571, 2.072554, 1, 0, 0.772549, 1,
1.092152, 1.788401, 2.369426, 1, 0, 0.7686275, 1,
1.093664, -1.706202, 3.241716, 1, 0, 0.7607843, 1,
1.095943, -1.751172, 1.001821, 1, 0, 0.7568628, 1,
1.1048, -0.528702, 0.5898924, 1, 0, 0.7490196, 1,
1.105661, 0.6563073, -0.5437452, 1, 0, 0.7450981, 1,
1.107345, -0.0234692, 0.6260104, 1, 0, 0.7372549, 1,
1.112315, -1.952448, 3.576681, 1, 0, 0.7333333, 1,
1.115337, -1.001285, 3.584676, 1, 0, 0.7254902, 1,
1.116323, -0.8212126, 0.8008153, 1, 0, 0.7215686, 1,
1.119559, 0.1030538, 1.113716, 1, 0, 0.7137255, 1,
1.125483, 1.616517, 2.10317, 1, 0, 0.7098039, 1,
1.130467, 0.09082383, 0.7499011, 1, 0, 0.7019608, 1,
1.144533, 1.696937, 0.9168791, 1, 0, 0.6941177, 1,
1.149475, -0.9407936, 2.345926, 1, 0, 0.6901961, 1,
1.16067, -0.7802408, 3.782142, 1, 0, 0.682353, 1,
1.162065, 0.08319566, 2.093048, 1, 0, 0.6784314, 1,
1.170737, 0.8176125, 0.6974578, 1, 0, 0.6705883, 1,
1.182885, -0.3674323, 1.273566, 1, 0, 0.6666667, 1,
1.1902, -2.115029, 1.555191, 1, 0, 0.6588235, 1,
1.19405, -1.972808, 1.511571, 1, 0, 0.654902, 1,
1.204841, 1.316484, 3.447697, 1, 0, 0.6470588, 1,
1.215959, 0.1946933, 0.3771657, 1, 0, 0.6431373, 1,
1.21784, 1.60568, -1.596702, 1, 0, 0.6352941, 1,
1.220979, -0.07318811, 1.664308, 1, 0, 0.6313726, 1,
1.230246, 0.9306372, -1.291895, 1, 0, 0.6235294, 1,
1.234894, 0.7712126, 0.6199203, 1, 0, 0.6196079, 1,
1.239057, -0.07500557, 1.723834, 1, 0, 0.6117647, 1,
1.239282, 0.6447284, -0.2402425, 1, 0, 0.6078432, 1,
1.244255, 0.352283, 0.4574379, 1, 0, 0.6, 1,
1.251254, -0.02248258, 3.378266, 1, 0, 0.5921569, 1,
1.252674, 0.3773714, 2.117066, 1, 0, 0.5882353, 1,
1.255265, 0.933296, 2.420094, 1, 0, 0.5803922, 1,
1.259171, 0.9438445, -0.436971, 1, 0, 0.5764706, 1,
1.266412, 0.286265, -0.6633112, 1, 0, 0.5686275, 1,
1.269428, 1.232625, 0.8518907, 1, 0, 0.5647059, 1,
1.270176, 0.4192631, 0.3381303, 1, 0, 0.5568628, 1,
1.284217, -1.436006, 1.687032, 1, 0, 0.5529412, 1,
1.285298, 1.089148, 0.1556671, 1, 0, 0.5450981, 1,
1.287501, 0.7837276, 1.213357, 1, 0, 0.5411765, 1,
1.306232, -1.424728, 1.738938, 1, 0, 0.5333334, 1,
1.315753, -1.678753, 4.377443, 1, 0, 0.5294118, 1,
1.3215, -0.2172995, 0.5618985, 1, 0, 0.5215687, 1,
1.344646, 0.245821, 0.9930618, 1, 0, 0.5176471, 1,
1.354793, -0.4066592, -0.4620632, 1, 0, 0.509804, 1,
1.359623, -0.2201287, 1.857195, 1, 0, 0.5058824, 1,
1.360414, -0.09868266, 2.799006, 1, 0, 0.4980392, 1,
1.362846, 0.782002, 1.109606, 1, 0, 0.4901961, 1,
1.369421, 0.4204873, 1.174858, 1, 0, 0.4862745, 1,
1.370714, -0.9203911, 2.519152, 1, 0, 0.4784314, 1,
1.380314, -0.6558076, 0.567544, 1, 0, 0.4745098, 1,
1.381845, -0.1129395, 2.727142, 1, 0, 0.4666667, 1,
1.388287, 0.7396161, 1.096406, 1, 0, 0.4627451, 1,
1.391677, 0.1480405, 3.222787, 1, 0, 0.454902, 1,
1.397562, -0.9949176, 3.76224, 1, 0, 0.4509804, 1,
1.399925, -0.7258028, 2.491364, 1, 0, 0.4431373, 1,
1.409778, -1.356407, 2.502064, 1, 0, 0.4392157, 1,
1.420216, 0.3816682, 0.9914963, 1, 0, 0.4313726, 1,
1.420349, 1.116613, 3.010283, 1, 0, 0.427451, 1,
1.436665, 1.590013, 0.4119081, 1, 0, 0.4196078, 1,
1.443117, 1.343228, 1.202301, 1, 0, 0.4156863, 1,
1.445633, -0.9246113, 2.245299, 1, 0, 0.4078431, 1,
1.44704, -0.5379056, 0.7359235, 1, 0, 0.4039216, 1,
1.475274, -1.103049, 2.624996, 1, 0, 0.3960784, 1,
1.491466, -0.9415582, 1.902801, 1, 0, 0.3882353, 1,
1.504005, -0.2159905, 2.760745, 1, 0, 0.3843137, 1,
1.505499, 0.4135813, 0.1261296, 1, 0, 0.3764706, 1,
1.519337, 0.5308561, 1.531467, 1, 0, 0.372549, 1,
1.519376, -0.5348642, 2.157413, 1, 0, 0.3647059, 1,
1.533478, 0.2238873, 3.314812, 1, 0, 0.3607843, 1,
1.539638, -1.066954, 2.131738, 1, 0, 0.3529412, 1,
1.544849, 0.02456202, 4.82312, 1, 0, 0.3490196, 1,
1.552155, 0.9918489, 0.5554231, 1, 0, 0.3411765, 1,
1.599729, -2.054997, 2.422892, 1, 0, 0.3372549, 1,
1.616921, -0.3531425, 0.839008, 1, 0, 0.3294118, 1,
1.617655, 1.493869, 0.7436625, 1, 0, 0.3254902, 1,
1.618723, -0.03229785, 0.6873248, 1, 0, 0.3176471, 1,
1.627209, 0.1700708, 4.405097, 1, 0, 0.3137255, 1,
1.632885, 1.282508, 0.04465077, 1, 0, 0.3058824, 1,
1.63457, -0.00250001, 2.168691, 1, 0, 0.2980392, 1,
1.656579, -2.430549, 1.19231, 1, 0, 0.2941177, 1,
1.656802, 1.550639, 1.138512, 1, 0, 0.2862745, 1,
1.67445, 1.815895, 1.280727, 1, 0, 0.282353, 1,
1.675454, 1.191951, -0.047167, 1, 0, 0.2745098, 1,
1.686, -1.550387, 1.200518, 1, 0, 0.2705882, 1,
1.706243, 0.1064122, 1.486698, 1, 0, 0.2627451, 1,
1.707591, -1.46682, 1.261361, 1, 0, 0.2588235, 1,
1.713946, 0.09014497, -0.254277, 1, 0, 0.2509804, 1,
1.716636, -2.077164, 3.973102, 1, 0, 0.2470588, 1,
1.725715, -0.9288628, 2.785127, 1, 0, 0.2392157, 1,
1.73458, -1.034203, -0.6104114, 1, 0, 0.2352941, 1,
1.737944, -0.2658515, 1.225107, 1, 0, 0.227451, 1,
1.768656, -0.4949926, 1.403236, 1, 0, 0.2235294, 1,
1.797996, -1.566741, 1.837757, 1, 0, 0.2156863, 1,
1.803455, 0.2892682, -0.07887648, 1, 0, 0.2117647, 1,
1.827763, 0.4476855, -0.6578329, 1, 0, 0.2039216, 1,
1.832834, 0.9939194, 1.042883, 1, 0, 0.1960784, 1,
1.834695, 0.4789861, 1.000358, 1, 0, 0.1921569, 1,
1.837106, -0.2384975, 0.8594781, 1, 0, 0.1843137, 1,
1.854952, -0.3888957, 2.546206, 1, 0, 0.1803922, 1,
1.925296, 0.7599582, 0.653365, 1, 0, 0.172549, 1,
1.936383, 0.1886188, 2.161405, 1, 0, 0.1686275, 1,
1.939011, 0.6154678, 0.2727098, 1, 0, 0.1607843, 1,
1.939727, 0.441655, 0.6630031, 1, 0, 0.1568628, 1,
1.940706, 0.05213271, 0.3021086, 1, 0, 0.1490196, 1,
1.966362, -1.038536, 3.445074, 1, 0, 0.145098, 1,
2.104278, 0.6126134, 1.975836, 1, 0, 0.1372549, 1,
2.105958, -1.450139, 1.461848, 1, 0, 0.1333333, 1,
2.162892, -0.1460331, 0.5476021, 1, 0, 0.1254902, 1,
2.165257, 0.9613871, 0.5835533, 1, 0, 0.1215686, 1,
2.238387, 0.05166011, 2.88632, 1, 0, 0.1137255, 1,
2.321931, -1.184093, 1.099319, 1, 0, 0.1098039, 1,
2.330766, -0.7786801, 2.470458, 1, 0, 0.1019608, 1,
2.334739, -0.6630513, 1.722879, 1, 0, 0.09411765, 1,
2.352993, 0.4361216, 1.774333, 1, 0, 0.09019608, 1,
2.42351, -0.8042004, 1.246681, 1, 0, 0.08235294, 1,
2.441548, 1.526634, 1.998232, 1, 0, 0.07843138, 1,
2.447562, -0.3338528, 2.174925, 1, 0, 0.07058824, 1,
2.482306, 2.263518, 0.3523862, 1, 0, 0.06666667, 1,
2.490258, -0.4714448, 1.717224, 1, 0, 0.05882353, 1,
2.501913, 0.4567481, 0.0568263, 1, 0, 0.05490196, 1,
2.527828, -0.9387816, 0.9401857, 1, 0, 0.04705882, 1,
2.586255, 0.02572016, 2.548004, 1, 0, 0.04313726, 1,
2.735394, -0.03280063, 2.287411, 1, 0, 0.03529412, 1,
2.770057, -0.5642803, 2.78723, 1, 0, 0.03137255, 1,
2.856838, -0.2504021, 2.787227, 1, 0, 0.02352941, 1,
3.055877, 1.403362, 0.5047889, 1, 0, 0.01960784, 1,
3.40918, 0.8375722, 1.920306, 1, 0, 0.01176471, 1,
3.474194, 0.9339171, 2.225948, 1, 0, 0.007843138, 1
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
0.1519306, -4.168121, -6.653092, 0, -0.5, 0.5, 0.5,
0.1519306, -4.168121, -6.653092, 1, -0.5, 0.5, 0.5,
0.1519306, -4.168121, -6.653092, 1, 1.5, 0.5, 0.5,
0.1519306, -4.168121, -6.653092, 0, 1.5, 0.5, 0.5
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
-4.29658, 0.2464477, -6.653092, 0, -0.5, 0.5, 0.5,
-4.29658, 0.2464477, -6.653092, 1, -0.5, 0.5, 0.5,
-4.29658, 0.2464477, -6.653092, 1, 1.5, 0.5, 0.5,
-4.29658, 0.2464477, -6.653092, 0, 1.5, 0.5, 0.5
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
-4.29658, -4.168121, 0.2284648, 0, -0.5, 0.5, 0.5,
-4.29658, -4.168121, 0.2284648, 1, -0.5, 0.5, 0.5,
-4.29658, -4.168121, 0.2284648, 1, 1.5, 0.5, 0.5,
-4.29658, -4.168121, 0.2284648, 0, 1.5, 0.5, 0.5
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
-3, -3.149375, -5.065041,
3, -3.149375, -5.065041,
-3, -3.149375, -5.065041,
-3, -3.319166, -5.329716,
-2, -3.149375, -5.065041,
-2, -3.319166, -5.329716,
-1, -3.149375, -5.065041,
-1, -3.319166, -5.329716,
0, -3.149375, -5.065041,
0, -3.319166, -5.329716,
1, -3.149375, -5.065041,
1, -3.319166, -5.329716,
2, -3.149375, -5.065041,
2, -3.319166, -5.329716,
3, -3.149375, -5.065041,
3, -3.319166, -5.329716
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
-3, -3.658748, -5.859066, 0, -0.5, 0.5, 0.5,
-3, -3.658748, -5.859066, 1, -0.5, 0.5, 0.5,
-3, -3.658748, -5.859066, 1, 1.5, 0.5, 0.5,
-3, -3.658748, -5.859066, 0, 1.5, 0.5, 0.5,
-2, -3.658748, -5.859066, 0, -0.5, 0.5, 0.5,
-2, -3.658748, -5.859066, 1, -0.5, 0.5, 0.5,
-2, -3.658748, -5.859066, 1, 1.5, 0.5, 0.5,
-2, -3.658748, -5.859066, 0, 1.5, 0.5, 0.5,
-1, -3.658748, -5.859066, 0, -0.5, 0.5, 0.5,
-1, -3.658748, -5.859066, 1, -0.5, 0.5, 0.5,
-1, -3.658748, -5.859066, 1, 1.5, 0.5, 0.5,
-1, -3.658748, -5.859066, 0, 1.5, 0.5, 0.5,
0, -3.658748, -5.859066, 0, -0.5, 0.5, 0.5,
0, -3.658748, -5.859066, 1, -0.5, 0.5, 0.5,
0, -3.658748, -5.859066, 1, 1.5, 0.5, 0.5,
0, -3.658748, -5.859066, 0, 1.5, 0.5, 0.5,
1, -3.658748, -5.859066, 0, -0.5, 0.5, 0.5,
1, -3.658748, -5.859066, 1, -0.5, 0.5, 0.5,
1, -3.658748, -5.859066, 1, 1.5, 0.5, 0.5,
1, -3.658748, -5.859066, 0, 1.5, 0.5, 0.5,
2, -3.658748, -5.859066, 0, -0.5, 0.5, 0.5,
2, -3.658748, -5.859066, 1, -0.5, 0.5, 0.5,
2, -3.658748, -5.859066, 1, 1.5, 0.5, 0.5,
2, -3.658748, -5.859066, 0, 1.5, 0.5, 0.5,
3, -3.658748, -5.859066, 0, -0.5, 0.5, 0.5,
3, -3.658748, -5.859066, 1, -0.5, 0.5, 0.5,
3, -3.658748, -5.859066, 1, 1.5, 0.5, 0.5,
3, -3.658748, -5.859066, 0, 1.5, 0.5, 0.5
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
-3.270001, -3, -5.065041,
-3.270001, 3, -5.065041,
-3.270001, -3, -5.065041,
-3.441097, -3, -5.329716,
-3.270001, -2, -5.065041,
-3.441097, -2, -5.329716,
-3.270001, -1, -5.065041,
-3.441097, -1, -5.329716,
-3.270001, 0, -5.065041,
-3.441097, 0, -5.329716,
-3.270001, 1, -5.065041,
-3.441097, 1, -5.329716,
-3.270001, 2, -5.065041,
-3.441097, 2, -5.329716,
-3.270001, 3, -5.065041,
-3.441097, 3, -5.329716
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
-3.783291, -3, -5.859066, 0, -0.5, 0.5, 0.5,
-3.783291, -3, -5.859066, 1, -0.5, 0.5, 0.5,
-3.783291, -3, -5.859066, 1, 1.5, 0.5, 0.5,
-3.783291, -3, -5.859066, 0, 1.5, 0.5, 0.5,
-3.783291, -2, -5.859066, 0, -0.5, 0.5, 0.5,
-3.783291, -2, -5.859066, 1, -0.5, 0.5, 0.5,
-3.783291, -2, -5.859066, 1, 1.5, 0.5, 0.5,
-3.783291, -2, -5.859066, 0, 1.5, 0.5, 0.5,
-3.783291, -1, -5.859066, 0, -0.5, 0.5, 0.5,
-3.783291, -1, -5.859066, 1, -0.5, 0.5, 0.5,
-3.783291, -1, -5.859066, 1, 1.5, 0.5, 0.5,
-3.783291, -1, -5.859066, 0, 1.5, 0.5, 0.5,
-3.783291, 0, -5.859066, 0, -0.5, 0.5, 0.5,
-3.783291, 0, -5.859066, 1, -0.5, 0.5, 0.5,
-3.783291, 0, -5.859066, 1, 1.5, 0.5, 0.5,
-3.783291, 0, -5.859066, 0, 1.5, 0.5, 0.5,
-3.783291, 1, -5.859066, 0, -0.5, 0.5, 0.5,
-3.783291, 1, -5.859066, 1, -0.5, 0.5, 0.5,
-3.783291, 1, -5.859066, 1, 1.5, 0.5, 0.5,
-3.783291, 1, -5.859066, 0, 1.5, 0.5, 0.5,
-3.783291, 2, -5.859066, 0, -0.5, 0.5, 0.5,
-3.783291, 2, -5.859066, 1, -0.5, 0.5, 0.5,
-3.783291, 2, -5.859066, 1, 1.5, 0.5, 0.5,
-3.783291, 2, -5.859066, 0, 1.5, 0.5, 0.5,
-3.783291, 3, -5.859066, 0, -0.5, 0.5, 0.5,
-3.783291, 3, -5.859066, 1, -0.5, 0.5, 0.5,
-3.783291, 3, -5.859066, 1, 1.5, 0.5, 0.5,
-3.783291, 3, -5.859066, 0, 1.5, 0.5, 0.5
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
-3.270001, -3.149375, -4,
-3.270001, -3.149375, 4,
-3.270001, -3.149375, -4,
-3.441097, -3.319166, -4,
-3.270001, -3.149375, -2,
-3.441097, -3.319166, -2,
-3.270001, -3.149375, 0,
-3.441097, -3.319166, 0,
-3.270001, -3.149375, 2,
-3.441097, -3.319166, 2,
-3.270001, -3.149375, 4,
-3.441097, -3.319166, 4
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
-3.783291, -3.658748, -4, 0, -0.5, 0.5, 0.5,
-3.783291, -3.658748, -4, 1, -0.5, 0.5, 0.5,
-3.783291, -3.658748, -4, 1, 1.5, 0.5, 0.5,
-3.783291, -3.658748, -4, 0, 1.5, 0.5, 0.5,
-3.783291, -3.658748, -2, 0, -0.5, 0.5, 0.5,
-3.783291, -3.658748, -2, 1, -0.5, 0.5, 0.5,
-3.783291, -3.658748, -2, 1, 1.5, 0.5, 0.5,
-3.783291, -3.658748, -2, 0, 1.5, 0.5, 0.5,
-3.783291, -3.658748, 0, 0, -0.5, 0.5, 0.5,
-3.783291, -3.658748, 0, 1, -0.5, 0.5, 0.5,
-3.783291, -3.658748, 0, 1, 1.5, 0.5, 0.5,
-3.783291, -3.658748, 0, 0, 1.5, 0.5, 0.5,
-3.783291, -3.658748, 2, 0, -0.5, 0.5, 0.5,
-3.783291, -3.658748, 2, 1, -0.5, 0.5, 0.5,
-3.783291, -3.658748, 2, 1, 1.5, 0.5, 0.5,
-3.783291, -3.658748, 2, 0, 1.5, 0.5, 0.5,
-3.783291, -3.658748, 4, 0, -0.5, 0.5, 0.5,
-3.783291, -3.658748, 4, 1, -0.5, 0.5, 0.5,
-3.783291, -3.658748, 4, 1, 1.5, 0.5, 0.5,
-3.783291, -3.658748, 4, 0, 1.5, 0.5, 0.5
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
-3.270001, -3.149375, -5.065041,
-3.270001, 3.64227, -5.065041,
-3.270001, -3.149375, 5.52197,
-3.270001, 3.64227, 5.52197,
-3.270001, -3.149375, -5.065041,
-3.270001, -3.149375, 5.52197,
-3.270001, 3.64227, -5.065041,
-3.270001, 3.64227, 5.52197,
-3.270001, -3.149375, -5.065041,
3.573862, -3.149375, -5.065041,
-3.270001, -3.149375, 5.52197,
3.573862, -3.149375, 5.52197,
-3.270001, 3.64227, -5.065041,
3.573862, 3.64227, -5.065041,
-3.270001, 3.64227, 5.52197,
3.573862, 3.64227, 5.52197,
3.573862, -3.149375, -5.065041,
3.573862, 3.64227, -5.065041,
3.573862, -3.149375, 5.52197,
3.573862, 3.64227, 5.52197,
3.573862, -3.149375, -5.065041,
3.573862, -3.149375, 5.52197,
3.573862, 3.64227, -5.065041,
3.573862, 3.64227, 5.52197
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
var radius = 7.646365;
var distance = 34.01954;
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
mvMatrix.translate( -0.1519306, -0.2464477, -0.2284648 );
mvMatrix.scale( 1.208002, 1.21729, 0.7809002 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.01954);
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
thionazin<-read.table("thionazin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-thionazin$V2
```

```
## Error in eval(expr, envir, enclos): object 'thionazin' not found
```

```r
y<-thionazin$V3
```

```
## Error in eval(expr, envir, enclos): object 'thionazin' not found
```

```r
z<-thionazin$V4
```

```
## Error in eval(expr, envir, enclos): object 'thionazin' not found
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
-3.170333, -1.045432, -1.788934, 0, 0, 1, 1, 1,
-2.779501, -0.07602047, -2.4481, 1, 0, 0, 1, 1,
-2.76498, 1.318823, 0.05273829, 1, 0, 0, 1, 1,
-2.655514, -0.4895348, -2.756181, 1, 0, 0, 1, 1,
-2.597797, 0.8699391, -2.589439, 1, 0, 0, 1, 1,
-2.510784, 1.626635, -1.365609, 1, 0, 0, 1, 1,
-2.417768, 1.112405, -0.02257357, 0, 0, 0, 1, 1,
-2.391174, 0.9410763, -1.741193, 0, 0, 0, 1, 1,
-2.30209, 0.3700684, -0.7466933, 0, 0, 0, 1, 1,
-2.245239, -1.142356, -2.334406, 0, 0, 0, 1, 1,
-2.238662, 0.7123039, -0.06240591, 0, 0, 0, 1, 1,
-2.216956, -1.70807, -0.05847079, 0, 0, 0, 1, 1,
-2.202534, -0.6528092, -1.587222, 0, 0, 0, 1, 1,
-2.187432, -1.779299, -2.18109, 1, 1, 1, 1, 1,
-2.142092, 0.3824341, -2.816588, 1, 1, 1, 1, 1,
-2.070652, 1.419196, -1.349371, 1, 1, 1, 1, 1,
-2.061937, -0.3158743, -1.980914, 1, 1, 1, 1, 1,
-2.044144, -0.5145996, -1.187631, 1, 1, 1, 1, 1,
-2.038245, -0.07723938, -1.527074, 1, 1, 1, 1, 1,
-2.034006, 0.4645793, -0.8209885, 1, 1, 1, 1, 1,
-2.020073, 1.286932, -1.868425, 1, 1, 1, 1, 1,
-2.020012, 1.239172, -1.761935, 1, 1, 1, 1, 1,
-2.006694, -1.276883, -4.004478, 1, 1, 1, 1, 1,
-2.005978, 0.6739987, -3.276603, 1, 1, 1, 1, 1,
-1.980982, 0.6161126, 0.7621861, 1, 1, 1, 1, 1,
-1.976951, 1.025554, -1.559818, 1, 1, 1, 1, 1,
-1.948166, -0.3641077, -3.29011, 1, 1, 1, 1, 1,
-1.918964, -0.6656661, -1.512097, 1, 1, 1, 1, 1,
-1.914107, 0.60687, -2.383186, 0, 0, 1, 1, 1,
-1.904485, 0.3913095, -2.298787, 1, 0, 0, 1, 1,
-1.898338, 1.361796, -1.778851, 1, 0, 0, 1, 1,
-1.888237, -0.03839589, -1.269474, 1, 0, 0, 1, 1,
-1.865413, -0.678683, -2.447819, 1, 0, 0, 1, 1,
-1.854944, 1.685008, 0.1211136, 1, 0, 0, 1, 1,
-1.852465, -0.9061175, -2.112848, 0, 0, 0, 1, 1,
-1.818796, -0.7051978, -1.094737, 0, 0, 0, 1, 1,
-1.805041, 0.1077495, 0.09227692, 0, 0, 0, 1, 1,
-1.787924, 0.5045781, -1.58205, 0, 0, 0, 1, 1,
-1.777893, -1.808244, -2.48929, 0, 0, 0, 1, 1,
-1.775652, -2.124327, -1.418753, 0, 0, 0, 1, 1,
-1.771266, 0.8066264, -2.973662, 0, 0, 0, 1, 1,
-1.769504, 1.361612, 0.1265253, 1, 1, 1, 1, 1,
-1.731842, 0.5060156, -1.203591, 1, 1, 1, 1, 1,
-1.726276, 0.7932059, -0.8610618, 1, 1, 1, 1, 1,
-1.724936, 1.197174, -1.44664, 1, 1, 1, 1, 1,
-1.723222, -0.2601503, -0.9928446, 1, 1, 1, 1, 1,
-1.719959, 0.5540586, -1.982659, 1, 1, 1, 1, 1,
-1.709062, 0.04944555, -0.969879, 1, 1, 1, 1, 1,
-1.703092, 0.5443019, -0.2952505, 1, 1, 1, 1, 1,
-1.67363, 2.526414, -1.224004, 1, 1, 1, 1, 1,
-1.666801, -1.644145, -1.765759, 1, 1, 1, 1, 1,
-1.664651, 0.4171923, -0.735553, 1, 1, 1, 1, 1,
-1.657088, -0.8291149, -2.605941, 1, 1, 1, 1, 1,
-1.647592, 1.132856, -1.251076, 1, 1, 1, 1, 1,
-1.643336, 0.1012372, -0.2902222, 1, 1, 1, 1, 1,
-1.626785, -0.1627577, -0.7509397, 1, 1, 1, 1, 1,
-1.626602, -1.007341, -3.913767, 0, 0, 1, 1, 1,
-1.612374, -0.6005037, -1.875934, 1, 0, 0, 1, 1,
-1.605333, 1.501256, 1.727712, 1, 0, 0, 1, 1,
-1.603597, -0.3944143, -2.33712, 1, 0, 0, 1, 1,
-1.591942, 0.04741452, -1.585602, 1, 0, 0, 1, 1,
-1.591129, 0.5314103, -1.324197, 1, 0, 0, 1, 1,
-1.590068, -1.618217, -2.383454, 0, 0, 0, 1, 1,
-1.566852, 1.24564, -1.187431, 0, 0, 0, 1, 1,
-1.552153, 1.221329, -1.146076, 0, 0, 0, 1, 1,
-1.55065, -2.775236, -2.151592, 0, 0, 0, 1, 1,
-1.550578, 0.1807676, -0.95825, 0, 0, 0, 1, 1,
-1.540212, -0.4791181, -1.55027, 0, 0, 0, 1, 1,
-1.53578, 1.993733, -0.6814545, 0, 0, 0, 1, 1,
-1.534204, 0.4249118, -1.836808, 1, 1, 1, 1, 1,
-1.493924, -0.244839, -2.064036, 1, 1, 1, 1, 1,
-1.486414, 0.5547189, 0.8843769, 1, 1, 1, 1, 1,
-1.482506, -0.8877098, -1.576709, 1, 1, 1, 1, 1,
-1.481336, 1.190301, -0.1639073, 1, 1, 1, 1, 1,
-1.476522, 0.2820101, -1.157822, 1, 1, 1, 1, 1,
-1.47327, 0.04570483, -2.412184, 1, 1, 1, 1, 1,
-1.468361, 0.7783089, -1.082155, 1, 1, 1, 1, 1,
-1.456511, -0.3383929, -1.81891, 1, 1, 1, 1, 1,
-1.441087, 0.6800174, -1.006389, 1, 1, 1, 1, 1,
-1.418326, 2.640545, -0.1621301, 1, 1, 1, 1, 1,
-1.411176, 0.2038448, -2.154931, 1, 1, 1, 1, 1,
-1.391731, 0.7074177, -2.211236, 1, 1, 1, 1, 1,
-1.385666, 0.5248168, -1.619813, 1, 1, 1, 1, 1,
-1.384669, 0.6338729, -0.3221492, 1, 1, 1, 1, 1,
-1.378835, 0.4834207, -1.302022, 0, 0, 1, 1, 1,
-1.375681, 0.6691737, -0.04378339, 1, 0, 0, 1, 1,
-1.359994, -0.5052214, -2.214798, 1, 0, 0, 1, 1,
-1.356981, -0.5200599, -0.4893426, 1, 0, 0, 1, 1,
-1.354673, -1.316104, -4.910861, 1, 0, 0, 1, 1,
-1.353094, -0.5559292, 0.01115745, 1, 0, 0, 1, 1,
-1.346211, -0.2256323, -3.09443, 0, 0, 0, 1, 1,
-1.340663, 0.2025243, 0.2016838, 0, 0, 0, 1, 1,
-1.335986, -1.509488, -2.337828, 0, 0, 0, 1, 1,
-1.320566, -1.011562, -2.145065, 0, 0, 0, 1, 1,
-1.316099, 0.03664508, 0.2100091, 0, 0, 0, 1, 1,
-1.315383, 0.650853, -0.2963205, 0, 0, 0, 1, 1,
-1.314488, 2.059168, -0.9518689, 0, 0, 0, 1, 1,
-1.311806, -1.5014, -3.912252, 1, 1, 1, 1, 1,
-1.307451, 0.8247638, -2.003323, 1, 1, 1, 1, 1,
-1.305309, -0.7124686, -0.4161141, 1, 1, 1, 1, 1,
-1.305285, -1.458959, -4.125247, 1, 1, 1, 1, 1,
-1.304559, 0.3761101, -1.753532, 1, 1, 1, 1, 1,
-1.299454, -0.5732329, -2.059575, 1, 1, 1, 1, 1,
-1.292984, -1.140486, -1.350229, 1, 1, 1, 1, 1,
-1.288979, 0.5438687, -1.563024, 1, 1, 1, 1, 1,
-1.288652, 0.7496989, 1.031134, 1, 1, 1, 1, 1,
-1.270372, 0.9005331, -1.469951, 1, 1, 1, 1, 1,
-1.268639, -0.4029738, -1.157312, 1, 1, 1, 1, 1,
-1.263601, 0.1857165, -3.219912, 1, 1, 1, 1, 1,
-1.260377, -1.318707, -0.4139613, 1, 1, 1, 1, 1,
-1.259513, 0.7086049, 0.3779543, 1, 1, 1, 1, 1,
-1.258177, 0.7092228, -2.461803, 1, 1, 1, 1, 1,
-1.247377, -0.2879863, 0.2477026, 0, 0, 1, 1, 1,
-1.24671, 0.935063, 1.742007, 1, 0, 0, 1, 1,
-1.24118, 1.219421, -2.902712, 1, 0, 0, 1, 1,
-1.229694, 1.496651, -1.276272, 1, 0, 0, 1, 1,
-1.227692, -0.8196994, -3.951101, 1, 0, 0, 1, 1,
-1.214185, -0.3183823, -1.694568, 1, 0, 0, 1, 1,
-1.211805, -0.2185002, 0.4188237, 0, 0, 0, 1, 1,
-1.201517, -0.3632911, -1.9981, 0, 0, 0, 1, 1,
-1.197106, -1.763929, -2.725399, 0, 0, 0, 1, 1,
-1.196045, 1.791083, -0.9629709, 0, 0, 0, 1, 1,
-1.194643, 0.2358469, -1.597231, 0, 0, 0, 1, 1,
-1.191599, -0.1971671, -0.4643077, 0, 0, 0, 1, 1,
-1.188608, -1.173409, -2.699824, 0, 0, 0, 1, 1,
-1.177379, -0.2150153, -0.5762488, 1, 1, 1, 1, 1,
-1.169003, 0.7935076, -1.846873, 1, 1, 1, 1, 1,
-1.166448, 0.4003836, -1.596658, 1, 1, 1, 1, 1,
-1.157258, 2.164361, -1.299185, 1, 1, 1, 1, 1,
-1.155472, -0.9872425, -2.655438, 1, 1, 1, 1, 1,
-1.153583, -1.301345, 0.2219771, 1, 1, 1, 1, 1,
-1.150133, 0.0457939, -1.566406, 1, 1, 1, 1, 1,
-1.149897, -0.7496659, -2.501182, 1, 1, 1, 1, 1,
-1.12893, 0.7880915, 0.5624571, 1, 1, 1, 1, 1,
-1.127708, 1.151978, -0.5433403, 1, 1, 1, 1, 1,
-1.125025, 0.9559311, -2.216965, 1, 1, 1, 1, 1,
-1.117687, -0.08792946, -1.852271, 1, 1, 1, 1, 1,
-1.115964, 0.2334009, -1.685388, 1, 1, 1, 1, 1,
-1.110795, 0.5748007, -2.302169, 1, 1, 1, 1, 1,
-1.10897, -0.6442201, -1.927136, 1, 1, 1, 1, 1,
-1.108097, 0.2636724, -1.224253, 0, 0, 1, 1, 1,
-1.106222, -0.1135316, -1.303457, 1, 0, 0, 1, 1,
-1.103166, -1.585533, -0.2822654, 1, 0, 0, 1, 1,
-1.101907, -0.6325834, 0.286775, 1, 0, 0, 1, 1,
-1.099175, -0.06662785, -1.182968, 1, 0, 0, 1, 1,
-1.096872, 1.114816, -1.067392, 1, 0, 0, 1, 1,
-1.096627, 1.387941, -0.813198, 0, 0, 0, 1, 1,
-1.09318, -1.752681, -1.007423, 0, 0, 0, 1, 1,
-1.091756, 0.2409723, -1.050629, 0, 0, 0, 1, 1,
-1.090666, 0.3632405, -0.5444511, 0, 0, 0, 1, 1,
-1.09012, -0.06030718, -1.990245, 0, 0, 0, 1, 1,
-1.089006, -1.524403, -1.875591, 0, 0, 0, 1, 1,
-1.080833, 2.907137, -0.82177, 0, 0, 0, 1, 1,
-1.077621, 0.4040831, -1.683319, 1, 1, 1, 1, 1,
-1.074635, 0.04925063, -1.831205, 1, 1, 1, 1, 1,
-1.074441, -1.493411, -1.85584, 1, 1, 1, 1, 1,
-1.073923, -0.08990183, -2.696322, 1, 1, 1, 1, 1,
-1.070158, 1.098025, -0.883855, 1, 1, 1, 1, 1,
-1.067176, -0.3104567, -2.006686, 1, 1, 1, 1, 1,
-1.066655, 0.1343072, -1.214909, 1, 1, 1, 1, 1,
-1.065218, 0.2788881, 1.120335, 1, 1, 1, 1, 1,
-1.062923, 0.4289935, -0.7161355, 1, 1, 1, 1, 1,
-1.056709, -0.1036474, -0.2472455, 1, 1, 1, 1, 1,
-1.052444, -0.9004328, -2.079105, 1, 1, 1, 1, 1,
-1.052247, 1.190027, -0.8258384, 1, 1, 1, 1, 1,
-1.048364, -0.2798304, -2.240635, 1, 1, 1, 1, 1,
-1.037197, -0.9781474, -2.130468, 1, 1, 1, 1, 1,
-1.034119, 1.458156, 0.1417134, 1, 1, 1, 1, 1,
-1.028144, 0.3889606, -0.9244487, 0, 0, 1, 1, 1,
-1.027706, 0.04876361, -1.329376, 1, 0, 0, 1, 1,
-1.026028, -0.17904, -0.8271091, 1, 0, 0, 1, 1,
-1.016213, 1.168339, -0.2764915, 1, 0, 0, 1, 1,
-1.016087, -0.4891644, -1.71999, 1, 0, 0, 1, 1,
-1.015382, 0.2601242, 0.0008507799, 1, 0, 0, 1, 1,
-1.011974, 0.299229, -0.962827, 0, 0, 0, 1, 1,
-1.011243, -1.208546, -0.5266041, 0, 0, 0, 1, 1,
-0.9946021, -1.146798, -3.399789, 0, 0, 0, 1, 1,
-0.9926935, -0.7108796, -2.171309, 0, 0, 0, 1, 1,
-0.9865683, -0.4900735, -0.6313122, 0, 0, 0, 1, 1,
-0.9832916, -0.3608952, -3.273527, 0, 0, 0, 1, 1,
-0.9768835, -0.5107633, -2.846138, 0, 0, 0, 1, 1,
-0.976025, -0.8625264, -2.88834, 1, 1, 1, 1, 1,
-0.9706333, -0.6560984, -1.851159, 1, 1, 1, 1, 1,
-0.9705061, 0.4407242, -0.7235788, 1, 1, 1, 1, 1,
-0.9518484, 1.018608, -0.6119474, 1, 1, 1, 1, 1,
-0.9453031, -0.2014515, -2.06136, 1, 1, 1, 1, 1,
-0.9402607, 0.4892728, -1.396986, 1, 1, 1, 1, 1,
-0.9377494, 2.692823, -0.9258116, 1, 1, 1, 1, 1,
-0.937456, -0.2368235, -4.449053, 1, 1, 1, 1, 1,
-0.9366932, 0.856132, -2.2411, 1, 1, 1, 1, 1,
-0.9162518, -0.6036785, -2.742843, 1, 1, 1, 1, 1,
-0.914149, 0.4583551, -1.100289, 1, 1, 1, 1, 1,
-0.9104804, 0.4621051, -1.514513, 1, 1, 1, 1, 1,
-0.9098931, -0.3775854, -1.573519, 1, 1, 1, 1, 1,
-0.9091424, 0.489479, -2.794021, 1, 1, 1, 1, 1,
-0.8978683, 1.246085, 0.5880942, 1, 1, 1, 1, 1,
-0.8933759, 1.500523, -0.2064551, 0, 0, 1, 1, 1,
-0.8885715, 0.3952426, 0.1572664, 1, 0, 0, 1, 1,
-0.8813074, 0.3514352, -0.6094999, 1, 0, 0, 1, 1,
-0.8761486, 1.091726, -1.963606, 1, 0, 0, 1, 1,
-0.875719, -0.8414968, -2.096529, 1, 0, 0, 1, 1,
-0.8709342, -2.148719, 0.1361893, 1, 0, 0, 1, 1,
-0.8698776, -0.5138891, -1.944876, 0, 0, 0, 1, 1,
-0.8692119, -0.103705, -2.402429, 0, 0, 0, 1, 1,
-0.8648043, -0.3033324, -0.9923264, 0, 0, 0, 1, 1,
-0.8604538, -1.683228, -2.16229, 0, 0, 0, 1, 1,
-0.8590275, 1.273184, -0.5562608, 0, 0, 0, 1, 1,
-0.8525634, 1.83065, -1.361787, 0, 0, 0, 1, 1,
-0.84426, 0.8097284, -1.263571, 0, 0, 0, 1, 1,
-0.8442037, 1.115471, -1.565232, 1, 1, 1, 1, 1,
-0.8424924, 0.8044464, 2.413407, 1, 1, 1, 1, 1,
-0.8424739, 0.6799333, 0.23221, 1, 1, 1, 1, 1,
-0.8413967, -0.8996512, -1.623787, 1, 1, 1, 1, 1,
-0.839206, -1.131975, -2.410414, 1, 1, 1, 1, 1,
-0.8322577, 0.9556886, -1.741172, 1, 1, 1, 1, 1,
-0.8307768, 0.7142468, -1.463182, 1, 1, 1, 1, 1,
-0.8221007, -0.5986148, -2.087881, 1, 1, 1, 1, 1,
-0.8198526, -0.367716, -2.847789, 1, 1, 1, 1, 1,
-0.8126258, 0.05578973, -1.36654, 1, 1, 1, 1, 1,
-0.8024065, -0.3374054, -1.072788, 1, 1, 1, 1, 1,
-0.8022211, -0.08785247, 0.8917328, 1, 1, 1, 1, 1,
-0.7992504, 0.1796262, -3.63183, 1, 1, 1, 1, 1,
-0.7966912, -0.3148447, -2.697701, 1, 1, 1, 1, 1,
-0.7899085, 0.6382811, -0.4682167, 1, 1, 1, 1, 1,
-0.7862189, -0.08770897, 0.4851694, 0, 0, 1, 1, 1,
-0.7857887, 0.7194444, -0.08100224, 1, 0, 0, 1, 1,
-0.7851697, -0.7879522, -4.02721, 1, 0, 0, 1, 1,
-0.7814485, -0.5777681, -0.6532047, 1, 0, 0, 1, 1,
-0.778459, 0.3219688, -1.718326, 1, 0, 0, 1, 1,
-0.7754516, -0.08731616, -0.557704, 1, 0, 0, 1, 1,
-0.7692357, -0.9954585, -3.694496, 0, 0, 0, 1, 1,
-0.7662087, 0.7656596, -0.8842102, 0, 0, 0, 1, 1,
-0.7639502, -1.042631, -2.278844, 0, 0, 0, 1, 1,
-0.7622625, 0.08952226, -0.06111646, 0, 0, 0, 1, 1,
-0.759045, 0.6861844, -2.003205, 0, 0, 0, 1, 1,
-0.7544582, 1.307437, -0.9373472, 0, 0, 0, 1, 1,
-0.7506913, 0.006197639, -0.3175152, 0, 0, 0, 1, 1,
-0.7434511, 0.4385497, -0.03639695, 1, 1, 1, 1, 1,
-0.7425847, 0.7069932, -1.03121, 1, 1, 1, 1, 1,
-0.7397105, 0.9938467, -1.556955, 1, 1, 1, 1, 1,
-0.7381693, 0.9774308, 1.022984, 1, 1, 1, 1, 1,
-0.7313331, 1.633333, -1.552779, 1, 1, 1, 1, 1,
-0.7283105, -0.7478518, -2.952926, 1, 1, 1, 1, 1,
-0.7258943, -0.01418809, -1.664092, 1, 1, 1, 1, 1,
-0.7249363, -1.120993, -2.847823, 1, 1, 1, 1, 1,
-0.7236259, 0.968103, -1.286075, 1, 1, 1, 1, 1,
-0.7188814, 0.5987878, -0.7682534, 1, 1, 1, 1, 1,
-0.7057469, 0.211597, -2.417792, 1, 1, 1, 1, 1,
-0.7053471, -1.181226, -2.134645, 1, 1, 1, 1, 1,
-0.7041309, 1.187223, -1.843174, 1, 1, 1, 1, 1,
-0.6983023, 0.1726247, -0.6756213, 1, 1, 1, 1, 1,
-0.6970794, 0.2320342, -0.2195599, 1, 1, 1, 1, 1,
-0.6956981, 1.54915, -0.1056835, 0, 0, 1, 1, 1,
-0.6955525, 1.400845, -2.661216, 1, 0, 0, 1, 1,
-0.6916703, 1.205405, -1.13996, 1, 0, 0, 1, 1,
-0.691132, -0.3324645, -2.02374, 1, 0, 0, 1, 1,
-0.6900911, 2.107676, 0.5714205, 1, 0, 0, 1, 1,
-0.690011, 0.2540512, -2.710382, 1, 0, 0, 1, 1,
-0.6895143, 0.2781536, -1.195174, 0, 0, 0, 1, 1,
-0.6881334, -1.422501, -2.635775, 0, 0, 0, 1, 1,
-0.6868917, -1.155681, -4.101884, 0, 0, 0, 1, 1,
-0.6829628, -0.5108049, -1.850421, 0, 0, 0, 1, 1,
-0.6827292, -0.6505909, -1.478255, 0, 0, 0, 1, 1,
-0.6827175, 0.5133879, -1.356776, 0, 0, 0, 1, 1,
-0.6750547, -0.4063295, -3.347422, 0, 0, 0, 1, 1,
-0.6743396, 1.37204, 1.529744, 1, 1, 1, 1, 1,
-0.6738082, -0.6478819, -4.390344, 1, 1, 1, 1, 1,
-0.6730841, -1.420362, -1.884854, 1, 1, 1, 1, 1,
-0.6692573, -0.6824146, -0.9069422, 1, 1, 1, 1, 1,
-0.6661077, -1.18992, -4.584764, 1, 1, 1, 1, 1,
-0.6620597, -1.101456, -3.843518, 1, 1, 1, 1, 1,
-0.6578825, -0.1463427, -1.045585, 1, 1, 1, 1, 1,
-0.6577385, -0.5457532, -0.7282636, 1, 1, 1, 1, 1,
-0.6553833, -0.1853697, -1.627469, 1, 1, 1, 1, 1,
-0.6541803, 1.210565, 2.665814, 1, 1, 1, 1, 1,
-0.6539356, -0.8549193, -1.45979, 1, 1, 1, 1, 1,
-0.6534763, -0.664075, -2.47209, 1, 1, 1, 1, 1,
-0.653396, 1.779812, 0.9769006, 1, 1, 1, 1, 1,
-0.6533434, 0.5487707, -2.646477, 1, 1, 1, 1, 1,
-0.651028, 0.6313252, -0.06903227, 1, 1, 1, 1, 1,
-0.6508156, 0.9913841, 0.9545339, 0, 0, 1, 1, 1,
-0.6498508, 0.4400337, -1.534996, 1, 0, 0, 1, 1,
-0.6490039, -0.6329033, -0.9158783, 1, 0, 0, 1, 1,
-0.6399978, -0.2468133, -3.272312, 1, 0, 0, 1, 1,
-0.6397706, 0.07022592, -2.441835, 1, 0, 0, 1, 1,
-0.6374937, -0.3985038, -0.3374181, 1, 0, 0, 1, 1,
-0.6324592, 0.05979576, -0.5691531, 0, 0, 0, 1, 1,
-0.6323751, -0.1873284, -0.517193, 0, 0, 0, 1, 1,
-0.6167839, 0.2940555, -1.601931, 0, 0, 0, 1, 1,
-0.6139657, 1.283043, -1.554281, 0, 0, 0, 1, 1,
-0.6137849, -0.11316, -2.78112, 0, 0, 0, 1, 1,
-0.6084654, -1.948596, -3.847261, 0, 0, 0, 1, 1,
-0.6064519, -1.914179, -3.409553, 0, 0, 0, 1, 1,
-0.597195, -0.9484754, -0.8687844, 1, 1, 1, 1, 1,
-0.5971164, 0.4778063, -0.009650333, 1, 1, 1, 1, 1,
-0.5936688, -0.4354726, -1.142413, 1, 1, 1, 1, 1,
-0.5899594, -0.435687, -1.723075, 1, 1, 1, 1, 1,
-0.588833, 1.38748, -0.5248688, 1, 1, 1, 1, 1,
-0.5870509, 0.2201569, -1.353837, 1, 1, 1, 1, 1,
-0.5856209, 1.3645, 0.5704741, 1, 1, 1, 1, 1,
-0.5798765, -0.9940357, -3.726913, 1, 1, 1, 1, 1,
-0.5779307, 0.02146622, -2.157708, 1, 1, 1, 1, 1,
-0.575504, 0.9925704, -0.4179198, 1, 1, 1, 1, 1,
-0.5746704, 1.712057, -0.3483592, 1, 1, 1, 1, 1,
-0.5670086, -0.725206, -1.685026, 1, 1, 1, 1, 1,
-0.5637195, 0.2689702, -1.673443, 1, 1, 1, 1, 1,
-0.5617747, -1.01798, -3.360516, 1, 1, 1, 1, 1,
-0.5613609, -0.6361573, -2.846012, 1, 1, 1, 1, 1,
-0.5549301, -0.215024, -2.428931, 0, 0, 1, 1, 1,
-0.5538806, 0.07522923, 1.951727, 1, 0, 0, 1, 1,
-0.5515929, -0.7249067, -4.021666, 1, 0, 0, 1, 1,
-0.551002, 0.4780419, -0.1169306, 1, 0, 0, 1, 1,
-0.5477353, -0.6046753, -2.854562, 1, 0, 0, 1, 1,
-0.5454992, 1.323545, 0.5434382, 1, 0, 0, 1, 1,
-0.5454274, 0.6482021, -3.057222, 0, 0, 0, 1, 1,
-0.5452582, -0.2522298, -1.498954, 0, 0, 0, 1, 1,
-0.5451277, 0.04130515, -2.389265, 0, 0, 0, 1, 1,
-0.5437529, 0.692263, -1.418619, 0, 0, 0, 1, 1,
-0.5403888, -1.133549, -2.283679, 0, 0, 0, 1, 1,
-0.5393983, 1.503885, -1.202435, 0, 0, 0, 1, 1,
-0.5391542, 0.2194804, -2.552031, 0, 0, 0, 1, 1,
-0.5358485, 0.5966847, -0.7766274, 1, 1, 1, 1, 1,
-0.5353045, 1.046471, -1.040425, 1, 1, 1, 1, 1,
-0.5324283, -0.07379185, -1.397678, 1, 1, 1, 1, 1,
-0.53136, -0.7268261, -1.332145, 1, 1, 1, 1, 1,
-0.5305567, 1.573808, -0.4173798, 1, 1, 1, 1, 1,
-0.5188949, -0.05126676, -1.822444, 1, 1, 1, 1, 1,
-0.5175682, -0.7538009, -1.271121, 1, 1, 1, 1, 1,
-0.5151528, 1.162859, -0.4805216, 1, 1, 1, 1, 1,
-0.5114535, 1.28601, 0.001485115, 1, 1, 1, 1, 1,
-0.5090603, -0.8381677, -1.610651, 1, 1, 1, 1, 1,
-0.5064118, -1.418952, -3.280649, 1, 1, 1, 1, 1,
-0.5044973, -1.32821, -2.869523, 1, 1, 1, 1, 1,
-0.5023458, -1.639244, -2.393596, 1, 1, 1, 1, 1,
-0.4961913, 1.681471, -1.75109, 1, 1, 1, 1, 1,
-0.4956212, 1.794017, -1.241808, 1, 1, 1, 1, 1,
-0.4924586, -0.5663697, -2.805582, 0, 0, 1, 1, 1,
-0.4897676, 0.3042752, -1.168775, 1, 0, 0, 1, 1,
-0.4878478, 0.9597104, -3.120253, 1, 0, 0, 1, 1,
-0.4860356, 0.1942178, -0.3981436, 1, 0, 0, 1, 1,
-0.4847492, 1.576217, -1.694612, 1, 0, 0, 1, 1,
-0.4833021, -0.1247649, -2.25128, 1, 0, 0, 1, 1,
-0.4832546, 1.206061, -0.3158616, 0, 0, 0, 1, 1,
-0.4758233, 0.3712451, -1.182038, 0, 0, 0, 1, 1,
-0.4756505, 0.4222212, -2.762855, 0, 0, 0, 1, 1,
-0.474628, 0.7226341, -1.74063, 0, 0, 0, 1, 1,
-0.4704844, 0.2430491, -0.8332186, 0, 0, 0, 1, 1,
-0.4688981, 0.4097434, -1.025592, 0, 0, 0, 1, 1,
-0.4639915, 1.847965, -2.112119, 0, 0, 0, 1, 1,
-0.4627866, 0.9462817, -1.34529, 1, 1, 1, 1, 1,
-0.4623013, 1.499001, -1.59633, 1, 1, 1, 1, 1,
-0.4561821, 0.7987322, 0.7646195, 1, 1, 1, 1, 1,
-0.4519027, -0.9874107, -1.256676, 1, 1, 1, 1, 1,
-0.4482293, -0.6921367, -0.231129, 1, 1, 1, 1, 1,
-0.4476531, 1.050644, -1.443557, 1, 1, 1, 1, 1,
-0.4449348, 0.9805561, -0.1148545, 1, 1, 1, 1, 1,
-0.4432428, -0.7945893, -3.869929, 1, 1, 1, 1, 1,
-0.4402272, 1.918834, -2.337332, 1, 1, 1, 1, 1,
-0.440039, -0.04421972, -0.5463812, 1, 1, 1, 1, 1,
-0.439395, 1.809078, -0.227429, 1, 1, 1, 1, 1,
-0.4381507, -0.738118, -0.3043645, 1, 1, 1, 1, 1,
-0.4367993, -0.2082529, -3.035403, 1, 1, 1, 1, 1,
-0.4365511, 0.7548273, -1.96797, 1, 1, 1, 1, 1,
-0.4346895, -1.651973, -3.50044, 1, 1, 1, 1, 1,
-0.4334998, 0.3603999, -2.187436, 0, 0, 1, 1, 1,
-0.4289057, -0.1786565, -2.09373, 1, 0, 0, 1, 1,
-0.4217398, 0.4856274, -3.245659, 1, 0, 0, 1, 1,
-0.4211366, 0.05769743, -2.03433, 1, 0, 0, 1, 1,
-0.4193397, 1.037696, 0.9460889, 1, 0, 0, 1, 1,
-0.4096146, -0.5721263, -2.737981, 1, 0, 0, 1, 1,
-0.4089861, 1.469567, 0.343508, 0, 0, 0, 1, 1,
-0.398664, -0.4966487, -2.825216, 0, 0, 0, 1, 1,
-0.3982407, 0.8538802, -0.8633006, 0, 0, 0, 1, 1,
-0.3944981, 1.987872, 0.1949333, 0, 0, 0, 1, 1,
-0.3925637, -0.5965131, -3.123791, 0, 0, 0, 1, 1,
-0.3907496, -0.6449703, -3.665062, 0, 0, 0, 1, 1,
-0.3907117, 2.422533, 0.2434001, 0, 0, 0, 1, 1,
-0.3863538, 0.2291012, -0.3626033, 1, 1, 1, 1, 1,
-0.3827782, -0.382477, -1.874233, 1, 1, 1, 1, 1,
-0.3788635, 0.9077473, -1.19627, 1, 1, 1, 1, 1,
-0.3775143, -1.474421, -3.847936, 1, 1, 1, 1, 1,
-0.3690064, 0.4782813, -1.491284, 1, 1, 1, 1, 1,
-0.3673847, 1.507301, 1.865013, 1, 1, 1, 1, 1,
-0.3644487, 1.30547, -0.3108999, 1, 1, 1, 1, 1,
-0.3643138, -2.000184, -1.514031, 1, 1, 1, 1, 1,
-0.3602167, -1.474392, -3.070578, 1, 1, 1, 1, 1,
-0.3588994, -0.6354204, -3.092037, 1, 1, 1, 1, 1,
-0.3548712, -0.8564252, -1.9925, 1, 1, 1, 1, 1,
-0.354328, -0.05786775, -2.337906, 1, 1, 1, 1, 1,
-0.3531503, 1.095497, -0.4736528, 1, 1, 1, 1, 1,
-0.3524149, -1.952541, -2.25282, 1, 1, 1, 1, 1,
-0.3492396, -2.470059, -1.506291, 1, 1, 1, 1, 1,
-0.3449846, 0.4732134, -0.4200256, 0, 0, 1, 1, 1,
-0.3412408, 0.8437075, -0.3039623, 1, 0, 0, 1, 1,
-0.3405534, 0.1148419, -0.4776154, 1, 0, 0, 1, 1,
-0.340017, -0.1588765, -1.68461, 1, 0, 0, 1, 1,
-0.3395177, -0.427728, -2.541747, 1, 0, 0, 1, 1,
-0.3395065, 0.04794214, -0.07791268, 1, 0, 0, 1, 1,
-0.3391548, -1.874294, -3.154589, 0, 0, 0, 1, 1,
-0.338661, -0.1358698, -3.443142, 0, 0, 0, 1, 1,
-0.3373238, -1.073591, -2.298892, 0, 0, 0, 1, 1,
-0.3331194, -1.900982, -2.295718, 0, 0, 0, 1, 1,
-0.3290215, 0.874843, 0.4677404, 0, 0, 0, 1, 1,
-0.3234055, 0.1326539, 0.07471189, 0, 0, 0, 1, 1,
-0.3227625, 1.814401, -0.01313393, 0, 0, 0, 1, 1,
-0.3217317, -0.6775976, -2.362155, 1, 1, 1, 1, 1,
-0.3189087, -0.7021391, -1.320693, 1, 1, 1, 1, 1,
-0.3172776, -0.1005646, -1.390667, 1, 1, 1, 1, 1,
-0.3157131, -0.6679901, -3.338763, 1, 1, 1, 1, 1,
-0.3137149, -0.2142544, -3.977689, 1, 1, 1, 1, 1,
-0.3114918, -0.04978681, -0.8539333, 1, 1, 1, 1, 1,
-0.3098737, -1.727336, -4.081567, 1, 1, 1, 1, 1,
-0.3088399, -0.3352067, -1.811454, 1, 1, 1, 1, 1,
-0.2998745, -0.402708, -2.289377, 1, 1, 1, 1, 1,
-0.2992484, 2.169877, -1.143999, 1, 1, 1, 1, 1,
-0.2982178, 0.3091201, -1.344563, 1, 1, 1, 1, 1,
-0.2981392, -1.389626, -4.204489, 1, 1, 1, 1, 1,
-0.298138, -0.8863736, -2.473908, 1, 1, 1, 1, 1,
-0.2961337, -0.7488903, -0.9942163, 1, 1, 1, 1, 1,
-0.2913229, 0.2010057, -1.98885, 1, 1, 1, 1, 1,
-0.2833094, -0.5136271, -4.485287, 0, 0, 1, 1, 1,
-0.2775224, -0.2635527, -1.826089, 1, 0, 0, 1, 1,
-0.2729699, 1.17966, -1.446782, 1, 0, 0, 1, 1,
-0.2695519, 1.21104, -1.255015, 1, 0, 0, 1, 1,
-0.2676446, 0.3923729, -3.255786, 1, 0, 0, 1, 1,
-0.2657198, -0.7871613, -2.943964, 1, 0, 0, 1, 1,
-0.2615485, 0.91048, -1.249053, 0, 0, 0, 1, 1,
-0.2496967, 0.7406273, -0.3046207, 0, 0, 0, 1, 1,
-0.2466168, -1.186557, -2.561758, 0, 0, 0, 1, 1,
-0.242137, 0.8424223, -0.2070958, 0, 0, 0, 1, 1,
-0.241763, -0.05499283, -1.855572, 0, 0, 0, 1, 1,
-0.2380179, -0.1999287, -2.489559, 0, 0, 0, 1, 1,
-0.2348881, -1.592806, -3.068631, 0, 0, 0, 1, 1,
-0.2247281, 2.017695, -0.4323529, 1, 1, 1, 1, 1,
-0.2172582, -0.9411921, -1.270401, 1, 1, 1, 1, 1,
-0.2136208, 0.8571991, 0.2340388, 1, 1, 1, 1, 1,
-0.2109385, 1.172389, 0.7433298, 1, 1, 1, 1, 1,
-0.2103822, 2.406076, -0.7985557, 1, 1, 1, 1, 1,
-0.2060618, -0.9123088, -2.542575, 1, 1, 1, 1, 1,
-0.2058256, 1.678937, -1.699903, 1, 1, 1, 1, 1,
-0.2043044, -0.6968988, -1.488342, 1, 1, 1, 1, 1,
-0.2038252, 0.2139322, -2.461072, 1, 1, 1, 1, 1,
-0.2032729, -0.5178367, -3.2909, 1, 1, 1, 1, 1,
-0.2006948, -2.65201, -3.761757, 1, 1, 1, 1, 1,
-0.2004451, -0.3133031, -4.078602, 1, 1, 1, 1, 1,
-0.1965813, 1.011418, 0.6543592, 1, 1, 1, 1, 1,
-0.1913633, 0.3090431, 0.2954026, 1, 1, 1, 1, 1,
-0.1880706, -0.1554797, -2.032845, 1, 1, 1, 1, 1,
-0.1873938, -1.401, -1.543909, 0, 0, 1, 1, 1,
-0.1849088, 0.06443105, -0.5304328, 1, 0, 0, 1, 1,
-0.1777355, -1.658969, -3.509723, 1, 0, 0, 1, 1,
-0.1753798, -0.753203, -3.63224, 1, 0, 0, 1, 1,
-0.1746869, 0.9508871, -0.8376213, 1, 0, 0, 1, 1,
-0.1702734, 0.1535808, -1.151631, 1, 0, 0, 1, 1,
-0.1692835, 0.9020724, -2.224959, 0, 0, 0, 1, 1,
-0.1590378, 0.236717, 1.702834, 0, 0, 0, 1, 1,
-0.1582188, 0.03673086, -0.8309194, 0, 0, 0, 1, 1,
-0.1581076, -1.160487, -1.252657, 0, 0, 0, 1, 1,
-0.1551948, -0.03436671, -2.785973, 0, 0, 0, 1, 1,
-0.1502392, -1.074611, -3.046403, 0, 0, 0, 1, 1,
-0.1466332, 0.5299471, -0.2002499, 0, 0, 0, 1, 1,
-0.1413382, 0.791907, -1.120047, 1, 1, 1, 1, 1,
-0.1412463, -0.3165469, -2.696928, 1, 1, 1, 1, 1,
-0.136846, -0.3487357, -3.074938, 1, 1, 1, 1, 1,
-0.1308989, -0.3332027, -2.032664, 1, 1, 1, 1, 1,
-0.1273663, 1.892578, -0.6373826, 1, 1, 1, 1, 1,
-0.1273044, -0.2100335, -1.453675, 1, 1, 1, 1, 1,
-0.1248375, 0.2563212, -1.423213, 1, 1, 1, 1, 1,
-0.1209933, -0.460451, -1.4987, 1, 1, 1, 1, 1,
-0.1128095, 0.493209, 0.9212813, 1, 1, 1, 1, 1,
-0.112155, 0.3827114, 0.07535929, 1, 1, 1, 1, 1,
-0.1089493, 0.2487831, 0.552981, 1, 1, 1, 1, 1,
-0.1080542, -0.5041699, -2.471715, 1, 1, 1, 1, 1,
-0.1032417, 1.47409, -0.2495489, 1, 1, 1, 1, 1,
-0.1002995, -0.1239074, -2.067902, 1, 1, 1, 1, 1,
-0.09964038, -0.6153476, -1.818085, 1, 1, 1, 1, 1,
-0.09766416, 1.142685, -2.918932, 0, 0, 1, 1, 1,
-0.09665005, 1.573686, 0.2363771, 1, 0, 0, 1, 1,
-0.09421062, -1.570481, -2.741, 1, 0, 0, 1, 1,
-0.09234385, 0.2696369, -1.005284, 1, 0, 0, 1, 1,
-0.09207267, 2.297351, -0.1302654, 1, 0, 0, 1, 1,
-0.09035988, 0.4103136, 0.783329, 1, 0, 0, 1, 1,
-0.08642658, -0.8592585, -2.761787, 0, 0, 0, 1, 1,
-0.08476052, -0.799958, -2.914917, 0, 0, 0, 1, 1,
-0.07948209, 1.460567, -1.206819, 0, 0, 0, 1, 1,
-0.07690633, 0.3173224, 0.1719373, 0, 0, 0, 1, 1,
-0.07518772, 1.852693, -0.5317843, 0, 0, 0, 1, 1,
-0.06685393, -0.4190508, -0.5089471, 0, 0, 0, 1, 1,
-0.06159489, 0.6956581, 0.8655142, 0, 0, 0, 1, 1,
-0.0604222, 1.095526, 0.6501291, 1, 1, 1, 1, 1,
-0.05643798, 1.096915, -0.4702069, 1, 1, 1, 1, 1,
-0.05488805, 0.5625406, 0.40603, 1, 1, 1, 1, 1,
-0.05474574, 0.9527353, -1.766309, 1, 1, 1, 1, 1,
-0.05125359, -0.7222972, -2.843086, 1, 1, 1, 1, 1,
-0.05118384, -0.8937499, -4.3387, 1, 1, 1, 1, 1,
-0.04350003, -0.4562939, -1.772256, 1, 1, 1, 1, 1,
-0.04165825, 0.2539401, 1.464703, 1, 1, 1, 1, 1,
-0.03734432, 0.1198218, -2.239206, 1, 1, 1, 1, 1,
-0.03674688, 1.318667, -1.441132, 1, 1, 1, 1, 1,
-0.03657492, 1.710479, -0.5332409, 1, 1, 1, 1, 1,
-0.02131465, 1.373964, -1.345776, 1, 1, 1, 1, 1,
-0.01962498, 2.650833, -1.156075, 1, 1, 1, 1, 1,
-0.01821101, 0.3102874, 0.7019904, 1, 1, 1, 1, 1,
-0.01676216, 0.4907875, -0.3850183, 1, 1, 1, 1, 1,
-0.01559525, 0.3821184, -0.7914959, 0, 0, 1, 1, 1,
-0.01408436, 0.9383884, 0.7480783, 1, 0, 0, 1, 1,
-0.01112303, -2.027411, -4.063838, 1, 0, 0, 1, 1,
-0.007547829, 0.710315, -1.492466, 1, 0, 0, 1, 1,
-0.001610685, -0.8732648, -1.988168, 1, 0, 0, 1, 1,
0.001334094, 0.1846856, 0.906665, 1, 0, 0, 1, 1,
0.00353073, -0.9965298, 3.206038, 0, 0, 0, 1, 1,
0.004170027, 1.035802, 0.0682137, 0, 0, 0, 1, 1,
0.004916153, 0.3251604, 0.9279929, 0, 0, 0, 1, 1,
0.01436821, -0.5860705, 3.486601, 0, 0, 0, 1, 1,
0.01457943, 0.9894865, 0.9931865, 0, 0, 0, 1, 1,
0.0149187, -0.6371045, 2.512581, 0, 0, 0, 1, 1,
0.01997307, -0.891663, 1.589196, 0, 0, 0, 1, 1,
0.02091519, 1.349198, -1.123102, 1, 1, 1, 1, 1,
0.02274842, 0.1197674, -0.7894948, 1, 1, 1, 1, 1,
0.02834084, -2.298835, 3.915944, 1, 1, 1, 1, 1,
0.0284858, 2.597564, 0.6733363, 1, 1, 1, 1, 1,
0.02959891, 0.2103108, 0.4699841, 1, 1, 1, 1, 1,
0.02963516, 0.4361435, 0.5573317, 1, 1, 1, 1, 1,
0.03164232, 0.09739264, 0.8377366, 1, 1, 1, 1, 1,
0.03240867, -0.5959305, 2.994078, 1, 1, 1, 1, 1,
0.03430593, -1.571776, 3.422987, 1, 1, 1, 1, 1,
0.03546046, 0.9862121, 0.3176204, 1, 1, 1, 1, 1,
0.03801997, -1.603563, 2.959448, 1, 1, 1, 1, 1,
0.03936454, -1.144217, 3.293248, 1, 1, 1, 1, 1,
0.04908953, -0.4247582, 2.624433, 1, 1, 1, 1, 1,
0.04968388, -1.371272, 2.49076, 1, 1, 1, 1, 1,
0.05019149, 2.213037, 0.02892783, 1, 1, 1, 1, 1,
0.05664179, 0.7007008, -0.3520004, 0, 0, 1, 1, 1,
0.05906244, -0.7151952, 3.836935, 1, 0, 0, 1, 1,
0.06088188, 0.7542949, -0.2771153, 1, 0, 0, 1, 1,
0.06525725, 0.6217084, 1.134675, 1, 0, 0, 1, 1,
0.06727403, -0.7114329, 4.965266, 1, 0, 0, 1, 1,
0.06934947, -0.4466535, 2.461339, 1, 0, 0, 1, 1,
0.06995156, 1.467804, 1.930303, 0, 0, 0, 1, 1,
0.07191805, 1.392421, 0.486356, 0, 0, 0, 1, 1,
0.0758072, -0.7925916, 2.64964, 0, 0, 0, 1, 1,
0.07905255, -0.004684751, 0.823405, 0, 0, 0, 1, 1,
0.08103085, -0.009290008, 2.637498, 0, 0, 0, 1, 1,
0.08829857, -1.163234, 0.9740359, 0, 0, 0, 1, 1,
0.09319948, 0.2590425, -0.8029543, 0, 0, 0, 1, 1,
0.101694, -0.3214457, 4.249401, 1, 1, 1, 1, 1,
0.1026467, -0.2157144, 2.833157, 1, 1, 1, 1, 1,
0.1031307, -0.02657866, 3.448578, 1, 1, 1, 1, 1,
0.1057604, -0.1151167, 3.139246, 1, 1, 1, 1, 1,
0.1081493, 1.146937, -0.1354169, 1, 1, 1, 1, 1,
0.116566, -1.426822, 2.686853, 1, 1, 1, 1, 1,
0.1176232, 1.132611, 0.09942953, 1, 1, 1, 1, 1,
0.1177211, 0.1576192, 1.308352, 1, 1, 1, 1, 1,
0.1198242, -0.1484121, 1.837021, 1, 1, 1, 1, 1,
0.123262, -0.3860424, 4.403598, 1, 1, 1, 1, 1,
0.1283711, -2.369653, 3.656751, 1, 1, 1, 1, 1,
0.1317206, -0.01459529, 1.264325, 1, 1, 1, 1, 1,
0.132176, -0.3703244, 3.554102, 1, 1, 1, 1, 1,
0.1391203, 0.5734246, -0.3901911, 1, 1, 1, 1, 1,
0.1397965, -0.1941757, 2.901886, 1, 1, 1, 1, 1,
0.1402327, -0.9419681, 2.242913, 0, 0, 1, 1, 1,
0.1426004, 0.5247477, -1.047539, 1, 0, 0, 1, 1,
0.1441548, -0.03245593, 2.471726, 1, 0, 0, 1, 1,
0.1444825, 0.3057558, 0.9997278, 1, 0, 0, 1, 1,
0.1467278, 2.139617, 0.03384397, 1, 0, 0, 1, 1,
0.1503756, 1.484349, -0.7748982, 1, 0, 0, 1, 1,
0.1514451, -0.3755524, 3.036838, 0, 0, 0, 1, 1,
0.1521181, 0.2061017, 0.8063274, 0, 0, 0, 1, 1,
0.1537087, -1.009622, 3.371484, 0, 0, 0, 1, 1,
0.1559103, -0.3599769, 1.912395, 0, 0, 0, 1, 1,
0.1560738, 0.08083285, 1.566744, 0, 0, 0, 1, 1,
0.1583122, -0.01269934, -0.000696941, 0, 0, 0, 1, 1,
0.160653, 0.1890618, 0.4660915, 0, 0, 0, 1, 1,
0.1615221, 1.199135, 0.2751566, 1, 1, 1, 1, 1,
0.1625149, 1.297106, -1.303446, 1, 1, 1, 1, 1,
0.1667825, -1.000512, 2.304139, 1, 1, 1, 1, 1,
0.1685439, -1.770949, 2.820703, 1, 1, 1, 1, 1,
0.1716129, -0.1766361, 2.247274, 1, 1, 1, 1, 1,
0.1772737, 0.08719121, 1.810739, 1, 1, 1, 1, 1,
0.1821788, -1.672974, 3.867376, 1, 1, 1, 1, 1,
0.1842378, -0.7047949, 1.705168, 1, 1, 1, 1, 1,
0.1880519, -1.018188, 2.632565, 1, 1, 1, 1, 1,
0.1919648, 0.2445744, 0.999225, 1, 1, 1, 1, 1,
0.193228, 0.1299824, 0.6857201, 1, 1, 1, 1, 1,
0.1962946, -0.9935771, 3.483005, 1, 1, 1, 1, 1,
0.1992874, 2.986904, 1.205639, 1, 1, 1, 1, 1,
0.2001642, -1.001174, 3.617459, 1, 1, 1, 1, 1,
0.2036276, 0.5559813, 0.8345325, 1, 1, 1, 1, 1,
0.2054717, 0.8884844, -0.7376872, 0, 0, 1, 1, 1,
0.2187038, 1.130072, -0.1006102, 1, 0, 0, 1, 1,
0.2244093, -0.8842372, 2.737713, 1, 0, 0, 1, 1,
0.2280305, -1.225091, 3.508824, 1, 0, 0, 1, 1,
0.22988, -0.5228386, 0.4339286, 1, 0, 0, 1, 1,
0.2311888, 0.2099225, 2.016856, 1, 0, 0, 1, 1,
0.2312671, -2.79674, 2.460446, 0, 0, 0, 1, 1,
0.232716, -0.4776581, 3.014549, 0, 0, 0, 1, 1,
0.2428551, -0.4244308, 1.272323, 0, 0, 0, 1, 1,
0.2502748, -1.196054, 4.418222, 0, 0, 0, 1, 1,
0.2506616, 0.6399094, 1.062546, 0, 0, 0, 1, 1,
0.2572415, 1.976077, 0.01058297, 0, 0, 0, 1, 1,
0.2583097, -0.7730995, 2.852041, 0, 0, 0, 1, 1,
0.2637649, 1.754, -2.1937, 1, 1, 1, 1, 1,
0.2671252, 0.6774952, 0.799413, 1, 1, 1, 1, 1,
0.2685028, -0.8881543, 3.379217, 1, 1, 1, 1, 1,
0.2722878, -0.3102829, 0.8860856, 1, 1, 1, 1, 1,
0.2774743, -0.2168781, 1.910417, 1, 1, 1, 1, 1,
0.2790357, 0.05361428, 1.390695, 1, 1, 1, 1, 1,
0.279459, -0.3591883, 1.241578, 1, 1, 1, 1, 1,
0.2863986, -0.5125629, 0.8741015, 1, 1, 1, 1, 1,
0.2894854, -0.7164072, 3.754893, 1, 1, 1, 1, 1,
0.2897053, -0.8934366, 3.158447, 1, 1, 1, 1, 1,
0.2899889, -0.5308455, 2.477891, 1, 1, 1, 1, 1,
0.2901613, -1.168527, 4.027645, 1, 1, 1, 1, 1,
0.2914253, -0.3157269, 2.718678, 1, 1, 1, 1, 1,
0.2916954, -0.003935051, 3.233048, 1, 1, 1, 1, 1,
0.2949394, 1.35471, -0.7087985, 1, 1, 1, 1, 1,
0.2962882, -0.09258578, 1.696727, 0, 0, 1, 1, 1,
0.2978292, 1.872524, 1.626523, 1, 0, 0, 1, 1,
0.3020394, -0.5771962, 2.361969, 1, 0, 0, 1, 1,
0.3037792, -0.6366723, 4.015809, 1, 0, 0, 1, 1,
0.303983, 0.8907467, 1.169879, 1, 0, 0, 1, 1,
0.3041158, -1.328434, 2.51234, 1, 0, 0, 1, 1,
0.3050869, 2.53423, 0.4154412, 0, 0, 0, 1, 1,
0.3061664, -0.1673109, 1.766842, 0, 0, 0, 1, 1,
0.3071529, 1.062376, 0.4932064, 0, 0, 0, 1, 1,
0.3122348, 0.1549353, 2.127539, 0, 0, 0, 1, 1,
0.31599, -0.6600939, 1.347215, 0, 0, 0, 1, 1,
0.3164457, -0.4402192, 4.03628, 0, 0, 0, 1, 1,
0.3174416, 0.7424737, -0.03952704, 0, 0, 0, 1, 1,
0.3179377, 1.422276, 0.2406653, 1, 1, 1, 1, 1,
0.3201039, 0.1541853, 1.556525, 1, 1, 1, 1, 1,
0.3245738, -0.6424502, 2.985351, 1, 1, 1, 1, 1,
0.3248431, -0.860956, 2.335025, 1, 1, 1, 1, 1,
0.3259323, -1.139607, 1.395478, 1, 1, 1, 1, 1,
0.3330269, -0.7130038, 2.755938, 1, 1, 1, 1, 1,
0.3364178, 1.123605, 0.8597774, 1, 1, 1, 1, 1,
0.3369296, -1.352147, 1.971885, 1, 1, 1, 1, 1,
0.3383466, 1.850296, -0.09313882, 1, 1, 1, 1, 1,
0.3389772, 0.2662173, 0.2341301, 1, 1, 1, 1, 1,
0.3412039, 1.156199, -0.8603354, 1, 1, 1, 1, 1,
0.341397, -1.245087, 2.169146, 1, 1, 1, 1, 1,
0.3448115, 0.5137586, 1.053068, 1, 1, 1, 1, 1,
0.3480181, -1.524002, 3.752771, 1, 1, 1, 1, 1,
0.3496587, 0.7879377, -0.916837, 1, 1, 1, 1, 1,
0.3544375, -0.810546, 2.880701, 0, 0, 1, 1, 1,
0.35574, 0.5949939, 1.159569, 1, 0, 0, 1, 1,
0.3586507, 0.5995419, -0.6188923, 1, 0, 0, 1, 1,
0.3628168, -0.9701972, 3.370017, 1, 0, 0, 1, 1,
0.3653667, 1.403108, -0.1004526, 1, 0, 0, 1, 1,
0.3683461, -3.050467, 2.733492, 1, 0, 0, 1, 1,
0.3687973, -0.6610341, 2.945334, 0, 0, 0, 1, 1,
0.3690315, 0.4463228, -0.6602946, 0, 0, 0, 1, 1,
0.371268, -1.147143, 2.501596, 0, 0, 0, 1, 1,
0.3717229, -0.450368, 2.205842, 0, 0, 0, 1, 1,
0.3722394, 0.5203884, 0.5518353, 0, 0, 0, 1, 1,
0.373605, 0.4788282, 1.453186, 0, 0, 0, 1, 1,
0.3737216, 0.7767882, 0.9488897, 0, 0, 0, 1, 1,
0.3748354, 1.052917, 0.1221155, 1, 1, 1, 1, 1,
0.3760364, 0.6731708, 0.3909098, 1, 1, 1, 1, 1,
0.3813936, -0.2301228, 1.340159, 1, 1, 1, 1, 1,
0.3885074, -1.584929, 1.01502, 1, 1, 1, 1, 1,
0.3888713, -0.1752454, 3.203122, 1, 1, 1, 1, 1,
0.3892654, 0.2167415, -0.3006641, 1, 1, 1, 1, 1,
0.3919989, -2.617506, 4.615379, 1, 1, 1, 1, 1,
0.3953937, -0.4059802, 3.77221, 1, 1, 1, 1, 1,
0.3959886, -0.1625096, 0.5809515, 1, 1, 1, 1, 1,
0.398953, 0.7532504, 1.541313, 1, 1, 1, 1, 1,
0.3990208, 0.5123542, 1.147248, 1, 1, 1, 1, 1,
0.3997542, -1.835516, 5.311728, 1, 1, 1, 1, 1,
0.4024583, 0.5323232, 1.236477, 1, 1, 1, 1, 1,
0.4027362, 0.3090077, 0.135335, 1, 1, 1, 1, 1,
0.4066374, -0.9231406, 2.968701, 1, 1, 1, 1, 1,
0.4071107, 0.273022, 1.374237, 0, 0, 1, 1, 1,
0.4075551, -0.4554463, 3.799912, 1, 0, 0, 1, 1,
0.4086222, 0.1092219, 0.8842227, 1, 0, 0, 1, 1,
0.4092301, 0.7645798, -3.0358, 1, 0, 0, 1, 1,
0.4108295, 1.351055, 0.227741, 1, 0, 0, 1, 1,
0.4166699, 2.182404, -0.04323557, 1, 0, 0, 1, 1,
0.4172479, -0.287293, 3.709983, 0, 0, 0, 1, 1,
0.4174335, 0.1930679, 0.426726, 0, 0, 0, 1, 1,
0.4178898, 0.7213587, 1.105625, 0, 0, 0, 1, 1,
0.4232826, -0.6533847, 1.438885, 0, 0, 0, 1, 1,
0.4272522, 0.1892324, 1.815386, 0, 0, 0, 1, 1,
0.427857, -0.3841628, 1.503378, 0, 0, 0, 1, 1,
0.4310228, 1.372848, -0.4146766, 0, 0, 0, 1, 1,
0.4321966, 0.6921089, 2.559994, 1, 1, 1, 1, 1,
0.4352256, -0.2511124, 3.247296, 1, 1, 1, 1, 1,
0.4354433, -0.8442417, 3.85544, 1, 1, 1, 1, 1,
0.4354592, -0.2960659, 2.032633, 1, 1, 1, 1, 1,
0.4376436, 0.8032788, 1.191371, 1, 1, 1, 1, 1,
0.4390745, 0.3267489, 1.537531, 1, 1, 1, 1, 1,
0.441501, 1.171902, 1.211793, 1, 1, 1, 1, 1,
0.4424422, 1.172029, 0.660826, 1, 1, 1, 1, 1,
0.4447721, 0.2626427, 2.700773, 1, 1, 1, 1, 1,
0.4518442, -0.3459176, 2.855965, 1, 1, 1, 1, 1,
0.4567651, 0.8096069, 0.9251286, 1, 1, 1, 1, 1,
0.4590294, 0.8190946, 0.2329199, 1, 1, 1, 1, 1,
0.4654899, -1.739478, 2.854003, 1, 1, 1, 1, 1,
0.4660054, -0.1202642, 2.207566, 1, 1, 1, 1, 1,
0.4681064, -1.80457, 3.615313, 1, 1, 1, 1, 1,
0.4701467, 1.492656, 1.246487, 0, 0, 1, 1, 1,
0.4736584, -0.4639121, 2.677356, 1, 0, 0, 1, 1,
0.4745297, -0.3903259, 2.683302, 1, 0, 0, 1, 1,
0.4770344, -0.8508658, 2.446847, 1, 0, 0, 1, 1,
0.4780189, 0.5922581, -0.5218849, 1, 0, 0, 1, 1,
0.4805256, 0.4721356, 0.4087744, 1, 0, 0, 1, 1,
0.4807904, 0.6622853, 1.015, 0, 0, 0, 1, 1,
0.4836036, 0.5193402, 1.358573, 0, 0, 0, 1, 1,
0.4873913, 1.910926, 0.003965918, 0, 0, 0, 1, 1,
0.4984588, -0.4819748, 1.692535, 0, 0, 0, 1, 1,
0.5047249, -0.2398443, 2.419829, 0, 0, 0, 1, 1,
0.5068913, 1.041227, -0.5719166, 0, 0, 0, 1, 1,
0.5069016, 0.6136702, 0.695192, 0, 0, 0, 1, 1,
0.50809, -0.3471782, 2.295712, 1, 1, 1, 1, 1,
0.5103392, 0.1198292, 4.414279, 1, 1, 1, 1, 1,
0.5119409, -1.342224, 2.980113, 1, 1, 1, 1, 1,
0.5136459, -0.7655321, 0.8569537, 1, 1, 1, 1, 1,
0.5202448, -1.384585, 3.559939, 1, 1, 1, 1, 1,
0.5222561, 0.2461618, 2.043216, 1, 1, 1, 1, 1,
0.5266978, -0.1329663, 2.263074, 1, 1, 1, 1, 1,
0.5309851, -0.6687505, 0.8270975, 1, 1, 1, 1, 1,
0.5324988, 0.4524547, 2.673417, 1, 1, 1, 1, 1,
0.5384342, 0.2606623, 2.244076, 1, 1, 1, 1, 1,
0.5396155, 0.7032824, 0.6034223, 1, 1, 1, 1, 1,
0.5466823, -0.003079417, 0.993253, 1, 1, 1, 1, 1,
0.5503119, 0.858876, -0.4956874, 1, 1, 1, 1, 1,
0.5580068, 1.513959, 0.06887523, 1, 1, 1, 1, 1,
0.5591301, -0.04572, 2.813541, 1, 1, 1, 1, 1,
0.5621415, 1.315696, 0.323132, 0, 0, 1, 1, 1,
0.5634614, -0.902517, 3.639135, 1, 0, 0, 1, 1,
0.5711752, 1.225014, 1.467481, 1, 0, 0, 1, 1,
0.5758504, -0.6205125, 2.938762, 1, 0, 0, 1, 1,
0.5766831, -1.099862, 2.169245, 1, 0, 0, 1, 1,
0.577301, 0.5540926, 2.2892, 1, 0, 0, 1, 1,
0.5835887, 0.0237859, 0.5685135, 0, 0, 0, 1, 1,
0.5865431, -0.1784582, 0.4280066, 0, 0, 0, 1, 1,
0.5921484, 0.3539866, 0.6846693, 0, 0, 0, 1, 1,
0.594865, 0.6961196, 0.8117735, 0, 0, 0, 1, 1,
0.5960972, -1.420063, 2.456733, 0, 0, 0, 1, 1,
0.5991952, 0.1492018, 2.051451, 0, 0, 0, 1, 1,
0.601658, 0.06340478, 1.079176, 0, 0, 0, 1, 1,
0.6023242, -0.1485882, -0.2545563, 1, 1, 1, 1, 1,
0.6023521, 0.1056216, -0.6352579, 1, 1, 1, 1, 1,
0.6040293, 0.6742083, -0.1319291, 1, 1, 1, 1, 1,
0.6144845, 0.0200815, 2.476523, 1, 1, 1, 1, 1,
0.6154705, 0.4368437, 1.942284, 1, 1, 1, 1, 1,
0.6156365, -0.405253, 1.838433, 1, 1, 1, 1, 1,
0.6166083, 0.6806031, 0.4222876, 1, 1, 1, 1, 1,
0.6201524, 1.046743, -0.1267022, 1, 1, 1, 1, 1,
0.6204851, 1.544818, 0.7214823, 1, 1, 1, 1, 1,
0.6206591, 0.8666523, 1.849257, 1, 1, 1, 1, 1,
0.6213731, -0.8392607, 2.930242, 1, 1, 1, 1, 1,
0.6225975, -0.5259529, 2.043696, 1, 1, 1, 1, 1,
0.6244594, -0.2383545, 0.8564076, 1, 1, 1, 1, 1,
0.6276953, 0.6769926, 0.481381, 1, 1, 1, 1, 1,
0.6299639, 0.4044225, 0.04698905, 1, 1, 1, 1, 1,
0.6303552, -1.057773, 1.124936, 0, 0, 1, 1, 1,
0.6312959, 1.790322, 1.155896, 1, 0, 0, 1, 1,
0.631429, -0.4411497, 1.145891, 1, 0, 0, 1, 1,
0.632286, 0.1860858, 1.075309, 1, 0, 0, 1, 1,
0.6334922, 0.01523039, 2.10584, 1, 0, 0, 1, 1,
0.6359733, -1.894963, 2.884191, 1, 0, 0, 1, 1,
0.6392844, 1.77227, -1.188722, 0, 0, 0, 1, 1,
0.6395048, 1.1346, 1.023508, 0, 0, 0, 1, 1,
0.6401871, 3.543363, 1.196002, 0, 0, 0, 1, 1,
0.6414514, 1.51851, 0.7361377, 0, 0, 0, 1, 1,
0.6535605, 0.736535, -0.1613313, 0, 0, 0, 1, 1,
0.6541504, -1.761267, 3.869804, 0, 0, 0, 1, 1,
0.6559094, 2.52106, -0.7122624, 0, 0, 0, 1, 1,
0.6563873, 0.3962312, 1.80788, 1, 1, 1, 1, 1,
0.6587236, 0.2711113, 1.982196, 1, 1, 1, 1, 1,
0.6588537, 1.814195, -0.9909385, 1, 1, 1, 1, 1,
0.6659965, -0.5686091, 2.118707, 1, 1, 1, 1, 1,
0.6691154, -0.1532335, 3.271514, 1, 1, 1, 1, 1,
0.6705226, 0.4102415, 2.140495, 1, 1, 1, 1, 1,
0.6744389, 0.6000122, 0.02387731, 1, 1, 1, 1, 1,
0.6749212, -0.7174637, 4.746117, 1, 1, 1, 1, 1,
0.6778422, 0.02728578, -0.03948047, 1, 1, 1, 1, 1,
0.6797013, -0.507936, 2.864429, 1, 1, 1, 1, 1,
0.6819718, 0.3966718, 1.24269, 1, 1, 1, 1, 1,
0.6883774, 1.517273, 0.3405308, 1, 1, 1, 1, 1,
0.7034903, 1.406275, 0.7506669, 1, 1, 1, 1, 1,
0.7168549, 1.433165, 1.661021, 1, 1, 1, 1, 1,
0.7202864, -0.09253379, 1.343992, 1, 1, 1, 1, 1,
0.7288107, -0.08660838, 2.091164, 0, 0, 1, 1, 1,
0.7362791, -0.4115947, 3.803697, 1, 0, 0, 1, 1,
0.7384974, -0.5086468, 1.772499, 1, 0, 0, 1, 1,
0.7397932, -0.4398861, 3.287795, 1, 0, 0, 1, 1,
0.7408012, -0.4799317, 2.557992, 1, 0, 0, 1, 1,
0.7458193, -0.4074516, 1.872418, 1, 0, 0, 1, 1,
0.7460164, -0.3163024, 5.367791, 0, 0, 0, 1, 1,
0.749004, 0.340475, 2.029249, 0, 0, 0, 1, 1,
0.7513572, -0.3186499, 2.45612, 0, 0, 0, 1, 1,
0.7540779, 2.459026, 1.562091, 0, 0, 0, 1, 1,
0.7647128, -0.1169391, 3.726409, 0, 0, 0, 1, 1,
0.7661486, -0.5911036, 2.206186, 0, 0, 0, 1, 1,
0.7694314, -0.7770852, 0.08674997, 0, 0, 0, 1, 1,
0.7694799, -0.6796986, 1.274301, 1, 1, 1, 1, 1,
0.7696438, 1.231003, 0.6967504, 1, 1, 1, 1, 1,
0.7746017, 1.576219, 0.9536301, 1, 1, 1, 1, 1,
0.7760013, -1.958215, 2.669464, 1, 1, 1, 1, 1,
0.7760138, 1.064989, 2.701297, 1, 1, 1, 1, 1,
0.7800472, -0.9430839, 1.797784, 1, 1, 1, 1, 1,
0.7839862, 0.4238481, -0.3917223, 1, 1, 1, 1, 1,
0.7863338, 0.7825159, -0.08473445, 1, 1, 1, 1, 1,
0.7894425, -0.3111293, 1.847614, 1, 1, 1, 1, 1,
0.7937528, -0.1877854, 0.8010042, 1, 1, 1, 1, 1,
0.794189, 0.2592641, -0.09558932, 1, 1, 1, 1, 1,
0.7947076, -0.2236977, 2.109333, 1, 1, 1, 1, 1,
0.7996129, -0.6237057, 1.371698, 1, 1, 1, 1, 1,
0.8134727, 0.9008911, -1.077531, 1, 1, 1, 1, 1,
0.831967, -0.3460978, 3.077655, 1, 1, 1, 1, 1,
0.8368377, 0.927761, 0.05211907, 0, 0, 1, 1, 1,
0.8385329, -0.6829833, 0.1078573, 1, 0, 0, 1, 1,
0.8394455, -0.8262964, 2.92551, 1, 0, 0, 1, 1,
0.8454232, 1.286907, 1.585474, 1, 0, 0, 1, 1,
0.8457572, -1.618714, 2.732619, 1, 0, 0, 1, 1,
0.8478891, -0.2724912, 2.440126, 1, 0, 0, 1, 1,
0.8480213, -1.630978, 2.217447, 0, 0, 0, 1, 1,
0.8510554, 0.2600059, 1.132646, 0, 0, 0, 1, 1,
0.8517784, -0.6820621, 4.278923, 0, 0, 0, 1, 1,
0.8536346, -1.018317, 2.347324, 0, 0, 0, 1, 1,
0.859155, 0.4920489, 1.343781, 0, 0, 0, 1, 1,
0.861066, 0.8158802, -0.7164521, 0, 0, 0, 1, 1,
0.862879, -0.5866743, 2.760609, 0, 0, 0, 1, 1,
0.8678309, 0.1658619, 1.795477, 1, 1, 1, 1, 1,
0.8683684, -1.143653, 2.444979, 1, 1, 1, 1, 1,
0.8726382, 0.7698284, 2.527978, 1, 1, 1, 1, 1,
0.8735933, 0.8733843, 2.042232, 1, 1, 1, 1, 1,
0.8737718, -0.2309699, 1.87894, 1, 1, 1, 1, 1,
0.8765225, -0.9567787, 3.471103, 1, 1, 1, 1, 1,
0.8766381, -0.2636536, 2.647186, 1, 1, 1, 1, 1,
0.8821344, -2.251196, 3.554713, 1, 1, 1, 1, 1,
0.8829486, -0.6371588, 1.14031, 1, 1, 1, 1, 1,
0.8937168, -1.516519, 2.394297, 1, 1, 1, 1, 1,
0.9021374, -1.771099, 3.159479, 1, 1, 1, 1, 1,
0.9065778, -1.286781, 1.801777, 1, 1, 1, 1, 1,
0.9107625, 0.2480519, 0.3331022, 1, 1, 1, 1, 1,
0.9190592, -2.790725, 2.980708, 1, 1, 1, 1, 1,
0.9190932, -0.3429942, 0.9483253, 1, 1, 1, 1, 1,
0.9223711, -1.440795, 2.951068, 0, 0, 1, 1, 1,
0.9266776, 0.373602, 1.754316, 1, 0, 0, 1, 1,
0.9277148, 1.507374, -0.00419955, 1, 0, 0, 1, 1,
0.9297081, -0.662863, 4.352426, 1, 0, 0, 1, 1,
0.9305668, 0.03649123, 1.799831, 1, 0, 0, 1, 1,
0.9313794, -1.882937, 3.919502, 1, 0, 0, 1, 1,
0.9319512, 0.7088537, -1.619226, 0, 0, 0, 1, 1,
0.9508373, 0.2125471, 1.205967, 0, 0, 0, 1, 1,
0.9553836, -0.5813572, 2.609863, 0, 0, 0, 1, 1,
0.9555935, 0.7907124, -0.6994231, 0, 0, 0, 1, 1,
0.9558803, 0.9628616, -0.1475084, 0, 0, 0, 1, 1,
0.9565899, -0.5278863, 1.779457, 0, 0, 0, 1, 1,
0.9582657, 1.337813, 1.826967, 0, 0, 0, 1, 1,
0.9708127, -0.7036496, 0.4437684, 1, 1, 1, 1, 1,
0.9845536, 0.1257595, 3.470794, 1, 1, 1, 1, 1,
0.9851055, 0.2019758, 0.3718869, 1, 1, 1, 1, 1,
0.9870152, 0.9989035, 0.742448, 1, 1, 1, 1, 1,
1.002234, -0.4941482, 3.053724, 1, 1, 1, 1, 1,
1.013974, 1.241706, 0.7974699, 1, 1, 1, 1, 1,
1.026808, 0.9502419, -0.7464864, 1, 1, 1, 1, 1,
1.0323, 0.7327377, -0.3459634, 1, 1, 1, 1, 1,
1.037263, 1.095466, 1.226258, 1, 1, 1, 1, 1,
1.039833, 0.9722368, 0.7079281, 1, 1, 1, 1, 1,
1.043239, -0.7469051, 2.62739, 1, 1, 1, 1, 1,
1.069067, -0.365094, 1.607427, 1, 1, 1, 1, 1,
1.071148, 0.1808747, 1.419986, 1, 1, 1, 1, 1,
1.074143, -0.576981, 1.687023, 1, 1, 1, 1, 1,
1.074801, -0.3343359, 0.4685025, 1, 1, 1, 1, 1,
1.079455, 1.34756, 0.5622477, 0, 0, 1, 1, 1,
1.083706, 0.7390762, 0.29932, 1, 0, 0, 1, 1,
1.085438, -1.138182, 2.189604, 1, 0, 0, 1, 1,
1.089839, 0.4051571, 2.072554, 1, 0, 0, 1, 1,
1.092152, 1.788401, 2.369426, 1, 0, 0, 1, 1,
1.093664, -1.706202, 3.241716, 1, 0, 0, 1, 1,
1.095943, -1.751172, 1.001821, 0, 0, 0, 1, 1,
1.1048, -0.528702, 0.5898924, 0, 0, 0, 1, 1,
1.105661, 0.6563073, -0.5437452, 0, 0, 0, 1, 1,
1.107345, -0.0234692, 0.6260104, 0, 0, 0, 1, 1,
1.112315, -1.952448, 3.576681, 0, 0, 0, 1, 1,
1.115337, -1.001285, 3.584676, 0, 0, 0, 1, 1,
1.116323, -0.8212126, 0.8008153, 0, 0, 0, 1, 1,
1.119559, 0.1030538, 1.113716, 1, 1, 1, 1, 1,
1.125483, 1.616517, 2.10317, 1, 1, 1, 1, 1,
1.130467, 0.09082383, 0.7499011, 1, 1, 1, 1, 1,
1.144533, 1.696937, 0.9168791, 1, 1, 1, 1, 1,
1.149475, -0.9407936, 2.345926, 1, 1, 1, 1, 1,
1.16067, -0.7802408, 3.782142, 1, 1, 1, 1, 1,
1.162065, 0.08319566, 2.093048, 1, 1, 1, 1, 1,
1.170737, 0.8176125, 0.6974578, 1, 1, 1, 1, 1,
1.182885, -0.3674323, 1.273566, 1, 1, 1, 1, 1,
1.1902, -2.115029, 1.555191, 1, 1, 1, 1, 1,
1.19405, -1.972808, 1.511571, 1, 1, 1, 1, 1,
1.204841, 1.316484, 3.447697, 1, 1, 1, 1, 1,
1.215959, 0.1946933, 0.3771657, 1, 1, 1, 1, 1,
1.21784, 1.60568, -1.596702, 1, 1, 1, 1, 1,
1.220979, -0.07318811, 1.664308, 1, 1, 1, 1, 1,
1.230246, 0.9306372, -1.291895, 0, 0, 1, 1, 1,
1.234894, 0.7712126, 0.6199203, 1, 0, 0, 1, 1,
1.239057, -0.07500557, 1.723834, 1, 0, 0, 1, 1,
1.239282, 0.6447284, -0.2402425, 1, 0, 0, 1, 1,
1.244255, 0.352283, 0.4574379, 1, 0, 0, 1, 1,
1.251254, -0.02248258, 3.378266, 1, 0, 0, 1, 1,
1.252674, 0.3773714, 2.117066, 0, 0, 0, 1, 1,
1.255265, 0.933296, 2.420094, 0, 0, 0, 1, 1,
1.259171, 0.9438445, -0.436971, 0, 0, 0, 1, 1,
1.266412, 0.286265, -0.6633112, 0, 0, 0, 1, 1,
1.269428, 1.232625, 0.8518907, 0, 0, 0, 1, 1,
1.270176, 0.4192631, 0.3381303, 0, 0, 0, 1, 1,
1.284217, -1.436006, 1.687032, 0, 0, 0, 1, 1,
1.285298, 1.089148, 0.1556671, 1, 1, 1, 1, 1,
1.287501, 0.7837276, 1.213357, 1, 1, 1, 1, 1,
1.306232, -1.424728, 1.738938, 1, 1, 1, 1, 1,
1.315753, -1.678753, 4.377443, 1, 1, 1, 1, 1,
1.3215, -0.2172995, 0.5618985, 1, 1, 1, 1, 1,
1.344646, 0.245821, 0.9930618, 1, 1, 1, 1, 1,
1.354793, -0.4066592, -0.4620632, 1, 1, 1, 1, 1,
1.359623, -0.2201287, 1.857195, 1, 1, 1, 1, 1,
1.360414, -0.09868266, 2.799006, 1, 1, 1, 1, 1,
1.362846, 0.782002, 1.109606, 1, 1, 1, 1, 1,
1.369421, 0.4204873, 1.174858, 1, 1, 1, 1, 1,
1.370714, -0.9203911, 2.519152, 1, 1, 1, 1, 1,
1.380314, -0.6558076, 0.567544, 1, 1, 1, 1, 1,
1.381845, -0.1129395, 2.727142, 1, 1, 1, 1, 1,
1.388287, 0.7396161, 1.096406, 1, 1, 1, 1, 1,
1.391677, 0.1480405, 3.222787, 0, 0, 1, 1, 1,
1.397562, -0.9949176, 3.76224, 1, 0, 0, 1, 1,
1.399925, -0.7258028, 2.491364, 1, 0, 0, 1, 1,
1.409778, -1.356407, 2.502064, 1, 0, 0, 1, 1,
1.420216, 0.3816682, 0.9914963, 1, 0, 0, 1, 1,
1.420349, 1.116613, 3.010283, 1, 0, 0, 1, 1,
1.436665, 1.590013, 0.4119081, 0, 0, 0, 1, 1,
1.443117, 1.343228, 1.202301, 0, 0, 0, 1, 1,
1.445633, -0.9246113, 2.245299, 0, 0, 0, 1, 1,
1.44704, -0.5379056, 0.7359235, 0, 0, 0, 1, 1,
1.475274, -1.103049, 2.624996, 0, 0, 0, 1, 1,
1.491466, -0.9415582, 1.902801, 0, 0, 0, 1, 1,
1.504005, -0.2159905, 2.760745, 0, 0, 0, 1, 1,
1.505499, 0.4135813, 0.1261296, 1, 1, 1, 1, 1,
1.519337, 0.5308561, 1.531467, 1, 1, 1, 1, 1,
1.519376, -0.5348642, 2.157413, 1, 1, 1, 1, 1,
1.533478, 0.2238873, 3.314812, 1, 1, 1, 1, 1,
1.539638, -1.066954, 2.131738, 1, 1, 1, 1, 1,
1.544849, 0.02456202, 4.82312, 1, 1, 1, 1, 1,
1.552155, 0.9918489, 0.5554231, 1, 1, 1, 1, 1,
1.599729, -2.054997, 2.422892, 1, 1, 1, 1, 1,
1.616921, -0.3531425, 0.839008, 1, 1, 1, 1, 1,
1.617655, 1.493869, 0.7436625, 1, 1, 1, 1, 1,
1.618723, -0.03229785, 0.6873248, 1, 1, 1, 1, 1,
1.627209, 0.1700708, 4.405097, 1, 1, 1, 1, 1,
1.632885, 1.282508, 0.04465077, 1, 1, 1, 1, 1,
1.63457, -0.00250001, 2.168691, 1, 1, 1, 1, 1,
1.656579, -2.430549, 1.19231, 1, 1, 1, 1, 1,
1.656802, 1.550639, 1.138512, 0, 0, 1, 1, 1,
1.67445, 1.815895, 1.280727, 1, 0, 0, 1, 1,
1.675454, 1.191951, -0.047167, 1, 0, 0, 1, 1,
1.686, -1.550387, 1.200518, 1, 0, 0, 1, 1,
1.706243, 0.1064122, 1.486698, 1, 0, 0, 1, 1,
1.707591, -1.46682, 1.261361, 1, 0, 0, 1, 1,
1.713946, 0.09014497, -0.254277, 0, 0, 0, 1, 1,
1.716636, -2.077164, 3.973102, 0, 0, 0, 1, 1,
1.725715, -0.9288628, 2.785127, 0, 0, 0, 1, 1,
1.73458, -1.034203, -0.6104114, 0, 0, 0, 1, 1,
1.737944, -0.2658515, 1.225107, 0, 0, 0, 1, 1,
1.768656, -0.4949926, 1.403236, 0, 0, 0, 1, 1,
1.797996, -1.566741, 1.837757, 0, 0, 0, 1, 1,
1.803455, 0.2892682, -0.07887648, 1, 1, 1, 1, 1,
1.827763, 0.4476855, -0.6578329, 1, 1, 1, 1, 1,
1.832834, 0.9939194, 1.042883, 1, 1, 1, 1, 1,
1.834695, 0.4789861, 1.000358, 1, 1, 1, 1, 1,
1.837106, -0.2384975, 0.8594781, 1, 1, 1, 1, 1,
1.854952, -0.3888957, 2.546206, 1, 1, 1, 1, 1,
1.925296, 0.7599582, 0.653365, 1, 1, 1, 1, 1,
1.936383, 0.1886188, 2.161405, 1, 1, 1, 1, 1,
1.939011, 0.6154678, 0.2727098, 1, 1, 1, 1, 1,
1.939727, 0.441655, 0.6630031, 1, 1, 1, 1, 1,
1.940706, 0.05213271, 0.3021086, 1, 1, 1, 1, 1,
1.966362, -1.038536, 3.445074, 1, 1, 1, 1, 1,
2.104278, 0.6126134, 1.975836, 1, 1, 1, 1, 1,
2.105958, -1.450139, 1.461848, 1, 1, 1, 1, 1,
2.162892, -0.1460331, 0.5476021, 1, 1, 1, 1, 1,
2.165257, 0.9613871, 0.5835533, 0, 0, 1, 1, 1,
2.238387, 0.05166011, 2.88632, 1, 0, 0, 1, 1,
2.321931, -1.184093, 1.099319, 1, 0, 0, 1, 1,
2.330766, -0.7786801, 2.470458, 1, 0, 0, 1, 1,
2.334739, -0.6630513, 1.722879, 1, 0, 0, 1, 1,
2.352993, 0.4361216, 1.774333, 1, 0, 0, 1, 1,
2.42351, -0.8042004, 1.246681, 0, 0, 0, 1, 1,
2.441548, 1.526634, 1.998232, 0, 0, 0, 1, 1,
2.447562, -0.3338528, 2.174925, 0, 0, 0, 1, 1,
2.482306, 2.263518, 0.3523862, 0, 0, 0, 1, 1,
2.490258, -0.4714448, 1.717224, 0, 0, 0, 1, 1,
2.501913, 0.4567481, 0.0568263, 0, 0, 0, 1, 1,
2.527828, -0.9387816, 0.9401857, 0, 0, 0, 1, 1,
2.586255, 0.02572016, 2.548004, 1, 1, 1, 1, 1,
2.735394, -0.03280063, 2.287411, 1, 1, 1, 1, 1,
2.770057, -0.5642803, 2.78723, 1, 1, 1, 1, 1,
2.856838, -0.2504021, 2.787227, 1, 1, 1, 1, 1,
3.055877, 1.403362, 0.5047889, 1, 1, 1, 1, 1,
3.40918, 0.8375722, 1.920306, 1, 1, 1, 1, 1,
3.474194, 0.9339171, 2.225948, 1, 1, 1, 1, 1
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
var radius = 9.515907;
var distance = 33.42422;
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
mvMatrix.translate( -0.1519306, -0.2464476, -0.2284648 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.42422);
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