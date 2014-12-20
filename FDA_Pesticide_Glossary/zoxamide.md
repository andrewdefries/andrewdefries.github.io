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
-3.078775, 0.602332, -0.1194758, 1, 0, 0, 1,
-3.015205, -0.2658467, -1.451712, 1, 0.007843138, 0, 1,
-2.830711, 0.6554084, -1.382243, 1, 0.01176471, 0, 1,
-2.785743, -0.8843039, -2.53651, 1, 0.01960784, 0, 1,
-2.734892, -0.7867444, -1.196764, 1, 0.02352941, 0, 1,
-2.650137, 0.6669397, -1.967261, 1, 0.03137255, 0, 1,
-2.647888, -1.145587, -3.265758, 1, 0.03529412, 0, 1,
-2.587502, 0.602136, -0.8618559, 1, 0.04313726, 0, 1,
-2.459821, -0.4633061, -1.942517, 1, 0.04705882, 0, 1,
-2.408539, -0.4704134, -2.017492, 1, 0.05490196, 0, 1,
-2.389639, 0.8733383, -2.524743, 1, 0.05882353, 0, 1,
-2.357168, -0.2245993, 0.7265474, 1, 0.06666667, 0, 1,
-2.335451, 0.2107607, 0.0484888, 1, 0.07058824, 0, 1,
-2.320001, -0.3243201, 0.04404821, 1, 0.07843138, 0, 1,
-2.31222, -0.8438526, -0.9425402, 1, 0.08235294, 0, 1,
-2.267394, 1.750542, -0.6704922, 1, 0.09019608, 0, 1,
-2.219487, 2.368944, -1.308948, 1, 0.09411765, 0, 1,
-2.213014, -1.673141, -2.527934, 1, 0.1019608, 0, 1,
-2.161987, 1.331561, -2.702531, 1, 0.1098039, 0, 1,
-2.15814, 0.06924606, -2.726434, 1, 0.1137255, 0, 1,
-2.103543, -0.6140394, -2.538513, 1, 0.1215686, 0, 1,
-2.100211, -0.8665678, -2.861361, 1, 0.1254902, 0, 1,
-2.085994, 0.8114142, -0.2280626, 1, 0.1333333, 0, 1,
-2.058019, 1.374411, -1.781043, 1, 0.1372549, 0, 1,
-2.053483, 0.1228932, -1.070528, 1, 0.145098, 0, 1,
-2.04044, 0.7672952, 0.05735356, 1, 0.1490196, 0, 1,
-2.008149, 1.642643, -0.7767804, 1, 0.1568628, 0, 1,
-1.989385, -0.06235817, -2.670803, 1, 0.1607843, 0, 1,
-1.976852, 0.526994, -1.487682, 1, 0.1686275, 0, 1,
-1.920903, 1.230294, -1.704975, 1, 0.172549, 0, 1,
-1.918949, -0.1610581, -1.382496, 1, 0.1803922, 0, 1,
-1.903448, -0.3131005, -2.832177, 1, 0.1843137, 0, 1,
-1.898025, 1.259165, 0.723974, 1, 0.1921569, 0, 1,
-1.891685, 0.8687892, -0.8806922, 1, 0.1960784, 0, 1,
-1.890231, -0.1961218, -2.379005, 1, 0.2039216, 0, 1,
-1.879808, 0.636683, -1.976175, 1, 0.2117647, 0, 1,
-1.872202, -0.8941966, -1.892721, 1, 0.2156863, 0, 1,
-1.861036, -2.031351, -2.340963, 1, 0.2235294, 0, 1,
-1.85869, -1.39025, -1.826793, 1, 0.227451, 0, 1,
-1.844643, -1.436458, -3.01977, 1, 0.2352941, 0, 1,
-1.806495, -0.4156935, -0.8533157, 1, 0.2392157, 0, 1,
-1.793309, -1.203529, -1.126539, 1, 0.2470588, 0, 1,
-1.757627, -0.1983377, -2.557259, 1, 0.2509804, 0, 1,
-1.742979, -0.595706, -0.2525216, 1, 0.2588235, 0, 1,
-1.729932, 0.7390007, -1.5506, 1, 0.2627451, 0, 1,
-1.677004, -0.2749409, -1.456389, 1, 0.2705882, 0, 1,
-1.647145, 0.5486526, -1.534644, 1, 0.2745098, 0, 1,
-1.614766, 0.901376, -0.5954123, 1, 0.282353, 0, 1,
-1.60857, 0.3690244, -2.031339, 1, 0.2862745, 0, 1,
-1.60201, -0.5644392, -2.471224, 1, 0.2941177, 0, 1,
-1.559227, -0.1494545, -1.819572, 1, 0.3019608, 0, 1,
-1.549241, 1.450692, 1.662392, 1, 0.3058824, 0, 1,
-1.51763, 1.647469, -1.571549, 1, 0.3137255, 0, 1,
-1.490884, 0.5971437, 0.3638484, 1, 0.3176471, 0, 1,
-1.48761, -0.3752584, -1.838021, 1, 0.3254902, 0, 1,
-1.472604, -0.6343549, -1.993957, 1, 0.3294118, 0, 1,
-1.459202, -1.681643, -2.659463, 1, 0.3372549, 0, 1,
-1.457038, -1.060832, -2.350909, 1, 0.3411765, 0, 1,
-1.450625, 0.3660811, -2.006147, 1, 0.3490196, 0, 1,
-1.447829, -0.982814, -1.740401, 1, 0.3529412, 0, 1,
-1.431104, 0.4302791, 0.4755071, 1, 0.3607843, 0, 1,
-1.428984, -1.475237, -1.574707, 1, 0.3647059, 0, 1,
-1.404301, -0.01919853, -2.5899, 1, 0.372549, 0, 1,
-1.399032, 1.805315, -3.604199, 1, 0.3764706, 0, 1,
-1.395762, 0.4435132, -1.767576, 1, 0.3843137, 0, 1,
-1.393371, 0.8633294, -0.6672966, 1, 0.3882353, 0, 1,
-1.392048, -1.445379, -1.280399, 1, 0.3960784, 0, 1,
-1.384608, -0.3595057, -1.673694, 1, 0.4039216, 0, 1,
-1.382936, -0.7667961, -1.901281, 1, 0.4078431, 0, 1,
-1.380611, -0.506094, -1.486181, 1, 0.4156863, 0, 1,
-1.373101, -2.523249, -1.441957, 1, 0.4196078, 0, 1,
-1.371475, -2.214248, -3.306428, 1, 0.427451, 0, 1,
-1.3713, -0.2012233, -2.275819, 1, 0.4313726, 0, 1,
-1.370405, 0.7146751, -1.585434, 1, 0.4392157, 0, 1,
-1.367295, -0.4000743, -2.001222, 1, 0.4431373, 0, 1,
-1.366473, -0.09327495, -1.015094, 1, 0.4509804, 0, 1,
-1.364094, -0.5112498, -0.5095463, 1, 0.454902, 0, 1,
-1.362237, 0.477851, -0.8646723, 1, 0.4627451, 0, 1,
-1.360527, -1.140595, -4.708232, 1, 0.4666667, 0, 1,
-1.359478, -0.5543882, -2.328123, 1, 0.4745098, 0, 1,
-1.357243, -1.081816, -1.072207, 1, 0.4784314, 0, 1,
-1.355682, -0.7441549, -2.248425, 1, 0.4862745, 0, 1,
-1.348174, 2.156364, -0.3650649, 1, 0.4901961, 0, 1,
-1.340009, 1.716368, -1.43095, 1, 0.4980392, 0, 1,
-1.337405, 0.9485629, -0.4592566, 1, 0.5058824, 0, 1,
-1.335972, -0.8362288, 0.3161074, 1, 0.509804, 0, 1,
-1.331306, 0.1413132, -2.873647, 1, 0.5176471, 0, 1,
-1.32997, -0.6957805, -3.069334, 1, 0.5215687, 0, 1,
-1.329535, -1.248237, -4.027197, 1, 0.5294118, 0, 1,
-1.328984, 1.011237, -1.093511, 1, 0.5333334, 0, 1,
-1.327843, 0.1367137, -0.8345162, 1, 0.5411765, 0, 1,
-1.321621, -0.321751, -3.414709, 1, 0.5450981, 0, 1,
-1.313751, 0.8812429, -0.2600511, 1, 0.5529412, 0, 1,
-1.298148, 0.3937388, -0.2590976, 1, 0.5568628, 0, 1,
-1.292001, 0.6651021, 0.1621551, 1, 0.5647059, 0, 1,
-1.283839, 0.7316757, -1.475652, 1, 0.5686275, 0, 1,
-1.279922, 0.5264081, -1.666862, 1, 0.5764706, 0, 1,
-1.271222, 1.525955, 0.6954825, 1, 0.5803922, 0, 1,
-1.270946, 0.4471422, -0.4270887, 1, 0.5882353, 0, 1,
-1.263514, 1.304559, -2.455568, 1, 0.5921569, 0, 1,
-1.257208, -1.659585, -3.921978, 1, 0.6, 0, 1,
-1.253563, -0.8962326, -2.300259, 1, 0.6078432, 0, 1,
-1.242057, 0.111342, -2.852695, 1, 0.6117647, 0, 1,
-1.236559, 0.7517885, -1.016765, 1, 0.6196079, 0, 1,
-1.230781, -0.3650993, -1.544441, 1, 0.6235294, 0, 1,
-1.229186, -0.5388307, -2.741137, 1, 0.6313726, 0, 1,
-1.223669, 0.5130842, 1.118066, 1, 0.6352941, 0, 1,
-1.216645, 0.3853629, 1.903726, 1, 0.6431373, 0, 1,
-1.215435, -0.07861643, -3.387388, 1, 0.6470588, 0, 1,
-1.212623, -0.9873635, -1.698816, 1, 0.654902, 0, 1,
-1.203916, 0.599333, 0.1647301, 1, 0.6588235, 0, 1,
-1.203668, 0.0545688, -1.423315, 1, 0.6666667, 0, 1,
-1.20226, -0.8930636, -2.957007, 1, 0.6705883, 0, 1,
-1.201223, -1.323735, -0.4896869, 1, 0.6784314, 0, 1,
-1.199488, -1.851745, -1.817308, 1, 0.682353, 0, 1,
-1.191521, 1.711305, -0.2617591, 1, 0.6901961, 0, 1,
-1.188753, -0.3782662, -2.297541, 1, 0.6941177, 0, 1,
-1.188338, -0.9736113, -2.986274, 1, 0.7019608, 0, 1,
-1.188131, -0.5249961, -0.9837878, 1, 0.7098039, 0, 1,
-1.188055, -1.00514, 0.08977081, 1, 0.7137255, 0, 1,
-1.187323, -0.6484627, -2.450094, 1, 0.7215686, 0, 1,
-1.186984, 0.74753, -1.223867, 1, 0.7254902, 0, 1,
-1.183095, 0.2684999, -1.978358, 1, 0.7333333, 0, 1,
-1.178795, 0.36637, -1.299065, 1, 0.7372549, 0, 1,
-1.175577, 1.533886, -0.9516043, 1, 0.7450981, 0, 1,
-1.172432, -0.9842743, -4.171241, 1, 0.7490196, 0, 1,
-1.16962, 0.4671095, -1.891656, 1, 0.7568628, 0, 1,
-1.167046, 0.1099906, -2.282028, 1, 0.7607843, 0, 1,
-1.166926, 0.2975921, -3.04189, 1, 0.7686275, 0, 1,
-1.15963, -0.6672345, -2.987859, 1, 0.772549, 0, 1,
-1.157918, -0.157171, -1.839103, 1, 0.7803922, 0, 1,
-1.155594, -1.168432, -2.189731, 1, 0.7843137, 0, 1,
-1.148952, 0.8363447, -1.354844, 1, 0.7921569, 0, 1,
-1.147099, 0.2168579, -2.029987, 1, 0.7960784, 0, 1,
-1.14301, -1.648059, -3.144976, 1, 0.8039216, 0, 1,
-1.135074, 0.7790262, 0.8559575, 1, 0.8117647, 0, 1,
-1.121518, 0.4717679, 0.08475596, 1, 0.8156863, 0, 1,
-1.119259, -0.239911, -1.162007, 1, 0.8235294, 0, 1,
-1.115878, 0.5148534, -0.08347909, 1, 0.827451, 0, 1,
-1.114547, 0.3970921, -0.7104921, 1, 0.8352941, 0, 1,
-1.099567, 1.040566, -0.7995893, 1, 0.8392157, 0, 1,
-1.09947, 0.1752057, -3.146238, 1, 0.8470588, 0, 1,
-1.095161, 0.4934185, -0.4929287, 1, 0.8509804, 0, 1,
-1.094538, 2.088674, 0.2188207, 1, 0.8588235, 0, 1,
-1.084489, 0.566941, -1.732131, 1, 0.8627451, 0, 1,
-1.082929, -0.3217249, -1.022657, 1, 0.8705882, 0, 1,
-1.078104, -0.5572439, -1.264889, 1, 0.8745098, 0, 1,
-1.077658, 0.9410011, -1.03585, 1, 0.8823529, 0, 1,
-1.074211, -0.1998924, -1.359151, 1, 0.8862745, 0, 1,
-1.070952, 1.004391, -1.284383, 1, 0.8941177, 0, 1,
-1.068781, -0.4131871, -0.6421528, 1, 0.8980392, 0, 1,
-1.065202, -0.2696404, -1.333403, 1, 0.9058824, 0, 1,
-1.059907, 0.1972492, -1.25148, 1, 0.9137255, 0, 1,
-1.048403, -0.03845083, -1.976358, 1, 0.9176471, 0, 1,
-1.038498, -0.2062147, -3.241225, 1, 0.9254902, 0, 1,
-1.03143, -0.274584, -1.079867, 1, 0.9294118, 0, 1,
-1.026536, 0.8810467, -0.6727324, 1, 0.9372549, 0, 1,
-1.026535, 0.2458181, -0.1514964, 1, 0.9411765, 0, 1,
-1.018245, 0.8711548, -2.429345, 1, 0.9490196, 0, 1,
-1.013631, 0.7308946, -0.7055395, 1, 0.9529412, 0, 1,
-1.012805, 0.6133185, -1.027685, 1, 0.9607843, 0, 1,
-1.011341, -0.5228876, -2.255154, 1, 0.9647059, 0, 1,
-1.006778, -0.03317252, -0.4565381, 1, 0.972549, 0, 1,
-1.004253, -1.765247, -1.027047, 1, 0.9764706, 0, 1,
-1.001776, -0.4852965, -0.916829, 1, 0.9843137, 0, 1,
-1.000818, -1.490197, -1.511111, 1, 0.9882353, 0, 1,
-1.000783, 0.009703412, -0.2845751, 1, 0.9960784, 0, 1,
-0.9984257, 0.1564665, -2.039209, 0.9960784, 1, 0, 1,
-0.9975345, -0.1045379, -0.9930027, 0.9921569, 1, 0, 1,
-0.9922301, 0.9392975, 0.1430808, 0.9843137, 1, 0, 1,
-0.9913372, 0.4580901, -0.1047111, 0.9803922, 1, 0, 1,
-0.9870089, 1.198577, -1.006892, 0.972549, 1, 0, 1,
-0.9862188, 1.331285, -0.08913016, 0.9686275, 1, 0, 1,
-0.9836079, 0.4840136, -0.2448447, 0.9607843, 1, 0, 1,
-0.9806979, 1.169913, -0.5499121, 0.9568627, 1, 0, 1,
-0.9773784, -0.7841096, -0.2054587, 0.9490196, 1, 0, 1,
-0.9644024, -1.458296, -1.778214, 0.945098, 1, 0, 1,
-0.9643776, -1.697226, -4.419512, 0.9372549, 1, 0, 1,
-0.9626377, 0.7891353, -0.9529694, 0.9333333, 1, 0, 1,
-0.9609208, -0.7386901, -0.8554214, 0.9254902, 1, 0, 1,
-0.9594048, 1.07439, 0.6924774, 0.9215686, 1, 0, 1,
-0.9530674, -0.1948876, -1.846907, 0.9137255, 1, 0, 1,
-0.9488081, 0.1715899, -2.179121, 0.9098039, 1, 0, 1,
-0.9460425, 0.08827467, -0.9435951, 0.9019608, 1, 0, 1,
-0.9450589, 0.7149928, -2.0449, 0.8941177, 1, 0, 1,
-0.9448321, 0.8847984, 0.5171939, 0.8901961, 1, 0, 1,
-0.9432943, -1.38157, -2.728619, 0.8823529, 1, 0, 1,
-0.940639, 1.474253, -1.713287, 0.8784314, 1, 0, 1,
-0.9399434, 1.491199, -0.5420769, 0.8705882, 1, 0, 1,
-0.9385287, -0.131818, -0.1093347, 0.8666667, 1, 0, 1,
-0.9382107, 1.906523, -0.5975173, 0.8588235, 1, 0, 1,
-0.9372942, 0.4455899, -1.268187, 0.854902, 1, 0, 1,
-0.9355033, -0.06747864, -2.204452, 0.8470588, 1, 0, 1,
-0.9275942, 0.687283, -0.6616879, 0.8431373, 1, 0, 1,
-0.9264679, 0.3911265, -2.174666, 0.8352941, 1, 0, 1,
-0.921743, 1.696257, 0.09221814, 0.8313726, 1, 0, 1,
-0.9196668, -1.453469, -2.459839, 0.8235294, 1, 0, 1,
-0.9191678, -2.699201, -2.067925, 0.8196079, 1, 0, 1,
-0.918573, -0.07674781, -2.159215, 0.8117647, 1, 0, 1,
-0.9147357, -0.6994715, -4.110565, 0.8078431, 1, 0, 1,
-0.908205, -0.853963, -3.899818, 0.8, 1, 0, 1,
-0.9071664, -1.316055, -3.451352, 0.7921569, 1, 0, 1,
-0.901723, -1.154378, -4.603757, 0.7882353, 1, 0, 1,
-0.8991461, -0.761874, -0.7325327, 0.7803922, 1, 0, 1,
-0.8978287, 0.2908287, -2.043212, 0.7764706, 1, 0, 1,
-0.8955104, -0.2343632, -0.5478696, 0.7686275, 1, 0, 1,
-0.892575, 1.304422, -0.3511084, 0.7647059, 1, 0, 1,
-0.8915768, -0.6620927, -2.583757, 0.7568628, 1, 0, 1,
-0.8907888, 0.9218301, -0.5785077, 0.7529412, 1, 0, 1,
-0.8869472, -0.2233486, -1.138447, 0.7450981, 1, 0, 1,
-0.8862587, 0.7362437, -0.6109523, 0.7411765, 1, 0, 1,
-0.8723381, -0.06202686, -2.722162, 0.7333333, 1, 0, 1,
-0.8608355, 0.06169022, -1.009343, 0.7294118, 1, 0, 1,
-0.856963, -0.1514369, -0.6203294, 0.7215686, 1, 0, 1,
-0.8526527, 0.5075978, 0.3374282, 0.7176471, 1, 0, 1,
-0.8481284, 0.003026232, -3.114352, 0.7098039, 1, 0, 1,
-0.8470148, 1.687281, -0.6229473, 0.7058824, 1, 0, 1,
-0.844309, -0.660622, -3.458456, 0.6980392, 1, 0, 1,
-0.8246982, -0.7082962, -0.2954006, 0.6901961, 1, 0, 1,
-0.8217991, 0.79928, -0.2107822, 0.6862745, 1, 0, 1,
-0.8206362, 0.9289264, -1.937939, 0.6784314, 1, 0, 1,
-0.8142854, -1.261976, -0.13898, 0.6745098, 1, 0, 1,
-0.8136232, 0.6863366, -2.801761, 0.6666667, 1, 0, 1,
-0.8131121, -0.3273229, -4.211334, 0.6627451, 1, 0, 1,
-0.8047682, 1.604079, -1.459288, 0.654902, 1, 0, 1,
-0.8038785, 0.875695, -0.6339414, 0.6509804, 1, 0, 1,
-0.7842768, 0.1172503, -2.655118, 0.6431373, 1, 0, 1,
-0.7830673, 0.2624516, -3.067779, 0.6392157, 1, 0, 1,
-0.7764397, 1.347806, -0.5612943, 0.6313726, 1, 0, 1,
-0.7739869, 0.5463189, -2.521154, 0.627451, 1, 0, 1,
-0.7733389, 0.3743649, -0.1848412, 0.6196079, 1, 0, 1,
-0.7650941, -0.3857591, -2.986104, 0.6156863, 1, 0, 1,
-0.7650824, -0.993461, -0.8009308, 0.6078432, 1, 0, 1,
-0.7571784, 0.1088866, -1.869856, 0.6039216, 1, 0, 1,
-0.7559725, 1.680385, -1.243696, 0.5960785, 1, 0, 1,
-0.7515173, 0.6669625, -1.261143, 0.5882353, 1, 0, 1,
-0.7485651, -1.645108, -2.784333, 0.5843138, 1, 0, 1,
-0.7479953, 0.5119361, -0.9806433, 0.5764706, 1, 0, 1,
-0.7401665, -0.8359875, -0.5126367, 0.572549, 1, 0, 1,
-0.7275814, 0.380455, -0.08827373, 0.5647059, 1, 0, 1,
-0.7263013, 0.07494708, -1.111344, 0.5607843, 1, 0, 1,
-0.7238859, 0.5224002, -1.542439, 0.5529412, 1, 0, 1,
-0.7143346, -0.3758217, -1.455586, 0.5490196, 1, 0, 1,
-0.7110813, -1.685553, -3.478739, 0.5411765, 1, 0, 1,
-0.708694, -0.2910398, -2.081278, 0.5372549, 1, 0, 1,
-0.704284, 0.2286267, -1.135149, 0.5294118, 1, 0, 1,
-0.7023954, 0.1771356, -0.8475489, 0.5254902, 1, 0, 1,
-0.6995739, -0.4448313, -2.021445, 0.5176471, 1, 0, 1,
-0.6928197, 0.5096229, -0.2986258, 0.5137255, 1, 0, 1,
-0.6883854, 0.5165731, 0.2579266, 0.5058824, 1, 0, 1,
-0.6848978, -0.8335987, -2.588819, 0.5019608, 1, 0, 1,
-0.6778392, -0.5846569, -1.103676, 0.4941176, 1, 0, 1,
-0.676033, -1.826667, -3.130787, 0.4862745, 1, 0, 1,
-0.6752427, -1.241672, -3.770897, 0.4823529, 1, 0, 1,
-0.6719819, -0.5372001, -0.9340037, 0.4745098, 1, 0, 1,
-0.6664358, -0.9615268, -3.689207, 0.4705882, 1, 0, 1,
-0.6626842, 0.9724613, -2.623297, 0.4627451, 1, 0, 1,
-0.6605302, 0.3837987, -1.792602, 0.4588235, 1, 0, 1,
-0.6605096, 1.462191, -1.399022, 0.4509804, 1, 0, 1,
-0.6588377, 0.4158354, 0.3543984, 0.4470588, 1, 0, 1,
-0.6582429, -1.471689, -1.753184, 0.4392157, 1, 0, 1,
-0.6545746, 0.3434671, -2.136286, 0.4352941, 1, 0, 1,
-0.6518652, 0.9070555, -0.7045268, 0.427451, 1, 0, 1,
-0.6492177, 1.105867, -0.608923, 0.4235294, 1, 0, 1,
-0.6488016, -0.1423404, -1.96887, 0.4156863, 1, 0, 1,
-0.6403806, 0.282496, -1.220442, 0.4117647, 1, 0, 1,
-0.6359802, 0.3996564, -0.3931195, 0.4039216, 1, 0, 1,
-0.6316604, -0.5197746, -4.45701, 0.3960784, 1, 0, 1,
-0.630607, 0.3650699, -0.860572, 0.3921569, 1, 0, 1,
-0.6282349, 1.537235, -1.033823, 0.3843137, 1, 0, 1,
-0.627578, -0.1025699, -3.364838, 0.3803922, 1, 0, 1,
-0.6265906, 1.51012, -1.27065, 0.372549, 1, 0, 1,
-0.6183137, -0.1172431, -1.72487, 0.3686275, 1, 0, 1,
-0.6098185, -0.1381892, -3.226403, 0.3607843, 1, 0, 1,
-0.6023529, 0.7659446, -0.8183224, 0.3568628, 1, 0, 1,
-0.5997592, 2.452778, -0.3387938, 0.3490196, 1, 0, 1,
-0.5967485, 0.6497125, -1.117828, 0.345098, 1, 0, 1,
-0.5854825, 0.05266272, -1.757837, 0.3372549, 1, 0, 1,
-0.585178, 0.357332, -2.207953, 0.3333333, 1, 0, 1,
-0.5772426, -0.07323288, -2.095212, 0.3254902, 1, 0, 1,
-0.5756219, 0.03183521, -1.441915, 0.3215686, 1, 0, 1,
-0.568139, -0.01826305, -0.4444487, 0.3137255, 1, 0, 1,
-0.5677231, -0.1407932, -2.345844, 0.3098039, 1, 0, 1,
-0.5653097, 0.9032617, -0.6916838, 0.3019608, 1, 0, 1,
-0.5605921, -0.6560569, -1.019702, 0.2941177, 1, 0, 1,
-0.5587364, 3.224191, 1.256041, 0.2901961, 1, 0, 1,
-0.5565713, 1.023665, -0.4307998, 0.282353, 1, 0, 1,
-0.5536983, 0.01132721, -1.652043, 0.2784314, 1, 0, 1,
-0.5518695, 1.08914, -1.167484, 0.2705882, 1, 0, 1,
-0.5514431, 1.265604, -0.2355683, 0.2666667, 1, 0, 1,
-0.5497951, 1.369254, -1.357602, 0.2588235, 1, 0, 1,
-0.5496885, 0.4261285, -0.9533754, 0.254902, 1, 0, 1,
-0.5438672, -0.8880419, -2.347949, 0.2470588, 1, 0, 1,
-0.540951, -0.403542, -3.101847, 0.2431373, 1, 0, 1,
-0.5381246, -0.5426244, -2.215393, 0.2352941, 1, 0, 1,
-0.5377632, -1.024051, -2.653024, 0.2313726, 1, 0, 1,
-0.5358017, -0.5981373, -2.387192, 0.2235294, 1, 0, 1,
-0.5352974, 0.06377415, -2.529578, 0.2196078, 1, 0, 1,
-0.5347001, -1.279401, -4.138868, 0.2117647, 1, 0, 1,
-0.5330014, -1.137561, -3.298293, 0.2078431, 1, 0, 1,
-0.5307074, -0.7675757, -4.342528, 0.2, 1, 0, 1,
-0.523639, -0.9393095, -1.091574, 0.1921569, 1, 0, 1,
-0.5136907, -2.437799, -1.007231, 0.1882353, 1, 0, 1,
-0.5067895, 1.29988, -1.686401, 0.1803922, 1, 0, 1,
-0.5035812, 1.263843, -0.9585778, 0.1764706, 1, 0, 1,
-0.5011381, -1.039011, -2.349098, 0.1686275, 1, 0, 1,
-0.5007997, 0.4840787, -3.034384, 0.1647059, 1, 0, 1,
-0.4994474, -0.4029123, -1.644205, 0.1568628, 1, 0, 1,
-0.4992995, 1.811438, -1.401894, 0.1529412, 1, 0, 1,
-0.4975597, -0.5246299, -3.935917, 0.145098, 1, 0, 1,
-0.497358, 0.9762266, -0.7288627, 0.1411765, 1, 0, 1,
-0.4958389, 2.48574, -0.3574825, 0.1333333, 1, 0, 1,
-0.492752, 0.06628945, -1.64113, 0.1294118, 1, 0, 1,
-0.4903461, -0.8749342, -3.078883, 0.1215686, 1, 0, 1,
-0.4837257, 0.7369493, 0.0985269, 0.1176471, 1, 0, 1,
-0.4765346, 0.3240689, -2.209299, 0.1098039, 1, 0, 1,
-0.4738502, 0.5228264, -2.512686, 0.1058824, 1, 0, 1,
-0.4715483, -0.4607649, -1.043562, 0.09803922, 1, 0, 1,
-0.4661081, -1.101549, -2.427022, 0.09019608, 1, 0, 1,
-0.4618102, -0.3612746, -4.129539, 0.08627451, 1, 0, 1,
-0.4602058, 0.9788324, 0.5537471, 0.07843138, 1, 0, 1,
-0.4594777, -0.2049847, -1.867214, 0.07450981, 1, 0, 1,
-0.4592876, 0.7471241, -0.08246954, 0.06666667, 1, 0, 1,
-0.4552016, 1.400391, -0.445109, 0.0627451, 1, 0, 1,
-0.4440443, 2.260746, 0.4421138, 0.05490196, 1, 0, 1,
-0.4396275, -0.598132, -3.625245, 0.05098039, 1, 0, 1,
-0.4361143, -0.1087202, -2.0813, 0.04313726, 1, 0, 1,
-0.4345007, -1.134244, -2.346923, 0.03921569, 1, 0, 1,
-0.4344476, -1.21831, -1.888442, 0.03137255, 1, 0, 1,
-0.4329093, -0.9259385, -2.837351, 0.02745098, 1, 0, 1,
-0.4324661, 0.6908161, -0.1619987, 0.01960784, 1, 0, 1,
-0.4196087, -1.338468, -1.64531, 0.01568628, 1, 0, 1,
-0.4175037, 0.6880441, -1.963264, 0.007843138, 1, 0, 1,
-0.4158403, 0.6755781, 1.238791, 0.003921569, 1, 0, 1,
-0.4153555, -1.103651, -1.725875, 0, 1, 0.003921569, 1,
-0.4142819, 1.038316, 0.3320634, 0, 1, 0.01176471, 1,
-0.4127488, -0.4576838, -2.308675, 0, 1, 0.01568628, 1,
-0.4117368, 0.3144963, -0.1019689, 0, 1, 0.02352941, 1,
-0.4016124, 1.792324, -1.937971, 0, 1, 0.02745098, 1,
-0.3951372, -0.03190855, -3.164734, 0, 1, 0.03529412, 1,
-0.3948359, -1.950745, -1.772847, 0, 1, 0.03921569, 1,
-0.3941615, -1.541258, -0.9701788, 0, 1, 0.04705882, 1,
-0.3889167, -1.328937, -3.51923, 0, 1, 0.05098039, 1,
-0.3884997, 0.0903974, -2.363608, 0, 1, 0.05882353, 1,
-0.3867188, -0.9668475, -2.424862, 0, 1, 0.0627451, 1,
-0.3844672, 0.8572357, -0.2146301, 0, 1, 0.07058824, 1,
-0.381318, -1.609693, -0.6552143, 0, 1, 0.07450981, 1,
-0.3766158, 0.2556927, -1.645001, 0, 1, 0.08235294, 1,
-0.3731763, 0.4119606, -0.4543042, 0, 1, 0.08627451, 1,
-0.363224, 0.3778199, -0.8278083, 0, 1, 0.09411765, 1,
-0.3585722, 0.4468107, -0.5273442, 0, 1, 0.1019608, 1,
-0.3548501, 0.89027, 0.2482098, 0, 1, 0.1058824, 1,
-0.3489254, 0.2528989, -1.174386, 0, 1, 0.1137255, 1,
-0.3446634, 0.05330576, -1.138871, 0, 1, 0.1176471, 1,
-0.3358409, 0.4640766, -0.4478069, 0, 1, 0.1254902, 1,
-0.3347083, 2.38465, 0.9171407, 0, 1, 0.1294118, 1,
-0.3339453, 0.9323332, -0.7547731, 0, 1, 0.1372549, 1,
-0.3320663, 1.03387, -0.2210382, 0, 1, 0.1411765, 1,
-0.3300263, 0.7366619, 0.1493639, 0, 1, 0.1490196, 1,
-0.3271995, -0.7740939, -2.26384, 0, 1, 0.1529412, 1,
-0.3188063, -1.107395, -3.109081, 0, 1, 0.1607843, 1,
-0.3129444, -0.09316467, -2.652202, 0, 1, 0.1647059, 1,
-0.3097759, 0.7844125, -0.5492791, 0, 1, 0.172549, 1,
-0.3062247, -0.7667893, -3.461215, 0, 1, 0.1764706, 1,
-0.3061855, 1.47804, -0.6944434, 0, 1, 0.1843137, 1,
-0.3037692, 2.501639, 0.1962684, 0, 1, 0.1882353, 1,
-0.2960676, 0.6437737, -0.2857171, 0, 1, 0.1960784, 1,
-0.2926643, 0.5997384, -0.6502587, 0, 1, 0.2039216, 1,
-0.2879625, -1.086574, -4.85191, 0, 1, 0.2078431, 1,
-0.2856996, -0.2127424, -3.503386, 0, 1, 0.2156863, 1,
-0.2822731, -2.742469, -2.607049, 0, 1, 0.2196078, 1,
-0.2806265, 0.6619537, -1.819354, 0, 1, 0.227451, 1,
-0.270423, 0.3790957, -1.621254, 0, 1, 0.2313726, 1,
-0.2636786, 1.207262, -0.8608856, 0, 1, 0.2392157, 1,
-0.2614902, 1.766931, 0.894764, 0, 1, 0.2431373, 1,
-0.2593716, -1.261014, -1.474747, 0, 1, 0.2509804, 1,
-0.2590257, -0.09376988, -1.952639, 0, 1, 0.254902, 1,
-0.2560236, -0.3982501, -3.5759, 0, 1, 0.2627451, 1,
-0.2554973, -3.568141, -1.095263, 0, 1, 0.2666667, 1,
-0.253321, 1.345821, -0.3862637, 0, 1, 0.2745098, 1,
-0.2501219, 0.9241049, -0.7409683, 0, 1, 0.2784314, 1,
-0.2492794, 0.2826363, -0.5539868, 0, 1, 0.2862745, 1,
-0.2477332, -0.3364902, -3.282942, 0, 1, 0.2901961, 1,
-0.2436928, -0.2784536, -1.665278, 0, 1, 0.2980392, 1,
-0.2435886, -0.958465, -2.002779, 0, 1, 0.3058824, 1,
-0.243268, -0.4373159, -2.909851, 0, 1, 0.3098039, 1,
-0.2364618, -0.1702655, -1.814121, 0, 1, 0.3176471, 1,
-0.2318086, 0.140665, -1.45814, 0, 1, 0.3215686, 1,
-0.2268477, 0.2168459, -1.473882, 0, 1, 0.3294118, 1,
-0.2258352, -0.5818466, -1.925875, 0, 1, 0.3333333, 1,
-0.2198385, -1.139082, -2.818107, 0, 1, 0.3411765, 1,
-0.2172447, -0.5016183, -3.061677, 0, 1, 0.345098, 1,
-0.2144539, -1.160719, -4.561478, 0, 1, 0.3529412, 1,
-0.2017178, 1.833538, -0.6369722, 0, 1, 0.3568628, 1,
-0.199059, -1.396475, -2.190619, 0, 1, 0.3647059, 1,
-0.198654, -1.161433, -3.464849, 0, 1, 0.3686275, 1,
-0.1985741, 1.83898, 2.324989, 0, 1, 0.3764706, 1,
-0.1972221, -0.7868563, -2.718749, 0, 1, 0.3803922, 1,
-0.1947298, -0.2534358, -2.449523, 0, 1, 0.3882353, 1,
-0.1854718, -1.190782, -2.954558, 0, 1, 0.3921569, 1,
-0.1840641, -1.802822, -2.131219, 0, 1, 0.4, 1,
-0.1705324, -0.4943913, -0.6133684, 0, 1, 0.4078431, 1,
-0.168779, -0.6480685, -1.176445, 0, 1, 0.4117647, 1,
-0.1679336, -0.8223714, -1.763134, 0, 1, 0.4196078, 1,
-0.1666082, -0.5967427, -2.327169, 0, 1, 0.4235294, 1,
-0.1645229, -0.6885061, -4.18467, 0, 1, 0.4313726, 1,
-0.1642688, -0.1404332, -3.747716, 0, 1, 0.4352941, 1,
-0.1594497, 0.09284858, -1.660622, 0, 1, 0.4431373, 1,
-0.1559708, -0.0150422, -2.201396, 0, 1, 0.4470588, 1,
-0.1512293, 0.3207504, -0.1323325, 0, 1, 0.454902, 1,
-0.1419636, 2.351083, -0.3372961, 0, 1, 0.4588235, 1,
-0.1392149, 0.363637, -2.000061, 0, 1, 0.4666667, 1,
-0.1382509, 1.485985, 0.3651316, 0, 1, 0.4705882, 1,
-0.1324245, -0.9412445, -3.31436, 0, 1, 0.4784314, 1,
-0.1306106, -0.2893562, -2.418012, 0, 1, 0.4823529, 1,
-0.1289067, -0.1016019, -0.8380848, 0, 1, 0.4901961, 1,
-0.1280111, 0.258615, 0.1537193, 0, 1, 0.4941176, 1,
-0.1247295, -3.460068, -2.034286, 0, 1, 0.5019608, 1,
-0.1192257, 0.1822239, -0.4825417, 0, 1, 0.509804, 1,
-0.1176453, -0.229293, -2.976821, 0, 1, 0.5137255, 1,
-0.1117331, 0.2405383, -2.166785, 0, 1, 0.5215687, 1,
-0.1087754, 1.036271, 0.0589265, 0, 1, 0.5254902, 1,
-0.1079984, -0.02321346, -2.257418, 0, 1, 0.5333334, 1,
-0.1073337, -0.1248887, -3.258456, 0, 1, 0.5372549, 1,
-0.1035716, 1.23151, -0.3132375, 0, 1, 0.5450981, 1,
-0.09873984, -0.6928324, -2.33551, 0, 1, 0.5490196, 1,
-0.09827878, -0.3851801, -4.398601, 0, 1, 0.5568628, 1,
-0.09504106, 0.6404628, 0.2531, 0, 1, 0.5607843, 1,
-0.09494456, 0.2868834, -1.526639, 0, 1, 0.5686275, 1,
-0.09487815, -0.05486691, -1.31454, 0, 1, 0.572549, 1,
-0.08757122, 1.487756, -0.3874496, 0, 1, 0.5803922, 1,
-0.08672731, 0.4876166, -1.106106, 0, 1, 0.5843138, 1,
-0.08239571, 0.6363703, -0.7530801, 0, 1, 0.5921569, 1,
-0.08180873, -1.55936, -4.389355, 0, 1, 0.5960785, 1,
-0.0814396, 1.954126, 2.221693, 0, 1, 0.6039216, 1,
-0.07630146, 0.4992047, -0.6861181, 0, 1, 0.6117647, 1,
-0.0744982, 0.7204581, -0.2368424, 0, 1, 0.6156863, 1,
-0.07125223, -1.793105, -3.162432, 0, 1, 0.6235294, 1,
-0.06897151, 0.8956272, -1.761302, 0, 1, 0.627451, 1,
-0.06778993, 0.517552, 0.3239371, 0, 1, 0.6352941, 1,
-0.0655656, 2.162552, -1.730926, 0, 1, 0.6392157, 1,
-0.05957564, -0.8841226, -1.674592, 0, 1, 0.6470588, 1,
-0.05814157, 1.17243, -0.5652883, 0, 1, 0.6509804, 1,
-0.05624557, -0.2049575, -3.837749, 0, 1, 0.6588235, 1,
-0.05232716, -0.5172057, -4.280314, 0, 1, 0.6627451, 1,
-0.04872514, -1.568696, -4.787109, 0, 1, 0.6705883, 1,
-0.04663103, 0.1386906, 0.7111832, 0, 1, 0.6745098, 1,
-0.04262903, -1.656636, -2.651223, 0, 1, 0.682353, 1,
-0.04196541, 0.556743, 0.2047293, 0, 1, 0.6862745, 1,
-0.04106111, -0.7697567, -5.02176, 0, 1, 0.6941177, 1,
-0.03775448, 0.3347993, -0.301128, 0, 1, 0.7019608, 1,
-0.03307821, -0.144029, -2.322792, 0, 1, 0.7058824, 1,
-0.0300607, 0.1005138, 0.3960698, 0, 1, 0.7137255, 1,
-0.0278583, -1.519143, -3.659634, 0, 1, 0.7176471, 1,
-0.02647177, -0.5155075, -3.858707, 0, 1, 0.7254902, 1,
-0.02549942, -0.179489, -1.496378, 0, 1, 0.7294118, 1,
-0.02026452, -1.009384, -3.470514, 0, 1, 0.7372549, 1,
-0.01815618, -0.3381315, -2.157587, 0, 1, 0.7411765, 1,
-0.01668869, -0.7070808, -1.878773, 0, 1, 0.7490196, 1,
-0.01066066, 0.2239659, 0.2009257, 0, 1, 0.7529412, 1,
-0.008821583, -1.460723, -3.952606, 0, 1, 0.7607843, 1,
-0.007014837, -0.1314362, -0.810765, 0, 1, 0.7647059, 1,
-0.002216325, -0.9453073, -4.348631, 0, 1, 0.772549, 1,
0.0002881722, -0.6887202, 3.658514, 0, 1, 0.7764706, 1,
0.00106762, -0.02718218, 1.792817, 0, 1, 0.7843137, 1,
0.001225577, -0.3827638, 3.319276, 0, 1, 0.7882353, 1,
0.00343138, -1.563349, 3.82844, 0, 1, 0.7960784, 1,
0.01006968, -1.629265, 2.169143, 0, 1, 0.8039216, 1,
0.01123529, -0.1179534, 4.932819, 0, 1, 0.8078431, 1,
0.01573442, -1.72635, 2.797817, 0, 1, 0.8156863, 1,
0.01680841, -0.356847, 5.061963, 0, 1, 0.8196079, 1,
0.01863288, 1.623986, -0.003404898, 0, 1, 0.827451, 1,
0.02041672, -0.007218212, 2.137362, 0, 1, 0.8313726, 1,
0.02115767, 1.520214, 2.894992, 0, 1, 0.8392157, 1,
0.02129725, -1.308607, 4.528847, 0, 1, 0.8431373, 1,
0.02616756, 0.03902271, 2.723408, 0, 1, 0.8509804, 1,
0.02627908, 2.042252, 0.7320838, 0, 1, 0.854902, 1,
0.02736365, 0.01568133, 0.5840509, 0, 1, 0.8627451, 1,
0.03106461, -1.304829, 2.46376, 0, 1, 0.8666667, 1,
0.03437759, 0.6783268, 0.6448349, 0, 1, 0.8745098, 1,
0.04027505, 0.08380448, -0.6781425, 0, 1, 0.8784314, 1,
0.04160606, -0.891838, 2.358171, 0, 1, 0.8862745, 1,
0.04434669, -0.002234988, 1.824247, 0, 1, 0.8901961, 1,
0.04839036, -0.5687475, 0.9600499, 0, 1, 0.8980392, 1,
0.05581595, 0.3336097, -0.4563245, 0, 1, 0.9058824, 1,
0.05673733, 0.2051778, -0.348231, 0, 1, 0.9098039, 1,
0.0600514, 0.6290717, 0.7867789, 0, 1, 0.9176471, 1,
0.06114139, -1.0318, 3.606404, 0, 1, 0.9215686, 1,
0.06182795, 1.570122, -0.7411811, 0, 1, 0.9294118, 1,
0.06827057, -0.5386255, 2.570919, 0, 1, 0.9333333, 1,
0.06868095, -0.4075885, 3.27036, 0, 1, 0.9411765, 1,
0.07171236, -0.6188552, 4.259889, 0, 1, 0.945098, 1,
0.07265224, 1.100161, 0.9791118, 0, 1, 0.9529412, 1,
0.0780663, -0.1258165, 2.789309, 0, 1, 0.9568627, 1,
0.08055028, -0.8869354, 3.238777, 0, 1, 0.9647059, 1,
0.0822373, 0.8164425, 0.8592953, 0, 1, 0.9686275, 1,
0.08280687, 0.7047297, 0.6740829, 0, 1, 0.9764706, 1,
0.08528323, 1.967403, 0.8557298, 0, 1, 0.9803922, 1,
0.08650985, -0.8161231, 2.192682, 0, 1, 0.9882353, 1,
0.08664313, 0.04804387, 0.5710211, 0, 1, 0.9921569, 1,
0.08677638, -1.339686, 1.591234, 0, 1, 1, 1,
0.09454652, 0.3042532, 0.245941, 0, 0.9921569, 1, 1,
0.1010517, -0.7729692, 1.661834, 0, 0.9882353, 1, 1,
0.1022428, -0.437826, 3.472567, 0, 0.9803922, 1, 1,
0.1075901, -0.4304538, 3.619922, 0, 0.9764706, 1, 1,
0.1081426, -0.7230418, 3.0173, 0, 0.9686275, 1, 1,
0.1130404, 0.1905244, 1.083145, 0, 0.9647059, 1, 1,
0.1137221, 1.041396, 0.5944705, 0, 0.9568627, 1, 1,
0.1168643, 0.6154706, 1.786201, 0, 0.9529412, 1, 1,
0.1213294, 0.6238183, 1.02352, 0, 0.945098, 1, 1,
0.1241194, -0.6908897, 1.219471, 0, 0.9411765, 1, 1,
0.1277813, -2.325192, 3.434152, 0, 0.9333333, 1, 1,
0.1323945, 0.7124008, -1.546952, 0, 0.9294118, 1, 1,
0.1335274, 0.09455799, 0.7774433, 0, 0.9215686, 1, 1,
0.1338113, 0.042005, 0.7377537, 0, 0.9176471, 1, 1,
0.1382771, 0.2903216, 1.677606, 0, 0.9098039, 1, 1,
0.1388016, 2.07045, -2.388389, 0, 0.9058824, 1, 1,
0.1388866, -0.1611879, 0.8894434, 0, 0.8980392, 1, 1,
0.1410064, 0.956245, -1.580101, 0, 0.8901961, 1, 1,
0.143778, 0.3135275, -0.9786782, 0, 0.8862745, 1, 1,
0.1446444, -1.696754, 3.014014, 0, 0.8784314, 1, 1,
0.1448504, 0.5571733, 0.1068001, 0, 0.8745098, 1, 1,
0.1454105, -1.394307, 3.747288, 0, 0.8666667, 1, 1,
0.1500264, 1.058528, 1.158902, 0, 0.8627451, 1, 1,
0.1511307, -0.7629799, 2.952931, 0, 0.854902, 1, 1,
0.1543476, 0.2309706, -0.6304034, 0, 0.8509804, 1, 1,
0.1590668, -1.317227, 3.321444, 0, 0.8431373, 1, 1,
0.1614834, -0.2768624, 4.3625, 0, 0.8392157, 1, 1,
0.1615255, -1.156271, 3.670209, 0, 0.8313726, 1, 1,
0.1621437, 0.06911352, -0.3087212, 0, 0.827451, 1, 1,
0.1626171, 2.838755, -0.4425466, 0, 0.8196079, 1, 1,
0.1627796, -0.5932562, 3.658556, 0, 0.8156863, 1, 1,
0.1641581, -0.5903856, 4.821313, 0, 0.8078431, 1, 1,
0.1644613, -1.320006, 2.688844, 0, 0.8039216, 1, 1,
0.1652544, -0.6849276, 2.081844, 0, 0.7960784, 1, 1,
0.1709805, 0.8674389, -0.1813008, 0, 0.7882353, 1, 1,
0.1710338, -1.075529, 5.95181, 0, 0.7843137, 1, 1,
0.1718029, -1.041502, 2.802932, 0, 0.7764706, 1, 1,
0.172775, -1.707322, 2.436227, 0, 0.772549, 1, 1,
0.1806859, 0.9093677, -0.9791111, 0, 0.7647059, 1, 1,
0.181513, 0.1603843, 1.712985, 0, 0.7607843, 1, 1,
0.1821132, 1.849523, 0.07627045, 0, 0.7529412, 1, 1,
0.1824705, 0.6074859, 0.838623, 0, 0.7490196, 1, 1,
0.1843778, 0.6385139, -0.7755778, 0, 0.7411765, 1, 1,
0.1888327, 2.158478, 1.997823, 0, 0.7372549, 1, 1,
0.1908586, -0.8393944, 1.217591, 0, 0.7294118, 1, 1,
0.1923585, -1.464422, 5.415887, 0, 0.7254902, 1, 1,
0.1930199, 1.851334, -0.1877766, 0, 0.7176471, 1, 1,
0.1960248, -1.295557, 2.355028, 0, 0.7137255, 1, 1,
0.1982739, -0.511353, 1.969795, 0, 0.7058824, 1, 1,
0.2030746, -0.0814648, -1.164433, 0, 0.6980392, 1, 1,
0.203736, 0.5936488, -0.05503558, 0, 0.6941177, 1, 1,
0.2057827, -0.7289242, 3.70153, 0, 0.6862745, 1, 1,
0.2059518, -0.5447192, 3.012856, 0, 0.682353, 1, 1,
0.2062475, 0.03393602, 0.9504332, 0, 0.6745098, 1, 1,
0.2163701, -0.990194, 3.056095, 0, 0.6705883, 1, 1,
0.2204225, 0.3110366, -0.686865, 0, 0.6627451, 1, 1,
0.2250721, 0.5763935, -0.6848854, 0, 0.6588235, 1, 1,
0.2262503, 1.026893, 0.5822051, 0, 0.6509804, 1, 1,
0.2273163, -0.5962617, 0.8455395, 0, 0.6470588, 1, 1,
0.236149, -1.000255, 1.453361, 0, 0.6392157, 1, 1,
0.2366259, 0.7004848, 0.8240734, 0, 0.6352941, 1, 1,
0.2375899, -1.338633, 1.305845, 0, 0.627451, 1, 1,
0.2383357, 1.470152, 0.4148493, 0, 0.6235294, 1, 1,
0.2407494, -2.491879, 3.120557, 0, 0.6156863, 1, 1,
0.2447677, 1.388724, -0.4703613, 0, 0.6117647, 1, 1,
0.2452717, 1.767387, 1.861412, 0, 0.6039216, 1, 1,
0.24724, 0.8732554, -0.7601694, 0, 0.5960785, 1, 1,
0.2525528, -0.02248893, 1.571446, 0, 0.5921569, 1, 1,
0.2542163, -0.09571598, 1.255918, 0, 0.5843138, 1, 1,
0.2549251, 0.5315334, 1.855229, 0, 0.5803922, 1, 1,
0.255614, 0.07443196, 3.277006, 0, 0.572549, 1, 1,
0.2595874, 1.464574, -0.1576274, 0, 0.5686275, 1, 1,
0.2609846, 0.3280165, 0.7934401, 0, 0.5607843, 1, 1,
0.2612989, 0.6821579, 0.15128, 0, 0.5568628, 1, 1,
0.2615422, -0.589612, 2.384086, 0, 0.5490196, 1, 1,
0.2659301, 1.220547, 0.2636703, 0, 0.5450981, 1, 1,
0.2665495, -1.164488, 3.389404, 0, 0.5372549, 1, 1,
0.2705248, -0.7919806, 2.827199, 0, 0.5333334, 1, 1,
0.2794292, 0.7933682, 0.69067, 0, 0.5254902, 1, 1,
0.279707, 0.1987534, -0.3570831, 0, 0.5215687, 1, 1,
0.2810672, 0.9151052, -1.028258, 0, 0.5137255, 1, 1,
0.2817933, 0.1169717, -0.7434624, 0, 0.509804, 1, 1,
0.2825913, 0.4691715, 1.182618, 0, 0.5019608, 1, 1,
0.2840281, -1.010167, 5.459606, 0, 0.4941176, 1, 1,
0.2871721, 1.191032, -0.9724212, 0, 0.4901961, 1, 1,
0.2878148, -1.342893, 2.538946, 0, 0.4823529, 1, 1,
0.29002, 0.729944, 0.8912759, 0, 0.4784314, 1, 1,
0.2904313, -0.825254, 3.906414, 0, 0.4705882, 1, 1,
0.292091, -0.9759914, 2.712377, 0, 0.4666667, 1, 1,
0.2938118, -0.01646177, 2.282807, 0, 0.4588235, 1, 1,
0.2956406, 0.6772419, -0.8407876, 0, 0.454902, 1, 1,
0.2958689, 1.325488, 0.5664009, 0, 0.4470588, 1, 1,
0.2969767, 2.266696, 2.658406, 0, 0.4431373, 1, 1,
0.2982328, 2.298171, -1.551287, 0, 0.4352941, 1, 1,
0.2985136, -0.4513609, 3.035897, 0, 0.4313726, 1, 1,
0.3009071, 1.824701, 0.4656498, 0, 0.4235294, 1, 1,
0.3038642, -0.4678319, 3.106184, 0, 0.4196078, 1, 1,
0.3079998, -0.5708762, 2.091682, 0, 0.4117647, 1, 1,
0.3086471, 0.7019265, 2.430714, 0, 0.4078431, 1, 1,
0.3093745, -0.9954128, 3.797667, 0, 0.4, 1, 1,
0.3117692, 1.114392, -0.3680941, 0, 0.3921569, 1, 1,
0.3120416, -0.4067394, 2.894605, 0, 0.3882353, 1, 1,
0.3154132, 1.009281, -0.3807715, 0, 0.3803922, 1, 1,
0.3161562, 0.1269606, 2.174044, 0, 0.3764706, 1, 1,
0.3163689, -0.4420826, 2.347445, 0, 0.3686275, 1, 1,
0.3168348, 0.3174661, 0.08972091, 0, 0.3647059, 1, 1,
0.3193331, -0.5796294, 1.459833, 0, 0.3568628, 1, 1,
0.3212706, -0.7843223, 4.478231, 0, 0.3529412, 1, 1,
0.3225708, -1.238613, 2.316869, 0, 0.345098, 1, 1,
0.3276576, 1.126732, 0.8113755, 0, 0.3411765, 1, 1,
0.332038, -0.9755839, 3.315848, 0, 0.3333333, 1, 1,
0.3348614, -2.219239, 4.593841, 0, 0.3294118, 1, 1,
0.3369867, -0.4088984, 2.215308, 0, 0.3215686, 1, 1,
0.3385577, -1.79887, 2.7432, 0, 0.3176471, 1, 1,
0.3407594, 0.895784, 1.342348, 0, 0.3098039, 1, 1,
0.3483823, -1.870232, 3.988644, 0, 0.3058824, 1, 1,
0.3511533, -0.2247548, 2.326415, 0, 0.2980392, 1, 1,
0.352245, -0.9574304, 3.14137, 0, 0.2901961, 1, 1,
0.3551062, -1.20524, 1.94919, 0, 0.2862745, 1, 1,
0.355417, -1.047183, 1.282183, 0, 0.2784314, 1, 1,
0.3578461, -2.144958, 2.697785, 0, 0.2745098, 1, 1,
0.3632077, 0.1914508, 0.2090897, 0, 0.2666667, 1, 1,
0.3633156, 0.2817669, 1.31142, 0, 0.2627451, 1, 1,
0.3668539, 0.2418324, 0.9229425, 0, 0.254902, 1, 1,
0.3714521, -1.073937, 3.50627, 0, 0.2509804, 1, 1,
0.3747357, -0.03698695, 2.102161, 0, 0.2431373, 1, 1,
0.3753052, -2.162821, 2.357436, 0, 0.2392157, 1, 1,
0.3821041, 0.5130641, -1.342772, 0, 0.2313726, 1, 1,
0.384577, 1.116129, 0.497355, 0, 0.227451, 1, 1,
0.3846516, -0.6378482, 2.235204, 0, 0.2196078, 1, 1,
0.384936, 0.464306, 0.8227324, 0, 0.2156863, 1, 1,
0.3895226, 0.7734133, 0.3259409, 0, 0.2078431, 1, 1,
0.3903672, -0.4210731, 1.739732, 0, 0.2039216, 1, 1,
0.3946344, -1.013001, 4.411077, 0, 0.1960784, 1, 1,
0.3949738, 1.920416, 1.633639, 0, 0.1882353, 1, 1,
0.395696, -0.5980687, 1.992845, 0, 0.1843137, 1, 1,
0.3959606, 1.288813, -0.5959482, 0, 0.1764706, 1, 1,
0.3967844, -0.8798625, 3.666785, 0, 0.172549, 1, 1,
0.3970918, -1.66737, 3.447855, 0, 0.1647059, 1, 1,
0.4007913, 2.022832, 0.2034656, 0, 0.1607843, 1, 1,
0.4008223, 1.707277, 0.5823126, 0, 0.1529412, 1, 1,
0.4045066, 1.28957, -0.08926927, 0, 0.1490196, 1, 1,
0.4046175, -0.4787123, 4.703297, 0, 0.1411765, 1, 1,
0.4047655, 0.4870113, 0.3199359, 0, 0.1372549, 1, 1,
0.4089153, -0.5725943, 2.421132, 0, 0.1294118, 1, 1,
0.4169868, -0.2039043, 1.576313, 0, 0.1254902, 1, 1,
0.4172619, 0.4166597, -0.2085855, 0, 0.1176471, 1, 1,
0.4230748, -1.040306, 2.717487, 0, 0.1137255, 1, 1,
0.4248359, 1.225111, 0.1173717, 0, 0.1058824, 1, 1,
0.424978, 0.2294483, 0.7760599, 0, 0.09803922, 1, 1,
0.4272175, 0.8964058, -0.4094708, 0, 0.09411765, 1, 1,
0.4290254, 0.6780196, 0.7765774, 0, 0.08627451, 1, 1,
0.4307612, 0.5081336, 0.907936, 0, 0.08235294, 1, 1,
0.432306, -1.132021, 3.095965, 0, 0.07450981, 1, 1,
0.4361343, -0.3190606, 2.902892, 0, 0.07058824, 1, 1,
0.4366966, -1.188172, 0.190131, 0, 0.0627451, 1, 1,
0.438153, -0.01672616, 3.023405, 0, 0.05882353, 1, 1,
0.4397157, 0.03684005, 0.9654256, 0, 0.05098039, 1, 1,
0.4431898, -0.8675656, 3.628286, 0, 0.04705882, 1, 1,
0.4454767, -1.653254, 1.05179, 0, 0.03921569, 1, 1,
0.4492248, 1.317646, -0.4719794, 0, 0.03529412, 1, 1,
0.4503379, 0.7970212, 0.4478663, 0, 0.02745098, 1, 1,
0.4534546, 0.7425672, 0.1879219, 0, 0.02352941, 1, 1,
0.4536177, -0.7078744, 2.84884, 0, 0.01568628, 1, 1,
0.4544847, -0.395687, -0.1999826, 0, 0.01176471, 1, 1,
0.4552279, -1.784373, 2.922296, 0, 0.003921569, 1, 1,
0.4595936, 1.446992, -0.5978041, 0.003921569, 0, 1, 1,
0.4676405, -0.57772, 1.606379, 0.007843138, 0, 1, 1,
0.470433, -0.5699757, 2.732419, 0.01568628, 0, 1, 1,
0.4714048, 1.167441, -0.5639017, 0.01960784, 0, 1, 1,
0.4740639, -1.999523, 3.261555, 0.02745098, 0, 1, 1,
0.4792493, 0.5989571, 1.336736, 0.03137255, 0, 1, 1,
0.4808101, 0.977226, 0.678646, 0.03921569, 0, 1, 1,
0.483785, -0.7350972, 4.410485, 0.04313726, 0, 1, 1,
0.4845704, 0.9070651, 1.216038, 0.05098039, 0, 1, 1,
0.486535, -2.152551, 0.3213611, 0.05490196, 0, 1, 1,
0.4886244, -0.8590975, 3.923806, 0.0627451, 0, 1, 1,
0.4906639, -1.003529, 1.822169, 0.06666667, 0, 1, 1,
0.4907832, 1.320172, 0.2198653, 0.07450981, 0, 1, 1,
0.5009502, -0.02132445, 0.9778959, 0.07843138, 0, 1, 1,
0.5030677, -0.3340663, 1.957737, 0.08627451, 0, 1, 1,
0.5045429, 1.697688, -0.3500943, 0.09019608, 0, 1, 1,
0.5091376, -0.133512, 2.195005, 0.09803922, 0, 1, 1,
0.5115126, -2.013251, 3.777454, 0.1058824, 0, 1, 1,
0.5149915, 1.533623, 0.3717874, 0.1098039, 0, 1, 1,
0.5150443, -0.969828, 0.6226193, 0.1176471, 0, 1, 1,
0.5238157, 1.026286, 0.4344823, 0.1215686, 0, 1, 1,
0.5255953, -0.9290278, 3.229644, 0.1294118, 0, 1, 1,
0.5278649, 0.1543206, 1.493928, 0.1333333, 0, 1, 1,
0.5299565, 0.2849309, 1.446666, 0.1411765, 0, 1, 1,
0.5328546, 1.526495, 2.474427, 0.145098, 0, 1, 1,
0.5329465, 0.03198004, 1.897657, 0.1529412, 0, 1, 1,
0.5340831, 0.2110348, 0.9026536, 0.1568628, 0, 1, 1,
0.5365615, 0.4815169, 0.5713432, 0.1647059, 0, 1, 1,
0.5412621, -0.08436188, 1.903286, 0.1686275, 0, 1, 1,
0.5420988, 0.4964598, 0.5312617, 0.1764706, 0, 1, 1,
0.5488659, -0.7327485, 2.764315, 0.1803922, 0, 1, 1,
0.5509471, 1.684814, -0.2471953, 0.1882353, 0, 1, 1,
0.5530671, 0.06936984, 0.6039147, 0.1921569, 0, 1, 1,
0.5532084, -0.1989559, 3.411781, 0.2, 0, 1, 1,
0.5541087, -1.284512, 1.826359, 0.2078431, 0, 1, 1,
0.5564154, -0.767446, 2.538194, 0.2117647, 0, 1, 1,
0.5585701, -0.4894877, 0.7611957, 0.2196078, 0, 1, 1,
0.565982, 1.65678, 0.40245, 0.2235294, 0, 1, 1,
0.5710404, 0.4266796, 0.486836, 0.2313726, 0, 1, 1,
0.5767621, -0.681443, 2.184968, 0.2352941, 0, 1, 1,
0.5768375, -1.326926, 3.200199, 0.2431373, 0, 1, 1,
0.5820709, -1.400898, 4.404647, 0.2470588, 0, 1, 1,
0.5894725, 1.154298, 1.74647, 0.254902, 0, 1, 1,
0.5906038, -1.115284, 2.884569, 0.2588235, 0, 1, 1,
0.5915631, 1.266948, 1.655302, 0.2666667, 0, 1, 1,
0.5916363, 0.3943134, 0.4159046, 0.2705882, 0, 1, 1,
0.5922516, 0.149581, -0.3704084, 0.2784314, 0, 1, 1,
0.5969261, -0.4747904, 1.689158, 0.282353, 0, 1, 1,
0.5986561, -0.793734, 2.766042, 0.2901961, 0, 1, 1,
0.598787, 0.1088991, 1.408226, 0.2941177, 0, 1, 1,
0.5993728, 1.138543, -0.5376961, 0.3019608, 0, 1, 1,
0.5999823, 0.556116, -1.962034, 0.3098039, 0, 1, 1,
0.6049543, 0.7343832, 2.48098, 0.3137255, 0, 1, 1,
0.6099552, 0.3925124, 2.132038, 0.3215686, 0, 1, 1,
0.6136963, 0.3061413, 1.761741, 0.3254902, 0, 1, 1,
0.6140678, -0.6148043, 3.676603, 0.3333333, 0, 1, 1,
0.6141609, 0.9116512, 0.8378515, 0.3372549, 0, 1, 1,
0.6155372, -0.563236, 2.429187, 0.345098, 0, 1, 1,
0.6185431, 1.180499, 0.4960169, 0.3490196, 0, 1, 1,
0.6205952, -1.647975, 4.054545, 0.3568628, 0, 1, 1,
0.6215453, -0.8394498, 1.17122, 0.3607843, 0, 1, 1,
0.6239427, 0.1911529, 1.416418, 0.3686275, 0, 1, 1,
0.6384466, 1.110435, -0.4877104, 0.372549, 0, 1, 1,
0.6388314, -1.001088, 3.205105, 0.3803922, 0, 1, 1,
0.6397956, -0.1332522, 1.852349, 0.3843137, 0, 1, 1,
0.6407581, -0.5703174, 3.156064, 0.3921569, 0, 1, 1,
0.6415307, 1.440356, 0.36693, 0.3960784, 0, 1, 1,
0.6426076, -0.7449579, 0.8056561, 0.4039216, 0, 1, 1,
0.6452463, -0.110732, 1.783456, 0.4117647, 0, 1, 1,
0.6458313, -0.5943277, 1.982487, 0.4156863, 0, 1, 1,
0.6470148, -1.716393, 3.593544, 0.4235294, 0, 1, 1,
0.6486667, 0.3683264, -2.069817, 0.427451, 0, 1, 1,
0.6487409, -0.1334521, 1.036285, 0.4352941, 0, 1, 1,
0.6560283, 0.1834951, 2.036581, 0.4392157, 0, 1, 1,
0.658918, -1.24324, 2.922285, 0.4470588, 0, 1, 1,
0.6602285, -0.5375463, 0.8384693, 0.4509804, 0, 1, 1,
0.6627959, -0.09895179, 1.670697, 0.4588235, 0, 1, 1,
0.6635619, 0.6078088, 1.212003, 0.4627451, 0, 1, 1,
0.6638581, -0.7870632, 1.589341, 0.4705882, 0, 1, 1,
0.6647416, -0.5068842, 2.593225, 0.4745098, 0, 1, 1,
0.6702217, -0.1792714, 2.176744, 0.4823529, 0, 1, 1,
0.6737922, -1.414235, 2.201403, 0.4862745, 0, 1, 1,
0.6878305, -0.009745092, 0.697006, 0.4941176, 0, 1, 1,
0.6888429, 1.367119, -0.7140579, 0.5019608, 0, 1, 1,
0.6906982, -1.901724, 3.431348, 0.5058824, 0, 1, 1,
0.6910311, -0.005409049, 1.591901, 0.5137255, 0, 1, 1,
0.6925435, 0.3264191, -0.6903934, 0.5176471, 0, 1, 1,
0.6926235, 1.09536, -0.4335243, 0.5254902, 0, 1, 1,
0.6933578, 0.6545151, 0.1311244, 0.5294118, 0, 1, 1,
0.6958621, 2.041823, 0.5757001, 0.5372549, 0, 1, 1,
0.704745, -0.4387835, 2.177303, 0.5411765, 0, 1, 1,
0.7089037, 0.4649362, -0.02361131, 0.5490196, 0, 1, 1,
0.7142122, 0.3035877, 1.367119, 0.5529412, 0, 1, 1,
0.7143139, -0.4385441, 0.4094551, 0.5607843, 0, 1, 1,
0.717801, -0.2687184, 1.572441, 0.5647059, 0, 1, 1,
0.7181952, -1.142827, 3.174313, 0.572549, 0, 1, 1,
0.7194443, 0.5714937, 0.2661825, 0.5764706, 0, 1, 1,
0.7279779, 0.2718921, 0.7981741, 0.5843138, 0, 1, 1,
0.7293322, -1.001035, 2.20248, 0.5882353, 0, 1, 1,
0.7300779, 0.009250445, -0.4100574, 0.5960785, 0, 1, 1,
0.7309651, 0.4373037, 1.855962, 0.6039216, 0, 1, 1,
0.7316851, -0.5421975, 1.204766, 0.6078432, 0, 1, 1,
0.737949, 0.4386239, 0.3907091, 0.6156863, 0, 1, 1,
0.7381929, 1.396092, -0.01386619, 0.6196079, 0, 1, 1,
0.7410986, -0.8197083, 2.830478, 0.627451, 0, 1, 1,
0.7444353, -0.8345063, 2.443389, 0.6313726, 0, 1, 1,
0.7495583, -0.8410309, 2.900916, 0.6392157, 0, 1, 1,
0.7537934, 2.34036, 0.7785619, 0.6431373, 0, 1, 1,
0.7553639, -0.2687747, 2.063334, 0.6509804, 0, 1, 1,
0.7558779, -0.389923, 2.545128, 0.654902, 0, 1, 1,
0.765872, -0.7427375, 2.507916, 0.6627451, 0, 1, 1,
0.7659126, -1.297578, 2.929955, 0.6666667, 0, 1, 1,
0.7733029, -1.082246, 3.384851, 0.6745098, 0, 1, 1,
0.775589, -1.748866, 3.007357, 0.6784314, 0, 1, 1,
0.777539, -0.300802, 1.207256, 0.6862745, 0, 1, 1,
0.7829677, -0.6781251, 1.361496, 0.6901961, 0, 1, 1,
0.7908187, 1.589718, -0.3528444, 0.6980392, 0, 1, 1,
0.7968489, 0.4812422, 0.2304926, 0.7058824, 0, 1, 1,
0.7968625, -1.371907, 2.789864, 0.7098039, 0, 1, 1,
0.7984325, -1.63946, 1.899251, 0.7176471, 0, 1, 1,
0.8024874, -0.4717712, 4.444032, 0.7215686, 0, 1, 1,
0.8089424, 0.2705664, 0.06412513, 0.7294118, 0, 1, 1,
0.8129378, -0.8525297, 2.042811, 0.7333333, 0, 1, 1,
0.8145767, -0.0513887, 3.183902, 0.7411765, 0, 1, 1,
0.8164502, -0.2930252, 1.88312, 0.7450981, 0, 1, 1,
0.8174676, -0.1880974, 4.045992, 0.7529412, 0, 1, 1,
0.8191286, 0.8029819, 2.612551, 0.7568628, 0, 1, 1,
0.8313906, 0.05290684, 2.321309, 0.7647059, 0, 1, 1,
0.838593, -0.4700219, 1.629552, 0.7686275, 0, 1, 1,
0.841798, 1.542975, 1.346668, 0.7764706, 0, 1, 1,
0.8480279, -2.084174, 3.27311, 0.7803922, 0, 1, 1,
0.8516326, -0.2111995, 1.495294, 0.7882353, 0, 1, 1,
0.8665782, 0.6544409, 1.956028, 0.7921569, 0, 1, 1,
0.8677031, 0.2163252, -0.4990493, 0.8, 0, 1, 1,
0.8679222, -0.704909, 4.11108, 0.8078431, 0, 1, 1,
0.8767069, -0.3983332, 2.908418, 0.8117647, 0, 1, 1,
0.8851406, -0.01118971, 1.028797, 0.8196079, 0, 1, 1,
0.890251, 0.6887531, 0.1902819, 0.8235294, 0, 1, 1,
0.8917086, -0.5428077, 0.4119856, 0.8313726, 0, 1, 1,
0.8939635, 0.6644243, 1.304933, 0.8352941, 0, 1, 1,
0.8952232, -0.5989112, 3.374125, 0.8431373, 0, 1, 1,
0.8986372, -1.99505, 4.215549, 0.8470588, 0, 1, 1,
0.8991485, 0.930715, 0.7095397, 0.854902, 0, 1, 1,
0.9034274, 0.9753904, 1.350214, 0.8588235, 0, 1, 1,
0.906458, -0.6795129, 2.334852, 0.8666667, 0, 1, 1,
0.9094453, 1.762014, -0.6389265, 0.8705882, 0, 1, 1,
0.9100382, 0.6571053, 0.5444564, 0.8784314, 0, 1, 1,
0.9112291, -1.107051, 2.033633, 0.8823529, 0, 1, 1,
0.9121652, 0.07845052, -0.3075148, 0.8901961, 0, 1, 1,
0.9138877, 1.787407, 2.254504, 0.8941177, 0, 1, 1,
0.9174135, -1.431918, 2.858528, 0.9019608, 0, 1, 1,
0.9219297, 0.1673211, -0.7846899, 0.9098039, 0, 1, 1,
0.9231905, 0.6791228, -0.4092784, 0.9137255, 0, 1, 1,
0.924981, -0.9597818, 3.714362, 0.9215686, 0, 1, 1,
0.9430419, 0.05746204, 2.686378, 0.9254902, 0, 1, 1,
0.9464743, -0.5432341, 1.233565, 0.9333333, 0, 1, 1,
0.9477001, -1.741839, 1.755141, 0.9372549, 0, 1, 1,
0.9499616, 0.8454822, -0.1218019, 0.945098, 0, 1, 1,
0.9527019, 0.9534169, 1.996984, 0.9490196, 0, 1, 1,
0.9677231, 1.480267, 0.04382449, 0.9568627, 0, 1, 1,
0.9690308, 1.191617, 0.7940217, 0.9607843, 0, 1, 1,
0.9705967, -0.5773294, 0.6329186, 0.9686275, 0, 1, 1,
0.9784524, 0.4010307, 3.39809, 0.972549, 0, 1, 1,
0.9868882, -1.466708, 2.755088, 0.9803922, 0, 1, 1,
0.9943058, 2.043411, -0.1000458, 0.9843137, 0, 1, 1,
1.001938, -0.3687399, 1.948617, 0.9921569, 0, 1, 1,
1.003091, 0.4222883, 0.7317991, 0.9960784, 0, 1, 1,
1.003568, -0.873701, 2.564252, 1, 0, 0.9960784, 1,
1.007746, -1.746029, 3.273637, 1, 0, 0.9882353, 1,
1.00783, 2.063841, 0.667392, 1, 0, 0.9843137, 1,
1.018464, 0.6593328, -0.0901467, 1, 0, 0.9764706, 1,
1.0193, -0.8289412, 2.574297, 1, 0, 0.972549, 1,
1.022995, -0.9505976, 2.830347, 1, 0, 0.9647059, 1,
1.02401, 0.1289867, 0.01276949, 1, 0, 0.9607843, 1,
1.025692, 0.09931003, 0.7784987, 1, 0, 0.9529412, 1,
1.027749, 1.612743, 1.047097, 1, 0, 0.9490196, 1,
1.032736, 0.07186612, 1.608069, 1, 0, 0.9411765, 1,
1.041844, 0.0955267, 0.630986, 1, 0, 0.9372549, 1,
1.047433, -1.231738, 0.9044833, 1, 0, 0.9294118, 1,
1.049811, -1.06782, 1.584047, 1, 0, 0.9254902, 1,
1.05103, -0.6370921, 2.452013, 1, 0, 0.9176471, 1,
1.052948, 0.3703984, 1.005232, 1, 0, 0.9137255, 1,
1.057464, -0.5222854, 2.669172, 1, 0, 0.9058824, 1,
1.058022, -1.591754, 0.1044502, 1, 0, 0.9019608, 1,
1.058037, -0.6939085, 0.7264705, 1, 0, 0.8941177, 1,
1.059298, 0.5752078, 1.443575, 1, 0, 0.8862745, 1,
1.059992, -0.1316523, 1.466437, 1, 0, 0.8823529, 1,
1.0702, 0.8297818, 1.613494, 1, 0, 0.8745098, 1,
1.07115, 0.4595632, 0.2562088, 1, 0, 0.8705882, 1,
1.083664, 1.709754, 0.225936, 1, 0, 0.8627451, 1,
1.084096, 1.981619, 1.010571, 1, 0, 0.8588235, 1,
1.086527, 0.9905794, 1.854266, 1, 0, 0.8509804, 1,
1.098483, 1.60639, 1.532693, 1, 0, 0.8470588, 1,
1.099597, 0.8738689, 0.4808911, 1, 0, 0.8392157, 1,
1.103838, -0.6022569, 3.374542, 1, 0, 0.8352941, 1,
1.104031, 0.8696332, 0.1623581, 1, 0, 0.827451, 1,
1.107389, -0.362126, 1.849603, 1, 0, 0.8235294, 1,
1.116117, 0.3708811, 0.9925383, 1, 0, 0.8156863, 1,
1.117802, -0.1038574, 1.07788, 1, 0, 0.8117647, 1,
1.123582, -0.9410599, 2.595917, 1, 0, 0.8039216, 1,
1.12618, -0.4926463, 2.450017, 1, 0, 0.7960784, 1,
1.129553, -0.2671452, 1.013241, 1, 0, 0.7921569, 1,
1.130159, -0.4336691, 1.164254, 1, 0, 0.7843137, 1,
1.131217, 1.358648, -0.4508655, 1, 0, 0.7803922, 1,
1.135349, -1.467133, 3.657093, 1, 0, 0.772549, 1,
1.146376, -0.01904441, 1.540952, 1, 0, 0.7686275, 1,
1.155318, -1.166444, 0.7171463, 1, 0, 0.7607843, 1,
1.165587, 1.142869, 1.851832, 1, 0, 0.7568628, 1,
1.171023, 1.199443, 1.650342, 1, 0, 0.7490196, 1,
1.176777, 0.1885864, -0.710018, 1, 0, 0.7450981, 1,
1.177852, -0.5441298, 2.583423, 1, 0, 0.7372549, 1,
1.179148, -0.3299755, 2.429388, 1, 0, 0.7333333, 1,
1.187097, 0.7151038, 2.601519, 1, 0, 0.7254902, 1,
1.188279, -0.2466933, 2.802251, 1, 0, 0.7215686, 1,
1.204536, -0.7231888, 2.898201, 1, 0, 0.7137255, 1,
1.20695, -1.127092, 1.553084, 1, 0, 0.7098039, 1,
1.211076, 2.181875, 1.995501, 1, 0, 0.7019608, 1,
1.212547, 0.7732119, 2.342201, 1, 0, 0.6941177, 1,
1.214419, 0.7567804, 2.638815, 1, 0, 0.6901961, 1,
1.217171, -0.2816409, 2.527053, 1, 0, 0.682353, 1,
1.219647, -0.2218099, 1.005036, 1, 0, 0.6784314, 1,
1.224888, 0.3443214, 1.476684, 1, 0, 0.6705883, 1,
1.230034, 0.8915447, -0.6481497, 1, 0, 0.6666667, 1,
1.235244, 0.3359391, 2.091418, 1, 0, 0.6588235, 1,
1.235547, -0.2984091, 1.31462, 1, 0, 0.654902, 1,
1.248976, 0.1957946, 0.871655, 1, 0, 0.6470588, 1,
1.253342, -0.1272674, 3.448982, 1, 0, 0.6431373, 1,
1.256742, 0.9276631, 0.9322248, 1, 0, 0.6352941, 1,
1.26867, 0.4053604, -0.2065458, 1, 0, 0.6313726, 1,
1.268963, -0.8986301, 2.343389, 1, 0, 0.6235294, 1,
1.270279, 0.2250095, 1.47889, 1, 0, 0.6196079, 1,
1.271786, 0.1815159, 0.08391965, 1, 0, 0.6117647, 1,
1.274969, -1.001807, 2.075654, 1, 0, 0.6078432, 1,
1.275563, 0.53035, 1.968582, 1, 0, 0.6, 1,
1.275771, 1.773653, 0.7412521, 1, 0, 0.5921569, 1,
1.285709, -0.06758337, 1.185764, 1, 0, 0.5882353, 1,
1.292044, 1.105534, 2.55869, 1, 0, 0.5803922, 1,
1.29863, 0.3241835, 1.757273, 1, 0, 0.5764706, 1,
1.301924, 0.1481191, 2.200782, 1, 0, 0.5686275, 1,
1.3053, 0.7840816, 0.4739128, 1, 0, 0.5647059, 1,
1.309354, -0.4677589, 0.274475, 1, 0, 0.5568628, 1,
1.317721, -0.3295372, 1.895017, 1, 0, 0.5529412, 1,
1.319827, 1.281983, 1.694649, 1, 0, 0.5450981, 1,
1.32218, -0.005453757, 1.189317, 1, 0, 0.5411765, 1,
1.334469, -0.8810418, 2.733877, 1, 0, 0.5333334, 1,
1.346208, 0.9937148, 1.371314, 1, 0, 0.5294118, 1,
1.346852, 1.1504, -0.50989, 1, 0, 0.5215687, 1,
1.353556, -0.02274115, 0.8467356, 1, 0, 0.5176471, 1,
1.355443, -0.5766843, 2.552885, 1, 0, 0.509804, 1,
1.35588, -1.059406, 1.308399, 1, 0, 0.5058824, 1,
1.357638, 0.9060879, 0.2929427, 1, 0, 0.4980392, 1,
1.36294, -0.7284382, 2.666862, 1, 0, 0.4901961, 1,
1.373911, 0.1137226, 1.183966, 1, 0, 0.4862745, 1,
1.377772, 0.2889617, 0.5565038, 1, 0, 0.4784314, 1,
1.390839, -0.6181161, 2.863615, 1, 0, 0.4745098, 1,
1.392733, 0.527146, 1.742006, 1, 0, 0.4666667, 1,
1.407542, 0.001381129, 2.610587, 1, 0, 0.4627451, 1,
1.414588, -0.9597058, 1.218039, 1, 0, 0.454902, 1,
1.423635, 1.789575, 1.789217, 1, 0, 0.4509804, 1,
1.434404, -1.173056, 3.202018, 1, 0, 0.4431373, 1,
1.44365, 1.921675, 0.6940302, 1, 0, 0.4392157, 1,
1.451078, 0.9619489, 0.8403572, 1, 0, 0.4313726, 1,
1.452894, 0.8725416, 1.937101, 1, 0, 0.427451, 1,
1.454722, 0.214574, 2.82615, 1, 0, 0.4196078, 1,
1.45824, 0.2016506, 0.5463474, 1, 0, 0.4156863, 1,
1.469203, 0.4161967, 1.067461, 1, 0, 0.4078431, 1,
1.472567, 0.2803349, 1.734536, 1, 0, 0.4039216, 1,
1.48641, 1.070144, 0.06055756, 1, 0, 0.3960784, 1,
1.505302, -0.7670529, 1.445463, 1, 0, 0.3882353, 1,
1.51707, -0.5948913, 1.952558, 1, 0, 0.3843137, 1,
1.521912, 0.0287663, 0.8047186, 1, 0, 0.3764706, 1,
1.522146, 0.5029819, 0.3593535, 1, 0, 0.372549, 1,
1.533845, -1.364515, 2.5198, 1, 0, 0.3647059, 1,
1.536387, -0.7471156, 0.9375284, 1, 0, 0.3607843, 1,
1.543288, 0.2548954, 2.403183, 1, 0, 0.3529412, 1,
1.56208, 0.1783923, 0.922951, 1, 0, 0.3490196, 1,
1.56226, 0.1799322, 2.638127, 1, 0, 0.3411765, 1,
1.568026, -0.1794249, 1.900664, 1, 0, 0.3372549, 1,
1.603151, -0.470207, 1.650663, 1, 0, 0.3294118, 1,
1.605916, 0.5333197, 2.713169, 1, 0, 0.3254902, 1,
1.606023, 0.4261122, 2.278817, 1, 0, 0.3176471, 1,
1.610328, 0.9369698, -0.1331302, 1, 0, 0.3137255, 1,
1.618666, -1.070587, 2.961707, 1, 0, 0.3058824, 1,
1.619903, -1.104696, 4.685175, 1, 0, 0.2980392, 1,
1.620603, 0.8221886, 1.248117, 1, 0, 0.2941177, 1,
1.627555, -1.442904, 3.090047, 1, 0, 0.2862745, 1,
1.647148, -1.103066, 2.259239, 1, 0, 0.282353, 1,
1.666602, 0.21793, 0.9635558, 1, 0, 0.2745098, 1,
1.673204, -1.370889, 2.066548, 1, 0, 0.2705882, 1,
1.676617, -0.3737227, 3.433432, 1, 0, 0.2627451, 1,
1.681945, 0.02847948, 1.779886, 1, 0, 0.2588235, 1,
1.698073, -1.490766, 1.729005, 1, 0, 0.2509804, 1,
1.721576, -0.05826535, 3.932635, 1, 0, 0.2470588, 1,
1.728793, -0.005384658, 0.8890892, 1, 0, 0.2392157, 1,
1.73052, 0.8373355, 0.4157997, 1, 0, 0.2352941, 1,
1.739365, 0.6228609, 0.5669889, 1, 0, 0.227451, 1,
1.740765, -1.369755, 2.885424, 1, 0, 0.2235294, 1,
1.756518, 1.034859, 2.456025, 1, 0, 0.2156863, 1,
1.757788, 0.4245018, 1.878138, 1, 0, 0.2117647, 1,
1.76355, 2.327334, -0.3155636, 1, 0, 0.2039216, 1,
1.767821, 0.2742713, 0.5087736, 1, 0, 0.1960784, 1,
1.774324, -0.1074031, 1.941285, 1, 0, 0.1921569, 1,
1.785721, -0.1255508, 3.107059, 1, 0, 0.1843137, 1,
1.78821, 0.768589, 1.315737, 1, 0, 0.1803922, 1,
1.83643, 0.410831, 0.7826756, 1, 0, 0.172549, 1,
1.880074, 0.1282878, 1.889669, 1, 0, 0.1686275, 1,
1.890923, 0.5432169, 2.254176, 1, 0, 0.1607843, 1,
1.917217, 0.4388363, 1.874571, 1, 0, 0.1568628, 1,
1.940245, 0.5873986, 2.051819, 1, 0, 0.1490196, 1,
1.944401, -0.3729382, 3.06466, 1, 0, 0.145098, 1,
1.987681, -1.794042, 2.717253, 1, 0, 0.1372549, 1,
2.000193, -0.9473997, 2.990963, 1, 0, 0.1333333, 1,
2.040426, 0.6540399, 1.823394, 1, 0, 0.1254902, 1,
2.06668, 1.292846, -0.04302485, 1, 0, 0.1215686, 1,
2.074118, -0.6281856, 0.9892831, 1, 0, 0.1137255, 1,
2.075833, 1.405819, 0.6674672, 1, 0, 0.1098039, 1,
2.081142, -1.727046, 2.24153, 1, 0, 0.1019608, 1,
2.102408, 0.2548301, 0.6027029, 1, 0, 0.09411765, 1,
2.123699, 0.4124722, 1.904668, 1, 0, 0.09019608, 1,
2.129845, 0.2382063, -1.150112, 1, 0, 0.08235294, 1,
2.162369, 0.8009723, 1.879266, 1, 0, 0.07843138, 1,
2.192603, 1.05055, 0.2201645, 1, 0, 0.07058824, 1,
2.198933, 0.01783307, 1.531062, 1, 0, 0.06666667, 1,
2.229157, 1.044507, 0.7829629, 1, 0, 0.05882353, 1,
2.235873, -0.534933, 1.387559, 1, 0, 0.05490196, 1,
2.253627, 1.465237, 1.584359, 1, 0, 0.04705882, 1,
2.365843, 0.3833957, 0.7416012, 1, 0, 0.04313726, 1,
2.526215, 0.4436763, 0.6421216, 1, 0, 0.03529412, 1,
2.664151, 1.321678, 2.844073, 1, 0, 0.03137255, 1,
2.709299, -1.804455, 3.916997, 1, 0, 0.02352941, 1,
2.74503, 1.393812, -0.1509272, 1, 0, 0.01960784, 1,
2.863832, 0.1923622, 0.9256672, 1, 0, 0.01176471, 1,
2.999359, 0.2297612, 0.353742, 1, 0, 0.007843138, 1
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
-0.03970814, -4.719441, -6.88178, 0, -0.5, 0.5, 0.5,
-0.03970814, -4.719441, -6.88178, 1, -0.5, 0.5, 0.5,
-0.03970814, -4.719441, -6.88178, 1, 1.5, 0.5, 0.5,
-0.03970814, -4.719441, -6.88178, 0, 1.5, 0.5, 0.5
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
-4.109019, -0.1719747, -6.88178, 0, -0.5, 0.5, 0.5,
-4.109019, -0.1719747, -6.88178, 1, -0.5, 0.5, 0.5,
-4.109019, -0.1719747, -6.88178, 1, 1.5, 0.5, 0.5,
-4.109019, -0.1719747, -6.88178, 0, 1.5, 0.5, 0.5
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
-4.109019, -4.719441, 0.4650252, 0, -0.5, 0.5, 0.5,
-4.109019, -4.719441, 0.4650252, 1, -0.5, 0.5, 0.5,
-4.109019, -4.719441, 0.4650252, 1, 1.5, 0.5, 0.5,
-4.109019, -4.719441, 0.4650252, 0, 1.5, 0.5, 0.5
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
-3, -3.670026, -5.186363,
2, -3.670026, -5.186363,
-3, -3.670026, -5.186363,
-3, -3.844928, -5.468933,
-2, -3.670026, -5.186363,
-2, -3.844928, -5.468933,
-1, -3.670026, -5.186363,
-1, -3.844928, -5.468933,
0, -3.670026, -5.186363,
0, -3.844928, -5.468933,
1, -3.670026, -5.186363,
1, -3.844928, -5.468933,
2, -3.670026, -5.186363,
2, -3.844928, -5.468933
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
-3, -4.194733, -6.034071, 0, -0.5, 0.5, 0.5,
-3, -4.194733, -6.034071, 1, -0.5, 0.5, 0.5,
-3, -4.194733, -6.034071, 1, 1.5, 0.5, 0.5,
-3, -4.194733, -6.034071, 0, 1.5, 0.5, 0.5,
-2, -4.194733, -6.034071, 0, -0.5, 0.5, 0.5,
-2, -4.194733, -6.034071, 1, -0.5, 0.5, 0.5,
-2, -4.194733, -6.034071, 1, 1.5, 0.5, 0.5,
-2, -4.194733, -6.034071, 0, 1.5, 0.5, 0.5,
-1, -4.194733, -6.034071, 0, -0.5, 0.5, 0.5,
-1, -4.194733, -6.034071, 1, -0.5, 0.5, 0.5,
-1, -4.194733, -6.034071, 1, 1.5, 0.5, 0.5,
-1, -4.194733, -6.034071, 0, 1.5, 0.5, 0.5,
0, -4.194733, -6.034071, 0, -0.5, 0.5, 0.5,
0, -4.194733, -6.034071, 1, -0.5, 0.5, 0.5,
0, -4.194733, -6.034071, 1, 1.5, 0.5, 0.5,
0, -4.194733, -6.034071, 0, 1.5, 0.5, 0.5,
1, -4.194733, -6.034071, 0, -0.5, 0.5, 0.5,
1, -4.194733, -6.034071, 1, -0.5, 0.5, 0.5,
1, -4.194733, -6.034071, 1, 1.5, 0.5, 0.5,
1, -4.194733, -6.034071, 0, 1.5, 0.5, 0.5,
2, -4.194733, -6.034071, 0, -0.5, 0.5, 0.5,
2, -4.194733, -6.034071, 1, -0.5, 0.5, 0.5,
2, -4.194733, -6.034071, 1, 1.5, 0.5, 0.5,
2, -4.194733, -6.034071, 0, 1.5, 0.5, 0.5
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
-3.169947, -3, -5.186363,
-3.169947, 3, -5.186363,
-3.169947, -3, -5.186363,
-3.326459, -3, -5.468933,
-3.169947, -2, -5.186363,
-3.326459, -2, -5.468933,
-3.169947, -1, -5.186363,
-3.326459, -1, -5.468933,
-3.169947, 0, -5.186363,
-3.326459, 0, -5.468933,
-3.169947, 1, -5.186363,
-3.326459, 1, -5.468933,
-3.169947, 2, -5.186363,
-3.326459, 2, -5.468933,
-3.169947, 3, -5.186363,
-3.326459, 3, -5.468933
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
-3.639483, -3, -6.034071, 0, -0.5, 0.5, 0.5,
-3.639483, -3, -6.034071, 1, -0.5, 0.5, 0.5,
-3.639483, -3, -6.034071, 1, 1.5, 0.5, 0.5,
-3.639483, -3, -6.034071, 0, 1.5, 0.5, 0.5,
-3.639483, -2, -6.034071, 0, -0.5, 0.5, 0.5,
-3.639483, -2, -6.034071, 1, -0.5, 0.5, 0.5,
-3.639483, -2, -6.034071, 1, 1.5, 0.5, 0.5,
-3.639483, -2, -6.034071, 0, 1.5, 0.5, 0.5,
-3.639483, -1, -6.034071, 0, -0.5, 0.5, 0.5,
-3.639483, -1, -6.034071, 1, -0.5, 0.5, 0.5,
-3.639483, -1, -6.034071, 1, 1.5, 0.5, 0.5,
-3.639483, -1, -6.034071, 0, 1.5, 0.5, 0.5,
-3.639483, 0, -6.034071, 0, -0.5, 0.5, 0.5,
-3.639483, 0, -6.034071, 1, -0.5, 0.5, 0.5,
-3.639483, 0, -6.034071, 1, 1.5, 0.5, 0.5,
-3.639483, 0, -6.034071, 0, 1.5, 0.5, 0.5,
-3.639483, 1, -6.034071, 0, -0.5, 0.5, 0.5,
-3.639483, 1, -6.034071, 1, -0.5, 0.5, 0.5,
-3.639483, 1, -6.034071, 1, 1.5, 0.5, 0.5,
-3.639483, 1, -6.034071, 0, 1.5, 0.5, 0.5,
-3.639483, 2, -6.034071, 0, -0.5, 0.5, 0.5,
-3.639483, 2, -6.034071, 1, -0.5, 0.5, 0.5,
-3.639483, 2, -6.034071, 1, 1.5, 0.5, 0.5,
-3.639483, 2, -6.034071, 0, 1.5, 0.5, 0.5,
-3.639483, 3, -6.034071, 0, -0.5, 0.5, 0.5,
-3.639483, 3, -6.034071, 1, -0.5, 0.5, 0.5,
-3.639483, 3, -6.034071, 1, 1.5, 0.5, 0.5,
-3.639483, 3, -6.034071, 0, 1.5, 0.5, 0.5
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
-3.169947, -3.670026, -4,
-3.169947, -3.670026, 4,
-3.169947, -3.670026, -4,
-3.326459, -3.844928, -4,
-3.169947, -3.670026, -2,
-3.326459, -3.844928, -2,
-3.169947, -3.670026, 0,
-3.326459, -3.844928, 0,
-3.169947, -3.670026, 2,
-3.326459, -3.844928, 2,
-3.169947, -3.670026, 4,
-3.326459, -3.844928, 4
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
-3.639483, -4.194733, -4, 0, -0.5, 0.5, 0.5,
-3.639483, -4.194733, -4, 1, -0.5, 0.5, 0.5,
-3.639483, -4.194733, -4, 1, 1.5, 0.5, 0.5,
-3.639483, -4.194733, -4, 0, 1.5, 0.5, 0.5,
-3.639483, -4.194733, -2, 0, -0.5, 0.5, 0.5,
-3.639483, -4.194733, -2, 1, -0.5, 0.5, 0.5,
-3.639483, -4.194733, -2, 1, 1.5, 0.5, 0.5,
-3.639483, -4.194733, -2, 0, 1.5, 0.5, 0.5,
-3.639483, -4.194733, 0, 0, -0.5, 0.5, 0.5,
-3.639483, -4.194733, 0, 1, -0.5, 0.5, 0.5,
-3.639483, -4.194733, 0, 1, 1.5, 0.5, 0.5,
-3.639483, -4.194733, 0, 0, 1.5, 0.5, 0.5,
-3.639483, -4.194733, 2, 0, -0.5, 0.5, 0.5,
-3.639483, -4.194733, 2, 1, -0.5, 0.5, 0.5,
-3.639483, -4.194733, 2, 1, 1.5, 0.5, 0.5,
-3.639483, -4.194733, 2, 0, 1.5, 0.5, 0.5,
-3.639483, -4.194733, 4, 0, -0.5, 0.5, 0.5,
-3.639483, -4.194733, 4, 1, -0.5, 0.5, 0.5,
-3.639483, -4.194733, 4, 1, 1.5, 0.5, 0.5,
-3.639483, -4.194733, 4, 0, 1.5, 0.5, 0.5
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
-3.169947, -3.670026, -5.186363,
-3.169947, 3.326076, -5.186363,
-3.169947, -3.670026, 6.116414,
-3.169947, 3.326076, 6.116414,
-3.169947, -3.670026, -5.186363,
-3.169947, -3.670026, 6.116414,
-3.169947, 3.326076, -5.186363,
-3.169947, 3.326076, 6.116414,
-3.169947, -3.670026, -5.186363,
3.090531, -3.670026, -5.186363,
-3.169947, -3.670026, 6.116414,
3.090531, -3.670026, 6.116414,
-3.169947, 3.326076, -5.186363,
3.090531, 3.326076, -5.186363,
-3.169947, 3.326076, 6.116414,
3.090531, 3.326076, 6.116414,
3.090531, -3.670026, -5.186363,
3.090531, 3.326076, -5.186363,
3.090531, -3.670026, 6.116414,
3.090531, 3.326076, 6.116414,
3.090531, -3.670026, -5.186363,
3.090531, -3.670026, 6.116414,
3.090531, 3.326076, -5.186363,
3.090531, 3.326076, 6.116414
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
var radius = 7.845913;
var distance = 34.90735;
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
mvMatrix.translate( 0.03970814, 0.1719747, -0.4650252 );
mvMatrix.scale( 1.355033, 1.212555, 0.7505373 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.90735);
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
zoxamide<-read.table("zoxamide.xyz")
```

```
## Error in read.table("zoxamide.xyz"): no lines available in input
```

```r
x<-zoxamide$V2
```

```
## Error in eval(expr, envir, enclos): object 'zoxamide' not found
```

```r
y<-zoxamide$V3
```

```
## Error in eval(expr, envir, enclos): object 'zoxamide' not found
```

```r
z<-zoxamide$V4
```

```
## Error in eval(expr, envir, enclos): object 'zoxamide' not found
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
-3.078775, 0.602332, -0.1194758, 0, 0, 1, 1, 1,
-3.015205, -0.2658467, -1.451712, 1, 0, 0, 1, 1,
-2.830711, 0.6554084, -1.382243, 1, 0, 0, 1, 1,
-2.785743, -0.8843039, -2.53651, 1, 0, 0, 1, 1,
-2.734892, -0.7867444, -1.196764, 1, 0, 0, 1, 1,
-2.650137, 0.6669397, -1.967261, 1, 0, 0, 1, 1,
-2.647888, -1.145587, -3.265758, 0, 0, 0, 1, 1,
-2.587502, 0.602136, -0.8618559, 0, 0, 0, 1, 1,
-2.459821, -0.4633061, -1.942517, 0, 0, 0, 1, 1,
-2.408539, -0.4704134, -2.017492, 0, 0, 0, 1, 1,
-2.389639, 0.8733383, -2.524743, 0, 0, 0, 1, 1,
-2.357168, -0.2245993, 0.7265474, 0, 0, 0, 1, 1,
-2.335451, 0.2107607, 0.0484888, 0, 0, 0, 1, 1,
-2.320001, -0.3243201, 0.04404821, 1, 1, 1, 1, 1,
-2.31222, -0.8438526, -0.9425402, 1, 1, 1, 1, 1,
-2.267394, 1.750542, -0.6704922, 1, 1, 1, 1, 1,
-2.219487, 2.368944, -1.308948, 1, 1, 1, 1, 1,
-2.213014, -1.673141, -2.527934, 1, 1, 1, 1, 1,
-2.161987, 1.331561, -2.702531, 1, 1, 1, 1, 1,
-2.15814, 0.06924606, -2.726434, 1, 1, 1, 1, 1,
-2.103543, -0.6140394, -2.538513, 1, 1, 1, 1, 1,
-2.100211, -0.8665678, -2.861361, 1, 1, 1, 1, 1,
-2.085994, 0.8114142, -0.2280626, 1, 1, 1, 1, 1,
-2.058019, 1.374411, -1.781043, 1, 1, 1, 1, 1,
-2.053483, 0.1228932, -1.070528, 1, 1, 1, 1, 1,
-2.04044, 0.7672952, 0.05735356, 1, 1, 1, 1, 1,
-2.008149, 1.642643, -0.7767804, 1, 1, 1, 1, 1,
-1.989385, -0.06235817, -2.670803, 1, 1, 1, 1, 1,
-1.976852, 0.526994, -1.487682, 0, 0, 1, 1, 1,
-1.920903, 1.230294, -1.704975, 1, 0, 0, 1, 1,
-1.918949, -0.1610581, -1.382496, 1, 0, 0, 1, 1,
-1.903448, -0.3131005, -2.832177, 1, 0, 0, 1, 1,
-1.898025, 1.259165, 0.723974, 1, 0, 0, 1, 1,
-1.891685, 0.8687892, -0.8806922, 1, 0, 0, 1, 1,
-1.890231, -0.1961218, -2.379005, 0, 0, 0, 1, 1,
-1.879808, 0.636683, -1.976175, 0, 0, 0, 1, 1,
-1.872202, -0.8941966, -1.892721, 0, 0, 0, 1, 1,
-1.861036, -2.031351, -2.340963, 0, 0, 0, 1, 1,
-1.85869, -1.39025, -1.826793, 0, 0, 0, 1, 1,
-1.844643, -1.436458, -3.01977, 0, 0, 0, 1, 1,
-1.806495, -0.4156935, -0.8533157, 0, 0, 0, 1, 1,
-1.793309, -1.203529, -1.126539, 1, 1, 1, 1, 1,
-1.757627, -0.1983377, -2.557259, 1, 1, 1, 1, 1,
-1.742979, -0.595706, -0.2525216, 1, 1, 1, 1, 1,
-1.729932, 0.7390007, -1.5506, 1, 1, 1, 1, 1,
-1.677004, -0.2749409, -1.456389, 1, 1, 1, 1, 1,
-1.647145, 0.5486526, -1.534644, 1, 1, 1, 1, 1,
-1.614766, 0.901376, -0.5954123, 1, 1, 1, 1, 1,
-1.60857, 0.3690244, -2.031339, 1, 1, 1, 1, 1,
-1.60201, -0.5644392, -2.471224, 1, 1, 1, 1, 1,
-1.559227, -0.1494545, -1.819572, 1, 1, 1, 1, 1,
-1.549241, 1.450692, 1.662392, 1, 1, 1, 1, 1,
-1.51763, 1.647469, -1.571549, 1, 1, 1, 1, 1,
-1.490884, 0.5971437, 0.3638484, 1, 1, 1, 1, 1,
-1.48761, -0.3752584, -1.838021, 1, 1, 1, 1, 1,
-1.472604, -0.6343549, -1.993957, 1, 1, 1, 1, 1,
-1.459202, -1.681643, -2.659463, 0, 0, 1, 1, 1,
-1.457038, -1.060832, -2.350909, 1, 0, 0, 1, 1,
-1.450625, 0.3660811, -2.006147, 1, 0, 0, 1, 1,
-1.447829, -0.982814, -1.740401, 1, 0, 0, 1, 1,
-1.431104, 0.4302791, 0.4755071, 1, 0, 0, 1, 1,
-1.428984, -1.475237, -1.574707, 1, 0, 0, 1, 1,
-1.404301, -0.01919853, -2.5899, 0, 0, 0, 1, 1,
-1.399032, 1.805315, -3.604199, 0, 0, 0, 1, 1,
-1.395762, 0.4435132, -1.767576, 0, 0, 0, 1, 1,
-1.393371, 0.8633294, -0.6672966, 0, 0, 0, 1, 1,
-1.392048, -1.445379, -1.280399, 0, 0, 0, 1, 1,
-1.384608, -0.3595057, -1.673694, 0, 0, 0, 1, 1,
-1.382936, -0.7667961, -1.901281, 0, 0, 0, 1, 1,
-1.380611, -0.506094, -1.486181, 1, 1, 1, 1, 1,
-1.373101, -2.523249, -1.441957, 1, 1, 1, 1, 1,
-1.371475, -2.214248, -3.306428, 1, 1, 1, 1, 1,
-1.3713, -0.2012233, -2.275819, 1, 1, 1, 1, 1,
-1.370405, 0.7146751, -1.585434, 1, 1, 1, 1, 1,
-1.367295, -0.4000743, -2.001222, 1, 1, 1, 1, 1,
-1.366473, -0.09327495, -1.015094, 1, 1, 1, 1, 1,
-1.364094, -0.5112498, -0.5095463, 1, 1, 1, 1, 1,
-1.362237, 0.477851, -0.8646723, 1, 1, 1, 1, 1,
-1.360527, -1.140595, -4.708232, 1, 1, 1, 1, 1,
-1.359478, -0.5543882, -2.328123, 1, 1, 1, 1, 1,
-1.357243, -1.081816, -1.072207, 1, 1, 1, 1, 1,
-1.355682, -0.7441549, -2.248425, 1, 1, 1, 1, 1,
-1.348174, 2.156364, -0.3650649, 1, 1, 1, 1, 1,
-1.340009, 1.716368, -1.43095, 1, 1, 1, 1, 1,
-1.337405, 0.9485629, -0.4592566, 0, 0, 1, 1, 1,
-1.335972, -0.8362288, 0.3161074, 1, 0, 0, 1, 1,
-1.331306, 0.1413132, -2.873647, 1, 0, 0, 1, 1,
-1.32997, -0.6957805, -3.069334, 1, 0, 0, 1, 1,
-1.329535, -1.248237, -4.027197, 1, 0, 0, 1, 1,
-1.328984, 1.011237, -1.093511, 1, 0, 0, 1, 1,
-1.327843, 0.1367137, -0.8345162, 0, 0, 0, 1, 1,
-1.321621, -0.321751, -3.414709, 0, 0, 0, 1, 1,
-1.313751, 0.8812429, -0.2600511, 0, 0, 0, 1, 1,
-1.298148, 0.3937388, -0.2590976, 0, 0, 0, 1, 1,
-1.292001, 0.6651021, 0.1621551, 0, 0, 0, 1, 1,
-1.283839, 0.7316757, -1.475652, 0, 0, 0, 1, 1,
-1.279922, 0.5264081, -1.666862, 0, 0, 0, 1, 1,
-1.271222, 1.525955, 0.6954825, 1, 1, 1, 1, 1,
-1.270946, 0.4471422, -0.4270887, 1, 1, 1, 1, 1,
-1.263514, 1.304559, -2.455568, 1, 1, 1, 1, 1,
-1.257208, -1.659585, -3.921978, 1, 1, 1, 1, 1,
-1.253563, -0.8962326, -2.300259, 1, 1, 1, 1, 1,
-1.242057, 0.111342, -2.852695, 1, 1, 1, 1, 1,
-1.236559, 0.7517885, -1.016765, 1, 1, 1, 1, 1,
-1.230781, -0.3650993, -1.544441, 1, 1, 1, 1, 1,
-1.229186, -0.5388307, -2.741137, 1, 1, 1, 1, 1,
-1.223669, 0.5130842, 1.118066, 1, 1, 1, 1, 1,
-1.216645, 0.3853629, 1.903726, 1, 1, 1, 1, 1,
-1.215435, -0.07861643, -3.387388, 1, 1, 1, 1, 1,
-1.212623, -0.9873635, -1.698816, 1, 1, 1, 1, 1,
-1.203916, 0.599333, 0.1647301, 1, 1, 1, 1, 1,
-1.203668, 0.0545688, -1.423315, 1, 1, 1, 1, 1,
-1.20226, -0.8930636, -2.957007, 0, 0, 1, 1, 1,
-1.201223, -1.323735, -0.4896869, 1, 0, 0, 1, 1,
-1.199488, -1.851745, -1.817308, 1, 0, 0, 1, 1,
-1.191521, 1.711305, -0.2617591, 1, 0, 0, 1, 1,
-1.188753, -0.3782662, -2.297541, 1, 0, 0, 1, 1,
-1.188338, -0.9736113, -2.986274, 1, 0, 0, 1, 1,
-1.188131, -0.5249961, -0.9837878, 0, 0, 0, 1, 1,
-1.188055, -1.00514, 0.08977081, 0, 0, 0, 1, 1,
-1.187323, -0.6484627, -2.450094, 0, 0, 0, 1, 1,
-1.186984, 0.74753, -1.223867, 0, 0, 0, 1, 1,
-1.183095, 0.2684999, -1.978358, 0, 0, 0, 1, 1,
-1.178795, 0.36637, -1.299065, 0, 0, 0, 1, 1,
-1.175577, 1.533886, -0.9516043, 0, 0, 0, 1, 1,
-1.172432, -0.9842743, -4.171241, 1, 1, 1, 1, 1,
-1.16962, 0.4671095, -1.891656, 1, 1, 1, 1, 1,
-1.167046, 0.1099906, -2.282028, 1, 1, 1, 1, 1,
-1.166926, 0.2975921, -3.04189, 1, 1, 1, 1, 1,
-1.15963, -0.6672345, -2.987859, 1, 1, 1, 1, 1,
-1.157918, -0.157171, -1.839103, 1, 1, 1, 1, 1,
-1.155594, -1.168432, -2.189731, 1, 1, 1, 1, 1,
-1.148952, 0.8363447, -1.354844, 1, 1, 1, 1, 1,
-1.147099, 0.2168579, -2.029987, 1, 1, 1, 1, 1,
-1.14301, -1.648059, -3.144976, 1, 1, 1, 1, 1,
-1.135074, 0.7790262, 0.8559575, 1, 1, 1, 1, 1,
-1.121518, 0.4717679, 0.08475596, 1, 1, 1, 1, 1,
-1.119259, -0.239911, -1.162007, 1, 1, 1, 1, 1,
-1.115878, 0.5148534, -0.08347909, 1, 1, 1, 1, 1,
-1.114547, 0.3970921, -0.7104921, 1, 1, 1, 1, 1,
-1.099567, 1.040566, -0.7995893, 0, 0, 1, 1, 1,
-1.09947, 0.1752057, -3.146238, 1, 0, 0, 1, 1,
-1.095161, 0.4934185, -0.4929287, 1, 0, 0, 1, 1,
-1.094538, 2.088674, 0.2188207, 1, 0, 0, 1, 1,
-1.084489, 0.566941, -1.732131, 1, 0, 0, 1, 1,
-1.082929, -0.3217249, -1.022657, 1, 0, 0, 1, 1,
-1.078104, -0.5572439, -1.264889, 0, 0, 0, 1, 1,
-1.077658, 0.9410011, -1.03585, 0, 0, 0, 1, 1,
-1.074211, -0.1998924, -1.359151, 0, 0, 0, 1, 1,
-1.070952, 1.004391, -1.284383, 0, 0, 0, 1, 1,
-1.068781, -0.4131871, -0.6421528, 0, 0, 0, 1, 1,
-1.065202, -0.2696404, -1.333403, 0, 0, 0, 1, 1,
-1.059907, 0.1972492, -1.25148, 0, 0, 0, 1, 1,
-1.048403, -0.03845083, -1.976358, 1, 1, 1, 1, 1,
-1.038498, -0.2062147, -3.241225, 1, 1, 1, 1, 1,
-1.03143, -0.274584, -1.079867, 1, 1, 1, 1, 1,
-1.026536, 0.8810467, -0.6727324, 1, 1, 1, 1, 1,
-1.026535, 0.2458181, -0.1514964, 1, 1, 1, 1, 1,
-1.018245, 0.8711548, -2.429345, 1, 1, 1, 1, 1,
-1.013631, 0.7308946, -0.7055395, 1, 1, 1, 1, 1,
-1.012805, 0.6133185, -1.027685, 1, 1, 1, 1, 1,
-1.011341, -0.5228876, -2.255154, 1, 1, 1, 1, 1,
-1.006778, -0.03317252, -0.4565381, 1, 1, 1, 1, 1,
-1.004253, -1.765247, -1.027047, 1, 1, 1, 1, 1,
-1.001776, -0.4852965, -0.916829, 1, 1, 1, 1, 1,
-1.000818, -1.490197, -1.511111, 1, 1, 1, 1, 1,
-1.000783, 0.009703412, -0.2845751, 1, 1, 1, 1, 1,
-0.9984257, 0.1564665, -2.039209, 1, 1, 1, 1, 1,
-0.9975345, -0.1045379, -0.9930027, 0, 0, 1, 1, 1,
-0.9922301, 0.9392975, 0.1430808, 1, 0, 0, 1, 1,
-0.9913372, 0.4580901, -0.1047111, 1, 0, 0, 1, 1,
-0.9870089, 1.198577, -1.006892, 1, 0, 0, 1, 1,
-0.9862188, 1.331285, -0.08913016, 1, 0, 0, 1, 1,
-0.9836079, 0.4840136, -0.2448447, 1, 0, 0, 1, 1,
-0.9806979, 1.169913, -0.5499121, 0, 0, 0, 1, 1,
-0.9773784, -0.7841096, -0.2054587, 0, 0, 0, 1, 1,
-0.9644024, -1.458296, -1.778214, 0, 0, 0, 1, 1,
-0.9643776, -1.697226, -4.419512, 0, 0, 0, 1, 1,
-0.9626377, 0.7891353, -0.9529694, 0, 0, 0, 1, 1,
-0.9609208, -0.7386901, -0.8554214, 0, 0, 0, 1, 1,
-0.9594048, 1.07439, 0.6924774, 0, 0, 0, 1, 1,
-0.9530674, -0.1948876, -1.846907, 1, 1, 1, 1, 1,
-0.9488081, 0.1715899, -2.179121, 1, 1, 1, 1, 1,
-0.9460425, 0.08827467, -0.9435951, 1, 1, 1, 1, 1,
-0.9450589, 0.7149928, -2.0449, 1, 1, 1, 1, 1,
-0.9448321, 0.8847984, 0.5171939, 1, 1, 1, 1, 1,
-0.9432943, -1.38157, -2.728619, 1, 1, 1, 1, 1,
-0.940639, 1.474253, -1.713287, 1, 1, 1, 1, 1,
-0.9399434, 1.491199, -0.5420769, 1, 1, 1, 1, 1,
-0.9385287, -0.131818, -0.1093347, 1, 1, 1, 1, 1,
-0.9382107, 1.906523, -0.5975173, 1, 1, 1, 1, 1,
-0.9372942, 0.4455899, -1.268187, 1, 1, 1, 1, 1,
-0.9355033, -0.06747864, -2.204452, 1, 1, 1, 1, 1,
-0.9275942, 0.687283, -0.6616879, 1, 1, 1, 1, 1,
-0.9264679, 0.3911265, -2.174666, 1, 1, 1, 1, 1,
-0.921743, 1.696257, 0.09221814, 1, 1, 1, 1, 1,
-0.9196668, -1.453469, -2.459839, 0, 0, 1, 1, 1,
-0.9191678, -2.699201, -2.067925, 1, 0, 0, 1, 1,
-0.918573, -0.07674781, -2.159215, 1, 0, 0, 1, 1,
-0.9147357, -0.6994715, -4.110565, 1, 0, 0, 1, 1,
-0.908205, -0.853963, -3.899818, 1, 0, 0, 1, 1,
-0.9071664, -1.316055, -3.451352, 1, 0, 0, 1, 1,
-0.901723, -1.154378, -4.603757, 0, 0, 0, 1, 1,
-0.8991461, -0.761874, -0.7325327, 0, 0, 0, 1, 1,
-0.8978287, 0.2908287, -2.043212, 0, 0, 0, 1, 1,
-0.8955104, -0.2343632, -0.5478696, 0, 0, 0, 1, 1,
-0.892575, 1.304422, -0.3511084, 0, 0, 0, 1, 1,
-0.8915768, -0.6620927, -2.583757, 0, 0, 0, 1, 1,
-0.8907888, 0.9218301, -0.5785077, 0, 0, 0, 1, 1,
-0.8869472, -0.2233486, -1.138447, 1, 1, 1, 1, 1,
-0.8862587, 0.7362437, -0.6109523, 1, 1, 1, 1, 1,
-0.8723381, -0.06202686, -2.722162, 1, 1, 1, 1, 1,
-0.8608355, 0.06169022, -1.009343, 1, 1, 1, 1, 1,
-0.856963, -0.1514369, -0.6203294, 1, 1, 1, 1, 1,
-0.8526527, 0.5075978, 0.3374282, 1, 1, 1, 1, 1,
-0.8481284, 0.003026232, -3.114352, 1, 1, 1, 1, 1,
-0.8470148, 1.687281, -0.6229473, 1, 1, 1, 1, 1,
-0.844309, -0.660622, -3.458456, 1, 1, 1, 1, 1,
-0.8246982, -0.7082962, -0.2954006, 1, 1, 1, 1, 1,
-0.8217991, 0.79928, -0.2107822, 1, 1, 1, 1, 1,
-0.8206362, 0.9289264, -1.937939, 1, 1, 1, 1, 1,
-0.8142854, -1.261976, -0.13898, 1, 1, 1, 1, 1,
-0.8136232, 0.6863366, -2.801761, 1, 1, 1, 1, 1,
-0.8131121, -0.3273229, -4.211334, 1, 1, 1, 1, 1,
-0.8047682, 1.604079, -1.459288, 0, 0, 1, 1, 1,
-0.8038785, 0.875695, -0.6339414, 1, 0, 0, 1, 1,
-0.7842768, 0.1172503, -2.655118, 1, 0, 0, 1, 1,
-0.7830673, 0.2624516, -3.067779, 1, 0, 0, 1, 1,
-0.7764397, 1.347806, -0.5612943, 1, 0, 0, 1, 1,
-0.7739869, 0.5463189, -2.521154, 1, 0, 0, 1, 1,
-0.7733389, 0.3743649, -0.1848412, 0, 0, 0, 1, 1,
-0.7650941, -0.3857591, -2.986104, 0, 0, 0, 1, 1,
-0.7650824, -0.993461, -0.8009308, 0, 0, 0, 1, 1,
-0.7571784, 0.1088866, -1.869856, 0, 0, 0, 1, 1,
-0.7559725, 1.680385, -1.243696, 0, 0, 0, 1, 1,
-0.7515173, 0.6669625, -1.261143, 0, 0, 0, 1, 1,
-0.7485651, -1.645108, -2.784333, 0, 0, 0, 1, 1,
-0.7479953, 0.5119361, -0.9806433, 1, 1, 1, 1, 1,
-0.7401665, -0.8359875, -0.5126367, 1, 1, 1, 1, 1,
-0.7275814, 0.380455, -0.08827373, 1, 1, 1, 1, 1,
-0.7263013, 0.07494708, -1.111344, 1, 1, 1, 1, 1,
-0.7238859, 0.5224002, -1.542439, 1, 1, 1, 1, 1,
-0.7143346, -0.3758217, -1.455586, 1, 1, 1, 1, 1,
-0.7110813, -1.685553, -3.478739, 1, 1, 1, 1, 1,
-0.708694, -0.2910398, -2.081278, 1, 1, 1, 1, 1,
-0.704284, 0.2286267, -1.135149, 1, 1, 1, 1, 1,
-0.7023954, 0.1771356, -0.8475489, 1, 1, 1, 1, 1,
-0.6995739, -0.4448313, -2.021445, 1, 1, 1, 1, 1,
-0.6928197, 0.5096229, -0.2986258, 1, 1, 1, 1, 1,
-0.6883854, 0.5165731, 0.2579266, 1, 1, 1, 1, 1,
-0.6848978, -0.8335987, -2.588819, 1, 1, 1, 1, 1,
-0.6778392, -0.5846569, -1.103676, 1, 1, 1, 1, 1,
-0.676033, -1.826667, -3.130787, 0, 0, 1, 1, 1,
-0.6752427, -1.241672, -3.770897, 1, 0, 0, 1, 1,
-0.6719819, -0.5372001, -0.9340037, 1, 0, 0, 1, 1,
-0.6664358, -0.9615268, -3.689207, 1, 0, 0, 1, 1,
-0.6626842, 0.9724613, -2.623297, 1, 0, 0, 1, 1,
-0.6605302, 0.3837987, -1.792602, 1, 0, 0, 1, 1,
-0.6605096, 1.462191, -1.399022, 0, 0, 0, 1, 1,
-0.6588377, 0.4158354, 0.3543984, 0, 0, 0, 1, 1,
-0.6582429, -1.471689, -1.753184, 0, 0, 0, 1, 1,
-0.6545746, 0.3434671, -2.136286, 0, 0, 0, 1, 1,
-0.6518652, 0.9070555, -0.7045268, 0, 0, 0, 1, 1,
-0.6492177, 1.105867, -0.608923, 0, 0, 0, 1, 1,
-0.6488016, -0.1423404, -1.96887, 0, 0, 0, 1, 1,
-0.6403806, 0.282496, -1.220442, 1, 1, 1, 1, 1,
-0.6359802, 0.3996564, -0.3931195, 1, 1, 1, 1, 1,
-0.6316604, -0.5197746, -4.45701, 1, 1, 1, 1, 1,
-0.630607, 0.3650699, -0.860572, 1, 1, 1, 1, 1,
-0.6282349, 1.537235, -1.033823, 1, 1, 1, 1, 1,
-0.627578, -0.1025699, -3.364838, 1, 1, 1, 1, 1,
-0.6265906, 1.51012, -1.27065, 1, 1, 1, 1, 1,
-0.6183137, -0.1172431, -1.72487, 1, 1, 1, 1, 1,
-0.6098185, -0.1381892, -3.226403, 1, 1, 1, 1, 1,
-0.6023529, 0.7659446, -0.8183224, 1, 1, 1, 1, 1,
-0.5997592, 2.452778, -0.3387938, 1, 1, 1, 1, 1,
-0.5967485, 0.6497125, -1.117828, 1, 1, 1, 1, 1,
-0.5854825, 0.05266272, -1.757837, 1, 1, 1, 1, 1,
-0.585178, 0.357332, -2.207953, 1, 1, 1, 1, 1,
-0.5772426, -0.07323288, -2.095212, 1, 1, 1, 1, 1,
-0.5756219, 0.03183521, -1.441915, 0, 0, 1, 1, 1,
-0.568139, -0.01826305, -0.4444487, 1, 0, 0, 1, 1,
-0.5677231, -0.1407932, -2.345844, 1, 0, 0, 1, 1,
-0.5653097, 0.9032617, -0.6916838, 1, 0, 0, 1, 1,
-0.5605921, -0.6560569, -1.019702, 1, 0, 0, 1, 1,
-0.5587364, 3.224191, 1.256041, 1, 0, 0, 1, 1,
-0.5565713, 1.023665, -0.4307998, 0, 0, 0, 1, 1,
-0.5536983, 0.01132721, -1.652043, 0, 0, 0, 1, 1,
-0.5518695, 1.08914, -1.167484, 0, 0, 0, 1, 1,
-0.5514431, 1.265604, -0.2355683, 0, 0, 0, 1, 1,
-0.5497951, 1.369254, -1.357602, 0, 0, 0, 1, 1,
-0.5496885, 0.4261285, -0.9533754, 0, 0, 0, 1, 1,
-0.5438672, -0.8880419, -2.347949, 0, 0, 0, 1, 1,
-0.540951, -0.403542, -3.101847, 1, 1, 1, 1, 1,
-0.5381246, -0.5426244, -2.215393, 1, 1, 1, 1, 1,
-0.5377632, -1.024051, -2.653024, 1, 1, 1, 1, 1,
-0.5358017, -0.5981373, -2.387192, 1, 1, 1, 1, 1,
-0.5352974, 0.06377415, -2.529578, 1, 1, 1, 1, 1,
-0.5347001, -1.279401, -4.138868, 1, 1, 1, 1, 1,
-0.5330014, -1.137561, -3.298293, 1, 1, 1, 1, 1,
-0.5307074, -0.7675757, -4.342528, 1, 1, 1, 1, 1,
-0.523639, -0.9393095, -1.091574, 1, 1, 1, 1, 1,
-0.5136907, -2.437799, -1.007231, 1, 1, 1, 1, 1,
-0.5067895, 1.29988, -1.686401, 1, 1, 1, 1, 1,
-0.5035812, 1.263843, -0.9585778, 1, 1, 1, 1, 1,
-0.5011381, -1.039011, -2.349098, 1, 1, 1, 1, 1,
-0.5007997, 0.4840787, -3.034384, 1, 1, 1, 1, 1,
-0.4994474, -0.4029123, -1.644205, 1, 1, 1, 1, 1,
-0.4992995, 1.811438, -1.401894, 0, 0, 1, 1, 1,
-0.4975597, -0.5246299, -3.935917, 1, 0, 0, 1, 1,
-0.497358, 0.9762266, -0.7288627, 1, 0, 0, 1, 1,
-0.4958389, 2.48574, -0.3574825, 1, 0, 0, 1, 1,
-0.492752, 0.06628945, -1.64113, 1, 0, 0, 1, 1,
-0.4903461, -0.8749342, -3.078883, 1, 0, 0, 1, 1,
-0.4837257, 0.7369493, 0.0985269, 0, 0, 0, 1, 1,
-0.4765346, 0.3240689, -2.209299, 0, 0, 0, 1, 1,
-0.4738502, 0.5228264, -2.512686, 0, 0, 0, 1, 1,
-0.4715483, -0.4607649, -1.043562, 0, 0, 0, 1, 1,
-0.4661081, -1.101549, -2.427022, 0, 0, 0, 1, 1,
-0.4618102, -0.3612746, -4.129539, 0, 0, 0, 1, 1,
-0.4602058, 0.9788324, 0.5537471, 0, 0, 0, 1, 1,
-0.4594777, -0.2049847, -1.867214, 1, 1, 1, 1, 1,
-0.4592876, 0.7471241, -0.08246954, 1, 1, 1, 1, 1,
-0.4552016, 1.400391, -0.445109, 1, 1, 1, 1, 1,
-0.4440443, 2.260746, 0.4421138, 1, 1, 1, 1, 1,
-0.4396275, -0.598132, -3.625245, 1, 1, 1, 1, 1,
-0.4361143, -0.1087202, -2.0813, 1, 1, 1, 1, 1,
-0.4345007, -1.134244, -2.346923, 1, 1, 1, 1, 1,
-0.4344476, -1.21831, -1.888442, 1, 1, 1, 1, 1,
-0.4329093, -0.9259385, -2.837351, 1, 1, 1, 1, 1,
-0.4324661, 0.6908161, -0.1619987, 1, 1, 1, 1, 1,
-0.4196087, -1.338468, -1.64531, 1, 1, 1, 1, 1,
-0.4175037, 0.6880441, -1.963264, 1, 1, 1, 1, 1,
-0.4158403, 0.6755781, 1.238791, 1, 1, 1, 1, 1,
-0.4153555, -1.103651, -1.725875, 1, 1, 1, 1, 1,
-0.4142819, 1.038316, 0.3320634, 1, 1, 1, 1, 1,
-0.4127488, -0.4576838, -2.308675, 0, 0, 1, 1, 1,
-0.4117368, 0.3144963, -0.1019689, 1, 0, 0, 1, 1,
-0.4016124, 1.792324, -1.937971, 1, 0, 0, 1, 1,
-0.3951372, -0.03190855, -3.164734, 1, 0, 0, 1, 1,
-0.3948359, -1.950745, -1.772847, 1, 0, 0, 1, 1,
-0.3941615, -1.541258, -0.9701788, 1, 0, 0, 1, 1,
-0.3889167, -1.328937, -3.51923, 0, 0, 0, 1, 1,
-0.3884997, 0.0903974, -2.363608, 0, 0, 0, 1, 1,
-0.3867188, -0.9668475, -2.424862, 0, 0, 0, 1, 1,
-0.3844672, 0.8572357, -0.2146301, 0, 0, 0, 1, 1,
-0.381318, -1.609693, -0.6552143, 0, 0, 0, 1, 1,
-0.3766158, 0.2556927, -1.645001, 0, 0, 0, 1, 1,
-0.3731763, 0.4119606, -0.4543042, 0, 0, 0, 1, 1,
-0.363224, 0.3778199, -0.8278083, 1, 1, 1, 1, 1,
-0.3585722, 0.4468107, -0.5273442, 1, 1, 1, 1, 1,
-0.3548501, 0.89027, 0.2482098, 1, 1, 1, 1, 1,
-0.3489254, 0.2528989, -1.174386, 1, 1, 1, 1, 1,
-0.3446634, 0.05330576, -1.138871, 1, 1, 1, 1, 1,
-0.3358409, 0.4640766, -0.4478069, 1, 1, 1, 1, 1,
-0.3347083, 2.38465, 0.9171407, 1, 1, 1, 1, 1,
-0.3339453, 0.9323332, -0.7547731, 1, 1, 1, 1, 1,
-0.3320663, 1.03387, -0.2210382, 1, 1, 1, 1, 1,
-0.3300263, 0.7366619, 0.1493639, 1, 1, 1, 1, 1,
-0.3271995, -0.7740939, -2.26384, 1, 1, 1, 1, 1,
-0.3188063, -1.107395, -3.109081, 1, 1, 1, 1, 1,
-0.3129444, -0.09316467, -2.652202, 1, 1, 1, 1, 1,
-0.3097759, 0.7844125, -0.5492791, 1, 1, 1, 1, 1,
-0.3062247, -0.7667893, -3.461215, 1, 1, 1, 1, 1,
-0.3061855, 1.47804, -0.6944434, 0, 0, 1, 1, 1,
-0.3037692, 2.501639, 0.1962684, 1, 0, 0, 1, 1,
-0.2960676, 0.6437737, -0.2857171, 1, 0, 0, 1, 1,
-0.2926643, 0.5997384, -0.6502587, 1, 0, 0, 1, 1,
-0.2879625, -1.086574, -4.85191, 1, 0, 0, 1, 1,
-0.2856996, -0.2127424, -3.503386, 1, 0, 0, 1, 1,
-0.2822731, -2.742469, -2.607049, 0, 0, 0, 1, 1,
-0.2806265, 0.6619537, -1.819354, 0, 0, 0, 1, 1,
-0.270423, 0.3790957, -1.621254, 0, 0, 0, 1, 1,
-0.2636786, 1.207262, -0.8608856, 0, 0, 0, 1, 1,
-0.2614902, 1.766931, 0.894764, 0, 0, 0, 1, 1,
-0.2593716, -1.261014, -1.474747, 0, 0, 0, 1, 1,
-0.2590257, -0.09376988, -1.952639, 0, 0, 0, 1, 1,
-0.2560236, -0.3982501, -3.5759, 1, 1, 1, 1, 1,
-0.2554973, -3.568141, -1.095263, 1, 1, 1, 1, 1,
-0.253321, 1.345821, -0.3862637, 1, 1, 1, 1, 1,
-0.2501219, 0.9241049, -0.7409683, 1, 1, 1, 1, 1,
-0.2492794, 0.2826363, -0.5539868, 1, 1, 1, 1, 1,
-0.2477332, -0.3364902, -3.282942, 1, 1, 1, 1, 1,
-0.2436928, -0.2784536, -1.665278, 1, 1, 1, 1, 1,
-0.2435886, -0.958465, -2.002779, 1, 1, 1, 1, 1,
-0.243268, -0.4373159, -2.909851, 1, 1, 1, 1, 1,
-0.2364618, -0.1702655, -1.814121, 1, 1, 1, 1, 1,
-0.2318086, 0.140665, -1.45814, 1, 1, 1, 1, 1,
-0.2268477, 0.2168459, -1.473882, 1, 1, 1, 1, 1,
-0.2258352, -0.5818466, -1.925875, 1, 1, 1, 1, 1,
-0.2198385, -1.139082, -2.818107, 1, 1, 1, 1, 1,
-0.2172447, -0.5016183, -3.061677, 1, 1, 1, 1, 1,
-0.2144539, -1.160719, -4.561478, 0, 0, 1, 1, 1,
-0.2017178, 1.833538, -0.6369722, 1, 0, 0, 1, 1,
-0.199059, -1.396475, -2.190619, 1, 0, 0, 1, 1,
-0.198654, -1.161433, -3.464849, 1, 0, 0, 1, 1,
-0.1985741, 1.83898, 2.324989, 1, 0, 0, 1, 1,
-0.1972221, -0.7868563, -2.718749, 1, 0, 0, 1, 1,
-0.1947298, -0.2534358, -2.449523, 0, 0, 0, 1, 1,
-0.1854718, -1.190782, -2.954558, 0, 0, 0, 1, 1,
-0.1840641, -1.802822, -2.131219, 0, 0, 0, 1, 1,
-0.1705324, -0.4943913, -0.6133684, 0, 0, 0, 1, 1,
-0.168779, -0.6480685, -1.176445, 0, 0, 0, 1, 1,
-0.1679336, -0.8223714, -1.763134, 0, 0, 0, 1, 1,
-0.1666082, -0.5967427, -2.327169, 0, 0, 0, 1, 1,
-0.1645229, -0.6885061, -4.18467, 1, 1, 1, 1, 1,
-0.1642688, -0.1404332, -3.747716, 1, 1, 1, 1, 1,
-0.1594497, 0.09284858, -1.660622, 1, 1, 1, 1, 1,
-0.1559708, -0.0150422, -2.201396, 1, 1, 1, 1, 1,
-0.1512293, 0.3207504, -0.1323325, 1, 1, 1, 1, 1,
-0.1419636, 2.351083, -0.3372961, 1, 1, 1, 1, 1,
-0.1392149, 0.363637, -2.000061, 1, 1, 1, 1, 1,
-0.1382509, 1.485985, 0.3651316, 1, 1, 1, 1, 1,
-0.1324245, -0.9412445, -3.31436, 1, 1, 1, 1, 1,
-0.1306106, -0.2893562, -2.418012, 1, 1, 1, 1, 1,
-0.1289067, -0.1016019, -0.8380848, 1, 1, 1, 1, 1,
-0.1280111, 0.258615, 0.1537193, 1, 1, 1, 1, 1,
-0.1247295, -3.460068, -2.034286, 1, 1, 1, 1, 1,
-0.1192257, 0.1822239, -0.4825417, 1, 1, 1, 1, 1,
-0.1176453, -0.229293, -2.976821, 1, 1, 1, 1, 1,
-0.1117331, 0.2405383, -2.166785, 0, 0, 1, 1, 1,
-0.1087754, 1.036271, 0.0589265, 1, 0, 0, 1, 1,
-0.1079984, -0.02321346, -2.257418, 1, 0, 0, 1, 1,
-0.1073337, -0.1248887, -3.258456, 1, 0, 0, 1, 1,
-0.1035716, 1.23151, -0.3132375, 1, 0, 0, 1, 1,
-0.09873984, -0.6928324, -2.33551, 1, 0, 0, 1, 1,
-0.09827878, -0.3851801, -4.398601, 0, 0, 0, 1, 1,
-0.09504106, 0.6404628, 0.2531, 0, 0, 0, 1, 1,
-0.09494456, 0.2868834, -1.526639, 0, 0, 0, 1, 1,
-0.09487815, -0.05486691, -1.31454, 0, 0, 0, 1, 1,
-0.08757122, 1.487756, -0.3874496, 0, 0, 0, 1, 1,
-0.08672731, 0.4876166, -1.106106, 0, 0, 0, 1, 1,
-0.08239571, 0.6363703, -0.7530801, 0, 0, 0, 1, 1,
-0.08180873, -1.55936, -4.389355, 1, 1, 1, 1, 1,
-0.0814396, 1.954126, 2.221693, 1, 1, 1, 1, 1,
-0.07630146, 0.4992047, -0.6861181, 1, 1, 1, 1, 1,
-0.0744982, 0.7204581, -0.2368424, 1, 1, 1, 1, 1,
-0.07125223, -1.793105, -3.162432, 1, 1, 1, 1, 1,
-0.06897151, 0.8956272, -1.761302, 1, 1, 1, 1, 1,
-0.06778993, 0.517552, 0.3239371, 1, 1, 1, 1, 1,
-0.0655656, 2.162552, -1.730926, 1, 1, 1, 1, 1,
-0.05957564, -0.8841226, -1.674592, 1, 1, 1, 1, 1,
-0.05814157, 1.17243, -0.5652883, 1, 1, 1, 1, 1,
-0.05624557, -0.2049575, -3.837749, 1, 1, 1, 1, 1,
-0.05232716, -0.5172057, -4.280314, 1, 1, 1, 1, 1,
-0.04872514, -1.568696, -4.787109, 1, 1, 1, 1, 1,
-0.04663103, 0.1386906, 0.7111832, 1, 1, 1, 1, 1,
-0.04262903, -1.656636, -2.651223, 1, 1, 1, 1, 1,
-0.04196541, 0.556743, 0.2047293, 0, 0, 1, 1, 1,
-0.04106111, -0.7697567, -5.02176, 1, 0, 0, 1, 1,
-0.03775448, 0.3347993, -0.301128, 1, 0, 0, 1, 1,
-0.03307821, -0.144029, -2.322792, 1, 0, 0, 1, 1,
-0.0300607, 0.1005138, 0.3960698, 1, 0, 0, 1, 1,
-0.0278583, -1.519143, -3.659634, 1, 0, 0, 1, 1,
-0.02647177, -0.5155075, -3.858707, 0, 0, 0, 1, 1,
-0.02549942, -0.179489, -1.496378, 0, 0, 0, 1, 1,
-0.02026452, -1.009384, -3.470514, 0, 0, 0, 1, 1,
-0.01815618, -0.3381315, -2.157587, 0, 0, 0, 1, 1,
-0.01668869, -0.7070808, -1.878773, 0, 0, 0, 1, 1,
-0.01066066, 0.2239659, 0.2009257, 0, 0, 0, 1, 1,
-0.008821583, -1.460723, -3.952606, 0, 0, 0, 1, 1,
-0.007014837, -0.1314362, -0.810765, 1, 1, 1, 1, 1,
-0.002216325, -0.9453073, -4.348631, 1, 1, 1, 1, 1,
0.0002881722, -0.6887202, 3.658514, 1, 1, 1, 1, 1,
0.00106762, -0.02718218, 1.792817, 1, 1, 1, 1, 1,
0.001225577, -0.3827638, 3.319276, 1, 1, 1, 1, 1,
0.00343138, -1.563349, 3.82844, 1, 1, 1, 1, 1,
0.01006968, -1.629265, 2.169143, 1, 1, 1, 1, 1,
0.01123529, -0.1179534, 4.932819, 1, 1, 1, 1, 1,
0.01573442, -1.72635, 2.797817, 1, 1, 1, 1, 1,
0.01680841, -0.356847, 5.061963, 1, 1, 1, 1, 1,
0.01863288, 1.623986, -0.003404898, 1, 1, 1, 1, 1,
0.02041672, -0.007218212, 2.137362, 1, 1, 1, 1, 1,
0.02115767, 1.520214, 2.894992, 1, 1, 1, 1, 1,
0.02129725, -1.308607, 4.528847, 1, 1, 1, 1, 1,
0.02616756, 0.03902271, 2.723408, 1, 1, 1, 1, 1,
0.02627908, 2.042252, 0.7320838, 0, 0, 1, 1, 1,
0.02736365, 0.01568133, 0.5840509, 1, 0, 0, 1, 1,
0.03106461, -1.304829, 2.46376, 1, 0, 0, 1, 1,
0.03437759, 0.6783268, 0.6448349, 1, 0, 0, 1, 1,
0.04027505, 0.08380448, -0.6781425, 1, 0, 0, 1, 1,
0.04160606, -0.891838, 2.358171, 1, 0, 0, 1, 1,
0.04434669, -0.002234988, 1.824247, 0, 0, 0, 1, 1,
0.04839036, -0.5687475, 0.9600499, 0, 0, 0, 1, 1,
0.05581595, 0.3336097, -0.4563245, 0, 0, 0, 1, 1,
0.05673733, 0.2051778, -0.348231, 0, 0, 0, 1, 1,
0.0600514, 0.6290717, 0.7867789, 0, 0, 0, 1, 1,
0.06114139, -1.0318, 3.606404, 0, 0, 0, 1, 1,
0.06182795, 1.570122, -0.7411811, 0, 0, 0, 1, 1,
0.06827057, -0.5386255, 2.570919, 1, 1, 1, 1, 1,
0.06868095, -0.4075885, 3.27036, 1, 1, 1, 1, 1,
0.07171236, -0.6188552, 4.259889, 1, 1, 1, 1, 1,
0.07265224, 1.100161, 0.9791118, 1, 1, 1, 1, 1,
0.0780663, -0.1258165, 2.789309, 1, 1, 1, 1, 1,
0.08055028, -0.8869354, 3.238777, 1, 1, 1, 1, 1,
0.0822373, 0.8164425, 0.8592953, 1, 1, 1, 1, 1,
0.08280687, 0.7047297, 0.6740829, 1, 1, 1, 1, 1,
0.08528323, 1.967403, 0.8557298, 1, 1, 1, 1, 1,
0.08650985, -0.8161231, 2.192682, 1, 1, 1, 1, 1,
0.08664313, 0.04804387, 0.5710211, 1, 1, 1, 1, 1,
0.08677638, -1.339686, 1.591234, 1, 1, 1, 1, 1,
0.09454652, 0.3042532, 0.245941, 1, 1, 1, 1, 1,
0.1010517, -0.7729692, 1.661834, 1, 1, 1, 1, 1,
0.1022428, -0.437826, 3.472567, 1, 1, 1, 1, 1,
0.1075901, -0.4304538, 3.619922, 0, 0, 1, 1, 1,
0.1081426, -0.7230418, 3.0173, 1, 0, 0, 1, 1,
0.1130404, 0.1905244, 1.083145, 1, 0, 0, 1, 1,
0.1137221, 1.041396, 0.5944705, 1, 0, 0, 1, 1,
0.1168643, 0.6154706, 1.786201, 1, 0, 0, 1, 1,
0.1213294, 0.6238183, 1.02352, 1, 0, 0, 1, 1,
0.1241194, -0.6908897, 1.219471, 0, 0, 0, 1, 1,
0.1277813, -2.325192, 3.434152, 0, 0, 0, 1, 1,
0.1323945, 0.7124008, -1.546952, 0, 0, 0, 1, 1,
0.1335274, 0.09455799, 0.7774433, 0, 0, 0, 1, 1,
0.1338113, 0.042005, 0.7377537, 0, 0, 0, 1, 1,
0.1382771, 0.2903216, 1.677606, 0, 0, 0, 1, 1,
0.1388016, 2.07045, -2.388389, 0, 0, 0, 1, 1,
0.1388866, -0.1611879, 0.8894434, 1, 1, 1, 1, 1,
0.1410064, 0.956245, -1.580101, 1, 1, 1, 1, 1,
0.143778, 0.3135275, -0.9786782, 1, 1, 1, 1, 1,
0.1446444, -1.696754, 3.014014, 1, 1, 1, 1, 1,
0.1448504, 0.5571733, 0.1068001, 1, 1, 1, 1, 1,
0.1454105, -1.394307, 3.747288, 1, 1, 1, 1, 1,
0.1500264, 1.058528, 1.158902, 1, 1, 1, 1, 1,
0.1511307, -0.7629799, 2.952931, 1, 1, 1, 1, 1,
0.1543476, 0.2309706, -0.6304034, 1, 1, 1, 1, 1,
0.1590668, -1.317227, 3.321444, 1, 1, 1, 1, 1,
0.1614834, -0.2768624, 4.3625, 1, 1, 1, 1, 1,
0.1615255, -1.156271, 3.670209, 1, 1, 1, 1, 1,
0.1621437, 0.06911352, -0.3087212, 1, 1, 1, 1, 1,
0.1626171, 2.838755, -0.4425466, 1, 1, 1, 1, 1,
0.1627796, -0.5932562, 3.658556, 1, 1, 1, 1, 1,
0.1641581, -0.5903856, 4.821313, 0, 0, 1, 1, 1,
0.1644613, -1.320006, 2.688844, 1, 0, 0, 1, 1,
0.1652544, -0.6849276, 2.081844, 1, 0, 0, 1, 1,
0.1709805, 0.8674389, -0.1813008, 1, 0, 0, 1, 1,
0.1710338, -1.075529, 5.95181, 1, 0, 0, 1, 1,
0.1718029, -1.041502, 2.802932, 1, 0, 0, 1, 1,
0.172775, -1.707322, 2.436227, 0, 0, 0, 1, 1,
0.1806859, 0.9093677, -0.9791111, 0, 0, 0, 1, 1,
0.181513, 0.1603843, 1.712985, 0, 0, 0, 1, 1,
0.1821132, 1.849523, 0.07627045, 0, 0, 0, 1, 1,
0.1824705, 0.6074859, 0.838623, 0, 0, 0, 1, 1,
0.1843778, 0.6385139, -0.7755778, 0, 0, 0, 1, 1,
0.1888327, 2.158478, 1.997823, 0, 0, 0, 1, 1,
0.1908586, -0.8393944, 1.217591, 1, 1, 1, 1, 1,
0.1923585, -1.464422, 5.415887, 1, 1, 1, 1, 1,
0.1930199, 1.851334, -0.1877766, 1, 1, 1, 1, 1,
0.1960248, -1.295557, 2.355028, 1, 1, 1, 1, 1,
0.1982739, -0.511353, 1.969795, 1, 1, 1, 1, 1,
0.2030746, -0.0814648, -1.164433, 1, 1, 1, 1, 1,
0.203736, 0.5936488, -0.05503558, 1, 1, 1, 1, 1,
0.2057827, -0.7289242, 3.70153, 1, 1, 1, 1, 1,
0.2059518, -0.5447192, 3.012856, 1, 1, 1, 1, 1,
0.2062475, 0.03393602, 0.9504332, 1, 1, 1, 1, 1,
0.2163701, -0.990194, 3.056095, 1, 1, 1, 1, 1,
0.2204225, 0.3110366, -0.686865, 1, 1, 1, 1, 1,
0.2250721, 0.5763935, -0.6848854, 1, 1, 1, 1, 1,
0.2262503, 1.026893, 0.5822051, 1, 1, 1, 1, 1,
0.2273163, -0.5962617, 0.8455395, 1, 1, 1, 1, 1,
0.236149, -1.000255, 1.453361, 0, 0, 1, 1, 1,
0.2366259, 0.7004848, 0.8240734, 1, 0, 0, 1, 1,
0.2375899, -1.338633, 1.305845, 1, 0, 0, 1, 1,
0.2383357, 1.470152, 0.4148493, 1, 0, 0, 1, 1,
0.2407494, -2.491879, 3.120557, 1, 0, 0, 1, 1,
0.2447677, 1.388724, -0.4703613, 1, 0, 0, 1, 1,
0.2452717, 1.767387, 1.861412, 0, 0, 0, 1, 1,
0.24724, 0.8732554, -0.7601694, 0, 0, 0, 1, 1,
0.2525528, -0.02248893, 1.571446, 0, 0, 0, 1, 1,
0.2542163, -0.09571598, 1.255918, 0, 0, 0, 1, 1,
0.2549251, 0.5315334, 1.855229, 0, 0, 0, 1, 1,
0.255614, 0.07443196, 3.277006, 0, 0, 0, 1, 1,
0.2595874, 1.464574, -0.1576274, 0, 0, 0, 1, 1,
0.2609846, 0.3280165, 0.7934401, 1, 1, 1, 1, 1,
0.2612989, 0.6821579, 0.15128, 1, 1, 1, 1, 1,
0.2615422, -0.589612, 2.384086, 1, 1, 1, 1, 1,
0.2659301, 1.220547, 0.2636703, 1, 1, 1, 1, 1,
0.2665495, -1.164488, 3.389404, 1, 1, 1, 1, 1,
0.2705248, -0.7919806, 2.827199, 1, 1, 1, 1, 1,
0.2794292, 0.7933682, 0.69067, 1, 1, 1, 1, 1,
0.279707, 0.1987534, -0.3570831, 1, 1, 1, 1, 1,
0.2810672, 0.9151052, -1.028258, 1, 1, 1, 1, 1,
0.2817933, 0.1169717, -0.7434624, 1, 1, 1, 1, 1,
0.2825913, 0.4691715, 1.182618, 1, 1, 1, 1, 1,
0.2840281, -1.010167, 5.459606, 1, 1, 1, 1, 1,
0.2871721, 1.191032, -0.9724212, 1, 1, 1, 1, 1,
0.2878148, -1.342893, 2.538946, 1, 1, 1, 1, 1,
0.29002, 0.729944, 0.8912759, 1, 1, 1, 1, 1,
0.2904313, -0.825254, 3.906414, 0, 0, 1, 1, 1,
0.292091, -0.9759914, 2.712377, 1, 0, 0, 1, 1,
0.2938118, -0.01646177, 2.282807, 1, 0, 0, 1, 1,
0.2956406, 0.6772419, -0.8407876, 1, 0, 0, 1, 1,
0.2958689, 1.325488, 0.5664009, 1, 0, 0, 1, 1,
0.2969767, 2.266696, 2.658406, 1, 0, 0, 1, 1,
0.2982328, 2.298171, -1.551287, 0, 0, 0, 1, 1,
0.2985136, -0.4513609, 3.035897, 0, 0, 0, 1, 1,
0.3009071, 1.824701, 0.4656498, 0, 0, 0, 1, 1,
0.3038642, -0.4678319, 3.106184, 0, 0, 0, 1, 1,
0.3079998, -0.5708762, 2.091682, 0, 0, 0, 1, 1,
0.3086471, 0.7019265, 2.430714, 0, 0, 0, 1, 1,
0.3093745, -0.9954128, 3.797667, 0, 0, 0, 1, 1,
0.3117692, 1.114392, -0.3680941, 1, 1, 1, 1, 1,
0.3120416, -0.4067394, 2.894605, 1, 1, 1, 1, 1,
0.3154132, 1.009281, -0.3807715, 1, 1, 1, 1, 1,
0.3161562, 0.1269606, 2.174044, 1, 1, 1, 1, 1,
0.3163689, -0.4420826, 2.347445, 1, 1, 1, 1, 1,
0.3168348, 0.3174661, 0.08972091, 1, 1, 1, 1, 1,
0.3193331, -0.5796294, 1.459833, 1, 1, 1, 1, 1,
0.3212706, -0.7843223, 4.478231, 1, 1, 1, 1, 1,
0.3225708, -1.238613, 2.316869, 1, 1, 1, 1, 1,
0.3276576, 1.126732, 0.8113755, 1, 1, 1, 1, 1,
0.332038, -0.9755839, 3.315848, 1, 1, 1, 1, 1,
0.3348614, -2.219239, 4.593841, 1, 1, 1, 1, 1,
0.3369867, -0.4088984, 2.215308, 1, 1, 1, 1, 1,
0.3385577, -1.79887, 2.7432, 1, 1, 1, 1, 1,
0.3407594, 0.895784, 1.342348, 1, 1, 1, 1, 1,
0.3483823, -1.870232, 3.988644, 0, 0, 1, 1, 1,
0.3511533, -0.2247548, 2.326415, 1, 0, 0, 1, 1,
0.352245, -0.9574304, 3.14137, 1, 0, 0, 1, 1,
0.3551062, -1.20524, 1.94919, 1, 0, 0, 1, 1,
0.355417, -1.047183, 1.282183, 1, 0, 0, 1, 1,
0.3578461, -2.144958, 2.697785, 1, 0, 0, 1, 1,
0.3632077, 0.1914508, 0.2090897, 0, 0, 0, 1, 1,
0.3633156, 0.2817669, 1.31142, 0, 0, 0, 1, 1,
0.3668539, 0.2418324, 0.9229425, 0, 0, 0, 1, 1,
0.3714521, -1.073937, 3.50627, 0, 0, 0, 1, 1,
0.3747357, -0.03698695, 2.102161, 0, 0, 0, 1, 1,
0.3753052, -2.162821, 2.357436, 0, 0, 0, 1, 1,
0.3821041, 0.5130641, -1.342772, 0, 0, 0, 1, 1,
0.384577, 1.116129, 0.497355, 1, 1, 1, 1, 1,
0.3846516, -0.6378482, 2.235204, 1, 1, 1, 1, 1,
0.384936, 0.464306, 0.8227324, 1, 1, 1, 1, 1,
0.3895226, 0.7734133, 0.3259409, 1, 1, 1, 1, 1,
0.3903672, -0.4210731, 1.739732, 1, 1, 1, 1, 1,
0.3946344, -1.013001, 4.411077, 1, 1, 1, 1, 1,
0.3949738, 1.920416, 1.633639, 1, 1, 1, 1, 1,
0.395696, -0.5980687, 1.992845, 1, 1, 1, 1, 1,
0.3959606, 1.288813, -0.5959482, 1, 1, 1, 1, 1,
0.3967844, -0.8798625, 3.666785, 1, 1, 1, 1, 1,
0.3970918, -1.66737, 3.447855, 1, 1, 1, 1, 1,
0.4007913, 2.022832, 0.2034656, 1, 1, 1, 1, 1,
0.4008223, 1.707277, 0.5823126, 1, 1, 1, 1, 1,
0.4045066, 1.28957, -0.08926927, 1, 1, 1, 1, 1,
0.4046175, -0.4787123, 4.703297, 1, 1, 1, 1, 1,
0.4047655, 0.4870113, 0.3199359, 0, 0, 1, 1, 1,
0.4089153, -0.5725943, 2.421132, 1, 0, 0, 1, 1,
0.4169868, -0.2039043, 1.576313, 1, 0, 0, 1, 1,
0.4172619, 0.4166597, -0.2085855, 1, 0, 0, 1, 1,
0.4230748, -1.040306, 2.717487, 1, 0, 0, 1, 1,
0.4248359, 1.225111, 0.1173717, 1, 0, 0, 1, 1,
0.424978, 0.2294483, 0.7760599, 0, 0, 0, 1, 1,
0.4272175, 0.8964058, -0.4094708, 0, 0, 0, 1, 1,
0.4290254, 0.6780196, 0.7765774, 0, 0, 0, 1, 1,
0.4307612, 0.5081336, 0.907936, 0, 0, 0, 1, 1,
0.432306, -1.132021, 3.095965, 0, 0, 0, 1, 1,
0.4361343, -0.3190606, 2.902892, 0, 0, 0, 1, 1,
0.4366966, -1.188172, 0.190131, 0, 0, 0, 1, 1,
0.438153, -0.01672616, 3.023405, 1, 1, 1, 1, 1,
0.4397157, 0.03684005, 0.9654256, 1, 1, 1, 1, 1,
0.4431898, -0.8675656, 3.628286, 1, 1, 1, 1, 1,
0.4454767, -1.653254, 1.05179, 1, 1, 1, 1, 1,
0.4492248, 1.317646, -0.4719794, 1, 1, 1, 1, 1,
0.4503379, 0.7970212, 0.4478663, 1, 1, 1, 1, 1,
0.4534546, 0.7425672, 0.1879219, 1, 1, 1, 1, 1,
0.4536177, -0.7078744, 2.84884, 1, 1, 1, 1, 1,
0.4544847, -0.395687, -0.1999826, 1, 1, 1, 1, 1,
0.4552279, -1.784373, 2.922296, 1, 1, 1, 1, 1,
0.4595936, 1.446992, -0.5978041, 1, 1, 1, 1, 1,
0.4676405, -0.57772, 1.606379, 1, 1, 1, 1, 1,
0.470433, -0.5699757, 2.732419, 1, 1, 1, 1, 1,
0.4714048, 1.167441, -0.5639017, 1, 1, 1, 1, 1,
0.4740639, -1.999523, 3.261555, 1, 1, 1, 1, 1,
0.4792493, 0.5989571, 1.336736, 0, 0, 1, 1, 1,
0.4808101, 0.977226, 0.678646, 1, 0, 0, 1, 1,
0.483785, -0.7350972, 4.410485, 1, 0, 0, 1, 1,
0.4845704, 0.9070651, 1.216038, 1, 0, 0, 1, 1,
0.486535, -2.152551, 0.3213611, 1, 0, 0, 1, 1,
0.4886244, -0.8590975, 3.923806, 1, 0, 0, 1, 1,
0.4906639, -1.003529, 1.822169, 0, 0, 0, 1, 1,
0.4907832, 1.320172, 0.2198653, 0, 0, 0, 1, 1,
0.5009502, -0.02132445, 0.9778959, 0, 0, 0, 1, 1,
0.5030677, -0.3340663, 1.957737, 0, 0, 0, 1, 1,
0.5045429, 1.697688, -0.3500943, 0, 0, 0, 1, 1,
0.5091376, -0.133512, 2.195005, 0, 0, 0, 1, 1,
0.5115126, -2.013251, 3.777454, 0, 0, 0, 1, 1,
0.5149915, 1.533623, 0.3717874, 1, 1, 1, 1, 1,
0.5150443, -0.969828, 0.6226193, 1, 1, 1, 1, 1,
0.5238157, 1.026286, 0.4344823, 1, 1, 1, 1, 1,
0.5255953, -0.9290278, 3.229644, 1, 1, 1, 1, 1,
0.5278649, 0.1543206, 1.493928, 1, 1, 1, 1, 1,
0.5299565, 0.2849309, 1.446666, 1, 1, 1, 1, 1,
0.5328546, 1.526495, 2.474427, 1, 1, 1, 1, 1,
0.5329465, 0.03198004, 1.897657, 1, 1, 1, 1, 1,
0.5340831, 0.2110348, 0.9026536, 1, 1, 1, 1, 1,
0.5365615, 0.4815169, 0.5713432, 1, 1, 1, 1, 1,
0.5412621, -0.08436188, 1.903286, 1, 1, 1, 1, 1,
0.5420988, 0.4964598, 0.5312617, 1, 1, 1, 1, 1,
0.5488659, -0.7327485, 2.764315, 1, 1, 1, 1, 1,
0.5509471, 1.684814, -0.2471953, 1, 1, 1, 1, 1,
0.5530671, 0.06936984, 0.6039147, 1, 1, 1, 1, 1,
0.5532084, -0.1989559, 3.411781, 0, 0, 1, 1, 1,
0.5541087, -1.284512, 1.826359, 1, 0, 0, 1, 1,
0.5564154, -0.767446, 2.538194, 1, 0, 0, 1, 1,
0.5585701, -0.4894877, 0.7611957, 1, 0, 0, 1, 1,
0.565982, 1.65678, 0.40245, 1, 0, 0, 1, 1,
0.5710404, 0.4266796, 0.486836, 1, 0, 0, 1, 1,
0.5767621, -0.681443, 2.184968, 0, 0, 0, 1, 1,
0.5768375, -1.326926, 3.200199, 0, 0, 0, 1, 1,
0.5820709, -1.400898, 4.404647, 0, 0, 0, 1, 1,
0.5894725, 1.154298, 1.74647, 0, 0, 0, 1, 1,
0.5906038, -1.115284, 2.884569, 0, 0, 0, 1, 1,
0.5915631, 1.266948, 1.655302, 0, 0, 0, 1, 1,
0.5916363, 0.3943134, 0.4159046, 0, 0, 0, 1, 1,
0.5922516, 0.149581, -0.3704084, 1, 1, 1, 1, 1,
0.5969261, -0.4747904, 1.689158, 1, 1, 1, 1, 1,
0.5986561, -0.793734, 2.766042, 1, 1, 1, 1, 1,
0.598787, 0.1088991, 1.408226, 1, 1, 1, 1, 1,
0.5993728, 1.138543, -0.5376961, 1, 1, 1, 1, 1,
0.5999823, 0.556116, -1.962034, 1, 1, 1, 1, 1,
0.6049543, 0.7343832, 2.48098, 1, 1, 1, 1, 1,
0.6099552, 0.3925124, 2.132038, 1, 1, 1, 1, 1,
0.6136963, 0.3061413, 1.761741, 1, 1, 1, 1, 1,
0.6140678, -0.6148043, 3.676603, 1, 1, 1, 1, 1,
0.6141609, 0.9116512, 0.8378515, 1, 1, 1, 1, 1,
0.6155372, -0.563236, 2.429187, 1, 1, 1, 1, 1,
0.6185431, 1.180499, 0.4960169, 1, 1, 1, 1, 1,
0.6205952, -1.647975, 4.054545, 1, 1, 1, 1, 1,
0.6215453, -0.8394498, 1.17122, 1, 1, 1, 1, 1,
0.6239427, 0.1911529, 1.416418, 0, 0, 1, 1, 1,
0.6384466, 1.110435, -0.4877104, 1, 0, 0, 1, 1,
0.6388314, -1.001088, 3.205105, 1, 0, 0, 1, 1,
0.6397956, -0.1332522, 1.852349, 1, 0, 0, 1, 1,
0.6407581, -0.5703174, 3.156064, 1, 0, 0, 1, 1,
0.6415307, 1.440356, 0.36693, 1, 0, 0, 1, 1,
0.6426076, -0.7449579, 0.8056561, 0, 0, 0, 1, 1,
0.6452463, -0.110732, 1.783456, 0, 0, 0, 1, 1,
0.6458313, -0.5943277, 1.982487, 0, 0, 0, 1, 1,
0.6470148, -1.716393, 3.593544, 0, 0, 0, 1, 1,
0.6486667, 0.3683264, -2.069817, 0, 0, 0, 1, 1,
0.6487409, -0.1334521, 1.036285, 0, 0, 0, 1, 1,
0.6560283, 0.1834951, 2.036581, 0, 0, 0, 1, 1,
0.658918, -1.24324, 2.922285, 1, 1, 1, 1, 1,
0.6602285, -0.5375463, 0.8384693, 1, 1, 1, 1, 1,
0.6627959, -0.09895179, 1.670697, 1, 1, 1, 1, 1,
0.6635619, 0.6078088, 1.212003, 1, 1, 1, 1, 1,
0.6638581, -0.7870632, 1.589341, 1, 1, 1, 1, 1,
0.6647416, -0.5068842, 2.593225, 1, 1, 1, 1, 1,
0.6702217, -0.1792714, 2.176744, 1, 1, 1, 1, 1,
0.6737922, -1.414235, 2.201403, 1, 1, 1, 1, 1,
0.6878305, -0.009745092, 0.697006, 1, 1, 1, 1, 1,
0.6888429, 1.367119, -0.7140579, 1, 1, 1, 1, 1,
0.6906982, -1.901724, 3.431348, 1, 1, 1, 1, 1,
0.6910311, -0.005409049, 1.591901, 1, 1, 1, 1, 1,
0.6925435, 0.3264191, -0.6903934, 1, 1, 1, 1, 1,
0.6926235, 1.09536, -0.4335243, 1, 1, 1, 1, 1,
0.6933578, 0.6545151, 0.1311244, 1, 1, 1, 1, 1,
0.6958621, 2.041823, 0.5757001, 0, 0, 1, 1, 1,
0.704745, -0.4387835, 2.177303, 1, 0, 0, 1, 1,
0.7089037, 0.4649362, -0.02361131, 1, 0, 0, 1, 1,
0.7142122, 0.3035877, 1.367119, 1, 0, 0, 1, 1,
0.7143139, -0.4385441, 0.4094551, 1, 0, 0, 1, 1,
0.717801, -0.2687184, 1.572441, 1, 0, 0, 1, 1,
0.7181952, -1.142827, 3.174313, 0, 0, 0, 1, 1,
0.7194443, 0.5714937, 0.2661825, 0, 0, 0, 1, 1,
0.7279779, 0.2718921, 0.7981741, 0, 0, 0, 1, 1,
0.7293322, -1.001035, 2.20248, 0, 0, 0, 1, 1,
0.7300779, 0.009250445, -0.4100574, 0, 0, 0, 1, 1,
0.7309651, 0.4373037, 1.855962, 0, 0, 0, 1, 1,
0.7316851, -0.5421975, 1.204766, 0, 0, 0, 1, 1,
0.737949, 0.4386239, 0.3907091, 1, 1, 1, 1, 1,
0.7381929, 1.396092, -0.01386619, 1, 1, 1, 1, 1,
0.7410986, -0.8197083, 2.830478, 1, 1, 1, 1, 1,
0.7444353, -0.8345063, 2.443389, 1, 1, 1, 1, 1,
0.7495583, -0.8410309, 2.900916, 1, 1, 1, 1, 1,
0.7537934, 2.34036, 0.7785619, 1, 1, 1, 1, 1,
0.7553639, -0.2687747, 2.063334, 1, 1, 1, 1, 1,
0.7558779, -0.389923, 2.545128, 1, 1, 1, 1, 1,
0.765872, -0.7427375, 2.507916, 1, 1, 1, 1, 1,
0.7659126, -1.297578, 2.929955, 1, 1, 1, 1, 1,
0.7733029, -1.082246, 3.384851, 1, 1, 1, 1, 1,
0.775589, -1.748866, 3.007357, 1, 1, 1, 1, 1,
0.777539, -0.300802, 1.207256, 1, 1, 1, 1, 1,
0.7829677, -0.6781251, 1.361496, 1, 1, 1, 1, 1,
0.7908187, 1.589718, -0.3528444, 1, 1, 1, 1, 1,
0.7968489, 0.4812422, 0.2304926, 0, 0, 1, 1, 1,
0.7968625, -1.371907, 2.789864, 1, 0, 0, 1, 1,
0.7984325, -1.63946, 1.899251, 1, 0, 0, 1, 1,
0.8024874, -0.4717712, 4.444032, 1, 0, 0, 1, 1,
0.8089424, 0.2705664, 0.06412513, 1, 0, 0, 1, 1,
0.8129378, -0.8525297, 2.042811, 1, 0, 0, 1, 1,
0.8145767, -0.0513887, 3.183902, 0, 0, 0, 1, 1,
0.8164502, -0.2930252, 1.88312, 0, 0, 0, 1, 1,
0.8174676, -0.1880974, 4.045992, 0, 0, 0, 1, 1,
0.8191286, 0.8029819, 2.612551, 0, 0, 0, 1, 1,
0.8313906, 0.05290684, 2.321309, 0, 0, 0, 1, 1,
0.838593, -0.4700219, 1.629552, 0, 0, 0, 1, 1,
0.841798, 1.542975, 1.346668, 0, 0, 0, 1, 1,
0.8480279, -2.084174, 3.27311, 1, 1, 1, 1, 1,
0.8516326, -0.2111995, 1.495294, 1, 1, 1, 1, 1,
0.8665782, 0.6544409, 1.956028, 1, 1, 1, 1, 1,
0.8677031, 0.2163252, -0.4990493, 1, 1, 1, 1, 1,
0.8679222, -0.704909, 4.11108, 1, 1, 1, 1, 1,
0.8767069, -0.3983332, 2.908418, 1, 1, 1, 1, 1,
0.8851406, -0.01118971, 1.028797, 1, 1, 1, 1, 1,
0.890251, 0.6887531, 0.1902819, 1, 1, 1, 1, 1,
0.8917086, -0.5428077, 0.4119856, 1, 1, 1, 1, 1,
0.8939635, 0.6644243, 1.304933, 1, 1, 1, 1, 1,
0.8952232, -0.5989112, 3.374125, 1, 1, 1, 1, 1,
0.8986372, -1.99505, 4.215549, 1, 1, 1, 1, 1,
0.8991485, 0.930715, 0.7095397, 1, 1, 1, 1, 1,
0.9034274, 0.9753904, 1.350214, 1, 1, 1, 1, 1,
0.906458, -0.6795129, 2.334852, 1, 1, 1, 1, 1,
0.9094453, 1.762014, -0.6389265, 0, 0, 1, 1, 1,
0.9100382, 0.6571053, 0.5444564, 1, 0, 0, 1, 1,
0.9112291, -1.107051, 2.033633, 1, 0, 0, 1, 1,
0.9121652, 0.07845052, -0.3075148, 1, 0, 0, 1, 1,
0.9138877, 1.787407, 2.254504, 1, 0, 0, 1, 1,
0.9174135, -1.431918, 2.858528, 1, 0, 0, 1, 1,
0.9219297, 0.1673211, -0.7846899, 0, 0, 0, 1, 1,
0.9231905, 0.6791228, -0.4092784, 0, 0, 0, 1, 1,
0.924981, -0.9597818, 3.714362, 0, 0, 0, 1, 1,
0.9430419, 0.05746204, 2.686378, 0, 0, 0, 1, 1,
0.9464743, -0.5432341, 1.233565, 0, 0, 0, 1, 1,
0.9477001, -1.741839, 1.755141, 0, 0, 0, 1, 1,
0.9499616, 0.8454822, -0.1218019, 0, 0, 0, 1, 1,
0.9527019, 0.9534169, 1.996984, 1, 1, 1, 1, 1,
0.9677231, 1.480267, 0.04382449, 1, 1, 1, 1, 1,
0.9690308, 1.191617, 0.7940217, 1, 1, 1, 1, 1,
0.9705967, -0.5773294, 0.6329186, 1, 1, 1, 1, 1,
0.9784524, 0.4010307, 3.39809, 1, 1, 1, 1, 1,
0.9868882, -1.466708, 2.755088, 1, 1, 1, 1, 1,
0.9943058, 2.043411, -0.1000458, 1, 1, 1, 1, 1,
1.001938, -0.3687399, 1.948617, 1, 1, 1, 1, 1,
1.003091, 0.4222883, 0.7317991, 1, 1, 1, 1, 1,
1.003568, -0.873701, 2.564252, 1, 1, 1, 1, 1,
1.007746, -1.746029, 3.273637, 1, 1, 1, 1, 1,
1.00783, 2.063841, 0.667392, 1, 1, 1, 1, 1,
1.018464, 0.6593328, -0.0901467, 1, 1, 1, 1, 1,
1.0193, -0.8289412, 2.574297, 1, 1, 1, 1, 1,
1.022995, -0.9505976, 2.830347, 1, 1, 1, 1, 1,
1.02401, 0.1289867, 0.01276949, 0, 0, 1, 1, 1,
1.025692, 0.09931003, 0.7784987, 1, 0, 0, 1, 1,
1.027749, 1.612743, 1.047097, 1, 0, 0, 1, 1,
1.032736, 0.07186612, 1.608069, 1, 0, 0, 1, 1,
1.041844, 0.0955267, 0.630986, 1, 0, 0, 1, 1,
1.047433, -1.231738, 0.9044833, 1, 0, 0, 1, 1,
1.049811, -1.06782, 1.584047, 0, 0, 0, 1, 1,
1.05103, -0.6370921, 2.452013, 0, 0, 0, 1, 1,
1.052948, 0.3703984, 1.005232, 0, 0, 0, 1, 1,
1.057464, -0.5222854, 2.669172, 0, 0, 0, 1, 1,
1.058022, -1.591754, 0.1044502, 0, 0, 0, 1, 1,
1.058037, -0.6939085, 0.7264705, 0, 0, 0, 1, 1,
1.059298, 0.5752078, 1.443575, 0, 0, 0, 1, 1,
1.059992, -0.1316523, 1.466437, 1, 1, 1, 1, 1,
1.0702, 0.8297818, 1.613494, 1, 1, 1, 1, 1,
1.07115, 0.4595632, 0.2562088, 1, 1, 1, 1, 1,
1.083664, 1.709754, 0.225936, 1, 1, 1, 1, 1,
1.084096, 1.981619, 1.010571, 1, 1, 1, 1, 1,
1.086527, 0.9905794, 1.854266, 1, 1, 1, 1, 1,
1.098483, 1.60639, 1.532693, 1, 1, 1, 1, 1,
1.099597, 0.8738689, 0.4808911, 1, 1, 1, 1, 1,
1.103838, -0.6022569, 3.374542, 1, 1, 1, 1, 1,
1.104031, 0.8696332, 0.1623581, 1, 1, 1, 1, 1,
1.107389, -0.362126, 1.849603, 1, 1, 1, 1, 1,
1.116117, 0.3708811, 0.9925383, 1, 1, 1, 1, 1,
1.117802, -0.1038574, 1.07788, 1, 1, 1, 1, 1,
1.123582, -0.9410599, 2.595917, 1, 1, 1, 1, 1,
1.12618, -0.4926463, 2.450017, 1, 1, 1, 1, 1,
1.129553, -0.2671452, 1.013241, 0, 0, 1, 1, 1,
1.130159, -0.4336691, 1.164254, 1, 0, 0, 1, 1,
1.131217, 1.358648, -0.4508655, 1, 0, 0, 1, 1,
1.135349, -1.467133, 3.657093, 1, 0, 0, 1, 1,
1.146376, -0.01904441, 1.540952, 1, 0, 0, 1, 1,
1.155318, -1.166444, 0.7171463, 1, 0, 0, 1, 1,
1.165587, 1.142869, 1.851832, 0, 0, 0, 1, 1,
1.171023, 1.199443, 1.650342, 0, 0, 0, 1, 1,
1.176777, 0.1885864, -0.710018, 0, 0, 0, 1, 1,
1.177852, -0.5441298, 2.583423, 0, 0, 0, 1, 1,
1.179148, -0.3299755, 2.429388, 0, 0, 0, 1, 1,
1.187097, 0.7151038, 2.601519, 0, 0, 0, 1, 1,
1.188279, -0.2466933, 2.802251, 0, 0, 0, 1, 1,
1.204536, -0.7231888, 2.898201, 1, 1, 1, 1, 1,
1.20695, -1.127092, 1.553084, 1, 1, 1, 1, 1,
1.211076, 2.181875, 1.995501, 1, 1, 1, 1, 1,
1.212547, 0.7732119, 2.342201, 1, 1, 1, 1, 1,
1.214419, 0.7567804, 2.638815, 1, 1, 1, 1, 1,
1.217171, -0.2816409, 2.527053, 1, 1, 1, 1, 1,
1.219647, -0.2218099, 1.005036, 1, 1, 1, 1, 1,
1.224888, 0.3443214, 1.476684, 1, 1, 1, 1, 1,
1.230034, 0.8915447, -0.6481497, 1, 1, 1, 1, 1,
1.235244, 0.3359391, 2.091418, 1, 1, 1, 1, 1,
1.235547, -0.2984091, 1.31462, 1, 1, 1, 1, 1,
1.248976, 0.1957946, 0.871655, 1, 1, 1, 1, 1,
1.253342, -0.1272674, 3.448982, 1, 1, 1, 1, 1,
1.256742, 0.9276631, 0.9322248, 1, 1, 1, 1, 1,
1.26867, 0.4053604, -0.2065458, 1, 1, 1, 1, 1,
1.268963, -0.8986301, 2.343389, 0, 0, 1, 1, 1,
1.270279, 0.2250095, 1.47889, 1, 0, 0, 1, 1,
1.271786, 0.1815159, 0.08391965, 1, 0, 0, 1, 1,
1.274969, -1.001807, 2.075654, 1, 0, 0, 1, 1,
1.275563, 0.53035, 1.968582, 1, 0, 0, 1, 1,
1.275771, 1.773653, 0.7412521, 1, 0, 0, 1, 1,
1.285709, -0.06758337, 1.185764, 0, 0, 0, 1, 1,
1.292044, 1.105534, 2.55869, 0, 0, 0, 1, 1,
1.29863, 0.3241835, 1.757273, 0, 0, 0, 1, 1,
1.301924, 0.1481191, 2.200782, 0, 0, 0, 1, 1,
1.3053, 0.7840816, 0.4739128, 0, 0, 0, 1, 1,
1.309354, -0.4677589, 0.274475, 0, 0, 0, 1, 1,
1.317721, -0.3295372, 1.895017, 0, 0, 0, 1, 1,
1.319827, 1.281983, 1.694649, 1, 1, 1, 1, 1,
1.32218, -0.005453757, 1.189317, 1, 1, 1, 1, 1,
1.334469, -0.8810418, 2.733877, 1, 1, 1, 1, 1,
1.346208, 0.9937148, 1.371314, 1, 1, 1, 1, 1,
1.346852, 1.1504, -0.50989, 1, 1, 1, 1, 1,
1.353556, -0.02274115, 0.8467356, 1, 1, 1, 1, 1,
1.355443, -0.5766843, 2.552885, 1, 1, 1, 1, 1,
1.35588, -1.059406, 1.308399, 1, 1, 1, 1, 1,
1.357638, 0.9060879, 0.2929427, 1, 1, 1, 1, 1,
1.36294, -0.7284382, 2.666862, 1, 1, 1, 1, 1,
1.373911, 0.1137226, 1.183966, 1, 1, 1, 1, 1,
1.377772, 0.2889617, 0.5565038, 1, 1, 1, 1, 1,
1.390839, -0.6181161, 2.863615, 1, 1, 1, 1, 1,
1.392733, 0.527146, 1.742006, 1, 1, 1, 1, 1,
1.407542, 0.001381129, 2.610587, 1, 1, 1, 1, 1,
1.414588, -0.9597058, 1.218039, 0, 0, 1, 1, 1,
1.423635, 1.789575, 1.789217, 1, 0, 0, 1, 1,
1.434404, -1.173056, 3.202018, 1, 0, 0, 1, 1,
1.44365, 1.921675, 0.6940302, 1, 0, 0, 1, 1,
1.451078, 0.9619489, 0.8403572, 1, 0, 0, 1, 1,
1.452894, 0.8725416, 1.937101, 1, 0, 0, 1, 1,
1.454722, 0.214574, 2.82615, 0, 0, 0, 1, 1,
1.45824, 0.2016506, 0.5463474, 0, 0, 0, 1, 1,
1.469203, 0.4161967, 1.067461, 0, 0, 0, 1, 1,
1.472567, 0.2803349, 1.734536, 0, 0, 0, 1, 1,
1.48641, 1.070144, 0.06055756, 0, 0, 0, 1, 1,
1.505302, -0.7670529, 1.445463, 0, 0, 0, 1, 1,
1.51707, -0.5948913, 1.952558, 0, 0, 0, 1, 1,
1.521912, 0.0287663, 0.8047186, 1, 1, 1, 1, 1,
1.522146, 0.5029819, 0.3593535, 1, 1, 1, 1, 1,
1.533845, -1.364515, 2.5198, 1, 1, 1, 1, 1,
1.536387, -0.7471156, 0.9375284, 1, 1, 1, 1, 1,
1.543288, 0.2548954, 2.403183, 1, 1, 1, 1, 1,
1.56208, 0.1783923, 0.922951, 1, 1, 1, 1, 1,
1.56226, 0.1799322, 2.638127, 1, 1, 1, 1, 1,
1.568026, -0.1794249, 1.900664, 1, 1, 1, 1, 1,
1.603151, -0.470207, 1.650663, 1, 1, 1, 1, 1,
1.605916, 0.5333197, 2.713169, 1, 1, 1, 1, 1,
1.606023, 0.4261122, 2.278817, 1, 1, 1, 1, 1,
1.610328, 0.9369698, -0.1331302, 1, 1, 1, 1, 1,
1.618666, -1.070587, 2.961707, 1, 1, 1, 1, 1,
1.619903, -1.104696, 4.685175, 1, 1, 1, 1, 1,
1.620603, 0.8221886, 1.248117, 1, 1, 1, 1, 1,
1.627555, -1.442904, 3.090047, 0, 0, 1, 1, 1,
1.647148, -1.103066, 2.259239, 1, 0, 0, 1, 1,
1.666602, 0.21793, 0.9635558, 1, 0, 0, 1, 1,
1.673204, -1.370889, 2.066548, 1, 0, 0, 1, 1,
1.676617, -0.3737227, 3.433432, 1, 0, 0, 1, 1,
1.681945, 0.02847948, 1.779886, 1, 0, 0, 1, 1,
1.698073, -1.490766, 1.729005, 0, 0, 0, 1, 1,
1.721576, -0.05826535, 3.932635, 0, 0, 0, 1, 1,
1.728793, -0.005384658, 0.8890892, 0, 0, 0, 1, 1,
1.73052, 0.8373355, 0.4157997, 0, 0, 0, 1, 1,
1.739365, 0.6228609, 0.5669889, 0, 0, 0, 1, 1,
1.740765, -1.369755, 2.885424, 0, 0, 0, 1, 1,
1.756518, 1.034859, 2.456025, 0, 0, 0, 1, 1,
1.757788, 0.4245018, 1.878138, 1, 1, 1, 1, 1,
1.76355, 2.327334, -0.3155636, 1, 1, 1, 1, 1,
1.767821, 0.2742713, 0.5087736, 1, 1, 1, 1, 1,
1.774324, -0.1074031, 1.941285, 1, 1, 1, 1, 1,
1.785721, -0.1255508, 3.107059, 1, 1, 1, 1, 1,
1.78821, 0.768589, 1.315737, 1, 1, 1, 1, 1,
1.83643, 0.410831, 0.7826756, 1, 1, 1, 1, 1,
1.880074, 0.1282878, 1.889669, 1, 1, 1, 1, 1,
1.890923, 0.5432169, 2.254176, 1, 1, 1, 1, 1,
1.917217, 0.4388363, 1.874571, 1, 1, 1, 1, 1,
1.940245, 0.5873986, 2.051819, 1, 1, 1, 1, 1,
1.944401, -0.3729382, 3.06466, 1, 1, 1, 1, 1,
1.987681, -1.794042, 2.717253, 1, 1, 1, 1, 1,
2.000193, -0.9473997, 2.990963, 1, 1, 1, 1, 1,
2.040426, 0.6540399, 1.823394, 1, 1, 1, 1, 1,
2.06668, 1.292846, -0.04302485, 0, 0, 1, 1, 1,
2.074118, -0.6281856, 0.9892831, 1, 0, 0, 1, 1,
2.075833, 1.405819, 0.6674672, 1, 0, 0, 1, 1,
2.081142, -1.727046, 2.24153, 1, 0, 0, 1, 1,
2.102408, 0.2548301, 0.6027029, 1, 0, 0, 1, 1,
2.123699, 0.4124722, 1.904668, 1, 0, 0, 1, 1,
2.129845, 0.2382063, -1.150112, 0, 0, 0, 1, 1,
2.162369, 0.8009723, 1.879266, 0, 0, 0, 1, 1,
2.192603, 1.05055, 0.2201645, 0, 0, 0, 1, 1,
2.198933, 0.01783307, 1.531062, 0, 0, 0, 1, 1,
2.229157, 1.044507, 0.7829629, 0, 0, 0, 1, 1,
2.235873, -0.534933, 1.387559, 0, 0, 0, 1, 1,
2.253627, 1.465237, 1.584359, 0, 0, 0, 1, 1,
2.365843, 0.3833957, 0.7416012, 1, 1, 1, 1, 1,
2.526215, 0.4436763, 0.6421216, 1, 1, 1, 1, 1,
2.664151, 1.321678, 2.844073, 1, 1, 1, 1, 1,
2.709299, -1.804455, 3.916997, 1, 1, 1, 1, 1,
2.74503, 1.393812, -0.1509272, 1, 1, 1, 1, 1,
2.863832, 0.1923622, 0.9256672, 1, 1, 1, 1, 1,
2.999359, 0.2297612, 0.353742, 1, 1, 1, 1, 1
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
var radius = 9.697404;
var distance = 34.06172;
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
mvMatrix.translate( 0.03970814, 0.1719747, -0.4650252 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.06172);
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
