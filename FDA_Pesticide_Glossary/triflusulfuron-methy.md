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
-3.603124, 0.5462111, -3.225044, 1, 0, 0, 1,
-2.996315, 0.005484612, -2.404032, 1, 0.007843138, 0, 1,
-2.949426, 1.46422, -0.2538886, 1, 0.01176471, 0, 1,
-2.938678, -0.7073947, -3.063873, 1, 0.01960784, 0, 1,
-2.85002, 0.1096433, -0.1554214, 1, 0.02352941, 0, 1,
-2.70112, -0.68235, -0.5334786, 1, 0.03137255, 0, 1,
-2.690669, 0.9398476, -2.695554, 1, 0.03529412, 0, 1,
-2.437691, 0.335815, -1.725501, 1, 0.04313726, 0, 1,
-2.382849, 0.1378851, -1.609139, 1, 0.04705882, 0, 1,
-2.327484, -0.3089911, -3.288617, 1, 0.05490196, 0, 1,
-2.294603, -0.3948282, -0.9994439, 1, 0.05882353, 0, 1,
-2.276383, 1.106908, -1.944352, 1, 0.06666667, 0, 1,
-2.254531, -0.003563475, -1.441213, 1, 0.07058824, 0, 1,
-2.215072, 0.17992, -1.626908, 1, 0.07843138, 0, 1,
-2.207185, 0.8499857, -1.661115, 1, 0.08235294, 0, 1,
-2.204654, -0.3356855, -1.653339, 1, 0.09019608, 0, 1,
-2.19935, -0.1950739, -3.372195, 1, 0.09411765, 0, 1,
-2.177393, -1.090368, -2.181782, 1, 0.1019608, 0, 1,
-2.168443, 2.305456, -1.874394, 1, 0.1098039, 0, 1,
-2.147597, 0.3678903, 0.04312522, 1, 0.1137255, 0, 1,
-2.146383, 2.519824, -1.485084, 1, 0.1215686, 0, 1,
-2.11379, 0.1983762, 1.337435, 1, 0.1254902, 0, 1,
-2.057579, 1.058275, -0.04692874, 1, 0.1333333, 0, 1,
-2.030396, -0.3522985, -2.203441, 1, 0.1372549, 0, 1,
-2.014086, 0.05797374, -0.7890961, 1, 0.145098, 0, 1,
-1.995186, -1.723796, -0.5434664, 1, 0.1490196, 0, 1,
-1.989509, -0.03768063, -2.344667, 1, 0.1568628, 0, 1,
-1.981191, -0.5983509, -0.09401216, 1, 0.1607843, 0, 1,
-1.959767, 0.9195231, 0.06704918, 1, 0.1686275, 0, 1,
-1.921889, -0.2227948, 0.1883344, 1, 0.172549, 0, 1,
-1.911871, -0.5667624, -2.015561, 1, 0.1803922, 0, 1,
-1.903941, -1.114388, -1.824885, 1, 0.1843137, 0, 1,
-1.887563, -0.4817114, -1.246102, 1, 0.1921569, 0, 1,
-1.875356, 1.127993, -2.015242, 1, 0.1960784, 0, 1,
-1.862515, 0.2575444, 0.1066176, 1, 0.2039216, 0, 1,
-1.847033, 0.1350467, -0.9222618, 1, 0.2117647, 0, 1,
-1.842654, -1.157534, -2.45373, 1, 0.2156863, 0, 1,
-1.835766, 0.7791169, -2.757064, 1, 0.2235294, 0, 1,
-1.822996, 0.8957259, 1.1002, 1, 0.227451, 0, 1,
-1.809426, 0.2410049, -1.806103, 1, 0.2352941, 0, 1,
-1.789225, 0.506618, -1.306721, 1, 0.2392157, 0, 1,
-1.755776, 0.758737, -1.805704, 1, 0.2470588, 0, 1,
-1.738947, 0.8427473, -2.225881, 1, 0.2509804, 0, 1,
-1.724817, -0.9491012, -2.573549, 1, 0.2588235, 0, 1,
-1.71942, 0.6161722, -0.5987269, 1, 0.2627451, 0, 1,
-1.707715, -0.2333657, -2.79297, 1, 0.2705882, 0, 1,
-1.679226, 1.204881, -1.644174, 1, 0.2745098, 0, 1,
-1.670186, -0.4087695, -1.868609, 1, 0.282353, 0, 1,
-1.666673, -0.08471269, -1.433681, 1, 0.2862745, 0, 1,
-1.662688, 0.1046594, -1.926899, 1, 0.2941177, 0, 1,
-1.653901, -0.7626373, -1.996436, 1, 0.3019608, 0, 1,
-1.63817, -0.4093474, 0.02272416, 1, 0.3058824, 0, 1,
-1.637045, -2.185728, -2.803333, 1, 0.3137255, 0, 1,
-1.629204, -0.7255979, -2.372709, 1, 0.3176471, 0, 1,
-1.611539, 1.47165, 0.3622812, 1, 0.3254902, 0, 1,
-1.600933, 0.3935361, -0.8875028, 1, 0.3294118, 0, 1,
-1.598198, -1.10797, -3.355488, 1, 0.3372549, 0, 1,
-1.595485, 0.8584862, -0.9322643, 1, 0.3411765, 0, 1,
-1.590132, -0.2399792, -0.0866496, 1, 0.3490196, 0, 1,
-1.585535, 0.6488273, -1.741037, 1, 0.3529412, 0, 1,
-1.585133, 0.8760615, 0.2518785, 1, 0.3607843, 0, 1,
-1.581669, -0.6870113, -3.747433, 1, 0.3647059, 0, 1,
-1.58118, 0.07100166, -1.57459, 1, 0.372549, 0, 1,
-1.579535, 0.7272266, -0.03751722, 1, 0.3764706, 0, 1,
-1.574025, -0.6477221, -3.402924, 1, 0.3843137, 0, 1,
-1.567891, 1.859725, -0.7531611, 1, 0.3882353, 0, 1,
-1.566063, 1.534281, -0.892648, 1, 0.3960784, 0, 1,
-1.563798, -0.2026911, -0.2152297, 1, 0.4039216, 0, 1,
-1.556601, 2.503058, 0.8831196, 1, 0.4078431, 0, 1,
-1.548348, -0.1649487, -0.9115988, 1, 0.4156863, 0, 1,
-1.537542, -0.8831041, -0.9590557, 1, 0.4196078, 0, 1,
-1.533966, 0.3963114, 1.25569, 1, 0.427451, 0, 1,
-1.524366, -1.610835, -3.028663, 1, 0.4313726, 0, 1,
-1.519874, -1.210981, -2.092456, 1, 0.4392157, 0, 1,
-1.518959, -0.9054141, -1.728052, 1, 0.4431373, 0, 1,
-1.516226, -0.07025977, -1.566946, 1, 0.4509804, 0, 1,
-1.512409, 1.00266, -0.2493306, 1, 0.454902, 0, 1,
-1.507043, 0.1625164, -0.7481631, 1, 0.4627451, 0, 1,
-1.499902, 0.2008092, -1.085833, 1, 0.4666667, 0, 1,
-1.497334, -1.960547, -0.8353815, 1, 0.4745098, 0, 1,
-1.492845, 0.4129075, -2.784073, 1, 0.4784314, 0, 1,
-1.481229, 0.08400067, -2.209526, 1, 0.4862745, 0, 1,
-1.480907, -1.063594, -1.408359, 1, 0.4901961, 0, 1,
-1.478506, 0.6958151, -1.447245, 1, 0.4980392, 0, 1,
-1.47465, 0.8702773, -1.286323, 1, 0.5058824, 0, 1,
-1.466498, -1.698595, -1.733237, 1, 0.509804, 0, 1,
-1.463938, 0.202002, 1.021416, 1, 0.5176471, 0, 1,
-1.460753, 0.4654121, -0.8008718, 1, 0.5215687, 0, 1,
-1.45919, 0.7496922, -1.599985, 1, 0.5294118, 0, 1,
-1.456939, -0.1974314, -1.274937, 1, 0.5333334, 0, 1,
-1.425562, 1.916229, -2.964415, 1, 0.5411765, 0, 1,
-1.423429, -0.06071276, -2.86154, 1, 0.5450981, 0, 1,
-1.417432, -0.5189334, -2.255498, 1, 0.5529412, 0, 1,
-1.40451, 1.112257, -0.2401784, 1, 0.5568628, 0, 1,
-1.399515, -0.2825416, -1.985576, 1, 0.5647059, 0, 1,
-1.395939, -0.03080285, -2.475142, 1, 0.5686275, 0, 1,
-1.393319, 0.2219188, -0.1634659, 1, 0.5764706, 0, 1,
-1.386368, 0.4433342, 0.3750403, 1, 0.5803922, 0, 1,
-1.365963, -0.01435096, -2.092131, 1, 0.5882353, 0, 1,
-1.360492, -0.312324, -2.422236, 1, 0.5921569, 0, 1,
-1.358975, -2.731627, -3.00537, 1, 0.6, 0, 1,
-1.35802, -0.957072, -0.4798035, 1, 0.6078432, 0, 1,
-1.357391, 0.03123868, -1.853626, 1, 0.6117647, 0, 1,
-1.355425, 0.4431014, -2.111117, 1, 0.6196079, 0, 1,
-1.339301, -0.3170418, -3.368126, 1, 0.6235294, 0, 1,
-1.336165, -0.8762685, -1.679976, 1, 0.6313726, 0, 1,
-1.32571, 0.1976898, 0.2791966, 1, 0.6352941, 0, 1,
-1.320108, -0.09156881, 0.4106605, 1, 0.6431373, 0, 1,
-1.319406, 0.3719611, -0.2782177, 1, 0.6470588, 0, 1,
-1.319312, 0.354594, -0.2977938, 1, 0.654902, 0, 1,
-1.312291, 0.4983005, -3.62213, 1, 0.6588235, 0, 1,
-1.30712, -0.2800663, -1.020172, 1, 0.6666667, 0, 1,
-1.298665, -0.5904826, -1.929608, 1, 0.6705883, 0, 1,
-1.289983, -1.031087, -0.1483211, 1, 0.6784314, 0, 1,
-1.289656, 0.7575222, -1.422531, 1, 0.682353, 0, 1,
-1.288085, -0.9218791, -1.557144, 1, 0.6901961, 0, 1,
-1.284304, 1.255624, -1.209102, 1, 0.6941177, 0, 1,
-1.273782, -0.4048132, -0.9916677, 1, 0.7019608, 0, 1,
-1.260707, -0.09853189, -2.651697, 1, 0.7098039, 0, 1,
-1.257115, 1.026736, -0.9649116, 1, 0.7137255, 0, 1,
-1.242169, 0.2322495, 0.1966332, 1, 0.7215686, 0, 1,
-1.237283, -0.281371, -0.3942173, 1, 0.7254902, 0, 1,
-1.233791, 0.4712627, -3.13501, 1, 0.7333333, 0, 1,
-1.228026, -0.2855418, -1.477604, 1, 0.7372549, 0, 1,
-1.201808, -0.4050671, -3.410951, 1, 0.7450981, 0, 1,
-1.200721, 0.1872482, -2.253471, 1, 0.7490196, 0, 1,
-1.200521, -1.240894, -2.779553, 1, 0.7568628, 0, 1,
-1.194799, -0.167593, -3.726707, 1, 0.7607843, 0, 1,
-1.193455, -1.852871, -2.799517, 1, 0.7686275, 0, 1,
-1.187706, 1.506069, -2.597939, 1, 0.772549, 0, 1,
-1.185935, -1.133336, -3.888652, 1, 0.7803922, 0, 1,
-1.180882, 0.01829266, -2.041175, 1, 0.7843137, 0, 1,
-1.176207, 0.6881736, -0.665826, 1, 0.7921569, 0, 1,
-1.166691, 1.272133, -0.8433408, 1, 0.7960784, 0, 1,
-1.165205, 0.5434274, -0.7070873, 1, 0.8039216, 0, 1,
-1.164657, 1.569354, -0.4745742, 1, 0.8117647, 0, 1,
-1.157747, -0.7258351, -0.4536852, 1, 0.8156863, 0, 1,
-1.157202, -0.3565542, -2.548496, 1, 0.8235294, 0, 1,
-1.155185, -0.116428, -0.6203662, 1, 0.827451, 0, 1,
-1.154263, 0.8911686, -2.315951, 1, 0.8352941, 0, 1,
-1.151352, -0.8659239, -2.432239, 1, 0.8392157, 0, 1,
-1.149485, -1.55874, -1.559232, 1, 0.8470588, 0, 1,
-1.147581, 0.07766237, 0.02129388, 1, 0.8509804, 0, 1,
-1.12818, -0.1695332, -2.701052, 1, 0.8588235, 0, 1,
-1.127313, -1.55802, -4.426233, 1, 0.8627451, 0, 1,
-1.116899, -1.253514, -3.365835, 1, 0.8705882, 0, 1,
-1.113102, -0.3981426, -1.810908, 1, 0.8745098, 0, 1,
-1.112831, -0.6984703, -2.229227, 1, 0.8823529, 0, 1,
-1.108252, -0.09108938, -2.198432, 1, 0.8862745, 0, 1,
-1.094712, 0.9376237, -0.09012877, 1, 0.8941177, 0, 1,
-1.090831, 1.143001, -1.493907, 1, 0.8980392, 0, 1,
-1.08734, 2.030788, 1.104226, 1, 0.9058824, 0, 1,
-1.087134, 0.6562232, -1.952061, 1, 0.9137255, 0, 1,
-1.08222, -1.095531, -3.026101, 1, 0.9176471, 0, 1,
-1.081719, 0.7642986, -1.347772, 1, 0.9254902, 0, 1,
-1.079827, 0.2062854, -1.507781, 1, 0.9294118, 0, 1,
-1.079417, 1.228583, -2.552782, 1, 0.9372549, 0, 1,
-1.064009, -1.777908, -4.365365, 1, 0.9411765, 0, 1,
-1.062712, -0.2467212, -1.491958, 1, 0.9490196, 0, 1,
-1.059214, -0.1840816, -2.846183, 1, 0.9529412, 0, 1,
-1.050112, -1.744865, -3.35208, 1, 0.9607843, 0, 1,
-1.035957, 0.8212353, -0.002110775, 1, 0.9647059, 0, 1,
-1.031491, -1.082381, -2.550552, 1, 0.972549, 0, 1,
-1.025599, 1.069849, -1.587784, 1, 0.9764706, 0, 1,
-1.017224, 0.7000901, -1.261057, 1, 0.9843137, 0, 1,
-1.015749, -0.1234588, -1.889649, 1, 0.9882353, 0, 1,
-1.014502, -1.07947, -1.632426, 1, 0.9960784, 0, 1,
-0.9900068, -0.4411511, -0.5951937, 0.9960784, 1, 0, 1,
-0.9895535, -1.12854, -3.481482, 0.9921569, 1, 0, 1,
-0.9888158, 1.103831, -1.714986, 0.9843137, 1, 0, 1,
-0.9866751, 0.2442038, 0.7267531, 0.9803922, 1, 0, 1,
-0.9848328, -0.6307677, -2.034134, 0.972549, 1, 0, 1,
-0.971946, 0.9584603, -0.8422146, 0.9686275, 1, 0, 1,
-0.9709133, -0.8739511, -2.584151, 0.9607843, 1, 0, 1,
-0.9652076, 0.1669433, -0.4655678, 0.9568627, 1, 0, 1,
-0.9634241, -1.178999, -1.546075, 0.9490196, 1, 0, 1,
-0.9628164, 1.003835, -0.1148475, 0.945098, 1, 0, 1,
-0.9622086, 0.4192058, 0.4224014, 0.9372549, 1, 0, 1,
-0.9566064, 1.236021, -1.240011, 0.9333333, 1, 0, 1,
-0.9531895, -0.4354218, -0.09111405, 0.9254902, 1, 0, 1,
-0.9527279, 0.2871251, -0.5862443, 0.9215686, 1, 0, 1,
-0.9503571, -0.7761702, -3.228489, 0.9137255, 1, 0, 1,
-0.9468261, 0.2580962, -1.123871, 0.9098039, 1, 0, 1,
-0.9339179, -0.2772674, -2.248469, 0.9019608, 1, 0, 1,
-0.9283153, 0.8194939, -1.450697, 0.8941177, 1, 0, 1,
-0.9207202, -0.6675332, -0.9456559, 0.8901961, 1, 0, 1,
-0.9206049, -0.6208413, -1.936677, 0.8823529, 1, 0, 1,
-0.919063, -1.287071, -1.748593, 0.8784314, 1, 0, 1,
-0.9152924, 0.4012198, -1.368387, 0.8705882, 1, 0, 1,
-0.9106098, 0.4494902, -1.538424, 0.8666667, 1, 0, 1,
-0.9029805, -1.316881, -3.310019, 0.8588235, 1, 0, 1,
-0.9025073, -0.1144067, -0.1109545, 0.854902, 1, 0, 1,
-0.9024692, 2.012004, 1.98486, 0.8470588, 1, 0, 1,
-0.9011802, -2.017954, -3.031394, 0.8431373, 1, 0, 1,
-0.8965418, 0.1328285, -2.273701, 0.8352941, 1, 0, 1,
-0.8904189, 1.886909, -0.1865736, 0.8313726, 1, 0, 1,
-0.8887576, -1.259914, -2.245988, 0.8235294, 1, 0, 1,
-0.8835836, -0.1061791, -1.994762, 0.8196079, 1, 0, 1,
-0.8825439, 0.5416397, -1.901742, 0.8117647, 1, 0, 1,
-0.8824825, 1.008434, -0.3301394, 0.8078431, 1, 0, 1,
-0.8810599, 0.4028283, -1.457209, 0.8, 1, 0, 1,
-0.8795654, -0.6341507, -1.688087, 0.7921569, 1, 0, 1,
-0.8716776, 1.294429, -1.730476, 0.7882353, 1, 0, 1,
-0.8595215, 0.1143412, -3.571405, 0.7803922, 1, 0, 1,
-0.8586, -0.7131451, -2.188466, 0.7764706, 1, 0, 1,
-0.8506203, -0.8283533, -3.691337, 0.7686275, 1, 0, 1,
-0.8440719, -1.310663, -4.004959, 0.7647059, 1, 0, 1,
-0.8400168, 2.279447, -2.031495, 0.7568628, 1, 0, 1,
-0.8394617, 0.9168444, -2.744408, 0.7529412, 1, 0, 1,
-0.8318635, 0.8913441, -0.7498776, 0.7450981, 1, 0, 1,
-0.830796, 0.8748562, -0.7191459, 0.7411765, 1, 0, 1,
-0.8306522, 0.1581911, -0.8061912, 0.7333333, 1, 0, 1,
-0.8288008, -0.8617054, -3.400419, 0.7294118, 1, 0, 1,
-0.8234835, -0.02019337, -1.506459, 0.7215686, 1, 0, 1,
-0.8234586, -2.098674, -2.315423, 0.7176471, 1, 0, 1,
-0.8175334, -0.5676067, -0.1987621, 0.7098039, 1, 0, 1,
-0.8169459, 0.8262852, 0.05495267, 0.7058824, 1, 0, 1,
-0.8164436, -0.4540103, -1.606067, 0.6980392, 1, 0, 1,
-0.8147607, -0.858103, -4.125914, 0.6901961, 1, 0, 1,
-0.8146524, 0.05618629, -0.01363356, 0.6862745, 1, 0, 1,
-0.8141891, 0.4385577, 0.04682565, 0.6784314, 1, 0, 1,
-0.8133133, -0.2990218, -2.388607, 0.6745098, 1, 0, 1,
-0.8131194, -1.1213, -1.601457, 0.6666667, 1, 0, 1,
-0.81129, -0.2219751, -2.458833, 0.6627451, 1, 0, 1,
-0.8065351, 0.05681453, -2.243273, 0.654902, 1, 0, 1,
-0.8058407, 1.091757, -0.05102548, 0.6509804, 1, 0, 1,
-0.804627, 0.5039256, -0.2574508, 0.6431373, 1, 0, 1,
-0.7990922, -0.9997436, -1.347428, 0.6392157, 1, 0, 1,
-0.7939519, 0.5914369, 0.2401966, 0.6313726, 1, 0, 1,
-0.7910972, 0.4554563, -2.153681, 0.627451, 1, 0, 1,
-0.7893916, -0.3279221, -2.069354, 0.6196079, 1, 0, 1,
-0.7889318, -0.1746081, -2.01786, 0.6156863, 1, 0, 1,
-0.7877297, 0.05891367, -2.37092, 0.6078432, 1, 0, 1,
-0.781019, -0.8408252, -2.676589, 0.6039216, 1, 0, 1,
-0.7783095, 0.2066682, -1.796815, 0.5960785, 1, 0, 1,
-0.7775265, 0.6110952, -0.9213745, 0.5882353, 1, 0, 1,
-0.7758835, -1.099199, -2.430068, 0.5843138, 1, 0, 1,
-0.7738675, 0.3214026, -1.161472, 0.5764706, 1, 0, 1,
-0.7666295, 1.252179, -0.7499148, 0.572549, 1, 0, 1,
-0.7639362, 0.3279535, -1.829492, 0.5647059, 1, 0, 1,
-0.7618701, -0.6465383, -1.304743, 0.5607843, 1, 0, 1,
-0.7610942, -0.5247535, -2.230691, 0.5529412, 1, 0, 1,
-0.7602105, -0.004031452, -2.566947, 0.5490196, 1, 0, 1,
-0.7593104, 0.3596711, -1.968236, 0.5411765, 1, 0, 1,
-0.752355, -0.7616929, -3.656771, 0.5372549, 1, 0, 1,
-0.7516321, 0.8246133, 0.3336538, 0.5294118, 1, 0, 1,
-0.7460397, 1.151939, -1.555771, 0.5254902, 1, 0, 1,
-0.7452154, -0.9919352, -3.713409, 0.5176471, 1, 0, 1,
-0.7409003, -0.0009587102, -2.510955, 0.5137255, 1, 0, 1,
-0.7379354, 0.3782114, -0.02030334, 0.5058824, 1, 0, 1,
-0.7290553, 1.442075, 0.8032174, 0.5019608, 1, 0, 1,
-0.7284497, 0.674088, -2.459133, 0.4941176, 1, 0, 1,
-0.7252331, -0.4432127, -3.040513, 0.4862745, 1, 0, 1,
-0.722981, 2.997684, 0.901886, 0.4823529, 1, 0, 1,
-0.7185069, -2.532532, -1.759562, 0.4745098, 1, 0, 1,
-0.7171795, 0.7528331, -2.576307, 0.4705882, 1, 0, 1,
-0.7169739, -1.178211, -2.273569, 0.4627451, 1, 0, 1,
-0.7129607, -0.4880863, -2.558822, 0.4588235, 1, 0, 1,
-0.7110126, -0.04398525, -0.7106615, 0.4509804, 1, 0, 1,
-0.7095664, 0.1375294, -1.418681, 0.4470588, 1, 0, 1,
-0.7084345, -0.01518485, -0.9161674, 0.4392157, 1, 0, 1,
-0.7083899, 1.262877, -0.9399819, 0.4352941, 1, 0, 1,
-0.7001276, 0.006078876, -0.6486763, 0.427451, 1, 0, 1,
-0.697966, -0.4019526, -3.589814, 0.4235294, 1, 0, 1,
-0.6943133, -0.3453902, -2.409068, 0.4156863, 1, 0, 1,
-0.6907358, 0.1940922, -2.85574, 0.4117647, 1, 0, 1,
-0.6830668, 0.2987095, 0.7984224, 0.4039216, 1, 0, 1,
-0.6817309, 2.258578, 0.9931219, 0.3960784, 1, 0, 1,
-0.6810393, 0.05567783, -1.634097, 0.3921569, 1, 0, 1,
-0.6780329, 0.6334072, -1.926387, 0.3843137, 1, 0, 1,
-0.6587162, -0.2808188, -1.75134, 0.3803922, 1, 0, 1,
-0.6573755, -1.494607, -2.958212, 0.372549, 1, 0, 1,
-0.6565835, -0.1039948, -2.451049, 0.3686275, 1, 0, 1,
-0.6531725, 0.2093329, -1.464039, 0.3607843, 1, 0, 1,
-0.6529867, 0.270908, -1.040438, 0.3568628, 1, 0, 1,
-0.6503694, -0.3487532, -2.911479, 0.3490196, 1, 0, 1,
-0.6498659, -0.3551289, -3.530646, 0.345098, 1, 0, 1,
-0.6406847, 1.822576, 0.6038464, 0.3372549, 1, 0, 1,
-0.6402807, 0.7200735, -0.4058226, 0.3333333, 1, 0, 1,
-0.6367852, 0.8083653, -1.3846, 0.3254902, 1, 0, 1,
-0.6343781, -1.658318, -2.935631, 0.3215686, 1, 0, 1,
-0.6285553, 0.9066846, -1.861313, 0.3137255, 1, 0, 1,
-0.6234034, 0.6890417, -1.22575, 0.3098039, 1, 0, 1,
-0.6197556, 0.2087131, -1.65341, 0.3019608, 1, 0, 1,
-0.6191998, -0.3199245, -2.689509, 0.2941177, 1, 0, 1,
-0.6181984, -0.4979258, -2.287629, 0.2901961, 1, 0, 1,
-0.616217, -1.647455, -3.029396, 0.282353, 1, 0, 1,
-0.6142598, -0.8398234, -1.17025, 0.2784314, 1, 0, 1,
-0.6121404, 0.6256124, -0.08597348, 0.2705882, 1, 0, 1,
-0.6116686, -0.344123, -2.396557, 0.2666667, 1, 0, 1,
-0.6101667, -1.75846, -2.243178, 0.2588235, 1, 0, 1,
-0.6076843, -0.3084701, -1.706324, 0.254902, 1, 0, 1,
-0.5941412, 0.06443986, -0.8683652, 0.2470588, 1, 0, 1,
-0.5932381, -0.4721582, -1.724634, 0.2431373, 1, 0, 1,
-0.5925601, 0.3441416, -1.040009, 0.2352941, 1, 0, 1,
-0.5899047, 0.622868, -1.454195, 0.2313726, 1, 0, 1,
-0.5870796, 0.9268132, -1.18092, 0.2235294, 1, 0, 1,
-0.5793532, 0.01271724, -1.985011, 0.2196078, 1, 0, 1,
-0.5746625, -0.1856514, -1.483554, 0.2117647, 1, 0, 1,
-0.5717101, -0.2792636, -2.00676, 0.2078431, 1, 0, 1,
-0.5691955, -2.254031, -2.380132, 0.2, 1, 0, 1,
-0.5691851, -1.592218, -1.782295, 0.1921569, 1, 0, 1,
-0.566388, 0.3500678, -0.2944264, 0.1882353, 1, 0, 1,
-0.5610622, 0.4219931, -1.075981, 0.1803922, 1, 0, 1,
-0.5558709, -0.9494829, -3.028751, 0.1764706, 1, 0, 1,
-0.5549411, -1.023167, -2.00655, 0.1686275, 1, 0, 1,
-0.5516077, -0.7205948, -4.373497, 0.1647059, 1, 0, 1,
-0.5465457, 3.043913, -0.9614717, 0.1568628, 1, 0, 1,
-0.5456313, 0.9765464, -2.070603, 0.1529412, 1, 0, 1,
-0.5303926, -1.448467, -0.8394915, 0.145098, 1, 0, 1,
-0.5303156, 1.142334, 1.046991, 0.1411765, 1, 0, 1,
-0.5287966, -0.06493934, -1.595363, 0.1333333, 1, 0, 1,
-0.5272717, -0.01461717, -1.977723, 0.1294118, 1, 0, 1,
-0.5243503, 0.5662842, 0.2034109, 0.1215686, 1, 0, 1,
-0.5183969, 0.08334204, -2.984217, 0.1176471, 1, 0, 1,
-0.5182447, -1.772136, -3.99849, 0.1098039, 1, 0, 1,
-0.5133529, 1.011697, 0.5821176, 0.1058824, 1, 0, 1,
-0.5129123, -2.536371, -4.274197, 0.09803922, 1, 0, 1,
-0.5123501, -0.3988357, -2.466845, 0.09019608, 1, 0, 1,
-0.5106988, 1.346327, -1.070653, 0.08627451, 1, 0, 1,
-0.510364, -0.3140555, -3.444009, 0.07843138, 1, 0, 1,
-0.5053536, -1.045826, -3.013155, 0.07450981, 1, 0, 1,
-0.502149, 1.396033, 0.4476185, 0.06666667, 1, 0, 1,
-0.5003712, 0.3114839, -0.725437, 0.0627451, 1, 0, 1,
-0.4993261, -0.3345191, -1.966147, 0.05490196, 1, 0, 1,
-0.4938816, -0.1058448, -1.102063, 0.05098039, 1, 0, 1,
-0.4913519, 0.4305508, -1.431116, 0.04313726, 1, 0, 1,
-0.4877183, 0.4051951, -1.333822, 0.03921569, 1, 0, 1,
-0.4802397, -0.3829369, -1.129376, 0.03137255, 1, 0, 1,
-0.477366, 0.1354878, -2.256394, 0.02745098, 1, 0, 1,
-0.4772621, -0.8427787, -1.077878, 0.01960784, 1, 0, 1,
-0.4763732, 0.2713396, -1.466677, 0.01568628, 1, 0, 1,
-0.4761849, 0.1915152, -1.981877, 0.007843138, 1, 0, 1,
-0.4761792, 0.6318272, -0.5871279, 0.003921569, 1, 0, 1,
-0.4724185, 1.663576, -0.4629586, 0, 1, 0.003921569, 1,
-0.4723859, 0.2843014, -0.08714952, 0, 1, 0.01176471, 1,
-0.469245, -1.868512, -3.393749, 0, 1, 0.01568628, 1,
-0.4628921, -1.720949, -4.195243, 0, 1, 0.02352941, 1,
-0.4620808, -0.3051262, -4.299106, 0, 1, 0.02745098, 1,
-0.4599275, -0.6230477, -3.182744, 0, 1, 0.03529412, 1,
-0.4542564, -2.17276, -5.036364, 0, 1, 0.03921569, 1,
-0.451698, -0.953716, -1.402354, 0, 1, 0.04705882, 1,
-0.4491565, 1.255712, 0.012338, 0, 1, 0.05098039, 1,
-0.443518, -0.3043341, -1.518081, 0, 1, 0.05882353, 1,
-0.4368729, -1.344363, -3.705315, 0, 1, 0.0627451, 1,
-0.4309399, 0.5108022, 0.09337464, 0, 1, 0.07058824, 1,
-0.4302293, -0.1074626, -3.015418, 0, 1, 0.07450981, 1,
-0.4301132, -1.034487, -1.6297, 0, 1, 0.08235294, 1,
-0.4235404, 1.566127, -0.7874152, 0, 1, 0.08627451, 1,
-0.4209854, 1.193474, 0.7112399, 0, 1, 0.09411765, 1,
-0.4172173, -1.384729, -3.20713, 0, 1, 0.1019608, 1,
-0.4140018, 0.2983957, -0.9268965, 0, 1, 0.1058824, 1,
-0.4081296, -2.000827, -3.532612, 0, 1, 0.1137255, 1,
-0.4053365, -1.844043, -4.001801, 0, 1, 0.1176471, 1,
-0.399321, 0.1176487, -1.592845, 0, 1, 0.1254902, 1,
-0.3970026, -0.05845842, -0.6005672, 0, 1, 0.1294118, 1,
-0.3943569, 1.502534, 1.009918, 0, 1, 0.1372549, 1,
-0.3923135, 0.9354259, -0.756399, 0, 1, 0.1411765, 1,
-0.39193, -1.457225, -1.481118, 0, 1, 0.1490196, 1,
-0.3892691, 1.13712, 0.1887584, 0, 1, 0.1529412, 1,
-0.3890513, 0.196743, -0.2574357, 0, 1, 0.1607843, 1,
-0.381606, -1.538258, -1.458851, 0, 1, 0.1647059, 1,
-0.3785926, 0.5007189, -1.397055, 0, 1, 0.172549, 1,
-0.374851, -0.8654001, -4.179053, 0, 1, 0.1764706, 1,
-0.3716263, -0.8212928, -2.42273, 0, 1, 0.1843137, 1,
-0.3691754, 0.8086206, 0.4695162, 0, 1, 0.1882353, 1,
-0.3668084, -0.110259, -2.59709, 0, 1, 0.1960784, 1,
-0.365577, 0.5276909, 0.6314299, 0, 1, 0.2039216, 1,
-0.3648633, 1.416809, -0.5681052, 0, 1, 0.2078431, 1,
-0.3463816, 1.208229, -0.9755141, 0, 1, 0.2156863, 1,
-0.3446995, 0.01859064, -2.193797, 0, 1, 0.2196078, 1,
-0.3402463, -0.4974301, -1.60614, 0, 1, 0.227451, 1,
-0.3387435, 0.653329, 1.171641, 0, 1, 0.2313726, 1,
-0.3373275, -0.6697607, -2.882021, 0, 1, 0.2392157, 1,
-0.3363166, 0.0670794, -0.2051157, 0, 1, 0.2431373, 1,
-0.3340829, -1.531085, -3.35199, 0, 1, 0.2509804, 1,
-0.3299118, 0.1674983, -0.9622943, 0, 1, 0.254902, 1,
-0.3293726, -1.135127, -3.133972, 0, 1, 0.2627451, 1,
-0.3259791, 1.256249, 0.423624, 0, 1, 0.2666667, 1,
-0.3220257, -1.468347, -3.07905, 0, 1, 0.2745098, 1,
-0.318517, -1.99691, -4.511645, 0, 1, 0.2784314, 1,
-0.3179867, 1.407164, 0.1534088, 0, 1, 0.2862745, 1,
-0.3106193, 0.8119624, -1.23903, 0, 1, 0.2901961, 1,
-0.3081734, -0.1062998, -2.14089, 0, 1, 0.2980392, 1,
-0.3036519, 0.6100432, -0.6593659, 0, 1, 0.3058824, 1,
-0.2979131, -1.970784, -1.858764, 0, 1, 0.3098039, 1,
-0.2931654, 0.3277806, -0.6612898, 0, 1, 0.3176471, 1,
-0.2913094, 0.0423888, -1.921199, 0, 1, 0.3215686, 1,
-0.2862589, -0.3290442, -2.797242, 0, 1, 0.3294118, 1,
-0.2818142, 0.5743033, -0.887596, 0, 1, 0.3333333, 1,
-0.2805809, -1.048825, -3.099017, 0, 1, 0.3411765, 1,
-0.2785255, 1.249055, 0.2315067, 0, 1, 0.345098, 1,
-0.2778385, -0.9427125, -1.294067, 0, 1, 0.3529412, 1,
-0.276502, 0.6600867, -0.9827945, 0, 1, 0.3568628, 1,
-0.2761892, -1.544901, -3.174747, 0, 1, 0.3647059, 1,
-0.2740233, 0.2006214, 0.4147739, 0, 1, 0.3686275, 1,
-0.2672188, 0.01054507, -2.316514, 0, 1, 0.3764706, 1,
-0.2645321, 1.06045, -0.9792859, 0, 1, 0.3803922, 1,
-0.2619987, 0.2168818, -0.6989167, 0, 1, 0.3882353, 1,
-0.2579075, -2.523059, -1.905477, 0, 1, 0.3921569, 1,
-0.2537305, 0.04060422, -2.269647, 0, 1, 0.4, 1,
-0.2522214, 0.6376881, 0.2435976, 0, 1, 0.4078431, 1,
-0.247999, -1.050742, -1.401378, 0, 1, 0.4117647, 1,
-0.2476007, -0.3798919, -3.2714, 0, 1, 0.4196078, 1,
-0.2414495, -1.408806, -1.468325, 0, 1, 0.4235294, 1,
-0.2412686, -0.5463497, -3.171805, 0, 1, 0.4313726, 1,
-0.2388746, 1.05412, -0.03778303, 0, 1, 0.4352941, 1,
-0.2332274, 0.409268, -1.162329, 0, 1, 0.4431373, 1,
-0.2331467, 0.2108555, -0.8112668, 0, 1, 0.4470588, 1,
-0.2174445, 0.3822267, 0.7771078, 0, 1, 0.454902, 1,
-0.2160696, 1.801733, -0.4969459, 0, 1, 0.4588235, 1,
-0.2159757, -0.4539938, -3.214983, 0, 1, 0.4666667, 1,
-0.2144236, -0.337187, -1.066673, 0, 1, 0.4705882, 1,
-0.2141237, -1.353231, -2.701802, 0, 1, 0.4784314, 1,
-0.2113533, -0.4890423, -4.618792, 0, 1, 0.4823529, 1,
-0.2088966, -0.7179495, -1.183767, 0, 1, 0.4901961, 1,
-0.2064611, 0.4576032, -0.3224542, 0, 1, 0.4941176, 1,
-0.2004212, -0.007724952, -0.5341184, 0, 1, 0.5019608, 1,
-0.1962051, 0.13501, -0.1463088, 0, 1, 0.509804, 1,
-0.1952532, -0.4548275, -2.04643, 0, 1, 0.5137255, 1,
-0.1908198, 0.7297432, 0.3277942, 0, 1, 0.5215687, 1,
-0.1890208, -0.1543032, -2.37975, 0, 1, 0.5254902, 1,
-0.1889817, 0.2726055, 0.6645579, 0, 1, 0.5333334, 1,
-0.1878044, 2.234433, -0.4511366, 0, 1, 0.5372549, 1,
-0.1817707, 0.1669003, -1.376402, 0, 1, 0.5450981, 1,
-0.1774051, 0.1914468, -2.611437, 0, 1, 0.5490196, 1,
-0.1761138, -2.502162, -4.152835, 0, 1, 0.5568628, 1,
-0.1694297, -0.7929322, -2.969535, 0, 1, 0.5607843, 1,
-0.1693544, -0.09508026, -1.490101, 0, 1, 0.5686275, 1,
-0.1643934, 0.2269565, -0.570674, 0, 1, 0.572549, 1,
-0.1621096, -0.7148946, -5.207496, 0, 1, 0.5803922, 1,
-0.1570961, 0.4485618, 0.06567022, 0, 1, 0.5843138, 1,
-0.1537893, -0.3792127, -2.028429, 0, 1, 0.5921569, 1,
-0.1536733, -0.139434, -1.034393, 0, 1, 0.5960785, 1,
-0.1531183, -0.9370398, -2.633211, 0, 1, 0.6039216, 1,
-0.1462405, 1.236352, -0.1017794, 0, 1, 0.6117647, 1,
-0.1448939, 2.139818, -1.0433, 0, 1, 0.6156863, 1,
-0.1387007, -0.0428673, -2.830376, 0, 1, 0.6235294, 1,
-0.1357893, -0.9890584, -1.542036, 0, 1, 0.627451, 1,
-0.1338941, 0.3736769, 0.1543211, 0, 1, 0.6352941, 1,
-0.1281004, 0.9129876, -1.998958, 0, 1, 0.6392157, 1,
-0.1246442, 0.9023885, -0.3983905, 0, 1, 0.6470588, 1,
-0.1236581, 1.478689, 1.880952, 0, 1, 0.6509804, 1,
-0.1146774, 0.3688961, 0.01210938, 0, 1, 0.6588235, 1,
-0.1146096, -0.2411722, -2.424547, 0, 1, 0.6627451, 1,
-0.1140581, 0.0416586, 0.6256217, 0, 1, 0.6705883, 1,
-0.1129123, -0.3641121, -3.631883, 0, 1, 0.6745098, 1,
-0.111762, 1.184479, 0.0890085, 0, 1, 0.682353, 1,
-0.10953, -0.04128049, -1.971528, 0, 1, 0.6862745, 1,
-0.1094323, -0.6631249, -2.226004, 0, 1, 0.6941177, 1,
-0.1088383, 0.9750127, -0.3310745, 0, 1, 0.7019608, 1,
-0.1088317, -0.827112, -3.196817, 0, 1, 0.7058824, 1,
-0.1085598, -0.1118743, -2.107797, 0, 1, 0.7137255, 1,
-0.09682284, 1.423099, -0.2034754, 0, 1, 0.7176471, 1,
-0.09305114, -0.01206921, -1.909844, 0, 1, 0.7254902, 1,
-0.09221434, -0.8073191, -2.448677, 0, 1, 0.7294118, 1,
-0.08960143, -0.4438349, -2.872692, 0, 1, 0.7372549, 1,
-0.08869672, 0.08940897, -1.960059, 0, 1, 0.7411765, 1,
-0.08716938, 1.758171, 0.6436604, 0, 1, 0.7490196, 1,
-0.08699546, 0.2962123, 0.6299636, 0, 1, 0.7529412, 1,
-0.07879431, -0.6314539, -2.45779, 0, 1, 0.7607843, 1,
-0.07674965, -1.223733, -2.10877, 0, 1, 0.7647059, 1,
-0.07457437, -0.2938693, -2.320032, 0, 1, 0.772549, 1,
-0.0735007, -0.5459636, -1.562388, 0, 1, 0.7764706, 1,
-0.07072852, 1.238007, 0.08884228, 0, 1, 0.7843137, 1,
-0.06957003, -0.2685994, -2.865283, 0, 1, 0.7882353, 1,
-0.06531548, 1.459509, 0.5877059, 0, 1, 0.7960784, 1,
-0.06413165, -0.5766946, -3.430739, 0, 1, 0.8039216, 1,
-0.0635521, -3.512717, -3.793971, 0, 1, 0.8078431, 1,
-0.06349638, 1.001124, 0.5099704, 0, 1, 0.8156863, 1,
-0.05814152, 1.652617, 0.5215156, 0, 1, 0.8196079, 1,
-0.05733101, -0.2970466, -2.97142, 0, 1, 0.827451, 1,
-0.05374069, -1.951212, -2.712974, 0, 1, 0.8313726, 1,
-0.05322961, -0.9417575, -1.651424, 0, 1, 0.8392157, 1,
-0.04990146, -0.4917573, -1.992891, 0, 1, 0.8431373, 1,
-0.04684439, 0.2752165, -1.279505, 0, 1, 0.8509804, 1,
-0.04157455, 0.5560857, -0.9408404, 0, 1, 0.854902, 1,
-0.03740412, -0.4697303, -3.080448, 0, 1, 0.8627451, 1,
-0.03662324, -0.3625247, -2.955853, 0, 1, 0.8666667, 1,
-0.02594391, 0.4682956, -0.2350504, 0, 1, 0.8745098, 1,
-0.02268075, -1.862879, -3.389483, 0, 1, 0.8784314, 1,
-0.02143664, 1.660716, -0.3398638, 0, 1, 0.8862745, 1,
-0.01953682, 0.3107128, -0.4095082, 0, 1, 0.8901961, 1,
-0.01245029, -0.8152288, -2.548291, 0, 1, 0.8980392, 1,
-0.01233344, 0.6294745, -2.073228, 0, 1, 0.9058824, 1,
-0.01003755, 0.1872879, 0.6167998, 0, 1, 0.9098039, 1,
-0.00716704, -0.6795229, -5.04002, 0, 1, 0.9176471, 1,
-0.006407628, 0.03349181, 1.445785, 0, 1, 0.9215686, 1,
-0.005820327, -1.22847, -4.231398, 0, 1, 0.9294118, 1,
-0.004434963, -1.612424, -3.510034, 0, 1, 0.9333333, 1,
0.001781133, 0.6811052, -0.2838544, 0, 1, 0.9411765, 1,
0.001955485, -1.330265, 3.240401, 0, 1, 0.945098, 1,
0.00208883, 0.3294597, -0.9345148, 0, 1, 0.9529412, 1,
0.002585478, 0.918468, 1.071834, 0, 1, 0.9568627, 1,
0.005031687, 0.2057923, 1.144005, 0, 1, 0.9647059, 1,
0.008320364, -0.6944714, 2.653085, 0, 1, 0.9686275, 1,
0.01141173, -0.2889418, 4.111899, 0, 1, 0.9764706, 1,
0.01217744, -0.9693106, 3.051431, 0, 1, 0.9803922, 1,
0.01541819, 1.790935, -0.02551575, 0, 1, 0.9882353, 1,
0.01589839, 0.0588103, 0.543377, 0, 1, 0.9921569, 1,
0.01737331, 0.8240539, -1.981822, 0, 1, 1, 1,
0.02132956, 0.9802678, 0.445491, 0, 0.9921569, 1, 1,
0.02223947, -0.4258133, 3.023931, 0, 0.9882353, 1, 1,
0.02866953, -1.073871, 1.943831, 0, 0.9803922, 1, 1,
0.02959489, 1.475223, -0.1040992, 0, 0.9764706, 1, 1,
0.03154122, -2.06952, 2.500196, 0, 0.9686275, 1, 1,
0.03215996, -3.572356, 4.324994, 0, 0.9647059, 1, 1,
0.03477914, 0.3445344, -0.2952774, 0, 0.9568627, 1, 1,
0.03496035, 0.003612116, 2.143263, 0, 0.9529412, 1, 1,
0.03745833, -0.2124986, 4.480513, 0, 0.945098, 1, 1,
0.04126195, 0.0002493596, 1.740582, 0, 0.9411765, 1, 1,
0.04617323, -2.034458, 3.238206, 0, 0.9333333, 1, 1,
0.04905266, 0.07962318, 0.9339461, 0, 0.9294118, 1, 1,
0.05097147, -0.5380104, 1.984742, 0, 0.9215686, 1, 1,
0.059727, 0.4054611, 0.09424654, 0, 0.9176471, 1, 1,
0.06408305, -0.5031876, 4.226458, 0, 0.9098039, 1, 1,
0.06557053, 0.4684335, -0.7379439, 0, 0.9058824, 1, 1,
0.06667995, -0.1015429, 3.142178, 0, 0.8980392, 1, 1,
0.07087472, 0.3891439, 0.06458582, 0, 0.8901961, 1, 1,
0.07549974, -1.708501, 1.797221, 0, 0.8862745, 1, 1,
0.07965207, 0.932113, -1.309055, 0, 0.8784314, 1, 1,
0.08308224, 0.4405117, -1.675643, 0, 0.8745098, 1, 1,
0.08416026, -0.9267118, 5.820433, 0, 0.8666667, 1, 1,
0.08570582, -1.801056, 1.927656, 0, 0.8627451, 1, 1,
0.08810367, 0.1667851, -1.186035, 0, 0.854902, 1, 1,
0.0886568, 0.4474104, 0.5632985, 0, 0.8509804, 1, 1,
0.09077518, -1.267157, 0.8253984, 0, 0.8431373, 1, 1,
0.09134331, 0.2432807, -0.6487362, 0, 0.8392157, 1, 1,
0.09225321, 0.7084824, 3.82351, 0, 0.8313726, 1, 1,
0.09633675, 2.343316, -1.988887, 0, 0.827451, 1, 1,
0.1029013, 0.187317, 1.080078, 0, 0.8196079, 1, 1,
0.1034295, -0.3138018, 3.194928, 0, 0.8156863, 1, 1,
0.1083271, 0.0778406, 1.408903, 0, 0.8078431, 1, 1,
0.1160277, 0.7707131, 0.6747282, 0, 0.8039216, 1, 1,
0.1210216, 0.5867404, -1.282339, 0, 0.7960784, 1, 1,
0.1214572, 0.4630535, 0.1395273, 0, 0.7882353, 1, 1,
0.1233236, -0.3798729, 4.085015, 0, 0.7843137, 1, 1,
0.1252314, 1.360445, -0.5993132, 0, 0.7764706, 1, 1,
0.1261397, -1.209153, 1.98944, 0, 0.772549, 1, 1,
0.1264296, -0.3773754, 2.717049, 0, 0.7647059, 1, 1,
0.1271868, -1.009476, 3.716656, 0, 0.7607843, 1, 1,
0.1301525, 0.3278895, 2.434067, 0, 0.7529412, 1, 1,
0.1339691, 0.0346932, 0.7562025, 0, 0.7490196, 1, 1,
0.1366383, -0.6483826, 1.605636, 0, 0.7411765, 1, 1,
0.1377548, 0.1250632, 1.571556, 0, 0.7372549, 1, 1,
0.1422461, -0.9484972, 3.337684, 0, 0.7294118, 1, 1,
0.1429243, -1.141224, 2.179215, 0, 0.7254902, 1, 1,
0.1448666, 1.450323, -1.951292, 0, 0.7176471, 1, 1,
0.1488293, 0.9597849, 0.4481525, 0, 0.7137255, 1, 1,
0.1502507, -1.885335, 3.53934, 0, 0.7058824, 1, 1,
0.1505117, -0.8790823, 4.689514, 0, 0.6980392, 1, 1,
0.1543797, -0.244319, 3.766701, 0, 0.6941177, 1, 1,
0.1565131, -0.6218426, 2.721375, 0, 0.6862745, 1, 1,
0.1616616, 1.314089, 0.9668399, 0, 0.682353, 1, 1,
0.1619635, 1.024061, 1.388276, 0, 0.6745098, 1, 1,
0.1638487, -0.5966782, 2.379993, 0, 0.6705883, 1, 1,
0.1677002, -1.777934, 3.103959, 0, 0.6627451, 1, 1,
0.167956, -1.327811, 2.577182, 0, 0.6588235, 1, 1,
0.1708813, -2.175111, 3.874524, 0, 0.6509804, 1, 1,
0.1782053, -0.4587902, 4.796232, 0, 0.6470588, 1, 1,
0.179118, 0.5783024, 1.676839, 0, 0.6392157, 1, 1,
0.1835931, 0.1366969, 0.1873508, 0, 0.6352941, 1, 1,
0.1850817, 1.579914, -1.215083, 0, 0.627451, 1, 1,
0.1865987, -0.1044589, 3.833509, 0, 0.6235294, 1, 1,
0.1870438, 0.7256224, 0.1701041, 0, 0.6156863, 1, 1,
0.1887352, 1.199789, 0.3238252, 0, 0.6117647, 1, 1,
0.1890058, 1.51272, -0.4018805, 0, 0.6039216, 1, 1,
0.1946612, -1.18536, 2.022177, 0, 0.5960785, 1, 1,
0.1950928, -1.494269, 2.945323, 0, 0.5921569, 1, 1,
0.2042294, -0.2639956, 2.420473, 0, 0.5843138, 1, 1,
0.2115829, -0.7702994, 3.515638, 0, 0.5803922, 1, 1,
0.2136815, -1.016676, 4.39268, 0, 0.572549, 1, 1,
0.2169599, 1.670558, -0.298848, 0, 0.5686275, 1, 1,
0.2170004, -1.071788, 2.334291, 0, 0.5607843, 1, 1,
0.2186188, -1.465945, 2.827446, 0, 0.5568628, 1, 1,
0.2230071, -0.4247652, 2.60638, 0, 0.5490196, 1, 1,
0.2242891, 0.4327603, -0.2524242, 0, 0.5450981, 1, 1,
0.2251915, 0.9531171, 0.2175256, 0, 0.5372549, 1, 1,
0.2293596, -2.189857, 4.329157, 0, 0.5333334, 1, 1,
0.2327087, 0.1661996, 1.201181, 0, 0.5254902, 1, 1,
0.2338281, 1.390866, 0.1613121, 0, 0.5215687, 1, 1,
0.2346459, -0.1718105, 1.216328, 0, 0.5137255, 1, 1,
0.2462086, -0.161936, 1.708062, 0, 0.509804, 1, 1,
0.2503955, 0.6502228, 0.2665633, 0, 0.5019608, 1, 1,
0.2506647, 0.02009171, 2.645489, 0, 0.4941176, 1, 1,
0.2515334, -0.6070592, 3.64147, 0, 0.4901961, 1, 1,
0.2545726, 0.1126905, -0.1244154, 0, 0.4823529, 1, 1,
0.2575333, 1.091963, 0.0718469, 0, 0.4784314, 1, 1,
0.2586088, -0.2858874, 3.811638, 0, 0.4705882, 1, 1,
0.2615224, 0.8416949, 1.387449, 0, 0.4666667, 1, 1,
0.2617893, -0.7535906, 3.648962, 0, 0.4588235, 1, 1,
0.263499, 0.5043402, 0.09389185, 0, 0.454902, 1, 1,
0.2638678, 1.540029, 0.4077273, 0, 0.4470588, 1, 1,
0.2660708, 0.3936903, 0.5333983, 0, 0.4431373, 1, 1,
0.2665954, 1.11275, -1.241486, 0, 0.4352941, 1, 1,
0.2734336, 0.5800301, 2.85686, 0, 0.4313726, 1, 1,
0.2736429, 1.67627, -1.840998, 0, 0.4235294, 1, 1,
0.2762533, 0.4455971, -1.367303, 0, 0.4196078, 1, 1,
0.279555, -1.458671, 3.333339, 0, 0.4117647, 1, 1,
0.2805911, -1.541377, 2.872171, 0, 0.4078431, 1, 1,
0.2818237, 0.8676996, 0.2303964, 0, 0.4, 1, 1,
0.283369, 1.569011, 0.7798782, 0, 0.3921569, 1, 1,
0.283814, -0.137102, 1.447496, 0, 0.3882353, 1, 1,
0.2873481, 0.3212671, 1.352009, 0, 0.3803922, 1, 1,
0.2900025, -0.6186857, 2.076109, 0, 0.3764706, 1, 1,
0.2904887, -0.3659969, 2.117047, 0, 0.3686275, 1, 1,
0.2913074, -0.1622705, 0.9998247, 0, 0.3647059, 1, 1,
0.2917992, -0.18893, 1.74536, 0, 0.3568628, 1, 1,
0.2942556, 1.023207, -0.6293313, 0, 0.3529412, 1, 1,
0.2946565, -0.7351156, 3.224986, 0, 0.345098, 1, 1,
0.295474, -0.0932977, 0.5223651, 0, 0.3411765, 1, 1,
0.2975372, 0.1511808, 3.076132, 0, 0.3333333, 1, 1,
0.2992872, 0.9783872, 0.7639042, 0, 0.3294118, 1, 1,
0.3005928, -0.6495762, 2.694898, 0, 0.3215686, 1, 1,
0.3006089, -0.3930583, 0.4999493, 0, 0.3176471, 1, 1,
0.3025901, -2.391932, 2.366769, 0, 0.3098039, 1, 1,
0.3046766, 0.5170019, 2.574165, 0, 0.3058824, 1, 1,
0.3047834, 0.6328736, 0.02561585, 0, 0.2980392, 1, 1,
0.3052577, 0.104771, -0.5846974, 0, 0.2901961, 1, 1,
0.3088952, -1.917216, 2.122651, 0, 0.2862745, 1, 1,
0.3130245, -0.9814454, 2.258542, 0, 0.2784314, 1, 1,
0.3158195, -0.3946511, 1.374319, 0, 0.2745098, 1, 1,
0.3180988, -0.6003893, 2.942996, 0, 0.2666667, 1, 1,
0.3183858, -0.2966394, 2.688797, 0, 0.2627451, 1, 1,
0.3190931, 2.119429, -0.9224417, 0, 0.254902, 1, 1,
0.3201093, -0.1911811, 2.672097, 0, 0.2509804, 1, 1,
0.3303582, -1.458717, 2.414044, 0, 0.2431373, 1, 1,
0.3372155, 0.3184977, -0.258826, 0, 0.2392157, 1, 1,
0.3396385, 1.063106, -0.03980502, 0, 0.2313726, 1, 1,
0.3416971, 0.7154791, 0.5466966, 0, 0.227451, 1, 1,
0.34303, -0.30862, 2.616957, 0, 0.2196078, 1, 1,
0.3439719, -1.171746, 4.949728, 0, 0.2156863, 1, 1,
0.3489038, 0.8253887, -0.5380877, 0, 0.2078431, 1, 1,
0.3513344, 0.8056685, 1.988379, 0, 0.2039216, 1, 1,
0.3513493, 2.171211, 0.005968958, 0, 0.1960784, 1, 1,
0.3556001, -0.6277975, 1.51503, 0, 0.1882353, 1, 1,
0.3621274, 1.608697, 1.282838, 0, 0.1843137, 1, 1,
0.3669449, 0.1831792, 1.927189, 0, 0.1764706, 1, 1,
0.3691304, -2.264443, 2.934851, 0, 0.172549, 1, 1,
0.3699418, 1.540849, 0.3114649, 0, 0.1647059, 1, 1,
0.3711397, -1.425228, 2.844612, 0, 0.1607843, 1, 1,
0.3775182, -0.4465005, 1.583675, 0, 0.1529412, 1, 1,
0.378383, -1.66791, 2.499515, 0, 0.1490196, 1, 1,
0.3797557, 0.6762353, 0.4196455, 0, 0.1411765, 1, 1,
0.3810546, 1.006336, -1.17507, 0, 0.1372549, 1, 1,
0.3825998, -0.001580968, 1.772061, 0, 0.1294118, 1, 1,
0.384568, -0.7273973, 2.419725, 0, 0.1254902, 1, 1,
0.3847457, -1.000246, 3.146037, 0, 0.1176471, 1, 1,
0.3850535, 1.334827, -0.3904479, 0, 0.1137255, 1, 1,
0.388895, -0.08725639, 4.630325, 0, 0.1058824, 1, 1,
0.4000921, 1.958286, -0.02798741, 0, 0.09803922, 1, 1,
0.4010772, 0.1731427, 1.663793, 0, 0.09411765, 1, 1,
0.4020157, -1.558181, 3.219588, 0, 0.08627451, 1, 1,
0.4182042, 2.424243, 0.7251493, 0, 0.08235294, 1, 1,
0.4233856, -0.5956005, 0.308579, 0, 0.07450981, 1, 1,
0.426545, -0.06177661, 1.498245, 0, 0.07058824, 1, 1,
0.426598, 1.096216, 1.016659, 0, 0.0627451, 1, 1,
0.4270462, 0.476541, -0.01042262, 0, 0.05882353, 1, 1,
0.4306081, -0.474394, 3.851944, 0, 0.05098039, 1, 1,
0.4310234, -0.6582752, 3.072917, 0, 0.04705882, 1, 1,
0.437402, -0.9208865, 1.854355, 0, 0.03921569, 1, 1,
0.4403292, -0.5301818, 1.698893, 0, 0.03529412, 1, 1,
0.4515023, 0.5466167, 1.280811, 0, 0.02745098, 1, 1,
0.4518299, 0.3349843, 2.117227, 0, 0.02352941, 1, 1,
0.4577437, 1.142439, -0.1533684, 0, 0.01568628, 1, 1,
0.4601075, -0.9641013, 0.6267827, 0, 0.01176471, 1, 1,
0.463762, -0.0636389, 1.857123, 0, 0.003921569, 1, 1,
0.470465, 0.4755181, 0.5627021, 0.003921569, 0, 1, 1,
0.4708285, 1.428558, -0.4576651, 0.007843138, 0, 1, 1,
0.4716932, -0.1115526, 2.297701, 0.01568628, 0, 1, 1,
0.4747575, -0.2290469, 4.384943, 0.01960784, 0, 1, 1,
0.4853452, 0.8334693, -1.231073, 0.02745098, 0, 1, 1,
0.4871919, -1.739385, 2.565996, 0.03137255, 0, 1, 1,
0.4895858, -0.7097374, 1.858206, 0.03921569, 0, 1, 1,
0.489867, 0.6540725, 0.8167837, 0.04313726, 0, 1, 1,
0.4925848, -0.5642717, 2.009747, 0.05098039, 0, 1, 1,
0.5023251, -2.048015, 3.643716, 0.05490196, 0, 1, 1,
0.5030143, -0.365697, 1.683401, 0.0627451, 0, 1, 1,
0.5034451, -0.3294539, 0.3308244, 0.06666667, 0, 1, 1,
0.515291, -0.378985, 1.650081, 0.07450981, 0, 1, 1,
0.5157904, -0.2865762, 2.787743, 0.07843138, 0, 1, 1,
0.5172546, -1.792285, 4.126971, 0.08627451, 0, 1, 1,
0.5172639, 0.2711183, -0.3620349, 0.09019608, 0, 1, 1,
0.5196731, 1.048344, -0.4119341, 0.09803922, 0, 1, 1,
0.5255991, -0.8587739, 2.458134, 0.1058824, 0, 1, 1,
0.5311297, -0.199915, 4.554791, 0.1098039, 0, 1, 1,
0.5327262, -0.8864747, 1.668514, 0.1176471, 0, 1, 1,
0.5339568, -1.959257, 3.48367, 0.1215686, 0, 1, 1,
0.5356537, 2.640247, -0.1751765, 0.1294118, 0, 1, 1,
0.5418163, -2.237547, 3.059777, 0.1333333, 0, 1, 1,
0.5438272, -0.8266574, 2.913861, 0.1411765, 0, 1, 1,
0.5444548, 1.322136, 0.7984836, 0.145098, 0, 1, 1,
0.5467849, -0.3298922, 1.189999, 0.1529412, 0, 1, 1,
0.5501227, 0.7703862, -0.7528062, 0.1568628, 0, 1, 1,
0.5555508, -1.009634, 2.852952, 0.1647059, 0, 1, 1,
0.5613753, -0.6186675, 1.545533, 0.1686275, 0, 1, 1,
0.5663313, 0.2562532, 0.7381855, 0.1764706, 0, 1, 1,
0.5758873, 0.2986227, 0.727177, 0.1803922, 0, 1, 1,
0.5768534, 0.565151, 1.134609, 0.1882353, 0, 1, 1,
0.5769305, -0.1588928, 2.260275, 0.1921569, 0, 1, 1,
0.5781658, 0.3173517, 2.204273, 0.2, 0, 1, 1,
0.579309, -1.138081, 1.544907, 0.2078431, 0, 1, 1,
0.5793192, 0.6673833, 2.091623, 0.2117647, 0, 1, 1,
0.586915, -0.5976447, 2.04032, 0.2196078, 0, 1, 1,
0.595739, 1.765928, 0.05543204, 0.2235294, 0, 1, 1,
0.6030826, -0.8617175, 2.297984, 0.2313726, 0, 1, 1,
0.6065112, -0.3873995, 1.307945, 0.2352941, 0, 1, 1,
0.6085201, -1.111856, 4.169834, 0.2431373, 0, 1, 1,
0.6112693, -0.0692855, 0.1022716, 0.2470588, 0, 1, 1,
0.6136021, 0.02992154, 0.2997401, 0.254902, 0, 1, 1,
0.6147617, -1.025787, 3.041901, 0.2588235, 0, 1, 1,
0.6192846, -0.3353877, 2.054082, 0.2666667, 0, 1, 1,
0.6230786, -1.354596, 2.490851, 0.2705882, 0, 1, 1,
0.6238065, -1.654487, 2.744545, 0.2784314, 0, 1, 1,
0.6242506, -0.4849125, 3.150422, 0.282353, 0, 1, 1,
0.6250432, -0.7471333, 3.283262, 0.2901961, 0, 1, 1,
0.625212, 0.6413273, 0.04372025, 0.2941177, 0, 1, 1,
0.6279995, 1.014744, -0.6668724, 0.3019608, 0, 1, 1,
0.6303881, 1.160184, -0.2312411, 0.3098039, 0, 1, 1,
0.6320212, -0.272459, 0.6939616, 0.3137255, 0, 1, 1,
0.6367443, -1.545323, 2.69149, 0.3215686, 0, 1, 1,
0.6385885, 0.9998992, -0.1791187, 0.3254902, 0, 1, 1,
0.6428431, 1.165668, 0.265445, 0.3333333, 0, 1, 1,
0.6449151, -0.3039606, 0.6405357, 0.3372549, 0, 1, 1,
0.6459718, 0.7509437, 0.08513126, 0.345098, 0, 1, 1,
0.6468847, 2.098221, -1.169552, 0.3490196, 0, 1, 1,
0.6481038, -0.7743598, 3.564452, 0.3568628, 0, 1, 1,
0.6518744, 1.309533, 2.063943, 0.3607843, 0, 1, 1,
0.6523236, -1.219047, 1.94626, 0.3686275, 0, 1, 1,
0.6532292, -1.094841, 1.771065, 0.372549, 0, 1, 1,
0.6562141, -0.1443921, -0.3282638, 0.3803922, 0, 1, 1,
0.6630611, 1.057245, 1.098761, 0.3843137, 0, 1, 1,
0.664341, -0.2356811, 1.919839, 0.3921569, 0, 1, 1,
0.6672316, 1.001457, 0.9224329, 0.3960784, 0, 1, 1,
0.6676488, 1.021255, 1.486987, 0.4039216, 0, 1, 1,
0.6719544, -0.5556497, 2.867185, 0.4117647, 0, 1, 1,
0.6742874, -0.8173715, 3.794715, 0.4156863, 0, 1, 1,
0.6805984, -0.9454776, 1.815296, 0.4235294, 0, 1, 1,
0.6812873, 1.933839, -0.8042333, 0.427451, 0, 1, 1,
0.6815622, 0.4630247, 1.398104, 0.4352941, 0, 1, 1,
0.6849654, 2.021265, -1.63063, 0.4392157, 0, 1, 1,
0.6868778, 1.2927, 0.7513207, 0.4470588, 0, 1, 1,
0.6930709, 0.5282365, 0.1522699, 0.4509804, 0, 1, 1,
0.7073095, 1.914189, -0.1407664, 0.4588235, 0, 1, 1,
0.7100928, 0.08863411, 1.667232, 0.4627451, 0, 1, 1,
0.7101848, -0.6323009, 2.263984, 0.4705882, 0, 1, 1,
0.7103373, 0.2871523, -0.2685375, 0.4745098, 0, 1, 1,
0.7149572, 0.2326934, 2.600204, 0.4823529, 0, 1, 1,
0.7157462, 0.9939762, -0.5418272, 0.4862745, 0, 1, 1,
0.7164509, -0.3446333, 2.775084, 0.4941176, 0, 1, 1,
0.7214924, 1.038753, -0.5571348, 0.5019608, 0, 1, 1,
0.7215419, 2.055587, 0.6780459, 0.5058824, 0, 1, 1,
0.7245145, -1.275133, 3.509116, 0.5137255, 0, 1, 1,
0.7258795, -0.9206536, 2.622001, 0.5176471, 0, 1, 1,
0.7281071, -0.2924081, 0.6991569, 0.5254902, 0, 1, 1,
0.7285395, 1.144058, 0.4588223, 0.5294118, 0, 1, 1,
0.7287105, 0.9038659, 0.2766615, 0.5372549, 0, 1, 1,
0.7300356, -0.8238522, 1.8395, 0.5411765, 0, 1, 1,
0.7363235, 0.4485791, -0.8052606, 0.5490196, 0, 1, 1,
0.7378481, -0.7721016, 2.603299, 0.5529412, 0, 1, 1,
0.7405235, 0.01537614, 0.9134511, 0.5607843, 0, 1, 1,
0.7442321, -1.92056, 2.470828, 0.5647059, 0, 1, 1,
0.7478365, -2.418495, 2.760415, 0.572549, 0, 1, 1,
0.7479997, 2.100433, 1.812209, 0.5764706, 0, 1, 1,
0.7493551, 0.1279004, 1.747125, 0.5843138, 0, 1, 1,
0.7520352, 1.656006, 1.113762, 0.5882353, 0, 1, 1,
0.7552355, 1.100407, 1.109124, 0.5960785, 0, 1, 1,
0.7554961, 0.08022718, 2.000684, 0.6039216, 0, 1, 1,
0.7564532, -1.889855, 2.637125, 0.6078432, 0, 1, 1,
0.7591623, -1.177366, 2.610209, 0.6156863, 0, 1, 1,
0.7657213, -0.9083629, 1.204971, 0.6196079, 0, 1, 1,
0.7665139, 0.5010495, -0.8329095, 0.627451, 0, 1, 1,
0.7684778, 1.082338, 2.181145, 0.6313726, 0, 1, 1,
0.7711545, -0.9711624, 1.670717, 0.6392157, 0, 1, 1,
0.7729775, 0.522123, -1.384605, 0.6431373, 0, 1, 1,
0.7733033, -0.3016255, 1.08978, 0.6509804, 0, 1, 1,
0.7736409, 1.042383, 0.5458685, 0.654902, 0, 1, 1,
0.7871577, -0.4364408, 2.359567, 0.6627451, 0, 1, 1,
0.7882128, -0.3133136, 2.817706, 0.6666667, 0, 1, 1,
0.7942888, -0.3304917, 1.698037, 0.6745098, 0, 1, 1,
0.8121054, 0.9791499, 0.7153858, 0.6784314, 0, 1, 1,
0.8129795, 0.2664727, 0.9965459, 0.6862745, 0, 1, 1,
0.8202398, 0.7997517, 0.152261, 0.6901961, 0, 1, 1,
0.8292515, 0.6688733, 0.8737081, 0.6980392, 0, 1, 1,
0.829474, -0.02663946, 0.9058028, 0.7058824, 0, 1, 1,
0.8381655, -0.04258017, 1.756948, 0.7098039, 0, 1, 1,
0.8385258, -0.497806, 1.530175, 0.7176471, 0, 1, 1,
0.8395395, 0.9317858, 0.5211586, 0.7215686, 0, 1, 1,
0.8464954, -0.6590847, 3.021627, 0.7294118, 0, 1, 1,
0.8497095, -1.512584, 1.589518, 0.7333333, 0, 1, 1,
0.8619791, 1.561368, 0.3631582, 0.7411765, 0, 1, 1,
0.8668617, 0.3029299, 0.9638639, 0.7450981, 0, 1, 1,
0.8798602, 0.3032021, 2.407627, 0.7529412, 0, 1, 1,
0.8801386, 0.01871815, 1.754328, 0.7568628, 0, 1, 1,
0.8801398, 1.476586, -0.4570782, 0.7647059, 0, 1, 1,
0.8804488, 0.4869111, 1.038865, 0.7686275, 0, 1, 1,
0.8875164, -0.9826809, 3.749053, 0.7764706, 0, 1, 1,
0.8907391, -0.4663557, 4.662849, 0.7803922, 0, 1, 1,
0.8916358, -0.4106512, 1.948046, 0.7882353, 0, 1, 1,
0.899525, -1.166007, 3.875107, 0.7921569, 0, 1, 1,
0.9115008, 0.2510318, 1.3523, 0.8, 0, 1, 1,
0.9122948, 0.6593915, 2.958787, 0.8078431, 0, 1, 1,
0.9129803, 1.670982, -0.9258801, 0.8117647, 0, 1, 1,
0.9150683, 1.259848, 0.2914787, 0.8196079, 0, 1, 1,
0.9202213, -0.9917828, 4.100787, 0.8235294, 0, 1, 1,
0.9238364, 0.3497546, -0.200107, 0.8313726, 0, 1, 1,
0.9246826, -0.3085788, 2.976617, 0.8352941, 0, 1, 1,
0.9265783, -1.619693, 1.633836, 0.8431373, 0, 1, 1,
0.9384636, -1.877064, 2.18428, 0.8470588, 0, 1, 1,
0.9393131, 0.3285233, 1.366482, 0.854902, 0, 1, 1,
0.941514, -0.2485877, -0.2794464, 0.8588235, 0, 1, 1,
0.9456781, -1.234504, 2.612533, 0.8666667, 0, 1, 1,
0.9464687, -2.245458, 4.668625, 0.8705882, 0, 1, 1,
0.9603103, -0.6541268, 2.007817, 0.8784314, 0, 1, 1,
0.9618449, -0.9908982, 1.15062, 0.8823529, 0, 1, 1,
0.9632285, 0.3828832, 1.900298, 0.8901961, 0, 1, 1,
0.9645442, 0.2815495, 0.2895164, 0.8941177, 0, 1, 1,
0.9650251, -0.147133, 1.382428, 0.9019608, 0, 1, 1,
0.9667438, -0.9895589, 1.906276, 0.9098039, 0, 1, 1,
0.9685957, -1.950835, 2.554639, 0.9137255, 0, 1, 1,
0.9706364, -1.331901, 2.180182, 0.9215686, 0, 1, 1,
0.9718097, -0.6133688, 2.35199, 0.9254902, 0, 1, 1,
0.9726216, -0.4611237, 2.029251, 0.9333333, 0, 1, 1,
0.973098, 0.3259594, -1.476098, 0.9372549, 0, 1, 1,
0.9751264, -0.130366, 1.244339, 0.945098, 0, 1, 1,
0.9769736, 0.2190262, 1.812966, 0.9490196, 0, 1, 1,
0.9805527, -0.7050616, 3.226831, 0.9568627, 0, 1, 1,
0.9811672, -0.3852112, -0.8998227, 0.9607843, 0, 1, 1,
0.9824764, -1.233652, 2.340954, 0.9686275, 0, 1, 1,
0.9856125, 1.092443, 1.244535, 0.972549, 0, 1, 1,
0.9862413, -0.1540694, 0.9376072, 0.9803922, 0, 1, 1,
0.9949684, -0.671571, 1.707523, 0.9843137, 0, 1, 1,
1.001203, 0.4396308, 1.370711, 0.9921569, 0, 1, 1,
1.00141, -0.4015192, 1.638931, 0.9960784, 0, 1, 1,
1.007035, -2.333467, 1.745173, 1, 0, 0.9960784, 1,
1.007331, -1.120037, 2.998536, 1, 0, 0.9882353, 1,
1.010011, -0.8653788, 3.841736, 1, 0, 0.9843137, 1,
1.017055, -0.5426421, 2.251017, 1, 0, 0.9764706, 1,
1.025216, -1.459132, 2.07442, 1, 0, 0.972549, 1,
1.033656, -0.4473359, 2.286437, 1, 0, 0.9647059, 1,
1.039505, -1.419533, 1.721718, 1, 0, 0.9607843, 1,
1.049686, -0.687917, 2.696591, 1, 0, 0.9529412, 1,
1.057701, 0.8196138, 1.422535, 1, 0, 0.9490196, 1,
1.060719, 0.7482471, 0.9568157, 1, 0, 0.9411765, 1,
1.067673, -0.8959169, 2.482386, 1, 0, 0.9372549, 1,
1.067838, -1.162364, 2.33681, 1, 0, 0.9294118, 1,
1.07964, 0.02468742, 0.8887301, 1, 0, 0.9254902, 1,
1.082411, 0.6069394, 2.358666, 1, 0, 0.9176471, 1,
1.088551, -1.648759, 1.19382, 1, 0, 0.9137255, 1,
1.090116, 0.8067167, 1.405598, 1, 0, 0.9058824, 1,
1.092399, -0.1916938, 1.424639, 1, 0, 0.9019608, 1,
1.098345, 0.04205041, 2.024501, 1, 0, 0.8941177, 1,
1.115197, -0.7064568, 1.558598, 1, 0, 0.8862745, 1,
1.123304, 0.3590668, 1.408518, 1, 0, 0.8823529, 1,
1.125127, 1.424862, -0.6032655, 1, 0, 0.8745098, 1,
1.128667, 0.08726898, 1.248292, 1, 0, 0.8705882, 1,
1.1293, 0.1467496, 1.604286, 1, 0, 0.8627451, 1,
1.130818, 0.3285753, 2.543072, 1, 0, 0.8588235, 1,
1.132471, -1.455317, 0.73203, 1, 0, 0.8509804, 1,
1.134353, 0.1684802, 0.2575946, 1, 0, 0.8470588, 1,
1.136371, 0.2890613, 2.232831, 1, 0, 0.8392157, 1,
1.142721, -0.9867711, 4.032101, 1, 0, 0.8352941, 1,
1.164364, 0.1300927, 1.261353, 1, 0, 0.827451, 1,
1.168992, -1.143763, 2.648435, 1, 0, 0.8235294, 1,
1.177037, 0.7240157, 1.757765, 1, 0, 0.8156863, 1,
1.180269, 0.8748053, -0.8418788, 1, 0, 0.8117647, 1,
1.180996, -1.217909, 2.936491, 1, 0, 0.8039216, 1,
1.181212, -0.9039847, 3.013289, 1, 0, 0.7960784, 1,
1.195832, 1.916487, 0.7806026, 1, 0, 0.7921569, 1,
1.200547, 1.860803, 0.04563459, 1, 0, 0.7843137, 1,
1.203681, 1.016319, -0.7034613, 1, 0, 0.7803922, 1,
1.204368, -0.09717409, 1.425153, 1, 0, 0.772549, 1,
1.205314, 0.5160224, 2.299452, 1, 0, 0.7686275, 1,
1.208403, -2.080876, 4.083908, 1, 0, 0.7607843, 1,
1.22655, -1.834008, 4.108562, 1, 0, 0.7568628, 1,
1.228732, 0.644978, 1.624933, 1, 0, 0.7490196, 1,
1.229003, -0.978207, 3.185886, 1, 0, 0.7450981, 1,
1.254782, 0.1887101, 0.2754749, 1, 0, 0.7372549, 1,
1.258067, -0.9635275, 2.541665, 1, 0, 0.7333333, 1,
1.260142, -0.6955059, 2.665017, 1, 0, 0.7254902, 1,
1.265912, -0.4766833, 1.847601, 1, 0, 0.7215686, 1,
1.279937, 0.4313919, 1.012992, 1, 0, 0.7137255, 1,
1.287921, -0.3252407, 2.815315, 1, 0, 0.7098039, 1,
1.289353, 1.358808, 1.897681, 1, 0, 0.7019608, 1,
1.289949, 0.6605604, 1.166685, 1, 0, 0.6941177, 1,
1.296035, -1.992648, 4.184895, 1, 0, 0.6901961, 1,
1.29744, 0.189276, 2.243916, 1, 0, 0.682353, 1,
1.312161, -0.9547238, 2.242034, 1, 0, 0.6784314, 1,
1.316966, -0.01451783, 0.7540051, 1, 0, 0.6705883, 1,
1.318316, -1.209396, 3.801715, 1, 0, 0.6666667, 1,
1.319272, -0.9113669, 1.460602, 1, 0, 0.6588235, 1,
1.32126, 1.170351, -1.073704, 1, 0, 0.654902, 1,
1.328457, 0.6097009, 1.475709, 1, 0, 0.6470588, 1,
1.338057, 1.30658, 1.418019, 1, 0, 0.6431373, 1,
1.33998, -0.827827, 2.37037, 1, 0, 0.6352941, 1,
1.349523, 0.4010603, -0.561226, 1, 0, 0.6313726, 1,
1.35114, -0.4814089, 4.416759, 1, 0, 0.6235294, 1,
1.351255, -1.645264, 1.318054, 1, 0, 0.6196079, 1,
1.36808, -0.4393581, 3.390101, 1, 0, 0.6117647, 1,
1.380722, -0.3342201, 1.9925, 1, 0, 0.6078432, 1,
1.381954, 0.7606821, -0.408857, 1, 0, 0.6, 1,
1.38888, 0.5606887, 1.201237, 1, 0, 0.5921569, 1,
1.402411, -0.1376998, 1.839481, 1, 0, 0.5882353, 1,
1.412492, 0.08090013, -0.09930093, 1, 0, 0.5803922, 1,
1.425281, 0.373312, 0.6533625, 1, 0, 0.5764706, 1,
1.429169, -0.6047987, 1.922625, 1, 0, 0.5686275, 1,
1.430526, -0.9959459, 2.492114, 1, 0, 0.5647059, 1,
1.432607, 1.735146, 1.641903, 1, 0, 0.5568628, 1,
1.437003, 1.850535, -0.285533, 1, 0, 0.5529412, 1,
1.448697, -0.2544327, 3.223938, 1, 0, 0.5450981, 1,
1.452406, 0.4736172, 2.392376, 1, 0, 0.5411765, 1,
1.459015, -0.5335574, 0.8075355, 1, 0, 0.5333334, 1,
1.465481, 0.1284891, 0.5699195, 1, 0, 0.5294118, 1,
1.485562, 0.9134804, 0.5604959, 1, 0, 0.5215687, 1,
1.489879, 0.8608302, -0.6963542, 1, 0, 0.5176471, 1,
1.495296, -0.9988248, 2.723137, 1, 0, 0.509804, 1,
1.518644, -0.003292212, 1.3002, 1, 0, 0.5058824, 1,
1.544491, -0.6144623, 2.918017, 1, 0, 0.4980392, 1,
1.552492, -0.691808, 0.7669355, 1, 0, 0.4901961, 1,
1.563291, -0.341528, 0.8625954, 1, 0, 0.4862745, 1,
1.568027, -0.4096495, -0.05895421, 1, 0, 0.4784314, 1,
1.569439, 0.1298163, 0.5766044, 1, 0, 0.4745098, 1,
1.581381, 0.6658801, 2.165435, 1, 0, 0.4666667, 1,
1.589156, -1.237129, 1.527847, 1, 0, 0.4627451, 1,
1.598186, -0.02324073, 2.78413, 1, 0, 0.454902, 1,
1.600128, 1.617801, 1.116376, 1, 0, 0.4509804, 1,
1.613012, 0.7880743, 2.017774, 1, 0, 0.4431373, 1,
1.628743, 0.9969904, -0.1637355, 1, 0, 0.4392157, 1,
1.630749, 1.5406, 1.171095, 1, 0, 0.4313726, 1,
1.637678, -1.750455, 3.058367, 1, 0, 0.427451, 1,
1.662762, -0.3174671, 2.231185, 1, 0, 0.4196078, 1,
1.664864, -0.402577, 2.581261, 1, 0, 0.4156863, 1,
1.666668, -1.182582, -0.3603821, 1, 0, 0.4078431, 1,
1.66688, 0.3769958, 1.596869, 1, 0, 0.4039216, 1,
1.672741, 1.042119, 0.6517916, 1, 0, 0.3960784, 1,
1.690461, 0.08307406, 2.570377, 1, 0, 0.3882353, 1,
1.692123, -0.3353966, 1.815736, 1, 0, 0.3843137, 1,
1.698328, -1.217508, 2.363503, 1, 0, 0.3764706, 1,
1.701319, 0.3262023, 0.7868207, 1, 0, 0.372549, 1,
1.701612, -1.321193, 2.010999, 1, 0, 0.3647059, 1,
1.705684, 0.4756961, 0.2798321, 1, 0, 0.3607843, 1,
1.705848, -0.7148687, 2.914371, 1, 0, 0.3529412, 1,
1.706822, -1.127683, 3.68498, 1, 0, 0.3490196, 1,
1.71322, -1.677034, 2.401672, 1, 0, 0.3411765, 1,
1.725834, -0.7636889, 1.465901, 1, 0, 0.3372549, 1,
1.729804, -0.07457416, 1.255171, 1, 0, 0.3294118, 1,
1.742812, 1.56388, 1.630031, 1, 0, 0.3254902, 1,
1.752691, 0.05088511, 2.636695, 1, 0, 0.3176471, 1,
1.759451, -1.256066, 0.9910301, 1, 0, 0.3137255, 1,
1.763808, -0.888187, -0.1737787, 1, 0, 0.3058824, 1,
1.767332, 2.442694, 0.6466876, 1, 0, 0.2980392, 1,
1.768181, -0.9148123, 1.549064, 1, 0, 0.2941177, 1,
1.774669, 1.198535, -0.0770904, 1, 0, 0.2862745, 1,
1.801723, 0.7294709, 1.788942, 1, 0, 0.282353, 1,
1.803206, 0.08169154, 3.421186, 1, 0, 0.2745098, 1,
1.836277, 1.129658, 0.8989583, 1, 0, 0.2705882, 1,
1.843717, 0.5201519, -0.2653457, 1, 0, 0.2627451, 1,
1.850758, -0.4040522, 1.411412, 1, 0, 0.2588235, 1,
1.858111, 1.458943, 0.8932077, 1, 0, 0.2509804, 1,
1.867756, -0.2005074, 1.324465, 1, 0, 0.2470588, 1,
1.873477, -1.256142, 1.112547, 1, 0, 0.2392157, 1,
1.87697, -0.8968507, 0.7572753, 1, 0, 0.2352941, 1,
1.878735, -0.4442498, 0.9590984, 1, 0, 0.227451, 1,
1.878804, 0.1634323, 0.3605596, 1, 0, 0.2235294, 1,
1.902287, -1.280651, 3.399473, 1, 0, 0.2156863, 1,
1.902331, 0.3088043, 1.530111, 1, 0, 0.2117647, 1,
1.903453, -0.1449047, 1.100402, 1, 0, 0.2039216, 1,
1.903682, 0.1787276, 0.9769654, 1, 0, 0.1960784, 1,
1.913401, -0.2641484, 0.6299365, 1, 0, 0.1921569, 1,
1.941503, 1.26361, 1.312574, 1, 0, 0.1843137, 1,
1.952248, -0.7331023, 2.096415, 1, 0, 0.1803922, 1,
1.968266, -0.04168948, 0.6344405, 1, 0, 0.172549, 1,
2.004424, -1.85232, 0.8319755, 1, 0, 0.1686275, 1,
2.006198, 0.004410956, 2.005114, 1, 0, 0.1607843, 1,
2.008662, -0.4886739, 2.163566, 1, 0, 0.1568628, 1,
2.036103, -0.8529612, 3.81977, 1, 0, 0.1490196, 1,
2.039394, 0.4298854, 0.8531711, 1, 0, 0.145098, 1,
2.052346, 1.100999, 1.045311, 1, 0, 0.1372549, 1,
2.056064, -0.4526307, 0.7200932, 1, 0, 0.1333333, 1,
2.076993, 1.044271, 2.005704, 1, 0, 0.1254902, 1,
2.077205, 2.013271, 0.3124869, 1, 0, 0.1215686, 1,
2.12031, 0.07392939, -0.6036482, 1, 0, 0.1137255, 1,
2.125288, -0.7560467, 2.483074, 1, 0, 0.1098039, 1,
2.127475, -0.4114224, 3.13862, 1, 0, 0.1019608, 1,
2.145945, -0.6614109, 1.201456, 1, 0, 0.09411765, 1,
2.170111, -0.9733045, 3.429109, 1, 0, 0.09019608, 1,
2.202198, 0.5259215, 1.685502, 1, 0, 0.08235294, 1,
2.241593, 1.469562, 0.1188575, 1, 0, 0.07843138, 1,
2.274515, -1.889637, 1.530643, 1, 0, 0.07058824, 1,
2.339945, 0.6154237, 1.430778, 1, 0, 0.06666667, 1,
2.36149, 0.8064996, 1.198766, 1, 0, 0.05882353, 1,
2.388633, 0.3706883, 1.142158, 1, 0, 0.05490196, 1,
2.407889, 1.066106, 1.234047, 1, 0, 0.04705882, 1,
2.546541, -0.56598, 0.564077, 1, 0, 0.04313726, 1,
2.570156, 0.9162346, 1.474486, 1, 0, 0.03529412, 1,
2.585625, 1.544331, 0.5488966, 1, 0, 0.03137255, 1,
2.624114, 0.01513488, -0.4017484, 1, 0, 0.02352941, 1,
2.756209, -0.03516563, 0.5203958, 1, 0, 0.01960784, 1,
2.792938, -1.245534, 1.900055, 1, 0, 0.01176471, 1,
2.912367, 0.2539575, 2.960478, 1, 0, 0.007843138, 1
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
-0.3453789, -4.693814, -7.07673, 0, -0.5, 0.5, 0.5,
-0.3453789, -4.693814, -7.07673, 1, -0.5, 0.5, 0.5,
-0.3453789, -4.693814, -7.07673, 1, 1.5, 0.5, 0.5,
-0.3453789, -4.693814, -7.07673, 0, 1.5, 0.5, 0.5
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
-4.7075, -0.2642214, -7.07673, 0, -0.5, 0.5, 0.5,
-4.7075, -0.2642214, -7.07673, 1, -0.5, 0.5, 0.5,
-4.7075, -0.2642214, -7.07673, 1, 1.5, 0.5, 0.5,
-4.7075, -0.2642214, -7.07673, 0, 1.5, 0.5, 0.5
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
-4.7075, -4.693814, 0.3064682, 0, -0.5, 0.5, 0.5,
-4.7075, -4.693814, 0.3064682, 1, -0.5, 0.5, 0.5,
-4.7075, -4.693814, 0.3064682, 1, 1.5, 0.5, 0.5,
-4.7075, -4.693814, 0.3064682, 0, 1.5, 0.5, 0.5
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
-3, -3.6716, -5.372915,
2, -3.6716, -5.372915,
-3, -3.6716, -5.372915,
-3, -3.841969, -5.656884,
-2, -3.6716, -5.372915,
-2, -3.841969, -5.656884,
-1, -3.6716, -5.372915,
-1, -3.841969, -5.656884,
0, -3.6716, -5.372915,
0, -3.841969, -5.656884,
1, -3.6716, -5.372915,
1, -3.841969, -5.656884,
2, -3.6716, -5.372915,
2, -3.841969, -5.656884
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
-3, -4.182707, -6.224823, 0, -0.5, 0.5, 0.5,
-3, -4.182707, -6.224823, 1, -0.5, 0.5, 0.5,
-3, -4.182707, -6.224823, 1, 1.5, 0.5, 0.5,
-3, -4.182707, -6.224823, 0, 1.5, 0.5, 0.5,
-2, -4.182707, -6.224823, 0, -0.5, 0.5, 0.5,
-2, -4.182707, -6.224823, 1, -0.5, 0.5, 0.5,
-2, -4.182707, -6.224823, 1, 1.5, 0.5, 0.5,
-2, -4.182707, -6.224823, 0, 1.5, 0.5, 0.5,
-1, -4.182707, -6.224823, 0, -0.5, 0.5, 0.5,
-1, -4.182707, -6.224823, 1, -0.5, 0.5, 0.5,
-1, -4.182707, -6.224823, 1, 1.5, 0.5, 0.5,
-1, -4.182707, -6.224823, 0, 1.5, 0.5, 0.5,
0, -4.182707, -6.224823, 0, -0.5, 0.5, 0.5,
0, -4.182707, -6.224823, 1, -0.5, 0.5, 0.5,
0, -4.182707, -6.224823, 1, 1.5, 0.5, 0.5,
0, -4.182707, -6.224823, 0, 1.5, 0.5, 0.5,
1, -4.182707, -6.224823, 0, -0.5, 0.5, 0.5,
1, -4.182707, -6.224823, 1, -0.5, 0.5, 0.5,
1, -4.182707, -6.224823, 1, 1.5, 0.5, 0.5,
1, -4.182707, -6.224823, 0, 1.5, 0.5, 0.5,
2, -4.182707, -6.224823, 0, -0.5, 0.5, 0.5,
2, -4.182707, -6.224823, 1, -0.5, 0.5, 0.5,
2, -4.182707, -6.224823, 1, 1.5, 0.5, 0.5,
2, -4.182707, -6.224823, 0, 1.5, 0.5, 0.5
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
-3.700857, -3, -5.372915,
-3.700857, 3, -5.372915,
-3.700857, -3, -5.372915,
-3.868631, -3, -5.656884,
-3.700857, -2, -5.372915,
-3.868631, -2, -5.656884,
-3.700857, -1, -5.372915,
-3.868631, -1, -5.656884,
-3.700857, 0, -5.372915,
-3.868631, 0, -5.656884,
-3.700857, 1, -5.372915,
-3.868631, 1, -5.656884,
-3.700857, 2, -5.372915,
-3.868631, 2, -5.656884,
-3.700857, 3, -5.372915,
-3.868631, 3, -5.656884
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
-4.204178, -3, -6.224823, 0, -0.5, 0.5, 0.5,
-4.204178, -3, -6.224823, 1, -0.5, 0.5, 0.5,
-4.204178, -3, -6.224823, 1, 1.5, 0.5, 0.5,
-4.204178, -3, -6.224823, 0, 1.5, 0.5, 0.5,
-4.204178, -2, -6.224823, 0, -0.5, 0.5, 0.5,
-4.204178, -2, -6.224823, 1, -0.5, 0.5, 0.5,
-4.204178, -2, -6.224823, 1, 1.5, 0.5, 0.5,
-4.204178, -2, -6.224823, 0, 1.5, 0.5, 0.5,
-4.204178, -1, -6.224823, 0, -0.5, 0.5, 0.5,
-4.204178, -1, -6.224823, 1, -0.5, 0.5, 0.5,
-4.204178, -1, -6.224823, 1, 1.5, 0.5, 0.5,
-4.204178, -1, -6.224823, 0, 1.5, 0.5, 0.5,
-4.204178, 0, -6.224823, 0, -0.5, 0.5, 0.5,
-4.204178, 0, -6.224823, 1, -0.5, 0.5, 0.5,
-4.204178, 0, -6.224823, 1, 1.5, 0.5, 0.5,
-4.204178, 0, -6.224823, 0, 1.5, 0.5, 0.5,
-4.204178, 1, -6.224823, 0, -0.5, 0.5, 0.5,
-4.204178, 1, -6.224823, 1, -0.5, 0.5, 0.5,
-4.204178, 1, -6.224823, 1, 1.5, 0.5, 0.5,
-4.204178, 1, -6.224823, 0, 1.5, 0.5, 0.5,
-4.204178, 2, -6.224823, 0, -0.5, 0.5, 0.5,
-4.204178, 2, -6.224823, 1, -0.5, 0.5, 0.5,
-4.204178, 2, -6.224823, 1, 1.5, 0.5, 0.5,
-4.204178, 2, -6.224823, 0, 1.5, 0.5, 0.5,
-4.204178, 3, -6.224823, 0, -0.5, 0.5, 0.5,
-4.204178, 3, -6.224823, 1, -0.5, 0.5, 0.5,
-4.204178, 3, -6.224823, 1, 1.5, 0.5, 0.5,
-4.204178, 3, -6.224823, 0, 1.5, 0.5, 0.5
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
-3.700857, -3.6716, -4,
-3.700857, -3.6716, 4,
-3.700857, -3.6716, -4,
-3.868631, -3.841969, -4,
-3.700857, -3.6716, -2,
-3.868631, -3.841969, -2,
-3.700857, -3.6716, 0,
-3.868631, -3.841969, 0,
-3.700857, -3.6716, 2,
-3.868631, -3.841969, 2,
-3.700857, -3.6716, 4,
-3.868631, -3.841969, 4
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
-4.204178, -4.182707, -4, 0, -0.5, 0.5, 0.5,
-4.204178, -4.182707, -4, 1, -0.5, 0.5, 0.5,
-4.204178, -4.182707, -4, 1, 1.5, 0.5, 0.5,
-4.204178, -4.182707, -4, 0, 1.5, 0.5, 0.5,
-4.204178, -4.182707, -2, 0, -0.5, 0.5, 0.5,
-4.204178, -4.182707, -2, 1, -0.5, 0.5, 0.5,
-4.204178, -4.182707, -2, 1, 1.5, 0.5, 0.5,
-4.204178, -4.182707, -2, 0, 1.5, 0.5, 0.5,
-4.204178, -4.182707, 0, 0, -0.5, 0.5, 0.5,
-4.204178, -4.182707, 0, 1, -0.5, 0.5, 0.5,
-4.204178, -4.182707, 0, 1, 1.5, 0.5, 0.5,
-4.204178, -4.182707, 0, 0, 1.5, 0.5, 0.5,
-4.204178, -4.182707, 2, 0, -0.5, 0.5, 0.5,
-4.204178, -4.182707, 2, 1, -0.5, 0.5, 0.5,
-4.204178, -4.182707, 2, 1, 1.5, 0.5, 0.5,
-4.204178, -4.182707, 2, 0, 1.5, 0.5, 0.5,
-4.204178, -4.182707, 4, 0, -0.5, 0.5, 0.5,
-4.204178, -4.182707, 4, 1, -0.5, 0.5, 0.5,
-4.204178, -4.182707, 4, 1, 1.5, 0.5, 0.5,
-4.204178, -4.182707, 4, 0, 1.5, 0.5, 0.5
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
-3.700857, -3.6716, -5.372915,
-3.700857, 3.143157, -5.372915,
-3.700857, -3.6716, 5.985852,
-3.700857, 3.143157, 5.985852,
-3.700857, -3.6716, -5.372915,
-3.700857, -3.6716, 5.985852,
-3.700857, 3.143157, -5.372915,
-3.700857, 3.143157, 5.985852,
-3.700857, -3.6716, -5.372915,
3.010099, -3.6716, -5.372915,
-3.700857, -3.6716, 5.985852,
3.010099, -3.6716, 5.985852,
-3.700857, 3.143157, -5.372915,
3.010099, 3.143157, -5.372915,
-3.700857, 3.143157, 5.985852,
3.010099, 3.143157, 5.985852,
3.010099, -3.6716, -5.372915,
3.010099, 3.143157, -5.372915,
3.010099, -3.6716, 5.985852,
3.010099, 3.143157, 5.985852,
3.010099, -3.6716, -5.372915,
3.010099, -3.6716, 5.985852,
3.010099, 3.143157, -5.372915,
3.010099, 3.143157, 5.985852
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
var radius = 7.929197;
var distance = 35.27789;
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
mvMatrix.translate( 0.3453789, 0.2642214, -0.3064682 );
mvMatrix.scale( 1.277494, 1.258035, 0.7547653 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.27789);
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
triflusulfuron-methy<-read.table("triflusulfuron-methy.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-triflusulfuron-methy$V2
```

```
## Error in eval(expr, envir, enclos): object 'triflusulfuron' not found
```

```r
y<-triflusulfuron-methy$V3
```

```
## Error in eval(expr, envir, enclos): object 'triflusulfuron' not found
```

```r
z<-triflusulfuron-methy$V4
```

```
## Error in eval(expr, envir, enclos): object 'triflusulfuron' not found
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
-3.603124, 0.5462111, -3.225044, 0, 0, 1, 1, 1,
-2.996315, 0.005484612, -2.404032, 1, 0, 0, 1, 1,
-2.949426, 1.46422, -0.2538886, 1, 0, 0, 1, 1,
-2.938678, -0.7073947, -3.063873, 1, 0, 0, 1, 1,
-2.85002, 0.1096433, -0.1554214, 1, 0, 0, 1, 1,
-2.70112, -0.68235, -0.5334786, 1, 0, 0, 1, 1,
-2.690669, 0.9398476, -2.695554, 0, 0, 0, 1, 1,
-2.437691, 0.335815, -1.725501, 0, 0, 0, 1, 1,
-2.382849, 0.1378851, -1.609139, 0, 0, 0, 1, 1,
-2.327484, -0.3089911, -3.288617, 0, 0, 0, 1, 1,
-2.294603, -0.3948282, -0.9994439, 0, 0, 0, 1, 1,
-2.276383, 1.106908, -1.944352, 0, 0, 0, 1, 1,
-2.254531, -0.003563475, -1.441213, 0, 0, 0, 1, 1,
-2.215072, 0.17992, -1.626908, 1, 1, 1, 1, 1,
-2.207185, 0.8499857, -1.661115, 1, 1, 1, 1, 1,
-2.204654, -0.3356855, -1.653339, 1, 1, 1, 1, 1,
-2.19935, -0.1950739, -3.372195, 1, 1, 1, 1, 1,
-2.177393, -1.090368, -2.181782, 1, 1, 1, 1, 1,
-2.168443, 2.305456, -1.874394, 1, 1, 1, 1, 1,
-2.147597, 0.3678903, 0.04312522, 1, 1, 1, 1, 1,
-2.146383, 2.519824, -1.485084, 1, 1, 1, 1, 1,
-2.11379, 0.1983762, 1.337435, 1, 1, 1, 1, 1,
-2.057579, 1.058275, -0.04692874, 1, 1, 1, 1, 1,
-2.030396, -0.3522985, -2.203441, 1, 1, 1, 1, 1,
-2.014086, 0.05797374, -0.7890961, 1, 1, 1, 1, 1,
-1.995186, -1.723796, -0.5434664, 1, 1, 1, 1, 1,
-1.989509, -0.03768063, -2.344667, 1, 1, 1, 1, 1,
-1.981191, -0.5983509, -0.09401216, 1, 1, 1, 1, 1,
-1.959767, 0.9195231, 0.06704918, 0, 0, 1, 1, 1,
-1.921889, -0.2227948, 0.1883344, 1, 0, 0, 1, 1,
-1.911871, -0.5667624, -2.015561, 1, 0, 0, 1, 1,
-1.903941, -1.114388, -1.824885, 1, 0, 0, 1, 1,
-1.887563, -0.4817114, -1.246102, 1, 0, 0, 1, 1,
-1.875356, 1.127993, -2.015242, 1, 0, 0, 1, 1,
-1.862515, 0.2575444, 0.1066176, 0, 0, 0, 1, 1,
-1.847033, 0.1350467, -0.9222618, 0, 0, 0, 1, 1,
-1.842654, -1.157534, -2.45373, 0, 0, 0, 1, 1,
-1.835766, 0.7791169, -2.757064, 0, 0, 0, 1, 1,
-1.822996, 0.8957259, 1.1002, 0, 0, 0, 1, 1,
-1.809426, 0.2410049, -1.806103, 0, 0, 0, 1, 1,
-1.789225, 0.506618, -1.306721, 0, 0, 0, 1, 1,
-1.755776, 0.758737, -1.805704, 1, 1, 1, 1, 1,
-1.738947, 0.8427473, -2.225881, 1, 1, 1, 1, 1,
-1.724817, -0.9491012, -2.573549, 1, 1, 1, 1, 1,
-1.71942, 0.6161722, -0.5987269, 1, 1, 1, 1, 1,
-1.707715, -0.2333657, -2.79297, 1, 1, 1, 1, 1,
-1.679226, 1.204881, -1.644174, 1, 1, 1, 1, 1,
-1.670186, -0.4087695, -1.868609, 1, 1, 1, 1, 1,
-1.666673, -0.08471269, -1.433681, 1, 1, 1, 1, 1,
-1.662688, 0.1046594, -1.926899, 1, 1, 1, 1, 1,
-1.653901, -0.7626373, -1.996436, 1, 1, 1, 1, 1,
-1.63817, -0.4093474, 0.02272416, 1, 1, 1, 1, 1,
-1.637045, -2.185728, -2.803333, 1, 1, 1, 1, 1,
-1.629204, -0.7255979, -2.372709, 1, 1, 1, 1, 1,
-1.611539, 1.47165, 0.3622812, 1, 1, 1, 1, 1,
-1.600933, 0.3935361, -0.8875028, 1, 1, 1, 1, 1,
-1.598198, -1.10797, -3.355488, 0, 0, 1, 1, 1,
-1.595485, 0.8584862, -0.9322643, 1, 0, 0, 1, 1,
-1.590132, -0.2399792, -0.0866496, 1, 0, 0, 1, 1,
-1.585535, 0.6488273, -1.741037, 1, 0, 0, 1, 1,
-1.585133, 0.8760615, 0.2518785, 1, 0, 0, 1, 1,
-1.581669, -0.6870113, -3.747433, 1, 0, 0, 1, 1,
-1.58118, 0.07100166, -1.57459, 0, 0, 0, 1, 1,
-1.579535, 0.7272266, -0.03751722, 0, 0, 0, 1, 1,
-1.574025, -0.6477221, -3.402924, 0, 0, 0, 1, 1,
-1.567891, 1.859725, -0.7531611, 0, 0, 0, 1, 1,
-1.566063, 1.534281, -0.892648, 0, 0, 0, 1, 1,
-1.563798, -0.2026911, -0.2152297, 0, 0, 0, 1, 1,
-1.556601, 2.503058, 0.8831196, 0, 0, 0, 1, 1,
-1.548348, -0.1649487, -0.9115988, 1, 1, 1, 1, 1,
-1.537542, -0.8831041, -0.9590557, 1, 1, 1, 1, 1,
-1.533966, 0.3963114, 1.25569, 1, 1, 1, 1, 1,
-1.524366, -1.610835, -3.028663, 1, 1, 1, 1, 1,
-1.519874, -1.210981, -2.092456, 1, 1, 1, 1, 1,
-1.518959, -0.9054141, -1.728052, 1, 1, 1, 1, 1,
-1.516226, -0.07025977, -1.566946, 1, 1, 1, 1, 1,
-1.512409, 1.00266, -0.2493306, 1, 1, 1, 1, 1,
-1.507043, 0.1625164, -0.7481631, 1, 1, 1, 1, 1,
-1.499902, 0.2008092, -1.085833, 1, 1, 1, 1, 1,
-1.497334, -1.960547, -0.8353815, 1, 1, 1, 1, 1,
-1.492845, 0.4129075, -2.784073, 1, 1, 1, 1, 1,
-1.481229, 0.08400067, -2.209526, 1, 1, 1, 1, 1,
-1.480907, -1.063594, -1.408359, 1, 1, 1, 1, 1,
-1.478506, 0.6958151, -1.447245, 1, 1, 1, 1, 1,
-1.47465, 0.8702773, -1.286323, 0, 0, 1, 1, 1,
-1.466498, -1.698595, -1.733237, 1, 0, 0, 1, 1,
-1.463938, 0.202002, 1.021416, 1, 0, 0, 1, 1,
-1.460753, 0.4654121, -0.8008718, 1, 0, 0, 1, 1,
-1.45919, 0.7496922, -1.599985, 1, 0, 0, 1, 1,
-1.456939, -0.1974314, -1.274937, 1, 0, 0, 1, 1,
-1.425562, 1.916229, -2.964415, 0, 0, 0, 1, 1,
-1.423429, -0.06071276, -2.86154, 0, 0, 0, 1, 1,
-1.417432, -0.5189334, -2.255498, 0, 0, 0, 1, 1,
-1.40451, 1.112257, -0.2401784, 0, 0, 0, 1, 1,
-1.399515, -0.2825416, -1.985576, 0, 0, 0, 1, 1,
-1.395939, -0.03080285, -2.475142, 0, 0, 0, 1, 1,
-1.393319, 0.2219188, -0.1634659, 0, 0, 0, 1, 1,
-1.386368, 0.4433342, 0.3750403, 1, 1, 1, 1, 1,
-1.365963, -0.01435096, -2.092131, 1, 1, 1, 1, 1,
-1.360492, -0.312324, -2.422236, 1, 1, 1, 1, 1,
-1.358975, -2.731627, -3.00537, 1, 1, 1, 1, 1,
-1.35802, -0.957072, -0.4798035, 1, 1, 1, 1, 1,
-1.357391, 0.03123868, -1.853626, 1, 1, 1, 1, 1,
-1.355425, 0.4431014, -2.111117, 1, 1, 1, 1, 1,
-1.339301, -0.3170418, -3.368126, 1, 1, 1, 1, 1,
-1.336165, -0.8762685, -1.679976, 1, 1, 1, 1, 1,
-1.32571, 0.1976898, 0.2791966, 1, 1, 1, 1, 1,
-1.320108, -0.09156881, 0.4106605, 1, 1, 1, 1, 1,
-1.319406, 0.3719611, -0.2782177, 1, 1, 1, 1, 1,
-1.319312, 0.354594, -0.2977938, 1, 1, 1, 1, 1,
-1.312291, 0.4983005, -3.62213, 1, 1, 1, 1, 1,
-1.30712, -0.2800663, -1.020172, 1, 1, 1, 1, 1,
-1.298665, -0.5904826, -1.929608, 0, 0, 1, 1, 1,
-1.289983, -1.031087, -0.1483211, 1, 0, 0, 1, 1,
-1.289656, 0.7575222, -1.422531, 1, 0, 0, 1, 1,
-1.288085, -0.9218791, -1.557144, 1, 0, 0, 1, 1,
-1.284304, 1.255624, -1.209102, 1, 0, 0, 1, 1,
-1.273782, -0.4048132, -0.9916677, 1, 0, 0, 1, 1,
-1.260707, -0.09853189, -2.651697, 0, 0, 0, 1, 1,
-1.257115, 1.026736, -0.9649116, 0, 0, 0, 1, 1,
-1.242169, 0.2322495, 0.1966332, 0, 0, 0, 1, 1,
-1.237283, -0.281371, -0.3942173, 0, 0, 0, 1, 1,
-1.233791, 0.4712627, -3.13501, 0, 0, 0, 1, 1,
-1.228026, -0.2855418, -1.477604, 0, 0, 0, 1, 1,
-1.201808, -0.4050671, -3.410951, 0, 0, 0, 1, 1,
-1.200721, 0.1872482, -2.253471, 1, 1, 1, 1, 1,
-1.200521, -1.240894, -2.779553, 1, 1, 1, 1, 1,
-1.194799, -0.167593, -3.726707, 1, 1, 1, 1, 1,
-1.193455, -1.852871, -2.799517, 1, 1, 1, 1, 1,
-1.187706, 1.506069, -2.597939, 1, 1, 1, 1, 1,
-1.185935, -1.133336, -3.888652, 1, 1, 1, 1, 1,
-1.180882, 0.01829266, -2.041175, 1, 1, 1, 1, 1,
-1.176207, 0.6881736, -0.665826, 1, 1, 1, 1, 1,
-1.166691, 1.272133, -0.8433408, 1, 1, 1, 1, 1,
-1.165205, 0.5434274, -0.7070873, 1, 1, 1, 1, 1,
-1.164657, 1.569354, -0.4745742, 1, 1, 1, 1, 1,
-1.157747, -0.7258351, -0.4536852, 1, 1, 1, 1, 1,
-1.157202, -0.3565542, -2.548496, 1, 1, 1, 1, 1,
-1.155185, -0.116428, -0.6203662, 1, 1, 1, 1, 1,
-1.154263, 0.8911686, -2.315951, 1, 1, 1, 1, 1,
-1.151352, -0.8659239, -2.432239, 0, 0, 1, 1, 1,
-1.149485, -1.55874, -1.559232, 1, 0, 0, 1, 1,
-1.147581, 0.07766237, 0.02129388, 1, 0, 0, 1, 1,
-1.12818, -0.1695332, -2.701052, 1, 0, 0, 1, 1,
-1.127313, -1.55802, -4.426233, 1, 0, 0, 1, 1,
-1.116899, -1.253514, -3.365835, 1, 0, 0, 1, 1,
-1.113102, -0.3981426, -1.810908, 0, 0, 0, 1, 1,
-1.112831, -0.6984703, -2.229227, 0, 0, 0, 1, 1,
-1.108252, -0.09108938, -2.198432, 0, 0, 0, 1, 1,
-1.094712, 0.9376237, -0.09012877, 0, 0, 0, 1, 1,
-1.090831, 1.143001, -1.493907, 0, 0, 0, 1, 1,
-1.08734, 2.030788, 1.104226, 0, 0, 0, 1, 1,
-1.087134, 0.6562232, -1.952061, 0, 0, 0, 1, 1,
-1.08222, -1.095531, -3.026101, 1, 1, 1, 1, 1,
-1.081719, 0.7642986, -1.347772, 1, 1, 1, 1, 1,
-1.079827, 0.2062854, -1.507781, 1, 1, 1, 1, 1,
-1.079417, 1.228583, -2.552782, 1, 1, 1, 1, 1,
-1.064009, -1.777908, -4.365365, 1, 1, 1, 1, 1,
-1.062712, -0.2467212, -1.491958, 1, 1, 1, 1, 1,
-1.059214, -0.1840816, -2.846183, 1, 1, 1, 1, 1,
-1.050112, -1.744865, -3.35208, 1, 1, 1, 1, 1,
-1.035957, 0.8212353, -0.002110775, 1, 1, 1, 1, 1,
-1.031491, -1.082381, -2.550552, 1, 1, 1, 1, 1,
-1.025599, 1.069849, -1.587784, 1, 1, 1, 1, 1,
-1.017224, 0.7000901, -1.261057, 1, 1, 1, 1, 1,
-1.015749, -0.1234588, -1.889649, 1, 1, 1, 1, 1,
-1.014502, -1.07947, -1.632426, 1, 1, 1, 1, 1,
-0.9900068, -0.4411511, -0.5951937, 1, 1, 1, 1, 1,
-0.9895535, -1.12854, -3.481482, 0, 0, 1, 1, 1,
-0.9888158, 1.103831, -1.714986, 1, 0, 0, 1, 1,
-0.9866751, 0.2442038, 0.7267531, 1, 0, 0, 1, 1,
-0.9848328, -0.6307677, -2.034134, 1, 0, 0, 1, 1,
-0.971946, 0.9584603, -0.8422146, 1, 0, 0, 1, 1,
-0.9709133, -0.8739511, -2.584151, 1, 0, 0, 1, 1,
-0.9652076, 0.1669433, -0.4655678, 0, 0, 0, 1, 1,
-0.9634241, -1.178999, -1.546075, 0, 0, 0, 1, 1,
-0.9628164, 1.003835, -0.1148475, 0, 0, 0, 1, 1,
-0.9622086, 0.4192058, 0.4224014, 0, 0, 0, 1, 1,
-0.9566064, 1.236021, -1.240011, 0, 0, 0, 1, 1,
-0.9531895, -0.4354218, -0.09111405, 0, 0, 0, 1, 1,
-0.9527279, 0.2871251, -0.5862443, 0, 0, 0, 1, 1,
-0.9503571, -0.7761702, -3.228489, 1, 1, 1, 1, 1,
-0.9468261, 0.2580962, -1.123871, 1, 1, 1, 1, 1,
-0.9339179, -0.2772674, -2.248469, 1, 1, 1, 1, 1,
-0.9283153, 0.8194939, -1.450697, 1, 1, 1, 1, 1,
-0.9207202, -0.6675332, -0.9456559, 1, 1, 1, 1, 1,
-0.9206049, -0.6208413, -1.936677, 1, 1, 1, 1, 1,
-0.919063, -1.287071, -1.748593, 1, 1, 1, 1, 1,
-0.9152924, 0.4012198, -1.368387, 1, 1, 1, 1, 1,
-0.9106098, 0.4494902, -1.538424, 1, 1, 1, 1, 1,
-0.9029805, -1.316881, -3.310019, 1, 1, 1, 1, 1,
-0.9025073, -0.1144067, -0.1109545, 1, 1, 1, 1, 1,
-0.9024692, 2.012004, 1.98486, 1, 1, 1, 1, 1,
-0.9011802, -2.017954, -3.031394, 1, 1, 1, 1, 1,
-0.8965418, 0.1328285, -2.273701, 1, 1, 1, 1, 1,
-0.8904189, 1.886909, -0.1865736, 1, 1, 1, 1, 1,
-0.8887576, -1.259914, -2.245988, 0, 0, 1, 1, 1,
-0.8835836, -0.1061791, -1.994762, 1, 0, 0, 1, 1,
-0.8825439, 0.5416397, -1.901742, 1, 0, 0, 1, 1,
-0.8824825, 1.008434, -0.3301394, 1, 0, 0, 1, 1,
-0.8810599, 0.4028283, -1.457209, 1, 0, 0, 1, 1,
-0.8795654, -0.6341507, -1.688087, 1, 0, 0, 1, 1,
-0.8716776, 1.294429, -1.730476, 0, 0, 0, 1, 1,
-0.8595215, 0.1143412, -3.571405, 0, 0, 0, 1, 1,
-0.8586, -0.7131451, -2.188466, 0, 0, 0, 1, 1,
-0.8506203, -0.8283533, -3.691337, 0, 0, 0, 1, 1,
-0.8440719, -1.310663, -4.004959, 0, 0, 0, 1, 1,
-0.8400168, 2.279447, -2.031495, 0, 0, 0, 1, 1,
-0.8394617, 0.9168444, -2.744408, 0, 0, 0, 1, 1,
-0.8318635, 0.8913441, -0.7498776, 1, 1, 1, 1, 1,
-0.830796, 0.8748562, -0.7191459, 1, 1, 1, 1, 1,
-0.8306522, 0.1581911, -0.8061912, 1, 1, 1, 1, 1,
-0.8288008, -0.8617054, -3.400419, 1, 1, 1, 1, 1,
-0.8234835, -0.02019337, -1.506459, 1, 1, 1, 1, 1,
-0.8234586, -2.098674, -2.315423, 1, 1, 1, 1, 1,
-0.8175334, -0.5676067, -0.1987621, 1, 1, 1, 1, 1,
-0.8169459, 0.8262852, 0.05495267, 1, 1, 1, 1, 1,
-0.8164436, -0.4540103, -1.606067, 1, 1, 1, 1, 1,
-0.8147607, -0.858103, -4.125914, 1, 1, 1, 1, 1,
-0.8146524, 0.05618629, -0.01363356, 1, 1, 1, 1, 1,
-0.8141891, 0.4385577, 0.04682565, 1, 1, 1, 1, 1,
-0.8133133, -0.2990218, -2.388607, 1, 1, 1, 1, 1,
-0.8131194, -1.1213, -1.601457, 1, 1, 1, 1, 1,
-0.81129, -0.2219751, -2.458833, 1, 1, 1, 1, 1,
-0.8065351, 0.05681453, -2.243273, 0, 0, 1, 1, 1,
-0.8058407, 1.091757, -0.05102548, 1, 0, 0, 1, 1,
-0.804627, 0.5039256, -0.2574508, 1, 0, 0, 1, 1,
-0.7990922, -0.9997436, -1.347428, 1, 0, 0, 1, 1,
-0.7939519, 0.5914369, 0.2401966, 1, 0, 0, 1, 1,
-0.7910972, 0.4554563, -2.153681, 1, 0, 0, 1, 1,
-0.7893916, -0.3279221, -2.069354, 0, 0, 0, 1, 1,
-0.7889318, -0.1746081, -2.01786, 0, 0, 0, 1, 1,
-0.7877297, 0.05891367, -2.37092, 0, 0, 0, 1, 1,
-0.781019, -0.8408252, -2.676589, 0, 0, 0, 1, 1,
-0.7783095, 0.2066682, -1.796815, 0, 0, 0, 1, 1,
-0.7775265, 0.6110952, -0.9213745, 0, 0, 0, 1, 1,
-0.7758835, -1.099199, -2.430068, 0, 0, 0, 1, 1,
-0.7738675, 0.3214026, -1.161472, 1, 1, 1, 1, 1,
-0.7666295, 1.252179, -0.7499148, 1, 1, 1, 1, 1,
-0.7639362, 0.3279535, -1.829492, 1, 1, 1, 1, 1,
-0.7618701, -0.6465383, -1.304743, 1, 1, 1, 1, 1,
-0.7610942, -0.5247535, -2.230691, 1, 1, 1, 1, 1,
-0.7602105, -0.004031452, -2.566947, 1, 1, 1, 1, 1,
-0.7593104, 0.3596711, -1.968236, 1, 1, 1, 1, 1,
-0.752355, -0.7616929, -3.656771, 1, 1, 1, 1, 1,
-0.7516321, 0.8246133, 0.3336538, 1, 1, 1, 1, 1,
-0.7460397, 1.151939, -1.555771, 1, 1, 1, 1, 1,
-0.7452154, -0.9919352, -3.713409, 1, 1, 1, 1, 1,
-0.7409003, -0.0009587102, -2.510955, 1, 1, 1, 1, 1,
-0.7379354, 0.3782114, -0.02030334, 1, 1, 1, 1, 1,
-0.7290553, 1.442075, 0.8032174, 1, 1, 1, 1, 1,
-0.7284497, 0.674088, -2.459133, 1, 1, 1, 1, 1,
-0.7252331, -0.4432127, -3.040513, 0, 0, 1, 1, 1,
-0.722981, 2.997684, 0.901886, 1, 0, 0, 1, 1,
-0.7185069, -2.532532, -1.759562, 1, 0, 0, 1, 1,
-0.7171795, 0.7528331, -2.576307, 1, 0, 0, 1, 1,
-0.7169739, -1.178211, -2.273569, 1, 0, 0, 1, 1,
-0.7129607, -0.4880863, -2.558822, 1, 0, 0, 1, 1,
-0.7110126, -0.04398525, -0.7106615, 0, 0, 0, 1, 1,
-0.7095664, 0.1375294, -1.418681, 0, 0, 0, 1, 1,
-0.7084345, -0.01518485, -0.9161674, 0, 0, 0, 1, 1,
-0.7083899, 1.262877, -0.9399819, 0, 0, 0, 1, 1,
-0.7001276, 0.006078876, -0.6486763, 0, 0, 0, 1, 1,
-0.697966, -0.4019526, -3.589814, 0, 0, 0, 1, 1,
-0.6943133, -0.3453902, -2.409068, 0, 0, 0, 1, 1,
-0.6907358, 0.1940922, -2.85574, 1, 1, 1, 1, 1,
-0.6830668, 0.2987095, 0.7984224, 1, 1, 1, 1, 1,
-0.6817309, 2.258578, 0.9931219, 1, 1, 1, 1, 1,
-0.6810393, 0.05567783, -1.634097, 1, 1, 1, 1, 1,
-0.6780329, 0.6334072, -1.926387, 1, 1, 1, 1, 1,
-0.6587162, -0.2808188, -1.75134, 1, 1, 1, 1, 1,
-0.6573755, -1.494607, -2.958212, 1, 1, 1, 1, 1,
-0.6565835, -0.1039948, -2.451049, 1, 1, 1, 1, 1,
-0.6531725, 0.2093329, -1.464039, 1, 1, 1, 1, 1,
-0.6529867, 0.270908, -1.040438, 1, 1, 1, 1, 1,
-0.6503694, -0.3487532, -2.911479, 1, 1, 1, 1, 1,
-0.6498659, -0.3551289, -3.530646, 1, 1, 1, 1, 1,
-0.6406847, 1.822576, 0.6038464, 1, 1, 1, 1, 1,
-0.6402807, 0.7200735, -0.4058226, 1, 1, 1, 1, 1,
-0.6367852, 0.8083653, -1.3846, 1, 1, 1, 1, 1,
-0.6343781, -1.658318, -2.935631, 0, 0, 1, 1, 1,
-0.6285553, 0.9066846, -1.861313, 1, 0, 0, 1, 1,
-0.6234034, 0.6890417, -1.22575, 1, 0, 0, 1, 1,
-0.6197556, 0.2087131, -1.65341, 1, 0, 0, 1, 1,
-0.6191998, -0.3199245, -2.689509, 1, 0, 0, 1, 1,
-0.6181984, -0.4979258, -2.287629, 1, 0, 0, 1, 1,
-0.616217, -1.647455, -3.029396, 0, 0, 0, 1, 1,
-0.6142598, -0.8398234, -1.17025, 0, 0, 0, 1, 1,
-0.6121404, 0.6256124, -0.08597348, 0, 0, 0, 1, 1,
-0.6116686, -0.344123, -2.396557, 0, 0, 0, 1, 1,
-0.6101667, -1.75846, -2.243178, 0, 0, 0, 1, 1,
-0.6076843, -0.3084701, -1.706324, 0, 0, 0, 1, 1,
-0.5941412, 0.06443986, -0.8683652, 0, 0, 0, 1, 1,
-0.5932381, -0.4721582, -1.724634, 1, 1, 1, 1, 1,
-0.5925601, 0.3441416, -1.040009, 1, 1, 1, 1, 1,
-0.5899047, 0.622868, -1.454195, 1, 1, 1, 1, 1,
-0.5870796, 0.9268132, -1.18092, 1, 1, 1, 1, 1,
-0.5793532, 0.01271724, -1.985011, 1, 1, 1, 1, 1,
-0.5746625, -0.1856514, -1.483554, 1, 1, 1, 1, 1,
-0.5717101, -0.2792636, -2.00676, 1, 1, 1, 1, 1,
-0.5691955, -2.254031, -2.380132, 1, 1, 1, 1, 1,
-0.5691851, -1.592218, -1.782295, 1, 1, 1, 1, 1,
-0.566388, 0.3500678, -0.2944264, 1, 1, 1, 1, 1,
-0.5610622, 0.4219931, -1.075981, 1, 1, 1, 1, 1,
-0.5558709, -0.9494829, -3.028751, 1, 1, 1, 1, 1,
-0.5549411, -1.023167, -2.00655, 1, 1, 1, 1, 1,
-0.5516077, -0.7205948, -4.373497, 1, 1, 1, 1, 1,
-0.5465457, 3.043913, -0.9614717, 1, 1, 1, 1, 1,
-0.5456313, 0.9765464, -2.070603, 0, 0, 1, 1, 1,
-0.5303926, -1.448467, -0.8394915, 1, 0, 0, 1, 1,
-0.5303156, 1.142334, 1.046991, 1, 0, 0, 1, 1,
-0.5287966, -0.06493934, -1.595363, 1, 0, 0, 1, 1,
-0.5272717, -0.01461717, -1.977723, 1, 0, 0, 1, 1,
-0.5243503, 0.5662842, 0.2034109, 1, 0, 0, 1, 1,
-0.5183969, 0.08334204, -2.984217, 0, 0, 0, 1, 1,
-0.5182447, -1.772136, -3.99849, 0, 0, 0, 1, 1,
-0.5133529, 1.011697, 0.5821176, 0, 0, 0, 1, 1,
-0.5129123, -2.536371, -4.274197, 0, 0, 0, 1, 1,
-0.5123501, -0.3988357, -2.466845, 0, 0, 0, 1, 1,
-0.5106988, 1.346327, -1.070653, 0, 0, 0, 1, 1,
-0.510364, -0.3140555, -3.444009, 0, 0, 0, 1, 1,
-0.5053536, -1.045826, -3.013155, 1, 1, 1, 1, 1,
-0.502149, 1.396033, 0.4476185, 1, 1, 1, 1, 1,
-0.5003712, 0.3114839, -0.725437, 1, 1, 1, 1, 1,
-0.4993261, -0.3345191, -1.966147, 1, 1, 1, 1, 1,
-0.4938816, -0.1058448, -1.102063, 1, 1, 1, 1, 1,
-0.4913519, 0.4305508, -1.431116, 1, 1, 1, 1, 1,
-0.4877183, 0.4051951, -1.333822, 1, 1, 1, 1, 1,
-0.4802397, -0.3829369, -1.129376, 1, 1, 1, 1, 1,
-0.477366, 0.1354878, -2.256394, 1, 1, 1, 1, 1,
-0.4772621, -0.8427787, -1.077878, 1, 1, 1, 1, 1,
-0.4763732, 0.2713396, -1.466677, 1, 1, 1, 1, 1,
-0.4761849, 0.1915152, -1.981877, 1, 1, 1, 1, 1,
-0.4761792, 0.6318272, -0.5871279, 1, 1, 1, 1, 1,
-0.4724185, 1.663576, -0.4629586, 1, 1, 1, 1, 1,
-0.4723859, 0.2843014, -0.08714952, 1, 1, 1, 1, 1,
-0.469245, -1.868512, -3.393749, 0, 0, 1, 1, 1,
-0.4628921, -1.720949, -4.195243, 1, 0, 0, 1, 1,
-0.4620808, -0.3051262, -4.299106, 1, 0, 0, 1, 1,
-0.4599275, -0.6230477, -3.182744, 1, 0, 0, 1, 1,
-0.4542564, -2.17276, -5.036364, 1, 0, 0, 1, 1,
-0.451698, -0.953716, -1.402354, 1, 0, 0, 1, 1,
-0.4491565, 1.255712, 0.012338, 0, 0, 0, 1, 1,
-0.443518, -0.3043341, -1.518081, 0, 0, 0, 1, 1,
-0.4368729, -1.344363, -3.705315, 0, 0, 0, 1, 1,
-0.4309399, 0.5108022, 0.09337464, 0, 0, 0, 1, 1,
-0.4302293, -0.1074626, -3.015418, 0, 0, 0, 1, 1,
-0.4301132, -1.034487, -1.6297, 0, 0, 0, 1, 1,
-0.4235404, 1.566127, -0.7874152, 0, 0, 0, 1, 1,
-0.4209854, 1.193474, 0.7112399, 1, 1, 1, 1, 1,
-0.4172173, -1.384729, -3.20713, 1, 1, 1, 1, 1,
-0.4140018, 0.2983957, -0.9268965, 1, 1, 1, 1, 1,
-0.4081296, -2.000827, -3.532612, 1, 1, 1, 1, 1,
-0.4053365, -1.844043, -4.001801, 1, 1, 1, 1, 1,
-0.399321, 0.1176487, -1.592845, 1, 1, 1, 1, 1,
-0.3970026, -0.05845842, -0.6005672, 1, 1, 1, 1, 1,
-0.3943569, 1.502534, 1.009918, 1, 1, 1, 1, 1,
-0.3923135, 0.9354259, -0.756399, 1, 1, 1, 1, 1,
-0.39193, -1.457225, -1.481118, 1, 1, 1, 1, 1,
-0.3892691, 1.13712, 0.1887584, 1, 1, 1, 1, 1,
-0.3890513, 0.196743, -0.2574357, 1, 1, 1, 1, 1,
-0.381606, -1.538258, -1.458851, 1, 1, 1, 1, 1,
-0.3785926, 0.5007189, -1.397055, 1, 1, 1, 1, 1,
-0.374851, -0.8654001, -4.179053, 1, 1, 1, 1, 1,
-0.3716263, -0.8212928, -2.42273, 0, 0, 1, 1, 1,
-0.3691754, 0.8086206, 0.4695162, 1, 0, 0, 1, 1,
-0.3668084, -0.110259, -2.59709, 1, 0, 0, 1, 1,
-0.365577, 0.5276909, 0.6314299, 1, 0, 0, 1, 1,
-0.3648633, 1.416809, -0.5681052, 1, 0, 0, 1, 1,
-0.3463816, 1.208229, -0.9755141, 1, 0, 0, 1, 1,
-0.3446995, 0.01859064, -2.193797, 0, 0, 0, 1, 1,
-0.3402463, -0.4974301, -1.60614, 0, 0, 0, 1, 1,
-0.3387435, 0.653329, 1.171641, 0, 0, 0, 1, 1,
-0.3373275, -0.6697607, -2.882021, 0, 0, 0, 1, 1,
-0.3363166, 0.0670794, -0.2051157, 0, 0, 0, 1, 1,
-0.3340829, -1.531085, -3.35199, 0, 0, 0, 1, 1,
-0.3299118, 0.1674983, -0.9622943, 0, 0, 0, 1, 1,
-0.3293726, -1.135127, -3.133972, 1, 1, 1, 1, 1,
-0.3259791, 1.256249, 0.423624, 1, 1, 1, 1, 1,
-0.3220257, -1.468347, -3.07905, 1, 1, 1, 1, 1,
-0.318517, -1.99691, -4.511645, 1, 1, 1, 1, 1,
-0.3179867, 1.407164, 0.1534088, 1, 1, 1, 1, 1,
-0.3106193, 0.8119624, -1.23903, 1, 1, 1, 1, 1,
-0.3081734, -0.1062998, -2.14089, 1, 1, 1, 1, 1,
-0.3036519, 0.6100432, -0.6593659, 1, 1, 1, 1, 1,
-0.2979131, -1.970784, -1.858764, 1, 1, 1, 1, 1,
-0.2931654, 0.3277806, -0.6612898, 1, 1, 1, 1, 1,
-0.2913094, 0.0423888, -1.921199, 1, 1, 1, 1, 1,
-0.2862589, -0.3290442, -2.797242, 1, 1, 1, 1, 1,
-0.2818142, 0.5743033, -0.887596, 1, 1, 1, 1, 1,
-0.2805809, -1.048825, -3.099017, 1, 1, 1, 1, 1,
-0.2785255, 1.249055, 0.2315067, 1, 1, 1, 1, 1,
-0.2778385, -0.9427125, -1.294067, 0, 0, 1, 1, 1,
-0.276502, 0.6600867, -0.9827945, 1, 0, 0, 1, 1,
-0.2761892, -1.544901, -3.174747, 1, 0, 0, 1, 1,
-0.2740233, 0.2006214, 0.4147739, 1, 0, 0, 1, 1,
-0.2672188, 0.01054507, -2.316514, 1, 0, 0, 1, 1,
-0.2645321, 1.06045, -0.9792859, 1, 0, 0, 1, 1,
-0.2619987, 0.2168818, -0.6989167, 0, 0, 0, 1, 1,
-0.2579075, -2.523059, -1.905477, 0, 0, 0, 1, 1,
-0.2537305, 0.04060422, -2.269647, 0, 0, 0, 1, 1,
-0.2522214, 0.6376881, 0.2435976, 0, 0, 0, 1, 1,
-0.247999, -1.050742, -1.401378, 0, 0, 0, 1, 1,
-0.2476007, -0.3798919, -3.2714, 0, 0, 0, 1, 1,
-0.2414495, -1.408806, -1.468325, 0, 0, 0, 1, 1,
-0.2412686, -0.5463497, -3.171805, 1, 1, 1, 1, 1,
-0.2388746, 1.05412, -0.03778303, 1, 1, 1, 1, 1,
-0.2332274, 0.409268, -1.162329, 1, 1, 1, 1, 1,
-0.2331467, 0.2108555, -0.8112668, 1, 1, 1, 1, 1,
-0.2174445, 0.3822267, 0.7771078, 1, 1, 1, 1, 1,
-0.2160696, 1.801733, -0.4969459, 1, 1, 1, 1, 1,
-0.2159757, -0.4539938, -3.214983, 1, 1, 1, 1, 1,
-0.2144236, -0.337187, -1.066673, 1, 1, 1, 1, 1,
-0.2141237, -1.353231, -2.701802, 1, 1, 1, 1, 1,
-0.2113533, -0.4890423, -4.618792, 1, 1, 1, 1, 1,
-0.2088966, -0.7179495, -1.183767, 1, 1, 1, 1, 1,
-0.2064611, 0.4576032, -0.3224542, 1, 1, 1, 1, 1,
-0.2004212, -0.007724952, -0.5341184, 1, 1, 1, 1, 1,
-0.1962051, 0.13501, -0.1463088, 1, 1, 1, 1, 1,
-0.1952532, -0.4548275, -2.04643, 1, 1, 1, 1, 1,
-0.1908198, 0.7297432, 0.3277942, 0, 0, 1, 1, 1,
-0.1890208, -0.1543032, -2.37975, 1, 0, 0, 1, 1,
-0.1889817, 0.2726055, 0.6645579, 1, 0, 0, 1, 1,
-0.1878044, 2.234433, -0.4511366, 1, 0, 0, 1, 1,
-0.1817707, 0.1669003, -1.376402, 1, 0, 0, 1, 1,
-0.1774051, 0.1914468, -2.611437, 1, 0, 0, 1, 1,
-0.1761138, -2.502162, -4.152835, 0, 0, 0, 1, 1,
-0.1694297, -0.7929322, -2.969535, 0, 0, 0, 1, 1,
-0.1693544, -0.09508026, -1.490101, 0, 0, 0, 1, 1,
-0.1643934, 0.2269565, -0.570674, 0, 0, 0, 1, 1,
-0.1621096, -0.7148946, -5.207496, 0, 0, 0, 1, 1,
-0.1570961, 0.4485618, 0.06567022, 0, 0, 0, 1, 1,
-0.1537893, -0.3792127, -2.028429, 0, 0, 0, 1, 1,
-0.1536733, -0.139434, -1.034393, 1, 1, 1, 1, 1,
-0.1531183, -0.9370398, -2.633211, 1, 1, 1, 1, 1,
-0.1462405, 1.236352, -0.1017794, 1, 1, 1, 1, 1,
-0.1448939, 2.139818, -1.0433, 1, 1, 1, 1, 1,
-0.1387007, -0.0428673, -2.830376, 1, 1, 1, 1, 1,
-0.1357893, -0.9890584, -1.542036, 1, 1, 1, 1, 1,
-0.1338941, 0.3736769, 0.1543211, 1, 1, 1, 1, 1,
-0.1281004, 0.9129876, -1.998958, 1, 1, 1, 1, 1,
-0.1246442, 0.9023885, -0.3983905, 1, 1, 1, 1, 1,
-0.1236581, 1.478689, 1.880952, 1, 1, 1, 1, 1,
-0.1146774, 0.3688961, 0.01210938, 1, 1, 1, 1, 1,
-0.1146096, -0.2411722, -2.424547, 1, 1, 1, 1, 1,
-0.1140581, 0.0416586, 0.6256217, 1, 1, 1, 1, 1,
-0.1129123, -0.3641121, -3.631883, 1, 1, 1, 1, 1,
-0.111762, 1.184479, 0.0890085, 1, 1, 1, 1, 1,
-0.10953, -0.04128049, -1.971528, 0, 0, 1, 1, 1,
-0.1094323, -0.6631249, -2.226004, 1, 0, 0, 1, 1,
-0.1088383, 0.9750127, -0.3310745, 1, 0, 0, 1, 1,
-0.1088317, -0.827112, -3.196817, 1, 0, 0, 1, 1,
-0.1085598, -0.1118743, -2.107797, 1, 0, 0, 1, 1,
-0.09682284, 1.423099, -0.2034754, 1, 0, 0, 1, 1,
-0.09305114, -0.01206921, -1.909844, 0, 0, 0, 1, 1,
-0.09221434, -0.8073191, -2.448677, 0, 0, 0, 1, 1,
-0.08960143, -0.4438349, -2.872692, 0, 0, 0, 1, 1,
-0.08869672, 0.08940897, -1.960059, 0, 0, 0, 1, 1,
-0.08716938, 1.758171, 0.6436604, 0, 0, 0, 1, 1,
-0.08699546, 0.2962123, 0.6299636, 0, 0, 0, 1, 1,
-0.07879431, -0.6314539, -2.45779, 0, 0, 0, 1, 1,
-0.07674965, -1.223733, -2.10877, 1, 1, 1, 1, 1,
-0.07457437, -0.2938693, -2.320032, 1, 1, 1, 1, 1,
-0.0735007, -0.5459636, -1.562388, 1, 1, 1, 1, 1,
-0.07072852, 1.238007, 0.08884228, 1, 1, 1, 1, 1,
-0.06957003, -0.2685994, -2.865283, 1, 1, 1, 1, 1,
-0.06531548, 1.459509, 0.5877059, 1, 1, 1, 1, 1,
-0.06413165, -0.5766946, -3.430739, 1, 1, 1, 1, 1,
-0.0635521, -3.512717, -3.793971, 1, 1, 1, 1, 1,
-0.06349638, 1.001124, 0.5099704, 1, 1, 1, 1, 1,
-0.05814152, 1.652617, 0.5215156, 1, 1, 1, 1, 1,
-0.05733101, -0.2970466, -2.97142, 1, 1, 1, 1, 1,
-0.05374069, -1.951212, -2.712974, 1, 1, 1, 1, 1,
-0.05322961, -0.9417575, -1.651424, 1, 1, 1, 1, 1,
-0.04990146, -0.4917573, -1.992891, 1, 1, 1, 1, 1,
-0.04684439, 0.2752165, -1.279505, 1, 1, 1, 1, 1,
-0.04157455, 0.5560857, -0.9408404, 0, 0, 1, 1, 1,
-0.03740412, -0.4697303, -3.080448, 1, 0, 0, 1, 1,
-0.03662324, -0.3625247, -2.955853, 1, 0, 0, 1, 1,
-0.02594391, 0.4682956, -0.2350504, 1, 0, 0, 1, 1,
-0.02268075, -1.862879, -3.389483, 1, 0, 0, 1, 1,
-0.02143664, 1.660716, -0.3398638, 1, 0, 0, 1, 1,
-0.01953682, 0.3107128, -0.4095082, 0, 0, 0, 1, 1,
-0.01245029, -0.8152288, -2.548291, 0, 0, 0, 1, 1,
-0.01233344, 0.6294745, -2.073228, 0, 0, 0, 1, 1,
-0.01003755, 0.1872879, 0.6167998, 0, 0, 0, 1, 1,
-0.00716704, -0.6795229, -5.04002, 0, 0, 0, 1, 1,
-0.006407628, 0.03349181, 1.445785, 0, 0, 0, 1, 1,
-0.005820327, -1.22847, -4.231398, 0, 0, 0, 1, 1,
-0.004434963, -1.612424, -3.510034, 1, 1, 1, 1, 1,
0.001781133, 0.6811052, -0.2838544, 1, 1, 1, 1, 1,
0.001955485, -1.330265, 3.240401, 1, 1, 1, 1, 1,
0.00208883, 0.3294597, -0.9345148, 1, 1, 1, 1, 1,
0.002585478, 0.918468, 1.071834, 1, 1, 1, 1, 1,
0.005031687, 0.2057923, 1.144005, 1, 1, 1, 1, 1,
0.008320364, -0.6944714, 2.653085, 1, 1, 1, 1, 1,
0.01141173, -0.2889418, 4.111899, 1, 1, 1, 1, 1,
0.01217744, -0.9693106, 3.051431, 1, 1, 1, 1, 1,
0.01541819, 1.790935, -0.02551575, 1, 1, 1, 1, 1,
0.01589839, 0.0588103, 0.543377, 1, 1, 1, 1, 1,
0.01737331, 0.8240539, -1.981822, 1, 1, 1, 1, 1,
0.02132956, 0.9802678, 0.445491, 1, 1, 1, 1, 1,
0.02223947, -0.4258133, 3.023931, 1, 1, 1, 1, 1,
0.02866953, -1.073871, 1.943831, 1, 1, 1, 1, 1,
0.02959489, 1.475223, -0.1040992, 0, 0, 1, 1, 1,
0.03154122, -2.06952, 2.500196, 1, 0, 0, 1, 1,
0.03215996, -3.572356, 4.324994, 1, 0, 0, 1, 1,
0.03477914, 0.3445344, -0.2952774, 1, 0, 0, 1, 1,
0.03496035, 0.003612116, 2.143263, 1, 0, 0, 1, 1,
0.03745833, -0.2124986, 4.480513, 1, 0, 0, 1, 1,
0.04126195, 0.0002493596, 1.740582, 0, 0, 0, 1, 1,
0.04617323, -2.034458, 3.238206, 0, 0, 0, 1, 1,
0.04905266, 0.07962318, 0.9339461, 0, 0, 0, 1, 1,
0.05097147, -0.5380104, 1.984742, 0, 0, 0, 1, 1,
0.059727, 0.4054611, 0.09424654, 0, 0, 0, 1, 1,
0.06408305, -0.5031876, 4.226458, 0, 0, 0, 1, 1,
0.06557053, 0.4684335, -0.7379439, 0, 0, 0, 1, 1,
0.06667995, -0.1015429, 3.142178, 1, 1, 1, 1, 1,
0.07087472, 0.3891439, 0.06458582, 1, 1, 1, 1, 1,
0.07549974, -1.708501, 1.797221, 1, 1, 1, 1, 1,
0.07965207, 0.932113, -1.309055, 1, 1, 1, 1, 1,
0.08308224, 0.4405117, -1.675643, 1, 1, 1, 1, 1,
0.08416026, -0.9267118, 5.820433, 1, 1, 1, 1, 1,
0.08570582, -1.801056, 1.927656, 1, 1, 1, 1, 1,
0.08810367, 0.1667851, -1.186035, 1, 1, 1, 1, 1,
0.0886568, 0.4474104, 0.5632985, 1, 1, 1, 1, 1,
0.09077518, -1.267157, 0.8253984, 1, 1, 1, 1, 1,
0.09134331, 0.2432807, -0.6487362, 1, 1, 1, 1, 1,
0.09225321, 0.7084824, 3.82351, 1, 1, 1, 1, 1,
0.09633675, 2.343316, -1.988887, 1, 1, 1, 1, 1,
0.1029013, 0.187317, 1.080078, 1, 1, 1, 1, 1,
0.1034295, -0.3138018, 3.194928, 1, 1, 1, 1, 1,
0.1083271, 0.0778406, 1.408903, 0, 0, 1, 1, 1,
0.1160277, 0.7707131, 0.6747282, 1, 0, 0, 1, 1,
0.1210216, 0.5867404, -1.282339, 1, 0, 0, 1, 1,
0.1214572, 0.4630535, 0.1395273, 1, 0, 0, 1, 1,
0.1233236, -0.3798729, 4.085015, 1, 0, 0, 1, 1,
0.1252314, 1.360445, -0.5993132, 1, 0, 0, 1, 1,
0.1261397, -1.209153, 1.98944, 0, 0, 0, 1, 1,
0.1264296, -0.3773754, 2.717049, 0, 0, 0, 1, 1,
0.1271868, -1.009476, 3.716656, 0, 0, 0, 1, 1,
0.1301525, 0.3278895, 2.434067, 0, 0, 0, 1, 1,
0.1339691, 0.0346932, 0.7562025, 0, 0, 0, 1, 1,
0.1366383, -0.6483826, 1.605636, 0, 0, 0, 1, 1,
0.1377548, 0.1250632, 1.571556, 0, 0, 0, 1, 1,
0.1422461, -0.9484972, 3.337684, 1, 1, 1, 1, 1,
0.1429243, -1.141224, 2.179215, 1, 1, 1, 1, 1,
0.1448666, 1.450323, -1.951292, 1, 1, 1, 1, 1,
0.1488293, 0.9597849, 0.4481525, 1, 1, 1, 1, 1,
0.1502507, -1.885335, 3.53934, 1, 1, 1, 1, 1,
0.1505117, -0.8790823, 4.689514, 1, 1, 1, 1, 1,
0.1543797, -0.244319, 3.766701, 1, 1, 1, 1, 1,
0.1565131, -0.6218426, 2.721375, 1, 1, 1, 1, 1,
0.1616616, 1.314089, 0.9668399, 1, 1, 1, 1, 1,
0.1619635, 1.024061, 1.388276, 1, 1, 1, 1, 1,
0.1638487, -0.5966782, 2.379993, 1, 1, 1, 1, 1,
0.1677002, -1.777934, 3.103959, 1, 1, 1, 1, 1,
0.167956, -1.327811, 2.577182, 1, 1, 1, 1, 1,
0.1708813, -2.175111, 3.874524, 1, 1, 1, 1, 1,
0.1782053, -0.4587902, 4.796232, 1, 1, 1, 1, 1,
0.179118, 0.5783024, 1.676839, 0, 0, 1, 1, 1,
0.1835931, 0.1366969, 0.1873508, 1, 0, 0, 1, 1,
0.1850817, 1.579914, -1.215083, 1, 0, 0, 1, 1,
0.1865987, -0.1044589, 3.833509, 1, 0, 0, 1, 1,
0.1870438, 0.7256224, 0.1701041, 1, 0, 0, 1, 1,
0.1887352, 1.199789, 0.3238252, 1, 0, 0, 1, 1,
0.1890058, 1.51272, -0.4018805, 0, 0, 0, 1, 1,
0.1946612, -1.18536, 2.022177, 0, 0, 0, 1, 1,
0.1950928, -1.494269, 2.945323, 0, 0, 0, 1, 1,
0.2042294, -0.2639956, 2.420473, 0, 0, 0, 1, 1,
0.2115829, -0.7702994, 3.515638, 0, 0, 0, 1, 1,
0.2136815, -1.016676, 4.39268, 0, 0, 0, 1, 1,
0.2169599, 1.670558, -0.298848, 0, 0, 0, 1, 1,
0.2170004, -1.071788, 2.334291, 1, 1, 1, 1, 1,
0.2186188, -1.465945, 2.827446, 1, 1, 1, 1, 1,
0.2230071, -0.4247652, 2.60638, 1, 1, 1, 1, 1,
0.2242891, 0.4327603, -0.2524242, 1, 1, 1, 1, 1,
0.2251915, 0.9531171, 0.2175256, 1, 1, 1, 1, 1,
0.2293596, -2.189857, 4.329157, 1, 1, 1, 1, 1,
0.2327087, 0.1661996, 1.201181, 1, 1, 1, 1, 1,
0.2338281, 1.390866, 0.1613121, 1, 1, 1, 1, 1,
0.2346459, -0.1718105, 1.216328, 1, 1, 1, 1, 1,
0.2462086, -0.161936, 1.708062, 1, 1, 1, 1, 1,
0.2503955, 0.6502228, 0.2665633, 1, 1, 1, 1, 1,
0.2506647, 0.02009171, 2.645489, 1, 1, 1, 1, 1,
0.2515334, -0.6070592, 3.64147, 1, 1, 1, 1, 1,
0.2545726, 0.1126905, -0.1244154, 1, 1, 1, 1, 1,
0.2575333, 1.091963, 0.0718469, 1, 1, 1, 1, 1,
0.2586088, -0.2858874, 3.811638, 0, 0, 1, 1, 1,
0.2615224, 0.8416949, 1.387449, 1, 0, 0, 1, 1,
0.2617893, -0.7535906, 3.648962, 1, 0, 0, 1, 1,
0.263499, 0.5043402, 0.09389185, 1, 0, 0, 1, 1,
0.2638678, 1.540029, 0.4077273, 1, 0, 0, 1, 1,
0.2660708, 0.3936903, 0.5333983, 1, 0, 0, 1, 1,
0.2665954, 1.11275, -1.241486, 0, 0, 0, 1, 1,
0.2734336, 0.5800301, 2.85686, 0, 0, 0, 1, 1,
0.2736429, 1.67627, -1.840998, 0, 0, 0, 1, 1,
0.2762533, 0.4455971, -1.367303, 0, 0, 0, 1, 1,
0.279555, -1.458671, 3.333339, 0, 0, 0, 1, 1,
0.2805911, -1.541377, 2.872171, 0, 0, 0, 1, 1,
0.2818237, 0.8676996, 0.2303964, 0, 0, 0, 1, 1,
0.283369, 1.569011, 0.7798782, 1, 1, 1, 1, 1,
0.283814, -0.137102, 1.447496, 1, 1, 1, 1, 1,
0.2873481, 0.3212671, 1.352009, 1, 1, 1, 1, 1,
0.2900025, -0.6186857, 2.076109, 1, 1, 1, 1, 1,
0.2904887, -0.3659969, 2.117047, 1, 1, 1, 1, 1,
0.2913074, -0.1622705, 0.9998247, 1, 1, 1, 1, 1,
0.2917992, -0.18893, 1.74536, 1, 1, 1, 1, 1,
0.2942556, 1.023207, -0.6293313, 1, 1, 1, 1, 1,
0.2946565, -0.7351156, 3.224986, 1, 1, 1, 1, 1,
0.295474, -0.0932977, 0.5223651, 1, 1, 1, 1, 1,
0.2975372, 0.1511808, 3.076132, 1, 1, 1, 1, 1,
0.2992872, 0.9783872, 0.7639042, 1, 1, 1, 1, 1,
0.3005928, -0.6495762, 2.694898, 1, 1, 1, 1, 1,
0.3006089, -0.3930583, 0.4999493, 1, 1, 1, 1, 1,
0.3025901, -2.391932, 2.366769, 1, 1, 1, 1, 1,
0.3046766, 0.5170019, 2.574165, 0, 0, 1, 1, 1,
0.3047834, 0.6328736, 0.02561585, 1, 0, 0, 1, 1,
0.3052577, 0.104771, -0.5846974, 1, 0, 0, 1, 1,
0.3088952, -1.917216, 2.122651, 1, 0, 0, 1, 1,
0.3130245, -0.9814454, 2.258542, 1, 0, 0, 1, 1,
0.3158195, -0.3946511, 1.374319, 1, 0, 0, 1, 1,
0.3180988, -0.6003893, 2.942996, 0, 0, 0, 1, 1,
0.3183858, -0.2966394, 2.688797, 0, 0, 0, 1, 1,
0.3190931, 2.119429, -0.9224417, 0, 0, 0, 1, 1,
0.3201093, -0.1911811, 2.672097, 0, 0, 0, 1, 1,
0.3303582, -1.458717, 2.414044, 0, 0, 0, 1, 1,
0.3372155, 0.3184977, -0.258826, 0, 0, 0, 1, 1,
0.3396385, 1.063106, -0.03980502, 0, 0, 0, 1, 1,
0.3416971, 0.7154791, 0.5466966, 1, 1, 1, 1, 1,
0.34303, -0.30862, 2.616957, 1, 1, 1, 1, 1,
0.3439719, -1.171746, 4.949728, 1, 1, 1, 1, 1,
0.3489038, 0.8253887, -0.5380877, 1, 1, 1, 1, 1,
0.3513344, 0.8056685, 1.988379, 1, 1, 1, 1, 1,
0.3513493, 2.171211, 0.005968958, 1, 1, 1, 1, 1,
0.3556001, -0.6277975, 1.51503, 1, 1, 1, 1, 1,
0.3621274, 1.608697, 1.282838, 1, 1, 1, 1, 1,
0.3669449, 0.1831792, 1.927189, 1, 1, 1, 1, 1,
0.3691304, -2.264443, 2.934851, 1, 1, 1, 1, 1,
0.3699418, 1.540849, 0.3114649, 1, 1, 1, 1, 1,
0.3711397, -1.425228, 2.844612, 1, 1, 1, 1, 1,
0.3775182, -0.4465005, 1.583675, 1, 1, 1, 1, 1,
0.378383, -1.66791, 2.499515, 1, 1, 1, 1, 1,
0.3797557, 0.6762353, 0.4196455, 1, 1, 1, 1, 1,
0.3810546, 1.006336, -1.17507, 0, 0, 1, 1, 1,
0.3825998, -0.001580968, 1.772061, 1, 0, 0, 1, 1,
0.384568, -0.7273973, 2.419725, 1, 0, 0, 1, 1,
0.3847457, -1.000246, 3.146037, 1, 0, 0, 1, 1,
0.3850535, 1.334827, -0.3904479, 1, 0, 0, 1, 1,
0.388895, -0.08725639, 4.630325, 1, 0, 0, 1, 1,
0.4000921, 1.958286, -0.02798741, 0, 0, 0, 1, 1,
0.4010772, 0.1731427, 1.663793, 0, 0, 0, 1, 1,
0.4020157, -1.558181, 3.219588, 0, 0, 0, 1, 1,
0.4182042, 2.424243, 0.7251493, 0, 0, 0, 1, 1,
0.4233856, -0.5956005, 0.308579, 0, 0, 0, 1, 1,
0.426545, -0.06177661, 1.498245, 0, 0, 0, 1, 1,
0.426598, 1.096216, 1.016659, 0, 0, 0, 1, 1,
0.4270462, 0.476541, -0.01042262, 1, 1, 1, 1, 1,
0.4306081, -0.474394, 3.851944, 1, 1, 1, 1, 1,
0.4310234, -0.6582752, 3.072917, 1, 1, 1, 1, 1,
0.437402, -0.9208865, 1.854355, 1, 1, 1, 1, 1,
0.4403292, -0.5301818, 1.698893, 1, 1, 1, 1, 1,
0.4515023, 0.5466167, 1.280811, 1, 1, 1, 1, 1,
0.4518299, 0.3349843, 2.117227, 1, 1, 1, 1, 1,
0.4577437, 1.142439, -0.1533684, 1, 1, 1, 1, 1,
0.4601075, -0.9641013, 0.6267827, 1, 1, 1, 1, 1,
0.463762, -0.0636389, 1.857123, 1, 1, 1, 1, 1,
0.470465, 0.4755181, 0.5627021, 1, 1, 1, 1, 1,
0.4708285, 1.428558, -0.4576651, 1, 1, 1, 1, 1,
0.4716932, -0.1115526, 2.297701, 1, 1, 1, 1, 1,
0.4747575, -0.2290469, 4.384943, 1, 1, 1, 1, 1,
0.4853452, 0.8334693, -1.231073, 1, 1, 1, 1, 1,
0.4871919, -1.739385, 2.565996, 0, 0, 1, 1, 1,
0.4895858, -0.7097374, 1.858206, 1, 0, 0, 1, 1,
0.489867, 0.6540725, 0.8167837, 1, 0, 0, 1, 1,
0.4925848, -0.5642717, 2.009747, 1, 0, 0, 1, 1,
0.5023251, -2.048015, 3.643716, 1, 0, 0, 1, 1,
0.5030143, -0.365697, 1.683401, 1, 0, 0, 1, 1,
0.5034451, -0.3294539, 0.3308244, 0, 0, 0, 1, 1,
0.515291, -0.378985, 1.650081, 0, 0, 0, 1, 1,
0.5157904, -0.2865762, 2.787743, 0, 0, 0, 1, 1,
0.5172546, -1.792285, 4.126971, 0, 0, 0, 1, 1,
0.5172639, 0.2711183, -0.3620349, 0, 0, 0, 1, 1,
0.5196731, 1.048344, -0.4119341, 0, 0, 0, 1, 1,
0.5255991, -0.8587739, 2.458134, 0, 0, 0, 1, 1,
0.5311297, -0.199915, 4.554791, 1, 1, 1, 1, 1,
0.5327262, -0.8864747, 1.668514, 1, 1, 1, 1, 1,
0.5339568, -1.959257, 3.48367, 1, 1, 1, 1, 1,
0.5356537, 2.640247, -0.1751765, 1, 1, 1, 1, 1,
0.5418163, -2.237547, 3.059777, 1, 1, 1, 1, 1,
0.5438272, -0.8266574, 2.913861, 1, 1, 1, 1, 1,
0.5444548, 1.322136, 0.7984836, 1, 1, 1, 1, 1,
0.5467849, -0.3298922, 1.189999, 1, 1, 1, 1, 1,
0.5501227, 0.7703862, -0.7528062, 1, 1, 1, 1, 1,
0.5555508, -1.009634, 2.852952, 1, 1, 1, 1, 1,
0.5613753, -0.6186675, 1.545533, 1, 1, 1, 1, 1,
0.5663313, 0.2562532, 0.7381855, 1, 1, 1, 1, 1,
0.5758873, 0.2986227, 0.727177, 1, 1, 1, 1, 1,
0.5768534, 0.565151, 1.134609, 1, 1, 1, 1, 1,
0.5769305, -0.1588928, 2.260275, 1, 1, 1, 1, 1,
0.5781658, 0.3173517, 2.204273, 0, 0, 1, 1, 1,
0.579309, -1.138081, 1.544907, 1, 0, 0, 1, 1,
0.5793192, 0.6673833, 2.091623, 1, 0, 0, 1, 1,
0.586915, -0.5976447, 2.04032, 1, 0, 0, 1, 1,
0.595739, 1.765928, 0.05543204, 1, 0, 0, 1, 1,
0.6030826, -0.8617175, 2.297984, 1, 0, 0, 1, 1,
0.6065112, -0.3873995, 1.307945, 0, 0, 0, 1, 1,
0.6085201, -1.111856, 4.169834, 0, 0, 0, 1, 1,
0.6112693, -0.0692855, 0.1022716, 0, 0, 0, 1, 1,
0.6136021, 0.02992154, 0.2997401, 0, 0, 0, 1, 1,
0.6147617, -1.025787, 3.041901, 0, 0, 0, 1, 1,
0.6192846, -0.3353877, 2.054082, 0, 0, 0, 1, 1,
0.6230786, -1.354596, 2.490851, 0, 0, 0, 1, 1,
0.6238065, -1.654487, 2.744545, 1, 1, 1, 1, 1,
0.6242506, -0.4849125, 3.150422, 1, 1, 1, 1, 1,
0.6250432, -0.7471333, 3.283262, 1, 1, 1, 1, 1,
0.625212, 0.6413273, 0.04372025, 1, 1, 1, 1, 1,
0.6279995, 1.014744, -0.6668724, 1, 1, 1, 1, 1,
0.6303881, 1.160184, -0.2312411, 1, 1, 1, 1, 1,
0.6320212, -0.272459, 0.6939616, 1, 1, 1, 1, 1,
0.6367443, -1.545323, 2.69149, 1, 1, 1, 1, 1,
0.6385885, 0.9998992, -0.1791187, 1, 1, 1, 1, 1,
0.6428431, 1.165668, 0.265445, 1, 1, 1, 1, 1,
0.6449151, -0.3039606, 0.6405357, 1, 1, 1, 1, 1,
0.6459718, 0.7509437, 0.08513126, 1, 1, 1, 1, 1,
0.6468847, 2.098221, -1.169552, 1, 1, 1, 1, 1,
0.6481038, -0.7743598, 3.564452, 1, 1, 1, 1, 1,
0.6518744, 1.309533, 2.063943, 1, 1, 1, 1, 1,
0.6523236, -1.219047, 1.94626, 0, 0, 1, 1, 1,
0.6532292, -1.094841, 1.771065, 1, 0, 0, 1, 1,
0.6562141, -0.1443921, -0.3282638, 1, 0, 0, 1, 1,
0.6630611, 1.057245, 1.098761, 1, 0, 0, 1, 1,
0.664341, -0.2356811, 1.919839, 1, 0, 0, 1, 1,
0.6672316, 1.001457, 0.9224329, 1, 0, 0, 1, 1,
0.6676488, 1.021255, 1.486987, 0, 0, 0, 1, 1,
0.6719544, -0.5556497, 2.867185, 0, 0, 0, 1, 1,
0.6742874, -0.8173715, 3.794715, 0, 0, 0, 1, 1,
0.6805984, -0.9454776, 1.815296, 0, 0, 0, 1, 1,
0.6812873, 1.933839, -0.8042333, 0, 0, 0, 1, 1,
0.6815622, 0.4630247, 1.398104, 0, 0, 0, 1, 1,
0.6849654, 2.021265, -1.63063, 0, 0, 0, 1, 1,
0.6868778, 1.2927, 0.7513207, 1, 1, 1, 1, 1,
0.6930709, 0.5282365, 0.1522699, 1, 1, 1, 1, 1,
0.7073095, 1.914189, -0.1407664, 1, 1, 1, 1, 1,
0.7100928, 0.08863411, 1.667232, 1, 1, 1, 1, 1,
0.7101848, -0.6323009, 2.263984, 1, 1, 1, 1, 1,
0.7103373, 0.2871523, -0.2685375, 1, 1, 1, 1, 1,
0.7149572, 0.2326934, 2.600204, 1, 1, 1, 1, 1,
0.7157462, 0.9939762, -0.5418272, 1, 1, 1, 1, 1,
0.7164509, -0.3446333, 2.775084, 1, 1, 1, 1, 1,
0.7214924, 1.038753, -0.5571348, 1, 1, 1, 1, 1,
0.7215419, 2.055587, 0.6780459, 1, 1, 1, 1, 1,
0.7245145, -1.275133, 3.509116, 1, 1, 1, 1, 1,
0.7258795, -0.9206536, 2.622001, 1, 1, 1, 1, 1,
0.7281071, -0.2924081, 0.6991569, 1, 1, 1, 1, 1,
0.7285395, 1.144058, 0.4588223, 1, 1, 1, 1, 1,
0.7287105, 0.9038659, 0.2766615, 0, 0, 1, 1, 1,
0.7300356, -0.8238522, 1.8395, 1, 0, 0, 1, 1,
0.7363235, 0.4485791, -0.8052606, 1, 0, 0, 1, 1,
0.7378481, -0.7721016, 2.603299, 1, 0, 0, 1, 1,
0.7405235, 0.01537614, 0.9134511, 1, 0, 0, 1, 1,
0.7442321, -1.92056, 2.470828, 1, 0, 0, 1, 1,
0.7478365, -2.418495, 2.760415, 0, 0, 0, 1, 1,
0.7479997, 2.100433, 1.812209, 0, 0, 0, 1, 1,
0.7493551, 0.1279004, 1.747125, 0, 0, 0, 1, 1,
0.7520352, 1.656006, 1.113762, 0, 0, 0, 1, 1,
0.7552355, 1.100407, 1.109124, 0, 0, 0, 1, 1,
0.7554961, 0.08022718, 2.000684, 0, 0, 0, 1, 1,
0.7564532, -1.889855, 2.637125, 0, 0, 0, 1, 1,
0.7591623, -1.177366, 2.610209, 1, 1, 1, 1, 1,
0.7657213, -0.9083629, 1.204971, 1, 1, 1, 1, 1,
0.7665139, 0.5010495, -0.8329095, 1, 1, 1, 1, 1,
0.7684778, 1.082338, 2.181145, 1, 1, 1, 1, 1,
0.7711545, -0.9711624, 1.670717, 1, 1, 1, 1, 1,
0.7729775, 0.522123, -1.384605, 1, 1, 1, 1, 1,
0.7733033, -0.3016255, 1.08978, 1, 1, 1, 1, 1,
0.7736409, 1.042383, 0.5458685, 1, 1, 1, 1, 1,
0.7871577, -0.4364408, 2.359567, 1, 1, 1, 1, 1,
0.7882128, -0.3133136, 2.817706, 1, 1, 1, 1, 1,
0.7942888, -0.3304917, 1.698037, 1, 1, 1, 1, 1,
0.8121054, 0.9791499, 0.7153858, 1, 1, 1, 1, 1,
0.8129795, 0.2664727, 0.9965459, 1, 1, 1, 1, 1,
0.8202398, 0.7997517, 0.152261, 1, 1, 1, 1, 1,
0.8292515, 0.6688733, 0.8737081, 1, 1, 1, 1, 1,
0.829474, -0.02663946, 0.9058028, 0, 0, 1, 1, 1,
0.8381655, -0.04258017, 1.756948, 1, 0, 0, 1, 1,
0.8385258, -0.497806, 1.530175, 1, 0, 0, 1, 1,
0.8395395, 0.9317858, 0.5211586, 1, 0, 0, 1, 1,
0.8464954, -0.6590847, 3.021627, 1, 0, 0, 1, 1,
0.8497095, -1.512584, 1.589518, 1, 0, 0, 1, 1,
0.8619791, 1.561368, 0.3631582, 0, 0, 0, 1, 1,
0.8668617, 0.3029299, 0.9638639, 0, 0, 0, 1, 1,
0.8798602, 0.3032021, 2.407627, 0, 0, 0, 1, 1,
0.8801386, 0.01871815, 1.754328, 0, 0, 0, 1, 1,
0.8801398, 1.476586, -0.4570782, 0, 0, 0, 1, 1,
0.8804488, 0.4869111, 1.038865, 0, 0, 0, 1, 1,
0.8875164, -0.9826809, 3.749053, 0, 0, 0, 1, 1,
0.8907391, -0.4663557, 4.662849, 1, 1, 1, 1, 1,
0.8916358, -0.4106512, 1.948046, 1, 1, 1, 1, 1,
0.899525, -1.166007, 3.875107, 1, 1, 1, 1, 1,
0.9115008, 0.2510318, 1.3523, 1, 1, 1, 1, 1,
0.9122948, 0.6593915, 2.958787, 1, 1, 1, 1, 1,
0.9129803, 1.670982, -0.9258801, 1, 1, 1, 1, 1,
0.9150683, 1.259848, 0.2914787, 1, 1, 1, 1, 1,
0.9202213, -0.9917828, 4.100787, 1, 1, 1, 1, 1,
0.9238364, 0.3497546, -0.200107, 1, 1, 1, 1, 1,
0.9246826, -0.3085788, 2.976617, 1, 1, 1, 1, 1,
0.9265783, -1.619693, 1.633836, 1, 1, 1, 1, 1,
0.9384636, -1.877064, 2.18428, 1, 1, 1, 1, 1,
0.9393131, 0.3285233, 1.366482, 1, 1, 1, 1, 1,
0.941514, -0.2485877, -0.2794464, 1, 1, 1, 1, 1,
0.9456781, -1.234504, 2.612533, 1, 1, 1, 1, 1,
0.9464687, -2.245458, 4.668625, 0, 0, 1, 1, 1,
0.9603103, -0.6541268, 2.007817, 1, 0, 0, 1, 1,
0.9618449, -0.9908982, 1.15062, 1, 0, 0, 1, 1,
0.9632285, 0.3828832, 1.900298, 1, 0, 0, 1, 1,
0.9645442, 0.2815495, 0.2895164, 1, 0, 0, 1, 1,
0.9650251, -0.147133, 1.382428, 1, 0, 0, 1, 1,
0.9667438, -0.9895589, 1.906276, 0, 0, 0, 1, 1,
0.9685957, -1.950835, 2.554639, 0, 0, 0, 1, 1,
0.9706364, -1.331901, 2.180182, 0, 0, 0, 1, 1,
0.9718097, -0.6133688, 2.35199, 0, 0, 0, 1, 1,
0.9726216, -0.4611237, 2.029251, 0, 0, 0, 1, 1,
0.973098, 0.3259594, -1.476098, 0, 0, 0, 1, 1,
0.9751264, -0.130366, 1.244339, 0, 0, 0, 1, 1,
0.9769736, 0.2190262, 1.812966, 1, 1, 1, 1, 1,
0.9805527, -0.7050616, 3.226831, 1, 1, 1, 1, 1,
0.9811672, -0.3852112, -0.8998227, 1, 1, 1, 1, 1,
0.9824764, -1.233652, 2.340954, 1, 1, 1, 1, 1,
0.9856125, 1.092443, 1.244535, 1, 1, 1, 1, 1,
0.9862413, -0.1540694, 0.9376072, 1, 1, 1, 1, 1,
0.9949684, -0.671571, 1.707523, 1, 1, 1, 1, 1,
1.001203, 0.4396308, 1.370711, 1, 1, 1, 1, 1,
1.00141, -0.4015192, 1.638931, 1, 1, 1, 1, 1,
1.007035, -2.333467, 1.745173, 1, 1, 1, 1, 1,
1.007331, -1.120037, 2.998536, 1, 1, 1, 1, 1,
1.010011, -0.8653788, 3.841736, 1, 1, 1, 1, 1,
1.017055, -0.5426421, 2.251017, 1, 1, 1, 1, 1,
1.025216, -1.459132, 2.07442, 1, 1, 1, 1, 1,
1.033656, -0.4473359, 2.286437, 1, 1, 1, 1, 1,
1.039505, -1.419533, 1.721718, 0, 0, 1, 1, 1,
1.049686, -0.687917, 2.696591, 1, 0, 0, 1, 1,
1.057701, 0.8196138, 1.422535, 1, 0, 0, 1, 1,
1.060719, 0.7482471, 0.9568157, 1, 0, 0, 1, 1,
1.067673, -0.8959169, 2.482386, 1, 0, 0, 1, 1,
1.067838, -1.162364, 2.33681, 1, 0, 0, 1, 1,
1.07964, 0.02468742, 0.8887301, 0, 0, 0, 1, 1,
1.082411, 0.6069394, 2.358666, 0, 0, 0, 1, 1,
1.088551, -1.648759, 1.19382, 0, 0, 0, 1, 1,
1.090116, 0.8067167, 1.405598, 0, 0, 0, 1, 1,
1.092399, -0.1916938, 1.424639, 0, 0, 0, 1, 1,
1.098345, 0.04205041, 2.024501, 0, 0, 0, 1, 1,
1.115197, -0.7064568, 1.558598, 0, 0, 0, 1, 1,
1.123304, 0.3590668, 1.408518, 1, 1, 1, 1, 1,
1.125127, 1.424862, -0.6032655, 1, 1, 1, 1, 1,
1.128667, 0.08726898, 1.248292, 1, 1, 1, 1, 1,
1.1293, 0.1467496, 1.604286, 1, 1, 1, 1, 1,
1.130818, 0.3285753, 2.543072, 1, 1, 1, 1, 1,
1.132471, -1.455317, 0.73203, 1, 1, 1, 1, 1,
1.134353, 0.1684802, 0.2575946, 1, 1, 1, 1, 1,
1.136371, 0.2890613, 2.232831, 1, 1, 1, 1, 1,
1.142721, -0.9867711, 4.032101, 1, 1, 1, 1, 1,
1.164364, 0.1300927, 1.261353, 1, 1, 1, 1, 1,
1.168992, -1.143763, 2.648435, 1, 1, 1, 1, 1,
1.177037, 0.7240157, 1.757765, 1, 1, 1, 1, 1,
1.180269, 0.8748053, -0.8418788, 1, 1, 1, 1, 1,
1.180996, -1.217909, 2.936491, 1, 1, 1, 1, 1,
1.181212, -0.9039847, 3.013289, 1, 1, 1, 1, 1,
1.195832, 1.916487, 0.7806026, 0, 0, 1, 1, 1,
1.200547, 1.860803, 0.04563459, 1, 0, 0, 1, 1,
1.203681, 1.016319, -0.7034613, 1, 0, 0, 1, 1,
1.204368, -0.09717409, 1.425153, 1, 0, 0, 1, 1,
1.205314, 0.5160224, 2.299452, 1, 0, 0, 1, 1,
1.208403, -2.080876, 4.083908, 1, 0, 0, 1, 1,
1.22655, -1.834008, 4.108562, 0, 0, 0, 1, 1,
1.228732, 0.644978, 1.624933, 0, 0, 0, 1, 1,
1.229003, -0.978207, 3.185886, 0, 0, 0, 1, 1,
1.254782, 0.1887101, 0.2754749, 0, 0, 0, 1, 1,
1.258067, -0.9635275, 2.541665, 0, 0, 0, 1, 1,
1.260142, -0.6955059, 2.665017, 0, 0, 0, 1, 1,
1.265912, -0.4766833, 1.847601, 0, 0, 0, 1, 1,
1.279937, 0.4313919, 1.012992, 1, 1, 1, 1, 1,
1.287921, -0.3252407, 2.815315, 1, 1, 1, 1, 1,
1.289353, 1.358808, 1.897681, 1, 1, 1, 1, 1,
1.289949, 0.6605604, 1.166685, 1, 1, 1, 1, 1,
1.296035, -1.992648, 4.184895, 1, 1, 1, 1, 1,
1.29744, 0.189276, 2.243916, 1, 1, 1, 1, 1,
1.312161, -0.9547238, 2.242034, 1, 1, 1, 1, 1,
1.316966, -0.01451783, 0.7540051, 1, 1, 1, 1, 1,
1.318316, -1.209396, 3.801715, 1, 1, 1, 1, 1,
1.319272, -0.9113669, 1.460602, 1, 1, 1, 1, 1,
1.32126, 1.170351, -1.073704, 1, 1, 1, 1, 1,
1.328457, 0.6097009, 1.475709, 1, 1, 1, 1, 1,
1.338057, 1.30658, 1.418019, 1, 1, 1, 1, 1,
1.33998, -0.827827, 2.37037, 1, 1, 1, 1, 1,
1.349523, 0.4010603, -0.561226, 1, 1, 1, 1, 1,
1.35114, -0.4814089, 4.416759, 0, 0, 1, 1, 1,
1.351255, -1.645264, 1.318054, 1, 0, 0, 1, 1,
1.36808, -0.4393581, 3.390101, 1, 0, 0, 1, 1,
1.380722, -0.3342201, 1.9925, 1, 0, 0, 1, 1,
1.381954, 0.7606821, -0.408857, 1, 0, 0, 1, 1,
1.38888, 0.5606887, 1.201237, 1, 0, 0, 1, 1,
1.402411, -0.1376998, 1.839481, 0, 0, 0, 1, 1,
1.412492, 0.08090013, -0.09930093, 0, 0, 0, 1, 1,
1.425281, 0.373312, 0.6533625, 0, 0, 0, 1, 1,
1.429169, -0.6047987, 1.922625, 0, 0, 0, 1, 1,
1.430526, -0.9959459, 2.492114, 0, 0, 0, 1, 1,
1.432607, 1.735146, 1.641903, 0, 0, 0, 1, 1,
1.437003, 1.850535, -0.285533, 0, 0, 0, 1, 1,
1.448697, -0.2544327, 3.223938, 1, 1, 1, 1, 1,
1.452406, 0.4736172, 2.392376, 1, 1, 1, 1, 1,
1.459015, -0.5335574, 0.8075355, 1, 1, 1, 1, 1,
1.465481, 0.1284891, 0.5699195, 1, 1, 1, 1, 1,
1.485562, 0.9134804, 0.5604959, 1, 1, 1, 1, 1,
1.489879, 0.8608302, -0.6963542, 1, 1, 1, 1, 1,
1.495296, -0.9988248, 2.723137, 1, 1, 1, 1, 1,
1.518644, -0.003292212, 1.3002, 1, 1, 1, 1, 1,
1.544491, -0.6144623, 2.918017, 1, 1, 1, 1, 1,
1.552492, -0.691808, 0.7669355, 1, 1, 1, 1, 1,
1.563291, -0.341528, 0.8625954, 1, 1, 1, 1, 1,
1.568027, -0.4096495, -0.05895421, 1, 1, 1, 1, 1,
1.569439, 0.1298163, 0.5766044, 1, 1, 1, 1, 1,
1.581381, 0.6658801, 2.165435, 1, 1, 1, 1, 1,
1.589156, -1.237129, 1.527847, 1, 1, 1, 1, 1,
1.598186, -0.02324073, 2.78413, 0, 0, 1, 1, 1,
1.600128, 1.617801, 1.116376, 1, 0, 0, 1, 1,
1.613012, 0.7880743, 2.017774, 1, 0, 0, 1, 1,
1.628743, 0.9969904, -0.1637355, 1, 0, 0, 1, 1,
1.630749, 1.5406, 1.171095, 1, 0, 0, 1, 1,
1.637678, -1.750455, 3.058367, 1, 0, 0, 1, 1,
1.662762, -0.3174671, 2.231185, 0, 0, 0, 1, 1,
1.664864, -0.402577, 2.581261, 0, 0, 0, 1, 1,
1.666668, -1.182582, -0.3603821, 0, 0, 0, 1, 1,
1.66688, 0.3769958, 1.596869, 0, 0, 0, 1, 1,
1.672741, 1.042119, 0.6517916, 0, 0, 0, 1, 1,
1.690461, 0.08307406, 2.570377, 0, 0, 0, 1, 1,
1.692123, -0.3353966, 1.815736, 0, 0, 0, 1, 1,
1.698328, -1.217508, 2.363503, 1, 1, 1, 1, 1,
1.701319, 0.3262023, 0.7868207, 1, 1, 1, 1, 1,
1.701612, -1.321193, 2.010999, 1, 1, 1, 1, 1,
1.705684, 0.4756961, 0.2798321, 1, 1, 1, 1, 1,
1.705848, -0.7148687, 2.914371, 1, 1, 1, 1, 1,
1.706822, -1.127683, 3.68498, 1, 1, 1, 1, 1,
1.71322, -1.677034, 2.401672, 1, 1, 1, 1, 1,
1.725834, -0.7636889, 1.465901, 1, 1, 1, 1, 1,
1.729804, -0.07457416, 1.255171, 1, 1, 1, 1, 1,
1.742812, 1.56388, 1.630031, 1, 1, 1, 1, 1,
1.752691, 0.05088511, 2.636695, 1, 1, 1, 1, 1,
1.759451, -1.256066, 0.9910301, 1, 1, 1, 1, 1,
1.763808, -0.888187, -0.1737787, 1, 1, 1, 1, 1,
1.767332, 2.442694, 0.6466876, 1, 1, 1, 1, 1,
1.768181, -0.9148123, 1.549064, 1, 1, 1, 1, 1,
1.774669, 1.198535, -0.0770904, 0, 0, 1, 1, 1,
1.801723, 0.7294709, 1.788942, 1, 0, 0, 1, 1,
1.803206, 0.08169154, 3.421186, 1, 0, 0, 1, 1,
1.836277, 1.129658, 0.8989583, 1, 0, 0, 1, 1,
1.843717, 0.5201519, -0.2653457, 1, 0, 0, 1, 1,
1.850758, -0.4040522, 1.411412, 1, 0, 0, 1, 1,
1.858111, 1.458943, 0.8932077, 0, 0, 0, 1, 1,
1.867756, -0.2005074, 1.324465, 0, 0, 0, 1, 1,
1.873477, -1.256142, 1.112547, 0, 0, 0, 1, 1,
1.87697, -0.8968507, 0.7572753, 0, 0, 0, 1, 1,
1.878735, -0.4442498, 0.9590984, 0, 0, 0, 1, 1,
1.878804, 0.1634323, 0.3605596, 0, 0, 0, 1, 1,
1.902287, -1.280651, 3.399473, 0, 0, 0, 1, 1,
1.902331, 0.3088043, 1.530111, 1, 1, 1, 1, 1,
1.903453, -0.1449047, 1.100402, 1, 1, 1, 1, 1,
1.903682, 0.1787276, 0.9769654, 1, 1, 1, 1, 1,
1.913401, -0.2641484, 0.6299365, 1, 1, 1, 1, 1,
1.941503, 1.26361, 1.312574, 1, 1, 1, 1, 1,
1.952248, -0.7331023, 2.096415, 1, 1, 1, 1, 1,
1.968266, -0.04168948, 0.6344405, 1, 1, 1, 1, 1,
2.004424, -1.85232, 0.8319755, 1, 1, 1, 1, 1,
2.006198, 0.004410956, 2.005114, 1, 1, 1, 1, 1,
2.008662, -0.4886739, 2.163566, 1, 1, 1, 1, 1,
2.036103, -0.8529612, 3.81977, 1, 1, 1, 1, 1,
2.039394, 0.4298854, 0.8531711, 1, 1, 1, 1, 1,
2.052346, 1.100999, 1.045311, 1, 1, 1, 1, 1,
2.056064, -0.4526307, 0.7200932, 1, 1, 1, 1, 1,
2.076993, 1.044271, 2.005704, 1, 1, 1, 1, 1,
2.077205, 2.013271, 0.3124869, 0, 0, 1, 1, 1,
2.12031, 0.07392939, -0.6036482, 1, 0, 0, 1, 1,
2.125288, -0.7560467, 2.483074, 1, 0, 0, 1, 1,
2.127475, -0.4114224, 3.13862, 1, 0, 0, 1, 1,
2.145945, -0.6614109, 1.201456, 1, 0, 0, 1, 1,
2.170111, -0.9733045, 3.429109, 1, 0, 0, 1, 1,
2.202198, 0.5259215, 1.685502, 0, 0, 0, 1, 1,
2.241593, 1.469562, 0.1188575, 0, 0, 0, 1, 1,
2.274515, -1.889637, 1.530643, 0, 0, 0, 1, 1,
2.339945, 0.6154237, 1.430778, 0, 0, 0, 1, 1,
2.36149, 0.8064996, 1.198766, 0, 0, 0, 1, 1,
2.388633, 0.3706883, 1.142158, 0, 0, 0, 1, 1,
2.407889, 1.066106, 1.234047, 0, 0, 0, 1, 1,
2.546541, -0.56598, 0.564077, 1, 1, 1, 1, 1,
2.570156, 0.9162346, 1.474486, 1, 1, 1, 1, 1,
2.585625, 1.544331, 0.5488966, 1, 1, 1, 1, 1,
2.624114, 0.01513488, -0.4017484, 1, 1, 1, 1, 1,
2.756209, -0.03516563, 0.5203958, 1, 1, 1, 1, 1,
2.792938, -1.245534, 1.900055, 1, 1, 1, 1, 1,
2.912367, 0.2539575, 2.960478, 1, 1, 1, 1, 1
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
var radius = 9.784446;
var distance = 34.36745;
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
mvMatrix.translate( 0.345379, 0.2642214, -0.3064682 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.36745);
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
