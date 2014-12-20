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
-3.895172, -0.9377446, -0.1496864, 1, 0, 0, 1,
-3.063385, -0.3277165, -3.186481, 1, 0.007843138, 0, 1,
-3.057061, -0.2210348, -2.440911, 1, 0.01176471, 0, 1,
-2.946503, -0.4913092, -3.365725, 1, 0.01960784, 0, 1,
-2.72147, 1.262814, -1.213631, 1, 0.02352941, 0, 1,
-2.707747, 1.557576, -0.8463529, 1, 0.03137255, 0, 1,
-2.656881, 0.1465016, -1.181864, 1, 0.03529412, 0, 1,
-2.641893, 0.1686989, -3.898139, 1, 0.04313726, 0, 1,
-2.633993, 0.813702, -0.8945392, 1, 0.04705882, 0, 1,
-2.579812, -0.609892, -0.2635547, 1, 0.05490196, 0, 1,
-2.533896, 0.3698849, -2.221341, 1, 0.05882353, 0, 1,
-2.500976, 0.5363364, -1.104093, 1, 0.06666667, 0, 1,
-2.366543, -1.982386, -1.612598, 1, 0.07058824, 0, 1,
-2.351719, -0.3125774, -2.256467, 1, 0.07843138, 0, 1,
-2.337345, -1.025748, -0.1361887, 1, 0.08235294, 0, 1,
-2.320468, -1.626378, -2.028655, 1, 0.09019608, 0, 1,
-2.307039, -0.09307294, -2.332292, 1, 0.09411765, 0, 1,
-2.218573, 0.2498669, 0.1687123, 1, 0.1019608, 0, 1,
-2.215335, 0.4246489, -1.365443, 1, 0.1098039, 0, 1,
-2.188756, 1.686081, -0.841657, 1, 0.1137255, 0, 1,
-2.156312, -0.4497665, -2.348108, 1, 0.1215686, 0, 1,
-2.153526, -0.1039664, -3.232189, 1, 0.1254902, 0, 1,
-2.152502, 0.05774247, -0.2206735, 1, 0.1333333, 0, 1,
-2.13575, -1.069738, -2.739979, 1, 0.1372549, 0, 1,
-2.117928, 1.694975, -2.297126, 1, 0.145098, 0, 1,
-2.078316, 0.2324057, -1.079213, 1, 0.1490196, 0, 1,
-2.072816, 0.5998039, -1.706677, 1, 0.1568628, 0, 1,
-2.05396, 0.8130369, -3.302241, 1, 0.1607843, 0, 1,
-2.017701, -1.039883, -0.3123272, 1, 0.1686275, 0, 1,
-2.015655, -1.913085, 0.1493938, 1, 0.172549, 0, 1,
-2.00091, 0.8707196, -0.03140588, 1, 0.1803922, 0, 1,
-1.981712, -1.807922, -2.791337, 1, 0.1843137, 0, 1,
-1.960613, -1.419083, -1.336697, 1, 0.1921569, 0, 1,
-1.937617, 1.169588, -0.2937048, 1, 0.1960784, 0, 1,
-1.935947, -0.2487494, -2.471361, 1, 0.2039216, 0, 1,
-1.934724, 1.148234, -1.345505, 1, 0.2117647, 0, 1,
-1.916161, 1.11786, -2.019089, 1, 0.2156863, 0, 1,
-1.909696, 0.7194355, 0.2553267, 1, 0.2235294, 0, 1,
-1.896957, 0.7734824, -0.6535731, 1, 0.227451, 0, 1,
-1.851255, -0.5694124, -2.316072, 1, 0.2352941, 0, 1,
-1.838461, -0.416817, -0.6191093, 1, 0.2392157, 0, 1,
-1.830024, -0.4163277, -1.081191, 1, 0.2470588, 0, 1,
-1.829917, -0.7513062, -0.8473138, 1, 0.2509804, 0, 1,
-1.826737, -1.682358, -1.26592, 1, 0.2588235, 0, 1,
-1.80417, 0.2048615, -2.682285, 1, 0.2627451, 0, 1,
-1.802011, 1.341121, -1.066965, 1, 0.2705882, 0, 1,
-1.798194, 0.9774367, -2.068437, 1, 0.2745098, 0, 1,
-1.757728, 2.185559, -1.077943, 1, 0.282353, 0, 1,
-1.726311, 0.05401629, -1.462187, 1, 0.2862745, 0, 1,
-1.698281, 0.5604553, -0.4490916, 1, 0.2941177, 0, 1,
-1.686595, 0.125842, -2.374829, 1, 0.3019608, 0, 1,
-1.652743, -1.584132, -3.649205, 1, 0.3058824, 0, 1,
-1.622334, -1.267772, -3.242718, 1, 0.3137255, 0, 1,
-1.620845, -1.592832, -1.764595, 1, 0.3176471, 0, 1,
-1.618835, 0.6881427, -1.650412, 1, 0.3254902, 0, 1,
-1.608918, 0.4722872, -2.381852, 1, 0.3294118, 0, 1,
-1.601419, 0.257051, -0.9851334, 1, 0.3372549, 0, 1,
-1.590661, -0.4076371, 1.073339, 1, 0.3411765, 0, 1,
-1.587383, -0.4042842, -2.7624, 1, 0.3490196, 0, 1,
-1.58442, -1.142188, -0.2076223, 1, 0.3529412, 0, 1,
-1.581866, 0.711791, -1.145142, 1, 0.3607843, 0, 1,
-1.580718, 0.2652161, -1.271127, 1, 0.3647059, 0, 1,
-1.580138, 0.7423843, -0.1031703, 1, 0.372549, 0, 1,
-1.565172, 0.4571415, -1.931618, 1, 0.3764706, 0, 1,
-1.562962, -1.86, -2.509464, 1, 0.3843137, 0, 1,
-1.561547, 1.687839, -0.6314294, 1, 0.3882353, 0, 1,
-1.559716, -0.7980945, -1.735024, 1, 0.3960784, 0, 1,
-1.554261, -1.878292, -3.416965, 1, 0.4039216, 0, 1,
-1.55303, -0.05116066, -2.43903, 1, 0.4078431, 0, 1,
-1.55005, 0.630447, -0.8636339, 1, 0.4156863, 0, 1,
-1.530159, 0.9435799, 1.061333, 1, 0.4196078, 0, 1,
-1.52551, -0.01371198, -2.464564, 1, 0.427451, 0, 1,
-1.523783, -0.02675535, -1.778448, 1, 0.4313726, 0, 1,
-1.520657, -0.4501628, -3.876081, 1, 0.4392157, 0, 1,
-1.518693, 0.1667042, -0.9303445, 1, 0.4431373, 0, 1,
-1.515427, -0.09178435, -1.464134, 1, 0.4509804, 0, 1,
-1.489288, -0.6002681, -0.4859222, 1, 0.454902, 0, 1,
-1.484031, -1.53051, -1.478436, 1, 0.4627451, 0, 1,
-1.469148, 0.7116864, -0.4011509, 1, 0.4666667, 0, 1,
-1.464437, 2.060856, -1.454211, 1, 0.4745098, 0, 1,
-1.456563, 0.6406511, -1.540968, 1, 0.4784314, 0, 1,
-1.451824, -0.7014427, -2.41191, 1, 0.4862745, 0, 1,
-1.443402, -1.44175, -3.195192, 1, 0.4901961, 0, 1,
-1.435911, 0.03524675, -1.650761, 1, 0.4980392, 0, 1,
-1.428845, 0.5088705, -2.894262, 1, 0.5058824, 0, 1,
-1.425642, -0.06840678, -3.586973, 1, 0.509804, 0, 1,
-1.418249, -0.3844393, -0.2846418, 1, 0.5176471, 0, 1,
-1.413497, -1.368567, -2.898344, 1, 0.5215687, 0, 1,
-1.399386, -0.8520933, -0.001636039, 1, 0.5294118, 0, 1,
-1.388814, -0.4836787, -1.766633, 1, 0.5333334, 0, 1,
-1.383274, 0.08940551, -0.5457026, 1, 0.5411765, 0, 1,
-1.382634, -0.5216571, -3.187002, 1, 0.5450981, 0, 1,
-1.374297, -0.5420443, -1.383403, 1, 0.5529412, 0, 1,
-1.365168, -1.404915, -3.081046, 1, 0.5568628, 0, 1,
-1.362149, 0.6955219, -2.069689, 1, 0.5647059, 0, 1,
-1.361503, 0.4801931, -1.290707, 1, 0.5686275, 0, 1,
-1.358926, -0.4712394, -0.8473311, 1, 0.5764706, 0, 1,
-1.358227, 0.2988633, -0.9336912, 1, 0.5803922, 0, 1,
-1.34596, -0.6718309, -0.7043821, 1, 0.5882353, 0, 1,
-1.34457, 1.057456, -0.4261106, 1, 0.5921569, 0, 1,
-1.342346, -0.3551894, -1.621672, 1, 0.6, 0, 1,
-1.341559, -0.2106725, -2.07136, 1, 0.6078432, 0, 1,
-1.333566, -1.07051, -1.052363, 1, 0.6117647, 0, 1,
-1.328006, 0.9967083, -1.529769, 1, 0.6196079, 0, 1,
-1.32433, 0.475048, -0.2984242, 1, 0.6235294, 0, 1,
-1.322299, -1.200818, -0.696492, 1, 0.6313726, 0, 1,
-1.320511, -0.2731974, -1.438127, 1, 0.6352941, 0, 1,
-1.319662, -0.9956315, -3.413016, 1, 0.6431373, 0, 1,
-1.307072, 0.7803958, -1.499193, 1, 0.6470588, 0, 1,
-1.300369, -0.8875235, -3.350288, 1, 0.654902, 0, 1,
-1.286436, 0.4303944, 0.1232914, 1, 0.6588235, 0, 1,
-1.281092, -2.41129, -3.303846, 1, 0.6666667, 0, 1,
-1.278317, -1.565782, -0.9364502, 1, 0.6705883, 0, 1,
-1.268633, 0.5830049, -1.034597, 1, 0.6784314, 0, 1,
-1.26625, -0.118637, -2.058799, 1, 0.682353, 0, 1,
-1.264626, -0.1175411, -1.162355, 1, 0.6901961, 0, 1,
-1.260981, -0.9025396, -2.611428, 1, 0.6941177, 0, 1,
-1.256254, 0.1271977, 0.2644714, 1, 0.7019608, 0, 1,
-1.253375, 0.3387089, -1.18539, 1, 0.7098039, 0, 1,
-1.243731, -0.9728079, -2.270601, 1, 0.7137255, 0, 1,
-1.241683, -0.2542897, -0.07042878, 1, 0.7215686, 0, 1,
-1.225778, -1.756379, -1.928092, 1, 0.7254902, 0, 1,
-1.214311, -0.2599778, -3.592258, 1, 0.7333333, 0, 1,
-1.199326, 0.4407063, -0.9372296, 1, 0.7372549, 0, 1,
-1.195824, -1.241492, -1.784909, 1, 0.7450981, 0, 1,
-1.189273, -0.5144572, -2.621521, 1, 0.7490196, 0, 1,
-1.185446, -0.464576, -2.090422, 1, 0.7568628, 0, 1,
-1.18254, -0.4769283, -3.605267, 1, 0.7607843, 0, 1,
-1.173283, -0.7537469, -1.712411, 1, 0.7686275, 0, 1,
-1.173275, -0.02953907, -0.000877547, 1, 0.772549, 0, 1,
-1.172722, 0.5251292, -1.044354, 1, 0.7803922, 0, 1,
-1.172027, 1.63309, -0.8556464, 1, 0.7843137, 0, 1,
-1.166809, 0.4344011, -0.9923834, 1, 0.7921569, 0, 1,
-1.161358, -0.6222944, -1.593393, 1, 0.7960784, 0, 1,
-1.158835, 0.02564723, -2.145685, 1, 0.8039216, 0, 1,
-1.158086, -0.4897711, -1.410618, 1, 0.8117647, 0, 1,
-1.154421, 0.2010647, -0.8647738, 1, 0.8156863, 0, 1,
-1.147633, -1.074399, -2.801341, 1, 0.8235294, 0, 1,
-1.131734, -0.4918182, -2.263612, 1, 0.827451, 0, 1,
-1.122844, 0.3262107, -0.3106337, 1, 0.8352941, 0, 1,
-1.12073, 0.7526904, -1.002272, 1, 0.8392157, 0, 1,
-1.119568, 1.859931, 0.2911167, 1, 0.8470588, 0, 1,
-1.113057, -0.8040807, -2.957687, 1, 0.8509804, 0, 1,
-1.112491, 0.7215088, -1.035887, 1, 0.8588235, 0, 1,
-1.096275, 0.6759422, -1.929296, 1, 0.8627451, 0, 1,
-1.095365, 0.2744516, -2.700955, 1, 0.8705882, 0, 1,
-1.089679, -1.446726, -2.679834, 1, 0.8745098, 0, 1,
-1.086286, 1.173154, -1.329706, 1, 0.8823529, 0, 1,
-1.080912, -0.3724709, -1.250744, 1, 0.8862745, 0, 1,
-1.075857, 0.30732, -1.155331, 1, 0.8941177, 0, 1,
-1.075762, 0.08156293, -2.098944, 1, 0.8980392, 0, 1,
-1.072533, -0.3524024, -0.3420678, 1, 0.9058824, 0, 1,
-1.065689, 2.631645, 0.7132405, 1, 0.9137255, 0, 1,
-1.06487, 0.1118491, -0.69763, 1, 0.9176471, 0, 1,
-1.063588, 1.44911, -0.4373839, 1, 0.9254902, 0, 1,
-1.061, 1.449208, -0.2912618, 1, 0.9294118, 0, 1,
-1.059591, -0.8003885, -2.127207, 1, 0.9372549, 0, 1,
-1.058967, -0.4904469, -2.828502, 1, 0.9411765, 0, 1,
-1.049486, 1.395945, 2.038466, 1, 0.9490196, 0, 1,
-1.045402, 0.8345793, -1.416294, 1, 0.9529412, 0, 1,
-1.041768, 0.2863054, -2.447487, 1, 0.9607843, 0, 1,
-1.039789, 0.1603276, -1.302213, 1, 0.9647059, 0, 1,
-1.038093, 0.4763691, -1.525978, 1, 0.972549, 0, 1,
-1.037673, -0.5118743, -2.177736, 1, 0.9764706, 0, 1,
-1.037416, -1.523951, -2.908397, 1, 0.9843137, 0, 1,
-1.035139, 2.232468, -1.441876, 1, 0.9882353, 0, 1,
-1.033664, -0.7155493, -0.3621834, 1, 0.9960784, 0, 1,
-1.026178, -1.252237, -2.418576, 0.9960784, 1, 0, 1,
-1.025662, -0.8917657, -2.321496, 0.9921569, 1, 0, 1,
-1.015181, -1.686393, -3.634598, 0.9843137, 1, 0, 1,
-1.014708, -0.4089951, -1.280086, 0.9803922, 1, 0, 1,
-1.005052, -0.5606784, -2.408131, 0.972549, 1, 0, 1,
-1.000012, 1.630165, -1.151367, 0.9686275, 1, 0, 1,
-0.9943174, -1.305853, -1.862342, 0.9607843, 1, 0, 1,
-0.9910323, -0.01246954, -1.308084, 0.9568627, 1, 0, 1,
-0.9890296, 0.4987851, -0.2806081, 0.9490196, 1, 0, 1,
-0.98292, 1.000675, 0.5644495, 0.945098, 1, 0, 1,
-0.9753351, -0.179458, -1.749972, 0.9372549, 1, 0, 1,
-0.9747684, -0.7416287, -2.660927, 0.9333333, 1, 0, 1,
-0.9709015, -2.340813, -1.10051, 0.9254902, 1, 0, 1,
-0.9704142, -1.666196, -4.174849, 0.9215686, 1, 0, 1,
-0.9665595, -0.8208175, -1.576393, 0.9137255, 1, 0, 1,
-0.963848, -1.472132, -2.787998, 0.9098039, 1, 0, 1,
-0.9546503, 1.148558, -0.1820053, 0.9019608, 1, 0, 1,
-0.9527408, 0.7343666, -0.47506, 0.8941177, 1, 0, 1,
-0.9489924, 1.526124, -0.1954686, 0.8901961, 1, 0, 1,
-0.9483705, 1.291358, 0.631102, 0.8823529, 1, 0, 1,
-0.9459966, -0.8133798, -2.117846, 0.8784314, 1, 0, 1,
-0.9411223, 0.8006226, -1.420825, 0.8705882, 1, 0, 1,
-0.9372101, -0.5783383, -3.05012, 0.8666667, 1, 0, 1,
-0.9294961, 1.249563, 0.5202925, 0.8588235, 1, 0, 1,
-0.92608, 1.719179, -0.1230425, 0.854902, 1, 0, 1,
-0.9133002, -0.6190041, -3.847599, 0.8470588, 1, 0, 1,
-0.907662, 0.8183635, 0.5405013, 0.8431373, 1, 0, 1,
-0.9004622, -0.9974052, -2.842183, 0.8352941, 1, 0, 1,
-0.8978215, -0.9430537, -2.230244, 0.8313726, 1, 0, 1,
-0.8972795, -0.8511413, -1.536558, 0.8235294, 1, 0, 1,
-0.8964328, -1.111403, -3.344077, 0.8196079, 1, 0, 1,
-0.8953573, 1.262802, -2.531195, 0.8117647, 1, 0, 1,
-0.889585, -0.9455323, -3.694258, 0.8078431, 1, 0, 1,
-0.8884351, 1.168843, 0.2261551, 0.8, 1, 0, 1,
-0.8866732, 1.595037, -0.6761361, 0.7921569, 1, 0, 1,
-0.8830993, 0.2021997, -0.5170234, 0.7882353, 1, 0, 1,
-0.882358, 0.5842392, -1.881616, 0.7803922, 1, 0, 1,
-0.8736866, -1.022945, -3.618207, 0.7764706, 1, 0, 1,
-0.8715776, 1.482608, -0.05228332, 0.7686275, 1, 0, 1,
-0.8668168, -0.1671742, -2.414828, 0.7647059, 1, 0, 1,
-0.8615062, -1.455837, -2.544912, 0.7568628, 1, 0, 1,
-0.8611792, -1.869942, -2.463158, 0.7529412, 1, 0, 1,
-0.8551171, 1.369941, 0.1681163, 0.7450981, 1, 0, 1,
-0.8524481, 0.2530702, -1.142769, 0.7411765, 1, 0, 1,
-0.8522961, 0.516399, -1.881759, 0.7333333, 1, 0, 1,
-0.8510678, 0.3179545, -1.988591, 0.7294118, 1, 0, 1,
-0.8498394, 0.9024309, -2.638001, 0.7215686, 1, 0, 1,
-0.8475763, -0.3978194, -2.342505, 0.7176471, 1, 0, 1,
-0.8448007, 0.03888349, -0.5819389, 0.7098039, 1, 0, 1,
-0.8421889, 0.2136241, -1.242054, 0.7058824, 1, 0, 1,
-0.835698, 1.478305, 0.5877017, 0.6980392, 1, 0, 1,
-0.8355652, -0.6780224, -2.56103, 0.6901961, 1, 0, 1,
-0.8336221, 1.922769, -0.9592574, 0.6862745, 1, 0, 1,
-0.8332245, 1.423924, -0.4543235, 0.6784314, 1, 0, 1,
-0.8305837, -2.975075, -3.056001, 0.6745098, 1, 0, 1,
-0.8276908, 0.6414514, 0.01496789, 0.6666667, 1, 0, 1,
-0.8266129, -0.0899512, -1.063743, 0.6627451, 1, 0, 1,
-0.8229242, -0.365289, -1.259137, 0.654902, 1, 0, 1,
-0.8148329, -2.099831, -2.197167, 0.6509804, 1, 0, 1,
-0.8119049, 0.5886707, -2.426441, 0.6431373, 1, 0, 1,
-0.8108078, -0.06712696, -2.496754, 0.6392157, 1, 0, 1,
-0.8105255, -1.047484, -2.591107, 0.6313726, 1, 0, 1,
-0.8046882, -0.1573083, -1.084045, 0.627451, 1, 0, 1,
-0.7999278, 1.556485, 0.1066463, 0.6196079, 1, 0, 1,
-0.7993816, -0.8182331, -2.481524, 0.6156863, 1, 0, 1,
-0.7980579, 0.3274902, -0.9466373, 0.6078432, 1, 0, 1,
-0.7976567, -1.83026, -2.698052, 0.6039216, 1, 0, 1,
-0.7956241, 1.181293, 0.8585477, 0.5960785, 1, 0, 1,
-0.7905055, -0.846764, -2.578833, 0.5882353, 1, 0, 1,
-0.7891208, -0.4942815, -2.732339, 0.5843138, 1, 0, 1,
-0.7871115, -2.20198, -3.819689, 0.5764706, 1, 0, 1,
-0.7854632, -1.010326, -3.889904, 0.572549, 1, 0, 1,
-0.7848557, 1.648611, -0.6323106, 0.5647059, 1, 0, 1,
-0.7835643, 0.7866935, -0.2600115, 0.5607843, 1, 0, 1,
-0.7819955, 0.6529391, -1.583427, 0.5529412, 1, 0, 1,
-0.7817567, -2.283666, -2.922137, 0.5490196, 1, 0, 1,
-0.7800047, 2.373073, -1.054937, 0.5411765, 1, 0, 1,
-0.7784613, 0.22709, -1.589443, 0.5372549, 1, 0, 1,
-0.7721164, -1.141578, -3.822415, 0.5294118, 1, 0, 1,
-0.7578281, -1.195786, -1.814567, 0.5254902, 1, 0, 1,
-0.752085, -1.016485, -2.761119, 0.5176471, 1, 0, 1,
-0.7518817, -0.9464689, -2.075816, 0.5137255, 1, 0, 1,
-0.7483664, 0.3457916, -0.6139987, 0.5058824, 1, 0, 1,
-0.7461861, 1.019499, 0.3781596, 0.5019608, 1, 0, 1,
-0.7410768, 0.1013035, 0.4536648, 0.4941176, 1, 0, 1,
-0.7364812, -0.5983884, -0.957846, 0.4862745, 1, 0, 1,
-0.7322785, 0.4600439, -0.7599053, 0.4823529, 1, 0, 1,
-0.7299443, 0.5892439, -0.7437103, 0.4745098, 1, 0, 1,
-0.7242018, -0.05502315, -0.9085608, 0.4705882, 1, 0, 1,
-0.7221796, 1.065815, -0.5409434, 0.4627451, 1, 0, 1,
-0.721693, -0.831673, -3.18526, 0.4588235, 1, 0, 1,
-0.7209921, -1.947189, -1.611994, 0.4509804, 1, 0, 1,
-0.7187191, -0.3776582, -2.738443, 0.4470588, 1, 0, 1,
-0.7177863, 1.052183, -0.1594736, 0.4392157, 1, 0, 1,
-0.7147877, 0.3643097, -0.6292592, 0.4352941, 1, 0, 1,
-0.7135122, 0.3636193, 1.160684, 0.427451, 1, 0, 1,
-0.7131997, -0.832594, -3.114323, 0.4235294, 1, 0, 1,
-0.7117623, 0.5626808, 2.255587, 0.4156863, 1, 0, 1,
-0.7046225, 0.5118418, -0.3404048, 0.4117647, 1, 0, 1,
-0.7031924, -0.1001828, -1.395382, 0.4039216, 1, 0, 1,
-0.7025873, -0.687448, -1.456304, 0.3960784, 1, 0, 1,
-0.694846, 0.2612749, -1.272809, 0.3921569, 1, 0, 1,
-0.6843985, -0.06223221, -1.560159, 0.3843137, 1, 0, 1,
-0.682728, -1.040294, -1.271699, 0.3803922, 1, 0, 1,
-0.6806261, 0.5136876, -0.3806362, 0.372549, 1, 0, 1,
-0.6765188, 0.1097228, -0.4585046, 0.3686275, 1, 0, 1,
-0.6698766, -0.5391123, -2.079545, 0.3607843, 1, 0, 1,
-0.6693956, -1.414241, -2.549368, 0.3568628, 1, 0, 1,
-0.6551018, 1.60061, -0.3384019, 0.3490196, 1, 0, 1,
-0.6532116, -0.6392269, -2.848329, 0.345098, 1, 0, 1,
-0.6465446, -0.9187188, -4.441208, 0.3372549, 1, 0, 1,
-0.6461374, 1.48831, -0.7805989, 0.3333333, 1, 0, 1,
-0.6405795, 0.7439327, -0.5541393, 0.3254902, 1, 0, 1,
-0.6395555, 2.201291, -0.8196396, 0.3215686, 1, 0, 1,
-0.6326215, -0.9470109, -2.259488, 0.3137255, 1, 0, 1,
-0.6306067, 0.004315699, -1.473234, 0.3098039, 1, 0, 1,
-0.627338, 0.5567428, 0.4707935, 0.3019608, 1, 0, 1,
-0.626844, 1.664098, -1.809243, 0.2941177, 1, 0, 1,
-0.6110845, 0.823775, -0.9916267, 0.2901961, 1, 0, 1,
-0.6105305, 0.605965, -2.556106, 0.282353, 1, 0, 1,
-0.6076096, -0.4366004, -4.171636, 0.2784314, 1, 0, 1,
-0.6062929, 0.5751743, -2.045408, 0.2705882, 1, 0, 1,
-0.6059151, 0.08891308, -1.288442, 0.2666667, 1, 0, 1,
-0.6020578, -0.6010687, -3.25937, 0.2588235, 1, 0, 1,
-0.6016671, -0.6540818, -1.689807, 0.254902, 1, 0, 1,
-0.6014729, -0.5479631, -2.411382, 0.2470588, 1, 0, 1,
-0.601212, -0.3017224, -3.082336, 0.2431373, 1, 0, 1,
-0.600943, -2.653685, -1.695239, 0.2352941, 1, 0, 1,
-0.6002768, -0.502305, -2.749095, 0.2313726, 1, 0, 1,
-0.5995539, 1.14078, -0.1059311, 0.2235294, 1, 0, 1,
-0.599099, 0.3043015, -0.5791926, 0.2196078, 1, 0, 1,
-0.5990672, -0.7874016, -1.793527, 0.2117647, 1, 0, 1,
-0.5966637, -0.2429348, -2.043212, 0.2078431, 1, 0, 1,
-0.5955296, -0.6498304, -0.9330909, 0.2, 1, 0, 1,
-0.5953683, 0.7083378, -1.627416, 0.1921569, 1, 0, 1,
-0.5916561, -0.2039811, -0.6774818, 0.1882353, 1, 0, 1,
-0.5857862, 0.4610216, -0.7630625, 0.1803922, 1, 0, 1,
-0.5843767, -0.2815678, -3.282411, 0.1764706, 1, 0, 1,
-0.5837343, 0.5189686, -0.2112171, 0.1686275, 1, 0, 1,
-0.5797778, -0.03768627, -1.24214, 0.1647059, 1, 0, 1,
-0.5733474, 0.001134213, -3.007282, 0.1568628, 1, 0, 1,
-0.5658919, 2.352796, 0.6465368, 0.1529412, 1, 0, 1,
-0.5651491, 0.4566204, 0.001987804, 0.145098, 1, 0, 1,
-0.5649074, 1.559863, -0.4386406, 0.1411765, 1, 0, 1,
-0.5631656, -0.3955293, -3.034702, 0.1333333, 1, 0, 1,
-0.5623502, -1.449309, -3.399477, 0.1294118, 1, 0, 1,
-0.5566099, -0.5400655, -2.734008, 0.1215686, 1, 0, 1,
-0.5562577, 0.3055289, -0.796949, 0.1176471, 1, 0, 1,
-0.5522459, 0.08878797, -1.165229, 0.1098039, 1, 0, 1,
-0.5472464, -1.359796, -3.239354, 0.1058824, 1, 0, 1,
-0.5467294, 0.07010868, -2.494445, 0.09803922, 1, 0, 1,
-0.5448985, -2.037871, -2.309583, 0.09019608, 1, 0, 1,
-0.5411734, 1.440371, -0.2000755, 0.08627451, 1, 0, 1,
-0.5346506, 1.252754, 0.3622193, 0.07843138, 1, 0, 1,
-0.5345511, 0.980447, 0.2402567, 0.07450981, 1, 0, 1,
-0.5311956, 0.4613875, -0.8350042, 0.06666667, 1, 0, 1,
-0.5285456, 0.7955744, -1.215509, 0.0627451, 1, 0, 1,
-0.5254811, 0.2046056, -0.1104288, 0.05490196, 1, 0, 1,
-0.5214996, 0.433666, -0.3180342, 0.05098039, 1, 0, 1,
-0.516207, -0.6892955, -2.698188, 0.04313726, 1, 0, 1,
-0.5108454, -0.8361021, -2.221818, 0.03921569, 1, 0, 1,
-0.5093719, -0.210641, -2.965466, 0.03137255, 1, 0, 1,
-0.507808, 1.083875, -1.155859, 0.02745098, 1, 0, 1,
-0.5003228, -0.4426829, -4.217623, 0.01960784, 1, 0, 1,
-0.4885737, 0.7348204, -0.7392387, 0.01568628, 1, 0, 1,
-0.4859287, -1.929366, -3.596805, 0.007843138, 1, 0, 1,
-0.4843531, 1.010396, -0.7861586, 0.003921569, 1, 0, 1,
-0.4753379, 0.7197599, -0.9709883, 0, 1, 0.003921569, 1,
-0.4745562, -1.216392, -2.059965, 0, 1, 0.01176471, 1,
-0.4724917, -0.5859199, -4.163378, 0, 1, 0.01568628, 1,
-0.4717145, -0.2307775, -1.21988, 0, 1, 0.02352941, 1,
-0.469598, -0.491589, -1.399484, 0, 1, 0.02745098, 1,
-0.469307, 0.03221104, -1.975358, 0, 1, 0.03529412, 1,
-0.4658564, -0.8768374, -3.254709, 0, 1, 0.03921569, 1,
-0.4649406, 0.5246641, -0.08314767, 0, 1, 0.04705882, 1,
-0.4629655, -1.045667, -1.788058, 0, 1, 0.05098039, 1,
-0.4605627, -1.789763, -2.925175, 0, 1, 0.05882353, 1,
-0.4561931, 0.033604, -2.079622, 0, 1, 0.0627451, 1,
-0.4466526, 0.05383824, -2.976114, 0, 1, 0.07058824, 1,
-0.4406894, -1.454665, -4.166693, 0, 1, 0.07450981, 1,
-0.4376712, -0.8855837, -1.931717, 0, 1, 0.08235294, 1,
-0.4365378, 0.8808299, 2.50273, 0, 1, 0.08627451, 1,
-0.4355296, -2.035133, -2.863495, 0, 1, 0.09411765, 1,
-0.4328821, -0.008764938, -1.103932, 0, 1, 0.1019608, 1,
-0.4310576, -1.203677, -4.54883, 0, 1, 0.1058824, 1,
-0.42887, 0.08029612, -2.101469, 0, 1, 0.1137255, 1,
-0.4254141, 0.9346103, -1.743252, 0, 1, 0.1176471, 1,
-0.4229878, 1.161698, 0.3270734, 0, 1, 0.1254902, 1,
-0.4229237, 0.379704, -2.052341, 0, 1, 0.1294118, 1,
-0.4183131, 0.2031109, -0.1976308, 0, 1, 0.1372549, 1,
-0.4152943, 0.3433653, 1.136168, 0, 1, 0.1411765, 1,
-0.4107237, 2.112601, -0.8156765, 0, 1, 0.1490196, 1,
-0.4065768, 0.5195185, -0.7482109, 0, 1, 0.1529412, 1,
-0.4051824, 0.09887677, -1.202924, 0, 1, 0.1607843, 1,
-0.4038787, -1.439638, -3.383343, 0, 1, 0.1647059, 1,
-0.3941872, 0.09575204, -1.51553, 0, 1, 0.172549, 1,
-0.3909159, -0.794347, -2.147363, 0, 1, 0.1764706, 1,
-0.388097, 0.4380403, -2.312224, 0, 1, 0.1843137, 1,
-0.3874094, -0.09588151, -3.541113, 0, 1, 0.1882353, 1,
-0.3849015, -1.15845, -4.014396, 0, 1, 0.1960784, 1,
-0.3848817, -0.9761094, -1.498017, 0, 1, 0.2039216, 1,
-0.3812472, -0.8754225, -3.089157, 0, 1, 0.2078431, 1,
-0.3741484, -0.6241478, -3.511691, 0, 1, 0.2156863, 1,
-0.3736515, 0.4754773, -1.955522, 0, 1, 0.2196078, 1,
-0.3733735, -0.09437078, -2.116896, 0, 1, 0.227451, 1,
-0.3725658, 0.6906524, -1.155527, 0, 1, 0.2313726, 1,
-0.370457, -0.4758703, -1.87362, 0, 1, 0.2392157, 1,
-0.367878, -0.5370944, -2.0853, 0, 1, 0.2431373, 1,
-0.3674168, -0.6581975, -2.825592, 0, 1, 0.2509804, 1,
-0.3595975, -0.9641115, -3.570146, 0, 1, 0.254902, 1,
-0.3566852, -1.450171, -1.826513, 0, 1, 0.2627451, 1,
-0.3554555, 0.7180241, -1.195369, 0, 1, 0.2666667, 1,
-0.3385558, -1.385633, -2.711194, 0, 1, 0.2745098, 1,
-0.3290704, 1.048469, 1.040698, 0, 1, 0.2784314, 1,
-0.3239445, 0.4271685, -0.6131738, 0, 1, 0.2862745, 1,
-0.3238712, -0.5544474, -2.09443, 0, 1, 0.2901961, 1,
-0.3184589, -0.9871853, -2.145571, 0, 1, 0.2980392, 1,
-0.3180268, 0.643252, -0.7580923, 0, 1, 0.3058824, 1,
-0.315955, -1.423889, -3.178232, 0, 1, 0.3098039, 1,
-0.3158159, 0.04278285, -2.571964, 0, 1, 0.3176471, 1,
-0.3054938, 0.6189342, -1.361899, 0, 1, 0.3215686, 1,
-0.301768, -0.2988698, -2.715227, 0, 1, 0.3294118, 1,
-0.2993262, 0.3858807, -1.583855, 0, 1, 0.3333333, 1,
-0.2896999, 0.258145, -2.754078, 0, 1, 0.3411765, 1,
-0.2878694, 0.2099087, -0.9280701, 0, 1, 0.345098, 1,
-0.2856055, -0.973355, -3.822141, 0, 1, 0.3529412, 1,
-0.284269, -0.5067442, -2.334717, 0, 1, 0.3568628, 1,
-0.2822335, -0.2964702, -2.578751, 0, 1, 0.3647059, 1,
-0.2810867, 1.350717, -0.5238102, 0, 1, 0.3686275, 1,
-0.2780954, 0.6669512, -1.804166, 0, 1, 0.3764706, 1,
-0.2727591, 0.05417553, -1.614665, 0, 1, 0.3803922, 1,
-0.2658482, -0.4562126, -1.744799, 0, 1, 0.3882353, 1,
-0.2657362, 0.1557865, -0.8770477, 0, 1, 0.3921569, 1,
-0.2657156, 0.1711911, -0.4225963, 0, 1, 0.4, 1,
-0.2642679, 0.7166157, -1.292371, 0, 1, 0.4078431, 1,
-0.2633771, -0.1250932, -3.289526, 0, 1, 0.4117647, 1,
-0.2599826, 0.4035532, -0.4830885, 0, 1, 0.4196078, 1,
-0.2599551, 0.05359454, -0.8733077, 0, 1, 0.4235294, 1,
-0.2593239, 1.084327, -1.223629, 0, 1, 0.4313726, 1,
-0.257919, -0.6853917, -3.541878, 0, 1, 0.4352941, 1,
-0.2547719, 0.5293126, -0.1754939, 0, 1, 0.4431373, 1,
-0.2530851, 1.259519, -2.62565, 0, 1, 0.4470588, 1,
-0.2512189, 0.1928497, -2.423341, 0, 1, 0.454902, 1,
-0.2495211, -0.3924679, -2.571863, 0, 1, 0.4588235, 1,
-0.2470478, 1.361532, -0.04203828, 0, 1, 0.4666667, 1,
-0.2408248, 0.2190496, -0.6416098, 0, 1, 0.4705882, 1,
-0.2404262, -0.7737638, -2.748201, 0, 1, 0.4784314, 1,
-0.2394246, -0.7680356, -1.931918, 0, 1, 0.4823529, 1,
-0.2389356, -1.30991, -3.597027, 0, 1, 0.4901961, 1,
-0.238843, -0.2251971, -2.503018, 0, 1, 0.4941176, 1,
-0.2372241, -0.8476298, -2.02279, 0, 1, 0.5019608, 1,
-0.2357901, 0.4384663, -2.584433, 0, 1, 0.509804, 1,
-0.2345476, 0.1308344, -1.248784, 0, 1, 0.5137255, 1,
-0.2298672, -0.3696343, -2.537748, 0, 1, 0.5215687, 1,
-0.2266704, -1.723348, -4.732509, 0, 1, 0.5254902, 1,
-0.2257688, 1.577417, -0.03035938, 0, 1, 0.5333334, 1,
-0.2224946, 1.917403, -0.150201, 0, 1, 0.5372549, 1,
-0.2212337, 0.7171305, 1.335401, 0, 1, 0.5450981, 1,
-0.2166814, 1.112653, -0.09258837, 0, 1, 0.5490196, 1,
-0.2152442, 0.7463804, 1.929607, 0, 1, 0.5568628, 1,
-0.2147844, 0.2036859, -1.80235, 0, 1, 0.5607843, 1,
-0.2139408, 0.3175847, 1.244007, 0, 1, 0.5686275, 1,
-0.2139168, -1.198626, -3.425235, 0, 1, 0.572549, 1,
-0.2121123, -1.049486, -2.930274, 0, 1, 0.5803922, 1,
-0.2098198, 1.061234, 0.1649495, 0, 1, 0.5843138, 1,
-0.2088974, 0.7427136, 1.214923, 0, 1, 0.5921569, 1,
-0.2034153, 1.655608, 1.487519, 0, 1, 0.5960785, 1,
-0.2023882, 1.049064, 0.07443419, 0, 1, 0.6039216, 1,
-0.2007146, 1.099624, -1.032792, 0, 1, 0.6117647, 1,
-0.2003532, -0.2972151, -2.800493, 0, 1, 0.6156863, 1,
-0.1959756, 1.207033, -0.2625273, 0, 1, 0.6235294, 1,
-0.1951361, -0.9609926, -1.353285, 0, 1, 0.627451, 1,
-0.1950382, 0.8934005, -1.436125, 0, 1, 0.6352941, 1,
-0.1927504, -0.3966233, -3.057797, 0, 1, 0.6392157, 1,
-0.1887358, 1.838234, 1.255076, 0, 1, 0.6470588, 1,
-0.1886989, -0.564765, -3.067034, 0, 1, 0.6509804, 1,
-0.186032, 0.270466, -1.182845, 0, 1, 0.6588235, 1,
-0.1851275, 0.764533, -0.2312761, 0, 1, 0.6627451, 1,
-0.1780531, 1.659591, -0.8998821, 0, 1, 0.6705883, 1,
-0.1757542, 0.9168124, -1.96106, 0, 1, 0.6745098, 1,
-0.1753838, -2.229006, -2.532789, 0, 1, 0.682353, 1,
-0.1738943, -1.29932, -2.412092, 0, 1, 0.6862745, 1,
-0.1734167, -0.615205, -2.431316, 0, 1, 0.6941177, 1,
-0.169492, -1.465878, -5.465716, 0, 1, 0.7019608, 1,
-0.1679367, -1.384012, -2.539649, 0, 1, 0.7058824, 1,
-0.1663964, -0.2161092, -1.883834, 0, 1, 0.7137255, 1,
-0.1618352, -0.1057081, -2.694818, 0, 1, 0.7176471, 1,
-0.1614953, 0.3322951, -1.46177, 0, 1, 0.7254902, 1,
-0.1614119, 2.21936, 0.6702185, 0, 1, 0.7294118, 1,
-0.1542271, 1.136257, 0.07015103, 0, 1, 0.7372549, 1,
-0.1504604, 1.117676, -0.03662405, 0, 1, 0.7411765, 1,
-0.1471453, -0.259386, -1.436619, 0, 1, 0.7490196, 1,
-0.1448085, -0.1035689, -1.540379, 0, 1, 0.7529412, 1,
-0.1431293, -0.06580915, -1.678496, 0, 1, 0.7607843, 1,
-0.1417439, -0.5776202, -3.511382, 0, 1, 0.7647059, 1,
-0.140232, 0.8577414, -0.420053, 0, 1, 0.772549, 1,
-0.1356164, -0.01218112, -3.268527, 0, 1, 0.7764706, 1,
-0.1341898, -0.4103113, -4.324299, 0, 1, 0.7843137, 1,
-0.1326357, -0.4025642, -3.830056, 0, 1, 0.7882353, 1,
-0.132471, -2.079768, -2.080723, 0, 1, 0.7960784, 1,
-0.1272055, -1.384604, -2.09695, 0, 1, 0.8039216, 1,
-0.1250312, 1.087491, 1.128614, 0, 1, 0.8078431, 1,
-0.1236064, -1.288181, -3.131798, 0, 1, 0.8156863, 1,
-0.121437, -1.105077, -2.100636, 0, 1, 0.8196079, 1,
-0.1199717, 0.1960629, -0.4333317, 0, 1, 0.827451, 1,
-0.1154972, -0.2599791, -3.122649, 0, 1, 0.8313726, 1,
-0.1150341, 0.3749563, -0.8382816, 0, 1, 0.8392157, 1,
-0.1131774, 0.4879613, -0.4848554, 0, 1, 0.8431373, 1,
-0.1121169, -0.5136901, -1.610642, 0, 1, 0.8509804, 1,
-0.1113619, 1.395957, 0.7322151, 0, 1, 0.854902, 1,
-0.1083755, 0.1897766, 0.2424211, 0, 1, 0.8627451, 1,
-0.1063614, -1.125804, -5.304395, 0, 1, 0.8666667, 1,
-0.09939702, 0.08961891, -2.370713, 0, 1, 0.8745098, 1,
-0.09687826, -0.5801998, -2.160165, 0, 1, 0.8784314, 1,
-0.09575198, -0.512388, -3.919534, 0, 1, 0.8862745, 1,
-0.09506153, -1.642738, -3.788899, 0, 1, 0.8901961, 1,
-0.0914439, 1.187994, 0.8475901, 0, 1, 0.8980392, 1,
-0.08877295, 0.6303787, -0.3090389, 0, 1, 0.9058824, 1,
-0.08851044, -2.430053, -3.317564, 0, 1, 0.9098039, 1,
-0.08629549, 0.7396053, 0.711715, 0, 1, 0.9176471, 1,
-0.08619266, -0.4462498, -3.151795, 0, 1, 0.9215686, 1,
-0.08068863, -0.03840641, -2.752366, 0, 1, 0.9294118, 1,
-0.07934432, 1.043812, -0.4859911, 0, 1, 0.9333333, 1,
-0.07864972, -1.016235, -3.039633, 0, 1, 0.9411765, 1,
-0.07133731, 0.7614709, -0.155841, 0, 1, 0.945098, 1,
-0.0669943, 0.7549061, -0.6540079, 0, 1, 0.9529412, 1,
-0.06627845, -0.6774161, -1.489633, 0, 1, 0.9568627, 1,
-0.06511164, -1.832011, -3.678146, 0, 1, 0.9647059, 1,
-0.06451447, -1.094379, -4.021705, 0, 1, 0.9686275, 1,
-0.06296349, 0.853416, -0.8092626, 0, 1, 0.9764706, 1,
-0.06120009, 0.4770453, 1.38476, 0, 1, 0.9803922, 1,
-0.05954104, 2.307009, 0.5512722, 0, 1, 0.9882353, 1,
-0.0592781, 1.46834, 0.1657658, 0, 1, 0.9921569, 1,
-0.0585059, 0.307999, -0.8336625, 0, 1, 1, 1,
-0.05661959, -0.2293385, -1.674401, 0, 0.9921569, 1, 1,
-0.05545019, -1.206398, -2.142727, 0, 0.9882353, 1, 1,
-0.05403213, 0.3126081, -1.579388, 0, 0.9803922, 1, 1,
-0.05324128, -2.580347, -2.403471, 0, 0.9764706, 1, 1,
-0.04975266, 0.1631485, 1.371095, 0, 0.9686275, 1, 1,
-0.0456321, 0.9307433, -1.436821, 0, 0.9647059, 1, 1,
-0.04416498, -0.1788453, -1.642904, 0, 0.9568627, 1, 1,
-0.04060861, -0.6689201, -3.743478, 0, 0.9529412, 1, 1,
-0.03744372, 0.8174319, 1.779312, 0, 0.945098, 1, 1,
-0.03498858, -0.06040481, -3.211254, 0, 0.9411765, 1, 1,
-0.03311089, -0.302809, -1.765736, 0, 0.9333333, 1, 1,
-0.03171039, 0.9839432, -1.110052, 0, 0.9294118, 1, 1,
-0.02907673, -1.924449, -2.598787, 0, 0.9215686, 1, 1,
-0.02345877, 1.050553, -0.7902892, 0, 0.9176471, 1, 1,
-0.02308576, 0.1098962, -2.569959, 0, 0.9098039, 1, 1,
-0.01758647, 0.556843, 1.51641, 0, 0.9058824, 1, 1,
-0.009118128, 1.867105, -0.9776184, 0, 0.8980392, 1, 1,
-0.00625365, -1.450604, -2.854554, 0, 0.8901961, 1, 1,
0.0008526435, 0.4037482, 0.5794949, 0, 0.8862745, 1, 1,
0.00365287, 0.04818472, 1.06698, 0, 0.8784314, 1, 1,
0.006068191, 0.4007896, 1.289713, 0, 0.8745098, 1, 1,
0.006351724, -0.1542569, 5.48449, 0, 0.8666667, 1, 1,
0.009876363, -1.374288, 2.826765, 0, 0.8627451, 1, 1,
0.01174983, 0.3244836, -0.3617379, 0, 0.854902, 1, 1,
0.01361284, 1.612113, -0.663987, 0, 0.8509804, 1, 1,
0.014201, -0.4794255, 5.126902, 0, 0.8431373, 1, 1,
0.01609247, 1.502316, -0.2952908, 0, 0.8392157, 1, 1,
0.01652466, -0.2194343, 4.733397, 0, 0.8313726, 1, 1,
0.01704507, 0.3452575, 0.9138581, 0, 0.827451, 1, 1,
0.02042689, -0.3241355, 2.643351, 0, 0.8196079, 1, 1,
0.02168079, -1.86873, 3.200503, 0, 0.8156863, 1, 1,
0.02693374, -0.3422824, 2.061512, 0, 0.8078431, 1, 1,
0.02735976, -0.924714, 2.148356, 0, 0.8039216, 1, 1,
0.02807593, 0.4308939, -0.727478, 0, 0.7960784, 1, 1,
0.0315155, 0.2756675, -0.3195363, 0, 0.7882353, 1, 1,
0.03306336, 1.127983, -1.206959, 0, 0.7843137, 1, 1,
0.03308209, 0.2267626, 0.5421505, 0, 0.7764706, 1, 1,
0.03360797, -2.571521, 2.814558, 0, 0.772549, 1, 1,
0.03888235, 0.3707367, 1.25143, 0, 0.7647059, 1, 1,
0.04009716, 0.5528439, -0.2217859, 0, 0.7607843, 1, 1,
0.04099954, -0.02306285, 1.725989, 0, 0.7529412, 1, 1,
0.0497747, 0.04423866, 0.3026476, 0, 0.7490196, 1, 1,
0.05437403, -0.6769567, 4.491945, 0, 0.7411765, 1, 1,
0.05449167, 1.674996, 1.622429, 0, 0.7372549, 1, 1,
0.06053597, -0.1476992, 2.803905, 0, 0.7294118, 1, 1,
0.06217258, 0.2954184, -0.4528678, 0, 0.7254902, 1, 1,
0.06237634, 0.9845784, 1.575812, 0, 0.7176471, 1, 1,
0.06495325, 0.025253, 1.290429, 0, 0.7137255, 1, 1,
0.06622701, 0.7706224, 0.5861583, 0, 0.7058824, 1, 1,
0.07145688, -0.0459074, 0.891237, 0, 0.6980392, 1, 1,
0.07638692, -0.5514715, 2.084246, 0, 0.6941177, 1, 1,
0.07846556, 0.4344246, 1.275167, 0, 0.6862745, 1, 1,
0.08368409, 1.646444, -0.7175549, 0, 0.682353, 1, 1,
0.08728229, -0.5298732, 3.825776, 0, 0.6745098, 1, 1,
0.0913157, 0.976281, 0.1818471, 0, 0.6705883, 1, 1,
0.09139129, -1.568368, 3.130131, 0, 0.6627451, 1, 1,
0.0922453, -0.7172461, 3.304382, 0, 0.6588235, 1, 1,
0.09427713, -0.8664867, 3.119534, 0, 0.6509804, 1, 1,
0.1021269, 1.529366, -0.5537084, 0, 0.6470588, 1, 1,
0.104942, 0.1032889, 2.413122, 0, 0.6392157, 1, 1,
0.1056941, -1.1703, 2.447975, 0, 0.6352941, 1, 1,
0.1068882, -0.1297479, 4.803776, 0, 0.627451, 1, 1,
0.1071138, -1.576653, 3.021799, 0, 0.6235294, 1, 1,
0.1086685, 0.8215623, -0.08397169, 0, 0.6156863, 1, 1,
0.1105132, 0.841111, 1.691203, 0, 0.6117647, 1, 1,
0.110848, -0.07449409, 1.265998, 0, 0.6039216, 1, 1,
0.1216373, 0.8117732, -0.90761, 0, 0.5960785, 1, 1,
0.1217743, -0.3741749, 5.30354, 0, 0.5921569, 1, 1,
0.1236756, -0.6013914, 2.607221, 0, 0.5843138, 1, 1,
0.1324812, -0.3085085, 3.278463, 0, 0.5803922, 1, 1,
0.1343075, -2.515311, 3.058861, 0, 0.572549, 1, 1,
0.1345873, -0.6601495, 3.097706, 0, 0.5686275, 1, 1,
0.1346645, 0.7060857, 1.951469, 0, 0.5607843, 1, 1,
0.1352255, 2.109295, -0.49545, 0, 0.5568628, 1, 1,
0.1356187, 0.3834943, 1.11606, 0, 0.5490196, 1, 1,
0.1389007, 1.711384, 2.280159, 0, 0.5450981, 1, 1,
0.1449527, -0.1424709, 2.891171, 0, 0.5372549, 1, 1,
0.1461383, 0.2554766, 1.780967, 0, 0.5333334, 1, 1,
0.1492406, -0.7212843, 2.857927, 0, 0.5254902, 1, 1,
0.1508783, 0.6691667, -1.695876, 0, 0.5215687, 1, 1,
0.1543187, -0.3453563, 0.9506133, 0, 0.5137255, 1, 1,
0.1560964, -1.23814, 1.793222, 0, 0.509804, 1, 1,
0.1567431, -0.3204179, 3.241282, 0, 0.5019608, 1, 1,
0.1587085, 1.116536, 0.4490095, 0, 0.4941176, 1, 1,
0.1587296, 0.7076085, -1.025039, 0, 0.4901961, 1, 1,
0.1588475, 0.4872529, 1.07184, 0, 0.4823529, 1, 1,
0.1593859, 0.5571491, 2.193121, 0, 0.4784314, 1, 1,
0.1604123, 0.6226812, -0.5653451, 0, 0.4705882, 1, 1,
0.1679291, -0.5915435, 1.482617, 0, 0.4666667, 1, 1,
0.1696078, 0.3630957, -0.5798637, 0, 0.4588235, 1, 1,
0.1707503, -0.4516468, 2.649347, 0, 0.454902, 1, 1,
0.1755275, 0.368896, 0.3616495, 0, 0.4470588, 1, 1,
0.1759793, 0.1567325, 0.5193532, 0, 0.4431373, 1, 1,
0.1779341, -0.1928742, 3.121353, 0, 0.4352941, 1, 1,
0.1819456, -0.6629667, 3.651953, 0, 0.4313726, 1, 1,
0.1825585, -1.158025, 3.947339, 0, 0.4235294, 1, 1,
0.1886419, -0.8148102, 2.876376, 0, 0.4196078, 1, 1,
0.1914873, -0.2993664, 3.095754, 0, 0.4117647, 1, 1,
0.1943931, 0.6574667, 0.4445418, 0, 0.4078431, 1, 1,
0.1949006, -0.4348881, 3.981364, 0, 0.4, 1, 1,
0.1952317, -1.421219, 2.470259, 0, 0.3921569, 1, 1,
0.1985389, -0.4268612, 2.369269, 0, 0.3882353, 1, 1,
0.1990729, -0.468271, 2.125516, 0, 0.3803922, 1, 1,
0.2030239, 1.802688, -0.3647638, 0, 0.3764706, 1, 1,
0.2075913, 0.3937649, 1.800636, 0, 0.3686275, 1, 1,
0.2087719, -0.3609663, 1.321286, 0, 0.3647059, 1, 1,
0.209121, -0.4086378, 1.368354, 0, 0.3568628, 1, 1,
0.2095287, 0.128485, -0.04640101, 0, 0.3529412, 1, 1,
0.2105112, 0.001274113, 2.705241, 0, 0.345098, 1, 1,
0.2107105, -1.33932, 3.464159, 0, 0.3411765, 1, 1,
0.2114123, 0.2395344, 0.7488935, 0, 0.3333333, 1, 1,
0.2120118, -1.460516, 2.444402, 0, 0.3294118, 1, 1,
0.2151569, -0.540332, 3.378832, 0, 0.3215686, 1, 1,
0.2170286, -0.1038401, 0.5647299, 0, 0.3176471, 1, 1,
0.2199969, -0.4473149, 2.438754, 0, 0.3098039, 1, 1,
0.2211724, 0.6031812, 2.420135, 0, 0.3058824, 1, 1,
0.2212358, -0.1530814, 1.808223, 0, 0.2980392, 1, 1,
0.2227236, 0.06817018, 0.72609, 0, 0.2901961, 1, 1,
0.2267705, 0.7993519, 2.041251, 0, 0.2862745, 1, 1,
0.2287997, 0.6303619, -0.1680318, 0, 0.2784314, 1, 1,
0.2382107, 0.7963692, -0.4270044, 0, 0.2745098, 1, 1,
0.2397705, 1.058584, -1.107693, 0, 0.2666667, 1, 1,
0.2473616, 0.8215069, 2.098614, 0, 0.2627451, 1, 1,
0.2508811, 0.1078906, 0.512976, 0, 0.254902, 1, 1,
0.2509238, 1.547467, -0.8239946, 0, 0.2509804, 1, 1,
0.2597755, -0.335846, 1.684802, 0, 0.2431373, 1, 1,
0.2664446, 0.05595072, -1.833717, 0, 0.2392157, 1, 1,
0.2666701, 0.06065445, 4.180639, 0, 0.2313726, 1, 1,
0.2707473, 0.7575172, 0.9961893, 0, 0.227451, 1, 1,
0.2745087, 0.1029459, 1.709475, 0, 0.2196078, 1, 1,
0.2769951, -0.5812667, 2.324657, 0, 0.2156863, 1, 1,
0.2786442, 0.2731358, 1.288582, 0, 0.2078431, 1, 1,
0.2797381, -0.7985086, 2.598857, 0, 0.2039216, 1, 1,
0.2807921, -1.16394, 4.921929, 0, 0.1960784, 1, 1,
0.2816906, -0.6931391, 3.756174, 0, 0.1882353, 1, 1,
0.282432, 0.4545494, 1.211039, 0, 0.1843137, 1, 1,
0.2847295, 0.4060512, -0.2749281, 0, 0.1764706, 1, 1,
0.2902421, 0.2045718, 2.210899, 0, 0.172549, 1, 1,
0.2917503, -2.071979, 2.102133, 0, 0.1647059, 1, 1,
0.292202, 0.9782584, -0.3565242, 0, 0.1607843, 1, 1,
0.2984632, 1.177108, 0.6891735, 0, 0.1529412, 1, 1,
0.3013243, 0.5272257, 1.548931, 0, 0.1490196, 1, 1,
0.303941, 0.6138976, -0.0893367, 0, 0.1411765, 1, 1,
0.3058341, 0.7468181, 0.1936601, 0, 0.1372549, 1, 1,
0.3092243, 1.570284, 0.06053689, 0, 0.1294118, 1, 1,
0.3100385, -2.404093, 5.38587, 0, 0.1254902, 1, 1,
0.3127564, 0.4727693, 0.4419579, 0, 0.1176471, 1, 1,
0.3132029, 1.165278, 2.651379, 0, 0.1137255, 1, 1,
0.3172548, -0.3788162, 1.631945, 0, 0.1058824, 1, 1,
0.3188703, -1.115649, 1.709351, 0, 0.09803922, 1, 1,
0.3190069, 0.205539, 2.943753, 0, 0.09411765, 1, 1,
0.3221777, 0.6289924, -0.4135328, 0, 0.08627451, 1, 1,
0.3351627, 0.8678464, 2.687334, 0, 0.08235294, 1, 1,
0.3441883, -0.9418586, 2.535187, 0, 0.07450981, 1, 1,
0.3446887, -0.7336147, 3.136022, 0, 0.07058824, 1, 1,
0.3467996, 0.210989, 1.432397, 0, 0.0627451, 1, 1,
0.3473302, 1.014796, 0.9657413, 0, 0.05882353, 1, 1,
0.3586195, -1.067572, 3.264279, 0, 0.05098039, 1, 1,
0.3599146, 0.3513705, 0.7716677, 0, 0.04705882, 1, 1,
0.3632067, 0.3876487, 1.64754, 0, 0.03921569, 1, 1,
0.3647261, 0.001827191, 2.680935, 0, 0.03529412, 1, 1,
0.3651166, 0.1159547, -0.8368163, 0, 0.02745098, 1, 1,
0.366693, -1.962484, 4.234928, 0, 0.02352941, 1, 1,
0.3691314, -0.6555156, 2.393538, 0, 0.01568628, 1, 1,
0.3759501, 1.099807, -0.3187269, 0, 0.01176471, 1, 1,
0.376538, -0.1685714, 2.35927, 0, 0.003921569, 1, 1,
0.3800616, -1.224383, 1.527998, 0.003921569, 0, 1, 1,
0.3813497, -0.7206711, 2.545745, 0.007843138, 0, 1, 1,
0.3815953, -1.162702, 1.720419, 0.01568628, 0, 1, 1,
0.3822334, 1.451257, 0.4018615, 0.01960784, 0, 1, 1,
0.3853517, 1.232212, -0.9351544, 0.02745098, 0, 1, 1,
0.3878197, 0.9611844, 1.130848, 0.03137255, 0, 1, 1,
0.3887395, 0.2176249, 0.8719889, 0.03921569, 0, 1, 1,
0.3909185, -0.08186374, 1.733336, 0.04313726, 0, 1, 1,
0.3969173, -0.0485705, 1.931205, 0.05098039, 0, 1, 1,
0.3991987, -1.316273, 3.426318, 0.05490196, 0, 1, 1,
0.4043345, -1.451827, 2.884811, 0.0627451, 0, 1, 1,
0.4089188, -0.4793483, 2.595615, 0.06666667, 0, 1, 1,
0.4123657, 1.745843, -1.294243, 0.07450981, 0, 1, 1,
0.4141438, 1.660189, -0.3215159, 0.07843138, 0, 1, 1,
0.4200616, -0.3727774, 0.6349363, 0.08627451, 0, 1, 1,
0.4285037, -0.3587148, 3.251406, 0.09019608, 0, 1, 1,
0.4304473, -0.9213651, 1.118833, 0.09803922, 0, 1, 1,
0.4315875, -0.3840314, 4.158381, 0.1058824, 0, 1, 1,
0.4317311, -0.487059, 2.781476, 0.1098039, 0, 1, 1,
0.4371951, 0.3746045, 2.050251, 0.1176471, 0, 1, 1,
0.4384045, 0.9913586, 0.3562234, 0.1215686, 0, 1, 1,
0.4402218, -0.588725, 2.073083, 0.1294118, 0, 1, 1,
0.4412778, 0.4412064, 2.231972, 0.1333333, 0, 1, 1,
0.4433819, -0.2777484, 2.786285, 0.1411765, 0, 1, 1,
0.4445278, -0.4936045, 1.239719, 0.145098, 0, 1, 1,
0.4453527, 1.347107, 1.495402, 0.1529412, 0, 1, 1,
0.4481795, 2.545042, 1.507012, 0.1568628, 0, 1, 1,
0.4482175, 1.034948, 0.2747557, 0.1647059, 0, 1, 1,
0.4578742, 0.4755036, 0.1368351, 0.1686275, 0, 1, 1,
0.4653693, 0.1927364, 3.0005, 0.1764706, 0, 1, 1,
0.472554, 0.2523766, -0.4419037, 0.1803922, 0, 1, 1,
0.4754048, 0.9679885, 1.376398, 0.1882353, 0, 1, 1,
0.4770723, 0.4822612, 0.2741395, 0.1921569, 0, 1, 1,
0.4786396, -0.728399, 1.216271, 0.2, 0, 1, 1,
0.4794397, 0.5047956, 1.739627, 0.2078431, 0, 1, 1,
0.4803158, 0.05145789, 0.07781523, 0.2117647, 0, 1, 1,
0.4825651, -2.00358, 3.766176, 0.2196078, 0, 1, 1,
0.4848328, 0.7085061, 1.029568, 0.2235294, 0, 1, 1,
0.4890574, 0.7170263, 1.641525, 0.2313726, 0, 1, 1,
0.4907404, -0.7495888, 3.762933, 0.2352941, 0, 1, 1,
0.4974318, 0.219192, 1.909869, 0.2431373, 0, 1, 1,
0.500391, 0.5066975, 1.182484, 0.2470588, 0, 1, 1,
0.5012013, 1.866824, 0.341847, 0.254902, 0, 1, 1,
0.5039166, 1.118436, -1.254562, 0.2588235, 0, 1, 1,
0.5057832, -1.3427, 3.067374, 0.2666667, 0, 1, 1,
0.5076963, -0.2151811, 3.231243, 0.2705882, 0, 1, 1,
0.5081317, -0.5060821, 2.578301, 0.2784314, 0, 1, 1,
0.5107085, -0.3746371, 2.686384, 0.282353, 0, 1, 1,
0.5195255, -1.220424, 3.119985, 0.2901961, 0, 1, 1,
0.5270333, -1.725712, 3.000159, 0.2941177, 0, 1, 1,
0.5320613, -0.2617199, 1.585332, 0.3019608, 0, 1, 1,
0.5340798, 0.01483789, 1.133013, 0.3098039, 0, 1, 1,
0.5354455, -1.446541, 1.432352, 0.3137255, 0, 1, 1,
0.5367195, 1.473907, 2.348433, 0.3215686, 0, 1, 1,
0.5391983, -0.2648128, 2.76575, 0.3254902, 0, 1, 1,
0.5401874, -1.011775, 2.651308, 0.3333333, 0, 1, 1,
0.5428186, -0.09605137, 1.743498, 0.3372549, 0, 1, 1,
0.5472732, -2.050558, 1.798648, 0.345098, 0, 1, 1,
0.5476803, -0.8111129, 2.509594, 0.3490196, 0, 1, 1,
0.5562333, -0.7073559, 3.281039, 0.3568628, 0, 1, 1,
0.5577772, 0.9977991, -1.044505, 0.3607843, 0, 1, 1,
0.559064, -0.1020057, 1.498348, 0.3686275, 0, 1, 1,
0.5638206, 0.0818731, 1.407436, 0.372549, 0, 1, 1,
0.5672407, 0.01030429, 1.803787, 0.3803922, 0, 1, 1,
0.574396, -0.2966713, 1.311895, 0.3843137, 0, 1, 1,
0.5755786, 0.7059232, 2.999763, 0.3921569, 0, 1, 1,
0.5764369, -0.784066, 2.315832, 0.3960784, 0, 1, 1,
0.5844264, -0.008919083, 1.234763, 0.4039216, 0, 1, 1,
0.5847074, 0.8380889, -0.4297645, 0.4117647, 0, 1, 1,
0.5871072, -1.142951, 3.011591, 0.4156863, 0, 1, 1,
0.5905465, 0.03251081, 1.952741, 0.4235294, 0, 1, 1,
0.5995185, 0.4850152, -0.2539725, 0.427451, 0, 1, 1,
0.6001886, -0.6104919, 3.667586, 0.4352941, 0, 1, 1,
0.600848, -0.6282263, 2.556997, 0.4392157, 0, 1, 1,
0.6026885, -0.3918851, 3.005878, 0.4470588, 0, 1, 1,
0.6049506, 1.100708, 1.818488, 0.4509804, 0, 1, 1,
0.6050525, -0.4608067, 2.169285, 0.4588235, 0, 1, 1,
0.6053805, 0.4500337, -0.5455865, 0.4627451, 0, 1, 1,
0.6102892, -0.4005322, 2.380207, 0.4705882, 0, 1, 1,
0.6123314, 0.6823227, 0.1572489, 0.4745098, 0, 1, 1,
0.6197837, -1.454185, 3.330528, 0.4823529, 0, 1, 1,
0.6207768, -0.2894127, 2.474154, 0.4862745, 0, 1, 1,
0.621403, -0.4045892, 0.8255016, 0.4941176, 0, 1, 1,
0.6254981, -1.169962, 4.566395, 0.5019608, 0, 1, 1,
0.6260121, 0.3988141, 0.1258682, 0.5058824, 0, 1, 1,
0.6296842, -0.4236469, 3.369266, 0.5137255, 0, 1, 1,
0.6332309, -0.3200067, 2.2924, 0.5176471, 0, 1, 1,
0.6332775, 1.550199, 0.0393455, 0.5254902, 0, 1, 1,
0.6378019, -0.9359356, 2.24567, 0.5294118, 0, 1, 1,
0.6454936, 0.9871625, -0.8756066, 0.5372549, 0, 1, 1,
0.6476129, 1.19976, -1.537738, 0.5411765, 0, 1, 1,
0.6494214, -0.8875843, 0.4792765, 0.5490196, 0, 1, 1,
0.6500931, -1.810807, 3.13549, 0.5529412, 0, 1, 1,
0.6514086, -0.402301, 1.266504, 0.5607843, 0, 1, 1,
0.6552533, -0.7349334, 0.6983223, 0.5647059, 0, 1, 1,
0.6564863, -0.2482476, 2.63894, 0.572549, 0, 1, 1,
0.6614709, 0.5249265, 2.312421, 0.5764706, 0, 1, 1,
0.6618561, -1.067764, 1.337864, 0.5843138, 0, 1, 1,
0.6637945, 0.2466258, 1.165696, 0.5882353, 0, 1, 1,
0.6639831, -0.6081088, 2.081938, 0.5960785, 0, 1, 1,
0.6647319, -0.7398884, 3.489459, 0.6039216, 0, 1, 1,
0.6668515, 0.1045555, 2.354203, 0.6078432, 0, 1, 1,
0.6695682, 0.02502948, 1.782795, 0.6156863, 0, 1, 1,
0.6706134, 1.041047, 1.009973, 0.6196079, 0, 1, 1,
0.671478, 0.9108014, 0.4159696, 0.627451, 0, 1, 1,
0.6903211, -1.080103, 3.303708, 0.6313726, 0, 1, 1,
0.6908344, 0.306811, -0.1630539, 0.6392157, 0, 1, 1,
0.692863, -0.18133, 2.490146, 0.6431373, 0, 1, 1,
0.6976525, 0.8672262, 1.139523, 0.6509804, 0, 1, 1,
0.6991277, -1.698126, 2.910145, 0.654902, 0, 1, 1,
0.7034084, -0.09235077, 2.057182, 0.6627451, 0, 1, 1,
0.707694, 0.1760001, 1.523328, 0.6666667, 0, 1, 1,
0.7151526, -0.1886368, 3.236103, 0.6745098, 0, 1, 1,
0.7172828, -0.342803, 3.101753, 0.6784314, 0, 1, 1,
0.7183084, -0.1994415, 1.972048, 0.6862745, 0, 1, 1,
0.7243773, -1.681582, 0.8705983, 0.6901961, 0, 1, 1,
0.7374234, 0.9827385, 2.392429, 0.6980392, 0, 1, 1,
0.7376059, 0.8079652, -0.5427982, 0.7058824, 0, 1, 1,
0.7376441, -0.05456434, 3.405345, 0.7098039, 0, 1, 1,
0.7420043, 0.6569244, 0.8349342, 0.7176471, 0, 1, 1,
0.7502792, 0.6172752, 0.5377897, 0.7215686, 0, 1, 1,
0.7583471, -1.50463, 3.410382, 0.7294118, 0, 1, 1,
0.7619076, -0.2956412, 1.674554, 0.7333333, 0, 1, 1,
0.7652733, -0.995984, 3.629298, 0.7411765, 0, 1, 1,
0.7707833, -0.7197424, 2.313377, 0.7450981, 0, 1, 1,
0.7733554, -1.198973, 3.465643, 0.7529412, 0, 1, 1,
0.7829483, -1.321678, 1.102132, 0.7568628, 0, 1, 1,
0.8027059, -0.07341687, 1.501324, 0.7647059, 0, 1, 1,
0.8081615, 0.9721885, 1.033774, 0.7686275, 0, 1, 1,
0.8082097, 0.5175425, 2.359022, 0.7764706, 0, 1, 1,
0.8113977, -0.7558209, 3.616425, 0.7803922, 0, 1, 1,
0.8134063, -0.4714423, 2.546179, 0.7882353, 0, 1, 1,
0.814686, -0.2457832, 2.487096, 0.7921569, 0, 1, 1,
0.8160713, 0.4967845, -0.325848, 0.8, 0, 1, 1,
0.8237293, 0.8868617, 0.2569329, 0.8078431, 0, 1, 1,
0.8296934, -1.684881, 2.335178, 0.8117647, 0, 1, 1,
0.8299612, -0.0256301, 1.958966, 0.8196079, 0, 1, 1,
0.8314704, 0.8931893, -1.455573, 0.8235294, 0, 1, 1,
0.8383552, 0.0767005, 3.391063, 0.8313726, 0, 1, 1,
0.8443788, -1.041548, 1.755409, 0.8352941, 0, 1, 1,
0.8485489, -0.3856205, 1.089009, 0.8431373, 0, 1, 1,
0.8601998, -0.02862759, 1.236965, 0.8470588, 0, 1, 1,
0.8619131, 0.06352524, 2.002138, 0.854902, 0, 1, 1,
0.8658558, -0.3490579, 2.44393, 0.8588235, 0, 1, 1,
0.8725115, 1.111618, 0.3791696, 0.8666667, 0, 1, 1,
0.8748055, -1.018135, 3.18015, 0.8705882, 0, 1, 1,
0.87782, 0.9485569, -0.5488981, 0.8784314, 0, 1, 1,
0.8838168, 0.1961054, 3.746301, 0.8823529, 0, 1, 1,
0.8948802, 0.6737234, 0.6269265, 0.8901961, 0, 1, 1,
0.8996152, 2.544927, 1.755932, 0.8941177, 0, 1, 1,
0.900427, -0.5347473, 1.11929, 0.9019608, 0, 1, 1,
0.902801, 1.253519, 0.5178639, 0.9098039, 0, 1, 1,
0.9050642, -1.278324, 3.260771, 0.9137255, 0, 1, 1,
0.9079137, 0.8036487, 1.532881, 0.9215686, 0, 1, 1,
0.908203, 1.579708, 0.6727613, 0.9254902, 0, 1, 1,
0.9113325, 0.6007527, -0.4616793, 0.9333333, 0, 1, 1,
0.9168714, 0.7592243, 1.133229, 0.9372549, 0, 1, 1,
0.9170551, 2.109121, -0.561947, 0.945098, 0, 1, 1,
0.9203646, 0.3774745, -0.2932531, 0.9490196, 0, 1, 1,
0.9310466, 0.1031221, 3.417897, 0.9568627, 0, 1, 1,
0.9329911, -0.5060626, 2.476872, 0.9607843, 0, 1, 1,
0.9353307, 1.469052, 0.6139411, 0.9686275, 0, 1, 1,
0.9406134, 0.2148545, -0.1683118, 0.972549, 0, 1, 1,
0.9484702, 0.03521901, 0.03438426, 0.9803922, 0, 1, 1,
0.9491512, 0.09598849, 1.140082, 0.9843137, 0, 1, 1,
0.9493018, -0.1649464, 1.867593, 0.9921569, 0, 1, 1,
0.9496744, 0.8501394, -0.4113173, 0.9960784, 0, 1, 1,
0.9506169, 0.6412523, 0.9923465, 1, 0, 0.9960784, 1,
0.9513741, -0.8027701, 2.863549, 1, 0, 0.9882353, 1,
0.9580892, 0.03852129, 3.105712, 1, 0, 0.9843137, 1,
0.9669119, -1.402295, 0.4780785, 1, 0, 0.9764706, 1,
0.9679659, 1.230779, 2.76015, 1, 0, 0.972549, 1,
0.9736353, -0.353038, 3.025969, 1, 0, 0.9647059, 1,
0.9834437, -1.126917, 1.72191, 1, 0, 0.9607843, 1,
0.9956933, 0.2770534, 1.743998, 1, 0, 0.9529412, 1,
0.997662, -0.1742555, 1.551335, 1, 0, 0.9490196, 1,
1.010523, -0.4163969, 1.512389, 1, 0, 0.9411765, 1,
1.023506, 1.323413, 0.05900681, 1, 0, 0.9372549, 1,
1.029971, -0.21131, 0.9117565, 1, 0, 0.9294118, 1,
1.031813, -1.076407, -0.3265701, 1, 0, 0.9254902, 1,
1.034387, -0.6856513, 1.290137, 1, 0, 0.9176471, 1,
1.037407, 0.8233291, 1.729993, 1, 0, 0.9137255, 1,
1.03942, 0.5813674, -0.2813466, 1, 0, 0.9058824, 1,
1.042978, 1.089047, 0.4536921, 1, 0, 0.9019608, 1,
1.046006, -1.102061, 1.111046, 1, 0, 0.8941177, 1,
1.051218, -0.5441991, 2.072324, 1, 0, 0.8862745, 1,
1.056626, -0.2618229, 2.487475, 1, 0, 0.8823529, 1,
1.060517, 0.724583, -0.3800925, 1, 0, 0.8745098, 1,
1.061867, -0.1470359, 1.310625, 1, 0, 0.8705882, 1,
1.062123, -1.381187, 1.873685, 1, 0, 0.8627451, 1,
1.062551, 0.4683758, 0.7411186, 1, 0, 0.8588235, 1,
1.063506, -0.2510407, 2.566695, 1, 0, 0.8509804, 1,
1.066069, -1.149039, 3.970275, 1, 0, 0.8470588, 1,
1.068165, -0.9641373, 1.237237, 1, 0, 0.8392157, 1,
1.070396, -0.7423885, 2.751542, 1, 0, 0.8352941, 1,
1.075504, 1.120744, -0.872318, 1, 0, 0.827451, 1,
1.077562, -0.9170939, 1.10047, 1, 0, 0.8235294, 1,
1.080221, 1.144362, 0.4582372, 1, 0, 0.8156863, 1,
1.083002, -0.7368953, 1.821616, 1, 0, 0.8117647, 1,
1.083497, -1.439873, 2.848866, 1, 0, 0.8039216, 1,
1.085203, -2.281134, 3.083687, 1, 0, 0.7960784, 1,
1.086576, 0.1491279, 2.442675, 1, 0, 0.7921569, 1,
1.090814, 1.233835, -0.9437054, 1, 0, 0.7843137, 1,
1.092014, -1.832846, 3.543152, 1, 0, 0.7803922, 1,
1.114108, -1.276507, 3.332658, 1, 0, 0.772549, 1,
1.115446, -0.8493884, 3.004235, 1, 0, 0.7686275, 1,
1.117184, 0.550022, 0.9281744, 1, 0, 0.7607843, 1,
1.119199, 1.087249, 0.4549074, 1, 0, 0.7568628, 1,
1.120747, 1.529116, 1.918515, 1, 0, 0.7490196, 1,
1.127862, 0.6877258, 2.518818, 1, 0, 0.7450981, 1,
1.130795, -0.7471331, 4.147675, 1, 0, 0.7372549, 1,
1.136524, 0.5056634, 1.35532, 1, 0, 0.7333333, 1,
1.144921, 0.5348478, 1.145027, 1, 0, 0.7254902, 1,
1.157566, 0.4343061, 0.7563499, 1, 0, 0.7215686, 1,
1.161797, -0.2813644, 1.992486, 1, 0, 0.7137255, 1,
1.162717, -2.038106, 2.155946, 1, 0, 0.7098039, 1,
1.165488, -0.5138201, 3.835898, 1, 0, 0.7019608, 1,
1.166802, 0.1174145, 2.023181, 1, 0, 0.6941177, 1,
1.168208, 0.01738143, -0.2820832, 1, 0, 0.6901961, 1,
1.173133, 0.4440224, 0.9922876, 1, 0, 0.682353, 1,
1.176898, -1.817921, 2.883496, 1, 0, 0.6784314, 1,
1.180253, 0.02079188, 1.973257, 1, 0, 0.6705883, 1,
1.188812, 1.069727, -0.7667655, 1, 0, 0.6666667, 1,
1.199324, 0.675196, 0.1920744, 1, 0, 0.6588235, 1,
1.201215, 3.243619, 0.04833622, 1, 0, 0.654902, 1,
1.20277, 2.437263, -0.9887569, 1, 0, 0.6470588, 1,
1.204955, 2.078216, -0.3975042, 1, 0, 0.6431373, 1,
1.209774, 0.04562015, 2.266862, 1, 0, 0.6352941, 1,
1.212435, 1.783737, 1.328565, 1, 0, 0.6313726, 1,
1.224133, -0.07287253, 1.73416, 1, 0, 0.6235294, 1,
1.22777, 1.895055, 0.4842227, 1, 0, 0.6196079, 1,
1.228993, 0.1382479, 3.070782, 1, 0, 0.6117647, 1,
1.229819, 0.5450493, 1.173469, 1, 0, 0.6078432, 1,
1.230122, -0.4146642, 2.917237, 1, 0, 0.6, 1,
1.24332, -0.598488, 2.689686, 1, 0, 0.5921569, 1,
1.246703, 0.524844, 1.030812, 1, 0, 0.5882353, 1,
1.248091, 1.4216, 1.794304, 1, 0, 0.5803922, 1,
1.250701, -0.4400583, 2.612013, 1, 0, 0.5764706, 1,
1.255748, 0.7434889, 0.06563304, 1, 0, 0.5686275, 1,
1.260134, 1.225989, 1.513934, 1, 0, 0.5647059, 1,
1.265069, 0.2522399, 1.99016, 1, 0, 0.5568628, 1,
1.26849, 0.5400692, 0.6416778, 1, 0, 0.5529412, 1,
1.274162, 1.217821, 2.964155, 1, 0, 0.5450981, 1,
1.285291, -0.07544928, 2.402562, 1, 0, 0.5411765, 1,
1.314537, 0.6567733, 0.2043099, 1, 0, 0.5333334, 1,
1.320375, 0.8509647, 1.420623, 1, 0, 0.5294118, 1,
1.323936, -2.080176, 2.145607, 1, 0, 0.5215687, 1,
1.324928, 2.777163, -0.5810312, 1, 0, 0.5176471, 1,
1.326578, -0.3500839, 3.43069, 1, 0, 0.509804, 1,
1.329074, 0.5200505, 1.513344, 1, 0, 0.5058824, 1,
1.334372, 0.5601531, 0.2116121, 1, 0, 0.4980392, 1,
1.357567, -3.077071, 2.074422, 1, 0, 0.4901961, 1,
1.358374, 1.103042, 0.3354495, 1, 0, 0.4862745, 1,
1.365892, -0.5767145, 1.91789, 1, 0, 0.4784314, 1,
1.374336, 0.9591197, 1.58365, 1, 0, 0.4745098, 1,
1.383997, 1.944392, 0.1545089, 1, 0, 0.4666667, 1,
1.38516, -0.1870252, 1.047985, 1, 0, 0.4627451, 1,
1.403412, -0.3008309, 1.851354, 1, 0, 0.454902, 1,
1.418197, 0.8442312, -1.653017, 1, 0, 0.4509804, 1,
1.418985, 3.184094, 0.1101543, 1, 0, 0.4431373, 1,
1.419402, -0.3741821, 1.793882, 1, 0, 0.4392157, 1,
1.423328, -1.196933, 2.249373, 1, 0, 0.4313726, 1,
1.426349, -1.15162, 1.588406, 1, 0, 0.427451, 1,
1.435921, -1.019839, 2.786622, 1, 0, 0.4196078, 1,
1.437217, 0.3708084, 1.130335, 1, 0, 0.4156863, 1,
1.45459, -0.1878981, 1.519534, 1, 0, 0.4078431, 1,
1.460927, 0.589255, 0.188712, 1, 0, 0.4039216, 1,
1.466758, 0.2907404, 2.863322, 1, 0, 0.3960784, 1,
1.485856, -1.622095, 3.249447, 1, 0, 0.3882353, 1,
1.511626, 0.1274832, 0.496729, 1, 0, 0.3843137, 1,
1.515627, 1.807135, 0.5316803, 1, 0, 0.3764706, 1,
1.518293, 0.6369378, 0.9921713, 1, 0, 0.372549, 1,
1.521804, -0.009910492, 2.732932, 1, 0, 0.3647059, 1,
1.522699, 0.3512078, 1.271577, 1, 0, 0.3607843, 1,
1.52406, 0.4341849, 1.150606, 1, 0, 0.3529412, 1,
1.541238, -1.947346, 1.66324, 1, 0, 0.3490196, 1,
1.579234, -0.5547411, 0.03653653, 1, 0, 0.3411765, 1,
1.584172, 0.757704, 1.919612, 1, 0, 0.3372549, 1,
1.584218, -0.7762902, 2.570146, 1, 0, 0.3294118, 1,
1.586628, -0.143935, 1.322497, 1, 0, 0.3254902, 1,
1.588671, -0.9539583, 1.534166, 1, 0, 0.3176471, 1,
1.613667, 1.586169, 0.4312064, 1, 0, 0.3137255, 1,
1.615252, -1.467345, 2.002321, 1, 0, 0.3058824, 1,
1.631762, 1.304307, 2.409353, 1, 0, 0.2980392, 1,
1.652257, 0.9954853, 1.790333, 1, 0, 0.2941177, 1,
1.661905, -1.074862, 2.173998, 1, 0, 0.2862745, 1,
1.662423, 1.004123, 0.5272689, 1, 0, 0.282353, 1,
1.663795, -1.332758, 1.572329, 1, 0, 0.2745098, 1,
1.684987, -0.9652376, 2.255, 1, 0, 0.2705882, 1,
1.723963, -0.3277541, 0.005354589, 1, 0, 0.2627451, 1,
1.736077, 1.092846, -0.4065457, 1, 0, 0.2588235, 1,
1.738019, 0.4988472, 0.9456281, 1, 0, 0.2509804, 1,
1.743938, 0.3434751, 2.093311, 1, 0, 0.2470588, 1,
1.745684, 1.250648, 1.031739, 1, 0, 0.2392157, 1,
1.749439, -0.8528624, 0.4449631, 1, 0, 0.2352941, 1,
1.757431, -0.8039747, 3.388045, 1, 0, 0.227451, 1,
1.761025, 0.4682622, 1.000238, 1, 0, 0.2235294, 1,
1.809293, -1.004706, 1.739007, 1, 0, 0.2156863, 1,
1.830224, 0.3370645, 1.046627, 1, 0, 0.2117647, 1,
1.835046, -1.524115, 2.343024, 1, 0, 0.2039216, 1,
1.841149, -0.05337051, 1.45901, 1, 0, 0.1960784, 1,
1.842718, -0.2599206, 1.106422, 1, 0, 0.1921569, 1,
1.849052, 1.105235, 1.193339, 1, 0, 0.1843137, 1,
1.892476, -1.009517, 1.033574, 1, 0, 0.1803922, 1,
1.903327, -0.5694737, 3.426021, 1, 0, 0.172549, 1,
1.920513, -0.5597404, 2.987364, 1, 0, 0.1686275, 1,
1.921134, -0.4036432, 2.409741, 1, 0, 0.1607843, 1,
1.929382, -0.8350651, 2.500528, 1, 0, 0.1568628, 1,
1.931468, 0.254949, 0.7973593, 1, 0, 0.1490196, 1,
1.942513, -1.036657, 3.423831, 1, 0, 0.145098, 1,
1.956586, -0.05742664, 0.6894606, 1, 0, 0.1372549, 1,
1.963515, -0.02755951, 1.48202, 1, 0, 0.1333333, 1,
1.974987, 0.4628269, -0.1059105, 1, 0, 0.1254902, 1,
1.992101, 0.06938476, 1.256132, 1, 0, 0.1215686, 1,
1.99572, 1.122316, 1.130894, 1, 0, 0.1137255, 1,
2.040738, 1.334054, 0.7489778, 1, 0, 0.1098039, 1,
2.04096, -0.2612335, 1.742355, 1, 0, 0.1019608, 1,
2.057029, 0.7248865, 1.547873, 1, 0, 0.09411765, 1,
2.117108, -0.06388345, 0.8054532, 1, 0, 0.09019608, 1,
2.121097, -0.6471696, 2.446399, 1, 0, 0.08235294, 1,
2.124598, 0.06783019, 2.168142, 1, 0, 0.07843138, 1,
2.148768, 1.072519, 2.500902, 1, 0, 0.07058824, 1,
2.162038, 0.09917461, 2.1797, 1, 0, 0.06666667, 1,
2.26164, -0.1666014, 0.8536348, 1, 0, 0.05882353, 1,
2.273664, -0.3862487, 1.647191, 1, 0, 0.05490196, 1,
2.32696, 0.4643172, 0.3704398, 1, 0, 0.04705882, 1,
2.352007, -0.160921, 1.164825, 1, 0, 0.04313726, 1,
2.401764, 0.3945475, -2.296578, 1, 0, 0.03529412, 1,
2.476245, -1.272164, 0.9776863, 1, 0, 0.03137255, 1,
2.57787, -0.6677142, 1.625178, 1, 0, 0.02352941, 1,
2.675186, 0.09310877, 1.60816, 1, 0, 0.01960784, 1,
3.266296, -1.255701, 1.670638, 1, 0, 0.01176471, 1,
3.456912, 0.4662465, 0.4062316, 1, 0, 0.007843138, 1
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
-0.2191302, -4.148427, -7.321776, 0, -0.5, 0.5, 0.5,
-0.2191302, -4.148427, -7.321776, 1, -0.5, 0.5, 0.5,
-0.2191302, -4.148427, -7.321776, 1, 1.5, 0.5, 0.5,
-0.2191302, -4.148427, -7.321776, 0, 1.5, 0.5, 0.5
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
-5.14135, 0.08327425, -7.321776, 0, -0.5, 0.5, 0.5,
-5.14135, 0.08327425, -7.321776, 1, -0.5, 0.5, 0.5,
-5.14135, 0.08327425, -7.321776, 1, 1.5, 0.5, 0.5,
-5.14135, 0.08327425, -7.321776, 0, 1.5, 0.5, 0.5
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
-5.14135, -4.148427, 0.009387016, 0, -0.5, 0.5, 0.5,
-5.14135, -4.148427, 0.009387016, 1, -0.5, 0.5, 0.5,
-5.14135, -4.148427, 0.009387016, 1, 1.5, 0.5, 0.5,
-5.14135, -4.148427, 0.009387016, 0, 1.5, 0.5, 0.5
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
-2, -3.171881, -5.629969,
2, -3.171881, -5.629969,
-2, -3.171881, -5.629969,
-2, -3.334639, -5.911937,
0, -3.171881, -5.629969,
0, -3.334639, -5.911937,
2, -3.171881, -5.629969,
2, -3.334639, -5.911937
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
"0",
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
-2, -3.660154, -6.475873, 0, -0.5, 0.5, 0.5,
-2, -3.660154, -6.475873, 1, -0.5, 0.5, 0.5,
-2, -3.660154, -6.475873, 1, 1.5, 0.5, 0.5,
-2, -3.660154, -6.475873, 0, 1.5, 0.5, 0.5,
0, -3.660154, -6.475873, 0, -0.5, 0.5, 0.5,
0, -3.660154, -6.475873, 1, -0.5, 0.5, 0.5,
0, -3.660154, -6.475873, 1, 1.5, 0.5, 0.5,
0, -3.660154, -6.475873, 0, 1.5, 0.5, 0.5,
2, -3.660154, -6.475873, 0, -0.5, 0.5, 0.5,
2, -3.660154, -6.475873, 1, -0.5, 0.5, 0.5,
2, -3.660154, -6.475873, 1, 1.5, 0.5, 0.5,
2, -3.660154, -6.475873, 0, 1.5, 0.5, 0.5
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
-4.005453, -3, -5.629969,
-4.005453, 3, -5.629969,
-4.005453, -3, -5.629969,
-4.194769, -3, -5.911937,
-4.005453, -2, -5.629969,
-4.194769, -2, -5.911937,
-4.005453, -1, -5.629969,
-4.194769, -1, -5.911937,
-4.005453, 0, -5.629969,
-4.194769, 0, -5.911937,
-4.005453, 1, -5.629969,
-4.194769, 1, -5.911937,
-4.005453, 2, -5.629969,
-4.194769, 2, -5.911937,
-4.005453, 3, -5.629969,
-4.194769, 3, -5.911937
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
-4.573401, -3, -6.475873, 0, -0.5, 0.5, 0.5,
-4.573401, -3, -6.475873, 1, -0.5, 0.5, 0.5,
-4.573401, -3, -6.475873, 1, 1.5, 0.5, 0.5,
-4.573401, -3, -6.475873, 0, 1.5, 0.5, 0.5,
-4.573401, -2, -6.475873, 0, -0.5, 0.5, 0.5,
-4.573401, -2, -6.475873, 1, -0.5, 0.5, 0.5,
-4.573401, -2, -6.475873, 1, 1.5, 0.5, 0.5,
-4.573401, -2, -6.475873, 0, 1.5, 0.5, 0.5,
-4.573401, -1, -6.475873, 0, -0.5, 0.5, 0.5,
-4.573401, -1, -6.475873, 1, -0.5, 0.5, 0.5,
-4.573401, -1, -6.475873, 1, 1.5, 0.5, 0.5,
-4.573401, -1, -6.475873, 0, 1.5, 0.5, 0.5,
-4.573401, 0, -6.475873, 0, -0.5, 0.5, 0.5,
-4.573401, 0, -6.475873, 1, -0.5, 0.5, 0.5,
-4.573401, 0, -6.475873, 1, 1.5, 0.5, 0.5,
-4.573401, 0, -6.475873, 0, 1.5, 0.5, 0.5,
-4.573401, 1, -6.475873, 0, -0.5, 0.5, 0.5,
-4.573401, 1, -6.475873, 1, -0.5, 0.5, 0.5,
-4.573401, 1, -6.475873, 1, 1.5, 0.5, 0.5,
-4.573401, 1, -6.475873, 0, 1.5, 0.5, 0.5,
-4.573401, 2, -6.475873, 0, -0.5, 0.5, 0.5,
-4.573401, 2, -6.475873, 1, -0.5, 0.5, 0.5,
-4.573401, 2, -6.475873, 1, 1.5, 0.5, 0.5,
-4.573401, 2, -6.475873, 0, 1.5, 0.5, 0.5,
-4.573401, 3, -6.475873, 0, -0.5, 0.5, 0.5,
-4.573401, 3, -6.475873, 1, -0.5, 0.5, 0.5,
-4.573401, 3, -6.475873, 1, 1.5, 0.5, 0.5,
-4.573401, 3, -6.475873, 0, 1.5, 0.5, 0.5
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
-4.005453, -3.171881, -4,
-4.005453, -3.171881, 4,
-4.005453, -3.171881, -4,
-4.194769, -3.334639, -4,
-4.005453, -3.171881, -2,
-4.194769, -3.334639, -2,
-4.005453, -3.171881, 0,
-4.194769, -3.334639, 0,
-4.005453, -3.171881, 2,
-4.194769, -3.334639, 2,
-4.005453, -3.171881, 4,
-4.194769, -3.334639, 4
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
-4.573401, -3.660154, -4, 0, -0.5, 0.5, 0.5,
-4.573401, -3.660154, -4, 1, -0.5, 0.5, 0.5,
-4.573401, -3.660154, -4, 1, 1.5, 0.5, 0.5,
-4.573401, -3.660154, -4, 0, 1.5, 0.5, 0.5,
-4.573401, -3.660154, -2, 0, -0.5, 0.5, 0.5,
-4.573401, -3.660154, -2, 1, -0.5, 0.5, 0.5,
-4.573401, -3.660154, -2, 1, 1.5, 0.5, 0.5,
-4.573401, -3.660154, -2, 0, 1.5, 0.5, 0.5,
-4.573401, -3.660154, 0, 0, -0.5, 0.5, 0.5,
-4.573401, -3.660154, 0, 1, -0.5, 0.5, 0.5,
-4.573401, -3.660154, 0, 1, 1.5, 0.5, 0.5,
-4.573401, -3.660154, 0, 0, 1.5, 0.5, 0.5,
-4.573401, -3.660154, 2, 0, -0.5, 0.5, 0.5,
-4.573401, -3.660154, 2, 1, -0.5, 0.5, 0.5,
-4.573401, -3.660154, 2, 1, 1.5, 0.5, 0.5,
-4.573401, -3.660154, 2, 0, 1.5, 0.5, 0.5,
-4.573401, -3.660154, 4, 0, -0.5, 0.5, 0.5,
-4.573401, -3.660154, 4, 1, -0.5, 0.5, 0.5,
-4.573401, -3.660154, 4, 1, 1.5, 0.5, 0.5,
-4.573401, -3.660154, 4, 0, 1.5, 0.5, 0.5
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
-4.005453, -3.171881, -5.629969,
-4.005453, 3.338429, -5.629969,
-4.005453, -3.171881, 5.648743,
-4.005453, 3.338429, 5.648743,
-4.005453, -3.171881, -5.629969,
-4.005453, -3.171881, 5.648743,
-4.005453, 3.338429, -5.629969,
-4.005453, 3.338429, 5.648743,
-4.005453, -3.171881, -5.629969,
3.567193, -3.171881, -5.629969,
-4.005453, -3.171881, 5.648743,
3.567193, -3.171881, 5.648743,
-4.005453, 3.338429, -5.629969,
3.567193, 3.338429, -5.629969,
-4.005453, 3.338429, 5.648743,
3.567193, 3.338429, 5.648743,
3.567193, -3.171881, -5.629969,
3.567193, 3.338429, -5.629969,
3.567193, -3.171881, 5.648743,
3.567193, 3.338429, 5.648743,
3.567193, -3.171881, -5.629969,
3.567193, -3.171881, 5.648743,
3.567193, 3.338429, -5.629969,
3.567193, 3.338429, 5.648743
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
var radius = 8.044138;
var distance = 35.78928;
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
mvMatrix.translate( 0.2191302, -0.08327425, -0.009387016 );
mvMatrix.scale( 1.148539, 1.335955, 0.7711412 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.78928);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
triazamate<-read.table("triazamate.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-triazamate$V2
```

```
## Error in eval(expr, envir, enclos): object 'triazamate' not found
```

```r
y<-triazamate$V3
```

```
## Error in eval(expr, envir, enclos): object 'triazamate' not found
```

```r
z<-triazamate$V4
```

```
## Error in eval(expr, envir, enclos): object 'triazamate' not found
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
-3.895172, -0.9377446, -0.1496864, 0, 0, 1, 1, 1,
-3.063385, -0.3277165, -3.186481, 1, 0, 0, 1, 1,
-3.057061, -0.2210348, -2.440911, 1, 0, 0, 1, 1,
-2.946503, -0.4913092, -3.365725, 1, 0, 0, 1, 1,
-2.72147, 1.262814, -1.213631, 1, 0, 0, 1, 1,
-2.707747, 1.557576, -0.8463529, 1, 0, 0, 1, 1,
-2.656881, 0.1465016, -1.181864, 0, 0, 0, 1, 1,
-2.641893, 0.1686989, -3.898139, 0, 0, 0, 1, 1,
-2.633993, 0.813702, -0.8945392, 0, 0, 0, 1, 1,
-2.579812, -0.609892, -0.2635547, 0, 0, 0, 1, 1,
-2.533896, 0.3698849, -2.221341, 0, 0, 0, 1, 1,
-2.500976, 0.5363364, -1.104093, 0, 0, 0, 1, 1,
-2.366543, -1.982386, -1.612598, 0, 0, 0, 1, 1,
-2.351719, -0.3125774, -2.256467, 1, 1, 1, 1, 1,
-2.337345, -1.025748, -0.1361887, 1, 1, 1, 1, 1,
-2.320468, -1.626378, -2.028655, 1, 1, 1, 1, 1,
-2.307039, -0.09307294, -2.332292, 1, 1, 1, 1, 1,
-2.218573, 0.2498669, 0.1687123, 1, 1, 1, 1, 1,
-2.215335, 0.4246489, -1.365443, 1, 1, 1, 1, 1,
-2.188756, 1.686081, -0.841657, 1, 1, 1, 1, 1,
-2.156312, -0.4497665, -2.348108, 1, 1, 1, 1, 1,
-2.153526, -0.1039664, -3.232189, 1, 1, 1, 1, 1,
-2.152502, 0.05774247, -0.2206735, 1, 1, 1, 1, 1,
-2.13575, -1.069738, -2.739979, 1, 1, 1, 1, 1,
-2.117928, 1.694975, -2.297126, 1, 1, 1, 1, 1,
-2.078316, 0.2324057, -1.079213, 1, 1, 1, 1, 1,
-2.072816, 0.5998039, -1.706677, 1, 1, 1, 1, 1,
-2.05396, 0.8130369, -3.302241, 1, 1, 1, 1, 1,
-2.017701, -1.039883, -0.3123272, 0, 0, 1, 1, 1,
-2.015655, -1.913085, 0.1493938, 1, 0, 0, 1, 1,
-2.00091, 0.8707196, -0.03140588, 1, 0, 0, 1, 1,
-1.981712, -1.807922, -2.791337, 1, 0, 0, 1, 1,
-1.960613, -1.419083, -1.336697, 1, 0, 0, 1, 1,
-1.937617, 1.169588, -0.2937048, 1, 0, 0, 1, 1,
-1.935947, -0.2487494, -2.471361, 0, 0, 0, 1, 1,
-1.934724, 1.148234, -1.345505, 0, 0, 0, 1, 1,
-1.916161, 1.11786, -2.019089, 0, 0, 0, 1, 1,
-1.909696, 0.7194355, 0.2553267, 0, 0, 0, 1, 1,
-1.896957, 0.7734824, -0.6535731, 0, 0, 0, 1, 1,
-1.851255, -0.5694124, -2.316072, 0, 0, 0, 1, 1,
-1.838461, -0.416817, -0.6191093, 0, 0, 0, 1, 1,
-1.830024, -0.4163277, -1.081191, 1, 1, 1, 1, 1,
-1.829917, -0.7513062, -0.8473138, 1, 1, 1, 1, 1,
-1.826737, -1.682358, -1.26592, 1, 1, 1, 1, 1,
-1.80417, 0.2048615, -2.682285, 1, 1, 1, 1, 1,
-1.802011, 1.341121, -1.066965, 1, 1, 1, 1, 1,
-1.798194, 0.9774367, -2.068437, 1, 1, 1, 1, 1,
-1.757728, 2.185559, -1.077943, 1, 1, 1, 1, 1,
-1.726311, 0.05401629, -1.462187, 1, 1, 1, 1, 1,
-1.698281, 0.5604553, -0.4490916, 1, 1, 1, 1, 1,
-1.686595, 0.125842, -2.374829, 1, 1, 1, 1, 1,
-1.652743, -1.584132, -3.649205, 1, 1, 1, 1, 1,
-1.622334, -1.267772, -3.242718, 1, 1, 1, 1, 1,
-1.620845, -1.592832, -1.764595, 1, 1, 1, 1, 1,
-1.618835, 0.6881427, -1.650412, 1, 1, 1, 1, 1,
-1.608918, 0.4722872, -2.381852, 1, 1, 1, 1, 1,
-1.601419, 0.257051, -0.9851334, 0, 0, 1, 1, 1,
-1.590661, -0.4076371, 1.073339, 1, 0, 0, 1, 1,
-1.587383, -0.4042842, -2.7624, 1, 0, 0, 1, 1,
-1.58442, -1.142188, -0.2076223, 1, 0, 0, 1, 1,
-1.581866, 0.711791, -1.145142, 1, 0, 0, 1, 1,
-1.580718, 0.2652161, -1.271127, 1, 0, 0, 1, 1,
-1.580138, 0.7423843, -0.1031703, 0, 0, 0, 1, 1,
-1.565172, 0.4571415, -1.931618, 0, 0, 0, 1, 1,
-1.562962, -1.86, -2.509464, 0, 0, 0, 1, 1,
-1.561547, 1.687839, -0.6314294, 0, 0, 0, 1, 1,
-1.559716, -0.7980945, -1.735024, 0, 0, 0, 1, 1,
-1.554261, -1.878292, -3.416965, 0, 0, 0, 1, 1,
-1.55303, -0.05116066, -2.43903, 0, 0, 0, 1, 1,
-1.55005, 0.630447, -0.8636339, 1, 1, 1, 1, 1,
-1.530159, 0.9435799, 1.061333, 1, 1, 1, 1, 1,
-1.52551, -0.01371198, -2.464564, 1, 1, 1, 1, 1,
-1.523783, -0.02675535, -1.778448, 1, 1, 1, 1, 1,
-1.520657, -0.4501628, -3.876081, 1, 1, 1, 1, 1,
-1.518693, 0.1667042, -0.9303445, 1, 1, 1, 1, 1,
-1.515427, -0.09178435, -1.464134, 1, 1, 1, 1, 1,
-1.489288, -0.6002681, -0.4859222, 1, 1, 1, 1, 1,
-1.484031, -1.53051, -1.478436, 1, 1, 1, 1, 1,
-1.469148, 0.7116864, -0.4011509, 1, 1, 1, 1, 1,
-1.464437, 2.060856, -1.454211, 1, 1, 1, 1, 1,
-1.456563, 0.6406511, -1.540968, 1, 1, 1, 1, 1,
-1.451824, -0.7014427, -2.41191, 1, 1, 1, 1, 1,
-1.443402, -1.44175, -3.195192, 1, 1, 1, 1, 1,
-1.435911, 0.03524675, -1.650761, 1, 1, 1, 1, 1,
-1.428845, 0.5088705, -2.894262, 0, 0, 1, 1, 1,
-1.425642, -0.06840678, -3.586973, 1, 0, 0, 1, 1,
-1.418249, -0.3844393, -0.2846418, 1, 0, 0, 1, 1,
-1.413497, -1.368567, -2.898344, 1, 0, 0, 1, 1,
-1.399386, -0.8520933, -0.001636039, 1, 0, 0, 1, 1,
-1.388814, -0.4836787, -1.766633, 1, 0, 0, 1, 1,
-1.383274, 0.08940551, -0.5457026, 0, 0, 0, 1, 1,
-1.382634, -0.5216571, -3.187002, 0, 0, 0, 1, 1,
-1.374297, -0.5420443, -1.383403, 0, 0, 0, 1, 1,
-1.365168, -1.404915, -3.081046, 0, 0, 0, 1, 1,
-1.362149, 0.6955219, -2.069689, 0, 0, 0, 1, 1,
-1.361503, 0.4801931, -1.290707, 0, 0, 0, 1, 1,
-1.358926, -0.4712394, -0.8473311, 0, 0, 0, 1, 1,
-1.358227, 0.2988633, -0.9336912, 1, 1, 1, 1, 1,
-1.34596, -0.6718309, -0.7043821, 1, 1, 1, 1, 1,
-1.34457, 1.057456, -0.4261106, 1, 1, 1, 1, 1,
-1.342346, -0.3551894, -1.621672, 1, 1, 1, 1, 1,
-1.341559, -0.2106725, -2.07136, 1, 1, 1, 1, 1,
-1.333566, -1.07051, -1.052363, 1, 1, 1, 1, 1,
-1.328006, 0.9967083, -1.529769, 1, 1, 1, 1, 1,
-1.32433, 0.475048, -0.2984242, 1, 1, 1, 1, 1,
-1.322299, -1.200818, -0.696492, 1, 1, 1, 1, 1,
-1.320511, -0.2731974, -1.438127, 1, 1, 1, 1, 1,
-1.319662, -0.9956315, -3.413016, 1, 1, 1, 1, 1,
-1.307072, 0.7803958, -1.499193, 1, 1, 1, 1, 1,
-1.300369, -0.8875235, -3.350288, 1, 1, 1, 1, 1,
-1.286436, 0.4303944, 0.1232914, 1, 1, 1, 1, 1,
-1.281092, -2.41129, -3.303846, 1, 1, 1, 1, 1,
-1.278317, -1.565782, -0.9364502, 0, 0, 1, 1, 1,
-1.268633, 0.5830049, -1.034597, 1, 0, 0, 1, 1,
-1.26625, -0.118637, -2.058799, 1, 0, 0, 1, 1,
-1.264626, -0.1175411, -1.162355, 1, 0, 0, 1, 1,
-1.260981, -0.9025396, -2.611428, 1, 0, 0, 1, 1,
-1.256254, 0.1271977, 0.2644714, 1, 0, 0, 1, 1,
-1.253375, 0.3387089, -1.18539, 0, 0, 0, 1, 1,
-1.243731, -0.9728079, -2.270601, 0, 0, 0, 1, 1,
-1.241683, -0.2542897, -0.07042878, 0, 0, 0, 1, 1,
-1.225778, -1.756379, -1.928092, 0, 0, 0, 1, 1,
-1.214311, -0.2599778, -3.592258, 0, 0, 0, 1, 1,
-1.199326, 0.4407063, -0.9372296, 0, 0, 0, 1, 1,
-1.195824, -1.241492, -1.784909, 0, 0, 0, 1, 1,
-1.189273, -0.5144572, -2.621521, 1, 1, 1, 1, 1,
-1.185446, -0.464576, -2.090422, 1, 1, 1, 1, 1,
-1.18254, -0.4769283, -3.605267, 1, 1, 1, 1, 1,
-1.173283, -0.7537469, -1.712411, 1, 1, 1, 1, 1,
-1.173275, -0.02953907, -0.000877547, 1, 1, 1, 1, 1,
-1.172722, 0.5251292, -1.044354, 1, 1, 1, 1, 1,
-1.172027, 1.63309, -0.8556464, 1, 1, 1, 1, 1,
-1.166809, 0.4344011, -0.9923834, 1, 1, 1, 1, 1,
-1.161358, -0.6222944, -1.593393, 1, 1, 1, 1, 1,
-1.158835, 0.02564723, -2.145685, 1, 1, 1, 1, 1,
-1.158086, -0.4897711, -1.410618, 1, 1, 1, 1, 1,
-1.154421, 0.2010647, -0.8647738, 1, 1, 1, 1, 1,
-1.147633, -1.074399, -2.801341, 1, 1, 1, 1, 1,
-1.131734, -0.4918182, -2.263612, 1, 1, 1, 1, 1,
-1.122844, 0.3262107, -0.3106337, 1, 1, 1, 1, 1,
-1.12073, 0.7526904, -1.002272, 0, 0, 1, 1, 1,
-1.119568, 1.859931, 0.2911167, 1, 0, 0, 1, 1,
-1.113057, -0.8040807, -2.957687, 1, 0, 0, 1, 1,
-1.112491, 0.7215088, -1.035887, 1, 0, 0, 1, 1,
-1.096275, 0.6759422, -1.929296, 1, 0, 0, 1, 1,
-1.095365, 0.2744516, -2.700955, 1, 0, 0, 1, 1,
-1.089679, -1.446726, -2.679834, 0, 0, 0, 1, 1,
-1.086286, 1.173154, -1.329706, 0, 0, 0, 1, 1,
-1.080912, -0.3724709, -1.250744, 0, 0, 0, 1, 1,
-1.075857, 0.30732, -1.155331, 0, 0, 0, 1, 1,
-1.075762, 0.08156293, -2.098944, 0, 0, 0, 1, 1,
-1.072533, -0.3524024, -0.3420678, 0, 0, 0, 1, 1,
-1.065689, 2.631645, 0.7132405, 0, 0, 0, 1, 1,
-1.06487, 0.1118491, -0.69763, 1, 1, 1, 1, 1,
-1.063588, 1.44911, -0.4373839, 1, 1, 1, 1, 1,
-1.061, 1.449208, -0.2912618, 1, 1, 1, 1, 1,
-1.059591, -0.8003885, -2.127207, 1, 1, 1, 1, 1,
-1.058967, -0.4904469, -2.828502, 1, 1, 1, 1, 1,
-1.049486, 1.395945, 2.038466, 1, 1, 1, 1, 1,
-1.045402, 0.8345793, -1.416294, 1, 1, 1, 1, 1,
-1.041768, 0.2863054, -2.447487, 1, 1, 1, 1, 1,
-1.039789, 0.1603276, -1.302213, 1, 1, 1, 1, 1,
-1.038093, 0.4763691, -1.525978, 1, 1, 1, 1, 1,
-1.037673, -0.5118743, -2.177736, 1, 1, 1, 1, 1,
-1.037416, -1.523951, -2.908397, 1, 1, 1, 1, 1,
-1.035139, 2.232468, -1.441876, 1, 1, 1, 1, 1,
-1.033664, -0.7155493, -0.3621834, 1, 1, 1, 1, 1,
-1.026178, -1.252237, -2.418576, 1, 1, 1, 1, 1,
-1.025662, -0.8917657, -2.321496, 0, 0, 1, 1, 1,
-1.015181, -1.686393, -3.634598, 1, 0, 0, 1, 1,
-1.014708, -0.4089951, -1.280086, 1, 0, 0, 1, 1,
-1.005052, -0.5606784, -2.408131, 1, 0, 0, 1, 1,
-1.000012, 1.630165, -1.151367, 1, 0, 0, 1, 1,
-0.9943174, -1.305853, -1.862342, 1, 0, 0, 1, 1,
-0.9910323, -0.01246954, -1.308084, 0, 0, 0, 1, 1,
-0.9890296, 0.4987851, -0.2806081, 0, 0, 0, 1, 1,
-0.98292, 1.000675, 0.5644495, 0, 0, 0, 1, 1,
-0.9753351, -0.179458, -1.749972, 0, 0, 0, 1, 1,
-0.9747684, -0.7416287, -2.660927, 0, 0, 0, 1, 1,
-0.9709015, -2.340813, -1.10051, 0, 0, 0, 1, 1,
-0.9704142, -1.666196, -4.174849, 0, 0, 0, 1, 1,
-0.9665595, -0.8208175, -1.576393, 1, 1, 1, 1, 1,
-0.963848, -1.472132, -2.787998, 1, 1, 1, 1, 1,
-0.9546503, 1.148558, -0.1820053, 1, 1, 1, 1, 1,
-0.9527408, 0.7343666, -0.47506, 1, 1, 1, 1, 1,
-0.9489924, 1.526124, -0.1954686, 1, 1, 1, 1, 1,
-0.9483705, 1.291358, 0.631102, 1, 1, 1, 1, 1,
-0.9459966, -0.8133798, -2.117846, 1, 1, 1, 1, 1,
-0.9411223, 0.8006226, -1.420825, 1, 1, 1, 1, 1,
-0.9372101, -0.5783383, -3.05012, 1, 1, 1, 1, 1,
-0.9294961, 1.249563, 0.5202925, 1, 1, 1, 1, 1,
-0.92608, 1.719179, -0.1230425, 1, 1, 1, 1, 1,
-0.9133002, -0.6190041, -3.847599, 1, 1, 1, 1, 1,
-0.907662, 0.8183635, 0.5405013, 1, 1, 1, 1, 1,
-0.9004622, -0.9974052, -2.842183, 1, 1, 1, 1, 1,
-0.8978215, -0.9430537, -2.230244, 1, 1, 1, 1, 1,
-0.8972795, -0.8511413, -1.536558, 0, 0, 1, 1, 1,
-0.8964328, -1.111403, -3.344077, 1, 0, 0, 1, 1,
-0.8953573, 1.262802, -2.531195, 1, 0, 0, 1, 1,
-0.889585, -0.9455323, -3.694258, 1, 0, 0, 1, 1,
-0.8884351, 1.168843, 0.2261551, 1, 0, 0, 1, 1,
-0.8866732, 1.595037, -0.6761361, 1, 0, 0, 1, 1,
-0.8830993, 0.2021997, -0.5170234, 0, 0, 0, 1, 1,
-0.882358, 0.5842392, -1.881616, 0, 0, 0, 1, 1,
-0.8736866, -1.022945, -3.618207, 0, 0, 0, 1, 1,
-0.8715776, 1.482608, -0.05228332, 0, 0, 0, 1, 1,
-0.8668168, -0.1671742, -2.414828, 0, 0, 0, 1, 1,
-0.8615062, -1.455837, -2.544912, 0, 0, 0, 1, 1,
-0.8611792, -1.869942, -2.463158, 0, 0, 0, 1, 1,
-0.8551171, 1.369941, 0.1681163, 1, 1, 1, 1, 1,
-0.8524481, 0.2530702, -1.142769, 1, 1, 1, 1, 1,
-0.8522961, 0.516399, -1.881759, 1, 1, 1, 1, 1,
-0.8510678, 0.3179545, -1.988591, 1, 1, 1, 1, 1,
-0.8498394, 0.9024309, -2.638001, 1, 1, 1, 1, 1,
-0.8475763, -0.3978194, -2.342505, 1, 1, 1, 1, 1,
-0.8448007, 0.03888349, -0.5819389, 1, 1, 1, 1, 1,
-0.8421889, 0.2136241, -1.242054, 1, 1, 1, 1, 1,
-0.835698, 1.478305, 0.5877017, 1, 1, 1, 1, 1,
-0.8355652, -0.6780224, -2.56103, 1, 1, 1, 1, 1,
-0.8336221, 1.922769, -0.9592574, 1, 1, 1, 1, 1,
-0.8332245, 1.423924, -0.4543235, 1, 1, 1, 1, 1,
-0.8305837, -2.975075, -3.056001, 1, 1, 1, 1, 1,
-0.8276908, 0.6414514, 0.01496789, 1, 1, 1, 1, 1,
-0.8266129, -0.0899512, -1.063743, 1, 1, 1, 1, 1,
-0.8229242, -0.365289, -1.259137, 0, 0, 1, 1, 1,
-0.8148329, -2.099831, -2.197167, 1, 0, 0, 1, 1,
-0.8119049, 0.5886707, -2.426441, 1, 0, 0, 1, 1,
-0.8108078, -0.06712696, -2.496754, 1, 0, 0, 1, 1,
-0.8105255, -1.047484, -2.591107, 1, 0, 0, 1, 1,
-0.8046882, -0.1573083, -1.084045, 1, 0, 0, 1, 1,
-0.7999278, 1.556485, 0.1066463, 0, 0, 0, 1, 1,
-0.7993816, -0.8182331, -2.481524, 0, 0, 0, 1, 1,
-0.7980579, 0.3274902, -0.9466373, 0, 0, 0, 1, 1,
-0.7976567, -1.83026, -2.698052, 0, 0, 0, 1, 1,
-0.7956241, 1.181293, 0.8585477, 0, 0, 0, 1, 1,
-0.7905055, -0.846764, -2.578833, 0, 0, 0, 1, 1,
-0.7891208, -0.4942815, -2.732339, 0, 0, 0, 1, 1,
-0.7871115, -2.20198, -3.819689, 1, 1, 1, 1, 1,
-0.7854632, -1.010326, -3.889904, 1, 1, 1, 1, 1,
-0.7848557, 1.648611, -0.6323106, 1, 1, 1, 1, 1,
-0.7835643, 0.7866935, -0.2600115, 1, 1, 1, 1, 1,
-0.7819955, 0.6529391, -1.583427, 1, 1, 1, 1, 1,
-0.7817567, -2.283666, -2.922137, 1, 1, 1, 1, 1,
-0.7800047, 2.373073, -1.054937, 1, 1, 1, 1, 1,
-0.7784613, 0.22709, -1.589443, 1, 1, 1, 1, 1,
-0.7721164, -1.141578, -3.822415, 1, 1, 1, 1, 1,
-0.7578281, -1.195786, -1.814567, 1, 1, 1, 1, 1,
-0.752085, -1.016485, -2.761119, 1, 1, 1, 1, 1,
-0.7518817, -0.9464689, -2.075816, 1, 1, 1, 1, 1,
-0.7483664, 0.3457916, -0.6139987, 1, 1, 1, 1, 1,
-0.7461861, 1.019499, 0.3781596, 1, 1, 1, 1, 1,
-0.7410768, 0.1013035, 0.4536648, 1, 1, 1, 1, 1,
-0.7364812, -0.5983884, -0.957846, 0, 0, 1, 1, 1,
-0.7322785, 0.4600439, -0.7599053, 1, 0, 0, 1, 1,
-0.7299443, 0.5892439, -0.7437103, 1, 0, 0, 1, 1,
-0.7242018, -0.05502315, -0.9085608, 1, 0, 0, 1, 1,
-0.7221796, 1.065815, -0.5409434, 1, 0, 0, 1, 1,
-0.721693, -0.831673, -3.18526, 1, 0, 0, 1, 1,
-0.7209921, -1.947189, -1.611994, 0, 0, 0, 1, 1,
-0.7187191, -0.3776582, -2.738443, 0, 0, 0, 1, 1,
-0.7177863, 1.052183, -0.1594736, 0, 0, 0, 1, 1,
-0.7147877, 0.3643097, -0.6292592, 0, 0, 0, 1, 1,
-0.7135122, 0.3636193, 1.160684, 0, 0, 0, 1, 1,
-0.7131997, -0.832594, -3.114323, 0, 0, 0, 1, 1,
-0.7117623, 0.5626808, 2.255587, 0, 0, 0, 1, 1,
-0.7046225, 0.5118418, -0.3404048, 1, 1, 1, 1, 1,
-0.7031924, -0.1001828, -1.395382, 1, 1, 1, 1, 1,
-0.7025873, -0.687448, -1.456304, 1, 1, 1, 1, 1,
-0.694846, 0.2612749, -1.272809, 1, 1, 1, 1, 1,
-0.6843985, -0.06223221, -1.560159, 1, 1, 1, 1, 1,
-0.682728, -1.040294, -1.271699, 1, 1, 1, 1, 1,
-0.6806261, 0.5136876, -0.3806362, 1, 1, 1, 1, 1,
-0.6765188, 0.1097228, -0.4585046, 1, 1, 1, 1, 1,
-0.6698766, -0.5391123, -2.079545, 1, 1, 1, 1, 1,
-0.6693956, -1.414241, -2.549368, 1, 1, 1, 1, 1,
-0.6551018, 1.60061, -0.3384019, 1, 1, 1, 1, 1,
-0.6532116, -0.6392269, -2.848329, 1, 1, 1, 1, 1,
-0.6465446, -0.9187188, -4.441208, 1, 1, 1, 1, 1,
-0.6461374, 1.48831, -0.7805989, 1, 1, 1, 1, 1,
-0.6405795, 0.7439327, -0.5541393, 1, 1, 1, 1, 1,
-0.6395555, 2.201291, -0.8196396, 0, 0, 1, 1, 1,
-0.6326215, -0.9470109, -2.259488, 1, 0, 0, 1, 1,
-0.6306067, 0.004315699, -1.473234, 1, 0, 0, 1, 1,
-0.627338, 0.5567428, 0.4707935, 1, 0, 0, 1, 1,
-0.626844, 1.664098, -1.809243, 1, 0, 0, 1, 1,
-0.6110845, 0.823775, -0.9916267, 1, 0, 0, 1, 1,
-0.6105305, 0.605965, -2.556106, 0, 0, 0, 1, 1,
-0.6076096, -0.4366004, -4.171636, 0, 0, 0, 1, 1,
-0.6062929, 0.5751743, -2.045408, 0, 0, 0, 1, 1,
-0.6059151, 0.08891308, -1.288442, 0, 0, 0, 1, 1,
-0.6020578, -0.6010687, -3.25937, 0, 0, 0, 1, 1,
-0.6016671, -0.6540818, -1.689807, 0, 0, 0, 1, 1,
-0.6014729, -0.5479631, -2.411382, 0, 0, 0, 1, 1,
-0.601212, -0.3017224, -3.082336, 1, 1, 1, 1, 1,
-0.600943, -2.653685, -1.695239, 1, 1, 1, 1, 1,
-0.6002768, -0.502305, -2.749095, 1, 1, 1, 1, 1,
-0.5995539, 1.14078, -0.1059311, 1, 1, 1, 1, 1,
-0.599099, 0.3043015, -0.5791926, 1, 1, 1, 1, 1,
-0.5990672, -0.7874016, -1.793527, 1, 1, 1, 1, 1,
-0.5966637, -0.2429348, -2.043212, 1, 1, 1, 1, 1,
-0.5955296, -0.6498304, -0.9330909, 1, 1, 1, 1, 1,
-0.5953683, 0.7083378, -1.627416, 1, 1, 1, 1, 1,
-0.5916561, -0.2039811, -0.6774818, 1, 1, 1, 1, 1,
-0.5857862, 0.4610216, -0.7630625, 1, 1, 1, 1, 1,
-0.5843767, -0.2815678, -3.282411, 1, 1, 1, 1, 1,
-0.5837343, 0.5189686, -0.2112171, 1, 1, 1, 1, 1,
-0.5797778, -0.03768627, -1.24214, 1, 1, 1, 1, 1,
-0.5733474, 0.001134213, -3.007282, 1, 1, 1, 1, 1,
-0.5658919, 2.352796, 0.6465368, 0, 0, 1, 1, 1,
-0.5651491, 0.4566204, 0.001987804, 1, 0, 0, 1, 1,
-0.5649074, 1.559863, -0.4386406, 1, 0, 0, 1, 1,
-0.5631656, -0.3955293, -3.034702, 1, 0, 0, 1, 1,
-0.5623502, -1.449309, -3.399477, 1, 0, 0, 1, 1,
-0.5566099, -0.5400655, -2.734008, 1, 0, 0, 1, 1,
-0.5562577, 0.3055289, -0.796949, 0, 0, 0, 1, 1,
-0.5522459, 0.08878797, -1.165229, 0, 0, 0, 1, 1,
-0.5472464, -1.359796, -3.239354, 0, 0, 0, 1, 1,
-0.5467294, 0.07010868, -2.494445, 0, 0, 0, 1, 1,
-0.5448985, -2.037871, -2.309583, 0, 0, 0, 1, 1,
-0.5411734, 1.440371, -0.2000755, 0, 0, 0, 1, 1,
-0.5346506, 1.252754, 0.3622193, 0, 0, 0, 1, 1,
-0.5345511, 0.980447, 0.2402567, 1, 1, 1, 1, 1,
-0.5311956, 0.4613875, -0.8350042, 1, 1, 1, 1, 1,
-0.5285456, 0.7955744, -1.215509, 1, 1, 1, 1, 1,
-0.5254811, 0.2046056, -0.1104288, 1, 1, 1, 1, 1,
-0.5214996, 0.433666, -0.3180342, 1, 1, 1, 1, 1,
-0.516207, -0.6892955, -2.698188, 1, 1, 1, 1, 1,
-0.5108454, -0.8361021, -2.221818, 1, 1, 1, 1, 1,
-0.5093719, -0.210641, -2.965466, 1, 1, 1, 1, 1,
-0.507808, 1.083875, -1.155859, 1, 1, 1, 1, 1,
-0.5003228, -0.4426829, -4.217623, 1, 1, 1, 1, 1,
-0.4885737, 0.7348204, -0.7392387, 1, 1, 1, 1, 1,
-0.4859287, -1.929366, -3.596805, 1, 1, 1, 1, 1,
-0.4843531, 1.010396, -0.7861586, 1, 1, 1, 1, 1,
-0.4753379, 0.7197599, -0.9709883, 1, 1, 1, 1, 1,
-0.4745562, -1.216392, -2.059965, 1, 1, 1, 1, 1,
-0.4724917, -0.5859199, -4.163378, 0, 0, 1, 1, 1,
-0.4717145, -0.2307775, -1.21988, 1, 0, 0, 1, 1,
-0.469598, -0.491589, -1.399484, 1, 0, 0, 1, 1,
-0.469307, 0.03221104, -1.975358, 1, 0, 0, 1, 1,
-0.4658564, -0.8768374, -3.254709, 1, 0, 0, 1, 1,
-0.4649406, 0.5246641, -0.08314767, 1, 0, 0, 1, 1,
-0.4629655, -1.045667, -1.788058, 0, 0, 0, 1, 1,
-0.4605627, -1.789763, -2.925175, 0, 0, 0, 1, 1,
-0.4561931, 0.033604, -2.079622, 0, 0, 0, 1, 1,
-0.4466526, 0.05383824, -2.976114, 0, 0, 0, 1, 1,
-0.4406894, -1.454665, -4.166693, 0, 0, 0, 1, 1,
-0.4376712, -0.8855837, -1.931717, 0, 0, 0, 1, 1,
-0.4365378, 0.8808299, 2.50273, 0, 0, 0, 1, 1,
-0.4355296, -2.035133, -2.863495, 1, 1, 1, 1, 1,
-0.4328821, -0.008764938, -1.103932, 1, 1, 1, 1, 1,
-0.4310576, -1.203677, -4.54883, 1, 1, 1, 1, 1,
-0.42887, 0.08029612, -2.101469, 1, 1, 1, 1, 1,
-0.4254141, 0.9346103, -1.743252, 1, 1, 1, 1, 1,
-0.4229878, 1.161698, 0.3270734, 1, 1, 1, 1, 1,
-0.4229237, 0.379704, -2.052341, 1, 1, 1, 1, 1,
-0.4183131, 0.2031109, -0.1976308, 1, 1, 1, 1, 1,
-0.4152943, 0.3433653, 1.136168, 1, 1, 1, 1, 1,
-0.4107237, 2.112601, -0.8156765, 1, 1, 1, 1, 1,
-0.4065768, 0.5195185, -0.7482109, 1, 1, 1, 1, 1,
-0.4051824, 0.09887677, -1.202924, 1, 1, 1, 1, 1,
-0.4038787, -1.439638, -3.383343, 1, 1, 1, 1, 1,
-0.3941872, 0.09575204, -1.51553, 1, 1, 1, 1, 1,
-0.3909159, -0.794347, -2.147363, 1, 1, 1, 1, 1,
-0.388097, 0.4380403, -2.312224, 0, 0, 1, 1, 1,
-0.3874094, -0.09588151, -3.541113, 1, 0, 0, 1, 1,
-0.3849015, -1.15845, -4.014396, 1, 0, 0, 1, 1,
-0.3848817, -0.9761094, -1.498017, 1, 0, 0, 1, 1,
-0.3812472, -0.8754225, -3.089157, 1, 0, 0, 1, 1,
-0.3741484, -0.6241478, -3.511691, 1, 0, 0, 1, 1,
-0.3736515, 0.4754773, -1.955522, 0, 0, 0, 1, 1,
-0.3733735, -0.09437078, -2.116896, 0, 0, 0, 1, 1,
-0.3725658, 0.6906524, -1.155527, 0, 0, 0, 1, 1,
-0.370457, -0.4758703, -1.87362, 0, 0, 0, 1, 1,
-0.367878, -0.5370944, -2.0853, 0, 0, 0, 1, 1,
-0.3674168, -0.6581975, -2.825592, 0, 0, 0, 1, 1,
-0.3595975, -0.9641115, -3.570146, 0, 0, 0, 1, 1,
-0.3566852, -1.450171, -1.826513, 1, 1, 1, 1, 1,
-0.3554555, 0.7180241, -1.195369, 1, 1, 1, 1, 1,
-0.3385558, -1.385633, -2.711194, 1, 1, 1, 1, 1,
-0.3290704, 1.048469, 1.040698, 1, 1, 1, 1, 1,
-0.3239445, 0.4271685, -0.6131738, 1, 1, 1, 1, 1,
-0.3238712, -0.5544474, -2.09443, 1, 1, 1, 1, 1,
-0.3184589, -0.9871853, -2.145571, 1, 1, 1, 1, 1,
-0.3180268, 0.643252, -0.7580923, 1, 1, 1, 1, 1,
-0.315955, -1.423889, -3.178232, 1, 1, 1, 1, 1,
-0.3158159, 0.04278285, -2.571964, 1, 1, 1, 1, 1,
-0.3054938, 0.6189342, -1.361899, 1, 1, 1, 1, 1,
-0.301768, -0.2988698, -2.715227, 1, 1, 1, 1, 1,
-0.2993262, 0.3858807, -1.583855, 1, 1, 1, 1, 1,
-0.2896999, 0.258145, -2.754078, 1, 1, 1, 1, 1,
-0.2878694, 0.2099087, -0.9280701, 1, 1, 1, 1, 1,
-0.2856055, -0.973355, -3.822141, 0, 0, 1, 1, 1,
-0.284269, -0.5067442, -2.334717, 1, 0, 0, 1, 1,
-0.2822335, -0.2964702, -2.578751, 1, 0, 0, 1, 1,
-0.2810867, 1.350717, -0.5238102, 1, 0, 0, 1, 1,
-0.2780954, 0.6669512, -1.804166, 1, 0, 0, 1, 1,
-0.2727591, 0.05417553, -1.614665, 1, 0, 0, 1, 1,
-0.2658482, -0.4562126, -1.744799, 0, 0, 0, 1, 1,
-0.2657362, 0.1557865, -0.8770477, 0, 0, 0, 1, 1,
-0.2657156, 0.1711911, -0.4225963, 0, 0, 0, 1, 1,
-0.2642679, 0.7166157, -1.292371, 0, 0, 0, 1, 1,
-0.2633771, -0.1250932, -3.289526, 0, 0, 0, 1, 1,
-0.2599826, 0.4035532, -0.4830885, 0, 0, 0, 1, 1,
-0.2599551, 0.05359454, -0.8733077, 0, 0, 0, 1, 1,
-0.2593239, 1.084327, -1.223629, 1, 1, 1, 1, 1,
-0.257919, -0.6853917, -3.541878, 1, 1, 1, 1, 1,
-0.2547719, 0.5293126, -0.1754939, 1, 1, 1, 1, 1,
-0.2530851, 1.259519, -2.62565, 1, 1, 1, 1, 1,
-0.2512189, 0.1928497, -2.423341, 1, 1, 1, 1, 1,
-0.2495211, -0.3924679, -2.571863, 1, 1, 1, 1, 1,
-0.2470478, 1.361532, -0.04203828, 1, 1, 1, 1, 1,
-0.2408248, 0.2190496, -0.6416098, 1, 1, 1, 1, 1,
-0.2404262, -0.7737638, -2.748201, 1, 1, 1, 1, 1,
-0.2394246, -0.7680356, -1.931918, 1, 1, 1, 1, 1,
-0.2389356, -1.30991, -3.597027, 1, 1, 1, 1, 1,
-0.238843, -0.2251971, -2.503018, 1, 1, 1, 1, 1,
-0.2372241, -0.8476298, -2.02279, 1, 1, 1, 1, 1,
-0.2357901, 0.4384663, -2.584433, 1, 1, 1, 1, 1,
-0.2345476, 0.1308344, -1.248784, 1, 1, 1, 1, 1,
-0.2298672, -0.3696343, -2.537748, 0, 0, 1, 1, 1,
-0.2266704, -1.723348, -4.732509, 1, 0, 0, 1, 1,
-0.2257688, 1.577417, -0.03035938, 1, 0, 0, 1, 1,
-0.2224946, 1.917403, -0.150201, 1, 0, 0, 1, 1,
-0.2212337, 0.7171305, 1.335401, 1, 0, 0, 1, 1,
-0.2166814, 1.112653, -0.09258837, 1, 0, 0, 1, 1,
-0.2152442, 0.7463804, 1.929607, 0, 0, 0, 1, 1,
-0.2147844, 0.2036859, -1.80235, 0, 0, 0, 1, 1,
-0.2139408, 0.3175847, 1.244007, 0, 0, 0, 1, 1,
-0.2139168, -1.198626, -3.425235, 0, 0, 0, 1, 1,
-0.2121123, -1.049486, -2.930274, 0, 0, 0, 1, 1,
-0.2098198, 1.061234, 0.1649495, 0, 0, 0, 1, 1,
-0.2088974, 0.7427136, 1.214923, 0, 0, 0, 1, 1,
-0.2034153, 1.655608, 1.487519, 1, 1, 1, 1, 1,
-0.2023882, 1.049064, 0.07443419, 1, 1, 1, 1, 1,
-0.2007146, 1.099624, -1.032792, 1, 1, 1, 1, 1,
-0.2003532, -0.2972151, -2.800493, 1, 1, 1, 1, 1,
-0.1959756, 1.207033, -0.2625273, 1, 1, 1, 1, 1,
-0.1951361, -0.9609926, -1.353285, 1, 1, 1, 1, 1,
-0.1950382, 0.8934005, -1.436125, 1, 1, 1, 1, 1,
-0.1927504, -0.3966233, -3.057797, 1, 1, 1, 1, 1,
-0.1887358, 1.838234, 1.255076, 1, 1, 1, 1, 1,
-0.1886989, -0.564765, -3.067034, 1, 1, 1, 1, 1,
-0.186032, 0.270466, -1.182845, 1, 1, 1, 1, 1,
-0.1851275, 0.764533, -0.2312761, 1, 1, 1, 1, 1,
-0.1780531, 1.659591, -0.8998821, 1, 1, 1, 1, 1,
-0.1757542, 0.9168124, -1.96106, 1, 1, 1, 1, 1,
-0.1753838, -2.229006, -2.532789, 1, 1, 1, 1, 1,
-0.1738943, -1.29932, -2.412092, 0, 0, 1, 1, 1,
-0.1734167, -0.615205, -2.431316, 1, 0, 0, 1, 1,
-0.169492, -1.465878, -5.465716, 1, 0, 0, 1, 1,
-0.1679367, -1.384012, -2.539649, 1, 0, 0, 1, 1,
-0.1663964, -0.2161092, -1.883834, 1, 0, 0, 1, 1,
-0.1618352, -0.1057081, -2.694818, 1, 0, 0, 1, 1,
-0.1614953, 0.3322951, -1.46177, 0, 0, 0, 1, 1,
-0.1614119, 2.21936, 0.6702185, 0, 0, 0, 1, 1,
-0.1542271, 1.136257, 0.07015103, 0, 0, 0, 1, 1,
-0.1504604, 1.117676, -0.03662405, 0, 0, 0, 1, 1,
-0.1471453, -0.259386, -1.436619, 0, 0, 0, 1, 1,
-0.1448085, -0.1035689, -1.540379, 0, 0, 0, 1, 1,
-0.1431293, -0.06580915, -1.678496, 0, 0, 0, 1, 1,
-0.1417439, -0.5776202, -3.511382, 1, 1, 1, 1, 1,
-0.140232, 0.8577414, -0.420053, 1, 1, 1, 1, 1,
-0.1356164, -0.01218112, -3.268527, 1, 1, 1, 1, 1,
-0.1341898, -0.4103113, -4.324299, 1, 1, 1, 1, 1,
-0.1326357, -0.4025642, -3.830056, 1, 1, 1, 1, 1,
-0.132471, -2.079768, -2.080723, 1, 1, 1, 1, 1,
-0.1272055, -1.384604, -2.09695, 1, 1, 1, 1, 1,
-0.1250312, 1.087491, 1.128614, 1, 1, 1, 1, 1,
-0.1236064, -1.288181, -3.131798, 1, 1, 1, 1, 1,
-0.121437, -1.105077, -2.100636, 1, 1, 1, 1, 1,
-0.1199717, 0.1960629, -0.4333317, 1, 1, 1, 1, 1,
-0.1154972, -0.2599791, -3.122649, 1, 1, 1, 1, 1,
-0.1150341, 0.3749563, -0.8382816, 1, 1, 1, 1, 1,
-0.1131774, 0.4879613, -0.4848554, 1, 1, 1, 1, 1,
-0.1121169, -0.5136901, -1.610642, 1, 1, 1, 1, 1,
-0.1113619, 1.395957, 0.7322151, 0, 0, 1, 1, 1,
-0.1083755, 0.1897766, 0.2424211, 1, 0, 0, 1, 1,
-0.1063614, -1.125804, -5.304395, 1, 0, 0, 1, 1,
-0.09939702, 0.08961891, -2.370713, 1, 0, 0, 1, 1,
-0.09687826, -0.5801998, -2.160165, 1, 0, 0, 1, 1,
-0.09575198, -0.512388, -3.919534, 1, 0, 0, 1, 1,
-0.09506153, -1.642738, -3.788899, 0, 0, 0, 1, 1,
-0.0914439, 1.187994, 0.8475901, 0, 0, 0, 1, 1,
-0.08877295, 0.6303787, -0.3090389, 0, 0, 0, 1, 1,
-0.08851044, -2.430053, -3.317564, 0, 0, 0, 1, 1,
-0.08629549, 0.7396053, 0.711715, 0, 0, 0, 1, 1,
-0.08619266, -0.4462498, -3.151795, 0, 0, 0, 1, 1,
-0.08068863, -0.03840641, -2.752366, 0, 0, 0, 1, 1,
-0.07934432, 1.043812, -0.4859911, 1, 1, 1, 1, 1,
-0.07864972, -1.016235, -3.039633, 1, 1, 1, 1, 1,
-0.07133731, 0.7614709, -0.155841, 1, 1, 1, 1, 1,
-0.0669943, 0.7549061, -0.6540079, 1, 1, 1, 1, 1,
-0.06627845, -0.6774161, -1.489633, 1, 1, 1, 1, 1,
-0.06511164, -1.832011, -3.678146, 1, 1, 1, 1, 1,
-0.06451447, -1.094379, -4.021705, 1, 1, 1, 1, 1,
-0.06296349, 0.853416, -0.8092626, 1, 1, 1, 1, 1,
-0.06120009, 0.4770453, 1.38476, 1, 1, 1, 1, 1,
-0.05954104, 2.307009, 0.5512722, 1, 1, 1, 1, 1,
-0.0592781, 1.46834, 0.1657658, 1, 1, 1, 1, 1,
-0.0585059, 0.307999, -0.8336625, 1, 1, 1, 1, 1,
-0.05661959, -0.2293385, -1.674401, 1, 1, 1, 1, 1,
-0.05545019, -1.206398, -2.142727, 1, 1, 1, 1, 1,
-0.05403213, 0.3126081, -1.579388, 1, 1, 1, 1, 1,
-0.05324128, -2.580347, -2.403471, 0, 0, 1, 1, 1,
-0.04975266, 0.1631485, 1.371095, 1, 0, 0, 1, 1,
-0.0456321, 0.9307433, -1.436821, 1, 0, 0, 1, 1,
-0.04416498, -0.1788453, -1.642904, 1, 0, 0, 1, 1,
-0.04060861, -0.6689201, -3.743478, 1, 0, 0, 1, 1,
-0.03744372, 0.8174319, 1.779312, 1, 0, 0, 1, 1,
-0.03498858, -0.06040481, -3.211254, 0, 0, 0, 1, 1,
-0.03311089, -0.302809, -1.765736, 0, 0, 0, 1, 1,
-0.03171039, 0.9839432, -1.110052, 0, 0, 0, 1, 1,
-0.02907673, -1.924449, -2.598787, 0, 0, 0, 1, 1,
-0.02345877, 1.050553, -0.7902892, 0, 0, 0, 1, 1,
-0.02308576, 0.1098962, -2.569959, 0, 0, 0, 1, 1,
-0.01758647, 0.556843, 1.51641, 0, 0, 0, 1, 1,
-0.009118128, 1.867105, -0.9776184, 1, 1, 1, 1, 1,
-0.00625365, -1.450604, -2.854554, 1, 1, 1, 1, 1,
0.0008526435, 0.4037482, 0.5794949, 1, 1, 1, 1, 1,
0.00365287, 0.04818472, 1.06698, 1, 1, 1, 1, 1,
0.006068191, 0.4007896, 1.289713, 1, 1, 1, 1, 1,
0.006351724, -0.1542569, 5.48449, 1, 1, 1, 1, 1,
0.009876363, -1.374288, 2.826765, 1, 1, 1, 1, 1,
0.01174983, 0.3244836, -0.3617379, 1, 1, 1, 1, 1,
0.01361284, 1.612113, -0.663987, 1, 1, 1, 1, 1,
0.014201, -0.4794255, 5.126902, 1, 1, 1, 1, 1,
0.01609247, 1.502316, -0.2952908, 1, 1, 1, 1, 1,
0.01652466, -0.2194343, 4.733397, 1, 1, 1, 1, 1,
0.01704507, 0.3452575, 0.9138581, 1, 1, 1, 1, 1,
0.02042689, -0.3241355, 2.643351, 1, 1, 1, 1, 1,
0.02168079, -1.86873, 3.200503, 1, 1, 1, 1, 1,
0.02693374, -0.3422824, 2.061512, 0, 0, 1, 1, 1,
0.02735976, -0.924714, 2.148356, 1, 0, 0, 1, 1,
0.02807593, 0.4308939, -0.727478, 1, 0, 0, 1, 1,
0.0315155, 0.2756675, -0.3195363, 1, 0, 0, 1, 1,
0.03306336, 1.127983, -1.206959, 1, 0, 0, 1, 1,
0.03308209, 0.2267626, 0.5421505, 1, 0, 0, 1, 1,
0.03360797, -2.571521, 2.814558, 0, 0, 0, 1, 1,
0.03888235, 0.3707367, 1.25143, 0, 0, 0, 1, 1,
0.04009716, 0.5528439, -0.2217859, 0, 0, 0, 1, 1,
0.04099954, -0.02306285, 1.725989, 0, 0, 0, 1, 1,
0.0497747, 0.04423866, 0.3026476, 0, 0, 0, 1, 1,
0.05437403, -0.6769567, 4.491945, 0, 0, 0, 1, 1,
0.05449167, 1.674996, 1.622429, 0, 0, 0, 1, 1,
0.06053597, -0.1476992, 2.803905, 1, 1, 1, 1, 1,
0.06217258, 0.2954184, -0.4528678, 1, 1, 1, 1, 1,
0.06237634, 0.9845784, 1.575812, 1, 1, 1, 1, 1,
0.06495325, 0.025253, 1.290429, 1, 1, 1, 1, 1,
0.06622701, 0.7706224, 0.5861583, 1, 1, 1, 1, 1,
0.07145688, -0.0459074, 0.891237, 1, 1, 1, 1, 1,
0.07638692, -0.5514715, 2.084246, 1, 1, 1, 1, 1,
0.07846556, 0.4344246, 1.275167, 1, 1, 1, 1, 1,
0.08368409, 1.646444, -0.7175549, 1, 1, 1, 1, 1,
0.08728229, -0.5298732, 3.825776, 1, 1, 1, 1, 1,
0.0913157, 0.976281, 0.1818471, 1, 1, 1, 1, 1,
0.09139129, -1.568368, 3.130131, 1, 1, 1, 1, 1,
0.0922453, -0.7172461, 3.304382, 1, 1, 1, 1, 1,
0.09427713, -0.8664867, 3.119534, 1, 1, 1, 1, 1,
0.1021269, 1.529366, -0.5537084, 1, 1, 1, 1, 1,
0.104942, 0.1032889, 2.413122, 0, 0, 1, 1, 1,
0.1056941, -1.1703, 2.447975, 1, 0, 0, 1, 1,
0.1068882, -0.1297479, 4.803776, 1, 0, 0, 1, 1,
0.1071138, -1.576653, 3.021799, 1, 0, 0, 1, 1,
0.1086685, 0.8215623, -0.08397169, 1, 0, 0, 1, 1,
0.1105132, 0.841111, 1.691203, 1, 0, 0, 1, 1,
0.110848, -0.07449409, 1.265998, 0, 0, 0, 1, 1,
0.1216373, 0.8117732, -0.90761, 0, 0, 0, 1, 1,
0.1217743, -0.3741749, 5.30354, 0, 0, 0, 1, 1,
0.1236756, -0.6013914, 2.607221, 0, 0, 0, 1, 1,
0.1324812, -0.3085085, 3.278463, 0, 0, 0, 1, 1,
0.1343075, -2.515311, 3.058861, 0, 0, 0, 1, 1,
0.1345873, -0.6601495, 3.097706, 0, 0, 0, 1, 1,
0.1346645, 0.7060857, 1.951469, 1, 1, 1, 1, 1,
0.1352255, 2.109295, -0.49545, 1, 1, 1, 1, 1,
0.1356187, 0.3834943, 1.11606, 1, 1, 1, 1, 1,
0.1389007, 1.711384, 2.280159, 1, 1, 1, 1, 1,
0.1449527, -0.1424709, 2.891171, 1, 1, 1, 1, 1,
0.1461383, 0.2554766, 1.780967, 1, 1, 1, 1, 1,
0.1492406, -0.7212843, 2.857927, 1, 1, 1, 1, 1,
0.1508783, 0.6691667, -1.695876, 1, 1, 1, 1, 1,
0.1543187, -0.3453563, 0.9506133, 1, 1, 1, 1, 1,
0.1560964, -1.23814, 1.793222, 1, 1, 1, 1, 1,
0.1567431, -0.3204179, 3.241282, 1, 1, 1, 1, 1,
0.1587085, 1.116536, 0.4490095, 1, 1, 1, 1, 1,
0.1587296, 0.7076085, -1.025039, 1, 1, 1, 1, 1,
0.1588475, 0.4872529, 1.07184, 1, 1, 1, 1, 1,
0.1593859, 0.5571491, 2.193121, 1, 1, 1, 1, 1,
0.1604123, 0.6226812, -0.5653451, 0, 0, 1, 1, 1,
0.1679291, -0.5915435, 1.482617, 1, 0, 0, 1, 1,
0.1696078, 0.3630957, -0.5798637, 1, 0, 0, 1, 1,
0.1707503, -0.4516468, 2.649347, 1, 0, 0, 1, 1,
0.1755275, 0.368896, 0.3616495, 1, 0, 0, 1, 1,
0.1759793, 0.1567325, 0.5193532, 1, 0, 0, 1, 1,
0.1779341, -0.1928742, 3.121353, 0, 0, 0, 1, 1,
0.1819456, -0.6629667, 3.651953, 0, 0, 0, 1, 1,
0.1825585, -1.158025, 3.947339, 0, 0, 0, 1, 1,
0.1886419, -0.8148102, 2.876376, 0, 0, 0, 1, 1,
0.1914873, -0.2993664, 3.095754, 0, 0, 0, 1, 1,
0.1943931, 0.6574667, 0.4445418, 0, 0, 0, 1, 1,
0.1949006, -0.4348881, 3.981364, 0, 0, 0, 1, 1,
0.1952317, -1.421219, 2.470259, 1, 1, 1, 1, 1,
0.1985389, -0.4268612, 2.369269, 1, 1, 1, 1, 1,
0.1990729, -0.468271, 2.125516, 1, 1, 1, 1, 1,
0.2030239, 1.802688, -0.3647638, 1, 1, 1, 1, 1,
0.2075913, 0.3937649, 1.800636, 1, 1, 1, 1, 1,
0.2087719, -0.3609663, 1.321286, 1, 1, 1, 1, 1,
0.209121, -0.4086378, 1.368354, 1, 1, 1, 1, 1,
0.2095287, 0.128485, -0.04640101, 1, 1, 1, 1, 1,
0.2105112, 0.001274113, 2.705241, 1, 1, 1, 1, 1,
0.2107105, -1.33932, 3.464159, 1, 1, 1, 1, 1,
0.2114123, 0.2395344, 0.7488935, 1, 1, 1, 1, 1,
0.2120118, -1.460516, 2.444402, 1, 1, 1, 1, 1,
0.2151569, -0.540332, 3.378832, 1, 1, 1, 1, 1,
0.2170286, -0.1038401, 0.5647299, 1, 1, 1, 1, 1,
0.2199969, -0.4473149, 2.438754, 1, 1, 1, 1, 1,
0.2211724, 0.6031812, 2.420135, 0, 0, 1, 1, 1,
0.2212358, -0.1530814, 1.808223, 1, 0, 0, 1, 1,
0.2227236, 0.06817018, 0.72609, 1, 0, 0, 1, 1,
0.2267705, 0.7993519, 2.041251, 1, 0, 0, 1, 1,
0.2287997, 0.6303619, -0.1680318, 1, 0, 0, 1, 1,
0.2382107, 0.7963692, -0.4270044, 1, 0, 0, 1, 1,
0.2397705, 1.058584, -1.107693, 0, 0, 0, 1, 1,
0.2473616, 0.8215069, 2.098614, 0, 0, 0, 1, 1,
0.2508811, 0.1078906, 0.512976, 0, 0, 0, 1, 1,
0.2509238, 1.547467, -0.8239946, 0, 0, 0, 1, 1,
0.2597755, -0.335846, 1.684802, 0, 0, 0, 1, 1,
0.2664446, 0.05595072, -1.833717, 0, 0, 0, 1, 1,
0.2666701, 0.06065445, 4.180639, 0, 0, 0, 1, 1,
0.2707473, 0.7575172, 0.9961893, 1, 1, 1, 1, 1,
0.2745087, 0.1029459, 1.709475, 1, 1, 1, 1, 1,
0.2769951, -0.5812667, 2.324657, 1, 1, 1, 1, 1,
0.2786442, 0.2731358, 1.288582, 1, 1, 1, 1, 1,
0.2797381, -0.7985086, 2.598857, 1, 1, 1, 1, 1,
0.2807921, -1.16394, 4.921929, 1, 1, 1, 1, 1,
0.2816906, -0.6931391, 3.756174, 1, 1, 1, 1, 1,
0.282432, 0.4545494, 1.211039, 1, 1, 1, 1, 1,
0.2847295, 0.4060512, -0.2749281, 1, 1, 1, 1, 1,
0.2902421, 0.2045718, 2.210899, 1, 1, 1, 1, 1,
0.2917503, -2.071979, 2.102133, 1, 1, 1, 1, 1,
0.292202, 0.9782584, -0.3565242, 1, 1, 1, 1, 1,
0.2984632, 1.177108, 0.6891735, 1, 1, 1, 1, 1,
0.3013243, 0.5272257, 1.548931, 1, 1, 1, 1, 1,
0.303941, 0.6138976, -0.0893367, 1, 1, 1, 1, 1,
0.3058341, 0.7468181, 0.1936601, 0, 0, 1, 1, 1,
0.3092243, 1.570284, 0.06053689, 1, 0, 0, 1, 1,
0.3100385, -2.404093, 5.38587, 1, 0, 0, 1, 1,
0.3127564, 0.4727693, 0.4419579, 1, 0, 0, 1, 1,
0.3132029, 1.165278, 2.651379, 1, 0, 0, 1, 1,
0.3172548, -0.3788162, 1.631945, 1, 0, 0, 1, 1,
0.3188703, -1.115649, 1.709351, 0, 0, 0, 1, 1,
0.3190069, 0.205539, 2.943753, 0, 0, 0, 1, 1,
0.3221777, 0.6289924, -0.4135328, 0, 0, 0, 1, 1,
0.3351627, 0.8678464, 2.687334, 0, 0, 0, 1, 1,
0.3441883, -0.9418586, 2.535187, 0, 0, 0, 1, 1,
0.3446887, -0.7336147, 3.136022, 0, 0, 0, 1, 1,
0.3467996, 0.210989, 1.432397, 0, 0, 0, 1, 1,
0.3473302, 1.014796, 0.9657413, 1, 1, 1, 1, 1,
0.3586195, -1.067572, 3.264279, 1, 1, 1, 1, 1,
0.3599146, 0.3513705, 0.7716677, 1, 1, 1, 1, 1,
0.3632067, 0.3876487, 1.64754, 1, 1, 1, 1, 1,
0.3647261, 0.001827191, 2.680935, 1, 1, 1, 1, 1,
0.3651166, 0.1159547, -0.8368163, 1, 1, 1, 1, 1,
0.366693, -1.962484, 4.234928, 1, 1, 1, 1, 1,
0.3691314, -0.6555156, 2.393538, 1, 1, 1, 1, 1,
0.3759501, 1.099807, -0.3187269, 1, 1, 1, 1, 1,
0.376538, -0.1685714, 2.35927, 1, 1, 1, 1, 1,
0.3800616, -1.224383, 1.527998, 1, 1, 1, 1, 1,
0.3813497, -0.7206711, 2.545745, 1, 1, 1, 1, 1,
0.3815953, -1.162702, 1.720419, 1, 1, 1, 1, 1,
0.3822334, 1.451257, 0.4018615, 1, 1, 1, 1, 1,
0.3853517, 1.232212, -0.9351544, 1, 1, 1, 1, 1,
0.3878197, 0.9611844, 1.130848, 0, 0, 1, 1, 1,
0.3887395, 0.2176249, 0.8719889, 1, 0, 0, 1, 1,
0.3909185, -0.08186374, 1.733336, 1, 0, 0, 1, 1,
0.3969173, -0.0485705, 1.931205, 1, 0, 0, 1, 1,
0.3991987, -1.316273, 3.426318, 1, 0, 0, 1, 1,
0.4043345, -1.451827, 2.884811, 1, 0, 0, 1, 1,
0.4089188, -0.4793483, 2.595615, 0, 0, 0, 1, 1,
0.4123657, 1.745843, -1.294243, 0, 0, 0, 1, 1,
0.4141438, 1.660189, -0.3215159, 0, 0, 0, 1, 1,
0.4200616, -0.3727774, 0.6349363, 0, 0, 0, 1, 1,
0.4285037, -0.3587148, 3.251406, 0, 0, 0, 1, 1,
0.4304473, -0.9213651, 1.118833, 0, 0, 0, 1, 1,
0.4315875, -0.3840314, 4.158381, 0, 0, 0, 1, 1,
0.4317311, -0.487059, 2.781476, 1, 1, 1, 1, 1,
0.4371951, 0.3746045, 2.050251, 1, 1, 1, 1, 1,
0.4384045, 0.9913586, 0.3562234, 1, 1, 1, 1, 1,
0.4402218, -0.588725, 2.073083, 1, 1, 1, 1, 1,
0.4412778, 0.4412064, 2.231972, 1, 1, 1, 1, 1,
0.4433819, -0.2777484, 2.786285, 1, 1, 1, 1, 1,
0.4445278, -0.4936045, 1.239719, 1, 1, 1, 1, 1,
0.4453527, 1.347107, 1.495402, 1, 1, 1, 1, 1,
0.4481795, 2.545042, 1.507012, 1, 1, 1, 1, 1,
0.4482175, 1.034948, 0.2747557, 1, 1, 1, 1, 1,
0.4578742, 0.4755036, 0.1368351, 1, 1, 1, 1, 1,
0.4653693, 0.1927364, 3.0005, 1, 1, 1, 1, 1,
0.472554, 0.2523766, -0.4419037, 1, 1, 1, 1, 1,
0.4754048, 0.9679885, 1.376398, 1, 1, 1, 1, 1,
0.4770723, 0.4822612, 0.2741395, 1, 1, 1, 1, 1,
0.4786396, -0.728399, 1.216271, 0, 0, 1, 1, 1,
0.4794397, 0.5047956, 1.739627, 1, 0, 0, 1, 1,
0.4803158, 0.05145789, 0.07781523, 1, 0, 0, 1, 1,
0.4825651, -2.00358, 3.766176, 1, 0, 0, 1, 1,
0.4848328, 0.7085061, 1.029568, 1, 0, 0, 1, 1,
0.4890574, 0.7170263, 1.641525, 1, 0, 0, 1, 1,
0.4907404, -0.7495888, 3.762933, 0, 0, 0, 1, 1,
0.4974318, 0.219192, 1.909869, 0, 0, 0, 1, 1,
0.500391, 0.5066975, 1.182484, 0, 0, 0, 1, 1,
0.5012013, 1.866824, 0.341847, 0, 0, 0, 1, 1,
0.5039166, 1.118436, -1.254562, 0, 0, 0, 1, 1,
0.5057832, -1.3427, 3.067374, 0, 0, 0, 1, 1,
0.5076963, -0.2151811, 3.231243, 0, 0, 0, 1, 1,
0.5081317, -0.5060821, 2.578301, 1, 1, 1, 1, 1,
0.5107085, -0.3746371, 2.686384, 1, 1, 1, 1, 1,
0.5195255, -1.220424, 3.119985, 1, 1, 1, 1, 1,
0.5270333, -1.725712, 3.000159, 1, 1, 1, 1, 1,
0.5320613, -0.2617199, 1.585332, 1, 1, 1, 1, 1,
0.5340798, 0.01483789, 1.133013, 1, 1, 1, 1, 1,
0.5354455, -1.446541, 1.432352, 1, 1, 1, 1, 1,
0.5367195, 1.473907, 2.348433, 1, 1, 1, 1, 1,
0.5391983, -0.2648128, 2.76575, 1, 1, 1, 1, 1,
0.5401874, -1.011775, 2.651308, 1, 1, 1, 1, 1,
0.5428186, -0.09605137, 1.743498, 1, 1, 1, 1, 1,
0.5472732, -2.050558, 1.798648, 1, 1, 1, 1, 1,
0.5476803, -0.8111129, 2.509594, 1, 1, 1, 1, 1,
0.5562333, -0.7073559, 3.281039, 1, 1, 1, 1, 1,
0.5577772, 0.9977991, -1.044505, 1, 1, 1, 1, 1,
0.559064, -0.1020057, 1.498348, 0, 0, 1, 1, 1,
0.5638206, 0.0818731, 1.407436, 1, 0, 0, 1, 1,
0.5672407, 0.01030429, 1.803787, 1, 0, 0, 1, 1,
0.574396, -0.2966713, 1.311895, 1, 0, 0, 1, 1,
0.5755786, 0.7059232, 2.999763, 1, 0, 0, 1, 1,
0.5764369, -0.784066, 2.315832, 1, 0, 0, 1, 1,
0.5844264, -0.008919083, 1.234763, 0, 0, 0, 1, 1,
0.5847074, 0.8380889, -0.4297645, 0, 0, 0, 1, 1,
0.5871072, -1.142951, 3.011591, 0, 0, 0, 1, 1,
0.5905465, 0.03251081, 1.952741, 0, 0, 0, 1, 1,
0.5995185, 0.4850152, -0.2539725, 0, 0, 0, 1, 1,
0.6001886, -0.6104919, 3.667586, 0, 0, 0, 1, 1,
0.600848, -0.6282263, 2.556997, 0, 0, 0, 1, 1,
0.6026885, -0.3918851, 3.005878, 1, 1, 1, 1, 1,
0.6049506, 1.100708, 1.818488, 1, 1, 1, 1, 1,
0.6050525, -0.4608067, 2.169285, 1, 1, 1, 1, 1,
0.6053805, 0.4500337, -0.5455865, 1, 1, 1, 1, 1,
0.6102892, -0.4005322, 2.380207, 1, 1, 1, 1, 1,
0.6123314, 0.6823227, 0.1572489, 1, 1, 1, 1, 1,
0.6197837, -1.454185, 3.330528, 1, 1, 1, 1, 1,
0.6207768, -0.2894127, 2.474154, 1, 1, 1, 1, 1,
0.621403, -0.4045892, 0.8255016, 1, 1, 1, 1, 1,
0.6254981, -1.169962, 4.566395, 1, 1, 1, 1, 1,
0.6260121, 0.3988141, 0.1258682, 1, 1, 1, 1, 1,
0.6296842, -0.4236469, 3.369266, 1, 1, 1, 1, 1,
0.6332309, -0.3200067, 2.2924, 1, 1, 1, 1, 1,
0.6332775, 1.550199, 0.0393455, 1, 1, 1, 1, 1,
0.6378019, -0.9359356, 2.24567, 1, 1, 1, 1, 1,
0.6454936, 0.9871625, -0.8756066, 0, 0, 1, 1, 1,
0.6476129, 1.19976, -1.537738, 1, 0, 0, 1, 1,
0.6494214, -0.8875843, 0.4792765, 1, 0, 0, 1, 1,
0.6500931, -1.810807, 3.13549, 1, 0, 0, 1, 1,
0.6514086, -0.402301, 1.266504, 1, 0, 0, 1, 1,
0.6552533, -0.7349334, 0.6983223, 1, 0, 0, 1, 1,
0.6564863, -0.2482476, 2.63894, 0, 0, 0, 1, 1,
0.6614709, 0.5249265, 2.312421, 0, 0, 0, 1, 1,
0.6618561, -1.067764, 1.337864, 0, 0, 0, 1, 1,
0.6637945, 0.2466258, 1.165696, 0, 0, 0, 1, 1,
0.6639831, -0.6081088, 2.081938, 0, 0, 0, 1, 1,
0.6647319, -0.7398884, 3.489459, 0, 0, 0, 1, 1,
0.6668515, 0.1045555, 2.354203, 0, 0, 0, 1, 1,
0.6695682, 0.02502948, 1.782795, 1, 1, 1, 1, 1,
0.6706134, 1.041047, 1.009973, 1, 1, 1, 1, 1,
0.671478, 0.9108014, 0.4159696, 1, 1, 1, 1, 1,
0.6903211, -1.080103, 3.303708, 1, 1, 1, 1, 1,
0.6908344, 0.306811, -0.1630539, 1, 1, 1, 1, 1,
0.692863, -0.18133, 2.490146, 1, 1, 1, 1, 1,
0.6976525, 0.8672262, 1.139523, 1, 1, 1, 1, 1,
0.6991277, -1.698126, 2.910145, 1, 1, 1, 1, 1,
0.7034084, -0.09235077, 2.057182, 1, 1, 1, 1, 1,
0.707694, 0.1760001, 1.523328, 1, 1, 1, 1, 1,
0.7151526, -0.1886368, 3.236103, 1, 1, 1, 1, 1,
0.7172828, -0.342803, 3.101753, 1, 1, 1, 1, 1,
0.7183084, -0.1994415, 1.972048, 1, 1, 1, 1, 1,
0.7243773, -1.681582, 0.8705983, 1, 1, 1, 1, 1,
0.7374234, 0.9827385, 2.392429, 1, 1, 1, 1, 1,
0.7376059, 0.8079652, -0.5427982, 0, 0, 1, 1, 1,
0.7376441, -0.05456434, 3.405345, 1, 0, 0, 1, 1,
0.7420043, 0.6569244, 0.8349342, 1, 0, 0, 1, 1,
0.7502792, 0.6172752, 0.5377897, 1, 0, 0, 1, 1,
0.7583471, -1.50463, 3.410382, 1, 0, 0, 1, 1,
0.7619076, -0.2956412, 1.674554, 1, 0, 0, 1, 1,
0.7652733, -0.995984, 3.629298, 0, 0, 0, 1, 1,
0.7707833, -0.7197424, 2.313377, 0, 0, 0, 1, 1,
0.7733554, -1.198973, 3.465643, 0, 0, 0, 1, 1,
0.7829483, -1.321678, 1.102132, 0, 0, 0, 1, 1,
0.8027059, -0.07341687, 1.501324, 0, 0, 0, 1, 1,
0.8081615, 0.9721885, 1.033774, 0, 0, 0, 1, 1,
0.8082097, 0.5175425, 2.359022, 0, 0, 0, 1, 1,
0.8113977, -0.7558209, 3.616425, 1, 1, 1, 1, 1,
0.8134063, -0.4714423, 2.546179, 1, 1, 1, 1, 1,
0.814686, -0.2457832, 2.487096, 1, 1, 1, 1, 1,
0.8160713, 0.4967845, -0.325848, 1, 1, 1, 1, 1,
0.8237293, 0.8868617, 0.2569329, 1, 1, 1, 1, 1,
0.8296934, -1.684881, 2.335178, 1, 1, 1, 1, 1,
0.8299612, -0.0256301, 1.958966, 1, 1, 1, 1, 1,
0.8314704, 0.8931893, -1.455573, 1, 1, 1, 1, 1,
0.8383552, 0.0767005, 3.391063, 1, 1, 1, 1, 1,
0.8443788, -1.041548, 1.755409, 1, 1, 1, 1, 1,
0.8485489, -0.3856205, 1.089009, 1, 1, 1, 1, 1,
0.8601998, -0.02862759, 1.236965, 1, 1, 1, 1, 1,
0.8619131, 0.06352524, 2.002138, 1, 1, 1, 1, 1,
0.8658558, -0.3490579, 2.44393, 1, 1, 1, 1, 1,
0.8725115, 1.111618, 0.3791696, 1, 1, 1, 1, 1,
0.8748055, -1.018135, 3.18015, 0, 0, 1, 1, 1,
0.87782, 0.9485569, -0.5488981, 1, 0, 0, 1, 1,
0.8838168, 0.1961054, 3.746301, 1, 0, 0, 1, 1,
0.8948802, 0.6737234, 0.6269265, 1, 0, 0, 1, 1,
0.8996152, 2.544927, 1.755932, 1, 0, 0, 1, 1,
0.900427, -0.5347473, 1.11929, 1, 0, 0, 1, 1,
0.902801, 1.253519, 0.5178639, 0, 0, 0, 1, 1,
0.9050642, -1.278324, 3.260771, 0, 0, 0, 1, 1,
0.9079137, 0.8036487, 1.532881, 0, 0, 0, 1, 1,
0.908203, 1.579708, 0.6727613, 0, 0, 0, 1, 1,
0.9113325, 0.6007527, -0.4616793, 0, 0, 0, 1, 1,
0.9168714, 0.7592243, 1.133229, 0, 0, 0, 1, 1,
0.9170551, 2.109121, -0.561947, 0, 0, 0, 1, 1,
0.9203646, 0.3774745, -0.2932531, 1, 1, 1, 1, 1,
0.9310466, 0.1031221, 3.417897, 1, 1, 1, 1, 1,
0.9329911, -0.5060626, 2.476872, 1, 1, 1, 1, 1,
0.9353307, 1.469052, 0.6139411, 1, 1, 1, 1, 1,
0.9406134, 0.2148545, -0.1683118, 1, 1, 1, 1, 1,
0.9484702, 0.03521901, 0.03438426, 1, 1, 1, 1, 1,
0.9491512, 0.09598849, 1.140082, 1, 1, 1, 1, 1,
0.9493018, -0.1649464, 1.867593, 1, 1, 1, 1, 1,
0.9496744, 0.8501394, -0.4113173, 1, 1, 1, 1, 1,
0.9506169, 0.6412523, 0.9923465, 1, 1, 1, 1, 1,
0.9513741, -0.8027701, 2.863549, 1, 1, 1, 1, 1,
0.9580892, 0.03852129, 3.105712, 1, 1, 1, 1, 1,
0.9669119, -1.402295, 0.4780785, 1, 1, 1, 1, 1,
0.9679659, 1.230779, 2.76015, 1, 1, 1, 1, 1,
0.9736353, -0.353038, 3.025969, 1, 1, 1, 1, 1,
0.9834437, -1.126917, 1.72191, 0, 0, 1, 1, 1,
0.9956933, 0.2770534, 1.743998, 1, 0, 0, 1, 1,
0.997662, -0.1742555, 1.551335, 1, 0, 0, 1, 1,
1.010523, -0.4163969, 1.512389, 1, 0, 0, 1, 1,
1.023506, 1.323413, 0.05900681, 1, 0, 0, 1, 1,
1.029971, -0.21131, 0.9117565, 1, 0, 0, 1, 1,
1.031813, -1.076407, -0.3265701, 0, 0, 0, 1, 1,
1.034387, -0.6856513, 1.290137, 0, 0, 0, 1, 1,
1.037407, 0.8233291, 1.729993, 0, 0, 0, 1, 1,
1.03942, 0.5813674, -0.2813466, 0, 0, 0, 1, 1,
1.042978, 1.089047, 0.4536921, 0, 0, 0, 1, 1,
1.046006, -1.102061, 1.111046, 0, 0, 0, 1, 1,
1.051218, -0.5441991, 2.072324, 0, 0, 0, 1, 1,
1.056626, -0.2618229, 2.487475, 1, 1, 1, 1, 1,
1.060517, 0.724583, -0.3800925, 1, 1, 1, 1, 1,
1.061867, -0.1470359, 1.310625, 1, 1, 1, 1, 1,
1.062123, -1.381187, 1.873685, 1, 1, 1, 1, 1,
1.062551, 0.4683758, 0.7411186, 1, 1, 1, 1, 1,
1.063506, -0.2510407, 2.566695, 1, 1, 1, 1, 1,
1.066069, -1.149039, 3.970275, 1, 1, 1, 1, 1,
1.068165, -0.9641373, 1.237237, 1, 1, 1, 1, 1,
1.070396, -0.7423885, 2.751542, 1, 1, 1, 1, 1,
1.075504, 1.120744, -0.872318, 1, 1, 1, 1, 1,
1.077562, -0.9170939, 1.10047, 1, 1, 1, 1, 1,
1.080221, 1.144362, 0.4582372, 1, 1, 1, 1, 1,
1.083002, -0.7368953, 1.821616, 1, 1, 1, 1, 1,
1.083497, -1.439873, 2.848866, 1, 1, 1, 1, 1,
1.085203, -2.281134, 3.083687, 1, 1, 1, 1, 1,
1.086576, 0.1491279, 2.442675, 0, 0, 1, 1, 1,
1.090814, 1.233835, -0.9437054, 1, 0, 0, 1, 1,
1.092014, -1.832846, 3.543152, 1, 0, 0, 1, 1,
1.114108, -1.276507, 3.332658, 1, 0, 0, 1, 1,
1.115446, -0.8493884, 3.004235, 1, 0, 0, 1, 1,
1.117184, 0.550022, 0.9281744, 1, 0, 0, 1, 1,
1.119199, 1.087249, 0.4549074, 0, 0, 0, 1, 1,
1.120747, 1.529116, 1.918515, 0, 0, 0, 1, 1,
1.127862, 0.6877258, 2.518818, 0, 0, 0, 1, 1,
1.130795, -0.7471331, 4.147675, 0, 0, 0, 1, 1,
1.136524, 0.5056634, 1.35532, 0, 0, 0, 1, 1,
1.144921, 0.5348478, 1.145027, 0, 0, 0, 1, 1,
1.157566, 0.4343061, 0.7563499, 0, 0, 0, 1, 1,
1.161797, -0.2813644, 1.992486, 1, 1, 1, 1, 1,
1.162717, -2.038106, 2.155946, 1, 1, 1, 1, 1,
1.165488, -0.5138201, 3.835898, 1, 1, 1, 1, 1,
1.166802, 0.1174145, 2.023181, 1, 1, 1, 1, 1,
1.168208, 0.01738143, -0.2820832, 1, 1, 1, 1, 1,
1.173133, 0.4440224, 0.9922876, 1, 1, 1, 1, 1,
1.176898, -1.817921, 2.883496, 1, 1, 1, 1, 1,
1.180253, 0.02079188, 1.973257, 1, 1, 1, 1, 1,
1.188812, 1.069727, -0.7667655, 1, 1, 1, 1, 1,
1.199324, 0.675196, 0.1920744, 1, 1, 1, 1, 1,
1.201215, 3.243619, 0.04833622, 1, 1, 1, 1, 1,
1.20277, 2.437263, -0.9887569, 1, 1, 1, 1, 1,
1.204955, 2.078216, -0.3975042, 1, 1, 1, 1, 1,
1.209774, 0.04562015, 2.266862, 1, 1, 1, 1, 1,
1.212435, 1.783737, 1.328565, 1, 1, 1, 1, 1,
1.224133, -0.07287253, 1.73416, 0, 0, 1, 1, 1,
1.22777, 1.895055, 0.4842227, 1, 0, 0, 1, 1,
1.228993, 0.1382479, 3.070782, 1, 0, 0, 1, 1,
1.229819, 0.5450493, 1.173469, 1, 0, 0, 1, 1,
1.230122, -0.4146642, 2.917237, 1, 0, 0, 1, 1,
1.24332, -0.598488, 2.689686, 1, 0, 0, 1, 1,
1.246703, 0.524844, 1.030812, 0, 0, 0, 1, 1,
1.248091, 1.4216, 1.794304, 0, 0, 0, 1, 1,
1.250701, -0.4400583, 2.612013, 0, 0, 0, 1, 1,
1.255748, 0.7434889, 0.06563304, 0, 0, 0, 1, 1,
1.260134, 1.225989, 1.513934, 0, 0, 0, 1, 1,
1.265069, 0.2522399, 1.99016, 0, 0, 0, 1, 1,
1.26849, 0.5400692, 0.6416778, 0, 0, 0, 1, 1,
1.274162, 1.217821, 2.964155, 1, 1, 1, 1, 1,
1.285291, -0.07544928, 2.402562, 1, 1, 1, 1, 1,
1.314537, 0.6567733, 0.2043099, 1, 1, 1, 1, 1,
1.320375, 0.8509647, 1.420623, 1, 1, 1, 1, 1,
1.323936, -2.080176, 2.145607, 1, 1, 1, 1, 1,
1.324928, 2.777163, -0.5810312, 1, 1, 1, 1, 1,
1.326578, -0.3500839, 3.43069, 1, 1, 1, 1, 1,
1.329074, 0.5200505, 1.513344, 1, 1, 1, 1, 1,
1.334372, 0.5601531, 0.2116121, 1, 1, 1, 1, 1,
1.357567, -3.077071, 2.074422, 1, 1, 1, 1, 1,
1.358374, 1.103042, 0.3354495, 1, 1, 1, 1, 1,
1.365892, -0.5767145, 1.91789, 1, 1, 1, 1, 1,
1.374336, 0.9591197, 1.58365, 1, 1, 1, 1, 1,
1.383997, 1.944392, 0.1545089, 1, 1, 1, 1, 1,
1.38516, -0.1870252, 1.047985, 1, 1, 1, 1, 1,
1.403412, -0.3008309, 1.851354, 0, 0, 1, 1, 1,
1.418197, 0.8442312, -1.653017, 1, 0, 0, 1, 1,
1.418985, 3.184094, 0.1101543, 1, 0, 0, 1, 1,
1.419402, -0.3741821, 1.793882, 1, 0, 0, 1, 1,
1.423328, -1.196933, 2.249373, 1, 0, 0, 1, 1,
1.426349, -1.15162, 1.588406, 1, 0, 0, 1, 1,
1.435921, -1.019839, 2.786622, 0, 0, 0, 1, 1,
1.437217, 0.3708084, 1.130335, 0, 0, 0, 1, 1,
1.45459, -0.1878981, 1.519534, 0, 0, 0, 1, 1,
1.460927, 0.589255, 0.188712, 0, 0, 0, 1, 1,
1.466758, 0.2907404, 2.863322, 0, 0, 0, 1, 1,
1.485856, -1.622095, 3.249447, 0, 0, 0, 1, 1,
1.511626, 0.1274832, 0.496729, 0, 0, 0, 1, 1,
1.515627, 1.807135, 0.5316803, 1, 1, 1, 1, 1,
1.518293, 0.6369378, 0.9921713, 1, 1, 1, 1, 1,
1.521804, -0.009910492, 2.732932, 1, 1, 1, 1, 1,
1.522699, 0.3512078, 1.271577, 1, 1, 1, 1, 1,
1.52406, 0.4341849, 1.150606, 1, 1, 1, 1, 1,
1.541238, -1.947346, 1.66324, 1, 1, 1, 1, 1,
1.579234, -0.5547411, 0.03653653, 1, 1, 1, 1, 1,
1.584172, 0.757704, 1.919612, 1, 1, 1, 1, 1,
1.584218, -0.7762902, 2.570146, 1, 1, 1, 1, 1,
1.586628, -0.143935, 1.322497, 1, 1, 1, 1, 1,
1.588671, -0.9539583, 1.534166, 1, 1, 1, 1, 1,
1.613667, 1.586169, 0.4312064, 1, 1, 1, 1, 1,
1.615252, -1.467345, 2.002321, 1, 1, 1, 1, 1,
1.631762, 1.304307, 2.409353, 1, 1, 1, 1, 1,
1.652257, 0.9954853, 1.790333, 1, 1, 1, 1, 1,
1.661905, -1.074862, 2.173998, 0, 0, 1, 1, 1,
1.662423, 1.004123, 0.5272689, 1, 0, 0, 1, 1,
1.663795, -1.332758, 1.572329, 1, 0, 0, 1, 1,
1.684987, -0.9652376, 2.255, 1, 0, 0, 1, 1,
1.723963, -0.3277541, 0.005354589, 1, 0, 0, 1, 1,
1.736077, 1.092846, -0.4065457, 1, 0, 0, 1, 1,
1.738019, 0.4988472, 0.9456281, 0, 0, 0, 1, 1,
1.743938, 0.3434751, 2.093311, 0, 0, 0, 1, 1,
1.745684, 1.250648, 1.031739, 0, 0, 0, 1, 1,
1.749439, -0.8528624, 0.4449631, 0, 0, 0, 1, 1,
1.757431, -0.8039747, 3.388045, 0, 0, 0, 1, 1,
1.761025, 0.4682622, 1.000238, 0, 0, 0, 1, 1,
1.809293, -1.004706, 1.739007, 0, 0, 0, 1, 1,
1.830224, 0.3370645, 1.046627, 1, 1, 1, 1, 1,
1.835046, -1.524115, 2.343024, 1, 1, 1, 1, 1,
1.841149, -0.05337051, 1.45901, 1, 1, 1, 1, 1,
1.842718, -0.2599206, 1.106422, 1, 1, 1, 1, 1,
1.849052, 1.105235, 1.193339, 1, 1, 1, 1, 1,
1.892476, -1.009517, 1.033574, 1, 1, 1, 1, 1,
1.903327, -0.5694737, 3.426021, 1, 1, 1, 1, 1,
1.920513, -0.5597404, 2.987364, 1, 1, 1, 1, 1,
1.921134, -0.4036432, 2.409741, 1, 1, 1, 1, 1,
1.929382, -0.8350651, 2.500528, 1, 1, 1, 1, 1,
1.931468, 0.254949, 0.7973593, 1, 1, 1, 1, 1,
1.942513, -1.036657, 3.423831, 1, 1, 1, 1, 1,
1.956586, -0.05742664, 0.6894606, 1, 1, 1, 1, 1,
1.963515, -0.02755951, 1.48202, 1, 1, 1, 1, 1,
1.974987, 0.4628269, -0.1059105, 1, 1, 1, 1, 1,
1.992101, 0.06938476, 1.256132, 0, 0, 1, 1, 1,
1.99572, 1.122316, 1.130894, 1, 0, 0, 1, 1,
2.040738, 1.334054, 0.7489778, 1, 0, 0, 1, 1,
2.04096, -0.2612335, 1.742355, 1, 0, 0, 1, 1,
2.057029, 0.7248865, 1.547873, 1, 0, 0, 1, 1,
2.117108, -0.06388345, 0.8054532, 1, 0, 0, 1, 1,
2.121097, -0.6471696, 2.446399, 0, 0, 0, 1, 1,
2.124598, 0.06783019, 2.168142, 0, 0, 0, 1, 1,
2.148768, 1.072519, 2.500902, 0, 0, 0, 1, 1,
2.162038, 0.09917461, 2.1797, 0, 0, 0, 1, 1,
2.26164, -0.1666014, 0.8536348, 0, 0, 0, 1, 1,
2.273664, -0.3862487, 1.647191, 0, 0, 0, 1, 1,
2.32696, 0.4643172, 0.3704398, 0, 0, 0, 1, 1,
2.352007, -0.160921, 1.164825, 1, 1, 1, 1, 1,
2.401764, 0.3945475, -2.296578, 1, 1, 1, 1, 1,
2.476245, -1.272164, 0.9776863, 1, 1, 1, 1, 1,
2.57787, -0.6677142, 1.625178, 1, 1, 1, 1, 1,
2.675186, 0.09310877, 1.60816, 1, 1, 1, 1, 1,
3.266296, -1.255701, 1.670638, 1, 1, 1, 1, 1,
3.456912, 0.4662465, 0.4062316, 1, 1, 1, 1, 1
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
var radius = 9.906158;
var distance = 34.79496;
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
mvMatrix.translate( 0.2191303, -0.08327413, -0.009387016 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.79496);
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
